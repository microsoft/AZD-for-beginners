<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-19T12:47:31+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "tw"
}
-->
# 使用 AZD 部署容器應用程式範例

此目錄包含使用 Azure Developer CLI (AZD) 將容器化應用程式部署到 Azure Container Apps 的完整範例。這些範例展示了真實世界的模式、最佳實踐以及適合生產環境的配置。

## 📚 目錄

- [概述](../../../../examples/container-app)
- [先決條件](../../../../examples/container-app)
- [快速入門範例](../../../../examples/container-app)
- [生產環境範例](../../../../examples/container-app)
- [進階模式](../../../../examples/container-app)
- [最佳實踐](../../../../examples/container-app)

## 概述

Azure Container Apps 是一個完全受管理的無伺服器容器平台，讓您可以運行微服務和容器化應用程式，而無需管理基礎架構。結合 AZD，您可以獲得以下優勢：

- **簡化部署**：單一指令即可部署容器及基礎架構
- **自動調整規模**：根據 HTTP 流量或事件自動縮放，甚至縮減至零
- **整合網路功能**：內建服務發現與流量分流
- **受管理的身份驗證**：安全地驗證 Azure 資源
- **成本優化**：僅需支付實際使用的資源費用

## 先決條件

在開始之前，請確保您已具備：

```bash
# Check AZD installation
azd version

# Check Azure CLI
az version

# Check Docker (for building custom images)
docker --version

# Login to Azure
azd auth login
az login
```

**所需的 Azure 資源：**
- 有效的 Azure 訂閱
- 建立資源群組的權限
- Container Apps 環境的存取權限

## 快速入門範例

### 1. 簡單的 Web API (Python Flask)

部署一個基本的 REST API 到 Azure Container Apps。

**範例：Python Flask API**

```yaml
# azure.yaml
name: flask-api-demo
metadata:
  template: flask-api-demo@0.0.1-beta
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
```

**部署步驟：**

```bash
# Initialize from template
azd init --template todo-python-mongo

# Provision infrastructure and deploy
azd up

# Test the deployment
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**主要功能：**
- 自動縮放，從 0 到 10 個副本
- 健康檢查與存活檢查
- 環境變數注入
- 整合 Application Insights

### 2. Node.js Express API

部署一個整合 MongoDB 的 Node.js 後端。

```bash
# Initialize Node.js API template
azd init --template todo-nodejs-mongo

# Configure environment variables
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Deploy
azd up

# View logs
azd logs api
```

**基礎架構亮點：**
```bicep
// Bicep snippet from infra/main.bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-${resourceToken}'
  location: location
  properties: {
    managedEnvironmentId: containerEnv.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
        transport: 'auto'
      }
      secrets: [
        {
          name: 'mongodb-connection'
          value: mongoConnection
        }
      ]
    }
    template: {
      containers: [
        {
          name: 'api'
          image: containerImage
          env: [
            {
              name: 'DATABASE_URL'
              secretRef: 'mongodb-connection'
            }
          ]
        }
      ]
      scale: {
        minReplicas: 0
        maxReplicas: 10
      }
    }
  }
}
```

### 3. 靜態前端 + API 後端

部署一個包含 React 前端和 API 後端的全端應用程式。

```bash
# Initialize full-stack template
azd init --template todo-csharp-sql-swa-func

# Review configuration
cat azure.yaml

# Deploy both services
azd up

# Open the application
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## 生產環境範例

### 範例 1：微服務架構

**情境**：具有多個微服務的電子商務應用程式

**目錄結構：**
```
microservices-demo/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── container-env.bicep
│   │   ├── product-service.bicep
│   │   ├── order-service.bicep
│   │   └── payment-service.bicep
│   └── core/
│       ├── storage.bicep
│       └── database.bicep
└── src/
    ├── product-service/
    ├── order-service/
    └── payment-service/
```

**azure.yaml 配置：**
```yaml
name: microservices-ecommerce
services:
  product-service:
    project: ./src/product-service
    language: python
    host: containerapp
    
  order-service:
    project: ./src/order-service
    language: csharp
    host: containerapp
    
  payment-service:
    project: ./src/payment-service
    language: nodejs
    host: containerapp
```

**部署：**
```bash
# Initialize project
azd init

# Set production environment
azd env new production

# Configure production settings
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Deploy all services
azd up

# Monitor deployment
azd monitor --overview
```

### 範例 2：AI 驅動的容器應用程式

**情境**：整合 Azure OpenAI 的 AI 聊天應用程式

**檔案：src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Use Managed Identity for secure access
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Get OpenAI key from Key Vault
    openai_key = client.get_secret("openai-api-key").value
    openai.api_key = openai_key
    
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_message}]
    )
    
    return jsonify({"response": response.choices[0].message.content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**檔案：azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**檔案：infra/main.bicep**
```bicep
param location string = resourceGroup().location
param environmentName string

var resourceToken = uniqueString(subscription().id, environmentName, location)

// Container Apps Environment
module containerEnv './app/container-env.bicep' = {
  name: 'container-env-${resourceToken}'
  params: {
    location: location
    environmentName: environmentName
  }
}

// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'kv-${resourceToken}'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
  }
}

// Container App with Managed Identity
module aiChatApp './app/container-app.bicep' = {
  name: 'ai-chat-app-${resourceToken}'
  params: {
    location: location
    environmentId: containerEnv.outputs.environmentId
    containerImage: 'your-registry.azurecr.io/ai-chat:latest'
    keyVaultName: keyVault.name
  }
}
```

**部署指令：**
```bash
# Set up environment
azd init --template ai-chat-app
azd env new dev

# Configure OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Deploy
azd up

# Test the API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### 範例 3：具有佇列處理的背景工作者

**情境**：具有訊息佇列的訂單處理系統

**目錄結構：**
```
queue-worker/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── api.bicep
│   │   └── worker.bicep
│   └── core/
│       ├── storage-queue.bicep
│       └── servicebus.bicep
└── src/
    ├── api/
    └── worker/
```

**檔案：src/worker/processor.py**
```python
import os
from azure.storage.queue import QueueClient
from azure.identity import DefaultAzureCredential

def process_orders():
    credential = DefaultAzureCredential()
    queue_url = os.getenv('AZURE_QUEUE_URL')
    
    queue_client = QueueClient.from_queue_url(
        queue_url=queue_url,
        credential=credential
    )
    
    while True:
        messages = queue_client.receive_messages(max_messages=10)
        for message in messages:
            # Process order
            print(f"Processing order: {message.content}")
            
            # Complete message
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**檔案：azure.yaml**
```yaml
name: order-processing
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    
  worker:
    project: ./src/worker
    language: python
    host: containerapp
```

**部署：**
```bash
# Initialize
azd init

# Deploy with queue configuration
azd up

# Scale worker based on queue length
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## 進階模式

### 模式 1：藍綠部署

```bash
# Create new revision without traffic
azd deploy api --revision-suffix blue --no-traffic

# Test the new revision
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Split traffic (20% to blue, 80% to current)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Full cutover to blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### 模式 2：使用 AZD 的金絲雀部署

**檔案：.azure/dev/config.json**
```json
{
  "deploymentStrategy": "canary",
  "canary": {
    "initialTrafficPercentage": 10,
    "incrementPercentage": 10,
    "intervalMinutes": 5
  }
}
```

**部署腳本：**
```bash
#!/bin/bash
# deploy-canary.sh

# Deploy new revision with 10% traffic
azd deploy api --revision-mode multiple

# Monitor metrics
azd monitor --service api --duration 5m

# Increase traffic gradually
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Wait 5 minutes
done
```

### 模式 3：多區域部署

**檔案：azure.yaml**
```yaml
name: global-app
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    regions:
      - eastus
      - westeurope
      - southeastasia
```

**檔案：infra/multi-region.bicep**
```bicep
param regions array = ['eastus', 'westeurope', 'southeastasia']

module containerApps './app/container-app.bicep' = [for region in regions: {
  name: 'app-${region}'
  params: {
    location: region
    environmentName: environmentName
  }
}]

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: 'tm-global-app'
  location: 'global'
  properties: {
    trafficRoutingMethod: 'Performance'
    endpoints: [for i in range(0, length(regions)): {
      name: 'endpoint-${regions[i]}'
      type: 'Microsoft.Network/trafficManagerProfiles/externalEndpoints'
      properties: {
        target: containerApps[i].outputs.fqdn
        endpointStatus: 'Enabled'
      }
    }]
  }
}
```

**部署：**
```bash
# Deploy to all regions
azd up

# Verify endpoints
azd show --output json | jq '.services.api.endpoints'
```

### 模式 4：Dapr 整合

**檔案：infra/app/dapr-enabled.bicep**
```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'dapr-app'
  properties: {
    configuration: {
      dapr: {
        enabled: true
        appId: 'order-service'
        appPort: 8000
        appProtocol: 'http'
      }
    }
    template: {
      containers: [
        {
          name: 'app'
          image: containerImage
        }
      ]
    }
  }
}
```

**包含 Dapr 的應用程式程式碼：**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Save state
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publish event
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## 最佳實踐

### 1. 資源組織

```bash
# Use consistent naming conventions
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Tag resources for cost tracking
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. 安全性最佳實踐

```bicep
// Always use managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
}

// Store secrets in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  properties: {
    enableRbacAuthorization: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}

// Use private endpoints
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  properties: {
    subnet: {
      id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: 'containerapp-connection'
        properties: {
          privateLinkServiceId: containerApp.id
        }
      }
    ]
  }
}
```

### 3. 效能優化

```yaml
# azure.yaml with performance settings
services:
  api:
    project: ./src/api
    host: containerapp
    resources:
      cpu: 1.0
      memory: 2Gi
    scale:
      minReplicas: 2
      maxReplicas: 20
      rules:
        - name: http-rule
          http:
            concurrent: 100
```

### 4. 監控與可觀察性

```bash
# Enable Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# View logs in real-time
azd logs api --follow

# Monitor metrics
azd monitor --service api

# Create alerts
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. 成本優化

```bash
# Scale to zero when not in use
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Use spot instances for dev environments
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Set up budget alerts
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD 整合

**GitHub Actions 範例：**
```yaml
name: Deploy to Azure Container Apps

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1
      
      - name: Login to Azure
        run: |
          azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
        env:
          AZURE_ENV_NAME: ${{ secrets.AZURE_ENV_NAME }}
          AZURE_LOCATION: ${{ secrets.AZURE_LOCATION }}
```

## 常用指令參考

```bash
# Initialize new container app project
azd init --template <template-name>

# Deploy infrastructure and application
azd up

# Deploy only application code (skip infrastructure)
azd deploy

# Provision only infrastructure
azd provision

# View deployed resources
azd show

# Stream logs
azd logs <service-name> --follow

# Monitor application
azd monitor --overview

# Clean up resources
azd down --force --purge
```

## 疑難排解

### 問題：容器無法啟動

```bash
# Check logs
azd logs api --tail 100

# View container events
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Test locally
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### 問題：無法存取容器應用程式端點

```bash
# Verify ingress configuration
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Check if internal ingress is enabled
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### 問題：效能問題

```bash
# Check resource utilization
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Scale up resources
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## 其他資源與範例
- [微服務範例](./microservices/README.md)
- [簡單 Flask API 範例](./simple-flask-api/README.md)
- [Azure Container Apps 文件](https://learn.microsoft.com/azure/container-apps/)
- [AZD 模板庫](https://azure.github.io/awesome-azd/)
- [Container Apps 範例](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep 模板](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## 貢獻

若要貢獻新的容器應用程式範例：

1. 建立一個包含範例的新子目錄
2. 包含完整的 `azure.yaml`、`infra/` 和 `src/` 檔案
3. 添加詳細的 README，說明部署步驟
4. 使用 `azd up` 測試部署
5. 提交 Pull Request

---

**需要幫助嗎？** 加入 [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) 社群以獲取支援與解答問題。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對於因使用此翻譯而產生的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
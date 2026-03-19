# Container App Deployment Examples with AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 目錄

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start Examples](#quick-start-examples)
- [Production Examples](#production-examples)
- [Advanced Patterns](#advanced-patterns)
- [Best Practices](#best-practices)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Simplified Deployment**: Single command deploys containers with infrastructure
- **Automatic Scaling**: Scale to zero and scale out based on HTTP traffic or events
- **Integrated Networking**: Built-in service discovery and traffic splitting
- **Managed Identity**: Secure authentication to Azure resources
- **Cost Optimization**: Pay only for resources you use

## Prerequisites

Before getting started, ensure you have:

```bash
# 檢查是否已安裝 AZD
azd version

# 檢查是否已安裝 Azure CLI
az version

# 檢查 Docker（用於建立自訂映像）
docker --version

# 登入 Azure
azd auth login
az login
```

**Required Azure Resources:**
- Active Azure subscription
- Resource group creation permissions
- Container Apps environment access

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Deploy a basic REST API with Azure Container Apps.

**Example: Python Flask API**

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

**Deployment Steps:**

```bash
# 從範本初始化
azd init --template todo-python-mongo

# 佈建基礎架構並部署
azd up

# 測試部署
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Key Features:**
- Auto-scaling from 0 to 10 replicas
- Health probes and liveness checks
- Environment variable injection
- Application Insights integration

### 2. Node.js Express API

Deploy a Node.js backend with MongoDB integration.

```bash
# 初始化 Node.js API 範本
azd init --template todo-nodejs-mongo

# 設定環境變數
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# 部署
azd up

# 透過 Azure Monitor 檢視日誌
azd monitor --logs
```

**Infrastructure Highlights:**
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

### 3. Static Frontend + API Backend

Deploy a full-stack application with React frontend and API backend.

```bash
# 初始化全端範本
azd init --template todo-csharp-sql-swa-func

# 檢閱設定
cat azure.yaml

# 部署兩個服務
azd up

# 開啟應用程式
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: E-commerce application with multiple microservices

**Directory Structure:**
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

**azure.yaml Configuration:**
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

**Deployment:**
```bash
# 初始化專案
azd init

# 設定生產環境
azd env new production

# 設定生產環境設定
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# 部署所有服務
azd up

# 監控部署
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: AI chat application with Microsoft Foundry Models integration

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# 使用受管身分識別（Managed Identity）以安全存取
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # 從 Key Vault 取得 OpenAI 金鑰
    openai_key = client.get_secret("openai-api-key").value
    openai.api_key = openai_key
    
    response = openai.ChatCompletion.create(
        model="gpt-4.1",
        messages=[{"role": "user", "content": user_message}]
    )
    
    return jsonify({"response": response.choices[0].message.content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**File: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**File: infra/main.bicep**
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

**Deployment Commands:**
```bash
# 設定環境
azd init --template ai-chat-app
azd env new dev

# 設定 OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# 部署
azd up

# 測試 API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**Scenario**: Order processing system with message queue

**Directory Structure:**
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

**File: src/worker/processor.py**
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
            # 處理訂單
            print(f"Processing order: {message.content}")
            
            # 完整訊息
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**File: azure.yaml**
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

**Deployment:**
```bash
# 初始化
azd init

# 使用佇列設定進行部署
azd up

# 根據佇列長度調整工作者數量
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Pattern 1: Blue-Green Deployment

```bash
# 建立新的修訂版本但不分配流量
azd deploy api --revision-suffix blue --no-traffic

# 測試新的修訂版本
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# 分配流量（20% 到藍色，80% 到目前版本）
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# 完全切換到藍色
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

**File: .azure/dev/config.json**
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

**Deployment Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# 以 10% 流量部署新版本
azd deploy api --revision-mode multiple

# 監控指標
azd monitor --service api --duration 5m

# 逐步增加流量
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 等待 5 分鐘
done
```

### Pattern 3: Multi-Region Deployment

**File: azure.yaml**
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

**File: infra/multi-region.bicep**
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

**Deployment:**
```bash
# 部署到所有區域
azd up

# 驗證端點
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

**File: infra/app/dapr-enabled.bicep**
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

**Application Code with Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # 儲存狀態
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # 發布事件
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Resource Organization

```bash
# 使用一致的命名慣例
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# 為資源加上標籤以進行成本追蹤
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Security Best Practices

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

### 3. Performance Optimization

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

### 4. Monitoring and Observability

```bash
# 啟用 Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# 即時檢視日誌
azd monitor --logs
# 或使用 Azure CLI 管理 Container Apps：
az containerapp logs show --name api --resource-group rg-myapp --follow

# 監控指標
azd monitor --live

# 建立警示
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# 未使用時縮減到零
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# 在開發環境使用 Spot 執行個體
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# 設定預算警示
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**GitHub Actions Example:**
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

## Common Commands Reference

```bash
# 初始化新的容器應用專案
azd init --template <template-name>

# 部署基礎設施與應用程式
azd up

# 僅部署應用程式程式碼（跳過基礎設施）
azd deploy

# 僅佈建基礎設施
azd provision

# 檢視已部署的資源
azd show

# 使用 azd monitor 或 Azure CLI 串流日誌
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# 監控應用程式
azd monitor --overview

# 清理資源
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# 使用 Azure CLI 檢查日誌
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# 檢視容器事件
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# 在本機測試
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# 驗證 ingress 設定
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# 檢查是否啟用內部 ingress
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# 檢查資源使用情況
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 擴充資源
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [微服務範例](./microservices/README.md)
- [Simple Flash API 範例](./simple-flask-api/README.md)
- [Azure Container Apps 文件](https://learn.microsoft.com/azure/container-apps/)
- [AZD 範本畫廊](https://azure.github.io/awesome-azd/)
- [Container Apps 範例](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep 範本](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

To contribute new container app examples:

1. Create a new subdirectory with your example
2. Include complete `azure.yaml`, `infra/`, and `src/` files
3. Add comprehensive README with deployment instructions
4. Test deployment with `azd up`
5. Submit a pull request

---

**需要幫助嗎？** 加入 [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) 社群以取得支援與問題協助。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確性，但請注意自動翻譯可能包含錯誤或不精確之處。原始語言版本應被視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用此翻譯而產生的任何誤解或曲解負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
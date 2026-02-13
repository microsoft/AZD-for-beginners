# Container App 部署範例與 AZD

此目錄包含使用 Azure Developer CLI (AZD) 將容器化應用部署到 Azure Container Apps 的完整範例。這些範例展示了實際情境的模式、最佳實務和可投入生產的設定。

## 📚 目錄

- [Overview](../../../../examples/container-app)
- [Prerequisites](../../../../examples/container-app)
- [Quick Start Examples](../../../../examples/container-app)
- [Production Examples](../../../../examples/container-app)
- [Advanced Patterns](../../../../examples/container-app)
- [Best Practices](../../../../examples/container-app)

## Overview

Azure Container Apps 是一個完全管理的無伺服器容器平台，可讓您在不管理基礎設施的情況下執行微服務和容器化應用。結合 AZD 時，您將獲得：

- **簡化部署**：單一指令即可部署含基礎設施的容器
- **自動縮放**：可根據 HTTP 流量或事件從零縮放到更多實例
- **整合網路**：內建服務發現與流量拆分
- **受管理身分識別**：對 Azure 資源的安全驗證
- **成本優化**：只為您使用的資源付費

## Prerequisites

在開始之前，請確保您已具備：

```bash
# 檢查是否已安裝 AZD
azd version

# 檢查是否已安裝 Azure CLI
az version

# 檢查 Docker（用於建置自訂映像檔）
docker --version

# 登入 Azure
azd auth login
az login
```

**所需的 Azure 資源：**
- 有效的 Azure 訂閱
- 建立資源群組的權限
- Container Apps 環境存取權

## Quick Start Examples

### 1. Simple Web API (Python Flask)

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
# 從範本初始化
azd init --template todo-python-mongo

# 佈建基礎架構並進行部署
azd up

# 測試部署
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**主要特色：**
- 自動從 0 擴展到 10 個副本
- 健康探測與存活檢查
- 環境變數注入
- 與 Application Insights 整合

### 2. Node.js Express API

部署一個帶有 MongoDB 整合的 Node.js 後端。

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

**基礎設施重點：**
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

部署一個包含 React 前端與 API 後端的完整應用。

```bash
# 初始化全端範本
azd init --template todo-csharp-sql-swa-func

# 檢視設定
cat azure.yaml

# 部署兩個服務
azd up

# 開啟應用程式
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**情境**：具有多個微服務的電子商務應用

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

**azure.yaml 設定：**
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
# 初始化專案
azd init

# 設定為生產環境
azd env new production

# 配置生產環境設定
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# 部署所有服務
azd up

# 監控部署
azd monitor --overview
```

### Example 2: AI-Powered Container App

**情境**：與 Azure OpenAI 整合的 AI 聊天應用

**檔案：src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# 使用託管身分識別以進行安全存取
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # 從金鑰保管庫取得 OpenAI 金鑰
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
# 設定環境
azd init --template ai-chat-app
azd env new dev

# 設定 OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# 部署
azd up

# 測試 API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**情境**：使用訊息佇列的訂單處理系統

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
            # 處理訂單
            print(f"Processing order: {message.content}")
            
            # 完整訊息
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

# 分配流量 (20% 到藍色, 80% 到目前版本)
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

# 部署新修訂版本並分配 10% 的流量
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
# 部署到所有區域
azd up

# 驗證端點
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

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

**搭配 Dapr 的應用程式程式碼：**
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

### 1. 資源組織

```bash
# 使用一致的命名規則
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# 為資源加上標籤以追蹤成本
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. 安全最佳實務

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

### 3. 效能最佳化

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
# 啟用 Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# 即時檢視日誌
azd monitor --logs
# 或者針對 Container Apps 使用 Azure CLI：
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

### 5. 成本優化

```bash
# 不使用時縮減為零
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
# 初始化新的容器應用程式專案
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

## 疑難排解

### 問題：容器啟動失敗

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

### 問題：無法存取 container app 端點

```bash
# 驗證 ingress 設定
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# 檢查內部 ingress 是否已啟用
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### 問題：效能問題

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

## 其他資源與範例
- [Microservices Example](./microservices/README.md)
- [Simple Flash API Example](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

要貢獻新的 container app 範例，請：

1. 建立包含您範例的新子目錄
2. 包含完整的 `azure.yaml`、`infra/` 與 `src/` 檔案
3. 新增完整的 README，含部署說明
4. 使用 `azd up` 測試部署
5. 提交 Pull Request

---

**需要幫助嗎？** 加入 [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) 社群以取得支援與問題諮詢。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務「Co-op Translator」(https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原始語言的文件應視為具權威性的來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
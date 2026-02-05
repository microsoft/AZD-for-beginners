# 使用 AZD 部署容器应用示例

此目录包含使用 Azure Developer CLI (AZD) 将容器化应用部署到 Azure Container Apps 的全面示例。这些示例展示了真实世界的模式、最佳实践以及生产级配置。

## 📚 目录

- [概述](../../../../examples/container-app)
- [先决条件](../../../../examples/container-app)
- [快速入门示例](../../../../examples/container-app)
- [生产级示例](../../../../examples/container-app)
- [高级模式](../../../../examples/container-app)
- [最佳实践](../../../../examples/container-app)

## 概述

Azure Container Apps 是一个完全托管的无服务器容器平台，可让您运行微服务和容器化应用，而无需管理基础设施。结合 AZD，您可以获得以下优势：

- **简化部署**：通过单条命令即可部署容器和基础设施
- **自动扩展**：根据 HTTP 流量或事件自动扩展至零或扩展至多个实例
- **集成网络**：内置服务发现和流量分流功能
- **托管身份**：安全认证 Azure 资源
- **成本优化**：仅为使用的资源付费

## 先决条件

开始之前，请确保您已具备以下条件：

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

**所需的 Azure 资源：**
- 活跃的 Azure 订阅
- 创建资源组的权限
- 容器应用环境的访问权限

## 快速入门示例

### 1. 简单 Web API (Python Flask)

使用 Azure Container Apps 部署一个基础 REST API。

**示例：Python Flask API**

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

**部署步骤：**

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
- 自动扩展至 0 到 10 个副本
- 健康探测和存活检查
- 环境变量注入
- 应用洞察集成

### 2. Node.js Express API

部署一个带有 MongoDB 集成的 Node.js 后端。

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

**基础设施亮点：**
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

### 3. 静态前端 + API 后端

部署一个完整的全栈应用，包括 React 前端和 API 后端。

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

## 生产级示例

### 示例 1: 微服务架构

**场景**：具有多个微服务的电商应用

**目录结构：**
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

### 示例 2: AI 驱动的容器应用

**场景**：集成 Azure OpenAI 的 AI 聊天应用

**文件：src/ai-chat/app.py**
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

**文件：azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**文件：infra/main.bicep**
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

**部署命令：**
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

### 示例 3: 队列处理的后台工作器

**场景**：带消息队列的订单处理系统

**目录结构：**
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

**文件：src/worker/processor.py**
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

**文件：azure.yaml**
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

## 高级模式

### 模式 1: 蓝绿部署

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

### 模式 2: 使用 AZD 的金丝雀部署

**文件：.azure/dev/config.json**
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

**部署脚本：**
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

### 模式 3: 多区域部署

**文件：azure.yaml**
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

**文件：infra/multi-region.bicep**
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

### 模式 4: Dapr 集成

**文件：infra/app/dapr-enabled.bicep**
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

**带 Dapr 的应用代码：**
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

## 最佳实践

### 1. 资源组织

```bash
# Use consistent naming conventions
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Tag resources for cost tracking
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. 安全最佳实践

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

### 3. 性能优化

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

### 4. 监控和可观察性

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

### 5. 成本优化

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

### 6. CI/CD 集成

**GitHub Actions 示例：**
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

## 常用命令参考

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

## 故障排除

### 问题：容器无法启动

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

### 问题：无法访问容器应用端点

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

### 问题：性能问题

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

## 其他资源和示例
- [微服务示例](./microservices/README.md)
- [简单 Flask API 示例](./simple-flask-api/README.md)
- [Azure Container Apps 文档](https://learn.microsoft.com/azure/container-apps/)
- [AZD 模板库](https://azure.github.io/awesome-azd/)
- [容器应用示例](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep 模板](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## 贡献

要贡献新的容器应用示例：

1. 创建一个包含示例的新子目录
2. 包含完整的 `azure.yaml`、`infra/` 和 `src/` 文件
3. 添加详细的 README 文件，包含部署说明
4. 使用 `azd up` 测试部署
5. 提交一个拉取请求

---

**需要帮助？** 加入 [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) 社区获取支持和解答。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
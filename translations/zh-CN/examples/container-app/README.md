# 使用 AZD 的容器应用部署示例

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 目录

- [概览](#overview)
- [先决条件](#先决条件)
- [快速入门示例](#快速入门示例)
- [生产示例](#生产示例)
- [高级模式](#高级模式)
- [最佳实践](#最佳实践)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Simplified Deployment**: Single command deploys containers with infrastructure
- **Automatic Scaling**: Scale to zero and scale out based on HTTP traffic or events
- **Integrated Networking**: Built-in service discovery and traffic splitting
- **Managed Identity**: Secure authentication to Azure resources
- **Cost Optimization**: Pay only for resources you use

## 先决条件

在开始之前，请确保您拥有：

```bash
# 检查 AZD 是否已安装
azd version

# 检查 Azure CLI 是否已安装
az version

# 检查 Docker（用于构建自定义镜像）
docker --version

# 为 AZD 部署进行身份验证
azd auth login

# 可选：如果您计划直接运行 az 命令，请登录 Azure CLI
az login
```

**所需的 Azure 资源：**
- 活跃的 Azure 订阅
- 创建资源组的权限
- Container Apps 环境访问权限

## 快速入门示例

### 1. 简单 Web API（Python Flask）

Deploy a basic REST API with Azure Container Apps.

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
# 从模板初始化
azd init --template todo-python-mongo

# 配置基础设施并部署
azd up

# 测试部署
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**关键特性：**
- 自动伸缩（从 0 到 10 个副本）
- 健康探针和存活检查
- 环境变量注入
- 集成 Application Insights

### 2. Node.js Express API

Deploy a Node.js backend with MongoDB integration.

部署带有 MongoDB 集成的 Node.js 后端。

```bash
# 初始化 Node.js API 模板
azd init --template todo-nodejs-mongo

# 配置环境变量
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# 部署
azd up

# 通过 Azure Monitor 查看日志
azd monitor --logs
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

Deploy a full-stack application with React frontend and API backend.

部署一个具有 React 前端和 API 后端的全栈应用。

```bash
# 初始化全栈模板
azd init --template todo-csharp-sql-swa-func

# 检查配置
cat azure.yaml

# 部署两个服务
azd up

# 打开应用程序
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## 生产示例

### 示例 1：微服务架构

<strong>场景</strong>：具有多个微服务的电子商务应用

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
# 初始化项目
azd init

# 设置生产环境
azd env new production

# 配置生产环境设置
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# 部署所有服务
azd up

# 监控部署
azd monitor --overview
```

### 示例 2：AI 驱动的容器应用

<strong>场景</strong>：与 Microsoft Foundry 模型集成的 AI 聊天应用

**文件：src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# 使用托管标识进行安全访问
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # 从密钥保管库获取 OpenAI 密钥
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
# 设置环境
azd init --template ai-chat-app
azd env new dev

# 配置 OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# 部署
azd up

# 测试 API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### 示例 3：带队列处理的后台工作器

<strong>场景</strong>：具有消息队列的订单处理系统

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
            # 处理订单
            print(f"Processing order: {message.content}")
            
            # 完成消息
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
# 初始化
azd init

# 使用队列配置部署
azd up

# 根据队列长度扩展工作进程
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## 高级模式

### 模式 1：蓝绿部署

```bash
# 创建不接收流量的新修订
azd deploy api --revision-suffix blue --no-traffic

# 测试新修订
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# 拆分流量（20% 到蓝色，80% 到当前）
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# 完全切换到蓝色
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### 模式 2：使用 AZD 的金丝雀部署

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

# 将新修订部署并分配10%的流量
azd deploy api --revision-mode multiple

# 监控指标
azd monitor --service api --duration 5m

# 逐步增加流量
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 等待5分钟
done
```

### 模式 3：多区域部署

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
# 部署到所有区域
azd up

# 验证端点
azd show --output json | jq '.services.api.endpoints'
```

### 模式 4：Dapr 集成

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
        # 保存状态
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # 发布事件
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
# 使用一致的命名约定
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# 为资源打标签以进行成本跟踪
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

### 4. 监控与可观测性

```bash
# 启用 Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# 实时查看日志
azd monitor --logs
# 或者使用用于容器应用的 Azure CLI：
az containerapp logs show --name api --resource-group rg-myapp --follow

# 监控指标
azd monitor --live

# 创建警报
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. 成本优化

```bash
# 在不使用时缩容到零
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# 在开发环境使用抢占式实例
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# 设置预算警报
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
# 初始化新的容器应用项目
azd init --template <template-name>

# 部署基础设施和应用
azd up

# 仅部署应用代码（跳过基础设施）
azd deploy

# 仅预配基础设施
azd provision

# 查看已部署的资源
azd show

# 使用 azd monitor 或 Azure CLI 实时查看日志
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# 监控应用
azd monitor --overview

# 清理资源
azd down --force --purge
```

## 故障排除

### 问题：容器无法启动

```bash
# 使用 Azure CLI 检查日志
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# 查看容器事件
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# 在本地测试
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### 问题：无法访问容器应用端点

```bash
# 验证 Ingress 配置
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# 检查是否启用了内部 Ingress
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### 问题：性能问题

```bash
# 检查资源利用率
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 扩容资源
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## 其他资源和示例
- [微服务示例](./microservices/README.md)
- [简单 Flash API 示例](./simple-flask-api/README.md)
- [Azure Container Apps 文档](https://learn.microsoft.com/azure/container-apps/)
- [AZD 模板库](https://azure.github.io/awesome-azd/)
- [Container Apps 示例](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep 模板](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## 贡献

要贡献新的容器应用示例：

1. 创建一个包含您示例的新子目录
2. 包含完整的 `azure.yaml`、`infra/` 和 `src/` 文件
3. 添加包含部署说明的详尽 README
4. 使用 `azd up` 测试部署
5. 提交拉取请求

---

**需要帮助？** 加入 [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) 社区以获取支持和提出问题。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。应将原始文档的母语版本视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
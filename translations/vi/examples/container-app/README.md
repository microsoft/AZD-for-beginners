# Ví dụ Triển khai Ứng dụng Container với AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Mục lục

- [Tổng quan](#overview)
- [Yêu cầu](#prerequisites)
- [Ví dụ Bắt đầu Nhanh](#quick-start-examples)
- [Ví dụ sản xuất](#production-examples)
- [Các mẫu nâng cao](#advanced-patterns)
- [Các thực tiễn tốt nhất](#các-thực-tiễn-tốt-nhất)

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
# Kiểm tra cài đặt AZD
azd version

# Kiểm tra Azure CLI
az version

# Kiểm tra Docker (để xây dựng ảnh tùy chỉnh)
docker --version

# Đăng nhập vào Azure
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
# Khởi tạo từ mẫu
azd init --template todo-python-mongo

# Cung cấp hạ tầng và triển khai
azd up

# Kiểm tra việc triển khai
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
# Khởi tạo mẫu API Node.js
azd init --template todo-nodejs-mongo

# Cấu hình biến môi trường
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Triển khai
azd up

# Xem nhật ký qua Azure Monitor
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
# Khởi tạo mẫu full-stack
azd init --template todo-csharp-sql-swa-func

# Xem lại cấu hình
cat azure.yaml

# Triển khai cả hai dịch vụ
azd up

# Mở ứng dụng
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Ví dụ 1: Kiến trúc Microservices

**Kịch bản**: Ứng dụng thương mại điện tử với nhiều microservices

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
# Khởi tạo dự án
azd init

# Thiết lập môi trường sản xuất
azd env new production

# Cấu hình cài đặt sản xuất
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Triển khai tất cả dịch vụ
azd up

# Giám sát việc triển khai
azd monitor --overview
```

### Ví dụ 2: Ứng dụng Container hỗ trợ AI

**Kịch bản**: Ứng dụng chat AI với tích hợp Microsoft Foundry Models

**Tệp: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Sử dụng Managed Identity để truy cập an toàn
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Lấy khóa OpenAI từ Key Vault
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

**Tệp: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Tệp: infra/main.bicep**
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

**Lệnh triển khai:**
```bash
# Thiết lập môi trường
azd init --template ai-chat-app
azd env new dev

# Cấu hình OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Triển khai
azd up

# Kiểm tra API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Ví dụ 3: Trình làm việc nền với xử lý hàng đợi

**Kịch bản**: Hệ thống xử lý đơn hàng với hàng đợi tin nhắn

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

**Tệp: src/worker/processor.py**
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
            # Xử lý đơn hàng
            print(f"Processing order: {message.content}")
            
            # Tin nhắn hoàn chỉnh
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Tệp: azure.yaml**
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
# Khởi tạo
azd init

# Triển khai với cấu hình hàng đợi
azd up

# Điều chỉnh quy mô worker dựa trên độ dài hàng đợi
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Mẫu 1: Triển khai Blue-Green

```bash
# Tạo phiên bản mới không nhận lưu lượng
azd deploy api --revision-suffix blue --no-traffic

# Kiểm tra phiên bản mới
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Chia lưu lượng (20% tới blue, 80% tới current)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Chuyển hoàn toàn sang blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Mẫu 2: Triển khai Canary với AZD

**Tệp: .azure/dev/config.json**
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

**Tập lệnh triển khai:**
```bash
#!/bin/bash
# deploy-canary.sh

# Triển khai phiên bản mới với 10% lưu lượng
azd deploy api --revision-mode multiple

# Giám sát các chỉ số
azd monitor --service api --duration 5m

# Tăng lưu lượng dần dần
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Chờ 5 phút
done
```

### Mẫu 3: Triển khai đa vùng

**Tệp: azure.yaml**
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

**Tệp: infra/multi-region.bicep**
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
# Triển khai đến tất cả các vùng
azd up

# Xác minh các điểm cuối
azd show --output json | jq '.services.api.endpoints'
```

### Mẫu 4: Tích hợp Dapr

**Tệp: infra/app/dapr-enabled.bicep**
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

**Mã ứng dụng với Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Lưu trạng thái
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Xuất bản sự kiện
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Các thực tiễn tốt nhất

### 1. Tổ chức tài nguyên

```bash
# Sử dụng quy ước đặt tên nhất quán
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Gắn thẻ tài nguyên để theo dõi chi phí
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Thực tiễn bảo mật tốt nhất

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

### 3. Tối ưu hiệu năng

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

### 4. Giám sát và khả năng quan sát

```bash
# Bật Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Xem nhật ký theo thời gian thực
azd monitor --logs
# Hoặc sử dụng Azure CLI cho Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Giám sát số liệu
azd monitor --live

# Tạo cảnh báo
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Tối ưu chi phí

```bash
# Thu nhỏ xuống 0 khi không sử dụng
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Sử dụng spot instances cho môi trường phát triển
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Thiết lập cảnh báo ngân sách
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Tích hợp CI/CD

**Ví dụ GitHub Actions:**
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

## Tham khảo các lệnh phổ biến

```bash
# Khởi tạo dự án ứng dụng container mới
azd init --template <template-name>

# Triển khai hạ tầng và ứng dụng
azd up

# Chỉ triển khai mã ứng dụng (bỏ qua hạ tầng)
azd deploy

# Chỉ chuẩn bị hạ tầng
azd provision

# Xem các tài nguyên đã triển khai
azd show

# Xem nhật ký theo thời gian thực bằng azd monitor hoặc Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Giám sát ứng dụng
azd monitor --overview

# Dọn dẹp tài nguyên
azd down --force --purge
```

## Khắc phục sự cố

### Vấn đề: Container không khởi động được

```bash
# Kiểm tra nhật ký bằng Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Xem các sự kiện của container
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Kiểm tra cục bộ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Vấn đề: Không thể truy cập endpoint của ứng dụng container

```bash
# Xác minh cấu hình ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Kiểm tra xem ingress nội bộ có được bật hay không
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Vấn đề: Hiệu năng kém

```bash
# Kiểm tra việc sử dụng tài nguyên
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Mở rộng tài nguyên
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Tài nguyên và ví dụ bổ sung
- [Ví dụ Microservices](./microservices/README.md)
- [Ví dụ Simple Flash API](./simple-flask-api/README.md)
- [Tài liệu Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Thư viện mẫu AZD](https://azure.github.io/awesome-azd/)
- [Ví dụ Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Mẫu Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

To contribute new container app examples:

1. Create a new subdirectory with your example
2. Include complete `azure.yaml`, `infra/`, and `src/` files
3. Add comprehensive README with deployment instructions
4. Test deployment with `azd up`
5. Submit a pull request

---

**Cần trợ giúp?** Tham gia cộng đồng [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) để được hỗ trợ và giải đáp thắc mắc.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa sai sót hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp do con người thực hiện. Chúng tôi không chịu trách nhiệm đối với bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
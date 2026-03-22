# Container App Deployment Examples with AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Table of Contents

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
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az version

# Docker ကို စစ်ဆေးပါ (သီးသန့် image များ တည်ဆောက်ရန်)
docker --version

# Azure သို့ ဝင်ပါ
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
# နမူနာမှ စတင်အစပြု
azd init --template todo-python-mongo

# အခြေခံအဆောက်အအုံကို စီစဉ်ဖော်ဆောင်ပြီး ဖြန့်ချိပါ
azd up

# တပ်ဆင်မှုကို စမ်းသပ်ပါ
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
# Node.js API နမူနာကို စတင် တည်ဆောက်ခြင်း
azd init --template todo-nodejs-mongo

# ပတ်ဝန်းကျင် များအတွက် အပြောင်းအလဲ တန်ဖိုးများကို သတ်မှတ်ခြင်း
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ဖြန့်ချိခြင်း
azd up

# Azure Monitor မှတဆင့် လော့ဂ်များကို ကြည့်ရှုခြင်း
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
# full-stack ပုံစံကို စတင်ပြင်ဆင်ပါ
azd init --template todo-csharp-sql-swa-func

# ဆက်တင်များကို ပြန်လည်စစ်ဆေးပါ
cat azure.yaml

# ဝန်ဆောင်မှုနှစ်ခုကို တပ်ဆင်ပါ
azd up

# အပလီကေးရှင်းကို ဖွင့်ပါ
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
# ပရောဂျက်ကို အစပြုပါ
azd init

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်ကို သတ်မှတ်ပါ
azd env new production

# ထုတ်လုပ်ရေး ဆက်တင်များကို သတ်မှတ်ပါ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd up

# ဖြန့်ချိမှုကို စောင့်ကြည့်ပါ
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

# လုံခြုံစိတ်ချစွာ ဝင်ရောက်ရန် Managed Identity ကို အသုံးပြုပါ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault မှ OpenAI key ကို ရယူပါ
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
# ပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ
azd init --template ai-chat-app
azd env new dev

# OpenAI ကို ပြင်ဆင်ပါ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ဖြန့်ချိပါ
azd up

# API ကို စမ်းသပ်ပါ
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
            # အမှာစာကို ဆောင်ရွက်ခြင်း
            print(f"Processing order: {message.content}")
            
            # မက်ဆေ့ခ်ျ ပြီးစီးခြင်း
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
# စတင်ရန်
azd init

# တန်းစီဖော်ပြချက်နှင့်အတူ ဖြန့်ချိပါ
azd up

# တန်းရှည်အပေါ်မူတည်၍ လုပ်ဆောင်သူ အရေအတွက်ကို တိုးမြှင့်/လျော့ချပေးပါ
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
# revision အသစ်ကို traffic မပေးဘဲ ဖန်တီးပါ
azd deploy api --revision-suffix blue --no-traffic

# revision အသစ်ကို စမ်းသပ်ပါ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# traffic ကို ဖြန့်ဝေပါ (20% ကို blue သို့၊ 80% ကို current သို့)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# blue သို့ အပြည့်အဝ ပြောင်းရွှေ့ပါ
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

# အသစ်သော revision ကို ယာဉ်လှုပ်ရှားမှု ၁၀% ဖြင့် deploy လုပ်ပါ
azd deploy api --revision-mode multiple

# မက်ရစ် (metrics) များကို စောင့်ကြည့်ပါ
azd monitor --service api --duration 5m

# ယာဉ်လှုပ်ရှားမှုကို ဖြည်းဖြည်းချင်း တိုးမြှင့်ပါ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ၅ မိနစ် စောင့်ဆိုင်းပါ
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
# ဒေသအားလုံးတွင် တပ်ဆင်ပါ
azd up

# endpoint များကို အတည်ပြုပါ
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
        # အခြေအနေကို သိမ်းဆည်းပါ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # အဖြစ်အပျက်ကို ထုတ်ပြန်ပါ
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
# နာမည်သတ်မှတ်ချက်များကို စည်းမျဉ်းတကျ အသုံးပြုပါ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ကုန်ကျစရိတ်ကို လိုက်လံစောင့်ကြည့်ရန် အရင်းအမြစ်များကို တံဆိပ်တပ်ပါ
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
# Application Insights ကို ဖွင့်ပါ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# မှတ်တမ်းများကို တိုက်ရိုက် ကြည့်ရှုပါ
azd monitor --logs
# သို့မဟုတ် Container Apps အတွက် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# မက်ထရစ်များကို စောင့်ကြည့်ပါ
azd monitor --live

# သတိပေးချက်များ ဖန်တီးပါ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# မအသုံးပြုသောအချိန်တွင် ဝန်ဆောင်မှုများကို သုည (0) အထိ လျော့ချပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်များအတွက် Spot instance များကို အသုံးပြုပါ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ဘတ်ဂျက် သတိပေးချက်များကို တပ်ဆင်ပါ
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
# ကွန်တိန်းနာ အက်ပ် ပရောဂျက်အသစ်ကို စတင်ဖန်တီးပါ
azd init --template <template-name>

# အခြေခံအဆောက်အအုံနှင့် အက်ပ်ကို ဖြန့်ချိပါ
azd up

# အခြေခံအဆောက်အအုံကို ကျော်လွှားပြီး အက်ပ်ကုဒ်သာ ဖြန့်ချိပါ
azd deploy

# အခြေခံအဆောက်အအုံသာ တည်ဆောက်ပါ
azd provision

# ဖြန့်ချိထားသော အရင်းအမြစ်များကို ကြည့်ရှုပါ
azd show

# azd monitor သို့မဟုတ် Azure CLI ကို အသုံးပြုပြီး မှတ်တမ်းများကို တိုက်ရိုက် စီးဆင်းအောင် ကြည့်ရှုပါ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# အက်ပ်ကို စောင့်ကြည့်ပါ
azd monitor --overview

# အရင်းအမြစ်များကို ရှင်းလင်းပါ
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Azure CLI ကို အသုံးပြု၍ လော့ဂ်များကို စစ်ဆေးပါ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ကွန်တိန်နာဖြစ်ရပ်များကို ကြည့်ရှုပါ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# သင့်စက်တွင် စမ်းသပ်ပါ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# ingress ဖွဲ့စည်းမှုကို စစ်ဆေးပါ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# အတွင်းပိုင်း ingress ဖွင့်ထားသည်ကို စစ်ဆေးပါ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# ရင်းမြစ်အသုံးချမှုကို စစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ရင်းမြစ်များကို တိုးမြှင့်ပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [Microservices Example](./microservices/README.md)
- [Simple Flash API Example](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

To contribute new container app examples:

1. Create a new subdirectory with your example
2. Include complete `azure.yaml`, `infra/`, and `src/` files
3. Add comprehensive README with deployment instructions
4. Test deployment with `azd up`
5. Submit a pull request

---

**Need Help?** Join the [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) community for support and questions.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့ပါးမှုများ ပါဝင်နိုင်ကြောင်း သိရှိထားပေးပါ။ မူရင်းစာရွက်စာတမ်းကို မူလဘာသာဖြင့် ရရှိထားသော အရာကို အာဏာပိုင် အရင်းမြစ်အဖြစ် စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် မနားလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
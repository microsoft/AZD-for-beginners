# AZD সহ কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট উদাহরণসমূহ

এই ডিরেক্টরিটি Azure Developer CLI (AZD) ব্যবহার করে Azure Container Apps-এ কন্টেইনারাইজড অ্যাপ্লিকেশন ডিপ্লয় করার জন্য ব্যাপক উদাহরণসমূহ ধারণ করে। এই উদাহরণগুলো বাস্তব বিশ্বের প্যাটার্ন, সেরা অনুশীলন, এবং প্রোডাকশন-রেডি কনফিগারেশনগুলো প্রদর্শন করে।

## 📚 বিষয়বস্তুর সূচি

- [ওভারভিউ](../../../../examples/container-app)
- [প্রয়োজনীয়তা](../../../../examples/container-app)
- [দ্রুত শুরু উদাহরণ](../../../../examples/container-app)
- [প্রোডাকশন উদাহরণ](../../../../examples/container-app)
- [উন্নত প্যাটার্ন](../../../../examples/container-app)
- [সেরা অনুশীলন](../../../../examples/container-app)

## Overview

Azure Container Apps হল একটি সম্পূর্ণভাবে পরিচালিত সার্ভারলেস কন্টেইনার প্ল্যাটফর্ম যা আপনাকে অবকাঠামো পরিচালনা না করেই মাইক্রোসার্ভিস এবং কন্টেইনারাইজড অ্যাপ্লিকেশন চালাতে সক্ষম করে। AZD-এর সাথে মিলিয়ে আপনার কাছে রয়েছে:

- **সরলীকৃত ডিপ্লয়মেন্ট**: ইনফ্রা সহ কন্টেইনারগুলো একক কমান্ডে ডিপ্লয় করা হয়
- **স্বয়ংক্রিয় স্কেলিং**: HTTP ট্রাফিক বা ইভেন্টের উপর ভিত্তি করে শূন্যে স্কেল এবং বাইরে স্কেল করা
- **সমন্বিত নেটওয়ার্কিং**: বিল্ট-ইন সার্ভিস ডিসকভারি এবং ট্রাফিক বিভাজন
- **ম্যানেজড আইডেন্টিটি**: Azure রিসোর্সে নিরাপদ প্রমাণীকরণ
- **খরচ অপ্টিমাইজেশন**: আপনি যে রিসোর্স ব্যবহার করছেন তাতেই আপনি অর্থ প্রদান করবেন

## Prerequisites

শুরু করার আগে, নিশ্চিত করুন আপনার কাছে রয়েছে:

```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az version

# Docker পরীক্ষা করুন (কাস্টম ইমেজ তৈরি করার জন্য)
docker --version

# Azure-এ লগইন করুন
azd auth login
az login
```

**প্রয়োজনীয় Azure রিসোর্স:**
- সক্রিয় Azure সাবস্ক্রিপশন
- রিসোর্স গ্রুপ তৈরি করার অনুমতি
- Container Apps পরিবেশে অ্যাক্সেস

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Apps দিয়ে একটি বেসিক REST API ডিপ্লয় করুন।

**উদাহরণ: Python Flask API**

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

**ডিপ্লয়মেন্ট ধাপসমূহ:**

```bash
# টেমপ্লেট থেকে শুরু করুন
azd init --template todo-python-mongo

# পরিকাঠামো প্রস্তুত করুন এবং স্থাপন করুন
azd up

# স্থাপনাটি পরীক্ষা করুন
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**প্রধান ফিচারসমূহ:**
- 0 থেকে 10 রেপ্লিকা পর্যন্ত স্বয়ংক্রিয় স্কেলিং
- স্বাস্থ্য পরীক্ষা এবং লাইভনেস চেক
- পরিবেশ ভেরিয়েবল ইনজেকশন
- Application Insights ইন্টিগ্রেশন

### 2. Node.js Express API

MongoDB ইন্টিগ্রেশন সহ একটি Node.js ব্যাকএন্ড ডিপ্লয় করুন।

```bash
# Node.js API টেমপ্লেট শুরু করুন
azd init --template todo-nodejs-mongo

# পরিবেশ ভেরিয়েবলগুলো কনফিগার করুন
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ডিপ্লয় করুন
azd up

# Azure Monitor-এর মাধ্যমে লগ দেখুন
azd monitor --logs
```

**ইনফ্রাস্ট্রাকচারের প্রধান দিকসমূহ:**
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

React ফ্রন্টএন্ড এবং API ব্যাকএন্ড সহ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করুন।

```bash
# ফুল-স্ট্যাক টেমপ্লেট ইনিশিয়ালাইজ করুন
azd init --template todo-csharp-sql-swa-func

# কনফিগারেশন পর্যালোচনা করুন
cat azure.yaml

# উভয় সেবা মোতায়েন করুন
azd up

# অ্যাপ্লিকেশন খুলুন
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**সিনারিও**: একাধিক মাইক্রোসার্ভিসসহ ই-কমার্স অ্যাপ্লিকেশন

**ডিরেক্টরি স্ট্রাকচার:**
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

**azure.yaml কনফিগারেশন:**
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

**ডিপ্লয়মেন্ট:**
```bash
# প্রকল্প শুরু করুন
azd init

# উৎপাদন পরিবেশ সেট করুন
azd env new production

# উৎপাদন সেটিংস কনফিগার করুন
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# সমস্ত পরিষেবা ডিপ্লয় করুন
azd up

# ডিপ্লয়মেন্ট পর্যবেক্ষণ করুন
azd monitor --overview
```

### Example 2: AI-Powered Container App

**সিনারিও**: Azure OpenAI ইন্টিগ্রেশনসহ AI চ্যাট অ্যাপ্লিকেশন

**ফাইল: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# নিরাপদ অ্যাক্সেসের জন্য ম্যানেজড আইডেন্টিটি ব্যবহার করুন
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault থেকে OpenAI কী নিন
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

**ফাইল: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ফাইল: infra/main.bicep**
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

**ডিপ্লয়মেন্ট কমান্ডসমূহ:**
```bash
# পরিবেশ সেট আপ করুন
azd init --template ai-chat-app
azd env new dev

# OpenAI কনফিগার করুন
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# ডিপ্লয় করুন
azd up

# API পরীক্ষা করুন
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**সিনারিও**: মেসেজ কিউসহ অর্ডার প্রসেসিং সিস্টেম

**ডিরেক্টরি স্ট্রাকচার:**
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

**ফাইল: src/worker/processor.py**
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
            # অর্ডার প্রক্রিয়াকরণ
            print(f"Processing order: {message.content}")
            
            # সম্পূর্ণ বার্তা
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ফাইল: azure.yaml**
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

**ডিপ্লয়মেন্ট:**
```bash
# শুরু করা
azd init

# কিউ কনফিগারেশন সহ ডিপ্লয় করা
azd up

# কিউ দৈর্ঘ্যের উপর ভিত্তি করে ওয়ার্কার স্কেল করা
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
# ট্রাফিক ছাড়াই নতুন রিভিশন তৈরি করুন
azd deploy api --revision-suffix blue --no-traffic

# নতুন রিভিশন পরীক্ষা করুন
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ট্রাফিক ভাগ করুন (20% নীলকে, 80% বর্তমানকে)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# সম্পূর্ণভাবে নীলে স্থানান্তর করুন
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

**ফাইল: .azure/dev/config.json**
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

**ডিপ্লয়মেন্ট স্ক্রিপ্ট:**
```bash
#!/bin/bash
# deploy-canary.sh

# নতুন রিভিশন ১০% ট্রাফিক দিয়ে ডিপ্লয় করুন
azd deploy api --revision-mode multiple

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --service api --duration 5m

# ট্রাফিক ধাপে ধাপে বাড়ান
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ৫ মিনিট অপেক্ষা করুন
done
```

### Pattern 3: Multi-Region Deployment

**ফাইল: azure.yaml**
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

**ফাইল: infra/multi-region.bicep**
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

**ডিপ্লয়মেন্ট:**
```bash
# সমস্ত অঞ্চলে মোতায়েন করুন
azd up

# এন্ডপয়েন্টগুলো যাচাই করুন
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

**ফাইল: infra/app/dapr-enabled.bicep**
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

**Dapr সহ অ্যাপ্লিকেশন কোড:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # অবস্থা সংরক্ষণ করুন
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ইভেন্ট প্রকাশ করুন
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
# নামকরণের নিয়মাবলী ধারাবাহিকভাবে ব্যবহার করুন
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# রিসোর্সগুলোকে খরচ ট্র্যাকিংয়ের জন্য ট্যাগ করুন
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
# Application Insights সক্রিয় করুন
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# রিয়েল-টাইমে লগ দেখুন
azd monitor --logs
# অথবা Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
az containerapp logs show --name api --resource-group rg-myapp --follow

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --live

# অ্যালার্ট তৈরি করুন
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# ব্যবহার না থাকলে শূন্যে স্কেল করুন
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ডেভেলপমেন্ট পরিবেশে স্পট ইনস্ট্যান্স ব্যবহার করুন
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# বাজেট সতর্কতা সেট করুন
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**GitHub Actions উদাহরণ:**
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
# নতুন কনটেইনার অ্যাপ প্রকল্প আরম্ভ করুন
azd init --template <template-name>

# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন ডিপ্লয় করুন
azd up

# শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয় করুন (ইনফ্রাস্ট্রাকচার এড়িয়ে যান)
azd deploy

# শুধুমাত্র ইনফ্রাস্ট্রাকচার প্রভিশন করুন
azd provision

# ডিপ্লয় করা রিসোর্স দেখুন
azd show

# azd monitor বা Azure CLI ব্যবহার করে লগ স্ট্রীম করুন
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
azd monitor --overview

# রিসোর্সগুলো পরিষ্কার করুন
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Azure CLI ব্যবহার করে লগ দেখুন
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# কন্টেইনার ইভেন্ট দেখুন
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# লোকালি পরীক্ষা করুন
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# ইনগ্রেস কনফিগারেশন যাচাই করুন
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# যাচাই করুন যে অভ্যন্তরীণ ইনগ্রেস সক্রিয় আছে কি না
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# রিসোর্স ব্যবহার পরীক্ষা করুন
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# রিসোর্স বাড়ান
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [মাইক্রোসার্ভিস উদাহরণ](./microservices/README.md)
- [সহজ Flash API উদাহরণ](./simple-flask-api/README.md)
- [Azure Container Apps ডকুমেন্টেশন](https://learn.microsoft.com/azure/container-apps/)
- [AZD টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [Container Apps স্যাম্পলস](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep টেমপ্লেটস](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

নতুন কন্টেইনার অ্যাপ উদাহরণ যোগ করতে:

1. আপনার উদাহরণ সহ একটি নতুন সাবডিরেক্টরি তৈরি করুন
2. সম্পূর্ণ `azure.yaml`, `infra/`, এবং `src/` ফাইলগুলো অন্তর্ভুক্ত করুন
3. ডিপ্লয়মেন্ট নির্দেশনা সহ বিস্তারিত README যোগ করুন
4. `azd up` দিয়ে ডিপ্লয়মেন্ট পরীক্ষা করুন
5. একটি পুল রিকোয়েস্ট সাবমিট করুন

---

**সহায়তা দরকার?** Azure-এ সহায়তা ও প্রশ্নের জন্য [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) সম্প্রদায়ে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ পরিষেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, অনুগ্রহ করে লক্ষ্য করুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের কারণে সৃষ্ট কোনো ভুলবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
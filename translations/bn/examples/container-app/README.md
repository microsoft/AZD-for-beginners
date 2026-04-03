# কন্টেইনার অ্যাপ স্থাপনার উদাহরণ সহ AZD

এই ডিরেক্টরিটিতে Azure Developer CLI (AZD) ব্যবহার করে Azure Container Apps-এ কন্টেইনারাইজড অ্যাপ্লিকেশন স্থাপনের জন্য সমগ্র উদাহরণ রয়েছে। এই উদাহরণগুলি বাস্তব জগতের প্যাটার্ন, শ্রেষ্ঠ অনুশীলন এবং প্রোডাকশন-প্রস্তুত কনফিগারেশন প্রদর্শন করে।

## 📚 বিষয়বস্তু সূচি

- [ওভারভিউ](#ওভারভিউ)
- [প্রয়োজনীয়তা](#প্রয়োজনীয়তা)
- [দ্রুত শুরু উদাহরণ](#দ্রুত-শুরু-উদাহরণ)
- [প্রোডাকশন উদাহরণ](#প্রোডাকশন-উদাহরণ)
- [উন্নত প্যাটার্ন](#উন্নত-প্যাটার্ন)
- [শ্রেষ্ঠ অনুশীলন](#শ্রেষ্ঠ-অনুশীলন)

## ওভারভিউ

Azure Container Apps একটি সম্পূর্ণরূপে পরিচালিত সার্ভারলেস কন্টেইনার প্ল্যাটফর্ম যা আপনাকে অবকাঠামো পরিচালনা না করে মাইক্রোসার্ভিস এবং কন্টেইনারাইজড অ্যাপ্লিকেশন চালানোর সুযোগ দেয়। AZD-এর সাথে সংমিশ্রণে আপনি পাবেন:

- **সহজ স্থাপন**: একক কমান্ডে কন্টেইনার সহ অবকাঠামো স্থাপন
- **স্বয়ংক্রিয় স্কেলিং**: HTTP ট্র্যাফিক বা ইভেন্ট ভিত্তিতে শূন্য থেকে স্কেল আউট
- **ইন্টিগ্রেটেড নেটওয়ার্কিং**: বিল্ট-ইন সার্ভিস ডিসকভারি এবং ট্র্যাফিক বিভাজন
- **পরিচিতি ব্যবস্থাপনা**: Azure রিসোর্সে নিরাপদ প্রমাণীকরণ
- **খরচ অপ্টিমাইজেশন**: আপনি যেই রিসোর্স ব্যবহার করবেন তার জন্যই অর্থ প্রদান

## প্রয়োজনীয়তা

শুরু করার আগে নিশ্চিত করুন আপনার কাছে রয়েছে:

```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az version

# Docker পরীক্ষা করুন (কাস্টম ইমেজ তৈরি করার জন্য)
docker --version

# AZD ডিপ্লয়মেন্টের জন্য প্রমাণীকরণ করুন
azd auth login

# ঐচ্ছিক: আপনি যদি সরাসরি az কমান্ড চালানোর পরিকল্পনা করেন তবে Azure CLI তে সাইন ইন করুন
az login
```

**আবশ্যক Azure রিসোর্স:**
- সক্রিয় Azure সাবস্ক্রিপশন
- রিসোর্স গ্রুপ তৈরি করার অনুমতি
- Container Apps পরিবেশে প্রবেশাধিকার

## দ্রুত শুরু উদাহরণ

### 1. সিম্পল ওয়েব API (Python Flask)

Azure Container Apps-এর সাথে একটি বেসিক REST API স্থাপন করুন।

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

**স্থাপনার ধাপসমূহ:**

```bash
# টেমপ্লেট থেকে আরম্ভ করুন
azd init --template todo-python-mongo

# অবকাঠামো প্রদান করুন এবং ডিপ্লয় করুন
azd up

# ডিপ্লয়মেন্ট পরীক্ষা করুন
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**মূল ফিচার:**
- 0 থেকে 10 রেপ্লিকার স্বয়ংক্রিয় স্কেলিং
- হেলথ প্রোব এবং লাইভনেস পরীক্ষা
- পরিবেশ পরিবর্তনশীল ইনজেকশন
- অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

### 2. Node.js Express API

MongoDB সংযুক্তি সহ Node.js ব্যাকএন্ড স্থাপন করুন।

```bash
# নোড.জেএস এপিআই টেমপ্লেট শুরু করুন
azd init --template todo-nodejs-mongo

# পরিবেশ ভেরিয়েবল কনফিগার করুন
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# মোতায়েন করুন
azd up

# আজুর মনিটর দিয়ে লগ দেখুন
azd monitor --logs
```

**ইনফ্রাস্ট্রাকচার হাইলাইটস:**
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

### 3. স্ট্যাটিক ফ্রন্টএন্ড + API ব্যাকএন্ড

React ফ্রন্টএন্ড এবং API ব্যাকএন্ড সহ ফুল-স্ট্যাক অ্যাপ্লিকেশন স্থাপন করুন।

```bash
# ফুল-স্ট্যাক টেমপ্লেট শুরু করুন
azd init --template todo-csharp-sql-swa-func

# কনফিগারেশন পর্যালোচনা করুন
cat azure.yaml

# উভয় সার্ভিস মোতায়েন করুন
azd up

# অ্যাপ্লিকেশন খুলুন
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## প্রোডাকশন উদাহরণ

### উদাহরণ 1: মাইক্রোসার্ভিসেস আর্কিটেকচার

**পরিস্থিতি**: একাধিক মাইক্রোসার্ভিস সহ ই-কমার্স অ্যাপ্লিকেশন

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

**স্থাপন:**
```bash
# প্রকল্প আরম্ভ করুন
azd init

# প্রোডাকশন পরিবেশ নির্ধারণ করুন
azd env new production

# প্রোডাকশন সেটিংস কনফিগার করুন
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# সব সেবা স্থাপন করুন
azd up

# স্থাপনার মনিটরিং করুন
azd monitor --overview
```

### উদাহরণ 2: AI পরিচালিত কন্টেইনার অ্যাপ

**পরিস্থিতি**: Microsoft Foundry Models ইন্টিগ্রেশন সহ AI চ্যাট অ্যাপ্লিকেশন

**ফাইল: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# নিরাপদ অ্যাক্সেসের জন্য ব্যবস্থাপিত পরিচয় ব্যবহার করুন
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # কী ভল্ট থেকে OpenAI কী গ্রহণ করুন
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

**স্থাপন কমান্ড:**
```bash
# পরিবেশ সেট আপ করুন
azd init --template ai-chat-app
azd env new dev

# OpenAI কনফিগার করুন
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ডিপ্লয় করুন
azd up

# API পরীক্ষা করুন
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### উদাহরণ 3: ব্যাকগ্রাউন্ড ওয়ার্কার কিউ প্রসেসিং সহ

**পরিস্থিতি**: মেসেজ কিউ সহ অর্ডার প্রসেসিং সিস্টেম

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
            # অর্ডার প্রক্রিয়া করুন
            print(f"Processing order: {message.content}")
            
            # বার্তাটি সম্পূর্ণ করুন
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

**স্থাপন:**
```bash
# প্রারম্ভ করুন
azd init

# কিউ কনফিগারেশন সহ মোতায়েন করুন
azd up

# কিউ দৈর্ঘ্য অনুযায়ী কর্মী স্কেল করুন
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## উন্নত প্যাটার্ন

### প্যাটার্ন 1: ব্লু-গ্রিন স্থাপন

```bash
# ট্রাফিক ছাড়াই নতুন সংস্করণ তৈরি করুন
azd deploy api --revision-suffix blue --no-traffic

# নতুন সংস্করণ পরীক্ষা করুন
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ট্রাফিক ভাগ করুন (২০% ব্লুতে, ৮০% কারেন্টে)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# সম্পূর্ণভাবে ব্লুতে পরিবর্তন করুন
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### প্যাটার্ন 2: AZD সহ ক্যানারি স্থাপন

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

**স্থাপনা স্ক্রিপ্ট:**
```bash
#!/bin/bash
# deploy-canary.sh

# ১০% ট্রাফিক নিয়ে নতুন রিভিশন মোতায়েন করুন
azd deploy api --revision-mode multiple

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --service api --duration 5m

# ধীরে ধীরে ট্রাফিক বৃদ্ধি করুন
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ৫ মিনিট অপেক্ষা করুন
done
```

### প্যাটার্ন 3: মাল্টি-রিজিয়ন স্থাপন

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

**স্থাপন:**
```bash
# সকল অঞ্চলে মোতায়েন করুন
azd up

# শেষ বিন্দুগুলো যাচাই করুন
azd show --output json | jq '.services.api.endpoints'
```

### প্যাটার্ন 4: Dapr ইন্টিগ্রেশন

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

## শ্রেষ্ঠ অনুশীলন

### 1. রিসোর্স সংস্থান

```bash
# সুনির্দিষ্ট নামকরণ নিয়ম মেনে চলুন
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# খরচ অনুসরণের জন্য সম্পদগুলোকে ট্যাগ করুন
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. নিরাপত্তার শ্রেষ্ঠ অনুশীলন

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

### 3. কর্মক্ষমতা অপ্টিমাইজেশন

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

### 4. মনিটরিং এবং পর্যবেক্ষণযোগ্যতা

```bash
# অ্যাপ্লিকেশন ইনসাইটস সক্ষম করুন
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# লগগুলি রিয়েল-টাইমে দেখুন
azd monitor --logs
# অথবা কন্টেইনার অ্যাপ্সের জন্য Azure CLI ব্যবহার করুন:
az containerapp logs show --name api --resource-group rg-myapp --follow

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --live

# সতর্কতা তৈরি করুন
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. খরচ অপ্টিমাইজেশন

```bash
# ব্যবহৃত না হলে শূন্যে মাত্রা বাড়ান
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# উন্নয়ন পরিবেশের জন্য স্পট ইনস্টেন্সগুলি ব্যবহার করুন
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# বাজেট সতর্কতা সেট করুন
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ইন্টিগ্রেশন

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

## সাধারণ কমান্ড রেফারেন্স

```bash
# নতুন কনটেইনার অ্যাপ প্রকল্প শুরু করুন
azd init --template <template-name>

# অবকাঠামো এবং অ্যাপ্লিকেশন ডিপ্লয় করুন
azd up

# শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয় করুন (অবকাঠামো এড়িয়ে যান)
azd deploy

# শুধুমাত্র অবকাঠামো প্রস্তুত করুন
azd provision

# ডিপ্লয় করা সংস্থানগুলি দেখুন
azd show

# azd monitor বা Azure CLI ব্যবহার করে লগ স্ট্রিম করুন
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# অ্যাপ্লিকেশন মনিটর করুন
azd monitor --overview

# সংস্থানগুলি পরিষ্কার করুন
azd down --force --purge
```

## সমস্যার সমাধান

### সমস্যা: কন্টেইনার শুরু হতে ব্যর্থ

```bash
# Azure CLI ব্যবহার করে লগগুলি পরীক্ষা করুন
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# কনটেইনার ইভেন্টগুলি দেখুন
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# স্থানীয়ভাবে পরীক্ষা করুন
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### সমস্যা: কন্টেইনার অ্যাপ এন্ডপয়েন্টে প্রবেশাধিকার সম্ভব নয়

```bash
# ইনগ্রেস কনফিগারেশন যাচাই করুন
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# পরীক্ষা করুন অভ্যন্তরীণ ইনগ্রেস সক্রিয় আছে কিনা
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### সমস্যা: কর্মক্ষমতা সমস্যা

```bash
# সম্পদ ব্যবহারের পরীক্ষা করুন
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# সম্পদ বাড়ান
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## অতিরিক্ত রিসোর্স এবং উদাহরণ
- [মাইক্রোসার্ভিসেস উদাহরণ](./microservices/README.md)
- [সাধারণ ফ্লাস্ক API উদাহরণ](./simple-flask-api/README.md)
- [Azure Container Apps ডকুমেন্টেশন](https://learn.microsoft.com/azure/container-apps/)
- [AZD টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [কন্টেইনার অ্যাপস স্যাম্পলস](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep টেমপ্লেট](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## অবদান রাখা

নতুন কন্টেইনার অ্যাপ উদাহরণ অবদান রাখতে:

1. আপনার উদাহরণ সহ একটি নতুন সাবডিরেক্টরি তৈরি করুন
2. সম্পূর্ণ `azure.yaml`, `infra/`, এবং `src/` ফাইল অন্তর্ভুক্ত করুন
3. বিস্তৃত README সহ স্থাপনার নির্দেশিকা যোগ করুন
4. `azd up` দিয়ে স্থাপন পরীক্ষা করুন
5. একটি পুল রিকোয়েস্ট সাবমিট করুন

---

**সাহায্যের প্রয়োজন?** সমর্থন এবং প্রশ্নের জন্য [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) কমিউনিটিতে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই ডকুমেন্টটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করলেও, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসম্পূর্ণতা থাকতে পারে। মূল ডকুমেন্টটি তার নিজস্ব ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে কোনও বিভ্রান্তি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
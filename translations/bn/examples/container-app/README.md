# AZD সহ কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট উদাহরণ

এই ডিরেক্টরিটি Azure Developer CLI (AZD) ব্যবহার করে Azure Container Apps-এ কন্টেইনারাইজড অ্যাপ্লিকেশন ডিপ্লয় করার বিস্তৃত উদাহরণগুলি রাখে। এই উদাহরণগুলো বাস্তব-বিশ্বের প্যাটার্ন, সেরা অনুশীলন, এবং প্রোডাকশন-রেডি কনফিগারেশন প্রদর্শন করে।

## 📚 বিষয়সূচি

- [সংক্ষিপ্তসার](../../../../examples/container-app)
- [প্রয়োজনীয়তা](../../../../examples/container-app)
- [দ্রুত শুরু উদাহরণ](../../../../examples/container-app)
- [প্রোডাকশন উদাহরণ](../../../../examples/container-app)
- [উন্নত প্যাটার্ন](../../../../examples/container-app)
- [সেরা অনুশীলন](../../../../examples/container-app)

## সংক্ষিপ্তসার

Azure Container Apps সম্পূর্ণভাবে পরিচালিত সার্ভারলেস কন্টেইনার প্ল্যাটফর্ম যা আপনাকে ইনফ্রাস্ট্রাকচার না ম্যানেজ করে মাইক্রোসার্ভিস এবং কন্টেইনারাইজড অ্যাপ চালাতে সক্ষম করে। AZD-এর সাথে মিলিয়ে আপনি পাবেন:

- **সরলীকৃত ডিপ্লয়মেন্ট**: একক কমান্ড ইনফ্রাস্ট্রাকচারের সাথে কন্টেইনার ডিপ্লয় করে
- **স্বয়ংক্রিয় স্কেলিং**: HTTP ট্রাফিক বা ইভেন্টের উপর ভিত্তি করে জিরো পর্যন্ত এবং আউট পর্যন্ত স্কেল করে
- **একত্রীকৃত নেটওয়ার্কিং**: বিল্ট-ইন সার্ভিস ডিসকভারি এবং ট্রাফিক স্প্লিটিং
- **ম্যানেজড আইডেন্টিটি**: Azure রিসোর্সগুলোর নিরাপদ প্রমাণীকরণ
- **খরচ অপ্টিমাইজেশন**: আপনি যে রিসোর্স ব্যবহার করবেন শুধুমাত্র তার জন্যই পেমেন্ট করুন

## প্রয়োজনীয়তা

শুরু করার আগে, নিশ্চিত করুন আপনার কাছে আছে:

```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az version

# Docker পরীক্ষা করুন (কাস্টম ইমেজ বিল্ড করার জন্য)
docker --version

# Azure-এ লগইন করুন
azd auth login
az login
```

**প্রয়োজনীয় Azure রিসোর্স:**
- সক্রিয় Azure সাবস্ক্রিপশন
- রিসোর্স গ্রুপ তৈরি করার অনুমতি
- Container Apps পরিবেশ অ্যাক্সেস

## দ্রুত শুরু উদাহরণ

### 1. সরল ওয়েব API (Python Flask)

Azure Container Apps সহ একটি বেসিক REST API ডিপ্লয় করুন।

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
# টেমপ্লেট থেকে ইনিশিয়ালাইজ করুন
azd init --template todo-python-mongo

# ইনফ্রাস্ট্রাকচার প্রস্তুত করুন এবং ডিপ্লয় করুন
azd up

# ডিপ্লয়মেন্ট পরীক্ষা করুন
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**মূল বৈশিষ্ট্যসমূহ:**
- 0 থেকে 10 রেপ্লিকা পর্যন্ত অটো-স্কেলিং
- হেলথ প্রোব এবং লাইভনেস চেক
- এনভায়রনমেন্ট ভেরিয়েবল ইনজেকশন
- Application Insights একত্রীকরণ

### 2. Node.js Express API

MongoDB ইন্টিগ্রেশনের সাথে একটি Node.js ব্যাকএন্ড ডিপ্লয় করুন।

```bash
# Node.js API টেমপ্লেট শুরু করুন
azd init --template todo-nodejs-mongo

# পরিবেশ ভেরিয়েবল কনফিগার করুন
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ডিপ্লয় করুন
azd up

# Azure Monitor ব্যবহার করে লগ দেখুন
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

React ফ্রন্টএন্ড এবং API ব্যাকএন্ড সহ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করুন।

```bash
# পূর্ণ-স্ট্যাক টেমপ্লেট শুরু করুন
azd init --template todo-csharp-sql-swa-func

# কনফিগারেশন পর্যালোচনা করুন
cat azure.yaml

# উভয় সেবা ডিপ্লয় করুন
azd up

# অ্যাপ্লিকেশন খুলুন
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## প্রোডাকশন উদাহরণ

### উদাহরণ 1: মাইক্রোসার্ভিস আর্কিটেকচার

**পরিপ্রেক্ষিত**: একাধিক মাইক্রোসার্ভিস সহ ই-কমার্স অ্যাপ্লিকেশন

**ডিরেক্টরি কাঠামো:**
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
# প্রকল্প আরম্ভ করুন
azd init

# উৎপাদন পরিবেশ নির্ধারণ করুন
azd env new production

# উৎপাদন সেটিংস কনফিগার করুন
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# সমস্ত পরিষেবা মোতায়েন করুন
azd up

# মোতায়েন পর্যবেক্ষণ করুন
azd monitor --overview
```

### উদাহরণ 2: এআই-চালিত কন্টেইনার অ্যাপ

**পরিপ্রেক্ষিত**: Microsoft Foundry Models ইন্টিগ্রেশন সহ এআই চ্যাট অ্যাপ্লিকেশন

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

**ডিপ্লয়মেন্ট কমান্ডসমূহ:**
```bash
# পরিবেশ সেট আপ করুন
azd init --template ai-chat-app
azd env new dev

# OpenAI কনফিগার করুন
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ডিপ্লয় করুন
azd up

# API পরীক্ষা করুন
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### উদাহরণ 3: কিউ প্রসেসিং সহ ব্যাকগ্রাউন্ড ওয়ার্কার

**পরিপ্রেক্ষিত**: মেসেজ কিউ সহ অর্ডার প্রসেসিং সিস্টেম

**ডিরেক্টরি কাঠামো:**
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
# শুরু করুন
azd init

# কাতার কনফিগারেশন সহ স্থাপন করুন
azd up

# কাতারের দৈর্ঘ্য অনুযায়ী ওয়ার্কার স্কেল করুন
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## উন্নত প্যাটার্ন

### প্যাটার্ন 1: ব্লু-গ্রীন ডিপ্লয়মেন্ট

```bash
# ট্রাফিক ছাড়া নতুন রিভিশন তৈরি করুন
azd deploy api --revision-suffix blue --no-traffic

# নতুন রিভিশন পরীক্ষা করুন
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ট্রাফিক ভাগ করুন (২০% ব্লু-এ, ৮০% কারেন্ট-এ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# সম্পূর্ণভাবে ব্লু-তে স্থানান্তর করুন
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### প্যাটার্ন 2: AZD সহ ক্যানারি ডিপ্লয়মেন্ট

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

# ১০% ট্র্যাফিক সহ নতুন রিভিশন ডিপ্লয় করুন
azd deploy api --revision-mode multiple

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --service api --duration 5m

# ট্র্যাফিক ধীরে ধীরে বাড়ান
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ৫ মিনিট অপেক্ষা করুন
done
```

### প্যাটার্ন 3: মাল্টি-রিজিয়ন ডিপ্লয়মেন্ট

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
# সমস্ত অঞ্চলে ডেপ্লয় করুন
azd up

# এন্ডপয়েন্টগুলো যাচাই করুন
azd show --output json | jq '.services.api.endpoints'
```

### প্যাটার্ন 4: Dapr একত্রীকরণ

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
        # অবস্থা সংরক্ষণ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ইভেন্ট প্রকাশ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## সেরা অনুশীলন

### 1. রিসোর্স সংগঠন

```bash
# সামঞ্জস্যপূর্ণ নামকরণ নিয়মাবলী ব্যবহার করুন
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# খরচ ট্র্যাকিংয়ের জন্য রিসোর্সগুলোকে ট্যাগ করুন
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. নিরাপত্তা সেরা অনুশীলন

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

### 3. পারফরম্যান্স অপ্টিমাইজেশন

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

### 4. মনিটরিং এবং অবজারভেবিলিটি

```bash
# Application Insights সক্রিয় করুন
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# রিয়েল-টাইমে লগ দেখুন
azd monitor --logs
# অথবা Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
az containerapp logs show --name api --resource-group rg-myapp --follow

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --live

# এলার্ট তৈরি করুন
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. খরচ অপ্টিমাইজেশন

```bash
# ব্যবহার না হলে শূন্যে স্কেল করুন
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ডেভেলপমেন্ট পরিবেশে স্পট ইনস্ট্যান্স ব্যবহার করুন
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# বাজেট সতর্কতা সেট আপ করুন
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
# নতুন কন্টেইনার অ্যাপ প্রকল্প আরম্ভ করুন
azd init --template <template-name>

# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন ডেপ্লয় করুন
azd up

# শুধুমাত্র অ্যাপ্লিকেশন কোড ডেপ্লয় করুন (ইনফ্রাস্ট্রাকচার বাদ দিয়ে)
azd deploy

# শুধুমাত্র ইনফ্রাস্ট্রাকচার প্রোভিশন করুন
azd provision

# ডেপ্লয় করা রিসোর্সগুলো দেখুন
azd show

# azd monitor অথবা Azure CLI ব্যবহার করে লগ স্ট্রিম করুন
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# অ্যাপ্লিকেশন মনিটর করুন
azd monitor --overview

# রিসোর্সগুলো পরিষ্কার করুন
azd down --force --purge
```

## সমস্যা সমাধান

### সমস্যা: কন্টেইনার চালু হতে ব্যর্থ

```bash
# Azure CLI ব্যবহার করে লগ পরীক্ষা করুন
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# কনটেইনার ইভেন্টগুলো দেখুন
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# স্থানীয়ভাবে পরীক্ষা করুন
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### সমস্যা: কন্টেইনার অ্যাপ এন্ডপয়েন্টে অ্যাক্সেস করা যাচ্ছে না

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

### সমস্যা: পারফরম্যান্স সংক্রান্ত সমস্যা

```bash
# রিসোর্স ব্যবহারের পরীক্ষা করুন
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

## অতিরিক্ত সম্পদ ও উদাহরণ
- [মাইক্রোসার্ভিস উদাহরণ](./microservices/README.md)
- [সহজ Flash API উদাহরণ](./simple-flask-api/README.md)
- [Azure Container Apps ডকুমেন্টেশন](https://learn.microsoft.com/azure/container-apps/)
- [AZD টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [Container Apps নমুনা](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep টেমপ্লেট](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## কন্ট্রিবিউটিং

নতুন কন্টেইনার অ্যাপ উদাহরণ যোগ করতে:

1. আপনার উদাহরণসহ একটি নতুন সাবডিরেক্টরি তৈরি করুন
2. সম্পূর্ণ `azure.yaml`, `infra/`, এবং `src/` ফাইলগুলো অন্তর্ভুক্ত করুন
3. ডিপ্লয়মেন্ট নির্দেশাবলীসহ বিস্তৃত README যোগ করুন
4. `azd up` দিয়ে ডিপ্লয়মেন্ট পরীক্ষা করুন
5. একটি পুল রিকোয়েস্ট সাবমিট করুন

---

**সাহায়তা দরকার?** সমর্থন ও প্রশ্নের জন্য [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) সম্প্রদায়ে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে স্বয়ংক্রিয় অনুবাদে ভুল বা অমিল থাকতে পারে। মূল নথিটিকেই তার মুল ভাষায় কর্তৃপক্ষভুক্ত উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে যে কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
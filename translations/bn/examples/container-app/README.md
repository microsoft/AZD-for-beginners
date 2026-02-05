# AZD দিয়ে কন্টেইনার অ্যাপ ডিপ্লয়মেন্টের উদাহরণ

এই ডিরেক্টরিতে Azure Developer CLI (AZD) ব্যবহার করে Azure Container Apps-এ কন্টেইনারাইজড অ্যাপ্লিকেশন ডিপ্লয় করার জন্য বিস্তারিত উদাহরণ রয়েছে। এই উদাহরণগুলো বাস্তব জীবনের প্যাটার্ন, সেরা অনুশীলন এবং প্রোডাকশন-রেডি কনফিগারেশন প্রদর্শন করে।

## 📚 সূচিপত্র

- [সংক্ষিপ্ত বিবরণ](../../../../examples/container-app)
- [প্রয়োজনীয়তা](../../../../examples/container-app)
- [দ্রুত শুরু উদাহরণ](../../../../examples/container-app)
- [প্রোডাকশন উদাহরণ](../../../../examples/container-app)
- [উন্নত প্যাটার্ন](../../../../examples/container-app)
- [সেরা অনুশীলন](../../../../examples/container-app)

## সংক্ষিপ্ত বিবরণ

Azure Container Apps একটি সম্পূর্ণ পরিচালিত সার্ভারলেস কন্টেইনার প্ল্যাটফর্ম যা আপনাকে মাইক্রোসার্ভিস এবং কন্টেইনারাইজড অ্যাপ্লিকেশন চালাতে সাহায্য করে, অবকাঠামো পরিচালনা করার প্রয়োজন ছাড়াই। AZD-এর সাথে মিলিত হলে আপনি পাবেন:

- **সহজ ডিপ্লয়মেন্ট**: একক কমান্ডে কন্টেইনার এবং অবকাঠামো ডিপ্লয়
- **স্বয়ংক্রিয় স্কেলিং**: HTTP ট্রাফিক বা ইভেন্টের ভিত্তিতে শূন্য থেকে স্কেল আউট
- **ইন্টিগ্রেটেড নেটওয়ার্কিং**: বিল্ট-ইন সার্ভিস ডিসকভারি এবং ট্রাফিক স্প্লিটিং
- **ম্যানেজড আইডেন্টিটি**: Azure রিসোর্সে নিরাপদ প্রমাণীকরণ
- **খরচ অপ্টিমাইজেশন**: শুধুমাত্র ব্যবহৃত রিসোর্সের জন্য অর্থ প্রদান

## প্রয়োজনীয়তা

শুরু করার আগে নিশ্চিত করুন যে আপনার কাছে রয়েছে:

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
- রিসোর্স গ্রুপ তৈরির অনুমতি
- Container Apps পরিবেশে অ্যাক্সেস

## দ্রুত শুরু উদাহরণ

### ১. সাধারণ ওয়েব API (Python Flask)

Azure Container Apps-এ একটি বেসিক REST API ডিপ্লয় করুন।

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

**ডিপ্লয়মেন্ট ধাপসমূহ:**

```bash
# টেমপ্লেট থেকে আরম্ভ করুন
azd init --template todo-python-mongo

# অবকাঠামো প্রস্তুত করুন এবং স্থাপন করুন
azd up

# স্থাপনার পরীক্ষা করুন
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**মূল বৈশিষ্ট্য:**
- ০ থেকে ১০ রিপ্লিকা পর্যন্ত অটো-স্কেলিং
- হেলথ প্রোব এবং লাইভনেস চেক
- এনভায়রনমেন্ট ভেরিয়েবল ইনজেকশন
- অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

### ২. Node.js Express API

MongoDB ইন্টিগ্রেশন সহ একটি Node.js ব্যাকএন্ড ডিপ্লয় করুন।

```bash
# Node.js API টেমপ্লেট আরম্ভ করুন
azd init --template todo-nodejs-mongo

# পরিবেশ ভেরিয়েবল কনফিগার করুন
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# মোতায়েন করুন
azd up

# লগ দেখুন
azd logs api
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

### ৩. স্ট্যাটিক ফ্রন্টএন্ড + API ব্যাকএন্ড

React ফ্রন্টএন্ড এবং API ব্যাকএন্ড সহ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করুন।

```bash
# সম্পূর্ণ-স্ট্যাক টেমপ্লেট আরম্ভ করুন
azd init --template todo-csharp-sql-swa-func

# কনফিগারেশন পর্যালোচনা করুন
cat azure.yaml

# উভয় পরিষেবা স্থাপন করুন
azd up

# অ্যাপ্লিকেশন খুলুন
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## প্রোডাকশন উদাহরণ

### উদাহরণ ১: মাইক্রোসার্ভিস আর্কিটেকচার

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

**ডিপ্লয়মেন্ট:**
```bash
# প্রকল্প আরম্ভ করুন
azd init

# উৎপাদন পরিবেশ সেট করুন
azd env new production

# উৎপাদন সেটিংস কনফিগার করুন
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# সমস্ত পরিষেবা স্থাপন করুন
azd up

# স্থাপনা পর্যবেক্ষণ করুন
azd monitor --overview
```

### উদাহরণ ২: AI-চালিত কন্টেইনার অ্যাপ

**পরিস্থিতি**: Azure OpenAI ইন্টিগ্রেশন সহ AI চ্যাট অ্যাপ্লিকেশন

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
    
    # কী ভল্ট থেকে ওপেনএআই কী পান
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

**ডিপ্লয়মেন্ট কমান্ড:**
```bash
# পরিবেশ সেট আপ করুন
azd init --template ai-chat-app
azd env new dev

# ওপেনএআই কনফিগার করুন
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# মোতায়েন করুন
azd up

# API পরীক্ষা করুন
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### উদাহরণ ৩: ব্যাকগ্রাউন্ড ওয়ার্কার এবং কিউ প্রসেসিং

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
            
            # বার্তা সম্পন্ন করুন
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

**ডিপ্লয়মেন্ট:**
```bash
# আরম্ভ করুন
azd init

# সারি কনফিগারেশন সহ স্থাপন করুন
azd up

# সারির দৈর্ঘ্যের উপর ভিত্তি করে কর্মী স্কেল করুন
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## উন্নত প্যাটার্ন

### প্যাটার্ন ১: ব্লু-গ্রিন ডিপ্লয়মেন্ট

```bash
# নতুন সংস্করণ তৈরি করুন ট্রাফিক ছাড়াই
azd deploy api --revision-suffix blue --no-traffic

# নতুন সংস্করণ পরীক্ষা করুন
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ট্রাফিক ভাগ করুন (২০% নীল, ৮০% বর্তমান)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# সম্পূর্ণ পরিবর্তন নীলের দিকে
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### প্যাটার্ন ২: AZD সহ ক্যানারি ডিপ্লয়মেন্ট

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

**ডিপ্লয়মেন্ট স্ক্রিপ্ট:**
```bash
#!/bin/bash
# deploy-canary.sh

# নতুন সংস্করণ ১০% ট্রাফিক সহ স্থাপন করুন
azd deploy api --revision-mode multiple

# মেট্রিক পর্যবেক্ষণ করুন
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

### প্যাটার্ন ৩: মাল্টি-রিজিওন ডিপ্লয়মেন্ট

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

**ডিপ্লয়মেন্ট:**
```bash
# সমস্ত অঞ্চলে স্থাপন করুন
azd up

# এন্ডপয়েন্টগুলি যাচাই করুন
azd show --output json | jq '.services.api.endpoints'
```

### প্যাটার্ন ৪: Dapr ইন্টিগ্রেশন

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

## সেরা অনুশীলন

### ১. রিসোর্স সংগঠন

```bash
# সামঞ্জস্যপূর্ণ নামকরণের রীতি ব্যবহার করুন
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# খরচ ট্র্যাকিংয়ের জন্য সম্পদ ট্যাগ করুন
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### ২. নিরাপত্তা সেরা অনুশীলন

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

### ৩. পারফরম্যান্স অপ্টিমাইজেশন

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

### ৪. মনিটরিং এবং পর্যবেক্ষণ

```bash
# অ্যাপ্লিকেশন ইনসাইটস সক্রিয় করুন
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# রিয়েল-টাইমে লগ দেখুন
azd logs api --follow

# মেট্রিক্স পর্যবেক্ষণ করুন
azd monitor --service api

# সতর্কতা তৈরি করুন
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### ৫. খরচ অপ্টিমাইজেশন

```bash
# ব্যবহার না হলে শূন্যে স্কেল করুন
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ডেভেলপমেন্ট পরিবেশের জন্য স্পট ইনস্ট্যান্স ব্যবহার করুন
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# বাজেট সতর্কতা সেট আপ করুন
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### ৬. CI/CD ইন্টিগ্রেশন

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

# অবকাঠামো এবং অ্যাপ্লিকেশন স্থাপন করুন
azd up

# শুধুমাত্র অ্যাপ্লিকেশন কোড স্থাপন করুন (অবকাঠামো বাদ দিন)
azd deploy

# শুধুমাত্র অবকাঠামো প্রস্তুত করুন
azd provision

# স্থাপিত সম্পদ দেখুন
azd show

# লগ স্ট্রিম করুন
azd logs <service-name> --follow

# অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
azd monitor --overview

# সম্পদ পরিষ্কার করুন
azd down --force --purge
```

## সমস্যা সমাধান

### সমস্যা: কন্টেইনার শুরু করতে ব্যর্থ

```bash
# লগগুলি পরীক্ষা করুন
azd logs api --tail 100

# কন্টেইনার ইভেন্টগুলি দেখুন
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

# পরীক্ষা করুন অভ্যন্তরীণ ইনগ্রেস সক্রিয় কিনা
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### সমস্যা: পারফরম্যান্স সমস্যা

```bash
# রিসোর্স ব্যবহারের পরীক্ষা করুন
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# রিসোর্স বৃদ্ধি করুন
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## অতিরিক্ত রিসোর্স এবং উদাহরণ
- [মাইক্রোসার্ভিস উদাহরণ](./microservices/README.md)
- [সাধারণ Flask API উদাহরণ](./simple-flask-api/README.md)
- [Azure Container Apps ডকুমেন্টেশন](https://learn.microsoft.com/azure/container-apps/)
- [AZD টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [Container Apps নমুনা](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep টেমপ্লেট](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## অবদান রাখা

নতুন কন্টেইনার অ্যাপ উদাহরণ যোগ করতে:

1. আপনার উদাহরণ সহ একটি নতুন সাবডিরেক্টরি তৈরি করুন
2. সম্পূর্ণ `azure.yaml`, `infra/`, এবং `src/` ফাইল অন্তর্ভুক্ত করুন
3. ডিপ্লয়মেন্ট নির্দেশনা সহ বিস্তারিত README যোগ করুন
4. `azd up` দিয়ে ডিপ্লয়মেন্ট পরীক্ষা করুন
5. একটি পুল রিকোয়েস্ট জমা দিন

---

**সাহায্য দরকার?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) কমিউনিটিতে যোগ দিন সহায়তা এবং প্রশ্নের জন্য।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়ী থাকব না।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
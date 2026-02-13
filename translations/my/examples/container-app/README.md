# AZD ဖြင့် Container App တာဝန်ပေး ပုံများ

ဤ ဒါရိုက်တာတွင် Azure Developer CLI (AZD) ကို အသုံးပြု၍ Azure Container Apps သို့ ကွန်တိန်နာ အက်ပ်များကို တပ်ဆင်ရာတွင် အသုံးဝင်သော ပြည့်စုံသည့် ဥပမာများပါဝင်သည်။ ဤဥပမာများသည် အကောင်အထည်ဖော်ရန် သင့်လျော်သော ပုံစံများ၊ အကောင်းဆုံး လေ့ကျင့်မှုများနှင့် ထုတ်လုပ်မှုပိုင်း အဆင်သင့် ဖွဲ့စည်းမှုများကို ပြသသည်။

## 📚 အကြောင်းအရာ စာရင်း

- [အနှစ်ချုပ်](../../../../examples/container-app)
- [လိုအပ်ချက်များ](../../../../examples/container-app)
- [လျှင်မြန် စတင် ဥပမာများ](../../../../examples/container-app)
- [ထုတ်လုပ်မှု ဥပမာများ](../../../../examples/container-app)
- [တိုးတက်သော ပုံစံများ](../../../../examples/container-app)
- [အကောင်းဆုံး အလေ့အကျင့်များ](../../../../examples/container-app)

## အနှစ်ချုပ်

Azure Container Apps သည် အပြည့်အစုံ စီမံခန့်ခွဲထားသည့် serverless ကွန်တိန်နာပလက်ဖောင်းဖြစ်ပြီး မိโခဆိုက်ဆာဝစ်များနှင့် ကွန်တိန်နာ အက်ပ်များကို အခြေခံအင်ဖရန်စထရပ် မစီမံဘဲ ဖြည့်ဆည်းပြေးနိုင်စေသည်။ AZD နှင့် တွဲဖက်သည့်အခါ သင်ရရှိမည့် အကျိုးအမြတ်များမှာ -

- **တပ်ဆင်မှုကို ရိုးရှင်းစေခြင်း**: တစ်ခုသော command ဖြင့် ကွန်တိန်နာများနှင့် အင်ဖရာစထရပ်ကို တပြိုင်နက် တပ်ဆင်ပေးသည်
- **အလိုအလျောက် တိုးချဲ့ခြင်း**: HTTP traffic သို့မဟုတ် အဖြစ်အပျက်များအပေါ် အခြေခံ၍ zero ထိ ဆိမ့်ချထားရန်နှင့် တိုးချဲ့ရန် စီမံနိုင်သည်
- **ပေါင်းစည်းထားသည့် ကွန်ယက်ဆက်သွယ်မှု**: စာဝန်ဆောင်မှု ရှာဖွေရေးနှင့် traffic ဗဟိုခွဲခြားမှု အတွင်းပေါင်းစည်းထားသည်
- **စီမံထားသည့် အကြောင်းအရာ အတိုင်ပင်ခံ**: Azure အရင်းအမြစ်များသို့ လုံခြုံစိတ်ချသော authentication ပေးသည်
- **ကုန်ကျစရိတ် ထိန်းသိမ်းမှု**: သုံးစွဲသည့် အရင်းအမြစ်များအတွက်သာ ပေးချေပါ

## လိုအပ်ချက်များ

စတင်မီ အောက်ပါ အချက်များ ရှိကြောင်း သေချာပါစေ -

```bash
# AZD ထည့်သွင်းထားမှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az version

# Docker ကို စစ်ဆေးပါ (စိတ်ကြိုက် image များ ဖန်တီးရန်)
docker --version

# Azure သို့ လော့ဂ်အင် ဝင်ပါ
azd auth login
az login
```

**လိုအပ်သော Azure အရင်းအမြစ်များ:**
- အသက်ဝင်သည့် Azure subscription
- Resource group ဖန်တီးခွင့်
- Container Apps ပတ်ဝန်းကျင် ထိန်းကျောင်းခွင့်

## လျှင်မြန် စတင် ဥပမာများ

### 1. ရိုးရှင်းသော Web API (Python Flask)

Azure Container Apps ဖြင့် အခြေခံ REST API တစ်ခုကို တပ်ဆင်ပါ။

**ဥပမာ: Python Flask API**

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

**တပ်ဆင်ခြင်း အဆင့်များ:**

```bash
# နမူနာမှ စတင်ပြုလုပ်ရန်
azd init --template todo-python-mongo

# အောက်ခံအဆောက်အအုံကို စီမံထည့်သွင်းပြီး တပ်ဆင်ရန်
azd up

# တပ်ဆင်မှုကို စမ်းသပ်ရန်
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**အဓိက လက္ခဏာများ:**
- 0 မှ 10 replica အထိ အလိုအလျောက် တိုးချဲ့နိုင်ခြင်း
- Health probes နှင့် liveness စစ်ဆေးမှုများ
- ပတ်ဝန်းကျင် (environment) ကိန်းတန်ဖိုးများ ထည့်သွင်းပေးခြင်း
- Application Insights တွဲဖက် အသုံးပြုခြင်း

### 2. Node.js Express API

MongoDB တွဲဖက်ထားသည့် Node.js backend ကို တပ်ဆင်ပါ။

```bash
# Node.js API ပုံစံကို စတင်ပြုလုပ်ပါ
azd init --template todo-nodejs-mongo

# ပတ်ဝန်းကျင် တန်ဖိုးများကို ပြင်ဆင်ပါ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ဖြန့်ချိပါ
azd up

# Azure Monitor မှတဆင့် လော့ဂ်များကို ကြည့်ရှုပါ
azd monitor --logs
```

**အင်ဖရာစထရပ် အဓိက အချက်များ:**
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

React frontend နှင့် API backend ပါဝင်သည့် စုံလင်သော application တစ်ခုကို တပ်ဆင်ပါ။

```bash
# full-stack နမူနာကို စတင်ပြုလုပ်ပါ
azd init --template todo-csharp-sql-swa-func

# ချိန်ညှိချက်များကို ပြန်လည်သုံးသပ်ပါ
cat azure.yaml

# ဝန်ဆောင်မှုနှစ်ခုစလုံးကို ဖြန့်ချိပါ
azd up

# အပလီကေးရှင်းကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ထုတ်လုပ်မှု ဥပမာများ

### ဥပမာ 1: Microservices ဖွဲ့စည်းပုံ

**အခြေအနေ**: မျိုးစုံ microservices များဖြင့် E-commerce အက်ပ်တည်ဆောက်ခြင်း

**ဖိုင်ဖွဲ့စည်းပုံ:**
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

**azure.yaml ဖွဲ့စည်းချက်:**
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

**တပ်ဆင်ရန်:**
```bash
# ပရောဂျက်ကို စတင်ပါ
azd init

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်ကို သတ်မှတ်ပါ
azd env new production

# ထုတ်လုပ်ရေး ဆက်တင်များကို ဖွဲ့စည်းပါ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd up

# ဖြန့်ချိမှုကို စောင့်ကြည့်ပါ
azd monitor --overview
```

### ဥပမာ 2: AI ဆိုင်ရာ Container App

**အခြေအနေ**: Azure OpenAI တွဲဖက်ထားသည့် AI စကားပြော အက်ပ်

**ဖိုင်: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Managed Identity ကို လုံခြုံစိတ်ချစွာ ဝင်ရောက်ရန် အသုံးပြုပါ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault မှ OpenAI ကီးကို ရယူပါ
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

**ဖိုင်: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ဖိုင်: infra/main.bicep**
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

**တပ်ဆင်ရေး အမိန့်များ:**
```bash
# ပတ်ဝန်းကျင်ကို ပြင်ဆင်ပါ
azd init --template ai-chat-app
azd env new dev

# OpenAI ကို ပြင်ဆင်ပါ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# တပ်ဆင်ပါ
azd up

# API ကို စမ်းသပ်ပါ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ဥပမာ 3: Queue ကို အသုံးပြုသော Background Worker

**အခြေအနေ**: မက်ဆေ့ခ်် queue ဖြင့် အော်ဒါ ပြုလုပ်စီမံရေး စနစ်

**ဖိုင်ဖွဲ့စည်းပုံ:**
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

**ဖိုင်: src/worker/processor.py**
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
            # အမှာစာကို လုပ်ဆောင်ပါ
            print(f"Processing order: {message.content}")
            
            # မက်ဆေ့ခ်ျအား ပြီးစီးပါ
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ဖိုင်: azure.yaml**
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

**တပ်ဆင်ရန်:**
```bash
# စတင်ရန်
azd init

# တန်းစနစ်ဖွဲ့စည်းပုံဖြင့် တပ်ဆင်ခြင်း
azd up

# တန်းအရှည်ပေါ်မူတည်၍ worker များကို တိုးချဲ့ခြင်း
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## တိုးတက်သော ပုံစံများ

### ပုံစံ 1: Blue-Green တပ်ဆင်မှု

```bash
# traffic မပေးဘဲ revision အသစ်တစ်ခု ဖန်တီးပါ
azd deploy api --revision-suffix blue --no-traffic

# revision အသစ်ကို စမ်းသပ်ပါ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# traffic ကို ခွဲပေးပါ (20% ကို blue သို့၊ 80% ကို current သို့)
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

### ပုံစံ 2: AZD ဖြင့် Canary တပ်ဆင်မှု

**ဖိုင်: .azure/dev/config.json**
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

**တပ်ဆင်ရေး script:**
```bash
#!/bin/bash
# deploy-canary.sh

# ဗားရှင်းအသစ်ကို ထရက်ဖစ် 10% ဖြင့် ဖြန့်ချေပါ
azd deploy api --revision-mode multiple

# မက်ထရစ်များကို စောင့်ကြည့်ပါ
azd monitor --service api --duration 5m

# ထရက်ဖစ်ကို တဖြည်းဖြည်း တိုးမြှင့်ပါ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ၅ မိနစ် စောင့်ပါ
done
```

### ပုံစံ 3: ဒေသအများပြား တပ်ဆင်မှု

**ဖိုင်: azure.yaml**
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

**ဖိုင်: infra/multi-region.bicep**
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

**တပ်ဆင်ရန်:**
```bash
# ဒေသအားလုံးသို့ ဖြန့်ချိပါ
azd up

# endpoints များကို စစ်ဆေးပါ
azd show --output json | jq '.services.api.endpoints'
```

### ပုံစံ 4: Dapr တွဲဖက်မှု

**ဖိုင်: infra/app/dapr-enabled.bicep**
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

**Dapr ပါဝင်သည့် အက်ပ်ကုဒ်:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # အခြေအနေကို သိမ်းဆည်းရန်
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

## အကောင်းဆုံး အလေ့အကျင့်များ

### 1. အရင်းအမြစ် စီမံခန့်ခွဲမှု

```bash
# တစ်စွဲတည်းသော အမည်ပေးစည်းမျဉ်းများကို အသုံးပြုပါ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ကုန်ကျစရိတ် တွက်ချက်ရန် အရင်းအမြစ်များကို အမှတ်အသားပေးပါ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. လုံခြုံရေး အကောင်းဆုံး လက်တွေ့ကျကျ

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

### 3. လုပ်ဆောင်ချက် တိုးတက်စေခြင်း

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

### 4. စောင့်ကြည့်မှုနှင့် ကြည့်နိုင်မှု

```bash
# Application Insights ကို ဖွင့်ပါ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# လော့ဂ်များကို တိုက်ရိုက် ကြည့်ရှုပါ
azd monitor --logs
# သို့မဟုတ် Container Apps အတွက် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# မက်ထရစ်များကို စောင့်ကြည့်ပါ
azd monitor --live

# အသိပေးချက်များ ဖန်တီးပါ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ကုန်ကျစရိတ် ထိန်းသိမ်းခြင်း

```bash
# အသုံးမပြုသောအချိန်တွင် အရွယ်အစားကို သုညအထိ လျော့ချပါ
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

### 6. CI/CD တွဲဖက်မှု

**GitHub Actions ဥပမာ:**
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

## အသုံးများသော အမိန့်များ

```bash
# container app အသစ်အတွက် ပရောဂျက်ကို စတင်ဖန်တီးပါ
azd init --template <template-name>

# အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို တပ်ဆင်ပါ
azd up

# အက်ပလီကေးရှင်းကုဒ်သာ တပ်ဆင်ပါ (အခြေခံအဆောက်အအုံကို ကျော်လွှားပါ)
azd deploy

# အခြေခံအဆောက်အအုံသာ ပံ့ပိုးတည်ဆောက်ပါ
azd provision

# တပ်ဆင်ပြီးသော အရင်းအမြစ်များကို ကြည့်ရှုပါ
azd show

# azd monitor သို့မဟုတ် Azure CLI အသုံးပြု၍ လော့ဂ်များကို စီးဆင်းကြည့်ပါ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# အက်ပလီကေးရှင်းကို ကြီးကြပ်ပါ
azd monitor --overview

# အရင်းအမြစ်များကို ရှင်းလင်းပါ
azd down --force --purge
```

## ပြဿနာဖြေရှင်းခြင်း

### ပြဿနာ: Container စတင် မနိုင်ခြင်း

```bash
# Azure CLI ကို အသုံးပြု၍ လော့ဂ်များ စစ်ဆေးပါ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ကွန်တိန်နာ အဖြစ်အပျက်များ ကြည့်ရှုပါ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# သင့်စက်ပေါ်တွင် စမ်းသပ်ပါ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ပြဿနာ: Container app endpoint သို့ ဝင်ရောက် မရခြင်း

```bash
# ingress ဖွဲ့စည်းမှုကို စစ်ဆေးပါ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# အတွင်းပိုင်း ingress ကို ဖွင့်ထားပြီးသားလား စစ်ဆေးပါ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ပြဿနာ: လုပ်ဆောင်ချက် ပြဿနာများ

```bash
# အရင်းအမြစ်အသုံးပြုမှုကို စစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# အရင်းအမြစ်များကို တိုးမြှင့်ပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## အပို အရင်းအမြစ်များနှင့် ဥပမာများ
- [Microservices ဥပမာ](./microservices/README.md)
- [ရိုးရှင်းသော Flash API ဥပမာ](./simple-flask-api/README.md)
- [Azure Container Apps စာတမ်း](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates ပြခန်း](https://azure.github.io/awesome-azd/)
- [Container Apps နမူနာများ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## အထောက်အပံ့ပေးရန်

Container app ဥပမာအသစ်များ ပံ့ပိုးပေးလိုပါက -

1. သင့် ဥပမာအတွက် စက်လေးအသစ်တစ်ခု ဖန်တီးပါ
2. ပြည့်စုံသော `azure.yaml`, `infra/`, နှင့် `src/` ဖိုင်များ ထည့်သွင်းပါ
3. တပ်ဆင်သည့် အဆင့်များ ပါသော README အပြည့်အစုံ ထည့်ပါ
4. `azd up` ဖြင့် တပ်ဆင်မှုကို စမ်းသပ်ပါ
5. Pull request တင်ပါ

---

**အကူအညီ လိုပါသလား?** အထောက်အပံ့နှင့် မေးခွန်းများအတွက် [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) အသိုင်းအဝိုင်းသို့ ဝင်ရောက်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်မယူကြောင်း အသိပေးချက်

ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို ၎င်း၏ မူလဘာသာဖြင့် အာဏာသက်သေ အရင်းအမြစ်အဖြစ် ထင်မြင်ရမည်ဖြစ်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကုမ္ပဏီ/ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်မှ ဘာသာပြန်ပေးရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုရာမှ ဖြစ်ပေါ်နိုင်သည့် နားလည်မှုမမှန်ခြင်းများ သို့မဟုတ် မှားယွင်းသော ပြဿနာများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
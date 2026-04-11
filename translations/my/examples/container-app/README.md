# AZD ဖြင့် Container App တပ်ဆင်ရေး ဥပမာများ

ဤ ဒိုင်ရက်ထရီသည် Azure Developer CLI (AZD) ကို အသုံးပြု၍ Azure Container Apps သို့ ကွန်တိန်နာပြုလုပ်ထားသည့် အက်ပလီကေးရှင်းများကို တပ်ဆင်ရန် စုံလင်သော ဥပမာများကို ပါဝင်သည်။ ဤဥပမာများတွင် အကောင့်လက်တွေ့ ပုံစံများ၊ အကောင်းဆုံး လက်တွေ့ကျမှုများနှင့် ထုတ်လုပ်မှုအဆင့်သင့် ဖွဲ့စည်းမှုများကို ပြသထားသည်။

## 📚 အကြောင်းအရာ စာရင်း

- [အကျဉ်းချုံး](#အကျဉ်းချုံး)
- [လိုအပ်ချက်များ](#လိုအပ်ချက်များ)
- [လျင်မြန်စတင်နိုင်သော ဥပမာများ](#လျင်မြန်စတင်-နမူနာများ)
- [ထုတ်လုပ်မှု ဥပမာများ](#ထုတ်လုပ်မှု-ဥပမာများ)
- [အဆင့်မြင့် ပုံစံများ](#အဆင့်မြင့်-ပုံစံများ)
- [အကောင်းဆုံး လေ့ကျင့်မှုများ](#အကောင်းဆုံး-လေ့ကျင့်မှုများ)

## အကျဉ်းချုံး

Azure Container Apps သည် infrastructure ကို စီမံရန်မလိုဘဲ မိုက်ခရိုဆာဗစ်များနှင့် ကွန်တိန်နာအခြေခံ အက်ပလီကေးရှင်းများကို တည်းဖြတ်ရန် সক্ষমစေသည့် အပြည့်အစုံ စီမံခန့်ခွဲထားသော serverless ကွန်တိန်နာ ပလက်ဖောင်းတစ်ခုဖြစ်သည်။ AZD နှင့် တွဲဖက်အသုံးပြုပါက အောက်ပါအကျိုးများကို ရရှိပါသည်။

- **ရိုးရှင်းသော တပ်ဆင်ခြင်း**: တစ်ချက်တည်းဖြင့် ကွန်တိန်နာများနှင့် အင်ဖရားကို တပ်ဆင်နိုင်သည်
- **အလိုအလျောက် စကေးချ်ခြင်း**: HTTP traffic သို့မဟုတ် events အပေါ် မူတည်၍ zero ထိ scale လုပ်နိုင်ခြင်းနှင့် ကြီးမြတ်စွာချဲ့ထွင်နိုင်ခြင်း
- **တပ်ဆင်ထားသော ကွန်ယက်ဆက်သွယ်မှု**: 内蔵 စနစ် service discovery နှင့် traffic splitting
- **စီမံခန့်ခွဲထားသော Identity**: Azure အရင်းအမြစ်များသို့ လုံခြုံစိတ်ချစွာ authentication ပြုလုပ်နိုင်ခြင်း
- **ကုန်ကျစရိတ် ထိရောက်စေခြင်း**: သင်အသုံးပြုသည့် အရင်းအမြစ်များအတွက်သာ ပေးငွေချေစေရန်

## လိုအပ်ချက်များ

စတင်ရန်မပြုမီ အောက်ပါအချက်များ ရှိ/စစ်ဆေးထားကြောင်း သေချာပါစေ။

```bash
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az version

# Docker ကို စစ်ဆေးပါ (စိတ်ကြိုက် image များ ဆောက်ရန်)
docker --version

# AZD တင်ပို့မှုများအတွက် အတည်ပြုပါ
azd auth login

# ရွေးချယ်နိုင်သည်: az အမိန့်များကို တိုက်ရိုက် ဆောင်ရွက်ရန် စီစဉ်ထားပါက Azure CLI သို့ စာရင်းဝင်ပါ
az login
```

**လိုအပ်သော Azure အရင်းအမြစ်များ:**
- အသုံးပြုနိုင်သော Azure subscription
- Resource group ဖန်တီးခွင့်
- Container Apps environment ကို အသုံးပြုခွင့်

## လျင်မြန်စတင် နမူနာများ

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
# ပုံစံမှ စတင်ပါ
azd init --template todo-python-mongo

# အောက်ဆောက်လုပ်ရေးကို စီစဉ်ပံ့ပိုးပြီး ဖြန့်ချိပါ
azd up

# တပ်ဆင်မှုကို စမ်းသပ်ပါ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**အဓိက လက္ခဏာများ:**
- 0 မှ 10 replicas အထိ အလိုအလျောက် စကေးချ်ခြင်း
- health probes နှင့် liveness စစ်ဆေးမှုများ
- environment variable များ ထည့်သွင်းခြင်း
- Application Insights နှင့် ပေါင်းစည်းထားခြင်း

### 2. Node.js Express API

MongoDB ပေါင်းစည်းထားသော Node.js backend ကို တပ်ဆင်ပါ။

```bash
# Node.js API စံနမူနာကို စတင်တည်ဆောက်ပါ
azd init --template todo-nodejs-mongo

# ပတ်ဝန်းကျင် အပြောင်းအလဲများကို သတ်မှတ်ပါ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ဖြန့်ချိပါ
azd up

# Azure Monitor မှတဆင့် မှတ်တမ်းများကို ကြည့်ရှုပါ
azd monitor --logs
```

**အင်ဖရာစထက် အထူးအချက်များ:**
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

### 3. Static Frontend နှင့် API Backend

React frontend နှင့် API backend ပါရှိသည့် full-stack application တစ်ခုကို တပ်ဆင်ပါ။

```bash
# full-stack template ကို အစပြုပါ
azd init --template todo-csharp-sql-swa-func

# configuration ကို ပြန်လည်သုံးသပ်ပါ
cat azure.yaml

# ဝန်ဆောင်မှုနှစ်ခုကို ဖြန့်ချိပါ
azd up

# အက်ပလီကေးရှင်းကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ထုတ်လုပ်မှု ဥပမာများ

### ဥပမာ 1: မိုက်ခရိုဆာဗစ် ဖွဲ့စည်းပုံ

**အခြေအနေ**: မိုက်ခရိုဆာဗစ်များစွာပါရှိသည့် E-commerce application

**ဖိုင်ဖွဲ့စည်းမှု:**
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

**azure.yaml ဖွဲ့စည်းမှု:**
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

**တပ်ဆင်မှု:**
```bash
# ပရောဂျက်ကို စတင်ပြင်ဆင်ပါ
azd init

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်ကို သတ်မှတ်ပါ
azd env new production

# ထုတ်လုပ်ရေး ဆက်တင်များကို ဖွဲ့စည်းပါ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd up

# ဖြန့်ချိမှုကို စောင့်ကြည့်ပါ
azd monitor --overview
```

### ဥပမာ 2: AI စွမ်းအားဖြင့် လုပ်ဆောင်သော Container App

**အခြေအနေ**: Microsoft Foundry Models ဖြင့် ပေါင်းစည်းထားသော AI chat application

**ဖိုင်: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# လုံခြုံစိတ်ချစွာ ဝင်ရောက်မှုအတွက် Managed Identity ကို အသုံးပြုပါ
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

**တပ်ဆင်ရန် အမိန့်များ:**
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

### ဥပမာ 3: Queue ဆိုင်ရာ ကိုင်တွယ်မှုနှင့် အနောက်ခံ Worker

**အခြေအနေ**: message queue ပါရှိသော အမှာစာ စီမံရေး စနစ်

**ဖိုင်ဖွဲ့စည်းမှု:**
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
            # အော်ဒါကို ဆောင်ရွက်ရန်
            print(f"Processing order: {message.content}")
            
            # မက်ဆေ့ခ်ျ အပြည့်အစုံ
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

**တပ်ဆင်မှု:**
```bash
# အစပြု
azd init

# တန်းစီဖော်ပြချက်နှင့်အတူ တပ်ဆင်ပါ
azd up

# အလုပ်သမားများ၏ အရေအတွက်ကို တန်းအရှည်အပေါ် မူတည်၍ တိုးချဲ့ပါ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## အဆင့်မြင့် ပုံစံများ

### ပုံစံ 1: Blue-Green Deployment

```bash
# traffic မပေးဘဲ ပြုပြင်ချက်အသစ်တစ်ခု ဖန်တီးပါ
azd deploy api --revision-suffix blue --no-traffic

# ပြုပြင်ချက်အသစ်ကို စမ်းသပ်ပါ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# traffic ကို ခွဲဝေပါ (blue သို့ 20%, current သို့ 80%)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# လုံးဝအားဖြင့် blue သို့ ပြောင်းရွှေ့ပါ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ပုံစံ 2: AZD ဖြင့် Canary Deployment

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

**တပ်ဆင်ရေး Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# အသစ်ဗားရှင်းကို အသုံးပြုသူ traffic 10% ဖြင့် တင်ပို့ပါ
azd deploy api --revision-mode multiple

# မက်ထရစ်များကို စောင့်ကြည့်ပါ
azd monitor --service api --duration 5m

# traffic ကို တဖြည်းဖြည်း တိုးမြှင့်ပါ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 မိနစ် စောင့်ပါ
done
```

### ပုံစံ 3: Multi-Region Deployment

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

**တပ်ဆင်မှု:**
```bash
# ဒေသအားလုံးသို့ တပ်ဆင်ပါ
azd up

# အဆုံးအချက်များကို စစ်ဆေးပါ
azd show --output json | jq '.services.api.endpoints'
```

### ပုံစံ 4: Dapr ပေါင်းစည်းခြင်း

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

**Dapr နှင့်အတူ အသုံးပြုသည့် Application ကုဒ်:**
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
        
        # အဖြစ်အပျက်ကို ထုတ်ပြန်ရန်
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## အကောင်းဆုံး လေ့ကျင့်မှုများ

### 1. အရင်းအမြစ် အဖွဲ့ဖွဲ့စည်းမှု

```bash
# အမည်ပေးစံနစ်များကို ညီညွတ်စွာ အသုံးပြုပါ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ကုန်ကျစရိတ် စောင့်ကြည့်ရန် အရင်းအမြစ်များကို အမှတ်အသားပေးပါ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. လုံခြုံရေး အကောင်းဆုံး လက်တွေ့ အချက်များ

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

### 3. စွမ်းဆောင်ရည် တိုးတက်စေခြင်း

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

### 4. ကြပ်ကြည့်ခြင်းနှင့် တွေ့မြင်နိုင်မှု

```bash
# Application Insights ကို ဖွင့်ပါ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# လော့ဂ်များကို တိုက်ရိုက် ကြည့်ရှုပါ
azd monitor --logs
# သို့မဟုတ် Container Apps အတွက် Azure CLI ကို အသုံးပြုပါ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# မီထရစ်များကို စောင့်ကြည့်ပါ
azd monitor --live

# အသိပေးချက်များကို ဖန်တီးပါ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ကုန်ကျစရိတ် အဆင်ပြေမှု

```bash
# မအသုံးမပြုသောအချိန်တွင် အရွယ်အစားကို သုညအထိ လျော့ချပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်များအတွက် spot instances များကို အသုံးပြုပါ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ဘတ်ဂျက် သတိပေးချက်များကို စတင်တပ်ဆင်ပါ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ပေါင်းစည်းခြင်း

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

## သာမာန် အမိန့်များ အညွှန်း

```bash
# container app ပရောဂျက်အသစ် စတင်ဖန်တီးရန်
azd init --template <template-name>

# အဆောက်အအုံနှင့် အပလီကေးရှင်း တင်ပို့ရန်
azd up

# အပလီကေးရှင်းကုဒ်ပဲ တင်ပို့ရန် (အဆောက်အအုံကို ကျော်လွှားရန်)
azd deploy

# အဆောက်အအုံပဲ ပြင်ဆင်ထည့်သွင်းရန်
azd provision

# တင်ထားသော အရင်းအမြစ်များ ကြည့်ရှုရန်
azd show

# azd monitor သို့မဟုတ် Azure CLI ဖြင့် လော့ဂ်များ စီးဆင်းကြည့်ရန်
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# အပလီကေးရှင်းကို စောင့်ကြည့်ရန်
azd monitor --overview

# အရင်းအမြစ်များ ဖျက်ရှင်းရန်
azd down --force --purge
```

## ပြဿနာရှာဖွေခြင်း

### ပြဿနာ: ကွန်တိန်နာ စတင်မရ

```bash
# Azure CLI ဖြင့် လော့ဂ်များကို စစ်ဆေးပါ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ကွန်တိန်နာဖြစ်ရပ်များကို ကြည့်ရှုပါ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ကိုယ်ပိုင်စက်ပေါ်တွင် စမ်းသပ်ပါ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ပြဿနာ: Container app endpoint ကို ဝင်ရောက်မရခြင်း

```bash
# Ingress ဖွဲ့စည်းတပ်ဆင်မှုကို စစ်ဆေးပြီး အတည်ပြုပါ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# အတွင်းပိုင်း Ingress ကို ဖွင့်ထားမှန်း စစ်ဆေးပါ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ပြဿနာ: စွမ်းဆောင်ရည် ပြဿနာများ

```bash
# အရင်းအမြစ်အသုံးချမှုကိုစစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# အရင်းအမြစ်များကိုတိုးမြှင့်ပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ထပ်တိုး အရင်းအမြစ်များနှင့် ဥပမာများ
- [မိုက်ခရိုဆာဗစ် ဥပမာ](./microservices/README.md)
- [ရိုးရှင်းသော Flash API ဥပမာ](./simple-flask-api/README.md)
- [Azure Container Apps စာတမ်းများ](https://learn.microsoft.com/azure/container-apps/)
- [AZD Template များ ပြတိုက်](https://azure.github.io/awesome-azd/)
- [Container Apps နမူနာများ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Template များ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## အထောက်အပံ့ပေးခြင်း

Container app ဥပမာအသစ်များထည့်ရန် -

1. သင့်ဥပမာနှင့်အတူ subdirectory အသစ်တစ်ခု ဖန်တီးပါ
2. အလုံးစုံ `azure.yaml`, `infra/`, နှင့် `src/` ဖိုင်များကို ထည့်သွင်းပါ
3. တပ်ဆင်မှုပေါင်းစုံလမ်းညွှန်ချက်ပါသော README တစ်ခု ထည့်ပါ
4. `azd up` ဖြင့် တပ်ဆင်မှုကို စမ်းသပ်ပါ
5. pull request တင်ပေးပါ

---

**အကူအညီ လိုပါသလား?** အထောက်အပံ့နှင့် မေးခွန်းများအတွက် [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) အသိုက်သို့ တက်ရောက်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**သတိပေးချက်**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုနည်းပါးမှုများ ရှိနိုင်ကြောင်း သတိထားပါ။ မူလစာတမ်းကို ၎င်း၏ မိဘဘာသာစကားဖြင့်သာ အာဏာရှိသော မူရင်းအရင်းအမြစ်အဖြစ် စဥ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်တစ်ဦး၏ ဘာသာပြန်ချက်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှု ကွာဟချက်များ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
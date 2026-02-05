# AZD ဖြင့် Container App တင်သွင်းမှု ဥပမာများ

ဤဖိုင်တွဲတွင် Azure Developer CLI (AZD) ကို အသုံးပြု၍ Azure Container Apps သို့ containerized application များကို တင်သွင်းရန်အတွက် အပြည့်အစုံသော ဥပမာများ ပါဝင်သည်။ ဤဥပမာများသည် အမှန်တကယ်အသုံးပြုနိုင်သော ပုံစံများ၊ အကောင်းဆုံးအလေ့အကျင့်များနှင့် ထုတ်လုပ်မှုအဆင့်တွင် အသင့်ဖြစ်သော configuration များကို ပြသထားသည်။

## 📚 အကြောင်းအရာများ

- [အကျဉ်းချုပ်](../../../../examples/container-app)
- [လိုအပ်ချက်များ](../../../../examples/container-app)
- [အမြန်စတင်မှု ဥပမာများ](../../../../examples/container-app)
- [ထုတ်လုပ်မှု ဥပမာများ](../../../../examples/container-app)
- [အဆင့်မြင့် ပုံစံများ](../../../../examples/container-app)
- [အကောင်းဆုံးအလေ့အကျင့်များ](../../../../examples/container-app)

## အကျဉ်းချုပ်

Azure Container Apps သည် infrastructure ကို စီမံခန့်ခွဲရန် မလိုအပ်ဘဲ microservices နှင့် containerized application များကို အလုံးစုံစီမံခန့်ခွဲထားသော serverless container platform ဖြစ်သည်။ AZD နှင့် ပေါင်းစပ်သုံးစွဲပါက-

- **တင်သွင်းမှု လွယ်ကူမှု**: container များကို infrastructure နှင့်အတူ single command ဖြင့် deploy လုပ်နိုင်သည်
- **အလိုအလျောက် အရွယ်အစားချဲ့ထွင်မှု**: HTTP traffic သို့မဟုတ် event များအပေါ်မူတည်၍ zero မှ အပြင်သို့ ချဲ့ထွင်နိုင်သည်
- **ပေါင်းစည်းထားသော network**: service discovery နှင့် traffic splitting ကို built-in အနေဖြင့် ပံ့ပိုးပေးသည်
- **Managed Identity**: Azure resources များအတွက် လုံခြုံသော authentication
- **ကုန်ကျစရိတ် အထိရောက်မှု**: သုံးစွဲသော resources များအပေါ်သာ ပေးဆောင်ရမည်

## လိုအပ်ချက်များ

စတင်ရန်မတိုင်မီ၊ သင်မှာ-

```bash
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az version

# Docker ကို စစ်ဆေးပါ (စိတ်ကြိုက်ပုံစံများကို တည်ဆောက်ရန်)
docker --version

# Azure သို့ ဝင်ရောက်ပါ
azd auth login
az login
```

**လိုအပ်သော Azure Resources:**
- အကျိုးရှိသော Azure subscription
- Resource group ဖန်တီးခွင့်
- Container Apps ပတ်ဝန်းကျင် access

## အမြန်စတင်မှု ဥပမာများ

### 1. ရိုးရှင်းသော Web API (Python Flask)

Azure Container Apps ဖြင့် အခြေခံ REST API တင်သွင်းပါ။

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

**တင်သွင်းခြင်း အဆင့်များ:**

```bash
# အခြေခံပုံစံမှ စတင်ပါ
azd init --template todo-python-mongo

# အခြေခံအဆောက်အအုံကို ပြင်ဆင်ပြီး တင်သွင်းပါ
azd up

# တင်သွင်းမှုကို စမ်းသပ်ပါ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**အဓိက အင်္ဂါရပ်များ:**
- 0 မှ 10 replicas အထိ auto-scaling
- Health probes နှင့် liveness checks
- Environment variable injection
- Application Insights ပေါင်းစည်းမှု

### 2. Node.js Express API

MongoDB integration ပါသော Node.js backend တင်သွင်းပါ။

```bash
# Node.js API template ကို စတင်ပါ
azd init --template todo-nodejs-mongo

# ပတ်ဝန်းကျင် variable များကို ပြင်ဆင်ပါ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# တင်သွင်းပါ
azd up

# log များကို ကြည့်ပါ
azd logs api
```

**Infrastructure အထူးအချက်များ:**
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

React frontend နှင့် API backend ပါသော full-stack application တင်သွင်းပါ။

```bash
# အပြည့်အစုံ stack template ကို စတင်ပါ
azd init --template todo-csharp-sql-swa-func

# configuration ကို ပြန်လည်သုံးသပ်ပါ
cat azure.yaml

# service နှစ်ခုလုံးကို deploy လုပ်ပါ
azd up

# application ကို ဖွင့်ပါ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ထုတ်လုပ်မှု ဥပမာများ

### ဥပမာ 1: Microservices Architecture

**အခြေအနေ**: Microservices များပါသော E-commerce application

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

**တင်သွင်းမှု:**
```bash
# ပရောဂျက်ကို စတင်ပါ
azd init

# ထုတ်လုပ်မှု ပတ်ဝန်းကျင်ကို သတ်မှတ်ပါ
azd env new production

# ထုတ်လုပ်မှု ဆက်တင်များကို ဖွဲ့စည်းပါ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ဝန်ဆောင်မှုအားလုံးကို တင်သွင်းပါ
azd up

# တင်သွင်းမှုကို စောင့်ကြည့်ပါ
azd monitor --overview
```

### ဥပမာ 2: AI-Powered Container App

**အခြေအနေ**: Azure OpenAI integration ပါသော AI chat application

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# စနစ်စီမံခန့်ခွဲမှုကို လုံခြုံစွာ အသုံးပြုပါ။
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault မှ OpenAI key ကို ရယူပါ။
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

**တင်သွင်းမှု Commands:**
```bash
# ပတ်ဝန်းကျင်ကို စနစ်တကျ ပြင်ဆင်ပါ
azd init --template ai-chat-app
azd env new dev

# OpenAI ကို ဖွဲ့စည်းပါ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# တင်သွင်းပါ
azd up

# API ကို စမ်းသပ်ပါ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ဥပမာ 3: Background Worker with Queue Processing

**အခြေအနေ**: Message queue ပါသော order processing system

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
            # အမှာစာကိုလုပ်ဆောင်ပါ
            print(f"Processing order: {message.content}")
            
            # သတင်းစကားကိုပြီးစီးပါ
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

**တင်သွင်းမှု:**
```bash
# စတင်မည်
azd init

# အဆင့်လိုက်တန်းစီမှု configuration ဖြင့် Deploy လုပ်မည်
azd up

# တန်းစီမှုအရှည်အပေါ်မူတည်၍ အလုပ်သမားကိုအတိုင်းအတာချမည်
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
# လမ်းပန်းဆက်သွယ်မှုမပါဘဲ အခြေခံအဆင့်အသစ်ကို ဖန်တီးပါ
azd deploy api --revision-suffix blue --no-traffic

# အခြေခံအဆင့်အသစ်ကို စမ်းသပ်ပါ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# လမ်းပန်းဆက်သွယ်မှုကို ခွဲဝေပါ (20% ကို အပြာရောင်၊ 80% ကို လက်ရှိ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# အပြာရောင်သို့ အပြည့်အဝ ပြောင်းပါ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ပုံစံ 2: Canary Deployment with AZD

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

**တင်သွင်းမှု Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# ၁၀% လမ်းကြောင်းဖြင့် အဆင့်သစ်ကို တင်ပါ
azd deploy api --revision-mode multiple

# အချက်အလက်များကို စောင့်ကြည့်ပါ
azd monitor --service api --duration 5m

# လမ်းကြောင်းကို တဖြည်းဖြည်းတိုးပါ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ၅ မိနစ်စောင့်ပါ
done
```

### ပုံစံ 3: Multi-Region Deployment

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

**တင်သွင်းမှု:**
```bash
# တိုင်းဒေသအားလုံးသို့ တင်သွင်းပါ
azd up

# အဆုံးစွန်များကို အတည်ပြုပါ
azd show --output json | jq '.services.api.endpoints'
```

### ပုံစံ 4: Dapr Integration

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

**Dapr ပါ application code:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # အခြေအနေကို သိမ်းဆည်းပါ။
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # အဖြစ်အပျက်ကို ထုတ်ဝေပါ။
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## အကောင်းဆုံးအလေ့အကျင့်များ

### 1. Resource စီမံခန့်ခွဲမှု

```bash
# အမည်ပေးမှုစနစ်များကိုအမြဲတမ်းတူညီစွာအသုံးပြုပါ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ကုန်ကျစရိတ်ခြေရာခံရန်အရင်းအမြစ်များကိုတံဆိပ်ကပ်ပါ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. လုံခြုံရေး အကောင်းဆုံးအလေ့အကျင့်များ

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

### 3. စွမ်းဆောင်ရည် အထိရောက်မှု

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

### 4. စောင့်ကြည့်မှုနှင့် အမြင်အာရုံ

```bash
# အက်ပလီကေးရှင်းအိုင်ဆိုက်များကိုဖွင့်ပါ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# အချိန်နှင့်တပြေးညီ လော့ဂ်များကိုကြည့်ရှုပါ
azd logs api --follow

# မီထရစ်များကိုကြည့်ရှုပါ
azd monitor --service api

# အချက်ပေးချက်များကိုဖန်တီးပါ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ကုန်ကျစရိတ် အထိရောက်မှု

```bash
# အသုံးမပြုသောအခါ အ صفر သို့ချိန်ညှိပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်များအတွက် spot instances ကိုအသုံးပြုပါ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ဘတ်ဂျက်သတိပေးချက်များကိုတပ်ဆင်ပါ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

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

## အများဆုံး အသုံးပြုသော Commands

```bash
# အကန့်အသတ်အသစ် app ပရောဂျက်ကို စတင်ပါ
azd init --template <template-name>

# အခြေခံအဆောက်အအုံနှင့် အပလီကေးရှင်းကို တင်ပါ
azd up

# အပလီကေးရှင်းကုဒ်ကိုသာ တင်ပါ (အခြေခံအဆောက်အအုံကို ကျော်ပါ)
azd deploy

# အခြေခံအဆောက်အအုံကိုသာ စီစဉ်ပါ
azd provision

# တင်ထားသော အရင်းအမြစ်များကို ကြည့်ရှုပါ
azd show

# လော့ဂ်များကို စီးဆင်းကြည့်ရှုပါ
azd logs <service-name> --follow

# အပလီကေးရှင်းကို စောင့်ကြည့်ပါ
azd monitor --overview

# အရင်းအမြစ်များကို ရှင်းလင်းပါ
azd down --force --purge
```

## ပြဿနာများ ဖြေရှင်းခြင်း

### ပြဿနာ: Container စတင်ရန် မအောင်မြင်ပါ

```bash
# လော့ဂ်များကို စစ်ဆေးပါ
azd logs api --tail 100

# ကွန်တိန်နာ အဖြစ်အပျက်များကို ကြည့်ရှုပါ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ဒေသတွင်းတွင် စမ်းသပ်ပါ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ပြဿနာ: Container app endpoint ကို access မရနိုင်ပါ

```bash
# အင်ဂရက်စ် configuration ကိုအတည်ပြုပါ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# အတွင်းအင်ဂရက်စ်ဖွင့်ထားသည်ကိုစစ်ဆေးပါ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ပြဿနာ: စွမ်းဆောင်ရည် ပြဿနာများ

```bash
# အရင်းအမြစ်အသုံးပြုမှုကိုစစ်ဆေးပါ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# အရင်းအမြစ်များကိုတိုးချဲ့ပါ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## အပိုဆောင်း အရင်းအမြစ်များနှင့် ဥပမာများ
- [Microservices ဥပမာ](./microservices/README.md)
- [Simple Flash API ဥပမာ](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## ပံ့ပိုးမှု

Container app ဥပမာအသစ်များ ပံ့ပိုးရန်:

1. သင့်ဥပမာပါ subdirectory အသစ်တစ်ခု ဖန်တီးပါ
2. အပြည့်အစုံသော `azure.yaml`, `infra/`, နှင့် `src/` ဖိုင်များ ထည့်ပါ
3. တင်သွင်းမှု အညွှန်းများပါသော README ထည့်ပါ
4. `azd up` ဖြင့် တင်သွင်းမှု စမ်းသပ်ပါ
5. Pull request တင်ပါ

---

**အကူအညီလိုပါသလား?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) community တွင် ပံ့ပိုးမှုနှင့် မေးခွန်းများအတွက် ပါဝင်ဆွေးနွေးပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
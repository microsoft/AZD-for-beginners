<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-24T21:39:14+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "ml"
}
-->
# AZD ഉപയോഗിച്ച് കണ്ടെയ്നർ ആപ്പ് ഡിപ്ലോയ്‌മെന്റ് ഉദാഹരണങ്ങൾ

ഈ ഡയറക്ടറിയിൽ Azure Developer CLI (AZD) ഉപയോഗിച്ച് Azure Container Apps-ലേക്ക് കണ്ടെയ്നറൈസ്ഡ് ആപ്പുകൾ ഡിപ്ലോയ് ചെയ്യുന്നതിനുള്ള സമഗ്രമായ ഉദാഹരണങ്ങൾ അടങ്ങിയിരിക്കുന്നു. ഈ ഉദാഹരണങ്ങൾ യഥാർത്ഥ ലോക പാറ്റേണുകൾ, മികച്ച പ്രാക്ടീസുകൾ, ഉത്പാദനത്തിന് അനുയോജ്യമായ കോൺഫിഗറേഷനുകൾ എന്നിവ പ്രദർശിപ്പിക്കുന്നു.

## 📚 ഉള്ളടക്ക പട്ടിക

- [അവലോകനം](../../../../examples/container-app)
- [ആവശ്യകതകൾ](../../../../examples/container-app)
- [ക്വിക്ക് സ്റ്റാർട്ട് ഉദാഹരണങ്ങൾ](../../../../examples/container-app)
- [ഉത്പാദന ഉദാഹരണങ്ങൾ](../../../../examples/container-app)
- [അഡ്വാൻസ്ഡ് പാറ്റേണുകൾ](../../../../examples/container-app)
- [മികച്ച പ്രാക്ടീസുകൾ](../../../../examples/container-app)

## അവലോകനം

Azure Container Apps ഒരു പൂർണ്ണമായും മാനേജുചെയ്യുന്ന സർവർലെസ് കണ്ടെയ്നർ പ്ലാറ്റ്ഫോം ആണ്, ഇത് മൈക്രോസർവീസുകളും കണ്ടെയ്നറൈസ്ഡ് ആപ്പുകളും ഇൻഫ്രാസ്ട്രക്ചർ മാനേജുചെയ്യാതെ പ്രവർത്തിപ്പിക്കാൻ നിങ്ങളെ സഹായിക്കുന്നു. AZD ഉപയോഗിച്ച് ഇത് ലഭിക്കുന്നു:

- **ലളിതമായ ഡിപ്ലോയ്‌മെന്റ്**: ഒരു കമാൻഡ് കൊണ്ട് കണ്ടെയ്നറുകളും ഇൻഫ്രാസ്ട്രക്ചറും ഡിപ്ലോയ് ചെയ്യുക
- **ഓട്ടോമാറ്റിക് സ്കെയിലിംഗ്**: HTTP ട്രാഫിക് അല്ലെങ്കിൽ ഇവന്റുകൾ അടിസ്ഥാനമാക്കി 0 മുതൽ സ്കെയിൽ ഔട്ട് ചെയ്യുക
- **ഇന്റഗ്രേറ്റഡ് നെറ്റ്‌വർക്കിംഗ്**: ബിൽറ്റ്-ഇൻ സർവീസ് ഡിസ്കവറി, ട്രാഫിക് സ്പ്ലിറ്റിംഗ്
- **മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റി**: Azure റിസോഴ്‌സുകളിലേക്ക് സുരക്ഷിതമായ ഓത്തന്റിക്കേഷൻ
- **ചെലവ് ഓപ്റ്റിമൈസേഷൻ**: നിങ്ങൾ ഉപയോഗിക്കുന്ന റിസോഴ്‌സുകൾക്കായാണ് പണമടക്കേണ്ടത്

## ആവശ്യകതകൾ

ആരംഭിക്കുന്നതിന് മുമ്പ്, നിങ്ങൾക്ക് താഴെവരുന്നവ ഉറപ്പാക്കുക:

```bash
# AZD ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
azd version

# Azure CLI പരിശോധിക്കുക
az version

# Docker പരിശോധിക്കുക (കസ്റ്റം ഇമേജുകൾ നിർമ്മിക്കാൻ)
docker --version

# Azure-ലേക്ക് ലോഗിൻ ചെയ്യുക
azd auth login
az login
```

**ആവശ്യമായ Azure റിസോഴ്‌സുകൾ:**
- സജീവ Azure സബ്‌സ്‌ക്രിപ്ഷൻ
- റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കുന്നതിനുള്ള അനുമതികൾ
- കണ്ടെയ്നർ ആപ്പുകൾ പരിസ്ഥിതി ആക്സസ്

## ക്വിക്ക് സ്റ്റാർട്ട് ഉദാഹരണങ്ങൾ

### 1. ലളിതമായ വെബ് API (Python Flask)

Azure Container Apps ഉപയോഗിച്ച് ഒരു അടിസ്ഥാന REST API ഡിപ്ലോയ് ചെയ്യുക.

**ഉദാഹരണം: Python Flask API**

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

**ഡിപ്ലോയ്‌മെന്റ് ഘട്ടങ്ങൾ:**

```bash
# ടെംപ്ലേറ്റിൽ നിന്ന് ആരംഭിക്കുക
azd init --template todo-python-mongo

# ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷൻ ചെയ്യുക, ഡിപ്ലോയ് ചെയ്യുക
azd up

# ഡിപ്ലോയ്‌മെന്റ് ടെസ്റ്റ് ചെയ്യുക
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**പ്രധാന സവിശേഷതകൾ:**
- 0 മുതൽ 10 റെപ്ലിക്കകൾ വരെ ഓട്ടോ-സ്കെയിലിംഗ്
- ഹെൽത്ത് പ്രോബുകളും ലൈവ്നസ് ചെക്കുകളും
- പരിസ്ഥിതി വേരിയബിൾ ഇൻജക്ഷൻ
- ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

### 2. Node.js Express API

MongoDB ഇന്റഗ്രേഷൻ ഉള്ള Node.js ബാക്ക്എൻഡ് ഡിപ്ലോയ് ചെയ്യുക.

```bash
# Node.js API ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo

# പരിസ്ഥിതി വേരിയബിളുകൾ ക്രമീകരിക്കുക
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# വിന്യസിക്കുക
azd up

# ലോഗുകൾ കാണുക
azd logs api
```

**ഇൻഫ്രാസ്ട്രക്ചർ ഹൈലൈറ്റുകൾ:**
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

### 3. സ്റ്റാറ്റിക് ഫ്രണ്ട്‌എൻഡ് + API ബാക്ക്എൻഡ്

React ഫ്രണ്ട്‌എൻഡും API ബാക്ക്എൻഡും ഉള്ള ഒരു ഫുൾ-സ്റ്റാക്ക് ആപ്ലിക്കേഷൻ ഡിപ്ലോയ് ചെയ്യുക.

```bash
# ഫുൾ-സ്റ്റാക്ക് ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template todo-csharp-sql-swa-func

# കോൺഫിഗറേഷൻ അവലോകനം ചെയ്യുക
cat azure.yaml

# രണ്ട് സേവനങ്ങളും വിന്യസിക്കുക
azd up

# ആപ്ലിക്കേഷൻ തുറക്കുക
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ഉത്പാദന ഉദാഹരണങ്ങൾ

### ഉദാഹരണം 1: മൈക്രോസർവീസസ് ആർക്കിടെക്ചർ

**സാന്ദർഭം**: മൾട്ടിപ്പിൾ മൈക്രോസർവീസുകളുള്ള ഇ-കൊമേഴ്‌സ് ആപ്ലിക്കേഷൻ

**ഡയറക്ടറി ഘടന:**
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

**azure.yaml കോൺഫിഗറേഷൻ:**
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

**ഡിപ്ലോയ്‌മെന്റ്:**
```bash
# പ്രോജക്റ്റ് ആരംഭിക്കുക
azd init

# ഉത്പാദന പരിസ്ഥിതി സജ്ജമാക്കുക
azd env new production

# ഉത്പാദന ക്രമീകരണങ്ങൾ കോൺഫിഗർ ചെയ്യുക
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd up

# വിന്യാസം നിരീക്ഷിക്കുക
azd monitor --overview
```

### ഉദാഹരണം 2: AI-പവർഡ് കണ്ടെയ്നർ ആപ്പ്

**സാന്ദർഭം**: Azure OpenAI ഇന്റഗ്രേഷൻ ഉള്ള AI ചാറ്റ് ആപ്ലിക്കേഷൻ

**ഫയൽ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# സുരക്ഷിതമായ ആക്സസിനായി മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റി ഉപയോഗിക്കുക
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # കീ വോൾട്ടിൽ നിന്ന് ഓപ്പൺഎഐ കീ നേടുക
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

**ഫയൽ: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ഫയൽ: infra/main.bicep**
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

**ഡിപ്ലോയ്‌മെന്റ് കമാൻഡുകൾ:**
```bash
# പരിസ്ഥിതി സജ്ജമാക്കുക
azd init --template ai-chat-app
azd env new dev

# ഓപ്പൺഎഐ ക്രമീകരിക്കുക
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# വിന്യസിക്കുക
azd up

# API പരീക്ഷിക്കുക
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ഉദാഹരണം 3: ബാക്ക്ഗ്രൗണ്ട് വർക്കർ ക്യൂ പ്രോസസ്സിംഗ് ഉപയോഗിച്ച്

**സാന്ദർഭം**: മെസേജ് ക്യൂ ഉള്ള ഓർഡർ പ്രോസസ്സിംഗ് സിസ്റ്റം

**ഡയറക്ടറി ഘടന:**
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

**ഫയൽ: src/worker/processor.py**
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
            # ഓർഡർ പ്രോസസ്സ് ചെയ്യുക
            print(f"Processing order: {message.content}")
            
            # സന്ദേശം പൂർത്തിയാക്കുക
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ഫയൽ: azure.yaml**
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

**ഡിപ്ലോയ്‌മെന്റ്:**
```bash
# ആരംഭിക്കുക
azd init

# ക്യൂ കോൺഫിഗറേഷനുമായി വിന്യസിക്കുക
azd up

# ക്യൂ നീളത്തിന്റെ അടിസ്ഥാനത്തിൽ വർക്കറെ സ്കെയിൽ ചെയ്യുക
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## അഡ്വാൻസ്ഡ് പാറ്റേണുകൾ

### പാറ്റേൺ 1: ബ്ലൂ-ഗ്രീൻ ഡിപ്ലോയ്‌മെന്റ്

```bash
# പുതിയ റിവിഷൻ ട്രാഫിക് ഇല്ലാതെ സൃഷ്ടിക്കുക
azd deploy api --revision-suffix blue --no-traffic

# പുതിയ റിവിഷൻ പരീക്ഷിക്കുക
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ട്രാഫിക് വിഭജിക്കുക (20% ബ്ലൂവിലേക്ക്, 80% നിലവിലുള്ളതിലേക്ക്)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ബ്ലൂവിലേക്ക് പൂർണ്ണമായ മാറ്റം
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### പാറ്റേൺ 2: AZD ഉപയോഗിച്ച് കാനറി ഡിപ്ലോയ്‌മെന്റ്

**ഫയൽ: .azure/dev/config.json**
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

**ഡിപ്ലോയ്‌മെന്റ് സ്ക്രിപ്റ്റ്:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10% ട്രാഫിക്കോടെ പുതിയ റിവിഷൻ വിന്യസിക്കുക
azd deploy api --revision-mode multiple

# മെട്രിക്‌സ് നിരീക്ഷിക്കുക
azd monitor --service api --duration 5m

# ട്രാഫിക് ക്രമാതീതമായി വർദ്ധിപ്പിക്കുക
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 മിനിറ്റ് കാത്തിരിക്കുക
done
```

### പാറ്റേൺ 3: മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്‌മെന്റ്

**ഫയൽ: azure.yaml**
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

**ഫയൽ: infra/multi-region.bicep**
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

**ഡിപ്ലോയ്‌മെന്റ്:**
```bash
# എല്ലാ പ്രദേശങ്ങളിലും വിന്യസിക്കുക
azd up

# എന്റ്പോയിന്റുകൾ സ്ഥിരീകരിക്കുക
azd show --output json | jq '.services.api.endpoints'
```

### പാറ്റേൺ 4: Dapr ഇന്റഗ്രേഷൻ

**ഫയൽ: infra/app/dapr-enabled.bicep**
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

**Dapr ഉപയോഗിച്ചുള്ള ആപ്ലിക്കേഷൻ കോഡ്:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # സംസ്ഥാനത്തെ സംരക്ഷിക്കുക
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ഇവന്റ് പ്രസിദ്ധീകരിക്കുക
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## മികച്ച പ്രാക്ടീസുകൾ

### 1. റിസോഴ്‌സ് ഓർഗനൈസേഷൻ

```bash
# സ്ഥിരമായ നാമകരണം രീതികൾ ഉപയോഗിക്കുക
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ചെലവ് നിരീക്ഷണത്തിനായി വിഭവങ്ങൾ ടാഗ് ചെയ്യുക
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. സുരക്ഷാ മികച്ച പ്രാക്ടീസുകൾ

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

### 3. പ്രകടന ഓപ്റ്റിമൈസേഷൻ

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

### 4. മോണിറ്ററിംഗ്, ഒബ്സർവബിലിറ്റി

```bash
# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റുകൾ സജീവമാക്കുക
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ലോഗുകൾ റിയൽ-ടൈമിൽ കാണുക
azd logs api --follow

# മെട്രിക്‌സ് നിരീക്ഷിക്കുക
azd monitor --service api

# അലർട്ടുകൾ സൃഷ്ടിക്കുക
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ചെലവ് ഓപ്റ്റിമൈസേഷൻ

```bash
# ഉപയോഗത്തിൽ ഇല്ലാത്തപ്പോൾ ശൂന്യത്തിലേക്ക് സ്കെയിൽ ചെയ്യുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ഡെവ് പരിസ്ഥിതികൾക്കായി സ്പോട്ട് ഇൻസ്റ്റാൻസുകൾ ഉപയോഗിക്കുക
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ബജറ്റ് അലർട്ടുകൾ സജ്ജമാക്കുക
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ഇന്റഗ്രേഷൻ

**GitHub Actions ഉദാഹരണം:**
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

## സാധാരണ കമാൻഡുകളുടെ റഫറൻസ്

```bash
# പുതിയ കണ്ടെയ്നർ ആപ്പ് പ്രോജക്റ്റ് ആരംഭിക്കുക
azd init --template <template-name>

# ഇൻഫ്രാസ്ട്രക്ചറും ആപ്ലിക്കേഷനും ഡെപ്ലോയ് ചെയ്യുക
azd up

# ആപ്ലിക്കേഷൻ കോഡ് മാത്രം ഡെപ്ലോയ് ചെയ്യുക (ഇൻഫ്രാസ്ട്രക്ചർ ഒഴിവാക്കുക)
azd deploy

# ഇൻഫ്രാസ്ട്രക്ചർ മാത്രം പ്രൊവിഷൻ ചെയ്യുക
azd provision

# ഡെപ്ലോയ് ചെയ്ത റിസോഴ്സുകൾ കാണുക
azd show

# ലോഗുകൾ സ്ട്രീം ചെയ്യുക
azd logs <service-name> --follow

# ആപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --overview

# റിസോഴ്സുകൾ ക്ലീൻ അപ് ചെയ്യുക
azd down --force --purge
```

## പ്രശ്നപരിഹാരം

### പ്രശ്നം: കണ്ടെയ്നർ ആരംഭിക്കുന്നതിൽ പരാജയപ്പെടുന്നു

```bash
# ലോഗുകൾ പരിശോധിക്കുക
azd logs api --tail 100

# കണ്ടെയ്നർ ഇവന്റുകൾ കാണുക
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ലോക്കലായി പരീക്ഷിക്കുക
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### പ്രശ്നം: കണ്ടെയ്നർ ആപ്പ് എൻഡ്പോയിന്റ് ആക്സസ് ചെയ്യാൻ കഴിയുന്നില്ല

```bash
# ഇൻഗ്രസ് കോൺഫിഗറേഷൻ പരിശോധിക്കുക
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ആന്തരിക ഇൻഗ്രസ് പ്രവർത്തനക്ഷമമാണോ എന്ന് പരിശോധിക്കുക
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### പ്രശ്നം: പ്രകടന പ്രശ്നങ്ങൾ

```bash
# വിഭവങ്ങളുടെ ഉപയോഗം പരിശോധിക്കുക
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# വിഭവങ്ങൾ വർദ്ധിപ്പിക്കുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## അധിക റിസോഴ്‌സുകളും ഉദാഹരണങ്ങളും
- [മൈക്രോസർവീസസ് ഉദാഹരണം](./microservices/README.md)
- [ലളിതമായ Flash API ഉദാഹരണം](./simple-flask-api/README.md)
- [Azure Container Apps ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/container-apps/)
- [AZD ടെംപ്ലേറ്റുകൾ ഗാലറി](https://azure.github.io/awesome-azd/)
- [Container Apps ഉദാഹരണങ്ങൾ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ടെംപ്ലേറ്റുകൾ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## സംഭാവന

പുതിയ കണ്ടെയ്നർ ആപ്പ് ഉദാഹരണങ്ങൾ സംഭാവന ചെയ്യാൻ:

1. നിങ്ങളുടെ ഉദാഹരണവുമായി ഒരു പുതിയ സബ്‌ഡയറക്ടറി സൃഷ്ടിക്കുക
2. പൂർണ്ണമായ `azure.yaml`, `infra/`, `src/` ഫയലുകൾ ഉൾപ്പെടുത്തുക
3. ഡിപ്ലോയ്‌മെന്റ് നിർദ്ദേശങ്ങളുള്ള സമഗ്രമായ README ചേർക്കുക
4. `azd up` ഉപയോഗിച്ച് ഡിപ്ലോയ്‌മെന്റ് ടെസ്റ്റ് ചെയ്യുക
5. ഒരു പുൾ റിക്വസ്റ്റ് സമർപ്പിക്കുക

---

**സഹായം ആവശ്യമുണ്ടോ?** പിന്തുണയ്ക്കും ചോദ്യങ്ങൾക്കുമായി [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) കമ്മ്യൂണിറ്റിയിൽ ചേരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് വിശ്വസനീയമായ ഉറവിടം എന്ന് പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
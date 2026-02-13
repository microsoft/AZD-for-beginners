# കൺടെയ്‌നർ ആപ്പ് ഡിപ്പ്ലോയ്‌മെന്റ് ഉദാഹരണങ്ങൾ AZD ഉപയോഗിച്ച്

ഈ ഡയറക്ടറിയിൽ Azure Developer CLI (AZD) ഉപയോഗിച്ച് Azure Container Apps-ലേക്ക് കൺടെയ്‌നറൈസ്ഡ് ആപ്പ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യാനുള്ള സമഗ്രമായ ഉദാഹരണങ്ങൾ ഉൾപ്പെടുത്തിയിട്ടുണ്ട്. ഈ ഉദാഹരണങ്ങൾ യഥാർത്ഥ ലോക മാതൃകകൾ, മികച്ച പ്രഥമങ്ങൾ, പ്രൊഡക്ഷൻ തയാറായ കോൺഫിഗറേഷനുകൾ എന്നിവ പ്രദർശിപ്പിക്കുന്നു.

## 📚 ഉള്ളടക്ക പട്ടിക

- [അവലോകനം](../../../../examples/container-app)
- [ആവശ്യമുള്ള മുൻ‌നിർത്തലുകൾ](../../../../examples/container-app)
- [ഏറ്റവും വേഗത്തിലുള്ള തുടങ്ങൽ ഉദാഹരണങ്ങൾ](../../../../examples/container-app)
- [പ്രൊഡക്ഷൻ ഉദാഹരണങ്ങൾ](../../../../examples/container-app)
- [അതിനുശേഷമുള്ള മാതൃകകൾ](../../../../examples/container-app)
- [മികച്ച പ്രഥമങ്ങൾ](../../../../examples/container-app)

## അവലോകനം

Azure Container Apps ഒരു പൂർണ്ണമായും മാനേജുചെയ്യുന്ന സർവറ്ലെസ് കൺടെയ്‌നർ പ്ലാറ്റ്ഫോമാണ്, ഇത് നിങ്ങൾക്ക് മൈക്രോസർവിസുകളും കൺടെയ്‌നറൈസ്ഡ് ആപ്പ്ലിക്കേഷനുകളും ഇൻഫ്രാസ്ട്രക്ചർ മാനേജിംഗ് ചെയ്യാതെ ഓടിക്കാൻ സജ്ജമാക്കുന്നു. AZD-യുമായി ചേർന്നാൽ, നിങ്ങൾക്ക് ലഭിക്കുന്നത്:

- **സരളമായ ഡിപ്പ്ലോയ്‌മെന്റ്**: ഏക കമാൻഡ് ഉപയോഗിച്ച് ഇൻഫ്രാസ്ട്രക്ചറും കൺടെയ്‌നറുകളും ഡിപ്പ്ലോയ് ചെയ്യുന്നു
- **സ്വകാര്യമായ സ്കെയിലിംഗ്**: HTTP ട്രാഫിക് അല്ലെങ്കിൽ ഇവന്റുകൾ അടിസ്ഥാനമാക്കി സിറോയിൽ നിന്ന് സ്കെയിൽ ഔട്ട് ചെയ്യുന്നു
- **ഇന്റഗ്രേറ്റഡ് നെറ്റ്വർക്കിംഗ്**: ഇൻബിൽറ്റ് സർവീസ് ഡിസ്കവറി, ട്രാഫിക് സ്പ്ലിറ്റിംഗ്
- **മാനേജുചെയ്ത അയഡന്റിറ്റി**: Azure റിസോഴ്‌സുകൾക്ക് സുരക്ഷിതമായ ഓതന്റിക്കേഷൻ
- **ചെലവ് ഓപ്റ്റിമൈസേഷൻ**: നിങ്ങൾ ഉപയോഗിക്കുന്ന റിസോഴ്‌സുകൾക്കായി മാത്രം പണം നൽകുക

## ആവശ്യമുള്ള മുൻ‌നിർത്തലുകൾ

തുടങ്ങുന്നതിന് മുമ്പ്, നിങ്ങൾക്കുള്ളതായി ഉറപ്പാക്കുക:

```bash
# AZD ഇൻസ്റ്റളേഷൻ പരിശോധിക്കുക
azd version

# Azure CLI പരിശോധിക്കുക
az version

# ഡോക്കർ പരിശോധിക്കുക (ഇഷ്‌ടാനുസൃത ഇമേജുകൾ നിർമ്മിക്കുന്നതിനായി)
docker --version

# Azure ലോഗിൻ ചെയ്യുക
azd auth login
az login
```

**ആവശ്യമായ Azure റിസോഴ്‌സുകൾ:**
- സജീവ Azure സബ്സ്ക്രിപ്ഷൻ
- റിസോഴ്‌സ് ഗ്രൂപ് സൃഷ്ടിക്കൽ അനുവാദങ്ങൾ
- Container Apps പരിസ്ഥിതി ആക്‌സസ്

## ഏറ്റവും വേഗത്തിലുള്ള തുടങ്ങൽ ഉദാഹരണങ്ങൾ

### 1. ലളിതമായ വെബ് API (Python Flask)

Azure Container Apps ഉപയോഗിച്ച് ഒരു അടിസ്ഥാന REST API ഡിപ്പ്ലോയ്മെന്റ്.

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

**ഡിപ്പ്ലോയ്മെന്റ് ഘട്ടങ്ങൾ:**

```bash
# ടെംപ്ലേറ്റിൽ നിന്ന് ആരംഭിക്കുക
azd init --template todo-python-mongo

# ഇൻഫ്രാസ്ട്രക്ചർ ഒരുക്കുകയും വിന്യസിക്കുകയും ചെയ്യുക
azd up

# വിന്യാസം പരീക്ഷിക്കുക
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**പ്രധാന ഫീച്ചറുകൾ:**
- 0 മുതൽ 10 റെപ്ലിക്കാസിലേക്ക് ഓട്ടോ-സ്കെയിലിംഗ്
- ഹെൽത്ത് പ്രോബുകൾ, ലൈവ്നെസ് ചെക്കുകൾ
- പരിസ്ഥിതി വേരിയബിൾ ഇഞ്ചക്ഷൻ
- അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

### 2. Node.js Express API

MongoDB ഇന്റഗ്രേഷനുള്ള Node.js ബാക്ക്‌എൻഡ് ഡിപ്പ്ലോയ് ചെയ്യുക.

```bash
# Node.js API ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo

# പരിസര വ്യത്യാസങ്ങൾ ക്രമീകരിക്കുക
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# വിന്യസിക്കുക
azd up

# Azure Monitor മുഖാന്തിരം ലോഗുകൾ കാണുക
azd monitor --logs
```

**ഇൻഫ്രാസ്ട്രക്ചർ ഹൈലൈറ്റ്‌ങ്ങൾ:**
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

### 3. സ്റ്റാറ്റിക് ഫ്രണ്ട്‌എൻഡ് + API ബാക്ക്‌എൻഡ്

React ഫ്രണ്ട്‌എൻഡും API ബാക്ക്‌എൻഡും ഉള്ള ഫുൾ-സ്റ്റാക്ക് ആപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ് ചെയ്യുക.

```bash
# ഫുൾ-സ്റ്റാക്ക് ടെംപ്ലേറ്റ് പ്രാരംഭീകരിക്കുക
azd init --template todo-csharp-sql-swa-func

# കോൺഫിഗറേഷൻ അവലോകനം ചെയ്യുക
cat azure.yaml

# രണ്ട് സേവനങ്ങളും വിന്യസിക്കുക
azd up

# ആപ്പ് തുറക്കുക
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## പ്രൊഡക്ഷൻ ഉദാഹരണങ്ങൾ

### ഉദാഹരണം 1: മൈക്രോസർവിസസ് ആർക്കിടെക്ചർ

**സാഹിത്യാവസ്ഥ:** മൾട്ടിപ്പിൾ മൈക്രോസർവിസുകളുള്ള ഇ-കൊമേഴ്‌സ് ആപ്ലിക്കേഷൻ

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

**ഡിപ്പ്ലോയ്മെന്റ്:**
```bash
# പ്രോജക്ട് ആരംഭിക്കുക
azd init

# നിർമ്മാണ പരിസ്ഥിതി സജ്ജമാക്കുക
azd env new production

# നിർമ്മാണ ക്രമീകരണങ്ങൾ ക്രമീകരിക്കുക
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd up

# വിന്യാസം നിരീക്ഷിക്കുക
azd monitor --overview
```

### ഉദാഹരണം 2: AI-പവേർഡ് കൺടെയ്‌നർ ആപ്പ്

**സാഹിത്യാവസ്ഥ:** Azure OpenAI ഇന്റഗ്രേഷനോടു കൂടിയ AI ചാറ്റ് ആപ്ലിക്കേഷൻ

**ഫയൽ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# സുരക്ഷിതമായ പ്രവേശനത്തിനായി മാനേജ് ചെയ്ത ഐഡന്റിറ്റി ഉപയോഗിക്കുക
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # കീ വോൾട്ട് നിന്ന് ഓപ്പൺഎഐ കീ നേടുക
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

**ഡിപ്പ്ലോയ്മെന്റ് കമാൻഡുകൾ:**
```bash
# പരിസ്ഥിതി ക്രമീകരിക്കുക
azd init --template ai-chat-app
azd env new dev

# OpenAI ക്രമീകരിക്കുക
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# വിന്യസിക്കുക
azd up

# API പരിശോധന നടത്തുക
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ഉദാഹരണം 3: ബാക്ക്ഗ്രൗണ്ട് വർകർ ക്യൂ പ്രോസസ്സിങ്ങുമായി

**സാഹിത്യാവസ്ഥ:** മെസേജ് ക്യൂ ഉള്ള ഓർഡർ പ്രോസസ്സിങ് സിസ്റ്റം

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

**ഡിപ്പ്ലോയ്മെന്റ്:**
```bash
# ആരംഭിക്കുക
azd init

# ക്യൂ ക്രമീകരണത്തോടെ വിന്യസിക്കുക
azd up

# ക്യൂ നീളത്തിന്റെ അടിസ്ഥാനത്തിൽ വർക്ക് ചെയ്യുന്നവനെ സ്‌കെയിൽ ചെയ്യുക
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## ശേഷിച്ച മാതൃകകൾ

### മാതൃക 1: ബ്ലൂ-ഗ്രീൻ ഡിപ്പ്ലോയ്‌മെന്റ്

```bash
# ട്രാഫിക് ഇല്ലാതെ പുതിയ പരിഷ്കരണം സൃഷ്ടിക്കുക
azd deploy api --revision-suffix blue --no-traffic

# പുതിയ പരിഷ്കരണം പരീക്ഷിക്കുക
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ട്രാഫിക് വിഭജിക്കുക (20% നീലയ്ക്ക്, 80% നിലവാരം)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# നീലയിലേക്ക് പൂർണ്ണ മാറ്റം
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### മാതൃക 2: AZD ഉപയോഗിച്ചുള്ള ക്യാനറി ഡിപ്പ്ലോയ്മെന്റ്

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

**ഡിപ്പ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റ്:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10% ട്രാഫിക്കുമായി പുതിയ പതിപ്പ് വിന്യസിക്കുക
azd deploy api --revision-mode multiple

# മീട്രിക്കുകൾ നിരീക്ഷിക്കുക
azd monitor --service api --duration 5m

# ട്രാഫിക് ക്രമമായി വർദ്ധിപ്പിക്കുക
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 മിനിറ്റ് കാത്തിരിക്കുക
done
```

### മാതൃക 3: മൾട്ടി-റീജിയൻ ഡിപ്പ്ലോയ്മെന്റ്

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

**ഡിപ്പ്ലോയ്മെന്റ്:**
```bash
# എല്ലാ മേഖലയിലും വിന്യസിക്കുക
azd up

# എൻഡ്‌പോയിന്റുകൾ പരിശോധിക്കുക
azd show --output json | jq '.services.api.endpoints'
```

### മാതൃക 4: ദാപ്ര് ഇന്റഗ്രേഷൻ

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

**ദാപ്ര് ഉപയോഗിച്ചുള്ള അപ്ലിക്കേഷൻ കോഡ്:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # നില സംരക്ഷിക്കൽ
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

## മികച്ച പ്രഥമങ്ങൾ

### 1. റിസോഴ്‌സ് ഓർഗനൈസേഷൻ

```bash
# സസ്‌തമമായ നാമകരണ രീതികൾ ഉപയോഗിക്കുക
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ചെലവ് ട്രാക്കിംഗിനായി റിസോഴ്‌സുകൾ ടാഗ് ചെയ്യുക
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. സുരക്ഷാ മികച്ച പ്രഥമങ്ങൾ

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

### 3. പ്രകടന മെച്ചപ്പെടുത്തൽ

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

### 4. നിരീക്ഷണവും ഡാറ്റ ശേഖരണവും

```bash
# അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് സജ്ജമാക്കുക
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# റിയൽ-ടൈമിൽ ലോഗുകൾ കാണുക
azd monitor --logs
# അല്ലെങ്കിൽ കൺറ്റെയ്‌നർ ആപ്പുകൾക്കായി Azure CLI ഉപയോഗിക്കാം:
az containerapp logs show --name api --resource-group rg-myapp --follow

# മെട്രിക്സ് നിരീക്ഷിക്കുക
azd monitor --live

# അലർട്ട് ക്രിയേറ്റ് ചെയ്യുക
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ചെലവ് ലാഭം

```bash
# ഉപയോഗത്തിലല്ലാതെ പിൻവാങ്ങിയെടുക്കുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ഡെവ് പരിസ്ഥിതികള için സ്പോട്ട് ഇൻസ്റ്റൻസുകൾ ഉപയോഗിക്കുക
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ബഡ്ജറ്റ് അലർട്ടുകൾ സജ്ജമാക്കുക
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. സി.ഐ./സി.ഡി. ഇന്റഗ്രേഷന്‍

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

## പൊതുവായ കമാൻഡുകളുടെ റഫറൻസ്

```bash
# പുതിയ കണ്ടെയ്‌നർ ആപ്പ് പ്രോജക്ട് ആരംഭിക്കുക
azd init --template <template-name>

# ഇൻഫ്രാസ്‌ട്രക്ചർയും ആപ്പ്ലിക്കേഷനും വിന്യാസം നടത്തുക
azd up

# ആപ്പ്ലിക്കേഷൻ കോഡ് മാത്രം വിന്യാസം ചെയ്യുക (ഇൻഫ്രാസ്‌ട്രക്ചർ ഒഴിവാക്കുക)
azd deploy

# ഇൻഫ്രാസ്‌ട്രക്ചർ മാത്രം ഒരുക്കുക
azd provision

# വിന്യസിച്ചിരുന്ന وسائلകൾ കാണുക
azd show

# azd monitor അല്ലെങ്കിൽ Azure CLI ഉപയോഗിച്ച് ലോഗുകൾ ലൈവ് കാണുക
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ആപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --overview

# وسائلകൾ ശുചിയാക്കുക
azd down --force --purge
```

## പ്രശ്നപരിഹാരമാർഗ്ഗങ്ങൾ

### പ്രശ്നം: കൺടെയ്‌നർ സ്റ്റാർട്ട് ചെയ്യുന്നതിൽ പരാജയം

```bash
# ആഴ്യൂർ CLI ഉപയോഗിച്ച് ലോക്കുകൾ പരിശോധിക്കുക
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# കണ്ടെയ്നർ ഇവന്റുകൾ കാണുക
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ലോക്കലായി പരിശോധിക്കുക
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### പ്രശ്നം: കൺടെയ്‌നർ ആപ്പ് എന്റ്പോയിന്റ് ആക്‌സസ് ചെയ്യാൻ കഴിയുന്നില്ല

```bash
# ഇംഗ്രസ് കോൺഫിഗറേഷൻ സ്ഥിരീകരിക്കുക
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ആന്തരിക ഇംഗ്രസ് സജീവമാണോ എന്ന് പരിശോധിക്കുക
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### പ്രശ്നം: പ്രകടന പ്രശ്നങ്ങൾ

```bash
# സ്രോതസ്സ് ഉപയോഗം പരിശോധിക്കുക
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# സ്രോതസ്സുകൾ വർദ്ധിപ്പിക്കുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## അധിക വാൽക്കളുകളും ഉദാഹരണങ്ങളും
- [മൈക്രോസർവിസസ് ഉദാഹരണം](./microservices/README.md)
- [ലളിത ഫ്ലസ്ക് API ഉദാഹരണം](./simple-flask-api/README.md)
- [Azure Container Apps ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/container-apps/)
- [AZD ടെംപ്ലേറ്റ്സ് ഗാലറി](https://azure.github.io/awesome-azd/)
- [Container Apps സാമ്പിൾസ്](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ടെംപ്ലേറ്റ്സ്](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## സംഭാവന ചെയ്യുക

പുതിയ കൺടെയ്‌നർ ആപ്പ് ഉദാഹരണങ്ങൾ സംഭാവന ചെയ്യാൻ:

1. നിങ്ങളുടെ ഉദാഹരണത്തോടെ ഒരു പുതിയ സബ്ഡയറക്ടറി സൃഷ്ടിക്കുക
2. പൂര്‍ണ്ണമായ `azure.yaml`, `infra/`, `src/` ഫയലുകൾ ഉൾപ്പെടുത്തുക
3. ഡിപ്പ്ലോയ്മെന്റ് നിർദ്ദേശങ്ങളോടെ സമഗ്രമായ README ചേർക്കുക
4. `azd up` ഉപയോഗിച്ച് ഡിപ്പ്ലോയ്മെന്റ് പരീക്ഷിക്കുക
5. ഒരു പുല്‍ റിക്വസ്റ്റ് സമർപ്പിക്കുക

---

**സഹായം വേണമോ?** സഹായത്തിനും ചോദ്യത്തിനും [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) സമൂഹത്തിലേക്ക് ചേരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയാ**:  
ഈ ഡോക്യുമെന്റ് AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നാം സঠিকതയ്ക്ക് ശ്രമിക്കുന്നുവെങ്കിലും, യാന്ത്രിക വിവർത്തനങ്ങളിൽ പിശക് അല്ലെങ്കിൽ അപൂർവതകൾ ഉണ്ടാകാമെന്നത് ശ്രദ്ധിക്കുക. തഴഞ്ഞ ഭാഷയിൽ ഉള്ള الأصلي ഡോക്യുമെന്റ് ആണ് അധികാരപരമായ ഉറവിടം. പ്രാധാന്യമുള്ള വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യവിവർത്തനം നടത്തുന്നത് ഉചിതമാണ്. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദിത്വം സ്വീಕರിക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD ഉപയോഗിച്ച് കണ്ടെയ്‌നർ ആപ്പ് ഡിപ്ലോയ്മെന്റ് ഉദാഹരണങ്ങൾ

ഈ ഡയറക്ടറി Azure Developer CLI (AZD) ഉപയോഗിച്ച് Azure Container Apps-ലേക്ക് കണ്ടെയ്‌നർ ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ്ചെയ്യുന്നതിനുള്ള സമഗ്രമായ ഉദാഹരണങ്ങൾ ഉൾക്കൊള്ളുന്നു. ഈ ഉദാഹരണങ്ങൾ യഥാർത്ഥ ലോകത്തുള്ള പാറ്റേൺസും, മികച്ച പ്രാക്ടീസുകളും, പ്രൊഡക്ഷൻ റഡീ ഡ്രഡ്ഗിഗ് കോൺഫിഗറേഷനുകളും പ്രദർശിപ്പിക്കുന്നു.

## 📚 ഉള്ളടക്ക പട്ടിക

- [അവലോകനം](#അവലോകനം)
- [മുൻകൂട്ടി ആവശ്യങ്ങൾ](#മുൻകൂട്ടി-ആവശ്യങ്ങൾ)
- [വേഗത്തിലുള്ള ആരംഭം ഉദാഹരണങ്ങൾ](#വേഗത്തിലുള്ള-ആരംഭം-ഉദാഹരണങ്ങൾ)
- [പ്രൊഡക്ഷൻ ഉദാഹരണങ്ങൾ](#പ്രൊഡക്ഷൻ-ഉദാഹരണങ്ങൾ)
- [ඇഡ്‌വാൻസ്ഡ് പാറ്റേൺസുകൾ](#ඇഡ്‌വാൻസ്ഡ്-പാറ്റേൺസുകൾ)
- [മികച്ച പ്രാക്ടീസുകൾ](#മികച്ച-പ്രാക്ടീസുകൾ)

## അവലോകനം

Azure Container Apps ഒരു പൂർണ്ണമായി മാനേജുചെയ്ത സെർവർലെസ് കണ്ടെയ്‌നർ പ്ലാറ്റ്ഫോമാണ്, ഇത് കണ്ടെയ്‌നർ ആപ്ലിക്കേഷനുകളും മൈക്രോസ്‌ർവീസുകളും ഇൻഫ്രാസ്ട്രക്ടർ മാനേജുമെന്റ് ഇല്ലാതെയും ഓടിക്കാൻ സഹായിക്കുന്നു. AZD-യുമായി ചേർന്ന് നിങ്ങൾക്ക് ലഭിക്കുന്നത്:

- **സർളമായ ഡിപ്ലോയ്മെന്റ്**: ഒറ്റ കമാൻഡിൽ കണ്ടെയ്‌നറുകളും ഇന്‍ഫ്രാസ്ട്രക്ചറും ഡിപ്ലോയ്ചെയ്യുക  
- **ഓട്ടോമാറ്റിക് സ്കേലിംഗ്**: HTTP ട്രാഫിക് അല്ലെങ്കിൽ ഇവന്റുകളുടെ അടിസ്ഥാനത്തിൽ 0 മുതൽ സ്കേൽ ചെയ്യുക  
- **ഇന്റഗ്രേറ്റഡ് നെറ്റ്വർകിംഗ്**: ഇൻ-ബിൽട്ട് സർവീസ് ഡിസ്കവറി, ട്രാഫിക് സ്‌പ്ലിറ്റിങ്  
- **മാനേജ്ഡ് ഐഡెంటിറ്റി**: Azure റിസോഴ്‌സുകളിലേക്ക് സുരക്ഷിതമായി ആണയനൊടുക്കൽ  
- **ചെലവ് മെച്ചപ്പെടുത്തൽ**: നിങ്ങൾ ഉപയോഗിക്കുന്ന റിസോഴ്‌സുകൾക്കേക്കാൾ മാത്രമേ പണം നൽകേണ്ടത് ഉണ്ടാകൂ  

## മുൻകൂട്ടി ആവശ്യങ്ങൾ

ആരംഭിക്കുന്നതിന് മുമ്പ്, നിങ്ങൾക്കുണ്ടെന്ന് ഉറപ്പാക്കുക:

```bash
# AZD ഇൻസ്റ്റളേഷൻ പരിശോധിക്കുക
azd version

# Azure CLI പരിശോധിക്കുക
az version

# Docker പരിശോധിക്കുക (കസ്റ്റം ഇമേജുകൾ നിർമ്മിക്കാൻ)
docker --version

# AZD വിന്യാസങ്ങൾക്ക് ഓതന്റിക്കേറ്റ് ചെയ്യുക
azd auth login

# ഐഷികം: നിങ്ങൾക്ക് az കമാൻഡുകൾ നേരിട്ട് നടത്താനാണ് വേണ്ടെങ്കിൽ Azure CLI ലോഗിൻ ചെയ്യുക
az login
```
  
**ആവശ്യമായ Azure റിസോഴ്‌സുകൾ:**  
- הפעיל Azure സബ്സ്ക്രിപ്ഷൻ  
- റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കൽ അനുമതികൾ  
- Container Apps എൻവയോൺമെന്റ് ആക്സസ്  

## വേഗത്തിലുള്ള ആരംഭം ഉദാഹരണങ്ങൾ

### 1. സിംപിൾ വെബ് API (Python Flask)

Azure Container Apps ഉപയോഗിച്ച് അടിസ്ഥാന REST API ഡിപ്ലോയ്ചെയ്യുക.

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
  
**ഡിപ്ലോയ്മെന്റ് പ്രഖ്യാപനങ്ങൾ:**

```bash
# ടെംപ്ലേറ്റിൽ നിന്ന് തുടങ്ങുക
azd init --template todo-python-mongo

# ഇൻഫ്രാസ്ട്രക്ചർ ഒരുക്കി വിന്യസിക്കുക
azd up

# വിന്യാസം പരിശോധന നടത്തുക
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```
  
**പ്രധാന ഫീച്ചറുകൾ:**  
- 0 മുതൽ 10 റെപ്ലിക്കാസിലേക്ക് ഓട്ടോ-സ്കേലിംഗ്  
- ഹെൽത്ത് പ്രോബുകളും ലൈവ്‌നസ് ചെക്കുകളും  
- എൻവയോൺമെന്റ് വെറിയബിൾ injection  
- ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ഇന്റഗ്രേഷൻ  

### 2. Node.js Express API

MongoDB ഇന്റഗ്രേഷനോടെയുള്ള Node.js ബാക്ക്‌എൻഡ് ഡിപ്ലോയ്ചെയ്യുക.

```bash
# Node.js API ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo

# പരിസ്ഥിതിവേരിയബിളുകള്‍ നിർമ്മാണം
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# വിന്യസിക്കുക
azd up

# Azure Monitor വഴി ലോഗുകള്‍ കാണുക
azd monitor --logs
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
  
### 3. സ്റ്റാറ്റിക് ഫ്രണ്ട്‌എൻഡ് + API ബാക്ക്‌എൻഡ്

React ഫ്രണ്ട്‌എൻഡ് കൂടിയ ഒരു ഫുൾ സ്റ്റാക്ക് അപ്ലിക്കേഷൻ ഡിപ്ലോയ്ചെയ്യുക.

```bash
# ഫുൾ-സ്റ്റാക്ക് ടെംപ്ലേറ്റ് തുടങ്ങുക
azd init --template todo-csharp-sql-swa-func

# കോൺഫിഗറേഷൻ അവലോകനം ചെയ്യുക
cat azure.yaml

# രണ്ട് സേവനങ്ങളും വിന്യസിക്കുക
azd up

# അപ്ലിക്കേഷൻ തുറക്കുക
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```
  
## പ്രൊഡക്ഷൻ ഉദാഹരണങ്ങൾ

### ഉദാഹരണം 1: മൈക്രോസർവീസ് ആർക്കിടെക്ചർ

**സിനാരിയോ**: ബഹുമുഖ മൈക്രോസർവീസുകളുള്ള ഇ-കൊമേഴ്സ് അപ്ലിക്കേഷൻ

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
  
**ഡിപ്ലോയ്മെന്റ്:**  
```bash
# പ്രൊജക്ട് ആരംഭിക്കുക
azd init

# പ്രൊഡക്ഷൻ പരിസ്ഥിതി സജ്ജീകരിക്കുക
azd env new production

# പ്രൊഡക്ഷൻ ക്രമീകരണങ്ങൾ ക്രമീകരിക്കുക
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd up

# വിന്യസനം നിരീക്ഷിക്കുക
azd monitor --overview
```
  
### ഉദാഹരണം 2: AI-പവേർഡ് കണ്ടെയ്‌നർ ആപ്പ്

**സിനാരിയോ**: Microsoft Foundry മോഡലുകൾ ഉൾപ്പെട്ട AI ചാറ്റ് അപ്ലിക്കേഷൻ

**ഫയൽ: src/ai-chat/app.py**  
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# സുരക്ഷിത ആക്സസിനായി മാനേജ്ഡ് ഐഡന്റിറ്റി ഉപയോഗിക്കുക
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # കീ വാൾട്ട് നിന്ന് OpenAI കീ നേടുക
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
  
**ഡിപ്ലോയ്മെന്റ് കമാൻഡുകൾ:**  
```bash
# പരിസ്ഥിതി ക്രമീകരിക്കുക
azd init --template ai-chat-app
azd env new dev

# OpenAI ക്രമീകരിക്കുക
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# വിന്യസിക്കുക
azd up

# API പരിശോധിക്കുക
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```
  
### ഉദാഹരണം 3: ബാക്ക്ഗ്രൗണ്ട് വേർക്കർ ക്യൂ പ്രോസസ്സിംഗോടെ

**സിനാരിയോ**: മെസേജ് ക്യൂ ഉപയോഗിച്ച് ഓർഡർ പ്രോസസ്സിംഗ് സിസ്റ്റം

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
            # ഓർഡർ പ്രോസസ് ചെയ്യുക
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
  
**ഡിപ്ലോയ്മെന്റ്:**  
```bash
# ആരംഭിക്കുക
azd init

# ക്യൂ കോൺഫിഗറേഷനോടുകൂടെ വിന്യസിക്കുക
azd up

# ക്യൂ നീളത്തെ അടിസ്ഥാനമാക്കി വർ커ിന്റെ വലുപ്പം വർദ്ധിപ്പിക്കുക
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```
  
## ඇഡ്‌വാൻസ്ഡ് പാറ്റേൺസുകൾ

### പാറ്റേൺ 1: ബ്ലൂ-ഗ്രീൻ ഡിപ്ലോയ്മെന്റ്

```bash
# ട്രാഫിക് ഇല്ലാതെ പുതിയ പതിപ്പ് സൃഷ്ടിക്കുക
azd deploy api --revision-suffix blue --no-traffic

# പുതിയ പതിപ്പ് പരിശോധിക്കുക
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ട്രാഫിക് വിഭജിക്കുക (20% ബ്ലുവിന്, 80% നിലവാരത്തിന്)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# പൂർണ്ണമായും ബ്ലുവിലേക്ക് മാറുക
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```
  
### പാറ്റേൺ 2: AZD ഉപയോഗിച്ച് കാനറി ഡിപ്ലോയ്മെന്റ്

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
  
**ഡിപ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റ്:**  
```bash
#!/bin/bash
# deploy-canary.sh

# 10% ട്രാഫിക്കോടെ പുതിയ പതിപ്പ് വിന്യസിക്കുക
azd deploy api --revision-mode multiple

# മെട്രിക്‌സ് നിരീക്ഷിക്കുക
azd monitor --service api --duration 5m

# ട്രാഫിക് ക്രമයෙන් വർദ്ധിപ്പിക്കുക
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 നിമിഷം കാത്തിരിക്കുക
done
```
  
### പാറ്റേൺ 3: മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്മെന്റ്

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
  
**ഡിപ്ലോയ്മെന്റ്:**  
```bash
# എല്ലാ പ്രദേശങ്ങളിലും വിന്യസിക്കുക
azd up

# എൻഡ്‌പോയിന്റുകൾ സ്ഥിരീകരിക്കുക
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
  
**Dapr ഉപയോഗിച്ച് ആപ്ലിക്കേഷൻ കോഡ്:**  
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # നില സംരക്ഷിക്കുക
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
# സ്ഥിരമായ നാമമന്ത്രങ്ങൾ ഉപയോഗിക്കുക
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ചെലവ് ട്രാക്കിംഗിനായി വിഭവങ്ങളെ ടാഗ് ചെയ്യുക
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```
  
### 2. സുരക്ഷിതത്വം മികച്ച പ്രാക്ടീസുകൾ

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
  
### 3. പ്രകടനം മെച്ചപ്പെടുത്തൽ

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
  
### 4. നിരീക്ഷണവും ഒബ്സർവബിലിറ്റിയും

```bash
# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സുകൾ സാധൂകരിക്കുക
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# യാഥാർത്ഥ്യ സമയത്ത് ലോഗുകൾ കാണുക
azd monitor --logs
# അല്ലെങ്കിൽ കോൺടെയ്‌നർ ആപ്പുകൾക്കായി അസ്യൂർ CLI ഉപയോഗിക്കുക:
az containerapp logs show --name api --resource-group rg-myapp --follow

# മീറ്റ്രിക്കുകൾ നിരീക്ഷിക്കുക
azd monitor --live

# അലെർട്ടുകൾ സൃഷ്ടിക്കുക
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```
  
### 5. ചെലവ് മെച്ചപ്പെടുത്തൽ

```bash
# ഉപയോഗത്തിലില്ലാതിരുന്നാൽ പൂജ്യമായി സ്‌കെയിൽ ചെയ്യുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ഡെവലപ്പ്മെന്റ് പരിരക്ഷണങ്ങൾക്ക് സ്‌പോട് ഇൻസ്റ്റാൻസുകൾ ഉപയോഗിക്കുക
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ബഡ്ജറ്റായിടുകളുണ്ടെങ്കിൽ അലേർട്ട് സജ്ജമാക്കുക
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```
  
### 6. CI/CD ഇന്റഗ്രേഷൻ

**GitHub ആക്ഷൻസ് ഉദാഹരണം:**  
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

# ഇന്‍ഫ്രാസ്‌ട്രക്ചർയും അപ്ലിക്കേഷൻവും ഡിപ്പ്ലോയ്മെന്റ് ചെയ്യുക
azd up

# അപ്ലിക്കേഷൻ കോഡ് മാത്രം ഡിപ്പ്ലോയ്മെന്റ് ചെയ്യുക (ഇന്‍ഫ്രാസ്‌ട്രക്ചർ ഒഴിവാക്കുക)
azd deploy

# ഇന്‍ഫ്രാസ്‌ട്രക്ചർ മാത്രം പ്രൊവിഷന്‍ ചെയ്യുക
azd provision

# ഡിപ്പ്ലോയ്മെന്റ് ചെയ്ത റെസോഴ്‌സുകൾ കാണുക
azd show

# azd monitor അല്ലെങ്കിൽ Azure CLI ഉപയോഗിച്ച് ലോഗുകൾ പകരുക
azd monitor --logs
# az containerapp logs show --name <സർവീസ്-പേര്> --resource-group <ആർജി-പേര്> --follow

# അപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --overview

# റിസോഴ്‌സുകൾ ശുചീകരിക്കുക
azd down --force --purge
```
  
## പ്രശ്‌ന പരിഹാരങ്ങൾ

### പ്രശ്‌നം: കണ്ടെയ്‌നർ തുടങ്ങാനാകുന്നില്ല

```bash
# Azure CLI ഉപയോഗിച്ച് ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# കണ്ടെയ്‌നർ ഇവന്റുകൾ കാണുക
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ലോക്കൽ ആയി പരീക്ഷിക്കുക
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```
  
### പ്രശ്‌നം: കണ്ടെയ്‌നർ ആപ്പ് എണ്ട്പോയിന്റിൽ ആക്‌സസ് സാധ്യമല്ല

```bash
# ഇംഗ്രസ് കോൺഫിഗറേഷൻ ശരിയാണോ എന്ന് പരിശോധിക്കുക
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ഇന്റേണൽ ഇംഗ്രസ് പ്രവർത്തനക്ഷമമാണോ എന്ന് പരിശോധിക്കുക
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```
  
### പ്രശ്‌നം: പ്രകടന പ്രശ്നങ്ങൾ

```bash
# ഉറവിട ഉപയോഗവ് പരിശോധിക്കുക
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ഉറവിടങ്ങൾ ഉയർത്തുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```
  
## അധിക ռിസോഴ്‌സുകളും ഉദാഹരണങ്ങളും
- [മൈക്രോസർവീസസ് ഉദാഹരണം](./microservices/README.md)
- [വളരെ ലളിതമായ ഫ്ലാസ്‌ക് API ഉദാഹരണം](./simple-flask-api/README.md)
- [Azure Container Apps ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/container-apps/)
- [AZD ടെംപ്ലേറ്റ്സ് ഗ്യാലറി](https://azure.github.io/awesome-azd/)
- [Container Apps സാമ്പിളുകൾ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ടെംപ്ലേറ്റ്സ്](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## സംഭാവനകൾ

പുതിയ കണ്ടെയ്‌നർ ആപ്പ് ഉദാഹരണങ്ങൾ സംഭാവന ചെയ്യുവാൻ:

1. നിങ്ങളുടെ ഉദാഹരണത്തോടെ പുതിയ സബ്‌డയറക്ടറി സൃഷ്ടിക്കുക  
2. സമ്പൂർണമായ `azure.yaml`, `infra/`, `src/` ഫയലുകൾ ഉൾപ്പെടുക  
3. ഡിപ്ലോയ്മെന്റ് നിർദ്ദേശങ്ങളോടെയുള്ള പൂർണമായ README ചേർക്കുക  
4. `azd up` ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് ടെസ്റ്റ് ചെയ്യുക  
5. പോൾ അഭ്യർത്ഥന സമർപ്പിക്കുക  

---

**സഹായം വേണോ?** പിന്തുണയ്ക്കും ചോദ്യങ്ങൾക്കുമായി [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) കമ്മ്യൂണിറ്റിയിൽ ചേരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**പരിഭവം**:  
ഈ ഡോക്യുമെന്റ് AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നമുക്ക് അച്ചടക്കപ്പെട്ടതിന്റെ തുല്യമായ തർജ്ജമ നൽകാൻ ശ്രമിക്കുന്നതിനാൽ, യന്ത്രപരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ കൃത്യതയ്‌ക്കുറവ് ഉണ്ടാകാം എന്ന് ദയവായി ശ്രദ്ധിക്കുക. ഇതിന്റെ പ്രാമാണികമേഖല ഭാഷയിലുള്ള യഥാർത്ഥ ഡോക്യുമെന്റാണ് പ്രാമാണികമായ സ്രോതസ്സെന്ന് പരിഗണിക്കേണ്ടതുണ്ട്. നിർണായക വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശിപാർശിക്കുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന ഏത് തെറ്റിദ്ധാരണകൾക്കും ഞങ്ങൾ ഉത്തരവാദിത്വം ഏറ്റെടുക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
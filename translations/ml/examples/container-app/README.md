# Container App Deployment Examples with AZD

ഈ ഡയറക്ടറി Azure Developer CLI (AZD) ഉപയോഗിച്ച് Azure Container Apps-ൽ കണ്ടെയ്‌നറൈസ് ചെയ്ത അപേക്ഷകൾ ഡിപ്ലോയുചെയ്യുന്നതിനുള്ള സമഗ്ര ഉദാഹരണങ്ങൾ ഉൾക്കൊള്ളുന്നു. ഈ ഉദാഹരണങ്ങൾ യഥാർത്ഥ ലോക മാതൃകകൾ, മികച്ച പ്രയോഗങ്ങൾ, ഉത്പാദന-സജ്ജമായ കോൺഫിഗറേഷനുകൾ എന്നിവ പ്രദർശിപ്പിക്കുന്നു.

## 📚 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start Examples](#quick-start-examples)
- [Production Examples](#production-examples)
- [Advanced Patterns](#advanced-patterns)
- [Best Practices](#best-practices)

## Overview

Azure Container Apps ഒരു പൂർണ്ണമായും മാനേജുചെയ്യുന്ന സർവറിലെസ് കണ്ടെയ്‌നർ പ്ലാറ്റ്ഫോമാണ്, ഇത് ഇൻഫ്രാസ്ട്രക്ചർ നിയന്ത്രണമില്ലാതെ മൈക്രോസർവിസുകളും കണ്ടെയ്‌നറൈസ് ചെയ്ത അപ്ലിക്കേഷനുകളും ഓടിക്കാൻ അനുവദിക്കുന്നു. AZD-യോടൊപ്പം ചേർത്താൽ, നിങ്ങൾക്ക് ലഭിക്കുന്നത്:

- **സിമ്പ്ലിഫൈഡ് ഡിപ്ലോയ്മെന്റ്**: സിംഗിൾ കമാൻഡ് കൊണ്ട് ഇൻഫ്രാസ്ട്രക്ചർ सहित കണ്ടെയ്‌നറുകൾ ഡിപ്ലോയുചെയ്യുന്നു
- **ഓട്ടോമാറ്റിക് സ്കെയ്ലിംഗ്**: HTTP ട്രാഫിക് അല്ലെങ്കിൽ ഇവന്റുകൾ അടിസ്ഥാനമാക്കി സീറോയിൽ നിന്ന് സ്‌കെയിൽ ചെയ്യും
- **ഇൻറഗ്രേറ്റഡ് നെറ്റ്വർക്കിംഗ്**: ബിൽറ്റ്-ഇൻ സർവീസ് ഡിസ്കവറിയും ട്രാഫിക് സ്പ്ലിറ്റിംഗും
- **മാനേജ്ഡ് ഐഡന്റിറ്റി**: Azure റിസോഴ്‌സുകളിലേക്ക് സുരക്ഷിത പ്രാമാണീകരണം
- **കൊസ്റ്റ് ഒപ്റ്റിമൈസേഷൻ**: നിങ്ങൾ ഉപയോഗിക്കുന്നonly റിസോഴ്‌സുകൾക്ക് മാത്രമേ പണം നൽകേണ്ടതുള്ളൂ

## Prerequisites

ആരംഭിക്കുന്നതിനുമുമ്പ്, നിങ്ങൾക്ക് ഉള്ളതെന്ന് ഉറപ്പാക്കുക:

```bash
# AZD ഇൻസ്റ്റലേഷൻ പരിശോധിക്കുക
azd version

# Azure CLI പരിശോധിക്കുക
az version

# Docker പരിശോധിക്കുക (ഇത്തരത്തിലുള്ള ഇമേജുകൾ നിർമ്മിക്കുന്നതിന്)
docker --version

# Azure-ൽ ലോഗിൻ ചെയ്യുക
azd auth login
az login
```

**ആവശ്യമായ Azure റിസോഴ്‌സുകൾ:**
- ആക്റ്റീവ് Azure സബ്സ്ക്രിപ്ഷൻ
- റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കാനുള്ള അനുവാദങ്ങൾ
- Container Apps പരിസ്ഥിതി ആക്‌സസ്

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Apps ഉപയോഗിച്ച് ഒരു അടിസ്ഥാന REST API ഡിപ്ലോയുചെയ്യുക.

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

**ഡിപ്ലോയ്മെന്റ് ഘട്ടങ്ങൾ:**

```bash
# ടെംപ്ലേറ്റിൽ നിന്നും പ്രാരംഭമാക്കുക
azd init --template todo-python-mongo

# ഇൻഫ്രാസ്ട്രക്ചർ ഒരുക്കി വിന്യസിക്കുക
azd up

# വിന്യംശീകരണം പരീക്ഷിക്കുക
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**പ്രധാന സവിശേഷതകൾ:**
- 0-ൽ നിന്നു 10 റെപ്ലിക്കാസിലേക്ക് സ്വയഞ്ചാലക സ്‌കെയ്ലിംഗ്
- ഹെൽത്ത് പ്രോബുകളും ലൈവ്‌നസ്സ് ചെക്കുകളും
- എൻവയ്റണ്മെന്റ് വ്യാരിയബിൾ ഇൻജെക്ഷൻ
- അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

### 2. Node.js Express API

MongoDB ഇന്റഗ്രേഷൻ ആയ Node.js ബാക്ക്എൻഡ് ഡിപ്ലോയുചെയ്യുക.

```bash
# Node.js API ടെംപ്ലേറ്റ് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo

# പരിസ്ഥിതി വ്യാരിയബിളുകൾ ക്രമീകരിക്കുക
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# വിന്യസിക്കുക
azd up

# Azure Monitor വഴി ലോഗുകൾ കാണുക
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

### 3. Static Frontend + API Backend

React ഫ്രണ്ട്‌എൻഡ്‌യും API ബാക്ക്എൻഡും ഉള്ള ഫുൾ-സ്റ്റാക്ക് അപ്ലിക്കേഷൻ ഡിപ്ലോയുചെയ്യുക.

```bash
# ഫുൾ-സ്റ്റാക് ടെംപ്ലേറ്റ് തുടങ്ങിയിടുക
azd init --template todo-csharp-sql-swa-func

# കോൺഫിഗറേഷൻ അവലോകനം ചെയ്യുക
cat azure.yaml

# ഇരുവശവും സേവനങ്ങൾ നിയോഗിക്കുക
azd up

# അപ്ലിക്കേഷൻ തുറക്കുക
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**സെനാരിയോ**: ബഹുമൂല്യ മൈക്രോസർവിസുകൾ ഉൾക്കൊള്ളുന്ന ഇ-കൊമേഴ്സ് അപ്ലിക്കേഷൻ

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
# പ്രോജക്ട് തുടങ്ങി
azd init

# പ്രൊഡക്ഷൻ പരിസ്ഥിതി ക്രമീകരിക്കുക
azd env new production

# പ്രൊഡക്ഷൻ സജ്ജീകരണങ്ങൾ ക്രമീകരിക്കുക
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd up

# വിന്യസനം നിരീക്ഷിക്കുക
azd monitor --overview
```

### Example 2: AI-Powered Container App

**സെനാരിയോ**: Microsoft Foundry Models ഇന്റഗ്രേഷനോടുകൂടിയ AI ചാറ്റ് അപ്ലിക്കേഷൻ

**ഫയൽ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# സുരക്ഷിത ആക്സസിനായി മാനേജുചെയ്ത ഐഡെന്റിറ്റി ഉപയോഗിക്കുക
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # കീ വാല്ട്ടിൽ നിന്ന് OpenAI കീ നേടുക
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
# പരിസ്ഥിതി തയ്യാറാക്കുക
azd init --template ai-chat-app
azd env new dev

# OpenAI ക്രമീകരിക്കുക
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# വിനിയോഗിക്കുക
azd up

# API പരിശോധിക്കുക
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**സെനാരിയോ**: മെസ്സേജ് ക്യൂ ഉപയോഗിച്ച് ഓർഡർ പ്രോസസ്സിങ് സിസ്റ്റം

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
# തുടക്കം കൊടുക്കുക
azd init

# ക്യൂ കോൺഫിഗുറേഷനോടെ വിന്യസിക്കുക
azd up

# ക്യൂ നീളത്തിന് അടിസ്ഥാനമായി തൊഴിലാളിയെ വലുതാക്കുക
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
# ട്രാഫിക് ഇല്ലാതെ പുതിയ റിപ്പടി ഒരുക്കുക
azd deploy api --revision-suffix blue --no-traffic

# പുതിയ റിപ്പടി പരിശോദിക്കുക
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ട്രാഫിക് വിഭജിക്കുക (20% നീലേക്ക്, 80% നിലവാരത്തിലേക്ക്)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# പൂർണ്ണമായി നീലിലേക്ക് മാറ്റുക
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

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

# മെട്രിക്കുകൾ നിരീക്ഷിക്കുക
azd monitor --service api --duration 5m

# ട്രാഫിക് ക്രമക്കേട് വർദ്ധിപ്പിക്കുക
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 മിനിറ്റ് കാത്തിരിക്കുക
done
```

### Pattern 3: Multi-Region Deployment

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

### Pattern 4: Dapr Integration

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

**Dapr ഉപയോഗിച്ചുള്ള അപ്ലിക്കേഷൻ കോഡ്:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # സ്റ്റേറ്റ് സേവ് ചെയ്യുക
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ഇവന്റ് പ്രചരിപ്പിക്കുക
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
# സ്ഥിരതയുള്ള പേര് ക്രമീകരണങ്ങൾ ഉപയോഗിക്കുക
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ചെലവ് ട്രാക്കിംഗിന് റിസോഴ്‌സുകൾ ടാഗ് ചെയ്യുക
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
# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് സജ്ജമാക്കുക
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ലോഗുകൾ റിയൽ ടൈമിൽ കാണുക
azd monitor --logs
# അല്ലെങ്കിൽ കൺറെയ്‌നർ ആപ്പുകൾക്കായി അസ്യൂർ CLI ഉപയോഗിക്കുക:
az containerapp logs show --name api --resource-group rg-myapp --follow

# മീറ്റ്രിക്‌സ് നിരീക്ഷിക്കുക
azd monitor --live

# അലർട്ടുകൾ സൃഷ്ടിക്കുക
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# ഉപയോഗത്തിലില്ലാത്തപ്പോൾ സകലവ് പൂർണമായും കുറയ്ക്കുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# വികസന പരിസരങ്ങളിലായി സ്പോട്ട് ഇൻസ്റ്റൻസ്‌കൾ ഉപയോഗിക്കുക
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ബഡ്ജറ്റ് അലർട്ടുകൾ സജ്ജമാക്കുക
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

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

## Common Commands Reference

```bash
# പുതിയ കണ്ടെയ്നർ ആപ്പ് പ്രോജക്ട് ആരംഭിക്കുക
azd init --template <template-name>

# അടിസ്ഥാനസൗകര്യവും ആപ്പ്ലിക്കേഷനും വിന്യാസം ചെയ്യുക
azd up

# ആപ്പ്ലിക്കേഷൻ കോഡ് മാത്രം വിന്യാസം ചെയ്യുക (അടിസ്ഥാനസൗകര്യം ഒഴിവാക്കുക)
azd deploy

# അടിസ്ഥാനസൗകര്യം മാത്രം ഒരുക്കുക
azd provision

# വിന്യാസം ചെയ്‌ത റിസോഴ്സ് കാണൂ
azd show

# azd monitor അല്ലെങ്കിൽ Azure CLI ഉപയോഗിച്ച് ലോഗുകൾ സ്ട്രീം ചെയ്യുക
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ആപ്പ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --overview

# റിസോഴ്‌സുകൾ ശുചീകരിക്കുക
azd down --force --purge
```

## Troubleshooting

### പ്രശ്നം: കണ്ടെയ്‌നർ ആരംഭിക്കാൻ കഴിയുന്നില്ല

```bash
# അസ്യൂർ CLI ഉപയോഗിച്ച് ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# കണ്ടെയ്‌നർ ഇവന്റുകൾ കാണുക
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ലോക്കലായി ടെസ്റ്റ് ചെയ്യുക
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### പ്രശ്നം: കണ്ടെയ്‌നർ ആപ്പ് എൻഡ്‌പോയിന്റ് ആക്‌സസ് ചെയ്യാൻ കഴിയുന്നില്ല

```bash
# ഇൻഗ്രസ് കോൺഫിഗറേഷൻ സ്ഥിരീകരിക്കുക
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ഇൻറേണൽ ഇൻഗ്രസ് সক്രീയമാണോ എന്ന് പരിശോധിക്കുക
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

# സ്രോതസ്സ് വർധിപ്പിക്കുക
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [Microservices Example](./microservices/README.md)
- [Simple Flash API Example](./simple-flask-api/README.md)
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps Samples](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

പുതിയ കണ്ടെയ്‌നർ ആപ്പ് ഉദാഹരണങ്ങൾ സംഭാവന ചെയ്യാൻ:

1. നിങ്ങളുടെ ഉദാഹരണത്തിനായി ഒരു പുതിയ സബ്ഡയറക്ടറി സൃഷ്ടിക്കുക
2. പൂര്‍ണമായ azure.yaml, infra/, src/ ഫയലുകൾ ഉൾപ്പെടുത്തുക
3. ഡിപ്ലോയ്മെന്റ് നിർദ്ദേശങ്ങളോടുകൂടിയ സമ്പൂർണ്ണ README ചേർക്കുക
4. `azd up` ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് പരീക്ഷിക്കുക
5. ഒരു പുൾ റിക്വസ്റ്റ് സമർപ്പിക്കുക

---

**ഒരു സഹായം വേണോ?** പിന്തുണക്കും ചോദ്യങ്ങൾക്കും [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) കമ്മ്യൂണിറ്റിയിൽ ചേരുക.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ഡിസ്ക്ലെയിമർ**:  
ഈ ഡോക്യുമെന്റ് എഐ വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്‍തിരിക്കുന്നു. നാം കൃതത്വത്തിനായി പരിശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, ആട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അനിഷ്ടതകൾ ഉണ്ടാകാം എന്ന് ദയവായി ശ്രദ്ധിക്കുക. സ്വന്തം ഭാഷയിലുള്ള യഥാർത്ഥ ഡോക്യുമെന്റ് ഔദ്യോഗിക ഉറവിടമായി കണക്കാക്കണം. ഗുരുതരമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം നിർദ്ദേശിക്കുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതൊക്കെ തെറ്റിദ്ധാരണകൾക്ക് ഞങ്ങൾ ഉത്തരവാദിത്വം ഏറ്റെടുക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
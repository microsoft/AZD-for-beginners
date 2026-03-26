# AZD ਨਾਲ ਕੰਟੇਨਰ ਐਪ ਡੈਪਲੌਇਮੈਂਟ ਉਦਾਹਰਣਾਂ

ਇਹ ਡਾਇਰੈਕਟਰੀ Azure Developer CLI (AZD) ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure Container Apps ਵਿੱਚ ਕੰਟੇਨਰਾਇਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੈਪਲੌਇ ਕਰਨ ਲਈ ਵਿਸਤ੍ਰਿਤ ਉਦਾਹਰਣ ਰੱਖਦੀ ਹੈ। ਇਹ ਉਦਾਹਰਣ ਅਸਲ-ਦੁਨੀਆ ਦੇ ਪੈਟਰਨ, ਸਰਵੋਤਮ ਅਭਿਆਸ, ਅਤੇ ਉਤਪਾਦਨ-ਤਿਆਰ ਸੰਰਚਨਾਵਾਂ ਦਿਖਾਉਂਦੀਆਂ ਹਨ।

## 📚 ਸਮੱਗਰੀ ਦੀ ਸੂਚੀ

- [ਜਾਇਜ਼ਾ](#overview)
- [ਜਰੂਰੀ ਸ਼ਰਤਾਂ](#prerequisites)
- [ਫਟਾਫਟ ਸ਼ੁਰੂ ਕਰਨ ਦੇ ਉਦਾਹਰਨ](#quick-start-examples)
- [ਉਤਪਾਦਨ ਉਦਾਹਰਣ](#production-examples)
- [ਉੱਨਤ ਪੈਟਰਨ](#advanced-patterns)
- [ਸਰਵੋਤਮ ਅਭਿਆਸ](#best-practices)

## Overview

Azure Container Apps ਇੱਕ ਪੂਰੀ ਤਰ੍ਹਾਂ ਪ੍ਰਬੰਧਿਤ ਸਰਵਰਲੇਸ ਕੰਟੇਨਰ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਮਾਈਕ੍ਰੋਸਰਵਿਸਿਜ਼ ਅਤੇ ਕੰਟੇਨਰਾਇਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਇੰਫਰਾਸਟਰਕਚਰ ਦਾ ਪ੍ਰਬੰਧ ਨਾ ਕਰਦੇ ਹੋਏ ਚਲਾਉਣ ਦੇ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ। AZD ਨਾਲ ਮਿਲਾਇਆ ਜਾਣ 'ਤੇ, ਤੁਹਾਨੂੰ ਮਿਲਦਾ ਹੈ:

- **ਸਰਲਤ ਕੀਤੀ ਡੈਪਲੌਇਮੈਂਟ**: ਇੱਕ ਆਦੇਸ਼ ਨਾਲ ਇੰਫਰਾਸਟਰਕਚਰ ਸਮੇਤ ਕੰਟੇਨਰ ਡੈਪਲੌਇ ਹੁੰਦੇ ਹਨ
- **ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ**: HTTP ਟਰੈਫਿਕ ਜਾਂ ਘਟਨਾਵਾਂ ਦੇ ਆਧਾਰ 'ਤੇ 0 ਤੱਕ ਸਕੇਲ ਅਤੇ ਆউਟ ਸਕੇਲ
- **ਇਂਟੀਗ੍ਰੇਟਿਡ ਨੈਟਵਰਕਿੰਗ**: ਬਿਲਟ-ਇਨ ਸਰਵਿਸ ਡਿਸਕਵਰੀ ਅਤੇ ਟ੍ਰੈਫਿਕ ਵੰਡ
- **ਮੇਨежਡ ਆਈਡੈਂਟੀਟੀ**: Azure ਸਰੋਤਾਂ ਲਈ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣੀਕਰਨ
- **ਲਾਗਤ ਉਤਮਕਰਨ**: ਤੁਸੀਂ ਜੋ ਸਰੋਤ ਵਰਤਦੇ ਹੋ ਉਸ ਲਈ ਹੀ ਭੁਗਤਾਨ ਕਰੋ

## Prerequisites

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਹੈ:

```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# Azure CLI ਦੀ ਜਾਂਚ ਕਰੋ
az version

# Docker ਦੀ ਜਾਂਚ ਕਰੋ (ਕਸਟਮ ਇਮੇਜ ਬਣਾਉਣ ਲਈ)
docker --version

# Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login
az login
```

**ਲੋੜੀਂਦੇ Azure ਸਰੋਤ:**
- ਸਰਗਰਮ Azure subscription
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀਆਂ ਅਨੁਮਤੀਆਂ
- Container Apps ਐਨਵਾਇਰਨਮੈਂਟ ਦੀ ਪਹੁੰਚ

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Apps ਨਾਲ ਇੱਕ ਬੇਸਿਕ REST API ਡੈਪਲੌਇ ਕਰੋ।

**Example: Python Flask API**

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

**ਡੈਪਲੌਇਮੈਂਟ ਕਦਮ:**

```bash
# ਟੈਂਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-python-mongo

# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਤਿਆਰ ਕਰੋ ਅਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ:**
- 0 ਤੋਂ 10 ਰੀਪਲਿਕਾਜ਼ ਤੱਕ ਆਟੋ-ਸਕੇਲਿੰਗ
- ਹੈਲਥ ਪ੍ਰੋਬ ਅਤੇ ਲਾਈਵਨੇਸ ਚੈੱਕ
- ਐਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਇੰਜੈਕਸ਼ਨ
- Application Insights ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### 2. Node.js Express API

MongoDB ਏਕੀਕਰਨ ਨਾਲ Node.js ਬੈਕਐਂਡ ਡੈਪਲੌਇ ਕਰੋ।

```bash
# Node.js API ਟੈਮਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo

# ਵਾਤਾਵਰਣ ਚਲਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ਤਾਇਨਾਤ ਕਰੋ
azd up

# Azure Monitor ਰਾਹੀਂ ਲੌਗ ਵੇਖੋ
azd monitor --logs
```

**ਇੰਫਰਾਸਟਰਕਚਰ ਮੁਖ ਬਿੰਦੂ:**
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

React ਫਰੰਟਐਂਡ ਅਤੇ API ਬੈਕਐਂਡ ਨਾਲ ਫੁੱਲ-ਸਟੈਕ ਐਪਲੀਕੇਸ਼ਨ ਡੈਪਲੌਇ ਕਰੋ।

```bash
# ਫੁੱਲ-ਸਟੈਕ ਟੈਂਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-csharp-sql-swa-func

# ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
cat azure.yaml

# ਦੋਹਾਂ ਸੇਵਾਵਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**ਪਰਿਸਥਿਤੀ**: ਕਈ ਮਾਈਕ੍ਰੋਸਰਵਿਸਜ਼ ਵਾਲੀ ਈ-ਕਾਮਰਸ ਐਪਲੀਕੇਸ਼ਨ

**ਡਾਇਰੈਕਟਰੀ ਢਾਂਚਾ:**
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

**azure.yaml ਸੰਰਚਨਾ:**
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

**ਡੈਪਲੌਇਮੈਂਟ:**
```bash
# ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init

# ਉਤਪਾਦਨ ਮਾਹੌਲ ਸੈੱਟ ਕਰੋ
azd env new production

# ਉਤਪਾਦਨ ਸੈਟਿੰਗਾਂ ਸੰਰਚਿਤ ਕਰੋ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview
```

### Example 2: AI-Powered Container App

**ਪਰਿਸਥਿਤੀ**: Microsoft Foundry Models ਏਕੀਕਰਨ ਵਾਲੀ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

**ਫਾਈਲ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ ਲਈ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਦੀ ਵਰਤੋਂ ਕਰੋ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # OpenAI ਕੁੰਜੀ ਨੂੰ ਕੀ ਵੌਲਟ ਤੋਂ ਪ੍ਰਾਪਤ ਕਰੋ
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

**ਫਾਈਲ: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ਫਾਈਲ: infra/main.bicep**
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

**ਡੈਪਲੌਇਮੈਂਟ ਕਮਾਂਡਾਂ:**
```bash
# ਵਾਤਾਵਰਣ ਸੈੱਟ ਕਰੋ
azd init --template ai-chat-app
azd env new dev

# OpenAI ਦੀ ਸੰਰਚਨਾ ਕਰੋ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ਤਾਇਨਾਤ ਕਰੋ
azd up

# API ਦੀ ਜਾਂਚ ਕਰੋ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**ਪਰਿਸਥਿਤੀ**: ਸੁਨੇਹਾ ਕਿਊ ਨਾਲ ਆਰਡਰ ਪ੍ਰੋਸੈਸਿੰਗ ਸਿਸਟਮ

**ਡਾਇਰੈਕਟਰੀ ਢਾਂਚਾ:**
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

**ਫਾਈਲ: src/worker/processor.py**
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
            # ਆਰਡਰ ਪ੍ਰਕਿਰਿਆ ਕਰੋ
            print(f"Processing order: {message.content}")
            
            # ਪੂਰਾ ਸੁਨੇਹਾ
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ਫਾਈਲ: azure.yaml**
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

**ਡੈਪਲੌਇਮੈਂਟ:**
```bash
# ਆਰੰਭ ਕਰੋ
azd init

# ਕਤਾਰ ਦੀ ਸੰਰਚਨਾ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up

# ਕਤਾਰ ਦੀ ਲੰਬਾਈ ਦੇ ਅਧਾਰ ਤੇ ਵਰਕਰ ਦਾ ਆਕਾਰ ਬਦਲੋ
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### ਪੈਟਰਨ 1: ਬਲੂ-ਗਰੀਨ ਡੈਪਲੌਇਮੈਂਟ

```bash
# ਟ੍ਰੈਫਿਕ ਤੋਂ ਬਿਨਾਂ ਨਵੀਂ ਰਿਵਿਜ਼ਨ ਬਣਾਓ
azd deploy api --revision-suffix blue --no-traffic

# ਨਵੀਂ ਰਿਵਿਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ਟ੍ਰੈਫਿਕ ਵੰਡੋ (20% ਨੀਲੇ ਨੂੰ, 80% ਮੌਜੂਦਾ ਨੂੰ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ਪੂਰੀ ਤਰ੍ਹਾਂ ਨੀਲੇ ਨੂੰ ਬਦਲੋ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ਪੈਟਰਨ 2: AZD ਨਾਲ ਕੈਨੇਰੀ ਡੈਪਲੌਇਮੈਂਟ

**ਫਾਈਲ: .azure/dev/config.json**
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

**ਡੈਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ:**
```bash
#!/bin/bash
# deploy-canary.sh

# ਨਵਾਂ ਰਿਵੀਜ਼ਨ 10% ਟ੍ਰੈਫਿਕ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd deploy api --revision-mode multiple

# ਮੀਟਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --service api --duration 5m

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਧੀਰੇ-ਧੀਰੇ ਵਧਾਓ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ਮਿੰਟ ਲਈ ਉਡੀਕ ਕਰੋ
done
```

### ਪੈਟਰਨ 3: ਬਹੁ-ਛੇਤਰ ਡੈਪਲੌਇਮੈਂਟ

**ਫਾਈਲ: azure.yaml**
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

**ਫਾਈਲ: infra/multi-region.bicep**
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

**ਡੈਪਲੌਇਮੈਂਟ:**
```bash
# ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਂਡਪੌਇੰਟਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd show --output json | jq '.services.api.endpoints'
```

### ਪੈਟਰਨ 4: Dapr ਏਕੀਕਰਨ

**ਫਾਈਲ: infra/app/dapr-enabled.bicep**
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

**Dapr ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # ਅਵਸਥਾ ਸੇਵ ਕਰੋ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ਇਵੈਂਟ ਨੂੰ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. ਰਿਸੋਰਸ ਸੰਗਠਨ

```bash
# ਨਾਮਕਰਨ ਲਈ ਇੱਕਸਾਰ ਨਿਯਮ ਵਰਤੋ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ਖਰਚ ਦੀ ਟਰੈਕਿੰਗ ਲਈ ਸੰਸਾਧਨਾਂ ਨੂੰ ਟੈਗ ਕਰੋ
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. ਸੁਰੱਖਿਆ ਸਰਵੋਤਮ ਅਭਿਆਸ

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

### 3. ਪ੍ਰਦਰਸ਼ਨ ਉਤਮਕਰਨ

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

### 4. ਨਿਗਰਾਨੀ ਅਤੇ ਨਿਰੀਖਣਯੋਗਤਾ

```bash
# Application Insights ਨੂੰ ਚਾਲੂ ਕਰੋ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ਲੋਗਾਂ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਵੇਖੋ
azd monitor --logs
# ਜਾਂ Container Apps ਲਈ Azure CLI ਵਰਤੋ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ਮੀਟਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਅਲਰਟ ਬਣਾਓ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. ਲਾਗਤ ਉਤਮਕਰਨ

```bash
# ਵਰਤੋਂ ਨਾ ਹੋਣ 'ਤੇ ਸੇਵਾ ਨੂੰ ਜੀਰੋ (0) ਤੱਕ ਸਕੇਲ ਕਰੋ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ਡੈਵ ਵਾਤਾਵਰਣਾਂ ਲਈ ਸਪੌਟ ਇੰਸਟੈਂਸ ਵਰਤੋ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ਬਜਟ ਲਈ ਅਲਰਟ ਸੈੱਟ ਕਰੋ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ਏਕੀਕਰਨ

**GitHub Actions ਉਦਾਹਰਣ:**
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
# ਨਵਾਂ ਕੰਟੇਨਰ ਐਪ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template <template-name>

# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪ ਤੈਨਾਤ ਕਰੋ
azd up

# ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਨੂੰ ਛੱਡੋ)
azd deploy

# ਕੇਵਲ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਤਿਆਰ ਕਰੋ
azd provision

# ਤੈਨਾਤ ਕੀਤੇ ਗਏ ਸਰੋਤ ਵੇਖੋ
azd show

# azd monitor ਜਾਂ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗ ਸਟ੍ਰੀਮ ਕਰੋ
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਸਰੋਤਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

## ਸਮੱਸਿਆ ਹੱਲ

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਸ਼ੁਰੂ ਨਹੀਂ ਹੁੰਦਾ

```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ਕੰਟੇਨਰ ਦੀਆਂ ਘਟਨਾਵਾਂ ਵੇਖੋ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ਸਮੱਸਿਆ: ਕੰਟੇਨਰ ਐਪ ਐਂਡਪੋਇੰਟ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੋ ਰਹੀ

```bash
# Ingress ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ਜਾਂਚੋ ਕਿ ਅੰਦਰੂਨੀ ingress ਚਾਲੂ ਹੈ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ਸਮੱਸਿਆ: ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ

```bash
# ਸੰਸਾਧਨਾਂ ਦੀ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ਸੰਸਾਧਨਾਂ ਨੂੰ ਵਧਾਓ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਉਦਾਹਰਣ](./microservices/README.md)
- [ਸਧਾਰਣ Flask API ਉਦਾਹਰਣ](./simple-flask-api/README.md)
- [Azure Container Apps ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/container-apps/)
- [AZD ਟੈਂਪਲੇਟ ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [Container Apps ਨਮੂਨੇ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ਟੈਂਪਲੇਟਸ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

ਨਵੇਂ ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਣਾਂ ਵਿੱਚ ਯੋਗਦਾਨ ਦੇਣ ਲਈ:

1. ਆਪਣੇ ਉਦਾਹਰਣ ਲਈ ਇੱਕ ਨਵੀਂ ਸਬਡਾਇਰੈਕਟਰੀ ਬਣਾਓ
2. ਪੂਰੇ `azure.yaml`, `infra/`, ਅਤੇ `src/` ਫਾਇਲਾਂ ਸ਼ਾਮਲ ਕਰੋ
3. ਡੈਪਲੌਇਮੈਂਟ ਨਿਰਦੇਸ਼ਾਂ ਦੇ ਨਾਲ ਵਿਸਤ੍ਰਿਤ README ਸ਼ਾਮਲ ਕਰੋ
4. ਡੈਪਲੌਇਮੈਂਟ ਦੀ ਜਾਂਚ `azd up` ਨਾਲ ਕਰੋ
5. ਪੁਲ ਰਿਕਵੇਸਟ ਭੇਜੋ

---

**ਮਦਦ ਚਾਹੀਦੀ ਹੈ?** ਸਹਾਇਤਾ ਅਤੇ ਸਵਾਲਾਂ ਲਈ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ਕਮਿュਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਨੂੰ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਸ਼ੁੱਧਤਾ ਦੀ ਘਾਟ ਹੋ ਸਕਦੀ ਹੈ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਅਹਿਮ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
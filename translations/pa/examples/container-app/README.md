# Container App ਤੈਨਾਤੀ ਉਦਾਹਰਨਾਂ AZD ਨਾਲ

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 ਸਮੱਗਰੀ ਦੀ ਸੂਚੀ

- [ਜਾਇਜ਼ਾ](#overview)
- [ਜਰੂਰੀਆਂ](#prerequisites)
- [ਤੁਰੰਤ ਸ਼ੁਰੂ ਕਰਨ ਦੀਆਂ ਉਦਾਹਰਨਾਂ](#quick-start-examples)
- [ਉਤਪਾਦਨ ਉਦਾਹਰਨਾਂ](#production-examples)
- [ਉੱਨਤ ਪੈਟਰਨ](#advanced-patterns)
- [ਸਰਵੋਤਮ ਅਭਿਆਸ](#ਸਰਵੋਤਮ-ਅਭਿਆਸ)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **ਸਰਲ ਕੀਤਾ ਤੈਨਾਤੀ**: Single command deploys containers with infrastructure
- **ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ**: Scale to zero and scale out based on HTTP traffic or events
- **ਇੰਟਿਗ੍ਰੇਟਡ ਨੈਟਵਰਕਿੰਗ**: Built-in service discovery and traffic splitting
- **Managed Identity**: Secure authentication to Azure resources
- **ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ**: Pay only for resources you use

## Prerequisites

Before getting started, ensure you have:

```bash
# AZD ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# Azure CLI ਦੀ ਜਾਂਚ ਕਰੋ
az version

# Docker ਦੀ ਜਾਂਚ ਕਰੋ (ਕਸਟਮ ਇਮੇਜ ਬਣਾਉਣ ਲਈ)
docker --version

# AZD ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਪ੍ਰਮਾਣਿਤ ਕਰੋ
azd auth login

# ਵਿਕਲਪਿਕ: ਜੇ ਤੁਸੀਂ az ਕਮਾਂਡਾਂ ਨੂੰ ਸਿੱਧਾ ਚਲਾਉਣ ਦੀ ਯੋਜਨਾ ਬਣਾਉਂਦੇ ਹੋ ਤਾਂ Azure CLI ਵਿੱਚ ਸਾਈਨ ਇਨ ਕਰੋ
az login
```

**Required Azure Resources:**
- ਚਾਲੂ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਦੀਆਂ ਅਨੁਮਤੀਆਂ
- Container Apps ਵਾਤਾਵਰਣ ਦੀ ਪਹੁੰਚ

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Deploy a basic REST API with Azure Container Apps.

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

**Deployment Steps:**

```bash
# ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-python-mongo

# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਤਿਆਰ ਕਰੋ ਅਤੇ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Key Features:**
- 0 ਤੋਂ 10 ਰੀਪਲਿਕਾ ਤੱਕ ਆਟੋ-ਸਕੇਲਿੰਗ
- ਹੈਲਥ ਪ੍ਰੋਬਜ਼ ਅਤੇ ਲਾਇਵਨੈੱਸ ਚੈੱਕ
- ਐਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਇੰਜੇਕਸ਼ਨ
- Application Insights ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### 2. Node.js Express API

Deploy a Node.js backend with MongoDB integration.

```bash
# Node.js API ਟੈਮਪਲੇਟ ਨੂੰ ਆਰੰਭ ਕਰੋ
azd init --template todo-nodejs-mongo

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਾਂ ਨੂੰ ਕੰਫਿਗਰ ਕਰੋ
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ਤੈਨਾਤ ਕਰੋ
azd up

# Azure Monitor ਰਾਹੀਂ ਲੌਗ ਵੇਖੋ
azd monitor --logs
```

**Infrastructure Highlights:**
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

Deploy a full-stack application with React frontend and API backend.

```bash
# ਪੂਰੇ-ਸਟੈਕ ਟੈੰਪਲੇਟ ਦੀ ਸ਼ੁਰੂਆਤ ਕਰੋ
azd init --template todo-csharp-sql-swa-func

# ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
cat azure.yaml

# ਦੋਨੋਂ ਸੇਵਾਵਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਖੋਲ੍ਹੋ
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: ਕਈ ਮਾਈਕਰੋਸਰਵਿਸਾਂ ਵਾਲੀ ਈ-ਕਾਮਰਸ ਐਪਲੀਕੇਸ਼ਨ

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

**Deployment:**
```bash
# ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
azd init

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ ਸੈੱਟ ਕਰੋ
azd env new production

# ਉਤਪਾਦਨ ਸੈਟਿੰਗਾਂ ਸੰਰਚਿਤ ਕਰੋ
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ਸਭ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਤੈਨਾਤੀ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: Microsoft Foundry Models ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਵਾਲੀ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

**ਫਾਈਲ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ ਲਈ ਮੈਨੇਜਡ ਆਈਡੈਂਟੀਟੀ ਦੀ ਵਰਤੋਂ ਕਰੋ
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # ਕੀ ਵੌਲਟ ਤੋਂ ਓਪਨਏਆਈ ਦੀ ਕੁੰਜੀ ਪ੍ਰਾਪਤ ਕਰੋ
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

**ਤੈਨਾਤੀ ਕਮਾਂਡਾਂ:**
```bash
# ਇਨਵਾਇਰਨਮੈਂਟ ਸੈੱਟ ਕਰੋ
azd init --template ai-chat-app
azd env new dev

# OpenAI ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ਤੈਨਾਤ ਕਰੋ
azd up

# API ਦੀ ਜਾਂਚ ਕਰੋ
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**Scenario**: ਸੰਦੇਸ਼ ਕਤਾਰ ਨਾਲ ਆਰਡਰ ਪ੍ਰੋਸੈਸਿੰਗ ਸਿਸਟਮ

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
            # ਆਰਡਰ ਦੀ ਪ੍ਰਕਿਰਿਆ
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

**ਤੈਨਾਤੀ:**
```bash
# ਸ਼ੁਰੂ ਕਰੋ
azd init

# ਕਤਾਰ ਸੰਰਚਨਾ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up

# ਕਤਾਰ ਦੀ ਲੰਬਾਈ ਦੇ ਅਧਾਰ 'ਤੇ ਵਰਕਰ ਦਾ ਪੈਮਾਨਾ ਬਦਲੋ
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
# ਟ੍ਰੈਫਿਕ ਤੋਂ ਬਿਨਾਂ ਨਵੀਂ ਰਿਵਿਜ਼ਨ ਬਣਾਓ
azd deploy api --revision-suffix blue --no-traffic

# ਨਵੀਂ ਰਿਵਿਜ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ਟ੍ਰੈਫਿਕ ਵੰਡੋ (20% ਨੀਲੇ ਨੂੰ, 80% ਮੌਜੂਦਾ ਨੂੰ)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਪੂਰੀ ਤਰ੍ਹਾਂ ਨੀਲੇ ਵੱਲ ਕਰੋ
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

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

**ਤੈਨਾਤੀ ਸਕ੍ਰਿਪਟ:**
```bash
#!/bin/bash
# deploy-canary.sh

# ਨਵੀਂ ਰਿਵੀਜ਼ਨ 10% ਟਰੈਫਿਕ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd deploy api --revision-mode multiple

# ਮੀਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --service api --duration 5m

# ਟਰੈਫਿਕ ਨੂੰ ਧੀਰੇ-ਧੀਰੇ ਵਧਾਓ
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 ਮਿੰਟ ਉਡੀਕ ਕਰੋ
done
```

### Pattern 3: Multi-Region Deployment

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

**ਤੈਨਾਤੀ:**
```bash
# ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਂਡਪੌਇੰਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

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
        # ਸਥਿਤੀ ਸੰਭਾਲੋ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # ਇਵੈਂਟ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ਸਰਵੋਤਮ ਅਭਿਆਸ

### 1. Resource Organization

```bash
# ਇੱਕਸਾਰ ਨਾਮਕਰਨ ਰੀਤਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ ਲਈ ਸਰੋਤਾਂ ਨੂੰ ਟੈਗ ਕਰੋ
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
# Application Insights ਨੂੰ ਚਾਲੂ ਕਰੋ
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ਲੌਗਾਂ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਵੇਖੋ
azd monitor --logs
# ਜਾਂ Container Apps ਲਈ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰੋ:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ਮੈਟ੍ਰਿਕਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਚੇਤਾਵਨੀਆਂ ਬਣਾਓ
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# ਵਰਤੋਂ ਨਾ ਹੋਣ ਵੇਲੇ 0 ਤੱਕ ਸਕੇਲ ਕਰੋ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ਡੈਵਲਪਮੈਂਟ ਵਾਤਾਵਰਣਾਂ ਲਈ ਸਪੌਟ ਇੰਸਟੈਂਸ ਵਰਤੋ
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ਬਜਟ ਚੇਤਾਵਨੀਆਂ ਸੈਟ ਕਰੋ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

**GitHub Actions Example:**
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

# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd up

# ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਨੂੰ ਛੱਡੋ)
azd deploy

# ਸਿਰਫ਼ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਤਿਆਰ ਕਰੋ
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

## Troubleshooting

### Issue: Container fails to start

```bash
# Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲੌਗਾਂ ਜਾਂਚੋ
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ਕੰਟੇਨਰ ਦੀਆਂ ਘਟਨਾਵਾਂ ਵੇਖੋ
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ਲੋਕਲ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# Ingress ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ਜਾਂਚ ਕਰੋ ਕਿ ਅੰਦਰੂਨੀ ingress ਚਾਲੂ ਹੈ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

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
- [ਮਾਈਕਰੋਸਰਵਿਸ ਉਦਾਹਰਨ](./microservices/README.md)
- [ਸਧਾਰਣ Flask API ਉਦਾਹਰਨ](./simple-flask-api/README.md)
- [Azure Container Apps ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/container-apps/)
- [AZD ਟੈਪਲੇਟ ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [Container Apps ਨਮੂਨੇ](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ਟੈਮਪਲੇਟ](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

To contribute new container app examples:

1. ਆਪਣੀ ਉਦਾਹਰਨ ਨਾਲ ਇੱਕ ਨਵਾਂ ਸਬਡਾਇਰੈਕਟਰੀ ਬਣਾਓ
2. ਪੂਰੀਆਂ `azure.yaml`, `infra/`, ਅਤੇ `src/` ਫਾਈਲਾਂ ਸ਼ਾਮਲ ਕਰੋ
3. ਤੈਨਾਤੀ ਨਿਰਦੇਸ਼ਾਂ ਸਮੇਤ ਵਿਸਤ੍ਰਿਤ README ਜੋੜੋ
4. ਤੈਨਾਤੀ ਦੀ ਜਾਂਚ `azd up` ਨਾਲ ਕਰੋ
5. ਪੁਲ ਰਿਕਵੈਸਟ ਭੇਜੋ

---

**ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?** ਸਮਰਥਨ ਅਤੇ ਸਵਾਲਾਂ ਲਈ [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) ਸਮੁਦਾਇ ਨਾਲ ਜੁੜੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੰਪੂਰਨਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਜਿਸ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਹੈ, ਉਸਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
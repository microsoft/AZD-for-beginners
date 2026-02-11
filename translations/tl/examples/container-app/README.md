# Container App Deployment Examples with AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Talaan ng Nilalaman

- [Overview](../../../../examples/container-app)
- [Prerequisites](../../../../examples/container-app)
- [Quick Start Examples](../../../../examples/container-app)
- [Production Examples](../../../../examples/container-app)
- [Advanced Patterns](../../../../examples/container-app)
- [Best Practices](../../../../examples/container-app)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Pinadaling Pag-deploy**: Single command deploys containers with infrastructure
- **Awtomatikong Pag-scale**: Scale to zero and scale out based on HTTP traffic or events
- **Pinagsamang Networking**: Built-in service discovery and traffic splitting
- **Pinangangasiwang Pagkakakilanlan**: Secure authentication to Azure resources
- **Pag-optimize ng Gastos**: Pay only for resources you use

## Mga Kinakailangan

Bago magsimula, tiyakin na mayroon ka ng:

```bash
# Suriin ang pag-install ng AZD
azd version

# Suriin ang Azure CLI
az version

# Suriin ang Docker (para sa pagbuo ng mga pasadyang imahe)
docker --version

# Mag-login sa Azure
azd auth login
az login
```

**Kinakailangang Mga Azure na Mapagkukunan:**
- Aktibong subscription sa Azure
- Pahintulot para sa paglikha ng resource group
- Pag-access sa environment ng Container Apps

## Mabilis na Pagsisimula na Mga Halimbawa

### 1. Simpleng Web API (Python Flask)

I-deploy ang isang simpleng REST API gamit ang Azure Container Apps.

**Halimbawa: Python Flask API**

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

**Mga Hakbang sa Pag-deploy:**

```bash
# I-initialize mula sa template
azd init --template todo-python-mongo

# Maglaan ng imprastruktura at mag-deploy
azd up

# Subukan ang deployment
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Mga Pangunahing Katangian:**
- Auto-scaling mula 0 hanggang 10 na replica
- Mga pagsusuri ng kalusugan at mga liveness check
- Pagsingit ng mga environment variable
- Integrasyon ng Application Insights

### 2. Node.js Express API

I-deploy ang backend ng Node.js na may integrasyon sa MongoDB.

```bash
# I-initialize ang template ng Node.js API
azd init --template todo-nodejs-mongo

# I-configure ang mga environment variable
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# I-deploy
azd up

# Tingnan ang mga log gamit ang Azure Monitor
azd monitor --logs
```

**Pangunahing Tampok ng Infrastrukturang:**
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

I-deploy ang isang full-stack na aplikasyon na may React frontend at API backend.

```bash
# I-initialize ang full-stack na template
azd init --template todo-csharp-sql-swa-func

# Repasuhin ang konfigurasyon
cat azure.yaml

# I-deploy ang parehong mga serbisyo
azd up

# Buksan ang aplikasyon
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Mga Halimbawa para sa Produksyon

### Example 1: Arkitektura ng Microservices

**Senaryo**: Aplikasyon ng e-commerce na may maraming microservices

**Istruktura ng Direktoryo:**
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

**Konfigurasyon ng azure.yaml:**
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

**Pag-deploy:**
```bash
# I-initialize ang proyekto
azd init

# Itakda ang kapaligiran ng produksyon
azd env new production

# I-configure ang mga setting ng produksyon
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# I-deploy ang lahat ng serbisyo
azd up

# Subaybayan ang pag-deploy
azd monitor --overview
```

### Example 2: Container App na Pinapagana ng AI

**Senaryo**: AI chat na aplikasyon na may integrasyon sa Azure OpenAI

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Gamitin ang Managed Identity para sa ligtas na pag-access
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Kunin ang susi ng OpenAI mula sa Key Vault
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

**Mga Utos sa Pag-deploy:**
```bash
# Ihanda ang kapaligiran
azd init --template ai-chat-app
azd env new dev

# Isaayos ang OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# I-deploy
azd up

# Subukan ang API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker na may Pagpoproseso ng Queue

**Senaryo**: Sistemang pagproseso ng order na may message queue

**Istruktura ng Direktoryo:**
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
            # Proseso ng order
            print(f"Processing order: {message.content}")
            
            # Kumpletong mensahe
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

**Pag-deploy:**
```bash
# I-initialize
azd init

# I-deploy gamit ang konfigurasyon ng pila
azd up

# I-scale ang worker batay sa haba ng pila
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Mga Advanced na Pattern

### Pattern 1: Blue-Green Deployment

```bash
# Lumikha ng bagong rebisyon nang walang trapiko
azd deploy api --revision-suffix blue --no-traffic

# Subukan ang bagong rebisyon
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Hatiin ang trapiko (20% sa blue, 80% sa kasalukuyan)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Ganap na paglipat sa blue
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

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

**Script ng Pag-deploy:**
```bash
#!/bin/bash
# deploy-canary.sh

# I-deploy ang bagong rebisyon sa 10% ng trapiko
azd deploy api --revision-mode multiple

# Subaybayan ang mga sukatan
azd monitor --service api --duration 5m

# Dahan-dahang dagdagan ang trapiko
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Maghintay ng 5 minuto
done
```

### Pattern 3: Multi-Region Deployment

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

**Pag-deploy:**
```bash
# I-deploy sa lahat ng rehiyon
azd up

# I-verify ang mga endpoint
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Integrasyon ng Dapr

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

**Kodigo ng Aplikasyon na may Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # I-save ang estado
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # I-publish ang kaganapan
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Mga Pinakamahusay na Kasanayan

### 1. Organisasyon ng Mga Mapagkukunan

```bash
# Gumamit ng pare-parehong mga kumbensiyon sa pagngalan
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Lagyan ng tag ang mga resource para sa pagsubaybay ng gastos
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Pinakamahusay na Mga Kasanayan sa Seguridad

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

### 3. Pag-optimize ng Pagganap

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

### 4. Pagmamanman at Observability

```bash
# Paganahin ang Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Tingnan ang mga log nang real-time
azd monitor --logs
# O gumamit ng Azure CLI para sa Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Subaybayan ang mga sukatan
azd monitor --live

# Lumikha ng mga alerto
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Pag-optimize ng Gastos

```bash
# Mag-scale sa zero kapag hindi ginagamit
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Gumamit ng spot instances para sa mga development environment
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Mag-set up ng mga alerto sa badyet
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integrasyon ng CI/CD

**Halimbawa ng GitHub Actions:**
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

## Karaniwang Sanggunian ng Mga Utos

```bash
# I-initialize ang bagong proyekto ng container app
azd init --template <template-name>

# I-deploy ang imprastruktura at aplikasyon
azd up

# I-deploy lamang ang kodigo ng aplikasyon (laktawan ang imprastruktura)
azd deploy

# Maglaan lamang ng imprastruktura
azd provision

# Tingnan ang mga na-deploy na resources
azd show

# I-stream ang mga log gamit ang azd monitor o Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Subaybayan ang aplikasyon
azd monitor --overview

# Linisin ang mga resources
azd down --force --purge
```

## Pag-troubleshoot

### Isyu: Nabibigo magsimula ang container

```bash
# Suriin ang mga log gamit ang Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Tingnan ang mga kaganapan ng container
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Subukan nang lokal
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Isyu: Hindi ma-access ang endpoint ng container app

```bash
# Suriin ang konfigurasyon ng ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Suriin kung pinapagana ang internal na ingress
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Isyu: Mga problema sa pagganap

```bash
# Suriin ang paggamit ng mga mapagkukunan
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Palakihin ang mga mapagkukunan
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Dagdag na Mga Mapagkukunan at Mga Halimbawa
- [Halimbawa ng Microservices](./microservices/README.md)
- [Halimbawa ng Simpleng Flask API](./simple-flask-api/README.md)
- [Dokumentasyon ng Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Gallery ng Mga Template ng AZD](https://azure.github.io/awesome-azd/)
- [Mga Sample ng Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Mga Template ng Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Pag-aambag

Upang mag-ambag ng bagong mga halimbawa ng container app:

1. Gumawa ng bagong subdirectory na may iyong halimbawa
2. Isama ang kumpletong `azure.yaml`, `infra/`, at `src/` na mga file
3. Magdagdag ng komprehensibong README na may mga tagubilin sa pag-deploy
4. Subukan ang pag-deploy gamit ang `azd up`
5. Mag-submit ng pull request

---

**Kailangan ng Tulong?** Sumali sa komunidad ng [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) para sa suporta at mga tanong.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyong pagsasalin [Co-op Translator] (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling pagbibigay-kahulugan na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
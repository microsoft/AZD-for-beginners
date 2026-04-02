# AZD తో Container App డిప్లాయ్‌మెంట్ ఉదాహరణలు

ఈ డైరెక్టరీలో Azure Developer CLI (AZD) ఉపయోగించి Azure Container Appsకి కంటైనరైజ్డ్ అప్లికేషన్లను డిప్లాయ్ చేయడానికి సమగ్ర ఉదాహరణలు ఉన్నాయి. ఈ ఉదాహరణలు వాస్తవ-ప్రపంచ నమూనాలు, ఉత్తమ పద్ధతులు, మరియు ప్రొడక్షన్‌కు సిద్ధమైన కాన్ఫిగరేషన్లను చూపిస్తాయి.

## 📚 విషయసూచి

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start Examples](#quick-start-examples)
- [Production Examples](#production-examples)
- [Advanced Patterns](#advanced-patterns)
- [Best Practices](#best-practices)

## Overview

Azure Container Apps ఒక ఫుల్‌య్ మేనేజ్‌డ్ సర్వర్‌లెస్ కంటైనర్ ప్లాట్‌ఫార్మ్, ఇది మీరు మైక్రోసర్వీసులు మరియు కంటైనరైజ్డ్ అప్లికేషన్లను ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వహణ లేకుండా నడపగలుగుతారు. AZDతో కలిపితే, మీరు పొందుతారు:

- **సరళతరమైన డిప్లాయ్‌మెంట్**: ఒకే కమాండ్ ద్వారా కంటైనర్లు మరియు ఇన్‌ఫ్రా డిప్లాయ్ అవుతాయి
- **ఆటోమాటిక్ స్కేలింగ్**: HTTP ట్రాఫిక్ లేదా ఈవెంట్స్ ఆధారంగా షూన్యానికి స్కేల్ అవ్వడం మరియు స్కేల్ అవుట్
- **ఇంటిగ్రేటెడ్ నెట్‌వర్కింగ్**: బిల్ట్-ఇన్ సర్వీస్ డిస్కవరీ మరియు ట్రాఫిక్ స్ప్లిటింగ్
- **Managed Identity**: Azure వనరులకు సురక్షిత ఆథెంటికేషన్
- **ఖర్చు ఆప్టిమైజేషన్**: మీరు ఉపయోగించే వనరులకు మాత్రమే చెల్లించండి

## Prerequisites

మొదలుపెట్టేముందు, మీ వద్ద ఉండే విషయం ఖాయం చేసుకోండి:

```bash
# AZD ఇన్‌స్టాలేషన్‌ని తనిఖీ చేయండి
azd version

# Azure CLIని తనిఖీ చేయండి
az version

# Dockerని తనిఖీ చేయండి (కస్టమ్ ఇమేజ్‌లను నిర్మించడానికి)
docker --version

# AZD డిప్లాయ్‌మెంట్‌ల కోసం ప్రామాణీకరణ చేయండి
azd auth login

# ఐచ్చికం: మీరు az కమాండ్లను నేరుగా నడపాలనుకుంటే Azure CLIలో లాగిన్ అవ్వండి
az login
```

**అవసరమైన Azure వనరులు:**
- Active Azure subscription
- Resource group creation permissions
- Container Apps environment access

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Appsతో ఒక ప్రాథమిక REST APIని డిప్లాయ్ చేయండి.

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
# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-python-mongo

# ఇన్ఫ్రాస్ట్రక్చర్‌ను ఏర్పాటుచేసి అమలు చేయండి
azd up

# డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ప్రధాన ఫీచర్లు:**
- 0 నుండి 10 రిప్లికాల వరకు ఆటో-స్కేలింగ్
- హెల్త్ ప్రోబ్స్ మరియు లైవ్‌నెస్ చెక్కులు
- ఎన్విరాన్‌మెంట్ వేరియబుల్ ఇంజెక్షన్
- Application Insights ఇంటిగ్రేషన్

### 2. Node.js Express API

MongoDB ఇంటిగ్రేషన్ ఉన్న Node.js బ్యాక్‌ఎండ్‌ను డిప్లాయ్ చేయండి.

```bash
# Node.js API టెంప్లేట్‌ను ప్రారంభించండి
azd init --template todo-nodejs-mongo

# పర్యావరణ వేరియబుల్‌లను కాన్ఫిగర్ చేయండి
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# డిప్లాయ్ చేయండి
azd up

# Azure Monitor ద్వారా లాగ్‌లను వీక్షించండి
azd monitor --logs
```

**ఇన్‌ఫ్రాస్ట్రక్చర్ ముఖ్యాంశాలు:**
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

React ఫ్రంట్‌ఎండ్ మరియు API బ్యాక్‌ఎండ్‌తో పూర్తి-స్టాక్ అప్లికేషన్‌ను డిప్లాయ్ చేయండి.

```bash
# ఫుల్-స్టాక్ టెంప్లేట్‌ను ప్రారంభించండి
azd init --template todo-csharp-sql-swa-func

# కాన్ఫిగరేషన్‌ను సమీక్షించండి
cat azure.yaml

# రెండు సేవలను అమలు చేయండి
azd up

# అప్లికేషన్‌ను తెరవండి
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: బహుళ మైక్రోసర్వీసులతో E-commerce అప్లికేషన్

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
# ప్రాజెక్ట్‌ను ప్రారంభించండి
azd init

# ఉత్పత్తి వాతావరణాన్ని సెట్ చేయండి
azd env new production

# ఉత్పత్తి సెట్టింగులను కాన్ఫిగర్ చేయండి
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# అన్ని సేవలను అమలులో పెట్టండి
azd up

# అమలులో పెట్టిన వాటిని పర్యవేక్షించండి
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: Microsoft Foundry Models ఇంటిగ్రేషన్ తో AI చాట్ అప్లికేషన్

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# భద్రమైన ప్రాప్తి కోసం Managed Identity ఉపయోగించండి
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault నుండి OpenAI కీ పొందండి
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

**Deployment Commands:**
```bash
# పరివేశాన్ని ఏర్పాటు చేయండి
azd init --template ai-chat-app
azd env new dev

# OpenAIని కాన్ఫిగర్ చేయండి
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# డిప్లాయ్ చేయండి
azd up

# APIని పరీక్షించండి
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**Scenario**: మెసేజ్ క్యూ తో ఆర్డర్ ప్రాసెసింగ్ సిస్టమ్

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
            # ఆర్డర్‌ను ప్రాసెస్ చేయండి
            print(f"Processing order: {message.content}")
            
            # పూర్తి సందేశం
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

**Deployment:**
```bash
# ప్రారంభించండి
azd init

# క్యూలు కాన్ఫిగరేషన్‌తో అమలు చేయండి
azd up

# క్యూలు పొడవు ఆధారంగా వర్కర్‌లను స్కేల్ చేయండి
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
# ట్రాఫిక్ లేకుండానే కొత్త రివిజన్‌ను సృష్టించండి
azd deploy api --revision-suffix blue --no-traffic

# కొత్త రివిజన్‌ను పరీక్షించండి
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ట్రాఫిక్‌ను విభజించండి (బ్లూ‌కు 20%, ప్రస్తుతానికి 80%)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# పూర్తిగా బ్లూ‌కు మార్చండి
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

**Deployment Script:**
```bash
#!/bin/bash
# deploy-canary.sh

# కొత్త రివిజన్‌ను 10% ట్రాఫిక్‌తో డిప్లాయ్ చేయండి
azd deploy api --revision-mode multiple

# మెట్రిక్స్‌ను పర్యవేక్షించండి
azd monitor --service api --duration 5m

# ట్రాఫిక్‌ను నెమ్మదిగా పెంచండి
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 నిమిషాలు వేచి ఉండండి
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

**Deployment:**
```bash
# అన్ని ప్రాంతాల్లో అమలు చేయండి
azd up

# ఎండ్‌పాయింట్లను ధృవీకరించండి
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

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

**Application Code with Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # స్థితిని నిల్వ చేయండి
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # సంఘటనను ప్రచురించండి
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
# ఒకరూపమైన నామకరణ నియమాలను ఉపయోగించండి
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ఖర్చుల ట్రాకింగ్ కోసం వనరులకు ట్యాగ్ చేయండి
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
# Application Insights ను సక్రియం చేయండి
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# లాగ్‌లను రియల్-టైమ్ లో చూడండి
azd monitor --logs
# లేదా Container Apps కోసం Azure CLI ఉపయోగించండి:
az containerapp logs show --name api --resource-group rg-myapp --follow

# మెట్రిక్స్‌ను పర్యవేక్షించండి
azd monitor --live

# అలర్ట్‌లను సృష్టించండి
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# వాడకంలో లేకపోవేటప్పుడు శూన్యానికి స్కేల్ చేయండి
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# డెవ్ పరిసరాల కోసం స్పాట్ ఇన్స్టాన్స్‌లు ఉపయోగించండి
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# బడ్జెట్ హెచ్చరికలను ఏర్పాటు చేయండి
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
# కొత్త కంటైనర్ యాప్ ప్రాజెక్టును ప్రారంభించండి
azd init --template <template-name>

# ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను డిప్లాయ్ చేయండి
azd up

# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్‌ఫ్రాస్ట్రక్చర్‌ను దాటవేయండి)
azd deploy

# కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్‌ను మాత్రమే ఏర్పాటు చేయండి
azd provision

# డిప్లాయ్ చేసిన వనరులను వీక్షించండి
azd show

# azd monitor లేదా Azure CLI ఉపయోగించి లాగ్‌లను స్ట్రీమ్ చేయండి
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# అప్లికేషన్‌ను మానిటర్ చేయండి
azd monitor --overview

# వనరులను శుభ్రపరచండి
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Azure CLI ఉపయోగించి లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# కంటైనర్ సంఘటనలను వీక్షించండి
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# స్థానికంగా పరీక్షించండి
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# ఇంగ్రెస్ కాన్ఫిగరేషన్‌ను ధృవీకరించండి
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# అంతర్గత ఇంగ్రెస్ సక్రియంగా ఉన్నదో లేదో తనిఖీ చేయండి
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# వనరుల వినియోగం తనిఖీ చేయండి
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# వనరులను పెంచండి
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [మైక్రోసర్విసెస్ ఉదాహరణ](./microservices/README.md)
- [సింపుల్ Flash API ఉదాహరణ](./simple-flask-api/README.md)
- [Azure Container Apps డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps నమూనాలు](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep టెంప్లెట్స్](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

కొత్త కంటైనర్ యాప్ ఉదాహరణలు జోడించడానికి:

1. Create a new subdirectory with your example
2. Include complete `azure.yaml`, `infra/`, and `src/` files
3. Add comprehensive README with deployment instructions
4. Test deployment with `azd up`
5. Submit a pull request

---

**సహాయం కావాలా?** Microsoft Foundry Discord సమూహంలో మద్దతు మరియు ప్రశ్నల కోసం చేరండి: [Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలిత అనువాదాల్లో తప్పులు లేదా అసమర్థతలు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. అసలు డాక్యుమెంట్‌ను దాని మూల భాషలోనే అధికారిక మూలంగా పరిగణించాలి. సంక్లిష్టమైన లేదా ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం వలన కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
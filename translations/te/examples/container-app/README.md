# AZD తో కంటెయినర్ యాప్ డిప్లాయ్‌మెంట్ ఉదాహరణలు

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 విషయ సూచిక

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start Examples](#quick-start-examples)
- [Production Examples](#production-examples)
- [Advanced Patterns](#అధునాటన-నమూనాలు)
- [Best Practices](#ఉత్తమ-పద్ధతులు)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Simplified Deployment**: Single command deploys containers with infrastructure
- **Automatic Scaling**: Scale to zero and scale out based on HTTP traffic or events
- **Integrated Networking**: Built-in service discovery and traffic splitting
- **Managed Identity**: Secure authentication to Azure resources
- **Cost Optimization**: Pay only for resources you use

## Prerequisites

Before getting started, ensure you have:

```bash
# AZD ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
azd version

# Azure CLI ను తనిఖీ చేయండి
az version

# Docker (కస్టమ్ ఇమేజ్‌లను తయారు చేయడానికి) ను తనిఖీ చేయండి
docker --version

# Azureలో లాగిన్ చేయండి
azd auth login
az login
```

**అవసరమైన Azure వనరులు:**
- సక్రియ Azure సబ్స్క్రిప్షన్
- రీసోర్స్ గ్రూప్ సృష్టి అనుమతులు
- కంటెయినర్ యాప్స్ పర్యావరణానికి ప్రాప్తి

## Quick Start Examples

### 1. సాదాసీదా వెబ్ API (Python Flask)

Deploy a basic REST API with Azure Container Apps.

**ఉదాహరణ: Python Flask API**

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

**డిప్లాయ్‌మెంట్ దశలు:**

```bash
# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-python-mongo

# ఇన్ఫ్రాస్ట్రక్చర్‌ను ఏర్పాటు చేసి డిప్లాయ్ చేయండి
azd up

# డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ప్రధాన ఫీచర్లు:**
- 0 నుండి 10 రెప్లికాల వరకు ఆటో-స్కేలింగ్
- హెల్త్ ప్రొబ్‌లు మరియు లైవ్‌నెస్ చెక్లు
- ఎన్విరాన్‌మెంట్ వేరియబుల్ ఇంజెక్షన్
- Application Insights ఏకీకరణ

### 2. Node.js Express API

Deploy a Node.js backend with MongoDB integration.

```bash
# Node.js API టెంప్లేట్‌ను ప్రారంభించండి
azd init --template todo-nodejs-mongo

# పర్యావరణ వేరియబుల్స్‌ను కాన్ఫిగర్ చేయండి
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# డిప్లాయ్ చేయండి
azd up

# Azure Monitor ద్వారా లాగ్‌లను వీక్షించండి
azd monitor --logs
```

**ఇన్ఫ్రాస్ట్రక్చర్ ముఖ్యాంశాలు:**
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

### 3. స్థిర ఫ్రంటెండ్ + API బ్యాక్‌ఎండ్

Deploy a full-stack application with React frontend and API backend.

```bash
# ఫుల్-స్టాక్ టెంప్లేట్‌ను ప్రారంభించండి
azd init --template todo-csharp-sql-swa-func

# కాన్ఫిగరేషన్‌ను సమీక్షించండి
cat azure.yaml

# రెండు సేవలను అమలు చేయండి
azd up

# అనువర్తనాన్ని తెరవండి
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### ఉదాహరణ 1: మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్

**సన్నివేశం**: బహుళ మైక్రోసర్వీసులతో కూడిన E-commerce అప్లికేషన్

**డైరెక్టరీ నిర్మాణం:**
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

**azure.yaml కాంఫిగరేషన్:**
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

**డిప్లాయ్‌మెంట్:**
```bash
# ప్రాజెక్ట్‌ను ప్రారంభించండి
azd init

# ఉత్పత్తి వాతావరణాన్ని సెట్ చేయండి
azd env new production

# ఉత్పత్తి సెట్టింగులను కాన్ఫిగర్ చేయండి
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# అన్ని సేవలను డిప్లాయ్ చేయండి
azd up

# డిప్లాయ్‌మెంట్‌ను పర్యవేక్షించండి
azd monitor --overview
```

### ఉదాహరణ 2: AI-పవర్డ్ కంటెయినర్ యాప్

**సన్నివేశం**: Microsoft Foundry Models సమన్వయం ఉన్న AI చాట్ అప్లికేషన్

**ఫైల్: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# సురక్షిత ప్రవేశానికి Managed Identityని ఉపయోగించండి
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault నుండి OpenAI కీని పొందండి
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

**ఫైల్: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ఫైల్: infra/main.bicep**
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

**డిప్లాయ్‌మెంట్ కమాండ్లు:**
```bash
# పర్యావరణాన్ని ఏర్పాటు చేయండి
azd init --template ai-chat-app
azd env new dev

# OpenAIని కాన్ఫిగర్ చేయండి
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ప్రవేశపెట్టండి
azd up

# APIని పరీక్షించండి
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ఉదాహరణ 3: క్యూయ్ ప్రాసెసింగ్ తో బ్యాక్‌గ్రౌండ్ వర్కర్

**సన్నివేశం**: మెసేజ్ క్యూయ్ తో ఆర్డర్ ప్రాసెసింగ్ సిస్టం

**డైరెక్టరీ నిర్మాణం:**
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

**ఫైల్: src/worker/processor.py**
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
            # ఆర్డర్‌ను ప్రాసెస్ చేయడం
            print(f"Processing order: {message.content}")
            
            # సందేశాన్ని పూర్తి చేయడం
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ఫైల్: azure.yaml**
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

**డిప్లాయ్‌మెంట్:**
```bash
# ప్రారంభించండి
azd init

# క్యూలు కాన్ఫిగరేషన్‌తో అమలు చేయండి
azd up

# క్యూలు పొడవు ఆధారంగా వర్కర్‌ను స్కేల్ చేయండి
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## అధునాటన నమూనాలు

### నమూనా 1: బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్

```bash
# ట్రాఫిక్ లేకుండా కొత్త రివిజన్ సృష్టించండి
azd deploy api --revision-suffix blue --no-traffic

# కొత్త రివిజన్‌ను పరీక్షించండి
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ట్రాఫిక్‌ను విభజించండి (20% బ్లూకి, 80% ప్రస్తుతానికి)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# ట్రాఫిక్‌ను పూర్తిగా బ్లూకి దారిమార్చండి
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### నమూనా 2: AZD తో కెనరీ డిప్లాయ్‌మెంట్

**ఫైల్: .azure/dev/config.json**
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

**డిప్లాయ్‌మెంట్ స్క్రిప్ట్:**
```bash
#!/bin/bash
# deploy-canary.sh

# కొత్త రివిజన్‌ను 10% ట్రాఫిక్‌తో డిప్లాయ్ చేయండి
azd deploy api --revision-mode multiple

# మెట్రిక్స్‌ను పర్యవేక్షించండి
azd monitor --service api --duration 5m

# దశలవారీగా ట్రాఫిక్‌ను పెంచండి
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 నిమిషాలు వేచి ఉండండి
done
```

### నమూనా 3: బహుళ-రీజియన్ డిప్లాయ్‌మెంట్

**ఫైల్: azure.yaml**
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

**ఫైల్: infra/multi-region.bicep**
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

**డిప్లాయ్‌మెంట్:**
```bash
# అన్ని ప్రాంతాల్లో అమర్చండి
azd up

# ఎండ్‌పాయింట్లను ధృవీకరించండి
azd show --output json | jq '.services.api.endpoints'
```

### నమూనా 4: Dapr సమన్వయం

**ఫైల్: infra/app/dapr-enabled.bicep**
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

**Dapr తో అప్లికేషన్ కోడ్:**
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
        
        # ఈవెంట్‌ను ప్రచురించండి
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## ఉత్తమ పద్ధతులు

### 1. వనరుల ఏర్పాటు

```bash
# పేరుల కోసం స్థిరమైన నామకరణ నియమాలను ఉపయోగించండి
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ఖర్చుల ట్రాకింగ్ కోసం వనరులను ట్యాగ్ చేయండి
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. భద్రత ఉత్తమ పద్ధతులు

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

### 3. పనితీరు ఆప్టిమైజేషన్

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

### 4. మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

```bash
# Application Insights ను సక్రియం చేయండి
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# లాగ్‌లను రియల్-టైమ్‌లో చూడండి
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

### 5. ఖర్చు ఆప్టిమైజేషన్

```bash
# ఉపయోగంలో లేనప్పుడు జీరోకు స్కేలు చేయండి
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# డెవలప్‌మెంట్ పరిసరాల కోసం స్పాట్ ఇన్‌స్టాన్సులను ఉపయోగించండి
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# బడ్జెట్ హెచ్చరికలను ఏర్పాటు చేయండి
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD సమన్వయం

**GitHub Actions ఉదాహరణ:**
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

## సాధారణ కమాండ్ల సూచిక

```bash
# కొత్త కంటెయినర్ యాప్ ప్రాజెక్టును ప్రారంభించండి
azd init --template <template-name>

# ఇన్‌ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను డిప్లాయ్ చేయండి
azd up

# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే డిప్లాయ్ చేయండి (ఇన్‌ఫ్రాస్ట్రక్చర్‌ను దాటవేయండి)
azd deploy

# కేవలం ఇన్‌ఫ్రాస్ట్రక్చర్‌ను మాత్రమే ఏర్పాటు చేయండి
azd provision

# డిప్లాయ్ చేయబడిన వనరులను వీక్షించండి
azd show

# azd monitor లేదా Azure CLI ఉపయోగించి లాగ్‌లను స్ట్రీమ్ చేయండి
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --overview

# వనరులను తొలగించండి
azd down --force --purge
```

## సమస్య పరిష్కారం

### సమస్య: కంటెయినర్ ప్రారంభం అవడంలో విఫలమవుతోంది

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

### సమస్య: కంటెయినర్ యాప్ ఎండ్‌పాయింట్‌కి యాక్సెస్ చేయలేకపోవడం

```bash
# ఇన్‌గ్రెస్ కాన్ఫిగరేషన్‌ను నిర్ధారించండి
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# అంతర్గత ఇన్‌గ్రెస్ సక్రియమై ఉన్నదో లేదో తనిఖీ చేయండి
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### సమస్య: పనితీరు సమస్యలు

```bash
# వనరుల వినియోగాన్ని తనిఖీ చేయండి
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

## అదనపు వనరులు మరియు ఉదాహరణలు
- [మైక్రోసర్వీసెస్ ఉదాహరణ](./microservices/README.md)
- [సింపుల్ ఫ్లాష్ API ఉదాహరణ](./simple-flask-api/README.md)
- [Azure Container Apps డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/container-apps/)
- [AZD టెంప్లేట్స్ గ్యాలరీ](https://azure.github.io/awesome-azd/)
- [Container Apps నమూనాలు](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep టెంప్లేట్స్](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## కాంట్రిబ్యూట్ చేయడం

To contribute new container app examples:

1. మీ ఉదాహరణతో ఒక కొత్త ఉప-డైరెక్టరీని సృష్టించండి
2. పూర్తి `azure.yaml`, `infra/`, మరియు `src/` ఫైళ్లను చేర్చండి
3. డిప్లాయ్‌మెంట్ సూచనలతో పూర్తి READMEని జోడించండి
4. `azd up` తో డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
5. ఒక పుల్ రిక్వెస్ట్ సమర్పించండి

---

**సహాయం కావాలా?** మద్దతు మరియు ప్రశ్నల కోసం [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) కమ్యూనిటీకి చేరండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా ఖచ్చితత్వ లోపాలు ఉండవచ్చునని దయచేసి గమనించండి. మూలభాషలోని అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాల కోసం మేము బాధ్యులు కావు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
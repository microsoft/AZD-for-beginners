# AZDతో కంటైనర్ యాప్ అమలు ఉదాహరణలు

ఈ డైరెక్టరీలో Azure Developer CLI (AZD) ఉపయోగించి Azure Container Apps కు కంటైనర్‌షైజ్డ్ అప్లికేషన్లను అమలు చేయడానికి సమగ్ర ఉదాహరణలు ఉన్నాయి. ఈ ఉదాహరణలు వాస్తవ ప్రపంచ నమూనాలు, ఉత్తమ పద్ధతులు మరియు ప్రొడక్షన్-రెడి కాన్ఫిగరేషన్‌లను చూపిస్తాయి.

## 📚 Table of Contents

- [Overview](../../../../examples/container-app)
- [Prerequisites](../../../../examples/container-app)
- [Quick Start Examples](../../../../examples/container-app)
- [Production Examples](../../../../examples/container-app)
- [Advanced Patterns](../../../../examples/container-app)
- [Best Practices](../../../../examples/container-app)

## Overview

Azure Container Apps ఒక పూర్తిగా నిర్వహించబడే సర్వర్‌లెస్ కంటైనర్ ప్లాట్‌ఫారమ్ ఇది మైక్రోసర్వీసులు మరియు కంటైనరైజ్డ్ అప్లికేషన్లను ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వహణ లేకుండా నడిపించడానికి అనుమతిస్తుంది. AZDతో కలిపితే, మీరు పొందుతారు:

- **సరళీకృత అమలు**: ఇన్‌ఫ్రాస్ట్రక్చర్‌తో కూడిన కంటైనర్లను ఒక కమాండ్‌తో అమలు చేయండి
- **స్వయంచాలక స్కేలింగ్**: HTTP ట్రాఫిక్ లేదా ఈవెంట్స్ ఆధారంగా జీరో నుంచి స్కేలు అవుట్ వరకు
- **ఇన్‌గ్రేటెడ్ నెట్‌వర్కింగ్**: బిల్ట్-ఇన్ సర్వీస్ డిస్కవరీ మరియు ట్రాఫిక్ స్ప్లిటింగ్
- **నిర్వహిత ఐడెంటిటీ**: Azure వనరులకు సురక్షిత ప్రమాణీకరణ
- **ఖర్చు ఆప్టిమైజేషన్**: మీరు ఉపయోగించే వనరులకు మాత్రమే చెల్లించండి

## Prerequisites

ప్రారంభించడానికి ముందు, మీరు కలిగి ఉండాల్సింది:

```bash
# AZD ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
azd version

# Azure CLIని తనిఖీ చేయండి
az version

# Dockerని తనిఖీ చేయండి (కస్టమ్ ఇమేజ్‌లు నిర్మించడానికి)
docker --version

# Azureలో లాగిన్ అవ్వండి
azd auth login
az login
```

**అవసరమైన Azure వనరులు:**
- సక్రియ Azure subscription
- Resource group సృష్టించడానికి అనుమతులు
- Container Apps ఎన్విరాన్మెంట్ యాక్సెస్

## Quick Start Examples

### 1. సాదారణ వెబ్ API (Python Flask)

Azure Container Apps ఉపయోగించి ఒక ప్రాథమిక REST APIని అమలు చేయండి.

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

# మౌలిక సదుపాయాలను ఏర్పాటు చేసి, వాటిని డిప్లాయ్ చేయండి
azd up

# డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ప్రధాన ఫీచర్లు:**
- 0 నుండి 10 రిప్లికాలకు ఆటో-స్కేలింగ్
- హెల్త్ ప్రోబ్స్ మరియు లైవ్‌నెస్ తనిఖీలు
- ఎన్విరాన్‌మెంట్ వేరియబుల్‌ల ఇంజెక్షన్
- Application Insights ఇంటిగ్రేషన్

### 2. Node.js Express API

MongoDB అనుసంధానంతో Node.js బ్యాక్‌ఎండ్‌ను అమలు చేయండి.

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

### 3. స్టాటిక్ ఫ్రంటెండ్ + API బ్యాక్‌ఎండ్

React ఫ్రంటెండ్ మరియు API బ్యాక్‌ఎండ్‌తో ఫుల్-స్టాక్ అప్లికేషన్‌ను అమలు చేయండి.

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

**సన్నివేశం**: బహుముఖ మైక్రోసర్వీసులుతో కూడిన E-commerce అప్లికేషన్

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

**azure.yaml కాన్ఫిగరేషన్:**
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

# ప్రొడక్షన్ వాతావరణాన్ని సెట్ చేయండి
azd env new production

# ప్రొడక్షన్ సెట్టింగులను కాన్ఫిగర్ చేయండి
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# అన్ని సేవలను డిప్లాయ్ చేయండి
azd up

# డిప్లాయ్‌మెంట్‌ను పర్యవేక్షించండి
azd monitor --overview
```

### Example 2: AI-Powered Container App

**సన్నివేశం**: Azure OpenAI అనుసంధానంతో AI చాట్ అప్లికేషన్

**ఫైల్: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# సురక్షిత యాక్సెస్ కోసం Managed Identityను ఉపయోగించండి
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
        model="gpt-4",
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
# పరిసరాన్ని సెట్ చేయండి
azd init --template ai-chat-app
azd env new dev

# OpenAIని కాన్ఫిగర్ చేయండి
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# డిప్లాయ్ చేయండి
azd up

# APIని పరీక్షించండి
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**సన్నివేశం**: మెసేజ్ క్యూ తో ఆర్డర్ ప్రాసెసింగ్ సిస్టమ్

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
            # ఆర్డర్‌ను ప్రాసెస్ చేయండి
            print(f"Processing order: {message.content}")
            
            # సందేశాన్ని పూర్తి చేయండి
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

# క్యూలు కాన్ఫిగరేషన్‌తో అమర్చండి
azd up

# క్యూలు పొడవు ఆధారంగా వర్కర్‌ను స్కేల్ చేయండి
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Pattern 1: బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్

```bash
# ట్రాఫిక్ లేకుండా కొత్త రివిజన్‌ను సృష్టించండి
azd deploy api --revision-suffix blue --no-traffic

# కొత్త రివిజన్‌ను పరీక్షించండి
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ట్రాఫిక్‌ను విభజించండి (బ్లూకు 20%, ప్రస్తుతానికి 80%)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# పూర్తిగా బ్లూకి మార్చండి
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: AZDతో కనరీ డిప్లాయ్‌మెంట్

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

# ట్రాఫిక్‌ను మెల్లగా పెంచండి
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 నిమిషాలు వేచి ఉండండి
done
```

### Pattern 3: బహు-రిజియన్ డిప్లాయ్‌మెంట్

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
# అన్ని ప్రాంతాలలో అమర్చండి
azd up

# ఎండ్‌పాయింట్లను నిర్ధారించండి
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr ఇంటిగ్రేషన్

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

**Daprతో అప్లికేషన్ కోడ్:**
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

### 1. వనరు ఆర్గనైజేషన్

```bash
# సమానమైన పేరుల నియమావళులను ఉపయోగించండి
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

# రియల్-టైమ్‌లో లాగ్‌లను వీక్షించండి
azd monitor --logs
# లేదా Container Apps కోసం Azure CLI ఉపయోగించండి:
az containerapp logs show --name api --resource-group rg-myapp --follow

# మీట్రిక్స్‌ను పర్యవేక్షించండి
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
# ఉపయోగంలో లేకపోతే శూన్యానికి స్కేల్ చేయండి
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# డెవ్ పరిసరాల కోసం స్పాట్ ఇన్‌స్టాన్సులను ఉపయోగించండి
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# బడ్జెట్ అలెర్ట్లను ఏర్పాటు చేయండి
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ఇంటిగ్రేషన్

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

## Common Commands Reference

```bash
# కొత్త కంటైనర్ యాప్ ప్రాజెక్టును ప్రారంభించండి
azd init --template <template-name>

# ఇన్ఫ్రాస్ట్రక్చర్ మరియు అప్లికేషన్‌ను అమలు చేయండి
azd up

# కేవలం అప్లికేషన్ కోడ్‌ను మాత్రమే అమలు చేయండి (ఇన్ఫ్రాస్ట్రక్చర్‌ను తప్పించుకోండి)
azd deploy

# కేవలం ఇన్ఫ్రాస్ట్రక్చర్‌ను మాత్రమే ఏర్పాటు చేయండి
azd provision

# డిప్లాయ్ చేసిన వనరులను చూడండి
azd show

# azd monitor లేదా Azure CLI ఉపయోగించి లాగ్‌లను 스트్రీమ్ చేయండి
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# అప్లికేషన్‌ను మానిటర్ చేయండి
azd monitor --overview

# వనరులను తొలగించండి
azd down --force --purge
```

## Troubleshooting

### సమస్య: కంటైనర్ ప్రారంభం కావడం విఫలమవుతుంది

```bash
# Azure CLI ఉపయోగించి లాగ్‌లను తనిఖీ చేయండి
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# కంటైనర్ ఈవెంట్లను వీక్షించండి
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# స్థానికంగా పరీక్షించండి
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### సమస్య: కంటైనర్ యాప్ ఎండ్పాయింట్‌కు యాక్సెస్ చేయలేరు

```bash
# ఇన్‌గ్రెస్స్ కాన్ఫిగరేషన్‌ను నిర్ధారించండి
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# అంతర్గత ఇన్‌గ్రెస్స్ ఎనేబుల్ అయిందో లేదో తనిఖీ చేయండి
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
- [సాధారణ Flask API ఉదాహరణ](./simple-flask-api/README.md)
- [Azure Container Apps డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/container-apps/)
- [AZD టెంప్లేట్స్ గ్యాలరీ](https://azure.github.io/awesome-azd/)
- [Container Apps నమూనాలు](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep టెంప్లేట్స్](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## కాంట్రిబ్యూట్ చేయడం

కొత్త container app ఉదాహరణలను కాంట్రిబ్యూట్ చేయడానికి:

1. మీ ఉదాహరణతో కొత్త సబ్‌డైరెక్టరీని సృష్టించండి
2. పూర్తిచేసిన `azure.yaml`, `infra/`, మరియు `src/` ఫైల్స్‌ను చేర్చండి
3. డిప్లాయ్‌మెంట్ సూచనలతో కూడిన విస్తృత READMEని జోడించండి
4. `azd up` తో డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
5. పుల్ రిక్వెస్ట్‌ను సమర్పించండి

---

**సహాయం కావాలా?** మద్దతు మరియు ప్రశ్నల కోసం [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) కమ్యూనిటీలో చేరండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, స్వయంచాలక అనువాదాల్లో లోపాలు లేదా తప్పుదోషాలు ఉండే అవకాశం ఉంది అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారం కోసం వృత్తిపరమైన మానవ అనువాదం చేయించుకోవాలని సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడంపై మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
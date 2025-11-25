<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-25T07:06:14+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "te"
}
-->
# AZD తో కంటైనర్ యాప్ డిప్లాయ్‌మెంట్ ఉదాహరణలు

ఈ డైరెక్టరీలో Azure Developer CLI (AZD) ఉపయోగించి Azure Container Apps కు కంటైనర్ యాప్‌లను డిప్లాయ్ చేయడానికి సమగ్ర ఉదాహరణలు ఉన్నాయి. ఈ ఉదాహరణలు వాస్తవ ప్రపంచ నమూనాలు, ఉత్తమ పద్ధతులు, మరియు ప్రొడక్షన్-రెడీ కాన్ఫిగరేషన్లను చూపిస్తాయి.

## 📚 విషయ సూచిక

- [అవలోకనం](../../../../examples/container-app)
- [ముందస్తు అవసరాలు](../../../../examples/container-app)
- [త్వరిత ప్రారంభ ఉదాహరణలు](../../../../examples/container-app)
- [ప్రొడక్షన్ ఉదాహరణలు](../../../../examples/container-app)
- [అధునాతన నమూనాలు](../../../../examples/container-app)
- [ఉత్తమ పద్ధతులు](../../../../examples/container-app)

## అవలోకనం

Azure Container Apps అనేది పూర్తిగా నిర్వహించబడే సర్వర్‌లెస్ కంటైనర్ ప్లాట్‌ఫారమ్, ఇది మైక్రోసర్వీసులు మరియు కంటైనర్ యాప్‌లను ఇన్‌ఫ్రాస్ట్రక్చర్‌ను నిర్వహించకుండా నడపడానికి అనుమతిస్తుంది. AZD తో కలిపి, మీరు పొందగలిగేది:

- **సులభమైన డిప్లాయ్‌మెంట్**: ఒకే ఆదేశంతో కంటైనర్‌లు మరియు ఇన్‌ఫ్రాస్ట్రక్చర్‌ను డిప్లాయ్ చేయడం
- **ఆటోమేటిక్ స్కేలింగ్**: HTTP ట్రాఫిక్ లేదా ఈవెంట్ల ఆధారంగా జీరో నుండి స్కేల్ అవుట్ చేయడం
- **ఇంటిగ్రేటెడ్ నెట్‌వర్కింగ్**: బిల్ట్-ఇన్ సర్వీస్ డిస్కవరీ మరియు ట్రాఫిక్ స్ప్లిటింగ్
- **మ్యానేజ్డ్ ఐడెంటిటీ**: Azure వనరులకు సురక్షిత ధృవీకరణ
- **ఖర్చు ఆప్టిమైజేషన్**: మీరు ఉపయోగించే వనరులకు మాత్రమే చెల్లించండి

## ముందస్తు అవసరాలు

ప్రారంభించడానికి ముందు, మీ వద్ద ఉండాలి:

```bash
# AZD ఇన్‌స్టాలేషన్‌ను తనిఖీ చేయండి
azd version

# Azure CLI ను తనిఖీ చేయండి
az version

# Docker ను తనిఖీ చేయండి (కస్టమ్ ఇమేజ్‌లను నిర్మించడానికి)
docker --version

# Azure లో లాగిన్ అవ్వండి
azd auth login
az login
```

**అవసరమైన Azure వనరులు:**
- యాక్టివ్ Azure సబ్‌స్క్రిప్షన్
- రిసోర్స్ గ్రూప్ క్రియేషన్ అనుమతులు
- కంటైనర్ యాప్‌ల వాతావరణ యాక్సెస్

## త్వరిత ప్రారంభ ఉదాహరణలు

### 1. సింపుల్ వెబ్ API (Python Flask)

Azure Container Apps తో ఒక బేసిక్ REST API ని డిప్లాయ్ చేయండి.

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

**డిప్లాయ్‌మెంట్ స్టెప్స్:**

```bash
# టెంప్లేట్ నుండి ప్రారంభించండి
azd init --template todo-python-mongo

# మౌలిక సదుపాయాలను అందించండి మరియు మోహరించండి
azd up

# మోహరింపును పరీక్షించండి
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ముఖ్యమైన ఫీచర్లు:**
- 0 నుండి 10 రిప్లికాల వరకు ఆటో-స్కేలింగ్
- హెల్త్ ప్రోబ్స్ మరియు లైవ్‌నెస్ చెక్‌లు
- ఎన్విరాన్‌మెంట్ వేరియబుల్ ఇంజెక్షన్
- అప్లికేషన్ ఇన్‌సైట్స్ ఇంటిగ్రేషన్

### 2. Node.js Express API

MongoDB ఇంటిగ్రేషన్‌తో Node.js బ్యాక్‌ఎండ్‌ను డిప్లాయ్ చేయండి.

```bash
# Node.js API టెంప్లేట్ ప్రారంభించండి
azd init --template todo-nodejs-mongo

# పర్యావరణ వేరియబుల్స్‌ను ఆకృతీకరించండి
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# మోహరించండి
azd up

# లాగ్‌లను వీక్షించండి
azd logs api
```

**ఇన్‌ఫ్రాస్ట్రక్చర్ హైలైట్స్:**
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

### 3. స్టాటిక్ ఫ్రంట్‌ఎండ్ + API బ్యాక్‌ఎండ్

React ఫ్రంట్‌ఎండ్ మరియు API బ్యాక్‌ఎండ్‌తో పూర్తి-స్టాక్ అప్లికేషన్‌ను డిప్లాయ్ చేయండి.

```bash
# పూర్తి-స్టాక్ టెంప్లేట్ ప్రారంభించండి
azd init --template todo-csharp-sql-swa-func

# కాన్ఫిగరేషన్ సమీక్షించండి
cat azure.yaml

# రెండు సేవలను డిప్లాయ్ చేయండి
azd up

# అప్లికేషన్ తెరవండి
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ప్రొడక్షన్ ఉదాహరణలు

### ఉదాహరణ 1: మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్

**సన్నివేశం**: మల్టిపుల్ మైక్రోసర్వీసులతో ఈ-కామర్స్ అప్లికేషన్

**డైరెక్టరీ స్ట్రక్చర్:**
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
# ప్రాజెక్ట్ ప్రారంభించండి
azd init

# ఉత్పత్తి వాతావరణాన్ని సెట్ చేయండి
azd env new production

# ఉత్పత్తి సెట్టింగులను ఆకృతీకరించండి
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# అన్ని సేవలను మోహరించండి
azd up

# మోహరింపును పర్యవేక్షించండి
azd monitor --overview
```

### ఉదాహరణ 2: AI-పవర్డ్ కంటైనర్ యాప్

**సన్నివేశం**: Azure OpenAI ఇంటిగ్రేషన్‌తో AI చాట్ అప్లికేషన్

**ఫైల్: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# సురక్షితమైన ప్రాప్యత కోసం మేనేజ్డ్ ఐడెంటిటీని ఉపయోగించండి
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # కీ వాల్ట్ నుండి OpenAI కీని పొందండి
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

**డిప్లాయ్‌మెంట్ ఆదేశాలు:**
```bash
# పరిసరాలను ఏర్పాటు చేయండి
azd init --template ai-chat-app
azd env new dev

# OpenAI ను ఆకృతీకరించండి
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# మోహరించండి
azd up

# API ను పరీక్షించండి
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ఉదాహరణ 3: బ్యాక్‌గ్రౌండ్ వర్కర్ క్యూయూ ప్రాసెసింగ్‌తో

**సన్నివేశం**: మెసేజ్ క్యూయుతో ఆర్డర్ ప్రాసెసింగ్ సిస్టమ్

**డైరెక్టరీ స్ట్రక్చర్:**
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

# క్యూలో కాన్ఫిగరేషన్‌తో పంపిణీ చేయండి
azd up

# క్యూలో పొడవు ఆధారంగా వర్కర్‌ను స్కేల్ చేయండి
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## అధునాతన నమూనాలు

### నమూనా 1: బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్

```bash
# ట్రాఫిక్ లేకుండా కొత్త రివిజన్ సృష్టించండి
azd deploy api --revision-suffix blue --no-traffic

# కొత్త రివిజన్‌ను పరీక్షించండి
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ట్రాఫిక్‌ను విభజించండి (20% బ్లూ, 80% ప్రస్తుతానికి)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# పూర్తిగా బ్లూ కు మారండి
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### నమూనా 2: AZD తో కానరీ డిప్లాయ్‌మెంట్

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

# మెట్రిక్స్‌ను మానిటర్ చేయండి
azd monitor --service api --duration 5m

# ట్రాఫిక్‌ను క్రమంగా పెంచండి
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 నిమిషాలు వేచి ఉండండి
done
```

### నమూనా 3: మల్టీ-రీజియన్ డిప్లాయ్‌మెంట్

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
# అన్ని ప్రాంతాలకు మోహరించండి
azd up

# ఎండ్‌పాయింట్లను ధృవీకరించండి
azd show --output json | jq '.services.api.endpoints'
```

### నమూనా 4: Dapr ఇంటిగ్రేషన్

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
        # స్థితిని సేవ్ చేయండి
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

### 1. వనరుల ఆర్గనైజేషన్

```bash
# స్థిరమైన పేరు పెట్టే నియమాలను ఉపయోగించండి
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ఖర్చు ట్రాకింగ్ కోసం వనరులను ట్యాగ్ చేయండి
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. సెక్యూరిటీ ఉత్తమ పద్ధతులు

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
# అప్లికేషన్ ఇన్‌సైట్స్‌ను ప్రారంభించండి
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# లాగ్‌లను రియల్-టైమ్‌లో చూడండి
azd logs api --follow

# మెట్రిక్స్‌ను మానిటర్ చేయండి
azd monitor --service api

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
# ఉపయోగంలో లేకపోతే జీరోకి స్కేల్ చేయండి
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# డెవలప్‌మెంట్ పరిసరాల కోసం స్పాట్ ఇన్‌స్టాన్స్‌లను ఉపయోగించండి
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# బడ్జెట్ అలర్ట్‌లను సెటప్ చేయండి
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

## సాధారణ ఆదేశాల సూచన

```bash
# కొత్త కంటైనర్ యాప్ ప్రాజెక్ట్‌ను ప్రారంభించండి
azd init --template <template-name>

# మౌలిక సదుపాయాలు మరియు అప్లికేషన్‌ను మోహరించండి
azd up

# కేవలం అప్లికేషన్ కోడ్‌ను మోహరించండి (మౌలిక సదుపాయాలను వదిలివేయండి)
azd deploy

# కేవలం మౌలిక సదుపాయాలను అందించండి
azd provision

# మోహరించిన వనరులను వీక్షించండి
azd show

# లాగ్‌లను స్ట్రీమ్ చేయండి
azd logs <service-name> --follow

# అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --overview

# వనరులను శుభ్రం చేయండి
azd down --force --purge
```

## సమస్యల పరిష్కారం

### సమస్య: కంటైనర్ ప్రారంభం అవ్వడం లేదు

```bash
# లాగ్‌లను తనిఖీ చేయండి
azd logs api --tail 100

# కంటైనర్ ఈవెంట్‌లను వీక్షించండి
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# స్థానికంగా పరీక్షించండి
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### సమస్య: కంటైనర్ యాప్ ఎండ్‌పాయింట్ యాక్సెస్ చేయలేకపోతున్నాను

```bash
# ఇన్‌గ్రెస్ కాన్ఫిగరేషన్‌ను ధృవీకరించండి
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# అంతర్గత ఇన్‌గ్రెస్ ప్రారంభించబడిందా అని తనిఖీ చేయండి
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
- [కంటైనర్ యాప్‌ల ఉదాహరణలు](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep టెంప్లేట్స్](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## సహకారం

కొత్త కంటైనర్ యాప్ ఉదాహరణలను సహకరించడానికి:

1. మీ ఉదాహరణతో కొత్త సబ్‌డైరెక్టరీని సృష్టించండి
2. పూర్తి `azure.yaml`, `infra/`, మరియు `src/` ఫైళ్లను చేర్చండి
3. డిప్లాయ్‌మెంట్ సూచనలతో సమగ్ర README చేర్చండి
4. `azd up` తో డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
5. పుల్ రిక్వెస్ట్‌ను సమర్పించండి

---

**సహాయం కావాలా?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) కమ్యూనిటీని చేరండి మద్దతు మరియు ప్రశ్నల కోసం.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏదైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
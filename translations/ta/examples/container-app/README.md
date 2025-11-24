<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-24T13:59:38+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "ta"
}
-->
# AZD மூலம் கன்டெய்னர் ஆப் டிப்ளாய்மென்ட் எடுத்துக்காட்டுகள்

இந்த அடைவு, Azure Developer CLI (AZD) பயன்படுத்தி Azure Container Apps-க்கு கன்டெய்னர் செய்யப்பட்ட பயன்பாடுகளை டிப்ளாய் செய்ய விரிவான எடுத்துக்காட்டுகளை கொண்டுள்ளது. இவை நிஜ வாழ்க்கை முறைமைகள், சிறந்த நடைமுறைகள் மற்றும் தயாரிப்பு-தயார் உள்ளமைப்புகளை விளக்குகின்றன.

## 📚 உள்ளடக்க அட்டவணை

- [மேலோட்டம்](../../../../examples/container-app)
- [முன் தேவைகள்](../../../../examples/container-app)
- [விரைவான தொடக்க எடுத்துக்காட்டுகள்](../../../../examples/container-app)
- [தயாரிப்பு எடுத்துக்காட்டுகள்](../../../../examples/container-app)
- [மேம்பட்ட முறைமைகள்](../../../../examples/container-app)
- [சிறந்த நடைமுறைகள்](../../../../examples/container-app)

## மேலோட்டம்

Azure Container Apps என்பது முழுமையாக நிர்வகிக்கப்படும் சர்வர்லெஸ் கன்டெய்னர் தளம் ஆகும், இது உங்களுக்கு மைக்ரோசர்வீசுகள் மற்றும் கன்டெய்னர் செய்யப்பட்ட பயன்பாடுகளை உள்கட்டமைப்பை நிர்வகிக்காமல் இயக்க அனுமதிக்கிறது. AZD உடன் இணைந்தால், நீங்கள் பெறுவீர்கள்:

- **எளிய டிப்ளாய்மென்ட்**: ஒரே கட்டளையில் கன்டெய்னர்களை உள்கட்டமைப்புடன் டிப்ளாய் செய்யலாம்
- **தானியங்கி அளவீடு**: HTTP டிராஃபிக் அல்லது நிகழ்வுகளின் அடிப்படையில் 0 முதல் அதிக அளவுக்கு அளவீடு செய்யலாம்
- **இணைந்த நெட்வொர்க்கிங்**: உள்ளமைக்கப்பட்ட சேவை கண்டறிதல் மற்றும் டிராஃபிக் பிளவிங்
- **மேனேஜ்டு ஐடென்டிட்டி**: Azure வளங்களுக்கு பாதுகாப்பான அங்கீகாரம்
- **செலவுக் குறைப்பு**: நீங்கள் பயன்படுத்தும் வளங்களுக்கு மட்டுமே பணம் செலுத்துங்கள்

## முன் தேவைகள்

தொடங்குவதற்கு முன், உங்களிடம் பின்வரும் இருப்பதை உறுதிசெய்யவும்:

```bash
# AZD நிறுவலை சரிபார்க்கவும்
azd version

# Azure CLI ஐ சரிபார்க்கவும்
az version

# Docker ஐ சரிபார்க்கவும் (தனிப்பயன் படங்களை உருவாக்க)
docker --version

# Azure இல் உள்நுழைக
azd auth login
az login
```

**தேவையான Azure வளங்கள்:**
- செயலில் உள்ள Azure சந்தா
- Resource group உருவாக்க அனுமதிகள்
- Container Apps சூழல் அணுகல்

## விரைவான தொடக்க எடுத்துக்காட்டுகள்

### 1. எளிய வலை API (Python Flask)

Azure Container Apps உடன் ஒரு அடிப்படை REST API ஐ டிப்ளாய் செய்யவும்.

**எடுத்துக்காட்டு: Python Flask API**

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

**டிப்ளாய்மென்ட் படிகள்:**

```bash
# டெம்ப்ளேட்டில் இருந்து தொடங்கவும்
azd init --template todo-python-mongo

# உள்கட்டமைப்பை வழங்கி, பிரயோகிக்கவும்
azd up

# பிரயோகத்தை சோதிக்கவும்
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**முக்கிய அம்சங்கள்:**
- 0 முதல் 10 ரெப்ளிகாக்கள் வரை தானியங்கி அளவீடு
- ஆரோக்கிய சோதனைகள் மற்றும் லைவ்னெஸ் சோதனைகள்
- சூழல் மாறி செருகல்
- Application Insights ஒருங்கிணைப்பு

### 2. Node.js Express API

MongoDB ஒருங்கிணைப்புடன் ஒரு Node.js பின்புறத்தை டிப்ளாய் செய்யவும்.

```bash
# Node.js API டெம்ப்ளேட்டை தொடங்கவும்
azd init --template todo-nodejs-mongo

# சூழல் மாறிகள் அமைக்கவும்
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# பிரசுரிக்கவும்
azd up

# பதிவுகளை பார்க்கவும்
azd logs api
```

**உள்கட்டமைப்பு முக்கிய அம்சங்கள்:**
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

React முன்னணி மற்றும் API பின்புறத்துடன் ஒரு முழு ஸ்டாக் பயன்பாட்டை டிப்ளாய் செய்யவும்.

```bash
# முழுமையான ஸ்டாக் டெம்ப்ளேட்டை தொடங்கவும்
azd init --template todo-csharp-sql-swa-func

# கட்டமைப்பை மதிப்பாய்வு செய்யவும்
cat azure.yaml

# இரு சேவைகளையும் பிரசுரிக்கவும்
azd up

# பயன்பாட்டை திறக்கவும்
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## தயாரிப்பு எடுத்துக்காட்டுகள்

### எடுத்துக்காட்டு 1: மைக்ரோசர்வீசஸ் கட்டமைப்பு

**திருப்பம்**: பல மைக்ரோசர்வீசுகளுடன் ஒரு இ-காமர்ஸ் பயன்பாடு

**அடைவு அமைப்பு:**
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

**azure.yaml உள்ளமைப்பு:**
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

**டிப்ளாய்மென்ட்:**
```bash
# திட்டத்தை தொடங்கவும்
azd init

# உற்பத்தி சூழலை அமைக்கவும்
azd env new production

# உற்பத்தி அமைப்புகளை உள்ளமைக்கவும்
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# அனைத்து சேவைகளையும் பிரசாரமாக்கவும்
azd up

# பிரசாரத்தை கண்காணிக்கவும்
azd monitor --overview
```

### எடுத்துக்காட்டு 2: AI-ஆதாரமுள்ள கன்டெய்னர் ஆப்

**திருப்பம்**: Azure OpenAI ஒருங்கிணைப்புடன் AI உரையாடல் பயன்பாடு

**கோப்பு: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# பாதுகாப்பான அணுகலுக்காக மேலாண்மை அடையாளத்தை பயன்படுத்தவும்
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # கீ வால்டிலிருந்து OpenAI கீயை பெறவும்
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

**கோப்பு: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**கோப்பு: infra/main.bicep**
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

**டிப்ளாய்மென்ட் கட்டளைகள்:**
```bash
# சூழலை அமைக்கவும்
azd init --template ai-chat-app
azd env new dev

# OpenAI ஐ உள்ளமைக்கவும்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# பிரயோகிக்கவும்
azd up

# API ஐ சோதிக்கவும்
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### எடுத்துக்காட்டு 3: பின்புற பணியாளர் மற்றும் வரிசை செயலாக்கம்

**திருப்பம்**: செய்தி வரிசையுடன் ஆர்டர் செயலாக்க அமைப்பு

**அடைவு அமைப்பு:**
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

**கோப்பு: src/worker/processor.py**
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
            # ஆர்டர் செயல்படுத்து
            print(f"Processing order: {message.content}")
            
            # செய்தியை முடிக்கவும்
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**கோப்பு: azure.yaml**
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

**டிப்ளாய்மென்ட்:**
```bash
# தொடங்கவும்
azd init

# வரிசை கட்டமைப்புடன் பிரசுரிக்கவும்
azd up

# வரிசை நீளத்தின் அடிப்படையில் வேலைகாரரை அளவிடவும்
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## மேம்பட்ட முறைமைகள்

### முறைமை 1: ப்ளூ-கிரீன் டிப்ளாய்மென்ட்

```bash
# புதிய திருத்தத்தை போக்குவரத்து இல்லாமல் உருவாக்கவும்
azd deploy api --revision-suffix blue --no-traffic

# புதிய திருத்தத்தை சோதிக்கவும்
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# போக்குவரத்தை பிரிக்கவும் (20% நீலத்திற்கு, 80% தற்போதையத்திற்கு)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# முழுமையான மாற்றம் நீலத்திற்கு
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### முறைமை 2: AZD உடன் கனரி டிப்ளாய்மென்ட்

**கோப்பு: .azure/dev/config.json**
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

**டிப்ளாய்மென்ட் ஸ்கிரிப்ட்:**
```bash
#!/bin/bash
# deploy-canary.sh

# புதிய திருத்தத்தை 10% போக்குவரத்துடன் பிரசாரம் செய்யவும்
azd deploy api --revision-mode multiple

# அளவுகோல்களை கண்காணிக்கவும்
azd monitor --service api --duration 5m

# போக்குவரத்தை تدريجமாக அதிகரிக்கவும்
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 நிமிடங்கள் காத்திருக்கவும்
done
```

### முறைமை 3: பல பிராந்திய டிப்ளாய்மென்ட்

**கோப்பு: azure.yaml**
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

**கோப்பு: infra/multi-region.bicep**
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

**டிப்ளாய்மென்ட்:**
```bash
# அனைத்து பகுதிகளிலும் பிரசுரிக்கவும்
azd up

# இறுதிப்புள்ளிகளை சரிபார்க்கவும்
azd show --output json | jq '.services.api.endpoints'
```

### முறைமை 4: Dapr ஒருங்கிணைப்பு

**கோப்பு: infra/app/dapr-enabled.bicep**
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

**Dapr உடன் பயன்பாட்டு குறியீடு:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # நிலையை சேமிக்கவும்
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # நிகழ்வை வெளியிடவும்
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## சிறந்த நடைமுறைகள்

### 1. வள அமைப்பு

```bash
# ஒரே மாதிரியான பெயரிடும் மரபுகளை பயன்படுத்தவும்
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# செலவுக் கண்காணிப்புக்கான வளங்களை குறிக்கவும்
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. பாதுகாப்பு சிறந்த நடைமுறைகள்

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

### 3. செயல்திறன் மேம்பாடு

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

### 4. கண்காணிப்பு மற்றும் பார்வையிடல்

```bash
# பயன்பாட்டு உள்ளுணர்வுகளை இயக்கவும்
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# பதிவுகளை நேரடியாக காணவும்
azd logs api --follow

# அளவுகோல்களை கண்காணிக்கவும்
azd monitor --service api

# எச்சரிக்கைகளை உருவாக்கவும்
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. செலவுக் குறைப்பு

```bash
# பயன்படுத்தப்படாத போது பூஜ்யமாக அளவிடவும்
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# மேம்பாட்டு சூழல்களுக்கு ஸ்பாட் இன்ஸ்டன்ஸ்களை பயன்படுத்தவும்
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# பட்ஜெட் எச்சரிக்கைகளை அமைக்கவும்
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ஒருங்கிணைப்பு

**GitHub Actions எடுத்துக்காட்டு:**
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

## பொதுவான கட்டளைகள் குறிப்பு

```bash
# புதிய கன்டெய்னர் பயன்பாட்டு திட்டத்தை தொடங்கவும்
azd init --template <template-name>

# உள்கட்டமைப்பு மற்றும் பயன்பாட்டை பிரசுரிக்கவும்
azd up

# பயன்பாட்டு குறியீட்டை மட்டும் பிரசுரிக்கவும் (உள்கட்டமைப்பை தவிர்க்கவும்)
azd deploy

# உள்கட்டமைப்பை மட்டும் வழங்கவும்
azd provision

# பிரசுரிக்கப்பட்ட வளங்களை பார்க்கவும்
azd show

# பதிவு பதிவுகளை ஸ்ட்ரீம் செய்யவும்
azd logs <service-name> --follow

# பயன்பாட்டை கண்காணிக்கவும்
azd monitor --overview

# வளங்களை சுத்தம் செய்யவும்
azd down --force --purge
```

## பிழைத்திருத்தம்

### பிரச்சினை: கன்டெய்னர் தொடங்க முடியவில்லை

```bash
# பதிவுகளை சரிபார்க்கவும்
azd logs api --tail 100

# கண்டெய்னர் நிகழ்வுகளை பார்க்கவும்
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# உள்ளூரில் சோதிக்கவும்
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### பிரச்சினை: கன்டெய்னர் ஆப் எண்ட்பாயிண்டை அணுக முடியவில்லை

```bash
# நுழைவு கட்டமைப்பை சரிபார்க்கவும்
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# உள்நாட்டு நுழைவு இயக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### பிரச்சினை: செயல்திறன் சிக்கல்கள்

```bash
# வளங்களின் பயன்பாட்டை சரிபார்க்கவும்
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# வளங்களை அதிகரிக்கவும்
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## கூடுதல் வளங்கள் மற்றும் எடுத்துக்காட்டுகள்
- [மைக்ரோசர்வீசஸ் எடுத்துக்காட்டு](./microservices/README.md)
- [எளிய Flash API எடுத்துக்காட்டு](./simple-flask-api/README.md)
- [Azure Container Apps ஆவணங்கள்](https://learn.microsoft.com/azure/container-apps/)
- [AZD டெம்ப்ளேட்கள் கேலரி](https://azure.github.io/awesome-azd/)
- [Container Apps எடுத்துக்காட்டுகள்](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep டெம்ப்ளேட்கள்](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## பங்களிப்பு

புதிய கன்டெய்னர் ஆப் எடுத்துக்காட்டுகளை பங்களிக்க:

1. உங்கள் எடுத்துக்காட்டுடன் ஒரு புதிய துணை அடைவை உருவாக்கவும்
2. முழுமையான `azure.yaml`, `infra/`, மற்றும் `src/` கோப்புகளை சேர்க்கவும்
3. டிப்ளாய்மென்ட் வழிமுறைகளுடன் விரிவான README சேர்க்கவும்
4. `azd up` மூலம் டிப்ளாய்மென்டை சோதிக்கவும்
5. ஒரு புல் கோரிக்கையை சமர்ப்பிக்கவும்

---

**உதவி தேவைதா?** ஆதரவு மற்றும் கேள்விகளுக்கு [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) சமூகத்தில் சேரவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**குறிப்பு**:  
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
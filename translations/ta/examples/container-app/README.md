# AZD உடன் கொண்டெய்னர் செயலி வழங்கல் உதாரணங்கள்

இந்த அடைவு Azure Developer CLI (AZD) பயன்படுத்தி Azure Container Apps இற்கு கொண்டெய்னரை கொண்ட பயன்பாடுகளை வழங்குவதற்கான விரிவான உதாரணங்களை கொண்டுள்ளது. இவை நிஜ உலக மாதிரிகள், சிறந்த நடைமுறைகள் மற்றும் உற்பத்திக்கு தயாரான அமைப்புகளைக் காட்டுகின்றன.

## 📚 உள்ளடக்க அட்டவணை

- [கண்ணோட்டம்](../../../../examples/container-app)
- [முன் தேவைகள்](../../../../examples/container-app)
- [விரைவு தொடக்க உதாரணங்கள்](../../../../examples/container-app)
- [உற்பத்தி உதாரணங்கள்](../../../../examples/container-app)
- [மேம்பட்ட மாதிரிகள்](../../../../examples/container-app)
- [சிறந்த நடைமுறைகள்](../../../../examples/container-app)

## கண்ணோட்டம்

Azure Container Apps என்பது நிர்வகிக்கப்பட்ட முழு நிர்வகிக்கப்பட்ட சர்வர் இல்லாத கொண்டெய்னர் தளம் ஆகும், இது ஊடகமான சேவைகள் மற்றும் கொண்டெய்னர் செய்யப்பட்ட பயன்பாடுகளை அடங்கிய அமைப்புகளை நிர்வகிக்காமல் இயக்குவதற்கு உதவுகிறது. AZD உடன் இணைந்த போது, நீங்கள் பெறுகிறீர்கள்:

- **எளிமையான வெளியீடு**: ஒரே கட்டளை மூலம் கட்டமைப்புடன் கொண்டெய்னர்களை வெளியிடுகிறது
- **தானியங்கி அளவுரு**: HTTP போக்குவரத்து அல்லது நிகழ்வுகளின் அடிப்படையில் பூஜ்ஜியத்திற்கு வரை மற்றும் வெளியே அளவுரு செய்கிறது
- **ஐக்கியலான நெட்வொர்க்கிங்**: உட்படுத்தப்பட்ட சேவை கண்டுபிடித்தல் மற்றும் போக்குவரத்து பிரிப்பு
- **மேலாண்மை செய்யப்பட்ட அடையாளம்**: Azure வளங்களுக்கு பாதுகாப்பான அங்கீகாரம்
- **செலவு சிற்றாக்கம்**: நீங்கள் பயன்படுத்தும் வளங்களுக்கே மட்டும் கட்டணம்

## முன் தேவைகள்

தொடங்குவதற்கு முன், உங்களிடம் கீழ்க்கண்டவை உள்ளதா என்பதை உறுதிசெய்யவும்:

```bash
# AZD நிறுவல் சரிபார்க்கவும்
azd version

# Azure CLI சரிபார்க்கவும்
az version

# Docker சரிபார்க்கவும் (தனிப்பயன் இமேஜ்களை கட்டுவதற்காக)
docker --version

# Azure இல் உள்நுழையவும்
azd auth login
az login
```

**தேவையான Azure வளங்கள்:**
- செயல்பாட்டில் உள்ள Azure சந்தா
- Resource group உருவாக்க அனுமதிகள்
- Container Apps சூழலுக்கு அணுகல்

## விரைவு தொடக்க உதாரணங்கள்

### 1. எளிய வலை API (Python Flask)

Azure Container Apps உடன் ஒரு அடிப்படை REST API ஐ வெளியிடவும்.

**உதாரணம்: Python Flask API**

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

**வெளியீட்டு படிகள்:**

```bash
# டெம்ப்ளேட்டிலிருந்து ஆரம்பிக்கவும்
azd init --template todo-python-mongo

# அடித்தள அமைப்புகளை வழங்கி, பயன்பாட்டை நிறுவவும்
azd up

# நிறுவலை சோதிக்கவும்
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**முக்கிய அம்சங்கள்:**
- 0 முதல் 10 நகல்களுக்கான தானியங்கி அளவீடு
- சுகாதார சோதனைகள் மற்றும் உயிர்நிலை சரிபார்ப்புகள்
- சுற்றுச்சூழல் மாறிலி ஊட்டுதல்
- Application Insights இணைப்பு

### 2. Node.js Express API

MongoDB இணைப்புடன் Node.js பின்னணியை வெளியிடவும்.

```bash
# Node.js API மாதிரியை ஆரம்பிக்கவும்
azd init --template todo-nodejs-mongo

# சுற்றுச்சூழல் மாறிலிகளை அமைக்கவும்
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# பயன்படுத்தவும்
azd up

# Azure Monitor மூலம் பதிவுகளை பார்க்கவும்
azd monitor --logs
```

**அமைப்பமைப்பு சிறப்பம்சங்கள்:**
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

### 3. நிலையான முன்முகம் + API பின்னணி

React முன்முகத்தோடு API பின்னணியைக் கொண்ட முழு-ஸ்டாக் செயலியை வெளியிடவும்.

```bash
# முழு-ஸ்டாக் டெம்ப்ளேட்டை தொடங்கவும்
azd init --template todo-csharp-sql-swa-func

# அமைப்புகளை பரிசீலிக்கவும்
cat azure.yaml

# இரு சேவைகளையும் வெளியிடவும்
azd up

# பயன்பாட்டை திறக்கவும்
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## உற்பத்தி உதாரணங்கள்

### உதாரணம் 1: மைக்ரோசேவைகள் கட்டமைப்பு

**நிகழ்வு**: பல மைக்ரோசேவைகளுடன் ஒரு இ-காமர்ஸ் செயலி

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

**azure.yaml கட்டமைப்பு:**
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

**வெளியீடு:**
```bash
# திட்டத்தை ஆரம்பிக்கவும்
azd init

# உற்பத்தி சூழலை அமைக்கவும்
azd env new production

# உற்பத்தி அமைப்புகளை கட்டமைக்கவும்
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# அனைத்து சேவைகளையும் வெளியிடவும்
azd up

# வெளியீட்டை கண்காணிக்கவும்
azd monitor --overview
```

### உதாரணம் 2: செயற்கை நுண்ணறியால் இயக்கப்படும் கொண்டெய்னர் செயலி

**நிகழ்வு**: Microsoft Foundry Models இணைப்புடன் AI உரையாடல் செயலி

**கோப்பு: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# பாதுகாப்பான அணுகலுக்காக நிர்வகிக்கப்பட்ட அடையாளத்தைப் பயன்படுத்தவும்
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # OpenAI விசையை Key Vault-இலிருந்து பெறவும்
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

**கோப்பு: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**கோப்பு: infra/main.bicep**
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

**வெளியீடு கட்டளைகள்:**
```bash
# சுற்றுச்சூழலை அமைக்கவும்
azd init --template ai-chat-app
azd env new dev

# OpenAI ஐ கட்டமைக்கவும்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# விநியோகிக்கவும்
azd up

# API ஐ சோதிக்கவும்
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### உதாரணம் 3: க்யூ செயலாக்கத்துடன் பின்னணி ஊழியர்

**நிகழ்வு**: மெசேஜ் க்யூவுடன் ஆர்டர் செயலாக்க அமைப்பு

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

**கோப்பு: src/worker/processor.py**
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
            # ஆர்டரை செயலாக்கு
            print(f"Processing order: {message.content}")
            
            # முழுமையான செய்தி
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**கோப்பு: azure.yaml**
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

**வெளியீடு:**
```bash
# ஆரம்பப்படுத்து
azd init

# வரிசை கட்டமைப்புடன் வெளியிடு
azd up

# வரிசை நீளத்தின் அடிப்படையில் பணியாளர் எண்ணிக்கையை மாற்று
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## மேம்பட்ட மாதிரிகள்

### முறை 1: நீலம்-பச்சை வெளியீடு

```bash
# புதிய திருத்தத்தை போக்குவரத்தின்றி உருவாக்கு
azd deploy api --revision-suffix blue --no-traffic

# புதிய திருத்தத்தை சோதி
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# போக்குவரத்தைப் பிரி (20% நீலத்திற்கு, 80% தற்போதையத்திற்கு)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# முழு போக்குவரத்தை நீலத்துக்கு மாற்று
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### முறை 2: AZD உடன் கேனரி வெளியீடு

**கோப்பு: .azure/dev/config.json**
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

**வெளியீட்டு ஸ்கிரிப்ட்:**
```bash
#!/bin/bash
# deploy-canary.sh

# புதிய பதிப்பை 10% போக்குவரத்துடன் வெளியிடுங்கள்
azd deploy api --revision-mode multiple

# அளவுகோல்களை கண்காணிக்கவும்
azd monitor --service api --duration 5m

# போக்குவரத்தினை படிப்படியாக அதிகரிக்கவும்
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 நிமிடங்கள் காத்திருங்கள்
done
```

### முறை 3: பன்மண்டல வெளியீடு

**கோப்பு: azure.yaml**
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

**கோப்பு: infra/multi-region.bicep**
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

**வெளியீடு:**
```bash
# அனைத்து பிராந்தியங்களிலும் வெளியிடவும்
azd up

# எண்ட்பாயிண்ட்களை சரிபார்க்கவும்
azd show --output json | jq '.services.api.endpoints'
```

### முறை 4: Dapr இணைப்பு

**கோப்பு: infra/app/dapr-enabled.bicep**
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
        # நிலையை சேமிக்க
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # நிகழ்வை வெளியிட
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## சிறந்த நடைமுறைகள்

### 1. வள ஒழுங்கமைப்பு

```bash
# ஒற்றுமையான பெயரிடல் நடைமுறைகளைப் பயன்படுத்தவும்
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# செலவு கண்காணிப்பிற்காக வளங்களுக்கு குறிச்சொற்கள் ஒதுக்கவும்
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

### 3. செயல்திறன் சிற்றாக்கம்

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

### 4. கண்காணிப்பு மற்றும் கண்ணோட்டம்

```bash
# Application Insights ஐ செயல்படுத்தவும்
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# பதிவுகளை நேரடியாகப் பார்க்கவும்
azd monitor --logs
# அல்லது Container Apps க்கான Azure CLI ஐ பயன்படுத்தவும்:
az containerapp logs show --name api --resource-group rg-myapp --follow

# மெட்ரிக்குகளை கண்காணிக்கவும்
azd monitor --live

# அலெர்ட்களை உருவாக்கவும்
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. செலவு சிற்றாக்கம்

```bash
# பயன்படுத்தப்படாத போது அளவை பூஜ்ஜியமாகக் குறைக்கவும்
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# வளர்ச்சி சூழல்களுக்கு ஸ்பாட் இன்ஸ்டன்ஸ்களை பயன்படுத்தவும்
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# பட்ஜெட் எச்சரிக்கைகளை அமைக்கவும்
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD இணைப்பு

**GitHub Actions உதாரணம்:**
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
# புதிய கன்டெய்னர் அப் திட்டத்தை ஆரம்பிக்கவும்
azd init --template <template-name>

# அடித்தள அமைப்பையும் பயன்பாட்டையும் வெளியிடவும்
azd up

# பயன்பாட்டு குறியீட்டையே மட்டும் வெளியிடவும் (அடித்தளத்தைத் தவிர்க்கவும்)
azd deploy

# அடித்தள அமைப்பையே மட்டும் வழங்கவும்
azd provision

# வெளியிடப்பட்ட வளங்களைப் பார்க்கவும்
azd show

# azd monitor அல்லது Azure CLI பயன்படுத்தி பதிவுகளை தொடர்ச்சியாக பார்க்கவும்
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# பயன்பாட்டைக் கண்காணிக்கவும்
azd monitor --overview

# வளங்களை நீக்கவும்
azd down --force --purge
```

## சிக்கல் தீர்க்கல்

### பிழை: கொண்டெய்னர் துவங்குவதில் தோல்வி

```bash
# Azure CLI மூலம் பதிவுகளைச் சரிபார்க்கவும்
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# கொண்டெய்னர் நிகழ்வுகளைப் பார்க்கவும்
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# உள்ளூரில் சோதிக்கவும்
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### பிழை: கொண்டெய்னர் செயலியின் endpoint-ஐ அணுக முடியவில்லை

```bash
# இன்கிரெஸ் கட்டமைப்பை சரிபார்க்கவும்
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# உள்ளக இன்கிரெஸ் செயல்படுத்தப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### பிழை: செயல்திறன் சிக்கல்கள்

```bash
# வள பயன்பாட்டை சரிபார்க்கவும்
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

## கூடுதல் வளங்கள் மற்றும் உதாரணங்கள்
- [மைக்ரோசேவைகள் உதாரணம்](./microservices/README.md)
- [எளிய Flash API உதாரணம்](./simple-flask-api/README.md)
- [Azure Container Apps ஆவணங்கள்](https://learn.microsoft.com/azure/container-apps/)
- [AZD வார்ப்புரு காட்சியகம்](https://azure.github.io/awesome-azd/)
- [Container Apps மாதிரிகள்](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep வார்ப்புருக்கள்](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## பங்களிப்பு

புதிய கொண்டெய்னர் செயலி உதாரணங்களை பங்களிக்க:

1. உங்கள் உதாரணத்துடன் புதிய துணை அடைவை உருவாக்கவும்
2. முழுமையான `azure.yaml`, `infra/`, மற்றும் `src/` கோப்புகளை சேர்க்கவும்
3. வெளியீட்டு அறிவுறுத்தல்களுடன் முழுமையான README ஐ சேர்க்கவும்
4. `azd up` உடன் வெளியீட்டை சோதிக்கவும்
5. ஒரு pull request சமர்ப்பிக்கவும்

---

**உதவி வேண்டுமா?** ஆதரவு மற்றும் கேள்விகளுக்கு [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) சமூகத்தில் சேருங்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் தவறுகள் அல்லது துல்லியக்குறைபாடுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கருத்தில் கொள்ளவும். இதன் மூல மொழியில் உள்ள அசல் ஆவணம் அதிகாரபூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
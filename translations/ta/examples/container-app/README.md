# AZD உடன் கன்டெய்னர் செயலி வினியோக உதாரணங்கள்

இந்த கோப்புறையில் Azure Developer CLI (AZD) பயன்படுத்தி Azure Container Apps-க்கு கன்டெய்னரைப்படுத்திய பயன்பாடுகளை வினியோகிப்பதற்கான விரிவான உதாரணங்கள் உள்ளன. இந்த உதாரணங்கள் உண்மைப் பயன்பாட்டு மாதிரிகள், சிறந்த நடைமுறைகள் மற்றும் உற்பத்தி ரெடியான கட்டமைப்புகளை காட்டுகின்றன.

## 📚 உள்ளடக்க பட்டியல்

- [கண்ணோட்டம்](#கண்ணோட்டம்)
- [முன்-அவசியங்கள்](#முன்-அவசியங்கள்)
- [விரைவு தொடக்க உதாரணங்கள்](#விரைவு-தொடக்க-உதாரணங்கள்)
- [உற்பத்தி உதாரணங்கள்](#உற்பத்தி-உதாரணங்கள்)
- [மேம்பட்ட வடிவமைப்புகள்](#மேம்பட்ட-வடிவமைப்புகள்)
- [சிறந்த நடைமுறைங்கள்](#சிறந்த-நடைமுறைைகள்)

## கண்ணோட்டம்

Azure Container Apps என்பது கட்டமைப்பு மேலாண்மையை தேவையாக்காமலே மைക്രோசெர்விஸ்கள் மற்றும் கன்டெய்னரைப்படுத்திய பயன்பாடுகளை இயக்க அனுமதிக்கும் முழுமையாக நிர்வகிக்கப்படும் சர்வர்-இலைய கன்டெய்னர் தளம் ஆகும். AZD உடன் இணைத்தால், நீங்கள் பெறுகிறீர்கள்:

- **எளிதாக்கப்பட்ட வெளியீடு**: ஒரே கட்டளையால் அமைப்புச் சூழலுடன் கூடிய கன்டெய்னர்கள் வெளியிடப்படுகின்றன
- **தானியங்கி அளவீடு**: HTTP போக்குவரத்து அல்லது நிகழ்வுகளின் அடிப்படையில் பூஜ்யத்துக்கு சுருங்கவும் மற்றும் வெளியே பரவவும்
- **ஒருங்கிணைக்கப்பட்ட நெட்வொர்க்கிங்**: உள்ளடக்கமான சேவை கண்டறிதலும் போக்குவரத்து பிரிப்பும்
- **நிர்வகிக்கப்படும் அடையாளம்**: Azure வளங்களுக்கு பாதுகாப்பான அங்கீகாரம்
- **செலவு மேம்படுத்துதல்**: நீங்கள் பயன்படுத்தும் வளங்களுக்கே மட்டுமே கட்டணம் செலுத்துங்கள்

## முன்-அவசியங்கள்

ஆரம்பிப்பதற்கு முன், உங்களிடம் கீழ்காணும் விஷயங்கள் இருப்பதை உறுதிசெய்க:

```bash
# AZD நிறுவலைச் சரிபார்க்கவும்
azd version

# Azure CLI-ஐச் சரிபார்க்கவும்
az version

# Docker-ஐச் சரிபார்க்கவும் (தனிப்பயன் இமேஜ்களை உருவாக்குவதற்கு)
docker --version

# AZD டெபிளாய்மென்டுகளுக்காக அடையாளம் உறுதிப்படுத்தவும்
azd auth login

# விருப்பமானது: நேரடியாக az கட்டளைகளை இயக்க திட்டமிட்டால் Azure CLI-யில் உள்நுழையவும்
az login
```

**தேவையான Azure வளங்கள்:**
- Active Azure subscription
- Resource group creation permissions
- Container Apps environment access

## விரைவு தொடக்க உதாரணங்கள்

### 1. எளிய வலை API (Python Flask)

Azure Container Apps மூலம் அடிப்படை REST API ஒன்றை வெளியிடுங்கள்.

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
# வார்ப்புருவிலிருந்து தொடங்கவும்
azd init --template todo-python-mongo

# அடித்தள வளங்களை ஏற்பாடு செய்து, நிறுவு
azd up

# நிறுவலை சோதிக்கவும்
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**முக்கிய அம்சங்கள்:**
- 0 முதல் 10 பிரதிகளுக்கு தானாக அளவிடுதல்
- ஆரோக்கிய பரிசோதனைகள் மற்றும் உயிருள்ள தன்மை சோதனைகள்
- சுற்றுச்சூழல் மாறிலிகள் ஊற்றுதல்
- Application Insights ஒருங்கிணைப்பு

### 2. Node.js Express API

MongoDB ஒருங்கிணைப்புடன் ஒரு Node.js பின்னணியை வெளியிடுதல்.

```bash
# Node.js API வார்ப்புருவை துவக்கவும்
azd init --template todo-nodejs-mongo

# சூழல் மாறிலிகளை அமைக்கவும்
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# பயன்படுத்தவும்
azd up

# Azure Monitor வழியாக பதிவுகளைப் பார்க்கவும்
azd monitor --logs
```

**அடித்தள முக்கிய அம்சங்கள்:**
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

### 3. நிலையான முன்னணி + API பின்னணி

React முன்னணி மற்றும் API பின்னணி கொண்ட முழு-ஸ்டாக் பயன்பாட்டை வெளியிடுதல்.

```bash
# முழு-ஸ்டாக் டெம்ப்ளேட்டை ஆரம்பிக்கவும்
azd init --template todo-csharp-sql-swa-func

# கட்டமைப்பை பரிசீலிக்கவும்
cat azure.yaml

# இரு சேவைகளையும் நிறுவவும்
azd up

# பயன்பாட்டை திறக்கவும்
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## உற்பத்தி உதாரணங்கள்

### உதாரணம் 1: மைக்ரோசர்விஸ்கள் கட்டமைப்பு

**நிலமை**: பல மைக்ரோசர்விஸ்களை கொண்ட மின்னணு வணிக பயன்பாடு

**கோப்புறைக் கட்டமைப்பு:**
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

# அனைத்து சேவைகளையும் வினியோகிக்கவும்
azd up

# வினியோகத்தை கண்காணிக்கவும்
azd monitor --overview
```

### உதாரணம் 2: AI-சக்தியூட்டும் கன்டெய்னர் செயலி

**நிலமை**: Microsoft Foundry Models ஒருங்கிணைப்புடன் AI அரட்டை செயலி

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# பாதுகாப்பான அணுகலுக்காக நிர்வகிக்கப்பட்ட அடையாளத்தை பயன்படுத்தவும்
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault-இலிருந்து OpenAI விசையைப் பெறவும்
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

**வெளியீட்டு கட்டளைகள்:**
```bash
# சுற்றுச்சூழலை அமைக்க
azd init --template ai-chat-app
azd env new dev

# OpenAI-ஐ அமைக்க
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# வெளியிடு
azd up

# API-ஐ சோதிக்க
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### உதாரணம் 3: வரிசை செயலாக்கத்துடன் பின்புல பணியாளர்

**நிலமை**: செய்தி வரிசை கொண்ட ஆர்டர் செயலாக்க அமைப்பு

**கோப்புறைக் கட்டமைப்பு:**
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
            # கட்டளையை செயலாக்குதல்
            print(f"Processing order: {message.content}")
            
            # முழுமையான செய்தி
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

**வெளியீடு:**
```bash
# ஆரம்பிக்கவும்
azd init

# வரிசை கட்டமைப்போடு வெளியிடுக
azd up

# வரிசை நீளத்தின் அடிப்படையில் பணியாளர் எண்ணிக்கையை மாற்று
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## மேம்பட்ட வடிவமைப்புகள்

### வடிவமைப்பு 1: ப்ளூ-க்ரீன் வெளியீடு

```bash
# போக்குவரத்து இல்லாமல் புதிய திருத்தத்தை உருவாக்கவும்
azd deploy api --revision-suffix blue --no-traffic

# புதிய திருத்தத்தை சோதிக்கவும்
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# போக்குவரத்தை பிரிக்கவும் (20% நீலத்திற்கு, 80% தற்போதையதிற்கு)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# அனைத்து போக்குவரத்தையும் முழுமையாக நீலத்திற்கு மாற்றவும்
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### வடிவமைப்பு 2: AZD உடன் கானரி வெளியீடு

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

**வெளியீட்டு ஸ்க்ரிப்ட்:**
```bash
#!/bin/bash
# deploy-canary.sh

# புதிய திருத்தத்தை 10% போக்குவரத்துடன் வெளியிடவும்
azd deploy api --revision-mode multiple

# அளவுகுறியீடுகளை கண்காணிக்கவும்
azd monitor --service api --duration 5m

# போக்குவரத்தைக் படிப்படியாக அதிகரிக்கவும்
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 நிமிடங்கள் காத்திருங்கள்
done
```

### வடிவமைப்பு 3: பல பிராந்திய வெளியீடு

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

**வெளியீடு:**
```bash
# அனைத்து மண்டலங்களிலும் அமல்படுத்தவும்
azd up

# என்ட்பாயிண்டுகளை சரிபார்க்கவும்
azd show --output json | jq '.services.api.endpoints'
```

### வடிவமைப்பு 4: Dapr ஒருங்கிணைப்பு

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

## சிறந்த நடைமுறைைகள்

### 1. வள அமைப்பு

```bash
# ஒத்த பெயரிடும் நெறிமுறைகளைப் பயன்படுத்தவும்
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# செலவுக் கணக்குக்காக வளங்களை குறிச்சொற்களால் குறியிடவும்
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

### 3. செயல்திறன் மேம்படுத்துதல்

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

### 4. கண்காணிப்பு மற்றும் காணும் திறன்

```bash
# Application Insightsஐ செயல்படுத்தவும்
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# பதிவுகளை நேரடியாகப் பார்க்கவும்
azd monitor --logs
# அல்லது Container Apps க்கான Azure CLI ஐப் பயன்படுத்தவும்:
az containerapp logs show --name api --resource-group rg-myapp --follow

# அளவுருக்களை கண்காணிக்கவும்
azd monitor --live

# எச்சரிக்கைகளை உருவாக்கவும்
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. செலவு மேம்படுத்துதல்

```bash
# பயன்பாடில்லாத போது அளவை பூஜ்ஜியமாக மாற்றவும்
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# வளர்ச்சி சூழல்களுக்கு ஸ்பாட் இன்ஸ்டான்ஸ்களை பயன்படுத்தவும்
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# பட்ஜெட் எச்சரிக்கைகள் அமைக்கவும்
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD ஒருங்கிணைப்பு

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
# புதிய கன்டெய்னர் பயன்பாட்டு திட்டத்தை தொடங்கவும்
azd init --template <template-name>

# அடித்தளமும் பயன்பாட்டையும் வெளியிடவும்
azd up

# அடித்தளத்தை தவிர்த்து மட்டும் பயன்பாட்டு குறியீட்டை வெளியிடவும்
azd deploy

# அடித்தளத்தை மட்டும் ஏற்பாடு செய்யவும்
azd provision

# வெளியிடப்பட்ட வளங்களைப் பார்க்கவும்
azd show

# azd monitor அல்லது Azure CLI பயன்படுத்தி லாக்களை தொடர்ச்சியாகப் பார்க்கவும்
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# பயன்பாட்டை கண்காணிக்கவும்
azd monitor --overview

# வளங்களை அகற்று
azd down --force --purge
```

## பிரச்சினை தீர்வு

### சிக்கல்: கன்டெய்னர் துவங்க முடியவில்லை

```bash
# Azure CLI பயன்படுத்தி பதிவுகளைச் சரிபார்க்கவும்
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# கொன்டெய்னர் நிகழ்வுகளைப் பார்க்கவும்
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# உள்ளூர் முறையில் சோதிக்கவும்
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### சிக்கல்: கன்டெய்னர் செயலியின் என்ட்பாயிண்டை அணுக முடியவில்லை

```bash
# Ingress கட்டமைப்பை சரிபார்க்கவும்
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# உள்ளக Ingress செயல்படுத்தப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### சிக்கல்: செயல்திறன் பிரச்சினைகள்

```bash
# வள பயன்பாட்டைச் சரிபார்க்கவும்
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
- [மைக்ரோசர்விஸ்கள் உதாரணம்](./microservices/README.md)
- [எளிய Flash API உதாரணம்](./simple-flask-api/README.md)
- [Azure Container Apps ஆவணம்](https://learn.microsoft.com/azure/container-apps/)
- [AZD டெம்ப்ளேட் காட்சி](https://azure.github.io/awesome-azd/)
- [Container Apps மாதிரிகள்](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep டெம்ப்ளேட்ஸ்](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## பங்களிப்பு

புதிய கன்டெய்னர் செயலி உதாரணங்களை பங்களிக்க:

1. உங்கள் உதாரணத்திற்கான புதிய உப-கோப்புறையை உருவாக்கவும்
2. முழுமையான `azure.yaml`, `infra/`, மற்றும் `src/` கோப்புகளை சேர்க்கவும்
3. வெளியீட்டு அறிவுரைகளுடன் விரிவான README ஐச் சேர்க்கவும்
4. `azd up` மூலம் வெளியீட்டை சோதிக்கவும்
5. Pull request ஐ சமர்ப்பிக்கவும்

---

**உதவி வேண்டுமா?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) சமூகத்தில் ஆதரவு மற்றும் கேள்விகளுக்காக இணையுங்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிமாற்றம் செய்யப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் சொந்த மொழியிலேயே அதிகாரப்பூர்வ மூலமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்பட்ட எந்தவொரு தவறான புரிதலிற்கான அல்லது தவறான விளக்கங்களுக்கான பொறுப்பையும் நாங்கள் ஏற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
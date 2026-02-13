# AZD உடன் Container App Deployment உதாரணங்கள்

இந்த அடைவு Azure Developer CLI (AZD) பயன்படுத்தி Azure Container Apps களுக்கு container இயங்கும் செயலிகளை நியமிக்குவதற்கான விரிவான உதாரணங்களை கொண்டுள்ளது. இவை உண்மை உலகzna தாங்கும் வடிவமுறைகள், சிறந்த நடைமுறைகள் மற்றும் உற்பத்தி-தோற்ற அமைப்புகளை示கின்றன.

## 📚 உள்ளடக்கப் பட்டியல்

- [கண்ணோட்டம்](../../../../examples/container-app)
- [முன் நிபந்தனைகள்](../../../../examples/container-app)
- [விரைவான துவக்க உதாரணங்கள்](../../../../examples/container-app)
- [உற்பத்தி உதாரணங்கள்](../../../../examples/container-app)
- [மேம்பட்ட வடிவங்கள்](../../../../examples/container-app)
- [சிறந்த நடைமுறைகள்](../../../../examples/container-app)

## கண்ணோட்டம்

Azure Container Apps என்பது உங்களுக்கு கட்டமைப்பை பராமரிக்காமல் மைக்ரோசர்வீசுகளை மற்றும் container இயங்கும் செயலிகளைக் இயக்க அனுமதிக்கும் முழுமையாக நிர்வகிக்கப்படும் serverless container தளம் ஆகும். AZD உடன் இணைந்தால், நீங்கள் பெறுவீர்கள்:

- **எளிமையாக்கப்பட்ட பதிவேற்றம்**: ஒரே கட்டளை மூலம் கட்டமைப்புடன் கூடிய கன்டெய்னர்களை பதிவேற்ற முடியும்
- **தானியங்கி அளவீடு**: HTTP போக்குவரத்து அல்லது நிகழ்வுகளின் அடிப்படையில் 0 ஆக இருந்து விரிவடைந்து ஸ்கேல் செய்யும்
- **ஒட்டுமொத்த நெட்வொர்க்கிங்**: கட்டமைக்கப்பட்ட சேவை கண்டறிதல் மற்றும் போக்குவரத்து பிரித்தல்
- **மேலாண்மை அடையாளம்**: Azure வளங்களுக்கான பாதுகாப்பான அங்கீகாரம்
- **செலவு மேம்பாடு**: நீங்கள் பயன்படுத்தும் வளங்களுக்கு மட்டுமே பணம் செலுத்தவும்

## முன் நிபந்தனைகள்

தொடங்குவதற்கு முன், நீங்கள் கீழ்வருவன இருப்பதை உறுதிசெய்க:

```bash
# AZD நிறுவல் சரிபார்க்கவும்
azd version

# Azure CLI ஐச் சரிபார்க்கவும்
az version

# Docker ஐச் சரிபார்க்கவும் (தனிப்பயன் இமேஜ்கள் உருவாக்குவதற்காக)
docker --version

# Azure இல் உள்நுழையவும்
azd auth login
az login
```

**தேவையான Azure வளங்கள்:**
- செயலில் இருக்கும் Azure சந்தா
- Resource group உருவாக்க அனுமதிகள்
- Container Apps சுற்றுச்சூழல் அணுகல்

## விரைவான துவக்க உதாரணங்கள்

### 1. எளிய வலை API (Python Flask)

Azure Container Apps மூலம் அடிப்படை REST API ஒன்றை பதிவேற்றுங்கள்.

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

**பதிவேற்ற நடவடிக்கைகள்:**

```bash
# வார்ப்புருவிலிருந்து துவக்கவும்
azd init --template todo-python-mongo

# அடித்தள வளங்களை ஏற்பாடு செய்து நிறுவவும்
azd up

# நிறுவலை சோதிக்கவும்
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**முக்கிய அம்சங்கள்:**
- 0 இலிருந்து 10 பிரதிகளுக்கு தானியங்கி ஸ்கேலிங்
- ஆரோக்கிய மற்றும் உயிர்நிலை சோதனைகள்
- சுற்றுச்சூழல் மாறிலிகளை செருகுதல்
- Application Insights ஒருங்கிணைப்பு

### 2. Node.js Express API

MongoDB ஒருங்கிணைப்புடன் Node.js பின்னணி ஒன்றை பதிவேற்றுங்கள்.

```bash
# Node.js API வார்ப்புருவை ஆரம்பிக்கவும்
azd init --template todo-nodejs-mongo

# சுற்றுச்சூழல் மாறிலிகளை கட்டமைக்கவும்
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# அமர்த்தவும்
azd up

# Azure Monitor மூலம் பதிவுகளைப் பார்க்கவும்
azd monitor --logs
```

**கட்டமைப்பு முக்கிய அம்சங்கள்:**
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

React முன்னணி மற்றும் API பின்னணியுடன் முழு-ஸ்டாக் செயலியை பதிவேற்றுங்கள்.

```bash
# முழு-ஸ்டாக் வார்ப்புருவை ஆரம்பிக்கவும்
azd init --template todo-csharp-sql-swa-func

# கட்டமைப்பை பரிசீலனை செய்யவும்
cat azure.yaml

# இரண்டு சேவைகளையும் வெளியிடவும்
azd up

# விண்ணப்பத்தை திறவும்
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## உற்பத்தி உதாரணங்கள்

### உதாரணம் 1: மைக்ரோசர்வீசஸ் அமைப்பு

**நிகழ்நிலை**: பல மைக்ரோசர்வீச்களைக் கொண்ட மின்னணு வணிக பயன்பாடு

**டைரக்டரி அமைப்பு:**
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

**பதிவேற்றம்:**
```bash
# திட்டத்தை ஆரம்பிக்கவும்
azd init

# உற்பத்தி சூழ்நிலையை அமைக்கவும்
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

### உதாரணம் 2: AI-சக்தியூட்டப்பட்ட Container App

**நிகழ்நிலை**: Azure OpenAI ஒருங்கிணைப்புடன் AI அரட்டை செயலி

**கோப்பு: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# பாதுகாப்பான அணுகலுக்காக மேலாண்மை அடையாளத்தைப் பயன்படுத்தவும்
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

**பதிவேற்ற கட்டளைகள்:**
```bash
# சுற்றுச்சூழலை அமைக்கவும்
azd init --template ai-chat-app
azd env new dev

# OpenAI-ஐ கட்டமைக்கவும்
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# பதிவேற்றவும்
azd up

# API-ஐ சோதிக்கவும்
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### உதாரணம் 3: பின்னணி ஊழியர் மற்றும் வரிசை செயலாக்கம்

**நிகழ்நிலை**: செய்தி வரிசையுடன் ஆர்டர் செயலாக்க சூழல்

**டைரக்டரி அமைப்பு:**
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
            # ஆர்டர் செயலாக்கம்
            print(f"Processing order: {message.content}")
            
            # முழுமையான செய்தி
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

**பதிவேற்றம்:**
```bash
# துவக்கவும்
azd init

# வரிசை கட்டமைப்புடன் செயல்படுத்தவும்
azd up

# வரிசை நீளத்தின் அடிப்படையில் வொர்கர் எண்ணிக்கையை மாற்று
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## மேம்பட்ட வடிவங்கள்

### வடிவம் 1: Blue-Green Deployment

```bash
# டிராஃபிக் இல்லாமல் புதிய பதிப்பை உருவாக்கு
azd deploy api --revision-suffix blue --no-traffic

# புதிய பதிப்பை சோதிக்கவும்
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# டிராஃபிக்கை பிரி (20% ஐ நீலத்திற்கு, 80% ஐ தற்போதையத்திற்கு)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# முழுமையாக நீலத்துக்கு மாற்று
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### வடிவம் 2: Canary Deployment with AZD

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

**பதிவேற்ற ஸ்கிரிப்ட்:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10% போக்குவரத்துடன் புதிய பதிப்பை வெளியிடவும்
azd deploy api --revision-mode multiple

# அளவுகோல்களை கண்காணிக்கவும்
azd monitor --service api --duration 5m

# போக்குவரத்தை படிப்படியாக அதிகரிக்கவும்
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 நிமிடங்கள் காத்திருக்கவும்
done
```

### வடிவம் 3: பல-பிராந்திய பதிவேற்றம்

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

**பதிவேற்றம்:**
```bash
# அனைத்து பிராந்தியங்களிலும் வெளியிடவும்
azd up

# எண்ட்பாயிண்டுகளை சரிபார்க்கவும்
azd show --output json | jq '.services.api.endpoints'
```

### வடிவம் 4: Dapr ஒருங்கிணைப்பு

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
        # நிலையைச் சேமிக்கவும்
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

### 1. வளம் ஏற்பாடு

```bash
# ஒற்றுமையான பெயரிடல் நடைமுறைகளைப் பயன்படுத்தவும்
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# செலவு கண்காணிப்பிற்காக வளங்களுக்கு லேபிள் இடவும்
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

### 4. கண்காணிப்பு மற்றும் அறிகுறி திறன்

```bash
# Application Insights ஐ இயக்கு
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# உடனடியான நேரத்தில் பதிவுகளைப் பார்க்கவும்
azd monitor --logs
# அல்லது Container Apps க்கான Azure CLI-ஐ பயன்படுத்தவும்:
az containerapp logs show --name api --resource-group rg-myapp --follow

# அளவுகூறுகளை கண்காணிக்கவும்
azd monitor --live

# எச்சரிக்கைகள் உருவாக்கவும்
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. செலவு மேம்பாடு

```bash
# பயன்பாட்டில் இல்லாதபோது அளவை பூஜ்யமாகக் குறைக்கவும்
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# வளர்ச்சி சூழல்களுக்கு ஸ்பாட் இன்ஸ்டான்ஸ்களைப் பயன்படுத்தவும்
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# பட்ஜெட் எச்சரிக்கைகளை அமைக்கவும்
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
# புதிய container app திட்டத்தை ஆரம்பிக்கவும்
azd init --template <template-name>

# அடித்தள அமைப்பையும் பயன்பாட்டையும் நிறுவவும்
azd up

# அடித்தளத்தை தவிர்த்து பயன்பாட்டு குறியீட்டையே மட்டும் நிறுவவும்
azd deploy

# அடித்தள அமைப்புகளை மட்டும் ஏற்பாடு செய்யவும்
azd provision

# நிறுவப்பட்ட வளங்களைப் பார்க்கவும்
azd show

# azd monitor அல்லது Azure CLI பயன்படுத்தி பதிவுகளை நேரடியாக ஒளிபரப்பவும்
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# பயன்பாட்டைக் கண்காணிக்கவும்
azd monitor --overview

# வளங்களை சுத்தம் செய்யவும்
azd down --force --purge
```

## பிழைதிருத்தம்

### சிக்கல்: Container துவங்கத் தடைபட்டது

```bash
# Azure CLI ஐப் பயன்படுத்தி பதிவுகளைச் சரிபார்க்கவும்
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

### சிக்கல்: Container app endpoint-ஐ அணுக முடியவில்லை

```bash
# இன்க்ரெஸ் கட்டமைப்பை சரிபார்க்கவும்
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# உள்ளக இன்க்ரெஸ் செயல்படுத்தப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### சிக்கல்: செயல்திறன் சிக்கல்கள்

```bash
# வள பயன்பாட்டை சரிபார்க்கவும்
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# வளங்களை அதிகப்படுத்தவும்
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## கூடுதல் வளங்கள் மற்றும் உதாரணங்கள்
- [மைக்ரோசர்வீசஸ் உதாரணம்](./microservices/README.md)
- [எளிய Flash API உதாரணம்](./simple-flask-api/README.md)
- [Azure Container Apps ஆவணங்கள்](https://learn.microsoft.com/azure/container-apps/)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)
- [Container Apps மாதிரிகள்](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep டெம்ப்ளேட்கள்](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## பங்களிப்பு

புதிய container app உதாரணங்களை பங்களிக்க:

1. உங்கள் உதாரணத்திற்கான புதிய துணை அடைவை உருவாக்கவும்
2. முழுமையாக `azure.yaml`, `infra/`, மற்றும் `src/` கோப்புகளை சேர்க்கவும்
3. பதிவேற்ற வழிமுறைகளுடன் விரிவான README-வைச் சேர்க்கவும்
4. `azd up` மூலம் பதிவேற்றத்தை சோதிக்கவும்
5. ஒரு pull request சமர்ப்பிக்கவும்

---

**உதவி தேவைதா?** ஆதரவு மற்றும் கேள்விகளுக்கு [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) சமூகத்தில் இணைக.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்புரை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயலினாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். மூல மொழியில் உள்ள ஆவணம் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்பட்ட任何 புரிதல் பிழைகள் அல்லது பொருள் தவறுகளுக்காக நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-20T14:32:44+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "ne"
}
-->
# AZD सँग कन्टेनर एप्लिकेसन डिप्लोयमेन्टका उदाहरणहरू

यो डाइरेक्टरीले Azure Developer CLI (AZD) प्रयोग गरेर Azure Container Apps मा कन्टेनराइज्ड एप्लिकेसनहरू डिप्लोय गर्नका लागि व्यापक उदाहरणहरू समावेश गर्दछ। यी उदाहरणहरूले वास्तविक संसारका ढाँचाहरू, उत्कृष्ट अभ्यासहरू, र उत्पादन-तयारी कन्फिगरेसनहरू प्रदर्शन गर्छन्।

## 📚 सामग्री सूची

- [सारांश](../../../../examples/container-app)
- [पूर्वआवश्यकताहरू](../../../../examples/container-app)
- [छिटो सुरु गर्ने उदाहरणहरू](../../../../examples/container-app)
- [उत्पादनका उदाहरणहरू](../../../../examples/container-app)
- [उन्नत ढाँचाहरू](../../../../examples/container-app)
- [उत्कृष्ट अभ्यासहरू](../../../../examples/container-app)

## सारांश

Azure Container Apps एक पूर्ण रूपमा व्यवस्थापन गरिएको सर्भरलेस कन्टेनर प्लेटफर्म हो जसले तपाईंलाई माइक्रोसर्भिस र कन्टेनराइज्ड एप्लिकेसनहरू इन्फ्रास्ट्रक्चर व्यवस्थापन नगरी चलाउन सक्षम बनाउँछ। AZD सँग मिलेर, तपाईंले पाउनुहुन्छ:

- **सरल डिप्लोयमेन्ट**: एकै कमाण्डले कन्टेनरहरू इन्फ्रास्ट्रक्चर सहित डिप्लोय गर्छ
- **स्वचालित स्केलिङ**: HTTP ट्राफिक वा घटनाहरूको आधारमा शून्यदेखि बाहिर स्केल
- **एकीकृत नेटवर्किङ**: बिल्ट-इन सर्भिस डिस्कभरी र ट्राफिक स्प्लिटिङ
- **प्रबन्धित पहिचान**: Azure स्रोतहरूमा सुरक्षित प्रमाणीकरण
- **खर्च अनुकूलन**: तपाईंले प्रयोग गर्ने स्रोतहरूको लागि मात्र तिर्नुहोस्

## पूर्वआवश्यकताहरू

सुरु गर्नुअघि, सुनिश्चित गर्नुहोस् कि तपाईंले यी चीजहरू तयार पार्नुभएको छ:

```bash
# AZD स्थापना जाँच गर्नुहोस्
azd version

# Azure CLI जाँच गर्नुहोस्
az version

# Docker जाँच गर्नुहोस् (कस्टम छविहरू निर्माण गर्नको लागि)
docker --version

# Azure मा लगइन गर्नुहोस्
azd auth login
az login
```

**आवश्यक Azure स्रोतहरू:**
- सक्रिय Azure सदस्यता
- स्रोत समूह सिर्जना गर्ने अनुमति
- Container Apps वातावरण पहुँच

## छिटो सुरु गर्ने उदाहरणहरू

### १. साधारण वेब API (Python Flask)

Azure Container Apps सँग एक आधारभूत REST API डिप्लोय गर्नुहोस्।

**उदाहरण: Python Flask API**

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

**डिप्लोयमेन्ट चरणहरू:**

```bash
# टेम्प्लेटबाट आरम्भ गर्नुहोस्
azd init --template todo-python-mongo

# पूर्वाधार तयार गर्नुहोस् र परिनियोजन गर्नुहोस्
azd up

# परिनियोजन परीक्षण गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य विशेषताहरू:**
- ० देखि १० प्रतिकृतिहरूमा स्वत: स्केलिङ
- स्वास्थ्य जाँच र लिभनेस चेकहरू
- वातावरणीय भेरिएबल इन्जेक्सन
- Application Insights एकीकरण

### २. Node.js Express API

MongoDB एकीकरणसहित Node.js ब्याकएन्ड डिप्लोय गर्नुहोस्।

```bash
# Node.js API टेम्पलेट आरम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# वातावरण चरहरू कन्फिगर गर्नुहोस्
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# परिनियोजन गर्नुहोस्
azd up

# लगहरू हेर्नुहोस्
azd logs api
```

**इन्फ्रास्ट्रक्चर हाइलाइटहरू:**
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

### ३. स्थिर फ्रन्टएन्ड + API ब्याकएन्ड

React फ्रन्टएन्ड र API ब्याकएन्डसहित पूर्ण-स्ट्याक एप्लिकेसन डिप्लोय गर्नुहोस्।

```bash
# पूर्ण-स्ट्याक टेम्पलेट सुरु गर्नुहोस्
azd init --template todo-csharp-sql-swa-func

# कन्फिगरेसन समीक्षा गर्नुहोस्
cat azure.yaml

# दुबै सेवाहरू परिनियोजन गर्नुहोस्
azd up

# एप्लिकेशन खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## उत्पादनका उदाहरणहरू

### उदाहरण १: माइक्रोसर्भिस आर्किटेक्चर

**परिदृश्य**: धेरै माइक्रोसर्भिसहरूसहितको ई-कमर्स एप्लिकेसन

**डाइरेक्टरी संरचना:**
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

**azure.yaml कन्फिगरेसन:**
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

**डिप्लोयमेन्ट:**
```bash
# परियोजना आरम्भ गर्नुहोस्
azd init

# उत्पादन वातावरण सेट गर्नुहोस्
azd env new production

# उत्पादन सेटिङहरू कन्फिगर गर्नुहोस्
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# सबै सेवाहरू तैनाथ गर्नुहोस्
azd up

# तैनाथी निगरानी गर्नुहोस्
azd monitor --overview
```

### उदाहरण २: AI-सक्षम कन्टेनर एप

**परिदृश्य**: Azure OpenAI एकीकरणसहितको AI च्याट एप्लिकेसन

**फाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित पहुँचको लागि प्रबन्धित पहिचान प्रयोग गर्नुहोस्
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # की भल्टबाट OpenAI की प्राप्त गर्नुहोस्
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

**फाइल: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**फाइल: infra/main.bicep**
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

**डिप्लोयमेन्ट कमाण्डहरू:**
```bash
# वातावरण सेट अप गर्नुहोस्
azd init --template ai-chat-app
azd env new dev

# OpenAI कन्फिगर गर्नुहोस्
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# परिनियोजन गर्नुहोस्
azd up

# API परीक्षण गर्नुहोस्
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण ३: पृष्ठभूमि कार्यकर्ता र पंक्ति प्रशोधन

**परिदृश्य**: सन्देश पंक्तिसहितको अर्डर प्रशोधन प्रणाली

**डाइरेक्टरी संरचना:**
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

**फाइल: src/worker/processor.py**
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
            # अर्डर प्रक्रिया गर्नुहोस्
            print(f"Processing order: {message.content}")
            
            # सन्देश पूरा गर्नुहोस्
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**फाइल: azure.yaml**
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

**डिप्लोयमेन्ट:**
```bash
# सुरु गर्नुहोस्
azd init

# पङ्क्ति कन्फिगरेसनको साथ तैनात गर्नुहोस्
azd up

# पङ्क्तिको लम्बाइको आधारमा कार्यकर्ता स्केल गर्नुहोस्
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## उन्नत ढाँचाहरू

### ढाँचा १: ब्लू-ग्रीन डिप्लोयमेन्ट

```bash
# नयाँ संशोधन ट्राफिक बिना सिर्जना गर्नुहोस्
azd deploy api --revision-suffix blue --no-traffic

# नयाँ संशोधन परीक्षण गर्नुहोस्
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्राफिक विभाजन गर्नुहोस् (२०% निलोमा, ८०% वर्तमानमा)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूर्ण कटओभर निलोमा
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ढाँचा २: AZD सँग क्यानरी डिप्लोयमेन्ट

**फाइल: .azure/dev/config.json**
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

**डिप्लोयमेन्ट स्क्रिप्ट:**
```bash
#!/bin/bash
# deploy-canary.sh

# नयाँ संशोधन १०% ट्राफिकसँग तैनाथ गर्नुहोस्
azd deploy api --revision-mode multiple

# मेट्रिक्स अनुगमन गर्नुहोस्
azd monitor --service api --duration 5m

# ट्राफिक क्रमिक रूपमा बढाउनुहोस्
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ५ मिनेट पर्खनुहोस्
done
```

### ढाँचा ३: बहु-क्षेत्र डिप्लोयमेन्ट

**फाइल: azure.yaml**
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

**फाइल: infra/multi-region.bicep**
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

**डिप्लोयमेन्ट:**
```bash
# सबै क्षेत्रहरूमा परिनियोजन गर्नुहोस्
azd up

# अन्तिम बिन्दुहरू प्रमाणित गर्नुहोस्
azd show --output json | jq '.services.api.endpoints'
```

### ढाँचा ४: Dapr एकीकरण

**फाइल: infra/app/dapr-enabled.bicep**
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

**Dapr सँग एप्लिकेसन कोड:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # अवस्था बचत गर्नुहोस्
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # घटना प्रकाशित गर्नुहोस्
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## उत्कृष्ट अभ्यासहरू

### १. स्रोत संगठन

```bash
# समान नामकरण परम्परा प्रयोग गर्नुहोस्
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# लागत ट्र्याकिङको लागि स्रोतहरू ट्याग गर्नुहोस्
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### २. सुरक्षा उत्कृष्ट अभ्यासहरू

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

### ३. प्रदर्शन अनुकूलन

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

### ४. अनुगमन र अवलोकनीयता

```bash
# एप्लिकेशन इनसाइट्स सक्षम गर्नुहोस्
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# वास्तविक समयमा लगहरू हेर्नुहोस्
azd logs api --follow

# मेट्रिक्स अनुगमन गर्नुहोस्
azd monitor --service api

# अलर्टहरू सिर्जना गर्नुहोस्
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### ५. खर्च अनुकूलन

```bash
# प्रयोगमा नभएको बेला शून्यमा स्केल गर्नुहोस्
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# विकास वातावरणहरूको लागि स्पट इन्स्ट्यान्सहरू प्रयोग गर्नुहोस्
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजेट चेतावनीहरू सेट गर्नुहोस्
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### ६. CI/CD एकीकरण

**GitHub Actions उदाहरण:**
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

## सामान्य कमाण्डहरूको सन्दर्भ

```bash
# नयाँ कन्टेनर एप परियोजना सुरु गर्नुहोस्
azd init --template <template-name>

# पूर्वाधार र एप्लिकेसन परिनियोजन गर्नुहोस्
azd up

# केवल एप्लिकेसन कोड परिनियोजन गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# केवल पूर्वाधार प्रावधान गर्नुहोस्
azd provision

# परिनियोजित स्रोतहरू हेर्नुहोस्
azd show

# लगहरू स्ट्रिम गर्नुहोस्
azd logs <service-name> --follow

# एप्लिकेसन अनुगमन गर्नुहोस्
azd monitor --overview

# स्रोतहरू सफा गर्नुहोस्
azd down --force --purge
```

## समस्या समाधान

### समस्या: कन्टेनर सुरु हुन सकेन

```bash
# लगहरू जाँच गर्नुहोस्
azd logs api --tail 100

# कन्टेनर घटनाहरू हेर्नुहोस्
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानीय रूपमा परीक्षण गर्नुहोस्
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### समस्या: कन्टेनर एपको अन्त बिन्दुमा पहुँच गर्न सकिएन

```bash
# इनग्रेस कन्फिगरेसन प्रमाणित गर्नुहोस्
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# जाँच गर्नुहोस् कि आन्तरिक इनग्रेस सक्षम छ
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### समस्या: प्रदर्शन समस्या

```bash
# स्रोत उपयोग जाँच गर्नुहोस्
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# स्रोतहरू बढाउनुहोस्
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## थप स्रोतहरू र उदाहरणहरू
- [माइक्रोसर्भिस उदाहरण](./microservices/README.md)
- [साधारण Flash API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps कागजात](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [Container Apps नमूनाहरू](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्प्लेटहरू](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## योगदान

नयाँ कन्टेनर एप उदाहरणहरू योगदान गर्न:

1. आफ्नो उदाहरणसहित नयाँ सबडाइरेक्टरी सिर्जना गर्नुहोस्
2. पूर्ण `azure.yaml`, `infra/`, र `src/` फाइलहरू समावेश गर्नुहोस्
3. डिप्लोयमेन्ट निर्देशनहरू सहित व्यापक README थप्नुहोस्
4. `azd up` सँग डिप्लोयमेन्ट परीक्षण गर्नुहोस्
5. पुल अनुरोध सबमिट गर्नुहोस्

---

**मद्दत चाहिन्छ?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदायमा सामेल हुनुहोस् सहयोग र प्रश्नहरूको लागि।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको दस्तावेजलाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
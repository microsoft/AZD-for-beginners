# सतह एप्लिकेसन तैनाथी उदाहरणहरू AZD सँग

यो निर्देशिका Azure Developer CLI (AZD) प्रयोग गरी Azure Container Apps मा कन्टेनरयुक्त एप्लिकेसन तैनाथ गर्ने व्यापक उदाहरणहरू समावेश गर्दछ। यी उदाहरणहरूले वास्तविक-विश्व ढाँचाहरू, उत्तम अभ्यासहरू, र उत्पादन-योग्य कन्फिगरेसनहरू प्रदर्शन गर्छन्।

## 📚 सामग्री तालिका

- [संक्षिप्त परिचय](#संक्षिप्त-परिचय)
- [पूर्व आवश्यकताहरु](#पूर्व-आवश्यकताहरु)
- [द्रुत प्रारम्भ उदाहरणहरू](#द्रुत-प्रारम्भ-उदाहरणहरू)
- [उत्पादन उदाहरणहरू](#उत्पादन-उदाहरणहरू)
- [उन्नत ढाँचाहरू](#उन्नत-ढाँचाहरू)
- [उत्तम अभ्यासहरू](#उत्तम-अभ्यासहरू)

## संक्षिप्त परिचय

Azure Container Apps पूर्ण रूपमा व्यवस्थापन गरिएको सर्भरलेस कन्टेनर प्लेटफर्म हो जसले तपाईंलाई पूर्वाधार व्यवस्थापन नगरी माइक्रोसर्भिस र कन्टेनरयुक्त एप्लिकेसनहरू चलाउन सक्षम बनाउँछ। AZD सँग संयुक्त हुँदा, तपाईंलाई प्राप्त हुन्छ:

- **सरल तैनाथी**: एकल कमाण्डले पूर्वाधारसहित कन्टेनरहरू तैनाथ गर्छ
- **स्वचालित स्केलिङ**: HTTP ट्राफिक वा घटनाहरूको आधारमा जीरोसम्म र स्केल आउट सम्म विस्तार
- **एकीकृत नेटवर्किङ**: निर्मित सेवा खोज र ट्राफिक विभाजन
- **व्यवस्थित पहिचान**: Azure स्रोतहरूमा सुरक्षित प्रमाणीकरण
- **लागत अनुकूलन**: तपाईंले प्रयोग गर्ने स्रोतहरूका लागि मात्र तिर्नुहोस्

## पूर्व आवश्यकताहरु

थाल्नुअघि, सुनिश्चित गर्नुहोस् तपाईंसँग छ:

```bash
# AZD स्थापना जाँच गर्नुहोस्
azd version

# Azure CLI जाँच गर्नुहोस्
az version

# Docker जाँच गर्नुहोस् (अनुकूलित छविहरू बनाउने लागि)
docker --version

# AZD परिनियोजनहरूका लागि प्रमाणीकरण गर्नुहोस्
azd auth login

# वैकल्पिक: यदि तपाईं az आदेशहरू सिधै चलाउन योजना बनाउनु भएको छ भने Azure CLI मा साइन इन गर्नुहोस्
az login
```

**आवश्यक Azure स्रोतहरू:**
- सक्रिय Azure सदस्यता
- स्रोत समूह सिर्जना अनुमतिहरू
- Container Apps वातावरण पहुँच

## द्रुत प्रारम्भ उदाहरणहरू

### १. सरल वेब API (Python Flask)

Azure Container Apps सँग आधारभूत REST API तैनाथ गर्नुहोस्।

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

**तैनाथी चरणहरू:**

```bash
# टेम्प्लेटबाट आरम्भ गर्नुहोस्
azd init --template todo-python-mongo

# पूर्वाधार व्यवस्था गर्नुहोस् र तैनाथ गर्नुहोस्
azd up

# तैनाथीकरण परीक्षण गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य विशेषताहरू:**
- ० देखि १० प्रतिकृतिसम्म स्वचालित स्केलिङ
- स्वास्थ्य जाँच र जीवित रहिरहने जाँचहरू
- वातावरणीय चरहरू इन्जेक्सन
- एप्लिकेसन इनसाइट्स एकीकरण

### २. Node.js Express API

MongoDB एकीकरणसहित Node.js ब्याकएन्ड तैनाथ गर्नुहोस्।

```bash
# Node.js API टेम्प्लेट प्रारम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# वातावरण भेरिएबलहरू कन्फिगर गर्नुहोस्
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# स्थापन गर्नुहोस्
azd up

# Azure Monitor मार्फत लगहरू हेर्नुहोस्
azd monitor --logs
```

**पूर्वाधार विशेषताहरू:**
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

React फ्रन्टएन्ड र API ब्याकएन्डसहित पूर्ण-स्ट्याक एप्लिकेसन तैनाथ गर्नुहोस्।

```bash
# पुरा-स्ट्याक टेम्प्लेट सुरु गर्नुहोस्
azd init --template todo-csharp-sql-swa-func

# कन्फिगरेसन समीक्षा गर्नुहोस्
cat azure.yaml

# दुवै सेवाहरू परिनियोजन गर्नुहोस्
azd up

# आवेदन खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## उत्पादन उदाहरणहरू

### उदाहरण १: माइक्रोसर्भिस आर्किटेक्चर

**परिदृश्य**: बहु माइक्रोसर्भिसहरूसँग ई-कमर्स एप्लिकेसन

**निर्देशिका संरचना:**
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

**तैनाथी:**
```bash
# परियोजना आरम्भ गर्नुहोस्
azd init

# उत्पादन वातावरण सेट गर्नुहोस्
azd env new production

# उत्पादन सेटिङहरू कन्फिगर गर्नुहोस्
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# सबै सेवाहरू डिप्लॉय गर्नुहोस्
azd up

# डिप्लॉयमेन्ट निगरानी गर्नुहोस्
azd monitor --overview
```

### उदाहरण २: AI-सक्षम कन्टेनर एप

**परिदृश्य**: Microsoft Foundry मोडेलहरू एकीकरणसहित AI च्याट एप्लिकेसन

**फाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित पहुँचको लागि व्यवस्थापन गरिएको पहिचान प्रयोग गर्नुहोस्
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # की भल्टबाट OpenAI कुञ्जी प्राप्त गर्नुहोस्
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

**तैनाथी कमाण्डहरू:**
```bash
# वातावरण सेटअप गर्नुहोस्
azd init --template ai-chat-app
azd env new dev

# OpenAI कन्फिगर गर्नुहोस्
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# तैनाथ गर्नुहोस्
azd up

# API परीक्षण गर्नुहोस्
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण ३: पृष्ठभूमि कर्मचारीसँग क्यु प्रोसेसिङ

**परिदृश्य**: अर्डर प्रशोधन प्रणालीसँग सन्देश क्यु

**निर्देशिका संरचना:**
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
            # आदेश प्रशोधन गर्नुहोस्
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

**तैनाथी:**
```bash
# आरम्भ गर्नुहोस्
azd init

# पङ्क्ति कन्फिगरेसनसँग डिप्लोय गर्नुहोस्
azd up

# पङ्क्तिको लम्बाइ अनुसार कामदारको मापन गर्नुहोस्
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## उन्नत ढाँचाहरू

### ढाँचा १: निलो-हरियो तैनाथी

```bash
# ट्राफिक बिना नयाँ संशोधन सिर्जना गर्नुहोस्
azd deploy api --revision-suffix blue --no-traffic

# नयाँ संशोधन परीक्षण गर्नुहोस्
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्राफिक विभाजन गर्नुहोस् (२०% नीलोमा, ८०% वर्तमानमा)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूर्ण रूपमा नीलो मा स्थानान्तरण गर्नुहोस्
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ढाँचा २: AZD सँग क्यानेरी तैनाथी

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

**तैनाथी स्क्रिप्ट:**
```bash
#!/bin/bash
# deploy-canary.sh

# १०% ट्राफिक संग नयाँ संशोधन तैनाथ गर्नुहोस्
azd deploy api --revision-mode multiple

# मेट्रिक्स निगरानी गर्नुहोस्
azd monitor --service api --duration 5m

# ट्राफिक Gradually बढाउनुहोस्
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ५ मिनेट प्रतीक्षा गर्नुहोस्
done
```

### ढाँचा ३: बहु-क्षेत्र तैनाथी

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

**तैनाथी:**
```bash
# सबै क्षेत्रहरूमा तैनाथ गर्नुहोस्
azd up

# अन्त बिन्दुहरू प्रमाणित गर्नुहोस्
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

**Dapr सहित एप्लिकेसन कोड:**
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

## उत्तम अभ्यासहरू

### १. स्रोत संगठन

```bash
# एकरूप नामकरण कन्वेन्सनहरू प्रयोग गर्नुहोस्
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# लागत ट्र्याकिङको लागि स्रोतहरूलाई ट्याग गर्नुहोस्
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### २. सुरक्षा उत्तम अभ्यासहरू

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

### ४. अनुगमन र अवलोकनयोग्यता

```bash
# एप्लिकेशन इनसाइट्स सक्षम गर्नुहोस्
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# रियल-टाइममा लगहरू हेर्नुहोस्
azd monitor --logs
# वा कन्टेनर एप्सको लागि Azure CLI प्रयोग गर्नुहोस्:
az containerapp logs show --name api --resource-group rg-myapp --follow

# मेट्रिक्स अनुगमन गर्नुहोस्
azd monitor --live

# अलर्टहरू बनाउनुहोस्
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### ५. लागत अनुकूलन

```bash
# प्रयोगमा नरहँदा शून्यमा स्केल गर्नुहोस्
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# विकास वातावरणका लागि स्पट इन्स्टेन्सहरू प्रयोग गर्नुहोस्
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजेट सूचनाहरू सेटअप गर्नुहोस्
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

## सामान्य कमाण्ड सन्दर्भ

```bash
# नयाँ कन्टेनर एप प्रोजेक्ट सुरु गर्नुहोस्
azd init --template <template-name>

# पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
azd up

# केवल अनुप्रयोग कोड तैनाथ गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# केवल पूर्वाधार प्रावधान गर्नुहोस्
azd provision

# तैनाथ गरिएका स्रोतहरू हेर्नुहोस्
azd show

# azd monitor वा Azure CLI प्रयोग गरी लगहरू स्ट्रिम गर्नुहोस्
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# अनुप्रयोग निगरानी गर्नुहोस्
azd monitor --overview

# स्रोतहरू सफा गर्नुहोस्
azd down --force --purge
```

## समस्या समाधान

### समस्या: कन्टेनर सुरु हुन सक्दैन

```bash
# Azure CLI प्रयोग गरी लगहरू जाँच गर्नुहोस्
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# कन्टेनर घटनाहरू हेर्नुहोस्
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानीय रूपमा परीक्षण गर्नुहोस्
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### समस्या: कन्टेनर एप इन्डपोइन्ट पहुँच गर्न सकिँदैन

```bash
# इन्ग्रेस कन्फिगरेसन जाँच गर्नुहोस्
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# भित्रि इन्ग्रेस सक्षम छ कि छैन जाँच गर्नुहोस्
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

# स्रोतहरू वृद्धि गर्नुहोस्
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## थप स्रोत र उदाहरणहरू
- [माइक्रोसर्भिस उदाहरण](./microservices/README.md)
- [सरल फ्लास्क API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps कागजात](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [Container Apps नमूना](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्प्लेटहरू](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## योगदान

नयाँ कन्टेनर एप उदाहरणहरू योगदान गर्न:

1. तपाईंको उदाहरणसँग नयाँ उपनिर्देशिका सिर्जना गर्नुहोस्
2. पूर्ण `azure.yaml`, `infra/`, र `src/` फाइलहरू समावेश गर्नुहोस्
3. तैनाथी निर्देशनसहित व्यापक README थप्नुहोस्
4. `azd up` सँग तैनाथी परीक्षण गर्नुहोस्
5. पुल अनुरोध सबमिट गर्नुहोस्

---

**मद्दत चाहिन्छ?** सहयोग र प्रश्नहरूको लागि [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदायमा सहभागी हुनुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यस दस्तावेजलाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सटीकताको प्रयास गर्छौं भने पनि, कृपया जान्नुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धिहरू हुन सक्छन्। मूल दस्तावेज यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याहरूका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
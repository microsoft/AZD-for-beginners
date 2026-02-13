# AZD सहित कन्टेनर एप तैनाती उदाहरणहरू

यस निर्देशिकाले Azure Developer CLI (AZD) प्रयोग गरेर Azure Container Apps मा कन्टेनराइज्ड अनुप्रयोगहरू तैनाथ गर्ने विस्तृत उदाहरणहरू समावेश गर्छ। यी उदाहरणहरूले वास्तविक-विश्व ढाँचाहरू, सर्वोत्तम अभ्यासहरू, र उत्पादन-तयार कन्फिगरेसनहरू देखाउँछन्।

## 📚 Table of Contents

- [अवलोकन](../../../../examples/container-app)
- [पूर्वआवश्यकताहरू](../../../../examples/container-app)
- [द्रुत सुरु उदाहरणहरू](../../../../examples/container-app)
- [उत्पादन उदाहरणहरू](../../../../examples/container-app)
- [उन्नत ढाँचाहरू](../../../../examples/container-app)
- [सर्वोत्तम अभ्यासहरू](../../../../examples/container-app)

## Overview

Azure Container Apps एक पूर्ण रूपमा व्यवस्थापन गरिएको सर्भरलेस कन्टेनर प्लेटफर्म हो जसले तपाईंलाई पूर्वाधार व्यवस्थापन नगरी माइक्रोसर्भिस र कन्टेनराइज्ड अनुप्रयोगहरू चलाउन सक्षम बनाउँछ। AZD सँग संयोजन गर्दा, तपाईंलाई निम्न सुविधाहरू मिल्छन्:

- **सरलीकृत तैनाती**: एक आदेशले पूर्वाधारसहित कन्टेनरहरू तैनाथ गर्छ
- **स्वचालित स्केलिङ**: HTTP ट्राफिक वा घटनाहरूको आधारमा शून्यसम्म र बाहिरसम्म स्केल हुन्छ
- **एकीकृत नेटवर्किङ**: निर्मित सेवा पत्ता लगाउने र ट्राफिक विभाजन
- **व्यवस्थित पहिचान**: Azure स्रोतहरूसँग सुरक्षित प्रमाणीकरण
- **लागत अनुकूलन**: तपाईंले प्रयोग गर्ने स्रोतहरूको मात्र तिर्नुहोस्

## Prerequisites

सुरु गर्नु अघि, सुनिश्चित गर्नुहोस् कि तपाईंसँग छ:

```bash
# AZD स्थापना जाँच गर्नुहोस्
azd version

# Azure CLI जाँच गर्नुहोस्
az version

# Docker जाँच गर्नुहोस् (कस्टम इमेजहरू बनाउनको लागि)
docker --version

# Azure मा लगइन गर्नुहोस्
azd auth login
az login
```

**Required Azure Resources:**
- Active Azure subscription
- Resource group creation permissions
- Container Apps environment access

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Apps सँग आधारभूत REST API तैनाथ गर्नुहोस्।

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
# टेम्पलेटबाट आरम्भ गर्नुहोस्
azd init --template todo-python-mongo

# पूर्वाधार उपलब्ध गराएर तैनाथ गर्नुहोस्
azd up

# तैनाती परीक्षण गर्नुहोस्
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Key Features:**
- 0 देखि 10 प्रतिलिपिसम्म स्वत: स्केलिङ
- स्वास्थ्य जाँच र लाइभनेस चेकहरू
- वातावरण चर इन्जेक्शन
- Application Insights एकीकरण

### 2. Node.js Express API

MongoDB एकीकरण सहित Node.js ब्याकएण्ड तैनाथ गर्नुहोस्।

```bash
# Node.js API टेम्पलेट प्रारम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo

# पर्यावरण चरहरू कन्फिगर गर्नुहोस्
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# तैनाथ गर्नुहोस्
azd up

# Azure Monitor मार्फत लगहरू हेर्नुहोस्
azd monitor --logs
```

**Infrastructure Highlights:**
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

React फ्रन्टएन्ड र API ब्याकएन्ड सहित पूर्ण-स्ट्याक अनुप्रयोग तैनाथ गर्नुहोस्।

```bash
# फुल-स्ट्याक टेम्पलेट आरम्भ गर्नुहोस्
azd init --template todo-csharp-sql-swa-func

# कन्फिगरेसन समीक्षा गर्नुहोस्
cat azure.yaml

# दुवै सेवाहरू परिनियोजित गर्नुहोस्
azd up

# अनुप्रयोग खोल्नुहोस्
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**Scenario**: बहु माइक्रोसर्भिस भएको ई-कमर्स अनुप्रयोग

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

# परिनियोजनको निगरानी गर्नुहोस्
azd monitor --overview
```

### Example 2: AI-Powered Container App

**Scenario**: Azure OpenAI एकीकरणसहित AI च्याट अनुप्रयोग

**फाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित पहुँचका लागि प्रबन्धित पहिचान प्रयोग गर्नुहोस्
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # की भण्डारबाट OpenAI कुञ्जी प्राप्त गर्नुहोस्
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

**तैनाती आदेशहरू:**
```bash
# पर्यावरण सेट अप गर्नुहोस्
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

### Example 3: Background Worker with Queue Processing

**Scenario**: सन्देश कतार सहित अर्डर प्रोसेसिङ प्रणाली

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
            # अर्डर प्रक्रिया
            print(f"Processing order: {message.content}")
            
            # पूर्ण सन्देश
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

**Deployment:**
```bash
# आरम्भ गर्नुहोस्
azd init

# कतार विन्याससहित तैनाथ गर्नुहोस्
azd up

# कतारको लम्बाइअनुसार कार्यकर्ताको सङ्ख्या समायोजन गर्नुहोस्
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### ढाँचा 1: ब्लु-ग्रीन तैनाती

```bash
# ट्राफिक बिना नयाँ रिभिजन सिर्जना गर्नुहोस्
azd deploy api --revision-suffix blue --no-traffic

# नयाँ रिभिजन परीक्षण गर्नुहोस्
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्राफिक विभाजन गर्नुहोस् (20% नीलोमा, 80% वर्तमानमा)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूर्ण रूपमा नीलोमा सर्नुहोस्
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### ढाँचा 2: AZD सँग केनरी तैनाती

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

**तैनाती स्क्रिप्ट:**
```bash
#!/bin/bash
# deploy-canary.sh

# नयाँ रिभिजन 10% ट्राफिकका साथ तैनाथ गर्नुहोस्
azd deploy api --revision-mode multiple

# मेट्रिकहरू अनुगमन गर्नुहोस्
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

### ढाँचा 3: बहु-क्षेत्र तैनाती

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

**तैनाती:**
```bash
# सबै क्षेत्रहरूमा तैनाथ गर्नुहोस्
azd up

# एन्डपोइन्टहरू जाँच गर्नुहोस्
azd show --output json | jq '.services.api.endpoints'
```

### ढाँचा 4: Dapr एकीकरण

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

**Dapr सहित अनुप्रयोग कोड:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # स्थिति सुरक्षित गर्नुहोस्
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

## Best Practices

### 1. Resource Organization

```bash
# सुसंगत नामकरण नियमहरू प्रयोग गर्नुहोस्
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# लागत ट्र्याकिङका लागि स्रोतहरूलाई ट्याग गर्नुहोस्
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
# Application Insights सक्षम गर्नुहोस्
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# वास्तविक समयमा लगहरू हेर्नुहोस्
azd monitor --logs
# वा Container Apps का लागि Azure CLI प्रयोग गर्नुहोस्:
az containerapp logs show --name api --resource-group rg-myapp --follow

# मेट्रिक्स अनुगमन गर्नुहोस्
azd monitor --live

# अलर्टहरू सिर्जना गर्नुहोस्
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# प्रयोगमा नहुँदा शून्यसम्म स्केल गर्नुहोस्
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# विकास वातावरणहरूका लागि स्पट इन्स्टेन्सहरू प्रयोग गर्नुहोस्
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजेट अलर्टहरू सेट गर्नुहोस्
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
# नयाँ कन्टेनर एप परियोजना आरम्भ गर्नुहोस्
azd init --template <template-name>

# पूर्वाधार र अनुप्रयोग तैनाथ गर्नुहोस्
azd up

# केवल अनुप्रयोग कोड मात्र तैनाथ गर्नुहोस् (पूर्वाधार छोड्नुहोस्)
azd deploy

# केवल पूर्वाधार मात्र तयार गर्नुहोस्
azd provision

# तैनाथ गरिएका स्रोतहरू हेर्नुहोस्
azd show

# azd monitor वा Azure CLI प्रयोग गरी लगहरू स्ट्रिम गर्नुहोस्
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# अनुप्रयोग अनुगमन गर्नुहोस्
azd monitor --overview

# स्रोतहरू हटाउनुहोस्
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Azure CLI प्रयोग गरेर लगहरू जाँच गर्नुहोस्
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

### Issue: Can't access container app endpoint

```bash
# ingress कन्फिगरेसन सत्यापित गर्नुहोस्
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# जाँच गर्नुहोस् कि आन्तरिक ingress सक्षम छ कि छैन
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# स्रोतहरूको उपयोग जाँच गर्नुहोस्
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

## Additional Resources and Examples
- [माइक्रोसर्भिस उदाहरण](./microservices/README.md)
- [साधारण Flask API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps दस्तावेजीकरण](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्प्लेट्स ग्यालेरी](https://azure.github.io/awesome-azd/)
- [Container Apps नमूनाहरू](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्प्लेटहरू](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

नयाँ कन्टेनर एप उदाहरणहरू योगदान गर्न:

1. तपाईंको उदाहरण सहित नयाँ सबडाइरेक्टरी सिर्जना गर्नुहोस्
2. पूर्ण `azure.yaml`, `infra/`, र `src/` फाइलहरू समावेश गर्नुहोस्
3. तैनाती निर्देशनहरू सहित विस्तृत README थप्नुहोस्
4. `azd up` प्रयोग गरेर तैनाती परीक्षण गर्नुहोस्
5. पुल अनुरोध प्रस्तुत गर्नुहोस्

---

**सहयोग चाहिन्छ?** समर्थन र प्रश्नहरूको लागि [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदायमा सामेल हुनुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकता कायम राख्न प्रयास गर्छौँ भने पनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असत्यता हुन सक्छ। मूल दस्तावेजलाई यसको मूल भाषामा नै आधिकारिक स्रोतको रूपमा मान्नुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
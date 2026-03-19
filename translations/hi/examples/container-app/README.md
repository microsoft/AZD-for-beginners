# AZD के साथ कंटेनर ऐप तैनाती उदाहरण

यह निर्देशिका Azure Developer CLI (AZD) का उपयोग कर Azure Container Apps में कंटेनरयुक्त अनुप्रयोगों को तैनात करने के लिए व्यापक उदाहरणों को समाहित करती है। ये उदाहरण वास्तविक दुनिया के पैटर्न, सर्वोत्तम प्रथाएँ, और प्रोडक्शन-रेडी कॉन्फ़िगरेशन प्रदर्शित करते हैं।

## 📚 विषय सूची

- [अवलोकन](#overview)
- [आवश्यकताएँ](#prerequisites)
- [त्वरित प्रारंभ उदाहरण](#quick-start-examples)
- [उत्पादन उदाहरण](#production-examples)
- [उन्नत पैटर्न](#advanced-patterns)
- [सर्वोत्तम प्रथाएँ](#best-practices)

## Overview

Azure Container Apps एक पूर्ण रूप से प्रबंधित सर्वरलेस कंटेनर प्लेटफ़ॉर्म है जो आपको माइक्रोसर्विसेज़ और कंटेनरयुक्त अनुप्रयोगों को अवसंरचना प्रबंधित किए बिना चलाने में सक्षम बनाता है। AZD के साथ संयोजन में, आपको मिलता है:

- **सरल तैनाती**: एक कमांड में कंटेनरों को अवसंरचना के साथ तैनात किया जाता है
- **स्वचालित स्केलिंग**: HTTP ट्रैफ़िक या इवेंट्स के आधार पर शून्य तक स्केल और आउट स्केल
- **एकीकृत नेटवर्किंग**: अंतर्निहित सर्विस डिस्कवरी और ट्रैफ़िक स्प्लिटिंग
- **मैनेज्ड आइडेंटिटी**: Azure संसाधनों के लिए सुरक्षित प्रमाणीकरण
- **लागत अनुकूलन**: आप केवल उन संसाधनों के लिए भुगतान करते हैं जो आप उपयोग करते हैं

## Prerequisites

शुरू करने से पहले, सुनिश्चित करें कि आपके पास है:

```bash
# AZD इंस्टॉलेशन की जाँच करें
azd version

# Azure CLI की जाँच करें
az version

# Docker की जाँच करें (कस्टम इमेज बनाने के लिए)
docker --version

# Azure में लॉगिन करें
azd auth login
az login
```

**आवश्यक Azure संसाधन:**
- सक्रिय Azure सदस्यता
- रिसोर्स ग्रुप बनाने के अनुमतियाँ
- Container Apps environment एक्सेस

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Azure Container Apps के साथ एक बुनियादी REST API तैनात करें।

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

**तैनाती चरण:**

```bash
# टेम्पलेट से प्रारंभ करें
azd init --template todo-python-mongo

# बुनियादी ढांचे को प्रावधान करें और तैनात करें
azd up

# तैनाती का परीक्षण करें
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य विशेषताएँ:**
- 0 से 10 रेप्लिका तक ऑटो-स्केलिंग
- स्वास्थ्य जांच और लिवनेस चेक
- वातावरण चर इंजेक्शन
- Application Insights एकीकरण

### 2. Node.js Express API

MongoDB एकीकरण के साथ एक Node.js बैकएंड तैनात करें।

```bash
# Node.js API टेम्पलेट प्रारंभ करें
azd init --template todo-nodejs-mongo

# पर्यावरण चर कॉन्फ़िगर करें
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# परिनियोजित करें
azd up

# Azure Monitor के माध्यम से लॉग देखें
azd monitor --logs
```

**इन्फ्रास्ट्रक्चर हाइलाइट्स:**
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

React फ्रंटएंड और API बैकएंड के साथ एक फुल-स्टैक एप्लिकेशन तैनात करें।

```bash
# फुल-स्टैक टेम्पलेट प्रारंभ करें
azd init --template todo-csharp-sql-swa-func

# कॉन्फ़िगरेशन की समीक्षा करें
cat azure.yaml

# दोनों सेवाओं को तैनात करें
azd up

# एप्लिकेशन खोलें
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Example 1: Microservices Architecture

**परिदृश्य**: कई माइक्रोसर्विसेज़ वाले ई-कॉमर्स एप्लिकेशन

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

**azure.yaml कॉन्फ़िगरेशन:**
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

**तैनाती:**
```bash
# परियोजना आरंभ करें
azd init

# उत्पादन वातावरण सेट करें
azd env new production

# उत्पादन सेटिंग्स कॉन्फ़िगर करें
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# सभी सेवाएँ तैनात करें
azd up

# तैनाती की निगरानी करें
azd monitor --overview
```

### Example 2: AI-Powered Container App

**परिदृश्य**: Microsoft Foundry Models एकीकरण के साथ AI चैट एप्लिकेशन

**फ़ाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित पहुँच के लिए Managed Identity का उपयोग करें
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault से OpenAI कुंजी प्राप्त करें
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

**फ़ाइल: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**फ़ाइल: infra/main.bicep**
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

**तैनाती कमांड्स:**
```bash
# पर्यावरण सेट करें
azd init --template ai-chat-app
azd env new dev

# OpenAI को कॉन्फ़िगर करें
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# तैनात करें
azd up

# API का परीक्षण करें
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

**परिदृश्य**: मैसेज कतार के साथ ऑर्डर प्रोसेसिंग सिस्टम

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

**फ़ाइल: src/worker/processor.py**
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
            # ऑर्डर संसाधित करें
            print(f"Processing order: {message.content}")
            
            # संदेश पूरा करें
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**फ़ाइल: azure.yaml**
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

**तैनाती:**
```bash
# प्रारंभ करें
azd init

# कतार विन्यास के साथ तैनात करें
azd up

# कतार की लंबाई के आधार पर वर्कर को स्केल करें
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Pattern 1: Blue-Green Deployment

```bash
# ट्रैफ़िक के बिना नया संशोधन बनाएं
azd deploy api --revision-suffix blue --no-traffic

# नए संशोधन का परीक्षण करें
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्रैफ़िक विभाजित करें (20% ब्लू को, 80% वर्तमान को)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# संपूर्ण ट्रैफ़िक को ब्लू पर स्थानांतरित करें
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

**फ़ाइल: .azure/dev/config.json**
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

# नई रिवीजन को 10% ट्रैफ़िक के साथ तैनात करें
azd deploy api --revision-mode multiple

# मेट्रिक्स की निगरानी करें
azd monitor --service api --duration 5m

# ट्रैफ़िक धीरे-धीरे बढ़ाएं
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 मिनट प्रतीक्षा करें
done
```

### Pattern 3: Multi-Region Deployment

**फ़ाइल: azure.yaml**
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

**फ़ाइल: infra/multi-region.bicep**
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
# सभी क्षेत्रों में तैनात करें
azd up

# एंडपॉइंट्स सत्यापित करें
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

**फ़ाइल: infra/app/dapr-enabled.bicep**
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

**Dapr के साथ एप्लिकेशन कोड:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # स्थिति सहेजें
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # इवेंट प्रकाशित करें
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
# सुसंगत नामकरण नियमों का उपयोग करें
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# लागत ट्रैकिंग के लिए संसाधनों को टैग करें
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
# Application Insights सक्षम करें
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# लॉग्स को वास्तविक समय में देखें
azd monitor --logs
# या Container Apps के लिए Azure CLI का उपयोग करें:
az containerapp logs show --name api --resource-group rg-myapp --follow

# मेट्रिक्स की निगरानी करें
azd monitor --live

# अलर्ट बनाएं
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# उपयोग में न होने पर शून्य तक स्केल करें
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# डेव वातावरणों के लिए स्पॉट इंस्टेंस का उपयोग करें
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजट अलर्ट सेट करें
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
# नया कंटेनर ऐप प्रोजेक्ट आरंभ करें
azd init --template <template-name>

# बुनियादी ढाँचा और एप्लिकेशन तैनात करें
azd up

# केवल एप्लिकेशन कोड तैनात करें (इन्फ्रास्ट्रक्चर छोड़ें)
azd deploy

# केवल बुनियादी ढाँचा प्रोविजन करें
azd provision

# तैनात किए गए संसाधन देखें
azd show

# azd monitor या Azure CLI का उपयोग करके लॉग स्ट्रीम करें
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# एप्लिकेशन की निगरानी करें
azd monitor --overview

# संसाधनों की सफाई करें
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# Azure CLI का उपयोग करके लॉग जांचें
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# कंटेनर घटनाएँ देखें
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानीय रूप से परीक्षण करें
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# इंग्रेस कॉन्फ़िगरेशन सत्यापित करें
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# जांचें कि आंतरिक इंग्रेस सक्षम है या नहीं
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# संसाधन उपयोग की जाँच करें
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# संसाधनों को बढ़ाएँ
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [माइक्रोसर्विसेज़ उदाहरण](./microservices/README.md)
- [सरल Flask API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps दस्तावेज़](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)
- [Container Apps नमूने](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्पलेट्स](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

नए कंटेनर ऐप उदाहरण जोड़ने के लिए:

1. अपने उदाहरण के साथ एक नया उप-निर्देशिका बनाएं
2. पूर्ण `azure.yaml`, `infra/`, और `src/` फ़ाइलें शामिल करें
3. तैनाती निर्देशों के साथ व्यापक README जोड़ें
4. `azd up` के साथ तैनाती का परीक्षण करें
5. एक पुल अनुरोध सबमिट करें

---

**मदद चाहिए?** समर्थन और प्रश्नों के लिए [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदाय में शामिल हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हालांकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की अनुशंसा की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
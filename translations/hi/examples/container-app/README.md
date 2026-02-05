# AZD के साथ कंटेनर ऐप डिप्लॉयमेंट के उदाहरण

यह डायरेक्टरी Azure Developer CLI (AZD) का उपयोग करके Azure Container Apps पर कंटेनराइज्ड एप्लिकेशन डिप्लॉय करने के लिए व्यापक उदाहरण प्रदान करती है। ये उदाहरण वास्तविक दुनिया के पैटर्न, सर्वोत्तम प्रथाओं और प्रोडक्शन-रेडी कॉन्फ़िगरेशन को दर्शाते हैं।

## 📚 सामग्री तालिका

- [परिचय](../../../../examples/container-app)
- [पूर्वापेक्षाएँ](../../../../examples/container-app)
- [त्वरित प्रारंभ उदाहरण](../../../../examples/container-app)
- [प्रोडक्शन उदाहरण](../../../../examples/container-app)
- [उन्नत पैटर्न](../../../../examples/container-app)
- [सर्वोत्तम प्रथाएँ](../../../../examples/container-app)

## परिचय

Azure Container Apps एक पूर्णतः प्रबंधित सर्वरलेस कंटेनर प्लेटफ़ॉर्म है जो आपको माइक्रोसर्विस और कंटेनराइज्ड एप्लिकेशन को बिना इंफ्रास्ट्रक्चर प्रबंधन के चलाने की सुविधा देता है। AZD के साथ इसे जोड़ने पर आपको मिलता है:

- **सरल डिप्लॉयमेंट**: एक ही कमांड से कंटेनर और इंफ्रास्ट्रक्चर डिप्लॉय करें
- **स्वचालित स्केलिंग**: HTTP ट्रैफिक या इवेंट्स के आधार पर स्केल टू ज़ीरो और स्केल आउट
- **इंटीग्रेटेड नेटवर्किंग**: बिल्ट-इन सर्विस डिस्कवरी और ट्रैफिक स्प्लिटिंग
- **मैनेज्ड आइडेंटिटी**: Azure संसाधनों के लिए सुरक्षित प्रमाणीकरण
- **लागत अनुकूलन**: केवल उपयोग किए गए संसाधनों के लिए भुगतान करें

## पूर्वापेक्षाएँ

शुरू करने से पहले, सुनिश्चित करें कि आपके पास निम्नलिखित हैं:

```bash
# AZD स्थापना की जांच करें
azd version

# Azure CLI की जांच करें
az version

# Docker की जांच करें (कस्टम इमेज बनाने के लिए)
docker --version

# Azure में लॉगिन करें
azd auth login
az login
```

**आवश्यक Azure संसाधन:**
- सक्रिय Azure सब्सक्रिप्शन
- रिसोर्स ग्रुप बनाने की अनुमति
- Container Apps पर्यावरण तक पहुंच

## त्वरित प्रारंभ उदाहरण

### 1. सरल वेब API (Python Flask)

Azure Container Apps के साथ एक बेसिक REST API डिप्लॉय करें।

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

**डिप्लॉयमेंट चरण:**

```bash
# टेम्पलेट से प्रारंभ करें
azd init --template todo-python-mongo

# बुनियादी ढांचे का प्रावधान करें और तैनात करें
azd up

# तैनाती का परीक्षण करें
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य विशेषताएँ:**
- 0 से 10 प्रतिकृतियों तक ऑटो-स्केलिंग
- हेल्थ प्रॉब्स और लाइवनेस चेक्स
- पर्यावरण वेरिएबल इंजेक्शन
- एप्लिकेशन इनसाइट्स इंटीग्रेशन

### 2. Node.js Express API

MongoDB इंटीग्रेशन के साथ एक Node.js बैकएंड डिप्लॉय करें।

```bash
# Node.js API टेम्पलेट प्रारंभ करें
azd init --template todo-nodejs-mongo

# पर्यावरण वेरिएबल्स को कॉन्फ़िगर करें
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# परिनियोजित करें
azd up

# लॉग्स देखें
azd logs api
```

**इंफ्रास्ट्रक्चर हाइलाइट्स:**
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

### 3. स्टैटिक फ्रंटएंड + API बैकएंड

React फ्रंटएंड और API बैकएंड के साथ एक फुल-स्टैक एप्लिकेशन डिप्लॉय करें।

```bash
# पूर्ण-स्टैक टेम्पलेट प्रारंभ करें
azd init --template todo-csharp-sql-swa-func

# कॉन्फ़िगरेशन की समीक्षा करें
cat azure.yaml

# दोनों सेवाओं को तैनात करें
azd up

# एप्लिकेशन खोलें
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## प्रोडक्शन उदाहरण

### उदाहरण 1: माइक्रोसर्विस आर्किटेक्चर

**परिदृश्य**: कई माइक्रोसर्विस के साथ एक ई-कॉमर्स एप्लिकेशन

**डायरेक्टरी संरचना:**
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

**डिप्लॉयमेंट:**
```bash
# परियोजना प्रारंभ करें
azd init

# उत्पादन वातावरण सेट करें
azd env new production

# उत्पादन सेटिंग्स कॉन्फ़िगर करें
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# सभी सेवाओं को तैनात करें
azd up

# तैनाती की निगरानी करें
azd monitor --overview
```

### उदाहरण 2: AI-संचालित कंटेनर ऐप

**परिदृश्य**: Azure OpenAI इंटीग्रेशन के साथ AI चैट एप्लिकेशन

**फ़ाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित पहुंच के लिए प्रबंधित पहचान का उपयोग करें
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # की वॉल्ट से OpenAI कुंजी प्राप्त करें
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

**डिप्लॉयमेंट कमांड्स:**
```bash
# पर्यावरण सेट करें
azd init --template ai-chat-app
azd env new dev

# OpenAI को कॉन्फ़िगर करें
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# परिनियोजित करें
azd up

# API का परीक्षण करें
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण 3: बैकग्राउंड वर्कर के साथ क्यू प्रोसेसिंग

**परिदृश्य**: मैसेज क्यू के साथ ऑर्डर प्रोसेसिंग सिस्टम

**डायरेक्टरी संरचना:**
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
            # आदेश प्रक्रिया
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

**डिप्लॉयमेंट:**
```bash
# प्रारंभ करें
azd init

# कतार विन्यास के साथ तैनात करें
azd up

# कतार की लंबाई के आधार पर कार्यकर्ता को स्केल करें
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## उन्नत पैटर्न

### पैटर्न 1: ब्लू-ग्रीन डिप्लॉयमेंट

```bash
# बिना ट्रैफिक के नया संशोधन बनाएं
azd deploy api --revision-suffix blue --no-traffic

# नए संशोधन का परीक्षण करें
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्रैफिक विभाजित करें (20% ब्लू पर, 80% वर्तमान पर)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूरी तरह से ब्लू पर स्विच करें
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### पैटर्न 2: AZD के साथ कैनरी डिप्लॉयमेंट

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

**डिप्लॉयमेंट स्क्रिप्ट:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10% ट्रैफिक के साथ नया संशोधन तैनात करें
azd deploy api --revision-mode multiple

# मेट्रिक्स की निगरानी करें
azd monitor --service api --duration 5m

# ट्रैफिक को धीरे-धीरे बढ़ाएं
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 मिनट प्रतीक्षा करें
done
```

### पैटर्न 3: मल्टी-रीजन डिप्लॉयमेंट

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

**डिप्लॉयमेंट:**
```bash
# सभी क्षेत्रों में तैनात करें
azd up

# एंडपॉइंट्स की पुष्टि करें
azd show --output json | jq '.services.api.endpoints'
```

### पैटर्न 4: Dapr इंटीग्रेशन

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
        
        # घटना प्रकाशित करें
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## सर्वोत्तम प्रथाएँ

### 1. संसाधन संगठन

```bash
# सुसंगत नामकरण सम्मेलनों का उपयोग करें
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# लागत ट्रैकिंग के लिए संसाधनों को टैग करें
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. सुरक्षा सर्वोत्तम प्रथाएँ

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

### 3. प्रदर्शन अनुकूलन

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

### 4. मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

```bash
# एप्लिकेशन इनसाइट्स सक्षम करें
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# वास्तविक समय में लॉग्स देखें
azd logs api --follow

# मेट्रिक्स की निगरानी करें
azd monitor --service api

# अलर्ट बनाएं
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. लागत अनुकूलन

```bash
# उपयोग में न होने पर शून्य पर स्केल करें
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# डेव पर्यावरण के लिए स्पॉट इंस्टेंस का उपयोग करें
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजट अलर्ट सेट करें
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD इंटीग्रेशन

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

## सामान्य कमांड संदर्भ

```bash
# नया कंटेनर ऐप प्रोजेक्ट प्रारंभ करें
azd init --template <template-name>

# बुनियादी ढांचे और एप्लिकेशन को तैनात करें
azd up

# केवल एप्लिकेशन कोड तैनात करें (बुनियादी ढांचे को छोड़ें)
azd deploy

# केवल बुनियादी ढांचे का प्रावधान करें
azd provision

# तैनात संसाधनों को देखें
azd show

# लॉग स्ट्रीम करें
azd logs <service-name> --follow

# एप्लिकेशन की निगरानी करें
azd monitor --overview

# संसाधनों को साफ करें
azd down --force --purge
```

## समस्या निवारण

### समस्या: कंटेनर शुरू नहीं हो रहा

```bash
# लॉग्स जांचें
azd logs api --tail 100

# कंटेनर घटनाओं को देखें
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानीय रूप से परीक्षण करें
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### समस्या: कंटेनर ऐप एंडपॉइंट तक पहुंच नहीं हो रही

```bash
# इनग्रेस कॉन्फ़िगरेशन सत्यापित करें
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# जांचें कि आंतरिक इनग्रेस सक्षम है
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### समस्या: प्रदर्शन समस्याएँ

```bash
# संसाधन उपयोग की जांच करें
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# संसाधनों को बढ़ाएं
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## अतिरिक्त संसाधन और उदाहरण
- [माइक्रोसर्विस उदाहरण](./microservices/README.md)
- [सरल Flask API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps प्रलेखन](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)
- [कंटेनर ऐप्स नमूने](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्पलेट्स](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## योगदान

नए कंटेनर ऐप उदाहरण जोड़ने के लिए:

1. अपने उदाहरण के साथ एक नई सबडायरेक्टरी बनाएं
2. पूर्ण `azure.yaml`, `infra/`, और `src/` फ़ाइलें शामिल करें
3. डिप्लॉयमेंट निर्देशों के साथ व्यापक README जोड़ें
4. `azd up` के साथ डिप्लॉयमेंट का परीक्षण करें
5. एक पुल अनुरोध सबमिट करें

---

**मदद चाहिए?** समर्थन और प्रश्नों के लिए [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदाय से जुड़ें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
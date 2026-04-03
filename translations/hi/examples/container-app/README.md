# AZD के साथ कंटेनर ऐप तैनाती उदाहरण

यह निर्देशिका Azure Developer CLI (AZD) का उपयोग करके Azure कंटेनर ऐप्स में कंटेनरीकृत एप्लिकेशन तैनात करने के लिए व्यापक उदाहरणों को शामिल करती है। ये उदाहरण वास्तविक विश्व के पैटर्न, सर्वोत्तम प्रथाओं, और उत्पादन-तैयार कॉन्फ़िगरेशन को दर्शाते हैं।

## 📚 सामग्री की तालिका

- [अवलोकन](#अवलोकन)
- [पूर्वापेक्षाएँ](#पूर्वापेक्षाएँ)
- [त्वरित प्रारंभ उदाहरण](#त्वरित-प्रारंभ-उदाहरण)
- [उत्पादन उदाहरण](#उत्पादन-उदाहरण)
- [उन्नत पैटर्न](#उन्नत-पैटर्न)
- [सर्वोत्तम प्रथाएँ](#सर्वोत्तम-प्रथाएँ)

## अवलोकन

Azure कंटेनर ऐप्स एक पूरी तरह प्रबंधित सर्वरलेस कंटेनर प्लेटफ़ॉर्म है जो आपको इन्फ्रास्ट्रक्चर का प्रबंधन किए बिना माइक्रोसर्विसेज और कंटेनरीकृत एप्लिकेशन चलाने में सक्षम बनाता है। AZD के साथ मिलकर, आपको मिलता है:

- **सरलीकृत तैनाती**: एकल कमांड से कंटेनर इन्फ्रास्ट्रक्चर के साथ तैनात होते हैं
- **स्वचालित स्केलिंग**: HTTP ट्रैफ़िक या घटनाओं के आधार पर ज़ीरो तक स्केल आउट और स्केल इन करें
- **इंटीग्रेटेड नेटवर्किंग**: बिल्ट-इन सेवा खोज और ट्रैफ़िक विभाजन
- **मैनेज्ड आइडेंटिटी**: Azure संसाधनों के लिए सुरक्षित प्रमाणीकरण
- **लागत अनुकूलन**: केवल उन संसाधनों के लिए भुगतान करें जिन्हें आप उपयोग करते हैं

## पूर्वापेक्षाएँ

शुरू करने से पहले, सुनिश्चित करें कि आपके पास है:

```bash
# AZD स्थापना जांचें
azd version

# Azure CLI जांचें
az version

# Docker जांचें (कस्टम इमेज बनाने के लिए)
docker --version

# AZD डिप्लॉयमेंट के लिए प्रमाणित करें
azd auth login

# वैकल्पिक: यदि आप सीधे az कमांड चलाने की योजना बनाते हैं तो Azure CLI में साइन इन करें
az login
```

**आवश्यक Azure संसाधन:**
- सक्रिय Azure सदस्यता
- संसाधन समूह निर्माण अनुमतियाँ
- कंटेनर ऐप्स पर्यावरण पहुंच

## त्वरित प्रारंभ उदाहरण

### 1. सिंपल वेब API (Python Flask)

Azure कंटेनर ऐप्स के साथ एक बुनियादी REST API तैनात करें।

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

# अवसंरचना प्रदान करें और तैनात करें
azd up

# तैनाती का परीक्षण करें
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य विशेषताएं:**
- 0 से 10 प्रतियों तक स्वचालित स्केलिंग
- स्वास्थ्य जांच और जीवंतता परीक्षण
- पर्यावरण चर इंजेक्शन
- एप्लिकेशन इनसाइट्स एकीकरण

### 2. Node.js एक्सप्रेस API

MongoDB एकीकरण के साथ Node.js बैकएंड तैनात करें।

```bash
# Node.js API टेम्पलेट प्रारंभ करें
azd init --template todo-nodejs-mongo

# वातावरण चर सेट करें
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# तैनात करें
azd up

# Azure मॉनिटर के माध्यम से लॉग देखें
azd monitor --logs
```

**इन्फ्रास्ट्रक्चर विशेषताएं:**
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

### 3. स्थिर फ्रंटेंड + API बैकएंड

React फ्रंटेंड और API बैकएंड के साथ एक पूर्ण-स्टैक एप्लिकेशन तैनात करें।

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

## उत्पादन उदाहरण

### उदाहरण 1: माइक्रोसर्विसेज आर्किटेक्चर

**परिदृश्य**: कई माइक्रोसर्विसेज के साथ ई-कॉमर्स एप्लिकेशन

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

**तैनाती:**
```bash
# परियोजना प्रारंभ करें
azd init

# उत्पादन पर्यावरण सेट करें
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

### उदाहरण 2: AI-पावर्ड कंटेनर ऐप

**परिदृश्य**: Microsoft Foundry Models एकीकरण के साथ AI चैट एप्लिकेशन

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

**तैनाती कमांड:**
```bash
# परिवेश सेट करें
azd init --template ai-chat-app
azd env new dev

# OpenAI को कॉन्फ़िगर करें
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# परिनियोजित करें
azd up

# API का परीक्षण करें
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण 3: पृष्ठभूमि कार्यकर्ता के साथ कतार प्रसंस्करण

**परिदृश्य**: संदेश कतार के साथ आदेश प्रसंस्करण प्रणाली

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
            # आदेश संसाधित करें
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
# आरंभ करें
azd init

# कतार विन्यास के साथ तैनात करें
azd up

# कतार की लंबाई के आधार पर कार्यकर्ता का स्केल करें
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## उन्नत पैटर्न

### पैटर्न 1: ब्लू-ग्रीन तैनाती

```bash
# बिना ट्रैफ़िक के नया संशोधन बनाएँ
azd deploy api --revision-suffix blue --no-traffic

# नए संशोधन का परीक्षण करें
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्रैफ़िक विभाजित करें (20% ब्लू को, 80% वर्तमान को)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूर्ण कटओवर ब्लू को करें
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### पैटर्न 2: AZD के साथ कैनरी तैनाती

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

# 10% ट्रैफ़िक के साथ नई संशोधन तैनात करें
azd deploy api --revision-mode multiple

# मेट्रिक्स निगरानी करें
azd monitor --service api --duration 5m

# ट्रैफ़िक को धीरे-धीरे बढ़ाएं
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 मिनट प्रतीक्षा करें
done
```

### पैटर्न 3: मल्टी-रीजन तैनाती

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

### पैटर्न 4: Dapr एकीकरण

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
# संगत नामकरण संहिताएँ उपयोग करें
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

### 4. निगरानी और अवलोकन

```bash
# एप्लिकेशन इनसाइट्स सक्षम करें
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# वास्तविक समय में लॉग देखें
azd monitor --logs
# या कंटेनर ऐप्स के लिए Azure CLI का उपयोग करें:
az containerapp logs show --name api --resource-group rg-myapp --follow

# मेट्रिक्स निगरानी करें
azd monitor --live

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
# उपयोग में न होने पर शून्य तक स्केल करें
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# विकास वातावरण के लिए स्पॉट इंस्टेंसेस का उपयोग करें
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजट अलर्ट सेट करें
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD एकीकरण

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
# नया कंटेनर ऐप परियोजना प्रारंभ करें
azd init --template <template-name>

# इंफ़्रास्ट्रक्चर और एप्लिकेशन तैनात करें
azd up

# केवल एप्लिकेशन कोड तैनात करें (इंफ्रास्ट्रक्चर छोड़ें)
azd deploy

# केवल इंफ़्रास्ट्रक्चर प्रदान करें
azd provision

# तैनात संसाधनों को देखें
azd show

# azd मॉनिटर या Azure CLI का उपयोग करके लॉग स्ट्रीम करें
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# एप्लिकेशन की निगरानी करें
azd monitor --overview

# संसाधनों की सफाई करें
azd down --force --purge
```

## समस्या निवारण

### समस्या: कंटेनर शुरू नहीं हो रहा है

```bash
# Azure CLI का उपयोग करके लॉग जांचें
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# कंटेनर घटनाएं देखें
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

# जांचें कि आंतरिक इनग्रेस सक्षम है या नहीं
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### समस्या: प्रदर्शन समस्याएँ

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

## अतिरिक्त संसाधन और उदाहरण
- [माइक्रोसर्विसेज उदाहरण](./microservices/README.md)
- [सिंपल फ्लास्क API उदाहरण](./simple-flask-api/README.md)
- [Azure कंटेनर ऐप्स दस्तावेज़](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्प्लेट गैलरी](https://azure.github.io/awesome-azd/)
- [कंटेनर ऐप्स सैंपल्स](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्प्लेट्स](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## योगदान

नए कंटेनर ऐप उदाहरणों में योगदान करने के लिए:

1. अपने उदाहरण के साथ एक नया उपनिर्देशिका बनाएं
2. पूर्ण `azure.yaml`, `infra/`, और `src/` फ़ाइलें शामिल करें
3. तैनाती निर्देशों के साथ समग्र README जोड़ें
4. `azd up` के साथ तैनाती का परीक्षण करें
5. पुल अनुरोध सबमिट करें

---

**मदद चाहिए?** समर्थन और प्रश्नों के लिए [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदाय में शामिल हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्राधिकारी स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मनुष्यों द्वारा अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
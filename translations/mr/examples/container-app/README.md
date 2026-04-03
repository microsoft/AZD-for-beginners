# Container App तैनातीची उदाहरणे AZD सह

हे निर्देशिका Azure Developer CLI (AZD) वापरून Azure Container Apps मध्ये कंटेनरयुक्त अनुप्रयोग तैनात करण्यासाठी सर्वसमावेशक उदाहरणे समाविष्ट करते. ही उदाहरणे व्यवहारातील पॅटर्न, सर्वोत्तम पद्धती आणि उत्पादन-तयार कॉन्फिगरेशन दाखवतात.

## 📚 सामग्री सूची

- [आढावा](#आढावा)
- [पूर्वअट](#पूर्वअट)
- [त्वरित प्रारंभ उदाहरणे](#त्वरित-प्रारंभ-उदाहरणे)
- [प्रॉडक्शन उदाहरणे](#प्रॉडक्शन-उदाहरणे)
- [प्रगत पॅटर्न](#प्रगत-पॅटर्न)
- [सर्वोत्तम पद्धती](#सर्वोत्तम-पद्धती)

## आढावा

Azure Container Apps हा पूर्णपणे व्यवस्थापित सर्व्हरलेस कंटेनर प्लॅटफॉर्म आहे जो तुम्हाला इन्फ्रास्ट्रक्चर न हाताळता मायक्रोसर्व्हिसेस आणि कंटेनरयुक्त अनुप्रयोग चालवण्यास सक्षम करतो. AZD सह एकत्र केल्यावर, तुम्हाला मिळते:

- **सुलभ तैनाती**: एकच कमांड कंटेनर आणि इन्फ्रास्ट्रक्चरसह तैनात करते
- **स्वयंचलित स्केलिंग**: HTTP ट्रॅफिक किंवा इव्हेंट्सवर आधारित शून्यावर स्केल आणि बाहेर स्केल
- **एकात्मिक नेटवर्किंग**: बिल्ट-इन सेवा शोध आणि ट्रॅफिक स्प्लिटिंग
- **मॅनेज्ड आयडेंटिटी**: Azure संसाधनांसाठी सुरक्षित प्रमाणिकरण
- **खर्च अनुकूलन**: तुम्ही वापरत असलेल्या संसाधनांसाठीच पैसे द्या

## पूर्वअट

सुरू करण्यापूर्वी, याची खात्री करा की आपल्याकडे आहे:

```bash
# AZD स्थापना तपासा
azd version

# Azure CLI तपासा
az version

# Docker तपासा (सानुकूल इमेजेस तयार करण्यासाठी)
docker --version

# AZD तैनातींसाठी प्रमाणीकरण करा
azd auth login

# ऐच्छिक: जर आपण az कमांड्स थेट चालवणार असाल तर Azure CLI मध्ये साइन इन करा
az login
```

**Required Azure Resources:**
- सक्रिय Azure सदस्यता
- Resource group तयार करण्याच्या परवानग्या
- Container Apps पर्यावरण प्रवेश

## त्वरित प्रारंभ उदाहरणे

### 1. साधी वेब API (Python Flask)

Azure Container Apps वापरून एक मूलभूत REST API तैनात करा.

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
# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-python-mongo

# पायाभूत सुविधा तरतूद करा आणि तैनात करा
azd up

# तैनातीची चाचणी करा
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य वैशिष्ट्ये:**
- 0 ते 10 रेप्लिकास पर्यंत ऑटो-स्केलिंग
- आरोग्य प्रोब आणि लाइव्हनेस तपासण्या
- पर्यावरण चलांचे इंजेक्शन
- Application Insights एकीकरण

### 2. Node.js Express API

MongoDB एकीकरणासह Node.js बॅकएंड तैनात करा.

```bash
# Node.js API टेम्पलेट प्रारंभ करा
azd init --template todo-nodejs-mongo

# पर्यावरण चल कॉन्फिगर करा
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# तैनात करा
azd up

# Azure Monitor द्वारे लॉग पहा
azd monitor --logs
```

**इन्फ्रास्ट्रक्चर वैशिष्ट्ये:**
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

### 3. स्थिर फ्रंटएंड + API बॅकएंड

React फ्रंटएंड आणि API बॅकएंड असलेले फुल-स्टॅक अॅप्लिकेशन तैनात करा.

```bash
# फुल-स्टॅक टेम्पलेट प्रारंभ करा
azd init --template todo-csharp-sql-swa-func

# कॉन्फिगरेशन पुनरावलोकन करा
cat azure.yaml

# दोन्ही सेवा तैनात करा
azd up

# अॅप्लिकेशन उघडा
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## प्रॉडक्शन उदाहरणे

### उदाहरण 1: मायक्रोसर्व्हिस आर्किटेक्चर

**परिदृश्य**: अनेक मायक्रोसर्व्हिसेस असलेले ई-कॉमर्स अनुप्रयोग

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

**azure.yaml कॉन्फिगरेशन:**
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
# प्रकल्प प्रारंभ करा
azd init

# उत्पादन वातावरण सेट करा
azd env new production

# उत्पादन सेटिंग्ज कॉन्फिगर करा
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# सर्व सेवा तैनात करा
azd up

# तैनातीचे निरीक्षण करा
azd monitor --overview
```

### उदाहरण 2: AI-समर्थित कंटेनर अॅप

**परिदृश्य**: Microsoft Foundry Models एकत्रिकरण असलेले AI चॅट अनुप्रयोग

**फाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित प्रवेशासाठी Managed Identity वापरा
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Key Vault मधून OpenAI की मिळवा
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

**तैनाती आदेश:**
```bash
# पर्यावरण सेट करा
azd init --template ai-chat-app
azd env new dev

# OpenAI कॉन्फिगर करा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# डिप्लॉय करा
azd up

# API ची चाचणी करा
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण 3: बॅकग्राउंड वर्कर आणि क्व्यू प्रक्रिया

**परिदृश्य**: संदेश क्रमापत्रकासहित ऑर्डर प्रक्रिया प्रणाली

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
            # ऑर्डरची प्रक्रिया
            print(f"Processing order: {message.content}")
            
            # पूर्ण संदेश
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

**तैनाती:**
```bash
# प्रारंभ करा
azd init

# रांगेच्या कॉन्फिगरेशनसह तैनात करा
azd up

# रांगेच्या लांबीवरून वर्करचे प्रमाण समायोजित करा
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## प्रगत पॅटर्न

### पॅटर्न 1: ब्लू-ग्रीन तैनाती

```bash
# ट्रॅफिकशिवाय नवीन आवृत्ती तयार करा
azd deploy api --revision-suffix blue --no-traffic

# नवीन आवृत्तीची चाचणी करा
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्रॅफिक विभाजित करा (20% निळ्याकडे, 80% सध्याकडे)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूर्णपणे निळ्याकडे वळवा
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### पॅटर्न 2: AZD सह केनरी तैनाती

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

# 10% ट्रॅफिकसह नवीन आवृत्ती तैनात करा
azd deploy api --revision-mode multiple

# मेट्रिक्स निरीक्षण करा
azd monitor --service api --duration 5m

# हळूहळू ट्रॅफिक वाढवा
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 मिनिटे थांबा
done
```

### पॅटर्न 3: मल्टी-रीजन तैनाती

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
# सर्व प्रदेशांमध्ये तैनात करा
azd up

# एंडपॉइंट्सची पडताळणी करा
azd show --output json | jq '.services.api.endpoints'
```

### पॅटर्न 4: Dapr एकीकरण

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

**Dapr सह अॅप्लिकेशन कोड:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # स्थिती जतन करा
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # घटना प्रकाशित करा
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## सर्वोत्तम पद्धती

### 1. संसाधन संघटना

```bash
# सुसंगत नामकरण पद्धती वापरा
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# खर्च ट्रॅक करण्यासाठी संसाधनांना टॅग करा
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. सुरक्षा सर्वोत्तम पद्धती

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

### 3. कार्यक्षमता अनुकूलन

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

### 4. मॉनिटरिंग आणि ऑब्झर्व्हेबिलिटी

```bash
# Application Insights सक्षम करा
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# लॉग वास्तविक वेळेत पाहा
azd monitor --logs
# किंवा Container Apps साठी Azure CLI वापरा:
az containerapp logs show --name api --resource-group rg-myapp --follow

# मेट्रिक्सचे निरीक्षण करा
azd monitor --live

# अलर्ट तयार करा
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. खर्च अनुकूलन

```bash
# न वापरत असताना शून्यावर स्केल करा
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# डेव्हलपमेंट वातावरणांसाठी स्पॉट इन्स्टन्स वापरा
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजेट अलर्ट सेट करा
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

## सामान्य आदेश संदर्भ

```bash
# नवीन कंटेनर अॅप प्रकल्प सुरू करा
azd init --template <template-name>

# पायाभूत सुविधा आणि अनुप्रयोग तैनात करा
azd up

# फक्त अनुप्रयोग कोड तैनात करा (पायाभूत सुविधा वगळा)
azd deploy

# फक्त पायाभूत सुविधा तयार करा
azd provision

# तैनात केलेली संसाधने पहा
azd show

# azd monitor किंवा Azure CLI वापरून लॉग्स प्रवाहित करा
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# अनुप्रयोगाचे निरीक्षण करा
azd monitor --overview

# संसाधने काढून टाका
azd down --force --purge
```

## समस्या निवारण

### समस्या: कंटेनर सुरू होत नाही

```bash
# Azure CLI वापरून लॉग तपासा
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# कंटेनर इव्हेंट्स पाहा
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानिक पातळीवर चाचणी करा
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### समस्या: कंटेनर अॅप एंडपॉइंटला प्रवेश करू शकत नाही

```bash
# इंग्रेस कॉन्फिगरेशनची पडताळणी करा
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# आंतरिक इंग्रेस सक्षम आहे का ते तपासा
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### समस्या: कार्यक्षमता समस्या

```bash
# संसाधनांचा वापर तपासा
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# संसाधने वाढवा
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## अतिरिक्त संसाधने आणि उदाहरणे
- [मायक्रोसर्व्हिसेस उदाहरण](./microservices/README.md)
- [साधे Flask API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps दस्तऐवजीकरण](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्पलेट्स गॅलरी](https://azure.github.io/awesome-azd/)
- [Container Apps नमुने](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्पलेट्स](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## योगदान

नवे कंटेनर अॅप उदाहरणे योगदान कशी कराल:

1. आपले उदाहरण असलेली नवीन उपनिर्देशिका तयार करा
2. पूर्ण `azure.yaml`, `infra/`, आणि `src/` फाइल्स समाविष्ट करा
3. तैनाती निर्देशांसह सविस्तर README जोडा
4. `azd up` ने तैनाती तपासा
5. पुल विनंती सबमिट करा

---

**मदत पाहिजे?** समर्थन आणि प्रश्नांसाठी [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेची त्रुटी असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकारप्राप्त स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
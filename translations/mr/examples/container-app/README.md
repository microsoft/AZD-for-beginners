# कंटेनर अ‍ॅप डिप्लॉयमेंटचे उदाहरणे AZD सह

या डिरेक्टरीमध्ये Azure Developer CLI (AZD) वापरून Azure Container Apps वर कंटेनराइज्ड अ‍ॅप्लिकेशन्स डिप्लॉय करण्यासाठी व्यापक उदाहरणे दिली आहेत. ही उदाहरणे वास्तविक जगातील पॅटर्न्स, सर्वोत्तम पद्धती आणि उत्पादनासाठी तयार कॉन्फिगरेशन्स दर्शवतात.

## 📚 विषय सूची

- [आढावा](../../../../examples/container-app)
- [पूर्वतयारी](../../../../examples/container-app)
- [जलद सुरुवात उदाहरणे](../../../../examples/container-app)
- [उत्पादनासाठी उदाहरणे](../../../../examples/container-app)
- [प्रगत पॅटर्न्स](../../../../examples/container-app)
- [सर्वोत्तम पद्धती](../../../../examples/container-app)

## आढावा

Azure Container Apps हे पूर्णपणे व्यवस्थापित सर्व्हरलेस कंटेनर प्लॅटफॉर्म आहे जे तुम्हाला मायक्रोसर्व्हिसेस आणि कंटेनराइज्ड अ‍ॅप्लिकेशन्स चालविण्याची परवानगी देते, त्यासाठी इन्फ्रास्ट्रक्चर व्यवस्थापित करण्याची गरज नाही. AZD सह एकत्रित केल्यावर तुम्हाला मिळते:

- **सोपे डिप्लॉयमेंट**: एकाच कमांडने कंटेनर्स आणि इन्फ्रास्ट्रक्चर डिप्लॉय करा
- **स्वयंचलित स्केलिंग**: HTTP ट्रॅफिक किंवा इव्हेंट्सवर आधारित शून्यापासून स्केल आउट करा
- **एकात्मिक नेटवर्किंग**: अंगभूत सेवा शोध आणि ट्रॅफिक विभाजन
- **व्यवस्थापित ओळख**: Azure संसाधनांसाठी सुरक्षित प्रमाणीकरण
- **खर्चाचा ऑप्टिमायझेशन**: फक्त वापरलेल्या संसाधनांसाठी पैसे द्या

## पूर्वतयारी

सुरुवात करण्यापूर्वी, खात्री करा की तुमच्याकडे आहे:

```bash
# AZD स्थापना तपासा
azd version

# Azure CLI तपासा
az version

# Docker तपासा (कस्टम प्रतिमा तयार करण्यासाठी)
docker --version

# Azure मध्ये लॉगिन करा
azd auth login
az login
```

**आवश्यक Azure संसाधने:**
- सक्रिय Azure सदस्यता
- संसाधन गट तयार करण्याची परवानगी
- कंटेनर अ‍ॅप्स वातावरण प्रवेश

## जलद सुरुवात उदाहरणे

### 1. साधा वेब API (Python Flask)

Azure Container Apps सह एक मूलभूत REST API डिप्लॉय करा.

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

**डिप्लॉयमेंट स्टेप्स:**

```bash
# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-python-mongo

# पायाभूत सुविधा तयार करा आणि तैनात करा
azd up

# तैनातीची चाचणी करा
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**मुख्य वैशिष्ट्ये:**
- 0 ते 10 रेप्लिकास पर्यंत ऑटो-स्केलिंग
- हेल्थ प्रॉब्स आणि लिव्हनेस चेक्स
- पर्यावरणीय व्हेरिएबल्स इंजेक्शन
- अ‍ॅप्लिकेशन इनसाइट्स एकत्रीकरण

### 2. Node.js Express API

MongoDB एकत्रीकरणासह Node.js बॅकएंड डिप्लॉय करा.

```bash
# Node.js API टेम्पलेट प्रारंभ करा
azd init --template todo-nodejs-mongo

# पर्यावरणीय चल बदल कॉन्फिगर करा
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# तैनात करा
azd up

# लॉग्स पहा
azd logs api
```

**इन्फ्रास्ट्रक्चर हायलाइट्स:**
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

### 3. स्टॅटिक फ्रंटएंड + API बॅकएंड

React फ्रंटएंड आणि API बॅकएंडसह पूर्ण-स्टॅक अ‍ॅप्लिकेशन डिप्लॉय करा.

```bash
# पूर्ण-स्टॅक टेम्पलेट प्रारंभ करा
azd init --template todo-csharp-sql-swa-func

# कॉन्फिगरेशन पुनरावलोकन करा
cat azure.yaml

# दोन्ही सेवा तैनात करा
azd up

# अनुप्रयोग उघडा
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## उत्पादनासाठी उदाहरणे

### उदाहरण 1: मायक्रोसर्व्हिसेस आर्किटेक्चर

**परिस्थिती**: अनेक मायक्रोसर्व्हिसेससह ई-कॉमर्स अ‍ॅप्लिकेशन

**डिरेक्टरी स्ट्रक्चर:**
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

**डिप्लॉयमेंट:**
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

### उदाहरण 2: AI-सक्षम कंटेनर अ‍ॅप

**परिस्थिती**: Azure OpenAI एकत्रीकरणासह AI चॅट अ‍ॅप्लिकेशन

**फाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित प्रवेशासाठी व्यवस्थापित ओळख वापरा
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # की व्हॉल्टमधून OpenAI की मिळवा
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

**डिप्लॉयमेंट कमांड्स:**
```bash
# वातावरण सेट करा
azd init --template ai-chat-app
azd env new dev

# ओपनएआय कॉन्फिगर करा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# तैनात करा
azd up

# API चाचणी करा
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण 3: बॅकग्राउंड वर्करसह क्यू प्रोसेसिंग

**परिस्थिती**: मेसेज क्यूसह ऑर्डर प्रोसेसिंग सिस्टम

**डिरेक्टरी स्ट्रक्चर:**
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
            # ऑर्डर प्रक्रिया करा
            print(f"Processing order: {message.content}")
            
            # संदेश पूर्ण करा
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

**डिप्लॉयमेंट:**
```bash
# प्रारंभ करा
azd init

# रांगेच्या संरचनेसह तैनात करा
azd up

# रांगेच्या लांबीवर आधारित कामगाराचा प्रमाण वाढवा
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## प्रगत पॅटर्न्स

### पॅटर्न 1: ब्लू-ग्रीन डिप्लॉयमेंट

```bash
# नवीन पुनरावलोकन वाहतूक न करता तयार करा
azd deploy api --revision-suffix blue --no-traffic

# नवीन पुनरावलोकन तपासा
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# वाहतूक विभाजित करा (२०% निळ्या, ८०% वर्तमानाकडे)
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

### पॅटर्न 2: AZD सह कॅनरी डिप्लॉयमेंट

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

**डिप्लॉयमेंट स्क्रिप्ट:**
```bash
#!/bin/bash
# deploy-canary.sh

# नवीन आवृत्ती 10% ट्रॅफिकसह तैनात करा
azd deploy api --revision-mode multiple

# मेट्रिक्स निरीक्षण करा
azd monitor --service api --duration 5m

# ट्रॅफिक हळूहळू वाढवा
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 मिनिटे थांबा
done
```

### पॅटर्न 3: मल्टी-रीजन डिप्लॉयमेंट

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

**डिप्लॉयमेंट:**
```bash
# सर्व प्रदेशांमध्ये तैनात करा
azd up

# एंडपॉइंट्स सत्यापित करा
azd show --output json | jq '.services.api.endpoints'
```

### पॅटर्न 4: Dapr एकत्रीकरण

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

**Dapr सह अ‍ॅप्लिकेशन कोड:**
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

### 1. संसाधनांचे आयोजन

```bash
# सुसंगत नामकरण पद्धती वापरा
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# खर्च ट्रॅकिंगसाठी संसाधनांना टॅग करा
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

### 3. कार्यक्षमता ऑप्टिमायझेशन

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

### 4. मॉनिटरिंग आणि निरीक्षण

```bash
# अनुप्रयोग अंतर्दृष्टी सक्षम करा
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# वास्तविक वेळेत लॉग्स पहा
azd logs api --follow

# मेट्रिक्सचे निरीक्षण करा
azd monitor --service api

# अलर्ट तयार करा
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. खर्चाचा ऑप्टिमायझेशन

```bash
# वापरात नसताना शून्यावर स्केल करा
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# डेव्हलपमेंट वातावरणासाठी स्पॉट इंस्टन्सेस वापरा
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# बजेट अलर्ट सेट करा
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD एकत्रीकरण

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

## सामान्य कमांड्स संदर्भ

```bash
# नवीन कंटेनर अॅप प्रकल्प प्रारंभ करा
azd init --template <template-name>

# पायाभूत सुविधा आणि अॅप्लिकेशन तैनात करा
azd up

# फक्त अॅप्लिकेशन कोड तैनात करा (पायाभूत सुविधा वगळा)
azd deploy

# फक्त पायाभूत सुविधा प्रदान करा
azd provision

# तैनात केलेल्या संसाधनांचे दृश्य पहा
azd show

# लॉग प्रवाहित करा
azd logs <service-name> --follow

# अॅप्लिकेशनचे निरीक्षण करा
azd monitor --overview

# संसाधने साफ करा
azd down --force --purge
```

## समस्या निराकरण

### समस्या: कंटेनर सुरू होण्यास अयशस्वी

```bash
# लॉग्स तपासा
azd logs api --tail 100

# कंटेनर इव्हेंट्स पहा
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानिक स्तरावर चाचणी करा
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### समस्या: कंटेनर अ‍ॅप एंडपॉइंटवर प्रवेश करू शकत नाही

```bash
# इनग्रेस कॉन्फिगरेशन सत्यापित करा
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# अंतर्गत इनग्रेस सक्षम आहे का ते तपासा
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
- [साधे Flash API उदाहरण](./simple-flask-api/README.md)
- [Azure Container Apps दस्तऐवज](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्पलेट्स गॅलरी](https://azure.github.io/awesome-azd/)
- [कंटेनर अ‍ॅप्स नमुने](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्पलेट्स](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## योगदान

नवीन कंटेनर अ‍ॅप्स उदाहरणे योगदान देण्यासाठी:

1. तुमच्या उदाहरणासह नवीन सबडिरेक्टरी तयार करा
2. पूर्ण `azure.yaml`, `infra/`, आणि `src/` फाइल्स समाविष्ट करा
3. डिप्लॉयमेंट सूचना असलेले व्यापक README जोडा
4. `azd up` सह डिप्लॉयमेंट चाचणी करा
5. एक पुल रिक्वेस्ट सबमिट करा

---

**मदतीची गरज आहे?** समर्थन आणि प्रश्नांसाठी [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदायामध्ये सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपयास लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
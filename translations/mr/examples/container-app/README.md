# AZD सह कंटेनर अॅप डिप्लॉयमेंट उदाहरणे

हा निर्देशिका Azure Developer CLI (AZD) वापरून Azure कंटेनर अॅप्सवर कंटेनरयुक्त अनुप्रयोग डिप्लॉय करण्यासाठी सर्वसमावेशक उदाहरणे समाविष्ट करते. ही उदाहरणे रिअल-वर्ल्ड पॅटर्न, सर्वोत्तम पद्धती, आणि उत्पादन-तयार कॉन्फिगरेशन दाखवतात.

## 📚 मजकूराची यादी

- [आढावा](../../../../examples/container-app)
- [पूर्वअपेक्षा](../../../../examples/container-app)
- [जलद प्रारंभ उदाहरणे](../../../../examples/container-app)
- [उत्पादन उदाहरणे](../../../../examples/container-app)
- [प्रगत पॅटर्न](../../../../examples/container-app)
- [सर्वोत्तम पद्धती](../../../../examples/container-app)

## आढावा

Azure कंटेनर अॅप्स हे एक पूर्णपणे व्यवस्थापित सर्व्हरलेस कंटेनर प्लॅटफॉर्म आहे जे तुम्हाला इन्फ्रास्ट्रक्चर व्यवस्थापित न करता मायक्रोसर्व्हिसेस आणि कंटेनरयुक्त अनुप्रयोग चालवण्याची परवानगी देते. AZD सह एकत्रित केल्यास, तुम्हाला मिळते:

- **सोपे डिप्लॉयमेंट**: एकाच आदेशातून कंटेनरसह इन्फ्रास्ट्रक्चर डिप्लॉय होतात
- **स्वयंचलित स्केलिंग**: HTTP ट्रॅफिक किंवा घटनांवर आधारित शून्यापासून स्केल करता येते आणि वाढवता येते
- **एकात्मिक नेटवर्किंग**: अंगभूत सेवा शोध आणि ट्रॅफिक विभाजन
- **व्यवस्थित ओळख**: Azure संसाधनांवर सुरक्षित प्रमाणीकरण
- **खर्चांची बचत**: तुम्ही वापरलेल्या संसाधनांसाठीच पैसे द्या

## पूर्वअपेक्षा

प्रारंभ करण्यापूर्वी, खात्री करा की तुमच्याकडे आहे:

```bash
# AZD इंस्टॉलेशन तपासा
azd version

# Azure CLI तपासा
az version

# Docker तपासा (कस्टम इमेजेस तयार करण्यासाठी)
docker --version

# Azure मध्ये लॉगिन करा
azd auth login
az login
```

**आवश्यक Azure संसाधने:**
- सक्रिय Azure सदस्यता
- रिसोर्स ग्रुप तयार करण्याची परवानगी
- कंटेनर अॅप्स वातावरण प्रवेश

## जलद प्रारंभ उदाहरणे

### 1. साधा वेब API (Python Flask)

Azure कंटेनर अॅप्ससह बेसिक REST API डिप्लॉय करा.

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
# साच्यावरून प्रारंभ करा
azd init --template todo-python-mongo

# पायाभूत सुविधा पुरवा आणि तैनात करा
azd up

# तैनातीची चाचणी करा
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**महत्वाच्या वैशिष्ट्ये:**
- 0 ते 10 रेप्लिका पर्यंत ऑटो-स्केलिंग
- हेल्थ प्रोब्ज आणि लिव्हनेस चेक्स
- पर्यावरणीय व्हेरिएबल्स इंजेक्शन
- अॅप्लिकेशन इन्साइट्स एकत्रीकरण

### 2. Node.js Express API

MongoDB एकत्रीकरणासह Node.js बॅकएंड डिप्लॉय करा.

```bash
# Node.js API टेम्पलेट प्रारंभ करा
azd init --template todo-nodejs-mongo

# पर्यावरणातील बदलयोग्य सेट करा
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# तैनात करा
azd up

# Azure Monitor द्वारे लॉग्स पहा
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

### 3. स्थिर फ्रंटेंड + API बॅकएंड

React फ्रंटेंड आणि API बॅकएंडसह फुल-स्टॅक अॅप्लिकेशन डिप्लॉय करा.

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

## उत्पादन उदाहरणे

### उदाहरण 1: मायक्रोसर्व्हिस आर्किटेक्चर

**परिप्रेक्ष्य**: बहुविध मायक्रोसर्व्हिसेससह ई-कॉमर्स अॅप्लिकेशन

**डिरेक्टरी संरचना:**
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
# प्रकल्प सुरू करा
azd init

# उत्पादन वातावरण सेट करा
azd env new production

# उत्पादन सेटिंग्ज कॉन्फिगर करा
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# सर्व सेवा डिप्लॉय करा
azd up

# डिप्लॉयमेंटचे निरीक्षण करा
azd monitor --overview
```

### उदाहरण 2: AI-चालित कंटेनर अॅप

**परिप्रेक्ष्य**: Microsoft Foundry Models एकत्रीकरणासह AI चॅट अनुप्रयोग

**फाइल: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# सुरक्षित प्रवेशासाठी मॅनेज्ड आयडेंटिटी वापरा
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # की वॉल्टमधून OpenAI की मिळवा
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

**डिप्लॉयमेंट आदेश:**
```bash
# वातावरण सेट करा
azd init --template ai-chat-app
azd env new dev

# OpenAI संरचीत करा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# तैनात करा
azd up

# API चाचणी करा
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### उदाहरण 3: बॅकग्राउंड वर्कर आणि क्यू प्रक्रिया

**परिप्रेक्ष्य**: मेसेज क्यूसह ऑर्डर प्रक्रिया प्रणाली

**डिरेक्टरी संरचना:**
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
            # आदेश प्रक्रिया करा
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

# रांगेची संरचना वापरून तैनात करा
azd up

# रांगेच्या लांबीनुसार कार्यकर्ता प्रमाण वाढवा
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## प्रगत पॅटर्न

### पॅटर्न 1: ब्लू-ग्रीन डिप्लॉयमेंट

```bash
# ट्रॅफिकशिवाय नवीन पुनरावलोकन तयार करा
azd deploy api --revision-suffix blue --no-traffic

# नवीन पुनरावलोकन चाचणी करा
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ट्रॅफिक विभाजित करा (20% निळ्या कडे, 80% सद्यस्थितीला)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# पूर्णपणे निळ्या कडे बदलाव करा
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

# 10% ट्रॅफिकसह नवीन आवृत्ती तैनात करा
azd deploy api --revision-mode multiple

# मेट्रिक्सवर लक्ष ठेवा
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

### पॅटर्न 3: मल्टि-रीजन डिप्लॉयमेंट

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
# सर्व प्रदेशांमध्ये परिनियोजित करा
azd up

# एंडपॉइंट तपासा
azd show --output json | jq '.services.api.endpoints'
```

### पॅटर्न 4: Dapr इंटिग्रेशन

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
        
        # कार्यक्रम प्रकाशित करा
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
# सातत्यपूर्ण नामकरण परंपरा वापरा
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# खर्च ट्रॅकिंगसाठी संसाधने टॅग करा
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

### 4. निरीक्षण आणि संशोधनीयता

```bash
# अनुप्रयोग अंतर्दृष्टी सक्षम करा
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# रिअल-टाइममध्ये लॉग पहा
azd monitor --logs
# किंवा कंटेनर अनुप्रयोगांसाठी Azure CLI वापरा:
az containerapp logs show --name api --resource-group rg-myapp --follow

# मेट्रिक्सवर लक्ष ठेवा
azd monitor --live

# अलर्ट तयार करा
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. खर्च बचत

```bash
# वापरत नसल्यास शून्यावर स्केल करा
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# विकास वातावरणांसाठी स्पॉट इन्स्टन्स वापरा
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

## सामान्य आदेश संदर्भ

```bash
# नवीन कंटेनर अॅप प्रकल्प प्रारंभ करा
azd init --template <template-name>

# पायाभूत सुविधा आणि अनुप्रयोग तैनात करा
azd up

# फक्त अनुप्रयोग कोड तैनात करा (पायाभूत सुविधा वगळा)
azd deploy

# फक्त पायाभूत सुविधा पुरवा
azd provision

# तैनात केलेल्या संसाधनांना पाहा
azd show

# azd मॉनिटर किंवा Azure CLI वापरून लॉग प्रवाहित करा
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# अनुप्रयोगाचे निरीक्षण करा
azd monitor --overview

# संसाधने साफ करा
azd down --force --purge
```

## समस्या निराकरण

### समस्या: कंटेनर सुरू होत नाही

```bash
# Azure CLI वापरून नोंदी तपासा
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# कंटेनर इव्हेंट पहा
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# स्थानिकपणे चाचणी करा
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### समस्या: कंटेनर अॅप एन्डपॉइंटला प्रवेश नाही

```bash
# प्रवेश संरचना तपासा
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# अंतर्गत प्रवेश सक्रिय आहे का ते तपासा
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### समस्या: प्रदर्शन समस्या

```bash
# संसाधन उपयोग तपासा
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
- [साधे फ्लास्क API उदाहरण](./simple-flask-api/README.md)
- [Azure कंटेनर अॅप्स दस्तऐवज](https://learn.microsoft.com/azure/container-apps/)
- [AZD टेम्प्लेट्स गॅलरी](https://azure.github.io/awesome-azd/)
- [कंटेनर अॅप्स नमुने](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep टेम्प्लेट्स](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## सहभागिता

नवीन कंटेनर अॅप उदाहरणे योगदान करण्यासाठी:

1. तुमच्या उदाहरणासह नवीन सबडिरेक्टरी तयार करा
2. संपूर्ण `azure.yaml`, `infra/`, आणि `src/` फाइल्स समाविष्ट करा
3. डिप्लॉयमेंट सूचना असलेले संपूर्ण README जोडा
4. `azd up` सह डिप्लॉयमेंटची चाचणी करा
5. पुल रिक्वेस्ट सादर करा

---

**मदत हवी आहे का?** समर्थन आणि प्रश्नांसाठी [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**सूचना**:  
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानला जावा. महत्त्वपूर्ण माहितींसाठी व्यावसायिक मानव अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
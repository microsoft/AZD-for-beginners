<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-20T09:21:40+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "ur"
}
-->
# AZD کے ساتھ کنٹینر ایپ ڈپلائمنٹ کی مثالیں

یہ ڈائریکٹری Azure Developer CLI (AZD) کا استعمال کرتے ہوئے Azure Container Apps پر کنٹینرائزڈ ایپلیکیشنز کو ڈپلائے کرنے کے لیے جامع مثالیں فراہم کرتی ہے۔ یہ مثالیں حقیقی دنیا کے پیٹرنز، بہترین طریقے، اور پروڈکشن کے لیے تیار کنفیگریشنز کو ظاہر کرتی ہیں۔

## 📚 مواد کی فہرست

- [جائزہ](../../../../examples/container-app)
- [ضروریات](../../../../examples/container-app)
- [فوری آغاز کی مثالیں](../../../../examples/container-app)
- [پروڈکشن کی مثالیں](../../../../examples/container-app)
- [اعلی درجے کے پیٹرنز](../../../../examples/container-app)
- [بہترین طریقے](../../../../examples/container-app)

## جائزہ

Azure Container Apps ایک مکمل طور پر مینیجڈ سرور لیس کنٹینر پلیٹ فارم ہے جو آپ کو مائیکرو سروسز اور کنٹینرائزڈ ایپلیکیشنز کو بغیر انفراسٹرکچر مینجمنٹ کے چلانے کی سہولت دیتا ہے۔ AZD کے ساتھ مل کر آپ کو یہ فوائد حاصل ہوتے ہیں:

- **آسان ڈپلائمنٹ**: ایک کمانڈ کے ذریعے کنٹینرز اور انفراسٹرکچر کی ڈپلائمنٹ
- **خودکار اسکیلنگ**: HTTP ٹریفک یا ایونٹس کی بنیاد پر زیرو سے اسکیل آؤٹ
- **مربوط نیٹ ورکنگ**: بلٹ ان سروس ڈسکوری اور ٹریفک اسپلٹنگ
- **مینجڈ آئیڈینٹیٹی**: Azure وسائل تک محفوظ تصدیق
- **لاگت کی بچت**: صرف استعمال شدہ وسائل کی ادائیگی

## ضروریات

شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کے پاس یہ موجود ہیں:

```bash
# AZD انسٹالیشن چیک کریں
azd version

# Azure CLI چیک کریں
az version

# Docker چیک کریں (کسٹم تصاویر بنانے کے لیے)
docker --version

# Azure میں لاگ ان کریں
azd auth login
az login
```

**ضروری Azure وسائل:**
- ایک فعال Azure سبسکرپشن
- ریسورس گروپ بنانے کی اجازت
- Container Apps ماحول تک رسائی

## فوری آغاز کی مثالیں

### 1. سادہ ویب API (Python Flask)

Azure Container Apps کے ساتھ ایک بنیادی REST API ڈپلائے کریں۔

**مثال: Python Flask API**

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

**ڈپلائمنٹ کے مراحل:**

```bash
# ٹیمپلیٹ سے شروع کریں
azd init --template todo-python-mongo

# بنیادی ڈھانچے کو فراہم کریں اور تعینات کریں
azd up

# تعیناتی کی جانچ کریں
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**اہم خصوصیات:**
- 0 سے 10 ریپلیکاز تک خودکار اسکیلنگ
- ہیلتھ پروبز اور لیونیس چیکس
- ماحول کے متغیرات کی انجیکشن
- Application Insights انٹیگریشن

### 2. Node.js Express API

MongoDB انٹیگریشن کے ساتھ ایک Node.js بیک اینڈ ڈپلائے کریں۔

```bash
# نوڈ.جے ایس API ٹیمپلیٹ کو شروع کریں
azd init --template todo-nodejs-mongo

# ماحول کے متغیرات کو ترتیب دیں
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# تعینات کریں
azd up

# لاگز دیکھیں
azd logs api
```

**انفراسٹرکچر کی جھلکیاں:**
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

### 3. جامد فرنٹ اینڈ + API بیک اینڈ

React فرنٹ اینڈ اور API بیک اینڈ کے ساتھ ایک مکمل اسٹیک ایپلیکیشن ڈپلائے کریں۔

```bash
# مکمل اسٹیک ٹیمپلیٹ کو شروع کریں
azd init --template todo-csharp-sql-swa-func

# تشکیل کا جائزہ لیں
cat azure.yaml

# دونوں سروسز کو تعینات کریں
azd up

# ایپلیکیشن کو کھولیں
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## پروڈکشن کی مثالیں

### مثال 1: مائیکرو سروسز آرکیٹیکچر

**منظرنامہ**: ایک ای کامرس ایپلیکیشن جس میں متعدد مائیکرو سروسز ہیں

**ڈائریکٹری کا ڈھانچہ:**
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

**azure.yaml کنفیگریشن:**
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

**ڈپلائمنٹ:**
```bash
# پروجیکٹ شروع کریں
azd init

# پروڈکشن ماحول مرتب کریں
azd env new production

# پروڈکشن سیٹنگز تشکیل دیں
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# تمام سروسز کو تعینات کریں
azd up

# تعیناتی کی نگرانی کریں
azd monitor --overview
```

### مثال 2: AI سے چلنے والی کنٹینر ایپ

**منظرنامہ**: Azure OpenAI انٹیگریشن کے ساتھ AI چیٹ ایپلیکیشن

**فائل: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# محفوظ رسائی کے لئے منظم شناخت استعمال کریں
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # کلیدی والٹ سے اوپن اے آئی کلید حاصل کریں
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

**فائل: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**فائل: infra/main.bicep**
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

**ڈپلائمنٹ کمانڈز:**
```bash
# ماحول ترتیب دیں
azd init --template ai-chat-app
azd env new dev

# اوپن اے آئی کو ترتیب دیں
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# نافذ کریں
azd up

# API کو جانچیں
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### مثال 3: بیک گراؤنڈ ورکر کے ساتھ قطار پروسیسنگ

**منظرنامہ**: میسج قطار کے ساتھ آرڈر پروسیسنگ سسٹم

**ڈائریکٹری کا ڈھانچہ:**
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

**فائل: src/worker/processor.py**
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
            # آرڈر پر عمل کریں
            print(f"Processing order: {message.content}")
            
            # پیغام مکمل کریں
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**فائل: azure.yaml**
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

**ڈپلائمنٹ:**
```bash
# شروع کریں
azd init

# قطار کی تشکیل کے ساتھ تعینات کریں
azd up

# قطار کی لمبائی کی بنیاد پر کارکن کو پیمانہ کریں
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## اعلی درجے کے پیٹرنز

### پیٹرن 1: بلیو-گرین ڈپلائمنٹ

```bash
# بغیر ٹریفک کے نیا ترمیم بنائیں
azd deploy api --revision-suffix blue --no-traffic

# نئی ترمیم کا تجربہ کریں
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ٹریفک تقسیم کریں (20% نیلے پر، 80% موجودہ پر)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# مکمل تبدیلی نیلے پر
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### پیٹرن 2: AZD کے ساتھ کینری ڈپلائمنٹ

**فائل: .azure/dev/config.json**
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

**ڈپلائمنٹ اسکرپٹ:**
```bash
#!/bin/bash
# deploy-canary.sh

# نئی ترمیم کو 10% ٹریفک کے ساتھ تعینات کریں
azd deploy api --revision-mode multiple

# میٹرکس کی نگرانی کریں
azd monitor --service api --duration 5m

# ٹریفک کو بتدریج بڑھائیں
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 منٹ انتظار کریں
done
```

### پیٹرن 3: ملٹی ریجن ڈپلائمنٹ

**فائل: azure.yaml**
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

**فائل: infra/multi-region.bicep**
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

**ڈپلائمنٹ:**
```bash
# تمام علاقوں میں تعینات کریں
azd up

# اختتامی نکات کی تصدیق کریں
azd show --output json | jq '.services.api.endpoints'
```

### پیٹرن 4: Dapr انٹیگریشن

**فائل: infra/app/dapr-enabled.bicep**
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

**Dapr کے ساتھ ایپلیکیشن کوڈ:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # حالت محفوظ کریں
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # واقعہ شائع کریں
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## بہترین طریقے

### 1. وسائل کی تنظیم

```bash
# مستقل نام رکھنے کے اصول استعمال کریں
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# وسائل کو لاگت کی نگرانی کے لیے ٹیگ کریں
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. سیکیورٹی کے بہترین طریقے

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

### 3. کارکردگی کی اصلاح

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

### 4. مانیٹرنگ اور مشاہدہ

```bash
# ایپلیکیشن انسائٹس کو فعال کریں
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# لاگز کو حقیقی وقت میں دیکھیں
azd logs api --follow

# میٹرکس کی نگرانی کریں
azd monitor --service api

# الرٹس بنائیں
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. لاگت کی بچت

```bash
# جب استعمال میں نہ ہو تو صفر پر پیمانہ کریں
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ترقیاتی ماحول کے لیے اسپاٹ انسٹینسز استعمال کریں
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# بجٹ الرٹس ترتیب دیں
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD انٹیگریشن

**GitHub Actions کی مثال:**
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

## عمومی کمانڈز کا حوالہ

```bash
# نیا کنٹینر ایپ پروجیکٹ شروع کریں
azd init --template <template-name>

# انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
azd up

# صرف ایپلیکیشن کوڈ تعینات کریں (انفراسٹرکچر کو چھوڑ دیں)
azd deploy

# صرف انفراسٹرکچر فراہم کریں
azd provision

# تعینات کردہ وسائل دیکھیں
azd show

# لاگز کو اسٹریم کریں
azd logs <service-name> --follow

# ایپلیکیشن کی نگرانی کریں
azd monitor --overview

# وسائل کو صاف کریں
azd down --force --purge
```

## مسائل کا حل

### مسئلہ: کنٹینر شروع ہونے میں ناکام

```bash
# لاگز چیک کریں
azd logs api --tail 100

# کنٹینر کے واقعات دیکھیں
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# مقامی طور پر ٹیسٹ کریں
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### مسئلہ: کنٹینر ایپ اینڈ پوائنٹ تک رسائی ممکن نہیں

```bash
# انگریس کی تشکیل کی تصدیق کریں
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# چیک کریں کہ آیا داخلی انگریس فعال ہے
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### مسئلہ: کارکردگی کے مسائل

```bash
# وسائل کے استعمال کو چیک کریں
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# وسائل کو بڑھائیں
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## اضافی وسائل اور مثالیں
- [مائیکرو سروسز کی مثال](./microservices/README.md)
- [سادہ Flask API کی مثال](./simple-flask-api/README.md)
- [Azure Container Apps کی دستاویزات](https://learn.microsoft.com/azure/container-apps/)
- [AZD ٹیمپلیٹس گیلری](https://azure.github.io/awesome-azd/)
- [کنٹینر ایپس کی مثالیں](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ٹیمپلیٹس](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## تعاون

نئی کنٹینر ایپ کی مثالیں شامل کرنے کے لیے:

1. اپنی مثال کے ساتھ ایک نیا سب ڈائریکٹری بنائیں
2. مکمل `azure.yaml`, `infra/`, اور `src/` فائلیں شامل کریں
3. ڈپلائمنٹ ہدایات کے ساتھ جامع README شامل کریں
4. `azd up` کے ساتھ ڈپلائمنٹ کی جانچ کریں
5. ایک پل ریکویسٹ جمع کروائیں

---

**مدد چاہیے؟** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) کمیونٹی میں شامل ہوں تاکہ مدد اور سوالات کے جوابات حاصل کیے جا سکیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
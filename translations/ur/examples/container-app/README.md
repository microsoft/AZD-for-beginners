# کنٹینر ایپ تعیناتی کی مثالیں AZD کے ساتھ

یہ ڈائریکٹری Azure Developer CLI (AZD) استعمال کرتے ہوئے Azure Container Apps پر کنٹینرائزڈ ایپلیکیشنز کی تعیناتی کے لیے جامع مثالیں مہیا کرتی ہے۔ یہ مثالیں حقیقی دنیا کے نمونے، بہترین طریقے، اور پروڈکشن کے لیے تیار کنفیگریشنز دکھاتی ہیں۔

## 📚 فہرست مضامین

- [جائزہ](#جائزہ)
- [پیشگی شرائط](#پیشگی-شرائط)
- [فوری شروع کرنے کی مثالیں](#فوری-شروع-کرنے-کی-مثالیں)
- [پروڈکشن کی مثالیں](#پروڈکشن-کی-مثالیں)
- [اعلیٰ درجے کے نمونے](#اعلیٰ-درجے-کے-نمونے)
- [بہترین طریقے](#بہترین-طریقے)

## جائزہ

Azure Container Apps ایک مکمل طور پر مینیج شدہ سرور لیس کنٹینر پلیٹ فارم ہے جو آپ کو چھوٹے سروسز اور کنٹینرائزڈ ایپلیکیشنز بغیر انفراسٹرکچر منیج کیے چلانے کی اجازت دیتا ہے۔ AZD کے ساتھ مل کر، آپ کو ملتا ہے:

- **سادہ تعیناتی**: ایک کمانڈ میں انفراسٹرکچر کے ساتھ کنٹینرز کی تعیناتی
- **خودکار اسکیلنگ**: HTTP ٹریفک یا ایونٹس کی بنیاد پر زیرو سے اسکیل آؤٹ
- **انٹیگریٹڈ نیٹ ورکنگ**: بلٹ ان سروس ڈسکوری اور ٹریفک سپلٹنگ
- **منیجڈ شناخت**: Azure وسائل کے لیے محفوظ توثیق
- **لاگت کی بچت**: جس وسائل کا آپ استعمال کرتے ہیں صرف اس کی ادائیگی کریں

## پیشگی شرائط

شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کے پاس ہے:

```bash
# AZD کی تنصیب چیک کریں
azd version

# Azure CLI چیک کریں
az version

# Docker چیک کریں (حسب ضرورت امیجز بنانے کے لئے)
docker --version

# Azure میں لاگ ان کریں
azd auth login
az login
```

**ضروری Azure وسائل:**
- فعال Azure سبسکرپشن
- ریسورس گروپ بنانے کی اجازت
- Container Apps ماحول تک رسائی

## فوری شروع کرنے کی مثالیں

### 1. سادہ ویب API (Python Flask)

Azure Container Apps کے ساتھ ایک بنیادی REST API تعینات کریں۔

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

**تعیناتی کے مراحل:**

```bash
# ٹیمپلیٹ سے آغاز کریں
azd init --template todo-python-mongo

# بنیادی ڈھانچہ مہیا کریں اور تعینات کریں
azd up

# تعیناتی کا ٹیسٹ کریں
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**اہم خصوصیات:**
- 0 سے 10 نقول تک خودکار اسکیلنگ
- ہیلتھ پروبز اور لائیونیسی چیکس
- ماحول کے متغیرات کی انجیکشن
- Application Insights انٹیگریشن

### 2. Node.js Express API

MongoDB انٹیگریشن کے ساتھ Node.js بیک اینڈ تعینات کریں۔

```bash
# Node.js API ٹیمپلیٹ کو ابتدا کریں
azd init --template todo-nodejs-mongo

# ماحولیاتی متغیرات کو ترتیب دیں
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# تعینات کریں
azd up

# Azure مانیٹر کے ذریعے لاگز دیکھیں
azd monitor --logs
```

**انفراسٹرکچر کے اہم نکات:**
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

### 3. سٹیٹک فرنٹ اینڈ + API بیک اینڈ

React فرنٹ اینڈ اور API بیک اینڈ کے ساتھ فل اسٹیک اپلیکیشن تعینات کریں۔

```bash
# مکمل اسٹیک ٹیمپلیٹ کو شروع کریں
azd init --template todo-csharp-sql-swa-func

# ترتیب کا جائزہ لیں
cat azure.yaml

# دونوں خدمات کو تعینات کریں
azd up

# ایپلیکیشن کھولیں
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## پروڈکشن کی مثالیں

### مثال 1: مائیکروسروسز آرکیٹیکچر

**منظر:** ای-کامرس ایپلیکیشن متعدد مائیکروسروسز کے ساتھ

**ڈائریکٹری ساخت:**
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

**تعیناتی:**
```bash
# پروجیکٹ کو شروع کریں
azd init

# تعمیری ماحول سیٹ کریں
azd env new production

# تعمیری ترتیبات ترتیب دیں
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# تمام خدمات تعینات کریں
azd up

# تعیناتی کی نگرانی کریں
azd monitor --overview
```

### مثال 2: AI سے چلنے والی کنٹینر ایپ

**منظر:** Microsoft Foundry Models انٹیگریشن کے ساتھ AI چیٹ ایپلیکیشن

**فائل: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# محفوظ رسائی کے لیے منیجڈ آئیڈینٹیٹی استعمال کریں
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # کی ویولت سے اوپن اے آئی کی حاصل کریں
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

**تعیناتی کے کمانڈز:**
```bash
# ماحول قائم کریں
azd init --template ai-chat-app
azd env new dev

# اوپن اے آئی کو ترتیب دیں
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# تعینات کریں
azd up

# API کا ٹیسٹ کریں
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### مثال 3: پس منظر میں کام کرنے والا ورکر اور کیو پروسیسنگ

**منظر:** میسج کیو کے ساتھ آرڈر پروسیسنگ سسٹم

**ڈائریکٹری ساخت:**
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
            # عمل کیجیے حکم
            print(f"Processing order: {message.content}")
            
            # مکمل پیغام
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

**تعیناتی:**
```bash
# شروع کریں
azd init

# قطار کی ترتیب کے ساتھ تعینات کریں
azd up

# قطار کی لمبائی کی بنیاد پر ورکر کو بڑھائیں
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## اعلیٰ درجے کے نمونے

### نمونہ 1: بلیو-گرین تعیناتی

```bash
# ٹریفک کے بغیر نیا جائزہ بنائیں
azd deploy api --revision-suffix blue --no-traffic

# نئے جائزے کا ٹیسٹ کریں
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ٹریفک تقسیم کریں (20% نیلے کو، 80% موجودہ کو)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# مکمل تبدیلی نیلے پر کریں
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### نمونہ 2: AZD کے ساتھ کینری تعیناتی

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

**تعیناتی اسکرپٹ:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10٪ ٹریفک کے ساتھ نئی نظر ثانی تعینات کریں
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

### نمونہ 3: ملٹی ریجن تعیناتی

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

**تعیناتی:**
```bash
# تمام علاقوں میں تعینات کریں
azd up

# آخر نکات کی تصدیق کریں
azd show --output json | jq '.services.api.endpoints'
```

### نمونہ 4: Dapr انٹیگریشن

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
        
        # ایونٹ شائع کریں
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
# متواتر نام دینے کے اصول استعمال کریں
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# لاگت کی نگرانی کے لیے وسائل کو ٹیگ کریں
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. سیکیورٹی بہترین طریقے

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

### 4. نگرانی اور مشاہدہ

```bash
# اپلیکیشن ان سائٹس کو فعال کریں
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# لاگز کو حقیقی وقت میں دیکھیں
azd monitor --logs
# یا کنٹینر ایپس کے لیے ایزور CLI استعمال کریں:
az containerapp logs show --name api --resource-group rg-myapp --follow

# میٹرکس کی نگرانی کریں
azd monitor --live

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
# جب استعمال میں نہ ہو تو صفر تک پیمانہ کریں
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ترقیاتی ماحول کے لیے اسپاٹ انسٹنسز کا استعمال کریں
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# بجٹ کی انتباہات مرتب کریں
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

## عام کمانڈز کا حوالہ

```bash
# نئے کنٹینر ایپ پروجیکٹ کو شروع کریں
azd init --template <template-name>

# انفراسٹرکچر اور ایپلیکیشن کو تعینات کریں
azd up

# صرف ایپلیکیشن کوڈ تعینات کریں (انفراسٹرکچر کو چھوڑیں)
azd deploy

# صرف انفراسٹرکچر کو فراہم کریں
azd provision

# تعینات شدہ وسائل دیکھیں
azd show

# azd مانیٹر یا Azure CLI کے ذریعے لاگز کو اسٹریمنگ کریں
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ایپلیکیشن کی نگرانی کریں
azd monitor --overview

# وسائل کو صاف کریں
azd down --force --purge
```

## مسائل کا حل

### مسئلہ: کنٹینر شروع نہیں ہوتا

```bash
# ایژر CLI کا استعمال کرتے ہوئے لاگز چیک کریں
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# کنٹینر کے واقعات دیکھیں
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# مقامی طور پر جانچ کریں
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### مسئلہ: کنٹینر ایپ اینڈپوائنٹ تک رسائی نہیں

```bash
# انگریس کی ترتیب کی تصدیق کریں
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# چیک کریں کہ آیا داخلی انگریس فعال ہے یا نہیں
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### مسئلہ: کارکردگی کے مسائل

```bash
# وسیع استعمال وسائل کی جانچ کریں
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
- [مائیکروسروسز کی مثال](./microservices/README.md)
- [سادہ فلاسک API کی مثال](./simple-flask-api/README.md)
- [Azure Container Apps کی دستاویزات](https://learn.microsoft.com/azure/container-apps/)
- [AZD ٹیمپلیٹس گیلری](https://azure.github.io/awesome-azd/)
- [Container Apps کے نمونے](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep ٹیمپلیٹس](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## تعاون

نئی کنٹینر ایپ مثالیں شامل کرنے کے لیے:

1. اپنی مثال کے ساتھ ایک نیا ذیلی ڈائریکٹری بنائیں
2. مکمل `azure.yaml`, `infra/`, اور `src/` فائلیں شامل کریں
3. تعیناتی کی ہدایات کے ساتھ جامع README شامل کریں
4. `azd up` کے ساتھ تعیناتی کا تجربہ کریں
5. پل ریکوئسٹ جمع کروائیں

---

**مدد چاہیے؟** سپورٹ اور سوالات کے لیے [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) کمیونٹی میں شامل ہوں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم مطابقت ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ماخذ سمجھی جائے۔ اہم معلومات کے لیے پیشہ ورانہ انسانی ترجمہ تجویز کیا جاتا ہے۔ اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# کنٹینر ایپ کی تعیناتی کی مثالیں AZD کے ساتھ

یہ ڈائریکٹری ایژور کنٹینر ایپز میں کنٹینرائزڈ ایپلیکیشنز کو Azure Developer CLI (AZD) کے ذریعے تعینات کرنے کی جامع مثالیں فراہم کرتی ہے۔ یہ مثالیں عملی دنیا کے نمونے، بہترین طریقے، اور پروڈکشن کے لیے تیار کنفیگریشنز دکھاتی ہیں۔

## 📚 فہرست مضامین

- [جائزہ](#جائزہ)
- [ضروریات](#ضروریات)
- [فوری شروع کرنے کی مثالیں](#فوری-شروع-کرنے-کی-مثالیں)
- [پروڈکشن مثالیں](#پروڈکشن-مثالیں)
- [اعلیٰ درجے کے نمونے](#اعلیٰ-درجے-کے-نمونے)
- [بہترین طریقے](#بہترین-طریقے)

## جائزہ

ایژور کنٹینر ایپز ایک مکمل طور پر مینجڈ سرور لیس کنٹینر پلیٹ فارم ہے جو آپ کو انفراسٹرکچر کے بغیر مائیکروسروسز اور کنٹینرائزڈ ایپلیکیشنز چلانے کی سہولت دیتا ہے۔ AZD کے ساتھ مل کر آپ کو ملتا ہے:

- **آسان تعیناتی**: ایک کمانڈ سے کنٹینرز اور انفراسٹرکچر کی تعیناتی
- **خودکار اسکیلنگ**: HTTP ٹریفک یا ایونٹس کی بنیاد پر صفر سے اسکیل آؤٹ کرنا
- **ای میل ٹگریٹ شدہ نیٹ ورکنگ**: بلٹ ان سروس ڈسکوری اور ٹریفک اسپلٹنگ
- **منیجڈ شناخت**: Azure وسائل کے لیے محفوظ تصدیق
- **لاگت کی بچت**: صرف استعمال شدہ وسائل کی ادائیگی

## ضروریات

شروع کرنے سے پہلے، یقین دہانی کریں کہ آپ کے پاس موجود ہیں:

```bash
# AZD کی تنصیب چیک کریں
azd version

# Azure CLI کی جانچ کریں
az version

# Docker کی جانچ کریں (کسٹم امیجز بنانے کے لیے)
docker --version

# AZD کی تعیناتی کے لیے توثیق کریں
azd auth login

# اختیاری: اگر آپ az کمانڈز براہِ راست چلانے کا ارادہ رکھتے ہیں تو Azure CLI میں سائن ان کریں
az login
```

**درکار Azure وسائل:**
- فعال Azure سبسکرپشن
- ریسورس گروپ بنانے کی اجازتیں
- کنٹینر ایپز ماحول تک رسائی

## فوری شروع کرنے کی مثالیں

### 1. سادہ ویب API (پائتھن فلاسک)

Azure کنٹینر ایپز کے ساتھ ایک بنیادی REST API تعینات کریں۔

**مثال: پائتھن فلاسک API**

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
# ٹیمپلیٹ سے ابتدا کریں
azd init --template todo-python-mongo

# بنیادی ڈھانچہ فراہم کریں اور تعینات کریں
azd up

# تنصیب کا ٹیسٹ کریں
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**اہم خصوصیات:**
- 0 سے 10 ریپلیکاز تک خودکار اسکیلنگ
- صحت کی جانچ اور لائیونیس چیکز
- ماحولیاتی متغیرات کی انجیکشن
- ایپلیکیشن انسائٹس انٹیگریشن

### 2. نوڈ.جے ایس ایکسپریس API

نوڈ.جے ایس بیک اینڈ کو مونگو ڈی بی انٹیگریشن کے ساتھ تعینات کریں۔

```bash
# نوڈ.جے ایس API ٹیمپلیٹ کو شروع کریں
azd init --template todo-nodejs-mongo

# ماحولیاتی متغیرات کی ترتیب دیں
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

### 3. جامد فرنٹ اینڈ + API بیک اینڈ

ری ایکٹ فرنٹ اینڈ اور API بیک اینڈ کے ساتھ مکمل اسٹیک ایپلیکیشن تعینات کریں۔

```bash
# مکمل اسٹیک ٹیمپلیٹ کو ابتدا کریں
azd init --template todo-csharp-sql-swa-func

# ترتیب کا جائزہ لیں
cat azure.yaml

# دونوں سروسز کو تعینات کریں
azd up

# ایپلیکیشن کھولیں
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## پروڈکشن مثالیں

### مثال 1: مائیکروسروسز آرکیٹیکچر

**منظرنامہ**: متعدد مائیکروسروسز کے ساتھ ای کامرس ایپلیکیشن

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
# پروجیکٹ کا آغاز کریں
azd init

# پروڈکشن ماحول مقرر کریں
azd env new production

# پروڈکشن کی ترتیبات تشکیل دیں
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# تمام خدمات تعینات کریں
azd up

# تعیناتی کی نگرانی کریں
azd monitor --overview
```

### مثال 2: AI فعال کنٹینر ایپ

**منظرنامہ**: مائیکروسافٹ فاؤنڈری ماڈلز انٹیگریشن کے ساتھ AI چیٹ ایپلیکیشن

**فائل: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# محفوظ رسائی کے لیے منیجڈ شناخت کا استعمال کریں
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # کلید والٹ سے اوپن اے آئی کلید حاصل کریں
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
# ماحول مرتب کریں
azd init --template ai-chat-app
azd env new dev

# OpenAI کو ترتیب دیں
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# تعینات کریں
azd up

# API کا ٹیسٹ کریں
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### مثال 3: بیک گراؤنڈ ورکر کے ساتھ قطار کی پروسیسنگ

**منظرنامہ**: آرڈر پروسیسنگ نظام کے ساتھ میسج کیو

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
            # آرڈر پر کارروائی کریں
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

**تعیناتی:**
```bash
# ابتدائیہ
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
# بغیر ٹریفک کے نیا ورژن بنائیں
azd deploy api --revision-suffix blue --no-traffic

# نئے ورژن کا ٹیسٹ کریں
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ٹریفک تقسیم کریں (20٪ نیلا، 80٪ موجودہ کو)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# نیلے پر مکمل منتقلی کریں
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

# 10٪ ٹریفک کے ساتھ نیا ورژن تعینات کریں
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

### نمونہ 3: کثیر-علاقائی تعیناتی

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

# ایند پوائنٹس کی تصدیق کریں
azd show --output json | jq '.services.api.endpoints'
```

### نمونہ 4: ڈیپر انٹیگریشن

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

**ڈیپر کے ساتھ ایپلیکیشن کوڈ:**
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
# مستقل نام رکھنے کے اصول استعمال کریں
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# لاگت کی نگرانی کے لیے وسائل کو ٹیگ کریں
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

### 3. کارکردگی کی بہتری

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

# حقیقی وقت میں لاگز دیکھیں
azd monitor --logs
# یا کنٹینر ایپس کے لیے آزور CLI استعمال کریں:
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
# استعمال میں نہ ہونے پر صفر تک بڑھائیں
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ڈویلپمنٹ ماحول کے لیے اسپاٹ انسٹینسز استعمال کریں
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# بجٹ الرٹس سیٹ کریں
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

# صرف ایپلیکیشن کوڈ تعینات کریں (انفراسٹرکچر چھوڑیں)
azd deploy

# صرف انفراسٹرکچر فراہم کریں
azd provision

# تعینات کردہ وسائل دیکھیں
azd show

# azd monitor یا Azure CLI کا استعمال کرتے ہوئے لاگز اسٹریمنگ کریں
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
# Azure CLI کا استعمال کرکے لاگز چیک کریں
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# کنٹینر کے واقعات دیکھیں
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# مقامی طور پر ٹیسٹ کریں
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### مسئلہ: کنٹینر ایپ اینڈ پوائنٹ تک رسائی نہیں

```bash
# درآمد کنفیگریشن کی تصدیق کریں
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# چیک کریں کہ آیا داخلی درآمد فعال ہے
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
- [مائیکروسروسز کی مثال](./microservices/README.md)
- [سادہ فلاسک API کی مثال](./simple-flask-api/README.md)
- [Azure Container Apps دستاویزات](https://learn.microsoft.com/azure/container-apps/)
- [AZD ٹیمپلیٹس گیلری](https://azure.github.io/awesome-azd/)
- [کنٹینر ایپز سیمپلز](https://github.com/Azure-Samples/container-apps-samples)
- [بیسپ ٹیمپلیٹس](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## تعاون

نئی کنٹینر ایپ مثالیں شامل کرنے کے لیے:

1. اپنی مثال کے ساتھ نئی ذیلی ڈائریکٹری بنائیں
2. مکمل `azure.yaml`، `infra/`، اور `src/` فائلز شامل کریں
3. تعیناتی کی ہدایات کے ساتھ جامع ریڈمی شامل کریں
4. `azd up` کے ذریعے تعیناتی کی جانچ کریں
5. پل ریکویسٹ جمع کروائیں

---

**مدد चाहिए؟** مدد اور سوالات کے لیے [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) کمیونٹی میں شامل ہوں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا نقائص ہو سکتے ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ترین ذریعہ سمجھی جانی چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
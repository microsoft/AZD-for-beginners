<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-20T01:34:46+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "fa"
}
-->
# مثال‌های استقرار اپلیکیشن‌های کانتینری با AZD

این پوشه شامل مثال‌های جامع برای استقرار اپلیکیشن‌های کانتینری شده در Azure Container Apps با استفاده از Azure Developer CLI (AZD) است. این مثال‌ها الگوهای واقعی، بهترین روش‌ها و تنظیمات آماده برای تولید را نشان می‌دهند.

## 📚 فهرست مطالب

- [بررسی اجمالی](../../../../examples/container-app)
- [پیش‌نیازها](../../../../examples/container-app)
- [مثال‌های شروع سریع](../../../../examples/container-app)
- [مثال‌های تولیدی](../../../../examples/container-app)
- [الگوهای پیشرفته](../../../../examples/container-app)
- [بهترین روش‌ها](../../../../examples/container-app)

## بررسی اجمالی

Azure Container Apps یک پلتفرم کانتینری سرورلس کاملاً مدیریت‌شده است که به شما امکان اجرای میکروسرویس‌ها و اپلیکیشن‌های کانتینری شده را بدون نیاز به مدیریت زیرساخت می‌دهد. وقتی با AZD ترکیب شود، شما موارد زیر را دریافت می‌کنید:

- **استقرار ساده**: استقرار کانتینرها با زیرساخت تنها با یک فرمان
- **مقیاس‌پذیری خودکار**: مقیاس‌پذیری از صفر و افزایش مقیاس بر اساس ترافیک HTTP یا رویدادها
- **شبکه‌سازی یکپارچه**: کشف سرویس داخلی و تقسیم ترافیک
- **هویت مدیریت‌شده**: احراز هویت امن به منابع Azure
- **بهینه‌سازی هزینه**: پرداخت فقط برای منابعی که استفاده می‌کنید

## پیش‌نیازها

قبل از شروع، مطمئن شوید که موارد زیر را دارید:

```bash
# بررسی نصب AZD
azd version

# بررسی Azure CLI
az version

# بررسی Docker (برای ساخت تصاویر سفارشی)
docker --version

# ورود به Azure
azd auth login
az login
```

**منابع مورد نیاز Azure:**
- اشتراک فعال Azure
- مجوزهای ایجاد گروه منابع
- دسترسی به محیط Container Apps

## مثال‌های شروع سریع

### 1. وب API ساده (Python Flask)

استقرار یک REST API پایه با Azure Container Apps.

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

**مراحل استقرار:**

```bash
# مقداردهی اولیه از الگو
azd init --template todo-python-mongo

# تهیه زیرساخت و استقرار
azd up

# آزمایش استقرار
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ویژگی‌های کلیدی:**
- مقیاس‌پذیری خودکار از 0 تا 10 نمونه
- پروب‌های سلامت و بررسی‌های زنده بودن
- تزریق متغیرهای محیطی
- یکپارچه‌سازی Application Insights

### 2. Node.js Express API

استقرار یک بک‌اند Node.js با یکپارچه‌سازی MongoDB.

```bash
# قالب API Node.js را مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo

# متغیرهای محیطی را پیکربندی کنید
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# استقرار
azd up

# مشاهده گزارش‌ها
azd logs api
```

**نکات برجسته زیرساخت:**
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

### 3. فرانت‌اند استاتیک + بک‌اند API

استقرار یک اپلیکیشن فول‌استک با فرانت‌اند React و بک‌اند API.

```bash
# قالب فول‌استک را مقداردهی اولیه کنید
azd init --template todo-csharp-sql-swa-func

# پیکربندی را بررسی کنید
cat azure.yaml

# هر دو سرویس را مستقر کنید
azd up

# برنامه را باز کنید
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## مثال‌های تولیدی

### مثال 1: معماری میکروسرویس‌ها

**سناریو**: اپلیکیشن تجارت الکترونیک با چندین میکروسرویس

**ساختار پوشه:**
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

**پیکربندی azure.yaml:**
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

**استقرار:**
```bash
# پروژه را مقداردهی اولیه کنید
azd init

# محیط تولید را تنظیم کنید
azd env new production

# تنظیمات تولید را پیکربندی کنید
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# تمام خدمات را مستقر کنید
azd up

# استقرار را نظارت کنید
azd monitor --overview
```

### مثال 2: اپلیکیشن کانتینری مبتنی بر هوش مصنوعی

**سناریو**: اپلیکیشن چت هوش مصنوعی با یکپارچه‌سازی Azure OpenAI

**فایل: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# از هویت مدیریت‌شده برای دسترسی امن استفاده کنید
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # کلید OpenAI را از Key Vault دریافت کنید
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

**فایل: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**فایل: infra/main.bicep**
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

**فرمان‌های استقرار:**
```bash
# تنظیم محیط
azd init --template ai-chat-app
azd env new dev

# پیکربندی OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# استقرار
azd up

# آزمایش API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### مثال 3: کارگر پس‌زمینه با پردازش صف

**سناریو**: سیستم پردازش سفارش با صف پیام

**ساختار پوشه:**
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

**فایل: src/worker/processor.py**
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
            # پردازش سفارش
            print(f"Processing order: {message.content}")
            
            # تکمیل پیام
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**فایل: azure.yaml**
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

**استقرار:**
```bash
# مقداردهی اولیه
azd init

# استقرار با پیکربندی صف
azd up

# مقیاس‌بندی کارگر بر اساس طول صف
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## الگوهای پیشرفته

### الگو 1: استقرار آبی-سبز

```bash
# ایجاد بازبینی جدید بدون ترافیک
azd deploy api --revision-suffix blue --no-traffic

# بازبینی جدید را آزمایش کنید
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# تقسیم ترافیک (۲۰٪ به آبی، ۸۰٪ به فعلی)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# انتقال کامل به آبی
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### الگو 2: استقرار Canary با AZD

**فایل: .azure/dev/config.json**
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

**اسکریپت استقرار:**
```bash
#!/bin/bash
# deploy-canary.sh

# استقرار نسخه جدید با ۱۰٪ ترافیک
azd deploy api --revision-mode multiple

# نظارت بر معیارها
azd monitor --service api --duration 5m

# افزایش تدریجی ترافیک
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ۵ دقیقه صبر کنید
done
```

### الگو 3: استقرار چند منطقه‌ای

**فایل: azure.yaml**
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

**فایل: infra/multi-region.bicep**
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

**استقرار:**
```bash
# استقرار در تمام مناطق
azd up

# تأیید نقاط پایانی
azd show --output json | jq '.services.api.endpoints'
```

### الگو 4: یکپارچه‌سازی Dapr

**فایل: infra/app/dapr-enabled.bicep**
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

**کد اپلیکیشن با Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # ذخیره وضعیت
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # انتشار رویداد
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## بهترین روش‌ها

### 1. سازماندهی منابع

```bash
# از نامگذاری‌های یکسان استفاده کنید
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# منابع را برای ردیابی هزینه برچسب‌گذاری کنید
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. بهترین روش‌های امنیتی

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

### 3. بهینه‌سازی عملکرد

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

### 4. نظارت و مشاهده‌پذیری

```bash
# فعال کردن Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# مشاهده لاگ‌ها به صورت لحظه‌ای
azd logs api --follow

# نظارت بر معیارها
azd monitor --service api

# ایجاد هشدارها
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. بهینه‌سازی هزینه

```bash
# مقیاس به صفر زمانی که استفاده نمی‌شود
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# استفاده از نمونه‌های اسپات برای محیط‌های توسعه
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# تنظیم هشدارهای بودجه
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. یکپارچه‌سازی CI/CD

**مثال GitHub Actions:**
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

## مرجع دستورات رایج

```bash
# پروژه برنامه کانتینر جدید را مقداردهی اولیه کنید
azd init --template <template-name>

# زیرساخت و برنامه را مستقر کنید
azd up

# فقط کد برنامه را مستقر کنید (زیرساخت را نادیده بگیرید)
azd deploy

# فقط زیرساخت را فراهم کنید
azd provision

# منابع مستقر شده را مشاهده کنید
azd show

# لاگ‌ها را استریم کنید
azd logs <service-name> --follow

# برنامه را نظارت کنید
azd monitor --overview

# منابع را پاکسازی کنید
azd down --force --purge
```

## رفع مشکلات

### مشکل: کانتینر شروع نمی‌شود

```bash
# بررسی گزارش‌ها
azd logs api --tail 100

# مشاهده رویدادهای کانتینر
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# آزمایش به صورت محلی
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### مشکل: نمی‌توان به نقطه پایانی اپلیکیشن کانتینری دسترسی داشت

```bash
# پیکربندی ورودی را بررسی کنید
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# بررسی کنید که آیا ورودی داخلی فعال است
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### مشکل: مشکلات عملکرد

```bash
# بررسی استفاده از منابع
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# افزایش منابع
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## منابع و مثال‌های اضافی
- [مثال میکروسرویس‌ها](./microservices/README.md)
- [مثال ساده Flash API](./simple-flask-api/README.md)
- [مستندات Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [گالری قالب‌های AZD](https://azure.github.io/awesome-azd/)
- [نمونه‌های Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [قالب‌های Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## مشارکت

برای افزودن مثال‌های جدید اپلیکیشن کانتینری:

1. یک زیرپوشه جدید با مثال خود ایجاد کنید
2. فایل‌های کامل `azure.yaml`، `infra/` و `src/` را شامل کنید
3. README جامع با دستورالعمل‌های استقرار اضافه کنید
4. استقرار را با `azd up` آزمایش کنید
5. یک درخواست pull ارسال کنید

---

**نیاز به کمک دارید؟** به جامعه [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) بپیوندید برای پشتیبانی و سوالات.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
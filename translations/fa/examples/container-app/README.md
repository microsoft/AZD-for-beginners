# نمونه‌های استقرار Container App با AZD

این دایرکتوری شامل مثال‌های جامع برای استقرار برنامه‌های کانتینری در Azure Container Apps با استفاده از Azure Developer CLI (AZD) است. این مثال‌ها الگوهای دنیای واقعی، بهترین رویه‌ها و پیکربندی‌های آماده تولید را نمایش می‌دهند.

## 📚 فهرست مطالب

- [مرور کلی](#overview)
- [پیش‌نیازها](#پیش‌نیازها)
- [مثال‌های شروع سریع](#مثال‌های-شروع-سریع)
- [مثال‌های تولیدی](#مثال‌های-تولیدی)
- [الگوهای پیشرفته](#الگوهای-پیشرفته)
- [بهترین رویه‌ها](#بهترین-رویه‌ها)

## Overview

Azure Container Apps یک پلتفرم کانتینری بدون‌سرور کاملاً مدیریت‌شده است که به شما امکان می‌دهد میکروسرویس‌ها و برنامه‌های کانتینری را بدون مدیریت زیرساخت اجرا کنید. وقتی با AZD ترکیب می‌شود، شما به موارد زیر دست می‌یابید:

- **استقرار ساده‌شده**: یک فرمان برای استقرار کانتینرها همراه با زیرساخت
- **مقیاس‌بندی خودکار**: مقیاس به صفر و مقیاس‌بندی بر اساس ترافیک HTTP یا رویدادها
- **شبکه‌بندی یکپارچه**: کشف سرویس و تقسیم ترافیک داخلی
- **هویت مدیریت‌شده**: احراز هویت امن به منابع Azure
- **بهینه‌سازی هزینه**: فقط برای منابعی که استفاده می‌کنید پرداخت کنید

## پیش‌نیازها

قبل از شروع، اطمینان حاصل کنید که دارید:

```bash
# نصب AZD را بررسی کنید
azd version

# Azure CLI را بررسی کنید
az version

# Docker را بررسی کنید (برای ساخت ایمیج‌های سفارشی)
docker --version

# برای استقرارهای AZD احراز هویت کنید
azd auth login

# اختیاری: اگر قصد دارید دستورات az را مستقیماً اجرا کنید، به Azure CLI وارد شوید
az login
```

**Required Azure Resources:**
- اشتراک Azure فعال
- مجوز ایجاد گروه منابع
- دسترسی به محیط Container Apps

## مثال‌های شروع سریع

### 1. API وب ساده (Python Flask)

یک API REST پایه را در Azure Container Apps مستقر کنید.

**مثال: API پایتون (Flask)**

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
# از قالب مقداردهی اولیه کنید
azd init --template todo-python-mongo

# زیرساخت را تأمین کرده و مستقر کنید
azd up

# استقرار را آزمایش کنید
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ویژگی‌های کلیدی:**
- مقیاس‌بندی خودکار از 0 تا 10 نمونه
- پروب‌های سلامت و بررسی‌های زنده‌بودن
- تزریق متغیرهای محیطی
- یکپارچه‌سازی با Application Insights

### 2. API Node.js با Express

یک بک‌اند Node.js با یکپارچه‌سازی MongoDB مستقر کنید.

```bash
# قالب API Node.js را مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo

# متغیرهای محیطی را پیکربندی کنید
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# استقرار
azd up

# مشاهده لاگ‌ها از طریق Azure Monitor
azd monitor --logs
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

### 3. فرانت‌اند ایستا + بک‌اند API

یک برنامه تمام‌پشته با فرانت‌اند React و بک‌اند API مستقر کنید.

```bash
# الگوی فول‌استک را مقداردهی اولیه کنید
azd init --template todo-csharp-sql-swa-func

# پیکربندی را بررسی کنید
cat azure.yaml

# هر دو سرویس را مستقر کنید
azd up

# برنامه را باز کنید
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## مثال‌های تولیدی

### مثال ۱: معماری میکروسرویس‌ها

**سناریو**: برنامه تجارت الکترونیک با چند میکروسرویس

**ساختار دایرکتوری:**
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

# تمام سرویس‌ها را مستقر کنید
azd up

# بر استقرار نظارت کنید
azd monitor --overview
```

### مثال ۲: برنامه Container App مجهز به هوش مصنوعی

**سناریو**: برنامه چت هوش مصنوعی با یکپارچه‌سازی Microsoft Foundry Models

**فایل: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# برای دسترسی امن از هویت مدیریت‌شده استفاده کنید
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
        model="gpt-4.1",
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

**دستورات استقرار:**
```bash
# راه‌اندازی محیط
azd init --template ai-chat-app
azd env new dev

# پیکربندی OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# استقرار
azd up

# تست API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### مثال ۳: کارگر پس‌زمینه با پردازش صف

**سناریو**: سیستم پردازش سفارش با صف پیام

**ساختار دایرکتوری:**
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
            
            # پیام کامل
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

# مقیاس‌دهی کارگر بر اساس طول صف
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## الگوهای پیشرفته

### الگو ۱: استقرار Blue-Green

```bash
# نسخه جدیدی بدون تخصیص ترافیک ایجاد کنید
azd deploy api --revision-suffix blue --no-traffic

# نسخه جدید را آزمایش کنید
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# ترافیک را تقسیم کنید (۲۰٪ به نسخه آبی، ۸۰٪ به نسخه جاری)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# انتقال کامل به نسخه آبی
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### الگو ۲: استقرار Canary با AZD

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

# استقرار نسخهٔ جدید با ۱۰٪ ترافیک
azd deploy api --revision-mode multiple

# معیارها را پایش کنید
azd monitor --service api --duration 5m

# ترافیک را به‌تدریج افزایش دهید
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # ۵ دقیقه صبر کنید
done
```

### الگو ۳: استقرار چندمنطقه‌ای

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
# در تمام مناطق مستقر کنید
azd up

# نقاط پایانی را بررسی کنید
azd show --output json | jq '.services.api.endpoints'
```

### الگو ۴: یکپارچه‌سازی Dapr

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

**کد برنامه با Dapr:**
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

## بهترین رویه‌ها

### ۱. سازماندهی منابع

```bash
# از قواعد نام‌گذاری سازگار استفاده کنید
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# برای پیگیری هزینه‌ها، منابع را برچسب‌گذاری کنید
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### ۲. بهترین رویه‌های امنیتی

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

### ۳. بهینه‌سازی عملکرد

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

### ۴. مانیتورینگ و قابلیت مشاهده

```bash
# Application Insights را فعال کنید
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# لاگ‌ها را به‌صورت زنده مشاهده کنید
azd monitor --logs
# یا از Azure CLI برای Container Apps استفاده کنید:
az containerapp logs show --name api --resource-group rg-myapp --follow

# بر معیارها نظارت کنید
azd monitor --live

# هشدارها را ایجاد کنید
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### ۵. بهینه‌سازی هزینه

```bash
# در صورت عدم استفاده مقیاس را به صفر برسانید
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# برای محیط‌های توسعه از نمونه‌های اسپات استفاده کنید
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# هشدارهای بودجه را تنظیم کنید
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### ۶. یکپارچه‌سازی CI/CD

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
# پروژهٔ جدید اپلیکیشن کانتینری را مقداردهی اولیه کنید
azd init --template <template-name>

# زیرساخت و برنامه را مستقر کنید
azd up

# فقط کد برنامه را مستقر کنید (از زیرساخت صرف‌نظر کنید)
azd deploy

# فقط زیرساخت را فراهم کنید
azd provision

# منابع مستقر شده را مشاهده کنید
azd show

# لاگ‌ها را با azd monitor یا Azure CLI به‌صورت زنده دنبال کنید
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# برنامه را پایش کنید
azd monitor --overview

# منابع را پاک‌سازی کنید
azd down --force --purge
```

## عیب‌یابی

### مشکل: کانتینر راه‌اندازی نمی‌شود

```bash
# لاگ‌ها را با استفاده از Azure CLI بررسی کنید
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# رویدادهای کانتینر را مشاهده کنید
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# به‌صورت محلی تست کنید
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### مشکل: نمی‌توان به نقطه انتهایی برنامه کانتینر دسترسی پیدا کرد

```bash
# پیکربندی اینگرس را بررسی کنید
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# بررسی کنید که آیا اینگرس داخلی فعال است
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### مشکل: مشکلات عملکرد

```bash
# مصرف منابع را بررسی کنید
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# منابع را افزایش دهید
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## منابع و مثال‌های اضافی
- [مثال میکروسرویس‌ها](./microservices/README.md)
- [مثال Simple Flash API](./simple-flask-api/README.md)
- [مستندات Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [گالری قالب‌های AZD](https://azure.github.io/awesome-azd/)
- [نمونه‌های Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [قالب‌های Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## مشارکت

برای مشارکت با مثال‌های جدید برنامه‌های کانتینری:

1. یک زیرشاخه جدید با مثال خود ایجاد کنید
2. فایل‌های کامل `azure.yaml`، `infra/` و `src/` را اضافه کنید
3. یک README جامع با دستورالعمل‌های استقرار اضافه کنید
4. استقرار را با `azd up` تست کنید
5. یک pull request ارسال کنید

---

**نیاز به کمک؟** برای پشتیبانی و سوالات به جامعه [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) بپیوندید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصل سند به زبان اصلی خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای و انسانی توصیه می‌شود. ما مسئول هیچ‌گونه سوءتفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
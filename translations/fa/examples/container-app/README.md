# نمونه‌های استقرار برنامه‌های کانتینری با AZD

این دایرکتوری حاوی مثال‌های جامعی برای استقرار برنامه‌های کانتینری در Azure Container Apps با استفاده از Azure Developer CLI (AZD) است. این مثال‌ها الگوهای دنیای واقعی، بهترین شیوه‌ها، و پیکربندی‌های آماده تولید را نشان می‌دهند.

## 📚 فهرست مطالب

- [مروری](#overview)
- [پیش‌نیازها](#prerequisites)
- [مثال‌های شروع سریع](#quick-start-examples)
- [نمونه‌های تولید](#production-examples)
- [الگوهای پیشرفته](#advanced-patterns)
- [بهترین شیوه‌ها](#best-practices)

## Overview

Azure Container Apps یک پلتفرم کانتینری بدون‌سرور کاملاً مدیریت‌شده است که به شما امکان می‌دهد میکروسرویس‌ها و برنامه‌های کانتینری شده را بدون مدیریت زیرساخت اجرا کنید. هنگامی که با AZD ترکیب می‌شود، شما دریافت می‌کنید:

- **استقرار ساده**: یک دستور، کانتینرها را همراه با زیرساخت مستقر می‌کند
- **مقیاس‌بندی خودکار**: مقیاس تا صفر و مقیاس‌دهی بر اساس ترافیک HTTP یا رویدادها
- **شبکه‌بندی یکپارچه**: کشف سرویس و تقسیم ترافیک داخلی
- **هویت مدیریتی**: احراز هویت امن به منابع Azure
- **بهینه‌سازی هزینه**: فقط برای منابعی که استفاده می‌کنید پرداخت کنید

## Prerequisites

قبل از شروع، مطمئن شوید که دارید:

```bash
# نصب AZD را بررسی کنید
azd version

# Azure CLI را بررسی کنید
az version

# Docker را بررسی کنید (برای ساخت ایمیج‌های سفارشی)
docker --version

# به Azure وارد شوید
azd auth login
az login
```

**Resources مورد نیاز در Azure:**
- اشتراک Azure فعال
- مجوزهای ایجاد گروه منابع
- دسترسی به محیط Container Apps

## Quick Start Examples

### 1. Simple Web API (Python Flask)

یک API REST پایه را با Azure Container Apps مستقر کنید.

**مثال: API پایتون Flask**

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
# از قالب مقداردهی اولیه
azd init --template todo-python-mongo

# تأمین زیرساخت و استقرار
azd up

# تست استقرار
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**ویژگی‌های کلیدی:**
- مقیاس‌بندی خودکار از 0 تا 10 نسخه
- پروب‌های سلامت و بررسی‌های liveness
- تزریق متغیرهای محیطی
- یکپارچه‌سازی Application Insights

### 2. Node.js Express API

یک بک‌اند Node.js را با یکپارچه‌سازی MongoDB مستقر کنید.

```bash
# قالب API Node.js را مقداردهی اولیه کنید
azd init --template todo-nodejs-mongo

# متغیرهای محیطی را پیکربندی کنید
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# استقرار
azd up

# لاگ‌ها را از طریق Azure Monitor مشاهده کنید
azd monitor --logs
```

**نکات کلیدی زیرساخت:**
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

### 3. Static Frontend + API Backend

یک برنامه فول‌استک با فرانت‌اند React و بک‌اند API مستقر کنید.

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

## Production Examples

### Example 1: Microservices Architecture

**سناریو**: برنامه تجارت الکترونیک با چندین میکروسرویس

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
# راه‌اندازی پروژه
azd init

# تنظیم محیط تولید
azd env new production

# پیکربندی تنظیمات تولید
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# استقرار تمام سرویس‌ها
azd up

# نظارت بر استقرار
azd monitor --overview
```

### Example 2: AI-Powered Container App

**سناریو**: برنامه چت هوش مصنوعی با یکپارچه‌سازی Microsoft Foundry Models

**File: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# برای دسترسی امن از شناسهٔ مدیریت‌شده استفاده کنید
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

**File: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**File: infra/main.bicep**
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

# آزمایش API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Example 3: Background Worker with Queue Processing

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

**File: src/worker/processor.py**
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

**File: azure.yaml**
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

## Advanced Patterns

### Pattern 1: Blue-Green Deployment

```bash
# ایجاد نسخهٔ جدید بدون ترافیک
azd deploy api --revision-suffix blue --no-traffic

# تست نسخهٔ جدید
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# تقسیم ترافیک (۲۰٪ به نسخهٔ آبی، ۸۰٪ به نسخهٔ فعلی)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# انتقال کامل به نسخهٔ آبی
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pattern 2: Canary Deployment with AZD

**File: .azure/dev/config.json**
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

# نسخهٔ جدید را با ۱۰٪ ترافیک مستقر کنید
azd deploy api --revision-mode multiple

# شاخص‌ها را پایش کنید
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

### Pattern 3: Multi-Region Deployment

**File: azure.yaml**
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

**File: infra/multi-region.bicep**
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
# در همه مناطق مستقر کنید
azd up

# نقاط پایانی را بررسی کنید
azd show --output json | jq '.services.api.endpoints'
```

### Pattern 4: Dapr Integration

**File: infra/app/dapr-enabled.bicep**
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

## Best Practices

### 1. Resource Organization

```bash
# از قراردادهای نام‌گذاری یکسان استفاده کنید
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# برای پیگیری هزینه‌ها منابع را برچسب‌گذاری کنید
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Security Best Practices

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

### 3. Performance Optimization

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

### 4. Monitoring and Observability

```bash
# Application Insights را فعال کنید
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# لاگ‌ها را به‌صورت بلادرنگ مشاهده کنید
azd monitor --logs
# یا از Azure CLI برای برنامه‌های کانتینری استفاده کنید:
az containerapp logs show --name api --resource-group rg-myapp --follow

# متریک‌ها را پایش کنید
azd monitor --live

# هشدارها را ایجاد کنید
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Cost Optimization

```bash
# در صورت عدم استفاده مقیاس را به صفر برسانید.
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# برای محیط‌های توسعه از نمونه‌های اسپات استفاده کنید.
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# هشدارهای بودجه را تنظیم کنید.
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Integration

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

## Common Commands Reference

```bash
# پروژهٔ جدید برنامهٔ کانتینری را راه‌اندازی کنید
azd init --template <template-name>

# زیرساخت و برنامه را مستقر کنید
azd up

# فقط کد برنامه را مستقر کنید (از استقرار زیرساخت صرف‌نظر کنید)
azd deploy

# فقط زیرساخت را فراهم کنید
azd provision

# مشاهدهٔ منابع مستقر شده
azd show

# نمایش زندهٔ لاگ‌ها با استفاده از azd monitor یا Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# نظارت بر برنامه
azd monitor --overview

# پاک‌سازی منابع
azd down --force --purge
```

## Troubleshooting

### Issue: Container fails to start

```bash
# با استفاده از Azure CLI لاگ‌ها را بررسی کنید
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# رویدادهای کانتینر را مشاهده کنید
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# به‌صورت محلی آزمایش کنید
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Issue: Can't access container app endpoint

```bash
# تأیید پیکربندی اینگرس
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# بررسی اینکه اینگرس داخلی فعال است یا خیر
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Issue: Performance problems

```bash
# بررسی میزان استفاده از منابع
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# افزایش ظرفیت منابع
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Additional Resources and Examples
- [مثال میکروسرویس‌ها](./microservices/README.md)
- [مثال API ساده Flask](./simple-flask-api/README.md)
- [مستندات Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [گالری قالب‌های AZD](https://azure.github.io/awesome-azd/)
- [نمونه‌های Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [قالب‌های Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

برای مشارکت با مثال‌های جدید برنامه کانتینری:

1. یک زیرپوشهٔ جدید با مثال خود ایجاد کنید
2. شامل فایل‌های کامل `azure.yaml`، `infra/` و `src/` باشید
3. README جامع با دستورالعمل‌های استقرار اضافه کنید
4. استقرار را با `azd up` تست کنید
5. یک pull request ارسال کنید

---

**نیاز به کمک؟** به جامعه [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) بپیوندید برای پشتیبانی و سوالات.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی اشتباهات یا نادرستی‌هایی باشند. سند اصلی به زبان مادری‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
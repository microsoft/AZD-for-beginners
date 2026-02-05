# أمثلة على نشر تطبيقات الحاويات باستخدام AZD

يحتوي هذا الدليل على أمثلة شاملة لنشر التطبيقات المعبأة في حاويات إلى Azure Container Apps باستخدام Azure Developer CLI (AZD). تعرض هذه الأمثلة أنماطًا واقعية، وأفضل الممارسات، وتكوينات جاهزة للإنتاج.

## 📚 جدول المحتويات

- [نظرة عامة](../../../../examples/container-app)
- [المتطلبات الأساسية](../../../../examples/container-app)
- [أمثلة البدء السريع](../../../../examples/container-app)
- [أمثلة الإنتاج](../../../../examples/container-app)
- [أنماط متقدمة](../../../../examples/container-app)
- [أفضل الممارسات](../../../../examples/container-app)

## نظرة عامة

Azure Container Apps هي منصة حاويات بدون خادم مُدارة بالكامل تتيح لك تشغيل الخدمات المصغرة والتطبيقات المعبأة في حاويات دون الحاجة إلى إدارة البنية التحتية. عند دمجها مع AZD، تحصل على:

- **نشر مبسط**: أمر واحد لنشر الحاويات مع البنية التحتية
- **التوسع التلقائي**: التوسع إلى الصفر أو التوسع بناءً على حركة HTTP أو الأحداث
- **شبكات متكاملة**: اكتشاف الخدمات المدمج وتقسيم حركة المرور
- **هوية مُدارة**: مصادقة آمنة للوصول إلى موارد Azure
- **تحسين التكلفة**: الدفع فقط مقابل الموارد المستخدمة

## المتطلبات الأساسية

قبل البدء، تأكد من توفر:

```bash
# تحقق من تثبيت AZD
azd version

# تحقق من Azure CLI
az version

# تحقق من Docker (لبناء الصور المخصصة)
docker --version

# تسجيل الدخول إلى Azure
azd auth login
az login
```

**الموارد المطلوبة في Azure:**
- اشتراك Azure نشط
- أذونات لإنشاء مجموعة موارد
- الوصول إلى بيئة تطبيقات الحاويات

## أمثلة البدء السريع

### 1. واجهة برمجة تطبيقات ويب بسيطة (Python Flask)

نشر واجهة برمجة تطبيقات REST الأساسية باستخدام Azure Container Apps.

**مثال: واجهة برمجة تطبيقات Python Flask**

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

**خطوات النشر:**

```bash
# التهيئة من القالب
azd init --template todo-python-mongo

# توفير البنية التحتية والنشر
azd up

# اختبار النشر
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**الميزات الرئيسية:**
- التوسع التلقائي من 0 إلى 10 نسخ
- فحص الصحة وفحص الحياة
- حقن متغيرات البيئة
- تكامل مع Application Insights

### 2. واجهة برمجة تطبيقات Node.js Express

نشر واجهة خلفية Node.js مع تكامل MongoDB.

```bash
# تهيئة قالب واجهة برمجة تطبيقات Node.js
azd init --template todo-nodejs-mongo

# تكوين متغيرات البيئة
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# نشر
azd up

# عرض السجلات
azd logs api
```

**أبرز ملامح البنية التحتية:**
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

### 3. واجهة أمامية ثابتة + واجهة خلفية API

نشر تطبيق كامل مع واجهة أمامية React وواجهة خلفية API.

```bash
# تهيئة قالب كامل المكدس
azd init --template todo-csharp-sql-swa-func

# مراجعة التكوين
cat azure.yaml

# نشر كلا الخدمتين
azd up

# فتح التطبيق
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## أمثلة الإنتاج

### المثال 1: بنية الخدمات المصغرة

**السيناريو**: تطبيق تجارة إلكترونية مع خدمات مصغرة متعددة

**هيكل الدليل:**
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

**تكوين azure.yaml:**
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

**النشر:**
```bash
# بدء المشروع
azd init

# إعداد بيئة الإنتاج
azd env new production

# تكوين إعدادات الإنتاج
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# نشر جميع الخدمات
azd up

# مراقبة النشر
azd monitor --overview
```

### المثال 2: تطبيق حاوية مدعوم بالذكاء الاصطناعي

**السيناريو**: تطبيق دردشة بالذكاء الاصطناعي مع تكامل Azure OpenAI

**الملف: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# استخدم الهوية المُدارة للوصول الآمن
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # احصل على مفتاح OpenAI من مخزن المفاتيح
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

**الملف: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**الملف: infra/main.bicep**
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

**أوامر النشر:**
```bash
# إعداد البيئة
azd init --template ai-chat-app
azd env new dev

# تكوين OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# النشر
azd up

# اختبار واجهة برمجة التطبيقات
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### المثال 3: عامل خلفية مع معالجة قائمة الانتظار

**السيناريو**: نظام معالجة الطلبات مع قائمة انتظار الرسائل

**هيكل الدليل:**
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

**الملف: src/worker/processor.py**
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
            # معالجة الطلب
            print(f"Processing order: {message.content}")
            
            # إكمال الرسالة
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**الملف: azure.yaml**
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

**النشر:**
```bash
# تهيئة
azd init

# نشر مع تكوين قائمة الانتظار
azd up

# توسيع العامل بناءً على طول قائمة الانتظار
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## أنماط متقدمة

### النمط 1: النشر الأزرق-الأخضر

```bash
# إنشاء إصدار جديد بدون حركة مرور
azd deploy api --revision-suffix blue --no-traffic

# اختبار الإصدار الجديد
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# تقسيم حركة المرور (20% إلى الأزرق، 80% إلى الحالي)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# تحويل كامل إلى الأزرق
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### النمط 2: النشر الكاناري باستخدام AZD

**الملف: .azure/dev/config.json**
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

**سكريبت النشر:**
```bash
#!/bin/bash
# deploy-canary.sh

# نشر الإصدار الجديد مع 10% من حركة المرور
azd deploy api --revision-mode multiple

# مراقبة المقاييس
azd monitor --service api --duration 5m

# زيادة حركة المرور تدريجياً
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # انتظر 5 دقائق
done
```

### النمط 3: النشر متعدد المناطق

**الملف: azure.yaml**
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

**الملف: infra/multi-region.bicep**
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

**النشر:**
```bash
# النشر في جميع المناطق
azd up

# التحقق من نقاط النهاية
azd show --output json | jq '.services.api.endpoints'
```

### النمط 4: تكامل Dapr

**الملف: infra/app/dapr-enabled.bicep**
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

**كود التطبيق مع Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # حفظ الحالة
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # نشر الحدث
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## أفضل الممارسات

### 1. تنظيم الموارد

```bash
# استخدم تسميات متسقة
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ضع علامات على الموارد لتتبع التكاليف
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. أفضل ممارسات الأمان

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

### 3. تحسين الأداء

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

### 4. المراقبة والرصد

```bash
# تمكين رؤى التطبيق
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# عرض السجلات في الوقت الفعلي
azd logs api --follow

# مراقبة المقاييس
azd monitor --service api

# إنشاء التنبيهات
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. تحسين التكلفة

```bash
# قم بالتوسيع إلى الصفر عند عدم الاستخدام
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# استخدم مثيلات مؤقتة لبيئات التطوير
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# قم بإعداد تنبيهات الميزانية
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. تكامل CI/CD

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

## مرجع الأوامر الشائعة

```bash
# تهيئة مشروع تطبيق الحاوية الجديد
azd init --template <template-name>

# نشر البنية التحتية والتطبيق
azd up

# نشر كود التطبيق فقط (تخطي البنية التحتية)
azd deploy

# توفير البنية التحتية فقط
azd provision

# عرض الموارد المنشورة
azd show

# بث السجلات
azd logs <service-name> --follow

# مراقبة التطبيق
azd monitor --overview

# تنظيف الموارد
azd down --force --purge
```

## استكشاف الأخطاء وإصلاحها

### المشكلة: فشل بدء تشغيل الحاوية

```bash
# تحقق من السجلات
azd logs api --tail 100

# عرض أحداث الحاوية
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# اختبار محليًا
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### المشكلة: لا يمكن الوصول إلى نقطة نهاية تطبيق الحاوية

```bash
# تحقق من تكوين الدخول
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# تحقق مما إذا كان الدخول الداخلي مفعلاً
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### المشكلة: مشاكل الأداء

```bash
# تحقق من استخدام الموارد
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# قم بتوسيع الموارد
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## موارد وأمثلة إضافية
- [مثال الخدمات المصغرة](./microservices/README.md)
- [مثال واجهة برمجة تطبيقات Flash البسيطة](./simple-flask-api/README.md)
- [وثائق Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [معرض قوالب AZD](https://azure.github.io/awesome-azd/)
- [أمثلة تطبيقات الحاويات](https://github.com/Azure-Samples/container-apps-samples)
- [قوالب Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## المساهمة

للمساهمة بأمثلة جديدة لتطبيقات الحاويات:

1. قم بإنشاء دليل فرعي جديد يحتوي على المثال الخاص بك
2. قم بتضمين ملفات `azure.yaml`، `infra/`، و `src/` كاملة
3. أضف ملف README شامل مع تعليمات النشر
4. اختبر النشر باستخدام `azd up`
5. قدم طلب سحب

---

**تحتاج إلى مساعدة؟** انضم إلى مجتمع [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) للحصول على الدعم والأسئلة.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
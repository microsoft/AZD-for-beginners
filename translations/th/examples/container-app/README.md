<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-21T09:37:52+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "th"
}
-->
# ตัวอย่างการปรับใช้แอป Container ด้วย AZD

ไดเรกทอรีนี้มีตัวอย่างที่ครอบคลุมสำหรับการปรับใช้แอปพลิเคชันที่อยู่ในรูปแบบคอนเทนเนอร์ไปยัง Azure Container Apps โดยใช้ Azure Developer CLI (AZD) ตัวอย่างเหล่านี้แสดงรูปแบบการใช้งานจริง แนวทางปฏิบัติที่ดีที่สุด และการตั้งค่าที่พร้อมใช้งานในระดับการผลิต

## 📚 สารบัญ

- [ภาพรวม](../../../../examples/container-app)
- [ข้อกำหนดเบื้องต้น](../../../../examples/container-app)
- [ตัวอย่างเริ่มต้นอย่างรวดเร็ว](../../../../examples/container-app)
- [ตัวอย่างสำหรับการผลิต](../../../../examples/container-app)
- [รูปแบบขั้นสูง](../../../../examples/container-app)
- [แนวทางปฏิบัติที่ดีที่สุด](../../../../examples/container-app)

## ภาพรวม

Azure Container Apps เป็นแพลตฟอร์มคอนเทนเนอร์แบบเซิร์ฟเวอร์เลสที่มีการจัดการเต็มรูปแบบ ซึ่งช่วยให้คุณสามารถรันไมโครเซอร์วิสและแอปพลิเคชันที่อยู่ในรูปแบบคอนเทนเนอร์ได้โดยไม่ต้องจัดการโครงสร้างพื้นฐาน เมื่อใช้งานร่วมกับ AZD คุณจะได้รับ:

- **การปรับใช้งานที่ง่ายขึ้น**: คำสั่งเดียวสำหรับการปรับใช้คอนเทนเนอร์พร้อมโครงสร้างพื้นฐาน
- **การปรับขนาดอัตโนมัติ**: ปรับขนาดเป็นศูนย์และขยายออกตามทราฟฟิก HTTP หรือเหตุการณ์
- **เครือข่ายแบบบูรณาการ**: การค้นหาบริการและการแบ่งทราฟฟิกในตัว
- **Managed Identity**: การรับรองความปลอดภัยไปยังทรัพยากร Azure
- **การเพิ่มประสิทธิภาพค่าใช้จ่าย**: จ่ายเฉพาะทรัพยากรที่คุณใช้

## ข้อกำหนดเบื้องต้น

ก่อนเริ่มต้น ตรวจสอบให้แน่ใจว่าคุณมี:

```bash
# ตรวจสอบการติดตั้ง AZD
azd version

# ตรวจสอบ Azure CLI
az version

# ตรวจสอบ Docker (สำหรับการสร้างภาพแบบกำหนดเอง)
docker --version

# เข้าสู่ระบบ Azure
azd auth login
az login
```

**ทรัพยากร Azure ที่จำเป็น:**
- การสมัครใช้งาน Azure ที่ใช้งานอยู่
- สิทธิ์ในการสร้าง Resource Group
- การเข้าถึงสภาพแวดล้อม Container Apps

## ตัวอย่างเริ่มต้นอย่างรวดเร็ว

### 1. Web API แบบง่าย (Python Flask)

ปรับใช้ REST API พื้นฐานด้วย Azure Container Apps

**ตัวอย่าง: Python Flask API**

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

**ขั้นตอนการปรับใช้:**

```bash
# เริ่มต้นจากเทมเพลต
azd init --template todo-python-mongo

# จัดเตรียมโครงสร้างพื้นฐานและปรับใช้
azd up

# ทดสอบการปรับใช้
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**คุณสมบัติหลัก:**
- การปรับขนาดอัตโนมัติจาก 0 ถึง 10 replicas
- การตรวจสอบสุขภาพและการตรวจสอบการทำงาน
- การฉีดตัวแปรสภาพแวดล้อม
- การรวม Application Insights

### 2. Node.js Express API

ปรับใช้แบ็กเอนด์ Node.js พร้อมการรวม MongoDB

```bash
# เริ่มต้นเทมเพลต API ของ Node.js
azd init --template todo-nodejs-mongo

# กำหนดค่าตัวแปรสภาพแวดล้อม
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ปรับใช้
azd up

# ดูบันทึก
azd logs api
```

**ไฮไลต์โครงสร้างพื้นฐาน:**
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

### 3. Frontend แบบ Static + Backend API

ปรับใช้แอปพลิเคชันแบบเต็มรูปแบบที่มี React frontend และ API backend

```bash
# เริ่มต้นเทมเพลตแบบเต็มสแต็ก
azd init --template todo-csharp-sql-swa-func

# ตรวจสอบการกำหนดค่า
cat azure.yaml

# ปรับใช้บริการทั้งสอง
azd up

# เปิดแอปพลิเคชัน
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ตัวอย่างสำหรับการผลิต

### ตัวอย่างที่ 1: สถาปัตยกรรม Microservices

**สถานการณ์**: แอปพลิเคชันอีคอมเมิร์ซที่มีไมโครเซอร์วิสหลายตัว

**โครงสร้างไดเรกทอรี:**
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

**การตั้งค่า azure.yaml:**
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

**การปรับใช้:**
```bash
# เริ่มต้นโครงการ
azd init

# ตั้งค่าสภาพแวดล้อมการผลิต
azd env new production

# กำหนดค่าการตั้งค่าการผลิต
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ปรับใช้บริการทั้งหมด
azd up

# ตรวจสอบการปรับใช้
azd monitor --overview
```

### ตัวอย่างที่ 2: แอป Container ที่ขับเคลื่อนด้วย AI

**สถานการณ์**: แอปแชท AI ที่รวม Azure OpenAI

**ไฟล์: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# ใช้ Managed Identity เพื่อการเข้าถึงที่ปลอดภัย
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # รับคีย์ OpenAI จาก Key Vault
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

**ไฟล์: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**ไฟล์: infra/main.bicep**
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

**คำสั่งปรับใช้:**
```bash
# ตั้งค่าสภาพแวดล้อม
azd init --template ai-chat-app
azd env new dev

# กำหนดค่า OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# ปรับใช้
azd up

# ทดสอบ API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ตัวอย่างที่ 3: Worker เบื้องหลังพร้อมการประมวลผลคิว

**สถานการณ์**: ระบบประมวลผลคำสั่งซื้อพร้อมคิวข้อความ

**โครงสร้างไดเรกทอรี:**
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

**ไฟล์: src/worker/processor.py**
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
            # ดำเนินการคำสั่งซื้อ
            print(f"Processing order: {message.content}")
            
            # ข้อความเสร็จสมบูรณ์
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**ไฟล์: azure.yaml**
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

**การปรับใช้:**
```bash
# เริ่มต้น
azd init

# ปรับใช้ด้วยการกำหนดค่าคิว
azd up

# ปรับขนาดตัวประมวลผลตามความยาวของคิว
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## รูปแบบขั้นสูง

### รูปแบบที่ 1: การปรับใช้แบบ Blue-Green

```bash
# สร้างการแก้ไขใหม่โดยไม่มีทราฟฟิก
azd deploy api --revision-suffix blue --no-traffic

# ทดสอบการแก้ไขใหม่
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# แบ่งทราฟฟิก (20% ไปที่สีน้ำเงิน, 80% ไปที่ปัจจุบัน)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# เปลี่ยนไปใช้สีน้ำเงินทั้งหมด
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### รูปแบบที่ 2: การปรับใช้แบบ Canary ด้วย AZD

**ไฟล์: .azure/dev/config.json**
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

**สคริปต์การปรับใช้:**
```bash
#!/bin/bash
# deploy-canary.sh

# ปรับใช้การแก้ไขใหม่ด้วยทราฟฟิก 10%
azd deploy api --revision-mode multiple

# ตรวจสอบเมตริก
azd monitor --service api --duration 5m

# เพิ่มทราฟฟิกทีละน้อย
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # รอ 5 นาที
done
```

### รูปแบบที่ 3: การปรับใช้หลายภูมิภาค

**ไฟล์: azure.yaml**
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

**ไฟล์: infra/multi-region.bicep**
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

**การปรับใช้:**
```bash
# ปรับใช้ไปยังทุกภูมิภาค
azd up

# ตรวจสอบจุดเชื่อมต่อ
azd show --output json | jq '.services.api.endpoints'
```

### รูปแบบที่ 4: การรวม Dapr

**ไฟล์: infra/app/dapr-enabled.bicep**
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

**โค้ดแอปพลิเคชันพร้อม Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # บันทึกสถานะ
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # เผยแพร่เหตุการณ์
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## แนวทางปฏิบัติที่ดีที่สุด

### 1. การจัดระเบียบทรัพยากร

```bash
# ใช้การตั้งชื่อที่สอดคล้องกัน
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# แท็กทรัพยากรสำหรับการติดตามค่าใช้จ่าย
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. แนวทางปฏิบัติด้านความปลอดภัย

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

### 3. การเพิ่มประสิทธิภาพการทำงาน

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

### 4. การตรวจสอบและการสังเกตการณ์

```bash
# เปิดใช้งาน Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ดูบันทึกแบบเรียลไทม์
azd logs api --follow

# ตรวจสอบเมตริก
azd monitor --service api

# สร้างการแจ้งเตือน
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. การเพิ่มประสิทธิภาพค่าใช้จ่าย

```bash
# ปรับขนาดเป็นศูนย์เมื่อไม่ได้ใช้งาน
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# ใช้ spot instances สำหรับสภาพแวดล้อมการพัฒนา
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ตั้งค่าการแจ้งเตือนงบประมาณ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. การรวม CI/CD

**ตัวอย่าง GitHub Actions:**
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

## อ้างอิงคำสั่งทั่วไป

```bash
# เริ่มต้นโครงการแอปพลิเคชันคอนเทนเนอร์ใหม่
azd init --template <template-name>

# ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# ปรับใช้เฉพาะโค้ดแอปพลิเคชัน (ข้ามโครงสร้างพื้นฐาน)
azd deploy

# จัดเตรียมเฉพาะโครงสร้างพื้นฐาน
azd provision

# ดูทรัพยากรที่ปรับใช้แล้ว
azd show

# สตรีมบันทึก
azd logs <service-name> --follow

# ตรวจสอบแอปพลิเคชัน
azd monitor --overview

# ล้างทรัพยากร
azd down --force --purge
```

## การแก้ไขปัญหา

### ปัญหา: Container ไม่สามารถเริ่มต้นได้

```bash
# ตรวจสอบบันทึก
azd logs api --tail 100

# ดูเหตุการณ์ของคอนเทนเนอร์
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ทดสอบในเครื่อง
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ปัญหา: ไม่สามารถเข้าถึง endpoint ของ Container App

```bash
# ตรวจสอบการตั้งค่าการเข้าถึง
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ตรวจสอบว่าการเข้าถึงภายในถูกเปิดใช้งาน
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ปัญหา: ปัญหาด้านประสิทธิภาพ

```bash
# ตรวจสอบการใช้ทรัพยากร
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# เพิ่มทรัพยากร
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## แหล่งข้อมูลและตัวอย่างเพิ่มเติม
- [ตัวอย่าง Microservices](./microservices/README.md)
- [ตัวอย่าง Flash API แบบง่าย](./simple-flask-api/README.md)
- [เอกสาร Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [แกลเลอรี AZD Templates](https://azure.github.io/awesome-azd/)
- [ตัวอย่าง Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Templates](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## การมีส่วนร่วม

หากต้องการเพิ่มตัวอย่างแอป Container ใหม่:

1. สร้างไดเรกทอรีย่อยใหม่พร้อมตัวอย่างของคุณ
2. รวมไฟล์ `azure.yaml`, `infra/`, และ `src/` อย่างครบถ้วน
3. เพิ่ม README ที่ครอบคลุมพร้อมคำแนะนำการปรับใช้
4. ทดสอบการปรับใช้ด้วย `azd up`
5. ส่ง pull request

---

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชน [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) เพื่อรับการสนับสนุนและคำถาม

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
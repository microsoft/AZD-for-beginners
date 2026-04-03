# ตัวอย่างการปรับใช้ Container App ด้วย AZD

ไดเรกทอรีนี้ประกอบด้วยตัวอย่างที่ครอบคลุมสำหรับการปรับใช้แอปพลิเคชันที่บรรจุในคอนเทนเนอร์ไปยัง Azure Container Apps โดยใช้ Azure Developer CLI (AZD) ตัวอย่างเหล่านี้แสดงรูปแบบในโลกจริง, แนวทางปฏิบัติที่ดีที่สุด และการกำหนดค่าที่พร้อมสำหรับการใช้งานจริง

## 📚 สารบัญ

- [ภาพรวม](#ภาพรวม)
- [ข้อกำหนดเบื้องต้น](#ข้อกำหนดเบื้องต้น)
- [ตัวอย่างเริ่มต้นด่วน](#ตัวอย่างเริ่มต้นด่วน)
- [ตัวอย่างสำหรับการผลิต](#ตัวอย่างสำหรับการผลิต)
- [รูปแบบขั้นสูง](#รูปแบบขั้นสูง)
- [แนวทางปฏิบัติที่ดีที่สุด](#แนวทางปฏิบัติที่ดีที่สุด)

## ภาพรวม

Azure Container Apps เป็นแพลตฟอร์มคอนเทนเนอร์แบบไม่ต้องจัดการเซิร์ฟเวอร์ที่ช่วยให้คุณเรียกใช้ไมโครเซอร์วิสและแอปพลิเคชันที่บรรจุในคอนเทนเนอร์โดยไม่ต้องจัดการโครงสร้างพื้นฐาน เมื่อรวมกับ AZD คุณจะได้รับ:

- **การปรับใช้ที่ง่ายขึ้น**: คำสั่งเดียวปรับใช้คอนเทนเนอร์พร้อมโครงสร้างพื้นฐาน
- **การปรับขนาดอัตโนมัติ**: ปรับขนาดเป็น 0 และขยายตามปริมาณการใช้งาน HTTP หรือเหตุการณ์
- **เครือข่ายแบบบูรณาการ**: การค้นหาเซอร์วิสและแยกทราฟฟิกในตัว
- **Managed Identity**: การตรวจสอบสิทธิ์ที่ปลอดภัยไปยังทรัพยากร Azure
- **การเพิ่มประสิทธิภาพค่าใช้จ่าย**: ชำระเฉพาะทรัพยากรที่คุณใช้

## ข้อกำหนดเบื้องต้น

ก่อนเริ่มต้น โปรดตรวจสอบว่าคุณมี:

```bash
# ตรวจสอบการติดตั้ง AZD
azd version

# ตรวจสอบ Azure CLI
az version

# ตรวจสอบ Docker (สำหรับสร้างอิมเมจที่กำหนดเอง)
docker --version

# ยืนยันตัวตนสำหรับการปรับใช้ด้วย AZD
azd auth login

# ตัวเลือก: ลงชื่อเข้าใช้ Azure CLI หากคุณวางแผนที่จะรันคำสั่ง az โดยตรง
az login
```

**ทรัพยากร Azure ที่จำเป็น:**
- การสมัครใช้งาน Azure ที่ใช้งานอยู่
- สิทธิ์ในการสร้างกลุ่มทรัพยากร
- การเข้าถึงสภาพแวดล้อม Container Apps

## ตัวอย่างเริ่มต้นด่วน

### 1. เว็บ API ง่าย ๆ (Python Flask)

ปรับใช้ REST API ขั้นพื้นฐานด้วย Azure Container Apps

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
# เริ่มต้นจากแม่แบบ
azd init --template todo-python-mongo

# จัดเตรียมโครงสร้างพื้นฐานและปรับใช้
azd up

# ทดสอบการปรับใช้
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**คุณสมบัติหลัก:**
- ปรับขนาดอัตโนมัติจาก 0 ถึง 10 รีพลิกา
- การตรวจสอบสุขภาพและการตรวจสอบสถานะการมีชีวิต
- การฉีดตัวแปรสภาพแวดล้อม
- การผสานรวม Application Insights

### 2. Node.js Express API

ปรับใช้แบ็กเอนด์ Node.js พร้อมการผสาน MongoDB

```bash
# เริ่มต้นเทมเพลต Node.js API
azd init --template todo-nodejs-mongo

# กำหนดค่าตัวแปรแวดล้อม
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# ดีพลอย
azd up

# ดูบันทึกผ่าน Azure Monitor
azd monitor --logs
```

**ไฮไลท์โครงสร้างพื้นฐาน:**
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

ปรับใช้แอปพลิเคชันแบบฟูลสแต็กด้วย React frontend และ API backend

```bash
# เริ่มต้นแม่แบบฟูลสแตก
azd init --template todo-csharp-sql-swa-func

# ตรวจสอบการตั้งค่า
cat azure.yaml

# ปล่อยบริการทั้งสอง
azd up

# เปิดแอปพลิเคชัน
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## ตัวอย่างสำหรับการผลิต

### ตัวอย่างที่ 1: สถาปัตยกรรมไมโครเซอร์วิส

**สถานการณ์**: แอปอีคอมเมิร์ซที่มีไมโครเซอร์วิสหลายตัว

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

**การกำหนดค่า azure.yaml:**
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

# ตั้งค่าสภาพแวดล้อมสำหรับการผลิต
azd env new production

# กำหนดค่าการตั้งค่าการผลิต
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# ปล่อยบริการทั้งหมด
azd up

# ตรวจสอบการปล่อยใช้งาน
azd monitor --overview
```

### ตัวอย่างที่ 2: แอป Container ด้วย AI

**สถานการณ์**: แอปแชท AI พร้อมการผสาน Microsoft Foundry Models

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
    
    # ดึงคีย์ OpenAI จาก Key Vault
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

**คำสั่งการปรับใช้:**
```bash
# ตั้งค่าสภาพแวดล้อม
azd init --template ai-chat-app
azd env new dev

# กำหนดค่า OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# ติดตั้งใช้งาน
azd up

# ทดสอบ API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### ตัวอย่างที่ 3: พนักงานหลังบ้านกับการประมวลผลคิว

**สถานการณ์**: ระบบประมวลผลคำสั่งพร้อมคิวข้อความ

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
            # ประมวลผลคำสั่งซื้อ
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

# เปิดใช้งานด้วยการตั้งค่าคิว
azd up

# ปรับขนาดพนักงานตามความยาวของคิว
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
# สร้างรีวิชันใหม่โดยไม่มีทราฟฟิก
azd deploy api --revision-suffix blue --no-traffic

# ทดสอบรีวิชันใหม่
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# แบ่งทราฟฟิก (20% ไปที่บลู, 80% ไปที่ปัจจุบัน)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# สลับทั้งหมดไปที่บลู
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### รูปแบบที่ 2: การปรับใช้ Canary ด้วย AZD

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

# ปล่อยรีวิชันใหม่พร้อมกับทราฟฟิก 10%
azd deploy api --revision-mode multiple

# เฝ้าระวังเมตริก
azd monitor --service api --duration 5m

# เพิ่มทราฟฟิกอย่างค่อยเป็นค่อยไป
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
# นำไปใช้ในทุกภูมิภาค
azd up

# ตรวจสอบจุดสิ้นสุด
azd show --output json | jq '.services.api.endpoints'
```

### รูปแบบที่ 4: การผสาน Dapr

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
# ใช้รูปแบบการตั้งชื่อที่สอดคล้องกัน
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# ติดแท็กรายการทรัพยากรเพื่อการติดตามต้นทุน
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

### 3. การเพิ่มประสิทธิภาพประสิทธิภาพ

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

### 4. การตรวจสอบและสังเกตการณ์

```bash
# เปิดใช้งาน Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# ดูบันทึกแบบเรียลไทม์
azd monitor --logs
# หรือใช้ Azure CLI สำหรับ Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ตรวจสอบเมตริก
azd monitor --live

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

# ใช้ spot instances สำหรับสภาพแวดล้อมพัฒนา
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# ตั้งค่าการแจ้งเตือนงบประมาณ
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. การผสาน CI/CD

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

## คำสั่งทั่วไปอ้างอิง

```bash
# เริ่มโปรเจกต์แอปคอนเทนเนอร์ใหม่
azd init --template <template-name>

# ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# ปรับใช้เฉพาะโค้ดแอปพลิเคชัน (ข้ามโครงสร้างพื้นฐาน)
azd deploy

# จัดเตรียมโครงสร้างพื้นฐานเท่านั้น
azd provision

# ดูทรัพยากรที่ปรับใช้แล้ว
azd show

# สตรีมล็อกโดยใช้ azd monitor หรือ Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# ตรวจสอบแอปพลิเคชัน
azd monitor --overview

# ลบทรัพยากรที่ไม่ใช้งานแล้ว
azd down --force --purge
```

## การแก้ไขปัญหา

### ปัญหา: คอนเทนเนอร์ไม่สามารถเริ่มต้นได้

```bash
# ตรวจสอบบันทึกโดยใช้ Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# ดูเหตุการณ์ของคอนเทนเนอร์
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# ทดสอบในเครื่อง
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### ปัญหา: ไม่สามารถเข้าถึงจุดสิ้นสุดของแอปคอนเทนเนอร์ได้

```bash
# ตรวจสอบการกำหนดค่า ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# ตรวจสอบว่าการใช้งาน internal ingress เปิดใช้งานหรือไม่
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### ปัญหา: ปัญหาประสิทธิภาพ

```bash
# ตรวจสอบการใช้ทรัพยากร
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ขยายทรัพยากรขึ้น
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## ทรัพยากรและตัวอย่างเพิ่มเติม
- [ตัวอย่างไมโครเซอร์วิส](./microservices/README.md)
- [ตัวอย่าง Simple Flash API](./simple-flask-api/README.md)
- [เอกสาร Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [แกลเลอรีเทมเพลต AZD](https://azure.github.io/awesome-azd/)
- [ตัวอย่าง Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [เทมเพลต Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## การมีส่วนร่วม

เพื่อมีส่วนร่วมในตัวอย่างแอปคอนเทนเนอร์ใหม่:

1. สร้างไดเรกทอรีย่อยใหม่พร้อมตัวอย่างของคุณ
2. รวมไฟล์ `azure.yaml`, `infra/` และ `src/` อย่างครบถ้วน
3. เพิ่ม README ที่ครอบคลุมพร้อมคำแนะนำการปรับใช้
4. ทดสอบการปรับใช้ด้วย `azd up`
5. ส่งคำร้องขอดึง

---

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชน [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) สำหรับการสนับสนุนและคำถาม

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิด**:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาดั้งเดิมถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้การแปลโดยมืออาชีพที่เป็นมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
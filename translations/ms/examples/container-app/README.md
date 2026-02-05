# Contoh Penerapan Aplikasi Kontena dengan AZD

Direktori ini mengandungi contoh lengkap untuk menerapkan aplikasi yang telah dikontena ke Azure Container Apps menggunakan Azure Developer CLI (AZD). Contoh-contoh ini menunjukkan corak dunia nyata, amalan terbaik, dan konfigurasi yang sedia untuk produksi.

## 📚 Kandungan

- [Pengenalan](../../../../examples/container-app)
- [Prasyarat](../../../../examples/container-app)
- [Contoh Permulaan Cepat](../../../../examples/container-app)
- [Contoh Produksi](../../../../examples/container-app)
- [Corak Lanjutan](../../../../examples/container-app)
- [Amalan Terbaik](../../../../examples/container-app)

## Pengenalan

Azure Container Apps adalah platform kontena tanpa pelayan yang diurus sepenuhnya, yang membolehkan anda menjalankan perkhidmatan mikro dan aplikasi yang telah dikontena tanpa perlu mengurus infrastruktur. Apabila digabungkan dengan AZD, anda mendapat:

- **Penerapan Dipermudahkan**: Perintah tunggal untuk menerapkan kontena bersama infrastruktur
- **Penskalaan Automatik**: Penskalaan ke sifar dan penskalaan keluar berdasarkan trafik HTTP atau acara
- **Rangkaian Terintegrasi**: Penemuan perkhidmatan terbina dalam dan pembahagian trafik
- **Identiti Terurus**: Pengesahan selamat ke sumber Azure
- **Pengoptimuman Kos**: Bayar hanya untuk sumber yang digunakan

## Prasyarat

Sebelum memulakan, pastikan anda mempunyai:

```bash
# Periksa pemasangan AZD
azd version

# Periksa Azure CLI
az version

# Periksa Docker (untuk membina imej tersuai)
docker --version

# Log masuk ke Azure
azd auth login
az login
```

**Sumber Azure Diperlukan:**
- Langganan Azure yang aktif
- Kebenaran untuk mencipta kumpulan sumber
- Akses ke persekitaran Container Apps

## Contoh Permulaan Cepat

### 1. API Web Mudah (Python Flask)

Terapkan REST API asas dengan Azure Container Apps.

**Contoh: API Python Flask**

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

**Langkah Penerapan:**

```bash
# Mulakan dari templat
azd init --template todo-python-mongo

# Sediakan infrastruktur dan laksanakan
azd up

# Uji pelaksanaan
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ciri Utama:**
- Penskalaan automatik dari 0 ke 10 replika
- Pemeriksaan kesihatan dan liveness
- Suntikan pembolehubah persekitaran
- Integrasi Application Insights

### 2. API Node.js Express

Terapkan backend Node.js dengan integrasi MongoDB.

```bash
# Inisialisasi templat API Node.js
azd init --template todo-nodejs-mongo

# Konfigurasikan pembolehubah persekitaran
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Laksanakan
azd up

# Lihat log
azd logs api
```

**Sorotan Infrastruktur:**
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

### 3. Frontend Statik + Backend API

Terapkan aplikasi full-stack dengan frontend React dan backend API.

```bash
# Mulakan templat full-stack
azd init --template todo-csharp-sql-swa-func

# Semak konfigurasi
cat azure.yaml

# Sebarkan kedua-dua perkhidmatan
azd up

# Buka aplikasi
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Contoh Produksi

### Contoh 1: Seni Bina Perkhidmatan Mikro

**Senario**: Aplikasi e-dagang dengan pelbagai perkhidmatan mikro

**Struktur Direktori:**
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

**Konfigurasi azure.yaml:**
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

**Penerapan:**
```bash
# Mulakan projek
azd init

# Tetapkan persekitaran pengeluaran
azd env new production

# Konfigurasikan tetapan pengeluaran
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Sebarkan semua perkhidmatan
azd up

# Pantau penyebaran
azd monitor --overview
```

### Contoh 2: Aplikasi Kontena Berkuasa AI

**Senario**: Aplikasi sembang AI dengan integrasi Azure OpenAI

**Fail: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Gunakan Identiti Terurus untuk akses yang selamat
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Dapatkan kunci OpenAI dari Key Vault
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

**Fail: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Fail: infra/main.bicep**
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

**Perintah Penerapan:**
```bash
# Tetapkan persekitaran
azd init --template ai-chat-app
azd env new dev

# Konfigurasikan OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Laksanakan
azd up

# Uji API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Contoh 3: Pekerja Latar Belakang dengan Pemprosesan Barisan

**Senario**: Sistem pemprosesan pesanan dengan barisan mesej

**Struktur Direktori:**
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

**Fail: src/worker/processor.py**
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
            # Proses pesanan
            print(f"Processing order: {message.content}")
            
            # Lengkapkan mesej
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Fail: azure.yaml**
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

**Penerapan:**
```bash
# Inisialisasi
azd init

# Sebarkan dengan konfigurasi barisan
azd up

# Skala pekerja berdasarkan panjang barisan
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Corak Lanjutan

### Corak 1: Penerapan Blue-Green

```bash
# Cipta semakan baru tanpa trafik
azd deploy api --revision-suffix blue --no-traffic

# Uji semakan baru
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Bahagikan trafik (20% ke biru, 80% ke semasa)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Peralihan penuh ke biru
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Corak 2: Penerapan Canary dengan AZD

**Fail: .azure/dev/config.json**
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

**Skrip Penerapan:**
```bash
#!/bin/bash
# deploy-canary.sh

# Sebarkan semakan baru dengan 10% trafik
azd deploy api --revision-mode multiple

# Pantau metrik
azd monitor --service api --duration 5m

# Tingkatkan trafik secara beransur-ansur
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Tunggu 5 minit
done
```

### Corak 3: Penerapan Multi-Region

**Fail: azure.yaml**
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

**Fail: infra/multi-region.bicep**
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

**Penerapan:**
```bash
# Sebarkan ke semua wilayah
azd up

# Sahkan titik akhir
azd show --output json | jq '.services.api.endpoints'
```

### Corak 4: Integrasi Dapr

**Fail: infra/app/dapr-enabled.bicep**
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

**Kod Aplikasi dengan Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Simpan keadaan
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Terbitkan acara
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Amalan Terbaik

### 1. Pengurusan Sumber

```bash
# Gunakan konvensi penamaan yang konsisten
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Tandakan sumber untuk penjejakan kos
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Amalan Terbaik Keselamatan

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

### 3. Pengoptimuman Prestasi

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

### 4. Pemantauan dan Pemerhatian

```bash
# Aktifkan Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Lihat log secara masa nyata
azd logs api --follow

# Pantau metrik
azd monitor --service api

# Cipta amaran
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Pengoptimuman Kos

```bash
# Skala ke sifar apabila tidak digunakan
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Gunakan instans spot untuk persekitaran pembangunan
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Tetapkan amaran bajet
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integrasi CI/CD

**Contoh GitHub Actions:**
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

## Rujukan Perintah Biasa

```bash
# Mulakan projek aplikasi kontena baru
azd init --template <template-name>

# Sebarkan infrastruktur dan aplikasi
azd up

# Sebarkan hanya kod aplikasi (langkau infrastruktur)
azd deploy

# Sediakan hanya infrastruktur
azd provision

# Lihat sumber yang telah disebarkan
azd show

# Alirkan log
azd logs <service-name> --follow

# Pantau aplikasi
azd monitor --overview

# Bersihkan sumber
azd down --force --purge
```

## Penyelesaian Masalah

### Isu: Kontena gagal dimulakan

```bash
# Semak log
azd logs api --tail 100

# Lihat acara kontena
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Uji secara tempatan
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Isu: Tidak dapat mengakses titik akhir aplikasi kontena

```bash
# Sahkan konfigurasi ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Periksa jika ingress dalaman diaktifkan
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Isu: Masalah prestasi

```bash
# Periksa penggunaan sumber
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Tingkatkan sumber
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Sumber Tambahan dan Contoh
- [Contoh Perkhidmatan Mikro](./microservices/README.md)
- [Contoh API Flask Mudah](./simple-flask-api/README.md)
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeri Templat AZD](https://azure.github.io/awesome-azd/)
- [Contoh Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Templat Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Menyumbang

Untuk menyumbang contoh aplikasi kontena baru:

1. Cipta subdirektori baru dengan contoh anda
2. Sertakan fail lengkap `azure.yaml`, `infra/`, dan `src/`
3. Tambahkan README yang komprehensif dengan arahan penerapan
4. Uji penerapan dengan `azd up`
5. Hantar permintaan tarik

---

**Perlu Bantuan?** Sertai komuniti [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) untuk sokongan dan soalan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Contoh Penempatan Aplikasi Bekas dengan AZD

Direktori ini mengandungi contoh menyeluruh untuk menempatkan aplikasi berbekas ke Azure Container Apps menggunakan Azure Developer CLI (AZD). Contoh ini menunjukkan corak dunia sebenar, amalan terbaik, dan konfigurasi sedia produksi.

## 📚 Jadual Kandungan

- [Gambaran Keseluruhan](../../../../examples/container-app)
- [Prasyarat](../../../../examples/container-app)
- [Contoh Mula Pantas](../../../../examples/container-app)
- [Contoh Produksi](../../../../examples/container-app)
- [Corak Lanjutan](../../../../examples/container-app)
- [Amalan Terbaik](../../../../examples/container-app)

## Gambaran Keseluruhan

Azure Container Apps adalah platform bekas tanpa pelayan yang diurus sepenuhnya yang membolehkan anda menjalankan mikroservis dan aplikasi berbekas tanpa mengurus infrastruktur. Apabila digabungkan dengan AZD, anda mendapat:

- **Penempatan Mudah**: Satu arahan untuk menempatkan bekas dengan infrastruktur
- **Penalaan Automatik**: Skala ke sifar dan skala keluar berdasarkan trafik HTTP atau acara
- **Rangkaian Terpadu**: Penemuan perkhidmatan dan pecahan trafik terbina dalam
- **Identiti Terurus**: Pengesahan selamat ke sumber Azure
- **Pengoptimuman Kos**: Bayar hanya untuk sumber yang anda gunakan

## Prasyarat

Sebelum bermula, pastikan anda mempunyai:

```bash
# Semak pemasangan AZD
azd version

# Semak Azure CLI
az version

# Semak Docker (untuk membina imej tersuai)
docker --version

# Log masuk ke Azure
azd auth login
az login
```

**Sumber Azure Diperlukan:**
- Langganan Azure aktif
- Kebenaran untuk membuat kumpulan sumber
- Akses persekitaran Container Apps

## Contoh Mula Pantas

### 1. Web API Mudah (Python Flask)

Tempatkan API REST asas dengan Azure Container Apps.

**Contoh: Python Flask API**

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

**Langkah Penempatan:**

```bash
# Mulakan dari templat
azd init --template todo-python-mongo

# Menyediakan infrastruktur dan menyebarkan
azd up

# Uji penyebaran
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Ciri Utama:**
- Penalaan automatik dari 0 hingga 10 replika
- Pemeriksaan kesihatan dan liveness
- Suntikan pembolehubah persekitaran
- Integrasi Application Insights

### 2. Node.js Express API

Tempatkan backend Node.js dengan integrasi MongoDB.

```bash
# Inisialisasi templat API Node.js
azd init --template todo-nodejs-mongo

# Konfigurasikan pembolehubah persekitaran
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Lancarkan
azd up

# Lihat log melalui Azure Monitor
azd monitor --logs
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

Tempatkan aplikasi penuh dengan frontend React dan backend API.

```bash
# Inisialisasi templat sepenuhnya
azd init --template todo-csharp-sql-swa-func

# Semak konfigurasi
cat azure.yaml

# Lancarkan kedua-dua perkhidmatan
azd up

# Buka aplikasi
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Contoh Produksi

### Contoh 1: Seni Bina Mikroservis

**Senario**: Aplikasi e-dagang dengan pelbagai mikroservis

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

**Penempatan:**
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

### Contoh 2: Aplikasi Bekas Berkuasa AI

**Senario**: Aplikasi chat AI dengan integrasi Azure OpenAI

**Fail: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Gunakan Identiti Terurus untuk akses selamat
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

**Arahan Penempatan:**
```bash
# Sediakan persekitaran
azd init --template ai-chat-app
azd env new dev

# Konfigurasikan OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Lancarkan
azd up

# Uji API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Contoh 3: Pekerja Latar dengan Pemprosesan Antrian

**Senario**: Sistem pemprosesan pesanan dengan antrian mesej

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
            
            # Mesej lengkap
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

**Penempatan:**
```bash
# Inisialisasi
azd init

# Lancarkan dengan konfigurasi barisan
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

### Corak 1: Penempatan Biru-Hijau

```bash
# Buat semakan baharu tanpa trafik
azd deploy api --revision-suffix blue --no-traffic

# Uji semakan baharu
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Bahagikan trafik (20% ke biru, 80% ke semasa)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Alih sepenuhnya ke biru
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Corak 2: Penempatan Canary dengan AZD

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

**Skrip Penempatan:**
```bash
#!/bin/bash
# deploy-canary.sh

# Lancarkan semakan baru dengan 10% trafik
azd deploy api --revision-mode multiple

# Pantau metrik
azd monitor --service api --duration 5m

# Tambah trafik secara beransur-ansur
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Tunggu 5 minit
done
```

### Corak 3: Penempatan Berbilang Wilayah

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

**Penempatan:**
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
# Gunakan konvensyen penamaan yang konsisten
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Tandakan sumber untuk penjejakan kos
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Amalan Keselamatan Terbaik

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

### 4. Pemantauan dan Kebolehlihatan

```bash
# Aktifkan Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Lihat log secara masa nyata
azd monitor --logs
# Atau gunakan Azure CLI untuk Aplikasi Kontena:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Pantau metrik
azd monitor --live

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

# Tetapkan amaran belanjawan
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

## Rujukan Arahan Umum

```bash
# Inisialisasi projek aplikasi kontena baru
azd init --template <template-name>

# Lancarkan infrastruktur dan aplikasi
azd up

# Lancarkan hanya kod aplikasi (langkau infrastruktur)
azd deploy

# Sediakan hanya infrastruktur
azd provision

# Lihat sumber yang telah dilancarkan
azd show

# Alirkan log menggunakan azd monitor atau Azure CLI
azd monitor --logs
# az containerapp logs show --name <nama-perkhidmatan> --resource-group <nama-rg> --follow

# Pantau aplikasi
azd monitor --overview

# Bersihkan sumber
azd down --force --purge
```

## Penyelesaian Masalah

### Isu: Bekas gagal untuk memulakan

```bash
# Semak log menggunakan Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Lihat acara bekas
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Uji secara tempatan
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Isu: Tidak boleh mengakses titik hujung aplikasi bekas

```bash
# Sahkan konfigurasi ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Semak jika ingress dalaman diaktifkan
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Isu: Masalah prestasi

```bash
# Semak penggunaan sumber
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skala naik sumber
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Sumber dan Contoh Tambahan
- [Contoh Mikroservis](./microservices/README.md)
- [Contoh Flash API Mudah](./simple-flask-api/README.md)
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeri Template AZD](https://azure.github.io/awesome-azd/)
- [Contoh Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Template Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Menyumbang

Untuk menyumbang contoh aplikasi bekas baru:

1. Buat subdirektori baru dengan contoh anda
2. Sertakan fail `azure.yaml`, `infra/`, dan `src/` lengkap
3. Tambah README komprehensif dengan arahan penempatan
4. Uji penempatan dengan `azd up`
5. Hantar permintaan tarik

---

**Perlu Bantuan?** Sertai komuniti [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) untuk sokongan dan pertanyaan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, disarankan terjemahan profesional oleh manusia. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
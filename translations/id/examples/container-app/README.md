# Container App Deployment Examples with AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Daftar Isi

- [Ikhtisar](#overview)
- [Prasyarat](#prerequisites)
- [Contoh Mulai Cepat](#quick-start-examples)
- [Contoh Produksi](#production-examples)
- [Pola Lanjutan](#advanced-patterns)
- [Praktik Terbaik](#best-practices)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Penyebaran yang Disederhanakan**: Perintah tunggal menyebarkan kontainer beserta infrastruktur
- **Penskalakan Otomatis**: Skala ke nol dan skala keluar berdasarkan lalu lintas HTTP atau peristiwa
- **Jaringan Terintegrasi**: Penemuan layanan bawaan dan pemisahan lalu lintas
- **Identitas Terkelola**: Otentikasi aman ke sumber daya Azure
- **Optimasi Biaya**: Bayar hanya untuk sumber daya yang Anda gunakan

## Prerequisites

Before getting started, ensure you have:

```bash
# Periksa instalasi AZD
azd version

# Periksa instalasi Azure CLI
az version

# Periksa Docker (untuk membangun image kustom)
docker --version

# Otentikasi untuk penyebaran AZD
azd auth login

# Opsional: masuk ke Azure CLI jika Anda berencana menjalankan perintah az secara langsung
az login
```

**Sumber Daya Azure yang Diperlukan:**
- Langganan Azure aktif
- Izin pembuatan grup sumber daya
- Akses ke lingkungan Container Apps

## Quick Start Examples

### 1. API Web Sederhana (Python Flask)

Menyebarkan REST API dasar dengan Azure Container Apps.

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

**Langkah-Langkah Penyebaran:**

```bash
# Inisialisasi dari templat
azd init --template todo-python-mongo

# Menyediakan infrastruktur dan menyebarkan
azd up

# Uji penyebaran
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Fitur Utama:**
- Penskalakan otomatis dari 0 hingga 10 replika
- Pemeriksaan kesehatan dan pemeriksaan liveness
- Injeksi variabel lingkungan
- Integrasi Application Insights

### 2. API Node.js Express

Menyebarkan backend Node.js dengan integrasi MongoDB.

```bash
# Inisialisasi templat API Node.js
azd init --template todo-nodejs-mongo

# Konfigurasi variabel lingkungan
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Terapkan
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

### 3. Frontend Statis + Backend API

Menyebarkan aplikasi full-stack dengan frontend React dan backend API.

```bash
# Inisialisasi template full-stack
azd init --template todo-csharp-sql-swa-func

# Tinjau konfigurasi
cat azure.yaml

# Terapkan kedua layanan
azd up

# Buka aplikasi
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Contoh 1: Arsitektur Mikroservis

**Skenario**: Aplikasi e-commerce dengan beberapa mikroservis

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

**Penyebaran:**
```bash
# Inisialisasi proyek
azd init

# Atur lingkungan produksi
azd env new production

# Konfigurasikan pengaturan produksi
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Sebarkan semua layanan
azd up

# Pantau penyebaran
azd monitor --overview
```

### Contoh 2: Aplikasi Kontainer Bertenaga AI

**Skenario**: Aplikasi chat AI dengan integrasi Microsoft Foundry Models

**Berkas: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Gunakan Managed Identity untuk akses yang aman
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Ambil kunci OpenAI dari Key Vault
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

**Berkas: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Berkas: infra/main.bicep**
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

**Perintah Penyebaran:**
```bash
# Siapkan lingkungan
azd init --template ai-chat-app
azd env new dev

# Konfigurasikan OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Terapkan
azd up

# Uji API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Contoh 3: Worker Latar Belakang dengan Pemrosesan Antrian

**Skenario**: Sistem pemrosesan pesanan dengan antrean pesan

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

**Berkas: src/worker/processor.py**
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
            
            # Pesan lengkap
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Berkas: azure.yaml**
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

**Penyebaran:**
```bash
# Inisialisasi
azd init

# Sebarkan dengan konfigurasi antrean
azd up

# Skalakan pekerja berdasarkan panjang antrean
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Pola 1: Penyebaran Blue-Green

```bash
# Buat revisi baru tanpa lalu lintas
azd deploy api --revision-suffix blue --no-traffic

# Uji revisi baru
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Bagi lalu lintas (20% ke biru, 80% ke saat ini)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Alihkan sepenuhnya ke biru
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Pola 2: Penyebaran Canary dengan AZD

**Berkas: .azure/dev/config.json**
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

**Skrip Penyebaran:**
```bash
#!/bin/bash
# deploy-canary.sh

# Terapkan revisi baru dengan 10% lalu lintas
azd deploy api --revision-mode multiple

# Pantau metrik
azd monitor --service api --duration 5m

# Tingkatkan lalu lintas secara bertahap
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Tunggu 5 menit
done
```

### Pola 3: Penyebaran Multi-Region

**Berkas: azure.yaml**
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

**Berkas: infra/multi-region.bicep**
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

**Penyebaran:**
```bash
# Sebarkan ke semua wilayah
azd up

# Verifikasi endpoint
azd show --output json | jq '.services.api.endpoints'
```

### Pola 4: Integrasi Dapr

**Berkas: infra/app/dapr-enabled.bicep**
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

**Kode Aplikasi dengan Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Simpan status
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Terbitkan peristiwa
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Best Practices

### 1. Organisasi Sumber Daya

```bash
# Gunakan konvensi penamaan yang konsisten
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Beri tag sumber daya untuk pelacakan biaya
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Praktik Keamanan Terbaik

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

### 3. Optimasi Performa

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

### 4. Pemantauan dan Observabilitas

```bash
# Aktifkan Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Lihat log secara real-time
azd monitor --logs
# Atau gunakan Azure CLI untuk Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Pantau metrik
azd monitor --live

# Buat peringatan
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimasi Biaya

```bash
# Skalakan ke nol saat tidak digunakan
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Gunakan instance spot untuk lingkungan pengembangan
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Siapkan peringatan anggaran
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

## Referensi Perintah Umum

```bash
# Inisialisasi proyek aplikasi container baru
azd init --template <template-name>

# Terapkan infrastruktur dan aplikasi
azd up

# Terapkan hanya kode aplikasi (lewati infrastruktur)
azd deploy

# Sediakan hanya infrastruktur
azd provision

# Lihat sumber daya yang telah diterapkan
azd show

# Streaming log menggunakan azd monitor atau Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Pantau aplikasi
azd monitor --overview

# Bersihkan sumber daya
azd down --force --purge
```

## Pemecahan Masalah

### Masalah: Kontainer gagal dimulai

```bash
# Periksa log menggunakan Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Lihat peristiwa kontainer
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Uji secara lokal
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Masalah: Tidak dapat mengakses endpoint aplikasi kontainer

```bash
# Verifikasi konfigurasi ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Periksa apakah ingress internal diaktifkan
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Masalah: Masalah kinerja

```bash
# Periksa penggunaan sumber daya
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Tingkatkan sumber daya
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Sumber Daya Tambahan dan Contoh
- [Contoh Mikroservis](./microservices/README.md)
- [Contoh API Flash Sederhana](./simple-flask-api/README.md)
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeri Template AZD](https://azure.github.io/awesome-azd/)
- [Contoh Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Template Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Kontribusi

Untuk berkontribusi contoh aplikasi kontainer baru:

1. Buat subdirektori baru dengan contoh Anda
2. Sertakan berkas lengkap `azure.yaml`, `infra/`, dan `src/`
3. Tambahkan README yang komprehensif dengan instruksi penyebaran
4. Uji penyebaran dengan `azd up`
5. Ajukan pull request

---

**Perlu Bantuan?** Bergabung dengan komunitas [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) untuk dukungan dan pertanyaan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
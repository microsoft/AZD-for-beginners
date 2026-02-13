# AZD ile Container App Dağıtım Örnekleri

Bu dizin, Azure Developer CLI (AZD) kullanarak Azure Container Apps'e konteynerleştirilmiş uygulamaları dağıtmak için kapsamlı örnekler içerir. Bu örnekler gerçek dünya desenlerini, en iyi uygulamaları ve üretime hazır yapılandırmaları göstermektedir.

## 📚 İçindekiler

- [Genel Bakış](../../../../examples/container-app)
- [Ön Koşullar](../../../../examples/container-app)
- [Hızlı Başlangıç Örnekleri](../../../../examples/container-app)
- [Üretim Örnekleri](../../../../examples/container-app)
- [Gelişmiş Desenler](../../../../examples/container-app)
- [En İyi Uygulamalar](../../../../examples/container-app)

## Overview

Azure Container Apps, altyapıyı yönetmeden mikroservisleri ve konteynerleştirilmiş uygulamaları çalıştırmanızı sağlayan tam yönetilen bir sunucusuz konteyner platformudur. AZD ile birleştirildiğinde, şunları elde edersiniz:

- **Basitleştirilmiş Dağıtım**: Altyapı ile konteynerleri tek komutla dağıtma
- **Otomatik Ölçeklendirme**: HTTP trafiğine veya olaylara göre sıfıra kadar ölçeklendirme ve yatay ölçeklendirme
- **Entegre Ağ Yönetimi**: Yerleşik servis keşfi ve trafik bölme
- **Yönetilen Kimlik**: Azure kaynaklarına güvenli kimlik doğrulama
- **Maliyet Optimizasyonu**: Yalnızca kullandığınız kaynaklar için ödeme

## Ön Koşullar

Başlamadan önce, şu özelliklere sahip olduğunuzdan emin olun:

```bash
# AZD kurulumunu kontrol edin
azd version

# Azure CLI'yi kontrol edin
az version

# Docker'ı kontrol edin (özel imajlar oluşturmak için)
docker --version

# Azure'a giriş yapın
azd auth login
az login
```

**Gerekli Azure Kaynakları:**
- Aktif Azure aboneliği
- Kaynak grubu oluşturma izinleri
- Container Apps ortam erişimi

## Hızlı Başlangıç Örnekleri

### 1. Basit Web API (Python Flask)

Azure Container Apps ile temel bir REST API dağıtın.

**Örnek: Python Flask API**

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

**Dağıtım Adımları:**

```bash
# Şablondan başlat
azd init --template todo-python-mongo

# Altyapıyı oluştur ve dağıt
azd up

# Dağıtımı test et
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Temel Özellikler:**
- 0'dan 10 replika arası otomatik ölçeklendirme
- Sağlık kontrolleri ve canlılık denetimleri
- Ortam değişkeni enjeksiyonu
- Application Insights entegrasyonu

### 2. Node.js Express API

MongoDB entegrasyonlu bir Node.js arka ucu dağıtın.

```bash
# Node.js API şablonunu başlat
azd init --template todo-nodejs-mongo

# Ortam değişkenlerini yapılandır
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Dağıt
azd up

# Azure Monitor aracılığıyla günlükleri görüntüle
azd monitor --logs
```

**Altyapı Öne Çıkanlar:**
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

### 3. Statik Ön Yüz + API Arka Uç

React ön yüzü ve API arka ucu ile tam yığın bir uygulama dağıtın.

```bash
# Tam yığın şablonunu başlat
azd init --template todo-csharp-sql-swa-func

# Yapılandırmayı gözden geçir
cat azure.yaml

# Her iki servisi dağıt
azd up

# Uygulamayı aç
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Üretim Örnekleri

### Örnek 1: Mikroservis Mimarisi

**Senaryo**: Birden çok mikroservisli e-ticaret uygulaması

**Dizin Yapısı:**
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

**azure.yaml Yapılandırması:**
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

**Dağıtım:**
```bash
# Projeyi başlat
azd init

# Üretim ortamını ayarla
azd env new production

# Üretim ayarlarını yapılandır
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Tüm hizmetleri dağıt
azd up

# Dağıtımı izle
azd monitor --overview
```

### Örnek 2: Yapay Zeka Destekli Container App

**Senaryo**: Azure OpenAI entegrasyonlu yapay zeka sohbet uygulaması

**Dosya: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Güvenli erişim için Yönetilen Kimlik kullanın
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # OpenAI anahtarını Key Vault'tan alın
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

**Dosya: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Dosya: infra/main.bicep**
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

**Dağıtım Komutları:**
```bash
# Ortamı kur
azd init --template ai-chat-app
azd env new dev

# OpenAI'yi yapılandır
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Dağıt
azd up

# API'yi test et
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Örnek 3: Kuyruk İşlemeli Arka Plan İşçisi

**Senaryo**: Mesaj kuyruğuyla sipariş işleme sistemi

**Dizin Yapısı:**
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

**Dosya: src/worker/processor.py**
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
            # İşlem sırası
            print(f"Processing order: {message.content}")
            
            # Tam mesaj
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Dosya: azure.yaml**
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

**Dağıtım:**
```bash
# Başlat
azd init

# Kuyruk yapılandırmasıyla dağıt
azd up

# Kuyruk uzunluğuna göre çalışanı ölçeklendir
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Gelişmiş Desenler

### Desen 1: Blue-Green Dağıtımı

```bash
# Trafik olmadan yeni revizyon oluştur
azd deploy api --revision-suffix blue --no-traffic

# Yeni revizyonu test et
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Trafiği böl (%20 blue'a, %80 mevcut revizyona)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# blue'a tam geçiş
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Desen 2: AZD ile Canary Dağıtımı

**Dosya: .azure/dev/config.json**
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

**Dağıtım Betiği:**
```bash
#!/bin/bash
# deploy-canary.sh

# Yeni revizyonu %10 trafik ile dağıt
azd deploy api --revision-mode multiple

# Metrikleri izle
azd monitor --service api --duration 5m

# Trafiği kademeli olarak artır
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 dakika bekle
done
```

### Desen 3: Çok Bölgeli Dağıtım

**Dosya: azure.yaml**
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

**Dosya: infra/multi-region.bicep**
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

**Dağıtım:**
```bash
# Tüm bölgelere dağıtın
azd up

# Uç noktaları doğrulayın
azd show --output json | jq '.services.api.endpoints'
```

### Desen 4: Dapr Entegrasyonu

**Dosya: infra/app/dapr-enabled.bicep**
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

**Dapr ile Uygulama Kodu:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Durumu kaydet
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Olayı yayınla
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## En İyi Uygulamalar

### 1. Kaynak Organizasyonu

```bash
# Tutarlı adlandırma kuralları kullanın
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Maliyet takibi için kaynakları etiketleyin
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Güvenlik En İyi Uygulamaları

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

### 3. Performans Optimizasyonu

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

### 4. İzleme ve Gözlemlenebilirlik

```bash
# Application Insights'ı etkinleştir
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Günlükleri gerçek zamanlı görüntüle
azd monitor --logs
# Veya Container Apps için Azure CLI'yi kullan:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Metrikleri izle
azd monitor --live

# Uyarılar oluştur
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Maliyet Optimizasyonu

```bash
# Kullanılmadığında sıfıra ölçeklendir
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Geliştirme ortamları için spot örneklerini kullan
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Bütçe uyarıları ayarla
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD Entegrasyonu

**GitHub Actions Örneği:**
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

## Yaygın Komutlar Referansı

```bash
# Yeni container uygulama projesini başlat
azd init --template <template-name>

# Altyapıyı ve uygulamayı dağıt
azd up

# Yalnızca uygulama kodunu dağıt (altyapıyı atla)
azd deploy

# Sadece altyapıyı hazırla
azd provision

# Dağıtılmış kaynakları görüntüle
azd show

# azd monitor veya Azure CLI kullanarak günlükleri izle
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Uygulamayı izle
azd monitor --overview

# Kaynakları temizle
azd down --force --purge
```

## Sorun Giderme

### Sorun: Konteyner başlatılamıyor

```bash
# Azure CLI kullanarak günlükleri kontrol edin
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Konteyner olaylarını görüntüleyin
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Yerel olarak test edin
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Sorun: Konteyner uygulaması uç noktasına erişilemiyor

```bash
# Ingress yapılandırmasını doğrulayın
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Dahili ingress'in etkin olup olmadığını kontrol edin
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Sorun: Performans sorunları

```bash
# Kaynak kullanımını kontrol et
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Kaynakları ölçeklendir
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Ek Kaynaklar ve Örnekler
- [Mikroservis Örneği](./microservices/README.md)
- [Basit Flash API Örneği](./simple-flask-api/README.md)
- [Azure Container Apps Belgeleri](https://learn.microsoft.com/azure/container-apps/)
- [AZD Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Container Apps Örnekleri](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep Şablonları](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Katkıda Bulunma

Yeni container app örnekleri eklemek için:

1. Yeni örneğinizle bir alt dizin oluşturun
2. Tam `azure.yaml`, `infra/` ve `src/` dosyalarını ekleyin
3. Dağıtım talimatları içeren kapsamlı README ekleyin
4. Dağıtımı `azd up` ile test edin
5. Bir pull request gönderin

---

**Yardıma mı ihtiyacınız var?** Destek ve sorular için [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) topluluğuna katılın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, AI çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba gösterilse de, otomatik çevirilerin hata veya eksiklikler içerebileceğini lütfen unutmayın. Orijinal belge, kendi ana dilindeki hâli yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkan herhangi bir yanlış anlaşılma veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
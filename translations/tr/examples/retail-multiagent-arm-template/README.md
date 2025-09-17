<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T22:11:27+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "tr"
}
-->
# Perakende Çoklu Aracı Çözümü - ARM Şablon Dağıtımı

**Bölüm 5: Üretim Dağıtım Paketi**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 İlgili Bölüm**: [Bölüm 5: Çoklu Aracı AI Çözümleri](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Senaryo Kılavuzu**: [Tam Uygulama](../retail-scenario.md)
- **🎯 Hızlı Dağıtım**: [Tek Tıkla Dağıtım](../../../../examples/retail-multiagent-arm-template)

Bu dizin, perakende Çoklu Aracı Müşteri Destek Çözümünü dağıtmak için eksiksiz bir Azure Resource Manager (ARM) şablonu içerir ve tüm mimari için kod olarak altyapı sağlar.

## 🎯 Neler Dağıtılıyor?

### Temel Altyapı
- **Azure OpenAI Hizmetleri** (Yüksek erişilebilirlik için çoklu bölge)
  - Birincil bölge: Müşteri aracı için GPT-4o
  - İkincil bölge: Envanter aracı için GPT-4o-mini  
  - Üçüncül bölge: Metin gömme modeli
  - Değerlendirme bölgesi: GPT-4o değerlendirme modeli
- **Azure AI Search** vektör arama yetenekleriyle
- **Azure Depolama Hesabı** belgeler ve yüklemeler için blob konteynerleriyle
- **Azure Container Apps Ortamı** otomatik ölçeklendirme ile
- **Container Apps** aracı yönlendirici ve ön yüz için
- **Azure Cosmos DB** sohbet geçmişi depolama için
- **Azure Key Vault** gizli bilgiler yönetimi için (isteğe bağlı)
- **Application Insights** ve Log Analytics izleme için (isteğe bağlı)
- **Belge Zekası** belge işleme için
- **Bing Search API** gerçek zamanlı bilgi için

### Dağıtım Modları

| Mod | Açıklama | Kullanım Durumu | Kaynaklar |
|-----|----------|-----------------|-----------|
| **Minimal** | Maliyet optimizasyonlu temel dağıtım | Geliştirme, test | Temel SKU'lar, tek bölge, azaltılmış kapasite |
| **Standart** | Üretim iş yükleri için dengeli dağıtım | Üretim, orta ölçek | Standart SKU'lar, çoklu bölge, standart kapasite |
| **Premium** | Yüksek performanslı, kurumsal düzeyde dağıtım | Kurumsal, yüksek ölçek | Premium SKU'lar, çoklu bölge, yüksek kapasite |

## 📋 Ön Koşullar

1. **Azure CLI** kurulu ve yapılandırılmış
2. **Aktif Azure aboneliği** yeterli kotalarla
3. **Hedef abonelikte kaynak oluşturma yetkisi**
4. **Kaynak kotaları**:
   - Azure OpenAI (bölgesel uygunluğu kontrol edin)
   - Container Apps (bölgeye göre değişir)
   - AI Search (standart seviye veya daha yüksek önerilir)

## 🚀 Hızlı Dağıtım

### Seçenek 1: Azure CLI Kullanarak

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Seçenek 2: Azure Portal Kullanarak

[![Azure'a Dağıt](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Seçenek 3: Doğrudan Azure CLI Kullanarak

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Yapılandırma Seçenekleri

### Şablon Parametreleri

| Parametre | Tür | Varsayılan | Açıklama |
|-----------|-----|-----------|----------|
| `projectName` | string | "retail" | Tüm kaynak adları için ön ek |
| `location` | string | Kaynak grubu konumu | Birincil dağıtım bölgesi |
| `secondaryLocation` | string | "westus2" | Çoklu bölge dağıtımı için ikincil bölge |
| `tertiaryLocation` | string | "francecentral" | Gömme modeli için bölge |
| `environmentName` | string | "dev" | Ortam tanımı (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Dağıtım yapılandırması (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Çoklu bölge dağıtımını etkinleştir |
| `enableMonitoring` | bool | true | Application Insights ve günlük kaydını etkinleştir |
| `enableSecurity` | bool | true | Key Vault ve gelişmiş güvenliği etkinleştir |

### Parametreleri Özelleştirme

`azuredeploy.parameters.json` dosyasını düzenleyin:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Mimari Genel Bakış

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Dağıtım Komut Dosyası Kullanımı

`deploy.sh` komut dosyası etkileşimli bir dağıtım deneyimi sunar:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Komut Dosyası Özellikleri

- ✅ **Ön Koşul Doğrulama** (Azure CLI, oturum durumu, şablon dosyaları)
- ✅ **Kaynak Grubu Yönetimi** (yoksa oluşturur)
- ✅ **Şablon Doğrulama** dağıtımdan önce
- ✅ **İlerleme İzleme** renkli çıktı ile
- ✅ **Dağıtım Çıktıları** görüntüleme
- ✅ **Dağıtımdan Sonra Rehberlik**

## 📊 Dağıtımı İzleme

### Dağıtım Durumunu Kontrol Etme

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Dağıtım Çıktıları

Başarılı bir dağıtımdan sonra aşağıdaki çıktılar mevcuttur:

- **Ön Yüz URL'si**: Web arayüzü için genel uç nokta
- **Yönlendirici URL'si**: Aracı yönlendirici için API uç noktası
- **OpenAI Uç Noktaları**: Birincil ve ikincil OpenAI hizmet uç noktaları
- **Arama Hizmeti**: Azure AI Search hizmeti uç noktası
- **Depolama Hesabı**: Belgeler için depolama hesabı adı
- **Key Vault**: Key Vault adı (etkinse)
- **Application Insights**: İzleme hizmeti adı (etkinse)

## 🔧 Dağıtımdan Sonra Yapılandırma

### 1. Arama Dizini Yapılandırma

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. İlk Veriyi Yükleme

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Aracı Uç Noktalarını Test Etme

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container Apps Yapılandırma

ARM şablonu yer tutucu konteyner görüntüleri dağıtır. Gerçek aracı kodunu dağıtmak için:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Sorun Giderme

### Yaygın Sorunlar

#### 1. Azure OpenAI Kota Aşıldı

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps Dağıtımı Başarısız Oldu

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Arama Hizmeti Başlatma

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Dağıtım Doğrulama

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Güvenlik Düşünceleri

### Anahtar Yönetimi
- Tüm gizli bilgiler Azure Key Vault'ta saklanır (etkinse)
- Container apps kimlik doğrulama için yönetilen kimlik kullanır
- Depolama hesapları güvenli varsayılanlarla yapılandırılmıştır (yalnızca HTTPS, genel blob erişimi yok)

### Ağ Güvenliği
- Container apps mümkün olduğunca dahili ağ kullanır
- Arama hizmeti özel uç noktalar seçeneğiyle yapılandırılmıştır
- Cosmos DB minimum gerekli izinlerle yapılandırılmıştır

### RBAC Yapılandırması
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Maliyet Optimizasyonu

### Maliyet Tahminleri (Aylık, USD)

| Mod | OpenAI | Container Apps | Arama | Depolama | Toplam Tahmin |
|-----|--------|----------------|-------|----------|---------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standart | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Maliyet İzleme

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Güncellemeler ve Bakım

### Şablon Güncellemeleri
- ARM şablon dosyalarını sürüm kontrolüne alın
- Değişiklikleri önce geliştirme ortamında test edin
- Güncellemeler için artımlı dağıtım modunu kullanın

### Kaynak Güncellemeleri
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Yedekleme ve Kurtarma
- Cosmos DB otomatik yedekleme etkin
- Key Vault yumuşak silme etkin
- Container app revizyonları geri alma için korunur

## 📞 Destek

- **Şablon Sorunları**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Destek**: [Azure Destek Portalı](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Topluluk**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Çoklu aracı çözümünüzü dağıtmaya hazır mısınız?**

Başlangıç komutu: `./deploy.sh -g myResourceGroup`

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
# Perakende Çoklu Ajan Çözümü - Altyapı Şablonu

**Bölüm 5: Üretim Dağıtım Paketi**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 İlgili Bölüm**: [Bölüm 5: Çoklu Ajanlı AI Çözümleri](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Senaryo Kılavuzu**: [Tam Mimari](../retail-scenario.md)
- **🎯 Hızlı Dağıtım**: [Tek Tıkla Dağıtım](../../../../examples/retail-multiagent-arm-template)

> **⚠️ SADECE ALTYAPI ŞABLONU**  
> Bu ARM şablonu, çoklu ajan sistemi için **Azure kaynaklarını** dağıtır.  
>  
> **Dağıtılanlar (15-25 dakika):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, 3 bölgede gömme modeller)
> - ✅ AI Arama hizmeti (boş, indeks oluşturma için hazır)
> - ✅ Container Apps (yer tutucu görüntüler, kodunuz için hazır)
> - ✅ Depolama, Cosmos DB, Key Vault, Application Insights
>  
> **Dahil Olmayanlar (geliştirme gerektirir):**
> - ❌ Ajan uygulama kodu (Müşteri Ajanı, Envanter Ajanı)
> - ❌ Yönlendirme mantığı ve API uç noktaları
> - ❌ Ön uç sohbet arayüzü
> - ❌ Arama indeks şemaları ve veri hatları
> - ❌ **Tahmini geliştirme süresi: 80-120 saat**
>  
> **Bu şablonu kullanın eğer:**
> - ✅ Çoklu ajan projesi için Azure altyapısı oluşturmak istiyorsanız
> - ✅ Ajan uygulamasını ayrı olarak geliştirmeyi planlıyorsanız
> - ✅ Üretime hazır bir altyapı temeli istiyorsanız
>  
> **Kullanmayın eğer:**
> - ❌ Hemen çalışan bir çoklu ajan demosu bekliyorsanız
> - ❌ Tam uygulama kodu örnekleri arıyorsanız

## Genel Bakış

Bu dizin, çoklu ajan müşteri destek sistemi için **altyapı temeli** oluşturmak üzere kapsamlı bir Azure Resource Manager (ARM) şablonu içerir. Şablon, gerekli tüm Azure hizmetlerini, doğru şekilde yapılandırılmış ve birbirine bağlanmış olarak, uygulama geliştirme için hazır hale getirir.

**Dağıtımdan sonra sahip olacağınız:** Üretime hazır Azure altyapısı  
**Sistemi tamamlamak için ihtiyacınız olanlar:** Ajan kodu, ön uç arayüzü ve veri yapılandırması (bkz. [Mimari Kılavuzu](../retail-scenario.md))

## 🎯 Dağıtılanlar

### Temel Altyapı (Dağıtımdan Sonraki Durum)

✅ **Azure OpenAI Hizmetleri** (API çağrıları için hazır)
  - Birincil bölge: GPT-4o dağıtımı (20K TPM kapasite)
  - İkincil bölge: GPT-4o-mini dağıtımı (10K TPM kapasite)
  - Üçüncül bölge: Metin gömme modeli (30K TPM kapasite)
  - Değerlendirme bölgesi: GPT-4o grader modeli (15K TPM kapasite)
  - **Durum:** Tam işlevsel - hemen API çağrıları yapılabilir

✅ **Azure AI Arama** (Boş - yapılandırmaya hazır)
  - Vektör arama yetenekleri etkin
  - Standart seviye, 1 bölüm, 1 kopya
  - **Durum:** Hizmet çalışıyor, ancak indeks oluşturulması gerekiyor
  - **Gerekli işlem:** Şemanızla arama indeksi oluşturun

✅ **Azure Depolama Hesabı** (Boş - yüklemelere hazır)
  - Blob konteynerleri: `documents`, `uploads`
  - Güvenli yapılandırma (yalnızca HTTPS, genel erişim yok)
  - **Durum:** Dosya almaya hazır
  - **Gerekli işlem:** Ürün verilerinizi ve belgelerinizi yükleyin

⚠️ **Container Apps Ortamı** (Yer tutucu görüntüler dağıtıldı)
  - Ajan yönlendirici uygulaması (nginx varsayılan görüntüsü)
  - Ön uç uygulaması (nginx varsayılan görüntüsü)
  - Otomatik ölçeklendirme yapılandırıldı (0-10 örnek)
  - **Durum:** Yer tutucu konteynerler çalışıyor
  - **Gerekli işlem:** Ajan uygulamalarınızı oluşturup dağıtın

✅ **Azure Cosmos DB** (Boş - veri için hazır)
  - Veritabanı ve konteyner önceden yapılandırılmış
  - Düşük gecikme işlemleri için optimize edilmiş
  - TTL etkin, otomatik temizleme için
  - **Durum:** Sohbet geçmişini depolamaya hazır

✅ **Azure Key Vault** (Opsiyonel - sırlar için hazır)
  - Yumuşak silme etkin
  - Yönetilen kimlikler için RBAC yapılandırılmış
  - **Durum:** API anahtarlarını ve bağlantı dizgilerini depolamaya hazır

✅ **Application Insights** (Opsiyonel - izleme aktif)
  - Log Analytics çalışma alanına bağlı
  - Özel metrikler ve uyarılar yapılandırılmış
  - **Durum:** Uygulamalarınızdan telemetri almaya hazır

✅ **Belge Zekası** (API çağrıları için hazır)
  - S0 seviyesi üretim iş yükleri için
  - **Durum:** Yüklenen belgeleri işlemeye hazır

✅ **Bing Arama API** (API çağrıları için hazır)
  - S1 seviyesi gerçek zamanlı aramalar için
  - **Durum:** Web arama sorguları için hazır

### Dağıtım Modları

| Mod | OpenAI Kapasitesi | Konteyner Örnekleri | Arama Seviyesi | Depolama Yedekleme | En İyi Kullanım Alanı |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **Minimal** | 10K-20K TPM | 0-2 kopya | Temel | LRS (Yerel) | Geliştirme/test, öğrenme, kavram kanıtı |
| **Standart** | 30K-60K TPM | 2-5 kopya | Standart | ZRS (Bölge) | Üretim, orta trafik (<10K kullanıcı) |
| **Premium** | 80K-150K TPM | 5-10 kopya, bölge yedekli | Premium | GRS (Coğrafi) | Kurumsal, yüksek trafik (>10K kullanıcı), %99.99 SLA |

**Maliyet Etkisi:**
- **Minimal → Standart:** ~4 kat maliyet artışı ($100-370/ay → $420-1,450/ay)
- **Standart → Premium:** ~3 kat maliyet artışı ($420-1,450/ay → $1,150-3,500/ay)
- **Seçim yaparken dikkate alın:** Beklenen yük, SLA gereksinimleri, bütçe kısıtlamaları

**Kapasite Planlama:**
- **TPM (Dakika Başına Token):** Tüm model dağıtımları toplamı
- **Konteyner Örnekleri:** Otomatik ölçeklendirme aralığı (min-maks kopya)
- **Arama Seviyesi:** Sorgu performansını ve indeks boyutu sınırlarını etkiler

## 📋 Ön Koşullar

### Gerekli Araçlar
1. **Azure CLI** (sürüm 2.50.0 veya üstü)
   ```bash
   az --version  # Sürümü kontrol et
   az login      # Kimlik doğrula
   ```

2. **Aktif Azure aboneliği** Sahip veya Katkıda Bulunan erişimi ile
   ```bash
   az account show  # Aboneliği doğrula
   ```

### Gerekli Azure Kotaları

Dağıtımdan önce, hedef bölgelerinizde yeterli kotaları doğrulayın:

```bash
# Azure OpenAI'nin bölgenizdeki kullanılabilirliğini kontrol edin
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAI kotasını doğrulayın (gpt-4o örneği için)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Container Apps kotasını kontrol edin
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Minimum Gerekli Kotalar:**
- **Azure OpenAI:** 3-4 model dağıtımı farklı bölgelerde
  - GPT-4o: 20K TPM (Dakika Başına Token)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Not:** GPT-4o bazı bölgelerde bekleme listesinde olabilir - [model kullanılabilirliği](https://learn.microsoft.com/azure/ai-services/openai/concepts/models) kontrol edin
- **Container Apps:** Yönetilen ortam + 2-10 konteyner örneği
- **AI Arama:** Standart seviye (Vektör arama için Temel yetersiz)
- **Cosmos DB:** Standart sağlanmış işlem hacmi

**Eğer kota yetersizse:**
1. Azure Portal → Kotalar → Artış talep et
2. Veya Azure CLI kullan:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Uygunluk olan alternatif bölgeleri düşünün

## 🚀 Hızlı Dağıtım

### Seçenek 1: Azure CLI Kullanarak

```bash
# Şablon dosyalarını klonlayın veya indirin
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Dağıtım betiğini çalıştırılabilir yapın
chmod +x deploy.sh

# Varsayılan ayarlarla dağıtın
./deploy.sh -g myResourceGroup

# Premium özelliklerle üretim için dağıtın
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Seçenek 2: Azure Portal Kullanarak

[![Azure'a Dağıt](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Seçenek 3: Doğrudan Azure CLI Kullanarak

```bash
# Kaynak grubu oluştur
az group create --name myResourceGroup --location eastus2

# Şablonu dağıt
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Dağıtım Zaman Çizelgesi

### Beklenenler

| Aşama | Süre | Ne Oluyor |
|-------|----------|--------------||
| **Şablon Doğrulama** | 30-60 saniye | Azure, ARM şablon sözdizimini ve parametrelerini doğrular |
| **Kaynak Grubu Kurulumu** | 10-20 saniye | Kaynak grubu oluşturulur (gerekirse) |
| **OpenAI Dağıtımı** | 5-8 dakika | 3-4 OpenAI hesabı oluşturulur ve modeller dağıtılır |
| **Container Apps** | 3-5 dakika | Ortam oluşturulur ve yer tutucu konteynerler dağıtılır |
| **Arama ve Depolama** | 2-4 dakika | AI Arama hizmeti ve depolama hesapları sağlanır |
| **Cosmos DB** | 2-3 dakika | Veritabanı oluşturulur ve konteynerler yapılandırılır |
| **İzleme Kurulumu** | 2-3 dakika | Application Insights ve Log Analytics yapılandırılır |
| **RBAC Yapılandırması** | 1-2 dakika | Yönetilen kimlikler ve izinler yapılandırılır |
| **Toplam Dağıtım** | **15-25 dakika** | Tam altyapı hazır |

**Dağıtımdan Sonra:**
- ✅ **Altyapı Hazır:** Tüm Azure hizmetleri sağlanmış ve çalışıyor
- ⏱️ **Uygulama Geliştirme:** 80-120 saat (sorumluluğunuzda)
- ⏱️ **İndeks Yapılandırması:** 15-30 dakika (şemanız gerekiyor)
- ⏱️ **Veri Yükleme:** Veri seti boyutuna bağlı olarak değişir
- ⏱️ **Test ve Doğrulama:** 2-4 saat

---

## ✅ Dağıtım Başarısını Doğrulama

### Adım 1: Kaynak Sağlama Kontrolü (2 dakika)

```bash
# Tüm kaynakların başarıyla dağıtıldığını doğrulayın
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Beklenen:** Boş tablo (tüm kaynaklar "Başarılı" durumunu gösterir)

### Adım 2: Azure OpenAI Dağıtımlarını Doğrulama (3 dakika)

```bash
# Tüm OpenAI hesaplarını listele
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Birincil bölge için model dağıtımlarını kontrol et
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Beklenen:** 
- 3-4 OpenAI hesabı (birincil, ikincil, üçüncül, değerlendirme bölgeleri)
- Hesap başına 1-2 model dağıtımı (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Adım 3: Altyapı Uç Noktalarını Test Etme (5 dakika)

```bash
# Container Uygulama URL'lerini Al
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Yönlendirici uç noktasını test et (yer tutucu resim yanıt verecek)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Beklenen:** 
- Container Apps "Çalışıyor" durumunu gösterir
- Yer tutucu nginx HTTP 200 veya 404 ile yanıt verir (henüz uygulama kodu yok)

### Adım 4: Azure OpenAI API Erişimini Doğrulama (3 dakika)

```bash
# OpenAI uç noktasını ve anahtarını alın
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# GPT-4o dağıtımını test edin
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Beklenen:** JSON yanıtı ile sohbet tamamlama (OpenAI'nin işlevsel olduğunu doğrular)

### Çalışanlar ve Çalışmayanlar

**✅ Dağıtımdan Sonra Çalışanlar:**
- Azure OpenAI modelleri dağıtıldı ve API çağrılarını kabul ediyor
- AI Arama hizmeti çalışıyor (boş, henüz indeks yok)
- Container Apps çalışıyor (yer tutucu nginx görüntüleri)
- Depolama hesapları erişilebilir ve yüklemeye hazır
- Cosmos DB veri işlemleri için hazır
- Application Insights altyapı telemetrisini topluyor
- Key Vault sır depolamaya hazır

**❌ Henüz Çalışmayanlar (Geliştirme Gerektirir):**
- Ajan uç noktaları (henüz uygulama kodu dağıtılmadı)
- Sohbet işlevselliği (ön uç + arka uç uygulaması gerekiyor)
- Arama sorguları (henüz arama indeksi oluşturulmadı)
- Belge işleme hattı (henüz veri yüklenmedi)
- Özel telemetri (uygulama enstrümantasyonu gerekiyor)

**Sonraki Adımlar:** [Dağıtım Sonrası Yapılandırma](../../../../examples/retail-multiagent-arm-template) bölümüne bakarak uygulamanızı geliştirin ve dağıtın

---

## ⚙️ Yapılandırma Seçenekleri

### Şablon Parametreleri

| Parametre | Tür | Varsayılan | Açıklama |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Tüm kaynak adları için ön ek |
| `location` | string | Kaynak grubu konumu | Birincil dağıtım bölgesi |
| `secondaryLocation` | string | "westus2" | Çok bölgeli dağıtım için ikincil bölge |
| `tertiaryLocation` | string | "francecentral" | Gömme modeli için bölge |
| `environmentName` | string | "dev" | Ortam tanımı (geliştirme/ön hazırlık/üretim) |
| `deploymentMode` | string | "standard" | Dağıtım yapılandırması (minimal/standart/premium) |
| `enableMultiRegion` | bool | true | Çok bölgeli dağıtımı etkinleştir |
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

`deploy.sh` komut dosyası, etkileşimli bir dağıtım deneyimi sunar:

```bash
# Yardım göster
./deploy.sh --help

# Temel dağıtım
./deploy.sh -g myResourceGroup

# Özel ayarlarla gelişmiş dağıtım
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Çok bölgeli olmadan geliştirme dağıtımı
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
- ✅ **Dağıtım Sonrası Rehberlik**

## 📊 Dağıtımı İzleme

### Dağıtım Durumunu Kontrol Etme

```bash
# Dağıtımları listele
az deployment group list --resource-group myResourceGroup --output table

# Dağıtım ayrıntılarını al
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Dağıtım ilerlemesini izle
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Dağıtım Çıktıları

Başarılı bir dağıtımdan sonra aşağıdaki çıktılar mevcut olacaktır:

- **Ön Uç URL**: Web arayüzü için genel uç nokta
- **Yönlendirici URL**: Ajan yönlendirici için API uç noktası
- **OpenAI Uç Noktaları**: Birincil ve ikincil OpenAI hizmet uç noktaları
- **Arama Hizmeti**: Azure AI Arama hizmeti uç noktası
- **Depolama Hesabı**: Belgeler için depolama hesabı adı
- **Key Vault**: Key Vault adı (etkinse)
- **Application Insights**: İzleme hizmeti adı (etkinse)

## 🔧 Dağıtım Sonrası: Sonraki Adımlar
> **📝 Önemli:** Altyapı dağıtıldı, ancak uygulama kodunu geliştirip dağıtmanız gerekiyor.

### Aşama 1: Ajan Uygulamalarını Geliştirin (Sizin Sorumluluğunuz)

ARM şablonu, **boş Container Apps** oluşturur ve bunlara yer tutucu nginx görüntüleri ekler. Sizin yapmanız gerekenler:

**Gerekli Geliştirme:**
1. **Ajan Uygulaması Geliştirme** (30-40 saat)
   - GPT-4o entegrasyonlu müşteri hizmetleri ajanı
   - GPT-4o-mini entegrasyonlu envanter ajanı
   - Ajan yönlendirme mantığı

2. **Frontend Geliştirme** (20-30 saat)
   - Sohbet arayüzü UI (React/Vue/Angular)
   - Dosya yükleme işlevselliği
   - Yanıtların işlenmesi ve formatlanması

3. **Backend Servisleri** (12-16 saat)
   - FastAPI veya Express router
   - Kimlik doğrulama middleware
   - Telemetri entegrasyonu

**Bakınız:** [Mimari Kılavuz](../retail-scenario.md) detaylı uygulama desenleri ve kod örnekleri için

### Aşama 2: AI Arama İndeksini Yapılandırın (15-30 dakika)

Veri modelinize uygun bir arama indeksi oluşturun:

```bash
# Arama hizmeti ayrıntılarını alın
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Şemanızla (örnek) bir indeks oluşturun
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Kaynaklar:**
- [AI Arama İndeksi Şema Tasarımı](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vektör Arama Yapılandırması](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Aşama 3: Verilerinizi Yükleyin (Süre değişkenlik gösterebilir)

Ürün verileriniz ve belgeleriniz hazır olduğunda:

```bash
# Depolama hesabı ayrıntılarını alın
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Belgelerinizi yükleyin
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Örnek: Tek dosya yükleme
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Aşama 4: Uygulamalarınızı Geliştirin ve Dağıtın (8-12 saat)

Ajan kodunuzu geliştirdikten sonra:

```bash
# 1. Azure Container Registry oluşturun (gerekirse)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Agent router görüntüsünü oluşturun ve gönderin
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Frontend görüntüsünü oluşturun ve gönderin
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Container Apps'i görüntülerinizle güncelleyin
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Ortam değişkenlerini yapılandırın
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Aşama 5: Uygulamanızı Test Edin (2-4 saat)

```bash
# Uygulama URL'inizi alın
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Test ajanı uç noktası (kodunuz dağıtıldıktan sonra)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Uygulama günlüklerini kontrol edin
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Uygulama Kaynakları

**Mimari ve Tasarım:**
- 📖 [Tam Mimari Kılavuz](../retail-scenario.md) - Detaylı uygulama desenleri
- 📖 [Çoklu Ajan Tasarım Desenleri](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Kod Örnekleri:**
- 🔗 [Azure OpenAI Sohbet Örneği](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG deseni
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Ajan çerçevesi (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Ajan orkestrasyonu (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Çoklu ajan konuşmaları

**Tahmini Toplam Çaba:**
- Altyapı dağıtımı: 15-25 dakika (✅ Tamamlandı)
- Uygulama geliştirme: 80-120 saat (🔨 Sizin işiniz)
- Test ve optimizasyon: 15-25 saat (🔨 Sizin işiniz)

## 🛠️ Sorun Giderme

### Yaygın Sorunlar

#### 1. Azure OpenAI Kota Aşıldı

```bash
# Mevcut kota kullanımını kontrol et
az cognitiveservices usage list --location eastus2

# Kota artırımı talep et
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps Dağıtımı Başarısız Oldu

```bash
# Konteyner uygulama günlüklerini kontrol et
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Konteyner uygulamasını yeniden başlat
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Arama Servisi Başlatılamadı

```bash
# Arama hizmeti durumunu doğrula
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Arama hizmeti bağlantısını test et
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Dağıtım Doğrulama

```bash
# Tüm kaynakların oluşturulduğunu doğrula
az resource list \
  --resource-group myResourceGroup \
  --output table

# Kaynak sağlığını kontrol et
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Güvenlik Hususları

### Anahtar Yönetimi
- Tüm gizli bilgiler Azure Key Vault'ta saklanır (etkinleştirildiğinde)
- Container uygulamaları kimlik doğrulama için yönetilen kimlik kullanır
- Depolama hesapları güvenli varsayılanlarla yapılandırılmıştır (yalnızca HTTPS, genel blob erişimi yok)

### Ağ Güvenliği
- Container uygulamaları mümkün olduğunca dahili ağ kullanır
- Arama servisi özel uç noktalarla yapılandırılmıştır
- Cosmos DB yalnızca gerekli minimum izinlerle yapılandırılmıştır

### RBAC Yapılandırması
```bash
# Yönetilen kimlik için gerekli rolleri atayın
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
# Bütçe uyarılarını ayarla
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
# Yeni parametrelerle güncelleme
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Yedekleme ve Kurtarma
- Cosmos DB otomatik yedekleme etkinleştirildi
- Key Vault yumuşak silme etkinleştirildi
- Container uygulama revizyonları geri alma için saklanır

## 📞 Destek

- **Şablon Sorunları:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure Desteği:** [Azure Destek Portalı](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Topluluk:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Çoklu ajan çözümünüzü dağıtmaya hazır mısınız?**

Başlamak için: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
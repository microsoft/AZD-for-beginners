# AI Atölyesi Laboratuvarı: AI Çözümlerinizi AZD ile Dağıtılabilir Hale Getirme

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfası**: [Yeni Başlayanlar için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)

## Atölye Genel Bakışı

Bu uygulamalı laboratuvar, geliştiricilere mevcut bir AI şablonunu alıp Azure Developer CLI (AZD) ile dağıtma sürecinde rehberlik eder. Microsoft Foundry hizmetlerini kullanarak üretim AI dağıtımları için temel desenleri öğreneceksiniz.

> **Doğrulama notu (2026-07-13):** Bu atölye `azd` `1.27.1` sürümüne göre gözden geçirilmiştir. Yerel kurulumunuz daha eski ise, kimlik doğrulama, şablon ve dağıtım iş akışının aşağıdaki adımlarla uyumlu olması için başlamadan önce AZD'yi güncelleyin.

**Süre:** 2-3 saat  
**Seviye:** Orta  
**Önkoşullar:** Temel Azure bilgisi, AI/ML kavramlarına aşinalık

## 🎓 Öğrenim Hedefleri

Bu atölyenin sonunda şunları yapabileceksiniz:
- ✅ Mevcut AI uygulamasını AZD şablonları kullanacak şekilde dönüştürmek
- ✅ Microsoft Foundry hizmetlerini AZD ile yapılandırmak
- ✅ AI hizmetleri için güvenli kimlik bilgisi yönetimi uygulamak
- ✅ İzlemeli, üretim hazır AI uygulamaları dağıtmak
- ✅ Yaygın AI dağıtım sorunlarını giderme yapmak

## Önkoşullar

### Gerekli Araçlar
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) yüklü olmalı
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) yüklü olmalı
- [Git](https://git-scm.com/) yüklü olmalı
- Kod düzenleyici (VS Code önerilir)

### Azure Kaynakları
- Katkıda bulunan erişime sahip Azure aboneliği
- Microsoft Foundry Modeller servislerine erişim (veya erişim talep etme imkanı)
- Kaynak grubu oluşturma yetkisi

### Bilgi Önkoşulları
- Azure servisleri hakkında temel anlayış
- Komut satırı arabirimlerine aşinalık
- Temel AI/ML kavramları (API'ler, modeller, istemler)

## Laboratuvar Kurulumu

### Adım 1: Ortam Hazırlığı

1. **Araç kurulumlarını doğrulayın:**
```bash
# AZD kurulumunu kontrol et
azd version

# Azure CLI'yı kontrol et
az --version

# AZD iş akışları için Azure'a giriş yap
azd auth login

# Tanılama sırasında az komutlarını çalıştırmayı planlıyorsanız Azure CLI'ya giriş yap
az login
```

Birden fazla kiracıda çalışıyorsanız veya aboneliğiniz otomatik algılanmıyorsa, `azd auth login --tenant-id <tenant-id>` ile tekrar deneyin.

2. **Atölye deposunu klonlayın:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modül 1: AI Uygulamaları için AZD Yapısını Anlama

### AI AZD Şablonunun Anatomisi

AI hazır AZD şablonundaki temel dosyaları keşfedin:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Laboratuvar Egzersizi 1.1: Konfigürasyonu İnceleyin**

1. **azure.yaml dosyasını inceleyin:**
```bash
cat azure.yaml
```

**İncelenecekler:**
- AI bileşenleri için servis tanımlamaları
- Ortam değişken eşlemeleri
- Sunucu yapılandırmaları

2. **main.bicep altyapısını gözden geçirin:**
```bash
cat infra/main.bicep
```

**Belirlenmesi gereken önemli AI desenleri:**
- Microsoft Foundry Modeller servis sağlama
- Azure AI Search entegrasyonu
- Güvenli anahtar yönetimi
- Ağ güvenliği yapılandırmaları

### **Tartışma Noktası:** Bu Desenler AI için Neden Önemlidir

- **Servis Bağımlılıkları**: AI uygulamaları genellikle birden çok koordineli servis gerektirir
- **Güvenlik**: API anahtarları ve uç noktalar güvenli şekilde yönetilmeli
- **Ölçeklenebilirlik**: AI iş yüklerinin kendine özgü ölçeklendirme gereksinimleri vardır
- **Maliyet Yönetimi**: AI servisleri uygun yapılandırılmazsa maliyetli olabilir

## Modül 2: İlk AI Uygulamanızı Dağıtın

### Adım 2.1: Ortamı Başlatma

1. **Yeni bir AZD ortamı oluşturun:**
```bash
azd env new myai-workshop
```

2. **Gerekli parametreleri ayarlayın:**
```bash
# Tercih ettiğiniz Azure bölgesini ayarlayın
azd env set AZURE_LOCATION eastus

# İsteğe bağlı: Belirli OpenAI modelini ayarlayın
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Adım 2.2: Altyapı ve Uygulamayı Dağıtma

1. **AZD ile dağıtım yapın:**
```bash
azd up
```

**`azd up` sırasında olanlar:**
- ✅ Microsoft Foundry Modeller servisinin sağlanması
- ✅ Azure AI Search servisinin oluşturulması
- ✅ Web uygulaması için App Service kurulumu
- ✅ Ağ ve güvenlik yapılandırması
- ✅ Uygulama kodunun dağıtımı
- ✅ İzleme ve günlüklemenin kurulması

2. **Dağıtım sürecini izleyin** ve oluşturulan kaynakları not edin.

### Adım 2.3: Dağıtımınızı Doğrulayın

1. **Dağıtılmış kaynakları kontrol edin:**
```bash
azd show
```

2. **Dağıtılan uygulamayı açın:**
```bash
azd show
```

`azd show` çıktısında görünen web uç noktasını açın.

3. **AI fonksiyonelliğini test edin:**
   - Web uygulamasına gidin
   - Örnek sorgular deneyin
   - AI yanıtlarının çalıştığını doğrulayın

### **Laboratuvar Egzersizi 2.1: Sorun Giderme Pratiği**

**Senaryo**: Dağıtımınız başarılı oldu ama AI yanıt vermiyor.

**Kontrol edilmesi gereken yaygın sorunlar:**
1. **OpenAI API anahtarları**: Doğru ayarlandığını doğrulayın
2. **Model uygunluğu**: Bölgenizin modeli destekleyip desteklemediğini kontrol edin
3. **Ağ bağlantısı**: Servislerin iletişim kurabildiğinden emin olun
4. **RBAC izinleri**: Uygulamanın OpenAI erişimi olduğundan emin olun

**Hata ayıklama komutları:**
```bash
# Ortam değişkenlerini kontrol et
azd env get-values

# Dağıtım günlüklerini görüntüle
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI dağıtım durumunu kontrol et
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modül 3: AI Uygulamalarınızı İhtiyaçlarınıza Göre Özelleştirme

### Adım 3.1: AI Konfigürasyonunu Değiştirme

1. **OpenAI modelini güncelleyin:**
```bash
# Farklı bir modele değiştirin (bölgenizde mevcutsa)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Yeni yapılandırmayla yeniden dağıtın
azd deploy
```

2. **Ek AI hizmetleri ekleyin:**

`infra/main.bicep` dosyasını düzenleyerek Document Intelligence ekleyin:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Adım 3.2: Ortama Özgü Konfigürasyonlar

**En İyi Uygulama**: Geliştirme ve üretim için farklı yapılandırmalar kullanın.

1. **Üretim ortamı oluşturun:**
```bash
azd env new myai-production
```

2. **Üretime özgü parametreleri ayarlayın:**
```bash
# Üretim genellikle daha yüksek SKU kullanır
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ek güvenlik özelliklerini etkinleştir
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratuvar Egzersizi 3.1: Maliyet Optimizasyonu**

**Meydan okuma:** Şablonu maliyet etkin geliştirme için yapılandırın.

**Görevler:**
1. Hangi SKU'ların ücretsiz/basic katmana ayarlanabileceğini belirleyin
2. Minimum maliyet için ortam değişkenlerini yapılandırın
3. Dağıtın ve maliyetleri üretim konfigürasyonu ile karşılaştırın

**Çözüm ipuçları:**
- Azure AI Servisleri için mümkün olduğunda F0 (ücretsiz) katmanını kullanın
- Geliştirmede Search Service için Basic katman kullanın
- Fonksiyonlar için Tüketim planını düşünün

## Modül 4: Güvenlik ve Üretim En İyi Uygulamaları

### Adım 4.1: Güvenli Kimlik Bilgisi Yönetimi

**Mevcut zorluk:** Birçok AI uygulaması API anahtarını kod içinde sert olarak tutar veya güvensiz depolar.

**AZD Çözümü:** Yönetilen Kimlik + Key Vault entegrasyonu.

1. **Şablonunuzdaki güvenlik yapılandırmasını gözden geçirin:**
```bash
# Anahtar Kasası ve Yönetilen Kimlik yapılandırmasını arayın
grep -r "keyVault\|managedIdentity" infra/
```

2. **Yönetilen Kimliğin çalıştığını doğrulayın:**
```bash
# Web uygulamasının doğru kimlik yapılandırmasına sahip olup olmadığını kontrol edin
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Adım 4.2: Ağ Güvenliği

1. **Özel uç noktaları etkinleştirin** (henüz yapılandırılmadıysa):

Bicep şablonunuza ekleyin:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Adım 4.3: İzleme ve Gözlemlenebilirlik

1. **Application Insights yapılandırması:**
```bash
# Application Insights otomatik olarak yapılandırılmalıdır
# Yapılandırmayı kontrol et:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI'ya özgü izlemeyi kurun:**

AI operasyonları için özel metrikler ekleyin:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Laboratuvar Egzersizi 4.1: Güvenlik Denetimi**

**Görev:** Dağıtımınızı güvenlik en iyi uygulamaları açısından gözden geçirin.

**Kontrol listesi:**
- [ ] Kodda veya konfigürasyonda sert olarak yazılmış gizli bilgiler yok
- [ ] Servisler arası kimlik doğrulama için Yönetilen Kimlik kullanılıyor
- [ ] Hassas yapılandırma Key Vault'ta saklanıyor
- [ ] Ağ erişimi uygun şekilde kısıtlanmış
- [ ] İzleme ve günlükleme etkinleştirilmiş

## Modül 5: Kendi AI Uygulamanızı Dönüştürme

### Adım 5.1: Değerlendirme Çalışma Sayfası

**Uygulamanızı dönüştürmeden önce, şu soruları cevaplayın:**

1. **Uygulama Mimarisi:**
   - Uygulamanız hangi AI hizmetlerini kullanıyor?
   - Hangi hesaplama kaynaklarına ihtiyacı var?
   - Veritabanı gerektiriyor mu?
   - Servisler arası bağımlılıklar neler?

2. **Güvenlik Gereksinimleri:**
   - Uygulamanız hangi hassas verileri işliyor?
   - Hangi uyumluluk gereksinimlerine sahipsiniz?
   - Özel ağ gereksinimi var mı?

3. **Ölçeklendirme Gereksinimleri:**
   - Beklenen yük nedir?
   - Otomatik ölçeklendirme gerekli mi?
   - Bölgesel gereksinimler var mı?

### Adım 5.2: AZD Şablonunuzu Oluşturun

**Uygulamanızı dönüştürmek için şu deseni takip edin:**

1. **Temel yapıyı oluşturun:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD şablonunu başlat
azd init --template minimal
```

2. **azure.yaml oluşturun:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Altyapı şablonlarını oluşturun:**

**infra/main.bicep** - Ana şablon:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI modülü:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Laboratuvar Egzersizi 5.1: Şablon Oluşturma Meydan Okuması**

**Meydan okuma:** Bir belge işleme AI uygulaması için AZD şablonu oluşturun.

**Gereksinimler:**
- İçerik analizi için Microsoft Foundry Modeller
- OCR için Document Intelligence
- Belge yüklemeleri için Depolama Hesabı
- İş mantığı için Function App
- Kullanıcı arayüzü için Web uygulaması

**Bonus puanlar:**
- Doğru hata yönetimi ekleyin
- Maliyet tahmini dahil edin
- İzleme panelleri kurun

## Modül 6: Yaygın Sorunları Giderme

### Yaygın Dağıtım Sorunları

#### Sorun 1: OpenAI Servis Kota Aşıldı
**Belirtiler:** Dağıtım kota hatası ile başarısız olur
**Çözümler:**
```bash
# Mevcut kotaları kontrol et
az cognitiveservices usage list --location eastus

# Kota artışı talep et veya farklı bir bölgeyi dene
azd env set AZURE_LOCATION westus2
azd up
```

#### Sorun 2: Model Bölgenizde Kullanılamıyor
**Belirtiler:** AI yanıtlar başarısız olur veya model dağıtım hataları oluşur
**Çözümler:**
```bash
# Bölgeye göre model kullanılabilirliğini kontrol et
az cognitiveservices model list --location eastus

# Mevcut modele güncelleştir
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Sorun 3: İzin Sorunları
**Belirtiler:** AI servis çağrılarında 403 Yasak hataları
**Çözümler:**
```bash
# Rol atamalarını kontrol et
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Eksik rolleri ekle
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performans Sorunları

#### Sorun 4: Yavaş AI Yanıtları
**Araştırma adımları:**
1. Application Insights üzerinden performans metriklerini kontrol edin
2. Azure portalında OpenAI servis metriklerini gözden geçirin
3. Ağ bağlantısı ve gecikmeyi doğrulayın

**Çözümler:**
- Yaygın sorgular için önbellekleme uygulayın
- Kullanım durumunuza uygun OpenAI modeli seçin
- Yüksek trafik senaryoları için okuma replika kullanmayı düşünün

### **Laboratuvar Egzersizi 6.1: Hata Ayıklama Meydan Okuması**

**Senaryo:** Dağıtımınız başarılı oldu ama uygulama 500 hataları döndürüyor.

**Hata ayıklama görevleri:**
1. Uygulama günlüklerini kontrol edin
2. Servis bağlantısını doğrulayın
3. Kimlik doğrulamayı test edin
4. Konfigürasyonu gözden geçirin

**Kullanılacak araçlar:**
- Dağıtım genel bakışı için `azd show`
- Ayrıntılı servis günlükleri için Azure portal
- Uygulama telemetrisi için Application Insights

## Modül 7: İzleme ve Optimizasyon

### Adım 7.1: Kapsamlı İzlemeyi Kurma

1. **Özel paneller oluşturun:**

Azure portalına gidin ve şu panelleri oluşturun:
- OpenAI istek sayısı ve gecikmesi
- Uygulama hata oranları
- Kaynak kullanımı
- Maliyet takibi

2. **Uyarılar kurun:**
```bash
# Yüksek hata oranı için uyarı
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Adım 7.2: Maliyet Optimizasyonu

1. **Mevcut maliyetleri analiz edin:**
```bash
# Maliyet verilerini almak için Azure CLI kullanın
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Maliyet kontrollerini uygulayın:**
- Bütçe uyarıları kurun
- Otomatik ölçeklendirme politikaları kullanın
- İstek önbelleklemesini uygulayın
- OpenAI için token kullanımını izleyin

### **Laboratuvar Egzersizi 7.1: Performans Optimizasyonu**

**Görev:** AI uygulamanızı performans ve maliyet açısından optimize edin.

**İyileştirilecek metrikler:**
- Ortalama yanıt süresini %20 azaltmak
- Aylık maliyetleri %15 azaltmak
- %99.9 çalışma süresi sağlamak

**Denenecek stratejiler:**
- Yanıt önbellekleme uygulayın
- Token verimliliği için istemleri optimize edin
- Uygun hesaplama SKU'ları kullanın
- Doğru otomatik ölçeklendirme kurun

## Nihai Meydan Okuma: Baştan Sona Uygulama

### Meydan Okuma Senaryosu

Üretime hazır, AI destekli müşteri destek sohbet botu oluşturmanız isteniyor, şu gereksinimlere sahipsiniz:

**Fonksiyonel Gereksinimler:**
- Müşteri etkileşimleri için web arayüzü
- Yanıtlar için Microsoft Foundry Modeller entegrasyonu
- Azure AI Search ile belge arama yeteneği
- Mevcut müşteri veritabanıyla entegrasyon
- Çok dilli destek

**Fonksiyonel Olmayan Gereksinimler:**
- 1000 eşzamanlı kullanıcıyı karşılayabilme
- %99.9 çalışma süresi SLA'sı
- SOC 2 uyumluluğu
- Aylık $500 altında maliyet
- Birden çok ortamda dağıtım (geliştirme, test, üretim)

### Uygulama Adımları

1. **Mimarinin tasarımı**
2. **AZD şablonunun oluşturulması**
3. **Güvenlik önlemlerinin uygulanması**
4. **İzleme ve uyarı sistemlerinin kurulması**
5. **Dağıtım boru hatlarının oluşturulması**
6. **Çözümün dokümantasyonu**

### Değerlendirme Kriterleri

- ✅ **Fonksiyonellik**: Tüm gereksinimleri karşılıyor mu?
- ✅ **Güvenlik**: En iyi uygulamalar uygulanmış mı?
- ✅ **Ölçeklenebilirlik**: Yükü karşılayabiliyor mu?
- ✅ **Bakım Kolaylığı**: Kod ve altyapı düzenli mi?
- ✅ **Maliyet**: Bütçe dahilinde mi?

## Ek Kaynaklar

### Microsoft Belgeleri
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Modeller Servis Belgeleri](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Belgeleri](https://learn.microsoft.com/azure/ai-studio/)

### Örnek Şablonlar
- [Microsoft Foundry Modeller Sohbet Uygulaması](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Sohbet Uygulaması Hızlı Başlangıç](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Sohbet](https://github.com/Azure-Samples/contoso-chat)

### Topluluk Kaynakları
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Harika AZD Şablonları](https://azure.github.io/awesome-azd/)

## 🎓 Tamamlama Sertifikası

Tebrikler! AI Atölye Laboratuvarını tamamladınız. Artık şunları yapabilmelisiniz:

- ✅ Mevcut AI uygulamalarını AZD şablonlarına dönüştürmek
- ✅ Üretim hazır AI uygulamaları dağıtmak
- ✅ AI iş yükleri için en iyi güvenlik uygulamalarını uygulamak
- ✅ AI uygulama performansını izlemek ve optimize etmek
- ✅ Yaygın dağıtım sorunlarını gidermek

### Sonraki Adımlar
1. Bu kalıpları kendi AI projelerinize uygulayın
2. Şablonları topluluğa geri katkıda bulunun
3. Sürekli destek için Microsoft Foundry Discord'a katılın
4. Çok bölgeli dağıtımlar gibi ileri konuları keşfedin

---

**Atölye Geri Bildirimi**: Deneyiminizi [Microsoft Foundry Discord #Azure kanalı](https://discord.gg/microsoft-azure) üzerinden paylaşarak bu atölyeyi geliştirmemize yardımcı olun.

---

**Bölüm Gezinme:**
- **📚 Ders Anasayfası**: [Yeni Başlayanlar için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** AZD ve AI dağıtımlarıyla ilgili destek ve tartışmalar için topluluğumuza katılın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
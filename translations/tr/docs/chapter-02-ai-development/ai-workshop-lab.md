# AI Atölye Laboratuvarı: Yapay Zeka Çözümlerinizi AZD ile Dağıtıma Hazır Hale Getirme

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

## Atölye Genel Bakış

Bu uygulamalı laboratuvar, geliştiricilere mevcut bir AI şablonunu alıp Azure Developer CLI (AZD) kullanarak dağıtma sürecinde rehberlik eder. Microsoft Foundry hizmetlerini kullanarak üretim düzeyinde AI dağıtımları için temel desenleri öğreneceksiniz.

> **Doğrulama notu (2026-03-25):** Bu atölye `azd` `1.23.12` sürümü ile gözden geçirilmiştir. Yerel kurulumunuz daha eskiyse, kimlik doğrulama, şablon ve dağıtım iş akışının aşağıdaki adımlarla eşleşmesi için başlamadan önce AZD'yi güncelleyin.

**Süre:** 2-3 saat  
**Seviye:** Orta  
**Önkoşullar:** Temel Azure bilgisi, Yapay Zeka/Makine Öğrenimi (AI/ML) kavramlarına aşinalık

## 🎓 Öğrenme Hedefleri

Eğitimin sonunda şunları yapabileceksiniz:
- ✅ Var olan bir AI uygulamasını AZD şablonlarıyla çalışacak şekilde dönüştürebilme
- ✅ Microsoft Foundry hizmetlerini AZD ile yapılandırabilme
- ✅ AI hizmetleri için güvenli kimlik bilgisi yönetimi uygulayabilme
- ✅ İzleme ile üretime hazır AI uygulamaları dağıtabilme
- ✅ Yaygın AI dağıtım sorunlarını giderebilme

## Önkoşullar

### Gerekli Araçlar
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) yüklü
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) yüklü
- [Git](https://git-scm.com/) yüklü
- Kod düzenleyici (VS Code önerilir)

### Azure Kaynakları
- Azure aboneliği (contributor erişimi)
- Microsoft Foundry Models hizmetlerine erişim (veya erişim talep etme yeteneği)
- Kaynak grubu oluşturma izinleri

### Bilgi Önkoşulları
- Azure hizmetlerinin temel kavrayışı
- Komut satırı arayüzlerine aşinalık
- Temel AI/ML kavramları (API'ler, modeller, promptlar)

## Laboratuvar Kurulumu

### Adım 1: Ortam Hazırlığı

1. **Araç kurulumlarını doğrulayın:**
```bash
# AZD kurulumunu kontrol et
azd version

# Azure CLI'yi kontrol et
az --version

# AZD iş akışları için Azure'a giriş yap
azd auth login

# Tanılama sırasında az komutlarını çalıştırmayı planlıyorsanız yalnızca Azure CLI'ye giriş yap
az login
```

Çoklu kiracılar arasında çalışıyorsanız veya aboneliğiniz otomatik olarak algılanmıyorsa, `azd auth login --tenant-id <tenant-id>` ile yeniden deneyin.

2. **Atölye deposunu kopyalayın:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modül 1: AI Uygulamaları için AZD Yapısını Anlama

### Bir AI AZD Şablonunun Anatomisi

AI hazır AZD şablonundaki önemli dosyaları keşfedin:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Laboratuvar Egzersizi 1.1: Yapılandırmayı Keşfedin**

1. **azure.yaml dosyasını inceleyin:**
```bash
cat azure.yaml
```

**Nelere bakılmalı:**
- AI bileşenleri için servis tanımları
- Ortam değişkeni eşlemeleri
- Barındırma yapılandırmaları

2. **main.bicep altyapısını inceleyin:**
```bash
cat infra/main.bicep
```

**Tanımlanacak temel AI desenleri:**
- Microsoft Foundry Models hizmetinin sağlanması
- Cognitive Search entegrasyonu
- Güvenli anahtar yönetimi
- Ağ güvenliği yapılandırmaları

### **Tartışma Noktası:** Bu Desenler AI için Neden Önemli

- **Hizmet Bağımlılıkları**: AI uygulamaları genellikle birden fazla koordine hizmet gerektirir
- **Güvenlik**: API anahtarları ve uç noktalar güvenli yönetim gerektirir
- **Ölçeklenebilirlik**: AI iş yüklerinin benzersiz ölçek gereksinimleri vardır
- **Maliyet Yönetimi**: AI hizmetleri uygun yapılandırılmadığında maliyetli olabilir

## Modül 2: İlk AI Uygulamanızı Dağıtın

### Adım 2.1: Ortamı Başlatın

1. **Yeni bir AZD ortamı oluşturun:**
```bash
azd env new myai-workshop
```

2. **Gerekli parametreleri ayarlayın:**
```bash
# Tercih ettiğiniz Azure bölgesini ayarlayın
azd env set AZURE_LOCATION eastus

# İsteğe bağlı: Belirli bir OpenAI modelini ayarlayın
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Adım 2.2: Altyapıyı ve Uygulamayı Dağıtma

1. **AZD ile dağıtın:**
```bash
azd up
```

**`azd up` sırasında neler olur:**
- ✅ Microsoft Foundry Models hizmetini sağlar
- ✅ Cognitive Search hizmetini oluşturur
- ✅ Web uygulaması için App Service'i kurar
- ✅ Ağ ve güvenliği yapılandırır
- ✅ Uygulama kodunu dağıtır
- ✅ İzleme ve günlüklemeyi kurar

2. **Dağıtım ilerlemesini izleyin** ve oluşturulan kaynakları not edin.

### Adım 2.3: Dağıtımınızı Doğrulayın

1. **Dağıtılan kaynakları kontrol edin:**
```bash
azd show
```

2. **Dağıtılan uygulamayı açın:**
```bash
azd show
```

`azd show` çıktısında gösterilen web uç noktasını açın.

3. **AI işlevselliğini test edin:**
   - Web uygulamasına gidin
   - Örnek sorguları deneyin
   - AI yanıtlarının çalıştığını doğrulayın

### **Laboratuvar Egzersizi 2.1: Sorun Giderme Uygulaması**

**Senaryo**: Dağıtımınız başarılı oldu ancak AI yanıt vermiyor.

**Kontrol edilecek yaygın sorunlar:**
1. **OpenAI API anahtarları**: Doğru ayarlandıklarını doğrulayın
2. **Model kullanılabilirliği**: Bölgenizin modeli destekleyip desteklemediğini kontrol edin
3. **Ağ bağlantısı**: Hizmetlerin iletişim kurabildiğinden emin olun
4. **RBAC izinleri**: Uygulamanın OpenAI'ye erişebildiğini doğrulayın

**Hata ayıklama komutları:**
```bash
# Ortam değişkenlerini kontrol et
azd env get-values

# Dağıtım günlüklerini görüntüle
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI dağıtım durumunu kontrol et
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modül 3: AI Uygulamalarını İhtiyaçlarınıza Göre Özelleştirme

### Adım 3.1: AI Yapılandırmasını Değiştirme

1. **OpenAI modelini güncelleyin:**
```bash
# Bölgenizde mevcutsa farklı bir modele geçin
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Yeni yapılandırmayla yeniden dağıtın
azd deploy
```

2. **Ek AI hizmetleri ekleyin:**

Document Intelligence eklemek için `infra/main.bicep` dosyasını düzenleyin:
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

### Adım 3.2: Ortama Özgü Yapılandırmalar

**En İyi Uygulama**: Geliştirme ve üretim için farklı yapılandırmalar.

1. **Bir üretim ortamı oluşturun:**
```bash
azd env new myai-production
```

2. **Üretime özgü parametreleri ayarlayın:**
```bash
# Üretim genellikle daha yüksek SKU'ları kullanır
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ek güvenlik özelliklerini etkinleştirin
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratuvar Egzersizi 3.1: Maliyet Optimizasyonu**

**Zorluk**: Şablonu maliyet-etkin geliştirme için yapılandırın.

**Görevler:**
1. Hangi SKU'ların ücretsiz/temel seviyelere ayarlanabileceğini belirleyin
2. Minimal maliyet için ortam değişkenlerini yapılandırın
3. Dağıtın ve maliyetleri üretim yapılandırmasıyla karşılaştırın

**Çözüm ipuçları:**
- Mümkünse Cognitive Services için F0 (ücretsiz) katmanını kullanın
- Geliştirmede Search Service için Basic katmanını kullanın
- Functions için Consumption planını kullanmayı düşünün

## Modül 4: Güvenlik ve Üretim İçin En İyi Uygulamalar

### Adım 4.1: Güvenli Kimlik Bilgisi Yönetimi

**Mevcut zorluk**: Birçok AI uygulaması API anahtarlarını sabit kodluyor veya güvensiz depolama kullanıyor.

**AZD Çözümü**: Managed Identity + Key Vault entegrasyonu.

1. **Şablonunuzdaki güvenlik yapılandırmasını gözden geçirin:**
```bash
# Key Vault ve Yönetilen Kimlik yapılandırmasını arayın
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity'nin çalıştığını doğrulayın:**
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

1. **Application Insights'ı yapılandırın:**
```bash
# Application Insights otomatik olarak yapılandırılmalıdır
# Yapılandırmayı kontrol edin:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI'ya özel izlemeyi ayarlayın:**

AI işlemleri için özel metrikler ekleyin:
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

**Görev**: Dağıtımınızı güvenlik en iyi uygulamaları açısından gözden geçirin.

**Kontrol Listesi:**
- [ ] Kodda veya yapılandırmada sert kodlanmış gizli bilgiler yok
- [ ] Hizmetler arası kimlik doğrulama için Managed Identity kullanılmış
- [ ] Hassas yapılandırma Key Vault'ta saklanıyor
- [ ] Ağ erişimi doğru şekilde kısıtlanmış
- [ ] İzleme ve günlükleme etkinleştirilmiş

## Modül 5: Kendi AI Uygulamanızı Dönüştürme

### Adım 5.1: Değerlendirme Çalışma Sayfası

**Uygulamanızı dönüştürmeden önce**, bu soruları cevaplayın:

1. **Uygulama Mimarisi:**
   - Uygulamanız hangi AI hizmetlerini kullanıyor?
   - Hangi hesaplama kaynaklarına ihtiyaç duyuyor?
   - Bir veritabanına ihtiyaç var mı?
   - Hizmetler arasındaki bağımlılıklar nelerdir?

2. **Güvenlik Gereksinimleri:**
   - Uygulamanız hangi hassas verileri işliyor?
   - Hangi uyumluluk gereksinimleriniz var?
   - Özel ağ gereksiniminiz var mı?

3. **Ölçeklendirme Gereksinimleri:**
   - Beklenen yükünüz nedir?
   - Otomatik ölçeklendirmeye ihtiyacınız var mı?
   - Bölgesel gereksinimler var mı?

### Adım 5.2: AZD Şablonunuzu Oluşturun

**Uygulamanızı dönüştürmek için bu deseni izleyin:**

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

**Zorluk**: Belge işleme AI uygulaması için bir AZD şablonu oluşturun.

**Gereksinimler:**
- İçerik analizi için Microsoft Foundry Models
- OCR için Document Intelligence
- Belge yüklemeleri için Storage Account
- İşleme mantığı için Function App
- Kullanıcı arayüzü için web uygulaması

**Ek puanlar:**
- Uygun hata yönetimi ekleyin
- Maliyet tahmini dahil edin
- İzleme panoları kurun

## Modül 6: Yaygın Sorunların Giderilmesi

### Yaygın Dağıtım Sorunları

#### Sorun 1: OpenAI Servis Kotası Aşıldı
**Belirtiler:** Dağıtım kota hatası ile başarısız oluyor
**Çözümler:**
```bash
# Mevcut kotaları kontrol et
az cognitiveservices usage list --location eastus

# Kota artışı talep et veya farklı bir bölgeyi dene
azd env set AZURE_LOCATION westus2
azd up
```

#### Sorun 2: Model Bölgenizde Kullanılabilir Değil
**Belirtiler:** AI yanıtları başarısız oluyor veya model dağıtımı hataları
**Çözümler:**
```bash
# Bölgeye göre model kullanılabilirliğini kontrol et
az cognitiveservices model list --location eastus

# Kullanılabilir modele güncelle
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Sorun 3: İzin Sorunları
**Belirtiler:** AI hizmetlerini çağırırken 403 Forbidden hataları
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
1. Performans metrikleri için Application Insights'ı kontrol edin
2. Azure portalında OpenAI servis metriklerini gözden geçirin
3. Ağ bağlantısını ve gecikmeyi doğrulayın

**Çözümler:**
- Yaygın sorgular için önbellekleme uygulayın
- Kullanım durumunuza uygun OpenAI modelini kullanın
- Yüksek trafikli senaryolar için okuma replikalarını değerlendirin

### **Laboratuvar Egzersizi 6.1: Hata Ayıklama Meydan Okuması**

**Senaryo**: Dağıtımınız başarılı oldu, ancak uygulama 500 hataları döndürüyor.

**Hata ayıklama görevleri:**
1. Uygulama günlüklerini kontrol edin
2. Hizmet bağlantısını doğrulayın
3. Kimlik doğrulamayı test edin
4. Yapılandırmayı gözden geçirin

**Kullanılacak araçlar:**
- Dağıtım genel bakışı için `azd show`
- Detaylı servis günlükleri için Azure portalı
- Uygulama telemetrisi için Application Insights

## Modül 7: İzleme ve Optimizasyon

### Adım 7.1: Kapsamlı İzleme Kurulumu

1. **Özel panolar oluşturun:**

Azure portalına gidin ve şu öğelerle bir pano oluşturun:
- OpenAI istek sayısı ve gecikme
- Uygulama hata oranları
- Kaynak kullanımı
- Maliyet takibi

2. **Uyarıları ayarlayın:**
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

2. **Maliyet kontrolleri uygulayın:**
- Bütçe uyarıları oluşturun
- Otomatik ölçeklendirme politikaları kullanın
- İstek önbellekleme uygulayın
- OpenAI için token kullanımını izleyin

### **Laboratuvar Egzersizi 7.1: Performans Optimizasyonu**

**Görev**: AI uygulamanızı hem performans hem maliyet açısından optimize edin.

**İyileştirilecek metrikler:**
- Ortalama yanıt süresini %20 azaltın
- Aylık maliyetleri %15 azaltın
- %99,9 kullanılabilirlik sağlayın

**Denenecek stratejiler:**
- Yanıt önbellekleme uygulayın
- Token verimliliği için promptları optimize edin
- Uygun hesaplama SKU'larını kullanın
- Doğru otomatik ölçeklendirmeyi kurun

## Final Zorluğu: Uçtan Uca Uygulama

### Zorluk Senaryosu

Aşağıdaki gereksinimlere sahip üretime hazır, AI destekli bir müşteri hizmetleri sohbet botu oluşturma görevi verildi:

**Fonksiyonel Gereksinimler:**
- Müşteri etkileşimleri için web arayüzü
- Yanıtlar için Microsoft Foundry Models ile entegrasyon
- Cognitive Search kullanarak belge arama yeteneği
- Mevcut müşteri veritabanı ile entegrasyon
- Çok dilli destek

**Fonksiyonel Olmayan Gereksinimler:**
- 1000 eşzamanlı kullanıcıyı işleyebilme
- %99,9 kullanılabilirlik SLA'sı
- SOC 2 uyumluluğu
- Aylık maliyet $500 altında
- Birden çok ortama dağıtım (dev, staging, prod)

### Uygulama Adımları

1. **Mimarisi tasarlayın**
2. **AZD şablonunu oluşturun**
3. **Güvenlik önlemlerini uygulayın**
4. **İzleme ve uyarıları kurun**
5. **Dağıtım pipeline'ları oluşturun**
6. **Çözümü belgeleyin**

### Değerlendirme Kriterleri

- ✅ **Fonksiyonellik**: Tüm gereksinimleri karşılıyor mu?
- ✅ **Güvenlik**: En iyi uygulamalar uygulanmış mı?
- ✅ **Ölçeklenebilirlik**: Yükü kaldırabilir mi?
- ✅ **Bakım Kolaylığı**: Kod ve altyapı iyi organize edilmiş mi?
- ✅ **Maliyet**: Bütçe dahilinde mi kalıyor?

## Ek Kaynaklar

### Microsoft Dokümantasyonu
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Hizmet Dokümantasyonu](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokümantasyonu](https://learn.microsoft.com/azure/ai-studio/)

### Örnek Şablonlar
- [Microsoft Foundry Modelleri Sohbet Uygulaması](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Sohbet Uygulaması Hızlı Başlangıç](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Sohbet](https://github.com/Azure-Samples/contoso-chat)

### Topluluk Kaynakları
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Harika AZD Şablonları](https://azure.github.io/awesome-azd/)

## 🎓 Tamamlama Sertifikası

Tebrikler! AI Atölye Laboratuvarını tamamladınız. Artık şunları yapabilmelisiniz:

- ✅ Mevcut AI uygulamalarını AZD şablonlarına dönüştürmek
- ✅ Üretime hazır AI uygulamalarını dağıtmak
- ✅ AI iş yükleri için güvenlik en iyi uygulamalarını uygulamak
- ✅ AI uygulama performansını izlemek ve optimize etmek
- ✅ Yaygın dağıtım sorunlarını gidermek

### Sonraki Adımlar
1. Bu desenleri kendi AI projelerinize uygulayın
2. Şablonları topluluğa katkıda bulundurun
3. Sürekli destek için Microsoft Foundry Discord'a katılın
4. Çok bölgeli dağıtımlar gibi ileri konuları keşfedin

---

**Atölye Geri Bildirimi**: Deneyiminizi [Microsoft Foundry Discord #Azure kanalı](https://discord.gg/microsoft-azure) üzerinden paylaşarak bu atölyeyi geliştirmemize yardımcı olun.

---

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Modeli Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** Topluluğumuza katılın ve AZD ile AI dağıtımları hakkında destek ve tartışmalara katılın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka (AI) çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge, kendi ana dilindeki hali yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel bir insan çevirmeni tarafından yapılan çeviri önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
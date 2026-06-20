# AI Atölye Laboratuvarı: AI Çözümlerinizi AZD ile Dağıtıma Uygun Hale Getirme

**Chapter Navigation:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

## Atölye Genel Bakış

Bu uygulamalı laboratuvar, geliştiricileri mevcut bir AI şablonunu alıp Azure Developer CLI (AZD) kullanarak dağıtma sürecinde yönlendirir. Microsoft Foundry hizmetlerini kullanarak üretim AI dağıtımları için temel desenleri öğreneceksiniz.

> **Doğrulama notu (2026-03-25):** Bu atölye `azd` `1.23.12` sürümüne göre gözden geçirilmiştir. Yerel kurulumunuz daha eskiyse, kimlik doğrulama, şablon ve dağıtım iş akışının aşağıdaki adımlarla eşleşmesi için başlamadan önce AZD'yi güncelleyin.

**Süre:** 2-3 saat  
**Seviye:** Orta  
**Önkoşullar:** Temel Azure bilgisi, AI/ML kavramlarına aşinalık

## 🎓 Öğrenme Hedefleri

Eğitimin sonunda şunları yapabileceksiniz:
- ✅ Mevcut bir AI uygulamasını AZD şablonlarını kullanacak şekilde dönüştürmek
- ✅ Microsoft Foundry hizmetlerini AZD ile yapılandırmak
- ✅ AI hizmetleri için güvenli kimlik bilgisi yönetimi uygulamak
- ✅ İzleme ile üretime hazır AI uygulamaları dağıtmak
- ✅ Yaygın AI dağıtım sorunlarını gidermek

## Önkoşullar

### Gerekli Araçlar
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) yüklü
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) yüklü
- [Git](https://git-scm.com/) yüklü
- Kod düzenleyici (VS Code önerilir)

### Azure Kaynakları
- Contributor erişimine sahip Azure aboneliği
- Microsoft Foundry Models hizmetlerine erişim (veya erişim talep etme yeteneği)
- Resource group oluşturma izinleri

### Bilgi Önkoşulları
- Azure hizmetlerine dair temel anlayış
- Komut satırı arayüzlerine aşinalık
- Temel AI/ML kavramları (API'ler, modeller, promptlar)

## Laboratuvar Kurulumu

### Adım 1: Ortam Hazırlığı

1. **Araç kurulumlarını doğrulayın:**
```bash
# AZD kurulumunu kontrol edin
azd version

# Azure CLI'yi kontrol edin
az --version

# AZD iş akışları için Azure'a giriş yapın
azd auth login

# Tanılama sırasında az komutlarını çalıştırmayı planlıyorsanız yalnızca Azure CLI'ye giriş yapın
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Atölye deposunu klonlayın:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modül 1: AI Uygulamaları için AZD Yapısını Anlamak

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
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Laboratuvar Alıştırması 1.1: Yapılandırmayı Keşfetme**

1. **azure.yaml dosyasını inceleyin:**
```bash
cat azure.yaml
```

**Dikkat edilecekler:**
- AI bileşenleri için servis tanımları
- Çevresel değişken eşlemeleri
- Host yapılandırmaları

2. **main.bicep altyapısını gözden geçirin:**
```bash
cat infra/main.bicep
```

**Belirlenecek temel AI desenleri:**
- Microsoft Foundry Models servisi sağlama
- Azure AI Search entegrasyonu
- Güvenli anahtar yönetimi
- Ağ güvenliği yapılandırmaları

### **Tartışma Noktası:** Bu Desenler AI İçin Neden Önemli

- **Servis Bağımlılıkları**: AI uygulamaları genellikle birden çok koordineli hizmete ihtiyaç duyar
- **Güvenlik**: API anahtarları ve uç noktalar güvenli bir şekilde yönetilmelidir
- **Ölçeklenebilirlik**: AI iş yüklerinin benzersiz ölçeklendirme gereksinimleri vardır
- **Maliyet Yönetimi**: AI hizmetleri doğru yapılandırılmazsa pahalı olabilir

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

### Adım 2.2: Altyapıyı ve Uygulamayı Dağıtma

1. **AZD ile dağıtın:**
```bash
azd up
```

**`azd up` sırasında neler olur:**
- ✅ Microsoft Foundry Models servisi oluşturulur
- ✅ Azure AI Search servisi oluşturulur
- ✅ Web uygulaması için App Service kurulur
- ✅ Ağ ve güvenlik yapılandırılır
- ✅ Uygulama kodu dağıtılır
- ✅ İzleme ve günlükleme ayarlanır

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

Open the web endpoint shown in the `azd show` output.

3. **AI işlevselliğini test edin:**
   - Web uygulamasına gidin
   - Örnek sorguları deneyin
   - AI yanıtlarının çalıştığını doğrulayın

### **Laboratuvar Alıştırması 2.1: Sorun Giderme Pratiği**

**Durum**: Dağıtımınız başarılı oldu ama AI yanıt vermiyor.

**Kontrol edilecek yaygın sorunlar:**
1. **OpenAI API anahtarları**: Doğru ayarlandıklarından emin olun
2. **Model kullanılabilirliği**: Bölgenizin modeli destekleyip desteklemediğini kontrol edin
3. **Ağ bağlantısı**: Hizmetlerin iletişim kurabildiğinden emin olun
4. **RBAC izinleri**: Uygulamanın OpenAI'ya erişebildiğini doğrulayın

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

2. **Ek AI servisleri ekleyin:**

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

**En İyi Uygulama**: Geliştirme ve üretim için farklı yapılandırmalar kullanın.

1. **Üretim ortamı oluşturun:**
```bash
azd env new myai-production
```

2. **Üretime özgü parametreleri ayarlayın:**
```bash
# Üretimde genellikle daha yüksek SKU'lar kullanılır
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ek güvenlik özelliklerini etkinleştir
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratuvar Alıştırması 3.1: Maliyet Optimizasyonu**

**Zorluk**: Şablonu maliyet-etkin geliştirme için yapılandırın.

**Görevler:**
1. Hangi SKU'ların ücretsiz/temel seviyeye ayarlanabileceğini belirleyin
2. Minimum maliyet için ortam değişkenlerini yapılandırın
3. Dağıtın ve üretim yapılandırmasıyla maliyetleri karşılaştırın

**Çözüm ipuçları:**
- Mümkün olduğunda Azure AI Services için F0 (ücretsiz) katmanını kullanın
- Geliştirmede Search Servisi için Basic katmanını kullanın
- Functions için Consumption planını değerlendirin

## Modül 4: Güvenlik ve Üretim En İyi Uygulamaları

### Adım 4.1: Güvenli Kimlik Bilgisi Yönetimi

**Mevcut sorun**: Birçok AI uygulaması API anahtarlarını kod içine sabitler veya güvensiz depolama kullanır.

**AZD Çözümü**: Managed Identity + Key Vault entegrasyonu.

1. **Şablonunuzdaki güvenlik yapılandırmasını gözden geçirin:**
```bash
# Key Vault ve Yönetilen Kimlik yapılandırmasını arayın
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity'in çalıştığını doğrulayın:**
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

### Adım 4.3: İzleme ve Görünürlük

1. **Application Insights'ı yapılandırın:**
```bash
# Application Insights otomatik olarak yapılandırılmalıdır
# Yapılandırmayı kontrol edin:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI'ya özgü izlemeyi kurun:**

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

### **Laboratuvar Alıştırması 4.1: Güvenlik Denetimi**

**Görev**: Dağıtımınızı güvenlik en iyi uygulamaları açısından gözden geçirin.

**Kontrol Listesi:**
- [ ] Kodda veya yapılandırmada sabitlenmiş gizli anahtar yok
- [ ] Servisler arası kimlik doğrulama için Managed Identity kullanılıyor
- [ ] Hassas yapılandırmalar Key Vault'ta saklanıyor
- [ ] Ağ erişimi uygun şekilde kısıtlanmış
- [ ] İzleme ve günlükleme etkin

## Modül 5: Kendi AI Uygulamanızı Dönüştürme

### Adım 5.1: Değerlendirme çalışma sayfası

**Uygulamanızı dönüştürmeden önce**, bu soruları cevaplayın:

1. **Uygulama Mimarisi:**
   - Uygulamanız hangi AI servislerini kullanıyor?
   - Hangi hesaplama kaynaklarına ihtiyaç duyuyor?
   - Bir veritabanına ihtiyaç var mı?
   - Servisler arasındaki bağımlılıklar nelerdir?

2. **Güvenlik Gereksinimleri:**
   - Uygulamanız hangi hassas verileri işliyor?
   - Hangi uyumluluk gereksinimleriniz var?
   - Özel ağ gerekiyorsa?

3. **Ölçeklendirme Gereksinimleri:**
   - Beklenen yük nedir?
   - Otomatik ölçeklendirmeye ihtiyaç var mı?
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

### **Laboratuvar Alıştırması 5.1: Şablon Oluşturma Zorluğu**

**Zorluk**: Belge işleme AI uygulaması için bir AZD şablonu oluşturun.

**Gereksinimler:**
- İçerik analizi için Microsoft Foundry Models
- OCR için Document Intelligence
- Belge yüklemeleri için Storage Account
- İşleme mantığı için Function App
- Kullanıcı arayüzü için Web uygulaması

**Bonus puanlar:**
- Uygun hata işleme ekleyin
- Maliyet tahmini dahil edin
- İzleme panoları kurun

## Modül 6: Yaygın Sorunları Giderme

### Yaygın Dağıtım Sorunları

#### Sorun 1: OpenAI Servis Kota Aşıldı
**Belirtiler:** Dağıtım kota hatası ile başarısız oluyor
**Çözümler:**
```bash
# Mevcut kotaları kontrol et
az cognitiveservices usage list --location eastus

# Kota artışı talep et veya farklı bir bölge dene
azd env set AZURE_LOCATION westus2
azd up
```

#### Sorun 2: Model Bölgeden Kullanılamıyor
**Belirtiler:** AI yanıtları başarısız oluyor veya model dağıtım hataları
**Çözümler:**
```bash
# Bölgeye göre model kullanılabilirliğini kontrol edin
az cognitiveservices model list --location eastus

# Kullanılabilir modele güncelleyin
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
3. Ağ bağlantısı ve gecikmeyi doğrulayın

**Çözümler:**
- Yaygın sorgular için önbellekleme uygulayın
- Kullanım durumunuza uygun OpenAI modelini tercih edin
- Yüksek trafik senaryoları için okunabilir replika çözümlerini düşünün

### **Laboratuvar Alıştırması 6.1: Hata Ayıklama Zorluğu**

**Durum**: Dağıtımınız başarılı oldu, ancak uygulama 500 hataları döndürüyor.

**Hata ayıklama görevleri:**
1. Uygulama günlüklerini kontrol edin
2. Servis bağlantılarını doğrulayın
3. Kimlik doğrulamayı test edin
4. Yapılandırmayı gözden geçirin

**Kullanılacak araçlar:**
- `azd show` ile dağıtım genel bakışı
- Ayrıntılı servis günlükleri için Azure portalı
- Uygulama telemetrisi için Application Insights

## Modül 7: İzleme ve Optimizasyon

### Adım 7.1: Kapsamlı İzleme Kurun

1. **Özel panolar oluşturun:**

Azure portalına gidin ve şu öğeleri içeren bir pano oluşturun:
- OpenAI istek sayısı ve gecikme
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

2. **Maliyet kontrolleri uygulayın:**
- Bütçe uyarıları kurun
- Otomatik ölçeklendirme politikaları kullanın
- İstek önbellekleme uygulayın
- OpenAI için token kullanımını izleyin

### **Laboratuvar Alıştırması 7.1: Performans Optimizasyonu**

**Görev**: AI uygulamanızı performans ve maliyet açısından optimize edin.

**İyileştirilecek metrikler:**
- Ortalama yanıt süresini %20 azaltmak
- Aylık maliyetleri %15 azaltmak
- %99.9 çalışma süresi sağlamak

**Denenecek stratejiler:**
- Yanıt önbellekleme uygulayın
- Token verimliliği için promptları optimize edin
- Uygun compute SKU'larını kullanın
- Uygun otomatik ölçeklendirme ayarları yapın

## Final Zorluğu: Uçtan Uca Uygulama

### Zorluk Senaryosu

Aşağıdaki gereksinimlere sahip üretime hazır AI destekli müşteri hizmetleri sohbet botu oluşturma görevi verildi:

**Fonksiyonel Gereksinimler:**
- Müşteri etkileşimleri için web arayüzü
- Yanıtlar için Microsoft Foundry Models entegrasyonu
- Azure AI Search kullanarak belge arama yeteneği
- Mevcut müşteri veritabanı ile entegrasyon
- Çoklu dil desteği

**Fonksiyonel Olmayan Gereksinimler:**
- 1000 eşzamanlı kullanıcıyı işleyebilme
- %99.9 çalışma süresi SLA'sı
- SOC 2 uyumluluğu
- Aylık maliyet $500 altında
- Birden fazla ortama dağıtım (dev, staging, prod)

### Uygulama Adımları

1. **Mimarinin tasarlanması**
2. **AZD şablonunun oluşturulması**
3. **Güvenlik önlemlerinin uygulanması**
4. **İzleme ve uyarıların kurulması**
5. **Dağıtım boru hatlarının oluşturulması**
6. **Çözümün belgelendirilmesi**

### Değerlendirme Kriterleri

- ✅ **Fonksiyonellik**: Tüm gereksinimleri karşılıyor mu?
- ✅ **Güvenlik**: En iyi uygulamalar uygulanmış mı?
- ✅ **Ölçeklenebilirlik**: Yükü kaldırabilir mi?
- ✅ **Sürdürülebilirlik**: Kod ve altyapı iyi organize edilmiş mi?
- ✅ **Maliyet**: Bütçe içinde mi?

## Ek Kaynaklar

### Microsoft Belgeleri
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Örnek Şablonlar
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Sohbet](https://github.com/Azure-Samples/contoso-chat)

### Topluluk Kaynakları
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Harika AZD Şablonları](https://azure.github.io/awesome-azd/)

## 🎓 Tamamlama Sertifikası

Tebrikler! AI Atölyesi Laboratuvarını tamamladınız. Artık şunları yapabilmelisiniz:

- ✅ Var olan AI uygulamalarını AZD şablonlarına dönüştürmek
- ✅ Üretim hazır AI uygulamalarını dağıtmak
- ✅ AI iş yükleri için güvenlik en iyi uygulamalarını uygulamak
- ✅ AI uygulama performansını izlemek ve optimize etmek
- ✅ Yaygın dağıtım sorunlarını gidermek

### Sonraki Adımlar
1. Bu desenleri kendi AI projelerinize uygulayın
2. Şablonları topluluğa katkı olarak sunun
3. Sürekli destek için Microsoft Foundry Discord'a katılın
4. Çok bölgeye dağıtımlar gibi gelişmiş konuları keşfedin

---

**Atölye Geri Bildirimi**: Deneyiminizi [Microsoft Foundry Discord #Azure kanalı](https://discord.gg/microsoft-azure) üzerinden paylaşarak bu atölyeyi geliştirmemize yardımcı olun.

---

**Bölüm Gezintisi:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** AZD ve AI dağıtımları hakkında destek ve tartışmalar için topluluğumuza katılın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
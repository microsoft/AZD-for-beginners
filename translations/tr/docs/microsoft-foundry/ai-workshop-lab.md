<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-21T00:26:07+00:00",
  "source_file": "docs/microsoft-foundry/ai-workshop-lab.md",
  "language_code": "tr"
}
-->
# AI Atölyesi Laboratuvarı: AI Çözümlerinizi AZD ile Dağıtılabilir Hale Getirme

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD Başlangıç Kılavuzu](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../getting-started/configuration.md)

## Atölye Genel Bakış

Bu uygulamalı laboratuvar, geliştiricilere mevcut bir AI şablonunu alıp Azure Developer CLI (AZD) kullanarak dağıtma sürecini öğretir. Microsoft Foundry hizmetlerini kullanarak üretim AI dağıtımları için temel desenleri öğreneceksiniz.

**Süre:** 2-3 saat  
**Seviye:** Orta  
**Ön Koşullar:** Temel Azure bilgisi, AI/ML kavramlarına aşinalık

## 🎓 Öğrenme Hedefleri

Bu atölye sonunda şunları yapabileceksiniz:
- ✅ Mevcut bir AI uygulamasını AZD şablonlarını kullanacak şekilde dönüştürmek
- ✅ Microsoft Foundry hizmetlerini AZD ile yapılandırmak
- ✅ AI hizmetleri için güvenli kimlik bilgisi yönetimini uygulamak
- ✅ İzleme ile üretime hazır AI uygulamaları dağıtmak
- ✅ Yaygın AI dağıtım sorunlarını gidermek

## Ön Koşullar

### Gerekli Araçlar
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) yüklü
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) yüklü
- [Git](https://git-scm.com/) yüklü
- Kod düzenleyici (VS Code önerilir)

### Azure Kaynakları
- Katkıda bulunan erişimine sahip bir Azure aboneliği
- Azure OpenAI hizmetlerine erişim (veya erişim talep etme yeteneği)
- Kaynak grubu oluşturma izinleri

### Bilgi Ön Koşulları
- Azure hizmetleri hakkında temel bilgi
- Komut satırı arayüzlerine aşinalık
- Temel AI/ML kavramları (API'ler, modeller, istemler)

## Laboratuvar Kurulumu

### Adım 1: Ortam Hazırlığı

1. **Araç kurulumlarını doğrulayın:**
```bash
# AZD kurulumunu kontrol et
azd version

# Azure CLI'yi kontrol et
az --version

# Azure'a giriş yap
az login
azd auth login
```

2. **Atölye deposunu klonlayın:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modül 1: AI Uygulamaları için AZD Yapısını Anlama

### AI Hazır AZD Şablonunun Anatomisi

AI'ye hazır bir AZD şablonundaki temel dosyaları keşfedin:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
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

**Dikkat edilmesi gerekenler:**
- AI bileşenleri için hizmet tanımları
- Ortam değişkeni eşlemeleri
- Ana bilgisayar yapılandırmaları

2. **main.bicep altyapısını gözden geçirin:**
```bash
cat infra/main.bicep
```

**Belirlenmesi gereken temel AI desenleri:**
- Azure OpenAI hizmet sağlama
- Cognitive Search entegrasyonu
- Güvenli anahtar yönetimi
- Ağ güvenliği yapılandırmaları

### **Tartışma Noktası:** Bu Desenler AI için Neden Önemlidir?

- **Hizmet Bağımlılıkları**: AI uygulamaları genellikle birden fazla koordineli hizmet gerektirir
- **Güvenlik**: API anahtarları ve uç noktalar güvenli bir şekilde yönetilmelidir
- **Ölçeklenebilirlik**: AI iş yüklerinin benzersiz ölçeklenme gereksinimleri vardır
- **Maliyet Yönetimi**: AI hizmetleri doğru yapılandırılmazsa pahalı olabilir

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

# İsteğe bağlı: Belirli OpenAI modelini ayarlayın
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Adım 2.2: Altyapı ve Uygulamayı Dağıtın

1. **AZD ile dağıtın:**
```bash
azd up
```

**`azd up` sırasında ne olur:**
- ✅ Azure OpenAI hizmetini sağlar
- ✅ Cognitive Search hizmetini oluşturur
- ✅ Web uygulaması için App Service kurar
- ✅ Ağ ve güvenliği yapılandırır
- ✅ Uygulama kodunu dağıtır
- ✅ İzleme ve günlük kaydını ayarlar

2. **Dağıtım ilerlemesini izleyin** ve oluşturulan kaynakları not edin.

### Adım 2.3: Dağıtımınızı Doğrulayın

1. **Dağıtılan kaynakları kontrol edin:**
```bash
azd show
```

2. **Dağıtılan uygulamayı açın:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI işlevselliğini test edin:**
   - Web uygulamasına gidin
   - Örnek sorguları deneyin
   - AI yanıtlarının çalıştığını doğrulayın

### **Laboratuvar Egzersizi 2.1: Sorun Giderme Uygulaması**

**Senaryo**: Dağıtım başarılı oldu ancak AI yanıt vermiyor.

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

### Adım 3.1: AI Yapılandırmasını Değiştirin

1. **OpenAI modelini güncelleyin:**
```bash
# Bölgenizde mevcutsa farklı bir modele geçin
azd env set AZURE_OPENAI_MODEL gpt-4

# Yeni yapılandırma ile yeniden dağıtın
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

**En İyi Uygulama**: Geliştirme ve üretim için farklı yapılandırmalar kullanın.

1. **Bir üretim ortamı oluşturun:**
```bash
azd env new myai-production
```

2. **Üretime özgü parametreleri ayarlayın:**
```bash
# Üretim genellikle daha yüksek SKU'lar kullanır
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ek güvenlik özelliklerini etkinleştir
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratuvar Egzersizi 3.1: Maliyet Optimizasyonu**

**Zorluk**: Şablonu maliyet açısından verimli bir geliştirme için yapılandırın.

**Görevler:**
1. Hangi SKU'ların ücretsiz/temel katmanlara ayarlanabileceğini belirleyin
2. Minimum maliyet için ortam değişkenlerini yapılandırın
3. Dağıtın ve maliyetleri üretim yapılandırmasıyla karşılaştırın

**Çözüm ipuçları:**
- Mümkünse Cognitive Services için F0 (ücretsiz) katmanını kullanın
- Geliştirmede Search Service için Temel katmanı kullanın
- Functions için Tüketim planını düşünün

## Modül 4: Güvenlik ve Üretim En İyi Uygulamaları

### Adım 4.1: Güvenli Kimlik Bilgisi Yönetimi

**Mevcut zorluk**: Birçok AI uygulaması API anahtarlarını kodda sabitler veya güvensiz depolama kullanır.

**AZD Çözümü**: Yönetilen Kimlik + Key Vault entegrasyonu.

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

1. **Application Insights'ı yapılandırın:**
```bash
# Uygulama İçgörüleri otomatik olarak yapılandırılmalıdır
# Yapılandırmayı kontrol et:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI'ye özel izleme ayarlayın:**

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
- [ ] Kodda veya yapılandırmada sabitlenmiş sırlar yok
- [ ] Hizmetler arası kimlik doğrulama için Yönetilen Kimlik kullanılıyor
- [ ] Key Vault hassas yapılandırmayı saklıyor
- [ ] Ağ erişimi düzgün bir şekilde kısıtlanmış
- [ ] İzleme ve günlük kaydı etkin

## Modül 5: Kendi AI Uygulamanızı Dönüştürme

### Adım 5.1: Değerlendirme Çalışma Sayfası

**Uygulamanızı dönüştürmeden önce**, şu soruları yanıtlayın:

1. **Uygulama Mimarisi:**
   - Uygulamanız hangi AI hizmetlerini kullanıyor?
   - Hangi hesaplama kaynaklarına ihtiyaç duyuyor?
   - Bir veritabanı gerektiriyor mu?
   - Hizmetler arasındaki bağımlılıklar nelerdir?

2. **Güvenlik Gereksinimleri:**
   - Uygulamanız hangi hassas verileri işliyor?
   - Hangi uyumluluk gereksinimleriniz var?
   - Özel ağ bağlantısına ihtiyacınız var mı?

3. **Ölçeklenebilirlik Gereksinimleri:**
   - Beklenen yük nedir?
   - Otomatik ölçeklendirme gerekiyor mu?
   - Bölgesel gereksinimler var mı?

### Adım 5.2: Kendi AZD Şablonunuzu Oluşturun

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

3. **Altyapı şablonları oluşturun:**

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

### **Laboratuvar Egzersizi 5.1: Şablon Oluşturma Zorluğu**

**Zorluk**: Bir belge işleme AI uygulaması için bir AZD şablonu oluşturun.

**Gereksinimler:**
- İçerik analizi için Azure OpenAI
- OCR için Document Intelligence
- Belge yüklemeleri için Depolama Hesabı
- İşleme mantığı için Function App
- Kullanıcı arayüzü için web uygulaması

**Bonus puanlar:**
- Uygun hata işleme ekleyin
- Maliyet tahmini dahil edin
- İzleme panoları ayarlayın

## Modül 6: Yaygın Sorunları Giderme

### Yaygın Dağıtım Sorunları

#### Sorun 1: OpenAI Hizmet Kotası Aşıldı
**Belirtiler:** Dağıtım kota hatasıyla başarısız oluyor
**Çözümler:**
```bash
# Mevcut kotaları kontrol et
az cognitiveservices usage list --location eastus

# Kota artışı talep et veya farklı bir bölgeyi dene
azd env set AZURE_LOCATION westus2
azd up
```

#### Sorun 2: Model Bölgenizde Kullanılamıyor
**Belirtiler:** AI yanıtları başarısız oluyor veya model dağıtım hataları
**Çözümler:**
```bash
# Modelin bölgeye göre kullanılabilirliğini kontrol et
az cognitiveservices model list --location eastus

# Mevcut modele güncelle
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Sorun 3: İzin Sorunları
**Belirtiler:** AI hizmetlerini çağırırken 403 Yasak hataları
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
1. Application Insights'ta performans metriklerini kontrol edin
2. Azure portalında OpenAI hizmet metriklerini gözden geçirin
3. Ağ bağlantısını ve gecikmeyi doğrulayın

**Çözümler:**
- Yaygın sorgular için önbellekleme uygulayın
- Kullanım durumunuza uygun OpenAI modelini kullanın
- Yüksek yük senaryoları için okuma replikalarını düşünün

### **Laboratuvar Egzersizi 6.1: Hata Ayıklama Zorluğu**

**Senaryo**: Dağıtım başarılı oldu, ancak uygulama 500 hataları döndürüyor.

**Hata ayıklama görevleri:**
1. Uygulama günlüklerini kontrol edin
2. Hizmet bağlantısını doğrulayın
3. Kimlik doğrulamasını test edin
4. Yapılandırmayı gözden geçirin

**Kullanılacak araçlar:**
- Dağıtım genel görünümü için `azd show`
- Ayrıntılı hizmet günlükleri için Azure portalı
- Uygulama telemetrisi için Application Insights

## Modül 7: İzleme ve Optimizasyon

### Adım 7.1: Kapsamlı İzleme Ayarlayın

1. **Özel panolar oluşturun:**

Azure portalına gidin ve şu metriklerle bir pano oluşturun:
- OpenAI istek sayısı ve gecikme süresi
- Uygulama hata oranları
- Kaynak kullanımı
- Maliyet takibi

2. **Uyarılar ayarlayın:**
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
# Azure CLI kullanarak maliyet verilerini alın
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Maliyet kontrollerini uygulayın:**
- Bütçe uyarıları ayarlayın
- Otomatik ölçeklendirme politikaları kullanın
- İstek önbellekleme uygulayın
- OpenAI için token kullanımını izleyin

### **Laboratuvar Egzersizi 7.1: Performans Optimizasyonu**

**Görev**: AI uygulamanızı hem performans hem de maliyet açısından optimize edin.

**Geliştirilecek metrikler:**
- Ortalama yanıt süresini %20 azaltın
- Aylık maliyetleri %15 azaltın
- %99,9 çalışma süresini koruyun

**Denenecek stratejiler:**
- Yanıt önbellekleme uygulayın
- Token verimliliği için istemleri optimize edin
- Uygun hesaplama SKU'larını kullanın
- Doğru otomatik ölçeklendirme ayarlarını yapın

## Son Zorluk: Baştan Sona Uygulama

### Zorluk Senaryosu

Sizden şu gereksinimlere sahip üretime hazır bir AI destekli müşteri hizmetleri sohbet robotu oluşturmanız isteniyor:

**Fonksiyonel Gereksinimler:**
- Müşteri etkileşimleri için web arayüzü
- Yanıtlar için Azure OpenAI entegrasyonu
- Cognitive Search kullanarak belge arama yeteneği
- Mevcut müşteri veritabanı ile entegrasyon
- Çok dilli destek

**Fonksiyonel Olmayan Gereksinimler:**
- 1000 eşzamanlı kullanıcıyı destekleyin
- %99,9 çalışma süresi SLA
- SOC 2 uyumluluğu
- Aylık 500$ altında maliyet
- Birden fazla ortama (geliştirme, test, üretim) dağıtım

### Uygulama Adımları

1. **Mimariyi tasarlayın**
2. **AZD şablonunu oluşturun**
3. **Güvenlik önlemlerini uygulayın**
4. **İzleme ve uyarı ayarlarını yapın**
5. **Dağıtım hatlarını oluşturun**
6. **Çözümü belgeleyin**

### Değerlendirme Kriterleri

- ✅ **Fonksiyonellik**: Tüm gereksinimleri karşılıyor mu?
- ✅ **Güvenlik**: En iyi uygulamalar uygulanmış mı?
- ✅ **Ölçeklenebilirlik**: Yükü kaldırabiliyor mu?
- ✅ **Sürdürülebilirlik**: Kod ve altyapı iyi organize edilmiş mi?
- ✅ **Maliyet**: Bütçe dahilinde mi?

## Ek Kaynaklar

### Microsoft Belgeleri
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Hizmeti Belgeleri](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Belgeleri](https://learn.microsoft.com/azure/ai-studio/)

### Örnek Şablonlar
- [Azure OpenAI Sohbet Uygulaması](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Sohbet Uygulaması Hızlı Başlangıç](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Sohbet](https://github.com/Azure-Samples/contoso-chat)

### Topluluk Kaynakları
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Harika AZD Şabl
Tebrikler! AI Workshop Lab'ını tamamladınız. Artık şunları yapabiliyor olmalısınız:

- ✅ Mevcut AI uygulamalarını AZD şablonlarına dönüştürmek
- ✅ Üretime hazır AI uygulamalarını dağıtmak
- ✅ AI iş yükleri için güvenlik en iyi uygulamalarını uygulamak
- ✅ AI uygulama performansını izlemek ve optimize etmek
- ✅ Yaygın dağıtım sorunlarını gidermek

### Sonraki Adımlar
1. Bu modelleri kendi AI projelerinize uygulayın
2. Şablonları topluluğa geri kazandırın
3. Sürekli destek için Microsoft Foundry Discord'a katılın
4. Çok bölgeli dağıtımlar gibi ileri düzey konuları keşfedin

---

**Workshop Geri Bildirimi**: Bu workshop'u geliştirmemize yardımcı olmak için deneyimlerinizi [Microsoft Foundry Discord #Azure kanalında](https://discord.gg/microsoft-azure) paylaşın.

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-First Development
- **⬅️ Önceki**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Sonraki**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Configuration](../getting-started/configuration.md)

**Yardım mı lazım?** AZD ve AI dağıtımları hakkında destek ve tartışmalar için topluluğumuza katılın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dilindeki hali, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
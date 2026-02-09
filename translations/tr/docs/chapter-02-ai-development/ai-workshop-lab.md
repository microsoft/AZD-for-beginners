# AI Atölye Laboratuvarı: AI Çözümlerinizi AZD ile Dağıtıma Hazır Hale Getirme

**Chapter Navigation:**
- **📚 Kurs Ana Sayfası**: [Yeni Başlayanlar için AZD](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

## Atölye Genel Bakışı

Bu uygulamalı laboratuvar, geliştiricilere mevcut bir AI şablonunu alıp Azure Developer CLI (AZD) kullanarak dağıtma sürecinde rehberlik eder. Microsoft Foundry hizmetlerini kullanarak üretim AI dağıtımları için temel desenleri öğreneceksiniz.

**Süre:** 2-3 saat  
**Seviye:** Orta  
**Ön Koşullar:** Temel Azure bilgisi, AI/ML kavramlarına aşinalık

## 🎓 Öğrenme Hedefleri

Bu atölyenin sonunda şunları yapabileceksiniz:
- ✅ Mevcut bir AI uygulamasını AZD şablonlarını kullanacak şekilde dönüştürmek
- ✅ Microsoft Foundry hizmetlerini AZD ile yapılandırmak
- ✅ AI hizmetleri için güvenli kimlik bilgisi yönetimi uygulamak
- ✅ İzleme ile üretime hazır AI uygulamaları dağıtmak
- ✅ Yaygın AI dağıtım sorunlarını gidermek

## Ön Koşullar

### Gerekli Araçlar
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) yüklü
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) yüklü
- [Git](https://git-scm.com/) yüklü
- Kod düzenleyici (VS Code önerilir)

### Azure Kaynakları
- Contributor erişimine sahip Azure aboneliği
- Azure OpenAI hizmetlerine erişim (veya erişim talep edebilme)
- Kaynak grubu oluşturma izinleri

### Bilgi Ön Koşulları
- Azure hizmetlerinin temel anlayışı
- Komut satırı arayüzlerine aşinalık
- Temel AI/ML kavramları (API'ler, modeller, prompt'lar)

## Laboratuvar Kurulumu

### Adım 1: Ortam Hazırlığı

1. **Araç kurulumlarını doğrulayın:**
```bash
# AZD kurulumunu kontrol edin
azd version

# Azure CLI'yi kontrol edin
az --version

# Azure'a giriş yapın
az login
azd auth login
```

2. **Atölye deposunu klonlayın:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modül 1: AI Uygulamaları için AZD Yapısını Anlamak

### Bir AI AZD Şablonunun Anatomisi

AI hazır bir AZD şablonundaki anahtar dosyaları keşfedin:

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

### **Lab Alıştırması 1.1: Yapılandırmayı Keşfedin**

1. **azure.yaml dosyasını inceleyin:**
```bash
cat azure.yaml
```

**Ne aramalısınız:**
- Servis tanımları AI bileşenleri için
- Ortam değişkeni eşlemeleri
- Host yapılandırmaları

2. **main.bicep altyapısını gözden geçirin:**
```bash
cat infra/main.bicep
```

**Belirlenmesi gereken temel AI desenleri:**
- Azure OpenAI hizmetinin sağlanması
- Cognitive Search entegrasyonu
- Güvenli anahtar yönetimi
- Ağ güvenliği yapılandırmaları

### **Tartışma Noktası:** Bu Desenler AI için Neden Önemli

- **Servis Bağımlılıkları**: AI uygulamaları genellikle birden fazla koordine hizmet gerektirir
- **Güvenlik**: API anahtarları ve uç noktaların güvenli yönetimi gerekir
- **Ölçeklenebilirlik**: AI iş yüklerinin benzersiz ölçeklendirme gereksinimleri vardır
- **Maliyet Yönetimi**: AI hizmetleri doğru yapılandırılmadığında pahalı olabilir

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
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Adım 2.2: Altyapıyı ve Uygulamayı Dağıtın

1. **AZD ile dağıtın:**
```bash
azd up
```

**azd up sırasında neler olur:**
- ✅ Azure OpenAI hizmetini sağlar
- ✅ Cognitive Search hizmetini oluşturur
- ✅ Web uygulaması için App Service'i ayarlar
- ✅ Ağ ve güvenliği yapılandırır
- ✅ Uygulama kodunu dağıtır
- ✅ İzleme ve günlük kaydını kurar

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

### **Laboratuvar Alıştırması 2.1: Sorun Giderme Uygulaması**

**Senaryo**: Dağıtımınız başarılı oldu ancak AI yanıt vermiyor.

**Kontrol edilecek yaygın sorunlar:**
1. **OpenAI API anahtarları**: Doğru ayarlandıklarını doğrulayın
2. **Model uygunluğu**: Bölgenizin modeli destekleyip desteklemediğini kontrol edin
3. **Ağ bağlantısı**: Hizmetlerin iletişim kurabildiğinden emin olun
4. **RBAC izinleri**: Uygulamanın OpenAI'e erişebildiğini doğrulayın

**Hata ayıklama komutları:**
```bash
# Ortam değişkenlerini kontrol edin
azd env get-values

# Dağıtım günlüklerini görüntüleyin
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI dağıtım durumunu kontrol edin
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modül 3: AI Uygulamalarını İhtiyaçlarınıza Göre Özelleştirme

### Adım 3.1: AI Yapılandırmasını Değiştirin

1. **OpenAI modelini güncelleyin:**
```bash
# Farklı bir modele geçin (bölgenizde mevcutsa)
azd env set AZURE_OPENAI_MODEL gpt-4

# Yeni yapılandırmayla yeniden dağıtın
azd deploy
```

2. **Ek AI hizmetleri ekleyin:**

`infra/main.bicep` dosyasını Document Intelligence eklemek için düzenleyin:

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

### Adım 3.2: Ortam Özelinde Yapılandırmalar

**En İyi Uygulama**: Geliştirme ve üretim için farklı yapılandırmalar.

1. **Üretim ortamı oluşturun:**
```bash
azd env new myai-production
```

2. **Üretime özel parametreleri ayarlayın:**
```bash
# Üretimde genellikle daha yüksek SKU'lar kullanılır
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ek güvenlik özelliklerini etkinleştirin
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratuvar Alıştırması 3.1: Maliyet Optimizasyonu**

**Meydan Okuma**: Şablonu maliyet-etkin geliştirme için yapılandırın.

**Görevler:**
1. Hangi SKU'ların ücretsiz/temel katmanlara ayarlanabileceğini belirleyin
2. En düşük maliyet için ortam değişkenlerini yapılandırın
3. Dağıtın ve maliyetleri üretim yapılandırmasıyla karşılaştırın

**Çözüm ipuçları:**
- Mümkün olduğunda Cognitive Services için F0 (ücretsiz) katmanını kullanın
- Geliştirmede Search Service için Basic katmanını kullanın
- Functions için Consumption planını kullanmayı düşünün

## Modül 4: Güvenlik ve Üretim En İyi Uygulamaları

### Adım 4.1: Güvenli Kimlik Bilgisi Yönetimi

**Mevcut zorluk**: Birçok AI uygulaması API anahtarlarını kod içinde sabitler veya güvensiz depolama kullanır.

**AZD Çözümü**: Managed Identity + Key Vault entegrasyonu.

1. **Şablonunuzdaki güvenlik yapılandırmasını gözden geçirin:**
```bash
# Key Vault ve Yönetilen Kimlik yapılandırmasını ara
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

2. **AI'ye özgü izlemeyi kurun:**

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

### **Laboratuvar Alıştırması 4.1: Güvenlik Denetimi**

**Görev**: Dağıtımınızı güvenlik en iyi uygulamaları açısından gözden geçirin.

**Kontrol Listesi:**
- [ ] Kodda veya yapılandırmada sabitlenmiş gizli bilgiler yok
- [ ] Servisler arası kimlik doğrulama için Managed Identity kullanılıyor
- [ ] Hassas yapılandırma Key Vault'ta saklanıyor
- [ ] Ağ erişimi uygun şekilde kısıtlanmış
- [ ] İzleme ve günlük kaydı etkinleştirilmiş

## Modül 5: Kendi AI Uygulamanızı Dönüştürme

### Adım 5.1: Değerlendirme Çalışma Sayfası

**Uygulamanızı dönüştürmeden önce bu soruları yanıtlayın:**

1. **Uygulama Mimarisi:**
   - Uygulamanız hangi AI hizmetlerini kullanıyor?
   - Hangi hesaplama kaynaklarına ihtiyaç duyuyor?
   - Veritabanına ihtiyaç var mı?
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

### **Laboratuvar Alıştırması 5.1: Şablon Oluşturma Meydan Okuması**

**Meydan Okuma**: Belge işleme AI uygulaması için bir AZD şablonu oluşturun.

**Gereksinimler:**
- İçerik analizi için Azure OpenAI
- OCR için Document Intelligence
- Belge yüklemeleri için Storage Account
- İşleme mantığı için Function App
- Kullanıcı arayüzü için web uygulaması

**Bonus puanlar:**
- Uygun hata işleme ekleyin
- Maliyet tahmini ekleyin
- İzleme panoları kurun

## Modül 6: Yaygın Sorunların Giderilmesi

### Yaygın Dağıtım Sorunları

#### Sorun 1: OpenAI Hizmeti Kota Aşıldı
**Belirtiler:** Dağıtım kota hatası ile başarısız olur
**Çözümler:**
```bash
# Mevcut kotaları kontrol edin
az cognitiveservices usage list --location eastus

# Kota artışı talep edin veya farklı bir bölgeyi deneyin
azd env set AZURE_LOCATION westus2
azd up
```

#### Sorun 2: Model Bölgeden Erişilebilir Değil
**Belirtiler:** AI yanıtları başarısız olur veya model dağıtım hataları
**Çözümler:**
```bash
# Modelin bölgeye göre kullanılabilirliğini kontrol et
az cognitiveservices model list --location eastus

# Kullanılabilir modele güncelle
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Sorun 3: İzin Sorunları
**Belirtiler:** AI hizmetleri çağrılırken 403 Forbidden hataları
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
2. Azure portalında OpenAI hizmet metriklerini gözden geçirin
3. Ağ bağlantısını ve gecikmeyi doğrulayın

**Çözümler:**
- Yaygın sorgular için önbellekleme uygulayın
- Kullanım durumunuza uygun OpenAI modelini kullanın
- Yüksek trafikli senaryolar için read replica'ları düşünün

### **Laboratuvar Alıştırması 6.1: Hata Ayıklama Meydan Okuması**

**Senaryo**: Dağıtımınız başarılı oldu, ancak uygulama 500 hatası döndürüyor.

**Hata ayıklama görevleri:**
1. Uygulama günlüklerini kontrol edin
2. Hizmet bağlantısını doğrulayın
3. Kimlik doğrulamayı test edin
4. Yapılandırmayı gözden geçirin

**Kullanılacak araçlar:**
- Dağıtım genel görünümü için `azd show`
- Ayrıntılı hizmet günlükleri için Azure portalı
- Uygulama telemetrisi için Application Insights

## Modül 7: İzleme ve Optimizasyon

### Adım 7.1: Kapsamlı İzlemeyi Kurun

1. **Özel panolar oluşturun:**

Azure portalına gidin ve şu öğelerle bir pano oluşturun:
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
# Maliyet verilerini almak için Azure CLI'yi kullanın
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Maliyet kontrolleri uygulayın:**
- Bütçe uyarıları ayarlayın
- Otomatik ölçeklendirme politikaları kullanın
- İstek önbellekleme uygulayın
- OpenAI için token kullanımını izleyin

### **Laboratuvar Alıştırması 7.1: Performans Optimizasyonu**

**Görev**: AI uygulamanızı hem performans hem de maliyet açısından optimize edin.

**İyileştirilecek metrikler:**
- Ortalama yanıt süresini %20 azaltın
- Aylık maliyetleri %15 azaltın
- %99,9 çalışma süresini koruyun

**Denenecek stratejiler:**
- Yanıt önbellekleme uygulayın
- Token verimliliği için prompt'ları optimize edin
- Uygun compute SKU'larını kullanın
- Uygun otomatik ölçeklendirmeyi ayarlayın

## Final Meydan Okuması: Uçtan Uca Uygulama

### Meydan Okuma Senaryosu

Aşağıdaki gereksinimlerle üretime hazır AI destekli bir müşteri hizmetleri sohbet botu oluşturma görevi size verildi:

**Fonksiyonel Gereksinimler:**
- Müşteri etkileşimleri için web arayüzü
- Yanıtlar için Azure OpenAI ile entegrasyon
- Cognitive Search kullanarak belge arama yeteneği
- Mevcut müşteri veritabanıyla entegrasyon
- Çoklu dil desteği

**Fonksiyonel Olmayan Gereksinimler:**
- 1000 eşzamanlı kullanıcıyı karşılayabilmeli
- %99,9 çalışma süresi SLA'sı
- SOC 2 uyumluluğu
- Aylık maliyet $500'in altında
- Birden fazla ortama (dev, staging, prod) dağıtım

### Uygulama Adımları

1. Mimarisi tasarlayın
2. AZD şablonunu oluşturun
3. Güvenlik önlemlerini uygulayın
4. İzleme ve uyarıları kurun
5. Dağıtım boru hatlarını oluşturun
6. Çözümü belgeleyin

### Değerlendirme Kriterleri

- ✅ **İşlevsellik**: Tüm gereksinimleri karşılıyor mu?
- ✅ **Güvenlik**: En iyi uygulamalar uygulanmış mı?
- ✅ **Ölçeklenebilirlik**: Yükü karşılayabilecek mi?
- ✅ **Bakım Kolaylığı**: Kod ve altyapı iyi düzenlenmiş mi?
- ✅ **Maliyet**: Bütçe içinde mi?

## Ek Kaynaklar

### Microsoft Dokümantasyonu
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Örnek Şablonlar
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Topluluk Kaynakları
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Tamamlama Sertifikası
Tebrikler! AI Çalıştayı Laboratuvarını tamamladınız. Artık şunları yapabilmelisiniz:

- ✅ Mevcut AI uygulamalarını AZD şablonlarına dönüştürmek
- ✅ Üretime hazır AI uygulamalarını dağıtmak
- ✅ AI iş yükleri için güvenlik en iyi uygulamalarını uygulamak
- ✅ AI uygulama performansını izlemek ve optimize etmek
- ✅ Yaygın dağıtım sorunlarını gidermek

### Sonraki Adımlar
1. Bu desenleri kendi AI projelerinize uygulayın
2. Şablonları topluluğa katkıda bulundurun
3. Sürekli destek için Microsoft Foundry Discord'a katılın
4. Çok bölgeli dağıtımlar gibi gelişmiş konuları keşfedin

---

**Çalıştay Geri Bildirimi**: Deneyiminizi [Microsoft Foundry Discord #Azure kanalı](https://discord.gg/microsoft-azure) aracılığıyla paylaşarak bu çalıştayı geliştirmemize yardımcı olun.

---

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **➡️ Sonraki**: [Üretim AI En İyi Uygulamaları](production-ai-practices.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** AZD ve AI dağıtımları hakkında destek ve tartışmalar için topluluğumuza katılın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Yetkili kaynak olarak orijinal belge (ana dilindeki metin) kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlaşılma veya hatalı yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
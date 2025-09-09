<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T20:01:58+00:00",
  "source_file": "examples/README.md",
  "language_code": "tr"
}
-->
# Örnekler - Pratik AZD Şablonları ve Konfigürasyonlar

## Giriş

Bu dizin, Azure Developer CLI'yi uygulamalı olarak öğrenmenize yardımcı olmak için pratik örnekler, şablonlar ve gerçek dünya senaryoları içerir. Her örnek, farklı uygulama mimarileri ve dağıtım modelleri için eksiksiz çalışan kod, altyapı şablonları ve ayrıntılı talimatlar sağlar.

## Öğrenme Hedefleri

Bu örnekler üzerinde çalışarak:
- Gerçekçi uygulama senaryolarıyla Azure Developer CLI iş akışlarını pratik yapabilirsiniz
- Farklı uygulama mimarilerini ve bunların azd uygulamalarını anlayabilirsiniz
- Çeşitli Azure hizmetleri için Kod Olarak Altyapı (IaC) modellerini öğrenebilirsiniz
- Konfigürasyon yönetimi ve ortam bazlı dağıtım stratejilerini uygulayabilirsiniz
- İzleme, güvenlik ve ölçeklendirme modellerini pratik bağlamlarda uygulayabilirsiniz
- Gerçek dağıtım senaryolarında sorun giderme ve hata ayıklama deneyimi kazanabilirsiniz

## Öğrenme Çıktıları

Bu örnekleri tamamladıktan sonra:
- Azure Developer CLI kullanarak çeşitli uygulama türlerini güvenle dağıtabilirsiniz
- Sağlanan şablonları kendi uygulama gereksinimlerinize uyarlayabilirsiniz
- Bicep kullanarak özel altyapı modelleri tasarlayıp uygulayabilirsiniz
- Doğru bağımlılıklarla karmaşık çok hizmetli uygulamaları yapılandırabilirsiniz
- Gerçek senaryolarda güvenlik, izleme ve performans en iyi uygulamalarını uygulayabilirsiniz
- Pratik deneyime dayalı olarak dağıtımları optimize edip sorunlarını giderebilirsiniz

## Dizin Yapısı

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Hızlı Başlangıç Örnekleri

### Yeni Başlayanlar İçin
1. **[Basit Web Uygulaması](../../../examples/simple-web-app)** - Temel bir Node.js web uygulaması dağıtın
2. **[Statik Web Sitesi](../../../examples/static-website)** - Azure Storage üzerinde bir statik web sitesi barındırın
3. **[Konteyner Uygulaması](../../../examples/container-app)** - Konteynerleştirilmiş bir uygulama dağıtın

### Orta Seviye Kullanıcılar İçin
4. **[Veritabanı Uygulaması](../../../examples/database-app)** - PostgreSQL veritabanı ile web uygulaması
5. **[Sunucusuz Fonksiyon](../../../examples/serverless-function)** - HTTP tetikleyicileri ile Azure Functions
6. **[Mikroservisler](../../../examples/microservices)** - API geçidi ile çok hizmetli uygulama

## 📋 Kullanım Talimatları

### Örnekleri Yerel Olarak Çalıştırma

1. **Örneği Klonlayın veya Kopyalayın**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD Ortamını Başlatın**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Ortamı Yapılandırın**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Dağıtım Yapın**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Örnekleri Uyarlama

Her örnek şunları içerir:
- **README.md** - Ayrıntılı kurulum ve özelleştirme talimatları
- **azure.yaml** - Yorumlarla birlikte AZD konfigürasyonu
- **infra/** - Parametre açıklamalarıyla Bicep şablonları
- **src/** - Örnek uygulama kodu
- **scripts/** - Yaygın görevler için yardımcı betikler

## 🎯 Öğrenme Hedefleri

### Örnek Kategorileri

#### **Temel Dağıtımlar**
- Tek hizmetli uygulamalar
- Basit altyapı modelleri
- Temel konfigürasyon yönetimi
- Maliyet etkin geliştirme kurulumları

#### **Gelişmiş Senaryolar**
- Çok hizmetli mimariler
- Karmaşık ağ konfigürasyonları
- Veritabanı entegrasyon modelleri
- Güvenlik ve uyumluluk uygulamaları

#### **Üretime Hazır Modeller**
- Yüksek erişilebilirlik konfigürasyonları
- İzleme ve gözlemlenebilirlik
- CI/CD entegrasyonu
- Felaket kurtarma kurulumları

## 📖 Örnek Açıklamaları

### Basit Web Uygulaması
**Teknolojiler**: Node.js, App Service, Application Insights  
**Zorluk Seviyesi**: Yeni Başlayan  
**Kavramlar**: Temel dağıtım, ortam değişkenleri, sağlık kontrolleri

### Statik Web Sitesi
**Teknolojiler**: HTML/CSS/JS, Storage Account, CDN  
**Zorluk Seviyesi**: Yeni Başlayan  
**Kavramlar**: Statik barındırma, CDN entegrasyonu, özel alan adları

### Konteyner Uygulaması
**Teknolojiler**: Docker, Container Apps, Container Registry  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Konteynerleştirme, ölçeklendirme, giriş yapılandırması

### Veritabanı Uygulaması
**Teknolojiler**: Python Flask, PostgreSQL, App Service  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Veritabanı bağlantıları, gizli bilgiler yönetimi, geçişler

### Sunucusuz Fonksiyon
**Teknolojiler**: Azure Functions, Cosmos DB, API Management  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Olay odaklı mimari, bağlamalar, API yönetimi

### Mikroservisler
**Teknolojiler**: Birden fazla hizmet, Service Bus, API Gateway  
**Zorluk Seviyesi**: İleri  
**Kavramlar**: Hizmet iletişimi, mesaj sıralama, yük dengeleme

## 🛠 Konfigürasyon Örnekleri

`configurations/` dizini yeniden kullanılabilir bileşenler içerir:

### Ortam Konfigürasyonları
- Geliştirme ortamı ayarları
- Staging ortamı konfigürasyonları
- Üretime hazır konfigürasyonlar
- Çok bölgeli dağıtım kurulumları

### Bicep Modülleri
- Yeniden kullanılabilir altyapı bileşenleri
- Yaygın kaynak modelleri
- Güvenlik güçlendirilmiş şablonlar
- Maliyet optimize edilmiş konfigürasyonlar

### Yardımcı Betikler
- Ortam kurulum otomasyonu
- Veritabanı geçiş betikleri
- Dağıtım doğrulama araçları
- Maliyet izleme yardımcıları

## 🔧 Özelleştirme Kılavuzu

### Örnekleri Kendi Kullanım Senaryonuza Uyarlama

1. **Ön Koşulları İnceleyin**
   - Azure hizmet gereksinimlerini kontrol edin
   - Abonelik limitlerini doğrulayın
   - Maliyet etkilerini anlayın

2. **Konfigürasyonu Değiştirin**
   - `azure.yaml` hizmet tanımlarını güncelleyin
   - Bicep şablonlarını özelleştirin
   - Ortam değişkenlerini ayarlayın

3. **Ayrıntılı Test Yapın**
   - Önce geliştirme ortamına dağıtın
   - İşlevselliği doğrulayın
   - Ölçeklendirme ve performansı test edin

4. **Güvenlik İncelemesi Yapın**
   - Erişim kontrollerini gözden geçirin
   - Gizli bilgiler yönetimini uygulayın
   - İzleme ve uyarıları etkinleştirin

## 📊 Karşılaştırma Tablosu

| Örnek | Hizmetler | Veritabanı | Kimlik Doğrulama | İzleme | Zorluk Seviyesi |
|-------|-----------|------------|------------------|--------|-----------------|
| Basit Web Uygulaması | 1 | ❌ | Temel | Temel | ⭐ |
| Statik Web Sitesi | 1 | ❌ | ❌ | Temel | ⭐ |
| Konteyner Uygulaması | 1 | ❌ | Temel | Tam | ⭐⭐ |
| Veritabanı Uygulaması | 2 | ✅ | Tam | Tam | ⭐⭐⭐ |
| Sunucusuz Fonksiyon | 3 | ✅ | Tam | Tam | ⭐⭐⭐ |
| Mikroservisler | 5+ | ✅ | Tam | Tam | ⭐⭐⭐⭐ |

## 🎓 Öğrenme Yolu

### Önerilen İlerleme

1. **Basit Web Uygulaması ile Başlayın**
   - Temel AZD kavramlarını öğrenin
   - Dağıtım iş akışını anlayın
   - Ortam yönetimini pratik yapın

2. **Statik Web Sitesini Deneyin**
   - Farklı barındırma seçeneklerini keşfedin
   - CDN entegrasyonunu öğrenin
   - DNS yapılandırmasını anlayın

3. **Konteyner Uygulamasına Geçin**
   - Konteynerleştirme temellerini öğrenin
   - Ölçeklendirme kavramlarını anlayın
   - Docker ile pratik yapın

4. **Veritabanı Entegrasyonu Ekleyin**
   - Veritabanı sağlama işlemini öğrenin
   - Bağlantı dizelerini anlayın
   - Gizli bilgiler yönetimini pratik yapın

5. **Sunucusuz Fonksiyonları Keşfedin**
   - Olay odaklı mimariyi anlayın
   - Tetikleyiciler ve bağlamalar hakkında bilgi edinin
   - API'lerle pratik yapın

6. **Mikroservisler Oluşturun**
   - Hizmet iletişimini öğrenin
   - Dağıtık sistemleri anlayın
   - Karmaşık dağıtımları pratik yapın

## 🔍 Doğru Örneği Bulma

### Teknoloji Yığınına Göre
- **Node.js**: Basit Web Uygulaması, Mikroservisler
- **Python**: Veritabanı Uygulaması, Sunucusuz Fonksiyon
- **Statik Siteler**: Statik Web Sitesi
- **Konteynerler**: Konteyner Uygulaması, Mikroservisler
- **Veritabanları**: Veritabanı Uygulaması, Sunucusuz Fonksiyon

### Mimari Modeline Göre
- **Monolitik**: Basit Web Uygulaması, Veritabanı Uygulaması
- **Statik**: Statik Web Sitesi
- **Mikroservisler**: Mikroservisler örneği
- **Sunucusuz**: Sunucusuz Fonksiyon
- **Hibrit**: Konteyner Uygulaması

### Zorluk Seviyesine Göre
- **Yeni Başlayan**: Basit Web Uygulaması, Statik Web Sitesi
- **Orta**: Konteyner Uygulaması, Veritabanı Uygulaması, Sunucusuz Fonksiyon  
- **İleri**: Mikroservisler

## 📚 Ek Kaynaklar

### Dokümantasyon Bağlantıları
- [AZD Şablon Spesifikasyonu](https://aka.ms/azd/templates)
- [Bicep Dokümantasyonu](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)

### Topluluk Örnekleri
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Şablon Galerisi](https://azure.github.io/awesome-azd/)

### En İyi Uygulamalar
- [Azure İyi Tasarlanmış Çerçeve](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Bulut Benimseme Çerçevesi](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Örnek Katkıları

Paylaşacak faydalı bir örneğiniz mi var? Katkılarınızı memnuniyetle karşılıyoruz!

### Gönderim Yönergeleri
1. Belirlenmiş dizin yapısına uyun
2. Kapsamlı bir README.md ekleyin
3. Konfigürasyon dosyalarına yorumlar ekleyin
4. Göndermeden önce ayrıntılı test yapın
5. Maliyet tahminleri ve ön koşulları ekleyin

### Örnek Şablon Yapısı
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**İpucu**: Teknoloji yığınına uygun en basit örnekle başlayın, ardından kademeli olarak daha karmaşık senaryolara geçin. Her örnek, önceki örneklerden alınan kavramları geliştirir!

**Sonraki Adımlar**: 
- Beceri seviyenize uygun bir örnek seçin
- Örneğin README dosyasındaki kurulum talimatlarını takip edin
- Özelleştirmelerle denemeler yapın
- Öğrendiklerinizi toplulukla paylaşın

---

**Navigasyon**
- **Önceki Ders**: [Çalışma Kılavuzu](../resources/study-guide.md)
- **Ana README'ye Dön**: [Ana README](../README.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
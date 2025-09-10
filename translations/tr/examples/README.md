<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:11:38+00:00",
  "source_file": "examples/README.md",
  "language_code": "tr"
}
-->
# Örnekler - Pratik AZD Şablonları ve Konfigürasyonlar

## Giriş

Bu dizin, Azure Developer CLI'yi uygulamalı olarak öğrenmenize yardımcı olacak pratik örnekler, şablonlar ve gerçek dünya senaryoları içerir. Her örnek, farklı uygulama mimarileri ve dağıtım modelleri için tam çalışan kod, altyapı şablonları ve ayrıntılı talimatlar sağlar.

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
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Hızlı Başlangıç Örnekleri

### Yeni Başlayanlar İçin
1. **[Basit Web Uygulaması - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express web uygulamasını MongoDB ile dağıtın
2. **[Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - React statik web sitesini Azure Statik Web Uygulamaları ile barındırın
3. **[Konteyner Uygulaması - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Konteynerleştirilmiş Python Flask uygulamasını dağıtın

### Orta Seviye Kullanıcılar İçin
4. **[Veritabanı Uygulaması - C# ve Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API ve Azure SQL Veritabanı ile web uygulaması
5. **[Sunucusuz Fonksiyon - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP tetikleyicileri ve Cosmos DB ile Python Azure Functions
6. **[Mikroservisler - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Konteyner Uygulamaları ve API geçidi ile çok hizmetli Java uygulaması

### Azure AI Foundry Şablonları

1. **[Azure OpenAI Sohbet Uygulaması](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI ile akıllı sohbet uygulaması
2. **[AI Belge İşleme](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI hizmetlerini kullanarak belge analizi
3. **[Makine Öğrenimi Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning ile MLOps iş akışı

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

4. **Dağıtın**  
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

## 🎯 Öğrenme Amaçları

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

### Basit Web Uygulaması - Node.js Express
**Teknolojiler**: Node.js, Express, MongoDB, Konteyner Uygulamaları  
**Zorluk Seviyesi**: Yeni Başlayan  
**Kavramlar**: Temel dağıtım, REST API, NoSQL veritabanı entegrasyonu

### Statik Web Sitesi - React SPA
**Teknolojiler**: React, Azure Statik Web Uygulamaları, Azure Functions, Cosmos DB  
**Zorluk Seviyesi**: Yeni Başlayan  
**Kavramlar**: Statik barındırma, sunucusuz arka uç, modern web geliştirme

### Konteyner Uygulaması - Python Flask
**Teknolojiler**: Python Flask, Docker, Konteyner Uygulamaları, Konteyner Kaydı  
**Zorluk Seviyesi**: Yeni Başlayan  
**Kavramlar**: Konteynerleştirme, mikroservis mimarisi, API geliştirme

### Veritabanı Uygulaması - C# ve Azure SQL
**Teknolojiler**: C# ASP.NET Core, Azure SQL Veritabanı, Uygulama Hizmeti  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Entity Framework, veritabanı bağlantıları, web API geliştirme

### Sunucusuz Fonksiyon - Python Azure Functions
**Teknolojiler**: Python, Azure Functions, Cosmos DB, Statik Web Uygulamaları  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Olay odaklı mimari, sunucusuz hesaplama, tam yığın geliştirme

### Mikroservisler - Java Spring Boot
**Teknolojiler**: Java Spring Boot, Konteyner Uygulamaları, Service Bus, API Geçidi  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Mikroservis iletişimi, dağıtık sistemler, kurumsal modeller

### Azure AI Foundry Örnekleri

#### Azure OpenAI Sohbet Uygulaması
**Teknolojiler**: Azure OpenAI, Cognitive Search, Uygulama Hizmeti  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: RAG mimarisi, vektör arama, LLM entegrasyonu

#### AI Belge İşleme
**Teknolojiler**: Azure AI Belge Zekası, Depolama, Fonksiyonlar  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Belge analizi, OCR, veri çıkarma

#### Makine Öğrenimi Pipeline
**Teknolojiler**: Azure ML, MLOps, Konteyner Kaydı  
**Zorluk Seviyesi**: İleri  
**Kavramlar**: Model eğitimi, dağıtım iş akışları, izleme

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
- Güvenlik sertifikalı şablonlar
- Maliyet optimizasyonlu konfigürasyonlar

### Yardımcı Betikler
- Ortam kurulum otomasyonu
- Veritabanı geçiş betikleri
- Dağıtım doğrulama araçları
- Maliyet izleme yardımcıları

## 🔧 Özelleştirme Rehberi

### Örnekleri Kendi Kullanımınıza Uyarlama

1. **Ön Koşulları İnceleyin**
   - Azure hizmet gereksinimlerini kontrol edin
   - Abonelik limitlerini doğrulayın
   - Maliyet etkilerini anlayın

2. **Konfigürasyonu Değiştirin**
   - `azure.yaml` hizmet tanımlarını güncelleyin
   - Bicep şablonlarını özelleştirin
   - Ortam değişkenlerini ayarlayın

3. **Detaylı Test Yapın**
   - Önce geliştirme ortamına dağıtın
   - İşlevselliği doğrulayın
   - Ölçeklendirme ve performansı test edin

4. **Güvenlik İncelemesi Yapın**
   - Erişim kontrollerini gözden geçirin
   - Gizli bilgilerin yönetimini uygulayın
   - İzleme ve uyarı sistemlerini etkinleştirin

## 📊 Karşılaştırma Tablosu

| Örnek | Hizmetler | Veritabanı | Kimlik Doğrulama | İzleme | Zorluk Seviyesi |
|-------|-----------|------------|------------------|--------|-----------------|
| Node.js Express Todo | 2 | ✅ | Temel | Temel | ⭐ |
| React SPA + Fonksiyonlar | 3 | ✅ | Temel | Tam | ⭐ |
| Python Flask Konteyner | 2 | ❌ | Temel | Tam | ⭐ |
| C# Web API + SQL | 2 | ✅ | Tam | Tam | ⭐⭐ |
| Python Fonksiyonlar + SPA | 3 | ✅ | Tam | Tam | ⭐⭐ |
| Java Mikroservisler | 5+ | ✅ | Tam | Tam | ⭐⭐ |
| Azure OpenAI Sohbet | 3 | ✅ | Tam | Tam | ⭐⭐⭐ |
| AI Belge İşleme | 2 | ❌ | Temel | Tam | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Tam | Tam | ⭐⭐⭐⭐ |

## 🎓 Öğrenme Yolu

### Önerilen İlerleme

1. **Basit Web Uygulaması ile Başlayın**
   - Temel AZD kavramlarını öğrenin
   - Dağıtım iş akışını anlayın
   - Ortam yönetimini pratik yapın

2. **Statik Web Sitesini Deneyin**
   - Farklı barındırma seçeneklerini keşfedin
   - CDN entegrasyonunu öğrenin
   - DNS konfigürasyonunu anlayın

3. **Konteyner Uygulamasına Geçin**
   - Konteynerleştirme temellerini öğrenin
   - Ölçeklendirme kavramlarını anlayın
   - Docker ile pratik yapın

4. **Veritabanı Entegrasyonu Ekleyin**
   - Veritabanı sağlama işlemini öğrenin
   - Bağlantı dizelerini anlayın
   - Gizli bilgilerin yönetimini pratik yapın

5. **Sunucusuz Mimariyi Keşfedin**
   - Olay odaklı mimariyi anlayın
   - Tetikleyiciler ve bağlamalar hakkında bilgi edinin
   - API'lerle pratik yapın

6. **Mikroservisler Oluşturun**
   - Hizmet iletişimini öğrenin
   - Dağıtık sistemleri anlayın
   - Karmaşık dağıtımları pratik yapın

## 🔍 Doğru Örneği Bulma

### Teknoloji Yığınına Göre
- **Node.js**: Node.js Express Todo Uygulaması
- **Python**: Python Flask Konteyner Uygulaması, Python Fonksiyonlar + SPA
- **C#**: C# Web API + SQL Veritabanı, Azure OpenAI Sohbet Uygulaması, ML Pipeline
- **Java**: Java Spring Boot Mikroservisler
- **React**: React SPA + Fonksiyonlar
- **Konteynerler**: Python Flask Konteyner Uygulaması, Java Mikroservisler
- **Veritabanları**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Sohbet Uygulaması, AI Belge İşleme, ML Pipeline

### Mimari Modeline Göre
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statik + Sunucusuz**: React SPA + Fonksiyonlar, Python Fonksiyonlar + SPA
- **Mikroservisler**: Java Spring Boot Mikroservisler
- **Konteynerleştirilmiş**: Python Flask Konteyner Uygulaması
- **AI Destekli**: Azure OpenAI Sohbet Uygulaması, AI Belge İşleme, ML Pipeline

### Zorluk Seviyesine Göre
- **Yeni Başlayan**: Node.js Express Todo, React SPA + Fonksiyonlar, Python Flask Konteyner Uygulaması
- **Orta**: C# Web API + SQL, Python Fonksiyonlar + SPA, Java Mikroservisler, Azure OpenAI Sohbet Uygulaması, AI Belge İşleme
- **İleri**: ML Pipeline

## 📚 Ek Kaynaklar

### Dokümantasyon Bağlantıları
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Şablonları](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokümantasyonu](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)

### Topluluk Örnekleri
- [Azure Samples AZD Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Şablonları](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galerisi](https://azure.github.io/awesome-azd/)
- [C# ve Azure SQL ile Todo Uygulaması](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python ve MongoDB ile Todo Uygulaması](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js ve PostgreSQL ile Todo Uygulaması](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web Uygulaması ve C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Konteyner Uygulamaları İş](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ile Azure Fonksiyonları](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### En İyi Uygulamalar
- [Azure İyi Tasarlanmış Çerçeve](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Bulut Kabul Çerçevesi](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Örnek Katkıları

Paylaşacak faydalı bir örneğiniz mi var? Katkılarınızı memnuniyetle karşılıyoruz!

### Gönderim Yönergeleri
1. Belirlenmiş dizin yapısına uyun
2. Kapsamlı bir README.md ekleyin
3. Konfigürasyon dosyalarına yorumlar ekleyin
4. Göndermeden önce detaylı test yapın
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

**İpucu**: Teknoloji yığınıza uygun en basit örnekle başlayın, ardından daha karmaşık senaryolara doğru ilerleyin. Her örnek, önceki örneklerden alınan kavramları geliştirir!

**Sonraki Adımlar**: 
- Beceri seviyenize uygun bir örnek seçin
- Örneğin README'sindeki kurulum talimatlarını takip edin
- Özelleştirmelerle denemeler yapın
- Öğrendiklerinizi toplulukla paylaşın

---

**Navigasyon**
- **Önceki Ders**: [Çalışma Rehberi](../resources/study-guide.md)
- **Ana README'ye Dön**: [Ana README](../README.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
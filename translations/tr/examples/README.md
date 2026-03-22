# Örnekler - Pratik AZD Şablonları ve Yapılandırmaları

**Örnekle Öğrenme - Bölümlere Göre Düzenlendi**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../README.md)
- **📖 Bölüm Haritası**: Örnekler öğrenme karmaşıklığına göre düzenlenmiştir
- **🚀 Yerel Örnek**: [Perakende Çoklu Ajan Çözümü](retail-scenario.md)
- **🤖 Dış AI Örnekleri**: Azure Samples depolarına bağlantılar

> **📍 ÖNEMLİ: Yerel ve Dış Örnekler**  
> Bu depo tam uygulamalı **4 eksiksiz yerel örnek** içerir:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 dağıtımı ile sohbet arayüzü)  
> - **Container Apps** (Basit Flask API + Mikroservisler)  
> - **Database App** (Web + SQL Veritabanı)  
> - **Retail Multi-Agent** (Kurumsal AI Çözümü)  
>  
> Ek örnekler, klonlayabileceğiniz Azure-Samples depolarına yapılan **dış referanslardır**.

## Giriş

Bu dizin, Azure Developer CLI'yi uygulamalı pratikle öğrenmenize yardımcı olacak pratik örnekler ve referanslar sağlar. Retail Multi-Agent senaryosu, bu depoda yer alan eksiksiz, üretime hazır bir uygulamadır. Ek örnekler, çeşitli AZD desenlerini gösteren resmi Azure Samples depolarına referans verir.

### Karmaşıklık Derecelendirme Açıklaması

- ⭐ **Başlangıç** - Temel kavramlar, tek servis, 15-30 dakika
- ⭐⭐ **Orta** - Çoklu servisler, veritabanı entegrasyonu, 30-60 dakika
- ⭐⭐⭐ **İleri** - Karmaşık mimari, AI entegrasyonu, 1-2 saat
- ⭐⭐⭐⭐ **Uzman** - Üretime hazır, kurumsal desenler, 2+ saat

## 🎯 Bu Depoda Gerçekte Neler Var

### ✅ Yerel Uygulama (Kullanıma Hazır)

#### [Microsoft Foundry Models Sohbet Uygulaması](azure-openai-chat/README.md) 🆕
**Bu depoda sohbet arayüzü ile eksiksiz gpt-4.1 dağıtımı bulunmaktadır**

- **Konum:** `examples/azure-openai-chat/`
- **Karmaşıklık:** ⭐⭐ (Orta)
- **İçindekiler:**
  - Tam Microsoft Foundry Models dağıtımı (gpt-4.1)
  - Python komut satırı sohbet arayüzü
  - Güvenli API anahtarları için Key Vault entegrasyonu
  - Bicep altyapı şablonları
  - Token kullanımı ve maliyet takibi
  - Hız sınırlama ve hata yönetimi

**Hızlı Başlangıç:**
```bash
# example dizinine gidin
cd examples/azure-openai-chat

# Her şeyi dağıtın
azd up

# Bağımlılıkları yükleyin ve sohbete başlayın
pip install -r src/requirements.txt
python src/chat.py
```

**Teknolojiler:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Örnekleri](container-app/README.md) 🆕
**Bu depoda kapsamlı konteyner dağıtım örnekleri bulunmaktadır**

- **Konum:** `examples/container-app/`
- **Karmaşıklık:** ⭐-⭐⭐⭐⭐ (Başlangıçtan Uzmana)
- **İçindekiler:**
  - [Ana Rehber](container-app/README.md) - Konteyner dağıtımlarının tam genel bakışı
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Temel REST API örneği
  - [Microservices Architecture](../../../examples/container-app/microservices) - Üretime hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve İleri desenler
  - İzleme, güvenlik ve maliyet optimizasyonu

**Hızlı Başlangıç:**
```bash
# Ana kılavuzu görüntüle
cd examples/container-app

# Basit Flask API'sini dağıt
cd simple-flask-api
azd up

# Mikroservis örneğini dağıt
cd ../microservices
azd up
```

**Teknolojiler:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Çözümü](retail-scenario.md) 🆕
**Bu depoda üretime hazır eksiksiz uygulama bulunmaktadır**

- **Konum:** `examples/retail-multiagent-arm-template/`
- **Karmaşıklık:** ⭐⭐⭐⭐ (İleri)
- **İçindekiler:**
  - Tam ARM dağıtım şablonu
  - Çoklu ajan mimarisi (Müşteri + Envanter)
  - Microsoft Foundry Models entegrasyonu
  - RAG ile AI Search
  - Kapsamlı izleme
  - Tek tıklamayla dağıtım betiği

**Hızlı Başlangıç:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojiler:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Dış Azure Örnekleri (Kullanmak İçin Klonlayın)

Aşağıdaki örnekler resmi Azure-Samples depolarında tutulmaktadır. Farklı AZD desenlerini keşfetmek için bunları klonlayın:

### Basit Uygulamalar (Bölümler 1-2)

| Şablon | Depo | Karmaşıklık | Servisler |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Yerel: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Yerel: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Çok servisli, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Nasıl kullanılır:**
```bash
# Herhangi bir örneği klonla
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Dağıt
azd up
```

### AI Uygulama Örnekleri (Bölümler 2, 5, 8)

| Şablon | Depo | Karmaşıklık | Odak |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Yerel: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 dağıtımı |
| **AI Chat Hızlı Başlangıç** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Temel AI sohbeti |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ajan çerçevesi |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG deseni |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Kurumsal AI |

### Veritabanı & Gelişmiş Desenler (Bölümler 3-8)

| Şablon | Depo | Karmaşıklık | Odak |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Veritabanı entegrasyonu |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Sunucusuz NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Çok servisli |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Öğrenme Hedefleri

Bu örnekleri çalıştırarak:
- Gerçekçi uygulama senaryolarıyla Azure Developer CLI iş akışlarını uygulayacaksınız
- Farklı uygulama mimarilerini ve bunların azd uygulamalarını anlayacaksınız
- Çeşitli Azure servisleri için Kod Olarak Altyapı desenlerini ustalaştıracaksınız
- Yapılandırma yönetimi ve ortama özel dağıtım stratejilerini uygulayacaksınız
- Pratik bağlamlarda izleme, güvenlik ve ölçeklendirme desenlerini uygulayacaksınız
- Gerçek dağıtım senaryolarında sorun giderme ve hata ayıklama deneyimi kazanacaksınız

## Öğrenme Çıktıları

Bu örnekleri tamamladıktan sonra şunları yapabileceksiniz:
- Azure Developer CLI kullanarak çeşitli uygulama türlerini güvenle dağıtmak
- Sağlanan şablonları kendi uygulama gereksinimlerinize uyarlamak
- Bicep kullanarak özel altyapı desenleri tasarlamak ve uygulamak
- Uygun bağımlılıklarla karmaşık çok servisli uygulamaları yapılandırmak
- Gerçek senaryolarda güvenlik, izleme ve performans en iyi uygulamalarını uygulamak
- Pratik deneyime dayalı olarak dağıtımları sorun gidermek ve optimize etmek

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

> **💡 AZD'ye yeni misiniz?** 1 numaralı örnekle başlayın (Flask API) - yaklaşık 20 dakika sürer ve temel kavramları öğretir.

### Yeni Başlayanlar İçin
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Yerel) ⭐  
   Scale-to-zero ile basit bir REST API dağıtın  
   **Süre:** 20-25 dakika | **Maliyet:** $0-5/ay  
   **Neler Öğreneceksiniz:** Temel azd iş akışı, konteynerleştirme, sağlık kontrolleri  
   **Beklenen Sonuç:** İzleme ile "Hello, World!" döndüren çalışan bir API uç noktası

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ile bir Node.js Express web uygulaması dağıtın  
   **Süre:** 25-35 dakika | **Maliyet:** $10-30/ay  
   **Neler Öğreneceksiniz:** Veritabanı entegrasyonu, ortam değişkenleri, bağlantı dizeleri  
   **Beklenen Sonuç:** Oluşturma/okuma/güncelleme/silme işlevselliğine sahip Todo listesi uygulaması

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ile bir React statik web sitesi barındırın  
   **Süre:** 20-30 dakika | **Maliyet:** $0-10/ay  
   **Neler Öğreneceksiniz:** Statik barındırma, sunucusuz fonksiyonlar, CDN dağıtımı  
   **Beklenen Sonuç:** API arka ucuna sahip React UI, otomatik SSL, küresel CDN

### Orta Düzey Kullanıcılar İçin
4. **[Microsoft Foundry Models Sohbet Uygulaması](../../../examples/azure-openai-chat)** (Yerel) ⭐⭐  
   gpt-4.1'i sohbet arayüzü ve güvenli API anahtarı yönetimi ile dağıtın  
   **Süre:** 35-45 dakika | **Maliyet:** $50-200/ay  
   **Neler Öğreneceksiniz:** Microsoft Foundry Models dağıtımı, Key Vault entegrasyonu, token takibi  
   **Beklenen Sonuç:** gpt-4.1 ve maliyet izlemesi ile çalışan sohbet uygulaması

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Yerel) ⭐⭐⭐⭐  
   Üretime hazır çok servisli mimari  
   **Süre:** 45-60 dakika | **Maliyet:** $50-150/ay  
   **Neler Öğreneceksiniz:** Servis iletişimi, mesaj kuyruğu, dağıtık izleme  
   **Beklenen Sonuç:** İzleme ile 2 servisli sistem (API Gateway + Ürün Servisi)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ve Azure SQL Veritabanı ile web uygulaması  
   **Süre:** 30-45 dakika | **Maliyet:** $20-80/ay  
   **Neler Öğreneceksiniz:** Entity Framework, veritabanı geçişleri, bağlantı güvenliği  
   **Beklenen Sonuç:** Azure SQL arka uçlu C# API, otomatik şema dağıtımı

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP tetikleyicili Python Azure Functions ve Cosmos DB  
   **Süre:** 30-40 dakika | **Maliyet:** $10-40/ay  
   **Neler Öğreneceksiniz:** Olay odaklı mimari, sunucusuz ölçekleme, NoSQL entegrasyonu  
   **Beklenen Sonuç:** HTTP isteklerine yanıt veren ve Cosmos DB kullanan bir Function uygulaması

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ve API gateway ile çok servisli Java uygulaması  
   **Süre:** 60-90 dakika | **Maliyet:** $80-200/ay  
   **Neler Öğreneceksiniz:** Spring Boot dağıtımı, servis ağı, yük dengeleme  
   **Beklenen Sonuç:** Servis keşfi ve yönlendirmeye sahip çok servisli Java sistemi

### Microsoft Foundry Şablonları

1. **[Microsoft Foundry Models Chat App - Yerel Örnek](../../../examples/azure-openai-chat)** ⭐⭐  
   Sohbet arayüzü ile eksiksiz gpt-4.1 dağıtımı  
   **Süre:** 35-45 dakika | **Maliyet:** $50-200/ay  
   **Beklenen Sonuç:** Token takibi ve maliyet izleme ile çalışan sohbet uygulaması

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG mimarili zeki sohbet uygulaması  
   **Süre:** 60-90 dakika | **Maliyet:** $100-300/ay  
   **Beklenen Sonuç:** Belge arama ve atıf veren RAG destekli sohbet arayüzü

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI servisleri kullanarak belge analizi  
   **Süre:** 40-60 dakika | **Maliyet:** $20-80/ay  
   **Beklenen Sonuç:** Yüklenen belgelerden metin, tablo ve varlık çıkaran API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ile MLOps iş akışı  
   **Süre:** 2-3 saat | **Maliyet:** $150-500/ay  
   **Beklenen Sonuç:** Eğitim, dağıtım ve izlemeyle otomatikleştirilmiş ML boru hattı

### Gerçek Dünya Senaryoları

#### **Retail Multi-Agent Çözümü** 🆕  
**[Tam Uygulama Kılavuzu](./retail-scenario.md)**

AZD ile kurumsal düzeyde AI uygulama dağıtımını gösteren kapsamlı, üretime hazır çok ajanlı müşteri destek çözümü. Bu senaryo şunları sağlar:
- **Tam Mimari**: Özelleşmiş müşteri hizmetleri ve envanter yönetimi ajanlarına sahip çoklu ajan sistemi
- **Üretim Altyapısı**: Çok bölgeli Microsoft Foundry Models dağıtımları, AI Search, Container Apps ve kapsamlı izleme
- **Dağıtıma Hazır ARM Şablonu**: Tek tıklamayla dağıtım ve birden çok yapılandırma modu (Minimal/Standart/Premium)
- **Gelişmiş Özellikler**: Red teaming güvenlik doğrulaması, ajan değerlendirme çerçevesi, maliyet optimizasyonu ve sorun giderme kılavuzları
- **Gerçek İş Bağlamı**: Dosya yüklemeleri, arama entegrasyonu ve dinamik ölçeklendirme içeren perakendeci müşteri destek kullanım senaryosu

**Teknolojiler**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Karmaşıklık**: ⭐⭐⭐⭐ (İleri - Kurumsal Üretim Hazır)

**İçin Mükemmel**: Yapay zeka geliştiricileri, çözüm mimarları ve üretim çoklu ajan sistemleri kuran ekipler

**Hızlı Başlangıç**: Dahil edilen ARM şablonu ile `./deploy.sh -g myResourceGroup` komutunu kullanarak komple çözümü 30 dakikadan kısa sürede dağıtın

## 📋 Kullanım Talimatları

### Önkoşullar

Herhangi bir örneği çalıştırmadan önce:
- ✅ Sahip (Owner) veya Katılımcı (Contributor) erişimine sahip bir Azure aboneliği
- ✅ Azure Developer CLI yüklü ([Kurulum Kılavuzu](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop çalışıyor (konteyner örnekleri için)
- ✅ Uygun Azure kota limitleri (örnek özel gereksinimlerini kontrol edin)

> **💰 Maliyet Uyarısı:** Tüm örnekler ücretlendirme gerektiren gerçek Azure kaynakları oluşturur. Maliyet tahminleri için ilgili README dosyalarına bakın. Süregelen maliyetlerden kaçınmak için işiniz bittiğinde `azd down` komutunu çalıştırmayı unutmayın.

### Örnekleri Yerel Olarak Çalıştırma

1. **Örneği Klonlayın veya Kopyalayın**
   ```bash
   # İstediğiniz örneğe gidin
   cd examples/simple-web-app
   ```

2. **AZD Ortamını Başlatın**
   ```bash
   # Mevcut şablonla başlat
   azd init
   
   # Veya yeni bir ortam oluştur
   azd env new my-environment
   ```

3. **Ortamı Yapılandırın**
   ```bash
   # Gerekli değişkenleri ayarla
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Dağıtın**
   ```bash
   # Altyapıyı ve uygulamayı dağıt
   azd up
   ```

5. **Dağıtımı Doğrulayın**
   ```bash
   # Servis uç noktalarını al
   azd env get-values
   
   # Uç noktayı test et (örnek)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Beklenen Başarı Göstergeleri:**
   - ✅ `azd up` hatasız tamamlanır
   - ✅ Servis uç noktası HTTP 200 döner
   - ✅ Azure Portal "Running" durumunu gösterir
   - ✅ Application Insights telemetri alıyor

> **⚠️ Sorunlar mı var?** Dağıtım sorunları için [Ortak Sorunlar](../docs/chapter-07-troubleshooting/common-issues.md) sayfasına bakın

### Örnekleri Uyarlama

Her örnek şunları içerir:
- **README.md** - Ayrıntılı kurulum ve özelleştirme talimatları
- **azure.yaml** - Yorumlu AZD yapılandırması
- **infra/** - Parametre açıklamalı Bicep şablonları
- **src/** - Örnek uygulama kodu
- **scripts/** - Yaygın görevler için yardımcı betikler

## 🎯 Öğrenme Hedefleri

### Örnek Kategorileri

#### **Temel Dağıtımlar**
- Tek servisli uygulamalar
- Basit altyapı kalıpları
- Temel yapılandırma yönetimi
- Maliyet-etkin geliştirme kurulumları

#### **Gelişmiş Senaryolar**
- Çok servisli mimariler
- Karmaşık ağlandırma konfigürasyonları
- Veri tabanı entegrasyon kalıpları
- Güvenlik ve uyumluluk uygulamaları

#### **Üretime Hazır Kalıplar**
- Yüksek erişilebilirlik konfigürasyonları
- İzleme ve gözlemlenebilirlik
- CI/CD entegrasyonu
- Felaket kurtarma düzenleri

## 📖 Örnek Açıklamaları

### Basit Web Uygulaması - Node.js Express
**Teknolojiler**: Node.js, Express, MongoDB, Container Apps  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Temel dağıtım, REST API, NoSQL veritabanı entegrasyonu

### Statik Web Sitesi - React SPA
**Teknolojiler**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Statik barındırma, sunucusuz arka uç, modern web geliştirme

### Konteyner Uygulaması - Python Flask
**Teknolojiler**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Kapsayıcılaştırma, REST API, scale-to-zero, health probe'lar, izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/simple-flask-api)

### Konteyner Uygulaması - Mikroservis Mimarisi
**Teknolojiler**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Karmaşıklık**: Gelişmiş  
**Kavramlar**: Çok servisli mimari, servis iletişimi, mesaj kuyruğu, dağıtık izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/microservices)

### Veritabanı Uygulaması - C# ile Azure SQL
**Teknolojiler**: C# ASP.NET Core, Azure SQL Database, App Service  
**Karmaşıklık**: Orta  
**Kavramlar**: Entity Framework, veritabanı bağlantıları, web API geliştirme

### Sunucusuz Fonksiyon - Python Azure Functions
**Teknolojiler**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Karmaşıklık**: Orta  
**Kavramlar**: Olay-tabanlı mimari, sunucusuz hesaplama, tam yığın geliştirme

### Mikroservisler - Java Spring Boot
**Teknolojiler**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Karmaşıklık**: Orta  
**Kavramlar**: Mikroservis iletişimi, dağıtık sistemler, kurumsal kalıplar

### Microsoft Foundry Örnekleri

#### Microsoft Foundry Models Sohbet Uygulaması
**Teknolojiler**: Microsoft Foundry Models, Cognitive Search, App Service  
**Karmaşıklık**: Orta  
**Kavramlar**: RAG mimarisi, vektör arama, LLM entegrasyonu

#### Yapay Zeka Doküman İşleme
**Teknolojiler**: Azure AI Document Intelligence, Storage, Functions  
**Karmaşıklık**: Orta  
**Kavramlar**: Doküman analizi, OCR, veri çıkarımı

#### Makine Öğrenimi İş Akışı
**Teknolojiler**: Azure ML, MLOps, Container Registry  
**Karmaşıklık**: Gelişmiş  
**Kavramlar**: Model eğitimi, dağıtım iş akışları, izleme

## 🛠 Yapılandırma Örnekleri

The `configurations/` directory contains reusable components:

### Ortam Yapılandırmaları
- Geliştirme ortamı ayarları
- Staging ortam yapılandırmaları
- Üretime hazır yapılandırmalar
- Çok bölgeli dağıtım ayarları

### Bicep Modülleri
- Yeniden kullanılabilir altyapı bileşenleri
- Yaygın kaynak kalıpları
- Güvenlik açısından sertleştirilmiş şablonlar
- Maliyet optimize edilmiş yapılandırmalar

### Yardımcı Betikler
- Ortam kurulum otomasyonu
- Veritabanı taşıma betikleri
- Dağıtım doğrulama araçları
- Maliyet izleme yardımcıları

## 🔧 Özelleştirme Kılavuzu

### Örnekleri Kendi Kullanım Durumunuza Uyarlama

1. **Önkoşulları Gözden Geçirin**
   - Azure servis gereksinimlerini kontrol edin
   - Abonelik limitlerini doğrulayın
   - Maliyet etkilerini anlayın

2. **Yapılandırmayı Değiştirin**
   - `azure.yaml` hizmet tanımlarını güncelleyin
   - Bicep şablonlarını özelleştirin
   - Ortam değişkenlerini ayarlayın

3. **Kapsamlı Test Yapın**
   - Önce geliştirme ortamına dağıtın
   - İşlevselliği doğrulayın
   - Ölçeklenebilirlik ve performansı test edin

4. **Güvenlik İncelemesi**
   - Erişim kontrollerini gözden geçirin
   - Gizli anahtar yönetimini uygulayın
   - İzlemeyi ve uyarıları etkinleştirin

## 📊 Karşılaştırma Matrisi

| Örnek | Servisler | Veritabanı | Kimlik Doğrulama | İzleme | Karmaşıklık |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Yerel) | 2 | ❌ | Key Vault | Tam | ⭐⭐ |
| **Python Flask API** (Yerel) | 1 | ❌ | Temel | Tam | ⭐ |
| **Microservices** (Yerel) | 5+ | ✅ | Kurumsal | Gelişmiş | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Temel | Temel | ⭐ |
| React SPA + Functions | 3 | ✅ | Temel | Tam | ⭐ |
| Python Flask Container | 2 | ❌ | Temel | Tam | ⭐ |
| C# Web API + SQL | 2 | ✅ | Tam | Tam | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Tam | Tam | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Tam | Tam | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Tam | Tam | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Temel | Tam | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Tam | Tam | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Yerel) | **8+** | **✅** | **Kurumsal** | **Gelişmiş** | **⭐⭐⭐⭐** |

## 🎓 Öğrenme Yolu

### Önerilen İlerleme

1. **Basit Web Uygulamasıyla Başlayın**
   - AZD'nin temel kavramlarını öğrenin
   - Dağıtım iş akışını anlayın
   - Ortam yönetimi pratiği yapın

2. **Statik Web Sitesini Deneyin**
   - Farklı barındırma seçeneklerini keşfedin
   - CDN entegrasyonunu öğrenin
   - DNS yapılandırmasını anlayın

3. **Konteyner Uygulamaya Geçin**
   - Kapsayıcılaştırma temellerini öğrenin
   - Ölçeklendirme kavramlarını anlayın
   - Docker ile pratik yapın

4. **Veritabanı Entegrasyonu Ekleyin**
   - Veritabanı sağlama süreçlerini öğrenin
   - Bağlantı dizelerini anlayın
   - Gizli anahtar yönetimi pratiği yapın

5. **Sunucusuzu Keşfedin**
   - Olay-tabanlı mimariyi anlayın
   - Trigger ve binding'leri öğrenin
   - API'lerle pratik yapın

6. **Mikroservisler Oluşturun**
   - Servis iletişimini öğrenin
   - Dağıtık sistemleri anlayın
   - Karmaşık dağıtımlarla pratik yapın

## 🔍 Doğru Örneği Bulma

### Teknoloji Yığınına Göre
- **Container Apps**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Yerel)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Yerel)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Yerel)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Yerel)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Yerel)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Yerel)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Yerel)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Yerel)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Mimari Desenine Göre
- **Basit REST API**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statik + Sunucusuz**: React SPA + Functions, Python Functions + SPA
- **Mikroservisler**: [Production Microservices (Yerel)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Konteynerlenmiş**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices)
- **Yapay Zeka Destekli**: **[Microsoft Foundry Models Chat (Yerel)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Çoklu Ajan Mimarisi**: **Retail Multi-Agent Solution**
- **Kurumsal Çoklu Servis**: [Microservices (Yerel)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Karmaşıklık Düzeyine Göre
- **Başlangıç**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Orta**: **[Microsoft Foundry Models Chat (Yerel)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Gelişmiş**: ML Pipeline
- **Kurumsal Üretim-Hazır**: [Microservices (Yerel)](../../../examples/container-app/microservices) (Mesaj kuyruğu ile çok servisli), **Retail Multi-Agent Solution** (ARM şablonu dağıtımıyla tam çoklu ajan sistemi)

## 📚 Ek Kaynaklar

### Dokümantasyon Bağlantıları
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Topluluk Örnekleri
- [Azure Örnekleri AZD Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Şablonları](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galerisi](https://azure.github.io/awesome-azd/)
- [C# ve Azure SQL ile Todo Uygulaması](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python ve MongoDB ile Todo Uygulaması](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js ve PostgreSQL ile Todo Uygulaması](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ile React Web Uygulaması](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps İş](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ile Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### En İyi Uygulamalar
- [Azure Well-Architected Çerçevesi](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Bulut Benimseme Çerçevesi](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Örnek Katkıları

Paylaşacak yararlı bir örneğiniz mi var? Katkılara açığız!

### Gönderim Yönergeleri
1. Belirlenmiş dizin yapısını izleyin
2. Kapsamlı bir README.md ekleyin
3. Yapılandırma dosyalarına yorum ekleyin
4. Göndermeden önce kapsamlı test yapın
5. Maliyet tahminleri ve önkoşulları ekleyin

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

**Pro İpucu**: Teknoloji yığınınıza uyan en basit örnekle başlayın, ardından kademeli olarak daha karmaşık senaryolara ilerleyin. Her örnek, önceki örneklerdeki kavramların üzerine kuruludur!

## 🚀 Başlamaya Hazır mısınız?

### Öğrenme Yolunuz

1. **Tamamen Yeni Başlayan mı?** → [Flask API](../../../examples/container-app/simple-flask-api) ile başlayın (⭐, 20 dk)
2. **Temel AZD Bilginiz mi var?** → [Mikroservisler](../../../examples/container-app/microservices) deneyin (⭐⭐⭐⭐, 60 dk)
3. **Yapay Zeka Uygulamaları mı Geliştiriyorsunuz?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) ile başlayın (⭐⭐, 35 dk) veya inceleyin [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ saat)
4. **Belirli Bir Teknoloji Yığını mı Gerekiyor?** → Üstteki [Doğru Örneği Bulma](#-finding-the-right-example) bölümünü kullanın

### Sonraki Adımlar

- ✅ Yukarıdaki [Önkoşullar](#önkoşullar) bölümünü gözden geçirin
- ✅ Beceri seviyenize uygun bir örnek seçin (bkz. [Karmaşıklık Açıklaması](#karmaşıklık-derecelendirme-açıklaması))
- ✅ Dağıtmadan önce örneğin README dosyasını dikkatle okuyun
- ✅ Test ettikten sonra `azd down` çalıştırmayı hatırlatacak bir hatırlatıcı ayarlayın
- ✅ Deneyiminizi GitHub Issues veya Discussions aracılığıyla paylaşın

### Yardım mı Gerekiyor?

- 📖 [SSS](../resources/faq.md) - Yaygın sorulara cevaplar
- 🐛 [Sorun Giderme Rehberi](../docs/chapter-07-troubleshooting/common-issues.md) - Dağıtım sorunlarını giderin
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Topluluğa sorun
- 📚 [Çalışma Kılavuzu](../resources/study-guide.md) - Öğreniminizi pekiştirin

---

**Gezinme**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Çalışma Materyalleri**: [Çalışma Kılavuzu](../resources/study-guide.md) | [Hızlı Başvuru](../resources/cheat-sheet.md) | [Sözlük](../resources/glossary.md)
- **🔧 Kaynaklar**: [SSS](../resources/faq.md) | [Sorun Giderme](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Son Güncelleme: Kasım 2025 | [Sorun Bildir](https://github.com/microsoft/AZD-for-beginners/issues) | [Örnek Gönderin](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin ana dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlama nedeniyle sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
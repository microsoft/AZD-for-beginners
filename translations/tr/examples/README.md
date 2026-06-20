# Örnekler - Pratik AZD Şablonları ve Yapılandırmaları

**Örneklerle Öğrenme - Bölümlere Göre Düzenlenmiş**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../README.md)
- **📖 Bölüm Haritası**: Örnekler öğrenme zorluğuna göre düzenlenmiştir
- **🚀 Yerel Örnek**: [Perakende Çoklu-Ajan Çözümü](retail-scenario.md)
- **🤖 Harici AI Örnekleri**: Azure Samples depolarına bağlantılar

> **📍 ÖNEMLİ: Yerel ve Harici Örnekler**  
> Bu depo tam uygulamalarla birlikte **4 eksiksiz yerel örnek** içerir:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 dağıtımı ve sohbet arayüzü)  
> - **Container Apps** (Basit Flask API + Mikroservisler)  
> - **Database Uygulaması** (Web + SQL Database)  
> - **Perakende Çoklu-Ajan** (Kurumsal AI Çözümü)  
>   
> Ek örnekler, klonlayabileceğiniz Azure-Samples depolarına yapılan **harici referanslardır**.

## Giriş

Bu dizin, Azure Developer CLI'yi uygulamalı olarak öğrenmenize yardımcı olacak pratik örnekler ve referanslar sağlar. Perakende Çoklu-Ajan senaryosu, bu depoda bulunan eksiksiz, üretime hazır bir uygulamadır. Ek örnekler, çeşitli AZD desenlerini gösteren resmi Azure Samples depolarına referans verir.

### Karmaşıklık Derecesi Açıklaması

- ⭐ **Başlangıç** - Temel kavramlar, tek servis, 15-30 dakika
- ⭐⭐ **Orta** - Birden fazla servis, veritabanı entegrasyonu, 30-60 dakika
- ⭐⭐⭐ **İleri** - Karmaşık mimari, AI entegrasyonu, 1-2 saat
- ⭐⭐⭐⭐ **Uzman** - Üretime hazır, kurumsal desenler, 2+ saat

## 🎯 Bu Depoda Aslında Neler Var

### ✅ Yerel Uygulama (Kullanmaya Hazır)

#### [Microsoft Foundry Models Sohbet Uygulaması](azure-openai-chat/README.md) 🆕
**Bu depoda sohbet arayüzü dahil tam gpt-4.1 dağıtımı bulunmaktadır**

- **Konum:** `examples/azure-openai-chat/`
- **Karmaşıklık:** ⭐⭐ (Orta)
- **Neler Dahil:**
  - Tam Microsoft Foundry Models dağıtımı (gpt-4.1)
  - Python komut satırı sohbet arayüzü
  - Güvenli API anahtarları için Key Vault entegrasyonu
  - Bicep altyapı şablonları
  - Token kullanımı ve maliyet takibi
  - İstek sınırlandırma ve hata yönetimi

**Hızlı Başlangıç:**
```bash
# Örneğe git
cd examples/azure-openai-chat

# Her şeyi dağıt
azd up

# Bağımlılıkları yükle ve sohbet etmeye başla
pip install -r src/requirements.txt
python src/chat.py
```

**Teknolojiler:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Örnekleri](container-app/README.md) 🆕
**Bu depoda kapsamlı konteyner dağıtım örnekleri bulunur**

- **Konum:** `examples/container-app/`
- **Karmaşıklık:** ⭐-⭐⭐⭐⭐ (Başlangıçtan Uzmanlığa)
- **Neler Dahil:**
  - [Ana Kılavuz](container-app/README.md) - Konteyner dağıtımlarının tam genel bakışı
  - [Basit Flask API](../../../examples/container-app/simple-flask-api) - Temel REST API örneği
  - [Mikroservis Mimarisi](../../../examples/container-app/microservices) - Prodüksiyon hazır çok servisli dağıtım
  - Hızlı Başlangıç, Prodüksiyon ve İleri desenler
  - İzleme, güvenlik ve maliyet optimizasyonu

**Hızlı Başlangıç:**
```bash
# Ana kılavuzu görüntüle
cd examples/container-app

# Basit Flask API'yi dağıt
cd simple-flask-api
azd up

# Mikroservis örneğini dağıt
cd ../microservices
azd up
```

**Teknolojiler:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Perakende Çoklu-Ajan Çözümü](retail-scenario.md) 🆕
**Bu depoda üretime hazır eksiksiz uygulama bulunmaktadır**

- **Konum:** `examples/retail-multiagent-arm-template/`
- **Karmaşıklık:** ⭐⭐⭐⭐ (İleri)
- **Neler Dahil:**
  - Tam ARM dağıtım şablonu
  - Çoklu ajan mimarisi (Müşteri + Envanter)
  - Microsoft Foundry Models entegrasyonu
  - RAG ile AI Arama
  - Kapsamlı izleme
  - Tek tıklamayla dağıtım betiği

**Hızlı Başlangıç:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojiler:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Harici Azure Örnekleri (Kullanmak için Klonlayın)

Aşağıdaki örnekler resmi Azure-Samples depolarında tutulmaktadır. Farklı AZD desenlerini keşfetmek için bunları klonlayın:

### Basit Uygulamalar (Bölümler 1-2)

| Şablon | Depo | Karmaşıklık | Servisler |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Yerel: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Yerel: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Çoklu servis, Service Bus, Cosmos DB, SQL |
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
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Temel AI sohbeti |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ajan çerçevesi |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG deseni |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Kurumsal AI |

### Veritabanı ve İleri Desenler (Bölümler 3-8)

| Şablon | Depo | Karmaşıklık | Odak |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Veritabanı entegrasyonu |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL sunucusuz |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Çoklu servis |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Öğrenme Hedefleri

Bu örnekleri uygulayarak şunları yapabileceksiniz:
- Azure Developer CLI iş akışlarını gerçekçi uygulama senaryolarında uygulamalı olarak çalışın
- Farklı uygulama mimarilerini ve bunların azd uygulamalarını anlayın
- Farklı Azure servisleri için Infrastructure as Code (IaC) desenlerinde ustalaşın
- Konfigürasyon yönetimi ve ortama özel dağıtım stratejilerini uygulayın
- İzleme, güvenlik ve ölçeklendirme desenlerini pratik bağlamlarda uygulayın
- Gerçek dağıtım senaryolarında sorun giderme ve hata ayıklama tecrübesi kazanın

## Öğrenme Çıktıları

Bu örnekleri tamamladıktan sonra şunları yapabileceksiniz:
- Azure Developer CLI kullanarak çeşitli uygulama türlerini güvenle dağıtın
- Sağlanan şablonları kendi uygulama gereksinimlerinize uyarlayın
- Bicep kullanarak özel altyapı desenleri tasarlayın ve uygulayın
- Doğru bağımlılıklar ile karmaşık çok servisli uygulamaları yapılandırın
- Gerçek senaryolarda güvenlik, izleme ve performans en iyi uygulamalarını uygulayın
- Pratik deneyime dayalı olarak dağıtımları sorun giderin ve optimize edin

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

> **💡 AZD'ye yeni misiniz?** Örnek #1 (Flask API) ile başlayın - yaklaşık 20 dakika sürer ve temel kavramları öğretir.

### Yeni Başlayanlar İçin
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Yerel) ⭐  
   Scale-to-zero ile basit bir REST API dağıtın  
   **Süre:** 20-25 dakika | **Maliyet:** $0-5/ay  
   **Öğrenecekleriniz:** Temel azd iş akışı, konteynerleştirme, sağlık kontrolleri  
   **Beklenen Sonuç:** İzleme ile birlikte "Hello, World!" döndüren çalışan bir API uç noktası

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ile bir Node.js Express web uygulaması dağıtın  
   **Süre:** 25-35 dakika | **Maliyet:** $10-30/ay  
   **Öğrenecekleriniz:** Veritabanı entegrasyonu, ortam değişkenleri, bağlantı dizeleri  
   **Beklenen Sonuç:** Oluşturma/okuma/güncelleme/silme işlevleri olan Todo liste uygulaması

3. **[Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ile bir React statik sitesi barındırın  
   **Süre:** 20-30 dakika | **Maliyet:** $0-10/ay  
   **Öğrenecekleriniz:** Statik barındırma, serverless fonksiyonlar, CDN dağıtımı  
   **Beklenen Sonuç:** API arka ucu ile React UI, otomatik SSL, küresel CDN

### Orta Düzey Kullanıcılar İçin
4. **[Microsoft Foundry Models Sohbet Uygulaması](../../../examples/azure-openai-chat)** (Yerel) ⭐⭐  
   gpt-4.1'i sohbet arayüzü ve güvenli API anahtarı yönetimi ile dağıtın  
   **Süre:** 35-45 dakika | **Maliyet:** $50-200/ay  
   **Öğrenecekleriniz:** Microsoft Foundry Models dağıtımı, Key Vault entegrasyonu, token takibi  
   **Beklenen Sonuç:** gpt-4.1 ve maliyet takibi ile çalışan bir sohbet uygulaması

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Yerel) ⭐⭐⭐⭐  
   Prodüksiyon hazır çok servisli mimari  
   **Süre:** 45-60 dakika | **Maliyet:** $50-150/ay  
   **Öğrenecekleriniz:** Servis iletişimi, mesaj kuyruğu, dağıtık izleme  
   **Beklenen Sonuç:** İzleme ile birlikte 2 servisli sistem (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ve Azure SQL Veritabanı içeren web uygulaması  
   **Süre:** 30-45 dakika | **Maliyet:** $20-80/ay  
   **Öğrenecekleriniz:** Entity Framework, veritabanı migrasyonları, bağlantı güvenliği  
   **Beklenen Sonuç:** Azure SQL arka uçlu C# API, otomatik şema dağıtımı

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP tetikleyicili Python Azure Functions ve Cosmos DB  
   **Süre:** 30-40 dakika | **Maliyet:** $10-40/ay  
   **Öğrenecekleriniz:** Olay güdümlü mimari, sunucusuz ölçekleme, NoSQL entegrasyonu  
   **Beklenen Sonuç:** HTTP isteklerine yanıt veren ve Cosmos DB'de depolama yapan bir Function uygulaması

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ve API gateway ile çok servisli Java uygulaması  
   **Süre:** 60-90 dakika | **Maliyet:** $80-200/ay  
   **Öğrenecekleriniz:** Spring Boot dağıtımı, servis mesh, yük dengeleme  
   **Beklenen Sonuç:** Servis keşfi ve yönlendirme ile çok servisli Java sistemi

### Microsoft Foundry Şablonları

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Sohbet arayüzü dahil tam gpt-4.1 dağıtımı  
   **Süre:** 35-45 dakika | **Maliyet:** $50-200/ay  
   **Beklenen Sonuç:** Token takibi ve maliyet izleme ile çalışan sohbet uygulaması

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG mimarisi ile zeki sohbet uygulaması  
   **Süre:** 60-90 dakika | **Maliyet:** $100-300/ay  
   **Beklenen Sonuç:** Belge arama ve atıflarla RAG destekli sohbet arayüzü

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI servislerini kullanarak belge analizi  
   **Süre:** 40-60 dakika | **Maliyet:** $20-80/ay  
   **Beklenen Sonuç:** Yüklenen belgelerden metin, tablo ve varlık çıkaran API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ile MLOps iş akışı  
   **Süre:** 2-3 saat | **Maliyet:** $150-500/ay  
   **Beklenen Sonuç:** Eğitim, dağıtım ve izleme içeren otomatik ML boru hattı

### Gerçek Dünya Senaryoları

#### **Perakende Çoklu-Ajan Çözümü** 🆕  
**[Tam Uygulama Kılavuzu](./retail-scenario.md)**

AZD ile kurumsal düzeyde AI uygulama dağıtımını gösteren kapsamlı, üretime hazır çoklu ajan müşteri destek çözümü. Bu senaryo şunları sağlar:

- **Tam Mimari**: Uzmanlaşmış müşteri hizmetleri ve envanter yönetimi ajanlarına sahip çoklu ajan sistemi
- **Üretim Altyapısı**: Çok bölgelik Microsoft Foundry Models dağıtımları, AI Search, Container Apps ve kapsamlı izleme
- **Dağıtıma Hazır ARM Şablonu**: Tek tıkla dağıtım ve birden fazla yapılandırma modu (Minimal/Standard/Premium)
- **Gelişmiş Özellikler**: Kırmızı takım güvenlik doğrulaması, ajan değerlendirme altyapısı, maliyet optimizasyonu ve sorun giderme rehberleri
- **Gerçek İş Bağlamı**: Dosya yüklemeleri, arama entegrasyonu ve dinamik ölçeklendirme ile perakendeci müşteri destek kullanım senaryosu

**Teknolojiler**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Karmaşıklık**: ⭐⭐⭐⭐ (Gelişmiş - Kurumsal Üretim İçin Hazır)

**İçin ideal**: Yapay zeka geliştiricileri, çözüm mimarları ve üretim çok ajanlı sistemler kuran ekipler

**Hızlı Başlangıç**: Dahil edilen ARM şablonunu kullanarak `./deploy.sh -g myResourceGroup` ile tüm çözümü 30 dakikadan kısa sürede dağıtın

## 📋 Kullanım Talimatları

### Ön Koşullar

Herhangi bir örneği çalıştırmadan önce:
- ✅ Azure aboneliği (Owner veya Contributor erişimi)
- ✅ Azure Developer CLI yüklü ([Kurulum Rehberi](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop çalışıyor (konteyner örnekleri için)
- ✅ Uygun Azure kota limitleri (örnek bazlı gereksinimleri kontrol edin)

> **💰 Maliyet Uyarısı:** Tüm örnekler ücretlendirme yapan gerçek Azure kaynakları oluşturur. Maliyet tahminleri için bireysel README dosyalarına bakın. Sürekli ücretlerden kaçınmak için işiniz bittikten sonra `azd down` çalıştırmayı unutmayın.

### Örnekleri Yerelde Çalıştırma

1. **Örneği Klonlayın veya Kopyalayın**
   ```bash
   # İstediğiniz örneğe gidin
   cd examples/simple-web-app
   ```

2. **AZD Ortamını Başlatın**
   ```bash
   # Mevcut şablonla başlat
   azd init
   
   # Ya da yeni bir ortam oluştur
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
   # Altyapı ve uygulamayı dağıt
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

> **⚠️ Sorun mu?** Dağıtım sorunlarını gidermek için [Yaygın Sorunlar](../docs/chapter-07-troubleshooting/common-issues.md) sayfasına bakın

### Örnekleri Uyarlama

Her örnek şunları içerir:
- **README.md** - Ayrıntılı kurulum ve özelleştirme talimatları
- **azure.yaml** - Yorumlarla AZD yapılandırması
- **infra/** - Parametre açıklamalarıyla Bicep şablonları
- **src/** - Örnek uygulama kodu
- **scripts/** - Yaygın görevler için yardımcı betikler

## 🎯 Öğrenme Hedefleri

### Örnek Kategorileri

#### **Temel Dağıtımlar**
- Tek hizmetli uygulamalar
- Basit altyapı kalıpları
- Temel yapılandırma yönetimi
- Maliyet açısından verimli geliştirme kurulumları

#### **Gelişmiş Senaryolar**
- Çok hizmetli mimariler
- Karmaşık ağ yapılandırmaları
- Veritabanı entegrasyon kalıpları
- Güvenlik ve uyumluluk uygulamaları

#### **Üretime Hazır Kalıplar**
- Yüksek kullanılabilirlik yapılandırmaları
- İzleme ve gözlemlenebilirlik
- CI/CD entegrasyonu
- Felaket kurtarma kurulumları

## 📖 Örnek Açıklamaları

### Basit Web Uygulaması - Node.js Express
**Teknolojiler**: Node.js, Express, MongoDB, Container Apps  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Temel dağıtım, REST API, NoSQL veritabanı entegrasyonu

### Statik Web Sitesi - React SPA
**Teknolojiler**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Statik barındırma, serverless backend, modern web geliştirme

### Container Uygulaması - Python Flask
**Teknolojiler**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Konteynerleştirme, REST API, scale-to-zero, sağlık kontrolleri, izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/simple-flask-api)

### Container Uygulaması - Mikroservis Mimarisi
**Teknolojiler**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Karmaşıklık**: Gelişmiş  
**Kavramlar**: Çok hizmetli mimari, hizmet iletişimi, mesaj kuyruğu, dağıtık izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/microservices)

### Veritabanı Uygulaması - C# ve Azure SQL
**Teknolojiler**: C# ASP.NET Core, Azure SQL Database, App Service  
**Karmaşıklık**: Orta  
**Kavramlar**: Entity Framework, veritabanı bağlantıları, web API geliştirme

### Serverless Fonksiyon - Python Azure Functions
**Teknolojiler**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Karmaşıklık**: Orta  
**Kavramlar**: Olay tabanlı mimari, serverless hesaplama, full-stack geliştirme

### Mikroservisler - Java Spring Boot
**Teknolojiler**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Karmaşıklık**: Orta  
**Kavramlar**: Mikroservis iletişimi, dağıtık sistemler, kurumsal kalıplar

### Microsoft Foundry Örnekleri

#### Microsoft Foundry Models Sohbet Uygulaması
**Teknolojiler**: Microsoft Foundry Models, Azure AI Search, App Service  
**Karmaşıklık**: Orta  
**Kavramlar**: RAG mimarisi, vektör arama, LLM entegrasyonu

#### AI Belge İşleme
**Teknolojiler**: Azure AI Document Intelligence, Storage, Functions  
**Karmaşıklık**: Orta  
**Kavramlar**: Belge analizi, OCR, veri çıkarımı

#### Makine Öğrenimi Boru Hattı
**Teknolojiler**: Azure ML, MLOps, Container Registry  
**Karmaşıklık**: Gelişmiş  
**Kavramlar**: Model eğitimi, dağıtım boru hatları, izleme

## 🛠 Yapılandırma Örnekleri

The `configurations/` directory contains reusable components:

### Ortam Yapılandırmaları
- Geliştirme ortamı ayarları
- Sahneleme ortamı yapılandırmaları
- Üretime hazır yapılandırmalar
- Çok bölgelik dağıtım kurulumları

### Bicep Modülleri
- Yeniden kullanılabilir altyapı bileşenleri
- Yaygın kaynak kalıpları
- Güvenlik güçlendirilmiş şablonlar
- Maliyet açısından optimize edilmiş yapılandırmalar

### Yardımcı Betikler
- Ortam kurulumu otomasyonu
- Veritabanı taşıma betikleri
- Dağıtım doğrulama araçları
- Maliyet izleme yardımcıları

## 🔧 Özelleştirme Rehberi

### Örnekleri Kendi Kullanım Durumunuza Uyarlama

1. **Ön Koşulları Gözden Geçirin**
   - Azure hizmet gereksinimlerini kontrol edin
   - Abonelik limitlerini doğrulayın
   - Maliyet etkilerini anlayın

2. **Yapılandırmayı Değiştirin**
   - `azure.yaml` servis tanımlarını güncelleyin
   - Bicep şablonlarını özelleştirin
   - Ortam değişkenlerini ayarlayın

3. **İyice Test Edin**
   - Önce geliştirme ortamına dağıtın
   - Fonksiyonelliği doğrulayın
   - Ölçeklenebilirlik ve performansı test edin

4. **Güvenlik İncelemesi**
   - Erişim kontrollerini gözden geçirin
   - Gizli yönetimini uygulayın
   - İzlemeyi ve uyarıları etkinleştirin

## 📊 Karşılaştırma Matrisi

| Örnek | Hizmetler | Veritabanı | Kimlik Doğrulama | İzleme | Karmaşıklık |
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

1. **Basit Web Uygulaması ile Başlayın**
   - Temel AZD kavramlarını öğrenin
   - Dağıtım iş akışını anlayın
   - Ortam yönetimi pratiği yapın

2. **Statik Web Sitesini Deneyin**
   - Farklı barındırma seçeneklerini keşfedin
   - CDN entegrasyonunu öğrenin
   - DNS yapılandırmasını anlayın

3. **Container Uygulamasına Geçin**
   - Konteynerleştirme temellerini öğrenin
   - Ölçeklendirme kavramlarını anlayın
   - Docker ile pratik yapın

4. **Veritabanı Entegrasyonu Ekleyin**
   - Veritabanı sağlama işlemlerini öğrenin
   - Bağlantı dizelerini anlayın
   - Gizli yönetimi pratiği yapın

5. **Serverless'i Keşfedin**
   - Olay tabanlı mimariyi anlayın
   - Tetikleyiciler ve bağlamaları öğrenin
   - API'lerle pratik yapın

6. **Mikroservisler Oluşturun**
   - Hizmet iletişimini öğrenin
   - Dağıtık sistemleri anlayın
   - Karmaşık dağıtımlarla pratik yapın

## 🔍 Doğru Örneği Bulma

### Teknoloji Yığınına Göre
- **Container Apps**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo Uygulaması, [Microservices API Gateway (Yerel)](../../../examples/container-app/microservices)
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

### Mimari Desene Göre
- **Simple REST API**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Yerel)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Yerel)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Yerel)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Karmaşıklık Düzeyine Göre
- **Başlangıç**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Orta**: **[Microsoft Foundry Models Chat (Yerel)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Gelişmiş**: ML Pipeline
- **Kurumsal Üretim İçin Hazır**: [Microservices (Yerel)](../../../examples/container-app/microservices) (Mesaj kuyruğuyla çok hizmetli), **Retail Multi-Agent Solution** (ARM şablonu ile tam çok ajanlı sistem dağıtımı)

## 📚 Ek Kaynaklar

### Dokümantasyon Bağlantıları
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Topluluk Örnekleri
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ile React Web Uygulaması](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Görevi](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ile Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### En İyi Uygulamalar
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Örnek Katkıları

Paylaşacak faydalı bir örneğiniz mi var? Katkılarınızı bekliyoruz!

### Gönderim Kuralları
1. Belirlenmiş dizin yapısını takip edin
2. Kapsamlı bir README.md dahil edin
3. Yapılandırma dosyalarına açıklamalar ekleyin
4. Göndermeden önce kapsamlı şekilde test edin
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

**İpucu**: Teknoloji yığınına en uygun en basit örnekle başlayın, ardından kademeli olarak daha karmaşık senaryolara geçin. Her örnek önceki örneklerin kavramları üzerine inşa edilir!

## 🚀 Başlamaya Hazır mısınız?

### Öğrenme Yolunuz

1. **Tamamen Yeni Başlayan mı?** → [Flask API](../../../examples/container-app/simple-flask-api) ile başlayın (⭐, 20 dk)
2. **Temel AZD Bilginiz mi Var?** → [Microservices](../../../examples/container-app/microservices) deneyin (⭐⭐⭐⭐, 60 dk)
3. **Yapay Zeka Uygulamaları mı Geliştiriyorsunuz?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) ile başlayın (⭐⭐, 35 dk) veya [Retail Multi-Agent](retail-scenario.md) keşfedin (⭐⭐⭐⭐, 2+ saat)
4. **Belirli Bir Teknoloji Yığınına mı İhtiyacınız Var?** → Yukarıdaki [Doğru Örneği Bulma](#-finding-the-right-example) bölümünü kullanın

### Sonraki Adımlar

- ✅ Yukarıdaki [Önkoşulları](#ön-koşullar) gözden geçirin
- ✅ Beceri seviyenize uygun bir örnek seçin (bkz. [Karmaşıklık Açıklaması](#karmaşıklık-derecesi-açıklaması))
- ✅ Dağıtmadan önce örneğin README dosyasını iyice okuyun
- ✅ Testten sonra `azd down` çalıştırmayı hatırlatacak bir hatırlatıcı ayarlayın
- ✅ Deneyiminizi GitHub Issues veya Discussions üzerinden paylaşın

### Yardıma mı İhtiyacınız Var?

- 📖 [SSS](../resources/faq.md) - Sık sorulan soruların yanıtları
- 🐛 [Sorun Giderme Kılavuzu](../docs/chapter-07-troubleshooting/common-issues.md) - Dağıtım sorunlarını giderin
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Topluluğa sorun
- 📚 [Çalışma Rehberi](../resources/study-guide.md) - Öğreniminizi pekiştirin

---

**Gezinme**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Çalışma Materyalleri**: [Çalışma Rehberi](../resources/study-guide.md) | [Hızlı Başvuru](../resources/cheat-sheet.md) | [Sözlük](../resources/glossary.md)
- **🔧 Kaynaklar**: [SSS](../resources/faq.md) | [Sorun Giderme](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Son Güncelleme: Kasım 2025 | [Sorun Bildir](https://github.com/microsoft/AZD-for-beginners/issues) | [Örnek Gönderin](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
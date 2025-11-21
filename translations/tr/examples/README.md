<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-20T22:41:02+00:00",
  "source_file": "examples/README.md",
  "language_code": "tr"
}
-->
# Örnekler - Pratik AZD Şablonları ve Yapılandırmaları

**Örneklerle Öğrenme - Bölümlere Göre Düzenlenmiş**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../README.md)
- **📖 Bölüm Haritası**: Öğrenme karmaşıklığına göre düzenlenmiş örnekler
- **🚀 Yerel Örnek**: [Perakende Çoklu Ajan Çözümü](retail-scenario.md)
- **🤖 Harici AI Örnekleri**: Azure Samples depolarına bağlantılar

> **📍 ÖNEMLİ: Yerel ve Harici Örnekler**  
> Bu depo, tam uygulamalı **4 yerel örnek** içerir:  
> - **Azure OpenAI Sohbet** (GPT-4 konuşma arayüzü ile dağıtımı)  
> - **Container Apps** (Basit Flask API + Mikroservisler)  
> - **Veritabanı Uygulaması** (Web + SQL Veritabanı)  
> - **Perakende Çoklu Ajan** (Kurumsal AI Çözümü)  
>  
> Ek örnekler, klonlayabileceğiniz Azure-Samples depolarına **harici referanslar**dır.

## Giriş

Bu dizin, Azure Developer CLI'yi pratik yaparak öğrenmenize yardımcı olacak pratik örnekler ve referanslar sağlar. Perakende Çoklu Ajan senaryosu, bu depoda yer alan tam üretim hazır bir uygulamadır. Ek örnekler, çeşitli AZD desenlerini gösteren resmi Azure Samples referanslarını içerir.

### Karmaşıklık Derecelendirme Efsanesi

- ⭐ **Başlangıç** - Temel kavramlar, tek hizmet, 15-30 dakika
- ⭐⭐ **Orta Düzey** - Birden fazla hizmet, veritabanı entegrasyonu, 30-60 dakika
- ⭐⭐⭐ **İleri Düzey** - Karmaşık mimari, AI entegrasyonu, 1-2 saat
- ⭐⭐⭐⭐ **Uzman** - Üretim hazır, kurumsal desenler, 2+ saat

## 🎯 Bu Depoda Neler Var?

### ✅ Yerel Uygulama (Kullanıma Hazır)

#### [Azure OpenAI Sohbet Uygulaması](azure-openai-chat/README.md) 🆕
**Bu depoda yer alan tam GPT-4 dağıtımı ve sohbet arayüzü**

- **Konum:** `examples/azure-openai-chat/`
- **Karmaşıklık:** ⭐⭐ (Orta Düzey)
- **İçerik:**
  - Tam Azure OpenAI dağıtımı (GPT-4)
  - Python komut satırı sohbet arayüzü
  - Güvenli API anahtarları için Key Vault entegrasyonu
  - Bicep altyapı şablonları
  - Token kullanımı ve maliyet takibi
  - Hız sınırlama ve hata yönetimi

**Hızlı Başlangıç:**
```bash
# Örneğe gidin
cd examples/azure-openai-chat

# Her şeyi dağıtın
azd up

# Bağımlılıkları yükleyin ve sohbet etmeye başlayın
pip install -r src/requirements.txt
python src/chat.py
```

**Teknolojiler:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Örnekleri](container-app/README.md) 🆕
**Bu depoda yer alan kapsamlı konteyner dağıtım örnekleri**

- **Konum:** `examples/container-app/`
- **Karmaşıklık:** ⭐-⭐⭐⭐⭐ (Başlangıçtan Uzmanlığa)
- **İçerik:**
  - [Ana Kılavuz](container-app/README.md) - Konteyner dağıtımlarının tam genel görünümü
  - [Basit Flask API](../../../examples/container-app/simple-flask-api) - Temel REST API örneği
  - [Mikroservisler Mimari](../../../examples/container-app/microservices) - Üretim hazır çoklu hizmet dağıtımı
  - Hızlı Başlangıç, Üretim ve İleri Düzey desenler
  - İzleme, güvenlik ve maliyet optimizasyonu

**Hızlı Başlangıç:**
```bash
# Ana kılavuzu görüntüle
cd examples/container-app

# Basit Flask API'sini dağıt
cd simple-flask-api
azd up

# Mikro hizmetler örneğini dağıt
cd ../microservices
azd up
```

**Teknolojiler:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Perakende Çoklu Ajan Çözümü](retail-scenario.md) 🆕
**Bu depoda yer alan tam üretim hazır uygulama**

- **Konum:** `examples/retail-multiagent-arm-template/`
- **Karmaşıklık:** ⭐⭐⭐⭐ (İleri Düzey)
- **İçerik:**
  - Tam ARM dağıtım şablonu
  - Çoklu ajan mimarisi (Müşteri + Envanter)
  - Azure OpenAI entegrasyonu
  - RAG ile AI Arama
  - Kapsamlı izleme
  - Tek tıklama ile dağıtım scripti

**Hızlı Başlangıç:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknolojiler:** Azure OpenAI, AI Arama, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Harici Azure Örnekleri (Klonlayarak Kullan)

Aşağıdaki örnekler resmi Azure-Samples depolarında tutulmaktadır. Farklı AZD desenlerini keşfetmek için klonlayabilirsiniz:

### Basit Uygulamalar (Bölüm 1-2)

| Şablon | Depo | Karmaşıklık | Hizmetler |
|:-------|:-----|:-----------|:----------|
| **Python Flask API** | [Yerel: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisler** | [Yerel: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Çoklu hizmet, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Nasıl Kullanılır:**
```bash
# Herhangi bir örneği klonla
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Dağıt
azd up
```

### AI Uygulama Örnekleri (Bölüm 2, 5, 8)

| Şablon | Depo | Karmaşıklık | Odak |
|:-------|:-----|:-----------|:-----|
| **Azure OpenAI Sohbet** | [Yerel: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 dağıtımı |
| **AI Sohbet Hızlı Başlangıç** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Temel AI sohbet |
| **AI Ajanları** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Ajan çerçevesi |
| **Arama + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG deseni |
| **Contoso Sohbet** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Kurumsal AI |

### Veritabanı ve İleri Düzey Desenler (Bölüm 3-8)

| Şablon | Depo | Karmaşıklık | Odak |
|:-------|:-----|:-----------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Veritabanı entegrasyonu |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL sunucusuz |
| **Java Mikroservisler** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Çoklu hizmet |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Öğrenme Hedefleri

Bu örnekler üzerinde çalışarak:
- Gerçekçi uygulama senaryolarıyla Azure Developer CLI iş akışlarını pratik yapın
- Farklı uygulama mimarilerini ve bunların azd uygulamalarını anlayın
- Çeşitli Azure hizmetleri için Kod Olarak Altyapı desenlerini öğrenin
- Yapılandırma yönetimi ve ortam spesifik dağıtım stratejilerini uygulayın
- Pratik bağlamlarda izleme, güvenlik ve ölçeklendirme desenlerini uygulayın
- Gerçek dağıtım senaryolarında sorun giderme ve hata ayıklama deneyimi kazanın

## Öğrenme Çıktıları

Bu örnekleri tamamladıktan sonra:
- Azure Developer CLI kullanarak çeşitli uygulama türlerini güvenle dağıtabilirsiniz
- Sağlanan şablonları kendi uygulama gereksinimlerinize uyarlayabilirsiniz
- Bicep kullanarak özel altyapı desenleri tasarlayıp uygulayabilirsiniz
- Doğru bağımlılıklarla karmaşık çoklu hizmet uygulamaları yapılandırabilirsiniz
- Gerçek senaryolarda güvenlik, izleme ve performans en iyi uygulamalarını uygulayabilirsiniz
- Pratik deneyime dayalı olarak dağıtımları optimize edip sorunları giderebilirsiniz

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

> **💡 AZD'ye Yeni mi Başlıyorsunuz?** Örnek #1 (Flask API) ile başlayın - yaklaşık 20 dakika sürer ve temel kavramları öğretir.

### Başlangıç Seviyesi
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Yerel) ⭐  
   Ölçeklenebilir basit bir REST API dağıtın  
   **Süre:** 20-25 dakika | **Maliyet:** $0-5/ay  
   **Öğrenecekleriniz:** Temel azd iş akışı, konteynerleştirme, sağlık kontrolleri  
   **Beklenen Sonuç:** İzleme ile "Hello, World!" döndüren çalışan bir API uç noktası

2. **[Basit Web Uygulaması - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ile bir Node.js Express web uygulaması dağıtın  
   **Süre:** 25-35 dakika | **Maliyet:** $10-30/ay  
   **Öğrenecekleriniz:** Veritabanı entegrasyonu, ortam değişkenleri, bağlantı dizeleri  
   **Beklenen Sonuç:** Oluşturma/okuma/güncelleme/silme işlevselliği olan bir yapılacaklar listesi uygulaması

3. **[Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Statik Web Uygulamaları ile bir React statik web sitesi barındırın  
   **Süre:** 20-30 dakika | **Maliyet:** $0-10/ay  
   **Öğrenecekleriniz:** Statik barındırma, sunucusuz işlevler, CDN dağıtımı  
   **Beklenen Sonuç:** API arka ucu, otomatik SSL, global CDN ile React UI

### Orta Düzey Kullanıcılar İçin
4. **[Azure OpenAI Sohbet Uygulaması](../../../examples/azure-openai-chat)** (Yerel) ⭐⭐  
   GPT-4'ü sohbet arayüzü ve güvenli API anahtar yönetimi ile dağıtın  
   **Süre:** 35-45 dakika | **Maliyet:** $50-200/ay  
   **Öğrenecekleriniz:** Azure OpenAI dağıtımı, Key Vault entegrasyonu, token takibi  
   **Beklenen Sonuç:** GPT-4 ve maliyet izleme ile çalışan bir sohbet uygulaması

5. **[Container App - Mikroservisler](../../../examples/container-app/microservices)** (Yerel) ⭐⭐⭐⭐  
   Üretim hazır çoklu hizmet mimarisi  
   **Süre:** 45-60 dakika | **Maliyet:** $50-150/ay  
   **Öğrenecekleriniz:** Hizmet iletişimi, mesaj sıralama, dağıtılmış izleme  
   **Beklenen Sonuç:** İzleme ile 2 hizmetli sistem (API Gateway + Ürün Hizmeti)

6. **[Veritabanı Uygulaması - C# ile Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API ve Azure SQL Veritabanı ile web uygulaması  
   **Süre:** 30-45 dakika | **Maliyet:** $20-80/ay  
   **Öğrenecekleriniz:** Entity Framework, veritabanı geçişleri, bağlantı güvenliği  
   **Beklenen Sonuç:** Azure SQL arka ucu ile C# API, otomatik şema dağıtımı

7. **[Sunucusuz İşlev - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP tetikleyicileri ve Cosmos DB ile Python Azure Functions  
   **Süre:** 30-40 dakika | **Maliyet:** $10-40/ay  
   **Öğrenecekleriniz:** Olay odaklı mimari, sunucusuz ölçeklendirme, NoSQL entegrasyonu  
   **Beklenen Sonuç:** HTTP isteklerine yanıt veren ve Cosmos DB depolama kullanan işlev uygulaması

8. **[Mikroservisler - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps ve API geçidi ile çoklu hizmet Java uygulaması  
   **Süre:** 60-90 dakika | **Maliyet:** $80-200/ay  
   **Öğrenecekleriniz:** Spring Boot dağıtımı, hizmet ağı, yük dengeleme  
   **Beklenen Sonuç:** Hizmet keşfi ve yönlendirme ile çoklu hizmet Java sistemi

### Azure AI Foundry Şablonları

1. **[Azure OpenAI Sohbet Uygulaması - Yerel Örnek](../../../examples/azure-openai-chat)** ⭐⭐  
   Tam GPT-4 dağıtımı ve sohbet arayüzü  
   **Süre:** 35-45 dakika | **Maliyet:** $50-200/ay  
   **Beklenen Sonuç:** Token takibi ve maliyet izleme ile çalışan bir sohbet uygulaması

2. **[Azure Arama + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG mimarisi ile akıllı sohbet uygulaması  
   **Süre:** 60-90 dakika | **Maliyet:** $100-300/ay  
   **Beklenen Sonuç:** Belge arama ve alıntılar ile RAG destekli sohbet arayüzü

3. **[AI Belge İşleme](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI hizmetlerini kullanarak belge analizi  
   **Süre:** 40-60 dakika | **Maliyet:** $20-80/ay  
   **Beklenen Sonuç:** Yüklenen belgelerden metin, tablo ve varlık çıkaran API

4. **[Makine Öğrenimi Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ile MLOps iş akışı  
   **Süre:** 2-3 saat | **Maliyet:** $150-500/ay  
   **Beklenen Sonuç:** Eğitim, dağıtım ve izleme ile otomatik ML pipeline

### Gerçek Dünya Senaryoları

#### **Perakende Çoklu Ajan Çözümü** 🆕
**[Tam Uygulama Kılavuzu](./retail-scenario.md)**

Kurumsal düzeyde AI uygulama dağıtımı ile AZD'yi gösteren kapsamlı, üretim hazır çoklu ajan müşteri destek çözümü. Bu senaryo şunları sağlar:

- **Tam Mimari**: Özel müşteri hizmetleri ve envanter yönetimi ajanları ile çoklu ajan sistemi
- **Üretim Altyapısı**: Çok bölgeli Azure OpenAI dağıtımları, AI Arama, Container Apps ve kapsamlı izleme
- **Hazır ARM Şablonu**: Tek tıkla dağıtım, birden fazla yapılandırma modu (Minimal/Standart/Premium)
- **Gelişmiş Özellikler**: Güvenlik doğrulama (red teaming), ajan değerlendirme çerçevesi, maliyet optimizasyonu ve sorun giderme rehberleri
- **Gerçek İş Senaryosu**: Dosya yüklemeleri, arama entegrasyonu ve dinamik ölçeklendirme ile perakende müşteri destek kullanım durumu

**Teknolojiler**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Zorluk Seviyesi**: ⭐⭐⭐⭐ (Gelişmiş - Kurumsal Üretime Hazır)

**Kimler için ideal**: AI geliştiricileri, çözüm mimarları ve üretim çoklu ajan sistemleri geliştiren ekipler

**Hızlı Başlangıç**: Dahili ARM şablonunu kullanarak `./deploy.sh -g myResourceGroup` komutuyla 30 dakikadan kısa sürede tam çözümü dağıtın

## 📋 Kullanım Talimatları

### Ön Koşullar

Herhangi bir örneği çalıştırmadan önce:
- ✅ Sahip veya Katkıda Bulunan erişimine sahip bir Azure aboneliği
- ✅ Azure Developer CLI kurulu ([Kurulum Rehberi](../docs/getting-started/installation.md))
- ✅ Docker Desktop çalışıyor (konteyner örnekleri için)
- ✅ Uygun Azure kotaları (örnek özel gereksinimleri kontrol edin)

> **💰 Maliyet Uyarısı:** Tüm örnekler gerçek Azure kaynakları oluşturur ve ücretlendirme yapılır. Maliyet tahminleri için bireysel README dosyalarına bakın. Sürekli maliyetlerden kaçınmak için işiniz bittiğinde `azd down` komutunu çalıştırmayı unutmayın.

### Örnekleri Yerel Olarak Çalıştırma

1. **Örneği Klonla veya Kopyala**  
   ```bash
   # İstenen örneğe gidin
   cd examples/simple-web-app
   ```
  
2. **AZD Ortamını Başlat**  
   ```bash
   # Mevcut şablonla başlat
   azd init
   
   # Veya yeni bir ortam oluştur
   azd env new my-environment
   ```
  
3. **Ortamı Yapılandır**  
   ```bash
   # Gerekli değişkenleri ayarla
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Dağıtımı Gerçekleştir**  
   ```bash
   # Altyapı ve uygulamayı dağıt
   azd up
   ```
  
5. **Dağıtımı Doğrula**  
   ```bash
   # Hizmet uç noktalarını al
   azd env get-values
   
   # Uç noktayı test et (örnek)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Beklenen Başarı Göstergeleri:**
   - ✅ `azd up` hatasız tamamlanır
   - ✅ Servis uç noktası HTTP 200 döner
   - ✅ Azure Portal "Çalışıyor" durumunu gösterir
   - ✅ Application Insights telemetri alır

> **⚠️ Sorun mu var?** Dağıtım sorunlarını gidermek için [Ortak Sorunlar](../docs/troubleshooting/common-issues.md) bölümüne bakın

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
- Basit altyapı desenleri
- Temel yapılandırma yönetimi
- Maliyet etkin geliştirme ortamları

#### **Gelişmiş Senaryolar**
- Çok hizmetli mimariler
- Karmaşık ağ yapılandırmaları
- Veritabanı entegrasyon desenleri
- Güvenlik ve uyumluluk uygulamaları

#### **Üretime Hazır Desenler**
- Yüksek erişilebilirlik yapılandırmaları
- İzleme ve gözlemlenebilirlik
- CI/CD entegrasyonu
- Felaket kurtarma yapılandırmaları

## 📖 Örnek Açıklamaları

### Basit Web Uygulaması - Node.js Express
**Teknolojiler**: Node.js, Express, MongoDB, Container Apps  
**Zorluk Seviyesi**: Başlangıç  
**Kavramlar**: Temel dağıtım, REST API, NoSQL veritabanı entegrasyonu

### Statik Web Sitesi - React SPA
**Teknolojiler**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Zorluk Seviyesi**: Başlangıç  
**Kavramlar**: Statik barındırma, sunucusuz arka uç, modern web geliştirme

### Konteyner Uygulaması - Python Flask
**Teknolojiler**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Zorluk Seviyesi**: Başlangıç  
**Kavramlar**: Konteynerleştirme, REST API, sıfıra ölçeklendirme, sağlık kontrolleri, izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/simple-flask-api)

### Konteyner Uygulaması - Mikroservis Mimarisi
**Teknolojiler**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Zorluk Seviyesi**: Gelişmiş  
**Kavramlar**: Çok hizmetli mimari, hizmet iletişimi, mesaj sıralama, dağıtılmış izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/microservices)

### Veritabanı Uygulaması - C# ve Azure SQL
**Teknolojiler**: C# ASP.NET Core, Azure SQL Database, App Service  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Entity Framework, veritabanı bağlantıları, web API geliştirme

### Sunucusuz Fonksiyon - Python Azure Functions
**Teknolojiler**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Olay odaklı mimari, sunucusuz hesaplama, tam yığın geliştirme

### Mikroservisler - Java Spring Boot
**Teknolojiler**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Mikroservis iletişimi, dağıtılmış sistemler, kurumsal desenler

### Azure AI Foundry Örnekleri

#### Azure OpenAI Sohbet Uygulaması
**Teknolojiler**: Azure OpenAI, Cognitive Search, App Service  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: RAG mimarisi, vektör arama, LLM entegrasyonu

#### AI Belge İşleme
**Teknolojiler**: Azure AI Document Intelligence, Storage, Functions  
**Zorluk Seviyesi**: Orta  
**Kavramlar**: Belge analizi, OCR, veri çıkarma

#### Makine Öğrenimi Pipeline
**Teknolojiler**: Azure ML, MLOps, Container Registry  
**Zorluk Seviyesi**: Gelişmiş  
**Kavramlar**: Model eğitimi, dağıtım süreçleri, izleme

## 🛠 Yapılandırma Örnekleri

`configurations/` dizini yeniden kullanılabilir bileşenler içerir:

### Ortam Yapılandırmaları
- Geliştirme ortamı ayarları
- Staging ortamı yapılandırmaları
- Üretime hazır yapılandırmalar
- Çok bölgeli dağıtım ayarları

### Bicep Modülleri
- Yeniden kullanılabilir altyapı bileşenleri
- Yaygın kaynak desenleri
- Güvenlik güçlendirilmiş şablonlar
- Maliyet optimizasyonlu yapılandırmalar

### Yardımcı Betikler
- Ortam kurulum otomasyonu
- Veritabanı geçiş betikleri
- Dağıtım doğrulama araçları
- Maliyet izleme araçları

## 🔧 Özelleştirme Rehberi

### Örnekleri Kendi Kullanım Durumunuza Uyarlama

1. **Ön Koşulları İnceleyin**
   - Azure hizmet gereksinimlerini kontrol edin
   - Abonelik limitlerini doğrulayın
   - Maliyet etkilerini anlayın

2. **Yapılandırmayı Değiştirin**
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
| **Azure OpenAI Sohbet** (Yerel) | 2 | ❌ | Key Vault | Tam | ⭐⭐ |
| **Python Flask API** (Yerel) | 1 | ❌ | Temel | Tam | ⭐ |
| **Mikroservisler** (Yerel) | 5+ | ✅ | Kurumsal | Gelişmiş | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Temel | Temel | ⭐ |
| React SPA + Functions | 3 | ✅ | Temel | Tam | ⭐ |
| Python Flask Container | 2 | ❌ | Temel | Tam | ⭐ |
| C# Web API + SQL | 2 | ✅ | Tam | Tam | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Tam | Tam | ⭐⭐ |
| Java Mikroservisler | 5+ | ✅ | Tam | Tam | ⭐⭐ |
| Azure OpenAI Sohbet | 3 | ✅ | Tam | Tam | ⭐⭐⭐ |
| AI Belge İşleme | 2 | ❌ | Temel | Tam | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Tam | Tam | ⭐⭐⭐⭐ |
| **Perakende Çoklu Ajan** (Yerel) | **8+** | **✅** | **Kurumsal** | **Gelişmiş** | **⭐⭐⭐⭐** |

## 🎓 Öğrenme Yolu

### Önerilen İlerleme

1. **Basit Web Uygulamasıyla Başlayın**
   - Temel AZD kavramlarını öğrenin
   - Dağıtım iş akışını anlayın
   - Ortam yönetimi pratiği yapın

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
   - Gizli bilgilerin yönetimini uygulayın

5. **Sunucusuz Mimariyi Keşfedin**
   - Olay odaklı mimariyi anlayın
   - Tetikleyiciler ve bağlamalar hakkında bilgi edinin
   - API'lerle pratik yapın

6. **Mikroservisler Geliştirin**
   - Hizmet iletişimini öğrenin
   - Dağıtılmış sistemleri anlayın
   - Karmaşık dağıtımlarla pratik yapın

## 🔍 Doğru Örneği Bulma

### Teknoloji Yığınına Göre
- **Container Apps**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Mikroservisler (Yerel)](../../../examples/container-app/microservices), Java Mikroservisler
- **Node.js**: Node.js Express Todo Uygulaması, [Mikroservisler API Gateway (Yerel)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Mikroservisler Ürün Hizmeti (Yerel)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikroservisler Sipariş Hizmeti (Yerel)](../../../examples/container-app/microservices), C# Web API + SQL Veritabanı, Azure OpenAI Sohbet Uygulaması, ML Pipeline
- **Go**: [Mikroservisler Kullanıcı Hizmeti (Yerel)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikroservisler
- **React**: React SPA + Functions
- **Konteynerler**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Mikroservisler (Yerel)](../../../examples/container-app/microservices), Java Mikroservisler
- **Veritabanları**: [Mikroservisler (Yerel)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Sohbet (Yerel)](../../../examples/azure-openai-chat)**, Azure OpenAI Sohbet Uygulaması, AI Belge İşleme, ML Pipeline, **Perakende Çoklu Ajan Çözümü**
- **Çoklu Ajan Sistemleri**: **Perakende Çoklu Ajan Çözümü**
- **OpenAI Entegrasyonu**: **[Azure OpenAI Sohbet (Yerel)](../../../examples/azure-openai-chat)**, Perakende Çoklu Ajan Çözümü
- **Kurumsal Üretim**: [Mikroservisler (Yerel)](../../../examples/container-app/microservices), **Perakende Çoklu Ajan Çözümü**

### Mimari Desene Göre
- **Basit REST API**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statik + Sunucusuz**: React SPA + Functions, Python Functions + SPA
- **Mikroservisler**: [Üretim Mikroservisleri (Yerel)](../../../examples/container-app/microservices), Java Spring Boot Mikroservisler
- **Konteynerleştirilmiş**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Mikroservisler (Yerel)](../../../examples/container-app/microservices)
- **AI Destekli**: **[Azure OpenAI Sohbet (Yerel)](../../../examples/azure-openai-chat)**, Azure OpenAI Sohbet Uygulaması, AI Belge İşleme, ML Pipeline, **Perakende Çoklu Ajan Çözümü**
- **Çoklu Ajan Mimari**: **Perakende Çoklu Ajan Çözümü**
- **Kurumsal Çok Hizmetli**: [Mikroservisler (Yerel)](../../../examples/container-app/microservices), **Perakende Çoklu Ajan Çözümü**

### Zorluk Seviyesine Göre
- **Başlangıç**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Orta**: **[Azure OpenAI Sohbet (Yerel)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservisler, Azure OpenAI Sohbet Uygulaması, AI Belge İşleme
- **Gelişmiş**: ML Pipeline
- **Kurumsal Üretime Hazır**: [Mikroservisler (Yerel)](../../../examples/container-app/microservices) (Mesaj sıralama ile çok hizmetli), **Perakende Çoklu Ajan Çözümü** (ARM şablonuyla tam çoklu ajan sistemi)

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
- [C# API ile React Web Uygulaması](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Görevi](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ile Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### En İyi Uygulamalar
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Örnek Katkıları

Paylaşacak faydalı bir örneğiniz mi var? Katkılarınızı memnuniyetle karşılıyoruz!

### Gönderim Kuralları
1. Belirlenmiş dizin yapısına uyun
2. Kapsamlı bir README.md dosyası ekleyin
3. Yapılandırma dosyalarına yorumlar ekleyin
4. Göndermeden önce kapsamlı bir şekilde test edin
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

**İpucu**: Teknoloji yığınıza uygun en basit örnekle başlayın, ardından daha karmaşık senaryolara doğru ilerleyin. Her örnek, önceki örneklerden gelen kavramları temel alır!

## 🚀 Başlamaya Hazır mısınız?

### Öğrenme Yolunuz

1. **Tamamen Yeni Başlayan?** → [Flask API](../../../examples/container-app/simple-flask-api) ile başlayın (⭐, 20 dakika)
2. **Temel AZD Bilginiz Var mı?** → [Mikroservisler](../../../examples/container-app/microservices) deneyin (⭐⭐⭐⭐, 60 dakika)
3. **AI Uygulamaları mı Geliştiriyorsunuz?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) ile başlayın (⭐⭐, 35 dakika) veya [Perakende Çoklu Ajan](retail-scenario.md) keşfedin (⭐⭐⭐⭐, 2+ saat)
4. **Belirli Bir Teknoloji Yığını mı Lazım?** → [Doğru Örneği Bulma](../../../examples) bölümünü kullanın

### Sonraki Adımlar

- ✅ [Ön Koşulları](../../../examples) gözden geçirin
- ✅ Becerilerinize uygun bir örnek seçin ([Karmaşıklık Derecesi Efsanesi](../../../examples) bölümüne bakın)
- ✅ Örneğin README dosyasını dağıtmadan önce dikkatlice okuyun
- ✅ Testten sonra `azd down` çalıştırmak için bir hatırlatıcı ayarlayın
- ✅ Deneyiminizi GitHub Issues veya Discussions üzerinden paylaşın

### Yardıma mı İhtiyacınız Var?

- 📖 [SSS](../resources/faq.md) - Sıkça Sorulan Sorular
- 🐛 [Sorun Giderme Kılavuzu](../docs/troubleshooting/common-issues.md) - Dağıtım sorunlarını çözün
- 💬 [GitHub Tartışmaları](https://github.com/microsoft/AZD-for-beginners/discussions) - Topluluğa sorun
- 📚 [Çalışma Kılavuzu](../resources/study-guide.md) - Öğreniminizi pekiştirin

---

**Navigasyon**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Çalışma Materyalleri**: [Çalışma Kılavuzu](../resources/study-guide.md) | [Kopya Kağıdı](../resources/cheat-sheet.md) | [Sözlük](../resources/glossary.md)
- **🔧 Kaynaklar**: [SSS](../resources/faq.md) | [Sorun Giderme](../docs/troubleshooting/common-issues.md)

---

*Son Güncelleme: Kasım 2025 | [Sorun Bildir](https://github.com/microsoft/AZD-for-beginners/issues) | [Örnek Katkıda Bulun](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
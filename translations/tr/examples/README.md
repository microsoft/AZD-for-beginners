# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples organized by learning complexity
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links to Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> This repository contains **4 complete local examples** with full implementations:  
> - **Azure OpenAI Chat** (GPT-4 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Additional examples are **external references** to Azure-Samples repositories that you can clone.

## Introduction

This directory provides practical examples and references to help you learn Azure Developer CLI through hands-on practice. The Retail Multi-Agent scenario is a complete, production-ready implementation included in this repository. Additional examples reference official Azure Samples that demonstrate various AZD patterns.

### Complexity Rating Legend

- ⭐ **Beginner** - Basic concepts, single service, 15-30 minutes
- ⭐⭐ **Intermediate** - Multiple services, database integration, 30-60 minutes
- ⭐⭐⭐ **Advanced** - Complex architecture, AI integration, 1-2 hours
- ⭐⭐⭐⭐ **Expert** - Production-ready, enterprise patterns, 2+ hours

## 🎯 What's Actually in This Repository

### ✅ Local Implementation (Ready to Use)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Complete GPT-4 deployment with chat interface included in this repo**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **What's Included:**
  - Complete Azure OpenAI deployment (GPT-4)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

**Quick Start:**
```bash
# Örneğe gidin
cd examples/azure-openai-chat

# Her şeyi dağıtın
azd up

# Bağımlılıkları yükleyin ve sohbete başlayın
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Comprehensive container deployment examples included in this repo**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Beginner to Advanced)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Complete overview of container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basic REST API example
  - [Microservices Architecture](../../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Quick Start:**
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

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Complete production-ready implementation included in this repo**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Advanced)
- **What's Included:**
  - Complete ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Azure OpenAI integration
  - AI Search with RAG
  - Comprehensive monitoring
  - One-click deployment script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

The following examples are maintained in official Azure-Samples repositories. Clone them to explore different AZD patterns:

### Simple Applications (Chapters 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# Herhangi bir örneği klonla
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Dağıt
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Advanced Patterns (Chapters 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

By working through these examples, you will:
- Practice Azure Developer CLI workflows with realistic application scenarios
- Understand different application architectures and their azd implementations
- Master Infrastructure as Code patterns for various Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns in practical contexts
- Build experience with troubleshooting and debugging real deployment scenarios

## Learning Outcomes

Upon completing these examples, you will be able to:
- Deploy various application types using Azure Developer CLI confidently
- Adapt provided templates to your own application requirements
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications with proper dependencies
- Apply security, monitoring, and performance best practices in real scenarios
- Troubleshoot and optimize deployments based on practical experience

## Directory Structure

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

## Quick Start Examples

> **💡 New to AZD?** Start with example #1 (Flask API) - it takes ~20 minutes and teaches core concepts.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Deploy a simple REST API with scale-to-zero  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You'll Learn:** Basic azd workflow, containerization, health probes  
   **Expected Outcome:** Working API endpoint returning "Hello, World!" with monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy a Node.js Express web application with MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You'll Learn:** Database integration, environment variables, connection strings  
   **Expected Outcome:** Todo list app with create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host a React static website with Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You'll Learn:** Static hosting, serverless functions, CDN deployment  
   **Expected Outcome:** React UI with API backend, automatic SSL, global CDN

### For Intermediate Users
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy GPT-4 with chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You'll Learn:** Azure OpenAI deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application with GPT-4 and cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Production-ready multi-service architecture  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You'll Learn:** Service communication, message queuing, distributed tracing  
   **Expected Outcome:** 2-service system (API Gateway + Product Service) with monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application with C# API and Azure SQL Database  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You'll Learn:** Entity Framework, database migrations, connection security  
   **Expected Outcome:** C# API with Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions with HTTP triggers and Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You'll Learn:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Expected Outcome:** Function app responding to HTTP requests with Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application with Container Apps and API gateway  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You'll Learn:** Spring Boot deployment, service mesh, load balancing  
   **Expected Outcome:** Multi-service Java system with service discovery and routing

### Microsoft Foundry Templates

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete GPT-4 deployment with chat interface  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Working chat application with token tracking and cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application with RAG architecture  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-powered chat interface with document search and citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Document analysis using Azure AI services  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API extracting text, tables, and entities from uploaded documents

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow with Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Automated ML pipeline with training, deployment, and monitoring

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

A comprehensive, production-ready multi-agent customer support solution that demonstrates enterprise-grade AI application deployment with AZD. This scenario provides:

- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **Üretim Altyapısı**: Çok bölgeli Azure OpenAI dağıtımları, Azure AI Search, Container Apps ve kapsamlı izleme
- **Dağıtıma Hazır ARM Şablonu**: Çoklu yapılandırma modlarıyla tek tıklamayla dağıtım (Minimal/Standard/Premium)
- **Gelişmiş Özellikler**: Red teaming güvenlik doğrulaması, ajan değerlendirme çerçevesi, maliyet optimizasyonu ve hata giderme rehberleri
- **Gerçek İş Bağlamı**: Perakendeci müşteri destek kullanım senaryosu; dosya yüklemeleri, arama entegrasyonu ve dinamik ölçeklendirme

**Teknolojiler**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Karmaşıklık**: ⭐⭐⭐⭐ (Gelişmiş - Kurumsal Üretim Hazır)

**En Uygun**: AI geliştiricileri, çözüm mimarları ve üretim çok-ajanlı sistemler kuran ekipler

**Hızlı Başlangıç**: Dahil edilen ARM şablonu ile komple çözümü 30 dakika içinde `./deploy.sh -g myResourceGroup` komutunu kullanarak dağıtın

## 📋 Kullanım Talimatları

### Önkoşullar

Herhangi bir örneği çalıştırmadan önce:
- ✅ Owner veya Contributor erişimine sahip Azure aboneliği
- ✅ Azure Developer CLI yüklü ([Kurulum Kılavuzu](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop çalışıyor (kapsayıcı örnekleri için)
- ✅ Uygun Azure kotaları (örneğe özel gereksinimleri kontrol edin)

> **💰 Maliyet Uyarısı:** Tüm örnekler ücretlendirmeye neden olan gerçek Azure kaynakları oluşturur. Maliyet tahminleri için ilgili README dosyalarına bakın. Süregelen ücretlerden kaçınmak için işlemi bitirdiğinizde `azd down` komutunu çalıştırmayı unutmayın.

### Örnekleri Yerel Olarak Çalıştırma

1. **Örneği Klonla veya Kopyala**
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
   # Altyapıyı ve uygulamayı dağıt.
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
   - ✅ Azure Portal shows "Running" status
   - ✅ Application Insights telemetri alıyor

> **⚠️ Sorun mu var?** Dağıtım hata giderme için [Yaygın Sorunlar](../docs/chapter-07-troubleshooting/common-issues.md) bölümüne bakın

### Örnekleri Uyarlama

Her örnek şunları içerir:
- **README.md** - Ayrıntılı kurulum ve özelleştirme talimatları
- **azure.yaml** - Yorumlarla AZD yapılandırması
- **infra/** - Parametre açıklamaları ile Bicep şablonları
- **src/** - Örnek uygulama kodu
- **scripts/** - Yaygın görevler için yardımcı betikler

## 🎯 Öğrenme Hedefleri

### Örnek Kategorileri

#### **Temel Dağıtımlar**
- Tek hizmetli uygulamalar
- Basit altyapı desenleri
- Temel yapılandırma yönetimi
- Maliyet-etkin geliştirme ortamları

#### **Gelişmiş Senaryolar**
- Çok hizmetli mimariler
- Karmaşık ağ yapılandırmaları
- Veritabanı entegrasyon desenleri
- Güvenlik ve uyumluluk uygulamaları

#### **Üretime Hazır Desenler**
- Yüksek erişilebilirlik yapılandırmaları
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

### Container App - Python Flask
**Teknolojiler**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Karmaşıklık**: Başlangıç  
**Kavramlar**: Konteynerleştirme, REST API, sıfıra ölçekleme (scale-to-zero), sağlık kontrolleri, izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/simple-flask-api)

### Container App - Mikroservis Mimarisi
**Teknolojiler**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Karmaşıklık**: Gelişmiş  
**Kavramlar**: Çok hizmetli mimari, servis iletişimi, mesaj kuyruğlama, dağıtık izleme  
**Konum**: [Yerel Örnek](../../../examples/container-app/microservices)

### Veritabanı Uygulaması - C# ile Azure SQL
**Teknolojiler**: C# ASP.NET Core, Azure SQL Database, App Service  
**Karmaşıklık**: Orta  
**Kavramlar**: Entity Framework, veritabanı bağlantıları, web API geliştirme

### Sunucusuz Fonksiyon - Python Azure Functions
**Teknolojiler**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Karmaşıklık**: Orta  
**Kavramlar**: Olay güdümlü mimari, sunucusuz bilişim, tam yığın geliştirme

### Mikroservisler - Java Spring Boot
**Teknolojiler**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Karmaşıklık**: Orta  
**Kavramlar**: Mikroservis iletişimi, dağıtık sistemler, kurumsal desenler

### Microsoft Foundry Örnekleri

#### Azure OpenAI Sohbet Uygulaması
**Teknolojiler**: Azure OpenAI, Cognitive Search, App Service  
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

The `configurations/` dizini yeniden kullanılabilir bileşenler içerir:

### Ortam Yapılandırmaları
- Geliştirme ortamı ayarları
- Sahneleme ortamı yapılandırmaları
- Üretime hazır yapılandırmalar
- Çok bölge dağıtım kurulumları

### Bicep Modülleri
- Yeniden kullanılabilir altyapı bileşenleri
- Yaygın kaynak desenleri
- Güvenlik güçlendirilmiş şablonlar
- Maliyet optimize edilmiş yapılandırmalar

### Yardımcı Betikler
- Ortam kurulum otomasyonu
- Veritabanı geçiş betikleri
- Dağıtım doğrulama araçları
- Maliyet izleme araçları

## 🔧 Özelleştirme Kılavuzu

### Örnekleri Kendi Kullanım Durumunuza Uyarlama

1. **Önkoşulları Gözden Geçirin**
   - Azure servis gereksinimlerini kontrol edin
   - Abonelik limitlerini doğrulayın
   - Maliyet etkilerini anlayın

2. **Yapılandırmayı Değiştirin**
   - `azure.yaml` servis tanımlarını güncelleyin
   - Bicep şablonlarını özelleştirin
   - Ortam değişkenlerini ayarlayın

3. **Kapsamlı Test Yapın**
   - Önce geliştirme ortamına dağıtın
   - İşlevselliği doğrulayın
   - Ölçeklenebilirlik ve performansı test edin

4. **Güvenlik İncelemesi**
   - Erişim kontrollerini gözden geçirin
   - Gizli yönetimini uygulayın
   - İzleme ve uyarıları etkinleştirin

## 📊 Karşılaştırma Matrisi

| Örnek | Servisler | Veritabanı | Kimlik Doğrulama | İzleme | Karmaşıklık |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Yerel) | 2 | ❌ | Key Vault | Tam | ⭐⭐ |
| **Python Flask API** (Yerel) | 1 | ❌ | Temel | Tam | ⭐ |
| **Microservices** (Yerel) | 5+ | ✅ | Kurumsal | Gelişmiş | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Temel | Temel | ⭐ |
| React SPA + Functions | 3 | ✅ | Temel | Tam | ⭐ |
| Python Flask Container | 2 | ❌ | Temel | Tam | ⭐ |
| C# Web API + SQL | 2 | ✅ | Tam | Tam | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Tam | Tam | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Tam | Tam | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Tam | Tam | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Temel | Tam | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Tam | Tam | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Yerel) | **8+** | **✅** | **Kurumsal** | **Gelişmiş** | **⭐⭐⭐⭐** |

## 🎓 Öğrenme Yolu

### Önerilen İlerleme

1. **Basit Web Uygulaması ile Başlayın**
   - Temel AZD kavramlarını öğrenin
   - Dağıtım iş akışını anlayın
   - Ortam yönetimini uygulayın

2. **Statik Web Sitesini Deneyin**
   - Farklı barındırma seçeneklerini keşfedin
   - CDN entegrasyonunu öğrenin
   - DNS yapılandırmasını anlayın

3. **Container App'e Geçin**
   - Konteynerleştirme temellerini öğrenin
   - Ölçeklendirme kavramlarını anlayın
   - Docker ile uygulama yapın

4. **Veritabanı Entegrasyonu Ekleyin**
   - Veritabanı sağlama işlemlerini öğrenin
   - Bağlantı dizesini anlayın
   - Gizli yönetimini uygulayın

5. **Sunucusuzu Keşfedin**
   - Olay güdümlü mimariyi anlayın
   - Tetikleyiciler ve bağlamalar hakkında bilgi edinin
   - API'lerle uygulama yapın

6. **Mikroservisler Oluşturun**
   - Servis iletişimini öğrenin
   - Dağıtık sistemleri anlayın
   - Karmaşık dağıtımlarla pratik yapın

## 🔍 Doğru Örneği Bulma

### Teknoloji Yığınına Göre
- **Container Apps**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo Uygulaması, [Microservices API Gateway (Yerel)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Yerel)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Yerel)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Yerel)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikroservisleri
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices), Java Microservices
- **Veritabanları**: [Microservices (Yerel)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Yerel)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Çok Ajanlı Sistemler**: **Retail Multi-Agent Solution**
- **OpenAI Entegrasyonu**: **[Azure OpenAI Chat (Yerel)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Kurumsal Üretim**: [Microservices (Yerel)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Mimari Desene Göre
- **Basit REST API**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statik + Sunucusuz**: React SPA + Functions, Python Functions + SPA
- **Mikroservisler**: [Production Microservices (Yerel)](../../../examples/container-app/microservices), Java Spring Boot Mikroservisleri
- **Konteynerleştirilmiş**: [Python Flask (Yerel)](../../../examples/container-app/simple-flask-api), [Microservices (Yerel)](../../../examples/container-app/microservices), Java Microservices
- **AI Destekli**: **[Azure OpenAI Chat (Yerel)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Çok Ajanlı Mimari**: **Retail Multi-Agent Solution**
- **Kurumsal Çok Hizmetli**: [Microservices (Yerel)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Karmaşıklık Düzeyine Göre
- **Başlangıç**: [Python Flask API (Yerel)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Orta**: **[Azure OpenAI Chat (Yerel)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Gelişmiş**: ML Pipeline
- **Kurumsal Üretime Hazır**: [Microservices (Yerel)](../../../examples/container-app/microservices) (Mesaj kuyruğu ile çok hizmetli), **Retail Multi-Agent Solution** (ARM şablonu dağıtımı ile eksiksiz çok-ajanlı sistem)

## 📚 Ek Kaynaklar

### Dokümantasyon Bağlantıları
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Şablonları](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokümantasyonu](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)

### Topluluk Örnekleri
- [Azure Samples AZD Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Şablonları](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galerisi](https://azure.github.io/awesome-azd/)
- [C# ve Azure SQL ile Todo Uygulaması](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python ve MongoDB ile Todo Uygulaması](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js ve PostgreSQL ile Todo Uygulaması](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ile React Web Uygulaması](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Görevi](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ile Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### En İyi Uygulamalar
- [Azure Well-Architected Çerçevesi](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Bulut Benimseme Çerçevesi](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Örnek Katkıları

Faydalı bir örnek paylaşmak ister misiniz? Katkılarınızı memnuniyetle karşılıyoruz!

### Gönderim Yönergeleri
1. Belirlenmiş dizin yapısına uyun
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

**İpucu**: Teknoloji yığınıınıza uyan en basit örnekle başlayın, ardından kademeli olarak daha karmaşık senaryolara ilerleyin. Her örnek bir öncekinin kavramları üzerine inşa edilir!

## 🚀 Başlamaya Hazır mısınız?

### Öğrenme Yolunuz

1. **Tamamen Yeni Başlayan?** → [Flask API](../../../examples/container-app/simple-flask-api) ile başlayın (⭐, 20 dakika)
2. **AZD hakkında temel bilginiz mi var?** → [Microservices](../../../examples/container-app/microservices) deneyin (⭐⭐⭐⭐, 60 dakika)
3. **AI Uygulamaları mı Geliştiriyorsunuz?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) ile başlayın (⭐⭐, 35 dakika) veya [Retail Multi-Agent](retail-scenario.md) bölümünü keşfedin (⭐⭐⭐⭐, 2+ saat)
4. **Belirli Bir Teknoloji Yığınına mı İhtiyacınız Var?** → Yukarıdaki [Doğru Örneği Bulma](../../../examples) bölümünü kullanın

### Sonraki Adımlar

- ✅ Yukarıdaki [Önkoşullar](../../../examples) bölümünü gözden geçirin
- ✅ Yetenek seviyenize uygun bir örnek seçin (bkz. [Karmaşıklık Gösterge Anahtarı](../../../examples))
- ✅ Dağıtmadan önce örneğin README dosyasını dikkatle okuyun
- ✅ Testten sonra `azd down` komutunu çalıştırmayı hatırlatacak bir hatırlatıcı ayarlayın
- ✅ Deneyiminizi GitHub Issues veya Discussions üzerinden paylaşın

### Yardıma mı ihtiyacınız var?

- 📖 [SSS](../resources/faq.md) - Sık sorulan sorulara yanıtlar
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
Bu belge, AI çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu oluşabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
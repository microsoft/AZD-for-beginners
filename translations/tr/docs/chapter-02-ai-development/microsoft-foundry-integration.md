# Microsoft Foundry Entegrasyonu AZD ile

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfa**: [Başlangıç Seviyesi AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)

## Genel Bakış

Bu kılavuz, Microsoft Foundry servislerinin Azure Developer CLI (AZD) ile entegrasyonunu göstererek AI uygulamalarının daha kolay dağıtımını sağlar. Microsoft Foundry, AI uygulamalarının oluşturulması, dağıtımı ve yönetimi için kapsamlı bir platform sunarken AZD, altyapı ve dağıtım sürecini basitleştirir.

## Microsoft Foundry Nedir?

Microsoft Foundry, Microsoft’un yapay zeka geliştirme için birleşik platformudur ve şunları içerir:

- **Model Kataloğu**: En son teknoloji AI modellere erişim
- **Prompt Flow**: AI iş akışları için görsel tasarım aracı
- **Microsoft Foundry Portalı**: AI uygulamaları için entegre geliştirme ortamı
- **Dağıtım Seçenekleri**: Çoklu barındırma ve ölçeklendirme seçenekleri
- **Güvenlik ve Emniyet**: Yerleşik sorumlu AI özellikleri

## AZD + Microsoft Foundry: Birlikte Daha İyi

| Özellik | Microsoft Foundry | AZD Entegrasyon Avantajı |
|---------|-----------------|------------------------|
| **Model Dağıtımı** | Manuel portal dağıtımı | Otomatik, tekrarlanabilir dağıtımlar |
| **Altyapı** | Tıklamalı sağlama | Kod olarak Altyapı (Bicep) |
| **Ortam Yönetimi** | Tek ortam odaklı | Çoklu ortam (geliştirme/test/üretim) |
| **CI/CD Entegrasyonu** | Sınırlı destek | Yerel GitHub Actions desteği |
| **Maliyet Yönetimi** | Temel izleme | Ortama özel maliyet optimizasyonu |

## Önkoşullar

- Uygun izinlere sahip Azure aboneliği
- Azure Developer CLI yüklü
- Microsoft Foundry Modelleri servislerine erişim
- Microsoft Foundry hakkında temel bilgi

> **Mevcut AZD sürümü:** Bu örnekler `azd` `1.27.1` sürümüne göre incelenmiştir. AI ajan iş akışı için mevcut önizleme eklentisini kullanın ve başlamadan önce yüklü sürümünüzü kontrol edin.

## Temel Entegrasyon Desenleri

### Desen 1: Microsoft Foundry Modelleri Entegrasyonu

**Kullanım Durumu**: Microsoft Foundry Modelleri ile sohbet uygulamaları dağıtımı

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Altyapı (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Desen 2: AI Arama + RAG Entegrasyonu

**Kullanım Durumu**: Retrieval-Augmented Generation (RAG) uygulamaları dağıtımı

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Desen 3: Doküman Zekası Entegrasyonu

**Kullanım Durumu**: Doküman işleme ve analiz iş akışları

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Konfigürasyon Desenleri

### Ortam Değişkenleri Kurulumu

**Üretim Konfigürasyonu:**
```bash
# Temel yapay zeka hizmetleri
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model yapılandırmaları
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performans ayarları
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Geliştirme Konfigürasyonu:**
```bash
# Geliştirme için maliyet açısından optimize edilmiş ayarlar
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ücretsiz katman
```

### Key Vault ile Güvenli Konfigürasyon

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Dağıtım İş Akışları

### Foundry için AZD Uzantıları

AZD, Microsoft Foundry servisleri ile çalışmak için AI’ye özgü özellikler ekleyen uzantılar sağlar:

```bash
# Foundry ajanları eklentisini yükleyin
azd extension install azure.ai.agents

# İnce ayar eklentisini yükleyin
azd extension install azure.ai.finetune

# Özel modeller eklentisini yükleyin
azd extension install azure.ai.models

# Yüklü eklentileri listele
azd extension list --installed

# Mevcut yüklü ajan eklenti sürümünü incele
azd extension show azure.ai.agents
```

AI uzantıları hâlen önizlemede hızlı gelişmektedir. Bir komut burada gösterilenden farklı davranıyorsa, projeyi sorun çıkarmadan önce ilgili uzantıyı güncelleyin.

### `azd ai` ile Ajan-Öncelikli Dağıtım

Bir ajan manifestiniz varsa, Foundry Agent Servisine bağlı bir proje iskeleti oluşturmak için `azd ai agent init` komutunu kullanın:

```bash
# Bir ajan manifestosundan başlat
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure'a dağıt
azd up
```

`azure.ai.agents`’in yakın tarihli önizleme sürümleri, `azd ai agent init` için şablon tabanlı başlatma desteği ekledi. Daha yeni ajan örneklerini takip ediyorsanız, yüklü sürümünüzdeki mevcut bayrakları eklenti yardımında kontrol edin.

Tam komut referansı ve bayraklar için [AZD AI CLI Komutları](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) bölümüne bakın.

### Tek Komutla Dağıtım

```bash
# Her şeyi tek bir komutla dağıt
azd up

# Veya kademeli olarak dağıt
azd provision  # Sadece altyapı
azd deploy     # Sadece uygulama

# azd 1.23.11+ sürümünde uzun süre çalışan AI uygulama dağıtımları için
azd deploy --timeout 1800
```

### Ortama Özel Dağıtımlar

```bash
# Geliştirme ortamı
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Üretim ortamı
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## İzleme ve Gözlemlenebilirlik

### Application Insights Entegrasyonu

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Maliyet İzleme

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Güvenlik En İyi Uygulamaları

### Yönetilen Kimlik Konfigürasyonu

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Ağ Güvenliği

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## Performans Optimizasyonu

### Önbellekleme Stratejileri

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Otomatik Ölçeklendirme Konfigürasyonu

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Yaygın Sorun Giderme

### Sorun 1: OpenAI Kota Aşımı

**Belirtiler:**
- Dağıtım kota hataları ile başarısız oluyor
- Uygulama günlüklerinde 429 hataları

**Çözümler:**
```bash
# Mevcut kota kullanımını kontrol et
az cognitiveservices usage list --location eastus

# Farklı bölgeyi dene
azd env set AZURE_LOCATION westus2
azd up

# Kapasiteyi geçici olarak azalt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Sorun 2: Kimlik Doğrulama Hataları

**Belirtiler:**
- AI servislerini çağırırken 401/403 hataları
- "Erişim reddedildi" mesajları

**Çözümler:**
```bash
# Rol atamalarını doğrula
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Yönetilen kimlik yapılandırmasını kontrol et
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Anahtar Kasası erişimini doğrula
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Sorun 3: Model Dağıtım Sorunları

**Belirtiler:**
- Modeller dağıtımda mevcut değil
- Belirli model sürümleri başarısız oluyor

**Çözümler:**
```bash
# Bölgeye göre kullanılabilir modelleri listele
az cognitiveservices model list --location eastus

# Bicep şablonunda model sürümünü güncelle
# Model kapasite gereksinimlerini kontrol et
```

## Örnek Şablonlar

### RAG Sohbet Uygulaması (Python)

**Depo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servisler**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Açıklama**: En popüler Azure AI örneği — kendi dokümanlarınız üzerinde soru sormanızı sağlayan üretim hazır RAG sohbet uygulaması. Sohbet için GPT-4.1-mini, gömme için text-embedding-3-large ve alma işlemi için Azure AI Search kullanır. Çok modlu dokümanlar, ses giriş/çıkışı, Microsoft Entra kimlik doğrulaması ve Application Insights izleme desteklenir.

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Sohbet Uygulaması (.NET)

**Depo**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servisler**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Açıklama**: Python RAG sohbet örneğinin .NET/C# muadili. ASP.NET Core Minimal API ve Blazor WebAssembly ön yüzü ile oluşturulmuştur. Sesli sohbet, GPT-4o-mini görsel desteği ve .NET MAUI Blazor Hibrit masaüstü/mobil istemcisi içerir.

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Sohbet Uygulaması (Java)

**Depo**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servisler**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Açıklama**: Langchain4J kullanarak AI orkestrasyonlu Java versiyonu RAG sohbet örneği. Mikroservis olay odaklı mimari, çoklu arama stratejileri (metin, vektör, hibrit), Azure Document Intelligence ile doküman yükleme ve Azure Container Apps ya da Azure Kubernetes Service üzerinde dağıtım destekler.

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry ile Kurumsal Perakende Yardımcısı

**Depo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servisler**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Açıklama**: Microsoft Foundry ve Prompty kullanan uçtan uca perakende RAG yardımcı uygulaması. Contoso Outdoor perakendeci sohbet botu, yanıtları ürün kataloğu ve müşteri sipariş verileriyle destekler. Tam GenAIOps iş akışını gösterir — Prompty ile prototip, AI destekli değerlendiricilerle değerlendirme ve AZD ile Container Apps dağıtımı.

**Hızlı Başlangıç**:
```bash
azd init --template contoso-chat
azd up
```

### Yaratıcı Yazarlık Çok Ajanlı Uygulama

**Depo**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servisler**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Açıklama**: Prompty ile AI ajan orkestrasyonunu gösteren çok ajanlı örnek. Araştırma ajanı (Azure AI Agent Service’de Bing Grounding), ürün ajanı (Azure AI Search), yazar ajanı ve editör ajanı kullanarak işbirliği içinde iyi araştırılmış makaleler üretir. GitHub Actions ile CI/CD ve değerlendirme içerir.

**Hızlı Başlangıç**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Sunucusuz RAG Sohbet (JavaScript/TypeScript)

**Depo**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servisler**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Açıklama**: LangChain.js kullanılarak tamamen sunucusuz RAG sohbet botu. API için Azure Functions ve barındırma için Azure Static Web Apps kullanır. Vektör deposu ve sohbet geçmişi veritabanı olarak Azure Cosmos DB kullanır. Sıfır maliyetli test için Ollama ile yerel geliştirme desteklenir.

**Hızlı Başlangıç**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Verilerinizle Sohbet Çözüm Hızlandırıcısı

**Depo**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servisler**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Açıklama**: Kurumsal düzeyde RAG çözüm hızlandırıcısı; belge yükleme/yönetim için yönetici portalı, çoklu orkestratör seçenekleri (Semantic Kernel, LangChain, Prompt Flow), sesli yazıya çeviri, Microsoft Teams entegrasyonu ve PostgreSQL veya Cosmos DB arka uç seçeneği sunar. Üretim RAG senaryoları için özelleştirilebilir başlangıç noktası olarak tasarlanmıştır.

**Hızlı Başlangıç**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Seyahat Ajanları — Çok Ajanlı MCP Orkestrasyonu

**Depo**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servisler**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Sunucuları (.NET, Python, Java, TypeScript)

**Açıklama**: Üç çerçeve (LangChain.js, LlamaIndex.TS ve Microsoft Agent Framework) kullanan çok ajanlı AI orkestrasyonu referans uygulaması. Dört dilde MCP (Model Context Protocol) sunucuları, sunucusuz Azure Container Apps olarak dağıtılmış OpenTelemetry izleme ile.

**Hızlı Başlangıç**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Başlangıç

**Depo**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servisler**: Azure AI Servisleri + Azure OpenAI

**Açıklama**: Konfigüre edilmiş makine öğrenimi modelleri ile Azure AI servislerini dağıtan minimal Bicep şablonu. Tam bir uygulama yığını olmadan sadece Azure AI altyapısının sağlanması gereken durumlar için hafif bir başlangıç noktası.

**Hızlı Başlangıç**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Daha fazla şablona göz atın**: Dil ve senaryolara göre 80+ AI’ye özgü AZD şablonları için [Harika AZD AI Şablon Galerisi](https://azure.github.io/awesome-azd/?tags=ai) ziyaret edin.

## Sonraki Adımlar

1. **Örnekleri Deneyin**: Kullanım durumunuza uygun önceden hazırlanmış bir şablonla başlayın
2. **İhtiyaçlarınıza Göre Özelleştirin**: Altyapı ve uygulama kodunu değiştirin
3. **İzleme Ekleyin**: Kapsamlı gözlemlenebilirlik uygulayın
4. **Maliyetleri Optimize Edin**: Bütçenize göre yapılandırmaları ince ayar yapın
5. **Dağıtımınızı Güvenceye Alın**: Kurumsal güvenlik desenlerini uygulayın
6. **Üretime Ölçeklendirin**: Çok bölgeli ve yüksek erişilebilirlik özellikleri ekleyin

## 🎯 Uygulamalı Alıştırmalar

### Alıştırma 1: Microsoft Foundry Modelleri Sohbet Uygulaması Dağıtımı (30 dakika)
**Amaç**: Üretim hazır bir AI sohbet uygulaması dağıtıp test etmek

```bash
# Şablonu başlat
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ortam değişkenlerini ayarla
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Yayınla
azd up

# Uygulamayı test et
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Yapay zeka operasyonlarını izle
azd monitor

# Temizlik yap
azd down --force --purge
```

**Başarı Ölçütleri:**
- [ ] Dağıtım kota hatası olmadan tamamlanıyor
- [ ] Tarayıcıda sohbet arayüzüne erişebiliyor
- [ ] Soru sorup AI destekli yanıt alabiliyor
- [ ] Application Insights telemetri verilerini gösteriyor
- [ ] Kaynaklar başarıyla temizleniyor

**Tahmini Maliyet**: 30 dakikalık test için 5-10 $

### Alıştırma 2: Çoklu Model Dağıtımı Konfigürasyonu (45 dakika)
**Amaç**: Farklı konfigürasyonlarla birden fazla AI modeli dağıtmak

```bash
# Özel Bicep yapılandırması oluştur
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Dağıt ve doğrula
azd provision
azd show
```

**Başarı Ölçütleri:**
- [ ] Birden fazla model başarıyla dağıtıldı
- [ ] Farklı kapasiteler uygulandı
- [ ] Modeller API üzerinden erişilebilir
- [ ] Uygulamadan her iki modele de çağrı yapılabiliyor

### Alıştırma 3: Maliyet İzleme Uygulaması (20 dakika)
**Amaç**: Bütçe uyarıları ve maliyet takibi kurmak

```bash
# Bicep'e bütçe uyarısı ekleyin
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Bütçe uyarısını dağıtın
azd provision

# Mevcut maliyetleri kontrol edin
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Başarı Ölçütleri:**
- [ ] Azure’da bütçe uyarısı oluşturuldu
- [ ] E-posta bildirimleri yapılandırıldı
- [ ] Azure Portal’da maliyet verileri görüntülenebiliyor
- [ ] Bütçe eşik değerleri uygun şekilde ayarlandı

## 💡 Sıkça Sorulan Sorular

<details>
<summary><strong>Geliştirme sırasında Microsoft Foundry Modelleri maliyetlerini nasıl düşürürüm?</strong></summary>

1. **Ücretsiz Katmanı Kullanın**: Microsoft Foundry Modelleri ayda 50.000 token ücretsiz sunar
2. **Kapasiteyi Azaltın**: Geliştirme için kapasiteyi 30+ yerine 10 TPM olarak ayarlayın
3. **azd down Komutunu Kullanın**: Aktif geliştirme yapılmadığında kaynakları serbest bırakın
4. **Yanıtları Önbelleğe Alın**: Tekrarlanan sorgular için Redis önbelleği uygulayın
5. **Prompt Mühendisliği Kullanın**: Etkili istemlerle token kullanımını azaltın


```bash
# Geliştirme yapılandırması
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Modelleri ile OpenAI API arasındaki fark nedir?</strong></summary>

**Microsoft Foundry Modelleri**:
- Kurumsal güvenlik ve uyumluluk
- Özel ağ entegrasyonu
- SLA garantileri
- Yönetilen kimlik doğrulama
- Daha yüksek kota imkanı

**OpenAI API**:
- Yeni modellere daha hızlı erişim
- Daha basit kurulum
- Daha düşük giriş engeli
- Sadece genel internet

Prodüksiyon uygulamaları için, **Microsoft Foundry Modelleri önerilir**.
</details>

<details>
<summary><strong>Microsoft Foundry Modelleri kota aşıldı hatalarını nasıl yönetirim?</strong></summary>

```bash
# Mevcut kotayı kontrol et
az cognitiveservices usage list --location eastus2

# Farklı bölgeyi dene
azd env set AZURE_LOCATION westus2
azd up

# Kapasiteyi geçici olarak azalt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kota artışı talep et
# Azure Portal > Kotlar > Artış talebi bölümüne git
```
</details>

<details>
<summary><strong>Microsoft Foundry Modelleri ile kendi verilerimi kullanabilir miyim?</strong></summary>

Evet! RAG (Retrieval Augmented Generation) için **Azure AI Search** kullanın:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) şablonuna bakın.
</details>

<details>
<summary><strong>AI model uç noktalarını nasıl güvence altına alırım?</strong></summary>

**En İyi Uygulamalar**:
1. Yönetilen Kimlik kullanın (API anahtarı yok)
2. Özel Uç Noktaları etkinleştirin
3. Ağ güvenlik gruplarını yapılandırın
4. Hız sınırlaması uygulayın
5. Gizli bilgileri Azure Key Vault ile yönetin

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Topluluk ve Destek

- **Microsoft Foundry Discord**: [#Azure kanalı](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Sorunlar ve tartışmalar](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Resmi dokümantasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh'deki Microsoft Foundry yeteneği](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Editörünüzde Azure + Foundry agent yeteneklerini `npx skills add microsoft/github-copilot-for-azure` ile kurun

---

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfa**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** Topluluk tartışmalarımıza katılın veya depoda bir sorun açın. Azure AI + AZD topluluğu başarıya ulaşmanız için burada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
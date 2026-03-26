# Microsoft Foundry'ın AZD ile Entegrasyonu

**Chapter Navigation:**
- **📚 Kurs Anasayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

## Genel Bakış

Bu rehber, Microsoft Foundry hizmetlerini Azure Developer CLI (AZD) ile entegre ederek yapay zeka uygulamalarının konuşlandırılmasını nasıl kolaylaştırabileceğinizi gösterir. Microsoft Foundry, yapay zeka uygulamaları oluşturmak, dağıtmak ve yönetmek için kapsamlı bir platform sağlar; AZD ise altyapı ve dağıtım sürecini basitleştirir.

## Microsoft Foundry Nedir?

Microsoft Foundry, yapay zeka geliştirme için birleşik bir platformdur ve şunları içerir:

- **Model Catalog**: En yeni yapay zeka modellerine erişim
- **Prompt Flow**: Yapay zeka iş akışları için görsel tasarımcı
- **Microsoft Foundry Portal**: Yapay zeka uygulamaları için entegre geliştirme ortamı
- **Deployment Options**: Çoklu barındırma ve ölçeklendirme seçenekleri
- **Safety and Security**: Yerleşik sorumlu yapay zeka özellikleri

## AZD + Microsoft Foundry: Birlikte Daha İyi

| Özellik | Microsoft Foundry | AZD Entegrasyon Avantajı |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Otomatik, tekrarlanabilir dağıtımlar |
| **Infrastructure** | Click-through provisioning | Kod Olarak Altyapı (Bicep) |
| **Environment Management** | Single environment focus | Çoklu ortam (dev/staging/prod) |
| **CI/CD Integration** | Limited | Yerel GitHub Actions desteği |
| **Cost Management** | Basic monitoring | Ortama özel maliyet optimizasyonu |

## Önkoşullar

- Uygun izinlere sahip Azure aboneliği
- Azure Developer CLI yüklü
- Microsoft Foundry Models hizmetlerine erişim
- Microsoft Foundry hakkında temel bilgi

## Temel Entegrasyon Desenleri

### Desen 1: Microsoft Foundry Models Entegrasyonu

**Kullanım Durumu**: Microsoft Foundry Models modelleriyle sohbet uygulamaları dağıtma

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
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Desen 2: AI Search + RAG Entegrasyonu

**Kullanım Durumu**: Geri getirilmeye dayalı güçlendirilmiş üretim (RAG) uygulamaları dağıtma

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

### Desen 3: Belge Zekâsı Entegrasyonu

**Kullanım Durumu**: Belge işleme ve analiz iş akışları

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

## 🔧 Yapılandırma Desenleri

### Ortam Değişkenleri Kurulumu

**Üretim Yapılandırması:**
```bash
# Çekirdek Yapay Zeka hizmetleri
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model yapılandırmaları
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performans ayarları
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Geliştirme Yapılandırması:**
```bash
# Geliştirme için maliyet açısından optimize edilmiş ayarlar
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ücretsiz katman
```

### Key Vault ile Güvenli Yapılandırma

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

AZD, Microsoft Foundry hizmetleriyle çalışmak için AI'ya özgü yetenekler ekleyen uzantılar sağlar:

```bash
# Foundry ajanları uzantısını yükleyin
azd extension install azure.ai.agents

# İnce ayar uzantısını yükleyin
azd extension install azure.ai.finetune

# Özel modeller uzantısını yükleyin
azd extension install azure.ai.models

# Yüklü uzantıları listeleyin
azd extension list
```

### Ajan-Öncelikli Dağıtım `azd ai` ile

Bir ajan manifestonuz varsa, Foundry Agent Service'e bağlanmış bir proje iskeleti oluşturmak için `azd ai agent init` kullanın:

```bash
# Ajan manifestosundan başlat
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure'a dağıt
azd up
```

Tam komut referansı ve bayraklar için [AZD AI CLI Komutları](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) sayfasına bakın.

### Tek Komutla Dağıtım

```bash
# Her şeyi tek komutla dağıtın
azd up

# Ya da kademeli olarak dağıtın
azd provision  # Sadece altyapı
azd deploy     # Sadece uygulama
```

### Ortama Özgü Dağıtımlar

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

### Yönetilen Kimlik Yapılandırması

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

### Otomatik Ölçeklendirme Yapılandırması

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

## Yaygın Sorunların Giderilmesi

### Sorun 1: OpenAI Kota Aşıldı

**Belirtiler:**
- Dağıtım kota hatalarıyla başarısız oluyor
- Uygulama günlüklerinde 429 hataları

**Çözümler:**
```bash
# Mevcut kota kullanımını kontrol et
az cognitiveservices usage list --location eastus

# Farklı bir bölge dene
azd env set AZURE_LOCATION westus2
azd up

# Kapasiteyi geçici olarak azalt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Sorun 2: Kimlik Doğrulama Hataları

**Belirtiler:**
- AI hizmetlerine çağrı yaparken 401/403 hataları
- "Erişim reddedildi" iletileri

**Çözümler:**
```bash
# Rol atamalarını doğrulayın
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Yönetilen kimlik yapılandırmasını kontrol edin
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault erişimini doğrulayın
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Sorun 3: Model Dağıtım Sorunları

**Belirtiler:**
- Modeller dağıtımda mevcut değil
- Belirli model sürümleri başarısız oluyor

**Çözümler:**
```bash
# Bölgeye göre mevcut modelleri listele
az cognitiveservices model list --location eastus

# Bicep şablonunda model sürümünü güncelle
# Modelin kapasite gereksinimlerini kontrol et
```

## Örnek Şablonlar

### RAG Sohbet Uygulaması (Python)

**Depo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Hizmetler**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Açıklama**: En popüler Azure AI örneği — kendi belgeleriniz üzerinde soru sormanıza olanak tanıyan üretim hazır bir RAG sohbet uygulaması. Sohbet için GPT-4.1-mini, gömme (embeddings) için text-embedding-ada-002 ve geri getirme için Azure AI Search kullanır. Çok modlu belgeleri, ses giriş/çıkışını, Microsoft Entra kimlik doğrulamayı ve Application Insights izlemeyi destekler.

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Sohbet Uygulaması (.NET)

**Depo**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Hizmetler**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Açıklama**: Python RAG sohbet örneğinin .NET/C# eşdeğeri. ASP.NET Core Minimal API ve Blazor WebAssembly ön yüzü ile oluşturulmuştur. Sesli sohbet, GPT-4o-mini görsel desteği ve eşlik eden .NET MAUI Blazor Hibrit masaüstü/mobil istemciyi içerir.

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Sohbet Uygulaması (Java)

**Depo**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Hizmetler**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Açıklama**: AI orkestrasyonu için Langchain4J kullanan RAG sohbet örneğinin Java versiyonu. Mikro hizmet olaya dayalı mimariyi, birden çok arama stratejisini (metin, vektör, hibrit), Azure Document Intelligence ile belge yüklemeyi ve Azure Container Apps veya Azure Kubernetes Service üzerinde dağıtımı destekler.

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Azure AI Foundry ile Kurumsal Perakende Yardımcısı

**Depo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Hizmetler**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Açıklama**: Azure AI Foundry ve Prompty kullanan uçtan uca perakende RAG yardımcı uygulaması. Cevapları ürün kataloğu ve müşteri sipariş verilerine dayandıran Contoso Outdoor perakende sohbet botu. Tam GenAIOps iş akışını gösterir — Prompty ile prototip oluşturma, AI destekli değerlendiricilerle değerlendirme ve AZD ile Container Apps'e dağıtım.

**Hızlı Başlangıç**:
```bash
azd init --template contoso-chat
azd up
```

### Yaratıcı Yazarlık Çok Ajanlı Uygulama

**Depo**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Hizmetler**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Açıklama**: Prompty ile AI ajan orkestrasyonunu gösteren çok ajanlı örnek. İyi araştırılmış makaleler üretmek için bir araştırma ajanı (Azure AI Agent Service içinde Bing Grounding), bir ürün ajanı (Azure AI Search), bir yazar ajanı ve bir editör ajanı kullanır. GitHub Actions içinde değerlendirme ile CI/CD içerir.

**Hızlı Başlangıç**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Sunucusuz RAG Sohbet (JavaScript/TypeScript)

**Depo**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Hizmetler**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Açıklama**: Tamamen sunucusuz RAG sohbet botu; API için Azure Functions ve barındırma için Azure Static Web Apps kullanır. Azure Cosmos DB'yi hem vektör deposu hem de sohbet geçmişi veritabanı olarak kullanır. Sıfır maliyetli test için Ollama ile yerel geliştirmeyi destekler.

**Hızlı Başlangıç**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Verilerinizle Sohbet Çözüm Hızlandırıcısı

**Depo**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Hizmetler**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Açıklama**: Kurumsal düzeyde RAG çözüm hızlandırıcısı; belge yükleme/ yönetimi için yönetici portalı, birden çok orkestratör seçeneği (Semantic Kernel, LangChain, Prompt Flow), konuşmadan metne, Microsoft Teams entegrasyonu ve PostgreSQL veya Cosmos DB arka ucu seçeneği sunar. Üretim RAG senaryoları için özelleştirilebilir bir başlangıç noktası olarak tasarlanmıştır.

**Hızlı Başlangıç**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Seyahat Ajanları — Çok Ajanlı MCP Orkestrasyonu

**Depo**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Hizmetler**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Açıklama**: Üç çerçeve (LangChain.js, LlamaIndex.TS ve Microsoft Agent Framework) kullanarak çok ajanlı AI orkestrasyonu için referans uygulaması. Dört dilde MCP (Model Context Protocol) sunucularını, OpenTelemetry izleme ile sunucusuz Azure Container Apps olarak dağıtmayı içerir.

**Hızlı Başlangıç**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Başlangıç

**Depo**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Hizmetler**: Azure AI Services + Azure OpenAI

**Açıklama**: Yapılandırılmış makine öğrenimi modelleriyle Azure AI hizmetlerini dağıtan minimal bir Bicep şablonu. Tam bir uygulama yığını olmadan yalnızca Azure AI altyapısının sağlanması gerektiğinde hafif bir başlangıç noktasıdır.

**Hızlı Başlangıç**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Daha fazla şablona göz atın**: 80+'den fazla dil ve senaryo için AI'ya özel AZD şablonları görmek üzere [Awesome AZD AI Şablon Galerisi](https://azure.github.io/awesome-azd/?tags=ai) adresini ziyaret edin.

## Sonraki Adımlar

1. **Örnekleri Deneyin**: Kullanım durumunuza uygun önceden hazırlanmış bir şablonla başlayın
2. **İhtiyaçlarınıza Göre Özelleştirin**: Altyapı ve uygulama kodunu değiştirin
3. **İzleme Ekleyin**: Kapsamlı gözlemlenebilirlik uygulayın
4. **Maliyetleri Optimize Edin**: Bütçenize göre yapılandırmaları ince ayar yapın
5. **Dağıtımınızı Güvence Altına Alın**: Kurumsal güvenlik desenlerini uygulayın
6. **Üretime Ölçekleyin**: Çok bölgeli ve yüksek kullanılabilirlik özellikleri ekleyin

## 🎯 Uygulamalı Alıştırmalar

### Alıştırma 1: Microsoft Foundry Models Sohbet Uygulamasını Dağıtma (30 dakika)
**Amaç**: Üretim hazır bir AI sohbet uygulamasını dağıtmak ve test etmek

```bash
# Şablonu başlat
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ortam değişkenlerini ayarla
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Dağıt
azd up

# Uygulamayı test et
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Yapay zeka işlemlerini izle
azd monitor

# Temizle
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Dağıtım kota hatası olmadan tamamlanır
- [ ] Tarayıcıda sohbet arayüzüne erişilebilir
- [ ] Sorular sorulabilir ve AI destekli yanıtlar alınabilir
- [ ] Application Insights telemetri verilerini gösterir
- [ ] Kaynaklar başarıyla temizlendi

**Tahmini Maliyet**: 30 dakikalık test için $5-10

### Alıştırma 2: Çoklu Model Dağıtımını Yapılandırma (45 dakika)
**Amaç**: Farklı yapılandırmalara sahip birden çok AI modelini dağıtmak

```bash
# Özel Bicep yapılandırması oluşturun
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
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Dağıtın ve doğrulayın
azd provision
azd show
```

**Başarı Kriterleri:**
- [ ] Birden çok model başarıyla dağıtıldı
- [ ] Farklı kapasite ayarları uygulandı
- [ ] Modeller API üzerinden erişilebilir
- [ ] Uygulamadan her iki modele de çağrı yapılabilir

### Alıştırma 3: Maliyet İzleme Uygulama (20 dakika)
**Amaç**: Bütçe uyarıları ve maliyet takibi kurmak

```bash
# Bicep'e bütçe uyarısı ekle
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

# Bütçe uyarısını dağıt
azd provision

# Mevcut maliyetleri kontrol et
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Başarı Kriterleri:**
- [ ] Azure'da bütçe uyarısı oluşturuldu
- [ ] E-posta bildirimleri yapılandırıldı
- [ ] Azure Portal'da maliyet verileri görüntülenebilir
- [ ] Bütçe eşikleri uygun şekilde ayarlandı

## 💡 Sıkça Sorulan Sorular

<details>
<summary><strong>Geliştirme sırasında Microsoft Foundry Models maliyetlerini nasıl azaltırım?</strong></summary>

1. **Ücretsiz Katmanı Kullanın**: Microsoft Foundry Models aylık 50.000 token ücretsiz sunar
2. **Kapasiteyi Azaltın**: Geliştirme için kapasiteyi 30+ yerine 10 TPM olarak ayarlayın
3. **azd down kullanın**: Aktif geliştirme yapılmıyorsa kaynakları serbest bırakın
4. **Yanıtları Önbelleğe Alın**: Tekrarlanan sorgular için Redis önbelleği uygulayın
5. **Prompt Mühendisliğini Kullanın**: Etkili prompt'larla token kullanımını azaltın

```bash
# Geliştirme yapılandırması
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ile OpenAI API arasındaki fark nedir?</strong></summary>

**Microsoft Foundry Models**:
- Kurumsal güvenlik ve uyumluluk
- Özel ağ entegrasyonu
- SLA garantileri
- Yönetilen kimlik kimlik doğrulaması
- Daha yüksek kotalar mevcut

**OpenAI API**:
- Yeni modellere daha hızlı erişim
- Daha basit kurulum
- Daha düşük giriş engeli
- Sadece genel internet

Üretim uygulamaları için **Microsoft Foundry Models önerilir**.
</details>

<details>
<summary><strong>Microsoft Foundry Modellerinde kota aşıldı hatalarını nasıl ele alırım?</strong></summary>

```bash
# Mevcut kotayı kontrol et
az cognitiveservices usage list --location eastus2

# Farklı bir bölgeyi dene
azd env set AZURE_LOCATION westus2
azd up

# Kapasiteyi geçici olarak azalt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kota artışı talep et
# Azure Portal'a git > Kotalar > Artış talebinde bulun
```
</details>

<details>
<summary><strong>Microsoft Foundry Modelleriyle kendi verilerimi kullanabilir miyim?</strong></summary>

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

Şablon için [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) projesine bakın.
</details>

<details>
<summary><strong>Yapay zeka model uç noktalarını nasıl güvence altına alırım?</strong></summary>

**En İyi Uygulamalar**:
1. Managed Identity kullanın (API anahtarları kullanmayın)
2. Private Endpoints'i etkinleştirin
3. Ağ güvenlik gruplarını yapılandırın
4. Hız sınırlaması uygulayın
5. Gizli veriler için Azure Key Vault kullanın

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
- **Agent Skills**: [skills.sh üzerindeki Microsoft Foundry becerisi](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Editörünüze Azure + Foundry ajan becerilerini şu komutla yükleyin: `npx skills add microsoft/github-copilot-for-azure`

---

**Bölüm Gezintisi:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Geçerli Bölüm**: Chapter 2 - AI-First Development
- **⬅️ Önceki Bölüm**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** Topluluk tartışmalarımıza katılın veya depoda bir sorun açın. Azure AI + AZD topluluğu başarılı olmanız için burada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğinin farkında olun. Orijinal belge, ana dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanılması sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
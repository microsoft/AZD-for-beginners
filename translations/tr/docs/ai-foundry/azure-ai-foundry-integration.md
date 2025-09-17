<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T21:54:02+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "tr"
}
-->
# Azure AI Foundry ve AZD Entegrasyonu

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../getting-started/first-project.md)
- **➡️ Sonraki**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../getting-started/configuration.md)

## Genel Bakış

Bu rehber, Azure AI Foundry hizmetlerini Azure Developer CLI (AZD) ile entegre ederek AI uygulamalarının dağıtımını nasıl kolaylaştıracağınızı gösterir. Azure AI Foundry, AI uygulamaları oluşturmak, dağıtmak ve yönetmek için kapsamlı bir platform sunarken, AZD altyapı ve dağıtım sürecini basitleştirir.

## Azure AI Foundry Nedir?

Azure AI Foundry, Microsoft'un AI geliştirme için sunduğu birleşik platformdur ve şunları içerir:

- **Model Kataloğu**: En son teknolojiye sahip AI modellerine erişim
- **Prompt Flow**: AI iş akışları için görsel tasarım aracı
- **AI Foundry Portalı**: AI uygulamaları için entegre geliştirme ortamı
- **Dağıtım Seçenekleri**: Çeşitli barındırma ve ölçeklendirme seçenekleri
- **Güvenlik ve Emniyet**: Sorumlu AI özellikleriyle entegre

## AZD + Azure AI Foundry: Birlikte Daha İyi

| Özellik | Azure AI Foundry | AZD Entegrasyon Faydası |
|---------|------------------|-------------------------|
| **Model Dağıtımı** | Manuel portal dağıtımı | Otomatik, tekrarlanabilir dağıtımlar |
| **Altyapı** | Tıklama ile sağlama | Kod olarak Altyapı (Bicep) |
| **Ortam Yönetimi** | Tek ortam odaklı | Çoklu ortam (geliştirme/staging/üretim) |
| **CI/CD Entegrasyonu** | Sınırlı | Yerel GitHub Actions desteği |
| **Maliyet Yönetimi** | Temel izleme | Ortama özel maliyet optimizasyonu |

## Ön Koşullar

- Uygun izinlere sahip bir Azure aboneliği
- Azure Developer CLI kurulu
- Azure OpenAI hizmetlerine erişim
- Azure AI Foundry hakkında temel bilgi

## Temel Entegrasyon Modelleri

### Model 1: Azure OpenAI Entegrasyonu

**Kullanım Durumu**: Azure OpenAI modelleriyle sohbet uygulamaları dağıtımı

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
// Azure OpenAI Account
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

### Model 2: AI Arama + RAG Entegrasyonu

**Kullanım Durumu**: Retrieval-augmented generation (RAG) uygulamaları dağıtımı

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

### Model 3: Belge Zekası Entegrasyonu

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

## 🔧 Konfigürasyon Modelleri

### Ortam Değişkenleri Ayarı

**Üretim Konfigürasyonu:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Geliştirme Konfigürasyonu:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
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

### Tek Komutla Dağıtım

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Ortama Özel Dağıtımlar

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
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

### Önbellek Stratejileri

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

## Yaygın Sorunların Giderilmesi

### Sorun 1: OpenAI Kota Aşıldı

**Belirtiler:**
- Dağıtım kota hatalarıyla başarısız oluyor
- Uygulama günlüklerinde 429 hataları

**Çözümler:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Sorun 2: Kimlik Doğrulama Hataları

**Belirtiler:**
- AI hizmetlerini çağırırken 401/403 hataları
- "Erişim reddedildi" mesajları

**Çözümler:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Sorun 3: Model Dağıtım Sorunları

**Belirtiler:**
- Modeller dağıtımda mevcut değil
- Belirli model sürümleri başarısız oluyor

**Çözümler:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Örnek Şablonlar

### Temel Sohbet Uygulaması

**Depo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Hizmetler**: Azure OpenAI + Cognitive Search + App Service

**Hızlı Başlangıç**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Belge İşleme Hattı

**Depo**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Hizmetler**: Belge Zekası + Depolama + Fonksiyonlar

**Hızlı Başlangıç**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG ile Kurumsal Sohbet

**Depo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Hizmetler**: Azure OpenAI + Arama + Container Apps + Cosmos DB

**Hızlı Başlangıç**:
```bash
azd init --template contoso-chat
azd up
```

## Sonraki Adımlar

1. **Örnekleri Deneyin**: Kullanım durumunuza uygun önceden oluşturulmuş bir şablonla başlayın
2. **İhtiyaçlarınıza Göre Özelleştirin**: Altyapı ve uygulama kodunu değiştirin
3. **İzleme Ekleyin**: Kapsamlı gözlemlenebilirlik uygulayın
4. **Maliyetleri Optimize Edin**: Bütçenize uygun konfigürasyonları ince ayar yapın
5. **Dağıtımınızı Güvenli Hale Getirin**: Kurumsal güvenlik modellerini uygulayın
6. **Üretime Ölçeklendirin**: Çok bölgeli ve yüksek erişilebilirlik özellikleri ekleyin

## Topluluk ve Destek

- **Azure AI Foundry Discord**: [#Azure kanalı](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Sorunlar ve tartışmalar](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Resmi dokümantasyon](https://learn.microsoft.com/azure/ai-studio/)

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../getting-started/first-project.md)
- **➡️ Sonraki**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../getting-started/configuration.md)

**Yardım mı gerekiyor?** Topluluk tartışmalarına katılın veya depoda bir sorun açın. Azure AI + AZD topluluğu başarıya ulaşmanız için burada!

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
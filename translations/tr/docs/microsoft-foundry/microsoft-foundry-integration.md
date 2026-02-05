# Microsoft Foundry ve AZD Entegrasyonu

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Başlangıç Rehberi](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../getting-started/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../getting-started/configuration.md)

## Genel Bakış

Bu rehber, Microsoft Foundry hizmetlerini Azure Developer CLI (AZD) ile entegre ederek AI uygulamalarının dağıtımını nasıl kolaylaştıracağınızı gösterir. Microsoft Foundry, AI uygulamaları oluşturmak, dağıtmak ve yönetmek için kapsamlı bir platform sunarken, AZD altyapı ve dağıtım sürecini basitleştirir.

## Microsoft Foundry Nedir?

Microsoft Foundry, AI geliştirme için Microsoft'un birleşik platformudur ve şunları içerir:

- **Model Kataloğu**: En son teknoloji AI modellerine erişim
- **Prompt Flow**: AI iş akışları için görsel tasarım aracı
- **AI Foundry Portalı**: AI uygulamaları için entegre geliştirme ortamı
- **Dağıtım Seçenekleri**: Çeşitli barındırma ve ölçeklendirme seçenekleri
- **Güvenlik ve Emniyet**: Sorumlu AI özellikleriyle entegre

## AZD + Microsoft Foundry: Daha İyi Birlikte

| Özellik | Microsoft Foundry | AZD Entegrasyon Faydası |
|---------|-----------------|------------------------|
| **Model Dağıtımı** | Manuel portal dağıtımı | Otomatik, tekrarlanabilir dağıtımlar |
| **Altyapı** | Tıklama ile sağlama | Kod olarak Altyapı (Bicep) |
| **Ortam Yönetimi** | Tek ortam odaklı | Çoklu ortam (geliştirme/staging/üretim) |
| **CI/CD Entegrasyonu** | Sınırlı | Yerel GitHub Actions desteği |
| **Maliyet Yönetimi** | Temel izleme | Ortama özel maliyet optimizasyonu |

## Ön Koşullar

- Uygun izinlere sahip bir Azure aboneliği
- Azure Developer CLI kurulu
- Azure OpenAI hizmetlerine erişim
- Microsoft Foundry hakkında temel bilgi

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

## 🔧 Yapılandırma Modelleri

### Ortam Değişkenleri Ayarı

**Üretim Yapılandırması:**
```bash
# Temel AI hizmetleri
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
# Geliştirme için maliyet optimize edilmiş ayarlar
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

### Tek Komutla Dağıtım

```bash
# Her şeyi tek bir komutla dağıtın
azd up

# Veya kademeli olarak dağıtın
azd provision  # Sadece altyapı
azd deploy     # Sadece uygulama
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

## Yaygın Sorunların Çözümü

### Sorun 1: OpenAI Kota Aşıldı

**Belirtiler:**
- Dağıtım kota hatalarıyla başarısız oluyor
- Uygulama günlüklerinde 429 hataları

**Çözümler:**
```bash
# Mevcut kota kullanımını kontrol et
az cognitiveservices usage list --location eastus

# Farklı bölgeyi deneyin
azd env set AZURE_LOCATION westus2
azd up

# Kapasiteyi geçici olarak azaltın
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Sorun 2: Kimlik Doğrulama Hataları

**Belirtiler:**
- AI hizmetlerini çağırırken 401/403 hataları
- "Erişim reddedildi" mesajları

**Çözümler:**
```bash
# Rol atamalarını doğrula
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Yönetilen kimlik yapılandırmasını kontrol et
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault erişimini doğrula
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
# Model kapasite gereksinimlerini kontrol et
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

1. **Örnekleri Deneyin**: Kullanım durumunuza uygun önceden hazırlanmış bir şablonla başlayın
2. **İhtiyaçlarınıza Göre Özelleştirin**: Altyapı ve uygulama kodunu değiştirin
3. **İzleme Ekleyin**: Kapsamlı gözlemlenebilirlik uygulayın
4. **Maliyetleri Optimize Edin**: Bütçenize uygun yapılandırmaları ince ayar yapın
5. **Dağıtımınızı Güvenli Hale Getirin**: Kurumsal güvenlik modellerini uygulayın
6. **Üretime Ölçeklendirin**: Çok bölgeli ve yüksek erişilebilirlik özellikleri ekleyin

## 🎯 Uygulamalı Alıştırmalar

### Alıştırma 1: Azure OpenAI Sohbet Uygulaması Dağıtımı (30 dakika)
**Hedef**: Üretime hazır bir AI sohbet uygulaması dağıtımı ve testi

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

# AI operasyonlarını izle
azd monitor

# Temizle
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Dağıtım kota hatası olmadan tamamlanır
- [ ] Sohbet arayüzüne tarayıcıdan erişilebilir
- [ ] Sorular sorulabilir ve AI destekli yanıtlar alınabilir
- [ ] Application Insights telemetri verilerini gösterir
- [ ] Kaynaklar başarıyla temizlenir

**Tahmini Maliyet**: 30 dakikalık test için $5-10

### Alıştırma 2: Çoklu Model Dağıtımı Yapılandırma (45 dakika)
**Hedef**: Farklı yapılandırmalara sahip birden fazla AI modeli dağıtımı

```bash
# Özel Bicep yapılandırması oluştur
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

# Dağıt ve doğrula
azd provision
azd show
```

**Başarı Kriterleri:**
- [ ] Birden fazla model başarıyla dağıtılır
- [ ] Farklı kapasite ayarları uygulanır
- [ ] Modeller API üzerinden erişilebilir
- [ ] Uygulamadan her iki model çağrılabilir

### Alıştırma 3: Maliyet İzleme Uygulama (20 dakika)
**Hedef**: Bütçe uyarıları ve maliyet takibi ayarlama

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
- [ ] Azure'da bütçe uyarısı oluşturulur
- [ ] E-posta bildirimleri yapılandırılır
- [ ] Azure Portal'da maliyet verileri görüntülenebilir
- [ ] Bütçe eşikleri uygun şekilde ayarlanır

## 💡 Sıkça Sorulan Sorular

<details>
<summary><strong>Geliştirme sırasında Azure OpenAI maliyetlerini nasıl azaltabilirim?</strong></summary>

1. **Ücretsiz Katmanı Kullanın**: Azure OpenAI aylık 50,000 token ücretsiz sunar
2. **Kapasiteyi Azaltın**: Geliştirme için kapasiteyi 30+ yerine 10 TPM olarak ayarlayın
3. **azd down kullanın**: Aktif olarak geliştirme yapmadığınızda kaynakları serbest bırakın
4. **Yanıtları Önbelleğe Alın**: Tekrarlanan sorgular için Redis önbelleği uygulayın
5. **Prompt Mühendisliği Kullanın**: Verimli promptlarla token kullanımını azaltın

```bash
# Geliştirme yapılandırması
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI ile OpenAI API arasındaki fark nedir?</strong></summary>

**Azure OpenAI**:
- Kurumsal güvenlik ve uyumluluk
- Özel ağ entegrasyonu
- SLA garantileri
- Yönetilen kimlik doğrulama
- Daha yüksek kota seçenekleri

**OpenAI API**:
- Yeni modellere daha hızlı erişim
- Daha basit kurulum
- Daha düşük giriş engeli
- Sadece genel internet

Üretim uygulamaları için **Azure OpenAI önerilir**.
</details>

<details>
<summary><strong>Azure OpenAI kota aşıldı hatalarını nasıl ele alabilirim?</strong></summary>

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
# Azure Portal > Kotalar > Artış talep et bölümüne git
```
</details>

<details>
<summary><strong>Kendi verilerimi Azure OpenAI ile kullanabilir miyim?</strong></summary>

Evet! **Azure AI Search** kullanarak RAG (Retrieval Augmented Generation) uygulayabilirsiniz:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) şablonuna göz atın.
</details>

<details>
<summary><strong>AI model uç noktalarını nasıl güvenli hale getirebilirim?</strong></summary>

**En İyi Uygulamalar**:
1. Yönetilen Kimlik kullanın (API anahtarları kullanmayın)
2. Özel Uç Noktaları etkinleştirin
3. Ağ güvenlik gruplarını yapılandırın
4. Hız sınırlaması uygulayın
5. Azure Key Vault'u sırlar için kullanın

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

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Başlangıç Rehberi](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../getting-started/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../getting-started/configuration.md)

**Yardıma mı ihtiyacınız var?** Topluluk tartışmalarına katılın veya depoda bir sorun açın. Azure AI + AZD topluluğu başarıya ulaşmanız için burada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dilindeki hali yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
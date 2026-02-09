# Microsoft Foundry ve AZD Entegrasyonu

**Chapter Navigation:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Current Chapter**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

## Genel Bakış

Bu kılavuz, Microsoft Foundry hizmetlerini Azure Developer CLI (AZD) ile entegre ederek yapay zeka uygulamalarının dağıtımlarını nasıl kolaylaştıracağını gösterir. Microsoft Foundry, yapay zeka uygulamaları oluşturmak, dağıtmak ve yönetmek için kapsamlı bir platform sağlarken, AZD altyapı ve dağıtım sürecini basitleştirir.

## Microsoft Foundry Nedir?

Microsoft Foundry, yapay zeka geliştirme için birleşik bir platformdur ve şunları içerir:

- **Model Kataloğu**: En gelişmiş yapay zeka modellere erişim
- **Prompt Flow**: Yapay zeka iş akışları için görsel tasarımcı
- **AI Foundry Portalı**: Yapay zeka uygulamaları için entegre geliştirme ortamı
- **Dağıtım Seçenekleri**: Birden çok barındırma ve ölçeklendirme seçeneği
- **Güvenlik ve Emniyet**: Yerleşik sorumlu yapay zeka özellikleri

## AZD + Microsoft Foundry: Birlikte Daha İyi

| Özellik | Microsoft Foundry | AZD Entegrasyon Avantajı |
|---------|-----------------|------------------------|
| **Model Dağıtımı** | Portal üzerinden manuel dağıtım | Otomatik, tekrarlanabilir dağıtımlar |
| **Altyapı** | Tıklayarak sağlanan provizyon | Kod olarak Altyapı (Bicep) |
| **Ortam Yönetimi** | Tek ortam odaklı | Çoklu ortam (dev/staging/prod) |
| **CI/CD Entegrasyonu** | Sınırlı | Yerel GitHub Actions desteği |
| **Maliyet Yönetimi** | Temel izleme | Ortama özel maliyet optimizasyonu |

## Önkoşullar

- Uygun izinlere sahip Azure aboneliği
- Azure Developer CLI yüklü
- Azure OpenAI hizmetlerine erişim
- Microsoft Foundry hakkında temel bilgi

## Temel Entegrasyon Desenleri

### Desen 1: Azure OpenAI Entegrasyonu

**Kullanım Durumu**: Azure OpenAI modelleriyle sohbet uygulamaları dağıtmak

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

### Desen 2: AI Search + RAG Entegrasyonu

**Kullanım Durumu**: retrieval-augmented generation (RAG) uygulamalarını dağıtmak

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

### Desen 3: Belge Zekası Entegrasyonu

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
# Temel YZ hizmetleri
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

### Tek Komutla Dağıtım

```bash
# Her şeyi tek bir komutla dağıtın
azd up

# Veya kademeli olarak dağıtın
azd provision  # Yalnızca altyapı
azd deploy     # Yalnızca uygulama
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

## İzleme ve Görünürlük

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

## Yaygın Sorun Giderme

### Sorun 1: OpenAI Kota Aşıldı

**Belirtiler:**
- Dağıtım kota hatalarıyla başarısız olur
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
- AI hizmetleri çağrılırken 401/403 hataları
- "Erişim reddedildi" mesajları

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
- Dağıtımda modellerin kullanılamaması
- Belirli model sürümlerinin başarısız olması

**Çözümler:**
```bash
# Bölgeye göre kullanılabilir modelleri listele
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

### Belge İşleme Boru Hattı

**Depo**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Hizmetler**: Document Intelligence + Storage + Functions

**Hızlı Başlangıç**:
```bash
azd init --template ai-document-processing
azd up
```

### Kurumsal Sohbet (RAG)

**Depo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Hizmetler**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Hızlı Başlangıç**:
```bash
azd init --template contoso-chat
azd up
```

## Sonraki Adımlar

1. **Örnekleri Deneyin**: Kullanım durumunuza uyan önceden hazırlanmış bir şablonla başlayın
2. **İhtiyaçlarınıza Göre Özelleştirin**: Altyapı ve uygulama kodunu değiştirin
3. **İzleme Ekleyin**: Kapsamlı gözlemlenebilirlik uygulayın
4. **Maliyetleri Optimize Edin**: Bütçenize göre yapılandırmaları ince ayar yapın
5. **Dağıtımınızı Güvence Altına Alın**: Kurumsal güvenlik desenlerini uygulayın
6. **Üretime Ölçekleyin**: Çok bölgeli ve yüksek kullanılabilirlik özellikleri ekleyin

## 🎯 Uygulamalı Alıştırmalar

### Alıştırma 1: Azure OpenAI Sohbet Uygulaması Dağıtımı (30 dakika)
**Hedef**: Üretime hazır bir yapay zeka sohbet uygulamasını dağıtmak ve test etmek

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
- [ ] Tarayıcıda sohbet arabirimine erişilebilir
- [ ] Soru sorup yapay zeka destekli yanıtlar alınabilir
- [ ] Application Insights telemetri verilerini gösterir
- [ ] Kaynaklar başarıyla temizlendi

**Tahmini Maliyet**: 30 dakika test için $5-10

### Alıştırma 2: Çok-Modelli Dağıtım Yapılandırması (45 dakika)
**Hedef**: Farklı yapılandırmalara sahip birden çok yapay zeka modelini dağıtmak

```bash
# Özel Bicep yapılandırması oluşturun
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

# Dağıtın ve doğrulayın
azd provision
azd show
```

**Başarı Kriterleri:**
- [ ] Birden çok model başarıyla dağıtıldı
- [ ] Farklı kapasite ayarları uygulandı
- [ ] Modellere API üzerinden erişilebiliyor
- [ ] Her iki modeli de uygulamadan çağırılabilir

### Alıştırma 3: Maliyet İzleme Uygulama (20 dakika)
**Hedef**: Bütçe uyarıları ve maliyet takibi kurmak

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
<summary><strong>Geliştirme sırasında Azure OpenAI maliyetlerini nasıl azaltırım?</strong></summary>

1. **Ücretsiz Katmanı Kullanın**: Azure OpenAI ayda 50.000 token ücretsiz sunar
2. **Kapasiteyi Azaltın**: Geliştirme için kapasiteyi 30+ yerine 10 TPM olarak ayarlayın
3. **azd down kullanın**: Aktif geliştirme yapılmadığında kaynakları boşaltın
4. **Yanıtları Önbelleğe Alın**: Tekrarlanan sorgular için Redis önbelleği uygulayın
5. **Prompt Mühendisliği Kullanın**: Verimli istemlerle token kullanımını azaltın

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
- Yönetilen kimlik ile kimlik doğrulama
- Daha yüksek kotalar mevcut

**OpenAI API**:
- Yeni modellere daha hızlı erişim
- Daha basit kurulum
- Giriş engeli daha düşüktür
- Yalnızca genel internet

Üretim uygulamaları için **Azure OpenAI önerilir**.
</details>

<details>
<summary><strong>Azure OpenAI kota aşıldı hatalarını nasıl ele alırım?</strong></summary>

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
# Azure Portal'a git > Kotalar > Artış talebi oluştur
```
</details>

<details>
<summary><strong>Azure OpenAI ile kendi verilerimi kullanabilir miyim?</strong></summary>

Evet! RAG (Retrieval Augmented Generation) için **Azure AI Search**'ü kullanın:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Şablona bakın: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Yapay zeka model uç noktalarını nasıl güvenli hale getiririm?</strong></summary>

**En İyi Uygulamalar**:
1. Yönetilen Kimlik kullanın (API anahtarları yok)
2. Özel Uç Noktaları etkinleştirin
3. Ağ güvenlik gruplarını yapılandırın
4. İstek hızını sınırlayın
5. Gizli bilgiler için Azure Key Vault kullanın

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

**Chapter Navigation:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Current Chapter**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** Topluluk tartışmalarımıza katılın veya depoda bir issue açın. Azure AI + AZD topluluğu başarıya ulaşmanız için burada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk reddi:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılmasından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
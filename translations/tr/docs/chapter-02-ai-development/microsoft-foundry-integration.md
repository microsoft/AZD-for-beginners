# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

Bu kılavuz, Microsoft Foundry hizmetlerini Azure Developer CLI (AZD) ile entegre ederek AI uygulama dağıtımlarını nasıl kolaylaştıracağınızı gösterir. Microsoft Foundry, AI uygulamaları oluşturmak, dağıtmak ve yönetmek için kapsamlı bir platform sağlar; AZD ise altyapı ve dağıtım süreçlerini sadeleştirir.

## What is Microsoft Foundry?

Microsoft Foundry, AI geliştirme için Microsoft'un birleşik platformudur ve şu bileşenleri içerir:

- **Model Catalog**: En son AI modellere erişim
- **Prompt Flow**: AI iş akışları için görsel tasarımcı
- **Microsoft Foundry Portal**: AI uygulamaları için entegre geliştirme ortamı
- **Deployment Options**: Çoklu barındırma ve ölçeklendirme seçenekleri
- **Safety and Security**: Dahili sorumlu AI özellikleri

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- Azure aboneliği ve uygun izinler
- Azure Developer CLI yüklü
- Microsoft Foundry Models hizmetlerine erişim
- Microsoft Foundry hakkında temel bilgi

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Deploy chat applications with Microsoft Foundry Models models

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

**Infrastructure (main.bicep):**
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

### Pattern 2: AI Search + RAG Integration

**Use Case**: Deploy retrieval-augmented generation (RAG) applications

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

### Pattern 3: Document Intelligence Integration

**Use Case**: Document processing and analysis workflows

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
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

**Development Configuration:**
```bash
# Geliştirme için maliyet açısından optimize edilmiş ayarlar
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ücretsiz katman
```

### Secure Configuration with Key Vault

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

## Deployment Workflows

### AZD Extensions for Foundry

AZD, Microsoft Foundry hizmetleriyle çalışmaya yönelik AI-özgü yetenekler ekleyen uzantılar sağlar:

```bash
# Foundry ajanları uzantısını yükle
azd extension install azure.ai.agents

# İnce ayar uzantısını yükle
azd extension install azure.ai.finetune

# Özel modeller uzantısını yükle
azd extension install azure.ai.models

# Yüklü uzantıları listele
azd extension list --installed

# Şu anda yüklü ajan uzantısının sürümünü incele
azd extension show azure.ai.agents
```

AI uzantıları hâlâ önizlemede hızlıca ilerliyor. Eğer bir komut burada gösterilenden farklı davranıyorsa, projeyle ilgili sorun gidermeye başlamadan önce ilgili uzantıyı yükseltin.

### Agent-First Deployment with `azd ai`

If you have an agent manifest, use `azd ai agent init` to scaffold a project wired to Foundry Agent Service:

```bash
# Bir ajan manifestinden başlat
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure'a dağıt
azd up
```

Recent preview releases of `azure.ai.agents` also added template-based initialization support for `azd ai agent init`. If you are following newer agent samples, check the extension help for the exact flags available in your installed version.

See [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

### Single Command Deployment

```bash
# Tek bir komutla her şeyi dağıtın
azd up

# Ya da kademeli olarak dağıtın
azd provision  # Yalnızca altyapı
azd deploy     # Yalnızca uygulama

# azd 1.23.11+ sürümünde uzun süre çalışan AI uygulama dağıtımları için
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- Deployment fails with quota errors
- 429 errors in application logs

**Solutions:**
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

### Issue 2: Authentication Failures

**Symptoms:**
- 401/403 errors when calling AI services
- "Access denied" messages

**Solutions:**
```bash
# Rol atamalarını doğrulayın
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Yönetilen kimlik yapılandırmasını kontrol edin
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault erişimini doğrulayın
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- Models not available in deployment
- Specific model versions failing

**Solutions:**
```bash
# Bölgeye göre mevcut modelleri listele
az cognitiveservices model list --location eastus

# Bicep şablonunda model sürümünü güncelle
# Modelin kapasite gereksinimlerini kontrol et
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: En popüler Azure AI örneği — kendi belgeleriniz üzerinde soru sorabilmenizi sağlayan üretim hazır bir RAG sohbet uygulaması. Sohbet için GPT-4.1-mini, gömme vektörleri için text-embedding-3-large ve geri getirme için Azure AI Search kullanır. Çok modlu belgeleri, ses giriş/çıkışını, Microsoft Entra kimlik doğrulamasını ve Application Insights izlemeyi destekler.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG sohbet örneğinin .NET/C# eşdeğeri. ASP.NET Core Minimal API ve Blazor WebAssembly ön uç ile inşa edilmiştir. Sesli sohbet, GPT-4o-mini vision desteği ve eşlik eden .NET MAUI Blazor Hybrid masaüstü/mobile istemci içerir.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J kullanarak AI orkestrasyonu yapan RAG sohbet örneğinin Java sürümü. Mikro hizmet olay güdümlü mimariyi, birden çok arama stratejisini (metin, vektör, hibrit), Azure Document Intelligence ile belge yüklemeyi ve Azure Container Apps veya Azure Kubernetes Service üzerinde dağıtımı destekler.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Azure AI Foundry ve Prompty kullanan uçtan uca perakende RAG copilot örneği. Ürün kataloğu ve müşteri sipariş verilerine dayalı yanıtlar üreten bir Contoso Outdoor perakende sohbet botu. Tam GenAIOps iş akışını gösterir — Prompty ile prototip oluşturma, AI destekli değerlendiricilerle değerlendirme ve AZD ile Container Apps'e dağıtım.

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty ile AI ajan orkestrasyonunu gösteren çok ajanlı örnek. Araştırma ajanı (Bing Grounding in Azure AI Agent Service), ürün ajanı (Azure AI Search), yazar ajan ve editör ajanı kullanarak birlikte iyi araştırılmış makaleler üretir. GitHub Actions içinde değerlendirmenin olduğu CI/CD içerir.

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: API için Azure Functions ve barındırma için Azure Static Web Apps kullanan tamamen sunucusuz RAG sohbet botu. Azure Cosmos DB'yi hem vektör depolama hem de sohbet geçmişi veritabanı olarak kullanır. Ücretsiz testler için Ollama ile yerel geliştirmeyi destekler.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: Belge yükleme/yonetimi için yönetici portalı, birden çok orkestratör seçeneği (Semantic Kernel, LangChain, Prompt Flow), konuşmadan metne, Microsoft Teams entegrasyonu ve PostgreSQL veya Cosmos DB arka ucu seçeneği ile kurumsal düzeyde RAG çözüm hızlandırıcısı. Üretim RAG senaryoları için özelleştirilebilir bir başlangıç noktası olarak tasarlanmıştır.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: LangChain.js, LlamaIndex.TS ve Microsoft Agent Framework olmak üzere üç çerçeve kullanan çok ajanlı AI orkestrasyonu için referans uygulama. Dört dilde MCP (Model Context Protocol) sunucuları içeren sunucusuz Azure Container Apps olarak dağıtılır ve OpenTelemetry izleme özellikleri sunar.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Azure AI hizmetlerini yapılandırılmış makine öğrenimi modelleriyle dağıtan minimal bir Bicep şablonu. Tam bir uygulama yığınına ihtiyaç duymadan yalnızca Azure AI altyapısını sağlamanız gerektiğinde hafif bir başlangıç noktasıdır.

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Next Steps

1. **Try the Examples**: Start with a pre-built template that matches your use case
2. **Customize for Your Needs**: Modify the infrastructure and application code
3. **Add Monitoring**: Implement comprehensive observability
4. **Optimize Costs**: Fine-tune configurations for your budget
5. **Secure Your Deployment**: Implement enterprise security patterns
6. **Scale to Production**: Add multi-region and high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: Deploy and test a production-ready AI chat application

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

**Success Criteria:**
- [ ] Deployment completes without quota errors
- [ ] Can access chat interface in browser
- [ ] Can ask questions and get AI-powered responses
- [ ] Application Insights shows telemetry data
- [ ] Successfully cleaned up resources

**Estimated Cost**: $5-10 for 30 minutes of testing

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy multiple AI models with different configurations

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

**Success Criteria:**
- [ ] Multiple models deployed successfully
- [ ] Different capacity settings applied
- [ ] Models accessible via API
- [ ] Can call both models from application

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Set up budget alerts and cost tracking

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

**Success Criteria:**
- [ ] Budget alert created in Azure
- [ ] Email notifications configured
- [ ] Can view cost data in Azure Portal
- [ ] Budget thresholds set appropriately

## 💡 Frequently Asked Questions

<details>
<summary><strong>Geliştirme sırasında Microsoft Foundry Models maliyetlerini nasıl azaltırım?</strong></summary>

1. **Use Free Tier**: Microsoft Foundry Models offers 50,000 tokens/month free
2. **Reduce Capacity**: Set capacity to 10 TPM instead of 30+ for dev
3. **Use azd down**: Deallocate resources when not actively developing
4. **Cache Responses**: Implement Redis cache for repeated queries
5. **Use Prompt Engineering**: Reduce token usage with efficient prompts
```bash
# Geliştirme yapılandırması
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Modelleri ile OpenAI API arasındaki fark nedir?</strong></summary>

**Microsoft Foundry Models**:
- Kurumsal güvenlik ve uyumluluk
- Özel ağ entegrasyonu
- SLA garantileri
- Yönetilen kimlik ile kimlik doğrulama
- Daha yüksek kota imkanı

**OpenAI API**:
- Yeni modellere daha hızlı erişim
- Daha basit kurulum
- Giriş engeli daha düşük
- Sadece genel internet

Üretim uygulamaları için, **Microsoft Foundry Models önerilir**.
</details>

<details>
<summary><strong>Microsoft Foundry Models kota aşıldı hatalarını nasıl ele alırım?</strong></summary>

```bash
# Mevcut kotayı kontrol et
az cognitiveservices usage list --location eastus2

# Farklı bir bölge dene
azd env set AZURE_LOCATION westus2
azd up

# Kapasiteyi geçici olarak azalt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kota artışı talep et
# Azure Portal > Kotalar > Artış talep et
```
</details>

<details>
<summary><strong>Kendi verilerimi Microsoft Foundry Models ile kullanabilir miyim?</strong></summary>

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

Şablona bakın: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>AI model uç noktalarını nasıl güvene alırım?</strong></summary>

**En İyi Uygulamalar**:
1. Managed Identity kullanın (API anahtarı yok)
2. Özel Uç Noktalarını etkinleştirin
3. Ağ güvenliği gruplarını yapılandırın
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
- **Agent Skills**: [skills.sh üzerindeki Microsoft Foundry yeteneği](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Düzenleyicinize Azure + Foundry agent yeteneklerini şu komutla yükleyin: `npx skills add microsoft/github-copilot-for-azure`

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - Yapay Zekâ Öncelikli Geliştirme
- **⬅️ Önceki Bölüm**: [Bölüm 1: İlk Projeniz](../chapter-01-foundation/first-project.md)
- **➡️ Sonraki**: [AI Model Dağıtımı](ai-model-deployment.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

**Yardıma mı ihtiyacınız var?** Topluluk tartışmalarına katılın veya depoda bir sorun açın. Azure AI + AZD topluluğu başarılı olmanız için burada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, lütfen otomatik çevirilerin hata veya yanlışlıklar içerebileceğinin farkında olun. Orijinal belge kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlama için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
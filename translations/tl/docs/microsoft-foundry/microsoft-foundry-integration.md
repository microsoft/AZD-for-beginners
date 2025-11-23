<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-22T11:41:30+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "tl"
}
-->
# Microsoft Foundry Integration sa AZD

**Pag-navigate sa Kabanata:**
- **📚 Kurso Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../getting-started/first-project.md)
- **➡️ Susunod**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../getting-started/configuration.md)

## Pangkalahatang-ideya

Ang gabay na ito ay nagpapakita kung paano isama ang mga serbisyo ng Microsoft Foundry sa Azure Developer CLI (AZD) para sa mas maayos na pag-deploy ng mga AI application. Ang Microsoft Foundry ay nagbibigay ng komprehensibong platform para sa pagbuo, pag-deploy, at pamamahala ng mga AI application, habang ang AZD ay nagpapadali sa proseso ng imprastraktura at pag-deploy.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay ang pinag-isang platform ng Microsoft para sa AI development na naglalaman ng:

- **Model Catalog**: Access sa mga makabagong AI model
- **Prompt Flow**: Visual designer para sa mga AI workflow
- **AI Foundry Portal**: Integrated development environment para sa mga AI application
- **Deployment Options**: Maraming opsyon para sa hosting at scaling
- **Safety and Security**: May kasamang responsible AI features

## AZD + Microsoft Foundry: Mas Maganda Kapag Magkasama

| Tampok | Microsoft Foundry | Benepisyo ng AZD Integration |
|--------|-------------------|-----------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limitado | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Mga Kinakailangan

- Azure subscription na may tamang mga pahintulot
- Nakainstall ang Azure Developer CLI
- Access sa Azure OpenAI services
- Pangunahing kaalaman sa Microsoft Foundry

## Mga Pangunahing Pattern ng Integrasyon

### Pattern 1: Azure OpenAI Integration

**Gamitin Para Sa**: Pag-deploy ng mga chat application gamit ang Azure OpenAI models

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

### Pattern 2: AI Search + RAG Integration

**Gamitin Para Sa**: Pag-deploy ng retrieval-augmented generation (RAG) applications

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

**Gamitin Para Sa**: Mga workflow para sa pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern ng Configuration

### Setup ng Environment Variables

**Production Configuration:**
```bash
# Pangunahing serbisyo ng AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mga pagsasaayos ng modelo
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Mga setting ng pagganap
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# Mga setting na na-optimize sa gastos para sa pag-develop
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Libreng tier
```

### Secure Configuration gamit ang Key Vault

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

## Mga Workflow ng Deployment

### Single Command Deployment

```bash
# I-deploy ang lahat gamit ang isang utos
azd up

# O mag-deploy nang paunti-unti
azd provision  # Inprastraktura lamang
azd deploy     # Aplikasyon lamang
```

### Environment-Specific Deployments

```bash
# Kapaligiran ng pag-unlad
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Kapaligiran ng produksyon
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring at Observability

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

## 🔐 Mga Pinakamahusay na Kasanayan sa Seguridad

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

## Pag-optimize ng Performance

### Mga Diskarte sa Caching

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

## Pag-aayos ng Karaniwang Mga Isyu

### Isyu 1: Naubos ang OpenAI Quota

**Mga Sintomas:**
- Nabigo ang deployment dahil sa quota errors
- 429 errors sa application logs

**Mga Solusyon:**
```bash
# Suriin ang kasalukuyang paggamit ng quota
az cognitiveservices usage list --location eastus

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Bawasan pansamantala ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Isyu 2: Mga Pagkabigo sa Authentication

**Mga Sintomas:**
- 401/403 errors kapag tumatawag sa AI services
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Tiyakin ang mga nakatalagang papel
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Suriin ang configuration ng pinamamahalaang pagkakakilanlan
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patunayan ang access sa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isyu 3: Mga Isyu sa Model Deployment

**Mga Sintomas:**
- Hindi available ang mga model sa deployment
- Nabibigo ang mga partikular na bersyon ng model

**Mga Solusyon:**
```bash
# Ilista ang mga available na modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update ang bersyon ng modelo sa bicep template
# Suriin ang mga kinakailangan sa kapasidad ng modelo
```

## Mga Halimbawang Template

### Basic Chat Application

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Cognitive Search + App Service

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Document Processing Pipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Mga Serbisyo**: Document Intelligence + Storage + Functions

**Quick Start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat with RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

## Mga Susunod na Hakbang

1. **Subukan ang Mga Halimbawa**: Simulan sa isang pre-built template na tumutugma sa iyong use case
2. **I-customize Ayon sa Iyong Pangangailangan**: Baguhin ang imprastraktura at application code
3. **Magdagdag ng Monitoring**: Magpatupad ng komprehensibong observability
4. **I-optimize ang Gastos**: Ayusin ang mga configuration ayon sa iyong budget
5. **I-secure ang Iyong Deployment**: Magpatupad ng mga enterprise security pattern
6. **I-scale sa Production**: Magdagdag ng multi-region at high-availability features

## 🎯 Mga Hands-On Exercise

### Exercise 1: I-deploy ang Azure OpenAI Chat App (30 minuto)
**Layunin**: I-deploy at subukan ang isang production-ready AI chat application

```bash
# I-initialize ang template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Itakda ang mga variable ng kapaligiran
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# I-deploy
azd up

# Subukan ang aplikasyon
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Subaybayan ang mga operasyon ng AI
azd monitor

# Linisin
azd down --force --purge
```

**Kriteriya ng Tagumpay:**
- [ ] Natapos ang deployment nang walang quota errors
- [ ] Maaaring ma-access ang chat interface sa browser
- [ ] Maaaring magtanong at makakuha ng AI-powered na sagot
- [ ] Nagpapakita ng telemetry data ang Application Insights
- [ ] Matagumpay na nalinis ang mga resources

**Tinatayang Gastos**: $5-10 para sa 30 minutong pagsubok

### Exercise 2: I-configure ang Multi-Model Deployment (45 minuto)
**Layunin**: I-deploy ang maraming AI model na may iba't ibang configuration

```bash
# Gumawa ng pasadyang Bicep na configuration
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

# I-deploy at i-verify
azd provision
azd show
```

**Kriteriya ng Tagumpay:**
- [ ] Matagumpay na na-deploy ang maraming model
- [ ] Naipatupad ang iba't ibang capacity settings
- [ ] Accessible ang mga model sa pamamagitan ng API
- [ ] Maaaring tawagin ang parehong model mula sa application

### Exercise 3: Magpatupad ng Cost Monitoring (20 minuto)
**Layunin**: Mag-set up ng budget alerts at cost tracking

```bash
# Magdagdag ng alerto sa badyet sa Bicep
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

# I-deploy ang alerto sa badyet
azd provision

# Suriin ang kasalukuyang gastos
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriya ng Tagumpay:**
- [ ] Nalikha ang budget alert sa Azure
- [ ] Na-configure ang email notifications
- [ ] Maaaring makita ang cost data sa Azure Portal
- [ ] Na-set ang budget thresholds nang naaangkop

## 💡 Mga Madalas Itanong

<details>
<summary><strong>Paano ko mababawasan ang gastos sa Azure OpenAI habang nagde-develop?</strong></summary>

1. **Gamitin ang Free Tier**: Nag-aalok ang Azure OpenAI ng 50,000 tokens/buwan nang libre
2. **Bawasan ang Capacity**: I-set ang capacity sa 10 TPM sa halip na 30+ para sa dev
3. **Gamitin ang azd down**: I-deallocate ang mga resource kapag hindi aktibong nagde-develop
4. **Cache Responses**: Magpatupad ng Redis cache para sa mga paulit-ulit na query
5. **Gamitin ang Prompt Engineering**: Bawasan ang token usage gamit ang efficient prompts

```bash
# Konfigurasyon ng pag-unlad
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Ano ang pagkakaiba ng Azure OpenAI at OpenAI API?</strong></summary>

**Azure OpenAI**:
- Enterprise security at compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Mas mataas na quotas available

**OpenAI API**:
- Mas mabilis na access sa mga bagong model
- Mas simpleng setup
- Mas mababang hadlang sa pagpasok
- Public internet lamang

Para sa production apps, **inirerekomenda ang Azure OpenAI**.
</details>

<details>
<summary><strong>Paano ko haharapin ang mga error sa Azure OpenAI quota exceeded?</strong></summary>

```bash
# Suriin ang kasalukuyang quota
az cognitiveservices usage list --location eastus2

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Bawasan pansamantala ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Humiling ng pagtaas ng quota
# Pumunta sa Azure Portal > Quotas > Humiling ng pagtaas
```
</details>

<details>
<summary><strong>Maaari ko bang gamitin ang sarili kong data sa Azure OpenAI?</strong></summary>

Oo! Gamitin ang **Azure AI Search** para sa RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Tingnan ang [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>Paano ko mase-secure ang AI model endpoints?</strong></summary>

**Mga Pinakamahusay na Kasanayan**:
1. Gamitin ang Managed Identity (walang API keys)
2. I-enable ang Private Endpoints
3. I-configure ang network security groups
4. Magpatupad ng rate limiting
5. Gamitin ang Azure Key Vault para sa mga secrets

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

## Komunidad at Suporta

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Mga Isyu at Diskusyon](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)

---

**Pag-navigate sa Kabanata:**
- **📚 Kurso Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../getting-started/first-project.md)
- **➡️ Susunod**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../getting-started/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repository. Ang Azure AI + AZD na komunidad ay narito upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
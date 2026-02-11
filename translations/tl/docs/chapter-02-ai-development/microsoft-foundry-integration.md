# Pagsasama ng Microsoft Foundry sa AZD

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - Pag-unlad na Inuuna ang AI
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

## Overview

Ipinapakita ng gabay na ito kung paano isama ang mga serbisyo ng Microsoft Foundry sa Azure Developer CLI (AZD) para sa mas pinadaling pag-deploy ng mga AI application. Nagbibigay ang Microsoft Foundry ng komprehensibong plataporma para sa pagbuo, pag-deploy, at pamamahala ng mga AI application, habang pinapasimple ng AZD ang proseso ng imprastruktura at pag-deploy.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay pinag-isang plataporma ng Microsoft para sa pag-develop ng AI na kinabibilangan ng:

- **Model Catalog**: Pag-access sa mga nangungunang AI na modelo
- **Prompt Flow**: Visual na designer para sa mga AI workflow
- **AI Foundry Portal**: Pinagsamang development environment para sa mga AI application
- **Deployment Options**: Maraming pagpipilian para sa hosting at pag-scale
- **Safety and Security**: Mga tampok para sa responsableng AI

## AZD + Microsoft Foundry: Mas Maganda nang Magkasama

| Tampok | Microsoft Foundry | Benepisyo ng Pagsasama sa AZD |
|---------|-----------------|------------------------|
| **Pag-deploy ng Modelo** | Manwal na pag-deploy sa portal | Awtomatikong, paulit-ulit na mga pag-deploy |
| **Imprastruktura** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Pamamahala ng Kapaligiran** | Pokus sa iisang kapaligiran | Maramihang kapaligiran (dev/staging/prod) |
| **CI/CD Integrasyon** | Limitado | Native na suporta sa GitHub Actions |
| **Pamamahala ng Gastos** | Batayang monitoring | Pag-optimize ng gastos na espesipiko sa kapaligiran |

## Mga Kinakailangan

- Azure subscription na may angkop na mga permiso
- Azure Developer CLI na naka-install
- Access sa Azure OpenAI services
- Pangunahing pamilyaridad sa Microsoft Foundry

## Pangunahing Mga Pattern ng Pagsasama

### Pattern 1: Azure OpenAI Integration

**Use Case**: I-deploy ang mga chat application gamit ang Azure OpenAI models

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

**Use Case**: I-deploy ang retrieval-augmented generation (RAG) applications

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

**Use Case**: Mga workflow para sa pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern ng Konfigurasyon

### Pag-set up ng Mga Variable ng Kapaligiran

**Konfigurasyon para sa Produksyon:**
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

**Konfigurasyon para sa Pag-unlad:**
```bash
# Mga setting na na-optimize para sa pag-develop nang may mababang gastos
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Libreng antas
```

### Ligtas na Konfigurasyon gamit ang Key Vault

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

## Mga Daloy ng Pag-deploy

### Pag-deploy sa Isang Utos

```bash
# I-deploy ang lahat gamit ang isang utos
azd up

# O i-deploy nang paunti-unti
azd provision  # Imprastruktura lamang
azd deploy     # Aplikasyon lamang
```

### Pag-deploy na Espesipiko sa Kapaligiran

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

## Pagsubaybay at Obserbabilidad

### Integrasyon ng Application Insights

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

### Pagsubaybay ng Gastos

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

## 🔐 Pinakamahusay na Mga Kasanayan sa Seguridad

### Konfigurasyon ng Managed Identity

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

### Seguridad ng Network

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

## Pag-optimize ng Pagganap

### Mga Estratehiya sa Caching

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

### Konfigurasyon ng Auto-scaling

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

## Pag-troubleshoot ng Karaniwang Mga Isyu

### Isyu 1: Lumabis ang Quota ng OpenAI

**Sintomas:**
- Nabibigo ang pag-deploy dahil sa mga error sa quota
- Mga 429 na error sa mga log ng application

**Mga Solusyon:**
```bash
# Suriin ang kasalukuyang paggamit ng quota
az cognitiveservices usage list --location eastus

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Pansamantalang bawasan ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Isyu 2: Pagkabigo sa Pag-authenticate

**Sintomas:**
- Mga 401/403 na error kapag tumatawag sa mga AI service
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Suriin ang mga itinalagang tungkulin
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Suriin ang konfigurasyon ng managed identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patunayan ang pag-access sa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isyu 3: Mga Isyu sa Pag-deploy ng Modelo

**Sintomas:**
- Hindi magagamit ang mga modelo sa deployment
- Mga partikular na bersyon ng modelo ang pumapalya

**Mga Solusyon:**
```bash
# Ilista ang mga magagamit na modelo ayon sa rehiyon
az cognitiveservices model list --location eastus

# I-update ang bersyon ng modelo sa bicep template
# Suriin ang mga kinakailangan sa kapasidad ng modelo
```

## Mga Halimbawang Template

### Batayang Chat Application

**Repositoryo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Cognitive Search + App Service

**Mabilis na Pagsisimula**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Document Processing Pipeline

**Repositoryo**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Mga Serbisyo**: Document Intelligence + Storage + Functions

**Mabilis na Pagsisimula**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat na may RAG

**Repositoryo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Mabilis na Pagsisimula**:
```bash
azd init --template contoso-chat
azd up
```

## Mga Susunod na Hakbang

1. **Subukan ang Mga Halimbawa**: Magsimula sa pre-built na template na tumutugma sa iyong use case
2. **I-customize para sa Iyong Pangangailangan**: Baguhin ang imprastruktura at application code
3. **Magdagdag ng Pagsubaybay**: Magpatupad ng komprehensibong obserbabilidad
4. **I-optimize ang Mga Gastos**: I-fine-tune ang mga konfigurasyon ayon sa iyong badyet
5. **Seguraduhin ang Iyong Pag-deploy**: Magpatupad ng mga enterprise security pattern
6. **I-scale sa Produksyon**: Magdagdag ng multi-region at high-availability na mga tampok

## 🎯 Praktikal na Mga Ehersisyo

### Ehersisyo 1: I-deploy ang Azure OpenAI Chat App (30 minuto)
**Layunin**: I-deploy at subukan ang production-ready na AI chat application

```bash
# I-inisyalisa ang template
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

**Pamantayan ng Tagumpay:**
- [ ] Nakumpleto ang pag-deploy nang walang mga error sa quota
- [ ] Maaaring ma-access ang chat interface sa browser
- [ ] Maaaring magtanong at makatanggap ng mga tugon na pinapagana ng AI
- [ ] Nagpapakita ang Application Insights ng telemetry data
- [ ] Matagumpay na nalinis ang mga resources

**Tinatayang Gastos**: $5-10 para sa 30 minutong pagsubok

### Ehersisyo 2: I-configure ang Pag-deploy ng Maramihang Modelo (45 minuto)
**Layunin**: I-deploy ang maramihang AI modelo na may iba't ibang konfigurasyon

```bash
# Gumawa ng pasadyang Bicep na konfigurasyon
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

# I-deploy at beripikahin
azd provision
azd show
```

**Pamantayan ng Tagumpay:**
- [ ] Maramihang modelo ang matagumpay na na-deploy
- [ ] Iba't ibang setting ng kapasidad ang naipatupad
- [ ] Maaaring ma-access ang mga modelo sa pamamagitan ng API
- [ ] Maaaring tawagin ang parehong mga modelo mula sa application

### Ehersisyo 3: Ipatupad ang Pagsubaybay ng Gastos (20 minuto)
**Layunin**: Mag-set up ng budget alerts at pagsubaybay ng gastos

```bash
# Magdagdag ng alerto ng badyet sa Bicep
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

# I-deploy ang alerto ng badyet
azd provision

# Suriin ang kasalukuyang gastos
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Pamantayan ng Tagumpay:**
- [ ] Nalikha ang budget alert sa Azure
- [ ] Nakakonpig ang mga email notification
- [ ] Maaaring makita ang data ng gastos sa Azure Portal
- [ ] Ang mga threshold ng budget ay naitakda nang angkop

## 💡 Mga Madalas Itanong

<details>
<summary><strong>Paano ko mababawasan ang gastos sa Azure OpenAI habang nagde-develop?</strong></summary>

1. **Gamitin ang Free Tier**: Nag-aalok ang Azure OpenAI ng 50,000 tokens/buwan nang libre
2. **Bawasan ang Kapasidad**: Itakda ang kapasidad sa 10 TPM sa halip na 30+ para sa dev
3. **Gamitin ang azd down**: I-deallocate ang mga resources kapag hindi aktibong nagde-develop
4. **I-cache ang Mga Tugon**: Magpatupad ng Redis cache para sa mga paulit-ulit na query
5. **Gumamit ng Prompt Engineering**: Bawasan ang paggamit ng token gamit ang mahusay na mga prompt

```bash
# Konfigurasyon ng pag-develop
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
- Mas mataas na mga quota ang magagamit

**OpenAI API**:
- Mas mabilis na access sa mga bagong modelo
- Mas simple ang setup
- Mas mababang hadlang sa pagsisimula
- Pampublikong internet lamang

Para sa mga production app, **inirerekomenda ang Azure OpenAI**.
</details>

<details>
<summary><strong>Paano ko haharapin ang mga error na lumalampas ang quota ng Azure OpenAI?</strong></summary>

```bash
# Suriin ang kasalukuyang kuota
az cognitiveservices usage list --location eastus2

# Subukan ang ibang rehiyon
azd env set AZURE_LOCATION westus2
azd up

# Pansamantalang bawasan ang kapasidad
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Humiling ng pagtaas ng kuota
# Pumunta sa Azure Portal > Kuota > Humiling ng pagtaas
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

Tingnan ang template na [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Paano ko sineseguro ang mga endpoint ng AI model?</strong></summary>

**Pinakamahusay na Mga Kasanayan**:
1. Gamitin ang Managed Identity (walang API keys)
2. I-enable ang Private Endpoints
3. I-configure ang mga network security group
4. Magpatupad ng rate limiting
5. Gamitin ang Azure Key Vault para sa mga secret

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

- **Discord ng Microsoft Foundry**: [#Azure channel](https://discord.gg/microsoft-azure)
- **GitHub ng AZD**: [Mga Isyu at mga diskusyon](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - Pag-unlad na Inuuna ang AI
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [Pag-deploy ng AI Model](ai-model-deployment.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Narito ang komunidad ng Azure AI + AZD upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng opisyal na impormasyon. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling‑tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
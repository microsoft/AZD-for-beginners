<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-21T11:24:04+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "da"
}
-->
# Microsoft Foundry-integration med AZD

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-First udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../getting-started/first-project.md)
- **➡️ Næste**: [AI-modeludrulning](ai-model-deployment.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Oversigt

Denne guide viser, hvordan man integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for at forenkle udrulning af AI-applikationer. Microsoft Foundry tilbyder en omfattende platform til at bygge, udrulle og administrere AI-applikationer, mens AZD gør infrastrukturen og udrulningsprocessen mere enkel.

## Hvad er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede platform til AI-udvikling, som inkluderer:

- **Modelkatalog**: Adgang til avancerede AI-modeller
- **Prompt Flow**: Visuel designer til AI-arbejdsgange
- **AI Foundry Portal**: Integreret udviklingsmiljø til AI-applikationer
- **Udrulningsmuligheder**: Flere hosting- og skaleringsmuligheder
- **Sikkerhed og ansvarlighed**: Indbyggede funktioner til ansvarlig AI

## AZD + Microsoft Foundry: Bedre sammen

| Funktion | Microsoft Foundry | Fordel ved AZD-integration |
|----------|-------------------|---------------------------|
| **Modeludrulning** | Manuel portaludrulning | Automatiserede, gentagelige udrulninger |
| **Infrastruktur** | Klik-baseret provisionering | Infrastruktur som kode (Bicep) |
| **Miljøstyring** | Fokus på ét miljø | Multi-miljø (dev/staging/prod) |
| **CI/CD-integration** | Begrænset | Indbygget GitHub Actions-support |
| **Omkostningsstyring** | Grundlæggende overvågning | Miljøspecifik optimering af omkostninger |

## Forudsætninger

- Azure-abonnement med passende tilladelser
- Azure Developer CLI installeret
- Adgang til Azure OpenAI-tjenester
- Grundlæggende kendskab til Microsoft Foundry

## Kerneintegrationsmønstre

### Mønster 1: Azure OpenAI-integration

**Anvendelsestilfælde**: Udrul chatapplikationer med Azure OpenAI-modeller

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

**Infrastruktur (main.bicep):**
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

### Mønster 2: AI-søgning + RAG-integration

**Anvendelsestilfælde**: Udrul retrieval-augmented generation (RAG)-applikationer

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

### Mønster 3: Dokumentintelligens-integration

**Anvendelsestilfælde**: Arbejdsgange til dokumentbehandling og analyse

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

## 🔧 Konfigurationsmønstre

### Opsætning af miljøvariabler

**Produktionskonfiguration:**
```bash
# Kerne-AI-tjenester
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelkonfigurationer
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Ydelsesindstillinger
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Udviklingskonfiguration:**
```bash
# Omkostningsoptimerede indstillinger til udvikling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratis niveau
```

### Sikker konfiguration med Key Vault

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

## Udrulningsarbejdsgange

### Udrulning med én kommando

```bash
# Udrul alt med én kommando
azd up

# Eller udrul gradvist
azd provision  # Kun infrastruktur
azd deploy     # Kun applikation
```

### Miljøspecifikke udrulninger

```bash
# Udviklingsmiljø
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produktionsmiljø
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Overvågning og synlighed

### Integration med Application Insights

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

### Omkostningsovervågning

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

## 🔐 Sikkerhedsbedste praksis

### Konfiguration af Managed Identity

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

### Netværkssikkerhed

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

## Ydelsesoptimering

### Cache-strategier

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

### Konfiguration af autoskalering

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

## Fejlfinding af almindelige problemer

### Problem 1: OpenAI-kvote overskredet

**Symptomer:**
- Udrulning fejler med kvotefejl
- 429-fejl i applikationslogfiler

**Løsninger:**
```bash
# Kontroller nuværende kvoteforbrug
az cognitiveservices usage list --location eastus

# Prøv en anden region
azd env set AZURE_LOCATION westus2
azd up

# Reducer kapaciteten midlertidigt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Godkendelsesfejl

**Symptomer:**
- 401/403-fejl ved kald til AI-tjenester
- "Adgang nægtet"-meddelelser

**Løsninger:**
```bash
# Bekræft rolle tildelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontroller konfiguration af administreret identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider adgang til Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemer med modeludrulning

**Symptomer:**
- Modeller er ikke tilgængelige i udrulningen
- Specifikke modelversioner fejler

**Løsninger:**
```bash
# Liste tilgængelige modeller efter region
az cognitiveservices model list --location eastus

# Opdater modelversion i bicep-skabelon
# Kontroller modelkapacitetskrav
```

## Eksempeltemplates

### Grundlæggende chatapplikation

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Cognitive Search + App Service

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentbehandlingspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Tjenester**: Dokumentintelligens + Storage + Functions

**Hurtig start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise-chat med RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Hurtig start**:
```bash
azd init --template contoso-chat
azd up
```

## Næste skridt

1. **Prøv eksemplerne**: Start med en forudbygget template, der passer til dit anvendelsestilfælde
2. **Tilpas til dine behov**: Rediger infrastrukturen og applikationskoden
3. **Tilføj overvågning**: Implementer omfattende synlighed
4. **Optimer omkostninger**: Finjuster konfigurationer til dit budget
5. **Sikre din udrulning**: Implementer sikkerhedsmønstre til virksomheder
6. **Skalér til produktion**: Tilføj multi-region og høj tilgængelighed

## 🎯 Praktiske øvelser

### Øvelse 1: Udrul Azure OpenAI-chatapp (30 minutter)
**Mål**: Udrul og test en produktionsklar AI-chatapplikation

```bash
# Initialiser skabelon
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Indstil miljøvariabler
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Udrul
azd up

# Test applikationen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Overvåg AI-operationer
azd monitor

# Ryd op
azd down --force --purge
```

**Succeskriterier:**
- [ ] Udrulning fuldføres uden kvotefejl
- [ ] Kan tilgå chatgrænsefladen i browseren
- [ ] Kan stille spørgsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressourcer ryddes op med succes

**Estimerede omkostninger**: $5-10 for 30 minutters test

### Øvelse 2: Konfigurer multi-model udrulning (45 minutter)
**Mål**: Udrul flere AI-modeller med forskellige konfigurationer

```bash
# Opret brugerdefineret Bicep-konfiguration
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

# Udrul og verificer
azd provision
azd show
```

**Succeskriterier:**
- [ ] Flere modeller udrullet med succes
- [ ] Forskellige kapacitetsindstillinger anvendt
- [ ] Modeller tilgængelige via API
- [ ] Kan kalde begge modeller fra applikationen

### Øvelse 3: Implementer omkostningsovervågning (20 minutter)
**Mål**: Opsæt budgetalarmer og omkostningssporing

```bash
# Tilføj budgetadvarsel til Bicep
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

# Udrul budgetadvarsel
azd provision

# Kontroller aktuelle omkostninger
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Succeskriterier:**
- [ ] Budgetalarm oprettet i Azure
- [ ] E-mailnotifikationer konfigureret
- [ ] Kan se omkostningsdata i Azure Portal
- [ ] Budgetgrænser sat korrekt

## 💡 Ofte stillede spørgsmål

<details>
<summary><strong>Hvordan reducerer jeg Azure OpenAI-omkostninger under udvikling?</strong></summary>

1. **Brug gratis niveau**: Azure OpenAI tilbyder 50.000 tokens/måned gratis
2. **Reducer kapacitet**: Sæt kapacitet til 10 TPM i stedet for 30+ under udvikling
3. **Brug azd down**: Dealloker ressourcer, når du ikke aktivt udvikler
4. **Cache svar**: Implementer Redis-cache til gentagne forespørgsler
5. **Brug prompt engineering**: Reducer tokenforbrug med effektive prompts

```bash
# Udviklingskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Hvad er forskellen mellem Azure OpenAI og OpenAI API?</strong></summary>

**Azure OpenAI**:
- Sikkerhed og overholdelse for virksomheder
- Integration med private netværk
- SLA-garantier
- Godkendelse med Managed Identity
- Højere kvoter tilgængelige

**OpenAI API**:
- Hurtigere adgang til nye modeller
- Simpel opsætning
- Lavere adgangsbarriere
- Kun offentlig internet

Til produktionsapplikationer anbefales **Azure OpenAI**.
</details>

<details>
<summary><strong>Hvordan håndterer jeg Azure OpenAI-kvote overskredet fejl?</strong></summary>

```bash
# Kontroller nuværende kvote
az cognitiveservices usage list --location eastus2

# Prøv en anden region
azd env set AZURE_LOCATION westus2
azd up

# Reducer kapacitet midlertidigt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Anmod om kvoteforøgelse
# Gå til Azure Portal > Kvoter > Anmod om forøgelse
```
</details>

<details>
<summary><strong>Kan jeg bruge mine egne data med Azure OpenAI?</strong></summary>

Ja! Brug **Azure AI Search** til RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)-templaten.
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI-modelendepunkter?</strong></summary>

**Bedste praksis**:
1. Brug Managed Identity (ingen API-nøgler)
2. Aktiver Private Endpoints
3. Konfigurer netværkssikkerhedsgrupper
4. Implementer ratebegrænsning
5. Brug Azure Key Vault til hemmeligheder

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

## Fællesskab og support

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues og diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-First udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../getting-started/first-project.md)
- **➡️ Næste**: [AI-modeludrulning](ai-model-deployment.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskabsdiskussioner eller opret en issue i repositoryet. Azure AI + AZD-fællesskabet er her for at hjælpe dig med at få succes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-21T11:22:30+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "sv"
}
-->
# Microsoft Foundry-integration med AZD

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 2 - AI-Driven Utveckling
- **⬅️ Föregående Kapitel**: [Kapitel 1: Ditt Första Projekt](../getting-started/first-project.md)
- **➡️ Nästa**: [AI-Modellutplacering](ai-model-deployment.md)
- **🚀 Nästa Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Översikt

Den här guiden visar hur du integrerar Microsoft Foundry-tjänster med Azure Developer CLI (AZD) för smidiga AI-applikationsutplaceringar. Microsoft Foundry erbjuder en omfattande plattform för att bygga, distribuera och hantera AI-applikationer, medan AZD förenklar infrastrukturen och utplaceringsprocessen.

## Vad är Microsoft Foundry?

Microsoft Foundry är Microsofts enhetliga plattform för AI-utveckling som inkluderar:

- **Modellkatalog**: Tillgång till toppmoderna AI-modeller
- **Prompt Flow**: Visuell designer för AI-arbetsflöden
- **AI Foundry Portal**: Integrerad utvecklingsmiljö för AI-applikationer
- **Utplaceringsalternativ**: Flera hosting- och skalningsalternativ
- **Säkerhet och trygghet**: Inbyggda funktioner för ansvarsfull AI

## AZD + Microsoft Foundry: Bättre Tillsammans

| Funktion | Microsoft Foundry | Fördel med AZD-integration |
|----------|-------------------|---------------------------|
| **Modellutplacering** | Manuell portalutplacering | Automatiserade, upprepbara utplaceringar |
| **Infrastruktur** | Klickbaserad provisionering | Infrastruktur som kod (Bicep) |
| **Miljöhantering** | Fokus på en miljö | Flera miljöer (utveckling/staging/produktion) |
| **CI/CD Integration** | Begränsad | Inbyggt stöd för GitHub Actions |
| **Kostnadshantering** | Grundläggande övervakning | Miljöspecifik kostnadsoptimering |

## Förutsättningar

- Azure-prenumeration med lämpliga behörigheter
- Azure Developer CLI installerad
- Tillgång till Azure OpenAI-tjänster
- Grundläggande kunskap om Microsoft Foundry

## Kärnintegrationsmönster

### Mönster 1: Azure OpenAI Integration

**Användningsfall**: Distribuera chattapplikationer med Azure OpenAI-modeller

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

### Mönster 2: AI-sökning + RAG Integration

**Användningsfall**: Distribuera applikationer med retrieval-augmented generation (RAG)

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

### Mönster 3: Dokumentintelligens Integration

**Användningsfall**: Dokumentbearbetning och analysarbetsflöden

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

## 🔧 Konfigurationsmönster

### Inställning av miljövariabler

**Produktionskonfiguration:**
```bash
# Kärn-AI-tjänster
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurationer
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Prestandainställningar
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Utvecklingskonfiguration:**
```bash
# Kostnadsoptimerade inställningar för utveckling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratisnivå
```

### Säker konfiguration med Key Vault

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

## Utplaceringsarbetsflöden

### Utplacering med ett kommando

```bash
# Distribuera allt med ett kommando
azd up

# Eller distribuera stegvis
azd provision  # Endast infrastruktur
azd deploy     # Endast applikation
```

### Miljöspecifika utplaceringar

```bash
# Utvecklingsmiljö
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produktionsmiljö
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Övervakning och Observabilitet

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

### Kostnadsövervakning

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

## 🔐 Säkerhetsbästa praxis

### Konfiguration av hanterad identitet

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

### Nätverkssäkerhet

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

## Prestandaoptimering

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

### Konfiguration av autoskalning

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

## Felsökning av vanliga problem

### Problem 1: Överskriden OpenAI-kvot

**Symptom:**
- Utplacering misslyckas med kvotfel
- 429-fel i applikationsloggar

**Lösningar:**
```bash
# Kontrollera aktuell kvotanvändning
az cognitiveservices usage list --location eastus

# Prova en annan region
azd env set AZURE_LOCATION westus2
azd up

# Minska kapaciteten tillfälligt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Autentiseringsfel

**Symptom:**
- 401/403-fel vid anrop till AI-tjänster
- "Åtkomst nekad"-meddelanden

**Lösningar:**
```bash
# Verifiera rolltilldelningar
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrollera konfigurationen för hanterad identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validera åtkomst till Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problem med modellutplacering

**Symptom:**
- Modeller är inte tillgängliga i utplaceringen
- Specifika modellversioner misslyckas

**Lösningar:**
```bash
# Lista tillgängliga modeller per region
az cognitiveservices model list --location eastus

# Uppdatera modellversion i bicep-mall
# Kontrollera modellens kapacitetskrav
```

## Exempelmallar

### Grundläggande chattapplikation

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjänster**: Azure OpenAI + Cognitive Search + App Service

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentbearbetningspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Tjänster**: Dokumentintelligens + Lagring + Funktioner

**Snabbstart**:
```bash
azd init --template ai-document-processing
azd up
```

### Företagschatt med RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjänster**: Azure OpenAI + Sökning + Container Apps + Cosmos DB

**Snabbstart**:
```bash
azd init --template contoso-chat
azd up
```

## Nästa Steg

1. **Testa Exemplen**: Börja med en förbyggd mall som matchar ditt användningsfall
2. **Anpassa efter Dina Behov**: Modifiera infrastrukturen och applikationskoden
3. **Lägg till Övervakning**: Implementera omfattande observabilitet
4. **Optimera Kostnader**: Finjustera konfigurationer för din budget
5. **Säkra Din Utplacering**: Implementera säkerhetsmönster för företag
6. **Skala till Produktion**: Lägg till multiregion och hög tillgänglighet

## 🎯 Praktiska Övningar

### Övning 1: Distribuera Azure OpenAI Chattapp (30 minuter)
**Mål**: Distribuera och testa en produktionsklar AI-chattapplikation

```bash
# Initiera mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ställ in miljövariabler
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Distribuera
azd up

# Testa applikationen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Övervaka AI-operationer
azd monitor

# Rensa upp
azd down --force --purge
```

**Framgångskriterier:**
- [ ] Utplaceringen slutförs utan kvotfel
- [ ] Kan komma åt chattgränssnittet i webbläsaren
- [ ] Kan ställa frågor och få AI-drivna svar
- [ ] Application Insights visar telemetridata
- [ ] Resurser har rensats framgångsrikt

**Beräknad Kostnad**: $5-10 för 30 minuters testning

### Övning 2: Konfigurera Multi-Modell Utplacering (45 minuter)
**Mål**: Distribuera flera AI-modeller med olika konfigurationer

```bash
# Skapa anpassad Bicep-konfiguration
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

# Distribuera och verifiera
azd provision
azd show
```

**Framgångskriterier:**
- [ ] Flera modeller distribuerade framgångsrikt
- [ ] Olika kapacitetsinställningar tillämpade
- [ ] Modeller tillgängliga via API
- [ ] Kan anropa båda modellerna från applikationen

### Övning 3: Implementera Kostnadsövervakning (20 minuter)
**Mål**: Ställ in budgetvarningar och kostnadsspårning

```bash
# Lägg till budgetvarning till Bicep
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

# Distribuera budgetvarning
azd provision

# Kontrollera aktuella kostnader
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Framgångskriterier:**
- [ ] Budgetvarning skapad i Azure
- [ ] E-postmeddelanden konfigurerade
- [ ] Kan visa kostnadsdata i Azure Portal
- [ ] Budgetgränser inställda korrekt

## 💡 Vanliga Frågor

<details>
<summary><strong>Hur kan jag minska Azure OpenAI-kostnader under utveckling?</strong></summary>

1. **Använd Gratisnivå**: Azure OpenAI erbjuder 50,000 tokens/månad gratis
2. **Minska Kapacitet**: Ställ in kapacitet till 10 TPM istället för 30+ för utveckling
3. **Använd azd down**: Frigör resurser när du inte aktivt utvecklar
4. **Cache Svar**: Implementera Redis-cache för upprepade frågor
5. **Använd Prompt Engineering**: Minska tokenanvändning med effektiva prompts

```bash
# Utvecklingskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Vad är skillnaden mellan Azure OpenAI och OpenAI API?</strong></summary>

**Azure OpenAI**:
- Företagssäkerhet och efterlevnad
- Integration med privat nätverk
- SLA-garantier
- Autentisering med hanterad identitet
- Högre kvoter tillgängliga

**OpenAI API**:
- Snabbare tillgång till nya modeller
- Enklare installation
- Lägre tröskel för att komma igång
- Endast offentligt internet

För produktionsapplikationer rekommenderas **Azure OpenAI**.
</details>

<details>
<summary><strong>Hur hanterar jag fel relaterade till överskriden Azure OpenAI-kvot?</strong></summary>

```bash
# Kontrollera aktuell kvot
az cognitiveservices usage list --location eastus2

# Försök med en annan region
azd env set AZURE_LOCATION westus2
azd up

# Minska kapaciteten tillfälligt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Begär kvotökning
# Gå till Azure Portal > Kvoter > Begär ökning
```
</details>

<details>
<summary><strong>Kan jag använda mina egna data med Azure OpenAI?</strong></summary>

Ja! Använd **Azure AI Search** för RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Se mallen [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Hur säkrar jag AI-modellens slutpunkter?</strong></summary>

**Bästa Praxis**:
1. Använd Hanterad Identitet (inga API-nycklar)
2. Aktivera Privata Slutpunkter
3. Konfigurera nätverkssäkerhetsgrupper
4. Implementera hastighetsbegränsning
5. Använd Azure Key Vault för hemligheter

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

## Community och Support

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problem och diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiell dokumentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 2 - AI-Driven Utveckling
- **⬅️ Föregående Kapitel**: [Kapitel 1: Ditt Första Projekt](../getting-started/first-project.md)
- **➡️ Nästa**: [AI-Modellutplacering](ai-model-deployment.md)
- **🚀 Nästa Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Behöver Hjälp?** Gå med i våra communitydiskussioner eller öppna ett problem i repositoryn. Azure AI + AZD-communityn är här för att hjälpa dig lyckas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
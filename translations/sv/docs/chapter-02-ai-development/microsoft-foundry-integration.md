# Microsoft Foundry-integration med AZD

**Kapitelnavigering:**
- **📚 Kursöversikt**: [AZD För nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [Distribuering av AI-modell](ai-model-deployment.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Översikt

Denna guide visar hur du integrerar Microsoft Foundry-tjänster med Azure Developer CLI (AZD) för strömlinjeformade distributioner av AI-applikationer. Microsoft Foundry erbjuder en omfattande plattform för att bygga, distribuera och hantera AI-applikationer, medan AZD förenklar infrastruktur- och distributionsprocessen.

## Vad är Microsoft Foundry?

Microsoft Foundry är Microsofts enade plattform för AI-utveckling som inkluderar:

- **Model Catalog**: Tillgång till toppmoderna AI-modeller
- **Prompt Flow**: Visuell designer för AI-arbetsflöden
- **AI Foundry Portal**: Integrerad utvecklingsmiljö för AI-applikationer
- **Deployment Options**: Flera värd- och skalningsalternativ
- **Safety and Security**: Inbyggda ansvariga AI-funktioner

## AZD + Microsoft Foundry: Bättre tillsammans

| Funktion | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Förutsättningar

- Azure-prenumeration med lämpliga behörigheter
- Azure Developer CLI installerad
- Åtkomst till Azure OpenAI-tjänster
- Grundläggande kännedom om Microsoft Foundry

## Huvudsakliga integrationsmönster

### Mönster 1: Azure OpenAI-integration

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

### Mönster 2: AI-sökning + RAG-integrering

**Användningsfall**: Distribuera applikationer för retrieval-augmented generation (RAG)

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

### Mönster 3: Integrering av dokumentintelligens

**Användningsfall**: Arbetsflöden för dokumentbehandling och analys

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

## Distributionsarbetsflöden

### Distribution med ett enda kommando

```bash
# Distribuera allt med ett kommando
azd up

# Eller distribuera stegvis
azd provision  # Endast infrastruktur
azd deploy     # Endast applikation
```

### Miljöspecifika distributioner

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

## Övervakning och observerbarhet

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

### Konfigurering av hanterad identitet

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

### Cachingstrategier

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

### Konfiguration för automatisk skalning

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

### Problem 1: OpenAI-kvot överskriden

**Symtom:**
- Distribution misslyckas med kvotfel
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

**Symtom:**
- 401/403-fel vid anrop av AI-tjänster
- "Access denied"-meddelanden

**Lösningar:**
```bash
# Verifiera rolltilldelningar
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrollera konfigurationen för hanterad identitet
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validera åtkomst till Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problem vid modelldistribution

**Symtom:**
- Modeller ej tillgängliga i distributionen
- Specifika modellversioner misslyckas

**Lösningar:**
```bash
# Lista tillgängliga modeller per region
az cognitiveservices model list --location eastus

# Uppdatera modellversionen i bicep-mallen
# Kontrollera modellens kapacitetskrav
```

## Exempelmallar

### Enkel chattapplikation

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjänster**: Azure OpenAI + Cognitive Search + App Service

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline för dokumentbearbetning

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Tjänster**: Document Intelligence + Storage + Functions

**Snabbstart**:
```bash
azd init --template ai-document-processing
azd up
```

### Företagschatt med RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjänster**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Snabbstart**:
```bash
azd init --template contoso-chat
azd up
```

## Nästa steg

1. **Prova exemplen**: Börja med en färdig mall som matchar ditt användningsfall
2. **Anpassa efter dina behov**: Modifiera infrastrukturen och applikationskoden
3. **Lägg till övervakning**: Implementera omfattande observerbarhet
4. **Optimera kostnader**: Finjustera konfigurationerna för din budget
5. **Säkra din distribution**: Implementera företagsnivåns säkerhetsmönster
6. **Skala till produktion**: Lägg till multiregion och hög tillgänglighet

## 🎯 Praktiska övningar

### Övning 1: Distribuera Azure OpenAI-chattapp (30 minuter)
**Mål**: Distribuera och testa en produktionsklar AI-chattapplikation

```bash
# Initiera mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ange miljövariabler
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
- [ ] Distributionen slutförs utan kvotfel
- [ ] Kan nå chattgränssnittet i webbläsaren
- [ ] Kan ställa frågor och få AI-drivna svar
- [ ] Application Insights visar telemetridata
- [ ] Resurser har städats upp framgångsrikt

**Beräknad kostnad**: $5-10 för 30 minuters testning

### Övning 2: Konfigurera distribution av flera modeller (45 minuter)
**Mål**: Distribuera flera AI-modeller med olika konfigurationer

```bash
# Skapa en anpassad Bicep-konfiguration
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
- [ ] Modeller åtkomliga via API
- [ ] Kan anropa båda modellerna från applikationen

### Övning 3: Implementera kostnadsövervakning (20 minuter)
**Mål**: Ställ in budgetaviseringar och kostnadsspårning

```bash
# Lägg till budgetvarning i Bicep
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
- [ ] Budgetavisering skapad i Azure
- [ ] E-postaviseringar konfigurerade
- [ ] Kan visa kostnadsdata i Azure-portalen
- [ ] Budgettrösklar korrekt inställda

## 💡 Vanliga frågor

<details>
<summary><strong>Hur minskar jag Azure OpenAI-kostnader under utveckling?</strong></summary>

1. **Använd gratisnivån**: Azure OpenAI erbjuder 50,000 tokens/månad gratis
2. **Minska kapaciteten**: Ställ in kapacitet till 10 TPM istället för 30+ för utveckling
3. **Använd azd down**: Avallokera resurser när du inte aktivt utvecklar
4. **Cachea svar**: Implementera Redis-cache för upprepade förfrågningar
5. **Använd prompt engineering**: Minska tokenanvändning med effektiva prompts

```bash
# Utvecklingskonfiguration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Vad är skillnaden mellan Azure OpenAI och OpenAI API?</strong></summary>

**Azure OpenAI**:
- Företagsklassad säkerhet och efterlevnad
- Privat nätverksintegration
- SLA-garantier
- Hanterad identitetsautentisering
- Högre kvoter tillgängliga

**OpenAI API**:
- Snabbare åtkomst till nya modeller
- Enklare uppsättning
- Lättare att komma igång
- Endast offentlig internetåtkomst

För produktionsapplikationer rekommenderas **Azure OpenAI**.
</details>

<details>
<summary><strong>Hur hanterar jag fel för överskriden Azure OpenAI-kvot?</strong></summary>

```bash
# Kontrollera aktuell kvot
az cognitiveservices usage list --location eastus2

# Prova en annan region
azd env set AZURE_LOCATION westus2
azd up

# Minska kapaciteten tillfälligt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Begär ökning av kvoten
# Gå till Azure-portalen > Kvoter > Begär ökning
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
<summary><strong>Hur säkrar jag AI-modellendpoints?</strong></summary>

**Bästa praxis**:
1. Använd Managed Identity (inga API-nycklar)
2. Aktivera privata endpoints
3. Konfigurera nätverkssäkerhetsgrupper
4. Implementera rate limiting
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

## Gemenskap och support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiell dokumentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Kapitelnavigering:**
- **📚 Kursöversikt**: [AZD För nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [Distribuering av AI-modell](ai-model-deployment.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i våra community-diskussioner eller öppna ett issue i repositoryt. Azure AI + AZD-communityn finns här för att hjälpa dig lyckas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på dess ursprungliga språk ska anses vara den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
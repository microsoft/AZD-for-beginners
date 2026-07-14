# Microsoft Foundry-integrasjon med AZD

**Kapittelnavigering:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige kapittel**: [Kapittel 1: Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [AI-modell distribusjon](ai-model-deployment.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Oversikt

Denne guiden viser hvordan man integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinjeformede AI-applikasjonsdistribusjoner. Microsoft Foundry gir en omfattende plattform for å bygge, distribuere og administrere AI-applikasjoner, mens AZD forenkler infrastruktur- og distribusjonsprosessen.

## Hva er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede plattform for AI-utvikling som inkluderer:

- **Modellkatalog**: Tilgang til toppmoderne AI-modeller
- **Prompt Flow**: Visuell designer for AI-arbeidsflyter
- **Microsoft Foundry Portal**: Integrert utviklingsmiljø for AI-applikasjoner
- **Distribusjonsmuligheter**: Flere hosting- og skaleringsalternativer
- **Sikkerhet og beskyttelse**: Innebygde ansvarlige AI-funksjoner

## AZD + Microsoft Foundry: Bedre sammen

| Funksjon | Microsoft Foundry | Fordel med AZD-integrasjon |
|---------|-----------------|------------------------|
| **Modell distribusjon** | Manuell portal distribusjon | Automatiserte, repeterbare distribusjoner |
| **Infrastruktur** | Klikk-gjennom provisjonering | Infrastruktur som kode (Bicep) |
| **Miljøhåndtering** | Fokus på enkeltmiljø | Multi-miljø (utv/prøve/produksjon) |
| **CI/CD-integrasjon** | Begrenset | Innebygd støtte for GitHub Actions |
| **Kostnadshåndtering** | Grunnleggende overvåkning | Miljøspesifikk kostnadsoptimalisering |

## Forutsetninger

- Azure-abonnement med passende tillatelser
- Azure Developer CLI installert
- Tilgang til Microsoft Foundry Models-tjenester
- Grunnleggende kjennskap til Microsoft Foundry

> **Nåværende AZD-versjon:** Disse eksemplene ble gjennomgått med `azd` `1.27.1`. For AI-agent-arbeidsflyten, bruk gjeldende forhåndsutgivelsesutgave av utvidelsen og sjekk din installerte versjon før du begynner.

## Grunnleggende integrasjonsmønstre

### Mønster 1: Microsoft Foundry Models integrasjon

**Brukstilfelle**: Distribuer chat-applikasjoner med Microsoft Foundry Models modeller

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

### Mønster 2: AI-søk + RAG-integrasjon

**Brukstilfelle**: Distribuer retrieval-augmented generation (RAG)-applikasjoner

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

### Mønster 3: Dokumentintelligens-integrasjon

**Brukstilfelle**: Arbeidsflyter for dokumentbehandling og analyse

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

## 🔧 Konfigurasjonsmønstre

### Oppsett av miljøvariabler

**Produksjonskonfigurasjon:**
```bash
# Kjerne AI-tjenester
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurasjoner
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Ytelsesinnstillinger
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Utviklingskonfigurasjon:**
```bash
# Kostnadsoptimaliserte innstillinger for utvikling
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Gratisnivå
```

### Sikker konfigurasjon med Key Vault

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

## Distribusjonsarbeidsflyter

### AZD-utvidelser for Foundry

AZD tilbyr utvidelser som legger til AI-spesifikke funksjoner for arbeid med Microsoft Foundry-tjenester:

```bash
# Installer Foundry-agentutvidelsen
azd extension install azure.ai.agents

# Installer finjusteringsutvidelsen
azd extension install azure.ai.finetune

# Installer utvidelsen for egendefinerte modeller
azd extension install azure.ai.models

# List opp installerte utvidelser
azd extension list --installed

# Undersøk gjeldende installerte versjon av agentutvidelsen
azd extension show azure.ai.agents
```

AI-utvidelsene utvikles fortsatt raskt i forhåndsvisning. Hvis en kommando oppfører seg annerledes enn vist her, oppgrader den relevante utvidelsen før du feilsøker prosjektet.

### Agent-først distribusjon med `azd ai`

Hvis du har en agentmanifest, bruk `azd ai agent init` for å lage et prosjekt koblet til Foundry Agent Service:

```bash
# Initialiser fra en agentmanifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Distribuer til Azure
azd up
```

Nylige forhåndsutgivelser av `azure.ai.agents` har også lagt til malbasert initieringsstøtte for `azd ai agent init`. Hvis du følger nyere agenteksempler, sjekk utvidelsens hjelp for eksakte tilgjengelige flagg i din installerte versjon.

Se [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fullstendig kommandooversikt og flagg.

### Distribusjon med enkeltkommando

```bash
# Distribuer alt med én kommando
azd up

# Eller distribuer inkrementelt
azd provision  # Kun infrastruktur
azd deploy     # Kun applikasjon

# For langvarige AI-appdistribusjoner i azd 1.23.11+
azd deploy --timeout 1800
```

### Miljøspesifikke distribusjoner

```bash
# Utviklingsmiljø
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produksjonsmiljø
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Overvåkning og observabilitet

### Application Insights-integrasjon

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

### Kostnadsovervåkning

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

## 🔐 Sikkerhetsbeste praksis

### Administrert identitetskonfigurasjon

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

### Nettverkssikkerhet

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

## Ytelsesoptimalisering

### Caching-strategier

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

### Autoskaleringskonfigurasjon

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

## Feilsøking av vanlige problemer

### Problem 1: OpenAI-kvote overskredet

**Symptomer:**
- Distribusjon mislykkes med kvotafeil
- 429-feil i applikasjonslogger

**Løsninger:**
```bash
# Sjekk gjeldende kvotabruk
az cognitiveservices usage list --location eastus

# Prøv en annen region
azd env set AZURE_LOCATION westus2
azd up

# Reduser kapasiteten midlertidig
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Autentiseringsfeil

**Symptomer:**
- 401/403-feil ved kall til AI-tjenester
- "Access denied" meldinger

**Løsninger:**
```bash
# Verifiser rolleoppdragelser
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Sjekk administrert identitetskonfigurasjon
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Valider tilgang til Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Modell distribusjonsproblemer

**Symptomer:**
- Modeller ikke tilgjengelig i distribusjon
- Spesifikke modellversjoner feiler

**Løsninger:**
```bash
# List tilgjengelige modeller etter region
az cognitiveservices model list --location eastus

# Oppdater modellversjon i bicep-mal
# Sjekk modellens kapasitetskrav
```

## Eksempelmaler

### RAG Chat-applikasjon (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: Den mest populære Azure AI-eksempelkoden — en produksjonsklar RAG chat-app som lar deg stille spørsmål om dine egne dokumenter. Bruker GPT-4.1-mini for chat, text-embedding-3-large for innbygginger, og Azure AI Search for gjenfinning. Støtter multimodale dokumenter, taleinn- og utgang, Microsoft Entra-autentisering og Application Insights-sporing.

**Kom raskt i gang**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat-applikasjon (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C#-ekvivalenten til Python RAG chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly frontend. Inkluderer talebasert chat, GPT-4o-mini visjonsstøtte, og en følgesvenn .NET MAUI Blazor Hybrid desktop/mobil-klient.

**Kom raskt i gang**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat-applikasjon (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-versjon av RAG chat-eksemplet ved bruk av Langchain4J for AI-orchestration. Støtter mikrotjenestearkitektur med hendelsesdrevet modell, flere søkestrategier (tekst, vektor, hybrid), dokumentopplasting med Azure Document Intelligence, og distribusjon på enten Azure Container Apps eller Azure Kubernetes Service.

**Kom raskt i gang**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: Helhetlig retail RAG copilot ved bruk av Microsoft Foundry og Prompty. En Contoso Outdoor retail chatbot som baserer svar på produktkatalog og kundebestillingsdata. Demonstrerer hele GenAIOps-arbeidsflyten — prototype med Prompty, evaluering med AI-assisterte evaluatorer, og distribusjon via AZD til Container Apps.

**Kom raskt i gang**:
```bash
azd init --template contoso-chat
azd up
```

### Multi-agent kreativ skriving-applikasjon

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent eksempel som demonstrerer AI-agent orkestrering med Prompty. Bruker en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en forfatteragent og en redaktøragent for å samarbeide om produksjon av veldokumenterte artikler. Inkluderer CI/CD med evaluering i GitHub Actions.

**Kom raskt i gang**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverløs RAG-chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beskrivelse**: Fullstendig serverløs RAG chatbot ved bruk av LangChain.js med Azure Functions for API og Azure Static Web Apps for hosting. Bruker Azure Cosmos DB som både vektorlager og chatthistorikkdatabase. Støtter lokal utvikling med Ollama for kostnadsfri testing.

**Kom raskt i gang**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat med din data-løsningakselerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Beskrivelse**: Enterprise-grade RAG-løsningsakselerator med administrasjonsportal for dokumentopplasting/administrasjon, flere orkestratoralternativer (Semantic Kernel, LangChain, Prompt Flow), tale-til-tekst, Microsoft Teams-integrasjon, og valg av PostgreSQL eller Cosmos DB backend. Designet som et tilpassbart utgangspunkt for produksjonsscenarioer for RAG.

**Kom raskt i gang**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Reiseagenter — Multi-agent MCP orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-servere (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referanseapplikasjon for multi-agent AI-orkestrering ved bruk av tre rammeverk (LangChain.js, LlamaIndex.TS, og Microsoft Agent Framework). Har MCP (Model Context Protocol)-servere i fire språk distribuert som serverløse Azure Container Apps med OpenTelemetry-overvåkning.

**Kom raskt i gang**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Tjenester**: Azure AI Services + Azure OpenAI

**Beskrivelse**: Minimal Bicep-mal som distribuerer Azure AI-tjenester med konfigurerte maskinlæringsmodeller. Et lettvekts-utgangspunkt når du bare trenger å provisjonere Azure AI-infrastrukturen uten full applikasjonsstack.

**Kom raskt i gang**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Utforsk flere maler**: Besøk [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-spesifikke AZD-maler på tvers av språk og scenarioer.

## Neste steg

1. **Prøv eksemplene**: Start med en forhåndsbygget mal som matcher ditt brukstilfelle
2. **Tilpass for dine behov**: Endre infrastruktur og applikasjonskode
3. **Legg til overvåkning**: Implementer omfattende observabilitet
4. **Optimaliser kostnader**: Finjuster konfigurasjoner for ditt budsjett
5. **Sikre din distribusjon**: Implementer bedriftsikkerhetsmønstre
6. **Skaler til produksjon**: Legg til multi-region og høy tilgjengelighet

## 🎯 Praktiske øvelser

### Øvelse 1: Distribuer Microsoft Foundry Models Chat App (30 minutter)
**Mål**: Distribuer og test en produksjonsklar AI chat-applikasjon

```bash
# Initialiser mal
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Sett miljøvariabler
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Distribuer
azd up

# Test applikasjonen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Overvåk AI-operasjoner
azd monitor

# Rydd opp
azd down --force --purge
```

**Kriterier for suksess:**
- [ ] Distribusjonen fullføres uten kvotafeil
- [ ] Kan få tilgang til chattegrensesnitt i nettleser
- [ ] Kan stille spørsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressurser ryddes opp med suksess

**Estimert kostnad**: 5-10 USD for 30 minutter testing

### Øvelse 2: Konfigurer multi-modell distribusjon (45 minutter)
**Mål**: Distribuer flere AI-modeller med forskjellige konfigurasjoner

```bash
# Lag egendefinert Bicep-konfigurasjon
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

# Distribuer og verifiser
azd provision
azd show
```

**Kriterier for suksess:**
- [ ] Flere modeller distribuert med suksess
- [ ] Ulike kapasitetsinnstillinger brukt
- [ ] Modeller tilgjengelig via API
- [ ] Kan kalle begge modeller fra applikasjon

### Øvelse 3: Implementer kostnadsovervåkning (20 minutter)
**Mål**: Sett opp budsjettvarsler og kostnadssporing

```bash
# Legg til budsjettvarsling i Bicep
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

# Distribuer budsjettvarsling
azd provision

# Sjekk nåværende kostnader
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriterier for suksess:**
- [ ] Budsjettvarsel opprettet i Azure
- [ ] E-postvarsler konfigurert
- [ ] Kan se kostnadsdata i Azure-portalen
- [ ] Budsjettgrenser satt riktig

## 💡 Ofte stilte spørsmål

<details>
<summary><strong>Hvordan reduserer jeg Microsoft Foundry Models-kostnader under utvikling?</strong></summary>

1. **Bruk gratisnivå**: Microsoft Foundry Models tilbyr 50 000 tokens/måned gratis
2. **Reduser kapasitet**: Sett kapasitet til 10 TPM i stedet for 30+ for utvikling
3. **Bruk azd down**: Frigjør ressurser når du ikke utvikler aktivt
4. **Cache responser**: Implementer Redis cache for gjentatte spørringer
5. **Bruk prompt engineering**: Reduser tokenbruk med effektive prompts


```bash
# Utviklingskonfigurasjon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Hva er forskjellen mellom Microsoft Foundry Models og OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Bedriftsikkerhet og samsvar
- Integrasjon med privat nettverk
- SLA-garantier
- Administrert identitetsautentisering
- Høyere kvoter tilgjengelig

**OpenAI API**:
- Raskere tilgang til nye modeller
- Enklere oppsett
- Lavere inngangsbarriere
- Kun offentlig internett

For produksjonsapper er **Microsoft Foundry Models anbefalt**.
</details>

<details>
<summary><strong>Hvordan håndterer jeg feil for overskredet kvote i Microsoft Foundry Models?</strong></summary>

```bash
# Sjekk gjeldende kvote
az cognitiveservices usage list --location eastus2

# Prøv en annen region
azd env set AZURE_LOCATION westus2
azd up

# Reduser kapasiteten midlertidig
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Be om kvoteøkning
# Gå til Azure Portal > Kvoter > Be om økning
```
</details>

<details>
<summary><strong>Kan jeg bruke mine egne data med Microsoft Foundry Models?</strong></summary>

Ja! Bruk **Azure AI Search** for RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Se malen [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI-modellendepunkter?</strong></summary>

**Beste praksis**:
1. Bruk administrert identitet (ingen API-nøkler)
2. Aktiver private endepunkter
3. Konfigurer nettverkssikkerhetsgrupper
4. Implementer hastighetsbegrensning
5. Bruk Azure Key Vault for hemmeligheter

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

## Fellesskap og support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offisiell dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agent skills i redigereren din med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige Kapittel**: [Kapittel 1: Ditt Første Prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [Distribusjon av AI-modell](ai-model-deployment.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i våre fellesskapsdiskusjoner eller åpne en sak i depotet. Azure AI + AZD-fellesskapet er her for å hjelpe deg å lykkes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
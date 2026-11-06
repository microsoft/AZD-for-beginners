# Microsoft Foundry-integrasjon med AZD

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-Først Utvikling
- **⬅️ Forrige Kapittel**: [Kapittel 1: Ditt Første Prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [AI-agenter](agents.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Oversikt

Denne guiden demonstrerer hvordan man integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinjeformede AI-applikasjonsutrullinger. Microsoft Foundry tilbyr en omfattende plattform for å bygge, distribuere og administrere AI-applikasjoner, mens AZD forenkler infrastrukturen og distribusjonsprosessen.

## Hva er Microsoft Foundry?

Microsoft Foundry er Microsofts enhetlige plattform for AI-utvikling som inkluderer:

- **Modellkatalog**: Tilgang til toppmoderne AI-modeller
- **Prompt Flow**: Visuell designer for AI-arbeidsflyter
- **Microsoft Foundry Portal**: Integrert utviklingsmiljø for AI-applikasjoner
- **Distribusjonsalternativer**: Flere verts- og skaleringsvalg
- **Sikkerhet og Trygghet**: Innebygde ansvarlige AI-funksjoner

## AZD + Microsoft Foundry: Bedre Sammen

| Funksjon | Microsoft Foundry | AZD Integrasjonsfordel |
|---------|-----------------|------------------------|
| **Modellutrulling** | Manuell portalutrulling | Automatiserte, repeterbare utrullinger |
| **Infrastruktur** | Klikk-gjennom provisjonering | Infrastruktur som kode (Bicep) |
| **Miljøstyring** | Fokus på enkelt miljø | Multi-miljø (dev/staging/produksjon) |
| **CI/CD Integrasjon** | Begrenset | Innfødt støtte for GitHub Actions |
| **Kostnadsstyring** | Enkel overvåking | Miljøspesifikk kostnadsoptimalisering |

## Forutsetninger

- Azure-abonnement med nødvendige tillatelser
- Azure Developer CLI installert
- Tilgang til Microsoft Foundry Models-tjenester
- Grunnleggende kjennskap til Microsoft Foundry

> **Utgivelsesgjennomgang (2026-11-04):** AI CLI-veiledning ble sjekket mot `azd` `1.37.2`, agenter `1.0.0-beta.23`, og evalueringer `1.0.0-beta.2` dokumentasjon/kilde. Bruk `azd >= 1.37.0` for kombinert arbeidsflyt. Se [utgivelsesendringer og rettelser](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); denne gjennomgangen sertifiserer ikke alle maler eller SDK-eksempler mot en live utrulling.

## Grunnleggende Integrasjonsmønstre

**Omfang av eksemplene:** Bicepen nedenfor inneholder illustrerende ressursfragmenter, ikke en fullstendig deployerbar mal. Innholdsmalen må definere navn, `location`, refererte ressurser, identiteter, utdata og applikasjonsvert. Bruk et lenket eksempel som kjørbart startpunkt. Bash-eksempler krever separat Azure CLI-autentisering fra `azd auth login`.

### Mønster 1: Microsoft Foundry Models Integrasjon

**Brukstilfelle**: Utrulling av chatteapplikasjoner med Azure OpenAI-modeller i Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Kalleren trenger en tilknyttet administrert identitet og `Cognitive Services OpenAI User` på kontoskop; deaktivering av nøkler gir ikke tilgang. Verifiser region/modell/SKU-tilgjengelighet og kvote før utrulling.

### Mønster 2: AI-søk + RAG Integrasjon

**Brukstilfelle**: Utrulling av retrieval-augmented generation (RAG) applikasjoner

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

```

Det finnes ingen `Microsoft.Search/searchServices/dataConnections` ARM-ressurs for denne integrasjonen. Konfigurer en Search-indeks, datakilde, indekserer/skillsett eller vektorisator via de støttede Search data-plane APIene. Hvis Search kaller en innebygd modell, aktiver dens administrerte identitet, gi relevant modellrolle, og konfigurer dens innebygde ferdighet/vektorizer. Se [integrert vektorisering](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mønster 3: Document Intelligence Integrasjon

**Brukstilfelle**: Dokumentbehandling og analysearbeidsflyter

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

### Miljøvariabler-oppsett

Bortsett fra dokumenterte AZD-innstillinger som `AZURE_LOCATION`, er disse **egendefinerte malinngangsnavn**. De har ingen effekt med mindre malen/applikasjonen bruker dem gjennom parameter- og vertsmiljøkartlegginger. For `azure-search-openai-demo`, bruk de faktiske navn som `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` og `AZURE_SEARCH_SERVICE_SKU` i stedet. Modellkapasitet er ikke kontos SKU.

**Produksjonskonfigurasjon:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Utviklingskonfigurasjon:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sikker konfigurasjon med Key Vault

Foretrekk Entra ID med lokal nøkkelautentisering deaktivert. Følgende er kun et **legacy nøkkel-autentiseringsalternativ** for applikasjoner som krever nøkler: det krever en konto med nøkkelautentisering aktivert, applikasjonsidentitet knyttet til vertsinstansen, og fungerende Key Vault-tilgang/nettverk. Kombiner ikke nøkkelhenting med `disableLocalAuth: true` og forvent at nøkkelbaserte kall virker.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

## Utrullingsarbeidsflyter

### AZD-utvidelser for Foundry

AZD tilbyr utvidelser som legger til AI-spesifikke funksjoner for å jobbe med Microsoft Foundry-tjenester:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

AI-utvidelsene utvikler seg fortsatt raskt i forhåndsvisning. Hvis en kommando oppfører seg annerledes enn vist her, oppgrader relevant utvidelse før du feilsøker prosjektet selv.

### Agent-Først Utrulling med `azd ai`

Bruk `azd ai agent init` interaktivt, eller adoptere en gjeldende `azure.yaml` agent-mal koblet til Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` erstatter den utdaterte stavemåten `--manifest`/`-m`; gammel manifest- og nestet agentkonfigurasjon må fortsatt migreres. Evaluer agenter med `azd ai eval` fra `azure.ai.evaluations`, ikke den fjernede legacy-arbeidsflyten. Se [evaluasjonsmigrasjon](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for oppsett, kjøring og resultater.

Se [AZD AI CLI Kommandoer](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for full kommandooversikt og flagg.

### Enkeltkommando Utrulling

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Miljøspesifikke Utrullinger

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

## Overvåking og Observabilitet

### Application Insights Integrasjon

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
```

Dette provisjonerer en Insights-ressurs, ikke telemetriinstrumentering. Når appen din sender utgående modellkall-spans, kjør denne illustrative spørringen i Application Insights Logs (tilpass filteret til dine faktiske span-navn):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kostnadsovervåking

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Bruk en ekte mottaker og verifiser fakturerings-skopetillatelser. Et budsjett sender varsler; det er ikke en utgiftstak.

## 🔐 Sikkerhets Beste Praksiser

### Administrert Identitetskonfigurasjon

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

Dette endepunktfragmentet trenger også en privat DNS-sone/gruppe, VNet-lenker, applikasjons VNet-tilkobling, og en eksplisitt policy for offentlig tilgang. Å opprette et privat endepunkt alene deaktiverer ikke offentlig tilgang.

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

### Cache-strategier

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache for Redis Basic/Standard/Premium er på en [utfasede sti](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); bruk Azure Managed Redis for nye utrullinger og følg gjeldende mal/autentiseringsveiledning. Avgrens cachelagrede AI-responser etter autorisasjon, modell/instruksjoner og dataversjon, med utløp; del aldri private svar kun med spørringstekst.

### Autoskaleringskonfigurasjon

**Delvis ressurs:** slå sammen disse skalerings-/inngangsinnstillingene inn i en fullstendig Container App med et administrert miljø, containerbilde og ressursgrenser. Flere replikaer øker ikke modellkvoten.

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

## Feilsøking av Vanlige Problemer

### Problem 1: OpenAI Kvote Overskredet

**Symptomer:**
- Utrulling mislykkes med kvotefeil
- 429-feil i applikasjonslogger

**Løsninger:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Kapasitetsvariabelen over gjelder kun en egendefinert mal koblet for å benytte den. For RAG-eksemplet, bruk `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ikke endre `AZURE_LOCATION` for å flytte eksisterende ressurser; opprett et eget miljø for en ny region og planlegg migrering/rydding.

### Problem 2: Autentiseringsfeil

**Symptomer:**
- 401/403 feil ved kall til AI-tjenester
- "Access denied"-meldinger

**Løsninger:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Modellutrullingsproblemer

**Symptomer:**
- Modeller ikke tilgjengelige i utrulling
- Spesifikke modellversjoner feiler

**Løsninger:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Eksempelmaler

Dette er alternativer, ikke sekvensielle kommandoer. Start hver i en separat tom katalog. Den eksplisitte `.` destinasjonen holder initialiseringen i din nåværende katalog; ellers kan gjeldende AZD lage en malnavngitt undermappe uten å endre skallens arbeidsmappe.

### RAG Chat-applikasjon (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: En RAG-chat referanseapplikasjon for spørsmål over dine dokumenter, med Azure AI Search-henting. Gå gjennom den nåværende eksemplets støttede modeller, valgfrie funksjoner, kostnadsveiledning og produksjonshardening før bruk; utrulling av et eksempel gjør ikke en applikasjon produksjonsklar.

**Rask start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat-applikasjon (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C#-ekvivalenten til Python RAG chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly frontend. Inkluderer stemmechat, GPT-4o-mini visjonsstøtte, og en tilhørende .NET MAUI Blazor Hybrid desktop/mobil-klient.

**Rask start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat-applikasjon (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-versjon av RAG chat-eksemplet som bruker Langchain4J for AI-orkestrering. Støtter mikrotjeneste hendelsesdrevet arkitektur, flere søkstrategier (tekst, vektor, hybrid), dokumentopplasting med Azure Document Intelligence, og utrulling enten på Azure Container Apps eller Azure Kubernetes Service.

**Rask start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: End-to-end retail RAG copilot med Microsoft Foundry og Prompty. En Contoso Outdoor butikker chatbot som baserer svar på produktkatalog og kundeordredata. Demonstrerer full GenAIOps arbeidsflyt — prototype med Prompty, evaluer med AI-assisterte evaluatorer, og distribuer via AZD til Container Apps.

**Rask start**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativ Skriving Multi-Agent Applikasjon

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent eksempel som demonstrerer AI-agent orkestrering med Prompty. Bruker en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skriveragent og en redaktøragent til samarbeidsproduserte velfunderte artikler. Inkluderer CI/CD med evaluering i GitHub Actions.

**Rask start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverløs RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beskrivelse**: Fullstendig serverløs RAG chatbot som bruker LangChain.js med Azure Functions for API og Azure Static Web Apps for hosting. Bruker Azure Cosmos DB som både vektorlager og chatthistorikkdatabase. Støtter lokal utvikling med Ollama for nullkostnadstesting.

**Rask start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat med Dine Data Løsningsakselerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search med Cosmos DB, eller PostgreSQL med pgvector

**Beskrivelse**: En dokumentbasert chatteakselerator med sitater. Nåværende eksempel har en React frontend, FastAPI backend, og Functions innhentingsarbeider på Container Apps; orkestreringsvalg er Agent Framework og LangGraph. Database/hentingsalternativer velges ved utrulling. Det er et startpunkt, ikke et ferdig produksjonssystem; anta ikke at eldre App Service, Semantic Kernel eller Prompt Flow-varianter beskriver dagens standard.

**Rask start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Reiseagenter — Multi-Agent MCP Orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referanseapplikasjon for multi-agent AI-orchestrering ved bruk av tre rammeverk (LangChain.js, LlamaIndex.TS og Microsoft Agent Framework). Inneholder MCP (Model Context Protocol)-servere på fire språk som distribueres som serverløse Azure Container Apps med OpenTelemetry-overvåking.

**Rask start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Utforsk flere maler**: Besøk [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for tilgjengelige maler på tvers av språk og scenarier. Hver koblet eksempel er et eksternt repo, ikke et lokalt eksempel levert av dette kurset; undersøk nåværende forutsetninger og produksjonsveiledning før distribusjon.

## Neste steg

1. **Prøv eksemplene**: Start med en forhåndsbygget mal som passer ditt brukstilfelle
2. **Tilpass etter dine behov**: Endre infrastruktur og applikasjonskode
3. **Legg til overvåking**: Implementer omfattende observabilitet
4. **Optimaliser kostnader**: Finjuster konfigurasjoner for ditt budsjett
5. **Sikre distribusjonen**: Implementer bedrifts sikkerhetsmønstre
6. **Skaler til produksjon**: Legg til flerregion- og høytilgjengelighetsfunksjoner

## 🎯 Praktiske øvelser

### Øvelse 1: Distribuer Microsoft Foundry Models Chat App (30 minutter)
**Mål**: Distribuer og test en AI-chat referanseapplikasjon

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Vellykkede kriterier:**
- [ ] Distribusjonen fullføres uten kvote-feil
- [ ] Kan få tilgang til chattgrensesnitt i nettleser
- [ ] Kan stille spørsmål og motta AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressursene ryddes opp med suksess

**Kostnad:** Vurder gjeldende kostnadsveiledning og valgte SKU-er før distribusjon. Fakturering fortsetter til ressursene slettes; ingen fast 30-minutters estimat gjelder for alle konfigurasjoner.

### Øvelse 2: Konfigurer multi-modell distribusjon (45 minutter)
**Mål**: Distribuer flere AI-modeller med ulike konfigurasjoner

**Utgangspunkt:** En eksisterende Azure OpenAI-konto og en AZD resource-group modul som kan kalle denne filen. Opprett `infra/ai-models.bicep` med følgende innhold ved bruk av din editor. Den distribueres ikke automatisk bare fordi den ligger under `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Fra resource-group scoped modulen som eier kontoen, legg til en modul-invokasjon (tilpass symbolnavnet til din faktiske konto):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ikke deklarer samme distribusjoner i begge moduler. Hvis AZD inngangspunktet er abonnement-skalert, kall denne fra dens resource-group scoped barne-modul og juster relativ sti. Bygg den inneholdende modulen med `az bicep build --file <path-to-containing-module>`, deretter:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Vellykkede kriterier:**
- [ ] Flere modeller distribuert med suksess
- [ ] Ulike kapasitetsinnstillinger brukt
- [ ] Modeller tilgjengelig via API
- [ ] Kan kalle begge modeller fra applikasjonen

### Øvelse 3: Implementer kostnadsovervåking (20 minutter)
**Mål**: Sett opp budsjettvarsler og kostnadssporing

**Utgangspunkt:** Budsjettmønsteret ovenfor og en resource-group scoped infrastrukturmodul. Legg til denne ressursen i editoren; send `budgetStartDate` fra din parameterkartlegging (dupliser ikke parameteren hvis den allerede er deklarert). Erstatt mottaker og bekreft at du har skrivetilgang til budsjettet.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Forventet: responsen inneholder `amount: 200`, begge terskler, og din mottaker. Inspiser Kostnadsstyring i portalen for faktiske avgifter; kostnadsdata er forsinket og et varsel trenger ikke utløses under en kort øvelse.

**Vellykkede kriterier:**
- [ ] Budsjettvarsel opprettet i Azure
- [ ] E-postvarsler konfigurert
- [ ] Kan se kostnadsdata i Azure Portal
- [ ] Budsjettterskler satt riktig

## 💡 Ofte stilte spørsmål

<details>
<summary><strong>Hvordan reduserer jeg kostnadene for Microsoft Foundry Models under utvikling?</strong></summary>

1. **Sjekk priser**: Det finnes ingen universell gratis månedlig kvote på 50 000 tokens for Azure OpenAI-modeller
2. **Riktig kapasitet**: Kapasitetsverdien `10` representerer vanligvis 10 000 TPM for disse Standard tekstmodellene, ikke 10 TPM. Reduksjon av denne grensen reduserer ikke pris per token
3. **Bruk azd down**: Slett midlertidige ressurser når du ikke aktivt utvikler (dette er ikke deallokering)
4. **Cache svar**: Implementer Redis-cache for gjentatte spørringer
5. **Bruk prompt engineering**: Reduser tokenbruk med effektive prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Hva er forskjellen mellom Microsoft Foundry Models og OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Bedriftssikkerhet og samsvar
- Privat nettverksintegrasjon
- SLA-garantier
- Autentisering med administrert identitet
- Høyere kvoter tilgjengelig

**OpenAI API**: En separat leverandør/API med egne modelltilgjengeligheter, priser, autentisering og bedriftskoblede muligheter. Sammenlign nåværende tilbud i stedet for å anta at det kun er offentlig internett eller alltid leverer modeller først.

Velg basert på organisasjonens krav; Azure-spesifikke administrerte identitets- og privatkoblingseksempler i dette kurset gjelder for Azure-hostede tjenester, ikke hver modell/leverandør i Foundry-katalogen.
</details>

<details>
<summary><strong>Hvordan håndterer jeg Microsoft Foundry Models kvote overskredet-feil?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Kan jeg bruke mine egne data med Microsoft Foundry Models?</strong></summary>

Ja! Bruk **Azure AI Search** for RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) malen.
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI-modellendepunkter?</strong></summary>

**Beste praksis**:
1. Bruk administrert identitet (ingen API-nøkler)
2. Aktiver private endepunkter
3. Konfigurer nettverkssikkerhetsgrupper
4. Implementer rate limiting
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

## Fellesskap og støtte

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues og diskusjoner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offisiell dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agentferdigheter i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-Først Utvikling
- **⬅️ Forrige kapittel**: [Kapittel 1: Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [AI-agenter](agents.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i våre fellesskapsdiskusjoner eller åpne en sak i repoet. Azure AI + AZD-fellesskapet er her for å hjelpe deg å lykkes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
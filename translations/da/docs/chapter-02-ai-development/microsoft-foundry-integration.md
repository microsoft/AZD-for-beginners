# Microsoft Foundry Integration med AZD

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Først Udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI Agenturer](agents.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Oversigt

Denne vejledning viser, hvordan man integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for strømlinede AI-applikationsudrulninger. Microsoft Foundry tilbyder en omfattende platform til opbygning, udrulning og styring af AI-applikationer, mens AZD forenkler infrastrukturen og udrulningsprocessen.

## Hvad er Microsoft Foundry?

Microsoft Foundry er Microsofts samlede platform for AI-udvikling, som inkluderer:

- **Modelkatalog**: Adgang til de nyeste AI-modeller
- **Prompt Flow**: Visuel designer til AI-arbejdsgange
- **Microsoft Foundry Portal**: Integreret udviklingsmiljø til AI-applikationer
- **Udrulningsmuligheder**: Flere hosting- og skaleringsmuligheder
- **Sikkerhed og tryghed**: Indbyggede ansvarlige AI-funktioner

## AZD + Microsoft Foundry: Bedre sammen

| Funktion | Microsoft Foundry | AZD Integrationsfordel |
|---------|-----------------|------------------------|
| **Modeludrulning** | Manuel portaludrulning | Automatiserede, gentagelige udrulninger |
| **Infrastruktur** | Projekt- og ressourcekonfiguration | Start fra `azure.yaml`; udtræk Bicep eller Terraform efter behov |
| **Miljøstyring** | Fokus på enkelt miljø | Multi-miljø (dev/staging/prod) |
| **CI/CD-integration** | Udrulnings- og evalueringsservices | Genbrug konfiguration i GitHub Actions eller Azure DevOps |
| **Omkostningsstyring** | Grundlæggende overvågning | Miljøspecifik omkostningsoptimering |

## Forudsætninger

- Azure-abonnement med passende rettigheder
- Azure Developer CLI 1.37.0 eller nyere til GA Foundry-arbejdsgangen
- Adgang til Microsoft Foundry Models-tjenester
- Grundlæggende kendskab til Microsoft Foundry

> **Foundry GA-opdatering (2026-11-09):** Udvidelsespakken `microsoft.foundry` nåede version 1.0 og generel tilgængelighed den [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gennemgangen nedenfor følger denne meddelelse og det linkede Microsoft Learn-quickstart. Dette er en dokumentationsgennemgang, ikke en live-implementeringsvalidering. Valgfrie preview-funktioner og uafhængigt frigivne udvidelser bevarer deres egen udgivelsesstatus.

**Læringsudbytte:** Installer GA-pakken, gennemgå en agents `azure.yaml`, sammenlign lokale og implementerede svar, og forklar evaluering, CI/CD og oprydningsgrænser. For en trin-for-trin agentimplementering, se [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Ressourcestykkerne nedenfor dækker andre integrationsmønstre.

## Kerneintegrationsmønstre

**Omfang af eksemplerne:** Bicep-koden nedenfor indeholder illustrative ressourcestykker, ikke en komplet deployerbar skabelon. Den indeholdende skabelon skal definere navne, `location`, refererede ressourcer, identiteter, output og applikationshosting. Brug et linket eksempel som et kørbart udgangspunkt. Bash-eksempler kræver separat Azure CLI-autentificering uafhængigt af `azd auth login`.

### Mønster 1: Microsoft Foundry Models Integration

**Brugsscenarie**: Implementer chat-applikationer med Azure OpenAI-modeller i Microsoft Foundry

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

Kaldende part skal have tilknyttet managed identity og `Cognitive Services OpenAI User` på kontoniveau; deaktivering af nøgler giver ikke adgang. Bekræft tilgængelighed og kvoter for region/model/SKU inden implementering.

### Mønster 2: AI Search + RAG Integration

**Brugsscenarie**: Implementer retrieval-augmented generation (RAG) applikationer

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

Der findes ikke en `Microsoft.Search/searchServices/dataConnections` ARM-ressource til denne integration. Konfigurer et Search-indeks, datakilde, indekser/skillset eller vektorisator gennem de understøttede Search data-plane API'er. Hvis Search kalder en indlejret model, aktiver dens managed identity, giv den relevante modelrolle, og konfigurer dens indlejringskompetence/vektorizer. Se [integreret vektorisering](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mønster 3: Document Intelligence Integration

**Brugsscenarie**: Dokumentbehandling og analysearbejdsgange

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

Med undtagelse af dokumenterede AZD-indstillinger som `AZURE_LOCATION`, er disse **brugerdefinerede skabeloninput-navne**. De påvirker ikke noget, medmindre skabelonen/applikationen bruger dem gennem parameter- og vært-miljøkortlægninger. For `azure-search-openai-demo`, brug dens faktiske navne såsom `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` og `AZURE_SEARCH_SERVICE_SKU` i stedet. Modelkapacitet er ikke kontospecifik SKU.

**Produktionskonfiguration:**
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

**Udviklingskonfiguration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sikker konfiguration med Key Vault

Foretræk Entra ID med lokal nøglegodkendelse deaktiveret. Følgende er kun et **ældre alternativ til nøglebaseret godkendelse** for applikationer, der kræver nøgler: det kræver en konto med nøglegodkendelse aktiveret, applikationsidentiteten tilknyttet dens vært, samt fungerende Key Vault-adgang/netværk. Kombiner ikke nøglehentning med `disableLocalAuth: true` og forvent, at nøglebaserede kald fungerer.

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

## Implementeringsarbejdsgange

### AZD-udvidelser til Foundry

For GA-arbejdsgangen, installer `microsoft.foundry`-pakken i stedet for at samle kerneudvidelserne én ad gangen:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Pakken installerer agenter, forbindelser, inspector, projekter, rutiner, færdigheder og værktøjskasser. Den tilføjer ikke en `microsoft.foundry` kommandogruppe. Evalueringer, datasæt, finjustering og brugerdefinerede modeller installeres separat efter behov. Se [udvidelsespakke-reference](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent gennemgang (GA)

En **hosted agent** kører din agentkode på Foundry-administreret compute. Dette øvelse bruger den upstream grundlæggende Python Agent Framework Responses API prøve, ikke de klassiske Agent Service SDK bidder i andre lektioner.

#### 1. Forbered og initialiser

Brug en tom mappe uden for denne kursus checkout. Installer Python 3.13 eller nyere og en aktuel [uv udgivelse](https://docs.astral.sh/uv/getting-started/installation/). Standalone uv-installationer kan bruge `uv self update`. Tjek [hosted-agent tilladelser](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), modeltilgængelighed og kvoter i dit abonnement og region inden provisionering. Azure-ressourcer og lokale modelkald medfører omkostninger.

Fuldfør `azd auth login` og pakkeinstallation ovenfor. Lokalt prøveeksempel bruger `DefaultAzureCredential`; hvis du bruger Azure CLI-legitimationsoplysninger, log ind med `az login` med samme konto og lejer som AZD. Kun AZD-login er ikke et Azure CLI-login.

Kør denne enkeltlinjekommando i Bash eller PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Vælg et nyt eller eksisterende Foundry-projekt og det tiltænkte abonnement og region. For at genbruge en modelimplementering, tilføj `--model-deployment <existing-deployment-name>` til initialiseringskommandoen **før du kører den**, og vælg det eksisterende projekt. Bliv i mappen med den genererede `azure.yaml` til de resterende kommandoer.

#### 2. Gennemgå implementeringsdefinitionen

Åbn `azure.yaml` og find disse indstillinger i [upstream-eksemplet](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Indstilling | Hvad der skal kontrolleres |
|---------|---------------|
| `host: azure.ai.project` og `deployments` | Tiltænkt Foundry-projekt og modelnavn, version, implementerings-SKU og kapacitet |
| `host: azure.ai.agent` og `project` | Hosted agent og mappen med dens kilde |
| `codeConfiguration` | Python runtime og indgangspunkt; det gennemgåede eksempel bruger `python_3_13` og `main.py` |
| `uses` | Afhængighed af Foundry-projekttjenesten |
| `container.resources` | CPU- og hukommelsestildeling, selvom koden bygges eksternt |
| `env` | Modelimplementeringsmapping og `PYTHONNOUSERSITE: "1"` for at deaktivere pakkeindlæsning på brugersted |
| `infra.provider` | `microsoft.foundry`, som samler den nødvendige infrastruktur |

Forpligt den gennemgåede `azure.yaml` og agentkode sammen. Ingen håndskrevet infrastruktur er nødvendig for at starte; når du skal bruge redigerbare provisionsfiler, følg [infrastructure ejection](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) for Bicep eller Terraform og fortsæt med `azd provision`. Forpligt ikke legitimationsoplysninger eller `.azure/` miljøtilstand.

#### 3. Provisioner og test lokalt

```bash
azd provision
azd ai agent run
```

Provisionering kan oprette manglende modelimplementeringer **selv i et genbrugt projekt**. Gennemgå modelpromptene og vælg en tilgængelig online implementeringstype som Global Standard eller Data Zone Standard; kvoter og regional support varierer.

Det lokale kørsel forbereder afhængigheder og åbner **Agent Inspector**, hvor du kan inspicere forespørgsler, svar og værktøj-/modelaktivitet. Hold den kørende og åbn et andet terminalvindue i samme projektmappe:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Tjekpunkt:** Bekræft, at du modtager et relevant svar, og at du kan inspicere den tilknyttede lokale aktivitet. Lokal eksekvering kalder stadig din Azure-modelimplementering; det er ikke en offline- eller gratis test. Brug syntetiske prompts og undgå at eksponere hemmeligheder eller følsomme data i inspector-output.

#### 4. Implementer og sammenlign

Stop det lokale kørsel med Ctrl+C, når det er færdigt. Konfigurer eller verificer projektets [Application Insights forbindelse og trace-læseadgang](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) før fjernkald.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

I kodeimplementeringstilstand uploader AZD kilde til en ekstern Foundry-build; du behøver ikke en lokal container-build for denne vej. Implementeringsoutput giver legeplads- og endepunktslinks. Bekræft et svar fra den implementerede agent og dens cloud trace; lokale inspector-hændelser alene beviser ikke, at cloud tracing fungerer.

For efterfølgende ændringer, gennemgå understøttet hosted-agent konfiguration med `azd deploy --preview`. Strøm logfiler med `azd ai agent monitor --follow`, eller diagnosticer opsætning og adgangsproblemer med `azd ai agent doctor`. En implementeringspreview er ikke en komplet infrastruktur- eller sikkerhedsgennemgang.

#### 5. Tilføj en gentagelig kvalitetskontrol

Installer den uafhængigt frigivne evaluationsudvidelse, og generer derefter udkast til testassets:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Beskriv agentens tiltænkte adfærd og vælg **Dataset og evaluator**, derefter **Turn**. Gennemgå og rediger de genererede sager og bedømmelsesrubrik, inklusive en sag med et ikke-understøttet spørgsmål, før evalueringen konfigureres:

```bash
azd ai eval init --name quality
```

Vælg det gennemgåede datasæt og rubrik, og bekræft judge-modelimplementeringen. Inspicer `evals/azure.eval.yaml` og dens evaluations-service reference i `azure.yaml`, registrer derefter assets og kør:

```bash
azd up
azd ai eval run start --eval quality
```

Inspicer scores og fejlede eller fejlbehæftede sager; en fuldført evaluering er ikke automatisk en kvalitetsgodkendelse. Generering og scoring medfører også modelomkostninger. Forpligt ikke-hemmelig konfiguration, datasæt og rubrikker, så teammedlemmer kan sammenligne ændringer. `azd ai agent optimize` kan genbruge en kompatibel evaluering som baseline, men gennemgå kandidater, før en eksplicit deployeres. Se [quality gates and migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for ældre projekter og CI.

#### 6. Genbrug arbejdsgangen i CI/CD

Efter en succesfuld `azd up`, kør `azd pipeline config` og gennemgå de genererede GitHub Actions- eller Azure DevOps-arbejdsgange. Installer `microsoft.foundry` på runneren, plus `azure.ai.evaluations` hvis du kører evalueringer. Bevar genererede checkout-, login- og miljøindstillinger; installation alene autentificerer ikke pipelinen.

Brug et separat AZD-miljø per trin, giv pipeline-identiteten de nødvendige resource- og Foundry tilladelser, og opbevar legitimationsoplysninger i pipelinens hemmeligheder eller brug fødereret identitet. Forpligt evalueringsassets, og verificer, at identiteten kan få adgang til refererede datasæt/evaluatorer. Se [kursuspipeline-eksemplet](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) og [Foundry CI/CD-guide](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Ryd op med omtanke

For et **nyt projekt oprettet af dette miljø**, gennemgå ressourcerne opført af `azd down` før bekræftelse: det sletter ressourcegruppen og alt deri.

For et **genbrugt projekt**, `azd down` efterlader projektet, hosted agent og andre ressourcer på plads. Fjern kun uønskede ressourcer, du ejer, ved hjælp af [quickstart oprydningsvejledning](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); slet ikke en delt ressourcegruppe for at rydde op i én øvelse.

**Afslutningskontrol:** Forklar hvilke indstillinger der styrer lokal og cloud-adfærd, vis lokale og implementerede svar, gennemgå et evalueringsresultat, og identificer hvilke ressourcer der forbliver efter oprydning.

### Valgfrit: Scaffold med Microsoft Foundry-færdigheden

Installer [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) for din kodende agenthost, og åbn derefter en separat tom mappe. Bed den om at scaffolde det grundlæggende Python Agent Framework Responses API-eksempel i kodeimplementeringstilstand, forklar den genererede `azure.yaml`, og foreslå abonnement, region, projekt og modelimplementering. Kræv godkendelse **før oprettelse af Azure-ressourcer**, anmod om en lokal test, og stop før implementering. Gennemgå dens output og fortsæt med implementeringstrinnene ovenfor først, når du er klar.

For eksisterende projekter erstatter `--template`/`-t` den forældede `--manifest`/`-m` stavemåde; ændring af flaget migrerer ikke legacy-manifester eller indlejret agentkonfiguration. Se [AI CLI-reference](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Udrulning med enkeltkommando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Udrulninger specifikke for miljø

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

## Overvågning og Observabilitet

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
```

Dette opretter en Insights-ressource, ikke telemetri-instrumentering. Når din app udsender udgående modelkaldsspans, kør denne illustrative forespørgsel i Application Insights Logs (tilpas filteret til dine faktiske span-navne):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Omkostningsovervågning

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

Brug en rigtig modtager og verificer tilladelser for faktureringsområdet. Et budget sender alarmer; det er ikke et forbrugsloft.

## 🔐 Sikkerhedspraksis

### Konfiguration af administreret identitet

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

Denne endpoint-del kræver også en privat DNS-zone/-gruppe, VNet-links, applikationsforbindelse til VNet og en eksplicit politik for offentlig adgang. Oprettelse af en privat endpoint alene deaktiverer ikke offentlig adgang.

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

### Caching-strategier

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

Azure Cache for Redis Basic/Standard/Premium er på en [afviklingsvej](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); brug Azure Managed Redis til nye udrulninger og følg dets nuværende skabelon-/autentificeringsvejledning. Afgræns cachede AI-responser efter autorisation, model/instruktioner og dataversion med udløbstid; del aldrig private svar kun via forespørgselstekst.

### Auto-skalering konfiguration

**Delvis ressource:** sammensæt disse skalerings-/indgangsindstillinger i en komplet Container App med et administreret miljø, containerbillede og ressourcegrænser. Flere replikaer øger ikke modelkvoten.

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
- Udrulning fejler med kvote-fejl
- 429 fejl i applikationslogfiler

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

Kapacitetsvariablen ovenfor gælder kun for en brugerdefineret skabelon, der er forbundet til at bruge den. For RAG-eksemplet brug `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ændr ikke `AZURE_LOCATION` for at flytte eksisterende ressourcer; opret et separat miljø for en ny region og planlæg migration/rydning.

### Problem 2: Godkendelsesfejl

**Symptomer:**
- 401/403 fejl ved kald til AI-services
- "Adgang nægtet"-beskeder

**Løsninger:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Modeludrulningsproblemer

**Symptomer:**
- Modeller er ikke tilgængelige i udrulningen
- Specifikke modelversioner fejler

**Løsninger:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Eksempelskabeloner

Disse er alternativer, ikke sekventielle kommandoer. Start hver i en separat tom mappe. Den eksplicitte `.` destination holder initialiseringen i din nuværende mappe; ellers kan den nuværende AZD oprette et skabelon-navngivet undermappe uden at ændre dit shells arbejdsmappe.

### RAG Chat-applikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: En RAG chat referenceapplikation til spørgsmål over dine dokumenter med Azure AI Search genfinding. Gennemgå det aktuelle eksempels understøttede modeller, valgfrie funktioner, omkostningsvejledning og produkthærdning inden brug; at implementere et eksempel gør ikke en applikation klar til produktion.

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat-applikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C# ækvivalent til Python RAG chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly frontend. Inkluderer stemmechat, GPT-4o-mini visionsupport og en ledsagende .NET MAUI Blazor Hybrid desktop/mobil klient.

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat-applikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-version af RAG chateksemplet, der bruger Langchain4J til AI-orchestrering. Understøtter mikrotjeneste-begivenhedsdrevet arkitektur, flere søgestrategier (tekst, vektor, hybrid), dokumentupload med Azure Document Intelligence og udrulning på enten Azure Container Apps eller Azure Kubernetes Service.

**Hurtig start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: End-to-end retail RAG copilot, der bruger Microsoft Foundry og Prompty. En Contoso Outdoor detailhandelschatbot, der baserer svar på produktkatalog og kundeordredatat. Demonstrerer hele GenAIOps workflowet – prototype med Prompty, evaluér med AI-assisterede evaluatorer, og implementér via AZD til Container Apps.

**Hurtig start**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativ Skrive Multi-Agent-Applikation

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent eksempel, der demonstrerer AI-agent orkestrering med Prompty. Bruger en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skriveagent og en redaktøragent til samarbejdsproduktion af velfunderede artikler. Inkluderer CI/CD med evaluering i GitHub Actions.

**Hurtig start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverløs RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beskrivelse**: Fuldstændig serverløs RAG chatbot, der bruger LangChain.js med Azure Functions til API og Azure Static Web Apps til hosting. Bruger Azure Cosmos DB som både vektorlager og chat-historikdatabase. Understøtter lokal udvikling med Ollama til omkostningsfri testning.

**Hurtig start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat med din data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search med Cosmos DB eller PostgreSQL med pgvector

**Beskrivelse**: En dokumentbaseret chat-accelerator med kildeangivelser. Det aktuelle eksempel hoster en React frontend, FastAPI backend og Functions ingestion-worker på Container Apps; orkestrator-muligheder er Agent Framework og LangGraph. Database-/genfindingsmuligheder vælges ved udrulning. Det er et udgangspunkt, ikke et færdigt produktsystem; antag ikke, at ældre App Service, Semantic Kernel eller Prompt Flow-variationer beskriver den aktuelle standard.

**Hurtig start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referenceapplikation for multi-agent AI orkestrering ved brug af tre frameworks (LangChain.js, LlamaIndex.TS og Microsoft Agent Framework). Indeholder MCP (Model Context Protocol) servere i fire sprog udrullet som serverløse Azure Container Apps med OpenTelemetry overvågning.

**Hurtig start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Se flere skabeloner**: Besøg [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for aktuelle tilgængelige skabeloner på tværs af sprog og scenarier. Hvert linket eksempel er et eksternt repository, ikke et lokalt eksempel leveret af dette kursus; undersøg dets aktuelle forudsætninger og produktionsvejledning før implementering.

## Næste trin

1. **Prøv eksemplerne**: Start med en forudbygget skabelon, der matcher dit brugsscenarie
2. **Tilpas til dine behov**: Tilpas infrastruktur og applikationskode
3. **Tilføj overvågning**: Implementer omfattende observabilitet
4. **Optimer omkostninger**: Fintune konfigurationer efter dit budget
5. **Sikre din udrulning**: Implementer virksomhedssikkerhedsmønstre
6. **Skaler til produktion**: Tilføj multi-region og høj tilgængelighed funktioner

## 🎯 Praktiske øvelser

### Øvelse 1: Udrul Microsoft Foundry Models Chat App (30 minutter)
**Mål**: Implementer og test en AI-chat referenceapplikation

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

# Review the listed resources and confirm cleanup
azd down
```

**Succes kriterier:**
- [ ] Udrulningen gennemføres uden kvote-fejl
- [ ] Adgang til chat-interface i browser
- [ ] Kan stille spørgsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ressourcer ryddes op med succes

**Omkostning:** Gennemgå det aktuelle eksempels omkostningsvejledning og valgte SKU'er inden udrulning. Fakturering fortsætter indtil ressourcer slettes; ingen fast 30-minutters estimat gælder for alle konfigurationer.

### Øvelse 2: Konfigurer Multi-Model Udrulning (45 minutter)
**Mål**: Udrul flere AI modeller med forskellige konfigurationer

**Udgangspunkt:** En eksisterende Azure OpenAI konto og et AZD ressourcegruppe-modul, der kan kalde denne fil. Opret `infra/ai-models.bicep` med følgende indhold i din editor. Den udrulles ikke automatisk bare fordi den ligger under `infra/`.

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

Fra det ressourcegruppe-afgrænsede modul, der ejer kontoen, tilføj en modulkanvocation (tilpas symbolnavnet til din faktiske konto):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Deklarer ikke de samme udrulninger i begge moduler. Hvis AZD's indgangspunkt er abonnement-afgrænset, kald dette fra dets ressourcegruppe-afgrænsede undermodul og juster den relative sti. Byg det indeholdende modul med `az bicep build --file <path-to-containing-module>`, og derefter:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Succes kriterier:**
- [ ] Flere modeller udrullet med succes
- [ ] Forskellige kapacitetsindstillinger anvendt
- [ ] Modeller tilgængelige via API
- [ ] Kan kalde begge modeller fra applikationen

### Øvelse 3: Implementer omkostningsovervågning (20 minutter)
**Mål**: Sæt budgetalarmer og omkostningssporing op

**Udgangspunkt:** Budgetschemaet ovenfor og et ressourcegruppe-afgrænset infrastruktursmodul. Tilføj denne ressource med din editor; videregiv `budgetStartDate` fra din parametermapping (duplikér ikke parameteren, hvis den allerede er deklareret). Erstat modtageren og bekræft, at du har budget-skrivetilladelse.

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

Forventet: svaret indeholder `amount: 200`, begge tærskler og din modtager. Undersøg Cost Management i portalen for faktiske gebyrer; omkostningsdata er forsinkede og en alarm behøver ikke udløses under en kort øvelse.

**Succes kriterier:**
- [ ] Budgetalarm oprettet i Azure
- [ ] E-mail-notifikationer konfigureret
- [ ] Kan se omkostningsdata i Azure Portal
- [ ] Budgettærskler sat passende

## 💡 Ofte stillede spørgsmål

<details>
<summary><strong>Hvordan reducerer jeg Microsoft Foundry Models-omkostninger under udvikling?</strong></summary>

1. **Tjek priser**: Der findes ikke en universel gratis månedlig kvote på 50.000 tokens for Azure OpenAI modeller
2. **Rettilpas kapaciteten**: Kapacitet `10` repræsenterer typisk 10.000 TPM for disse Standard tekstmodeller, ikke 10 TPM. At reducere denne hastighedsgrænse mindsker ikke per-token priser
3. **Brug azd down**: Slet brugbare ressourcer, når du ikke aktivt udvikler (dette er ikke deallokering)
4. **Cache responser**: Implementer Redis-cache til gentagne forespørgsler
5. **Brug Prompt Engineering**: Reducer tokenforbrug med effektive prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Hvad er forskellen mellem Microsoft Foundry Models og OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Virksomhedssikkerhed og overholdelse
- Privat netværksintegration
- SLA-garantier
- Administreret identitetsgodkendelse
- Højere kvoter tilgængelige

**OpenAI API**: En separat udbyder/API med egen modeltilgængelighed, priser, godkendelse og forretningsforbindelsesmuligheder. Sammenlign aktuelle tilbud i stedet for at antage, at det kun er til offentlig internetadgang eller altid lancerer modeller først.

Vælg baseret på din organisations krav; Azure-specifikke eksempler på administreret identitet og privat link i dette kursus gælder for Azure-hostede tjenester, ikke alle modeller/udbydere i Foundry-kataloget.
</details>

<details>
<summary><strong>Hvordan håndterer jeg Microsoft Foundry Models fejl ved overskredet kvote?</strong></summary>

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
<summary><strong>Kan jeg bruge mine egne data med Microsoft Foundry Models?</strong></summary>

Ja! Brug **Azure AI Search** til RAG (Retrieval Augmented Generation):

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

Se skabelonen [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Hvordan sikrer jeg AI-modelendepunkter?</strong></summary>

**Bedste praksis**:
1. Brug Managed Identity (ingen API-nøgler)
2. Aktivér Private Endpoints
3. Konfigurer netværkssikkerhedsgrupper
4. Implementér ratebegrænsning
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

## Fællesskab og Support

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues og diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agentfærdigheder**: [Microsoft Foundry færdighed på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agentfærdigheder i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Først Udvikling
- **⬅️ Forrige kapitel**: [Kapitel 1: Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [AI-agenter](agents.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskabsdiskussioner eller opret en issue i repositoryet. Azure AI + AZD-fællesskabet er her for at hjælpe dig med at få succes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry-integration med AZD

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD För nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-First-utveckling
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI-agenter](agents.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Översikt

Denna guide visar hur man integrerar Microsoft Foundry-tjänster med Azure Developer CLI (AZD) för smidigare distributioner av AI-applikationer. Microsoft Foundry erbjuder en omfattande plattform för att bygga, distribuera och hantera AI-applikationer, medan AZD förenklar infrastrukturen och distributionsprocessen.

## Vad är Microsoft Foundry?

Microsoft Foundry är Microsofts enhetliga plattform för AI-utveckling som inkluderar:

- **Modellkatalog**: Tillgång till toppmoderna AI-modeller
- **Prompt Flow**: Visuell designer för AI-arbetsflöden
- **Microsoft Foundry Portal**: Integrerad utvecklingsmiljö för AI-applikationer
- **Distributionsalternativ**: Flera värd- och skalningsmöjligheter
- **Säkerhet och trygghet**: Inbyggda ansvarsfulla AI-funktioner

## AZD + Microsoft Foundry: Bättre tillsammans

| Funktion | Microsoft Foundry | Fördel med AZD-integration |
|---------|-----------------|------------------------|
| **Modell-distribution** | Manuell portaldistrubtion | Automatiserade, upprepbara distributioner |
| **Infrastruktur** | Projekt- och resurskonfiguration | Starta från `azure.yaml`; exportera Bicep eller Terraform vid behov |
| **Miljöhantering** | Fokus på en miljö | Multi-miljö (dev/staging/prod) |
| **CI/CD-integration** | Distributions- och utvärderingstjänster | Återanvänd konfiguration i GitHub Actions eller Azure DevOps |
| **Kostnadshantering** | Grundläggande övervakning | Miljöspecifik kostnadsoptimering |

## Förutsättningar

- Azure-abonnemang med lämpliga behörigheter
- Azure Developer CLI 1.37.0 eller senare för GA Foundry-arbetsflödet
- Tillgång till Microsoft Foundry Models-tjänster
- Grundläggande bekantskap med Microsoft Foundry

> **Foundry GA-uppdatering (2026-11-09):** Tilläggspaketet `microsoft.foundry` nådde version 1.0 och allmän tillgänglighet den [5 november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Genomgången nedan följer det meddelandet och den länkade Microsoft Learn-quickstarten. Detta är en dokumentationsgranskning, inte en validering av live-distribution. Valfria förhandsfunktioner och fristående utgivna tillägg behåller sin egen utgivningsstatus.

**Lärandemål:** Installera GA-paketet, granska en agents `azure.yaml`, jämför lokala och distribuerade svar, och förklara utvärdering, CI/CD och städgränser. För en steg-för-steg-agentdistribution, gå till [hosted-agent-genomgången](#hosted-agent-walkthrough-ga). Ressursfragmenten nedan täcker andra integrationsmönster.

## Kärnintegrationsmönster

**Exempelns omfattning:** Bicep-koden nedan innehåller illustrerande resursfragment, inte en komplett distribueringstemplate. Den innehållande templaten måste definiera namn, `location`, refererade resurser, identiteter, utdata och applikationshosting. Använd ett länkad exempel som körbar utgångspunkt. Bash-exempel kräver separat Azure CLI-autentisering från `azd auth login`.

### Mönster 1: Microsoft Foundry Models Integration

**Användningsfall**: Distribuera chattapplikationer med Azure OpenAI-modeller i Microsoft Foundry

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

Anroparen behöver en bifogad hanterad identitet och `Cognitive Services OpenAI User` på kontonivå; att inaktivera nycklar ger inte åtkomst. Verifiera region-/modell-/SKU-tillgänglighet och kvot innan distribution.

### Mönster 2: AI Search + RAG Integration

**Användningsfall**: Distribuera retrieval-augmented generation (RAG)-applikationer

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

Det finns ingen `Microsoft.Search/searchServices/dataConnections` ARM- resurs för denna integration. Konfigurera en Search-index, datakälla, indexer/skillset eller vektoriserare genom de stödjade Search data-plane API:erna. Om Search anropar en embeddingmodell, aktivera dess hanterade identitet, ge relevant modellroll och konfigurera dess embedding-färdighet/vektoriserare. Se [integrerad vektorisering](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mönster 3: Document Intelligence Integration

**Användningsfall**: Dokumenthantering och analysarbetsflöden

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

### Miljövariabler Setup

Förutom dokumenterade AZD-inställningar såsom `AZURE_LOCATION`, är dessa **custom-template indatanamn**. De har ingen effekt om inte templaten/applikationen konsumerar dem genom parameter- och värdmiljö-mappningar. För `azure-search-openai-demo`, använd dess faktiska namn såsom `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` och `AZURE_SEARCH_SERVICE_SKU` istället. Modellkapacitet är inte konto-SKU.

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

**Utvecklingskonfiguration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Säker konfiguration med Key Vault

Föredra Entra ID med lokal nyckelautentisering inaktiverad. Följande är endast ett **legacy nyckelautentiseringsalternativ** för applikationer som kräver nycklar: det kräver ett konto med nyckelautentisering aktiverad, applikationsidentiteten bifogad dess värd och fungerande Key Vault-åtkomst/nätverk. Kombinera inte nyckelåtkomst med `disableLocalAuth: true` och förvänta dig att nyckelbaserade anrop fungerar.

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

## Distributionsarbetsflöden

### AZD-tillägg för Foundry

För GA-arbetsflödet, installera `microsoft.foundry` paketet istället för att sätta ihop kärntilläggen en i taget:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Paketet installerar agenter, anslutningar, inspektör, projekt, rutiner, färdigheter och verktygslådor. Det lägger inte till en `microsoft.foundry` kommandogrupp. Utvärderingar, dataset, finjustering och anpassade modeller installeras separat vid behov. Se [tilläggspaketeringsreferensen](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent-gånggenomgång (GA)

En **hosted agent** kör din agentkod på Foundry-hanterad beräkning. Denna övning använder den uppströms grundläggande Python Agent Framework Responses API-exemplet, inte de klassiska Agent Service SDK-fragmenten i andra lektioner.

#### 1. Förbered och initiera

Använd en tom katalog utanför denna kurs-checkout. Installera Python 3.13 eller senare och en aktuell [uv-release](https://docs.astral.sh/uv/getting-started/installation/). Fristående uv-installationer kan använda `uv self update`. Kontrollera [hosted-agent behörigheter](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), modelltillgänglighet och kvot i din prenumeration och region innan provisionering. Azure-resurser och lokala modellanrop medför kostnader.

Slutför `azd auth login` och paketinstallationen ovan. Lokalt exempel använder `DefaultAzureCredential`; om du använder Azure CLI-referenser, logga in med `az login` med samma konto och klient som AZD. Endast AZD-inloggning är inte en Azure CLI-inloggning.

Kör detta enkelradiga kommando i Bash eller PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Välj ett nytt eller befintligt Foundry-projekt och önskad prenumeration och region. För att återanvända en modelldistribution, lägg till `--model-deployment <existing-deployment-name>` i initieringskommandot **innan du kör det**, och välj det befintliga projektet. Stanna i katalogen som innehåller den genererade `azure.yaml` för återstående kommandon.

#### 2. Granska deployeringsdefinitionen

Öppna `azure.yaml` och leta upp dessa inställningar i [det uppströms exemplet](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Inställning | Vad att kontrollera |
|---------|---------------|
| `host: azure.ai.project` och `deployments` | Avsett Foundry-projekt och modellnamn, version, deployments-SKU och kapacitet |
| `host: azure.ai.agent` och `project` | Hosted agent och katalogen som innehåller dess källa |
| `codeConfiguration` | Python runtime och startpunkt; det granskade exemplet använder `python_3_13` och `main.py` |
| `uses` | Beroende av Foundry-projektets tjänst |
| `container.resources` | CPU- och minnesallokering, även om koden byggs fjärrstyrt |
| `env` | Modellens deployeringskartläggning och `PYTHONNOUSERSITE: "1"` för att inaktivera pakethantering på användarplats |
| `infra.provider` | `microsoft.foundry`, som syntetiserar nödvändig infrastruktur |

Committa den granskade `azure.yaml` och agentkoden tillsammans. Ingen handskriven infrastruktur krävs för att starta; när du behöver redigerbara provisionsfiler, följ [infrastrukturavskiljning](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) för Bicep eller Terraform och fortsätt använda `azd provision`. Committa inte autentiseringsuppgifter eller `.azure/` miljötillstånd.

#### 3. Provisionera och testa lokalt

```bash
azd provision
azd ai agent run
```

Provisionering kan skapa saknade modelldistributioner **även i ett återanvänt projekt**. Granska modell-promptarna och välj en tillgänglig online-distributionstyp som Global Standard eller Data Zone Standard; kvot och regionalt stöd varierar.

Den lokala körningen förbereder beroenden och öppnar **Agent Inspector**, där du kan inspektera förfrågningar, svar och verktygs-/modellaktivitet. Låt det köras och öppna en andra terminal i samma projektkatalog:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Checkpunkt:** Bekräfta att du mottar ett relevant svar och kan inspektera associerad lokal aktivitet. Lokal körning anropar fortfarande din Azure-modelldistribution; det är inte ett offline- eller gratis test. Använd syntetiska promptar och undvik att exponera hemligheter eller känsliga uppgifter i inspektörsutdata.

#### 4. Distribuera och jämför

Stoppa den lokala körningen med Ctrl+C när du är klar. Innan fjärrtillkallning, konfigurera eller verifiera projektets [Application Insights-anslutning och spårläsningsåtkomst](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

I koddiployeringläge laddar AZD upp källkod för en fjärr-Foundry-build; du behöver ingen lokal containerbyggning för denna väg. Deploymentsutdata förser länkar till playground och slutpunkt. Verifiera ett svar från den distribuerade agenten och dess molnspårning; lokala inspektörshändelser bevisar inte automatiskt att molnspårningen fungerar.

För efterföljande ändringar, granska understödd hosted-agent-konfiguration med `azd deploy --preview`. Strömma loggar med `azd ai agent monitor --follow`, eller diagnostisera setup- och åtkomstproblem med `azd ai agent doctor`. En deploymentförhandsgranskning är inte en komplett infrastruktur- eller säkerhetsgranskning.

#### 5. Lägg till en upprepbar kvalitetskontroll

Installera den fristående utgivna utvärderingstillägget, generera sedan utkast av testobjekt:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Beskriv agentens avsedda beteende och välj **Dataset and evaluator**, sedan **Turn**. Granska och redigera de genererade fallen och betygsskalan, inklusive ett fall med obesvarad fråga, innan du konfigurerar utvärderingen:

```bash
azd ai eval init --name quality
```

Välj det granskade datasetet och rubric och bekräfta domarmodellens distribution. Inspektera `evals/azure.eval.yaml` och dess referens till utvärderingstjänsten i `azure.yaml`, registrera sedan tillgångarna och kör:

```bash
azd up
azd ai eval run start --eval quality
```

Inspektera poäng och misslyckade eller felaktiga fall; en genomförd utvärdering innebär inte automatiskt godkänd kvalitet. Generering och poängsättning medför också modellkostnader. Committa icke-hemlig konfiguration, datasets och rubricer så att teammedlemmar kan jämföra ändringar. `azd ai agent optimize` kan återanvända en kompatibel utvärdering som baslinje, men granska kandidater innan du explicit distribuerar en. Se [kvalitetsgrindar och migrering](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) för äldre projekt och CI.

#### 6. Återanvänd arbetsflödet i CI/CD

Efter en lyckad `azd up`, kör `azd pipeline config` och granska den genererade GitHub Actions- eller Azure DevOps-arbetsflödet. Installera `microsoft.foundry` på runnern, plus `azure.ai.evaluations` om du kör utvärderingar. Behåll genererade checkout-, inloggnings- och miljöinställningar; enbart installation autentiserar inte pipelinen.

Använd en separat AZD-miljö per steg, ge pipeline-identiteten nödvändiga resurs- och Foundry-behörigheter och håll autentiseringsuppgifter i pipeline-hemligheter eller använd federerad identitet. Committa utvärderingstillgångar och verifiera att identiteten kan komma åt refererade dataset/evaluatorer. Se [kursens pipeline-exempel](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) och [Foundry CI/CD-guide](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Rensa upp medvetet

För ett **nytt projekt skapat av denna miljö**, granska resurserna som listas av `azd down` innan du bekräftar: det tar bort resursgruppen och allt i den.

För ett **återanvänt projekt**, `azd down` lämnar projektet, hosted agent och andra resurser kvar. Ta bort endast oönskade resurser du äger enligt [quickstart-rensningsanvisningarna](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); ta inte bort en delad resursgrupp för att städa upp en övning.

**Avslutningskontroll:** Förklara vilka inställningar som kontrollerar lokalt och molnbaserat beteende, visa lokala och distribuerade svar, granska en utvärderingsresultat, och identifiera vilka resurser som finns kvar efter städning.

### Valfritt: Skapa stomme med Microsoft Foundry Skill

Installera [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) för din kodande agentevärd, öppna sedan en separat tom mapp. Be den skapa stomme för grundläggande Python Agent Framework Responses API-exempel i koddiplay-läge, förklara den genererade `azure.yaml`, och föreslå prenumeration, region, projekt och modelldistribution. Kräv godkännande **innan du skapar Azure-resurser**, begär ett lokalt test och stopp före distribution. Granska dess utdata och fortsätt med deployeringsstegen ovan först när du är redo.

För befintliga projekt ersätter `--template`/`-t` den föråldrade stavningen `--manifest`/`-m`; att ändra flaggan migrerar inte äldre manifest eller inbäddad agentkonfiguration. Se [AI CLI referens](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Enkel kommandodeployment

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Miljöspecifika deployment

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
```

Detta provisionerar en Insights-resurs, inte telemetriinstrumentering. När din app genererar utgående modellanropsspans, kör denna illustrativa fråga i Application Insights Logs (anpassa filtret till dina faktiska spansnamn):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kostnadsövervakning

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

Använd en riktig mottagare och verifiera behörigheter för faktureringsomfång. En budget skickar varningar; det är inte en utgiftsgräns.

## 🔐 Säkerhetsbästa praxis

### Hanterad identitetskonfiguration

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

Detta endpoint-fragment kräver också en privat DNS-zon/grupp, VNet-länkar, applikations-VNet-anslutning och en uttrycklig policy för offentlig åtkomst. Att skapa en privat endpoint ensam inaktiverar inte offentlig åtkomst.

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

Azure Cache för Redis Basic/Standard/Premium är på en [avvecklingsväg](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); använd Azure Managed Redis för nya deployment och följ dess aktuella mall-/autentiseringsriktlinjer. Omfånga cachade AI-svar efter auktorisation, modell/instruktioner och dataversion, med utgångstid; dela aldrig privata svar med endast frågetext.

### Autoskaleringskonfiguration

**Delresurs:** slå samman dessa skala-/ingångsinställningar till en komplett Container App med en hanterad miljö, containerbild och resursbegränsningar. Fler repliker ökar inte modellkvotan.

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

**Symptom:**
- Deployment misslyckas med kvotfel
- 429 fel i applikationsloggar

**Lösningar:**
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

Kapacitetsvariabeln ovan gäller endast för en anpassad mall kopplad till att använda den. För RAG-exemplet, använd `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ändra inte `AZURE_LOCATION` för att flytta befintliga resurser; skapa en separat miljö för en ny region och planera migration/rensning.

### Problem 2: Autentiseringsfel

**Symptom:**
- 401/403 fel vid anrop av AI-tjänster
- "Åtkomst nekad"-meddelanden

**Lösningar:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Modell-deploymentsproblem

**Symptom:**
- Modeller ej tillgängliga i deployment
- Specifika modellversioner misslyckas

**Lösningar:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Exempelmallar

Dessa är alternativ, inte sekventiella kommandon. Starta varje i en separat tom katalog. Den uttryckliga `.` destinationen behåller initiering i din aktuella katalog; annars kan aktuellt AZD skapa en mall-namngiven undermapp utan att ändra ditt shells arbetskatalog.

### RAG Chat-applikation (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivning**: En RAG chat-referensapplikation för frågor över dina dokument, med Azure AI Search-återvinning. Granska det aktuella exemplet med stöd för modeller, valfria funktioner, kostnadsriktlinjer och produktionssäkning innan användning; att deploya ett exempel gör inte applikationen produktionsfärdig.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat-applikation (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivning**: .NET/C# motsvarighet till Python RAG chat-exemplet. Byggd med ASP.NET Core Minimal API och Blazor WebAssembly frontend. Inkluderar röstchatt, GPT-4o-mini vision-stöd och en följeslagar .NET MAUI Blazor Hybrid desktop/mobilklient.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat-applikation (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjänster**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivning**: Java-version av RAG chatexemplet som använder Langchain4J för AI-orkestrering. Stöder mikroservice-eventdriven arkitektur, flera sökstrategier (text, vektor, hybrid), dokumentuppladdning med Azure Document Intelligence, och deployment på antingen Azure Container Apps eller Azure Kubernetes Service.

**Snabbstart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjänster**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivning**: End-to-end retail RAG copilot som använder Microsoft Foundry och Prompty. En Contoso Outdoor återförsäljarchatbot som baserar svar på produktkatalog och kundorderdata. Demonstrerar hela GenAIOps arbetsflödet — prototyp med Prompty, utvärdera med AI-assisterade utvärderare, och deploya via AZD till Container Apps.

**Snabbstart**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativ skrivande multi-agent-applikation

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjänster**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivning**: Multi-agentexempel som demonstrerar AI-agentorkestrering med Prompty. Använder en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skrivagent och en redigeringsagent för att gemensamt producera väl undersökta artiklar. Inkluderar CI/CD med utvärdering i GitHub Actions.

**Snabbstart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverlös RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjänster**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB för NoSQL + LangChain.js

**Beskrivning**: Helt serverlös RAG chatbot som använder LangChain.js med Azure Functions för API och Azure Static Web Apps för hosting. Använder Azure Cosmos DB som både vektorlagring och chathistorikdatabas. Stöder lokal utveckling med Ollama för kostnadsfri testning.

**Snabbstart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chatta med din data Lösningsaccelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjänster**: Microsoft Foundry + Azure Container Apps (webb/API/ingestion) + Azure AI Search med Cosmos DB, eller PostgreSQL med pgvector

**Beskrivning**: En dokumentbaserad chataxelator med referenser. Det aktuella exemplet hostar en React frontend, FastAPI backend och Functions ingestion worker på Container Apps; orkestratörsalternativ är Agent Framework och LangGraph. Databas-/återvinning valda vid deployment. Det är en startpunkt, inte ett färdigt produktsystem; anta inte att äldre App Service, Semantic Kernel eller Prompt Flow-varianter beskriver nuvarande standard.

**Snabbstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Resebyråer — Multi-Agent MCP Orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjänster**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivning**: Referensapplikation för multi-agent AI-orkestrering som använder tre ramverk (LangChain.js, LlamaIndex.TS, och Microsoft Agent Framework). Innehåller MCP (Model Context Protocol) servrar i fyra språk deployade som serverlösa Azure Container Apps med OpenTelemetry-övervakning.

**Snabbstart**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Bläddra bland fler mallar**: Besök [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) för för närvarande tillgängliga mallar över språk och scenarier. Varje länkat exempel är ett externt repo, inte ett lokalt exempel från denna kurs; granska dess aktuella förutsättningar och produktionsråd före deployment.

## Nästa steg

1. **Testa exemplen**: Börja med en färdig mall som matchar ditt användningsområde
2. **Anpassa för dina behov**: Modifiera infrastruktur och applikationskod
3. **Lägg till övervakning**: Implementera omfattande observerbarhet
4. **Optimera kostnader**: Finjustera konfigurationer för din budget
5. **Säkra din deployment**: Implementera säkerhetsmönster för företag
6. **Skala till produktion**: Lägg till multi-region och hög tillgänglighet

## 🎯 Praktiska övningar

### Övning 1: Deploy Microsoft Foundry Models Chat App (30 minuter)
**Mål**: Deploya och testa en AI chat-referensapplikation

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

**Framgångskriterier:**
- [ ] Deployment klarar utan kvotfel
- [ ] Kan nå chattgränssnitt i webbläsare
- [ ] Kan ställa frågor och få AI-drivna svar
- [ ] Application Insights visar telemetridata
- [ ] Resurser rensades framgångsrikt upp

**Kostnad:** Granska exempelns aktuella kostnadsguide och valda SKU:er innan deployment. Fakturering fortsätter tills resurser tas bort; ingen fast 30-minuters uppskattning gäller för alla konfigurationer.

### Övning 2: Konfigurera Multi-Model Deployment (45 minuter)
**Mål**: Deploya flera AI-modeller med olika konfigurationer

**Startpunkt:** Ett befintligt Azure OpenAI-konto och ett AZD resource-group-modul som kan anropa denna fil. Skapa `infra/ai-models.bicep` med följande innehåll i din editor. Det deployas inte automatiskt bara för att det ligger under `infra/`.

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

Från resource-group-scope-modulen som äger kontot, lägg till en modul-anrop (anpassa symbolnamnet till ditt faktiska konto):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Deklarera inte samma deployment i båda modulerna. Om AZD-entré är prenumerationsscope, anropa detta från dess resource-group-scope barnmodul och justera den relativa sökvägen. Bygg den containande modulen med `az bicep build --file <path-to-containing-module>`, sedan:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Framgångskriterier:**
- [ ] Flera modeller deployade framgångsrikt
- [ ] Olika kapacitetsinställningar tillämpade
- [ ] Modeller tillgängliga via API
- [ ] Kan anropa båda modeller från applikation

### Övning 3: Implementera kostnadsövervakning (20 minuter)
**Mål**: Sätt upp budgetvarningar och kostnadsspårning

**Startpunkt:** Budgetmönstret ovan och en resursgruppsbaserad infrastrukturmodul. Lägg till denna resurs i din editor; skicka `budgetStartDate` från din parametermappning (duplicera inte parametern om redan deklarerad). Ersätt mottagaren och bekräfta att du har skrivrättigheter för budget.

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

Förväntat: svaret innehåller `amount: 200`, båda trösklarna och din mottagare. Inspektera Cost Management i portalen för faktiska avgifter; kostnadsdata är fördröjd och en varning behöver inte triggas under en kort övning.

**Framgångskriterier:**
- [ ] Budgetvarning skapad i Azure
- [ ] E-postmeddelanden konfigurerade
- [ ] Kan visa kostnadsdata i Azure Portal
- [ ] Budgettrösklar korrekt satta

## 💡 Vanliga frågor

<details>
<summary><strong>Hur minskar jag Microsoft Foundry Models-kostnader under utveckling?</strong></summary>

1. **Kolla prissättning**: Det finns ingen universell gratis månadsgräns på 50 000 token för Azure OpenAI-modeller
2. **Rätt dimensionerad kapacitet**: Kapacitet `10` representerar typiskt 10 000 TPM för dessa Standard textmodeller, inte 10 TPM. Att minska denna hastighetsbegränsning minskar inte per-token-priser.
3. **Använd azd down**: Ta bort temporära resurser när du inte aktivt utvecklar (detta är inte allokering)
4. **Cache-svar**: Implementera Redis-cache för upprepade frågor
5. **Använd Prompt Engineering**: Minska tokenanvändning med effektiva promptar

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Vad är skillnaden mellan Microsoft Foundry Models och OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Företagssäkerhet och efterlevnad
- Integrering i privat nätverk
- SLA-garantier
- Hanterad identitetsautentisering
- Högre kvoter tillgängliga

**OpenAI API**: En separat leverantör/API med egen modelltillgänglighet, prissättning, autentisering och företagsanslutningsalternativ. Jämför aktuella erbjudanden istället för att anta att det bara är tillgängligt över allmänt internet eller alltid släpper modeller först.

Välj baserat på din organisations krav; Azure-specifika hanterade identitets- och privatlänksexempel i denna kurs gäller för Azure-hostade tjänster, inte varje modell/leverantör i Foundry-katalogen.
</details>

<details>
<summary><strong>Hur hanterar jag kvotöverskridningsfel för Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Kan jag använda mina egna data med Microsoft Foundry Models?</strong></summary>

Ja! Använd **Azure AI Search** för RAG (Retrieval Augmented Generation):

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

Se [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) mallen.
</details>

<details>
<summary><strong>Hur säkrar jag AI-modellendpoints?</strong></summary>

**Bästa metoder**:
1. Använd Managed Identity (inga API-nycklar)
2. Aktivera privata endpoints
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

## Community och support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiell dokumentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installera Azure + Foundry agent skills i din editor med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående kapitel**: [Kapitel 1: Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [AI-agenter](agents.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i våra communitydiskussioner eller öppna en issue i lagret. Azure AI + AZD-communityn finns här för att hjälpa dig lyckas!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
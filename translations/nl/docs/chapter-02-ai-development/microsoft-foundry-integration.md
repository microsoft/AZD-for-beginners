# Microsoft Foundry-integratie met AZD

**Navigatie hoofdstuk:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgende**: [AI Agents](agents.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

## Overzicht

Deze gids demonstreert hoe Microsoft Foundry-diensten geïntegreerd kunnen worden met Azure Developer CLI (AZD) voor gestroomlijnde AI-toepassingsimplementaties. Microsoft Foundry biedt een uitgebreid platform voor het bouwen, implementeren en beheren van AI-toepassingen, terwijl AZD het infrastructuur- en implementatieproces vereenvoudigt.

## Wat is Microsoft Foundry?

Microsoft Foundry is Microsofts uniforme platform voor AI-ontwikkeling dat omvat:

- **Model Catalogus**: Toegang tot geavanceerde AI-modellen
- **Prompt Flow**: Visuele ontwerper voor AI-workflows
- **Microsoft Foundry Portal**: Geïntegreerde ontwikkelomgeving voor AI-toepassingen
- **Implementatie-opties**: Meerdere hosting- en schaalopties
- **Veiligheid en Beveiliging**: Ingebouwde verantwoordelijke AI-functies

## AZD + Microsoft Foundry: Beter Samen

| Kenmerk | Microsoft Foundry | AZD Integratie Voordeel |
|---------|-----------------|------------------------|
| **Modelimplementatie** | Handmatige portal-implementatie | Geautomatiseerde, herhaalbare implementaties |
| **Infrastructuur** | Project- en resourceconfiguratie | Start vanaf `azure.yaml`; exporteer Bicep of Terraform indien nodig |
| **Omgevingsbeheer** | Focus op één omgeving | Meerdere omgevingen (dev/staging/prod) |
| **CI/CD Integratie** | Implementatie- en evaluatiediensten | Hergebruik configuratie in GitHub Actions of Azure DevOps |
| **Kostenbeheer** | Basis monitoring | Omgevingsspecifieke kostenoptimalisatie |

## Vereisten

- Azure-abonnement met de juiste machtigingen
- Azure Developer CLI 1.37.0 of later voor de GA Foundry workflow
- Toegang tot Microsoft Foundry Models-diensten
- Basiskennis van Microsoft Foundry

> **Foundry GA update (2026-11-09):** De `microsoft.foundry` extensiebundel bereikte versie 1.0 en algemene beschikbaarheid op [5 november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). De onderstaande walkthrough volgt die aankondiging en de gelinkte Microsoft Learn quickstart. Dit is een documentatiereview, geen live implementatievalidatie. Optionele preview-functies en onafhankelijk uitgebracht extensies behouden hun eigen release-status.

**Leerdoelen:** Installeer de GA-bundel, bekijk een agent's `azure.yaml`, vergelijk lokale en geïmplementeerde antwoorden, en leg evaluatie, CI/CD en opruimgrenzen uit. Voor een stapsgewijze agent-implementatie, ga naar de [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). De onderstaande resource-fragmenten behandelen andere integratiepatronen.

## Kern Integratiepatronen

**Reikwijdte van de voorbeelden:** De onderstaande Bicep bevat illustratieve resource-fragmenten, geen complete implementeerbare sjabloon. De omvattende sjabloon moet namen, `location`, gerefereerde resources, identiteiten, outputs en applicatie-hosting definiëren. Gebruik een gelinkte voorbeeld voor een uitvoerbaar startpunt. Bash-voorbeelden vereisen aparte Azure CLI-authenticatie van `azd auth login`.

### Patroon 1: Microsoft Foundry Models Integratie

**Gebruikssituatie**: Deploy chattoepassingen met Azure OpenAI-modellen in Microsoft Foundry

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

**Infrastructuur (main.bicep):**
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

De aanroeper heeft een aangesloten beheerde identiteit en `Cognitive Services OpenAI User` op accountniveau nodig; het uitschakelen van sleutels verleent geen toegang. Controleer regio/model/SKU-beschikbaarheid en quota voorafgaand aan implementatie.

### Patroon 2: AI Search + RAG Integratie

**Gebruikssituatie**: Implementeer retrieval-augmented generation (RAG) toepassingen

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

Er is geen `Microsoft.Search/searchServices/dataConnections` ARM-resource voor deze integratie. Configureer een Search-index, gegevensbron, indexer/skillset of vectorizer via de ondersteunde Search data-plane API's. Als Search een embedding-model aanroept, schakel dan diens beheerde identiteit in, ken de relevante modelrol toe en configureer diens embedding skill/vectorizer. Zie [geïntegreerde vectorisatie](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Patroon 3: Document Intelligence Integratie

**Gebruikssituatie**: Documentverwerkings- en analyseworkflows

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

## 🔧 Configuratiepatronen

### Omgevingsvariabelen Instellen

Behalve voor gedocumenteerde AZD-instellingen zoals `AZURE_LOCATION`, zijn dit **aangepaste sjabloon invoernamen**. Ze hebben geen effect tenzij de sjabloon/applicatie ze gebruikt via parameter- en host-omgevingsmappingen. Voor `azure-search-openai-demo`, gebruik zijn daadwerkelijke namen zoals `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` en `AZURE_SEARCH_SERVICE_SKU` in plaats daarvan. Modelcapaciteit is geen account-SKU.

**Productieconfiguratie:**
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

**Ontwikkelconfiguratie:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Beveiligde Configuratie met Key Vault

Geef de voorkeur aan Entra ID met lokale sleutelverificatie uitgeschakeld. Het volgende is slechts een **verouderd sleutelverificatie-alternatief** voor applicaties die sleutels vereisen: het vereist een account met sleutelverificatie ingeschakeld, de toepassingsidentiteit gekoppeld aan zijn host, en werkende Key Vault-toegang/netwerk. Combineer geen sleutelophaling met `disableLocalAuth: true` en verwacht niet dat sleutelgebaseerde aanroepen werken.

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

## Implementatieworkflows

### AZD-uitbreidingen voor Foundry

Voor de GA workflow, installeer de `microsoft.foundry` bundel in plaats van de kernuitbreidingen één voor één samen te stellen:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

De bundel installeert agents, verbindingen, inspector, projecten, routines, vaardigheden en toolboxen. Het voegt geen `microsoft.foundry` commando groep toe. Evaluaties, datasets, fine-tuning en aangepaste modellen worden apart geïnstalleerd indien nodig. Zie de [extensie verpakkingsreferentie](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent Walkthrough (GA)

Een **hosted agent** voert je agentcode uit op Foundry-beheerde compute. Deze oefening gebruikt het upstream basisvoorbeeld van Python Agent Framework Responses API, niet de klassieke Agent Service SDK-fragmenten in andere lessen.

#### 1. Voorbereiden en initialiseren

Gebruik een lege map buiten deze cursusuitcheck. Installeer Python 3.13 of later en een actuele [uv release](https://docs.astral.sh/uv/getting-started/installation/). Standalone uv-installaties kunnen `uv self update` gebruiken. Controleer [hosted-agent machtigingen](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), modelbeschikbaarheid en quota in je abonnement en regio voordat je gaat provisioneren. Azure-resources en lokale modelaanroepen brengen kosten met zich mee.

Voltooi `azd auth login` en bundelinstallatie hierboven. Lokale voorbeeldcode gebruikt `DefaultAzureCredential`; als je Azure CLI-referenties gebruikt, meld je dan aan met `az login` via hetzelfde account en tenant als AZD. Alleen aanmelden bij AZD is geen aanmelding bij Azure CLI.

Voer deze enkelregelige opdracht uit in Bash of PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Kies een nieuw of bestaand Foundry-project en het beoogde abonnement en regio. Om een modelimplementatie te hergebruiken voeg `--model-deployment <existing-deployment-name>` toe aan het initialisatiecommando **voordat je het uitvoert**, en selecteer het bestaande project. Blijf in de map die de gegenereerde `azure.yaml` bevat voor de resterende opdrachten.

#### 2. Review de implementatiedefinitie

Open `azure.yaml` en vind deze instellingen in het [upstream voorbeeld](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Instelling | Te controleren |
|---------|---------------|
| `host: azure.ai.project` en `deployments` | Beoogd Foundry-project en modelnaam, versie, implementatie SKU en capaciteit |
| `host: azure.ai.agent` en `project` | Hosted agent en de map van zijn broncode |
| `codeConfiguration` | Python runtime en entrypoint; het beoordeelde voorbeeld gebruikt `python_3_13` en `main.py` |
| `uses` | Afhankelijkheid van de Foundry projectdienst |
| `container.resources` | CPU- en geheugenallocatie, hoewel code extern wordt gebouwd |
| `env` | Modelimplementatiemapping en `PYTHONNOUSERSITE: "1"` om laden van gebruikerssite-pakketten uit te schakelen |
| `infra.provider` | `microsoft.foundry`, die de benodigde infrastructuur synthetiseert |

Commit de beoordeelde `azure.yaml` en agentcode samen. Geen handgeschreven infrastructuur vereist om te starten; als je bewerkbare provisioningbestanden nodig hebt, volg dan [infrastructuur ejectie](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) voor Bicep of Terraform en blijf `azd provision` gebruiken. Commit geen referenties of `.azure/` omgevingsstatus.

#### 3. Provision en test lokaal

```bash
azd provision
azd ai agent run
```

Provisioning kan missende modelimplementaties creëren **zelfs in een hergebruikt project**. Review de modelprompts en selecteer een beschikbare online implementatietype zoals Global Standard of Data Zone Standard; quota en regionale ondersteuning variëren.

De lokale uitvoering bereidt afhankelijkheden voor en opent **Agent Inspector**, waar je verzoeken, antwoorden en tool/model-activiteit kunt inspecteren. Houd dit open en open een tweede terminal in dezelfde projectmap:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Controlepunt:** Bevestig dat je een relevant antwoord ontvangt en de bijbehorende lokale activiteit kunt inspecteren. Lokale uitvoering roept nog steeds je Azure-modelimplementatie aan; het is geen offline of gratis test. Gebruik synthetische prompts en vermijd het blootstellen van geheimen of gevoelige data in inspector-output.

#### 4. Implementeer en vergelijk

Stop de lokale uitvoering met Ctrl+C als je klaar bent. Configureer of verifieer vóór remote aanroep de [Application Insights-verbinding en trace-toegang van het project](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

In code-implementatiemodus uploadt AZD broncode voor een Foundry-build op afstand; je hebt geen lokale containerbuild nodig voor dit pad. Implementatie-uitvoer biedt playground- en endpoint-links. Verifieer een antwoord van de geïmplementeerde agent en diens cloud-trace; alleen lokale inspector-events bewijzen niet dat cloud-tracing werkt.

Voor volgende wijzigingen, review ondersteunde hosted-agent configuratie met `azd deploy --preview`. Stream logs met `azd ai agent monitor --follow`, of diagnoseer setup- en toegangsproblemen met `azd ai agent doctor`. Een implementatievoorvertoning is geen volledige infrastructuur- of beveiligingsreview.

#### 5. Voeg een herhaalbare kwaliteitscontrole toe

Installeer de onafhankelijk uitgegeven evaluatie-extensie, genereer dan voorlopige testobjecten:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Beschrijf het beoogde gedrag van de agent en selecteer **Dataset en beoordelaar**, vervolgens **Turn**. Review en bewerk de gegenereerde gevallen en beoordelingsrubriek, inclusief een geval met een niet-ondersteunde vraag, voordat je de evaluatie configureert:

```bash
azd ai eval init --name quality
```

Selecteer de beoordeelde dataset en rubriek en bevestig de rechter modelimplementatie. Inspecteer `evals/azure.eval.yaml` en diens evaluatieservice-referentie in `azure.yaml`, registreer dan de objecten en voer uit:

```bash
azd up
azd ai eval run start --eval quality
```

Inspecteer scores en gevallen die mislukten of fouten bevatten; een voltooide evaluatie is niet automatisch een kwaliteitsgoedkeuring. Generatie en scoring brengen ook modelkosten met zich mee. Commit niet-geheime configuratie, datasets, en rubrieken zodat teamleden wijzigingen kunnen vergelijken. `azd ai agent optimize` kan een compatibele evaluatie als basislijn hergebruiken, maar review kandidaten voordat je er expliciet één implementeert. Zie [kwaliteitsmeters en migratie](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) voor oudere projecten en CI.

#### 6. Hergebruik de workflow in CI/CD

Na een succesvolle `azd up`, run `azd pipeline config` en review de gegenereerde GitHub Actions of Azure DevOps workflow. Installeer `microsoft.foundry` op de runner, plus `azure.ai.evaluations` als evaluaties worden uitgevoerd. Behoud gegenereerde checkout-, aanmeld- en omgevingsinstellingen; alleen installatie authenticeert de pipeline niet.

Gebruik een aparte AZD-omgeving per fase, geef de pipeline-identiteit de benodigde resource- en Foundry-machtigingen, en bewaar referenties in pipeline-geheimen of gebruik federatieve identiteit. Commit evaluatie-objecten en verifieer dat de identiteit toegang heeft tot gerefereerde datasets/beoordelaars. Zie het [cursus-pipelinevoorbeeld](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) en [Foundry CI/CD gids](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Maak doelbewust schoon

Voor een **nieuw project gemaakt door deze omgeving**, review de resources die worden vermeld door `azd down` voordat je bevestigt: het verwijdert de resourcegroep en alles daarin.

Voor een **hergebruikt project**, `azd down` laat het project, hosted agent en andere resources staan. Verwijder alleen ongewenste resources die je bezit met de [quickstart opruimrichtlijnen](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); verwijder geen gedeelde resourcegroep om één oefening op te ruimen.

**Voltooiingscontrole:** Leg uit welke instellingen lokaal en cloudgedrag regelen, toon lokale en geïmplementeerde antwoorden, review een evaluatieresultaat, en identificeer welke resources na opruiming overblijven.

### Optioneel: Scaffold met de Microsoft Foundry Skill

Installeer de [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) voor je codeeragent-host, open dan een aparte lege map. Vraag het om het basis Python Agent Framework Responses API voorbeeld in code-implementatiemodus te scaffolden, leg de gegenereerde `azure.yaml` uit, en stel abonnement, regio, project en modelimplementatie voor. Vereis goedkeuring **voordat Azure-resources worden aangemaakt**, vraag een lokale test aan en stop vóór implementatie. Review de output en ga pas verder met de bovenstaande implementatiestappen wanneer je klaar bent.

Voor bestaande projecten vervangt `--template`/`-t` de verouderde schrijfwijze `--manifest`/`-m`; het wijzigen van de vlag migreert geen legacy-manifesten of geneste agentconfiguratie. Zie de [AI CLI referentie](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Enkelvoudige opdrachtimplementatie

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Omgevingsspecifieke implementaties

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

## Monitoring en Observeerbaarheid

### Integratie met Application Insights

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

Dit voorziet in een Insights-resource, geen telemetrie-instrumentatie. Zodra uw app uitgaande model-aanroepspannen genereert, voert u deze illustratieve query uit in Application Insights Logs (pas het filter aan naar uw werkelijke span-namen):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kostenmonitoring

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

Gebruik een echte ontvanger en controleer de billing-scope machtigingen. Een budget stuurt waarschuwingen; het is geen uitgavengrens.

## 🔐 Beste praktijken voor beveiliging

### Configuratie van beheerde identiteit

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

### Netwerkbeveiliging

Dit endpoint-fragment heeft ook een privé-DNS-zone/groep, VNet-koppelingen, applicatie-VNet-connectiviteit en een expliciet beleid voor publieke toegang nodig. Alleen een privé-endpoint aanmaken schakelt publieke toegang niet uit.

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

## Prestatieoptimalisatie

### Cachestrategieën

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

Azure Cache voor Redis Basic/Standard/Premium zit op een [uitfaseringstraject](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gebruik Azure Managed Redis voor nieuwe implementaties en volg de huidige richtlijnen voor sjablonen/authenticatie. Scope gecachte AI-responses op autorisatie, model/instructies en dataversie, met vervaldatum; deel privé-antwoorden nooit alleen met querytekst.

### Auto-scaling-configuratie

**Gedeeltelijke resource:** voeg deze schaal-/ingang-instellingen samen tot een complete Container App met een beheerde omgeving, containerimage en resource-limieten. Meer replicas verhogen niet de modelquota.

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

## Probleemoplossing van veelvoorkomende problemen

### Probleem 1: OpenAI-quota overschreden

**Symptomen:**
- Implementatie faalt met quota-fouten
- 429-fouten in toepassingslogs

**Oplossingen:**
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

De capaciteit variabele hierboven geldt alleen voor een aangepast sjabloon dat is aangesloten om deze te gebruiken. Voor het RAG-voorbeeld gebruikt u `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Wijzig `AZURE_LOCATION` niet om bestaande resources te verplaatsen; creëer een aparte omgeving voor een nieuwe regio en plan migratie/opruiming.

### Probleem 2: Authenticatiefouten

**Symptomen:**
- 401/403-fouten bij oproepen naar AI-diensten
- "Toegang geweigerd" berichten

**Oplossingen:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Probleem 3: Model-implementatieproblemen

**Symptomen:**
- Modellen niet beschikbaar in implementatie
- Specifieke modelversies falen

**Oplossingen:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Voorbeeldsjablonen

Dit zijn alternatieven, geen opeenvolgende opdrachten. Start elke in een aparte lege map. De expliciete `.` bestemming houdt de initialisatie in uw huidige map; anders kan huidige AZD een sjabloonnaam-ondermap maken zonder uw shell-werkmap te wijzigen.

### RAG Chat Applicatie (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Diensten**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beschrijving**: Een RAG-chatreferentieapplicatie voor vragen over uw documenten, met Azure AI Search retrieval. Bekijk de huidige ondersteunde modellen, optionele functies, kostengids en productiefase-uitrusting voordat u het gebruikt; het implementeren van een voorbeeld maakt een applicatie niet meteen productierijp.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Applicatie (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Diensten**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beschrijving**: De .NET/C#-equivalent van het Python RAG-chatvoorbeeld. Gebouwd met ASP.NET Core Minimal API en Blazor WebAssembly frontend. Bevat spraakchat, GPT-4o-mini visuele ondersteuning en een begeleidende .NET MAUI Blazor Hybrid desktop/mobiele client.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Applicatie (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Diensten**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beschrijving**: Java-versie van het RAG-chatvoorbeeld dat Langchain4J gebruikt voor AI-orchestratie. Ondersteunt microservices event-gedreven architectuur, meerdere zoekstrategieën (tekst, vector, hybride), documentupload met Azure Document Intelligence en implementatie op Azure Container Apps of Azure Kubernetes Service.

**Snelstart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot met Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Diensten**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beschrijving**: End-to-end retail RAG-copilot met Microsoft Foundry en Prompty. Een Contoso Outdoor retailer chatbot die antwoorden baseert op productcatalogus en klantbestelgegevens. Demonstreert de volledige GenAIOps workflow — prototype met Prompty, evaluatie met AI-ondersteunde beoordelaars en implementatie via AZD naar Container Apps.

**Snelstart**:
```bash
azd init --template contoso-chat .
azd up
```

### Creatieve Schrijf Multi-Agent Applicatie

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Diensten**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beschrijving**: Multi-agent voorbeeld dat AI-agentorchestratie met Prompty demonstreert. Gebruikt een onderzoeksagent (Bing Grounding in Azure AI Agent Service), een productagent (Azure AI Search), een schrijver-agent en een redacteur-agent om gezamenlijk goed onderzochte artikelen te produceren. Bevat CI/CD met evaluatie in GitHub Actions.

**Snelstart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Diensten**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB voor NoSQL + LangChain.js

**Beschrijving**: Volledig serverless RAG-chatbot met LangChain.js, Azure Functions voor de API en Azure Static Web Apps voor hosting. Gebruikt Azure Cosmos DB als zowel vectoropslag als chatgeschiedenisdatabase. Ondersteunt lokale ontwikkeling met Ollama voor kosteloos testen.

**Snelstart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat met uw Data Oplossingsversneller

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Diensten**: Microsoft Foundry + Azure Container Apps (web/API/ingestie) + Azure AI Search met Cosmos DB, of PostgreSQL met pgvector

**Beschrijving**: Een document-onderbouwde chatversneller met citaties. De huidige voorbeeldhost bevat een React frontend, FastAPI backend en Functions ingestiewerker op Container Apps; orkestratoropties zijn Agent Framework en LangGraph. Database-/ophaalopties worden gekozen bij implementatie. Het is een startpunt, geen kant-en-klaar productiesysteem; neem niet aan dat oudere App Service, Semantic Kernel of Prompt Flow varianten de huidige standaard beschrijven.

**Snelstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Reisagenten — Multi-Agent MCP Orchestratie

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Diensten**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beschrijving**: Referentieapplicatie voor multi-agent AI-orchestratie met drie frameworks (LangChain.js, LlamaIndex.TS en Microsoft Agent Framework). Heeft MCP (Model Context Protocol)-servers in vier talen die worden geïmplementeerd als serverless Azure Container Apps met OpenTelemetry-monitoring.

**Snelstart**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Blader door meer sjablonen**: Bezoek de [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) voor momenteel beschikbare sjablonen voor talen en scenario's. Elk gelinkt voorbeeld is een externe repository, geen lokaal voorbeeld dat bij deze cursus wordt geleverd; inspecteer de huidige vereisten en productierichtlijnen vóór implementatie.

## Volgende stappen

1. **Probeer de voorbeelden**: Begin met een kant-en-klaar sjabloon dat bij uw gebruiksgeval past
2. **Pas aan voor uw behoeften**: Wijzig infrastructuur en applicatiecode
3. **Voeg monitoring toe**: Implementeer uitgebreide observeerbaarheid
4. **Optimaliseer kosten**: Stel configuraties af op uw budget
5. **Beveilig uw implementatie**: Implementeer beveiligingspatronen voor ondernemingen
6. **Schaal naar productie**: Voeg multi-region en hoge-beschikbaarheidsfuncties toe

## 🎯 Praktische oefeningen

### Oefening 1: Implementeer Microsoft Foundry Models Chat-app (30 minuten)
**Doel**: Implementeer en test een AI-chatreferentieapplicatie

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

**Succescriteria:**
- [ ] Implementatie voltooit zonder quota-fouten
- [ ] Toegang tot chatinterface in browser mogelijk
- [ ] Kan vragen stellen en AI-aangedreven antwoorden krijgen
- [ ] Application Insights toont telemetriedata
- [ ] Resources succesvol opgeschoond

**Kosten:** Bekijk de huidige kostengids en geselecteerde SKU's van het voorbeeld voordat u implementeert. Facturering loopt door totdat resources worden verwijderd; er geldt geen vaste 30-minuten schatting voor elke configuratie.

### Oefening 2: Configureer Multi-Model Implementatie (45 minuten)
**Doel**: Implementeer meerdere AI-modellen met verschillende configuraties

**Startpunt:** Een bestaand Azure OpenAI-account en een AZD resource-group module die dit bestand kan aanroepen. Maak `infra/ai-models.bicep` met de volgende inhoud met uw editor. Het wordt niet automatisch geïmplementeerd alleen omdat het onder `infra/` staat.

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

Vanuit de resource-group-gescopeerde module die het account bezit, voegt u een module-aanroep toe (pas de symboolnaam aan naar uw werkelijke account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Declareer niet dezelfde implementaties in beide modules. Als het AZD-ingangspunt abonnement-gebaseerd is, roep dit dan aan vanuit de resource-group-gebaseerde kindmodule en pas het relatieve pad aan. Bouw die omvattende module met `az bicep build --file <path-to-containing-module>`, en daarna:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Succescriteria:**
- [ ] Meerdere modellen succesvol geïmplementeerd
- [ ] Verschillende capaciteitsinstellingen toegepast
- [ ] Modellen toegankelijk via API
- [ ] Kan beide modellen aanroepen vanuit applicatie

### Oefening 3: Implementeer Kostenmonitoring (20 minuten)
**Doel**: Stel budgetwaarschuwingen en kostentracking in

**Startpunt:** Het budgetpatroon hierboven en een resource-group-gebaseerde infrastructuurmodule. Voeg deze resource toe met uw editor; geef `budgetStartDate` door uit uw parameterkoppeling (dupliceer de parameter niet als deze al is gedeclareerd). Vervang de ontvanger en bevestig dat u schrijfrechten voor budget hebt.

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

Verwacht: de respons bevat `amount: 200`, beide drempels en uw ontvanger. Inspecteer Kostenbeheer in het portaal voor werkelijke kosten; kostengegevens zijn vertraagd en een waarschuwing hoeft niet af te gaan tijdens een korte oefening.

**Succescriteria:**
- [ ] Budgetwaarschuwing aangemaakt in Azure
- [ ] E-mail notificaties geconfigureerd
- [ ] Kan kostengegevens bekijken in Azure Portal
- [ ] Budgetdrempels juist ingesteld

## 💡 Veelgestelde vragen

<details>
<summary><strong>Hoe kan ik kosten van Microsoft Foundry Models tijdens ontwikkeling verminderen?</strong></summary>

1. **Controleer prijzen**: Er is geen universeel gratis maandelijkse toeslag van 50.000 tokens voor Azure OpenAI-modellen
2. **Pas capaciteit aan**: Capaciteit `10` vertegenwoordigt doorgaans 10.000 TPM voor deze Standard tekstmodellen, niet 10 TPM. Het verlagen van dit snelheidslimiet verlaagt de prijzen per token niet
3. **Gebruik azd down**: Verwijder wegwerpresources wanneer u niet actief ontwikkelt (dit is geen deallocatie)
4. **Cache Over responses**: Implementeer Redis-cache voor herhaalde queries
5. **Gebruik Prompt Engineering**: Verminder tokenverbruik met efficiënte prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Wat is het verschil tussen Microsoft Foundry Models en OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise beveiliging en naleving
- Integratie in privénetwerk
- SLA-garanties
- Authenticatie met beheerde identiteit
- Hogere quota beschikbaar

**OpenAI API**: Een aparte provider/API-aanbieder met eigen modelbeschikbaarheid, prijsstelling, authenticatie en enterprise-connectiviteitsopties. Vergelijk huidige aanbiedingen in plaats van aan te nemen dat het alleen via openbaar internet werkt of altijd eerst modellen uitbrengt.

Kies op basis van de vereisten van uw organisatie; Azure-specifieke voorbeelden met beheerde identiteit en privélink in deze cursus gelden voor Azure-hosted services, niet voor elk model/provider in de Foundry-catalogus.
</details>

<details>
<summary><strong>Hoe ga ik om met Microsoft Foundry Models quota overschreden fouten?</strong></summary>

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
<summary><strong>Kan ik mijn eigen data gebruiken met Microsoft Foundry Models?</strong></summary>

Ja! Gebruik **Azure AI Search** voor RAG (Retrieval Augmented Generation):

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

Zie het [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sjabloon.
</details>

<details>
<summary><strong>Hoe beveilig ik AI-modelendpoints?</strong></summary>

**Beste praktijken**:
1. Gebruik Managed Identity (geen API-sleutels)
2. Schakel Private Endpoints in
3. Configureer netwerkbeveiligingsgroepen
4. Implementeer rate limiting
5. Gebruik Azure Key Vault voor geheimen

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

## Community en Ondersteuning

- **Microsoft Foundry Discord**: [#Azure kanaal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues en discussies](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiële documentatie](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill op skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installeer Azure + Foundry agent skills in je editor met `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdnavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 2 - AI-First Ontwikkeling
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 1: Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgend**: [AI Agents](agents.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 3: Configuratie](../chapter-03-configuration/configuration.md)

**Hulp nodig?** Doe mee aan onze community-discussies of open een issue in de repository. De Azure AI + AZD-community helpt je graag om te slagen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
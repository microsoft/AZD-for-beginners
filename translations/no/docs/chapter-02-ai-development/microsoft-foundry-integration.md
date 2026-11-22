# Microsoft Foundry-integrasjon med AZD

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige kapittel**: [Kapittel 1: Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [AI-agenter](agents.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Oversikt

Denne veiledningen viser hvordan du integrerer Microsoft Foundry-tjenester med Azure Developer CLI (AZD) for effektiv utrulling av AI-applikasjoner. Microsoft Foundry tilbyr en omfattende plattform for å bygge, distribuere og administrere AI-applikasjoner, mens AZD forenkler infrastruktur- og distribusjonsprosessen.

## Hva er Microsoft Foundry?

Microsoft Foundry er Microsofts samordnede plattform for AI-utvikling som inkluderer:

- **Modellkatalog**: Tilgang til toppmoderne AI-modeller
- **Prompt Flow**: Visuell designer for AI-arbeidsflyter
- **Microsoft Foundry Portal**: Integrert utviklingsmiljø for AI-applikasjoner
- **Distribusjonsalternativer**: Flere hosting- og skaleringsmuligheter
- **Sikkerhet og Trygghet**: Innebygde ansvarlige AI-funksjoner

## AZD + Microsoft Foundry: Bedre sammen

| Funksjon | Microsoft Foundry | Fordel med AZD-integrasjon |
|---------|-----------------|------------------------|
| **Modellutrulling** | Manuell portalutrulling | Automatiserte, repeterbare utrullinger |
| **Infrastruktur** | Prosjekt- og ressurskonfigurasjon | Start fra `azure.yaml`; kjør ut Bicep eller Terraform ved behov |
| **Miljøadministrasjon** | Fokuserer på enkeltmiljø | Flere miljøer (dev/staging/prod) |
| **CI/CD-integrasjon** | Distribusjons- og evalueringsjenester | Gjenbruk konfigurasjon i GitHub Actions eller Azure DevOps |
| **Kostnadshåndtering** | Grunnleggende overvåking | Kostnadsoptimalisering per miljø |

## Forutsetninger

- Azure-abonnement med riktige tillatelser
- Azure Developer CLI 1.37.0 eller nyere for GA Foundry-arbeidsflyten
- Tilgang til Microsoft Foundry Models-tjenester
- Grunnleggende kjennskap til Microsoft Foundry

> **Foundry GA-oppdatering (2026-11-09):** Utvidelsespakken `microsoft.foundry` nådde versjon 1.0 og generell tilgjengelighet den [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gjennomgangen nedenfor følger denne kunngjøringen og den lenkede Microsoft Learn-komm igangsetteren. Dette er en dokumentasjonsgjennomgang, ikke en validering av live-distribusjon. Valgfrie forhåndsvisningsfunksjoner og uavhengig utgitte utvidelser beholder sin egen utgivelsesstatus.

**Læringsutbytte:** Installer GA-pakken, gjennomgå en agents `azure.yaml`, sammenlign lokale og distribuerte svar, og forklar evaluering, CI/CD og rengjøringsgrenser. For en trinnvis agentdistribusjon, gå til [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Ressursfragmentene nedenfor dekker andre integrasjonsmønstre.

## Kjernintegrasjonsmønstre

**Omfang av eksemplene:** Bicep-koden nedenfor inneholder illustrative ressursfragmenter, ikke en komplett distribuerbar mal. Den inneholdende malen må definere navn, `location`, refererte ressurser, identiteter, utdata og applikasjonshosting. Bruk et tilknyttet eksempel som et kjørbart utgangspunkt. Bash-eksempler krever separat autentisering med Azure CLI fra `azd auth login`.

### Mønster 1: Microsoft Foundry Models-integrasjon

**Brukstilfelle**: Distribuer chatteapplikasjoner med Azure OpenAI-modeller i Microsoft Foundry

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

Kalleren trenger en tilknyttet administrert identitet og `Cognitive Services OpenAI User` på kontonivå; deaktivering av nøkler gir ikke tilgang. Verifiser region/modell/SKU tilgjengelighet og kvote før distribusjon.

### Mønster 2: AI-søk + RAG-integrasjon

**Brukstilfelle**: Distribuer hente-augmenterte genereringsapplikasjoner (RAG)

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

Det finnes ingen `Microsoft.Search/searchServices/dataConnections` ARM-ressurs for denne integrasjonen. Konfigurer en Søk-indeks, datakilde, indekserer/ferdighetssett eller vektorizer gjennom de støttede Søk-dataflyt-API-ene. Hvis Søk kaller en innebyggingsmodell, aktiver dens administrerte identitet, gi relevant modellrolle, og konfigurer innebyggingsferdigheten/vektorizeren. Se [integrert vektorisering](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Mønster 3: Dokumentintelligensintegrasjon

**Brukstilfelle**: Dokumentbehandlings- og analysearbeidsflyter

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

Bortsett fra dokumenterte AZD-innstillinger som `AZURE_LOCATION`, er disse **tilpassede mal-innsatsnavn**. De har ingen effekt med mindre malen/applikasjonen bruker dem gjennom parameter- og vertsmiljøkartlegginger. For `azure-search-openai-demo`, bruk dens faktiske navn som `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` og `AZURE_SEARCH_SERVICE_SKU` i stedet. Modellkapasitet er ikke kontoslag.

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

Foretrekk Entra ID med lokal nøkkelauthentisering deaktivert. Følgende er kun et **legacy nøkkel-autentiseringsalternativ** for applikasjoner som krever nøkler: det krever en konto med nøkkelautentisering aktivert, applikasjonsidentitet knyttet til verten, og fungerende Key Vault-tilgang/-nettverk. Ikke kombiner nøkkelhenting med `disableLocalAuth: true` og forvent at nøkkelbaserte kall fungerer.

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

## Distribusjonsarbeidsflyter

### AZD-utvidelser for Foundry

For GA-arbeidsflyten, installer `microsoft.foundry`-pakken i stedet for å sette sammen kjerneutvidelsene én om gangen:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Pakken installerer agenter, forbindelser, inspektør, prosjekter, rutiner, ferdigheter og verktøykasser. Den legger ikke til en `microsoft.foundry` kommandogruppe. Evalueringer, datasett, finjustering og tilpassede modeller installeres separat ved behov. Se [referanse for pakketering av utvidelser](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Gjennomgang av Hosted-Agent (GA)

En **hostet agent** kjører agentkoden din på Foundry-administrert datakraft. Denne øvelsen bruker det opprinnelige grunnleggende Python Agent Framework Responses API-eksemplet, ikke de klassiske Agent Service SDK-fragmentene i andre leksjoner.

#### 1. Forbered og initialiser

Bruk en tom katalog utenfor denne kursutgitten. Installer Python 3.13 eller nyere og en nåværende [uv-utgivelse](https://docs.astral.sh/uv/getting-started/installation/). Frittstående uv-installasjoner kan bruke `uv self update`. Sjekk [rettigheter for hostet agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), modelltilgjengelighet og kvote i abonnement og region før oppsett. Azure-ressurser og lokale modellkall påløper kostnader.

Fullfør `azd auth login` og pakkeinstallasjonen ovenfor. Lokalt eksempel bruker `DefaultAzureCredential`; ved bruk av Azure CLI-legitimasjon, logg inn med `az login` med samme konto og leietaker som AZD. Kun AZD-innlogging er ikke Azure CLI-innlogging.

Kjør denne enkel-linjers kommandoen i Bash eller PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Velg et nytt eller eksisterende Foundry-prosjekt og det tiltenkte abonnementet og regionen. For å gjenbruke en modellutplassering, legg til `--model-deployment <existing-deployment-name>` i initialiseringskommandoen **før du kjører den**, og velg det eksisterende prosjektet. Opphold deg i mappen som inneholder den genererte `azure.yaml` for de resterende kommandoene.

#### 2. Gå gjennom utplasseringsdefinisjonen

Åpne `azure.yaml` og finn disse innstillingene i [opprinnelig eksempel](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Innstilling | Hva du skal sjekke |
|---------|---------------|
| `host: azure.ai.project` og `deployments` | Tiltenkt Foundry-prosjekt og modellnavn, versjon, utplasserings-SKU og kapasitet |
| `host: azure.ai.agent` og `project` | Hostet agent og katalogen som inneholder kilden |
| `codeConfiguration` | Python-kjøretid og inngangspunkt; gjennomgått eksempel bruker `python_3_13` og `main.py` |
| `uses` | Avhengighet til Foundry prosjekt-tjenesten |
| `container.resources` | CPU- og minnetildeling, selv om koden bygges eksternt |
| `env` | Modellutplassering-kartlegging og `PYTHONNOUSERSITE: "1"` for å deaktivere brukersteds-pakkelasting |
| `infra.provider` | `microsoft.foundry`, som syntetiserer nødvendig infrastruktur |

Committ den gjennomgåtte `azure.yaml` og agentkoden sammen. Ingen håndskrevet infrastruktur kreves for å starte; når du trenger redigerbare utstyringsfiler, følg [infrastrukturejectering](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) for Bicep eller Terraform og fortsett å bruke `azd provision`. Committ ikke legitimasjon eller `.azure/` miljøtilstand.

#### 3. Provisjoner og test lokalt

```bash
azd provision
azd ai agent run
```

Provisioning kan opprette manglende modellutplasseringer **selv i et gjenbrukt prosjekt**. Gjennomgå modellpromptene og velg en tilgjengelig online utplasserings-type som Global Standard eller Data Zone Standard; kvote og regional støtte varierer.

Den lokale kjøringen forbereder avhengigheter og åpner **Agent Inspector**, hvor du kan inspisere forespørsler, svar og verktøy-/modellaktivitet. La den kjøre og åpne et annet terminalvindu i samme prosjektdirektorium:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Kontrollpunkt:** Bekreft at du mottar et relevant svar og kan inspisere den tilknyttede lokale aktiviteten. Lokal utførelse kaller fortsatt din Azure-modellutplassering; det er ikke en offline- eller gratis test. Bruk syntetiske prompt og unngå å eksponere hemmeligheter eller sensitiv data i inspector-utfallet.

#### 4. Utplasser og sammenlign

Stopp den lokale kjøringen med Ctrl+C når du er ferdig. Før fjernkall, konfigurer eller verifiser prosjektets [Application Insights-tilkobling og lesetilgang for spor](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

I kodeutplasseringsmodus laster AZD opp kildekode for en fjern Foundry-bygg; du trenger ikke lokal containerbygging for denne veien. Utplasseringsutdata gir lekeplass- og endepunktlenker. Verifiser et svar fra den utplasserte agenten og dens sky-spor; lokale inspector-hendelser alene beviser ikke at skysporing fungerer.

For etterfølgende endringer, gjennomgå støttet hosted-agent-konfigurasjon med `azd deploy --preview`. Strøm logger med `azd ai agent monitor --follow`, eller diagnostiser oppsett- og tilgangsproblemer med `azd ai agent doctor`. En utplasseringsforhåndsvisning er ikke en komplett infrastruktur- eller sikkerhetsgjennomgang.

#### 5. Legg til en gjentakbar kvalitetskontroll

Installer den uavhengig utgitte evalueringsutvidelsen, og generer deretter utkast til testressurser:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Beskriv agentens tiltenkte oppførsel og velg **Datasett og evaluator**, deretter **Turn**. Gjennomgå og rediger de genererte sakene og vurderingsskjemaet, inkludert en sak med spørsmål som ikke støttes, før du konfigurerer evalueringen:

```bash
azd ai eval init --name quality
```

Velg det gjennomgåtte datasettet og rubrikken og bekreft dommermodellens utplassering. Inspiser `evals/azure.eval.yaml` og dens evaluerings-tjenestereferanse i `azure.yaml`, deretter registrer ressursene og utfør:

```bash
azd up
azd ai eval run start --eval quality
```

Inspiser poengsummer og mislykkede eller feilede saker; en fullført evaluering er ikke automatisk et kvalitets-gjennomslag. Generering og poengsetting medfører også modellkostnader. Forplikt ikke-hemmelig konfigurasjon, datasett og rubrikker slik at lagkamerater kan sammenligne endringer. `azd ai agent optimize` kan gjenbruke en kompatibel evaluering som baseline, men gjennomgå kandidater før en eksplisitt utrulling. Se [kvalitetsporter og migrasjon](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) for eldre prosjekter og CI.

#### 6. Gjenbruk arbeidsflyten i CI/CD

Etter en vellykket `azd up`, kjør `azd pipeline config` og gjennomgå den genererte GitHub Actions- eller Azure DevOps-arbeidsflyten. Installer `microsoft.foundry` på runneren, pluss `azure.ai.evaluations` hvis du kjører evalueringer. Behold generert sjekk-ut, pålogging og miljøinnstillinger; kun installasjon autentiserer ikke pipelinen.

Bruk et eget AZD-miljø per steg, gi pipeline-identiteten nødvendige ressurs- og Foundry-tillatelser, og oppbevar legitimasjon i pipeline-hemmeligheter eller bruk føderert identitet. Forplikt evalueringsressurser og verifiser identiteten kan få tilgang til refererte datasett/evaluatorer. Se [eksempel på pipeline-kurs](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) og [Foundry CI/CD-guide](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Rydd opp bevisst

For et **nytt prosjekt opprettet av dette miljøet**, gjennomgå ressursene som er oppført av `azd down` før du bekrefter: det sletter ressursgruppen og alt i den.

For et **gjenbrukt prosjekt**, lar `azd down` prosjektet, vertsmaskinen og andre ressurser være på plass. Fjern kun uønskede ressurser du eier ved å bruke [hurtigrengjøringsveiledningen](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); ikke slett en delt ressursgruppe for å rydde opp i en øvelse.

**Fullføringskontroll:** Forklar hvilke innstillinger som styrer lokal og sky-atferd, vis lokale og distribuerte svar, gjennomgå et evalueringsresultat, og identifiser hvilke ressurser som er igjen etter opprydding.

### Valgfritt: Scaffold med Microsoft Foundry Skill

Installer [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) for din kodeagentvert, åpne deretter en egen tom mappe. Be den om å scaffolde det grunnleggende Python Agent Framework Responses API-eksempelet i kodeutplasseringsmodus, forklar den genererte `azure.yaml`, og foreslå abonnement, region, prosjekt og modelltildeling. Krev godkjenning **før opprettelse av Azure-ressurser**, be om en lokal test, og stopp før distribusjon. Gjennomgå utdataene og fortsett med distribusjonstrinnene ovenfor bare når du er klar.

For eksisterende prosjekter erstatter `--template`/`-t` den utdaterte `--manifest`/`-m`-stavemåten; å endre flagget migrerer ikke gamle manifiester eller innfelt agentkonfigurasjon. Se [AI CLI-referansen](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Enkel Kjørselsdistribusjon

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Miljøspesifikke Distribusjoner

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
```

Dette oppretter en Insights-ressurs, ikke telemetriinstrumentering. Når appen din sender utgående model-kall-spans, kjør denne illustrative spørringen i Application Insights Logs (tilpass filteret til dine faktiske span-navn):

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

Bruk en ekte mottaker og verifiser tillatelser for fakturering-omfang. Et budsjett sender varsler; det er ikke en utgiftsgrense.

## 🔐 Sikkerhets beste praksis

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

Denne endepunkt-fragmentet trenger også en privat DNS-sone/gruppe, VNet-lenker, applikasjons-VNet-tilkobling, og en eksplisitt retningslinje for offentlig tilgang. Oppretting av et privat endepunkt alene deaktiverer ikke offentlig tilgang.

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

### Hurtigbufferstrategier

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

Azure Cache for Redis Basic/Standard/Premium er på en [utfasingsti](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); bruk Azure Managed Redis for nye distribusjoner og følg gjeldende mal-/autentiseringsveiledning. Begrens hurtigbufrede AI-responser etter autorisasjon, modell/instruksjoner, og dataversjon, med utløp; del aldri private responser basert kun på spørringstekst.

### Autoskaleringkonfigurasjon

**Delvis ressurs:** slå sammen disse skalerings/innfartsinnstillingene til en komplett Container App med et administrert miljø, containerbilde, og ressursgrenser. Flere replikaer øker ikke modellkvoten.

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

### Problem 1: OpenAI Kvote overskredet

**Symptomer:**
- Distribusjon mislykkes med kvotafeil
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

Kapasitetsvariabelen ovenfor gjelder bare for en tilpasset mal koblet til å bruke den. For RAG-eksemplet, bruk `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ikke endre `AZURE_LOCATION` for å flytte eksisterende ressurser på plass; opprett et separat miljø for en ny region og planlegg migrering/ryddearbeid.

### Problem 2: Autentiseringsfeil

**Symptomer:**
- 401/403-feil ved kall til AI-tjenester
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

### Problem 3: Modell distribusjonsproblemer

**Symptomer:**
- Modeller ikke tilgjengelige i distribusjon
- Spesifikke modellversjoner feiler

**Løsninger:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Eksempel maler

Dette er alternativer, ikke sekvensielle kommandoer. Start hver i en egen tom mappe. Den eksplisitte `.` destinasjonen holder initialiseringen i din nåværende mappe; ellers kan gjeldende AZD opprette en mal-navngitt undermappe uten å endre skallens arbeidsmappe.

### RAG Chat-applikasjon (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Beskrivelse**: En RAG chat-referanseapplikasjon for spørsmål over dokumentene dine, med Azure AI Search-henting. Gå gjennom den gjeldende prøvens støttede modeller, valgfrie funksjoner, kostnadsveiledning, og produksjonssikring før bruk; distribuering av en prøve gjør ikke applikasjonen produksjonsklar.

**Rask start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat-applikasjon (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Beskrivelse**: .NET/C#-ekvivalenten til Python RAG chat-eksemplet. Bygget med ASP.NET Core Minimal API og Blazor WebAssembly frontend. Inkluderer stemmechat, GPT-4o-mini visjonsstøtte, og en følgesvenn .NET MAUI Blazor Hybrid desktop/mobilklient.

**Rask start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat-applikasjon (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Tjenester**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Beskrivelse**: Java-versjon av RAG chat-eksemplet som bruker Langchain4J for AI-orchestrering. Støtter mikroservice hendelsesdrevet arkitektur, flere søkestrategier (tekst, vektor, hybrid), dokumentopplasting med Azure Document Intelligence, og distribusjon enten på Azure Container Apps eller Azure Kubernetes Service.

**Rask start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot med Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Beskrivelse**: End-to-end retail RAG copilot som bruker Microsoft Foundry og Prompty. En Contoso Outdoor butikk chatbot som baserer svar på produktkatalog og kundeordredata. Demonstrerer hele GenAIOps-arbeidsflyten — prototype med Prompty, evaluering med AI-assisterte vurderere, og distribusjon via AZD til Container Apps.

**Rask start**:
```bash
azd init --template contoso-chat .
azd up
```

### Kreativ Skriving Multi-Agent Applikasjon

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Tjenester**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Beskrivelse**: Multi-agent eksempel som demonstrerer AI agent orkestrering med Prompty. Bruker en forskningsagent (Bing Grounding i Azure AI Agent Service), en produktagent (Azure AI Search), en skribentagent, og en redaktøragent for å samarbeide om å produsere godt forsket artikler. Inkluderer CI/CD med evaluering i GitHub Actions.

**Rask start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverløs RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Tjenester**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Beskrivelse**: Fullstendig serverløs RAG chatbot som bruker LangChain.js med Azure Functions for API og Azure Static Web Apps for hosting. Bruker Azure Cosmos DB som både vektorlagring og chatthistorikkdatabase. Støtter lokal utvikling med Ollama for kostnadsfri testing.

**Rask start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat med Dine Data Løsning Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Tjenester**: Microsoft Foundry + Azure Container Apps (web/API/ingestering) + Azure AI Search med Cosmos DB, eller PostgreSQL med pgvector

**Beskrivelse**: En dokument-grunnet chat-accelerator med henvisninger. Nåværende eksempel kjører en React frontend, FastAPI backend, og Functions-ingestering på Container Apps; orkestreringsvalg er Agent Framework og LangGraph. Database-/hentingsvalg velges ved distribusjon. Det er et utgangspunkt, ikke et ferdig produksjonssystem; ikke anta at eldre App Service, Semantic Kernel, eller Prompt Flow-varianter beskriver gjeldende standard.

**Rask start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Reiseagenter — Multi-Agent MCP Orkestrering

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Tjenester**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Beskrivelse**: Referanseapplikasjon for multi-agent AI-orkestrering ved bruk av tre rammeverk (LangChain.js, LlamaIndex.TS, og Microsoft Agent Framework). Har MCP (Model Context Protocol) servere i fire språk distribuert som serverløse Azure Container Apps med OpenTelemetry-overvåking.

**Rask start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Bla gjennom flere maler**: Besøk [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for tilgjengelige maler på tvers av språk og scenarioer. Hvert lenket eksempel er et eksternt repository, ikke et lokalt eksempel levert av dette kurset; undersøk gjeldende forutsetninger og produksjonsveiledning før distribusjon.

## Neste Steg

1. **Prøv Eksemplene**: Start med en ferdigbygd mal som passer til ditt brukstilfelle
2. **Tilpass for Dine Behov**: Endre infrastrukturen og applikasjonskoden
3. **Legg til Overvåking**: Implementer omfattende observabilitet
4. **Optimaliser Kostnader**: Juster konfigurasjoner for ditt budsjett
5. **Sikre Distribusjonen**: Implementer bedrifts-sikkerhetsmønstre
6. **Skaler til Produksjon**: Legg til flerregion og høy-tilgjengelighetsfunksjoner

## 🎯 Praktiske Øvelser

### Øvelse 1: Distribuer Microsoft Foundry Models Chat App (30 minutter)
**Mål**: Distribuer og test en AI-chat-referanseapplikasjon

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

**Suksesskriterier:**
- [ ] Distribusjon fullføres uten kvotafeil
- [ ] Kan få tilgang til chatgrensesnitt i nettleser
- [ ] Kan stille spørsmål og få AI-drevne svar
- [ ] Application Insights viser telemetridata
- [ ] Ryddet opp ressurser vellykket

**Kostnad:** Gå gjennom den gjeldende kostnadsveiledningen og valgte SKUer før distribusjon. Fakturering fortsetter til ressursene slettes; det finnes ingen fast 30-minutters estimat som gjelder for alle konfigurasjoner.

### Øvelse 2: Konfigurer Multi-Model Distribusjon (45 minutter)
**Mål**: Distribuer flere AI-modeller med forskjellige konfigurasjoner

**Utgangspunkt:** En eksisterende Azure OpenAI-konto og et AZD resource-group-modul som kan kalle denne filen. Lag `infra/ai-models.bicep` med følgende innhold ved bruk av din editor. Det distribueres ikke automatisk bare fordi det ligger under `infra/`.

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

Fra resource-group-omfang-modulen som eier kontoen, legg til en modul-invokasjon (tilpass symbolnavnet til din faktiske konto):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ikke deklarer samme distribusjoner i begge moduler. Hvis AZD inngangspunktet har abonnementsomfang, kall dette fra dens resource-group-omfang-barnemodul og juster relativ bane. Bygg den inneholdende modulen med `az bicep build --file <path-to-containing-module>`, deretter:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Suksesskriterier:**
- [ ] Flere modeller distribuert vellykket
- [ ] Ulike kapasitet-innstillinger brukt
- [ ] Modeller tilgjengelige via API
- [ ] Kan kalle begge modeller fra applikasjon

### Øvelse 3: Implementer Kostnadsovervåking (20 minutter)
**Mål**: Sett opp budsjettvarsler og kostnadssporing

**Utgangspunkt:** Budsjettmønsteret ovenfor og en resource-group-omfang infrastruktur-modul. Legg til denne ressursen med din editor; pass `budgetStartDate` fra parameterkartleggingen (ikke dupliser parameteren hvis den allerede er deklarert). Bytt ut mottaker og bekreft at du har skriveadgang til budsjett.

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

Forventet: svaret inneholder `amount: 200`, begge terskler, og din mottaker. Inspiser Kostnadsstyring i portalen for faktiske beløp; kostnadsdata er forsinket og et varsel trenger ikke å fyre under en kort øvelse.

**Suksesskriterier:**
- [ ] Budsjettvarsel opprettet i Azure
- [ ] E-postvarsler konfigurert
- [ ] Kan se kostnadsdata i Azure Portal
- [ ] Budsjettterskler satt riktig

## 💡 Ofte stilte spørsmål

<details>
<summary><strong>Hvordan reduserer jeg kostnader for Microsoft Foundry Models under utvikling?</strong></summary>

1. **Sjekk pris**: Det finnes ingen universell gratis 50 000 tokens månedlig kvote for Azure OpenAI-modeller
2. **Riktig dimensjonert kapasitet**: Kapasitet `10` representerer vanligvis 10 000 TPM for disse Standard tekstmodellene, ikke 10 TPM. Å redusere denne hastighetsgrensen reduserer ikke prisene per token
3. **Bruk azd down**: Slett ressurser som ikke trengs under utvikling (dette er ikke de-allokering)
4. **Cache Responser**: Implementer Redis-cache for gjentatte forespørsler
5. **Bruk Prompt Engineering**: Reduser tokenbruk med effektive forespørsler

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
- Bedriftsikkerhet og samsvar
- Privat nettverksintegrasjon
- SLA-garantier
- Administrert identitetsautentisering
- Høyere kvoter tilgjengelig

**OpenAI API**: En separat leverandør/API med sin egen modelltilgjengelighet, prising, autentisering, og bedriftskoblingsmuligheter. Sammenlign aktuelle tilbud i stedet for å anta at den kun er for offentlig internett eller alltid har modeller først.

Velg basert på organisasjonens krav; Azure-spesifikke administrerte identitets- og privat-lenke-eksempler i dette kurset gjelder Azure-hostede tjenester, ikke hver modell/leverandør i Foundry-katalogen.
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
1. Bruk Managed Identity (ingen API-nøkler)
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

## Fellesskap og støtte

- **Microsoft Foundry Discord**: [#Azure-kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemer og diskusjoner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Offisiell dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)
- **Agentferdigheter**: [Microsoft Foundry-ferdighet på skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installer Azure + Foundry agentferdigheter i redigereren din med `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige kapittel**: [Kapittel 1: Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [AI-agenter](agents.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i våre fellesskapsdiskusjoner eller åpne en sak i depotet. Azure AI + AZD-fellesskapet er her for å hjelpe deg med å lykkes!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
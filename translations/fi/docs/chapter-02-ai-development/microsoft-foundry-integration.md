# Microsoft Foundryn integrointi AZD:hen

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensimmäinen Kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI-agentit](agents.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Yleiskatsaus

Tässä oppaassa demonstroidaan, kuinka Microsoft Foundryn palvelut integroidaan Azure Developer CLI:n (AZD) kanssa sujuvoittaen AI-sovellusten käyttöönottoa. Microsoft Foundry tarjoaa kattavan alustan AI-sovellusten rakentamiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuuri- ja käyttöönotto-prosessia.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen AI-kehitysalusta, joka sisältää:

- **Malliluettelo**: Pääsy edistyneimpiin AI-malleihin
- **Prompt Flow**: Visuaalinen suunnittelutyökalu AI-työnkuluille
- **Microsoft Foundry -portaali**: Integroitu kehitysympäristö AI-sovelluksille
- **Käyttöönoton vaihtoehdot**: Useita isännöinti- ja skaalausvaihtoehtoja
- **Turva ja turvallisuus**: Sisäänrakennetut vastuulliset AI-ominaisuudet

## AZD + Microsoft Foundry: Parempi yhdessä

| Ominaisuus | Microsoft Foundry | AZD-integroinnin hyödyt |
|---------|-----------------|------------------------|
| **Mallien käyttöönotto** | Manuaalinen portaalin käyttöönotto | Automaattiset, toistettavat käyttöönotot |
| **Infrastruktuuri** | Klikkaa-toiminnolla varaaminen | Infrastrukturin koodina (Bicep) |
| **Ympäristön hallinta** | Yhden ympäristön fokus | Moniympäristö (dev/staging/prod) |
| **CI/CD-integrointi** | Rajoitettu | Natiivinen GitHub Actions -tuki |
| **Kustannusten hallinta** | Perusseuranta | Ympäristökohtainen kustannusten optimointi |

## Vaatimukset

- Azure-tilaus asianmukaisilla käyttöoikeuksilla
- Azure Developer CLI asennettuna
- Pääsy Microsoft Foundryn Mallipalveluihin
- Perustiedot Microsoft Foundrysta

> **Julkaisukatsaus (2026-11-04):** AI CLI -ohjeistus tarkistettiin `azd` `1.37.2`, agentit `1.0.0-beta.23` ja arviointien `1.0.0-beta.2` dokumentaation/lähteen kanssa. Käytä yhdistettyyn työnkulkuun `azd >= 1.37.0`. Katso [julkaisumuutokset ja korjaukset](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); tämä katsaus ei varmista kaikkia mallipohjia tai SDK-esimerkkejä reaaliaikaisen käyttöönoton osalta.

## Keskeiset integrointimallit

**Esimerkkien laajuus:** Alla oleva Bicep sisältää havainnollistavia resurssipaloja, ei täydellistä otettavissa olevaa mallia. Mallipohjan pitää määritellä nimet, `location`, viitattavat resurssit, tunnisteet, tulosteet ja sovelluksen isännöinti. Käytä linkitettyä esimerkkipohjaa ajettavan lähtökohdan saamiseksi. Bash-esimerkit vaativat Azure CLI -todennuksen erikseen `azd auth login`:sta.

### Malli 1: Microsoft Foundryn mallien integrointi

**Käyttötapaus**: Ota käyttöön chat-sovelluksia Azure OpenAI -malleilla Microsoft Foundryssa

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

**Infrastruktuuri (main.bicep):**
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

Käyttäjällä pitää olla liitetty hallittu identiteetti ja `Cognitive Services OpenAI User` tilitason laajuudessa; avaimien poistaminen ei anna pääsyä. Tarkista alueen/mallin/SKU:n saatavuus ja kvootat ennen käyttöönottoa.

### Malli 2: AI-haun + RAG-integrointi

**Käyttötapaus**: Käyttöönotto hakua täydentävillä (retrieval-augmented generation, RAG) sovelluksilla

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

Tälle integraatiolle ei ole olemassa `Microsoft.Search/searchServices/dataConnections` ARM-resurssia. Konfiguroi Search-indeksi, tietolähde, indeksoija/skillset tai vektoroija tuettujen Search data-plane API:en kautta. Jos Search kutsuu upotusmallia, ota sen hallittu identiteetti käyttöön, anna asiaankuuluva rooli mallille ja konfiguroi sen upotus-skilli/vektoroija. Katso [integroitu vektorisointi](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Malli 3: Dokumenttien älykkyyden integrointi

**Käyttötapaus**: Dokumenttien käsittely- ja analyysityönkulut

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

## 🔧 Konfigurointimallit

### Ympäristömuuttujien asettaminen

Lukuun ottamatta dokumentoituja AZD-asetuksia kuten `AZURE_LOCATION`, nämä ovat **custom-template syötteen nimiä**. Niillä ei ole vaikutusta, ellei mallipohja/sovellus käytä niitä parametrien ja isäntäympäristöjen kartoitusten kautta. `azure-search-openai-demo`:lle käytä sen todellisia nimiä, kuten `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` ja `AZURE_SEARCH_SERVICE_SKU`, sen sijaan. Mallikapasiteetti ei viittaa tilin SKU:hun.

**Tuotantokonfiguraatio:**
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

**Kehityskonfiguraatio:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Turvallinen konfigurointi Key Vaultilla

Suosi Entra ID:tä, jossa paikallinen avaintodennus on estetty. Seuraava on vain **perintöavaintodennuksen vaihtoehto** sovelluksille, jotka vaativat avaimia: se edellyttää tiliä, jolla avaintodennus on käytössä, sovelluksen identiteetti liitettynä isännälle sekä Key Vault -pääsyn/verkon toimivuuden. Älä yhdistä avainten noutoa `disableLocalAuth: true` kanssa ja odota avainpohjaisten kutsujen toimivan.

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

## Käyttöönoton työnkulut

### AZD-laajennukset Foundrylle

AZD tarjoaa laajennuksia, jotka lisäävät AI-spesifisiä ominaisuuksia Microsoft Foundryn palveluiden käyttöön:

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

AI-laajennukset kehittyvät edelleen nopeasti esikatseluvaiheessa. Jos komento käyttäytyy eri tavalla kuin tässä esitetään, päivitä asiaankuuluva laajennus ennen projektin vianetsintää.

### Agenttikeskeinen käyttöönotto `azd ai` kanssa

Käytä `azd ai agent init` vuorovaikutteisesti, tai ota käyttöön nykyinen `azure.yaml` agenttiprojektin mallipohja, joka on kytketty Foundry Agent Serviceen:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` korvaa poistuvan `--manifest`/`-m` kirjoitusasun; perintömanifesteihin ja sisäkkäisiin agenttikonfiguraatioihin tarvitaan edelleen migraatiota. Arvioi agentteja `azd ai eval`:llä `azure.ai.evaluations`:sta, ei poistuneella perintötyönkululla. Katso [arviointimigraatio](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) asennusta, suoritusta ja tuloksia varten.

Katso [AZD AI CLI -komennot](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) saadaksesi täydellisen komentoviitteen ja liput.

### Yhden komennon käyttöönotto

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Ympäristökohtaiset käyttöönotot

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

## Seuranta ja havainnointi

### Application Insights -integrointi

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

Tämä luo Insights-resurssin, ei telemetrian instrumentointia. Kun sovelluksesi lähettää ulosmeneviä malli-kutsualueita, suorita tämä havainnollistava kysely Application Insights -lokissa (mukauta suodatinta todellisten alueiden nimien mukaan):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kustannusten seuranta

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

Käytä oikeaa vastaanottajaa ja varmista laskutusalueen käyttöoikeudet. Budjetti lähettää hälytyksiä; se ei ole kulutusraja.

## 🔐 Turvallisuuden parhaat käytännöt

### Hallitun identiteetin konfigurointi

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

### Verkkoturva

Tämä päätelaajennoksen osa vaatii myös yksityisen DNS-alueen/ryhmän, VNet-linkkejä, sovelluksen VNet-yhteyksiä ja eksplisiittisen julkisen pääsymääräyksen. Yksityisen päätelaitteen luominen ei yksin poista julkista pääsyä.

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

## Suorituskyvyn optimointi

### Välimuististrategiat

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

Azure Cache for Redis Basic/Standard/Premium on [vähenevällä polulla](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); käytä Azure Managed Redis -palvelua uuteen käyttöönottoon ja seuraa sen nykyisiä mallipohja- ja todennusohjeita. Kohdista välimuistitallennetut AI-vastaukset valtuutuksen, mallin/ohjeiden ja datan version mukaan, sekä aikakatkaisuilla; älä koskaan jaa yksityisiä vastauksia pelkän kyselytekstin perusteella.

### Automaattisen skaalauksen konfigurointi

**Osittainen resurssi:** yhdistä nämä skaalaus-/sisääntulon asetukset täydelliseen Container Appiin, jossa on hallittu ympäristö, konttikuvake ja resurssirajoitukset. Lisäkopiot eivät kasvata mallin kvottaa.

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

## Yleiset ongelmat ja niiden ratkaisut

### Ongelma 1: OpenAI-kvotan ylitys

**Oireet:**
- Käyttöönotto epäonnistuu kvottavirheisiin
- 429-virheitä sovelluslokissa

**Ratkaisut:**
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

Edellä oleva kapasiteettimuuttuja koskee vain sitä mallipohjaa, joka on kytketty sen käyttöön. RAG-esimerkissä käytä `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Älä muuta `AZURE_LOCATION` siirtääksesi olemassa olevia resursseja; luo erillinen ympäristö uudelle alueelle ja suunnittele migraatio/siivous.

### Ongelma 2: Todennusvirheet

**Oireet:**
- 401/403-virheitä kutsuttaessa AI-palveluja
- "Pääsy kielletty" -viestejä

**Ratkaisut:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Ongelma 3: Mallien käyttöönotto-ongelmat

**Oireet:**
- Mallit eivät ole saatavilla käyttöönotossa
- Tietyt malliversiot epäonnistuvat

**Ratkaisut:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Esimerkkimallit

Nämä ovat vaihtoehtoja eivätkä peräkkäisiä komentoja. Aloita kukin erillisessä tyhjässä hakemistossa. Explisiittinen `.` -kohde pitää alustuksen nykyisessä hakemistossa; muuten nykyinen AZD voi luoda mallipohjan nimisen alihakemiston muuttamatta työskentelyhakemistoasi.

### RAG-chat-sovellus (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kuvaus**: RAG-chat-referenssisovellus kysymyksille dokumenttiesi perusteella, Azure AI Search -hakuominaisuudella. Tarkista nykyisen näytteen tuetut mallit, valinnaiset ominaisuudet, kustannusohjeistus ja tuotantokovennus ennen käyttöä; näytteen käyttöönotto ei tee sovelluksesta tuotantovalmista.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG-chat-sovellus (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kuvaus**: .NET/C#-vastine Python RAG-chat-esimerkille. Rakennettu ASP.NET Core Minimal API:lla ja Blazor WebAssemblyllä. Sisältää puheentunnistuksen chatin, GPT-4o-mini vision tuen sekä .NET MAUI Blazor Hybrid -pöytä-/mobiiliklientin.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG-chat-sovellus (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kuvaus**: RAG-chat-esimerkin Java-versio, joka käyttää Langchain4J:tä AI-orchestrointiin. Tukee mikropalvelu tapahtumapohjaista arkkitehtuuria, useita haku strategioita (teksti, vektori, hybridi), dokumenttien latausta Azure Document Intelligence -palvelulla sekä käyttöönottoa Azure Container Appsissa tai Azure Kubernetes Servicessä.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot Microsoft Foundrylla

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kuvaus**: End-to-end vähittäiskaupan RAG-copilot Microsoft Foundryn ja Promptyn avulla. Contoso Outdoor -vähittäiskaupan chatbot, joka perustaa vastauksensa tuotekatalogiin ja asiakastilaustietoihin. Demonstroi koko GenAIOps-työnkulun — mallinna Promptyllä, arvioi AI-avusteisilla arvioijilla ja ota käyttöön AZD:llä Container Appsissa.

**Nopea aloitus**:
```bash
azd init --template contoso-chat .
azd up
```

### Luova kirjoittaminen monen agentin sovellus

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Palvelut**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kuvaus**: Monen agentin esimerkki, joka demonstroi AI-agenttien orkestrointia Promptyllä. Käytössä tutkimusagentti (Bing Grounding Azure AI Agent Servicessä), tuoteagentti (Azure AI Search), kirjoittaja-agentti ja toimittaja-agentti yhteistyössä laadukkaiden, hyvin tutkittujen artikkeleiden tuottamiseksi. Sisältää CI/CD:n arvioinnilla GitHub Actionsissa.

**Nopea aloitus**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Palvelut**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kuvaus**: Täysin serverless RAG-chatbot LangChain.js:llä, käyttäen Azure Functionseja API:ssa ja Azure Static Web Appsia isännöintiin. Käyttää Azure Cosmos DB:tä sekä vektoritietovarastona että keskusteluhistorian tietokantana. Tukee paikallista kehitystä Ollaman avulla nollakustannuksin testaamiseen.

**Nopea aloitus**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data -ratkaisukiihdytin

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Palvelut**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search Cosmos DB:n kanssa, tai PostgreSQL pgvectorlla

**Kuvaus**: Dokumenttien perusteella käynnistetty chat-kiihdytin viitteillä. Nykyinen näyte isännöi Reactin frontendia, FastAPI backendia ja Functions ingestion -työntekijää Container Appsissa; orkestrointivaihtoehtoja ovat Agent Framework ja LangGraph. Tietokanta/hakuvaihtoehdot valitaan käyttöönotossa. Se on lähtökohta, ei valmis tuotantojärjestelmä; älä oleta vanhempien App Servicen, Semantic Kernelin tai Prompt Flown versioiden kuvaavan nykyistä oletusta.

**Nopea aloitus**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI-matka-agentit — monen agentin MCP-orkestrointi

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Palvelut**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-palvelimet (.NET, Python, Java, TypeScript)

**Kuvaus**: Viitesovellus monitoimijaiseen tekoälyn orkestrointiin käyttäen kolmea kehystä (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisältää MCP (Model Context Protocol) -palvelimet neljällä kielellä, jotka on otettu käyttöön palvelimettomina Azure Container Apps -sovelluksina OpenTelemetry-valvonnalla.

**Pika-aloitus**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Selaa lisää malleja**: Käy [Awesome AZD AI Template Galleryssa](https://azure.github.io/awesome-azd/?tags=ai) löytääksesi tällä hetkellä saatavilla olevat mallit eri kielillä ja skenaarioissa. Jokainen linkitetty esimerkki on ulkoinen repositorio, ei tämältä kurssilta tarjottu paikallinen esimerkki; tarkista sen nykyiset vaatimukset ja tuotanto-ohjeistus ennen käyttöönottoa.

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita valmiilla mallilla, joka vastaa käyttötarkoitustasi
2. **Muokkaa tarpeisiisi**: Muokkaa infrastruktuuria ja sovelluskoodia
3. **Lisää valvonta**: Toteuta kattava havainnointi
4. **Optimoi kustannukset**: Säädä asetuksia budjettisi mukaisesti
5. **Turvaa käyttöönotto**: Ota käyttöön yritystason tietoturvamallit
6. **Laajenna tuotantoon**: Lisää monialue- ja korkean käytettävyyden ominaisuudet

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Ota käyttöön Microsoft Foundry Models Chat -sovellus (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tekoälyä käyttävä chat-viitesovellus

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

**Onnistumiskriteerit:**
- [ ] Käyttöönotto valmistuu ilman käyttökatko- tai määrärahaongelmia
- [ ] Chat-käyttöliittymään pääsee selaimella
- [ ] Voi esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia
- [ ] Application Insights näyttää telemetriatiedot
- [ ] Resurssit on onnistuneesti siivottu käytön jälkeen

**Kustannukset:** Tarkista mallin tämänhetkinen kustannusopas ja valitut SKU:t ennen käyttöönottoa. Laskutus jatkuu, kunnes resurssit poistetaan; kiinteää 30 minuutin kustannusarviota ei voida soveltaa kaikkiin kokoonpanoihin.

### Harjoitus 2: Moneen malliin perustuvan käyttöönoton määrittäminen (45 minuuttia)
**Tavoite**: Ota käyttöön useita tekoälymalleja eri kokoonpanoilla

**Lähtökohta:** Olemassa oleva Azure OpenAI -tili ja AZD-resurssiryhmämoduuli, joka osaa kutsua tätä tiedostoa. Luo `infra/ai-models.bicep` seuraavalla sisällöllä editorissasi. Tätä ei oteta automaattisesti käyttöön vain siksi, että se on alla `infra/`.

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

Lisää tilin omistamasta resurssiryhmämoduulista moduulikutsu (muokkaa symbolin nimeä todellisen tilisi mukaan):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Älä määrittele samoja käyttöönottoja molemmissa moduuleissa. Jos AZD-kohdepiste on tilitasolla, kutsu tämä resurssiryhmän lapsimoduulista ja säädä polku vastaavasti. Käännä kyseinen moduuli komennolla `az bicep build --file <path-to-containing-module>` ja sen jälkeen:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Onnistumiskriteerit:**
- [ ] Useita malleja otettu käyttöön onnistuneesti
- [ ] Eri kapasiteettiasetukset käytössä
- [ ] Malleihin pääsee käsiksi API:n kautta
- [ ] Pystyy kutsumaan molempia malleja sovelluksesta

### Harjoitus 3: Kustannusseurannan käyttöönotto (20 minuuttia)
**Tavoite**: Määritä budjettihälytykset ja kustannusseuranta

**Lähtökohta:** Edellä esitetty budjettimalli ja resurssiryhmän infrastruktuurimoduuli. Lisää tämä resurssi editorissa; välitä `budgetStartDate` parametrikartoituksestasi (älä kopioi parametria, jos se on jo määritelty). Vaihda vastaanottaja ja varmista, että sinulla on oikeus kirjoittaa budjetteja.

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

Odotettu: vastaus sisältää `amount: 200`, molemmat kynnysarvot ja sinun vastaanottajasi. Tarkista todelliset kustannukset Azure-portaalin Kustannusten hallinnasta; kustannustiedot voivat viivästyä, eikä hälytyksen tarvitse laueta lyhyen harjoituksen aikana.

**Onnistumiskriteerit:**
- [ ] Budjettihälytys luotu Azureen
- [ ] Sähköpostihälytykset määritetty
- [ ] Kustannustiedot näkyvissä Azure-portaalissa
- [ ] Budjetin kynnysarvot sopivat käyttötarpeeseen

## 💡 Usein Kysytyt Kysymykset

<details>
<summary><strong>Kuinka voin vähentää Microsoft Foundry Models -mallien kustannuksia kehityksen aikana?</strong></summary>

1. **Tarkista hinnoittelu**: Azure OpenAI -malleilla ei ole universaalia ilmaista 50 000 tokenin kuukausittaista kiintiötä
2. **Säädä kapasiteetti sopivaksi**: Kapasiteetti `10` tarkoittaa tyypillisesti 10 000 TPM näille Standard-tekstimalleille, ei 10 TPM. Rajoituksen alentaminen ei laske tokenin hintaa
3. **Käytä azd down -komentoa**: Poista väliaikaiset resurssit, kun et aktiivisesti kehitä (ei vapauta varoja)
4. **Välimuistita vastaukset**: Käytä Redis-välimuistia toistuviin kyselyihin
5. **Käytä kehotteiden optimointia**: Vähennä tokenien kulutusta tehokkailla kehotteilla

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Mikä ero on Microsoft Foundry Modelsilla ja OpenAI API:lla?</strong></summary>

**Microsoft Foundry Models**:
- Yritystason tietoturva ja vaatimustenmukaisuus
- Yksityisen verkon integraatio
- SLA-takuu
- Hallinnoitu identiteetin todennus
- Suuremmat käyttökiintiöt saatavilla

**OpenAI API**: Erillinen palveluntarjoaja/API, jolla on omat mallien saatavuudet, hinnoittelu, todennus ja yritysliitettävyyden vaihtoehdot. Vertaa nykyisiä tarjouksia äläkä oleta, että se on vain julkisen internetin käytössä tai toimittaa malleja ensin.

Valitse organisaation vaatimusten mukaan; tämän kurssin Azure-spesifiset hallinnoidut identiteetti- ja yksityinen-linkki-esimerkit koskevat Azure-isännöityjä palveluita, eivät kaikkia Foundryn luettelon malleja tai palveluntarjoajia.
</details>

<details>
<summary><strong>Kuinka käsittelen Microsoft Foundry Models -määrärahaoikaisut?</strong></summary>

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
<summary><strong>Voinko käyttää omia tietojani Microsoft Foundry Modelsin kanssa?</strong></summary>

Kyllä! Käytä **Azure AI Searchia** RAG-mallin (Retrieval Augmented Generation) kanssa:

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

Katso [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) -malli.
</details>

<details>
<summary><strong>Kuinka turvaan tekoälymallien päätepisteet?</strong></summary>

**Parhaat käytännöt**:
1. Käytä hallinnoitua identiteettiä (ei API-avaimia)
2. Ota käyttöön yksityiset päätepisteet
3. Määritä verkkoturvaryhmät
4. Toteuta nopeusrajoitus
5. Käytä Azure Key Vaultia salaisuuksien hallintaan

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

## Yhteisö ja tuki

- **Microsoft Foundry Discord**: [#Azure-kanava](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Ongelmat ja keskustelut](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)
- **Agentti-taidot**: [Microsoft Foundry -taito skills.sh:ssä](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Asenna Azure + Foundry agenttitaidot editoriisi komennolla `npx skills add microsoft/github-copilot-for-azure`

---

**Luvun navigointi:**
- **📚 Kurssin aloitus**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensisijainen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI-agentit](agents.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisökeskusteluihin tai avaa issue repositoriossa. Azure AI + AZD -yhteisö on täällä auttamassa sinua menestymään!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
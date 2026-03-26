# Microsoft Foundry -integraatio AZD:n kanssa

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensisijainen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI-mallien käyttöönotto](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Yleiskatsaus

Tämä opas näyttää, miten Microsoft Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa sujuvoittaen tekoälysovellusten käyttöönottoa. Microsoft Foundry tarjoaa kattavan alustan tekoälysovellusten rakentamiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuuri- ja käyttöönottoprosessia.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen alusta tekoälyn kehitykseen, joka sisältää:

- **Malliluettelo**: Pääsy huipputason tekoälymalleihin
- **Prompt Flow**: Visuaalinen suunnittelija AI-työnkuluille
- **Microsoft Foundry -portaali**: Integroitu kehitysympäristö tekoälysovelluksille
- **Käyttöönottoasetukset**: Useita hosting- ja skaalausvaihtoehtoja
- **Turvallisuus ja suojaus**: Sisäänrakennetut vastuullisen tekoälyn ominaisuudet

## AZD + Microsoft Foundry: Paremmin yhdessä

| Ominaisuus | Microsoft Foundry | AZD-integraation etu |
|---------|-----------------|------------------------|
| **Mallien käyttöönotto** | Manuaalinen portaalin käyttöönotto | Automaattiset, toistettavat käyttöönotot |
| **Infrastruktuuri** | Klikattava provisiointi | Infrastruktuuri koodina (Bicep) |
| **Ympäristöhallinta** | Yhteen ympäristöön keskittyminen | Moni-ympäristö (dev/staging/prod) |
| **CI/CD-integraatio** | Rajoitettu | Sisäänrakennettu GitHub Actions -tuki |
| **Kustannusten hallinta** | Perustason valvonta | Ympäristökohtainen kustannusoptimointi |

## Esivaatimukset

- Azure-tilaus sopivilla käyttöoikeuksilla
- Azure Developer CLI asennettuna
- Pääsy Microsoft Foundry Models -palveluihin
- Perusymmärrys Microsoft Foundrysta

## Keskeiset integraatiomallit

### Malli 1: Microsoft Foundry Models -integraatio

**Käyttötapaus**: Ota käyttöön chat-sovelluksia Microsoft Foundry Models -malleilla

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

**Infrastructure (main.bicep):**
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

### Malli 2: AI-haku + RAG-integraatio

**Käyttötapaus**: Ota käyttöön retrieval-augmented generation (RAG) -sovelluksia

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

### Malli 3: Document Intelligence -integraatio

**Käyttötapaus**: Asiakirjojen käsittely- ja analytiikkatyönkulut

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

## 🔧 Konfiguraatiomallit

### Ympäristömuuttujien määritys

**Tuotantokonfiguraatio:**
```bash
# Keskeiset tekoälypalvelut
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mallin määritykset
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Suorituskykyasetukset
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Kehityskonfiguraatio:**
```bash
# Kustannustehokkaat asetukset kehitystä varten
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ilmainen taso
```

### Suojattu konfiguraatio Key Vaultin avulla

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

## Käyttöönoton työnkulut

### AZD-laajennukset Foundrylle

AZD tarjoaa laajennuksia, jotka lisäävät tekoälyyn liittyviä ominaisuuksia Microsoft Foundry -palveluiden kanssa työskentelyyn:

```bash
# Asenna Foundry agents -laajennus
azd extension install azure.ai.agents

# Asenna hienosäädön laajennus
azd extension install azure.ai.finetune

# Asenna mukautettujen mallien laajennus
azd extension install azure.ai.models

# Listaa asennetut laajennukset
azd extension list
```

### Agentti-ensimmäinen käyttöönotto `azd ai`-komennolla

Jos sinulla on agentin manifesti, käytä `azd ai agent init` -komentoa luodaksesi projektin, joka on kytketty Foundry Agent Serviceen:

```bash
# Alusta agentin manifestista
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ota käyttöön Azureen
azd up
```

Katso [AZD AI CLI -komennot](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täydellistä komentoviitettä ja lippuja varten.

### Yhden komennon käyttöönotto

```bash
# Ota kaikki käyttöön yhdellä komennolla
azd up

# Tai ota käyttöön vaiheittain
azd provision  # Vain infrastruktuuri
azd deploy     # Vain sovellus
```

### Ympäristökohtaiset käyttöönotot

```bash
# Kehitysympäristö
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Tuotantoympäristö
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Valvonta ja havaittavuus

### Application Insights -integraatio

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

### Kustannusten seuranta

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

## 🔐 Turvallisuuden parhaat käytännöt

### Hallitun identiteetin määritys

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

### Verkon turvallisuus

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

### Automaattisen skaalaamisen asetukset

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

## Yleisten ongelmien vianetsintä

### Ongelma 1: OpenAI-kvota ylittynyt

**Oireet:**
- Käyttöönotto epäonnistuu kvota-virheillä
- 429-virheitä sovelluslokissa

**Ratkaisut:**
```bash
# Tarkista nykyinen kiintiön käyttö
az cognitiveservices usage list --location eastus

# Kokeile toista aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia tilapäisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Ongelma 2: Todennusongelmat

**Oireet:**
- 401/403-virheitä AI-palveluja kutsuttaessa
- "Access denied" -viestejä

**Ratkaisut:**
```bash
# Varmista roolien määritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tarkista hallitun identiteetin määritys
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Vahvista Key Vaultin käyttöoikeudet
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Ongelma 3: Mallien käyttöönotto-ongelmat

**Oireet:**
- Mallit eivät ole saatavilla käyttöönotossa
- Tiettyjen malliversioiden virheet

**Ratkaisut:**
```bash
# Listaa saatavilla olevat mallit alueittain
az cognitiveservices model list --location eastus

# Päivitä mallin versio Bicep-templaattiin
# Tarkista mallin kapasiteettivaatimukset
```

## Esimerkkipohjat

### RAG-chat-sovellus (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kuvaus**: Suosituin Azure AI -esimerkki — tuotantovalmiiksi valmisteltu RAG-chat-sovellus, jonka avulla voit esittää kysymyksiä omien asiakirjojesi pohjalta. Käyttää GPT-4.1-miniä chattiin, text-embedding-ada-002:ta upotuksiin ja Azure AI Searchia hakuihin. Tukee multimodaalisia asiakirjoja, puheinput/outputia, Microsoft Entra -todennusta ja Application Insights -jäljitystä.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-chat-sovellus (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kuvaus**: Python-esimerkin .NET/C#-vastine. Rakennettu ASP.NET Core Minimal API:lla ja Blazor WebAssembly -frontendilla. Sisältää äänichatin, GPT-4o-mini vision -tuet, sekä .NET MAUI Blazor Hybrid -työpöytä/mobiilisovelluksen kumppanisovelluksen.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-chat-sovellus (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kuvaus**: Java-versio RAG-chat-esimerkistä, joka käyttää Langchain4J:ää tekoälyorkestrointiin. Tukee mikropalveluarkkitehtuuria, useita hakustrategioita (teksti, vektori, hybridi), asiakirjojen latausta Azure Document Intelligencen kanssa ja käyttöönottoa joko Azure Container Appsissa tai Azure Kubernetes Servicessä.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Yritysmyynnin Copilot Azure AI Foundryn kanssa

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kuvaus**: End-to-end vähittäiskaupan RAG-copilot, joka käyttää Azure AI Foundrya ja Promptya. Contoso Outdoor -kaupan chatbot, joka perustaa vastaukset tuoteluettelo- ja asiakastilaustietoihin. Demonstroi täyden GenAIOps-työnkulun — prototyyppi Promptyllä, arviointi tekoälyn avustamilla arvioijilla, ja käyttöönotto AZD:llä Container Appsiin.

**Nopea aloitus**:
```bash
azd init --template contoso-chat
azd up
```

### Luova kirjoittaminen -moni-agenttisovellus

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Palvelut**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kuvaus**: Moni-agenttinen esimerkki, joka demonstroi agenttien orkestrointia Promptyn avulla. Käyttää tutkimusagenttia (Bing Grounding Azure AI Agent Servicessä), tuoteagenttia (Azure AI Search), kirjoittaja-agenttia ja editori-agenttia tuottamaan yhdessä hyvin tutkittuja artikkeleita. Sisältää CI/CD:n ja arvioinnin GitHub Actionsissa.

**Nopea aloitus**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Palvelut**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kuvaus**: Täysin serverless RAG-chatbot, joka käyttää LangChain.js:ää ja Azure Functionseja API:na sekä Azure Static Web Appsia hostingiin. Käyttää Azure Cosmos DB:tä vektorivarastona ja chat-historian tietokantana. Tukee paikallista kehitystä Ollaman kanssa nollakustannustestausta varten.

**Nopea aloitus**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data -ratkaisukiihdytin

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kuvaus**: Yritysluokan RAG-ratkaisukiihdytin, jossa on ylläpitäjän portaali asiakirjojen latausta/hallintaa varten, useita orkestrointivaihtoehtoja (Semantic Kernel, LangChain, Prompt Flow), puheesta tekstiin -toiminto, Microsoft Teams -integraatio ja valinta PostgreSQL:n tai Cosmos DB:n välillä. Suunniteltu muokattavaksi lähtökohdaksi tuotantovalmiisiin RAG-skenaarioihin.

**Nopea aloitus**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI-matkatoimistot — moni-agentti MCP-orkestrointi

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Palvelut**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Kuvaus**: Viitesovellus moni-agentti-orkestrointiin käyttäen kolmea kehystä (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisältää MCP (Model Context Protocol) -palvelimet neljällä kielellä, jotka on julkaistu serverless Azure Container Appseina OpenTelemetry-valvonnalla.

**Nopea aloitus**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Aloitus

**Repositorio**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Palvelut**: Azure AI Services + Azure OpenAI

**Kuvaus**: Miniminen Bicep-malli, joka ottaa käyttöön Azure AI -palvelut konfiguroiduilla koneoppimismalleilla. Kevyt lähtökohta, kun tarvitset vain Azure AI -infrastruktuurin provisioituna ilman täydellistä sovelluspinon käyttöönottoa.

**Nopea aloitus**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Selaa lisää malleja**: Vieraile [Upea AZD AI -malligalleria](https://azure.github.io/awesome-azd/?tags=ai) nähdäksesi yli 80 AI-spesifistä AZD-mallia eri kielille ja skenaarioihin.

## Seuraavat vaiheet

1. **Kokeile esimerkkejä**: Aloita valmiista mallista, joka vastaa käyttötapaustasi
2. **Mukauta tarpeisiisi**: Muokkaa infrastruktuuria ja sovelluskoodia
3. **Lisää valvonta**: Toteuta kattava havaittavuus
4. **Optimoi kustannukset**: Hienosäädä asetuksia budjetillesi sopiviksi
5. **Suojaa käyttöönotto**: Ota käyttöön yritystason suojausmallit
6. **Skaalaa tuotantoon**: Lisää monialueisuus ja korkea käytettävyys

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Ota käyttöön Microsoft Foundry Models -chat-sovellus (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tuotantovalmiiksi valmisteltu tekoälychat-sovellus

```bash
# Alusta malli
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Aseta ympäristömuuttujat
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Ota käyttöön
azd up

# Testaa sovellus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Valvo tekoälyn toimintoja
azd monitor

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Käyttöönotto suoritettu ilman kvota-virheitä
- [ ] Pääsee käsiksi chat-käyttöliittymään selaimessa
- [ ] Voi esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia
- [ ] Application Insights näyttää telemetriatiedot
- [ ] Resurssit puhdistettu onnistuneesti

**Arvioitu kustannus**: $5-10 30 minuutin testausta varten

### Harjoitus 2: Määritä monimalli-käyttöönotto (45 minuuttia)
**Tavoite**: Ota käyttöön useita tekoälymalleja eri konfiguraatioilla

```bash
# Luo mukautettu Bicep-määritys
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

# Ota käyttöön ja varmista
azd provision
azd show
```

**Onnistumiskriteerit:**
- [ ] Useita malleja käytössä onnistuneesti
- [ ] Eri kapasiteettiasetukset sovellettu
- [ ] Mallit saavutettavissa API:n kautta
- [ ] Sovellus voi kutsua molempia malleja

### Harjoitus 3: Ota käyttöön kustannusseuranta (20 minuuttia)
**Tavoite**: Määritä budjetti-ilmoitukset ja kustannusseuranta

```bash
# Lisää budjettihälytys Bicepiin
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

# Ota budjettihälytys käyttöön
azd provision

# Tarkista nykyiset kustannukset
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Onnistumiskriteerit:**
- [ ] Budjettihälytys luotu Azureen
- [ ] Sähköposti-ilmoitukset konfiguroitu
- [ ] Kustannustiedot näkyvissä Azure-portaalissa
- [ ] Budjettirajat asetettu asianmukaisesti

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Kuinka vähennän Microsoft Foundry Models -kustannuksia kehityksen aikana?</strong></summary>

1. **Käytä ilmaista tasoa**: Microsoft Foundry Models tarjoaa 50,000 tokenia/kuukausi ilmaiseksi
2. **Vähennä kapasiteettia**: Aseta kapasiteetti 10 TPM:ään 30+:n sijaan kehitystä varten
3. **Käytä azd down -komentoa**: Poista resurssit käytöstä, kun et kehitä aktiivisesti
4. **Välimuistita vastaukset**: Ota käyttöön Redis-välimuisti toistuvia kyselyjä varten
5. **Käytä prompt-insinööritystä**: Vähennä tokenien käyttöä tehokkailla kehotteilla

```bash
# Kehityskonfiguraatio
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mikä on ero Microsoft Foundry Modelsin ja OpenAI API:n välillä?</strong></summary>

**Microsoft Foundry Models**:
- Yritysasteen turvallisuus ja vaatimustenmukaisuus
- Yksityisen verkon integrointi
- SLA-takuut
- Hallinnoidun identiteetin todennus
- Korkeammat kvotat saatavilla

**OpenAI API**:
- Uusiin malleihin nopeampi pääsy
- Yksinkertaisempi käyttöönotto
- Matalampi kynnys aloittaa
- Toimii vain julkisessa internetissä

Tuotantosovelluksiin suositellaan **Microsoft Foundry Modelsia**.
</details>

<details>
<summary><strong>Miten käsittelen Microsoft Foundry -mallien käyttökiintiön ylittämiseen liittyviä virheitä?</strong></summary>

```bash
# Tarkista nykyinen kiintiö
az cognitiveservices usage list --location eastus2

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia tilapäisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Pyydä kiintiön nostoa
# Siirry Azure-portaaliin > Kiintiöt > Pyydä korotusta
```
</details>

<details>
<summary><strong>Voinko käyttää omia tietojani Microsoft Foundry -mallien kanssa?</strong></summary>

Kyllä! Käytä **Azure AI Search** -palvelua RAG:iin (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Katso [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) -malli.
</details>

<details>
<summary><strong>Kuinka varmistan AI-mallien päätepisteiden turvallisuuden?</strong></summary>

**Parhaat käytännöt**:
1. Käytä Managed Identityä (ei API-avaimia)
2. Ota Private Endpoints käyttöön
3. Määritä verkkoturvaryhmät (network security groups)
4. Ota käyttöön pyyntöjen rajoitus (rate limiting)
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Install Azure + Foundry agent skills in your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Chapter 2 - AI-First Development
- **⬅️ Edellinen luku**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisön keskusteluihin tai avaa issue repositorioon. Azure AI + AZD -yhteisö on täällä auttaakseen sinua onnistumaan!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattisissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulisi pitää auktoritatiivisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
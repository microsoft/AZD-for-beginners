# Microsoft Foundry -integraatio AZD:n kanssa

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensisijainen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Yleiskatsaus

Tämä opas näyttää, kuinka Microsoft Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa sujuvoittamaan AI-sovellusten käyttöönottoja. Microsoft Foundry tarjoaa kattavan alustan AI-sovellusten rakentamiselle, käyttöönotolle ja hallinnalle, kun taas AZD yksinkertaistaa infrastruktuurin ja käyttöönoton prosessin.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen AI-kehitysalusta, joka sisältää:

- **Malliluettelo**: Pääsy huipputason AI-malleihin
- **Prompt Flow**: Visuaalinen suunnittelutyökalu AI-työnkuluissa
- **Microsoft Foundry Portal**: Integroitu kehitysympäristö AI-sovelluksille
- **Käyttöönottovaihtoehdot**: Useita hosting- ja skaalautumisvaihtoehtoja
- **Turvallisuus ja luotettavuus**: Sisäänrakennetut vastuullisen AI:n ominaisuudet

## AZD + Microsoft Foundry: Paremmat yhdessä

| Ominaisuus | Microsoft Foundry | AZD-integraation etu |
|---------|-----------------|------------------------|
| **Mallin käyttöönotto** | Manuaalinen portaalin käyttö | Automaattiset, toistettavat käyttöönotot |
| **Infrastruktuuri** | Klikattava provisiointi | Infrastructure as Code (Bicep) |
| **Ympäristön hallinta** | Yksittäinen ympäristön fokus | Moniympäristö (dev/staging/prod) |
| **CI/CD-integraatio** | Rajoitettu | Natiivi GitHub Actions -tuki |
| **Kustannusten hallinta** | Perusseuranta | Ympäristökohtainen kustannusten optimointi |

## Esivaatimukset

- Azure-tilaus, jolla on asianmukaiset oikeudet
- Azure Developer CLI asennettuna
- Pääsy Microsoft Foundry Models -palveluihin
- Perustuntemus Microsoft Foundrystä

> **Nykyinen AZD-versio:** Näitä esimerkkejä on testattu `azd` `1.27.1` -version kanssa. AI-agentin työnkulussa käytä nykyistä esikatselu-laajennusversiota ja tarkista asennettu versio ennen aloittamista.

## Keskeiset integraatiomallit

### Malli 1: Microsoft Foundry Models -integraatio

**Käyttötapaus**: Chattisovellusten käyttöönotto Microsoft Foundry Models -malleilla

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

### Malli 2: AI-haku + RAG-integraatio

**Käyttötapaus**: Käyttöönotto hakua parantavilla generointisovelluksilla (RAG)

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

### Malli 3: Dokumenttien älykkyyden integraatio

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

### Ympäristömuuttujien asetus

**Tuotantokonfiguraatio:**
```bash
# Ydintekoälypalvelut
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mallin asetukset
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Suorituskykyasetukset
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Kehityskonfiguraatio:**
```bash
# Kehitykseen kustannustehokkaat asetukset
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ilmainen taso
```

### Turvallinen konfigurointi Key Vaultilla

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

AZD tarjoaa laajennuksia, jotka lisäävät AI-kohtaisia ominaisuuksia Microsoft Foundry -palveluiden kanssa työskentelyyn:

```bash
# Asenna Foundry-agenttilaajennus
azd extension install azure.ai.agents

# Asenna hienosäätölaajennus
azd extension install azure.ai.finetune

# Asenna mukautettujen mallien laajennus
azd extension install azure.ai.models

# Listaa asennetut laajennukset
azd extension list --installed

# Tarkastele parhaillaan asennetun agenttilaajennuksen versiota
azd extension show azure.ai.agents
```

AI-laajennukset kehittyvät esiversiossa nopeasti. Jos jokin komento toimii eri tavalla kuin tässä esitetään, päivitä kyseinen laajennus ennen projektin vianmääritystä.

### Agentti-ensimmäinen käyttöönotto komennolla `azd ai`

Jos sinulla on agentin manifesti, käytä `azd ai agent init` luomaan projekti, joka on liitetty Foundry Agent Serviceen:

```bash
# Alusta agenttimanifestista
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ota käyttöön Azureen
azd up
```

`azure.ai.agents` -esiversiot sisältävät myös mallipohjaista alustustukea `azd ai agent init` -komennolle. Jos seuraat uudempia agenttinäytteitä, tarkista laajennuksen ohjeista tarkat käytettävissä olevat liput asennetussa versiossasi.

Katso [AZD AI CLI -komentojen luettelo](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täydellisestä komentoviitteestä ja lipuista.

### Yhden komennon käyttöönotto

```bash
# Ota kaikki käyttöön yhdellä komennolla
azd up

# Tai ota käyttöön asteittain
azd provision  # Pelkkä infrastruktuuri
azd deploy     # Pelkkä sovellus

# Pitkäkestoisten tekoälysovellusten käyttöönottoon azd 1.23.11+:ssa
azd deploy --timeout 1800
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

## Seuranta ja havaittavuus

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

### Kustannusseuranta

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

### Hallittu identiteetti -konfiguraatio

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

### Automaattisen skaalauksen konfiguraatio

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

## Yleisten ongelmien vianmääritys

### Ongelma 1: OpenAI-rajoitus ylittynyt

**Oireet:**
- Käyttöönotto epäonnistuu rajoitusvirheiden vuoksi
- 429-virheitä sovelluksen lokissa

**Ratkaisut:**
```bash
# Tarkista nykyinen kiintiön käyttö
az cognitiveservices usage list --location eastus

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia tilapäisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Ongelma 2: Todennusvirheet

**Oireet:**
- 401/403-virheitä kutsuttaessa AI-palveluja
- "Pääsy estetty" -viestit

**Ratkaisut:**
```bash
# Vahvista roolimääritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tarkista hallitun identiteetin asetukset
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Vahvista Key Vault -käyttöoikeudet
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Ongelma 3: Mallin käyttöönotto-ongelmat

**Oireet:**
- Mallit eivät ole saatavilla käyttöönotossa
- Tiettyjen malliversioiden virheet

**Ratkaisut:**
```bash
# Listaa saatavilla olevat mallit alueittain
az cognitiveservices model list --location eastus

# Päivitä malliversio bicep-malliin
# Tarkista mallin kapasiteettivaatimukset
```

## Esimerkkipohjat

### RAG Chat -sovellus (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kuvaus**: Suosituin Azure AI -näyte — tuotantovalmiiksi saatettu RAG-chat-sovellus, joka mahdollistaa kysymysten esittämisen omien dokumenttiesi perusteella. Käyttää GPT-4.1-miniä chat-viestintään, text-embedding-3-largea upotuksiin sekä Azure AI Searchia hakua varten. Tukee multimodaalisia dokumentteja, puheentunnistusta/synteesiä, Microsoft Entra -todennusta ja Application Insights -seurantaa.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat -sovellus (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kuvaus**: .NET/C#-vastine Pythonin RAG-chat-näytteelle. Rakennettu ASP.NET Core Minimal API:n ja Blazor WebAssembly -käyttöliittymän avulla. Sisältää äänichatin, GPT-4o-mini -vision tuen sekä rinnakkaisen .NET MAUI Blazor Hybrid -työpöytä/mobiilikäyttäjän.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat -sovellus (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kuvaus**: Javaversio RAG-chat-näytteestä, joka käyttää Langchain4J:tä AI-orchestrationiin. Tukee mikropalveluarkkitehtuuria, useita hakustrategioita (teksti, vektori, hybridi), dokumenttien latausta Azure Document Intelligence -palvelulla sekä käyttöönottoa Azure Container Appsissa tai Azure Kubernetes Servicessä.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Yrityksen vähittäiskaupan assistentti Microsoft Foundrylla

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kuvaus**: Täysin integroitu vähittäiskaupan RAG-assistentti Microsoft Foundryn ja Promptyn avulla. Contoso Outdoor -vähittäiskaupan chatbot, joka perustaa vastauksensa tuoteluetteloon ja asiakastilaustietoihin. Demonstroi koko GenAIOps-työnkulun — prototyypin Promptyllä, arviointi AI-avusteisilla arvioijilla ja käyttöönotto AZD:llä Container Appseihin.

**Nopea aloitus**:
```bash
azd init --template contoso-chat
azd up
```

### Luova kirjoittaminen monitoimijaisena sovelluksena

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Palvelut**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kuvaus**: Monitoimijainen näyte, joka esittelee AI-agenttien orkestrointia Promptyn avulla. Käyttää tutkimusagenttia (Bing Grounding Azure AI Agent Service -palvelussa), tuoteagenttia (Azure AI Search), kirjoittaja-agenttia ja toimittaja-agenttia, jotka tuottavat yhdessä hyvin tutkittuja artikkeleita. Sisältää CI/CD:n GitHub Actions -arvioinnilla.

**Nopea aloitus**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverittömän RAG-chatin toteutus (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Palvelut**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kuvaus**: Täysin serveriton RAG-chatbot käyttäen LangChain.js:ää, Azure Functionsia API:na ja Azure Static Web Appsia hosting-alustana. Käyttää Azure Cosmos DB:tä sekä vektorivarastona että keskusteluhistorian tietokantana. Tukee paikallista kehitystä Ollaman avulla ilmaiseen testaamiseen.

**Nopea aloitus**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data -ratkaisun kiihdyttäjä

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kuvaus**: Yritystason RAG-ratkaisukiihdyttäjä, jossa on hallintaportaalin dokumenttien lataus/hallinta, useita orkestroijavaihtoehtoja (Semantic Kernel, LangChain, Prompt Flow), puhetekstiksi -toiminto, Microsoft Teams -integraatio ja valinta PostgreSQL:n tai Cosmos DB:n välillä. Suunniteltu muokattavaksi lähtökohdaksi tuotantotason RAG-skenaarioihin.

**Nopea aloitus**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI-matka-agentit — Monitoimijainen MCP-orkestrointi

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Palvelut**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP-palvelimet (.NET, Python, Java, TypeScript)

**Kuvaus**: Viitesovellus monitoimijaisen AI-orkestroinnin toteutukseen kolmella eri kehikolla (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisältää MCP (Model Context Protocol) -palvelimia neljällä kielellä, jotka on otettu käyttöön serverittöminä Azure Container Apps -palveluina OpenTelemetry-seurannalla.

**Nopea aloitus**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositorio**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Palvelut**: Azure AI Services + Azure OpenAI

**Kuvaus**: Kevyt Bicep-malli, joka ottaa käyttöön Azure AI -palvelut määritellyillä koneoppimismalleilla. Kevyt lähtökohta, kun tarvitset vain Azure AI -infrastruktuurin ilman koko sovelluspinon käyttöönottoa.

**Nopea aloitus**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Selaa lisää malleja**: Vieraile [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) -sivulla, jossa on yli 80 AI-kohtaista AZD-mallia eri kielillä ja skenaarioihin.

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita valmiilla mallilla, joka vastaa käyttötapaustasi
2. **Mukauta tarpeidesi mukaan**: Muuta infrastruktuuria ja sovelluskoodia
3. **Lisää seuranta**: Toteuta kattava havaittavuus
4. **Optimoi kustannukset**: Hienosäädä asetuksia budjettiisi sopivaksi
5. **Varmista käyttöönotto**: Ota käyttöön yritysturvakuvioita
6. **Skaalaa tuotantoon**: Lisää monialue- ja korkean käytettävyyden ominaisuudet

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Ota käyttöön Microsoft Foundry Models -chat-sovellus (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tuotantovalmiiksi saatettu AI-chat-sovellus

```bash
# Alusta mallipohja
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
- [ ] Käyttöönotto valmistuu ilman rajoitusvirheitä
- [ ] Pääsee käyttämään chat-käyttöliittymää selaimessa
- [ ] Voi esittää kysymyksiä ja saada AI:n tuottamia vastauksia
- [ ] Application Insights näyttää telemetriatiedot
- [ ] Resurssit siivottu onnistuneesti

**Arvioitu kustannus**: 5–10 dollaria 30 minuutin testauksesta

### Harjoitus 2: Määrätyn mallin käyttöönotto (45 minuuttia)
**Tavoite**: Ota käyttöön useita AI-malleja eri konfiguraatioilla

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

# Ota käyttöön ja varmista
azd provision
azd show
```

**Onnistumiskriteerit:**
- [ ] Useita malleja otettu onnistuneesti käyttöön
- [ ] Eri kapasiteettiasetukset sovellettu
- [ ] Mallit käytettävissä API:n kautta
- [ ] Molempia malleja voi kutsua sovelluksesta

### Harjoitus 3: Kustannusseurannan käyttöönotto (20 minuuttia)
**Tavoite**: Määritä budjetti-ilmoitukset ja kustannusseuranta

```bash
# Lisää budjettihälytys Bicep:iin
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
- [ ] Budjetin rajat asetettu oikein

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Kuinka voin vähentää Microsoft Foundry Models -kulujani kehityksen aikana?</strong></summary>

1. **Käytä ilmaista tasoa**: Microsoft Foundry Models tarjoaa 50 000 tokenia kuukaudessa maksutta
2. **Vähennä kapasiteettia**: Aseta kapasiteetti 10 TPM:iin 30+ sijaan kehitysvaiheessa
3. **Käytä `azd down`**: Vapauta resurssit, kun et aktiivisesti kehitä
4. **Välimuistita vastaukset**: Ota käyttöön Redis-välimuisti toistuviin kyselyihin
5. **Käytä promptinsinööritystä**: Vähennä tokenien käyttöä tehokkailla kehotteilla


```bash
# Kehityskokoonpano
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mikä on ero Microsoft Foundry Modelsin ja OpenAI API:n välillä?</strong></summary>

**Microsoft Foundry Models**:
- Yritystason turvallisuus ja vaatimustenmukaisuus
- Yksityisen verkon integrointi
- SLA-takuu
- Hallinnoitu identiteetin todennus
- Korkeammat käyttökiintiöt saatavilla

**OpenAI API**:
- Nopeampi pääsy uusiin malleihin
- Yksinkertaisempi käyttöönotto
- Alempi aloittamisen kynnys
- Vain julkinen internet

Tuotantosovelluksiin **suositellaan Microsoft Foundry Modelseja**.
</details>

<details>
<summary><strong>Kuinka käsittelen Microsoft Foundry Models -käyttökiintiön ylitysongelmia?</strong></summary>

```bash
# Tarkista nykyinen kiintiö
az cognitiveservices usage list --location eastus2

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia väliaikaisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Pyydä kiintiön lisäystä
# Siirry Azure-portaaliin > Kiintiöt > Pyydä lisäystä
```
</details>

<details>
<summary><strong>Voinko käyttää omia tietojani Microsoft Foundry Modelsien kanssa?</strong></summary>

Kyllä! Käytä **Azure AI Searchia** RAG (Retrieval Augmented Generation) -toimintaan:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Katso [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) -mallipohja.
</details>

<details>
<summary><strong>Kuinka varmistan tekoälymallien päätepisteiden turvallisuuden?</strong></summary>

**Parhaat käytännöt**:
1. Käytä Hallinnoitua identiteettiä (ei API-avaimia)
2. Ota käyttöön Yksityiset päätepisteet
3. Määritä verkon suojausryhmät
4. Toteuta nopeusrajoitukset
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
- **AZD GitHub**: [Ongelmia ja keskusteluja](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)
- **Agentin taidot**: [Microsoft Foundryn taito skills.sh:ssä](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Asenna Azure + Foundry agenttien taidot editoriisi komennolla `npx skills add microsoft/github-copilot-for-azure`

---

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisökeskusteluihimme tai avaa ongelma repositorioon. Azure AI + AZD -yhteisö auttaa sinua menestymään!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
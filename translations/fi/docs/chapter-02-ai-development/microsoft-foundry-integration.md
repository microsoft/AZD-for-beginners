# Microsoft Foundry -integraatio AZD:n kanssa

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-First Development
- **⬅️ Edellinen luku**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Yleiskatsaus

Tämä opas näyttää, miten Microsoft Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa AI-sovellusten käyttöönottojen sujuvoittamiseksi. Microsoft Foundry tarjoaa kattavan alustan AI-sovellusten rakentamiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuuri- ja julkaisuprosessia.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen alusta AI-kehitykseen, joka sisältää:

- **Model Catalog**: Pääsy huippuluokan AI-malleihin
- **Prompt Flow**: Visuaalinen suunnittelija AI-työnkulkuihin
- **Microsoft Foundry Portal**: Integroitu kehitysympäristö AI-sovelluksille
- **Deployment Options**: Useita isännöinti- ja skaalausvaihtoehtoja
- **Safety and Security**: Sisäänrakennetut vastuullisen tekoälyn ominaisuudet

## AZD + Microsoft Foundry: Parempi yhdessä

| Ominaisuus | Microsoft Foundry | AZD-integraation etu |
|---------|-----------------|------------------------|
| **Model Deployment** | Manuaalinen portaaliin perustuva käyttöönotto | Automaattiset, toistettavat käyttöönotot |
| **Infrastructure** | Klikkaamalla tehtävä provisiointi | Infrastructure as Code (Bicep) |
| **Environment Management** | Yhteen ympäristöön keskittyminen | Moniympäristö (dev/staging/prod) |
| **CI/CD Integration** | Rajoitettu | Natiivit GitHub Actions -tuet |
| **Cost Management** | Perusseuranta | Ympäristökohtainen kustannusoptimointi |

## Vaatimukset

- Azure-tilaus, jossa on tarvittavat oikeudet
- Azure Developer CLI asennettuna
- Pääsy Microsoft Foundry Models -palveluihin
- Perustuntemus Microsoft Foundrystä

> **Nykyinen AZD-vertailukohta:** Nämä esimerkit tarkastettiin `azd` `1.23.12` -versiota vasten. AI-agentin työnkululle käytä nykyistä preview-laajennusjulkaisua ja tarkista asennettu versiosi ennen aloittamista.

## Keskeiset integraatiomallit

### Malli 1: Microsoft Foundry Models -integraatio

**Käyttötapaus**: Ota käyttöön chat-sovelluksia Microsoft Foundry Models -mallien avulla

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

**Käyttötapaus**: Asiakirjojen käsittelyyn ja analysointiin liittyvät työnkulut

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

### Ympäristömuuttujien asetukset

**Tuotantokonfiguraatio:**
```bash
# Keskeiset tekoälypalvelut
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mallien asetukset
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Suorituskykyasetukset
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Kehityskonfiguraatio:**
```bash
# Kehitystä varten kustannustehokkaat asetukset
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ilmainen taso
```

### Turvallinen konfigurointi Key Vaultin avulla

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

## Julkaisutyönkulut

### AZD-laajennukset Foundrylle

AZD tarjoaa laajennuksia, jotka lisäävät AI-spesifisiä ominaisuuksia Microsoft Foundry -palvelujen käyttöön:

```bash
# Asenna Foundry Agents -laajennus
azd extension install azure.ai.agents

# Asenna hienosäätölaajennus
azd extension install azure.ai.finetune

# Asenna mukautettujen mallien laajennus
azd extension install azure.ai.models

# Listaa asennetut laajennukset
azd extension list --installed

# Tarkastele tällä hetkellä asennetun agenttilaajennuksen versiota
azd extension show azure.ai.agents
```

AI-laajennukset kehittyvät edelleen nopeasti preview-vaiheessa. Jos komento käyttäytyy eri tavalla kuin tässä esitetty, päivitä kyseinen laajennus ennen projektin vianmääritystä.

### Agenttiperusteinen käyttöönotto `azd ai` -työkalulla

Jos sinulla on agenttimanifesti, käytä `azd ai agent init` -komentoa projektin luonnosteluun, joka on yhdistetty Foundry Agent Serviceen:

```bash
# Alusta agentin manifestista
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ota käyttöön Azureen
azd up
```

Äskettäiset preview-julkaisut paketista `azure.ai.agents` lisäsivät myös mallipohjaiseen alustukseen tuen `azd ai agent init` -komennolle. Jos seuraat uudempia agenttinäytteitä, tarkista laajennuksen ohjeet asennetun version tarjoamista täsmällisistä lipuista.

Katso [AZD AI CLI -komennot](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täydellisestä komentoviitteestä ja lipuista.

### Yhden komennon käyttöönotto

```bash
# Ota kaikki käyttöön yhdellä komennolla
azd up

# Tai ota käyttöön vaiheittain
azd provision  # Vain infrastruktuuri
azd deploy     # Vain sovellus

# Pitkäkestoisia tekoälysovellusten käyttöönottoja azd 1.23.11+ varten
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

### Hallinnoidun identiteetin määritys

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

### Verkon suojaus

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

### Automaattisen skaalaamisen konfigurointi

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

## Yleisimpien ongelmien vianmääritys

### Ongelma 1: OpenAI-kvotan ylittyminen

**Oireet:**
- Käyttöönotto epäonnistuu kvottavirheiden vuoksi
- Sovelluslokissa 429-virheitä

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
- "Access denied" -viestit

**Ratkaisut:**
```bash
# Varmista roolien määritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tarkista hallitun identiteetin konfiguraatio
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Vahvista Key Vaultin käyttöoikeudet
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Ongelma 3: Mallin käyttöönotto-ongelmat

**Oireet:**
- Mallit eivät ole saatavilla käyttöönotossa
- Tiettyjen malliversioiden epäonnistuminen

**Ratkaisut:**
```bash
# Listaa saatavilla olevat mallit alueittain
az cognitiveservices model list --location eastus

# Päivitä mallin versio bicep-templaatissa
# Tarkista mallin kapasiteettivaatimukset
```

## Esimerkkipohjat

### RAG-chat-sovellus (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kuvaus**: Suosituin Azure AI -näyte — tuotantovalmiiksi suunniteltu RAG-chat-sovellus, jonka avulla voit kysyä omista asiakirjoistasi. Käyttää GPT-4.1-miniä chattiin, text-embedding-3-largea upotuksiin ja Azure AI Searchia hakua varten. Tukee multimodaalisia asiakirjoja, puhe-input/outputia, Microsoft Entra -todennusta ja Application Insightsin jäljitystä.

**Pika-aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-chat-sovellus (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kuvaus**: .NET/C#-vastine Pythonin RAG-chat-näytteelle. Rakennettu ASP.NET Core Minimal API:lla ja Blazor WebAssembly -frontendilla. Sisältää äänichatin, GPT-4o-mini vision -tuet ja rinnakkaisen .NET MAUI Blazor Hybrid -työpöytä/mobiiliasiakasohjelman.

**Pika-aloitus**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-chat-sovellus (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kuvaus**: Java-versio RAG-chat-näytteestä, joka käyttää Langchain4J:ää AI-orchestrointiin. Tukee mikroservice-pohjaista tapahtumapohjaista arkkitehtuuria, useita hakustrategioita (teksti, vektori, hybridi), asiakirjojen latausta Azure Document Intelligencen avulla ja käyttöönottoa joko Azure Container Appsissa tai Azure Kubernetes Servicessä.

**Pika-aloitus**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot Microsoft Foundryn kanssa

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kuvaus**: Päätästä loppuun - vähittäiskaupan RAG-copilot, joka käyttää Microsoft Foundrya ja Promptyä. Contoso Outdoor -vähittäiskaupan chatbot, joka perustaa vastaukset tuotekatalogiin ja asiakastilaustietoihin. Demonstroi koko GenAIOps-työnkulun — prototyyppi Promptyllä, arviointi AI-avusteisilla arvioijilla ja julkaisu AZD:llä Container Appsiin.

**Pika-aloitus**:
```bash
azd init --template contoso-chat
azd up
```

### Luova kirjoittaminen — moniadjentsovellus

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Palvelut**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kuvaus**: Moni-agenttinäyte, joka demonstroi AI-agenttien orkestraatiota Promptyn avulla. Käyttää tutkimusagenttia (Bing Grounding Azure AI Agent Servicessä), tuoteagenttia (Azure AI Search), kirjoittaja-agenttia ja toimittaja-agenttia tuottamaan yhdessä hyvin tutkittuja artikkeleita. Sisältää CI/CD:n ja arvioinnin GitHub Actionsissa.

**Pika-aloitus**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Palvelut**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kuvaus**: Täysin serverless RAG-chatbot, joka käyttää LangChain.js:ää, Azure Functionsia API:na ja Azure Static Web Appsia hostingiin. Käyttää Azure Cosmos DB:tä sekä vektoritallennuksena että chathistorian tietokantana. Tukee paikallista kehitystä Ollaman avulla nollakustannustestaukseen.

**Pika-aloitus**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kuvaus**: Yritystason RAG-ratkaisuaccelerator, jossa on ylläpitosivusto asiakirjojen latausta/hallintaa varten, useita orkestrointivaihtoehtoja (Semantic Kernel, LangChain, Prompt Flow), puheesta tekstiin -toiminnot, Microsoft Teams -integraatio ja valittavana PostgreSQL- tai Cosmos DB-takapala. Suunniteltu muokattavaksi lähtökohdaksi tuotannollisille RAG-skenaarioille.

**Pika-aloitus**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Palvelut**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Kuvaus**: Viitesovellus moni-agenttien AI-orkestrointiin käyttäen kolmea kehystä (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisältää MCP (Model Context Protocol) -palvelimet neljällä kielellä, jotka on otettu käyttöön serverless Azure Container Apps -ympäristöissä OpenTelemetry-valvonnalla.

**Pika-aloitus**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Palvelut**: Azure AI Services + Azure OpenAI

**Kuvaus**: Kevyt Bicep-malli, joka ottaa käyttöön Azure AI -palvelut konfiguroiduilla koneoppimismalleilla. Kevyt lähtökohta, kun tarvitset vain Azure AI -infrastruktuurin ilman täyttä sovelluspinon käyttöönottoa.

**Pika-aloitus**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Selaa lisää malleja**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita valmiilla mallilla, joka vastaa käyttötapaustasi
2. **Mukauta tarpeidesi mukaan**: Muokkaa infrastruktuuria ja sovelluskoodia
3. **Lisää valvonta**: Ota käyttöön kattava havaittavuus
4. **Optimoi kustannukset**: Viimeistele konfiguraatiot budjetillesi sopiviksi
5. **Suojaa käyttöönotto**: Ota käyttöön yritystason turvallisuusmallit
6. **Skaalaa tuotantoon**: Lisää monialueiset ja korkean käytettävyyden ominaisuudet

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Ota käyttöön Microsoft Foundry Models -chat-sovellus (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tuotantovalmiiksi suunniteltu AI-chat-sovellus

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

# Seuraa tekoälyn toimintoja
azd monitor

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Käyttöönotto suoritetaan ilman kvottavirheitä
- [ ] Pääsee käsiksi chat-käyttöliittymään selaimessa
- [ ] Voi esittää kysymyksiä ja saada AI-avusteisia vastauksia
- [ ] Application Insights näyttää telemetriatietoja
- [ ] Resurssit siivottiin onnistuneesti

**Arvioitu kustannus**: $5-10 noin 30 minuutin testaukseen

### Harjoitus 2: Konfiguroi monimallinen käyttöönotto (45 minuuttia)
**Tavoite**: Ota käyttöön useita AI-malleja eri konfiguraatioilla

```bash
# Luo mukautettu Bicep-konfiguraatio
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
- [ ] Eri kapasiteetiasetukset käytössä
- [ ] Mallit saatavilla API:n kautta
- [ ] Sovellus pystyy kutsumaan molempia malleja

### Harjoitus 3: Ota käyttöön kustannusseuranta (20 minuuttia)
**Tavoite**: Määritä budjetti-ilmoitukset ja kustannusten seuranta

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
- [ ] Budjetti-ilmoitus luotu Azureen
- [ ] Sähköposti-ilmoitukset konfiguroitu
- [ ] Kustannustiedot nähtävissä Azure-portaalissa
- [ ] Budjettirajat asetettu asianmukaisesti

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Kuinka vähennän Microsoft Foundry Models -kustannuksia kehitysvaiheessa?</strong></summary>

1. **Käytä ilmaista kerrosta**: Microsoft Foundry Models tarjoaa 50 000 tokenia/kuukausi ilmaiseksi
2. **Vähennä kapasiteettia**: Aseta kapasiteetti kehitystä varten 10 TPM:ään 30+:n sijaan
3. **Käytä azd down**: Poista resurssien allokointi, kun et kehitä aktiivisesti
4. **Välimuistita vastaukset**: Ota Redis-välimuisti käyttöön toistuviin hakuin
5. **Käytä prompt-engineeringia**: Vähennä tokenien käyttöä tehokkailla kehotteilla

</details>
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
- SLA-takuut
- Hallinnoidun identiteetin todennus
- Korkeammat kiintiöt saatavilla

**OpenAI API**:
- Nopeampi pääsy uusiin malleihin
- Yksinkertaisempi käyttöönotto
- Alhaisempi kynnys aloittamiseen
- Vain julkinen internet-yhteys

Tuotantosovelluksiin suosittelemme **Microsoft Foundry Modelsia**.
</details>

<details>
<summary><strong>Miten käsittelen Microsoft Foundry Modelsin kiintiön ylitykseen liittyvät virheet?</strong></summary>

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
# Siirry Azure-portaaliin > Kiintiöt > Pyydä nostoa
```
</details>

<details>
<summary><strong>Voinko käyttää omia tietojani Microsoft Foundry Modelsin kanssa?</strong></summary>

Kyllä! Käytä **Azure AI Searchia** RAG:iin (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Katso mallipohja [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Miten suojaan AI-mallien päätepisteet?</strong></summary>

**Parhaat käytännöt**:
1. Käytä Managed Identityä (ei API-avaimia)
2. Ota Private Endpoints käyttöön
3. Määritä Network Security Groupit
4. Toteuta nopeusrajoitus
5. Käytä Azure Key Vaultia salaisuuksiin

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
- **AZD GitHub**: [Issues ja keskustelut](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Asenna Azure- ja Foundry-agenttien taidot editoriisi komennolla `npx skills add microsoft/github-copilot-for-azure`

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Chapter 2 - AI-First Development
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisömme keskusteluihin tai avaa issue repositorioon. Azure AI + AZD -yhteisö on täällä auttamassa sinua onnistumaan!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
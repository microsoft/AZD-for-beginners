# Microsoft Foundry -integraatio AZD:n kanssa

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Luku 2 - AI-Ensimmäinen kehitys
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Yleiskatsaus

Tämä opas näyttää, miten Microsoft Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa sujuvoittamaan tekoälysovellusten käyttöönottoja. Microsoft Foundry tarjoaa kattavan alustan tekoälyn kehittämiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuurin ja käyttöönoton prosessia.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen alusta tekoälyn kehitykseen, joka sisältää:

- **Model Catalog**: Pääsy huippuluokan tekoälymalleihin
- **Prompt Flow**: Visuaalinen suunnittelija tekoälytyönkuluissa
- **Microsoft Foundry Portal**: Integroitu kehitysympäristö tekoälysovelluksille
- **Deployment Options**: Useita isännöinti- ja skaalausvaihtoehtoja
- **Safety and Security**: Sisäänrakennetut vastuullisen tekoälyn ominaisuudet

## AZD + Microsoft Foundry: Parempia yhdessä

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manuaalinen portaalin käyttöönotto | Automaattiset, toistettavat käyttöönotot |
| **Infrastructure** | Klikattava provisiointi | Infrastruktuuri koodina (Bicep) |
| **Environment Management** | Yhden ympäristön painotus | Usean ympäristön tuki (dev/staging/prod) |
| **CI/CD Integration** | Rajoitettu | Natiivit GitHub Actions -tuet |
| **Cost Management** | Perusseuranta | Ympäristökohtainen kustannusoptimointi |

## Edellytykset

- Azure-tilaus asianmukaisilla oikeuksilla
- Azure Developer CLI asennettuna
- Pääsy Microsoft Foundry Models -palveluihin
- Perustuntemus Microsoft Foundrysta

> **Current AZD baseline:** Nämä esimerkit on tarkistettu `azd` `1.23.12` -version perusteella. AI-agentin työnkululle käytä nykyistä preview-laajennusjulkaisua ja tarkista asennettu versiosi ennen aloittamista.

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

**Käyttötapaus**: Asiakirjojen käsittely- ja analyysityönkulut

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

### Ympäristömuuttujien asetus

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

AZD tarjoaa laajennuksia, jotka lisäävät tekoälykohtaisia ominaisuuksia Microsoft Foundry -palvelujen kanssa työskentelyyn:

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

Tekoälylaajennukset kehittyvät edelleen nopeasti preview-vaiheessa. Jos komento toimii eri tavalla kuin tässä esitetään, päivitä asiaankuuluva laajennus ennen projektin vianmääritystä.

### Agentti-ensimmäinen käyttöönotto `azd ai` -komennolla

Jos sinulla on agenttimanifesti, käytä `azd ai agent init` -komentoa projektin alustamiseen, joka on kytketty Foundry Agent Serviceen:

```bash
# Alusta agentin manifestista
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ota käyttöön Azureen
azd up
```

Viimeaikaiset preview-julkaisut `azure.ai.agents` -laajennukselle lisäsivät myös mallipohjaiseen alustukseen tarkoitetun tuen `azd ai agent init` -komennolle. Jos seuraat uudempia agenttinäytteitä, tarkista laajennuksen ohjeet asennetun version käytettävissä olevista lipuista.

Katso [AZD AI CLI -komennot](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täydelliseksi komentoviitteeksi ja lippuluetteloksi.

### Yhden komennon käyttöönotto

```bash
# Ota kaikki käyttöön yhdellä komennolla
azd up

# Tai ota käyttöön vaiheittain
azd provision  # Vain infrastruktuuri
azd deploy     # Vain sovellus

# Pitkäkestoisiin tekoälysovellusten käyttöönottoihin azd-versiossa 1.23.11 tai uudemmissa
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

### Kustannusvalvonta

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

### Automaattisen skaalauksen määritys

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

## Yleisimmät ongelmat ja vianmääritys

### Ongelma 1: OpenAI:n käyttökiintiö ylitetty

**Oireet:**
- Käyttöönotto epäonnistuu kiintiövirheiden vuoksi
- 429-virheet sovelluksen lokissa

**Ratkaisut:**
```bash
# Tarkista kiintiön nykyinen käyttö
az cognitiveservices usage list --location eastus

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia väliaikaisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Ongelma 2: Autentikointivirheet

**Oireet:**
- 401/403-virheet AI-palveluja kutsuttaessa
- "Access denied" -viestit

**Ratkaisut:**
```bash
# Tarkista roolien määritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tarkista hallitun identiteetin määritykset
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Tarkista Key Vaultin käyttöoikeudet
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

# Päivitä mallin versio Bicep-templaatissa
# Tarkista mallin kapasiteettivaatimukset
```

## Esimerkkipohjat

### RAG-chat-sovellus (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kuvaus**: Suosituin Azure AI -näyte — tuotantovalmiiksi suunniteltu RAG-chat-sovellus, jonka avulla voit esittää kysymyksiä omien asiakirjojesi perusteella. Käyttää GPT-4.1-miniä chatissa, text-embedding-3-largea upotuksiin ja Azure AI Searchia hakuun. Tukee multimodaalisia asiakirjoja, puhetekstisyötettä/-tuotosta, Microsoft Entra -todennusta ja Application Insights -seurantaa.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG-chat-sovellus (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kuvaus**: .NET/C#-vastaava Pythonin RAG-chat-näytteelle. Rakennettu ASP.NET Core Minimal API:lla ja Blazor WebAssembly -frontendilla. Sisältää ääni-chatin, GPT-4o-mini vision -tuen ja rinnakkaisen .NET MAUI Blazor Hybrid -työpöytä/mobiiliklientin.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG-chat-sovellus (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kuvaus**: Java-versio RAG-chat-näytteestä, joka käyttää Langchain4J:ta tekoälyn orkestrointiin. Tukee mikropalveluarkkitehtuuria tapahtumapohjaisesti, useita hakustrategioita (teksti, vektori, hybridi), asiakirjojen latausta Azure Document Intelligencen avulla ja käyttöönottoa joko Azure Container Appsissa tai Azure Kubernetes Servicessä.

**Nopea aloitus**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot Azure AI Foundrylla

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kuvaus**: End-to-end vähittäiskaupan RAG-copilot, joka käyttää Azure AI Foundrya ja Promptyä. Contoso Outdoor -myymälän chatbot, joka perustaa vastaukset tuoteluettelo- ja asiakastilaustietoihin. Demonstroi koko GenAIOps-työnkulun — prototyyppi Promptyllä, arviointi tekoälyavusteisilla arvioijilla ja käyttöönotto AZD:llä Container Appsiin.

**Nopea aloitus**:
```bash
azd init --template contoso-chat
azd up
```

### Luova kirjoittaminen — moniagenttisovellus

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Palvelut**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kuvaus**: Moniagenttinäyte, joka demonstroi agenttien orkestrointia Promptyn avulla. Käyttää tutkimusagenttia (Bing Grounding Azure AI Agent Servicessä), tuoteagenttia (Azure AI Search), kirjoittaja-agenttia ja toimittaja-agenttia tuottamaan yhdessä hyvin tutkittuja artikkeleita. Sisältää CI/CD:n ja arvioinnin GitHub Actionsissa.

**Nopea aloitus**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Palvelut**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kuvaus**: Täysin serverless RAG-chatbot, joka käyttää LangChain.js:ää, Azure Functionsia API:na ja Azure Static Web Appsia isännöintiin. Käyttää Azure Cosmos DB:tä sekä vektoritietovarastona että chat-historian tietokantana. Tukee paikallista kehitystä Ollaman avulla nollakustannustestaukseen.

**Nopea aloitus**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Palvelut**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kuvaus**: Yritystason RAG-ratkaisukiihdytin, jossa on hallintapaneeli asiakirjojen latausta/hallintaa varten, useita orkestrointivaihtoehtoja (Semantic Kernel, LangChain, Prompt Flow), puheentunnistus, Microsoft Teams -integraatio ja valinta PostgreSQL- tai Cosmos DB -taustajärjestelmäksi. Suunniteltu mukautettavaksi lähtökohdaksi tuotantovalmiisiin RAG-skenaarioihin.

**Nopea aloitus**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — moniagenttinen MCP-orkestrointi

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Palvelut**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Kuvaus**: Viitesovellus moniagenttiseen tekoälyorkestrointiin, joka käyttää kolmea kehystä (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisältää MCP (Model Context Protocol) -palvelimia neljällä kielellä, jotka on otettu käyttöön serverless Azure Container Apps -palveluina OpenTelemetry-seurannalla.

**Nopea aloitus**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositorio**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Palvelut**: Azure AI Services + Azure OpenAI

**Kuvaus**: Kevyt Bicep-malli, joka ottaa käyttöön Azure AI -palvelut konfiguroiduilla koneoppimismalleilla. Hyödyllinen lähtöpiste, kun tarvitset vain Azure AI -infrastruktuurin ilman täydellistä sovelluspinoa.

**Nopea aloitus**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Selaa lisää malleja**: Käy [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) -sivustolla, josta löydät yli 80 AI-spesifistä AZD-mallia eri kielillä ja skenaarioissa.

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita esirakennetulla mallilla, joka vastaa käyttötapaustasi
2. **Muokkaa tarpeidesi mukaan**: Muuta infrastruktuuria ja sovelluskoodia
3. **Lisää valvonta**: Toteuta kattava havaittavuus
4. **Optimoi kustannuksia**: Hienosäädä asetuksia budjetillesi sopiviksi
5. **Suojaa käyttöönotto**: Ota käyttöön yritystason turvallisuusmallit
6. **Skaalaa tuotantoon**: Lisää monialue- ja korkean käytettävyyden ominaisuudet

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Ota käyttöön Microsoft Foundry Models -chat-sovellus (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tuotantovalmiiksi soveltuva AI-chat-sovellus

```bash
# Alusta malli
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Aseta ympäristömuuttujat
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Ota käyttöön
azd up

# Testaa sovellusta
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Valvo tekoälytoimintoja
azd monitor

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Käyttöönotto valmistuu ilman kiintiövirheitä
- [ ] Pääsee käsiksi chat-käyttöliittymään selaimessa
- [ ] Voi esittää kysymyksiä ja saada tekoälyllä tuotettuja vastauksia
- [ ] Application Insights näyttää telemetriatiedot
- [ ] Resurssit on onnistuneesti siivottu

**Arvioitu kustannus**: $5-10 noin 30 minuutin testauksesta

### Harjoitus 2: Konfiguroi monimallinen käyttöönotto (45 minuuttia)
**Tavoite**: Ota käyttöön useita AI-malleja eri asetuksilla

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
- [ ] Eri kapasiteettiasetukset käytössä
- [ ] Mallit saatavilla API:n kautta
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
- [ ] Pystyy tarkastelemaan kustannustietoja Azure Portalissa
- [ ] Budjetinkynnykset asetettu asianmukaisesti

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Miten voin vähentää Microsoft Foundry Models -kustannuksia kehitysvaiheessa?</strong></summary>

1. **Käytä ilmaista tasoa**: Microsoft Foundry Models tarjoaa 50,000 tokenia/kuukausi ilmaiseksi
2. **Vähennä kapasiteettia**: Aseta kapasiteetti 10 TPM:ään kehitystä varten sen sijaan, että käytät 30+:a
3. **Käytä azd down**: Vapauta resurssit, kun et aktiivisesti kehitä
4. **Välimuistita vastaukset**: Ota Redis-välimuisti käyttöön toistuvia kyselyjä varten
5. **Käytä prompt-engineeringia**: Vähennä tokenien käyttöä tehokkailla kehotteilla


```bash
# Kehitysasetukset
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mikä on ero Microsoft Foundry Modelsin ja OpenAI API:n välillä?</strong></summary>

**Microsoft Foundry Models**:
- Yritystason tietoturva ja vaatimustenmukaisuus
- Yksityisen verkon integrointi
- SLA-takuut
- Hallitun identiteetin todentaminen
- Korkeammat käyttökiintiöt saatavilla

**OpenAI API**:
- Nopeampi pääsy uusiin malleihin
- Yksinkertaisempi käyttöönotto
- Matalampi kynnys aloittaa
- Vain julkinen internet

Tuotantosovelluksiin suositellaan **Microsoft Foundry Modelsia**.
</details>

<details>
<summary><strong>Miten käsittelen Microsoft Foundry Modelsin kiintiön ylityksiä?</strong></summary>

```bash
# Tarkista nykyinen kiintiö
az cognitiveservices usage list --location eastus2

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia väliaikaisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Pyydä kiintiön korotusta
# Siirry Azure-portaaliin > Kiintiöt > Pyydä korotusta
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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>Miten suojaan AI-mallien päätepisteet?</strong></summary>

**Parhaat käytännöt**:
1. Käytä Managed Identityä (ei API-avaimia)
2. Ota käyttöön yksityiset päätepisteet
3. Määritä verkon suojausryhmät
4. Ota käyttöön pyyntörajoitukset
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
- **AZD GitHub**: [Issues ja keskustelut](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry -taito palvelussa skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Asenna Azure- ja Foundry-agenttien taidot editoriisi komennolla `npx skills add microsoft/github-copilot-for-azure`

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-keskeinen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisön keskusteluihin tai avaa issue repositorioon. Azure AI + AZD -yhteisö on täällä auttamassa sinua menestymään!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
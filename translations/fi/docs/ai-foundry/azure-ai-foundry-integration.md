<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:44:20+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "fi"
}
-->
# Azure AI Foundry -integraatio AZD:n kanssa

**Edellinen:** [Ensimmäinen projekti](../getting-started/first-project.md) | **Seuraava:** [AI-mallin käyttöönotto](ai-model-deployment.md)

## Yleiskatsaus

Tämä opas näyttää, kuinka Azure AI Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa AI-sovellusten käyttöönoton tehostamiseksi. Azure AI Foundry tarjoaa kattavan alustan AI-sovellusten rakentamiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuurin ja käyttöönoton prosessia.

## Mikä on Azure AI Foundry?

Azure AI Foundry on Microsoftin yhtenäinen alusta AI-kehitykseen, joka sisältää:

- **Mallikatalogi**: Pääsy huipputason AI-malleihin
- **Prompt Flow**: Visuaalinen suunnittelutyökalu AI-työnkuluille
- **AI Foundry -portaali**: Integroitu kehitysympäristö AI-sovelluksille
- **Käyttöönottovaihtoehdot**: Useita isännöinti- ja skaalausvaihtoehtoja
- **Turvallisuus ja tietosuoja**: Sisäänrakennetut vastuullisen AI:n ominaisuudet

## AZD + Azure AI Foundry: Parempi yhdessä

| Ominaisuus | Azure AI Foundry | AZD-integraation etu |
|------------|------------------|----------------------|
| **Mallin käyttöönotto** | Manuaalinen portaali | Automatisoidut, toistettavat käyttöönotot |
| **Infrastruktuuri** | Klikkaamalla tehtävä provisiointi | Infrastructure as Code (Bicep) |
| **Ympäristön hallinta** | Yhden ympäristön painotus | Moniympäristö (kehitys/testaus/tuotanto) |
| **CI/CD-integraatio** | Rajoitettu | Luontainen GitHub Actions -tuki |
| **Kustannusten hallinta** | Perusseuranta | Ympäristökohtainen kustannusoptimointi |

## Esivaatimukset

- Azure-tilaus, jossa on asianmukaiset käyttöoikeudet
- Azure Developer CLI asennettuna
- Pääsy Azure OpenAI -palveluihin
- Perustiedot Azure AI Foundrysta

## Keskeiset integraatiomallit

### Malli 1: Azure OpenAI -integraatio

**Käyttötapaus**: Chat-sovellusten käyttöönotto Azure OpenAI -malleilla

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
// Azure OpenAI Account
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

**Käyttötapaus**: Retrieval-augmented generation (RAG) -sovellusten käyttöönotto

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

### Malli 3: Dokumenttianalyysin integraatio

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

**Tuotantokonfiguraatio:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

### Turvallinen konfiguraatio Key Vaultilla

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

### Käyttöönotto yhdellä komennolla

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
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

## Seuranta ja näkyvyys

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

## 🔐 Tietoturvan parhaat käytännöt

### Hallittu identiteettikonfiguraatio

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

### Verkkoturvallisuus

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

### Automaattisen skaalaamisen konfiguraatio

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

### Ongelma 1: OpenAI-kiintiö ylittynyt

**Oireet:**
- Käyttöönotto epäonnistuu kiintiövirheiden vuoksi
- 429-virheet sovelluslokissa

**Ratkaisut:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Ongelma 2: Todennusvirheet

**Oireet:**
- 401/403-virheet AI-palveluja kutsuttaessa
- "Pääsy estetty" -viestit

**Ratkaisut:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Ongelma 3: Mallin käyttöönotto-ongelmat

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

### Perus chat-sovellus

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Cognitive Search + App Service

**Pika-aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumenttien käsittelyputki

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Palvelut**: Document Intelligence + Storage + Functions

**Pika-aloitus**:
```bash
azd init --template ai-document-processing
azd up
```

### Yrityschat RAG:lla

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Pika-aloitus**:
```bash
azd init --template contoso-chat
azd up
```

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita valmiista mallista, joka vastaa käyttötapaustasi
2. **Mukauta tarpeisiisi**: Muokkaa infrastruktuuria ja sovelluskoodia
3. **Lisää seuranta**: Toteuta kattava näkyvyys
4. **Optimoi kustannukset**: Hienosäädä konfiguraatiot budjetillesi
5. **Turvaa käyttöönotto**: Toteuta yritystason tietoturvamallit
6. **Skaalaa tuotantoon**: Lisää monialue- ja korkean käytettävyyden ominaisuuksia

## Yhteisö ja tuki

- **Azure AI Foundry Discord**: [#Azure-kanava](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Ongelmat ja keskustelut](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

---

**Edellinen:** [Ensimmäinen projekti](../getting-started/first-project.md) | **Seuraava:** [AI-mallin käyttöönotto](ai-model-deployment.md)

**Tarvitsetko apua?** Liity yhteisökeskusteluihin tai avaa ongelma repositoryssä. Azure AI + AZD -yhteisö on täällä auttamassa sinua onnistumaan!

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
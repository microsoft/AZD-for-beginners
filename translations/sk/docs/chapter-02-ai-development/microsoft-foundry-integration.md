# Integrácia Microsoft Foundry s AZD

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad

Tento návod ukazuje, ako integrovať služby Microsoft Foundry s Azure Developer CLI (AZD) pre zjednodušené nasadzovanie AI aplikácií. Microsoft Foundry poskytuje komplexnú platformu na tvorbu, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje infraštruktúru a proces nasadenia.

## Čo je Microsoft Foundry?

Microsoft Foundry je jednotná platforma Microsoftu pre vývoj AI, ktorá zahŕňa:

- **Katalóg modelov**: Prístup k najmodernejším AI modelom
- **Prompt Flow**: Vizuálny návrhár AI pracovných tokov
- **Microsoft Foundry Portal**: Integrované vývojové prostredie pre AI aplikácie
- **Možnosti nasadenia**: Rôzne možnosti hostovania a škálovania
- **Bezpečnosť a ochrana**: Zabudované funkcie zodpovedného AI

## AZD + Microsoft Foundry: Lepšie spolu

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Nasadenie modelu** | Manuálne nasadenie cez portál | Automatizované, opakovateľné nasadenia |
| **Infraštruktúra** | Nasadenie cez kliknutie | Infraštruktúra ako kód (Bicep) |
| **Správa prostredí** | Zameranie na jediné prostredie | Viacero prostredí (dev/staging/prod) |
| **Integrácia CI/CD** | Obmedzená | Nativná podpora GitHub Actions |
| **Správa nákladov** | Základné monitorovanie | Optimalizácia nákladov podľa prostredia |

## Predpoklady

- Predplatné Azure s príslušnými oprávneniami
- Nainštalovaný Azure Developer CLI
- Prístup k službám Microsoft Foundry Models
- Základná znalosť Microsoft Foundry

## Základné integračné vzory

### Vzor 1: Integrácia Microsoft Foundry Models

**Použitie**: Nasadiť chatovacie aplikácie s modelmi Microsoft Foundry Models

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

**Infraštruktúra (main.bicep):**
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

### Vzor 2: AI Search + RAG integrácia

**Použitie**: Nasadiť aplikácie retrieval-augmented generation (RAG)

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

### Vzor 3: Integrácia Document Intelligence

**Použitie**: Pracovné postupy spracovania a analýzy dokumentov

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

## 🔧 Konfiguračné vzory

### Nastavenie premenných prostredia

**Konfigurácia pre produkciu:**
```bash
# Základné AI služby
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurácie modelu
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavenia výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurácia pre vývoj:**
```bash
# Nákladovo optimalizované nastavenia pre vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatný plán
```

### Bezpečná konfigurácia s Key Vault

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

## Postupy nasadenia

### Rozšírenia AZD pre Foundry

AZD poskytuje rozšírenia, ktoré pridávajú AI-špecifické funkcie pre prácu so službami Microsoft Foundry:

```bash
# Nainštalovať rozšírenie Foundry agents
azd extension install azure.ai.agents

# Nainštalovať rozšírenie pre jemné doladenie
azd extension install azure.ai.finetune

# Nainštalovať rozšírenie pre vlastné modely
azd extension install azure.ai.models

# Zobraziť nainštalované rozšírenia
azd extension list
```

### Nasadenie orientované na agenta s `azd ai`

Ak máte manifest agenta, použite `azd ai agent init` na vytvorenie projektu prepojeného so službou Foundry Agent Service:

```bash
# Inicializovať z manifestu agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nasadiť do Azure
azd up
```

Pozrite si [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre úplný zoznam príkazov a prepínačov.

### Nasadenie jedným príkazom

```bash
# Nasadiť všetko jedným príkazom
azd up

# Alebo nasadiť postupne
azd provision  # Iba infraštruktúra
azd deploy     # Iba aplikácia
```

### Nasadenia špecifické pre prostredie

```bash
# Vývojové prostredie
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkčné prostredie
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorovanie a pozorovateľnosť

### Integrácia s Application Insights

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

### Monitorovanie nákladov

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

## 🔐 Najlepšie bezpečnostné postupy

### Konfigurácia Managed Identity

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

### Sieťová bezpečnosť

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

## Optimalizácia výkonu

### Stratégie kešovania

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

### Konfigurácia automatického škálovania

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

## Riešenie bežných problémov

### Problém 1: Kvóta OpenAI prekročená

**Príznaky:**
- Nasadenie zlyhá kvôli chybám kvóty
- Chyby 429 v logoch aplikácie

**Riešenia:**
```bash
# Skontrolujte aktuálne využitie kvóty
az cognitiveservices usage list --location eastus

# Vyskúšajte iný región
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problém 2: Chyby overovania

**Príznaky:**
- Chyby 401/403 pri volaniach AI služieb
- Hlásenia "Prístup zamietnutý"

**Riešenia:**
```bash
# Overte priradenia rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Skontrolujte konfiguráciu spravovanej identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Overte prístup k službe Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasadením modelu

**Príznaky:**
- Modely nie sú v nasadení dostupné
- Konkrétne verzie modelov zlyhávajú

**Riešenia:**
```bash
# Zoznam dostupných modelov podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizovať verziu modelu v Bicep šablóne
# Skontrolovať požiadavky na kapacitu modelu
```

## Príkladové šablóny

### RAG chat aplikácia (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Najobľúbenejší príklad Azure AI — produkčne pripravená RAG chat aplikácia, ktorá vám umožní klásť otázky nad vašimi dokumentmi. Používa GPT-4.1-mini pre chat, text-embedding-ada-002 pre embedovanie a Azure AI Search pre vyhľadávanie. Podporuje multimodálne dokumenty, hlasový vstup/výstup, overovanie Microsoft Entra a trasovanie v Application Insights.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG chat aplikácia (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# ekvivalent Python RAG chat príkladu. Postavené s ASP.NET Core Minimal API a Blazor WebAssembly frontendom. Zahŕňa hlasový chat, podporu GPT-4o-mini vision a sprievodnú .NET MAUI Blazor Hybrid desktop/mobilnú aplikáciu.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG chat aplikácia (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verzia RAG chat príkladu používajúca Langchain4J pre AI orchestráciu. Podporuje mikroservisnú event-driven architektúru, viaceré stratégie vyhľadávania (text, vektor, hybrid), nahrávanie dokumentov s Azure Document Intelligence a nasadenie na Azure Container Apps alebo Azure Kubernetes Service.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot s Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: End-to-end retail RAG copilot používajúci Azure AI Foundry a Prompty. Chatbot pre Contoso Outdoor, ktorý zakladá odpovede na katalógu produktov a údajoch o objednávkach zákazníkov. Demonštruje celý GenAIOps pracovný tok — prototypovanie s Prompty, hodnotenie s AI-asistovanými evaluátormi a nasadenie cez AZD do Container Apps.

**Rýchly štart**:
```bash
azd init --template contoso-chat
azd up
```

### Multi-agent aplikácia na kreatívne písanie

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Multi-agent príklad demonštrujúci orchestráciu AI agentov s Prompty. Používa research agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), agentov pre písanie a editovanie na spoločnú tvorbu dobre preskúmaných článkov. Zahrňuje CI/CD s hodnotením v GitHub Actions.

**Rýchly štart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Popis**: Plne serverless RAG chatbot využívajúci LangChain.js s Azure Functions pre API a Azure Static Web Apps pre hosting. Používa Azure Cosmos DB ako vector store aj databázu histórie chatu. Podporuje lokálny vývoj s Ollama pre testovanie bez nákladov.

**Rýchly štart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Popis**: Enterprise-grade RAG solution accelerator s administrátorským portálom na nahrávanie/správu dokumentov, viacerými orchestrátormi (Semantic Kernel, LangChain, Prompt Flow), prevod reči na text, integráciou Microsoft Teams a možnosťou backendu v PostgreSQL alebo Cosmos DB. Navrhnuté ako prispôsobiteľný východiskový bod pre produkčné RAG scenáre.

**Rýchly štart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Popis**: Referenčná aplikácia pre multi-agent orchestráciu AI využívajúca tri frameworky (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Obsahuje MCP (Model Context Protocol) servery v štyroch jazykoch nasadené ako serverless Azure Container Apps s monitorovaním OpenTelemetry.

**Rýchly štart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Služby**: Azure AI Services + Azure OpenAI

**Popis**: Minimálna Bicep šablóna, ktorá nasadí Azure AI služby s nakonfigurovanými strojovými modelmi. Ľahký východiskový bod, keď potrebujete iba provisionovať infraštruktúru Azure AI bez celého aplikačného stacku.

**Rýchly štart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Prezrite si viac šablón**: Navštívte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pre viac ako 80 AI-špecifických AZD šablón v rôznych jazykoch a scenároch.

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite s predpripravenou šablónou, ktorá zodpovedá vášmu prípadu použitia
2. **Prispôsobte podľa potrieb**: Upraviť infraštruktúru a aplikačný kód
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Doladte konfigurácie podľa rozpočtu
5. **Zaistite nasadenie**: Implementujte podnikové bezpečnostné vzory
6. **Škálujte do produkcie**: Pridajte multi-regionálne a vysokodostupnostné funkcie

## 🎯 Praktické cvičenia

### Cvičenie 1: Nasadiť chat aplikáciu Microsoft Foundry Models (30 min)
**Cieľ**: Nasadiť a otestovať produkčne pripravenú AI chat aplikáciu

```bash
# Inicializovať šablónu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastaviť premenné prostredia
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Nasadiť
azd up

# Otestovať aplikáciu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorovať operácie AI
azd monitor

# Vyčistiť
azd down --force --purge
```

**Kritériá úspechu:**
- [ ] Nasadenie sa dokončí bez chýb kvóty
- [ ] Je možné pristúpiť k rozhraniu chatu v prehliadači
- [ ] Môžete klásť otázky a dostávať odpovede podporené AI
- [ ] Application Insights zobrazuje telemetrické údaje
- [ ] Úspešné vyčistenie zdrojov

**Odhadované náklady**: $5-10 za 30 min testovania

### Cvičenie 2: Nastaviť nasadenie viacerých modelov (45 min)
**Cieľ**: Nasadiť viacero AI modelov s rôznymi konfiguráciami

```bash
# Vytvoriť vlastnú konfiguráciu Bicep
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

# Nasadiť a overiť
azd provision
azd show
```

**Kritériá úspechu:**
- [ ] Viacero modelov nasadených úspešne
- [ ] Použité rôzne nastavenia kapacity
- [ ] Modely prístupné cez API
- [ ] Aplikácia môže volať oba modely

### Cvičenie 3: Implementovať monitorovanie nákladov (20 min)
**Cieľ**: Nastaviť upozornenia rozpočtu a sledovanie nákladov

```bash
# Pridať upozornenie o rozpočte do Bicep
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

# Nasadiť upozornenie o rozpočte
azd provision

# Skontrolovať aktuálne náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritériá úspechu:**
- [ ] V Azure vytvorené upozornenie rozpočtu
- [ ] Nastavené e-mailové notifikácie
- [ ] Možnosť zobraziť údaje o nákladoch v Azure Portáli
- [ ] Práh rozpočtu nastavený primerane

## 💡 Často kladené otázky

<details>
<summary><strong>Ako znížiť náklady Microsoft Foundry Models počas vývoja?</strong></summary>

1. **Použite bezplatnú úroveň**: Microsoft Foundry Models ponúka 50 000 tokenov/mesiac zadarmo
2. **Znížte kapacitu**: Nastavte kapacitu na 10 TPM namiesto 30+ pre vývoj
3. **Použite azd down**: Dealokujte zdroje, keď aktívne nevyvíjate
4. **Kešovanie odpovedí**: Implementujte Redis cache pre opakované dotazy
5. **Prompt engineering**: Znížte spotrebu tokenov efektívnymi promptami

```bash
# Konfigurácia pre vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Aký je rozdiel medzi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnosť a súlad
- Integrácia súkromnej siete
- Záruky SLA
- Overovanie pomocou Managed Identity
- Vyššie dostupné kvóty

**OpenAI API**:
- Rýchlejší prístup k novým modelom
- Jednoduchšie nastavenie
- Nižšia vstupná bariéra
- Iba verejný internet

Pre produkčné aplikácie sa odporúča **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Ako mám riešiť chyby prekročenia kvóty modelov Microsoft Foundry?</strong></summary>

```bash
# Skontrolujte aktuálnu kvótu
az cognitiveservices usage list --location eastus2

# Skúste iný región
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požiadajte o zvýšenie kvóty
# Prejdite do Azure portálu > Kvóty > Požiadať o zvýšenie
```
</details>

<details>
<summary><strong>Môžem použiť svoje vlastné dáta s modelmi Microsoft Foundry?</strong></summary>

Áno! Použite **Azure AI Search** pre RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Pozrite si šablónu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Ako zabezpečiť koncové body AI modelov?</strong></summary>

**Najlepšie postupy**:
1. Použite Managed Identity (bez API kľúčov)
2. Povoľte Private Endpoints
3. Nakonfigurujte sieťové bezpečnostné skupiny
4. Implementujte obmedzovanie rýchlosti
5. Použite Azure Key Vault na ukladanie tajomstiev

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

## Komunita a podpora

- **Microsoft Foundry Discord**: [#kanál Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskusie](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiálna dokumentácia](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Nainštalujte Azure + Foundry agent skills vo vašom editore pomocou `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa k diskusiám komunity alebo otvorte issue v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, majte prosím na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku treba považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
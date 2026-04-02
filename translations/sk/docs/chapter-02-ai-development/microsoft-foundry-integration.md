# Integrácia Microsoft Foundry s AZD

**Navigácia v kapitole:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s prioritou AI
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad

Táto príručka demonštruje, ako integrovať služby Microsoft Foundry s Azure Developer CLI (AZD) pre zjednodušené nasadzovanie AI aplikácií. Microsoft Foundry poskytuje komplexnú platformu pre vývoj, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje infraštruktúru a proces nasadzovania.

## Čo je Microsoft Foundry?

Microsoft Foundry je jednotná platforma Microsoftu pre vývoj AI, ktorá zahŕňa:

- **Katalóg modelov**: Prístup k špičkovým AI modelom
- **Prompt Flow**: Vizualizér pracovných tokov AI
- **Microsoft Foundry Portal**: Integrované vývojové prostredie pre AI aplikácie
- **Možnosti nasadenia**: Viaceré možnosti hostovania a škálovania
- **Bezpečnosť a zodpovednosť**: Vstavané funkcie zodpovednej AI

## AZD + Microsoft Foundry: Lepšie spolu

| Funkcia | Microsoft Foundry | Výhoda integrácie s AZD |
|---------|-----------------|------------------------|
| **Nasadenie modelu** | Ručné nasadenie cez portál | Automatizované, opakovateľné nasadenia |
| **Infraštruktúra** | Provisioning cez kliknutie | Infraštuktúra ako kód (Bicep) |
| **Správa prostredí** | Zameranie na jedno prostredie | Viacero prostredí (dev/staging/prod) |
| **Integrácia CI/CD** | Obmedzená | Nativná podpora GitHub Actions |
| **Správa nákladov** | Základné monitorovanie | Optimalizácia nákladov podľa prostredia |

## Požiadavky

- Azure predplatné s vhodnými oprávneniami
- Nainštalovaný Azure Developer CLI
- Prístup k službám Microsoft Foundry Models
- Základná znalosť Microsoft Foundry

> **Aktuálna verzia AZD:** Tieto príklady boli testované s verziou `azd` `1.23.12`. Pre pracovný tok AI agenta používajte aktuálne preview rozšírenie a pred začiatkom skontrolujte verziu rozšírenia.

## Základné vzory integrácie

### Vzor 1: Integrácia Microsoft Foundry Models

**Použitie**: Nasadzovanie chatovacích aplikácií s modelmi Microsoft Foundry Models

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

### Vzor 2: AI vyhľadávanie + integrácia RAG

**Použitie**: Nasadenie aplikácií s retrieval-augmented generation (RAG)

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

### Vzor 3: Integrácia spracovania dokumentov

**Použitie**: Spracovanie a analýza dokumentov

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

**Konfigurácia produkcie:**
```bash
# Základné AI služby
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurácie modelu
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Nastavenia výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurácia vývoja:**
```bash
# Nákladovo optimalizované nastavenia pre vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatná úroveň
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

## Pracovné toky nasadenia

### Rozšírenia AZD pre Foundry

AZD ponúka rozšírenia, ktoré pridávajú AI špecifické schopnosti na prácu so službami Microsoft Foundry:

```bash
# Nainštalujte rozšírenie Foundry agents
azd extension install azure.ai.agents

# Nainštalujte rozšírenie na doladenie
azd extension install azure.ai.finetune

# Nainštalujte rozšírenie vlastných modelov
azd extension install azure.ai.models

# Zoznam nainštalovaných rozšírení
azd extension list --installed

# Skontrolujte aktuálne nainštalovanú verziu rozšírenia agenta
azd extension show azure.ai.agents
```

AI rozšírenia sa stále rýchlo vyvíjajú vo verzii preview. Ak sa príkaz správa inak ako tu uvedené, aktualizujte príslušné rozšírenie pred odstraňovaním problémov v samotnom projekte.

### Nasadenie zamerané na agenta s `azd ai`

Ak máte manifest agenta, použite `azd ai agent init` na vytvorenie projektu prepojeného na službu Foundry Agent:

```bash
# Inicializovať z manifestu agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nasadiť do Azure
azd up
```

Nedávne preview vydania `azure.ai.agents` pridali podporu pre inicializáciu založenú na šablónach pre `azd ai agent init`. Ak sledujete novšie príklady agentov, skontrolujte pomoc rozšírenia pre presné dostupné príznaky vo vašej verzii.

Viac info nájdete v [AZD AI CLI príkazoch](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Nasadenie jedným príkazom

```bash
# Nasadte všetko jedným príkazom
azd up

# Alebo nasadzujte postupne
azd provision  # Iba infraštruktúra
azd deploy     # Iba aplikácia

# Pre dlhodobo bežiace nasadenia AI aplikácií v azd 1.23.11+
azd deploy --timeout 1800
```

### Nasadenia podľa prostredia

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

### Integrácia Application Insights

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

## 🔐 Najlepšie bezpečnostné praktiky

### Konfigurácia spravovanej identity

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

### Strategie caching-u

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

### Problém 1: Prekročenie kvóty OpenAI

**Príznaky:**
- Nasadenie zlyháva s chybami kvóty
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

### Problém 2: Zlyhanie autentifikácie

**Príznaky:**
- Chyby 401/403 pri volaní AI služieb
- Hlásenia „Prístup zamietnutý“

**Riešenia:**
```bash
# Overiť priradenia rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Skontrolovať konfiguráciu spravovanej identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Overiť prístup k Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasadením modelu

**Príznaky:**
- Modely nie sú dostupné pri nasadení
- Zlyhanie špecifických verzií modelov

**Riešenia:**
```bash
# Zoznam dostupných modelov podľa regiónu
az cognitiveservices model list --location eastus

# Aktualizujte verziu modelu v šablóne bicep
# Skontrolujte požiadavky na kapacitu modelu
```

## Ukážkové šablóny

### RAG Chat aplikácia (Python)

**Repozitár**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Najpopulárnejší Azure AI príklad — produkčne pripravená RAG chat aplikácia, ktorá umožňuje klásť otázky nad vlastnými dokumentmi. Používa GPT-4.1-mini pre chat, text-embedding-3-large pre embeddingy a Azure AI Search pre získavanie informácií. Podporuje multimodálne dokumenty, hlasový vstup/výstup, autentifikáciu Microsoft Entra a trasovanie v Application Insights.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat aplikácia (.NET)

**Repozitár**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# ekvivalent Python príkladu RAG chatu. Postavené na ASP.NET Core Minimal API a Blazor WebAssembly frontende. Zahŕňa hlasový chat, podporu GPT-4o-mini vision a sprievodnú .NET MAUI Blazor Hybrid desktop/mobilnú klientsku aplikáciu.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat aplikácia (Java)

**Repozitár**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verzia RAG chatu s použitím Langchain4J na orchestráciu AI. Podporuje mikroslužbovú event-driven architektúru, viaceré vyhľadávacie stratégie (text, vektor, hybrid), nahrávanie dokumentov s Azure Document Intelligence a nasadenie na Azure Container Apps alebo Azure Kubernetes Service.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Podnikový retail Copilot s Azure AI Foundry

**Repozitár**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: Kompletný retail RAG copilot s využitím Azure AI Foundry a Prompty. Chatbot pre predajcu Contoso Outdoor, ktorý zakladá odpovede na dátach z katalógu produktov a objednávok zákazníkov. Demonštruje kompletný GenAIOps pracovný tok — prototypovanie v Prompty, hodnotenie s pomocou AI evaluátorov a nasadenie cez AZD do Container Apps.

**Rýchly štart**:
```bash
azd init --template contoso-chat
azd up
```

### Kreatívna multi-agent aplikácia na písanie

**Repozitár**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Príklad multi-agentovej aplikácie ukazujúci orchestráciu AI agentov s Prompty. Používa výskumníckeho agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), spisovateľa a editora na kolektívnu tvorbu dobre preskúmaných článkov. Zahŕňa CI/CD s hodnotením v GitHub Actions.

**Rýchly štart**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitár**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pre NoSQL + LangChain.js

**Popis**: Plne serverless RAG chatbot využívajúci LangChain.js s Azure Functions pre API a Azure Static Web Apps pre hosting. Používa Azure Cosmos DB ako vektorový obchod aj databázu histórie chatu. Podporuje lokálny vývoj s Ollama na testovanie bez nákladov.

**Rýchly štart**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat s vašimi dátami - Solution Accelerator

**Repozitár**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Popis**: Podnikový RAG solution accelerator s administračným portálom na nahrávanie/správu dokumentov, viacerými možnosťami orchestrácie (Semantic Kernel, LangChain, Prompt Flow), prevodom reči na text, integráciou Microsoft Teams a možnosťou voľby PostgreSQL alebo Cosmos DB ako backendu. Navrhnutý ako prispôsobiteľný štartovací bod pre produkčné nasadenia RAG.

**Rýchly štart**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI cestovné agentúry — multi-agent MCP orchestrácia

**Repozitár**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servery (.NET, Python, Java, TypeScript)

**Popis**: Referenčná aplikácia pre multi-agentnú orchestráciu AI pomocou troch frameworkov (LangChain.js, LlamaIndex.TS, a Microsoft Agent Framework). Obsahuje MCP (Model Context Protocol) servery v štyroch jazykoch, nasadené ako serverless Azure Container Apps s monitorovaním OpenTelemetry.

**Rýchly štart**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repozitár**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Služby**: Azure AI služby + Azure OpenAI

**Popis**: Minimálna Bicep šablóna na nasadenie Azure AI služieb s nakonfigurovanými ML modelmi. Ľahký štartovací bod, keď potrebujete iba infraštruktúru Azure AI bez kompletného aplikačného stacku.

**Rýchly štart**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Prehliadnite si viac šablón**: Navštívte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pre 80+ AI-špecifických AZD šablón naprieč jazykmi a scenármi.

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite s predpripravenou šablónou, ktorá zodpovedá vášmu prípadu použitia
2. **Prispôsobte podľa potrieb**: Upravte infraštruktúru a aplikačný kód
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Vyladte konfigurácie podľa svojho rozpočtu
5. **Zabezpečte nasadenie**: Použite podnikové bezpečnostné vzory
6. **Škálujte do produkcie**: Pridajte viacregionálne a vysokodostupnostné funkcie

## 🎯 Praktické cvičenia

### Cvičenie 1: Nasadenie chatovacej aplikácie Microsoft Foundry Models (30 minút)
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
- [ ] Nasadenie prebehlo bez chýb kvóty
- [ ] Prístup k chat rozhraniu v prehliadači
- [ ] Možnosť klásť otázky a prijímať odpovede s AI podporou
- [ ] Application Insights zobrazuje telemetrické údaje
- [ ] Úspešné vyčistenie zdrojov po teste

**Odhadované náklady**: 5-10 $ za 30 minút testovania

### Cvičenie 2: Konfigurácia nasadenia viacerých modelov (45 minút)
**Cieľ**: Nasadiť viacero AI modelov s rozdielnymi konfiguráciami

```bash
# Vytvorte vlastnú konfiguráciu Bicep
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

# Nasadiť a overiť
azd provision
azd show
```

**Kritériá úspechu:**
- [ ] Viaceré modely úspešne nasadené
- [ ] Použité rôzne kapacitné nastavenia
- [ ] Modely prístupné cez API
- [ ] Možnosť volať oba modely z aplikácie

### Cvičenie 3: Implementácia monitorovania nákladov (20 minút)
**Cieľ**: Nastaviť upozornenia rozpočtu a sledovanie nákladov

```bash
# Pridať upozornenie na rozpočet do Bicep
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

# Nasadiť upozornenie na rozpočet
azd provision

# Skontrolovať aktuálne náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritériá úspechu:**
- [ ] V Azure vytvorené upozornenie na rozpočet
- [ ] Konfigurované e-mailové notifikácie
- [ ] Zobrazenie údajov o nákladoch v Azure portáli
- [ ] Nastavené primerané prahové hodnoty rozpočtu

## 💡 Často kladené otázky

<details>
<summary><strong>Ako môžem znížiť náklady Microsoft Foundry Models počas vývoja?</strong></summary>

1. **Použite bezplatnú úroveň**: Microsoft Foundry Models ponúka 50 000 tokenov mesačne zadarmo
2. **Znížte kapacitu**: Nastavte kapacitu na 10 TPM namiesto 30+ pre vývoj
3. **Používajte azd down**: Deaktivujte zdroje, keď aktívne nevyvíjate
4. **Ukladajte odpovede do cache**: Implementujte Redis cache pre opakované dotazy
5. **Použite prompt engineering**: Znížte spotrebu tokenov efektívnymi promptmi

</details>
```bash
# Konfigurácia vývoja
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Aký je rozdiel medzi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnosť a súlad
- Integrácia do súkromnej siete
- Záruky SLA
- Overovanie pomocou manažovanej identity
- K dispozícii vyššie limity

**OpenAI API**:
- Rýchlejší prístup k novým modelom
- Jednoduchšie nastavenie
- Nižšia vstupná bariéra
- Iba verejný internet

Pre produkčné aplikácie je **odporúčané použiť Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Ako riešiť chyby prekročenia kvóty v Microsoft Foundry Models?</strong></summary>

```bash
# Skontrolujte aktuálny limit
az cognitiveservices usage list --location eastus2

# Skúste inú oblasť
azd env set AZURE_LOCATION westus2
azd up

# Dočasne znížte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požiadajte o zvýšenie limitu
# Prejdite do Azure Portálu > Limity > Požiadať o zvýšenie
```
</details>

<details>
<summary><strong>Môžem použiť svoje vlastné dáta s Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Ako zabezpečiť prístupy k AI modelom?</strong></summary>

**Najlepšie postupy**:
1. Používajte Manažovanú Identitu (bez API kľúčov)
2. Aktivujte Súkromné Endpointy
3. Nakonfigurujte bezpečnostné skupiny siete
4. Implementujte obmedzovanie rýchlosti (rate limiting)
5. Používajte Azure Key Vault pre tajomstvá

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

## Komunita a Podpora

- **Microsoft Foundry Discord**: [#Azure kanál](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskusie](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiálna dokumentácia](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Nainštalujte si Azure + Foundry zručnosti agenta vo vašom editore pomocou `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia Kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s AI ako prvou prioritou
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nasledujúca**: [Nasadenie AI modelu](ai-model-deployment.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa k našim komunitným diskusiám alebo vytvorte issue v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie je odporúčaný profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
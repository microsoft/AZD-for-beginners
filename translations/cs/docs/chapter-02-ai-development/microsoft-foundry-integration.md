# Integrace Microsoft Foundry s AZD

**Navigace kapitolou:**
- **📚 Domů kurz**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled

Tento průvodce ukazuje, jak integrovat služby Microsoft Foundry s Azure Developer CLI (AZD) pro zjednodušené nasazování AI aplikací. Microsoft Foundry poskytuje komplexní platformu pro vytváření, nasazování a správu AI aplikací, zatímco AZD zjednodušuje infrastrukturu a proces nasazení.

## Co je Microsoft Foundry?

Microsoft Foundry je sjednocená platforma Microsoftu pro vývoj AI, která obsahuje:

- **Katalog modelů**: Přístup k nejmodernějším AI modelům
- **Prompt Flow**: Vizualní návrhář pracovních postupů AI
- **Portál Microsoft Foundry**: Integrované vývojové prostředí pro AI aplikace
- **Možnosti nasazení**: Více možností hostingu a škálování
- **Bezpečnost a ochrana**: Vestavěné funkce zodpovědné AI

## AZD + Microsoft Foundry: Společně lepší

| Funkce | Microsoft Foundry | Výhoda integrace s AZD |
|---------|-----------------|------------------------|
| **Nasazení modelu** | Ruční nasazení přes portál | Automatické, opakovatelné nasazení |
| **Infrastruktura** | Provisioning kliknutím | Infrastruktura jako kód (Bicep) |
| **Správa prostředí** | Zaměření na jedno prostředí | Více prostředí (vývoj/test/prod) |
| **Integrace CI/CD** | Omezená | Nativní podpora GitHub Actions |
| **Správa nákladů** | Základní monitorování | Optimalizace nákladů podle prostředí |

## Požadavky

- Azure předplatné s příslušnými oprávněními
- Nainstalovaný Azure Developer CLI
- Přístup ke službám Microsoft Foundry Models
- Základní znalost Microsoft Foundry

> **Aktuální základ AZD:** Tyto příklady byly testovány s verzí `azd` `1.23.12`. Pro pracovní postup AI agenta použijte aktuální preview rozšíření a před začátkem si zkontrolujte vaši nainstalovanou verzi.

## Hlavní integrační vzory

### Vzor 1: Integrace Microsoft Foundry Models

**Případ použití**: Nasazení chatovacích aplikací s modely Microsoft Foundry Models

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

**Infrastruktura (main.bicep):**
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

### Vzor 2: AI Vyhledávání + RAG integrace

**Případ použití**: Nasazení aplikací pro vyhledáváním rozšířenou generaci (RAG)

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

### Vzor 3: Integrace Document Intelligence

**Případ použití**: Workflow pro zpracování a analýzu dokumentů

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

## 🔧 Konfigurační vzory

### Nastavení proměnných prostředí

**Produkční konfigurace:**
```bash
# Jádrové AI služby
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurace modelu
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Nastavení výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Vývojová konfigurace:**
```bash
# Nákladově optimalizovaná nastavení pro vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatná úroveň
```

### Bezpečná konfigurace s Key Vault

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

## Pracovní postupy nasazení

### Rozšíření AZD pro Foundry

AZD poskytuje rozšíření, která přidávají AI-specifické schopnosti pro práci se službami Microsoft Foundry:

```bash
# Nainstalujte rozšíření agentů Foundry
azd extension install azure.ai.agents

# Nainstalujte rozšíření pro doladění
azd extension install azure.ai.finetune

# Nainstalujte rozšíření pro vlastní modely
azd extension install azure.ai.models

# Vypsat nainstalovaná rozšíření
azd extension list --installed

# Zkontrolujte aktuálně nainstalovanou verzi rozšíření agentů
azd extension show azure.ai.agents
```

AI rozšíření jsou stále ve fázi rychlého vývoje v preview. Pokud se nějaký příkaz chová jinak než zde uvedeno, upgradujte příslušné rozšíření před samotným řešením problému projektu.

### Nasazení orientované na agenta s `azd ai`

Pokud máte manifest agenta, použijte `azd ai agent init` pro vytvoření projektu propojeného se službou Foundry Agent Service:

```bash
# Inicializovat z manifestu agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nasadit do Azure
azd up
```

Nedávné preview verze `azure.ai.agents` také přidaly podporu šablon pro inicializaci `azd ai agent init`. Pokud sledujete novější ukázky agentů, podívejte se na nápovědu rozšíření pro přesné dostupné přepínače ve vaší verzi.

Další informace najdete v [AZD AI CLI příkazech](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Nasazení jedním příkazem

```bash
# Nasadit vše jedním příkazem
azd up

# Nebo nasadit postupně
azd provision  # Pouze infrastruktura
azd deploy     # Pouze aplikace

# Pro dlouhodobé nasazení AI aplikací v azd 1.23.11+
azd deploy --timeout 1800
```

### Nasazení specifická pro prostředí

```bash
# Vývojové prostředí
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkční prostředí
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorování a observabilita

### Integrace Application Insights

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

### Monitorování nákladů

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

## 🔐 Nejlepší bezpečnostní praktiky

### Konfigurace spravované identity

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

### Síťová bezpečnost

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

## Optimalizace výkonu

### Strategické využití cache

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

### Konfigurace automatického škálování

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

## Řešení běžných problémů

### Problém 1: Překročení kvóty OpenAI

**Příznaky:**
- Nasazení selhává s chybami kvóty
- Chybové kódy 429 v aplikačních záznamech

**Řešení:**
```bash
# Zkontrolujte aktuální využití kvóty
az cognitiveservices usage list --location eastus

# Vyzkoušejte jiný region
azd env set AZURE_LOCATION westus2
azd up

# Dočasně snížit kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problém 2: Selhání autentizace

**Příznaky:**
- Chyby 401/403 při volání AI služeb
- Zprávy „Přístup odepřen“

**Řešení:**
```bash
# Ověřit přiřazení rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Zkontrolovat konfiguraci spravované identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Ověřit přístup k Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasazením modelu

**Příznaky:**
- Modely nejsou dostupné v nasazení
- Některé verze modelů selhávají

**Řešení:**
```bash
# Vypsat dostupné modely podle regionu
az cognitiveservices model list --location eastus

# Aktualizovat verzi modelu v bicep šabloně
# Zkontrolovat požadavky na kapacitu modelu
```

## Ukázkové šablony

### RAG Chat aplikace (Python)

**Repozitář**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Nejoblíbenější vzor Azure AI — produkčně připravená RAG chat aplikace, která umožňuje pokládat otázky na vaše vlastní dokumenty. Používá GPT-4.1-mini pro chat, text-embedding-3-large pro vektory a Azure AI Search pro vyhledávání. Podporuje multimodální dokumenty, vstup/výstup řeči, autentizaci Microsoft Entra a sledování v Application Insights.

**Rychlý start:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat aplikace (.NET)

**Repozitář**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# ekvivalent Python vzoru RAG chat. Vybudován s ASP.NET Core Minimal API a Blazor WebAssembly frontendem. Obsahuje hlasový chat, podporu GPT-4o-mini vision a doprovodného .NET MAUI Blazor Hybrid klienta pro desktop/mobil.

**Rychlý start:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat aplikace (Java)

**Repozitář**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verze RAG chat vzoru využívající Langchain4J pro AI orchestraci. Podporuje mikroservisní event-driven architekturu, více strategii vyhledávání (text, vektor, hybrid), nahrávání dokumentů s Azure Document Intelligence a nasazení na Azure Container Apps nebo Azure Kubernetes Service.

**Rychlý start:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot s Azure AI Foundry

**Repozitář**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: Kompletní maloobchodní RAG copilot využívající Azure AI Foundry a Prompty. Chatbot Contoso Outdoor prodeje, který zakládá odpovědi na produktovém katalogu a objednávkových datech zákazníků. Ukazuje plný GenAIOps pracovní postup — prototypujte s Prompty, vyhodnocujte s AI asistovanými evaluátory a nasazujte přes AZD do Container Apps.

**Rychlý start:**
```bash
azd init --template contoso-chat
azd up
```

### Víceagentová aplikace kreativního psaní

**Repozitář**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Víceagentový vzor ukazující orchestrace AI agentů s Prompty. Používá výzkumného agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), spisovatelského agenta a editorského agenta, kteří společně tvoří dobře prozkoumané články. Zahrnuje CI/CD s vyhodnocováním v GitHub Actions.

**Rychlý start:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitář**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pro NoSQL + LangChain.js

**Popis**: Kompletně serverless RAG chatbot využívající LangChain.js s Azure Functions pro API a Azure Static Web Apps pro hosting. Používá Azure Cosmos DB jako vektorové úložiště i databázi historie chatu. Podporuje lokální vývoj s Ollama pro testování bez nákladů.

**Rychlý start:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat s vlastními daty – Solution Accelerator

**Repozitář**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Popis**: Podnikový RAG solution accelerator s administračním portálem pro nahrávání a správu dokumentů, více orchestrátory (Semantic Kernel, LangChain, Prompt Flow), převodem řeči na text, integrací Microsoft Teams a možností volby backendu PostgreSQL nebo Cosmos DB. Navržen jako přizpůsobitelný výchozí bod pro produkční RAG scénáře.

**Rychlý start:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI cestovní agenti — multi-agentní MCP orchestrace

**Repozitář**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP servery (.NET, Python, Java, TypeScript)

**Popis**: Referenční aplikace pro multi-agentní AI orchestraci používající tři frameworky (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Funkce MCP (Model Context Protocol) servery v čtyřech jazycích nasazené jako serverless Azure Container Apps s OpenTelemetry monitoringem.

**Rychlý start:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repozitář**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Služby**: Azure AI služby + Azure OpenAI

**Popis**: Minimalistická Bicep šablona, která nasazuje Azure AI služby s nakonfigurovanými modely strojového učení. Lehký výchozí bod, když potřebujete jen infrastrukturu Azure AI bez plného aplikačního stacku.

**Rychlý start:**
```bash
azd init --template azd-ai-starter
azd up
```

> **Prohlédněte si více šablon**: Navštivte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) s více než 80 AI-specifickými šablonami AZD pro různé jazyky a scénáře.

## Další kroky

1. **Vyzkoušejte příklady**: Začněte s předpřipravenou šablonou odpovídající vašemu případu použití
2. **Přizpůsobte svým potřebám**: Upravte infrastrukturu a aplikační kód
3. **Přidejte monitorování**: Implementujte komplexní observabilitu
4. **Optimalizujte náklady**: Vyladěte konfigurace dle rozpočtu
5. **Zabezpečte nasazení**: Implementujte podnikové bezpečnostní vzory
6. **Škálujte do produkce**: Přidejte více regionů a funkce vysoké dostupnosti

## 🎯 Praktické úkoly

### Úkol 1: Nasazení chat aplikace s Microsoft Foundry Models (30 minut)
**Cíl**: Nasadit a otestovat produkčně připravenou AI chatovací aplikaci

```bash
# Inicializovat šablonu
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavit proměnné prostředí
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Nasadit
azd up

# Otestovat aplikaci
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Sledovat AI operace
azd monitor

# Vyčistit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Nasazení proběhlo bez chyb kvóty
- [ ] Přístup k chat rozhraní v prohlížeči
- [ ] Možnost klást otázky a získat AI odpovědi
- [ ] Application Insights ukazuje telemetrická data
- [ ] Úspěšné vyčištění zdrojů

**Odhadované náklady**: 5-10 USD za 30 minut testování

### Úkol 2: Konfigurace nasazení více modelů (45 minut)
**Cíl**: Nasadit více AI modelů s různou konfigurací

```bash
# Vytvořit vlastní konfiguraci Bicep
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

# Nasadit a ověřit
azd provision
azd show
```

**Kritéria úspěchu:**
- [ ] Více modelů úspěšně nasazeno
- [ ] Použity různé kapacitní nastavení
- [ ] Modely dostupné přes API
- [ ] Oba modely lze volat z aplikace

### Úkol 3: Implementace monitorování nákladů (20 minut)
**Cíl**: Nastavit rozpočtová upozornění a sledování nákladů

```bash
# Přidejte rozpočetní upozornění do Bicep
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

# Nasadit rozpočetní upozornění
azd provision

# Zkontrolujte aktuální náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritéria úspěchu:**
- [ ] V Azure vytvořeno rozpočtové upozornění
- [ ] Konfigurovány emailové notifikace
- [ ] Možnost prohlížet náklady v Azure Portálu
- [ ] Správně nastavené rozpočtové limity

## 💡 Často kladené dotazy

<details>
<summary><strong>Jak snížit náklady na Microsoft Foundry Models během vývoje?</strong></summary>

1. **Využijte bezplatnou úroveň**: Microsoft Foundry Models nabízí 50 000 tokenů/měsíc zdarma
2. **Snižte kapacitu**: Nastavte kapacitu na 10 TPM místo 30+ pro vývoj
3. **Používejte azd down**: Uvolněte zdroje, když aktivně nevyvíjíte
4. **Cache odpovědi**: Implementujte Redis cache pro opakované dotazy
5. **Používejte Prompt Engineering**: Snižte využití tokenů efektivními promptmi
```bash
# Konfigurace vývoje
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Jaký je rozdíl mezi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnost a shoda
- Integrace soukromé sítě
- Záruky SLA
- Ověřování pomocí spravované identity
- K dispozici vyšší kvóty

**OpenAI API**:
- Rychlejší přístup k novým modelům
- Jednodušší nastavení
- Nižší vstupní bariéra
- Pouze veřejný internet

Pro produkční aplikace se **doporučuje Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Jak řešit chyby překročení kvóty u Microsoft Foundry Models?</strong></summary>

```bash
# Zkontrolujte aktuální kvótu
az cognitiveservices usage list --location eastus2

# Zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up

# Dočasně snižte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požádejte o zvýšení kvóty
# Přejděte na Azure Portal > Kvóty > Požádat o zvýšení
```
</details>

<details>
<summary><strong>Mohu použít vlastní data s Microsoft Foundry Models?</strong></summary>

Ano! Použijte **Azure AI Search** pro RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Podívejte se na šablonu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jak zabezpečit koncové body AI modelů?</strong></summary>

**Nejlepší postupy**:
1. Použijte Managed Identity (žádné API klíče)
2. Aktivujte Private Endpoints
3. Nakonfigurujte skupiny zabezpečení sítě
4. Implementujte omezení rychlosti
5. Použijte Azure Key Vault pro tajemství

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

- **Microsoft Foundry Discord**: [#Azure kanál](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskuze](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiální dokumentace](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Nainstalujte si Azure + Foundry agent skills ve svém editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolou:**
- **📚 Úvod do kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - AI-First vývoj
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k diskuzím v naší komunitě nebo otevřete problém v repozitáři. Komunita Azure AI + AZD je tu, aby vám pomohla uspět!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Snažíme se o přesnost, ale mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoliv nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Current Chapter**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Previous Chapter**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled

Tento průvodce ukazuje, jak integrovat služby Microsoft Foundry s Azure Developer CLI (AZD) pro zjednodušená nasazení AI aplikací. Microsoft Foundry poskytuje komplexní platformu pro vytváření, nasazení a správu AI aplikací, zatímco AZD zjednodušuje infrastrukturu a proces nasazení.

## Co je Microsoft Foundry?

Microsoft Foundry je sjednocená platforma Microsoftu pro vývoj AI, která zahrnuje:

- **Model Catalog**: Přístup k nejmodernějším AI modelům
- **Prompt Flow**: Vizuální návrhář pro AI workflowy
- **Microsoft Foundry Portal**: Integrované vývojové prostředí pro AI aplikace
- **Deployment Options**: Různé možnosti hostování a škálování
- **Safety and Security**: Vestavěné prvky odpovědného AI

## AZD + Microsoft Foundry: Lepěji spolu

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automatizovaná, opakovatelná nasazení |
| **Infrastructure** | Click-through provisioning | Infrastruktura jako kód (Bicep) |
| **Environment Management** | Single environment focus | Více prostředí (dev/staging/prod) |
| **CI/CD Integration** | Limited | Nativní podpora GitHub Actions |
| **Cost Management** | Basic monitoring | Optimalizace nákladů podle prostředí |

## Požadavky

- Azure předplatné s příslušnými oprávněními
- Nainstalovaný Azure Developer CLI
- Přístup ke službám Microsoft Foundry Models
- Základní povědomí o Microsoft Foundry

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Hlavní integrační vzory

### Vzor 1: Integrace modelů Microsoft Foundry

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

### Vzor 2: AI Search + RAG Integrace

**Případ použití**: Nasazení aplikací s retrieval-augmented generation (RAG)

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

**Případ použití**: Workflowy pro zpracování a analýzu dokumentů

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

**Konfigurace pro produkci:**
```bash
# Jádrové AI služby
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurace modelů
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Nastavení výkonu
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurace pro vývoj:**
```bash
# Nákladově optimalizovaná nastavení pro vývoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Bezplatná úroveň
```

### Zabezpečená konfigurace s Key Vault

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
# Nainstalovat rozšíření Foundry agents
azd extension install azure.ai.agents

# Nainstalovat rozšíření pro doladění
azd extension install azure.ai.finetune

# Nainstalovat rozšíření pro vlastní modely
azd extension install azure.ai.models

# Vypsat nainstalovaná rozšíření
azd extension list --installed

# Zobrazit verzi aktuálně nainstalovaného rozšíření agentů
azd extension show azure.ai.agents
```

AI rozšíření jsou stále v rychlém vývoji v preview. Pokud se příkaz chová odlišně než je zde uvedeno, před řešením problému s projektem aktualizujte příslušné rozšíření.

### Nasazení orientované na agenta s `azd ai`

Pokud máte manifest agenta, použijte `azd ai agent init` k vygenerování projektu napojeného na Foundry Agent Service:

```bash
# Inicializovat z manifestu agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nasadit do Azure
azd up
```

Nedávné preview verze `azure.ai.agents` také přidaly podporu inicializace založené na šablonách pro `azd ai agent init`. Pokud sledujete novější ukázky agentů, zkontrolujte nápovědu rozšíření pro přesné příznaky dostupné ve vaší nainstalované verzi.

Viz [Příkazy AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pro úplný referenční seznam příkazů a přepínačů.

### Nasazení jedním příkazem

```bash
# Nasadit vše jedním příkazem
azd up

# Nebo nasadit postupně
azd provision  # Pouze infrastruktura
azd deploy     # Pouze aplikace

# Pro dlouhodobá nasazení AI aplikací v azd 1.23.11+
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

### Integrace s Application Insights

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

## 🔐 Doporučené bezpečnostní postupy

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

### Strategie cachování

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

### Problém 1: Překročena kvóta OpenAI

**Příznaky:**
- Nasazení selže s chybami kvóty
- 429 chyby v logech aplikace

**Řešení:**
```bash
# Zkontrolujte aktuální využití kvóty
az cognitiveservices usage list --location eastus

# Zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up

# Dočasně snižte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problém 2: Chyby ověřování

**Příznaky:**
- 401/403 chyby při volání AI služeb
- Zprávy "Přístup odepřen"

**Řešení:**
```bash
# Ověřit přiřazení rolí
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Zkontrolovat konfiguraci spravované identity
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Ověřit přístup k Key Vaultu
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasazením modelu

**Příznaky:**
- Modely nejsou dostupné v nasazení
- Konkrétní verze modelů selhávají

**Řešení:**
```bash
# Vypsat dostupné modely podle regionu
az cognitiveservices model list --location eastus

# Aktualizovat verzi modelu v bicep šabloně
# Zkontrolovat požadavky na kapacitu modelu
```

## Ukázkové šablony

### RAG Chat Application (Python)

**Repozitář**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Nejoblíbenější ukázka Azure AI — produkčně připravená RAG chatovací aplikace, která umožňuje klást otázky nad vlastními dokumenty. Používá GPT-4.1-mini pro chat, text-embedding-3-large pro embeddings a Azure AI Search pro vyhledávání. Podporuje multimodální dokumenty, vstup/výstup řeči, ověřování Microsoft Entra a trasování v Application Insights.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repozitář**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# ekvivalent Python RAG chat ukázky. Postaveno s ASP.NET Core Minimal API a Blazor WebAssembly frontendem. Obsahuje hlasový chat, podporu GPT-4o-mini vision a doprovodného .NET MAUI Blazor Hybrid desktop/mobilního klienta.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repozitář**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verze RAG chat ukázky používající Langchain4J pro AI orchestraci. Podporuje mikroservisní event-driven architekturu, více strategií vyhledávání (text, vektor, hybrid), nahrávání dokumentů s Azure Document Intelligence a nasazení buď na Azure Container Apps nebo Azure Kubernetes Service.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repozitář**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: End-to-end retail RAG copilot využívající Microsoft Foundry a Prompty. Chatbot pro prodejce Contoso Outdoor, který podkládá odpovědi v katalogu produktů a datech objednávek zákazníků. Demonstruje kompletní GenAIOps workflow — prototypování s Prompty, vyhodnocení pomocí AI-assistovaných evaluátorů a nasazení přes AZD do Container Apps.

**Rychlý start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repozitář**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Multi-agent ukázka demonstrující orchestraci AI agentů s Prompty. Používá výzkumného agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), spisovatelského agenta a editorského agenta k společné tvorbě dobře prozkoumaných článků. Obsahuje CI/CD s vyhodnocováním v GitHub Actions.

**Rychlý start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitář**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Popis**: Plně serverless RAG chatbot využívající LangChain.js s Azure Functions pro API a Azure Static Web Apps pro hosting. Používá Azure Cosmos DB jako vektorové úložiště a databázi historie chatu. Podporuje lokální vývoj s Ollama pro testování bez nákladů.

**Rychlý start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repozitář**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Popis**: Podniková RAG řešení akcelerátor s admin portálem pro nahrávání/správu dokumentů, více možnostmi orchestrátoru (Semantic Kernel, LangChain, Prompt Flow), převodem řeči na text, integrací Microsoft Teams a volbou backendu PostgreSQL nebo Cosmos DB. Navrženo jako přizpůsobitelný výchozí bod pro produkční RAG scénáře.

**Rychlý start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repozitář**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Popis**: Referenční aplikace pro multi-agent orchestraci AI využívající tři frameworky (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Obsahuje MCP (Model Context Protocol) servery ve čtyřech jazycích nasazené jako serverless Azure Container Apps s OpenTelemetry monitorováním.

**Rychlý start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repozitář**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Služby**: Azure AI Services + Azure OpenAI

**Popis**: Minimální Bicep šablona, která nasazuje Azure AI služby s nakonfigurovanými modely strojového učení. Lehký výchozí bod, když potřebujete pouze provisionovat infrastrukturu Azure AI bez plného aplikačního stacku.

**Rychlý start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Prohlédněte si více šablon**: Navštivte [Galerii skvělých AZD AI šablon](https://azure.github.io/awesome-azd/?tags=ai) pro více než 80 AI-specifických AZD šablon napříč jazyky a scénáři.

## Další kroky

1. **Vyzkoušejte příklady**: Začněte s předpřipravenou šablonou, která odpovídá vašemu scénáři
2. **Přizpůsobte podle potřeb**: Upravte infrastrukturu a aplikační kód
3. **Přidejte monitorování**: Implementujte komplexní observabilitu
4. **Optimalizujte náklady**: Doladěte konfigurace podle rozpočtu
5. **Zabezpečte nasazení**: Implementujte podnikové bezpečnostní vzory
6. **Škálujte do produkce**: Přidejte více regionů a funkce vysoké dostupnosti

## 🎯 Praktická cvičení

### Cvičení 1: Nasazení chatovací aplikace Microsoft Foundry Models (30 minut)
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

# Monitorovat provoz AI
azd monitor

# Vyčistit
azd down --force --purge
```

**Kritéria úspěchu:**
- [ ] Nasazení proběhne bez chyb kvóty
- [ ] Lze přistupovat k chatovacímu rozhraní v prohlížeči
- [ ] Lze klást otázky a získávat odpovědi poháněné AI
- [ ] Application Insights zobrazuje telemetrická data
- [ ] Prostředky byly úspěšně odstraněny

**Odhadované náklady**: 5–10 USD za 30 minut testování

### Cvičení 2: Konfigurace nasazení vícero modelů (45 minut)
**Cíl**: Nasadit více AI modelů s různými konfiguracemi

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
- [ ] Více modelů nasazeno úspěšně
- [ ] Použity různé nastavení kapacity
- [ ] Modely jsou dostupné přes API
- [ ] Aplikace dokáže volat oba modely

### Cvičení 3: Implementace monitorování nákladů (20 minut)
**Cíl**: Nastavit upozornění rozpočtu a sledování nákladů

```bash
# Přidat upozornění rozpočtu do Bicep
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

# Nasadit upozornění rozpočtu
azd provision

# Zkontrolovat aktuální náklady
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kritéria úspěchu:**
- [ ] V Azure vytvořeno upozornění rozpočtu
- [ ] E-mailová oznámení nakonfigurována
- [ ] Lze zobrazit údaje o nákladech v Azure Portalu
- [ ] Práh rozpočtu nastaven vhodně

## 💡 Často kladené otázky

<details>
<summary><strong>Jak snížit náklady Microsoft Foundry Models během vývoje?</strong></summary>

1. **Využijte bezplatnou úroveň**: Microsoft Foundry Models nabízí 50 000 tokenů/měsíc zdarma
2. **Snižte kapacitu**: Nastavte kapacitu na 10 TPM místo 30+ pro vývoj
3. **Použijte azd down**: Uvolněte prostředky, když momentálně nevyvíjíte
4. **Cache odpovědi**: Implementujte Redis cache pro opakované dotazy
5. **Optimalizujte prompty**: Snižte spotřebu tokenů efektivními promptami


```bash
# Vývojová konfigurace
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Jaký je rozdíl mezi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnost a soulad s předpisy
- Integrace do privátní sítě
- Záruky SLA
- Ověřování pomocí spravované identity
- Dostupné vyšší kvóty

**OpenAI API**:
- Rychlejší přístup k novým modelům
- Jednodušší nastavení
- Nižší bariéra vstupu
- Pouze veřejný internet

Pro produkční aplikace se doporučuje **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Jak řešit chyby překročení kvóty Microsoft Foundry Models?</strong></summary>

```bash
# Zkontrolujte aktuální kvótu
az cognitiveservices usage list --location eastus2

# Zkuste jiný region
azd env set AZURE_LOCATION westus2
azd up

# Dočasně snižte kapacitu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Požádejte o navýšení kvóty
# Přejděte do Azure Portal > Kvóty > Požádat o navýšení
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
1. Používejte spravovanou identitu (žádné API klíče)
2. Povolte privátní koncové body
3. Nakonfigurujte síťové bezpečnostní skupiny
4. Zaveďte omezení rychlosti
5. Použijte Azure Key Vault pro ukládání tajemství

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskuze](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiální dokumentace](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Dovednost Microsoft Foundry na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Nainstalujte dovednosti agentů Azure + Foundry ve svém editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - AI-First Development
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k diskuzím komunity nebo otevřete issue v repozitáři. Komunita Azure AI + AZD je tu, aby vám pomohla uspět!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
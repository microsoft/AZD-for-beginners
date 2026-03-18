# Microsoft Foundry integracija su AZD

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI orientuotas kūrimas
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI modelių diegimas](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

## Apžvalga

Šis vadovas demonstruoja, kaip integruoti Microsoft Foundry paslaugas su Azure Developer CLI (AZD), kad būtų supaprastinti DI programų diegimai. Microsoft Foundry suteikia išsamią platformą DI programų kūrimui, diegimui ir valdymui, o AZD supaprastina infrastruktūros ir diegimo procesą.

## Kas yra Microsoft Foundry?

Microsoft Foundry yra Microsoft vieninga DI kūrimo platforma, kuri apima:

- **Modelių katalogas**: Prieiga prie pažangiausių DI modelių
- **Prompt Flow**: Vizualus DI darbo srautų dizaineris
- **Microsoft Foundry Portal**: Integruota DI programų kūrimo aplinka
- **Diegimo parinktys**: Keli talpinimo ir mastelio keitimo variantai
- **Saugumas ir apsauga**: Įmontuotos atsakingo DI funkcijos

## AZD + Microsoft Foundry: Geriau kartu

| Funkcija | Microsoft Foundry | AZD integracijos nauda |
|---------|-----------------|------------------------|
| **Modelių diegimas** | Rankinis diegimas per portalą | Automatizuoti, pakartojami diegimai |
| **Infrastruktūra** | Sukūrimas per paspaudimų sąsają | Infrastruktūra kaip kodas (Bicep) |
| **Aplinkos valdymas** | Dėmesys vienai aplinkai | Daugialypė aplinka (dev/staging/prod) |
| **CI/CD integracija** | Ribota | Gimtas GitHub Actions palaikymas |
| **Kaštų valdymas** | Pagrindinis stebėjimas | Kaštų optimizavimas pagal aplinką |

## Išankstiniai reikalavimai

- Azure prenumerata su reikalingomis teisėmis
- Įdiegta Azure Developer CLI
- Prieiga prie Microsoft Foundry Models paslaugų
- Pagrindinis susipažinimas su Microsoft Foundry

## Pagrindiniai integracijos modeliai

### Modelis 1: Microsoft Foundry Models integracija

**Naudojimo atvejis**: Diegti pokalbių programas su Microsoft Foundry Models modeliais

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

**Infrastruktūra (main.bicep):**
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

### Modelis 2: AI Search + RAG integracija

**Naudojimo atvejis**: Įdiegti paieškos pagrindu papildytos generacijos (RAG) programas

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

### Modelis 3: Dokumentų intelekto integracija

**Naudojimo atvejis**: Dokumentų apdorojimo ir analizės darbo srautai

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

## 🔧 Konfigūracijos modeliai

### Aplinkos kintamųjų nustatymas

**Produkcinė konfigūracija:**
```bash
# Pagrindinės DI paslaugos
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelių konfigūracijos
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Našumo nustatymai
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Vystymo konfigūracija:**
```bash
# Sąnaudų optimizuoti nustatymai kūrimui
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nemokamas planas
```

### Saugus konfigūravimas su Key Vault

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

## Diegimo darbo eiga

### AZD plėtiniai Foundry

AZD teikia plėtinius, kurie prideda DI-specifines galimybes darbui su Microsoft Foundry paslaugomis:

```bash
# Įdiegti Foundry agentų plėtinį
azd extension install azure.ai.agents

# Įdiegti smulkiojo derinimo plėtinį
azd extension install azure.ai.finetune

# Įdiegti pasirinktinių modelių plėtinį
azd extension install azure.ai.models

# Išvardyti įdiegtus plėtinius
azd extension list
```

### Agentų pirmasis diegimas su `azd ai`

Jei turite agento manifestą, naudokite `azd ai agent init`, kad sukurtumėte projektą, sujungtą su Foundry Agent Service:

```bash
# Inicializuoti pagal agento manifestą
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Diegti į Azure
azd up
```

Žr. [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) dėl pilno komandų sąrašo ir parametrų.

### Vienos komandos diegimas

```bash
# Įdiekite viską viena komanda
azd up

# Arba įdiekite palaipsniui
azd provision  # Tik infrastruktūra
azd deploy     # Tik taikomoji programa
```

### Aplinkai pritaikyti diegimai

```bash
# Vystymo aplinka
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Gamybinė aplinka
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Stebėsena ir observabilumas

### Application Insights integracija

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

### Kaštų stebėsena

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

## 🔐 Saugumo geriausios praktikos

### Valdomos tapatybės konfigūracija

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

### Tinklo saugumas

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

## Veikimo optimizavimas

### Kešavimo strategijos

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

### Automatinio mastelio keitimo konfigūracija

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

## Dažniausiai pasitaikančių problemų sprendimas

### Problema 1: OpenAI kvotos viršijimas

**Simptomai:**
- Diegimas nepavyksta dėl kvotos klaidų
- 429 klaidos programos žurnaluose

**Sprendimai:**
```bash
# Patikrinkite esamą kvotos naudojimą
az cognitiveservices usage list --location eastus

# Pabandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinkite pajėgumą
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Autentifikacijos klaidos

**Simptomai:**
- 401/403 klaidos kreipiantis į DI paslaugas
- "Access denied" pranešimai

**Sprendimai:**
```bash
# Patikrinti vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Patikrinti valdomos tapatybės konfigūraciją
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patikrinti Key Vault prieigą
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Modelių diegimo problemos

**Simptomai:**
- Modeliai nepasiekiami diegime
- Konkrečios modelio versijos nepavyksta

**Sprendimai:**
```bash
# Išvardinti prieinamus modelius pagal regionus
az cognitiveservices model list --location eastus

# Atnaujinti modelio versiją Bicep šablone
# Patikrinti modelio pajėgumo reikalavimus
```

## Pavyzdiniai šablonai

### RAG pokalbių programa (Python)

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Aprašymas**: Populiariausias Azure DI pavyzdys — gamybai paruošta RAG pokalbių programa, leidžianti užduoti klausimus savo dokumentams. Naudoja GPT-4.1-mini pokalbiams, text-embedding-ada-002 įterpimams ir Azure AI Search atgavimui. Palaiko multimodalinius dokumentus, balso įvestį/išvestį, Microsoft Entra autentifikaciją ir Application Insights triktis.

**Greita pradžia**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG pokalbių programa (.NET)

**Saugykla**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Aprašymas**: .NET/C# atitikmuo Python RAG pokalbių pavyzdžiui. Sukurta naudojant ASP.NET Core Minimal API ir Blazor WebAssembly frontendą. Įtraukta balso pokalbių, GPT-4o-mini vaizdo palaikymas ir lydinys .NET MAUI Blazor Hybrid darbalaukio/mobilioji klientė.

**Greita pradžia**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG pokalbių programa (Java)

**Saugykla**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Aprašymas**: Java versija RAG pokalbių pavyzdžio, naudojanti Langchain4J DI orkestracijai. Palaiko mikroservisų įvykių valdomą architektūrą, kelias paieškos strategijas (tekstą, vektorius, hibridinę), dokumentų įkėlimą su Azure Document Intelligence ir diegimą Azure Container Apps arba Azure Kubernetes Service.

**Greita pradžia**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise mažmeninės prekybos Copilot su Azure AI Foundry

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Aprašymas**: Pilnas mažmeninės prekybos RAG copilotas, naudojantis Azure AI Foundry ir Prompty. Contoso Outdoor mažmeninės prekybos chatbot'as, kuris pagrindžia atsakymus produkto katalogu ir klientų užsakymų duomenimis. Demonstruoja visą GenAIOps darbo eigą — prototipas su Prompty, vertinimas su DI padedamais vertintojais ir diegimas per AZD į Container Apps.

**Greita pradžia**:
```bash
azd init --template contoso-chat
azd up
```

### Kūrybinio rašymo daugiaagentė programa

**Saugykla**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Paslaugos**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Aprašymas**: Daugiaagentis pavyzdys, demonstruojantis DI agentų orkestraciją su Prompty. Naudoja tyrimų agentą (Bing Grounding Azure AI Agent Service), produkto agentą (Azure AI Search), rašytojo agentą ir redaktoriaus agentą, kad kartu sukurtų gerai ištirtus straipsnius. Įtraukta CI/CD su vertinimu GitHub Actions.

**Greita pradžia**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG pokalbis (JavaScript/TypeScript)

**Saugykla**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Paslaugos**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Aprašymas**: Visiškai serverless RAG chatbot'as, naudojantis LangChain.js su Azure Functions API ir Azure Static Web Apps talpinimui. Naudoja Azure Cosmos DB kaip tiek vektorių saugyklą, tiek pokalbių istorijos duomenų bazę. Palaiko vietinį vystymą su Ollama nemokamam testavimui.

**Greita pradžia**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### "Chat with Your Data" sprendimų akceleratorius

**Saugykla**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Aprašymas**: Įmonės lygio RAG sprendimo akceleratorius su administravimo portalu dokumentų įkėlimui/valdymui, keliais orkestratorių pasirinkimais (Semantic Kernel, LangChain, Prompt Flow), kalbos į tekstą, Microsoft Teams integracija ir galimybe rinktis PostgreSQL arba Cosmos DB backendą. Sukurtas kaip pritaikomas pradinės taškas gamybos RAG scenarijams.

**Greita pradžia**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI kelionių agentai — daugiaagentė MCP orkestracija

**Saugykla**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Paslaugos**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Aprašymas**: Atvirojo kodo pavyzdinė programa daugiaagentės DI orkestracijos, naudojanti tris karkasus (LangChain.js, LlamaIndex.TS ir Microsoft Agent Framework). Funkcionalumas apima MCP (Model Context Protocol) serverius keturiomis kalbomis, diegiamus kaip serverless Azure Container Apps su OpenTelemetry stebėsena.

**Greita pradžia**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Saugykla**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Paslaugos**: Azure AI Services + Azure OpenAI

**Aprašymas**: Minimalus Bicep šablonas, kuris diegia Azure AI paslaugas su sukonfigūruotais mašininio mokymosi modeliais. Lengvas pradinės taškas, kai reikia tik Azure AI infrastruktūros be pilno programos sluoksnio.

**Greita pradžia**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Peržiūrėti daugiau šablonų**: Apsilankykite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) dėl 80+ DI specifinių AZD šablonų įvairiomis kalbomis ir scenarijais.

## Tolimesni žingsniai

1. **Išbandykite pavyzdžius**: pradėkite nuo paruošto šablono, atitinkančio jūsų naudojimo atvejį
2. **Pritaikykite pagal savo poreikius**: modifikuokite infrastruktūrą ir programos kodą
3. **Pridėkite stebėseną**: įdiekite išsamią stebėseną
4. **Optimizuokite kaštus**: sureguliuokite konfigūracijas pagal biudžetą
5. **Užtikrinkite diegimo saugumą**: įdiekite įmonės saugumo modelius
6. **Mastelio didinimas iki gamybos**: pridėkite daugiarajonines ir aukšto prieinamumo funkcijas

## 🎯 Praktiniai užsiėmimai

### Pratimai 1: Diegti Microsoft Foundry Models pokalbių programą (30 minučių)
**Tikslas**: Diegti ir patikrinti gamybai paruoštą DI pokalbių programą

```bash
# Inicializuoti šabloną
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nustatyti aplinkos kintamuosius
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Diegti
azd up

# Išbandyti programą
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Stebėti DI veiklą
azd monitor

# Išvalyti
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Diegimas užbaigtas be kvotos klaidų
- [ ] Galima pasiekti pokalbių sąsają naršyklėje
- [ ] Galima užduoti klausimus ir gauti DI pagrįstus atsakymus
- [ ] Application Insights rodo telemetrijos duomenis
- [ ] Išteklių išvalymas sėkmingas

**Apskaičiuotos sąnaudos**: $5-10 už 30 minučių testavimą

### Pratimai 2: Konfigūruoti daugiamodelinį diegimą (45 minutės)
**Tikslas**: Diegti kelis DI modelius su skirtingomis konfigūracijomis

```bash
# Sukurti pasirinktą Bicep konfigūraciją
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

# Diegti ir patikrinti
azd provision
azd show
```

**Sėkmės kriterijai:**
- [ ] Keli modeliai sėkmingai išdiegti
- [ ] Taikyti skirtingi pajėgumų nustatymai
- [ ] Modeliai pasiekiami per API
- [ ] Programa gali kreiptis į abu modelius

### Pratimai 3: Įdiegti kaštų stebėseną (20 minučių)
**Tikslas**: Nustatyti biudžeto įspėjimus ir kaštų stebėjimą

```bash
# Pridėti biudžeto įspėjimą į Bicep
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

# Diegti biudžeto įspėjimą
azd provision

# Patikrinti dabartines išlaidas
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Sėkmės kriterijai:**
- [ ] Biudžeto įspėjimas sukurtas Azure
- [ ] El. pašto pranešimai sukonfigūruoti
- [ ] Galima peržiūrėti kaštų duomenis Azure portale
- [ ] Biudžeto ribos nustatytos tinkamai

## 💡 Dažnai užduodami klausimai

<details>
<summary><strong>Kaip sumažinti Microsoft Foundry Models išlaidas vystymo metu?</strong></summary>

1. **Naudokite nemokamą lygį**: Microsoft Foundry Models siūlo 50,000 tokens/month nemokamai
2. **Sumažinkite pajėgumą**: nustatykite pajėgumą 10 TPM vietoj 30+ vystymui
3. **Naudokite azd down**: deallokuokite išteklius, kai aktyviai nevystote
4. **Keškuokite atsakymus**: įdiekite Redis kešą kartotinėms užklausoms
5. **Naudokite užklausų inžineriją**: mažinkite žetonų naudojimą efektyviais užklausimais

```bash
# Vystymo konfigūracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kuo skiriasi Microsoft Foundry Models ir OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Įmonės lygio saugumas ir atitiktis
- Privataus tinklo integracija
- SLA garantijos
- Valdomos tapatybės autentifikacija
- Galimos didesnės kvotos

**OpenAI API**:
- Greitesnė prieiga prie naujų modelių
- Paprastesnė konfigūracija
- Mažesnė įėjimo riba
- Tik viešasis internetas

Gamybiniams programoms rekomenduojama **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Kaip spręsti Microsoft Foundry modelių kvotos viršijimo klaidas?</strong></summary>

```bash
# Patikrinkite esamą kvotą
az cognitiveservices usage list --location eastus2

# Pabandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinkite pajėgumą
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Prašykite kvotos padidinimo
# Eikite į Azure portalą > Kvotos > Prašyti padidinimo
```
</details>

<details>
<summary><strong>Ar galiu naudoti savo duomenis su Microsoft Foundry modeliais?</strong></summary>

Taip! Naudokite **Azure AI Search** RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Peržiūrėkite [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šabloną.
</details>

<details>
<summary><strong>Kaip apsaugoti AI modelių galinius taškus?</strong></summary>

**Geriausios praktikos**:
1. Use Managed Identity (nereikia API raktų)
2. Įgalinkite Private Endpoints
3. Konfigūruokite tinklo saugumo grupes
4. Įgyvendinkite užklausų ribojimą
5. Naudokite Azure Key Vault slaptiems duomenims

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

## Bendruomenė ir palaikymas

- **Microsoft Foundry Discord**: [#Azure kanalas](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Klausimai ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry įgūdis skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Įdiekite Azure + Foundry agentų įgūdžius savo redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyrių navigacija:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 2 - AI-First Development
- **⬅️ Ankstesnis skyrius**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite problemą saugykloje. Azure AI + AZD bendruomenė yra čia, kad padėtų jums pasisekti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl ypač svarbios informacijos rekomenduojama pasinaudoti profesionalaus vertėjo paslaugomis. Mes neatsakome už bet kokius nesusipratimus ar neteisingą aiškinimą, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry integracija su AZD

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: Skyrius 2 - AI pirmumo kūrimas
- **⬅️ Ankstesnis skyrius**: [Skyrius 1: Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI modelio diegimas](ai-model-deployment.md)
- **🚀 Sekantis skyrius**: [Skyrius 3: Konfigūracija](../chapter-03-configuration/configuration.md)

## Apžvalga

Šis vadovas demonstruoja, kaip integruoti Microsoft Foundry paslaugas su Azure Developer CLI (AZD) siekiant supaprastinti AI programų diegimą. Microsoft Foundry suteikia išsamią platformą AI programų kūrimui, diegimui ir valdymui, o AZD supaprastina infrastruktūros ir diegimo procesą.

## Kas yra Microsoft Foundry?

Microsoft Foundry yra „Microsoft“ suvienyta AI kūrimo platforma, kuri apima:

- **Model Catalog**: Prieiga prie pažangių AI modelių
- **Prompt Flow**: Vizualus AI darbo eigų dizaineris
- **Microsoft Foundry Portal**: Integruota AI programų kūrimo aplinka
- **Deployment Options**: Keli talpinimo ir skalavimo variantai
- **Safety and Security**: Integruotos atsakingo AI priemonės

## AZD + Microsoft Foundry: Geriau kartu

| Funkcija | Microsoft Foundry | AZD integracijos nauda |
|---------|-----------------|------------------------|
| **Model Deployment** | Rankinis diegimas per portalą | Automatizuoti, kartojami diegimai |
| **Infrastructure** | Diegimas per spustelėjimus | Infrastruktūra kaip kodas (Bicep) |
| **Environment Management** | Dėmesys vienai aplinkai | Keli aplinkų (dev/staging/prod) |
| **CI/CD Integration** | Ribotas | Gimtasis GitHub Actions palaikymas |
| **Cost Management** | Pagrindinis stebėjimas | Aplinkai pritaikyta sąnaudų optimizacija |

## Išankstiniai reikalavimai

- Azure abonementas su tinkamomis teisėmis
- Azure Developer CLI įdiegta
- Prieiga prie Microsoft Foundry Models paslaugų
- Pagrindinis pažinimas su Microsoft Foundry

> **Dabartinė AZD bazė:** Šie pavyzdžiai buvo peržiūrėti su `azd` `1.23.12`. AI agento darbo eigai naudokite dabartinį peržiūros plėtinio leidimą ir prieš pradėdami patikrinkite savo įdiegtą versiją.

## Pagrindiniai integracijos modeliai

### Šablonas 1: Microsoft Foundry Models integracija

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

### Šablonas 2: AI Search + RAG integracija

**Naudojimo atvejis**: Diegti retrieval-augmented generation (RAG) programas

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

### Šablonas 3: Dokumentų intelekto integracija

**Naudojimo atvejis**: Dokumentų apdorojimo ir analizės darbo eigos

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

## 🔧 Konfigūracijos šablonai

### Aplinkos kintamųjų nustatymas

**Produkcijos konfigūracija:**
```bash
# Pagrindinės DI paslaugos
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelių konfigūracijos
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Našumo nustatymai
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Vystymo konfigūracija:**
```bash
# Sąnaudų optimizuoti nustatymai vystymui
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nemokamas lygis
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

### AZD plėtiniai Microsoft Foundry

AZD teikia plėtinius, kurie prideda AI specifines galimybes darbui su Microsoft Foundry paslaugomis:

```bash
# Įdiegti Foundry agentų plėtinį
azd extension install azure.ai.agents

# Įdiegti smulkaus derinimo plėtinį
azd extension install azure.ai.finetune

# Įdiegti pasirinktinių modelių plėtinį
azd extension install azure.ai.models

# Išvardinti įdiegtus plėtinius
azd extension list --installed

# Peržiūrėti šiuo metu įdiegtą agentų plėtinio versiją
azd extension show azure.ai.agents
```

AI plėtiniai vis dar greitai vystosi peržiūros stadijoje. Jei komanda veikia kitaip nei čia parodyta, atnaujinkite atitinkamą plėtinį prieš pradėdami spręsti projektui kitas problemas.

### Agentų pirmasis diegimas su `azd ai`

Jei turite agento manifestą, naudokite `azd ai agent init`, kad sukurti projektą, prijungtą prie Foundry Agent Service:

```bash
# Inicializuoti iš agento manifesto
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Diegti į Azure
azd up
```

Naujesni peržiūros leidimai `azure.ai.agents` taip pat pridėjo šablonais pagrįstą inicializavimo palaikymą `azd ai agent init`. Jei sekate naujesnius agentų pavyzdžius, patikrinkite plėtinio pagalbą dėl tikslių vėliavų, prieinamų jūsų įdiegtame leidime.

Žr. [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) visai komandų nuorodai ir vėliavoms.

### Diegimas viena komanda

```bash
# Įdiekite viską per vieną komandą
azd up

# Arba įdiekite palaipsniui
azd provision  # Tik infrastruktūra
azd deploy     # Tik programa

# Skirta ilgai veikiančių AI programų diegimams azd 1.23.11+
azd deploy --timeout 1800
```

### Aplinkai pritaikyti diegimai

```bash
# Kūrimo aplinka
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

## Stebėjimas ir matomumas

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

### Sąnaudų stebėjimas

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

### Tinklo sauga

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

### Talpinimo strategijos

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

### Automatinio skalavimo konfigūracija

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

## Dažnų problemų sprendimas

### Problema 1: Viršyta OpenAI kvota

**Simptomai:**
- Diegimas neįvyksta dėl kvotos klaidų
- 429 klaidos programos žurnaluose

**Sprendimai:**
```bash
# Patikrinkite esamą kvotos naudojimą
az cognitiveservices usage list --location eastus

# Išbandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinkite pajėgumą
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Autentifikavimo klaidos

**Simptomai:**
- 401/403 klaidos kviečiant AI paslaugas
- „Access denied“ pranešimai

**Sprendimai:**
```bash
# Patikrinti vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Patikrinti valdomos tapatybės konfigūraciją
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patikrinti prieigą prie Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Modelių diegimo problemos

**Simptomai:**
- Modeliai neprieinami diegime
- Konkrečių modelio versijų gedimai

**Sprendimai:**
```bash
# Išvardinti prieinamus modelius pagal regionus
az cognitiveservices model list --location eastus

# Atnaujinti modelio versiją Bicep šablone
# Patikrinti modelio pajėgumo reikalavimus
```

## Pavyzdžių šablonai

### RAG pokalbių programa (Python)

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Aprašymas**: Populiariausias Azure AI pavyzdys — gamybai paruošta RAG pokalbių programa, leidžianti užduoti klausimus apie jūsų dokumentus. Naudoja GPT-4.1-mini pokalbiams, text-embedding-3-large įterpimams ir Azure AI Search paieškai. Palaiko multimodalinius dokumentus, kalbos įvestį/išvestį, Microsoft Entra autentifikaciją ir Application Insights sekimą.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG pokalbių programa (.NET)

**Saugykla**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Aprašymas**: .NET/C# atitikmuo Python RAG pokalbių pavyzdžiui. Sukurta su ASP.NET Core Minimal API ir Blazor WebAssembly frontend'u. Apima balso pokalbį, GPT-4o-mini vizijos palaikymą ir palydovinį .NET MAUI Blazor Hybrid darbalaukio/mobiliųjų klientą.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG pokalbių programa (Java)

**Saugykla**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Aprašymas**: Java versija RAG pokalbių pavyzdžio, naudojanti Langchain4J AI orkestracijai. Palaiko mikroservisų įvykių valdomą architektūrą, kelias paieškos strategijas (tekstas, vektorius, hibridinė), dokumentų kėlimą su Azure Document Intelligence ir diegimą tiek Azure Container Apps, tiek Azure Kubernetes Service.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Įmonės mažmeninės prekybos Copilot su Microsoft Foundry

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Aprašymas**: Pilnas mažmeninės prekybos RAG copilot, naudojantis Microsoft Foundry ir Prompty. Contoso Outdoor parduotuvės pokalbių robotas, kuris pagrindžia atsakymus produkto katalogo ir klientų užsakymų duomenimis. Demonstruoja visą GenAIOps darbo eigą — prototipavimas su Prompty, vertinimas su AI padedančiais vertintojais ir diegimas per AZD į Container Apps.

**Greitas pradėjimas**:
```bash
azd init --template contoso-chat
azd up
```

### Kūrybinio rašymo daugiaagentinė programa

**Saugykla**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Paslaugos**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Aprašymas**: Daugiaagentinis pavyzdys, demonstruojantis AI agentų orkestraciją su Prompty. Naudoja tyrimų agentą (Bing Grounding in Azure AI Agent Service), produktų agentą (Azure AI Search), rašytojo agentą ir redaktoriaus agentą, kad bendradarbiautų kuriant gerai ištirtus straipsnius. Įtraukia CI/CD su vertinimu GitHub Actions.

**Greitas pradėjimas**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG pokalbis (JavaScript/TypeScript)

**Saugykla**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Paslaugos**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Aprašymas**: Visiškai be serverio veikiantis RAG pokalbių robotas, naudojantis LangChain.js su Azure Functions API ir Azure Static Web Apps talpinimui. Naudoja Azure Cosmos DB kaip tiek vektorių saugyklą, tiek pokalbių istorijos duomenų bazę. Palaiko vietinį vystymą su Ollama nemokamam testavimui.

**Greitas pradėjimas**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Pokalbis su jūsų duomenimis — sprendimo pagreitinimo pavyzdys

**Saugykla**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Aprašymas**: Įmoniniam naudojimui skirtas RAG sprendimo pagreitintuvas su administravimo portalu dokumentų kėlimui/valdymui, keliais orkestratoriaus pasirinkimais (Semantic Kernel, LangChain, Prompt Flow), kalbos į tekstą, Microsoft Teams integracija ir PostgreSQL arba Cosmos DB pasirinkimu kaip backend'u. Sukurtas kaip pritaikoma pradžia gamybiniams RAG scenarijams.

**Greitas pradėjimas**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI kelionių agentai — daugiaagentinė MCP orkestracija

**Saugykla**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Paslaugos**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Aprašymas**: Referencinė programa daugiaagentinei AI orkestracijai, naudojant tris karkasus (LangChain.js, LlamaIndex.TS ir Microsoft Agent Framework). Yra MCP (Model Context Protocol) serveriai keturiomis kalbomis, išdėstyti kaip be serverio Azure Container Apps su OpenTelemetry stebėsena.

**Greitas pradėjimas**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Saugykla**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Paslaugos**: Azure AI Services + Azure OpenAI

**Aprašymas**: Minimalus Bicep šablonas, kuris diegia Azure AI paslaugas su sukonfigūruotais mašininio mokymosi modeliais. Lengvas pradžios taškas, kai reikia tik Azure AI infrastruktūros be pilno programos paketo.

**Greitas pradėjimas**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Peržiūrėkite daugiau šablonų**: Apsilankykite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) dėl daugiau nei 80 AI specifinių AZD šablonų įvairioms kalboms ir scenarijams.

## Tolimesni žingsniai

1. **Išbandykite pavyzdžius**: Pradėkite nuo paruošto šablono, atitinkančio jūsų naudojimo atvejį
2. **Pritaikykite pagal poreikius**: Modifikuokite infrastruktūrą ir programos kodą
3. **Pridėkite stebėjimą**: Įgyvendinkite išsamią matomumą
4. **Optimizuokite sąnaudas**: Smulkiai sureguliuokite konfigūracijas pagal biudžetą
5. **Užtikrinkite diegimą**: Įgyvendinkite įmonės saugumo modelius
6. **Skalavimas į gamybą**: Pridėkite kelių regionų ir aukšto prieinamumo funkcijas

## 🎯 Praktiniai pratimai

### Pratimas 1: Diegti Microsoft Foundry Models pokalbių programą (30 minučių)
**Tikslas**: Įdiegti ir išbandyti gamybai paruoštą AI pokalbių programą

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

# Stebėti dirbtinio intelekto operacijas
azd monitor

# Išvalyti
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Diegimas baigiamas be kvotos klaidų
- [ ] Galima pasiekti pokalbių sąsają naršyklėje
- [ ] Galima užduoti klausimus ir gauti AI palaikomus atsakymus
- [ ] Application Insights rodo telemetrijos duomenis
- [ ] Sėkmingai išvalyti ištekliai

**Apskaičiuotos išlaidos**: $5–10 už 30 minučių testavimo

### Pratimas 2: Konfigūruoti daugiamodelių diegimą (45 minutės)
**Tikslas**: Įdiegti kelis AI modelius su skirtingomis konfigūracijomis

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

# Diegti ir patikrinti
azd provision
azd show
```

**Sėkmės kriterijai:**
- [ ] Kelis modeliai sėkmingai įdiegti
- [ ] Taikyti skirtingi talpumo nustatymai
- [ ] Modeliai pasiekiami per API
- [ ] Galima kviesti abu modelius iš programos

### Pratimas 3: Įgyvendinti sąnaudų stebėjimą (20 minučių)
**Tikslas**: Nustatyti biudžeto įspėjimus ir sąnaudų stebėjimą

```bash
# Pridėti biudžeto įspėjimą prie Bicep
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
- [ ] Sukurtas biudžeto įspėjimas Azure
- [ ] Konfigūruoti el. pašto pranešimai
- [ ] Galima peržiūrėti sąnaudų duomenis Azure portale
- [ ] Biudžeto ribos nustatytos tinkamai

## 💡 Dažniausiai užduodami klausimai

<details>
<summary><strong>Kaip sumažinti Microsoft Foundry Models išlaidas vystymo metu?</strong></summary>

1. **Naudokite nemokamą lygį**: Microsoft Foundry Models siūlo 50 000 žetonų/mėnesį nemokamai
2. **Sumažinkite talpumą**: Nustatykite talpumą 10 TPM vietoje 30+ vystymui
3. **Naudokite azd down**: Atlaisvinkite išteklius, kai aktyviai nevystote
4. **Talpinkite atsakymus**: Įdiekite Redis talpyklą pasikartojančioms užklausoms
5. **Naudokite promptų inžineriją**: Mažinkite žetonų naudojimą efektyviais promptais

</details>
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
- Greitesnis prieigos prie naujų modelių laikas
- Paprastesnis nustatymas
- Žemesnis įėjimo barjeras
- Veikia tik per viešąjį internetą

Produktinėms programoms rekomenduojama naudoti **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Kaip tvarkyti Microsoft Foundry Models kvotos viršijimo klaidas?</strong></summary>

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
<summary><strong>Ar galiu naudoti savo duomenis su Microsoft Foundry Models?</strong></summary>

Taip! Naudokite **Azure AI Search** RAG (paieškos pagrįstas papildytas generavimas):

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
1. Naudokite Managed Identity (nereikia API raktų)
2. Įgalinkite Private Endpoints
3. Konfigūruokite tinklo saugumo grupes
4. Įgyvendinkite užklausų ribojimą
5. Naudokite Azure Key Vault slaptoms reikšmėms

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemos ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Įdiekite Azure + Foundry agentų įgūdžius savo redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: Chapter 2 - AI-First Development
- **⬅️ Ankstesnis skyrius**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite problemą saugykloje. Azure AI + AZD bendruomenė pasiruošusi padėti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
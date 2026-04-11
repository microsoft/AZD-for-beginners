# „Microsoft Foundry“ integracija su AZD

**Skyrių navigacija:**
- **📚 Kursų pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – AI pirmoji plėtra
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI modelio diegimas](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūravimas](../chapter-03-configuration/configuration.md)

## Apžvalga

Šiame vadove parodyta, kaip integruoti „Microsoft Foundry“ paslaugas su „Azure Developer CLI“ (AZD), kad būtų supaprastintas AI taikomųjų programų diegimas. „Microsoft Foundry“ suteikia išsamų platformos sprendimą AI taikomųjų programų kūrimui, diegimui ir valdymui, o AZD supaprastina infrastruktūros ir diegimo procesą.

## Kas yra „Microsoft Foundry“?

„Microsoft Foundry“ – tai „Microsoft“ vieninga AI kūrimo platforma, apimanti:

- **Modelių katalogas**: prieiga prie pažangių AI modelių
- **Prompt Flow**: vizualus AI darbo srautų kūrėjas
- **Microsoft Foundry portalas**: integruota kūrimo aplinka AI taikomosioms programoms
- **Diegimo galimybės**: įvairios talpinimo ir skalavimo parinktys
- **Saugumas ir atsakomybė**: įmontuotos atsakingo AI funkcijos

## AZD + „Microsoft Foundry“: kartu geriau

| Funkcija | Microsoft Foundry | AZD integracijos nauda |
|---------|-----------------|------------------------|
| **Modelių diegimas** | Rankinis portalas | Automatizuotas, pakartojamas diegimas |
| **Infrastruktūra** | Paspaudimų peržiūra | Infrastruktūra kaip kodas (Bicep) |
| **Aplinkos valdymas** | Viena aplinka | Daugybė aplinkų (dev/staging/prod) |
| **CI/CD integracija** | Ribota | Natūrali „GitHub Actions“ palaikymas |
| **Išlaidų valdymas** | Pagrindinė stebėsena | Tiksli aplinkos išlaidų optimizacija |

## Išankstiniai reikalavimai

- „Azure“ prenumerata su tinkamomis teisėmis
- Įdiegtas „Azure Developer CLI“
- Prieiga prie „Microsoft Foundry Models“ paslaugų
- Pagrindinis pažinimas apie „Microsoft Foundry“

> **Dabartinė AZD bazė:** Šie pavyzdžiai peržiūrėti su `azd` `1.23.12`. Naudokite dabartinę peržiūros plėtinio versiją dirbdami su AI agentų darbo srautu ir patikrinkite įdiegtą versiją prieš pradėdami.

## Pagrindiniai integracijos modeliai

### Modelis 1: „Microsoft Foundry Models“ integracija

**Naudojimo atvejis**: Diegti pokalbių taikomąsias programas su „Microsoft Foundry Models“ modeliais

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

### Modelis 2: AI paieška + RAG integracija

**Naudojimo atvejis**: Diegti atgavimo papildytos generacijos (RAG) taikomąsias programas

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

**Produkcijos konfigūracija:**
```bash
# Pagrindinės DI paslaugos
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelio konfigūracijos
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Veikimo nustatymai
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Vystymo konfigūracija:**
```bash
# Kaina optimizuoti nustatymai plėtrai
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nemokamas lygis
```

### Saugi konfigūracija su Key Vault

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

## Diegimo darbo srautai

### AZD plėtiniai „Foundry“

AZD teikia plėtinius, kurie prideda AI specifines galimybes darbui su „Microsoft Foundry“ paslaugomis:

```bash
# Įdiekite Foundry agentų plėtinį
azd extension install azure.ai.agents

# Įdiekite smulkiojo derinimo plėtinį
azd extension install azure.ai.finetune

# Įdiekite pasirinktinių modelių plėtinį
azd extension install azure.ai.models

# Išvardinkite įdiegtus plėtinius
azd extension list --installed

# Patikrinkite šiuo metu įdiegtos agentų plėtinio versiją
azd extension show azure.ai.agents
```

AI plėtiniai vis dar greitai tobulėja peržiūros režime. Jei komanda veikia kitaip nei čia pateikta, atnaujinkite atitinkamą plėtinį prieš spręsdami projekto problemas.

### Agentų pirmojo diegimas su `azd ai`

Jei turite agentų manifestą, naudokite `azd ai agent init`, kad sukurtumėte projektą, prijungtą prie Foundry Agent Service:

```bash
# Inicializuojama iš agentų manifestų
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Diegti į Azure
azd up
```

Naujausiuose peržiūros leidimuose `azure.ai.agents` taip pat pridėta palaikymas šablonų pagrindu `azd ai agent init` komandai. Jei naudojate naujesnius agentų pavyzdžius, patikrinkite plėtinio pagalbos informaciją apie galimus indikatorius jūsų įdiegtos versijos atžvilgiu.

Skaitykite [AZD AI CLI komandas](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions), kad gautumėte pilną komandų sąrašą su indikatoriais.

### Diegimas viena komanda

```bash
# Diegti viską viena komanda
azd up

# Arba diegti palaipsniui
azd provision  # Tik infrastruktūra
azd deploy     # Tik programa

# Skirta ilgai veikiančioms AI programų diegimams azd 1.23.11+
azd deploy --timeout 1800
```

### Diegimai pagal aplinką

```bash
# Kūrimo aplinka
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Gamybos aplinka
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Stebėsena ir matomumas

### „Application Insights“ integracija

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

### Išlaidų stebėsena

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

## 🔐 Geriausios praktikos saugumui

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

## Dažniausiai pasitaikančių problemų šalinimas

### Problema 1: Viršytas OpenAI kvotas

**Simptomai:**
- Diegimas nepavyksta dėl kvotų klaidų
- 429 klaidos programos žurnaluose

**Sprendimai:**
```bash
# Patikrinkite esamą kvotos naudojimą
az cognitiveservices usage list --location eastus

# Išbandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinkite talpą
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Autentifikacijos klaidos

**Simptomai:**
- 401/403 klaidos kviečiant AI paslaugas
- Žinutės „Prieiga atmesta“

**Sprendimai:**
```bash
# Patikrinti vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Patikrinti valdytos tapatybės konfigūraciją
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patvirtinti Key Vault prieigą
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Modelių diegimo problemos

**Simptomai:**
- Modeliai neprieinami diegime
- Konkretūs modelių versijų veikimo sutrikimai

**Sprendimai:**
```bash
# Išvardinti turimus modelius pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinti modelio versiją bicep šablone
# Patikrinti modelio talpos reikalavimus
```

## Pavyzdžių šablonai

### RAG pokalbių programa (Python)

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Aprašymas**: Populiariausias Azure AI pavyzdys – gamybai paruošta RAG pokalbių programa, leidžianti užduoti klausimus apie jūsų pačių dokumentus. Naudoja GPT-4.1-mini pokalbiams, text-embedding-3-large įrašams ir Azure AI Search paieškai. Palaiko multimodalius dokumentus, balso įėjimą/išėjimą, „Microsoft Entra“ autentifikaciją ir „Application Insights“ sekimą.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG pokalbių programa (.NET)

**Saugykla**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Aprašymas**: .NET/C# atitikmuo Python RAG pokalbių pavyzdžiui. Sukurta naudojant ASP.NET Core Minimal API ir Blazor WebAssembly priekinę dalį. Įtraukta balso pokalbių palaikymas, GPT-4o-mini regėjimas ir papildomas .NET MAUI Blazor Hybrid darbalaukio/mobiliojo kliento modulis.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG pokalbių programa (Java)

**Saugykla**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Aprašymas**: RAG pokalbių pavyzdžio Java versija, naudojanti Langchain4J AI orkestracijai. Palaiko mikroservisų įvykių architektūrą, kelių paieškos strategijų (tekstas, vektorius, hibridas), dokumentų įkėlimą su Azure Document Intelligence ir diegimą Azure Container Apps arba Azure Kubernetes Service.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Verslo mažmeninės prekybos padėjėjas su Azure AI Foundry

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Aprašymas**: Pilnas mažmeninės prekybos RAG padėjėjas, naudojant Azure AI Foundry ir Prompty. Contoso Outdoor mažmeninės prekybos chatbot'as, kuris grindžia atsakymus produktų katalogo ir užsakymų duomenimis. Demonstruojamas visas GenAIOps darbo srautas – prototipavimas su Prompty, vertinimas su AI palaikomais vertintojais ir diegimas per AZD į Container Apps.

**Greitas pradėjimas**:
```bash
azd init --template contoso-chat
azd up
```

### Kūrėjų rašymo daugiaagentinė programa

**Saugykla**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Paslaugos**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Aprašymas**: Daugiaagentis pavyzdys, demonstruojantis AI agentų orkestraciją su Prompty. Naudoja tyrimų agentą (Bing Grounding Azure AI Agent Service), produkto agentą (Azure AI Search), rašytojo agentą ir redaktoriaus agentą, kad bendradarbiautų ruošiant gerai ištirtus straipsnius. Įtraukia CI/CD vertinimą „GitHub Actions“.

**Greitas pradėjimas**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG pokalbių programa (JavaScript/TypeScript)

**Saugykla**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Paslaugos**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Aprašymas**: Visiškai serverless RAG chatbot'as, naudojant LangChain.js su Azure Functions API ir Azure Static Web Apps talpinimui. Naudoja Azure Cosmos DB tiek kaip vektorių saugyklą, tiek kaip pokalbių istorijos duomenų bazę. Palaiko vietinį vystymą su Ollama nemokamam testavimui.

**Greitas pradėjimas**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Pokalbis su jūsų duomenų sprendimų greitintuvas

**Saugykla**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Aprašymas**: Įmonių lygio RAG sprendimų greitintuvas su administravimo portalu dokumentų įkėlimui/valdymui, įvairių orkestratorių pasirinkimais (Semantic Kernel, LangChain, Prompt Flow), kalbos į tekstą, Microsoft Teams integracija ir galimybe rinktis PostgreSQL arba Cosmos DB duomenų bazę. Sukurta kaip pritaikoma pradžios vieta gamybos RAG scenarijams.

**Greitas pradėjimas**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI kelionių agentai – daugiaagentė MCP orkestracija

**Saugykla**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Paslaugos**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP serveriai (.NET, Python, Java, TypeScript)

**Aprašymas**: Daugiagentės AI orkestracijos atmintinė, naudojant tris karkasus (LangChain.js, LlamaIndex.TS ir Microsoft Agent Framework). Apima MCP (Model Context Protocol) serverius keturiomis kalbomis, paleistus kaip serverless Azure Container Apps su OpenTelemetry stebėsena.

**Greitas pradėjimas**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI pradžia

**Saugykla**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Paslaugos**: Azure AI paslaugos + Azure OpenAI

**Aprašymas**: Minimalus Bicep šablonas, kuris diegia Azure AI paslaugas su sukonfigūruotais mašininio mokymosi modeliais. Lengvas pradinis taškas, kai jums reikia tik Azure AI infrastruktūros be pilno taikomųjų programų paketo.

**Greitas pradėjimas**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Peržiūrėkite daugiau šablonų**: apsilankykite [Awesome AZD AI šablonų galerijoje](https://azure.github.io/awesome-azd/?tags=ai) ir raskite daugiau nei 80 AI specifinių AZD šablonų įvairioms kalboms ir scenarijams.

## Tolimesni žingsniai

1. **Išbandykite pavyzdžius**: pradėkite nuo paruošto šablono, atitinkančio jūsų naudojimo atvejį
2. **Priderinkite pagal savo poreikius**: modifikuokite infrastruktūrą ir taikomosios programos kodą
3. **Įtraukite stebėseną**: įgyvendinkite išsamų matomumą
4. **Optimizuokite išlaidas**: koreguokite konfigūracijas pagal biudžetą
5. **Užtikrinkite savo diegimą**: įgyvendinkite įmonių saugumo modelius
6. **Skalėkite gamybai**: pridėkite kelių regionų ir aukšto prieinamumo funkcijas

## 🎯 Praktinės užduotys

### Užduotis 1: Diegti „Microsoft Foundry Models“ pokalbių programą (30 min.)
**Tikslas**: Diegti ir išbandyti gamybai paruoštą AI pokalbių programą

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

# Stebėti DI operacijas
azd monitor

# Sutvarkyti po darbų
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Diegimas baigiasi be kvotų klaidų
- [ ] Galima pasiekti pokalbių sąsają naršyklėje
- [ ] Galima užduoti klausimus ir gauti AI palaikomus atsakymus
- [ ] „Application Insights“ rodo telemetrijos duomenis
- [ ] Sėkmingai išvalytos ištekliai

**Apskaičiuotos išlaidos**: 5–10 USD už 30 minučių testavimo

### Užduotis 2: Konfigūruoti daugiamodelių diegimą (45 min.)
**Tikslas**: Diegti kelis AI modelius su skirtingomis konfigūracijomis

```bash
# Sukurkite pasirinktinius Bicep nustatymus
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
- [ ] Sėkmingai įdiegta kelių modelių
- [ ] Taikyti skirtingi talpinimo nustatymai
- [ ] Modeliai prieinami per API
- [ ] Galima skambinti abiem modeliams iš programos

### Užduotis 3: Įgyvendinti išlaidų stebėseną (20 min.)
**Tikslas**: Nustatyti biudžeto įspėjimus ir išlaidų sekimą

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

# Įdiegti biudžeto įspėjimą
azd provision

# Patikrinti dabartines išlaidas
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Sėkmės kriterijai:**
- [ ] Sukurtas biudžeto įspėjimas Azure
- [ ] Konfigūruoti el. laiškų pranešimai
- [ ] Gali peržiūrėti išlaidų duomenis Azure portale
- [ ] Biudžeto slenksčiai tinkamai nustatyti

## 💡 Dažnai užduodami klausimai

<details>
<summary><strong>Kaip sumažinti „Microsoft Foundry Models“ išlaidas vystymo metu?</strong></summary>

1. **Naudokite nemokamą lygį**: „Microsoft Foundry Models“ suteikia 50 000 nemokamų žetonų per mėnesį
2. **Sumažinkite talpinimą**: nustatykite talpinimą 10 TPM vietoje 30+ vystymui
3. **Naudokite azd down**: atjungti išteklius, kai nekuriate aktyviai
4. **Naudokite talpyklą**: įgyvendinkite Redis talpyklą pasikartojančioms užklausoms
5. **Naudokite promptų inžineriją**: sumažinkite žetonų sunaudojimą efektyviais užklausimų šablonais
```bash
# Vystymo konfigūracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kuo skiriasi Microsoft Foundry modeliai nuo OpenAI API?</strong></summary>

**Microsoft Foundry modeliai**:
- Verslo lygio saugumas ir atitiktis
- Privatus tinklo integravimas
- SLA garantijos
- Valdomos tapatybės autentifikavimas
- Galimi didesni kvotų limitai

**OpenAI API**:
- Greitesnis prieinamumas naujiems modeliams
- Paprastesnis nustatymas
- Mažesnė įėjimo riba
- Tik viešasis internetas

Produktinėms programoms **rekomenduojama naudoti Microsoft Foundry modelius**.
</details>

<details>
<summary><strong>Kaip spręsti „Microsoft Foundry Models“ viršytų kvotų klaidas?</strong></summary>

```bash
# Patikrinti esamą kvotą
az cognitiveservices usage list --location eastus2

# Išbandyti kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinti talpą
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Paprašyti kvotos padidinimo
# Eiti į Azure Portalą > Kvotos > Prašyti padidinimo
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

Žr. [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šabloną.
</details>

<details>
<summary><strong>Kaip apsaugoti AI modelių galinius taškus?</strong></summary>

**Geros praktikos**:
1. Naudokite valdytą tapatybę (nereikia API raktų)
2. Įjunkite privačius galinius taškus
3. Konfigūruokite tinklo saugumo grupes
4. Įgyvendinkite užklausų ribojimą
5. Naudokite Azure Key Vault slapties duomenims

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
- **AZD GitHub**: [Klaidos ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agentų įgūdžiai**: [Microsoft Foundry įgūdis skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) – Įdiekite Azure + Foundry agentų įgūdžius savo redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyrių navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmaujanti plėtra
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI modelių diegimas](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite problemą šiame saugykloje. Azure AI + AZD bendruomenė pasiruošusi jums padėti sėkmingai!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neatsakome už jokią painiavą ar klaidingą interpretaciją, kylančią dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
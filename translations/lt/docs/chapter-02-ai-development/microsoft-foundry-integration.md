# Microsoft Foundry integracija su AZD

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmas vystymas
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI modelių diegimas](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

## Apžvalga

Šiame vadove parodyta, kaip integruoti Microsoft Foundry paslaugas su Azure Developer CLI (AZD) sklandžiam AI programų diegimui. Microsoft Foundry suteikia visapusišką platformą AI programų kūrimui, diegimui ir valdymui, o AZD supaprastina infrastruktūros ir diegimo procesą.

## Kas yra Microsoft Foundry?

Microsoft Foundry yra Microsoft vieninga platforma AI kūrimui, kuri apima:

- **Modelių katalogas**: Prieiga prie pažangių AI modelių
- **Prompt Flow**: AI darbo srautų vizualus dizaineris
- **Microsoft Foundry portalas**: Integruota AI programų kūrimo aplinka
- **Diegimo galimybės**: Daugybė talpinimo ir mastelio keitimo variantų
- **Saugumas ir atsakomybė**: Įdiegti atsakingo AI funkcionalumai

## AZD + Microsoft Foundry: Geriau kartu

| Funkcija | Microsoft Foundry | AZD integracijos nauda |
|---------|-----------------|------------------------|
| **Modelių diegimas** | Rankinis portalo diegimas | Automatizuoti, pakartojami diegimai |
| **Infrastruktūra** | Spustelėjimu valdoma paruošimas | Infrastruktūra kaip kodas (Bicep) |
| **Aplinka valdymas** | Vienos aplinkos dėmesys | Daugiaaplinkinis (dev/test/prod) |
| **CI/CD integracija** | Ribota | Natūrali GitHub Actions palaikymas |
| **Kainų valdymas** | Pagrindinė stebėsena | Aplinkai specifinė kaštų optimizacija |

## Reikalingi išankstiniai veiksmai

- Azure prenumerata su tinkamomis teisėmis
- Įdiegtas Azure Developer CLI
- Prieiga prie Microsoft Foundry Modelių paslaugų
- Pagrindinis susipažinimas su Microsoft Foundry

> **Dabartinė AZD versija:** Šie pavyzdžiai tikrinti su `azd` `1.27.1`. AI agento darbo srautui naudokite dabartinį peržiūros išplėtimo leidimą ir prieš pradėdami pasitikrinkite savo įdiegtos versijos numerį.

## Pagrindiniai integracijos modeliai

### Modelis 1: Microsoft Foundry Modelių integracija

**Naudojimo atvejis**: Skatinkite pokalbių programas su Microsoft Foundry Modelių modeliais

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

**Naudojimo atvejis**: Įdiegti atkūrimu pagrįstas generavimo (RAG) programas

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

**Gamybos konfigūracija:**
```bash
# Pagrindinės DI paslaugos
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelio konfigūracijos
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Veiklos nustatymai
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Kūrimo konfigūracija:**
```bash
# Kaina optimizuoti nustatymai vystymui
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nemokamas lygmuo
```

### Saugios konfigūracijos su Key Vault

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

### AZD išplėtimai Foundry

AZD suteikia išplėtimus, kurie prideda AI specifines galimybes dirbti su Microsoft Foundry paslaugomis:

```bash
# Įdiekite Foundry agentų plėtinį
azd extension install azure.ai.agents

# Įdiekite tikslinimo plėtinį
azd extension install azure.ai.finetune

# Įdiekite individualių modelių plėtinį
azd extension install azure.ai.models

# Išvardinkite įdiegtus plėtinius
azd extension list --installed

# Patikrinkite šiuo metu įdiegtos agentų plėtinio versijos informaciją
azd extension show azure.ai.agents
```

AI išplėtimai vis dar greitai tobulėja peržiūros režimu. Jei komanda veikia kitaip nei parodyta čia, prieš trikčių šalinimą atnaujinkite atitinkamą išplėtimą.

### Agentų pirmumo diegimas su `azd ai`

Jei turite agento manifestą, naudokite `azd ai agent init` projektui sukonstravimui su Foundry Agent Service prijungimu:

```bash
# Inicializuoti iš agento manifestacijos
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Diegti į Azure
azd up
```

Naujausiuose `azure.ai.agents` peržiūros leidimuose pridėta šabloninė inicializavimo palaika `azd ai agent init`. Sekdami naujesnius agentų pavyzdžius, pasitikrinkite išplėtimo pagalbą dėl tikslių žymų jūsų įdiegtai versijai.

Žiūrėkite [AZD AI CLI komandų](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) visą komandų sąrašą ir žymas.

### Vienos komandos diegimas

```bash
# Diegkite viską viena komanda
azd up

# Arba diegkite palaipsniui
azd provision  # Tik infrastruktūra
azd deploy     # Tik programa

# Skirta ilgai veikiančioms AI programų diegimams azd 1.23.11+
azd deploy --timeout 1800
```

### Aplinkai specifiniai diegimai

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

## Stebėsena ir stebimumas

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

### Valdomos tapatybės konfigūravimas

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

### Talpyklos strategijos

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

### Problema 1: Viršytas OpenAI kvotas

**Simptomai:**
- Diegimas nepavyksta dėl kvotos klaidų
- Programos žurnaluose daug 429 klaidų

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

### Problema 2: Autentifikacijos klaidos

**Simptomai:**
- 401/403 klaidos kreipiantis į AI paslaugas
- „Prieiga uždrausta“ pranešimai

**Sprendimai:**
```bash
# Patikrinti vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Patikrinti valdytos tapatybės konfigūraciją
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patvirtinti raktų saugyklos prieigą
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Modelių diegimo klaidos

**Simptomai:**
- Modeliai nediegiami
- Konkrečios modelio versijos nepavyksta

**Sprendimai:**
```bash
# Išvardinti prieinamus modelius pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinti modelio versiją bicep šablone
# Patikrinti modelio talpos reikalavimus
```

## Pavyzdžių šablonai

### RAG pokalbių programa (Python)

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Aprašymas**: Populiariausias Azure AI pavyzdys — gamybai paruošta RAG pokalbių programa, leidžianti užduoti klausimus apie savo dokumentus. Naudoja GPT-4.1-mini pokalbiams, text-embedding-3-large įterpimams ir Azure AI Search informacijos paieškai. Palaiko multimodalius dokumentus, kalbos įvestį/išvestį, Microsoft Entra autentifikaciją ir Application Insights sekimą.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG pokalbių programa (.NET)

**Saugykla**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Aprašymas**: .NET/C# atitikmuo Python RAG pokalbių pavyzdžiui. Sukurta su ASP.NET Core Minimal API ir Blazor WebAssembly priekiniu sluoksniu. Apima balso pokalbių funkciją, GPT-4o-mini vaizdo palaikymą ir .NET MAUI Blazor hibridinį stalinių/mobiliųjų klientą.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG pokalbių programa (Java)

**Saugykla**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Aprašymas**: RAG pokalbių pavyzdžio Java versija naudojant Langchain4J AI orkestracijai. Palaiko mikroservisų įvykių architektūrą, kelias paieškos strategijas (tekstas, vektoriai, hibridinė), dokumentų įkėlimą su Azure Document Intelligence ir diegimą Azure Container Apps arba Azure Kubernetes Service.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Įmonių mažmeninės prekybos padėjėjas su Microsoft Foundry

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Aprašymas**: Visapusiškas mažmeninės prekybos RAG padėjėjas naudojant Microsoft Foundry ir Prompty. Contoso Outdoor mažmeninės prekybos chatbotas, kuris pagrindžia atsakymus katalogo ir klientų užsakymų duomenimis. Demonstruoja pilną GenAIOps darbo srautą — prototipas su Prompty, vertinimas su AI asistuojamais evaluators ir diegimas per AZD į Container Apps.

**Greitas pradėjimas**:
```bash
azd init --template contoso-chat
azd up
```

### Kūrybinio rašymo daugiaagentinė programa

**Saugykla**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Paslaugos**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Aprašymas**: Daugiaagentinė programa, demonstruojanti AI agentų orkestraciją su Prompty. Naudoja tyrimų agentą (Bing Grounding Azure AI Agent Service), produktų agentą (Azure AI Search), rašytojo ir redaktoriaus agentus bendram gerai ištirtų straipsnių kūrimui. Įtraukta CI/CD su vertinimu GitHub Actions.

**Greitas pradėjimas**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG pokalbių programa (JavaScript/TypeScript)

**Saugykla**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Paslaugos**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Aprašymas**: Visiškai serverless RAG chatbotas naudojant LangChain.js su Azure Functions API ir Azure Static Web Apps talpinimui. Naudoja Azure Cosmos DB kaip vektorių saugyklą ir pokalbių istorijos duomenų bazę. Palaiko vietinį vystymą su Ollama nulinio kašto testavimui.

**Greitas pradėjimas**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data sprendimo pagreitinimas

**Saugykla**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Aprašymas**: Įmonių lygio RAG sprendimo pagreitinimas su administratoriaus portalu dokumentams įkelti/valdyti, keliomis orkestratorių galimybėmis (Semantic Kernel, LangChain, Prompt Flow), kalbos į tekstą palaikymu, Microsoft Teams integracija ir galimybe rinktis PostgreSQL arba Cosmos DB duomenų bazę. Sukurtas kaip individualizuojama pradinė vieta gamybos RAG scenarijams.

**Greitas pradėjimas**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI kelionių agentai — daugiaagentė MCP orkestracija

**Saugykla**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Paslaugos**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP serveriai (.NET, Python, Java, TypeScript)

**Aprašymas**: Pavyzdinė programa daugiaagentės AI orkestracijos naudojant tris karkasus (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Turi MCP (Model Context Protocol) serverius keturiomis kalbomis, diegiamus kaip serverless Azure Container Apps su OpenTelemetry stebėsena.

**Greitas pradėjimas**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI pradinukas

**Saugykla**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Paslaugos**: Azure AI paslaugos + Azure OpenAI

**Aprašymas**: Minimalus Bicep šablonas, diegiantis Azure AI paslaugas su sukonfigūruotais mašininio mokymosi modeliais. Lengva pradžia, kai reikia tik Azure AI infrastruktūros be pilnos programinės įrangos komplekto.

**Greitas pradėjimas**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Naršykite daugiau šablonų**: Aplankykite [Awesome AZD AI šablonų galeriją](https://azure.github.io/awesome-azd/?tags=ai) su daugiau nei 80 AI specifinių AZD šablonų įvairioms kalboms ir scenarijams.

## Tolimesni žingsniai

1. **Išbandykite pavyzdžius**: Pradėkite nuo iš anksto paruošto šablono, atitinkančio jūsų naudojimo atvejį
2. **Pritaikykite savo poreikiams**: Keiskite infrastruktūrą ir programos kodą
3. **Pridėkite stebėjimą**: Įgyvendinkite visapusišką stebimumą
4. **Optimizuokite kaštus**: Koreguokite konfigūracijas pagal biudžetą
5. **Saugokite diegimą**: Įgyvendinkite įmonės lygio saugumo modelius
6. **Masteliuokite gamybai**: Pridėkite daugregionės palaikymą ir didelį prieinamumą

## 🎯 Praktiniai pratimai

### Pratimas 1: Diegti Microsoft Foundry Modelių pokalbių programą (30 minučių)
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

# Stebėti DI veiklą
azd monitor

# Išvalyti
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Diegimas baigtas be kvotos klaidų
- [ ] Galima pasiekti pokalbių sąsają naršyklėje
- [ ] Gali užduoti klausimus ir gauti AI atsakymus
- [ ] Application Insights rodo telemetrijos duomenis
- [ ] Sėkmingai išvalytos resursai

**Apskaičiuotos išlaidos**: 5-10 USD už 30 minučių testavimą

### Pratimas 2: Konfigūruoti daugiamodelių diegimą (45 minutės)
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
- [ ] Keletas modelių sėkmingai įdiegta
- [ ] Taikomi skirtingi pajėgumų nustatymai
- [ ] Modeliai pasiekiami per API
- [ ] Galima kviesti abu modelius per programą

### Pratimas 3: Įgyvendinti kaštų stebėseną (20 minučių)
**Tikslas**: Nustatyti biudžeto pranešimus ir kaštų sekimą

```bash
# Pridėti biudžeto perspėjimą į Bicep
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

# Diegti biudžeto perspėjimą
azd provision

# Patikrinti dabartines išlaidas
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Sėkmės kriterijai:**
- [ ] Sukurtas biudžeto įspėjimas Azure
- [ ] Konfigūruoti el. pašto pranešimai
- [ ] Gali peržiūrėti kaštų duomenis Azure portale
- [ ] Biudžeto slenksčiai tinkamai nustatyti

## 💡 Dažniausiai užduodami klausimai

<details>
<summary><strong>Kaip sumažinti Microsoft Foundry Modelių kaštus kūrimo metu?</strong></summary>

1. **Naudokite nemokamą lygį**: Microsoft Foundry Modeliai suteikia 50 000 žetonų/mėn. nemokamai
2. **Sumažinkite pajėgumą**: Nustatykite pajėgumą iki 10 TPM vietoje 30+ kūrimui
3. **Naudokite azd down**: Atlaisvinkite resursus, kai neveikiate aktyviai
4. **Talpinkite atsakymus**: Įdiekite Redis talpyklą pasikartojančioms užklausoms
5. **Naudokite promptų inžineriją**: Sumažinkite žetonų naudojimą efektyviais užklausimais


```bash
# Kūrimo konfigūracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kuo skiriasi Microsoft Foundry modeliai nuo OpenAI API?</strong></summary>

**Microsoft Foundry modeliai**:
- Įmonių saugumas ir atitiktis
- Privataus tinklo integracija
- SLA garantijos
- Valdomas identiteto autentifikavimas
- Galima didesnė kvota

**OpenAI API**:
- Greitesnė prieiga prie naujų modelių
- Paprastesnis nustatymas
- Mažesnis įėjimo barjeras
- Tik viešas internetas

Produkciniams programoms **rekomenduojami Microsoft Foundry modeliai**.
</details>

<details>
<summary><strong>Kaip tvarkyti klaidas dėl viršytos Microsoft Foundry modelių kvotos?</strong></summary>

```bash
# Patikrinkite dabartinę kvotą
az cognitiveservices usage list --location eastus2

# Išbandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinkite pajėgumą
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Paprašykite kvotos padidinimo
# Eikite į Azure portalą > Kvotos > Paprašyti padidinimo
```
</details>

<details>
<summary><strong>Ar galiu naudoti savo duomenis su Microsoft Foundry modeliais?</strong></summary>

Taip! Naudokite **Azure AI Search** RAG (Retrieval Augmented Generation) tikslams:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Žiūrėkite [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šabloną.
</details>

<details>
<summary><strong>Kaip užtikrinti AI modelių galinių taškų saugumą?</strong></summary>

**Geriausios praktikos**:
1. Naudokite valdomą identitetą (nereikia API raktų)
2. Įjunkite privačius galinius taškus
3. Sukonfigūruokite tinklo saugumo grupes
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
- **AZD GitHub**: [Klaidos ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agentų įgūdžiai**: [Microsoft Foundry įgūdis skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Įdiekite Azure + Foundry agentų įgūdžius savo redaktoriuje naudodami `npx skills add microsoft/github-copilot-for-azure`

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmumo vystymas
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmas projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI modelių diegimas](ai-model-deployment.md)
- **🚀 Sekantis skyrius**: [3 skyrius: Konfigūravimas](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite problemą saugykloje. Azure AI + AZD bendruomenė yra čia, kad padėtų jums sėkmingai! 

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry integracija su AZD

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmasis vystymas
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../getting-started/first-project.md)
- **➡️ Toliau**: [AI modelio diegimas](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

## Apžvalga

Šiame vadove parodoma, kaip integruoti Microsoft Foundry paslaugas su Azure Developer CLI (AZD), siekiant supaprastinti AI programų diegimą. Microsoft Foundry siūlo išsamų platformą AI programų kūrimui, diegimui ir valdymui, o AZD palengvina infrastruktūros ir diegimo procesą.

## Kas yra Microsoft Foundry?

Microsoft Foundry yra vieninga Microsoft platforma AI vystymui, kuri apima:

- **Modelių katalogą**: Prieiga prie pažangiausių AI modelių
- **Prompt Flow**: Vizualinis AI darbo eigų dizaineris
- **AI Foundry portalą**: Integruota vystymo aplinka AI programoms
- **Diegimo galimybes**: Įvairūs talpinimo ir mastelio keitimo variantai
- **Saugumą ir patikimumą**: Integruotos atsakingo AI funkcijos

## AZD + Microsoft Foundry: geriau kartu

| Funkcija | Microsoft Foundry | AZD integracijos privalumas |
|----------|-------------------|----------------------------|
| **Modelio diegimas** | Rankinis portalo diegimas | Automatizuoti, pakartojami diegimai |
| **Infrastruktūra** | Pasirinkimų peržiūra | Infrastruktūra kaip kodas (Bicep) |
| **Aplinkos valdymas** | Vienos aplinkos dėmesys | Daugiaaplinkos (dev/staging/prod) |
| **CI/CD integracija** | Ribota | Natūrali GitHub Actions palaikymas |
| **Kaštų valdymas** | Pagrindinis stebėjimas | Aplinkai specifinis kaštų optimizavimas |

## Būtinos sąlygos

- Azure prenumerata su tinkamais leidimais
- Įdiegtas Azure Developer CLI
- Prieiga prie Azure OpenAI paslaugų
- Pagrindinės žinios apie Microsoft Foundry

## Pagrindiniai integracijos modeliai

### Modelis 1: Azure OpenAI integracija

**Naudojimo atvejis**: Diegti pokalbių programas su Azure OpenAI modeliais

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

### Modelis 2: AI paieška + RAG integracija

**Naudojimo atvejis**: Diegti paieškos papildytos generacijos (RAG) programas

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

## 🔧 Konfigūracijos modeliai

### Aplinkos kintamųjų nustatymas

**Produkcijos konfigūracija:**
```bash
# Pagrindinės AI paslaugos
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modelio konfigūracijos
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Našumo nustatymai
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Vystymo konfigūracija:**
```bash
# Optimizuotos išlaidos kūrimui
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

## Diegimo darbo eigos

### Vieno komandos diegimas

```bash
# Viską įdiegti vienu komandu
azd up

# Arba diegti palaipsniui
azd provision  # Tik infrastruktūra
azd deploy     # Tik aplikacija
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

## Stebėjimas ir stebimumas

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

### Kaštų stebėjimas

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

## Našumo optimizavimas

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

### Problema 1: OpenAI kvotos viršijimas

**Simptomai:**
- Diegimas nepavyksta dėl kvotos klaidų
- 429 klaidos programos žurnaluose

**Sprendimai:**
```bash
# Patikrinkite dabartinį kvotos naudojimą
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
- 401/403 klaidos, kai kviečiamos AI paslaugos
- „Prieiga uždrausta“ pranešimai

**Sprendimai:**
```bash
# Patikrinkite vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Patikrinkite valdomos tapatybės konfigūraciją
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Patvirtinkite prieigą prie Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Modelio diegimo problemos

**Simptomai:**
- Modeliai nėra prieinami diegime
- Konkretūs modelio versijos nepavyksta

**Sprendimai:**
```bash
# Išvardykite galimus modelius pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinkite modelio versiją bicep šablone
# Patikrinkite modelio pajėgumo reikalavimus
```

## Pavyzdiniai šablonai

### Pagrindinė pokalbių programa

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Cognitive Search + App Service

**Greitas startas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentų apdorojimo procesas

**Saugykla**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Paslaugos**: Dokumentų intelektas + Saugykla + Funkcijos

**Greitas startas**:
```bash
azd init --template ai-document-processing
azd up
```

### Įmonės pokalbis su RAG

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Paieška + Konteinerių programos + Cosmos DB

**Greitas startas**:
```bash
azd init --template contoso-chat
azd up
```

## Kiti žingsniai

1. **Išbandykite pavyzdžius**: Pradėkite nuo iš anksto paruošto šablono, kuris atitinka jūsų naudojimo atvejį
2. **Pritaikykite savo poreikiams**: Modifikuokite infrastruktūrą ir programos kodą
3. **Pridėkite stebėjimą**: Įgyvendinkite išsamų stebimumą
4. **Optimizuokite kaštus**: Koreguokite konfigūracijas pagal savo biudžetą
5. **Užtikrinkite diegimo saugumą**: Įgyvendinkite įmonės saugumo modelius
6. **Mastelio keitimas iki produkcijos**: Pridėkite daugiaregionines ir aukšto prieinamumo funkcijas

## 🎯 Praktinės užduotys

### Užduotis 1: Diegti Azure OpenAI pokalbių programą (30 minučių)
**Tikslas**: Diegti ir išbandyti produkcijai paruoštą AI pokalbių programą

```bash
# Inicializuoti šabloną
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nustatyti aplinkos kintamuosius
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Diegti
azd up

# Testuoti programą
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Stebėti AI operacijas
azd monitor

# Išvalyti
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Diegimas baigtas be kvotos klaidų
- [ ] Galima pasiekti pokalbių sąsają naršyklėje
- [ ] Galima užduoti klausimus ir gauti AI atsakymus
- [ ] Application Insights rodo telemetrijos duomenis
- [ ] Sėkmingai išvalyti resursai

**Numatoma kaina**: $5-10 už 30 minučių testavimo

### Užduotis 2: Konfigūruoti daugelio modelių diegimą (45 minutės)
**Tikslas**: Diegti kelis AI modelius su skirtingomis konfigūracijomis

```bash
# Sukurkite pasirinktinius Bicep konfigūraciją
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

# Įdiegti ir patikrinti
azd provision
azd show
```

**Sėkmės kriterijai:**
- [ ] Keli modeliai sėkmingai įdiegti
- [ ] Taikytos skirtingos pajėgumo nustatymo konfigūracijos
- [ ] Modeliai pasiekiami per API
- [ ] Galima kviesti abu modelius iš programos

### Užduotis 3: Įgyvendinti kaštų stebėjimą (20 minučių)
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

# Įdiegti biudžeto įspėjimą
azd provision

# Patikrinti dabartines išlaidas
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Sėkmės kriterijai:**
- [ ] Sukurtas biudžeto įspėjimas Azure
- [ ] Suaktyvinti el. pašto pranešimai
- [ ] Galima peržiūrėti kaštų duomenis Azure portale
- [ ] Tinkamai nustatyti biudžeto slenksčiai

## 💡 Dažniausiai užduodami klausimai

<details>
<summary><strong>Kaip sumažinti Azure OpenAI kaštus vystymo metu?</strong></summary>

1. **Naudokite nemokamą planą**: Azure OpenAI siūlo 50,000 žetonų/mėn nemokamai
2. **Sumažinkite pajėgumą**: Nustatykite pajėgumą iki 10 TPM vietoj 30+ vystymui
3. **Naudokite azd down**: Išjunkite resursus, kai aktyviai nevystote
4. **Talpyklos atsakymai**: Įgyvendinkite Redis talpyklą pasikartojantiems užklausoms
5. **Prompt Engineering**: Sumažinkite žetonų naudojimą efektyviais užklausų tekstais

```bash
# Kūrimo konfigūracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kuo skiriasi Azure OpenAI ir OpenAI API?</strong></summary>

**Azure OpenAI**:
- Įmonės saugumas ir atitiktis
- Privataus tinklo integracija
- SLA garantijos
- Valdomos tapatybės autentifikacija
- Galimos didesnės kvotos

**OpenAI API**:
- Greitesnė prieiga prie naujų modelių
- Paprastesnis nustatymas
- Mažesnė įėjimo barjera
- Tik viešasis internetas

Produkcijos programoms **rekomenduojama Azure OpenAI**.
</details>

<details>
<summary><strong>Kaip spręsti Azure OpenAI kvotos viršijimo klaidas?</strong></summary>

```bash
# Patikrinkite dabartinę kvotą
az cognitiveservices usage list --location eastus2

# Pabandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up

# Laikinai sumažinkite pajėgumą
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Pateikite prašymą padidinti kvotą
# Eikite į Azure Portal > Kvotos > Prašyti padidinimo
```
</details>

<details>
<summary><strong>Ar galiu naudoti savo duomenis su Azure OpenAI?</strong></summary>

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

Žiūrėkite [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šabloną.
</details>

<details>
<summary><strong>Kaip užtikrinti AI modelių galinių taškų saugumą?</strong></summary>

**Geriausios praktikos**:
1. Naudokite valdomą tapatybę (be API raktų)
2. Įgalinkite privačius galinius taškus
3. Konfigūruokite tinklo saugumo grupes
4. Įgyvendinkite užklausų ribojimą
5. Naudokite Azure Key Vault slaptažodžiams

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
- **AZD GitHub**: [Problemos ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmasis vystymas
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../getting-started/first-project.md)
- **➡️ Toliau**: [AI modelio diegimas](ai-model-deployment.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite problemą saugykloje. Azure AI + AZD bendruomenė pasiruošusi padėti jums pasiekti sėkmę!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
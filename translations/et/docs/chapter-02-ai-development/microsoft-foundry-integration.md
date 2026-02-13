# Microsoft Foundry Integratsioon AZD-iga

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD For Beginners](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Ülevaade

See juhend demonstreerib, kuidas integreerida Microsoft Foundry teenuseid Azure Developer CLI (AZD) abil sujuvamate AI-rakenduste juurutuste jaoks. Microsoft Foundry pakub kõikehõlmavat platvormi AI-rakenduste ehitamiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab taristu ja juurutusprotsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne platvorm AI-arenduseks, mis sisaldab:

- **Mudeli kataloog**: Juurdepääs tipptasemel AI-mudelitele
- **Prompt Flow**: Visuaalne disainer AI-töövoogude jaoks
- **AI Foundry Portal**: Integreeritud arenduskeskkond AI-rakendustele
- **Juurutusvõimalused**: Mitmed hostimise ja skaleerimise valikud
- **Turvalisus ja kaitse**: Sisseehitatud vastutustundlikud AI-funktsioonid

## AZD + Microsoft Foundry: Paremad koos

| Omadus | Microsoft Foundry | AZD integratsiooni eelis |
|---------|-----------------|------------------------|
| **Mudeli juurutamine** | Portaalis käsitsi juurutamine | Automatiseeritud, korduvkasutatavad juurutused |
| **Taristu** | Klõpsuga provisjonimine | Taristu koodina (Bicep) |
| **Keskkondade haldamine** | Ühe keskkonna fookus | Mitme keskkonna tugi (dev/staging/prod) |
| **CI/CD integratsioon** | Piiratud | Sisseehitatud GitHub Actions'i tugi |
| **Kulu haldus** | Põhiline jälgimine | Keskkonnapõhine kuluoptimeerimine |

## Eeltingimused

- Azure tellimus sobivate õigustega
- Azure Developer CLI paigaldatud
- Juurdepääs Azure OpenAI teenustele
- Põhiteadmised Microsoft Foundry'st

## Põhilised integreerimismustrid

### Muster 1: Azure OpenAI integratsioon

**Kasutusjuhtum**: Vestlusrakenduste juurutamine Azure OpenAI mudelitega

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

**Taristu (main.bicep):**
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

### Muster 2: AI Search + RAG integratsioon

**Kasutusjuhtum**: Juurutada RAG (retrieval-augmented generation) rakendusi

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

### Muster 3: Document Intelligence integratsioon

**Kasutusjuhtum**: Dokumentide töötlemise ja analüüsi töövood

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

## 🔧 Konfiguratsiooni mustrid

### Keskkonnamuutujate seadistamine

**Tootmiskonfiguratsioon:**
```bash
# Põhitehisintellekti teenused
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mudeli konfiguratsioonid
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Jõudluse seaded
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Arenduskonfiguratsioon:**
```bash
# Kuluoptimeeritud seaded arenduseks
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tasuta tase
```

### Key Vaulti abil turvaline konfiguratsioon

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

## Juurutuse töövood

### Ühe käsu juurutus

```bash
# Paigalda kõik ühe käsuga
azd up

# Või paigalda sammhaaval
azd provision  # Ainult infrastruktuur
azd deploy     # Ainult rakendus
```

### Keskkonnapõhised juurutused

```bash
# Arenduskeskkond
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Tootmiskeskkond
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Jälgimine ja jälgitavus

### Application Insightsi integratsioon

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

### Kulude jälgimine

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

## 🔐 Turvalisuse parimad tavad

### Hallatud identiteedi konfiguratsioon

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

### Võrgu turvalisus

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

## Jõudluse optimeerimine

### Vahemällu salvestamise strateegiad

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

### Automaatskaalamise konfiguratsioon

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

## Levinumate probleemide tõrkeotsing

### Probleem 1: OpenAI kvota ületatud

**Sümptomid:**
- Juurutus ebaõnnestub kvota vigade tõttu
- Rakenduse logides 429 vead

**Lahendused:**
```bash
# Kontrolli praegust limiidi kasutust
az cognitiveservices usage list --location eastus

# Proovi teist regiooni
azd env set AZURE_LOCATION westus2
azd up

# Vähenda mahtu ajutiselt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Autentimisvead

**Sümptomid:**
- 401/403 vead AI-teenustele helistamisel
- "Access denied" sõnumid

**Lahendused:**
```bash
# Kontrolli rolli määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrolli hallatava identiteedi konfiguratsiooni
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Kinnita Key Vaulti juurdepääs
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Mudeli juurutamise probleemid

**Sümptomid:**
- Mudelid ei ole juurutuses saadaval
- Konkreetsed mudeliversioonid ebaõnnestuvad

**Lahendused:**
```bash
# Loetle regiooni kaupa saadaval olevad mudelid
az cognitiveservices model list --location eastus

# Uuenda mudeli versiooni Bicep-mallis
# Kontrolli mudeli mahunõudeid
```

## Näidismallid

### Põhiline vestlusrakendus

**Repositoorium**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Cognitive Search + App Service

**Kiire alustamine**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumenditöötluse töövoog

**Repositoorium**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Teenused**: Document Intelligence + Storage + Functions

**Kiire alustamine**:
```bash
azd init --template ai-document-processing
azd up
```

### Ettevõtte vestlus koos RAG-iga

**Repositoorium**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Kiire alustamine**:
```bash
azd init --template contoso-chat
azd up
```

## Järgmised sammud

1. **Proovi näiteid**: Alusta valmis malliga, mis vastab sinu kasutusjuhtumile
2. **Kohanda vastavalt vajadustele**: Muuda taristut ja rakenduse koodi
3. **Lisa jälgimine**: Vii sisse terviklik jälgitavus
4. **Optimeeri kulusid**: Häälesta konfiguratsioonid vastavalt eelarvele
5. **Tõhusta juurutuse turvalisust**: Rakenda ettevõtte taseme turvamustrid
6. **Skaala tootmisse**: Lisa mitmeregioonilised ja suure kättesaadavusega funktsioonid

## 🎯 Praktilised harjutused

### Harjutus 1: Juuruta Azure OpenAI vestlusrakendus (30 minutit)
**Eesmärk**: Juurutada ja testida tootmiskõlblikku AI-vestlusrakendust

```bash
# Initsialiseeri mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Määra keskkonnamuutujad
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Juuruta
azd up

# Testi rakendust
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Jälgi tehisintellekti toiminguid
azd monitor

# Puhasta
azd down --force --purge
```

**Õnnestumise kriteeriumid:**
- [ ] Juurutus lõpeb ilma kvota vigadeta
- [ ] Juurdepääs vestlusliidesele brauseris
- [ ] Võib esitada küsimusi ja saada AI-põhiseid vastuseid
- [ ] Application Insights kuvab telemeetriaandmeid
- [ ] Ressursid puhastati edukalt

**Hinnanguline kulu**: $5-10 30-minutilise testimise eest

### Harjutus 2: Konfigureeri mitme mudeliga juurutus (45 minutit)
**Eesmärk**: Juurutada mitu AI-mudelit erinevate konfiguratsioonidega

```bash
# Loo kohandatud Bicep konfiguratsioon
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

# Paigalda ja kontrolli
azd provision
azd show
```

**Õnnestumise kriteeriumid:**
- [ ] Mitu mudelit õnnestunult juurutatud
- [ ] Rakendatud erinevad võimsusseaded
- [ ] Mudelitele pääseb API kaudu
- [ ] Rakendusest saab kutsuda mõlemat mudelit

### Harjutus 3: Rakenda kulude jälgimine (20 minutit)
**Eesmärk**: Seadistada eelarvehoiatused ja kulude jälgimine

```bash
# Lisa eelarvehoiatus Bicepi jaoks
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

# Paigalda eelarvehoiatus
azd provision

# Kontrolli praeguseid kulusid
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Õnnestumise kriteeriumid:**
- [ ] Eelarvehoiatus loodud Azure'is
- [ ] E-posti teavitused seadistatud
- [ ] Kuluandmeid saab vaadata Azure'i portaalis
- [ ] Eelarve läved õigesti määratud

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Kuidas vähendada Azure OpenAI kulusid arenduse ajal?</strong></summary>

1. **Kasuta tasuta taset**: Azure OpenAI pakub 50,000 tokenit/kuus tasuta
2. **Vähenda mahtu**: Seadista maht arenduseks 10 TPM asemel 30+
3. **Use azd down**: Eemalda ressursid, kui ei arendata aktiivselt
4. **Vahemälu vastuseid**: Rakenda Redis-vahemälu korduvate päringute jaoks
5. **Kasuta prompti insenerindust**: Vähenda tokenite kasutust tõhusate promptidega

```bash
# Arenduskeskkonna konfiguratsioon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mis vahe on Azure OpenAI ja OpenAI API vahel?</strong></summary>

**Azure OpenAI**:
- Ettevõtte tase turvalisus ja nõuetele vastavus
- Privaatvõrgu integratsioon
- SLA-garantii
- Hallatud identiteediga autentimine
- Kättesaadavad kõrgemad kvotad

**OpenAI API**:
- Kiirem ligipääs uutele mudelitele
- Lihtsam seadistus
- Madalam sisenemisbarjäär
- Ainult avalik internet

Tootmiskasutuste puhul on soovitatav **Azure OpenAI**.
</details>

<details>
<summary><strong>Kuidas käsitleda Azure OpenAI kvota ületamise vigu?</strong></summary>

```bash
# Kontrolli praegust limiiti
az cognitiveservices usage list --location eastus2

# Proovi teist regiooni
azd env set AZURE_LOCATION westus2
azd up

# Vähenda mahtu ajutiselt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Taotle limiidi suurendamist
# Minge Azure'i portaali > Kvotid > Taotle suurendamist
```
</details>

<details>
<summary><strong>Kas ma saan kasutada oma andmeid Azure OpenAI-ga?</strong></summary>

Jah! Kasuta **Azure AI Search** RAG-i jaoks (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vaata [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) malli.
</details>

<details>
<summary><strong>Kuidas ma kaitsen AI-mudeli lõpp-punkte?</strong></summary>

**Parimad tavad**:
1. Kasuta hallatud identiteeti (ilma API-võtmeteta)
2. Luba privaatseid lõpp-punkte
3. Konfigureeri võrgu turvagrupid
4. Rakenda päringute piiramist
5. Kasuta Azure Key Vaulti saladuste hoidmiseks

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

## Kogukond ja tugi

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleemid ja arutelud](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Ametlik dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD For Beginners](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Abi vaja?** Liitu meie kogukonna aruteludega või ava teema repositooriumis. Azure AI + AZD kogukond on siin, et aidata sul õnnestuda!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
Seda dokumenti on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse või valesti tõlgendamise eest, mis tuleneb selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
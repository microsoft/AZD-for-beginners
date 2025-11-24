<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-24T15:32:17+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "et"
}
-->
# Microsoft Foundry integreerimine AZD-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Sinu esimene projekt](../getting-started/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

## Ülevaade

See juhend näitab, kuidas integreerida Microsoft Foundry teenuseid Azure Developer CLI-ga (AZD), et lihtsustada AI-rakenduste juurutamist. Microsoft Foundry pakub terviklikku platvormi AI-rakenduste loomiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab infrastruktuuri ja juurutusprotsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne AI-arenduse platvorm, mis sisaldab:

- **Mudelikataloog**: Juurdepääs tipptasemel AI-mudelitele
- **Prompt Flow**: Visuaalne disainer AI-töövoogude jaoks
- **AI Foundry portaal**: Integreeritud arenduskeskkond AI-rakendustele
- **Juurutusvõimalused**: Mitmekesised hostimise ja skaleerimise valikud
- **Ohutus ja turvalisus**: Sisseehitatud vastutustundliku AI funktsioonid

## AZD + Microsoft Foundry: Koos paremad

| Funktsioon | Microsoft Foundry | AZD integreerimise eelis |
|------------|-------------------|--------------------------|
| **Mudeli juurutamine** | Käsitsi portaali kaudu | Automatiseeritud, korduvkasutatavad juurutused |
| **Infrastruktuur** | Klõpsuga seadistamine | Infrastructure as Code (Bicep) |
| **Keskkonna haldamine** | Üks keskkond | Mitmekeskkond (arendus/testimine/tootmine) |
| **CI/CD integreerimine** | Piiratud | Loomulik GitHub Actions tugi |
| **Kulude haldamine** | Põhiline jälgimine | Keskkonnaspetsiifiline kulude optimeerimine |

## Eeltingimused

- Azure'i tellimus koos sobivate õigustega
- Azure Developer CLI paigaldatud
- Juurdepääs Azure OpenAI teenustele
- Põhiteadmised Microsoft Foundry kohta

## Põhilised integreerimismustrid

### Muster 1: Azure OpenAI integreerimine

**Kasutusjuht**: Vestlusrakenduste juurutamine Azure OpenAI mudelitega

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

**Infrastruktuur (main.bicep):**
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

### Muster 2: AI otsing + RAG integreerimine

**Kasutusjuht**: RAG (Retrieval-Augmented Generation) rakenduste juurutamine

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

### Muster 3: Dokumendiintelligentsuse integreerimine

**Kasutusjuht**: Dokumentide töötlemise ja analüüsi töövood

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

## 🔧 Konfiguratsioonimustrid

### Keskkonnamuutujate seadistamine

**Tootmiskonfiguratsioon:**
```bash
# Põhilised AI teenused
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

**Arenduskeskkonna konfiguratsioon:**
```bash
# Kulude optimeeritud seaded arenduseks
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tasuta tase
```

### Turvaline konfiguratsioon Key Vaultiga

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

## Juurutusvood

### Ühe käsuga juurutamine

```bash
# Paigalda kõik ühe käsuga
azd up

# Või paigalda järk-järgult
azd provision  # Ainult infrastruktuur
azd deploy     # Ainult rakendus
```

### Keskkonnaspetsiifilised juurutused

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

## Jälgimine ja nähtavus

### Application Insights integreerimine

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

### Võrguturvalisus

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

### Vahemälu strateegiad

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

### Automaatse skaleerimise konfiguratsioon

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

## Levinud probleemide tõrkeotsing

### Probleem 1: OpenAI kvoot ületatud

**Sümptomid:**
- Juurutamine ebaõnnestub kvoodivigadega
- 429 vead rakenduse logides

**Lahendused:**
```bash
# Kontrolli praegust kvoodi kasutust
az cognitiveservices usage list --location eastus

# Proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up

# Vähenda ajutiselt võimsust
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Autentimisvead

**Sümptomid:**
- 401/403 vead AI-teenuste kutsumisel
- "Juurdepääs keelatud" teated

**Lahendused:**
```bash
# Kontrolli rollide määramist
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrolli hallatud identiteedi konfiguratsiooni
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Kinnita Key Vaulti juurdepääs
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Mudeli juurutamise probleemid

**Sümptomid:**
- Mudeleid pole juurutuses saadaval
- Konkreetsete mudeliversioonide tõrked

**Lahendused:**
```bash
# Loetle saadaval olevad mudelid piirkonna järgi
az cognitiveservices model list --location eastus

# Uuenda mudeli versiooni bicep mallis
# Kontrolli mudeli mahutavuse nõudeid
```

## Näidismallid

### Põhiline vestlusrakendus

**Hoidla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Cognitive Search + App Service

**Kiirstart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumenditöötluse torujuhe

**Hoidla**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Teenused**: Dokumendiintelligentsus + Salvestus + Funktsioonid

**Kiirstart**:
```bash
azd init --template ai-document-processing
azd up
```

### Ettevõtte vestlus RAG-iga

**Hoidla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Otsing + Konteinerirakendused + Cosmos DB

**Kiirstart**:
```bash
azd init --template contoso-chat
azd up
```

## Järgmised sammud

1. **Proovi näiteid**: Alusta eelvalmistatud malliga, mis sobib sinu kasutusjuhtumiga
2. **Kohanda oma vajadustele**: Muuda infrastruktuuri ja rakenduse koodi
3. **Lisa jälgimine**: Rakenda põhjalik nähtavus
4. **Optimeeri kulusid**: Kohanda konfiguratsioone oma eelarvele vastavaks
5. **Turva oma juurutus**: Rakenda ettevõtte turvamustrid
6. **Skaleeri tootmisesse**: Lisa mitme piirkonna ja kõrge kättesaadavuse funktsioonid

## 🎯 Praktilised harjutused

### Harjutus 1: Azure OpenAI vestlusrakenduse juurutamine (30 minutit)
**Eesmärk**: Juurutada ja testida tootmiskõlblik AI vestlusrakendus

```bash
# Algata mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Määra keskkonnamuutujad
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Paigalda
azd up

# Testi rakendust
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Jälgi AI toiminguid
azd monitor

# Puhasta
azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Juurutamine lõpeb ilma kvoodivigadeta
- [ ] Vestlusliides on brauseris ligipääsetav
- [ ] Küsimuste esitamine ja AI-vastuste saamine töötab
- [ ] Application Insights kuvab telemeetria andmeid
- [ ] Ressursid on edukalt puhastatud

**Hinnanguline kulu**: $5-10 30 minuti testimise eest

### Harjutus 2: Mitme mudeli juurutamise seadistamine (45 minutit)
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

**Edu kriteeriumid:**
- [ ] Mitu mudelit on edukalt juurutatud
- [ ] Rakendatud on erinevad võimsusseaded
- [ ] Mudelid on API kaudu ligipääsetavad
- [ ] Rakendus saab kutsuda mõlemat mudelit

### Harjutus 3: Kulude jälgimise rakendamine (20 minutit)
**Eesmärk**: Seadistada eelarvehoiatused ja kulude jälgimine

```bash
# Lisa eelarve hoiatus Bicepisse
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

# Paigalda eelarve hoiatus
azd provision

# Kontrolli praeguseid kulusid
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Edu kriteeriumid:**
- [ ] Azure'is on loodud eelarvehoiatus
- [ ] E-posti teavitused on seadistatud
- [ ] Kulude andmeid saab vaadata Azure'i portaalis
- [ ] Eelarvepiirangud on sobivalt seadistatud

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Kuidas vähendada Azure OpenAI kulusid arenduse ajal?</strong></summary>

1. **Kasuta tasuta taset**: Azure OpenAI pakub 50 000 tokenit/kuus tasuta
2. **Vähenda võimsust**: Seadista võimsus 10 TPM-ile, mitte 30+ arenduse jaoks
3. **Kasuta azd down**: Deaktiveeri ressursid, kui neid aktiivselt ei kasutata
4. **Vahemälu vastused**: Rakenda Redis vahemälu korduvate päringute jaoks
5. **Kasuta prompt engineering'ut**: Vähenda tokenite kasutust tõhusate promptidega

```bash
# Arenduse konfiguratsioon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mis vahe on Azure OpenAI ja OpenAI API-l?</strong></summary>

**Azure OpenAI**:
- Ettevõtte turvalisus ja vastavusnõuded
- Privaatvõrgu integreerimine
- SLA garantiid
- Hallatud identiteedi autentimine
- Kõrgemad kvoodid saadaval

**OpenAI API**:
- Kiirem juurdepääs uutele mudelitele
- Lihtsam seadistamine
- Madalam sisenemisbarjäär
- Ainult avalik internet

Tootmisrakenduste jaoks on **soovitatav Azure OpenAI**.
</details>

<details>
<summary><strong>Kuidas käsitleda Azure OpenAI kvoodi ületamise vigu?</strong></summary>

```bash
# Kontrolli praegust kvooti
az cognitiveservices usage list --location eastus2

# Proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up

# Vähenda ajutiselt mahtu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Taotle kvoodi suurendamist
# Mine Azure portaal > Kvoodid > Taotle suurendamist
```
</details>

<details>
<summary><strong>Kas ma saan kasutada oma andmeid Azure OpenAI-ga?</strong></summary>

Jah! Kasuta **Azure AI Search** RAG-i (Retrieval Augmented Generation) jaoks:

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
<summary><strong>Kuidas turvata AI mudeli lõpp-punkte?</strong></summary>

**Parimad tavad**:
1. Kasuta hallatud identiteeti (ilma API võtmeteta)
2. Luba privaatlõpp-punktid
3. Konfigureeri võrgu turvagrupid
4. Rakenda kiirusepiirangud
5. Kasuta Azure Key Vaulti saladuste jaoks

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

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleemid ja arutelud](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Ametlik dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Sinu esimene projekt](../getting-started/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

**Vajad abi?** Liitu meie kogukonna aruteludega või ava probleem hoidlas. Azure AI + AZD kogukond on siin, et aidata sul edu saavutada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
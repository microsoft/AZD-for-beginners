# Integracija Microsoft Foundry z AZD

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen v AI
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Uvajanje AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ta vodič prikazuje, kako integrirati storitve Microsoft Foundry z Azure Developer CLI (AZD) za poenostavljeno uvajanje AI aplikacij. Microsoft Foundry ponuja celovito platformo za gradnjo, uvajanje in upravljanje AI aplikacij, medtem ko AZD poenostavi infrastrukturo in postopek uvajanja.

## Kaj je Microsoft Foundry?

Microsoft Foundry je Microsoftova združena platforma za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do najsodobnejših AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne tokove
- **AI Foundry Portal**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti uvajanja**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovorne uporabe AI

## AZD + Microsoft Foundry: Bolje skupaj

| Funkcija | Microsoft Foundry | Prednost integracije z AZD |
|---------|-----------------|------------------------|
| **Uvajanje modela** | Ročno uvajanje prek portala | Avtomatizirana, ponovljiva uvajanja |
| **Infrastruktura** | Nastavitev s klikom | Infrastruktura kot koda (Bicep) |
| **Upravljanje okolij** | Osredotočeno na eno okolje | Več okolij (dev/staging/prod) |
| **CI/CD integracija** | Omejena | Izvorna podpora za GitHub Actions |
| **Upravljanje stroškov** | Osnovno spremljanje | Optimizacija stroškov po okoljih |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Namestljen Azure Developer CLI
- Dostop do storitev Azure OpenAI
- Osnovno poznavanje Microsoft Foundry

## Osnovni vzorci integracije

### Vzorec 1: Integracija Azure OpenAI

**Uporabniški primer**: Uvajanje klepetalnih aplikacij z modeli Azure OpenAI

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

### Vzorec 2: Integracija iskanja AI + RAG

**Uporabniški primer**: Uvajanje aplikacij RAG (retrieval-augmented generation)

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

### Vzorec 3: Integracija Document Intelligence

**Uporabniški primer**: Delovni tokovi za obdelavo in analizo dokumentov

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

## 🔧 Vzorci konfiguracije

### Nastavitev spremenljivk okolja

**Konfiguracija za produkcijo:**
```bash
# Jedrne AI storitve
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modelov
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavitve zmogljivosti
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracija za razvoj:**
```bash
# Nastavitve, optimizirane glede na stroške za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Brezplačna raven
```

### Varna konfiguracija z Key Vault

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

## Delovni tokovi uvajanja

### Uvajanje z enim ukazom

```bash
# Razporedi vse z enim ukazom
azd up

# Ali razporedi postopoma
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija
```

### Uvajanja specifična za okolje

```bash
# Razvojno okolje
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkcijsko okolje
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Spremljanje in opazovanje

### Integracija Application Insights

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

### Spremljanje stroškov

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

## 🔐 Najboljše varnostne prakse

### Konfiguracija upravljane identitete

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

### Omrežna varnost

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

## Optimizacija zmogljivosti

### Strategije predpomnjenja

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

### Konfiguracija samodejnega skaliranja

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

## Odpravljanje pogostih težav

### Težava 1: Presežena kvota OpenAI

**Simptomi:**
- Uvajanje spodleti zaradi napak kvote
- Napake 429 v dnevnikih aplikacije

**Rešitve:**
```bash
# Preverite trenutno uporabo kvote
az cognitiveservices usage list --location eastus

# Poskusite drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjšajte zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Težava 2: Napake pri overjanju

**Simptomi:**
- Napake 401/403 pri klicanju storitev AI
- "Dostop zavrnjen" sporočila

**Rešitve:**
```bash
# Preveri dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Preveri konfiguracijo upravljane identitete
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Preveri dostop do Key Vaulta
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Težava 3: Težave pri uvajanju modelov

**Simptomi:**
- Modeli niso na voljo v uvajanju
- Določene različice modelov ne delujejo

**Rešitve:**
```bash
# Prikažite razpoložljive modele po regijah
az cognitiveservices model list --location eastus

# Posodobite različico modela v predlogi Bicep
# Preverite zahteve glede zmogljivosti modela
```

## Primeri predlog

### Osnovna klepetalna aplikacija

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Cognitive Search + App Service

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Cevovod za obdelavo dokumentov

**Repozitorij**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Storitve**: Document Intelligence + Storage + Functions

**Hiter začetek**:
```bash
azd init --template ai-document-processing
azd up
```

### Podjetniški klepet z RAG

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Hiter začetek**:
```bash
azd init --template contoso-chat
azd up
```

## Naslednji koraki

1. **Preizkusite primere**: Začnite s prednastavljeno predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite svojim potrebam**: Spremenite infrastrukturo in aplikacijsko kodo
3. **Dodajte spremljanje**: Uvedite celovito opazovanje
4. **Optimizirajte stroške**: Prilagodite nastavitve za vaš proračun
5. **Zavarujte uvajanje**: Uvedite varnostne vzorce za podjetja
6. **Razširite v produkcijo**: Dodajte več regij in funkcije visoke razpoložljivosti

## 🎯 Praktične vaje

### Vaja 1: Uvajanje klepetalne aplikacije Azure OpenAI (30 minut)
**Cilj**: Uvajanje in testiranje proizvodne klepetalne AI aplikacije

```bash
# Inicializiraj predlogo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavi spremenljivke okolja
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Nasadi
azd up

# Preizkusi aplikacijo
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Nadzoruj delovanje AI
azd monitor

# Počisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Uvajanje se zaključi brez napak kvote
- [ ] Dostop do klepetalnega vmesnika v brskalniku
- [ ] Lahko postavite vprašanja in prejmete odgovore, poganjane z AI
- [ ] Application Insights prikazuje telemetrične podatke
- [ ] Viri so bili uspešno odstranjeni

**Ocenjeni strošek**: $5-10 za 30 minut testiranja

### Vaja 2: Konfiguracija uvajanja več modelov (45 minut)
**Cilj**: Uvajanje več AI modelov z različnimi konfiguracijami

```bash
# Ustvari prilagojeno Bicep konfiguracijo
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

# Razporedi in preveri
azd provision
azd show
```

**Kriteriji uspeha:**
- [ ] Več modelov je uspešno uvedenih
- [ ] Uporabljene različne nastavitve kapacitet
- [ ] Modeli dostopni prek API-ja
- [ ] Aplikacija lahko kliče oba modela

### Vaja 3: Implementacija spremljanja stroškov (20 minut)
**Cilj**: Nastaviti opozorila proračuna in sledenje stroškom

```bash
# Dodaj opozorilo o proračunu v Bicep
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

# Razporedi opozorilo o proračunu
azd provision

# Preveri trenutne stroške
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspeha:**
- [ ] Ustvarjeno opozorilo proračuna v Azure
- [ ] Konfigurirana obvestila po e-pošti
- [ ] Možnost ogledovanja podatkov o stroških v Azure Portal
- [ ] Pragovi proračuna ustrezno nastavljeni

## 💡 Pogosto zastavljena vprašanja

<details>
<summary><strong>Kako zmanjšam stroške Azure OpenAI med razvojem?</strong></summary>

1. **Uporabite brezplačni nivo**: Azure OpenAI ponuja 50.000 žetonov/mesec brezplačno
2. **Zmanjšajte zmogljivost**: Nastavite kapaciteto na 10 TPM namesto 30+ za razvoj
3. **Uporabite azd down**: Sprostite vire, ko niste aktivno v razvoju
4. **Predpomnite odgovore**: Uvedite Redis predpomnilnik za ponavljajoče se poizvedbe
5. **Uporabite inženiring pozivov**: Zmanjšajte uporabo žetonov z učinkovitimi pozivi

```bash
# Razvojna konfiguracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kakšna je razlika med Azure OpenAI in OpenAI API?</strong></summary>

**Azure OpenAI**:
- Podjetniška varnost in skladnost
- Integracija v zasebno omrežje
- Garancije SLA
- Overjanje z upravljano identiteto
- Na voljo so višje kvote

**OpenAI API**:
- Hitrejši dostop do novih modelov
- Enostavnejša namestitev
- Nižja ovira za vstop
- Samo javni internet

Za produkcijske aplikacije je priporočljiv **Azure OpenAI**.
</details>

<details>
<summary><strong>Kako ravnam z napakami zaradi presežene kvote Azure OpenAI?</strong></summary>

```bash
# Preveri trenutno kvoto
az cognitiveservices usage list --location eastus2

# Poskusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjšaj zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zahtevaj povečanje kvote
# Pojdi na Azure Portal > Kvote > Zahtevaj povečanje
```
</details>

<details>
<summary><strong>Ali lahko uporabim lastne podatke z Azure OpenAI?</strong></summary>

Da! Uporabite **Azure AI Search** za RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Oglejte si predlogo [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako zaščitim končne točke modelov AI?</strong></summary>

**Najboljše prakse**:
1. Uporabite upravljano identiteto (brez API ključev)
2. Omogočite zasebne končne točke
3. Konfigurirajte skupine omrežne varnosti
4. Uvedite omejevanje zahtev
5. Uporabite Azure Key Vault za skrivnosti

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

## Skupnost in podpora

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Vprašanja in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen v AI
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Uvajanje AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se skupnostnim razpravam ali odprite težavo v repozitoriju. Skupnost Azure AI + AZD je tukaj, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvor‑nem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
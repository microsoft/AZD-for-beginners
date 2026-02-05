# Microsoft Foundry integracija z AZD

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI na prvem mestu
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../getting-started/first-project.md)
- **➡️ Naslednje**: [Namestitev AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../getting-started/configuration.md)

## Pregled

Ta vodič prikazuje, kako integrirati storitve Microsoft Foundry z Azure Developer CLI (AZD) za poenostavljeno nameščanje AI aplikacij. Microsoft Foundry ponuja celovito platformo za gradnjo, nameščanje in upravljanje AI aplikacij, medtem ko AZD poenostavi proces infrastrukture in nameščanja.

## Kaj je Microsoft Foundry?

Microsoft Foundry je enotna platforma za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do najsodobnejših AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne tokove
- **AI Foundry Portal**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti nameščanja**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovornega AI

## AZD + Microsoft Foundry: Boljše skupaj

| Funkcija | Microsoft Foundry | Prednosti integracije z AZD |
|----------|-------------------|-----------------------------|
| **Nameščanje modelov** | Ročno nameščanje prek portala | Avtomatizirano, ponovljivo nameščanje |
| **Infrastruktura** | Klikni za vzpostavitev | Infrastruktura kot koda (Bicep) |
| **Upravljanje okolij** | Osredotočeno na eno okolje | Več okolij (razvoj/testiranje/produkcija) |
| **Integracija CI/CD** | Omejena | Podpora za GitHub Actions |
| **Upravljanje stroškov** | Osnovno spremljanje | Optimizacija stroškov po okolju |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Nameščen Azure Developer CLI
- Dostop do storitev Azure OpenAI
- Osnovno poznavanje Microsoft Foundry

## Osnovni vzorci integracije

### Vzorec 1: Integracija Azure OpenAI

**Primer uporabe**: Nameščanje aplikacij za klepet z modeli Azure OpenAI

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

### Vzorec 2: AI iskanje + RAG integracija

**Primer uporabe**: Nameščanje aplikacij za pridobivanje podatkov z izboljšano generacijo (RAG)

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

### Vzorec 3: Integracija inteligence dokumentov

**Primer uporabe**: Delovni tokovi za obdelavo in analizo dokumentov

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
# Osnovne storitve umetne inteligence
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modela
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavitve zmogljivosti
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracija za razvoj:**
```bash
# Stroškovno optimizirane nastavitve za razvoj
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

## Delovni tokovi nameščanja

### Nameščanje z enim ukazom

```bash
# Namestite vse z enim ukazom
azd up

# Ali namestite postopoma
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija
```

### Nameščanje po specifičnih okoljih

```bash
# Razvojno okolje
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Proizvodno okolje
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Spremljanje in opazovanje

### Integracija z Application Insights

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

## 🔐 Najboljše prakse za varnost

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
- Nameščanje ne uspe zaradi napak kvote
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

### Težava 2: Napake pri avtentikaciji

**Simptomi:**
- Napake 401/403 pri klicanju AI storitev
- Sporočila "Dostop zavrnjen"

**Rešitve:**
```bash
# Preverite dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Preverite konfiguracijo upravljane identitete
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Preverite dostop do Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Težava 3: Težave pri nameščanju modelov

**Simptomi:**
- Modeli niso na voljo pri nameščanju
- Težave pri specifičnih različicah modelov

**Rešitve:**
```bash
# Seznam razpoložljivih modelov po regijah
az cognitiveservices model list --location eastus

# Posodobi različico modela v bicep predlogi
# Preveri zahteve glede zmogljivosti modela
```

## Primeri predlog

### Osnovna aplikacija za klepet

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Cognitive Search + App Service

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Cevovod za obdelavo dokumentov

**Repozitorij**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Storitve**: Document Intelligence + Storage + Functions

**Hitri začetek**:
```bash
azd init --template ai-document-processing
azd up
```

### Podjetniški klepet z RAG

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Hitri začetek**:
```bash
azd init --template contoso-chat
azd up
```

## Naslednji koraki

1. **Preizkusite primere**: Začnite s predhodno pripravljeno predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite svojim potrebam**: Spremenite infrastrukturo in kodo aplikacije
3. **Dodajte spremljanje**: Implementirajte celovito opazovanje
4. **Optimizirajte stroške**: Prilagodite konfiguracije glede na vaš proračun
5. **Zavarujte nameščanje**: Uporabite varnostne vzorce za podjetja
6. **Razširite na produkcijo**: Dodajte funkcije za več regij in visoko razpoložljivost

## 🎯 Praktične vaje

### Naloga 1: Nameščanje aplikacije za klepet Azure OpenAI (30 minut)
**Cilj**: Namestite in preizkusite produkcijsko pripravljeno AI aplikacijo za klepet

```bash
# Inicializiraj predlogo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavi okoljske spremenljivke
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Namesti
azd up

# Preizkusi aplikacijo
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Spremljaj delovanje AI
azd monitor

# Počisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Nameščanje se zaključi brez napak kvote
- [ ] Dostop do vmesnika za klepet v brskalniku
- [ ] Možnost postavljanja vprašanj in prejemanja AI odgovorov
- [ ] Application Insights prikazuje telemetrijske podatke
- [ ] Uspešno očiščeni viri

**Ocenjeni stroški**: $5-10 za 30 minut testiranja

### Naloga 2: Konfiguracija nameščanja več modelov (45 minut)
**Cilj**: Namestite več AI modelov z različnimi konfiguracijami

```bash
# Ustvari prilagojeno konfiguracijo Bicep
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

# Namesti in preveri
azd provision
azd show
```

**Kriteriji uspeha:**
- [ ] Več modelov uspešno nameščenih
- [ ] Uporabljene različne nastavitve zmogljivosti
- [ ] Dostop do modelov prek API-ja
- [ ] Možnost klicanja obeh modelov iz aplikacije

### Naloga 3: Implementacija spremljanja stroškov (20 minut)
**Cilj**: Nastavite opozorila o proračunu in spremljanje stroškov

```bash
# Dodajte opozorilo o proračunu v Bicep
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

# Uvedite opozorilo o proračunu
azd provision

# Preverite trenutne stroške
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspeha:**
- [ ] Ustvarjeno opozorilo o proračunu v Azure
- [ ] Konfigurirana e-poštna obvestila
- [ ] Možnost ogleda podatkov o stroških v Azure Portalu
- [ ] Pravilno nastavljeni proračunski pragovi

## 💡 Pogosta vprašanja

<details>
<summary><strong>Kako zmanjšam stroške Azure OpenAI med razvojem?</strong></summary>

1. **Uporabite brezplačno stopnjo**: Azure OpenAI ponuja 50.000 žetonov/mesec brezplačno
2. **Zmanjšajte zmogljivost**: Nastavite zmogljivost na 10 TPM namesto 30+ za razvoj
3. **Uporabite azd down**: Deaktivirajte vire, ko ne razvijate aktivno
4. **Predpomnite odgovore**: Implementirajte Redis predpomnilnik za ponavljajoče se poizvedbe
5. **Uporabite oblikovanje pozivov**: Zmanjšajte uporabo žetonov z učinkovitimi pozivi

```bash
# Konfiguracija razvoja
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kakšna je razlika med Azure OpenAI in OpenAI API?</strong></summary>

**Azure OpenAI**:
- Varnost in skladnost za podjetja
- Integracija zasebnega omrežja
- Garancije SLA
- Avtentikacija z upravljano identiteto
- Na voljo višje kvote

**OpenAI API**:
- Hitrejši dostop do novih modelov
- Enostavnejša nastavitev
- Nižja vstopna ovira
- Samo javni internet

Za produkcijske aplikacije je **Azure OpenAI priporočljiv**.
</details>

<details>
<summary><strong>Kako obravnavam napake presežene kvote Azure OpenAI?</strong></summary>

```bash
# Preveri trenutno kvoto
az cognitiveservices usage list --location eastus2

# Poskusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjša zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zahtevaj povečanje kvote
# Pojdi na Azure Portal > Kvote > Zahtevaj povečanje
```
</details>

<details>
<summary><strong>Ali lahko uporabim svoje podatke z Azure OpenAI?</strong></summary>

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
<summary><strong>Kako zavarujem končne točke AI modelov?</strong></summary>

**Najboljše prakse**:
1. Uporabite upravljano identiteto (brez API ključev)
2. Omogočite zasebne končne točke
3. Konfigurirajte skupine za varnost omrežja
4. Implementirajte omejevanje hitrosti
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

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Težave in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI na prvem mestu
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../getting-started/first-project.md)
- **➡️ Naslednje**: [Namestitev AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../getting-started/configuration.md)

**Potrebujete pomoč?** Pridružite se razpravam v skupnosti ali odprite težavo v repozitoriju. Skupnost Azure AI + AZD je tukaj, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
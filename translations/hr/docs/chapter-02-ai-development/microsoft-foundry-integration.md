# Microsoft Foundry Integration with AZD

**Navigacija poglavljima:**
- **📚 Početna tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvoj
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ovaj vodič pokazuje kako integrirati Microsoft Foundry usluge s Azure Developer CLI (AZD) za pojednostavljene implementacije AI aplikacija. Microsoft Foundry pruža sveobuhvatnu platformu za izgradnju, implementaciju i upravljanje AI aplikacijama, dok AZD pojednostavljuje proces infrastrukture i implementacije.

## Što je Microsoft Foundry?

Microsoft Foundry je Microsoftova objedinjena platforma za razvoj AI-a koja uključuje:

- **Model Catalog**: Pristup najsuvremenijim AI modelima
- **Prompt Flow**: Vizualni dizajner za AI tokove rada
- **AI Foundry Portal**: Integrirano razvojno okruženje za AI aplikacije
- **Deployment Options**: Višestruke mogućnosti hostanja i skaliranja
- **Safety and Security**: Ugrađene značajke odgovornog AI-a

## AZD + Microsoft Foundry: Bolje zajedno

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Preduvjeti

- Pretplata na Azure s odgovarajućim dozvolama
- Azure Developer CLI instaliran
- Pristup Azure OpenAI uslugama
- Osnovno poznavanje Microsoft Foundry

## Osnovni obrasci integracije

### Obrazac 1: Integracija Azure OpenAI

**Primjena**: Implementacija chat aplikacija s Azure OpenAI modelima

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

### Obrazac 2: AI pretraživanje + RAG integracija

**Primjena**: Implementacija aplikacija s retrieval-augmented generation (RAG)

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

### Obrazac 3: Integracija Document Intelligence

**Primjena**: Radni tokovi obrade i analize dokumenata

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

## 🔧 Obrasci konfiguracije

### Postavljanje varijabli okruženja

**Konfiguracija za produkciju:**
```bash
# Temeljne AI usluge
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modela
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Postavke performansi
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracija za razvoj:**
```bash
# Postavke optimizirane za troškove razvoja
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Besplatna razina
```

### Sigurna konfiguracija s Key Vaultom

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

## Radni tokovi implementacije

### Implementacija jednom naredbom

```bash
# Rasporedi sve jednom naredbom
azd up

# Ili rasporedi postupno
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija
```

### Implementacije specifične za okruženje

```bash
# Razvojno okruženje
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkcijsko okruženje
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Praćenje i observabilnost

### Integracija s Application Insights

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

### Praćenje troškova

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

## 🔐 Najbolje sigurnosne prakse

### Konfiguracija upravljanog identiteta

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

### Mrežna sigurnost

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

## Optimizacija performansi

### Strategije keširanja

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

### Konfiguracija automatskog skaliranja

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

## Rješavanje uobičajenih problema

### Problem 1: Prekoračenje kvote OpenAI

**Simptomi:**
- Implementacija ne uspijeva zbog pogrešaka kvote
- 429 pogreške u zapisima aplikacije

**Rješenja:**
```bash
# Provjeri trenutnu upotrebu kvote
az cognitiveservices usage list --location eastus

# Pokušaj drugu regiju
azd env set AZURE_LOCATION westus2
azd up

# Privremeno smanji kapacitet
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Neuspjesi autentifikacije

**Simptomi:**
- 401/403 pogreške pri pozivanju AI servisa
- Poruke "Access denied"

**Rješenja:**
```bash
# Provjerite dodjele uloga
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Provjerite konfiguraciju upravljanog identiteta
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Provjerite pristup Key Vaultu
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemi s implementacijom modela

**Simptomi:**
- Modeli nisu dostupni u implementaciji
- Određene verzije modela ne rade

**Rješenja:**
```bash
# Prikaži dostupne modele po regijama
az cognitiveservices model list --location eastus

# Ažuriraj verziju modela u Bicep predlošku
# Provjeri zahtjeve kapaciteta modela
```

## Primjeri predložaka

### Osnovna chat aplikacija

**Spremište**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usluge**: Azure OpenAI + Cognitive Search + App Service

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Cjevovod za obradu dokumenata

**Spremište**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Usluge**: Document Intelligence + Storage + Functions

**Brzi početak**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat za poduzeća s RAG

**Spremište**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usluge**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Brzi početak**:
```bash
azd init --template contoso-chat
azd up
```

## Sljedeći koraci

1. **Isprobajte primjere**: Započnite s unaprijed pripremljenim predloškom koji odgovara vašem scenariju
2. **Prilagodite prema potrebama**: Izmijenite infrastrukturu i aplikacijski kod
3. **Dodajte nadzor**: Implementirajte sveobuhvatnu observabilnost
4. **Optimizirajte troškove**: Fino podesite konfiguracije za vaš budžet
5. **Osigurajte implementaciju**: Primijenite sigurnosne obrasce za poduzeća
6. **Skalirajte u produkciju**: Dodajte multi-regionalne i visoko dostupne značajke

## 🎯 Praktične vježbe

### Vježba 1: Implementirajte Azure OpenAI chat aplikaciju (30 minuta)
**Cilj**: Implementirati i testirati produkcijski spremnu AI chat aplikaciju

```bash
# Inicijaliziraj predložak
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Postavi varijable okruženja
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Rasporedi
azd up

# Testiraj aplikaciju
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Nadzor AI operacija
azd monitor

# Očisti
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Implementacija se završi bez pogrešaka kvote
- [ ] Može pristupiti chat sučelju u pregledniku
- [ ] Može postavljati pitanja i dobiti odgovore pokretane umjetnom inteligencijom
- [ ] Application Insights prikazuje telemetrijske podatke
- [ ] Uspješno očišćeni resursi

**Procijenjeni trošak**: $5-10 za 30 minuta testiranja

### Vježba 2: Konfigurirajte implementaciju s više modela (45 minuta)
**Cilj**: Implementirati više AI modela s različitim konfiguracijama

```bash
# Kreirajte prilagođenu Bicep konfiguraciju
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

# Rasporedi i provjeri
azd provision
azd show
```

**Kriteriji uspjeha:**
- [ ] Više modela uspješno implementirano
- [ ] Primijenjene različite postavke kapaciteta
- [ ] Modeli dostupni putem API-ja
- [ ] Aplikacija može pozivati oba modela

### Vježba 3: Implementirajte praćenje troškova (20 minuta)
**Cilj**: Postaviti obavijesti za budžet i praćenje troškova

```bash
# Dodaj upozorenje o proračunu u Bicep
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

# Rasporedi upozorenje o proračunu
azd provision

# Provjeri trenutne troškove
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspjeha:**
- [ ] Obavijest o budžetu kreirana u Azureu
- [ ] Konfigurirane obavijesti e-poštom
- [ ] Mogućnost pregleda podataka o troškovima u Azure Portalu
- [ ] Postavljeni odgovarajući pragovi budžeta

## 💡 Često postavljana pitanja

<details>
<summary><strong>Kako smanjiti troškove Azure OpenAI tijekom razvoja?</strong></summary>

1. **Koristite besplatni sloj**: Azure OpenAI nudi 50.000 tokena/mjesečno besplatno
2. **Smanjite kapacitet**: Postavite kapacitet na 10 TPM umjesto 30+ za razvoj
3. **Koristite azd down**: Oslobodite resurse kad aktivno ne razvijate
4. **Keširajte odgovore**: Implementirajte Redis keš za ponovljene upite
5. **Koristite inženjering promptova**: Smanjite potrošnju tokena efikasnim promptima

```bash
# Konfiguracija za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Koja je razlika između Azure OpenAI i OpenAI API-ja?</strong></summary>

**Azure OpenAI**:
- Sigurnost i usklađenost za poduzeća
- Integracija s privatnom mrežom
- SLA jamstva
- Autentikacija upravljanim identitetom
- Dostupne veće kvote

**OpenAI API**:
- Brži pristup novim modelima
- Jednostavnije postavljanje
- Niži prag ulaska
- Samo javni internet

Za produkcijske aplikacije, **preporučuje se Azure OpenAI**.
</details>

<details>
<summary><strong>Kako rukovati pogreškama prekoračenja kvote Azure OpenAI?</strong></summary>

```bash
# Provjerite trenutnu kvotu
az cognitiveservices usage list --location eastus2

# Pokušajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up

# Privremeno smanjite kapacitet
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zatražite povećanje kvote
# Idite na Azure Portal > Kvote > Zatraži povećanje
```
</details>

<details>
<summary><strong>Mogu li koristiti vlastite podatke s Azure OpenAI?</strong></summary>

Da! Koristite **Azure AI Search** za RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Pogledajte predložak [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako osigurati krajnje točke AI modela?</strong></summary>

**Najbolje prakse**:
1. Koristite Managed Identity (bez API ključeva)
2. Omogućite Private Endpoints
3. Konfigurirajte mrežne sigurnosne grupe
4. Implementirajte ograničenje brzine (rate limiting)
5. Koristite Azure Key Vault za tajne

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

## Zajednica i podrška

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigacija poglavljima:**
- **📚 Početna tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvoj
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se raspravama zajednice ili otvorite issue u spremištu. Zajednica Azure AI + AZD je ovdje da vam pomogne uspjeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj dokument preveden je pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važnije informacije preporučuje se profesionalni prijevod koji izvodi čovjek. Ne odgovaramo za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
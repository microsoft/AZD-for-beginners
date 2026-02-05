# Integrarea Microsoft Foundry cu AZD

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul Precedent**: [Capitolul 1: Primul Tău Proiect](../getting-started/first-project.md)
- **➡️ Următor**: [Implementarea Modelului AI](ai-model-deployment.md)
- **🚀 Capitolul Următor**: [Capitolul 3: Configurare](../getting-started/configuration.md)

## Prezentare Generală

Acest ghid demonstrează cum să integrezi serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări simplificate ale aplicațiilor AI. Microsoft Foundry oferă o platformă cuprinzătoare pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică procesul de infrastructură și implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată de dezvoltare AI de la Microsoft, care include:

- **Catalog de Modele**: Acces la modele AI de ultimă generație
- **Prompt Flow**: Designer vizual pentru fluxuri de lucru AI
- **Portalul AI Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de Implementare**: Multiple opțiuni de găzduire și scalare
- **Siguranță și Securitate**: Funcții integrate pentru AI responsabil

## AZD + Microsoft Foundry: Mai Bine Împreună

| Caracteristică | Microsoft Foundry | Beneficiu Integrării AZD |
|----------------|-------------------|--------------------------|
| **Implementarea Modelului** | Implementare manuală prin portal | Implementări automate, repetabile |
| **Infrastructură** | Provizionare prin clicuri | Infrastructură ca Cod (Bicep) |
| **Gestionarea Mediului** | Focalizare pe un singur mediu | Multi-mediu (dev/staging/prod) |
| **Integrare CI/CD** | Limitată | Suport nativ pentru GitHub Actions |
| **Gestionarea Costurilor** | Monitorizare de bază | Optimizare specifică mediului |

## Cerințe Prealabile

- Abonament Azure cu permisiuni adecvate
- Azure Developer CLI instalat
- Acces la serviciile Azure OpenAI
- Familiaritate de bază cu Microsoft Foundry

## Modele de Integrare de Bază

### Model 1: Integrarea Azure OpenAI

**Caz de Utilizare**: Implementarea aplicațiilor de chat cu modele Azure OpenAI

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

**Infrastructură (main.bicep):**
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

### Model 2: Integrarea AI Search + RAG

**Caz de Utilizare**: Implementarea aplicațiilor de generare augmentată prin recuperare (RAG)

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

### Model 3: Integrarea Document Intelligence

**Caz de Utilizare**: Fluxuri de lucru pentru procesarea și analiza documentelor

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

## 🔧 Modele de Configurare

### Configurarea Variabilelor de Mediu

**Configurație de Producție:**
```bash
# Servicii AI de bază
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurații ale modelului
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Setări de performanță
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurație de Dezvoltare:**
```bash
# Setări optimizate pentru costuri în dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nivel gratuit
```

### Configurare Securizată cu Key Vault

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

## Fluxuri de Implementare

### Implementare cu o Singură Comandă

```bash
# Implementați totul cu o singură comandă
azd up

# Sau implementați incremental
azd provision  # Doar infrastructura
azd deploy     # Doar aplicația
```

### Implementări Specifice Mediului

```bash
# Mediu de dezvoltare
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Mediu de producție
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorizare și Observabilitate

### Integrarea Application Insights

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

### Monitorizarea Costurilor

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

## 🔐 Cele Mai Bune Practici de Securitate

### Configurarea Identității Gestionate

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

### Securitatea Rețelei

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

## Optimizarea Performanței

### Strategii de Caching

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

### Configurarea Auto-scalării

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

## Depanarea Problemelor Comune

### Problema 1: Depășirea Cotei OpenAI

**Simptome:**
- Implementarea eșuează cu erori de cotă
- Erori 429 în jurnalele aplicației

**Soluții:**
```bash
# Verifica utilizarea actuală a cotei
az cognitiveservices usage list --location eastus

# Încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacitatea temporar
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Eșecuri de Autentificare

**Simptome:**
- Erori 401/403 la apelarea serviciilor AI
- Mesaje "Acces refuzat"

**Soluții:**
```bash
# Verificați atribuirea rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificați configurația identității gestionate
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validați accesul la Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Probleme de Implementare a Modelului

**Simptome:**
- Modelele nu sunt disponibile în implementare
- Versiuni specifice ale modelului eșuează

**Soluții:**
```bash
# Listează modelele disponibile pe regiune
az cognitiveservices model list --location eastus

# Actualizează versiunea modelului în șablonul bicep
# Verifică cerințele de capacitate ale modelului
```

## Șabloane Exemplu

### Aplicație de Chat de Bază

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Cognitive Search + App Service

**Start Rapid**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Flux de Procesare a Documentelor

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Servicii**: Document Intelligence + Storage + Functions

**Start Rapid**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Enterprise cu RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Start Rapid**:
```bash
azd init --template contoso-chat
azd up
```

## Pași Următori

1. **Încearcă Exemplele**: Începe cu un șablon pre-construit care se potrivește cazului tău de utilizare
2. **Personalizează pentru Nevoile Tale**: Modifică infrastructura și codul aplicației
3. **Adaugă Monitorizare**: Implementează observabilitate cuprinzătoare
4. **Optimizează Costurile**: Ajustează configurațiile pentru bugetul tău
5. **Securizează Implementarea**: Aplică modele de securitate pentru întreprinderi
6. **Scalare la Producție**: Adaugă funcții multi-regiune și de înaltă disponibilitate

## 🎯 Exerciții Practice

### Exercițiul 1: Implementarea Aplicației de Chat Azure OpenAI (30 minute)
**Obiectiv**: Implementarea și testarea unei aplicații AI de chat gata de producție

```bash
# Inițializați șablonul
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Setați variabilele de mediu
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implementați
azd up

# Testați aplicația
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorizați operațiunile AI
azd monitor

# Curățați
azd down --force --purge
```

**Criterii de Succes:**
- [ ] Implementarea se finalizează fără erori de cotă
- [ ] Se poate accesa interfața de chat în browser
- [ ] Se pot pune întrebări și primi răspunsuri AI
- [ ] Application Insights afișează date de telemetrie
- [ ] Resursele au fost curățate cu succes

**Cost Estimat**: $5-10 pentru 30 de minute de testare

### Exercițiul 2: Configurarea Implementării Multi-Model (45 minute)
**Obiectiv**: Implementarea mai multor modele AI cu configurații diferite

```bash
# Creează configurație personalizată Bicep
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

# Implementați și verificați
azd provision
azd show
```

**Criterii de Succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Setări diferite de capacitate aplicate
- [ ] Modelele accesibile prin API
- [ ] Se pot apela ambele modele din aplicație

### Exercițiul 3: Implementarea Monitorizării Costurilor (20 minute)
**Obiectiv**: Configurarea alertelor de buget și urmărirea costurilor

```bash
# Adăugați alertă de buget la Bicep
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

# Implementați alerta de buget
azd provision

# Verificați costurile curente
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterii de Succes:**
- [ ] Alertă de buget creată în Azure
- [ ] Notificări prin email configurate
- [ ] Se pot vizualiza datele de cost în Azure Portal
- [ ] Pragurile de buget setate corespunzător

## 💡 Întrebări Frecvente

<details>
<summary><strong>Cum pot reduce costurile Azure OpenAI în timpul dezvoltării?</strong></summary>

1. **Folosește Nivelul Gratuit**: Azure OpenAI oferă 50,000 de tokeni/lună gratuit
2. **Redu Capacitatea**: Setează capacitatea la 10 TPM în loc de 30+ pentru dezvoltare
3. **Folosește azd down**: Dezactivează resursele când nu dezvolți activ
4. **Cachează Răspunsurile**: Implementează Redis cache pentru interogări repetate
5. **Folosește Prompt Engineering**: Redu utilizarea tokenilor cu prompturi eficiente

```bash
# Configurație de dezvoltare
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Care este diferența între Azure OpenAI și OpenAI API?</strong></summary>

**Azure OpenAI**:
- Securitate și conformitate pentru întreprinderi
- Integrare cu rețele private
- Garanții SLA
- Autentificare prin identitate gestionată
- Cote mai mari disponibile

**OpenAI API**:
- Acces mai rapid la modele noi
- Configurare mai simplă
- Barieră de intrare mai mică
- Doar internet public

Pentru aplicații de producție, **Azure OpenAI este recomandat**.
</details>

<details>
<summary><strong>Cum gestionez erorile de cotă depășită Azure OpenAI?</strong></summary>

```bash
# Verificați cota curentă
az cognitiveservices usage list --location eastus2

# Încercați o regiune diferită
azd env set AZURE_LOCATION westus2
azd up

# Reduceți capacitatea temporar
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitați o creștere a cotei
# Accesați Portalul Azure > Cote > Solicitați creștere
```
</details>

<details>
<summary><strong>Pot folosi propriile date cu Azure OpenAI?</strong></summary>

Da! Folosește **Azure AI Search** pentru RAG (Generare Augmentată prin Recuperare):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vezi șablonul [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Cum securizez punctele finale ale modelului AI?</strong></summary>

**Cele Mai Bune Practici**:
1. Folosește Identitate Gestionată (fără chei API)
2. Activează Puncte Finale Private
3. Configurează grupuri de securitate ale rețelei
4. Implementează limitarea ratei
5. Folosește Azure Key Vault pentru secrete

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

## Comunitate și Suport

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleme și discuții](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul Precedent**: [Capitolul 1: Primul Tău Proiect](../getting-started/first-project.md)
- **➡️ Următor**: [Implementarea Modelului AI](ai-model-deployment.md)
- **🚀 Capitolul Următor**: [Capitolul 3: Configurare](../getting-started/configuration.md)

**Ai nevoie de ajutor?** Alătură-te discuțiilor comunității sau deschide o problemă în repository. Comunitatea Azure AI + AZD este aici să te ajute să reușești!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
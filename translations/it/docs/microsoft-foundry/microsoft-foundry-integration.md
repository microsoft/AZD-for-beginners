# Integrazione di Microsoft Foundry con AZD

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il tuo primo progetto](../getting-started/first-project.md)
- **➡️ Prossimo**: [Distribuzione del Modello AI](ai-model-deployment.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

## Panoramica

Questa guida mostra come integrare i servizi di Microsoft Foundry con Azure Developer CLI (AZD) per semplificare la distribuzione di applicazioni AI. Microsoft Foundry offre una piattaforma completa per creare, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo Modelli**: Accesso ai modelli AI più avanzati
- **Prompt Flow**: Designer visivo per flussi di lavoro AI
- **Portale AI Foundry**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di Distribuzione**: Diverse opzioni di hosting e scalabilità
- **Sicurezza e Protezione**: Funzionalità integrate per un'AI responsabile

## AZD + Microsoft Foundry: Meglio Insieme

| Funzionalità | Microsoft Foundry | Beneficio dell'Integrazione con AZD |
|--------------|-------------------|-------------------------------------|
| **Distribuzione Modelli** | Distribuzione manuale tramite portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Provisioning tramite clic | Infrastruttura come Codice (Bicep) |
| **Gestione Ambienti** | Focus su un singolo ambiente | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Limitata | Supporto nativo per GitHub Actions |
| **Gestione Costi** | Monitoraggio di base | Ottimizzazione dei costi specifica per ambiente |

## Prerequisiti

- Abbonamento Azure con permessi appropriati
- Azure Developer CLI installato
- Accesso ai servizi Azure OpenAI
- Familiarità di base con Microsoft Foundry

## Modelli di Integrazione Principali

### Modello 1: Integrazione Azure OpenAI

**Caso d'uso**: Distribuire applicazioni di chat con modelli Azure OpenAI

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

**Infrastruttura (main.bicep):**
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

### Modello 2: Integrazione AI Search + RAG

**Caso d'uso**: Distribuire applicazioni di generazione aumentata dal recupero (RAG)

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

### Modello 3: Integrazione Document Intelligence

**Caso d'uso**: Flussi di lavoro per l'elaborazione e l'analisi di documenti

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

## 🔧 Modelli di Configurazione

### Configurazione Variabili d'Ambiente

**Configurazione Produzione:**
```bash
# Servizi AI principali
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurazioni del modello
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Impostazioni di prestazione
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurazione Sviluppo:**
```bash
# Impostazioni ottimizzate per i costi per lo sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Livello gratuito
```

### Configurazione Sicura con Key Vault

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

## Flussi di Distribuzione

### Distribuzione con un Singolo Comando

```bash
# Distribuisci tutto con un solo comando
azd up

# Oppure distribuisci incrementale
azd provision  # Solo infrastruttura
azd deploy     # Solo applicazione
```

### Distribuzioni Specifiche per Ambiente

```bash
# Ambiente di sviluppo
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Ambiente di produzione
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoraggio e Osservabilità

### Integrazione con Application Insights

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

### Monitoraggio dei Costi

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

## 🔐 Pratiche di Sicurezza

### Configurazione Identità Gestita

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

### Sicurezza di Rete

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

## Ottimizzazione delle Prestazioni

### Strategie di Caching

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

### Configurazione Auto-scaling

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

## Risoluzione dei Problemi Comuni

### Problema 1: Quota Azure OpenAI Superata

**Sintomi:**
- La distribuzione fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Controlla l'utilizzo attuale della quota
az cognitiveservices usage list --location eastus

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Errori di Autenticazione

**Sintomi:**
- Errori 401/403 durante le chiamate ai servizi AI
- Messaggi "Accesso negato"

**Soluzioni:**
```bash
# Verificare le assegnazioni dei ruoli
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Controllare la configurazione dell'identità gestita
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validare l'accesso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemi di Distribuzione Modelli

**Sintomi:**
- Modelli non disponibili nella distribuzione
- Versioni specifiche di modelli che falliscono

**Soluzioni:**
```bash
# Elenca i modelli disponibili per regione
az cognitiveservices model list --location eastus

# Aggiorna la versione del modello nel template bicep
# Controlla i requisiti di capacità del modello
```

## Template di Esempio

### Applicazione Chat di Base

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Cognitive Search + App Service

**Avvio Rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline di Elaborazione Documenti

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Servizi**: Document Intelligence + Storage + Functions

**Avvio Rapido**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Aziendale con RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Avvio Rapido**:
```bash
azd init --template contoso-chat
azd up
```

## Prossimi Passi

1. **Prova gli Esempi**: Inizia con un template pre-costruito che corrisponde al tuo caso d'uso
2. **Personalizza per le tue Esigenze**: Modifica l'infrastruttura e il codice dell'applicazione
3. **Aggiungi Monitoraggio**: Implementa un'osservabilità completa
4. **Ottimizza i Costi**: Affina le configurazioni in base al tuo budget
5. **Proteggi la tua Distribuzione**: Implementa modelli di sicurezza aziendale
6. **Scala alla Produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi Pratici

### Esercizio 1: Distribuisci App Chat Azure OpenAI (30 minuti)
**Obiettivo**: Distribuire e testare un'applicazione AI di chat pronta per la produzione

```bash
# Inizializza il modello
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Imposta le variabili d'ambiente
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Distribuisci
azd up

# Testa l'applicazione
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitora le operazioni AI
azd monitor

# Pulisci
azd down --force --purge
```

**Criteri di Successo:**
- [ ] La distribuzione si completa senza errori di quota
- [ ] È possibile accedere all'interfaccia chat nel browser
- [ ] È possibile fare domande e ricevere risposte AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Risorse pulite con successo

**Costo Stimato**: $5-10 per 30 minuti di test

### Esercizio 2: Configura Distribuzione Multi-Modello (45 minuti)
**Obiettivo**: Distribuire più modelli AI con configurazioni diverse

```bash
# Creare configurazione Bicep personalizzata
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

# Distribuire e verificare
azd provision
azd show
```

**Criteri di Successo:**
- [ ] Più modelli distribuiti con successo
- [ ] Applicate impostazioni di capacità diverse
- [ ] Modelli accessibili tramite API
- [ ] È possibile chiamare entrambi i modelli dall'applicazione

### Esercizio 3: Implementa Monitoraggio dei Costi (20 minuti)
**Obiettivo**: Configurare avvisi di budget e monitoraggio dei costi

```bash
# Aggiungi avviso di budget a Bicep
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

# Distribuisci avviso di budget
azd provision

# Controlla i costi attuali
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criteri di Successo:**
- [ ] Avviso di budget creato in Azure
- [ ] Notifiche email configurate
- [ ] È possibile visualizzare i dati sui costi nel Portale Azure
- [ ] Soglie di budget impostate correttamente

## 💡 Domande Frequenti

<details>
<summary><strong>Come posso ridurre i costi di Azure OpenAI durante lo sviluppo?</strong></summary>

1. **Usa il Livello Gratuito**: Azure OpenAI offre 50.000 token/mese gratuiti
2. **Riduci la Capacità**: Imposta la capacità a 10 TPM invece di 30+ per lo sviluppo
3. **Usa azd down**: Dealloca le risorse quando non stai sviluppando attivamente
4. **Cache delle Risposte**: Implementa Redis cache per query ripetute
5. **Prompt Engineering**: Riduci l'uso di token con prompt efficienti

```bash
# Configurazione di sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual è la differenza tra Azure OpenAI e OpenAI API?</strong></summary>

**Azure OpenAI**:
- Sicurezza e conformità aziendale
- Integrazione con rete privata
- Garanzie SLA
- Autenticazione con identità gestita
- Quote più alte disponibili

**OpenAI API**:
- Accesso più rapido ai nuovi modelli
- Configurazione più semplice
- Barriera d'ingresso più bassa
- Solo internet pubblico

Per applicazioni di produzione, **Azure OpenAI è consigliato**.
</details>

<details>
<summary><strong>Come gestisco gli errori di quota superata di Azure OpenAI?</strong></summary>

```bash
# Controlla la quota attuale
az cognitiveservices usage list --location eastus2

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Richiedi un aumento della quota
# Vai al Portale Azure > Quote > Richiedi aumento
```
</details>

<details>
<summary><strong>Posso usare i miei dati con Azure OpenAI?</strong></summary>

Sì! Usa **Azure AI Search** per RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Consulta il template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Come posso proteggere gli endpoint dei modelli AI?</strong></summary>

**Pratiche Migliori**:
1. Usa Identità Gestita (senza chiavi API)
2. Abilita Endpoint Privati
3. Configura gruppi di sicurezza di rete
4. Implementa il rate limiting
5. Usa Azure Key Vault per i segreti

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

## Comunità e Supporto

- **Discord Microsoft Foundry**: [#Canale Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemi e discussioni](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo Precedente**: [Capitolo 1: Il tuo primo progetto](../getting-started/first-project.md)
- **➡️ Prossimo**: [Distribuzione del Modello AI](ai-model-deployment.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

**Hai bisogno di aiuto?** Unisciti alle discussioni della comunità o apri un problema nel repository. La comunità Azure AI + AZD è qui per aiutarti a raggiungere il successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
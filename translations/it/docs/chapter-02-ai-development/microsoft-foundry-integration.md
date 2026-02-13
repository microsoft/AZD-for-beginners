# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-first
- **⬅️ Capitolo precedente**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida mostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per distribuire applicazioni AI in modo semplificato. Microsoft Foundry fornisce una piattaforma completa per costruire, distribuire e gestire applicazioni AI, mentre AZD semplifica l'infrastruttura e il processo di distribuzione.

## Cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Model Catalog**: Accesso a modelli AI all'avanguardia
- **Prompt Flow**: Designer visivo per workflow AI
- **AI Foundry Portal**: Ambiente di sviluppo integrato per applicazioni AI
- **Deployment Options**: Più opzioni di hosting e scalabilità
- **Safety and Security**: Funzionalità di AI responsabile integrate

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisiti

- Sottoscrizione Azure con permessi appropriati
- Azure Developer CLI installato
- Accesso ai servizi Azure OpenAI
- Familiarità di base con Microsoft Foundry

## Modelli di integrazione principali

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

**Infrastructure (main.bicep):**
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

### Modello 2: AI Search + RAG Integration

**Caso d'uso**: Distribuire applicazioni RAG (retrieval-augmented generation)

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

### Modello 3: Document Intelligence Integration

**Caso d'uso**: Flussi di lavoro per l'elaborazione e l'analisi dei documenti

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

## 🔧 Modelli di configurazione

### Impostazione delle variabili d'ambiente

**Configurazione di produzione:**
```bash
# Servizi principali di intelligenza artificiale
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurazioni del modello
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Impostazioni delle prestazioni
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurazione di sviluppo:**
```bash
# Impostazioni ottimizzate per i costi per lo sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Piano gratuito
```

### Configurazione sicura con Key Vault

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

## Flussi di distribuzione

### Distribuzione con singolo comando

```bash
# Distribuisci tutto con un solo comando
azd up

# Oppure distribuisci in modo incrementale
azd provision  # Solo infrastruttura
azd deploy     # Solo applicazione
```

### Distribuzioni specifiche per ambiente

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

## Monitoraggio e osservabilità

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

### Monitoraggio dei costi

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

## 🔐 Migliori pratiche di sicurezza

### Configurazione Managed Identity

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

### Sicurezza di rete

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

## Ottimizzazione delle prestazioni

### Strategie di caching

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

### Configurazione di auto-scaling

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

## Risoluzione dei problemi comuni

### Problema 1: Limite quota OpenAI superato

**Sintomi:**
- La distribuzione fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Controlla l'utilizzo corrente della quota
az cognitiveservices usage list --location eastus

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Errori di autenticazione

**Sintomi:**
- Errori 401/403 quando si chiamano i servizi AI
- Messaggi "Access denied"

**Soluzioni:**
```bash
# Verificare le assegnazioni di ruolo
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificare la configurazione dell'identità gestita
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Verificare l'accesso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemi di distribuzione dei modelli

**Sintomi:**
- Modelli non disponibili nella distribuzione
- Versioni specifiche dei modelli che falliscono

**Soluzioni:**
```bash
# Elenca i modelli disponibili per regione
az cognitiveservices model list --location eastus

# Aggiorna la versione del modello nel template Bicep
# Verifica i requisiti di capacità del modello
```

## Template di esempio

### Applicazione chat di base

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Cognitive Search + App Service

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline di elaborazione documenti

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Servizi**: Document Intelligence + Storage + Functions

**Avvio rapido**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat enterprise con RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Avvio rapido**:
```bash
azd init --template contoso-chat
azd up
```

## Prossimi passi

1. **Prova gli esempi**: Inizia con un template predefinito che corrisponde al tuo caso d'uso
2. **Personalizza per le tue esigenze**: Modifica l'infrastruttura e il codice dell'applicazione
3. **Aggiungi monitoraggio**: Implementa osservabilità completa
4. **Ottimizza i costi**: Affina le configurazioni per il tuo budget
5. **Metti in sicurezza la tua distribuzione**: Implementa pattern di sicurezza enterprise
6. **Scala in produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercizi pratici

### Esercizio 1: Distribuire un'app di chat Azure OpenAI (30 minuti)
**Obiettivo**: Distribuire e testare un'app di chat AI pronta per la produzione

```bash
# Inizializza il template
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

# Monitora le operazioni dell'IA
azd monitor

# Pulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] La distribuzione si completa senza errori di quota
- [ ] È possibile accedere all'interfaccia di chat nel browser
- [ ] Si possono porre domande e ottenere risposte basate sull'AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Risorse eliminate con successo

**Costo stimato**: $5-10 per 30 minuti di test

### Esercizio 2: Configurare una distribuzione multi-modello (45 minuti)
**Obiettivo**: Distribuire più modelli AI con configurazioni diverse

```bash
# Creare una configurazione Bicep personalizzata
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

**Criteri di successo:**
- [ ] Più modelli distribuiti con successo
- [ ] Impostazioni di capacità diverse applicate
- [ ] Modelli accessibili via API
- [ ] È possibile chiamare entrambi i modelli dall'applicazione

### Esercizio 3: Implementare il monitoraggio dei costi (20 minuti)
**Obiettivo**: Impostare avvisi di budget e monitoraggio dei costi

```bash
# Aggiungi un avviso di budget a Bicep
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

# Distribuisci l'avviso di budget
azd provision

# Controlla i costi correnti
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criteri di successo:**
- [ ] Avviso di budget creato in Azure
- [ ] Notifiche email configurate
- [ ] È possibile visualizzare i dati dei costi nel Portale di Azure
- [ ] Soglie di budget impostate correttamente

## 💡 Domande frequenti

<details>
<summary><strong>Come riduco i costi di Azure OpenAI durante lo sviluppo?</strong></summary>

1. **Usa il livello gratuito**: Azure OpenAI offre 50.000 token/mese gratuiti
2. **Riduci la capacità**: Imposta la capacità a 10 TPM anziché 30+ per lo sviluppo
3. **Usa azd down**: Dealloca le risorse quando non si sta sviluppando attivamente
4. **Cache delle risposte**: Implementa Redis per le query ripetute
5. **Usa il prompt engineering**: Riduci l'uso di token con prompt efficienti

```bash
# Configurazione di sviluppo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual è la differenza tra Azure OpenAI e OpenAI API?</strong></summary>

**Azure OpenAI**:
- Sicurezza e conformità enterprise
- Integrazione con rete privata
- Garanzie SLA
- Autenticazione con Managed Identity
- Quote più alte disponibili

**OpenAI API**:
- Accesso più rapido ai nuovi modelli
- Configurazione più semplice
- Barriera d'ingresso più bassa
- Solo internet pubblico

Per applicazioni in produzione, **si raccomanda Azure OpenAI**.
</details>

<details>
<summary><strong>Come gestisco gli errori di superamento quota di Azure OpenAI?</strong></summary>

```bash
# Verifica la quota corrente
az cognitiveservices usage list --location eastus2

# Prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up

# Riduci temporaneamente la capacità
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Richiedi aumento della quota
# Vai al Portale di Azure > Quote > Richiedi aumento
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

Vedi il template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Come metto in sicurezza gli endpoint dei modelli AI?</strong></summary>

**Migliori pratiche**:
1. Usa Managed Identity (nessuna API key)
2. Abilita Private Endpoints
3. Configura i gruppi di sicurezza di rete
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

## Community e supporto

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-first
- **⬅️ Capitolo precedente**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Capitolo successivo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni della community o apri un issue nel repository. La community Azure AI + AZD è qui per aiutarti a avere successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su intelligenza artificiale Co-op Translator (https://github.com/Azure/co-op-translator). Pur facendo del nostro meglio per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua di origine va considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
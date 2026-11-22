# Integrazione Microsoft Foundry con AZD

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Agenti AI](agents.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica

Questa guida dimostra come integrare i servizi Microsoft Foundry con Azure Developer CLI (AZD) per distribuzioni semplificate di applicazioni AI. Microsoft Foundry fornisce una piattaforma completa per costruire, distribuire e gestire applicazioni AI, mentre AZD semplifica il processo di infrastruttura e distribuzione.

## Cos'è Microsoft Foundry?

Microsoft Foundry è la piattaforma unificata di Microsoft per lo sviluppo AI che include:

- **Catalogo Modelli**: Accesso ai modelli AI all'avanguardia
- **Prompt Flow**: Designer visivo per flussi di lavoro AI
- **Portale Microsoft Foundry**: Ambiente di sviluppo integrato per applicazioni AI
- **Opzioni di distribuzione**: Molteplici opzioni di hosting e scalabilità
- **Sicurezza e safety**: Funzionalità integrate di AI responsabile

## AZD + Microsoft Foundry: Meglio insieme

| Funzionalità | Microsoft Foundry | Vantaggio integrazione AZD |
|---------|-----------------|------------------------|
| **Distribuzione modelli** | Distribuzione manuale tramite portale | Distribuzioni automatizzate e ripetibili |
| **Infrastruttura** | Configurazione progetto e risorse | Inizia da `azure.yaml`; estrai Bicep o Terraform quando necessario |
| **Gestione ambienti** | Focus su un singolo ambiente | Multi-ambiente (dev/staging/prod) |
| **Integrazione CI/CD** | Servizi di distribuzione e valutazione | Riutilizzo della configurazione in GitHub Actions o Azure DevOps |
| **Gestione costi** | Monitoraggio di base | Ottimizzazione dei costi specifica per ambiente |

## Prerequisiti

- Sottoscrizione Azure con permessi appropriati
- Azure Developer CLI 1.37.0 o successivo per il flusso di lavoro GA Foundry
- Accesso ai servizi Microsoft Foundry Models
- Familiarità di base con Microsoft Foundry

> **Aggiornamento Foundry GA (2026-11-09):** Il pacchetto di estensione `microsoft.foundry` ha raggiunto la versione 1.0 e la disponibilità generale il [5 novembre 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). La guida sottostante segue questo annuncio e il quickstart Microsoft Learn collegato. Si tratta di una revisione della documentazione, non di una validazione di distribuzione live. Le funzionalità anteprima opzionali e le estensioni rilasciate indipendentemente mantengono il proprio stato di rilascio.

**Obiettivi di apprendimento:** Installare il pacchetto GA, rivedere un `azure.yaml` di un agente, confrontare risposte locali e distribuite, e spiegare valutazione, CI/CD e confini di pulizia. Per una distribuzione passo-passo dell’agente, vai al [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). I frammenti di risorsa sotto trattano altri modelli di integrazione.

## Modelli principali di integrazione

**Ambito degli esempi:** Il Bicep seguente contiene frammenti risorsa illustrativi, non un template completo distribuibile. Il template contenitore deve definire nomi, `location`, risorse referenziate, identità, output e hosting applicativo. Usa un esempio collegato come punto di partenza eseguibile. Gli esempi Bash richiedono autenticazione Azure CLI separata da `azd auth login`.

### Modello 1: Integrazione Microsoft Foundry Models

**Caso d'uso**: Distribuire applicazioni chat con modelli Azure OpenAI in Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastruttura (main.bicep):**
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Il chiamante necessita di un'identità gestita allegata e `Cognitive Services OpenAI User` a livello account; disabilitare le chiavi non concede accesso. Verifica disponibilità regione/modello/SKU e quota prima della distribuzione.

### Modello 2: Integrazione AI Search + RAG

**Caso d'uso**: Distribuire applicazioni retrieval-augmented generation (RAG)

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

```

Non esiste una risorsa ARM `Microsoft.Search/searchServices/dataConnections` per questa integrazione. Configura un indice Search, origine dati, indicizzatore/skillset o vettorizzatore tramite le API supportate del piano dati di Search. Se Search chiama un modello embedding, abilita l’identità gestita, assegna il ruolo modello richiesto e configura la relativa skill embedding/vettorizzatore. Vedi [vectorizzazione integrata](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Modello 3: Integrazione Document Intelligence

**Caso d'uso**: Flussi di lavoro di elaborazione e analisi documentale

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

### Configurazione variabili di ambiente

A eccezione delle impostazioni AZD documentate come `AZURE_LOCATION`, questi sono **nomi di input di template personalizzati**. Non hanno effetto se non consumati dal template/applicazione tramite mappature parametri e ambiente host. Per `azure-search-openai-demo`, usa i suoi nomi reali come `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` e `AZURE_SEARCH_SERVICE_SKU` invece. La capacità modello non è lo SKU dell’account.

**Configurazione di produzione:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurazione di sviluppo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configurazione sicura con Key Vault

Preferisci Entra ID con autenticazione locale chiave disabilitata. Quanto segue è solo un **alternativa legacy di autenticazione chiave** per applicazioni che richiedono chiavi: necessita di un account con autenticazione chiavi abilitata, identità applicativa allegata all’host e accesso/rete Key Vault funzionanti. Non combinare recupero chiave con `disableLocalAuth: true` e aspettarti che chiamate basate su chiave funzionino.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

## Flussi di lavoro di distribuzione

### Estensioni AZD per Foundry

Per il flusso di lavoro GA, installa il pacchetto `microsoft.foundry` anziché assemblare le estensioni core una per una:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Il pacchetto installa agenti, connessioni, inspector, progetti, routine, skill e toolbox. Non aggiunge un gruppo comandi `microsoft.foundry`. Valutazioni, set dati, fine-tuning e modelli personalizzati si installano separatamente quando necessario. Vedi il [riferimento al packaging estensioni](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent Walkthrough (GA)

Un **agente ospitato** esegue il codice agente sul compute gestito da Foundry. Questo esercizio usa il campione API Responses upstream del Python Agent Framework base, non i classici frammenti SDK Agent Service in altre lezioni.

#### 1. Preparazione e inizializzazione

Usa una cartella vuota esterna a questo checkout corso. Installa Python 3.13 o successivo e una versione corrente del [rilascio uv](https://docs.astral.sh/uv/getting-started/installation/). Installazioni uv standalone possono usare `uv self update`. Controlla [permessi hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), disponibilità modello e quota nella tua sottoscrizione e regione prima del provisioning. Le risorse Azure e le chiamate modello locali implicano costi.

Completa `azd auth login` e installazione del pacchetto sopra. Il codice di esempio locale usa `DefaultAzureCredential`; se usi credenziali Azure CLI, effettua l'accesso con `az login` usando lo stesso account e tenant di AZD. Il solo login AZD non è un login Azure CLI.

Esegui questo comando su una singola riga in Bash o PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Scegli un progetto Foundry nuovo o esistente e la sottoscrizione e regione previste. Per riutilizzare una distribuzione modello, aggiungi `--model-deployment <existing-deployment-name>` al comando di inizializzazione **prima di eseguirlo**, e seleziona il progetto esistente. Rimani nella cartella contenente il `azure.yaml` generato per i comandi successivi.

#### 2. Revisione definizione distribuzione

Apri `azure.yaml` e individua queste impostazioni nel [campione upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Impostazione | Cosa controllare |
|---------|---------------|
| `host: azure.ai.project` e `deployments` | Progetto Foundry, nome modello, versione, SKU distribuzione e capacità previsti |
| `host: azure.ai.agent` e `project` | Agente ospitato e cartella contenente il suo codice sorgente |
| `codeConfiguration` | Runtime Python e punto di ingresso; il campione revisionato usa `python_3_13` e `main.py` |
| `uses` | Dipendenza dal servizio progetto Foundry |
| `container.resources` | Allocazione CPU e memoria, anche se il codice è costruito da remoto |
| `env` | Mappatura distribuzione modello e `PYTHONNOUSERSITE: "1"` per disabilitare il caricamento di pacchetti sito-utente |
| `infra.provider` | `microsoft.foundry` che sintetizza l'infrastruttura richiesta |

Commit della `azure.yaml` revisionata e del codice agente insieme. Non è richiesta infrastruttura scritta a mano per iniziare; se servono file provisioning editabili, segui [estrazione infrastruttura](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) per Bicep o Terraform e continua a usare `azd provision`. Non committare credenziali o stato ambiente `.azure/`.

#### 3. Provisioning e test locale

```bash
azd provision
azd ai agent run
```

Il provisioning può creare distribuzioni modello mancanti **anche in un progetto riutilizzato**. Rivedi i prompt modelli e seleziona un tipo di distribuzione online disponibile come Global Standard o Data Zone Standard; quota e supporto regionale variano.

L’esecuzione locale prepara le dipendenze e apre **Agent Inspector**, dove puoi ispezionare richieste, risposte e attività di strumento/modello. Lascialo aperto e apri un secondo terminale nella stessa cartella progetto:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Punto di controllo:** Conferma di ricevere una risposta pertinente e puoi ispezionare l’attività locale associata. L’esecuzione locale chiama ancora la distribuzione modello Azure; non è un test offline o gratuito. Usa prompt sintetici ed evita di esporre segreti o dati sensibili nell’output inspector.

#### 4. Distribuire e confrontare

Interrompi l’esecuzione locale con Ctrl+C al termine. Prima della chiamata remota, configura o verifica la [connessione Application Insights e accesso lettura tracce](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) del progetto.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

In modalità distribuzione codice, AZD carica il codice sorgente per una build Foundry remota; non serve una build container locale per questo percorso. L’output di distribuzione fornisce link a playground e endpoint. Verifica una risposta dall’agente distribuito e la sua traccia cloud; gli eventi inspector locali da soli non dimostrano che il tracing cloud funziona.

Per modifiche successive, rivedi la configurazione hosted-agent supportata con `azd deploy --preview`. Flussa i log con `azd ai agent monitor --follow`, o diagnostica problemi di setup e accesso con `azd ai agent doctor`. Un’anteprima distribuzione non è una revisione completa di infrastruttura o sicurezza.

#### 5. Aggiungi un controllo qualità ripetibile

Installa l’estensione valutazioni rilasciata indipendentemente, poi genera asset di test bozza:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Descrivi il comportamento previsto dell’agente e seleziona **Set dati e valutatore**, quindi **Turn**. Rivedi e modifica i casi generati e la griglia di valutazione, incluso un caso di domanda non supportata, prima di configurare la valutazione:

```bash
azd ai eval init --name quality
```

Seleziona il set dati e la griglia revisionati e conferma la distribuzione modello giudice. Ispeziona `evals/azure.eval.yaml` e il suo riferimento servizio valutazione in `azure.yaml`, poi registra gli asset e esegui:

```bash
azd up
azd ai eval run start --eval quality
```

Ispeziona punteggi e casi falliti o con errore; una valutazione completata non è automaticamente un pass di qualità. Generazione e punteggio comportano anche costi modello. Commit configurazione non segreta, set dati e griglie affinché i compagni possano comparare le modifiche. `azd ai agent optimize` può riutilizzare una valutazione compatibile come baseline, ma valuta candidati prima di distribuirne uno esplicitamente. Vedi [controlli qualità e migrazione](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) per progetti più vecchi e CI.

#### 6. Riutilizza il flusso in CI/CD

Dopo un `azd up` riuscito, esegui `azd pipeline config` e rivedi il workflow GitHub Actions o Azure DevOps generato. Installa `microsoft.foundry` sul runner, più `azure.ai.evaluations` se esegui valutazioni. Mantieni le impostazioni di checkout, login e ambiente generate; solo l’installazione non autentica la pipeline.

Usa un ambiente AZD separato per ogni fase, concedi all’identità pipeline i permessi risorsa e Foundry necessari, e conserva le credenziali nei segreti pipeline o usa identità federata. Commit asset valutazioni e verifica che l’identità possa accedere a set dati e valutatori referenziati. Vedi l’[esempio pipeline del corso](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) e la [guida Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Pulisci deliberatamente

Per un **progetto nuovo creato da questo ambiente**, rivedi le risorse elencate da `azd down` prima di confermare: elimina il gruppo di risorse e tutto ciò che contiene.

Per un **progetto riutilizzato**, `azd down` lascia progetto, agente ospitato e altre risorse in loco. Rimuovi solo risorse indesiderate di tua proprietà usando la [guida rapida pulizia](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); non eliminare un gruppo di risorse condiviso per pulire un solo esercizio.

**Verifica completamento:** Spiega quali impostazioni controllano comportamento locale e cloud, mostra risposte locali e distribuite, rivedi un risultato valutazione, e identifica quali risorse rimangono dopo la pulizia.

### Opzionale: Genera con il Microsoft Foundry Skill

Installa il [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) per il tuo host agente di coding, poi apri una cartella vuota separata. Chiedigli di generare lo schema base del campione Python Agent Framework Responses API in modalità distribuzione codice, spiega il `azure.yaml` generato, e propone la sottoscrizione, regione, progetto e distribuzione modello. Richiedi approvazione **prima di creare risorse Azure**, richiedi un test locale e fermati prima della distribuzione. Rivedi l’output e continua con i passaggi di distribuzione sopra solo quando pronto.

Per i progetti esistenti, `--template`/`-t` sostituisce la forma deprecata `--manifest`/`-m`; modificare il flag non migra i manifest legacy o la configurazione annidata dell'agente. Vedi il [riferimento AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Distribuzione con singolo comando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Distribuzioni specifiche per ambiente

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
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
```

Questo fornisce una risorsa Insights, non l'instrumentazione della telemetria. Una volta che la tua app emette span esterni a chiamate modello, esegui questa query illustrativa nei Log di Application Insights (adatta il filtro ai nomi reali degli span):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitoraggio dei costi

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Usa un destinatario reale e verifica i permessi di ambito di fatturazione. Un budget invia avvisi; non è un limite di spesa.

## 🔐 Migliori pratiche di sicurezza

### Configurazione dell'identità gestita

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

Questo frammento endpoint necessita anche di una zona/gruppo DNS privato, collegamenti VNet, connettività VNet applicativa e una politica di accesso pubblico esplicita. Creare solo un endpoint privato non disabilita l'accesso pubblico.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache for Redis Basic/Standard/Premium è in [fase di ritiro](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); usa Azure Managed Redis per nuove distribuzioni e segui le linee guida attuali per template/autenticazione. Limita le risposte AI memorizzate nella cache tramite autorizzazione, modello/istruzioni e versione dati, con scadenza; non condividere mai risposte private usando solo il testo della query.

### Configurazione dell'auto-scaling

**Risorsa parziale:** unisci queste impostazioni di scala/ingresso in una Container App completa con ambiente gestito, immagine container e limiti di risorsa. Più repliche non aumentano la quota modello.

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

### Problema 1: Quota OpenAI superata

**Sintomi:**
- La distribuzione fallisce con errori di quota
- Errori 429 nei log dell'applicazione

**Soluzioni:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

La variabile capacity sopra si applica solo a un template personalizzato configurato per consumarla. Per il campione RAG, usa `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Non modificare `AZURE_LOCATION` per spostare risorse esistenti; crea un ambiente separato per una nuova regione e pianifica migrazione/pulizia.

### Problema 2: Errori di autenticazione

**Sintomi:**
- Errori 401/403 chiamando i servizi AI
- Messaggi "Accesso negato"

**Soluzioni:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Problemi di distribuzione modello

**Sintomi:**
- Modelli non disponibili nella distribuzione
- Versioni specifiche modello che falliscono

**Soluzioni:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Template di esempio

Questi sono alternativi, non comandi sequenziali. Inizia ognuno in una cartella vuota separata. La destinazione esplicita `.` mantiene l'inizializzazione nella directory corrente; altrimenti AZD corrente può creare una sottocartella a nome template senza cambiare la directory di lavoro della shell.

### Applicazione Chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrizione**: Un'applicazione di riferimento chat RAG per domande sui tuoi documenti, con recupero tramite Azure AI Search. Esamina i modelli supportati, funzionalità opzionali, guida ai costi e robustezza di produzione attuali prima dell'uso; distribuire un esempio non rende l'app pronta per la produzione.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Applicazione Chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrizione**: Equivalente .NET/C# dell'esempio Python RAG chat. Costruito con ASP.NET Core Minimal API e frontend Blazor WebAssembly. Include chat vocale, supporto visione GPT-4o-mini e client desktop/mobile ibrido .NET MAUI Blazor companion.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Applicazione Chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servizi**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrizione**: Versione Java dell'esempio chat RAG usando Langchain4J per l'orchestrazione AI. Supporta architettura microservizi event-driven, diverse strategie di ricerca (testo, vettore, ibrida), caricamento documenti con Azure Document Intelligence, e distribuzione su Azure Container Apps o Azure Kubernetes Service.

**Avvio rapido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilota Retail Enterprise con Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servizi**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrizione**: Copilota retail RAG end-to-end usando Microsoft Foundry e Prompty. Chatbot per retailer Contoso Outdoor che fonda risposte su catalogo prodotti e dati ordini clienti. Dimostra l'intero workflow GenAIOps: prototipo con Prompty, valutazione con valutatori assistiti da AI, e distribuzione via AZD su Container Apps.

**Avvio rapido**:
```bash
azd init --template contoso-chat .
azd up
```

### Applicazione di scrittura creativa multi-agente

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servizi**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrizione**: Esempio multi-agente che dimostra l'orchestrazione di agenti AI con Prompty. Usa un agente di ricerca (Bing Grounding in Azure AI Agent Service), un agente prodotto (Azure AI Search), un agente scrittore e un agente editor per produrre collaborativamente articoli ben ricercati. Include CI/CD con valutazione in GitHub Actions.

**Avvio rapido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servizi**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descrizione**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions per API e Azure Static Web Apps per hosting. Usa Azure Cosmos DB come archivio vettori e database cronologia chat. Supporta sviluppo locale con Ollama per test a costo zero.

**Avvio rapido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acceleratore Chat con i tuoi dati

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servizi**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search con Cosmos DB, o PostgreSQL con pgvector

**Descrizione**: Acceleratore chat documentale con citazioni. L’esempio attuale ospita frontend React, backend FastAPI e worker Functions su Container Apps; opzioni orchestrator sono Agent Framework e LangGraph. Opzioni database/recupero selezionate al deploy. È un punto di partenza, non un sistema pronto produzione; non assumere che varianti più vecchie di App Service, Semantic Kernel o Prompt Flow descrivano il default corrente.

**Avvio rapido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agenti di viaggio AI — Orchestrazione Multi-Agente MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servizi**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Server MCP (.NET, Python, Java, TypeScript)

**Descrizione**: Applicazione di riferimento per orchestrazione multi-agente AI usando tre framework (LangChain.js, LlamaIndex.TS, e Microsoft Agent Framework). Include server MCP (Model Context Protocol) in quattro linguaggi distribuiti come Azure Container Apps serverless con monitoraggio OpenTelemetry.

**Avvio rapido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Esplora altri template**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) per i template disponibili attualmente in vari linguaggi e scenari. Ogni esempio collegato è un repository esterno, non un esempio locale fornito da questo corso; controlla i prerequisiti e la guida alla produzione attuali prima della distribuzione.

## Passi successivi

1. **Prova gli esempi**: Inizia con un template preconfigurato che corrisponda al tuo caso d'uso
2. **Personalizza per le tue esigenze**: Modifica infrastruttura e codice dell'applicazione
3. **Aggiungi monitoraggio**: Implementa osservabilità completa
4. **Ottimizza i costi**: Affina le configurazioni per il tuo budget
5. **Metti in sicurezza la distribuzione**: Applica pattern di sicurezza enterprise
6. **Scala in produzione**: Aggiungi funzionalità multi-regione e alta disponibilità

## 🎯 Esercitazioni pratiche

### Esercizio 1: Distribuisci l'App Chat Microsoft Foundry Models (30 minuti)
**Obiettivo**: Distribuire e testare un'app di riferimento chat AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Criteri di successo:**
- [ ] La distribuzione si completa senza errori di quota
- [ ] Si può accedere all'interfaccia chat nel browser
- [ ] Si possono porre domande e ricevere risposte AI
- [ ] Application Insights mostra dati di telemetria
- [ ] Risorse pulite con successo dopo l'uso

**Costo:** Rivedi la guida ai costi e gli SKU selezionati nell’esempio prima di distribuire. La fatturazione continua finché le risorse non sono cancellate; non esiste una stima fissa di 30 minuti valida per ogni configurazione.

### Esercizio 2: Configura distribuzione multi-modello (45 minuti)
**Obiettivo**: Distribuire più modelli AI con configurazioni diverse

**Punto di partenza:** Un account Azure OpenAI esistente e un modulo infrastruttura AZD con ambito resource-group che può invocare questo file. Crea `infra/ai-models.bicep` con il contenuto seguente nel tuo editor. Non viene distribuito automaticamente solo perché si trova sotto `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Dal modulo con ambito resource-group che possiede l'account, aggiungi un'invocazione modulo (adatta il nome simbolo al tuo account reale):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Non dichiare le stesse distribuzioni in entrambi i moduli. Se il punto di ingresso AZD è con ambito subscription, invoca questo dal suo modulo child con ambito resource-group e aggiusta il percorso relativo. Costruisci quel modulo contenente con `az bicep build --file <path-to-containing-module>`, poi:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Criteri di successo:**
- [ ] Diversi modelli distribuiti con successo
- [ ] Applicate diverse impostazioni di capacity
- [ ] Modelli accessibili tramite API
- [ ] Possibilità di chiamare entrambi i modelli dall'applicazione

### Esercizio 3: Implementa monitoraggio dei costi (20 minuti)
**Obiettivo**: Configurare avvisi budget e tracciamento costi

**Punto di partenza:** Il pattern budget sopra e un modulo infrastruttura con ambito resource-group. Aggiungi questa risorsa dal tuo editor; passa `budgetStartDate` dalla tua mappatura parametri (non duplicare il parametro se già dichiarato). Sostituisci il destinatario e conferma di avere permessi di scrittura sul budget.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Previsto: la risposta contiene `amount: 200`, entrambe le soglie, e il tuo destinatario. Controlla Cost Management nel portale per i costi effettivi; i dati sui costi sono ritardati e un avviso può non scattare durante un esercizio breve.

**Criteri di successo:**
- [ ] Avviso budget creato in Azure
- [ ] Notifiche email configurate
- [ ] Possibilità di visualizzare i dati di costo nel Portale Azure
- [ ] Soglie budget impostate correttamente

## 💡 Domande frequenti

<details>
<summary><strong>Come ridurre i costi Microsoft Foundry Models durante lo sviluppo?</strong></summary>

1. **Controlla il prezzo**: Non esiste un limite gratuito universale di 50.000 token mensili per i modelli Azure OpenAI
2. **Dimensiona correttamente la capacità**: La capacità `10` rappresenta tipicamente 10.000 TPM per questi modelli testo Standard, non 10 TPM. Ridurre questo rate limit non abbassa i prezzi per token
3. **Usa azd down**: Elimina risorse usa e getta quando non sviluppi attivamente (non è deallocazione)
4. **Cache delle risposte**: Implementa cache Redis per query ripetute
5. **Usa Prompt Engineering**: Riduci l'uso di token con prompt efficienti

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Qual è la differenza tra Microsoft Foundry Models e OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Sicurezza e conformità aziendale
- Integrazione con rete privata
- Garanzie SLA
- Autenticazione tramite identità gestita
- Quota più elevate disponibili

**OpenAI API**: Un fornitore/API separato con disponibilità modelli, prezzi, autenticazione e connettività enterprise propri. Confronta le offerte attuali invece di assumere che sia solo internet pubblico o che fornisca sempre modelli per primi.

Scegli in base ai requisiti della tua organizzazione; esempi Azure-specifici di identità gestita e private-link in questo corso si applicano ai servizi ospitati Azure, non a ogni modello/fornitore nel catalogo Foundry.
</details>

<details>
<summary><strong>Come gestire errori di superamento quota Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Posso usare i miei dati con Microsoft Foundry Models?</strong></summary>

Sì! Usa **Azure AI Search** per RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Vedi il template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Come posso mettere in sicurezza gli endpoint dei modelli AI?</strong></summary>

**Best Practices**:
1. Usa Managed Identity (niente chiavi API)
2. Abilita Private Endpoints
3. Configura i gruppi di sicurezza della rete
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentazione ufficiale](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill su skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installa le abilità agent Azure + Foundry nel tuo editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione Capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Capitolo precedente**: [Capitolo 1: Il tuo primo progetto](../chapter-01-foundation/first-project.md)
- **➡️ Successivo**: [Agenti AI](agents.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Partecipa alle discussioni nella nostra comunità o apri un issue nel repository. La community Azure AI + AZD è qui per aiutarti a raggiungere il successo!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
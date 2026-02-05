# Soluzione Multi-Agente per il Retail - Template di Infrastruttura

**Capitolo 5: Pacchetto di Distribuzione in Produzione**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Correlato**: [Capitolo 5: Soluzioni AI Multi-Agente](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guida allo Scenario**: [Architettura Completa](../retail-scenario.md)
- **🎯 Distribuzione Rapida**: [Distribuzione con un Click](../../../../examples/retail-multiagent-arm-template)

> **⚠️ SOLO TEMPLATE DI INFRASTRUTTURA**  
> Questo template ARM distribuisce **risorse Azure** per un sistema multi-agente.  
>  
> **Cosa viene distribuito (15-25 minuti):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings in 3 regioni)
> - ✅ Servizio di Ricerca AI (vuoto, pronto per la creazione di indici)
> - ✅ Container Apps (immagini segnaposto, pronte per il tuo codice)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Cosa NON è incluso (richiede sviluppo):**
> - ❌ Codice di implementazione degli agenti (Agente Cliente, Agente Inventario)
> - ❌ Logica di routing e endpoint API
> - ❌ Interfaccia chat frontend
> - ❌ Schemi di indici di ricerca e pipeline di dati
> - ❌ **Sforzo stimato di sviluppo: 80-120 ore**
>  
> **Usa questo template se:**
> - ✅ Vuoi fornire infrastruttura Azure per un progetto multi-agente
> - ✅ Hai intenzione di sviluppare separatamente l'implementazione degli agenti
> - ✅ Hai bisogno di una base di infrastruttura pronta per la produzione
>  
> **Non usarlo se:**
> - ❌ Ti aspetti un demo multi-agente funzionante immediatamente
> - ❌ Stai cercando esempi completi di codice applicativo

## Panoramica

Questa directory contiene un template completo di Azure Resource Manager (ARM) per distribuire la **fondazione infrastrutturale** di un sistema di supporto clienti multi-agente. Il template fornisce tutti i servizi Azure necessari, configurati e interconnessi, pronti per lo sviluppo della tua applicazione.

**Dopo la distribuzione, avrai:** Infrastruttura Azure pronta per la produzione  
**Per completare il sistema, ti servono:** Codice degli agenti, interfaccia frontend e configurazione dei dati (vedi [Guida all'Architettura](../retail-scenario.md))

## 🎯 Cosa Viene Distribuito

### Infrastruttura Principale (Stato Dopo la Distribuzione)

✅ **Servizi Azure OpenAI** (Pronti per chiamate API)
  - Regione primaria: distribuzione GPT-4o (capacità 20K TPM)
  - Regione secondaria: distribuzione GPT-4o-mini (capacità 10K TPM)
  - Regione terziaria: modello di embeddings testuali (capacità 30K TPM)
  - Regione di valutazione: modello valutatore GPT-4o (capacità 15K TPM)
  - **Stato:** Completamente funzionante - può effettuare chiamate API immediatamente

✅ **Azure AI Search** (Vuoto - pronto per configurazione)
  - Capacità di ricerca vettoriale abilitata
  - Livello standard con 1 partizione, 1 replica
  - **Stato:** Servizio attivo, ma richiede creazione di indici
  - **Azione necessaria:** Crea un indice di ricerca con il tuo schema

✅ **Azure Storage Account** (Vuoto - pronto per caricamenti)
  - Contenitori blob: `documents`, `uploads`
  - Configurazione sicura (solo HTTPS, nessun accesso pubblico)
  - **Stato:** Pronto per ricevere file
  - **Azione necessaria:** Carica i tuoi dati di prodotto e documenti

⚠️ **Ambiente Container Apps** (Immagini segnaposto distribuite)
  - App router degli agenti (immagine nginx predefinita)
  - App frontend (immagine nginx predefinita)
  - Configurazione di auto-scaling (0-10 istanze)
  - **Stato:** Contenitori segnaposto in esecuzione
  - **Azione necessaria:** Crea e distribuisci le tue applicazioni degli agenti

✅ **Azure Cosmos DB** (Vuoto - pronto per dati)
  - Database e contenitore preconfigurati
  - Ottimizzato per operazioni a bassa latenza
  - TTL abilitato per pulizia automatica
  - **Stato:** Pronto per memorizzare la cronologia delle chat

✅ **Azure Key Vault** (Opzionale - pronto per segreti)
  - Soft delete abilitato
  - RBAC configurato per identità gestite
  - **Stato:** Pronto per memorizzare chiavi API e stringhe di connessione

✅ **Application Insights** (Opzionale - monitoraggio attivo)
  - Collegato a workspace Log Analytics
  - Metriche personalizzate e avvisi configurati
  - **Stato:** Pronto per ricevere telemetria dalle tue app

✅ **Document Intelligence** (Pronto per chiamate API)
  - Livello S0 per carichi di lavoro di produzione
  - **Stato:** Pronto per elaborare documenti caricati

✅ **Bing Search API** (Pronto per chiamate API)
  - Livello S1 per ricerche in tempo reale
  - **Stato:** Pronto per query di ricerca web

### Modalità di Distribuzione

| Modalità | Capacità OpenAI | Istanze Container | Livello Ricerca | Redondanza Storage | Ideale Per |
|----------|-----------------|-------------------|-----------------|--------------------|------------|
| **Minimale** | 10K-20K TPM | 0-2 repliche | Basic | LRS (Locale) | Dev/test, apprendimento, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 repliche | Standard | ZRS (Zona) | Produzione, traffico moderato (<10K utenti) |
| **Premium** | 80K-150K TPM | 5-10 repliche, ridondanza zonale | Premium | GRS (Geo) | Enterprise, traffico elevato (>10K utenti), SLA 99.99% |

**Impatto sui Costi:**
- **Minimale → Standard:** ~4x aumento dei costi ($100-370/mese → $420-1,450/mese)
- **Standard → Premium:** ~3x aumento dei costi ($420-1,450/mese → $1,150-3,500/mese)
- **Scegli in base a:** Carico previsto, requisiti SLA, vincoli di budget

**Pianificazione della Capacità:**
- **TPM (Token Per Minuto):** Totale tra tutte le distribuzioni di modelli
- **Istanze Container:** Intervallo di auto-scaling (repliche min-max)
- **Livello Ricerca:** Influisce sulle prestazioni delle query e sui limiti di dimensione degli indici

## 📋 Prerequisiti

### Strumenti Necessari
1. **Azure CLI** (versione 2.50.0 o superiore)
   ```bash
   az --version  # Controlla versione
   az login      # Autentica
   ```

2. **Sottoscrizione Azure attiva** con accesso Owner o Contributor
   ```bash
   az account show  # Verifica abbonamento
   ```

### Quote Azure Necessarie

Prima della distribuzione, verifica quote sufficienti nelle regioni target:

```bash
# Verifica la disponibilità di Azure OpenAI nella tua regione
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifica la quota di OpenAI (esempio per gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Verifica la quota di Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Quote Minime Richieste:**
- **Azure OpenAI:** 3-4 distribuzioni di modelli tra le regioni
  - GPT-4o: 20K TPM (Token Per Minuto)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Nota:** GPT-4o potrebbe avere lista d'attesa in alcune regioni - controlla [disponibilità modelli](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Ambiente gestito + 2-10 istanze container
- **AI Search:** Livello standard (Basic insufficiente per ricerca vettoriale)
- **Cosmos DB:** Throughput standard preconfigurato

**Se le quote sono insufficienti:**
1. Vai su Azure Portal → Quote → Richiedi aumento
2. Oppure usa Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Considera regioni alternative con disponibilità

## 🚀 Distribuzione Rapida

### Opzione 1: Usando Azure CLI

```bash
# Clona o scarica i file del modello
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Rendi eseguibile lo script di distribuzione
chmod +x deploy.sh

# Distribuisci con impostazioni predefinite
./deploy.sh -g myResourceGroup

# Distribuisci per la produzione con funzionalità premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opzione 2: Usando Azure Portal

[![Distribuisci su Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opzione 3: Usando Azure CLI direttamente

```bash
# Creare gruppo di risorse
az group create --name myResourceGroup --location eastus2

# Distribuire modello
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Cronologia della Distribuzione

### Cosa Aspettarsi

| Fase | Durata | Cosa Succede |
|------|--------|--------------||
| **Validazione Template** | 30-60 secondi | Azure valida la sintassi del template ARM e i parametri |
| **Configurazione Gruppo di Risorse** | 10-20 secondi | Crea il gruppo di risorse (se necessario) |
| **Provisioning OpenAI** | 5-8 minuti | Crea 3-4 account OpenAI e distribuisce modelli |
| **Container Apps** | 3-5 minuti | Crea ambiente e distribuisce contenitori segnaposto |
| **Ricerca & Storage** | 2-4 minuti | Fornisce servizio AI Search e account di storage |
| **Cosmos DB** | 2-3 minuti | Crea database e configura contenitori |
| **Configurazione Monitoraggio** | 2-3 minuti | Configura Application Insights e Log Analytics |
| **Configurazione RBAC** | 1-2 minuti | Configura identità gestite e permessi |
| **Distribuzione Totale** | **15-25 minuti** | Infrastruttura completa pronta |

**Dopo la Distribuzione:**
- ✅ **Infrastruttura Pronta:** Tutti i servizi Azure forniti e attivi
- ⏱️ **Sviluppo Applicazione:** 80-120 ore (a tua responsabilità)
- ⏱️ **Configurazione Indice:** 15-30 minuti (richiede il tuo schema)
- ⏱️ **Caricamento Dati:** Varia in base alla dimensione del dataset
- ⏱️ **Test & Validazione:** 2-4 ore

---

## ✅ Verifica del Successo della Distribuzione

### Passo 1: Controlla la Fornitura delle Risorse (2 minuti)

```bash
# Verifica che tutte le risorse siano state distribuite con successo
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Aspettativa:** Tabella vuota (tutte le risorse mostrano stato "Succeeded")

### Passo 2: Verifica le Distribuzioni Azure OpenAI (3 minuti)

```bash
# Elenca tutti gli account OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Controlla le distribuzioni dei modelli per la regione principale
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Aspettativa:** 
- 3-4 account OpenAI (regioni primaria, secondaria, terziaria, di valutazione)
- 1-2 distribuzioni di modelli per account (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Passo 3: Testa gli Endpoint dell'Infrastruttura (5 minuti)

```bash
# Ottieni gli URL dell'app container
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testa l'endpoint del router (risponderà un'immagine segnaposto)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Aspettativa:** 
- Container Apps mostrano stato "Running"
- Nginx segnaposto risponde con HTTP 200 o 404 (nessun codice applicativo ancora)

### Passo 4: Verifica Accesso API Azure OpenAI (3 minuti)

```bash
# Ottieni endpoint e chiave di OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testa il deployment di GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Aspettativa:** Risposta JSON con completamento chat (conferma che OpenAI è funzionante)

### Cosa Funziona vs. Cosa No

**✅ Funziona Dopo la Distribuzione:**
- Modelli Azure OpenAI distribuiti e accettano chiamate API
- Servizio AI Search attivo (vuoto, nessun indice ancora)
- Container Apps attivi (immagini nginx segnaposto)
- Account di storage accessibili e pronti per caricamenti
- Cosmos DB pronto per operazioni sui dati
- Application Insights raccoglie telemetria infrastrutturale
- Key Vault pronto per memorizzare segreti

**❌ Non Funziona Ancora (Richiede Sviluppo):**
- Endpoint degli agenti (nessun codice applicativo distribuito)
- Funzionalità chat (richiede implementazione frontend + backend)
- Query di ricerca (nessun indice di ricerca creato ancora)
- Pipeline di elaborazione documenti (nessun dato caricato)
- Telemetria personalizzata (richiede strumentazione applicativa)

**Prossimi Passi:** Vedi [Configurazione Post-Distribuzione](../../../../examples/retail-multiagent-arm-template) per sviluppare e distribuire la tua applicazione

---

## ⚙️ Opzioni di Configurazione

### Parametri del Template

| Parametro | Tipo | Default | Descrizione |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefisso per tutti i nomi delle risorse |
| `location` | string | Posizione del gruppo di risorse | Regione primaria di distribuzione |
| `secondaryLocation` | string | "westus2" | Regione secondaria per distribuzione multi-regione |
| `tertiaryLocation` | string | "francecentral" | Regione per modello di embeddings |
| `environmentName` | string | "dev" | Designazione dell'ambiente (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configurazione di distribuzione (minimale/standard/premium) |
| `enableMultiRegion` | bool | true | Abilita distribuzione multi-regione |
| `enableMonitoring` | bool | true | Abilita Application Insights e logging |
| `enableSecurity` | bool | true | Abilita Key Vault e sicurezza avanzata |

### Personalizzazione dei Parametri

Modifica `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Panoramica dell'Architettura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Utilizzo dello Script di Distribuzione

Lo script `deploy.sh` offre un'esperienza di distribuzione interattiva:

```bash
# Mostra aiuto
./deploy.sh --help

# Distribuzione di base
./deploy.sh -g myResourceGroup

# Distribuzione avanzata con impostazioni personalizzate
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Distribuzione di sviluppo senza multi-regione
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funzionalità dello Script

- ✅ **Validazione dei prerequisiti** (Azure CLI, stato di login, file template)
- ✅ **Gestione del gruppo di risorse** (crea se non esiste)
- ✅ **Validazione del template** prima della distribuzione
- ✅ **Monitoraggio del progresso** con output colorato
- ✅ **Visualizzazione degli output di distribuzione**
- ✅ **Guida post-distribuzione**

## 📊 Monitoraggio della Distribuzione

### Controlla Stato della Distribuzione

```bash
# Elenca i deployment
az deployment group list --resource-group myResourceGroup --output table

# Ottieni i dettagli del deployment
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Osserva il progresso del deployment
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Output della Distribuzione

Dopo una distribuzione riuscita, saranno disponibili i seguenti output:

- **URL Frontend**: Endpoint pubblico per l'interfaccia web
- **URL Router**: Endpoint API per il router degli agenti
- **Endpoint OpenAI**: Endpoint dei servizi OpenAI primari e secondari
- **Servizio Ricerca**: Endpoint del servizio Azure AI Search
- **Account Storage**: Nome dell'account di storage per documenti
- **Key Vault**: Nome del Key Vault (se abilitato)
- **Application Insights**: Nome del servizio di monitoraggio (se abilitato)

## 🔧 Post-Distribuzione: Prossimi Passi
> **📝 Importante:** L'infrastruttura è stata distribuita, ma è necessario sviluppare e distribuire il codice dell'applicazione.

### Fase 1: Sviluppa Applicazioni Agente (Tua Responsabilità)

Il template ARM crea **Container Apps vuoti** con immagini nginx segnaposto. Devi:

**Sviluppo Richiesto:**
1. **Implementazione degli Agenti** (30-40 ore)
   - Agente per il servizio clienti con integrazione GPT-4o
   - Agente per l'inventario con integrazione GPT-4o-mini
   - Logica di instradamento degli agenti

2. **Sviluppo Frontend** (20-30 ore)
   - Interfaccia chat UI (React/Vue/Angular)
   - Funzionalità di caricamento file
   - Rendering e formattazione delle risposte

3. **Servizi Backend** (12-16 ore)
   - Router FastAPI o Express
   - Middleware per l'autenticazione
   - Integrazione della telemetria

**Vedi:** [Guida all'Architettura](../retail-scenario.md) per modelli di implementazione dettagliati ed esempi di codice

### Fase 2: Configura l'Indice di Ricerca AI (15-30 minuti)

Crea un indice di ricerca che corrisponda al tuo modello di dati:

```bash
# Ottieni i dettagli del servizio di ricerca
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Crea un indice con il tuo schema (esempio)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Risorse:**
- [Progettazione Schema Indice di Ricerca AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Configurazione Ricerca Vettoriale](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Carica i Tuoi Dati (Tempo variabile)

Una volta che hai i dati sui prodotti e i documenti:

```bash
# Ottieni i dettagli dell'account di archiviazione
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Carica i tuoi documenti
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Esempio: Carica un singolo file
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Crea e Distribuisci le Tue Applicazioni (8-12 ore)

Una volta sviluppato il codice degli agenti:

```bash
# 1. Crea Azure Container Registry (se necessario)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Crea e invia l'immagine del router agente
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Crea e invia l'immagine del frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Aggiorna Container Apps con le tue immagini
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Configura le variabili d'ambiente
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fase 5: Testa la Tua Applicazione (2-4 ore)

```bash
# Ottieni l'URL della tua applicazione
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Testa l'endpoint dell'agente (una volta che il tuo codice è distribuito)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Controlla i log dell'applicazione
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Risorse per l'Implementazione

**Architettura & Design:**
- 📖 [Guida Completa all'Architettura](../retail-scenario.md) - Modelli di implementazione dettagliati
- 📖 [Modelli di Design Multi-Agente](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Esempi di Codice:**
- 🔗 [Esempio Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Modello RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework per agenti (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orchestrazione agenti (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Conversazioni multi-agente

**Stima Totale dello Sforzo:**
- Distribuzione infrastruttura: 15-25 minuti (✅ Completato)
- Sviluppo applicazioni: 80-120 ore (🔨 Tuo lavoro)
- Test e ottimizzazione: 15-25 ore (🔨 Tuo lavoro)

## 🛠️ Risoluzione dei Problemi

### Problemi Comuni

#### 1. Quota Azure OpenAI Superata

```bash
# Controlla l'utilizzo attuale della quota
az cognitiveservices usage list --location eastus2

# Richiedi un aumento della quota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Distribuzione Container Apps Fallita

```bash
# Controlla i log dell'app del contenitore
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Riavvia l'app del contenitore
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inizializzazione Servizio di Ricerca

```bash
# Verificare lo stato del servizio di ricerca
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testare la connettività del servizio di ricerca
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validazione della Distribuzione

```bash
# Convalida che tutte le risorse siano create
az resource list \
  --resource-group myResourceGroup \
  --output table

# Controlla lo stato di salute delle risorse
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considerazioni sulla Sicurezza

### Gestione delle Chiavi
- Tutti i segreti sono archiviati in Azure Key Vault (se abilitato)
- Le Container Apps utilizzano identità gestite per l'autenticazione
- Gli account di archiviazione hanno impostazioni di sicurezza predefinite (solo HTTPS, nessun accesso pubblico ai blob)

### Sicurezza di Rete
- Le Container Apps utilizzano reti interne ove possibile
- Il servizio di ricerca è configurato con l'opzione di endpoint privati
- Cosmos DB è configurato con i permessi minimi necessari

### Configurazione RBAC
```bash
# Assegna i ruoli necessari per l'identità gestita
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Ottimizzazione dei Costi

### Stime dei Costi (Mensili, USD)

| Modalità | OpenAI | Container Apps | Ricerca | Archiviazione | Totale Stimato |
|----------|--------|----------------|---------|---------------|----------------|
| Minima   | $50-200 | $20-50        | $25-100 | $5-20         | $100-370       |
| Standard | $200-800 | $100-300      | $100-300 | $20-50        | $420-1450      |
| Premium  | $500-2000 | $300-800      | $300-600 | $50-100       | $1150-3500     |

### Monitoraggio dei Costi

```bash
# Imposta avvisi di budget
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Aggiornamenti e Manutenzione

### Aggiornamenti del Template
- Versiona i file del template ARM
- Testa le modifiche prima nell'ambiente di sviluppo
- Usa la modalità di distribuzione incrementale per gli aggiornamenti

### Aggiornamenti delle Risorse
```bash
# Aggiorna con nuovi parametri
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup e Ripristino
- Backup automatico di Cosmos DB abilitato
- Soft delete di Key Vault abilitato
- Revisioni delle Container Apps mantenute per il rollback

## 📞 Supporto

- **Problemi con il Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Supporto Azure**: [Portale Supporto Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Pronto a distribuire la tua soluzione multi-agente?**

Inizia con: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T22:11:01+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "it"
}
-->
# Soluzione Multi-Agente per il Retail - Distribuzione con Template ARM

**Capitolo 5: Pacchetto di Distribuzione per la Produzione**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Correlato**: [Capitolo 5: Soluzioni AI Multi-Agente](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guida allo Scenario**: [Implementazione Completa](../retail-scenario.md)
- **🎯 Distribuzione Rapida**: [Distribuzione con un Click](../../../../examples/retail-multiagent-arm-template)

Questa directory contiene un template completo di Azure Resource Manager (ARM) per distribuire la Soluzione Multi-Agente di Supporto Clienti per il retail, fornendo infrastruttura come codice per l'intera architettura.

## 🎯 Cosa Viene Distribuito

### Infrastruttura Principale
- **Servizi Azure OpenAI** (Multi-regione per alta disponibilità)
  - Regione primaria: GPT-4o per l'agente clienti
  - Regione secondaria: GPT-4o-mini per l'agente inventario  
  - Regione terziaria: Modello di embedding testuale
  - Regione di valutazione: Modello di grading GPT-4o
- **Azure AI Search** con capacità di ricerca vettoriale
- **Azure Storage Account** con contenitori blob per documenti e upload
- **Ambiente Azure Container Apps** con auto-scaling
- **Container Apps** per il router degli agenti e il frontend
- **Azure Cosmos DB** per la memorizzazione della cronologia delle chat
- **Azure Key Vault** per la gestione dei segreti (opzionale)
- **Application Insights** e Log Analytics per il monitoraggio (opzionale)
- **Document Intelligence** per l'elaborazione dei documenti
- **API Bing Search** per informazioni in tempo reale

### Modalità di Distribuzione

| Modalità | Descrizione | Caso d'Uso | Risorse |
|----------|-------------|------------|---------|
| **Minimale** | Distribuzione di base ottimizzata per i costi | Sviluppo, test | SKU di base, singola regione, capacità ridotta |
| **Standard** | Distribuzione bilanciata per carichi di lavoro di produzione | Produzione, scala moderata | SKU standard, multi-regione, capacità standard |
| **Premium** | Distribuzione ad alte prestazioni per aziende | Enterprise, scala elevata | SKU premium, multi-regione, alta capacità |

## 📋 Prerequisiti

1. **Azure CLI** installato e configurato
2. **Sottoscrizione Azure attiva** con quote sufficienti
3. **Permessi appropriati** per creare risorse nella sottoscrizione target
4. **Quote di risorse** per:
   - Azure OpenAI (verificare la disponibilità regionale)
   - Container Apps (varia in base alla regione)
   - AI Search (consigliato tier standard o superiore)

## 🚀 Distribuzione Rapida

### Opzione 1: Utilizzo di Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opzione 2: Utilizzo del Portale Azure

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opzione 3: Utilizzo diretto di Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opzioni di Configurazione

### Parametri del Template

| Parametro | Tipo | Default | Descrizione |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefisso per tutti i nomi delle risorse |
| `location` | string | Posizione del gruppo di risorse | Regione primaria di distribuzione |
| `secondaryLocation` | string | "westus2" | Regione secondaria per la distribuzione multi-regione |
| `tertiaryLocation` | string | "francecentral" | Regione per il modello di embedding |
| `environmentName` | string | "dev" | Designazione dell'ambiente (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configurazione di distribuzione (minimale/standard/premium) |
| `enableMultiRegion` | bool | true | Abilita la distribuzione multi-regione |
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
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funzionalità dello Script

- ✅ **Validazione dei prerequisiti** (Azure CLI, stato di login, file del template)
- ✅ **Gestione del gruppo di risorse** (crea se non esiste)
- ✅ **Validazione del template** prima della distribuzione
- ✅ **Monitoraggio del progresso** con output colorato
- ✅ **Visualizzazione degli output di distribuzione**
- ✅ **Guida post-distribuzione**

## 📊 Monitoraggio della Distribuzione

### Verifica dello Stato della Distribuzione

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
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
- **Servizio di Ricerca**: Endpoint del servizio Azure AI Search
- **Account di Archiviazione**: Nome dell'account di archiviazione per i documenti
- **Key Vault**: Nome del Key Vault (se abilitato)
- **Application Insights**: Nome del servizio di monitoraggio (se abilitato)

## 🔧 Configurazione Post-Distribuzione

### 1. Configurare l'Indice di Ricerca

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Caricare i Dati Iniziali

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testare gli Endpoint degli Agenti

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Configurare le Container Apps

Il template ARM distribuisce immagini placeholder per i container. Per distribuire il codice effettivo degli agenti:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Risoluzione dei Problemi

### Problemi Comuni

#### 1. Quota Azure OpenAI Superata

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Distribuzione delle Container Apps Fallita

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inizializzazione del Servizio di Ricerca

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validazione della Distribuzione

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considerazioni sulla Sicurezza

### Gestione delle Chiavi
- Tutti i segreti sono memorizzati in Azure Key Vault (se abilitato)
- Le container apps utilizzano identità gestite per l'autenticazione
- Gli account di archiviazione hanno impostazioni di sicurezza predefinite (solo HTTPS, nessun accesso pubblico ai blob)

### Sicurezza di Rete
- Le container apps utilizzano reti interne ove possibile
- Il servizio di ricerca è configurato con opzione di endpoint privati
- Cosmos DB è configurato con i permessi minimi necessari

### Configurazione RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Ottimizzazione dei Costi

### Stime dei Costi (Mensili, USD)

| Modalità | OpenAI | Container Apps | Ricerca | Archiviazione | Totale Stimato |
|----------|--------|----------------|---------|---------------|----------------|
| Minimale | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitoraggio dei Costi

```bash
# Set up budget alerts
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
- Versionare i file del template ARM
- Testare le modifiche in un ambiente di sviluppo prima
- Utilizzare la modalità di distribuzione incrementale per gli aggiornamenti

### Aggiornamenti delle Risorse
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup e Ripristino
- Backup automatico abilitato per Cosmos DB
- Soft delete abilitato per Key Vault
- Revisioni delle container apps mantenute per il rollback

## 📞 Supporto

- **Problemi con il Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Supporto Azure**: [Portale di Supporto Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Pronto a distribuire la tua soluzione multi-agente?**

Inizia con: `./deploy.sh -g myResourceGroup`

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
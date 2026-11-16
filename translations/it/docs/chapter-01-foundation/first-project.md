# Il tuo primo progetto - Tutorial pratico

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo attuale**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Installazione e Configurazione](installation.md)
- **➡️ Successivo**: [Porta la tua app](bring-your-own-app.md)
- **🚀 Capitolo successivo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Benvenuto nel tuo primo progetto Azure Developer CLI! Distribuirai un'app todo con frontend React, API Node.js e Azure Cosmos DB. Il modello mantiene il nome storico `todo-nodejs-mongo`; la sua infrastruttura attuale usa Cosmos DB per NoSQL, quindi controlla il README scaricato e `infra/` anziché dedurre l'API del database dal nome.

> Revisionato rispetto a `azd 1.37.2` e al modello pubblico a novembre 2026. Gli esempi seguenti usano Bash; l’estrazione JSON richiede anche `jq`. Le distribuzioni Azure comportano costi e non sono state eseguite durante questa revisione.

## Obiettivi di apprendimento

Completando questo tutorial, sarai in grado di:
- Padroneggiare il flusso di lavoro di inizializzazione progetto azd usando i modelli
- Comprendere struttura e file di configurazione di un progetto Azure Developer CLI
- Eseguire il deployment completo di un’applicazione su Azure con provisioning infrastrutturale
- Implementare aggiornamenti dell’applicazione e strategie di ridistribuzione
- Gestire più ambienti per sviluppo e staging
- Applicare pratiche di pulizia risorse e gestione costi

## Risultati di apprendimento

Alla fine, sarai in grado di:
- Inizializzare e configurare progetti azd da modelli in autonomia
- Navigare e modificare efficacemente strutture di progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere problemi comuni di deployment e autenticazione
- Gestire più ambienti Azure per varie fasi di distribuzione
- Implementare flussi di lavoro di continuous deployment per aggiornamenti applicativi

## Iniziare

### Checklist prerequisiti
- ✅ Azure Developer CLI installato ([Guida all’installazione](installation.md))
- ✅ Autenticazione AZD completata con `azd auth login`
- ✅ Git installato sul sistema
- ✅ Node.js 22 LTS (o versione supportata richiesta dal modello scaricato)
- ✅ Visual Studio Code (consigliato)

Prima di procedere, esegui il validatore di configurazione dalla radice del repository:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifica la tua configurazione
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifica opzionale autenticazione Azure CLI

```bash
az account show
```

### Controlla versione Node.js
```bash
node --version
```

## Passo 1: Scegli e inizializza un modello

Iniziamo con un popolare modello di applicazione todo che include frontend React e backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Cosa è successo?
- Codice del modello scaricato nella tua directory locale
- Creato un file `azure.yaml` con le definizioni di servizio
- Configurato il codice infrastrutturale nella directory `infra/`
- Creata una configurazione ambiente

## Passo 2: Esplora la struttura del progetto

Esaminiamo cosa ha creato azd per noi:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Dovresti vedere:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### File chiave da comprendere

**azure.yaml** - Il cuore del tuo progetto azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definizione della infrastruttura:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Passo 3: Personalizza il tuo progetto (Facoltativo)

Prima del deployment, puoi personalizzare l’applicazione:

### Modifica il frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Effettua una modifica semplice:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configura variabili di ambiente
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Questi due valori personalizzati dimostrano solo la memorizzazione locale. Il modello standard non consuma `WEBSITE_TITLE` o `API_VERSION`, quindi non modificano l’app. La modifica esplicita della fonte sopra modifica il titolo visualizzato.

## Passo 4: Distribuisci su Azure

Ora la parte entusiasmante: distribuisci tutto su Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Cosa succede durante la distribuzione?

Il flusso di lavoro provvede all’infrastruttura e impacchetta/distribuisce il codice. L’ordine esatto può essere personalizzato tramite `workflows.up` in `azure.yaml`; questo modello specifica provision seguito da deploy. Non fare affidamento su un ordine universale per ogni modello.

### Output previsto
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Passo 5: Testa la tua applicazione

### Accedi alla tua applicazione
Clicca sull’URL fornito nell’output di distribuzione, o ottienilo in qualsiasi momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testa l’app Todo
1. **Aggiungi un elemento todo** - Clicca su "Add Todo" e inserisci un’attività
2. **Segna come completato** - Seleziona gli elementi completati
3. **Elimina elementi** - Rimuovi i todo che non ti servono più

### Monitora la tua applicazione
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifica la tua distribuzione

Prima di andare avanti, percorri questa rapida checklist per confermare che tutto funzioni davvero — non dare per scontato che "deploy riuscito" significhi "app funziona":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**La distribuzione è verificata quando:**
- ✅ `azd show` elenca un URL endpoint raggiungibile
- ✅ L'URL si apre nel browser senza errori
- ✅ Le funzionalità principali funzionano (aggiungi/completa/elimina un todo)
- ✅ `azd monitor --logs` mostra richieste in arrivo senza errori inattesi

Se qualche verifica fallisce, passa a [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/README.md).

## Passo 6: Apporta modifiche e ridistribuisci

Facciamo una modifica e vediamo com’è facile aggiornare:

### Modifica l’API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Aggiungi un’intestazione di risposta personalizzata:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuisci solo le modifiche al codice
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Passo 7: Gestisci più ambienti

Crea un ambiente di staging per testare le modifiche prima della produzione:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Confronto ambienti
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Passo 8: Pulisci le risorse

Quando hai finito di sperimentare, pulisci per evitare costi continui:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## App classica vs. App AI: stesso flusso di lavoro

Hai appena distribuito un’applicazione web tradizionale. Ma cosa succede se volessi invece distribuire un’app alimentata da AI — per esempio, una chat app basata su Microsoft Foundry Models?

La buona notizia: **il flusso è identico.**

| Passo | App Todo classica | App Chat AI |
|------|-----------------|-------------|
| Inizializza (directory vuota) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autenticati | `azd auth login` | `azd auth login` |
| Distribuisci | `azd up` | `azd up` |
| Monitora | `azd monitor` | `azd monitor` |
| Pulisci | `azd down --force --purge` | `azd down --force --purge` |

I comandi di ciclo di vita sono gli stessi, ma i prerequisiti differiscono. Un modello AI può richiedere accesso a modelli, quote regionali, ingestione dati e configurazioni aggiuntive. Leggi il suo README prima di distribuire; `azd up` non può fornire autorizzazioni o quote mancanti.

Questo è il principio fondamentale di azd: **un flusso di lavoro, qualsiasi carico di lavoro.** Le abilità esercitate in questo tutorial — inizializzare, distribuire, monitorare, ridistribuire e pulire — si applicano ugualmente ad applicazioni e agenti AI.

---

## Cosa hai imparato

Complimenti! Hai completato con successo:
- ✅ Inizializzato un progetto azd da un modello
- ✅ Esplorato la struttura del progetto e i file chiave
- ✅ Distribuito un’applicazione full-stack su Azure
- ✅ Apportato modifiche al codice e ridistribuito
- ✅ Gestito più ambienti
- ✅ Pulito le risorse

## 🎯 Esercizi di convalida delle competenze

### Esercizio 1: Distribuisci un modello diverso (15 minuti)
**Obiettivo**: Dimostrare la padronanza di azd init e del flusso di lavoro di distribuzione

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Criteri di successo:**
- [ ] Applicazione distribuita senza errori
- [ ] Accesso all’URL dell’app nel browser
- [ ] Applicazione funziona correttamente (aggiungi/rimuovi todo)
- [ ] Tutte le risorse pulite con successo

### Esercizio 2: Personalizza la configurazione (20 minuti)
**Obiettivo**: Esercitarsi nella memorizzazione locale di valori di ambiente senza confonderli con la configurazione runtime

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Criteri di successo:**
- [ ] Ambiente personalizzato creato con successo
- [ ] Variabili ambiente impostate e recuperabili
- [ ] `azd env get-value APP_TITLE` stampa `My Custom Todo App`
- [ ] Spiega perché questi valori non modificano l’app standard a meno che codice/infrastruttura non li usi

### Esercizio 3: Flusso di lavoro multi-ambiente (25 minuti)
**Obiettivo**: Padroneggiare la gestione degli ambienti e le strategie di distribuzione

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criteri di successo:**
- [ ] Due ambienti creati con configurazioni diverse
- [ ] Entrambi gli ambienti distribuiti con successo
- [ ] Possibilità di passare tra ambienti usando `azd env select`
- [ ] Variabili ambiente diverse tra ambienti
- [ ] Entrambi gli ambienti puliti con successo

## 📊 I tuoi progressi

**Tempo investito**: ~60-90 minuti  
**Competenze acquisite**:
- ✅ Inizializzazione progetti da modelli
- ✅ Provisioning risorse Azure
- ✅ Flussi di lavoro di deployment applicazioni
- ✅ Gestione ambienti
- ✅ Gestione configurazione
- ✅ Pulizia risorse e gestione costi

**Livello successivo**: Sei pronto per la [Guida alla configurazione](../chapter-03-configuration/configuration.md) per imparare pattern avanzati di configurazione!

## Risoluzione dei problemi comuni

### Errori di autenticazione
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Fallimenti di distribuzione
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitti di nomi di risorse
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi di porta/rete
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Passi successivi

Ora che hai completato il tuo primo progetto, esplora questi argomenti avanzati:

### 1. Personalizza l’infrastruttura
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Aggiungi infrastruttura database](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Configura CI/CD
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) - Flussi CI/CD completi
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurazione pipeline

### 3. Best practice per la produzione
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) - Sicurezza, prestazioni e monitoraggio

### 4. Esplora altri modelli
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Risorse aggiuntive

### Materiali di apprendimento
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunità e supporto
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Community Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modelli ed esempi
- [Galleria ufficiale modelli](https://azure.github.io/awesome-azd/)
- [Contributi di modelli community](https://github.com/Azure/awesome-azd)
- [Origine modello Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto a creare e distribuire applicazioni straordinarie su Azure con fiducia.

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo attuale**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Installazione e Configurazione](installation.md)
- **➡️ Successivo**: [Porta la tua app](bring-your-own-app.md)
- **🚀 Capitolo successivo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
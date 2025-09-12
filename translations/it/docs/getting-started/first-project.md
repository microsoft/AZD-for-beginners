<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T19:09:38+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "it"
}
-->
# Il tuo primo progetto - Tutorial pratico

**Precedente:** [Configurazione](configuration.md) | **Successivo:** [Integrazione con Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)

## Introduzione

Benvenuto al tuo primo progetto con Azure Developer CLI! Questo tutorial pratico completo ti guiderà passo dopo passo nella creazione, distribuzione e gestione di un'applicazione full-stack su Azure utilizzando azd. Lavorerai con una vera applicazione todo che include un frontend React, un backend API Node.js e un database MongoDB.

## Obiettivi di apprendimento

Completando questo tutorial, sarai in grado di:
- Padroneggiare il flusso di inizializzazione dei progetti azd utilizzando i template
- Comprendere la struttura dei progetti Azure Developer CLI e i file di configurazione
- Eseguire la distribuzione completa di un'applicazione su Azure con provisioning dell'infrastruttura
- Implementare aggiornamenti dell'applicazione e strategie di ridistribuzione
- Gestire ambienti multipli per sviluppo e staging
- Applicare pratiche di pulizia delle risorse e gestione dei costi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Inizializzare e configurare autonomamente progetti azd dai template
- Navigare e modificare efficacemente le strutture dei progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere problemi comuni di distribuzione e autenticazione
- Gestire ambienti Azure multipli per diverse fasi di distribuzione
- Implementare flussi di distribuzione continua per aggiornamenti dell'applicazione

## Per iniziare

### Checklist dei prerequisiti
- ✅ Azure Developer CLI installato ([Guida all'installazione](installation.md))
- ✅ Azure CLI installato e autenticato
- ✅ Git installato sul tuo sistema
- ✅ Node.js 16+ (per questo tutorial)
- ✅ Visual Studio Code (consigliato)

### Verifica della configurazione
```bash
# Check azd installation
azd version
```
### Verifica dell'autenticazione su Azure

```bash
az account show
```

### Controlla la versione di Node.js
```bash
node --version
```

## Passo 1: Scegli e inizializza un template

Iniziamo con un popolare template di applicazione todo che include un frontend React e un backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Cosa è appena successo?
- Il codice del template è stato scaricato nella tua directory locale
- È stato creato un file `azure.yaml` con le definizioni dei servizi
- È stato configurato il codice dell'infrastruttura nella directory `infra/`
- È stata creata una configurazione dell'ambiente

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
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### File chiave da comprendere

**azure.yaml** - Il cuore del tuo progetto azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definizione dell'infrastruttura:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Passo 3: Personalizza il tuo progetto (opzionale)

Prima di distribuire, puoi personalizzare l'applicazione:

### Modifica il frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Fai una semplice modifica:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configura le variabili d'ambiente
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Passo 4: Distribuisci su Azure

Ora arriva la parte emozionante: distribuisci tutto su Azure!

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

Il comando `azd up` esegue questi passaggi:
1. **Provisioning** (`azd provision`) - Crea le risorse Azure
2. **Packaging** - Compila il codice della tua applicazione
3. **Distribuzione** (`azd deploy`) - Distribuisce il codice alle risorse Azure

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
Clicca sull'URL fornito nell'output della distribuzione, oppure recuperalo in qualsiasi momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa l'app Todo
1. **Aggiungi un elemento todo** - Clicca su "Add Todo" e inserisci un'attività
2. **Segna come completato** - Spunta gli elementi completati
3. **Elimina elementi** - Rimuovi i todo che non ti servono più

### Monitora la tua applicazione
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Passo 6: Apporta modifiche e ridistribuisci

Facciamo una modifica e vediamo quanto è facile aggiornare:

### Modifica l'API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Aggiungi un'intestazione di risposta personalizzata:
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

## Passo 7: Gestisci ambienti multipli

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

### Confronto tra ambienti
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
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Cosa hai imparato

Congratulazioni! Hai:
- Inizializzato un progetto azd da un template
- Esplorato la struttura del progetto e i file chiave
- Distribuito un'applicazione full-stack su Azure
- Apportato modifiche al codice e ridistribuito
- Gestito ambienti multipli
- Pulito le risorse

## Risoluzione dei problemi comuni

### Errori di autenticazione
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Fallimenti nella distribuzione
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Conflitti nei nomi delle risorse
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

## Prossimi passi

Ora che hai completato il tuo primo progetto, esplora questi argomenti avanzati:

### 1. Personalizza l'infrastruttura
- [Infrastructure as Code](../deployment/provisioning.md)
- [Aggiungi database, storage e altri servizi](../deployment/provisioning.md#adding-services)

### 2. Configura CI/CD
- [Integrazione con GitHub Actions](../deployment/cicd-integration.md)
- [Pipeline di Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Best practice per la produzione
- [Configurazioni di sicurezza](../deployment/best-practices.md#security)
- [Ottimizzazione delle prestazioni](../deployment/best-practices.md#performance)
- [Monitoraggio e logging](../deployment/best-practices.md#monitoring)

### 4. Esplora altri template
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Risorse aggiuntive

### Materiali di apprendimento
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community e supporto
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Community degli sviluppatori Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template ed esempi
- [Galleria ufficiale dei template](https://azure.github.io/awesome-azd/)
- [Template della community](https://github.com/Azure-Samples/azd-templates)
- [Pattern aziendali](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto per creare e distribuire applicazioni straordinarie su Azure con sicurezza.

---

**Precedente:** [Configurazione](configuration.md) | **Successivo:** [Integrazione con Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)
- **Prossima lezione**: [Guida alla distribuzione](../deployment/deployment-guide.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
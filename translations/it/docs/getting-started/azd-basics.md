<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T19:17:39+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "it"
}
-->
# AZD - Nozioni di base - Comprendere Azure Developer CLI

## Introduzione

Questa lezione ti introduce a Azure Developer CLI (azd), uno strumento da riga di comando potente che accelera il passaggio dallo sviluppo locale al deployment su Azure. Imparerai i concetti fondamentali, le funzionalità principali e come azd semplifica il deployment di applicazioni cloud-native.

## Obiettivi di apprendimento

Alla fine di questa lezione, sarai in grado di:
- Comprendere cos'è Azure Developer CLI e il suo scopo principale
- Apprendere i concetti fondamentali di template, ambienti e servizi
- Esplorare le funzionalità principali, tra cui lo sviluppo basato su template e l'Infrastructure as Code
- Comprendere la struttura e il flusso di lavoro di un progetto azd
- Essere pronto a installare e configurare azd per il tuo ambiente di sviluppo

## Risultati di apprendimento

Dopo aver completato questa lezione, sarai in grado di:
- Spiegare il ruolo di azd nei flussi di lavoro di sviluppo cloud moderni
- Identificare i componenti della struttura di un progetto azd
- Descrivere come template, ambienti e servizi lavorano insieme
- Comprendere i vantaggi dell'Infrastructure as Code con azd
- Riconoscere i diversi comandi azd e i loro scopi

## Cos'è Azure Developer CLI (azd)?

Azure Developer CLI (azd) è uno strumento da riga di comando progettato per accelerare il passaggio dallo sviluppo locale al deployment su Azure. Semplifica il processo di creazione, deployment e gestione di applicazioni cloud-native su Azure.

## Concetti fondamentali

### Template
I template sono la base di azd. Contengono:
- **Codice applicativo** - Il tuo codice sorgente e le dipendenze
- **Definizioni dell'infrastruttura** - Risorse Azure definite in Bicep o Terraform
- **File di configurazione** - Impostazioni e variabili d'ambiente
- **Script di deployment** - Flussi di lavoro automatizzati per il deployment

### Ambienti
Gli ambienti rappresentano diversi target di deployment:
- **Sviluppo** - Per test e sviluppo
- **Staging** - Ambiente pre-produzione
- **Produzione** - Ambiente di produzione live

Ogni ambiente mantiene il proprio:
- Gruppo di risorse Azure
- Impostazioni di configurazione
- Stato di deployment

### Servizi
I servizi sono i componenti fondamentali della tua applicazione:
- **Frontend** - Applicazioni web, SPAs
- **Backend** - API, microservizi
- **Database** - Soluzioni di archiviazione dati
- **Storage** - Archiviazione di file e blob

## Funzionalità principali

### 1. Sviluppo basato su template
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Linguaggio specifico di dominio di Azure
- **Terraform** - Strumento multi-cloud per l'infrastruttura
- **Template ARM** - Template di Azure Resource Manager

### 3. Flussi di lavoro integrati
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Gestione degli ambienti
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struttura del progetto

Una tipica struttura di progetto azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 File di configurazione

### azure.yaml
Il file principale di configurazione del progetto:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configurazione specifica dell'ambiente:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Flussi di lavoro comuni

### Avviare un nuovo progetto
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Ciclo di sviluppo
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Gestire più ambienti
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Comandi di navigazione

### Scoperta
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestione del progetto
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoraggio
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Migliori pratiche

### 1. Usa nomi significativi
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Sfrutta i template
- Inizia con template esistenti
- Personalizza in base alle tue esigenze
- Crea template riutilizzabili per la tua organizzazione

### 3. Isolamento degli ambienti
- Usa ambienti separati per sviluppo/staging/produzione
- Non effettuare mai il deployment direttamente in produzione dalla macchina locale
- Usa pipeline CI/CD per i deployment in produzione

### 4. Gestione della configurazione
- Usa variabili d'ambiente per dati sensibili
- Mantieni la configurazione sotto controllo di versione
- Documenta le impostazioni specifiche dell'ambiente

## Progressione di apprendimento

### Principiante (Settimana 1-2)
1. Installa azd e autentica
2. Effettua il deployment di un template semplice
3. Comprendi la struttura del progetto
4. Impara i comandi di base (up, down, deploy)

### Intermedio (Settimana 3-4)
1. Personalizza i template
2. Gestisci più ambienti
3. Comprendi il codice dell'infrastruttura
4. Configura pipeline CI/CD

### Avanzato (Settimana 5+)
1. Crea template personalizzati
2. Modelli avanzati di infrastruttura
3. Deployment multi-regione
4. Configurazioni di livello enterprise

## Prossimi passi

- [Installazione e configurazione](installation.md) - Installa e configura azd
- [Il tuo primo progetto](first-project.md) - Tutorial pratico
- [Guida alla configurazione](configuration.md) - Opzioni di configurazione avanzate

## Risorse aggiuntive

- [Panoramica di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galleria di template](https://azure.github.io/awesome-azd/)
- [Esempi della community](https://github.com/Azure-Samples)

---

**Navigazione**
- **Lezione precedente**: [README](../../README.md)
- **Prossima lezione**: [Installazione e configurazione](installation.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
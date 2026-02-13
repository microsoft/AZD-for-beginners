# Il tuo primo progetto - Tutorial pratico

**Navigazione Capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti & Avvio rapido
- **⬅️ Precedente**: [Installazione e configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo capitolo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Benvenuto al tuo primo progetto con Azure Developer CLI! Questo tutorial pratico completo fornisce una guida completa per la creazione, il deployment e la gestione di un'applicazione full-stack su Azure usando azd. Lavorerai con una vera applicazione todo che include un frontend React, un backend API Node.js e un database MongoDB.

## Obiettivi di apprendimento

Completando questo tutorial, tu:
- Padroneggerai il flusso di inizializzazione del progetto azd usando i template
- Comprenderai la struttura del progetto Azure Developer CLI e i file di configurazione
- Eseguirai il deployment completo dell'applicazione su Azure con il provisioning dell'infrastruttura
- Implementerai aggiornamenti dell'applicazione e strategie di ridistribuzione
- Gestirai più ambienti per sviluppo e staging
- Applicherai pratiche di pulizia delle risorse e gestione dei costi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Inizializzare e configurare progetti azd da template in modo indipendente
- Navigare e modificare efficacemente le strutture dei progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere problemi comuni di deployment e autenticazione
- Gestire più ambienti Azure per diverse fasi di deployment
- Implementare workflow di continuous deployment per aggiornamenti dell'applicazione

## Per iniziare

### Lista di prerequisiti
- ✅ Azure Developer CLI installato ([Guida all'installazione](installation.md))
- ✅ Azure CLI installato e autenticato
- ✅ Git installato sul tuo sistema
- ✅ Node.js 16+ (per questo tutorial)
- ✅ Visual Studio Code (consigliato)

### Verifica la tua configurazione
```bash
# Verificare l'installazione di azd
azd version
```
### Verifica l'autenticazione di Azure

```bash
az account show
```

### Verifica la versione di Node.js
```bash
node --version
```

## Passo 1: Scegli e Inizializza un template

Iniziamo con un popolare template di applicazione todo che include un frontend React e un backend API Node.js.

```bash
# Sfoglia i modelli disponibili
azd template list

# Inizializza il modello dell'app Todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Segui le istruzioni:
# - Inserisci un nome per l'ambiente: "dev"
# - Scegli una sottoscrizione (se ne hai più di una)
# - Scegli una regione: "East US 2" (o la tua regione preferita)
```

### Cosa è appena successo?
- Scaricato il codice del template nella tua directory locale
- Creato un file `azure.yaml` con le definizioni dei servizi
- Configurato il codice dell'infrastruttura nella directory `infra/`
- Creato una configurazione dell'ambiente

## Passo 2: Esplora la struttura del progetto

Esaminiamo cosa ha creato azd per noi:

```bash
# Visualizza la struttura del progetto
tree /f   # Windows
# o
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
# Visualizza la configurazione del progetto
cat azure.yaml
```

**infra/main.bicep** - Definizione dell'infrastruttura:
```bash
# Visualizza il codice dell'infrastruttura
head -30 infra/main.bicep
```

## Passo 3: Personalizza il tuo progetto (opzionale)

Prima del deployment, puoi personalizzare l'applicazione:

### Modifica il frontend
```bash
# Apri il componente dell'app React
code src/web/src/App.tsx
```

Fai una semplice modifica:
```typescript
// Trova il titolo e cambialo
<h1>My Awesome Todo App</h1>
```

### Configura le variabili d'ambiente
```bash
# Imposta variabili d'ambiente personalizzate
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Visualizza tutte le variabili d'ambiente
azd env get-values
```

## Passo 4: Distribuisci su Azure

Ora la parte entusiasmante - distribuisci tutto su Azure!

```bash
# Distribuire l'infrastruttura e l'applicazione
azd up

# Questo comando eseguirà:
# 1. Provisionare le risorse di Azure (App Service, Cosmos DB, ecc.)
# 2. Compilare la tua applicazione
# 3. Distribuire sulle risorse fornite
# 4. Visualizzare l'URL dell'applicazione
```

### Cosa succede durante il deployment?

The `azd up` command performs these steps:
1. **Provision** (`azd provision`) - Crea risorse Azure
2. **Package** - Compila il codice della tua applicazione
3. **Deploy** (`azd deploy`) - Distribuisce il codice sulle risorse Azure

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
Clicca sull'URL fornito nell'output del deployment, o ottienilo in qualsiasi momento:
```bash
# Ottieni gli endpoint dell'applicazione
azd show

# Apri l'applicazione nel tuo browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa l'app Todo
1. **Add a todo item** - Fai clic su "Aggiungi Todo" e inserisci un'attività
2. **Mark as complete** - Spunta gli elementi completati
3. **Delete items** - Rimuovi i todo che non ti servono più

### Monitora la tua applicazione
```bash
# Apri il portale di Azure per le tue risorse
azd monitor

# Visualizza i log dell'applicazione
azd monitor --logs

# Visualizza le metriche in tempo reale
azd monitor --live
```

## Passo 6: Apporta modifiche e ridistribuisci

Facciamo una modifica e vediamo quanto è facile aggiornare:

### Modifica l'API
```bash
# Modifica il codice dell'API
code src/api/src/routes/lists.js
```

Aggiungi un header di risposta personalizzato:
```javascript
// Trova un gestore di route e aggiungi:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuisci solo le modifiche al codice
```bash
# Distribuisci solo il codice dell'applicazione (salta l'infrastruttura)
azd deploy

# Questo è molto più veloce di 'azd up' poiché l'infrastruttura esiste già
```

## Passo 7: Gestisci più ambienti

Crea un ambiente di staging per testare le modifiche prima della produzione:

```bash
# Crea un nuovo ambiente di staging
azd env new staging

# Effettua il deploy su staging
azd up

# Torna all'ambiente di sviluppo
azd env select dev

# Elenca tutti gli ambienti
azd env list
```

### Confronto degli ambienti
```bash
# Visualizza ambiente di sviluppo
azd env select dev
azd show

# Visualizza ambiente di staging
azd env select staging
azd show
```

## Passo 8: Pulisci le risorse

Quando hai finito di sperimentare, pulisci per evitare addebiti continui:

```bash
# Elimina tutte le risorse Azure per l'ambiente corrente
azd down

# Forza l'eliminazione senza conferma e elimina definitivamente le risorse 'soft-deleted'
azd down --force --purge

# Elimina l'ambiente specifico
azd env select staging
azd down --force --purge
```

## Cosa hai imparato

Congratulazioni! Hai con successo:
- ✅ Inizializzato un progetto azd da un template
- ✅ Esplorato la struttura del progetto e i file chiave
- ✅ Distribuito un'applicazione full-stack su Azure
- ✅ Effettuato modifiche al codice e ridistribuito
- ✅ Gestito più ambienti
- ✅ Ripulito le risorse

## 🎯 Esercizi di convalida delle competenze

### Esercizio 1: Distribuisci un template diverso (15 minuti)
**Obiettivo**: Dimostrare padronanza di azd init e del flusso di lavoro di deployment

```bash
# Prova lo stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifica la distribuzione
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Pulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] L'applicazione viene distribuita senza errori
- [ ] È possibile accedere all'URL dell'applicazione nel browser
- [ ] L'applicazione funziona correttamente (aggiungere/rimuovere todo)
- [ ] Pulizia di tutte le risorse eseguita con successo

### Esercizio 2: Personalizza la configurazione (20 minuti)
**Obiettivo**: Esercitarsi nella configurazione delle variabili d'ambiente

```bash
cd my-first-azd-app

# Crea un ambiente personalizzato
azd env new custom-config

# Imposta le variabili personalizzate
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifica le variabili
azd env get-values | grep APP_TITLE

# Distribuisci con configurazione personalizzata
azd up
```

**Criteri di successo:**
- [ ] Ambiente personalizzato creato con successo
- [ ] Variabili d'ambiente impostate e recuperabili
- [ ] L'applicazione viene distribuita con la configurazione personalizzata
- [ ] È possibile verificare le impostazioni personalizzate nell'app distribuita

### Esercizio 3: Flusso di lavoro multi-ambiente (25 minuti)
**Obiettivo**: Padroneggiare la gestione degli ambienti e le strategie di deployment

```bash
# Crea l'ambiente di sviluppo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Annota l'URL di sviluppo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Crea l'ambiente di staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Annota l'URL di staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Confronta gli ambienti
azd env list

# Testa entrambi gli ambienti
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Pulisci entrambi gli ambienti
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criteri di successo:**
- [ ] Due ambienti creati con configurazioni diverse
- [ ] Entrambi gli ambienti distribuiti con successo
- [ ] È possibile passare tra gli ambienti utilizzando `azd env select`
- [ ] Le variabili d'ambiente differiscono tra gli ambienti
- [ ] Pulizia di entrambi gli ambienti eseguita con successo

## 📊 I tuoi progressi

**Tempo investito**: ~60-90 minuti  
**Competenze acquisite**:
- ✅ Inizializzazione del progetto basata su template
- ✅ Provisioning delle risorse Azure
- ✅ Flussi di lavoro per il deployment delle applicazioni
- ✅ Gestione degli ambienti
- ✅ Gestione della configurazione
- ✅ Pulizia delle risorse e gestione dei costi

**Prossimo livello**: Sei pronto per [Guida alla configurazione](configuration.md) per imparare modelli di configurazione avanzati!

## Risoluzione dei problemi comuni

### Errori di autenticazione
```bash
# Riautenticarsi con Azure
az login

# Verificare l'accesso alla sottoscrizione
az account show
```

### Errori di deployment
```bash
# Abilita la registrazione di debug
export AZD_DEBUG=true
azd up --debug

# Visualizza i log dell'applicazione in Azure
azd monitor --logs

# Per le Container Apps, usa Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitti nei nomi delle risorse
```bash
# Usa un nome di ambiente univoco
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi di porte/rete
```bash
# Verifica se le porte sono disponibili
netstat -an | grep :3000
netstat -an | grep :3100
```

## Passi successivi

Ora che hai completato il tuo primo progetto, esplora questi argomenti avanzati:

### 1. Personalizza l'infrastruttura
- [Infrastruttura come codice](../chapter-04-infrastructure/provisioning.md)
- [Aggiungi database, archiviazione e altri servizi](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configura CI/CD
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) - Flussi di lavoro CI/CD completi
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurazione della pipeline

### 3. Best practice di produzione
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) - Sicurezza, prestazioni e monitoraggio

### 4. Esplora altri template
```bash
# Sfoglia i modelli per categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prova diversi stack tecnologici
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Risorse aggiuntive

### Materiali di apprendimento
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community e supporto
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Community degli sviluppatori Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template ed esempi
- [Galleria ufficiale dei template](https://azure.github.io/awesome-azd/)
- [Template della community](https://github.com/Azure-Samples/azd-templates)
- [Pattern aziendali](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto per creare e distribuire applicazioni straordinarie su Azure con fiducia.

---

**Navigazione Capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti & Avvio rapido
- **⬅️ Precedente**: [Installazione e configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo capitolo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Lezione successiva**: [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua originale dovrebbe essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Il tuo primo progetto - Tutorial pratico

**Navigazione del capitolo:**
- **📚 Course Home**: [AZD per principianti](../../README.md)
- **📖 Current Chapter**: Capitolo 1 - Fondamenti & Avvio rapido
- **⬅️ Previous**: [Installazione e configurazione](installation.md)
- **➡️ Next**: [Configurazione](configuration.md)
- **🚀 Next Chapter**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Benvenuto al tuo primo progetto con Azure Developer CLI! Questo tutorial pratico e completo fornisce una guida passo-passo per la creazione, distribuzione e gestione di un'applicazione full-stack su Azure utilizzando azd. Lavorerai con una reale applicazione todo che include un frontend React, un backend API Node.js e un database MongoDB.

## Obiettivi di apprendimento

Completando questo tutorial, potrai:
- Padroneggiare il flusso di inizializzazione dei progetti azd utilizzando i template
- Comprendere la struttura del progetto Azure Developer CLI e i file di configurazione
- Eseguire il deployment completo dell'applicazione su Azure con il provisioning dell'infrastruttura
- Implementare aggiornamenti dell'applicazione e strategie di ridistribuzione
- Gestire più ambienti per sviluppo e staging
- Applicare pratiche di pulizia delle risorse e gestione dei costi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Inizializzare e configurare progetti azd da template in modo indipendente
- Navigare e modificare efficacemente le strutture dei progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere i problemi comuni di deployment e di autenticazione
- Gestire più ambienti Azure per diverse fasi di deployment
- Implementare workflow di deployment continuo per gli aggiornamenti dell'applicazione

## Iniziare

### Elenco dei prerequisiti
- ✅ Azure Developer CLI installato ([Guida all'installazione](installation.md))
- ✅ Autenticazione AZD completata con `azd auth login`
- ✅ Git installato sul tuo sistema
- ✅ Node.js 16+ (per questo tutorial)
- ✅ Visual Studio Code (consigliato)

Prima di continuare, esegui il validatore di setup dalla radice del repository:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifica la tua configurazione
```bash
# Verifica l'installazione di azd
azd version

# Verifica l'autenticazione di AZD
azd auth login --check-status
```

### Verifica opzionale dell'autenticazione Azure CLI

```bash
az account show
```

### Verifica la versione di Node.js
```bash
node --version
```

## Passo 1: Scegli e inizializza un template

Iniziamo con un popolare template per applicazioni todo che include un frontend React e un backend API Node.js.

```bash
# Sfoglia i modelli disponibili
azd template list

# Inizializza il modello dell'app todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Segui le istruzioni:
# - Inserisci un nome per l'ambiente: "dev"
# - Scegli una sottoscrizione (se ne hai più di una)
# - Scegli una regione: "East US 2" (o la tua regione preferita)
```

### Cosa è appena successo?
- Il codice del template è stato scaricato nella directory locale
- È stato creato un file `azure.yaml` con le definizioni dei servizi
- Il codice dell'infrastruttura è stato impostato nella directory `infra/`
- È stata creata una configurazione dell'ambiente

## Passo 2: Esplora la struttura del progetto

Esaminiamo cosa azd ha creato per noi:

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

## Passo 3: Personalizza il tuo progetto (Opzionale)

Prima del deployment, puoi personalizzare l'applicazione:

### Modifica il frontend
```bash
# Apri il componente dell'app React
code src/web/src/App.tsx
```

Effettua una modifica semplice:
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

E ora la parte entusiasmante - distribuisci tutto su Azure!

```bash
# Distribuire l'infrastruttura e l'applicazione
azd up

# Questo comando eseguirà:
# 1. Provisionare le risorse di Azure (App Service, Cosmos DB, ecc.)
# 2. Compilare la tua applicazione
# 3. Distribuire sulle risorse provisionate
# 4. Visualizzare l'URL dell'applicazione
```

### Cosa succede durante il deployment?

Il comando `azd up` esegue questi passaggi:
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
Clicca sull'URL fornito nell'output del deployment, oppure ottienilo in qualsiasi momento:
```bash
# Ottieni gli endpoint dell'applicazione
azd show

# Apri l'applicazione nel tuo browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test dell'app Todo
1. **Aggiungi un elemento todo** - Clicca su "Aggiungi Todo" e inserisci un'attività
2. **Segna come completato** - Spunta gli elementi completati
3. **Elimina elementi** - Rimuovi i todo che non ti servono più

### Monitora la tua applicazione
```bash
# Apri il portale di Azure per le tue risorse
azd monitor

# Visualizza i log dell'applicazione
azd monitor --logs

# Visualizza le metriche in tempo reale
azd monitor --live
```

### ✅ Verifica il tuo deployment

Prima di procedere, esegui questa rapida lista di controllo per confermare che tutto funzioni veramente—non dare per scontato che "deploy succeeded" significhi "app works":

```bash
# 1. Confermare che l'endpoint esista e sia raggiungibile
azd show

# 2. Eseguire uno smoke test sull'endpoint (si attende HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Verificare l'endpoint di salute se la tua app ne espone uno
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**La distribuzione è verificata quando:**
- ✅ `azd show` elenca un URL endpoint raggiungibile
- ✅ L'URL si apre nel tuo browser senza errori
- ✅ Le funzionalità principali funzionano (aggiungi/segna come completato/elimina un todo)
- ✅ `azd monitor --logs` mostra richieste in arrivo senza errori imprevisti

Se qualche controllo fallisce, passa a [Capitolo 7: Risoluzione dei problemi](../chapter-07-troubleshooting/README.md).

## Passo 6: Apporta modifiche e ridistribuisci

Apportiamo una modifica e vediamo quanto è facile aggiornare:

### Modifica l'API
```bash
# Modifica il codice dell'API
code src/api/src/routes/lists.js
```

Aggiungi un'intestazione di risposta personalizzata:
```javascript
// Trova un gestore della rotta e aggiungi:
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

# Distribuisci in staging
azd up

# Torna all'ambiente di sviluppo
azd env select dev

# Elenca tutti gli ambienti
azd env list
```

### Confronto degli ambienti
```bash
# Visualizza l'ambiente di sviluppo
azd env select dev
azd show

# Visualizza l'ambiente di staging
azd env select staging
azd show
```

## Passo 8: Pulisci le risorse

Quando hai finito di sperimentare, pulisci le risorse per evitare costi ricorrenti:

```bash
# Elimina tutte le risorse di Azure per l'ambiente corrente
azd down

# Forza l'eliminazione senza conferma e purga le risorse eliminate con soft delete
azd down --force --purge

# Elimina un ambiente specifico
azd env select staging
azd down --force --purge
```

## App classica vs. App con IA: stesso flusso di lavoro

Hai appena distribuito un'applicazione web tradizionale. Ma cosa succede se volessi distribuire invece un'app con IA — per esempio, un'app di chat supportata dai modelli Microsoft Foundry?

La buona notizia: **il flusso di lavoro è identico.**

| Passo | App Todo classica | App Chat con IA |
|------|-----------------|-------------|
| Inizializza | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentica | `azd auth login` | `azd auth login` |
| Distribuisci | `azd up` | `azd up` |
| Monitora | `azd monitor` | `azd monitor` |
| Pulisci | `azd down --force --purge` | `azd down --force --purge` |

L'unica differenza è il **template** da cui parti. Un template per IA include infrastrutture aggiuntive (come una risorsa Microsoft Foundry Models o un indice AI Search), ma azd gestisce tutto questo per te. Non è necessario imparare nuovi comandi, adottare uno strumento diverso o cambiare il modo in cui pensi al deployment.

Questo è il principio fondamentale di azd: **un flusso di lavoro, qualsiasi carico di lavoro.** Le competenze che hai praticato in questo tutorial—inizializzazione, deployment, monitoraggio, ridistribuzione e pulizia—si applicano allo stesso modo alle applicazioni e agli agenti con IA.

---

## Cosa hai imparato

Congratulazioni! Hai completato con successo:
- ✅ Inizializzato un progetto azd da un template
- ✅ Esplorato la struttura del progetto e i file chiave
- ✅ Distribuito un'applicazione full-stack su Azure
- ✅ Effettuato modifiche al codice e ridistribuito
- ✅ Gestito più ambienti
- ✅ Ripulito le risorse

## 🎯 Esercizi di convalida delle competenze

### Esercizio 1: Distribuisci un template diverso (15 minuti)
**Obiettivo**: Dimostrare padronanza di azd init e del flusso di deployment

```bash
# Provare lo stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificare il deployment
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Ripulire
azd down --force --purge
```

**Criteri di successo:**
- [ ] L'applicazione viene distribuita senza errori
- [ ] È possibile accedere all'URL dell'applicazione nel browser
- [ ] L'applicazione funziona correttamente (aggiungi/rimuovi todo)
- [ ] Tutte le risorse sono state pulite con successo

### Esercizio 2: Personalizza la configurazione (20 minuti)
**Obiettivo**: Esercitarsi nella configurazione delle variabili d'ambiente

```bash
cd my-first-azd-app

# Creare un ambiente personalizzato
azd env new custom-config

# Impostare variabili personalizzate
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verificare le variabili
azd env get-values | grep APP_TITLE

# Distribuire con configurazione personalizzata
azd up
```

**Criteri di successo:**
- [ ] Ambiente personalizzato creato con successo
- [ ] Le variabili d'ambiente sono impostate e recuperabili
- [ ] L'applicazione viene distribuita con la configurazione personalizzata
- [ ] È possibile verificare le impostazioni personalizzate nell'app distribuita

### Esercizio 3: Flusso di lavoro multi-ambiente (25 minuti)
**Obiettivo**: Padroneggiare la gestione degli ambienti e le strategie di deployment

```bash
# Crea ambiente di sviluppo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Annota l'URL di sviluppo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Crea ambiente di staging
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
- [ ] È possibile passare tra gli ambienti usando `azd env select`
- [ ] Le variabili d'ambiente differiscono tra gli ambienti
- [ ] Entrambi gli ambienti sono stati puliti con successo

## 📊 I tuoi progressi

**Tempo investito**: ~60-90 minuti  
**Competenze acquisite**:
- ✅ Inizializzazione di progetti basata su template
- ✅ Provisioning delle risorse Azure
- ✅ Workflow di deployment delle applicazioni
- ✅ Gestione degli ambienti
- ✅ Gestione della configurazione
- ✅ Pulizia delle risorse e gestione dei costi

**Prossimo livello**: Sei pronto per la [Guida alla configurazione](configuration.md) per apprendere pattern di configurazione avanzati!

## Risoluzione dei problemi comuni

### Errori di autenticazione
```bash
# Riautenticarsi con Azure
az login

# Verificare l'accesso alla sottoscrizione
az account show
```

### Fallimenti del deployment
```bash
# Abilita la registrazione di debug
export AZD_DEBUG=true
azd up --debug

# Visualizza i log dell'applicazione in Azure
azd monitor --logs

# Per Container Apps, usa Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitti nei nomi delle risorse
```bash
# Usa un nome univoco per l'ambiente
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi di porta/rete
```bash
# Controlla se le porte sono disponibili
netstat -an | grep :3000
netstat -an | grep :3100
```

## Prossimi passi

Ora che hai completato il tuo primo progetto, esplora questi argomenti avanzati:

### 1. Personalizza l'infrastruttura
- [Infrastruttura come codice](../chapter-04-infrastructure/provisioning.md)
- [Aggiungi database, storage e altri servizi](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configura CI/CD
- [Guida al deployment](../chapter-04-infrastructure/deployment-guide.md) - Workflow CI/CD completi
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurazione delle pipeline

### 3. Best practice per la produzione
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
- [Centro di architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunità e supporto
- [Repository GitHub di Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunità degli sviluppatori Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template ed esempi
- [Galleria ufficiale dei template](https://azure.github.io/awesome-azd/)
- [Template della community](https://github.com/Azure-Samples/azd-templates)
- [Pattern aziendali](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto per creare e distribuire applicazioni straordinarie su Azure con sicurezza.

---

**Navigazione del capitolo:**
- **📚 Course Home**: [AZD per principianti](../../README.md)
- **📖 Current Chapter**: Capitolo 1 - Fondamenti & Avvio rapido
- **⬅️ Previous**: [Installazione e configurazione](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
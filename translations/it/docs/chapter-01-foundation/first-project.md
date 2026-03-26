# Il tuo primo progetto - Tutorial pratico

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti e avvio rapido
- **⬅️ Precedente**: [Installazione e configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo capitolo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Benvenuto al tuo primo progetto con Azure Developer CLI! Questo tutorial pratico e completo offre una guida passo dopo passo per creare, distribuire e gestire un'applicazione full-stack su Azure usando azd. Lavorerai con una vera applicazione todo che include un frontend React, un backend API Node.js e un database MongoDB.

## Obiettivi di apprendimento

Completando questo tutorial, sarai in grado di:
- Padroneggiare il flusso di inizializzazione del progetto azd usando i template
- Comprendere la struttura del progetto Azure Developer CLI e i file di configurazione
- Eseguire il deployment completo dell'applicazione su Azure con il provisioning dell'infrastruttura
- Implementare aggiornamenti dell'applicazione e strategie di redeploy
- Gestire più ambienti per sviluppo e staging
- Applicare pratiche di pulizia delle risorse e gestione dei costi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Inizializzare e configurare progetti azd da template in modo autonomo
- Navigare e modificare efficacemente le strutture dei progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere problemi comuni di deployment e autenticazione
- Gestire più ambienti Azure per diverse fasi di distribuzione
- Implementare flussi di distribuzione continua per aggiornamenti dell'applicazione

## Per iniziare

### Lista di controllo dei prerequisiti
- ✅ Azure Developer CLI installata ([Installation Guide](installation.md))
- ✅ Azure CLI installata e autenticata
- ✅ Git installato sul tuo sistema
- ✅ Node.js 16+ (per questo tutorial)
- ✅ Visual Studio Code (consigliato)

### Verifica della configurazione
```bash
# Verificare l'installazione di azd
azd version
```
### Verifica autenticazione Azure

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
# Sfoglia i modelli disponibili
azd template list

# Inizializza il modello dell'app to-do
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
- Creato una configurazione di ambiente

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

## Passo 3: Personalizza il progetto (Opzionale)

Prima del deployment, puoi personalizzare l'applicazione:

### Modifica il frontend
```bash
# Apri il componente dell'app React
code src/web/src/App.tsx
```

Effettua una semplice modifica:
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

Ora la parte emozionante - distribuisci tutto su Azure!

```bash
# Distribuire l'infrastruttura e l'applicazione
azd up

# Questo comando eseguirà:
# 1. Provisionare le risorse di Azure (App Service, Cosmos DB, ecc.)
# 2. Compilare la tua applicazione
# 3. Distribuire l'applicazione sulle risorse create
# 4. Visualizzare l'URL dell'applicazione
```

### Cosa succede durante il deployment?

Il comando `azd up` esegue questi passaggi:
1. **Provision** (`azd provision`) - Crea le risorse Azure
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
1. **Aggiungi un elemento todo** - Clicca su "Add Todo" e inserisci un'attività
2. **Segna come completato** - Seleziona gli elementi completati
3. **Elimina elementi** - Rimuovi i todo di cui non hai più bisogno

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

# Distribuisci su staging
azd up

# Torna all'ambiente di sviluppo
azd env select dev

# Elenca tutti gli ambienti
azd env list
```

### Confronto tra ambienti
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
# Elimina tutte le risorse di Azure per l'ambiente corrente
azd down

# Forza l'eliminazione senza conferma e purga le risorse in stato 'soft-deleted'
azd down --force --purge

# Elimina l'ambiente specificato
azd env select staging
azd down --force --purge
```

## App classica vs. App potenziata con AI: stesso flusso di lavoro

Hai appena distribuito un'app web tradizionale. Ma se volessi distribuire invece un'app potenziata dall'AI—ad esempio, un'app di chat supportata da Microsoft Foundry Models?

La buona notizia: **il flusso di lavoro è identico.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

L'unica differenza è il **template** da cui parti. Un template AI include infrastruttura aggiuntiva (come una risorsa Microsoft Foundry Models o un indice AI Search), ma azd gestisce tutto ciò per te. Non devi imparare nuovi comandi, adottare uno strumento diverso o cambiare il modo in cui pensi al deployment.

Questo è il principio fondamentale di azd: **un flusso di lavoro, qualsiasi carico di lavoro.** Le competenze praticate in questo tutorial—inizializzare, distribuire, monitorare, ridistribuire e pulire—si applicano allo stesso modo alle applicazioni AI e agli agenti.

---

## Cosa hai imparato

Congratulazioni! Hai completato con successo:
- ✅ Inizializzato un progetto azd da un template
- ✅ Esplorato la struttura del progetto e i file chiave
- ✅ Distribuito un'applicazione full-stack su Azure
- ✅ Effettuato modifiche al codice e ridistribuito
- ✅ Gestito più ambienti
- ✅ Pulito le risorse

## 🎯 Esercizi di convalida delle competenze

### Esercizio 1: Distribuisci un template diverso (15 minuti)
**Obiettivo**: Dimostrare padronanza di azd init e del flusso di deployment

```bash
# Prova lo stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifica il deployment
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Pulisci
azd down --force --purge
```

**Criteri di successo:**
- [ ] L'applicazione viene distribuita senza errori
- [ ] È possibile accedere all'URL dell'applicazione nel browser
- [ ] L'applicazione funziona correttamente (aggiungi/rimuovi todo)
- [ ] Tutte le risorse sono state pulite con successo

### Esercizio 2: Personalizza la configurazione (20 minuti)
**Obiettivo**: Esercitarsi con la configurazione delle variabili d'ambiente

```bash
cd my-first-azd-app

# Crea un ambiente personalizzato
azd env new custom-config

# Imposta variabili personalizzate
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifica variabili
azd env get-values | grep APP_TITLE

# Distribuisci con configurazione personalizzata
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
- [ ] Entrambi gli ambienti puliti con successo

## 📊 Il tuo progresso

**Tempo investito**: ~60-90 minuti  
**Competenze acquisite**:
- ✅ Inizializzazione del progetto basata su template
- ✅ Provisioning delle risorse Azure
- ✅ Flussi di lavoro di deployment dell'applicazione
- ✅ Gestione degli ambienti
- ✅ Gestione della configurazione
- ✅ Pulizia delle risorse e gestione dei costi

**Prossimo livello**: Sei pronto per la [Guida alla configurazione](configuration.md) per apprendere pattern avanzati di configurazione!

## Risoluzione dei problemi comuni

### Errori di autenticazione
```bash
# Riautenticarsi con Azure
az login

# Verificare l'accesso all'abbonamento
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
# Usa un nome di ambiente univoco
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi di porta/rete
```bash
# Verifica se le porte sono disponibili
netstat -an | grep :3000
netstat -an | grep :3100
```

## Passaggi successivi

Ora che hai completato il tuo primo progetto, esplora questi argomenti avanzati:

### 1. Personalizza l'infrastruttura
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Aggiungi database, archiviazione e altri servizi](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configura CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Flussi CI/CD completi
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurazione delle pipeline

### 3. Best practice per la produzione
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Sicurezza, prestazioni e monitoraggio

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

### Materiale didattico
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community e supporto
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template ed esempi
- [Galleria ufficiale dei template](https://azure.github.io/awesome-azd/)
- [Template della community](https://github.com/Azure-Samples/azd-templates)
- [Pattern enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto per creare e distribuire applicazioni straordinarie su Azure con fiducia.

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti e avvio rapido
- **⬅️ Precedente**: [Installazione e configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo capitolo**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Lezione successiva**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua originale deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
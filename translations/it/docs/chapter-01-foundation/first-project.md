# Il tuo primo progetto - Tutorial pratico

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti e avvio rapido
- **⬅️ Precedente**: [Installazione e configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo capitolo**: [Capitolo 2: Sviluppo incentrato sull'IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduzione

Benvenuto al tuo primo progetto con Azure Developer CLI! Questo tutorial pratico e completo offre una guida passo-passo per creare, distribuire e gestire un'applicazione full-stack su Azure usando azd. Lavorerai con una vera applicazione todo che include un frontend React, un backend API in Node.js e un database MongoDB.

## Obiettivi di apprendimento

Completando questo tutorial, sarai in grado di:
- Padroneggiare il flusso di inizializzazione del progetto azd usando template
- Comprendere la struttura del progetto Azure Developer CLI e i file di configurazione
- Eseguire la distribuzione completa dell'applicazione su Azure con provisioning dell'infrastruttura
- Implementare aggiornamenti dell'applicazione e strategie di ridistribuzione
- Gestire più ambienti per sviluppo e staging
- Applicare pratiche di pulizia delle risorse e gestione dei costi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Inizializzare e configurare progetti azd da template in modo indipendente
- Navigare e modificare efficacemente le strutture dei progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere problemi comuni di distribuzione e autenticazione
- Gestire più ambienti Azure per diverse fasi di distribuzione
- Implementare flussi di distribuzione continua per gli aggiornamenti dell'applicazione

## Per cominciare

### Lista di controllo dei prerequisiti
- ✅ Azure Developer CLI installato ([Guida all'installazione](installation.md))
- ✅ Autenticazione AZD completata con `azd auth login`
- ✅ Git installato sul tuo sistema
- ✅ Node.js 16+ (per questo tutorial)
- ✅ Visual Studio Code (consigliato)

Prima di continuare, esegui il validatore di configurazione dalla radice del repository:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifica la tua configurazione
```bash
# Verificare l'installazione di azd
azd version

# Verificare l'autenticazione di AZD
azd auth login --check-status
```

### Verifica l'autenticazione opzionale con Azure CLI

```bash
az account show
```

### Verifica la versione di Node.js
```bash
node --version
```

## Passo 1: Scegli e inizializza un modello

Iniziamo con un popolare template per applicazioni todo che include un frontend React e un backend API in Node.js.

```bash
# Esplora i modelli disponibili
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
- Scaricato il codice del template nella tua directory locale
- Creato un file `azure.yaml` con le definizioni dei servizi
- Impostato il codice dell'infrastruttura nella directory `infra/`
- Creata una configurazione dell'ambiente

## Passo 2: Esplora la struttura del progetto

Esaminiamo ciò che azd ha creato per noi:

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

Prima della distribuzione, puoi personalizzare l'applicazione:

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

Ora arriva la parte entusiasmante - distribuisci tutto su Azure!

```bash
# Distribuire l'infrastruttura e l'applicazione
azd up

# Questo comando eseguirà:
# 1. Provisionare le risorse di Azure (App Service, Cosmos DB, ecc.)
# 2. Compilare la tua applicazione
# 3. Distribuire sulle risorse predisposte
# 4. Visualizzare l'URL dell'applicazione
```

### Cosa succede durante la distribuzione?

Il comando `azd up` esegue questi passaggi:
1. **Provisioning** (`azd provision`) - Crea le risorse di Azure
2. **Package** - Compila il codice della tua applicazione
3. **Deploy** (`azd deploy`) - Distribuisce il codice sulle risorse di Azure

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
Clicca sull'URL fornito nell'output della distribuzione, o ottienilo in qualsiasi momento:
```bash
# Ottieni gli endpoint dell'applicazione
azd show

# Apri l'applicazione nel tuo browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test dell'app Todo
1. **Aggiungi un elemento todo** - Clicca su "Aggiungi Todo" e inserisci un'attività
2. **Segna come completato** - Seleziona gli elementi completati
3. **Elimina elementi** - Rimuovi i todo che non ti servono più

### Monitora la tua applicazione
```bash
# Apri il portale di Azure per le tue risorse
azd monitor

# Visualizza i log dell'applicazione
azd monitor --logs

# Visualizza metriche in tempo reale
azd monitor --live
```

## Passo 6: Apporta modifiche e ridistribuisci

Apportiamo una modifica e vediamo quanto è facile aggiornare:

### Modifica l'API
```bash
# Modifica il codice dell'API
code src/api/src/routes/lists.js
```

Aggiungi un'intestazione di risposta personalizzata:
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

# Distribuisci in staging
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

Quando hai finito di sperimentare, pulisci le risorse per evitare costi ricorrenti:

```bash
# Elimina tutte le risorse di Azure per l'ambiente corrente
azd down

# Forza la cancellazione senza conferma e purga le risorse eliminate temporaneamente
azd down --force --purge

# Elimina l'ambiente specifico
azd env select staging
azd down --force --purge
```

## App classica vs. App potenziata dall'IA: stesso flusso di lavoro

Hai appena distribuito un'applicazione web tradizionale. Ma cosa succede se volessi distribuire invece un'app potenziata dall'IA—ad esempio, un'app di chat supportata dai Microsoft Foundry Models?

La buona notizia: **il flusso di lavoro è identico.**

| Passo | App Todo classica | App Chat IA |
|------|-------------------|-------------|
| Inizializza | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentica | `azd auth login` | `azd auth login` |
| Distribuisci | `azd up` | `azd up` |
| Monitora | `azd monitor` | `azd monitor` |
| Pulisci | `azd down --force --purge` | `azd down --force --purge` |

L'unica differenza è il **template** da cui parti. Un template AI include infrastrutture aggiuntive (come una risorsa Microsoft Foundry Models o un indice AI Search), ma azd gestisce tutto questo per te. Non è necessario imparare nuovi comandi, adottare uno strumento diverso o cambiare il modo in cui pensi alla distribuzione.

Questo è il principio fondamentale di azd: **un flusso di lavoro, qualsiasi carico di lavoro.** Le competenze che hai esercitato in questo tutorial—inizializzare, distribuire, monitorare, ridistribuire e pulire—si applicano allo stesso modo alle applicazioni e agli agenti AI.

---

## Cosa hai imparato

Congratulazioni! Hai completato con successo:
- ✅ Inizializzato un progetto azd da un template
- ✅ Esplorato la struttura del progetto e i file chiave
- ✅ Distribuito un'applicazione full-stack su Azure
- ✅ Apportato modifiche al codice e ridistribuito
- ✅ Gestito più ambienti
- ✅ Pulito le risorse

## 🎯 Esercizi per la convalida delle competenze

### Esercizio 1: Distribuisci un template diverso (15 minuti)
**Obiettivo**: Dimostrare padronanza di azd init e del flusso di distribuzione

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
- [ ] L'applicazione si distribuisce senza errori
- [ ] È possibile accedere all'URL dell'applicazione nel browser
- [ ] L'applicazione funziona correttamente (aggiungi/rimuovi todo)
- [ ] Tutte le risorse sono state rimosse con successo

### Esercizio 2: Personalizza la configurazione (20 minuti)
**Obiettivo**: Esercitarsi nella configurazione delle variabili d'ambiente

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
- [ ] Variabili d'ambiente impostate e recuperabili
- [ ] L'applicazione si distribuisce con la configurazione personalizzata
- [ ] È possibile verificare le impostazioni personalizzate nell'app distribuita

### Esercizio 3: Flusso di lavoro multi-ambiente (25 minuti)
**Obiettivo**: Padroneggiare la gestione degli ambienti e le strategie di distribuzione

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

# Ripulisci entrambi gli ambienti
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criteri di successo:**
- [ ] Due ambienti creati con configurazioni diverse
- [ ] Entrambi gli ambienti distribuiti con successo
- [ ] È possibile passare tra gli ambienti usando `azd env select`
- [ ] Le variabili d'ambiente differiscono tra gli ambienti
- [ ] Entrambi gli ambienti sono stati puliti con successo

## 📊 Il tuo progresso

**Tempo Investito**: ~60-90 minuti  
**Competenze acquisite**:
- ✅ Inizializzazione di progetti basata su template
- ✅ Provisioning delle risorse Azure
- ✅ Flussi di lavoro per la distribuzione di applicazioni
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

### Errori di distribuzione
```bash
# Abilita il logging di debug
export AZD_DEBUG=true
azd up --debug

# Visualizza i log dell'applicazione in Azure
azd monitor --logs

# Per Container Apps, usa Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitti di nomi delle risorse
```bash
# Usa un nome di ambiente univoco
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
- [Guida alla distribuzione](../chapter-04-infrastructure/deployment-guide.md) - Flussi CI/CD completi
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configurazione pipeline

### 3. Best practice per la produzione
- [Guida alla distribuzione](../chapter-04-infrastructure/deployment-guide.md) - Sicurezza, prestazioni e monitoraggio

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

### Materiale di apprendimento
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunità e supporto
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template ed esempi
- [Galleria ufficiale dei template](https://azure.github.io/awesome-azd/)
- [Template della community](https://github.com/Azure-Samples/azd-templates)
- [Pattern aziendali](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto a creare e distribuire applicazioni straordinarie su Azure con fiducia.

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 1 - Fondamenti e avvio rapido
- **⬅️ Precedente**: [Installazione e configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo capitolo**: [Capitolo 2: Sviluppo incentrato sull'IA](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Lezione successiva**: [Guida alla distribuzione](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci sforziamo di garantire l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua originale dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-20T22:28:20+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "it"
}
-->
# Il tuo primo progetto - Tutorial pratico

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo attuale**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Installazione e Configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo Capitolo**: [Capitolo 2: Sviluppo AI-First](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduzione

Benvenuto al tuo primo progetto con Azure Developer CLI! Questo tutorial pratico ti guiderà passo dopo passo nella creazione, distribuzione e gestione di un'applicazione full-stack su Azure utilizzando azd. Lavorerai con una vera applicazione todo che include un frontend React, un backend API Node.js e un database MongoDB.

## Obiettivi di apprendimento

Completando questo tutorial, sarai in grado di:
- Padroneggiare il flusso di inizializzazione di un progetto azd utilizzando i template
- Comprendere la struttura e i file di configurazione di un progetto Azure Developer CLI
- Eseguire la distribuzione completa di un'applicazione su Azure con provisioning dell'infrastruttura
- Implementare aggiornamenti dell'applicazione e strategie di ridistribuzione
- Gestire più ambienti per sviluppo e staging
- Applicare pratiche di pulizia delle risorse e gestione dei costi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Inizializzare e configurare autonomamente progetti azd dai template
- Navigare e modificare efficacemente le strutture dei progetti azd
- Distribuire applicazioni full-stack su Azure con comandi singoli
- Risolvere problemi comuni di distribuzione e autenticazione
- Gestire più ambienti Azure per diverse fasi di distribuzione
- Implementare flussi di distribuzione continua per aggiornamenti dell'applicazione

## Per iniziare

### Lista di controllo dei prerequisiti
- ✅ Azure Developer CLI installato ([Guida all'installazione](installation.md))
- ✅ Azure CLI installato e autenticato
- ✅ Git installato sul tuo sistema
- ✅ Node.js 16+ (per questo tutorial)
- ✅ Visual Studio Code (consigliato)

### Verifica della configurazione
```bash
# Controlla l'installazione di azd
azd version
```
### Verifica dell'autenticazione Azure

```bash
az account show
```

### Controlla la versione di Node.js
```bash
node --version
```

## Passo 1: Scegli e inizializza un template

Iniziamo con un template popolare per un'applicazione todo che include un frontend React e un backend API Node.js.

```bash
# Sfoglia i modelli disponibili
azd template list

# Inizializza il modello dell'app todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Segui le istruzioni:
# - Inserisci un nome per l'ambiente: "dev"
# - Scegli un abbonamento (se ne hai più di uno)
# - Scegli una regione: "East US 2" (o la tua regione preferita)
```

### Cosa è appena successo?
- Il codice del template è stato scaricato nella tua directory locale
- È stato creato un file `azure.yaml` con le definizioni dei servizi
- È stato configurato il codice dell'infrastruttura nella directory `infra/`
- È stata creata una configurazione dell'ambiente

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

Prima della distribuzione, puoi personalizzare l'applicazione:

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
# Imposta variabili di ambiente personalizzate
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Visualizza tutte le variabili di ambiente
azd env get-values
```

## Passo 4: Distribuisci su Azure

Ora arriva la parte emozionante: distribuisci tutto su Azure!

```bash
# Distribuire infrastruttura e applicazione
azd up

# Questo comando farà:
# 1. Fornire risorse Azure (App Service, Cosmos DB, ecc.)
# 2. Compilare la tua applicazione
# 3. Distribuire alle risorse fornite
# 4. Mostrare l'URL dell'applicazione
```

### Cosa succede durante la distribuzione?

Il comando `azd up` esegue questi passaggi:
1. **Provision** (`azd provision`) - Crea le risorse Azure
2. **Package** - Compila il codice della tua applicazione
3. **Deploy** (`azd deploy`) - Distribuisce il codice alle risorse Azure

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
# Ottieni gli endpoint dell'applicazione
azd show

# Apri l'applicazione nel tuo browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa l'app Todo
1. **Aggiungi un elemento todo** - Clicca su "Add Todo" e inserisci un'attività
2. **Segna come completato** - Spunta gli elementi completati
3. **Elimina elementi** - Rimuovi i todo che non ti servono più

### Monitora la tua applicazione
```bash
# Apri il portale Azure per le tue risorse
azd monitor

# Visualizza i log dell'applicazione
azd logs
```

## Passo 6: Apporta modifiche e ridistribuisci

Facciamo una modifica e vediamo quanto è facile aggiornare:

### Modifica l'API
```bash
# Modifica il codice API
code src/api/src/routes/lists.js
```

Aggiungi un'intestazione di risposta personalizzata:
```javascript
// Trova un gestore di percorso e aggiungi:
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
# Creare un nuovo ambiente di staging
azd env new staging

# Distribuire su staging
azd up

# Tornare all'ambiente di sviluppo
azd env select dev

# Elencare tutti gli ambienti
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

Quando hai finito di sperimentare, pulisci per evitare costi continui:

```bash
# Elimina tutte le risorse Azure per l'ambiente corrente
azd down

# Elimina forzatamente senza conferma e purga le risorse eliminate in modo soft
azd down --force --purge

# Elimina un ambiente specifico
azd env select staging
azd down --force --purge
```

## Cosa hai imparato

Congratulazioni! Hai completato con successo:
- ✅ L'inizializzazione di un progetto azd da un template
- ✅ L'esplorazione della struttura del progetto e dei file chiave
- ✅ La distribuzione di un'applicazione full-stack su Azure
- ✅ L'apporto di modifiche al codice e la ridistribuzione
- ✅ La gestione di più ambienti
- ✅ La pulizia delle risorse

## 🎯 Esercizi di validazione delle competenze

### Esercizio 1: Distribuisci un template diverso (15 minuti)
**Obiettivo**: Dimostrare la padronanza del flusso di inizializzazione e distribuzione di azd

```bash
# Prova stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifica distribuzione
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
**Obiettivo**: Praticare la configurazione delle variabili d'ambiente

```bash
cd my-first-azd-app

# Creare ambiente personalizzato
azd env new custom-config

# Impostare variabili personalizzate
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verificare variabili
azd env get-values | grep APP_TITLE

# Distribuire con configurazione personalizzata
azd up
```

**Criteri di successo:**
- [ ] Ambiente personalizzato creato con successo
- [ ] Variabili d'ambiente impostate e recuperabili
- [ ] Applicazione distribuita con configurazione personalizzata
- [ ] È possibile verificare le impostazioni personalizzate nell'app distribuita

### Esercizio 3: Workflow multi-ambiente (25 minuti)
**Obiettivo**: Padroneggiare la gestione degli ambienti e le strategie di distribuzione

```bash
# Creare ambiente di sviluppo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Annotare URL di sviluppo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Creare ambiente di staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Annotare URL di staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Confrontare gli ambienti
azd env list

# Testare entrambi gli ambienti
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Pulire entrambi
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criteri di successo:**
- [ ] Due ambienti creati con configurazioni diverse
- [ ] Entrambi gli ambienti distribuiti con successo
- [ ] È possibile passare tra gli ambienti utilizzando `azd env select`
- [ ] Le variabili d'ambiente differiscono tra gli ambienti
- [ ] Entrambi gli ambienti sono stati puliti con successo

## 📊 Il tuo progresso

**Tempo investito**: ~60-90 minuti  
**Competenze acquisite**:
- ✅ Inizializzazione di progetti basati su template
- ✅ Provisioning delle risorse Azure
- ✅ Workflow di distribuzione delle applicazioni
- ✅ Gestione degli ambienti
- ✅ Gestione della configurazione
- ✅ Pulizia delle risorse e gestione dei costi

**Prossimo livello**: Sei pronto per [Guida alla configurazione](configuration.md) per imparare modelli di configurazione avanzati!

## Risoluzione dei problemi comuni

### Errori di autenticazione
```bash
# Autenticarsi nuovamente con Azure
az login

# Verificare l'accesso all'abbonamento
az account show
```

### Fallimenti nella distribuzione
```bash
# Abilita la registrazione di debug
export AZD_DEBUG=true
azd up --debug

# Visualizza i log dettagliati
azd logs --service api
azd logs --service web
```

### Conflitti nei nomi delle risorse
```bash
# Usa un nome ambiente unico
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi di porta/rete
```bash
# Verifica se le porte sono disponibili
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
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunità e supporto
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunità degli sviluppatori Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Template ed esempi
- [Galleria ufficiale dei template](https://azure.github.io/awesome-azd/)
- [Template della comunità](https://github.com/Azure-Samples/azd-templates)
- [Modelli aziendali](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Congratulazioni per aver completato il tuo primo progetto azd!** Ora sei pronto per creare e distribuire applicazioni straordinarie su Azure con sicurezza.

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo attuale**: Capitolo 1 - Fondamenti e Avvio Rapido
- **⬅️ Precedente**: [Installazione e Configurazione](installation.md)
- **➡️ Successivo**: [Configurazione](configuration.md)
- **🚀 Prossimo Capitolo**: [Capitolo 2: Sviluppo AI-First](../microsoft-foundry/microsoft-foundry-integration.md)
- **Prossima lezione**: [Guida alla distribuzione](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
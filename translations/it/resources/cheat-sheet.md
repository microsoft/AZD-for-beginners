# Scheda di riferimento comandi - Comandi AZD essenziali

**Riferimento rapido per tutti i capitoli**
- **📚 Home del corso**: [AZD per principianti](../README.md)
- **📖 Avvio rapido**: [Capitolo 1: Fondamenti e Avvio rapido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandi AI**: [Capitolo 2: Sviluppo AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzato**: [Capitolo 4: Infrastruttura come codice](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduzione

Questa scheda di riferimento completa fornisce un rapido riferimento per i comandi più comunemente usati dell'Azure Developer CLI, organizzati per categoria con esempi pratici. Perfetta per consultazioni rapide durante lo sviluppo, la risoluzione dei problemi e le operazioni quotidiane con progetti azd.

## Obiettivi di apprendimento

Usando questa scheda di riferimento, potrai:
- Avere accesso immediato ai comandi essenziali e alla sintassi dell'Azure Developer CLI
- Comprendere l'organizzazione dei comandi per categorie funzionali e casi d'uso
- Consultare esempi pratici per scenari comuni di sviluppo e distribuzione
- Accedere a comandi di diagnostica per la risoluzione rapida dei problemi
- Trovare opzioni avanzate di configurazione e personalizzazione in modo efficiente
- Individuare comandi per la gestione degli ambienti e i workflow multi-ambiente

## Risultati di apprendimento

Con un uso regolare di questa scheda di riferimento, sarai in grado di:
- Eseguire i comandi azd con sicurezza senza dover consultare la documentazione completa
- Risolvere rapidamente i problemi comuni usando i comandi diagnostici appropriati
- Gestire in modo efficiente più ambienti e scenari di distribuzione
- Applicare funzionalità avanzate e opzioni di configurazione di azd quando necessario
- Diagnosticare i problemi di distribuzione usando sequenze di comandi sistematiche
- Ottimizzare i workflow tramite un uso efficace di scorciatoie e opzioni di azd

## Comandi per iniziare

### Autenticazione
```bash
# Accesso a Azure tramite AZD
azd auth login

# Accesso all'Azure CLI (AZD lo usa sotto il cofano)
az login

# Verifica dell'account corrente
az account show

# Imposta la sottoscrizione predefinita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Disconnessione da AZD
azd auth logout

# Disconnessione dall'Azure CLI
az logout
```

### Inizializzazione del progetto
```bash
# Sfoglia i modelli disponibili
azd template list

# Inizializza da un modello
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inizializza nella directory corrente
azd init .

# Inizializza con un nome personalizzato
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandi principali di distribuzione

### Flusso completo di distribuzione
```bash
# Distribuisci tutto (provisioning e deployment)
azd up

# Distribuisci con i prompt di conferma disabilitati
azd up --confirm-with-no-prompt

# Distribuisci in un ambiente specifico
azd up --environment production

# Distribuisci con parametri personalizzati
azd up --parameter location=westus2
```

### Solo infrastruttura
```bash
# Provisionare risorse Azure
azd provision

# 🧪 Anteprima delle modifiche all'infrastruttura
azd provision --preview
# Mostra una visualizzazione di esecuzione simulata (dry-run) delle risorse che verrebbero create/modificate/eliminate
# Simile a 'terraform plan' o 'bicep what-if' - sicuro da eseguire, nessuna modifica applicata
```

### Solo applicazione
```bash
# Distribuisci il codice dell'applicazione
azd deploy

# Distribuisci un servizio specifico
azd deploy --service web
azd deploy --service api

# Distribuisci tutti i servizi
azd deploy --all
```

### Compilazione e pacchettizzazione
```bash
# Costruire applicazioni
azd package

# Costruire un servizio specifico
azd package --service api
```

## 🌍 Gestione degli ambienti

### Operazioni sugli ambienti
```bash
# Elenca tutti gli ambienti
azd env list

# Crea un nuovo ambiente
azd env new development
azd env new staging --location westus2

# Seleziona l'ambiente
azd env select production

# Mostra gli ambienti disponibili
azd env list

# Aggiorna lo stato dell'ambiente
azd env refresh
```

### Variabili d'ambiente
```bash
# Imposta la variabile d'ambiente
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Ottieni la variabile d'ambiente
azd env get API_KEY

# Elenca tutte le variabili d'ambiente
azd env get-values

# Rimuovi la variabile d'ambiente
azd env unset DEBUG
```

## ⚙️ Comandi di configurazione

### Configurazione globale
```bash
# Elenca tutte le configurazioni
azd config show

# Imposta i valori predefiniti globali
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Rimuovi la configurazione
azd config unset defaults.location

# Reimposta tutte le configurazioni
azd config reset
```

### Configurazione del progetto
```bash
# Validare azure.yaml
azd config validate

# Mostrare informazioni sul progetto
azd show

# Ottenere gli endpoint del servizio
azd show --output json
```

## 📊 Monitoraggio e diagnostica

### Dashboard di monitoraggio
```bash
# Apri la dashboard di monitoraggio del portale Azure
azd monitor

# Apri le metriche in tempo reale di Application Insights
azd monitor --live

# Apri il pannello dei log di Application Insights
azd monitor --logs

# Apri la panoramica di Application Insights
azd monitor --overview
```

### Visualizzazione dei log dei container
```bash
# Visualizza i log tramite Azure CLI (per Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Segui i log in tempo reale
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Visualizza i log dal Portale di Azure
azd monitor --logs
```

### Query di Log Analytics
```bash
# Accedi a Log Analytics tramite il portale di Azure
azd monitor --logs

# Interroga i log usando Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandi di manutenzione

### Pulizia
```bash
# Rimuovi tutte le risorse di Azure
azd down

# Elimina forzatamente senza conferma
azd down --force

# Rimuovi definitivamente le risorse eliminate in modalità soft
azd down --purge

# Pulizia completa
azd down --force --purge
```

### Aggiornamenti
```bash
# Verifica la presenza di aggiornamenti di azd
azd version

# Ottieni la versione corrente
azd version

# Visualizza la configurazione corrente
azd config show
```

## 🔧 Comandi avanzati

### Pipeline e CI/CD
```bash
# Configura GitHub Actions
azd pipeline config

# Configura Azure DevOps
azd pipeline config --provider azdo

# Mostra la configurazione della pipeline
azd pipeline show
```

### Gestione dell'infrastruttura
```bash
# Genera template di infrastruttura
azd infra generate

# 🧪 Anteprima e pianificazione dell'infrastruttura
azd provision --preview
# Simula il provisioning dell'infrastruttura senza distribuire
# Analizza i template Bicep/Terraform e mostra:
# - Risorse da aggiungere (verde +)
# - Risorse da modificare (giallo ~)
# - Risorse da eliminare (rosso -)
# Sicuro da eseguire - nessuna modifica effettiva all'ambiente Azure

# Sintetizza l'infrastruttura da azure.yaml
azd infra synth
```

### Informazioni sul progetto
```bash
# Mostra lo stato del progetto e gli endpoint
azd show

# Mostra informazioni dettagliate sul progetto in formato JSON
azd show --output json

# Ottieni gli endpoint del servizio
azd show --output json | jq '.services'
```

## 🤖 Comandi AI e estensioni

### Estensioni AZD
```bash
# Elenca tutte le estensioni disponibili (inclusa l'IA)
azd extension list

# Installa l'estensione Foundry agents
azd extension install azure.ai.agents

# Installa l'estensione per il fine-tuning
azd extension install azure.ai.finetune

# Installa l'estensione per i modelli personalizzati
azd extension install azure.ai.models

# Aggiorna tutte le estensioni installate
azd extension upgrade --all
```

### Comandi agent AI
```bash
# Inizializza un progetto agente a partire da un manifesto
azd ai agent init -m <manifest-path-or-uri>

# Seleziona un progetto Foundry specifico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Specifica la directory sorgente dell'agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Scegli una destinazione di hosting
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Server MCP (Alpha)
```bash
# Avvia il server MCP per il tuo progetto
azd mcp start

# Gestisci il consenso degli strumenti per le operazioni MCP
azd copilot consent list
```

### Generazione dell'infrastruttura
```bash
# Genera file IaC dalla definizione del tuo progetto
azd infra generate

# Sintetizza l'infrastruttura da azure.yaml
azd infra synth
```

---

## 🎯 Flussi di lavoro rapidi

### Flusso di sviluppo
```bash
# Avvia un nuovo progetto
azd init --template todo-nodejs-mongo
cd my-project

# Distribuisci in ambiente di sviluppo
azd env new dev
azd up

# Apporta modifiche e ridistribuisci
azd deploy

# Apri la dashboard di monitoraggio
azd monitor --live
```

### Flusso multi-ambiente
```bash
# Configura gli ambienti
azd env new dev
azd env new staging  
azd env new production

# Distribuisci in dev
azd env select dev
azd up

# Testa e promuovi in staging
azd env select staging
azd up

# Distribuisci in produzione
azd env select production
azd up
```

### Flusso di risoluzione problemi
```bash
# Abilita la modalità di debug
export AZD_DEBUG=true

# Verifica lo stato della distribuzione
azd show

# Valida la configurazione
azd config show

# Apri la dashboard di monitoraggio per i log
azd monitor --logs

# Verifica lo stato della risorsa
azd show --output json
```

## 🔍 Comandi di debug

### Informazioni di debug
```bash
# Abilita l'output di debug
export AZD_DEBUG=true
azd <command> --debug

# Disabilita la telemetria per un output più pulito
export AZD_DISABLE_TELEMETRY=true

# Controlla la configurazione corrente
azd config show

# Controlla lo stato di autenticazione
az account show
```

### Debug dei template
```bash
# Elenca i template disponibili e i relativi dettagli
azd template list --output json

# Mostra informazioni sul template
azd template show <template-name>

# Valida il template prima dell'inizializzazione
azd template validate <template-name>
```

## 📁 Comandi file e directory

### Struttura del progetto
```bash
# Mostra la struttura della directory corrente
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviga alla radice del progetto azd
cd $(azd root)

# Mostra la directory di configurazione di azd
echo $AZD_CONFIG_DIR  # Di solito ~/.azd
```

## 🎨 Formattazione dell'output

### Output JSON
```bash
# Ottieni output JSON per l'uso negli script
azd show --output json
azd env list --output json
azd config show --output json

# Analizza con jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output tabellare
```bash
# Formatta come tabella
azd env list --output table

# Visualizza servizi distribuiti
azd show --output json | jq '.services | keys'
```

## 🔧 Combinazioni comuni di comandi

### Script di controllo dello stato
```bash
#!/bin/bash
# Controllo rapido dello stato di salute
azd show
azd env get-values
azd monitor --logs
```

### Validazione della distribuzione
```bash
#!/bin/bash
# Validazione pre-distribuzione
azd show
azd provision --preview  # Visualizza in anteprima le modifiche prima della distribuzione
az account show
```

### Confronto degli ambienti
```bash
#!/bin/bash
# Confronta gli ambienti
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script di pulizia risorse
```bash
#!/bin/bash
# Pulisci gli ambienti obsoleti
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabili d'ambiente

### Variabili d'ambiente comuni
```bash
# Configurazione di Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Configurazione AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configurazione dell'applicazione
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandi di emergenza

### Soluzioni rapide
```bash
# Reimposta l'autenticazione
az account clear
az login

# Forza l'aggiornamento dell'ambiente
azd env refresh

# Ridispiega tutti i servizi
azd deploy

# Verifica lo stato della distribuzione
azd show --output json
```

### Comandi di recupero
```bash
# Ripristina una distribuzione fallita - pulisci e ridistribuisci
azd down --force --purge
azd up

# Esegui il reprovisioning solo dell'infrastruttura
azd provision

# Ridistribuisci solo l'applicazione
azd deploy
```

## 💡 Consigli professionali

### Alias per flussi di lavoro più veloci
```bash
# Aggiungi al tuo .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scorciatoie per funzioni
```bash
# Passaggio rapido tra ambienti
azd-env() {
    azd env select $1 && azd show
}

# Distribuzione rapida con monitoraggio
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Stato dell'ambiente
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Aiuto e documentazione

### Ottenere aiuto
```bash
# Aiuto generale
azd --help
azd help

# Aiuto specifico del comando
azd up --help
azd env --help
azd config --help

# Mostra versione e informazioni di build
azd version
azd version --output json
```

### Link alla documentazione
```bash
# Apri la documentazione nel browser
azd docs

# Mostra la documentazione del template
azd template show <template-name> --docs
```

---

**Suggerimento**: Aggiungi questa scheda di riferimento ai preferiti e usa `Ctrl+F` per trovare rapidamente i comandi di cui hai bisogno!

---

**Navigazione**
- **Lezione precedente**: [Controlli pre-distribuzione](../docs/pre-deployment/preflight-checks.md)
- **Lezione successiva**: [Glossario](glossary.md)

---

> **💡 Vuoi aiuto con i comandi Azure nel tuo editor?** Installa [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 skill per AI, Foundry, distribuzione, diagnostica e altro.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di essere consapevoli che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
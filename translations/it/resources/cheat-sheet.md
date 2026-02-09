# Cheat Sheet dei Comandi - Comandi AZD Essenziali

**Riferimento Rapido per Tutti i Capitoli**
- **📚 Home del Corso**: [AZD per Principianti](../README.md)
- **📖 Avvio Rapido**: [Capitolo 1: Fondamenti e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandi AI**: [Capitolo 2: Sviluppo AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzato**: [Capitolo 4: Infrastruttura come codice](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduzione

Questo cheat sheet completo fornisce un riferimento rapido per i comandi dell'Azure Developer CLI più comunemente usati, organizzati per categoria con esempi pratici. Perfetto per consultazioni rapide durante lo sviluppo, la risoluzione dei problemi e le operazioni quotidiane con progetti azd.

## Obiettivi di Apprendimento

Utilizzando questo cheat sheet, potrai:
- Avere accesso immediato ai comandi essenziali dell'Azure Developer CLI e alla sintassi
- Capire l'organizzazione dei comandi per categorie funzionali e casi d'uso
- Consultare esempi pratici per scenari comuni di sviluppo e deployment
- Accedere ai comandi di diagnostica per una rapida risoluzione dei problemi
- Trovare in modo efficiente opzioni avanzate di configurazione e personalizzazione
- Individuare comandi per la gestione degli ambienti e flussi di lavoro multi-ambiente

## Risultati di Apprendimento

Con un riferimento regolare a questo cheat sheet, sarai in grado di:
- Eseguire i comandi azd con fiducia senza consultare la documentazione completa
- Risolvere rapidamente problemi comuni utilizzando i comandi diagnostici appropriati
- Gestire efficacemente più ambienti e scenari di deployment
- Applicare funzionalità avanzate di azd e opzioni di configurazione secondo necessità
- Risolvere problemi di deployment utilizzando sequenze di comandi sistematiche
- Ottimizzare i flussi di lavoro tramite l'uso efficace di scorciatoie e opzioni di azd

## Comandi per Iniziare

### Autenticazione
```bash
# Accedi ad Azure tramite AZD
azd auth login

# Accedi all'Azure CLI (AZD lo usa sotto il cofano)
az login

# Verifica l'account corrente
az account show

# Imposta la sottoscrizione predefinita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Disconnetti da AZD
azd auth logout

# Disconnetti dall'Azure CLI
az logout
```

### Inizializzazione del Progetto
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

## Comandi Principali di Deployment

### Flusso Completo di Deployment
```bash
# Distribuisci tutto (preparazione + distribuzione)
azd up

# Distribuisci con le richieste di conferma disabilitate
azd up --confirm-with-no-prompt

# Distribuisci in un ambiente specifico
azd up --environment production

# Distribuisci con parametri personalizzati
azd up --parameter location=westus2
```

### Solo Infrastruttura
```bash
# Provisionare risorse Azure
azd provision

# 🧪 Anteprima delle modifiche all'infrastruttura
azd provision --preview
# Mostra una vista in modalità simulazione di quali risorse verrebbero create/modificate/eliminate
# Simile a 'terraform plan' o 'bicep what-if' - sicuro da eseguire, non vengono applicate modifiche
```

### Solo Applicazione
```bash
# Distribuire il codice dell'applicazione
azd deploy

# Distribuire un servizio specifico
azd deploy --service web
azd deploy --service api

# Distribuire tutti i servizi
azd deploy --all
```

### Compilazione e Packaging
```bash
# Costruire applicazioni
azd package

# Costruire un servizio specifico
azd package --service api
```

## 🌍 Gestione degli Ambienti

### Operazioni sugli Ambienti
```bash
# Elenca tutti gli ambienti
azd env list

# Crea un nuovo ambiente
azd env new development
azd env new staging --location westus2

# Seleziona un ambiente
azd env select production

# Mostra l'ambiente corrente
azd env show

# Aggiorna lo stato dell'ambiente
azd env refresh
```

### Variabili d'Ambiente
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

## ⚙️ Comandi di Configurazione

### Configurazione Globale
```bash
# Elenca tutte le configurazioni
azd config list

# Imposta i valori predefiniti globali
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Rimuovi la configurazione
azd config unset defaults.location

# Reimposta tutte le configurazioni
azd config reset
```

### Configurazione del Progetto
```bash
# Valida azure.yaml
azd config validate

# Mostra informazioni sul progetto
azd show

# Ottieni endpoint dei servizi
azd show --output json
```

## 📊 Monitoraggio e Diagnostica

### Dashboard di Monitoraggio
```bash
# Apri la dashboard di monitoraggio del portale di Azure
azd monitor

# Apri le metriche in tempo reale di Application Insights
azd monitor --live

# Apri il riquadro dei log di Application Insights
azd monitor --logs

# Apri la panoramica di Application Insights
azd monitor --overview
```

### Visualizzare i Log dei Container
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

## 🛠️ Comandi di Manutenzione

### Pulizia
```bash
# Rimuovi tutte le risorse di Azure
azd down

# Forza l'eliminazione senza conferma
azd down --force

# Purgare le risorse eliminate temporaneamente
azd down --purge

# Pulizia completa
azd down --force --purge
```

### Aggiornamenti
```bash
# Controlla la disponibilità di aggiornamenti per azd
azd version

# Ottieni la versione corrente
azd version

# Visualizza la configurazione corrente
azd config list
```

## 🔧 Comandi Avanzati

### Pipeline e CI/CD
```bash
# Configura GitHub Actions
azd pipeline config

# Configura Azure DevOps
azd pipeline config --provider azdo

# Mostra la configurazione della pipeline
azd pipeline show
```

### Gestione dell'Infrastruttura
```bash
# Genera modelli di infrastruttura
azd infra generate

# 🧪 Anteprima e pianificazione dell'infrastruttura
azd provision --preview
# Simula il provisioning dell'infrastruttura senza eseguire alcuna distribuzione
# Analizza i template Bicep/Terraform e mostra:
# - Risorse da aggiungere (verde +)
# - Risorse da modificare (giallo ~)
# - Risorse da eliminare (rosso -)
# Sicuro da eseguire - nessuna modifica reale apportata all'ambiente Azure

# Sintetizza l'infrastruttura da azure.yaml
azd infra synth
```

### Informazioni sul Progetto
```bash
# Mostra lo stato del progetto e gli endpoint
azd show

# Mostra le informazioni dettagliate del progetto in formato JSON
azd show --output json

# Ottieni gli endpoint del servizio
azd show --output json | jq '.services'
```

## 🎯 Flussi di Lavoro Rapidi

### Flusso di Sviluppo
```bash
# Avvia un nuovo progetto
azd init --template todo-nodejs-mongo
cd my-project

# Distribuisci nell'ambiente di sviluppo
azd env new dev
azd up

# Apporta modifiche e ridistribuisci
azd deploy

# Apri la dashboard di monitoraggio
azd monitor --live
```

### Flusso Multi-Ambiente
```bash
# Configura gli ambienti
azd env new dev
azd env new staging  
azd env new production

# Distribuisci su dev
azd env select dev
azd up

# Testa e promuovi su staging
azd env select staging
azd up

# Distribuisci in produzione
azd env select production
azd up
```

### Flusso di Risoluzione dei Problemi
```bash
# Abilita la modalità di debug
export AZD_DEBUG=true

# Controlla lo stato della distribuzione
azd show

# Valida la configurazione
azd config list

# Apri la dashboard di monitoraggio per i log
azd monitor --logs

# Controlla lo stato delle risorse
azd show --output json
```

## 🔍 Comandi di Debugging

### Informazioni di Debug
```bash
# Abilita l'output di debug
export AZD_DEBUG=true
azd <command> --debug

# Disabilita la telemetria per un output più pulito
export AZD_DISABLE_TELEMETRY=true

# Verifica la configurazione corrente
azd config list

# Verifica lo stato di autenticazione
az account show
```

### Debug dei Template
```bash
# Elenca i template disponibili con i dettagli
azd template list --output json

# Mostra le informazioni del template
azd template show <template-name>

# Valida il template prima dell'inizializzazione
azd template validate <template-name>
```

## 📁 Comandi per File e Directory

### Struttura del Progetto
```bash
# Mostra la struttura della directory corrente
tree /f  # Windows
find . -type f  # Linux/macOS

# Vai alla directory principale del progetto azd
cd $(azd root)

# Mostra la directory di configurazione di azd
echo $AZD_CONFIG_DIR  # Di solito ~/.azd
```

## 🎨 Formattazione Output

### Output JSON
```bash
# Ottieni l'output JSON per lo scripting
azd show --output json
azd env list --output json
azd config list --output json

# Analizza con jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Tabella
```bash
# Formatta come tabella
azd env list --output table

# Visualizza i servizi distribuiti
azd show --output json | jq '.services | keys'
```

## 🔧 Combinazioni di Comandi Comuni

### Script di Health Check
```bash
#!/bin/bash
# Controllo rapido dello stato di salute
azd show
azd env show
azd monitor --logs
```

### Validazione del Deployment
```bash
#!/bin/bash
# Validazione prima della distribuzione
azd show
azd provision --preview  # Anteprima delle modifiche prima della distribuzione
az account show
```

### Confronto degli Ambienti
```bash
#!/bin/bash
# Confronta ambienti
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script di Pulizia delle Risorse
```bash
#!/bin/bash
# Pulire i vecchi ambienti
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabili d'Ambiente

### Variabili d'Ambiente Comuni
```bash
# Configurazione di Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Configurazione di AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configurazione dell'applicazione
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandi di Emergenza

### Soluzioni Rapide
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

### Comandi di Recupero
```bash
# Recupera da una distribuzione fallita - pulisci e ridistribuisci
azd down --force --purge
azd up

# Ripristina solo l'infrastruttura
azd provision

# Ridistribuisci solo l'applicazione
azd deploy
```

## 💡 Consigli Pro

### Alias per un Flusso di Lavoro più Veloce
```bash
# Aggiungi al tuo .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scorciatoie per Funzioni
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
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Aiuto e Documentazione

### Ottenere Aiuto
```bash
# Aiuto generale
azd --help
azd help

# Aiuto specifico per il comando
azd up --help
azd env --help
azd config --help

# Mostra informazioni sulla versione e sulla build
azd version
azd version --output json
```

### Link alla Documentazione
```bash
# Apri la documentazione nel browser
azd docs

# Mostra la documentazione del template
azd template show <template-name> --docs
```

---

**Suggerimento**: Aggiungi ai preferiti questo cheat sheet e usa `Ctrl+F` per trovare rapidamente i comandi di cui hai bisogno!

---

**Navigazione**
- **Lezione Precedente**: [Controlli Preflight](../docs/pre-deployment/preflight-checks.md)
- **Lezione Successiva**: [Glossario](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Esclusione di responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per la precisione, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua di origine deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Cheat Sheet dei comandi - Comandi AZD essenziali

**Riferimento rapido per tutti i capitoli**
- **📚 Home del corso**: [AZD per principianti](../README.md)
- **📖 Avvio rapido**: [Capitolo 1: Fondamenti e avvio rapido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandi AI**: [Capitolo 2: Sviluppo AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzate**: [Capitolo 4: Infrastruttura come codice](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduzione

Questo cheat sheet completo fornisce un riferimento rapido per i comandi più comunemente usati dell'Azure Developer CLI, organizzati per categoria con esempi pratici. Perfetto per consultazioni rapide durante lo sviluppo, la risoluzione dei problemi e le operazioni quotidiane con i progetti azd.

## Obiettivi di apprendimento

Usando questo cheat sheet, potrai:
- Avere accesso immediato ai comandi essenziali dell'Azure Developer CLI e alla loro sintassi
- Comprendere l'organizzazione dei comandi per categorie funzionali e casi d'uso
- Consultare esempi pratici per scenari comuni di sviluppo e deployment
- Accedere a comandi di diagnosi per una rapida risoluzione dei problemi
- Trovare opzioni avanzate di configurazione e personalizzazione in modo efficiente
- Individuare comandi per la gestione degli ambienti e i workflow multi-ambiente

## Risultati attesi

Con un uso regolare di questo cheat sheet, sarai in grado di:
- Eseguire i comandi azd con sicurezza senza dover consultare la documentazione completa
- Risolvere rapidamente problemi comuni utilizzando i comandi diagnostici appropriati
- Gestire in modo efficiente più ambienti e scenari di deployment
- Applicare funzionalità avanzate e opzioni di configurazione di azd quando necessario
- Risolvere problemi di deployment usando sequenze di comandi sistematiche
- Ottimizzare i workflow tramite l'uso efficace di scorciatoie e opzioni di azd

## Comandi per iniziare

### Autenticazione
```bash
# Accedi ad Azure tramite AZD
azd auth login

# Accedi all'Azure CLI (AZD lo utilizza internamente)
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

### Inizializzazione del progetto
```bash
# Sfoglia i modelli disponibili
azd template list

# Inizializza da un modello
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inizializza nella cartella corrente
azd init .

# Inizializza con nome personalizzato
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandi principali di deployment

### Workflow di deployment completo
```bash
# Distribuisci tutto (preparazione delle risorse + distribuzione)
azd up

# Distribuisci con le richieste di conferma disabilitate
azd up --confirm-with-no-prompt

# Distribuisci in un ambiente specifico
azd up --environment production

# Distribuisci con parametri personalizzati
azd up --parameter location=westus2
```

### Solo infrastruttura
```bash
# Provisionare risorse di Azure
azd provision

# 🧪 Anteprima delle modifiche all'infrastruttura
azd provision --preview
# Mostra una simulazione (dry-run) di quali risorse verrebbero create, modificate o eliminate
# Simile a 'terraform plan' o 'bicep what-if' - sicuro da eseguire, nessuna modifica verrà applicata
```

### Solo applicazione
```bash
# Distribuire il codice dell'applicazione
azd deploy

# Distribuire un servizio specifico
azd deploy --service web
azd deploy --service api

# Distribuire tutti i servizi
azd deploy --all
```

### Build e pacchettizzazione
```bash
# Ripristina (scarica) le dipendenze dell'applicazione
azd restore

# Ripristina un servizio specifico
azd restore --service api

# Genera un artefatto distribuibile senza distribuirlo
azd package

# Compila un servizio specifico
azd package --service api
```

> **`azd restore`** scarica le dipendenze della tua app (npm, pip, NuGet, Maven, ecc.). Viene eseguito automaticamente durante `azd package` e `azd deploy`, quindi raramente lo esegui direttamente—usalo manualmente per pre-scaricare le dipendenze (ad esempio, per popolare la cache di una CI o lavorare offline successivamente).

> **`azd package`** costruisce l'artefatto distribuibile (un'immagine container o uno zip) **senza** effettuarne il push su Azure. Usalo da solo per verificare che la build abbia successo, ispezionare l'output o produrre un artefatto che un processo separato distribuirà più tardi. `azd deploy` esegue automaticamente il package, quindi hai bisogno di `azd package` solo quando vuoi l'artefatto senza distribuirlo.


## 🌍 Gestione degli ambienti

### Operazioni sull'ambiente
```bash
# Elenca tutti gli ambienti
azd env list

# Crea un nuovo ambiente
azd env new development
azd env new staging --location westus2

# Seleziona un ambiente
azd env select production

# Mostra gli ambienti disponibili
azd env list

# Aggiorna lo stato dell'ambiente
azd env refresh
```

### Variabili d'ambiente
```bash
# Imposta variabile d'ambiente
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Ottieni variabile d'ambiente
azd env get API_KEY

# Elenca tutte le variabili d'ambiente
azd env get-values

# Rimuovi variabile d'ambiente
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
# Convalidare azure.yaml
azd config validate

# Mostrare informazioni sul progetto
azd show

# Ottenere gli endpoint del servizio
azd show --output json
```

## 📊 Monitoraggio e diagnostica

### Dashboard di monitoraggio
```bash
# Apri la dashboard di monitoraggio del portale di Azure
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

### Query Log Analytics
```bash
# Accedere a Log Analytics tramite il portale di Azure
azd monitor --logs

# Eseguire query sui log tramite Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandi di manutenzione

### Pulizia
```bash
# Rimuovi tutte le risorse di Azure
azd down

# Forza l'eliminazione senza conferma
azd down --force

# Rimuovi definitivamente le risorse eliminate temporaneamente
azd down --purge

# Pulizia completa
azd down --force --purge
```

### Aggiornamenti
```bash
# Verifica aggiornamenti per azd
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
# Generare template di infrastruttura
azd infra generate

# 🧪 Anteprima e pianificazione dell'infrastruttura
azd provision --preview
# Simula il provisioning dell'infrastruttura senza distribuirla
# Analizza i template Bicep/Terraform e mostra:
# - Risorse da aggiungere (verde +)
# - Risorse da modificare (giallo ~)
# - Risorse da eliminare (rosso -)
# Sicuro da eseguire - non vengono apportate modifiche effettive all'ambiente Azure

# Sintetizza l'infrastruttura da azure.yaml
azd infra synth
```

### Informazioni sul progetto
```bash
# Mostra lo stato del progetto e gli endpoint
azd show

# Mostra le informazioni dettagliate del progetto in formato JSON
azd show --output json

# Ottieni gli endpoint del servizio
azd show --output json | jq '.services'
```

## 🤖 Comandi AI e estensioni

### Estensioni AZD
```bash
# Elenca tutte le estensioni disponibili (compresa l'IA)
azd extension list

# Installa l'estensione Foundry Agents
azd extension install azure.ai.agents

# Installa l'estensione Agent Skills (anteprima)
azd extension install azure.ai.skills

# Installa l'estensione Foundry Connections (anteprima)
azd extension install azure.ai.connections

# Installa l'estensione Fine-Tuning
azd extension install azure.ai.finetune

# Installa l'estensione Custom Models
azd extension install azure.ai.models

# Aggiorna tutte le estensioni installate
azd extension upgrade --all
```

### Comandi agent AI
```bash
# Inizializza un progetto agente da un file manifest
azd ai agent init -m <manifest-path-or-uri>

# Seleziona un progetto Foundry specifico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Specifica la directory sorgente dell'agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Scegli una destinazione di hosting
azd ai agent init -m agent-manifest.yaml --host containerapp

# Testa un agente distribuito (stampa latenza + tempo al primo byte)
azd ai agent invoke

# Mostra la configurazione dell'endpoint attivo
azd ai agent endpoint show

# Genera un dataset di valutazione, quindi ottimizza l'agente
azd ai agent eval generate
azd ai agent optimize

# Scarica il codice sorgente distribuito di un agente ospitato basato su codice
azd ai agent code download

# Elimina un agente ospitato e tutte le sue versioni (--force termina le sessioni attive)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Avvia il server MCP per il tuo progetto
azd mcp start

# Gestisci il consenso degli strumenti per le operazioni MCP
azd copilot consent list
```

### Generazione dell'infrastruttura
```bash
# Genera i file IaC dalla definizione del tuo progetto
azd infra generate

# Sintetizza l'infrastruttura dal file azure.yaml
azd infra synth
```

---

## 🎯 Workflow rapidi

### Workflow di sviluppo
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

### Workflow multi-ambiente
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

### Workflow di risoluzione problemi
```bash
# Abilita la modalità di debug
export AZD_DEBUG=true

# Controlla lo stato del deployment
azd show

# Convalida la configurazione
azd config show

# Apri la dashboard di monitoraggio per i log
azd monitor --logs

# Controlla lo stato delle risorse
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

# Verifica la configurazione corrente
azd config show

# Verifica lo stato di autenticazione
az account show
```

### Debug dei template
```bash
# Elenca i modelli disponibili con i dettagli
azd template list --output json

# Mostra informazioni sul modello
azd template show <template-name>

# Valida il modello prima dell'inizializzazione
azd template validate <template-name>
```

## 📁 Comandi per file e directory

### Struttura del progetto
```bash
# Mostra la struttura della directory corrente
tree /f  # Windows
find . -type f  # Linux/macOS

# Vai alla radice del progetto azd
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

### Output tabella
```bash
# Formato come tabella
azd env list --output table

# Visualizza i servizi distribuiti
azd show --output json | jq '.services | keys'
```

## 🔧 Combinazioni comuni di comandi

### Script di controllo integrità
```bash
#!/bin/bash
# Controllo rapido dello stato di salute
azd show
azd env get-values
azd monitor --logs
```

### Validazione del deployment
```bash
#!/bin/bash
# Validazione pre-distribuzione
azd show
azd provision --preview  # Anteprima delle modifiche prima della distribuzione
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
# Pulire i vecchi ambienti
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

# Configurazione di AZD
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

# Controlla lo stato della distribuzione
azd show --output json
```

### Comandi di recupero
```bash
# Ripristina una distribuzione fallita - pulisci e ridistribuisci
azd down --force --purge
azd up

# Riprovisiona solo l'infrastruttura
azd provision

# Ridispiega solo l'applicazione
azd deploy
```

## 💡 Consigli professionali

### Alias per flussi di lavoro più rapidi
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

# Aiuto specifico per il comando
azd up --help
azd env --help
azd config --help

# Mostra informazioni sulla versione e sulla build
azd version
azd version --output json
```

### Link alla documentazione
```bash
# Apri la documentazione nel browser
azd docs

# Mostra la documentazione del modello
azd template show <template-name> --docs
```

---

**Suggerimento**: Aggiungi ai preferiti questo cheat sheet e usa `Ctrl+F` per trovare rapidamente i comandi di cui hai bisogno!

---

**Navigazione**
- **Lezione precedente**: [Controlli pre-distribuzione](../docs/pre-deployment/preflight-checks.md)
- **Lezione successiva**: [Glossario](glossary.md)

---

> **💡 Vuoi aiuto con i comandi Azure nel tuo editor?** Installa [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 competenze per AI, Foundry, distribuzione, diagnostica e altro.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
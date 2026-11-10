# Registro delle modifiche - AZD Per Principianti

## Introduzione

Questo registro delle modifiche documenta tutti i cambiamenti, aggiornamenti e miglioramenti notevoli al repository AZD Per Principianti. Seguiamo i principi della versioning semantico e manteniamo questo registro per aiutare gli utenti a capire cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Revisionando questo registro delle modifiche, potrai:
- Rimanere informato sulle nuove funzionalità e aggiunte di contenuti
- Comprendere i miglioramenti apportati alla documentazione esistente
- Monitorare correzioni di bug e revisioni per garantire l'accuratezza
- Seguire l'evoluzione dei materiali didattici nel tempo

## Risultati di apprendimento

Dopo aver esaminato le voci del registro delle modifiche, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Capire quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento basato sui materiali più aggiornati
- Contribuire con feedback e suggerimenti per miglioramenti futuri

## Cronologia delle versioni

### [v3.24.0]- 2026-11-04

#### Corretto
- Riparata la navigazione del corso in inglese, percorsi di pagine spostate, ancore mancanti e riferimenti esterni obsoleti, incluso il link al Capitolo 2 per la guida alla produzione AI.
- Riesaminata la guida attuale contro AZD 1.37.2 pubblicato, agenti 1.0.0-beta.23, e valutazioni 1.0.0-beta.2. Documentato il flusso di lavoro separato `azd ai eval` e la migrazione della configurazione di ottimizzazione.
- Corrette le bandiere CLI non supportate, i confini di autenticazione, le indicazioni su ambiente/secret in testo semplice, aggiornamenti infrastrutturali, configurazione modello e esempi distruttivi di recovery.
- Aggiornato il workshop con l'attuale esempio AI Agents, inclusi hook reali, input di configurazione, test di valutazione, punti di ingresso al red-teaming e osservabilità.
- Corrette le affermazioni di implementazione degli esempi e riparati i problemi associati di applicazione/infrastruttura/configurazione. Il materiale sull'architettura Retail è esplicitamente distinto da un'applicazione completa funzionante.
- Ripristinata la matrice del linguaggio CodeQL, selezionato Node.js 24 per il contenitore di sviluppo e fatti segnalare dai validatori setup i comandi di versione falliti.

#### Aggiunto
- Un controllore offline solo in inglese per link/ancore, test di regressione e un flusso di lavoro di documentazione che costruisce anche il workshop in modalità rigorosa. Traduzioni generate e immagini tradotte sono escluse.

#### Ambito di validazione
- Controlli di sorgente, sintassi, configurazione, comportamento locale e collegamenti di rete non stabiliscono la capacità di deployment live su Azure, quote, RBAC, disponibilità del modello regionale, fatturazione, conformità di sicurezza o prontezza per la produzione.
- Le voci più vecchie sotto sono registrazioni storiche, non istruzioni attuali per comandi o release.

### [v3.23.0] - 2026-07-13

#### AGGIORNAMENTO AZD 1.27.1: Aggiornamento della Versione Corrente
**Questa versione riconvalida il corso contro `azd` `1.27.1` (luglio 2026, ultima release stabile) e l'attuale estensione agente AI in anteprima `azure.ai.agents` `1.0.0-beta.5`, aggiornando ogni banner "convalidato contro" dopo le release 1.26.0, 1.27.0, e 1.27.1.**

#### Modificato
- **✅ Aggiornata la baseline di validazione** da `azd 1.25.6` (giugno 2026) a `azd 1.27.1` (luglio 2026) in README principale, tutti i README dei capitoli, la lezione dev-container del Capitolo 1 (inclusi esempi con versioni fissate), la lezione custom-templates del Capitolo 4, la lezione multi-agent del Capitolo 5 e la documentazione workshop
- **🤖 Aggiornata la baseline del Capitolo 2** da `azd 1.23.12` (marzo 2026) a `azd 1.27.1` attraversando `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; date note di validazione aggiornate al 2026-07-13
- **🧩 Aggiornata l'estensione agente AI** da `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` alla attuale release `1.0.0-beta.5` nel README del Capitolo 2 e `agents.md`
- **🧪 Aggiornato l'esempio di validazione workshop** (output `azd version`) a `1.27.1`

#### Note sulle release azd rilevanti (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Supporto Go per Azure Functions su Flex Consumption, filtri di abbonamento per tenant `azd config sub-filter`, bundle estensioni autonome (`azd x pack --bundle`) e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellazione diretta di progetti/agent AI Foundry Azure in `azure.yaml` (inizializzazione senza Bicep/Terraform), supporto al deployment container per App Service (`host: appservice` + `language: docker`), `-s/--source` diretti per comandi `azd extension`, e `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` per `azd extension install`, modelli deprecati esclusi dai prompt catalogo/quota di default, e diverse correzioni di bug

#### File aggiornati
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Riempitivo per Principianti #2: Redazione di Template, Dev Containers, Pulumi, Azure DevOps, Service Principals e altro
**Questa versione chiude le lacune intermedie rimanenti emerse dall'analisi azd-coverage: come scrivere e pubblicare il proprio template, ambienti riproducibili dev-container/Codespaces, il provider infrastrutturale Pulumi, una guida CI/CD Azure DevOps, autenticazione tramite service principal, guida alla selezione host (AKS/Spring Apps), spiegazioni `azd restore`/`azd package`, gestione errori hook e pratiche di ambiente condiviso/squadra.**

#### Aggiunto
- **🧱 Nuova lezione Capitolo 4** `docs/chapter-04-infrastructure/custom-templates.md` — redazione del proprio template azd: struttura richiesta (`azure.yaml`, `infra/`, `src/`), il campo `metadata.template`, parametrizzazione infrastruttura con token risorsa `uniqueString()` e tag `azd-env-name`, test locali con `azd init --template <local-path>`, pubblicazione su GitHub e invio alla galleria Awesome AZD
- **📦 Nuova lezione Capitolo 1** `docs/chapter-01-foundation/dev-containers.md` — ambienti azd riproducibili con Dev Containers e GitHub Codespaces: un minimo `.devcontainer/devcontainer.json` che usa la funzionalità ufficiale `ghcr.io/azure/azure-dev/azd`, funzionalità specifiche per lingua, `docker-in-docker` per host container e `azd auth login --use-device-code` per accesso remoto
- **🧩 Sezione Pulumi con azd** in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout cartella Pulumi, stack mappati su ambienti azd, output/tagging richiesti e il medesimo flusso `azd up` / `azd down`
- **🎯 Guida alla selezione host** in `docs/chapter-04-infrastructure/provisioning.md` — confronto amichevole per principianti di `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, con indicazioni su quando scegliere AKS o Azure Spring Apps
- **🛠️ Guida CI/CD Azure DevOps** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, connessione servizio con federazione identità workload (OIDC), il `azure-dev.yml` generato e configurazione gruppo variabili
- **🔑 Service Principals (Pattern 4)** aggiunti in `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non interattivo con client secret vs. credenziali federate/OIDC, quando usarli e conservazione sicura delle credenziali
- **🪝 Gestione errori hook** sottosezione in `docs/chapter-04-infrastructure/deployment-guide.md` — codici di uscita e `set -e`, `continueOnError`, test hook in isolamento con `azd hooks run`, shell specifiche OS e `--debug`
- **👥 Ambienti condivisi del team** sezione in `docs/chapter-03-configuration/configuration.md` — cosa vive in `.azure/`, cosa ignorare con gitignore, ambienti per singolo sviluppatore, `azd env list`/`select` e fornitura valori ambiente in CI/CD
- **🧰 Spiegazioni di `azd restore` e ampliamento `azd package`** in `resources/cheat-sheet.md` — recupero dipendenze e costruzione artefatto distribuibile senza deploy

#### Modificato
- **🧭 Tabella lezioni Capitolo 4** aggiornata per includere la nuova lezione "Scrivere il tuo Template" (Lezione 3)
- **🧭 Tabella lezioni Capitolo 1** aggiornata per includere la nuova lezione "Dev Containers & Codespaces" (Lezione 5); piè di pagina per la navigazione collegati tra `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Riempitivo Principianti: Lezione Hands-On Multi-Agent, "Bring Your Own App," Terraform e guida CI/CD
**Questa versione chiude le maggiori lacune per una guida completa ai principianti aggiungendo due nuove lezioni pratiche (una guida multi-agent distribuibile e l'aggiunta di azd a un'app esistente), un'introduzione amichevole agli hook, una sezione Terraform con azd, una guida passo a passo pipeline GitHub Actions, una spiegazione per le nuove estensioni preview e una checklist esplicita di verifica del deployment.**

#### Aggiunto
- **🤝 Nuova lezione Capitolo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — una guida interattiva di due agenti distribuibile (orchestratore + specialisti) usando un template reale (`contoso-creative-writer`), coprendo quando usare multi-agent, flusso di lavoro `azd up`, comprensione delle risorse distribuite, tracciamento cross-agent, personalizzazione e pulizia
- **📦 Nuova lezione Capitolo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — come aggiungere azd a un progetto esistente con `azd init` ("usa codice nella directory corrente"), comprendere `azure.yaml` e `infra/`, `azd infra generate`, rilevamento host e deploy con `azd up`
- **🌐 Sezione Terraform con azd** aggiunta a `docs/chapter-04-infrastructure/provisioning.md` — configurazione `infra.provider: terraform`, layout cartella `.tf`, output `AZURE_*` richiesti e tagging `azd-env-name`, e il medesimo flusso `azd up` / `azd down` (chiude la lacuna dove era dichiarato il supporto Terraform ma mostrato solo Bicep)
- **⚙️ Guida passo-a-passo GitHub Actions** in `docs/chapter-08-production/production-ai-practices.md` — da repo GitHub a deploy automatizzati: `azd pipeline config`, credenziali federate OIDC (nessun segreto salvato), `azure-dev.yml` generato e guida segreti vs variabili
- **🪝 Introduzione "Nuovo agli hook?" per principianti** in `docs/chapter-04-infrastructure/deployment-guide.md` — cos'è un hook, tabella fasi hook, primo hook minimalista e esecuzione manuale hook con `azd hooks run`
- **✅ Checklist "Verifica il tuo Deployment"** aggiunta al passo 5 di `docs/chapter-01-foundation/first-project.md` — test di base, controllo endpoint salute e criteri espliciti di successo
- **🧩 Spiegazione per le nuove estensioni preview** `azure.ai.skills` e `azure.ai.connections` (cosa sono e quando usarle) in `docs/chapter-08-production/production-ai-practices.md`

#### Modificato
- **🧭 Tabella lezioni Capitolo 5** corretta: `multi-agent-basics.md` è ora Lezione 1 (l'unica lezione completamente pratica), con etichettatura onesta che la Lezione 2 si trova nel Capitolo 6 e lo scenario Retail è un progetto d'architettura, non un template a comando singolo
- **🧭 Tabella lezioni Capitolo 1** ora include la nuova lezione "Bring Your Own App" (Lezione 4)
- **🔗 Piè di pagina navigazione** aggiornati: `first-project.md` ora collega avanti a `bring-your-own-app.md`

#### Corretto
- **🧱 Chiusura della lacuna "dichiarata ma mancante" Terraform** — il corso prima faceva riferimento al supporto Terraform senza mostrarlo
- **🔀 Corrette le cross-link fuorvianti nel Capitolo 5** che lasciavano intendere che esisteva un'implementazione multi-agent completa quando solo un progetto di architettura c'era

#### File aggiornati
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nuovo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nuovo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Aggiornamento AZD 1.25.6, Comandi Completi per il Ciclo di Vita dell'Agente & Rebranding Aspire
**Questa versione rivalida il corso contro `azd` `1.25.6` (giugno 2026) e l'estensione `azure.ai.agents` `0.1.40-preview`, amplia la guida AI da "scaffolding di un agente" a tutto il ciclo di vita dell'agente (test → valutare → ottimizzare → ispezionare → eliminare), rende visibili le nuove estensioni di anteprima `azure.ai.skills` e `azure.ai.connections`, e segnala il rebranding del prodotto da ".NET Aspire" a "Aspire".**

#### Aggiunto
- **🔁 Copertura completa del ciclo di vita dell'agente** per principianti e ingegneri AI in tutta la documentazione:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabella del ciclo di vita (scaffold → test → misurare → migliorare → ispezionare → pulire) aggiunta alla sezione Estensioni e Comandi AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nuova sezione "Gestione del Ciclo di Vita dell'Agente" che copre `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
  - `resources/cheat-sheet.md` — Comandi dell'agente AI ampliati con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
- **🧩 Nuove estensioni anteprima** documentate: `azure.ai.skills` (abilità riutilizzabili dell'agente) e `azure.ai.connections` (connessioni Foundry) aggiunte alla tabella delle estensioni e al foglio riassuntivo
- **⏱️ Guida sui tempi di risposta** — gli esempi di `azd ai agent invoke` ora mostrano la latenza totale e il tempo al primo byte
- **📌 Banner della versione** nel README principale che indica ai learner `azd version` e `azd upgrade`

#### Modificato
- **✅ Linea base di validazione aggiornata** da `azd 1.23.12` (marzo 2026) a `azd 1.25.6` (giugno 2026) in tutti i README dei capitoli e nella docs del workshop
- **🤖 Nota sull'estensione del Capitolo 2** aggiornata da `azure.ai.agents` `0.1.18-preview` a `0.1.40-preview`
- **🧪 Esempio di validazione del workshop** (output `azd version`) aggiornato a `1.25.6`
- **🧭 README "Novità in azd Oggi"** aggiornato per evidenziare il ciclo di vita completo dell'agente, nuove estensioni AI e recenti correzioni di qualità della vita (`azd init` idempotenza, `azd auth login` pulizia token scaduti, `azd tool` prompt di primo avvio)
- **📖 agents.md Capitolo 2 (Opzione 4)** ora indica ai learner i comandi del ciclo di vita post-deploy invece di fermarsi a `azd up`

#### Corretto
- **🏷️ Nomenclatura del prodotto** — aggiunta nota di rebranding Aspire (".NET Aspire" ora è semplicemente "Aspire"); il supporto azd per Aspire rimane invariato
- **🔎 Validazione release live** confermata contro il feed di rilascio Azure Developer CLI: CLI stabile `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### File aggiornati
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Chiarimento per i Principianti, Validazione Setup & Pulizia Finale Comandi AZD
**Questa versione segue il controllo di validazione AZD 1.23 con una revisione della documentazione rivolta ai principianti: chiarisce la guida all'autenticazione AZD-first, aggiunge script di validazione del setup locale, verifica i comandi chiave contro l'AZD CLI live e rimuove gli ultimi riferimenti a comandi obsoleti in inglese al di fuori del changelog.**

#### Aggiunto
- **🧪 Script di validazione setup per principianti** con `validate-setup.ps1` e `validate-setup.sh` per permettere ai learner di confermare gli strumenti necessari prima di iniziare il Capitolo 1
- **✅ Passaggi di validazione setup preliminare** nel README principale e nel README Capitolo 1 per catturare i prerequisiti mancanti prima di `azd up`

#### Modificato
- **🔐 Guida all'autenticazione per principianti** ora tratta coerentemente `azd auth login` come percorso principale per i workflow AZD, con `az login` indicato come opzionale a meno che non si usino direttamente i comandi Azure CLI
- **📚 Flusso onboarding Capitolo 1** ora indica ai learner di validare il setup locale prima dell'installazione, autenticazione e primo deploy
- **🛠️ Messaggi del validatore** ora distinguono chiaramente i requisiti bloccanti dagli avvisi opzionali di Azure CLI per il percorso principiante solo AZD
- **📖 Documentazione su configurazione, risoluzione problemi ed esempi** distingue ora tra autenticazione AZD obbligatoria e accesso Azure CLI opzionale dove prima venivano presentati senza contesto

#### Corretto
- **📋 Riferimenti a comandi in inglese restanti** aggiornati alle forme AZD attuali, incluso `azd config show` nel foglio riassuntivo e `azd monitor --overview` dove era previsto un orientamento Azure Portal
- **🧭 Affermazioni per principianti nel Capitolo 1** mitigate per evitare promesse eccessive di nessun errore garantito o rollback su tutti i template e risorse Azure
- **🔎 Validazione CLI live** confermata per il supporto corrente di `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

#### File aggiornati
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validazione AZD 1.23.12, Espansione Ambiente Workshop & Aggiornamento Modello AI
**Questa versione esegue una verifica della documentazione contro `azd` `1.23.12`, aggiorna esempi di comando AZD obsoleti, aggiorna la guida al modello AI ai valori predefiniti correnti e amplia le istruzioni del workshop oltre GitHub Codespaces per supportare anche container di sviluppo e cloni locali.**

#### Aggiunto
- **✅ Note di validazione nei capitoli core e docs workshop** per rendere esplicita la baseline AZD testata per learner con build CLI più nuove o vecchie
- **⏱️ Guida timeout di deploy** per deploy di applicazioni AI a lunga esecuzione usando `azd deploy --timeout 1800`
- **🔎 Passaggi di ispezione estensioni** con `azd extension show azure.ai.agents` nei documenti workflow AI
- **🌐 Guida ambienti workshop più ampia** che copre GitHub Codespaces, container di sviluppo e cloni locali con MkDocs

#### Modificato
- **📚 README introduttivi dei capitoli** ora segnalano sempre la validazione contro `azd 1.23.12` nelle sezioni foundation, configurazione, infrastruttura, multi-agente, pre-deploy, troubleshooting e produzione
- **🛠️ Riferimenti comandi AZD** aggiornati alle forme correnti nei documenti:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` secondo il contesto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` dove prevista panoramica Application Insights
- **🧪 Esempi di anteprima provision semplificati** all'uso attuale supportato come `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Flusso workshop** aggiornato per consentire ai learner di completare lab in Codespaces, container di sviluppo o clone locale invece di assumere solo esecuzione in Codespaces
- **🔐 Guida all'autenticazione** ora preferisce `azd auth login` per i workflow AZD, con `az login` opzionale quando si usano direttamente comandi Azure CLI

#### Corretto
- **🪟 Comandi di installazione Windows** uniformati all'uso attuale del pacchetto `winget` nella guida all’installazione
- **🐧 Guida installazione Linux** corretta per evitare istruzioni unsupported specifiche della distro per il gestore pacchetti `azd` e invece puntare agli asset di rilascio dove appropriato
- **📦 Esempi modello AI** aggiornati da vecchi default come `gpt-35-turbo` e `text-embedding-ada-002` a esempi attuali come `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Snippet di deploy e diagnostica** corretti per usare comandi ambiente e stato correnti nei log, script e passaggi di troubleshooting
- **⚙️ Guida GitHub Actions** aggiornata da `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Guida consenso MCP/Copilot** aggiornata da `azd mcp consent` a `azd copilot consent list`

#### Migliorato
- **🧠 Guida capitolo AI** ora spiega meglio il comportamento `azd ai` sensibile all’anteprima, login specifico del tenant, uso corrente delle estensioni e raccomandazioni aggiornate per il deploy dei modelli
- **🧪 Istruzioni workshop** ora utilizzano esempi di versione più realistici e linguaggio di setup ambiente più chiaro per i laboratori pratici
- **📈 Documentazione produzione e troubleshooting** ora meglio allineata con esempi correnti di monitoraggio, modello fallback e livelli di costo

#### File aggiornati
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Comandi AZD AI CLI, Validazione Contenuti & Espansione Template
**Questa versione aggiunge la copertura dei comandi `azd ai`, `azd extension` e `azd mcp` in tutti i capitoli relativi all'AI, corregge link interrotti e codice deprecato in agents.md, aggiorna il foglio riassuntivo e rinnova la sezione Template di esempio con descrizioni verificate e nuovi template AZD Azure AI.**

#### Aggiunto
- **🤖 Copertura AZD AI CLI** in 7 file (precedentemente solo nel Capitolo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nuova sezione "Estensioni e Comandi AI" che introduce `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opzione 4: `azd ai agent init` con tabella comparativa (template vs approccio manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sottosezioni "Estensioni AZD per Foundry" e "Deploy Agente-First"
  - `docs/chapter-05-multi-agent/README.md` — Avvio rapido mostra ora sia i percorsi di deploy basati su template che manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sezione Deploy ora include opzione `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sottosezione "Comandi Estensione AI AZD per la Diagnostica"
  - `resources/cheat-sheet.md` — Nuova sezione "Comandi AI & Estensioni" con `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Nuovi template di esempio AZD AI** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET con Blazor WebAssembly, Semantic Kernel e supporto chat vocale
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J con opzioni di deploy ACA/AKS
  - **contoso-creative-writer** — App di scrittura creativa multi-agente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con supporto sviluppo locale Ollama
  - **chat-with-your-data-solution-accelerator** — Acceleratore RAG aziendale con portale di amministrazione, integrazione con Teams e opzioni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App di riferimento per orchestrazione MCP multi-agente con server in .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template starter minimalista per infrastruttura Azure AI Bicep
  - **🔗 Link alla Awesome AZD AI Gallery** — Riferimento alla [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (oltre 80 template)

#### Corretto
- **🔗 navigazione agents.md**: I link Precedente/Successivo ora corrispondono all'ordine delle lezioni del Capitolo 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 link rotti in agents.md**: `production-ai-practices.md` corretto in `../chapter-08-production/production-ai-practices.md` (3 occorrenze)
- **📦 codice deprecato in agents.md**: Sostituito `opencensus` con `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API non valida in agents.md**: Spostato `max_tokens` da `create_agent()` a `create_run()` come `max_completion_tokens`
- **🔢 conteggio token in agents.md**: Sostituita stima approssimativa `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correzione dei servizi da "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predefinito cambiato Ott 2024)
- **contoso-chat**: Aggiornata descrizione per riferirsi a Azure AI Foundry + Prompty, in linea con il titolo reale e stack tecnologico del repository

#### Rimosso
- **ai-document-processing**: Rimosso riferimento a template non funzionante (repo non accessibile pubblicamente come template AZD)

#### Migliorato
- **📝 esercizi in agents.md**: L'esercizio 1 mostra ora output attesi e passaggio `azd monitor`; l'esercizio 2 include codice di registrazione completo `FunctionTool`; l'esercizio 3 sostituisce indicazioni vaghe con comandi concreti `prepdocs.py`
- **📚 risorse agents.md**: Aggiornati i link alla documentazione attuale di Azure AI Agent Service e quickstart
- **📋 tabella Passi Successivi in agents.md**: Aggiunto link al laboratorio AI Workshop per copertura completa del capitolo

#### File Aggiornati
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Miglioramento Navigazione del Corso
**Questa versione migliora la navigazione dei capitoli nel README.md con un formato tabellare migliorato.**

#### Modifiche
- **Tabella Mappa del Corso**: Arricchita con link diretti alle lezioni, stime di durata e valutazioni di complessità
- **Pulizia Cartelle**: Rimosse cartelle vecchie ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validazione Link**: Verificati tutti i 21+ link interni nella tabella Mappa del Corso

### [v3.16.0] - 2026-02-05

#### Aggiornamenti Nome Prodotti
**Questa versione aggiorna i riferimenti ai prodotti al branding Microsoft attuale.**

#### Modifiche
- **Microsoft Foundry → Microsoft Foundry**: Aggiornati tutti i riferimenti nei file non di traduzione
- **Azure AI Agent Service → Foundry Agents**: Aggiornato il nome del servizio per riflettere il branding attuale

#### File Aggiornati
- `README.md` - Pagina principale del corso
- `changelog.md` - Cronologia delle versioni
- `course-outline.md` - Struttura del corso
- `docs/chapter-02-ai-development/agents.md` - Guida agenti AI
- `examples/README.md` - Documentazione esempi
- `workshop/README.md` - Pagina di atterraggio workshop
- `workshop/docs/index.md` - Indice workshop
- `workshop/docs/instructions/*.md` - Tutti i file istruzioni workshop

---

### [v3.15.0] - 2026-02-05

#### Ristrutturazione Maggiore del Repository: Nomi Cartelle per Capitolo
**Questa versione ristruttura la documentazione in cartelle dedicate ai capitoli per una navigazione più chiara.**

#### Rinominati Cartelle
Le vecchie cartelle sono state sostituite da cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Aggiunta nuova: `docs/chapter-05-multi-agent/`

#### Migrazioni File
| File | Da | A |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Tutti i file pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Tutti i file troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Aggiunti
- **📚 File README Capitolo**: Creato README.md in ogni cartella capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella lezioni con descrizioni
  - Comandi di avvio rapido
  - Navigazione verso altri capitoli

#### Modifiche
- **🔗 Aggiornati tutti i link interni**: oltre 78 percorsi aggiornati in tutti i file di documentazione
- **🗺️ README.md principale**: Aggiornata la Mappa del Corso con la nuova struttura dei capitoli
- **📝 examples/README.md**: Aggiornati riferimenti incrociati alle cartelle dei capitoli

#### Rimosso
- Vecchia struttura cartelle (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ristrutturazione Repository: Navigazione Capitolo
**Questa versione ha aggiunto file README per la navigazione del capitolo (sostituiti da v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nuova Guida AI Agents
**Questa versione aggiunge una guida esaustiva per il deployment di agenti AI con Azure Developer CLI.**

#### Aggiunti
- **🤖 docs/microsoft-foundry/agents.md**: Guida completa che copre:
  - Cosa sono gli agenti AI e come differiscono dai chatbot
  - Tre template quick-start agent (Foundry Agents, Prompty, RAG)
  - Modelli architetturali per agenti (agente singolo, RAG, multi-agente)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento delle metriche
  - Considerazioni e ottimizzazione dei costi
  - Scenari comuni di risoluzione problemi
  - Tre esercizi pratici con criteri di successo

#### Struttura del Contenuto
- **Introduzione**: Concetti di agenti per principianti
- **Avvio rapido**: Deployment agenti con `azd init --template get-started-with-ai-agents`
- **Modelli architetturali**: Diagrammi visivi dei pattern degli agenti
- **Configurazione**: Setup degli strumenti e variabili d'ambiente
- **Monitoraggio**: Integrazione con Application Insights
- **Esercizi**: Apprendimento progressivo pratico (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### Aggiornamento Ambiente DevContainer
**Questa versione aggiorna la configurazione del contenitore di sviluppo con strumenti moderni e impostazioni predefinite migliorate per l'esperienza di apprendimento AZD.**

#### Modifiche
- **🐳 Immagine Base**: Aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (ultima versione Debian stabile)
- **📛 Nome Contenitore**: Rinominato da "Python 3" a "AZD for Beginners" per maggiore chiarezza

#### Aggiunti
- **🔧 Nuove Caratteristiche Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per template AZD)
  - `github-cli` per gestione template
  - `docker-in-docker` per deployment container app

- **🔌 Port Forwarding**: Porte preconfigurate per sviluppo comune:
  - 8000 (anteprima MkDocs)
  - 3000 (app Web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nuove Estensioni VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python migliorato
  - `ms-azuretools.vscode-azurefunctions` - Supporto Azure Functions
  - `ms-azuretools.vscode-docker` - Supporto Docker
  - `ms-azuretools.vscode-bicep` - Supporto linguaggio Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestione risorse Azure
  - `yzhang.markdown-all-in-one` - Editing Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Supporto diagrammi Mermaid
  - `redhat.vscode-yaml` - Supporto YAML (per azure.yaml)
  - `eamodio.gitlens` - Visualizzazione Git
  - `mhutchie.git-graph` - Storico Git

- **⚙️ Impostazioni VS Code**: Aggiunte impostazioni predefinite per interprete Python, formatta al salvataggio e rimozione spazi bianchi

- **📦 Aggiornato requirements-dev.txt**:
  - Aggiunto plugin di minificazione MkDocs
  - Aggiunto pre-commit per qualità codice
  - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Corretto
- **Comando Post-Creazione**: Ora verifica l'installazione di AZD e Azure CLI all'avvio del contenitore

---

### [v3.11.0] - 2026-02-05

#### Revisione README per Principianti
**Questa versione migliora significativamente il README.md per essere più accessibile ai principianti e aggiunge risorse essenziali per sviluppatori AI.**

#### Aggiunti
- **🆚 Confronto Azure CLI vs AZD**: Spiegazione chiara su quando usare ciascuno strumento con esempi pratici
- **🌟 Link Awesome AZD**: Link diretti alla galleria template community e risorse di contributo:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - oltre 200 template pronti da deployare
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contributo dalla community
- **🎯 Guida di Avvio Rapido**: Sezione semplificata in 3 passaggi (Installare → Accedere → Deployare)
- **📊 Tabella Navigazione Basata sull’Esperienza**: Indicazioni chiare su dove iniziare in base all’esperienza dello sviluppatore

#### Modifiche
- **Struttura README**: Riorganizzata per divulgazione progressiva - prima le informazioni chiave
- **Sezione Introduzione**: Riscritta per spiegare "La Magia di `azd up`" per principianti assoluti
- **Rimosso Contenuto Duplicato**: Eliminata sezione troubleshooting duplicata
- **Comandi Troubleshooting**: Corretto riferimento a `azd logs` per usare `azd monitor --logs` valido

#### Corretto
- **Comandi Autenticazione**: Aggiunti `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Riferimenti Comando non Validi**: Rimossi ultimi `azd logs` dalla sezione troubleshooting del README

#### Note
- **Ambito**: Modifiche applicate al README.md principale e resources/cheat-sheet.md
- **Pubblico Target**: Miglioramenti specificamente rivolti a sviluppatori nuovi di AZD

---

### [v3.10.0] - 2026-02-05

#### Aggiornamento Precisione Comandi Azure Developer CLI
**Questa versione corregge comandi AZD inesistenti nella documentazione, assicurando che tutti gli esempi di codice usino sintassi valide di Azure Developer CLI.**

#### Corretto
- **🔧 Rimozione Comandi AZD inesistenti**: Revisione completa e correzione di comandi non validi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative Azure CLI
  - Sottocomandi `azd service` (non esistenti) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (non esistenti) → rimossi
  - Flag `azd provision --what-if/--rollback` (non esistenti) → aggiornati per usare `--preview`
  - `azd config validate` (non esiste) → sostituito con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (non esistono) → rimossi

- **📚 File Aggiornati con Correzioni Comandi**:
  - `resources/cheat-sheet.md`: Revisione completa del riferimento comandi
  - `docs/deployment/deployment-guide.md`: Correzione strategie rollback e deployment
  - `docs/troubleshooting/debugging.md`: Corrette sezioni di analisi log
  - `docs/troubleshooting/common-issues.md`: Aggiornati comandi troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Corretta sezione debug AZD
  - `docs/getting-started/azd-basics.md`: Comandi di monitoraggio corretti
  - `docs/getting-started/first-project.md`: Esempi aggiornati di monitoraggio e debugging
  - `docs/getting-started/installation.md`: Esempi di help e versione corretti
  - `docs/pre-deployment/application-insights.md`: Comandi per visualizzazione log corretti
  - `docs/pre-deployment/coordination-patterns.md`: Comandi di debugging agent corretti

- **📝 Riferimento Versione Aggiornato**: 
  - `docs/getting-started/installation.md`: Versione `1.5.0` hardcoded cambiata in generica `1.x.x` con link alle release

#### Modifiche
- **Strategie di Rollback**: Documentazione aggiornata per usare rollback basato su Git (AZD non ha rollback nativo)
- **Visualizzazione Log**: Rimpiazzati riferimenti `azd logs` con `azd monitor --logs`, `azd monitor --live`, e comandi Azure CLI
- **Sezione Prestazioni**: Rimosse flag di deployment parallelo/incrementale inesistenti, fornite alternative valide

#### Dettagli Tecnici
- **Comandi AZD Validati**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag validi azd monitor**: `--live`, `--logs`, `--overview`
- **Funzionalità Rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: Comandi validati con Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento Workshop e Aggiornamento Qualità Documentazione
**Questa versione completa i moduli interattivi del workshop, corregge tutti i link documentali rotti, e migliora la qualità complessiva dei contenuti per sviluppatori AI che usano Microsoft AZD.**

#### Aggiunto
- **📝 CONTRIBUTING.md**: Nuovo documento linee guida contributo con:
  - Istruzioni chiare per segnalare problemi e proporre modifiche
  - Standard documentali per nuovi contenuti
  - Linee guida per esempi di codice e convenzioni messaggi di commit
  - Informazioni su coinvolgimento comunità

#### Completato
- **🎯 Modulo Workshop 7 (Conclusione)**: Modulo di chiusura completato con:
  - Sommario esaustivo delle realizzazioni del workshop
  - Sezione concetti chiave padroneggiati su AZD, template e Microsoft Foundry
  - Raccomandazioni per il percorso di apprendimento continuativo
  - Esercizi di sfida del workshop con valutazioni di difficoltà
  - Feedback comunità e link di supporto

- **📚 Modulo Workshop 3 (Scomposizione)**: Obiettivi di apprendimento aggiornati con:
  - Guida attivazione GitHub Copilot con server MCP
  - Comprensione della struttura cartelle template AZD
  - Pattern organization Infrastructure-as-code (Bicep)
  - Istruzioni lab pratici

- **🔧 Modulo Workshop 6 (Smontaggio)**: Completato con:
  - Obiettivi di cleanup risorse e gestione costi
  - Uso di `azd down` per deprovisioning sicuro infrastruttura
  - Guida al recupero servizi cognitivi soft-deleted
  - Suggerimenti bonus per esplorazioni GitHub Copilot e Azure Portal

#### Corretto
- **🔗 Correzione link rotti**: Risolti oltre 15 link interni documentazione rotti:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrette path microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrette path ai file ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito cicd-integration.md inesistente con deployment-guide.md
  - `examples/retail-scenario.md`: Corrette path FAQ e guida troubleshooting
  - `examples/container-app/microservices/README.md`: Corrette path home corso e guida deployment
  - `resources/faq.md` e `resources/glossary.md`: Aggiornati riferimenti capitolo AI
  - `course-outline.md`: Fixato riferimenti guida istruttore e lab workshop AI

- **📅 Banner stato Workshop**: Aggiornato da "In costruzione" a stato workshop attivo con data febbraio 2026

- **🔗 Navigazione Workshop**: Corretto link di navigazione rotti in README.md workshop che puntavano a cartella lab-1-azd-basics inesistente

#### Modifiche
- **Presentazione Workshop**: Rimossa avvertenza "in costruzione", workshop ora completo e pronto all'uso
- **Coerenza Navigazione**: Assicurata navigazione corretta tra moduli workshop
- **Riferimenti Percorso Apprendimento**: Aggiornati riferimenti incrociati capitoli con path microsoft-foundry corretti

#### Validato
- ✅ Tutti i file markdown inglesi hanno link interni validi
- ✅ Moduli workshop 0-7 completi con obiettivi di apprendimento
- ✅ Navigazione tra capitoli e moduli funziona correttamente
- ✅ Contenuti adatti a sviluppatori AI usando Microsoft AZD
- ✅ Linguaggio e struttura friendly per principianti mantenuti
- ✅ CONTRIBUTING.md fornisce chiare indicazioni per contributori comunitari

#### Implementazione Tecnica
- **Validazione Link**: Script PowerShell automatizzato ha verificato tutti i link interni .md
- **Audit Contenuti**: Revisione manuale completezza workshop e idoneità per principianti
- **Sistema Navigazione**: Applicati pattern coerenti di navigazione capitoli e moduli

#### Note
- **Campo di Applicazione**: Modifiche applicate solo a documentazione inglese
- **Traduzioni**: Cartelle traduzioni non aggiornate in questa versione (sincronizzazione traduzioni automatica prevista successivamente)
- **Durata Workshop**: Workshop completo ora offre 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione Avanzata: Monitoraggio, Sicurezza e Pattern Multi-Agent
**Questa versione aggiunge lezioni complete di livello A su integrazione Application Insights, pattern di autenticazione e coordinamento multi-agent per deployment in produzione.**

#### Aggiunto
- **📊 Lezione Integrazione Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Deployment focalizzato su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1,200 linee)
  - Pattern di monitoraggio AI/LLM (tracciamento token/costi dei modelli Microsoft Foundry)
  - 6 diagrammi Mermaid (architettura, tracciamento distribuito, flusso telemetria)
  - 3 esercizi pratici (alert, dashboard, monitoraggio AI)
  - Esempi query Kusto e strategie di ottimizzazione costi
  - Streaming metriche live e debugging in tempo reale
  - Tempo di apprendimento 40-50 minuti con pattern pronti per produzione

- **🔐 Lezione Pattern Autenticazione & Sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (stringhe connessione, Key Vault, identità gestita)
  - Template Bicep infrastruttura completi per deployment sicuro
  - Codice app Node.js con integrazione SDK Azure
  - 3 esercizi completi (abilitazione identità gestita, identità assegnata utente, rotazione Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida troubleshooting e analisi costi
  - Pattern di autenticazione passwordless pronti per produzione

- **🤖 Lezione Pattern Coordinamento Multi-Agent**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinamento (sequenziale, parallelo, gerarchico, event-driven, consensus)
  - Implementazione completa servizio orchestratore (Python/Flask, oltre 1,500 linee)
  - 3 implementazioni agent specializzati (Ricerca, Scrittore, Editor)
  - Integrazione Service Bus per code messaggi
  - Gestione stato con Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid mostrano interazioni agenti
  - 3 esercizi avanzati (gestione timeout, logica retry, circuit breaker)
  - Ripartizione costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione Application Insights per monitoraggio

#### Migliorato
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinamento
- **Capitolo Introduzione**: Potenziato con pattern di autenticazione professionale
- **Prontezza Produzione**: Copertura completa da sicurezza a osservabilità
- **Schema Corso**: Aggiornato con riferimenti a nuove lezioni nei Capitoli 3 e 6

#### Modifiche
- **Progressione Apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità Documentazione**: Standard di livello A consistenti (95-97%) nelle nuove lezioni
- **Pattern Produzione**: Copertura end-to-end per deployment enterprise

#### Migliorato
- **Esperienza Sviluppatori**: Percorso chiaro da sviluppo a monitoraggio in produzione
- **Standard Sicurezza**: Pattern professionali per gestione autenticazione e segreti
- **Osservabilità**: Integrazione Application Insights completa con AZD
- **Carichi AI**: Monitoraggio specializzato per modelli Microsoft Foundry e sistemi multi-agent

#### Validato
- ✅ Tutte le lezioni includono codice funzionante completo (non solo snippet)
- ✅ Diagrammi Mermaid per apprendimento visivo (19 totali in 3 lezioni)
- ✅ Esercizi pratici con passi di verifica (9 totali)
- ✅ Template Bicep pronti per produzione deployabili via `azd up`
- ✅ Analisi costi e strategie di ottimizzazione
- ✅ Guide troubleshooting e best practice
- ✅ Checkpoint conoscenza con comandi di verifica

#### Risultati Valutazione Documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern sicurezza professionali
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agent avanzate
- **Contenuto Nuovo Complessivo**: - Standard qualitativi elevati e consistenti

#### Implementazione Tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracing distribuito
- **Autenticazione**: Managed Identity + Key Vault + pattern RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: Metriche live + query Kusto + alert + dashboard
- **Gestione Costi**: Strategie sampling, retention policy, controllo budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti Qualità Documentazione e Nuovo Esempio Microsoft Foundry Models
**Questa versione migliora la qualità documentale in tutto il repository e aggiunge un esempio completo di deployment Microsoft Foundry Models con interfaccia chat gpt-4.1.**

#### Aggiunto
- **🤖 Esempio Chat Microsoft Foundry Models**: Deployment completo gpt-4.1 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura Microsoft Foundry Models completa (deployment modello gpt-4.1)
  - Interfaccia chat Python da linea di comando con storico conversazioni
  - Integrazione Key Vault per memorizzazione sicura chiavi API
  - Tracciamento utilizzo token e stima costi
  - Limitazione rate e gestione errori
  - README completo con guida deployment da 35-45 minuti
  - 11 file pronti per produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi Documentazione**: Aggiunti esercizi pratici alla guida configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Pratica gestione segreti (10 minuti)
  - Criteri chiari di successo e passi di verifica
- **✅ Verifica Deployment**: Aggiunta sezione verifica nella guida deployment:
  - Procedure check salute
  - Lista criteri successo
  - Output attesi per tutti i comandi di deployment
  - Riferimento rapido per troubleshooting

#### Migliorato
- **examples/README.md**: Aggiornato a qualità livello A (93%):
  - Aggiunto azure-openai-chat in tutte le sezioni rilevanti
  - Aggiornato numero esempi locali da 3 a 4
  - Aggiunto alla tabella esempi Applicazioni AI
  - Integrato nel Quick Start per utenti intermedi
  - Aggiunto alla sezione Template Microsoft Foundry
  - Aggiornate matrice comparazione e sezioni ricerca tecnologia
- **Qualità Documentazione**: Migliorato da B+ (87%) a A- (92%) nella cartella docs:
  - Aggiunti output attesi negli esempi di comandi critici
  - Inclusi passi verifica per modifiche configurazione
  - Apprendimento pratico potenziato con esercizi

#### Modifiche
- **Progressione Apprendimento**: Migliore integrazione esempi AI per utenti intermedi
- **Struttura Documentazione**: Esercizi più concreti con risultati chiari
- **Processo Verifica**: Criteri successo espliciti aggiunti ai flussi chiave

#### Migliorato
- **Esperienza Sviluppatori**: Deployment Microsoft Foundry Models ora richiede 35-45 minuti (contro 60-90 per alternative complesse)
- **Trasparenza Costi**: Stime chiare ($50-200/mese) per esempio Microsoft Foundry Models
- **Percorso Apprendimento**: Sviluppatori AI hanno punto di ingresso chiaro con azure-openai-chat
- **Standard Documentazione**: Output attesi consistenti e passi verifica

#### Validato
- ✅ Esempio Microsoft Foundry Models completamente funzionante con `azd up`
- ✅ Tutti gli 11 file implementazione sintatticamente corretti
- ✅ Istruzioni README corrispondono all’esperienza reale di deployment
- ✅ Link documentazione aggiornati in oltre 8 locazioni
- ✅ Indice esempi riflette accuratamente 4 esempi locali
- ✅ Nessun link esterno duplicato nelle tabelle
- ✅ Tutti riferimenti navigazione corretti

#### Implementazione Tecnica
- **Architettura Microsoft Foundry Models**: gpt-4.1 + Key Vault + pattern Container Apps
- **Sicurezza**: Managed Identity pronta, segreti in Key Vault
- **Monitoraggio**: Integrazione Application Insights
- **Gestione Costi**: Tracciamento token e ottimizzazione utilizzo
- **Deployment**: Singolo comando `azd up` per setup completo

### [v3.6.0] - 2025-11-19

#### Aggiornamento Importante: Esempi Deployment Container App
**Questa versione introduce esempi completi, pronti per produzione, di deployment di applicazioni containerizzate usando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunto
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida Completa](examples/container-app/README.md): Panoramica completa dei deployment containerizzati, guida rapida, produzione e modelli avanzati
  - [API Flask Semplice](../../examples/container-app/simple-flask-api): REST API per principianti con scalabilità a zero, sonde di salute, monitoraggio e risoluzione dei problemi
  - [Architettura Microservizi](../../examples/container-app/microservices): Deployment multi-servizio pronto per la produzione (API Gateway, Prodotto, Ordine, Utente, Notifica), messaggistica asincrona, Service Bus, Cosmos DB, Azure SQL, tracciamento distribuito, deployment blue-green/canary
- **Best Practices**: Sicurezza, monitoraggio, ottimizzazione dei costi e linee guida CI/CD per carichi containerizzati
- **Esempi di Codice**: Template completi `azure.yaml`, Bicep e implementazioni di servizi multi-linguaggio (Python, Node.js, C#, Go)
- **Testing & Risoluzione Problemi**: Scenari di test end-to-end, comandi di monitoraggio, guida alla risoluzione problemi

#### Modificato
- **README.md**: Aggiornato per presentare e collegare nuovi esempi di container app sotto "Esempi Locali - Applicazioni Containerizzate"
- **examples/README.md**: Aggiornato per evidenziare esempi di container app, aggiungere voci nella matrice di confronto e aggiornare riferimenti a tecnologia/architettura
- **Outline del Corso & Guida di Studio**: Aggiornato per riferire i nuovi esempi di container app e modelli di deployment nei capitoli rilevanti

#### Validato
- ✅ Tutti i nuovi esempi sono deployabili con `azd up` e seguono le best practice
- ✅ Collegamenti incrociati nella documentazione e navigazione aggiornati
- ✅ Esempi coprono scenari da principiante ad avanzato, compresi microservizi in produzione

#### Note
- **Ambito**: Documentazione e esempi solo in inglese
- **Prossimi Passi**: Espansione con ulteriori modelli avanzati di container e automazione CI/CD nelle prossime release

### [v3.5.0] - 2025-11-19

#### Rebranding Prodotto: Microsoft Foundry
**Questa versione implementa un cambio completo del nome del prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento Nome Prodotto**: Rebranding completo da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornati tutti i riferimenti nella documentazione inglese nella cartella `docs/`
  - Rinominate cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rinominate file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti al contenuto aggiornati in 7 file di documentazione

- **📁 Modifiche alla Struttura delle Cartelle**:
  - `docs/ai-foundry/` rinominata in `docs/microsoft-foundry/`
  - Tutti i riferimenti incrociati aggiornati per riflettere la nuova struttura delle cartelle
  - Collegamenti di navigazione validati in tutta la documentazione

- **📄 Rinomina File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i collegamenti interni aggiornati per riflettere il nuovo nome file

#### File Aggiornati
- **Documentazione Capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti link di navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti al nome prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Già usa Microsoft Foundry (da aggiornamenti precedenti)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (panoramica, feedback community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 link di riferimento incrociato aggiornati
  - `docs/getting-started/first-project.md` - 2 link di navigazione capitolo aggiornati
  - `docs/getting-started/installation.md` - 2 link al capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link di navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 link di navigazione aggiornato

- **File Struttura Corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (panoramica corso, titoli capitoli, sezione template, approfondimenti community)
  - `course-outline.md` - 14 riferimenti aggiornati (panoramica, obiettivi di apprendimento, risorse capitoli)

#### Validato
- ✅ Nessun riferimento residuo al percorso cartella "ai-foundry" nella documentazione inglese
- ✅ Nessun riferimento residuo al nome prodotto "Microsoft Foundry" nella documentazione inglese
- ✅ Tutti i link di navigazione funzionanti con la nuova struttura cartelle
- ✅ Rinomine di file e cartelle completate con successo
- ✅ Collegamenti incrociati tra capitoli validati

#### Note
- **Ambito**: Cambiamenti applicati solo alla documentazione inglese nella cartella `docs/`
- **Traduzioni**: Cartelle di traduzione (`translations/`) non aggiornate in questa versione
- **Workshop**: Materiali del workshop (`workshop/`) non aggiornati in questa versione
- **Esempi**: I file di esempio potrebbero ancora contenere nomi legacy (da correggere in aggiornamento futuro)
- **Link Esterni**: URL esterni e riferimenti al repository GitHub rimangono invariati

#### Guida alla Migrazione per Collaboratori
Se hai branch locali o documentazione che fa riferimento alla vecchia struttura:
1. Aggiorna riferimenti alle cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiorna riferimenti ai file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituisci nome prodotto: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifica che tutti i link interni della documentazione funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Anteprima e Miglioramenti della Validazione dell'Infrastruttura
**Questa versione introduce il supporto completo per la nuova funzionalità di anteprima di Azure Developer CLI e migliora l'esperienza utente del workshop.**

#### Aggiunto
- **🧪 Documentazione funzionalità azd provision --preview**: Copertura completa della nuova capacità di anteprima infrastruttura
  - Riferimenti comandi ed esempi d’uso nella cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d’uso e benefici
  - Integrazione pre-flight check per validazione di deployment più sicura
  - Aggiornamenti guida per best practice di deployment in sicurezza
- **🚧 Banner Stato Workshop**: Banner HTML professionale che indica stato sviluppo workshop
  - Design a gradiente con indicatori di costruzione per comunicazione chiara agli utenti
  - Timestamp ultimo aggiornamento per trasparenza
  - Design reattivo per dispositivi mobili di ogni tipo

#### Migliorato
- **Sicurezza Infrastruttura**: Funzionalità preview integrata in tutta la documentazione di deployment
- **Validazione Pre-Deployment**: Script automatici ora includono test anteprima infrastruttura
- **Flusso di Lavoro Sviluppatore**: Sequenze di comandi aggiornate per includere preview come best practice
- **Esperienza Workshop**: Aspettative chiare per utenti riguardo stato sviluppo contenuto

#### Modificato
- **Best Practices Deployment**: Workflow "preview-first" ora approccio raccomandato
- **Flusso Documentazione**: Validazione infrastruttura spostata in anticipo nel processo di apprendimento
- **Presentazione Workshop**: Comunicazione status professionale con timeline sviluppo chiara

#### Migliorato
- **Approccio Safety-First**: Modifiche infrastruttura ora validabili prima del deployment
- **Collaborazione Team**: Risultati preview condivisibili per revisione e approvazione
- **Consapevolezza Costi**: Migliore comprensione costi risorse prima provisioning
- **Mitigazione Rischi**: Riduzione di fallimenti deployment tramite validazione anticipata

#### Implementazione Tecnica
- **Integrazione Multi-Documento**: Funzionalità preview documentata in 4 file chiave
- **Pattern Comandi**: Sintassi e esempi coerenti in tutta la documentazione
- **Integrazione Best Practice**: Preview inclusa nei workflow e script di validazione
- **Indicatori Visivi**: Chiare marcature NUOVA funzionalità per facilità scoperta

#### Infrastruttura Workshop
- **Comunicazione Status**: Banner HTML professionale con styling a gradiente
- **Esperienza Utente**: Stato sviluppo chiaro per evitare confusione
- **Presentazione Professionale**: Mantiene credibilità repository e definisce aspettative
- **Trasparenza Timeline**: Timestamp ultimo aggiornamento ottobre 2025 per accountability

### [v3.3.0] - 2025-09-24

#### Materiali Workshop Migliorati ed Esperienza di Apprendimento Interattiva
**Questa versione introduce materiali completi per workshop con guide interattive browser-based e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida Workshop Interattiva**: Esperienza workshop basata su browser con capacità preview MkDocs
- **📝 Istruzioni Workshop Strutturate**: Percorso di apprendimento guidato in 7 fasi dalla scoperta alla personalizzazione
  - 0-Introduzione: panoramica e setup workshop
  - 1-Seleziona-Template-AI: processo di scoperta e selezione template
  - 2-Valida-Template-AI: procedure di deployment e validazione
  - 3-Deconstruisci-Template-AI: comprensione architettura template
  - 4-Configura-Template-AI: configurazione e personalizzazione
  - 5-Personalizza-Template-AI: modifiche avanzate e iterazioni
  - 6-Smanta-Infrastruttura: pulizia e gestione risorse
  - 7-Conclusione: riepilogo e prossimi passi
- **🛠️ Tooling Workshop**: Configurazione MkDocs con tema Material per esperienza di apprendimento migliorata
- **🎯 Percorso di Apprendimento Pratico**: metodologia in 3 passaggi (Scoperta → Deployment → Personalizzazione)
- **📱 Integrazione GitHub Codespaces**: Setup ambiente sviluppo senza interruzioni

#### Migliorato
- **Laboratorio AI Workshop**: Esteso con esperienza di apprendimento strutturata di 2-3 ore
- **Documentazione Workshop**: Presentazione professionale con navigazione e supporti visivi
- **Progressione Apprendimento**: Guida chiara passo-passo dalla selezione del template al deployment in produzione
- **Esperienza Sviluppatore**: Tooling integrato per flussi di lavoro di sviluppo semplificati

#### Migliorato
- **Accessibilità**: Interfaccia browser con ricerca, copia e toggle tema
- **Apprendimento Autonomo**: Struttura workshop flessibile per diversi ritmi di apprendimento
- **Applicazione Pratica**: Scenari reali di deployment template AI
- **Integrazione Comunità**: Integrazione Discord per supporto e collaborazione workshop

#### Funzionalità Workshop
- **Ricerca Integrata**: Scoperta rapida di parole chiave e lezioni
- **Copia Blocchi Codice**: Funzionalità hover-to-copy per tutti gli esempi di codice
- **Toggle Tema**: Supporto modalità scura/chiara per preferenze differenti
- **Asset Visivi**: Screenshot e diagrammi per comprensione migliorata
- **Integrazione Aiuto**: Accesso diretto a Discord per supporto comunitario

### [v3.2.0] - 2025-09-17

#### Ristrutturazione Maggiore della Navigazione e Sistema di Apprendimento Basato su Capitoli
**Questa versione introduce una struttura di apprendimento completa basata su capitoli con navigazione migliorata in tutto il repository.**

#### Aggiunto
- **📚 Sistema di Apprendimento Basato su Capitoli**: Ristrutturazione dell’intero corso in 8 capitoli progressivi
  - Capitolo 1: Fondazioni & Guida Rapida (⭐ - 30-45 min)
  - Capitolo 2: Sviluppo AI-First (⭐⭐ - 1-2 ore)
  - Capitolo 3: Configurazione & Autenticazione (⭐⭐ - 45-60 min)
  - Capitolo 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1,5 ore)
  - Capitolo 5: Soluzioni AI Multi-Agente (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolo 6: Validazione & Pianificazione Pre-Deployment (⭐⭐ - 1 ora)
  - Capitolo 7: Risoluzione Problemi & Debugging (⭐⭐ - 1-1,5 ore)
  - Capitolo 8: Modelli di Produzione & Enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistema di Navigazione Completo**: Intestazioni e piè di pagina di navigazione coerenti in tutta la documentazione
- **🎯 Tracciamento Progressi**: Checklist di completamento corso e sistema di verifica apprendimento
- **🗺️ Guida Percorsi di Apprendimento**: Punti d’ingresso chiari per diversi livelli di esperienza e obiettivi
- **🔗 Navigazione con Riferimenti Incrociati**: Capitoli correlati e prerequisiti collegati chiaramente

#### Migliorato
- **Struttura README**: Trasformata in piattaforma di apprendimento strutturata con organizzazione basata su capitoli
- **Navigazione Documentazione**: Ogni pagina ora include contesto capitolo e guida alla progressione
- **Organizzazione Template**: Esempi e template mappati a capitoli di apprendimento appropriati
- **Integrazione Risorse**: Cheat sheet, FAQ e guide di studio collegate ai capitoli rilevanti
- **Integrazione Workshop**: Laboratori hands-on mappati a più obiettivi di apprendimento dei capitoli

#### Modificato
- **Progressione Apprendimento**: Passaggio da documentazione lineare a apprendimento flessibile basato su capitoli
- **Posizionamento Configurazione**: Guida configurazione riposizionata come Capitolo 3 per migliore flusso di apprendimento
- **Integrazione Contenuti AI**: Migliore integrazione dei contenuti specifici AI in tutto il percorso di apprendimento
- **Contenuti Produzione**: Modelli avanzati consolidati in Capitolo 8 per studenti enterprise

#### Migliorato
- **Esperienza Utente**: Breadcrumb di navigazione e indicatori di progressione capitolo chiari
- **Accessibilità**: Pattern di navigazione coerenti per facilitare il percorso nel corso
- **Presentazione Professionale**: Struttura corso in stile universitario adatta per formazione accademica e aziendale
- **Efficienza di Apprendimento**: Riduzione del tempo per trovare contenuti rilevanti grazie a migliore organizzazione

#### Implementazione Tecnica
- **Intestazioni Navigazione**: Navigazione capitoli standardizzata in oltre 40 file di documentazione
- **Piè di Pagina Navigazione**: Guida progressione coerente e indicatori completamento capitoli
- **Link Incrociati**: Sistema di collegamenti interni completo che connette concetti correlati
- **Mappatura Capitoli**: Template ed esempi chiaramente associati agli obiettivi di apprendimento

#### Miglioramento Guida Studio
- **📚 Obiettivi di Apprendimento Completi**: Guida di studio ristrutturata per allinearsi al sistema ad 8 capitoli
- **🎯 Valutazione Basata su Capitoli**: Ogni capitolo include obiettivi specifici e esercizi pratici
- **📋 Tracciamento Progressi**: Programma settimanale di apprendimento con risultati misurabili e checklist di completamento
- **❓ Domande di Valutazione**: Domande di verifica conoscenza per ogni capitolo con risultati professionali
- **🛠️ Esercizi Pratici**: Attività hands-on con scenari reali di deployment e risoluzione problemi
- **📊 Progressione Abilità**: Avanzamento chiaro dai concetti base ai modelli enterprise con focus sviluppo carriera
- **🎓 Framework di Certificazione**: Risultati di sviluppo professionale e sistema di riconoscimento comunitario
- **⏱️ Gestione Timeline**: Piano di apprendimento strutturato di 10 settimane con validazione milestones

### [v3.1.0] - 2025-09-17

#### Soluzioni AI Multi-Agente Migliorate
**Questa versione migliora la soluzione retail multi-agente con denominazioni agenti migliori e documentazione potenziata.**

#### Modificato
- **Terminologia Multi-Agente**: Sostituito "Cora agent" con "Customer agent" in tutta la soluzione multi-agente retail per una comprensione più chiara
- **Architettura Agente**: Aggiornata tutta la documentazione, i template ARM e gli esempi di codice per utilizzare il nome coerente "Customer agent"
- **Esempi di Configurazione**: Modernizzati i pattern di configurazione dell'agente con convenzioni di denominazione aggiornate
- **Coerenza della Documentazione**: Garantito che tutti i riferimenti utilizzino nomi professionali e descrittivi degli agenti

#### Migliorato
- **Pacchetto Template ARM**: Aggiornato retail-multiagent-arm-template con riferimenti a Customer agent
- **Diagrammi Architetturali**: Aggiornati i diagrammi Mermaid con la nuova denominazione degli agenti
- **Esempi di Codice**: Le classi Python e gli esempi di implementazione ora utilizzano la denominazione CustomerAgent
- **Variabili d'Ambiente**: Aggiornati tutti gli script di deployment a usare convenzioni CUSTOMER_AGENT_NAME

#### Migliorato
- **Esperienza dello Sviluppatore**: Ruoli e responsabilità degli agenti più chiari nella documentazione
- **Prontezza alla Produzione**: Migliore allineamento con le convenzioni di denominazione aziendali
- **Materiali Didattici**: Denominazione agenti più intuitiva per scopi educativi
- **Usabilità dei Template**: Comprensione semplificata delle funzioni degli agenti e dei pattern di deployment

#### Dettagli Tecnici
- Aggiornati i diagrammi Mermaid dell'architettura con riferimenti a CustomerAgent
- Sostituiti i nomi delle classi CoraAgent con CustomerAgent negli esempi Python
- Modificate le configurazioni JSON dei template ARM per usare il tipo di agente "customer"
- Aggiornate le variabili d'ambiente da CORA_AGENT_* a CUSTOMER_AGENT_*
- Aggiornati tutti i comandi di deployment e le configurazioni dei container

### [v3.0.0] - 2025-09-12

#### Cambiamenti Principali - Focus su Sviluppatori AI e Integrazione Microsoft Foundry
**Questa versione trasforma il repository in una risorsa didattica completa focalizzata sull'AI con integrazione Microsoft Foundry.**

#### Aggiunto
- **🤖 Percorso di Apprendimento AI-First**: Ristrutturazione completa con priorità per sviluppatori e ingegneri AI
- **Guida Integrazione Microsoft Foundry**: Documentazione completa per collegare AZD ai servizi Microsoft Foundry
- **Pattern di Deployment Modelli AI**: Guida dettagliata su selezione modelli, configurazione e strategie di deployment in produzione
- **Laboratorio Workshop AI**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni deployabili con AZD
- **Best Practices AI in Produzione**: Pattern enterprise per scalabilità, monitoraggio e sicurezza dei carichi AI
- **Guida AI Specifica per Risoluzione Problemi**: Troubleshooting completo per modelli Microsoft Foundry, Cognitive Services e problemi di deployment AI
- **Galleria Template AI**: Collezione selezionata di template Microsoft Foundry con classificazioni di complessità
- **Materiali Workshop**: Struttura completa del workshop con laboratori pratici e materiali di riferimento

#### Migliorato
- **Struttura README**: Focalizzata su sviluppatori AI con dati di interesse comunitario al 45% dal Discord Microsoft Foundry
- **Percorsi di Apprendimento**: Percorso dedicato agli sviluppatori AI accanto a quelli tradizionali per studenti e ingegneri DevOps
- **Raccomandazioni Template**: Template AI in evidenza inclusi azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integrazione Comunità**: Supporto migliorato nel Discord comunitario con canali e discussioni specifiche per AI

#### Focus su Sicurezza e Produzione
- **Pattern Identità Gestita**: Configurazioni di autenticazione e sicurezza specifiche per AI
- **Ottimizzazione Costi**: Monitoraggio token e controlli di budget per carichi di lavoro AI
- **Deployment Multi-Regione**: Strategie per deployment globali di applicazioni AI
- **Monitoraggio Prestazioni**: Metriche specifiche AI e integrazione con Application Insights

#### Qualità della Documentazione
- **Struttura Lineare Corso**: Progressione logica da principianti a pattern avanzati di deployment AI
- **URL Validati**: Tutti i link esterni al repository verificati e accessibili
- **Riferimento Completo**: Validati e funzionanti tutti i link interni della documentazione
- **Pronto alla Produzione**: Pattern di deployment enterprise con esempi reali

### [v2.0.0] - 2025-09-09

#### Cambiamenti Principali - Ristrutturazione del Repository e Miglioramento Professionale
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Aggiunto
- **Framework di Apprendimento Strutturato**: Tutte le pagine della documentazione ora includono sezioni Introduzione, Obiettivi di Apprendimento e Risultati di Apprendimento
- **Sistema di Navigazione**: Aggiunti link alla lezione precedente/successiva in tutta la documentazione per un percorso di apprendimento guidato
- **Guida di Studio**: studio-guide.md completa con obiettivi di apprendimento, esercizi pratici e materiali di valutazione
- **Presentazione Professionale**: Rimosse tutte le emoji per migliore accessibilità e aspetto professionale
- **Struttura del Contenuto Migliorata**: Organizzazione e flusso dei materiali didattici migliorati

#### Modificato
- **Formato Documentazione**: Standardizzati tutti i documenti con struttura focalizzata sull'apprendimento coerente
- **Flusso di Navigazione**: Implementata progressione logica in tutti i materiali didattici
- **Presentazione del Contenuto**: Rimossi elementi decorativi a favore di formattazione chiara e professionale
- **Struttura dei Link**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Migliorato
- **Accessibilità**: Rimosse dipendenze da emoji per miglior compatibilità con lettori di schermo
- **Aspetto Professionale**: Presentazione pulita in stile accademico adatta all'apprendimento aziendale
- **Esperienza di Apprendimento**: Approccio strutturato con obiettivi chiari e risultati per ogni lezione
- **Organizzazione del Contenuto**: Migliore flusso logico e collegamento tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio Iniziale - Repository AZD di Apprendimento Completo

#### Aggiunto
- **Struttura Documentazione Core**
  - Serie completa di guide per iniziare
  - Documentazione completa di deployment e provisioning
  - Risorse dettagliate per troubleshooting e debugging
  - Strumenti e procedure per validazione pre-deployment

- **Modulo Getting Started**
  - Nozioni Base AZD: Concetti e terminologia fondamentali
  - Guida all’installazione: Istruzioni per setup specifiche della piattaforma
  - Guida alla Configurazione: Setup ambientale e autenticazione
  - Tutorial Primo Progetto: Apprendimento passo-passo pratico

- **Modulo Deployment e Provisioning**
  - Guida al Deployment: Documentazione completa del workflow
  - Guida al Provisioning: Infrastructure as Code con Bicep
  - Best practices per deployment in produzione
  - Pattern architetturali multi-servizio

- **Modulo Validazione Pre-Deployment**
  - Capacity Planning: Validazione disponibilità risorse Azure
  - Scelta SKU: Guida completa ai livelli di servizio
  - Pre-flight Checks: Script di validazione automatizzati (PowerShell e Bash)
  - Strumenti di stima costi e pianificazione budget

- **Modulo Risoluzione Problemi**
  - Problemi Comuni: Problemi frequenti e soluzioni
  - Guida al Debugging: Metodologie sistematiche di troubleshooting
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio e ottimizzazione delle prestazioni

- **Risorse e Riferimenti**
  - Cheat Sheet Comandi: Riferimento rapido ai comandi essenziali
  - Glossario: Terminologia e definizioni di acronimi
  - FAQ: Risposte dettagliate a domande comuni
  - Link a risorse esterne e comunità

- **Esempi e Template**
  - Esempio semplice di applicazione web
  - Template di deployment per sito web statico
  - Configurazione per applicazione containerizzata
  - Pattern di integrazione database
  - Esempi di architettura microservizi
  - Implementazioni di funzioni serverless

#### Caratteristiche
- **Supporto Multi-Piattaforma**: Guide di installazione e configurazione per Windows, macOS e Linux
- **Livelli di Competenza Multipli**: Contenuti progettati per studenti e sviluppatori professionisti
- **Focus Pratico**: Esempi pratici e scenari reali
- **Copertura Completa**: Da concetti base a pattern enterprise avanzati
- **Approccio Security-First**: Best practices per la sicurezza integrate ovunque
- **Ottimizzazione dei Costi**: Linee guida per deployment e gestione risorse economici

#### Qualità della Documentazione
- **Esempi di Codice Dettagliati**: Campioni di codice pratici e testati
- **Istruzioni Passo-passo**: Indicazioni chiare e operative
- **Gestione Completa degli Errori**: Risoluzione problemi comuni
- **Integrazione Best Practices**: Standard industriali e raccomandazioni
- **Compatibilità Versioni**: Aggiornata con i più recenti servizi Azure e funzionalità azd

## Miglioramenti Futuri Pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione della Piattaforma AI
- **Supporto Multi-Modello**: Pattern di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework Agenti AI**: Template per deploy LangChain, Semantic Kernel e AutoGen
- **Pattern RAG Avanzati**: Opzioni database vettoriali oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio migliorato per prestazioni modelli, uso token e qualità risposte

#### Esperienza Sviluppatore
- **Estensione VS Code**: Esperienza di sviluppo integrata AZD + Microsoft Foundry
- **Integrazione GitHub Copilot**: Generazione template AZD assistita da AI
- **Tutorial Interattivi**: Esercizi di coding pratici con validazione automatica per scenari AI
- **Contenuti Video**: Tutorial video supplementari per apprendenti visivi focalizzati su deploy AI

### Versione 4.0.0 (Pianificata)
#### Pattern AI Aziendali
- **Framework Governance**: Governance modelli AI, compliance e audit trail
- **AI Multi-Tenant**: Pattern per servire più clienti con servizi AI isolati
- **Deploy AI Edge**: Integrazione con Azure IoT Edge e container instances
- **AI Cloud Ibrido**: Pattern multi-cloud e ibridi per carichi di lavoro AI

#### Funzionalità Avanzate
- **Automazione Pipeline AI**: Integrazione MLOps con pipeline Azure Machine Learning
- **Sicurezza Avanzata**: Pattern zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Ottimizzazione Prestazioni**: Tuning avanzato e strategie di scalabilità per applicazioni AI ad alto throughput
- **Distribuzione Globale**: Pattern di content delivery e edge caching per applicazioni AI

### Versione 3.0.0 (Pianificata) - Sostituita dalla Release Corrente
#### Aggiunte Proposte - Ora Implementate in v3.0.0
- ✅ **Contenuti Focalizzati AI**: Integrazione Microsoft Foundry completa (Completato)
- ✅ **Tutorial Interattivi**: Laboratorio workshop AI pratico (Completato)
- ✅ **Modulo Sicurezza Avanzata**: Pattern sicurezza specifici AI (Completato)
- ✅ **Ottimizzazione Prestazioni**: Strategie di tuning carichi AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente Implementata in v3.0.0
#### Miglioramenti Minori - Alcuni Completati nella Release Corrente
- ✅ **Esempi Aggiuntivi**: Scenari di deployment focalizzati AI (Completato)
- ✅ **FAQ Estese**: Domande e troubleshooting AI-specifici (Completato)
- **Integrazione Strumenti**: Guide migliorate per IDE e editor
- ✅ **Espansione Monitoraggio**: Pattern AI-specifici di monitoraggio e alerting (Completato)

#### Ancora Pianificati per Futuri Rilasci
- **Documentazione Mobile-Friendly**: Design responsivo per apprendimento mobile
- **Accesso Offline**: Pacchetti documentazione scaricabili
- **Integrazione IDE Migliorata**: Estensione VS Code per workflow AZD + AI
- **Dashboard Comunitaria**: Metriche comunitarie in tempo reale e tracciamento contributi

## Contributo al Changelog

### Segnalazione Modifiche
Quando contribuite a questo repository, assicuratevi che le voci del changelog contengano:

1. **Numero di Versione**: Seguendo il versionamento semantico (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento in formato AAAA-MM-GG
3. **Categoria**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Descrizione Chiara**: Descrizione concisa di cosa è cambiato
5. **Valutazione Impatto**: Come i cambiamenti influenzano gli utenti esistenti

### Categorie di Modifiche

#### Aggiunto
- Nuove funzionalità, sezioni di documentazione o capacità
- Nuovi esempi, template o risorse di apprendimento
- Strumenti, script o utilità aggiuntivi

#### Modificato
- Modifiche a funzionalità o documentazione esistenti
- Aggiornamenti per migliorarne chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Depricato
- Funzionalità o approcci in fase di dismissione
- Sezioni di documentazione programmate per rimozione
- Metodi con alternative migliori disponibili

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori in documentazione o codice
- Risoluzione di problemi o issue segnalati
- Miglioramenti di accuratezza o funzionalità

#### Sicurezza
- Migliorie o fix relativi alla sicurezza
- Aggiornamenti alle best practices di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee Guida per Versionamento Semantico

#### Versione Maggiore (X.0.0)
- Cambiamenti incompatibili che richiedono azione da parte degli utenti
- Ristrutturazione significativa di contenuti o organizzazione
- Cambiamenti che alterano l'approccio o metodologia fondamentale

#### Versione Minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuto
- Miglioramenti che mantengono compatibilità retroattiva
- Esempi, strumenti o risorse aggiuntive

#### Versione Patch (X.Y.Z)
- Correzioni di bug e fix
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli perfezionamenti

## Feedback e Suggerimenti dalla Comunità

Incoraggiamo attivamente il feedback della comunità per migliorare questa risorsa didattica:

### Come Fornire Feedback
- **Problemi GitHub**: Segnalare problemi o suggerire miglioramenti (benvenuti problemi specifici AI)
- **Discussioni Discord**: Condividere idee e interagire con la comunità Microsoft Foundry
- **Pull Request**: Contribuire con miglioramenti diretti ai contenuti, specialmente template e guide AI
- **Discord Microsoft Foundry**: Partecipare al canale #Azure per discussioni AZD + AI
- **Forum Comunitari**: Partecipare a discussioni Azure per sviluppatori più ampie

### Categorie di Feedback
- **Accuratezza Contenuti AI**: Correzioni su integrazione servizi AI e informazioni di deployment
- **Esperienza di Apprendimento**: Suggerimenti per migliorare il flusso didattico per sviluppatori AI
- **Contenuti AI Mancanti**: Richieste per template, pattern o esempi AI aggiuntivi
- **Accessibilità**: Migliorie per bisogni didattici diversificati
- **Integrazione Strumenti AI**: Suggerimenti per migliore integrazione di workflow AI
- **Pattern AI in Produzione**: Richieste di pattern enterprise per deployment AI

### Impegno di Risposta
- **Risposta a Issue**: Entro 48 ore per problemi segnalati
- **Richieste di Funzionalità**: Valutazione entro una settimana
- **Contributi Comunitari**: Revisione entro una settimana
- **Problemi di Sicurezza**: Priorità immediata con risposta accelerata

## Programma di Manutenzione

### Aggiornamenti Regolari
- **Revisioni Mensili**: Accuratezza dei contenuti e verifica dei link
- **Aggiornamenti Trimestrali**: Aggiunte e miglioramenti sostanziali dei contenuti
- **Revisioni Semestrali**: Ristrutturazione completa e potenziamento
- **Rilasci Annuali**: Aggiornamenti di versione importanti con miglioramenti significativi

### Monitoraggio e Assicurazione della Qualità
- **Test Automatizzati**: Validazione regolare di esempi di codice e link
- **Integrazione Feedback della Comunità**: Incorporazione regolare dei suggerimenti degli utenti
- **Aggiornamenti Tecnologici**: Allineamento con i servizi Azure più recenti e le versioni di azd
- **Audit di Accessibilità**: Revisione regolare per principi di design inclusivo

## Politica di Supporto delle Versioni

### Supporto per la Versione Attuale
- **Ultima Versione Principale**: Supporto completo con aggiornamenti regolari
- **Versione Principale Precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni Legacy**: Supporto della comunità solo, nessun aggiornamento ufficiale

### Linee Guida per la Migrazione
Quando vengono rilasciate versioni principali, forniamo:
- **Guide alla Migrazione**: Istruzioni passo dopo passo per la transizione
- **Note di Compatibilità**: Dettagli sui cambiamenti incompatibili
- **Supporto Strumenti**: Script o utility per assistere nella migrazione
- **Supporto della Comunità**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione Precedente**: [Guida di Studio](resources/study-guide.md)
- **Lezione Successiva**: Torna a [README Principale](README.md)

**Rimani Aggiornato**: Segui questo repository per notifiche su nuove release e aggiornamenti importanti ai materiali di apprendimento.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
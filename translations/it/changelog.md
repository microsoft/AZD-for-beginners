# Changelog - AZD Per Principianti

## Introduzione

Questo changelog documenta tutte le modifiche, aggiornamenti e miglioramenti rilevanti al repository AZD Per Principianti. Seguiamo i principi versioning semantico e manteniamo questo registro per aiutare gli utenti a comprendere cosa è cambiato tra le versioni.

## Obiettivi di Apprendimento

Esaminando questo changelog, potrai:
- Restare informato sulle nuove funzionalità e aggiunte di contenuto
- Comprendere i miglioramenti apportati alla documentazione esistente
- Tenere traccia delle correzioni di bug e aggiustamenti per garantire l'accuratezza
- Seguire l’evoluzione dei materiali didattici nel tempo

## Risultati di Apprendimento

Dopo aver esaminato le voci del changelog, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l’apprendimento
- Comprendere quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento basandoti sui materiali più aggiornati
- Contribuire con feedback e suggerimenti per miglioramenti futuri

## Cronologia Versioni

### [v3.23.0] - 2026-07-13

#### Aggiornamento AZD 1.27.1: Aggiornamento Versione Corrente
**Questa versione rivede il corso rispetto a `azd` `1.27.1` (luglio 2026, ultima release stabile) e l’attuale estensione agente AI in anteprima `azure.ai.agents` `1.0.0-beta.5`, portando ogni banner "validato contro" aggiornato dopo le release 1.26.0, 1.27.0, e 1.27.1.**

#### Modifiche
- **✅ Linea base di validazione aggiornata** da `azd 1.25.6` (giugno 2026) a `azd 1.27.1` (luglio 2026) tra il README principale, tutti i README dei capitoli, la lezione del dev-container del Capitolo 1 (inclusi esempi con versione bloccata), la lezione sui template personalizzati del Capitolo 4, la lezione multi-agente del Capitolo 5 e la documentazione del workshop
- **🤖 Linea base Capitolo 2 aggiornata** da `azd 1.23.12` (marzo 2026) a `azd 1.27.1` tra `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; date delle note di validazione aggiornate al 13-07-2026
- **🧩 Estensione agente AI aggiornata** da `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` all’attuale release `1.0.0-beta.5` nel README del Capitolo 2 e in `agents.md`
- **🧪 Esempio di validazione workshop** (output di `azd version`) aggiornato a `1.27.1`

#### Note sulle release azd rilevanti (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Supporto Go per Azure Functions su Flex Consumption, filtri di sottoscrizione per tenant con `azd config sub-filter`, pacchetti estensione self-contained (`azd x pack --bundle`), e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellazione di progetti/agenti Azure AI Foundry direttamente in `azure.yaml` (init senza Bicep/Terraform), supporto a deploy container per App Service (`host: appservice` + `language: docker`), flag diretto `-s/--source` per comandi `azd extension`, e `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` per `azd extension install`, modelli deprecati esclusi dalle richieste catalogo/quote per default, e varie correzioni di bug

#### File Aggiornati
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

#### Colmata delle lacune per principianti #2: Creazione di Template, Dev Containers, Pulumi, Azure DevOps, Service Principals e altro
**Questa versione chiude le rimanenti lacune intermedie emerse dall’analisi azd-coverage: come creare e pubblicare il proprio template, ambienti dev-container/Codespaces riproducibili, il provider infrastrutturale Pulumi, una panoramica CI/CD di Azure DevOps, l’autenticazione con service principal, linee guida per la selezione host (AKS/Spring Apps), spiegazioni `azd restore`/`azd package`, gestione errori hook, e pratiche per team/ambienti condivisi.**

#### Aggiunto
- **🧱 Nuova lezione Capitolo 4** `docs/chapter-04-infrastructure/custom-templates.md` — creare il proprio template azd: struttura necessaria (`azure.yaml`, `infra/`, `src/`), campo `metadata.template`, parametrizzazione infrastruttura con token risorsa `uniqueString()` e tag `azd-env-name`, test locale con `azd init --template <local-path>`, pubblicazione su GitHub, e invio alla galleria Awesome AZD
- **📦 Nuova lezione Capitolo 1** `docs/chapter-01-foundation/dev-containers.md` — ambienti azd riproducibili con Dev Containers e GitHub Codespaces: un `.devcontainer/devcontainer.json` minimale usando la feature ufficiale `ghcr.io/azure/azure-dev/azd`, feature specifiche per linguaggio, `docker-in-docker` per host container, e `azd auth login --use-device-code` per login remoto
- **🧩 Sezione Pulumi con azd** in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout cartella Pulumi, stacks mappati agli ambienti azd, output/tag richiesti, e identico workflow `azd up` / `azd down`
- **🎯 Linee guida selezione host** in `docs/chapter-04-infrastructure/provisioning.md` — confronto amichevole per principianti di `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` e `springapp`, con indicazioni su quando scegliere AKS o Azure Spring Apps
- **🛠️ Panoramica Azure DevOps CI/CD** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, connessione servizio con workload identity federation (OIDC), `azure-dev.yml` generato, e configurazione gruppo variabili
- **🔑 Service Principals (Pattern 4)** aggiunto in `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non interattivo con client secret vs credenziali federate/OIDC, quando usarli, e conservazione sicura delle credenziali
- **🪝 Gestione errori hook** sotto-sezione in `docs/chapter-04-infrastructure/deployment-guide.md` — codici di uscita e `set -e`, `continueOnError`, test hook in isolamento con `azd hooks run`, shell specifiche OS, e `--debug`
- **👥 Ambienti team/condivisi** sezione in `docs/chapter-03-configuration/configuration.md` — cosa c’è in `.azure/`, cosa ignorare in git, ambienti per sviluppatore, `azd env list`/`select`, e fornitura valori ambiente in CI/CD
- **🧰 Spiegazioni `azd restore` e `azd package` ampliate** in `resources/cheat-sheet.md` — ripristino dipendenze e costruzione artefatto deployabile senza deploy

#### Modificato
- **🧭 Tabella lezioni Capitolo 4** aggiornata per includere la nuova lezione "Creare il proprio template" (Lezione 3)
- **🧭 Tabella lezioni Capitolo 1** aggiornata per includere la nuova lezione "Dev Containers & Codespaces" (Lezione 5); footer di navigazione collegati tra `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Colmata delle lacune per principianti: Lezione pratico multi-agente, "Porta la tua app," Terraform e Panoramica CI/CD
**Questa versione colma le lacune più grandi per una guida completa ai principianti aggiungendo due nuove lezioni pratiche (un walkthrough multi-agente deployabile e l’aggiunta di azd a una app esistente), un’introduzione amichevole agli hook, una sezione Terraform con azd, una panoramica passo passo di GitHub Actions pipeline, un esplicatore per le nuove estensioni preview, e una checklist esplicita di verifica del deploy.**

#### Aggiunto
- **🤝 Nuova lezione Capitolo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — walkthrough completamente pratico e deployabile a due agenti (orchestrator + specialisti) usando un template reale (`contoso-creative-writer`), che include quando usare multi-agente, workflow `azd up`, comprensione risorse deployate, cross-agent tracing, personalizzazione, e cleanup
- **📦 Nuova lezione Capitolo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — come aggiungere azd a un progetto esistente con `azd init` ("usa codice nella directory corrente"), comprensione di `azure.yaml` e `infra/`, `azd infra generate`, rilevazione host e deploy con `azd up`
- **🌐 Sezione Terraform con azd** aggiunta in `docs/chapter-04-infrastructure/provisioning.md` — configurazione `infra.provider: terraform`, layout cartella `.tf`, output `AZURE_*` richiesti e tagging `azd-env-name`, e identico workflow `azd up` / `azd down` (chiude la lacuna dove il supporto Terraform era dichiarato ma mostrato solo Bicep)
- **⚙️ Panoramica passo passo GitHub Actions** in `docs/chapter-08-production/production-ai-practices.md` — dal repo GitHub ai deploy automatici: configurazione pipeline `azd pipeline config`, credenziali federate OIDC (senza segreti salvati), `azure-dev.yml` generato, e guida su segreti vs variabili
- **🪝 Introduzione “Nuovo agli hook?” per principianti** in `docs/chapter-04-infrastructure/deployment-guide.md` — cos’è un hook, tabella fasi hook, primo hook minimale ed esecuzione manuale con `azd hooks run`
- **✅ Checklist “Verifica il tuo deploy”** aggiunta al Passo 5 di `docs/chapter-01-foundation/first-project.md` — test rapido, controllo endpoint salute, e criteri espliciti di successo
- **🧩 Spiegatore per nuove estensioni preview** `azure.ai.skills` e `azure.ai.connections` (cosa sono e quando usarle) in `docs/chapter-08-production/production-ai-practices.md`

#### Modificato
- **🧭 Tabella lezioni Capitolo 5** corretta: `multi-agent-basics.md` ora è Lezione 1 (l’unica veramente hands-on), con etichettatura onesta che la Lezione 2 è in Capitolo 6 e lo scenario Retail è uno schema architetturale, non un template con un comando
- **🧭 Tabella lezioni Capitolo 1** ora include la nuova lezione "Porta la tua app" (Lezione 4)
- **🔗 Footer navigazione** aggiornati: `first-project.md` ora collega in avanti a `bring-your-own-app.md`

#### Corretto
- **🧱 Lacuna Terraform “dichiarata ma mancante” chiusa** — il corso precedentemente faceva riferimento al supporto Terraform senza mostrarlo
- **🔀 Correzione link incrociati fuorvianti nel Capitolo 5** che suggerivano l’esistenza di un’implementazione multi-agente completa quando c’era solo uno schema architetturale

#### File Aggiornati
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

#### Aggiornamento AZD 1.25.6, Comandi Completi Ciclo Vita Agente & Rebranding Aspire

**Questa versione riesegue la convalida del corso con `azd` `1.25.6` (giugno 2026) e l’estensione `azure.ai.agents` `0.1.40-preview`, amplia la guida sull’AI da "strutturare un agente" all’intero ciclo di vita dell’agente (test → valutazione → ottimizzazione → ispezione → eliminazione), introduce le nuove estensioni in anteprima `azure.ai.skills` e `azure.ai.connections`, e segnala il rebranding del prodotto da ".NET Aspire" a "Aspire".**

#### Aggiunto
- **🔁 Copertura completa del ciclo di vita dell’agente** per principianti e ingegneri AI in tutta la documentazione:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabella del ciclo di vita (strutturare → testare → misurare → migliorare → ispezionare → pulire) aggiunta alla sezione Estensioni e Comandi AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nuova sezione "Gestione del Ciclo di Vita dell’Agente" che copre `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, e `delete --force`
  - `resources/cheat-sheet.md` — Comandi AI Agent ampliati con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
- **🧩 Nuove estensioni in anteprima** documentate: `azure.ai.skills` (competenze agenti riutilizzabili) e `azure.ai.connections` (connessioni Foundry) aggiunte alla tabella delle estensioni e cheat sheet
- **⏱️ Guida sul timing di risposta** — gli esempi di `azd ai agent invoke` ora indicano che stampa la latenza totale e il tempo al primo byte
- **📌 Banner di versione** nel README principale che indirizza gli studenti a `azd version` e `azd upgrade`

#### Modificato
- **✅ Baseline di convalida aggiornata** da `azd 1.23.12` (marzo 2026) a `azd 1.25.6` (giugno 2026) in tutti i README dei capitoli e nella documentazione del workshop
- **🤖 Nota sull’estensione del Capitolo 2** aggiornata da `azure.ai.agents` `0.1.18-preview` a `0.1.40-preview`
- **🧪 Esempio di convalida workshop** (output `azd version`) aggiornato a `1.25.6`
- **🧭 README "Novità in azd Oggi"** rinnovato per evidenziare il ciclo di vita end-to-end dell’agente, nuove estensioni AI e recenti fix di qualità della vita (`azd init` idempotente, pulizia token obsoleti in `azd auth login`, prompt al primo avvio di `azd tool`)
- **📖 agents.md Capitolo 2 (Opzione 4)** ora indirizza gli studenti ai comandi del ciclo di vita post-distribuzione invece di fermarsi a `azd up`

#### Risolto
- **🏷️ Naming del prodotto** — aggiunta una nota sul rebranding Aspire (".NET Aspire" ora è semplicemente "Aspire"); il supporto di azd per Aspire rimane invariato
- **🔎 Convalida rilascio live** confermata contro il feed di rilascio Azure Developer CLI: CLI stabile `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### File Aggiornati
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

#### Chiarimento per Principianti, Validazione Setup & Pulizia Comandi AZD Finali
**Questa versione segue la convalida AZD 1.23 con una revisione della documentazione focalizzata sui principianti: chiarisce la guida all’autenticazione in AZD, aggiunge script di validazione setup locale, verifica i comandi chiave con il CLI AZD live e rimuove i riferimenti obsoleti ai comandi in inglese fuori dal changelog.**

#### Aggiunto
- **🧪 Script di validazione setup per principianti** con `validate-setup.ps1` e `validate-setup.sh` così gli studenti possono confermare gli strumenti richiesti prima di iniziare il Capitolo 1
- **✅ Passi di validazione setup anticipati** nel README principale e nel README del Capitolo 1 così i prerequisiti mancanti sono catturati prima di `azd up`

#### Modificato
- **🔐 Guida all’autenticazione per principianti** ora tratta `azd auth login` coerentemente come percorso principale per i workflow AZD, con `az login` citato come opzionale a meno che non si usino direttamente comandi Azure CLI
- **📚 Flusso onboarding Capitolo 1** ora indirizza gli studenti a validare il setup locale prima dell’installazione, dell’autenticazione e del primo deployment
- **🛠️ Messaggi del validatore** ora separano chiaramente requisiti bloccanti dagli avvisi opzionali Azure CLI per il percorso principianti solo AZD
- **📖 Documentazione di configurazione, troubleshooting ed esempi** ora distingue tra autenticazione AZD richiesta e login opzionale Azure CLI dove prima erano presentati assieme senza contesto

#### Risolto
- **📋 Riferimenti rimanenti ai comandi in inglese** aggiornati alle forme AZD correnti, incluso `azd config show` nel cheat sheet e `azd monitor --overview` dove previsto l’overview del Portale Azure
- **🧭 Claim per principianti nel Capitolo 1** attenuati per evitare promesse eccessive di comportamento senza errori o rollback garantito su tutti i template e risorse Azure
- **🔎 Convalida CLI live** confermata per supporto attuale su `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

#### File Aggiornati
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

#### Validazione AZD 1.23.12, Espansione Ambiente Workshop & Aggiornamento Modelli AI
**Questa versione esegue una revisione della documentazione rispetto a `azd` `1.23.12`, aggiorna esempi obsoleti dei comandi AZD, aggiorna la guida ai modelli AI ai valori di default attuali, e amplia le istruzioni del workshop oltre GitHub Codespaces per supportare anche contenitori di sviluppo e cloni locali.**

#### Aggiunto
- **✅ Note di validazione in core chapters e workshop docs** per chiarire quale baseline AZD testata è adatta per studenti con build CLI più vecchie o più recenti
- **⏱️ Guida su timeout di deployment** per app AI a esecuzione lunga usando `azd deploy --timeout 1800`
- **🔎 Passi di ispezione dell’estensione** con `azd extension show azure.ai.agents` nella documentazione del workflow AI
- **🌐 Guida ambiente workshop più ampia** copre GitHub Codespaces, dev container e cloni locali con MkDocs

#### Modificato
- **📚 README introduttivi dei capitoli** ora riportano coerentemente la validazione contro `azd 1.23.12` in foundation, configurazione, infrastruttura, multi-agent, pre-deployment, troubleshooting e produzione
- **🛠️ Riferimenti ai comandi AZD** aggiornati alle forme correnti in tutta la documentazione:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` a seconda del contesto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` dove prevista una panoramica di Application Insights
- **🧪 Esempi di provisioning preview** semplificati all’uso attualmente supportato come `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Flusso del workshop** aggiornato per permettere agli studenti di completare i laboratori in Codespaces, container di sviluppo o clone locale anziché assumere solo Codespaces
- **🔐 Guida all’autenticazione** ora preferisce `azd auth login` per i workflow AZD, posizionando `az login` come opzionale quando si usano comandi Azure CLI direttamente

#### Risolto
- **🪟 Comandi di installazione Windows** normalizzati al casing attuale del pacchetto `winget` nella guida all’installazione
- **🐧 Guida all’installazione Linux** corretta per evitare istruzioni non supportate specifiche per distro su `azd` e indicare invece gli asset di rilascio quando opportuno
- **📦 Esempi di modello AI** aggiornati dai vecchi default come `gpt-35-turbo` e `text-embedding-ada-002` a esempi correnti tipo `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Snippet di deployment e diagnostica** corretti per usare i comandi attuali di ambiente e stato in log, script e passi di troubleshooting
- **⚙️ Guida GitHub Actions** aggiornata da `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Guida consenso MCP/Copilot** aggiornata da `azd mcp consent` a `azd copilot consent list`

#### Migliorato
- **🧠 Guida capitolo AI** ora spiega meglio il comportamento preview-sensibile di `azd ai`, il login tenant-specific, l’uso attuale delle estensioni e raccomandazioni di deployment modelli aggiornate
- **🧪 Istruzioni per il workshop** ora usano versioni più realistiche e un linguaggio più chiaro per il setup degli ambienti nei laboratori pratici
- **📈 Documentazione produzione e troubleshooting** ora allineata meglio con monitoraggio attuale, modello fallback e esempi di costo-tier

#### File Aggiornati
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
**Questa versione aggiunge la copertura dei comandi `azd ai`, `azd extension` e `azd mcp` in tutti i capitoli correlati all’AI, corregge link interrotti e codice deprecato in agents.md, aggiorna il cheat sheet e riorganizza la sezione Template di esempio con descrizioni validate e nuovi template Azure AI AZD.**

#### Aggiunto
- **🤖 Copertura AZD AI CLI** in 7 file (precedentemente solo in Capitolo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nuova sezione "Estensioni e Comandi AI" che introduce `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opzione 4: `azd ai agent init` con tabella comparativa (template vs approccio manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sottosezioni "Estensioni AZD per Foundry" e "Deployment Agent-First"

  - `docs/chapter-05-multi-agent/README.md` — Avvio rapido mostra ora entrambi i percorsi di distribuzione basati su template e manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sezione Deploy ora include l'opzione `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sottosezione "Comandi estensione AZD AI per diagnosi"
  - `resources/cheat-sheet.md` — Nuova sezione "Comandi AI & Extensions" con `azd extension`, `azd ai agent init`, `azd mcp`, e `azd infra generate`
- **📦 Nuovi template esempio AZD AI** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET con Blazor WebAssembly, Semantic Kernel e supporto per chat vocale
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J con opzioni di distribuzione ACA/AKS
  - **contoso-creative-writer** — App di scrittura creativa multi-agente usando Azure AI Agent Service, Bing Grounding, e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con supporto sviluppo locale Ollama
  - **chat-with-your-data-solution-accelerator** — Acceleratore RAG enterprise con portale amministrativo, integrazione Teams e opzioni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App di riferimento per orchestrazione MCP multi-agente con server in .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template di avvio Bicep per infrastruttura minima Azure AI
  - **🔗 Link alla Galleria Awesome AZD AI** — Riferimento alla [galleria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (oltre 80 template)

#### Fixati
- **🔗 navigazione agents.md**: I link Precedente/Successivo corrispondono ora all'ordine delle lezioni nel README del Capitolo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 link rotti in agents.md**: `production-ai-practices.md` corretto in `../chapter-08-production/production-ai-practices.md` (3 occorrenze)
- **📦 codice deprecato in agents.md**: Sostituito `opencensus` con `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API non valida in agents.md**: Spostato `max_tokens` da `create_agent()` a `create_run()` come `max_completion_tokens`
- **🔢 conteggio token in agents.md**: Sostituita la stima approssimativa `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correzione servizi da "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predefinito modificato Ott 2024)
- **contoso-chat**: Descrizione aggiornata per fare riferimento a Azure AI Foundry + Prompty, in linea con il titolo e stack tecnologico del repository

#### Rimossi
- **ai-document-processing**: Riferimento template non funzionante rimosso (repo non accessibile pubblicamente come template AZD)

#### Migliorati
- **📝 esercizi agents.md**: Esercizio 1 ora mostra output atteso e step `azd monitor`; Esercizio 2 include il codice completo di registrazione `FunctionTool`; Esercizio 3 sostituisce indicazioni vaghe con comandi concreti `prepdocs.py`
- **📚 risorse agents.md**: Link documentazione aggiornati alle attuali docs Azure AI Agent Service e quickstart
- **📋 tabella Passi successivi agents.md**: Aggiunto link Workshop AI per copertura completa del capitolo

#### File aggiornati
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Miglioramento navigazione corso
**Questa versione migliora la navigazione nei README.md dei capitoli con un formato tabellare migliorato.**

#### Modifiche
- **Tabella mappa corso**: Migliorata con link diretti alle lezioni, stime di durata e valutazioni di complessità
- **Pulizia cartelle**: Rimosse cartelle vecchie ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validazione link**: Verificati tutti i 21+ link interni nella tabella mappa corso

### [v3.16.0] - 2026-02-05

#### Aggiornamento nomi prodotto
**Questa versione aggiorna i riferimenti ai prodotti con il branding Microsoft attuale.**

#### Modifiche
- **Microsoft Foundry → Microsoft Foundry**: Aggiornati tutti i riferimenti nei file non di traduzione
- **Azure AI Agent Service → Foundry Agents**: Nome del servizio aggiornato per riflettere il branding attuale

#### File aggiornati
- `README.md` - pagina principale del corso
- `changelog.md` - cronologia versioni
- `course-outline.md` - struttura corso
- `docs/chapter-02-ai-development/agents.md` - guida agli agenti AI
- `examples/README.md` - documentazione esempi
- `workshop/README.md` - pagina di accesso workshop
- `workshop/docs/index.md` - indice workshop
- `workshop/docs/instructions/*.md` - tutti i file istruzioni workshop

---

### [v3.15.0] - 2026-02-05

#### Ristrutturazione importante del repository: nomi cartelle basate sui capitoli
**Questa versione ristruttura la documentazione in cartelle dedicate per capitolo per una navigazione più chiara.**

#### Rinominazione cartelle
Le vecchie cartelle sono state sostituite con cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Aggiunta nuova: `docs/chapter-05-multi-agent/`

#### Migrazione file
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Aggiunto
- **📚 File README dei capitoli**: Creato README.md in ogni cartella del capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella delle lezioni con descrizioni
  - Comandi per l'avvio rapido
  - Navigazione verso altri capitoli

#### Modificato
- **🔗 Aggiornati tutti i link interni**: Oltre 78 percorsi aggiornati in tutti i file di documentazione
- **🗺️ README.md principale**: Aggiornata mappa del corso con la nuova struttura dei capitoli
- **📝 examples/README.md**: Aggiornati riferimenti incrociati alle cartelle dei capitoli

#### Rimosso
- Vecchia struttura delle cartelle (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ristrutturazione del repository: Navigazione dei capitoli
**Questa versione ha aggiunto file README di navigazione dei capitoli (sostituiti dalla v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nuova guida agli agenti AI
**Questa versione aggiunge una guida completa per il deployment di agenti AI con Azure Developer CLI.**

#### Aggiunto
- **🤖 docs/microsoft-foundry/agents.md**: Guida completa che copre:
  - Cosa sono gli agenti AI e come differiscono dai chatbot
  - Tre template di agenti per l'avvio rapido (Foundry Agents, Prompty, RAG)
  - Modelli architetturali degli agenti (agente singolo, RAG, multi-agente)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento delle metriche
  - Considerazioni e ottimizzazione dei costi
  - Scenari comuni di risoluzione problemi
  - Tre esercizi pratici con criteri di successo

#### Struttura del contenuto
- **Introduzione**: Concetti degli agenti per principianti
- **Avvio rapido**: Deploy degli agenti con `azd init --template get-started-with-ai-agents`
- **Modelli architetturali**: Diagrammi visivi dei modelli di agenti
- **Configurazione**: Setup degli strumenti e variabili d'ambiente
- **Monitoraggio**: Integrazione con Application Insights
- **Esercizi**: Apprendimento pratico progressivo (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### Aggiornamento ambiente DevContainer
**Questa versione aggiorna la configurazione del container di sviluppo con strumenti moderni e impostazioni predefinite migliorate per l’esperienza di apprendimento AZD.**

#### Modificato
- **🐳 Immagine base**: Aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (ultima Debian stabile)
- **📛 Nome del container**: Rinominato da "Python 3" a "AZD for Beginners" per maggiore chiarezza

#### Aggiunto
- **🔧 Nuove funzionalità del Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per i template AZD)
  - `github-cli` per la gestione dei template
  - `docker-in-docker` per il deployment di container app

- **🔌 Port Forwarding**: Porte preconfigurate per lo sviluppo comune:
  - 8000 (anteprima MkDocs)
  - 3000 (app web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nuove estensioni per VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python avanzato
  - `ms-azuretools.vscode-azurefunctions` - Supporto Azure Functions
  - `ms-azuretools.vscode-docker` - Supporto Docker
  - `ms-azuretools.vscode-bicep` - Supporto linguaggio Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestione risorse Azure
  - `yzhang.markdown-all-in-one` - Editing Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Supporto diagrammi Mermaid
  - `redhat.vscode-yaml` - Supporto YAML (per azure.yaml)
  - `eamodio.gitlens` - Visualizzazione Git
  - `mhutchie.git-graph` - Cronologia Git

- **⚙️ Impostazioni VS Code**: Aggiunte impostazioni predefinite per interprete Python, formatta al salvataggio, e trimming spazi bianchi

- **📦 Aggiornato requirements-dev.txt**:
  - Aggiunto plugin di minimizzazione MkDocs
  - Aggiunto pre-commit per la qualità del codice
  - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Risolto
- **Comando post-creazione**: Ora verifica l’installazione di AZD e Azure CLI all’avvio del container

---

### [v3.11.0] - 2026-02-05

#### Revisione README amichevole per principianti
**Questa versione migliora significativamente il README.md per renderlo più accessibile ai principianti e aggiunge risorse essenziali per sviluppatori AI.**

#### Aggiunto
- **🆚 Confronto Azure CLI vs AZD**: Spiegazione chiara su quando usare ciascuno strumento con esempi pratici
- **🌟 Link fantastici AZD**: Link diretti alla galleria template community e risorse per contributi:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Oltre 200 template pronti al deployment
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contributi della community
- **🎯 Guida Rapida**: Sezione introduttiva semplificata in 3 passaggi (Installa → Login → Deploy)
- **📊 Tabella di navigazione basata sull’esperienza**: Indicazioni chiare su dove iniziare in base all’esperienza dello sviluppatore

#### Modificato
- **Struttura README**: Riorganizzata per dischiusione progressiva - prime le informazioni chiave
- **Sezione Introduzione**: Riscritta per spiegare "La magia di `azd up`" per principianti completi
- **Contenuto duplicato rimosso**: Eliminata sezione troubleshooting duplicata

- **Comandi di risoluzione dei problemi**: Corretto il riferimento a `azd logs` per utilizzare il valido `azd monitor --logs`

#### Corretto

- **🔐 Comandi di Autenticazione**: Aggiunti `azd auth login` e `azd auth logout` a cheat-sheet.md
- **Riferimenti a Comandi Non Validi**: Rimossi i rimanenti `azd logs` dalla sezione troubleshooting del README

#### Note
- **Ambito**: Modifiche applicate al README.md principale e a resources/cheat-sheet.md
- **Pubblico Target**: Miglioramenti specificamente rivolti a sviluppatori nuovi a AZD

---

### [v3.10.0] - 2026-02-05

#### Aggiornamento Accuratezza Comandi Azure Developer CLI
**Questa versione corregge comandi AZD inesistenti in tutta la documentazione, garantendo che tutti gli esempi di codice utilizzino una sintassi valida di Azure Developer CLI.**

#### Correzioni
- **🔧 Rimozione Comandi AZD Inesistenti**: Audit completo e correzione di comandi invalidi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative Azure CLI
  - Sotto-comandi `azd service` (non esistono) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (non esistono) → rimossi
  - Flag `azd provision --what-if/--rollback` (non esistono) → aggiornati per usare `--preview`
  - `azd config validate` (non esiste) → sostituito con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (non esistono) → rimossi

- **📚 File Aggiornati con Correzioni ai Comandi**:
  - `resources/cheat-sheet.md`: Revisione completa del riferimento ai comandi
  - `docs/deployment/deployment-guide.md`: Correzione strategie rollback e deployment
  - `docs/troubleshooting/debugging.md`: Corrette sezioni di analisi log
  - `docs/troubleshooting/common-issues.md`: Aggiornamento comandi di troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Correzione sezione debugging AZD
  - `docs/getting-started/azd-basics.md`: Correzione comandi di monitoraggio
  - `docs/getting-started/first-project.md`: Aggiornamento esempi di monitoraggio e debugging
  - `docs/getting-started/installation.md`: Correzione esempi help e versione
  - `docs/pre-deployment/application-insights.md`: Correzione comandi di visualizzazione log
  - `docs/pre-deployment/coordination-patterns.md`: Correzione comandi di debugging agent

- **📝 Riferimento Versione Aggiornato**: 
  - `docs/getting-started/installation.md`: Versione codificata `1.5.0` sostituita con generica `1.x.x` con link alle release

#### Modifiche
- **Strategie di Rollback**: Documentazione aggiornata per usare rollback basato su Git (AZD non ha rollback nativo)
- **Visualizzazione Log**: Rimpiazzati riferimenti `azd logs` con `azd monitor --logs`, `azd monitor --live` e comandi Azure CLI
- **Sezione Performance**: Rimossi flag di deployment parallelo/incrementale inesistenti, fornite alternative valide

#### Dettagli Tecnici
- **Comandi AZD Validati**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor Validi**: `--live`, `--logs`, `--overview`
- **Funzionalità Rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: Comandi validati contro Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento Workshop e Aggiornamento Qualità Documentazione
**Questa versione completa i moduli interattivi del workshop, corregge tutti i link rotti della documentazione e migliora la qualità generale dei contenuti per gli sviluppatori AI che usano Microsoft AZD.**

#### Aggiunte
- **📝 CONTRIBUTING.md**: Nuovo documento linee guida per i contributi con:
  - Istruzioni chiare per segnalare problemi e proporre modifiche
  - Standard documentali per i nuovi contenuti
  - Linee guida per esempi di codice e convenzioni per i messaggi di commit
  - Informazioni per coinvolgimento comunitario

#### Completati
- **🎯 Modulo Workshop 7 (Conclusione)**: Modulo di chiusura completato con:
  - Riassunto completo dei risultati del workshop
  - Sezione concetti chiave padronati su AZD, template e Microsoft Foundry
  - Raccomandazioni per il proseguimento del percorso di apprendimento
  - Esercizi sfida del workshop con livelli di difficoltà
  - Feedback della comunità e link di supporto

- **📚 Modulo Workshop 3 (Decomposizione)**: Obiettivi di apprendimento aggiornati con:
  - Guida all’attivazione GitHub Copilot con server MCP
  - Comprensione della struttura cartelle template AZD
  - Pattern di organizzazione infrastructure-as-code (Bicep)
  - Istruzioni per laboratorio pratico

- **🔧 Modulo Workshop 6 (Smontaggio)**: Completato con:
  - Obiettivi di pulizia risorse e gestione costi
  - Uso di `azd down` per deprovisioning sicuro dell’infrastruttura
  - Guida al recupero dei servizi cognitivi soft-deleted
  - Prompt bonus per esplorazione GitHub Copilot e Azure Portal

#### Correzioni
- **🔗 Correzione Link Rotti**: Risolti più di 15 link interni rotti della documentazione:
  - `docs/ai-foundry/ai-model-deployment.md`: Correzione percorsi a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correzioni percorsi ai file ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito cicd-integration.md inesistente con deployment-guide.md
  - `examples/retail-scenario.md`: Correzione percorsi FAQ e guida troubleshooting
  - `examples/container-app/microservices/README.md`: Correzione percorsi home corso e guida deployment
  - `resources/faq.md` e `resources/glossary.md`: Aggiornati riferimenti capitolo AI
  - `course-outline.md`: Correzioni riferimenti guida istruttore e laboratori workshop AI

- **📅 Banner Stato Workshop**: Aggiornato da "In Costruzione" a stato attivo workshop con data Febbraio 2026

- **🔗 Navigazione Workshop**: Correzione link di navigazione rotti nel README.md workshop che puntavano a cartella lab-1-azd-basics inesistente

#### Modifiche
- **Presentazione Workshop**: Rimossa avvertenza "in costruzione", workshop ora completo e pronto all’uso
- **Coerenza Navigazione**: Garantita navigazione corretta tra tutti i moduli del workshop
- **Riferimenti Percorso di Apprendimento**: Aggiornati riferimenti incrociati capitoli ai corretti percorsi microsoft-foundry

#### Validazioni
- ✅ Tutti i file markdown in inglese hanno link interni validi
- ✅ Moduli workshop 0-7 completi con obiettivi di apprendimento
- ✅ Navigazione tra capitoli e moduli funzionante correttamente
- ✅ Contenuti adatti per sviluppatori AI che usano Microsoft AZD
- ✅ Linguaggio e struttura adatti ai principianti mantenuti ovunque
- ✅ CONTRIBUTING.md fornisce linee guida chiare per i contributori della comunità

#### Implementazione Tecnica
- **Validazione Link**: Script PowerShell automatizzato ha verificato tutti i link interni .md
- **Audit dei Contenuti**: Revisione manuale della completezza del workshop e idoneità per principianti
- **Sistema di Navigazione**: Applicati pattern coerenti di navigazione tra capitoli e moduli

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione in inglese
- **Traduzioni**: Cartelle traduzione non aggiornate in questa versione (la traduzione automatica si sincronizzerà in seguito)
- **Durata Workshop**: Workshop completo ora offre 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione Avanzata: Monitoraggio, Sicurezza e Pattern Multi-Agente
**Questa versione aggiunge lezioni complete di livello A su integrazione Application Insights, pattern di autenticazione e coordinazione multi-agente per deployment di produzione.**

#### Aggiunte
- **📊 Lezione Integrazione Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Deployment focalizzato su AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1.200 righe)
  - Pattern di monitoraggio AI/LLM (monitoraggio token/costi Microsoft Foundry Models)
  - 6 diagrammi Mermaid (architettura, tracing distribuito, flusso telemetria)
  - 3 esercizi pratici (alert, dashboard, monitoraggio AI)
  - Esempi query Kusto e strategie di ottimizzazione costi
  - Streaming metriche live e debugging in tempo reale
  - Durata apprendimento 40-50 minuti con pattern di produzione pronti all’uso

- **🔐 Lezione Pattern Autenticazione & Sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 pattern di autenticazione (connection string, Key Vault, managed identity)
  - Template infrastruttura Bicep completi per deployment sicuri
  - Codice applicazione Node.js con integrazione Azure SDK
  - 3 esercizi completi (abilitazione managed identity, user-assigned identity, rotazione Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida al troubleshooting e analisi costi
  - Pattern di autenticazione passwordless pronto per produzione

- **🤖 Lezione Pattern Coordinazione Multi-Agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern di coordinazione (sequenziale, parallelo, gerarchico, event-driven, consenso)
  - Implementazione completa servizio orchestratore (Python/Flask, oltre 1.500 righe)
  - 3 implementazioni agent specializzate (Ricerca, Scrittore, Editor)
  - Integrazione Service Bus per code messaggi
  - Gestione stato Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano interazioni agenti
  - 3 esercizi avanzati (gestione timeout, logica retry, circuit breaker)
  - Ripartizione costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione Application Insights per monitoraggio

#### Potenziamenti
- **Capitolo Pre-deployment**: Ora include pattern completi di monitoraggio e coordinazione
- **Capitolo Getting Started**: Potenziato con pattern di autenticazione professionali
- **Prontezza Produzione**: Copertura completa da sicurezza a osservabilità
- **Outline Corso**: Aggiornato per riferire a nuove lezioni nei Capitoli 3 e 6

#### Modifiche
- **Progressione Apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità Documentazione**: Standard coerenti di qualità A (95-97%) nelle nuove lezioni
- **Pattern Produzione**: Copertura completa end-to-end per deployment enterprise

#### Miglioramenti
- **Esperienza Sviluppatore**: Percorso chiaro da sviluppo a monitoraggio in produzione
- **Standard di Sicurezza**: Pattern professionali per autenticazione e gestione segreti
- **Osservabilità**: Integrazione completa Application Insights con AZD
- **Carichi di Lavoro AI**: Monitoraggio specializzato per Microsoft Foundry Models e sistemi multi-agente

#### Validazioni
- ✅ Tutte le lezioni includono codice funzionante completo (non solo frammenti)
- ✅ Diagrammi Mermaid per apprendimento visivo (19 totali in 3 lezioni)
- ✅ Esercizi pratici con passaggi di verifica (9 totali)
- ✅ Template Bicep pronti per produzione deployabili tramite `azd up`
- ✅ Analisi costi e strategie di ottimizzazione
- ✅ Guide troubleshooting e best practice
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati Valutazione Documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa al monitoraggio
- **docs/getting-started/authsecurity.md**: - Pattern di sicurezza professionali
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Contenuti Nuovi Complessivi**: - Standard costanti di alta qualità

#### Implementazione Tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracing distribuito
- **Autenticazione**: Managed Identity + Key Vault + pattern RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: Metriche live + query Kusto + alert + dashboard
- **Gestione Costi**: Strategie di campionamento, politiche di retention, controlli budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti Qualità Documentazione e Nuovo Esempio Microsoft Foundry Models
**Questa versione migliora la qualità della documentazione in tutto il repository e aggiunge un esempio completo di deployment Microsoft Foundry Models con interfaccia chat gpt-4.1.**

#### Aggiunte
- **🤖 Esempio Chat Microsoft Foundry Models**: Deployment completo gpt-4.1 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura Microsoft Foundry Models completa (deployment modello gpt-4.1)
  - Interfaccia chat da linea comando Python con cronologia conversazioni
  - Integrazione Key Vault per archiviazione sicura chiave API
  - Monitoraggio utilizzo token e stima costi
  - Limitazione richieste e gestione errori
  - README completo con guida deployment da 35-45 minuti
  - 11 file pronti per produzione (template Bicep, app Python, configurazione)
- **📚 Esercizi Documentazione**: Aggiunti esercizi pratici a guida configurazione:
  - Esercizio 1: Configurazione multi-ambiente (15 minuti)
  - Esercizio 2: Pratica gestione segreti (10 minuti)
  - Criteri di successo chiari e passaggi di verifica
- **✅ Verifica Deployment**: Aggiunta sezione verifica alla guida deployment:
  - Procedure di controllo stato salute
  - Checklist criteri di successo
  - Output attesi per tutti i comandi di deployment
  - Riferimenti rapidi per troubleshooting

#### Potenziamenti
- **examples/README.md**: Aggiornato a qualità A (93%):
  - Aggiunto azure-openai-chat in tutte le sezioni rilevanti
  - Conteggio esempi locali aggiornato da 3 a 4
  - Aggiunto alla tabella Esempi Applicazioni AI
  - Integrato in Quick Start per utenti intermedi
  - Aggiunto alla sezione Template Microsoft Foundry
  - Aggiornate matrice di confronto e sezioni di individuazione tecnologia
- **Qualità Documentazione**: Migliorata da B+ (87%) a A- (92%) nella cartella docs

  - Aggiunti output attesi agli esempi di comandi critici
  - Includi passaggi di verifica per le modifiche di configurazione
  - Migliorato l'apprendimento pratico con esercizi pratici

#### Modificato
- **Progressione dell'apprendimento**: Migliore integrazione degli esempi AI per studenti intermedi
- **Struttura della documentazione**: Esercizi più pratici con risultati chiari
- **Processo di verifica**: Criteri di successo espliciti aggiunti ai flussi di lavoro chiave

#### Migliorato
- **Esperienza dello sviluppatore**: Il deployment di Microsoft Foundry Models ora richiede 35-45 minuti (vs 60-90 per alternative complesse)
- **Trasparenza dei costi**: Stime chiare dei costi ($50-200/mese) per l'esempio Microsoft Foundry Models
- **Percorso di apprendimento**: Gli sviluppatori AI hanno un punto di ingresso chiaro con azure-openai-chat
- **Standard della documentazione**: Output attesi e passaggi di verifica coerenti

#### Validato
- ✅ Esempio Microsoft Foundry Models completamente funzionante con `azd up`
- ✅ Tutti gli 11 file di implementazione sintatticamente corretti
- ✅ Le istruzioni nel README corrispondono all'esperienza reale di deployment
- ✅ Collegamenti della documentazione aggiornati in oltre 8 posizioni
- ✅ L’indice degli esempi riflette accuratamente 4 esempi locali
- ✅ Nessun collegamento esterno duplicato nelle tabelle
- ✅ Tutti i riferimenti di navigazione corretti

#### Implementazione Tecnica
- **Architettura Microsoft Foundry Models**: pattern gpt-4.1 + Key Vault + Container Apps
- **Sicurezza**: Managed Identity pronta, segreti in Key Vault
- **Monitoraggio**: integrazione Application Insights
- **Gestione dei costi**: tracciamento token e ottimizzazione utilizzo
- **Deployment**: comando singolo `azd up` per configurazione completa

### [v3.6.0] - 2025-11-19

#### Aggiornamento principale: esempi di deployment con Container App
**Questa versione introduce esempi completi e pronti per la produzione per il deployment di applicazioni containerizzate usando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunto
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida Master](examples/container-app/README.md): panoramica completa dei deployment containerizzati, avvio rapido, produzione e pattern avanzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST per principianti con scale-to-zero, health probes, monitoraggio e troubleshooting
  - [Architettura Microservizi](../../examples/container-app/microservices): deployment multi-servizio pronto per la produzione (API Gateway, Product, Order, User, Notification), messaggistica asincrona, Service Bus, Cosmos DB, Azure SQL, distributed tracing, deploy blue-green/canary
- **Best Practices**: sicurezza, monitoraggio, ottimizzazione costi e guida CI/CD per carichi containerizzati
- **Campioni di codice**: `azure.yaml`, template Bicep completi e implementazioni multi-lingua (Python, Node.js, C#, Go)
- **Testing & troubleshooting**: scenari di test end-to-end, comandi di monitoraggio, guida al troubleshooting

#### Modificato
- **README.md**: aggiornato per presentare e collegare i nuovi esempi container app sotto "Local Examples - Container Applications"
- **examples/README.md**: aggiornato per evidenziare gli esempi container app, aggiungere voci della matrice confronto e aggiornare riferimenti tecnologia/architettura
- **Outline del corso & guida di studio**: aggiornati per fare riferimento ai nuovi esempi e pattern di deployment container app nei capitoli rilevanti

#### Validato
- ✅ Tutti i nuovi esempi deployabili con `azd up` e seguono le best practice
- ✅ Collegamenti incrociati e navigazione documentazione aggiornati
- ✅ Gli esempi coprono scenari da principianti ad avanzati, inclusi microservizi in produzione

#### Note
- **Ambito**: documentazione ed esempi solo in inglese
- **Prossimi passi**: espandere con pattern container avanzati e automazione CI/CD in versioni future

### [v3.5.0] - 2025-11-19

#### Rebranding prodotto: Microsoft Foundry
**Questa versione implementa un cambio completo del nome del prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento nome prodotto**: rebranding completo da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornati tutti i riferimenti nella documentazione inglese in `docs/`
  - Rinominata cartella: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rinominato file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti aggiornati in 7 file documentazione

- **📁 Cambiamenti struttura cartelle**:
  - `docs/ai-foundry/` rinominato in `docs/microsoft-foundry/`
  - Aggiornati tutti i riferimenti incrociati per riflettere la nuova struttura
  - Collegamenti di navigazione verificati in tutta la documentazione

- **📄 Rinomina file**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i link interni aggiornati per riferirsi al nuovo nome file

#### File aggiornati
- **Documentazione capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti link navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti nome prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - già usa Microsoft Foundry (da aggiornamenti precedenti)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (overview, feedback community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 link cross-reference aggiornati
  - `docs/getting-started/first-project.md` - 2 link navigazione capitoli aggiornati
  - `docs/getting-started/installation.md` - 2 link capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 link navigazione aggiornato

- **File struttura corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (overview corso, titoli capitoli, sezione template, insight community)
  - `course-outline.md` - 14 riferimenti aggiornati (overview, obiettivi apprendimento, risorse capitoli)

#### Validato
- ✅ Nessun riferimento restante alla cartella "ai-foundry" nella documentazione inglese
- ✅ Nessun riferimento restante al nome prodotto "Microsoft Foundry" nella documentazione inglese
- ✅ Tutti i link di navigazione funzionanti con la nuova struttura cartelle
- ✅ Rinomine di file e cartelle completate con successo
- ✅ Cross-reference tra capitoli verificati

#### Note
- **Ambito**: modifiche applicate solo alla documentazione inglese in `docs/`
- **Traduzioni**: cartelle traduzioni (`translations/`) non aggiornate in questa versione
- **Workshop**: materiali workshop (`workshop/`) non aggiornati in questa versione
- **Esempi**: file esempi possono ancora riferirsi a nomi legacy (da sistemare in aggiornamenti futuri)
- **Link esterni**: URL esterni e riferimenti repository GitHub rimangono invariati

#### Guida alla migrazione per contributori
Se avete branch locali o documentazione che fanno riferimento alla vecchia struttura:
1. Aggiornare i riferimenti cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiornare i riferimenti file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituire nome prodotto: "Microsoft Foundry" → "Microsoft Foundry"
4. Verificare che tutti i link interni funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Anteprima infrastruttura e miglioramenti validazione
**Questa versione introduce il supporto completo per la nuova funzionalità di anteprima di Azure Developer CLI e migliora l'esperienza utente del workshop.**

#### Aggiunto
- **🧪 Documentazione funzionalità azd provision --preview**: Copertura completa della nuova capacità di anteprima infrastrutturale
  - Riferimento comandi ed esempi d’uso nella cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d’uso e benefici
  - Integrazione di controlli pre-flight per validazione deploy più sicura
  - Aggiornamenti guida avvio con pratiche di deploy orientate alla sicurezza
- **🚧 Banner stato workshop**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design a gradiente con indicatori di costruzione per chiara comunicazione utente
  - Timestamp ultimo aggiornamento per trasparenza
  - Design responsive per dispositivi mobili di ogni tipo

#### Migliorato
- **Sicurezza infrastruttura**: Funzionalità preview integrata nella documentazione deployment
- **Validazione pre-deployment**: Script automatizzati ora includono test anteprima infrastruttura
- **Workflow sviluppatore**: Sequenze comandi aggiornate per includere la preview come best practice
- **Esperienza workshop**: Aspettative chiare comunicate agli utenti sullo stato di sviluppo contenuti

#### Modificato
- **Best practice deployment**: Workflow preferito ora raccomanda approccio preview-first
- **Flusso documentazione**: Validazione infrastruttura spostata a fasi più iniziali del percorso di apprendimento
- **Presentazione workshop**: Comunicazione professionale stato con timeline sviluppo chiara

#### Migliorato
- **Approccio safety-first**: Ora è possibile validare modifiche infrastruttura prima del deployment
- **Collaborazione team**: Risultati anteprima condivisibili per revisione e approvazione
- **Consapevolezza costi**: Migliore comprensione dei costi risorse prima del provisioning
- **Mitigazione rischi**: Riduzione dei fallimenti di deployment grazie a validazione anticipata

#### Implementazione tecnica
- **Integrazione multi-documento**: Funzionalità preview documentata in 4 file chiave
- **Pattern comandi**: Sintassi coerente ed esempi in tutta la documentazione
- **Integrazione best practice**: Preview inclusa nei workflow di validazione e negli script
- **Indicatori visivi**: Marcatore chiaro NEW per facilitare scoperta funzionalità

#### Infrastruttura workshop
- **Comunicazione stato**: Banner HTML professionale con stile a gradiente
- **Esperienza utente**: Stato sviluppo chiaro previene confusione
- **Presentazione professionale**: Mantiene credibilità repository pur impostando aspettative
- **Trasparenza timeline**: Timestamp ultimo aggiornamento ottobre 2025 per accountability

### [v3.3.0] - 2025-09-24

#### Materiali workshop migliorati ed esperienza interattiva di apprendimento
**Questa versione introduce materiali workshop completi con guide interattive basate su browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida workshop interattiva**: Esperienza workshop basata su browser con capacità preview MkDocs
- **📝 Istruzioni workshop strutturate**: Percorso di apprendimento guidato in 7 passi dalla scoperta alla personalizzazione
  - 0-Introduzione: panoramica e setup workshop
  - 1-Seleziona-template-AI: scoperta e selezione template
  - 2-Valida-template-AI: procedure di deployment e validazione
  - 3-Decomponi-template-AI: comprensione architettura template
  - 4-Configura-template-AI: configurazione e personalizzazione
  - 5-Personalizza-template-AI: modifiche avanzate e iterazioni
  - 6-Smaltisci-infrastruttura: cleanup e gestione risorse
  - 7-Conclusione: riepilogo e prossimi passi
- **🛠️ Tooling workshop**: Configurazione MkDocs con tema Material per esperienza di apprendimento migliorata
- **🎯 Percorso di apprendimento hands-on**: metodologia in 3 passi (Scoperta → Deployment → Personalizzazione)
- **📱 Integrazione GitHub Codespaces**: Setup ambiente sviluppo senza interruzioni

#### Migliorato
- **Laboratorio AI**: Esteso con esperienza di apprendimento strutturata da 2 a 3 ore
- **Documentazione workshop**: Presentazione professionale con navigazione e ausili visivi
- **Progressione apprendimento**: Guida chiara passo-passo dalla selezione template fino al deployment in produzione
- **Esperienza sviluppatore**: Tool integrati per workflow sviluppo più snello

#### Migliorato
- **Accessibilità**: Interfaccia browser con ricerca, funzione copia e toggle tema
- **Autoapprendimento**: Struttura workshop flessibile che si adatta a diverse velocità di apprendimento
- **Applicazione pratica**: scenari reali di deployment template AI
- **Integrazione comunità**: Integrazione Discord per supporto e collaborazione workshop

#### Caratteristiche workshop
- **Ricerca integrata**: scoprire rapidamente parole chiave e lezioni
- **Blocchi codice copiabili**: funzione copia al passaggio del mouse per tutti gli esempi di codice
- **Toggle tema**: supporto modalità scura/chiara per preferenze diverse
- **Asset visivi**: screenshot e diagrammi per comprensione migliorata
- **Integrazione aiuto**: accesso diretto a Discord per supporto comunità

### [v3.2.0] - 2025-09-17

#### Ristrutturazione navigazione e sistema di apprendimento basato su capitoli
**Questa versione introduce una struttura di apprendimento basata su capitoli completa con navigazione migliorata in tutto il repository.**

#### Aggiunto
- **📚 Sistema di apprendimento basato su capitoli**: Ridefinito l’intero corso in 8 capitoli di apprendimento progressivi
  - Capitolo 1: Fondamenti & Avvio rapido (⭐ - 30-45 min)
  - Capitolo 2: Sviluppo AI-First (⭐⭐ - 1-2 ore)
  - Capitolo 3: Configurazione & Autenticazione (⭐⭐ - 45-60 min)
  - Capitolo 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 ore)
  - Capitolo 5: Soluzioni AI Multi-Agent (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolo 6: Validazione e pianificazione pre-deployment (⭐⭐ - 1 ora)
  - Capitolo 7: Risoluzione problemi & Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolo 8: Pattern di produzione & aziendali (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistema di navigazione completo**: Intestazioni e piè di pagina di navigazione coerenti in tutta la documentazione
- **🎯 Tracciamento progressi**: Checklist completamento corso e sistema di verifica dell’apprendimento
- **🗺️ Guida percorso di apprendimento**: Punti di accesso chiari per diversi livelli di esperienza e obiettivi
- **🔗 Navigazione cross-reference**: Capitoli correlati e prerequisiti collegati chiaramente

#### Migliorato
- **Struttura README**: Trasformato in piattaforma di apprendimento strutturata con organizzazione basata su capitoli
- **Navigazione documentazione**: Ogni pagina ora include contesto capitolo e guida alla progressione
- **Organizzazione template**: Esempi e template mappati ai capitoli di apprendimento appropriati

- **Integrazione Risorse**: Cheat sheet, FAQ e guide di studio collegate ai capitoli pertinenti
- **Integrazione Laboratori**: Laboratori pratici abbinati a molteplici obiettivi di apprendimento dei capitoli

#### Modificato
- **Progressione di Apprendimento**: Passaggio da documentazione lineare ad apprendimento flessibile basato su capitoli
- **Posizionamento Configurazione**: Guida alla configurazione riposizionata come Capitolo 3 per un flusso di apprendimento migliore
- **Integrazione Contenuti AI**: Migliore integrazione dei contenuti specifici per AI nel percorso di apprendimento
- **Contenuti di Produzione**: Modelli avanzati consolidati nel Capitolo 8 per gli studenti aziendali

#### Migliorato
- **Esperienza Utente**: Percorsi di navigazione chiari e indicatori di avanzamento capitolo
- **Accessibilità**: Modelli di navigazione coerenti per un percorso di corso più semplice
- **Presentazione Professionale**: Struttura di corso in stile universitario adatta per formazione accademica e aziendale
- **Efficienza d’Apprendimento**: Riduzione del tempo per trovare contenuti rilevanti grazie a migliore organizzazione

#### Implementazione Tecnica
- **Intestazioni di Navigazione**: Navigazione dei capitoli standardizzata in oltre 40 file di documentazione
- **Navigazione Footer**: Guida di progressione coerente e indicatori di completamento capitolo
- **Collegamenti Incrociati**: Sistema completo di link interni che collega concetti correlati
- **Mappatura Capitoli**: Template ed esempi chiaramente associati agli obiettivi di apprendimento

#### Miglioramento Guida di Studio
- **📚 Obiettivi di Apprendimento Completi**: Guida di studio ristrutturata per allinearsi al sistema di 8 capitoli
- **🎯 Valutazione Basata su Capitoli**: Ogni capitolo include obiettivi specifici e esercizi pratici
- **📋 Monitoraggio Progresso**: Programma di apprendimento settimanale con risultati misurabili e checklist di completamento
- **❓ Domande di Valutazione**: Domande di verifica conoscenze per ogni capitolo con risultati professionali
- **🛠️ Esercizi Pratici**: Attività hands-on con scenari reali di deployment e risoluzione problemi
- **📊 Progressione delle Competenze**: Avanzamento chiaro dai concetti base ai modelli enterprise con focus sullo sviluppo carriera
- **🎓 Framework di Certificazione**: Risultati di sviluppo professionale e sistema di riconoscimento della community
- **⏱️ Gestione della Timeline**: Piano di apprendimento strutturato di 10 settimane con validazione traguardi

### [v3.1.0] - 2025-09-17

#### Soluzioni AI Multi-Agente Migliorate
**Questa versione migliora la soluzione retail multi-agente con una migliore denominazione degli agenti e documentazione potenziata.**

#### Modificato
- **Terminologia Multi-Agente**: Sostituito "agente Cora" con "agente Cliente" nella soluzione retail multi-agente per maggiore chiarezza
- **Architettura Agente**: Aggiornata tutta la documentazione, i template ARM ed esempi di codice per usare la denominazione coerente "agente Cliente"
- **Esempi di Configurazione**: Modelli di configurazione degli agenti modernizzati con convenzioni di denominazione aggiornate
- **Coerenza Documentazione**: Garantito che tutti i riferimenti usino nomi professionali e descrittivi per gli agenti

#### Potenziato
- **Pacchetto Template ARM**: Aggiornato retail-multiagent-arm-template con riferimenti all’agente Cliente
- **Diagrammi Architetturali**: Aggiornati diagrammi Mermaid con nuova denominazione agente
- **Esempi di Codice**: Classi Python ed esempi di implementazione ora usano denominazione CustomerAgent
- **Variabili d’Ambiente**: Aggiornati tutti gli script di deployment per usare convenzioni CUSTOMER_AGENT_NAME

#### Migliorato
- **Esperienza Sviluppatore**: Ruoli e responsabilità agente più chiari nella documentazione
- **Prontezza Produzione**: Migliore allineamento con convenzioni di denominazione aziendali
- **Materiali Didattici**: Denominazione agente più intuitiva per scopi educativi
- **Usabilità Template**: Comprensione semplificata delle funzioni agente e modelli di deployment

#### Dettagli Tecnici
- Aggiornati diagrammi architetturali Mermaid con riferimenti CustomerAgent
- Sostituiti nomi delle classi CoraAgent con CustomerAgent negli esempi Python
- Modificate configurazioni JSON template ARM per usare il tipo agente "customer"
- Aggiornate variabili d’ambiente da CORA_AGENT_* a CUSTOMER_AGENT_*
- Aggiornati tutti i comandi di deployment e configurazioni container

### [v3.0.0] - 2025-09-12

#### Cambiamenti Maggiori - Focus sullo Sviluppatore AI e Integrazione Microsoft Foundry
**Questa versione trasforma il repository in una risorsa di apprendimento completa focalizzata sull’AI con integrazione Microsoft Foundry.**

#### Aggiunto
- **🤖 Percorso di Apprendimento AI-First**: Ristrutturazione completa con priorità a sviluppatori e ingegneri AI
- **Guida Integrazione Microsoft Foundry**: Documentazione completa per connettere AZD ai servizi Microsoft Foundry
- **Modelli di Deployment AI**: Guida dettagliata per selezione modelli, configurazione e strategie di deployment in produzione
- **Laboratorio Workshop AI**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni deployabili AZD
- **Best Practice AI in Produzione**: Modelli pronti per l’enterprise per scalabilità, monitoraggio e sicurezza carichi AI
- **Guida alla Risoluzione Problemi AI**: Soluzioni complete per modelli Microsoft Foundry, Cognitive Services e deployment AI
- **Galleria Template AI**: Collezione in evidenza di template Microsoft Foundry con classificazione di complessità
- **Materiali Workshop**: Struttura completa con laboratori pratici e materiali di riferimento

#### Potenziato
- **Struttura README**: Focalizzata su sviluppatori AI con dati di interesse comunità al 45% dal Discord Microsoft Foundry
- **Percorsi di Apprendimento**: Percorso dedicato sviluppatori AI accanto a quelli tradizionali per studenti e ingegneri DevOps
- **Raccomandazioni Template**: Template AI in evidenza inclusi azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integrazione Comunità**: Supporto comunità Discord potenziato con canali e discussioni AI-specifiche

#### Focus su Sicurezza e Produzione
- **Modelli Identità Gestita**: Autenticazione e configurazione di sicurezza specifiche per AI
- **Ottimizzazione Costi**: Monitoraggio uso token e controlli budget per carichi AI
- **Deployment Multi-Regione**: Strategie per il deployment globale di applicazioni AI
- **Monitoraggio Performance**: Metriche AI-specifiche e integrazione Application Insights

#### Qualità Documentazione
- **Struttura Corso Lineare**: Progressione logica da principianti a modelli di deployment AI avanzati
- **URL Verificati**: Tutti i link esterni ai repository verificati e accessibili
- **Riferimento Completo**: Tutti i link interni alla documentazione verificati e funzionanti
- **Pronto per la Produzione**: Modelli di deployment enterprise con esempi reali

### [v2.0.0] - 2025-09-09

#### Cambiamenti Maggiori - Ristrutturazione Repository e Potenziamento Professionale
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Aggiunto
- **Framework di Apprendimento Strutturato**: Tutte le pagine di documentazione ora includono sezioni Introduzione, Obiettivi di Apprendimento e Risultati di Apprendimento
- **Sistema di Navigazione**: Aggiunte link Lezione Precedente/Successiva in tutta la documentazione per un percorso guidato
- **Guida di Studio**: Studio-guide.md completa con obiettivi di apprendimento, esercizi pratici e materiali di valutazione
- **Presentazione Professionale**: Rimossi tutti gli emoji per migliorare accessibilità e aspetto professionale
- **Struttura Contenuti Potenziata**: Migliorata organizzazione e flusso dei materiali di apprendimento

#### Modificato
- **Formato Documentazione**: Standardizzata tutta la documentazione con struttura coerente focalizzata sull’apprendimento
- **Flusso di Navigazione**: Implementata progressione logica attraverso tutti i materiali di apprendimento
- **Presentazione Contenuti**: Rimosso elementi decorativi a favore di una formattazione chiara e professionale
- **Struttura Link**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Migliorato
- **Accessibilità**: Rimosse dipendenze dagli emoji per migliore compatibilità con screen reader
- **Aspetto Professionale**: Presentazione pulita in stile accademico adatta per apprendimento enterprise
- **Esperienza di Apprendimento**: Approccio strutturato con obiettivi e risultati chiari per ogni lezione
- **Organizzazione Contenuti**: Migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Rilascio Iniziale - Repository AZD di Apprendimento Completo

#### Aggiunto
- **Struttura Documentazione Principale**
  - Serie completa di guide introduttive
  - Documentazione completa su deployment e provisioning
  - Risorse dettagliate per troubleshooting e debugging
  - Strumenti e procedure di validazione pre-deployment

- **Modulo Introduzione**
  - Fondamenti AZD: Concetti chiave e terminologia
  - Guida Installazione: Istruzioni di setup specifiche per piattaforma
  - Guida Configurazione: Setup ambiente e autenticazione
  - Tutorial Primo Progetto: Apprendimento passo-passo hands-on

- **Modulo Deployment e Provisioning**
  - Guida Deployment: Documentazione completa del flusso di lavoro
  - Guida Provisioning: Infrastructure as Code con Bicep
  - Best practice per deployment in produzione
  - Modelli di architettura multi-servizio

- **Modulo Validazione Pre-deployment**
  - Pianificazione Capacità: Validazione disponibilità risorse Azure
  - Selezione SKU: Guida completa ai livelli di servizio
  - Controlli Pre-volo: Script di validazione automatizzati (PowerShell e Bash)
  - Strumenti per stima costi e pianificazione budget

- **Modulo Risoluzione Problemi**
  - Problemi Comuni: Problemi frequenti e soluzioni
  - Guida Debugging: Metodologie sistematiche di troubleshooting
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio e ottimizzazione delle prestazioni

- **Risorse e Riferimenti**
  - Cheat Sheet Comandi: Riferimento rapido ai comandi essenziali
  - Glossario: Terminologia completa e definizioni acronimi
  - FAQ: Risposte dettagliate alle domande frequenti
  - Link a risorse esterne e comunità

- **Esempi e Template**
  - Esempio applicazione web semplice
  - Template di deployment sito statico
  - Configurazione applicazione container
  - Modelli di integrazione database
  - Esempi architettura microservizi
  - Implementazioni funzione serverless

#### Caratteristiche
- **Supporto Multi-Piattaforma**: Guide di installazione e configurazione per Windows, macOS e Linux
- **Livelli di Competenza Multipli**: Contenuti progettati per studenti fino a sviluppatori professionisti
- **Focus Pratico**: Esempi hands-on e scenari reali
- **Copertura Completa**: Da concetti base a modelli avanzati enterprise
- **Approccio Sicurezza-First**: Best practice di sicurezza integrate in tutto il corso
- **Ottimizzazione Costi**: Guida per deployment economici e gestione risorse

#### Qualità Documentazione
- **Esempi di Codice Dettagliati**: Codice pratico e testato
- **Istruzioni Step-by-Step**: Guida chiara e azionabile
- **Gestione Completa degli Errori**: Troubleshooting per problemi comuni
- **Integrazione Best Practice**: Standard e raccomandazioni di settore
- **Compatibilità Versione**: Aggiornato con i più recenti servizi Azure e funzionalità azd

## Miglioramenti Futuri Pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione Piattaforma AI
- **Supporto Multi-Modello**: Modelli di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework Agente AI**: Template per deployment LangChain, Semantic Kernel e AutoGen
- **Modelli RAG Avanzati**: Opzioni di database vettoriale oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio migliorato per performance modelli, uso token e qualità risposte

#### Esperienza Sviluppatore
- **Estensione VS Code**: Esperienza di sviluppo integrata AZD + Microsoft Foundry
- **Integrazione GitHub Copilot**: Generazione template AZD assistita da AI
- **Tutorial Interattivi**: Esercizi pratici con validazione automatizzata per scenari AI
- **Contenuti Video**: Tutorial video supplementari per apprendisti visivi focalizzati su deployment AI

### Versione 4.0.0 (Pianificata)
#### Modelli Enterprise AI
- **Framework Governance**: Governance, conformità e audit trail per modelli AI
- **AI Multi-Tenant**: Modelli per servire più clienti con servizi AI isolati
- **Deployment AI Edge**: Integrazione con Azure IoT Edge e container instances
- **AI Cloud Ibrido**: Modelli di deployment multi-cloud e ibrido per carichi AI

#### Funzionalità Avanzate
- **Automazione Pipeline AI**: Integrazione MLOps con pipeline Azure Machine Learning
- **Sicurezza Avanzata**: Modelli zero-trust, endpoint privati e protezione minacce avanzata
- **Ottimizzazione Performance**: Strategie avanzate di tuning e scalabilità per applicazioni AI con alto throughput
- **Distribuzione Globale**: Modelli di content delivery e caching edge per applicazioni AI

### Versione 3.0.0 (Pianificata) - Sostituita dalla Versione Corrente
#### Aggiunte Proposte - Ora Implementate in v3.0.0
- ✅ **Contenuti AI-centrati**: Integrazione Microsoft Foundry completa (Completato)
- ✅ **Tutorial Interattivi**: Laboratorio workshop AI hands-on (Completato)
- ✅ **Modulo Sicurezza Avanzato**: Modelli di sicurezza specifici per AI (Completato)
- ✅ **Ottimizzazione Performance**: Strategie di tuning carichi AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente Implementata in v3.0.0
#### Migliorie Minori - Alcune Completate nella Versione Corrente
- ✅ **Esempi Aggiuntivi**: Scenari di deployment AI (Completato)
- ✅ **FAQ Estese**: Domande specifiche AI e troubleshooting (Completato)
- **Integrazione Strumenti**: Guide potenziate per IDE e editor
- ✅ **Espansione Monitoraggio**: Modelli di monitoraggio e alerting AI-specifici (Completato)

#### Ancora Pianificato per Versioni Future
- **Documentazione Mobile-Friendly**: Design responsive per apprendimento mobile
- **Accesso Offline**: Pacchetti documentazione scaricabili
- **Integrazione IDE Potenziata**: Estensione VS Code per AZD + workflow AI
- **Dashboard Comunità**: Metriche comunità in tempo reale e monitoraggio contributi

## Contributi al Changelog

### Segnalazione Cambiamenti
Quando si contribuisce a questo repository, assicurarsi che le voci nel changelog includano:

1. **Numero Versione**: Seguendo il versionamento semantico (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento nel formato YYYY-MM-DD
3. **Categoria**: Aggiunto, Modificato, Depricato, Rimosso, Corretto, Sicurezza
4. **Descrizione Chiara**: Descrizione concisa di cosa è stato modificato
5. **Valutazione Impatto**: Come le modifiche influenzano gli utenti esistenti

### Categorie di Cambiamento

#### Aggiunto
- Nuove funzionalità, sezioni di documentazione o capacità
- Nuovi esempi, template o risorse di apprendimento
- Strumenti, script o utility aggiuntivi

#### Modificato
- Modifiche a funzionalità o documentazione esistenti
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Depricato
- Funzionalità o approcci in fase di eliminazione
- Sezioni di documentazione programmate per rimozione
- Metodi che hanno alternative migliori

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci depricati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori in documentazione o codice
- Risoluzione di problemi o bug segnalati
- Miglioramenti di accuratezza o funzionalità


#### Sicurezza
- Miglioramenti o correzioni relativi alla sicurezza
- Aggiornamenti alle migliori pratiche di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee guida di versioning semantico

#### Versione Maggiore (X.0.0)
- Cambiamenti incompatibili che richiedono azione da parte dell'utente
- Ristrutturazione significativa di contenuti o organizzazione
- Modifiche che alterano l'approccio o la metodologia di fondo

#### Versione Minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti che mantengono la compatibilità retroattiva
- Esempi, strumenti o risorse aggiuntive

#### Versione Patch (X.Y.Z)
- Correzioni di bug e rettifiche
- Miglioramenti minori al contenuto esistente
- Chiarimenti e piccoli miglioramenti

## Feedback e suggerimenti della community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come fornire feedback
- **GitHub Issues**: Segnalare problemi o suggerire miglioramenti (problemi specifici AI benvenuti)
- **Discord Discussions**: Condividere idee e interagire con la community Microsoft Foundry
- **Pull Requests**: Contribuire con miglioramenti diretti ai contenuti, specialmente modelli e guide AI
- **Microsoft Foundry Discord**: Partecipare al canale #Azure per discussioni su AZD + AI
- **Community Forums**: Partecipare a discussioni più ampie per sviluppatori Azure

### Categorie di feedback
- **Precisione contenuti AI**: Correzioni sulle informazioni di integrazione e distribuzione dei servizi AI
- **Esperienza di apprendimento**: Suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Contenuti AI mancanti**: Richieste per ulteriori modelli, schemi o esempi AI
- **Accessibilità**: Miglioramenti per esigenze di apprendimento diverse
- **Integrazione strumenti AI**: Suggerimenti per migliorare l'integrazione del flusso di lavoro AI
- **Schemi AI di produzione**: Richieste di modelli di deployment AI enterprise

### Impegno di risposta
- **Risposta ai problemi**: Entro 48 ore per problemi segnalati
- **Richieste di funzionalità**: Valutazione entro una settimana
- **Contributi della community**: Revisione entro una settimana
- **Problemi di sicurezza**: Priorità immediata con risposta accelerata

## Programma di manutenzione

### Aggiornamenti regolari
- **Revisioni mensili**: Accuratezza dei contenuti e verifica dei link
- **Aggiornamenti trimestrali**: Grandi aggiunte e miglioramenti dei contenuti
- **Revisioni semestrali**: Ristrutturazione e miglioramento approfondito
- **Rilasci annuali**: Aggiornamenti di versione maggiore con miglioramenti significativi

### Monitoraggio e controllo qualità
- **Test automatici**: Validazione regolare di esempi di codice e link
- **Integrazione feedback comunitario**: Incorporazione regolare dei suggerimenti degli utenti
- **Aggiornamenti tecnologici**: Allineamento con i servizi Azure più recenti e rilasci azd
- **Audit di accessibilità**: Revisione periodica per principi di design inclusivo

## Politica di supporto versione

### Supporto versione attuale
- **Ultima versione maggiore**: Supporto completo con aggiornamenti regolari
- **Versione maggiore precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni legacy**: Supporto comunitario solo, nessun aggiornamento ufficiale

### Guida alla migrazione
Quando vengono rilasciate versioni maggiori, forniamo:
- **Guide di migrazione**: Istruzioni passo a passo per la transizione
- **Note di compatibilità**: Dettagli sui cambiamenti incompatibili
- **Supporto strumenti**: Script o utility per assistere nella migrazione
- **Supporto della community**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione precedente**: [Study Guide](resources/study-guide.md)
- **Lezione successiva**: Torna a [Main README](README.md)

**Rimani aggiornato**: Segui questo repository per ricevere notifiche su nuovi rilasci e aggiornamenti importanti ai materiali didattici.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
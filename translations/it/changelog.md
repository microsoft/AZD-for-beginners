# Registro delle modifiche - AZD Per Principianti

## Introduzione

Questo registro delle modifiche documenta tutte le modifiche, aggiornamenti e miglioramenti importanti al repository AZD Per Principianti. Seguiamo i principi della versionatura semantica e manteniamo questo registro per aiutare gli utenti a comprendere cosa è cambiato tra le versioni.

## Obiettivi di apprendimento

Esaminando questo registro delle modifiche, sarai in grado di:
- Rimanere informato sulle nuove funzionalità e aggiunte di contenuti
- Comprendere i miglioramenti apportati alla documentazione esistente
- Tenere traccia delle correzioni di bug e rettifiche per garantire l'accuratezza
- Seguire l'evoluzione dei materiali didattici nel tempo

## Risultati di apprendimento

Dopo aver esaminato le voci del registro delle modifiche, sarai in grado di:
- Identificare nuovi contenuti e risorse disponibili per l'apprendimento
- Comprendere quali sezioni sono state aggiornate o migliorate
- Pianificare il tuo percorso di apprendimento basato sui materiali più attuali
- Contribuire con feedback e suggerimenti per miglioramenti futuri

## Cronologia delle versioni

### [v3.25.0] - 2026-11-09

#### L’estensione Microsoft Foundry 1.0 è ora generalmente disponibile

Il pacchetto `microsoft.foundry` 1.0 è **attivo e generalmente disponibile**, come annunciato il [5 novembre 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Il corso ora insegna il flusso di lavoro GA rilasciato, non una prossima versione. Inizia con AZD **1.37.0 o successivo** e `azd ext install microsoft.foundry`.

#### Disponibile in questo aggiornamento del corso
- La guida in inglese utilizza il pacchetto GA come percorso di installazione predefinito e spiega le sue sette estensioni core versionate indipendentemente.
- Una [guida con agente ospitato](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) copre l’API delle risposte del framework dell’agente Python a monte, la versione uv attuale, Python 3.13+, la selezione di progetti nuovi/esistenti, il riutilizzo di modelli e la revisione di `azure.yaml`.
- Il flusso di lavoro da locale a cloud copre i test con Agent Inspector, i costi delle chiamate modello supportate da Azure, build di codice remote, invocazioni dispiegate, tracciamento cloud, anteprima del dispiegamento, log e diagnostica.
- Una guida di valutazione separata copre la generazione e revisione di dataset/griglie di valutazione, la configurazione di una valutazione nominata, la registrazione delle risorse e l’ispezione dei risultati. Le istruzioni di valutazione/ottimizzazione più vecchie rimangono come storico di migrazione, non baseline della versione corrente.
- La guida Foundry CI/CD include l’installazione dell’estensione runner, il dispiegamento autenticato, accesso/risorse di valutazione e un gate di qualità esplicito.
- La guida per la pulizia distingue tra progetti Foundry appena creati e riutilizzati. Il workshop si collega all’esercizio GA separato senza sostituire i test specifici del campione.
- Navigazione del corso, obiettivi di apprendimento, prerequisiti di configurazione, cheat sheet, FAQ e guida di studio riflettono il flusso di lavoro GA. Le traduzioni generate non sono modificate manualmente.

#### Ambito della revisione
- Basato sull’annuncio GA, la guida Microsoft Learn collegata e la configurazione del campione a monte. Non è stata effettuata alcuna fornitura, dispiegamento, invocazione modello o valutazione live su Azure.
- Il GA del pacchetto non implica GA per ogni funzione opzionale, estensione indipendente o SDK, né certifica gli esempi per la produzione.

### [v3.24.0]- 2026-11-04

#### Corretto
- Naviagation del corso in inglese riparata, percorsi delle pagine spostate, ancore mancanti e riferimenti esterni obsoleti, incluso il collegamento al Capitolo 2 verso la guida AI per la produzione.
- Guida attuale revisionata rispetto ad AZD 1.37.2 pubblicato, agenti 1.0.0-beta.23 e valutazioni 1.0.0-beta.2. Documentato il flusso di lavoro separato `azd ai eval` e la migrazione della configurazione di ottimizzazione.
- Corrette flag CLI non supportate, confini di autenticazione, guida in testo semplice per ambiente/secret, aggiornamenti infrastrutturali, configurazione modello ed esempi di recupero distruttivo.
- Workshop aggiornato rispetto al campione attuale AI Agents, inclusi hook effettivi, input di configurazione, test di valutazione, punti di ingresso red-teaming e osservabilità.
- Corrette affermazioni di implementazione di esempio e riparati problemi associati di applicazione/infrastruttura/configurazione. Il materiale sull’architettura retail è esplicitamente distinto da un’applicazione completa funzionante.
- Ripristinata la matrice linguistica CodeQL, selezionata Node.js 24 supportata per il contenitore di sviluppo e resi i validatori di setup in grado di segnalare comandi versione falliti.

#### Aggiunto
- Controllo offline di link/ancora solo in inglese, test di regressione e flusso di lavoro documentazione che costruisce anche il workshop in modalità rigorosa. Traduzioni generate e immagini tradotte escluse.

#### Ambito della validazione
- Controlli di sorgente, sintassi, configurazione, comportamento locale e collegamento di rete non stabiliscono la distribuzione live su Azure, quote, RBAC, disponibilità regionale dei modelli, fatturazione, conformità alla sicurezza o la prontezza per la produzione.
- Voci più vecchie sotto sono registri storici, non istruzioni correnti per comandi o rilascio.

### [v3.23.0] - 2026-07-13

#### Aggiornamento AZD 1.27.1: Aggiornamento di versione
**Questa versione riconvalida il corso rispetto a `azd` `1.27.1` (luglio 2026, ultimo rilascio stabile) e l’attuale estensione in anteprima agente AI `azure.ai.agents` `1.0.0-beta.5`, aggiornando ogni banner "validato contro" dopo i rilasci 1.26.0, 1.27.0 e 1.27.1.**

#### Modificato
- **✅ Baseline di validazione aggiornata** da `azd 1.25.6` (giugno 2026) a `azd 1.27.1` (luglio 2026) nel README principale, in tutti i README dei capitoli, nella lezione del contenitore di sviluppo del Capitolo 1 (inclusi esempi a versione bloccata), nella lezione dei modelli personalizzati del Capitolo 4, nella lezione multi-agente del Capitolo 5 e nella documentazione del workshop
- **🤖 Baseline del Capitolo 2 aggiornata** da `azd 1.23.12` (marzo 2026) a `azd 1.27.1` in `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` e `microsoft-foundry-integration.md`; date della nota di validazione aggiornate al 2026-07-13
- **🧩 Estensione agente AI aggiornata** da `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` al rilascio attuale `1.0.0-beta.5` nel README del Capitolo 2 e `agents.md`
- **🧪 Esempio di validazione workshop** (`azd version` output) aggiornato a `1.27.1`

#### Note sui rilasci azd rilevanti (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Supporto Go per Azure Functions su Flex Consumption, filtri per abbonamento per tenant `azd config sub-filter`, pacchetti di estensione autonomi (`azd x pack --bundle`) e `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellazione di progetti/agenti Azure AI Foundry direttamente in `azure.yaml` (init senza Bicep/Terraform), supporto a container per il dispiegamento di App Service (`host: appservice` + `language: docker`), `-s/--source` diretto per comandi `azd extension` e `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag `--no-dependencies` per `azd extension install`, modelli deprecati esclusi dalle richieste di catalogo/quote di default e diverse correzioni di bug

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

#### Colmare le lacune del principiante #2: creazione template, contenitori di sviluppo, Pulumi, Azure DevOps, Service Principals e altro
**Questa versione colma le lacune intermedie rimanenti rilevate dall’analisi azd-coverage: come creare e pubblicare il proprio template, ambienti riproducibili di contenitori di sviluppo/Codespaces, il provider di infrastruttura Pulumi, una guida CI/CD Azure DevOps, autenticazione con service principal, guida alla selezione host (AKS/Spring Apps), spiegazioni `azd restore`/`azd package`, gestione errori hook e pratiche per team/ambienti condivisi.**

#### Aggiunto
- **🧱 Nuova lezione Capitolo 4** `docs/chapter-04-infrastructure/custom-templates.md` — creazione del proprio template azd: struttura richiesta (`azure.yaml`, `infra/`, `src/`), il campo `metadata.template`, parametrizzazione infrastrutturale con token risorsa `uniqueString()` e tag `azd-env-name`, test locale con `azd init --template <local-path>`, pubblicazione su GitHub e invio alla galleria Awesome AZD
- **📦 Nuova lezione Capitolo 1** `docs/chapter-01-foundation/dev-containers.md` — ambienti azd riproducibili con Dev Containers e GitHub Codespaces: un minimo `.devcontainer/devcontainer.json` che utilizza la funzionalità ufficiale `ghcr.io/azure/azure-dev/azd`, funzionalità specifiche del linguaggio, `docker-in-docker` per host container e `azd auth login --use-device-code` per accesso remoto
- **🧩 Pulumi con azd** sezione in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, struttura cartella Pulumi, stack mappati agli ambienti azd, output/tagging richiesti e identico flusso di lavoro `azd up` / `azd down`
- **🎯 Guida alla selezione host** in `docs/chapter-04-infrastructure/provisioning.md` — confronto amichevole per principianti tra `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, e `springapp`, con consigli su quando scegliere AKS o Azure Spring Apps
- **🛠️ Guida Azure DevOps CI/CD** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, connessione di servizio con federazione identità workload (OIDC), `azure-dev.yml` generato e configurazione gruppo variabili
- **🔑 Service Principals (Pattern 4)** aggiunti in `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non interattivi con client secret vs credenziali federate/OIDC, quando usare e memorizzazione sicura delle credenziali
- **🪝 Gestione errori hook** sottosezione in `docs/chapter-04-infrastructure/deployment-guide.md` — codici di uscita e `set -e`, `continueOnError`, test hook in isolamento con `azd hooks run`, shell specifiche OS e `--debug`
- **👥 Team / ambienti condivisi** sezione in `docs/chapter-03-configuration/configuration.md` — cosa vive in `.azure/`, cosa ignorare in Git, ambienti per sviluppatore, `azd env list`/`select` e fornitura di valori ambiente in CI/CD
- **🧰 Spiegazioni di `azd restore` e avanzate di `azd package`** in `resources/cheat-sheet.md` — ripristino dipendenze e costruzione artefatto distribuibile senza distribuire

#### Modificato
- **🧭 Tabella lezioni Capitolo 4** aggiornata per includere la nuova lezione "Creazione del proprio template" (Lezione 3)
- **🧭 Tabella lezioni Capitolo 1** aggiornata per includere la nuova lezione "Dev Containers & Codespaces" (Lezione 5); piè di pagina di navigazione collegati tra `bring-your-own-app.md` e `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Colmare le lacune del principiante: lezione pratica multi-agente, "Porta la tua app," Terraform e guida CI/CD
**Questa versione colma le lacune maggiori per una guida completa per principianti aggiungendo due nuove lezioni pratiche (un walkthrough multi-agente distribuibile e aggiungere azd a un’app esistente), un’introduzione amichevole agli hook, una sezione Terraform con azd, una guida passo passo alla pipeline GitHub Actions, una spiegazione delle nuove estensioni in anteprima e una checklist esplicita di verifica del dispiegamento.**

#### Aggiunto
- **🤝 Nuova lezione Capitolo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — walkthrough completamente pratico e distribuibile a due agenti (orchestratore + specialisti) usando un template reale (`contoso-creative-writer`), coprendo quando usare multi-agente, il flusso di lavoro `azd up`, comprensione delle risorse distribuite, tracciamento cross-agente, personalizzazione e pulizia
- **📦 Nuova lezione Capitolo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — come aggiungere azd a un progetto esistente con `azd init` ("usa codice nella directory corrente"), comprensione di `azure.yaml` e `infra/`, `azd infra generate`, rilevamento host e distribuzione con `azd up`
- **🌐 Terraform con azd** sezione aggiunta in `docs/chapter-04-infrastructure/provisioning.md` — configurazione `infra.provider: terraform`, struttura cartella `.tf`, output richiesti `AZURE_*` e tagging `azd-env-name`, e identico flusso di lavoro `azd up` / `azd down` (chiude la lacuna dove si affermava il supporto Terraform ma era mostrato solo Bicep)
- **⚙️ Guida passo-passo a GitHub Actions** in `docs/chapter-08-production/production-ai-practices.md` — dal repository GitHub ai deploy automatizzati: `azd pipeline config`, credenziali federate OIDC (nessun segreto memorizzato), il `azure-dev.yml` generato e indicazioni su segreti vs variabili
- **🪝 Introduzione per principianti "Nuovo agli hook?"** in `docs/chapter-04-infrastructure/deployment-guide.md` — cosa è un hook, una tabella delle fasi degli hook, un primo hook minimale e l'esecuzione manuale degli hook con `azd hooks run`
- **✅ Checklist "Verifica il tuo deployment"** aggiunta al Passo 5 di `docs/chapter-01-foundation/first-project.md` — test rapido, controllo endpoint di salute e criteri espliciti di successo
- **🧩 Spiegazione per le nuove estensioni preview** `azure.ai.skills` e `azure.ai.connections` (cosa sono e quando usarle) in `docs/chapter-08-production/production-ai-practices.md`

#### Cambiamenti
- **🧭 Tabella delle lezioni del Capitolo 5** corretta: `multi-agent-basics.md` è ora la Lezione 1 (l'unica lezione completamente pratica), con etichettatura onesta che la Lezione 2 si trova nel Capitolo 6 e lo scenario Retail è un blueprint architetturale, non un template a comando unico
- **🧭 Tabella delle lezioni del Capitolo 1** ora include la nuova lezione "Bring Your Own App" (Lezione 4)
- **🔗 Piè di pagina di navigazione** aggiornati: `first-project.md` ora punta in avanti a `bring-your-own-app.md`

#### Correzioni
- **🧱 Chiuso il gap Terraform "richiesto ma mancante"** — il corso faceva precedentemente riferimento al supporto Terraform senza mostrarlo
- **🔀 Corrette cross-links fuorvianti del Capitolo 5** che lasciavano intendere che esistesse un'implementazione multi-agent completa quando invece solo un blueprint architetturale esisteva

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

#### Refresh AZD 1.25.6, Comandi Completi per il Ciclo di Vita degli Agent & Rebrand Aspire
**Questa versione rivalida il corso contro `azd` `1.25.6` (giugno 2026) e l'estensione `azure.ai.agents` `0.1.40-preview`, amplia le indicazioni AI da "scaffoldare un agente" all'intero ciclo di vita dell'agente (test → valuta → ottimizza → ispeziona → elimina), promuove le nuove estensioni preview `azure.ai.skills` e `azure.ai.connections` e segnala il rebrand del prodotto ".NET Aspire" → "Aspire".**

#### Aggiunte
- **🔁 Copertura completa del ciclo di vita dell'agente** per principianti e ingegneri AI in tutta la documentazione:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabella del ciclo di vita (scaffold → test → misura → migliora → ispeziona → pulizia) aggiunta alla sezione Estensioni e Comandi AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nuova sezione "Gestione del ciclo di vita dell'agente" che copre `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
  - `resources/cheat-sheet.md` — Comandi AI Agent ampliati con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` e `delete --force`
- **🧩 Nuove estensioni preview** documentate: `azure.ai.skills` (abilità riutilizzabili dell'agente) e `azure.ai.connections` (connessioni Foundry) aggiunte alla tabella delle estensioni e alla cheat sheet
- **⏱️ Indicazioni sulla tempistica di risposta** — gli esempi `azd ai agent invoke` ora indicano che stampa la latenza totale e il tempo al primo byte
- **📌 Banner di versione** nel README principale che indirizza gli studenti a `azd version` e `azd upgrade`

#### Cambiamenti
- **✅ Baseline di validazione aggiornata** da `azd 1.23.12` (marzo 2026) a `azd 1.25.6` (giugno 2026) in tutti i README dei capitoli e nella documentazione del workshop
- **🤖 Nota di estensione Capitolo 2** aggiornata da `azure.ai.agents` `0.1.18-preview` a `0.1.40-preview`
- **🧪 Esempio di validazione workshop** (output `azd version`) aggiornato a `1.25.6`
- **🧭 README "Novità in azd Oggi"** aggiornato per evidenziare l'intero ciclo di vita degli agenti, le nuove estensioni AI e miglioramenti recenti della qualità della vita (`azd init` idempotenza, `azd auth login` pulizia token obsoleti, `azd tool` prompt al primo avvio)
- **📖 agents.md Capitolo 2 (Opzione 4)** ora indirizza gli studenti ai comandi di ciclo di vita post-deploy anziché fermarsi a `azd up`

#### Correzioni
- **🏷️ Naming del prodotto** — aggiunta nota del rebrand Aspire (".NET Aspire" ora è semplicemente "Aspire"); il supporto Aspire in azd rimane invariato
- **🔎 Validazione rilascio live** confermata contro il feed di rilascio di Azure Developer CLI: CLI stabile `1.25.6` (2026-06-12) e `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Chiarimenti onboarding per principianti, validazione setup & pulizia finale comandi AZD
**Questa versione segue la sweep di validazione AZD 1.23 con una passata documentale focalizzata sui principianti: chiarisce le indicazioni di autenticazione AZD-prima, aggiunge script di validazione setup locale, verifica i comandi chiave contro il CLI AZD live e rimuove le ultime vecchie referenze di comandi in inglese fuori dal changelog.**

#### Aggiunte
- **🧪 Script di validazione setup per principianti** con `validate-setup.ps1` e `validate-setup.sh` permettendo agli studenti di confermare gli strumenti richiesti prima di iniziare il Capitolo 1
- **✅ Passaggi di validazione setup anticipata** nel README principale e README del Capitolo 1 per intercettare prerequisiti mancanti prima di `azd up`

#### Cambiamenti
- **🔐 Indicazioni di autenticazione per principianti** che ora trattano sempre `azd auth login` come percorso primario per i workflow AZD, con `az login` citato come opzionale a meno che non si usino direttamente comandi Azure CLI
- **📚 Flusso onboarding Capitolo 1** ora indirizza gli studenti a validare il setup locale prima di installazione, autenticazione e primi passi di deployment
- **🛠️ Messaggistica Validator** ora separa chiaramente i requisiti bloccanti dagli avvisi opzionali di Azure CLI per il percorso principianti solo AZD
- **📖 Documenti di configurazione, risoluzione problemi ed esempi** ora distinguono tra autenticazione AZD obbligatoria e accesso Azure CLI opzionale dove prima era presentato senza contesto

#### Correzioni
- **📋 Rimanenti referenze a comandi in inglese** aggiornate alle forme AZD attuali, includendo `azd config show` nella cheat sheet e `azd monitor --overview` dove era prevista la guida panoramica del portale Azure
- **🧭 Dichiarazioni per principianti nel Capitolo 1** mitigate per evitare promesse eccessive di comportamento zero-error o rollback garantito su tutti i template e risorse Azure
- **🔎 Validazione CLI live** confermata per supporto attuale di `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` e `azd down --force --purge`

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

#### Validazione AZD 1.23.12, Espansione ambienti workshop & Refresh modelli AI
**Questa versione esegue una sweep di validazione documentazione contro `azd` `1.23.12`, aggiorna esempi di comando AZD obsoleti, rinnova le indicazioni sui modelli AI ai valori predefiniti attuali e amplia le istruzioni workshop oltre GitHub Codespaces per includere dev container e cloni locali.**

#### Aggiunte
- **✅ Note di validazione in tutti i capitoli core e nella doc del workshop** per esplicitare la baseline AZD testata per studenti che usano build CLI più nuove o vecchie
- **⏱️ Indicazioni timeout deployment** per deployment di app AI di lunga durata usando `azd deploy --timeout 1800`
- **🔎 Passaggi di ispezione estensione** con `azd extension show azure.ai.agents` nella documentazione del workflow AI
- **🌐 Indicazioni ambienti workshop più ampie** che coprono GitHub Codespaces, dev container e cloni locali con MkDocs

#### Cambiamenti
- **📚 README introduttivi capitolo** ora notano coerentemente la validazione contro `azd 1.23.12` nelle sezioni fondamenta, configurazione, infrastruttura, multi-agent, pre-deploy, troubleshooting e produzione
- **🛠️ Riferimenti ai comandi AZD** aggiornati alle forme attuali nelle doc:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` a seconda del contesto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` laddove era prevista una panoramica di Application Insights
- **🧪 Esempi di provisioning preview** semplificati a usi supportati attuali come `azd provision --preview` e `azd provision --preview -e production`
- **🧭 Flusso workshop** aggiornato per consentire agli studenti di completare i lab in Codespaces, dev container o cloni locali invece di assumere esecuzione solo in Codespaces
- **🔐 Indicazioni di autenticazione** ora prediligono `azd auth login` per i workflow AZD, con `az login` considerato opzionale quando si usano direttamente comandi Azure CLI

#### Correzioni
- **🪟 Comandi di installazione Windows** normalizzati al casing del pacchetto `winget` nelle guide di installazione
- **🐧 Indicazioni di installazione Linux** corrette per evitare istruzioni di package manager distro-specifiche non supportate `azd` e indicare invece i release assets quando appropriato
- **📦 Esempi modelli AI** aggiornati da valori vecchi come `gpt-35-turbo` e `text-embedding-ada-002` a esempi attuali come `gpt-4.1-mini`, `gpt-4.1` e `text-embedding-3-large`
- **📋 Snippet di deploy e diagnostica** corretti per usare comandi di ambiente e stato attuali in log, script e passaggi di troubleshooting
- **⚙️ Indicazioni GitHub Actions** aggiornate da `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Indicazioni consenso MCP/Copilot** aggiornate da `azd mcp consent` a `azd copilot consent list`

#### Miglioramenti
- **🧠 Indicazioni capitolo AI** ora spiegano meglio il comportamento preview-sensitive di `azd ai`, login tenant-specific, uso attuale delle estensioni e raccomandazioni aggiornate sul deploy modello
- **🧪 Istruzioni workshop** ora usano versioni più realistiche e linguaggio di setup ambiente più chiaro per i lab pratici
- **📈 Documenti di produzione e troubleshooting** ora più allineati con esempi attuali di monitoraggio, fallback model e cost-tier

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

#### Comandi AZD AI CLI, Validazione contenuto & Espansione template
**Questa versione aggiunge la copertura dei comandi `azd ai`, `azd extension` e `azd mcp` in tutti i capitoli relativi all'IA, corregge link interrotti e codice deprecato in agents.md, aggiorna la cheat sheet e ristruttura la sezione Template di esempio con descrizioni validate e nuovi template Azure AI AZD.**

#### Aggiunto
- **🤖 Copertura AZD AI CLI** in 7 file (precedentemente solo nel Capitolo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nuova sezione "Estensioni e comandi AI" che introduce `azd extension`, `azd ai agent init` e `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opzione 4: `azd ai agent init` con tabella comparativa (approccio template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sottosezioni "Estensioni AZD per Foundry" e "Distribuzione agent-first"
  - `docs/chapter-05-multi-agent/README.md` — Avvio rapido ora mostra entrambi i percorsi di distribuzione basati su template e manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sezione Deploy ora include l'opzione `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sottosezione "Comandi estensioni AZD AI per diagnostica"
  - `resources/cheat-sheet.md` — Nuova sezione "Comandi AI & Estensioni" con `azd extension`, `azd ai agent init`, `azd mcp` e `azd infra generate`
- **📦 Nuovi template di esempio AZD AI** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET con Blazor WebAssembly, Semantic Kernel e supporto chat vocale
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J con opzioni di distribuzione ACA/AKS
  - **contoso-creative-writer** — App di scrittura creativa multi-agente usando Azure AI Agent Service, Bing Grounding e Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con supporto sviluppo locale Ollama
  - **chat-with-your-data-solution-accelerator** — Acceleratore enterprise RAG con portale admin, integrazione Teams e opzioni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — App di riferimento per orchestrazione multi-agente MCP con server in .NET, Python, Java e TypeScript
  - **azd-ai-starter** — Template di avvio Bicep per infrastruttura Azure AI minimalista
  - **🔗 Link alla Splendida Galleria AZD AI** — Riferimento alla [galleria di azd AI fantastica](https://azure.github.io/awesome-azd/?tags=ai) (oltre 80 template)

#### Corretto
- **🔗 Navigazione agents.md**: link Precedente/Successivo ora corrispondono all'ordine delle lezioni nel README Capitolo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Link interrotti in agents.md**: `production-ai-practices.md` corretto in `../chapter-08-production/production-ai-practices.md` (3 occorrenze)
- **📦 Codice deprecato in agents.md**: Sostituito `opencensus` con `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API non valida in agents.md**: `max_tokens` spostato da `create_agent()` a `create_run()` come `max_completion_tokens`
- **🔢 Conteggio token in agents.md**: Sostituita stima approssimativa `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Servizi corretti da "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predefinito cambiato ad ottobre 2024)
- **contoso-chat**: Aggiornata descrizione per fare riferimento a Azure AI Foundry + Prompty, coerente con il titolo reale del repo e stack tecnologico

#### Rimosso
- **ai-document-processing**: Rimosso riferimento a template non funzionante (repo non pubblicamente accessibile come template AZD)

#### Migliorato
- **📝 Esercizi agents.md**: Esercizio 1 ora mostra output atteso e passo `azd monitor`; Esercizio 2 include codice di registrazione completo `FunctionTool`; Esercizio 3 sostituisce indicazioni vaghe con comandi concreti `prepdocs.py`
- **📚 Risorse agents.md**: Aggiornati link di documentazione verso le attuali docs Azure AI Agent Service e quickstart
- **📋 Tabella Passi Successivi agents.md**: Aggiunto link al Laboratorio Workshop AI per copertura completa del capitolo

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

#### Miglioramento Navigazione Corso
**Questa versione migliora la navigazione tra i capitoli del README.md con un formato tabella migliorato.**

#### Modificato
- **Tabella Mappa del Corso**: Migliorata con link diretti alle lezioni, stime di durata e valutazioni di complessità
- **Pulizia Cartelle**: Rimosse cartelle vecchie ridondanti (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validazione Link**: Verificati tutti i 21+ link interni nella tabella Mappa del Corso

### [v3.16.0] - 2026-02-05

#### Aggiornamenti Nomi Prodotti
**Questa versione aggiorna i riferimenti ai prodotti secondo il branding Microsoft attuale.**

#### Modificato
- **Microsoft Foundry → Microsoft Foundry**: Tutti i riferimenti aggiornati nei file non di traduzione
- **Azure AI Agent Service → Foundry Agents**: Nome del servizio aggiornato per riflettere il branding attuale

#### File Aggiornati
- `README.md` - Pagina principale del corso
- `changelog.md` - Cronologia delle versioni
- `course-outline.md` - Struttura del corso
- `docs/chapter-02-ai-development/agents.md` - Guida agenti AI
- `examples/README.md` - Documentazione esempi
- `workshop/README.md` - Pagina principale workshop
- `workshop/docs/index.md` - Indice workshop
- `workshop/docs/instructions/*.md` - Tutti i file di istruzioni workshop

---

### [v3.15.0] - 2026-02-05

#### Ristrutturazione Maggiore del Repository: Cartelle per Capitoli
**Questa versione ristruttura la documentazione in cartelle dedicate per ogni capitolo per una navigazione più chiara.**

#### Rinominati Cartelle
Le vecchie cartelle sono state sostituite da cartelle numerate per capitolo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Aggiunto nuovo: `docs/chapter-05-multi-agent/`

#### Migrazione File
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

#### Aggiunto
- **📚 File README capitoli**: Creato README.md in ogni cartella capitolo con:
  - Obiettivi di apprendimento e durata
  - Tabella lezioni con descrizioni
  - Comandi di avvio rapido
  - Navigazione ad altri capitoli

#### Modificato
- **🔗 Aggiornati tutti i link interni**: Oltre 78 percorsi aggiornati in tutti i file di documentazione
- **🗺️ README.md principale**: Aggiornata Mappa Corso con nuova struttura capitoli
- **📝 examples/README.md**: Aggiornati riferimenti incrociati alle cartelle capitolo

#### Rimosso
- Struttura vecchia cartelle (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Ristrutturazione Repository: Navigazione Capitoli
**Questa versione ha aggiunto file README per la navigazione tra capitoli (superata da v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nuova Guida agli Agenti AI
**Questa versione aggiunge una guida completa per distribuire agenti AI con Azure Developer CLI.**

#### Aggiunto
- **🤖 docs/microsoft-foundry/agents.md**: Guida completa che copre:
  - Cosa sono gli agenti AI e come differiscono dai chatbot
  - Tre template agenti per avvio rapido (Foundry Agents, Prompty, RAG)
  - Pattern architetturali agenti (agente singolo, RAG, multi-agente)
  - Configurazione e personalizzazione degli strumenti
  - Monitoraggio e tracciamento metriche
  - Considerazioni e ottimizzazione dei costi
  - Scenari comuni di troubleshooting
  - Tre esercizi pratici con criteri di successo

#### Struttura Contenuti
- **Introduzione**: Concetti agenti per principianti
- **Avvio Rapido**: Distribuzione agenti con `azd init --template get-started-with-ai-agents`
- **Pattern Architetturali**: Diagrammi visivi dei pattern agenti
- **Configurazione**: Setup strumenti e variabili ambiente
- **Monitoraggio**: Integrazione Application Insights
- **Esercizi**: Apprendimento pratico progressivo (20-45 minuti ciascuno)

---

### [v3.12.0] - 2026-02-05

#### Aggiornamento Ambiente DevContainer
**Questa versione aggiorna la configurazione del contenitore di sviluppo con strumenti moderni e impostazioni predefinite migliorate per l’esperienza di apprendimento AZD.**

#### Modificato
- **🐳 Immagine Base**: Aggiornata da `python:3.12-bullseye` a `python:3.12-bookworm` (ultima Debian stable)
- **📛 Nome Contenitore**: Rinominato da "Python 3" a "AZD for Beginners" per maggiore chiarezza

#### Aggiunto
- **🔧 Nuove funzionalità Dev Container**:
  - `azure-cli` con supporto Bicep abilitato
  - `node:20` (versione LTS per template AZD)
  - `github-cli` per gestione template
  - `docker-in-docker` per deployment container app

- **🔌 Port Forwarding**: Porte preconfigurate per sviluppo comune:
  - 8000 (anteprima MkDocs)
  - 3000 (app web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nuove estensioni VS Code**:
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

- **⚙️ Impostazioni VS Code**: Aggiunte impostazioni predefinite per interprete Python, formattazione al salvataggio e rimozione spazi bianchi

- **📦 Aggiornati requirements-dev.txt**:
  - Aggiunto plugin di minificazione MkDocs
  - Aggiunto pre-commit per qualità codice
  - Aggiunti pacchetti Azure SDK (azure-identity, azure-mgmt-resource)

#### Corretto
- **Comando Post-Creazione**: Ora verifica installazioni di AZD e Azure CLI all’avvio del contenitore

---

### [v3.11.0] - 2026-02-05

#### Ristrutturazione README per Principianti
**Questa versione migliora significativamente il README.md per renderlo più accessibile ai principianti e aggiunge risorse essenziali per sviluppatori AI.**

#### Aggiunto
- **🆚 Confronto Azure CLI vs AZD**: Spiegazione chiara su quando usare ciascuno strumento con esempi pratici
- **🌟 Splendidi link AZD**: Link diretti alla galleria template community e risorse per contribuire:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - oltre 200 template pronti per il deployment
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - contributo community
- **🎯 Guida Avvio Rapido**: Sezione semplificata in 3 passi per iniziare (Installa → Login → Distribuisci)
- **📊 Tabella Navigazione basata su esperienza**: Indicazioni chiare dove iniziare in base all’esperienza dello sviluppatore

#### Modificato
- **Struttura README**: Riorganizzata per rivelare progressivamente le informazioni chiave
- **Sezione Introduzione**: Riscritta per spiegare "La Magia di `azd up`" per principianti assoluti
- **Rimosso contenuto duplicato**: Eliminata sezione troubleshooting duplicata
- **Comandi per la risoluzione dei problemi**: Corretto il riferimento `azd logs` per usare un `azd monitor --logs` valido

#### Correzioni
- **🔐 Comandi di Autenticazione**: Aggiunti `azd auth login` e `azd auth logout` in cheat-sheet.md
- **Riferimenti a comandi non validi**: Rimossi restanti `azd logs` dalla sezione troubleshooting del README

#### Note
- **Ambito**: Modifiche applicate al README.md principale e a resources/cheat-sheet.md
- **Pubblico di riferimento**: Miglioramenti rivolti specificamente agli sviluppatori nuovi di AZD

---

### [v3.10.0] - 2026-02-05

#### Aggiornamento sulla correttezza dei comandi Azure Developer CLI
**Questa versione corregge comandi AZD inesistenti in tutta la documentazione, assicurando che tutti gli esempi di codice utilizzino una sintassi valida di Azure Developer CLI.**

#### Correzioni
- **🔧 Rimozione comandi AZD inesistenti**: Audit completo e correzione di comandi non validi:
  - `azd logs` (non esiste) → sostituito con `azd monitor --logs` o alternative Azure CLI
  - `azd service` sottocomandi (non esistono) → sostituiti con `azd show` e Azure CLI
  - `azd infra import/export/validate` (non esistono) → rimossi o sostituiti con alternative valide
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag (non esistono) → rimossi
  - `azd provision --what-if/--rollback` flag (non esistono) → aggiornati per usare `--preview`
  - `azd config validate` (non esiste) → sostituito con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (non esistono) → rimossi

- **📚 File aggiornati con correzioni ai comandi**:
  - `resources/cheat-sheet.md`: Revisione completa del riferimento ai comandi
  - `docs/deployment/deployment-guide.md`: Corrette le strategie di rollback e deployment
  - `docs/troubleshooting/debugging.md`: Corrette sezioni di analisi log
  - `docs/troubleshooting/common-issues.md`: Aggiornati comandi per la risoluzione dei problemi
  - `docs/troubleshooting/ai-troubleshooting.md`: Corretto sezione di debug AZD
  - `docs/getting-started/azd-basics.md`: Corrette i comandi di monitoraggio
  - `docs/getting-started/first-project.md`: Aggiornati esempi di monitoraggio e debug
  - `docs/getting-started/installation.md`: Corrette esempi di help e version
  - `docs/pre-deployment/application-insights.md`: Corrette query per visualizzazione log
  - `docs/pre-deployment/coordination-patterns.md`: Corrette query di debug agent

- **📝 Aggiornamento riferimento versione**: 
  - `docs/getting-started/installation.md`: Versione `1.5.0` hardcoded sostituita con generica `1.x.x` con link alle release

#### Modifiche
- **Strategie di rollback**: Documentazione aggiornata per usare rollback basato su Git (AZD non ha rollback nativo)
- **Visualizzazione log**: Riferimenti `azd logs` sostituiti con `azd monitor --logs`, `azd monitor --live` e comandi Azure CLI
- **Sezione delle prestazioni**: Rimosse flag inesistenti per deployment parallelo/incrementale, fornendo alternative valide

#### Dettagli tecnici
- **Comandi AZD validi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag validi azd monitor**: `--live`, `--logs`, `--overview`
- **Funzionalità rimosse**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verifica**: Comandi validati contro Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Completamento workshop e aggiornamento qualità documentazione
**Questa versione completa i moduli del workshop interattivo, corregge tutti i link rotti nella documentazione e migliora la qualità complessiva per sviluppatori AI che usano Microsoft AZD.**

#### Aggiunte
- **📝 CONTRIBUTING.md**: Nuovo documento linee guida per contributi con:
  - Istruzioni chiare per segnalare problemi e proporre modifiche
  - Standard di documentazione per nuovi contenuti
  - Linee guida per esempi di codice e convenzioni messaggi di commit
  - Informazioni per l'engagement della community

#### Completati
- **🎯 Modulo workshop 7 (Conclusione)**: Modulo conclusivo completato con:
  - Riassunto completo dei risultati del workshop
  - Sezione concetti chiave su AZD, template e Microsoft Foundry
  - Raccomandazioni per la continuazione del percorso di apprendimento
  - Esercizi di sfida con livelli di difficoltà
  - Feedback della community e link di supporto

- **📚 Modulo workshop 3 (Scomposizione)**: Obiettivi di apprendimento aggiornati con:
  - Guida all’attivazione GitHub Copilot con server MCP
  - Comprensione della struttura cartelle template AZD
  - Schemi di organizzazione Infrastructure-as-code (Bicep)
  - Istruzioni per laboratorio pratico

- **🔧 Modulo workshop 6 (Smantellamento)**: Completato con:
  - Obiettivi di pulizia risorse e gestione costi
  - Uso di `azd down` per deprovisioning sicuro dell’infrastruttura
  - Guida al recupero servizi cognitivi soft-deleted
  - Prompt bonus per esplorazione GitHub Copilot e Azure Portal

#### Correzioni
- **🔗 Correzione link rotti**: Risolti 15+ link interni rotti nella documentazione:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrette le path per microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrette path per ai-model-deployment.md e production-ai-practices.md
  - `docs/getting-started/first-project.md`: Sostituito il inesistente cicd-integration.md con deployment-guide.md
  - `examples/retail-scenario.md`: Corrette path per FAQ e guida troubleshooting
  - `examples/container-app/microservices/README.md`: Corrette path per home corso e guida al deployment
  - `resources/faq.md` e `resources/glossary.md`: Aggiornati riferimenti capitoli AI
  - `course-outline.md`: Corretti riferimenti guida istruttore e laboratorio workshop AI

- **📅 Banner stato workshop**: Aggiornato da "In costruzione" a stato workshop attivo con data febbraio 2026

- **🔗 Navigazione workshop**: Corrette link di navigazione rotti nel README.md del workshop puntando alla cartella lab-1-azd-basics inesistente

#### Modifiche
- **Presentazione workshop**: Rimosso avviso "in costruzione", il workshop è ora completo e pronto per l’uso
- **Coerenza navigazione**: Garantita navigazione corretta tra tutti i moduli del workshop
- **Riferimenti percorso di apprendimento**: Aggiornati cross-riferimenti capitoli con path microsoft-foundry corretti

#### Validazioni
- ✅ Tutti i file markdown inglesi hanno link interni validi
- ✅ Moduli workshop 0-7 completi con obiettivi di apprendimento
- ✅ Funzionamento correttamente navigazione tra capitoli e moduli
- ✅ Contenuti adatti a sviluppatori AI che usano Microsoft AZD
- ✅ Linguaggio e struttura adatti a principianti mantenuti ovunque
- ✅ CONTRIBUTING.md fornisce chiare indicazioni per contributori della community

#### Implementazione tecnica
- **Validazione link**: Script PowerShell automatizzato ha verificato tutti i link .md interni
- **Audit contenuto**: Revisione manuale di completezza workshop e adeguatezza a principianti
- **Sistema di navigazione**: Applicazione di schemi di navigazione coerenti tra capitoli e moduli

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione in inglese
- **Traduzioni**: Cartelle di traduzione non aggiornate in questa versione (la sincronizzazione automatica avverrà in seguito)
- **Durata workshop**: Workshop completo ora offre 3-4 ore di apprendimento pratico

---

### [v3.8.0] - 2025-11-19

#### Documentazione avanzata: Monitoraggio, Sicurezza e schemi Multi-Agente
**Questa versione aggiunge lezioni complete di livello A su integrazione Application Insights, schemi di autenticazione e coordinamento multi-agente per deployment di produzione.**

#### Aggiunte
- **📊 Lezione integrazione Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Deployment focalizzato AZD con provisioning automatico
  - Template Bicep completi per Application Insights + Log Analytics
  - Applicazioni Python funzionanti con telemetria personalizzata (oltre 1.200 righe)
  - Schemi di monitoraggio AI/LLM (monitoraggio token/costi Microsoft Foundry Models)
  - 6 diagrammi Mermaid (architettura, tracciamento distribuito, flusso telemetria)
  - 3 esercizi pratici (alert, dashboard, monitoraggio AI)
  - Esempi query Kusto e strategie di ottimizzazione costi
  - Streaming metriche live e debug in tempo reale
  - Tempo di apprendimento 40-50 minuti con schemi pronti per la produzione

- **🔐 Lezione schemi autenticazione & sicurezza**: in `docs/getting-started/authsecurity.md`:
  - 3 schemi di autenticazione (connection strings, Key Vault, managed identity)
  - Template Bicep infrastrutturali completi per deployment sicuri
  - Codice applicazione Node.js con integrazione Azure SDK
  - 3 esercizi completi (abilitazione managed identity, user-assigned identity, rotazione Key Vault)
  - Best practice di sicurezza e configurazioni RBAC
  - Guida troubleshooting e analisi costi
  - Schemi autenticazione passwordless pronti per la produzione

- **🤖 Lezione schemi coordinamento multi-agente**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 schemi di coordinamento (sequenziale, parallelo, gerarchico, event-driven, consensus)
  - Implementazione completa orchestratore (Python/Flask, oltre 1.500 righe)
  - 3 implementazioni agent specializzati (Ricerca, Scrittore, Editor)
  - Integrazione Service Bus per messaggistica in coda
  - Gestione stato Cosmos DB per sistemi distribuiti
  - 6 diagrammi Mermaid che mostrano interazioni agenti
  - 3 esercizi avanzati (gestione timeout, logica retry, circuit breaker)
  - Analisi costi ($240-565/mese) con strategie di ottimizzazione
  - Integrazione Application Insights per monitoraggio

#### Miglioramenti
- **Capitolo pre-deployment**: Ora include schemi completi di monitoraggio e coordinamento
- **Capitolo introduzione**: Arricchito con schemi professionali di autenticazione
- **Prontezza alla produzione**: Copertura completa da sicurezza a osservabilità
- **Outline corso**: Aggiornato per riferire nuove lezioni in Capitoli 3 e 6

#### Modifiche
- **Progressione apprendimento**: Migliore integrazione di sicurezza e monitoraggio in tutto il corso
- **Qualità documentazione**: Standard coerenti di livello A (95-97%) nelle nuove lezioni
- **Schemi di produzione**: Copertura completa end-to-end per deployment aziendali

#### Migliorato
- **Esperienza sviluppatore**: Percorso chiaro da sviluppo a monitoraggio in produzione
- **Standard sicurezza**: Schemi professionali per autenticazione e gestione segreti
- **Osservabilità**: Integrazione completa Application Insights con AZD
- **Carichi AI**: Monitoraggio specializzato per Microsoft Foundry Models e sistemi multi-agente

#### Validazioni
- ✅ Tutte le lezioni includono codice funzionante completo (non solo snippet)
- ✅ Diagrammi Mermaid per apprendimento visivo (19 totali in 3 lezioni)
- ✅ Esercizi pratici con passaggi di verifica (9 complessivi)
- ✅ Template Bicep pronti per la produzione e deployabili via `azd up`
- ✅ Analisi costi e strategie di ottimizzazione
- ✅ Guide troubleshooting e best practice
- ✅ Checkpoint di conoscenza con comandi di verifica

#### Risultati valutazione documentazione
- **docs/pre-deployment/application-insights.md**: - Guida completa al monitoraggio
- **docs/getting-started/authsecurity.md**: - Schemi professionali di sicurezza
- **docs/pre-deployment/coordination-patterns.md**: - Architetture multi-agente avanzate
- **Contenuti nuovi complessivi**: - Standard di qualità elevati e coerenti

#### Implementazione tecnica
- **Application Insights**: Log Analytics + telemetria personalizzata + tracing distribuito
- **Autenticazione**: Managed Identity + Key Vault + schemi RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orchestrazione
- **Monitoraggio**: Metriche in tempo reale + query Kusto + alert + dashboard
- **Gestione costi**: Strategie sampling, retention policy, controllo budget

### [v3.7.0] - 2025-11-19

#### Miglioramenti qualità documentazione e nuovo esempio Microsoft Foundry Models
**Questa versione migliora la qualità della documentazione in tutto il repository e aggiunge un esempio completo di deployment Microsoft Foundry Models con interfaccia chat gpt-4.1.**

#### Aggiunte
- **🤖 Esempio chat Microsoft Foundry Models**: Deployment completo gpt-4.1 con implementazione funzionante in `examples/azure-openai-chat/`:
  - Infrastruttura Microsoft Foundry Models completa (deploy modello gpt-4.1)
  - Interfaccia chat da riga di comando Python con cronologia conversazioni
  - Integrazione Key Vault per memorizzazione sicura chiavi API
  - Monitoraggio utilizzo token e stima costi
  - Limitazione rate e gestione errori
  - README completo con guida al deployment da 35-45 minuti
  - 11 file pronti per la produzione (template Bicep, app Python, configurazioni)
- **📚 Esercizi documentazione**: Aggiunta pratica con esercizi guida configurazione:
  - Esercizio 1: configurazione multi-ambiente (15 minuti)
  - Esercizio 2: pratica gestione segreti (10 minuti)
  - Criteri di successo chiari e passaggi di verifica
- **✅ Verifica deployment**: Aggiunta sezione verifica nella guida al deployment:
  - Procedure di controllo stato salute
  - Checklist criteri successo
  - Output attesi per tutti i comandi deployment
  - Riferimento rapido per troubleshooting

#### Miglioramenti
- **examples/README.md**: Aggiornato a qualità livello A (93%):
  - Aggiunto azure-openai-chat in tutte le sezioni rilevanti
  - Aggiornato conteggio esempi locali da 3 a 4
  - Aggiunto alla tabella Esempi Applicazioni AI
  - Integrato in Quick Start per utenti intermedi
  - Aggiunto a sezione Microsoft Foundry Templates
  - Aggiornate matrice di comparazione e sezioni di ricerca tecnologie
- **Qualità della Documentazione**: Migliorata da B+ (87%) a A- (92%) nella cartella docs:
  - Aggiunti output attesi agli esempi di comandi critici
  - Includi passaggi di verifica per le modifiche alla configurazione
  - Potenziato l'apprendimento pratico con esercizi concreti

#### Modificato
- **Progressione dell'Apprendimento**: Migliore integrazione di esempi AI per apprendenti intermedi
- **Struttura della Documentazione**: Più esercizi azionabili con risultati chiari
- **Processo di Verifica**: Criteri di successo espliciti aggiunti ai flussi di lavoro chiave

#### Migliorato
- **Esperienza dello Sviluppatore**: Il deployment di Microsoft Foundry Models ora richiede 35-45 minuti (contro 60-90 per alternative complesse)
- **Trasparenza dei Costi**: Stime chiare dei costi ($50-200/mese) per l'esempio Microsoft Foundry Models
- **Percorso di Apprendimento**: Gli sviluppatori AI hanno un punto d’ingresso chiaro con azure-openai-chat
- **Standard della Documentazione**: Output attesi e passaggi di verifica coerenti

#### Validato
- ✅ Esempio Microsoft Foundry Models pienamente funzionale con `azd up`
- ✅ Tutti i 11 file di implementazione sintatticamente corretti
- ✅ Istruzioni README corrispondono all’esperienza reale di deployment
- ✅ Link di documentazione aggiornati in oltre 8 posizioni
- ✅ L'indice degli esempi rispecchia accuratamente 4 esempi locali
- ✅ Nessun link esterno duplicato nelle tabelle
- ✅ Tutti i riferimenti di navigazione corretti

#### Implementazione Tecnica
- **Architettura Microsoft Foundry Models**: modello gpt-4.1 + Key Vault + pattern Container Apps
- **Sicurezza**: Managed Identity pronta, segreti in Key Vault
- **Monitoraggio**: Integrazione con Application Insights
- **Gestione dei Costi**: Monitoraggio token e ottimizzazione uso
- **Deployment**: Singolo comando `azd up` per configurazione completa

### [v3.6.0] - 2025-11-19

#### Aggiornamento Importante: Esempi di Deployment Container App
**Questa versione introduce esempi completi e pronti per la produzione di deployment di applicazioni containerizzate utilizzando Azure Developer CLI (AZD), con documentazione completa e integrazione nel percorso di apprendimento.**

#### Aggiunto
- **🚀 Esempi Container App**: Nuovi esempi locali in `examples/container-app/`:
  - [Guida Master](examples/container-app/README.md): Panoramica completa sui deployment containerizzati, quick start, produzione e pattern avanzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST semplice per principianti con scale-to-zero, probe di salute, monitoraggio e troubleshooting
  - [Architettura Microservizi](../../examples/container-app/microservices): Deployment multi-servizio pronto per la produzione (API Gateway, Product, Order, User, Notification), messaggistica asincrona, Service Bus, Cosmos DB, Azure SQL, distributed tracing, deployment blue-green/canary
- **Best Practices**: Sicurezza, monitoraggio, ottimizzazione dei costi e guida CI/CD per workload containerizzati
- **Esempi di Codice**: Complete `azure.yaml`, template Bicep, e implementazioni multi-lingua di servizi (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Scenari di test end-to-end, comandi di monitoraggio, guida al troubleshooting

#### Modificato
- **README.md**: Aggiornato per presentare e collegare i nuovi esempi container app sotto "Local Examples - Container Applications"
- **examples/README.md**: Aggiornato per evidenziare esempi container app, aggiungere voci di matrice di confronto, e aggiornare riferimenti a tecnologia/architettura
- **Outline del Corso & Guida di Studio**: Aggiornati per riferire i nuovi esempi container app e pattern di deployment nei capitoli rilevanti

#### Validato
- ✅ Tutti i nuovi esempi deployabili con `azd up` e seguono best practice
- ✅ Link incrociati e navigazione documentazione aggiornati
- ✅ Esempi coprono scenari da principiante ad avanzato, inclusi microservizi in produzione

#### Note
- **Ambito**: Solo documentazione e esempi in inglese
- **Passi Successivi**: Espansione con pattern container avanzati e automazione CI/CD in prossime release

### [v3.5.0] - 2025-11-19

#### Rebranding Prodotto: Microsoft Foundry
**Questa versione implementa un cambio completo del nome prodotto da "Microsoft Foundry" a "Microsoft Foundry" in tutta la documentazione in inglese, riflettendo il rebranding ufficiale di Microsoft.**

#### Modificato
- **🔄 Aggiornamento Nome Prodotto**: Rebranding completo da "Microsoft Foundry" a "Microsoft Foundry"
  - Aggiornate tutte le referenze nella documentazione inglese nella cartella `docs/`
  - Rinominata cartella: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rinominato file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totale: 23 riferimenti di contenuto aggiornati in 7 file di documentazione

- **📁 Cambiamenti nella Struttura Cartelle**:
  - `docs/ai-foundry/` rinominata in `docs/microsoft-foundry/`
  - Tutti i riferimenti incrociati aggiornati per riflettere la nuova struttura
  - Navigazione verificata in tutta la documentazione

- **📄 Rinominazione File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tutti i link interni aggiornati per riferire il nuovo nome file

#### File Aggiornati
- **Documentazione Capitoli** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aggiornamenti link di navigazione
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 riferimenti al nome prodotto aggiornati
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Già utilizza Microsoft Foundry (da aggiornamenti precedenti)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 riferimenti aggiornati (overview, feedback community, documentazione)
  - `docs/getting-started/azd-basics.md` - 4 link incrociati aggiornati
  - `docs/getting-started/first-project.md` - 2 link di navigazione capitoli aggiornati
  - `docs/getting-started/installation.md` - 2 link al capitolo successivo aggiornati
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 riferimenti aggiornati (navigazione, community Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link di navigazione aggiornato
  - `docs/troubleshooting/debugging.md` - 1 link di navigazione aggiornato

- **File Struttura Corso** (2 file):
  - `README.md` - 17 riferimenti aggiornati (overview corso, titoli capitoli, sezione template, insights community)
  - `course-outline.md` - 14 riferimenti aggiornati (panoramica, obiettivi di apprendimento, risorse capitolo)

#### Validato
- ✅ Nessun riferimento residuo alla cartella "ai-foundry" nella documentazione inglese
- ✅ Nessun riferimento residuo al nome prodotto "Microsoft Foundry" nella documentazione inglese
- ✅ Tutti i link di navigazione funzionanti con nuova struttura cartelle
- ✅ Rinominazioni di file e cartelle completate con successo
- ✅ Riferimenti incrociati tra capitoli verificati

#### Note
- **Ambito**: Modifiche applicate solo alla documentazione inglese in cartella `docs/`
- **Traduzioni**: Cartelle traduzioni (`translations/`) non aggiornate in questa versione
- **Workshop**: Materiali workshop (`workshop/`) non aggiornati in questa versione
- **Esempi**: File esempi possono ancora contenere riferimenti a nomi legacy (da aggiornare in futuro)
- **Link Esterni**: URL esterni e riferimenti a repository GitHub non modificati

#### Guida alla Migrazione per Contributori
Se hai branch locali o documentazione che fa riferimento alla vecchia struttura:
1. Aggiorna riferimenti cartelle: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aggiorna riferimenti file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sostituisci il nome prodotto: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifica che tutti i link interni alla documentazione funzionino ancora

---

### [v3.4.0] - 2025-10-24

#### Anteprima e Miglioramenti di Validazione dell’Infrastruttura
**Questa versione introduce il supporto completo per la nuova funzionalità di anteprima di Azure Developer CLI e migliora l’esperienza utente del workshop.**

#### Aggiunto
- **🧪 Documentazione funzione azd provision --preview**: Copertura esaustiva della nuova capacità di anteprima infrastrutturale
  - Riferimento comandi ed esempi d’uso nella cheat sheet
  - Integrazione dettagliata nella guida al provisioning con casi d’uso e benefici
  - Integrazione dei controlli pre-flight per una validazione più sicura del deployment
  - Aggiornamenti guida introduttiva con pratiche di deployment basate sulla sicurezza
- **🚧 Banner Stato Workshop**: Banner HTML professionale che indica lo stato di sviluppo del workshop
  - Design a gradiente con indicatori di costruzione per una comunicazione utente chiara
  - Timestamp ultimo aggiornamento per trasparenza
  - Design responsive per dispositivi mobili

#### Potenziato
- **Sicurezza dell’Infrastruttura**: Funzionalità preview integrata in tutta la documentazione sul deployment
- **Validazione Pre-Deployment**: Script automatici ora includono test anteprima infrastruttura
- **Workflow Sviluppatore**: Sequenze di comandi aggiornate per includere preview come best practice
- **Esperienza Workshop**: Chiare aspettative comunicate agli utenti sullo stato di sviluppo dei contenuti

#### Modificato
- **Best Practice Deployment**: Workflow con preview-first ora raccomandato
- **Flusso Documentazione**: Validazione infrastruttura spostata in fase precoce del processo di apprendimento
- **Presentazione Workshop**: Comunicazione professionale dello stato con timeline sviluppo chiaro

#### Migliorato
- **Approccio Safety-First**: Cambi infrastruttura ora validabili prima del deployment
- **Collaborazione team**: Risultati preview condivisibili per revisione e approvazione
- **Consapevolezza Costi**: Migliore comprensione dei costi risorse prima del provisioning
- **Mitigazione Rischi**: Riduzione guasti nel deployment tramite validazione preventiva

#### Implementazione Tecnica
- **Integrazione Multi-documento**: Funzionalità preview documentata in 4 file chiave
- **Pattern Comandi**: Sintassi coerente ed esempi in tutta la documentazione
- **Integrazione Best Practice**: Anteprima inclusa nei workflow e script di validazione
- **Indicatori Visivi**: Marcature chiare NUOVA funzionalità per facilità di scoperta

#### Infrastruttura Workshop
- **Comunicazione Stato**: Banner HTML professionale con stile a gradiente
- **Esperienza Utente**: Stato sviluppo chiaro previene confusione
- **Presentazione Professionale**: Mantiene credibilità repository e definisce aspettative
- **Trasparenza Timeline**: Timestamp ultimo aggiornamento ottobre 2025 per responsabilità

### [v3.3.0] - 2025-09-24

#### Materiali Workshop Potenziati ed Esperienza di Apprendimento Interattiva
**Questa versione introduce materiali workshop completi con guide interattive basate su browser e percorsi di apprendimento strutturati.**

#### Aggiunto
- **🎥 Guida Workshop Interattiva**: Esperienza workshop basata su browser con funzionalità anteprima MkDocs
- **📝 Istruzioni Workshop Strutturate**: Percorso di apprendimento con guida in 7 passaggi dalla scoperta alla personalizzazione
  - 0-Introduzione: Panoramica workshop e setup
  - 1-Seleziona-Template-AI: Processo di selezione e scoperta template
  - 2-Valida-Template-AI: Procedure di deployment e validazione
  - 3-Decompone-Template-AI: Comprensione architettura template
  - 4-Configura-Template-AI: Configurazione e personalizzazione
  - 5-Personalizza-Template-AI: Modifiche avanzate e iterazioni
  - 6-Smaltisci-Infrastruttura: Pulizia e gestione risorse
  - 7-Conclusione: Riepilogo e passi successivi
- **🛠️ Strumenti Workshop**: Configurazione MkDocs con tema Material per esperienza di apprendimento potenziata
- **🎯 Percorso di Apprendimento Practico**: Metodologia in 3 step (Scoperta → Deployment → Personalizzazione)
- **📱 Integrazione GitHub Codespaces**: Configurazione seamless ambiente sviluppo

#### Potenziato
- **Laboratorio AI Workshop**: Esteso con esperienza di apprendimento strutturata di 2-3 ore
- **Documentazione Workshop**: Presentazione professionale con navigazione e aiuti visivi
- **Progressione Apprendimento**: Guida chiara passo-passo dalla selezione template al deployment in produzione
- **Esperienza Sviluppatore**: Strumenti integrati per flussi di lavoro di sviluppo semplificati

#### Migliorato
- **Accessibilità**: Interfaccia basata su browser con ricerca, funzione copia e toggle tema
- **Apprendimento Autonomo**: Struttura workshop flessibile per velocità diverse di apprendimento
- **Applicazione Pratica**: Scenari reali di deployment template AI
- **Integrazione Comunità**: Integrazione Discord per supporto e collaborazione workshop

#### Caratteristiche Workshop
- **Ricerca Integrata**: Scoperta rapida di parole chiave e lezioni
- **Blocchi Codice Copiabili**: Funzionalità hover-to-copy per tutti gli esempi di codice
- **Toggle Tema**: Supporto modalità scura/chiara per preferenze diverse
- **Risorse Visive**: Screenshot e diagrammi per migliorare la comprensione
- **Integrazione Aiuto**: Accesso diretto a Discord per supporto della comunità

### [v3.2.0] - 2025-09-17

#### Ristrutturazione Maggiore della Navigazione e Sistema di Apprendimento Basato su Capitoli
**Questa versione introduce una struttura di apprendimento completa basata su capitoli con navigazione potenziata nell’intero repository.**

#### Aggiunto
- **📚 Sistema di Apprendimento Basato su Capitoli**: Ristrutturato intero corso in 8 capitoli di apprendimento progressivo
  - Capitolo 1: Fondazioni & Quick Start (⭐ - 30-45 minuti)
  - Capitolo 2: Sviluppo AI-First (⭐⭐ - 1-2 ore)
  - Capitolo 3: Configurazione & Autenticazione (⭐⭐ - 45-60 minuti)
  - Capitolo 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 ore)
  - Capitolo 5: Soluzioni Multi-Agente AI (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolo 6: Validazione & Pianificazione Pre-Deployment (⭐⭐ - 1 ora)
  - Capitolo 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolo 8: Pattern di Produzione & Enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistema di Navigazione Completo**: Intestazioni e piè di pagina coerenti in tutta la documentazione
- **🎯 Tracciamento Progressi**: Checklist completamento corso e sistema di verifica apprendimento
- **🗺️ Guida al Percorso di Apprendimento**: Punti d’ingresso chiari per livelli ed obiettivi differenti
- **🔗 Navigazione con Riferimenti Incrociati**: Capitoli correlati e prerequisiti chiaramente linkati

#### Potenziato
- **Struttura README**: Trasformata in piattaforma di apprendimento strutturata con organizzazione per capitoli
- **Navigazione Documentazione**: Ogni pagina ora include contesto capitolo e guida alla progressione
- **Organizzazione Template**: Esempi e template mappati ai capitoli appropriati
- **Integrazione Risorse**: Cheat sheet, FAQ e guide di studio collegate ai capitoli rilevanti
- **Integrazione Workshop**: Laboratori hands-on mappati a molteplici obiettivi di apprendimento capitolo

#### Modificato
- **Progressione di Apprendimento**: Passaggio da documentazione lineare a apprendimento flessibile basato su capitoli
- **Posizionamento della Configurazione**: Guida alla configurazione riposizionata come Capitolo 3 per un flusso di apprendimento migliore
- **Integrazione di Contenuti AI**: Migliore integrazione di contenuti specifici per AI lungo tutto il percorso di apprendimento
- **Contenuti di Produzione**: Pattern avanzati consolidati nel Capitolo 8 per apprendenti aziendali

#### Migliorato
- **Esperienza Utente**: Breadcrumb di navigazione chiari e indicatori di avanzamento capitolo
- **Accessibilità**: Pattern di navigazione coerenti per una più facile fruizione del corso
- **Presentazione Professionale**: Struttura del corso in stile universitario adatta a formazione accademica e aziendale
- **Efficienza dell'Apprendimento**: Riduzione del tempo per trovare contenuti rilevanti grazie a migliore organizzazione

#### Implementazione Tecnica
- **Header di Navigazione**: Navigazione capitolo standardizzata in oltre 40 file di documentazione
- **Navigazione Footer**: Guida di progressione coerente e indicatori di completamento capitolo
- **Collegamenti Incrociati**: Sistema completo di linking interno collegante concetti correlati
- **Mappatura Capitoli**: Template ed esempi chiaramente associati agli obiettivi di apprendimento

#### Potenziamento della Guida di Studio
- **📚 Obiettivi di Apprendimento Completi**: Guida di studio ristrutturata per allinearsi al sistema a 8 capitoli
- **🎯 Valutazione Basata su Capitoli**: Ogni capitolo include obiettivi specifici e esercizi pratici
- **📋 Tracciamento del Progresso**: Programma settimanale con risultati misurabili e checklist di completamento
- **❓ Domande di Valutazione**: Domande per la verifica della conoscenza per ogni capitolo con esiti professionali
- **🛠️ Esercizi Pratici**: Attività hands-on con scenari reali di distribuzione e troubleshooting
- **📊 Progressione delle Competenze**: Avanzamento chiaro da concetti base a pattern enterprise con focus sviluppo carriera
- **🎓 Quadro di Certificazione**: Risultati per sviluppo professionale e sistema di riconoscimento comunitario
- **⏱️ Gestione Tempistiche**: Piano di apprendimento strutturato su 10 settimane con validazione milestones

### [v3.1.0] - 2025-09-17

#### Soluzioni AI Multi-Agente Potenziate
**Questa versione migliora la soluzione retail multi-agente con nomi agenti più chiari e documentazione avanzata.**

#### Cambiato
- **Terminologia Multi-Agente**: Sostituzione di "Cora agent" con "Customer agent" in tutta la soluzione retail multi-agente per maggiore chiarezza
- **Architettura Agente**: Aggiornata tutta la documentazione, template ARM ed esempi codice per usare naming coerente "Customer agent"
- **Esempi di Configurazione**: Modernizzati i pattern di configurazione agent con convenzioni di naming aggiornate
- **Coerenza Documentazione**: Tutti i riferimenti usano nomi agenti professionali e descrittivi

#### Potenziato
- **Pacchetto Template ARM**: Aggiornato retail-multiagent-arm-template con riferimenti a Customer agent
- **Diagrammi Architetturali**: Rinfrescati diagrammi Mermaid con nome agente aggiornato
- **Esempi di Codice**: Classi Python ed esempi di implementazione ora usano denominazione CustomerAgent
- **Variabili Ambiente**: Aggiornati tutti gli script di deploy per usare convenzioni CUSTOMER_AGENT_NAME

#### Migliorato
- **Esperienza Sviluppatore**: Ruoli e responsabilità agenti più chiari nella documentazione
- **Prontezza per Produzione**: Migliore allineamento con convenzioni di naming enterprise
- **Materiali Didattici**: Naming agenti più intuitivo per scopi educativi
- **Usabilità Template**: Comprensione semplificata delle funzioni agenti e pattern di deploy

#### Dettagli Tecnici
- Diagrammi architetturali Mermaid aggiornati con riferimenti CustomerAgent
- Sostituiti nomi classe CoraAgent con CustomerAgent negli esempi Python
- Modificate configurazioni JSON template ARM per usare tipo agente "customer"
- Aggiornate variabili ambiente da CORA_AGENT_* a CUSTOMER_AGENT_*
- Rinfrescati tutti i comandi di deploy e configurazioni container

### [v3.0.0] - 2025-09-12

#### Cambiamenti Principali - Focus su Sviluppatori AI e Integrazione Microsoft Foundry
**Questa versione trasforma il repository in una risorsa completa focalizzata sull’apprendimento AI con integrazione Microsoft Foundry.**

#### Aggiunto
- **🤖 Percorso di Apprendimento AI-First**: Ristrutturazione completa per prioritizzare sviluppatori e ingegneri AI
- **Guida Integrazione Microsoft Foundry**: Documentazione esaustiva per connettere AZD ai servizi Microsoft Foundry
- **Pattern di Deployment Modelli AI**: Guida dettagliata per selezione modello, configurazione e strategie di deploy in produzione
- **Laboratorio Workshop AI**: Workshop pratico di 2-3 ore per convertire applicazioni AI in soluzioni deployabili con AZD
- **Best Practices Produzione AI**: Pattern aziendali per scaling, monitoraggio e sicurezza dei carichi AI
- **Guida Risoluzione Problemi AI**: Troubleshooting completo per modelli Microsoft Foundry, Cognitive Services, e problemi di deploy AI
- **Galleria Template AI**: Collezione selezionata di template Microsoft Foundry con valutazione complessità
- **Materiali Workshop**: Struttura completa workshop con laboratori pratici e materiali di riferimento

#### Potenziato
- **Struttura README**: Focalizzata su sviluppatori AI con dati di interesse comunità al 45% da Microsoft Foundry Discord
- **Percorsi di Apprendimento**: Percorso dedicato sviluppatori AI accanto a percorsi tradizionali per studenti e ingegneri DevOps
- **Raccomandazioni Template**: Template AI evidenziati including azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integrazione Comunità**: Supporto comunità Discord potenziato con canali e discussioni AI-specifiche

#### Sicurezza e Focus Produzione
- **Pattern Managed Identity**: Configurazioni di autenticazione e sicurezza specifiche per AI
- **Ottimizzazione Costi**: Monitoraggio utilizzo token e controlli budget per carichi AI
- **Deploy Multi-Regione**: Strategie per distribuzione globale di applicazioni AI
- **Monitoraggio Performance**: Metriche specifiche AI e integrazione con Application Insights

#### Qualità Documentazione
- **Struttura Lineare Corso**: Progressione logica da principianti a pattern avanzati di deployment AI
- **URL Verificati**: Tutti i link esterni ai repository controllati e accessibili
- **Riferimento Completo**: Tutti i link interni alla documentazione validati e funzionanti
- **Pronto per Produzione**: Pattern di deploy aziendali con esempi reali

### [v2.0.0] - 2025-09-09

#### Cambiamenti Principali - Ristrutturazione Repository e Miglioramento Professionale
**Questa versione rappresenta una revisione significativa della struttura del repository e della presentazione dei contenuti.**

#### Aggiunto
- **Framework di Apprendimento Strutturato**: Tutte le pagine di documentazione ora includono introduzione, obiettivi di apprendimento e risultati attesi
- **Sistema di Navigazione**: Aggiunti link precedente/successivo per ogni lezione in tutta la documentazione per guida progressiva
- **Guida di Studio**: studio-guide.md completa con obiettivi, esercizi pratici e materiali di valutazione
- **Presentazione Professionale**: Rimosse tutte le emoji per migliore accessibilità e aspetto professionale
- **Struttura Contenuti Potenziata**: Migliorata organizzazione e flusso dei materiali didattici

#### Cambiato
- **Formato Documentazione**: Standardizzata tutta la documentazione con struttura coerente orientata all’apprendimento
- **Flusso di Navigazione**: Implementata una progressione logica attraverso tutti i materiali di apprendimento
- **Presentazione Contenuti**: Rimossi elementi decorativi in favore di un formato chiaro e professionale
- **Struttura Link**: Aggiornati tutti i link interni per supportare il nuovo sistema di navigazione

#### Migliorato
- **Accessibilità**: Rimosse dipendenze da emoji per miglior compatibilità screen reader
- **Aspetto Professionale**: Presentazione pulita in stile accademico adatta alla formazione aziendale
- **Esperienza di Apprendimento**: Approccio strutturato con obiettivi chiari e risultati per ogni lezione
- **Organizzazione Contenuti**: Migliore flusso logico e connessione tra argomenti correlati

### [v1.0.0] - 2025-09-09

#### Prima Rilascio - Repository AZD per Apprendimento Completo

#### Aggiunto
- **Struttura Documentazione Core**
  - Serie completa di guide introduttive
  - Documentazione completa per deployment e provisioning
  - Risorse dettagliate per troubleshooting e debugging
  - Strumenti e procedure di validazione pre-deploy

- **Modulo Getting Started**
  - Nozioni base AZD: concetti e terminologia fondamentali
  - Guida all’installazione: istruzioni piattaforma-specifiche
  - Guida alla configurazione: setup ambiente e autenticazione
  - Tutorial primo progetto: apprendimento pratico passo passo

- **Modulo Deployment e Provisioning**
  - Guida al deployment: documentazione flusso completo
  - Guida al provisioning: Infrastructure as Code con Bicep
  - Best practice per deploy in produzione
  - Pattern di architettura multi-servizio

- **Modulo Validazione Pre-Deploy**
  - Pianificazione capacità: validazione disponibilità risorse Azure
  - Selezione SKU: guida completa alle classi di servizio
  - Controlli pre-volo: script di validazione automatizzati (PowerShell e Bash)
  - Strumenti di stima costi e pianificazione budget

- **Modulo Troubleshooting**
  - Problemi comuni: problematiche frequenti e soluzioni
  - Guida al debugging: metodologie sistematiche di risoluzione
  - Tecniche e strumenti diagnostici avanzati
  - Monitoraggio e ottimizzazione performance

- **Risorse e Riferimenti**
  - Cheat sheet comandi: riferimento rapido comandi essenziali
  - Glossario: terminologia e acronimi dettagliati
  - FAQ: risposte dettagliate alle domande frequenti
  - Link risorse esterne e connessioni comunitarie

- **Esempi e Template**
  - Esempio semplice applicazione web
  - Template di deployment sito statico
  - Configurazione applicazione container
  - Pattern di integrazione database
  - Esempi di architettura microservizi
  - Implementazioni funzioni serverless

#### Caratteristiche
- **Supporto Multi-Piattaforma**: Guide installazione e configurazione per Windows, macOS e Linux
- **Livelli di Competenza Multipli**: Contenuti progettati per studenti fino a sviluppatori professionisti
- **Focus Pratico**: Esempi hands-on e scenari reali
- **Copertura Completa**: Da concetti base a pattern aziendali avanzati
- **Approccio Sicurezza-First**: Best practice di sicurezza integrate ovunque
- **Ottimizzazione Costi**: Linee guida per deployment economicamente vantaggiosi e gestione risorse

#### Qualità Documentazione
- **Esempi di Codice Dettagliati**: Campioni di codice pratici e testati
- **Istruzioni Passo-passo**: Guide chiare e operative
- **Gestione Errori Completa**: Troubleshooting per problematiche comuni
- **Integrazione Best Practices**: Standard industriali e raccomandazioni
- **Compatibilità Versioni**: Aggiornato con ultimi servizi Azure e funzionalità azd

## Miglioramenti Futuri Pianificati

### Versione 3.1.0 (Pianificata)
#### Espansione Piattaforma AI
- **Supporto Multi-Modello**: Pattern di integrazione per Hugging Face, Azure Machine Learning e modelli personalizzati
- **Framework Agenti AI**: Template per deployment LangChain, Semantic Kernel e AutoGen
- **Pattern RAG Avanzati**: Opzioni database vettoriali oltre Azure AI Search (Pinecone, Weaviate, ecc.)
- **Osservabilità AI**: Monitoraggio potenziato per performance modelli, utilizzo token e qualità risposte

#### Esperienza Sviluppatore
- **Estensione VS Code**: Esperienza integrata AZD + Microsoft Foundry per sviluppo
- **Integrazione GitHub Copilot**: Generazione template AZD assistita da AI
- **Tutorial Interattivi**: Esercizi di coding pratici con validazione automatica per scenari AI
- **Contenuti Video**: Tutorial video supplementari per apprendenti visivi focalizzati su deploy AI

### Versione 4.0.0 (Pianificata)
#### Pattern AI Aziendali
- **Quadro di Governance**: Governance modelli AI, compliance e tracciamento audit
- **AI Multi-Tenant**: Pattern per servire clienti multipli con servizi AI isolati
- **Deploy AI Edge**: Integrazione con Azure IoT Edge e istanze container
- **AI Cloud Ibrido**: Pattern multi-cloud e ibridi per workloads AI

#### Funzionalità Avanzate
- **Automazione Pipeline AI**: Integrazione MLOps con pipeline di Azure Machine Learning
- **Sicurezza Avanzata**: Pattern zero-trust, endpoint privati e protezione avanzata dalle minacce
- **Ottimizzazione Performance**: Strategie di tuning e scalabilità avanzate per applicazioni AI ad alto throughput
- **Distribuzione Globale**: Pattern di content delivery e edge caching per applicazioni AI

### Versione 3.0.0 (Pianificata) - Superata dalla Release Corrente
#### Aggiunte Proposte - Ora Implementate in v3.0.0
- ✅ **Contenuti AI-Focus**: Integrazione completa Microsoft Foundry (Completata)
- ✅ **Tutorial Interattivi**: Laboratorio workshop AI hands-on (Completato)
- ✅ **Modulo Sicurezza Avanzata**: Pattern di sicurezza specifici AI (Completato)
- ✅ **Ottimizzazione Performance**: Strategie tuning carichi AI (Completato)

### Versione 2.1.0 (Pianificata) - Parzialmente Implementata in v3.0.0
#### Miglioramenti Minori - Alcuni Completati nella Release Corrente
- ✅ **Esempi Aggiuntivi**: Scenari di deploy focalizzati AI (Completati)
- ✅ **FAQ Estese**: Domande e troubleshooting specifico AI (Completati)
- **Integrazione Strumenti**: Guide migliorate per IDE e editor
- ✅ **Espansione Monitoraggio**: Pattern monitoraggio e alert AI-specifici (Completati)

#### Ancora Pianificati per Versione Futura
- **Documentazione Mobile-Friendly**: Design responsive per apprendimento mobile
- **Accesso Offline**: Pacchetti documentazione scaricabili
- **Integrazione IDE Potenziata**: Estensione VS Code per AZD + workflow AI
- **Dashboard Comunità**: Metriche comunitarie in tempo reale e tracciamento contributi

## Contribuire al Changelog

### Segnalare Cambiamenti
Quando contribuisci a questo repository, assicurati che le voci del changelog includano:

1. **Numero Versione**: Seguendo semantic versioning (major.minor.patch)
2. **Data**: Data di rilascio o aggiornamento in formato AAAA-MM-GG
3. **Categoria**: Aggiunto, Modificato, Deprecato, Rimosso, Corretto, Sicurezza
4. **Descrizione Chiara**: Descrizione concisa di cosa è cambiato
5. **Valutazione Impatto**: Come i cambiamenti influenzano utenti esistenti

### Categorie di Cambiamento

#### Aggiunto
- Nuove funzionalità, sezioni documentazione o capacità
- Nuovi esempi, template o risorse di apprendimento
- Strumenti aggiuntivi, script o utility

#### Modificato
- Modifiche a funzionalità o documentazione esistenti
- Aggiornamenti per migliorare chiarezza o accuratezza
- Ristrutturazione di contenuti o organizzazione

#### Deprecato
- Funzionalità o approcci che vengono dismessi progressivamente
- Sezioni documentazione programmate per rimozione
- Metodi con alternative migliori

#### Rimosso
- Funzionalità, documentazione o esempi non più rilevanti
- Informazioni obsolete o approcci deprecati
- Contenuti ridondanti o consolidati

#### Corretto
- Correzioni di errori in documentazione o codice
- Risoluzioni di problemi o issue segnalati
- Miglioramenti ad accuratezza o funzionalità

#### Sicurezza
- Miglioramenti o correzioni relative alla sicurezza
- Aggiornamenti alle migliori pratiche di sicurezza
- Risoluzione di vulnerabilità di sicurezza

### Linee Guida Semantic Versioning

#### Versione Principale (X.0.0)
- Modifiche importanti che richiedono un'azione da parte dell'utente
- Ristrutturazione significativa dei contenuti o dell'organizzazione
- Modifiche che alterano l'approccio o la metodologia fondamentale

#### Versione Minore (X.Y.0)
- Nuove funzionalità o aggiunte di contenuti
- Miglioramenti che mantengono la compatibilità retroattiva
- Esempi, strumenti o risorse aggiuntive

#### Versione Patch (X.Y.Z)
- Correzioni di bug e fix
- Miglioramenti minori ai contenuti esistenti
- Chiarimenti e piccoli miglioramenti

## Feedback e suggerimenti dalla community

Incoraggiamo attivamente il feedback della community per migliorare questa risorsa di apprendimento:

### Come fornire feedback
- **GitHub Issues**: Segnalare problemi o suggerire miglioramenti (sono benvenuti problemi specifici per AI)
- **Discussioni Discord**: Condividere idee e interagire con la community Microsoft Foundry
- **Pull Requests**: Contribuire con miglioramenti diretti ai contenuti, specialmente modelli e guide per AI
- **Microsoft Foundry Discord**: Partecipare al canale #Azure per discussioni su AZD + AI
- **Forum della Community**: Partecipare a discussioni più ampie tra sviluppatori Azure

### Categorie di feedback
- **Accuratezza dei contenuti AI**: Correzioni alle informazioni sull'integrazione e il deployment di servizi AI
- **Esperienza di apprendimento**: Suggerimenti per migliorare il flusso di apprendimento per sviluppatori AI
- **Contenuti AI mancanti**: Richieste di ulteriori modelli, pattern o esempi AI
- **Accessibilità**: Miglioramenti per esigenze di apprendimento diversificate
- **Integrazione di strumenti AI**: Suggerimenti per una migliore integrazione dei workflow di sviluppo AI
- **Pattern AI per la produzione**: Richieste di pattern di deployment AI aziendali

### Impegno di risposta
- **Risposta a problemi**: Entro 48 ore per problemi segnalati
- **Richieste di funzionalità**: Valutazione entro una settimana
- **Contributi della community**: Revisione entro una settimana
- **Problemi di sicurezza**: Priorità immediata con risposta accelerata

## Piano di manutenzione

### Aggiornamenti regolari
- **Revisioni mensili**: Accuratezza dei contenuti e verifica dei link
- **Aggiornamenti trimestrali**: Grandi aggiunte e miglioramenti dei contenuti
- **Revisioni semestrali**: Ristrutturazione completa e miglioramenti
- **Rilasci annuali**: Aggiornamenti di versione major con miglioramenti significativi

### Monitoraggio e assicurazione della qualità
- **Test automatizzati**: Validazione regolare di esempi di codice e link
- **Integrazione feedback della community**: Incorporazione regolare dei suggerimenti degli utenti
- **Aggiornamenti tecnologici**: Allineamento con gli ultimi servizi Azure e le release di azd
- **Audit di accessibilità**: Revisione regolare per i principi di design inclusivo

## Politica di supporto delle versioni

### Supporto per la versione corrente
- **Ultima versione major**: Supporto completo con aggiornamenti regolari
- **Versione major precedente**: Aggiornamenti di sicurezza e correzioni critiche per 12 mesi
- **Versioni legacy**: Solo supporto comunitario, nessun aggiornamento ufficiale

### Linee guida per la migrazione
Quando vengono rilasciate versioni major, offriamo:
- **Guide di migrazione**: Istruzioni passo-passo per la transizione
- **Note di compatibilità**: Dettagli sulle modifiche che interrompono la compatibilità
- **Supporto strumenti**: Script o utility per assistere nella migrazione
- **Supporto della community**: Forum dedicati per domande sulla migrazione

---

**Navigazione**
- **Lezione precedente**: [Guida di Studio](resources/study-guide.md)
- **Lezione successiva**: Torna al [README principale](README.md)

**Rimani aggiornato**: Segui questo repository per notifiche su nuove release e aggiornamenti importanti ai materiali di apprendimento.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
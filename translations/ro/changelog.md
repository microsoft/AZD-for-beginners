# Jurnal de modificări - AZD For Beginners

## Introducere

Acest jurnal de modificări documentează toate schimbările notabile, actualizările și îmbunătățirile repository-ului AZD For Beginners. Urmăm principiile versionării semantice și menținem acest jurnal pentru a-i ajuta pe utilizatori să înțeleagă ce s-a schimbat între versiuni.

## Obiective de învățare

Prin examinarea acestui jurnal de modificări, veți:
- Rămâne informat despre funcționalități noi și adăugări de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Urmări corecțiile și remedierile de erori pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare în timp

## Rezultate ale învățării

După revizuirea intrărilor din jurnal, veți putea:
- Identifica conținutul și resursele noi disponibile pentru învățare
- Înțelege ce secțiuni au fost actualizate sau îmbunătățite
- Planifica calea de învățare bazată pe materialele cele mai actuale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul versiunilor

### [v3.19.1] - 2026-03-27

#### Clarificare pentru inițierea începătorilor, validarea configurării și curățarea finală a comenzilor AZD
**Această versiune urmează la verificarea de validare AZD 1.23 cu o trecere a documentației orientată spre începători: clarifică îndrumarea de autentificare axată pe AZD, adaugă scripturi locale de validare a configurării, verifică comenzile cheie împotriva CLI-ului AZD live și elimină ultimele referințe învechite la comenzile în limba engleză în afara jurnalului de modificări.**

#### Adăugat
- **🧪 Scripturi de validare a configurării pentru începători** cu `validate-setup.ps1` și `validate-setup.sh` astfel încât cursanții să poată confirma instrumentele necesare înainte de a începe Capitolul 1
- **✅ Pași de validare a configurării la început** în README-ul rădăcină și în README-ul Capitolului 1 astfel încât dependențele lipsă să fie detectate înainte de `azd up`

#### Modificat
- **🔐 Îndrumare pentru autentificarea începătorilor** tratează acum în mod consecvent `azd auth login` ca fiind calea principală pentru fluxurile de lucru AZD, iar `az login` este evidențiat ca opțional, cu excepția cazului în care sunt folosite direct comenzi Azure CLI
- **📚 Fluxul de inițiere din Capitolul 1** direcționează acum cursanții să-și valideze configurarea locală înainte de pașii de instalare, autentificare și prima implementare
- **🛠️ Mesajele validatorului** separă acum clar cerințele care blochează de avertismentele opționale Azure CLI pentru drumul pentru începători exclusiv AZD
- **📖 Documentația despre configurare, depanare și exemple** face acum distincția între autentificarea AZD obligatorie și autentificarea opțională Azure CLI acolo unde anterior erau prezentate ambele fără context

#### Remediat
- **📋 Referințele rămase la comenzile din sursa în limba engleză** au fost actualizate la formele AZD curente, inclusiv `azd config show` în fișa de referință și `azd monitor --overview` acolo unde se dorea ghidaj pentru prezentarea generală din Azure Portal
- **🧭 Afirmațiile pentru începători din Capitolul 1** au fost atenuate pentru a evita promisiunile exagerate privind comportamentul garantat fără erori sau rollback pentru toate șabloanele și resursele Azure
- **🔎 Validarea CLI live** a confirmat suportul curent pentru `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` și `azd down --force --purge`

#### Fișiere actualizate
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

#### Validare AZD 1.23.12, extinderea mediului de workshop și actualizarea modelelor AI
**Această versiune efectuează o verificare de validare a documentației împotriva `azd` `1.23.12`, actualizează exemplele de comenzi AZD învechite, reîmprospătează ghidajul pentru modele AI la valorile implicite curente și extinde instrucțiunile workshop-ului dincolo de GitHub Codespaces pentru a suporta și dev container-e și clone locale.**

#### Adăugat
- **✅ Note de validare în capitolele principale și în documentația workshop-ului** pentru a face baza AZD testată explicită pentru cursanții care folosesc versiuni CLI mai noi sau mai vechi
- **⏱️ Ghid privind timeout-ul pentru implementare** pentru implementările de aplicații AI de lungă durată folosind `azd deploy --timeout 1800`
- **🔎 Pași de inspectare a extensiilor** cu `azd extension show azure.ai.agents` în documentația fluxurilor de lucru AI
- **🌐 Ghid mai larg pentru mediul workshop-ului** acoperind GitHub Codespaces, dev container-e și clone locale cu MkDocs

#### Modificat
- **📚 README-urile introductive ale capitolelor** menționează acum în mod consecvent validarea împotriva `azd 1.23.12` în secțiunile fundament, configurare, infrastructură, multi-agent, pre-implementare, depanare și producție
- **🛠️ Referințele la comenzile AZD** actualizate la formele curente în documentație:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview is intended
- **🧪 Exemplele de previzualizare pentru provisioning** simplificate la utilizarea acceptată curent, cum ar fi `azd provision --preview` și `azd provision --preview -e production`
- **🧭 Fluxul workshop-ului** actualizat astfel încât cursanții să poată finaliza laboratoarele în Codespaces, într-un dev container sau într-o clonă locală, în loc să se presupună execuția exclusiv în Codespaces
- **🔐 Ghidul de autentificare** preferă acum `azd auth login` pentru fluxurile de lucru AZD, `az login` fiind poziționat ca opțional atunci când sunt folosite direct comenzi Azure CLI

#### Remediat
- **🪟 Comenzile de instalare pentru Windows** normalizate la scrierea curentă a pachetului `winget` în ghidul de instalare
- **🐧 Ghidul de instalare pentru Linux** corectat pentru a evita instrucțiuni nesuportate, specifice distribuțiilor, pentru managerul de pachete `azd` și, în schimb, a indica activele de release acolo unde este potrivit
- **📦 Exemplele de modele AI** actualizate de la valorile implicite mai vechi precum `gpt-35-turbo` și `text-embedding-ada-002` la exemple curente precum `gpt-4.1-mini`, `gpt-4.1` și `text-embedding-3-large`
- **📋 Fragmentele pentru implementare și diagnosticare** corectate pentru a folosi comenzile curente de mediu și stare în jurnale, scripturi și pașii de depanare
- **⚙️ Ghidul pentru GitHub Actions** actualizat de la `Azure/setup-azd@v1.0.0` la `Azure/setup-azd@v2`
- **🤖 Ghidajul pentru consimțământ MCP/Copilot** actualizat de la `azd mcp consent` la `azd copilot consent list`

#### Îmbunătățit
- **🧠 Ghidajul capitolului AI** explică acum mai bine comportamentul `azd ai` sensibil la preview, autentificarea specifică chiriașului, utilizarea curentă a extensiilor și recomandările actualizate pentru implementarea modelelor
- **🧪 Instrucțiunile workshop-ului** folosesc acum exemple de versiuni mai realiste și un limbaj mai clar pentru configurarea mediului în laboratoarele practice
- **📈 Documentele pentru producție și depanare** sunt mai bine aliniate cu exemplele curente pentru monitorizare, model de fallback și niveluri de cost

#### Fișiere actualizate
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

#### Comenzi AZD AI CLI, validarea conținutului și extinderea șabloanelor
**Această versiune adaugă acoperire pentru comenzile `azd ai`, `azd extension` și `azd mcp` în toate capitolele legate de AI, repară linkuri rupte și cod depreciat în agents.md, actualizează fișa de referință și reface secțiunea Exemple de șabloane cu descrieri validate și noi șabloane Azure AI AZD.**

#### Adăugat
- **🤖 Acoperire AZD AI CLI** în 7 fișiere (anterior doar în Capitolul 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nouă secțiune "Extensions and AI Commands" care introduce `azd extension`, `azd ai agent init` și `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opțiunea 4: `azd ai agent init` cu un tabel de comparație (abordarea pe șablon vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecțiunile "AZD Extensions for Foundry" și "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start afișează acum ambele căi de implementare pe bază de șablon și bază de manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secțiunea Deploy include acum opțiunea `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecțiunea "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Noua secțiune "AI & Extensions Commands" cu `azd extension`, `azd ai agent init`, `azd mcp` și `azd infra generate`
- **📦 Noi șabloane de exemplu AZD AI** în `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET cu Blazor WebAssembly, Semantic Kernel și suport pentru chat vocal
  - **azure-search-openai-demo-java** — chat RAG Java folosind Langchain4J cu opțiuni de implementare ACA/AKS
  - **contoso-creative-writer** — aplicație multi-agent pentru creație literară folosind Azure AI Agent Service, Bing Grounding și Prompty
  - **serverless-chat-langchainjs** — RAG serverless folosind Azure Functions + LangChain.js + Cosmos DB cu suport Ollama pentru dezvoltare locală
  - **chat-with-your-data-solution-accelerator** — accelerator enterprise RAG cu portal de administrare, integrare Teams și opțiuni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — aplicație de referință pentru orchestrarea multi-agent MCP cu servere în .NET, Python, Java și TypeScript
  - **azd-ai-starter** — șablon de pornire minimal pentru infrastructura Azure AI Bicep
  - **🔗 Link către galeria Awesome AZD AI** — Referință la [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (peste 80 de șabloane)

#### Remediat
- **🔗 Navigarea din agents.md**: link-urile Anterior/Următor se potrivesc acum cu ordinea lecțiilor din README-ul Capitolului 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Linkuri rupte din agents.md**: `production-ai-practices.md` corectat în `../chapter-08-production/production-ai-practices.md` (3 apariții)
- **📦 Cod depreciat din agents.md**: `opencensus` înlocuit cu `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API invalid în agents.md**: `max_tokens` mutat din `create_agent()` în `create_run()` ca `max_completion_tokens`
- **🔢 Numărarea token-ilor în agents.md**: estimarea brută `len//4` înlocuită cu `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviciile corectate din "Cognitive Search + App Service" în "Azure AI Search + Azure Container Apps" (gazda implicită schimbată în octombrie 2024)
- **contoso-chat**: Descriere actualizată pentru a face referire la Azure AI Foundry + Prompty, potrivind titlul real al repo-ului și stack-ul tehnologic

#### Eliminat
- **ai-document-processing**: Referință la șablon nefuncțional eliminată (repo nu este accesibil public ca șablon AZD)

#### Îmbunătățit
- **📝 agents.md exercises**: Exercițiul 1 afișează acum rezultatul așteptat și pasul `azd monitor`; Exercițiul 2 include codul complet de înregistrare `FunctionTool`; Exercițiul 3 înlocuiește indicațiile vagi cu comenzi concrete `prepdocs.py`
- **📚 agents.md resources**: Actualizate link-urile de documentație către documentele curente Azure AI Agent Service și ghidul quickstart
- **📋 agents.md Next Steps table**: Adăugat linkul AI Workshop Lab pentru acoperirea completă a capitolului

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**Această versiune îmbunătățește navigarea din README.md pentru capitole cu un format de tabel îmbunătățit.**

#### Changed
- **Course Map Table**: Îmbunătățit cu linkuri directe către lecții, estimări de durată și evaluări ale complexității
- **Folder Cleanup**: Eliminat folderele vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Verificate toate cele 21+ linkuri interne din tabelul Course Map

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Această versiune actualizează referințele produselor pentru a reflecta brandingul Microsoft curent.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: Toate referințele actualizate în fișierele care nu sunt de traducere
- **Azure AI Agent Service → Foundry Agents**: Denumirea serviciului actualizată pentru a reflecta brandingul curent

#### Files Updated
- `README.md` - Pagina principală a cursului
- `changelog.md` - Istoricul versiunilor
- `course-outline.md` - Structura cursului
- `docs/chapter-02-ai-development/agents.md` - Ghidul pentru agenți AI
- `examples/README.md` - Documentația exemplelor
- `workshop/README.md` - Pagina principală a workshop-ului
- `workshop/docs/index.md` - Index workshop
- `workshop/docs/instructions/*.md` - Toate fișierele de instrucțiuni ale workshop-ului

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Această versiune restructurează documentația în foldere dedicate pentru capitole, pentru o navigare mai clară.**

#### Folder Renames
Folderele vechi au fost înlocuite cu foldere numerotate pe capitole:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| Fișier | Din | Către |
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

#### Added
- **📚 Fișiere README pentru capitole**: Create README.md în fiecare folder de capitol cu:
  - Obiective de învățare și durată
  - Tabel de lecții cu descrieri
  - Comenzi quick start
  - Navigare către celelalte capitole

#### Changed
- **🔗 Actualizare toate linkurile interne**: 78+ căi actualizate în toate fișierele de documentație
- **🗺️ README.md principal**: Actualizat Course Map cu noua structură pe capitole
- **📝 examples/README.md**: Actualizate referințele încrucișate către folderele capitolelor

#### Removed
- Structura veche a folderelor (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Această versiune a adăugat fișiere README de navigare pe capitole (înlocuite de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Această versiune adaugă un ghid cuprinzător pentru implementarea agenților AI cu Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet care acoperă:
  - Ce sunt agenții AI și cum se diferențiază de chatboți
  - Trei șabloane quick-start pentru agenți (Foundry Agents, Prompty, RAG)
  - Modele de arhitectură pentru agenți (agent unic, RAG, multi-agent)
  - Configurarea și personalizarea tool-urilor
  - Monitorizare și urmărire metrici
  - Considerații privind costurile și optimizarea
  - Scenarii comune de depanare
  - Trei exerciții practice cu criterii de succes

#### Content Structure
- **Introduction**: Concepte despre agenți pentru începători
- **Quick Start**: Implementați agenți cu `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Diagrame vizuale ale modelelor de agenți
- **Configuration**: Setarea tool-urilor și variabilelor de mediu
- **Monitoring**: Integrare Application Insights
- **Exercises**: Învățare practică progresivă (20–45 minute fiecare)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Această versiune actualizează configurația containerului de dezvoltare cu instrumente moderne și implicituri mai bune pentru experiența AZD.**

#### Changed
- **🐳 Base Image**: Actualizat din `python:3.12-bullseye` în `python:3.12-bookworm` (ultima versiune stabilă Debian)
- **📛 Container Name**: Redenumit din "Python 3" în "AZD for Beginners" pentru claritate

#### Added
- **🔧 Funcționalități noi Dev Container**:
  - `azure-cli` cu suport Bicep activat
  - `node:20` (versiune LTS pentru șabloane AZD)
  - `github-cli` pentru gestionarea șabloanelor
  - `docker-in-docker` pentru implementări de aplicații containerizate

- **🔌 Port Forwarding**: Porturi preconfigurate pentru dezvoltare uzuală:
  - 8000 (previzualizare MkDocs)
  - 3000 (aplicații web)
  - 5000 (Python Flask)
  - 8080 (API-uri)

- **🧩 Extensii VS Code noi**:
  - `ms-python.vscode-pylance` - IntelliSense Python îmbunătățit
  - `ms-azuretools.vscode-azurefunctions` - Suport Azure Functions
  - `ms-azuretools.vscode-docker` - Suport Docker
  - `ms-azuretools.vscode-bicep` - Suport limbaj Bicep
  - `ms-azure-devtools.azure-resource-groups` - Management resurse Azure
  - `yzhang.markdown-all-in-one` - Editare Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Suport diagrame Mermaid
  - `redhat.vscode-yaml` - Suport YAML (pentru azure.yaml)
  - `eamodio.gitlens` - Vizualizare Git
  - `mhutchie.git-graph` - Istoric Git

- **⚙️ Setări VS Code**: Adăugate setări implicite pentru interpreter Python, formatare la salvare și curățare whitespace

- **📦 requirements-dev.txt actualizat**:
  - Adăugat plugin MkDocs minify
  - Adăugat pre-commit pentru calitate cod
  - Adăugate pachete Azure SDK (azure-identity, azure-mgmt-resource)

#### Fixed
- **Comandă Post-Create**: Verifică acum instalarea AZD și Azure CLI la pornirea containerului

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil pentru începători și adaugă resurse esențiale pentru dezvoltatorii AI.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Explicație clară când să folosiți fiecare instrument, cu exemple practice
- **🌟 Awesome AZD Links**: Linkuri directe către galeria de șabloane comunitare și resurse de contribuție:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ șabloane gata de implementare
  - [Trimite un șablon](https://github.com/Azure/awesome-azd/issues) - Contribuție din partea comunității
- **🎯 Quick Start Guide**: Secțiune simplificată de 3 pași pentru început (Instalare → Autentificare → Implementare)
- **📊 Tabel de navigare bazat pe experiență**: Ghid clar unde să înceapă în funcție de experiența dezvoltatorului

#### Changed
- **README Structure**: Reorganizată pentru divulgare progresivă - informațiile cheie primele
- **Introduction Section**: Rescrisă pentru a explica "Magia `azd up`" pentru începători
- **Removed Duplicate Content**: Eliminată secțiunea duplicat de depanare
- **Troubleshooting Commands**: Corectat referința `azd logs` pentru a folosi `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Adăugate `azd auth login` și `azd auth logout` în cheat-sheet.md
- **Referințe de comenzi invalide**: Eliminat `azd logs` rămas în secțiunea de depanare din README

#### Notes
- **Scop**: Modificări aplicate la README.md principal și resources/cheat-sheet.md
- **Public țintă**: Îmbunătățiri dedicate dezvoltatorilor noi în AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Această versiune corectează comenzi AZD inexistente din documentație, asigurând că toate exemplele de cod folosesc sintaxa validă a Azure Developer CLI.**

#### Fixed
- **🔧 Comenzi AZD inexistente eliminate**: Audit complet și corectare a comenzilor invalide AZD:
  - `azd logs` (nu există) → înlocuit cu `azd monitor --logs` sau alternative Azure CLI
  - Subcomenzile `azd service` (nu există) → înlocuite cu `azd show` și Azure CLI
  - `azd infra import/export/validate` (nu există) → eliminate sau înlocuite cu alternative valide
  - Flag-urile `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nu există) → eliminate
  - Flag-urile `azd provision --what-if/--rollback` (nu există) → actualizate pentru a folosi `--preview`
  - `azd config validate` (nu există) → înlocuit cu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nu există) → eliminate

- **📚 Fișiere actualizate cu corecții de comenzi**:
  - `resources/cheat-sheet.md`: Revizuire majoră a referințelor de comenzi
  - `docs/deployment/deployment-guide.md`: Corectate strategii de rollback și implementare
  - `docs/troubleshooting/debugging.md`: Corectate secțiunile de analiză a jurnalelor
  - `docs/troubleshooting/common-issues.md`: Actualizate comenzile de depanare
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectată secțiunea de depanare AZD
  - `docs/getting-started/azd-basics.md`: Corectate comenzile de monitorizare
  - `docs/getting-started/first-project.md`: Actualizate exemplele de monitorizare și depanare
  - `docs/getting-started/installation.md`: Corectate exemplele de help și versiune
  - `docs/pre-deployment/application-insights.md`: Corectate comenzile de vizualizare a jurnalelor
  - `docs/pre-deployment/coordination-patterns.md`: Corectate comenzile de depanare a agenților

- **📝 Referință versiune actualizată**:
  - `docs/getting-started/installation.md`: Versiunea hardcodata `1.5.0` schimbată în `1.x.x` cu link către release-uri

#### Changed
- **Strategii de rollback**: Documentația actualizată pentru a folosi rollback bazat pe Git (AZD nu are rollback nativ)
- **Vizualizarea jurnalelor**: Referințele `azd logs` înlocuite cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI
- **Secțiunea Performanță**: Eliminat flag-urile de implementare paralelă/incrementală inexistente, oferind alternative valide

#### Technical Details
- **Comenzi AZD valide**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flaguri valide pentru azd monitor**: `--live`, `--logs`, `--overview`
- **Funcționalități eliminate**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verificare**: Comenzi validate împotriva Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalizarea atelierului și actualizare a calității documentației
**Această versiune finalizează modulele interactive ale atelierului, repară toate linkurile de documentație rupte și îmbunătățește calitatea generală a conținutului pentru dezvoltatorii AI care folosesc Microsoft AZD.**

#### Adăugat
- **📝 CONTRIBUTING.md**: Document nou cu ghidul de contribuție, care include:
  - Instrucțiuni clare pentru raportarea problemelor și propunerea de modificări
  - Standardele de documentare pentru conținut nou
  - Ghid pentru exemple de cod și convenții pentru mesajele de commit
  - Informații despre implicarea comunității

#### Finalizat
- **🎯 Modulul atelierului 7 (Concluzie)**: Modulul de încheiere finalizat complet, cu:
  - Rezumat cuprinzător al realizărilor atelierului
  - Secțiune cu conceptele-cheie stăpânite acoperind AZD, template-uri și Microsoft Foundry
  - Recomandări pentru continuarea parcursului de învățare
  - Exerciții provocatoare ale atelierului cu evaluări de dificultate
  - Linkuri pentru feedback din comunitate și suport

- **📚 Modulul atelierului 3 (Deconstrucție)**: Obiective de învățare actualizate cu:
  - Ghid pentru activarea GitHub Copilot cu serverele MCP
  - Înțelegerea structurii folderului de template-uri AZD
  - Modele de organizare pentru infrastructură ca cod (Bicep)
  - Instrucțiuni pentru laborator practice

- **🔧 Modulul atelierului 6 (Demontare)**: Finalizat cu:
  - Obiective privind curățarea resurselor și gestionarea costurilor
  - `azd down` pentru deprovisionare sigură a infrastructurii
  - Ghid pentru recuperarea serviciilor cognitive șterse soft
  - Sarcini bonus pentru explorare cu GitHub Copilot și Azure Portal

#### Remediat
- **🔗 Corectare linkuri rupte**: Rezolvate 15+ linkuri interne de documentație rupte:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Bannerul de stare al atelierului**: Actualizat din "Under Construction" în stare activă a atelierului cu data februarie 2026

- **🔗 Navigare atelier**: Corectate linkuri de navigație rupte în workshop README.md care indicau spre folderul lab-1-azd-basics inexistent

#### Modificat
- **Prezentarea atelierului**: Eliminat avertismentul "în construcție", atelierul este acum complet și gata de utilizare
- **Consistența navigației**: S-a asigurat că toate modulele atelierului au navigație inter-module adecvată
- **Referințe din traseul de învățare**: Actualizate coreferențele capitolelor pentru a folosi căile corecte microsoft-foundry

#### Validat
- ✅ Toate fișierele markdown în limba engleză au linkuri interne valide
- ✅ Modulele atelierului 0-7 sunt complete cu obiective de învățare
- ✅ Navigația între capitole și module funcționează corect
- ✅ Conținutul este potrivit pentru dezvoltatorii AI care folosesc Microsoft AZD
- ✅ Limbaj și structură prietenoase pentru începători menținute pe tot parcursul
- ✅ CONTRIBUTING.md oferă îndrumări clare pentru contribuitorii din comunitate

#### Implementare tehnică
- **Validarea linkurilor**: Script PowerShell automatizat a verificat toate linkurile interne .md
- **Audit de conținut**: Revizuire manuală a completitudinii atelierului și a adecvării pentru începători
- **Sistem de navigație**: Aplicate modele consistente de navigație între capitole și module

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză
- **Traduceri**: Folderele de traducere nu au fost actualizate în această versiune (traducerea automată va fi sincronizată ulterior)
- **Durata atelierului**: Atelierul complet oferă acum 3-4 ore de învățare practică

---

### [v3.8.0] - 2025-11-19

#### Documentație avansată: Monitorizare, securitate și modele multi-agent
**Această versiune adaugă lecții cuprinzătoare de nivel A despre integrarea Application Insights, modele de autentificare și coordonare multi-agent pentru implementări în producție.**

#### Adăugat
- **📊 Lecție Integrare Application Insights**: în `docs/pre-deployment/application-insights.md`:
  - Implementare axată pe AZD cu provisioning automat
  - Șabloane Bicep complete pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1.200 linii)
  - Modele de monitorizare pentru AI/LLM (urmărire token/cost pentru Microsoft Foundry Models)
  - 6 diagrame Mermaid (arhitectură, tracing distribuit, flux de telemetrie)
  - 3 exerciții practice (alerte, dashboard-uri, monitorizare AI)
  - Exemple de interogări Kusto și strategii de optimizare a costurilor
  - Streaming de metrici în direct și depanare în timp real
  - Timp de învățare 40-50 minute cu modele gata pentru producție

- **🔐 Lecție Modele de Autentificare & Securitate**: în `docs/getting-started/authsecurity.md`:
  - 3 modele de autentificare (connection strings, Key Vault, identitate gestionată)
  - Șabloane de infrastructură Bicep complete pentru implementări sigure
  - Cod aplicație Node.js cu integrare Azure SDK
  - 3 exerciții complete (activare identitate gestionată, identitate atribuită de utilizator, rotire Key Vault)
  - Cele mai bune practici de securitate și configurări RBAC
  - Ghid de depanare și analiză a costurilor
  - Modele de autentificare fără parolă gata pentru producție

- **🤖 Lecție Modele de Coordonare Multi-Agent**: în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (secuențial, paralel, ierarhic, bazat pe evenimente, consens)
  - Implementare completă a serviciului orchestrator (Python/Flask, peste 1.500 linii)
  - 3 implementări specializate de agenți (Research, Writer, Editor)
  - Integrare Service Bus pentru cozi de mesaje
  - Gestionarea stării în Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid care arată interacțiunile agenților
  - 3 exerciții avansate (gestionare timeout, logică de retry, circuit breaker)
  - Defalcare costuri ($240-565/month) cu strategii de optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățit
- **Capitolul Pre-deployment**: Acum include monitorizare cuprinzătoare și modele de coordonare
- **Capitolul Getting Started**: Îmbunătățit cu modele profesionale de autentificare
- **Pregătire pentru producție**: Acoperire completă de la securitate la observabilitate
- **Structura cursului**: Actualizată pentru a face referire la noile lecții din Capitolele 3 și 6

#### Modificat
- **Progresul învățării**: Integrare mai bună a securității și monitorizării pe parcursul cursului
- **Calitatea documentației**: Standard A-grade consecvent (95-97%) în noile lecții
- **Modele pentru producție**: Acoperire end-to-end completă pentru implementări enterprise

#### Îmbunătățit
- **Experiența dezvoltatorului**: Parcurs clar de la dezvoltare la monitorizare în producție
- **Standarde de securitate**: Modele profesionale pentru autentificare și gestionarea secretelor
- **Observabilitate**: Integrare completă Application Insights cu AZD
- **Sarcini AI**: Monitorizare specializată pentru Microsoft Foundry Models și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile includ cod funcțional complet (nu doar fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 în total în 3 lecții)
- ✅ Exerciții practice cu pași de verificare (9 în total)
- ✅ Șabloane Bicep gata pentru producție, implementabile via `azd up`
- ✅ Analiză de costuri și strategii de optimizare
- ✅ Ghiduri de depanare și bune practici
- ✅ Checkpoint-uri de cunoștințe cu comenzi de verificare

#### Rezultatele evaluării documentației
- **docs/pre-deployment/application-insights.md**: - Ghid cuprinzător de monitorizare
- **docs/getting-started/authsecurity.md**: - Modele profesionale de securitate
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent
- **Conținut nou total**: - Standarde constante de calitate ridicată

#### Implementare tehnică
- **Application Insights**: Log Analytics + telemetrie personalizată + tracing distribuit
- **Autentificare**: Identitate gestionată + Key Vault + modele RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare**: Metrici live + interogări Kusto + alerte + dashboard-uri
- **Gestionare costuri**: Strategii de sampling, politici de retenție, controale bugetare

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri ale calității documentației și exemplu nou Microsoft Foundry Models
**Această versiune îmbunătățește calitatea documentației în întregul repository și adaugă un exemplu complet de implementare Microsoft Foundry Models cu interfață chat gpt-4.1.**

#### Adăugat
- **🤖 Exemplu Chat Microsoft Foundry Models**: Implementare completă gpt-4.1 în `examples/azure-openai-chat/`:
  - Infrastructură completă pentru Microsoft Foundry Models (implementare model gpt-4.1)
  - Interfață de chat linie de comandă Python cu istoric al conversațiilor
  - Integrare Key Vault pentru stocare sigură a cheilor API
  - Monitorizare utilizare tokeni și estimare costuri
  - Limitare rată și gestionare erori
  - README cu ghid de implementare 35-45 minute
  - 11 fișiere gata pentru producție (template-uri Bicep, aplicație Python, configurare)
- **📚 Exerciții în documentație**: Adăugate exerciții practice în ghidul de configurare:
  - Exercițiul 1: Configurare multi-mediu (15 minute)
  - Exercițiul 2: Practică gestionare secrete (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare implementare**: Adăugat secțiune de verificare în ghidul de implementare:
  - Proceduri de health check
  - Checklist cu criterii de succes
  - Elemente de output așteptate pentru toate comenzile de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățit
- **examples/README.md**: Actualizat la calitate A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Actualizat numărul exemplelor locale de la 3 la 4
  - Adăugat în tabelul AI Application Examples
  - Integrat în Quick Start pentru utilizatori intermediari
  - Adăugat în secțiunea Microsoft Foundry Templates
  - Actualizat matricea de comparație și secțiunile de descoperire tehnologică
- **Calitatea documentației**: Îmbunătățită de la B+ (87%) → A- (92%) în folderul docs:
  - Adăugate output-uri așteptate la exemple critice de comandă
  - Incluse pași de verificare pentru schimbările de configurare
  - Îmbunătățită învățarea practică cu exerciții acționabile

#### Modificat
- **Progresul învățării**: Integrare mai bună a exemplelor AI pentru utilizatorii intermediari
- **Structura documentației**: Exerciții mai aplicabile cu rezultate clare
- **Procesul de verificare**: Criterii explicite de succes adăugate în fluxurile cheie

#### Îmbunătățit
- **Experiența dezvoltatorului**: Implementarea Microsoft Foundry Models acum durează 35-45 minute (vs 60-90 pentru alternative complexe)
- **Transparența costurilor**: Estimări clare de cost ($50-200/month) pentru exemplul Microsoft Foundry Models
- **Parcurs de învățare**: Dezvoltatorii AI au un punct de intrare clar cu azure-openai-chat
- **Standardele documentației**: Output-uri așteptate și pași de verificare consecvenți

#### Validat
- ✅ Exemplul Microsoft Foundry Models complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere de implementare sintactic corecte
- ✅ Instrucțiunile din README corespund experienței reale de implementare
- ✅ Linkurile din documentație actualizate în 8+ locații
- ✅ Indexul exemplelor reflectă corect 4 exemple locale
- ✅ Niciun link extern duplicat în tabele
- ✅ Toate referințele de navigație corecte

#### Implementare tehnică
- **Arhitectura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps
- **Securitate**: Identitate gestionată pregătită, secrete în Key Vault
- **Monitorizare**: Integrare Application Insights
- **Gestionare costuri**: Urmărire tokeni și optimizare utilizare
- **Implementare**: O singură comandă `azd up` pentru setup complet

### [v3.6.0] - 2025-11-19

#### Actualizare majoră: Exemple de implementare Container App
**Această versiune introduce exemple cuprinzătoare, gata pentru producție, de implementare a aplicațiilor containerizate folosind Azure Developer CLI (AZD), cu documentație completă și integrare în traseul de învățare.**

#### Adăugat
- **🚀 Exemple Container App**: Exemple locale noi în `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, quick start, producție și modele avansate
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API prietenos pentru începători cu scale-to-zero, probe de sănătate, monitorizare și depanare
  - [Microservices Architecture](../../examples/container-app/microservices): Implementare multi-serviciu gata pentru producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, tracing distribuit, implementare blue-green/canary
- **Best Practices**: Securitate, monitorizare, optimizare costuri și ghid CI/CD pentru sarcini containerizate
- **Code Samples**: `azure.yaml`, template-uri Bicep complete și implementări multi-limbaj pentru servicii (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Scenarii de test end-to-end, comenzi de monitorizare, ghid de depanare

#### Modificat
- **README.md**: Actualizat pentru a prezenta și a lega noi exemple de aplicații container sub "Local Examples - Container Applications"
- **examples/README.md**: Actualizat pentru a evidenția exemplele de aplicații container, a adăuga intrări în matricea de comparație și a actualiza referințele tehnologice/arhitecturale
- **Course Outline & Study Guide**: Actualizat pentru a face referire la noile exemple de aplicații container și la tiparele de implementare în capitolele relevante

#### Validat
- ✅ Toate noile exemple pot fi implementate cu `azd up` și urmează bune practici
- ✅ Legăturile încrucișate din documentație și navigarea actualizate
- ✅ Exemplele acoperă scenarii de la începător la avansat, inclusiv microservicii în producție

#### Observații
- **Scop**: Doar documentație și exemple în limba engleză
- **Pași următori**: Extindere cu tipare avansate suplimentare pentru containere și automatizări CI/CD în versiunile viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding al produsului: Microsoft Foundry
**Această versiune implementează o schimbare cuprinzătoare a numelui produsului de la "Microsoft Foundry" la "Microsoft Foundry" în toată documentația în limba engleză, reflectând rebrandingul oficial al companiei Microsoft.**

#### Modificări
- **🔄 Actualizare denumire produs**: Rebranding complet de la "Microsoft Foundry" la "Microsoft Foundry"
  - Actualizate toate referințele în documentația în limba engleză în folderul `docs/`
  - Redenumire folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Redenumire fișier: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referințe de conținut actualizate în 7 fișiere de documentație

- **📁 Modificări ale structurii folderelor**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele încrucișate actualizate pentru a reflecta noua structură de foldere
  - Linkurile de navigare validate în întreaga documentație

- **📄 Redenumiri fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate linkurile interne actualizate pentru a face referire la noul nume de fișier

#### Fișiere actualizate
- **Documentație capitole** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări de linkuri de navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe la numele produsului actualizate
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Deja folosește Microsoft Foundry (din actualizări precedente)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback din comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 linkuri de referință încrucișată actualizate
  - `docs/getting-started/first-project.md` - 2 linkuri de navigare între capitole actualizate
  - `docs/getting-started/installation.md` - 2 linkuri către capitolul următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitate Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navigare actualizat
  - `docs/troubleshooting/debugging.md` - 1 link de navigare actualizat

- **Fișiere structură curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentare generală a cursului, titlurile capitolelor, secțiunea șabloane, perspective comunitare)
  - `course-outline.md` - 14 referințe actualizate (prezentare, obiective de învățare, resurse pentru capitole)

#### Validat
- ✅ Nicio referință rămasă la folderul "ai-foundry" în documentele în limba engleză
- ✅ Nicio referință rămasă la numele produsului "Microsoft Foundry" în documentele în limba engleză
- ✅ Toate linkurile de navigare funcționează cu noua structură de foldere
- ✅ Redenumirile de fișiere și foldere finalizate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Observații
- **Scop**: Schimbările aplicate doar documentației în limba engleză din folderul `docs/`
- **Traduceri**: Folderele de traduceri (`translations/`) nu au fost actualizate în această versiune
- **Workshop**: Materialele workshop-ului (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele de exemple pot încă face referire la denumiri moștenite (va fi abordat într-o actualizare viitoare)
- **Legături externe**: URL-urile externe și referințele către repository-ul GitHub rămân neschimbate

#### Ghid de migrare pentru contributori
Dacă aveți branch-uri locale sau documentație care face referire la structura veche:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți numele produsului: "Microsoft Foundry" → "Microsoft Foundry"
4. Validați că toate linkurile interne din documentație funcționează în continuare

---

### [v3.4.0] - 2025-10-24

#### Îmbunătățiri pentru previzualizarea infrastructurii și validare
**Această versiune introduce suport cuprinzător pentru noua funcționalitate de previzualizare Azure Developer CLI și îmbunătățește experiența utilizatorului workshop-ului.**

#### Adăugat
- **🧪 azd provision --preview Documentația funcției**: Acoperire cuprinzătoare a noii capacități de previzualizare a infrastructurii
  - Referință de comandă și exemple de utilizare în fișa de referință
  - Integrare detaliată în ghidul de provisionare cu cazuri de utilizare și beneficii
  - Integrare a verificărilor prealabile pentru o validare mai sigură a implementării
  - Actualizări ale ghidului de pornire ce promovează practici de implementare orientate spre siguranță
- **🚧 Banner de stare pentru workshop**: Banner HTML profesional indicând stadiul de dezvoltare al workshop-ului
  - Design cu gradient și indicatori de construcție pentru o comunicare clară cu utilizatorii
  - Marcă temporală pentru ultima actualizare pentru transparență
  - Design responsive pentru mobil, compatibil cu toate tipurile de dispozitive

#### Îmbunătățit
- **Siguranța infrastructurii**: Funcționalitatea de previzualizare integrată pe parcursul documentației de implementare
- **Validare pre-implementare**: Scripturile automate includ acum testarea previzualizării infrastructurii
- **Flux de lucru pentru dezvoltatori**: Secvențe de comenzi actualizate pentru a include previzualizarea ca bună practică
- **Experiența workshop-ului**: Așteptări clare pentru utilizatori privind stadiul de dezvoltare al conținutului

#### Modificat
- **Bune practici de implementare**: Fluxul de lucru orientat spre previzualizare recomandat ca abordare standard
- **Fluxul documentației**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentarea workshop-ului**: Comunicare profesională a stadiului cu un calendar clar de dezvoltare

#### Îmbunătățit
- **Abordare Safety-First**: Modificările infrastructurii pot fi validate înainte de implementare
- **Colaborare în echipă**: Rezultatele previzualizării pot fi partajate pentru revizuire și aprobare
- **Conștientizare a costurilor**: O înțelegere mai bună a costurilor resurselor înainte de provisioning
- **Reducerea riscului**: Diminuarea erorilor de implementare prin validare în avans

#### Implementare tehnică
- **Integrare multi-documents**: Funcția de previzualizare documentată în 4 fișiere cheie
- **Tipare de comandă**: Sintaxă și exemple consistente în întreaga documentație
- **Integrarea bunelor practici**: Previziualizarea inclusă în fluxurile de validare și scripturi
- **Indicatori vizuali**: Marcaje clare NEW pentru descoperire facilă

#### Infrastructura workshop-ului
- **Comunicare a stadiului**: Banner HTML profesional cu stilizare în gradient
- **Experiența utilizatorului**: Stadiul clar al dezvoltării previne confuzia
- **Prezentare profesională**: Menține credibilitatea repository-ului în timp ce setează așteptări
- **Transparență în timeline**: Marcă temporală ultima actualizare octombrie 2025 pentru responsabilizare

### [v3.3.0] - 2025-09-24

#### Materiale de workshop îmbunătățite și experiență interactivă de învățare
**Această versiune introduce materiale de workshop cu ghiduri interactive în browser și trasee de învățare structurate.**

#### Adăugat
- **🎥 Ghid de workshop interactiv**: Experiență de workshop bazată pe browser cu capacitate de previzualizare MkDocs
- **📝 Instrucțiuni structurate pentru workshop**: Traseu de învățare ghidat în 7 pași de la descoperire la personalizare
  - 0-Introduction: Prezentare generală a workshop-ului și configurare
  - 1-Select-AI-Template: Procesul de descoperire și selecție a șabloanelor
  - 2-Validate-AI-Template: Proceduri de implementare și validare
  - 3-Deconstruct-AI-Template: Înțelegerea arhitecturii șablonului
  - 4-Configure-AI-Template: Configurare și personalizare
  - 5-Customize-AI-Template: Modificări avansate și iterări
  - 6-Teardown-Infrastructure: Curățare și gestionarea resurselor
  - 7-Wrap-up: Rezumat și pași următori
- **🛠️ Tooling pentru workshop**: Configurare MkDocs cu tema Material pentru o experiență educațională îmbunătățită
- **🎯 Parcurs de învățare hands-on**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare simplificată a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI**: Extins cu o experiență de învățare structurată de 2-3 ore
- **Documentație workshop**: Prezentare profesională cu navigare și elemente vizuale
- **Progresul în învățare**: Ghidare clară pas-cu-pas de la selectarea șablonului până la implementarea în producție
- **Experiența dezvoltatorului**: Tooling integrat pentru fluxuri de lucru de dezvoltare simplificate

#### Îmbunătățit
- **Accesibilitate**: Interfață bazată pe browser cu funcții de căutare, copiere și comutator de teme
- **Învățare auto-ritmată**: Structură flexibilă care se potrivește ritmurilor diferite de învățare
- **Aplicații practice**: Scenarii reale de implementare a șabloanelor AI
- **Integrare comunitară**: Integrare Discord pentru suport și colaborare în workshop

#### Funcții workshop
- **Căutare încorporată**: Descoperire rapidă de lecții și cuvinte cheie
- **Copiere blocuri de cod**: Funcționalitate hover-to-copy pentru toate exemplele de cod
- **Comutator temă**: Suport mod întunecat/deschis pentru preferințe diferite
- **Resurse vizuale**: Capturi de ecran și diagrame pentru o mai bună înțelegere
- **Integrare ajutor**: Acces direct la Discord pentru suport comunitar

### [v3.2.0] - 2025-09-17

#### Reorganizare majoră a navigației și sistem de învățare pe capitole
**Această versiune introduce o structură cuprinzătoare de învățare pe capitole cu navigare îmbunătățită în întregul repository.**

#### Adăugat
- **📚 Sistem de învățare pe capitole**: Restructurarea întregului curs în 8 capitole progresive
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Sistem de navigație cuprinzător**: Headere și footere de navigație consistente în toată documentația
- **🎯 Urmărirea progresului**: Listă de verificare pentru finalizarea cursului și sistem de verificare a învățării
- **🗺️ Ghid pentru traseul de învățare**: Puncte de intrare clare pentru diferite niveluri de experiență și obiective
- **🔗 Navigare cu referințe încrucișate**: Capitolele conexe și prerechizitele legate clar

#### Îmbunătățit
- **Structura README**: Transformată într-o platformă de învățare structurată cu organizare pe capitole
- **Navigare documentație**: Fiecare pagină include acum contextul capitolului și ghidarea progresului
- **Organizarea șabloanelor**: Exemplele și șabloanele mapate pe capitolele corespunzătoare
- **Integrarea resurselor**: Fișe de referință, FAQ și ghiduri de studiu conectate la capitole relevante
- **Integrare workshop**: Laboratoare practice mapate pe obiectivele de învățare din mai multe capitole

#### Modificat
- **Progresul în învățare**: Mutat de la documentație liniară la învățare flexibilă pe capitole
- **Plasarea configurației**: Ghidul de configurare repoziționat ca Capitolul 3 pentru un flux de învățare mai bun
- **Integrarea conținutului AI**: Conținutul specific AI integrat mai bine pe parcursul traseului de învățare
- **Conținut de producție**: Tiparele avansate consolidate în Capitolul 8 pentru cursanții enterprise

#### Îmbunătățit
- **Experiența utilizatorului**: Breadcrumbs de navigare clare și indicatori de progres pe capitole
- **Accesibilitate**: Modele de navigare consistente pentru parcurgerea ușoară a cursului
- **Prezentare profesională**: Structură de tip universitar, potrivită pentru training academic și corporate
- **Eficiența învățării**: Timp redus pentru găsirea conținutului relevant prin organizare îmbunătățită

#### Implementare tehnică
- **Headere de navigație**: Navigare standardizată pe capitole în 40+ fișiere de documentație
- **Footer de navigație**: Ghidare consistentă a progresului și indicatori de finalizare a capitolelor
- **Legături încrucișate**: Sistem de linking intern cuprinzător care leagă conceptele conexe
- **Mapare pe capitole**: Șabloane și exemple asociate clar cu obiectivele de învățare

#### Îmbunătățire ghid de studiu
- **📚 Obiective de învățare cuprinzătoare**: Ghidul de studiu restructurat pentru aliniere la sistemul de 8 capitole
- **🎯 Evaluare pe capitole**: Fiecare capitol include obiective de învățare și exerciții practice specifice
- **📋 Urmărirea progresului**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare
- **❓ Întrebări de evaluare**: Întrebări pentru validarea cunoștințelor pentru fiecare capitol cu rezultate profesionale
- **🛠️ Exerciții practice**: Activități hands-on cu scenarii reale de implementare și depanare
- **📊 Progresul competențelor**: Avans clar de la concepte de bază la tipare enterprise cu focus pe dezvoltare profesională
- **🎓 Cadru de certificare**: Rezultate de dezvoltare profesională și recunoaștere în comunitate
- **⏱️ Gestionarea timeline-ului**: Plan de învățare structurat pe 10 săptămâni cu validare a milestone-urilor

### [v3.1.0] - 2025-09-17

#### Soluții Multi-Agent AI îmbunătățite
**Această versiune îmbunătățește soluția multi-agent pentru retail cu denumiri mai clare ale agenților și documentație îmbunătățită.**

#### Modificat
- **Terminologie Multi-Agent**: Înlocuit "Cora agent" cu "Customer agent" în întreaga soluție multi-agent pentru retail pentru o mai bună claritate
- **Arhitectura agenților**: Actualizate toate documentațiile, șabloanele ARM și exemplele de cod pentru a folosi denumirea consecventă "Customer agent"
- **Exemple de configurare**: Modernizate tiparele de configurare a agenților cu convenții de denumire actualizate
- **Consistența documentației**: Asigurată utilizarea unor denumiri profesionale și descriptive pentru agenți

#### Îmbunătățit
- **ARM Template Package**: Actualizat retail-multiagent-arm-template cu referințe la agentul Customer
- **Architecture Diagrams**: Diagrame Mermaid reîmprospătate cu denumiri de agenți actualizate
- **Code Examples**: Clasele Python și exemplele de implementare folosesc acum denumirea CustomerAgent
- **Environment Variables**: Actualizate toate scripturile de implementare pentru a folosi convențiile CUSTOMER_AGENT_NAME

#### Improved
- **Developer Experience**: Roluri și responsabilități ale agenților mai clare în documentație
- **Production Readiness**: Aliniere mai bună cu convențiile de denumire enterprise
- **Learning Materials**: Denumire a agenților mai intuitivă pentru scopuri educaționale
- **Template Usability**: Înțelegere simplificată a funcțiilor agenților și a modelelor de implementare

#### Technical Details
- Diagramele architecture Mermaid actualizate cu referințe CustomerAgent
- S-au înlocuit numele claselor CoraAgent cu CustomerAgent în exemplele Python
- Modificat fișierele de configurare JSON ale ARM template pentru a folosi tipul de agent "customer"
- Actualizate variabilele de mediu din CORA_AGENT_* în modele CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurațiile containerelor

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Această versiune transformă repository-ul într-o resursă de învățare cuprinzătoare axată pe AI, cu integrare Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Restructurare completă prioritizând dezvoltatorii și inginerii AI
- **Microsoft Foundry Integration Guide**: Documentație cuprinzătoare pentru conectarea AZD cu serviciile Microsoft Foundry
- **AI Model Deployment Patterns**: Ghid detaliat care acoperă selecția modelelor, configurarea și strategiile de implementare în producție
- **AI Workshop Lab**: Atelier practic de 2-3 ore pentru conversia aplicațiilor AI în soluții deployabile cu AZD
- **Production AI Best Practices**: Tipare pregătite pentru întreprindere pentru scalare, monitorizare și securizare a încărcărilor AI
- **AI-Specific Troubleshooting Guide**: Ghid de depanare complet pentru Microsoft Foundry Models, Cognitive Services și probleme de implementare AI
- **AI Template Gallery**: Colecție selectă de șabloane Microsoft Foundry cu ratinguri de complexitate
- **Workshop Materials**: Structură completă pentru atelier cu laboratoare practice și materiale de referință

#### Enhanced
- **README Structure**: Axat pe dezvoltatorii AI cu 45% date de interes comunitar din Microsoft Foundry Discord
- **Learning Paths**: Parcurs dedicat dezvoltatorilor AI alături de parcursurile tradiționale pentru studenți și ingineri DevOps
- **Template Recommendations**: Șabloane AI recomandate, inclusiv azure-search-openai-demo, contoso-chat și openai-chat-app-quickstart
- **Community Integration**: Suport comunitar Discord îmbunătățit cu canale și discuții specifice AI

#### Security & Production Focus
- **Managed Identity Patterns**: Configurații de autentificare și securitate specifice AI
- **Cost Optimization**: Urmărire a utilizării tokenilor și controale bugetare pentru încărcările AI
- **Multi-Region Deployment**: Strategii pentru implementarea globală a aplicațiilor AI
- **Performance Monitoring**: Metrici specifice AI și integrare Application Insights

#### Documentation Quality
- **Linear Course Structure**: Progresie logică de la începător la modele avansate de implementare AI
- **Validated URLs**: Toate linkurile externe către repository verificate și accesibile
- **Complete Reference**: Toate linkurile interne din documentație validate și funcționale
- **Production Ready**: Tipare de implementare pentru întreprindere cu exemple din lumea reală

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Această versiune reprezintă o reorganizare semnificativă a structurii repository-ului și a prezentării conținutului.**

#### Added
- **Structured Learning Framework**: Toate paginile de documentație includ acum secțiunile Introducere, Obiective de învățare și Rezultatele învățării
- **Navigation System**: Adăugate linkuri Previous/Next lesson pe toate paginile documentației pentru o progresie ghidată în învățare
- **Study Guide**: study-guide.md cuprinzător cu obiective de învățare, exerciții practice și materiale de evaluare
- **Professional Presentation**: Eliminat toate pictogramele emoji pentru o accesibilitate și o apariție profesională îmbunătățite
- **Enhanced Content Structure**: Organizare și flux îmbunătățite ale materialelor de învățare

#### Changed
- **Documentation Format**: Standardizat toate documentele cu o structură consecventă axată pe învățare
- **Navigation Flow**: Implementat o progresie logică prin toate materialele de învățare
- **Content Presentation**: Eliminat elementele decorative în favoarea unei formatare clare și profesionale
- **Link Structure**: Actualizate toate linkurile interne pentru a susține noul sistem de navigație

#### Improved
- **Accessibility**: Eliminat dependențele de emoji pentru o compatibilitate mai bună cu cititoarele de ecran
- **Professional Appearance**: Prezentare curată, stil academic, potrivită pentru învățare la nivel enterprise
- **Learning Experience**: Abordare structurată cu obiective și rezultate clare pentru fiecare lecție
- **Content Organization**: Flux logic îmbunătățit și conexiune mai bună între subiectele conexe

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Serie completă de ghiduri getting-started
  - Documentație cuprinzătoare pentru implementare și provisioning
  - Resurse detaliate de depanare și ghiduri de debugging
  - Instrumente și proceduri de validare pre-implementare

- **Getting Started Module**
  - AZD Basics: Concepte de bază și terminologie
  - Installation Guide: Instrucțiuni de configurare specifice platformei
  - Configuration Guide: Configurare mediu și autentificare
  - First Project Tutorial: Învățare practică, pas cu pas

- **Deployment and Provisioning Module**
  - Deployment Guide: Documentație completă a fluxului de lucru
  - Provisioning Guide: Infrastructure as Code cu Bicep
  - Cele mai bune practici pentru implementări în producție
  - Tipare arhitecturale multi-serviciu

- **Pre-deployment Validation Module**
  - Capacity Planning: Validarea disponibilității resurselor Azure
  - SKU Selection: Orientare cuprinzătoare pentru nivelurile de serviciu
  - Pre-flight Checks: Scripturi automate de validare (PowerShell și Bash)
  - Instrumente de estimare a costurilor și planificare a bugetului

- **Troubleshooting Module**
  - Probleme comune: Probleme frecvent întâlnite și soluțiile lor
  - Debugging Guide: Metodologii sistematice de depanare
  - Tehnici avansate de diagnostic și instrumente
  - Monitorizare și optimizare a performanței

- **Resources and References**
  - Command Cheat Sheet: Referință rapidă pentru comenzile esențiale
  - Glossary: Terminologie completă și definiții pentru acronime
  - FAQ: Răspunsuri detaliate la întrebări frecvente
  - Linkuri către resurse externe și conexiuni comunitare

- **Examples and Templates**
  - Exemplu de aplicație web simplă
  - Șablon pentru implementare site static
  - Configurare aplicație containerizată
  - Tipare de integrare a bazelor de date
  - Exemple de arhitectură microservicii
  - Implementări de funcții serverless

#### Features
- **Multi-Platform Support**: Ghiduri de instalare și configurare pentru Windows, macOS și Linux
- **Multiple Skill Levels**: Conținut conceput pentru studenți până la dezvoltatori profesioniști
- **Practical Focus**: Exemple practice și scenarii din lumea reală
- **Comprehensive Coverage**: De la concepte de bază la tipare enterprise avansate
- **Security-First Approach**: Cele mai bune practici de securitate integrate pe tot parcursul
- **Cost Optimization**: Orientări pentru implementări și gestionare a resurselor eficiente din punct de vedere al costurilor

#### Documentation Quality
- **Detailed Code Examples**: Exemple de cod practice și testate
- **Step-by-Step Instructions**: Ghiduri clare și acționabile
- **Comprehensive Error Handling**: Depanare pentru probleme frecvente
- **Best Practices Integration**: Standarde și recomandări din industrie
- **Version Compatibility**: Actualizat cu cele mai recente servicii Azure și funcționalități azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate
- **AI Agent Frameworks**: Șabloane pentru implementări LangChain, Semantic Kernel și AutoGen
- **Advanced RAG Patterns**: Opțiuni de baze de date vectoriale dincolo de Azure AI Search (Pinecone, Weaviate etc.)
- **AI Observability**: Monitorizare îmbunătățită pentru performanța modelelor, utilizarea tokenilor și calitatea răspunsurilor

#### Developer Experience
- **VS Code Extension**: Experiență integrată de dezvoltare AZD + Microsoft Foundry în VS Code
- **GitHub Copilot Integration**: Generare asistată de AI pentru șabloane AZD
- **Interactive Tutorials**: Exerciții practice cu validare automată pentru scenarii AI
- **Video Content**: Tutoriale video suplimentare pentru cursanții vizuali, axate pe implementări AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Guvernanță modele AI, conformitate și urme de audit
- **Multi-Tenant AI**: Tipare pentru servirea mai multor clienți cu servicii AI izolate
- **Edge AI Deployment**: Integrare cu Azure IoT Edge și instanțe containerizate
- **Hybrid Cloud AI**: Tipare de implementare multi-cloud și hibride pentru încărcări AI

#### Advanced Features
- **AI Pipeline Automation**: Integrare MLOps cu pipeline-uri Azure Machine Learning
- **Advanced Security**: Tipare zero-trust, endpoint-uri private și protecție avansată împotriva amenințărilor
- **Performance Optimization**: Reglaje avansate și strategii de scalare pentru aplicații AI cu volum mare
- **Global Distribution**: Livrare de conținut și modele de caching la margine pentru aplicații AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Integrare Microsoft Foundry cuprinzătoare (Complet)
- ✅ **Interactive Tutorials**: Atelier practic AI (Complet)
- ✅ **Advanced Security Module**: Tipare de securitate specifice AI (Complet)
- ✅ **Performance Optimization**: Strategii de reglare pentru încărcări AI (Complet)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Scenarii de implementare axate pe AI (Complet)
- ✅ **Extended FAQ**: Întrebări frecvente și depanare specifice AI (Complet)
- **Tool Integration**: Ghiduri de integrare îmbunătățite pentru IDE și editoare
- ✅ **Monitoring Expansion**: Monitorizare și alertare specifică AI (Complet)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Design receptiv pentru învățare pe mobil
- **Offline Access**: Pachete de documentație descărcabile
- **Enhanced IDE Integration**: Extensie VS Code pentru fluxuri de lucru AZD + AI
- **Community Dashboard**: Metrici în timp real pentru comunitate și urmărirea contribuțiilor

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Ultima versiune majoră**: Suport complet cu actualizări regulate
- **Versiunea majoră anterioară**: Actualizări de securitate și remedieri critice timp de 12 luni
- **Versiuni vechi**: Doar suport din partea comunității, fără actualizări oficiale

### Ghid de migrare
When major versions are released, we provide:
- **Ghiduri de migrare**: Instrucțiuni pas cu pas pentru tranziție
- **Note de compatibilitate**: Detalii despre modificările incompatibile
- **Suport pentru instrumente**: Scripturi sau utilitare pentru a ajuta la migrare
- **Suport comunitar**: Forumuri dedicate pentru întrebări legate de migrare

---

**Navigare**
- **Lecția anterioară**: [Ghid de studiu](resources/study-guide.md)
- **Lecția următoare**: Întoarceți-vă la [README principal](README.md)

**Rămâneți la curent**: Urmăriți acest depozit pentru notificări despre noi versiuni și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa oficială. Pentru informații critice, se recomandă o traducere profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite care apar din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
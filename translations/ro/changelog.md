# Changelog - AZD Pentru Începători

## Introducere

Acest changelog documentează toate schimbările notabile, actualizările și îmbunătățirile din depozitul AZD Pentru Începători. Urmăm principiile versionării semantice și menținem acest jurnal pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de învățare

Prin revizuirea acestui changelog, veți:
- Rămâne informat despre noi caracteristici și adăugiri de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Urmări corecturile de erori pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare de-a lungul timpului

## Rezultate de învățare

După revizuirea intrărilor din changelog, veți putea:
- Identifica conținut nou și resurse disponibile pentru învățare
- Înțelege care secțiuni au fost actualizate sau îmbunătățite
- Planifica calea de învățare bazându-vă pe cele mai actuale materiale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul versiunilor

### [v3.18.0] - 2026-03-16

#### Comenzi AZD AI CLI, Validare Conținut & Expansiune Șabloane  
**Această versiune adaugă acoperirea comenzilor `azd ai`, `azd extension` și `azd mcp` în toate capitolele legate de AI, repară linkuri rupte și cod depreciat în agents.md, actualizează foaia de înșelăciuni și reface complet secțiunea Exemple Șabloane cu descrieri validate și noi șabloane Azure AI AZD.**

#### Adăugat
- **🤖 Acoperire AZD AI CLI** în 7 fișiere (anterior doar în Capitolul 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Secțiune nouă „Extensions and AI Commands” care introduce `azd extension`, `azd ai agent init` și `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opțiunea 4: `azd ai agent init` cu tabel comparativ (șablon vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecțiunile „AZD Extensions for Foundry” și „Agent-First Deployment”
  - `docs/chapter-05-multi-agent/README.md` — Start rapid care arată ambele căi de implementare pe bază de șablon și manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secțiunea Deploy include acum opțiunea `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecțiunea „AZD AI Extension Commands for Diagnostics”
  - `resources/cheat-sheet.md` — Secțiune nouă „AI & Extensions Commands” cu `azd extension`, `azd ai agent init`, `azd mcp` și `azd infra generate`
- **📦 Noi șabloane exemplu AZD AI** în `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET cu Blazor WebAssembly, Semantic Kernel și suport voce
  - **azure-search-openai-demo-java** — Chat RAG Java folosind Langchain4J cu opțiuni de implementare ACA/AKS
  - **contoso-creative-writer** — Aplicație multi-agent de scriere creativă folosind Azure AI Agent Service, Bing Grounding și Prompty
  - **serverless-chat-langchainjs** — RAG serverless folosind Azure Functions + LangChain.js + Cosmos DB cu suport Ollama local dev
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG Enterprise cu portal admin, integrare Teams și opțiuni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicație de referință de orchestrare multi-agent MCP cu servere în .NET, Python, Java și TypeScript
  - **azd-ai-starter** — Șablon minimal infrastructură Azure AI Bicep pentru început
  - **🔗 Legătură galerie Awesome AZD AI** — Referință la [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (peste 80 de șabloane)

#### Reparat
- **🔗 Navigare agents.md**: Linkurile Anterior/Următor corespund acum ordinii lecțiilor din README Capitolul 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Linkuri rupte agents.md**: `production-ai-practices.md` corectat în `../chapter-08-production/production-ai-practices.md` (3 apariții)
- **📦 Cod depreciat agents.md**: Înlocuit `opencensus` cu `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API invalid agents.md**: Mutat `max_tokens` din `create_agent()` în `create_run()` ca `max_completion_tokens`
- **🔢 Numărare tokeni agents.md**: Estimarea brută `len//4` înlocuită cu `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corectează serviciile de la „Cognitive Search + App Service” la „Azure AI Search + Azure Container Apps” (host implicit schimbat oct 2024)
- **contoso-chat**: Descriere actualizată pentru a face referire la Azure AI Foundry + Prompty, corespunde titlului și tehnologiei depozitului

#### Eliminat
- **ai-document-processing**: Eliminată referința la șablon nefuncțional (depozit neaccesibil public ca șablon AZD)

#### Îmbunătățit
- **📝 Exerciții agents.md**: Exercițiul 1 arată output așteptat și pasul `azd monitor`; Exercițiul 2 include codul complet de înregistrare pentru `FunctionTool`; Exercițiul 3 înlocuiește indicații vagi cu comenzi clare `prepdocs.py`
- **📚 Resurse agents.md**: Linkuri actualizate la documentația curentă Azure AI Agent Service și quickstart
- **📋 Tabel pași următori agents.md**: Adăugat link AI Workshop Lab pentru acoperire completă a capitolului

#### Fișiere actualizate
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Îmbunătățire Navigare în Curs  
**Această versiune îmbunătățește navigarea capitolelor în README.md cu un format tabelar îmbunătățit.**

#### Modificat
- **Tabel Hartă Curs**: Îmbunătățit cu linkuri directe către lecții, estimări durate și ratinguri de complexitate  
- **Curățare Foldere**: Eliminare foldere vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **Validare Linkuri**: Verificate toate cele peste 21 de linkuri interne din tabelul Hărții Cursului

### [v3.16.0] - 2026-02-05

#### Actualizări Nume Produse  
**Această versiune actualizează referințe la produse conform brandului curent Microsoft.**

#### Modificat
- **Microsoft Foundry → Microsoft Foundry**: Toate referințele actualizate în fișiere non-traducere  
- **Azure AI Agent Service → Foundry Agents**: Numele serviciului actualizat conform brandului curent

#### Fișiere actualizate
- `README.md` - Pagina principală a cursului  
- `changelog.md` - Istoricul versiunilor  
- `course-outline.md` - Structura cursului  
- `docs/chapter-02-ai-development/agents.md` - Ghid agenți AI  
- `examples/README.md` - Documentație exemple  
- `workshop/README.md` - Pagina principală Workshop  
- `workshop/docs/index.md` - Index Workshop  
- `workshop/docs/instructions/*.md` - Toate fișierele de instrucțiuni workshop

---

### [v3.15.0] - 2026-02-05

#### Restructurare Majoră Depozit: Foldere pe Capitole  
**Această versiune restructurează documentația în foldere dedicate pe capitole pentru navigare mai clară.**

#### Redenumiri Foldere  
Foldere vechi înlocuite cu foldere numerotate pe capitole:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- Adăugat nou: `docs/chapter-05-multi-agent/`

#### Migrații Fișiere  
| Fișier | Din | În |
|--------|-----|----|
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
| Toate fișierele pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Toate fișierele troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adăugat
- **📚 Fișiere README Capitol**: Creat README.md în fiecare folder capitol cu:
  - Obiective de învățare și durată  
  - Tabel lecții cu descrieri  
  - Comenzi start rapid  
  - Navigare către alte capitole

#### Modificat
- **🔗 Actualizate toate linkurile interne**: Peste 78 de căi modificate în toate fișierele de documentație  
- **🗺️ README.md principal**: Harta cursului actualizată cu noua structură pe capitole  
- **📝 examples/README.md**: Referințe încrucișate actualizate către folderele capitolelor

#### Eliminat
- Structura veche de foldere (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructurare Depozit: Navigare pe Capitole  
**Această versiune a adăugat fișiere README pentru navigare pe capitole (înlocuite de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ghid Nou pentru Agenți AI  
**Această versiune adaugă un ghid complet pentru implementarea agenților AI cu Azure Developer CLI.**

#### Adăugat
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet care acoperă:
  - Ce sunt agenții AI și cum diferă de chatbots  
  - Trei șabloane quick-start pentru agenți (Foundry Agents, Prompty, RAG)  
  - Modele arhitecturale pentru agenți (agent unic, RAG, multi-agent)  
  - Configurare instrumente și personalizare  
  - Monitorizare și urmărire metrici  
  - Considerații și optimizare costuri  
  - Scenarii comune de depanare  
  - Trei exerciții practice cu criterii de succes

#### Structura conținutului
- **Introducere**: Concepte agent pentru începători  
- **Start rapid**: Deplasează agenți cu `azd init --template get-started-with-ai-agents`  
- **Modele Arhitecturale**: Diagrame vizuale ale modelului agenților  
- **Configurație**: Setup-un instrumentelor și variabile de mediu  
- **Monitorizare**: Integrare Application Insights  
- **Exerciții**: Învățare practică progresivă (20-45 minute fiecare)

---

### [v3.12.0] - 2026-02-05

#### Actualizare Mediu DevContainer  
**Această versiune actualizează configurația containerului de dezvoltare cu instrumente moderne și setări implicite mai bune pentru experiența AZD de învățare.**

#### Modificat
- **🐳 Imagine Bază**: Actualizată de la `python:3.12-bullseye` la `python:3.12-bookworm` (ultima versiune stabilă Debian)  
- **📛 Nume Container**: Redenumit de la „Python 3” la „AZD for Beginners” pentru claritate

#### Adăugat
- **🔧 Funcționalități noi în Dev Container**:
  - `azure-cli` cu suport pentru Bicep activat
  - `node:20` (versiunea LTS pentru template-urile AZD)
  - `github-cli` pentru gestionarea template-urilor
  - `docker-in-docker` pentru implementările aplicațiilor containerizate

- **🔌 Redirecționare porturi**: Porturi preconfigurate pentru dezvoltare comună:
  - 8000 (previzualizare MkDocs)
  - 3000 (aplicații web)
  - 5000 (Python Flask)
  - 8080 (API-uri)

- **🧩 Extensii noi VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python îmbunătățit
  - `ms-azuretools.vscode-azurefunctions` - suport pentru Azure Functions
  - `ms-azuretools.vscode-docker` - suport Docker
  - `ms-azuretools.vscode-bicep` - suport limbaj Bicep
  - `ms-azure-devtools.azure-resource-groups` - gestionarea resurselor Azure
  - `yzhang.markdown-all-in-one` - editare Markdown
  - `DavidAnson.vscode-markdownlint` - lintare Markdown
  - `bierner.markdown-mermaid` - suport diagrame Mermaid
  - `redhat.vscode-yaml` - suport YAML (pentru azure.yaml)
  - `eamodio.gitlens` - vizualizare Git
  - `mhutchie.git-graph` - istoric Git

- **⚙️ Setări VS Code**: Setări implicite adăugate pentru interpret Python, formatare la salvare și eliminarea spațiilor albe

- **📦 requirements-dev.txt actualizat**:
  - Plugin MkDocs minify adăugat
  - Pre-commit pentru calitatea codului adăugat
  - Pachete Azure SDK adăugate (azure-identity, azure-mgmt-resource)

#### Remediat
- **Comandă Post-Create**: Acum verifică instalarea AZD și Azure CLI la pornirea containerului

---

### [v3.11.0] - 2026-02-05

#### Revizuire README Prietenoasă pentru Începători
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil pentru începători și adaugă resurse esențiale pentru dezvoltatorii AI.**

#### Adăugat
- **🆚 Comparație Azure CLI vs AZD**: Explicație clară despre când să folosești fiecare instrument cu exemple practice
- **🌟 Linkuri Awesome AZD**: Linkuri directe către galeria comunității de template-uri și resurse de contribuție:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - peste 200 de template-uri gata de implementare
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - contribuții comunitare
- **🎯 Ghid Start Rapid**: Secțiune simplificată de 3 pași pentru început (Instalează → Autentifică-te → Implementare)
- **📊 Tabel de Navigare Bazat pe Experiență**: Ghid clar unde să începi în funcție de nivelul de experiență

#### Modificat
- **Structura README**: Reorganizată pentru dezvăluire progresivă – informații cheie primele
- **Secțiunea Introducere**: Rescrisă pentru a explica „Magia `azd up`” pentru începători desăvârșiți
- **Eliminat Conținut Duplicat**: Secțiunea de depanare duplicată eliminată
- **Comenzi Depanare**: Referința `azd logs` înlocuită cu comanda validă `azd monitor --logs`

#### Remediat
- **🔐 Comenzi Autentificare**: Adăugate `azd auth login` și `azd auth logout` în cheat-sheet.md
- **Referințe comenzi invalide**: Eliminat restul aparițiilor `azd logs` din secțiunea depanare README

#### Note
- **Domeniu**: Modificările aplicate în principal în README.md și resources/cheat-sheet.md
- **Public țintă**: Îmbunătățiri adresate în special dezvoltatorilor noi la AZD

---

### [v3.10.0] - 2026-02-05

#### Actualizare Precizie Comenzi Azure Developer CLI
**Această versiune corectează comenzile inexistente AZD în documentație, asigurând că toate exemplele folosesc sintaxa validă Azure Developer CLI.**

#### Remediat
- **🔧 Comenzi AZD Inexistente Eliminat**: Audit și corectare completă a comenzilor invalide:
  - `azd logs` (nu există) → înlocuit cu `azd monitor --logs` sau alternative Azure CLI
  - Subcomenzi `azd service` (nu există) → înlocuite cu `azd show` și Azure CLI
  - `azd infra import/export/validate` (nu există) → eliminate sau înlocuite
  - Flag-uri pentru `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nu există) → eliminate
  - Flag-uri `azd provision --what-if/--rollback` (nu există) → actualizate să folosească `--preview`
  - `azd config validate` (nu există) → înlocuit cu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nu există) → eliminate

- **📚 Fișiere Actualizate cu Corecții ale Comenzilor**:
  - `resources/cheat-sheet.md`: Revizuire majoră a referințelor de comandă
  - `docs/deployment/deployment-guide.md`: Corectate strategii de rollback și implementare
  - `docs/troubleshooting/debugging.md`: Corectat secțiuni de analiză loguri
  - `docs/troubleshooting/common-issues.md`: Actualizare comenzi depanare
  - `docs/troubleshooting/ai-troubleshooting.md`: Rectificat secțiunea depanare AZD
  - `docs/getting-started/azd-basics.md`: Comenzi monitorizare corectate
  - `docs/getting-started/first-project.md`: Exemple de monitorizare și depanare actualizate
  - `docs/getting-started/installation.md`: Corectate exemple de ajutor și versiune
  - `docs/pre-deployment/application-insights.md`: Corectate comenzi vizualizare loguri
  - `docs/pre-deployment/coordination-patterns.md`: Comenzi depanare agent corectate

- **📝 Referință versiune actualizată**:
  - `docs/getting-started/installation.md`: Versiunea hardcodata `1.5.0` schimbată în generic `1.x.x` cu link către releases

#### Modificat
- **Strategii Rollback**: Documentația actualizată să utilizeze rollback pe bază de Git (AZD nu are rollback nativ)
- **Vizualizare loguri**: Referințe `azd logs` înlocuite cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI
- **Secțiunea Performanță**: Eliminat flag-urile inexistente de implementare paralelă/incrementală, oferind alternative valide

#### Detalii Tehnice
- **Comenzi AZD valide**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag-uri azd monitor valide**: `--live`, `--logs`, `--overview`
- **Funcționalități eliminate**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verificare**: Comenzile validate cu Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalizare Workshop și Actualizare Calitate Documentație
**Această versiune finalizează modulele interactive ale workshop-ului, repară toate linkurile întrerupte în documentație și îmbunătățește calitatea conținutului pentru dezvoltatorii AI folosind Microsoft AZD.**

#### Adăugat
- **📝 CONTRIBUTING.md**: Document nou cu ghiduri de contribuție cu:
  - Instrucțiuni clare pentru raportare erori și propuneri schimbări
  - Standarde documentație pentru conținut nou
  - Ghiduri pentru exemple de cod și convenții mesaje commit
  - Informații pentru implicare comunitară

#### Finalizat
- **🎯 Modulul Workshop 7 (Încheiere)**: Modul de încheiere complet cu:
  - Rezumat cuprinzător al realizărilor workshop-ului
  - Secțiune cu concepte-cheie stăpânite despre AZD, template-uri și Microsoft Foundry
  - Recomandări pentru continuarea parcursului de învățare
  - Exerciții provocare de workshop cu nivele de dificultate
  - Feedback comunitar și linkuri suport

- **📚 Modulul Workshop 3 (Deconstruire)**: Obiectivele învățării actualizate cu:
  - Ghid activare GitHub Copilot cu servere MCP
  - Înțelegerea structurii folderelor template AZD
  - Modele organizare infrastructură ca cod (Bicep)
  - Instrucțiuni pentru laborator practică

- **🔧 Modulul Workshop 6 (Demontare)**: Finalizat cu:
  - Obiective de curățare resurse și gestiune costuri
  - Utilizare `azd down` pentru deprovisionare sigură a infrastructurii
  - Ghid recuperare servicii cognitive șterse soft
  - Sugestii bonus explorare GitHub Copilot și Azure Portal

#### Remediat
- **🔗 Reparare Linkuri Întrerupte**: Rezolvat peste 15 linkuri interne rupte:
  - `docs/ai-foundry/ai-model-deployment.md`: Corectate căi către microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectate căi către ai-model-deployment.md și production-ai-practices.md
  - `docs/getting-started/first-project.md`: Înlocuit cicd-integration.md inexistent cu deployment-guide.md
  - `examples/retail-scenario.md`: Corectate căi către FAQ și ghid depanare
  - `examples/container-app/microservices/README.md`: Corectate căi către home curs și ghid implementare
  - `resources/faq.md` și `resources/glossary.md`: Actualizate referințe capitole AI
  - `course-outline.md`: Fixat referințe instructor guia și laboratoare workshop AI

- **📅 Banner Status Workshop**: Actualizat din „În construcție” în status workshop activ cu data februarie 2026

- **🔗 Navigare Workshop**: Reparat linkuri de navigare rupte în README.md workshop direcționând spre folder lab-1-azd-basics inexistent

#### Modificat
- **Prezentare Workshop**: Eliminat avertismentul „în construcție”, workshop-ul este complet și gata de utilizare
- **Consistență Navigare**: Asigurată navigare adecvată între module și capitole
- **Referințe Parcurs Învățare**: Actualizat referințele capitolelor spre căi corecte microsoft-foundry

#### Validat
- ✅ Toate fișierele markdown în engleză au linkuri interne valide
- ✅ Modulele workshop 0-7 complete cu obiective de învățare
- ✅ Navigarea între capitole și module funcționează corect
- ✅ Conținut adecvat pentru dezvoltatori AI folosind Microsoft AZD
- ✅ Limbaj și structură prietenoasă pentru începători menținute
- ✅ CONTRIBUTING.md oferă ghid clar pentru comunitate

#### Implementare Tehnică
- **Validare Linkuri**: Script PowerShell automatizat a verificat toate linkurile interne .md
- **Audit Conținut**: Revizuire manuală a completitudinii workshop și potrivirea pentru începători
- **Sistem Navigare**: Aplicate pattern-uri de navigare consistente pentru capitole și module

#### Note
- **Domeniu**: Modificările aplicate numai în documentația în engleză
- **Traduceri**: Folderele de traduceri nu au fost actualizate în această versiune (sincronizare automată ulterioară)
- **Durata Workshop**: Workshop complet oferă acum 3-4 ore de învățare practică

---

### [v3.8.0] - 2025-11-19

#### Documentație Avansată: Monitorizare, Securitate și Modele Multi-Agent
**Această versiune adaugă lecții cuprinzătoare de nivel A despre integrarea Application Insights, modele de autentificare și coordonare multi-agent pentru implementări în producție.**

#### Adăugat
- **📊 Lecția Integrare Application Insights**: în `docs/pre-deployment/application-insights.md`:
  - Implementare axată pe AZD cu aprovizionare automată
  - Template-uri Bicep complete pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1.200 de linii)
  - Modele de monitorizare AI/LLM (urmărirea token-urilor/costurilor modele Microsoft Foundry)
  - 6 diagrame Mermaid (arhitectură, tracing distribuit, flux telemetrie)
  - 3 exerciții practice (alerte, dashboard-uri, monitorizare AI)
  - Exemple de interogări Kusto și strategii optimizare costuri
  - Streaming metrici live și depanare în timp real
  - Timp de învățare 40-50 minute cu modele gata pentru producție

- **🔐 Lecția Modele Autentificare & Securitate**: în `docs/getting-started/authsecurity.md`:
  - 3 modele de autentificare (string-uri conexiune, Key Vault, identitate gestionată)
  - Template-uri complete infrastrctură Bicep pentru implementări securizate
  - Cod aplicație Node.js cu integrare Azure SDK
  - 3 exerciții complete (activare identitate gestionată, identitate atribuită utilizator, rotație Key Vault)
  - Practici recomandate de securitate și configurări RBAC
  - Ghid depanare și analiză costuri
  - Modele autentificare passwordless gata pentru producție

- **🤖 Lecția Modele Coordonare Multi-Agent**: în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (secvențial, paralel, ierarhic, bazat pe evenimente, consens)
  - Implementare completă serviciu orhestrator (Python/Flask, peste 1.500 de linii)
  - 3 implementări specializate agent (Cercetare, Scriitor, Editor)
  - Integrare Service Bus pentru mesagerie
  - Gestionare stare Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid cu interacțiuni agenți
  - 3 exerciții avansate (gestionare timeout, logică retry, circuit breaker)
  - Analiză costuri (240-565$/lună) cu strategii optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățit
- **Capitol Pre-implementare**: Acum include modele complete de monitorizare și coordonare
- **Capitol Începutul parcursului**: Îmbunătățit cu modele profesionale de autentificare
- **Pregătire pentru Producție**: Acoperire completă de la securitate la observabilitate
- **Structura Cursului**: Actualizată cu referințe către noile lecții din Capitolele 3 și 6

#### Modificat
- **Progresie Învățare**: Integrare mai bună a securității și monitorizării pe tot parcursul cursului
- **Calitatea Documentației**: Standard consistent de nivel A (95-97%) pentru lecțiile noi
- **Modele pentru Producție**: Acoperire completă end-to-end pentru implementări enterprise

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Cale clară de la dezvoltare la monitorizarea în producție
- **Standarde de Securitate**: Modele profesionale pentru autentificare și gestionarea secretelor
- **Observabilitate**: Integrare completă Application Insights cu AZD
- **Sarcini AI**: Monitorizare specializată pentru Microsoft Foundry Models și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile includ cod complet funcțional (nu fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 total în 3 lecții)
- ✅ Exercitii practice cu pași de verificare (9 total)
- ✅ Șabloane Bicep gata de producție, implementabile prin `azd up`
- ✅ Analiza costurilor și strategii de optimizare
- ✅ Ghiduri de depanare și bune practici
- ✅ Puncte de verificare a cunoștințelor cu comenzi de verificare

#### Rezultatele evaluării documentației
- **docs/pre-deployment/application-insights.md**: - Ghid complet pentru monitorizare
- **docs/getting-started/authsecurity.md**: - Modele profesionale de securitate
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent
- **Conținut Nou General**: - Standard înalt de calitate consecventă

#### Implementare tehnică
- **Application Insights**: Log Analytics + telemetrie personalizată + trasabilitate distribuită
- **Autentificare**: Identitate gestionată + Key Vault + modele RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare**: Metrici live + interogări Kusto + alerte + panouri
- **Managementul costurilor**: Strategii de probare, politici de retenție, controale de buget

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri ale calității documentației și exemplu nou Microsoft Foundry Models
**Această versiune îmbunătățește calitatea documentației în întregul depozit și adaugă un exemplu complet de implementare Microsoft Foundry Models cu interfață chat gpt-4.1.**

#### Adăugat
- **🤖 Exemplu Chat Microsoft Foundry Models**: Implementare completă gpt-4.1 lucrătoare în `examples/azure-openai-chat/`:
  - Infrastructură completă Microsoft Foundry Models (implementare model gpt-4.1)
  - Interfață chat Python de linie de comandă cu istoric de conversații
  - Integrare Key Vault pentru stocarea securizată a cheilor API
  - Monitorizare consum tokeni și estimare costuri
  - Limitare rată și tratare erori
  - README cu ghid complet de implementare de 35-45 minute
  - 11 fișiere gata de producție (șabloane Bicep, aplicație Python, configurare)
- **📚 Exerciții de documentație**: Adăugate exerciții practice în ghidul de configurare:
  - Exercitiul 1: Configurare multi-mediu (15 minute)
  - Exercitiul 2: Practică de gestionare a secretelor (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare implementare**: Adăugată secțiune de verificare în ghidul de implementare:
  - Proceduri verificare sănătate
  - Lista criteriilor de succes
  - Rezultate așteptate pentru toate comenzile de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățit
- **examples/README.md**: Actualizat la calitate de nivel A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Numărare exemple locale actualizată de la 3 la 4
  - Adăugat în tabelul Exemplilor de Aplicații AI
  - Integrat în Start Rapid pentru utilizatori intermediari
  - Adăugat în secțiunea Șabloane Microsoft Foundry
  - Actualizate matricea de comparație și secțiunile de tehnologii
- **Calitatea documentației**: Îmbunătățită B+ (87%) → A- (92%) în folderul docs:
  - Adăugate rezultate așteptate pentru comenzile critice
  - Incluse pași de verificare pentru modificări de configurare
  - Învățare practică îmbunătățită cu exerciții aplicate

#### Modificat
- **Progresul în învățare**: Integrare mai bună a exemplelor AI pentru utilizatori intermediari
- **Structura documentației**: Exerciții mai aplicabile cu rezultate clare
- **Proces de verificare**: Criterii explicite de succes adăugate fluxurilor cheie

#### Îmbunătățit
- **Experiența dezvoltatorului**: Implementarea Microsoft Foundry Models acum durează 35-45 minute (vs 60-90 pentru alternative complexe)
- **Transparența costurilor**: Estimări clare ale costurilor (50-200$/lună) pentru exemplul Microsoft Foundry Models
- **Calea de învățare**: Dezvoltatorii AI au un punct de intrare clar cu azure-openai-chat
- **Standardele documentației**: Rezultate așteptate și pași de verificare consecvenți

#### Validat
- ✅ Exemplul Microsoft Foundry Models complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere de implementare corecte sintactic
- ✅ Instrucțiunile README corespund experienței reale de implementare
- ✅ Link-uri de documentație actualizate în peste 8 locații
- ✅ Indexul de exemple reflectă corect 4 exemple locale
- ✅ Fără link-uri externe duplicate în tabele
- ✅ Toate referințele de navigare corecte

#### Implementare tehnică
- **Arhitectura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps
- **Securitate**: Identitate gestionată pregătită, secrete în Key Vault
- **Monitorizare**: Integrare Application Insights
- **Management costuri**: Monitorizare tokeni și optimizare consum
- **Implementare**: O singură comandă `azd up` pentru configurare completă

### [v3.6.0] - 2025-11-19

#### Actualizare majoră: Exemple de implementare Container App
**Această versiune introduce exemple cuprinzătoare gata de producție pentru implementarea aplicațiilor containerizate folosind Azure Developer CLI (AZD), cu documentație completă și integrare în calea de învățare.**

#### Adăugat
- **🚀 Exemple Container App**: Exemple noi locale în `examples/container-app/`:
  - [Ghidul Principal](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, pornire rapidă, producție, și modele avansate
  - [API Flask Simplu](../../examples/container-app/simple-flask-api): API REST ușor pentru începători cu scale-to-zero, probe de sănătate, monitorizare și depanare
  - [Arhitectură Microservicii](../../examples/container-app/microservices): Implementare multi-serviciu gata de producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, trasabilitate distribuită, implementări blue-green/canary
- **Bune Practici**: Securitate, monitorizare, optimizare costuri și ghiduri CI/CD pentru sarcini containerizate
- **Mostre de cod**: `azure.yaml` complet, șabloane Bicep și implementări multi-limbaj (Python, Node.js, C#, Go)
- **Testare & depanare**: Scenarii de test end-to-end, comenzi monitorizare, ghiduri depanare

#### Modificat
- **README.md**: Actualizat pentru a evidenția noile exemple container app în secțiunea „Exemple locale - Aplicații containerizate”
- **examples/README.md**: Actualizat pentru a evidenția exemplele container app, adăugat intrări în matricea de comparație și actualizat referințele tehnologice/arhitecturale
- **Structura cursului & ghid de studiu**: Actualizată pentru a face referințe la noile exemple container app și modele de implementare în capitole relevante

#### Validat
- ✅ Toate noile exemple implementabile cu `azd up` și respectă bunele practici
- ✅ Link-urile încrucișate și navigarea documentației actualizate
- ✅ Exemplele acoperă scenarii de la începători la avansați, incluiv microservicii de producție

#### Note
- **Domeniu**: Documentație și exemple doar în limba engleză
- **Pași următori**: Extindere cu modele avansate de containere și automatizare CI/CD în versiuni viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding produs: Microsoft Foundry
**Această versiune implementează schimbarea completă de denumire a produsului din „Microsoft Foundry” în „Microsoft Foundry” în toată documentația în limba engleză, reflectând rebranding-ul oficial Microsoft.**

#### Modificat
- **🔄 Actualizare nume produs**: Rebranding complet de la „Microsoft Foundry” la „Microsoft Foundry”
  - Actualizate toate referințele din documentația în limba engleză din folderul `docs/`
  - Denumirea folderului schimbată: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fișier redenumit: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - În total: 23 referințe de conținut actualizate în 7 fișiere de documentație

- **📁 Modificări structură folder**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele încrucișate actualizate cu noua structură de foldere
  - Link-urile de navigare validate în toată documentația

- **📄 Redenumiri fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate link-urile interne actualizate cu noul nume de fișier

#### Fișiere actualizate
- **Documentația capitolelor** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări linkuri navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe nume produs actualizate
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - deja folosind Microsoft Foundry (din actualizări anterioare)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 linkuri încrucișate actualizate
  - `docs/getting-started/first-project.md` - 2 linkuri navigare capitol actualizate
  - `docs/getting-started/installation.md` - 2 linkuri capitol următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitate Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link navigare actualizat
  - `docs/troubleshooting/debugging.md` - 1 link navigare actualizat

- **Fișiere structură curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentare curs, titluri capitole, secțiune șabloane, perspective comunitate)
  - `course-outline.md` - 14 referințe actualizate (prezentare generală, obiective învățare, resurse capitole)

#### Validat
- ✅ Nicio referință rămasă la calea folderului „ai-foundry” în documentația engleză
- ✅ Nicio referință rămasă la denumirea produsului „Microsoft Foundry” în documentația engleză
- ✅ Toate link-urile de navigare funcționează cu noua structură de foldere
- ✅ Redenumirile fișierelor și folderelor finalizate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză din folderul `docs/`
- **Traduceri**: Folderele de traduceri (`translations/`) nu au fost actualizate în această versiune
- **Workshop**: Materialele workshop-ului (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele de exemplu pot conține încă denumiri vechi (vor fi actualizate în versiune viitoare)
- **Link-uri externe**: URL-urile externe și referințele GitHub rămân neschimbate

#### Ghid de migrare pentru contribuitori
Dacă aveți ramuri locale sau documentație care face referire la structura veche:
1. Actualizați referințele de folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizați referințele de fișiere: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți numele produsului: „Microsoft Foundry” → „Microsoft Foundry”
4. Verificați că toate linkurile interne din documentație funcționează în continuare

---

### [v3.4.0] - 2025-10-24

#### Previzualizare infrastructură și îmbunătățiri de validare
**Această versiune introduce suport complet pentru noua funcționalitate preview din Azure Developer CLI și îmbunătățește experiența utilizatorilor workshop-ului.**

#### Adăugat
- **🧪 Documentație funcționalitate azd provision --preview**: Acoperire completă a noii capacități de previzualizare a infrastructurii
  - Referință comenzi și exemple de utilizare în fișa de ajutor
  - Integrare detaliată în ghidul de provisioning cu cazuri de utilizare și beneficii
  - Integrare verificare pre-decolare pentru validare mai sigură a implementării
  - Actualizări ghid de început cu practici de implementare sigure
- **🚧 Banner status workshop**: Banner HTML profesional care indică stadiul dezvoltării workshop-ului
  - Design cu gradient și indicatori de construcție pentru comunicare clară cu utilizatorii
  - Marcă temporală de ultimă actualizare pentru transparență
  - Design responsive pentru toate tipurile de dispozitive

#### Îmbunătățit
- **Siguranța infrastructurii**: Funcționalitatea preview integrată pe tot parcursul documentației de implementare
- **Validare pre-implementare**: Script-urile automate includ acum testarea preview a infrastructurii
- **Flux de lucru dezvoltator**: Secvențele de comenzi actualizate pentru includerea preview ca bună practică
- **Experiență workshop**: Așteptări clare setate utilizatorilor despre stadiul de dezvoltare al conținutului

#### Modificat
- **Bune practici implementare**: Fluxul de lucru cu preview ca prim pas recomandat acum
- **Fluxul documentației**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentare workshop**: Comunicare profesională a stadiului cu timeline clar de dezvoltare

#### Îmbunătățit
- **Abordare orientată spre siguranță**: Modificările infrastructurii pot fi validate înainte de implementare
- **Colaborare echipă**: Rezultatele preview pot fi partajate pentru revizuire și aprobare
- **Conștientizarea costurilor**: Înțelegere mai bună a costurilor resurselor înainte de provisioning
- **Reducerea riscurilor**: Diminuarea eșecurilor de implementare prin validare prealabilă

#### Implementare tehnică
- **Integrare multiplă documente**: Funcționalitatea preview documentată în 4 fișiere cheie
- **Modele de comandă**: Sintaxă și exemple consistente în toată documentația
- **Integrare bune practici**: Preview inclus în fluxurile și scripturile de validare
- **Indicatori vizuali**: Marcaje clare de caracteristică NOUĂ pentru descoperire ușoară

#### Infrastructura workshop
- **Comunicare status**: Banner HTML profesional cu stilizare gradient
- **Experiența utilizatorului**: Status clar al dezvoltării previne confuzii
- **Prezentare profesională**: Menține credibilitatea depozitului și setează așteptări
- **Transparență timeline**: Marcă temporală octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale workshop îmbunătățite și experiență interactivă de învățare
**Această versiune introduce materiale complete pentru workshop cu ghiduri interactive bazate pe browser și trasee de învățare structurate.**

#### Adăugat
- **🎥 Ghid Interactiv pentru Atelier**: Experiență de atelier bazată pe browser cu capacitate de previzualizare MkDocs  
- **📝 Instrucțiuni Structurate pentru Atelier**: Parcurs ghidat de învățare în 7 pași de la descoperire la personalizare  
  - 0-Introducere: Prezentare generală a atelierului și configurare  
  - 1-Selectează-Șablon-AI: Proces de descoperire și selecție a șablonului  
  - 2-Validare-Șablon-AI: Proceduri de implementare și validare  
  - 3-Deconstruire-Șablon-AI: Înțelegerea arhitecturii șablonului  
  - 4-Configurare-Șablon-AI: Configurare și personalizare  
  - 5-Personalizare-Șablon-AI: Modificări avansate și iterări  
  - 6-Dezinstalare-Infrastructură: Curățare și gestionare a resurselor  
  - 7-Concluzie: Rezumat și pașii următori  
- **🛠️ Unelte pentru Atelier**: Configurare MkDocs cu tema Material pentru o experiență de învățare îmbunătățită  
- **🎯 Parcurs Practic de Învățare**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)  
- **📱 Integrare GitHub Codespaces**: Configurare facilă a mediului de dezvoltare  

#### Îmbunătățit  
- **Laborator Atelier AI**: Extins cu o experiență de învățare structurată de 2-3 ore  
- **Documentație Atelier**: Prezentare profesională cu navigare și suport vizual  
- **Progresul Învățării**: Ghid clar, pas cu pas, de la selecția șablonului până la implementarea în producție  
- **Experiența Dezvoltatorului**: Unelte integrate pentru fluxuri de dezvoltare simplificate  

#### Îmbunătățit  
- **Accesibilitate**: Interfață bazată pe browser cu funcții de căutare, copiere și comutare temă  
- **Învățare în Ritm Propriu**: Structură flexibilă a atelierului pentru ritmuri diferite de învățare  
- **Aplicabilitate Practică**: Scenarii reale de implementare a șabloanelor AI  
- **Integrare Comunitară**: Integrare Discord pentru suport și colaborare în atelier  

#### Funcții Atelier  
- **Căutare Integrată**: Găsire rapidă de cuvinte cheie și lecții  
- **Copiere Blocuri de Cod**: Funcționalitate hover-to-copy pentru toate exemplele de cod  
- **Comutare Temă**: Mod întunecat/deschis pentru preferințe diferite  
- **Resurse Vizuale**: Capturi de ecran și diagrame pentru o înțelegere aprofundată  
- **Integrare Ajutor**: Acces direct la Discord pentru suport comunitar  

### [v3.2.0] - 2025-09-17

#### Restructurare Majoră a Navigării și Sistem de Învățare pe Capitole  
**Această versiune introduce o structură cuprinzătoare de învățare pe capitole, cu navigare îmbunătățită în întregul depozit.**

#### Adăugat  
- **📚 Sistem de Învățare pe Capitole**: Restructurarea întregului curs în 8 capitole progresive  
  - Capitolul 1: Fundamente și Pornire Rapidă (⭐ - 30-45 min)  
  - Capitolul 2: Dezvoltare AI-First (⭐⭐ - 1-2 ore)  
  - Capitolul 3: Configurare & Autentificare (⭐⭐ - 45-60 min)  
  - Capitolul 4: Infrastructură ca și Cod & Implementare (⭐⭐⭐ - 1-1.5 ore)  
  - Capitolul 5: Soluții AI Multi-Agent (⭐⭐⭐⭐ - 2-3 ore)  
  - Capitolul 6: Validare & Planificare Pre-Implementare (⭐⭐ - 1 oră)  
  - Capitolul 7: Depanare & Debugging (⭐⭐ - 1-1.5 ore)  
  - Capitolul 8: Modele de Producție & Enterprise (⭐⭐⭐⭐ - 2-3 ore)  
- **📚 Sistem Complet de Navigare**: Antete și subsoluri consistente în toate documentațiile  
- **🎯 Monitorizare Progres**: Listă de verificare a finalizării cursului și sistem de verificare a învățării  
- **🗺️ Ghid pentru Parcursul de Învățare**: Puncte de intrare clare pentru diferite niveluri de experiență și obiective  
- **🔗 Navigare prin Referințe Înnodate**: Capitole conexe și prerechizite clar legate  

#### Îmbunătățit  
- **Structură README**: Transformată într-o platformă de învățare structurată pe capitole  
- **Navigare Documentație**: Fiecare pagină include contextul capitolului și ghidaj pentru progres  
- **Organizarea Șabloanelor**: Exemple și șabloane alocate capitolelor corespunzătoare  
- **Integrare Resurse**: Fișe de lucru, FAQ, și ghiduri de studiu conectate capitolelor relevante  
- **Integrare Atelier**: Laboratoare practice alocate multiple obiective de învățare pe capitole  

#### Modificat  
- **Progres Învățare**: Trecere de la documentație liniară la învățare flexibilă pe capitole  
- **Amplasare Configurare**: Ghidul de configurare mutat în Capitolul 3 pentru un flux mai bun al învățării  
- **Integrare Conținut AI**: Integrare sporită a conținutului AI pe parcursul întregii călătorii de învățare  
- **Conținut Producție**: Modele avansate consolidate în Capitolul 8 pentru cursanții enterprise  

#### Îmbunătățit  
- **Experiența Utilizatorului**: Breadcrumb-uri de navigare clare și indicatori de progres pe capitole  
- **Accesibilitate**: Modele consistente de navigare pentru o parcurgere facilă a cursului  
- **Prezentare Profesională**: Structură de curs în stil universitar, potrivită pentru formări academice și corporative  
- **Eficiența Învățării**: Reducerea timpului de găsire a conținutului relevant prin organizare îmbunătățită  

#### Implementare Tehnică  
- **Antete Navigare**: Navigare standardizată pe capitole în peste 40 de fișiere de documentație  
- **Navigare Subsol**: Ghidaj consistent pentru progres și indicatori de finalizare capitol  
- **Legături Înnodate**: Sistem cuprinzător de linking intern conectând concepte relevante  
- **Mapare Capitole**: Șabloane și exemple clar asociate obiectivelor de învățare  

#### Îmbunătățire Ghid de Studiu  
- **📚 Obiective de Învățare Complete**: Ghid de studiu restructurat pentru alinierea la sistemul de 8 capitole  
- **🎯 Evaluare pe Capitole**: Fiecare capitol include obiective specifice și exerciții practice  
- **📋 Monitorizare Progres**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare  
- **❓ Întrebări de Evaluare**: Întrebări de validare a cunoștințelor pentru fiecare capitol cu rezultate profesionale  
- **🛠️ Exerciții Practice**: Activități hands-on cu scenarii reale de implementare și depanare  
- **📊 Progresie de Competențe**: Avans clar de la concepte de bază la modele enterprise cu focus pe dezvoltarea carierei  
- **🎓 Cadru de Certificare**: Rezultate de dezvoltare profesională și sistem de recunoaștere în comunitate  
- **⏱️ Managementul Timpului**: Plan de învățare structurat pe 10 săptămâni cu validare pe jaloane  

### [v3.1.0] - 2025-09-17

#### Soluții AI Multi-Agent Îmbunătățite  
**Această versiune îmbunătățește soluția de retail multi-agent cu denumiri mai clare pentru agenți și documentație îmbunătățită.**

#### Modificat  
- **Terminologie Multi-Agent**: Înlocuit „agent Cora” cu „agent Client” în întreaga soluție multi-agent retail pentru claritate  
- **Arhitectura Agent**: Actualizate toate documentațiile, șabloanele ARM și exemplele de cod pentru a folosi denumirea „agent Client” consecvent  
- **Exemple Configurare**: Modernizate modelele de configurare a agenților cu noile convenții de denumire  
- **Consistență Documentație**: Asigurată utilizarea unor denumiri profesionale și descriptive pentru agenți  

#### Îmbunătățit  
- **Pachet Șablon ARM**: Actualizat retail-multiagent-arm-template cu referințe la agent Client  
- **Diagrame Arhitectură**: Reînoite diagramele Mermaid cu noile denumiri de agenți  
- **Exemple Cod**: Clase Python și exemple de implementare cu denumirea CustomerAgent  
- **Variabile Mediu**: Actualizate scripturile de implementare folosind convențiile CUSTOMER_AGENT_NAME  

#### Îmbunătățit  
- **Experiența Dezvoltatorului**: Roluri și responsabilități de agenți mai clare în documentație  
- **Pregătire pentru Producție**: Aliniere mai bună la convențiile de denumire enterprise  
- **Materiale Didactice**: Denumiri mai intuitive pentru scopuri educaționale  
- **Utilizabilitatea Șablonului**: Înțelegere simplificată a funcțiilor agenților și modelelor de implementare  

#### Detalii Tehnice  
- Diagrame Mermaid actualizate cu referințe CustomerAgent  
- Numele claselor CoraAgent înlocuite cu CustomerAgent în exemple Python  
- Configurații JSON ARM modificate pentru agent tip „customer”  
- Variabile mediu schimbate de la CORA_AGENT_* la CUSTOMER_AGENT_*  
- Comenzi de implementare și configurații container actualizate  

### [v3.0.0] - 2025-09-12

#### Schimbări Majore - Focus pe Dezvoltatori AI și Integrare Microsoft Foundry  
**Această versiune transformă depozitul într-o resursă de învățare completă axată pe AI, cu integrare Microsoft Foundry.**

#### Adăugat  
- **🤖 Parcurs de Învățare AI-First**: Restructurare completă prioritizând dezvoltatorii și inginerii AI  
- **Ghid Integrare Microsoft Foundry**: Documentație cuprinzătoare pentru conectarea AZD la serviciile Microsoft Foundry  
- **Modele de Implementare AI**: Ghid detaliat pentru selecția modelelor, configurare și strategii de implementare în producție  
- **Laborator Atelier AI**: Workshop hands-on de 2-3 ore pentru conversia aplicațiilor AI în soluții implementabile cu AZD  
- **Best Practices AI Producție**: Modele pregătite pentru extindere, monitorizare și securizare a încărcărilor AI  
- **Ghid de Depanare AI**: Depanare cuprinzătoare pentru modelele Microsoft Foundry, Cognitive Services și probleme de implementare AI  
- **Galerie Șabloane AI**: Colecție prezentată de șabloane Microsoft Foundry cu ratinguri de complexitate  
- **Materiale Atelier**: Structură completă de atelier cu laboratoare practice și materiale de referință  

#### Îmbunătățit  
- **Structură README**: Axată pe dezvoltatorii AI, cu 45% interes comunitar de pe Discord Microsoft Foundry  
- **Parcurse de Învațare**: Drum dedicat dezvoltatorilor AI în paralel cu cele tradiționale pentru studenți și ingineri DevOps  
- **Recomandări Șabloane**: Șabloane AI prezentate, inclusiv azure-search-openai-demo, contoso-chat și openai-chat-app-quickstart  
- **Integrare Comunitară**: Suport Discord sporit cu canale și discuții specifice AI  

#### Securitate & Producție  
- **Modele Managed Identity**: Configurări specifice autentificării și securității AI  
- **Optimizare Costuri**: Monitorizarea utilizării tokenilor și control buget pentru încărcări AI  
- **Implementare Multi-Region**: Strategii globale pentru aplicații AI  
- **Monitorizare Performanță**: Metrice AI și integrare Application Insights  

#### Calitatea Documentației  
- **Structură Curs Liniară**: Progres logic de la începători la modele AI avansate pentru producție  
- **URL-uri Validare**: Toate linkurile externe verificate și accesibile  
- **Referință Completă**: Toate linkurile interne validate și funcționale  
- **Pregătit pentru Producție**: Modele enterprise cu exemple concrete  

### [v2.0.0] - 2025-09-09

#### Schimbări Majore - Restructurare Depozit și Îmbunătățire Profesională  
**Această versiune reprezintă o revizie semnificativă a structurii depozitului și a prezentării conținutului.**

#### Adăugat  
- **Cadru Structurat de Învățare**: Toate paginile de documentație includ acum secțiuni de Introducere, Obiective de Învățare și Rezultate  
- **Sistem de Navigare**: Adăugate linkuri lecție Anterior/Următor în toate documentațiile pentru progres ghidat  
- **Ghid de Studiu**: study-guide.md cu obiective de învățare, exerciții practice și materiale de evaluare  
- **Prezentare Profesională**: Eliminarea tuturor iconițelor emoji pentru accesibilitate și aspect profesional  
- **Structură Conținut Îmbunătățită**: Organizare și flux al materialelor de învățare optimizate  

#### Modificat  
- **Format Documentație**: Standardizare cu structură consistentă axată pe învățare  
- **Flux Navigare**: Progres logic implementat pentru toate materialele  
- **Prezentare Conținut**: Eliminarea elementelor decorative în favoarea unui format clar și profesional  
- **Structura Legăturilor**: Actualizare linkuri interne pentru suportul noului sistem de navigare  

#### Îmbunătățit  
- **Accesibilitate**: Eliminarea dependenței de emoji pentru compatibilitate îmbunătățită cu cititoarele de ecran  
- **Aspect Profesional**: Prezentare curată, în stil academic, potrivită pentru învățare enterprise  
- **Experiență de Învățare**: Abordare structurată cu obiective și rezultate clare pentru fiecare lecție  
- **Organizarea Conținutului**: Flux logic și conexiune mai bună între subiecte conexe  

### [v1.0.0] - 2025-09-09

#### Lansare Inițială - Repozitoriu Complet de Învățare AZD

#### Adăugat  
- **Structură Documentație Principală**  
  - Seria completă de ghiduri de pornire  
  - Documentație detaliată pentru implementare și provisioning  
  - Resurse și ghiduri de depanare și debugging  
  - Instrumente și proceduri de validare pre-implementare  

- **Modul Introducere**  
  - Bazele AZD: concepte și terminologie principale  
  - Ghid Instalare: instrucțiuni pentru platforme specifice  
  - Ghid Configurare: setare mediu și autentificare  
  - Primul Proiect Tutorial: învățare hands-on pas cu pas  

- **Modul Implementare și Provisioning**  
  - Ghid Implementare: documentație completă flux  
  - Ghid Provisioning: infrastructură ca și cod cu Bicep  
  - Best practices pentru implementări în producție  
  - Modele de arhitectură multi-servicii  

- **Modul Validare Pre-Implementare**  
  - Planificare Capacitate: validare disponibilitate resurse Azure  
  - Selecție SKU: ghid complet pentru niveluri servicii  
  - Verificări Pre-Flight: scripturi automate PowerShell și Bash  
  - Estimare Costuri și planificare buget  

- **Modul Depanare**  
  - Probleme Comune: probleme frecvente și soluții  
  - Ghid Debugging: metodologii sistematice de depanare  
  - Tehnici și instrumente avansate de diagnosticare  
  - Monitorizare performanță și optimizare  

- **Resurse și Referințe**  
  - Fișă Comenzi: referință rapidă pentru comenzi esențiale  
  - Glosar: definiții terminologie și acronime  
  - FAQ: răspunsuri detaliate la întrebări comune  
  - Linkuri resurse externe și conexiuni comunitare  

- **Exemple și Șabloane**  
  - Exemplu aplicație web simplă  
  - Șablon implementare website static  
  - Configurare aplicație container  
  - Modele integrare baze de date  
  - Exemple arhitectură microservicii  
  - Implementări funcții serverless  

#### Funcționalități  
- **Suport Multi-Platformă**: ghiduri instalare și configurare pentru Windows, macOS și Linux  
- **Nivele Multiple de Competență**: conținut pentru studenți până la dezvoltatori profesioniști  
- **Focus Practic**: exemple hands-on și scenarii din viața reală  
- **Acoperire Completă**: de la concepte de bază la modele enterprise avansate  
- **Abordare de Securitate**: bune practici integrate pe tot parcursul  
- **Optimizare Costuri**: ghid pentru implementări cost-eficiente și management resurse  

#### Calitate Documentație  
- **Exemple de Cod Detaliate**: mostre de cod practice, testate  
- **Instrucțiuni Pas cu Pas**: ghid clar și concret  
- **Gestionare Erori Completă**: depanare pentru probleme comune  
- **Integrarea Best Practices**: standarde și recomandări din industrie  
- **Compatibilitate Versiuni**: actualizat cu cele mai noi servicii Azure și funcționalități azd  

## Îmbunătățiri Viitoare Planificate

### Versiunea 3.1.0 (Planificată)  
#### Extindere Platformă AI
- **Suport Multi-Model**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate  
- **Cadre AI pentru Agenți**: Șabloane pentru implementările LangChain, Semantic Kernel și AutoGen  
- **Modele RAG Avansate**: Opțiuni de baze de date vectoriale dincolo de Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilitate AI**: Monitorizare avansată pentru performanța modelului, utilizarea token-urilor și calitatea răspunsului  

#### Experiența Dezvoltatorului  
- **Extensie VS Code**: Experiență integrată de dezvoltare AZD + Microsoft Foundry  
- **Integrare GitHub Copilot**: Generare asistată de AI a șabloanelor AZD  
- **Tutoriale Interactive**: Exerciții practice de codare cu validare automată pentru scenarii AI  
- **Conținut Video**: Tutoriale video complementare pentru învățătorii vizuali, axate pe implementări AI  

### Versiunea 4.0.0 (Planificată)  
#### Modele AI pentru Companii  
- **Cadru de Guvernanță**: Guvernanță, conformitate și trasee de audit pentru modelele AI  
- **AI Multi-Chiriaș**: Modele pentru servirea mai multor clienți cu servicii AI izolate  
- **Implementare AI pe Edge**: Integrare cu Azure IoT Edge și instanțe containerizate  
- **AI Cloud Hibrid**: Modele de implementare multi-cloud și hibride pentru sarcini AI  

#### Funcționalități Avansate  
- **Automatizare Pipeline AI**: Integrare MLOps cu pipeline-uri Azure Machine Learning  
- **Securitate Avansată**: Modele zero-trust, endpoint-uri private și protecție avansată împotriva amenințărilor  
- **Optimizarea Performanței**: Strategii avansate de reglare și scalare pentru aplicații AI cu debit ridicat  
- **Distribuție Globală**: Modele de livrare a conținutului și cache la margine pentru aplicații AI  

### Versiunea 3.0.0 (Planificată) - Înlocuită de Versiunea Actuală  
#### Adăugiri Propuse - Acum Implementate în v3.0.0  
- ✅ **Conținut Focalizat pe AI**: Integrare cuprinzătoare Microsoft Foundry (Finalizat)  
- ✅ **Tutoriale Interactive**: Workshop practic AI (Finalizat)  
- ✅ **Modul Securitate Avansată**: Modele de securitate specifice AI (Finalizat)  
- ✅ **Optimizarea Performanței**: Strategii de reglare pentru sarcini AI (Finalizat)  

### Versiunea 2.1.0 (Planificată) - Parțial Implementată în v3.0.0  
#### Îmbunătățiri Minore - Unele Finalizate în Versiunea Curentă  
- ✅ **Exemple Suplimentare**: Scenarii de implementare axate pe AI (Finalizat)  
- ✅ **FAQ Extins**: Întrebări și depanare specifice AI (Finalizat)  
- **Integrare Unelte**: Ghiduri îmbunătățite pentru integrarea IDE și editor  
- ✅ **Extindere Monitorizare**: Modele de monitorizare și alertare specifice AI (Finalizat)  

#### Încă Planificate pentru Viitoarea Versiune  
- **Documentație Prietenoasă pentru Mobil**: Design responsiv pentru învățare pe mobil  
- **Acces Offline**: Pachete de documentație descărcabile  
- **Integrare Îmbunătățită IDE**: Extensie VS Code pentru fluxuri de lucru AZD + AI  
- **Tablou de Bord Comunitar**: Metrici comunitare în timp real și urmărirea contribuțiilor  

## Contribuții la Jurnalul Modificărilor

### Raportarea Schimbărilor  
Când contribuiți la acest depozit, vă rugăm să vă asigurați că înregistrările din jurnal includ:  

1. **Numărul Versiunii**: Urmând versiunea semantică (major.minor.patch)  
2. **Data**: Data lansării sau actualizării în formatul YYYY-MM-DD  
3. **Categoria**: Adăugat, Schimbat, Depricat, Eliminat, Corectat, Securitate  
4. **Descriere Clară**: Descriere concisă a modificării  
5. **Evaluarea Impactului**: Cum afectează modificările utilizatorii existenți  

### Categorii de Modificări

#### Adăugat  
- Funcționalități noi, secțiuni de documentație sau capabilități  
- Exemple noi, șabloane sau resurse de învățare  
- Unelte, scripturi sau utilitare suplimentare  

#### Schimbat  
- Modificări ale funcționalității sau documentației existente  
- Actualizări pentru îmbunătățirea clarității sau acurateței  
- Restructurări ale conținutului sau organizării  

#### Depricat  
- Funcționalități sau abordări care sunt eliminate treptat  
- Secțiuni de documentație programate pentru eliminare  
- Metode care au alternative mai bune  

#### Eliminat  
- Funcționalități, documentație sau exemple care nu mai sunt relevante  
- Informații învechite sau abordări depreciate  
- Conținut redundant sau consolidat  

#### Corectat  
- Corecții pentru erori din documentație sau cod  
- Rezolvarea problemelor semnalate  
- Îmbunătățiri ale acurateței sau funcționalității  

#### Securitate  
- Îmbunătățiri sau corecții legate de securitate  
- Actualizări ale celor mai bune practici de securitate  
- Rezolvarea vulnerabilităților de securitate  

### Ghiduri pentru Versiuni Semantice

#### Versiune Majoră (X.0.0)  
- Modificări care întrerup funcționalitatea și necesită acțiune din partea utilizatorului  
- Restructurări semnificative ale conținutului sau organizării  
- Modificări care alterează fundamental abordarea sau metodologia  

#### Versiune Minoră (X.Y.0)  
- Funcționalități noi sau adăugiri de conținut  
- Îmbunătățiri care mențin compatibilitatea backward  
- Exemple, unelte sau resurse suplimentare  

#### Versiune Patch (X.Y.Z)  
- Corecții de erori și remedieri  
- Îmbunătățiri minore ale conținutului existent  
- Clarificări și mici îmbunătățiri  

## Feedback și Sugestii din Comunitate

Încurajăm activ feedback-ul comunității pentru a îmbunătăți această resursă de învățare:

### Cum să Oferiți Feedback  
- **GitHub Issues**: Raportați probleme sau sugerați îmbunătățiri (problemele AI sunt binevenite)  
- **Discuții Discord**: Împărtășiți idei și interacționați cu comunitatea Microsoft Foundry  
- **Pull Requests**: Contribuiți cu îmbunătățiri directe pentru conținut, în special pentru șabloane și ghiduri AI  
- **Microsoft Foundry Discord**: Participați în canalul #Azure pentru discuții AZD + AI  
- **Forumuri Comunitare**: Participați la discuții Azure pentru dezvoltatori  

### Categorii de Feedback  
- **Acuratețea Conținutului AI**: Corecturi legate de integrarea și implementarea serviciilor AI  
- **Experiența de Învățare**: Sugestii pentru un flux mai bun de învățare pentru dezvoltatorii AI  
- **Conținut AI Lipsă**: Cereri pentru șabloane, modele sau exemple suplimentare AI  
- **Accesibilitate**: Îmbunătățiri pentru nevoi diverse de învățare  
- **Integrare Unelte AI**: Sugestii pentru integrarea mai bună a fluxurilor de lucru AI  
- **Modele AI pentru Producție**: Cereri pentru modele de implementare AI în companii  

### Angajament de Răspuns  
- **Răspuns Probleme**: În maximum 48 de ore pentru probleme raportate  
- **Cereri Funcționalități**: Evaluare în termen de o săptămână  
- **Contribuții Comunitare**: Revizuire în termen de o săptămână  
- **Probleme de Securitate**: Prioritate imediată cu răspuns accelerat  

## Program de Mentenanță

### Actualizări Regulate  
- **Revizuiri Lunare**: Verificarea acurateței conținutului și validarea link-urilor  
- **Actualizări Trimestriale**: Adăugiri și îmbunătățiri majore de conținut  
- **Revizuiri Semestriale**: Restructurări și amplificări cuprinzătoare  
- **Lansări Anuale**: Actualizări majore de versiune cu îmbunătățiri semnificative  

### Monitorizare și Asigurarea Calității  
- **Testare Automată**: Validare regulată a exemplelor de cod și a link-urilor  
- **Integrarea Feedback-ului Comunitar**: Incorporarea regulată a sugestiilor utilizatorilor  
- **Actualizări Tehnologice**: Alinierea la cele mai recente servicii Azure și versiuni azd  
- **Audituri de Accesibilitate**: Revizuiri regulate pentru principiile designului incluziv  

## Politica de Suport pe Versiuni

### Suport pentru Versiunea Curentă  
- **Ultima Versiune Majoră**: Suport complet cu actualizări regulate  
- **Versiunea Majoră Anterioară**: Actualizări de securitate și remedieri critice timp de 12 luni  
- **Versiuni Legacy**: Suport comunitar doar, fără actualizări oficiale  

### Ghid de Migrare  
La lansarea versiunilor majore oferim:  
- **Ghiduri de Migrare**: Instrucțiuni pas cu pas pentru tranziție  
- **Note despre Compatibilitate**: Detalii privind schimbările care întrerup compatibilitatea  
- **Suport pentru Unelte**: Scripturi sau utilitare pentru asistarea migrării  
- **Suport Comunitar**: Forumuri dedicate pentru întrebări legate de migrare  

---

**Navigare**  
- **Lecția Anterioară**: [Ghid de Studiu](resources/study-guide.md)  
- **Lecția Următoare**: Întoarceți-vă la [Main README](README.md)  

**Rămâneți la Curent**: Urmăriți acest depozit pentru notificări despre lansări noi și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Changelog - AZD Pentru Începători

## Introducere

Acest changelog documentează toate schimbările notabile, actualizările și îmbunătățirile din depozitul AZD Pentru Începători. Urmăm principiile versionării semantice și menținem acest jurnal pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de Învățare

Prin revizuirea acestui changelog, veți:
- Rămâne informați despre noile funcționalități și conținut adăugat
- Înțelege îmbunătățirile făcute documentației existente
- Monitoriza corecturile și rezolvările de erori pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare în timp

## Rezultate de Învățare

După revizuirea intrărilor din changelog, veți putea:
- Identifica conținutul nou și resursele disponibile pentru învățare
- Înțelege care secțiuni au fost actualizate sau îmbunătățite
- Planifica calea de învățare pe baza celor mai actuale materiale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul Versiunilor

### [v3.22.0] - 2026-06-16

#### Completare pentru Începători #2: Crearea Șabloanelor, Containere Dev, Pulumi, Azure DevOps, Service Principals și Altele
**Această versiune închide lacunele intermediare rămase identificate de analiza azd-coverage: cum să creezi și să publici propriul șablon, medii reproducibile cu dev-containere/Codespaces, furnizorul de infrastructură Pulumi, un walkthrough Azure DevOps CI/CD, autentificarea cu principalii de serviciu, ghid pentru selecția gazdei (AKS/Spring Apps), explicații pentru `azd restore`/`azd package`, tratarea erorilor hook, și practici pentru echipe/medii partajate.**

#### Adăugat
- **🧱 Lecția nouă Capitolul 4** `docs/chapter-04-infrastructure/custom-templates.md` — crearea propriului șablon azd: structura necesară (`azure.yaml`, `infra/`, `src/`), câmpul `metadata.template`, parametrizarea infrastructurii cu token-ul de resurse `uniqueString()` și tag-ul `azd-env-name`, testare locală cu `azd init --template <local-path>`, publicare pe GitHub și trimitere în galeria Awesome AZD
- **📦 Lecția nouă Capitolul 1** `docs/chapter-01-foundation/dev-containers.md` — medii azd reproductibile cu Dev Containers și GitHub Codespaces: un `.devcontainer/devcontainer.json` minimal folosind funcția oficială `ghcr.io/azure/azure-dev/azd`, funcții specifice limbajelor, `docker-in-docker` pentru gazdele containerelor și `azd auth login --use-device-code` pentru autentificare de la distanță
- **🧩 Secțiunea Pulumi cu azd** în `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, structura folderului Pulumi, stive mapate pe medii azd, output-uri/taguri necesare, și workflow-ul identic `azd up` / `azd down`
- **🎯 Ghid pentru selecția gazdei** în `docs/chapter-04-infrastructure/provisioning.md` — o comparație prietenoasă pentru începători între `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` și `springapp`, cu recomandări când să alegi AKS sau Azure Spring Apps
- **🛠️ Walkthrough Azure DevOps CI/CD** în `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexiune de serviciu cu federarea identității de lucru (OIDC), fișierul generat `azure-dev.yml`, și configurarea grupului de variabile
- **🔑 Principalii de Serviciu (Model 4)** adăugat în `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non-interactiv cu secret client versus credentiale federate/OIDC, când să folosești și stocarea securizată a credentialelor
- **🪝 Tratarea erorilor hook** în `docs/chapter-04-infrastructure/deployment-guide.md` — coduri de ieșire și `set -e`, `continueOnError`, testarea hook-urilor în izolare cu `azd hooks run`, shell-uri specifice sistemului de operare și `--debug`
- **👥 Echipă / medii partajate** în `docs/chapter-03-configuration/configuration.md` — ce se află în `.azure/`, ce să ignore git, medii per dezvoltator, `azd env list`/`select`, și furnizarea valorilor mediilor în CI/CD
- **🧰 Explicații pentru `azd restore` și `azd package` extins** în `resources/cheat-sheet.md` — restaurarea dependențelor și construirea unui artefact deployabil fără a face deploy

#### Modificat
- **🧭 Tabelul lecțiilor Capitolul 4** actualizat pentru a include lecția nouă „Crearea Propriului Șablon” (Lecția 3)
- **🧭 Tabelul lecțiilor Capitolul 1** actualizat pentru a include lecția nouă „Dev Containers & Codespaces” (Lecția 5); footer-ele de navigare conectate între `bring-your-own-app.md` și `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Completare Pentru Începători: Lecție Practică Multi-Agent, „Adaugă Propria Aplicație”, Terraform și Walkthrough CI/CD
**Această versiune închide cele mai mari lacune pentru un ghid complet pentru începători adăugând două lecții practice noi (un walkthrough deployabil cu multi-agent și adăugarea azd la o aplicație existentă), o introducere prietenoasă pentru hook-uri, o secțiune Terraform cu azd, un walkthrough pas-cu-pas pentru pipeline-ul GitHub Actions, o explicație pentru noile extensii preview și o listă de verificare explicită pentru verificarea deploy-ului.**

#### Adăugat
- **🤝 Lecția nouă Capitolul 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un walkthrough complet hands-on, deployabil cu doi agenți (orchestrator + specialiști) folosind un șablon real (`contoso-creative-writer`), acoperind când să folosești multi-agent, workflow-ul `azd up`, înțelegerea resurselor deployate, trasabilitate între agenți, personalizare și curățare
- **📦 Lecția nouă Capitolul 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cum să adaugi azd la un proiect existent cu `azd init` („folosește codul din directorul curent”), înțelegerea fișierului `azure.yaml` și a folderului `infra/`, `azd infra generate`, detectarea gazdei și deploy cu `azd up`
- **🌐 Secțiunea Terraform cu azd** adăugată în `docs/chapter-04-infrastructure/provisioning.md` — configurare `infra.provider: terraform`, structura folderului `.tf`, output-urile necesare `AZURE_*` și tag-ul `azd-env-name`, și workflow-ul identic `azd up` / `azd down` (închide lacuna unde se susținea suportul pentru Terraform, dar se arăta doar Bicep)
- **⚙️ Walkthrough pas-cu-pas GitHub Actions** în `docs/chapter-08-production/production-ai-practices.md` — de la repo GitHub până la deploy-uri automate: `azd pipeline config`, credentiale federate OIDC (fără secrete stocate), fișierul generat `azure-dev.yml` și ghidul privind secrete versus variabile
- **🪝 Introducere „Nou la hook-uri?” pentru începători** în `docs/chapter-04-infrastructure/deployment-guide.md` — ce este un hook, tabelul etapelor hook, primul hook minimal și rularea manuală a hook-urilor cu `azd hooks run`
- **✅ Listă de verificare „Verifică Deploy-ul”** adăugată la Pasul 5 din `docs/chapter-01-foundation/first-project.md` — test de bază, verificare endpoint sănătate și criterii explicite de succes
- **🧩 Explicație pentru noile extensii preview** `azure.ai.skills` și `azure.ai.connections` (ce sunt și când să le folosești) în `docs/chapter-08-production/production-ai-practices.md`

#### Modificat
- **🧭 Tabelul lecțiilor Capitolul 5** corectat: `multi-agent-basics.md` este acum Lecția 1 (singura lecție complet hands-on), cu etichetare clară că Lecția 2 este în Capitolul 6 și scenariul Retail este un plan arhitectural, nu un șablon simplu
- **🧭 Tabelul lecțiilor Capitolul 1** include acum lecția nouă „Adaugă Propria Aplicație” (Lecția 4)
- **🔗 Footer-ele de navigare** actualizate: `first-project.md` leagă acum înainte către `bring-your-own-app.md`

#### Corectat
- **🧱 Închisă lacuna „Terraform susținut, dar lipsă”** — cursul anterior făcea referire la suport Terraform fără demonstrație
- **🔀 Corectat link-urile înșelătoare din Capitolul 5** care sugerau existența unei implementări complete multi-agent când de fapt era doar un plan arhitectural

#### Fișiere Actualizate
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nou)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nou)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Actualizare AZD 1.25.6, Comenzi Complete pentru Ciclu de Viață Agent & Rebranding Aspire
**Această versiune revalidează cursul cu `azd` `1.25.6` (iunie 2026) și extensia `azure.ai.agents` `0.1.40-preview`, extinde ghidurile AI de la „crează un agent” la ciclul complet de viață agent (testare → evaluare → optimizare → inspectare → ștergere), aduce în prim-plan noile extensii preview `azure.ai.skills` și `azure.ai.connections`, și notează rebranding-ul produsului „.NET Aspire” → „Aspire”.**

#### Adăugat
- **🔁 Acoperire completă a ciclului de viață al agentului** pentru începători și ingineri AI în documentație:
  - `docs/chapter-01-foundation/azd-basics.md` — tabelul ciclului de viață (scaffold → test → măsurare → îmbunătățire → inspectare → curățare) adăugat în secțiunea Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — noua secțiune „Managementul ciclului de viață al agentului” acoperind `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` și `delete --force`
  - `resources/cheat-sheet.md` — Comenzi extinse AI Agent cu `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` și `delete --force`
- **🧩 Extensii preview noi** documentate: `azure.ai.skills` (abilități reutilizabile ale agentului) și `azure.ai.connections` (conexiuni Foundry) adăugate în tabelul de extensii și în cheat sheet
- **⏱️ Ghid pentru timpii de răspuns** — exemple pentru `azd ai agent invoke` includ acum afișarea latenței totale și a timpului până la primul byte
- **📌 Bannere de versiune** în README-ul principal care indică cursanților comanda `azd version` și `azd upgrade`

#### Modificat
- **✅ Baza de validare actualizată** de la `azd 1.23.12` (martie 2026) la `azd 1.25.6` (iunie 2026) în toate README-urile capitolelor și documentația workshop-ului
- **🤖 Notă extensie Capitolul 2** actualizată de la `azure.ai.agents` `0.1.18-preview` la `0.1.40-preview`
- **🧪 Exemplul de validare pentru workshop** (`azd version`) actualizat la `1.25.6`
- **🧭 README „Ce este Nou azi în azd”** reîmprospătat, evidențiind ciclul complet al agentului, noile extensii AI și recentele îmbunătățiri de calitate a vieții („azd init” idempotent, curățarea token-urilor expirate la „azd auth login”, promptul de prima rulare `azd tool`)
- **📖 Capitolul 2 agents.md (Opțiunea 4)** actualizat pentru a îndruma cursanții spre comenzile ciclului de viață post-deploy, nu doar până la `azd up`

#### Corectat
- **🏷️ Denumirea produsului** — adăugat un note privind rebranding-ul Aspire (".NET Aspire" este acum doar „Aspire”); suportul Aspire în azd rămâne neschimbat
- **🔎 Validarea lansării live** confirmată față de feed-ul de lansare al Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) și `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fișiere Actualizate
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
#### Clarificare pentru introducerea începătorilor, validarea configurării și curățarea finală a comenzilor AZD
**Această versiune urmează verificarea AZD 1.23 cu o trecere a documentației concentrată pe începători: clarifică îndrumările de autentificare prioritizează AZD, adaugă scripturi locale de validare a configurării, verifică comenzile cheie în raport cu CLI AZD live și elimină ultimele referințe învechite la comenzi sursă în engleză în afara jurnalului de modificări.**

#### Adăugat
- **🧪 Scripturi de validare a configurării pentru începători** cu `validate-setup.ps1` și `validate-setup.sh` astfel încât cei care învață să poată confirma uneltele necesare înainte de a începe Capitolul 1
- **✅ Pași inițiali de validare a configurării** în README-ul rădăcină și README-ul Capitolului 1 astfel încât prerechizitele lipsă să fie detectate înainte de `azd up`

#### Modificat
- **🔐 Îndrumare de autentificare pentru începători** tratează acum în mod consecvent `azd auth login` ca cale principală pentru fluxurile de lucru AZD, cu `az login` menționat opțional, decât dacă se folosesc direct comenzi Azure CLI
- **📚 Fluxul de onboarding din Capitolul 1** acum indică învățăceilor să își valideze configurarea locală înainte de pașii de instalare, autentificare și prima implementare
- **🛠️ Mesaje ale validatorului** acum separă clar cerințele care blochează de avertismentele opționale Azure CLI pentru calea exclusivă AZD a începătorilor
- **📖 Documentația de configurare, depanare și exemple** face acum distincția între autentificarea obligatorie AZD și logarea opțională Azure CLI acolo unde ambele erau anterior prezentate fără context

#### Corectat
- **📋 Referințele rămase la comenzi în limba engleză** actualizate la formele AZD curente, inclusiv `azd config show` în fișa de referință și `azd monitor --overview` acolo unde era intenționată îndrumarea de overview în portalul Azure
- **🧭 Afirmații pentru începători în Capitolul 1** modificate pentru a evita promisiuni exagerate privind comportamentul garantat fără erori sau rollback pentru toate șabloanele și resursele Azure
- **🔎 Validare live CLI** confirmată pentru suportul curent al comenzilor `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` și `azd down --force --purge`

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

#### Validare AZD 1.23.12, extinderea mediului workshop și reîmprospătare model AI
**Această versiune efectuează o verificare a documentației pentru `azd` `1.23.12`, actualizează exemple de comenzi AZD învechite, reîmprospătează îndrumările pentru modele AI cu configurările implicite curente și extinde instrucțiunile workshopului dincolo de GitHub Codespaces pentru a sprijini și containere developer și clone locale.**

#### Adăugat
- **✅ Note de validare în capitolele de bază și documentația workshop-ului** pentru a face explicită baza testată AZD pentru învățăceii ce folosesc build-uri CLI mai noi sau mai vechi
- **⏱️ Îndrumări privind timeout-ul implementărilor** pentru implementări AI de durată folosind `azd deploy --timeout 1800`
- **🔎 Pași de inspectare a extensiilor** cu `azd extension show azure.ai.agents` în documentația fluxului AI
- **🌐 Extindere a îndrumărilor privind mediul workshop-ului** acoperind GitHub Codespaces, containere dev și clone locale cu MkDocs

#### Modificat
- **📚 README-urile introductive din capitole** notează consistent acum validarea față de `azd 1.23.12` în secțiunile de fundație, configurare, infrastructură, multi-agent, pre-implementare, depanare și producție
- **🛠️ Referințe la comenzi AZD** actualizate la formele curente în documentație:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` sau `azd env get-value(s)` în funcție de context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` acolo unde este intentat overview-ul Application Insights
- **🧪 Exemple de previzualizare provisionare** simplificate la utilizarea suportată curent precum `azd provision --preview` și `azd provision --preview -e production`
- **🧭 Fluxul workshop-ului** actualizat ca învățăceii să poată finaliza laboratoarele în Codespaces, container dev sau clone locală, nu doar executare exclusivă Codespaces
- **🔐 Îndrumare autentificare** favorizează acum `azd auth login` pentru fluxuri AZD, cu `az login` poziționat opțional când se folosesc comenzi Azure CLI direct

#### Corectat
- **🪟 Comenzi de instalare Windows** normalizate pentru casse-ul actual al pachetelor `winget` în ghidul de instalare
- **🐧 Îndrumări instalare Linux** corectate pentru a evita instrucțiuni nepemise pentru manageri de pachete distro-specifice `azd` și în schimb indică activele de release unde este cazul
- **📦 Exemple modele AI** reîmprospătate de la vechile implicituri precum `gpt-35-turbo` și `text-embedding-ada-002` la exemple actuale precum `gpt-4.1-mini`, `gpt-4.1` și `text-embedding-3-large`
- **📋 Fragmente pentru implementare și diagnostic** corectate să folosească comenzi curente pentru mediu și status în jurnale, scripturi și pași de depanare
- **⚙️ Îndrumare GitHub Actions** actualizată de la `Azure/setup-azd@v1.0.0` la `Azure/setup-azd@v2`
- **🤖 Îndrumare consimțământ MCP/Copilot** actualizată de la `azd mcp consent` la `azd copilot consent list`

#### Îmbunătățit
- **🧠 Îndrumări capitol AI** explică mai bine comportamentul sensibil la previzualizare `azd ai`, autentificarea tenant-specfică, utilizarea extensiei curente și recomandările actualizate privind implementarea modelelor
- **🧪 Instrucțiuni workshop** folosesc acum exemple de versiune mai realiste și limbaj mai clar pentru configurarea mediului în laboratoare practice
- **📈 Documentația pentru producție și depanare** acum aliniază mai bine monitorizarea curentă, modelul fallback și exemplele pe niveluri de cost

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

#### Comenzi AZD AI CLI, validare conținut și extindere șabloane
**Această versiune adaugă acoperire pentru comenzile `azd ai`, `azd extension` și `azd mcp` în toate capitolele legate de AI, remediază linkuri rupte și cod învechit în agents.md, actualizează fișa de referință și reorganizează secțiunea Șabloane Exemplu cu descrieri validate și noi șabloane Azure AI AZD.**

#### Adăugat
- **🤖 Acoperire AZD AI CLI** în 7 fișiere (anterior doar în Capitolul 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Secțiunea nouă „Extensii și Comenzi AI” care introduce `azd extension`, `azd ai agent init` și `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opțiunea 4: `azd ai agent init` cu tabel comparativ (șablon vs abordare manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecțiuni „Extensii AZD pentru Foundry” și „Implementare Agent-First”
  - `docs/chapter-05-multi-agent/README.md` — Pornire rapidă acum arată ambele căi de implementare bazate pe șablon și manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secțiunea Implementare include acum opțiunea `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecțiunea „Comenzi extensie AZD AI pentru diagnostic”
  - `resources/cheat-sheet.md` — Noua secțiune „Comenzi AI & Extensii” cu `azd extension`, `azd ai agent init`, `azd mcp` și `azd infra generate`
- **📦 Șabloane noi AZD AI exemplu** în `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET cu Blazor WebAssembly, Semantic Kernel și suport voice chat
  - **azure-search-openai-demo-java** — Chat RAG Java utilizând Langchain4J cu opțiuni de implementare ACA/AKS
  - **contoso-creative-writer** — Aplicație creativă multi-agent folosind Azure AI Agent Service, Bing Grounding și Prompty
  - **serverless-chat-langchainjs** — RAG serverless folosind Azure Functions + LangChain.js + Cosmos DB cu suport dezvoltare locală Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG enterprise cu portal admin, integrare Teams și opțiuni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicație referință de orchestrare MCP multi-agent cu servere .NET, Python, Java și TypeScript
  - **azd-ai-starter** — Șablon minim Bicep infrastructură Azure AI starter
  - **🔗 Link galerie Awesome AZD AI** — Referință la [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (peste 80 șabloane)

#### Corectat
- **🔗 Navigație agents.md**: Linkurile Previous/Next corespund acum ordinii lecțiilor din README Capitolul 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Linkuri rupte agents.md**: `production-ai-practices.md` corectat în `../chapter-08-production/production-ai-practices.md` (3 apariții)
- **📦 Cod învechit agents.md**: Înlocuit `opencensus` cu `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API invalid agents.md**: Mutat `max_tokens` din `create_agent()` în `create_run()` ca `max_completion_tokens`
- **🔢 Contorizare tokeni agents.md**: Înlocuită estimarea brută `len//4` cu `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corectate serviciile de la „Cognitive Search + App Service” la „Azure AI Search + Azure Container Apps” (gazdă implicită schimbată în octombrie 2024)
- **contoso-chat**: Descriere actualizată să facă referire la Azure AI Foundry + Prompty, conform titlului și tehnologiilor reale din repo

#### Eliminat
- **ai-document-processing**: Eliminată referința la șablon nefuncțional (repo nu este public accesibil ca șablon AZD)

#### Îmbunătățit
- **📝 Exerciții agents.md**: Exercițiul 1 arată acum ieșirea așteptată și pasul `azd monitor`; Exercițiul 2 include cod complet pentru înregistrarea `FunctionTool`; Exercițiul 3 înlocuiește indicațiile vagi cu comenzi concrete `prepdocs.py`
- **📚 Resurse agents.md**: Actualizate linkurile documentației către docs curente Azure AI Agent Service și quickstart
- **📋 Tabel Next Steps agents.md**: Adăugat linkul AI Workshop Lab pentru acoperirea completă a capitolului

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
#### Îmbunătățire Navigare Curs  
**Această versiune îmbunătățește navigarea între capitolele din README.md cu un format tabelar îmbunătățit.**

#### Modificat  
- **Tabelul Hărții Cursului**: Îmbunătățit cu linkuri directe către lecții, estimări de durată și evaluări ale complexității  
- **Curățare Foldere**: Eliminarea folderelor vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **Validarea Linkurilor**: Toate cele 21+ linkuri interne din tabelul Hărții Cursului verificate  

### [v3.16.0] - 2026-02-05

#### Actualizări Nume Produs  
**Această versiune actualizează referințele produselor conform brandingului actual Microsoft.**

#### Modificat  
- **Microsoft Foundry → Microsoft Foundry**: Toate referințele actualizate în fișierele non-traduse  
- **Azure AI Agent Service → Foundry Agents**: Numele serviciului actualizat pentru reflectarea brandingului curent  

#### Fișiere Actualizate  
- `README.md` - Pagina principală a cursului  
- `changelog.md` - Istoricul versiunilor  
- `course-outline.md` - Structura cursului  
- `docs/chapter-02-ai-development/agents.md` - Ghid agenți AI  
- `examples/README.md` - Documentația exemplelor  
- `workshop/README.md` - Pagina principală workshop  
- `workshop/docs/index.md` - Index workshop  
- `workshop/docs/instructions/*.md` - Toate fișierele cu instrucțiuni pentru workshop  

---

### [v3.15.0] - 2026-02-05

#### Restructurare Majoră a Repozitorului: Foldere pe Capitole  
**Această versiune restructurează documentația în foldere dedicate pentru fiecare capitol pentru o navigare mai clară.**

#### Redenumiri Foldere  
Folderele vechi au fost înlocuite cu foldere numerotate pe capitole:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- Nou adăugat: `docs/chapter-05-multi-agent/`  

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
- **📚 Fișiere README pe capitole**: Creat README.md în fiecare folder capitol cu:  
  - Obiective de învățare și durată  
  - Tabel lecții cu descrieri  
  - Comenzi rapide pentru început  
  - Navigare către celelalte capitole  

#### Modificat  
- **🔗 Actualizare linkuri interne**: Peste 78 de căi actualizate în toate fișierele de documentație  
- **🗺️ README.md principal**: Actualizare Harta Cursului cu noua structură pe capitole  
- **📝 examples/README.md**: Actualizare referințe către folderele capitolelor  

#### Eliminat  
- Structura veche a folderelor (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05

#### Restructurarea Repozitorului: Navigare pe Capitole  
**Această versiune a adăugat fișiere README de navigare pe capitole (înlocuite de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ghid Nou pentru Agenți AI  
**Această versiune adaugă un ghid complet pentru implementarea agenților AI cu Azure Developer CLI.**

#### Adăugat  
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet ce acoperă:  
  - Ce sunt agenții AI și cum se diferențiază de chatbot-uri  
  - Trei template-uri rapide pentru agenți (Foundry Agents, Prompty, RAG)  
  - Modele arhitecturale de agenți (agent unic, RAG, multi-agent)  
  - Configurarea și personalizarea uneltelor  
  - Monitorizarea și urmărirea metrice  
  - Considerații și optimizări de costuri  
  - Situații comune de depanare  
  - Trei exerciții practice cu criterii de succes  

#### Structura Conținutului  
- **Introducere**: Concepte de agenți pentru începători  
- **Start Rapid**: Implementare agenți cu `azd init --template get-started-with-ai-agents`  
- **Modele Arhitecturale**: Diagrame vizuale ale pattern-urilor de agenți  
- **Configurație**: Setări unelte și variabile de mediu  
- **Monitorizare**: Integrare Application Insights  
- **Exerciții**: Învățare practică progresivă (20-45 minute fiecare)  

---

### [v3.12.0] - 2026-02-05

#### Actualizare Mediu DevContainer  
**Această versiune actualizează configurația containerului de dezvoltare cu unelte moderne și setări implicite mai bune pentru experiența AZD.**

#### Modificat  
- **🐳 Imagine de bază**: Actualizată de la `python:3.12-bullseye` la `python:3.12-bookworm` (cea mai recentă versiune stabilă Debian)  
- **📛 Numele Containerului**: Redenumit din "Python 3" în "AZD for Beginners" pentru claritate  

#### Adăugat  
- **🔧 Funcționalități Noi pentru Dev Container**:  
  - `azure-cli` cu suport Bicep activat  
  - `node:20` (versiune LTS pentru template-uri AZD)  
  - `github-cli` pentru management template-uri  
  - `docker-in-docker` pentru implementări container app  

- **🔌 Redirecționare Porturi**: Porturi preconfigurate pentru dezvoltare comună:  
  - 8000 (previzualizare MkDocs)  
  - 3000 (aplicații web)  
  - 5000 (Python Flask)  
  - 8080 (API-uri)  

- **🧩 Extensii Noi VS Code**:  
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

- **⚙️ Setări VS Code**: Setări implicite pentru interpret Python, format automat la salvare, eliminare spații inutile  

- **📦 requirements-dev.txt Actualizat**:  
  - Adăugat plugin MkDocs minify  
  - Adăugat pre-commit pentru calitate cod  
  - Adăugate pachete SDK Azure (azure-identity, azure-mgmt-resource)  

#### Remediat  
- **Comandă Post-Creare**: Verifică acum instalarea AZD și Azure CLI la pornirea containerului  

---

### [v3.11.0] - 2026-02-05

#### Refacere README Prietenoasă pentru Începători  
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil pentru începători și adaugă resurse esențiale pentru dezvoltatorii AI.**

#### Adăugat  
- **🆚 Compararea Azure CLI vs AZD**: Explicație clară când să folosești fiecare unealtă cu exemple practice  
- **🌟 Linkuri Minunate AZD**: Linkuri directe către galerii template comunitare și resurse de contribuție:  
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Peste 200 de template-uri gata de implementat  
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuții comunitare  
- **🎯 Ghid Start Rapid**: Secțiune simplificată în 3 pași (Instalare → Login → Implementare)  
- **📊 Tabel Navigare după Experiență**: Ghid clar despre de unde să începi în funcție de experiența dezvoltatorului  

#### Modificat  
- **Structura README**: Reorganizată pentru afișare progresivă – informația cheie prima  
- **Secțiunea Introducere**: Rescrisă pentru a explica „Magia comenzii `azd up`” în mod simplu pentru începători  
- **Conținut Duplicat Eliminat**: Secțiune de depanare duplicată eliminată  
- **Comenzi Depanare**: Referința `azd logs` corectată pentru a folosi comanda validă `azd monitor --logs`  

#### Remediat  
- **🔐 Comenzi Autentificare**: Adăugat `azd auth login` și `azd auth logout` în cheat-sheet.md  
- **Referințe Comenzi Invalide**: Eliminat restul aparițiilor `azd logs` din secțiunea de depanare din README  

#### Note  
- **Domeniu de Aplicare**: Modificările aplicate în README.md principal și resources/cheat-sheet.md  
- **Public Țintă**: Îmbunătățiri destinate în special dezvoltatorilor noi la AZD  

---

### [v3.10.0] - 2026-02-05

#### Actualizare Acuratețe Comenzi Azure Developer CLI  
**Această versiune corectează comenzile AZD inexistente în documentație, asigurând că toate exemplele de cod folosesc sintaxa validă Azure Developer CLI.**

#### Remediat  
- **🔧 Comenzi AZD Inexistente Eliminare**: Audit complet și corectare comenzi invalide:  
  - `azd logs` (nu există) → înlocuit cu `azd monitor --logs` sau alternative Azure CLI  
  - Subcomenzi `azd service` (nu există) → înlocuite cu `azd show` și Azure CLI  
  - `azd infra import/export/validate` (nu există) → eliminate sau înlocuite cu alternative valide  
  - Flag-uri `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nu există) → eliminate  
  - Flag-uri `azd provision --what-if/--rollback` (nu există) → actualizate pentru a folosi `--preview`  
  - `azd config validate` (nu există) → înlocuit cu `azd config list`  
  - `azd info`, `azd history`, `azd metrics` (nu există) → eliminate  

- **📚 Fișiere Actualizate cu Corecturi Comenzi**:  
  - `resources/cheat-sheet.md`: Revizuire majoră a referinței comenzilor  
  - `docs/deployment/deployment-guide.md`: Corecții pentru strategii rollback și implementare  
  - `docs/troubleshooting/debugging.md`: Corecții în secțiunile de analiză loguri  
  - `docs/troubleshooting/common-issues.md`: Actualizări comenzi de depanare  
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectare secțiune depanare AZD  
  - `docs/getting-started/azd-basics.md`: Corectări comenzi monitorizare  
  - `docs/getting-started/first-project.md`: Actualizări exemple monitorizare și depanare  
  - `docs/getting-started/installation.md`: Corectare exemple ajutor și versiune  
  - `docs/pre-deployment/application-insights.md`: Corectare comenzi vizualizare loguri  
  - `docs/pre-deployment/coordination-patterns.md`: Corectare comenzi depanare agenți  

- **📝 Referință Versiune Actualizată**:  
  - `docs/getting-started/installation.md`: Versiunea fixă `1.5.0` schimbată în generic `1.x.x` cu link către release-uri  

#### Modificat  
- **Strategii Rollback**: Documentația actualizată pentru a folosi rollback bazat pe Git (AZD nu are rollback nativ)  
- **Vizualizare Loguri**: Înlocuite referințele `azd logs` cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI  
- **Secțiunea Performanță**: Eliminat flag-uri inexistente de implementare paralelă/incrementală, oferite alternative valide  

#### Detalii Tehnice  
- **Comenzi AZD Valide**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`  
- **Flag-uri valide azd monitor**: `--live`, `--logs`, `--overview`  
- **Funcționalități Eliminare**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`  

#### Note  
- **Verificare**: Comenzile validate cu Azure Developer CLI v1.23.x  

---

### [v3.9.0] - 2026-02-05

#### Finalizare Workshop și Îmbunătățirea Calității Documentației  
**Această versiune finalizează modulele interactive ale workshop-ului, repară toate linkurile defecte din documentație și îmbunătățește calitatea conținutului pentru dezvoltatorii AI care utilizează Microsoft AZD.**

#### Adăugat  
- **📝 CONTRIBUTING.md**: Document nou cu ghiduri de contribuție cu:  
  - Instrucțiuni clare pentru raportarea problemelor și propunerea de schimbări  
  - Standarde de documentare pentru conținut nou  
  - Ghiduri pentru exemple de cod și convenții pentru mesajele de commit
  - Informații despre implicarea comunității

#### Finalizat
- **🎯 Modulul 7 al atelierului (Încheiere)**: Modulul de încheiere complet cu:
  - Rezumat cuprinzător al realizărilor atelierului
  - Secțiunea concepte cheie stăpânite acoperind AZD, șabloane și Microsoft Foundry
  - Recomandări pentru continuarea parcursului de învățare
  - Exerciții provocare din atelier cu clasificări de dificultate
  - Feedback-ul comunității și linkuri pentru suport

- **📚 Modulul 3 al atelierului (Deconstrucție)**: Obiectivele de învățare actualizate cu:
  - Ghid de activare GitHub Copilot cu servere MCP
  - Înțelegerea structurii folderului șabloanelor AZD
  - Modele organizatorice infrastructure-as-code (Bicep)
  - Instrucțiuni pentru laborator practică

- **🔧 Modulul 6 al atelierului (Demontare)**: Finalizat cu:
  - Obiective de curățare a resurselor și gestionare a costurilor
  - Utilizarea `azd down` pentru dezafectare sigură a infrastructurii
  - Ghid pentru recuperarea serviciilor cognitive șterse soft
  - Sugestii bonus de explorare pentru GitHub Copilot și Azure Portal

#### Corectat
- **🔗 Repararea link-urilor defecte**: Rezolvat peste 15 link-uri interne defecte în documentație:
  - `docs/ai-foundry/ai-model-deployment.md`: Corectate căile către microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectate căile ai-model-deployment.md și production-ai-practices.md
  - `docs/getting-started/first-project.md`: Înlocuit cicd-integration.md inexistent cu deployment-guide.md
  - `examples/retail-scenario.md`: Corectate căile către FAQ și ghidul de depanare
  - `examples/container-app/microservices/README.md`: Corectate căile către cursul principal și ghidul de implementare
  - `resources/faq.md` și `resources/glossary.md`: Actualizate referințele la capitolele AI
  - `course-outline.md`: Corectate referințele către ghidul instructorului și laboratoarele de AI

- **📅 Banner stare atelier**: Actualizat de la „În construcție” la stare activă cu data februarie 2026

- **🔗 Navigare atelier**: Corectate link-uri de navigare defecte în README.md atelier către folderul lab-1-azd-basics inexistent

#### Modificat
- **Prezentare atelier**: Eliminat avertismentul „în construcție”, atelierul este acum complet și gata de utilizare
- **Consistență navigare**: Asigurată navigare adecvată între toate modulele atelierului
- **Referințe traseu învățare**: Actualizate referințele între capitole pentru căile corecte microsoft-foundry

#### Validat
- ✅ Toate fișierele markdown în engleză au link-uri interne valide
- ✅ Modulele atelier 0-7 sunt complete cu obiectivele de învățare
- ✅ Navigarea între capitole și module funcționează corect
- ✅ Conținut adecvat dezvoltatorilor AI care folosesc Microsoft AZD
- ✅ Limbaj prietenos începătorilor și structură păstrată
- ✅ CONTRIBUTING.md oferă ghidaj clar pentru contribuitorii comunității

#### Implementare tehnică
- **Validare link-uri**: Script PowerShell automatizat a verificat toate link-urile .md interne
- **Audit conținut**: Revizuire manuală pentru completitudinea atelierului și potrivirea pentru începători
- **Sistem navigare**: Aplicate tipare consistente de navigare prin capitole și module

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză
- **Traduceri**: Folderele de traduceri nu au fost actualizate în această versiune (sincronizare automată ulterioară)
- **Durata atelierului**: Atelierul complet oferă acum 3-4 ore de învățare practică

---

### [v3.8.0] - 2025-11-19

#### Documentație avansată: Monitorizare, Securitate și Modele Multi-Agent
**Această versiune adaugă lecții cuprinzătoare de calitate A despre integrarea Application Insights, modele de autentificare și coordonare multi-agent pentru implementări în producție.**

#### Adăugat
- **📊 Lecția Integrare Application Insights**: în `docs/pre-deployment/application-insights.md`:
  - Implementare AZD cu provisioning automat
  - Șabloane Bicep complete pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1.200 de linii)
  - Modele de monitorizare AI/LLM (urmărire tokeni/costuri Microsoft Foundry Models)
  - 6 diagrame Mermaid (arhitectură, urmărire distribuită, flux telemetrie)
  - 3 exerciții practice (alerte, dashboard-uri, monitorizare AI)
  - Exemple de interogări Kusto și strategii de optimizare a costurilor
  - Transmisie metrici live și depanare în timp real
  - 40-50 minute timp de învățare cu modele pregătite pentru producție

- **🔐 Lecția Modele Autentificare & Securitate**: în `docs/getting-started/authsecurity.md`:
  - 3 modele de autentificare (șiruri de conexiune, Key Vault, identitate gestionată)
  - Șabloane Bicep complete pentru implementări sigure
  - Cod aplicații Node.js cu integrare SDK Azure
  - 3 exerciții complete (activare identitate gestionată, identitate atribuită utilizator, rotirea Key Vault)
  - Cele mai bune practici de securitate și configurări RBAC
  - Ghid de depanare și analiză costuri
  - Modele autentificare fără parolă pregătite pentru producție

- **🤖 Lecția Modele Coordonare Multi-Agent**: în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (secuențial, paralel, ierarhic, declanșat de eveniment, consens)
  - Implementare completă orchestrator servicii (Python/Flask, peste 1500 linii)
  - 3 implementări specializate agenți (Cercetare, Redactor, Editor)
  - Integrare Service Bus pentru cozi mesaje
  - Gestionare stare Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid ce arată interacțiuni agenți
  - 3 exerciții avansate (gestionarea timeout, logica retry, circuit breaker)
  - Despărțire costuri (240-565$/lună) cu strategii de optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățit
- **Capitol Pre-implementare**: Include acum modele cuprinzătoare de monitorizare și coordonare
- **Capitol Începători**: Îmbunătățit cu modele profesionale de autentificare
- **Pregătire Producție**: Acoperire completă de la securitate la observabilitate
- **Plan Curs**: Actualizat pentru a include noile lecții din Capitolele 3 și 6

#### Modificat
- **Progresul învățării**: Integrare mai bună a securității și monitorizării pe parcursul cursului
- **Calitatea documentației**: Standard A de calitate consecventă (95-97%) pentru noile lecții
- **Modele producție**: Acoperire completă cap la cap pentru implementări enterprise

#### Îmbunătățit
- **Experiența dezvoltatorului**: Parcurs clar de la dezvoltare la monitorizare producție
- **Standardele de securitate**: Modele profesionale pentru autentificare și gestionare secrete
- **Observabilitate**: Integrare completă Application Insights cu AZD
- **Sarcini AI**: Monitorizare specializată pentru Microsoft Foundry Models și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile includ cod complet funcțional (nu doar fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 în total în 3 lecții)
- ✅ Exerciții practice cu pași de verificare (9 în total)
- ✅ Șabloane Bicep pregătite pentru producție, implementabile cu `azd up`
- ✅ Analiză și strategii de optimizare costuri
- ✅ Ghiduri de depanare și bune practici
- ✅ Checkpoint-uri de cunoștințe cu comenzi de verificare

#### Rezultate evaluare documentație
- **docs/pre-deployment/application-insights.md**: - Ghid cuprinzător de monitorizare
- **docs/getting-started/authsecurity.md**: - Modele profesionale de securitate
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent
- **Conținut nou general**: - Standard de calitate înaltă consecvent

#### Implementare tehnică
- **Application Insights**: Log Analytics + telemetrie personalizată + urmărire distribuită
- **Autentificare**: Identitate gestionată + Key Vault + modele RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare**: Metrici live + interogări Kusto + alerte + dashboard-uri
- **Gestionare costuri**: Strategii de eșantionare, politici retenție, control buget

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri calitate documentație și nou exemplu Microsoft Foundry Models
**Această versiune îmbunătățește calitatea documentației în întregul depozit și adaugă un exemplu complet de implementare Microsoft Foundry Models cu interfață chat gpt-4.1.**

#### Adăugat
- **🤖 Exemplu chat Microsoft Foundry Models**: Implementare completă gpt-4.1 în `examples/azure-openai-chat/`:
  - Infrastructură completă Microsoft Foundry Models (implementare model gpt-4.1)
  - Interfață chat linie de comandă Python cu istoric conversații
  - Integrare Key Vault pentru stocare securizată cheie API
  - Monitorizarea utilizării tokenilor și estimarea costurilor
  - Limitare rată și gestionare erori
  - README complet cu ghid de implementare 35-45 minute
  - 11 fișiere gata de producție (șabloane Bicep, aplicație Python, configurație)
- **📚 Exerciții documentație**: Adăugate exerciții practice în ghidul de configurare:
  - Exercițiul 1: Configurare multi-mediu (15 minute)
  - Exercițiul 2: Practică gestionare secrete (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare implementare**: Adăugată secțiune de verificare în ghidul de lansare:
  - Proceduri verificare stare sănătate
  - Listă de verificare a criteriilor de succes
  - Rezultate așteptate pentru toate comenzile de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățit
- **examples/README.md**: Actualizat la calitate A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Actualizat numărul exemplelor locale de la 3 la 4
  - Adăugat în tabelul Exemple Aplicații AI
  - Integrat în Quick Start pentru utilizatori intermediari
  - Adăugat în secțiunea Microsoft Foundry Templates
  - Actualizat matrice comparativă și secțiuni tehnologii/descoperire
- **Calitate documentație**: Îmbunătățit B+ (87%) → A- (92%) în folderul docs:
  - Adăugat rezultate așteptate pentru comenzile critice
  - Inclus pași de verificare pentru modificări configurare
  - Îmbunătățit învățarea practică cu exerciții relevante

#### Modificat
- **Progres învățare**: Integrare mai bună a exemplelor AI pentru începători intermediari
- **Structură documentație**: Mai multe exerciții aplicabile cu rezultate clare
- **Proces verificare**: Criterii explicite de succes adăugate în fluxuri cheie

#### Îmbunătățit
- **Experiența dezvoltatorului**: Implementarea Microsoft Foundry Models durează acum 35-45 minute (vs 60-90 pentru alternative complexe)
- **Transparență costuri**: Estimări clare de cost ($50-200/lună) pentru exemplul Microsoft Foundry Models
- **Parcurs de învățare**: Dezvoltatorii AI au punct clar de intrare cu azure-openai-chat
- **Standard documentație**: Rezultate așteptate și pași de verificare consecvenți

#### Validat
- ✅ Exemplul Microsoft Foundry Models funcționează complet cu `azd up`
- ✅ Toate cele 11 fișiere de implementare corecte sintactic
- ✅ Instrucțiunile README se potrivesc cu experiența efectivă de implementare
- ✅ Link-uri în documentație actualizate în peste 8 locuri
- ✅ Indexul exemplelor reflectă 4 exemple locale corect
- ✅ Nu există linkuri externe duplicate în tabele
- ✅ Toate referințele de navigare corecte

#### Implementare tehnică
- **Arhitectura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps pattern
- **Securitate**: Identitate gestionată pregătită, secrete în Key Vault
- **Monitorizare**: Integrare Application Insights
- **Gestionare costuri**: Urmărire tokeni și optimizare utilizare
- **Implementare**: O singură comandă `azd up` pentru configurare completă

### [v3.6.0] - 2025-11-19

#### Actualizare majoră: Exemple implementare Container App
**Această versiune introduce exemple cuprinzătoare, gata de producție, pentru implementări de aplicații containerizate folosind Azure Developer CLI (AZD), cu documentație completă și integrare în parcursul de învățare.**

#### Adăugat
- **🚀 Exemple Container App**: Exemple locale noi în `examples/container-app/`:
  - [Ghid principal](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, început rapid, producție și modele avansate
  - [API Flask simplu](../../examples/container-app/simple-flask-api): API REST prietenos pentru începători, cu scale-to-zero, probe sănătate, monitorizare și depanare
  - [Arhitectură microservicii](../../examples/container-app/microservices): Implementare multi-servicii gata pentru producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, urmărire distribuită, implementare blue-green/canary
- **Bune practici**: Securitate, monitorizare, optimizare costuri, ghid CI/CD pentru sarcini containerizate
- **Exemple cod**: Fișier complet `azure.yaml`, șabloane Bicep, implementări multi-limbaj servicii (Python, Node.js, C#, Go)
- **Testare & depanare**: Scenarii test end-to-end, comenzi monitorizare, ghiduri depanare

#### Modificat
- **README.md**: Actualizat pentru a afișa și linka noile exemple container app sub „Exemple locale - Aplicații containerizate”
- **examples/README.md**: Actualizat pentru a evidenția exemple container app, adăugat intrări matrice comparativă și actualizat referințe tehnologii/arhitecturi
- **Plan curs & Ghid studiu**: Actualizat pentru a face referire la noile exemple container app și modele de implementare în capitole relevante

#### Validat
- ✅ Toate noile exemple pot fi implementate cu `azd up` și urmează bune practici
- ✅ Legături în documentație și navigare actualizate
- ✅ Exemple acoperă scenarii de la începător la avansat, incluzând microservicii în producție

#### Note
- **Domeniu**: Documentație și exemple în limba engleză exclusiv
- **Pași următori**: Extindere cu modele container avansate și automatizare CI/CD în versiuni viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding produs: Microsoft Foundry
**Această versiune implementează o schimbare completă a denumirii produsului din "Microsoft Foundry" în "Microsoft Foundry" în toate documentele în limba engleză, reflectând rebranding-ul oficial Microsoft.**

#### Modificat
- **🔄 Actualizare denumire produs**: Rebranding complet de la "Microsoft Foundry" la "Microsoft Foundry"
  - Actualizate toate referințele din documentația în limba engleză din folderul `docs/`
  - Redenumit folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Redenumit fișier: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referințe de conținut actualizate în 7 fișiere de documentație

- **📁 Modificări Structură Dosare**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele încrucișate actualizate pentru a reflecta noua structură de dosare
  - Legăturile de navigare validate în toate documentațiile

- **📄 Redenumiri Fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate legăturile interne actualizate pentru a face referire la noul nume de fișier

#### Fișiere Actualizate
- **Documentația Capitolelor** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări ale legăturilor de navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe ale numelui produsului actualizate
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Folosind deja Microsoft Foundry (din actualizările anterioare)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 legături de referință încrucișată actualizate
  - `docs/getting-started/first-project.md` - 2 legături de navigare ale capitolului actualizate
  - `docs/getting-started/installation.md` - 2 legături pentru capitolul următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitate Discord)
  - `docs/troubleshooting/common-issues.md` - 1 legătură de navigare actualizată
  - `docs/troubleshooting/debugging.md` - 1 legătură de navigare actualizată

- **Fișiere Structură Curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentare curs, titluri capitole, secțiune șabloane, perspective comunitate)
  - `course-outline.md` - 14 referințe actualizate (prezentare generală, obiective de învățare, resurse capitole)

#### Validat
- ✅ Nicio referință rămasă la calea folderului "ai-foundry" în documentele în limba engleză
- ✅ Nicio referință rămasă la numele produsului "Microsoft Foundry" în documentele în limba engleză
- ✅ Toate legăturile de navigare funcționează cu noua structură de dosare
- ✅ Redenumirile fișierelor și dosarelor finalizate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Note
- **Domeniu**: Modificări aplicate doar documentației în limba engleză din dosarul `docs/`
- **Traduceri**: Dosarele de traducere (`translations/`) nu au fost actualizate în această versiune
- **Workshop**: Materialele de workshop (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele de exemplu pot încă face referire la denumiri vechi (vor fi abordate la următoarea actualizare)
- **Legături Externe**: URL-urile externe și referințele către depozitul GitHub rămân neschimbate

#### Ghid de Migrare pentru Contribuitori
Dacă aveți ramuri locale sau documentație care face referire la structura veche:
1. Actualizați referințele dosarelor: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizați referințele fișierelor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți numele produsului: "Microsoft Foundry" → "Microsoft Foundry"
4. Verificați dacă toate legăturile interne din documentație funcționează corect

---

### [v3.4.0] - 2025-10-24

#### Îmbunătățiri Previziune și Validare a Infrastructurii
**Această versiune introduce suport amplu pentru noua funcționalitate de previzualizare a Azure Developer CLI și îmbunătățește experiența utilizatorului în cadrul atelierului.**

#### Adăugat
- **🧪 Documentație Funcționalitate azd provision --preview**: Acoperire completă a noii capacități de previzualizare a infrastructurii
  - Referință comandă și exemple de utilizare în foaia de trucuri
  - Integrare detaliată în ghidul de provisionare cu scenarii și beneficii
  - Integrare verificare pre-zbor pentru validarea mai sigură a implementării
  - Actualizări în ghidul de început rapid cu bune practici pentru implementare cu siguranță
- **🚧 Banner Status Atelier**: Banner HTML profesional indicând stadiul de dezvoltare a atelierului
  - Design gradient cu indicatori de construcție pentru comunicare clară către utilizatori
  - Marcaj cu data ultimei actualizări pentru transparență
  - Design responsiv pentru toate tipurile de dispozitive mobile

#### Îmbunătățit
- **Siguranța Infrastructurii**: Funcționalitatea de previzualizare integrată în toate documentele de implementare
- **Validare Pre-Implementare**: Scripturile automate includ acum testarea previzualizării infrastructurii
- **Flux de Lucru al Dezvoltatorului**: Secvențele de comenzi actualizate pentru a include previzualizarea ca bună practică
- **Experiența în Atelier**: Așteptări clare pentru utilizatori privind stadiul de dezvoltare a conținutului

#### Modificat
- **Bune Practici Implementare**: Fluxul de lucru orientat spre previzualizare este acum abordarea recomandată
- **Fluxul Documentației**: Validarea infrastructurii mutată în etapa timpurie a procesului de învățare
- **Prezentare Atelier**: Comunicare profesională a statusului cu timeline clar de dezvoltare

#### Îmbunătățiri
- **Abordare cu Prioritate Siguranță**: Modificările infrastructurii pot fi validate înainte de implementare
- **Colaborare în Echipă**: Rezultatele previzualizării pot fi partajate pentru revizuire și aprobare
- **Conștientizarea Costurilor**: Înțelegere mai bună a costurilor resurselor înainte de provisionare
- **Reducerea Riscurilor**: Mai puține eșecuri de implementare prin validare anticipată

#### Implementare Tehnică
- **Integrare Multidocument**: Funcționalitatea de previzualizare documentată în 4 fișiere cheie
- **Modele de Comandă**: Sintaxă și exemple consistente în toate documentele
- **Integrarea Bunei Practici**: Previziune inclusă în fluxurile de validare și scripturi
- **Indicatori Vizuali**: Marcaje clare cu funcționalitate NOUĂ pentru descoperire facilă

#### Infrastructură Atelier
- **Comunicare Status**: Banner HTML profesional cu stilizare de gradient
- **Experiența Utilizatorului**: Status clar de dezvoltare previne confuziile
- **Prezentare Profesională**: Menține credibilitatea depozitului și stabilește așteptări
- **Transparență Timeline**: Data ultimei actualizări în octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale de Workshop Îmbunătățite și Experiență Interactivă de Învățare
**Această versiune introduce materiale cuprinzătoare de workshop cu ghiduri interactive în browser și trasee de învățare structurate.**

#### Adăugat
- **🎥 Ghid Workshop Interactiv**: Experiență de workshop bazată pe browser cu capacitate de previzualizare MkDocs
- **📝 Instrucțiuni Structurate Workshop**: Parcurs de învățare ghidat în 7 pași de la descoperire la personalizare
  - 0-Introducere: Prezentare și configurare atelier
  - 1-Selectare-Șablon-AI: Descoperire și selecție șabloane
  - 2-Validare-Șablon-AI: Proceduri de implementare și validare
  - 3-Deconstruire-Șablon-AI: Înțelegerea arhitecturii șablonului
  - 4-Configurare-Șablon-AI: Configurare și personalizare
  - 5-Personalizare-Șablon-AI: Modificări avansate și iterații
  - 6-Demontare-Infrastructură: Curățare și gestionare resurse
  - 7-Încheiere: Rezumat și pași următori
- **🛠️ Unelte pentru Workshop**: Configurare MkDocs cu temă Material pentru experiență de învățare îmbunătățită
- **🎯 Parcurs Practice de Învățare**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare fluidă a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI Workshop**: Extins cu experiență de învățare structurată de 2-3 ore
- **Documentație Workshop**: Prezentare profesională cu navigare și suport vizual
- **Progresul Învățării**: Ghid pas cu pas clar de la selecția șablonului până la implementare în producție
- **Experiența Dezvoltatorului**: Unelte integrate pentru fluxuri de lucru eficiente

#### Îmbunătățiri
- **Accesibilitate**: Interfață browser cu funcție de căutare, copiere și comutare temă
- **Învățare în Ritm Propriu**: Structură flexibilă a atelierului pentru diferite viteze de învățare
- **Aplicație Practică**: Scenarii reale de implementare șablon AI
- **Integrare Comunitate**: Integrare Discord pentru suport și colaborare în workshop

#### Funcționalități Workshop
- **Căutare Integrată**: Descoperire rapidă de cuvinte cheie și lecții
- **Copiere Blocuri Cod**: Funcționalitate hover-to-copy pentru toate exemplele de cod
- **Comutare Temă**: Mod întunecat/luminos pentru preferințe diverse
- **Resurse Vizuale**: Capturi de ecran și diagrame pentru înțelegere îmbunătățită
- **Integrare Ajutor**: Acces direct la Discord pentru suport comunitate

### [v3.2.0] - 2025-09-17

#### Restructurare Majoră a Navigării și Sistem de Învățare pe Capitole
**Această versiune introduce un sistem cuprinzător de învățare structurat pe capitole cu navigare îmbunătățită în întregul depozit.**

#### Adăugat
- **📚 Sistem de Învățare pe Capitole**: Restructurarea întregului curs în 8 capitole de învățare progresivă
  - Capitolul 1: Bază & Pornire Rapidă (⭐ - 30-45 minute)
  - Capitolul 2: Dezvoltare AI-First (⭐⭐ - 1-2 ore)
  - Capitolul 3: Configurare & Autentificare (⭐⭐ - 45-60 minute)
  - Capitolul 4: Infrastructură ca Cod & Implementare (⭐⭐⭐ - 1-1.5 ore)
  - Capitolul 5: Soluții Multi-Agent AI (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolul 6: Validare & Planificare Pre-Implementare (⭐⭐ - 1 oră)
  - Capitolul 7: Depanare & Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolul 8: Modele pentru Producție & Enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistem de Navigare Complet**: Anteturi și subsoluri de navigare consistente în întreaga documentație
- **🎯 Monitorizare Progres**: Listă de verificare a progresului cursului și sistem de verificare a învățării
- **🗺️ Ghidare Parcurs de Învățare**: Puncte de intrare clare pentru niveluri și obiective diferite
- **🔗 Navigare cu Referințe Înrucișate**: Legături clare către capitole conexe și prerechizite

#### Îmbunătățit
- **Structura README**: Transformată într-o platformă de învățare structurată pe capitole
- **Navigare Documentație**: Fiecare pagină include acum contextul capitolului și ghid de progresie
- **Organizarea Șabloanelor**: Exemplele și șabloanele mapate pe capitolele de învățare corespunzătoare
- **Integrarea Resurselor**: Foi de trucuri, întrebări frecvente și ghiduri de studiu conectate la capitole relevante
- **Integrarea Workshop**: Laboratoare practice legate de obiective multiple de învățare pe capitole

#### Modificat
- **Progresul Învățării**: Mutat de la documentație liniară la învățare flexibilă pe capitole
- **Locația Configurării**: Ghidul de configurare repoziționat ca Capitolul 3 pentru flux mai bun al învățării
- **Integrarea Conținutului AI**: Integrare mai bună a conținutului AI pe întregul parcurs de învățare
- **Conținut Producție**: Modele avansate consolidate în Capitolul 8 pentru cursanți enterprise

#### Îmbunătățit
- **Experiență Utilizator**: Breadcrumb-uri clare de navigare și indicatoare de progres pe capitole
- **Accesibilitate**: Modele consistente de navigare pentru parcurgere facilă a cursului
- **Prezentare Profesională**: Structură universitară a cursului, potrivită pentru formare academică și corporativă
- **Eficiență Învățare**: Timp redus de găsire a conținutului relevant prin organizare îmbunătățită

#### Implementare Tehnică
- **Anteturi Navigare**: Navigare standardizată pe capitole în peste 40 de fișiere de documentație
- **Navigare în Subsol**: Ghidaj constant al progresului și indicatori de finalizare capitol
- **Legături Încrucișate**: Sistem extins de legături interne conectând concepte corelate
- **Maparea Capitolelor**: Șabloanele și exemplele asociate clar cu obiectivele de învățare

#### Îmbunătățire Ghid de Studiu
- **📚 Obiective de Învățare Cuprinzătoare**: Ghid de studiu restructurat conform sistemului de 8 capitole
- **🎯 Evaluare pe Capitole**: Fiecare capitol conține obiective specifice și exerciții practice
- **📋 Monitorizare Progres**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare
- **❓ Întrebări de Evaluare**: Întrebări pentru validarea cunoștințelor cu rezultate profesionale
- **🛠️ Exerciții Practice**: Activități hands-on cu scenarii reale de implementare și depanare
- **📊 Progresie de Competențe**: Avansare clară de la concepte de bază la modele enterprise cu accent pe dezvoltare profesională
- **🎓 Cadru de Certificare**: Rezultate profesionale și sistem de recunoaștere comunitară
- **⏱️ Management Timp**: Plan de învățare structurat pe 10 săptămâni cu validare de jaloane

### [v3.1.0] - 2025-09-17

#### Soluții Multi-Agent AI Îmbunătățite
**Această versiune îmbunătățește soluția multi-agent pentru retail cu denumiri mai clare ale agenților și documentație îmbunătățită.**

#### Modificat
- **Termenologie Multi-Agent**: Înlocuit "agentul Cora" cu "agentul Client" în toată soluția multi-agent pentru retail pentru o înțelegere mai clară
- **Arhitectura Agenților**: Actualizată toată documentația, șabloanele ARM și exemplele de cod pentru a folosi denumirea consistentă "Agent Client"
- **Exemple Configurare**: Modernizat modelele de configurare agent cu noile convenții de denumire
- **Consistență Documentație**: Asigurat că toate referințele folosesc denumiri profesionale și descriptive pentru agenți

#### Îmbunătățit
- **Pachet Șablon ARM**: Actualizat retail-multiagent-arm-template cu referințe la Agent Client
- **Diagrame Arhitectură**: Reîmprospătate diagramele Mermaid cu denumirea actualizată a agenților
- **Exemple Cod**: Clase Python și implementări de exemplu utilizează acum denumirea CustomerAgent
- **Variabile Mediu**: Actualizate toate scripturile de implementare pentru variabile CUSTOMER_AGENT_NAME

#### Îmbunătățit
- **Experiență Dezvoltator**: Roluri și responsabilități ale agenților mai clare în documentație
- **Pregătire Producție**: Alignare mai bună cu convenții de denumire enterprise
- **Materiale de Învățare**: Denumire agenți mai intuitivă pentru scopuri educaționale
- **Usabilitate Șablon**: Înțelegere simplificată a funcțiilor agenților și a modelelor de implementare

#### Detalii Tehnice
- Actualizate diagramele Mermaid cu referințe la CustomerAgent
- Înlocuite denumirile claselor CoraAgent cu CustomerAgent în exemplele Python
- Modificate configurațiile JSON ale șablonului ARM pentru a folosi tipul agent "customer"
- Actualizate variabilele de mediu de la CORA_AGENT_* la CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurațiile containerelor

### [v3.0.0] - 2025-09-12

#### Modificări Majore - Focus pe Dezvoltatori AI și Integrare Microsoft Foundry
**Această versiune transformă depozitul într-o resursă completă de învățare axată pe AI cu integrare Microsoft Foundry.**

#### Adăugat
- **🤖 Parcurs de Învățare AI-First**: Restructurare completă cu prioritate pentru dezvoltatorii și inginerii AI
- **Ghid Integrare Microsoft Foundry**: Documentație cuprinzătoare pentru conectarea AZD la serviciile Microsoft Foundry
- **Modele de Implementare AI**: Ghid detaliat acoperind selecția modelelor, configurarea și strategiile de implementare în producție
- **Laborator de Atelier AI**: Atelier practic de 2-3 ore pentru convertirea aplicațiilor AI în soluții implementabile prin AZD  
- **Cele Mai Bune Practici pentru AI în Producție**: Modele gata pentru întreprinderi privind scalarea, monitorizarea și securizarea încărcărilor de lucru AI  
- **Ghid Specific de Depanare AI**: Depanare cuprinzătoare pentru modelele Microsoft Foundry, Cognitive Services și probleme de implementare AI  
- **Galerie de Șabloane AI**: Colecție selectă de șabloane Microsoft Foundry cu evaluări de complexitate  
- **Materiale pentru Atelier**: Structură completă de atelier cu laboratoare practice și materiale de referință  

#### Îmbunătățit  
- **Structura README**: Axată pe dezvoltatorii AI cu 45% date privind interesul comunității din Discord Microsoft Foundry  
- **Căi de Învățare**: Parcurs dedicat dezvoltatorilor AI alături de căile tradiționale pentru studenți și ingineri DevOps  
- **Recomandări de Șabloane**: Șabloane AI evidențiate, inclusiv azure-search-openai-demo, contoso-chat și openai-chat-app-quickstart  
- **Integrare Comunitară**: Suport extins pentru comunitatea Discord cu canale și discuții specifice AI  

#### Focalizare pe Securitate & Producție  
- **Modele de Identitate Gestionate**: Configurații specifice AI pentru autentificare și securitate  
- **Optimizarea Costurilor**: Urmărire consum tokeni și control buget pentru încărcările AI  
- **Implementare Multi-Regiune**: Strategii pentru distribuirea globală a aplicațiilor AI  
- **Monitorizarea Performanței**: Metrici specifice AI și integrare cu Application Insights  

#### Calitatea Documentației  
- **Structură Lineară a Cursului**: Progresie logică de la modele de implementare AI începător la avansat  
- **URL-uri Validate**: Toate link-urile externe spre depozite verificate și accesibile  
- **Referință Completă**: Toate legăturile interne din documentație validate și funcționale  
- **Gata pentru Producție**: Modele de implementare pentru întreprinderi cu exemple din lumea reală  

### [v2.0.0] - 2025-09-09  

#### Modificări Majore - Reorganizare a Depozitului și Îmbunătățire Profesională  
**Această versiune reprezintă o restructurare semnificativă a structurii depozitului și a prezentării conținutului.**  

#### Adăugat  
- **Cadru Structurat de Învățare**: Toate paginile documentației includ acum secțiunile Introducere, Obiective de Învățare și Rezultate așteptate  
- **Sistem de Navigare**: Adăugate linkuri de Lecția Anterioară/Următoare în toată documentația pentru progres ghidat  
- **Ghid de Studiu**: study-guide.md cu obiective de învățare, exerciții practice și materiale de evaluare  
- **Prezentare Profesională**: Eliminat tot conținutul emoji pentru accesibilitate și aspect profesional îmbunătățit  
- **Structură îmbunătățită a conținutului**: Organizare și flux îmbunătățit al materialelor de învățare  

#### Modificat  
- **Formatul Documentației**: Standardizarea întregii documentații pentru structură consistentă, axată pe învățare  
- **Fluxul de Navigare**: Implementarea unui progres logic prin toate materialele de învățare  
- **Prezentarea Conținutului**: Eliminarea elementelor decorative în favoarea unui format clar și profesional  
- **Structura Linkurilor**: Actualizarea tuturor linkurilor interne pentru a susține noul sistem de navigare  

#### Îmbunătățit  
- **Accesibilitate**: Eliminarea dependențelor de emoji pentru compatibilitate mai bună cu cititoarele de ecran  
- **Aspect Profesional**: Prezentare clară, în stil academic, potrivită pentru învățarea în întreprinderi  
- **Experiența de Învățare**: Abordare structurată cu obiective și rezultate clare pentru fiecare lecție  
- **Organizarea Conținutului**: Flux logic mai bun și conexiune între subiectele înrudite  

### [v1.0.0] - 2025-09-09  

#### Lansare Inițială - Depozit Complet de Învățare AZD  

#### Adăugat  
- **Structura Fundamentală a Documentației**  
  - Serii complete de ghiduri de inițiere  
  - Documentație cuprinzătoare pentru implementare și provisioning  
  - Resurse detaliate pentru depanare și ghiduri de depanare  
  - Instrumente și proceduri de validare pre-implementare  

- **Modul de Însușire**  
  - Bazele AZD: concepte și terminologie de bază  
  - Ghid de Instalare: instrucțiuni specifice platformei  
  - Ghid de Configurare: setarea mediului și autentificarea  
  - Tutorial Proiect Inițial: învățare practică pas cu pas  

- **Modul Implementare și Provisioning**  
  - Ghid de Implementare: documentație completă a fluxului de lucru  
  - Ghid de Provisioning: Infrastructure as Code cu Bicep  
  - Cele mai bune practici pentru implementări în producție  
  - Modele arhitecturale multi-serviciu  

- **Modul Validare Pre-Implementare**  
  - Planificare Capacitate: validarea disponibilității resurselor Azure  
  - Alegerea SKU: ghid complet pentru niveluri de servicii  
  - Verificări Preliminare: scripturi automate de validare (PowerShell și Bash)  
  - Estimarea costurilor și planificarea bugetului  

- **Modul Depanare**  
  - Probleme Comune: probleme frecvente și soluții  
  - Ghid de Debugging: metodologii sistematice de depanare  
  - Tehnici și instrumente avansate de diagnostic  
  - Monitorizarea și optimizarea performanței  

- **Resurse și Referințe**  
  - Fișă de Comenzi: referință rapidă pentru comenzi esențiale  
  - Glosar: definiții și acronime complete  
  - FAQ: răspunsuri detaliate la întrebări frecvente  
  - Linkuri externe către resurse și conexiuni comunitare  

- **Exemple și Șabloane**  
  - Exemplu simplu de aplicație web  
  - Șablon de implementare pentru site static  
  - Configurare aplicație container  
  - Modele de integrare bază de date  
  - Exemple de arhitectură microservicii  
  - Implementări funcții serverless  

#### Funcționalități  
- **Suport Multi-platformă**: ghiduri de instalare și configurare pentru Windows, macOS și Linux  
- **Niveluri Multiple de Competență**: conținut destinat studenților și dezvoltatorilor profesioniști  
- **Focalizare Practică**: exemple hands-on și scenarii din lumea reală  
- **Acoperire Completă**: de la concepte de bază la modele avansate de întreprindere  
- **Abordare Prioritară pe Securitate**: cele mai bune practici de securitate integrate peste tot  
- **Optimizarea Costurilor**: ghid pentru implementări eficiente ca preț și gestiunea resurselor  

#### Calitatea Documentației  
- **Exemple Detaliate de Cod**: mostre practice, testate  
- **Instrucțiuni Pas cu Pas**: îndrumări clare și aplicabile  
- **Gestionarea Completă a Erorilor**: depanare pentru probleme comune  
- **Integrarea celor Mai Bune Practici**: standarde și recomandări din industrie  
- **Compatibilitatea Versiunilor**: actualizat cu ultimele servicii Azure și funcționalități azd  

## Îmbunătățiri Viitoare Planificate  

### Versiunea 3.1.0 (Planificată)  
#### Extinderea Platformei AI  
- **Suport Multi-Model**: modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate  
- **Cadre pentru Agenți AI**: șabloane pentru implementări LangChain, Semantic Kernel și AutoGen  
- **Modele Avansate RAG**: opțiuni pentru baze de date vectoriale în afară de Azure AI Search (Pinecone, Weaviate etc.)  
- **Observabilitate AI**: monitorizare îmbunătățită pentru performanța modelelor, consumul de tokeni și calitatea răspunsurilor  

#### Experiența Dezvoltatorului  
- **Extensie VS Code**: experiență integrată de dezvoltare AZD + Microsoft Foundry  
- **Integrare GitHub Copilot**: generare șabloane AZD asistată AI  
- **Tutoriale Interactive**: exerciții practice de programare cu validare automată pentru scenarii AI  
- **Conținut Video**: tutoriale video suplementare pentru învățarea vizuală, orientate pe implementări AI  

### Versiunea 4.0.0 (Planificată)  
#### Modele AI pentru Întreprinderi  
- **Cadru de Guvernanță**: guvernanță modele AI, conformitate și audit  
- **AI Multi-Chiriaș**: modele pentru servirea mai multor clienți cu servicii AI izolate  
- **Implementare Edge AI**: integrare cu Azure IoT Edge și instanțe containerizate  
- **AI Cloud Hibrid**: modele de implementare multi-cloud și hibride pentru sarcini AI  

#### Funcții Avansate  
- **Automatizare Pipeline AI**: integrarea MLOps cu pipeline-uri Azure Machine Learning  
- **Securitate Avansată**: modele zero-trust, endpoint-uri private și protecție avansată împotriva amenințărilor  
- **Optimizarea Performanței**: reglaje și strategii de scalare pentru aplicații AI de mare volum  
- **Distribuție Globală**: modele de livrare de conținut și caching la margine pentru aplicații AI  

### Versiunea 3.0.0 (Planificată) - Înlocuită de Lansarea Curentă  
#### Adăugări Propuse - Acum Implementate în v3.0.0  
- ✅ **Conținut Axat pe AI**: integrare Microsoft Foundry completă (Finalizat)  
- ✅ **Tutoriale Interactive**: laborator hands-on AI (Finalizat)  
- ✅ **Modul de Securitate Avansat**: modele de securitate specifice AI (Finalizat)  
- ✅ **Optimizarea Performanței**: strategii de reglaj pentru sarcini AI (Finalizat)  

### Versiunea 2.1.0 (Planificată) - Parțial Implementată în v3.0.0  
#### Îmbunătățiri Minore - Unele Finalizate în Lansarea Curentă  
- ✅ **Exemple Suplimentare**: scenarii de implementare specifice AI (Finalizat)  
- ✅ **FAQ Extins**: întrebări și depanare AI (Finalizat)  
- **Integrare Unelte**: ghiduri avansate pentru integrarea IDE și editor  
- ✅ **Extindere Monitorizare**: modele de monitorizare și alertare specifice AI (Finalizat)  

#### În Continuare Planificate pentru Lansări Viitoare  
- **Documentație Prietenoasă pentru Mobil**: design responsiv pentru învățare mobilă  
- **Acces Offline**: pachete descărcabile de documentație  
- **Integrare IDE Extinsă**: extensie VS Code pentru fluxuri AZD + AI  
- **Tablou de Bord Comunitar**: metrici comunitare în timp real și urmărirea contribuțiilor  

## Contribuții la Jurnalul de Modificări  

### Raportarea Modificărilor  
La contribuirea în acest depozit, vă rugăm să includeți în jurnalul de modificări:  

1. **Numărul Versiunii**: conform versionării semantice (major.minor.patch)  
2. **Data**: data lansării sau actualizării în format YYYY-MM-DD  
3. **Categoria**: Adăugat, Modificat, Depreciat, Eliminat, Remediat, Securitate  
4. **Descriere Clară**: descriere concisă a modificării  
5. **Evaluarea Impactului**: cum afectează modificările utilizatorii existenți  

### Categorii de Modificări  

#### Adăugat  
- Funcționalități noi, secțiuni de documentație sau capacități  
- Exemple noi, șabloane sau resurse de învățare  
- Instrumente suplimentare, scripturi sau utilitare  

#### Modificat  
- Modificări la funcționalitatea sau documentația existentă  
- Actualizări pentru claritate sau acuratețe  
- Restructurarea conținutului sau organizării  

#### Depreciat  
- Funcționalități sau metode ce urmează a fi eliminate  
- Secțiuni de documentație programate pentru eliminare  
- Metode cu alternative mai bune  

#### Eliminat  
- Funcționalități, documentație sau exemple nerelevante în prezent  
- Informații învechite sau metode depreciate  
- Conținut redundant sau consolidat  

#### Remediat  
- Corecturi de erori în documentație sau cod  
- Rezolvarea problemelor raportate  
- Îmbunătățiri legate de acuratețe sau funcționalitate  

#### Securitate  
- Îmbunătățiri sau corecturi legate de securitate  
- Actualizări ale celor mai bune practici de securitate  
- Rezolvarea vulnerabilităților de securitate  

### Ghid de Versionare Semantică  

#### Versiune Majoră (X.0.0)  
- Modificări incompatibile care necesită acțiune din partea utilizatorului  
- Restructurări semnificative ale conținutului sau organizării  
- Schimbări care modifică abordarea sau metodologia fundamentală  

#### Versiune Minoră (X.Y.0)  
- Funcționalități noi sau adăugări de conținut  
- Îmbunătățiri care păstrează compatibilitatea retroactivă  
- Exemple, instrumente sau resurse suplimentare  

#### Versiune Patch (X.Y.Z)  
- Corecturi de bug-uri și erori  
- Îmbunătățiri minore ale conținutului existent  
- Clarificări și ajustări mici  

## Feedback și Sugestii din Comunitate  

Încurajăm activ feedback-ul comunității pentru îmbunătățirea acestei resurse de învățare:  

### Cum să Oferiți Feedback  
- **Probleme GitHub**: Raportați probleme sau sugerați îmbunătățiri (probleme specifice AI sunt binevenite)  
- **Discuții Discord**: Distribuiți idei și interacționați cu comunitatea Microsoft Foundry  
- **Pull Requests**: Contribuiți cu îmbunătățiri directe conținutului, în special șabloane și ghiduri AI  
- **Discord Microsoft Foundry**: Participați în canalul #Azure pentru discuții AZD + AI  
- **Forumuri Comunitare**: Implicați-vă în discuțiile mai largi pentru dezvoltatori Azure  

### Categorii de Feedback  
- **Acuratețea Conținutului AI**: corecturi privind integrarea serviciilor AI și implementarea  
- **Experiența de Învățare**: sugestii pentru o mai bună progresie a învățării dezvoltatorilor AI  
- **Conținut AI Lipsă**: solicitări pentru șabloane, modele sau exemple AI suplimentare  
- **Accesibilitate**: îmbunătățiri pentru nevoi diverse de învățare  
- **Integrarea Uneltelor AI**: sugestii pentru fluxuri de lucru mai bune de dezvoltare AI  
- **Modele AI pentru Producție**: solicitări pentru modele de implementare AI enterprise  

### Angajament la Răspuns  
- **Răspuns la Probleme**: în 48 de ore pentru probleme raportate  
- **Cereri de Funcții**: evaluare în termen de o săptămână  
- **Contribuții Comunitare**: recenzii în termen de o săptămână  
- **Probleme de Securitate**: prioritate imediată, răspuns rapid  

## Program de Mentenanță  

### Actualizări Regulate  
- **Revizii Lunare**: verificarea acurateței și validarea linkurilor  
- **Actualizări Trimestriale**: adăugări și îmbunătățiri majore de conținut  
- **Revizii Semestriale**: restructurări și îmbunătățiri cuprinzătoare  
- **Lansări Anuale**: actualizări majore de versiune cu îmbunătățiri semnificative  

### Monitorizare și Asigurare a Calității  
- **Testare Automată**: validarea regulată a exemplelor de cod și linkurilor  
- **Integrarea Feedback-ului Comunitar**: integrarea sugestiilor utilizatorilor pe periodic  
- **Actualizări Tehnologice**: alinierea cu cele mai noi servicii Azure și versiuni azd  
- **Audituri de Accesibilitate**: evaluare periodică a principiilor de design incluziv  

## Politica de Suport pentru Versiuni  

### Suport Versiune Curentă  
- **Ultima Versiune Majoră**: suport complet cu actualizări regulate  
- **Versiunea Majoră Anterioară**: actualizări de securitate și remedieri critice timp de 12 luni  
- **Versiuni Legacy**: suport comunitar doar, fără actualizări oficiale  

### Ghid de Migrare  
La lansarea unor versiuni majore se oferă:  
- **Ghiduri de Migrare**: instrucțiuni pas cu pas pentru tranziție  
- **Note de Compatibilitate**: detalii despre schimbările incompatibile  
- **Suport pentru Unelte**: scripturi sau utilitare pentru asistarea migrației  
- **Suport Comunitar**: forumuri dedicate întrebărilor legate de migrare  

---

**Navigare**  
- **Lecția Anterioară**: [Ghid de Studiu](resources/study-guide.md)  
- **Lecția Următoare**: Întoarceți-vă la [README Principal](README.md)  

**Rămâi Actualizat**: Urmăriți acest depozit pentru notificări privind noi lansări și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
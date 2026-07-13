# Changelog - AZD Pentru Începători

## Introducere

Acest changelog documentează toate schimbările notabile, actualizările și îmbunătățirile din depozitul AZD Pentru Începători. Urmăm principiile versionării semantice și menținem acest registru pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de Învățare

Revizuind acest changelog, vei:
- Rămâne informat despre noi funcționalități și adăugiri de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Urmări corecturile și remedierile de erori pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare în timp

## Rezultate ale Învățării

După revizuirea înregistrărilor din changelog, vei putea:
- Identifica conținutul și resursele noi disponibile pentru învățare
- Înțelege care secțiuni au fost actualizate sau îmbunătățite
- Planifica calea ta de învățare bazată pe cele mai actuale materiale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul Versiunilor

### [v3.23.0] - 2026-07-13

#### Actualizare Actualizare AZD 1.27.1: Actualizare Valabilitate Versiune
**Această versiune revalidează cursul împotriva `azd` `1.27.1` (iulie 2026, cea mai recentă versiune stabilă) și extensia curentă de agent AI în previzualizare `azure.ai.agents` `1.0.0-beta.5`, aducând la zi toate bannerele "validate against" după lansările 1.26.0, 1.27.0 și 1.27.1.**

#### Modificări
- **✅ Linie de bază de validare actualizată** de la `azd 1.25.6` (iunie 2026) la `azd 1.27.1` (iulie 2026) în README-ul principal, toate READMEs capitolelor, lecția de dev-container din Capitolul 1 (inclusiv exemplele cu versiuni fixate), lecția de șabloane personalizate din Capitolul 4, lecția pentru multi-agent din Capitolul 5 și documentația workshop-ului
- **🤖 Linie de bază Capitolul 2 reîmprospătată** de la `azd 1.23.12` (martie 2026) la `azd 1.27.1` în `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` și `microsoft-foundry-integration.md`; datele notelor de validare actualizate la 2026-07-13
- **🧩 Extensia agentului AI actualizată** de la `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` la versiunea curentă `1.0.0-beta.5` în README Capitol 2 și `agents.md`
- **🧪 Exemplu de validare în workshop** (output `azd version`) actualizat la `1.27.1`

#### Note despre lansările relevante azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suport Go pentru Azure Functions în Flex Consumption, filtre de abonamente per tenant `azd config sub-filter`, pachete de extensii autonome (`azd x pack --bundle`) și `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Proiectare directă de proiecte/agenti Azure AI Foundry în `azure.yaml` (inițializare fără Bicep/Terraform), suport pentru container deployment în App Service (`host: appservice` + `language: docker`), `-s/--source` direct pentru comenzile `azd extension`, și `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag-ul `--no-dependencies` pentru `azd extension install`, modelele depreciate excluse implicit din catalog și avertizările de cotă, și mai multe corecturi de erori

#### Fișiere Actualizate
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

#### Completare Pentru Începători #2: Autori Șabloane, Containere Dev, Pulumi, Azure DevOps, Principiile de Serviciu și Altele
**Această versiune închide golurile intermediare rămase identificate de analiza acoperirii azd: cum să creezi și să publici propriul șablon, medii reproducibile de dev-container/Codespaces, furnizorul de infrastructură Pulumi, un exemplu de CI/CD Azure DevOps, autentificarea cu principii de serviciu, ghidaj pentru selecția host-ului (AKS/Spring Apps), explicații pentru `azd restore`/`azd package`, tratarea erorilor hook-urilor, și practici pentru echipe/medii partajate.**

#### Adăugat
- **🧱 Lecție nouă Capitolul 4** `docs/chapter-04-infrastructure/custom-templates.md` — crearea propriului șablon azd: structura necesară (`azure.yaml`, `infra/`, `src/`), câmpul `metadata.template`, parametrizarea infrastructurii cu token-ul de resurse `uniqueString()` și eticheta `azd-env-name`, testare locală cu `azd init --template <local-path>`, publicare pe GitHub și trimiterea în galeria Awesome AZD
- **📦 Lecție nouă Capitolul 1** `docs/chapter-01-foundation/dev-containers.md` — medii reproducibile azd cu Dev Containers și GitHub Codespaces: un `.devcontainer/devcontainer.json` minimal folosind feature-ul oficial `ghcr.io/azure/azure-dev/azd`, caracteristici specifice limbajului, `docker-in-docker` pentru gazdele containerelor, și `azd auth login --use-device-code` pentru autentificare la distanță
- **🧩 Pulumi cu azd** secțiune în `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, structura folderului Pulumi, stack-uri mapate la medii azd, ieșiri/etichetare necesare, și fluxul de lucru identic `azd up` / `azd down`
- **🎯 Ghid pentru selecția host-ului** în `docs/chapter-04-infrastructure/provisioning.md` — o comparație prietenoasă pentru începători între `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` și `springapp`, cu recomandări când să alegi AKS sau Azure Spring Apps
- **🛠️ Parcurs CI/CD Azure DevOps** în `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexiune serviciu cu identitate de lucru federată (OIDC), fișierul generat `azure-dev.yml`, și configurarea grupului de variabile
- **🔑 Principii de Serviciu (Pattern 4)** adăugat în `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non-interactiv cu secret client vs. credențiale federate/OIDC, când să folosești, și stocarea sigură a credențialelor
- **🪝 Tratarea erorilor hook** subsecțiune în `docs/chapter-04-infrastructure/deployment-guide.md` — coduri de ieșire și `set -e`, `continueOnError`, testarea hook-urilor izolat cu `azd hooks run`, shell-uri specifice OS, și `--debug`
- **👥 Echipe / medii partajate** secțiune în `docs/chapter-03-configuration/configuration.md` — ce se află în `.azure/`, ce trebuie ignorat de git, medii per dezvoltator, `azd env list`/`select` și furnizarea valorilor de mediu în CI/CD
- **🧰 Explicații pentru `azd restore` și extinderea `azd package`** în `resources/cheat-sheet.md` — restaurarea dependențelor și construirea unui artefact pentru implementat fără a-l implementa

#### Modificat
- **🧭 Tabelul lecțiilor din Capitolul 4** actualizat pentru a include noua lecție "Crearea propriului șablon" (Lecția 3)
- **🧭 Tabelul lecțiilor din Capitolul 1** actualizat pentru a include noua lecție "Dev Containers & Codespaces" (Lecția 5); subsoluri de navigare între `bring-your-own-app.md` și `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Completare Pentru Începători: Lecție Practică Multi-Agent, "Bring Your Own App," Terraform, și Parcurs CI/CD
**Această versiune închide cele mai mari goluri pentru un ghid complet pentru începători adăugând două lecții practice noi (un parcurs multi-agent implementabil și adăugarea azd la o aplicație existentă), o introducere prietenoasă în hook-uri, o secțiune Terraform cu azd, o descriere pas cu pas a pipeline-ului GitHub Actions, o explicație pentru noile extensii în previzualizare, și o listă de verificare explicită de validare a implementării.**

#### Adăugat
- **🤝 Lecție nouă Capitolul 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un parcurs complet practic, implementabil, cu doi agenți (orchestrator + specialiști) folosind un șablon real (`contoso-creative-writer`), abordând când să folosești multi-agent, fluxul de lucru `azd up`, înțelegerea resurselor implementate, trasabilitatea inter-agent, personalizarea și curățarea
- **📦 Lecție nouă Capitolul 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cum să adaugi azd unui proiect existent cu `azd init` ("folosește codul din directorul curent"), înțelegerea `azure.yaml` și `infra/`, `azd infra generate`, detectarea host-ului și implementarea cu `azd up`
- **🌐 Secțiune Terraform cu azd** adăugată în `docs/chapter-04-infrastructure/provisioning.md` — configurare `infra.provider: terraform`, structura folderului `.tf`, ieșirile `AZURE_*` necesare și etichetarea `azd-env-name`, și fluxul identic `azd up` / `azd down` (închide golul în care suportul Terraform era declarat dar era arătat doar Bicep)
- **⚙️ Parcurs pas cu pas GitHub Actions** în `docs/chapter-08-production/production-ai-practices.md` — de la repo GitHub la implementări automate: `azd pipeline config`, credențiale federate OIDC (fără secrete stocate), fișierul generat `azure-dev.yml` și ghid despre secrete vs. variabile
- **🪝 Introducere pentru începători "Noutăți despre hook-uri?"** în `docs/chapter-04-infrastructure/deployment-guide.md` — ce este un hook, tabel de stadii hook, primul hook minimal, și rularea manuală a hook-urilor cu `azd hooks run`
- **✅ Listă de verificare "Verifică-ți Implementarea"** adăugată la Pasul 5 din `docs/chapter-01-foundation/first-project.md` — test de fum, verificare endpoint sănătate și criterii explicite de succes
- **🧩 Explicație pentru noile extensii în previzualizare** `azure.ai.skills` și `azure.ai.connections` (ce sunt și când să le folosești) în `docs/chapter-08-production/production-ai-practices.md`

#### Modificat
- **🧭 Tabelul lecțiilor din Capitolul 5** corectat: `multi-agent-basics.md` este acum Lecția 1 (singura lecție complet practică), indicând cinstit că Lecția 2 este în Capitolul 6 și scenariul Retail este un plan de arhitectură, nu un șablon cu o singură comandă
- **🧭 Tabelul lecțiilor din Capitolul 1** include acum noua lecție "Bring Your Own App" (Lecția 4)
- **🔗 Subsoluri de navigare** actualizate: `first-project.md` acum leagă înainte către `bring-your-own-app.md`

#### Corectat
- **🧱 Închis lacuna Terraform "declarată dar absentă"** — cursul anterior făcea referire la suport Terraform fără a-l arăta efectiv
- **🔀 Corectate linkuri înșelătoare în Capitolul 5** care sugerau că exista o implementare completă multi-agent când era doar un plan de arhitectură

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

#### Reîmprospătare AZD 1.25.6, Comenzi Complete pentru Ciclu de Viață Agent & Rebranding Aspire

**Această versiune revalidează cursul față de `azd` `1.25.6` (iunie 2026) și extensia `azure.ai.agents` `0.1.40-preview`, extinde ghidajul AI de la "scaffold un agent" la ciclul complet de viață al agentului (test → evaluare → optimizare → inspectare → ștergere), evidențiază noile extensii preview `azure.ai.skills` și `azure.ai.connections` și notează rebranduirea produsului ".NET Aspire" → "Aspire".**

#### Adăugat
- **🔁 Acoperire completă a ciclului de viață al agentului** pentru începători și ingineri AI în toate documentele:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabelul ciclului de viață (scaffold → test → măsurare → îmbunătățire → inspectare → curățare) adăugat în secțiunea Extensii și Comenzi AI
  - `docs/chapter-08-production/production-ai-practices.md` — Noua secțiune "Gestionarea ciclului de viață al agentului" acoperind `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` și `delete --force`
  - `resources/cheat-sheet.md` — Comenzi AI Agent extinse cu `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` și `delete --force`
- **🧩 Noi extensii preview** documentate: `azure.ai.skills` (abilități reutilizabile ale agentului) și `azure.ai.connections` (conexiuni Foundry) adăugate în tabelul extensiilor și în cheat sheet
- **⏱️ Ghidaj pentru timpii de răspuns** — exemple `azd ai agent invoke` menționează acum că se afișează latența totală și timpul până la primul byte
- **📌 Banner de versiune** în README-ul principal care direcționează utilizatorii către `azd version` și `azd upgrade`

#### Modificat
- **✅ Baza de validare actualizată** de la `azd 1.23.12` (martie 2026) la `azd 1.25.6` (iunie 2026) în toate README-urile capitolelor și documentele workshop-ului
- **🤖 Notă de extensie capitol 2** actualizată de la `azure.ai.agents` `0.1.18-preview` la `0.1.40-preview`
- **🧪 Exemplu de validare workshop** (`azd version` output) actualizat la `1.25.6`
- **🧭 README "Noutăți în azd Azi"** reîmprospătat pentru a evidenția ciclul complet de viață al agentului, noile extensii AI și remedierile recente pentru îmbunătățirea calității vieții (`azd init` idempotent, `azd auth login` curățare token expirat, prompt la prima rulare pentru `azd tool`)
- **📖 Chapter 2 agents.md (Opțiunea 4)** acum direcționează cursanții către comenzile ciclului de viață post-deployment în loc să se oprească la `azd up`

#### Remediat
- **🏷️ Denumire produs** — adăugată o notă despre rebranding-ul Aspire (".NET Aspire" este acum doar "Aspire"); suportul azd pentru Aspire rămâne neschimbat
- **🔎 Validare în direct a release-ului** confirmată față de feed-ul de release Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) și `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fișiere actualizate
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

#### Clarificare Onboarding Începători, Validare Setup & Curățare Finală Comenzi AZD
**Această versiune continuă cu o trecere axată pe începători a documentației după validarea AZD 1.23: clarifică ghidajul de autentificare AZD-first, adaugă scripturi locale de validare setup, verifică comenzile cheie față de CLI-ul AZD în direct și elimină ultimele referințe învechite ale comenzilor sursă engleză în afara changelog-ului.**

#### Adăugat
- **🧪 Scripturi pentru validarea setup-ului începătorilor** cu `validate-setup.ps1` și `validate-setup.sh` pentru ca utilizatorii să confirme uneltele necesare înainte de a începe Capitolul 1
- **✅ Pași inițiali de validare setup** în README-ul rădăcină și în README Capitolul 1 pentru a detecta lipsa unor prerechizite înainte de `azd up`

#### Modificat
- **🔐 Ghidajul de autentificare pentru începători** tratează acum consecvent comanda `azd auth login` ca calea principală pentru fluxurile AZD, menționând `az login` ca opțională doar dacă comenzi Azure CLI sunt folosite direct
- **📚 Fluxul de onboarding din Capitolul 1** indică acum utilizatorilor să-și valideze setup-ul local înainte de pașii de instalare, autentificare și prima implementare
- **🛠️ Mesaje validator** separă clar cerințele blocante de avertismente opționale Azure CLI pentru calea AZD doar pentru începători
- **📖 Documentație de configurare, depanare și exemple** face distincția între autentificarea AZD necesară și autentificarea opțională Azure CLI, care anterior erau prezentate fără context

#### Remediat
- **📋 Referințe rămase la comenzile sursă în limba engleză** actualizate la formele curente AZD, inclusiv `azd config show` în cheat sheet și `azd monitor --overview` unde era indicată o prezentare în portalul Azure
- **🧭 Afirmațiile începătorilor din Capitolul 1** au fost temperate pentru a evita promisiuni exagerate privind comportamentul fără erori garantat sau rollback-ul în toate template-urile și resursele Azure
- **🔎 Validarea CLI în direct** a confirmat suportul curent pentru `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` și `azd down --force --purge`

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

#### Validare AZD 1.23.12, Extindere Mediu Workshop & Reîmprospătare Model AI
**Această versiune realizează o trecere de validare a documentației față de `azd` `1.23.12`, actualizează exemplele învechite de comenzi AZD, reîmprospătează ghidajul modelului AI pentru setările implicite actuale și extinde instrucțiunile workshop-ului dincolo de GitHub Codespaces, susținând și containerele de dezvoltare și clonele locale.**

#### Adăugat
- **✅ Note de validare în capitolele de bază și documentele workshop** pentru a face explicit baseline-ul AZD testat pentru cursanți care folosesc versiuni CLI mai noi sau mai vechi
- **⏱️ Ghidaj pentru timeout de implementare** pentru implementări de aplicații AI de durată mare folosind `azd deploy --timeout 1800`
- **🔎 Pași de inspectare extensie** cu `azd extension show azure.ai.agents` în documentele fluxurilor AI
- **🌐 Ghidaj mai larg pentru mediul workshop** acoperind GitHub Codespaces, containere de dezvoltare și clone locale cu MkDocs

#### Modificat
- **📚 README-urile introductive de capitol** menționează acum în mod consecvent validarea față de `azd 1.23.12` în secțiunile fundament, configurare, infrastructură, multi-agent, pre-implementare, depanare și producție
- **🛠️ Referințele comenzilor AZD** actualizate la formele curente în toate documentele:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` sau `azd env get-value(s)` în funcție de context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` unde se intenționează o prezentare Application Insights
- **🧪 Exemple simplify provisioning preview** la utilizare suportată curent cum ar fi `azd provision --preview` și `azd provision --preview -e production`
- **🧭 Fluxul workshop** actualizat pentru a permite cursanților să finalizeze laboratoarele în Codespaces, container de dezvoltare sau clonă locală în loc să se presupună execuție doar în Codespaces
- **🔐 Ghidaj pentru autentificare** preferă acum `azd auth login` pentru fluxurile AZD, cu `az login` poziționat ca opțional când se folosesc direct comenzile Azure CLI

#### Remediat
- **🪟 Comenzi de instalare Windows** normalizate la forma actuală a pachetului `winget` în ghidul de instalare
- **🐧 Ghidaj de instalare Linux** corectat pentru a evita instrucțiunile nesuportate specifice distro-urilor pentru managerul de pachete `azd` și în schimb indică spre asset-uri de release acolo unde este cazul
- **📦 Exemple de modele AI** reîmprospătate de la default-uri vechi ca `gpt-35-turbo` și `text-embedding-ada-002` la exemple actuale cum ar fi `gpt-4.1-mini`, `gpt-4.1` și `text-embedding-3-large`
- **📋 Fragmente pentru implementare și diagnostic** corectate pentru a folosi comenzi actuale de mediu și stare în jurnale, scripturi și pași de depanare
- **⚙️ Ghidaj GitHub Actions** actualizat de la `Azure/setup-azd@v1.0.0` la `Azure/setup-azd@v2`
- **🤖 Ghidaj consent MCP/Copilot** actualizat de la `azd mcp consent` la `azd copilot consent list`

#### Îmbunătățit
- **🧠 Ghidajul capitolului AI** explică mai bine comportamentul `azd ai` sensibil la preview, autentificarea tenant-specific, utilizarea curentă a extensiilor și recomandările actualizate de implementare a modelelor
- **🧪 Instrucțiuni workshop** folosesc acum exemple de versiuni mai realiste și un limbaj de setup al mediului mai clar pentru laboratoare practice
- **📈 Documentația pentru producție și depanare** este acum mai bine aliniată cu monitorizarea curentă, modelul fallback și exemplele de cost-tier

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

#### Comenzi AZD AI CLI, Validare Conținut & Extindere Template-uri
**Această versiune adaugă acoperire pentru comenzile `azd ai`, `azd extension` și `azd mcp` în toate capitolele legate de AI, repară linkurile rupte și codul depreciat din agents.md, actualizează cheat sheet-ul și reface secțiunea Exemplu Template-uri cu descrieri validate și noi template-uri Azure AI pentru AZD.**

#### Adăugat
- **🤖 Acoperire AZD AI CLI** în 7 fișiere (anterior doar în Capitolul 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Noua secțiune "Extensii și Comenzi AI" care introduce `azd extension`, `azd ai agent init` și `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opțiunea 4: `azd ai agent init` cu tabel comparativ (template vs abordarea manifestului)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecțiunile "Extensii AZD pentru Foundry" și "Implementare Agent-First"

  - `docs/chapter-05-multi-agent/README.md` — Start rapid acum afișează ambele căi de implementare bazate pe șablon și manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secțiunea de implementare include acum opțiunea `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecțiunea „Comenzi AZD AI Extension pentru diagnosticare”
  - `resources/cheat-sheet.md` — Secțiune nouă „Comenzi AI & Extensii” cu `azd extension`, `azd ai agent init`, `azd mcp` și `azd infra generate`
- **📦 Șabloane noi de exemple AZD AI** în `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET cu Blazor WebAssembly, Semantic Kernel și suport pentru chat vocal
  - **azure-search-openai-demo-java** — Chat RAG Java folosind Langchain4J cu opțiuni de implementare ACA/AKS
  - **contoso-creative-writer** — Aplicație multi-agent de scris creativ folosind Azure AI Agent Service, Bing Grounding și Prompty
  - **serverless-chat-langchainjs** — RAG fără server folosind Azure Functions + LangChain.js + Cosmos DB cu suport dev local Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG pentru întreprinderi cu portal admin, integrare Teams și opțiuni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicație de referință orchestration MCP multi-agent cu servere în .NET, Python, Java și TypeScript
  - **azd-ai-starter** — Șablon minimal de pornire infrastructură Azure AI Bicep
  - **🔗 Link galerie Awesome AZD AI** — Referință către [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (peste 80 de șabloane)

#### Remediate
- **🔗 navigație agents.md**: Linkuri Anterior/Următor acum corespunzătoare ordinii lecțiilor din capitolul 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 linkuri rupte agents.md**: `production-ai-practices.md` corectat în `../chapter-08-production/production-ai-practices.md` (3 apariții)
- **📦 cod învechit agents.md**: Înlocuit `opencensus` cu `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API invalid agents.md**: Mutat `max_tokens` din `create_agent()` în `create_run()` ca `max_completion_tokens`
- **🔢 numărare tokens agents.md**: Înlocuit estimarea aproximativă `len//4` cu `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corectate serviciile de la "Cognitive Search + App Service" la "Azure AI Search + Azure Container Apps" (host implicit schimbat în octombrie 2024)
- **contoso-chat**: Descriere actualizată să facă referire la Azure AI Foundry + Prompty, corespunzător titlului și stivei tehnologice reale din depozit

#### Eliminat
- **ai-document-processing**: Eliminată referința la șablon nefuncțional (depozitul nu este accesibil public ca șablon AZD)

#### Îmbunătățit
- **📝 exerciții agents.md**: Exercițiul 1 afișează acum rezultatul așteptat și pasul `azd monitor`; Exercițiul 2 include cod complet de înregistrare `FunctionTool`; Exercițiul 3 înlocuiește indicațiile vagi cu comenzi concrete `prepdocs.py`
- **📚 resurse agents.md**: Legături actualizate către documentația curentă Azure AI Agent Service și quickstart
- **📋 tabel Pași Următori agents.md**: Adăugat link atelier AI pentru acoperire completă a capitolului

#### Fișiere Actualizate
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Îmbunătățire navigație curs
**Această versiune îmbunătățește navigația capitolelor în README.md cu un format de tabel extins.**

#### Modificat
- **Tabel Hartă Curs**: Îmbunătățit cu linkuri directe către lecții, estimări ale duratei și evaluări ale complexității
- **Curățare foldere**: Eliminat foldere vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Verificare linkuri**: Verificate toate cele peste 21 de linkuri interne din tabelul Hărții Cursului

### [v3.16.0] - 2026-02-05

#### Actualizări denumire produs
**Această versiune actualizează referințele produselor cu denumirile curente Microsoft.**

#### Modificat
- **Microsoft Foundry → Microsoft Foundry**: Toate referințele actualizate în fișiere non-traduse
- **Azure AI Agent Service → Foundry Agents**: Numele serviciului actualizat pentru a reflecta brandingul curent

#### Fișiere Actualizate
- `README.md` - Pagina principală a cursului
- `changelog.md` - Istoricul versiunilor
- `course-outline.md` - Structura cursului
- `docs/chapter-02-ai-development/agents.md` - Ghid agenți AI
- `examples/README.md` - Documentație exemple
- `workshop/README.md` - Pagina principală atelier
- `workshop/docs/index.md` - Index atelier
- `workshop/docs/instructions/*.md` - Toate fișierele de instrucțiuni ale atelierului

---

### [v3.15.0] - 2026-02-05

#### Restructurare majoră depozit: Foldere bazate pe capitole
**Această versiune restructurează documentația în foldere dedicate capitolelor pentru o navigare mai clară.**

#### Redenumiri foldere
Foldere vechi au fost înlocuite cu foldere numerotate pe capitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adăugat nou: `docs/chapter-05-multi-agent/`

#### Migrații fișiere
| Fișier | Din | În |
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
| Toate fișierele pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Toate fișierele troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Adăugat
- **📚 Fișiere README capitole**: Creat README.md în fiecare folder de capitol cu:
  - Obiective de învățare și durată
  - Tabel lecții cu descrieri
  - Comenzi de start rapid
  - Navigare către alte capitole

#### Modificat
- **🔗 Actualizat toate linkurile interne**: Peste 78 de căi actualizate în toate fișierele documentației
- **🗺️ README.md principal**: Actualizat Harta Cursului cu noua structură pe capitole
- **📝 examples/README.md**: Actualizate referințele încrucișate către folderele capitolelor

#### Eliminat
- Structura veche a folderelor (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructurare depozit: Navigație capitol
**Această versiune a adăugat fișiere README pentru navigația pe capitole (înlocuite de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ghid nou pentru agenți AI
**Această versiune adaugă un ghid complet pentru implementarea agenților AI cu Azure Developer CLI.**

#### Adăugat
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet ce acoperă:
  - Ce sunt agenții AI și cum diferă de chatbots
  - Trei șabloane rapide de start pentru agenți (Foundry Agents, Prompty, RAG)
  - Modele de arhitectură ale agenților (agent unic, RAG, multi-agent)
  - Configurarea și personalizarea uneltelor
  - Monitorizare și urmărire metrici
  - Considerații și optimizare costuri
  - Scenarii comune de depanare
  - Trei exerciții practice cu criterii de succes

#### Structura conținutului
- **Introducere**: Concepte de agenți pentru începători
- **Start rapid**: Implementare agenți cu `azd init --template get-started-with-ai-agents`
- **Modele arhitectură**: Diagrame vizuale ale modelelor de agenți
- **Configurare**: Setup unelte și variabile de mediu
- **Monitorizare**: Integrare Application Insights
- **Exerciții**: Învățare practică progresivă (20-45 minute fiecare)

---

### [v3.12.0] - 2026-02-05

#### Actualizare mediu DevContainer
**Această versiune actualizează configurația containerului de dezvoltare cu unelte moderne și setări implicite mai bune pentru experiența de învățare AZD.**

#### Modificat
- **🐳 Imagine de bază**: Actualizată de la `python:3.12-bullseye` la `python:3.12-bookworm` (ultima versiune stabilă Debian)
- **📛 Nume container**: Redenumit de la "Python 3" la "AZD for Beginners" pentru claritate

#### Adăugat
- **🔧 Funcționalități noi Dev Container**:
  - `azure-cli` cu suport Bicep activat
  - `node:20` (versiune LTS pentru șabloane AZD)
  - `github-cli` pentru gestionarea șabloanelor
  - `docker-in-docker` pentru implementări container app

- **🔌 Redirecționare porturi**: Porturi preconfigurate pentru dezvoltare comună:
  - 8000 (previzualizare MkDocs)
  - 3000 (aplicații Web)
  - 5000 (Python Flask)
  - 8080 (API-uri)

- **🧩 Extensii noi VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python îmbunătățit
  - `ms-azuretools.vscode-azurefunctions` - suport Azure Functions
  - `ms-azuretools.vscode-docker` - suport Docker
  - `ms-azuretools.vscode-bicep` - suport limbaj Bicep
  - `ms-azure-devtools.azure-resource-groups` - gestionare resurse Azure
  - `yzhang.markdown-all-in-one` - editare Markdown
  - `DavidAnson.vscode-markdownlint` - verificare sintaxă Markdown
  - `bierner.markdown-mermaid` - suport diagrame Mermaid
  - `redhat.vscode-yaml` - suport YAML (pentru azure.yaml)
  - `eamodio.gitlens` - vizualizare Git
  - `mhutchie.git-graph` - istoric Git

- **⚙️ Setări VS Code**: Adăugate setări implicite pentru interpret Python, formatare la salvare și eliminare spații albe

- **📦 requirements-dev.txt actualizat**:
  - Adăugat plugin de minificare MkDocs
  - Adăugat pre-commit pentru calitate cod
  - Adăugate pachete SDK Azure (azure-identity, azure-mgmt-resource)

#### Remediate
- **Comandă post-creare**: Verifică acum instalarea AZD și Azure CLI la pornirea containerului

---

### [v3.11.0] - 2026-02-05

#### Revizuire README prietenoasă cu începătorii
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil începătorilor și adaugă resurse esențiale pentru dezvoltatorii AI.**

#### Adăugat
- **🆚 Comparare Azure CLI vs AZD**: Explicație clară când să folosești fiecare unealtă cu exemple practice
- **🌟 Linkuri Awesome AZD**: Linkuri directe către galeria comunității de șabloane și resurse de contribuție:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - peste 200 de șabloane gata de implementat
  - [Trimite un șablon](https://github.com/Azure/awesome-azd/issues) - contribuția comunității
- **🎯 Ghid Start Rapid**: Secțiune simplificată în 3 pași (Instalează → Autentifică-te → Implementează)
- **📊 Tabel navigație bazat pe experiență**: Indicații clare de unde să începi în funcție de experiența dezvoltatorului

#### Modificat
- **Structura README**: Reorganizată pentru dezvăluire progresivă - informații cheie primele
- **Secțiunea Introducere**: Rescrisă pentru a explica „Magia `azd up`” pentru începători compleți
- **Eliminat conținut duplicat**: Secțiune duplicat de depanare eliminată
- **Comenzi depanare**: Corectat referința `azd logs` să folosească `azd monitor --logs` valid

#### Remediate

- **🔐 Comenzi de Autentificare**: Adăugat `azd auth login` și `azd auth logout` în cheat-sheet.md  
- **Referințe la Comenzi Invalide**: Eliminat restul comenzii `azd logs` din secțiunea de depanare a README  

#### Note  
- **Domeniu**: Modificările aplicate în README.md principal și resources/cheat-sheet.md  
- **Public Țintă**: Îmbunătățiri destinate dezvoltatorilor noi la AZD  

---

### [v3.10.0] - 2026-02-05  

#### Actualizare Precizie Comenzi Azure Developer CLI  
**Această versiune corectează comenzile AZD inexistente din documentație, asigurându-se că toate exemplele de cod utilizează sintaxa validă Azure Developer CLI.**  

#### Corectări  
- **🔧 Comenzi AZD Inexistente Eliminare**: Audit complet și corectare a comenzilor invalide:  
  - `azd logs` (inexistentă) → înlocuită cu `azd monitor --logs` sau alternative Azure CLI  
  - Subcomenzi `azd service` (inexistente) → înlocuite cu `azd show` și Azure CLI  
  - `azd infra import/export/validate` (inexistente) → eliminate sau înlocuite cu alternative valide  
  - Opțiuni `azd deploy --rollback/--incremental/--parallel/--detect-changes` (inexistente) → eliminate  
  - Opțiuni `azd provision --what-if/--rollback` (inexistente) → actualizate pentru utilizarea `--preview`  
  - `azd config validate` (inexistentă) → înlocuită cu `azd config list`  
  - `azd info`, `azd history`, `azd metrics` (inexistente) → eliminate  

- **📚 Fișiere Actualizate cu Corecții de Comenzi**:  
  - `resources/cheat-sheet.md`: Revizuire majoră a referințelor de comenzi  
  - `docs/deployment/deployment-guide.md`: Corectate strategiile de rollback și implementare  
  - `docs/troubleshooting/debugging.md`: Corectate secțiunile de analiză a jurnalelor  
  - `docs/troubleshooting/common-issues.md`: Actualizate comenzile de depanare  
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectată secțiunea de depanare AZD  
  - `docs/getting-started/azd-basics.md`: Corectate comenzile de monitorizare  
  - `docs/getting-started/first-project.md`: Actualizate exemplele de monitorizare și depanare  
  - `docs/getting-started/installation.md`: Corectate exemplele de help și versiune  
  - `docs/pre-deployment/application-insights.md`: Corectate comenzile de vizualizare a jurnalelor  
  - `docs/pre-deployment/coordination-patterns.md`: Corectate comenzile de depanare agenți  

- **📝 Referință Versiune Actualizată**:  
  - `docs/getting-started/installation.md`: Versiunea hardcodată `1.5.0` schimbată în generic `1.x.x` cu link către lansări  

#### Modificări  
- **Strategii Rollback**: Documentația actualizată pentru utilizarea rollback-ului bazat pe Git (AZD nu are rollback nativ)  
- **Vizualizare Jurnale**: Înlocuite referințele `azd logs` cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI  
- **Secțiunea Performanță**: Eliminat flaguri inexistente pentru implementare paralelă/incrementală, oferite alternative valide  

#### Detalii Tehnice  
- **Comenzi AZD Valide**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`  
- **Flaguri valide azd monitor**: `--live`, `--logs`, `--overview`  
- **Funcționalități Eliminare**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`  

#### Note  
- **Verificare**: Comenzile validate cu Azure Developer CLI v1.23.x  

---

### [v3.9.0] - 2026-02-05  

#### Finalizarea Workshop-ului și Îmbunătățirea Calității Documentației  
**Această versiune finalizează modulele interactive ale workshop-ului, repară toate linkurile stricate din documentație și îmbunătățește calitatea generală a conținutului pentru dezvoltatorii AI care folosesc Microsoft AZD.**  

#### Adăugat  
- **📝 CONTRIBUTING.md**: Document nou pentru ghidul de contribuție cu:  
  - Instrucțiuni clare pentru raportarea problemelor și propunerea de modificări  
  - Standardele de documentare pentru conținut nou  
  - Ghiduri pentru exemple de cod și convenții pentru mesajele commit-urilor  
  - Informații privind implicarea comunității  

#### Finalizat  
- **🎯 Modul Workshop 7 (Încheiere)**: Modul complet încheiere cu:  
  - Rezumat cuprinzător al realizărilor workshop-ului  
  - Secțiune despre conceptele cheie stăpânite privind AZD, template-uri și Microsoft Foundry  
  - Recomandări pentru continuarea parcursului de învățare  
  - Exerciții provocare workshop cu ratinguri de dificultate  
  - Feedback comunitar și linkuri de suport  

- **📚 Modul Workshop 3 (Deconstruct)**: Obiective de învățare actualizate cu:  
  - Ghid de activare GitHub Copilot cu serverele MCP  
  - Înțelegerea structurii folderelor template AZD  
  - Tipare de organizare infrastructură ca și cod (Bicep)  
  - Instrucțiuni pentru laborator hands-on  

- **🔧 Modul Workshop 6 (Demontare)**: Finalizat cu:  
  - Obiective de curățare resurse și gestionare costuri  
  - Utilizarea `azd down` pentru deprovisionare sigură a infrastructurii  
  - Ghid de recuperare servicii cognitive șterse soft  
  - Propuneri bonus de explorare pentru GitHub Copilot și Azure Portal  

#### Corecturi  
- **🔗 Reparări Linkuri Stricate**: Rezolvate peste 15 linkuri interne stricate în documentație:  
  - `docs/ai-foundry/ai-model-deployment.md`: Corectate căile către microsoft-foundry-integration.md  
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectate căile ai-model-deployment.md și production-ai-practices.md  
  - `docs/getting-started/first-project.md`: Înlocuit cicd-integration.md inexistent cu deployment-guide.md  
  - `examples/retail-scenario.md`: Corectate căile din ghidul FAQ și depanare  
  - `examples/container-app/microservices/README.md`: Corectate căile pentru pagina principală a cursului și ghidul de implementare  
  - `resources/faq.md` și `resources/glossary.md`: Actualizate referințele capitolelor AI  
  - `course-outline.md`: Corectate referințele pentru ghidul instructorului și laboratoarele workshop AI  

- **📅 Banner Status Workshop**: Actualizat din "În construcție" în stare activă cu data februarie 2026  

- **🔗 Navigație Workshop**: Corectate linkurile stricate din README workshop care indicau folderul inexistent lab-1-azd-basics  

#### Modificări  
- **Prezentare Workshop**: Eliminat avertismentul "în construcție", workshop-ul este complet și gata de utilizare  
- **Consistența Navigației**: Asigurată navigație corectă între toate modulele workshop-ului  
- **Referințe Parcurs Învățare**: Actualizate corect referințele capitolelor microsoft-foundry  

#### Validări  
- ✅ Toate fișierele markdown în engleză au linkuri interne valide  
- ✅ Modulele workshop 0-7 sunt complete cu obiective de învățare  
- ✅ Navigația între capitole și module funcționează corect  
- ✅ Conținut adecvat pentru dezvoltatorii AI care folosesc Microsoft AZD  
- ✅ Limbaj prietenos pentru începători și structură menținute pe tot parcursul  
- ✅ CONTRIBUTING.md oferă ghidaj clar pentru contribuitori din comunitate  

#### Implementare Tehnică  
- **Validare Linkuri**: Script PowerShell automatizat a verificat toate linkurile interne .md  
- **Audit Conținut**: Revizuire manuală a completitudinii workshop-ului și potrivire pentru începători  
- **Sistem Navigație**: Model consistent de navigare între capitole și module aplicat  

#### Note  
- **Domeniu**: Modificările aplicate doar documentației în limba engleză  
- **Traduceri**: Folderele de traducere nu au fost actualizate în această versiune (sincronizarea traducerii automate va veni ulterior)  
- **Durata Workshop-ului**: Atelierul complet oferă acum 3-4 ore de învățare practică  

---

### [v3.8.0] - 2025-11-19  

#### Documentație Avansată: Monitorizare, Securitate și Tipare Multi-Agent  
**Această versiune adaugă lecții comprehensive de nivel A despre integrarea Application Insights, tipare de autentificare și coordonarea multi-agent pentru implementări de producție.**  

#### Adăugat  
- **📊 Lecția Integrare Application Insights**: în `docs/pre-deployment/application-insights.md`:  
  - Implementare centrată pe AZD cu aprovizionare automată  
  - Template-uri Bicep complete pentru Application Insights + Log Analytics  
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1200 linii)  
  - Tipare de monitorizare AI/LLM (urmărirea tokenilor/costurilor Microsoft Foundry Models)  
  - 6 diagrame Mermaid (arhitectură, urmărire distribuită, flux telemetrie)  
  - 3 exerciții practice (alerte, tablouri de bord, monitorizare AI)  
  - Exemple de interogări Kusto și strategii de optimizare a costurilor  
  - Streaming metrici live și depanare în timp real  
  - Timp de învățare 40-50 minute cu tipare gata pentru producție  

- **🔐 Lecția Tipare Autentificare & Securitate**: în `docs/getting-started/authsecurity.md`:  
  - 3 tipare de autentificare (string-uri de conexiune, Key Vault, identitate administrată)  
  - Template-uri complete Bicep pentru implementări securizate  
  - Cod aplicație Node.js cu integrare Azure SDK  
  - 3 exerciții complete (activare identitate administrată, identitate atribuită utilizatorului, rotație Key Vault)  
  - Cele mai bune practici de securitate și configurații RBAC  
  - Ghid de depanare și analiză costuri  
  - Tipare de autentificare fără parolă gata pentru producție  

- **🤖 Lecția Tipare Coordonare Multi-Agent**: în `docs/pre-deployment/coordination-patterns.md`:  
  - 5 tipare de coordonare (secvențială, paralelă, ierarhică, bazată pe evenimente, consens)  
  - Implementare completă a serviciului orchestrator (Python/Flask, peste 1500 linii)  
  - 3 implementări specializate de agenți (Cercetare, Scriitor, Editor)  
  - Integrare Service Bus pentru cozi de mesaje  
  - Management status Cosmos DB pentru sisteme distribuite  
  - 6 diagrame Mermaid care arată interacțiunile agenților  
  - 3 exerciții avansate (gestionare timeout, logică retry, circuit breaker)  
  - Defalcare costuri (240-565 $/lună) cu strategii de optimizare  
  - Integrare Application Insights pentru monitorizare  

#### Îmbunătățit  
- **Capitolul Pre-implementare**: Acum include tipare complete de monitorizare și coordonare  
- **Capitolul Introducere**: Îmbunătățit cu tipare profesionale de autentificare  
- **Pregătire Pentru Producție**: Acoperire completă de la securitate la observabilitate  
- **Structură Curs**: Actualizată pentru a face referire la noi lecții din Capitolele 3 și 6  

#### Modificat  
- **Progres Învățare**: Integrare mai bună a securității și monitorizării pe tot parcursul cursului  
- **Calitate Documentație**: Standard consistent de nivel A (95-97%) pentru noile lecții  
- **Tipare Producție**: Acoperire completă end-to-end pentru implementări enterprise  

#### Îmbunătățit  
- **Experiența Dezvoltatorului**: Parcurs clar de la dezvoltare la monitorizarea în producție  
- **Standarde Securitate**: Tipare profesionale pentru autentificare și managementul secretelor  
- **Observabilitate**: Integrare completă Application Insights cu AZD  
- **Sarcini AI**: Monitorizare specializată pentru Microsoft Foundry Models și sisteme multi-agent  

#### Validat  
- ✅ Toate lecțiile includ cod complet funcțional (nu doar fragmente)  
- ✅ Diagrame Mermaid pentru învățare vizuală (19 în total în 3 lecții)  
- ✅ Exerciții practice cu pași de verificare (9 în total)  
- ✅ Template-uri Bicep gata pentru producție deployabile prin `azd up`  
- ✅ Analiză costuri și strategii de optimizare  
- ✅ Ghiduri de depanare și bune practici  
- ✅ Puncte de control cunoștințe cu comenzi de verificare  

#### Rezultate Evaluare Documentație  
- **docs/pre-deployment/application-insights.md**: - Ghid complet de monitorizare  
- **docs/getting-started/authsecurity.md**: - Tipare profesionale de securitate  
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent  
- **Conținut Nou General**: - Standard consistent ridicat de calitate  

#### Implementare Tehnică  
- **Application Insights**: Log Analytics + telemetrie personalizată + urmărire distribuită  
- **Autentificare**: Identitate administrată + Key Vault + tipare RBAC  
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrare  
- **Monitorizare**: Metrici live + interogări Kusto + alerte + tablouri de bord  
- **Gestionare Costuri**: Strategii de sampling, politici de retenție, control buget  

### [v3.7.0] - 2025-11-19  

#### Îmbunătățiri Calitate Documentație și Exemplu Nou Microsoft Foundry Models  
**Această versiune îmbunătățește calitatea documentației în întregul depozit și adaugă un exemplu complet de implementare Microsoft Foundry Models cu interfață chat gpt-4.1.**  

#### Adăugat  
- **🤖 Exemplu Chat Microsoft Foundry Models**: Implementare completă gpt-4.1 în `examples/azure-openai-chat/`:  
  - Infrastructură completă Microsoft Foundry Models (implementare model gpt-4.1)  
  - Interfață chat Python la linia de comandă cu istoric conversații  
  - Integrare Key Vault pentru stocare securizată cheie API  
  - Monitorizare utilizare tokeni și estimare costuri  
  - Limitare rate și tratare erori  
  - README cuprinzător cu ghid de implementare 35-45 minute  
  - 11 fișiere gata de producție (template-uri Bicep, aplicație Python, configurație)  
- **📚 Exerciții Documentație**: Adăugate exerciții practice în ghidul de configurare:  
  - Exercițiul 1: Configurare multi-mediu (15 minute)  
  - Exercițiul 2: Practică gestionare secrete (10 minute)  
  - Criterii clare de succes și pași de verificare  
- **✅ Verificare Implementare**: Adăugată secțiune de verificare în ghidul de implementare:  
  - Proceduri health check  
  - Checklist criterii succes  
  - Ieșiri așteptate pentru toate comenzile de implementare  
  - Referință rapidă debugging  

#### Îmbunătățit  
- **examples/README.md**: Actualizat la calitate nivel A (93%):  
  - Adăugat azure-openai-chat la toate secțiunile relevante  
  - Crescut numărul exemplelor locale de la 3 la 4  
  - Inclus în tabelul Exemple AI Application  
  - Integrat în Quick Start pentru utilizatori intermediari  
  - Adăugat la secțiunea Microsoft Foundry Templates  
  - Actualizat matricea de comparație și secțiunile de găsire tehnologii  
- **Calitatea Documentației**: Îmbunătățită de la B+ (87%) la A- (92%) în folderul docs:  

  - Adăugate rezultate așteptate la exemplele de comenzi critice
  - Incluse etape de verificare pentru modificările de configurare
  - Îmbunătățit învățarea practică cu exerciții practice

#### Modificat
- **Progresul Învățării**: Integrare mai bună a exemplelor AI pentru învățătorii intermediari
- **Structura Documentației**: Mai multe exerciții acționabile cu rezultate clare
- **Procesul de Verificare**: Criterii explicite de succes adăugate fluxurilor cheie

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Implementarea Microsoft Foundry Models durează acum 35-45 minute (vs 60-90 pentru alternative complexe)
- **Transparența Costurilor**: Estimări clare ale costurilor (50-200 $/lună) pentru exemplul Microsoft Foundry Models
- **Parcursul de Învățare**: Dezvoltatorii AI au un punct de intrare clar cu azure-openai-chat
- **Standardele Documentației**: Rezultate așteptate consistente și etape de verificare

#### Validat
- ✅ Exemplul Microsoft Foundry Models complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere de implementare sintactic corecte
- ✅ Instrucțiunile README corespund experienței reale de implementare
- ✅ Legăturile din documentație actualizate în peste 8 locații
- ✅ Indexul exemplelor reflectă corect 4 exemple locale
- ✅ Nicio legătură externă duplicată în tabele
- ✅ Toate referințele de navigare corecte

#### Implementare Tehnică
- **Arhitectura Microsoft Foundry Models**: pattern gpt-4.1 + Key Vault + Container Apps
- **Securitate**: Identitate gestionată pregătită, secrete în Key Vault
- **Monitorizare**: integrare Application Insights
- **Managementul Costurilor**: monitorizarea token-urilor și optimizarea utilizării
- **Implementare**: Comandă unică `azd up` pentru setare completă

### [v3.6.0] - 2025-11-19

#### Actualizare Majoră: Exemple de Implementare Container App
**Această versiune introduce exemple complete de implementare a aplicațiilor containerizate gata pentru producție utilizând Azure Developer CLI (AZD), cu documentație completă și integrare în parcursul de învățare.**

#### Adăugat
- **🚀 Exemple Container App**: Exemple locale noi în `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, pornire rapidă, producție și modele avansate
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST prietenos pentru începători, cu scale-to-zero, sonde de sănătate, monitorizare și depanare
  - [Microservices Architecture](../../examples/container-app/microservices): Implementare multi-serviciu gata pentru producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, trasabilitate distribuită, implementare blue-green/canary
- **Best Practices**: Securitate, monitorizare, optimizarea costurilor și ghid pentru CI/CD pentru sarcini containerizate
- **Cod Exemplu**: Fișier complet `azure.yaml`, șabloane Bicep și implementări servicii multi-limbaj (Python, Node.js, C#, Go)
- **Testare și Depanare**: Scenarii de test end-to-end, comenzi pentru monitorizare, ghid pentru depanare

#### Modificat
- **README.md**: Actualizat pentru a prezenta și lega noile exemple container app sub "Local Examples - Container Applications"
- **examples/README.md**: Actualizat pentru evidențierea exemplelor container app, adăugare intrări matrice comparație și actualizare referințe tehnologice/arhitecturale
- **Course Outline & Study Guide**: Actualizat pentru a face referire la noile exemple container app și modele de implementare în capitole relevante

#### Validat
- ✅ Toate exemplele noi pot fi implementate cu `azd up` și respectă cele mai bune practici
- ✅ Legăturile și navigarea în documentație actualizate
- ✅ Exemplele acoperă scenarii de la începător la avansat, inclusiv microservicii de producție

#### Note
- **Domeniu**: Documentație și exemple doar în limba engleză
- **Următorii Pași**: Extindere cu modele container avansate suplimentare și automatizare CI/CD în versiunile viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding Produs: Microsoft Foundry
**Această versiune implementează o schimbare completă a denumirii produsului de la "Microsoft Foundry" la "Microsoft Foundry" în toată documentația în limba engleză, reflectând rebranding-ul oficial al Microsoft.**

#### Modificat
- **🔄 Actualizare Denumire Produs**: Rebranding complet de la "Microsoft Foundry" la "Microsoft Foundry"
  - Actualizate toate referințele în documentația în limba engleză din folderul `docs/`
  - Redenumit folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Redenumit fișier: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referințe conținut actualizate în 7 fișiere documentație

- **📁 Schimbări Structură Folder**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele incrucișate actualizate pentru a reflecta noua structură de foldere
  - Legăturile de navigare validate în toată documentația

- **📄 Redenumiri Fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate legăturile interne actualizate pentru a face referire la noul nume de fișier

#### Fișiere Actualizate
- **Documentație Capitole** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări legături navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe denumire produs actualizate
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Folosește deja Microsoft Foundry (din actualizările precedente)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 legături incrucișate actualizate
  - `docs/getting-started/first-project.md` - 2 legături navigare capitol actualizate
  - `docs/getting-started/installation.md` - 2 legături capitol următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitate Discord)
  - `docs/troubleshooting/common-issues.md` - 1 legătură navigare actualizată
  - `docs/troubleshooting/debugging.md` - 1 legătură navigare actualizată

- **Fișiere Structură Curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentare curs, titluri capitole, secțiune șabloane, insight-uri comunitate)
  - `course-outline.md` - 14 referințe actualizate (prezentare generală, obiective învățare, resurse capitole)

#### Validat
- ✅ Nicio referință restantă la calea folderului "ai-foundry" în documentația în limba engleză
- ✅ Nicio referință restantă la denumirea produsului "Microsoft Foundry" în documentația în limba engleză
- ✅ Toate legăturile de navigare funcționale cu noua structură de foldere
- ✅ Redenumirile fișierelor și folderelor efectuate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză din folderul `docs/`
- **Traduceri**: Folderele de traducere (`translations/`) nu au fost actualizate în această versiune
- **Atelier**: Materialele de workshop (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele de exemplu pot conține încă denumiri vechi (vor fi adresate în actualizările viitoare)
- **Legături Externe**: URL-urile externe și referințele către depozitul GitHub rămân neschimbate

#### Ghid de Migrare pentru Contribuitori
Dacă aveți ramuri locale sau documentație care face referire la vechea structură:
1. Actualizați referințele folderului: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizați referințele fișierelor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți denumirea produsului: "Microsoft Foundry" → "Microsoft Foundry"
4. Verificați că toate legăturile interne în documentație funcționează corect

---

### [v3.4.0] - 2025-10-24

#### Îmbunătățiri Previzualizare și Validare Infrastructură
**Această versiune introduce suport cuprinzător pentru noua funcționalitate preview a Azure Developer CLI și îmbunătățește experiența utilizatorului în workshop.**

#### Adăugat
- **🧪 Documentație funcționalitate azd provision --preview**: Acoperire completă a noii capacități de previzualizare a infrastructurii
  - Referință comandă și exemple de utilizare în sheet-ul de ajutor
  - Integrare detaliată în ghidul de aprovizionare cu cazuri de utilizare și beneficii
  - Integrare check pre-zbor pentru validare mai sigură a implementării
  - Actualizări ale ghidului de început cu practici pentru implementări sigure
- **🚧 Banner Stare Workshop**: Banner HTML profesional indicând starea de dezvoltare a workshop-ului
  - Design gradient cu indicatori de construcție pentru comunicare clară cu utilizatorii
  - Timpul ultimei actualizări pentru transparență
  - Design responsiv pentru toate tipurile de dispozitive mobile

#### Îmbunătățit
- **Securitatea Infrastructurii**: Funcționalitatea preview integrată în toată documentația de implementare
- **Validare Pre-implementare**: Scripturi automate includ acum testarea preview-ului infrastructurii
- **Fluxul de lucru pentru Dezvoltatori**: Secvențe de comandă actualizate pentru a include preview ca practică recomandată
- **Experiența Workshop**: Așteptări clare stabilite pentru utilizatori despre stadiul de dezvoltare a conținutului

#### Modificat
- **Cele mai bune practici de implementare**: Workflow-ul cu preview mai întâi este acum abordarea recomandată
- **Fluxul documentației**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentarea Workshop**: Comunicarea profesionistă a stării cu cronologie clară a dezvoltării

#### Îmbunătățit
- **Abordare de Siguranță Mai Întâi**: Modificările infrastructurii pot fi validate înainte de implementare
- **Colaborare între Echipe**: Rezultatele preview pot fi partajate pentru revizuire și aprobare
- **Conștientizarea Costurilor**: Înțelegere mai bună a costurilor resurselor înainte de aprovizionare
- **Reducerea Riscurilor**: Reducerea eșecurilor de implementare prin validare anticipată

#### Implementare Tehnică
- **Integrare Multi-document**: Funcționalitatea preview documentată în 4 fișiere cheie
- **Pattern-uri Comandă**: Sintaxă consistentă și exemple pe tot parcursul documentației
- **Integrare Best Practice**: Preview inclus în fluxurile de lucru și scripturile de validare
- **Indicatoare Vizuale**: Marcaje clare NOU pentru a facilita descoperirea

#### Infrastructura Workshopului
- **Comunicare Stare**: Banner HTML profesional cu stilizare gradient
- **Experiență Utilizator**: Starea clară de dezvoltare previne confuzia
- **Prezentare Profesională**: Păstrează credibilitatea depozitului și stabilește așteptările
- **Transparență Cronologică**: Data ultimei actualizări octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale Workshop Îmbunătățite și Experiență Interactivă de Învățare
**Această versiune introduce materiale cuprinzătoare pentru workshop cu ghiduri interactive bazate pe browser și parcursuri de învățare structurate.**

#### Adăugat
- **🎥 Ghid Interactiv Workshop**: Experiență browser bazată pe workshop cu capacitate de previzualizare MkDocs
- **📝 Instrucțiuni Workshop Structurate**: Parcurs de învățare ghidat în 7 pași de la descoperire la personalizare
  - 0-Introducere: Prezentare overview workshop și configurare
  - 1-Select-AI-Template: Procesul de descoperire și selecție a șablonului
  - 2-Validate-AI-Template: Proceduri de implementare și validare
  - 3-Deconstruct-AI-Template: Înțelegerea arhitecturii șablonului
  - 4-Configure-AI-Template: Configurare și personalizare
  - 5-Customize-AI-Template: Modificări avansate și iterare
  - 6-Teardown-Infrastructure: Curățare și management al resurselor
  - 7-Încheiere: Rezumat și pașii următori
- **🛠️ Unelte Workshop**: Configurare MkDocs cu tema Material pentru experiență de învățare îmbunătățită
- **🎯 Parcurs de Învățare Practic**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare fluidă a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI Workshop**: Extins cu experiență de învățare structurată cuprinzătoare de 2-3 ore
- **Documentație Workshop**: Prezentare profesională cu navigare și ajutoare vizuale
- **Progresul Învățării**: Ghidaj clar pas cu pas de la selecția șablonului la implementarea în producție
- **Experiența Dezvoltatorului**: Unelte integrate pentru fluxuri de lucru dezvoltate eficient

#### Îmbunătățit
- **Accesibilitate**: Interfață browser cu funcție de căutare, copiere și comutare temă
- **Învățare Autonomă**: Structură flexibilă a workshop-ului pentru viteze diferite de învățare
- **Aplicație Practică**: Scenarii reale de implementare AI cu șabloane
- **Integrarea Comunității**: Integrare Discord pentru suport și colaborare în workshop

#### Caracteristici Workshop
- **Căutare Integrată**: Descoperire rapidă de cuvinte cheie și lecții
- **Copiere Blocuri de Cod**: Funcționalitate hover-to-copy pentru toate exemplele de cod
- **Comutare Temă**: Suport mod întunecat/luminos pentru preferințe diferite
- **Resurse Vizuale**: Capturi de ecran și diagrame pentru înțelegere sporită
- **Integrare Ajutor**: Acces direct la Discord pentru suport comunitar

### [v3.2.0] - 2025-09-17

#### Restructurare Majoră Navigare și Sistem de Învățare pe Capitole
**Această versiune introduce o structură cuprinzătoare de învățare pe capitole cu navigare îmbunătățită în întregul depozit.**

#### Adăugat
- **📚 Sistem de Învățare pe Capitole**: Întregul curs restructurat în 8 capitole de învățare progresivă
  - Capitolul 1: Baze & Start Rapid (⭐ - 30-45 minute)
  - Capitolul 2: Dezvoltarea Centrată pe AI (⭐⭐ - 1-2 ore)
  - Capitolul 3: Configurare & Autentificare (⭐⭐ - 45-60 minute)
  - Capitolul 4: Infrastructură ca Cod & Implementare (⭐⭐⭐ - 1-1.5 ore)
  - Capitolul 5: Soluții AI Multi-Agent (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolul 6: Validare & Planificare Pre-Implementare (⭐⭐ - 1 oră)
  - Capitolul 7: Depanare & Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolul 8: Modele de Producție & Enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistem Navigație Comprehensiv**: Headere și footere de navigație consistente în toată documentația
- **🎯 Urmărire Progres**: Listă verificare finalizare curs și sistem de verificare a învățării
- **🗺️ Ghid Parcurs de Învățare**: Puncte de intrare clare pentru niveluri și obiective diferite
- **🔗 Navigație Referințe Încrucișate**: Capitole conexe și prerechizite clar legate

#### Îmbunătățit
- **Structura README**: Transformată într-o platformă de învățare structurată cu organizare pe capitole
- **Navigare Documentație**: Fiecare pagină include acum contextul capitolului și ghidaj privind progresul
- **Organizarea Șabloanelor**: Exemple și șabloane mapate către capitolele de învățare adecvate

- **Integrarea resurselor**: Fișe de improvizație, întrebări frecvente și ghiduri de studiu conectate la capitolele relevante
- **Integrarea atelierelor**: Laboratoare practice mapate pe multiple obiective de învățare ale capitolelor

#### Modificat
- **Progresul în învățare**: Mutat de la documentație liniară la învățare flexibilă bazată pe capitole
- **Locul configurației**: Repozitionat ghidul de configurare ca Capitolul 3 pentru un flux de învățare mai bun
- **Integrarea conținutului AI**: Mai bună integrare a conținutului specific AI pe parcursul călătoriei de învățare
- **Conținut în producție**: Modele avansate consolidate în Capitolul 8 pentru cursanții enterprise

#### Îmbunătățit
- **Experiența utilizatorului**: Firimituri clare de navigare și indicatori de progres al capitolului
- **Accesibilitate**: Modele de navigare consecvente pentru o parcurgere mai ușoară a cursului
- **Prezentare profesională**: Structură de curs în stil universitar potrivită pentru instruirea academică și corporativă
- **Eficiența învățării**: Timp redus pentru găsirea conținutului relevant printr-o organizare îmbunătățită

#### Implementare tehnică
- **Antete de navigare**: Navigare standardizată pentru capitole în peste 40 de fișiere de documentație
- **Navigare în subsol**: Ghidare consecventă pentru progres și indicatori de finalizare a capitolului
- **Legături încrucișate**: Sistem cuprinzător de linkuri interne care leagă concepte conexe
- **Mapare a capitolelor**: Șabloane și exemple clar asociate cu obiectivele de învățare

#### Îmbunătățire ghid de studiu
- **📚 Obiective de învățare cuprinzătoare**: Ghidul de studiu restructurat pentru a se alinia cu sistemul de 8 capitole
- **🎯 Evaluare pe capitole**: Fiecare capitol include obiective specifice de învățare și exerciții practice
- **📋 Urmărirea progresului**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare pentru finalizare
- **❓ Întrebări de evaluare**: Întrebări de validare a cunoștințelor pentru fiecare capitol cu rezultate profesionale
- **🛠️ Exerciții practice**: Activități practice cu scenarii reale de implementare și depanare
- **📊 Progresul aptitudinilor**: Avansare clară de la concepte de bază la modele enterprise cu focus pe dezvoltarea carierei
- **🎓 Cadrul de certificare**: Rezultate de dezvoltare profesională și sistem de recunoaștere în comunitate
- **⏱️ Managementul cronologiei**: Plan de învățare structurat pe 10 săptămâni cu validare a etapelor

### [v3.1.0] - 2025-09-17

#### Soluții AI Multi-Agent îmbunătățite
**Această versiune îmbunătățește soluția multi-agent pentru retail cu denumiri mai clare ale agenților și documentație extinsă.**

#### Modificat
- **Terminologie multi-agent**: Înlocuit „agentul Cora” cu „agentul Client” în toată soluția multi-agent retail pentru o înțelegere mai clară
- **Arhitectura agentului**: Actualizate toate documentațiile, șabloanele ARM și exemplele de cod pentru a folosi denumirea consistentă „agentul Client”
- **Exemple de configurare**: Modernizate modelele de configurare a agenților cu convenții de denumire actualizate
- **Consistența documentației**: Asigurate referințe profesionale și descriptive pentru numele agenților

#### Îmbunătățit
- **Pachet șablon ARM**: Actualizat retail-multiagent-arm-template cu referințe la agentul Client
- **Diagrame arhitecturale**: Reîmprospătate diagramele Mermaid cu denumirea actualizată a agenților
- **Exemple de cod**: Clasele și exemplele de implementare Python folosesc acum denumirea CustomerAgent
- **Variabile de mediu**: Actualizate toate scripturile de implementare pentru a folosi convențiile CUSTOMER_AGENT_NAME

#### Îmbunătățit
- **Experiența dezvoltatorului**: Roluri și responsabilități ale agenților mai clare în documentație
- **Pregătire pentru producție**: Mai bine aliniat cu convențiile de denumire enterprise
- **Materiale de învățare**: Denumire mai intuitivă a agenților pentru scopuri educaționale
- **Utilizarea șabloanelor**: Înțelegere simplificată a funcțiilor agenților și a modelelor de implementare

#### Detalii tehnice
- Actualizate diagramele arhitecturale Mermaid cu referințe CustomerAgent
- Înlocuite numele claselor CoraAgent cu CustomerAgent în exemplele Python
- Modificate configurările JSON ale șabloanelor ARM pentru a folosi tipul de agent „customer”
- Actualizate variabilele de mediu de la CORA_AGENT_* la CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurările containerelor

### [v3.0.0] - 2025-09-12

#### Modificări majore - Accent pe dezvoltatori AI și integrarea Microsoft Foundry
**Această versiune transformă depozitul într-o resursă completă de învățare axată pe AI cu integrare Microsoft Foundry.**

#### Adăugat
- **🤖 Parcurs de învățare AI-First**: Restructurare completă prioritizând dezvoltatorii și inginerii AI
- **Ghid de integrare Microsoft Foundry**: Documentație cuprinzătoare pentru conectarea AZD cu serviciile Microsoft Foundry
- **Modele de implementare AI**: Ghid detaliat acoperind selecția modelului, configurarea și strategii de implementare în producție
- **Atelier de AI**: Atelier practic de 2-3 ore pentru convertirea aplicațiilor AI în soluții implementabile cu AZD
- **Best practice-uri AI în producție**: Modele pregătite pentru întreprinderi pentru scalare, monitorizare și securizare a încărcărilor AI
- **Ghid de depanare specific AI**: Depanare cuprinzătoare pentru Microsoft Foundry Models, Cognitive Services și probleme de implementare AI
- **Galerie de șabloane AI**: Colecție prezentată de șabloane Microsoft Foundry cu ratinguri de complexitate
- **Materiale de atelier**: Structură completă de atelier cu laboratoare practice și materiale de referință

#### Îmbunătățit
- **Structura README**: Axată pe dezvoltator AI cu 45% date privind interesul comunității de pe Discord Microsoft Foundry
- **Parcuri de învățare**: Parcurs dedicat dezvoltatorilor AI în paralel cu traseele tradiționale pentru studenți și ingineri DevOps
- **Recomandări pentru șabloane**: Șabloane AI prezentate incluzând azure-search-openai-demo, contoso-chat și openai-chat-app-quickstart
- **Integrarea comunității**: Suport comunitar Discord îmbunătățit cu canale și discuții specifice AI

#### Focalizare pe securitate și producție
- **Modele de identitate gestionată**: Configurări de autentificare și securitate specifice AI
- **Optimizarea costurilor**: Urmărirea utilizării tokenilor și control bugetar pentru încărcările AI
- **Implementare multi-regiune**: Strategii pentru implementarea globală a aplicațiilor AI
- **Monitorizarea performanței**: Metrici specifice AI și integrare cu Application Insights

#### Calitatea documentației
- **Structură liniară a cursului**: Progres logic de la modele de implementare AI pentru începători la avansați
- **URL-uri validate**: Toate linkurile externe către repozitorii verificate și accesibile
- **Referință completă**: Toate linkurile interne validate și funcționale
- **Pregătit pentru producție**: Modele de implementare enterprise cu exemple din lumea reală

### [v2.0.0] - 2025-09-09

#### Modificări majore - Restructurare depozit și îmbunătățire profesională
**Această versiune reprezintă o revizuire semnificativă a structurii depozitului și a prezentării conținutului.**

#### Adăugat
- **Cadru de învățare structurat**: Toate paginile de documentație includ acum secțiuni de Introducere, Obiective de învățare și Rezultate așteptate
- **Sistem de navigare**: Adăugate linkuri Anterior/Următor lecției în toate documentațiile pentru progres ghidat în învățare
- **Ghid de studiu**: ghid-complet-de-studiu.md cu obiective de învățare, exerciții practice și materiale de evaluare
- **Prezentare profesională**: Eliminat toate icoanele emoji pentru o mai bună accesibilitate și aspect profesional
- **Structură conținut îmbunătățită**: Organizare și flux îmbunătățite ale materialelor de învățare

#### Modificat
- **Format documentație**: Standardizate toate documentațiile cu o structură consecventă axată pe învățare
- **Flux de navigare**: Implementat progres logic prin toate materialele de învățare
- **Prezentarea conținutului**: Eliminat elementele decorative în favoarea unui format clar și profesional
- **Structura linkurilor**: Actualizate toate linkurile interne pentru a susține noua navigare

#### Îmbunătățit
- **Accesibilitate**: Eliminat dependențele de emoji pentru o mai bună compatibilitate cu cititoarele de ecran
- **Aspect profesional**: Prezentare curată, în stil academic, potrivită pentru învățarea enterprise
- **Experiența de învățare**: Abordare structurată cu obiective clare și rezultate pentru fiecare lecție
- **Organizarea conținutului**: Flux logic mai bun și conexiune între subiecte conexe

### [v1.0.0] - 2025-09-09

#### Lansarea inițială - Depozit complet de învățare AZD

#### Adăugat
- **Structura principală a documentației**
  - Serii complète de ghiduri de început
  - Documentație cuprinzătoare pentru implementare și provisioning
  - Resurse detaliate pentru depanare și ghiduri de debugging
  - Unelte și proceduri de validare pre-implementare

- **Modul de început**
  - Bazele AZD: concepte și terminologie principale
  - Ghid de instalare: instrucțiuni specifice platformei
  - Ghid de configurare: configurarea mediului și autentificarea
  - Primul tutorial de proiect: învățare practică pas cu pas

- **Modul de implementare și provisioning**
  - Ghid de implementare: documentație completă a fluxului de lucru
  - Ghid de provisioning: Infrastructure as Code cu Bicep
  - Cele mai bune practici pentru implementări în producție
  - Modele de arhitectură multi-serviciu

- **Modul de validare pre-implementare**
  - Planificarea capacității: validarea disponibilității resurselor Azure
  - Selectarea SKU: ghid complet pentru nivelurile serviciilor
  - Verificări pre-zbor: scripturi automate de validare (PowerShell și Bash)
  - Unelte pentru estimare costuri și planificare bugetară

- **Modul de depanare**
  - Probleme comune: probleme frecvent întâlnite și soluții
  - Ghid de debugging: metodologii sistematice de depanare
  - Tehnici și unelte avansate de diagnosticare
  - Monitorizarea și optimizarea performanței

- **Resurse și referințe**
  - Fișă de comenzi rapide: referință rapidă pentru comenzi esențiale
  - Glosar: definiții cuprinzătoare pentru terminologie și acronime
  - FAQ: răspunsuri detaliate la întrebări frecvente
  - Linkuri către resurse externe și conexiuni comunitare

- **Exemple și șabloane**
  - Exemplu de aplicație web simplă
  - Șablon de implementare a site-ului static
  - Configurare aplicație containerizată
  - Modele de integrare cu baze de date
  - Exemple de arhitectură microservicii
  - Implementări de funcții serverless

#### Caracteristici
- **Suport multi-platformă**: Ghiduri de instalare și configurare pentru Windows, macOS și Linux
- **Multiple niveluri de competență**: Conținut conceput pentru studenți până la dezvoltatori profesioniști
- **Focus practic**: Exemple practice și scenarii din lumea reală
- **Acoperire cuprinzătoare**: De la concepte de bază la modele enterprise avansate
- **Abordare orientată spre securitate**: Cele mai bune practici de securitate integrate pe tot parcursul
- **Optimizarea costurilor**: Ghiduri pentru implementări și gestionare a resurselor cost-eficiente

#### Calitatea documentației
- **Exemple detaliate de cod**: Mostre practice de cod testate
- **Instrucțiuni pas cu pas**: Ghid clar și aplicabil
- **Gestionarea completă a erorilor**: Depanare pentru probleme comune
- **Integrarea celor mai bune practici**: Standarde și recomandări din industrie
- **Compatibilitate versiuni**: Actualizat cu cele mai recente servicii Azure și funcții azd

## Îmbunătățiri planificate viitoare

### Versiunea 3.1.0 (Planificată)
#### Extinderea platformei AI
- **Suport multi-model**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate
- **Framework-uri agenți AI**: Șabloane pentru implementări LangChain, Semantic Kernel și AutoGen
- **Modele avansate RAG**: Opțiuni de baze de date vectoriale dincolo de Azure AI Search (Pinecone, Weaviate etc.)
- **Observabilitate AI**: Monitorizare îmbunătățită pentru performanța modelului, utilizarea tokenilor și calitatea răspunsului

#### Experiența dezvoltatorului
- **Extensie VS Code**: Experiență integrată de dezvoltare AZD + Microsoft Foundry
- **Integrare GitHub Copilot**: Generarea șabloanelor AZD asistată AI
- **Tutoriale interactive**: Exerciții practice de codare cu validare automată pentru scenarii AI
- **Conținut video**: Tutoriale video suplimentare pentru învățătorii vizuali, axate pe implementări AI

### Versiunea 4.0.0 (Planificată)
#### Modele AI pentru întreprindere
- **Cadru de guvernanță**: Guvernanță, conformitate și rute de audit pentru modelele AI
- **AI multi-chiriaș**: Modele pentru deservirea mai multor clienți cu servicii AI izolate
- **Implementare Edge AI**: Integrare cu Azure IoT Edge și instanțe containerizate
- **AI cloud hibrid**: Modele de implementare multi-cloud și hibride pentru încărcături AI

#### Funcționalități avansate
- **Automatizare pipeline AI**: Integrare MLOps cu pipeline-uri Azure Machine Learning
- **Securitate avansată**: Modele zero-trust, endpoint-uri private și protecție avansată împotriva amenințărilor
- **Optimizarea performanței**: Strategii avansate de tuning și scalare pentru aplicații AI cu debit mare
- **Distribuție globală**: Modele de livrare de conținut și caching la margine pentru aplicații AI

### Versiunea 3.0.0 (Planificată) - Înlocuită de lansarea curentă
#### Adăugiri propuse - Acum implementate în v3.0.0
- ✅ **Conținut axat pe AI**: Integrare completă Microsoft Foundry (Finalizat)
- ✅ **Tutoriale interactive**: Atelier practic AI (Finalizat)
- ✅ **Modul de securitate avansată**: Modele de securitate specifice AI (Finalizat)
- ✅ **Optimizarea performanței**: Strategii de tuning pentru încărcări AI (Finalizat)

### Versiunea 2.1.0 (Planificată) - Parțial implementată în v3.0.0
#### Îmbunătățiri minore - Unele finalizate în lansarea curentă
- ✅ **Exemple suplimentare**: Scenarii de implementare axate pe AI (Finalizat)
- ✅ **FAQ extins**: Întrebări și depanare specifice AI (Finalizat)
- **Integrare unelte**: Ghiduri îmbunătățite pentru integrarea IDE și editorului
- ✅ **Extinderea monitorizării**: Modele de monitorizare și alertare specifice AI (Finalizat)

#### În continuare planificate pentru lansări viitoare
- **Documentație prietenoasă pentru mobil**: Design responsive pentru învățare mobilă
- **Acces offline**: Pachete de documentație descărcabile
- **Integrare IDE îmbunătățită**: Extensie VS Code pentru fluxuri de lucru AZD + AI
- **Dashboard comunitar**: Metrici comunitare în timp real și urmărirea contribuțiilor

## Contribuții la ChangeLog

### Raportarea modificărilor
Când contribuiți la acest depozit, vă rugăm să vă asigurați că intrările din changelog includ:

1. **Numărul versiunii**: Urmând versiunea semantică (majoră.minor.patch)
2. **Data**: Data lansării sau actualizării în format YYYY-MM-DD
3. **Categoria**: Adăugat, Modificat, Deprcat, Eliminat, Remediat, Securitate
4. **Descriere clară**: Descriere concisă a modificărilor efectuate
5. **Evaluarea impactului**: Cum afectează schimbările utilizatorii existenți

### Categorii de modificări

#### Adăugat
- Funcționalități noi, secțiuni de documentație sau capabilități
- Exemple noi, șabloane sau resurse de învățare
- Unelte, scripturi sau utilitare suplimentare

#### Modificat
- Modificări ale funcționalității sau documentației existente
- Actualizări pentru claritate sau acuratețe sporită
- Restructurarea conținutului sau organizației

#### Deprcat
- Funcționalități sau abordări care sunt eliminate treptat
- Secțiuni de documentație programate pentru eliminare
- Metode pentru care există alternative mai bune

#### Eliminat
- Funcționalități, documentații sau exemple care nu mai sunt relevante
- Informații depășite sau abordări deprcate
- Conținut redundant sau consolidat

#### Remediat
- Corecturi pentru erori în documentație sau cod
- Rezolvarea problemelor sau erorilor raportate
- Îmbunătățiri ale acurateței sau funcționalității


#### Securitate
- Îmbunătățiri sau corectări legate de securitate
- Actualizări ale celor mai bune practici de securitate
- Rezolvarea vulnerabilităților de securitate

### Ghidul de Versionare Semantică

#### Versiune Majoră (X.0.0)
- Modificări majore care necesită acțiunea utilizatorului
- Restructurare semnificativă a conținutului sau organizării
- Modificări care schimbă abordarea sau metodologia fundamentală

#### Versiune Minoră (X.Y.0)
- Funcționalități noi sau adaosuri de conținut
- Îmbunătățiri care mențin compatibilitatea cu versiunile anterioare
- Exemple suplimentare, unelte sau resurse

#### Versiune Patch (X.Y.Z)
- Corecturi de erori și remedieri
- Îmbunătățiri minore ale conținutului existent
- Clarificări și îmbunătățiri mici

## Feedback și Sugestii din Comunitate

Încurajăm activ feedback-ul comunității pentru a îmbunătăți această resursă de învățare:

### Cum să oferi feedback
- **GitHub Issues**: Raportați probleme sau sugerați îmbunătățiri (problemele specifice AI sunt binevenite)
- **Discord Discussions**: Împărtășiți idei și interacționați cu comunitatea Microsoft Foundry
- **Pull Requests**: Contribuiți cu îmbunătățiri directe ale conținutului, în special pentru șabloane și ghiduri AI
- **Microsoft Foundry Discord**: Participați în canalul #Azure pentru discuții despre AZD + AI
- **Community Forums**: Participați în discuții mai ample despre dezvoltarea Azure

### Categorii de Feedback
- **Acuratețea conținutului AI**: Corecturi privind integrarea și implementarea serviciilor AI
- **Experiența de învățare**: Sugestii pentru un flux mai bun de învățare al dezvoltatorilor AI
- **Conținut AI Lipsă**: Cereri pentru șabloane, modele sau exemple AI suplimentare
- **Accesibilitate**: Îmbunătățiri pentru nevoi diverse de învățare
- **Integrarea uneltelor AI**: Sugestii pentru o integrare mai bună în fluxul de dezvoltare AI
- **Modele AI în producție**: Cereri de modele enterprise pentru implementarea AI

### Angajamentul de Răspuns
- **Răspuns la Probleme**: În maxim 48 de ore pentru problemele raportate
- **Solicitări de Funcționalități**: Evaluare în termen de o săptămână
- **Contribuții din Comunitate**: Revizuire în termen de o săptămână
- **Probleme de Securitate**: Prioritate imediată cu răspuns accelerat

## Program de Mentenanță

### Actualizări Regulate
- **Revizii Lunare**: Verificarea acurateței conținutului și validarea linkurilor
- **Actualizări Trimestriale**: Adaosuri majore de conținut și îmbunătățiri
- **Revizii Semestriale**: Restructurare și optimizare cuprinzătoare
- **Lansări Anuale**: Actualizări majore de versiune cu îmbunătățiri semnificative

### Monitorizare și Asigurarea Calității
- **Testare Automatizată**: Validarea regulată a exemplelor de cod și linkurilor
- **Integrarea Feedback-ului Comunității**: Incorporarea regulată a sugestiilor utilizatorilor
- **Actualizări Tehnologice**: Alinierea cu cele mai noi servicii Azure și lansările azd
- **Audituri de Accesibilitate**: Revizuiri regulate pentru principii de design incluziv

## Politica de Suport pentru Versiuni

### Suport pentru Versiunea Curentă
- **Ultima versiune majoră**: Suport complet cu actualizări regulate
- **Versiunea majoră anterioară**: Actualizări de securitate și corecturi critice timp de 12 luni
- **Versiuni moștenite**: Suport comunitar doar, fără actualizări oficiale

### Ghid pentru Migrare
Când sunt lansate versiuni majore, oferim:
- **Ghiduri de Migrare**: Instrucțiuni pas cu pas pentru tranziție
- **Note de Compatibilitate**: Detalii despre schimbările incompatibile
- **Suport pentru unelte**: Scripturi sau utilitare pentru asistență la migrare
- **Suport Comunitar**: Forumuri dedicate pentru întrebări despre migrare

---

**Navigare**
- **Lecția anterioară**: [Ghid de studiu](resources/study-guide.md)
- **Lecția următoare**: Întoarce-te la [README principal](README.md)

**Rămâi actualizat**: Urmărește acest depozit pentru notificări despre noi lansări și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
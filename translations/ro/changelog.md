# Changelog - AZD Pentru Începători

## Introducere

Acest changelog documentează toate schimbările notabile, actualizările și îmbunătățirile din depozitul AZD Pentru Începători. Urmăm principiile versionării semantice și menținem acest jurnal pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de Învățare

Prin revizuirea acestui changelog, vei:
- Fi la curent cu noile funcționalități și adăugiri de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Urmări remedierea erorilor și corecturile pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare în timp

## Rezultate de Învățare

După ce vei revizui înregistrările din changelog, vei putea:
- Identifica conținutul și resursele noi disponibile pentru învățare
- Înțelege care secțiuni au fost actualizate sau îmbunătățite
- Planifica traseul tău de învățare bazat pe cele mai actuale materiale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoric Versiuni

### [v3.25.0] - 2026-11-09

#### Extensia Microsoft Foundry 1.0 este acum disponibilă general

Pachetul `microsoft.foundry` 1.0 este **live și disponibil general**, conform anunțului din [5 noiembrie 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Cursul predă acum fluxul de lucru GA lansat, nu o versiune viitoare. Începe cu AZD **1.37.0 sau mai recent** și `azd ext install microsoft.foundry`.

#### Disponibil în această actualizare a cursului
- Ghidul în limba engleză folosește pachetul GA ca cale implicită de instalare și explică cele șapte extensii de bază versionate independent.
- Un [tutorial cu agent găzduit](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) acoperă API-ul de răspunsuri upstream Python Agent Framework sample, uv curent, Python 3.13+, selecția proiectelor noi/existente, reutilizarea modelului și revizuirea `azure.yaml`.
- Fluxul de lucru local-to-cloud acoperă testarea Agent Inspector, costurile apelurilor modelului susținute de Azure, construirea codului la distanță, invocarea implementată, trasarea în cloud, previzualizarea implementării, jurnalele și diagnostice.
- Ghidul separat de evaluare acoperă generarea și revizuirea seturilor de date/rubricilor, configurarea unei evaluări nominalizate, înregistrarea activelor și inspectarea rezultatelor. Instrucțiunile mai vechi de evaluare/optimizare rămân în istoricul migrației, nu sunt baza versiunii curente.
- Ghidul Foundry CI/CD include instalarea extensiei runner, implementare autentificată, acces/active de evaluare și o poartă de calitate explicită.
- Ghidul de curățare Distinge proiectele Foundry nou create și reutilizate. Workshop-ul leagă către exercițiul GA separat fără a înlocui testele specifice exemplului.
- Navigarea cursului, obiectivele de învățare, cerințele de configurare, fișa de ajutor, FAQ și ghidul de studiu reflectă fluxul de lucru GA. Traducerile generate nu sunt editate manual.

#### Domeniul de revizuire
- Bazat pe anunțul GA, ghidul Microsoft Learn legat și configurația upstream sample. Nu s-au făcut provizionări Azure live, implementări, invocări model sau evaluări.
- Pachetul GA nu implică GA pentru fiecare funcționalitate opțională, extensie independentă sau SDK, nici nu certifică exemplele pentru producție.

### [v3.24.0]- 2026-11-04

#### Corectat
- Reparat navigarea cursului în engleză, căi pentru pagini mutate, ancore lipsă și referințe externe învechite, inclusiv linkul din Capitolul 2 către ghidul AI pentru producție.
- Revizuit ghidul curent față de AZD 1.37.2 publicat, agenți 1.0.0-beta.23 și evaluări 1.0.0-beta.2. Documentat fluxul de lucru separat `azd ai eval` și migrarea configurației de optimizare.
- Corectat flag-uri CLI neacceptate, limite de autentificare, ghid de medii/secrete în clar, actualizări de infrastructură, configurare model și exemple de recuperare distructivă.
- Actualizat workshop-ul față de exemplul curent AI Agents, inclusiv hook-uri reale, intrări de configurare, teste de evaluare, puncte de intrare red-teaming și observabilitate.
- Corectat afirmații din implementarea exemplului și reparat probleme asociate aplicației/infrastructurii/configurării. Materialul de arhitectură retail este clar distins de o aplicație completă funcțională.
- Restaurat matricea de limbaj CodeQL, selectat Node.js 24 suportat pentru containerul de dezvoltare și făcut validatorii de configurare să raporteze comenzi cu versiuni eșuate.

#### Adăugat
- Verificator offline în limba engleză pentru link-uri/ancore, teste de regresie și un workflow de documentare care construiește și workshop-ul în mod strict. Traducerile generate și imaginile traduse sunt excluse.

#### Domeniul de validare
- Sursa, sintaxa, configurația, comportamentul local și verificările linkurilor de rețea nu stabilesc disponibilitatea live pentru implementare Azure, cote, RBAC, disponibilitatea regională a modelelor, facturare, conformitate de securitate sau pregătirea pentru producție.
- Înregistrările mai vechi de mai jos sunt documente istorice, nu instrucțiuni curente de comandă sau versiune.

### [v3.23.0] - 2026-07-13

#### Actualizare AZD 1.27.1: Actualizare versiune curentă
**Această versiune revalidatează cursul față de `azd` `1.27.1` (iulie 2026, ultima versiune stabilă) și extensia agent AI previzualizată curent `azure.ai.agents` `1.0.0-beta.5`, aducând toate bannerele "validate față de" la zi după versiunile 1.26.0, 1.27.0 și 1.27.1.**

#### Modificat
- **✅ Baza de validare actualizată** de la `azd 1.25.6` (iunie 2026) la `azd 1.27.1` (iulie 2026) pentru README-ul principal, toate README-urile capitolelor, lecția despre dev-container din Capitolul 1 (inclusiv exemple cu versiuni fixate), lecția despre template-uri personalizate din Capitolul 4, lecția multi-agent din Capitolul 5 și documentația workshop-ului
- **🤖 Baza Capitolului 2 reîmprospătată** de la `azd 1.23.12` (martie 2026) la `azd 1.27.1` pentru `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` și `microsoft-foundry-integration.md`; datele notelor de validare actualizate la 2026-07-13
- **🧩 Extensia agent AI actualizată** de la `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` la versiunea curentă `1.0.0-beta.5` în README-ul Capitolului 2 și `agents.md`
- **🧪 Exemplu de validare workshop** (`azd version` output) actualizat la `1.27.1`

#### Note despre versiunile azd relevante (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suport Go pentru Azure Functions on Flex Consumption, filtre de abonament per-tenant `azd config sub-filter`, pachete de extensii auto-conținute (`azd x pack --bundle`) și `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Proiecte/agenți Azure AI Foundry modelați direct în `azure.yaml` (inițializare fără Bicep/Terraform), suport pentru implementare în container pe App Service (`host: appservice` + `language: docker`), comenzi `-s/--source` directe pentru `azd extension` și `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` pentru `azd extension install`, modele depreciate excluse implicit din prompturile catalog/quota și mai multe remedieri de erori

#### Fișiere actualizate
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

#### Completare Gol Pentru Începători #2: Creare Template, Containere Dev, Pulumi, Azure DevOps, Service Principals și Altele
**Această versiune închide ultimele lacune intermediare evidențiate de analiza acoperirii azd: cum să creezi și să publici propriul template, medii reproducibile cu dev-container/Codespaces, provider-ul de infrastructură Pulumi, un tutorial Azure DevOps CI/CD, autentificarea prin service-principal, ghid de selecție a gazdei (AKS/Spring Apps), explicații `azd restore`/`azd package`, gestionarea erorilor hook-urilor și practici pentru medii de echipă/partajate.**

#### Adăugat
- **🧱 Lecție nouă Capitolul 4** `docs/chapter-04-infrastructure/custom-templates.md` — crearea propriului template azd: structură necesară (`azure.yaml`, `infra/`, `src/`), câmpul `metadata.template`, parametrare infrastructură cu tokenul resursei `uniqueString()` și tag-ul `azd-env-name`, teste locale cu `azd init --template <local-path>`, publicare pe GitHub și înscriere în galeria Awesome AZD
- **📦 Lecție nouă Capitolul 1** `docs/chapter-01-foundation/dev-containers.md` — medii azd reproducibile cu Dev Containers și GitHub Codespaces: un `.devcontainer/devcontainer.json` minimal folosind funcția oficială `ghcr.io/azure/azure-dev/azd`, funcționalități specifice limbajului, `docker-in-docker` pentru gazde container și `azd auth login --use-device-code` pentru autentificare de la distanță
- Secțiunea **🧩 Pulumi cu azd** în `docs/chapter-04-infrastructure/provisioning.md` — configurare `infra.provider: pulumi`, structura folderului Pulumi, stive mapate la mediile azd, ieșiri/tagging obligatorii și fluxul de lucru identic `azd up` / `azd down`
- **🎯 Ghid de selecție a gazdei** în `docs/chapter-04-infrastructure/provisioning.md` — comparație prietenoasă pentru începători între `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` și `springapp`, cu recomandări pentru când să alegi AKS sau Azure Spring Apps
- **🛠️ Tutorial Azure DevOps CI/CD** în `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexiune serviciu cu federare identitate workload (OIDC), `azure-dev.yml` generat și configurarea grupului de variabile
- **🔑 Service Principals (Model 4)** adăugat în `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, autentificare non-interactivă `azd auth login` cu secret client față de credențiale federate/OIDC, când să folosești și stocare sigură a credențialelor
- Subsecțiunea **🪝 Gestionare erori hook** în `docs/chapter-04-infrastructure/deployment-guide.md` — coduri de ieșire și `set -e`, `continueOnError`, testarea hook-urilor izolate cu `azd hooks run`, shell-uri specifice OS și `--debug`
- Secțiunea **👥 Medii de echipă / partajate** în `docs/chapter-03-configuration/configuration.md` — ce trăiește în `.azure/`, ce să ignori în git, medii per-dezvoltator, `azd env list`/`select` și furnizarea valorilor de mediu în CI/CD
- Explicații **🧰 `azd restore` și extinse `azd package`** în `resources/cheat-sheet.md` — restaurarea dependențelor și construirea unui artefact pentru implementare fără a implementa

#### Modificat
- Tabelul lecțiilor din **🧭 Capitolul 4** actualizat pentru a include lecția nouă "Crearea propriului template" (Lecția 3)
- Tabelul lecțiilor din **🧭 Capitolul 1** actualizat pentru a include lecția nouă "Dev Containers & Codespaces" (Lecția 5); footer-ele de navigare conectate între `bring-your-own-app.md` și `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Completare gol pentru începători: Lecție practică multi-agent, „Adaugă propria aplicație”, Terraform și tutorial CI/CD
**Această versiune închide cele mai mari lacune pentru un ghid complet pentru începători adăugând două lecții practice noi (un tutorial multi-agent deployabil și adăugarea azd unei aplicații existente), o introducere prietenoasă pentru hook-uri, o secțiune Terraform cu azd, un tutorial pas cu pas GitHub Actions, o explicație pentru noile extensii în preview și o listă de verificare explicită pentru verificarea implementării.**

#### Adăugat
- **🤝 Lecție nouă Capitolul 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un tutorial complet hands-on, deployabil cu doi agenți (orchestrator + specialiști) folosind un template real (`contoso-creative-writer`), acoperind când să folosești multi-agent, fluxul de lucru `azd up`, înțelegerea resurselor implementate, trasarea între agenți, personalizarea și curățarea
- **📦 Lecție nouă Capitolul 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cum să adaugi azd unui proiect existent cu `azd init` ("folosește codul din directorul curent"), înțelegerea `azure.yaml` și `infra/`, `azd infra generate`, detectarea gazdei și implementarea cu `azd up`
- Secțiunea **🌐 Terraform cu azd** adăugată în `docs/chapter-04-infrastructure/provisioning.md` — configurare `infra.provider: terraform`, structura folderului `.tf`, ieșiri obligatorii `AZURE_*` și taguiri `azd-env-name` și fluxul de lucru identic `azd up` / `azd down` (închide lacuna unde suportul Terraform era menționat, dar a fost arătat doar Bicep)
- **⚙️ Parcurgere pas cu pas a GitHub Actions** în `docs/chapter-08-production/production-ai-practices.md` — de la repo GitHub la deploy-uri automate: `azd pipeline config`, credențiale federate OIDC (fără secrete stocate), `azure-dev.yml` generate și ghid pentru secrete vs variabile
- **🪝 Introducere pentru începători „Noutăți despre hooks?”** în `docs/chapter-04-infrastructure/deployment-guide.md` — ce este un hook, un tabel cu stadii hook, un prim hook minimal și rularea manuală a hook-urilor cu `azd hooks run`
- **✅ Lista de verificare „Verifică Deploy-ul”** adăugată la Pasul 5 din `docs/chapter-01-foundation/first-project.md` — test rapid, verificare endpoint de sănătate și criterii explicite de succes
- **🧩 Explicații pentru noile extensii preview** `azure.ai.skills` și `azure.ai.connections` (ce sunt și când să le folosești) în `docs/chapter-08-production/production-ai-practices.md`

#### Modificat
- **🧭 Tabelul lecțiilor din Capitolul 5** corectat: `multi-agent-basics.md` este acum Lecția 1 (singura lecție complet practică), cu etichetare onestă că Lecția 2 este în Capitolul 6, iar scenariul Retail este un blueprint de arhitectură, nu un template de o singură comandă
- **🧭 Tabelul lecțiilor din Capitolul 1** include acum noua lecție „Adu-ți propria aplicație” (Lecția 4)
- **🔗 Navigarea în footer** actualizată: `first-project.md` acum leagă înainte spre `bring-your-own-app.md`

#### Remediat
- **🧱 S-a închis decalajul Terraform „clamat dar lipsă”** — cursul anterior menționa suport Terraform fără să îl arate
- **🔀 Corectat linkare înșelătoare în Capitolul 5** care implica existența unei implementări multi-agent complete când era doar un blueprint de arhitectură

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

#### Reîmprospătare AZD 1.25.6, comenzi complete pentru ciclul de viață al agentului & rebranding Aspire
**Această versiune revalidează cursul față de `azd` `1.25.6` (iunie 2026) și extensia `azure.ai.agents` `0.1.40-preview`, extinde ghidajul AI de la „scaffold agent” la ciclul complet de viață al agentului (test → evaluare → optimizare → inspectare → ștergere), aduce în prim-plan noile extensii preview `azure.ai.skills` și `azure.ai.connections` și notează rebrandingul produsului de la ".NET Aspire" la "Aspire".**

#### Adăugat
- **🔁 Acoperire completă a ciclului de viață al agentului** pentru începători și ingineri AI în întreaga documentație:
  - `docs/chapter-01-foundation/azd-basics.md` — tabelul de ciclul de viață (scaffold → testare → măsurare → îmbunătățire → inspectare → curățare) adăugat în secțiunea Extensii și Comenzi AI
  - `docs/chapter-08-production/production-ai-practices.md` — noua secțiune „Gestionarea ciclului de viață al agentului” ce acoperă `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` și `delete --force`
  - `resources/cheat-sheet.md` — Comenzi extinse AI Agent cu `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` și `delete --force`
- **🧩 Documentate noile extensii preview**: `azure.ai.skills` (skilluri reutilizabile de agent) și `azure.ai.connections` (conexiuni Foundry) adăugate în tabelul de extensii și fișa de ajutor
- **⏱️ Ghid pentru timpi de răspuns** — exemplele `azd ai agent invoke` menționează acum timpul total de latență și timpul până la primul byte
- **📌 Banner cu versiunea** în README-ul principal care îndrumă cursanții spre `azd version` și `azd upgrade`

#### Modificat
- **✅ Linia de bază pentru validare actualizată** de la `azd 1.23.12` (martie 2026) la `azd 1.25.6` (iunie 2026) în toate README-urile capitolelor și documentația workshop-ului
- **🤖 Nota extensie Capitolul 2** actualizată de la `azure.ai.agents` `0.1.18-preview` la `0.1.40-preview`
- **🧪 Exemplu de validare workshop** (output `azd version`) actualizat la `1.25.6`
- **🧭 README „Ce e nou azi în azd”** reîmprospătat pentru a evidenția ciclul de viață complet al agentului, noile extensii AI și ultimele corecturi pentru experiența utilizatorului (`azd init` idempotentă, `azd auth login` curățare token învechit, `azd tool` prompt primul rulaj)
- **📖 agents.md Capitolul 2 (Opțiunea 4)** indică acum comenzi pentru ciclul de viață post-deploy și nu se mai oprește la `azd up`

#### Remediat
- **🏷️ Denumirea produsului** — adăugată notă de rebranding Aspire (".NET Aspire" este acum doar "Aspire"); suportul azd pentru Aspire rămâne neschimbat
- **🔎 Validare release live** confirmată față de feed-ul de lansări Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) și `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Clarificare onboarding pentru începători, validarea setup-ului și curățare finală comenzi AZD
**Această versiune continuă revizuirea validării AZD 1.23 cu un pas de documentație axat pe începători: clarifică îndrumarea de autentificare AZD-first, adaugă scripturi locale de validare setup, verifică comenzile cheie față de AZD CLI live și elimină ultimele referințe la comenzi sursă engleză învechite în afara changelog-ului.**

#### Adăugat
- **🧪 Scripturi de validare setup pentru începători** cu `validate-setup.ps1` și `validate-setup.sh` pentru a confirma uneltele necesare înainte de a începe Capitolul 1
- **✅ Pași de validare a setup-ului upfront** în README-ul principal și al Capitolului 1 pentru a prinde lipsa prerechizitelor înainte de `azd up`

#### Modificat
- **🔐 Îndrumare autentificare pentru începători** tratează acum consistent `azd auth login` ca cale primară pentru fluxurile de lucru AZD, cu `az login` ca opțională, cu excepția cazului în care se folosesc direct comenzi Azure CLI
- **📚 Flux onboarding Capitolul 1** indică acum cursanților să valideze setup-ul local înainte de instalare, autentificare și primii pași de deploy
- **🛠️ Mesaje Validator** separă clar cerințele blocante de avertismentele opționale Azure CLI pentru calea doar AZD a începătorilor
- **📖 Documentația de configurare, depanare și exemple** face acum distincție între autentificarea AZD obligatorie și autentificarea opțională Azure CLI când ambele erau prezentate anterior fără context

#### Remediat
- **📋 Referințe rămase la comenzi sursă engleză** actualizate la formele curente AZD, inclusiv `azd config show` în cheat sheet și `azd monitor --overview` unde se intenționa ghidaj overview în Azure Portal
- **🧭 Reclamații pentru începători în Capitolul 1** atenuate pentru a evita promisiunea exagerată de comportament fără erori sau rollback garantat pentru toate template-urile și resursele Azure
- **🔎 Validare live CLI** confirmată pentru suport curent `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` și `azd down --force --purge`

#### Fișiere Actualizate
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

#### Validare AZD 1.23.12, extindere mediu workshop & reîmprospătare model AI
**Această versiune efectuează o trecere de validare a documentației față de `azd` `1.23.12`, actualizează exemple de comenzi AZD învechite, reîmprospătează ghidajul modelului AI la setările implicite curente și extinde instrucțiunile workshop-ului dincolo de GitHub Codespaces pentru a suporta containere de dezvoltare și clone locale.**

#### Adăugat
- **✅ Note de validare în capitolele de bază și documentația workshop-ului** pentru a face clară linia de bază AZD testată pentru cursanții ce folosesc build-uri CLI mai noi sau mai vechi
- **⏱️ Ghidaj timeout deployment** pentru deploy-uri AI ce rulează timp îndelungat folosind `azd deploy --timeout 1800`
- **🔎 Pași de inspectare extensii** cu `azd extension show azure.ai.agents` în documentația fluxurilor AI
- **🌐 Ghidaj mai larg pentru mediu workshop** acoperind GitHub Codespaces, containere de dezvoltare și clone locale cu MkDocs

#### Modificat
- **📚 README-uri introductive capitole** notează acum consistent validarea față de `azd 1.23.12` în secțiunile fundație, configurație, infrastructură, multi-agent, pre-deploy, depanare și producție
- **🛠️ Referințe comenzi AZD** actualizate la forme curente în toată documentația:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` sau `azd env get-value(s)` în funcție de context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` unde este intenționat overview Application Insights
- **🧪 Exemple de provisioning preview** simplificate la utilizarea suportată curent, precum `azd provision --preview` și `azd provision --preview -e production`
- **🧭 Fluxul workshop** actualizat pentru ca cursanții să poată finaliza laboratoarele în Codespaces, dev container sau o clonă locală, fără a presupune folosirea exclusivă a Codespaces
- **🔐 Îndrumare autentificare** preferă acum `azd auth login` pentru fluxurile AZD, cu `az login` opțional pentru comenzile directe Azure CLI

#### Remediat
- **🪟 Comenzi instalare Windows** normalizate la casingul curent al pachetului `winget` în ghidul de instalare
- **🐧 Ghid instalare Linux** corectat pentru a evita instrucțiuni nesuportate pentru manageri de pachete distro-specifici `azd` și în schimb să indice către assets de release când este cazul
- **📦 Exemple model AI** reîmprospătate de la default-uri mai vechi precum `gpt-35-turbo` și `text-embedding-ada-002` la exemple curente cum ar fi `gpt-4.1-mini`, `gpt-4.1` și `text-embedding-3-large`
- **📋 Snippet-uri pentru deploy și diagnostic** corectate să folosească comenzi curente de mediu și stare în log-uri, scripturi și pași de depanare
- **⚙️ Îndrumare GitHub Actions** actualizată de la `Azure/setup-azd@v1.0.0` la `Azure/setup-azd@v2`
- **🤖 Îndrumare consimțământ MCP/Copilot** actualizată de la `azd mcp consent` la `azd copilot consent list`

#### Îmbunătățit
- **🧠 Ghidaj capitol AI** acum explică mai bine comportamentul sensibil la preview `azd ai`, autentificarea specifică tenantului, utilizarea curentă a extensiilor și recomandările actualizate pentru implementarea modelelor
- **🧪 Instrucțiuni workshop** folosesc acum exemple de versiuni mai realiste și limbaj mai clar pentru configurarea mediului în laboratoare practice
- **📈 Documentația producție și depanare** se aliniază mai bine cu exemplele actuale de monitorizare, model fallback și niveluri de cost

#### Fișiere Actualizate
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

#### Comenzi AZD AI CLI, validare conținut & extindere template
**Această versiune adaugă acoperire la comenzile `azd ai`, `azd extension` și `azd mcp` în toate capitolele legate de AI, remediază linkuri întrerupte și cod depreciat în agents.md, actualizează foaia de trucuri și revizuiește secțiunea Șabloane Exemple cu descrieri validate și noi șabloane Azure AI AZD.**

#### Adăugat
- **🤖 Acoperire AZD AI CLI** în 7 fișiere (anterior doar în Capitolul 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Secțiune nouă "Extensii și Comenzi AI" care introduce `azd extension`, `azd ai agent init`, și `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opțiunea 4: `azd ai agent init` cu tabel de comparație (șablon vs abordare manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecțiuni "Extensii AZD pentru Foundry" și "Implementare Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start arată acum ambele căi de implementare bazate pe șablon și manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secțiunea Deploy include acum opțiunea `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecțiunea "Comenzi de Diagnosticare pentru Extensia AZD AI"
  - `resources/cheat-sheet.md` — Secțiune nouă "Comenzi AI & Extensii" cu `azd extension`, `azd ai agent init`, `azd mcp`, și `azd infra generate`
- **📦 Șabloane noi de exemple AZD AI** în `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET cu Blazor WebAssembly, Semantic Kernel și suport voce
  - **azure-search-openai-demo-java** — Chat RAG Java folosind Langchain4J cu opțiuni de implementare ACA/AKS
  - **contoso-creative-writer** — Aplicație multi-agent pentru scriere creativă folosind Azure AI Agent Service, Bing Grounding și Prompty
  - **serverless-chat-langchainjs** — RAG Serverless folosind Azure Functions + LangChain.js + Cosmos DB cu suport de dezvoltare locală Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator enterprise RAG cu portal administrativ, integrare Teams și opțiuni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicație de referință pentru orchestrare multi-agent MCP cu servere în .NET, Python, Java și TypeScript
  - **azd-ai-starter** — Șablon minimal de pornire a infrastructurii Azure AI Bicep
  - **🔗 Link Galerie Awesome AZD AI** — Referință la [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ șabloane)

#### Remediat
- **🔗 Navigare agents.md**: Linkurile Previous/Next se potrivesc acum cu ordinea lecțiilor din capitolul 2 README (Microsoft Foundry Integration → Agenți → Implementare Model AI)
- **🔗 Linkuri întrerupte agents.md**: `production-ai-practices.md` corectat în `../chapter-08-production/production-ai-practices.md` (3 apariții)
- **📦 Cod depreciat agents.md**: Înlocuit `opencensus` cu `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API invalid agents.md**: Mutat `max_tokens` din `create_agent()` în `create_run()` ca `max_completion_tokens`
- **🔢 Numărare tokeni agents.md**: Înlocuit estimarea aproximativă `len//4` cu `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corectate serviciile de la "Cognitive Search + App Service" la "Azure AI Search + Azure Container Apps" (gazda implicită schimbată Oct 2024)
- **contoso-chat**: Actualizată descrierea pentru a se referi la Azure AI Foundry + Prompty, conform titlului și tehnologiei din repo

#### Eliminat
- **ai-document-processing**: Eliminată referința la șablon nefuncțional (repo netransmis public ca șablon AZD)

#### Îmbunătățit
- **📝 exerciții agents.md**: Exercițiul 1 arată acum output-ul așteptat și pasul `azd monitor`; Exercițiul 2 include cod complet de înregistrare `FunctionTool`; Exercițiul 3 înlocuiește indicații vagi cu comenzi concrete `prepdocs.py`
- **📚 resurse agents.md**: Actualizare linkuri documentație la documentele actuale Azure AI Agent Service și quickstart
- **📋 tabel Pași Următori agents.md**: Adăugat link laborator AI Workshop cu acoperire completă a capitolului

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

#### Îmbunătățire Navigare Curs
**Această versiune îmbunătățește navigarea capitolelor README.md cu un format tabelar extins.**

#### Schimbat
- **Tabel Harta Cursului**: Îmbunătățit cu linkuri directe către lecții, estimări de durată și ratinguri de complexitate
- **Curățare Foldere**: Eliminare foldere vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validare Linkuri**: Verificate toate cele 21+ linkuri interne din tabelul Hărții Cursului

### [v3.16.0] - 2026-02-05

#### Actualizări Nume Produs
**Această versiune actualizează referințele produselor conform brandului curent Microsoft.**

#### Schimbat
- **Microsoft Foundry → Microsoft Foundry**: Actualizate toate referințele din fișierele fără traducere
- **Azure AI Agent Service → Foundry Agents**: Numele serviciului actualizat pentru a reflecta brandul curent

#### Fișiere Actualizate
- `README.md` - Pagina principală a cursului
- `changelog.md` - Istoric versiuni
- `course-outline.md` - Structura cursului
- `docs/chapter-02-ai-development/agents.md` - Ghid agenți AI
- `examples/README.md` - Documentație exemple
- `workshop/README.md` - Pagina de start a atelierului
- `workshop/docs/index.md` - Index atelier
- `workshop/docs/instructions/*.md` - Toate fișierele de instrucțiuni ale atelierului

---

### [v3.15.0] - 2026-02-05

#### Reorganizare Majoră a Repozitoriului: Foldere Numite pe Capitole
**Această versiune restructurează documentația în foldere dedicate capitolelor pentru o navigare mai clară.**

#### Redenumiri Foldere
Folderele vechi au fost înlocuite cu foldere numerotate pe capitole:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Adăugat nou: `docs/chapter-05-multi-agent/`

#### Migrații Fișiere
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
  - Comenzi Quick start
  - Navigare către alte capitole

#### Schimbat
- **🔗 Actualizate toate linkurile interne**: 78+ căi actualizate în toate fișierele de documentație
- **🗺️ README.md principal**: Actualizată Harta Cursului cu noua structură de capitole
- **📝 examples/README.md**: Actualizate referințele către folderele capitolelor

#### Eliminat
- Structura veche a folderelor (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reorganizare Repozitoriu: Navigare Capitole
**Această versiune a adăugat fișiere README pentru navigarea capitolelor (înlocuită de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ghid Nou pentru Agenți AI
**Această versiune adaugă un ghid cuprinzător pentru implementarea agenților AI cu Azure Developer CLI.**

#### Adăugat
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet acoperind:
  - Ce sunt agenții AI și cum diferă de chatbots
  - Trei șabloane rapide de pornire pentru agenți (Foundry Agents, Prompty, RAG)
  - Modele arhitecturale pentru agenți (agent unic, RAG, multi-agent)
  - Configurare și personalizare unelte
  - Monitorizare și urmărire metrici
  - Considerații și optimizare costuri
  - Scenarii comune de depanare
  - Trei exerciții practice cu criterii de succes

#### Structura Conținutului
- **Introducere**: Concepte agenți pentru începători
- **Quick Start**: Implementare agenți cu `azd init --template get-started-with-ai-agents`
- **Modele Arhitecturale**: Diagrame vizuale ale modelelor agenți
- **Configurare**: Setări unelte și variabile de mediu
- **Monitorizare**: Integrare cu Application Insights
- **Exerciții**: Învățare progresivă practică (20-45 minute fiecare)

---

### [v3.12.0] - 2026-02-05

#### Actualizare Mediu DevContainer
**Această versiune actualizează configurația containerului de dezvoltare cu unelte moderne și implicituri mai bune pentru experiența de învățare AZD.**

#### Schimbat
- **🐳 Imagine de bază**: Actualizată de la `python:3.12-bullseye` la `python:3.12-bookworm` (Debian stable cea mai recentă)
- **📛 Nume container**: Redenumit de la "Python 3" la "AZD for Beginners" pentru claritate

#### Adăugat
- **🔧 Funcționalități noi Dev Container**:
  - `azure-cli` cu suport Bicep activat
  - `node:20` (versiunea LTS pentru șabloane AZD)
  - `github-cli` pentru management șabloane
  - `docker-in-docker` pentru implementări container app

- **🔌 Forwardări porturi**: Porturi preconfigurate pentru dezvoltare obișnuită:
  - 8000 (previzualizare MkDocs)
  - 3000 (aplicații web)
  - 5000 (Python Flask)
  - 8080 (API-uri)

- **🧩 Extensii noi VS Code**:
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

- **⚙️ Setări VS Code**: Adăugate setări implicite pentru interpret Python, formatare la salvare și tăiere spații albe

- **📦 Actualizare requirements-dev.txt**:
  - Adăugat plugin minify MkDocs
  - Adăugat pre-commit pentru calitatea codului
  - Adăugate pachete Azure SDK (azure-identity, azure-mgmt-resource)

#### Remediat
- **Comanda Post-Creare**: Verifică acum instalarea AZD și Azure CLI la pornirea containerului

---

### [v3.11.0] - 2026-02-05

#### Revizuire README pentru Începători
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil pentru începători și adaugă resurse esențiale pentru dezvoltatorii AI.**

#### Adăugat
- **🆚 Comparație Azure CLI vs AZD**: Explicație clară când să folosești fiecare unealtă cu exemple practice
- **🌟 Linkuri Awesome AZD**: Linkuri directe către galeria comunității de șabloane și resurse de contribuție:
  - [Galeria Awesome AZD](https://azure.github.io/awesome-azd/) - peste 200 de șabloane gata de implementare
  - [Trimite un Șablon](https://github.com/Azure/awesome-azd/issues) - contribuție comunitară
- **🎯 Ghid Rapid de Pornire**: Secțiune simplificată în 3 pași (Instalare → Autentificare → Implementare)
- **📊 Tabel Navigare pe baza experienței**: Ghid clar unde să începi în funcție de experiența dezvoltatorului

#### Schimbat
- **Structura README**: Reorganizată pentru dezvăluire progresivă - informațiile cheie primele
- **Secțiunea Introducere**: Rescrisă pentru a explica "Magia `azd up`" pentru începători compleți
- **Eliminat conținut duplicat**: Eliminată secțiunea duplicat de depanare
- **Comenzi pentru depanare**: Referința fixă `azd logs` pentru a utiliza `azd monitor --logs` valid

#### Fixate
- **🔐 Comenzi de autentificare**: Adăugate `azd auth login` și `azd auth logout` în cheat-sheet.md
- **Referințe invalide la comenzi**: Eliminat restul de `azd logs` din secțiunea de depanare din README

#### Note
- **Domeniu**: Modificări aplicate la README.md principal și resources/cheat-sheet.md
- **Public țintă**: Îmbunătățiri adresate în mod specific dezvoltatorilor noi la AZD

---

### [v3.10.0] - 2026-02-05

#### Actualizare Precizie Comenzi Azure Developer CLI
**Această versiune corectează comenzile AZD inexistente din întreaga documentație, asigurându-se că toate exemplele de cod folosesc sintaxa validă Azure Developer CLI.**

#### Fixate
- **🔧 Eliminare Comenzi AZD Inexistente**: Audit și corecție amplă a comenzilor invalide:
  - `azd logs` (nu există) → înlocuit cu `azd monitor --logs` sau alternative Azure CLI
  - Subcomenzi `azd service` (nu există) → înlocuite cu `azd show` și Azure CLI
  - `azd infra import/export/validate` (nu există) → eliminate sau înlocuite cu alternative valide
  - Flag-uri `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nu există) → eliminate
  - Flag-uri `azd provision --what-if/--rollback` (nu există) → actualizate pentru a folosi `--preview`
  - `azd config validate` (nu există) → înlocuit cu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nu există) → eliminate

- **📚 Fișiere Actualizate cu Corecții de Comenzi**:
  - `resources/cheat-sheet.md`: Revizuire majoră a referinței comenzilor
  - `docs/deployment/deployment-guide.md`: Corectat rollback și strategii de implementare
  - `docs/troubleshooting/debugging.md`: Corectate secțiuni de analiză a jurnalelor
  - `docs/troubleshooting/common-issues.md`: Actualizare comenzi de depanare
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectată secțiunea de depanare AZD
  - `docs/getting-started/azd-basics.md`: Corectate comenzile de monitorizare
  - `docs/getting-started/first-project.md`: Actualizate exemple de monitorizare și depanare
  - `docs/getting-started/installation.md`: Corectate exemplele de ajutor și versiune
  - `docs/pre-deployment/application-insights.md`: Corectate comenzile de vizualizare a jurnalelor
  - `docs/pre-deployment/coordination-patterns.md`: Corectate comenzile de depanare agent

- **📝 Referință Actualizată a Versiunii**: 
  - `docs/getting-started/installation.md`: Modificată versiunea hardcodată `1.5.0` în generică `1.x.x` cu link către release-uri

#### Modificate
- **Strategii de Rollback**: Documentația actualizată pentru a utiliza rollback bazat pe Git (AZD nu are rollback nativ)
- **Vizualizarea Jurnalelor**: Referințele `azd logs` înlocuite cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI
- **Secțiunea de Performanță**: Eliminat flag-uri inexistente pentru implementări paralele/incrementale, oferind alternative valide

#### Detalii Tehnice
- **Comenzi AZD Valide**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag-uri valide azd monitor**: `--live`, `--logs`, `--overview`
- **Funcționalități eliminate**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verificare**: Comenzile validate împotriva Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalizare Workshop și Actualizare Calitate Documentație
**Această versiune finalizează modulele interactive ale workshop-ului, rezolvă toate linkurile stricate din documentație și îmbunătățește calitatea generală a conținutului pentru dezvoltatorii AI care folosesc Microsoft AZD.**

#### Adăugat
- **📝 CONTRIBUTING.md**: Document nou cu ghiduri de contribuție cu:
  - Instrucțiuni clare pentru raportarea problemelor și propunerea modificărilor
  - Standardele documentației pentru conținut nou
  - Ghiduri pentru exemple de cod și convenții pentru mesajele commit-urilor
  - Informații privind implicarea comunității

#### Finalizat
- **🎯 Modul Workshop 7 (Încheiere)**: Modul de încheiere complet, cu:
  - Rezumat cuprinzător al realizărilor workshop-ului
  - Secțiune despre conceptele cheie stăpânite privind AZD, șabloane și Microsoft Foundry
  - Recomandări pentru continuarea călătoriei de învățare
  - Exerciții de provocare workshop cu evaluări de dificultate
  - Feedback de la comunitate și linkuri de suport

- **📚 Modul Workshop 3 (Deconstrucție)**: Obiective de învățare actualizate cu:
  - Ghid pentru activarea GitHub Copilot cu serverele MCP
  - Înțelegerea structurii dosarului șabloanelor AZD
  - Modele de organizare infrastructure-as-code (Bicep)
  - Instrucțiuni pentru laborator hands-on

- **🔧 Modul Workshop 6 (Dezinstalare)**: Finalizat cu:
  - Obiective pentru curățarea resurselor și managementul costurilor
  - Utilizarea `azd down` pentru dezprovisionare sigură a infrastructurii
  - Ghid pentru recuperarea serviciilor cognitive soft-delete
  - Prompter bonus pentru explorarea GitHub Copilot și Azure Portal

#### Fixate
- **🔗 Corecții Linkuri Stricate**: Rezolvate peste 15 linkuri interne stricate în documentație:
  - `docs/ai-foundry/ai-model-deployment.md`: Corectate căile către microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectate căile către ai-model-deployment.md și production-ai-practices.md
  - `docs/getting-started/first-project.md`: Înlocuit cicd-integration.md inexistent cu deployment-guide.md
  - `examples/retail-scenario.md`: Corectate căile pentru FAQ și ghid depanare
  - `examples/container-app/microservices/README.md`: Corectate căile pentru pagina principală curs și ghid de implementare
  - `resources/faq.md` și `resources/glossary.md`: Actualizate referințele capitolelor AI
  - `course-outline.md`: Corectate referințele la ghid instructor și laborator workshop AI

- **📅 Banner Stare Workshop**: Actualizat de la "În construcție" la stare activă de workshop cu data februarie 2026

- **🔗 Navigare Workshop**: Corectate linkurile de navigare rupte în README.md workshop care indicau către dosarul inexistent lab-1-azd-basics

#### Modificate
- **Prezentare Workshop**: Eliminat avertismentul de "în construcție", workshop-ul este acum complet și gata de utilizare
- **Consistență Navigare**: Asigurată navigarea corectă între toate modulele workshop-ului
- **Referințe Cale de Învățare**: Actualizate referințele intercapitolelor cu calea corectă microsoft-foundry

#### Validate
- ✅ Toate fișierele markdown în limba engleză au linkuri interne valide
- ✅ Modulele workshop 0-7 sunt complete cu obiective de învățare
- ✅ Navigarea între capitole și module funcționează corespunzător
- ✅ Conținutul este potrivit pentru dezvoltatorii AI care folosesc Microsoft AZD
- ✅ Limbaj și structură prietenoase pentru începători păstrate pe tot parcursul
- ✅ CONTRIBUTING.md oferă ghiduri clare pentru contributori din comunitate

#### Implementare Tehnică
- **Validare Linkuri**: Script PowerShell automatizat a verificat toate linkurile interne .md
- **Audit de Conținut**: Revizuire manuală a completitudinii workshop-ului și potrivirii pentru începători
- **Sistem de Navigare**: Aplicate modele consistente de navigare între capitole și module

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză
- **Traduceri**: Folderele de traduceri nu au fost actualizate în această versiune (sincronizarea automată va urma ulterior)
- **Durata Workshop**: Workshop-ul complet oferă acum 3-4 ore de învățare practică

---

### [v3.8.0] - 2025-11-19

#### Documentație avansată: Monitorizare, Securitate și Modele Multi-Agent
**Această versiune adaugă lecții cuprinzătoare de nivel A despre integrarea Application Insights, modele de autentificare și coordonarea multi-agent pentru implementări de producție.**

#### Adăugat
- **📊 Lecție de integrare Application Insights**: în `docs/pre-deployment/application-insights.md`:
  - Implementare axată pe AZD cu provisioning automat
  - Șabloane Bicep complete pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1.200 de linii)
  - Modele de monitorizare AI/LLM (urmărire token/economii Microsoft Foundry Models)
  - 6 diagrame Mermaid (arhitectură, tracing distribuit, flux telemetrie)
  - 3 exerciții practice (alertare, dashboard-uri, monitorizare AI)
  - Exemple de interogări Kusto și strategii de optimizare costuri
  - Streaming metrice live și depanare în timp real
  - 40-50 minute timp de învățare cu modele gata de producție

- **🔐 Lecție despre modele de autentificare & securitate**: în `docs/getting-started/authsecurity.md`:
  - 3 modele de autentificare (connection strings, Key Vault, identitate gestionată)
  - Șabloane complete Bicep pentru infrastructură securizată
  - Cod aplicație Node.js cu integrare Azure SDK
  - 3 exerciții complete (activare identitate gestionată, identitate atribuită utilizator, rotație Key Vault)
  - Cele mai bune practici de securitate și configurații RBAC
  - Ghid pentru depanare și analiză costuri
  - Modele de autentificare fără parolă pregătite pentru producție

- **🤖 Lecție despre modele de coordonare Multi-Agent**: în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (secvențial, paralel, ierarhic, bazat pe evenimente, consens)
  - Implementare completă a serviciului orchestrator (Python/Flask, peste 1.500 linii)
  - 3 implementări specializate de agenți (Cercetare, Scriitor, Editor)
  - Integrare Service Bus pentru cozi de mesaje
  - Management stare Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid arătând interacțiuni între agenți
  - 3 exerciții avansate (gestionare timeout, logică retry, circuit breaker)
  - Descompunere costuri ($240-565/lună) cu strategii de optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățit
- **Capitolul Pre-implementare**: Include acum modele cuprinzătoare de monitorizare și coordonare
- **Capitolul Început**: Îmbunătățit cu modele profesioniste de autentificare
- **Pregătire Producție**: Acoperire completă de la securitate la observabilitate
- **Structura cursului**: Actualizată pentru a face referire la noile lecții din Capitolele 3 și 6

#### Modificat
- **Progresul în învățare**: Integrare mai bună a securității și monitorizării pe tot parcursul cursului
- **Calitatea documentației**: Standardizări consistente de nivel A (95-97%) în noile lecții
- **Modele de producție**: Acoperire completă end-to-end pentru implementări enterprise

#### Îmbunătățit
- **Experiența dezvoltatorului**: Drum clar de la dezvoltare la monitorizarea producției
- **Standardele de securitate**: Modele profesionale pentru autentificare și managementul secretelor
- **Observabilitate**: Integrare completă Application Insights cu AZD
- **Workloads AI**: Monitorizare specializată pentru Microsoft Foundry Models și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile includ cod funcțional complet (nu doar fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 total în 3 lecții)
- ✅ Exerciții practice cu pași de verificare (9 total)
- ✅ Șabloane Bicep pregătite pentru producție implementabile prin `azd up`
- ✅ Analiză costuri și strategii de optimizare
- ✅ Ghiduri de depanare și bune practici
- ✅ Puncte de verificare a cunoștințelor cu comenzi de validare

#### Rezultate evaluare documentație
- **docs/pre-deployment/application-insights.md**: - Ghid complet de monitorizare
- **docs/getting-started/authsecurity.md**: - Modele profesionale de securitate
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent
- **Conținut nou general**: - Standardele înalte de calitate consistente

#### Implementare Tehnică
- **Application Insights**: Log Analytics + telemetrie personalizată + tracing distribuit
- **Autentificare**: Identitate gestionată + Key Vault + modele RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare**: Metrice live + interogări Kusto + alerte + dashboard-uri
- **Management costuri**: Strategii de sampling, politici de retenție, controale buget

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri Calitate Documentație și Nou Exemplu Microsoft Foundry Models
**Această versiune îmbunătățește calitatea documentației în întregul depozit și adaugă un exemplu complet de implementare Microsoft Foundry Models cu interfață chat gpt-4.1.**

#### Adăugat
- **🤖 Exemplu chat Microsoft Foundry Models**: Implementare completă gpt-4.1 cu aplicație funcțională în `examples/azure-openai-chat/`:
  - Infrastructură completă Microsoft Foundry Models (implementare model gpt-4.1)
  - Interfață chat Python în linia de comandă cu istoric conversații
  - Integrare Key Vault pentru stocare securizată a cheii API
  - Urmărire utilizare token și estimare costuri
  - Limitare rată și gestionare erori
  - README cuprinzător cu ghid de implementare de 35-45 minute
  - 11 fișiere gata de producție (șabloane Bicep, aplicație Python, configurație)
- **📚 Exerciții Documentație**: Adăugate exerciții practice ghidate în ghidul de configurare:
  - Exercițiul 1: Configurare multi-mediu (15 minute)
  - Exercițiul 2: Practică gestionare secrete (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare Implementare**: Adăugată secțiune de verificare în ghidul de implementare:
  - Proceduri de verificare a stării de sănătate
  - Checklist criterii de succes
  - Ieșiri așteptate pentru toate comenzile de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățit
- **examples/README.md**: Actualizat la calitate de nivel A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Actualizat numărul de exemple locale de la 3 la 4
  - Adăugat în tabelul Exemple Aplicații AI
  - Integrat în Ghidul de începere rapidă pentru utilizatori intermediari
  - Adăugat în secțiunea Microsoft Foundry Templates
  - Actualizat Matricea de Comparare și secțiunile de găsire tehnologică
- **Calitatea Documentației**: Îmbunătățită de la B+ (87%) → A- (92%) în folderul docs:
  - Adăugate rezultate așteptate pentru exemplele critice de comenzi
  - Incluse pași de verificare pentru modificările de configurare
  - Învățare practică îmbunătățită cu exerciții practice

#### Modificat
- **Progresul în Învățare**: Mai bună integrare a exemplelor AI pentru învățători intermediari
- **Structura Documentației**: Exerciții mai aplicabile cu rezultate clare
- **Procesul de Verificare**: Criterii explicite de succes adăugate în fluxuri cheie

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Implementarea Microsoft Foundry Models durează acum 35-45 minute (față de 60-90 pentru alternative complexe)
- **Transparența Costurilor**: Estimări clare de cost ($50-200/lună) pentru exemplul Microsoft Foundry Models
- **Calea de Învățare**: Dezvoltatorii AI au punct clar de intrare cu azure-openai-chat
- **Standardele Documentației**: Rezultate așteptate și pași de verificare consecvenți

#### Validat
- ✅ Exemplul Microsoft Foundry Models complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere de implementare sunt sintactic corecte
- ✅ Instrucțiunile README se potrivesc cu experiența reală de implementare
- ✅ Linkurile din documentație actualizate în 8+ locații
- ✅ Indexul exemplelor reflectă corect 4 exemple locale
- ✅ Fără linkuri externe duplicate în tabele
- ✅ Toate referințele de navigare sunt corecte

#### Implementare Tehnică
- **Arhitectura Microsoft Foundry Models**: model gpt-4.1 + Key Vault + Container Apps
- **Securitate**: Identitate Gestionată pregătită, secrete în Key Vault
- **Monitorizare**: integrare Application Insights
- **Gestionarea Costurilor**: Urmărirea token-urilor și optimizarea utilizării
- **Implementare**: O singură comandă `azd up` pentru configurare completă

### [v3.6.0] - 2025-11-19

#### Actualizare Majoră: Exemple de Implementare Container App
**Această versiune introduce exemple complete de implementare a aplicațiilor containerizate gata pentru producție folosind Azure Developer CLI (AZD), cu documentație completă și integrare în calea de învățare.**

#### Adăugat
- **🚀 Exemple Container App**: Exemple locale noi în `examples/container-app/`:
  - [Ghidul Master](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, pornire rapidă, producție și modele avansate
  - [API Flask Simplu](../../examples/container-app/simple-flask-api): API REST prietenos pentru începători cu scalare la zero, probe de sănătate, monitorizare și depanare
  - [Arhitectură Microservicii](../../examples/container-app/microservices): Implementare multi-serviciu gata pentru producție (API Gateway, Product, Order, User, Notification), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, urmărire distribuită, implementări blue-green/canary
- **Cele Mai Bune Practici**: Securitate, monitorizare, optimizarea costurilor și ghid CI/CD pentru sarcini containerizate
- **Exemple de Cod**: `azure.yaml` complet, șabloane Bicep și implementări de servicii în mai multe limbaje (Python, Node.js, C#, Go)
- **Testare și Depanare**: Scenarii de testare end-to-end, comenzi de monitorizare, ghid de depanare

#### Modificat
- **README.md**: Actualizat pentru a include și a lega noile exemple container app sub "Exemple Locale - Aplicații Container"
- **examples/README.md**: Actualizat pentru a evidenția exemple container app, a adăuga intrări în matricea de comparație și a actualiza referințe tehnologie/arhitectură
- **Structura Cursului & Ghidul de Studiu**: Actualizate pentru a face referire la noile exemple container app și modele de implementare în capitolele relevante

#### Validat
- ✅ Toate noile exemple sunt implementabile cu `azd up` și urmează cele mai bune practici
- ✅ Linkuri încrucișate și navigare în documentație actualizate
- ✅ Exemple acoperă scenarii de la începători la avansați, inclusiv microservicii de producție

#### Note
- **Domeniu**: Documentație și exemple doar în limba engleză
- **Pașii Următori**: Extindere cu modele avansate suplimentare de containere și automatizare CI/CD în versiunile viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding Produs: Microsoft Foundry
**Această versiune implementează o schimbare completă a numelui produsului din "Microsoft Foundry" în "Microsoft Foundry" în toată documentația în limba engleză, reflectând rebranding-ul oficial Microsoft.**

#### Modificat
- **🔄 Actualizare Nume Produs**: Rebranding complet de la "Microsoft Foundry" la "Microsoft Foundry"
  - Actualizare referințe în toate documentele în limba engleză din folderul `docs/`
  - Redenumire folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Redenumire fișier: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 de referințe de conținut actualizate în 7 fișiere de documentație

- **📁 Modificări Structură Folder**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele actualizate pentru reflectarea noii structuri de foldere
  - Linkuri de navigare validate în toată documentația

- **📄 Redenumiri Fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate linkurile interne actualizate pentru a face referire la noile nume de fișiere

#### Fișiere Actualizate
- **Documentația Capitolelor** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări de linkuri de navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 actualizări de referințe la numele produsului
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Folosește deja Microsoft Foundry (din update-urile anterioare)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 linkuri încrucișate actualizate
  - `docs/getting-started/first-project.md` - 2 linkuri de navigare capitol actualizate
  - `docs/getting-started/installation.md` - 2 legături pentru capitolul următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitatea Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navigare actualizat
  - `docs/troubleshooting/debugging.md` - 1 link de navigare actualizat

- **Fișiere Structură Curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentare curs, titluri capitole, secțiune șabloane, perspective comunitate)
  - `course-outline.md` - 14 referințe actualizate (prezentare, obiective de învățare, resurse capitol)

#### Validat
- ✅ Nici o referință rămasă la calea folderului "ai-foundry" în documentele în limba engleză
- ✅ Nici o referință rămasă la numele produsului "Microsoft Foundry" în documentele englezești
- ✅ Toate linkurile de navigare funcționează cu noua structură de foldere
- ✅ Redenumirile fișierelor și folderelor finalizate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Note
- **Domeniu**: Schimbările aplicate doar documentației în limba engleză din folderul `docs/`
- **Traduceri**: Folderele de traduceri (`translations/`) nu au fost actualizate în această versiune
- **Workshop**: Materialele workshop-ului (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele de exemple pot încă să conțină denumiri vechi (se va corecta într-un update viitor)
- **Linkuri Externe**: URL-urile externe și referințele către repository GitHub rămân neschimbate

#### Ghid de Migrare pentru Contribuitori
Dacă ai ramuri locale sau documentație care face referire la structura veche:
1. Actualizează referințele folderelor: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizează referințele fișierelor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiește numele produsului: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifică că toate linkurile interne din documentație funcționează în continuare

---

### [v3.4.0] - 2025-10-24

#### Îmbunătățiri Preview și Validare Infrastructură
**Această versiune introduce suport complet pentru noua funcționalitate de preview Azure Developer CLI și îmbunătățește experiența utilizatorului în workshop.**

#### Adăugat
- **🧪 Documentație Funcționalitate azd provision --preview**: Acoperire completă a noii capabilități de previzualizare a infrastructurii
  - Referință comandă și exemple de utilizare în fișa de trucuri
  - Integrare detaliată în ghidul de provisioning cu cazuri de utilizare și beneficii
  - Integrare verificare pre-zbor pentru validare mai sigură a implementării
  - Actualizări ghid de pornire cu practici de implementare sigure
- **🚧 Banner Stare Workshop**: Banner HTML profesional indicând starea de dezvoltare a workshop-ului
  - Design gradient cu indicatori de construcție pentru comunicare clară utilizatorilor
  - Marcaj cu data ultimei actualizări pentru transparență
  - Design responsive pentru toate tipurile de dispozitive mobile

#### Îmbunătățit
- **Siguranța Infrastructurii**: Funcționalitatea de preview integrată în toată documentația despre implementare
- **Validare Pre-Implementare**: Scripturi automate ce includ testare preview a infrastructurii
- **Flux de Lucru Dezvoltator**: Secvențe de comenzi actualizate pentru a include preview ca cea mai bună practică
- **Experiența Workshop**: Așteptări clare pentru utilizatori despre stadiul de dezvoltare al conținutului

#### Modificat
- **Cele Mai Bune Practici pentru Implementare**: Fluxul de lucru cu prioritate preview acum recomandarea principală
- **Flux Documentație**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentare Workshop**: Comunicare profesională a stării cu calendar clar de dezvoltare

#### Îmbunătățit
- **Abordare Siguranță mai întâi**: Modificările infrastrucurii pot fi validate înainte de implementare
- **Colaborare în Echipa**: Rezultatele preview pot fi partajate pentru revizuire și aprobare
- **Conștientizare Costuri**: Mai bună înțelegere a costurilor resurselor înainte de provisionare
- **Reducerea Riscurilor**: Eșecuri de implementare reduse prin validare în avans

#### Implementare Tehnică
- **Integrare Multidocument**: Funcționalitatea preview documentată în 4 fișiere cheie
- **Model de Comenzi**: Sintaxă și exemple consecvente în toată documentația
- **Integrare Cele Mai Bune Practici**: Preview inclus în fluxurile și scripturile de validare
- **Indicatori Vizuali**: Marcaje clare NOU pentru facilitarea descoperirii

#### Infrastructura Workshop
- **Comunicare Stare**: Banner HTML profesional cu stilizare gradient
- **Experiență Utilizator**: Stare clară de dezvoltare pentru a preveni confuzia
- **Prezentare Profesională**: Menține credibilitatea repository-ului oferind așteptări clare
- **Transparență Calendar**: Marcaj datei ultimei actualizări octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale Workshop Îmbunătățite și Experiență de Învățare Interactivă
**Această versiune introduce materiale de workshop complete cu ghiduri interactive bazate pe browser și căi de învățare structurate.**

#### Adăugat
- **🎥 Ghid Interactiv Workshop**: Experiență bazată pe browser cu capacitate preview MkDocs
- **📝 Instrucțiuni Workshop Structurate**: Cale de învățare ghidată în 7 pași de la descoperire la personalizare
  - 0-Introducere: Prezentare generală Workshop și configurare
  - 1-Select-AI-Template: Descoperirea și selecția șabloanelor
  - 2-Validate-AI-Template: Proceduri de implementare și validare
  - 3-Deconstruct-AI-Template: Înțelegerea arhitecturii șablonului
  - 4-Configure-AI-Template: Configurare și personalizare
  - 5-Customize-AI-Template: Modificări avansate și iterări
  - 6-Teardown-Infrastructure: Curățare și management resurse
  - 7-Concluzii: Rezumat și pași următori
- **🛠️ Instrumente Workshop**: Configurare MkDocs cu tema Material pentru experiență de învățare îmbunătățită
- **🎯 Cale de Învățare Hands-On**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare fluidă a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI Workshop**: Extins cu experiență de învățare structurat de 2-3 ore
- **Documentația Workshop**: Prezentare profesională cu navigare și suport vizual
- **Progresul Învățării**: Ghidare clară pas cu pas de la selecția șablonului la implementarea în producție
- **Experiența Dezvoltatorului**: Instrumente integrate pentru fluxuri de dezvoltare simplificate

#### Îmbunătățit
- **Accesibilitate**: Interfață bazată pe browser cu căutare, funcționalitate de copiere și comutator temă
- **Învățare în Ritm Propriu**: Structură flexibilă a workshop-ului pentru diverse viteze de învățare
- **Aplicație Practică**: Scenarii reale de implementare a șabloanelor AI
- **Integrare Comunitate**: Integrare Discord pentru suport și colaborare în workshop

#### Caracteristici Workshop
- **Căutare Încorporată**: Descoperire rapidă de cuvinte cheie și lecții
- **Copiere Blocuri Cod**: Funcționalitate de copiere la hover pentru toate exemplele de cod
- **Comutator Temă**: Suport mod întunecat/deschis pentru diferite preferințe
- **Resurse Vizuale**: Capturi de ecran și diagrame pentru înțelegere îmbunătățită
- **Integrare Ajutor**: Acces direct Discord pentru suport comunitate

### [v3.2.0] - 2025-09-17

#### Restructurare Majoră Navigare și Sistem de Învățare bazat pe Capitole
**Această versiune introduce o structură cuprinzătoare de învățare pe capitole și o navigare îmbunătățită în întregul repository.**

#### Adăugat
- **📚 Sistem de Învățare bazat pe Capitole**: Restructurarea întregului curs în 8 capitole de învățare progresive
  - Capitolul 1: Bazele & Pornire Rapidă (⭐ - 30-45 minute)
  - Capitolul 2: Dezvoltare AI-First (⭐⭐ - 1-2 ore)
  - Capitolul 3: Configurare & Autentificare (⭐⭐ - 45-60 minute)
  - Capitolul 4: Infrastructură ca și Cod & Implementare (⭐⭐⭐ - 1-1.5 ore)
  - Capitolul 5: Soluții AI Multi-Agent (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolul 6: Validare & Planificare Pre-Implementare (⭐⭐ - 1 oră)
  - Capitolul 7: Depanare & Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolul 8: Modele de Producție & Enterprise (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistem Navigationa Comprehensiv**: Header-e și footer-e de navigare consistente în toată documentația
- **🎯 Urmărirea Progresului**: Lista de verificare pentru finalizare curs și sistem de verificare a învățării
- **🗺️ Ghid de Căi de Învățare**: Puncte clare de intrare pentru diferite niveluri de experiență și obiective
- **🔗 Navigare cu Referințe Încrucișate**: Capitole legate și precondiții clar indicate

#### Îmbunătățit
- **Structura README**: Transformată într-o platformă structurată de învățare cu organizare pe capitole
- **Navigare Documentație**: Fiecare pagină include acum contextul capitolului și ghidare pentru progres
- **Organizare Șabloane**: Exemplele și șabloanele mapate către capitolele adecvate de învățare
- **Integrare Resurse**: Fișe de trucuri, întrebări frecvente și ghiduri de studiu conectate la capitole relevante
- **Integrare Workshop**: Laboratoare practice mapate pe mai multe obiective de învățare pe capitole

#### Modificat
- **Progresul în Învățare**: Mutat de la documentație liniară la învățare flexibilă pe bază de capitole
- **Locul Configurației**: Ghidul de configurare repoziționat ca Capitolul 3 pentru un flux de învățare mai bun
- **Integrarea Conținutului AI**: Integrare mai bună a conținutului specific AI pe parcursul procesului de învățare
- **Conținut de Producție**: Modele avansate consolidate în Capitolul 8 pentru cursanții enterprise

#### Îmbunătățit
- **Experiență Utilizator**: Breadcrumbs clare pentru navigare și indicatoare de progres în capitole
- **Accesibilitate**: Modele de navigare consistente pentru parcurgerea mai ușoară a cursului
- **Prezentare Profesională**: Structură de curs în stil universitar potrivită pentru formare academică și corporate
- **Eficiența Învățării**: Timp redus pentru găsirea conținutului relevant prin organizare îmbunătățită

#### Implementare Tehnică
- **Antete de Navigare**: Navigare standardizată pe capitole în peste 40 de fișiere de documentație
- **Navigare în Subsol**: Ghidsuri constante privind progresul și indicatoare de finalizare a capitolelor
- **Linkare Încrucișată**: Sistem de legături interne cuprinzător care conectează concepte conexe
- **Cartografiere Capitole**: Șabloane și exemple clar asociate cu obiectivele de învățare

#### Îmbunătățire Ghid de Studiu
- **📚 Obiective cuprinzătoare de învățare**: Ghid de studiu restructurat pentru sistemul cu 8 capitole
- **🎯 Evaluare pe bază de capitol**: Fiecare capitol include obiective de învățare specifice și exerciții practice
- **📋 Monitorizarea progresului**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare pentru finalizare
- **❓ Întrebări de evaluare**: Întrebări de validare a cunoștințelor pentru fiecare capitol cu rezultate profesionale
- **🛠️ Exerciții practice**: Activități practice cu scenarii reale de implementare și depanare
- **📊 Progresul abilităților**: Avans clar de la concepte de bază la modele enterprise cu focus pe dezvoltare carieră
- **🎓 Cadru de certificare**: Rezultate de dezvoltare profesională și sistem de recunoaștere comunitară
- **⏱️ Management timp**: Plan structurat de învățare pe 10 săptămâni cu validare pe etape

### [v3.1.0] - 2025-09-17

#### Soluții AI Multi-Agent Îmbunătățite
**Această versiune îmbunătățește soluția multi-agent pentru retail cu denumiri mai clare ale agenților și documentație îmbunătățită.**

#### Schimbat
- **Terminologie Multi-Agent**: Înlocuit "agent Cora" cu "agent Client" în toată soluția multi-agent retail pentru o înțelegere mai clară
- **Arhitectură Agent**: Actualizate toate documentațiile, șabloanele ARM și exemplele de cod pentru a folosi denumirea consecventă "agent Client"
- **Exemple de Configurație**: Modernizate modelele de configurare a agentului cu convenții actualizate de denumire
- **Consistența Documentației**: Asigurate toate referințele folosesc nume profesionale și descriptive pentru agenți

#### Îmbunătățit
- **Pachet Șabloane ARM**: Actualizat retail-multiagent-arm-template cu referințe la agent Client
- **Diagrama Arhitecturii**: Reîmprospătate diagramele Mermaid cu denumiri actualizate ale agenților
- **Exemple Cod**: Clase Python și exemple de implementare folosesc acum denumirea CustomerAgent
- **Variabile de Mediu**: Actualizate toate scripturile de implementare pentru a folosi convențiile CUSTOMER_AGENT_NAME

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Roluri și responsabilități ale agenților mai clare în documentație
- **Pregătire pentru Producție**: Aliniere mai bună la convențiile de denumire enterprise
- **Materiale de Învățare**: Denumiri de agenți mai intuitive pentru scopuri educaționale
- **Utilizabilitatea Șabloanelor**: Înțelegere simplificată a funcțiilor agenților și modelelor de implementare

#### Detalii Tehnice
- Diagramele arhitecturii Mermaid actualizate cu referințe CustomerAgent
- Înlocuite numele de clasă CoraAgent cu CustomerAgent în exemplele Python
- Modificate configurațiile JSON ale șabloanelor ARM pentru a folosi tipul de agent "customer"
- Actualizate variabilele de mediu de la CORA_AGENT_* la patternurile CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurațiile containerelor

### [v3.0.0] - 2025-09-12

#### Schimbări majore - Focus pe Dezvoltatori AI și Integrare Microsoft Foundry
**Această versiune transformă depozitul într-o resursă completă pentru învățarea AI, integrată cu Microsoft Foundry.**

#### Adăugat
- **🤖 Traseu de învățare AI-First**: Restructurare completă prioritizând dezvoltatorii și inginerii AI
- **Ghid integrare Microsoft Foundry**: Documentație cuprinzătoare pentru conectarea AZD la serviciile Microsoft Foundry
- **Modele de implementare AI**: Ghid detaliat pentru selecția modelului, configurare și strategii de implementare în producție
- **Laborator Workshop AI**: Atelier practic de 2-3 ore pentru convertirea aplicațiilor AI în soluții deployabile cu AZD
- **Best Practices producție AI**: Modele pregătite pentru enterprise pentru scalare, monitorizare și securizare AI
- **Ghid specific depanare AI**: Depanare cuprinzătoare pentru Microsoft Foundry Models, Cognitive Services și probleme de implementare AI
- **Galerie Șabloane AI**: Colecție recomandată de șabloane Microsoft Foundry cu evaluări de complexitate
- **Materiale workshop**: Structură completă de atelier cu laboratoare practice și materiale de referință

#### Îmbunătățit
- **Structura README**: Focalizare pe dezvoltator AI cu date de interes comunitar de 45% de pe Discord Microsoft Foundry
- **Trasee de învățare**: Parcurs dedicat dezvoltatorilor AI alături de trasee tradiționale pentru studenți și ingineri DevOps
- **Recomandări șabloane**: Șabloane AI recomandate incluzând azure-search-openai-demo, contoso-chat și openai-chat-app-quickstart
- **Integrare Comunitate**: Suport comunitar Discord îmbunătățit cu canale și discuții specifice AI

#### Securitate & Focus Producție
- **Modele Identitate Gestionată**: Configurări specifice autentificării și securității AI
- **Optimizare Costuri**: Monitorizare utilizare tokeni și control buget pentru sarcini AI
- **Implementare Multi-Regiune**: Strategii pentru implementarea globală a aplicațiilor AI
- **Monitorizare Performanță**: Metrice specifice AI și integrare Application Insights

#### Calitatea Documentației
- **Structură liniară curs**: Progresie logică de la modele AI pentru începători la avansați
- **URL-uri validate**: Toate legăturile externe către repository verificate și accesibile
- **Referințe complete**: Toate legăturile interne validate și funcționale
- **Pregătit pentru producție**: Modele enterprise de implementare cu exemple reale

### [v2.0.0] - 2025-09-09

#### Schimbări majore - Restructurare depozit și Îmbunătățire profesională
**Această versiune reprezintă o revizuire semnificativă a structurii depozitului și a modului de prezentare a conținutului.**

#### Adăugat
- **Cadru Structurat de Învățare**: Toate paginile documentației includ secțiuni de Introducere, Obiective de Învățare și Rezultate Învațare
- **Sistem de Navigare**: Adăugate linkuri Pagina Anterioară/Următoare pe tot parcursul documentației pentru progres ghidat
- **Ghid de Studiu**: study-guide.md cuprinzător cu obiective de învățare, exerciții practice și materiale de evaluare
- **Prezentare Profesională**: Eliminat toate iconițele emoji pentru accesibilitate și aspect profesional îmbunătățit
- **Structură de Conținut Îmbunătățită**: Organizare și flux îmbunătățit al materialelor de învățare

#### Schimbat
- **Format Documentație**: Standardizată toată documentația cu structură consecventă orientată spre învățare
- **Flux Navigare**: Implementată progresie logică prin toate materialele de învățare
- **Prezentare Conținut**: Eliminat elemente decorative în favoarea unui format clar și profesional
- **Structura Linkurilor**: Actualizate toate legăturile interne pentru a susține noul sistem de navigare

#### Îmbunătățit
- **Accesibilitate**: Eliminat dependența de emoji pentru o compatibilitate mai bună cu cititoarele de ecran
- **Aspect Profesional**: Prezentare clară, academică, potrivită pentru învățare enterprise
- **Experiență de Învățare**: Abordare structurată cu obiective și rezultate clare pentru fiecare lecție
- **Organizare Conținut**: Flux logic mai bun și conexiuni între subiecte conexe

### [v1.0.0] - 2025-09-09

#### Lansare Inițială - Depozit Comprehensiv de Învățare AZD

#### Adăugat
- **Structura de bază a documentației**
  - Serii complete de ghiduri pentru început
  - Documentație comprehensivă pentru implementare și provisioning
  - Resurse detaliate pentru depanare și ghiduri de debugging
  - Instrumente și proceduri de validare pre-implementare

- **Modul Începător**
  - Bazele AZD: concepte cheie și terminologie
  - Ghid de Instalare: instrucțiuni specifice platformei
  - Ghid de Configurare: setarea mediului și autentificare
  - Tutorial Proiect Inițial: învățare practică pas-cu-pas

- **Modul Implementare și Provisioning**
  - Ghid Implementare: documentație completă a fluxului de lucru
  - Ghid Provisioning: Infrastructure as Code cu Bicep
  - Cele mai bune practici pentru implementări în producție
  - Modele arhitectură multi-serviciu

- **Modul Validare Pre-implementare**
  - Planificare Capacitate: validarea disponibilității resurselor Azure
  - Selecție SKU: ghid complet pentru niveluri de serviciu
  - Verificări Pre-zbor: scripturi automate de validare (PowerShell și Bash)
  - Instrumente de estimare costuri și planificare bugetară

- **Modul Depanare**
  - Probleme Comune: probleme frecvent întâlnite și soluții
  - Ghid Debugging: metodologii sistematice de depanare
  - Tehnici și instrumente avansate de diagnosticare
  - Monitorizarea și optimizarea performanței

- **Resurse și Referințe**
  - Foi de comandă: referință rapidă pentru comenzi esențiale
  - Glosar: definiții complete de termeni și acronime
  - FAQ: răspunsuri detaliate la întrebări frecvente
  - Legături către resurse externe și comunități

- **Exemple și Șabloane**
  - Exemplu aplicație web simplă
  - Șablon pentru implementare site static
  - Configurare aplicație containerizată
  - Modele de integrare bază de date
  - Exemple arhitectură microservicii
  - Implementări funcții serverless

#### Caracteristici
- **Suport Multi-Platformă**: Ghiduri de instalare și configurare pentru Windows, macOS și Linux
- **Niveluri Multiple de Competență**: Conținut destinat studenților și dezvoltatorilor profesioniști
- **Focus Practic**: Exemple practice și scenarii din viața reală
- **Acoperire Comprehensivă**: De la concepte de bază la modele avansate enterprise
- **Abordare Security-First**: Best practices de securitate integrate pe tot parcursul
- **Optimizare Costuri**: Ghid pentru implementări eficiente și management resurse

#### Calitatea Documentației
- **Exemple de Cod Detaliate**: Mostre de cod practice și testate
- **Instrucțiuni Pas-cu-Pas**: Ghid clar și aplicabil
- **Gestionare Completă a Erorilor**: Depanare pentru probleme comune
- **Integrare Best Practices**: Standardele și recomandările din industrie
- **Compatibilitate versiuni**: Actualizat cu cele mai noi servicii Azure și funcționalități azd

## Îmbunătățiri Planificate Viitoare

### Versiunea 3.1.0 (Planificată)
#### Extinderea Platformei AI
- **Suport Multi-Model**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele custom
- **Framework-uri pentru Agenți AI**: Șabloane pentru implementări LangChain, Semantic Kernel și AutoGen
- **Modele Avansate RAG**: Opțiuni de baze de date vectoriale dincolo de Azure AI Search (Pinecone, Weaviate etc.)
- **Observabilitate AI**: Monitorizare îmbunătățită a performanței modelului, utilizare tokeni și calitatea răspunsurilor

#### Experiența Dezvoltatorului
- **Extensie VS Code**: Experiență de dezvoltare integrată AZD + Microsoft Foundry
- **Integrare GitHub Copilot**: Generare șabloane AZD asistată AI
- **Tutoriale Interactive**: Exerciții practice de codare cu validare automată pentru scenarii AI
- **Conținut Video**: Tutoriale video suplimentare pentru învățători vizuali, axate pe implementări AI

### Versiunea 4.0.0 (Planificată)
#### Modele Enterprise AI
- **Cadru de Guvernanță**: Guvernanța modelelor AI, conformitate și jurnale de audit
- **AI Multi-Tenant**: Modele pentru servirea mai multor clienți cu servicii AI izolate
- **Implementare AI la margine**: Integrare cu Azure IoT Edge și instanțe container
- **AI Cloud Hibrid**: Modele de implementare multi-cloud și hibride pentru sarcini AI

#### Caracteristici Avansate
- **Automatizare Pipeline AI**: Integrare MLOps cu pipeline-uri Azure Machine Learning
- **Securitate Avansată**: Modele zero-trust, endpointuri private și protecție avansată împotriva amenințărilor
- **Optimizare Performanță**: Strategii avansate de reglare și scalare pentru aplicații AI cu trafic mare
- **Distribuție Globală**: Modele de livrare conținut și caching la margine pentru aplicații AI

### Versiunea 3.0.0 (Planificată) - Înlocuită de Lansarea Curentă
#### Adăugări Propuse - Acum Implementate în v3.0.0
- ✅ **Conținut axat AI**: Integrare cuprinzătoare Microsoft Foundry (Finalizat)
- ✅ **Tutoriale Interactive**: Atelier practic AI (Finalizat)
- ✅ **Modul securitate avansată**: Modele specifice securității AI (Finalizat)
- ✅ **Optimizare Performanță**: Strategii de tuning pentru sarcini AI (Finalizat)

### Versiunea 2.1.0 (Planificată) - Parțial Implementată în v3.0.0
#### Îmbunătățiri minore - Unele Finalizate în Lansarea Curentă
- ✅ **Exemple suplimentare**: Scenarii de implementare axate pe AI (Finalizat)
- ✅ **FAQ extins**: Întrebări și depanare AI specifice (Finalizat)
- **Integrare instrumente**: Ghiduri îmbunătățite pentru IDE și editor
- ✅ **Extindere monitorizare**: Modele de monitorizare și alertare AI (Finalizat)

#### Încă planificat pentru lansări viitoare
- **Documentație prietenoasă mobil**: Design responsive pentru învățare mobilă
- **Acces offline**: Pachete de documentație descărcabile
- **Integrare IDE îmbunătățită**: Extensie VS Code pentru fluxuri de lucru AZD + AI
- **Dashboard comunitar**: Metrici comunitari în timp real și urmărire contribuții

## Contribuții la jurnalul modificărilor

### Raportarea modificărilor
Când contribuiți la acest depozit, vă rugăm să vă asigurați că intrările din jurnalul modificărilor includ:

1. **Numărul versiunii**: Urmând versiunea semantică (major.minor.patch)
2. **Data**: Data lansării sau actualizării în format YYYY-MM-DD
3. **Categoria**: Adăugat, Modificat, Depreciat, Eliminat, Remediat, Securitate
4. **Descriere clară**: Descriere concisă a modificărilor efectuate
5. **Evaluarea impactului**: Cum afectează modificările utilizatorii existenți

### Categorii de modificări

#### Adăugat
- Funcționalități noi, secțiuni de documentație sau capabilități
- Exemple noi, șabloane sau resurse de învățare
- Instrumente suplimentare, scripturi sau utilitare

#### Modificat
- Modificări în funcționalitatea sau documentația existentă
- Actualizări pentru claritate sau acuratețe
- Restructurarea conținutului sau a organizării

#### Depreciat
- Funcționalități sau abordări care urmează să fie eliminate treptat
- Secțiuni de documentație programate pentru eliminare
- Metode pentru care există alternative mai bune

#### Eliminat
- Funcționalități, documentație sau exemple care nu mai sunt relevante
- Informații depășite sau abordări depreciate
- Conținut redundant sau consolidat

#### Remediat
- Corecturi pentru erori în documentație sau cod
- Rezolvarea problemelor sau defecțiunilor raportate
- Îmbunătățiri de acuratețe sau funcționalitate

#### Securitate
- Îmbunătățiri sau corecții legate de securitate
- Actualizări ale celor mai bune practici de securitate
- Rezolvarea vulnerabilităților de securitate

### Ghiduri pentru versionarea semantică

#### Versiune Majoră (X.0.0)
- Modificări majore care necesită acțiune din partea utilizatorului
- Restructurare semnificativă a conținutului sau organizării
- Modificări care schimbă abordarea sau metodologia fundamentală

#### Versiune Minoră (X.Y.0)
- Funcționalități noi sau adăugiri de conținut
- Îmbunătățiri care mențin compatibilitatea retroactivă
- Exemple, unelte sau resurse suplimentare

#### Versiune Patch (X.Y.Z)
- Corecturi de erori și remedieri
- Îmbunătățiri minore ale conținutului existent
- Clarificări și îmbunătățiri mici

## Feedback și Sugestii din Partea Comunității

Încurajăm activ feedback-ul din partea comunității pentru a îmbunătăți această resursă de învățare:

### Cum să Oferi Feedback
- **GitHub Issues**: Raportați probleme sau sugerați îmbunătățiri (problemele specifice AI sunt binevenite)
- **Discuții Discord**: Împărtășiți idei și interacționați cu comunitatea Microsoft Foundry
- **Pull Requests**: Contribuiți cu îmbunătățiri directe la conținut, mai ales șabloane și ghiduri AI
- **Microsoft Foundry Discord**: Participați în canalul #Azure pentru discuții AZD + AI
- **Forumuri Comunitare**: Participați în discuții mai largi pentru dezvoltatorii Azure

### Categorii de Feedback
- **Acuratețea Conținutului AI**: Corecturi privind integrarea și implementarea serviciilor AI
- **Experiența de Învățare**: Sugestii pentru un flux de învățare mai bun pentru dezvoltatorii AI
- **Conținut AI Lipsă**: Cereri pentru șabloane, modele sau exemple AI suplimentare
- **Accesibilitate**: Îmbunătățiri pentru nevoi diverse de învățare
- **Integrarea Uneltelor AI**: Sugestii pentru o integrare mai bună în fluxul de lucru de dezvoltare AI
- **Modele de Producție AI**: Cereri pentru modelele de implementare enterprise AI

### Angajamentul de Răspuns
- **Răspuns la Probleme**: În maxim 48 de ore pentru problemele raportate
- **Cereri de Funcționalități**: Evaluare în termen de o săptămână
- **Contribuții Comunitare**: Revizuire în termen de o săptămână
- **Probleme de Securitate**: Prioritate imediată cu răspuns accelerat

## Program de Întreținere

### Actualizări Regulate
- **Revizuiri Lunare**: Precizia conținutului și validarea linkurilor
- **Actualizări Trimestriale**: Adăugări și îmbunătățiri majore ale conținutului
- **Revizuiri Semestriale**: Restructurare și îmbunătățiri cuprinzătoare
- **Lansări Anuale**: Actualizări majore de versiune cu îmbunătățiri semnificative

### Monitorizare și Asigurare a Calității
- **Testare Automatizată**: Validare regulată a exemplului de cod și a linkurilor
- **Integrarea Feedback-ului Comunității**: Incorporare regulată a sugestiilor utilizatorilor
- **Actualizări Tehnologice**: Aliniere la cele mai noi servicii Azure și lansări azd
- **Audite de Accesibilitate**: Revizuiri regulate pentru principii de design incluziv

## Politica de Suport pentru Versiuni

### Suport pentru Versiuni Curente
- **Ultima Versiune Majoră**: Suport complet cu actualizări regulate
- **Versiunea Majoră Anterioară**: Actualizări de securitate și remedieri critice timp de 12 luni
- **Versiuni Legacy**: Suport comunitar doar, fără actualizări oficiale

### Ghid de Migrare
Când sunt lansate versiuni majore, oferim:
- **Ghiduri de Migrare**: Instrucțiuni pas cu pas pentru tranziție
- **Note de Compatibilitate**: Detalii despre modificările majore
- **Suport pentru Unelte**: Scripturi sau utilitare care ajută la migrare
- **Suport Comunitar**: Forumuri dedicate pentru întrebări despre migrare

---

**Navigare**
- **Lecția Anterioară**: [Ghid de Studiu](resources/study-guide.md)
- **Lecția Următoare**: Revenire la [README Principal](README.md)

**Rămâi la Curent**: Urmărește acest depozit pentru notificări despre lansări noi și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
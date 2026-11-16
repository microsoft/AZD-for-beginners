# Jurnal de modificări - AZD pentru Începători

## Introducere

Acest jurnal de modificări documentează toate schimbările notabile, actualizările și îmbunătățirile din depozitul AZD pentru Începători. Urmăm principiile versionării semantice și menținem acest jurnal pentru a ajuta utilizatorii să înțeleagă ce s-a schimbat între versiuni.

## Obiective de învățare

Revizuind acest jurnal de modificări, veți:
- Rămâne informat despre noi funcționalități și adaosuri de conținut
- Înțelege îmbunătățirile aduse documentației existente
- Urmări corecturile erorilor pentru a asigura acuratețea
- Urmări evoluția materialelor de învățare în timp

## Rezultate de învățare

După ce veți revizui înregistrările din jurnal, veți putea:
- Identifica conținutul și resursele noi disponibile pentru învățare
- Înțelege care secțiuni au fost actualizate sau îmbunătățite
- Planifica parcursul de învățare pe baza materialelor cele mai actuale
- Contribui cu feedback și sugestii pentru îmbunătățiri viitoare

## Istoricul Versiunilor

### [v3.24.0]- 2026-11-04

#### Corectat
- Reparat navigarea cursului în engleză, căile de pagini mutate, ancore lipsă și referințe externe învechite, inclusiv linkul din Capitolul 2 către ghidul AI de producție.
- Revizuit ghidul curent comparativ cu versiunea publicată AZD 1.37.2, agenții 1.0.0-beta.23, și evaluările 1.0.0-beta.2. Documentat fluxul de lucru separat `azd ai eval` și migrarea configurației de optimizare.
- Corectat flag-uri CLI neacceptate, limite de autentificare, ghiduri privind mediile/secretul în text simplu, actualizări de infrastructură, configurare de model și exemple de recuperare distructivă.
- Actualizat atelierul pe baza exemplului actual de AI Agents, incluzând hook-uri reale, intrări de configurare, teste de evaluare, puncte de acces pentru red-teaming și observabilitate.
- Corectat afirmațiile din implementările exemplu și reparat problemele asociate la nivel de aplicație/infrastructură/configurare. Materialul privind arhitectura retail este explicit distins de o aplicație complet funcțională.
- Restaurat matricea de limbaje CodeQL, selectat suportul pentru Node.js 24 pentru containerul de dezvoltare, și făcut verificatorii de configurare să raporteze comenzile de versiune eșuate.

#### Adăugat
- Un verificator de link-uri/ancore offline doar în engleză, teste de regresie, și un flux de lucru de documentație care construiește și atelierul în mod strict. Traducrile generate și imaginile traduse sunt excluse.

#### Domeniul validării
- Verificările sursă, sintaxă, configurație, comportament local și linkuri de rețea nu stabilesc posibilitatea implementării live pe Azure, cote, RBAC, disponibilitatea modelelor regionale, facturare, conformitate de securitate sau pregătirea pentru producție.
- Înregistrările mai vechi de mai jos sunt evidențe istorice, nu instrucțiuni curente de comandă sau lansare.

### [v3.23.0] - 2026-07-13

#### Actualizare de curs AZD 1.27.1: Actualizare versiune
**Această versiune revalidează cursul pe baza `azd` `1.27.1` (iulie 2026, ultima versiune stabilă) și extensia curentă în previzualizare a agentului AI `azure.ai.agents` `1.0.0-beta.5`, aducând la zi bannerele „validat împotriva” după lansările 1.26.0, 1.27.0 și 1.27.1.**

#### Schimbat
- **✅ Baza de validare actualizată** de la `azd 1.25.6` (iunie 2026) la `azd 1.27.1` (iulie 2026) în README-ul principal, în toate README-urile capitolelor, în lecția containerului de dezvoltare din Capitolul 1 (inclusiv exemple cu versiuni fixate), lecția șabloanelor personalizate din Capitolul 4, lecția cu mai mulți agenți din Capitolul 5 și documentația atelierului
- **🤖 Baseline-ul Capitolului 2 actualizat** de la `azd 1.23.12` (martie 2026) la `azd 1.27.1` în `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` și `microsoft-foundry-integration.md`; datele notelor de validare actualizate la 2026-07-13
- **🧩 Extensia agentului AI actualizată** de la `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` la versiunea curentă `1.0.0-beta.5` în README-ul Capitolului 2 și in `agents.md`
- **🧪 Exemplul de validare a atelierului** (ieșire `azd version`) actualizat la `1.27.1`

#### Notițe privind lansările relevante azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suport Go pentru Azure Functions în Flex Consumption, filtre de abonamente `azd config sub-filter` pe tenant, pachete extinse individuale (`azd x pack --bundle`), și `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelare pentru proiectele/agenții Azure AI Foundry direct în `azure.yaml` (inițializare fără Bicep/Terraform), suport pentru deploy containers în App Service (`host: appservice` + `language: docker`), `-s/--source` direct pentru comenzile `azd extension`, și `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` pentru `azd extension install`, modelele învechite excluse implicit din catalog/solicitările de cotă, și câteva corecții de erori

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

#### Completare pentru începători #2: Crearea șabloanelor, containere de dezvoltare, Pulumi, Azure DevOps, Principali de serviciu și altele
**Această versiune închide lacunele intermediare rămase evidențiate de analiza acoperirii azd: cum să creezi și publici propriul șablon, medii reproducibile cu containere de dezvoltare/Codespaces, furnizorul de infrastructură Pulumi, un ghid detaliat pentru Azure DevOps CI/CD, autentificarea cu principal de serviciu, ghid pentru selecția gazdelor (AKS / Spring Apps), explicații `azd restore`/`azd package`, tratarea erorilor în hook-uri, și practici de echipă/medii partajate.**

#### Adăugat
- **🧱 Lecție nouă în Capitolul 4** `docs/chapter-04-infrastructure/custom-templates.md` — crearea propriului șablon azd: structura necesară (`azure.yaml`, `infra/`, `src/`), câmpul `metadata.template`, parametrizarea infrastructurii cu token-ul resursei `uniqueString()` și eticheta `azd-env-name`, testare locală cu `azd init --template <local-path>`, publicare pe GitHub și trimitere în galeria Awesome AZD
- **📦 Lecție nouă în Capitolul 1** `docs/chapter-01-foundation/dev-containers.md` — medii reproducibile azd cu containere de dezvoltare și GitHub Codespaces: un `.devcontainer/devcontainer.json` minimal folosind funcția oficială `ghcr.io/azure/azure-dev/azd`, caracteristici specifice limbajului, `docker-in-docker` pentru gazdele containerelor și `azd auth login --use-device-code` pentru autentificare la distanță
- **🧩 Secțiunea Pulumi cu azd** în `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, structura folderului Pulumi, stivele mapate pe medii azd, ieșiri/etichetări necesare și fluxul de lucru identic `azd up` / `azd down`
- **🎯 Ghid pentru selecția gazdelor** în `docs/chapter-04-infrastructure/provisioning.md` — o comparație prietenoasă pentru începători între `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` și `springapp`, cu indicații când să alegi AKS sau Azure Spring Apps
- **🛠️ Ghid pas cu pas Azure DevOps CI/CD** în `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexiune de serviciu cu federație de identitate pentru sarcină de lucru (OIDC), `azure-dev.yml` generat, și configurarea grupurilor de variabile
- **🔑 Principali de servicii (Pattern 4)** adăugați în `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, autentificare non-interactivă `azd auth login` cu secret client vs acreditări federate/OIDC, când să folosești și stocare sigură a acreditărilor
- **🪝 Tratamente erori în hook-uri** subsecțiune în `docs/chapter-04-infrastructure/deployment-guide.md` — coduri de ieșire și `set -e`, `continueOnError`, testarea hook-urilor izolate cu `azd hooks run`, shell-uri specifice OS, și `--debug`
- **👥 Medii de echipă/partajate** secțiunea în `docs/chapter-03-configuration/configuration.md` — ce se păstrează în `.azure/`, ce trebuie ignorat în git, medii per-dezvoltator, `azd env list`/`select`, și furnizarea valorilor de mediu în CI/CD
- **🧰 Explicații `azd restore` și extinse pentru `azd package`** în `resources/cheat-sheet.md` — restaurarea dependențelor și construire a unui artefact de implementat fără a implementa efectiv

#### Schimbat
- **🧭 Tabelul lecțiilor din Capitolul 4** actualizat pentru a include noua lecție „Crearea propriei șabloane” (Lecția 3)
- **🧭 Tabelul lecțiilor din Capitolul 1** actualizat pentru a include noua lecție „Containere de dezvoltare & Codespaces” (Lecția 5); navigare footere legate între `bring-your-own-app.md` și `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Completare pentru începători: Lecție practică Multi-Agent, „Adu-ți propria aplicație,” Terraform și ghid CI/CD
**Această versiune închide cele mai mari lacune pentru un ghid complet pentru începători prin adăugarea a două lecții practice noi (un ghid cu doi agenți complet implementabil și adăugarea azd în aplicația existentă), o introducere accesibilă în hook-uri, o secțiune Terraform cu azd, un ghid pas cu pas GitHub Actions, un explicator pentru noile extensii în previzualizare și o listă explicită de verificare pentru confirmarea implementării.**

#### Adăugat
- **🤝 Lecție nouă în Capitolul 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un ghid complet practică multi-agent cu doi agenți (orchestrator + specialiști) folosind un șablon real (`contoso-creative-writer`), acoperind când să folosești multi-agent, fluxul de lucru `azd up`, înțelegerea resurselor implementate, trasabilitate între agenți, personalizare și curățare
- **📦 Lecție nouă în Capitolul 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cum să adaugi azd la un proiect existent cu `azd init` („folosește codul din directorul curent”), înțelegerea `azure.yaml` și `infra/`, `azd infra generate`, detectarea gazdei și implementarea cu `azd up`
- **🌐 Secțiunea Terraform cu azd** adăugată în `docs/chapter-04-infrastructure/provisioning.md` — configurație `infra.provider: terraform`, structură folder Terraform `.tf`, ieșiri obligatorii `AZURE_*` și etichetare `azd-env-name`, și fluxul de lucru identic `azd up` / `azd down` (închide lacuna unde suportul Terraform era menționat, dar se arăta doar Bicep)
- **⚙️ Ghid pas cu pas GitHub Actions** în `docs/chapter-08-production/production-ai-practices.md` — de la repo GitHub până la deploy-uri automate: `azd pipeline config`, credențiale federate OIDC (fără secrete stocate), `azure-dev.yml` generat și ghid pentru secrete vs variabile
- **🪝 Introducere pentru începători „De unde începi cu hook-urile?”** în `docs/chapter-04-infrastructure/deployment-guide.md` — ce este un hook, tabelul etapelor de hook, un hook minim de început, și rularea hook-urilor manual cu `azd hooks run`
- **✅ Listă de verificare „Verifică implementarea”** adăugată la Pasul 5 din `docs/chapter-01-foundation/first-project.md` — test de fum, verificare endpoint de sănătate și criterii de succes explicite
- **🧩 Explicator pentru noile extensii în previzualizare** `azure.ai.skills` și `azure.ai.connections` (ce sunt și când să le folosești) în `docs/chapter-08-production/production-ai-practices.md`

#### Schimbat
- **🧭 Tabelul lecțiilor din Capitolul 5** corectat: `multi-agent-basics.md` este acum Lecția 1 (singura lecție complet practică), cu etichetare clară că Lecția 2 este în Capitolul 6 și scenariul Retail este un plan de arhitectură, nu un șablon de o singură comandă
- **🧭 Tabelul lecțiilor din Capitolul 1** include acum noua lecție „Adu-ți propria aplicație” (Lecția 4)
- **🔗 Navigare în footers** actualizată: `first-project.md` face acum legătura înainte spre `bring-your-own-app.md`

#### Corectat
- **🧱 Închisă lacuna Terraform „menționată dar lipsă”** — cursul anterior menționa suportul Terraform fără a-l arăta efectiv
- **🔀 Corectate linkuri înșelătoare din Capitolul 5** care sugerau că există o implementare completă multi-agent când de fapt era doar un plan de arhitectură

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
**Această versiune revalidează cursul față de `azd` `1.25.6` (iunie 2026) și extensia `azure.ai.agents` `0.1.40-preview`, extinde ghidarea AI de la „crearea unui agent” la ciclul complet de viață al agentului (testare → evaluare → optimizare → inspectare → ștergere), prezintă noile extensii de previzualizare `azure.ai.skills` și `azure.ai.connections`, și notează rebrandingul produsului ".NET Aspire" → "Aspire".**

#### Adăugat
- **🔁 Acoperire completă a ciclului de viață al agentului** pentru începători și ingineri AI în întreaga documentație:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabel ciclu de viață (creare → testare → măsurare → îmbunătățire → inspectare → curățare) adăugat la secțiunea Extensii și Comenzi AI
  - `docs/chapter-08-production/production-ai-practices.md` — Noua secțiune „Gestionarea ciclului de viață al agentului” acoperind `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, și `delete --force`
  - `resources/cheat-sheet.md` — Comenzile AI extinse pentru agent cu `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, și `delete --force`
- **🧩 Noi extensii de previzualizare** documentate: `azure.ai.skills` (abilități reutilizabile ale agentului) și `azure.ai.connections` (conexiuni Foundry) adăugate în tabelul de extensii și în fișa de referință
- **⏱️ Ghidare privind timpii de răspuns** — exemplele `azd ai agent invoke` arată acum că se afișează latența totală și timpul până la primul octet
- **📌 Banner de versiune** în README-ul principal care indică cursanților `azd version` și `azd upgrade`

#### Modificat
- **✅ Linie de bază de validare actualizată** de la `azd 1.23.12` (martie 2026) la `azd 1.25.6` (iunie 2026) în toate README-urile capitolelor și documentația atelierului
- **🤖 Nota de extensie pentru Capitolul 2** actualizată de la `azure.ai.agents` `0.1.18-preview` la `0.1.40-preview`
- **🧪 Exemplu de validare a atelierului** (ieșire `azd version`) actualizat la `1.25.6`
- **🧭 README "Noutăți în azd Azi"** actualizat pentru a evidenția ciclul complet de viață al agentului, noi extensii AI și remedieri recente ale experienței utilizatorului (`azd init` idempotency, `azd auth login` curățare token expirat, `azd tool` prompt prima execuție)
- **📖 Capitolul 2 agents.md (Opțiunea 4)** indică acum cursanților comenzile pentru ciclul de viață după implementare în loc să se oprească la `azd up`

#### Remediat
- **🏷️ Denumirea produsului** — adăugat un comentariu despre rebrandingul Aspire (".NET Aspire" este acum pur și simplu "Aspire"); suportul Aspire în azd rămâne neschimbat
- **🔎 Validare lansare live** confirmată conform fluxului de versiuni Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) și `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Clarificări pentru Începători, Validare Setup & Curățarea Finală a Comenzilor AZD
**Această versiune continuă validarea AZD 1.23 cu o trecere axată pe începători: clarifică ghidarea la autentificarea AZD, adaugă scripturi de validare setup local, verifică comenzile cheie față de CLI-ul AZD live și elimină ultimele referințe învechite ale comenzilor de origine engleză în afară de jurnalul modificărilor.**

#### Adăugat
- **🧪 Scripturi de validare setup pentru începători** cu `validate-setup.ps1` și `validate-setup.sh` pentru ca cursanții să confirme disponibilitatea uneltelor necesare înainte de începerea Capitolului 1
- **✅ Pași de validare setup inițială** în README-ul principal și în README-ul Capitolului 1 pentru detectarea prerechizitelor lipsă înainte de `azd up`

#### Modificat
- **🔐 Ghidare la autentificare pentru începători** tratează acum constant `azd auth login` ca principală cale pentru fluxurile de lucru AZD, cu `az login` menționat ca opțional, cu excepția cazului în care se folosesc direct comenzile Azure CLI
- **📚 Fluxul de onboarding în Capitolul 1** indică acum cursanților să valideze setup-ul local înainte de instalare, autentificare și primii pași de implementare
- **🛠️ Mesaje validator** separă clar cerințele blocante de avertismentele opționale Azure CLI pentru calea de începători exclusiv AZD
- **📖 Documentația de configurare, depanare și exemple** face acum distincția între autentificarea AZD obligatorie și logarea opțională Azure CLI când ambele erau prezentate anterior fără context

#### Remediat
- **📋 Referințele rămase ale comenzilor în engleză** actualizate la formulele curente AZD, inclusiv `azd config show` în fișa de referință și `azd monitor --overview` unde era intenționată ghidarea în Portalul Azure
- **🧭 Afirmările pentru începători în Capitolul 1** au fost temperate pentru a evita promisiunile exagerate de zeror-error garantat sau comportament de rollback pentru toate șabloanele și resursele Azure
- **🔎 Validarea CLI live** confirmă suportul actual pentru `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` și `azd down --force --purge`

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

#### Validarea AZD 1.23.12, Extinderea Mediului de Workshop & Reîmprospătare Model AI
**Această versiune face o trecere de validare a documentației față de `azd` `1.23.12`, actualizează exemplele de comenzi AZD depășite, reîmprospătează ghidarea modelului AI pentru valorile implicite curente și extinde instrucțiunile atelierului dincolo de GitHub Codespaces pentru a susține și containerele de dezvoltare și clonele locale.**

#### Adăugat
- **✅ Note de validare în capitolele principale și documentația atelierului** pentru a face explicită linia de bază AZD testată pentru cursanții care folosesc versiuni CLI mai noi sau mai vechi
- **⏱️ Ghidarea timpilor de timeout pentru implementări AI de lungă durată** folosind `azd deploy --timeout 1800`
- **🔎 Pași de inspectare a extensiilor** cu `azd extension show azure.ai.agents` în documentația fluxului AI
- **🌐 Ghidare extinsă a mediului de workshop** acoperind GitHub Codespaces, containere de dezvoltare și clone locale cu MkDocs

#### Modificat
- **📚 README-uri introductive ale capitolelor** notează acum constant validarea față de `azd 1.23.12` în secțiunile fundament, configurație, infrastructură, multi-agent, pre-implementare, depanare și producție
- **🛠️ Referințe comenzi AZD** actualizate la formele curente în documentație:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` sau `azd env get-value(s)` în funcție de context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` unde este intenționată prezentarea Application Insights
- **🧪 Exemple de previzualizare a provisioning-ului** simplificate la utilizarea suportată curent, cum ar fi `azd provision --preview` și `azd provision --preview -e production`
- **🧭 Fluxul atelierului** actualizat astfel încât cursanții să poată finaliza laboratoarele în Codespaces, un container de dezvoltare sau o clonă locală în loc să se presupună execuția exclusiv în Codespaces
- **🔐 Ghidarea autentificării** preferă acum `azd auth login` pentru fluxurile AZD, cu `az login` poziționat ca opțional când se folosesc direct comenzile Azure CLI

#### Remediat
- **🪟 Comenzi de instalare Windows** normalizate conform formei curente `winget` în ghidul de instalare
- **🐧 Ghidare instalare Linux** corectată pentru a evita instrucțiunile neacceptate specifice distribuției pentru managerul de pachete `azd` și în schimb să indice către artefactele de lansare unde este cazul
- **📦 Exemple de modele AI** reîmprospătate de la implicitele mai vechi precum `gpt-35-turbo` și `text-embedding-ada-002` la exemple curente precum `gpt-4.1-mini`, `gpt-4.1` și `text-embedding-3-large`
- **📋 Fragmente pentru implementare și diagnostic** corectate pentru a folosi comenzile curente de mediu și starea în jurnale, scripturi și pași de depanare
- **⚙️ Ghidare GitHub Actions** actualizată de la `Azure/setup-azd@v1.0.0` la `Azure/setup-azd@v2`
- **🤖 Ghidare consent MCP/Copilot** actualizată de la `azd mcp consent` la `azd copilot consent list`

#### Îmbunătățit
- **🧠 Ghidul capitolului AI** explică mai bine acum comportamentul sensibil la previzualizare `azd ai`, autentificarea specifică tenantului, utilizarea curentă a extensiilor și recomandările actualizate pentru implementarea modelelor
- **🧪 Instrucțiunile atelierului** folosesc acum exemple de versiuni mai realiste și un limbaj mai clar pentru configurarea mediului în laboratoarele practice
- **📈 Documentația de producție și depanare** se aliniază mai bine acum cu exemplele curente de monitorizare, model de rezervă și niveluri de cost

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

#### Comenzi CLI AI AZD, Validare Conținut & Extinderea Șabloanelor
**Această versiune adaugă acoperirea comenzilor `azd ai`, `azd extension` și `azd mcp` în toate capitolele legate de AI, repară linkurile rupte și codul învechit în agents.md, actualizează fișa de referință și reface secțiunea Exemple Șabloane cu descrieri validate și noi șabloane Azure AI AZD.**

#### Adăugat
- **🤖 Acoperirea comenzilor AI AZD** în 7 fișiere (anterior doar în Capitolul 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Noua secțiune „Extensii și Comenzi AI” care introduce `azd extension`, `azd ai agent init` și `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opțiunea 4: `azd ai agent init` cu tabel comparativ (șablon față de abordarea manifestului)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecțiuni „Extensii AZD pentru Foundry” și „Implementare Agent-First”
  - `docs/chapter-05-multi-agent/README.md` — Pornire rapidă arată acum ambele căi de implementare bazate pe șablon și manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Secțiunea de implementare include acum opțiunea `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsecțiunea „Comenzi Extensie AI AZD pentru Diagnostic”
  - `resources/cheat-sheet.md` — Noua secțiune „Comenzi AI & Extensii” cu `azd extension`, `azd ai agent init`, `azd mcp` și `azd infra generate`
- **📦 Noi șabloane exemplu AI AZD** în `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET cu Blazor WebAssembly, Semantic Kernel și suport chat vocal
  - **azure-search-openai-demo-java** — Chat RAG Java folosind Langchain4J cu opțiuni de implementare ACA/AKS
  - **contoso-creative-writer** — Aplicație de scris creativ multi-agent folosind Azure AI Agent Service, Bing Grounding și Prompty
  - **serverless-chat-langchainjs** — RAG serverless folosind Azure Functions + LangChain.js + Cosmos DB cu suport dezvoltare locală Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG Enterprise cu portal de administrare, integrare Teams și opțiuni PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicație de referință MCP orchestrare multi-agent cu servere în .NET, Python, Java și TypeScript
  - **azd-ai-starter** — Șablon Bicep minimal pentru infrastructura Azure AI
  - **🔗 Linkul galeria Awesome AZD AI** — Referință către [galeria awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (peste 80 de șabloane)

#### Remediat
- **🔗 navigare agents.md**: Legăturile Anterior/Următor corespund acum ordinii lecțiilor din Capitolul 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 linkuri rupte agents.md**: `production-ai-practices.md` corectat în `../chapter-08-production/production-ai-practices.md` (3 apariții)
- **📦 cod învechit în agents.md**: Înlocuit `opencensus` cu `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API invalid în agents.md**: Mutat `max_tokens` din `create_agent()` în `create_run()` ca `max_completion_tokens`
- **🔢 numărarea tokenurilor în agents.md**: Înlocuit estimarea aproximativă `len//4` cu `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Serviciile corectate de la "Cognitive Search + App Service" la "Azure AI Search + Azure Container Apps" (gazda implicită schimbată în octombrie 2024)
- **contoso-chat**: Descriere actualizată pentru a face referire la Azure AI Foundry + Prompty, corespunzând titlului și tehnologiilor repo-ului

#### Eliminat
- **ai-document-processing**: Eliminată referința la șablon non-funcțional (repo nepublic accesibil ca șablon AZD)

#### Îmbunătățit
- **📝 exerciții agents.md**: Exercițiul 1 afișează acum output-ul așteptat și pasul `azd monitor`; Exercițiul 2 include codul complet de înregistrare `FunctionTool`; Exercițiul 3 înlocuiește ghidarea vagă cu comenzi concrete `prepdocs.py`
- **📚 resurse agents.md**: Actualizate linkuri la documentația curentă Azure AI Agent Service și ghid rapid
- **📋 tabelul Pași Următori agents.md**: Adăugat link AI Workshop Lab pentru acoperire completă a capitolului

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
**Această versiune îmbunătățește navigarea capitolelor în README.md cu un format tabelar îmbunătățit.**

#### Modificat
- **Tabel Hartă Curs**: Îmbunătățit cu linkuri directe către lecții, estimări de durată și ratinguri de complexitate
- **Curățenie foldere**: Eliminat foldere vechi redundante (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validare Linkuri**: Verificate toate cele peste 21 de linkuri interne din tabelul Hartă Curs

### [v3.16.0] - 2026-02-05

#### Actualizări Nume Produs
**Această versiune actualizează referințele la produse pentru brandingul curent Microsoft.**

#### Modificat
- **Microsoft Foundry → Microsoft Foundry**: Toate referințele actualizate în fișierele non-traduse
- **Azure AI Agent Service → Foundry Agents**: Numele serviciului actualizat pentru a reflecta brandingul curent

#### Fișiere actualizate
- `README.md` - Pagina principală curs
- `changelog.md` - Istoric versiuni
- `course-outline.md` - Structura cursului
- `docs/chapter-02-ai-development/agents.md` - Ghid agenți AI
- `examples/README.md` - Documentație exemple
- `workshop/README.md` - Pagina principală workshop
- `workshop/docs/index.md` - Index workshop
- `workshop/docs/instructions/*.md` - Toate fișierele de instrucțiuni pentru workshop

---

### [v3.15.0] - 2026-02-05

#### Restructurare Majoră a Repo-ului: Foldere Numerotate după Capitole
**Această versiune restructurează documentația în foldere dedicate pe capitole pentru o navigare mai clară.**

#### Redenumirea folderelor
Folderele vechi au fost înlocuite cu foldere numerotate pe capitole:
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
- **📚 fișiere README pentru capitole**: Creat README.md în fiecare folder de capitol cu:
  - Obiective de învățare și durată
  - Tabel lecții cu descrieri
  - Comenzi quick start
  - Navigare către alte capitole

#### Modificat
- **🔗 Actualizate toate linkurile interne**: Peste 78 de căi actualizate în toate fișierele de documentație
- **🗺️ README principal**: Actualizat Harta Cursului cu structura nouă pe capitole
- **📝 examples/README.md**: Actualizate referințe către foldere capitole

#### Eliminat
- Structura veche de foldere (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructurare Repo: Navigare pe Capitole
**Această versiune a adăugat fișiere README cu navigare pe capitole (înlocuit de v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ghid Noi Agenți AI
**Această versiune adaugă un ghid cuprinzător pentru implementarea agenților AI cu Azure Developer CLI.**

#### Adăugat
- **🤖 docs/microsoft-foundry/agents.md**: Ghid complet care acoperă:
  - Ce sunt agenții AI și cum diferă de chatbots
  - Trei șabloane rapide pentru agenți (Foundry Agents, Prompty, RAG)
  - Modele de arhitectură pentru agenți (agent unic, RAG, multi-agent)
  - Configurarea și personalizarea instrumentelor
  - Monitorizarea și urmărirea metricilor
  - Considerații de cost și optimizare
  - Scenarii comune de depanare
  - Trei exerciții practice cu criterii de succes

#### Structura Conținutului
- **Introducere**: Concepte agenți pentru începători
- **Quick Start**: Implementarea agenților cu `azd init --template get-started-with-ai-agents`
- **Modele Arhitecturale**: Diagrame vizuale ale modelelor de agenți
- **Configurare**: Setarea instrumentelor și variabile de mediu
- **Monitorizare**: Integrare Application Insights
- **Exerciții**: Învățare practică progresivă (20-45 minute fiecare)

---

### [v3.12.0] - 2026-02-05

#### Actualizare Mediu DevContainer
**Această versiune actualizează configurația containerului de dezvoltare cu instrumente moderne și setări implicite mai bune pentru experiența de învățare AZD.**

#### Modificat
- **🐳 Imagine de bază**: Actualizată de la `python:3.12-bullseye` la `python:3.12-bookworm` (ultima versiune Debian stabilă)
- **📛 Nume container**: Redenumit din "Python 3" în "AZD for Beginners" pentru claritate

#### Adăugat
- **🔧 Funcții noi container de dezvoltare**:
  - `azure-cli` cu suport Bicep activat
  - `node:20` (versiune LTS pentru șabloanele AZD)
  - `github-cli` pentru management șabloane
  - `docker-in-docker` pentru implementări container apps

- **🔌 Redirecționare porturi**: Porturi preconfigurate pentru dezvoltare comună:
  - 8000 (Previzualizare MkDocs)
  - 3000 (Aplicații web)
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

- **⚙️ Setări VS Code**: Adăugate setări implicite pentru interpret Python, formatare la salvare și eliminare spații inutile

- **📦 requirements-dev.txt actualizat**:
  - Adăugată extensie MkDocs minify
  - Adăugat pre-commit pentru calitatea codului
  - Adăugate pachete Azure SDK (azure-identity, azure-mgmt-resource)

#### Remediat
- **Comandă Post-Creare**: Acum verifică instalarea AZD și Azure CLI la pornirea containerului

---

### [v3.11.0] - 2026-02-05

#### Revizuire README accesibilă începătorilor
**Această versiune îmbunătățește semnificativ README.md pentru a fi mai accesibil pentru începători și adaugă resurse esențiale pentru dezvoltatorii AI.**

#### Adăugat
- **🆚 Compararea Azure CLI vs AZD**: Explicație clară când să folosești fiecare unealtă cu exemple practice
- **🌟 Linkuri Awesome AZD**: Linkuri directe către galeria comunității de șabloane și resurse de contribuție:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - peste 200 de șabloane gata de implementat
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Contribuție comunitară
- **🎯 Ghid Quick Start**: Secțiune simplificată în 3 pași (Instalare → Autentificare → Implementare)
- **📊 Tabel Navigare Bazat pe Experiență**: Ghid clar unde să înceapă în funcție de experiența dezvoltatorului

#### Modificat
- **Structura README**: Reorganizată pentru divulgarea progresivă - informații cheie prima
- **Secțiune Introducere**: Rescrisă pentru a explica "Magia `azd up`" pentru începători compleți
- **Eliminare conținut duplicat**: Eliminată secțiunea duplicată de depanare
- **Comenzi depanare**: Corectată referința `azd logs` pentru a folosi `azd monitor --logs` validă

#### Remediat
- **🔐 Comenzi autentificare**: Adăugat `azd auth login` și `azd auth logout` în cheat-sheet.md
- **Referințe comenzi invalide**: Eliminat ultimele apariții `azd logs` din secțiunea de depanare README

#### Note
- **Domeniu**: Modificări aplicate la README.md principal și resources/cheat-sheet.md
- **Public țintă**: Îmbunătățiri dedicate în special dezvoltatorilor noi la AZD

---

### [v3.10.0] - 2026-02-05

#### Actualizare acuratețe comenzi Azure Developer CLI
**Această versiune corectează comenzi AZD inexistente în documentație, asigurând că toate exemplele de cod folosesc sintaxă validă Azure Developer CLI.**

#### Remediat
- **🔧 Comenzi AZD inexistente eliminate**: Audit complet și corectare comenzi invalide:
  - `azd logs` (nu există) → înlocuit cu `azd monitor --logs` sau alternative Azure CLI
  - Subcomenzi `azd service` (nu există) → înlocuite cu `azd show` și Azure CLI
  - `azd infra import/export/validate` (nu există) → eliminate sau înlocuite cu alternative valide
  - Flag-uri `azd deploy --rollback/--incremental/--parallel/--detect-changes` (nu există) → eliminate
  - Flag-uri `azd provision --what-if/--rollback` (nu există) → actualizate spre `--preview`
  - `azd config validate` (nu există) → înlocuit cu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nu există) → eliminate

- **📚 Fișiere actualizate cu corecții comenzi**:
  - `resources/cheat-sheet.md`: Revizuire majoră a referințelor de comenzi
  - `docs/deployment/deployment-guide.md`: Corectate strategii de rollback și implementare
  - `docs/troubleshooting/debugging.md`: Corectate secțiuni de analiză loguri
  - `docs/troubleshooting/common-issues.md`: Actualizate comenzi depanare
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectată secțiunea de depanare AZD
  - `docs/getting-started/azd-basics.md`: Comenzi de monitorizare corectate
  - `docs/getting-started/first-project.md`: Exemple actualizate de monitorizare și depanare
  - `docs/getting-started/installation.md`: Exemple de help și versiune corectate
  - `docs/pre-deployment/application-insights.md`: Comenzi corectate pentru vizualizarea jurnalelor
  - `docs/pre-deployment/coordination-patterns.md`: Comenzi de depanare agent corectate

- **📝 Referință versiune actualizată**: 
  - `docs/getting-started/installation.md`: Versiunea `1.5.0` hardcodate schimbată în generic `1.x.x` cu link către versiuni

#### Modificări
- **Strategii de rollback**: Documentația actualizată pentru a folosi rollback bazat pe Git (AZD nu are rollback nativ)
- **Vizualizarea jurnalelor**: Înlocuite referințele `azd logs` cu `azd monitor --logs`, `azd monitor --live` și comenzi Azure CLI
- **Secțiunea Performanță**: Eliminarea flag-urilor de implementare paralelă/incrementală inexistente, oferind alternative valide

#### Detalii tehnice
- **Comenzi valide AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag-uri valide azd monitor**: `--live`, `--logs`, `--overview`
- **Funcționalități eliminate**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Note
- **Verificare**: Comenzi validate pe Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalizarea atelierului și actualizarea calității documentației
**Această versiune finalizează modulele interactive ale atelierului, repară toate linkurile rupte din documentație și îmbunătățește calitatea generală a conținutului pentru dezvoltatorii AI care folosesc Microsoft AZD.**

#### Adăugate
- **📝 CONTRIBUTING.md**: Document nou de ghid pentru contribuții cu:
  - Instrucțiuni clare pentru raportarea problemelor și propunerea de schimbări
  - Standardele documentației pentru conținut nou
  - Linii directoare pentru exemple de cod și convenții pentru mesajele commit-urilor
  - Informații despre implicarea comunității

#### Finalizate
- **🎯 Modulul 7 al Atelierului (Încheiere)**: Modul complet de încheiere, cu:
  - Rezumat cuprinzător al realizărilor atelierului
  - Secțiune convingătoare despre conceptele stăpânite: AZD, template-uri și Microsoft Foundry
  - Recomandări pentru continuarea traseului de învățare
  - Exerciții provocare cu clasificare după dificultate
  - Feedback din comunitate și linkuri de suport

- **📚 Modulul 3 al Atelierului (Dezasamblare)**: Obiective de învățare actualizate cu:
  - Ghid de activare GitHub Copilot cu servere MCP
  - Înțelegerea structurii folderelor pentru template-ul AZD
  - Modele de organizare Infrastructure-as-Code (Bicep)
  - Instrucțiuni hands-on pentru laborator

- **🔧 Modulul 6 al Atelierului (Demontare)**: Finalizat cu:
  - Obiective de curățare a resurselor și management de costuri
  - Utilizarea `azd down` pentru deprovisionare sigură a infrastructurii
  - Ghid pentru recuperarea serviciilor cognitive soft-șterse
  - Provocări bonus pentru explorare cu GitHub Copilot și Azure Portal

#### Reparat
- **🔗 Reparații linkuri rupte**: Rezolvate peste 15 linkuri interne rupte în documentație:
  - `docs/ai-foundry/ai-model-deployment.md`: Corectate căile către microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corectate căile pentru ai-model-deployment.md și production-ai-practices.md
  - `docs/getting-started/first-project.md`: Înlocuit cicd-integration.md inexistent cu deployment-guide.md
  - `examples/retail-scenario.md`: Corectate căile pentru FAQ și ghidul de depanare
  - `examples/container-app/microservices/README.md`: Corectate căile pentru homepage-ul cursului și ghidul de implementare
  - `resources/faq.md` și `resources/glossary.md`: Actualizate referințele capitolului AI
  - `course-outline.md`: Corectate referințele pentru ghidul instructorului și laboratoarele AI

- **📅 Bannerul statusului atelierului**: Actualizat de la "În construcție" la status activ, cu data februarie 2026

- **🔗 Navigare Atelier**: Reparat linkuri rupte de navigație în README.md care indicau pe folderul lab-1-azd-basics inexistent

#### Modificat
- **Prezentarea atelierului**: Eliminată avertizarea "în construcție", atelierul este complet și pregătit pentru utilizare
- **Consistența navigației**: Asigurată navigația corectă între toate modulele atelierului
- **Referințe traseu de învățare**: Actualizate referințele capitolelor cu căile corecte microsoft-foundry

#### Validat
- ✅ Toate fișierele markdown în engleză au linkuri interne valide
- ✅ Modulele atelierului 0-7 sunt complete cu obiective de învățare
- ✅ Navigația între capitole și module funcționează corect
- ✅ Conținut adecvat pentru dezvoltatori AI care folosesc Microsoft AZD
- ✅ Limbaj și structură prietenoase pentru începători păstrate pe tot parcursul
- ✅ CONTRIBUTING.md oferă ghidaj clar pentru contribuitorii comunității

#### Implementare tehnică
- **Validarea linkurilor**: Script PowerShell automat a verificat toate linkurile .md interne
- **Audit conținut**: Revizuire manuală pentru completitudinea atelierului și adecvarea pentru începători
- **Sistem navigație**: Aplicate modele consistente pentru navigația capitolelor și modulelor

#### Note
- **Domeniu**: Schimbările aplicate doar documentației în engleză
- **Traduceri**: Folderele de traduceri nu au fost actualizate în această versiune (sincronizare automată ulterioară)
- **Durata atelierului**: Atelierul complet oferă acum 3-4 ore de învățare practică

---

### [v3.8.0] - 2025-11-19

#### Documentație avansată: Monitorizare, Securitate și Modele Multi-Agent
**Această versiune adaugă lecții complete, de calitate A, despre integrarea Application Insights, modele de autentificare și coordonare multi-agent pentru implementări de producție.**

#### Adăugate
- **📊 Lecția integrare Application Insights**: în `docs/pre-deployment/application-insights.md`:
  - Implementare focalizată pe AZD cu aprovizionare automată
  - Template-uri Bicep complete pentru Application Insights + Log Analytics
  - Aplicații Python funcționale cu telemetrie personalizată (peste 1,200 linii)
  - Modele de monitorizare AI/LLM (urmărirea token-urilor și costurilor Microsoft Foundry Models)
  - 6 diagrame Mermaid (arhitectură, tracing distribuit, flux telemetrie)
  - 3 exerciții practice (alerte, dashboard-uri, monitorizare AI)
  - Exemple de interogări Kusto și strategii de optimizare a costurilor
  - Streaming metrici live și depanare în timp real
  - Durata de învățare 40-50 minute cu modele gata pentru producție

- **🔐 Lecția modele autentificare & securitate**: în `docs/getting-started/authsecurity.md`:
  - 3 modele autentificare (connection strings, Key Vault, managed identity)
  - Template-uri Bicep complete pentru implementări securizate
  - Cod aplicație Node.js cu integrare Azure SDK
  - 3 exerciții complete (activare managed identity, user-assigned identity, rotație Key Vault)
  - Practici recomandate de securitate și configurații RBAC
  - Ghid de depanare și analiză costuri
  - Modele autentificare fără parolă pregătite pentru producție

- **🤖 Lecția modele coordonare multi-agent**: în `docs/pre-deployment/coordination-patterns.md`:
  - 5 modele de coordonare (sequential, parallel, hierarchical, event-driven, consensus)
  - Implementare completă a serviciului orchestrator (Python/Flask, peste 1,500 linii)
  - 3 implementări specializate agent (Research, Writer, Editor)
  - Integrare Service Bus pentru cozi mesaje
  - Management stare Cosmos DB pentru sisteme distribuite
  - 6 diagrame Mermaid cu interacțiuni ale agenților
  - 3 exerciții avansate (gestionare timeout, retry logic, circuit breaker)
  - Analiză costuri ($240-565/lună) cu strategii de optimizare
  - Integrare Application Insights pentru monitorizare

#### Îmbunătățite
- **Capitol pre-implementare:** Include modele complete de monitorizare și coordonare
- **Capitol de pornire:** Îmbunătățit cu modele profesionale de autentificare
- **Pregătire producție:** Acoperire completă de la securitate la observabilitate
- **Structura cursului:** Actualizată pentru a face referire la noile lecții din Capitolele 3 și 6

#### Modificat
- **Progresie învățare:** Mai bună integrare a securității și monitorizării în tot cursul
- **Calitatea documentației:** Standard A consecvent (95-97%) pentru lecțiile noi
- **Modele producție:** Acoperire completă end-to-end pentru implementări enterprise

#### Îmbunătățit
- **Experiență dezvoltator:** Traseu clar de la dezvoltare la monitorizarea în producție
- **Standardele de securitate:** Modele profesionale pentru autentificare și gestionarea secretelor
- **Observabilitate:** Integrare completă Application Insights cu AZD
- **Sarcini AI:** Monitorizare specializată pentru Microsoft Foundry Models și sisteme multi-agent

#### Validat
- ✅ Toate lecțiile includ cod complet funcțional (nu doar fragmente)
- ✅ Diagrame Mermaid pentru învățare vizuală (19 în total în 3 lecții)
- ✅ Exerciții practice cu pași de verificare (9 în total)
- ✅ Template-uri Bicep pregătite pentru producție, implementabile prin `azd up`
- ✅ Analiză costuri și strategii de optimizare
- ✅ Ghiduri de depanare și bune practici
- ✅ Puncte de control al cunoștințelor cu comenzi de verificare

#### Rezultate notare documentație
- **docs/pre-deployment/application-insights.md**: - Ghid complet de monitorizare
- **docs/getting-started/authsecurity.md**: - Modele profesionale de securitate
- **docs/pre-deployment/coordination-patterns.md**: - Arhitecturi avansate multi-agent
- **Conținut nou general**: - Standard înalt și consecvent

#### Implementare tehnică
- **Application Insights:** Log Analytics + telemetrie personalizată + tracing distribuit
- **Autentificare:** Managed Identity + Key Vault + modele RBAC
- **Multi-Agent:** Service Bus + Cosmos DB + Container Apps + orchestrare
- **Monitorizare:** Metrici live + interogări Kusto + alerte + dashboard-uri
- **Gestionare costuri:** Strategii de sampling, politici de retenție, control bugete

### [v3.7.0] - 2025-11-19

#### Îmbunătățiri calitate documentație și exemplu nou Microsoft Foundry Models
**Această versiune îmbunătățește calitatea documentației în întregul depou și adaugă un exemplu complet de implementare Microsoft Foundry Models cu interfață chat gpt-4.1.**

#### Adăugate
- **🤖 Exemplu Microsoft Foundry Models Chat**: Implementare completă gpt-4.1 cu funcționalitate în `examples/azure-openai-chat/`:
  - Infrastructură completă Microsoft Foundry Models (implementare model gpt-4.1)
  - Interfață chat Python la linia de comandă cu istoric conversații
  - Integrare Key Vault pentru stocarea securizată a cheii API
  - Urmărirea utilizării token-urilor și estimarea costurilor
  - Limitare rată și gestionare erori
  - README cuprinzător cu ghid de implementare de 35-45 minute
  - 11 fișiere gata de producție (template-uri Bicep, aplicație Python, configurație)
- **📚 Exerciții documentație**: Adăugate exerciții practice în ghidul de configurare:
  - Exercițiul 1: Configurare multi-mediu (15 minute)
  - Exercițiul 2: Practică gestionare secrete (10 minute)
  - Criterii clare de succes și pași de verificare
- **✅ Verificare implementare:** Adăugat capitol verificare în ghidul de implementare:
  - Proceduri verificare sănătate
  - Lista criterii de succes
  - Ieșiri așteptate pentru toate comenzile de implementare
  - Referință rapidă pentru depanare

#### Îmbunătățite
- **examples/README.md**: Actualizat la calitate A (93%):
  - Adăugat azure-openai-chat în toate secțiunile relevante
  - Număr exemple locale actualizat de la 3 la 4
  - Adăugat în tabelul Exemple Aplicare AI
  - Integrat în Quick Start pentru utilizatori intermediari
  - Adăugat în secțiunea Microsoft Foundry Templates
  - Actualizat Matrice comparativă și secțiuni de identificare tehnologie
- **Calitatea documentației:** Îmbunătățită B+ (87%) → A- (92%) în folderul docs:
  - Adăugate rezultate așteptate pentru exemplele de comandă critice
  - Inclus pași de verificare pentru modificările de configurare
  - Îmbunătățită învățarea practică cu exerciții utile

#### Modificat
- **Progresie învățare:** Mai bună integrare a exemplelor AI pentru începători intermediari
- **Structura documentației:** Exerciții mai aplicabile cu rezultate clare
- **Proces verificare:** Stabilite criterii explicite de succes pentru fluxuri cheie

#### Îmbunătățit
- **Experiența dezvoltatorului:** Implementarea Microsoft Foundry Models durează acum 35-45 minute (față de 60-90 pentru alternative complexe)
- **Transparența costurilor:** Estimări clare de costuri ($50-200/lună) pentru exemplul Microsoft Foundry Models
- **Traseu de învățare:** Dezvoltatorii AI au punct clar de pornire cu azure-openai-chat
- **Standardele documentației:** Ieșiri așteptate și pași de verificare consecvenți

#### Validat
- ✅ Exemplul Microsoft Foundry Models complet funcțional cu `azd up`
- ✅ Toate cele 11 fișiere de implementare sintactic corecte
- ✅ Instrucțiunile README corespund experienței reale de implementare
- ✅ Linkuri documentație actualizate în peste 8 locații
- ✅ Indexul de exemple reflectă corect cele 4 exemple locale
- ✅ Fără linkuri externe duplicate în tabele
- ✅ Toate referințele de navigare corecte

#### Implementare tehnică
- **Arhitectură Microsoft Foundry Models:** gpt-4.1 + Key Vault + Container Apps
- **Securitate:** Managed Identity pregătit, secrete în Key Vault
- **Monitorizare:** Integrare Application Insights
- **Gestionare costuri:** Urmărire tokenuri și optimizare utilizare
- **Implementare:** O singură comandă `azd up` pentru configurare completă

### [v3.6.0] - 2025-11-19

#### Actualizare majoră: Exemple de implementare Container App
**Această versiune introduce exemple complete, pregătite pentru producție, de implementare a aplicațiilor containerizate folosind Azure Developer CLI (AZD), împreună cu documentație completă și integrare în traseul de învățare.**

#### Adăugate
- **🚀 Exemple Container App**: Exemple locale noi în `examples/container-app/`:
  - [Ghidul Principal](examples/container-app/README.md): Prezentare completă a implementărilor containerizate, pornire rapidă, producție și modele avansate
  - [API Flask Simplu](../../examples/container-app/simple-flask-api): API REST prietenos pentru începători cu scalare la zero, sonde de sănătate, monitorizare și depanare
  - [Arhitectură Microservicii](../../examples/container-app/microservices): Implementare multi-serviciu pregătită pentru producție (API Gateway, Produs, Comandă, Utilizator, Notificare), mesagerie asincronă, Service Bus, Cosmos DB, Azure SQL, urmărire distribuită, implementare blue-green/canary
- **Cele Mai Bune Practici**: Securitate, monitorizare, optimizarea costurilor și ghidaj CI/CD pentru sarcini containerizate
- **Exemple de Cod**: Exemplu complet `azure.yaml`, șabloane Bicep și implementări multi-limbaj pentru servicii (Python, Node.js, C#, Go)
- **Testare & Depanare**: Scenarii de testare end-to-end, comenzi de monitorizare, ghidaj pentru depanare

#### Modificat
- **README.md**: Actualizat pentru a prezenta și a face legătura către noile exemple de aplicații containerizate sub "Exemple Locale - Aplicații Containerizate"
- **examples/README.md**: Actualizat pentru a evidenția exemple de aplicații containerizate, a adăuga intrări în matricea de comparație și a actualiza referințe tehnologice/arhitecturale
- **Structura Cursului & Ghid de Studiu**: Actualizat pentru a face referire la noile exemple de aplicații containerizate și modele de implementare în capitolele relevante

#### Validat
- ✅ Toate noile exemple pot fi implementate cu `azd up` și respectă cele mai bune practici
- ✅ Legăturile cross-site și navigarea în documentație au fost actualizate
- ✅ Exemplele acoperă scenarii de la începători la avansat, inclusiv microservicii în producție

#### Note
- **Domeniu**: Documentație și exemple doar în limba engleză
- **Pași Următori**: Extindere cu modele suplimentare avansate pentru containere și automatizare CI/CD în versiunile viitoare

### [v3.5.0] - 2025-11-19

#### Rebranding Produs: Microsoft Foundry
**Această versiune implementează o schimbare completă a numelui produsului de la "Microsoft Foundry" la "Microsoft Foundry" în toată documentația în limba engleză, reflectând rebrandingul oficial al Microsoft.**

#### Modificat
- **🔄 Actualizare Nume Produs**: Rebranding complet de la "Microsoft Foundry" la "Microsoft Foundry"
  - Toate referințele actualizate în documentația în limba engleză în folderul `docs/`
  - Folder redenumit: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fișier redenumit: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - În total: 23 referințe de conținut actualizate în 7 fișiere de documentație

- **📁 Modificări Structură Folder**:
  - `docs/ai-foundry/` redenumit în `docs/microsoft-foundry/`
  - Toate referințele încrucișate actualizate pentru a reflecta noua structură de foldere
  - Legăturile de navigare validate în toată documentația

- **📄 Redenumiri Fișiere**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toate linkurile interne actualizate pentru a face referire la noile nume de fișiere

#### Fișiere Actualizate
- **Documentație Capitole** (7 fișiere):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizări ale linkurilor de navigare
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referințe ale numelui produsului actualizate
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Folosește deja Microsoft Foundry (din actualizările anterioare)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referințe actualizate (prezentare generală, feedback comunitate, documentație)
  - `docs/getting-started/azd-basics.md` - 4 linkuri de referințe încrucișate actualizate
  - `docs/getting-started/first-project.md` - 2 linkuri de navigare capitol actualizate
  - `docs/getting-started/installation.md` - 2 linkuri către capitolul următor actualizate
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referințe actualizate (navigare, comunitate Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navigare actualizat
  - `docs/troubleshooting/debugging.md` - 1 link de navigare actualizat

- **Fișiere Structură Curs** (2 fișiere):
  - `README.md` - 17 referințe actualizate (prezentarea cursului, titluri capitole, secțiune șabloane, insight-uri comunitare)
  - `course-outline.md` - 14 referințe actualizate (prezentare generală, obiective de învățare, resurse capitol)

#### Validat
- ✅ Nicio referință rămasă către calea folderului "ai-foundry" în documentația în limba engleză
- ✅ Nicio referință rămasă la numele produsului "Microsoft Foundry" în documentația în limba engleză
- ✅ Toate linkurile de navigare funcționează cu noua structură de foldere
- ✅ Redenumirile fișierelor și folderelor realizate cu succes
- ✅ Referințele încrucișate între capitole validate

#### Note
- **Domeniu**: Modificările aplicate doar documentației în limba engleză în folderul `docs/`
- **Traduceri**: Folderele de traducere (`translations/`) nu au fost actualizate în această versiune
- **Workshop**: Materialele workshopului (`workshop/`) nu au fost actualizate în această versiune
- **Exemple**: Fișierele exemplu pot încă face referire la denumirea veche (va fi abordat într-o actualizare viitoare)
- **Link-uri Externe**: URL-uri externe și referințe în depozitul GitHub rămân neschimbate

#### Ghid de Migrare pentru Contribuitori
Dacă aveți ramuri locale sau documentație care face referire la structura veche:
1. Actualizați referințele folderului: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizați referințele fișierelor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Înlocuiți numele produsului: "Microsoft Foundry" → "Microsoft Foundry"
4. Verificați dacă toate linkurile interne din documentație funcționează încă

---

### [v3.4.0] - 2025-10-24

#### Îmbunătățiri pentru Previzualizarea și Validarea Infrastructurii
**Această versiune introduce suport complet pentru noua funcționalitate de previzualizare Azure Developer CLI și îmbunătățește experiența utilizatorului în cadrul workshopului.**

#### Adăugat
- **🧪 Documentație Funcționalitate azd provision --preview**: Acoperire completă a noii capacități de previzualizare a infrastructurii
  - Referință pentru comandă și exemple de utilizare în fișa de ajutor
  - Integrare detaliată în ghidul de provisioning cu cazuri de utilizare și beneficii
  - Integrare verificări pre-zbor pentru validare sigură a implementării
  - Actualizări ale ghidului de început pentru practici de implementare prioritizând siguranța
- **🚧 Banner Stare Workshop**: Banner HTML profesional care indică starea dezvoltării workshopului
  - Design cu gradient și indicatori de construcție pentru o comunicare clară către utilizator
  - Marcaj temporal de actualizare pentru transparență
  - Design responsive pentru toate tipurile de dispozitive mobile

#### Îmbunătățit
- **Siguranță Infrastructură**: Funcționalitate de previzualizare integrată în toată documentația de implementare
- **Validare Pre-Implementare**: Scripturi automate includ acum testarea previzualizării infrastructurii
- **Flux de Lucru pentru Dezvoltatori**: Secvențe de comenzi actualizate pentru a include previzualizarea ca bună practică
- **Experiența Workshopului**: Așteptări clare setate pentru utilizatori privind stadiul dezvoltării conținutului

#### Modificat
- **Cele Mai Bune Practici pentru Implementare**: Fluxul de lucru cu prioritate pe previzualizare este acum recomandarea principală
- **Fluxul Documentației**: Validarea infrastructurii mutată mai devreme în procesul de învățare
- **Prezentarea Workshopului**: Comunicare profesională a statusului cu un calendar clar al dezvoltării

#### Îmbunătățit
- **Abordare Prioritară Siguranță**: Modificările infrastructurii pot fi validate acum înainte de implementare
- **Colaborarea Echipei**: Rezultatele previzualizării pot fi partajate pentru revizuire și aprobare
- **Conștientizarea Costurilor**: Mai bună înțelegere a costurilor resurselor înainte de provisioning
- **Reducerea Riscurilor**: Eșecurile de implementare reduse prin validare din timp

#### Implementare Tehnică
- **Integrare Multi-document**: Funcționalitatea previzualizării documentată în 4 fișiere cheie
- **Modele Comenzi**: Sintaxă și exemple consistente în toate documentele
- **Integrare Cele Mai Bune Practici**: Previziuni incluse în fluxurile de validare și scripturi
- **Indicatori Vizuali**: Marcaje clare ale funcționalității NOI pentru o mai bună descoperire

#### Infrastructura Workshopului
- **Comunicare Stare**: Banner HTML profesional cu stilizare gradient
- **Experiența Utilizatorului**: Statusul clar al dezvoltării previne confuziile
- **Prezentare Profesională**: Menține credibilitatea depozitului în timp ce stabilește așteptările
- **Transparență Calendar**: Marcaj temporal octombrie 2025 pentru responsabilitate

### [v3.3.0] - 2025-09-24

#### Materiale Workshop Îmbunătățite și Experiență de Învățare Interactivă
**Această versiune introduce materiale de workshop complete cu ghiduri interactive bazate pe browser și trasee structurate de învățare.**

#### Adăugat
- **🎥 Ghid Interactiv Workshop**: Experiență de workshop bazată pe browser cu capacitate de previzualizare MkDocs
- **📝 Instrucțiuni Workshop Structurate**: Traseu de învățare ghidat în 7 pași de la descoperire la personalizare
  - 0-Introducere: Prezentare și configurare workshop
  - 1-Selectare-Șablon-AI: Proces de descoperire și selecție a șabloanelor
  - 2-Validare-Șablon-AI: Proceduri de implementare și validare
  - 3-Deconstruire-Șablon-AI: Înțelegerea arhitecturii șablonului
  - 4-Configurare-Șablon-AI: Configurare și personalizare
  - 5-Personalizare-Șablon-AI: Modificări avansate și iterări
  - 6-Demontare-Infrastructură: Curățare și managementul resurselor
  - 7-Încheiere: Rezumat și pași următori
- **🛠️ Unelte Workshop**: Configurație MkDocs cu tema Material pentru experiență de învățare îmbunătățită
- **🎯 Traseu de Învățare Practic**: Metodologie în 3 pași (Descoperire → Implementare → Personalizare)
- **📱 Integrare GitHub Codespaces**: Configurare fără întreruperi a mediului de dezvoltare

#### Îmbunătățit
- **Laborator AI Workshop**: Extins cu o experiență de învățare structurate 2-3 ore
- **Documentație Workshop**: Prezentare profesională cu navigare și materiale vizuale
- **Progresul Învățării**: Ghidaj clar pas cu pas de la selecția șablonului la implementarea în producție
- **Experiența Dezvoltatorilor**: Unelte integrate pentru fluxuri de dezvoltare simplificate

#### Îmbunătățit
- **Accesibilitate**: Interfață bazată pe browser cu funcții de căutare, copiere și comutare temă
- **Învățare în Ritm Propriu**: Structură flexibilă a workshopului pentru viteze diferite de învățare
- **Aplicare Practică**: Scenarii reale de implementare a șabloanelor AI
- **Integrare Comunitate**: Integrare Discord pentru suport și colaborare în workshop

#### Caracteristici Workshop
- **Căutare încorporată**: Descoperire rapidă a cuvintelor cheie și lecțiilor
- **Copiere Blocuri de Cod**: Funcționalitate hover-to-copy pentru toate exemplele de cod
- **Comutator Temă**: Suport pentru mod întunecat/deschis pentru preferințe diferite
- **Resurse Vizuale**: Capturi de ecran și diagrame pentru înțelegere sporită
- **Integrare Ajutor**: Acces direct la Discord pentru suport comunitar

### [v3.2.0] - 2025-09-17

#### Restructurare Majoră a Navigației și Sistem de Învățare Bazat pe Capitole
**Această versiune introduce o structură cuprinzătoare de învățare bazată pe capitole și o navigație îmbunătățită în întregul depozit.**

#### Adăugat
- **📚 Sistem de Învățare Bazat pe Capitole**: Restructurarea întregului curs în 8 capitole progresive de învățare
  - Capitolul 1: Fundament și Pornire Rapidă (⭐ - 30-45 min)
  - Capitolul 2: Dezvoltare AI-First (⭐⭐ - 1-2 ore)
  - Capitolul 3: Configurare & Autentificare (⭐⭐ - 45-60 min)
  - Capitolul 4: Infrastructură ca cod & implementare (⭐⭐⭐ - 1-1.5 ore)
  - Capitolul 5: Soluții AI multi-agent (⭐⭐⭐⭐ - 2-3 ore)
  - Capitolul 6: Validare & Planificare înainte de implementare (⭐⭐ - 1 oră)
  - Capitolul 7: Depanare & Debugging (⭐⭐ - 1-1.5 ore)
  - Capitolul 8: Modele pentru producție & întreprinderi (⭐⭐⭐⭐ - 2-3 ore)
- **📚 Sistem de Navigare Cuprinzător**: Antete și subsoluri de navigație consistente în întreaga documentație
- **🎯 Monitorizare Progres**: Listă de verificare pentru finalizarea cursului și sistem de verificare a învățării
- **🗺️ Ghidare Traseu de Învățare**: Puncte de intrare clare pentru diferite niveluri de experiență și obiective
- **🔗 Navigație referințe încrucișate**: Capitole conexe și prerechizite clar legate

#### Îmbunătățit
- **Structură README**: Transformată într-o platformă de învățare structurată organizată pe capitole
- **Navigare Documentație**: Fiecare pagină include acum context de capitol și ghidaj pentru progresie
- **Organizarea Șabloanelor**: Exemple și șabloane mapate la capitolele de învățare adecvate
- **Integrare Resurse**: Fișe de ajutor, întrebări frecvente și ghiduri de studiu legate de capitolele relevante
- **Integrare Workshop**: Laboratoare practice mapate la multiple obiective de învățare ale capitolului

#### Modificat
- **Progresul Învățării**: Trecere de la documentație liniară la învățare flexibilă bazată pe capitole
- **Plasarea Configurării**: Ghidul de configurare repoziționat ca Capitolul 3 pentru un flux de învățare mai bun
- **Integrare conținut AI**: Mai bună integrare a conținutului specific AI pe tot parcursul învățării
- **Conținut Producție**: Modele avansate consolidate în Capitolul 8 pentru cursanți enterprise

#### Îmbunătățit
- **Experiența Utilizatorilor**: Breadcrumbs clare de navigare și indicatori de progres al capitolelor
- **Accesibilitate**: Modele consistente de navigare pentru o traversare mai ușoară a cursului
- **Prezentare Profesională**: Structură de curs tip universitar, potrivită pentru training academic și corporativ
- **Eficiența Învățării**: Timp redus de găsire a conținutului relevant prin organizare îmbunătățită

#### Implementare Tehnică
- **Antete Navigație**: Navigare capitole standardizată în peste 40 de fișiere de documentație
- **Navigare Subsol**: Ghidaj consistent pentru progresie și indicatori de finalizare a capitolului
- **Referințe încrucișate**: Sistem complet de legături interne care conectează concepte relaționate
- **Mapare Capitole**: Șabloane și exemple clar asociate cu obiectivele de învățare

#### Îmbunătățire Ghid de Studiu
- **📚 Obiective de Învățare Cuprinzătoare**: Ghidul de studiu restructurat pentru alinierea cu sistemul de 8 capitole
- **🎯 Evaluare Bazată pe Capitol**: Fiecare capitol include obiective specifice de învățare și exerciții practice
- **📋 Monitorizare Progres**: Program săptămânal de învățare cu rezultate măsurabile și liste de verificare pentru finalizare
- **❓ Întrebări de Evaluare**: Întrebări de validare a cunoștințelor pentru fiecare capitol cu rezultate profesionale
- **🛠️ Exerciții Practice**: Activități hands-on cu scenarii reale de implementare și depanare
- **📊 Progresia Abilităților**: Avansare clară de la concepte de bază la modele enterprise cu focus pe dezvoltarea carierei
- **🎓 Cadru de Certificare**: Rezultate de dezvoltare profesională și sistem de recunoaștere comunitară
- **⏱️ Managementul Timpului**: Plan de învățare structurat pe 10 săptămâni cu validare a etapelor

### [v3.1.0] - 2025-09-17

#### Soluții AI Multi-Agent Îmbunătățite
**Această versiune îmbunătățește soluția multi-agent pentru retail cu denumiri mai bune ale agenților și documentație extinsă.**

#### Modificat
- **Terminologie Multi-Agent**: Înlocuit „agent Cora” cu „agent Client” în soluția multi-agent pentru retail pentru o înțelegere mai clară
- **Arhitectura Agentului**: Actualizate toate documentațiile, șabloanele ARM și exemplele de cod pentru a folosi denumirea consecventă „agent Client”
- **Exemple de Configurare**: Modernizate modelele de configurare a agentului cu convenții de denumire actualizate
- **Consistența Documentației**: Asigurate toate referințele folosind denumiri profesionale și descriptive pentru agenți

#### Îmbunătățit
- **Pachetul de Șabloane ARM**: Actualizat retail-multiagent-arm-template cu referințe la agentul Client
- **Diagrame Arhitecturale**: Reîmprospătate diagramele Mermaid cu denumirea actualizată a agentului
- **Exemple de Cod**: Clasele Python și exemplele de implementare folosesc acum denumirea CustomerAgent
- **Variabile de Mediu**: Actualizate toate scripturile de implementare pentru a folosi convențiile CUSTOMER_AGENT_NAME

#### Îmbunătățit
- **Experiența Dezvoltatorului**: Roluri și responsabilități mai clare ale agenților în documentație
- **Pregătire pentru Producție**: Aliniere mai bună cu convențiile de denumire enterprise
- **Materiale de Învățare**: Denumiri de agent intuitive pentru scopuri educaționale
- **Utilizarea Șabloanelor**: Înțelegere simplificată a funcțiilor și modelelor de implementare a agentului

#### Detalii Tehnice
- Actualizate diagramele arhitecturale Mermaid cu referințe la CustomerAgent
- Înlocuite numele claselor CoraAgent cu CustomerAgent în exemplele Python
- Modificate configurațiile JSON din șabloanele ARM pentru a folosi tipul de agent "customer"
- Actualizate variabilele de mediu de la CORA_AGENT_* la pattern-uri CUSTOMER_AGENT_*
- Reîmprospătate toate comenzile de implementare și configurațiile containerelor

### [v3.0.0] - 2025-09-12

#### Schimbări Majore - Focus pe Dezvoltatori AI și Integrare Microsoft Foundry
**Această versiune transformă depozitul într-o resursă completă de învățare axată pe AI, cu integrare Microsoft Foundry.**

#### Adăugat
- **🤖 Parcurs de Învățare AI-First**: Restructurare completă prioritizând dezvoltatorii și inginerii AI
- **Ghid de Integrare Microsoft Foundry**: Documentație cuprinzătoare pentru conectarea AZD cu serviciile Microsoft Foundry
- **Modele de Implementare AI**: Ghid detaliat acoperind selecția modelului, configurarea și strategiile de implementare în producție
- **Laborator de Workshop AI**: Atelier practic de 2-3 ore pentru convertirea aplicațiilor AI în soluții implementabile AZD
- **Cele Mai Bune Practici AI pentru Producție**: Modele pregătite pentru enterprise privind scalarea, monitorizarea și securizarea sarcinilor AI
- **Ghid Specific de Depanare AI**: Soluționarea problemelor pentru modelele Microsoft Foundry, Serviciile Cognitive și problemele de implementare AI
- **Galerie de Șabloane AI**: Colecție selectată de șabloane Microsoft Foundry cu evaluări de complexitate
- **Materiale pentru Workshop**: Structură completă de atelier cu laboratoare practice și materiale de referință

#### Îmbunătățit
- **Structura README**: Focalizată pe dezvoltatori AI cu 45% date despre interesul comunității din Discord Microsoft Foundry
- **Parcurse de Învățare**: Traseu dedicat dezvoltatorilor AI alături de căi tradiționale pentru studenți și ingineri DevOps
- **Recomandări de Șabloane**: Șabloane AI recomandate, inclusiv azure-search-openai-demo, contoso-chat și openai-chat-app-quickstart
- **Integrare Comunitară**: Suport îmbunătățit pentru comunitatea Discord cu canale și discuții specifice AI

#### Focus pe Securitate și Producție
- **Pattern-uri de Identitate Gestionată**: Configurări de autentificare și securitate specifice AI
- **Optimizare Costuri**: Urmărirea utilizării tokenilor și controlul bugetelor pentru sarcinile AI
- **Implementare Multi-Regiune**: Strategii pentru implementarea globală a aplicațiilor AI
- **Monitorizare Performanță**: Metrici specifice AI și integrare Application Insights

#### Calitatea Documentației
- **Structură Linieară a Cursului**: Progresie logică de la modele AI pentru începători la avansați
- **URL-uri Validate**: Toate linkurile către depozite externe verificate și accesibile
- **Referință Completă**: Toate linkurile interne de documentație validate și funcționale
- **Pregătit pentru Producție**: Modele de implementare enterprise cu exemple reale

### [v2.0.0] - 2025-09-09

#### Schimbări Majore - Restructurarea Depozitului și Îmbunătățirea Profesională
**Această versiune reprezintă o revizuire majoră a structurii și prezentării conținutului depozitului.**

#### Adăugat
- **Cadru Structurat de Învățare**: Toate paginile de documentație includ acum secțiuni de Introducere, Obiective de Învățare și Rezultate așteptate
- **Sistem de Navigație**: Adăugate linkuri Lecția Anterioară/Următoare în toată documentația pentru progresie ghidată a învățării
- **Ghid de Studiu**: study-guide.md cuprinzător cu obiective de învățare, exerciții practice și materiale de evaluare
- **Prezentare Profesională**: Eliminat toate iconițele emoji pentru accesibilitate și aspect profesional îmbunătățit
- **Structură îmbunătățită a conținutului**: Organizare și flux al materialelor de învățare optimizate

#### Modificat
- **Format Documentație**: Standardizat toată documentația cu structură consecventă axată pe învățare
- **Flux de Navigație**: Implementată progresie logică prin toate materialele de învățare
- **Prezentare a Conținutului**: Eliminat elemente decorative în favoarea unui format clar și profesional
- **Structura Link-urilor**: Actualizate toate linkurile interne pentru a susține noul sistem de navigație

#### Îmbunătățit
- **Accesibilitate**: Eliminată dependența de emoji pentru o mai bună compatibilitate cu cititoarele de ecran
- **Aspect Profesional**: Prezentare curată, de stil academic potrivită pentru învățare enterprise
- **Experiența de Învățare**: Abordare structurată cu obiective clare și rezultate pentru fiecare lecție
- **Organizarea Conținutului**: Flux logic și conexiune mai bune între subiecte înrudite

### [v1.0.0] - 2025-09-09

#### Lansare Inițială - Depozit Cuprinzător de Învățare AZD

#### Adăugat
- **Structura Documentației de Bază**
  - Serii complete de ghiduri pentru început
  - Documentație cuprinzătoare pentru implementare și aprovizionare
  - Resurse detaliate pentru depanare și ghiduri de debug
  - Instrumente și proceduri de validare pre-implementare

- **Modul Începeți**
  - Bazele AZD: concepte și terminologie esențiale
  - Ghid de Instalare: instrucțiuni specifice platformei
  - Ghid de Configurare: setare mediu și autentificare
  - Primul Proiect: tutorial practic pas cu pas

- **Modul Implementare și Aprovizionare**
  - Ghid de Implementare: documentație completă a fluxului de lucru
  - Ghid de Aprovizionare: Infrastructure as Code cu Bicep
  - Cele mai bune practici pentru implementări în producție
  - Modele de arhitectură multi-serviciu

- **Modul Validare Pre-Implementare**
  - Planificare Capacitate: validarea disponibilității resurselor Azure
  - Selecția SKU: ghid complet pentru nivelurile de serviciu
  - Verificări Pre-flight: scripturi automate de validare (PowerShell și Bash)
  - Instrumente de estimare costuri și planificare bugetară

- **Modul Depanare**
  - Probleme Comune: probleme frecvent întâlnite și soluții
  - Ghid de Debugging: metodologii sistematice de depanare
  - Tehnici și instrumente avansate de diagnosticare
  - Monitorizarea performanței și optimizare

- **Resurse și Referințe**
  - Fișă de Comenzi: referință rapidă pentru comenzi esențiale
  - Glosar: definiții cuprinzătoare de termeni și acronime
  - FAQ: răspunsuri detaliate la întrebări comune
  - Linkuri către resurse externe și conexiuni comunitare

- **Exemple și Șabloane**
  - Exemplu simplu de aplicație web
  - Șablon de implementare site static
  - Configurare aplicație container
  - Modele de integrare bază de date
  - Exemple de arhitectură microservicii
  - Implementări funcții serverless

#### Caracteristici
- **Suport Multi-Platformă**: Ghiduri de instalare și configurare pentru Windows, macOS și Linux
- **Niveluri Multiple de Competență**: Conținut destinat studenților până la dezvoltatori profesioniști
- **Focus Practic**: Exemple practice și scenarii din lumea reală
- **Acoperire Cuprinzătoare**: De la concepte de bază la modele enterprise avansate
- **Abordare Securitate Prioritară**: Cele mai bune practici de securitate integrate pe tot parcursul
- **Optimizare Costuri**: Îndrumări pentru implementări rentabile și gestionarea resurselor

#### Calitatea Documentației
- **Exemple de Cod Detaliate**: Exemple practice și testate de cod
- **Instrucțiuni Pas cu Pas**: Îndrumări clare și acționabile
- **Gestionare Cuprinzătoare a Erorilor**: Depanare pentru probleme comune
- **Integrare Cele Mai Bune Practici**: Standardele și recomandările industriei
- **Compatibilitate Versiuni**: Actualizat cu cele mai noi servicii Azure și funcționalități azd

## Îmbunătățiri Viitoare Planificate

### Versiunea 3.1.0 (Planificată)
#### Extindere Platformă AI
- **Suport Multi-Model**: Modele de integrare pentru Hugging Face, Azure Machine Learning și modele personalizate
- **Framework-uri Agenți AI**: Șabloane pentru implementări LangChain, Semantic Kernel și AutoGen
- **Modele RAG Avansate**: Opțiuni monument baze de date vectoriale în afara Azure AI Search (Pinecone, Weaviate etc.)
- **Observabilitate AI**: Monitorizare îmbunătățită a performanței modelelor, utilizării tokenilor și calității răspunsurilor

#### Experiența Dezvoltatorului
- **Extensie VS Code**: Experiență de dezvoltare integrată AZD + Microsoft Foundry
- **Integrare GitHub Copilot**: Generare șabloane AZD asistată de AI
- **Tutoriale Interactive**: Exerciții practice de codare cu validare automată pentru scenarii AI
- **Conținut Video**: Tutoriale video suplimentare pentru învățare vizuală axată pe implementări AI

### Versiunea 4.0.0 (Planificată)
#### Modele AI Enterprise
- **Cadru de Guvernanță**: Guvernanță AI, conformitate și trasee de audit pentru modele AI
- **AI Multi-Chiriaș**: Modele pentru deservirea mai multor clienți cu servicii AI izolate
- **Implementare AI la Edge**: Integrare cu Azure IoT Edge și instanțe containerizate
- **AI Cloud Hibrid**: Modele de implementare multi-cloud și hibride pentru sarcini AI

#### Caracteristici Avansate
- **Automatizare Pipeline AI**: Integrare MLOps cu pipeline-uri Azure Machine Learning
- **Securitate Avansată**: Modele zero-trust, endpoint-uri private și protecție avansată împotriva amenințărilor
- **Optimizare Performanță**: Tuning avansat și strategii de scalare pentru aplicații AI de mare volum
- **Distribuție Globală**: Modele de livrare conținut și caching la margine pentru aplicații AI

### Versiunea 3.0.0 (Planificată) - Înlocuită de Lansarea Actuală
#### Adăugări Propuse - Acum Implementate în v3.0.0
- ✅ **Conținut Focusat pe AI**: Integrare completă Microsoft Foundry (Finalizat)
- ✅ **Tutoriale Interactive**: Laborator practic AI (Finalizat)
- ✅ **Modul Securitate Avansat**: Modele de securitate specifice AI (Finalizat)
- ✅ **Optimizare Performanță**: Strategii de tuning pentru sarcini AI (Finalizat)

### Versiunea 2.1.0 (Planificată) - Parțial Implementată în v3.0.0
#### Îmbunătățiri Minore - Unele Finalizate în Lansarea Curentă
- ✅ **Exemple Suplimentare**: Scenarii de implementare AI (Finalizat)
- ✅ **FAQ Extins**: Întrebări și depanare specifice AI (Finalizat)
- **Integrare Instrumente**: Ghiduri îmbunătățite pentru integrare IDE și editor
- ✅ **Extindere Monitorizare**: Modele de monitorizare și alertare AI (Finalizat)

#### În Continuare Planificate pentru Versiuni Viitoare
- **Documentație Prietenoasă pentru Mobil**: Design adaptiv pentru învățare mobilă
- **Acces Offline**: Pachete de documentație descărcabile
- **Integrare IDE Îmbunătățită**: Extensie VS Code pentru fluxuri de lucru AZD + AI
- **Tablou de Bord Comunitar**: Metrici în timp real și urmărirea contribuțiilor comunității

## Contribuții la Changelog

### Raportarea Schimbărilor
La contribuirea în acest depozit, vă rugăm să asigurați că înregistrările changelog includ:

1. **Numărul Versiunii**: Urmând versionarea semantică (major.minor.patch)
2. **Data**: Data lansării sau actualizării în format YYYY-MM-DD
3. **Categorie**: Adăugat, Modificat, Depreciat, Eliminat, Reparat, Securitate
4. **Descriere Clară**: Descriere concisă a schimbărilor realizate
5. **Evaluarea Impactului**: Cum afectează schimbările utilizatorii existenți

### Categorii de Schimbări

#### Adăugat
- Funcționalități noi, secțiuni de documentație sau capabilități
- Exemple noi, șabloane sau resurse de învățare
- Instrumente suplimentare, scripturi sau utilitare

#### Modificat
- Modificări ale funcționalității sau documentației existente
- Actualizări pentru îmbunătățirea clarității sau acurateții
- Restructurarea conținutului sau organizării

#### Depreciat
- Funcționalități sau abordări care sunt eliminate treptat
- Secțiuni de documentație planificate pentru eliminare
- Metode care au alternative mai bune

#### Eliminat
- Funcționalități, documentație sau exemple care nu mai sunt relevante
- Informații depășite sau abordări depreciate
- Conținut redundant sau consolidat

#### Reparat
- Corecții de erori în documentație sau cod
- Rezolvarea problemelor raportate
- Îmbunătățiri de acuratețe sau funcționalitate

#### Securitate
- Îmbunătățiri sau corecții legate de securitate
- Actualizări ale celor mai bune practici de securitate
- Rezolvarea vulnerabilităților de securitate

### Ghiduri pentru Versionare Semantică

#### Versiune Majoră (X.0.0)
- Schimbări majore care necesită acțiune din partea utilizatorului
- Restructurări semnificative ale conținutului sau organizării
- Modificări care schimbă abordarea sau metodologia fundamentală

#### Versiune Minoră (X.Y.0)
- Funcționalități noi sau adaosuri de conținut
- Îmbunătățiri care păstrează compatibilitatea retroactivă
- Exemple, instrumente sau resurse suplimentare

#### Versiune Patch (X.Y.Z)
- Corecții de erori și remedieri
- Îmbunătățiri minore ale conținutului existent
- Clarificări și mici perfecționări

## Feedback și Sugestii Comunitare

Încurajăm activ feedback-ul comunității pentru a îmbunătăți această resursă de învățare:

### Cum să Oferiți Feedback
- **GitHub Issues**: Raportați probleme sau sugerați îmbunătățiri (issue-uri specifice AI sunt binevenite)
- **Discuții Discord**: Partajați idei și interacționați cu comunitatea Microsoft Foundry
- **Pull Requests**: Contribuiți direct cu îmbunătățiri de conținut, mai ales șabloane și ghiduri AI
- **Microsoft Foundry Discord**: Participați în canalul #Azure pentru discuții AZD + AI
- **Forumuri Comunitare**: Participați în discuții mai largi de dezvoltatori Azure

### Categorii de Feedback
- **Acuratețe Conținut AI**: Corecturi privind integrarea și implementarea serviciilor AI
- **Experiență de Învățare**: Sugestii pentru fluxuri de învățare îmbunătățite pentru dezvoltatorii AI
- **Conținut AI Lipsă**: Cereri pentru mai multe șabloane, modele sau exemple AI
- **Accesibilitate**: Îmbunătățiri pentru nevoi diverse de învățare
- **Integrare Instrumente AI**: Sugestii pentru integrare mai bună a fluxului de lucru de dezvoltare AI
- **Modele de Producție AI**: Cereri pentru modele enterprise de implementare AI

### Angajament de Răspuns
- **Răspuns la Probleme**: În maximum 48 de ore pentru probleme raportate
- **Cereri de Funcționalități**: Evaluare în termen de o săptămână
- **Contribuții Comunitare**: Revizuire în termen de o săptămână
- **Probleme de Securitate**: Prioritate imediată cu răspuns rapid

## Program de Mentenanță

### Actualizări Regulate
- **Revizii Lunare**: Acuratețea conținutului și validarea linkurilor
- **Actualizări Trimestriale**: Adaosuri majore de conținut și îmbunătățiri
- **Revizii Semestriale**: Restructurare și îmbunătățire cuprinzătoare
- **Lansări Anuale**: Actualizări majore de versiune cu îmbunătățiri semnificative

### Monitorizare și Asigurarea Calității
- **Testare Automatizată**: Validare regulată a exemplelor de cod și a linkurilor
- **Integrarea Feedback-ului Comunității**: Incorporare regulată a sugestiilor utilizatorilor
- **Actualizări Tehnologice**: Aliniere cu cele mai recente servicii Azure și lansări azd
- **Audituri de Accesibilitate**: Revizuire regulată pentru principii de design incluziv

## Politica de Suport pentru Versiuni

### Suport pentru Versiunea Curentă
- **Ultima Versiune Majoră**: Suport complet cu actualizări regulate
- **Versiunea Majoră Anterioară**: Actualizări de securitate și remedieri critice timp de 12 luni
- **Versiuni Moștenite**: Doar suport comunitar, fără actualizări oficiale

### Ghid de Migrare
Când sunt lansate versiunile majore, oferim:
- **Ghiduri de Migrare**: Instrucțiuni pas cu pas pentru tranziție
- **Note de Compatibilitate**: Detalii despre schimbările incompatibile
- **Suport pentru Instrumente**: Scripturi sau utilitare pentru a ajuta la migrare
- **Suport Comunitar**: Forumuri dedicate întrebărilor despre migrare

---

**Navigare**
- **Lecția Anterioară**: [Ghid de Studiu](resources/study-guide.md)
- **Lecția Următoare**: Întoarce-te la [README Principal](README.md)

**Rămâi Actualizat**: Urmărește acest depozit pentru notificări despre noi lansări și actualizări importante ale materialelor de învățare.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Pakeitimų žurnalas - AZD Pradedantiesiems

## Įvadas

Šis pakeitimų žurnalas dokumentuoja visus reikšmingus pakeitimus, atnaujinimus ir patobulinimus AZD Pradedantiesiems saugykloje. Laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį pakeitimų žurnalą, jūs:
- Būsite informuoti apie naujas funkcijas ir turinio papildymus
- Suprasite patobulinimus esamoje dokumentacijoje
- Stebėsite klaidų taisymus ir pataisas, kad užtikrintumėte tikslumą
- Seksite mokymosi medžiagos vystymąsi laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pakeitimų įrašus, galėsite:
- Nustatyti naują turinį ir išteklius, prieinamus mokymuisi
- Suprasti, kurios skiltys buvo atnaujintos arba patobulintos
- Planuoti savo mokymosi kelią remiantis naujausia medžiaga
- Teikti atsiliepimus ir pasiūlymus tolimesniems patobulinimams

## Versijų istorija

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**Ši versija patobulina README.md skyrių navigaciją su išplėsta lentele.**

#### Changed
- **Course Map Table**: Patobulinta su tiesioginėmis pamokų nuorodomis, trukmės įverčiais ir sudėtingumo vertinimais
- **Folder Cleanup**: Pašalinti pasikartojantys seni aplankai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Patikrinta visos 21+ vidinės nuorodos Kurso žemėlapio lentelėje

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Ši versija atnaujina produktų nuorodas pagal naujausią Microsoft prekės ženklą.**

#### Changed
- **Azure AI Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas, kad atitiktų dabartinį prekės ženklą

#### Files Updated
- `README.md` - Pagrindinis kurso puslapis
- `changelog.md` - Versijų istorija
- `course-outline.md` - Kurso struktūra
- `docs/chapter-02-ai-development/agents.md` - Vadovas apie AI agentus
- `examples/README.md` - Pavyzdžių dokumentacija
- `workshop/README.md` - Dirbtuvių pradžios puslapis
- `workshop/docs/index.md` - Dirbtuvių indeksas
- `workshop/docs/instructions/*.md` - Visi dirbtuvių instrukcijų failai

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Ši versija pertvarko dokumentaciją į atskirus skyrių aplankus aiškesnei navigacijai.**

#### Folder Renames
Seni aplankai pakeisti skyriaus numeruotais aplankais:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridėta nauja: `docs/chapter-05-multi-agent/`

#### File Migrations
| Failas | Iš | Į |
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
- **📚 Chapter README files**: Sukurti README.md failai kiekviename skyriaus aplanke su:
  - Mokymosi tikslais ir trukme
  - Pamokų lentele su aprašymais
  - Greito pradžios komandomis
  - Navigacija į kitus skyrius

#### Changed
- **🔗 Updated all internal links**: 78+ kelių atnaujinta visuose dokumentacijos failuose
- **🗺️ Main README.md**: Atnaujintas Kurso žemėlapis su nauja skyrių struktūra
- **📝 examples/README.md**: Atnaujinti tarpusavio nuorodų į skyriaus aplankus

#### Removed
- Seni aplankų struktūra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Ši versija pridėjo skyrių navigacijos README failus (vėliau pakeista v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Ši versija prideda išsamų vadovą AI agentų diegimui su Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Pilnas vadovas, apimantis:
  - Kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trijų greito paleidimo agentų šablonai (Foundry Agents, Prompty, RAG)
  - Agentų architektūros modeliai (vienas agentas, RAG, keli agentai)
  - Įrankių konfigūracija ir pritaikymas
  - Stebėsena ir metrikų sekimas
  - Sąnaudų apsvarstymai ir optimizavimas
  - Dažniausiai pasitaikančios problemos ir jų sprendimas
  - Trys praktinės užduotys su sėkmės kriterijais

#### Content Structure
- **Introduction**: Agentų koncepcijos pradedantiesiems
- **Quick Start**: Diegti agentus su `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Agentų modelių vizualinės schemos
- **Configuration**: Įrankių nustatymas ir aplinkos kintamieji
- **Monitoring**: Application Insights integracija
- **Exercises**: Progresyvios praktinės užduotys (kiekviena 20–45 minučių)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Ši versija atnaujina vystymo konteinerio konfigūraciją su moderniais įrankiais ir geresniais numatytaisiais nustatymais AZD mokymosi patirčiai.**

#### Changed
- **🐳 Base Image**: Atnaujinta iš `python:3.12-bullseye` į `python:3.12-bookworm` (naujausias Debian stable)
- **📛 Container Name**: Pervadinta iš "Python 3" į "AZD for Beginners" dėl aiškumo

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` su įjungta Bicep palaikymu
  - `node:20` (LTS versija AZD šablonams)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerių programų diegimui

- **🔌 Port Forwarding**: Iš anksto sukonfigūruoti prievadai įprastam vystymui:
  - 8000 (MkDocs peržiūra)
  - 3000 (Tinklalapiai)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Patobulintas Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions palaikymas
  - `ms-azuretools.vscode-docker` - Docker palaikymas
  - `ms-azuretools.vscode-bicep` - Bicep kalbos palaikymas
  - `ms-azure-devtools.azure-resource-groups` - Azure išteklių valdymas
  - `yzhang.markdown-all-in-one` - Markdown redagavimas
  - `DavidAnson.vscode-markdownlint` - Markdown lint tikrinimas
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code Settings**: Pridėti numatyti nustatymai Python interpretatoriui, formatavimui išsaugant ir tarpų šalinimui

- **📦 Updated requirements-dev.txt**:
  - Pridėtas MkDocs minify įskiepis
  - Pridėtas pre-commit kodo kokybei
  - Pridėti Azure SDK paketai (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Dabar tikrina AZD ir Azure CLI įdiegimą konteinerio paleidimo metu

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Ši versija reikšmingai patobulina README.md, kad jis būtų prieinamesnis pradedantiesiems, ir prideda esminių išteklių AI kūrėjams.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Aiškus paaiškinimas, kada naudoti kurią priemonę su praktiniais pavyzdžiais
- **🌟 Awesome AZD Links**: Tiesioginės nuorodos į bendruomenės šablonų galeriją ir prisidėjimo išteklius:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ paruoštų diegimui šablonų
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Bendruomenės prisidėjimas
- **🎯 Quick Start Guide**: Supaprastinta 3 žingsnių pradžia (Įdiegti → Prisijungti → Diegti)
- **📊 Experience-Based Navigation Table**: Aiškios gairės, kur pradėti priklausomai nuo kūrėjų patirties

#### Changed
- **README Structure**: Pertvarkyta taip, kad svarbiausia informacija būtų pirmiau
- **Introduction Section**: Perrašyta, kad paaiškintų "The Magic of `azd up`" visiškai pradedantiesiems
- **Removed Duplicate Content**: Pašalinta pasikartojanti trikčių šalinimo dalis
- **Troubleshooting Commands**: Ištaisyta `azd logs` nuoroda, pakeista į galiojantį `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Pridėta `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Invalid Command References**: Pašalintos likusios `azd logs` nuorodos iš README trikčių šalinimo skilties

#### Notes
- **Scope**: Pakeitimai taikyti pagrindiniam README.md ir resources/cheat-sheet.md
- **Target Audience**: Patobulinimai skirti specialiai AZD naujokams

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Ši versija ištaiso neegzistuojančias AZD komandas visoje dokumentacijoje, užtikrindama, kad visi kodo pavyzdžiai naudotų galiojančią Azure Developer CLI sintaksę.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Išsamus auditavimas ir neteisingų komandų taisymas:
  - `azd logs` (neegzistuoja) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` subkomandos (neegzistuoja) → pakeistos į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (neegzistuoja) → pašalinta arba pakeista galiojančiomis alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flag'ai (neegzistuoja) → pašalinti
  - `azd provision --what-if/--rollback` flag'ai (neegzistuoja) → atnaujinti naudojant `--preview`
  - `azd config validate` (neegzistuoja) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neegzistuoja) → pašalintos

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Didelis komandų nuorodų perrašymas
  - `docs/deployment/deployment-guide.md`: Ištaisyta atstatymo ir diegimo strategijos
  - `docs/troubleshooting/debugging.md`: Ištaisyta žurnalų analizės skiltis
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Ištaisyta AZD derinimo dalis
  - `docs/getting-started/azd-basics.md`: Ištaisyti stebėjimo komandų pavyzdžiai
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir derinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Ištaisyti pagalbos ir versijos pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Ištaisyti žurnalų peržiūros komandos
  - `docs/pre-deployment/coordination-patterns.md`: Ištaisyti agentų derinimo komandų pavyzdžiai

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Pakeista kieta nurodyta `1.5.0` versija į generinę `1.x.x` su nuoroda į leidimus

#### Changed
- **Rollback Strategies**: Dokumentacija atnaujinta naudojant Git pagrįstą atstatymą (AZD neturi vietinio atstatymo)
- **Log Viewing**: `azd logs` nuorodos pakeistos į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Performance Section**: Pašalinti neegzistuojantys paralelinio / dalinio diegimo flag'ai, pateiktos galiojančios alternatyvos

#### Technical Details
- **Galiojantys AZD komandų pavadinimai**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galimi azd monitor parametrai**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patikrinimas**: Komandos patikrintos su Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dirbtuvės užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvius dirbtuvių modulius, ištaiso visus neveikiančius dokumentacijos nuorodų saitų ir pagerina bendrą turinio kokybę AI kūrėjams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujas indėlių gairių dokumentas su:
  - Aiškiomis instrukcijomis, kaip pranešti apie problemas ir siūlyti pakeitimus
  - Dokumentacijos standartais naujam turiniui
  - Kodo pavyzdžių gairėmis ir commit žinučių konvencijomis
  - Informacija apie bendruomenės įsitraukimą

#### Užbaigta
- **🎯 Workshop Module 7 (Wrap-up)**: Visiškai užbaigtas užbaigimo modulis su:
  - Išsamiu dirbtuvių pasiekimų apibendrinimu
  - Skyriumi apie įgytas pagrindines koncepcijas, apimančiomis AZD, šablonus ir AI Foundry
  - Rekomendacijomis tolesnei mokymosi kelionei
  - Dirbtuvių iššūkių pratimais su sunkumo įvertinimais
  - Bendruomenės atsiliepimų ir palaikymo nuorodomis

- **📚 Workshop Module 3 (Deconstruct)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot su MCP serverių aktyvacijos gairėmis
  - AZD šablonų aplanko struktūros supratimu
  - Infrastructure-as-code (Bicep) organizacijos modeliais
  - Praktinių laboratorinių užduočių instrukcijomis

- **🔧 Workshop Module 6 (Teardown)**: Užbaigta su:
  - Išteklių valymo ir sąnaudų valdymo tikslais
  - `azd down` naudojimu saugiam infrastruktūros išjungimui
  - Minkštai ištrintų kognityvinių paslaugų atkūrimo gairėmis
  - Papildomomis eksperimentavimo gairėmis GitHub Copilot ir Azure portalo tyrinėjimui

#### Ištaisyta
- **🔗 Neveikiančių nuorodų taisymai**: Išspręsta 15+ vidinių dokumentacijos nuorodų:
  - `docs/ai-foundry/ai-model-deployment.md`: Ištaisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyti ai-model-deployment.md ir production-ai-practices.md keliai
  - `docs/getting-started/first-project.md`: Pakeistas neegzistuojantis cicd-integration.md į deployment-guide.md
  - `examples/retail-scenario.md`: Ištaisyti DUK ir trikčių šalinimo gairių keliai
  - `examples/container-app/microservices/README.md`: Pataisyti kursų pradžios ir diegimo gairių keliai
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujintos AI skyriaus nuorodos
  - `course-outline.md`: Ištaisyti instruktoriaus gido ir AI dirbtuvių laboratorijų nuorodų keliai

- **📅 Dirbtuvių būsenos baneris**: Atnaujinta iš "Under Construction" į aktyvią dirbtuvių būseną su 2026 m. vasario data

- **🔗 Dirbtuvių navigacija**: Ištaisyti neveikiantys navigacijos saitai dirbtuvių README.md rodantys į neegzistuojantį lab-1-azd-basics aplanką

#### Pakeista
- **Dirbtuvių pristatymas**: Pašalinta "under construction" įspėjimo žyma, dirbtuvės dabar baigtos ir paruoštos naudoti
- **Navigacijos nuoseklumas**: Užtikrinta, kad visi dirbtuvių moduliai turi tinkamą tarpusavio navigaciją
- **Mokymosi takelio nuorodos**: Atnaujintos skyriaus kryžminės nuorodos, kad naudotų teisingus microsoft-foundry kelius

#### Patvirtinta
- ✅ Visos angliškos markdown bylos turi galiojančias vidines nuorodas
- ✅ Dirbtuvių moduliai 0-7 yra pilni mokymosi tikslų
- ✅ Navigacija tarp skyrių ir modulių veikia tinkamai
- ✅ Turinys tinkamas AI kūrėjams, naudojantiems Microsoft AZD
- ✅ Kalba ir struktūra pritaikyta pradedantiesiems
- ✅ CONTRIBUTING.md suteikia aiškias gaires bendruomenės dalyviams

#### Techninis įgyvendinimas
- **Nuorodų patvirtinimas**: Automatizuotas PowerShell skriptas patikrino visas .md vidines nuorodas
- **Turinio auditavimas**: Rankinė dirbtuvių užbaigtumo ir pritaikomumo pradedantiesiems peržiūra
- **Navigacijos sistema**: Taikomi nuoseklūs skyrių ir modulių navigacijos modeliai

#### Pastabos
- **Aprėptis**: Pakeitimai taikyti tik angliškai dokumentacijai
- **Vertimai**: Vertimų aplankai šioje versijoje nebuvo atnaujinti (automatizuoti vertimai bus sinchronizuoti vėliau)
- **Dirbtuvių trukmė**: Užbaigtos dirbtuvės dabar teikia 3–4 valandų praktinį mokymą

---

### [v3.8.0] - 2025-11-19

#### Išplėstinė dokumentacija: stebėjimas, saugumas ir daugiaagentės koordinacijos modeliai
**Ši versija prideda išsamius A klasės pamokas apie Application Insights integraciją, autentifikacijos modelius ir daugiaagentės koordinacijos modelius gamybos diegimams.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: faile `docs/pre-deployment/application-insights.md`:
  - AZD orientuotas diegimas su automatinio teikimo paruošimu
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pritaikyta telemetrija (1200+ eilučių)
  - AI/LLM stebėjimo modeliai (Azure OpenAI žetonų/išlaidų sekimas)
  - 6 Mermaid diagramos (architektūra, paskirstytas sekimas, telemetrijos srautas)
  - 3 praktinės užduotys (įspėjimai, prietaisų skydeliai, AI stebėjimas)
  - Kusto užklausų pavyzdžiai ir sąnaudų optimizavimo strategijos
  - Gyvų metrų srautas ir realaus laiko derinimas
  - 40–50 minučių mokymosi trukmė su gamybai paruoštais modeliais

- **🔐 Autentifikacijos ir saugumo modelių pamoka**: faile `docs/getting-started/authsecurity.md`:
  - 3 autentifikacijos modeliai (connection strings, Key Vault, managed identity)
  - Pilni Bicep infrastruktūros šablonai saugioms diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilnos užduotys (įjungti managed identity, user-assigned identity, Key Vault rotacija)
  - Saugumo gerosios praktikos ir RBAC konfigūracijos
  - Trikčių šalinimo gidas ir sąnaudų analizė
  - Gamybai paruošti be slaptažodžių autentifikacijos modeliai

- **🤖 Daugiaagentės koordinacijos modelių pamoka**: faile `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinacijos modeliai (sequential, parallel, hierarchical, event-driven, consensus)
  - Pilna orkestratoriaus paslaugos implementacija (Python/Flask, 1500+ eilučių)
  - 3 specializuotos agente implementacijos (Research, Writer, Editor)
  - Service Bus integracija pranešimų eilėms
  - Cosmos DB būsenos valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramos, vaizduojančios agentų sąveikas
  - 3 pažangios užduotys (timeout valdymas, retry logika, circuit breaker)
  - Sąnaudų suskaidymas ($240-565/month) su optimizavimo strategijomis
  - Application Insights integracija stebėjimui

#### Patobulinta
- **Pre-deployment skyrius**: Dabar apima išsamius stebėjimo ir koordinacijos modelius
- **Getting Started skyrius**: Išplėstas profesionaliais autentifikacijos modeliais
- **Gamybinis parengimas**: Pilnas aprėptis nuo saugumo iki stebėjimo
- **Kurso planas**: Atnaujintas, kad nurodytų naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi progresas**: Geresnė saugumo ir stebėjimo integracija per visą kursą
- **Dokumentacijos kokybė**: Nuoseklūs A klasės standartai (95–97%) naujose pamokose
- **Gamybiniai modeliai**: Pilnas galutinis aprėptis įmonės diegimams

#### Patobulinta
- **Kūrėjų patirtis**: Aiškus kelias nuo vystymo iki gamybinio stebėjimo
- **Saugumo standartai**: Profesionali praktika autentifikacijai ir slaptumų valdymui
- **Observability**: Pilna Application Insights integracija su AZD
- **AI darbo krūviai**: Specializuotas stebėjimas Azure OpenAI ir daugiaagentėms sistemoms

#### Patvirtinta
- ✅ Visos pamokos turi pilnai veikantį kodą (ne fragmentus)
- ✅ Mermaid diagramos vizualiam mokymuisi (iš viso 19 per 3 pamokas)
- ✅ Praktinės užduotys su patvirtinimo žingsniais (iš viso 9)
- ✅ Gamybai paruošti Bicep šablonai diegiami per `azd up`
- ✅ Sąnaudų analizė ir optimizavimo strategijos
- ✅ Trikčių šalinimo gidai ir gerosios praktikos
- ✅ Žinių patikros su patvirtinimo komandomis

#### Dokumentacijos vertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsami stebėjimo instrukcija
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo modeliai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios daugiaagentės architektūros
- **Bendras naujas turinys**: - Nuoseklūs aukštos kokybės standartai

#### Techninis įgyvendinimas
- **Application Insights**: Log Analytics + pritaikyta telemetrija + paskirstytas sekimas
- **Autentifikacija**: Managed Identity + Key Vault + RBAC modeliai
- **Daugiaagentė**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Stebėjimas**: Gyvi metrikos srautai + Kusto užklausos + įspėjimai + prietaisų skydeliai
- **Sąnaudų valdymas**: Mėginimo strategijos, saugojimo politikos, biudžeto kontrolė

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Azure OpenAI pavyzdys
**Ši versija pagerina dokumentacijos kokybę visame saugykloje ir prideda pilną Azure OpenAI diegimo pavyzdį su GPT-4 pokalbių sąsaja.**

#### Pridėta
- **🤖 Azure OpenAI pokalbių pavyzdys**: Pilnas GPT-4 diegimas su veikiančia implementacija faile `examples/azure-openai-chat/`:
  - Pilna Azure OpenAI infrastruktūra (GPT-4 modelio diegimas)
  - Python komandų eilutės pokalbių sąsaja su pokalbių istorija
  - Key Vault integracija saugiam API rakto saugojimui
  - Žetonų naudojimo sekimas ir sąnaudų įvertinimas
  - Srautų ribojimas ir klaidų valdymas
  - Išsamus README su 35–45 minučių diegimo gidu
  - 11 gamybai paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos pratimai**: Pridėti praktiniai pratimai konfigūracijos gide:
  - 1 pratimas: Daugiavaržtinė aplinkos konfigūracija (15 minučių)
  - 2 pratimas: Slaptumų valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patvirtinimo veiksmai
- **✅ Diegimo patikrinimas**: Pridėtas patikrinimo skyrius diegimo gide:
  - Sveikatos tikrinimo procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Laukiami išvesties rezultatai visuose diegimo komandų žingsniuose
  - Greita trikčių šalinimo nuoroda

#### Patobulinta
- **examples/README.md**: Atnaujinta iki A klasės kokybės (93%):
  - Pridėtas azure-openai-chat į visas atitinkamas sekcijas
  - Vietinių pavyzdžių skaičius atnaujintas nuo 3 iki 4
  - Pridėta į AI programų pavyzdžių lentelę
  - Integruota į Greitą pradžią skirta tarpinio lygio vartotojams
  - Pridėta į Microsoft Foundry šablonų skyrių
  - Atnaujintas palyginimo matrica ir technologijų paieškos skyriai
- **Dokumentacijos kokybė**: Pagerinta iš B+ (87%) → A- (92%) per docs aplanką:
  - Pridėtos laukiamo išvesties reikšmės prie svarbių komandų pavyzdžių
  - Įtraukti patvirtinimo veiksmai konfigūracijos pakeitimams
  - Sustiprintas praktinis mokymasis su veiksminiais pratimais

#### Pakeista
- **Mokymosi progresas**: Geresnė AI pavyzdžių integracija tarpinio lygio mokiniams
- **Dokumentacijos struktūra**: Daugiau veiksmo užduočių su aiškiais rezultatais
- **Patikrinimo procesas**: Pridėti aiškūs sėkmės kriterijai pagrindiniuose darbo eigos žingsniuose

#### Patobulinta
- **Kūrėjų patirtis**: Azure OpenAI diegimas dabar užtrunka 35–45 minutes (vietoje 60–90 minučių sudėtingiems alternatyvams)
- **Sąnaudų skaidrumas**: Aiškūs sąnaudų įverčiai ($50-200/month) Azure OpenAI pavyzdžiui
- **Mokymosi takas**: AI kūrėjams suteiktas aiškus įėjimo taškas su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklios laukiamo išvesties reikšmės ir patvirtinimo žingsniai

#### Patvirtinta
- ✅ Azure OpenAI pavyzdys visiškai veikia su `azd up`
- ✅ Visos 11 implementacijos bylų sintaksiškai teisingos
- ✅ README instrukcijos atitinka faktinę diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos 8+ vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra pasikartojančių išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninis įgyvendinimas
- **Azure OpenAI architektūra**: GPT-4 + Key Vault + Container Apps modelis
- **Saugumas**: Paruošta Managed Identity, slaptumai Key Vault
- **Stebėjimas**: Application Insights integracija
- **Sąnaudų valdymas**: Žetonų sekimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda pilnam paruošimui

### [v3.6.0] - 2025-11-19

#### Pagrindinis atnaujinimas: Container App diegimo pavyzdžiai
**Ši versija pristato išsamius, gamybai paruoštus konteinerizuotų aplikacijų diegimo pavyzdžius, naudojant Azure Developer CLI (AZD), su pilna dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Container App pavyzdžiai**: Nauji vietiniai pavyzdžiai faile `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Išsamus konteinerizuotų diegimų apžvalga, greitas startas, gamyba ir pažangūs modeliai
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Pradedantiesiems pritaikytas REST API su scale-to-zero, sveikatos patikromis, stebėjimu ir trikčių šalinimu
  - [Microservices Architecture](../../examples/container-app/microservices): Gamybai paruoštas kelių paslaugų diegimas (API Gateway, Product, Order, User, Notification), asinchroniniai pranešimai, Service Bus, Cosmos DB, Azure SQL, paskirstytas sekimas, blue-green/canary diegimas
- **Gerosios praktikos**: Saugumas, stebėjimas, sąnaudų optimizavimas ir CI/CD gairės konteinerizuotiems krūviams
- **Kodo pavyzdžiai**: Pilni `azure.yaml`, Bicep šablonai ir daugiakalbių paslaugų implementacijos (Python, Node.js, C#, Go)
- **Testavimas ir trikčių šalinimas**: Visiško taikymo testavimo scenarijai, stebėjimo komandos, trikčių šalinimo gairės

#### Pakeista
- **README.md**: Atnaujintas, kad būtų pabrėžti ir susieti nauji container app pavyzdžiai pagal „Local Examples - Container Applications“
- **examples/README.md**: Atnaujinta, kad pabrėžtų container app pavyzdžius, pridėtų palyginimo matricos įrašus ir atnaujintų technologijų/architektūros nuorodas
- **Course Outline & Study Guide**: Atnaujinta, kad nuorodose būtų nauji konteinerių programų pavyzdžiai ir diegimo modeliai atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai gali būti diegiami su `azd up` ir atitinka geriausias praktikas
- ✅ Dokumentacijos kryžminiai saitai ir naršymas atnaujinti
- ✅ Pavyzdžiai apima nuo pradedančiųjų iki pažangių scenarijų, įskaitant gamybines mikroservisų sistemas

#### Pastabos
- **Apimtis**: tik anglų dokumentacija ir pavyzdžiai
- **Tolimesni veiksmai**: Išplėsti papildomais pažangiais konteinerių modeliais ir CI/CD automatizavimuose būsimuose leidimuose

### [v3.5.0] - 2025-11-19

#### Produkto pervadinimas: Microsoft Foundry
**Ši versija įgyvendina visapusišką produkto pavadinimo keitimą iš "Microsoft Foundry" į "Microsoft Foundry" visuose anglų dokumentuose, atspindint Microsoft oficialų prekinio ženklo pakeitimą.**

#### Pakeista
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų dokumentacijoje `docs/` aplanke
  - Pervardintas aplankas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervardytas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso: 23 turinio nuorodos atnaujintos 7 dokumentacijos failuose

- **📁 Aplankų struktūros pakeitimai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nuorodos atnaujintos, kad atitiktų naują aplankų struktūrą
  - Naršymo nuorodos patikrintos visuose dokumentuose

- **📄 Failų pervardinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Visos vidinės nuorodos atnaujintos, kad nurodytų naują failo pavadinimą

#### Atnaujinti failai
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigacijos nuorodų atnaujinimai
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produkto pavadinimo nuorodos atnaujinimai
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 nuorodos atnaujinimai (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 kryžminės nuorodos atnaujinimai
  - `docs/getting-started/first-project.md` - 2 skyriaus navigacijos nuorodos atnaujinimai
  - `docs/getting-started/installation.md` - 2 kito skyriaus nuorodos atnaujinimai
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 nuorodos atnaujinimai (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijos nuoroda atnaujinta
  - `docs/troubleshooting/debugging.md` - 1 navigacijos nuoroda atnaujinta

- **Kurso struktūros failai** (2 failai):
  - `README.md` - 17 nuorodų atnaujinta (kurso apžvalga, skirsnių pavadinimai, šablonų skyrius, bendruomenės įžvalgos)
  - `course-outline.md` - 14 nuorodų atnaujinta (apžvalga, mokymosi tikslai, skyrių ištekliai)

#### Patvirtinta
- ✅ Nėra likusių "ai-foundry" aplanko kelių nuorodų anglų dokumentuose
- ✅ Nėra likusių "Microsoft Foundry" produkto pavadinimo nuorodų anglų dokumentuose
- ✅ Visi naršymo saitai veikia su nauja aplankų struktūra
- ✅ Failų ir aplankų pervadinimai sėkmingai atlikti
- ✅ Kryžminės nuorodos tarp skyrių patikrintos

#### Pastabos
- **Apimtis**: pakeitimai taikomi tik anglų dokumentacijai `docs/` aplanke
- **Vertimai**: Vertimų aplankai (`translations/`) šioje versijoje nebuvo atnaujinti
- **Dirbtuvės**: Dirbtuvių medžiaga (`workshop/`) šioje versijoje nebuvo atnaujinta
- **Pavyzdžiai**: Pavyzdžių failai vis dar gali nurodyti seną pavadinimą (tai bus sprendžiama būsimame atnaujinime)
- **Išorinės nuorodos**: Išoriniai URL ir GitHub saugyklos nuorodos liko nepakitusios

#### Migracijos vadovas prisidedantiems
Jei turite vietinių šakų arba dokumentacijos, nurodančios seną struktūrą:
1. Atnaujinkite aplankų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos vis dar veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir validavimo patobulinimai
**Ši versija pristato išsamią palaikymą naujai Azure Developer CLI peržiūros funkcijai ir pagerina dirbtuvių naudotojo patirtį.**

#### Pridėta
- **🧪 azd provision --preview Feature Documentation**: Išsami medžiaga apie naują infrastruktūros peržiūros galimybę
  - Komandų nuoroda ir naudojimo pavyzdžiai cheat sheete
  - Išsami integracija diegimo vadove su naudojimo atvejais ir privalumais
  - Prieš skrydžius (pre-flight) tikrinimo integracija saugesniam diegimo validavimui
  - Pradžios vadovo atnaujinimai su saugumu pagrįstomis diegimo praktikomis
- **🚧 Workshop Status Banner**: Profesionali HTML juosta, nurodanti dirbtuvių kūrimo būseną
  - Gradientinis dizainas su statybos ženklais aiškiai naudotojui komunikuoti
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas išdėstymas visų įrenginių palaikymui

#### Patobulinta
- **Infrastruktūros sauga**: Peržiūros funkcionalumas integruotas visuose diegimo dokumentuose
- **Priešdieigimo validavimas**: Automatizuoti skriptai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjo darbo eiga**: Atnaujintos komandų sekos, įtraukiant peržiūrą kaip gerąją praktiką
- **Dirbtuvių patirtis**: Aiškiai nustatytos naudotojo lūkesčiai dėl turinio kūrimo būsenos

#### Pakeista
- **Diegimo geriausios praktikos**: Dabar rekomenduojama peržiūra-priėjimo darbo eiga
- **Dokumentacijos eiga**: Infrastruktūros validavimas perkeltas ankstesniame mokymosi procese etape
- **Dirbtuvių pristatymas**: Profesionali būsena ir aiškus kūrimo laiko grafikas

#### Patobulinta
- **Saugumo pirmiausia požiūris**: Infrastruktūros pakeitimai dabar gali būti validuoti prieš diegimą
- **Komandinė bendradarbiavimo galimybė**: Peržiūros rezultatus galima dalintis peržiūrai ir patvirtinimui
- **Sąnaudų suvokimas**: Geresnis išteklių sąnaudų supratimas prieš provisioninimą
- **Rizikos mažinimas**: Sumažintas diegimo klaidų skaičius per ankstyvą validavimą

#### Techninė įgyvendinimo dalis
- **Multi-dokumentų integracija**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Vienoda sintaksė ir pavyzdžiai visuose dokumentuose
- **Geriausių praktikų integracija**: Peržiūra įtraukta į validavimo darbo eigas ir skriptus
- **Vizualiniai indikatoriai**: Aiškūs NAUJŲ funkcijų žymėjimai lengvam aptikimui

#### Dirbtuvių infrastruktūra
- **Būseno komunikacija**: Profesionali HTML juosta su gradientiniu stiliumi
- **Naudotojo patirtis**: Aiški kūrimo būsena užkerta kelią painiavai
- **Profesionalus pristatymas**: Išlaiko saugyklos patikimumą ir nustato lūkesčius
- **Laiko skaidrumas**: Paskutinio atnaujinimo data: spalis 2025, skaidrumui

### [v3.3.0] - 2025-09-24

#### Patobulinta dirbtuvių medžiaga ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamią dirbtuvių medžiagą su naršyklėje veikiančiomis interaktyviomis pamokomis ir struktūrizuotais mokymosi keliais.**

#### Pridėta
- **🎥 Interaktyvus dirbtuvių vadovas**: Naršyklėje veikianti dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Struktūruotos dirbtuvių instrukcijos**: 7 žingsnių vadovaujama mokymosi eiga nuo susipažinimo iki pritaikymo
  - 0-Introduction: Dirbtuvių apžvalga ir paruošimas
  - 1-Select-AI-Template: Šablonų atradimas ir pasirinkimo procesas
  - 2-Validate-AI-Template: Diegimo ir validavimo procedūros
  - 3-Deconstruct-AI-Template: Šablono architektūros supratimas
  - 4-Configure-AI-Template: Konfigūravimas ir pritaikymas
  - 5-Customize-AI-Template: Pažangios modifikacijos ir iteracijos
  - 6-Teardown-Infrastructure: Valymas ir resursų valdymas
  - 7-Wrap-up: Santrauka ir tolesni žingsniai
- **🛠️ Dirbtuvių įrankiai**: MkDocs konfigūracija su Material tema geresnei mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodika (Atranka → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces integracija**: Sklandus kūrimo aplinkos paruošimas

#### Patobulinta
- **AI Workshop Lab**: Išplėstas su išsamia 2–3 val. struktūruota mokymosi patirtimi
- **Dirbtuvių dokumentacija**: Profesionalus pateikimas su navigacija ir vizualiais pagalbiniais įrankiais
- **Mokymosi eiga**: Aiškus žingsnis po žingsnio vadovas nuo šablono pasirinkimo iki gamybinio diegimo
- **Kūrėjo patirtis**: Integruoti įrankiai supaprastintai kūrėjo darbo eigai

#### Patobulinta
- **Prieinamumas**: Naršyklinė sąsaja su paieška, kopijavimo funkcija ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksti dirbtuvių struktūra, pritaikyta skirtingam mokymosi tempui
- **Praktinis pritaikymas**: Realaus pasaulio AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Įtaisytas paieškos laukelis**: Greitas raktinių žodžių ir pamokų radimas
- **Kopiavimo blokai**: Galimybė užvesti ir nukopijuoti visus kodo pavyzdžius
- **Temos perjungimas**: Tamsus/šviesus režimai skirtingiems pageidavimams
- **Vizualiniai ištekliai**: Ekrano vaizdai ir diagramos geresniam supratimui
- **Pagalbos integracija**: Tiesioginis Discord priekis bendruomenės palaikymui

### [v3.2.0] - 2025-09-17

#### Didelis navigacijos pertvarkymas ir mokymasis pagal skyrius
**Ši versija pristato išsamią skyrių pagrindu veikiančią mokymosi struktūrą su pagerinta navigacija visame saugykloje.**

#### Pridėta
- **📚 Skyrių pagrindu veikianti mokymosi sistema**: Visas kursas pertvarkytas į 8 progresuojančius mokymosi skyrius
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir poraštės visuose dokumentuose
- **🎯 Progresavimo sekimas**: Kurso užbaigimo kontrolinis sąrašas ir mokymosi patvirtinimo sistema
- **🗺️ Mokymosi kelio gairės**: Aiškūs įėjimo taškai skirtingiems patirties lygiams ir tikslams
- **🔗 Kryžminės nuorodos**: Susiję skyriai ir prielaidos aiškiai sujungtos

#### Patobulinta
- **README struktūra**: Pertvarkyta į struktūruotą mokymosi platformą su skyrių organizacija
- **Dokumentacijos navigacija**: Kiekviename puslapyje dabar pateikiamas skyriaus kontekstas ir pažangos gairės
- **Šablonų organizacija**: Pavyzdžiai ir šablonai priskirti atitinkamiems mokymosi skyriams
- **Išteklių integracija**: Cheat shee'ai, DUK ir studijų vadovai susieti su atitinkamais skyriais
- **Dirbtuvių integracija**: Praktiniai laboratoriniai darbai priskirti keliems skyriams pagal mokymosi tikslus

#### Pakeista
- **Mokymosi eiga**: Pereita nuo liniarinės dokumentacijos prie lanksčios skyrių sistemos
- **Konfigūracijos vieta**: Konfigūracijos vadovas perkeltas į Chapter 3 geresnei mokymosi eigai
- **AI turinio integracija**: Geresnė AI specifinio turinio integracija per visą mokymo kelią
- **Gamybinis turinys**: Pažangūs modeliai sujungti į Chapter 8 įmonėms ir pažengusiems mokiniams

#### Patobulinta
- **Naudotojo patirtis**: Aiškūs navigacijos trupiniai ir skyriaus pažangos indikatoriai
- **Prieinamumas**: Nuoseklūs navigacijos modeliai lengvesniam kurso naršymui
- **Profesionalus pateikimas**: Universitetinio tipo kurso struktūra tinkama akademiniam ir įmonių mokymui
- **Mokymosi efektyvumas**: Sutrumpintas laikas rasti reikiamą turinį per pagerintą organizaciją

#### Techninė įgyvendinimo dalis
- **Navigacijos antraštės**: Standartizuota skyrių navigacija daugiau nei 40 dokumentų failuose
- **Poraštės navigacija**: Nuoseklūs pažangos gairės ir skyriaus užbaigimo indikatoriai
- **Kryžminės nuorodos**: Išsami vidinė nuorodų sistema jungia susijusias sąvokas
- **Skyrių žemėlapis**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Studijų vadovo patobulinimas
- **📚 Išsamūs mokymosi tikslai**: Studijų vadovas pertvarkytas, kad atitiktų 8 skyrių sistemą
- **🎯 Skyrių vertinimas**: Kiekvienas skyrius apima konkrečius mokymosi tikslus ir praktines užduotis
- **📋 Progreso sekimas**: Savaitinė mokymosi programa su matuojamais rezultatais ir užbaigimo sąrašais
- **❓ Vertinimo klausimai**: Kiekvienam skyriui skirti žinių patvirtinimo klausimai su profesiniais rezultatais
- **🛠️ Praktinės užduotys**: Praktinės veiklos su realiais diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių pažanga**: Aiškus žingsnis nuo pagrindinių sąvokų iki įmonių modelių ir karjeros plėtros
- **🎓 Sertifikavimo sistema**: Profesinio tobulėjimo rezultatai ir bendruomenės pripažinimas
- **⏱️ Laiko valdymas**: Struktūruotas 10 savaičių mokymosi planas su etapų patikra

### [v3.1.0] - 2025-09-17

#### Patobulintos Multi-Agent AI sprendimai
**Ši versija patobulina daugio agentų mažmeninės prekybos sprendimą su geresniu agentų pavadinimu ir atnaujinta dokumentacija.**

#### Pakeista
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai, kad būtų naudojamas nuoseklus "Customer agent" pavadinimas
- **Konfigūracijos pavyzdžiai**: Modernizuoti agento konfigūracijos šablonai su atnaujintomis pavadinimo konvencijomis
- **Dokumentacijos nuoseklumas**: Užtikrinta, kad visos nuorodos naudotų profesionalius, aprašomuosius agentų pavadinimus

#### Patobulinta
- **ARM Template Package**: Atnaujintas retail-multiagent-arm-template su Customer agent nuorodomis
- **Architecture Diagrams**: Atnaujinti Mermaid diagramos su atnaujintu agentų pavadinimu
- **Code Examples**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent pavadinimą
- **Environment Variables**: Atnaujinti visi diegimo skriptai naudoja CUSTOMER_AGENT_NAME konvenciją

#### Patobulinta
- **Kūrėjo patirtis**: Aiškesni agentų vaidmenys ir atsakomybės dokumentacijoje
- **Paruošta gamybai**: Geresnis atitikimas įmonių pavadinimų konvencijoms
- **Mokymosi medžiaga**: Intuityvesni agentų pavadinimai mokymosi tikslais
- **Šablonų naudojimo paprastumas**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeisti CoraAgent klasės pavadinimai į CustomerAgent Python pavyzdžiuose
- Modifikuotos ARM šablono JSON konfigūracijos, kad naudotų "customer" agentų tipą
- Atnaujinti aplinkos kintamieji iš CORA_AGENT_* į CUSTOMER_AGENT_* formatą
- Atnaujintos visos diegimo komandos ir konteinerių konfigūracijos

### [v3.0.0] - 2025-09-12

#### Pagrindiniai pakeitimai - AI kūrėjo orientacija ir Microsoft Foundry integracija
**Ši versija paverčia saugyklą išsamiais AI orientuotais mokymosi ištekliais su Microsoft Foundry integracija.**

#### Pridėta
- **🤖 AI-pirmasis mokymosi kelias**: Visas pertvarkymas, teikiantis prioritetą AI kūrėjams ir inžinieriams
- **Microsoft Foundry Integration Guide**: Išsami dokumentacija, skirta sujungti AZD su Microsoft Foundry paslaugomis
- **AI Model Deployment Patterns**: Detalus vadovas apimantis modelių parinkimą, konfigūravimą ir gamybos diegimo strategijas
- **AI Workshop Lab**: 2–3 valandų praktinis seminaras, skirtas perkelti AI programas į AZD diegimui pasirengusias versijas
- **Production AI Best Practices**: Įmonėms parengti modeliai AI apkrovų mastymui, stebėjimui ir apsaugai
- **AI-Specific Troubleshooting Guide**: Išsamus trikčių šalinimo vadovas Azure OpenAI, Cognitive Services ir AI diegimo problemoms
- **AI Template Gallery**: Atrinkta Microsoft Foundry šablonų kolekcija su sudėtingumo įvertinimais
- **Workshop Materials**: Pilna seminaro struktūra su praktiniais laboratoriniais darbais ir nuorodų medžiaga

#### Patobulinta
- **README Structure**: Orientuota į AI kūrėjus, su 45% bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Learning Paths**: Skirtas AI kūrėjų kelias šalia tradicinių mokinių ir DevOps inžinierių kelių
- **Template Recommendations**: Rekomenduojami AI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Community Integration**: Patobulintas Discord bendruomenės palaikymas su AI specifiniais kanalais ir diskusijomis

#### Saugumas ir gamybos orientacija
- **Managed Identity Patterns**: AI specifinės autentifikacijos ir saugumo konfigūracijos
- **Cost Optimization**: Žetonų naudojimo sekimas ir biudžeto kontrolė AI apkrovoms
- **Multi-Region Deployment**: Strategijos pasauliniam AI taikomųjų programų diegimui
- **Performance Monitoring**: AI specifiniai metrikai ir Application Insights integracija

#### Dokumentacijos kokybė
- **Linear Course Structure**: Logiška eiga nuo pradedančiojo iki pažangių AI diegimo modelių
- **Validated URLs**: Visi išoriniai saugyklų saitai patikrinti ir pasiekiami
- **Complete Reference**: Visi vidiniai dokumentacijos saitai patvirtinti ir veikia
- **Production Ready**: Įmonėms parengti diegimo modeliai su realaus pasaulio pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Pagrindiniai pakeitimai - saugyklos pertvarkymas ir profesinis pagerinimas
**Ši versija reiškia reikšmingą saugyklos struktūros ir turinio pateikimo pertvarkymą.**

#### Pridėta
- **Structured Learning Framework**: Visuose dokumentacijos puslapiuose dabar yra įvadas, mokymosi tikslai ir mokymosi rezultatai
- **Navigation System**: Pridėtos ankstesnio/kito pamokos nuorodos per visą dokumentaciją, siekiant nuoseklios mokymosi eigos
- **Study Guide**: Išsamus study-guide.md su mokymosi tikslais, praktikos užduotimis ir vertinimo medžiaga
- **Professional Presentation**: Pašalintos visos piktogramos (emoji) geresniam pasiekiamumui ir profesionaliam vaizdui
- **Enhanced Content Structure**: Patobulinta mokymosi medžiagos organizacija ir eiga

#### Pakeista
- **Documentation Format**: Standartizuota visa dokumentacija su nuoseklia mokymuisi orientuota struktūra
- **Navigation Flow**: Įgyvendinta logiška eiga per visą mokymosi medžiagą
- **Content Presentation**: Pašalinti dekoratyviniai elementai, siekiant aiškios, profesionalesnės formos
- **Link Structure**: Atnaujinti visi vidiniai saitai, kad palaikytų naują navigacijos sistemą

#### Patobulinta
- **Accessibility**: Pašalintos emoji priklausomybės, siekiant geresnio suderinamumo su ekrano skaitytuvais
- **Professional Appearance**: Švarus, akademinio stiliaus pateikimas, tinkamas įmonių mokymuisi
- **Learning Experience**: Struktūrizuotas požiūris su aiškiais tikslais ir rezultatais kiekvienai pamokai
- **Content Organization**: Geresnė loginė eiga ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Pradinis leidimas - Visapusiška AZD mokymosi saugykla

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Pilna pradžios vadovų serija
  - Išsami diegimo ir infrastruktūros paruošimo dokumentacija
  - Išsamios trikčių šalinimo priemonės ir derinimo vadovai
  - Įrankiai ir procedūros prieš diegimą skirtam patikrinimui

- **Pradžios modulis**
  - AZD pagrindai: Pagrindinės sąvokos ir terminologija
  - Diegimo vadovas: Platformai specifinės nustatymo instrukcijos
  - Konfigūracijos vadovas: Aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto vadovas: Žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir aprūpinimo modulis**
  - Diegimo vadovas: Išsami darbo eigos dokumentacija
  - Aprūpinimo vadovas: Infrastruktūra kaip kodas su Bicep
  - Geriausios praktikos gamybiniams diegimams
  - Daugiaservisės architektūros modeliai

- **Priešdiegiamosios patikros modulis**
  - Talpos planavimas: Azure išteklių prieinamumo patikra
  - SKU parinkimas: Išsamios gairės paslaugų lygiams
  - Priešdiegiamosios patikros: Automatizuoti patikros scenarijai (PowerShell ir Bash)
  - Išlaidų apskaičiavimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažnos problemos: Dažnai pasitaikančios problemos ir sprendimai
  - Derinimo vadovas: Sistemingos trikčių šalinimo metodikos
  - Pažangios diagnostikos technikos ir įrankiai
  - Veikimo stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų atmintinė: Greita nuoroda į esmines komandas
  - Žodynas: Išsami terminų ir santrumpų apibrėžimai
  - DUK: Išsamūs atsakymai į dažnai užduodamus klausimus
  - Išorinės išteklių nuorodos ir bendruomenės ryšiai

- **Pavyzdžiai ir šablonai**
  - Paprasto žiniatinklio taikomosios programos pavyzdys
  - Statinio svetainės diegimo šablonas
  - Konteinerizuotos programos konfigūracija
  - Duomenų bazės integracijos modeliai
  - Mikropaslaugų architektūros pavyzdžiai
  - Serverless funkcijų įgyvendinimai

#### Funkcijos
- **Multi-Platform Support**: Diegimo ir konfigūracijos vadovai Windows, macOS ir Linux
- **Multiple Skill Levels**: Turinys skirtas nuo studentų iki profesionalių kūrėjų
- **Practical Focus**: Praktinis dėmesys — praktiniai pavyzdžiai ir tikroviškos scenos
- **Comprehensive Coverage**: Nuo pagrindinių sąvokų iki pažangių įmonių modelių
- **Security-First Approach**: Saugumo geriausios praktikos įtrauktos visur
- **Cost Optimization**: Gairės kaštų optimizavimui diegimuose ir išteklių valdyme

#### Dokumentacijos kokybė
- **Detailed Code Examples**: Praktiniai, išbandyti kodo pavyzdžiai
- **Step-by-Step Instructions**: Aiškios, praktiškos instrukcijos
- **Comprehensive Error Handling**: Trikčių šalinimas dažnoms problemoms
- **Best Practices Integration**: Pramonės standartai ir rekomendacijos
- **Version Compatibility**: Atitikimas naujausioms Azure paslaugoms ir azd funkcijoms

## Planuojami būsimi patobulinimai

### Version 3.1.0 (Planned)
#### AI platformos išplėtimas
- **Multi-Model Support**: Integracijos modeliai su Hugging Face, Azure Machine Learning ir pasirinktiniais modeliais
- **AI Agent Frameworks**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Advanced RAG Patterns**: Vektorinės duomenų bazės parinktys už Azure AI Search ribų (Pinecone, Weaviate ir kt.)
- **AI Observability**: Patobulintas modelio našumo, žetonų naudojimo ir atsakymų kokybės stebėjimas

#### Kūrėjo patirtis
- **VS Code Extension**: Integruota AZD + AI Foundry vystymo patirtis
- **GitHub Copilot Integration**: AI palaikoma AZD šablonų generacija
- **Interactive Tutorials**: Praktiniai programavimo užsiėmimai su automatiniu tikrinimu AI scenarijoms
- **Video Content**: Papildomi vaizdo vadovėliai vizualiems besimokantiesiems, orientuoti į AI diegimus

### Version 4.0.0 (Planned)
#### Įmonių AI modeliai
- **Governance Framework**: AI modelių valdymas, atitiktis ir audito registrai
- **Multi-Tenant AI**: Modeliai keliems klientams aptarnauti su izoliuotomis AI paslaugomis
- **Edge AI Deployment**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hybrid Cloud AI**: Daugiau debesų ir hibridinių diegimo modelių AI apkrovoms

#### Pažangios funkcijos
- **AI Pipeline Automation**: MLOps integracija su Azure Machine Learning vamzdynais
- **Advanced Security**: Nulinės pasitikėjimo modeliai, privatūs galiniai taškai ir pažangus grėsmių apsaugos sprendimas
- **Performance Optimization**: Pažangios derinimo ir mastymo strategijos didelio pralaidumo AI programoms
- **Global Distribution**: Turinį tiekimo ir edge talpinimo (caching) modeliai AI programoms

### Version 3.0.0 (Planuota) - Pakeista dabartiniu leidimu
#### Siūlomi papildymai - Dabar įgyvendinta v3.0.0
- ✅ **AI-Focused Content**: Išsami Microsoft Foundry integracija (įvykdyta)
- ✅ **Interactive Tutorials**: Praktinis AI seminaro laboratorija (įvykdyta)
- ✅ **Advanced Security Module**: AI specifiniai saugumo modeliai (įvykdyta)
- ✅ **Performance Optimization**: AI apkrovų derinimo strategijos (įvykdyta)

### Version 2.1.0 (Planuota) - Iš dalies įgyvendinta v3.0.0
#### Nedideli patobulinimai - kai kurie įgyvendinti dabartiniame leidime
- ✅ **Additional Examples**: AI orientuoti diegimo scenarijai (įvykdyta)
- ✅ **Extended FAQ**: AI specifiniai klausimai ir trikčių šalinimas (įvykdyta)
- **Tool Integration**: Patobinti IDE ir redaktorių integracijos vadovai
- ✅ **Monitoring Expansion**: AI specifiniai stebėjimo ir perspėjimų modeliai (įvykdyta)

#### Dar planuojama būsimam leidimui
- **Mobile-Friendly Documentation**: Reaguojantis dizainas mobiliesiems mokymams
- **Offline Access**: Atsisiunčiami dokumentacijos paketai
- **Enhanced IDE Integration**: VS Code plėtinys AZD + AI darbo eigoms
- **Community Dashboard**: Realaus laiko bendruomenės metrikos ir indėlių stebėjimas

## Dalyvavimas pakeitimų žurnale

### Pakeitimų pranešimas
Prisidedant prie šios saugyklos, įsitikinkite, kad įrašai pakeitimų žurnale apima:

1. **Versijos numeris**: Laikykitės semantinio versijų valdymo (major.minor.patch)
2. **Data**: Išleidimo arba atnaujinimo data formatu YYYY-MM-DD
3. **Kategorija**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Aiškus aprašymas**: Trumpas aprašymas, kas pasikeitė
5. **Poveikio vertinimas**: Kaip pakeitimai veikia esamus naudotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, skriptai ar paslaugos

#### Pakeista
- Pakeitimai esamai funkcionalumui ar dokumentacijai
- Atnaujinimai, skirti pagerinti aiškumą ar tikslumą
- Turinio ar organizacijos pertvarkymas

#### Nebenaudojama
- Funkcijos ar metodai, kurie palaipsniui pašalinami
- Dokumentacijos skyriai, planuojami pašalinti
- Metodai, kuriems yra geresni alternatyvos

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebėra aktualūs
- Pasenusi informacija ar nebenaudojami metodai
- Pasikartojantis arba konsoliduotas turinys

#### Ištaisyta
- Klaidų taisymai dokumentacijoje ar kode
- Praneštų problemų ar gedimų sprendimas
- Tikslumo ar funkcionalumo patobulinimai

#### Saugumas
- Su saugumu susiję patobulinimai arba pataisymai
- Atnaujinimai dėl geriausių saugumo praktikų
- Saugumo pažeidžiamumų sprendimas

### Semantinio versijų valdymo gairės

#### Pagrindinė versija (X.0.0)
- Reikšmingi pakeitimai, reikalaujantys veiksmų iš naudotojo
- Reikšminga turinio ar organizacijos pertvarka
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Smulkioji versija (X.Y.0)
- Naujos funkcijos arba turinio priedai
- Patobulinimai, išlaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Pleistro versija (X.Y.Z)
- Klaidos taisymai ir pataisymai
- Nedideli patobulinimai esamam turiniui
- Paaiškinimai ir smulkūs patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Mes aktyviai skatiname bendruomenės atsiliepimus, kad pagerintume šį mokymosi išteklį:

### Kaip pateikti atsiliepimus
- **GitHub Issues**: Praneškite apie problemas arba pasiūlykite patobulinimus (AI specifiškos problemos laukiamos)
- **Discord Discussions**: Dalinkitės idėjomis ir įsitraukite į Microsoft Foundry bendruomenę
- **Pull Requests**: Prisidėkite tiesioginėmis turinio pataisomis, ypač AI šablonais ir vadovais
- **Microsoft Foundry Discord**: Dalyvaukite #Azure kanale AZD + AI diskusijose
- **Community Forums**: Dalyvaukite platesnėse Azure kūrėjų diskusijose

### Atsiliepimų kategorijos
- **AI Content Accuracy**: Pataisymai apie AI paslaugų integraciją ir diegimo informaciją
- **Learning Experience**: Pasiūlymai geresnei AI kūrėjo mokymosi eigai
- **Missing AI Content**: Prašymai papildomų AI šablonų, modelių ar pavyzdžių
- **Accessibility**: Patobulinimai įvairiems mokymosi poreikiams
- **AI Tool Integration**: Pasiūlymai geresnei AI vystymo darbo eigos integracijai
- **Production AI Patterns**: Užklausos dėl įmonės lygio AI diegimo modelių

### Atsakymo įsipareigojimas
- **Issue Response**: Per 48 valandas dėl praneštų problemų
- **Feature Requests**: Įvertinimas per vieną savaitę
- **Community Contributions**: Peržiūra per vieną savaitę
- **Security Issues**: Nedelsiant prioritetas su pagreitintu atsaku

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Monthly Reviews**: Turinio tikslumo ir nuorodų patikra
- **Quarterly Updates**: Reikšmingi turinio priedai ir patobulinimai
- **Semi-Annual Reviews**: Išsami pertvarka ir patobulinimai
- **Annual Releases**: Pagrindiniai versijų atnaujinimai su reikšmingais patobulinimais

### Stebėjimas ir kokybės užtikrinimas
- **Automated Testing**: Reguliarus kodo pavyzdžių ir nuorodų patikrinimas
- **Community Feedback Integration**: Reguliari vartotojų pasiūlymų integracija
- **Technology Updates**: Suderinimas su naujausiomis Azure paslaugomis ir azd leidimais
- **Accessibility Audits**: Reguliarus įtraukaus dizaino principų peržiūrėjimas

## Versijų palaikymo politika

### Dabartinis versijų palaikymas
- **Latest Major Version**: Pilnas palaikymas su reguliariais atnaujinimais
- **Previous Major Version**: Saugumo atnaujinimai ir kritinės pataisos 12 mėnesių
- **Legacy Versions**: Tik bendruomenės palaikymas, jokių oficialių atnaujinimų

### Migracijos gairės
Kai išleidžiamos pagrindinės versijos, mes pateikiame:
- **Migracijos gairės**: Žingsnis po žingsnio perėjimo instrukcijos
- **Suderinamumo pastabos**: Informacija apie nesuderinamus pakeitimus
- **Įrankių palaikymas**: Skriptai arba įrankiai, padedantys su migracija
- **Bendruomenės palaikymas**: Skirti forumai migracijos klausimams

---

**Naršymas**
- **Ankstesnė pamoka**: [Studijų vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinį README](README.md)

**Būkite informuoti**: Stebėkite šį repozitoriją, kad gautumėte pranešimus apie naujus leidimus ir svarbius mokomosios medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingas interpretacijas, atsiradusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
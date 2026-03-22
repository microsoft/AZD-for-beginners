# Pakeitimų žurnalas - AZD For Beginners

## Įvadas

Šis pakeitimų žurnalas dokumentuoja visus reikšmingus pakeitimus, atnaujinimus ir patobulinimus AZD For Beginners saugykloje. Mes laikomės semantinio versijavimo principų ir išlaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį pakeitimų žurnalą, jūs:
- Būsite informuoti apie naujas funkcijas ir turinio papildymus
- Suprasite patobulinimus esamoje dokumentacijoje
- Seksite klaidų taisymus ir pataisas siekiant užtikrinti tikslumą
- Seksite mokymosi medžiagos raidą laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pakeitimų įrašus, galėsite:
- Nustatyti naują turinį ir išteklius, prieinamus mokymuisi
- Suprasti, kurios skiltys buvo atnaujintos ar patobulintos
- Planuoti savo mokymosi kelią pagal naujausią medžiagą
- Teikti atsiliepimus ir pasiūlymus būsimoms tobulinimo galimybėms

## Versijų istorija

### [v3.18.0] - 2026-03-16

#### AZD AI CLI komandos, turinio tikrinimas ir šablonų išplėtimas
**Ši versija prideda `azd ai`, `azd extension` ir `azd mcp` komandų aprėptį visuose su AI susijusiuose skyriuose, taiso sugadintas nuorodas ir pasenusią kodą faile agents.md, atnaujina trumpąją santrauką (cheat sheet) ir peržiūri Pavyzdinių šablonų skyrių su patikrintais aprašymais bei naujais Azure AI AZD šablonais.**

#### Pridėta
- **🤖 AZD AI CLI aprėptis** per 7 failus (anksčiau tik 8 skyriuje):
  - `docs/chapter-01-foundation/azd-basics.md` — Nauja skiltis "Extensions and AI Commands", pristatanti `azd extension`, `azd ai agent init`, ir `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Parinktis 4: `azd ai agent init` su palyginimo lentele (šablono vs manifesto požiūris)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Poskyriai "AZD Extensions for Foundry" ir "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Greitasis startas dabar rodo diegimo kelius tiek šablono, tiek manifesto pagrindu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Diegimo skiltis dabar įtraukia `azd ai agent init` parinktį
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Poskyris "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nauja skiltis "AI & Extensions Commands" su `azd extension`, `azd ai agent init`, `azd mcp`, ir `azd infra generate`
- **📦 Nauji AZD AI pavyzdiniai šablonai** faile `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG pokalbis su Blazor WebAssembly, Semantic Kernel ir balso pokalbių palaikymu
  - **azure-search-openai-demo-java** — Java RAG pokalbis naudojant Langchain4J su ACA/AKS diegimo parinktimis
  - **contoso-creative-writer** — Daugiaagentė kūrybinio rašymo programa, naudojanti Azure AI Agent Service, Bing Grounding ir Prompty
  - **serverless-chat-langchainjs** — Serverless RAG naudojant Azure Functions + LangChain.js + Cosmos DB su Ollama vietinio vystymo palaikymu
  - **chat-with-your-data-solution-accelerator** — Verslo klasės RAG spartintuvas su administravimo portalu, Teams integracija ir PostgreSQL/Cosmos DB parinktimis
  - **azure-ai-travel-agents** — Daugiaagentė MCP orkestracijos referencinė programa su serveriais .NET, Python, Java ir TypeScript
  - **azd-ai-starter** — Minimalus Azure AI infrastruktūros Bicep pradžios šablonas
  - **🔗 Nuoroda į [awesome-azd AI galeriją](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablonų)

#### Ištaisyta
- **🔗 agents.md navigacija**: Ankstesnės/sekanti nuorodos dabar atitinka 2 skyriaus README pamokų tvarką (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md sugadintos nuorodos**: `production-ai-practices.md` pataisyta į `../chapter-08-production/production-ai-practices.md` (3 vietos)
- **📦 agents.md pasenęs kodas**: Pakeista `opencensus` į `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neteisinga API**: `max_tokens` perkelta iš `create_agent()` į `create_run()` kaip `max_completion_tokens`
- **🔢 agents.md žetonų skaičiavimas**: Pakeistas apytikris `len//4` įvertis su `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Pataisytos paslaugos iš "Cognitive Search + App Service" į "Azure AI Search + Azure Container Apps" (numatytasis talpinimas pasikeitė 2024 m. spalį)
- **contoso-chat**: Atnaujintas aprašymas, nurodantis Azure AI Foundry + Prompty, atitinkantis saugyklos faktinį pavadinimą ir technologijų rinkinį

#### Pašalinta
- **ai-document-processing**: Pašalinta neveikanti šablono nuoroda (saugykla nėra viešai prieinama kaip AZD šablonas)

#### Patobulinta
- **📝 agents.md pratimai**: Pratimas 1 dabar rodo tikėtiną išvestį ir žingsnį `azd monitor`; Pratimas 2 apima pilną `FunctionTool` registracijos kodą; Pratimas 3 neaiškus nurodymas pakeistas konkrečiomis `prepdocs.py` komandomis
- **📚 agents.md ištekliai**: Atnaujintos dokumentacijos nuorodos į dabartinę Azure AI Agent Service dokumentaciją ir greitąją pradžios instrukciją
- **📋 agents.md lentelė „Kiti žingsniai“**: Pridėta nuoroda į AI darbo dirbtuvių laboratoriją visam skyriui

#### Atnaujinti failai
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kurso navigacijos patobulinimas
**Ši versija pagerina README.md skyrių navigaciją su patobulinta lentelės forma.**

#### Pakeista
- **Kurso žemėlapio lentelė**: Patobulinta su tiesioginėmis pamokų nuorodomis, apytiksliais trukmės įverčiais ir sudėtingumo įvertinimais
- **Aplankų valymas**: Pašalinti pertekliniai seni aplankai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Nuorodų tikrinimas**: Patikrintos visos 21+ vidinės nuorodos Kurso žemėlapio lentelėje

### [v3.16.0] - 2026-02-05

#### Produkto pavadinimų atnaujinimai
**Ši versija atnaujina produktų nuorodas pagal dabartinį Microsoft prekės ženklo pavadinimą.**

#### Pakeista
- **Microsoft Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas, atspindintis dabartinį prekės ženklą

#### Atnaujinti failai
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Reikšmingas saugyklos pertvarkymas: aplankai pagal skyrius
**Ši versija pertvarko dokumentaciją į atskirus skyrių aplankus, kad būtų aiškesnė navigacija.**

#### Aplankų pervadinimai
Senieji aplankai pakeisti skaitmenimis pažymėtais skyrių aplankais:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Failų perkėlimai
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

#### Pridėta
- **📚 Skyrių README failai**: Sukurtas README.md kiekviename skyrių aplanke su:
  - Mokymosi tikslai ir trukmė
  - Pamokų lentelė su aprašymais
  - Greitos pradžios komandos
  - Navigacija į kitus skyrius

#### Pakeista
- **🔗 Atnaujintos visos vidinės nuorodos**: atnaujinta 78+ kelių per visus dokumentacijos failus
- **🗺️ Pagrindinis README.md**: Atnaujintas Kurso žemėlapis su nauja skyrių struktūra
- **📝 examples/README.md**: Atnaujintos kryžminės nuorodos į skyrių aplankus

#### Pašalinta
- Senoji aplankų struktūra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Saugyklos pertvarkymas: skyrių navigacija
**Ši versija pridėjo skyrių navigacijos README failus (pakeista v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Naujas AI agentų vadovas
**Ši versija prideda išsamų vadovą AI agentų diegimui naudojant Azure Developer CLI.**

#### Pridėta
- **🤖 docs/microsoft-foundry/agents.md**: Išsamus vadovas, apimantis:
  - Kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trys greitojo paleidimo agentų šablonai (Foundry Agents, Prompty, RAG)
  - Agentų architektūros modeliai (vienas agentas, RAG, daugiaagentė)
  - Įrankių konfigūracija ir pritaikymas
  - Stebėjimas ir metrikų sekimas
  - Sąnaudų klausimai ir optimizavimas
  - Trikčių šalinimo scenarijai
  - Trys praktinės užduotys su sėkmės kriterijais

#### Turinys
- **Įvadas**: Agentų koncepcijos pradedantiesiems
- **Greitasis startas**: Diegti agentus naudojant `azd init --template get-started-with-ai-agents`
- **Architektūros modeliai**: Vizualinės agentų modelių schemos
- **Konfigūracija**: Įrankių nustatymai ir aplinkos kintamieji
- **Stebėjimas**: Application Insights integracija
- **Pratimai**: Nuoseklus praktinis mokymasis (kiekvienas 20–45 minučių)

---

### [v3.12.0] - 2026-02-05

#### DevContainer aplinkos atnaujinimas
**Ši versija atnaujina kūrimo talpyklos konfigūraciją su modernesniais įrankiais ir geresniais numatytaisiais nustatymais AZD mokymosi patirčiai.**

#### Pakeista
- **🐳 Pagrindinis vaizdas**: Atnaujinta iš `python:3.12-bullseye` į `python:3.12-bookworm` (naujausia Debian stabili versija)
- **📛 Talpyklos pavadinimas**: Pervadintas iš "Python 3" į "AZD for Beginners" aiškumo sumetimais

#### Pridėta
- **🔧 Naujos Dev konteinerio funkcijos**:
  - `azure-cli` su įjungtu Bicep palaikymu
  - `node:20` (LTS versija AZD šablonams)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerių programų diegimams

- **🔌 Portų persiuntimas**: Iš anksto sukonfigūruoti prievadai įprastam vystymui:
  - 8000 (MkDocs peržiūra)
  - 3000 (žiniatinklio programos)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nauji VS Code plėtiniai**:
  - `ms-python.vscode-pylance` - Patobulintas Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions palaikymas
  - `ms-azuretools.vscode-docker` - Docker palaikymas
  - `ms-azuretools.vscode-bicep` - Bicep kalbos palaikymas
  - `ms-azure-devtools.azure-resource-groups` - Azure išteklių valdymas
  - `yzhang.markdown-all-in-one` - Markdown redagavimas
  - `DavidAnson.vscode-markdownlint` - Markdown tikrinimas
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (for azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code nustatymai**: Pridėta numatytųjų nustatymų Python interpretatoriui, formatavimui įrašant ir tarpo simbolių šalinimui

- **📦 Atnaujintas requirements-dev.txt**:
  - Pridėtas MkDocs minify įskiepis
  - Pridėtas pre-commit kodo kokybei
  - Pridėti Azure SDK paketai (azure-identity, azure-mgmt-resource)

#### Ištaisyta
- **Post-Create komanda**: Dabar tikrina AZD ir Azure CLI įdiegimą konteinerio paleidimo metu

---

### [v3.11.0] - 2026-02-05

#### README peržiūra pritaikyta pradedantiesiems
**Ši versija žymiai pagerina README.md, kad jis būtų prieinamesnis pradedantiesiems, ir prideda svarbius išteklius AI kūrėjams.**

#### Pridėta
- **🆚 Azure CLI vs AZD palyginimas**: Aiškus paaiškinimas, kada naudoti kiekvieną įrankį su praktiniais pavyzdžiais
- **🌟 Naudingos AZD nuorodos**: Tiesioginės nuorodos į bendruomenės šablonų galeriją ir indėlio išteklius:
  - [Awesome AZD galerija](https://azure.github.io/awesome-azd/) - 200+ paruoštų diegti šablonų
  - [Pateikti šabloną](https://github.com/Azure/awesome-azd/issues) - Bendruomenės indėlis
- **🎯 Greito pradžios vadovas**: Supaprastinta 3 žingsnių pradžios skiltis (Install → Login → Deploy)
- **📊 Navigacijos lentelė pagal patirtį**: Aiškios gairės, nuo ko pradėti pagal kūrėjo patirtį

#### Pakeista
- **README struktūra**: Perorganizuota progresiniam atskleidimui - svarbiausia informacija pirmiausia
- **Įžangos skyrius**: Perrašyta, kad paaiškintų „The Magic of `azd up`“ visiškai pradedantiesiems
- **Pašalintas pasikartojantis turinys**: Išimtas dubliuojantis trikčių šalinimo skyrius
- **Trikčių šalinimo komandos**: Pataisyta `azd logs` nuoroda, naudojant galiojantį `azd monitor --logs`

#### Ištaisyta
- **🔐 Autentifikacijos komandos**: Pridėta `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Neteisingos komandų nuorodos**: Pašalintas likęs `azd logs` iš README trikčių šalinimo skyriaus

#### Pastabos
- **Taikymo sritis**: Pakeitimai taikyti pagrindiniam README.md ir resources/cheat-sheet.md
- **Tikslinė auditorija**: Patobulinimai skirti kūrėjams, kurie yra nauji AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI komandų tikslumo atnaujinimas
**Ši versija ištaiso neegzistuojančias AZD komandas visoje dokumentacijoje, užtikrindama, kad visi kodo pavyzdžiai naudotų galiojančią Azure Developer CLI sintaksę.**

#### Ištaisyta
- **🔧 Pašalintos neegzistuojančios AZD komandos**: Išsamus auditas ir neteisingų komandų pataisymai:
  - `azd logs` (neegzistuoja) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` subkomandos (neegzistuoja) → pakeista į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (neegzistuoja) → pašalinta arba pakeista galiojančiomis alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` vėliavos (neegzistuoja) → pašalintos
  - `azd provision --what-if/--rollback` vėliavos (neegzistuoja) → atnaujinta, naudojant `--preview`
  - `azd config validate` (neegzistuoja) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neegzistuoja) → pašalinta

- **📚 Failai, atnaujinti su komandų pataisymais**:
  - `resources/cheat-sheet.md`: Išsamus komandų nuorodos pertvarkymas
  - `docs/deployment/deployment-guide.md`: Pataisytos rollback ir diegimo strategijos
  - `docs/troubleshooting/debugging.md`: Pataisyti žurnalų analizės skyriai
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisytas AZD derinimo skyrius
  - `docs/getting-started/azd-basics.md`: Pataisytos stebėjimo komandos
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir derinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Pataisyti pagalbos ir versijų pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Pataisytos žurnalų peržiūros komandos
  - `docs/pre-deployment/coordination-patterns.md`: Pataisyti agento derinimo komandos

- **📝 Versijos nuoroda atnaujinta**:
  - `docs/getting-started/installation.md`: Pakeista hardcodinta `1.5.0` versija į bendresnę `1.x.x` su nuoroda į leidimus

#### Pakeista
- **Rollback strategijos**: Dokumentacija atnaujinta, naudojant Git pagrindu veikiančius rollback metodus (AZD neturi natūralios rollback funkcijos)
- **Žurnalų peržiūra**: Pakeistas `azd logs` nuorodas į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Veikimo skiltis**: Pašalintos neegzistuojančios paralelinių/incremental diegimų vėliavos, pateiktos galiojančios alternatyvos

#### Techninės detalės
- **Galiojančios AZD komandos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galimi azd monitor parametrai**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patikrinimas**: Komandos patikrintos pagal Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dirbtuvių užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvių dirbtuvių modulius, ištaiso visus sulaužytus dokumentacijos ryšius ir pagerina bendrą turinį AI kūrėjams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujas indėlių gairių dokumentas su:
  - Aiškiomis instrukcijomis, kaip pranešti apie problemas ir siūlyti pakeitimus
  - Dokumentacijos standartais naujam turiniui
  - Kodo pavyzdžių gairėmis ir commit pranešimų konvencijomis
  - Bendruomenės įsitraukimo informacija

#### Užbaigta
- **🎯 Workshop modulis 7 (Apibendrinimas)**: Visiškai užbaigtas apibendrinimo modulis su:
  - Išsamiu dirbtuvių pasiekimų santrauka
  - Išmokstų pagrindinių sąvokų skyriumi, apimančiu AZD, šablonus ir Microsoft Foundry
  - Rekomendacijomis, kaip tęsti mokymosi kelionę
  - Dirbtuvių iššūkio pratimais su sudėtingumo įvertinimais
  - Bendruomenės atsiliepimų ir palaikymo nuorodomis

- **📚 Workshop modulis 3 (Deconstruct)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot su MCP serverių aktyvacijos gairėmis
  - AZD šablonų aplanko struktūros supratimu
  - Infrastructure-as-code (Bicep) organizacijos modeliais
  - Praktinių laboratorijų instrukcijomis

- **🔧 Workshop modulis 6 (Teardown)**: Užbaigta su:
  - Išteklų valymo ir kaštų valdymo tikslais
  - `azd down` naudojimu saugiam infrastruktūros išjungimui
  - Minkštai ištrintų kognityvinių paslaugų atkūrimo gairėmis
  - Papildomais tyrinėjimo uždaviniais GitHub Copilot ir Azure portalui

#### Ištaisyta
- **🔗 Sugadintų nuorodų pataisymai**: Išspręsta 15+ sulaužytų vidinių dokumentacijos nuorodų:
  - `docs/ai-foundry/ai-model-deployment.md`: Pataisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyti ai-model-deployment.md ir production-ai-practices.md keliai
  - `docs/getting-started/first-project.md`: Pakeistas neegzistuojantis cicd-integration.md į deployment-guide.md
  - `examples/retail-scenario.md`: Pataisyti DUK ir trikčių šalinimo gairių keliai
  - `examples/container-app/microservices/README.md`: Pataisyti kurso namų ir diegimo vadovo keliai
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujintos AI skyriaus nuorodos
  - `course-outline.md`: Pataisyti instruktoriaus vadovo ir AI dirbtuvių laboratorijų nuorodų keliai

- **📅 Dirbtuvių statuso skelbimas**: Atnaujintas iš „Under Construction“ į aktyvią dirbtuvių būseną su 2026 m. vasario data

- **🔗 Dirbtuvių navigacija**: Pataisyti sugadinti navigacijos ryšiai workshop README.md, kurie rodė į neegzistuojantį lab-1-azd-basics aplanką

#### Pakeista
- **Dirbtuvių pateikimas**: Pašalinta „under construction“ įspėjimas, dirbtuvės dabar užbaigtos ir paruoštos naudoti
- **Navigacijos nuoseklumas**: Užtikrinta, kad visi dirbtuvių moduliai turi tinkamą tarpusavio navigaciją
- **Mokymosi kelio nuorodos**: Atnaujinti skyrių kryžminiai nuorodų keliai, naudojant tinkamus microsoft-foundry kelių pavadinimus

#### Patvirtinta
- ✅ Visi anglų kalbos markdown failai turi galiojančias vidines nuorodas
- ✅ Dirbtuvių moduliai 0–7 užbaigti su mokymosi tikslais
- ✅ Navigacija tarp skyrių ir modulių veikia teisingai
- ✅ Turinys tinkamas AI kūrėjams, naudojantiems Microsoft AZD
- ✅ Išlaikyta pradedantiems draugiška kalba ir struktūra
- ✅ CONTRIBUTING.md suteikia aiškias gaires bendruomenės indėliams

#### Techninė įgyvendinimas
- **Nuorodų patikrinimas**: Automatizuotas PowerShell scenarijus patikrino visus .md vidinius ryšius
- **Turinio auditas**: Rankinis dirbtuvių užbaigimo ir pradedantiesiems tinkamumo peržiūra
- **Navigacijos sistema**: Taikyti nuoseklūs skyrių ir modulų navigacijos modeliai

#### Pastabos
- **Taikymo sritis**: Pakeitimai taikyti tik anglų dokumentacijai
- **Vertimai**: Vertimų aplankai šioje versijoje nebuvo atnaujinti (automatizuotas vertimas bus sinchronizuotas vėliau)
- **Dirbtuvių trukmė**: Užbaigtos dirbtuvės suteikia 3–4 valandas praktinio mokymosi

---

### [v3.8.0] - 2025-11-19

#### Išplėstinė dokumentacija: stebėjimas, saugumas ir daugelio agentų modeliai
**Ši versija prideda išsamius A lygio pamokų modulius apie Application Insights integraciją, autentifikacijos modelius ir daugelio agentų koordinavimą gamybiniams diegimams.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: `docs/pre-deployment/application-insights.md`:
  - Diegimas orientuotas į AZD su automatiniu resursų parengimu
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pasirinktinėmis telemetrijomis (1 200+ eilučių)
  - AI/LLM stebėjimo modeliai (Microsoft Foundry modelių žetonų/kaštų stebėjimas)
  - 6 Mermaid diagramos (architektūra, paskirstytasis trace, telemetrijos srautas)
  - 3 praktiniai pratimai (įspėjimai, valdymo skydai, AI stebėjimas)
  - Kusto užklausų pavyzdžiai ir kaštų optimizavimo strategijos
  - Realių metrikų srautas ir realaus laiko derinimas
  - 40–50 minučių mokymosi laikas su gamybai paruoštais modeliais

- **🔐 Autentifikacijos ir saugumo modelių pamoka**: `docs/getting-started/authsecurity.md`:
  - 3 autentifikacijos modeliai (connection strings, Key Vault, managed identity)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilni pratimai (įgalinti managed identity, user-assigned identity, Key Vault rotacija)
  - Saugumo gerąsias praktikas ir RBAC konfigūracijas
  - Trikčių šalinimo vadovas ir kaštų analizė
  - Gamybai paruošti be slaptažodžių autentifikacijos modeliai

- **🤖 Daugelio agentų koordinavimo modelių pamoka**: `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinavimo modeliai (sequential, parallel, hierarchical, event-driven, consensus)
  - Pilnas orchestratoriaus paslaugos įgyvendinimas (Python/Flask, 1 500+ eilučių)
  - 3 specializuoti agentų įgyvendinimai (Research, Writer, Editor)
  - Service Bus integracija žinučių eilėms
  - Cosmos DB būsenos valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramos, rodantys agentų sąveikas
  - 3 pažangūs pratimai (timeout valdymas, retry logika, circuit breaker)
  - Kaštų suskirstymas ($240–565/mėn.) su optimizavimo strategijomis
  - Application Insights integracija stebėjimui

#### Patobulinta
- **Išankstinio diegimo skyrius**: Dabar apima išsamius stebėjimo ir koordinavimo modelius
- **Pradžios skyrius**: Patobulintas su profesionaliais autentifikacijos modeliais
- **Parengta gamybai**: Pilnas aprėptis nuo saugumo iki stebėjimo
- **Kurso planas**: Atnaujintas, nurodantis naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi progresija**: Geresnė saugumo ir stebėjimo integracija per visą kursą
- **Dokumentacijos kokybė**: Nuoseklūs A lygio standartai (95–97%) per naujas pamokas
- **Gamybiniai modeliai**: Pilnas end-to-end aprėptis įmoniniams diegimams

#### Patobulinta
- **Developer Experience**: Aiški eiga nuo kūrimo iki gamybos stebėjimo
- **Security Standards**: Profesionalūs šablonai autentifikacijai ir slaptų raktų valdymui
- **Observability**: Pilna Application Insights integracija su AZD
- **AI Workloads**: Specializuotas stebėjimas Microsoft Foundry Models ir daugiagentinių sistemų

#### Patvirtinta
- ✅ Visos pamokos turi pilną veikiantį kodą (ne fragmentus)
- ✅ Mermaid diagramos vizualiam mokymuisi (iš viso 19 per 3 pamokas)
- ✅ Praktiniai užsiėmimai su patikrinimo žingsniais (iš viso 9)
- ✅ Gamybai paruošti Bicep šablonai, diegiami per `azd up`
- ✅ Išlaidų analizė ir optimizavimo strategijos
- ✅ Gedimų šalinimo vadovai ir gerosios praktikos
- ✅ Žinių patikros taškai su patikrinimo komandomis

#### Dokumentacijos vertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsamus stebėjimo vadovas
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo šablonai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios daugiaagentės architektūros
- **Overall New Content**: - Nuoseklūs aukštos kokybės standartai

#### Techninė įgyvendinimo dalis
- **Application Insights**: Log Analytics + pasirinktinis telemetrijos rinkinys + paskirstytas sekimas
- **Authentication**: Managed Identity + Key Vault + RBAC šablonai
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Monitoring**: Tiesioginės metrikos + Kusto užklausos + įspėjimai + prietaisų skydeliai
- **Cost Management**: Mėginių ėmimo strategijos, saugojimo politikos, biudžeto kontrolė

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Microsoft Foundry Models pavyzdys
**Ši versija pagerina dokumentacijos kokybę visame saugykloje ir prideda visapusišką Microsoft Foundry Models diegimo pavyzdį su gpt-4.1 pokalbių sąsaja.**

#### Pridėta
- **🤖 Microsoft Foundry Models Pokalbių pavyzdys**: Pilnas gpt-4.1 diegimas su veikiančia įgyvendinimo versija `examples/azure-openai-chat/`:
  - Pilna Microsoft Foundry Models infrastruktūra (gpt-4.1 modelio diegimas)
  - Python komandinės eilutės pokalbių sąsaja su pokalbių istorija
  - Key Vault integracija saugiam API raktų saugojimui
  - Žetonų naudojimo stebėjimas ir sąnaudų įvertinimas
  - Užklausų dažnio ribojimas ir klaidų tvarkymas
  - Išsamus README su 35–45 minučių diegimo vadovu
  - 11 gamybai paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos pratimai**: Pridėti praktiniai pratimai į konfigūracijos vadovą:
  - Pratybos 1: Kelių aplinkų konfigūracija (15 minučių)
  - Pratybos 2: Slaptų duomenų valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikrinimo žingsniai
- **✅ Diegimo patikra**: Pridėta patikros skiltis į diegimo vadovą:
  - Sveikatos patikros procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Tikėtini išvedimai visoms diegimo komandoms
  - Greita gedimų šalinimo nuoroda

#### Patobulinta
- **examples/README.md**: Atnaujinta iki A lygio kokybės (93%):
  - Pridėtas azure-openai-chat į visas atitinkamas skiltis
  - Vietinių pavyzdžių skaičius atnaujintas iš 3 į 4
  - Pridėta prie AI programų pavyzdžių lentelės
  - Integruota į Greitą pradžią vidutinio lygio naudotojams
  - Pridėta prie Microsoft Foundry šablonų skyriaus
  - Atnaujinta palyginimo matrica ir technologijų sekcijos
- **Dokumentacijos kokybė**: Patobulinta B+ (87%) → A- (92%) visame docs aplanke:
  - Pridėti laukiamieji rezultatai prie kritinių komandų pavyzdžių
  - Įtraukti patikrinimo žingsniai konfigūracijos pakeitimams
  - Patobulinta praktinė mokymosi dalis su praktiniais pratimais

#### Pakeista
- **Mokymosi pažanga**: Geresnė AI pavyzdžių integracija vidutinio lygio mokiniams
- **Dokumentacijos struktūra**: Daugiau veiksmais pagrįstų pratimų su aiškiais rezultatais
- **Patikros procesas**: Pagrindinėms darbo eigoms pridėti aiškūs sėkmės kriterijai

#### Patobulinta
- **Vystytojo patirtis**: Microsoft Foundry Models diegimas dabar trunka 35–45 minučių (prieš tai 60–90 sudėtingoms alternatyvoms)
- **Išlaidų skaidrumas**: Aiškūs sąnaudų įverčiai ($50-200/month) Microsoft Foundry Models pavyzdžiui
- **Mokymosi kelias**: AI kūrėjams aiškus įėjimo taškas su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs laukiamieji rezultatai ir patikrinimo žingsniai

#### Patvirtinta
- ✅ Microsoft Foundry Models pavyzdys visiškai veikia su `azd up`
- ✅ Visi 11 įgyvendinimo failai sintaksiškai teisingi
- ✅ README instrukcijos atitinka faktinę diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra pasikartojančių išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninė įgyvendinimo dalis
- **Microsoft Foundry Models architektūra**: gpt-4.1 + Key Vault + Container Apps šablonas
- **Sauga**: Paruošta Managed Identity, paslaptys Key Vault
- **Stebėjimas**: Application Insights integracija
- **Išlaidų valdymas**: Žetonų sekimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda pilnam nustatymui

### [v3.6.0] - 2025-11-19

#### Didelis atnaujinimas: Container App diegimo pavyzdžiai
**Ši versija pristato visapusiškus, gamybai paruoštus konteinerinių programų diegimo pavyzdžius naudojant Azure Developer CLI (AZD), su pilna dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Konteinerinių programų pavyzdžiai**: Nauji vietiniai pavyzdžiai `examples/container-app/`:
  - [Pagrindinis vadovas](examples/container-app/README.md): Išsamus konteinerinių diegimų apžvalga, greitas startas, gamyba ir pažangūs šablonai
  - [Paprastas Flask API](../../examples/container-app/simple-flask-api): Pradedantiesiems skirtas REST API su scale-to-zero, sveikatos patikromis, stebėjimu ir gedimų šalinimu
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices): Gamybai paruoštas daugiaservisų diegimas (API Gateway, Product, Order, User, Notification), asinchroninis žinučių siuntimas, Service Bus, Cosmos DB, Azure SQL, paskirstytas sekimas, blue-green/canary diegimas
- **Gerosios praktikos**: Saugumas, stebėjimas, išlaidų optimizavimas ir CI/CD gairės konteinerizuotoms apkrovoms
- **Kodo pavyzdžiai**: Pilnas `azure.yaml`, Bicep šablonai ir daugiakalbės paslaugų įgyvendinimai (Python, Node.js, C#, Go)
- **Testavimas ir gedimų šalinimas**: End-to-end testavimo scenarijai, stebėjimo komandos, gedimų šalinimo gairės

#### Pakeista
- **README.md**: Atnaujintas, kad rodytų ir susietų naujus konteinerinių programų pavyzdžius skyriuje "Local Examples - Container Applications"
- **examples/README.md**: Atnaujinta, kad pabrėžtų konteinerinių programų pavyzdžius, pridėtų palyginimo matricos įrašus ir atnaujintų technologijų/architektūros nuorodas
- **Kurso planas ir studijų vadovas**: Atnaujinti, kad nurodytų naujus konteinerinių programų pavyzdžius ir diegimo šablonus atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai diegiami su `azd up` ir atitinka gerąsias praktikas
- ✅ Dokumentacijos kryžminės nuorodos ir navigacija atnaujinta
- ✅ Pavyzdžiai apima nuo pradedančiojo iki pažengusio scenarijus, įskaitant gamybos mikropaslaugas

#### Pastabos
- **Aprėptis**: Tik anglų kalbos dokumentacija ir pavyzdžiai
- **Kiti žingsniai**: Plėsti su papildomais pažangiais konteinerių šablonais ir CI/CD automatizacija būsimuose leidimuose

### [v3.5.0] - 2025-11-19

#### Produkto pervadinimas: Microsoft Foundry
**Ši versija įgyvendina visapusišką produkto pavadinimo pakeitimą iš "Microsoft Foundry" į "Microsoft Foundry" visuose anglų kalbos dokumentuose, atspindint Microsoft oficialų prekės ženklo pervadinimą.**

#### Pakeista
- **🔄 Produkto pavadinimo atnaujinimas**: Visiškas pervadinimas iš "Microsoft Foundry" į "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų kalbos dokumentacijoje `docs/` aplanke
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Aplankų struktūros pakeitimai**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 Failų pervadinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Atnaujinti failai
- **Skyrių dokumentacija** (7 failai):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigacijos nuorodų atnaujinimai
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produkto pavadinimo nuorodos atnaujintos
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 nuorodos atnaujintos (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 kryžminių nuorodų atnaujinimai
  - `docs/getting-started/first-project.md` - 2 skyrių navigacijos nuorodos atnaujintos
  - `docs/getting-started/installation.md` - 2 nuorodos į kitą skyrių atnaujintos
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 nuorodos atnaujintos (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijos nuoroda atnaujinta
  - `docs/troubleshooting/debugging.md` - 1 navigacijos nuoroda atnaujinta

- **Kurso struktūros failai** (2 failai):
  - `README.md` - 17 nuorodų atnaujinta (kurso apžvalga, skyriaus pavadinimai, šablonų skyrius, bendruomenės įžvalgos)
  - `course-outline.md` - 14 nuorodų atnaujinta (apžvalga, mokymosi tikslai, skyriaus ištekliai)

#### Patvirtinta
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Pastabos
- **Aprėptis**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migracijos vadovas prisidedantiems
Jei turite vietinių šakų arba dokumentų, kurie nurodo seną struktūrą:
1. Atnaujinkite aplankų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos vis dar veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir patikros patobulinimai
**Ši versija pristato visapusišką palaikymą naujai Azure Developer CLI peržiūros funkcijai ir pagerina dirbtuvių naudotojo patirtį.**

#### Pridėta
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsami naujos infrastruktūros peržiūros galimybės apžvalga
  - Komandų nuoroda ir naudojimo pavyzdžiai pagalbos lapelyje
  - Detalė integracija į provisioning vadovą su naudojimo atvejais ir nauda
  - Pre-flight patikrų integracija saugesniam diegimo patikrinimui
  - Pradžios vadovo atnaujinimai su saugumo pirmiausia diegimo praktikomis
- **🚧 Dirbtuvių būsenos baneris**: Profesionalus HTML baneris rodantis dirbtuvių kūrimo būseną
  - Gradientinis dizainas su statybos indikatoriais aiškiam naudotojo informavimui
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems prietaisams pritaikytas dizainas visų įrenginių tipams

#### Patobulinta
- **Infrastruktūros saugumas**: Peržiūros funkcionalumas integruotas visoje diegimo dokumentacijoje
- **Priešdieginės patikros**: Automatizuoti scenarijai dabar apima infrastruktūros peržiūros testavimą
- **Vystytojo darbo eiga**: Atnaujintos komandų sekos, įtraukiant peržiūrą kaip gerąją praktiką
- **Dirbtuvių patirtis**: Vartotojams nustatytos aiškios lūkesčiai dėl turinio kūrimo būsenos

#### Pakeista
- **Diegimo gerosios praktikos**: Dabar rekomenduojamas peržiūros pirmasis darbo srautas
- **Dokumentacijos eiga**: Infrastruktūros patikra perkelta ankstesnei mokymosi proceso daliai
- **Dirbtuvių pateikimas**: Profesionalus būsenos pranešimas su aiškiu kūrimo laiko grafiku

#### Patobulinta
- **Saugumo pirmiausia požiūris**: Infrastruktūros pakeitimai dabar gali būti patikrinti prieš diegimą
- **Komandos bendradarbiavimas**: Peržiūros rezultatai gali būti bendrinami apžvalgai ir patvirtinimui
- **Išlaidų supratimas**: Geresnis resursų sąnaudų supratimas prieš provisioninimą
- **Rizikos mažinimas**: Sumažintas diegimo klaidų skaičius per išankstinę patikrą

#### Techninė įgyvendinimo dalis
- **Daugiadokumentinė integracija**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Gerosios praktikos integracija**: Peržiūra įtraukta į patikros darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJOS funkcijos žymėjimai atrandamumui

#### Dirbtuvių infrastruktūra
- **Būsenos komunikacija**: Profesionalus HTML baneris su gradientiniu stiliumi
- **Vartotojo patirtis**: Aiški kūrimo būsena užkerta kelią painiavai
- **Profesionalus pateikimas**: Išlaiko saugyklos patikimumą nustatant lūkesčius
- **Laiko linijos skaidrumas**: 2025 m. spalio mėn. paskutinio atnaujinimo laiko žyma dėl atskaitomybės

### [v3.3.0] - 2025-09-24

#### Patobintas dirbtuvių turinys ir interaktyvi mokymosi patirtis
**Ši versija pristato visapusišką dirbtuvių medžiagą su naršyklėje veikiančiais interaktyviais vadovais ir struktūruotais mokymosi keliais.**

#### Pridėta
- **🎥 Interaktyvus dirbtuvių vadovas**: Naršyklėje veikianti dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Struktūruotos dirbtuvių instrukcijos**: 7 žingsnių vedama mokymosi eiga nuo atradimo iki pritaikymo
  - 0-Introduction: Dirbtuvių apžvalga ir paruošimas
  - 1-Select-AI-Template: Šablonų atradimas ir pasirinkimo procesas
  - 2-Validate-AI-Template: Diegimo ir validavimo procedūros
  - 3-Deconstruct-AI-Template: Šablono architektūros supratimas
  - 4-Configure-AI-Template: Konfigūravimas ir pritaikymas
  - 5-Customize-AI-Template: Išplėstiniai pakeitimai ir iteracijos
  - 6-Teardown-Infrastructure: Išardymas ir išteklių valdymas
  - 7-Wrap-up: Santrauka ir tolesni žingsniai
- **🛠️ Dirbtuvių įrankiai**: MkDocs konfigūracija su Material tema, kad pagerintų mokymosi patirtį
- **🎯 Praktinė mokymosi eiga**: 3 žingsnių metodika (Atradimas → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces Integration**: Sklandi kūrimo aplinkos nustatymas

#### Patobulinta
- **AI Workshop Lab**: Išplėsta, suteikiant išsamų 2-3 valandų struktūruotą mokymosi patyrimą
- **Workshop Documentation**: Profesionalus pristatymas su navigacija ir vizualinėmis priemonėmis
- **Learning Progression**: Aiškios žingsnis po žingsnio gairės nuo šablono pasirinkimo iki diegimo į gamybą
- **Developer Experience**: Integruoti įrankiai supaprastintiems kūrimo srautams

#### Pagerinta
- **Accessibility**: Naršyklės pagrindu veikianti sąsaja su paieška, kodo kopijavimo funkcija ir temos perjungimu
- **Self-Paced Learning**: Lanksti dirbtuvių struktūra, pritaikoma skirtingam mokymosi tempui
- **Practical Application**: Realaus pasaulio AI šablonų diegimo scenarijai
- **Community Integration**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Built-in Search**: Greitas raktinių žodžių ir pamokų radimas
- **Copy Code Blocks**: Kopijavimas užvedus pelę visiems kodo pavyzdžiams
- **Theme Toggle**: Tamsaus/šviesaus režimo palaikymas skirtingiems pageidavimams
- **Visual Assets**: Ekrano nuotraukos ir diagramos geresniam supratimui
- **Help Integration**: Tiesioginis Discord prieigos ryšys bendruomenės palaikymui

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Ši versija pristato išsamią skyrių pagrindu veikiančią mokymosi struktūrą su patobulinta navigacija per visą saugyklą.**

#### Added
- **📚 Chapter-Based Learning System**: Perstruktūrizuota visa kursų medžiaga į 8 progresuojančius mokymosi skyrius
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 min)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 val.)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 min)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 val.)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 val.)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 val.)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 val.)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 val.)
- **📚 Comprehensive Navigation System**: Nuoseklūs navigacijos antraštės ir poraštės visoje dokumentacijoje
- **🎯 Progress Tracking**: Kurso užbaigimo kontrolinis sąrašas ir mokymosi patikrinimo sistema
- **🗺️ Learning Path Guidance**: Aiškūs įėjimo taškai skirtingiems įgūdžių lygiams ir tikslams
- **🔗 Cross-Reference Navigation**: Susiję skyriai ir išankstiniai reikalavimai aiškiai susieti

#### Enhanced
- **README Structure**: Pervesta į struktūruotą mokymosi platformą, pagrįstą skyriais
- **Documentation Navigation**: Kiekvienas puslapis dabar apima skyriaus kontekstą ir progresavimo gaires
- **Template Organization**: Pavyzdžiai ir šablonai priskirti tinkamiems mokymosi skyriams
- **Resource Integration**: Santraukos, DUK ir studijų gidai susieti su atitinkamais skyriais
- **Workshop Integration**: Praktinės laboratorijos susietos su daugybe skyrių mokymosi tikslų

#### Changed
- **Learning Progression**: Perkelta nuo linijinės dokumentacijos prie lanksčios, skyrių pagrindu veikiančios mokymosi struktūros
- **Configuration Placement**: Konfigūracijos vadovas perkeltas į Chapter 3 geresniam mokymosi srautui
- **AI Content Integration**: Geresnė AI specifinio turinio integracija per visą mokymosi kelią
- **Production Content**: Išplėstiniai modeliai suvesti į Chapter 8 įmonių mokymuisi

#### Improved
- **User Experience**: Aiškios navigacijos breadcrumb ir skyrių progreso indikatorių
- **Accessibility**: Nuoseklūs navigacijos modeliai, palengvinantys kurso peržiūrą
- **Professional Presentation**: Universitetinio stiliaus kursų struktūra, tinkama akademiniam ir korporaciniam mokymui
- **Learning Efficiency**: Sumažintas laikas rasti aktualų turinį dėl geresnės organizacijos

#### Techninis įgyvendinimas
- **Navigation Headers**: Standartizuota skyrių navigacija daugiau nei 40 dokumentacijos failuose
- **Footer Navigation**: Nuoseklios progresavimo gairės ir skyrių užbaigimo indikatoriai
- **Cross-Linking**: Išsami vidinė nuorodų sistema, susiejanti susijusias sąvokas
- **Chapter Mapping**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Perstruktūrizuotas studijų vadovas, suderintas su 8 skyrių sistema
- **🎯 Chapter-Based Assessment**: Kiekvienas skyrius apima konkrečius mokymosi tikslus ir praktinius pratimus
- **📋 Progress Tracking**: Savaitinė mokymosi programa su išmatuojamais rezultatais ir užbaigimo kontroliniais sąrašais
- **❓ Assessment Questions**: Klausimai žinių patikrinimui kiekvienam skyriui su profesiniais rezultatais
- **🛠️ Practical Exercises**: Praktinės veiklos su realiomis diegimo situacijomis ir trikčių šalinimu
- **📊 Skill Progression**: Aiškus pažangumas nuo pagrindinių sąvokų iki įmonių modelių su karjeros vystymosi akcentu
- **🎓 Certification Framework**: Profesinio tobulėjimo rezultatai ir bendruomenės pripažinimo sistema
- **⏱️ Timeline Management**: Struktūruotas 10 savaičių mokymosi planas su etapų patvirtinimu

### [v3.1.0] - 2025-09-17

#### Patobulinti daugiagentiniai AI sprendimai
**Ši versija patobulina daugiagentinį mažmeninės prekybos sprendimą su geresniu agentų vardinimu ir patobulinta dokumentacija.**

#### Changed
- **Multi-Agent Terminology**: Visame mažmeninės prekybos daugiagentiniame sprendime pakeistas "Cora agent" į "Customer agent" aiškesniam supratimui
- **Agent Architecture**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai, kad naudotų nuoseklų "Customer agent" vardinimą
- **Configuration Examples**: Modernizuoti agentų konfigūracijos modeliai su atnaujintomis vardinimo konvencijomis
- **Documentation Consistency**: Užtikrinta, kad visos nuorodos naudoja profesionalius, aprašomuosius agentų pavadinimus

#### Enhanced
- **ARM Template Package**: Atnaujintas retail-multiagent-arm-template su Customer agent nuorodomis
- **Architecture Diagrams**: Atnaujintos Mermaid diagramos su atnaujintu agentų vardinimu
- **Code Examples**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent vardinimą
- **Environment Variables**: Atnaujinti visi diegimo skriptai, kad naudotų CUSTOMER_AGENT_NAME konvencijas

#### Improved
- **Developer Experience**: Aiškesnės agentų rolės ir atsakomybės dokumentacijoje
- **Production Readiness**: Geresnis suderinimas su įmonių vardinimo konvencijomis
- **Learning Materials**: Intuityvesnis agentų pavadinimų naudojimas švietimo tikslais
- **Template Usability**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeistos CoraAgent klasės pavadinimai į CustomerAgent Python pavyzdžiuose
- Modifikuoti ARM šablono JSON konfigūracijos, kad naudotų "customer" agento tipą
- Atnaujinti aplinkos kintamieji nuo CORA_AGENT_* iki CUSTOMER_AGENT_* modelių
- Atnaujintos visos diegimo komandos ir konteinerių konfigūracijos

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Ši versija paverčia saugyklą išsamiu AI fokusavimu mokymosi ištekliu su Microsoft Foundry integracija.**

#### Added
- **🤖 AI-First Learning Path**: Pilnas pertvarkymas, teikiantis prioritetą AI kūrėjams ir inžinieriams
- **Microsoft Foundry Integration Guide**: Išsami dokumentacija, kaip sujungti AZD su Microsoft Foundry paslaugomis
- **AI Model Deployment Patterns**: Išsamus vadovas, apimantis modelio pasirinkimą, konfigūraciją ir diegimo į gamybą strategijas
- **AI Workshop Lab**: 2-3 valandų praktinės dirbtuvės AI programų konvertavimui į AZD diegimui tinkamus sprendimus
- **Production AI Best Practices**: Įmonėms skirtos praktikos mastelio didinimui, stebėsenai ir AI apkrovų apsaugai
- **AI-Specific Troubleshooting Guide**: Išsamus trikčių šalinimas Microsoft Foundry modeliams, Cognitive Services ir AI diegimo problemoms
- **AI Template Gallery**: Atrinkta Microsoft Foundry šablonų kolekcija su sudėtingumo įvertinimais
- **Workshop Materials**: Pilna dirbtuvių struktūra su praktinėmis laboratorijomis ir nuorodų medžiaga

#### Enhanced
- **README Structure**: Orientuota į AI kūrėjus su 45% bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Learning Paths**: Skirta AI kūrėjų kelionei kartu su tradiciniais takais studentams ir DevOps inžinieriams
- **Template Recommendations**: Išryškinti AI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Community Integration**: Patobulintas Discord bendruomenės palaikymas su AI-specifiniais kanalais ir diskusijomis

#### Security & Production Focus
- **Managed Identity Patterns**: AI specifinės autentifikacijos ir saugumo konfigūracijos
- **Cost Optimization**: Žetonų naudojimo sekimas ir biudžeto valdymas AI apkrovoms
- **Multi-Region Deployment**: Strategijos pasauliniam AI programų diegimui
- **Performance Monitoring**: AI specifiniai metrikai ir Application Insights integracija

#### Documentation Quality
- **Linear Course Structure**: Logiškas progresas nuo pradedančiojo iki pažangių AI diegimo modelių
- **Validated URLs**: Visos išorinės saugyklos nuorodos patikrintos ir pasiekiamos
- **Complete Reference**: Išsamus žinynas: visos vidinės dokumentacijos nuorodos patikrintos ir veikia
- **Production Ready**: Įmonių diegimo modeliai su realaus pasaulio pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Ši versija reiškia reikšmingą saugyklos struktūros ir turinio pateikimo pertvarkymą.**

#### Added
- **Structured Learning Framework**: Visos dokumentacijos puslapiai dabar apima Įvadą, Mokymosi tikslus ir Mokymosi rezultatų skirsnius
- **Navigation System**: Pridėtos Previous/Next lesson nuorodos per visą dokumentaciją vedamam mokymosi progresui
- **Study Guide**: Išsamus study-guide.md su mokymosi tikslais, praktiniais pratimais ir vertinimo medžiaga
- **Professional Presentation**: Pašalinti visi emoji ikonėlės dėl geresnio prieinamumo ir profesionalesnio vaizdo
- **Enhanced Content Structure**: Pagerinta mokymosi medžiagos organizacija ir srautas

#### Changed
- **Documentation Format**: Standartizuota visa dokumentacija su nuoseklia į mokymą orientuota struktūra
- **Navigation Flow**: Įgyvendintas logiškas progresas per visą mokymosi medžiagą
- **Content Presentation**: Pašalinti dekoratyviniai elementai, siekiant aiškios, profesionalesnės formos
- **Link Structure**: Atnaujintos visos vidinės nuorodos, kad palaikytų naują navigacijos sistemą

#### Improved
- **Accessibility**: Pašalinti emoji priklausomybės dėl geresnio suderinamumo su ekranų skaitytuvais
- **Professional Appearance**: Švarus, akademinio stiliaus pateikimas, tinkamas įmonių mokymuisi
- **Learning Experience**: Struktūruotas požiūris su aiškiais tikslais ir rezultatais kiekvienai pamokai
- **Content Organization**: Geresnis logiškas srautas ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Išsami "Getting Started" vadovų serija
  - Išsami diegimo ir paruošimo dokumentacija
  - Išsamūs trikčių šalinimo ištekliai ir derinimo vadovai
  - Išankstiniai diegimo tikrinimo įrankiai ir procedūros

- **Getting Started Module**
  - AZD Basics: Pagrindinės sąvokos ir terminologija
  - Installation Guide: Platformai specifiniai nustatymų nurodymai
  - Configuration Guide: Aplinkos nustatymas ir autentifikacija
  - First Project Tutorial: Žingsnis po žingsnio praktinis mokymasis

- **Deployment and Provisioning Module**
  - Deployment Guide: Pilna darbo eigos dokumentacija
  - Provisioning Guide: Infrastructure as Code su Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure išteklių prieinamumo patikra
  - SKU Selection: Išsami paslaugų sluoksnių gairė
  - Pre-flight Checks: Automatizuoti validavimo skriptai (PowerShell ir Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Dažnai pasitaikančios problemos ir sprendimai
  - Debugging Guide: Sistemingi trikčių šalinimo metodai
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Greita nuoroda pagrindinėms komandoms
  - Glossary: Išsami terminų ir santrumpų apibrėžimai
  - FAQ: Išsamūs atsakymai į dažnus klausimus
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Diegimo ir konfigūracijos vadovai Windows, macOS ir Linux
- **Multiple Skill Levels**: Turinys skirtas nuo studentų iki profesionalių kūrėjų
- **Practical Focus**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Comprehensive Coverage**: Nuo pagrindinių sąvokų iki sudėtingų įmonių modelių
- **Security-First Approach**: Saugumo geriausios praktikos integruotos per visą medžiagą
- **Cost Optimization**: Gairės ekonomiškiems diegimams ir išteklių valdymui

#### Documentation Quality
- **Detailed Code Examples**: Praktiniai, išbandyti kodo pavyzdžiai
- **Step-by-Step Instructions**: Aiškios, veiksmingos gairės
- **Comprehensive Error Handling**: Trikčių šalinimas dažnoms problemoms
- **Best Practices Integration**: Pramonės standartai ir rekomendacijos
- **Version Compatibility**: Atnaujinta su naujausiomis Azure paslaugomis ir azd funkcijomis

## Planuojami būsimieji patobulinimai

### Versija 3.1.0 (Planuojama)
#### AI platformos plėtra
- **Daugelio modelių palaikymas**: Integracijos modeliai su Hugging Face, Azure Machine Learning ir pasirinktiniais modeliais
- **AI agentų karkasai**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Pažangūs RAG šablonai**: Vektorinės duomenų bazės pasirinktys, be Azure AI Search (Pinecone, Weaviate, ir kt.)
- **AI stebėsena**: Patobulintas modelių našumo, žetonų naudojimo ir atsakymų kokybės stebėjimas

#### Kūrėjo patirtis
- **VS Code plėtinys**: Integruota AZD + Microsoft Foundry kūrimo patirtis
- **GitHub Copilot integracija**: AI pagalba generuojant AZD šablonus
- **Interaktyvūs vadovėliai**: Praktiniai programavimo užsiėmimai su automatiniu tikrinimu AI scenarijams
- **Vaizdo turinys**: Papildomi vaizdo vadovėliai vizualiai besimokantiems, susitelkę į AI diegimus

### Versija 4.0.0 (Planuojama)
#### Įmonių AI šablonai
- **Valdymo sistema**: AI modelių valdymas, atitiktis ir audito įrašai
- **Daugiaklientinis AI**: Šablonai keliems klientams aptarnauti su izoliuotomis AI paslaugomis
- **Edge AI diegimas**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hibridinis debesų AI**: Daugiadebesų ir hibridiniai diegimo šablonai AI darbo krūviams

#### Pažangios funkcijos
- **AI vamzdyno automatizavimas**: MLOps integracija su Azure Machine Learning vamzdynais
- **Pažangus saugumas**: Zero-trust modeliai, privatūs pabaigos taškai ir pažangus grėsmių apsaugos sprendimas
- **Veikimo optimizavimas**: Pažangios derinimo ir mastelio keitimo strategijos aukštos pralaidumo AI programoms
- **Globalus paskirstymas**: Turinio tiekimo ir edge talpinimo (caching) šablonai AI programoms

### Versija 3.0.0 (Planuojama) - Pakeista dabartiniu leidimu
#### Pasiūlyti priedai - dabar įgyvendinta v3.0.0
- ✅ **AI orientuotas turinys**: Išsami Microsoft Foundry integracija (Atlikta)
- ✅ **Interaktyvūs vadovėliai**: Praktinė AI dirbtuvių laboratorija (Atlikta)
- ✅ **Pažangus saugumo modulis**: AI specifiniai saugumo šablonai (Atlikta)
- ✅ **Veikimo optimizavimas**: AI darbo krūvių derinimo strategijos (Atlikta)

### Versija 2.1.0 (Planuojama) - Iš dalies įgyvendinta v3.0.0
#### Smulkūs patobulinimai - kai kurie įvykdyti dabartiniame leidime
- ✅ **Papildomi pavyzdžiai**: AI orientuoti diegimo scenarijai (Atlikta)
- ✅ **Išplėstas DUK**: AI specifiniai klausimai ir gedimų šalinimas (Atlikta)
- **Įrankių integracija**: Patobinti IDE ir redaktoriaus integracijos vadovai
- ✅ **Stebėjimo išplėtimas**: AI specifiniai stebėjimo ir įspėjimų šablonai (Atlikta)

#### Vis dar planuojama būsimam leidimui
- **Mobiliesiems pritaikyta dokumentacija**: Reaguojantis dizainas mobiliajam mokymuisi
- **Prieiga be interneto**: Atsisiunčiami dokumentacijos paketai
- **Patobinta IDE integracija**: VS Code plėtinys AZD + AI darbo eigoms
- **Bendruomenės informacinė panelė**: Realaus laiko bendruomenės metrika ir indėlių sekimas

## Prisidedant prie pakeitimų žurnalo

### Pranešant apie pakeitimus
Prisidėdami prie šios saugyklos, prašome užtikrinti, kad pakeitimų žurnalo įrašai apimtų:

1. **Versijos numeris**: Sekant semantinio versijavimo taisykles (major.minor.patch)
2. **Data**: Išleidimo arba atnaujinimo data formatu YYYY-MM-DD
3. **Kategorija**: Pridėta, Pakeista, Nebepalaikoma, Pašalinta, Ištaisyta, Saugumas
4. **Aiškus aprašymas**: Trumpas aprašymas, kas pasikeitė
5. **Poveikio vertinimas**: Kaip pakeitimai paveiks esamus vartotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, skriptai ar pagalbinės priemonės

#### Pakeista
- Pakeitimai esamai funkcionalumui ar dokumentacijai
- Atnaujinimai, skirti gerinti aiškumą ar tikslumą
- Turinio ar organizacijos pertvarkymas

#### Nebepalaikoma
- Funkcijos ar požiūriai, kurie palaipsniui atsisakomi
- Dokumentacijos skyriai, numatyti pašalinti
- Metodai, kuriems yra geresnės alternatyvos

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebėra aktualūs
- Pasenusi informacija ar nebepalaikomi metodai
- Pasikartojantis arba konsoliduotas turinys

#### Ištaisyta
- Klaidingų dokumentacijos ar kodo dalykų pataisymai
- Praneštų klaidų ar problemų sprendimas
- Tikslumo ar funkcionalumo patobulinimai

#### Saugumas
- Saugumo susiję patobulinimai ar pataisymai
- Atnaujinimai saugumo geriausioms praktikoms
- Saugumo pažeidžiamumų sprendimas

### Semantinio versijavimo gairės

#### Didžioji versija (X.0.0)
- Lūžtantys pakeitimai, reikalaujantys vartotojo veiksmų
- Reikšmingas turinio ar organizacijos pertvarkymas
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Mažoji versija (X.Y.0)
- Naujos funkcijos ar turinio priedai
- Patobulinimai, išlaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Pataisos versija (X.Y.Z)
- Klaidų taisymai ir pataisymai
- Maži patobulinimai esamam turiniui
- Paaiškinimai ir nedideli patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Aktyviai kviečiame bendruomenės atsiliepimus, kad pagerintume šį mokymosi išteklių:

### Kaip pateikti atsiliepimus
- **GitHub Issues**: Praneškite apie problemas arba pasiūlykite patobulinimus (AI-specifinės problemos laukiamos)
- **Discord diskusijos**: Dalinkitės idėjomis ir bendraukite su Microsoft Foundry bendruomene
- **Pull Requests**: Prisidėkite tiesioginiais turinio patobulinimais, ypač AI šablonais ir vadovais
- **Microsoft Foundry Discord**: Dalyvaukite #Azure kanale dėl AZD + AI diskusijų
- **Bendruomenės forumai**: Dalyvaukite platesnėse Azure kūrėjų diskusijose

### Atsiliepimų kategorijos
- **AI turinio tikslumas**: Pataisymai AI paslaugų integracijos ir diegimo informacijoje
- **Mokymosi patirtis**: Pasiūlymai dėl geresnio AI kūrėjo mokymosi srauto
- **Trūkstamas AI turinys**: Užklausos dėl papildomų AI šablonų, modelių ar pavyzdžių
- **Prieinamumas**: Patobulinimai įvairiems mokymosi poreikiams
- **AI įrankių integracija**: Pasiūlymai geresnei AI kūrimo darbo eigos integracijai
- **Gamybiniai AI šablonai**: Užklausos įmonių AI diegimo šablonams

### Atsakymo įsipareigojimas
- **Atsakymas į problemas**: Į problemų pranešimus atsakoma per 48 valandas
- **Funkcijų užklausos**: Įvertinimas per vieną savaitę
- **Bendruomenės indėliai**: Peržiūra per vieną savaitę
- **Saugumo problemos**: Skubi prioritetinė tvarka su pagreitintu atsaku

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Mėnesinės peržiūros**: Turinio tikslumo ir nuorodų tikrinimas
- **Ketvirtiniai atnaujinimai**: Reikšmingi turinio priedai ir patobulinimai
- **Pusmečio peržiūros**: Išsami pertvarka ir patobulinimai
- **Metiniai leidimai**: Pagrindiniai versijų atnaujinimai su reikšmingais patobulinimais

### Stebėsena ir kokybės užtikrinimas
- **Automatinis testavimas**: Reguliarus kodo pavyzdžių ir nuorodų tikrinimas
- **Bendruomenės atsiliepimų integracija**: Reguliarus vartotojų pasiūlymų įtraukimas
- **Technologijų atnaujinimai**: Suderinimas su naujausiomis Azure paslaugomis ir azd leidimais
- **Prieinamumo auditas**: Reguliarus peržiūra siekiant įtraukaus dizaino principų

## Versijų palaikymo politika

### Dabartinių versijų palaikymas
- **Naujausia pagrindinė versija**: Pilnas palaikymas su reguliariais atnaujinimais
- **Ankstesnė pagrindinė versija**: Saugumo atnaujinimai ir kritinių klaidų taisymai 12 mėnesių
- **Paveldėtos versijos**: Tik bendruomenės palaikymas, oficialių atnaujinimų nėra

### Migracijos gairės
Kai išleidžiamos pagrindinės versijos, mes teikiame:
- **Migracijos vadovai**: Žingsnis po žingsnio pereinamojo laikotarpio instrukcijos
- **Suderinamumo pastabos**: Informacija apie lūžtančius pakeitimus
- **Įrankių palaikymas**: Skriptai arba pagalbinės priemonės migracijai
- **Bendruomenės palaikymas**: Specialūs forumai migracijos klausimams

---

**Navigacija**
- **Ankstesnė pamoka**: [Studijų vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinis README](README.md)

**Sekite naujienas**: Stebėkite šią saugyklą dėl pranešimų apie naujus leidimus ir svarbius mokymo medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas pasitelkiant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
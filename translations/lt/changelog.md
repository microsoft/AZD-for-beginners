# Pakeitimų žurnalas - AZD pradedantiesiems

## Įvadas

Šis pakeitimų žurnalas dokumentuoja visus reikšmingus pakeitimus, atnaujinimus ir patobulinimus AZD For Beginners saugykloje. Laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume naudotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį pakeitimų žurnalą, jūs:
- Būsite informuoti apie naujas funkcijas ir papildomą turinį
- Suprasite patobulinimus esamoje dokumentacijoje
- Seksite klaidų taisymus ir pataisas, užtikrinančias tikslumą
- Seksite mokymo medžiagos vystymąsi laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pakeitimų įrašus, galėsite:
- Nustatyti naują turinį ir išteklius, prieinamus mokymuisi
- Suprasti, kurios skiltys buvo atnaujintos arba patobulintos
- Planuoti savo mokymosi kelią pagal naujausią medžiagą
- Teikti atsiliepimus ir pasiūlymus būsimiems patobulinimams

## Versijų istorija

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Ši versija uždaro likusius tarpinio lygio spragas, kurias parodyo azd-coverage analizė: kaip kurti ir publikuoti savo šabloną, reproducuojamos dev-container/Codespaces aplinkos, Pulumi infrastruktūros tiekėjas, Azure DevOps CI/CD vedlys, service-principal autentifikacija, host'o pasirinkimo gairės (AKS/ Spring Apps), `azd restore`/`azd package` paaiškinimai, hook klaidų tvarkymas ir komandos/bendros aplinkos praktikos.**

#### Pridėta
- **🧱 Nauja 4 skyriaus pamoka** `docs/chapter-04-infrastructure/custom-templates.md` — kaip kurti savo azd šabloną: reikalinga struktūra (`azure.yaml`, `infra/`, `src/`), laukas `metadata.template`, infrastruktūros parametrizavimas su `uniqueString()` resource token ir `azd-env-name` žyma, testavimas lokaliai su `azd init --template <local-path>`, publikavimas į GitHub ir pateikimas Awesome AZD galerijai
- **📦 Nauja 1 skyriaus pamoka** `docs/chapter-01-foundation/dev-containers.md` — reproducuojamos azd aplinkos su Dev Containers ir GitHub Codespaces: minimalus `.devcontainer/devcontainer.json`, naudojantis oficialiu `ghcr.io/azure/azure-dev/azd` feature, kalbai specifinės funkcijos, `docker-in-docker` konteinerių hostams ir `azd auth login --use-device-code` nuotoliniam prisijungimui
- **🧩 Pulumi su azd** skiltis faile `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi aplanko išdėstymas, stack'ai susieti su azd aplinkomis, reikalingi outputs/tag'ai ir identiškas `azd up` / `azd down` darbo srautas
- **🎯 Gairės host'o pasirinkimui** faile `docs/chapter-04-infrastructure/provisioning.md` — pradedantiesiems draugiškas `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ir `springapp` palyginimas, su gairėmis, kada pasirinkti AKS arba Azure Spring Apps
- **🛠️ Azure DevOps CI/CD vedlys** faile `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection su workload identity federation (OIDC), sugeneruotas `azure-dev.yml` ir variable-group konfigūracija
- **🔑 Service Principals (Pattern 4)** pridėta į `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktyvus `azd auth login` su client secret prieš federuotus/OIDC kredencialus, kada naudoti ir saugus kredencialų saugojimas
- **🪝 Hook klaidų tvarkymas** poskiltis faile `docs/chapter-04-infrastructure/deployment-guide.md` — išeities kodai ir `set -e`, `continueOnError`, hook testavimas izoliuotai su `azd hooks run`, OS specifinės shell aplinkos ir `--debug`
- **👥 Komandos / bendros aplinkos** skiltis faile `docs/chapter-03-configuration/configuration.md` — kas gyvena `.azure/`, ką įtraukti į .gitignore, per-vystytojo aplinkos, `azd env list`/`select` ir aplinkos reikšmių pateikimas CI/CD
- **🧰 `azd restore` ir išplėstas `azd package`** paaiškinimai faile `resources/cheat-sheet.md` — priklausomybių atkūrimas ir diegimo artefakto sukūrimas be diegimo

#### Pakeista
- **🧭 4 skyriaus pamokų lentelė** atnaujinta, kad įtrauktų naują „Authoring Your Own Template“ pamoką (Pamoka 3)
- **🧭 1 skyriaus pamokų lentelė** atnaujinta, kad įtrauktų naują „Dev Containers & Codespaces“ pamoką (Pamoka 5); navigacijos poraštės sujungtos tarp `bring-your-own-app.md` ir `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Ši versija uždaro didžiausias spragas pilnam pradedančiųjų vadovui pridėdama dvi praktines pamokas (diegiama multi-agent vedlys ir azd pridėjimas prie esamos programos), pradedančiųjų draugišką įvadą į hook'us, Terraform su azd skyrių, žingsnis po žingsnio GitHub Actions CI/CD vedlį, paaiškinimą apie naujas peržiūros (preview) extensions ir aiškią diegimo patikros kontrolinę lentelę.**

#### Pridėta
- **🤝 Nauja 5 skyriaus pamoka** `docs/chapter-05-multi-agent/multi-agent-basics.md` — visiškai praktinė, diegiama dviejų agentų vedlio pamoka (orchestration + specialistai) naudojant realų šabloną (`contoso-creative-writer`), apimanti kada naudoti multi-agent, `azd up` darbo eigą, supratimą apie diegiamas resursus, tarp-agentinį tracing, pritaikymą ir valymą
- **📦 Nauja 1 skyriaus pamoka** `docs/chapter-01-foundation/bring-your-own-app.md` — kaip pridėti azd prie esamo projekto su `azd init` („use code in the current directory“), `azure.yaml` ir `infra/` supratimas, `azd infra generate`, host aptikimas ir diegimas su `azd up`
- **🌐 Terraform su azd** skyrius pridėtas į `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigūracija, `.tf` aplanko išdėstymas, reikalingi `AZURE_*` outputs ir `azd-env-name` žymėjimas, bei identiškas `azd up` / `azd down` darbo srautas (uždaro spragą, kurioje anksčiau teigta apie Terraform palaikymą, bet rodytas tik Bicep)
- **⚙️ Žingsnis po žingsnio GitHub Actions vedlys** faile `docs/chapter-08-production/production-ai-practices.md` — nuo GitHub repo iki automatizuoto diegimo: `azd pipeline config`, OIDC federuoti kredencialai (be saugomų slaptų raktažodžių), sugeneruotas `azure-dev.yml` ir gairės apie secrets-vs-variables
- **🪝 Pradedančiųjų „Naujas su hook'ais?“ įžanga** faile `docs/chapter-04-infrastructure/deployment-guide.md` — kas yra hook'as, hook etapų lentelė, minimalus pirmasis hook'as ir hook'ų paleidimas rankiniu būdu su `azd hooks run`
- **✅ „Patikrinkite diegimą“ kontrolinis sąrašas** pridėtas 5 žingsniui faile `docs/chapter-01-foundation/first-project.md` — smoke testas, health-endpoint patikra ir aiškūs sėkmės kriterijai
- **🧩 Paaiškinimas dėl naujų peržiūros plėtinių** `azure.ai.skills` ir `azure.ai.connections` (kas jie yra ir kada juos naudoti) faile `docs/chapter-08-production/production-ai-practices.md`

#### Pakeista
- **🧭 5 skyriaus pamokų lentelė** ištaisyta: `multi-agent-basics.md` dabar yra Pamoka 1 (vienintelė visiškai praktinė pamoka), su aiškiu ženklinimu, kad Pamoka 2 yra 6 skyriuje ir kad Retail scenarijus yra architektūros šablonas, o ne vieno komandos šablonas
- **🧭 1 skyriaus pamokų lentelė** dabar apima naują „Bring Your Own App“ pamoką (Pamoka 4)
- **🔗 Navigacijos poraštės** atnaujintos: `first-project.md` dabar turi nuorodą į `bring-your-own-app.md`

#### Ištaisyta
- **🧱 Uždaryta „teigta, bet trūksta“ Terraform spraga** — kursas anksčiau nurodė Terraform palaikymą, bet jo nerodė
- **🔀 Ištaisyti klaidinančių 5 skyriaus kryžminiai saitai** kurie nurodė, kad egzistuoja pilna multi-agent įgyvendinimo versija, kai iš tikrųjų buvo tik architektūros šablonas

#### Atnaujinti failai
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(naujas)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(naujas)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Ši versija patikrina kursą su `azd` `1.25.6` (2026 m. birželis) ir `azure.ai.agents` `0.1.40-preview` plėtiniu, išplečia AI gaires nuo „agent scaffolding“ iki viso agentei skirtų gyvavimo ciklų (testuoti → vertinti → optimizuoti → tikrinti → ištrinti), parodo naujus `azure.ai.skills` ir `azure.ai.connections` preview plėtinius ir pažymi ".NET Aspire" → "Aspire" produkto pervadinimą.**

#### Pridėta
- **🔁 Pilnas agento gyvavimo ciklo aprėptis** pradedantiesiems ir AI inžinieriams per visą dokumentaciją:
  - `docs/chapter-01-foundation/azd-basics.md` — gyvavimo ciklo lentelė (scaffold → test → measure → improve → inspect → clean up) pridėta į Extensions and AI Commands skyrių
  - `docs/chapter-08-production/production-ai-practices.md` — nauja „Managing the Agent Lifecycle“ skiltis apimanti `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
  - `resources/cheat-sheet.md` — išplėsti AI Agent Commands su `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
- **🧩 Nauji preview plėtiniai** dokumentuoti: `azure.ai.skills` (pernaudojami agento įgūdžiai) ir `azure.ai.connections` (Foundry connections) pridėti į plėtinių lentelę ir cheat sheet
- **⏱️ Atsako laiko gairės** — `azd ai agent invoke` pavyzdžiai dabar nurodo, kad išveda bendrą latenciją ir time-to-first-byte
- **📌 Versijos baneris** pagrindiniame README nukreipiantis mokinius į `azd version` ir `azd upgrade`

#### Pakeista
- **✅ Validacijos pagrindinis lygis atnaujintas** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.25.6` (2026 m. birželis) visuose skyriaus README ir workshop dokumentuose
- **🤖 2 skyriaus plėtinių pastaba** atnaujinta nuo `azure.ai.agents` `0.1.18-preview` iki `0.1.40-preview`
- **🧪 Workshop validacijos pavyzdys** (`azd version` išvestis) atnaujintas į `1.25.6`
- **🧭 README „Kas naujo azd šiandien“** atnaujintas, kad pabrėžtų pilną agento gyvavimo ciklą, naujus AI plėtinius ir pastaruosius kokybės gerinimus (`azd init` idempotentiškumas, `azd auth login` pasenusio tokeno išvalymas, `azd tool` pirmo paleidimo pranešimas)
- **📖 2 skyriaus agents.md (Parinktis 4)** dabar nukreipia mokinius į po-diegimo gyvavimo ciklo komandas vietoje, kad sustotų ties `azd up`

#### Ištaisyta
- **🏷️ Produkto pavadinimas** — pridėta Aspire pervadinimo pastaba (".NET Aspire" dabar tiesiog "Aspire"); azd Aspire palaikymas nepasikeitė
- **🔎 Gyvas išleidimo patvirtinimas** patikrintas pagal Azure Developer CLI išleidimo srautą: stabilus CLI `1.25.6` (2026-06-12) ir `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Atnaujinti failai
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
#### Pradedančiųjų įvedimo paaiškinimas, nustatymo patikra ir galutinis AZD komandų išvalymas
**Ši versija papildo AZD 1.23 patikros potvarkį su pradedančiajam skirtu dokumentacijos peržiūros etapu: ji paaiškina AZD-pirmą autentifikacijos gaires, prideda vietinius nustatymo patikros scenarijus, patikrina pagrindines komandas su tiesioginiu AZD CLI ir pašalina paskutinius pasenusius anglų kalbos šaltinio komandų pavyzdžius už changelogo ribų.**

#### Pridėta
- **🧪 Pradedančiųjų nustatymo patikros scenarijai** su `validate-setup.ps1` ir `validate-setup.sh`, kad besimokantieji galėtų patvirtinti reikiamus įrankius prieš pradedant 1 skyrių
- **✅ Iškart atliekami nustatymo patikros žingsniai** pagrindiniame README ir 1 skyriaus README, kad trūkstami reikalavimai būtų aptikti prieš `azd up`

#### Pakeista
- **🔐 Pradedančiųjų autentifikacijos gairės** dabar nuosekliai traktuoja `azd auth login` kaip pagrindinį kelią AZD darbo eigoms, o `az login` pažymimas kaip neprivalomas, nebent tiesiogiai naudojamos Azure CLI komandos
- **📚 1 skyriaus įvedimo eiga** dabar nukreipia besimokančiuosius patikrinti vietinį nustatymą prieš diegimą, autentifikaciją ir pirmuosius diegimo žingsnius
- **🛠️ Validatoriaus pranešimai** dabar aiškiai atskiria blokuojančius reikalavimus nuo neprivalomų Azure CLI įspėjimų AZD-vienam pradedančiajam keliui
- **📖 Konfigūravimo, trikčių šalinimo ir pavyzdinių dokumentų** turinys dabar skiria tarp privalomos AZD autentifikacijos ir neprivalomos Azure CLI prisijungimo, kur anksčiau abu buvo pateikti be konteksto

#### Pataisyta
- **📋 Likusios anglų šaltinio komandų nuorodos** atnaujintos į dabartines AZD formas, įskaitant `azd config show` greitosios pagalbos lape ir `azd monitor --overview` ten, kur buvo numatyta Azure portalo apžvalga
- **🧭 Pradedančiųjų teiginiai 1 skyriuje** sušvelninti, kad būtų išvengta per didelių pažadų apie garantuotą klaidų nebuvimą ar visų šablonų ir Azure išteklių automatinius sugrąžinimo mechanizmus
- **🔎 Tiesioginė CLI patikra** patvirtino esamą palaikymą `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ir `azd down --force --purge`

#### Atnaujinti failai
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

#### AZD 1.23.12 patikra, dirbtuvių aplinkos išplėtimas ir AI modelio atnaujinimas
**Ši versija atlieka dokumentacijos patikros potvarkį prieš `azd` `1.23.12`, atnaujina pasenusius AZD komandų pavyzdžius, atnaujina AI modelio gaires pagal dabartinius numatytuosius nustatymus ir išplečia dirbtuvių instrukcijas taip, kad jos palaikytų ne tik GitHub Codespaces, bet ir dev container bei vietinius klonus.**

#### Pridėta
- **✅ Patikros pastabos pagrindiniuose skyriuose ir dirbtuvių dokumentacijoje** kad mokiniams būtų aišku, kokia AZD bazė buvo testuota naudojant skirtingas CLI versijas
- **⏱️ Diegimo laiko limitų gairės** ilgai trunkantiems AI programų diegimams naudojant `azd deploy --timeout 1800`
- **🔎 Plėtinių tikrinimo žingsniai** su `azd extension show azure.ai.agents` AI darbo eigų dokumentacijoje
- **🌐 Platesnės dirbtuvių aplinkos gairės** apimančios GitHub Codespaces, dev container ir vietinius klonus su MkDocs

#### Pakeista
- **📚 Skyriaus įvado README** dabar nuosekliai nurodo, kad buvo atlikta patikra su `azd 1.23.12` fonu fonduose, konfigūracijoje, infrastruktūroje, daugialypėse agentų, priešdiegimo, trikčių šalinimo ir gamybos skyriuose
- **🛠️ AZD komandų nuorodos** atnaujintos į dabartines formas visame dokumente:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` arba `azd env get-value(s)` priklausomai nuo konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ten, kur skirta Application Insights apžvalga
- **🧪 Provision peržiūros pavyzdžiai** supaprastinti į dabartinį palaikomą naudojimą, pvz., `azd provision --preview` ir `azd provision --preview -e production`
- **🧭 Dirbtuvių eiga** atnaujinta taip, kad besimokantieji galėtų atlikti laboratorijas Codespaces, dev container arba vietiniame klone, o ne manyti, jog vykdymas įmanomas tik Codespaces
- **🔐 Autentifikacijos gairės** dabar pirmenybę suteikia `azd auth login` AZD darbo eigoms, o `az login` pateikiamas kaip neprivalomas, kai tiesiogiai naudojamos Azure CLI komandos

#### Pataisyta
- **🪟 Windows diegimo komandos** suderintos su dabartiniu `winget` paketų rašybos formatu diegimo vadove
- **🐧 Linux diegimo gairės** pakoreguotos, kad būtų išvengta nepalaikomų sklaidos-specifiškų `azd` paketų tvarkyklės nurodymų ir vietoje to nukreipta į leidimo turtą, kur tai tinka
- **📦 AI modelių pavyzdžiai** atnaujinti nuo senesnių numatytųjų kaip `gpt-35-turbo` ir `text-embedding-ada-002` į dabartinius pvz., `gpt-4.1-mini`, `gpt-4.1` ir `text-embedding-3-large`
- **📋 Diegimo ir diagnostikos fragmentai** ištaisyti, kad naudotų dabartines aplinkos ir būsenos komandas žurnaluose, scenarijuose ir trikčių šalinimo žingsniuose
- **⚙️ GitHub Actions gairės** atnaujintos nuo `Azure/setup-azd@v1.0.0` iki `Azure/setup-azd@v2`
- **🤖 MCP/Copilot sutikimo gairės** atnaujintos nuo `azd mcp consent` iki `azd copilot consent list`

#### Patobulinta
- **🧠 AI skyriaus gairės** dabar geriau paaiškina peržiūrai jautrų `azd ai` elgesį, tenant- specifinį prisijungimą, dabartinį plėtinių naudojimą ir atnaujintas modelių diegimo rekomendacijas
- **🧪 Dirbtuvių instrukcijos** dabar naudoja realesnius versijų pavyzdžius ir aiškesnę aplinkos nustatymo kalbą praktinėms laboratorijoms
- **📈 Gamybos ir trikčių šalinimo dokumentai** dabar geriau suderinti su dabartinėmis stebėjimo, atsarginio modelio ir kainų sluoksnio gairėmis

#### Atnaujinti failai
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

#### AZD AI CLI komandos, turinio patikra ir šablonų išplėtimas
**Ši versija prideda `azd ai`, `azd extension` ir `azd mcp` komandų aprėptį visuose su AI susijusiuose skyriuose, ištaiso sulūžusias nuorodas ir pasenusią kodo dalį agents.md, atnaujina cheat sheet ir pertvarko Pavyzdinių šablonų skyrių su patikrintais aprašymais bei naujais Azure AI AZD šablonais.**

#### Pridėta
- **🤖 AZD AI CLI aprėptis** per 7 failus (anksčiau tik 8 skyriuje):
  - `docs/chapter-01-foundation/azd-basics.md` — Naujas skyrius "Extensions and AI Commands", pristatantis `azd extension`, `azd ai agent init` ir `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 4 variantas: `azd ai agent init` su palyginimo lentele (šablono prieš manifestą požiūris)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — poskyriai "AZD Extensions for Foundry" ir "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start dabar rodo tiek šablono, tiek manifesto pagrįstus diegimo kelius
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy skyrius dabar įtraukia `azd ai agent init` parinktį
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — poskyris "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Naujas skyrius "AI & Extensions Commands" su `azd extension`, `azd ai agent init`, `azd mcp` ir `azd infra generate`
- **📦 Nauji AZD AI pavyzdžių šablonai** `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG pokalbis su Blazor WebAssembly, Semantic Kernel ir balso pokalbių palaikymu
  - **azure-search-openai-demo-java** — Java RAG pokalbis naudojant Langchain4J su ACA/AKS diegimo parinktimis
  - **contoso-creative-writer** — Daugialypis kūrybinio rašymo agentų pritaikymas naudojant Azure AI Agent Service, Bing Grounding ir Prompty
  - **serverless-chat-langchainjs** — Serverless RAG naudojant Azure Functions + LangChain.js + Cosmos DB su Ollama vietinio vystymo palaikymu
  - **chat-with-your-data-solution-accelerator** — Įmonių RAG akceleratorius su administravimo portalu, Teams integracija ir PostgreSQL/Cosmos DB parinktimis
  - **azure-ai-travel-agents** — Daugialypės MCP orkestracijos pavyzdinė programa su serveriais .NET, Python, Java ir TypeScript
  - **azd-ai-starter** — Minimalus Azure AI infrastruktūros Bicep pradžios šablonas
  - **🔗 Awesome AZD AI Gallery link** — Nuoroda į [awesome-azd AI galeriją](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablonų)

#### Pataisyta
- **🔗 agents.md navigacija**: Ankstesnės/Next nuorodos dabar atitinka 2 skyriaus README pamokų tvarką (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md sulūžusios nuorodos**: `production-ai-practices.md` ištaisyta į `../chapter-08-production/production-ai-practices.md` (3 vietos)
- **📦 agents.md pasenęs kodas**: Pakeistas `opencensus` į `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neteisingas API**: `max_tokens` perkelta iš `create_agent()` į `create_run()` kaip `max_completion_tokens`
- **🔢 agents.md žetonų skaičiavimas**: Pakeistas grubus `len//4` spėjimas į `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ištaisyti paslaugų pavadinimai iš "Cognitive Search + App Service" į "Azure AI Search + Azure Container Apps" (numatytasis hostas pakeistas 2024 m. spalį)
- **contoso-chat**: Aprašymas atnaujintas, kad nurodytų Azure AI Foundry + Prompty, atitinkant repo faktinį pavadinimą ir technologijų rinkinį

#### Pašalinta
- **ai-document-processing**: Pašalinta neveikianti šablono nuoroda (repo nėra viešai prieinamas kaip AZD šablonas)

#### Patobulinta
- **📝 agents.md pratimai**: 1 užduotis dabar rodo numatomą išvestį ir `azd monitor` žingsnį; 2 užduotis įtraukia visą `FunctionTool` registracijos kodą; 3 užduotis pakeičia miglotą nurodymą konkrečiais `prepdocs.py` komandų veiksmais
- **📚 agents.md ištekliai**: Atnaujintos dokumentacijos nuorodos į dabartinius Azure AI Agent Service dokumentus ir greitąjį startą
- **📋 agents.md Kitos žingsnių lentelė**: Pridėta AI Workshop Lab nuoroda pilnam skyriaus aprėpimui

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
- **Course Map Table**: Patobulinta su tiesioginėmis pamokų nuorodomis, trukmės įverčiais ir sudėtingumo įvertinimais
- **Folder Cleanup**: Pašalinti pasikartojantys seni katalogai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Patikrinta visos 21+ vidinės nuorodos Course Map lentelėje

### [v3.16.0] - 2026-02-05

#### Produkto pavadinimų atnaujinimai
**Ši versija atnaujina produkto nuorodas, kad atitiktų dabartinį Microsoft prekės ženklą.**

#### Pakeista
- **Microsoft Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas, kad atspindėtų dabartinį prekės ženklą

#### Atnaujinti failai
- `README.md` - Pagrindinis kurso pasveikinimo puslapis
- `changelog.md` - Versijų istorija
- `course-outline.md` - Kurso struktūra
- `docs/chapter-02-ai-development/agents.md` - Vadovas apie AI agentus
- `examples/README.md` - Pavyzdžių dokumentacija
- `workshop/README.md` - Dirbtuvių pasveikinimo puslapis
- `workshop/docs/index.md` - Dirbtuvių indeksas
- `workshop/docs/instructions/*.md` - Visi dirbtuvių instrukcijų failai

---

### [v3.15.0] - 2026-02-05

#### Didelis saugyklos pertvarkymas: aplankų pavadinimai pagal skyrius
**Ši versija pertvarko dokumentaciją į atskirus skyriaus katalogus aiškesnei navigacijai.**

#### Aplankų pervadinimai
Seni aplankai pakeisti į skyriaus numeriais pažymėtus katalogus:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridėta nauja: `docs/chapter-05-multi-agent/`

#### Failų migracijos
| Failas | From | To |
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
- **📚 Chapter README files**: Sukurti README.md kiekviename skyriaus kataloge su:
  - Mokymosi tikslais ir trukmės informacija
  - Pamokų lentele su aprašymais
  - Greito pradžios komandomis
  - Navigacija į kitus skyrius

#### Pakeista
- **🔗 Atnaujintos visos vidinės nuorodos**: Atnaujinta 78+ kelių tarp visų dokumentacijos failų
- **🗺️ Pagrindinis README.md**: Atnaujintas Kurso žemėlapis su nauja skyrių struktūra
- **📝 examples/README.md**: Atnaujintos kryžminės nuorodos į skyriaus katalogus

#### Pašalinta
- Sena aplankų struktūra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Saugyklos pertvarkymas: skyriaus navigacija
**Ši versija pridėjo skyriaus navigacijos README failus (pakeista v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Naujas AI agentų vadovas
**Ši versija prideda išsamų vadovą AI agentų diegimui su Azure Developer CLI.**

#### Pridėta
- **🤖 docs/microsoft-foundry/agents.md**: Išsamus vadovas apimantis:
  - Kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trijų greito paleidimo agentų šablonų (Foundry Agents, Prompty, RAG)
  - Agentų architektūros modeliai (vienas agentas, RAG, daugagentinė)
  - Įrankių konfigūracija ir pritaikymas
  - Stebėjimas ir metrikų sekimas
  - Kainų svarstymai ir optimizavimas
  - Dažniausiai pasitaikančios trikčių šalinimo situacijos
  - Trys praktinės užduotys su sėkmės kriterijais

#### Turinys ir struktūra
- **Introduction**: Agentų koncepcijos pradedantiesiems
- **Quick Start**: Diegti agentus su `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Vizualūs agentų modelių diagramų pavyzdžiai
- **Configuration**: Įrankių nustatymai ir aplinkos kintamieji
- **Monitoring**: Application Insights integracija
- **Exercises**: Nuoseklus praktinis mokymasis (kiekviena užduotis 20–45 minutes)

---

### [v3.12.0] - 2026-02-05

#### DevContainer aplinkos atnaujinimas
**Ši versija atnaujina kūrimo konteinerio konfigūraciją su moderniais įrankiais ir geresniais numatytaisiais nustatymais AZD mokymosi patirčiai.**

#### Pakeista
- **🐳 Bazinis vaizdas**: Atnaujinta iš `python:3.12-bullseye` į `python:3.12-bookworm` (naujausia Debian stabili versija)
- **📛 Konteinerio pavadinimas**: Pervadinta iš "Python 3" į "AZD for Beginners" dėl aiškumo

#### Pridėta
- **🔧 Naujos Dev Container funkcijos**:
  - `azure-cli` su įjungta Bicep palaikymu
  - `node:20` (LTS versija AZD šablonams)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerių programų diegimui

- **🔌 Prievadų persiuntimas**: Iš anksto sukonfigūruoti prievadai dažniausiai naudojamai plėtrai:
  - 8000 (MkDocs peržiūra)
  - 3000 (Tinklapiai)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Naujos VS Code plėtiniai**:
  - `ms-python.vscode-pylance` - Pagerintas Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions palaikymas
  - `ms-azuretools.vscode-docker` - Docker palaikymas
  - `ms-azuretools.vscode-bicep` - Bicep kalbos palaikymas
  - `ms-azure-devtools.azure-resource-groups` - Azure išteklių valdymas
  - `yzhang.markdown-all-in-one` - Markdown redagavimas
  - `DavidAnson.vscode-markdownlint` - Markdown lintinimas
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (skirta azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code nustatymai**: Pridėti numatytieji nustatymai Python interpreteriui, formatavimui išsaugojant ir tarpų šalinimui

- **📦 Atnaujintas requirements-dev.txt**:
  - Pridėtas MkDocs minify priedas
  - Pridėtas pre-commit kodo kokybei
  - Pridėtos Azure SDK bibliotekos (azure-identity, azure-mgmt-resource)

#### Ištaisyta
- **Post-Create komanda**: Dabar patikrina AZD ir Azure CLI įdiegimą paleidus konteinerį

---

### [v3.11.0] - 2026-02-05

#### README draugiškas pradedantiesiems pertvarkymas
**Ši versija žymiai pagerina README.md, kad jis būtų prieinamesnis pradedantiesiems, ir prideda svarbius išteklius AI kūrėjams.**

#### Pridėta
- **🆚 Azure CLI vs AZD palyginimas**: Aiškus paaiškinimas, kada naudoti kurią priemonę su praktiniais pavyzdžiais
- **🌟 Awesome AZD nuorodos**: Tiesioginės nuorodos į bendruomenės šablonų galeriją ir prisidėjimo išteklius:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ paruoštų diegti šablonų
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Bendruomenės prisidėjimas
- **🎯 Greitas pradžios vadovas**: Supaprastintas 3 žingsnių pradžios sekcija (Įdiegti → Prisijungti → Diegti)
- **📊 Pagal patirtį pritaikyta navigacijos lentelė**: Aiškios rekomendacijos, nuo ko pradėti pagal kūrėjo patirtį

#### Pakeista
- **README struktūra**: Pertvarkyta progresiniam informacijos atskleidimui - svarbiausia informacija pirmiausia
- **Įžangos skyrius**: Perrašyta, kad paaiškintų "The Magic of `azd up`" visiškai pradedantiesiems
- **Pašalintas pasikartojantis turinys**: Išimtas dubliuojantis trikčių šalinimo skyrius
- **Trikčių šalinimo komandos**: Pataisyta `azd logs` nuoroda, naudojant galiojantį `azd monitor --logs`

#### Ištaisyta
- **🔐 Autentifikacijos komandos**: Įtraukti `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Neteisingos komandų nuorodos**: Pašalintos likusios `azd logs` nuorodos README trikčių šalinimo skyriuje

#### Pastabos
- **Apimtis**: Pakeitimai taikyti pagrindiniam README.md ir resources/cheat-sheet.md
- **Tikslinė auditorija**: Patobulinimai skirti specialiai AZD pradedantiesiems kūrėjams

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI komandų tikslumo atnaujinimas
**Ši versija ištaiso neegzistuojančias AZD komandas visoje dokumentacijoje, užtikrindama, kad visi kodo pavyzdžiai naudoja galiojančią Azure Developer CLI sintaksę.**

#### Ištaisyta
- **🔧 Pašalintos neegzistuojančios AZD komandos**: Išsamus auditavimas ir neteisingų komandų taisymas:
  - `azd logs` (nėra) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` subkomandos (nerastas) → pakeista į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (nerastas) → pašalinta arba pakeista galiojančiomis alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` vėliavų (nerastas) → pašalintos
  - `azd provision --what-if/--rollback` vėliavos (nerastas) → atnaujinta naudoti `--preview`
  - `azd config validate` (nėra) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nėra) → pašalintos

- **📚 Failai atnaujinti su komandų pataisymais**:
  - `resources/cheat-sheet.md`: Didelis komandinio žodyno pertvarkymas
  - `docs/deployment/deployment-guide.md`: Pataisyta atsukimo ir diegimo strategijos
  - `docs/troubleshooting/debugging.md`: Pataisytos žurnalų analizės skiltys
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyta AZD derinimo skiltis
  - `docs/getting-started/azd-basics.md`: Pataisytos stebėjimo komandos
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir derinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Pataisyti pagalbos ir versijų pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Pataisytos žurnalų peržiūros komandos
  - `docs/pre-deployment/coordination-patterns.md`: Pataisyti agentų derinimo komandos

- **📝 Versijos nuoroda atnaujinta**:
  - `docs/getting-started/installation.md`: Pakeista kietai užkoduota `1.5.0` versija į bendrai `1.x.x` su nuoroda į leidimus

#### Pakeista
- **Atsukimo strategijos**: Dokumentacija atnaujinta naudoti Git pagrįstą atsukimą (AZD neturi natūralaus atsukimo)
- **Žurnalų peržiūra**: `azd logs` nuorodos pakeistos į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Veikimo skyrius**: Pašalintos neegzistuojančios lygiagretaus/incremental diegimo vėliavos, pateiktos galiojančios alternatyvos

#### Techninės detalės
- **Galiojančios AZD komandos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galiojantys azd monitor parametrai**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patikrinimas**: Komandos patikrintos pagal Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dirbtuvių užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvius dirbtuvių modulius, pataiso visas sulūžusias dokumentacijos nuorodas ir pagerina bendrą turinio kokybę AI kūrėjams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujas prisidėjimo gairių dokumentas su:
  - Aiškios instrukcijos dėl problemų pranešimo ir pakeitimų siūlymo
  - Dokumentacijos standartai naujam turiniui
  - Kodo pavyzdžių gairės ir commit žinučių konvencijos
  - Bendruomenės įsitraukimo informacija

#### Užbaigta
- **🎯 Dirbtuvių modulis 7 (Apibendrinimas)**: Visiškai užbaigtas apibendrinimo modulis su:
  - Išsami dirbtuvių pasiekimų santrauka
  - Įsisavintų pagrindinių koncepcijų skyrius, apimantis AZD, šablonus ir Microsoft Foundry
  - Rekomendacijos tolimesnei mokymosi eigai
  - Dirbtuvių iššūkių užduotys su sudėtingumo įvertinimais
  - Bendruomenės atsiliepimų ir palaikymo nuorodos

- **📚 Dirbtuvių modulis 3 (Išardymas)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot aktyvavimo instrukcijos su MCP serveriais
  - Supratimas apie AZD šablonų aplankų struktūrą
  - Infrastruktūros kaip kodo (Bicep) organizavimo modeliai
  - Praktinių užsiėmimų instrukcijos

- **🔧 Dirbtuvių modulis 6 (Išvalymas)**: Užbaigtas su:
  - Resursų pašalinimo ir sąnaudų valdymo tikslai
  - `azd down` naudojimas saugiam infrastruktūros išmontavimui
  - Vadovas, kaip atkurti minkštai ištrintas kognityvines paslaugas
  - Papildomi tyrinėjimo uždaviniai GitHub Copilot ir Azure Portal

#### Ištaisyta
- **🔗 Sugadintų nuorodų taisymai**: Išspręsta daugiau nei 15 sugedusių vidinių dokumentacijos nuorodų:
  - `docs/ai-foundry/ai-model-deployment.md`: Ištaisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyti ai-model-deployment.md ir production-ai-practices.md keliai
  - `docs/getting-started/first-project.md`: Nepasiekiamą cicd-integration.md pakeista deployment-guide.md
  - `examples/retail-scenario.md`: Ištaisyti DUK ir problemų sprendimo vadovo keliai
  - `examples/container-app/microservices/README.md`: Pataisyti kurso pradžios ir diegimo vadovo keliai
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujintos AI skyriaus nuorodos
  - `course-outline.md`: Ištaisyti instruktoriaus vadovo ir AI dirbtuvių laboratorijų nuorodos

- **📅 Dirbtuvių būsenos baneris**: Atnaujinta nuo "Under Construction" į aktyvią dirbtuvių būseną su 2026 m. vasario data

- **🔗 Dirbtuvių navigacija**: Ištaisyti sugadinti navigacijos saitai workshop README.md, nukreipę į neegzistuojantį lab-1-azd-basics aplanką

#### Pakeista
- **Dirbtuvių prezentacija**: Pašalintas įspėjimas „under construction“; dirbtuvės dabar užbaigtos ir paruoštos naudoti
- **Navigacijos nuoseklumas**: Užtikrinta, kad visi dirbtuvių moduliai turi tinkamą tarpusavio navigaciją
- **Nuorodos mokymosi kelyje**: Atnaujintos skyrių kryžminės nuorodos, kad naudotų teisingus microsoft-foundry kelius

#### Patvirtinta
- ✅ Visos anglų kalbos markdown bylos turi galiojančias vidines nuorodas
- ✅ Dirbtuvių moduliai 0–7 yra baigti su mokymosi tikslais
- ✅ Navigacija tarp skyrių ir modulių veikia tinkamai
- ✅ Turinys tinka AI kūrėjams, naudojantiems Microsoft AZD
- ✅ Palaikomas pradedančiųjų draugiškas kalbos stilius ir struktūra
- ✅ CONTRIBUTING.md pateikia aiškias gairės bendruomenės prisidėjimui

#### Techninė įgyvendinimas
- **Nuorodų patikra**: Automatinis PowerShell scenarijus patikrino visas .md vidines nuorodas
- **Turinio auditas**: Rankinė dirbtuvių pilnumo ir tinkamumo pradedantiesiems peržiūra
- **Navigacijos sistema**: Taikyti nuoseklūs skyriaus ir modulio navigacijos modeliai

#### Pastabos
- **Apimtis**: Pakeitimai taikyti tik anglų dokumentacijai
- **Vertimai**: Vertimo aplankai nebuvo atnaujinti šiame leidime (automatinis vertimas bus sinchronizuotas vėliau)
- **Dirbtuvių trukmė**: Komplektinės dirbtuvės dabar suteikia 3–4 valandas praktinio mokymosi

---

### [v3.8.0] - 2025-11-19

#### Išplėstinė dokumentacija: stebėjimas, saugumas ir daugelio agentų modeliai
**Šis leidimas prideda išsamius A lygio užsiėmimus apie Application Insights integraciją, autentifikacijos modelius ir daugelio agentų koordinaciją gamybiniams diegimams.**

#### Pridėta
- **📊 Pamoka apie Application Insights integraciją**: in `docs/pre-deployment/application-insights.md`:
  - AZD orientuotas diegimas su automatiniu teikimu
  - Visi Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pasirinktine telemetrija (1,200+ lines)
  - AI/LLM stebėjimo modeliai (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagramų (architektūra, paskirstytas sekimas, telemetrijos srautas)
  - 3 praktinės užduotys (įspėjimai, valdymo skydeliai, AI stebėjimas)
  - Kusto užklausų pavyzdžiai ir sąnaudų optimizavimo strategijos
  - Gyvų metrinių srautų transliacija ir realaus laiko derinimas
  - 40-50 minute learning time with production-ready patterns

- **🔐 Pamoka apie autentifikaciją ir saugumo modelius**: in `docs/getting-started/authsecurity.md`:
  - 3 autentifikacijos modeliai (connection strings, Key Vault, managed identity)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilnos užduotys (įjungti managed identity, user-assigned identity, Key Vault rotation)
  - Saugumo geriausios praktikos ir RBAC konfigūracijos
  - Gedimų šalinimo vadovas ir sąnaudų analizė
  - Production-ready passwordless authentication patterns

- **🤖 Pamoka apie daugelio agentų koordinavimo modelius**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinavimo modeliai (sequential, parallel, hierarchical, event-driven, consensus)
  - Pilna orkestratoriaus paslaugos įgyvendinimas (Python/Flask, 1,500+ lines)
  - 3 specializuoti agentų įgyvendinimai (Research, Writer, Editor)
  - Service Bus integracija pranešimų eilėms
  - Cosmos DB būsenos valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramų, rodantys agentų sąveikas
  - 3 pažangios užduotys (timeout handling, retry logic, circuit breaker)
  - Sąnaudų suskirstymas ($240-565/month) su optimizavimo strategijomis
  - Application Insights integracija stebėjimui

#### Patobulinta
- **Pre-deployment skyrius**: Dabar apima išsamius stebėjimo ir koordinavimo modelius
- **Getting Started skyrius**: Patobulintas su profesionaliais autentifikacijos modeliais
- **Gamybinis pasirengimas**: Visapusiškas aprėptis nuo saugumo iki stebėjimo
- **Kurso apžvalga**: Atnaujinta, kad nurodytų naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi eiga**: Geresnė saugumo ir stebėjimo integracija visame kurse
- **Dokumentacijos kokybė**: Nuoseklūs A lygio standartai (95-97%) naujose pamokose
- **Gamybiniai modeliai**: Viso proceso aprėptis įmoniniams diegimams

#### Pagerinta
- **Kūrėjų patirtis**: Aiškus kelias nuo vystymo iki gamybinio stebėjimo
- **Saugumo standartai**: Profesionalūs modeliai autentifikacijai ir slaptos informacijos valdymui
- **Observabilumas**: Visiška Application Insights integracija su AZD
- **AI apkrovos**: Specializuotas stebėjimas Microsoft Foundry Models ir daugelio agentų sistemoms

#### Patvirtinta
- ✅ Visose pamokose yra pilnas veikiantis kodas (ne fragmentai)
- ✅ Mermaid diagramos vizualiam mokymuisi (iš viso 19 per 3 pamokas)
- ✅ Praktinės užduotys su patikros žingsniais (iš viso 9)
- ✅ Gamybiniai Bicep šablonai, diegiami per `azd up`
- ✅ Sąnaudų analizė ir optimizavimo strategijos
- ✅ Gedimų šalinimo vadovai ir geriausios praktikos
- ✅ Žinių patikros taškai su patikros komandomis

#### Dokumentacijos įvertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsamus stebėjimo vadovas
- **docs/getting-started/authsecurity.md**: - Profesionali saugumo modelių apžvalga
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios daugelio agentų architektūros
- **Bendras naujas turinys**: - Nuoseklūs aukštos kokybės standartai

#### Techninė įgyvendinimas
- **Application Insights**: Log Analytics + pasirinktine telemetrija + paskirstytas sekimas
- **Autentifikacija**: Managed Identity + Key Vault + RBAC modeliai
- **Daugelio agentų**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Stebėjimas**: Gyvi metrikos duomenys + Kusto užklausos + įspėjimai + valdymo skydeliai
- **Sąnaudų valdymas**: mėginių ėmimo strategijos, saugojimo politikos, biudžeto kontrolė

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Microsoft Foundry Models pavyzdys
**Šis leidimas pagerina dokumentacijos kokybę visame saugykloje ir prideda pilną Microsoft Foundry Models diegimo pavyzdį su gpt-4.1 pokalbio sąsaja.**

#### Pridėta
- **🤖 Microsoft Foundry Models pokalbio pavyzdys**: Pilnas gpt-4.1 diegimas su veikiančia įgyvendinimo versija `examples/azure-openai-chat/`:
  - Pilna Microsoft Foundry Models infrastruktūra (gpt-4.1 modelio diegimas)
  - Python komandų eilutės pokalbio sąsaja su pokalbio istorija
  - Key Vault integracija saugiam API raktų saugojimui
  - Žetonų naudojimo sekimas ir sąnaudų įvertinimas
  - Rate limiting ir klaidų tvarkymas
  - Išsamus README su 35-45 minučių diegimo vadovu
  - 11 gamybai paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos pratimai**: Pridėtos praktinės užduotys konfigūracijos vadove:
  - Užduotis 1: Daugiaaplinkių konfigūracija (15 minučių)
  - Užduotis 2: Slaptos informacijos valdymo pratimas (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikros žingsniai
- **✅ Diegimo patikra**: Pridėta patikros skiltis diegimo vadove:
  - Sveikatos tikrinimo procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Laukiami rezultatai visoms diegimo komandoms
  - Greita problemų sprendimo nuoroda

#### Patobulinta
- **examples/README.md**: Atnaujinta iki A lygio kokybės (93%):
  - Pridėtas azure-openai-chat į visas atitinkamas dalis
  - Vietinių pavyzdžių skaičius atnaujintas iš 3 į 4
  - Įtrauktas į AI taikomųjų programų pavyzdžių lentelę
  - Integruotas į Greitojo paleidimo vidutinio lygio naudotojams skyrių
  - Pridėtas prie Microsoft Foundry Templates skilties
  - Atnaujintas palyginimo matrica ir technologijų radimo skyriai
- **Dokumentacijos kokybė**: Pagerinta iš B+ (87%) iki A- (92%) visame docs kataloge:
  - Įtraukti laukiamieji rezultatai kritiniuose komandų pavyzdžiuose
  - Įtraukti patikros žingsniai konfigūracijos pakeitimams
  - Pagerintas praktinis mokymasis su praktinėmis užduotimis

#### Pakeista
- **Mokymosi eiga**: Geresnė AI pavyzdžių integracija vidutinio lygio besimokantiesiems
- **Dokumentacijos struktūra**: Veiksmingesnės užduotys su aiškiais rezultatais
- **Patikros procesas**: Pridėti aiškūs sėkmės kriterijai pagrindiniuose darbo eigos žingsniuose

#### Patobulinta
- **Kūrėjų patirtis**: Microsoft Foundry Models diegimas dabar trunka 35–45 minutes (anksčiau 60–90 sudėtingiems alternatyvams)
- **Sąnaudų skaidrumas**: Aiškūs sąnaudų įverčiai ($50-200/month) Microsoft Foundry Models pavyzdžiui
- **Mokymosi kelias**: AI kūrėjams suteiktas aiškus pradžios taškas su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs laukiamieji rezultatai ir patikros žingsniai

#### Patvirtinta
- ✅ Microsoft Foundry Models pavyzdys visiškai veikiantis su `azd up`
- ✅ Visi 11 įgyvendinimo failų sintaksiškai teisingi
- ✅ README instrukcijos atitinka faktišką diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra pasikartojančių išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninė įgyvendinimas
- **Microsoft Foundry Models architektūra**: gpt-4.1 + Key Vault + Container Apps modelis
- **Saugumas**: Paruošta Managed Identity, slaptieji raktai Key Vault
- **Stebėjimas**: Application Insights integracija
- **Sąnaudų valdymas**: Žetonų sekimas ir naudojimo optimizacija
- **Diegimas**: Viena `azd up` komanda pilnam nustatymui

### [v3.6.0] - 2025-11-19

#### Svarbus atnaujinimas: Container App diegimo pavyzdžiai
**Šis leidimas pristato išsamius, gamybai paruoštus konteinerizuotų programų diegimo pavyzdžius, naudojant Azure Developer CLI (AZD), su pilna dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Container App pavyzdžiai**: Nauji vietiniai pavyzdžiai `examples/container-app/`:
  - [Pagrindinis vadovas](examples/container-app/README.md): Išsami konteinerizuotų diegimų apžvalga, greitas pradėjimas, gamybiniai ir pažangūs modeliai
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Pradedančiajam draugiškas REST API su scale-to-zero, sveikatos patikromis, stebėjimu ir gedimų šalinimu
  - [Microservices Architecture](../../examples/container-app/microservices): Gamybai paruoštas daugiaservis diegimas (API Gateway, Product, Order, User, Notification), asinchroninis žinučių siuntimas, Service Bus, Cosmos DB, Azure SQL, paskirstytas tracingas, blue-green/canary diegimas
- **Geriausios praktikos**: Saugumas, stebėjimas, sąnaudų optimizavimas ir CI/CD gairės konteinerizuotoms apkrovoms
- **Kodo pavyzdžiai**: Pilni `azure.yaml`, Bicep šablonai ir daugakalbiai serviso įgyvendinimai (Python, Node.js, C#, Go)
- **Testavimas ir gedimų šalinimas**: End-to-end testų scenarijai, stebėjimo komandos, gedimų šalinimo gairės

#### Pakeista
- **README.md**: Atnaujinta, kad būtų pabrėžti ir susieti nauji container app pavyzdžiai skiltyje "Local Examples - Container Applications"
- **examples/README.md**: Atnaujinta, kad būtų akcentuoti container app pavyzdžiai, pridėta į palyginimo matricą ir atnaujinti technologijų/architektūros skyriai
- **Kurso apžvalga ir studijų vadovas**: Atnaujinta, kad nurodytų naujus container app pavyzdžius ir diegimo modelius atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai diegiami su `azd up` ir atitinka geriausias praktikas
- ✅ Dokumentacijos kryžminės nuorodos ir navigacija atnaujintos
- ✅ Pavyzdžiai aprėpia nuo pradedančiojo iki pažengusio scenarijus, įskaitant gamybinius mikroservisus

#### Pastabos
- **Apimtis**: Anglų dokumentacija ir pavyzdžiai tik
- **Kiti žingsniai**: Ateities leidimuose išplėsti pažangūs konteinerių modeliai ir CI/CD automatizacija

### [v3.5.0] - 2025-11-19

#### Produkto pervadinimas: Microsoft Foundry
**Šis leidimas įgyvendina išsamų produkto pavadinimo pakeitimą nuo "Microsoft Foundry" į "Microsoft Foundry" visoje anglų dokumentacijoje, atspindint oficialų Microsoft prekės ženklo pakeitimą.**

#### Pakeista
- **🔄 Produkto pavadinimo atnaujinimas**: Visiškas pervadinimas nuo "Microsoft Foundry" į "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų dokumentacijoje `docs/` kataloge
  - Pervadintas aplankas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervadintas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso: atnaujinta 23 turinio nuorodos 7 dokumentacijos failuose

- **📁 Aplankų struktūros pokyčiai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nuorodos atnaujintos, kad atitiktų naują aplankų struktūrą
  - Navigacijos nuorodos patikrintos visuose dokumentuose

- **📄 Failų pervadinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Visos vidinės nuorodos atnaujintos, kad nurodytų naują failo pavadinimą

#### Atnaujinti failai
- **Skyrių dokumentacija** (7 failai):
  - `docs/microsoft-foundry/ai-model-deployment.md` - atnaujintos 3 navigacijos nuorodos
  - `docs/microsoft-foundry/ai-workshop-lab.md` - atnaujintos 4 produkto pavadinimo nuorodos
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - atnaujintos 3 nuorodos (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - atnaujintos 4 kryžminės nuorodos
  - `docs/getting-started/first-project.md` - atnaujintos 2 skyriaus navigacijos nuorodos
  - `docs/getting-started/installation.md` - atnaujintos 2 kito skyriaus nuorodos
  - `docs/troubleshooting/ai-troubleshooting.md` - atnaujintos 3 nuorodos (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - atnaujinta 1 navigacijos nuoroda
  - `docs/troubleshooting/debugging.md` - atnaujinta 1 navigacijos nuoroda

- **Kurso struktūros failai** (2 failai):
  - `README.md` - atnaujintos 17 nuorodų (kurso apžvalga, skyrių pavadinimai, šablonų skyrius, bendruomenės įžvalgos)
  - `course-outline.md` - atnaujintos 14 nuorodų (apžvalga, mokymosi tikslai, skyrių ištekliai)

#### Patvirtinta
- ✅ Nėra likusių "ai-foundry" aplankų kelių nuorodų anglų dokumentuose
- ✅ Nėra likusių "Microsoft Foundry" produkto pavadinimo nuorodų anglų dokumentuose
- ✅ Visos navigacijos nuorodos veikia su nauja aplankų struktūra
- ✅ Failų ir aplankų pervadinimai sėkmingai atlikti
- ✅ Kryžminės nuorodos tarp skyrių patikrintos

#### Pastabos
- **Aprėptis**: Pakeitimai taikyti tik anglų dokumentacijai `docs/` aplanke
- **Vertimai**: Vertimų aplankai (`translations/`) nebuvo atnaujinti šioje versijoje
- **Dirbtuvės**: Dirbtuvių medžiaga (`workshop/`) nebuvo atnaujinta šioje versijoje
- **Pavyzdžiai**: Pavyzdžių failai gali vis tiek nurodyti seną pavadinimą (tai bus sprendžiama būsimame atnaujinime)
- **Išorinės nuorodos**: Išoriniai URL ir GitHub saugyklos nuorodos lieka nepakitusios

#### Migracijos vadovas prisidedantiems
Jei turite vietinių šakų arba dokumentacijos, nurodančios seną struktūrą:
1. Atnaujinkite aplankų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos vis dar veikia

---

### [v3.4.0] - 2025-10-24

#### Patobulinimai infrastruktūros peržiūrai ir patikros
**Ši versija pristato išsamų palaikymą naujai Azure Developer CLI peržiūros funkcijai ir gerina dirbtuvių naudotojo patirtį.**

#### Pridėta
- **🧪 azd provision --preview Feature Documentation**: Išsami aprėptis naujos infrastruktūros peržiūros galimybės
  - Komandų nuoroda ir naudojimo pavyzdžiai atmintinėje
  - Išsamus integravimas į provisioning vadovą su naudojimo scenarijais ir privalumais
  - Išankstinio patikrinimo integracija saugesniam diegimo tikrinimui
  - Pradedančiojo vadovo atnaujinimai, orientuoti į saugumą diegimo praktikoje
- **🚧 Workshop Status Banner**: Profesionalus HTML baneris, nurodantis dirbtuvių kūrimo būseną
  - Gradientinis dizainas su konstrukcijos indikatorių elementais aiškiai vartotojui perteikti
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas dizainas visiems įrenginiams

#### Patobulinta
- **Infrastruktūros sauga**: Peržiūros funkcionalumas integruotas visoje diegimo dokumentacijoje
- **Išankstinė diegimo patikra**: Automatizuoti scenarijai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjų darbo eiga**: Atnaujinti komandų sekos įtraukiant peržiūrą kaip gerąją praktiką
- **Dirbtuvių patirtis**: Aiškiai nubrėžtos naudotojo lūkesčiai dėl turinio kūrimo būsenos

#### Pakeista
- **Diegimo gerosios praktikos**: Dabar rekomenduojama peržiūros-pirmoji darbo eiga
- **Dokumentacijos eiga**: Infrastruktūros validacija perkelta ankstesniame mokymosi procese
- **Dirbtuvių pateikimas**: Profesionalus būsenos komunikavimas su aiškiu vystymosi laiko grafiku

#### Pagerinta
- **Saugos prioritetas**: Infrastruktūros pakeitimai dabar gali būti patikrinti prieš diegimą
- **Komandos bendradarbiavimas**: Peržiūros rezultatai gali būti bendrinami peržiūrai ir patvirtinimui
- **Sąnaudų suvokimas**: Geresnis supratimas apie išteklių kaštus prieš provisioninimą
- **Rizikos mažinimas**: Sumažintas diegimo klaidų skaičius dėl išankstinės validacijos

#### Techninė įgyvendinimas
- **Daugiadokumentų integracija**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Gerosios praktikos integracija**: Peržiūra įtraukta į validacijos darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJŲ funkcijų žymėjimai atrandamumui

#### Dirbtuvių infrastruktūra
- **Būsenos komunikacija**: Profesionali HTML banerio su gradientiniu stiliumi
- **Vartotojo patirtis**: Aiški kūrimo stadijos komunikacija išvengiant painiavos
- **Profesionalus pateikimas**: Išlaikomas saugyklos patikimumas nustatant lūkesčius
- **Laiko juostos skaidrumas**: 2025 spalis paskutinio atnaujinimo laiko žyma atsakomybės užtikrinimui

### [v3.3.0] - 2025-09-24

#### Patobulintos dirbtuvių medžiagos ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamias dirbtuvių medžiagas su naršyklėje veikiančiais interaktyviais vadovais ir struktūruotomis mokymosi trajektorijomis.**

#### Pridėta
- **🎥 Interactive Workshop Guide**: Naršyklėje veikianti dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Structured Workshop Instructions**: 7 žingsnių vadovaujama mokymosi eiga nuo supažindinimo iki pritaikymo
  - 0-Introduction: Dirbtuvių apžvalga ir paruošimas
  - 1-Select-AI-Template: Šablonų paieška ir pasirinkimo procesas
  - 2-Validate-AI-Template: Diegimo ir tikrinimo procedūros
  - 3-Deconstruct-AI-Template: Šablono architektūros supratimas
  - 4-Configure-AI-Template: Konfigūravimas ir pritaikymas
  - 5-Customize-AI-Template: Pažangūs pakeitimai ir iteracijos
  - 6-Teardown-Infrastructure: Išardymas ir išteklių valdymas
  - 7-Wrap-up: Santrauka ir tolesni žingsniai
- **🛠️ Workshop Tooling**: MkDocs konfigūracija su Material theme geresnei mokymosi patirčiai
- **🎯 Hands-On Learning Path**: 3 žingsnių metodika (Atradimas → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces Integration**: Sklandi vystymo aplinkos konfigūracija

#### Patobulinta
- **AI Workshop Lab**: Išplėsta su išsamiu 2–3 valandų struktūruotu mokymosi patyrimu
- **Workshop Documentation**: Profesionalus pateikimas su navigacija ir vizualiniais elementais
- **Learning Progression**: Aiškus žingsnis po žingsnio vadovas nuo šablono pasirinkimo iki produkcijos diegimo
- **Developer Experience**: Integruoti įrankiai optimizuotai kūrimo darbo eigai

#### Pagerinta
- **Prieinamumas**: Naršyklinė sąsaja su paieška, kopijavimo funkcionalumu ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksčios dirbtuvių struktūros, pritaikytos skirtingam mokymosi tempui
- **Praktinis taikymas**: Realaus pasaulio AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Built-in Search**: Greita raktinių žodžių ir pamokų paieška
- **Copy Code Blocks**: Užvedus pelę leidžiama nukopijuoti visus kodo pavyzdžius
- **Theme Toggle**: Tamsus/šviesus režimas pagal pageidavimą
- **Visual Assets**: Ekrano kopijos ir diagramos geresniam supratimui
- **Help Integration**: Tiesioginė Discord prieiga bendruomenės pagalbai

### [v3.2.0] - 2025-09-17

#### Pagrindinis navigacijos pertvarkymas ir skyrių pagrindu organizuota mokymosi sistema
**Ši versija pristato išsamią skyrių pagrindu organizuotą mokymosi struktūrą su patobulinta navigacija visoje saugykloje.**

#### Pridėta
- **📚 Skyrių pagrindu organizuota mokymosi sistema**: Visa kursų medžiaga pertvarkyta į 8 progresinius mokymosi skyrius
  - Skyrius 1: Pagrindai ir greitas startas (⭐ - 30-45 min)
  - Skyrius 2: AI-pirmoji plėtra (⭐⭐ - 1-2 val.)
  - Skyrius 3: Konfigūracija ir autentifikacija (⭐⭐ - 45-60 min)
  - Skyrius 4: Infrastructure as Code ir diegimas (⭐⭐⭐ - 1-1.5 val.)
  - Skyrius 5: Daugiaagentės AI sprendimai (⭐⭐⭐⭐ - 2-3 val.)
  - Skyrius 6: Išankstinė diegimo validacija ir planavimas (⭐⭐ - 1 val.)
  - Skyrius 7: Trikčių šalinimas ir derinimas (⭐⭐ - 1-1.5 val.)
  - Skyrius 8: Produkcija ir įmonės modeliai (⭐⭐⭐⭐ - 2-3 val.)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir poraštės visuose dokumentuose
- **🎯 Progreso stebėjimas**: Kurso užbaigimo kontrolinis sąrašas ir mokymosi patikrinimo sistema
- **🗺️ Mokymosi kelio gairės**: Aiškios įžangos skirtingiems patirties lygiams ir tikslams
- **🔗 Kryžminė nuorodų navigacija**: Susiję skyriai ir išankstiniai reikalavimai aiškiai susieti

#### Patobulinta
- **README struktūra**: Transformuota į struktūruotą mokymosi platformą su skyrių organizacija
- **Dokumentacijos navigacija**: Kiekviename puslapyje dabar pateikta skyriaus kontekstas ir progresijos gairės
- **Šablonų organizavimas**: Pavyzdžiai ir šablonai priskirti atitinkamiems mokymosi skyriams
- **Išteklių integracija**: Atmintinės, DUK ir studijų vadovai susieti su tinkamais skyriais
- **Dirbtuvių integracija**: Praktiniai laboratoriniai darbai susieti su keliais skyrių mokymo tikslais

#### Pakeista
- **Mokymosi eiga**: Pereita nuo linijinės dokumentacijos prie lanksčios skyrių pagrindu organizuotos mokymosi struktūros
- **Konfigūracijos vieta**: Konfigūracijos vadovas perkeliamas į Skyrių 3 geresnei mokymosi eigai
- **AI turinio integracija**: Geresnė AI turinio integracija per visą mokymosi kelią
- **Produkcinis turinys**: Pažangios praktikos konsoliduotos Skyriuje 8 įmonių vartotojams

#### Pagerinta
- **Vartotojo patirtis**: Aiškūs navigacijos trupiniai ir skyrių progreso indikatoriai
- **Prieinamumas**: Nuoseklūs navigacijos modeliai palengvina kurso naršymą
- **Profesionalus pateikimas**: Universiteto stiliaus kurso struktūra tinkama akademiniam ir verslo mokymui
- **Mokymosi efektyvumas**: Sumažintas laikas reikalingas rastu tinkamam turiniui dėl geresnės organizacijos

#### Techninė įgyvendinimas
- **Navigacijos antraštės**: Standartizuota skyriaus navigacija daugiau nei 40 dokumentų
- **Poraštės navigacija**: Nuoseklūs progresijos nurodymai ir skyrių užbaigimo indikatoriai
- **Kryžminis susiejimas**: Išsami vidinių nuorodų sistema jungiantis susijusias sąvokas
- **Skyrių susiejimas**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Studijų vadovo patobulinimas
- **📚 Išsamūs mokymosi tikslai**: Studijų vadovas pertvarkytas suderinti su 8 skyrių sistema
- **🎯 Skyrių vertinimas**: Kiekvienas skyrius turi specifinius mokymosi tikslus ir praktines užduotis
- **📋 Progreso stebėjimas**: Savaitinis mokymosi grafikas su matuojamais rezultatais ir užbaigimo kontroliniais sąrašais
- **❓ Vertinimo klausimai**: Žinių tikrinimo klausimai kiekvienam skyriui su profesionaliais rezultatais
- **🛠️ Praktinės užduotys**: Praktinės veiklos su tikrais diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių pažanga**: Aiškus pažangumas nuo pagrindinių koncepcijų iki įmoninių modelių su karjeros vystymosi fokusu
- **🎓 Sertifikavimo sistema**: Profesinio tobulėjimo rezultatai ir bendruomenės pripažinimas
- **⏱️ Laiko valdymas**: Struktūruotas 10 savaičių mokymosi planas su etapo patvirtinimu

### [v3.1.0] - 2025-09-17

#### Patobulinti daugiaagentės AI sprendimai
**Ši versija gerina daugiaagentį mažmeninės prekybos sprendimą su aiškesniu agentų pavadinimu ir patobulinta dokumentacija.**

#### Pakeista
- **Daugiaagentės terminologija**: Pakeistas "Cora agent" į "Customer agent" visame mažmeninės prekybos daugiaagentų sprendime aiškumo užtikrinimui
- **Agentų architektūra**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai, kad būtų nuoseklus "Customer agent" naudojimas
- **Konfigūracijos pavyzdžiai**: Modernizuoti agentų konfigūracijos šablonai su atnaujintais pavadinimais
- **Dokumentacijos nuoseklumas**: Užtikrinta, kad visos nuorodos naudotų profesionalius, aprašomuosius agentų pavadinimus

#### Patobulinta
- **ARM šablonų paketas**: Atnaujintas retail-multiagent-arm-template su Customer agent nuorodomis
- **Architektūros diagramos**: Atnaujintos Mermaid diagramos su naujais agentų pavadinimais
- **Kodo pavyzdžiai**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent pavadinimus
- **Aplinkos kintamieji**: Atnaujinti visi diegimo scenarijai naudoti CUSTOMER_AGENT_NAME konvencijas

#### Pagerinta
- **Kūrėjų patirtis**: Aiškesnės agentų rolės ir atsakomybės dokumentacijoje
- **Produkcinis pasirengimas**: Geresnis suderinamumas su įmoninėmis vardų konvencijomis
- **Mokymo medžiaga**: Intuityvesni agentų pavadinimai švietimo tikslams
- **Šablonų naudojamumas**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeisti CoraAgent klasės pavadinimai į CustomerAgent Python pavyzdžiuose
- Modifikuotos ARM šablonų JSON konfigūracijos naudoti "customer" agento tipą
- Atnaujinti aplinkos kintamieji iš CORA_AGENT_* į CUSTOMER_AGENT_* modelį
- Atnaujintos visos diegimo komandos ir konteinerių konfigūracijos

### [v3.0.0] - 2025-09-12

#### Pagrindiniai pakeitimai - AI kūrėjo orientacija ir Microsoft Foundry integracija
**Ši versija transformuoja saugyklą į išsamų AI orientuotą mokymosi išteklių su Microsoft Foundry integracija.**

#### Pridėta
- **🤖 AI-First Learning Path**: Visiškas pertvarkymas, prioritetą teikiant AI kūrėjams ir inžinieriams
- **Microsoft Foundry Integration Guide**: Išsami dokumentacija, kaip sujungti AZD su Microsoft Foundry paslaugomis
- **AI Model Deployment Patterns**: Išsamus vadovas apimantis modelio pasirinkimą, konfigūraciją ir produkcijos diegimo strategijas
- **AI Workshop Lab**: 2-3 valandų praktinė dirbtuvė, skirta paversti DI programas į AZD diegimui paruoštus sprendimus
- **Production AI Best Practices**: Įmonėms paruošti modeliai DI apkrovų mastelio didinimui, stebėsenai ir saugumui
- **AI-Specific Troubleshooting Guide**: Išsamus trikčių šalinimo gidas Microsoft Foundry modeliams, Cognitive Services ir DI diegimo problemoms
- **AI Template Gallery**: Atrinkta Microsoft Foundry šablonų kolekcija su sudėtingumo įvertinimais
- **Workshop Materials**: Pilna dirbtuvių struktūra su praktiniais laboratoriniais darbais ir nuorodų medžiaga

#### Enhanced
- **README Structure**: Orientuota į DI kūrėjus su 45% bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Learning Paths**: Specializuotas DI kūrėjo kelias kartu su tradiciniais keliais studentams ir DevOps inžinieriams
- **Template Recommendations**: Rekomenduojami DI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Community Integration**: Sustiprinta Discord bendruomenės parama su DI specifinėmis kanalais ir diskusijomis

#### Security & Production Focus
- **Managed Identity Patterns**: DI specifinės autentifikacijos ir saugumo konfigūracijos
- **Cost Optimization**: Žetonų naudojimo stebėsena ir biudžeto kontrolė DI apkrovoms
- **Multi-Region Deployment**: Strategijos globaliam DI programų diegimui
- **Performance Monitoring**: DI specifiniai metrikai ir Application Insights integracija

#### Documentation Quality
- **Linear Course Structure**: Logiška pažanga nuo pradedančiųjų iki pažangių DI diegimo modelių
- **Validated URLs**: Visi išoriniai saugyklos saitai patikrinti ir pasiekiami
- **Complete Reference**: Visi vidiniai dokumentacijos saitai patikrinti ir veikia
- **Production Ready**: Įmonėms tinkami diegimo modeliai su realaus pasaulio pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Visos dokumentacijos puslapiai dabar apima Įžangą, Mokymosi tikslus ir Mokymosi rezultatus
- **Navigation System**: Pridėtos ankstesnės/kitos pamokos nuorodos visuose dokumentuose, kad būtų palengvinta mokymosi eiga
- **Study Guide**: Išsamus study-guide.md su mokymosi tikslais, praktikos užduotimis ir vertinimo medžiaga
- **Professional Presentation**: Pašalintos visos piktogramos (emoji) geresniam prieinamumui ir profesionaliam vaizdui
- **Enhanced Content Structure**: Patobulinta mokymosi medžiagų organizacija ir eiga

#### Changed
- **Documentation Format**: Standartizuota visa dokumentacija su nuosekliu mokymuisi orientuotu struktūros formatu
- **Navigation Flow**: Įdiegta logiška pažanga per visas mokymosi medžiagas
- **Content Presentation**: Pašalinti dekoratyviniai elementai, kad būtų aiškus, profesionalus formatas
- **Link Structure**: Atnaujinti visi vidiniai saitai, kad palaikytų naują navigacijos sistemą

#### Improved
- **Accessibility**: Pašalintos emoji priklausomybės, geresnė suderinamumas su ekrano skaitytuvais
- **Professional Appearance**: Švarus, akademinio stiliaus pateikimas, tinkamas įmoniniam mokymuisi
- **Learning Experience**: Struktūruotas požiūris su aiškiais tikslais ir rezultatais kiekvienai pamokai
- **Content Organization**: Geresnė loginė eiga ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Pilnas getting-started vadovų ciklas
  - Išsami diegimo ir parengimo dokumentacija
  - Detalūs trikčių šalinimo ištekliai ir derinimo gidai
  - Priemontavimo patikros įrankiai ir procedūros

- **Getting Started Module**
  - AZD pagrindai: Pagrindinės sąvokos ir terminai
  - Diegimo vadovas: Platformai pritaikytos nustatymo instrukcijos
  - Konfigūracijos vadovas: Aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto pamoka: Žingsnis po žingsnio praktinis mokymasis

- **Deployment and Provisioning Module**
  - Diegimo vadovas: Pilna darbo eigos dokumentacija
  - Parengimo vadovas: Infrastructure as Code su Bicep
  - Geri praktikos pavyzdžiai gamybiniams diegimams
  - Daugiaservisės architektūros modeliai

- **Pre-deployment Validation Module**
  - Talpos planavimas: Azure išteklių prieinamumo patikra
  - SKU pasirinkimas: Išsamios paslaugų lygių rekomendacijos
  - Pre-flight patikros: Automatizuoti patikros scenarijai (PowerShell ir Bash)
  - Kainų apskaičiavimo ir biudžeto planavimo įrankiai

- **Troubleshooting Module**
  - Dažnos problemos: Dažnai pasitaikančios problemos ir sprendimai
  - Derinimo vadovas: Sistemingos trikčių šalinimo metodikos
  - Pažangios diagnostikos technikos ir įrankiai
  - Veikimo stebėsena ir optimizavimas

- **Resources and References**
  - Komandų atmintinė: Greita nuoroda į pagrindines komandas
  - Žodynėlis: Išsamios terminų ir santrumpų apibrėžtys
  - DUK: Išsamūs atsakymai į dažnai užduodamus klausimus
  - Išoriniai ištekliai ir bendruomenės saitai

- **Examples and Templates**
  - Paprasto interneto programos pavyzdys
  - Statinės svetainės diegimo šablonas
  - Konteinerizuotos programos konfigūracija
  - Duomenų bazių integracijos modeliai
  - Mikroservisų architektūros pavyzdžiai
  - Serverless funkcijų įgyvendinimai

#### Features
- **Multi-Platform Support**: Diegimo ir konfigūracijos gairės Windows, macOS ir Linux
- **Multiple Skill Levels**: Turinys skirtas nuo studentų iki profesionalių kūrėjų
- **Practical Focus**: Praktiniai pavyzdžiai ir realaus gyvenimo scenarijai
- **Comprehensive Coverage**: Nuo pagrindinių sąvokų iki pažangių įmonės modelių
- **Security-First Approach**: Saugumo geriausios praktikos integruotos visoje medžiagoje
- **Cost Optimization**: Gairės ekonomiškiems diegimams ir išteklių valdymui

#### Documentation Quality
- **Detailed Code Examples**: Praktiniai, patikrinti kodo pavyzdžiai
- **Step-by-Step Instructions**: Aiškios, veiksmo orientuotos instrukcijos
- **Comprehensive Error Handling**: Trikčių šalinimas dažniausioms problemoms
- **Best Practices Integration**: Pramonės standartai ir rekomendacijos
- **Version Compatibility**: Suderinta su naujausiomis Azure paslaugomis ir azd funkcijomis

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integracijos modeliai Hugging Face, Azure Machine Learning ir vartotojo modeliams
- **AI Agent Frameworks**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Advanced RAG Patterns**: Vektorių duomenų bazių opcijos už Azure AI Search ribų (Pinecone, Weaviate ir kt.)
- **AI Observability**: Patobulinta modelių veikimo, žetonų naudojimo ir atsakymų kokybės stebėsena

#### Developer Experience
- **VS Code Extension**: Integruota AZD + Microsoft Foundry kūrimo patirtis
- **GitHub Copilot Integration**: DI pagalbinė AZD šablonų generacija
- **Interactive Tutorials**: Praktiniai kodavimo užsiėmimai su automatizuota validacija DI scenarijams
- **Video Content**: Papildomi vaizdo pamokų turiniai vaizdiniams besimokantiesiems, orientuoti į DI diegimus

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: DI modelių valdymas, atitiktis ir audito įrašai
- **Multi-Tenant AI**: Modeliai kelioms klientų grupėms su izoliuotomis DI paslaugomis
- **Edge AI Deployment**: Integracija su Azure IoT Edge ir konteinerių egzemplioriais
- **Hybrid Cloud AI**: Daugiacloud ir hibridiniai DI apkrovų diegimo modeliai

#### Advanced Features
- **AI Pipeline Automation**: MLOps integracija su Azure Machine Learning pipeline’ais
- **Advanced Security**: Zero-trust modeliai, privatūs galiniai taškai ir pažangi grėsmių apsauga
- **Performance Optimization**: Pažangus tuningas ir mastelio didinimo strategijos aukšto pralaidumo DI programoms
- **Global Distribution**: Turinys pristatymo ir priekinio kešo (edge caching) modeliai DI programoms

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Patobintų IDE ir redaktorių integracijos gairės
- ✅ **Monitoring Expansion**: DI specifinė stebėsena ir įspėjimų modeliai (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Reaguojantis dizainas mobiliam mokymuisi
- **Offline Access**: Atsisiunčiami dokumentacijos paketai
- **Enhanced IDE Integration**: VS Code plėtinys AZD + DI darbo eigoms
- **Community Dashboard**: Realaus laiko bendruomenės metrikos ir indėlių stebėsena

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
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai arba mokymosi ištekliai
- Papildomi įrankiai, scenarijai ar įrankių rinkiniai

#### Changed
- Esamos funkcionalumo ar dokumentacijos modifikacijos
- Atnaujinimai aiškumui ar tikslumui pagerinti
- Turinys arba organizacijos pertvarkymas

#### Deprecated
- Funkcijos arba požiūriai, kurie laipsniškai nutraukiami
- Dokumentacijos skyriai, planuojami pašalinti
- Metodai, kuriems yra geresni alternatyvūs sprendimai

#### Removed
- Funkcijos, dokumentacija ar pavyzdžiai, nebebesvarbūs
- Pasenusi informacija arba nutraukti požiūriai
- Dupliciruotas arba konsoliduotas turinys

#### Fixed
- Dokumentacijos arba kodo klaidų taisymai
- Praneštų problemų ar klausimų sprendimai
- Tikslumo ar funkcionalumo patobulinimai

#### Security
- Saugumo pagerinimai arba pataisymai
- Atnaujinimai saugumo geriausioms praktikoms
- Saugumo pažeidžiamumų sprendimas

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Lūžtantys pakeitimai, reikalaujantys vartotojo veiksmų
- Žymūs turinio arba organizacijos pertvarkymai
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Minor Version (X.Y.0)
- Naujos funkcijos arba turinio priedai
- Patobulinimai, išlaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai arba ištekliai

#### Patch Version (X.Y.Z)
- Klaidų pataisymai ir taisymai
- Nedideliai patobulinimai esamam turiniui
- Paaiškinimai ir smulkūs patobulinimai

## Community Feedback and Suggestions

Mes aktyviai skatiname bendruomenės atsiliepimus, kad pagerintume šį mokymosi išteklių:

### How to Provide Feedback
- **GitHub Issues**: Praneškite apie problemas arba siūlykite patobulinimus (DI specifinės problemos laukiamos)
- **Discord Discussions**: Dalinkitės idėjomis ir įsitraukite į Microsoft Foundry bendruomenę
- **Pull Requests**: Tiesiogiai prisidėkite prie turinio patobulinimų, ypač DI šablonų ir gidų
- **Microsoft Foundry Discord**: Dalyvaukite #Azure kanale dėl AZD + DI diskusijų
- **Community Forums**: Dalyvaukite platesnėse Azure kūrėjų diskusijose

### Feedback Categories
- **AI Content Accuracy**: Taisyklių pakeitimai DI paslaugų integracijai ir diegimui
- **Learning Experience**: Pasiūlymai dėl geresnės DI kūrėjo mokymosi eigos
- **Missing AI Content**: Prašymai dėl papildomų DI šablonų, modelių ar pavyzdžių
- **Accessibility**: Patobulinimai įvairiems mokymosi poreikiams
- **AI Tool Integration**: Pasiūlymai dėl geresnės DI kūrimo darbo eigos integracijos
- **Production AI Patterns**: Įmonėms skirtų DI diegimo modelių užklausos

### Response Commitment
- **Issue Response**: Per 48 valandas į praneštas problemas
- **Feature Requests**: Įvertinimas per vieną savaitę
- **Community Contributions**: Peržiūra per vieną savaitę
- **Security Issues**: Skubus prioritetas su pagreitintu atsaku

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Turinys ir saitų tikrinimas
- **Quarterly Updates**: Dideli turinio priedai ir patobulinimai
- **Semi-Annual Reviews**: Išsami pertvarka ir pagerinimai
- **Annual Releases**: Pagrindiniai leidimai su reikšmingais patobulinimais

### Monitoring and Quality Assurance
- **Automated Testing**: Reguliarus kodo pavyzdžių ir saitų tikrinimas
- **Community Feedback Integration**: Nuolatinis vartotojų pasiūlymų įtraukimas
- **Technology Updates**: Suderinimas su naujausiomis Azure paslaugomis ir azd leidimais
- **Accessibility Audits**: Reguliarūs patikrinimai dėl įtraukiančio dizaino principų

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Pilnas palaikymas su reguliariais atnaujinimais
- **Previous Major Version**: Saugumo atnaujinimai ir kritiniai pataisymai 12 mėnesių
- **Legacy Versions**: Tik bendruomenės palaikymas, oficialių atnaujinimų nėra

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Žingsnis po žingsnio perėjimo instrukcijos
- **Compatibility Notes**: Informacija apie lūžtančius pakeitimus
- **Tool Support**: Scenarijai ar įrankiai, padedantys migracijai
- **Community Support**: Specializuoti forumai migracijos klausimams

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
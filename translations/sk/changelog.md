# Záznam zmien - AZD pre začiatočníkov

## Úvod

Tento záznam zmien dokumentuje všetky pozoruhodné zmeny, aktualizácie a vylepšenia v repozitári AZD For Beginners. Dodržiavame princípy sémantického verzovania a udržiavame tento záznam, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia

Preštudovaním tohto záznamu zmien budete:
- Informovaní o nových funkciách a pridanom obsahu
- Rozumieť vylepšeniam existujúcej dokumentácie
- Sledovať opravy chýb a korekcie na zabezpečenie presnosti
- Sledovať vývoj učebných materiálov v čase

## Výstupy učenia

Po preštudovaní záznamov zmien budete schopní:
- Identifikovať nový obsah a zdroje dostupné na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať svoj učebný plán na základe najaktuálnejších materiálov
- Prispievať spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.19.1] - 2026-03-27

#### Ujasnenie onboardingu pre začiatočníkov, overenie nastavenia a konečné vyčistenie príkazov AZD
**Táto verzia nadväzuje na overovací prieskum AZD 1.23 s dokumentačnou kontrolou zameranou na začiatočníkov: upresňuje odporúčania k autentifikácii prioritou AZD-first, pridáva lokálne skripty na overenie nastavenia, overuje kľúčové príkazy proti živej AZD CLI a odstraňuje posledné zastarané odkazy na príkazy v angličtine mimo tohto záznamu zmien.**

#### Pridané
- **🧪 Skripty na overenie nastavenia pre začiatočníkov** s `validate-setup.ps1` a `validate-setup.sh`, aby sa študenti mohli uistiť, že majú pred začiatím Kapitoly 1 potrebné nástroje
- **✅ Predbežné kroky overenia nastavenia** v README v koreňovom adresári a v README Kapitoly 1, aby sa chýbajúce predpoklady odhalili pred `azd up`

#### Zmenené
- **🔐 Pokyny k autentifikácii pre začiatočníkov** teraz konzistentne považujú `azd auth login` za primárnu cestu pre AZD pracovné postupy, pričom `az login` je uvedené ako voliteľné, pokiaľ sa priamo nepoužívajú príkazy Azure CLI
- **📚 Onboardingový tok Kapitoly 1** teraz smeruje študentov, aby overili svoje lokálne nastavenie pred inštaláciou, autentifikáciou a prvými krokmi nasadenia
- **🛠️ Správy validátora** teraz jasne oddeľujú blokujúce požiadavky od voliteľných varovaní Azure CLI pre AZD-only cestu pre začiatočníkov
- **📖 Konfiguračné, riešenie problémov a príkladové dokumenty** teraz rozlišujú medzi vyžadovanou autentifikáciou AZD a voliteľným prihlásením Azure CLI tam, kde boli oba predtým prezentované bez kontextu

#### Opravené
- **📋 Zostatkové odkazy na príkazy v angličtine** aktualizované na aktuálne formy AZD, vrátane `azd config show` v rýchlom prehľade a `azd monitor --overview` tam, kde sa myslelo na prehľad v Azure Portáli
- **🧭 Tvrdenia pre začiatočníkov v Kapitole 1** zjemnené, aby sa predišlo nadbytočným sľubom o zaručenom bezchybnom správaní alebo rollback-e pre všetky šablóny a Azure zdroje
- **🔎 Overenie pomocou živej CLI** potvrdilo aktuálnu podporu pre `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

#### Aktualizované súbory
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

#### Overenie AZD 1.23.12, rozšírenie prostredia workshopu a obnova pokynov pre AI modely
**Táto verzia vykonáva kontrolu dokumentácie voči `azd` `1.23.12`, aktualizuje zastarané príklady príkazov AZD, obnovuje pokyny pre AI modely na aktuálne predvolené hodnoty a rozširuje pokyny workshopu nad rámec GitHub Codespaces tak, aby podporoval aj dev kontajnery a lokálne klony.**

#### Pridané
- **✅ Poznámky o validácii v jadrových kapitolách a dokumentácii workshopu**, aby bola pre študentov jasná testovaná AZD základňa pri použití novších alebo starších buildov CLI
- **⏱️ Pokyny k timeoutu nasadenia** pre dlhodobé nasadenia AI aplikácií pomocou `azd deploy --timeout 1800`
- **🔎 Kroky na inšpekciu rozšírení** s `azd extension show azure.ai.agents` v dokumentoch o AI pracovných postupoch
- **🌐 Širšie pokyny k prostrediu workshopu** pokrývajú GitHub Codespaces, dev kontajnery a lokálne klony s MkDocs

#### Zmenené
- **📚 Úvodné README kapitol** teraz konzistentne uvádzajú validáciu voči `azd 1.23.12` v sekciách o základoch, konfigurácii, infraštruktúre, multi-agentoch, prednasadení, riešení problémov a produkcii
- **🛠️ Odkazy na príkazy AZD** aktualizované na aktuálne formy v celých dokumentoch:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` alebo `azd env get-value(s)` v závislosti od kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kde je zamýšľaný prehľad Application Insights
- **🧪 Príklady preview provision** zjednodušené na aktuálne podporované použitie, napr. `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Workshop flow** aktualizovaný tak, aby si študenti mohli dokončiť laby v Codespaces, dev kontajneri alebo lokálnom klone namiesto predpokladu vykonania len v Codespaces
- **🔐 Pokyny k autentifikácii** teraz preferujú `azd auth login` pre AZD pracovné postupy, pričom `az login` je uvedené ako voliteľné, keď sa priamo používajú príkazy Azure CLI

#### Opravené
- **🪟 Príkazy na inštaláciu vo Windows** normalizované na aktuálne použitie veľkých a malých písmen pri `winget` v inštalačnom návode
- **🐧 Inštalačné pokyny pre Linux** upravené, aby sa zabránilo nepodporovaným inštrukciám špecifickým pre distribúciu `azd` balíčkov a namiesto toho odkazovali na release artefakty tam, kde je to vhodné
- **📦 Príklady AI modelov** obnovené zo starších predvolieb ako `gpt-35-turbo` a `text-embedding-ada-002` na aktuálne príklady ako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Úryvky nasadenia a diagnostiky** opravené tak, aby používali aktuálne príkazy pre prostredie a stav v logoch, skriptoch a krokoch riešenia problémov
- **⚙️ Pokyny pre GitHub Actions** aktualizované z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny pre MCP/Copilot súhlas** aktualizované z `azd mcp consent` na `azd copilot consent list`

#### Vylepšené
- **🧠 Kapitola o AI** teraz lepšie vysvetľuje behavior citlivý na preview pre `azd ai`, prihlásenie v rámci tenanta, aktuálne používanie rozšírení a aktualizované odporúčania pre nasadenie modelov
- **🧪 Pokyny pre workshop** teraz používajú realistickejšie príklady verzií a jasnejší jazyk pre nastavenie prostredia v praktických laboch
- **📈 Dokumenty pre produkciu a riešenie problémov** majú teraz lepšiu súladnosť s aktuálnym monitorovaním, náhradnými modelmi a príkladmi cenových úrovní

#### Aktualizované súbory
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

#### Príkazy AZD AI CLI, overenie obsahu a rozšírenie šablón
**Táto verzia pridáva pokrytie príkazov `azd ai`, `azd extension` a `azd mcp` vo všetkých AI-súvisiacich kapitolách, opravuje mŕtve odkazy a zastaraný kód v agents.md, aktualizuje cheat sheet a kompletne prepracováva sekciu Príkladové šablóny s overenými popismi a novými Azure AI AZD šablónami.**

#### Pridané
- **🤖 Pokrytie AZD AI CLI** v 7 súboroch (predtým len v Kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekcia "Extensions and AI Commands" predstavujúca `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnosť 4: `azd ai agent init` s porovnávacou tabuľkou (prístup šablóny vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcie "AZD Extensions for Foundry" a "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start teraz ukazuje nasadenie založené na šablóne aj na manifeste
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcia Deploy teraz zahŕňa možnosť `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcia "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nová sekcia "AI & Extensions Commands" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI príkladové šablóny** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat používajúci Langchain4J s možnosťami nasadenia na ACA/AKS
  - **contoso-creative-writer** — Multi-agent aplikácia na tvorivé písanie využívajúca Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG využívajúci Azure Functions + LangChain.js + Cosmos DB s lokálnou vývojovou podporou Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový RAG akcelerátor s administrátorským portálom, integráciou Teams a možnosťami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčná aplikácia pre viacagentovú orchestráciu MCP s backendmi v .NET, Pythone, Jave a TypeScripte
  - **azd-ai-starter** — Minimálna Bicep štartovacia šablóna pre Azure AI infraštruktúru
  - **🔗 Odkaz na galériu Awesome AZD AI** — Odkaz na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablón)

#### Opravené
- **🔗 Navigácia v agents.md**: Odkazy Predchádzajúce / Nasledujúce teraz zodpovedajú poradiu lekcií v README Kapitoly 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Mŕtve odkazy v agents.md**: `production-ai-practices.md` opravené na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 Zastaraný kód v agents.md**: `opencensus` nahradený `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neplatné API v agents.md**: Premiestnené `max_tokens` z `create_agent()` do `create_run()` ako `max_completion_tokens`
- **🔢 Počítanie tokenov v agents.md**: Nahradený hrubý odhad `len//4` volaním `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opravené služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (predvolený hostiteľ sa zmenil v októbri 2024)
- **contoso-chat**: Aktualizovaný popis na odkazovanie Azure AI Foundry + Prompty, aby zodpovedal skutočnému názvu a technologickému zásobníku repozitára

#### Odstránené
- **ai-document-processing**: Odstránená referenčná šablóna, ktorá nefungovala (repo nie je verejne dostupné ako AZD šablóna)

#### Vylepšené
- **📝 agents.md cvičenia**: Cvičenie 1 teraz zobrazuje očakávaný výstup a krok `azd monitor`; Cvičenie 2 obsahuje kompletný kód registrácie `FunctionTool`; Cvičenie 3 nahrádza nejasné pokyny konkrétnymi príkazmi `prepdocs.py`
- **📚 agents.md zdroje**: Aktualizované odkazy na dokumentáciu na aktuálne Azure AI Agent Service docs a quickstart
- **📋 agents.md tabuľka Ďalšie kroky**: Pridaný odkaz na AI Workshop Lab pre kompletné pokrytie kapitoly

#### Aktualizované súbory
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Vylepšenie navigácie kurzu
**Táto verzia zlepšuje navigáciu kapitol v README.md pomocou rozšíreného formátu tabuľky.**

#### Zmenené
- **Tabuľka mapy kurzu**: Rozšírená o priame odkazy na lekcie, odhady trvania a hodnotenia zložitosti
- **Vyčistenie priečinkov**: Odstránené redundantné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Overenie odkazov**: Overených všetkých 21+ interných odkazov v tabuľke mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizácie názvov produktov
**Táto verzia aktualizuje odkazy na produkty podľa aktuálneho brandingu Microsoftu.**

#### Zmenené
- **Microsoft Foundry → Microsoft Foundry**: Všetky odkazy aktualizované vo všetkých neprekladových súboroch
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný tak, aby odrážal aktuálny branding

#### Aktualizované súbory
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

### [v3.15.0] - 2026-02-05

#### Hlavné preusporiadanie repozitára: názvy priečinkov podľa kapitol
**Táto verzia reorganizuje dokumentáciu do venovaných priečinkov podľa kapitol pre prehľadnejšiu navigáciu.**

#### Premenovanie priečinkov
Pôvodné priečinky boli nahradené priečinkami číslovanými podľa kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migrácia súborov
| Súbor | Z | Do |
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

#### Pridané
- **📚 Súbory README pre kapitoly**: Vytvorené README.md v každom priečinku kapitol s:
  - Výučbové ciele a doba trvania
  - Tabuľka lekcií s popismi
  - Rýchle štartovacie príkazy
  - Navigácia do ostatných kapitol

#### Zmenené
- **🔗 Aktualizované všetky interné odkazy**: 78+ ciest aktualizovaných naprieč celou dokumentáciou
- **🗺️ Hlavné README.md**: Aktualizovaná mapa kurzu s novou štruktúrou kapitol
- **📝 examples/README.md**: Aktualizované krížové odkazy na priečinky kapitol

#### Odstránené
- Pôvodná štruktúra priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reštrukturalizácia repozitára: navigácia podľa kapitol
**Táto verzia pridala súbory README pre navigáciu kapitol (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexného sprievodcu nasadzovaním AI agentov pomocou Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca pokrývajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri quick-start šablóny agentov (Foundry Agents, Prompty, RAG)
  - Vzory architektúry agentov (jediný agent, RAG, multi-agent)
  - Konfigurácia a prispôsobenie nástrojov
  - Monitorovanie a sledovanie metrík
  - Nákladové úvahy a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov s `azd init --template get-started-with-ai-agents`
- **Vzorové architektúry**: Vizuálne diagramy vzorov agentov
- **Konfigurácia**: Nastavenie nástrojov a premenné prostredia
- **Monitorovanie**: Integrácia Application Insights
- **Cvičenia**: Postupné praktické učenie (20-45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia DevContainer prostredia
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera s modernými nástrojmi a lepšími predvoľbami pre AZD skúsenosť.**

#### Zmenené
- **🐳 Základný image**: Aktualizované z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovšia stabilná Debian)
- **📛 Názov kontajnera**: Premenovaný z "Python 3" na "AZD for Beginners" pre lepšiu prehľadnosť

#### Pridané
- **🔧 Nové funkcie Dev Container**:
  - `azure-cli` s povolenou podporou pre Bicep
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` pre správu šablón
  - `docker-in-docker` pre nasadzovanie container app

- **🔌 Presmerovanie portov**: Prednastavené porty pre bežný vývoj:
  - 8000 (Náhľad MkDocs)
  - 3000 (Web aplikácie)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšírenia pre VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Docker
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojov
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Lintovanie Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramov
  - `redhat.vscode-yaml` - YAML podpora (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Git
  - `mhutchie.git-graph` - História Gitu

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre Python interpreter, formátovanie pri uložení a orezávanie medzier

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný MkDocs minify plugin
  - Pridaný pre-commit pre kvalitu kódu
  - Pridané Azure SDK balíčky (azure-identity, azure-mgmt-resource)

#### Opravené
- **Príkaz po vytvorení**: Teraz overuje inštaláciu AZD a Azure CLI pri štarte kontajnera

---

### [v3.11.0] - 2026-02-05

#### Prepracovaný README priateľský pre začiatočníkov
**Táto verzia výrazne zlepšuje README.md, aby bol prístupnejší pre začiatočníkov a pridáva zásadné zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Azure CLI vs AZD porovnanie**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Skvelé AZD odkazy**: Priame odkazy na galériu šablón komunity a zdroje pre príspevky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ pripravených šablón na nasadenie
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Príspevok komunity
- **🎯 Rýchly štart**: Zjednodušená 3-kroková sekcia (Inštalovať → Prihlásiť sa → Nasadiť)
- **📊 Tabuľka navigácie podľa skúseností**: Jasné odporúčania, kde začať podľa skúseností vývojára

#### Zmenené
- **Štruktúra README**: Zreorganizovaná pre postupné odhaľovanie - kľúčové informácie vpredu
- **Sekcia Úvod**: Preformulovaná, aby vysvetlila "Kúzlo `azd up`" pre úplných začiatočníkov
- **Odstránený duplicitný obsah**: Elimovaná duplicitná sekcia riešenia problémov
- **Príkazy na riešenie problémov**: Opravený odkaz `azd logs` na platný `azd monitor --logs`

#### Opravené
- **🔐 Príkazy autentifikácie**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na príkazy**: Odstránené zostávajúce `azd logs` z časti riešenia problémov v README

#### Poznámky
- **Rozsah**: Zmeny aplikované v hlavnom README.md a resources/cheat-sheet.md
- **Cieľové publikum**: Vylepšenia zamerané špecificky na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia správnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce príkazy AZD v dokumentácii, zabezpečujúc, že všetky ukážky kódu používajú platnú syntaxi Azure Developer CLI.**

#### Opravené
- **🔧 Odstránené neexistujúce príkazy AZD**: Komplexný audit a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradené `azd monitor --logs` alebo alternatívami Azure CLI
  - `azd service` subpríkazy (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistujú) → odstránené alebo nahradené platnými alternatívami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagy (neexistujú) → odstránené
  - `azd provision --what-if/--rollback` flagy (neexistujú) → aktualizované na použitie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované s opravami príkazov**:
  - `resources/cheat-sheet.md`: Rozsiahla revízia referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené stratégie rollbacku a nasadzovania
  - `docs/troubleshooting/debugging.md`: Opravené sekcie analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy na riešenie problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia debugovania AZD
  - `docs/getting-started/azd-basics.md`: Opravené príkazy na monitorovanie
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a debugovania
  - `docs/getting-started/installation.md`: Opravené help a verzie príklady
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy na zobrazenie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy na debugovanie agentov

- **📝 Aktualizovaná referencia verzie**:
  - `docs/getting-started/installation.md`: Zmenené pevné číslo verzie `1.5.0` na generické `1.x.x` s odkazom na vydania

#### Zmenené
- **Stratégie rollbacku**: Dokumentácia aktualizovaná na použitie rollbacku založeného na Gite (AZD nemá natívny rollback)
- **Zobrazenie logov**: Reference `azd logs` nahradené `azd monitor --logs`, `azd monitor --live` a príkazmi Azure CLI
- **Sekcia Výkon**: Odstránené neexistujúce flagy pre paralelné/incrementálne nasadzovanie, poskytnuté platné alternatívy

#### Technické detaily
- **Platné príkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné prepínače azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené voči Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a aktualizácia kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky nefunkčné odkazy v dokumentácii a zlepšuje celkovú kvalitu obsahu pre vývojárov AI používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s pravidlami prispievania obsahujúci:
  - Jasné pokyny na nahlasovanie problémov a navrhovanie zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny pre ukážky kódu a konvencie správ k commitom
  - Informácie o zapojení komunity

#### Dokončené
- **🎯 Workshop Module 7 (Zhrnutie)**: Plne dokončený záverečný modul s:
  - Komplexným zhrnutím výsledkov workshopu
  - Sekciou kľúčových zvládnutých konceptov pokrývajúcou AZD, šablóny a Microsoft Foundry
  - Odporúčaniami na pokračovanie vzdelávacej cesty
  - Cvičeniami s výzvami workshopu s hodnotením obtiažnosti
  - Odkazmi na spätnú väzbu a podporu komunity

- **📚 Workshop Module 3 (Rozobratie)**: Aktualizované vzdelávacie ciele s:
  - Pokynmi na aktiváciu GitHub Copilot s MCP servermi
  - Pochopením štruktúry priečinkov šablón AZD
  - Vzorcami organizácie infraštruktúry-as-kódu (Bicep)
  - Inštrukciami pre praktické laboratórium

- **🔧 Workshop Module 6 (Ukončenie)**: Dokončené s:
  - Cieľmi pre čistenie zdrojov a riadenie nákladov
  - Použitím `azd down` na bezpečné odinštalovanie infraštruktúry
  - Pokynmi na obnovenie soft-deleted kognitívnych služieb
  - Bonusovými podnetmi na preskúmanie pre GitHub Copilot a Azure Portal

#### Opravené
- **🔗 Opravy nefunkčných odkazov**: Riešených 15+ nefunkčných interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty na microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty na ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradené neexistujúce cicd-integration.md za deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty v FAQ a príručke na riešenie problémov
  - `examples/container-app/microservices/README.md`: Opravené cesty na course home a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy v kapitole AI
  - `course-outline.md`: Opravené odkazy na príručku inštruktora a laboratórne návody AI workshopu

- **📅 Banner stavu workshopu**: Aktualizované z "Under Construction" na aktívny stav workshopu s dátumom február 2026

- **🔗 Navigácia workshopu**: Opravené nefunkčné navigačné odkazy v workshop README.md, ktoré smerovali na neexistujúci priečinok lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené varovanie "under construction", workshop je teraz dokončený a pripravený na použitie
- **Konzistencia navigácie**: Zabezpečené, že všetky moduly workshopu majú správnu medzi-modulovú navigáciu
- **Odkazy v učebnej ceste**: Aktualizované krížové odkazy kapitol na správne microsoft-foundry cesty

#### Overené
- ✅ Všetky anglické markdown súbory majú platné interné odkazy
- ✅ Moduly workshopu 0-7 sú kompletné s učebnými cieľmi
- ✅ Navigácia medzi kapitolami a modulmi funguje správne
- ✅ Obsah je vhodný pre vývojárov AI používajúcich Microsoft AZD
- ✅ Použité jednoduché jazyky a štruktúra priateľská pre začiatočníkov
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pre prispievateľov komunity

#### Technická implementácia
- **Overenie odkazov**: Automatizovaný PowerShell skript overil všetky interné .md odkazy
- **Audit obsahu**: Manuálne preskúmanie úplnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Zavedené konzistentné vzory navigácie kapitol a modulov

#### Poznámky
- **Rozsah**: Zmeny aplikované len na anglickú dokumentáciu
- **Preklady**: Zložky s prekladmi neboli v tejto verzii aktualizované (automatizovaný preklad sa zosynchronizuje neskôr)
- **Trvanie workshopu**: Kompletný workshop teraz poskytuje 3-4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: Monitorovanie, bezpečnosť a multi-agentné vzory
**Táto verzia pridáva komplexné lekcie A-hodnoty o integrácii Application Insights, vzoroch autentifikácie a koordinácie multi-agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia integrácie Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým vytváraním zdrojov
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Fungujúce Python aplikácie s vlastnou telemetriou (1,200+ riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Microsoft Foundry Models)
  - 6 Mermaid diagramov (architektúra, distribuované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (alerty, dashboardy, AI monitorovanie)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Živé streamovanie metrík a ladenie v reálnom čase
  - 40-50 minút času učenia s produkčnými vzormi

- **🔐 Lekcia autentifikácie a bezpečnostných vzorov**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentifikácie (connection strings, Key Vault, managed identity)
  - Kompletné Bicep infraštruktúrne šablóny pre bezpečné nasadenia
  - Kód Node.js aplikácie s integráciou Azure SDK
  - 3 kompletné cvičenia (povolenie managed identity, user-assigned identity, rotácia Key Vault)
  - Najlepšie bezpečnostné postupy a konfigurácie RBAC
  - Príručka na riešenie problémov a analýza nákladov
  - Produkčné vzory autentifikácie bez hesla

- **🤖 Lekcia vzorov koordinácie multi-agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorov koordinácie (sekvenčné, paralelné, hierarchické, event-driven, konsenzus)
  - Kompletná implementácia orchestrátora služby (Python/Flask, 1,500+ riadkov)
  - 3 špecializované implementácie agentov (Research, Writer, Editor)
  - Integrácia Service Bus pre queueing správ
  - Správa stavu v Cosmos DB pre distribuované systémy
  - 6 Mermaid diagramov zobrazujúcich interakcie agentov
  - 3 pokročilé cvičenia (správa timeoutov, retry logika, circuit breaker)
  - Rozpis nákladov ($240-565/month) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola Pred nasadením**: Teraz zahŕňa komplexné vzory monitorovania a koordinácie
- **Kapitola Začíname**: Rozšírená o profesionálne vzory autentifikácie
- **Pripravenosť na produkciu**: Kompletné pokrytie od bezpečnosti po observability
- **Osnova kurzu**: Aktualizovaná o odkazy na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Postup učenia**: Lepšia integrácia bezpečnosti a monitorovania naprieč kurzom
- **Kvalita dokumentácie**: Konzistentné A-hodnotenie (95-97%) naprieč novými lekciami
- **Produkčné vzory**: Kompletné end-to-end pokrytie pre podnikové nasadenia

#### Vylepšené
- **Skúsenosť vývojára**: Jasná cesta od vývoja k produkčnému monitorovaniu
- **Bezpečnostné štandardy**: Profesionálne vzory pre autentifikáciu a správu tajomstiev
- **Observability**: Kompletná integrácia Application Insights s AZD
- **AI záťaže**: Špecializované monitorovanie pre Microsoft Foundry Models a multi-agentné systémy

#### Overené
- ✅ Všetky lekcie obsahujú kompletný pracujúci kód (nie len úryvky)
- ✅ Mermaid diagramy pre vizuálne učenie (19 celkovo v 3 lekciách)
- ✅ Praktické cvičenia s overovacími krokmi (9 celkovo)
- ✅ Produkčné Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýza nákladov a stratégie optimalizácie
- ✅ Príručky na riešenie problémov a najlepšie postupy
- ✅ Kontrolné body znalostí s overovacími príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný sprievodca monitorovaním
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé multi-agentné architektúry
- **Celkový nový obsah**: - Konzistentné vysoké štandardy kvality

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované trasovanie
- **Autentifikácia**: Managed Identity + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Živé metriky + Kusto dotazy + alerty + dashboardy
- **Riadenie nákladov**: Stratégií vzorkovania, politiky retencie, kontrola rozpočtov

### [v3.7.0] - 2025-11-19

#### Zlepšenia kvality dokumentácie a nový príklad Microsoft Foundry Models
**Táto verzia zlepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Microsoft Foundry Models s gpt-4.1 chat rozhraním.**

#### Pridané
- **🤖 Príklad chatu Microsoft Foundry Models**: Kompletné nasadenie gpt-4.1 s funkčnou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Microsoft Foundry Models (nasadenie modelu gpt-4.1)
  - Python príkazové rozhranie na chat s históriou konverzácií
  - Integrácia Key Vault pre bezpečné ukladanie API kľúčov
  - Sledovanie používania tokenov a odhad nákladov
  - Rate limiting a spracovanie chýb
  - Komplexný README s návodom na nasadenie (35-45 minút)
  - 11 produkčných súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Cvičenia v dokumentácii**: Pridané praktické cvičenia do príručky konfigurácie:
  - Cvičenie 1: Konfigurácia viacerých prostredí (15 minút)
  - Cvičenie 2: Prax správy tajomstiev (10 minút)
  - Jasné kritériá úspechu a overovacie kroky
- **✅ Overenie nasadenia**: Pridaná sekcia overenia do príručky nasadenia:
  - Postupy kontroly zdravia (health check)
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy nasadenia
  - Rýchla referencia pre riešenie problémov

#### Vylepšené
- **examples/README.md**: Aktualizované na A-hodnotu (93%):
  - Pridané azure-openai-chat do všetkých relevantných sekcií
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky AI aplikačných príkladov
  - Integrované do Quick Start pre stredne pokročilých používateľov
  - Pridané do sekcie Microsoft Foundry Templates
  - Aktualizovaná porovnávacia matica a sekcie nájdenia technológií
- **Kvalita dokumentácie**: Zlepšená z B+ (87%) → A- (92%) v priečinku docs:
  - Pridané očakávané výstupy k dôležitým príkladom príkazov
  - Zahrnuté overovacie kroky pre zmeny konfigurácie
  - Vylepšené praktické učenie s praktickými cvičeniami

#### Zmenené
- **Postup učenia**: Lepšia integrácia AI príkladov pre stredne pokročilých používateľov
- **Štruktúra dokumentácie**: Viac akčného obsahu s jasnými výsledkami
- **Proces overovania**: Pridané explicitné kritériá úspechu k kľúčovým pracovným tokom

#### Vylepšené
- **Skúsenosť vývojára**: Nasadenie Microsoft Foundry Models teraz trvá 35-45 minút (vs 60-90 pre zložité alternatívy)
- **Transparentnosť nákladov**: Jasné odhady nákladov ($50-200/month) pre príklad Microsoft Foundry Models
- **Učebná cesta**: Vývojári AI majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a overovacie kroky

#### Overené
- ✅ Príklad Microsoft Foundry Models plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov syntakticky správnych
- ✅ Inštrukcie v README zodpovedajú skutočnej skúsenosti s nasadením
- ✅ Odkazy v dokumentácii aktualizované na 8+ miestach
- ✅ Index príkladov správne zobrazuje 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy správne

#### Technická implementácia
- **Architektúra Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps vzor
- **Bezpečnosť**: Pripravené na Managed Identity, tajomstvá v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Riadenie nákladov**: Sledovanie tokenov a optimalizácia použitia
- **Nasadenie**: Jediný príkaz `azd up` pre kompletné nastavenie

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia zavádza komplexné, produkčne pripravené príklady nasadenia kontajnerových aplikácií pomocou Azure Developer CLI (AZD), s plnou dokumentáciou a integráciou do učebnej cesty.**

#### Pridané
- **🚀 Príklady Container App**: Nové lokálne príklady v `examples/container-app/`:
  - [Hlavný sprievodca](examples/container-app/README.md): Kompletný prehľad kontajnerizovaných nasadení, rýchly štart, produkcia a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): Pre začiatočníkov REST API so scale-to-zero, health probes, monitorovaním a riešením problémov
  - [Mikroslužbová architektúra](../../examples/container-app/microservices): Produkčné nasadenie viacerých služieb (API Gateway, Product, Order, User, Notification), asynchrónne messaging, Service Bus, Cosmos DB, Azure SQL, distribuované trasovanie, blue-green/canary nasadenie
- **Najlepšie postupy**: Bezpečnosť, monitorovanie, optimalizácia nákladov a odporúčania CI/CD pre kontajnerové záťaže
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v rôznych jazykoch (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: End-to-end testovacie scenáre, príkazy na monitorovanie, príručka na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované tak, aby obsahovalo a prepojilo nové príklady kontajnerových aplikácií v sekcii "Local Examples - Container Applications"
- **examples/README.md**: Aktualizované tak, aby zvýraznilo príklady kontajnerových aplikácií, pridalo položky do porovnávacej matice a aktualizovalo odkazy na technológie/architektúru
- **Course Outline & Study Guide**: Aktualizované s odkazmi na nové príklady kontajnerových aplikácií a vzory nasadenia v príslušných kapitolách

#### Validated
- ✅ Všetky nové príklady nasaditeľné pomocou `azd up` a dodržiavajú osvedčené postupy
- ✅ Krížové odkazy a navigácia v dokumentácii aktualizované
- ✅ Príklady pokrývajú scenáre od začiatočníka po pokročilých vrátane produkčných mikroservisov

#### Notes
- **Scope**: Len anglická dokumentácia a príklady
- **Next Steps**: Rozšíriť o ďalšie pokročilé kontajnerové vzory a CI/CD automatizáciu v budúcich vydaniach

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implements a comprehensive product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Kompletné prebrandovanie z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Spolu: 23 obsahových odkazov aktualizovaných v 7 dokumentačných súboroch

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` premenený na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované, aby odrážali novú štruktúru priečinkov
  - Overené navigačné odkazy naprieč celou dokumentáciou

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky vnútorné odkazy aktualizované tak, aby odkazovali na nový názov súboru

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizácie referencií na produkt
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizácie referencií (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizácie krížových odkazov
  - `docs/getting-started/first-project.md` - 2 aktualizácie navigačných odkazov medzi kapitolami
  - `docs/getting-started/installation.md` - 2 aktualizácie odkazov na nasledujúce kapitoly
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizácie referencií (navigácia, Discord komunita)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizácia navigačného odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizácia navigačného odkazu

- **Course Structure Files** (2 files):
  - `README.md` - 17 aktualizovaných referencií (prehľad kurzu, názvy kapitol, sekcia šablón, postrehy komunity)
  - `course-outline.md` - 14 aktualizovaných referencií (prehľad, ciele učenia, zdroje kapitol)

#### Validated
- ✅ Nula zostávajúcich odkazov na priečinok "ai-foundry" v anglickej dokumentácii
- ✅ Nula zostávajúcich referencií na názov produktu "Microsoft Foundry" v anglickej dokumentácii
- ✅ Všetky navigačné odkazy funkčné s novou štruktúrou priečinkov
- ✅ Premenovanie súborov a priečinkov úspešne dokončené
- ✅ Krížové odkazy medzi kapitolami overené

#### Notes
- **Scope**: Zmeny aplikované iba na anglickú dokumentáciu v priečinku `docs/`
- **Translations**: Zložky s prekladmi (`translations/`) v tomto vydaní neboli aktualizované
- **Workshop**: Materiály workshopu (`workshop/`) v tomto vydaní neboli aktualizované
- **Examples**: Súbory s príkladmi môžu stále odkazovať na staré názvy (bude riešené v budúcej aktualizácii)
- **External Links**: Externé URL a odkazy na GitHub repozitár zostávajú nezmenené

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Komplexné pokrytie novej možnosti náhľadu infraštruktúry
  - Referencia príkazu a príklady použitia v cheat sheete
  - Detailná integrácia v návode na provisioning s prípadmi použitia a prínosmi
  - Integrácia predletovej kontroly pre bezpečnejšiu validáciu nasadenia
  - Aktualizácie príručky Začiatočníka s postupmi nasadenia zameranými na bezpečnosť
- **🚧 Workshop Status Banner**: Profesionálny HTML banner indikujúci vývojový stav workshopu
  - Gradientný dizajn s indikátormi výstavby pre jasnú komunikáciu s používateľom
  - Časová pečiatka poslednej aktualizácie pre transparentnosť
  - Mobilne responzívny dizajn pre všetky typy zariadení

#### Enhanced
- **Infrastructure Safety**: Funkcionalita náhľadu integrovaná naprieč dokumentáciou o nasadení
- **Pre-deployment Validation**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Developer Workflow**: Aktualizované sekvencie príkazov zahŕňajúce náhľad ako osvedčený postup
- **Workshop Experience**: Jasné očakávania pre používateľov ohľadom vývoja obsahu

#### Changed
- **Deployment Best Practices**: Odporúčaný prístup teraz preferuje workflow s prednostným náhľadom
- **Documentation Flow**: Validácia infraštruktúry presunutá skôr v procese učenia
- **Workshop Presentation**: Profesionálna komunikácia stavu s jasným časovým harmonogramom vývoja

#### Improved
- **Safety-First Approach**: Zmeny infraštruktúry možno teraz validovať pred nasadením
- **Team Collaboration**: Výsledky náhľadu možno zdieľať na revíziu a schválenie
- **Cost Awareness**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Risk Mitigation**: Zníženie zlyhaní nasadenia vďaka predbežnej validácii

#### Technical Implementation
- **Multi-document Integration**: Funkcia náhľadu zdokumentovaná v 4 kľúčových súboroch
- **Command Patterns**: Konzistentná syntax a príklady naprieč dokumentáciou
- **Best Practice Integration**: Náhľad zahrnutý do validačných workflowov a skriptov
- **Visual Indicators**: Jasné označenia NOVÉ funkcie pre lepšiu dohľadateľnosť

#### Workshop Infrastructure
- **Status Communication**: Profesionálny HTML banner s gradientným štýlom
- **User Experience**: Jasný vývojový stav workshopu zabraňuje nedorozumeniam
- **Professional Presentation**: Zachováva dôveryhodnosť repozitára pri nastavovaní očakávaní
- **Timeline Transparency**: Posledná aktualizácia október 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Prehliadačom ovládateľný workshop s možnosťou náhľadu MkDocs
- **📝 Structured Workshop Instructions**: 7-kroková navádzaná učebná cesta od objavu po prispôsobenie
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: Konfigurácia MkDocs s Material témou pre vylepšený zážitok z učenia
- **🎯 Hands-On Learning Path**: 3-kroková metodika (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Plynulé nastavenie vývojového prostredia

#### Enhanced
- **AI Workshop Lab**: Rozšírený o komplexný 2-3 hodinový štruktúrovaný učebný zážitok
- **Workshop Documentation**: Profesionálne spracovanie s navigáciou a vizuálnymi pomôckami
- **Learning Progression**: Jasné krok-za-krokom návody od výberu šablóny po nasadenie do produkcie
- **Developer Experience**: Integrované nástroje pre zefektívnenie vývojových workflowov

#### Improved
- **Accessibility**: Prehliadačové rozhranie s vyhľadávaním, funkciou kopírovania a prepínačom tém
- **Self-Paced Learning**: Flexibilná štruktúra workshopu prispôsobiteľná rôznym rýchlostiam učenia
- **Practical Application**: Reálne scenáre nasadenia AI šablón
- **Community Integration**: Integrácia s Discordom pre podporu a spoluprácu pri workshope

#### Workshop Features
- **Built-in Search**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Copy Code Blocks**: Funkcia kopírovania kódových blokov pri prejdení myšou
- **Theme Toggle**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Visual Assets**: Snímky obrazovky a diagramy pre lepšie porozumenie
- **Help Integration**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Celý kurz preštruktúrovaný do 8 postupných učebných kapitol
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Konzistentné navigačné hlavičky a päty naprieč celou dokumentáciou
- **🎯 Progress Tracking**: Kontrolný zoznam dokončenia kurzu a systém overenia učenia
- **🗺️ Learning Path Guidance**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Cross-Reference Navigation**: Súvisiace kapitoly a predpoklady jasne prepojené

#### Enhanced
- **README Structure**: Pretransformovaný na štruktúrovanú vzdelávaciu platformu s organizáciou podľa kapitol
- **Documentation Navigation**: Každá stránka teraz obsahuje kontext kapitoly a ukazovatele progresu
- **Template Organization**: Príklady a šablóny mapované na príslušné učebné kapitoly
- **Resource Integration**: Cheat sheety, FAQ a študijné príručky prepojené s relevantnými kapitolami
- **Workshop Integration**: Praktické laboratóriá napojené na viacero učebných cieľov kapitol

#### Changed
- **Learning Progression**: Presun z lineárnej dokumentácie na flexibilný systém podľa kapitol
- **Configuration Placement**: Presunutie príručky konfigurácie do Chapter 3 pre lepší tok učenia
- **AI Content Integration**: Lepšia integrácia AI-špecifického obsahu počas učebnej cesty
- **Production Content**: Pokročilé vzory konsolidované v Chapter 8 pre firemných študentov

#### Improved
- **User Experience**: Jasné navigačné „breadcrumb“ a indikátory postupu kapitol
- **Accessibility**: Konzistentné navigačné vzory pre ľahšiu prechádzku kurzom
- **Professional Presentation**: Štruktúra štýlu univerzitného kurzu vhodná pre akademické a podnikové školenia
- **Learning Efficiency**: Skrátenie času na nájdenie relevantného obsahu vďaka lepšej organizácii

#### Technical Implementation
- **Navigation Headers**: Štandardizovaná kapitolová navigácia naprieč 40+ dokumentačnými súbormi
- **Footer Navigation**: Konzistentné usmernenia postupu a indikátory dokončenia kapitol
- **Cross-Linking**: Komplexný interný systém odkazovania spájajúci súvisiace koncepty
- **Chapter Mapping**: Šablóny a príklady jasne priradené k učebným cieľom

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Študijná príručka preštruktúrovaná tak, aby zodpovedala 8-kapitolovému systému
- **🎯 Chapter-Based Assessment**: Každá kapitola obsahuje konkrétne ciele učenia a praktické cvičenia
- **📋 Progress Tracking**: Týždenný študijný rozvrh s merateľnými výstupmi a kontrolnými zoznamami dokončenia
- **❓ Assessment Questions**: Otázky overujúce vedomosti pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Practical Exercises**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Skill Progression**: Jasný postup od základov k podnikovým vzorom s dôrazom na rozvoj kariéry
- **🎓 Certification Framework**: Rámec profesionálneho rozvoja a uznanie v komunite
- **⏱️ Timeline Management**: Štruktúrovaný 10-týždňový plán učenia s overovanými míľnikmi

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Nahradenie "Cora agent" výrazom "Customer agent" v celom retail multi-agent riešení pre lepšie porozumenie
- **Agent Architecture**: Aktualizovaná celá dokumentácia, ARM šablóny a príklady kódu na použitie konzistentného názvoslovia "Customer agent"
- **Configuration Examples**: Modernizované vzory konfigurácie agentov s aktualizovanými názvami
- **Documentation Consistency**: Zabezpečené, aby všetky referencie používali profesionálne, popisné názvy agentov

#### Enhanced
- **Balík ARM šablón**: Aktualizovaná retail-multiagent-arm-template s odkazmi na Customer agentov
- **Architektonické diagramy**: Obnovili sme Mermaid diagramy s aktualizovaným názvom agentov
- **Príklady kódu**: Triedy v Pythone a implementačné príklady teraz používajú názov CustomerAgent
- **Premenné prostredia**: Všetky skripty nasadenia upravené na použitie konvencií CUSTOMER_AGENT_NAME

#### Zlepšené
- **Skúsenosti vývojára**: Jasnejšie definované role a zodpovednosti agentov v dokumentácii
- **Pripravenosť na produkciu**: Lepšie zosúladenie s podnikateľskými názvovými konvenciami
- **Vzdelávacie materiály**: Intuitívnejšie pomenovanie agentov na vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované Mermaid architektonické diagramy s odkazmi na CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v Python príkladoch
- Upravené JSON konfigurácie ARM šablón pre použitie typu agenta "customer"
- Premenné prostredia aktualizované z CORA_AGENT_* na CUSTOMER_AGENT_*
- Osviežené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojárov a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný zdroj učenia zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 AI-prvá učebná cesta**: Kompletná reštrukturalizácia s prioritou pre AI vývojárov a inžinierov
- **Príručka integrácie Microsoft Foundry**: Komplexná dokumentácia na pripojenie AZD k službám Microsoft Foundry
- **Vzory nasadenia AI modelov**: Podrobný sprievodca výberom modelov, konfiguráciou a stratégiami produkčného nasadenia
- **AI Workshopové laboratórium**: 2-3 hodinový praktický workshop na konverziu AI aplikácií na riešenia nasaditeľné cez AZD
- **Najlepšie praktiky produkčného AI**: Podnikateľsky pripravené vzory pre škálovanie, monitoring a zabezpečenie AI záťaží
- **AI špecifický sprievodca riešením problémov**: Komplexné riešenie problémov pre Microsoft Foundry modely, Cognitive Services a nasadenie AI
- **Galéria AI šablón**: Vybraná kolekcia Microsoft Foundry šablón s hodnotením zložitosti
- **Materiály pre workshop**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **Štruktúra README**: Zameraná na AI vývojárov s 45 % komunitným záujmom podľa Microsoft Foundry Discordu
- **Vzdelávacie cesty**: Dedikovaná cesta AI vývojára popri tradičných cestách pre študentov a DevOps inžinierov
- **Odporúčania šablón**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrácia komunity**: Vylepšená podpora Discord komunity s AI špecifickými kanálmi a diskusiami

#### Zameranie na bezpečnosť a produkciu
- **Vzory spravovaných identít**: AI špecifická autentifikácia a bezpečnostné nastavenia
- **Optimalizácia nákladov**: Monitorovanie využitia tokenov a kontrola rozpočtov pre AI záťaže
- **Nasadenie v multi-regiónoch**: Stratégií globálneho nasadenia AI aplikácií
- **Monitoring výkonu**: AI špecifické metriky a integrácia Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logický postup od začiatočníka po pokročilé vzory AI nasadenia
- **Overené URL odkazy**: Všetky externé odkazy na repozitáre sú overené a dostupné
- **Kompletná referencia**: Všetky interné dokumentačné odkazy sú validované a funkčné
- **Pripravené na produkciu**: Podnikové vzory nasadenia s reálnymi príkladmi

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenia
**Táto verzia predstavuje výraznú rekonštrukciu štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný vzdelávací rámec**: Všetky dokumentačné stránky teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigačný systém**: Pridané odkazy Predchádzajúca/Nasledujúca lekcia v celej dokumentácii pre riadený postup učenia
- **Študijný sprievodca**: Komplexný study-guide.md s cieľmi učenia, praktickými cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emoji ikonky pre lepšiu prístupnosť a profesionálny vzhľad
- **Vylepšená štruktúra obsahu**: Zlepšená organizácia a tok vzdelávacích materiálov

#### Zmenené
- **Formát dokumentácie**: Štandardizovaný obsah so sústavnou štruktúrou zameranou na učenie
- **Navigačný tok**: Implementovaný logický postup cez všetky vzdelávacie materiály
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného a profesionálneho formátu
- **Štruktúra odkazov**: Aktualizované všetky interné odkazy pre podporu nového navigačného systému

#### Zlepšené
- **Prístupnosť**: Odstránenie závislosti na emoji pre lepšiu kompatibilitu so screen readermi
- **Profesionálny vzhľad**: Čistá akademická prezentácia vhodná pre podnikové učenie
- **Skúsenosť učenia**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami každej lekcie
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný repozitár na učenie AZD

#### Pridané
- **Základná dokumentačná štruktúra**
  - Kompletná séria príručiek ako začať
  - Komplexná dokumentácia nasadenia a provisioningu
  - Podrobné zdroje na riešenie problémov a príručky ladenia
  - Nástroje a postupy pred nasadením pre validáciu

- **Modul Začíname**
  - AZD základy: Kľúčové pojmy a terminológia
  - Inštalačný sprievodca: Platformovo špecifické inštrukcie nastavenia
  - Konfiguračný sprievodca: Nastavenie prostredia a autentifikácie
  - Prvá projektová príručka: Krok za krokom praktické učenie

- **Modul nasadenie a provisioning**
  - Sprievodca nasadením: Kompletná dokumentácia workflowu
  - Sprievodca provisioningom: Infraštruktúra ako kód s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúr viacerých služieb

- **Modul pred-nasadením**
  - Plánovanie kapacity: Overenie dostupnosti Azure zdrojov
  - Výber SKU: Kompletné odporúčania na výber služieb
  - Pre-flight kontroly: Automatizované validačné skripty (PowerShell a Bash)
  - Odhad nákladov a plánovanie rozpočtu

- **Modul riešenie problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a riešenia
  - Sprievodca ladením: Systematické metodológie riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a odkazy**
  - Rýchla príručka príkazov: Rýchla referencia pre základné príkazy
  - Slovník pojmov: Komplexné definície terminológie a skratiek
  - FAQ: Detailné odpovede na časté otázky
  - Odkazy na externé zdroje a komunita

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webstránky
  - Konfigurácia kontajnerových aplikácií
  - Vzory integrácie databáz
  - Príklady architektúry mikroslužieb
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: Inštrukcie inštalácie a konfigurácie pre Windows, macOS a Linux
- **Viacero úrovní zručností**: Obsah určený pre študentov až po profesionálnych vývojárov
- **Praktické zameranie**: Praktické príklady a scenáre z reálneho sveta
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory
- **Bezpečnostný prístup**: Ochranné postupy integrované v celom obsahu
- **Optimalizácia nákladov**: Návody na efektívne nasadenie a správu zdrojov

#### Kvalita dokumentácie
- **Podrobné príklady kódu**: Praktické a overené ukážky kódu
- **Kroky krok za krokom**: Jasné a použiteľné návody
- **Komplexná správa chýb**: Postupy riešenia bežných problémov
- **Integrácia najlepších postupov**: Priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: Aktuálne s najnovšími Azure službami a funkciami azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánovaná)
#### Rozšírenie AI platformy
- **Podpora viacerých modelov**: Integračné vzory pre Hugging Face, Azure Machine Learning a vlastné modely
- **Frameworky AI agentov**: Šablóny pre LangChain, Semantic Kernel a AutoGen nasadenia
- **Pokročilé RAG vzory**: Možnosti vektorových databáz mimo Azure AI Search (Pinecone, Weaviate, atď.)
- **AI observabilita**: Vylepšené monitorovanie výkonnosti modelov, využitia tokenov a kvality odpovedí

#### Skúsenosti vývojára
- **Rozšírenie VS Code**: Integrovaný vývoj AZD + Microsoft Foundry
- **Integrácia GitHub Copilot**: AI asistovaná generácia AZD šablón
- **Interaktívne návody**: Praktické cvičenia s automatickou validáciou pre AI scenáre
- **Video obsah**: Doplnkové video návody pre vizuálnych študentov zamerané na AI nasadenia

### Verzia 4.0.0 (Plánovaná)
#### Podnikové AI vzory
- **Governance rámec**: Správa AI modelov, súlad a auditné záznamy
- **Multi-tenant AI**: Vzory pre poskytovanie služieb viacerým zákazníkom s izoláciou AI služieb
- **Edge AI nasadenie**: Integrácia s Azure IoT Edge a kontajnerovými inštanciami
- **Hybridný cloud AI**: Multi-cloudové a hybridné nasadenia AI záťaží

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: MLOps integrácia s Azure Machine Learning pipeline
- **Pokročilá bezpečnosť**: Zero-trust vzory, súkromné endpointy a pokročilá ochrana pred hrozbami
- **Optimalizácia výkonu**: Pokročilé ladenie a škálovanie pre AI aplikácie s vysokou priepustnosťou
- **Globálna distribúcia**: Vzory dodania obsahu a edge caching pre AI aplikácie

### Verzia 3.0.0 (Plánovaná) - Nahrazené aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo v3.0.0
- ✅ **AI-zameraný obsah**: Komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interaktívne návody**: Praktický AI workshop lab (Dokončené)
- ✅ **Pokročilý bezpečnostný modul**: AI špecifické bezpečnostné vzory (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia AI záťaží (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementované vo v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Dodatočné príklady**: Scenáre nasadenia zamerané na AI (Dokončené)
- ✅ **Rozšírené FAQ**: AI špecifické otázky a riešenie problémov (Dokončené)
- **Integrácia nástrojov**: Vylepšené návody na integráciu IDE a editorov
- ✅ **Rozšírenie monitorovania**: AI špecifické vzory monitorovania a upozorňovania (Dokončené)

#### Ešte plánované pre budúce vydanie
- **Mobilná priateľská dokumentácia**: Responzívny dizajn pre mobilné učenie
- **Offline prístup**: Možnosti stiahnutia dokumentácie
- **Vylepšená integrácia IDE**: Rozšírenie VS Code pre AZD + AI workflowy
- **Dashboard komunity**: Reálne časové metriky a sledovanie príspevkov komunity

## Prispievanie do changelogu

### Hlásenie zmien
Pri prispievaní do tohto repozitára zabezpečte, aby zápisy v changelogu obsahovali:

1. **Číslo verzie**: Podľa semantického verziovania (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie v tvare RRRR-MM-DD
3. **Kategória**: Pridané, Zmenené, Zastarané, Odstránené, Opravené, Bezpečnosť
4. **Jasný popis**: Výstižný popis zmien
5. **Hodnotenie dopadu**: Ako zmeny ovplyvnia existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, časti dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo vzdelávacie zdroje
- Dodatočné nástroje, skripty alebo utility

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Zastarané
- Funkcie alebo prístupy, ktoré sa postupne rušia
- Časti dokumentácie určené na odstránenie
- Metódy s lepšími alternatívami

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastarané informácie alebo rušené prístupy
- Redundantný alebo konsolidovaný obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo chýb
- Zlepšenia presnosti alebo funkcionality

#### Bezpečnosť
- Bezpečnostné vylepšenia alebo opravy
- Aktualizácie bezpečnostných najlepších praktík
- Riešenie bezpečnostných zraniteľností

### Pokyny pre semantické verziovanie

#### Hlavná verzia (X.0.0)
- Nezlučiteľné zmeny vyžadujúce akciu používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny meniacce základný prístup alebo metodológiu

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo doplnky obsahu
- Vylepšenia zachovávajúce spätnú kompatibilitu
- Dodatočné príklady, nástroje alebo zdroje

#### Patch verzia (X.Y.Z)
- Opravy chýb a korekcie
- Menšie vylepšenia existujúceho obsahu
- Spresnenia a malé doplnky

## Spätná väzba od komunity a návrhy

Aktívne podporujeme spätnú väzbu komunity na zlepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Hlásenie problémov alebo návrhy vylepšení (AI špecifické témy vítané)
- **Discord diskusie**: Zdieľanie nápadov a komunikácia s komunitou Microsoft Foundry
- **Pull Requesty**: Priamy príspevok vylepšení obsahu, najmä AI šablón a príručiek
- **Microsoft Foundry Discord**: Účasť na kanáli #Azure pre diskusie o AZD + AI
- **Komunitné fóra**: Účasť v širšej Azure vývojárskej komunite

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy integrácie AI služieb a informácií o nasadení
- **Skúsenosti učenia**: Návrhy na zlepšenie prúdu učenia AI vývojárov
- **Chýbajúci AI obsah**: Žiadosti o doplnkové AI šablóny, vzory alebo príklady
- **Prístupnosť**: Zlepšenia pre rôznorodé potreby učenia
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovných tokov AI vývoja
- **Produkčné AI vzory**: Žiadosti o podnikové vzory pre AI nasadenia

### Záväzok reakcií
- **Reakcia na issue**: Do 48 hodín od nahlásenia problémov
- **Žiadosti o funkcie**: Vyhodnotenie do týždňa
- **Príspevky komunity**: Recenzia do týždňa
- **Bezpečnostné otázky**: Prioritné riešenie s rýchlou odpoveďou

## Harmonogram údržby

### Pravidelné aktualizácie
- **Mesačné kontroly**: Kontrola presnosti obsahu a platnosti odkazov
- **Štvrťročné aktualizácie**: Významné doplnky a vylepšenia obsahu
- **Polročné revízie**: Komplexné reštrukturalizácie a rozšírenia
- **Výročné vydania**: Hlavné verzie so signifikantnými zlepšeniami

### Monitorovanie a kontrola kvality
- **Automatizované testovanie**: Pravidelná validácia príkladov kódu a odkazov
- **Integrácia spätnej väzby**: Pravidelné zapracovanie návrhov používateľov
- **Aktualizácie technológií**: Zladenie s najnovšími Azure službami a releasmi azd
- **Audity prístupnosti**: Pravidelné kontroly zásad inkluzívneho dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Posledná hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy po dobu 12 mesiacov
- **Staršie verzie**: Podpora komunity, žiadne oficiálne aktualizácie

### Pokyny na migráciu
Keď sú vydané hlavné verzie, poskytujeme:
- **Sprievodcovia migráciou**: Pokyny na prechod krok za krokom
- **Poznámky o kompatibilite**: Podrobnosti o zlomových zmenách
- **Podpora nástrojov**: Skripty alebo nástroje na pomoc pri migrácii
- **Podpora komunity**: Vyhradené fóra pre otázky o migrácii

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Hlavnú README](README.md)

**Zostaňte informovaní**: Sledujte tento repozitár pre oznámenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
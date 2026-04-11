# Změny - AZD pro začátečníky

## Úvod

Tento seznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD pro začátečníky. Dodržujeme principy sémantického verzování a udržujeme tento záznam, aby uživatelé rozuměli, co se mezi verzemi změnilo.

## Cíle učení

Prohlédnutím tohoto seznamu změn:
- Zůstanete informováni o nových funkcích a přidaném obsahu
- Pochopíte vylepšení stávající dokumentace
- Budete sledovat opravy chyb a korekce pro zajištění přesnosti
- Budete sledovat vývoj učebních materiálů v čase

## Výstupy učení

Po prostudování záznamů změn budete schopni:
- Identifikovat nový obsah a dostupné zdroje pro učení
- Rozumět, které sekce byly aktualizovány nebo vylepšeny
- Plánovat svou cestu učením na základě nejaktuálnějších materiálů
- Přispět zpětnou vazbou a návrhy na budoucí vylepšení

## Historie verzí

### [v3.19.1] - 27.03.2026

#### Upřesnění vstupu pro začátečníky, ověření nastavení a konečné vyčištění příkazů AZD  
**Tato verze navazuje na ověřovací prohlídku AZD 1.23 s průchodem dokumentací zaměřeným na začátečníky: upřesňuje vedení k autentizaci primárně přes AZD, přidává skripty pro ověření lokálního nastavení, kontroluje klíčové příkazy vůči aktuálnímu AZD CLI a odstraňuje poslední zastaralé odkazy na příkazy původem z angličtiny mimo seznam změn.**

#### Přidáno
- **🧪 Skripty pro ověření nastavení pro začátečníky** s `validate-setup.ps1` a `validate-setup.sh`, aby si uživatelé mohli před začátkem první kapitoly ověřit potřebné nástroje  
- **✅ Kroky pro ověření nastavení předem** v root README a README první kapitoly, aby chybějící předpoklady byly odhaleny před spuštěním `azd up`  

#### Změněno
- **🔐 Vedení k autentizaci pro začátečníky** nyní konzistentně považuje `azd auth login` za primární cestu pro AZD workflow, `az login` je uveden jako volitelný, pokud se přímo nepoužívají Azure CLI příkazy  
- **📚 Onboardingový proces první kapitoly** nyní uživatele vede k ověření lokálního nastavení před instalací, autentizací a prvními nasazeními  
- **🛠️ Zprávy validátoru** nyní jasně oddělují povinné požadavky blokující postup od volitelných varování Azure CLI pro výhradně AZD začátečnickou cestu  
- **📖 Dokumentace k nastavení, řešení problémů a příklady** nyní rozlišují mezi povinnou AZD autentizací a volitelným přihlášením přes Azure CLI, kde byly oba přístupy dříve prezentovány bez kontextu  

#### Opraveno
- **📋 Zbývající anglické odkazy na příkazy** aktualizovány na aktuální podoby AZD, včetně `azd config show` v cheat sheetu a `azd monitor --overview` tam, kde bylo zamýšleno přehledové vedení v Azure Portal  
- **🧭 Uvedení začátečníků v první kapitole** zmírněno, aby se zabránilo přehnaným slibům garantované bezchybnosti nebo rollback chování u všech šablon a Azure zdrojů  
- **🔎 Ověření live CLI** potvrdilo aktuální podporu příkazů `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`  

#### Aktualizované soubory
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

### [v3.19.0] - 26.03.2026

#### Ověření AZD 1.23.12, rozšíření prostředí workshopu a aktualizace AI modelu  
**Tato verze provádí kontrolu dokumentace vůči `azd` verzi `1.23.12`, aktualizuje zastaralé příklady příkazů AZD, osvěžuje doporučení modelů AI na aktuální výchozí hodnoty a rozšiřuje návod workshopu nad rámec GitHub Codespaces tak, aby podporoval také vývojářské kontejnery a lokální klony.**

#### Přidáno
- **✅ Poznámky k validaci v klíčových kapitolách a dokumentaci workshopu** pro jasné označení testované základní verze AZD, když uživatelé používají novější nebo starší verze CLI  
- **⏱️ Doporučení ohledně timeoutu nasazení** u dlouhotrvajících AI aplikací s použitím `azd deploy --timeout 1800`  
- **🔎 Kroky ke kontrole rozšíření** pomocí `azd extension show azure.ai.agents` v dokumentaci AI workflow  
- **🌐 Rozšířený návod pro prostředí workshopu** zahrnující GitHub Codespaces, dev kontejnery a lokální klony s MkDocs  

#### Změněno
- **📚 Úvodní README kapitol** nyní konzistentně uvádí ověření vůči `azd 1.23.12` napříč sekcemi základy, konfigurace, infrastruktury, víceagentního systému, před-nasazení, řešení problémů a produkce  
- **🛠️ Odkazy na příkazy AZD** aktualizovány na aktuální tvary v dokumentaci:  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` nebo `azd env get-value(s)` dle kontextu  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview` tam, kde je zamýšlen přehled Application Insights  
- **🧪 Příklady náhledu provisioningu** zjednodušeny na aktuálně podporované použití, např. `azd provision --preview` a `azd provision --preview -e production`  
- **🧭 Tok workshopu** aktualizován tak, aby účastníci mohli laboratoře dokončit v Codespaces, dev kontejneru nebo lokálním klonu, místo aby se předpokládalo provádění pouze v Codespaces  
- **🔐 Vedení k autentizaci** nyní preferuje `azd auth login` pro AZD workflow, `az login` je uveden jako volitelný při přímém používání Azure CLI příkazů  

#### Opraveno
- **🪟 Windows instalační příkazy** normalizovány na aktuální psaní `winget` balíčků v průvodci instalací  
- **🐧 Linux instalační rady** opraveny tak, aby se vyhnuly nepodporovaným distro-specifickým `azd` balíčkovým manažerům a místo toho odkazovaly na releasové soubory, kde je to vhodné  
- **📦 Příklady AI modelů** aktualizovány ze starších výchozích hodnot jako `gpt-35-turbo` a `text-embedding-ada-002` na aktuální příklady jako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`  
- **📋 Úryvky pro nasazení a diagnostiku** opraveny tak, aby používaly aktuální příkazy pro prostředí a status v protokolech, skriptech a postupech řešení problémů  
- **⚙️ Návod GitHub Actions** aktualizován z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`  
- **🤖 Návod pro MCP/Copilot souhlas** aktualizován z `azd mcp consent` na `azd copilot consent list`  

#### Vylepšeno
- **🧠 Kapitola o AI** lépe vysvětluje chování `azd ai` ve fázi preview, přihlášení sepřesností na tenant, aktuální používání rozšíření a aktualizovaná doporučení nasazení modelů  
- **🧪 Návody workshopu** nyní používají realističtější verze příkladů a jasnější popis nastavení prostředí pro praktická cvičení  
- **📈 Dokumentace produkce a řešení problémů** nyní lépe odpovídá aktuálním monitorovacím nástrojům, záložním modelům a vzorovým nákladovým úrovním  

#### Aktualizované soubory
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

### [v3.18.0] - 16.03.2026

#### Příkazy AZD AI CLI, ověření obsahu a rozšíření šablon  
**Tato verze přidává pokrytí příkazů `azd ai`, `azd extension` a `azd mcp` ve všech kapitolách týkajících se AI, opravuje nefunkční odkazy a zastaralý kód v agents.md, aktualizuje cheat sheet a převádí sekci Příkladových šablon s ověřenými popisy a novými Azure AI AZD šablonami.**

#### Přidáno
- **🤖 Pokrytí AZD AI CLI** ve 7 souborech (dříve pouze v kapitole 8):  
  - `docs/chapter-01-foundation/azd-basics.md` — nová sekce „Rozšíření a AI příkazy“ představující `azd extension`, `azd ai agent init` a `azd mcp`  
  - `docs/chapter-02-ai-development/agents.md` — možnost 4: `azd ai agent init` s tabulkou porovnání (přístup pomocí šablony vs manifestu)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — podsekce „AZD rozšíření pro Foundry“ a „Nasazení na bázi agenta“  
  - `docs/chapter-05-multi-agent/README.md` — rychlý start nyní ukazuje obě nasazení založená na šabloně i manifestu  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — sekce nasazení nyní zahrnuje možnost `azd ai agent init`  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — podsekce „AZD AI rozšíření příkazy pro diagnostiku“  
  - `resources/cheat-sheet.md` — nová sekce „Příkazy AI & Rozšíření“ zahrnující `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`  
- **📦 Nové AZD AI příkladové šablony** v `microsoft-foundry-integration.md`:  
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu  
  - **azure-search-openai-demo-java** — Java RAG chat využívající Langchain4J s možnostmi nasazení na ACA/AKS  
  - **contoso-creative-writer** — víceagentní kreativní psaní aplikace využívající Azure AI Agent Service, Bing Grounding a Prompty  
  - **serverless-chat-langchainjs** — serverless RAG využívající Azure Functions + LangChain.js + Cosmos DB s lokální vývojovou podporou Ollama  
  - **chat-with-your-data-solution-accelerator** — podnikově orientovaný RAG akcelerátor s administrátorským portálem, integrací Teams a možnostmi PostgreSQL/Cosmos DB  
  - **azure-ai-travel-agents** — víceagentní referenční aplikace MCP orchestrace se servery v .NET, Python, Java a TypeScript  
  - **azd-ai-starter** — minimální Bicep startovací šablona Azure AI infrastruktury  
  - **🔗 Odkaz na galerii Awesome AZD AI** — odkaz na [awesome-azd AI galerii](https://azure.github.io/awesome-azd/?tags=ai) (více než 80 šablon)  

#### Opraveno
- **🔗 Navigace v agents.md**: odkazy Předchozí/Následující nyní odpovídají pořadí lekcí v README kapitoly 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)  
- **🔗 Neplatné odkazy v agents.md**: `production-ai-practices.md` opraveno na `../chapter-08-production/production-ai-practices.md` (3 výskyty)  
- **📦 Zastaralý kód v agents.md**: nahrazeno `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK  
- **🐛 Neplatné API v agents.md**: přesunuto `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`  
- **🔢 Počítání tokenů v agents.md**: nahrazen odhad `len//4` přesným `tiktoken.encoding_for_model()`  
- **azure-search-openai-demo**: opraveny služby z „Cognitive Search + App Service“ na „Azure AI Search + Azure Container Apps“ (výchozí host změněn říjen 2024)  
- **contoso-chat**: aktualizován popis na základě Azure AI Foundry + Prompty, odpovídající skutečnému titulu repozitáře a použitým technologiím  

#### Odstraněno
- **ai-document-processing**: odstraněna nefunkční šablona (repo není veřejně přístupné jako AZD šablona)  

#### Vylepšeno
- **📝 cvičení agents.md**: Cvičení 1 nyní zobrazuje očekávaný výstup a krok `azd monitor`; Cvičení 2 obsahuje kompletní kód registrace `FunctionTool`; Cvičení 3 nahrazuje nejasné pokyny konkrétními příkazy `prepdocs.py`
- **📚 zdroje agents.md**: Aktualizovány odkazy na dokumentaci na aktuální dokumentaci služby Azure AI Agent Service a rychlý start
- **📋 tabulka Další kroky agents.md**: Přidán odkaz na AI Workshop Lab pro úplné pokrytí kapitoly

#### Aktualizované soubory
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Vylepšení navigace kurzu
**Tato verze zlepšuje navigaci kapitol v README.md pomocí vylepšeného formátu tabulky.**

#### Změněno
- **Tabulka mapy kurzu**: Vylepšena přímými odkazy na lekce, odhadovanou délku a hodnocení složitosti
- **Úklid složek**: Odstraněny zbytečné staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Kontrola odkazů**: Ověřeno všech 21+ interních odkazů v tabulce mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty podle aktuálního brandingu Microsoft.**

#### Změněno
- **Microsoft Foundry → Microsoft Foundry**: Všechny odkazy aktualizovány napříč ne-překladovými soubory
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován podle aktuálního brandingu

#### Aktualizované soubory
- `README.md` - Hlavní stránka kurzu
- `changelog.md` - Historie verzí
- `course-outline.md` - Struktura kurzu
- `docs/chapter-02-ai-development/agents.md` - Průvodce AI agenty
- `examples/README.md` - Dokumentace příkladů
- `workshop/README.md` - Úvodní stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všechny instrukční soubory workshopu

---

### [v3.15.0] - 2026-02-05

#### Velká restrukturalizace repozitáře: Složky podle kapitol
**Tato verze restrukturalizuje dokumentaci do dedikovaných složek kapitol pro lepší přehlednost navigace.**

#### Přejmenování složek
Staré složky byly nahrazeny složkami číslovanými podle kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Přidáno nové: `docs/chapter-05-multi-agent/`

#### Migrace souborů
| Soubor | Z | Do |
|--------|---|----|
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
| Všechny soubory pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Všechny soubory troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Přidáno
- **📚 README soubory kapitol**: V každé složce kapitoly vytvořen README.md s:
  - Cíli učení a délkou trvání
  - Tabulkou lekcí s popisy
  - Rychlými startovními příkazy
  - Navigací do ostatních kapitol

#### Změněno
- **🔗 Aktualizované všechny interní odkazy**: 78+ cest aktualizováno napříč dokumentací
- **🗺️ Hlavní README.md**: Aktualizovaná mapa kurzu s novou strukturou kapitol
- **📝 examples/README.md**: Aktualizované křížové odkazy na složky kapitol

#### Odebráno
- Staré složky (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace repozitáře: Navigace kapitol
**Tato verze přidala README soubory s navigací kapitol (nahrazeno verzí v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový průvodce AI agenty
**Tato verze přidává komplexního průvodce nasazením AI agentů pomocí Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce pokrývající:
  - Co jsou AI agenti a jak se liší od chatbotů
  - Tři rychlé startovací šablony agentů (Foundry Agents, Prompty, RAG)
  - Vzory architektury agentů (jednoduchý agent, RAG, multi-agent)
  - Konfigurace nástrojů a přizpůsobení
  - Monitorování a sledování metrik
  - Náklady a optimalizace
  - Běžné scénáře řešení problémů
  - Tři praktická cvičení s kritérii úspěchu

#### Struktura obsahu
- **Úvod**: Koncepty agentů pro začátečníky
- **Rychlý start**: Nasazení agentů pomocí `azd init --template get-started-with-ai-agents`
- **Architektonické vzory**: Vizualizace vzorů agentů
- **Konfigurace**: Nastavení nástrojů a proměnné prostředí
- **Monitorování**: Integrace Application Insights
- **Cvičení**: Postupné praktické učení (20–45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace DevContainer prostředí
**Tato verze aktualizuje konfiguraci kontejneru vývojového prostředí s moderními nástroji a lepšími výchozími hodnotami pro AZD učební zážitek.**

#### Změněno
- **🐳 Základní image**: Aktualizováno z `python:3.12-bullseye` na `python:3.12-bookworm` (aktuální stabilní Debian)
- **📛 Název kontejneru**: Přejmenováno z "Python 3" na "AZD for Beginners" pro lepší přehlednost

#### Přidáno
- **🔧 Nové vlastnosti Dev Containeru**:
  - `azure-cli` s podporou Bicep
  - `node:20` (LTS verze pro šablony AZD)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazení kontejnerových aplikací

- **🔌 Přesměrování portů**: Přednastavené porty pro běžný vývoj:
  - 8000 (MkDocs náhled)
  - 3000 (Webové aplikace)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové VS Code rozšíření**:
  - `ms-python.vscode-pylance` - Vylepšený Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojů
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Kontrola Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramů
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Gitu
  - `mhutchie.git-graph` - Historie Git větví

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro Python interpreter, formátování při ukládání a ořezávání bílých znaků

- **📦 Aktualizovaný requirements-dev.txt**:
  - Přidán plugin MkDocs minify
  - Přidán pre-commit pro kvalitu kódu
  - Přidány Azure SDK balíčky (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Příkaz po vytvoření**: Nyní ověřuje instalaci AZD a Azure CLI při startu kontejneru

---

### [v3.11.0] - 2026-02-05

#### Začátečnicky přívětivá úprava README
**Tato verze významně zlepšuje README.md, aby byl přístupnější pro začátečníky, a přidává důležité zdroje pro AI vývojáře.**

#### Přidáno
- **🆚 Srovnání Azure CLI vs AZD**: Jasné vysvětlení, kdy použít který nástroj s praktickými příklady
- **🌟 Skvělé AZD odkazy**: Přímé odkazy na komunitní galerii šablon a zdroje pro příspěvky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ připravených šablon k nasazení
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Komunitní příspěvky
- **🎯 Rychlý start průvodce**: Zjednodušená sekce o třech krocích (Instalace → Přihlášení → Nasazení)
- **📊 Navigační tabulka podle zkušeností**: Jasné doporučení, kde začít podle zkušeností vývojáře

#### Změněno
- **Struktura README**: Přeuspořádána pro postupné odhalování – klíčové informace na začátek
- **Úvodní sekce**: Přepsána s vysvětlením „Kouzla `azd up`“ pro úplné začátečníky
- **Odstraněn duplicitní obsah**: Eliminována duplicitní sekce řešení problémů
- **Příkazy řešení problémů**: Opraven odkaz `azd logs` na platný `azd monitor --logs`

#### Opraveno
- **🔐 Příkazy autentizace**: Přidány `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na příkazy**: Odstraněn zbytkový `azd logs` z troubleshooting sekce README

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílové publikum**: Vylepšení zaměřena specificky na nové vývojáře AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující příkazy AZD v dokumentaci tak, aby všechny ukázky kódu používaly platnou syntaxi Azure Developer CLI.**

#### Opraveno
- **🔧 Odstranění neexistujících příkazů AZD**: Komplexní audit a oprava neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo Azure CLI alternativami
  - podpříkazy `azd service` (neexistují) → nahrazeny `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistuje) → odstraněno nebo nahrazeno platnými alternativami
  - příznaky `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistují) → odstraněny
  - příznaky `azd provision --what-if/--rollback` (neexistují) → aktualizovány na `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Aktualizace souborů s opravami příkazů**:
  - `resources/cheat-sheet.md`: Hlavní úpravy referencí příkazů
  - `docs/deployment/deployment-guide.md`: Oprava rollback a deploy strategií
  - `docs/troubleshooting/debugging.md`: Oprava sekcí analýzy logů
  - `docs/troubleshooting/common-issues.md`: Aktualizace příkazů řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Oprava sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Oprava příkazů monitorování
  - `docs/getting-started/first-project.md`: Aktualizace příkladů monitorování a ladění
  - `docs/getting-started/installation.md`: Oprava příkladů pomoci a verzí
  - `docs/pre-deployment/application-insights.md`: Oprava příkazů pro prohlížení logů
  - `docs/pre-deployment/coordination-patterns.md`: Oprava ladících příkazů agentů

- **📝 Aktualizace referencí verze**:
  - `docs/getting-started/installation.md`: Změna pevně dané verze `1.5.0` na obecnou `1.x.x` a odkaz na vydání

#### Změněno
- **Rollback strategie**: Dokumentace aktualizována na použití rollbacku přes Git (AZD nemá nativní rollback)
- **Prohlížení logů**: Nahrazení `azd logs` příkazy `azd monitor --logs`, `azd monitor --live` a Azure CLI
- **Sekce výkonnosti**: Odebrány neexistující příznaky paralelního/incrementálního nasazení, přidány platné alternativy

#### Technické podrobnosti

- **Platné příkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné přepínače azd monitor**: `--live`, `--logs`, `--overview`
- **Odebrané funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a aktualizace kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny nefunkční odkazy v dokumentaci a zlepšuje celkovou kvalitu obsahu pro AI vývojáře používající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument s pokyny pro přispívání:
  - Jasné instrukce pro hlášení problémů a návrhy změn
  - Standardy dokumentace pro nový obsah
  - Pokyny k ukázkovému kódu a konvence zpráv commitů
  - Informace o zapojení komunity

#### Dokončeno
- **🎯 Workshop Modul 7 (Závěr)**: Plně dokončený závěrečný modul s:
  - Komplexním shrnutím dosažených výsledků workshopu
  - Sekcí klíčových ovládaných konceptů AZD, šablon a Microsoft Foundry
  - Doporučeními pro pokračování ve vzdělávací cestě
  - Cvičeními workshopu s hodnocením obtížnosti
  - Odkazy na zpětnou vazbu a podporu komunity

- **📚 Workshop Modul 3 (Dekonstrukce)**: Aktualizované cíle učení s:
  - Pokyny pro aktivaci GitHub Copilot s MCP servery
  - Porozuměním struktuře složek AZD šablon
  - Vzory organizace infrastruktury jako kódu (Bicep)
  - Instrukcemi pro praktickou laboratoř

- **🔧 Workshop Modul 6 (Demontáž)**: Dokončeno s:
  - Cíli úklidu zdrojů a správy nákladů
  - Použitím `azd down` pro bezpečné odebrání infrastruktury
  - Pokyny pro obnovu soft-delete kognitivních služeb
  - Bonusové průzkumné podněty pro GitHub Copilot a Azure Portal

#### Opraveno
- **🔗 Opravy nefunkčních odkazů**: Vyřešeno 15+ nefunkčních interních odkazů v dokumentaci:
  - `docs/ai-foundry/ai-model-deployment.md`: Opraveny cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opraveny cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazení neexistujícího cicd-integration.md za deployment-guide.md
  - `examples/retail-scenario.md`: Opraveny cesty FAQ a průvodce řešením problémů
  - `examples/container-app/microservices/README.md`: Opraveny cesty k domovské stránce kurzu a průvodci nasazením
  - `resources/faq.md` a `resources/glossary.md`: Aktualizovány odkazy na kapitolu AI
  - `course-outline.md`: Opraveny odkazy na instruktorův průvodce a laboratoře AI workshopu

- **📅 Stav banneru workshopu**: Aktualizován z „Ve výstavbě“ na aktivní stav s datem únor 2026

- **🔗 Navigace workshopu**: Opraveny nefunkční navigační odkazy v README.md workshopu směřující do neexistující složky lab-1-azd-basics

#### Změněno
- **Prezentace workshopu**: Odstraněno varování „ve výstavbě“, workshop je nyní kompletní a připravený k použití
- **Konzistence navigace**: Zajištěno správné propojení mezi všemi moduly workshopu
- **Reference učebních cest**: Aktualizovány křížové odkazy kapitol na správné cesty microsoft-foundry

#### Ověřeno
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Moduly workshopu 0-7 jsou kompletní s cíli učení
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Zachována jazyková srozumitelnost a přehledná struktura pro začátečníky
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro přispěvatele z komunity

#### Technická realizace
- **Validace odkazů**: Automatizovaný PowerShell skript ověřil všechny interní odkazy .md
- **Audit obsahu**: Manuální kontrola kompletnosti workshopu a vhodnosti pro začátečníky
- **Navigační systém**: Použity konzistentní vzory navigace mezi kapitolami a moduly

#### Poznámky
- **Rozsah**: Změny aplikovány pouze v anglické dokumentaci
- **Překlady**: Překladové složky v této verzi nebyly aktualizovány (automatický překlad bude synchronizován později)
- **Délka workshopu**: Kompletní workshop nyní poskytuje 3-4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitoring, zabezpečení a vzory víceagentních systémů
**Tato verze přidává komplexní lekce A-třídy o integraci Application Insights, vzorech autentifikace a koordinace více agentů pro produkční nasazení.**

#### Přidáno
- **📊 Lekce integrace Application Insights** v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým provisioningem
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Funkční Python aplikace s vlastním telemetrickým sběrem (1 200+ řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů modelů Microsoft Foundry)
  - 6 diagramů Mermaid (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, AI monitoring)
  - Příklady Kusto dotazů a strategie optimalizace nákladů
  - Streamování metrik v reálném čase a ladění
  - 40-50 minut doby učení s produkčními vzory

- **🔐 Lekce autentifikace a bezpečnosti** v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentifikace (připojovací řetězce, Key Vault, spravovaná identita)
  - Kompletní Bicep šablony infrastruktury pro bezpečné nasazení
  - Kód Node.js aplikace s integrací Azure SDK
  - 3 kompletní cvičení (povolení spravované identity, přiřazené identity uživatele, rotace Key Vault)
  - Bezpečnostní best practices a konfigurace RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkční vzory bezheslové autentifikace

- **🤖 Lekce vzorů koordinace více agentů** v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorů koordinace (sekvenční, paralelní, hierarchický, událostmi řízený, konsenzus)
  - Kompletní implementace orchestrátorské služby (Python/Flask, 1 500+ řádků)
  - 3 specializované implementace agentů (Výzkumník, Spisovatel, Editor)
  - Integrace Service Bus pro frontování zpráv
  - Správa stavu Cosmos DB pro distribuované systémy
  - 6 diagramů Mermaid zobrazujících interakce agentů
  - 3 pokročilá cvičení (řízení timeoutu, logika opětovného pokusu, obvodový spínač)
  - Rozpis nákladů (240–565 USD/měsíc) s optimalizačními strategiemi
  - Integrace Application Insights pro monitoring

#### Vylepšeno
- **Kapitola Pre-deployment**: Nyní zahrnuje komplexní monitoring a vzory koordinace
- **Kapitola Getting Started**: Rozšířena o profesionální vzory autentifikace
- **Produkční připravenost**: Kompletní pokrytí od bezpečnosti po observabilitu
- **Osnovy kurzu**: Aktualizovány odkazy na nové lekce v kapitolách 3 a 6

#### Změněno
- **Progres učení**: Lepší integrace bezpečnosti a monitoringu v celém kurzu
- **Kvalita dokumentace**: Konzistentní A-třídní standardy (95-97 %) v nových lekcích
- **Produkční vzory**: Kompletní end-to-end pokrytí pro podniková nasazení

#### Vylepšeno
- **Vývojářská zkušenost**: Jasná cesta od vývoje po produkční monitoring
- **Bezpečnostní standardy**: Profesionální vzory pro autentifikaci a správu tajemství
- **Observabilita**: Kompletní integrace Application Insights s AZD
- **AI zátěže**: Specializované monitorování Microsoft Foundry modelů a multiagentních systémů

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní funkční kód (ne jen úryvky)
- ✅ Diagramy Mermaid pro vizuální učení (celkem 19 ve 3 lekcích)
- ✅ Praktická cvičení s ověřovacím krokem (9 celkem)
- ✅ Produkční Bicep šablony nasaditelné pomocí `azd up`
- ✅ Analýzy nákladů a optimalizační strategie
- ✅ Průvodci řešením problémů a best practices
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitoringem
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé víceagentní architektury
- **Celkový nový obsah**: - Konzistentní vysoké standardy kvality

#### Technická realizace
- **Application Insights**: Log Analytics + vlastí telemetrie + distribuované trasování
- **Autentifikace**: Spravovaná identita + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestraci
- **Monitoring**: Live metriky + Kusto dotazy + alerty + dashboardy
- **Správa nákladů**: Metody vzorkování, zásady uchovávání, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Vylepšení kvality dokumentace a nový příklad Microsoft Foundry Models
**Tato verze zlepšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Přidáno
- **🤖 Příklad chatu Microsoft Foundry Models**: Kompletní nasazení gpt-4.1 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Microsoft Foundry Models (nasazení modelu gpt-4.1)
  - Python příkazové rozhraní pro chat s historií konverzace
  - Integrace Key Vault pro bezpečné ukládání API klíčů
  - Sledování využití tokenů a odhad nákladů
  - Omezení rychlosti a zpracování chyb
  - Kompletní README s průvodcem nasazením na 35-45 minut
  - 11 produkčně připravených souborů (Bicep šablony, Python aplikace, konfigurace)
- **📚 Cvičení k dokumentaci**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace pro více prostředí (15 minut)
  - Cvičení 2: Praktické řízení tajemství (10 minut)
  - Jasná kritéria úspěchu a ověřovací kroky
- **✅ Verifikace nasazení**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontroly stavu
  - Checklist kritérií úspěchu
  - Očekávané výstupy pro všechny příkazy nasazení
  - Rychlá reference pro řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na kvalitu A (93 %):
  - Přidán azure-openai-chat do všech relevantních sekcí
  - Zvýšen počet lokálních příkladů z 3 na 4
  - Přidáno do tabulky AI Application Examples
  - Začleněno do rychlého startu pro středně pokročilé uživatele
  - Přidáno do sekce Microsoft Foundry Templates
  - Aktualizace v matici srovnání a sekcí hledání technologií
- **Kvalita dokumentace**: Zlepšeno z B+ (87 %) → A- (92 %) v celém adresáři docs:
  - Přidány očekávané výstupy ke kritickým příkladům příkazů
  - Vloženy ověřovací kroky pro změny konfigurace
  - Vylepšeno praktické učení s reálnými cvičeními

#### Změněno
- **Progres učení**: Lepší začlenění AI příkladů pro středně pokročilé uživatele
- **Struktura dokumentace**: Více akčních cvičení s jasnými výsledky
- **Proces ověřování**: Přidána explicitní kritéria úspěchu ke klíčovým pracovním postupům

#### Vylepšeno
- **Vývojářská zkušenost**: Nasazení Microsoft Foundry Models nyní trvá 35-45 minut (oproti 60-90 minutám u složitějších alternativ)
- **Transparentnost nákladů**: Jasné odhady nákladů (50–200 USD/měsíc) pro příklad Microsoft Foundry Models
- **Učební cesta**: AI vývojáři mají jasný vstupní bod s azure-openai-chat
- **Standardy dokumentace**: Konzistentní očekávané výstupy a ověřovací kroky

#### Ověřeno
- ✅ Příklad Microsoft Foundry Models plně funkční s `azd up`
- ✅ Všechny 11 implementačních souborů správně syntakticky zpracované
- ✅ Instrukce v README odpovídají reálné zkušenosti s nasazením
- ✅ Odkazy v dokumentaci aktualizovány na více než 8 místech
- ✅ Index příkladů správně reflektuje 4 lokální příklady
- ✅ Žádné duplicitní externí odkazy v tabulkách
- ✅ Všechny navigační reference správné

#### Technická realizace
- **Architektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + vzor Container Apps
- **Bezpečnost**: Připraveno na spravovanou identitu, tajemství v Key Vault
- **Monitoring**: Integrace Application Insights
- **Správa nákladů**: Sledování tokenů a optimalizace využití
- **Nasazení**: Jediný příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení Container App
**Tato verze představuje komplexní, produkčně připravené příklady nasazení kontejnerových aplikací s využitím Azure Developer CLI (AZD), včetně plné dokumentace a začlenění do učební cesty.**

#### Přidáno
- **🚀 Příklady Container App**: Nové lokální příklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletní přehled kontejnerizovaných nasazení, rychlý start, produkce a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): Uživatelsky přívětivé REST API s podporou scale-to-zero, health probe, monitoringem a řešením problémů
  - [Architektura mikroservis](../../examples/container-app/microservices): Produkčně připravené více-služební nasazení (API Gateway, Produkt, Objednávka, Uživatel, Notifikace), asynchronní zprávy, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary deployment
- **Nejlepší postupy**: Bezpečnost, monitoring, optimalizace nákladů a pokyny pro CI/CD v kontejnerech
- **Ukázky kódu**: Kompletní `azure.yaml`, Bicep šablony a vícejazyčné implementace služeb (Python, Node.js, C#, Go)
- **Testování a řešení problémů**: End-to-end testovací scénáře, příkazy pro monitoring, pokyny pro řešení problémů

#### Změněno
- **README.md**: Aktualizováno o nové příklady kontejnerových aplikací pod „Místní příklady – kontejnerové aplikace“ a odkazy na ně
- **examples/README.md**: Aktualizováno s důrazem na příklady kontejnerových aplikací, přidány položky do matice porovnání a aktualizovány odkazy na technologie/architekturu
- **Osnova kurzu a studijní průvodce**: Aktualizováno s odkazy na nové příklady kontejnerových aplikací a vzory nasazení v příslušných kapitolách

#### Ověřeno
- ✅ Všechny nové příklady spustitelné pomocí `azd up` a odpovídají osvědčeným postupům
- ✅ Dokumentační křížové odkazy a navigace aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé, včetně produkčních mikroservis

#### Poznámky
- **Rozsah**: Pouze anglická dokumentace a příklady
- **Další kroky**: Rozšíření o další pokročilé vzory kontejnerů a automatizaci CI/CD v budoucích verzích

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Tato verze zavádí kompletní změnu názvu produktu z „Microsoft Foundry“ na „Microsoft Foundry“ ve veškeré anglické dokumentaci, což reflektuje oficiální rebranding Microsoftu.**

#### Změněno
- **🔄 Aktualizace názvu produktu**: Kompletní rebranding z „Microsoft Foundry“ na „Microsoft Foundry“
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem: 23 aktualizovaných odkazů v 7 dokumentačních souborech

- **📁 Změny struktury složek**:
  - `docs/ai-foundry/` přejmenováno na `docs/microsoft-foundry/`
  - Všechny křížové odkazy aktualizovány podle nové struktury složek
  - Navigační odkazy ověřeny ve všech dokumentacích

- **📄 Přejmenování souborů**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všechny interní odkazy aktualizovány na nový název souboru

#### Aktualizované soubory
- **Dokumentace kapitol** (7 souborů):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizované navigační odkazy
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizované odkazy na název produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - již používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizované odkazy (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 aktualizované odkazy křížových odkazů
  - `docs/getting-started/first-project.md` - 2 aktualizované odkazy navigace kapitol
  - `docs/getting-started/installation.md` - 2 aktualizované odkazy na další kapitolu
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizované odkazy (navigace, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizovaný navigační odkaz
  - `docs/troubleshooting/debugging.md` - 1 aktualizovaný navigační odkaz

- **Soubory struktury kurzu** (2 soubory):
  - `README.md` - 17 aktualizovaných odkazů (přehled kurzu, názvy kapitol, sekce šablon, poznatky komunity)
  - `course-outline.md` - 14 aktualizovaných odkazů (přehled, cíle učení, zdroje kapitol)

#### Ověřeno
- ✅ Nula zbývajících odkazů na složku "ai-foundry" v anglických dokumentech
- ✅ Nula zbývajících odkazů na název produktu "Microsoft Foundry" v anglických dokumentech
- ✅ Všechny navigační odkazy fungují s novou strukturou složek
- ✅ Přejmenování souborů a složek proběhlo úspěšně
- ✅ Validovány křížové odkazy mezi kapitolami

#### Poznámky
- **Rozsah**: Změny aplikovány pouze v anglické dokumentaci ve složce `docs/`
- **Překlady**: Překladové složky (`translations/`) v této verzi neaktualizovány
- **Workshop**: Materiály workshopu (`workshop/`) v této verzi neaktualizovány
- **Příklady**: Příklady mohou stále obsahovat odkazy na staré pojmenování (bude řešeno v budoucích aktualizacích)
- **Externí odkazy**: Externí URL a odkazy na repozitář GitHub zůstávají nezměněny

#### Průvodce migrací pro přispěvatele
Pokud máte lokální větve nebo dokumentaci odkazující na starou strukturu:
1. Aktualizujte odkazy složky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte soubory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte název produktu: „Microsoft Foundry“ → „Microsoft Foundry“
4. Ověřte, že všechny interní odkazy v dokumentaci stále fungují

---

### [v3.4.0] - 2025-10-24

#### Vylepšení náhledu infrastruktury a validace
**Tato verze zavádí komplexní podporu nové funkce náhledu Azure Developer CLI a zlepšuje uživatelský zážitek z workshopu.**

#### Přidáno
- **🧪 Dokumentace k funkci azd provision --preview**: Obsáhlé pokrytí nové schopnosti náhledu infrastruktury
  - Referenční příkazy a příklady použití v rychlém přehledu
  - Podrobná integrace v průvodci provisioningem s příklady použití a výhodami
  - Integrace pre-flight kontroly pro bezpečnější ověření nasazení
  - Aktualizace průvodců „Začínáme“ se zásadami bezpečného nasazení
- **🚧 Status banner workshopu**: Profesionální HTML banner s indikací vývojového stavu workshopu
  - Gradientní design s ukazateli výstavby pro jasnou komunikaci s uživatelem
  - Časová známka poslední aktualizace pro transparentnost
  - Mobilně responzivní design pro všechna zařízení

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrována napříč dokumentací o nasazení
- **Validace před nasazením**: Automatizované skripty nyní zahrnují testování náhledu infrastruktury
- **Workflow vývojáře**: Aktualizované příkazové sekvence zahrnují náhled jako nejlepší praxi
- **Zážitek z workshopu**: Jasné nastavení očekávání o stavu vývoje obsahu

#### Změněno
- **Nejlepší postupy nasazení**: Workflow s prioritou náhledu nyní doporučený přístup
- **Tok dokumentace**: Validace infrastruktury posunuta na dřívější fázi učení
- **Prezentace workshopu**: Profesionální komunikace stavu s jasným časovým rámcem vývoje

#### Vylepšeno
- **Přístup s důrazem na bezpečnost**: Změny infrastruktury lze nyní ověřit před nasazením
- **Týmová spolupráce**: Výsledky náhledu lze sdílet pro připomínky a schválení
- **Povědomí o nákladech**: Lepší přehled o nákladech na zdroje před provisioningem
- **Snížení rizik**: Nižší počet chyb nasazení díky předběžné validaci

#### Technická implementace
- **Integrace do vícestránkové dokumentace**: Náhled funkce dokumentován ve 4 klíčových souborech
- **Vzorové příkazy**: Konzistentní syntax a příklady v celé dokumentaci
- **Integrace osvědčených postupů**: Náhled zahrnut do validačních workflow a skriptů
- **Vizualizace**: Jasné označení NOVÉ funkce pro lepší dohledatelnost

#### Infrastruktura workshopu
- **Komunikace stavu**: Profesionální HTML banner s gradientním stylem
- **Uživatelský zážitek**: Jasný stav vývoje zabraňuje zmatení uživatelů
- **Profesionální prezentace**: Zachovává důvěryhodnost repozitáře a zároveň nastavuje očekávání
- **Transparentnost časové osy**: Známka poslední aktualizace z října 2025 pro odpovědnost

### [v3.3.0] - 2025-09-24

#### Rozšířené materiály workshopu a interaktivní zážitek z učení
**Tato verze přináší komplexní workshopové materiály s interaktivními průvodci v prohlížeči a strukturovanými učebními cestami.**

#### Přidáno
- **🎥 Interaktivní workshopový průvodce**: Zážitek z workshopu v prohlížeči s možností náhledu pomocí MkDocs
- **📝 Strukturované pokyny workshopu**: 7-kroková vedená učební cesta od objevení po přizpůsobení
  - 0-Úvod: Přehled workshopu a nastavení
  - 1-Výběr-AI-šablony: Objevování a výběr šablon
  - 2-Ověření-AI-šablony: Postupy nasazení a validace
  - 3-Rozebrání-AI-šablony: Porozumění architektuře šablony
  - 4-Nastavení-AI-šablony: Konfigurace a přizpůsobení
  - 5-Přizpůsobení-AI-šablony: Pokročilé úpravy a iterace
  - 6-Demontáž-infrastruktury: Úklid a správa zdrojů
  - 7-Závěr: Shrnutí a další kroky
- **🛠️ Nástroje workshopu**: Konfigurace MkDocs s Material tématem pro lepší zážitek z učení
- **🎯 Praktická učební cesta**: 3-kroková metoda (Objevování → Nasazení → Přizpůsobení)
- **📱 Integrace GitHub Codespaces**: Plynulé nastavení vývojového prostředí

#### Vylepšeno
- **AI Workshop Lab**: Rozšířený o komplexní 2-3 hodinové strukturované učení
- **Dokumentace workshopu**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Postup učení**: Jasné krok za krokem od výběru šablony po produkční nasazení
- **Zážitek vývojáře**: Integrované nástroje pro efektivní vývojové workflow

#### Vylepšeno
- **Přístupnost**: Webové rozhraní s vyhledáváním, kopírováním a přepínáním témat
- **Vlastní tempo učení**: Flexibilní struktura workshopu pro různé rychlosti učení
- **Praktická aplikace**: Reálné scénáře nasazení AI šablon
- **Integrace komunity**: Discord integrace pro podporu a spolupráci ve workshopu

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé vyhledávání podle klíčových slov a lekcí
- **Kopírování kódových bloků**: Funkce kopírování přes najetí myší u všech příkladů kódu
- **Přepínač témat**: Podpora tmavého/světlého režimu podle preferencí
- **Vizuální materiály**: Snímky obrazovky a diagramy pro lepší porozumění
- **Integrace pomoci**: Přímý přístup do Discord komunity podpory

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém učení založený na kapitolách
**Tato verze zavádí komplexní strukturu učení rozdělenou do kapitol s vylepšenou navigací v celém repozitáři.**

#### Přidáno
- **📚 Systém učení založený na kapitolách**: Celý kurz přeorganizován do 8 postupných učebních kapitol
  - Kapitola 1: Základy & Rychlý start (⭐ - 30-45 minut)
  - Kapitola 2: Vývoj orientovaný na AI (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurace & Autentifikace (⭐⭐ - 45-60 minut)
  - Kapitola 4: Infrastructure as Code & Nasazení (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Víceagentní AI řešení (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validace a plánování před nasazením (⭐⭐ - 1 hodina)
  - Kapitola 7: Ladění a řešení problémů (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkční a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexní navigační systém**: Konzistentní záhlaví a zápatí navigace napříč veškerou dokumentací
- **🎯 Sledování pokroku**: Kontrolní seznam dokončení kurzu a systém ověření učení
- **🗺️ Vedení učebních cest**: Jasné vstupní body pro různé úrovně znalostí a cíle
- **🔗 Navigace křížových odkazů**: Související kapitoly a předpoklady jasně propojené

#### Vylepšeno
- **Struktura README**: Přeměněna na strukturovanou platformu s organizací podle kapitol
- **Navigace v dokumentaci**: Každá stránka nyní zobrazuje kontext kapitoly a návod k pokroku 
- **Organizace šablon**: Příklady a šablony mapovány na odpovídající učební kapitoly
- **Integrace zdrojů**: Rychlé přehledy, FAQ a studijní průvodce navázány na relevantní kapitoly
- **Integrace workshopu**: Praktická cvičení mapována do více učebních cílů kapitol

#### Změněno
- **Postup učení**: Přesun z lineární dokumentace na flexibilní strukturu založenou na kapitolách
- **Umístění konfigurace**: Příručka konfigurace přeuspořádána do kapitoly 3 pro lepší tok učení
- **Integrace AI obsahu**: Lepší začlenění AI specifického obsahu během celého vzdělávacího procesu
- **Produkční obsah**: Pokročilé vzory konsolidovány do kapitoly 8 pro podnikové uživatele

#### Vylepšeno
- **Uživatelský zážitek**: Jasné navigační „drobečky“ a indikátory postupu kapitol
- **Přístupnost**: Konzistentní navigační vzory pro snadnější průchod kurzem
- **Profesionální prezentace**: Univerzitní styl kurzu vhodný pro akademické i firemní školení
- **Efektivita učení**: Zkrácení času potřebného k nalezení relevantního obsahu díky lepší organizaci

#### Technická implementace
- **Záhlaví navigace**: Standardizovaná navigace kapitol ve více než 40 dokumentačních souborech
- **Navigace v zápatí**: Konzistentní návod k postupu kurzu a indikátory dokončení kapitol
- **Křížové odkazování**: Komplexní interní systém odkazování propojující související koncepty
- **Mapování kapitol**: Šablony a příklady jasně spojené s učebními cíli

#### Vylepšení studijního průvodce
- **📚 Komplexní učební cíle**: Restructurován studijní průvodce pro sladění s 8-kapitolovým systémem
- **🎯 Hodnocení založené na kapitolách**: Každá kapitola obsahuje konkrétní učební cíle a praktická cvičení
- **📋 Sledování pokroku**: Týdenní učební plán s měřitelnými výsledky a kontrolními seznamy
- **❓ Evaluační otázky**: Otázky k ověření znalostí po každé kapitole s profesionálními výstupy
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešení problémů
- **📊 Postup v dovednostech**: Jasný pokrok od základních konceptů k podnikových vzorům se zaměřením na kariérní rozvoj
- **🎓 Certifikační rámec**: Výstupy pro profesionální rozvoj a systém uznání komunity
- **⏱️ Řízení časové osy**: Strukturovaný 10týdenní učební plán s ověřováním milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená víceagentní AI řešení
**Tato verze zlepšuje víceagentní maloobchodní řešení s lepším pojmenováním agentů a rozšířenou dokumentací.**

#### Změněno
- **Terminologie více agentů**: Nahrazení „Cora agent“ za „Customer agent“ v rámci maloobchodního víceagentního řešení pro lepší pochopení
- **Architektura agentů**: Aktualizace veškeré dokumentace, ARM šablon a příkladů kódu pro konzistentní pojmenování „Customer agent“
- **Příklady konfigurace**: Modernizace vzorů konfigurace agentů s aktualizovanými názvy
- **Konzistence dokumentace**: Zajištěno, že všechny odkazy používají profesionální a popisné názvy agentů

#### Vylepšeno
- **Balíček šablony ARM**: Aktualizováno retail-multiagent-arm-template s odkazy na Customer agenty
- **Architektonické diagramy**: Aktualizované diagramy Mermaid s novým pojmenováním agentů
- **Příkladový kód**: Python třídy a příklady implementace nyní používají pojmenování CustomerAgent
- **Proměnné prostředí**: Aktualizovány všechny skripty nasazení pro použití konvencí CUSTOMER_AGENT_NAME

#### Vylepšené
- **Vývojářská zkušenost**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost pro produkci**: Lepší sladění s podnikovými pojmenovacími konvencemi
- **Vzdělávací materiály**: Intuitivnější pojmenování agentů pro vzdělávací účely
- **Použitelnost šablon**: Jednodušší pochopení funkcí agentů a vzorů nasazení

#### Technické detaily
- Aktualizované architektonické diagramy Mermaid s odkazy na CustomerAgent
- Nahrazení jmen tříd CoraAgent za CustomerAgent v Python příkladech
- Úprava konfiguračních JSON šablon ARM pro použití typu agenta "customer"
- Aktualizace proměnných prostředí z CORA_AGENT_* na CUSTOMER_AGENT_*
- Aktualizována všechna nasazovací příkazy a konfigurace kontejnerů

### [v3.0.0] - 2025-09-12

#### Hlavní změny - Zaměření na AI vývojáře a integrace Microsoft Foundry
**Tato verze proměňuje repozitář na komplexní vzdělávací zdroj zaměřený na AI s integrací Microsoft Foundry.**

#### Přidáno
- **🤖 AI-First Learning Path**: Kompletní restrukturalizace kladoucí důraz na AI vývojáře a inženýry
- **Průvodce integrací Microsoft Foundry**: Komplexní dokumentace pro propojení AZD se službami Microsoft Foundry
- **Vzory nasazení AI modelů**: Detailní průvodce výběrem modelů, konfigurací a strategiemi produkčního nasazení
- **AI Workshop Lab**: 2-3 hodinový praktický workshop pro převod AI aplikací na řešení nasaditelná pomocí AZD
- **Nejlepší postupy produkční AI**: Podnikově připravené vzory pro škálování, monitorování a zabezpečení AI zátěže
- **Průvodce řešením problémů specifických pro AI**: Komplexní troubleshooting pro Microsoft Foundry modely, Cognitive Services a problémy s nasazením AI
- **Galerie AI šablon**: Vybraná kolekce Microsoft Foundry šablon s hodnocením složitosti
- **Materiály pro workshop**: Kompletní struktura workshopu s praktickými laby a referenčními materiály

#### Vylepšeno
- **Struktura README**: Zaměření na AI vývojáře s 45% zájmem komunity dle Microsoft Foundry Discord
- **Cesty učení**: Vyhrazená cesta AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Doporučené šablony**: Zahrnutí AI šablon jako azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrace komunity**: Vylepšená podpora Discord komunity s AI-specifickými kanály a diskusemi

#### Zaměření na bezpečnost a produkci
- **Vzory pro spravované identity**: AI-specifická autentizace a bezpečnostní konfigurace
- **Optimalizace nákladů**: Sledování využití tokenů a rozpočtová kontrola pro AI zátěž
- **Více regionální nasazení**: Strategie pro globální nasazení AI aplikací
- **Monitorování výkonu**: AI-specifické metriky a integrace s Application Insights

#### Kvalita dokumentace
- **Lineární struktura kurzu**: Logický postup od začátečníka k pokročilým vzorům nasazení AI
- **Ověřené URL**: Veškeré externí odkazy na repozitáře ověřeny a dostupné
- **Kompletní reference**: Veškeré interní odkazy dokumentace ověřeny a funkční
- **Připravenost pro produkci**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Hlavní změny - Přestrukturování repozitáře a profesionální vylepšení
**Tato verze představuje významnou změnu struktury repozitáře a způsobu prezentace obsahu.**

#### Přidáno
- **Strukturovaný učební rámec**: Veškeré dokumentační stránky nyní obsahují sekce Úvod, Cíle učení a Výstupy učení
- **Navigační systém**: Přidány odkazy Předchozí/Další lekce napříč dokumentací pro vedené učení
- **Studijní průvodce**: Komplexní study-guide.md s výukovými cíli, cvičeními a hodnotícími materiály
- **Profesionální prezentace**: Odstraněny všechny emoji ikonky pro lepší přístupnost a profesionální vzhled
- **Vylepšená struktura obsahu**: Lepší organizace a tok vzdělávacích materiálů

#### Změněno
- **Formát dokumentace**: Standardizováno se zaměřením na učení a konzistentní formát
- **Navigační tok**: Implementován logický postup skrz veškeré vzdělávací materiály
- **Prezentace obsahu**: Odstraněny dekorativní prvky ve prospěch čistého profesionálního formátování
- **Struktura odkazů**: Aktualizovány všechny vnitřní odkazy pro podporu nového navigačního systému

#### Vylepšeno
- **Přístupnost**: Odstraněna závislost na emoji pro lepší kompatibilitu s čtečkami obrazovky
- **Profesní vzhled**: Čistá, akademická prezentace vhodná pro podnikové vzdělávání
- **Zkušenost učení**: Strukturovaný přístup s jasnými cíli a výstupy v každé lekci
- **Organizace obsahu**: Lepší logický tok a propojení souvisejících témat

### [v1.0.0] - 2025-09-09

#### První vydání - Komplexní AZD vzdělávací repozitář

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní série průvodců pro začátečníky
  - Komplexní dokumentace nasazení a provisioning
  - Detailní zdroje pro řešení problémů a ladění
  - Nástroje a postupy pro přednasazovací ověřování

- **Modul Začínáme**
  - AZD základy: Klíčové koncepty a terminologie
  - Průvodce instalací: Platformově specifické instalační instrukce
  - Průvodce konfigurací: Nastavení prostředí a autentizace
  - První projekt: Krok za krokem praktické učení

- **Modul nasazení a provisioning**
  - Průvodce nasazením: Kompletní dokumentace pracovního postupu
  - Průvodce provisioningem: Infrastructure as Code s Bicep
  - Nejlepší postupy produkčního nasazení
  - Vzory architektury více služeb

- **Modul přednasazovacího ověřování**
  - Plánování kapacity: Ověření dostupnosti Azure zdrojů
  - Výběr SKU: Komplexní doporučení pro úroveň služeb
  - Předletové kontroly: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul řešení problémů**
  - Běžné problémy: Často se vyskytující chyby a jejich řešení
  - Průvodce laděním: Systematické postupy řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a reference**
  - Rychlý přehled příkazů: Klíčové příkazy k rychlému použití
  - Slovník pojmů: Kompletní definice terminologie a zkratek
  - FAQ: Podrobné odpovědi na běžné otázky
  - Externí odkazy a spojení s komunitou

- **Příklady a šablony**
  - Příklad jednoduché webové aplikace
  - Šablona nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databáze
  - Příklady architektury mikroservis
  - Implementace bezserverových funkcí

#### Funkce
- **Podpora více platforem**: Instalace a konfigurační návody pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah navržený od studentů po profesionální vývojáře
- **Praktické zaměření**: Příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé podnikové vzory
- **Přístup bezpečnost na prvním místě**: Doporučené bezpečnostní praktiky integrované napříč obsahem
- **Optimalizace nákladů**: Návody pro nákladově efektivní nasazení a správu zdrojů

#### Kvalita dokumentace
- **Detailní příklady kódu**: Praktické, ověřené ukázky kódu
- **Pokyny krok za krokem**: Jasné a realizovatelné instrukce
- **Komplexní zpracování chyb**: Řešení běžných problémů
- **Integrace nejlepších postupů**: Standardy průmyslu a doporučení
- **Kompatibilita verzí**: Aktuální s nejnovějšími Azure službami a funkcemi azd

## Plánované budoucí vylepšení

### Verze 3.1.0 (Plánováno)
#### Rozšíření AI platformy
- **Podpora více modelů**: Vzory integrace pro Hugging Face, Azure Machine Learning a vlastní modely
- **Frameworky AI agentů**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databází mimo Azure AI Search (Pinecone, Weaviate atd.)
- **AI observabilita**: Vylepšené monitorování výkonu modelů, využití tokenů a kvality odpovědí

#### Vývojářská zkušenost
- **Rozšíření VS Code**: Integrované vývojové prostředí AZD + Microsoft Foundry
- **Integrace GitHub Copilot**: AI-podporovaná generace AZD šablon
- **Interaktivní tutoriály**: Praktická cvičení s automatickou validací AI scénářů
- **Video obsah**: Doprovodné video tutoriály pro vizuální studenty zaměřené na AI nasazení

### Verze 4.0.0 (Plánováno)
#### Podnikové AI vzory
- **Řídící rámec**: Správa AI modelů, compliance a auditní stopy
- **Více nájemců AI**: Vzory pro poskytování izolovaných AI služeb vícero zákazníkům
- **Nasazení Edge AI**: Integrace s Azure IoT Edge a kontejnery
- **Hybridní cloud AI**: Více-cloudové a hybridní vzory nasazení AI zátěží

#### Pokročilé funkce
- **Automatizace AI pipeline**: MLOps integrace s Azure Machine Learning pipelines
- **Pokročilá bezpečnost**: Zero-trust vzory, privátní koncové body a pokročilá ochrana před hrozbami
- **Optimalizace výkonu**: Pokročilé ladění a škálování pro AI aplikace s vysokým propustností
- **Globální distribuce**: Vzory doručení obsahu a edge cachingu pro AI aplikace

### Verze 3.0.0 (Plánováno) - Nahrazeno současným vydáním
#### Navrhované přídavky - Nyní implementováno ve v3.0.0
- ✅ **Obsah zaměřený na AI**: Kompletní integrace Microsoft Foundry (Dokončeno)
- ✅ **Interaktivní tutoriály**: Praktický AI workshop lab (Dokončeno)
- ✅ **Pokročilý bezpečnostní modul**: AI-specifické bezpečnostní vzory (Dokončeno)
- ✅ **Optimalizace výkonu**: Strategie ladění AI zátěží (Dokončeno)

### Verze 2.1.0 (Plánováno) - Částečně implementováno ve v3.0.0
#### Menší vylepšení - Některé dokončeno v současné verzi
- ✅ **Další příklady**: Scénáře AI nasazení (Dokončeno)
- ✅ **Rozšířené FAQ**: AI-specifické otázky a troubleshooting (Dokončeno)
- **Integrace nástrojů**: Vylepšené návody pro IDE a editory
- ✅ **Rozšíření monitoringu**: AI-specifické monitorovací a upozorňovací vzory (Dokončeno)

#### Stále plánováno pro budoucí vydání
- **Mobilní dokumentace**: Responzivní design pro mobilní učení
- **Offline přístup**: Stahovatelné balíčky dokumentace
- **Vylepšená integrace IDE**: Rozšíření VS Code pro AZD + AI pracovní postupy
- **Komunitní dashboard**: Reálná data o komunitě a sledování příspěvků

## Přispívání do seznamu změn

### Hlásení změn
Při přispívání do tohoto repozitáře prosím zajistěte, že zápisy do changelogu obsahují:

1. **Číslo verze**: Podle sémantického verzování (major.minor.patch)
2. **Datum**: Datum vydání nebo aktualizace ve formátu RRRR-MM-DD
3. **Kategorie**: Přidáno, Změněno, Zastaralé, Odstraněno, Opraveno, Bezpečnost
4. **Jasný popis**: Stručný popis změny
5. **Dopad na uživatele**: Jak změny ovlivňují stávající uživatele

### Kategorie změn

#### Přidáno
- Nové funkce, sekce dokumentace nebo schopnosti
- Nové příklady, šablony nebo vzdělávací zdroje
- Další nástroje, skripty nebo utility

#### Změněno
- Úpravy existující funkcionality nebo dokumentace
- Aktualizace pro zvýšení jasnosti nebo přesnosti
- Přestrukturování obsahu nebo organizace

#### Zastaralé
- Funkce nebo přístupy, které jsou postupně vyřazovány
- Sekce dokumentace plánované pro odstranění
- Metody nahrazené lepšími alternativami

#### Odstraněno
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo zastaralé přístupy
- Nadbytečný nebo konsolidovaný obsah

#### Opraveno
- Opravy chyb v dokumentaci nebo kódu
- Řešení nahlášených problémů
- Vylepšení přesnosti nebo funkčnosti

#### Bezpečnost
- Bezpečnostní vylepšení nebo opravy
- Aktualizace bezpečnostních nejlepších praktik
- Řešení bezpečnostních zranitelností

### Pravidla sémantického verzování

#### Hlavní verze (X.0.0)
- Zásadní změny vyžadující zásah uživatele
- Významné přestrukturování obsahu nebo organizace
- Změny, které mění základní přístup nebo metodiku

#### Mezipouze (X.Y.0)
- Nové funkce nebo přidaný obsah
- Vylepšení udržující zpětnou kompatibilitu
- Další příklady, nástroje nebo zdroje

#### Oprava (X.Y.Z)
- Oprava chyb a korekce
- Menší vylepšení stávajícího obsahu
- Upřesnění a drobná vylepšení

## Zpětná vazba komunity a návrhy

Aktivně vyzýváme komunitu k poskytnutí zpětné vazby za účelem vylepšení tohoto vzdělávacího zdroje:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Hlaste problémy nebo navrhujte vylepšení (AI-specifické problémy vítány)
- **Discord diskuse**: Sdílejte nápady a zapojte se do komunity Microsoft Foundry
- **Pull Requesty**: Přispívejte přímými vylepšeními obsahu, zvláště AI šablon a průvodců
- **Microsoft Foundry Discord**: Zapojte se do kanálu #Azure pro diskuse o AZD + AI
- **Komunitní fóra**: Zapojte se do širších diskusí Azure vývojářů

### Kategorie zpětné vazby
- **Přesnost AI obsahu**: Opravy integrace a nasazení AI služeb
- **Zkušenost učení**: Návrhy na zlepšení toku učení AI vývojářů
- **Chybějící AI obsah**: Žádosti o další AI šablony, vzory nebo příklady
- **Přístupnost**: Vylepšení pro různé potřeby učenících se
- **Integrace AI nástrojů**: Návrhy na lepší workflow vývoje AI
- **Produkční AI vzory**: Požadavky na podnikové AI vzory nasazení

### Závazek k odpovědím
- **Reakce na issue**: Do 48 hodin od nahlášení problému
- **Požadavky na funkce**: Vyhodnocení do jednoho týdne
- **Příspěvky komunity**: Revize do jednoho týdne
- **Bezpečnostní problémy**: Okamžitá priorita s urychlenou odezvou

## Plán údržby

### Pravidelné aktualizace
- **Měsíční revize**: Kontrola přesnosti obsahu a platnosti odkazů
- **Čtvrtletní aktualizace**: Větší přídavky a vylepšení obsahu
- **Půlroční revize**: Komplexní přestrukturování a rozšíření
- **Roční vydání**: Hlavní verze s významnými zlepšeními

### Monitorování a zajištění kvality
- **Automatizované testování**: Pravidelná validace příkladů kódu a odkazů
- **Integrace zpětné vazby komunity**: Pravidelné začleňování uživatelských návrhů
- **Aktualizace technologií**: Soulad s nejnovějšími Azure službami a verzemi azd
- **Audity přístupnosti**: Pravidelné hodnocení inkluzivního designu

## Podpora aktuální verze
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Bezpečnostní aktualizace a kritické opravy po dobu 12 měsíců
- **Starší verze**: Pouze podpora komunity, žádné oficiální aktualizace

### Pokyny k migraci
Při vydání hlavních verzí poskytujeme:
- **Průvodce migrací**: Pokyny k přechodu krok za krokem
- **Poznámky k kompatibilitě**: Detaily o nekompatibilních změnách
- **Podpora nástrojů**: Skripty nebo utility pro usnadnění migrace
- **Podpora komunity**: Vyhrazená fóra pro dotazy ohledně migrace

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Návrat na [Hlavní README](README.md)

**Zůstaňte informováni**: Sledujte toto úložiště pro oznámení o nových vydáních a důležitých aktualizacích výukových materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Neneseme odpovědnost za jakékoli nedorozumění nebo nesprávné interpretace vyplývající z využití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
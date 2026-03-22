# Zoznam zmien - AZD For Beginners

## Úvod

Tento zoznam zmien dokumentuje všetky pozoruhodné zmeny, aktualizácie a vylepšenia v repozitári AZD For Beginners. Dodržiavame princípy semantického verzovania a vedeni tento záznam, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia

Pri prezeraní tohto zoznamu zmien budete:
- Informovaní o nových funkciách a pridanom obsahu
- Rozumieť vylepšeniam existujúcej dokumentácie
- Sledovať opravy chýb a korekcie na zabezpečenie presnosti
- Sledovať vývoj vzdelávacích materiálov v čase

## Výsledky učenia

Po preskúmaní položiek v zozname zmien budete schopní:
- Identifikovať nový obsah a zdroje dostupné na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať si učenie na základe najaktuálnejších materiálov
- Prispieť spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.18.0] - 2026-03-16

#### Príkazy AZD AI CLI, overenie obsahu a rozšírenie šablón
**Táto verzia pridáva pokrytie príkazov `azd ai`, `azd extension` a `azd mcp` vo všetkých kapitolách súvisiacich s AI, opravuje nefunkčné odkazy a zastaraný kód v agents.md, aktualizuje cheat sheet a kompletne prepracúva sekciu Príkladových šablón s overenými popismi a novými Azure AI AZD šablónami.**

#### Pridané
- **🤖 Pokrytie AZD AI CLI** v 7 súboroch (predtým len v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekcia "Rozšírenia a príkazy AI" predstavujúca `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnosť 4: `azd ai agent init` s porovnávacou tabuľkou (prístup šablóny vs prístup manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcie "AZD rozšírenia pre Foundry" a "Nasadenie orientované na agenta"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start teraz zobrazuje obidva postupy nasadenia: založené na šablóne aj na manifeste
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcia Deploy teraz zahŕňa možnosť `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcia "Príkazy rozšírenia AZD AI pre diagnostiku"
  - `resources/cheat-sheet.md` — Nová sekcia "AI & Extensions Commands" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI príkladové šablóny** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat využívajúci Langchain4J s možnosťami nasadenia ACA/AKS
  - **contoso-creative-writer** — Viacagentová aplikácia na kreatívne písanie používajúca Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG používajúci Azure Functions + LangChain.js + Cosmos DB s lokálnou vývojárskou podporou Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG akcelerátor s administrátorským portálom, integráciou Teams a možnosťami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčná aplikácia pre orchestráciu viac-agentového MCP so servermi v .NET, Pythone, Jave a TypeScripte
  - **azd-ai-starter** — Minimálna Bicep štartovacia šablóna pre Azure AI infraštruktúru
  - **🔗 Odkaz na galériu awesome-azd AI** — Referencia na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablón)

#### Opravené
- **🔗 navigácia v agents.md**: Odkazy Predchádzajúce/Ďalšie teraz zodpovedajú poradiu lekcií v README kapitoly 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 nefunkčné odkazy v agents.md**: `production-ai-practices.md` opravené na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 zastaraný kód v agents.md**: Nahradené `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neplatné API v agents.md**: Premiestnené `max_tokens` z `create_agent()` do `create_run()` ako `max_completion_tokens`
- **🔢 počítanie tokenov v agents.md**: Nahradený hrubý odhad `len//4` za `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opravené služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (predvolený hostiteľ sa zmenil v októbri 2024)
- **contoso-chat**: Aktualizovaný popis tak, aby odkazoval na Azure AI Foundry + Prompty, čo zodpovedá skutočnému názvu repozitára a technologickému stacku

#### Odstránené
- **ai-document-processing**: Odstránená referencia na nefunkčnú šablónu (repo nie je verejne prístupné ako AZD šablóna)

#### Vylepšené
- **📝 cvičenia v agents.md**: Cvičenie 1 teraz ukazuje očakávaný výstup a krok `azd monitor`; Cvičenie 2 obsahuje kompletnú registráciu `FunctionTool`; Cvičenie 3 nahrádza nejasné pokyny konkrétnymi príkazmi `prepdocs.py`
- **📚 zdroje v agents.md**: Aktualizované odkazy na dokumentáciu na aktuálne dokumenty Azure AI Agent Service a quickstart
- **📋 tabuľka Ďalšie kroky v agents.md**: Pridaný odkaz na AI Workshop Lab pre kompletné pokrytie kapitoly

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

#### Vylepšenie navigácie v kurze
**Táto verzia vylepšuje navigáciu kapitoly README.md pomocou rozšíreného formátu tabuľky.**

#### Zmenené
- **Tabuľka mapy kurzu**: Vylepšená o priame odkazy na lekcie, odhady trvania a hodnotenia zložitosti
- **Vyčistenie priečinkov**: Odstránené redundantné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Overenie odkazov**: Všetkých 21+ interných odkazov v tabuľke Mapy kurzu overených

### [v3.16.0] - 2026-02-05

#### Aktualizácie názvov produktov
**Táto verzia aktualizuje odkazy na produkty podľa aktuálneho brandingu Microsoftu.**

#### Zmenené
- **Microsoft Foundry → Microsoft Foundry**: Všetky odkazy aktualizované naprieč súbormi, ktoré nie sú prekladmi
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný, aby zodpovedal aktuálnemu brandingu

#### Aktualizované súbory
- `README.md` - Hlavná vstupná stránka kurzu
- `changelog.md` - História verzií
- `course-outline.md` - Štruktúra kurzu
- `docs/chapter-02-ai-development/agents.md` - Sprievodca AI agentmi
- `examples/README.md` - Dokumentácia príkladov
- `workshop/README.md` - Vstupná stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všetky inštrukčné súbory workshopu

---

### [v3.15.0] - 2026-02-05

#### Rozsiahle preusporiadanie repozitára: priečinky podľa kapitol
**Táto verzia reorganizuje dokumentáciu do vyhradených priečinkov podľa kapitol pre jasnejšiu navigáciu.**

#### Premenovania priečinkov
Staré priečinky boli nahradené priečinkami číslovanými podľa kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridané nové: `docs/chapter-05-multi-agent/`

#### Migrácia súborov
| Súbor | Odkiaľ | Kam |
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
- **📚 README súbory pre kapitoly**: Vytvorené README.md v každom priečinku kapitoly s:
  - Cieľmi učenia a odhadovaným trvaním
  - Tabuľkou lekcií s popismi
  - Rýchlymi spúšťacími príkazmi
  - Navigáciou do ostatných kapitol

#### Zmenené
- **🔗 Aktualizované všetky interné odkazy**: 78+ ciest aktualizovaných naprieč všetkými dokumentačnými súbormi
- **🗺️ Hlavný README.md**: Aktualizovaná Mapa kurzu s novou štruktúrou kapitol
- **📝 examples/README.md**: Aktualizované krížové odkazy na priečinky kapitol

#### Odstránené
- Stará štruktúra priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Preusporiadanie repozitára: navigácia podľa kapitol
**Táto verzia pridala README súbory navigácie kapitol (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexný sprievodca pre nasadzovanie AI agentov pomocou Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca pokrývajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri šablóny pre rýchly štart agentov (Foundry Agents, Prompty, RAG)
  - Vzorové architektúry agentov (jednoagentový, RAG, viacagentový)
  - Konfigurácia nástrojov a prispôsobenie
  - Monitorovanie a sledovanie metrík
  - Úvahy o nákladoch a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov pomocou `azd init --template get-started-with-ai-agents`
- **Vzorové architektúry**: Vizualizácie vzorov architektúry agentov
- **Konfigurácia**: Nastavenie nástrojov a premenné prostredia
- **Monitorovanie**: Integrácia Application Insights
- **Cvičenia**: Postupné praktické učenie (20-45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia prostredia DevContainer
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera modernými nástrojmi a lepšími predvolenými hodnotami pre skúsenosť učenia AZD.**

#### Zmenené
- **🐳 Base Image**: Aktualizované z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovšia stabilná verzia Debianu)
- **📛 Názov kontajnera**: Premenované z "Python 3" na "AZD for Beginners" pre väčšiu zrozumiteľnosť

#### Pridané
- **🔧 Nové funkcie vývojového kontajnera**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` pre správu šablón
  - `docker-in-docker` pre nasadzovanie kontajnerových aplikácií

- **🔌 Presmerovanie portov**: Predkonfigurované porty pre bežný vývoj:
  - 8000 (náhľad MkDocs)
  - 3000 (webové aplikácie)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšírenia VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojov
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Lintovanie Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramov
  - `redhat.vscode-yaml` - Podpora YAML (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Gitu
  - `mhutchie.git-graph` - História Gitu

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre interpretér Pythonu, formátovanie pri uložení a odstraňovanie bielych znakov

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný MkDocs minify plugin
  - Pridaný pre-commit na kvalitu kódu
  - Pridané balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opravené
- **Post-Create Command**: Teraz overuje inštaláciu AZD a Azure CLI pri štarte kontajnera

---

### [v3.11.0] - 2026-02-05

#### Prepracovanie README priateľné pre začiatočníkov
**Táto verzia významne zlepšuje README.md, aby bol prístupnejší pre začiatočníkov, a pridáva základné zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Porovnanie Azure CLI vs AZD**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Skvelé AZD odkazy**: Priame odkazy do galérie šablón komunity a zdrojov pre príspevky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ šablón pripravených na nasadenie
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Príspevok komunity
- **🎯 Rýchly sprievodca**: Zjednodušená sekcia na začiatok v 3 krokoch (Install → Login → Deploy)
- **📊 Tabuľka navigácie podľa skúseností**: Jasné pokyny, kde začať na základe skúseností vývojára

#### Zmenené
- **Štruktúra README**: Preorganizované pre postupné odhaľovanie - najprv kľúčové informácie
- **Sekcia Úvod**: Prepracovaná tak, aby vysvetľovala "Kúzlo `azd up`" pre úplných začiatočníkov
- **Odstránený duplicitný obsah**: Zrušená duplicitná sekcia riešenia problémov
- **Príkazy na riešenie problémov**: Opravená referencia `azd logs` tak, aby používala platný `azd monitor --logs`

#### Opravené
- **🔐 Príkazy autentifikácie**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné referencie príkazov**: Odstránené zostávajúce `azd logs` z časti riešenia problémov v README

#### Poznámky
- **Rozsah**: Zmeny aplikované na hlavný README.md a resources/cheat-sheet.md
- **Cieľové publikum**: Vylepšenia zamerané konkrétne na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia presnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce AZD príkazy v celej dokumentácii, čím zabezpečuje, že všetky ukážky kódu používajú platnú syntax Azure Developer CLI.**

#### Opravené
- **🔧 Odstránené neexistujúce AZD príkazy**: Komplexný audit a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradené `azd monitor --logs` alebo alternatívami Azure CLI
  - `azd service` subpríkazy (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistuje) → odstránené alebo nahradené platnými alternatívami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagy (neexistujú) → odstránené
  - `azd provision --what-if/--rollback` flagy (neexistujú) → aktualizované na použitie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované s opravami príkazov**:
  - `resources/cheat-sheet.md`: Zásadná revízia referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené rollback a deployment stratégie
  - `docs/troubleshooting/debugging.md`: Opravené sekcie analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy na riešenie problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia debugovania AZD
  - `docs/getting-started/azd-basics.md`: Opravené príkazy monitorovania
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a debugovania
  - `docs/getting-started/installation.md`: Opravené príklady pomoci a verzií
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy pre zobrazenie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy debugovania agenta

#### Zmenené
- **Rollback stratégie**: Dokumentácia aktualizovaná na použitie rollbacku založeného na Gite (AZD nemá natívny rollback)
- **Zobrazenie logov**: Nahradené odkazy na `azd logs` s `azd monitor --logs`, `azd monitor --live` a príkazmi Azure CLI
- **Sekcia výkonu**: Odstránené neexistujúce flagy pre paralelné/incrementálne nasadenie, poskytnuté platné alternatívy

#### Technické detaily
- **Platné AZD príkazy**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné flagy azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené voči Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a zlepšenie kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky zlomené odkazy v dokumentácii a zlepšuje celkovú kvalitu obsahu pre AI vývojárov používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s pokynmi pre prispievanie obsahujúci:
  - Jasné inštrukcie pre nahlasovanie problémov a navrhovanie zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny pre príklady kódu a konvencie správ k commitom
  - Informácie o zapojení komunity

#### Dokončené
- **🎯 Workshop modul 7 (Zhrnutie)**: Úplne dokončený záverečný modul so:
  - Komplexným zhrnutím dosiahnutých cieľov workshopu
  - Sekciou kľúčových zvládnutých konceptov pokrývajúcou AZD, šablóny a Microsoft Foundry
  - Odporúčaniami na pokračovanie v učení
  - Úlohami workshopu s hodnotením obtiažnosti
  - Odkazmi na spätnú väzbu komunity a podporu

- **📚 Workshop modul 3 (Deconstruct)**: Aktualizované učebné ciele so:
  - Pokynmi na aktiváciu GitHub Copilot s MCP servermi
  - Pochopením štruktúry zložiek AZD šablón
  - Vzorom organizácie Infrastructure-as-Code (Bicep)
  - Pokynmi na praktické laboratórium

- **🔧 Workshop modul 6 (Teardown)**: Dokončený so:
  - Cieľmi úpravy zdrojov a správy nákladov
  - Použitím `azd down` pre bezpečné zrušenie infraštruktúry
  - Pokynmi na obnovu soft-deleted kognitívnych služieb
  - Bonusovými promptami na preskúmanie GitHub Copilot a Azure Portal

#### Opravené
- **🔗 Opravy zlomených odkazov**: Riešenie 15+ zlomených interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradené neexistujúce cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty k FAQ a príručke riešenia problémov
  - `examples/container-app/microservices/README.md`: Opravené cesty na domovský kurz a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy v kapitole AI
  - `course-outline.md`: Opravené odkazy na príručku inštruktora a AI laboratórne materiály

- **📅 Banner stavu workshopu**: Aktualizovaný z "Under Construction" na aktívny stav workshopu s februárom 2026
- **🔗 Navigácia workshopu**: Opravené zlomené navigačné odkazy v README.md workshopu smerujúce na neexistujúci priečinok lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené varovanie "under construction", workshop je teraz dokončený a pripravený na používanie
- **Konzistentnosť navigácie**: Zabezpečené, že všetky moduly workshopu majú správnu medzimodulovú navigáciu
- **Odkazy v učení**: Aktualizované medzi-kapitoly referencie na správne microsoft-foundry cesty

#### Overené
- ✅ Všetky anglické markdown súbory majú platné interné odkazy
- ✅ Moduly workshopu 0-7 sú kompletné s učebnými cieľmi
- ✅ Navigácia medzi kapitolami a modulmi funguje správne
- ✅ Obsah je vhodný pre AI vývojárov používajúcich Microsoft AZD
- ✅ Použitý jazyk priateľský pre začiatočníkov a štruktúra je zachovaná v celom obsahu
- ✅ CONTRIBUTING.md poskytuje jasné usmernenie pre prispievateľov komunity

#### Technická implementácia
- **Overovanie odkazov**: Automatizovaný PowerShell skript overil všetky interné odkazy v .md súboroch
- **Audit obsahu**: Manuálna kontrola kompletnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Použité konzistentné vzory navigácie kapitol a modulov

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu
- **Preklady**: Zložky s prekladmi neboli v tejto verzii aktualizované (automatizovaný preklad bude synchronizovaný neskôr)
- **Dĺžka workshopu**: Kompletný workshop teraz poskytuje 3-4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: Monitorovanie, bezpečnosť a vzory koordinácie viacerých agentov
**Táto verzia pridáva komplexné lekcie A triedy o integrácii Application Insights, autentifikačných vzoroch a koordinácii viacerých agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia integrácie Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým provisioningom
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Fungujúce Python aplikácie s vlastnou telemetriou (1,200+ lines)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Microsoft Foundry modelov)
  - 6 Mermaid diagramov (architektúra, distribuované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (alerty, dashboardy, AI monitorovanie)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Streamovanie živých metrik a debugovanie v reálnom čase
  - 40-50 minút učenia s produkčne pripravenými vzormi

- **🔐 Lekcia autentifikácie a bezpečnostných vzorov**: v `docs/getting-started/authsecurity.md`:
  - 3 autentifikačné vzory (connection strings, Key Vault, managed identity)
  - Kompletné Bicep infraštruktúrne šablóny pre bezpečné nasadenia
  - Kód aplikácie Node.js s integráciou Azure SDK
  - 3 kompletné cvičenia (povolenie managed identity, user-assigned identity, rotácia Key Vault)
  - Najlepšie bezpečnostné postupy a konfigurácie RBAC
  - Príručka na riešenie problémov a analýzu nákladov
  - Produkčne pripravené vzory overovania bez hesla

- **🤖 Lekcia vzorov koordinácie viacerých agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorov koordinácie (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
  - Kompletná implementácia orchestrátora služby (Python/Flask, 1,500+ lines)
  - 3 špecializované implementácie agentov (Výskumník, Autor, Editor)
  - Integrácia Service Bus pre frontovanie správ
  - Správa stavu v Cosmos DB pre distribuované systémy
  - 6 Mermaid diagramov znázorňujúcich interakcie agentov
  - 3 pokročilé cvičenia (spracovanie timeoutov, logika opakovaní, prerušovač (circuit breaker))
  - Rozpis nákladov ($240-565/month) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola Pre-deployment**: Teraz obsahuje komplexné vzory monitorovania a koordinácie
- **Kapitola Getting Started**: Vylepšená o profesionálne autentifikačné vzory
- **Pripravenosť na produkciu**: Kompletné pokrytie od bezpečnosti po pozorovateľnosť
- **Osnova kurzu**: Aktualizovaná tak, aby odkazovala na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Postup učenia**: Lepšia integrácia bezpečnosti a monitorovania v celom kurze
- **Kvalita dokumentácie**: Konzistentné štandardy A triedy (95-97%) naprieč novými lekciami
- **Vzory pre produkciu**: Kompletné end-to-end pokrytie pre podnikové nasadenia

#### Vylepšené
- **Skúsenosť vývojára**: Jasná cesta od vývoja k monitorovaniu v produkcii
- **Bezpečnostné štandardy**: Profesionálne vzory pre overovanie a správu tajomstiev
- **Observabilita**: Kompletná integrácia Application Insights s AZD
- **AI záťaže**: Špecializované monitorovanie pre Microsoft Foundry Models a systémy s viacerými agentmi

#### Overené
- ✅ Všetky lekcie obsahujú kompletný fungujúci kód (nie úryvky)
- ✅ Mermaid diagramy pre vizuálne učenie (19 celkovo v 3 lekciách)
- ✅ Praktické cvičenia s overovacími krokmi (9 celkovo)
- ✅ Produkčné Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýza nákladov a stratégie optimalizácie
- ✅ Návody na riešenie problémov a osvedčené postupy
- ✅ Kontrolné body znalostí s overovacími príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný návod na monitorovanie
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektúry viacagentových systémov
- **Overall New Content**: - Konzistentné vysoké štandardy kvality

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované trasovanie
- **Authentication**: Managed Identity + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitoring**: Live metriky + Kusto dotazy + upozornenia + dashboardy
- **Cost Management**: stratégie vzorkovania, politiky uchovávania, kontroly rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšenie kvality dokumentácie a nový príklad Microsoft Foundry Models
**Táto verzia zvyšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Pridané
- **🤖 Microsoft Foundry Models Chat Example**: Kompletné nasadenie gpt-4.1 s fungujúcou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Microsoft Foundry Models (nasadenie modelu gpt-4.1)
  - Python rozhranie chatu cez príkazový riadok s históriou konverzácií
  - Integrácia s Key Vault pre bezpečné ukladanie API kľúčov
  - Sledovanie využitia tokenov a odhad nákladov
  - Obmedzovanie rýchlosti a spracovanie chýb
  - Komplexné README s inštrukciami na nasadenie (35–45 minút)
  - 11 produkčných súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Dokumentačné cvičenia**: Pridané praktické cvičenia do príručky konfigurácie:
  - Cvičenie 1: Konfigurácia pre viac prostredí (15 minút)
  - Cvičenie 2: Cvičenie správy tajomstiev (10 minút)
  - Jasné kritériá úspechu a overovacie kroky
- ✅ **Overenie nasadenia**: Pridaná sekcia overenia do príručky nasadenia:
  - Postupy kontroly stavu
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy nasadenia
  - Rýchla referencia na riešenie problémov

#### Vylepšené
- **examples/README.md**: Aktualizovaný na kvalitu A (93%):
  - Pridané azure-openai-chat do všetkých relevantných sekcií
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky príkladov AI aplikácií
  - Integrované do Rýchleho štartu pre stredne pokročilých používateľov
  - Pridané do sekcie Microsoft Foundry šablón
  - Aktualizovaná porovnávacia matica a sekcie s nálezmi technológií
- **Kvalita dokumentácie**: Zlepšenie z B+ (87%) → A- (92%) v priečinku docs:
  - Pridané očakávané výstupy k kritickým príkladom príkazov
  - Zahrnuté overovacie kroky pre zmeny konfigurácie
  - Zlepšené praktické učenie pomocou cvičení

#### Zmenené
- **Progres učenia**: Lepšia integrácia AI príkladov pre stredne pokročilých študentov
- **Štruktúra dokumentácie**: Viac praktických cvičení s jasnými výsledkami
- **Proces overovania**: Kľúčovým pracovným postupom boli pridané explicitné kritériá úspechu

#### Zlepšené
- **Skúsenosť vývojára**: Nasadenie Microsoft Foundry Models teraz trvá 35–45 minút (vs 60–90 pre komplexné alternatívy)
- **Transparentnosť nákladov**: Jasné odhady nákladov ($50-200/month) pre príklad Microsoft Foundry Models
- **Cesta učenia**: AI vývojári majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a overovacie kroky

#### Overené
- ✅ Príklad Microsoft Foundry Models plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov je syntakticky správnych
- ✅ Inštrukcie v README zodpovedajú skutočnému priebehu nasadenia
- ✅ Odkazy v dokumentácii aktualizované na viac ako 8 miestach
- ✅ Index príkladov presne odráža 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy sú správne

#### Technická implementácia
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Sledovanie tokenov a optimalizácia využitia
- **Deployment**: Jediný príkaz `azd up` pre kompletné nastavenie

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia predstavuje komplexné, produkčné príklady nasadenia kontajnerových aplikácií pomocou Azure Developer CLI (AZD), s úplnou dokumentáciou a integráciou do učebnej cesty.**

#### Pridané
- **🚀 Príklady kontajnerových aplikácií**: Nové lokálne príklady v `examples/container-app/`:
  - [Hlavný sprievodca](examples/container-app/README.md): Kompletný prehľad nasadení kontajnerizovaných aplikácií, rýchly štart, produkcia a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): Priateľské REST API pre začiatočníkov so škálovaním na nulu, sondami zdravotného stavu, monitorovaním a riešením problémov
  - [Mikroslužbová architektúra](../../examples/container-app/microservices): Produkčné nasadenie viacerých služieb (API Gateway, Product, Order, User, Notification), asynchrónne správy, Service Bus, Cosmos DB, Azure SQL, distribuované trasovanie, blue-green/canary nasadenie
- **Najlepšie postupy**: Bezpečnosť, monitorovanie, optimalizácia nákladov a usmernenia pre CI/CD pre kontajnerové pracovné záťaže
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v rôznych jazykoch (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: End-to-end testovacie scenáre, príkazy na monitorovanie, návody na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované, aby zobrazovalo a prepojovalo nové príklady Container App pod "Local Examples - Container Applications"
- **examples/README.md**: Aktualizované, aby zvýraznilo príklady kontajnerových aplikácií, pridalo záznamy do porovnávacej matice a aktualizovalo technológie/architektúru
- **Osnova kurzu a študijný sprievodca**: Aktualizované s odkazmi na nové príklady a nasadzovacie vzory v príslušných kapitolách

#### Overené
- ✅ Všetky nové príklady sú nasaditeľné s `azd up` a dodržiavajú osvedčené postupy
- ✅ Krížové odkazy v dokumentácii a navigácia aktualizované
- ✅ Príklady pokrývajú scenáre od začiatočníkov po pokročilých, vrátane produkčných mikroslužieb

#### Poznámky
- **Rozsah**: Dokumentácia a príklady iba v angličtine
- **Nasledujúce kroky**: Rozšíriť o ďalšie pokročilé kontajnerové vzory a automatizáciu CI/CD v budúcich vydaniach

### [v3.5.0] - 2025-11-19

#### Prebranding produktu: Microsoft Foundry
**Táto verzia vykonáva komplexnú zmenu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" v celej anglickej dokumentácii, odrážajúc oficiálny rebranding Microsoftu.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný prebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkovo: 23 obsahových odkazov aktualizovaných v 7 súboroch dokumentácie

- **📁 Zmeny v štruktúre priečinkov**:
  - `docs/ai-foundry/` premenovaný na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované, aby odrážali novú štruktúru priečinkov
  - Navigačné odkazy overené naprieč dokumentáciou

- **📄 Premenovanie súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky interné odkazy aktualizované na nový názov súboru

#### Aktualizované súbory
- **Dokumentácia kapitol** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencie názvu produktu aktualizované
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencie aktualizované (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 krížové odkazy aktualizované
  - `docs/getting-started/first-project.md` - 2 navigačné odkazy kapitoly aktualizované
  - `docs/getting-started/installation.md` - 2 odkazy na nasledujúcu kapitolu aktualizované
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencie aktualizované (navigácia, Discord komunita)
  - `docs/troubleshooting/common-issues.md` - 1 navigačný odkaz aktualizovaný
  - `docs/troubleshooting/debugging.md` - 1 navigačný odkaz aktualizovaný

- **Súbory štruktúry kurzu** (2 súbory):
  - `README.md` - 17 odkazov aktualizovaných (prehľad kurzu, názvy kapitol, sekcia šablón, postrehy komunity)
  - `course-outline.md` - 14 odkazov aktualizovaných (prehľad, ciele učenia, zdroje kapitol)

#### Overené
- ✅ Žiadne zostávajúce odkazy na priečinok "ai-foundry" v anglickej dokumentácii
- ✅ Žiadne zostávajúce referencie názvu produktu "Microsoft Foundry" v anglickej dokumentácii
- ✅ Všetky navigačné odkazy funkčné s novou štruktúrou priečinkov
- ✅ Premenovania súborov a priečinkov úspešne dokončené
- ✅ Krížové odkazy medzi kapitolami overené

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu v priečinku `docs/`
- **Preklady**: Prekladové priečinky (`translations/`) v tejto verzii neboli aktualizované
- **Workshop**: Materiály workshopu (`workshop/`) v tejto verzii neboli aktualizované
- **Príklady**: Súbory príkladov môžu stále odkazovať na staršie názvy (bude riešené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL a referencie na GitHub repozitár zostávajú nezmenené

#### Príručka migrácie pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu odkazujúcu na starú štruktúru:
1. Aktualizujte odkazy na priečinky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na súbory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahradiť názov produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Overte, že všetky interné odkazy v dokumentácii stále fungujú

---

### [v3.4.0] - 2025-10-24

#### Náhľad infraštruktúry a vylepšenia overovania
**Táto verzia prináša komplexnú podporu pre nový preview prvok Azure Developer CLI a zlepšuje používateľskú skúsenosť workshopu.**

#### Pridané
- **🧪 azd provision --preview Feature Documentation**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referencia príkazu a príklady použitia v cheat sheete
  - Podrobná integrácia do príručky provisioning s prípadmi použitia a prínosmi
  - Integrácia predletovej kontroly pre bezpečnejšie overenie nasadenia
  - Aktualizácie príručky na začiatok s postupmi nasadenia s dôrazom na bezpečnosť
- **🚧 Workshop Status Banner**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Dizajn s gradientom a indikátormi výstavby pre jasnú komunikáciu s používateľom
  - Označenie času poslednej aktualizácie pre transparentnosť
  - Mobilne responzívny dizajn pre všetky typy zariadení

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcia náhľadu integrovaná naprieč dokumentáciou nasadenia
- **Prednasadené overenie**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Vývojársky pracovný tok**: Aktualizované sekvencie príkazov zahŕňajú náhľad ako osvedčený postup
- **Zážitok z workshopu**: Jasne nastavené očakávania pre používateľov o stave vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Odporúčaný workflow s náhľadom ako primárnym prístupom
- **Tok dokumentácie**: Overenie infraštruktúry presunuté skôr v procese učenia
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasným časovým rámcom vývoja

#### Zlepšené
- **Prístup „safety-first“**: Zmeny infraštruktúry je možné overiť pred nasadením
- **Tímová spolupráca**: Výsledky náhľadu možno zdieľať na revíziu a schválenie
- **Povšimnuteľnosť nákladov**: Lepšie pochopenie nákladov na prostriedky pred provisioningom
- **Zníženie rizika**: Menej zlyhaní nasadenia vďaka predbežnému overeniu

#### Technická implementácia
- **Multi-dokumentová integrácia**: Funkcia náhľadu zdokumentovaná v 4 kľúčových súboroch
- **Vzorové príkazy**: Konzistentná syntax a príklady naprieč dokumentáciou
- **Integrácia najlepších postupov**: Náhľad zahrnutý v validačných pracovných postupoch a skriptoch
- **Vizualné indikátory**: Jasné označenia NOVÉ funkcie pre lepšiu objaviteľnosť

#### Infrastruktúra workshopu
- **Komunikácia stavu**: Profesionálny HTML banner s gradientným štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja zabraňuje zmätku
- **Profesionálna prezentácia**: Udržiava dôveryhodnosť repozitára pri nastavovaní očakávaní
- **Transparentnosť časovej osi**: October 2025 posledná aktualizácia pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívne učenie
**Táto verzia predstavuje komplexné materiály pre workshop s prehliadačovým interaktívnym sprievodcom a štruktúrovanými učebnými cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Workshop prostredie v prehliadači s možnosťou náhľadu MkDocs
- **📝 Štruktúrované pokyny pre workshop**: 7-kroková vedená učebná cesta od objavenia po prispôsobenie
  - 0-Introduction: Prehľad workshopu a nastavenie
  - 1-Select-AI-Template: Proces objavovania a výberu šablóny
  - 2-Validate-AI-Template: Postupy nasadenia a overenia
  - 3-Deconstruct-AI-Template: Pochopenie architektúry šablóny
  - 4-Configure-AI-Template: Konfigurácia a prispôsobenie
  - 5-Customize-AI-Template: Pokročilé úpravy a iterácie
  - 6-Teardown-Infrastructure: Upratovanie a správa zdrojov
  - 7-Wrap-up: Zhrnutie a ďalšie kroky
- **🛠️ Nástroje workshopu**: Konfigurácia MkDocs s témou Material pre vylepšený zážitok z učenia
- **🎯 Praktická učebná cesta**: 3-kroková metodológia (Objavenie → Nasadenie → Prispôsobenie)
- **📱 Integrácia GitHub Codespaces**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírené s komplexným 2-3 hodinovým štruktúrovaným vzdelávacím zážitkom
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krok-za-krokom pokyny od výberu šablóny po nasadenie do produkcie
- **Vývojárska skúsenosť**: Integrované nástroje pre zjednodušené vývojové workflowy

#### Zlepšené
- **Prístupnosť**: Rozhranie v prehliadači s vyhľadávaním, funkciou kopírovania a prepínačom témy
- **Učenie vlastným tempom**: Flexibilná štruktúra workshopu prispôsobiteľná rôznym rýchlostiam učenia
- **Praktická aplikácia**: Scenáre nasadenia AI šablón v reálnom svete
- **Integrácia komunity**: Integrácia Discordu pre podporu workshopu a spoluprácu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie podľa kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia hover-to-copy pre všetky príklady kódu
- **Prepínač témy**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Vizualizácie**: Snímky obrazovky a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavné prepracovanie navigácie a systém učenia založený na kapitolách
**Táto verzia zavádza komplexnú štruktúru učenia založenú na kapitolách s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Preštruktúrovaný celý kurz do 8 progresívnych učebných kapitol
  - Kapitola 1: Základy & Rýchly štart (⭐ - 30-45 mins)
  - Kapitola 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Kapitola 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Kapitola 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Kapitola 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Kapitola 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Kapitola 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Kapitola 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Komplexný navigačný systém**: Konzistentné navigačné hlavičky a pätičky naprieč celou dokumentáciou
- **🎯 Sledovanie progresu**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Pokyny učebnej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Krížová navigácia**: Súvisiace kapitoly a predpoklady jasne prepojené

#### Vylepšené
- **Štruktúra README**: Transformovaná na štruktúrovanú učebnú platformu so zorganizovaním podľa kapitol
- **Dokumentačná navigácia**: Každá stránka teraz obsahuje kontext kapitoly a pokyny k postupu
- **Organizácia šablón**: Príklady a šablóny namapované na príslušné učebné kapitoly
- **Integrácia zdrojov**: Spolu s príručkami, FAQ a študijnými materiálmi prepojené na relevantné kapitoly
- **Integrácia workshopu**: Praktické laboratóriá namapované na viaceré učebné ciele kapitol

#### Zmenené
- **Progres učenia**: Presunuté z lineárnej dokumentácie na flexibilné učenie založené na kapitolách
- **Umiestnenie konfigurácie**: Presunutý sprievodca konfiguráciou ako Kapitola 3 pre lepší tok učenia
- **Integrácia obsahu AI**: Lepšia integrácia AI-špecifického obsahu naprieč učebnou cestou
- **Obsah pre produkciu**: Pokročilé vzory zhrnuté v Kapitole 8 pre podnikových študentov

#### Zlepšené
- **Používateľská skúsenosť**: Jasné navigačné breadcrumby a indikátory postupu kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre jednoduchšie prechádzanie kurzu
- **Profesionálna prezentácia**: Štruktúra typu univerzitného kurzu vhodná pre akademické a firemné školenia
- **Efektivita učenia**: Skrátený čas na nájdenie relevantného obsahu vďaka vylepšenej organizácii

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná kapitolová navigácia naprieč 40+ dokumentačnými súbormi
- **Pätičná navigácia**: Konzistentné pokyny k postupu a indikátory dokončenia kapitoly
- **Krížové prepojenie**: Komplexný interný prepojovací systém spájajúci súvisiace koncepty
- **Mapovanie kapitol**: Šablóny a príklady jasne spojené s učebnými cieľmi

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné učebné ciele**: Prepracovaný študijný sprievodca zosúladený s 8-kapitolovým systémom
- **🎯 Hodnotenie podľa kapitol**: Každej kapitole priradené konkrétne učebné ciele a praktické cvičenia
- **📋 Sledovanie progresu**: Týždenný rozvrh učenia s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Otázky na overenie poznatkov**: Otázky na overenie znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a odstraňovania problémov
- **📊 Postup zručností**: Jasný postup od základných konceptov po podnikové vzory s dôrazom na rozvoj kariéry
- **🎓 Certifikačný rámec**: Profesionálne rozvojové výsledky a systém rozpoznania komunity
- **⏱️ Riadenie časovej osi**: Štruktúrovaný 10-týždňový plán učenia s overovaním míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené Multi-Agent AI riešenia
**Táto verzia zlepšuje multi-agentné retail riešenie s lepším pomenovaním agentov a vylepšenou dokumentáciou.**

#### Zmenené
- **Multi-Agent Terminológia**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Vylepšené
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Zlepšené
- **Vývojárska skúsenosť**: Jasnejšie role a zodpovednosti agentov v dokumentácii
- **Pripravenosť na produkciu**: Lepšie zosúladenie s podnikateľskými konvenciami pomenovania
- **Vzdelávacie materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojára a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 AI-First Learning Path**: Kompletné preusporiadanie s prioritou pre AI vývojárov a inžinierov
- **Microsoft Foundry Integration Guide**: Komplexná dokumentácia na prepojenie AZD s Microsoft Foundry službami
- **AI Model Deployment Patterns**: Detailný sprievodca pokrývajúci výber modelu, konfiguráciu a stratégie nasadenia do produkcie
- **AI Workshop Lab**: 2-3 hodinový praktický workshop na konverziu AI aplikácií na riešenia nasaditeľné pomocou AZD
- **Best Practices pre produkčné AI**: Podnikové vzory pre škálovanie, monitorovanie a zabezpečenie AI pracovných záťaží
- **AI-špecifický sprievodca odstraňovaním problémov**: Komplexné riešenie problémov pre Microsoft Foundry Models, Cognitive Services a problémy s nasadením AI
- **AI Template Gallery**: Výber Microsoft Foundry šablón s hodnotením zložitosti
- **Materiály workshopu**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **README Structure**: AI-developer focused with 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey alongside traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates including azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Enhanced Discord community support with AI-specific channels and discussions

#### Zameranie na bezpečnosť a produkciu
- **Managed Identity Patterns**: AI-špecifické autentifikačné a bezpečnostné konfigurácie
- **Optimalizácia nákladov**: Sledovanie využitia tokenov a kontrola rozpočtu pre AI pracovné záťaže
- **Nasadenie do viacerých regiónov**: Stratégie pre globálne nasadenie AI aplikácií
- **Monitorovanie výkonu**: AI-špecifické metriky a integrácia s Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logický postup od začiatočníka po pokročilé vzory nasadenia AI
- **Overené URL**: Všetky externé odkazy na repozitáre sú overené a prístupné
- **Kompletná referencia**: Všetky interné odkazy v dokumentácii sú overené a funkčné
- **Pripravené na produkciu**: Podnikové vzory nasadenia s reálnymi príkladmi

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Prestavba repozitára a profesionálne vylepšenia
**Táto verzia predstavuje významné prepracovanie štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný vzdelávací rámec**: Všetky dokumentačné stránky teraz obsahujú sekcie Úvod, Ciele učenia a Výstupy učenia
- **Navigačný systém**: Pridané odkazy Predchádzajúca/Dalšia lekcia v celej dokumentácii pre vedený učebný postup
- **Študijný sprievodca**: Komplexný study-guide.md s učebnými cieľmi, praktickými cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emoji ikony pre lepšiu prístupnosť a profesionálny vzhľad
- **Vylepšená štruktúra obsahu**: Zlepšená organizácia a tok učebných materiálov

#### Zmenené
- **Formát dokumentácie**: Štandardizovaná celá dokumentácia s konzistentnou štruktúrou zameranou na učenie
- **Tok navigácie**: Implementovaný logický postup cez všetky učebné materiály
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného, profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizované všetky interné odkazy pre podporu nového navigačného systému

#### Zlepšené
- **Prístupnosť**: Odstránené závislosti na emoji pre lepšiu kompatibilitu so screen readermi
- **Profesionálny vzhľad**: Čistá, akademického štýlu prezentácia vhodná pre podnikové školenia
- **Učebný zážitok**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný AZD učebný repozitár

#### Pridané
- **Základná dokumentačná štruktúra**
  - Kompletná séria sprievodcov getting-started
  - Komplexná dokumentácia nasadenia a provisioning
  - Podrobné zdroje pre odstraňovanie problémov a sprievodcovia ladením
  - Nástroje a postupy pre pred-nasadené overenie

- **Modul Začať**
  - AZD základy: Hlavné koncepty a terminológia
  - Inštalačný sprievodca: Pokyny pre jednotlivé platformy
  - Sprievodca konfiguráciou: Nastavenie prostredia a autentifikácia
  - Prvý projekt - tutoriál: Krok-za-krokom praktické učenie

- **Modul nasadenia a provisioning**
  - Sprievodca nasadením: Kompletná dokumentácia workflowu
  - Sprievodca provisioningom: Infrastructure as Code s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory multi-service architektúry

- **Modul pred-nasadeného overenia**
  - Plánovanie kapacít: Overenie dostupnosti Azure zdrojov
  - Výber SKU: Kompletné odporúčania pre úrovne služieb
  - Predletové kontroly: Automatizované validačné skripty (PowerShell a Bash)
  - Odhad nákladov a nástroje na plánovanie rozpočtu

- **Modul odstraňovania problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a riešenia
  - Sprievodca ladením: Systematické metodiky odstraňovania problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a odkazy**
  - Cheat sheet príkazov: Rýchla referencia pre základné príkazy
  - Glosár: Komplexné definície terminológie a akronymov
  - FAQ: Podrobné odpovede na bežné otázky
  - Externé zdroje a prepojenia na komunitu

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna pre nasadenie statickej webstránky
  - Konfigurácia aplikácie v kontajneri
  - Vzory integrácie databáz
  - Príklady mikroservisnej architektúry
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: Inštalačné a konfiguračné návody pre Windows, macOS a Linux
- **Rôzne úrovne zručností**: Obsah určený pre študentov aj profesionálnych vývojárov
- **Praktické zameranie**: Praktické príklady a scenáre z reálneho sveta
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory
- **Bezpečnosť na prvom mieste**: Integrované najlepšie bezpečnostné postupy
- **Optimalizácia nákladov**: Pokyny pre ekonomické nasadenia a správu zdrojov

#### Kvalita dokumentácie
- **Detailné príklady kódu**: Praktické, testované ukážky kódu
- **Krok-za-krokom inštrukcie**: Jasné, akčné pokyny
- **Komplexná správa chýb**: Riešenie bežných problémov
- **Integrácia najlepších postupov**: Priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: Aktuálne s najnovšími Azure službami a funkciami azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánované)
#### Rozšírenie AI platformy
- **Podpora viacerých modelov**: Vzory integrácie pre Hugging Face, Azure Machine Learning a vlastné modely
- **Rámce AI agentov**: Šablóny pre nasadenia LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databáz nad rámec Azure AI Search (Pinecone, Weaviate, atď.)
- **AI pozorovateľnosť**: Rozšírené monitorovanie výkonu modelu, použitia tokenov a kvality odpovedí

#### Skúsenosť vývojára
- **Rozšírenie VS Code**: Integrovaná vývojárska skúsenosť AZD + Microsoft Foundry
- **Integrácia GitHub Copilot**: Generovanie šablón AZD asistované AI
- **Interaktívne návody**: Praktické cvičenia s automatizovanou validáciou pre AI scenáre
- **Video obsah**: Doplnkové video návody pre vizuálnych študentov so zameraním na AI nasadenia

### Verzia 4.0.0 (Plánované)
#### Podnikové AI vzory
- **Rámec riadenia**: Riadenie modelov AI, súlad a auditné záznamy
- **AI pre viacerých nájomníkov**: Vzory pre poskytovanie služieb viacerým zákazníkom s izolovanými AI službami
- **Nasadenie AI na edge**: Integrácia s Azure IoT Edge a inštanciami kontajnerov
- **Hybridné cloudové AI**: Multi-cloud a hybridné vzory nasadenia pre AI pracovné zaťaženia

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: MLOps integrácia s Azure Machine Learning pipelines
- **Rozšírená bezpečnosť**: Vzory zero-trust, súkromné koncové body a pokročilá ochrana proti hrozbám
- **Optimalizácia výkonu**: Pokročilé ladenie a škálovacie stratégie pre AI aplikácie s vysokou priepustnosťou
- **Globálna distribúcia**: Vzory pre doručovanie obsahu a edge caching pre AI aplikácie

### Verzia 3.0.0 (Plánované) - Nahradené aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo v3.0.0
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interaktívne návody**: Praktické AI workshop laboratórium (Dokončené)
- ✅ **Modul pokročilej bezpečnosti**: Bezpečnostné vzory špecifické pre AI (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia pracovného zaťaženia AI (Dokončené)

### Verzia 2.1.0 (Plánované) - Čiastočne implementované vo v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Dodatočné príklady**: Nasadenia zamerané na AI (Dokončené)
- ✅ **Rozšírené FAQ**: Otázky a riešenia špecifické pre AI (Dokončené)
- **Integrácia nástrojov**: Rozšírené návody na integráciu IDE a editorov
- ✅ **Rozšírenie monitorovania**: Sledovanie a alarmy špecifické pre AI (Dokončené)

#### Stále plánované do budúceho vydania
- **Dokumentácia priateľská k mobilu**: Responzívny dizajn pre mobilné učenie
- **Offline prístup**: Stiahnuteľné balíčky dokumentácie
- **Rozšírená integrácia IDE**: Rozšírenie VS Code pre AZD + AI pracovné postupy
- **Panel komunity**: Sledovanie metrík komunity v reálnom čase a sledovanie príspevkov

## Prispievanie do changelogu

### Hlásenie zmien
Pri prispievaní do tohto repozitára, uistite sa, že záznamy v changelogu obsahujú:

1. **Číslo verzie**: V súlade so sémantickým verzovaním (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte YYYY-MM-DD
3. **Kategória**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Jasný popis**: Stručný popis toho, čo sa zmenilo
5. **Hodnotenie vplyvu**: Ako zmeny ovplyvňujú existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, sekcie dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo vzdelávacie zdroje
- Dodatočné nástroje, skripty alebo utility

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Deprecated
- Funkcie alebo prístupy, ktoré sa postupne vyraďujú
- Sekcie dokumentácie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastarané informácie alebo vyradené prístupy
- Nadbytočný alebo konsolidovaný obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo chýb
- Zlepšenia presnosti alebo funkčnosti

#### Bezpečnosť
- Vylepšenia alebo opravy súvisiace s bezpečnosťou
- Aktualizácie bezpečnostných postupov
- Riešenie zraniteľností v oblasti bezpečnosti

### Pokyny k sémantickému verzovaniu

#### Hlavná verzia (X.0.0)
- Zásadné zmeny, ktoré vyžadujú zásah používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny, ktoré menia základný prístup alebo metodiku

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo doplnenie obsahu
- Vylepšenia zachovávajúce spätnú kompatibilitu
- Dodatočné príklady, nástroje alebo zdroje

#### Patch verzia (X.Y.Z)
- Opravy chýb a korekcie
- Menšie vylepšenia existujúceho obsahu
- Spresnenia a malé zlepšenia

## Spätná väzba a návrhy od komunity

Aktívne povzbudzujeme spätnú väzbu od komunity na zlepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Nahláste problémy alebo navrhnite vylepšenia (otázky špecifické pre AI sú vítané)
- **Diskusie na Discorde**: Zdieľajte nápady a zapojte sa do komunity Microsoft Foundry
- **Pull Requesty**: Přispievajte priamymi zlepšeniami obsahu, najmä AI šablónami a sprievodcami
- **Microsoft Foundry Discord**: Zapojiť sa do #Azure kanála pre diskusie o AZD + AI
- **Fóra komunity**: Zapojte sa do širších diskusií vývojárov Azure

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy integrácie a nasadenia AI služieb
- **Skúsenosť učenia**: Návrhy na zlepšenie študijného toku pre vývojárov AI
- **Chýbajúci AI obsah**: Požiadavky na ďalšie AI šablóny, vzory alebo príklady
- **Prístupnosť**: Zlepšenia pre rôzne vzdelávacie potreby
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovných postupov vývoja AI
- **Produkčné AI vzory**: Požiadavky na podnikové vzory nasadenia AI

### Záväzok odpovede
- **Odpoveď na issue**: Do 48 hodín pri nahlásených problémoch
- **Žiadosti o funkcie**: Hodnotenie do jedného týždňa
- **Príspevky komunity**: Kontrola do jedného týždňa
- **Bezpečnostné problémy**: Okamžitá priorita s urýchlenou odozvou

## Plán údržby

### Pravidelné aktualizácie
- **Mesačné revízie**: Presnosť obsahu a overenie odkazov
- **Štvrťročné aktualizácie**: Hlavné doplnenia obsahu a vylepšenia
- **Poloročné revízie**: Komplexná reštrukturalizácia a vylepšenia
- **Ročné vydania**: Hlavné aktualizácie verzií s významnými zlepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automatizované testovanie**: Pravidelná validácia príkladov kódu a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné začleňovanie návrhov používateľov
- **Aktualizácie technológií**: Zladenie s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelné prehodnocovanie princípov inkluzívneho dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy po dobu 12 mesiacov
- **Legacy verzie**: Len podpora komunity, bez oficiálnych aktualizácií

### Pokyny na migráciu
Keď sú vydané hlavné verzie, poskytujeme:
- **Návody na migráciu**: Krok za krokom inštrukcie pre prechod
- **Poznámky o kompatibilite**: Detaily o zlomených zmenách
- **Podpora nástrojov**: Skripty alebo utility na pomoc pri migrácii
- **Podpora komunity**: Venované fóra pre otázky k migrácii

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Ďalšia lekcia**: Návrat na [Hlavné README](README.md)

**Zostaňte informovaní**: Sledujte toto úložisko pre oznámenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, berte prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by sa mal považovať za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vzniknuté v dôsledku použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
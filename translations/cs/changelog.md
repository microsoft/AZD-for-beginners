# Seznam změn - AZD pro začátečníky

## Úvod

Tento seznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD For Beginners. Dodržujeme principy sémantického verzování a tento záznam udržujeme, aby uživatelé pochopili, co se změnilo mezi verzemi.

## Cíle učení

Přezkoumáním tohoto seznamu změn budete:
- Informováni o nových funkcích a přidaném obsahu
- Rozumět vylepšením stávající dokumentace
- Sledovat opravy chyb a korekce pro zajištění přesnosti
- Sledovat vývoj výukových materiálů v čase

## Výstupy učení

Po prostudování záznamů změn budete schopni:
- Identifikovat nový obsah a zdroje dostupné k učení
- Pochopit, které sekce byly aktualizovány nebo vylepšeny
- Naplánovat si studijní cestu na základě nejaktuálnějších materiálů
- Přispívat zpětnou vazbou a návrhy na budoucí vylepšení

## Historie verzí

### [v3.18.0] - 2026-03-16

#### AZD AI CLI příkazy, ověření obsahu & rozšíření šablon
**Tato verze přidává pokrytí příkazů `azd ai`, `azd extension` a `azd mcp` ve všech kapitolách souvisejících s AI, opravuje nefunkční odkazy a zastaralý kód v agents.md, aktualizuje rychlou pomůcku a kompletně přepracovává sekci Příkladové šablony s ověřenými popisy a novými Azure AI AZD šablonami.**

#### Přidáno
- **🤖 Pokrytí AZD AI CLI** napříč 7 soubory (dříve pouze v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekce "Extensions and AI Commands" představující `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s porovnávací tabulkou (přístup podle šablony vs manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekce "AZD Extensions for Foundry" a "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Rychlý start nyní ukazuje oba deploymentní postupy založené na šabloně i manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekce Deploy nyní obsahuje volbu `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekce "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nová sekce "AI & Extensions Commands" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI ukázkové šablony** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat používající Langchain4J s možnostmi nasazení na ACA/AKS
  - **contoso-creative-writer** — Více-agentová aplikace pro kreativní psaní využívající Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG využívající Azure Functions + LangChain.js + Cosmos DB s lokální podporou vývoje přes Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový RAG akcelerátor s administrátorským portálem, integrací do Teams a možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenční aplikace pro více-agentovou MCP orchestraci se servery v .NET, Pythonu, Javě a TypeScriptu
  - **azd-ai-starter** — Minimální Bicep startovací šablona pro Azure AI infrastrukturu
  - **🔗 Odkaz na Awesome AZD AI Gallery** — Odkaz na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablon)

#### Opraveno
- **🔗 agents.md navigace**: Odkazy Předchozí/Následující nyní odpovídají pořadí lekcí v README kapitoly 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md nefunkční odkazy**: `production-ai-practices.md` opraveno na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 agents.md zastaralý kód**: `opencensus` nahrazeno `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neplatné API**: Přesun `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 agents.md počítání tokenů**: Hrubý odhad `len//4` nahrazen `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opraveny služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (výchozí hostitel změněn v říjnu 2024)
- **contoso-chat**: Aktualizován popis tak, aby odrážel Azure AI Foundry + Prompty, což odpovídá skutečnému názvu a technologickému stacku repozitáře

#### Odstraněno
- **ai-document-processing**: Odstraněna reference na nefunkční šablonu (repozitář není veřejně přístupný jako AZD šablona)

#### Vylepšeno
- **📝 agents.md cvičení**: Cvičení 1 nyní zobrazuje očekávaný výstup a krok `azd monitor`; Cvičení 2 obsahuje plnou registraci `FunctionTool`; Cvičení 3 nahrazuje vágní pokyny konkrétními příkazy `prepdocs.py`
- **📚 agents.md zdroje**: Aktualizovány odkazy na dokumentaci na aktuální Azure AI Agent Service docs a quickstart
- **📋 agents.md tabulka Další kroky**: Přidán odkaz na AI Workshop Lab pokrývající celou kapitolu

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
**Tato verze vylepšuje navigaci v README.md kapitol pomocí rozšířeného formátu tabulky.**

#### Změněno
- **Tabulka mapy kurzu**: Vylepšena o přímé odkazy na lekce, odhadované časy trvání a hodnocení složitosti
- **Vyčištění složek**: Odebrány nadbytečné staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validace odkazů**: Všechny 21+ interní odkazy v tabulce mapy kurzu ověřeny

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty podle aktuálního brandingu Microsoftu.**

#### Změněno
- **Microsoft Foundry → Microsoft Foundry**: Všechny odkazy aktualizovány napříč netranslačními soubory
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován tak, aby odrážel současný branding

#### Aktualizované soubory
- `README.md` - Hlavní vstupní stránka kurzu
- `changelog.md` - Historie verzí
- `course-outline.md` - Struktura kurzu
- `docs/chapter-02-ai-development/agents.md` - Příručka AI agentů
- `examples/README.md` - Dokumentace příkladů
- `workshop/README.md` - Vstupní stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všechny soubory s instrukcemi workshopu

---

### [v3.15.0] - 2026-02-05

#### Hlavní restrukturalizace repozitáře: složky pojmenované podle kapitol
**Tato verze restrukturalizuje dokumentaci do dedikovaných složek kapitol pro přehlednější navigaci.**

#### Přejmenování složek
Staré složky byly nahrazeny kapitolemi číslovanými podle pořadí:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Přidáno nové: `docs/chapter-05-multi-agent/`

#### Migrace souborů
| Soubor | Zdroj | Cíl |
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

#### Přidáno
- **📚 README soubory kapitol**: Vytvořeny README.md v každé složce kapitoly s:
  - Cíli učení a délkou trvání
  - Tabulkou lekcí s popisy
  - Rychlými startovacími příkazy
  - Navigací do ostatních kapitol

#### Změněno
- **🔗 Aktualizovány všechny interní odkazy**: 78+ cest aktualizováno napříč všemi dokumenty
- **🗺️ Hlavní README.md**: Aktualizována mapa kurzu s novou strukturou kapitol
- **📝 examples/README.md**: Aktualizovány křížové reference na složky kapitol

#### Odstraněno
- Staré struktury složek (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace repozitáře: navigace kapitol
**Tato verze přidala README soubory pro navigaci kapitol (následně nahrazeno verzí v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nová příručka AI agentů
**Tato verze přidává komplexní průvodce nasazením AI agentů s Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce zahrnující:
  - Co jsou AI agenti a jak se liší od chatbotů
  - Tři rychlé startovací agentní šablony (Foundry Agents, Prompty, RAG)
  - Vzorové architektury agentů (single agent, RAG, multi-agent)
  - Konfigurace nástrojů a přizpůsobení
  - Monitorování a sledování metrik
  - Úvahy o nákladech a optimalizaci
  - Běžné scénáře řešení problémů
  - Tři praktická cvičení s kritérii úspěchu

#### Struktura obsahu
- **Úvod**: Koncepty agentů pro začátečníky
- **Rychlý start**: Nasazení agentů pomocí `azd init --template get-started-with-ai-agents`
- **Architektonické vzory**: Vizualizace vzorů agentů
- **Konfigurace**: Nastavení nástrojů a proměnné prostředí
- **Monitorování**: Integrace Application Insights
- **Cvičení**: Postupné praktické učení (20-45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace prostředí DevContainer
**Tato verze aktualizuje konfiguraci vývojového kontejneru s moderními nástroji a lepšími výchozími hodnotami pro zkušenost s učením AZD.**

#### Změněno
- **🐳 Základní image**: Aktualizováno z `python:3.12-bullseye` na `python:3.12-bookworm` (nejnovější stabilní Debian)
- **📛 Název kontejneru**: Přejmenováno z "Python 3" na "AZD for Beginners" pro přehlednost

#### Přidáno
- **🔧 Nové funkce vývojového kontejneru**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verze pro šablony AZD)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazení kontejnerových aplikací

- **🔌 Přesměrování portů**: Předkonfigurované porty pro běžný vývoj:
  - 8000 (náhled MkDocs)
  - 3000 (webové aplikace)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nová rozšíření VS Code**:
  - `ms-python.vscode-pylance` - Vylepšený Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure prostředků
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Lintování Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramů
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Git
  - `mhutchie.git-graph` - Historie Git

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro interpret Pythonu, formátování při uložení a ořezávání mezer

- **📦 Aktualizován requirements-dev.txt**:
  - Přidán plugin MkDocs minify
  - Přidán pre-commit pro kvalitu kódu
  - Přidány balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Příkaz Post-Create**: Nyní ověřuje instalaci AZD a Azure CLI při spuštění kontejneru

---

### [v3.11.0] - 2026-02-05

#### Přepracování README přívětivého pro začátečníky
**Tato verze výrazně vylepšuje README.md, aby byl přístupnější pro začátečníky, a přidává základní zdroje pro AI vývojáře.**

#### Přidáno
- **🆚 Srovnání Azure CLI vs AZD**: Jasné vysvětlení, kdy použít který nástroj s praktickými příklady
- **🌟 Awesome AZD Links**: Přímé odkazy na galerii šablon komunity a zdroje pro přispívání:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ připravených šablon k nasazení
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Příspěvek komunity
- **🎯 Rychlý průvodce**: Zjednodušená tříkroková sekce pro začátek (Instalace → Přihlášení → Nasazení)
- **📊 Tabulka navigace podle zkušeností**: Jasné pokyny, kde začít podle zkušeností vývojáře

#### Změněno
- **Struktura README**: Přeuspořádáno pro postupné odkrývání informací - nejdůležitější informace první
- **Úvodní sekce**: Přepsána s vysvětlením "Kouzla `azd up`" pro úplné začátečníky
- **Odebrán duplicitní obsah**: Odstraněna duplicitní sekce řešení problémů
- **Příkazy pro řešení problémů**: Opraven odkaz `azd logs` na použití platného `azd monitor --logs`

#### Opraveno
- **🔐 Příkazy pro autentizaci**: Přidáno `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na příkazy**: Odebráno zbývající `azd logs` z kapitoly řešení problémů v README

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílové publikum**: Vylepšení cílená zejména na vývojáře nová v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující příkazy AZD v celé dokumentaci a zajišťuje, že všechny příklady kódu používají platnou syntaxi Azure Developer CLI.**

#### Opraveno
- **🔧 Odstraněny neexistující příkazy AZD**: Komplexní audit a oprava neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo alternativami Azure CLI
  - `azd service` subcommands (neexistují) → nahrazeno `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistují) → odstraněno nebo nahrazeno platnými alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` přepínače (neexistují) → odstraněny
  - `azd provision --what-if/--rollback` přepínače (neexistují) → aktualizováno pro použití `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Soubory aktualizované s opravami příkazů**:
  - `resources/cheat-sheet.md`: Komplexní přepracování reference příkazů
  - `docs/deployment/deployment-guide.md`: Opraveny strategie rollbacku a nasazení
  - `docs/troubleshooting/debugging.md`: Opravené sekce analýzy logů
  - `docs/troubleshooting/common-issues.md`: Aktualizované příkazy pro řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Opravené příkazy pro monitorování
  - `docs/getting-started/first-project.md`: Aktualizované příklady monitorování a ladění
  - `docs/getting-started/installation.md`: Opravené ukázky nápovědy a verze
  - `docs/pre-deployment/application-insights.md`: Opravené příkazy pro zobrazení logů
  - `docs/pre-deployment/coordination-patterns.md`: Opravené debugování agentů

#### Změněno
- **Strategie rollbacku**: Aktualizována dokumentace pro použití rollbacku založeného na Gitu (AZD nemá nativní rollback)
- **Zobrazování logů**: `azd logs` nahrazeno `azd monitor --logs`, `azd monitor --live` a příkazy Azure CLI
- **Sekce výkonu**: Odebrány neexistující přepínače pro paralelní/incremental nasazení, poskytnuty platné alternativy

#### Technické detaily
- **Platné příkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné přepínače azd monitor**: `--live`, `--logs`, `--overview`
- **Odstraněné funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a aktualizace kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny nefunkční odkazy v dokumentaci a zlepšuje celkovou kvalitu obsahu pro AI vývojáře používající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument s pokyny pro přispívání, obsahující:
  - Jasné instrukce pro hlášení problémů a navrhování změn
  - Standardy dokumentace pro nový obsah
  - Pokyny pro ukázky kódu a konvence commit zpráv
  - Informace o zapojení komunity

#### Dokončeno
- **🎯 Workshop Module 7 (Wrap-up)**: Plně dokončený závěrečný modul s:
  - Komplexním shrnutím úspěchů workshopu
  - Sekcí klíčových osvojených konceptů pokrývajících AZD, šablony a Microsoft Foundry
  - Doporučeními pro pokračování v učení
  - Cvičeními s obtížnostmi pro závěrečné úkoly workshopu
  - Odkazy na zpětnou vazbu komunity a podporu

- **📚 Workshop Module 3 (Deconstruct)**: Aktualizované výukové cíle s:
  - Pokyny k aktivaci GitHub Copilot s MCP servery
  - Porozuměním struktuře složek šablon AZD
  - Vzory organizace Infrastructure-as-code (Bicep)
  - Instrukcemi pro praktická cvičení

- **🔧 Workshop Module 6 (Teardown)**: Dokončeno s:
  - Úkoly pro čištění prostředků a řízení nákladů
  - Použitím `azd down` pro bezpečné odprovisionování infrastruktury
  - Pokyny pro obnovení soft-deleted kognitivních služeb
  - Bonusové výzvy pro zkoumání GitHub Copilot a Azure Portal

#### Opraveno
- **🔗 Opravené nefunkční odkazy**: Vyřešeno 15+ nefunkčních interních dokumentačních odkazů:
  - `docs/ai-foundry/ai-model-deployment.md`: Opraveny cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opraveny cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazen neexistující cicd-integration.md souborem deployment-guide.md
  - `examples/retail-scenario.md`: Opraveny cesty v FAQ a průvodci řešením problémů
  - `examples/container-app/microservices/README.md`: Opraveny cesty na úvodní stránku kurzu a průvodce nasazením
  - `resources/faq.md` a `resources/glossary.md`: Aktualizovány reference kapitoly AI
  - `course-outline.md`: Opraveny reference instruktorova průvodce a laboratorních materiálů AI workshopu

- **📅 Banner stavu workshopu**: Aktualizováno z "Under Construction" na aktivní stav workshopu s datem únor 2026
- **🔗 Navigace workshopu**: Opraveny nefunkční navigační odkazy v workshop README.md směřující na neexistující složku lab-1-azd-basics

#### Změněno
- **Prezentace workshopu**: Odebráno upozornění "under construction", workshop je nyní kompletní a připravený k použití
- **Konzistence navigace**: Zajištěno, že všechny moduly workshopu mají správnou mezimodulovou navigaci
- **Reference studijních cest**: Aktualizovány křížové reference kapitol na správné microsoft-foundry cesty

#### Ověřeno
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Moduly workshopu 0-7 jsou kompletní s výukovými cíli
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Jazyk přívětivý pro začátečníky a struktura jsou zachovány
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro přispěvatele komunity

#### Technická implementace
- **Validace odkazů**: Automatizovaný PowerShell skript ověřil všechny interní .md odkazy
- **Audit obsahu**: Ruční kontrola úplnosti workshopu a vhodnosti pro začátečníky
- **Systém navigace**: Aplikovány konzistentní vzory navigace kapitol a modulů

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci
- **Překlady**: Složky s překlady nebyly v této verzi aktualizovány (automatizovaný překlad bude synchronizován později)
- **Délka workshopu**: Kompletní workshop nyní poskytuje 3-4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitoring, zabezpečení a vzory pro více agentů
**Tato verze přidává komplexní lekce úrovně A o integraci Application Insights, autentizačních vzorech a koordinaci více agentů pro produkční nasazení.**

#### Přidáno
- **📊 Lekce integrace Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým zřizováním prostředků
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Fungující Python aplikace s vlastní telemetrií (1,200+ řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů modelů Microsoft Foundry)
  - 6 Mermaid diagramů (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, monitorování AI)
  - Příklady dotazů Kusto a strategie optimalizace nákladů
  - Živé streamování metrik a ladění v reálném čase
  - 40-50 minut doby učení s produkčními vzory

- **🔐 Lekce autentizace a bezpečnostních vzorů**: v `docs/getting-started/authsecurity.md`:
  - 3 autentizační vzory (connection strings, Key Vault, managed identity)
  - Kompletní Bicep infrastruktura pro bezpečná nasazení
  - Kód aplikace Node.js s integrací Azure SDK
  - 3 kompletní cvičení (povolení managed identity, uživatelsky přidělená identity, rotace Key Vault)
  - Best practices pro bezpečnost a konfigurace RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkční vzory bezheslové autentizace

- **🤖 Lekce vzorů koordinace více agentů**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorů koordinace (sekvenční, paralelní, hierarchický, událostmi řízený, konsenzuální)
  - Kompletní implementace orchestrátoru služby (Python/Flask, 1,500+ řádků)
  - 3 specializované implementace agentů (Research, Writer, Editor)
  - Integrace Service Bus pro frontování zpráv
  - Správa stavu v Cosmos DB pro distribuované systémy
  - 6 Mermaid diagramů zobrazujících interakce agentů
  - 3 pokročilá cvičení (ošetření timeoutů, logika opakování pokusů, circuit breaker)
  - Rozpis nákladů ($240-565/month) s optimalizačními strategiemi
  - Integrace Application Insights pro monitoring

#### Vylepšeno
- **Přednasazovací kapitola**: Nyní obsahuje komplexní vzory monitorování a koordinace
- **Úvodní kapitola**: Vylepšena o profesionální autentizační vzory
- **Připravenost na produkci**: Kompletní pokrytí od zabezpečení po observabilitu
- **Osnova kurzu**: Aktualizována o reference na nové lekce v kapitolách 3 a 6

#### Změněno
- **Postup učení**: Lepší integrace zabezpečení a monitorování napříč kurzem
- **Kvalita dokumentace**: Konzistentní standardy úrovně A (95-97%) napříč novými lekcemi
- **Produkční vzory**: Kompletní end-to-end pokrytí pro podniková nasazení

#### Vylepšeno
- **Developer Experience**: Jasná cesta od vývoje k provoznímu monitorování
- **Security Standards**: Profesionální vzory pro autentizaci a správu tajemství
- **Observability**: Kompletní integrace Application Insights s AZD
- **AI Workloads**: Specializované monitorování pro Microsoft Foundry Models a multi-agentní systémy

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní fungující kód (ne jen úryvky)
- ✅ Mermaid diagramy pro vizuální učení (celkem 19 napříč 3 lekcemi)
- ✅ Praktická cvičení s ověřovacími kroky (celkem 9)
- ✅ Produkčně připravené Bicep šablony nasaditelné pomocí `azd up`
- ✅ Analýza nákladů a strategie optimalizace
- ✅ Návody pro řešení problémů a osvědčené postupy
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitorováním
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektury více agentů
- **Overall New Content**: - Konzistentní standardy vysoké kvality

#### Technická implementace
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Authentication**: Spravovaná identita + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrace
- **Monitoring**: Live metrics + Kusto dotazy + upozornění + dashboardy
- **Cost Management**: Strategie vzorkování, politiky uchovávání, řízení rozpočtu

### [v3.7.0] - 2025-11-19

#### Vylepšení kvality dokumentace a nový příklad Microsoft Foundry Models
**Tato verze zlepšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Přidáno
- **🤖 Microsoft Foundry Models Chat Example**: Kompletní nasazení gpt-4.1 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Microsoft Foundry Models (nasazení modelu gpt-4.1)
  - Python příkazové rozhraní pro chat s historií konverzací
  - Integrace s Key Vault pro bezpečné uložení API klíče
  - Sledování využití tokenů a odhad nákladů
  - Omezování rychlosti požadavků a zpracování chyb
  - Komplexní README s průvodcem nasazením 35–45 minut
  - 11 produkčně připravených souborů (Bicep šablony, Python aplikace, konfigurace)
- **📚 Documentation Exercises**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace pro více prostředí (15 minut)
  - Cvičení 2: Procvičování správy tajemství (10 minut)
  - Jasná kritéria úspěchu a ověřovací kroky
- **✅ Deployment Verification**: Přidána sekce ověření nasazení do průvodce nasazením:
  - Postupy kontroly stavu (health check)
  - Kontrolní seznam kritérií úspěchu
  - Očekávané výstupy pro všechny příkazy nasazení
  - Rychlá reference pro řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na kvalitu A (93%):
  - Přidáno azure-openai-chat do všech relevantních sekcí
  - Aktualizován počet lokálních příkladů z 3 na 4
  - Přidáno do tabulky příkladů AI aplikací
  - Začleněno do Rychlého startu pro středně pokročilé uživatele
  - Přidáno do sekce Microsoft Foundry Templates
  - Aktualizovány sekce Porovnávací matice a zjištění technologií
- **Documentation Quality**: Zlepšeno z B+ (87%) → A- (92%) v rámci složky docs:
  - Přidány očekávané výstupy ke klíčovým příkladům příkazů
  - Zahrnuty ověřovací kroky pro změny konfigurace
  - Vylepšeno praktické učení pomocí praktických cvičení

#### Změněno
- **Learning Progression**: Lepší integrace AI příkladů pro středně pokročilé
- **Documentation Structure**: Více akčních cvičení s jasnými výsledky
- **Verification Process**: Explicitní kritéria úspěchu přidána do klíčových pracovních postupů

#### Vylepšeno
- **Developer Experience**: Nasazení Microsoft Foundry Models nyní trvá 35–45 minut (vs. 60–90 u komplexních alternativ)
- **Cost Transparency**: Jasné odhady nákladů ($50-200/měsíc) pro příklad Microsoft Foundry Models
- **Learning Path**: AI vývojáři mají jasný vstupní bod s azure-openai-chat
- **Documentation Standards**: Konzistentní očekávané výstupy a ověřovací kroky

#### Ověřeno
- ✅ Příklad Microsoft Foundry Models plně funkční s `azd up`
- ✅ Všechny 11 implementačních souborů syntakticky správné
- ✅ Pokyny v README odpovídají skutečné zkušenosti s nasazením
- ✅ Odkazy v dokumentaci aktualizovány na více než 8 místech
- ✅ Index příkladů přesně zobrazuje 4 lokální příklady
- ✅ Žádné duplicitní externí odkazy v tabulkách
- ✅ Všechny navigační reference správné

#### Technická implementace
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + vzor Container Apps
- **Security**: Připravené Managed Identity, tajemství v Key Vault
- **Monitoring**: Integrace Application Insights
- **Cost Management**: Sledování tokenů a optimalizace využití
- **Deployment**: Jediný příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení Container App
**Tato verze zavádí komplexní, produkčně připravené příklady nasazení kontejnerových aplikací pomocí Azure Developer CLI (AZD), s plnou dokumentací a začleněním do vzdělávacího plánu.**

#### Přidáno
- **🚀 Container App Examples**: Nové lokální příklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletní přehled nasazení kontejnerů, rychlý start, provoz a pokročilé vzory
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Uživatelsky přívětivé REST API pro začátečníky se škálováním na nulu, health probe, monitorováním a řešením problémů
  - [Microservices Architecture](../../examples/container-app/microservices): Produkčně připravené nasazení více služeb (API Gateway, Product, Order, User, Notification), asynchronní zasílání zpráv, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary nasazení
- **Best Practices**: Bezpečnost, monitorování, optimalizace nákladů a doporučení CI/CD pro kontejnerové pracovní zátěže
- **Code Samples**: Kompletní `azure.yaml`, Bicep šablony a implementace služeb v několika jazycích (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testovací scénáře, příkazy pro monitorování, návody k řešení problémů

#### Změněno
- **README.md**: Aktualizováno tak, aby obsahovalo a odkazovalo nové příklady Container App pod "Local Examples - Container Applications"
- **examples/README.md**: Aktualizováno tak, aby zvýrazňovalo příklady Container App, přidalo položky do porovnávací matice a aktualizovalo odkazy na technologie/architekturu
- **Course Outline & Study Guide**: Aktualizováno, aby odkazovalo na nové příklady Container App a vzory nasazení v příslušných kapitolách

#### Ověřeno
- ✅ Všechny nové příklady nasaditelné pomocí `azd up` a dodržují osvědčené postupy
- ✅ Křížové odkazy v dokumentaci a navigace aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé, včetně produkčních mikroservis

#### Poznámky
- **Scope**: Pouze anglická dokumentace a příklady
- **Next Steps**: Rozšířit o další pokročilé vzory kontejnerů a automatizaci CI/CD v budoucích vydáních

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Tato verze provádí komplexní změnu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" ve všech anglických dokumentech, což odráží oficiální rebranding Microsoftu.**

#### Změněno
- **🔄 Product Name Update**: Kompletní rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem: 23 obsahových odkazů aktualizováno v rámci 7 dokumentačních souborů

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` přejmenována na `docs/microsoft-foundry/`
  - Všechny křížové reference aktualizovány, aby odrážely novou strukturu složek
  - Navigační odkazy ověřeny v celé dokumentaci

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všechny interní odkazy aktualizovány, aby odkazovaly na nové názvy souborů

#### Aktualizované soubory
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizace navigačních odkazů
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 reference názvu produktu aktualizovány
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizované reference (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 aktualizované křížové odkazy
  - `docs/getting-started/first-project.md` - 2 aktualizované navigační odkazy kapitol
  - `docs/getting-started/installation.md` - 2 aktualizované odkazy na následující kapitolu
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizované reference (navigace, Discord komunita)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizovaný navigační odkaz
  - `docs/troubleshooting/debugging.md` - 1 aktualizovaný navigační odkaz

- **Course Structure Files** (2 files):
  - `README.md` - 17 aktualizovaných odkazů (přehled kurzu, názvy kapitol, sekce šablon, informace o komunitě)
  - `course-outline.md` - 14 aktualizovaných odkazů (přehled, cíle učení, zdroje kapitol)

#### Ověřeno
- ✅ Žádné zbývající reference na složku "ai-foundry" v anglických dokumentech
- ✅ Žádné zbývající reference názvu produktu "Microsoft Foundry" v anglických dokumentech
- ✅ Všechny navigační odkazy funkční s novou strukturou složek
- ✅ Přejmenování souborů a složek úspěšně dokončeno
- ✅ Křížové reference mezi kapitolami ověřeny

#### Poznámky
- **Scope**: Změny aplikovány pouze na anglickou dokumentaci ve složce `docs/`
- **Translations**: Složky s překlady (`translations/`) v této verzi nejsou aktualizovány
- **Workshop**: Materiály workshopu (`workshop/`) v této verzi nejsou aktualizovány
- **Examples**: Ukázkové soubory mohou stále odkazovat na staré názvy (bude řešeno v budoucí aktualizaci)
- **External Links**: Externí URL a odkazy na GitHub repozitář zůstávají nezměněny

#### Průvodce migrací pro přispěvatele
Pokud máte lokální větve nebo dokumentaci odkazující na starou strukturu:
1. Aktualizujte odkazy na složky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na soubory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte název produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Ověřte, že všechny interní odkazy v dokumentaci stále fungují

---

### [v3.4.0] - 2025-10-24

#### Vylepšení náhledu infrastruktury a ověřování
**Tato verze zavádí komplexní podporu nové preview funkce Azure Developer CLI a zlepšuje uživatelský zážitek workshopu.**

#### Přidáno
- **🧪 azd provision --preview Feature Documentation**: Komplexní pokrytí nové schopnosti náhledu infrastruktury
  - Referenční příkazy a příklady použití v cheat sheetu
  - Podrobná integrace v průvodci provisioningem s příklady použití a výhodami
  - Integrace pre-flight kontroly pro bezpečnější ověření nasazení
  - Aktualizace průvodce "Začínáme" s postupy nasazení prioritizujícími bezpečnost
- **🚧 Workshop Status Banner**: Profesionální HTML banner indikující stav vývoje workshopu
  - Gradientní design s ukazateli výstavby pro jasnou komunikaci uživatelům
  - Časová značka poslední aktualizace pro transparentnost
  - Mobilně responzivní design pro všechny typy zařízení

#### Vylepšeno
- **Infrastructure Safety**: Funkce náhledu integrována napříč dokumentací nasazení
- **Pre-deployment Validation**: Automatizované skripty nyní zahrnují testování náhledu infrastruktury
- **Developer Workflow**: Aktualizované sekvence příkazů zahrnují náhled jako doporučený postup
- **Workshop Experience**: Uživatelům jsou nastaveny jasné očekávání ohledně stavu vývoje obsahu

#### Změněno
- **Deployment Best Practices**: Workflow s prioritou náhledu nyní doporučený přístup
- **Documentation Flow**: Ověřování infrastruktury přesunuto dříve v procesu učení
- **Workshop Presentation**: Profesionální komunikace stavu s jasným časovým plánem vývoje

#### Vylepšeno
- **Safety-First Approach**: Změny infrastruktury lze nyní ověřit před nasazením
- **Team Collaboration**: Výsledky náhledu lze sdílet k revizi a schválení
- **Cost Awareness**: Lepší pochopení nákladů na zdroje před provisioningem
- **Risk Mitigation**: Snížení selhání nasazení prostřednictvím předběžného ověření

#### Technická implementace
- **Multi-document Integration**: Funkce náhledu dokumentována napříč 4 klíčovými soubory
- **Command Patterns**: Konzistentní syntaxe a příklady v celé dokumentaci
- **Best Practice Integration**: Náhled zahrnut v validačních pracovních postupech a skriptech
- **Visual Indicators**: Jasné označení NOVÉ funkce pro lepší dohledatelnost

#### Infrastruktura workshopu
- **Status Communication**: Profesionální HTML banner s gradientním stylem
- **User Experience**: Jasný stav vývoje zabraňuje zmatkům
- **Professional Presentation**: Udržuje důvěryhodnost repozitáře při nastavení očekávání
- **Timeline Transparency**: Datum poslední aktualizace říjen 2025 za účelem odpovědnosti

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktivní vzdělávací zážitek
**Tato verze zavádí komplexní materiály workshopu s interaktivními průvodci v prohlížeči a strukturovanými učebními cestami.**

#### Přidáno
- **🎥 Interactive Workshop Guide**: Workshop v prohlížeči s možností náhledu MkDocs
- **📝 Structured Workshop Instructions**: 7-kroková vedená učební cesta od objevení po přizpůsobení
  - 0-Introduction: Přehled workshopu a nastavení
  - 1-Select-AI-Template: Proces objevování a výběru šablony
  - 2-Validate-AI-Template: Postupy nasazení a ověření
  - 3-Deconstruct-AI-Template: Porozumění architektuře šablony
  - 4-Configure-AI-Template: Konfigurace a přizpůsobení
  - 5-Customize-AI-Template: Pokročilé úpravy a iterace
  - 6-Teardown-Infrastructure: Úklid a správa prostředků
  - 7-Wrap-up: Shrnutí a další kroky
- **🛠️ Workshop Tooling**: Konfigurace MkDocs s tématem Material pro vylepšený zážitek z učení
- **🎯 Hands-On Learning Path**: 3-kroková metodologie (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Bezproblémové nastavení vývojového prostředí

#### Enhanced
- **AI Workshop Lab**: Rozšířeno o komplexní 2–3 hodinové strukturované učební prostředí
- **Workshop Documentation**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Learning Progression**: Jasné krok-za-krokem vedení od výběru šablony po nasazení do produkce
- **Developer Experience**: Integrované nástroje pro zjednodušené vývojové workflow

#### Improved
- **Accessibility**: Rozhraní v prohlížeči s vyhledáváním, funkcí kopírování a přepínačem motivu
- **Self-Paced Learning**: Flexibilní struktura workshopu přizpůsobená různým rychlostem učení
- **Practical Application**: Scénáře nasazení AI šablon v reálném světě
- **Community Integration**: Integrace Discordu pro podporu workshopu a spolupráci

#### Workshop Features
- **Built-in Search**: Rychlé vyhledávání klíčových slov a lekcí
- **Copy Code Blocks**: Funkce kopírování kódu po najetí myší pro všechny příklady
- **Theme Toggle**: Podpora tmavého/světelného režimu pro různé preference
- **Visual Assets**: Snímky obrazovky a diagramy pro lepší pochopení
- **Help Integration**: Přímý přístup na Discord pro komunitní podporu

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Tato verze zavádí komplexní strukturu učení založenou na kapitolách s vylepšenou navigací napříč celým repozitářem.**

#### Added
- **📚 Chapter-Based Learning System**: Přestrukturován celý kurz do 8 postupných výukových kapitol
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Konzistentní navigační hlavičky a patičky napříč veškerou dokumentací
- **🎯 Progress Tracking**: Kontrolní seznam dokončení kurzu a systém ověření učení
- **🗺️ Learning Path Guidance**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Cross-Reference Navigation**: Související kapitoly a předpoklady jasně propojené

#### Enhanced
- **README Structure**: Transformováno na strukturovanou výukovou platformu s organizací podle kapitol
- **Documentation Navigation**: Každá stránka nyní obsahuje kontext kapitoly a pokyny k postupu
- **Template Organization**: Příklady a šablony namapovány na odpovídající výukové kapitoly
- **Resource Integration**: Taháky, FAQ a studijní příručky propojené s relevantními kapitolami
- **Workshop Integration**: Praktická cvičení workshopu mapována na více cílů výuky kapitol

#### Changed
- **Learning Progression**: Přesun z lineární dokumentace na flexibilní učení založené na kapitolách
- **Configuration Placement**: Přesun příručky konfigurace do Kapitoly 3 pro lepší tok učení
- **AI Content Integration**: Lepší integrace obsahu specifického pro AI napříč učební cestou
- **Production Content**: Pokročilé vzory konsolidovány v Kapitole 8 pro podnikové uživatele

#### Improved
- **User Experience**: Jasné navigační drobečky a indikátory postupu kapitol
- **Accessibility**: Konzistentní navigační vzory pro snadnější procházení kurzu
- **Professional Presentation**: Struktura ve stylu univerzitního kurzu vhodná pro akademické a korporátní školení
- **Learning Efficiency**: Snížený čas na nalezení relevantního obsahu díky lepší organizaci

#### Technical Implementation
- **Navigation Headers**: Standardizovaná navigace kapitol v 40+ dokumentačních souborech
- **Footer Navigation**: Konzistentní pokyny pro postup a indikátory dokončení kapitol
- **Cross-Linking**: Komplexní systém vnitřního propojování souvisejících konceptů
- **Chapter Mapping**: Šablony a příklady jasně spojeny s cíli učení

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Přestrukturovaný studijní průvodce sladěný s 8-kapitolovým systémem
- **🎯 Chapter-Based Assessment**: Každá kapitola obsahuje specifické cíle učení a praktická cvičení
- **📋 Progress Tracking**: Týdenní plán učení s měřitelnými výsledky a kontrolními seznamy dokončení
- **❓ Assessment Questions**: Otázky pro ověření znalostí pro každou kapitolu s profesionálními výstupy
- **🛠️ Practical Exercises**: Praktické aktivity s reálnými scénáři nasazení a řešení problémů
- **📊 Skill Progression**: Jasný postup od základních konceptů po podnikové vzory s důrazem na rozvoj kariéry
- **🎓 Certification Framework**: Rámec pro profesní rozvoj a komunitní uznání
- **⏱️ Timeline Management**: Strukturovaný 10týdenní plán učení s ověřením milníků

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Tato verze zlepšuje řešení multi-agent pro maloobchod s lepším pojmenováním agentů a rozšířenou dokumentací.**

#### Changed
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplified understanding of agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Tato verze transformuje repozitář do komplexního výukového zdroje zaměřeného na AI s integrací Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Kompletní restrukturalizace s prioritou pro AI vývojáře a inženýry
- **Microsoft Foundry Integration Guide**: Komplexní dokumentace pro propojení AZD se službami Microsoft Foundry
- **AI Model Deployment Patterns**: Podrobný průvodce pokrývající výběr modelu, konfiguraci a strategie nasazení do produkce
- **AI Workshop Lab**: 2-3 hodinový praktický workshop pro převod AI aplikací na řešení nasaditelné pomocí AZD
- **Production AI Best Practices**: Podnikové vzory pro škálování, monitorování a zabezpečení AI workloadů
- **AI-Specific Troubleshooting Guide**: Komplexní řešení problémů pro Microsoft Foundry Models, Cognitive Services a problémy s nasazením AI
- **AI Template Gallery**: Vybraná kolekce šablon Microsoft Foundry s hodnocením složitosti
- **Workshop Materials**: Kompletní struktura workshopu s praktickými cvičeními a referenčními materiály

#### Enhanced
- **README Structure**: Zaměřeno na AI vývojáře s 45% datem komunitního zájmu z Microsoft Foundry Discord
- **Learning Paths**: Dedikovaná učební cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Template Recommendations**: Doporučené AI šablony včetně azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Community Integration**: Rozšířená podpora komunity na Discordu s kanály a diskuzemi specifickými pro AI

#### Security & Production Focus
- **Managed Identity Patterns**: Autentizační a bezpečnostní konfigurace specifické pro AI
- **Cost Optimization**: Sledování využití tokenů a rozpočtové kontroly pro AI workloady
- **Multi-Region Deployment**: Strategie pro globální nasazení AI aplikací
- **Performance Monitoring**: Metriky specifické pro AI a integrace Application Insights

#### Documentation Quality
- **Linear Course Structure**: Logický postup od začátečníka po pokročilé vzory nasazení AI
- **Validated URLs**: Všechny externí odkazy na repozitáře ověřeny a přístupné
- **Complete Reference**: Všechny interní odkazy na dokumentaci ověřeny a funkční
- **Production Ready**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Tato verze představuje významné přepracování struktury repozitáře a prezentace obsahu.**

#### Added
- **Structured Learning Framework**: Všechny dokumentační stránky nyní obsahují sekce Úvod, Cíle učení a Výstupy učení
- **Navigation System**: Přidány odkazy Předchozí/Následující lekce napříč dokumentací pro řízený postup učení
- **Study Guide**: Komplexní study-guide.md s cíli učení, cvičeními a hodnotícími materiály
- **Professional Presentation**: Odebrány všechny emoji ikony pro lepší přístupnost a profesionální vzhled
- **Enhanced Content Structure**: Vylepšená organizace a tok výukových materiálů

#### Changed
- **Documentation Format**: Standardizována veškerá dokumentace konzistentní strukturou orientovanou na učení
- **Navigation Flow**: Implementován logický postup napříč veškerými výukovými materiály
- **Content Presentation**: Odstraněny dekorativní prvky ve prospěch jasného, profesionálního formátování
- **Link Structure**: Aktualizovány všechny interní odkazy pro podporu nového navigačního systému

#### Improved
- **Accessibility**: Odebrány závislosti na emoji pro lepší kompatibilitu s čtečkami obrazovky
- **Professional Appearance**: Čistá, akademická prezentace vhodná pro podnikové vzdělávání
- **Learning Experience**: Strukturovaný přístup s jasnými cíli a výstupy pro každou lekci
- **Content Organization**: Lepší logický tok a propojení souvisejících témat

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Kompletní série průvodců getting-started
  - Komplexní dokumentace nasazení a provisioningu
  - Detailní zdroje pro řešení problémů a průvodce laděním
  - Nástroje a postupy pro přednasazovací validace

- **Getting Started Module**
  - AZD Basics: Základní koncepty a terminologie
  - Installation Guide: Návody pro nastavení podle platformy
  - Configuration Guide: Nastavení prostředí a autentizace
  - First Project Tutorial: Praktické krok-za-krokem učení

- **Deployment and Provisioning Module**
  - Deployment Guide: Komplexní dokumentace pracovního postupu
  - Provisioning Guide: Infrastruktura jako kód s Bicep
  - Best practices for production deployments
  - Vzory architektury pro více služeb

- **Pre-deployment Validation Module**
  - Capacity Planning: Ověření dostupnosti Azure prostředků
  - SKU Selection: Komplexní doporučení pro úrovně služeb
  - Pre-flight Checks: Automatizované validační skripty (PowerShell and Bash)
  - Odhad nákladů a nástroje pro plánování rozpočtu

- **Troubleshooting Module**
  - Common Issues: Nejčastěji se vyskytující problémy a řešení
  - Debugging Guide: Systematické metodiky pro řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Resources and References**
  - Command Cheat Sheet: Rychlá reference pro základní příkazy
  - Glossary: Komplexní definice terminologie a zkratek
  - FAQ: Detailní odpovědi na časté otázky
  - Odkazy na externí zdroje a komunitní propojení

- **Examples and Templates**
  - Příklad jednoduché webové aplikace
  - Šablona pro nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databází
  - Příklady architektury mikroslužeb
  - Implementace serverless funkcí

#### Features
- **Multi-Platform Support**: Návody pro instalaci a konfiguraci pro Windows, macOS a Linux
- **Multiple Skill Levels**: Obsah navržený pro studenty až po profesionální vývojáře
- **Practical Focus**: Praktické příklady a scénáře z reálného světa
- **Comprehensive Coverage**: Od základních konceptů po pokročilé podnikové vzory
- **Security-First Approach**: Bezpečnostní best practices integrovány napříč obsahem
- **Cost Optimization**: Doporučení pro ekonomická nasazení a správu prostředků

#### Documentation Quality
- **Detailed Code Examples**: Praktické, testované ukázky kódu
- **Step-by-Step Instructions**: Jasné, akční pokyny
- **Comprehensive Error Handling**: Řešení běžných problémů
- **Best Practices Integration**: Průmyslové standardy a doporučení
- **Version Compatibility**: Aktuální s nejnovějšími službami Azure a funkcemi azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Podpora více modelů**: Integrační vzory pro Hugging Face, Azure Machine Learning a vlastní modely
- **Rámce pro AI agenty**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databází nad rámec Azure AI Search (Pinecone, Weaviate, atd.)
- **Pozorovatelnost AI**: Rozšířené monitorování výkonu modelu, využití tokenů a kvality odpovědí

#### Zkušenost vývojáře
- **Rozšíření VS Code**: Integrované vývojové prostředí AZD + Microsoft Foundry
- **Integrace GitHub Copilot**: Generování šablon AZD asistované AI
- **Interaktivní tutoriály**: Praktická cvičení v kódování s automatizovanou validací pro AI scénáře
- **Video obsah**: Doplňkové video tutoriály pro vizuální studenty zaměřené na nasazení AI

### Verze 4.0.0 (Plánováno)
#### Podnikové AI vzory
- **Rámec správy**: Správa AI modelů, shoda a auditní stopy
- **Multi-tenant AI**: Vzory pro poskytování služeb více zákazníkům s izolovanými AI službami
- **Nasazení AI na okraji sítě (Edge)**: Integrace s Azure IoT Edge a kontejnerovými instancemi
- **Hybridní cloud AI**: Vzory nasazení AI pro multi-cloud a hybridní prostředí

#### Pokročilé funkce
- **Automatizace AI pipeline**: Integrace MLOps s Azure Machine Learning pipeline
- **Pokročilé zabezpečení**: Zero-trust vzory, soukromé koncové body a pokročilá ochrana proti hrozbám
- **Optimalizace výkonu**: Pokročilé ladění a škálování pro AI aplikace s vysokou propustností
- **Globální distribuce**: Vzory doručení obsahu a cachování na okraji sítě pro AI aplikace

### Verze 3.0.0 (Plánováno) - Nahrazeno aktuálním vydáním
#### Navrhované doplňky - nyní implementováno ve verzi v3.0.0
- ✅ **Obsah zaměřený na AI**: Komplexní integrace Microsoft Foundry (Dokončeno)
- ✅ **Interaktivní tutoriály**: Praktické AI workshop laby (Dokončeno)
- ✅ **Modul pokročilého zabezpečení**: Bezpečnostní vzory specifické pro AI (Dokončeno)
- ✅ **Optimalizace výkonu**: Strategie ladění AI zátěže (Dokončeno)

### Verze 2.1.0 (Plánováno) - Částečně implementováno ve verzi v3.0.0
#### Drobná vylepšení - některé dokončeny v aktuálním vydání
- ✅ **Další příklady**: Nasazovací scénáře zaměřené na AI (Dokončeno)
- ✅ **Rozšířené FAQ**: Otázky a řešení problémů specifické pro AI (Dokončeno)
- **Integrace nástrojů**: Rozšířené průvodce integrací do IDE a editorů
- ✅ **Rozšíření monitorování**: Monitorovací a výstražné vzory specifické pro AI (Dokončeno)

#### Stále plánováno pro budoucí vydání
- **Dokumentace přátelská pro mobilní zařízení**: Responzivní design pro mobilní učení
- **Offline přístup**: Stahovatelné balíčky dokumentace
- **Vylepšená integrace IDE**: Rozšíření VS Code pro AZD + AI pracovní postupy
- **Dashboard komunity**: Metriky komunity v reálném čase a sledování příspěvků

## Přispívání do changelogu

### Hlásit změny
Při přispívání do tohoto repozitáře zajistěte, prosím, aby položky v changelogu obsahovaly:

1. **Číslo verze**: Podle sémantického verzování (major.minor.patch)
2. **Datum**: Datum vydání nebo aktualizace ve formátu YYYY-MM-DD
3. **Kategorie**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Jasný popis**: Stručný popis toho, co se změnilo
5. **Hodnocení dopadu**: Jak změny ovlivní stávající uživatele

### Kategorie změn

#### Added
- Nové funkce, sekce dokumentace nebo schopnosti
- Nové příklady, šablony nebo učební zdroje
- Dodatečné nástroje, skripty nebo utility

#### Changed
- Úpravy stávající funkcionality nebo dokumentace
- Aktualizace pro zlepšení srozumitelnosti nebo přesnosti
- Restrukturalizace obsahu nebo organizace

#### Deprecated
- Funkce nebo přístupy, které se postupně vyřazují
- Sekce dokumentace plánované k odstranění
- Metody, které mají lepší alternativy

#### Removed
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo vyřazené přístupy
- Redundantní nebo konsolidovaný obsah

#### Fixed
- Opravy chyb v dokumentaci nebo kódu
- Vyřešení nahlášených problémů
- Zlepšení přesnosti nebo funkcionality

#### Security
- Zabezpečovací změny nebo opravy
- Aktualizace bezpečnostních doporučení
- Řešení bezpečnostních zranitelností

### Pokyny pro sémantické verzování

#### Hlavní verze (X.0.0)
- Zásadní změny vyžadující zásah uživatele
- Významná restrukturalizace obsahu nebo organizace
- Změny měnící základní přístup nebo metodologii

#### Menší verze (X.Y.0)
- Nové funkce nebo doplňky obsahu
- Vylepšení zachovávající zpětnou kompatibilitu
- Dodatečné příklady, nástroje nebo zdroje

#### Opravná verze (X.Y.Z)
- Opravy chyb a korekce
- Drobná vylepšení stávajícího obsahu
- Upřesnění a malé rozšíření

## Zpětná vazba komunity a návrhy

Aktivně vyzýváme komunitu k zasílání zpětné vazby pro zlepšení tohoto výukového zdroje:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Nahlaste problémy nebo navrhněte vylepšení (AI-specifické problémy vítány)
- **Discord Discussions**: Sdílejte nápady a zapojte se do komunity Microsoft Foundry
- **Pull Requests**: Přispějte přímými vylepšeními obsahu, zejména AI šablonami a průvodci
- **Microsoft Foundry Discord**: Zapojte se do kanálu #Azure pro diskuse o AZD + AI
- **Fóra komunity**: Účastněte se širších diskuzí vývojářů Azure

### Kategorie zpětné vazby
- **Přesnost AI obsahu**: Opravy integrace a nasazení AI služeb
- **Uživatelská zkušenost učení**: Návrhy na zlepšení toku výuky pro AI vývojáře
- **Chybějící AI obsah**: Žádosti o další AI šablony, vzory nebo příklady
- **Přístupnost**: Vylepšení pro různorodé potřeby učení
- **Integrace AI nástrojů**: Návrhy na lepší integraci vývojového workflow AI
- **Produkční AI vzory**: Žádosti o vzory nasazení AI pro podnikové prostředí

### Závazek k odpovědím
- **Odpověď na issue**: Do 48 hodin na nahlášené problémy
- **Žádosti o funkce**: Posouzení do jednoho týdne
- **Příspěvky komunity**: Recenze do jednoho týdne
- **Bezpečnostní problémy**: Okamžitá priorita s urychlenou odpovědí

## Harmonogram údržby

### Pravidelné aktualizace
- **Měsíční kontroly**: Přesnost obsahu a ověření odkazů
- **Čtvrtletní aktualizace**: Hlavní doplňky obsahu a vylepšení
- **Půlroční revize**: Komplexní restrukturalizace a rozšíření
- **Roční vydání**: Hlavní aktualizace verzí s významnými vylepšeními

### Monitorování a zajištění kvality
- **Automatizované testování**: Pravidelná validace ukázek kódu a odkazů
- **Integrace zpětné vazby komunity**: Pravidelné začleňování návrhů uživatelů
- **Aktualizace technologií**: Soulad s nejnovějšími službami Azure a vydáními azd
- **Audity přístupnosti**: Pravidelné kontroly pro zásady inkluzivního designu

## Politika podpory verzí

### Podpora aktuální verze
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Bezpečnostní aktualizace a kritické opravy po dobu 12 měsíců
- **Legacy verze**: Pouze podpora komunity, žádné oficiální aktualizace

### Pokyny pro migraci
Když jsou vydány hlavní verze, poskytujeme:
- **Průvodce migrací**: Krok za krokem přechodové instrukce
- **Poznámky o kompatibilitě**: Detaily o nekompatibilních změnách
- **Podpora nástrojů**: Skripty nebo utility pro asistenci při migraci
- **Podpora komunity**: Vyhrazená fóra pro otázky k migraci

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Návrat na [Hlavní README](README.md)

**Zůstaňte informováni**: Sledujte tento repozitář pro oznámení o nových vydáních a důležitých aktualizacích výukových materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby pro strojový překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění ani chybné výklady, které mohou vzniknout v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
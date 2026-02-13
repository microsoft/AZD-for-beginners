# Změny - AZD pro začátečníky

## Úvod

Tento záznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v úložišti AZD For Beginners. Dodržujeme principy semantického verzování a tento záznam udržujeme, aby uživatelé pochopili, co se změnilo mezi verzemi.

## Cíle učení

Přezkoumáním tohoto záznamu změn budete:
- Informováni o nových funkcích a doplněném obsahu
- Rozumět vylepšením provedeným v existující dokumentaci
- Sledovat opravy chyb a korekce pro zajištění přesnosti
- Sledovat vývoj učebních materiálů v čase

## Výsledky učení

Po přezkoumání záznamů změn budete schopni:
- Identifikovat nový obsah a zdroje dostupné k učení
- Pochopit, které sekce byly aktualizovány nebo vylepšeny
- Naplánovat si učební cestu na základě aktuálních materiálů
- Poskytnout zpětnou vazbu a návrhy na budoucí zlepšení

## Historie verzí

### [v3.17.0] - 2026-02-05

#### Vylepšení navigace kurzu
**Tato verze vylepšuje navigaci kapitol v README.md pomocí rozšířeného formátu tabulky.**

#### Změněno
- **Tabulka mapy kurzu**: Rozšířena o přímé odkazy na lekce, odhadované délky a hodnocení složitosti
- **Vyčištění složek**: Odebrány redundantní staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validace odkazů**: Ověřeno všech 21+ interních odkazů v tabulce mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty tak, aby odpovídaly aktuálnímu brandingu Microsoftu.**

#### Změněno
- **Azure AI Foundry → Microsoft Foundry**: Všechny odkazy aktualizovány napříč soubory, které nejsou překlady
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován tak, aby odrážel aktuální branding

#### Aktualizované soubory
- `README.md` - Hlavní vstupní stránka kurzu
- `changelog.md` - Historie verzí
- `course-outline.md` - Struktura kurzu
- `docs/chapter-02-ai-development/agents.md` - Průvodce AI agenty
- `examples/README.md` - Dokumentace příkladů
- `workshop/README.md` - Úvodní stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všechny soubory instrukcí workshopu

---

### [v3.15.0] - 2026-02-05

#### Velká restrukturalizace úložiště: názvy složek podle kapitol
**Tato verze restrukturalizuje dokumentaci do vyhrazených složek kapitol pro přehlednější navigaci.**

#### Přejmenování složek
Staré složky byly nahrazeny složkami číslovanými podle kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migrace souborů
| Soubor | Odkud | Kam |
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
- **📚 README soubory kapitol**: Vytvořeno README.md v každé složce kapitoly s:
  - Vzdělávací cíle a doba trvání
  - Tabulka lekcí s popisy
  - Rychlé startovací příkazy
  - Navigace do ostatních kapitol

#### Změněno
- **🔗 Aktualizovány všechny interní odkazy**: 78+ cest aktualizováno napříč všemi dokumentačními soubory
- **🗺️ Hlavní README.md**: Aktualizována mapa kurzu s novou strukturou kapitol
- **📝 examples/README.md**: Aktualizovány křížové odkazy na složky kapitol

#### Odebráno
- Staré struktury složek (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace úložiště: navigace kapitol
**Tato verze přidala README soubory pro navigaci kapitol (nahrazeno verzí v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový průvodce pro AI agenty
**Tato verze přidává obsáhlý průvodce pro nasazení AI agentů pomocí Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce obsahující:
  - Co jsou AI agenti a jak se liší od chatbotů
  - Tři šablony pro rychlý start agentů (Foundry Agents, Prompty, RAG)
  - Vzory architektury agentů (jednotlivý agent, RAG, multi-agent)
  - Konfigurace nástrojů a přizpůsobení
  - Monitorování a sledování metrik
  - Úvahy o nákladech a optimalizace
  - Běžné scénáře řešení problémů
  - Tři praktická cvičení s kritérii úspěchu

#### Struktura obsahu
- **Úvod**: Koncepty agentů pro začátečníky
- **Rychlý start**: Nasazení agentů pomocí `azd init --template get-started-with-ai-agents`
- **Vzor architektury**: Vizuální diagramy vzorů agentů
- **Konfigurace**: Nastavení nástrojů a proměnné prostředí
- **Monitorování**: Integrace Application Insights
- **Cvičení**: Postupné praktické učení (20–45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace prostředí DevContainer
**Tato verze aktualizuje konfiguraci vývojového kontejneru s moderními nástroji a lepšími výchozími nastaveními pro zkušenost s učením AZD.**

#### Změněno
- **🐳 Základní image**: Aktualizováno z `python:3.12-bullseye` na `python:3.12-bookworm` (aktuální stabilní Debian)
- **📛 Název kontejneru**: Přejmenováno z "Python 3" na "AZD for Beginners" pro přehlednost

#### Přidáno
- **🔧 Nové funkce Dev Containeru**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verze pro šablony AZD)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazování kontejnerových aplikací

- **🔌 Přesměrování portů**: Předkonfigurované porty pro běžný vývoj:
  - 8000 (náhled MkDocs)
  - 3000 (webové aplikace)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšíření pro VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené IntelliSense pro Python
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojů
  - `yzhang.markdown-all-in-one` - Úpravy Markdownu
  - `DavidAnson.vscode-markdownlint` - Lintování Markdownu
  - `bierner.markdown-mermaid` - Podpora diagramů Mermaid
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Gitu
  - `mhutchie.git-graph` - Historie Gitu

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro Python interpreter, formát při uložení a ořezávání mezer

- **📦 Aktualizován requirements-dev.txt**:
  - Přidán plugin pro minifikaci MkDocs
  - Přidán pre-commit pro kvalitu kódu
  - Přidány balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Post-Create Command**: Nyní ověřuje instalaci AZD a Azure CLI při startu kontejneru

---

### [v3.11.0] - 2026-02-05

#### Přestavba README přívětivého pro začátečníky
**Tato verze výrazně vylepšuje README.md tak, aby byl přístupnější pro začátečníky, a přidává zásadní zdroje pro vývojáře AI.**

#### Přidáno
- **🆚 Srovnání Azure CLI vs AZD**: Jasné vysvětlení, kdy použít který nástroj s praktickými příklady
- **🌟 Awesome AZD Links**: Přímé odkazy na galerii šablon komunity a zdroje pro příspěvky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ šablon připravených k nasazení
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Příspěvek komunity
- **🎯 Průvodce rychlým startem**: Zjednodušená sekce začínající ve třech krocích (Install → Login → Deploy)
- **📊 Tabulka navigace podle zkušeností**: Jasné pokyny, kde začít dle zkušeností vývojáře

#### Změněno
- **Struktura README**: Přeorganizováno pro postupné odhalování - klíčové informace jako první
- **Úvodní sekce**: Přepsána tak, aby vysvětlila „The Magic of `azd up`“ pro úplné začátečníky
- **Odstraněn duplicitní obsah**: Eliminována duplicitní sekce řešení problémů
- **Příkazy pro řešení problémů**: Opraven odkaz na `azd logs` tak, aby používal platné `azd monitor --logs`

#### Opraveno
- **🔐 Příkazy pro autentifikaci**: Přidáno `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné reference příkazů**: Odebrány zbývající odkazy na `azd logs` ze sekce README o řešení problémů

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílové publikum**: Vylepšení cílená specificky na vývojáře nové v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující příkazy AZD v dokumentaci a zajišťuje, že všechny ukázky kódu používají platnou syntax Azure Developer CLI.**

#### Opraveno
- **🔧 Odebrány neexistující příkazy AZD**: Komplexní audit a oprava neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo alternativami Azure CLI
  - `azd service` subpříkazy (neexistují) → nahrazeno `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistují) → odstraněno nebo nahrazeno platnými alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` příznaky (neexistují) → odstraněny
  - `azd provision --what-if/--rollback` příznaky (neexistují) → aktualizováno pro použití `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Soubory aktualizované s opravami příkazů**:
  - `resources/cheat-sheet.md`: Velká přepracování referencí příkazů
  - `docs/deployment/deployment-guide.md`: Opraveny strategie rollbacku a nasazení
  - `docs/troubleshooting/debugging.md`: Opravené sekce analýzy logů
  - `docs/troubleshooting/common-issues.md`: Aktualizovány příkazy pro řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Opraveny příkazy pro monitorování
  - `docs/getting-started/first-project.md`: Aktualizovány příklady monitorování a ladění
  - `docs/getting-started/installation.md`: Opraveny příklady nápovědy a verzí
  - `docs/pre-deployment/application-insights.md`: Opraveny příkazy pro prohlížení logů
  - `docs/pre-deployment/coordination-patterns.md`: Opraveny příkazy pro ladění agentů

- **📝 Aktualizace reference verze**:
  - `docs/getting-started/installation.md`: Změněna pevně zakódovaná verze `1.5.0` na obecnou `1.x.x` s odkazem na releases

#### Změněno
- **Strategie rollbacku**: Dokumentace aktualizována pro použití rollbacku založeného na Gitu (AZD nemá nativní rollback)
- **Prohlížení logů**: Odkazy `azd logs` nahrazeny `azd monitor --logs`, `azd monitor --live` a příkazy Azure CLI
- **Sekce výkonu**: Odstraněny neexistující příznaky paralelního/incrementálního nasazení, poskytnuty platné alternativy

#### Technické podrobnosti
- **Platné AZD příkazy**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné příznaky azd monitor**: `--live`, `--logs`, `--overview`
- **Odstraněné funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny vůči Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a aktualizace kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny rozbité odkazy v dokumentaci a zlepšuje celkovou kvalitu obsahu pro AI vývojáře používající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument s pokyny pro přispívání obsahuje:
  - Jasné instrukce pro hlášení problémů a navrhování změn
  - Standardy dokumentace pro nový obsah
  - Pokyny pro ukázky kódu a konvence zpráv commitů
  - Informace o zapojení komunity

#### Dokončeno
- **🎯 Workshop Modul 7 (Závěrečný modul)**: Kompletně dokončený závěrečný modul s:
  - Komplexním shrnutím dosažených cílů workshopu
  - Sekcí klíčových osvojených konceptů pokrývajících AZD, šablony a AI Foundry
  - Doporučeními pro pokračování v učení
  - Cvičeními k workshopu s hodnocením obtížnosti
  - Odkazy na zpětnou vazbu komunity a podporu

- **📚 Workshop Modul 3 (Deconstruct)**: Aktualizované učební cíle zahrnují:
  - Pokyny pro aktivaci GitHub Copilot s MCP servery
  - Pochopení struktury složek šablon AZD
  - Vzory organizace Infrastructure-as-code (Bicep)
  - Instrukce pro praktické laboratoře

- **🔧 Workshop Modul 6 (Teardown)**: Dokončeno s:
  - Cíli pro úklid zdrojů a řízení nákladů
  - Použitím `azd down` pro bezpečné odprovisionování infrastruktury
  - Pokyny pro obnovu soft-deleted kognitivních služeb
  - Bonusovými návrhy pro průzkum GitHub Copilot a Azure Portal

#### Opraveno
- **🔗 Opravy rozbitých odkazů**: Vyřešeno 15+ rozbitých interních odkazů v dokumentaci:
  - `docs/ai-foundry/ai-model-deployment.md`: Opraveny cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opraveny cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazen neexistující cicd-integration.md souborem deployment-guide.md
  - `examples/retail-scenario.md`: Opraveny cesty v FAQ a příručce pro řešení problémů
  - `examples/container-app/microservices/README.md`: Opraveny cesty na course home a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizovány odkazy v kapitole AI
  - `course-outline.md`: Opraveny odkazy na instructor guide a AI workshop laby

- **📅 Banner stavu workshopu**: Aktualizováno z "Under Construction" na aktivní stav workshopu s datem únor 2026

- **🔗 Navigace workshopu**: Opraveny rozbité navigační odkazy v workshop README.md směřující do neexistující složky lab-1-azd-basics

#### Změněno
- **Prezentace workshopu**: Odstraněn varovný štítek "under construction", workshop je nyní kompletní a připraven k použití
- **Konzistence navigace**: Zajištěno, že všechny moduly workshopu mají správnou mezimodulovou navigaci
- **Odkazy na učební cestu**: Aktualizovány průřezy kapitol tak, aby používaly správné microsoft-foundry cesty

#### Ověřeno
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Moduly workshopu 0-7 jsou kompletní s učebními cíli
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Jazyk a struktura jsou přívětivé pro začátečníky
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro přispěvatele komunity

#### Technická implementace
- **Validace odkazů**: Automatizovaný PowerShell skript ověřil všechny interní .md odkazy
- **Audit obsahu**: Manuální kontrola kompletnosti workshopu a vhodnosti pro začátečníky
- **Navigační systém**: Aplikovány konzistentní vzory navigace kapitol a modulů

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci
- **Překlady**: Složky s překlady v této verzi nebyly aktualizovány (automatizovaný překlad bude synchronizován později)
- **Doba trvání workshopu**: Kompletní workshop nyní poskytuje 3-4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitorování, bezpečnost a vzory multi-agentních systémů
**Tato verze přidává komplexní lekce na úrovni A o integraci Application Insights, autentizačních vzorech a multi-agentní koordinaci pro produkční nasazení.**

#### Přidáno
- **📊 Lekce Integrace Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým provisioningem
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Funkční Python aplikace s vlastní telemetrií (1 200+ řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů Azure OpenAI)
  - 6 Mermaid diagramů (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, AI monitorování)
  - Příklady dotazů v Kusto a strategie optimalizace nákladů
  - Streaming živých metrik a ladění v reálném čase
  - Doba učení 40-50 minut s produkčně připravenými vzory

- **🔐 Lekce Autentizace & Bezpečnostních vzorů**: v `docs/getting-started/authsecurity.md`:
  - 3 autentizační vzory (connection strings, Key Vault, managed identity)
  - Kompletní Bicep infrastruktura pro bezpečná nasazení
  - Node.js aplikační kód s integrací Azure SDK
  - 3 kompletní cvičení (povolení managed identity, user-assigned identity, rotace Key Vault)
  - Best practices pro bezpečnost a konfigurace RBAC
  - Příručka pro řešení problémů a analýzu nákladů
  - Produkčně připravené vzory bezheslové autentizace

- **🤖 Lekce Multi-Agentní Koordinační Vzory**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinačních vzorů (sekvenční, paralelní, hierarchický, řízený událostmi, konsenzus)
  - Kompletní implementace orchestrátoru služby (Python/Flask, 1 500+ řádků)
  - 3 specializované agentní implementace (Research, Writer, Editor)
  - Integrace Service Bus pro frontování zpráv
  - Správa stavu v Cosmos DB pro distribuované systémy
  - 6 Mermaid diagramů zobrazujících interakce agentů
  - 3 pokročilá cvičení (zpracování timeoutů, retry logika, circuit breaker)
  - Rozpis nákladů ($240-565/month) s optimalizačními strategiemi
  - Integrace Application Insights pro monitorování

#### Vylepšeno
- **Kapitolka Pre-deployment**: Nyní zahrnuje komplexní monitorování a koordinační vzory
- **Kapitolka Getting Started**: Vylepšena o profesionální autentizační vzory
- **Připravenost pro produkci**: Kompletní pokrytí od bezpečnosti po observabilitu
- **Osnova kurzu**: Aktualizována tak, aby odkazovala na nové lekce v kapitolách 3 a 6

#### Změněno
- **Progres v učení**: Lepší integrace bezpečnosti a monitorování napříč kurzem
- **Kvalita dokumentace**: Konzistentní A-grade standardy (95-97%) napříč novými lekcemi
- **Produkční vzory**: Kompletní end-to-end pokrytí pro enterprise nasazení

#### Vylepšeno
- **Zkušenost vývojáře**: Jasná cesta od vývoje k produkčnímu monitorování
- **Bezpečnostní standardy**: Profesionální vzory pro autentizaci a správu tajemství
- **Observabilita**: Kompletní integrace Application Insights s AZD
- **AI zátěže**: Specializované monitorování pro Azure OpenAI a multi-agentní systémy

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní funkční kód (nikoli pouze útržky)
- ✅ Mermaid diagramy pro vizuální učení (19 celkem napříč 3 lekcemi)
- ✅ Praktická cvičení s ověřovacími kroky (9 celkem)
- ✅ Produkčně připravené Bicep šablony nasaditelné přes `azd up`
- ✅ Analýza nákladů a optimalizační strategie
- ✅ Příručky pro řešení problémů a best practices
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitorováním
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé multi-agentní architektury
- **Celkově nový obsah**: - Konzistentně vysoké kvalitativní standardy

#### Technická implementace
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Autentizace**: Managed Identity + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrace
- **Monitorování**: Živé metriky + Kusto dotazy + alerty + dashboardy
- **Řízení nákladů**: Strategie sampling, retention policies, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšení kvality dokumentace a nový příklad Azure OpenAI
**Tato verze vylepšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Azure OpenAI s rozhraním GPT-4 chat.**

#### Přidáno
- **🤖 Příklad Azure OpenAI Chat**: Kompletní nasazení GPT-4 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Azure OpenAI (nasazení modelu GPT-4)
  - Python příkazové chat rozhraní s historií konverzací
  - Integrace s Key Vault pro bezpečné uložení API klíčů
  - Sledování využití tokenů a odhad nákladů
  - Omezování rychlosti a zpracování chyb
  - Komplexní README s průvodcem nasazením na 35-45 minut
  - 11 produkčně připravených souborů (Bicep šablony, Python aplikace, konfigurace)
- **📚 Cvičení v dokumentaci**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace pro více prostředí (15 minut)
  - Cvičení 2: Cvičení správy tajemství (10 minut)
  - Jasná kritéria úspěchu a kroky ověření
- **✅ Ověření nasazení**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontroly zdraví
  - Kontrolní seznam kritérií úspěchu
  - Očekávané výstupy pro všechny nasazovací příkazy
  - Rychlá reference pro řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na A-grade kvalitu (93%):
  - Přidán azure-openai-chat do všech relevantních sekcí
  - Aktualizován počet lokálních příkladů z 3 na 4
  - Přidán do tabulky AI Application Examples
  - Integrovaný do Quick Start pro středně pokročilé uživatele
  - Přidán do sekce Microsoft Foundry Templates
  - Aktualizován porovnávací matrix a sekce zjišťování technologií
- **Kvalita dokumentace**: Vylepšena z B+ (87%) → A- (92%) v rámci složky docs:
  - Přidány očekávané výstupy u kritických příkladů příkazů
  - Zahrnuty kroky ověření pro změny konfigurace
  - Rozšířeno praktické učení o akční cvičení

#### Změněno
- **Progres v učení**: Lepší integrace AI příkladů pro středně pokročilé
- **Struktura dokumentace**: Více akčních cvičení s jasnými výsledky
- **Proces ověřování**: Explicitní kritéria úspěchu přidána k hlavním workflow

#### Vylepšeno
- **Zkušenost vývojáře**: Nasazení Azure OpenAI nyní trvá 35-45 minut (vs 60-90 pro složitější alternativy)
- **Transparentnost nákladů**: Jasné odhady nákladů ($50-200/month) pro příklad Azure OpenAI
- **Učební cesta**: AI vývojáři mají jasný vstupní bod s azure-openai-chat
- **Standardy dokumentace**: Konzistentní očekávané výstupy a kroky ověření

#### Ověřeno
- ✅ Příklad Azure OpenAI plně funkční s `azd up`
- ✅ Všechny 11 implementačních souborů jsou syntakticky správné
- ✅ Pokyny v README odpovídají skutečnému nasazovacímu zážitku
- ✅ Odkazy v dokumentaci aktualizovány na více než 8 místech
- ✅ Index příkladů přesně odráží 4 lokální příklady
- ✅ V tabulkách nejsou duplicitní externí odkazy
- ✅ Všechny navigační reference jsou správné

#### Technická implementace
- **Architektura Azure OpenAI**: GPT-4 + Key Vault + Container Apps vzor
- **Bezpečnost**: Připravené Managed Identity, tajemství v Key Vault
- **Monitorování**: Integrace Application Insights
- **Řízení nákladů**: Sledování tokenů a optimalizace využití
- **Nasazení**: Jediný příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení Container App
**Tato verze zavádí komplexní, produkčně připravené příklady nasazení kontejnerových aplikací pomocí Azure Developer CLI (AZD), s plnou dokumentací a integrací do učební cesty.**

#### Přidáno
- **🚀 Příklady Container App**: Nové lokální příklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletní přehled kontejnerizovaných nasazení, quick start, produkční a pokročilé vzory
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API přívětivé pro začátečníky se scale-to-zero, health probes, monitoringem a řešením problémů
  - [Microservices Architecture](../../examples/container-app/microservices): Produkčně připravené více-servisní nasazení (API Gateway, Product, Order, User, Notification), asynchronní messaging, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary nasazení
- **Best Practices**: Bezpečnost, monitorování, optimalizace nákladů a CI/CD doporučení pro kontejnerové zátěže
- **Ukázky kódu**: Kompletní `azure.yaml`, Bicep šablony a vícejazyčné implementace služeb (Python, Node.js, C#, Go)
- **Testování & řešení problémů**: Scénáře end-to-end testů, příkazy pro monitorování, průvodce řešením problémů

#### Změněno
- **README.md**: Aktualizováno tak, aby prezentovalo a odkazovalo na nové příklady Container App v části "Local Examples - Container Applications"
- **examples/README.md**: Aktualizováno k zdůraznění příkladů container app, přidání záznamů do porovnávací matice a aktualizaci referencí technologií/architektury
- **Osnova kurzu a studijní příručka**: Aktualizováno tak, aby odkazovalo na nové příklady aplikací v kontejnerech a vzory nasazení v příslušných kapitolách

#### Ověřeno
- ✅ Všechny nové příklady nasaditelné pomocí `azd up` a dodržují osvědčené postupy
- ✅ Dokumentace — křížové odkazy a navigace aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé, včetně produkčních mikroslužeb

#### Poznámky
- **Scope**: Pouze anglická dokumentace a příklady
- **Next Steps**: Rozšířit o další pokročilé vzory pro kontejnery a automatizaci CI/CD v budoucích verzích

### [v3.5.0] - 2025-11-19

#### Přejmenování produktu: Microsoft Foundry
**Tato verze provádí komplexní změnu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" ve veškeré anglické dokumentaci a odráží oficiální rebranding Microsoftu.**

#### Změněno
- **🔄 Aktualizace názvu produktu**: Kompletní přejmenování z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem: 23 odkazů v obsahu aktualizováno napříč 7 soubory dokumentace

- **📁 Změny struktury složek**:
  - `docs/ai-foundry/` přejmenována na `docs/microsoft-foundry/`
  - Všechny křížové odkazy aktualizovány tak, aby odrážely novou strukturu složek
  - Navigační odkazy ověřeny napříč veškerou dokumentací

- **📄 Přejmenování souborů**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všechny interní odkazy aktualizovány tak, aby odkazovaly na nové jméno souboru

#### Aktualizované soubory
- **Dokumentace kapitol** (7 souborů):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizace navigačních odkazů
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 odkazy na název produktu aktualizovány
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Již používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 odkazy aktualizovány (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 křížové odkazy aktualizovány
  - `docs/getting-started/first-project.md` - 2 navigační odkazy kapitol aktualizovány
  - `docs/getting-started/installation.md` - 2 odkazy na další kapitolu aktualizovány
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 odkazy aktualizovány (navigace, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 navigační odkaz aktualizován
  - `docs/troubleshooting/debugging.md` - 1 navigační odkaz aktualizován

- **Soubory struktury kurzu** (2 soubory):
  - `README.md` - 17 odkazů aktualizováno (přehled kurzu, názvy kapitol, sekce šablon, postřehy komunity)
  - `course-outline.md` - 14 odkazů aktualizováno (přehled, vzdělávací cíle, zdroje kapitol)

#### Ověřeno
- ✅ Žádné zbývající odkazy na cestu složky "ai-foundry" v anglických dokumentech
- ✅ Žádné zbývající reference názvu produktu "Microsoft Foundry" v anglických dokumentech
- ✅ Všechny navigační odkazy fungují s novou strukturou složek
- ✅ Přejmenování souborů a složek úspěšně dokončeno
- ✅ Křížové odkazy mezi kapitolami ověřeny

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

#### Vylepšení náhledu infrastruktury a validace
**Tato verze přináší komplexní podporu pro novou náhledovou funkci Azure Developer CLI a zlepšuje uživatelský zážitek workshopu.**

#### Přidáno
- **🧪 Dokumentace funkce azd provision --preview**: Komplexní pokrytí nové schopnosti náhledu infrastruktury
  - Referenční popis příkazu a příklady použití v cheat sheetu
  - Podrobné začlenění do průvodce provisioningem s použitím případů a přínosů
  - Integrace pre-flight kontrol pro bezpečnější validaci nasazení
  - Aktualizace průvodce pro začátečníky s postupy nasazení založenými na prioritě bezpečnosti
- **🚧 Banner stavu workshopu**: Profesionální HTML banner označující stav vývoje workshopu
  - Gradientní design s ukazateli výstavby pro jasnou komunikaci uživatelům
  - Časové razítko poslední aktualizace pro transparentnost
  - Responsivní design pro všechna zařízení

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrována ve veškeré dokumentaci k nasazení
- **Validace před nasazením**: Automatizované skripty nyní obsahují testování náhledu infrastruktury
- **Workflow vývojáře**: Aktualizované sekvence příkazů zahrnují náhled jako osvědčený postup
- **Zážitek z workshopu**: Jasná očekávání pro uživatele ohledně stavu vývoje obsahu

#### Změněno
- **Nejlepší postupy nasazení**: Postup s náhledem jako první nyní doporučený přístup
- **Tok dokumentace**: Validace infrastruktury přesunuta dříve do učebního procesu
- **Prezentace workshopu**: Profesionální komunikace stavu s jasným časovým plánem vývoje

#### Vylepšeno
- **Přístup orientovaný na bezpečnost**: Změny infrastruktury lze nyní ověřit před nasazením
- **Spolupráce v týmu**: Výsledky náhledu mohou být sdíleny ke kontrole a schválení
- **Vědomí nákladů**: Lepší porozumění nákladům na zdroje před provisioningem
- **Zmírnění rizik**: Snížené selhání nasazení díky předběžné validaci

#### Technická implementace
- **Integrace napříč dokumenty**: Funkce náhledu dokumentována ve 4 klíčových souborech
- **Vzorové příkazy**: Konzistentní syntaxe a příklady napříč dokumentací
- **Začlenění osvědčených postupů**: Náhled zahrnut do workflow pro validaci a skriptů
- **Vizualní indikátory**: Jasné označení NOVÉ funkce pro lepší dohledatelnost

#### Infrastruktura workshopu
- **Komunikace stavu**: Profesionální HTML banner s gradientním stylem
- **Uživatelský zážitek**: Jasný stav vývoje zabraňuje nedorozuměním
- **Profesionální prezentace**: Udržuje důvěryhodnost repozitáře a současně nastavuje očekávání
- **Transparentnost časového plánu**: Časové razítko poslední aktualizace říjen 2025 pro zodpovědnost

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktivní výukový zážitek
**Tato verze přináší komplexní materiály workshopu s interaktivními průvodci v prohlížeči a strukturovanými vzdělávacími cestami.**

#### Přidáno
- **🎥 Interaktivní průvodce workshopem**: Zkušenost workshopu v prohlížeči s možností náhledu MkDocs
- **📝 Strukturované instrukce workshopu**: 7-kroková řízená výuková cesta od objevení po přizpůsobení
  - 0-Introduction: Přehled workshopu a nastavení
  - 1-Select-AI-Template: Objevování šablon a proces výběru
  - 2-Validate-AI-Template: Postupy nasazení a validace
  - 3-Deconstruct-AI-Template: Porozumění architektuře šablony
  - 4-Configure-AI-Template: Konfigurace a přizpůsobení
  - 5-Customize-AI-Template: Pokročilé úpravy a iterace
  - 6-Teardown-Infrastructure: Úklid a správa zdrojů
  - 7-Wrap-up: Shrnutí a další kroky
- **🛠️ Nástroje pro workshop**: Konfigurace MkDocs s Material tématem pro lepší výukový zážitek
- **🎯 Praktická výuková cesta**: 3-kroková metodika (Objevení → Nasazení → Přizpůsobení)
- **📱 Integrace GitHub Codespaces**: Bezproblémové nastavení vývojového prostředí

#### Vylepšeno
- **AI Workshop Lab**: Rozšířeno o komplexní 2–3 hodinovou strukturovanou výukovou zkušenost
- **Dokumentace workshopu**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Postup učení**: Jasné krok-za-krokem vedení od výběru šablony po nasazení do produkce
- **Zážitek vývojáře**: Integrované nástroje pro zefektivněné workflow vývoje

#### Vylepšeno
- **Dostupnost**: Rozhraní v prohlížeči s vyhledáváním, funkcí kopírování a přepínačem motivu
- **Samostudium**: Flexibilní struktura workshopu přizpůsobující se různým rychlostem učení
- **Praktické uplatnění**: Scénáře nasazení AI šablon z reálného světa
- **Integrace komunity**: Integrace s Discordem pro podporu workshopu a spolupráci

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé vyhledávání klíčových slov a lekcí
- **Kopírování bloků kódu**: Funkce kopírování po najetí pro všechny ukázky kódu
- **Přepínání motivu**: Podpora tmavého/světlého režimu pro různé preference
- **Vizuální materiály**: Snímky obrazovky a diagramy pro lepší pochopení
- **Integrace nápovědy**: Přímý přístup na Discord pro podporu komunity

### [v3.2.0] - 2025-09-17

#### Rozsáhlá přestavba navigace a systém výuky založený na kapitolách
**Tato verze zavádí komplexní strukturu výuky založenou na kapitolách s vylepšenou navigací v celém repozitáři.**

#### Přidáno
- **📚 Systém výuky založený na kapitolách**: Celý kurz přestaven do 8 postupných výukových kapitol
  - Kapitola 1: Základy a rychlý start (⭐ - 30–45 min)
  - Kapitola 2: AI-first vývoj (⭐⭐ - 1–2 hod)
  - Kapitola 3: Konfigurace a autentizace (⭐⭐ - 45–60 min)
  - Kapitola 4: Infrastruktura jako kód a nasazení (⭐⭐⭐ - 1–1,5 hod)
  - Kapitola 5: Řešení AI s více agenty (⭐⭐⭐⭐ - 2–3 hod)
  - Kapitola 6: Validace a plánování před nasazením (⭐⭐ - 1 hod)
  - Kapitola 7: Řešení problémů a ladění (⭐⭐ - 1–1,5 hod)
  - Kapitola 8: Produkční a podnikové vzory (⭐⭐⭐⭐ - 2–3 hod)
- **📚 Komplexní navigační systém**: Konzistentní navigační hlavičky a patičky napříč veškerou dokumentací
- **🎯 Sledování pokroku**: Kontrolní seznam dokončení kurzu a systém ověření učení
- **🗺️ Vedení vzdělávací cesty**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Křížová navigace**: Související kapitoly a předpoklady jasně propojené

#### Vylepšeno
- **Struktura README**: Přeměněna na strukturovanou vzdělávací platformu s organizací podle kapitol
- **Navigace dokumentace**: Každá stránka nyní obsahuje kontext kapitoly a vedení postupu
- **Organizace šablon**: Příklady a šablony přiřazeny k odpovídajícím výukovým kapitolám
- **Integrace zdrojů**: Cheat sheety, FAQ a studijní příručky propojeny s příslušnými kapitolami
- **Integrace workshopu**: Praktické laboratoře přiřazeny k více výukovým cílům kapitol

#### Změněno
- **Postup učení**: Přesunuto z lineární dokumentace na flexibilní výuku založenou na kapitolách
- **Umístění konfigurace**: Průvodce konfigurací přesunut do kapitoly 3 pro lepší tok učení
- **Začlenění AI obsahu**: Lepší začlenění obsahu specifického pro AI v průběhu celé výukové cesty
- **Produkční obsah**: Pokročilé vzory konsolidovány v kapitole 8 pro podnikové studenty

#### Vylepšeno
- **Uživatelský zážitek**: Jasné navigační drobečkové cesty a indikátory postupu kapitol
- **Dostupnost**: Konzistentní navigační vzory pro snazší procházení kurzu
- **Profesionální prezentace**: Struktura kurzu ve stylu univerzity vhodná pro akademické i firemní školení
- **Efektivita učení**: Snížení času při hledání relevantního obsahu díky lepší organizaci

#### Technická implementace
- **Navigační hlavičky**: Standardizovaná navigace kapitol napříč více než 40 soubory dokumentace
- **Patická navigace**: Konzistentní vedení postupu a indikátory dokončení kapitol
- **Křížové odkazy**: Komplexní systém interního propojování spojující související koncepty
- **Mapování kapitol**: Šablony a příklady jasně spojeny s výukovými cíli

#### Vylepšení studijní příručky
- **📚 Komplexní výukové cíle**: Studijní příručka přestavěna tak, aby odpovídala systému 8 kapitol
- **🎯 Hodnocení podle kapitol**: Každá kapitola obsahuje konkrétní výukové cíle a praktická cvičení
- **📋 Sledování pokroku**: Týdenní plán učení s měřitelnými výsledky a kontrolními seznamy dokončení
- **❓ Otázky pro hodnocení**: Otázky pro ověření znalostí pro každou kapitolu s profesionálními výstupy
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešením problémů
- **📊 Postup dovedností**: Jasný postup od základních konceptů k podnikových vzorům s důrazem na rozvoj kariéry
- **🎓 Certifikační rámec**: Profesní rozvojové výsledky a systém uznání v komunitě
- **⏱️ Řízení časového plánu**: Strukturovaný 10týdenní plán učení s ověřením milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená řešení AI s více agenty
**Tato verze vylepšuje multi-agentní řešení pro retail lepším pojmenováním agentů a vylepšenou dokumentací.**

#### Změněno
- **Terminologie multi-agentů**: Nahrazeno "Cora agent" výrazem "Customer agent" v celém retailovém multi-agentním řešení pro lepší srozumitelnost
- **Architektura agentů**: Aktualizována veškerá dokumentace, ARM šablony a ukázky kódu, aby používaly konzistentní pojmenování "Customer agent"
- **Příklady konfigurace**: Modernizované vzory konfigurace agentů s aktualizovanými konvencemi pojmenování
- **Konzistence dokumentace**: Zajištěno, že všechny odkazy používají profesionální, popisná jména agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizován retail-multiagent-arm-template s odkazy na Customer agent
- **Architektonické diagramy**: Aktualizovány Mermaid diagramy s novým pojmenováním agentů
- **Ukázky kódu**: Python třídy a implementační příklady nyní používají pojmenování CustomerAgent
- **Proměnné prostředí**: Aktualizovány všechny skripty nasazení, aby používaly konvence CUSTOMER_AGENT_NAME

#### Vylepšeno
- **Developer Experience**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Production Readiness**: Lepší sladění s podnikové nomenklaturou
- **Learning Materials**: Intuitivnější pojmenování agentů pro vzdělávací účely
- **Template Usability**: Jednodušší pochopení funkcí agentů a nasazovacích vzorů

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Kompletní restrukturalizace zaměřená na AI vývojáře a inženýry
- **Microsoft Foundry Integration Guide**: Komplexní dokumentace pro propojení AZD se službami Microsoft Foundry
- **AI Model Deployment Patterns**: Podrobný průvodce pokrývající výběr modelu, konfiguraci a strategie nasazení do produkce
- **AI Workshop Lab**: 2–3 hodinový praktický workshop pro převod AI aplikací na řešení nasaditelné přes AZD
- **Production AI Best Practices**: Podnikové vzory pro škálování, monitorování a zabezpečení AI zátěží
- **AI-Specific Troubleshooting Guide**: Komplexní řešení problémů pro Azure OpenAI, Cognitive Services a nasazení AI
- **AI Template Gallery**: Vybraná kolekce Microsoft Foundry šablon s hodnocením složitosti
- **Workshop Materials**: Kompletní struktura workshopu s praktickými laby a referenčními materiály

#### Enhanced
- **README Structure**: Zaměření na AI vývojáře s 45% zájmem komunity z Microsoft Foundry Discord
- **Learning Paths**: Dedikovaná cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Template Recommendations**: Doporučené AI šablony včetně azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Community Integration**: Rozšířená podpora Discord komunity s kanály a diskusemi specifickými pro AI

#### Security & Production Focus
- **Managed Identity Patterns**: Autentizační a bezpečnostní konfigurace specifické pro AI
- **Cost Optimization**: Sledování využití tokenů a rozpočtová omezení pro AI zátěže
- **Multi-Region Deployment**: Strategie pro globální nasazení AI aplikací
- **Performance Monitoring**: Metriky specifické pro AI a integrace s Application Insights

#### Documentation Quality
- **Linear Course Structure**: Logické postupné vedení od začátečníka po pokročilé vzory nasazení AI
- **Validated URLs**: Všechny externí odkazy na repozitáře ověřeny a dostupné
- **Complete Reference**: Všechny vnitřní odkazy v dokumentaci ověřeny a funkční
- **Production Ready**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Všechny dokumentační stránky nyní obsahují sekce Introduction, Learning Goals a Learning Outcomes
- **Navigation System**: Přidány odkazy Previous/Next pro lekce napříč dokumentací pro řízené postupné učení
- **Study Guide**: Komplexní study-guide.md s cíli učení, praktickými cvičeními a hodnotícími materiály
- **Professional Presentation**: Odstraněna všechna emoji pro lepší přístupnost a profesionální vzhled
- **Enhanced Content Structure**: Vylepšená organizace a tok výukových materiálů

#### Changed
- **Documentation Format**: Standardizace veškeré dokumentace s konzistentní strukturou zaměřenou na učení
- **Navigation Flow**: Implementováno logické postupné vedení napříč výukovými materiály
- **Content Presentation**: Odstraněny dekorativní prvky ve prospěch čistého, profesionálního formátování
- **Link Structure**: Aktualizovány všechny interní odkazy pro podporu nového navigačního systému

#### Improved
- **Accessibility**: Odstraněné závislosti na emoji pro lepší kompatibilitu se čtečkami obrazovky
- **Professional Appearance**: Čisté, akademické zobrazení vhodné pro podnikové vzdělávání
- **Learning Experience**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Content Organization**: Lepší logický tok a propojení souvisejících témat

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installation and configuration guides for Windows, macOS, and Linux
- **Multiple Skill Levels**: Content designed for students through professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices integrated throughout
- **Cost Optimization**: Guidance for cost-effective deployments and resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common issues
- **Best Practices Integration**: Industry standards and recommendations
- **Version Compatibility**: Up-to-date with latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers with isolated AI services
- **Edge AI Deployment**: Integration with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery and edge caching patterns for AI applications

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
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

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
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Krok za krokem pokyny pro přechod
- **Compatibility Notes**: Podrobnosti o změnách, které narušují kompatibilitu
- **Tool Support**: Skripty nebo nástroje, které pomáhají s migrací
- **Community Support**: Vyhrazená fóra pro dotazy týkající se migrace

---

**Navigace**
- **Previous Lesson**: [Studijní průvodce](resources/study-guide.md)
- **Next Lesson**: Zpět na [Hlavní README](README.md)

**Zůstaňte informováni**: Sledujte toto úložiště pro oznámení o nových vydáních a důležitých aktualizacích výukových materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědni za jakákoli nedorozumění nebo chybné interpretace vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
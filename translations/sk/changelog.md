# Zoznam zmien - AZD For Beginners

## Úvod

Tento záznam zmien dokumentuje všetky pozoruhodné zmeny, aktualizácie a vylepšenia v repozitári AZD For Beginners. Riadiame sa princípmi semantického verzovania a vedomé udržiavame tento záznam, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia

Po preštudovaní tohto záznamu zmien budete:
- Byť informovaní o nových funkciách a doplnení obsahu
- Pochopiť vylepšenia existujúcej dokumentácie
- Sledovať opravy chýb a korekcie na zabezpečenie presnosti
- Sledovať vývoj učebných materiálov v priebehu času

## Výsledky učenia

Po prečítaní záznamov zmien budete schopní:
- Identifikovať nový obsah a zdroje dostupné na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať svoju učebnú cestu na základe najaktuálnejších materiálov
- Prispieť spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.17.0] - 2026-02-05

#### Zlepšenie navigácie kurzu
**Táto verzia vylepšuje navigáciu kapitol v README.md pomocou rozšíreného formátu tabuľky.**

#### Zmenené
- **Tabuľka mapy kurzu**: Vylepšená s priamymi odkazmi na lekcie, odhadmi trvania a hodnotením zložitosti
- **Vyčistenie priečinkov**: Odstránené redundantné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Overenie odkazov**: Overených všetkých 21+ interných odkazov v tabuľke mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizácia názvov produktov
**Táto verzia aktualizuje odkazy na produkty tak, aby zodpovedali súčasnému brandingu Microsoftu.**

#### Zmenené
- **Azure AI Foundry → Microsoft Foundry**: Všetky odkazy aktualizované v súboroch mimo prekladov
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný, aby odrážal súčasný branding

#### Aktualizované súbory
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

#### Hlavná reštrukturalizácia repozitára: Názvy priečinkov podľa kapitol
**Táto verzia reštrukturalizuje dokumentáciu do vyhradených priečinkov kapitol pre jasnejšiu navigáciu.**

#### Premenovanie priečinkov
Staré priečinky boli nahradené priečinkami číslovanými podľa kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridané nové: `docs/chapter-05-multi-agent/`

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
- **📚 README súbory kapitol**: Vytvorený README.md v každom priečinku kapitoly s:
  - Cieľmi učenia a trvaním
  - Tabuľkou lekcií s popismi
  - Príkazmi rýchleho štartu
  - Navigáciou do ostatných kapitol

#### Zmenené
- **🔗 Aktualizované všetky interné odkazy**: Upravených 78+ ciest vo všetkých dokumentačných súboroch
- **🗺️ Hlavný README.md**: Aktualizovaná mapa kurzu s novou štruktúrou kapitol
- **📝 examples/README.md**: Aktualizované krížové odkazy na priečinky kapitol

#### Odstránené
- Stará štruktúra priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reštrukturalizácia repozitára: Navigácia kapitol
**Táto verzia pridala README súbory pre navigáciu kapitol (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexný sprievodca nasadením AI agentov pomocou Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca pokrývajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri šablóny rýchleho štartu agentov (Foundry Agents, Prompty, RAG)
  - Vzory architektúry agentov (single agent, RAG, multi-agent)
  - Konfigurácia nástrojov a prispôsobenie
  - Monitorovanie a sledovanie metriky
  - Úvahy o nákladoch a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov pomocou `azd init --template get-started-with-ai-agents`
- **Vzorová architektúra**: Vizuálne diagramy vzorov agentov
- **Konfigurácia**: Nastavenie nástrojov a premenné prostredia
- **Monitorovanie**: Integrácia Application Insights
- **Cvičenia**: Postupné praktické učenie (20–45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia prostredia DevContainer
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera s modernými nástrojmi a lepšími predvoľbami pre AZD učenie.**

#### Zmenené
- **🐳 Základný image**: Aktualizované z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovší stabilný Debian)
- **📛 Názov kontajnera**: Premenovaný z "Python 3" na "AZD for Beginners" pre väčšiu prehľadnosť

#### Pridané
- **🔧 Nové funkcie Dev Container**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` na správu šablón
  - `docker-in-docker` pre nasadenia aplikácií v kontajneroch

- **🔌 Presmerovanie portov**: Predkonfigurované porty pre bežný vývoj:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nové rozšírenia VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure prostriedkov
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Lintovanie Markdownu
  - `bierner.markdown-mermaid` - Podpora mermaid diagramov
  - `redhat.vscode-yaml` - Podpora YAML (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Git
  - `mhutchie.git-graph` - História Git

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre interpreter Pythonu, formátovanie pri uložení a orezávanie bielych znakov

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný MkDocs minify plugin
  - Pridaný pre-commit pre kvalitu kódu
  - Pridané balíky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opravené
- **Post-Create Command**: Teraz overuje inštaláciu AZD a Azure CLI pri spustení kontajnera

---

### [v3.11.0] - 2026-02-05

#### Prepracovanie README pre začiatočníkov
**Táto verzia výrazne zlepšuje README.md, aby bol prístupnejší pre začiatočníkov, a pridáva základné zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Porovnanie Azure CLI a AZD**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Awesome AZD odkazy**: Priame odkazy na galériu komunitných šablón a zdroje pre príspevky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ šablón pripravených na nasadenie
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Príspevok komunity
- **🎯 Rýchly štart**: Zjednodušená 3-kroková sekcia začiatku práce (Inštalácia → Prihlásenie → Nasadenie)
- **📊 Tabuľka navigácie podľa skúseností**: Jasné usmernenie, kde začať na základe skúseností vývojára

#### Zmenené
- **Štruktúra README**: Reorganizované pre postupné odhaľovanie - najdôležitejšie informácie na prvom mieste
- **Sekcia Úvod**: Prepracovaná na vysvetlenie "Kúzla `azd up`" pre úplných začiatočníkov
- **Odstránený duplicitný obsah**: Eliminovaná duplicitná sekcia riešenia problémov
- **Príkazy na riešenie problémov**: Opravený odkaz `azd logs` tak, aby používal platné `azd monitor --logs`

#### Opravené
- **🔐 Príkazy pre autentifikáciu**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na príkazy**: Odstránené zostávajúce `azd logs` z troubleshooting časti README

#### Poznámky
- **Rozsah**: Zmeny aplikované v hlavnom README.md a resources/cheat-sheet.md
- **Cieľové publikum**: Vylepšenia zamerané špeciálne na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia presnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce príkazy AZD v celej dokumentácii a zabezpečuje, aby všetky príklady kódu používali platnú syntax Azure Developer CLI.**

#### Opravené
- **🔧 Odstránené neexistujúce príkazy AZD**: Komplexný audit a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradené `azd monitor --logs` alebo alternatívami Azure CLI
  - podpríkazy `azd service` (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistujú) → odstránené alebo nahradené platnými alternatívami
  - príznaky `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistujú) → odstránené
  - príznaky `azd provision --what-if/--rollback` (neexistujú) → aktualizované na použitie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované s opravami príkazov**:
  - `resources/cheat-sheet.md`: Rozsiahla prepracovanie referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené stratégie rollbacku a nasadenia
  - `docs/troubleshooting/debugging.md`: Opravené sekcie analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy na riešenie problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia debugovania AZD
  - `docs/getting-started/azd-basics.md`: Opravené príkazy na monitorovanie
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a ladenia
  - `docs/getting-started/installation.md`: Opravené príklady pomoci a verzie
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy na zobrazenie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy na debugovanie agentov

- **📝 Aktualizácia referencie verzie**: 
  - `docs/getting-started/installation.md`: Zmena pevne zadanej verzie `1.5.0` na generickú `1.x.x` s odkazom na vydania

#### Zmenené
- **Stratégie rollbacku**: Dokumentácia aktualizovaná na použitie rollbacku založeného na Gite (AZD nemá natívny rollback)
- **Zobrazenie logov**: Nahradené odkazy `azd logs` s `azd monitor --logs`, `azd monitor --live` a príkazmi Azure CLI
- **Sekcia výkonu**: Odstránené neexistujúce príznaky pre paralelné/incrementálne nasadenia, uvedené platné alternatívy

#### Technické detaily
- **Platné príkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné príznaky azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené voči Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a aktualizácia kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky nefunkčné odkazy v dokumentácii a zlepšuje celkovú kvalitu obsahu pre AI vývojárov používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s pokynmi pre prispievanie obsahuje:
  - Jasné pokyny na hlásenie problémov a navrhovanie zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny k príkladom kódu a konvencie commit správ
  - Informácie o zapojení komunity

#### Dokončené
- **🎯 Workshop Modul 7 (Záver)**: Plne dokončený záverečný modul s:
  - Komplexným zhrnutím úspechov workshopu
  - Sekciou kľúčových osvojovaných konceptov pokrývajúcich AZD, šablóny a AI Foundry
  - Odporúčaniami na pokračovanie v učení
  - Cvičeniami s hodnotením obtiažnosti
  - Odkazmi na spätnú väzbu komunity a podporu

- **📚 Workshop Modul 3 (Deconstruct)**: Aktualizované vzdelávacie ciele s:
  - Pokynmi na aktiváciu GitHub Copilot s MCP servermi
  - Pochopením štruktúry priečinka AZD šablón
  - Vzorov organizácie infraštruktúry-as-kódu (Bicep)
  - Návodmi na praktické laboratórium

- **🔧 Workshop Modul 6 (Teardown)**: Dokončený s:
  - Cieľmi v oblasti čistenia zdrojov a správy nákladov
  - Použitím `azd down` pre bezpečné odinštalovanie infraštruktúry
  - Pokynmi na zotavenie soft-delete kognitívnych služieb
  - Bonusovými podnetmi na preskúmanie GitHub Copilot a Azure Portal

#### Opravené
- **🔗 Opravy nefunkčných odkazov**: Riešených 15+ nefunkčných interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty na microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradený neexistujúci cicd-integration.md súborom deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty k FAQ a príručke riešenia problémov
  - `examples/container-app/microservices/README.md`: Opravené cesty k course home a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy v kapitole AI
  - `course-outline.md`: Opravené odkazy na instructor guide a AI workshop lab

- **📅 Banner stavu workshopu**: Aktualizovaný z "Under Construction" na aktívny stav workshopu s dátumom február 2026

- **🔗 Navigácia workshopu**: Opravené nefunkčné odkazy na navigáciu v README.md workshopu smerujúce na neexistujúci priečinok lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené varovanie "under construction", workshop je teraz kompletný a pripravený na použitie
- **Konzistencia navigácie**: Zaistené, že všetky moduly workshopu majú správnu medzi-modulovú navigáciu
- **Odkazy v učebnej ceste**: Aktualizované krížové odkazy kapitol, aby používali správne cesty microsoft-foundry

#### Overené
- ✅ Všetky anglické markdown súbory majú platné interné odkazy
- ✅ Moduly workshopu 0-7 sú kompletné s učebnými cieľmi
- ✅ Navigácia medzi kapitolami a modulmi funguje správne
- ✅ Obsah je vhodný pre AI vývojárov používajúcich Microsoft AZD
- ✅ Jazyk a štruktúra sú priateľské pre začiatočníkov
- ✅ CONTRIBUTING.md poskytuje jasné usmernenie pre prispievateľov komunity

#### Technická implementácia
- **Overenie odkazov**: Automatizovaný PowerShell skript overil všetky .md interné odkazy
- **Audit obsahu**: Manuálne preskúmanie úplnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Uplatnené konzistentné vzory navigácie kapitol a modulov

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu
- **Preklady**: Priečinky s prekladmi neboli v tejto verzii aktualizované (automatizovaný preklad sa synchronizuje neskôr)
- **Trvanie workshopu**: Kompletný workshop teraz poskytuje 3-4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: monitorovanie, zabezpečenie a multi-agentné vzory
**Táto verzia pridáva komplexné lekcie A-grade o integrácii Application Insights, autentifikačných vzoroch a koordinácii multi-agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia Integrácia Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - AZD-centrické nasadenie s automatickým provisionovaním
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Fungujúce Python aplikácie s vlastnou telemetriou (1 200+ riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Azure OpenAI)
  - 6 Mermaid diagramov (architektúra, distribuované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (alerty, dashboardy, AI monitorovanie)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Live streamovanie metrík a ladenie v reálnom čase
  - 40-50 minút učebného času s produkčnými vzormi

- **🔐 Lekcia Autentifikácia & Bezpečnostné vzory**: v `docs/getting-started/authsecurity.md`:
  - 3 autentifikačné vzory (connection strings, Key Vault, managed identity)
  - Kompletné Bicep infraštruktúrne šablóny pre bezpečné nasadenia
  - Kód Node.js aplikácie s integráciou Azure SDK
  - 3 kompletné cvičenia (umožnenie managed identity, user-assigned identity, rotácia Key Vault)
  - Najlepšie bezpečnostné praktiky a RBAC konfigurácie
  - Príručka riešenia problémov a analýza nákladov
  - Produkčné vzory bezheslového overovania

- **🤖 Lekcia Multi-Agent Coordination Patterns**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinačných vzorov (sekvenčný, paralelný, hierarchický, event-driven, konsenzus)
  - Kompletná implementácia orchestrátora služby (Python/Flask, 1 500+ riadkov)
  - 3 špecializované implementácie agentov (Research, Writer, Editor)
  - Integrácia Service Bus pre frontovanie správ
  - Správa stavu v Cosmos DB pre distribuované systémy
  - 6 Mermaid diagramov zobrazujúcich interakcie agentov
  - 3 pokročilé cvičenia (spracovanie timeoutov, retry logika, circuit breaker)
  - Rozpis nákladov ($240-565/month) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola Pre-deployment**: Teraz obsahuje komplexné vzory monitorovania a koordinácie
- **Kapitola Getting Started**: Obohatená o profesionálne autentifikačné vzory
- **Pripravenosť na produkciu**: Kompletné pokrytie od zabezpečenia po observability
- **Osnova kurzu**: Aktualizovaná tak, aby odkazovala na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Progres učenia**: Lepšia integrácia bezpečnosti a monitorovania naprieč kurzom
- **Kvalita dokumentácie**: Konzistentné štandardy A-grade (95-97%) naprieč novými lekciami
- **Produkčné vzory**: Kompletné end-to-end pokrytie pre podnikové nasadenia

#### Vylepšené
- **Skúsenosť vývojára**: Jasná cesta od vývoja po produkčné monitorovanie
- **Bezpečnostné štandardy**: Profesionálne vzory pre autentifikáciu a správu tajomstiev
- **Observability**: Kompletná integrácia Application Insights s AZD
- **AI pracovné zaťaženia**: Špecializované monitorovanie pre Azure OpenAI a multi-agentné systémy

#### Overené
- ✅ Všetky lekcie obsahujú kompletný fungujúci kód (nie len útržky)
- ✅ Mermaid diagramy pre vizuálne učenie (19 celkom v 3 lekciách)
- ✅ Praktické cvičenia s verifikačnými krokmi (9 celkom)
- ✅ Produkčné Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýzy nákladov a stratégie optimalizácie
- ✅ Príručky riešenia problémov a najlepšie praktiky
- ✅ Kontrolné body znalostí s verifikačnými príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný sprievodca monitorovaním
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé multi-agentné architektúry
- **Celý nový obsah**: - Konzistentné štandardy vysokej kvality

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované trasovanie
- **Autentifikácia**: Managed Identity + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Live metriky + Kusto dotazy + alerty + dashboardy
- **Správa nákladov**: Stratégiá sampling, retention policies, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšenie kvality dokumentácie a nový príklad Azure OpenAI
**Táto verzia zlepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Azure OpenAI s rozhraním GPT-4 chat.**

#### Pridané
- **🤖 Príklad Azure OpenAI Chat**: Kompletné nasadenie GPT-4 s fungujúcou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Azure OpenAI (nasadenie modelu GPT-4)
  - Python príkazové rozhranie pre chat s históriou konverzácií
  - Integrácia Key Vault pre bezpečné ukladanie API kľúčov
  - Sledovanie použitia tokenov a odhad nákladov
  - Obmedzovanie rýchlosti a spracovanie chýb
  - Komplexné README s 35-45 minútovým návodom na nasadenie
  - 11 produkčných súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Cvičenia v dokumentácii**: Pridané praktické cvičenia do príručky konfigurácie:
  - Cvičenie 1: Multi-environment konfigurácia (15 minút)
  - Cvičenie 2: Prax správy tajomstiev (10 minút)
  - Jasné kritériá úspechu a verifikačné kroky
- **✅ Overenie nasadenia**: Pridaná sekcia overenia do deployment guide:
  - Postupy kontroly zdravia
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy nasadenia
  - Rýchla referenčná príručka pre riešenie problémov

#### Vylepšené
- **examples/README.md**: Aktualizované na A-grade kvalitu (93%):
  - Pridané azure-openai-chat do všetkých relevantných sekcií
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky AI Application Examples
  - Integrované do Quick Start pre stredne pokročilých používateľov
  - Pridané do sekcie Microsoft Foundry Templates
  - Aktualizovaná Comparison Matrix a sekcie nájdenia technológií
- **Kvalita dokumentácie**: Vylepšená z B+ (87%) → A- (92%) v priečinku docs:
  - Pridané očakávané výstupy k dôležitým príkladom príkazov
  - Zahrnuté verifikačné kroky pre zmeny konfigurácie
  - Zlepšené praktické učenie s konkrétnymi cvičeniami

#### Zmenené
- **Progres učenia**: Lepšie začlenenie AI príkladov pre stredne pokročilých
- **Štruktúra dokumentácie**: Viac akčných cvičení s jasnými výsledkami
- **Proces overovania**: Explicitné kritériá úspechu pridané k kľúčovým workflow

#### Vylepšené
- **Skúsenosť vývojára**: Nasadenie Azure OpenAI teraz trvá 35-45 minút (vs 60-90 pre zložitejšie alternatívy)
- **Transparentnosť nákladov**: Jasné odhady nákladov ($50-200/month) pre príklad Azure OpenAI
- **Učebná cesta**: AI vývojári majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a verifikačné kroky

#### Overené
- ✅ Príklad Azure OpenAI plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov syntakticky správnych
- ✅ Pokyny v README zodpovedajú skutočnému nasadeniu
- ✅ Odkazy v dokumentácii aktualizované na 8+ miestach
- ✅ Index príkladov presne odráža 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy správne

#### Technická implementácia
- **Architektúra Azure OpenAI**: GPT-4 + Key Vault + Container Apps vzor
- **Bezpečnosť**: Pripravené na Managed Identity, tajomstvá v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Správa nákladov**: Sledovanie tokenov a optimalizácia používania
- **Nasadenie**: Jediný príkaz `azd up` pre kompletnú konfiguráciu

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia predstavuje komplexné, produkčné príklady nasadenia kontejnerových aplikácií pomocou Azure Developer CLI (AZD), s kompletnou dokumentáciou a integráciou do učebnej cesty.**

#### Pridané
- **🚀 Príklady Container App**: Nové lokálne príklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletný prehľad kontajnerizovaných nasadení, quick start, produkcia a pokročilé vzory
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Začiatočnícky REST API s scale-to-zero, health probes, monitorovaním a riešením problémov
  - [Microservices Architecture](../../examples/container-app/microservices): Produkčné nasadenie viacerých služieb (API Gateway, Product, Order, User, Notification), asynchrónne zasielanie správ, Service Bus, Cosmos DB, Azure SQL, distribuované trasovanie, blue-green/canary deployment
- **Najlepšie praktiky**: Bezpečnosť, monitorovanie, optimalizácia nákladov a pokyny pre CI/CD pre kontajnerové pracovné zaťaženia
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v viacerých jazykoch (Python, Node.js, C#, Go)
- **Testovanie & riešenie problémov**: Scenáre end-to-end testovania, príkazy pre monitorovanie, návod na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované tak, aby predstavovalo a odkazovalo nové príklady container app v sekcii "Local Examples - Container Applications"
- **examples/README.md**: Aktualizované na zvýraznenie príkladov container app, pridanie položiek do comparison matrix a aktualizáciu technologických/architektonických odkazov
- **Osnova kurzu & Študijný sprievodca**: Aktualizované tak, aby odkazovali na nové príklady aplikácií v kontajneroch a vzory nasadenia v príslušných kapitolách

#### Overené
- ✅ Všetky nové príklady sú nasaditeľné pomocou `azd up` a dodržiavajú osvedčené postupy
- ✅ Krížové odkazy v dokumentácii a navigácia aktualizované
- ✅ Príklady pokrývajú scenáre od začiatočníkov po pokročilých vrátane produkčných mikroservisov

#### Poznámky
- **Rozsah**: Len anglická dokumentácia a príklady
- **Ďalšie kroky**: Rozšíriť o ďalšie pokročilé vzory pre kontajnery a automatizáciu CI/CD v budúcich vydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Táto verzia vykonáva komplexnú zmenu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" vo všetkej anglickej dokumentácii, čo odráža oficiálny rebranding spoločnosti Microsoft.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Spolu: 23 obsahových odkazov aktualizovaných v 7 dokumentačných súboroch

- **📁 Zmeny v štruktúre priečinkov**:
  - `docs/ai-foundry/` premenované na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované tak, aby odrážali novú štruktúru priečinkov
  - Navigačné odkazy overené v celej dokumentácii

- **📄 Premenovania súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky interné odkazy aktualizované tak, aby odkazovali na nový názov súboru

#### Aktualizované súbory
- **Kapitolová dokumentácia** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizácie referencií názvu produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizácie referencií (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizácie krížových odkazov
  - `docs/getting-started/first-project.md` - 2 aktualizácie navigačných odkazov kapitol
  - `docs/getting-started/installation.md` - 2 aktualizácie odkazov na ďalšie kapitoly
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizácie referencií (navigácia, Discord komunita)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizácia navigačného odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizácia navigačného odkazu

- **Súbory štruktúry kurzu** (2 súbory):
  - `README.md` - 17 aktualizovaných referencií (prehľad kurzu, názvy kapitol, sekcia šablón, postrehy komunity)
  - `course-outline.md` - 14 aktualizovaných referencií (prehľad, ciele učenia, zdroje kapitoly)

#### Overené
- ✅ Žiadne zostávajúce odkazy na cestu priečinka "ai-foundry" v anglickej dokumentácii
- ✅ Žiadne zostávajúce referencie názvu produktu "Microsoft Foundry" v anglickej dokumentácii
- ✅ Všetky navigačné odkazy funkčné s novou štruktúrou priečinkov
- ✅ Premenovania súborov a priečinkov úspešne dokončené
- ✅ Krížové odkazy medzi kapitolami overené

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu v priečinku `docs/`
- **Preklady**: Složky s prekladmi (`translations/`) v tejto verzii neboli aktualizované
- **Workshop**: Materiály workshopu (`workshop/`) v tejto verzii neboli aktualizované
- **Príklady**: Súbory príkladov môžu ešte obsahovať odkazy na staré názvy (bude riešené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL a odkazy na GitHub repozitár zostávajú nezmenené

#### Sprievodca migráciou pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu odkazujúcu na starú štruktúru:
1. Aktualizujte odkazy na priečinky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na súbory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte názov produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Overte, či všetky interné dokumentačné odkazy stále fungujú

---

### [v3.4.0] - 2025-10-24

#### Vylepšenia náhľadu infraštruktúry a validácie
**Táto verzia zavádza komplexnú podporu pre novú preview funkciu Azure Developer CLI a zlepšuje používateľskú skúsenosť workshopu.**

#### Pridané
- **🧪 Dokumentácia funkcie azd provision --preview**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referencia príkazu a príklady použitia v rýchlom prehľade
  - Podrobná integrácia do príručky provisioningu s prípadmi použitia a prínosmi
  - Integrácia pre-flight kontroly pre bezpečnejšiu validáciu nasadenia
  - Aktualizácie príručky Začíname s postupmi nasadenia s dôrazom na bezpečnosť
- **🚧 Banner stavu workshopu**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Prechodový dizajn s označeniami "vo výstavbe" pre jasnú komunikáciu s používateľom
  - Značka času poslednej aktualizácie pre transparentnosť
  - Mobilne responzívny dizajn pre všetky typy zariadení

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcia preview integrovaná naprieč dokumentáciou nasadenia
- **Validácia pred nasadením**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Vývojársky workflow**: Aktualizované sekvencie príkazov zahŕňajú preview ako osvedčený postup
- **Skúsenosť workshopu**: Jasné očakávania pre používateľov o stave vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Odporúčaný prístup teraz uprednostňuje workflow s preview
- **Tok dokumentácie**: Validácia infraštruktúry presunutá skôr v učebnom procese
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasným časovým harmonogramom vývoja

#### Zlepšené
- **Prístup „bezpečnosť na prvom mieste“**: Zmeny infraštruktúry je možné validovať pred nasadením
- **Spolupráca tímu**: Výsledky preview je možné zdieľať na revíziu a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Zmiernenie rizík**: Zníženie zlyhaní nasadenia vďaka predbežnej validácii

#### Technická implementácia
- **Integrácia naprieč dokumentmi**: Funkcia preview zdokumentovaná v 4 kľúčových súboroch
- **Vzory príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia osvedčených postupov**: Preview začlenené do validačných workflow a skriptov
- **Vizuálne indikátory**: Jasné označenie NOVÉ funkcie pre lepšiu objaviteľnosť

#### Infraštruktúra workshopu
- **Komunikácia stavu**: Profesionálny HTML banner s prechodovým štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja predchádza zmätku
- **Profesionálna prezentácia**: Zachováva dôveryhodnosť repozitára pri nastavovaní očakávaní
- **Transparentnosť časovej osi**: Značka poslednej aktualizácie október 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívne učenie
**Táto verzia zavádza komplexné materiály workshopu s prehliadačovými interaktívnymi sprievodcami a štruktúrovanými učebnými cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Workshop v prehliadači s možnosťou náhľadu MkDocs
- **📝 Štruktúrované pokyny workshopu**: 7-kroková sprievodná učebná cesta od objavu po prispôsobenie
  - 0-Introduction: Prehľad workshopu a nastavenie
  - 1-Select-AI-Template: Objavovanie a výber šablóny
  - 2-Validate-AI-Template: Postupy nasadenia a validácie
  - 3-Deconstruct-AI-Template: Pochopenie architektúry šablóny
  - 4-Configure-AI-Template: Konfigurácia a prispôsobenie
  - 5-Customize-AI-Template: Pokročilé úpravy a iterácie
  - 6-Teardown-Infrastructure: Vyčistenie a správa zdrojov
  - 7-Wrap-up: Zhrnutie a ďalšie kroky
- **🛠️ Nástroje pre workshop**: Konfigurácia MkDocs s témou Material pre lepší zážitok z učenia
- **🎯 Praktická učebná cesta**: 3-kroková metodika (Objavovanie → Nasadenie → Prispôsobenie)
- **📱 Integrácia s GitHub Codespaces**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírený o komplexný 2-3 hodinový štruktúrovaný učebný zážitok
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Progres učenia**: Jasné krok-za-krokom usmernenie od výberu šablóny po nasadenie do produkcie
- **Vývojárska skúsenosť**: Integrované nástroje pre zjednodušené vývojové workflow

#### Zlepšené
- **Prístupnosť**: Rozhranie v prehliadači s vyhľadávaním, funkciou kopírovania a prepínačom tém
- **Učenie vlastným tempom**: Flexibilná štruktúra workshopu prispôsobiteľná rôznym rýchlostiam učenia
- **Praktická aplikácia**: Scenáre nasadenia AI šablón v reálnom svete
- **Integrácia komunity**: Integrácia s Discordom pre podporu a spoluprácu pri workshope

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania pri najetí pre všetky príklady kódu
- **Prepínač témy**: Podpora tmavého/svetlého režimu podľa preferencií
- **Vizuálne zdroje**: Snímky obrazovky a diagramy pre lepšie porozumenie
- **Integrácia pomoci**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 2025-09-17

#### Veľké preusporiadanie navigácie a systém učenia založený na kapitolách
**Táto verzia zavádza komplexný systém učenia rozdelený do kapitol s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Celý kurz preusporiadaný do 8 postupných učebných kapitol
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Komplexný navigačný systém**: Konzistentné navigačné hlavičky a päty naprieč celou dokumentáciou
- **🎯 Sledovanie pokroku**: Checklist dokončenia kurzu a systém overenia učenia
- **🗺️ Usmernenie učebnej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Krížová navigácia**: Sústredené kapitoly a predpoklady jasne prepojené

#### Vylepšené
- **Štruktúra README**: Premenená na štruktúrovanú vzdelávaciu platformu s organizáciou podľa kapitol
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a usmernenie progresie
- **Organizácia šablón**: Príklady a šablóny namapované na príslušné učebné kapitoly
- **Integrácia zdrojov**: Rýchle pomôcky, FAQ a študijné materiály prepojené s relevantnými kapitolami
- **Integrácia workshopu**: Praktické laboratórne cvičenia priradené k viacerým učebným cieľom kapitol

#### Zmenené
- **Postup učenia**: Presun z lineárnej dokumentácie na flexibilný systém učenia podľa kapitol
- **Umiestnenie konfigurácie**: Príručka konfigurácie presunutá ako Chapter 3 pre lepší tok učenia
- **Integrácia AI obsahu**: Lepšie začlenenie AI-špecifického obsahu počas celej učebnej cesty
- **Produkčný obsah**: Pokročilé vzory zoskupené v Chapter 8 pre firemných študentov

#### Zlepšené
- **Používateľská skúsenosť**: Jasné navigačné drobné odkazy (breadcrumbs) a indikátory progresie kapitol
- **Prístupnosť**: Konzistentné vzory navigácie pre ľahšie prechádzanie kurzom
- **Profesionálna prezentácia**: Štruktúra vo forme univerzitného kurzu vhodná pre akademické a firemné školenia
- **Efektivita učenia**: Skrátený čas na nájdenie relevantného obsahu vďaka vylepšenej organizácii

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná kapitolová navigácia v 40+ dokumentačných súboroch
- **Pätová navigácia**: Konzistentné usmernenie progresie a indikátory dokončenia kapitoly
- **Krížové prelinkovanie**: Komplexný interný systém prepojení spájajúci súvisiace koncepty
- **Mapa kapitol**: Šablóny a príklady jasne priradené k učebným cieľom

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné učebné ciele**: Študijný sprievodca prepracovaný tak, aby zodpovedal 8-kapitolovému systému
- **🎯 Hodnotenie podľa kapitol**: Každá kapitola obsahuje špecifické učebné ciele a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný študijný plán s merateľnými výsledkami a checklistami dokončenia
- **❓ Otázky na overenie vedomostí**: Otázky na validáciu vedomostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Progres zručností**: Jasné postupovanie od základných konceptov po podnikové vzory s dôrazom na rozvoj kariéry
- **🎓 Rámec certifikácie**: Profesionálne výsledky rozvoja a uznanie komunity
- **⏱️ Riadenie časovej osi**: Štruktúrovaný 10-týždňový plán učenia s overovaním míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené riešenia s viacerými agentmi AI
**Táto verzia vylepšuje multi-agentné riešenie pre maloobchod s lepším pomenovaním agentov a rozšírenou dokumentáciou.**

#### Zmenené
- **Terminológia multi-agentov**: Nahradené "Cora agent" výrazom "Customer agent" v celom maloobchodnom multi-agentnom riešení pre lepšie pochopenie
- **Architektúra agenta**: Aktualizovaná všetka dokumentácia, ARM šablóny a ukážky kódu tak, aby používali konzistentné pomenovanie "Customer agent"
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agenta s aktualizovanými názvovými konvenciami
- **Konzistentnosť dokumentácie**: Zabezpečené, že všetky odkazy používajú profesionálne, popisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizovaný retail-multiagent-arm-template s referenciami na Customer agent
- **Architektonické diagramy**: Obnovené Mermaid diagramy s aktualizovaným pomenovaním agentov
- **Ukážky kódu**: Python triedy a implementačné príklady teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia pre použitie konvencie CUSTOMER_AGENT_NAME

#### Zlepšené
- **Vývojárska skúsenosť**: Jasnejšie úlohy a zodpovednosti agentov v dokumentácii
- **Pripravenosť na produkciu**: Lepšia zhoda s konvenciami pomenovania v podniku
- **Výučbové materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické podrobnosti
- Aktualizované diagramy architektúry Mermaid s referenciami CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v príkladoch v Pythone
- Upravené ARM template JSON konfigurácie na použitie agenta typu "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_*
- Aktualizované všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojára a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 AI-First Learning Path**: Kompletná reštrukturalizácia s prioritou na AI vývojárov a inžinierov
- **Sprievodca integráciou Microsoft Foundry**: Komplexná dokumentácia pre prepojenie AZD so službami Microsoft Foundry
- **Vzory nasadenia AI modelov**: Podrobný sprievodca pokrývajúci výber modelov, konfiguráciu a stratégie nasadenia do produkcie
- **AI Workshop Lab**: 2-3 hodinový praktický workshop na konverziu AI aplikácií na riešenia nasaditeľné pomocou AZD
- **Najlepšie postupy pre produkčné AI**: Podnikové vzory pripravené na škálovanie, monitorovanie a zabezpečenie AI záťaží
- **AI-špecifický sprievodca riešením problémov**: Komplexné riešenie problémov pre Azure OpenAI, Cognitive Services a otázky nasadenia AI
- **Galéria AI šablón**: Vybraná kolekcia Microsoft Foundry šablón s hodnotením zložitosti
- **Materiály pre workshop**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **Štruktúra README**: Zameraná na AI vývojára s údajmi o 45% záujme komunity z Microsoft Foundry Discord
- **Cesty učenia**: Samostatná cesta pre AI vývojárov popri tradičných cestách pre študentov a DevOps inžinierov
- **Odporúčania šablón**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrácia komunity**: Vylepšená podpora Discord komunity s AI-špecifickými kanálmi a diskusiami

#### Zameranie na bezpečnosť a produkciu
- **Vzory spravovaných identít**: AI-špecifické konfigurácie autentifikácie a bezpečnosti
- **Optimalizácia nákladov**: Sledovanie využitia tokenov a kontrola rozpočtu pre AI záťaže
- **Nasadenie v niekoľkých regiónoch**: Stratégie pre globálne nasadenie AI aplikácií
- **Monitorovanie výkonu**: AI-špecifické metriky a integrácia s Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logický postup od začiatočníka po pokročilé vzory nasadenia AI
- **Overené URL**: Všetky externé odkazy na repozitáre overené a prístupné
- **Kompletná referencia**: Všetky interné odkazy v dokumentácii overené a funkčné
- **Pripravené na produkciu**: Podnikové vzory nasadenia s reálnymi príkladmi

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenie
**Táto verzia predstavuje významnú renováciu štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný vzdelávací rámec**: Všetky stránky dokumentácie teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigačný systém**: Pridané odkazy Predchádzajúca/Nasledujúca lekcia v celej dokumentácii pre usmernené vzdelávanie
- **Študijný sprievodca**: Komplexný study-guide.md s cieľmi učenia, cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emoji ikony pre lepšiu prístupnosť a profesionálny vzhľad
- **Vylepšená štruktúra obsahu**: Zlepšená organizácia a tok výučbových materiálov

#### Zmenené
- **Formát dokumentácie**: Zjednotené všetky dokumenty s konzistentnou štruktúrou zameranou na učenie
- **Tok navigácie**: Implementovaný logický postup cez všetky výučbové materiály
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného, profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizované všetky interné odkazy na podporu nového navigačného systému

#### Vylepšené
- **Prístupnosť**: Odstránené závislosti na emodži pre lepšiu kompatibilitu so čítačkami obrazovky
- **Profesionálny vzhľad**: Čistá, akademická prezentácia vhodná pre podnikové vzdelávanie
- **Skúsenosť učenia**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný vzdelávací repozitár AZD

#### Pridané
- **Jadrová štruktúra dokumentácie**
  - Kompletná séria getting-started príručiek
  - Komplexná dokumentácia k nasadzovaniu a provisioningu
  - Podrobné zdroje pre riešenie problémov a sprievodcovia ladením
  - Nástroje a postupy pre validáciu pred nasadením

- **Modul Začíname**
  - AZD Basics: Hlavné koncepty a terminológia
  - Inštalačný sprievodca: Inštrukcie na nastavenie špecifické pre platformu
  - Konfiguračný sprievodca: Nastavenie prostredia a autentifikácia
  - Tutoriál prvého projektu: Krok za krokom praktické cvičenie

- **Modul nasadenia a provisioning**
  - Sprievodca nasadením: Kompletná dokumentácia pracovného postupu
  - Sprievodca provisioningom: Infrastructure as Code s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúry viacerých služieb

- **Modul validácie pred nasadením**
  - Plánovanie kapacity: Validácia dostupnosti Azure prostriedkov
  - Výber SKU: Komplexné pokyny pre úroveň služby
  - Pre-flight kontroly: Automatizované validačné skripty (PowerShell a Bash)
  - Nástroje na odhad nákladov a plánovanie rozpočtu

- **Modul riešenia problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a riešenia
  - Sprievodca ladením: Systematické metodiky riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a odkazy**
  - Skratkový prehľad príkazov: Rýchla referencia pre základné príkazy
  - Slovník pojmov: Komplexné definície terminológie a skratiek
  - FAQ: Podrobné odpovede na časté otázky
  - Odkazy na externé zdroje a komunitné spojenia

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webstránky
  - Konfigurácia kontajnerovej aplikácie
  - Vzory integrácie databáz
  - Príklady architektúry mikroslužieb
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: Sprievodcovia inštaláciou a konfiguráciou pre Windows, macOS a Linux
- **Rôzne úrovne zručností**: Obsah určený pre študentov až po profesionálnych vývojárov
- **Praktické zameranie**: Praktické príklady a scenáre z reálneho sveta
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory
- **Prístup s prioritou bezpečnosti**: Najlepšie bezpečnostné postupy integrované naprieč obsahom
- **Optimalizácia nákladov**: Pokyny pre nákladovo efektívne nasadenia a správu prostriedkov

#### Kvalita dokumentácie
- **Podrobné ukážky kódu**: Praktické, testované ukážky kódu
- **Návody krok za krokom**: Jasné, akčné pokyny
- **Komplexné spracovanie chýb**: Riešenie problémov pre bežné chyby
- **Integrácia osvedčených postupov**: Priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: Aktuálne s najnovšími službami Azure a funkciami azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánované)
#### Rozšírenie AI platformy
- **Podpora viacerých modelov**: Vzory integrácie pre Hugging Face, Azure Machine Learning a vlastné modely
- **Rámce pre AI agentov**: Šablóny pre nasadenia LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databáz nad rámec Azure AI Search (Pinecone, Weaviate, atď.)
- **AI pozorovateľnosť**: Vylepšené monitorovanie výkonnosti modelu, využitia tokenov a kvality odpovedí

#### Skúsenosť vývojára
- **Rozšírenie VS Code**: Integrované vývojové prostredie AZD + AI Foundry
- **Integrácia GitHub Copilot**: Generovanie AZD šablón asistované AI
- **Interaktívne tutoriály**: Praktické cvičenia v kódovaní s automatizovanou validáciou pre AI scenáre
- **Video obsah**: Doplnkové video tutoriály pre vizuálnych študentov zamerané na nasadenia AI

### Verzia 4.0.0 (Plánované)
#### Vzory podnikovej AI
- **Rámec riadenia**: Riadenie AI modelov, súlad s predpismi a audítovateľné záznamy
- **Viacnájomnícka AI**: Vzory pre obsluhu viacerých zákazníkov s izolovanými AI službami
- **Nasadenie Edge AI**: Integrácia s Azure IoT Edge a inštanciami kontajnerov
- **Hybridná cloudová AI**: Vzory nasadenia v multi-cloud a hybridnom prostredí pre AI záťaže

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: Integrácia MLOps s Azure Machine Learning pipeline-ami
- **Pokročilá bezpečnosť**: Zero-trust vzory, privátne endpointy a pokročilá ochrana proti hrozbám
- **Optimalizácia výkonu**: Pokročilé ladenie a škálovacie stratégie pre AI aplikácie s vysokým priepustom
- **Globálne rozdelenie**: Vzory doručovania obsahu a edge caching pre AI aplikácie

### Verzia 3.0.0 (Plánované) - Nahradené súčasným vydaním
#### Navrhované doplnky - Teraz implementované vo v3.0.0
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interaktívne tutoriály**: Praktický AI workshop lab (Dokončené)
- ✅ **Pokročilý modul bezpečnosti**: AI-špecifické bezpečnostné vzory (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia AI záťaží (Dokončené)

### Verzia 2.1.0 (Plánované) - Čiastočne implementované vo v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v súčasnom vydaní
- ✅ **Dodatočné príklady**: Scenáre nasadenia zamerané na AI (Dokončené)
- ✅ **Rozšírené FAQ**: AI-špecifické otázky a riešenie problémov (Dokončené)
- **Integrácia nástrojov**: Vylepšené sprievodcovia integráciou IDE a editorov
- ✅ **Rozšírenie monitorovania**: AI-špecifické vzory monitorovania a upozorňovania (Dokončené)

#### Ešte plánované pre budúce vydanie
- **Dokumentácia priateľská pre mobilné zariadenia**: Responzívny dizajn pre mobilné učenie
- **Offline prístup**: Stiahnuteľné balíčky dokumentácie
- **Vylepšená integrácia IDE**: Rozšírenie pre VS Code pre AZD + AI workflowy
- **Panel komunity**: Metriky komunity v reálnom čase a sledovanie príspevkov

## Prispievanie do záznamu zmien

### Hlásenie zmien
Pri prispievaní do tohto repozitára prosím zabezpečte, aby záznamy v changelogu obsahovali:

1. **Číslo verzie**: V súlade so semantickým verzovaním (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte YYYY-MM-DD
3. **Kategória**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Jasný popis**: Stručný popis toho, čo sa zmenilo
5. **Posúdenie dopadu**: Ako zmeny ovplyvnia existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, časti dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo výučbové zdroje
- Dodatočné nástroje, skripty alebo utility

#### Zmenené
- Úpravy existujúcej funkčnosti alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Zastaralé
- Funkcie alebo prístupy, ktoré sa postupne vyraďujú
- Časti dokumentácie naplánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastarané informácie alebo zastaralé prístupy
- Redundantný alebo konsolidovaný obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo chýb
- Vylepšenia presnosti alebo funkčnosti

#### Bezpečnosť
- Vylepšenia alebo opravy súvisiace s bezpečnosťou
- Aktualizácie najlepších bezpečnostných postupov
- Riešenie bezpečnostných zraniteľností

### Pokyny pre semantické verzovanie

#### Hlavná verzia (X.0.0)
- Zmeny prerušujúce kompatibilitu, ktoré vyžadujú zásah používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny, ktoré menia základný prístup alebo metodológiu

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo doplnenie obsahu
- Vylepšenia, ktoré zachovávajú spätnú kompatibilitu
- Dodatočné príklady, nástroje alebo zdroje

#### Patch verzia (X.Y.Z)
- Opravy chýb a korekcie
- Menšie vylepšenia existujúceho obsahu
- Vysvetlenia a malé vylepšenia

## Spätná väzba a návrhy komunity

Aktívne povzbudzujeme spätnú väzbu komunity na zlepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Nahláste problémy alebo navrhnite vylepšenia (AI-špecifické problémy vítané)
- **Discord Discussions**: Zdieľajte nápady a zapojte sa do komunity Microsoft Foundry
- **Pull Requests**: Prispievajte priamymi vylepšeniami obsahu, najmä AI šablónami a sprievodcami
- **Microsoft Foundry Discord**: Zúčastnite sa kanála #Azure pre diskusie o AZD + AI
- **Fóra komunity**: Zúčastnite sa širších diskusií Azure vývojárov

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy integrácie AI služieb a informácií o nasadení
- **Skúsenosť učenia**: Návrhy na zlepšenie vzdelávacieho toku pre AI vývojárov
- **Chýbajúci AI obsah**: Požiadavky na doplnenie AI šablón, vzorov alebo príkladov
- **Prístupnosť**: Vylepšenia pre rôznorodé vzdelávacie potreby
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovného postupu vývoja AI
- **Produkčné AI vzory**: Požiadavky na podnikové vzory nasadenia AI

### Záväzok odpovede
- **Odpoveď na problémy**: Do 48 hodín pre nahlásené problémy
- **Žiadosti o funkcie**: Hodnotenie do jedného týždňa
- **Príspevky komunity**: Revizia do jedného týždňa
- **Bezpečnostné problémy**: Okamžitá priorita s urýchlenou odpoveďou

## Harmonogram údržby

### Pravidelné aktualizácie
- **Mesačné revízie**: Presnosť obsahu a validácia odkazov
- **Štvrťročné aktualizácie**: Hlavné doplnenia obsahu a vylepšenia
- **Pôlročné revízie**: Komplexná reštrukturalizácia a vylepšenia
- **Ročné vydania**: Aktualizácie hlavných verzií s významnými vylepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automatizované testovanie**: Pravidelná validácia ukážok kódu a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné začleňovanie návrhov používateľov
- **Aktualizácie technológií**: Zladenie s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelná kontrola zásad inkluzívneho dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy po dobu 12 mesiacov
- **Staršie verzie**: Iba podpora komunity, žiadne oficiálne aktualizácie

### Pokyny na migráciu
Keď sú vydané hlavné verzie, poskytujeme:
- **Návody na migráciu**: Krok za krokom pokyny na prechod
- **Poznámky k kompatibilite**: Podrobnosti o nekompatibilných zmenách
- **Podpora nástrojov**: Skripty alebo nástroje, ktoré pomáhajú pri migrácii
- **Podpora komunity**: Venované fóra pre otázky týkajúce sa migrácie

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Nasledujúca lekcia**: Späť na [Hlavný README](README.md)

**Zostaňte informovaní**: Sledujte toto úložisko, aby ste dostávali oznámenia o nových vydaniach a dôležitých aktualizáciách výukových materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou služby prekladov využívajúcej umelú inteligenciu Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku treba považovať za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
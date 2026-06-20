# Zoznam zmien - AZD Pre začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky pozoruhodné zmeny, aktualizácie a vylepšenia v repozitári AZD Pre začiatočníkov. Dodržiavame princípy semantickej verzie a tento záznam udržiavame, aby sme používateľom pomohli porozumieť, čo sa zmenilo medzi verziami.

## Ciele učenia

Preštudovaním tohto zoznamu zmien budete:
- Informovaní o nových funkciách a doplnenom obsahu
- Rozumieť vylepšeniam existujúcej dokumentácie
- Sledovať opravy chýb a korekcie na zabezpečenie presnosti
- Sledovať vývoj učebných materiálov v priebehu času

## Výstupy učenia

Po preštudovaní záznamov v zozname zmien budete schopní:
- Identifikovať nový obsah a zdroje dostupné na učenie
- Pochopiť, ktoré časti boli aktualizované alebo vylepšené
- Naplánovať si učebnú cestu na základe najaktuálnejších materiálov
- Prispievať spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.22.0] - 2026-06-16

#### Začiatočnícka doplňujúca úloha #2: Autorské šablóny, Dev kontajnery, Pulumi, Azure DevOps, Service Principals a ďalšie
**Táto verzia uzatvára zostávajúce medzery pre mierne pokročilých zistené analýzou azd-coverage: ako vytvoriť a publikovať vlastnú šablónu, reprodukovateľné prostredia dev-container/Codespaces, poskytovateľ infraštruktúry Pulumi, prehliadka Azure DevOps CI/CD, autentifikácia pomocou service principal, odporúčania pri výbere hostiteľa (AKS/Spring Apps), vysvetlenia `azd restore`/`azd package`, spracovanie chýb háčikov a praktiky tímového/zdieľaného prostredia.**

#### Pridané
- **🧱 Nová lekcia Kapitola 4** `docs/chapter-04-infrastructure/custom-templates.md` — vytváranie vlastnej azd šablóny: povinná štruktúra (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parameterizácia infraštruktúry pomocou tokenu zdroja `uniqueString()` a značky `azd-env-name`, testovanie lokálne pomocou `azd init --template <local-path>`, publikovanie na GitHub a zaslanie do galérie Awesome AZD
- **📦 Nová lekcia Kapitola 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovateľné azd prostredia s Dev Containers a GitHub Codespaces: minimálny `.devcontainer/devcontainer.json` používajúci oficiálnu funkciu `ghcr.io/azure/azure-dev/azd`, jazykovo-špecifické funkcie, `docker-in-docker` pre hostiteľov kontajnerov a `azd auth login --use-device-code` pre vzdialené prihlásenie
- **🧩 Pulumi s azd** sekcia v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, rozloženie zložiek Pulumi, stacky mapované na azd prostredia, požadované výstupy/označovanie a identický pracovný tok `azd up` / `azd down`
- **🎯 Odporúčania pri výbere hostiteľa** v `docs/chapter-04-infrastructure/provisioning.md` — priateľské porovnanie pre začiatočníkov: `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp`, s odporúčaním, kedy zvoliť AKS alebo Azure Spring Apps
- **🛠️ Prehliadka Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection s workload identity federation (OIDC), generovaný `azure-dev.yml` a nastavenie variable-group
- **🔑 Service Principals (Vzor 4)** pridané do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktívne `azd auth login` s klientským tajomstvom vs. federované/OIDC poverenia, kedy používať a bezpečné ukladanie poverení
- **🪝 Spracovanie chýb háčikov** podsekcia v `docs/chapter-04-infrastructure/deployment-guide.md` — návratové kódy a `set -e`, `continueOnError`, testovanie háčikov izolovane pomocou `azd hooks run`, OS-špecifické shelly a `--debug`
- **👥 Tímové / zdieľané prostredia** sekcia v `docs/chapter-03-configuration/configuration.md` — čo patrí do `.azure/`, čo ignorovať v gite, prostredia pre jednotlivých vývojárov, `azd env list`/`select` a poskytovanie hodnôt prostredia v CI/CD
- **🧰 Vysvetlenia `azd restore` a rozšíreného `azd package`** v `resources/cheat-sheet.md` — obnovovanie závislostí a vytvorenie deployovateľného artefaktu bez nasadenia

#### Zmenené
- **🧭 Tabuľka lekcií Kapitoly 4** aktualizovaná o novú lekciu "Authoring Your Own Template" (Lekcia 3)
- **🧭 Tabuľka lekcií Kapitoly 1** aktualizovaná o novú lekciu "Dev Containers & Codespaces" (Lekcia 5); navigačné pätičky prepojené medzi `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začiatočnícka doplňujúca úloha: Praktická lekcia s viacerými agentmi, "Bring Your Own App", Terraform a prehliadka CI/CD
**Táto verzia uzatvára najväčšie medzery pre kompletný sprievodca pre začiatočníkov pridaním dvoch nových praktických lekcií (nasaditeľná prehliadka s viacerými agentmi a pridanie azd do existujúcej aplikácie), úvodu ku háčikom pre začiatočníkov, sekcie Terraform s azd, krok-za-krokom prehliadky GitHub Actions pipeline, vysvetlenia pre nové preview rozšírenia a explicitného kontrolného zoznamu overenia nasadenia.**

#### Pridané
- **🤝 Nová lekcia Kapitola 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plne praktická, nasaditeľná prehliadka dvoch agentov (orchestration + špecialisti) používajúca reálnu šablónu (`contoso-creative-writer`), pokrýva kedy použiť multi-agent, pracovný tok `azd up`, pochopenie nasadených zdrojov, cross-agent tracing, prispôsobenie a vyčistenie
- **📦 Nová lekcia Kapitola 1** `docs/chapter-01-foundation/bring-your-own-app.md` — ako pridať azd do existujúceho projektu pomocou `azd init` ("use code in the current directory"), pochopenie `azure.yaml` a `infra/`, `azd infra generate`, detekcia hostiteľa a nasadenie pomocou `azd up`
- **🌐 Terraform s azd** sekcia pridaná do `docs/chapter-04-infrastructure/provisioning.md` — konfigurácia `infra.provider: terraform`, rozloženie `.tf` zložky, požadované výstupy `AZURE_*` a označovanie `azd-env-name`, a identický pracovný tok `azd up` / `azd down` (uzatvára medzeru, kde sa uvádzala podpora Terraform, ale ukazovalo sa len Bicep)
- **⚙️ Krok-za-krokom prehliadka GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitára po automatizované nasadenia: `azd pipeline config`, OIDC federované poverenia (bez uložených tajomstiev), generovaný `azure-dev.yml` a porovnanie tajomstiev vs. premenných
- **🪝 Úvod "Nový v hooks?" pre začiatočníkov** v `docs/chapter-04-infrastructure/deployment-guide.md` — čo je hook, tabuľka štádií hookov, minimálny prvý hook a manuálne spúšťanie hookov pomocou `azd hooks run`
- **✅ Kontrolný zoznam "Overte svoje nasadenie"** pridaný do Kroku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola health-endpointu a explicitné kritériá úspechu
- **🧩 Vysvetlenie pre nové preview rozšírenia** `azure.ai.skills` a `azure.ai.connections` (čo sú a kedy ich použiť) v `docs/chapter-08-production/production-ai-practices.md`

#### Zmenené
- **🧭 Tabuľka lekcií Kapitoly 5** opravená: `multi-agent-basics.md` je teraz Lekcia 1 (jediná plne praktická lekcia), s úprimným označením, že Lekcia 2 je v Kapitole 6 a Retail scenár je architektonické schéma, nie jedným príkazom nasaditeľná šablóna
- **🧭 Tabuľka lekcií Kapitoly 1** teraz zahrňuje novú lekciu "Bring Your Own App" (Lekcia 4)
- **🔗 Navigačné pätičky** aktualizované: `first-project.md` teraz odkazuje ďalej na `bring-your-own-app.md`

#### Opravené
- **🧱 Uzavretá medzera "uvoľnené ale chýbajúce" Terraform** — kurz predtým spomínal podporu Terraform bez jej predvedenia
- **🔀 Opravené zavádzajúce krížové odkazy Kapitoly 5** ktoré naznačovali existenciu plnej multi-agent implementácie, keď išlo len o architektonickú schému

#### Aktualizované súbory
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nové)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nové)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Aktualizácia AZD 1.25.6, Príkazy pre celý životný cyklus agenta & rebranding Aspire
**Táto verzia znovu validuje kurz s `azd` `1.25.6` (jún 2026) a rozšírenie `azure.ai.agents` `0.1.40-preview`, rozširuje AI odporúčania od "scaffold agenta" po kompletný životný cyklus agenta (test → vyhodnotiť → optimalizovať → skontrolovať → zmazať), zverejňuje nové preview rozšírenia `azure.ai.skills` a `azure.ai.connections` a poznamenáva rebranding produktu ".NET Aspire" → "Aspire".**

#### Pridané
- **🔁 Pokrytie celého životného cyklu agenta** pre začiatočníkov a AI inžinierov naprieč dokumentáciou:
  - `docs/chapter-01-foundation/azd-basics.md` — tabuľka životného cyklu (scaffold → test → measure → improve → inspect → clean up) pridaná do časti Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — nová sekcia "Managing the Agent Lifecycle" pokrývajúca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — rozšírené príkazy AI Agent s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nové preview rozšírenia** zdokumentované: `azure.ai.skills` (znovupoužiteľné agent skills) a `azure.ai.connections` (Foundry connections) pridané do tabuľky rozšírení a cheat sheetu
- **⏱️ Odporúčania pre časovanie odpovede** — príklady `azd ai agent invoke` teraz uvádzajú, že vypisuje celkovú latenciu a time-to-first-byte
- **📌 Bannner verzie** v koreňovom README smerujúci študentov na `azd version` a `azd upgrade`

#### Zmenené
- **✅ Základ validácie aktualizovaný** z `azd 1.23.12` (marec 2026) na `azd 1.25.6` (jún 2026) vo všetkých README kapitolách a dokumentoch workshopu
- **🤖 Poznámka o rozšírení v Kapitole 2** aktualizovaná z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Ukážka validácie workshopu** (`azd version` výstup) aktualizovaná na `1.25.6`
- **🧭 README "Čo je nové v azd dnes"** obnovené na zvýraznenie end-to-end životného cyklu agenta, nových AI rozšírení a nedávnych vylepšení použiteľnosti (`azd init` idempotencia, `azd auth login` čistenie neplatných tokenov, `azd tool` prompt pri prvom spustení)
- **📖 Kapitola 2 agents.md (Možnosť 4)** teraz smeruje študentov na post-deploy príkazy životného cyklu namiesto zastavenia pri `azd up`

#### Opravené
- **🏷️ Názov produktu** — pridaná poznámka o rebrandingu Aspire (".NET Aspire" je teraz jednoducho "Aspire"); podpora Aspire v azd zostáva nezmenená
- **🔎 Overenie živého vydania** potvrdené voči Azure Developer CLI release feedu: stabilný CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Aktualizované súbory
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
#### Začiatočnícke upresnenie onboardingu, overenie nastavenia a konečné vyčistenie príkazov AZD
**Táto verzia nadväzuje na validačnú kontrolu AZD 1.23 a prináša dokumentačnú revíziu zameranú na začiatočníkov: upresňuje odporúčania k autentifikácii orientovanej na AZD, pridáva lokálne skripty na overenie nastavenia, overuje kľúčové príkazy voči živej AZD CLI a odstraňuje posledné zastarané anglické zdroje referencií príkazov mimo changelogu.**

#### Pridané
- **🧪 Skripty na overenie nastavenia pre začiatočníkov** s `validate-setup.ps1` a `validate-setup.sh`, aby sa si študenti mohli overiť potrebné nástroje pred začiatkom Kapitoly 1
- **✅ Počiatočné kroky overenia nastavenia** v root README a README Kapitoly 1, aby sa chýbajúce predpoklady zachytili ešte pred `azd up`

#### Zmenené
- **🔐 Pokyny k autentifikácii pre začiatočníkov** teraz konzistentne považujú `azd auth login` za primárnu cestu pre AZD pracovné postupy, pričom `az login` je označený ako voliteľný, pokiaľ sa priamo nepoužívajú príkazy Azure CLI
- **📚 Onboardingový tok Kapitoly 1** teraz smeruje študentov na overenie lokálneho nastavenia pred inštaláciou, autentifikáciou a prvými krokmi nasadenia
- **🛠️ Správy validátora** teraz jasne oddeľujú blokujúce požiadavky od voliteľných varovaní Azure CLI pre AZD-only začiatočnícku cestu
- **📖 Konfigurácia, riešenie problémov a príklady dokumentácie** teraz rozlišujú medzi povinnou AZD autentifikáciou a voliteľným prihlásením do Azure CLI tam, kde boli predtým oba uvedené bez kontextu

#### Opravené
- **📋 Zostávajúce anglické referencie príkazov** aktualizované na aktuálne AZD formy, vrátane `azd config show` v cheat sheete a `azd monitor --overview` tam, kde bolo zámerom odkázať na prehľad v Azure Portáli
- **🧭 Tvrdenia pre začiatočníkov v Kapitole 1** zmiernené, aby sa zabránilo nadmerným sľubom o garantovanom bezchybnom správaní alebo rollbacke naprieč všetkými šablónami a Azure zdrojmi
- **🔎 Live CLI validácia** potvrdila aktuálnu podporu pre `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

#### Overenie AZD 1.23.12, rozšírenie workshopového prostredia a aktualizácia AI modelov
**Táto verzia vykonáva validačnú kontrolu dokumentácie voči `azd` `1.23.12`, aktualizuje zastarané príklady príkazov AZD, obnovuje odporúčania pre AI modely na aktuálne predvolené hodnoty a rozširuje inštrukcie workshopu nad rámec GitHub Codespaces tak, aby podporovali aj dev containery a lokálne klony.**

#### Pridané
- **✅ Poznámky o validácii v hlavných kapitolách a dokumentoch workshopu**, aby bolo pre študentov explicitné, proti ktorej AZD verzii boli testy vykonané, ak používajú novšiu alebo staršiu verziu CLI
- **⏱️ Pokyny k časovému limitu nasadenia** pre dlhšie AI aplikácie s `azd deploy --timeout 1800`
- **🔎 Kroky na inšpekciu rozšírení** s `azd extension show azure.ai.agents` v dokumentácii o AI pracovných postupoch
- **🌐 Širšie pokrytie workshopového prostredia** zahŕňajúce GitHub Codespaces, dev containery a lokálne klony s MkDocs

#### Zmenené
- **📚 Úvodné README kapitol** teraz konzistentne uvádzajú validáciu voči `azd 1.23.12` v častiach foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting a production
- **🛠️ Referencie príkazov AZD** aktualizované na aktuálne formy v dokumentoch:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` alebo `azd env get-value(s)` v závislosti od kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kde je zámerom zobraziť prehľad Application Insights
- **🧪 Príklady náhľadu provisioningu** zjednodušené na aktuálne podporované použitie ako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Workflow workshopu** aktualizovaný tak, aby študenti mohli dokončiť laby v Codespaces, v dev containery alebo v lokálnom clone namiesto predpokladu Codespaces-only vykonania
- **🔐 Pokyny k autentifikácii** teraz uprednostňujú `azd auth login` pre AZD pracovné postupy, pričom `az login` je uvedené ako voliteľné, ak sú priamo používané Azure CLI príkazy

#### Opravené
- **🪟 Windows inštalačné príkazy** znormalizované na aktuálne veľké/malé písmená balíčkov v `winget` v inštalačnom návode
- **🐧 Linux inštalačné pokyny** opravené tak, aby sa zabránilo nepodporovaným distribučne špecifickým inštrukciám pre balíčkovacie systémy `azd` a namiesto toho smerovali na release assety tam, kde je to vhodné
- **📦 Príklady AI modelov** obnovné z starších predvolieb ako `gpt-35-turbo` a `text-embedding-ada-002` na aktuálne príklady ako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Snippety nasadenia a diagnostiky** opravené tak, aby používali aktuálne príkazy pre prostredie a stav v logoch, skriptoch a krokoch riešenia problémov
- **⚙️ Pokyny pre GitHub Actions** aktualizované z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny pre MCP/Copilot súhlas** aktualizované z `azd mcp consent` na `azd copilot consent list`

#### Vylepšené
- **🧠 Kapitola o AI** teraz lepšie vysvetľuje preview-citlivé správanie `azd ai`, prihlásenie špecifické pre tenant, aktuálne používanie rozšírení a aktualizované odporúčania pre nasadenie modelov
- **🧪 Inštrukcie workshopu** teraz používajú realistickejšie príklady verzií a jasnejší jazyk pre nastavenie prostredia pre praktické laby
- **📈 Dokumentácia pre produkciu a riešenie problémov** teraz lepšie korešponduje s aktuálnymi príkladmi monitorovania, fallback modelov a nákladových tried

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

#### Príkazy AZD AI CLI, validačné obsahy a rozšírenie šablón
**Táto verzia pridáva pokrytie príkazov `azd ai`, `azd extension` a `azd mcp` vo všetkých AI-súvisiacich kapitolách, opravuje rozbité odkazy a zastaraný kód v agents.md, aktualizuje cheat sheet a prepracováva sekciu Example Templates s overenými popismi a novými Azure AI AZD šablónami.**

#### Pridané
- **🤖 Pokrytie AZD AI CLI** cez 7 súborov (predtým len v Kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — nová sekcia "Extensions and AI Commands" predstavuje `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnosť 4: `azd ai agent init` s porovnávacou tabuľkou (prístup cez template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — podsekcie "AZD Extensions for Foundry" a "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start teraz zobrazuje oba cesty nasadenia: template aj manifest-based
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — sekcia Deploy teraz zahŕňa možnosť `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — podsekcia "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — nová sekcia "AI & Extensions Commands" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI príkladové šablóny** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat používajúci Langchain4J s možnosťami nasadenia na ACA/AKS
  - **contoso-creative-writer** — multi-agent kreatívny writer používa Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — serverless RAG využívajúci Azure Functions + LangChain.js + Cosmos DB s lokálnou podporou vývoja cez Ollama
  - **chat-with-your-data-solution-accelerator** — enterprise RAG akcelerátor s administračným portálom, integráciou do Teams a možnosťami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — multi-agent MCP orchestrácia referenčnej aplikácie so servermi v .NET, Python, Java a TypeScript
  - **azd-ai-starter** — minimálna Bicep štartovacia šablóna pre Azure AI infraštruktúru
  - **🔗 Odkaz na Awesome AZD AI Gallery** — referencia na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablón)

#### Opravené
- **🔗 Navigácia v agents.md**: Odkazy Predchádzajúce/Nasledujúce teraz zodpovedajú poradí lekcií v README Kapitoly 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Rozbité odkazy v agents.md**: `production-ai-practices.md` opravované na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 Zastaraný kód v agents.md**: Nahradené `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neplatné API v agents.md**: Presunuté `max_tokens` z `create_agent()` do `create_run()` ako `max_completion_tokens`
- **🔢 Počítanie tokenov v agents.md**: Nahradený hrubý odhad `len//4` funkciou `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opravené služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (predvolený hosť bol zmenený v októbri 2024)
- **contoso-chat**: Aktualizovaný popis tak, aby odkazoval na Azure AI Foundry + Prompty, v súlade so skutočným názvom a tech stackom repo

#### Odstránené
- **ai-document-processing**: Odstránená nefunkčná referencia šablóny (repo nie je verejne dostupné ako AZD šablóna)

#### Vylepšené
- **📝 Cvičenia v agents.md**: Cvičenie 1 teraz ukazuje očakávaný výstup a krok `azd monitor`; Cvičenie 2 obsahuje kompletnú registráciu `FunctionTool`; Cvičenie 3 nahrádza vágnu pomoc konkrétnymi príkazmi `prepdocs.py`
- **📚 Zdroje v agents.md**: Aktualizované odkazy na dokumentáciu pre Azure AI Agent Service a quickstart
- **📋 Tabuľka Next Steps v agents.md**: Pridaný odkaz na AI Workshop Lab pre kompletné pokrytie kapitoly

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
**Táto verzia vylepšuje navigáciu kapitol v README.md pomocou rozšíreného formátu tabuľky.**

#### Zmenené
- **Course Map Table**: Vylepšená o priame odkazy na lekcie, odhady trvania a hodnotenia zložitosti
- **Folder Cleanup**: Odstránené nadbytočné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Overené všetky 21+ interné odkazy v tabuľke mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizácie názvov produktov
**Táto verzia aktualizuje odkazy na produkty podľa aktuálneho značenia spoločnosti Microsoft.**

#### Zmenené
- **Microsoft Foundry → Microsoft Foundry**: Všetky odkazy aktualizované vo všetkých súboroch okrem prekladových súborov
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný tak, aby odrážal aktuálne značenie

#### Aktualizované súbory
- `README.md` - Hlavná vstupná stránka kurzu
- `changelog.md` - História verzií
- `course-outline.md` - Štruktúra kurzu
- `docs/chapter-02-ai-development/agents.md` - Sprievodca AI agentmi
- `examples/README.md` - Dokumentácia príkladov
- `workshop/README.md` - Vstupná stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všetky súbory inštrukcií workshopu

---

### [v3.15.0] - 2026-02-05

#### Veľké preusporiadanie repozitára: Názvy priečinkov podľa kapitol
**Táto verzia reštrukturalizuje dokumentáciu do vyhradených priečinkov kapitol pre prehľadnejšiu navigáciu.**

#### Premenované priečinky
Staré priečinky boli nahradené priečinkami očíslovanými podľa kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridané nové: `docs/chapter-05-multi-agent/`

#### Migrácia súborov
| Súbor | Od | Do |
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
- **📚 README súbory pre kapitoly**: Vytvorené súbory README.md v každom priečinku kapitoly so:
  - Cieľmi učenia a odhadovaným trvaním
  - Tabuľkou lekcií s popismi
  - Rýchlymi príkazmi na štart
  - Navigáciou do ostatných kapitol

#### Zmenené
- **🔗 Aktualizované všetky interné odkazy**: Aktualizovaných 78+ ciest naprieč všetkými dokumentačnými súbormi
- **🗺️ Hlavné README.md**: Aktualizovaná mapa kurzu s novou štruktúrou kapitol
- **📝 examples/README.md**: Aktualizované krížové odkazy na priečinky kapitol

#### Odstránené
- Stará štruktúra priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reštrukturalizácia repozitára: Navigácia podľa kapitol
**Táto verzia pridala README súbory s navigáciou kapitol (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexný sprievodca nasadením AI agentov s Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca pokrývajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri šablóny rýchleho štartu agentov (Foundry Agents, Prompty, RAG)
  - Vzory architektúry agentov (jediný agent, RAG, multi-agent)
  - Konfigurácia nástrojov a prispôsobenie
  - Monitorovanie a sledovanie metrík
  - Náklady a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov s `azd init --template get-started-with-ai-agents`
- **Architektonické vzory**: Vizualizácie vzorov agentov
- **Konfigurácia**: Nastavenie nástrojov a premenné prostredia
- **Monitorovanie**: Integrácia s Application Insights
- **Cvičenia**: Progresívne praktické lekcie (20–45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia DevContainer prostredia
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera s modernými nástrojmi a lepšími predvolenými nastaveniami pre AZD výučbu.**

#### Zmenené
- **🐳 Základný obraz**: Aktualizovaný z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovšia stabilná verzia Debianu)
- **📛 Názov kontajnera**: Premenovaný z "Python 3" na "AZD for Beginners" pre lepšiu zrozumiteľnosť

#### Pridané
- **🔧 Nové funkcie Dev Containeru**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` pre správu šablón
  - `docker-in-docker` pre nasadenia kontajnerových aplikácií

- **🔌 Presmerovanie portov**: Predkonfigurované porty pre bežný vývoj:
  - 8000 (MkDocs náhľad)
  - 3000 (Web aplikácie)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšírenia pre VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure prostriedkov
  - `yzhang.markdown-all-in-one` - Úprava Markdown
  - `DavidAnson.vscode-markdownlint` - Lintovanie Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramov
  - `redhat.vscode-yaml` - Podpora YAML (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Gitu
  - `mhutchie.git-graph` - História Gitu

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre Python interpreter, formátovanie pri uložení a orezávanie medzier

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný plugin MkDocs minify
  - Pridaný pre-commit pre kvalitu kódu
  - Pridané balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opravené
- **Príkaz po vytvorení**: Teraz overuje inštaláciu AZD a Azure CLI pri štarte kontajnera

---

### [v3.11.0] - 2026-02-05

#### Prepracovanie README pre začiatočníkov
**Táto verzia výrazne zlepšuje README.md, aby bol prístupnejší pre začiatočníkov a pridáva základné zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Porovnanie Azure CLI vs AZD**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Skvelé AZD odkazy**: Priame odkazy na galériu komunitných šablón a zdroje pre prispievanie:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ pripravených šablón na nasadenie
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Príspevok komunity
- **🎯 Rýchly štart**: Zjednodušený 3-krokový úvod (Inštalácia → Prihlásenie → Nasadenie)
- **📊 Navigačná tabuľka podľa skúseností**: Jasné usmernenie, kde začať podľa skúseností vývojára

#### Zmenené
- **Štruktúra README**: Preusporiadané pre postupné odhaľovanie - kľúčové informácie na prvom mieste
- **Sekcia Úvod**: Prepísaná tak, aby vysvetľovala "Kúzlo `azd up`" pre úplných začiatočníkov
- **Odstránený duplicitný obsah**: Zrušená duplicitná sekcia riešenia problémov
- **Príkazy na riešenie problémov**: Opravený odkaz `azd logs` na platný `azd monitor --logs`

#### Opravené
- **🔐 Príkazy na autentifikáciu**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na príkazy**: Odstránené zostávajúce `azd logs` zo sekcie riešenia problémov v README

#### Poznámky
- **Rozsah**: Zmeny použité v hlavnom README.md a resources/cheat-sheet.md
- **Cieľová skupina**: Vylepšenia zamerané predovšetkým na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia presnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce príkazy AZD v dokumentácii, čím zabezpečuje, že všetky príklady kódu používajú platnú syntax Azure Developer CLI.**

#### Opravené
- **🔧 Odstránené neexistujúce príkazy AZD**: Komplexný audit a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradené `azd monitor --logs` alebo alternatívami Azure CLI
  - Podpríkazy `azd service` (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistuje) → odstránené alebo nahradené platnými alternatívami
  - Flagy `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistujú) → odstránené
  - Flagy `azd provision --what-if/--rollback` (neexistujú) → aktualizované na použitie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované s opravami príkazov**:
  - `resources/cheat-sheet.md`: Rozsiahla revízia referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené stratégie rollbacku a nasadenia
  - `docs/troubleshooting/debugging.md`: Opravené sekcie analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy na riešenie problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia AZD debugovania
  - `docs/getting-started/azd-basics.md`: Opravené príkazy na monitorovanie
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a ladenia
  - `docs/getting-started/installation.md`: Opravené príklady pomoci a verzií
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy na zobrazenie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy na debugovanie agentov

- **📝 Aktualizovaná referencia verzie**:
  - `docs/getting-started/installation.md`: Zmena pevne stanovenej verzie `1.5.0` na generickú `1.x.x` s odkazom na vydania

#### Zmenené
- **Stratégie rollbacku**: Dokumentácia aktualizovaná na použitie rollbacku založeného na Gite (AZD nemá natívny rollback)
- **Zobrazenie logov**: Nahradené odkazy `azd logs` za `azd monitor --logs`, `azd monitor --live` a príkazy Azure CLI
- **Sekcia výkonu**: Odstránené neexistujúce flagy pre paralelné/incrementálne nasadenia, poskytnuté platné alternatívy

#### Technické detaily
- **Platné príkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné flagy azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené voči Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a zlepšenie kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky nefunkčné odkazy v dokumentácii a zlepšuje celkovú kvalitu obsahu pre AI vývojárov používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s pokynmi na prispievanie obsahujúci:
  - Jasné inštrukcie na hlásenie problémov a navrhovanie zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny pre príklady kódu a konvencie pre správy commitov
  - Informácie o angažovaní komunity

#### Dokončené
- **🎯 Workshop Modul 7 (Záver)**: Úplne dokončený záverečný modul s:
  - Komplexné zhrnutie výsledkov workshopu
  - Sekcia kľúčových ovládnutých konceptov pokrývajúca AZD, šablóny a Microsoft Foundry
  - Odporúčania pre pokračovanie v učebnej ceste
  - Výzvy a cvičenia workshopu s hodnotením obtiažnosti
  - Odkazy na spätnú väzbu komunity a podporu

- **📚 Workshop Modul 3 (Analýza)**: Aktualizované učebné ciele s:
  - Návod na aktiváciu GitHub Copilot s MCP servermi
  - Pochopenie štruktúry priečinkov šablón AZD
  - Vzory organizácie Infrastructure-as-Code (Bicep)
  - Pokyny do praktických laboratórií

- **🔧 Workshop Modul 6 (Demontáž)**: Dokončené s:
  - Ciele pre čistenie zdrojov a riadenie nákladov
  - Použitie `azd down` pre bezpečné odstraňovanie infraštruktúry
  - Pokyny na obnovenie soft-deleted kognitívnych služieb
  - Bonusové podnety na preskúmanie pre GitHub Copilot a Azure Portal

#### Opravené
- **🔗 Opravy nefunkčných odkazov**: Riešených 15+ nefunkčných interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradený neexistujúci súbor cicd-integration.md súborom deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty v častiach FAQ a troubleshooting guide
  - `examples/container-app/microservices/README.md`: Opravené cesty k course home a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy na kapitoly o AI
  - `course-outline.md`: Opravené odkazy na instructor guide a AI workshop lab

- **📅 Workshop Status Banner**: Aktualizovaný z "Under Construction" na aktívny stav workshopu s dátumom február 2026

- **🔗 Workshop Navigation**: Opravené nefunkčné navigačné odkazy v workshop README.md smerujúce na neexistujúci priečinok lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené upozornenie "under construction", workshop je teraz dokončený a pripravený na použitie
- **Konzistencia navigácie**: Zabezpečené, že všetky moduly workshopu majú správnu medzimodulovú navigáciu
- **Odkazy v učebnej ceste**: Aktualizované medzikapitolové odkazy, aby používali správne cesty microsoft-foundry

#### Overené
- ✅ Všetky anglické markdown súbory majú platné interné odkazy
- ✅ Moduly workshopu 0-7 sú dokončené s učebnými cieľmi
- ✅ Navigácia medzi kapitolami a modulmi funguje správne
- ✅ Obsah je vhodný pre AI vývojárov používajúcich Microsoft AZD
- ✅ Jazyk a štruktúra priateľská pre začiatočníkov sú zachované naprieč celým obsahom
- ✅ Súbor CONTRIBUTING.md poskytuje jasné pokyny pre prispievateľov z komunity

#### Technická implementácia
- **Overenie odkazov**: Automatizovaný PowerShell skript overil všetky interné .md odkazy
- **Audit obsahu**: Manuálne preskúmanie úplnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Použité konzistentné vzory navigácie kapitol a modulov

#### Poznámky
- **Rozsah**: Zmeny aplikované len na anglickú dokumentáciu
- **Preklady**: Zložky s prekladmi neboli v tejto verzii aktualizované (automatizovaný preklad sa zosynchronizuje neskôr)
- **Trvanie workshopu**: Kompletný workshop teraz poskytuje 3-4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: Monitorovanie, zabezpečenie a vzory pre viacagentové systémy
**Táto verzia pridáva komplexné lekcie triedy A o integrácii Application Insights, vzoroch autentifikácie a koordinácii viacagentových systémov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia integrácie Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým zriaďovaním
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Fungujúce Python aplikácie s vlastnou telemetriou (1 200+ riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Microsoft Foundry Models)
  - 6 Mermaid diagramov (architektúra, distribúované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (alerty, dashboardy, monitorovanie AI)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Live streaming metrík a debugovanie v reálnom čase
  - 40–50 minút času učenia s produkčnými vzormi pripravenými na nasadenie

- **🔐 Lekcia vzorov autentifikácie a zabezpečenia**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentifikácie (connection strings, Key Vault, managed identity)
  - Kompletné Bicep šablóny infraštruktúry pre bezpečné nasadenia
  - Kód Node.js aplikácie s integráciou Azure SDK
  - 3 kompletné cvičenia (povolenie managed identity, user-assigned identity, rotácia Key Vault)
  - Najlepšie bezpečnostné postupy a RBAC konfigurácie
  - Návod na riešenie problémov a analýza nákladov
  - Produkčné vzory autentifikácie bez hesla pripravené na nasadenie

- **🤖 Lekcia vzorov koordinácie viacagentových systémov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorov koordinácie (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
  - Kompletná implementácia orchestrátora služby (Python/Flask, 1 500+ riadkov)
  - 3 špecializované implementácie agentov (Research, Writer, Editor)
  - Integrácia Service Bus pre frontovanie správ
  - Správa stavu v Cosmos DB pre distribuované systémy
  - 6 Mermaid diagramov zobrazujúcich interakcie agentov
  - 3 pokročilé cvičenia (spracovanie timeoutov, logika opätovných pokusov, circuit breaker)
  - Rozpis nákladov ($240–565/mesiac) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Rozšírené
- **Kapitola Pre-deployment**: Teraz obsahuje komplexné vzory monitorovania a koordinácie
- **Kapitola Getting Started**: Vylepšená o profesionálne vzory autentifikácie
- **Pripravenosť na produkciu**: Kompletné pokrytie od zabezpečenia po observabilitu
- **Osnova kurzu**: Aktualizovaná tak, aby odkazovala na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Postup učenia**: Lepšia integrácia zabezpečenia a monitorovania v celom kurze
- **Kvalita dokumentácie**: Konzistentné štandardy triedy A (95–97 %) naprieč novými lekciami
- **Produkčné vzory**: Kompletné end-to-end pokrytie pre podnikové nasadenia

#### Zlepšené
- **Skúsenosť vývojára**: Jasná cesta od vývoja k monitorovaniu v produkcii
- **Bezpečnostné štandardy**: Profesionálne vzory pre autentifikáciu a správu tajomstiev
- **Observabilita**: Kompletná integrácia Application Insights s AZD
- **Zaťaženie AI**: Špecializované monitorovanie pre Microsoft Foundry Models a viacagentové systémy

#### Overené
- ✅ Všetky lekcie obsahujú kompletný fungujúci kód (nie výňatky)
- ✅ Mermaid diagramy pre vizuálne učenie (19 celkovo v 3 lekciách)
- ✅ Praktické cvičenia s krokmi overenia (9 celkovo)
- ✅ Produkčné Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýza nákladov a stratégie optimalizácie
- ✅ Návody na riešenie problémov a najlepšie postupy
- ✅ Kontrolné body znalostí s overovacími príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný návod na monitorovanie
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé viacagentové architektúry
- **Celý nový obsah**: - Konzistentné vysokokvalitné štandardy

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribučné trasovanie
- **Autentifikácia**: Managed Identity + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Live metriky + Kusto dotazy + alerty + dashboardy
- **Riadenie nákladov**: Stratégie vzorkovania, politiky uchovávania údajov, kontroly rozpočtu

### [v3.7.0] - 2025-11-19

#### Vylepšenia kvality dokumentácie a nový príklad Microsoft Foundry Models
**Táto verzia zlepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Microsoft Foundry Models s chat rozhraním gpt-4.1.**

#### Pridané
- **🤖 Príklad chatu Microsoft Foundry Models**: Kompletné nasadenie gpt-4.1 s fungujúcou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Microsoft Foundry Models (nasadenie modelu gpt-4.1)
  - Python príkazové chat rozhranie s históriou konverzácií
  - Integrácia Key Vault pre bezpečné ukladanie API kľúčov
  - Sledovanie využitia tokenov a odhad nákladov
  - Obmedzovanie rýchlosti (rate limiting) a spracovanie chýb
  - Obsiahly README s návodom na nasadenie (35–45 minút)
  - 11 produkčných súborov pripravených na nasadenie (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Cvičenia v dokumentácii**: Pridané praktické cvičenia do príručky konfigurácie:
  - Cvičenie 1: Konfigurácia pre viac prostredí (15 minút)
  - Cvičenie 2: Prax správy tajomstiev (10 minút)
  - Jasné kritériá úspechu a kroky overenia
- **✅ Overenie nasadenia**: Pridaná sekcia overenia do príručky nasadenia:
  - Postupy kontroly stavu (health check)
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy na nasadenie
  - Rýchla referencia na riešenie problémov

#### Vylepšené
- **examples/README.md**: Aktualizovaný na kvalitu triedy A (93%):
  - Pridané azure-openai-chat do všetkých relevantných sekcií
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky príkladov AI aplikácií
  - Integrované do Rýchleho štartu pre pokročilejších používateľov
  - Pridané do sekcie Microsoft Foundry Templates
  - Aktualizované sekcie Comparison Matrix a technology finding
- **Kvalita dokumentácie**: Zlepšenie z B+ (87%) → A- (92%) v priečinku docs:
  - Pridané očakávané výstupy ku kritickým príkladom príkazov
  - Zahrnuté kroky overenia pre zmeny konfigurácie
  - Vylepšené praktické učenie s praktickými cvičeniami

#### Zmenené
- **Postup učenia**: Lepšia integrácia AI príkladov pre stredne pokročilých študentov
- **Štruktúra dokumentácie**: Akčnejšie cvičenia s jasnými výsledkami
- **Proces overenia**: Pridané explicitné kritériá úspechu do kľúčových workflowov

#### Zlepšené
- **Skúsenosť vývojára**: Nasadenie Microsoft Foundry Models teraz trvá 35–45 minút (vs 60–90 pre komplexné alternatívy)
- **Transparentnosť nákladov**: Jasné odhady nákladov ($50–200/mesiac) pre príklad Microsoft Foundry Models
- **Učebná cesta**: AI vývojári majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a kroky overenia

#### Overené
- ✅ Príklad Microsoft Foundry Models plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov je syntakticky správnych
- ✅ Inštrukcie v README zodpovedajú skutočnej skúsenosti s nasadením
- ✅ Odkazy v dokumentácii aktualizované na 8+ miestach
- ✅ Index príkladov presne odráža 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy sú správne

#### Technická implementácia
- **Architektúra Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps vzor
- **Zabezpečenie**: Pripravené Managed Identity, tajomstvá v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Riadenie nákladov**: Sledovanie tokenov a optimalizácia využitia
- **Nasadenie**: Jediný príkaz `azd up` pre kompletné nastavenie

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia predstavuje komplexné, produkčné príklady nasadenia kontajnerových aplikácií pomocou Azure Developer CLI (AZD), s plnou dokumentáciou a integráciou do učebnej cesty.**

#### Pridané
- **🚀 Príklady Container App**: Nové lokálne príklady v `examples/container-app/`:
  - [Hlavný sprievodca](examples/container-app/README.md): Kompletný prehľad kontajnerových nasadení, rýchly štart, produkcia a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): REST API priateľné pre začiatočníkov s scale-to-zero, health probes, monitorovaním a riešením problémov
  - [Architektúra mikroslužieb](../../examples/container-app/microservices): Produkčné nasadenie viacerých služieb (API Gateway, Product, Order, User, Notification), asynchrónne zasielanie správ, Service Bus, Cosmos DB, Azure SQL, distribučné trasovanie, blue-green/canary nasadenie
- **Najlepšie praktiky**: Zabezpečenie, monitorovanie, optimalizácia nákladov a pokyny pre CI/CD pre kontajnerové záťaže
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a viacjazyčné implementácie služieb (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: End-to-end testovacie scenáre, príkazy na monitorovanie, pokyny na riešenie problémov

#### Zmenené
- **README.md**: Aktualizovaný tak, aby zobrazoval a odkazoval nové príklady container app v časti "Local Examples - Container Applications"
- **examples/README.md**: Aktualizovaný na zvýraznenie príkladov container app, pridanie položiek do comparison matrix a aktualizáciu referencií technológií/architektúry
- **Osnova kurzu & Study Guide**: Aktualizované tak, aby odkazovali na nové príklady container app a vzory nasadenia v relevantných kapitolách

#### Overené
- ✅ Všetky nové príklady nasaditeľné pomocou `azd up` a dodržiavajú najlepšie praktiky
- ✅ Krížové odkazy v dokumentácii a navigácia aktualizované
- ✅ Príklady pokrývajú scenáre od začiatočníkov po pokročilých vrátane produkčných mikroslužieb

#### Poznámky
- **Rozsah**: Len anglická dokumentácia a príklady
- **Ďalšie kroky**: Rozšíriť o ďalšie pokročilé vzory kontajnerov a CI/CD automatizáciu v budúcich vydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Táto verzia implementuje komplexnú zmenu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" v celej anglickej dokumentácii, odrážajúcu oficiálny rebranding Microsoftu.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Spolu: 23 referencií obsahu aktualizovaných v 7 dokumentačných súboroch

- **📁 Zmeny štruktúry priečinkov**:
  - `docs/ai-foundry/` premenovaný na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované tak, aby zodpovedali novej štruktúre priečinkov
  - Navigačné odkazy overené v celej dokumentácii

- **📄 Premenovania súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky interné odkazy aktualizované tak, aby odkazovali na nový názov súboru

#### Aktualizované súbory
- **Dokumentácia kapitol** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizácie odkazov na názov produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencie aktualizované (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizované krížové odkazy
  - `docs/getting-started/first-project.md` - 2 aktualizované navigačné odkazy kapitol
  - `docs/getting-started/installation.md` - 2 aktualizované odkazy na ďalšiu kapitolu
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizácie referencií (navigácia, Discord komunita)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizovaný navigačný odkaz
  - `docs/troubleshooting/debugging.md` - 1 aktualizovaný navigačný odkaz

- **Súbory štruktúry kurzu** (2 súbory):
  - `README.md` - 17 aktualizovaných referencií (prehľad kurzu, názvy kapitol, sekcia šablón, poznatky komunity)
  - `course-outline.md` - 14 aktualizovaných referencií (prehľad, učebné ciele, zdroje kapitol)

#### Overené
- ✅ Žiadne zostávajúce referencie cesty priečinka "ai-foundry" v anglických dokumentoch
- ✅ Žiadne zostávajúce referencie názvu produktu "Microsoft Foundry" v anglických dokumentoch
- ✅ Všetky navigačné odkazy fungujú s novou štruktúrou priečinkov
- ✅ Premenovania súborov a priečinkov úspešne dokončené
- ✅ Krížové odkazy medzi kapitolami overené

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu v priečinku `docs/`
- **Preklady**: Zložky s prekladmi (`translations/`) nie sú v tejto verzii aktualizované
- **Workshop**: Materiály workshopu (`workshop/`) nie sú v tejto verzii aktualizované
- **Príklady**: Súbory s príkladmi môžu stále obsahovať odkazy na staré pomenovanie (bude vyriešené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL a odkazy na repozitár GitHub zostávajú nezmenené

#### Sprievodca migráciou pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu, ktorá odkazuje na starú štruktúru:
1. Aktualizujte referencie priečinkov: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte referencie súborov: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte názov produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Overte, že všetky interné odkazy v dokumentácii stále fungujú

---

### [v3.4.0] - 2025-10-24

#### Vylepšenia náhľadu infraštruktúry a overovania
**Táto verzia zavádza komplexnú podporu pre novú funkciu náhľadu Azure Developer CLI a zlepšuje užívateľskú skúsenosť workshopu.**

#### Pridané
- **🧪 azd provision --preview Feature Documentation**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referenčné informácie o príkazoch a príklady použitia v cheat sheete
  - Podrobná integrácia v návode na provisioning s prípadmi použitia a výhodami
  - Integrácia pre-flight kontrol pre bezpečnejšie overenie nasadenia
  - Aktualizácie príručky Začíname s postupmi nasadzovania zameranými na bezpečnosť
- **🚧 Banner stavu workshopu**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Dizajn s prechodom a indikátormi výstavby pre jasnú komunikáciu používateľom
  - Časová pečiatka poslednej aktualizácie pre transparentnosť
  - Responzívny dizajn pre všetky typy zariadení

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcia náhľadu integrovaná naprieč dokumentáciou nasadenia
- **Overovanie pred nasadením**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Vývojársky pracovný tok**: Aktualizované sekvencie príkazov, ktoré zahŕňajú náhľad ako osvedčený postup
- **Skúsenosť s workshopom**: Používateľom sú jasne nastavené očakávania ohľadom stavu vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Postup s dôrazom na náhľad je teraz odporúčaným prístupom
- **Tok dokumentácie**: Overovanie infraštruktúry presunuté skôr v procese učenia
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasným časovým harmonogramom vývoja

#### Vylepšené
- **Prístup orientovaný na bezpečnosť**: Zmeny infraštruktúry je teraz možné overiť pred nasadením
- **Tímová spolupráca**: Výsledky náhľadu je možné zdieľať na kontrolu a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Zmiernenie rizika**: Zníženie chýb nasadenia vďaka predbežnému overovaniu

#### Technická implementácia
- **Integrácia naprieč dokumentmi**: Funkcia náhľadu zdokumentovaná v 4 kľúčových súboroch
- **Vzorce príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia osvedčených postupov**: Náhľad zahrnutý vo validačných workflowoch a skriptoch
- **Vizuálne indikátory**: Jasné označenia NOVÉ funkcie pre lepšiu objaviteľnosť

#### Infrastruktúra workshopu
- **Komunikácia stavu**: Profesionálny HTML banner s prechodovým štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja zabraňuje zmätku
- **Profesionálna prezentácia**: Udržiava dôveryhodnosť repozitára pri nastavovaní očakávaní
- **Transparentnosť časového harmonogramu**: Časová pečiatka poslednej aktualizácie október 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívna vzdelávacia skúsenosť
**Táto verzia prináša komplexné materiály workshopu s prehliadačovými interaktívnymi sprievodcami a štruktúrovanými vzdelávacími cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Prehliadačom založená workshopová skúsenosť s možnosťou náhľadu MkDocs
- **📝 Štruktúrované inštrukcie workshopu**: 7-kroková vedená vzdelávacia cesta od objavenia po prispôsobenie
  - 0-Introduction: Prehľad workshopu a jeho nastavenie
  - 1-Select-AI-Template: Objavovanie šablón a proces ich výberu
  - 2-Validate-AI-Template: Postupy nasadenia a overovania šablóny
  - 3-Deconstruct-AI-Template: Pochopenie architektúry šablóny
  - 4-Configure-AI-Template: Konfigurácia a prispôsobenie
  - 5-Customize-AI-Template: Pokročilé úpravy a iterácie
  - 6-Teardown-Infrastructure: Vyčistenie a správa zdrojov
  - 7-Wrap-up: Zhrnutie a ďalšie kroky
- **🛠️ Nástroje workshopu**: Konfigurácia MkDocs s témou Material pre vylepšenú učebnú skúsenosť
- **🎯 Praktická učená cesta**: 3-kroková metodika (Discovery → Deployment → Customization)
- **📱 Integrácia GitHub Codespaces**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírený o komplexnú 2–3 hodinovú štruktúrovanú vzdelávaciu skúsenosť
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krok-za-krokom vedenie od výberu šablóny po nasadenie do produkcie
- **Skúsenosť vývojára**: Integrované nástroje pre zefektívnené vývojové workflowy

#### Vylepšené
- **Prístupnosť**: Prehliadačové rozhranie s vyhľadávaním, možnosťou kopírovania a prepínačom tém
- **Samostatné štúdium**: Flexibilná štruktúra workshopu prispôsobená rôznym tempám učenia
- **Praktická aplikácia**: Reálne scenáre nasadenia AI šablón
- **Integrácia komunity**: Integrácia Discordu pre podporu workshopu a spoluprácu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania pri prechode myšou pre všetky príklady kódu
- **Prepínač tém**: Podpora tmavého/svetlého režimu podľa preferencií
- **Vizuálne zdroje**: Snímky obrazovky a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup na Discord pre podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavná reštrukturalizácia navigácie a systém učenia založený na kapitolách
**Táto verzia zavádza komplexný systém učenia rozdelený do kapitol s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Celková reštrukturalizácia kurzu do 8 postupných kapitol
  - Chapter 1: Základy a rýchly štart (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Komplexný navigačný systém**: Konzistentné hlavičky a pätičky navigácie v celej dokumentácii
- **🎯 Sledovanie pokroku**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Vedenie učebnej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Krížová navigácia**: Súvisiace kapitoly a predpoklady jasne prepojené

#### Vylepšené
- **Štruktúra README**: Pretransformovaná na štruktúrovanú vzdelávaciu platformu s organizáciou podľa kapitol
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a usmernenie postupu
- **Organizácia šablón**: Príklady a šablóny priradené k príslušným kapitolám učenia
- **Integrácia zdrojov**: Cheat sheety, FAQ a študijné príručky prepojené s relevantnými kapitolami
- **Integrácia workshopu**: Praktické laboratória priradené k viacerým učebným cieľom kapitol

#### Zmenené
- **Postup učenia**: Presun z lineárnej dokumentácie na flexibilné učenie založené na kapitolách
- **Umiestnenie konfigurácie**: Príručka konfigurácie presunutá ako Chapter 3 pre lepší tok učenia
- **Integrácia AI obsahu**: Lepšia integrácia obsahu špecifického pre AI v celej učebnej ceste
- **Obsah pre produkciu**: Pokročilé vzory konsolidované v Chapter 8 pre podnikových študentov

#### Vylepšené
- **Používateľská skúsenosť**: Jasné breadcrumby a indikátory postupu kapitol
- **Prístupnosť**: Konzistentné navigačné vzorce pre ľahšie prechádzanie kurzom
- **Profesionálna prezentácia**: Štruktúra štýlu univerzity vhodná pre akadémie a firemné školenia
- **Efektivita učenia**: Znížený čas na nájdenie relevantného obsahu vďaka zlepšenej organizácii

#### Technická implementácia
- **Hlavičky navigácie**: Štandardizovaná navigácia kapitol v 40+ dokumentačných súboroch
- **Pätičková navigácia**: Konzistentné usmernenie postupu a indikátory dokončenia kapitol
- **Krížové prelinkovanie**: Komplexný systém interných odkazov spájajúci súvisiace koncepty
- **Mapovanie kapitol**: Šablóny a príklady jasne priradené k učebným cieľom

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné učebné ciele**: Prepracovaná študijná príručka zosúladená s 8-kapitolovým systémom
- **🎯 Hodnotenie podľa kapitol**: Každá kapitola obsahuje konkrétne učebné ciele a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný študijný plán s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Otázky na hodnotenie**: Otázky na overenie znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a odstraňovania problémov
- **📊 Postup zručností**: Jasný postup od základných konceptov k podnikových vzorom so zameraním na kariérny rozvoj
- **🎓 Rámec certifikácie**: Profesionálne rozvojové výsledky a uznanie komunity
- **⏱️ Riadenie časového harmonogramu**: Štruktúrovaný 10-týždňový učebný plán s overovaním míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené multi-agentné AI riešenia
**Táto verzia zlepšuje multi-agentné retail riešenie s lepším pomenovaním agentov a vylepšenou dokumentáciou.**

#### Zmenené
- **Multi-Agent Terminológia**: Nahradené Cora agent výrazom Customer agent v celom retail multi-agent riešení pre lepšie pochopenie
- **Architektúra agentov**: Aktualizovaná dokumentácia, ARM šablóny a príklady kódu na konzistentné použitie názvu Customer agent
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agentov s aktualizovanými pomenovaniami
- **Konzistentnosť dokumentácie**: Zabezpečené, že všetky odkazy používajú profesionálne, popisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizovaný retail-multiagent-arm-template s odkazmi na Customer agent
- **Architektonické diagramy**: Obnovené Mermaid diagramy s aktualizovaným pomenovaním agentov
- **Príklady kódu**: Príklady v Pythone používajú teraz CustomerAgent pomenovanie
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia na používanie CUSTOMER_AGENT_NAME konvencií

#### Vylepšené
- **Skúsenosť vývojára**: Jasnejšie roly a zodpovednosti agentov v dokumentácii
- **Pripravenosť do produkcie**: Lepšie zosúladenie s podnikateľskými konvenciami pomenovania
- **Učebné materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované Mermaid architektonické diagramy s referenciami CustomerAgent
- Nahradené CoraAgent názvy tried v Pythone za CustomerAgent v príkladoch
- Upravené ARM šablóny JSON na použitie typu agenta "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojára a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 AI-First Learning Path**: Kompletná reštrukturalizácia s priorizáciou AI vývojárov a inžinierov
- **Microsoft Foundry Integration Guide**: Komplexná dokumentácia pre prepojenie AZD s Microsoft Foundry službami
- **AI Model Deployment Patterns**: Podrobný návod pokrývajúci výber modelu, konfiguráciu a stratégie nasadenia do produkcie
- **AI Workshop Lab**: 2-3 hodinový praktický workshop na prevod AI aplikácií na riešenia nasaditeľné cez AZD
- **Production AI Best Practices**: Podnikové vzory pre škálovanie, monitorovanie a zabezpečenie AI záťaží
- **AI-Specific Troubleshooting Guide**: Komplexný návod na riešenie problémov pre modely Microsoft Foundry, Cognitive Services a problémy s nasadením AI
- **AI Template Gallery**: Vybraná kolekcia šablón Microsoft Foundry s hodnotením zložitosti
- **Workshop Materials**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **README Structure**: Zamerané na AI vývojára s údajmi o 45% záujmu komunity z Microsoft Foundry Discordu
- **Learning Paths**: Samostatná cesta pre AI vývojárov popri tradičných cestách pre študentov a DevOps inžinierov
- **Template Recommendations**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Community Integration**: Vylepšená podpora komunity na Discorde s kanálmi a diskusiami špecifickými pre AI

#### Bezpečnosť & Zameranie na produkciu
- **Managed Identity Patterns**: Autentifikačné a bezpečnostné konfigurácie špecifické pre AI
- **Cost Optimization**: Sledovanie využitia tokenov a kontrola rozpočtu pre AI záťaže
- **Multi-Region Deployment**: Stratégie pre globálne nasadenie AI aplikácií
- **Performance Monitoring**: Metriky špecifické pre AI a integrácia s Application Insights

#### Kvalita dokumentácie
- **Linear Course Structure**: Logický postup od začiatočníka po pokročilé vzory nasadenia AI
- **Validated URLs**: Všetky externé odkazy na repozitáre overené a dostupné
- **Complete Reference**: Všetky interné odkazy v dokumentácii overené a funkčné
- **Production Ready**: Podnikové vzory nasadenia s reálnymi príkladmi

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenie
**Táto verzia predstavuje významnú prepracovanie štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Structured Learning Framework**: Všetky dokumentačné stránky teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigation System**: Pridané odkazy Predchádzajúca/Nasledujúca lekcia vo všetkej dokumentácii pre usmernený postup učenia
- **Study Guide**: Komplexný study-guide.md s učebnými cieľmi, cvičeniami a hodnotiacimi materiálmi
- **Professional Presentation**: Odstránené všetky emoji ikony pre zlepšenie prístupnosti a profesionálneho vzhľadu
- **Enhanced Content Structure**: Zlepšená organizácia a tok učebných materiálov

#### Zmenené
- **Documentation Format**: Štandardizovaná všetka dokumentácia s konzistentnou štruktúrou zameranou na učenie
- **Navigation Flow**: Implementovaný logický postup naprieč všetkými učebnými materiálmi
- **Content Presentation**: Odstránené dekoračné prvky v prospech jasného a profesionálneho formátovania
- **Link Structure**: Aktualizované všetky interné odkazy na podporu nového navigačného systému

#### Vylepšené
- **Accessibility**: Odstránené závislosti na emoji pre lepšiu kompatibilitu so čítačkami obrazovky
- **Professional Appearance**: Čistý, akademický štýl prezentácie vhodný pre podnikové vzdelávanie
- **Learning Experience**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Content Organization**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný AZD učebný repozitár

#### Pridané
- **Core Documentation Structure**
  - Kompletný rad sprievodcov getting-started
  - Komplexná dokumentácia nasadenia a provisioningu
  - Podrobné zdroje na riešenie problémov a návody na ladenie
  - Nástroje a postupy na prednasadenú validáciu

- **Getting Started Module**
  - AZD Basics: Základné koncepty a terminológia
  - Installation Guide: Pokyny na inštaláciu pre konkrétne platformy
  - Configuration Guide: Nastavenie prostredia a autentifikácia
  - First Project Tutorial: Krok za krokom praktické učenie

- **Deployment and Provisioning Module**
  - Deployment Guide: Kompletná dokumentácia workflow pre nasadenie
  - Provisioning Guide: Infrastruktúra ako kód s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúry viacerých služieb

- **Pre-deployment Validation Module**
  - Capacity Planning: Overenie dostupnosti zdrojov Azure
  - SKU Selection: Komplexné usmernenie k úrovni služieb
  - Pre-flight Checks: Automatizované validačné skripty (PowerShell a Bash)
  - Nástroje na odhad nákladov a plánovanie rozpočtu

- **Troubleshooting Module**
  - Common Issues: Často sa vyskytujúce problémy a riešenia
  - Debugging Guide: Systematické metodiky riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Resources and References**
  - Command Cheat Sheet: Rýchla referenčná pomôcka pre základné príkazy
  - Glossary: Komplexné definície pojmov a skratiek
  - FAQ: Podrobné odpovede na časté otázky
  - Externé odkazy na zdroje a spojenie s komunitou

- **Examples and Templates**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webstránky
  - Konfigurácia kontajnerovej aplikácie
  - Vzory integrácie databáz
  - Príklady architektúry mikroservisov
  - Implementácie serverless funkcií

#### Funkcie
- **Multi-Platform Support**: Návody na inštaláciu a konfiguráciu pre Windows, macOS a Linux
- **Multiple Skill Levels**: Obsah navrhnutý pre študentov až po profesionálnych vývojárov
- **Practical Focus**: Praktické príklady a scenáre z reálneho sveta
- **Comprehensive Coverage**: Od základných konceptov po pokročilé podnikové vzory
- **Security-First Approach**: Bezpečnostné najlepšie praktiky integrované naprieč
- **Cost Optimization**: Usmernenia pre ekonomické nasadenia a správu zdrojov

#### Kvalita dokumentácie
- **Detailed Code Examples**: Praktické, otestované ukážky kódu
- **Step-by-Step Instructions**: Jasné, akčné pokyny
- **Comprehensive Error Handling**: Riešenie chýb pre bežné problémy
- **Best Practices Integration**: Priemyselné štandardy a odporúčania
- **Version Compatibility**: Aktuálne s najnovšími službami Azure a funkciami azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánovaná)
#### Rozšírenie AI platformy
- **Multi-Model Support**: Integračné vzory pre Hugging Face, Azure Machine Learning a vlastné modely
- **AI Agent Frameworks**: Šablóny pre nasadenia LangChain, Semantic Kernel a AutoGen
- **Advanced RAG Patterns**: Možnosti vektorových databáz nad rámec Azure AI Search (Pinecone, Weaviate a pod.)
- **AI Observability**: Vylepšené monitorovanie výkonu modelov, využitia tokenov a kvality odpovedí

#### Skúsenosť vývojára
- **VS Code Extension**: Integrovaná vývojová skúsenosť AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Generovanie AZD šablón s asistenciou AI
- **Interactive Tutorials**: Praktické cvičenia s automatizovanou validáciou pre AI scenáre
- **Video Content**: Doplnkové video návody pre vizuálnych študentov zamerané na AI nasadenia

### Verzia 4.0.0 (Plánovaná)
#### Podnikové AI vzory
- **Governance Framework**: Správa modelov AI, súlad a auditné záznamy
- **Multi-Tenant AI**: Vzory na poskytovanie služieb viacerým zákazníkom s izolovanými AI službami
- **Edge AI Deployment**: Integrácia s Azure IoT Edge a kontajnerovými inštanciami
- **Hybrid Cloud AI**: Viac-cloudové a hybridné vzory nasadenia pre AI záťaže

#### Pokročilé funkcie
- **AI Pipeline Automation**: Integrácia MLOps s Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust vzory, privátne endpointy a pokročilá ochrana pred hrozbami
- **Performance Optimization**: Pokročilé ladenie a škálovanie pre vysoko priepustné AI aplikácie
- **Global Distribution**: Vzory na distribúciu obsahu a edge caching pre AI aplikácie

### Verzia 3.0.0 (Plánovaná) - Nahradené aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo v3.0.0
- ✅ **AI-Focused Content**: Komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interactive Tutorials**: Praktické AI workshop laboratórium (Dokončené)
- ✅ **Advanced Security Module**: Bezpečnostné vzory špecifické pre AI (Dokončené)
- ✅ **Performance Optimization**: Stratégií ladenia AI záťaží (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementované vo v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Additional Examples**: Scenáre nasadenia zamerané na AI (Dokončené)
- ✅ **Extended FAQ**: AI-špecifické otázky a riešenie problémov (Dokončené)
- **Tool Integration**: Vylepšené návody na integráciu IDE a editorov
- ✅ **Monitoring Expansion**: Rozšírenie monitorovania a alarmovania pre AI (Dokončené)

#### Stále plánované do budúceho vydania
- **Mobile-Friendly Documentation**: Responzívny dizajn pre mobilné učenie
- **Offline Access**: Stiahnuteľné balíčky dokumentácie
- **Enhanced IDE Integration**: Rozšírenie VS Code pre AZD + AI pracovné postupy
- **Community Dashboard**: Reálne metriky komunity a sledovanie príspevkov

## Prispievanie do changelogu

### Hlásenie zmien
Pri prispievaní do tohto repozitára, prosím zabezpečte, aby záznamy v changelogu obsahovali:

1. **Version Number**: V súlade so sémantickým verzovaním (major.minor.patch)
2. **Date**: Dátum vydania alebo aktualizácie vo formáte RRRR-MM-DD
3. **Category**: Pridané, Zmenené, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Stručný popis toho, čo sa zmenilo
5. **Impact Assessment**: Ako zmeny ovplyvňujú existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, sekcie dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo učebné zdroje
- Dodatočné nástroje, skripty alebo utilitky

#### Zmenené
- Úpravy existujúcej funkčnosti alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Deprecated
- Funkcie alebo prístupy, ktoré sa postupne vyraďujú
- Sekcie dokumentácie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Removed
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastaralé informácie alebo vyslúžilé prístupy
- Redundantný alebo skonsolidovaný obsah

#### Fixed
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov
- Zlepšenia presnosti alebo funkčnosti

#### Security
- Bezpečnostné vylepšenia alebo opravy
- Aktualizácie bezpečnostných najlepších praktík
- Riešenie zraniteľností

### Pokyny pre sémantické verzovanie

#### Major Version (X.0.0)
- Zásadné zmeny, ktoré vyžadujú akciu používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny, ktoré menia základný prístup alebo metodológiu

#### Minor Version (X.Y.0)
- Nové funkcie alebo doplnenie obsahu
- Vylepšenia, ktoré zachovávajú spätnú kompatibilitu
- Doplňujúce príklady, nástroje alebo zdroje

#### Patch Version (X.Y.Z)
- Opravy chýb a opravy
- Menšie vylepšenia existujúceho obsahu
- Spresnenia a malé rozšírenia

## Spätná väzba komunity a návrhy

Aktívne povzbudzujeme spätnú väzbu od komunity na zlepšenie tohto učebného zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Nahláste problémy alebo navrhnite zlepšenia (AI-špecifické problémy vítané)
- **Discord Discussions**: Zdieľajte nápady a zapojte sa do komunity Microsoft Foundry
- **Pull Requests**: Priamo prispievajte k obsahu, najmä AI šablónam a návodom
- **Microsoft Foundry Discord**: Zúčastnite sa kanála #Azure pre diskusie o AZD + AI
- **Community Forums**: Zapojte sa do širších diskusií vývojárov Azure

### Kategórie spätnej väzby
- **AI Content Accuracy**: Opravy integrácie a nasadenia AI služieb
- **Learning Experience**: Návrhy na zlepšenie toku učenia pre AI vývojárov
- **Missing AI Content**: Požiadavky na ďalšie AI šablóny, vzory alebo príklady
- **Accessibility**: Vylepšenia pre rôzne potreby učenia
- **AI Tool Integration**: Návrhy na lepšiu integráciu pracovných tokov AI
- **Production AI Patterns**: Požiadavky na podnikové vzory nasadenia AI

### Záväzok reakcie
- **Issue Response**: Do 48 hodín pre nahlásené problémy
- **Feature Requests**: Vyhodnotenie do jedného týždňa
- **Community Contributions**: Recenzia do jedného týždňa
- **Security Issues**: Okamžitá priorita s urýchlenou reakciou

## Harmonogram údržby

### Pravidelné aktualizácie
- **Monthly Reviews**: Kontrola presnosti obsahu a overenie odkazov
- **Quarterly Updates**: Väčšie doplnenia obsahu a vylepšenia
- **Semi-Annual Reviews**: Komplexné reštrukturalizácie a vylepšenia
- **Annual Releases**: Hlavné verzie s významnými vylepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automated Testing**: Pravidelná validácia ukážok kódu a odkazov
- **Community Feedback Integration**: Pravidelné zapracovanie návrhov používateľov
- **Technology Updates**: Súladenie s najnovšími službami Azure a vydaniami azd
- **Accessibility Audits**: Pravidelná kontrola pre inkluzívne návrhové princípy

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Latest Major Version**: Plná podpora s pravidelnými aktualizáciami
- **Previous Major Version**: Bezpečnostné aktualizácie a kritické opravy po dobu 12 mesiacov
- **Legacy Versions**: Podpora komunity len, žiadne oficiálne aktualizácie

### Pokyny pre migráciu
Pri vydaní hlavných verzií poskytujeme:
- **Migration Guides**: Krok za krokom prechodové návody
- **Compatibility Notes**: Detaily o zlomových zmenách
- **Tool Support**: Skripty alebo utilitky na pomoc pri migrácii
- **Community Support**: Vyhradené fóra pre otázky k migrácii

---

**Navigácia**
- **Predchádzajúca lekcia**: [Sprievodca štúdiom](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Hlavné README](README.md)

**Zostaňte informovaní**: Sledujte tento repozitár pre oznámenia o nových vydaniach a dôležitých aktualizáciách učebných materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
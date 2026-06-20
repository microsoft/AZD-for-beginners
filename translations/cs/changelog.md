# Záznam změn - AZD Pro Začátečníky

## Úvod

Tento záznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD For Beginners. Dodržujeme zásady semantického verzování a udržujeme tento záznam, aby uživatelé pochopili, co se mezi verzemi změnilo.

## Cíle učení

Přezkoumáním tohoto záznamu změn budete:
- Informováni o nových funkcích a přidaném obsahu
- Rozumět vylepšením provedeným v existující dokumentaci
- Sledovat opravy chyb a korekce pro zajištění přesnosti
- Sledovat vývoj učebních materiálů v čase

## Výsledky učení

Po prostudování záznamu změn budete schopni:
- Identifikovat nový obsah a dostupné zdroje pro učení
- Pochopit, které části byly aktualizovány nebo vylepšeny
- Plánovat svou vzdělávací cestu na základě aktuálních materiálů
- Přispívat zpětnou vazbou a návrhy pro budoucí vylepšení

## Historie verzí

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Tato verze uzavírá zbývající mezery pro středně pokročilé uživatele zjištěné analýzou azd-coverage: jak vytvářet a publikovat vlastní šablonu, reprodukovatelná prostředí dev-container/Codespaces, poskytovatel infrastruktury Pulumi, průvodce Azure DevOps CI/CD, autentizace pomocí service-principal, doporučení pro výběr hostitele (AKS/Spring Apps), vysvětlení `azd restore`/`azd package`, zpracování chyb v hookech a postupy pro týmová/společná prostředí.**

#### Přidáno
- **🧱 Nová lekce kapitoly 4** `docs/chapter-04-infrastructure/custom-templates.md` — tvorba vlastní azd šablony: požadovaná struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametrizace infrastruktury pomocí tokenu zdroje `uniqueString()` a tagu `azd-env-name`, lokální testování s `azd init --template <local-path>`, publikování na GitHub a odeslání do galerie Awesome AZD
- **📦 Nová lekce kapitoly 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovatelná azd prostředí s Dev Containers a GitHub Codespaces: minimální `.devcontainer/devcontainer.json` využívající oficiální `ghcr.io/azure/azure-dev/azd` feature, funkce specifické pro jazyky, `docker-in-docker` pro hostitele kontejnerů a `azd auth login --use-device-code` pro vzdálené přihlášení
- **🧩 Sekce Pulumi s azd** v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, rozložení složek pro Pulumi, stacks mapované na azd prostředí, požadované outputs/tagging a identický workflow `azd up` / `azd down`
- **🎯 Doporučení pro výběr hostitele** v `docs/chapter-04-infrastructure/provisioning.md` — srovnání pro začátečníky mezi `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp`, včetně doporučení, kdy zvolit AKS nebo Azure Spring Apps
- **🛠️ Průvodce Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection s workload identity federation (OIDC), generovaný `azure-dev.yml` a nastavení variable-group
- **🔑 Service Principals (Pattern 4)** přidáno do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivní `azd auth login` s client secret vs. federovanými/OIDC přihlašovacími údaji, kdy použít a bezpečné ukládání pověření
- **🪝 Zpracování chyb v hookech** podsekce v `docs/chapter-04-infrastructure/deployment-guide.md` — návratové kódy a `set -e`, `continueOnError`, testování hooků izolovaně pomocí `azd hooks run`, OS-specifické shelly a `--debug`
- **👥 Týmová / sdílená prostředí** sekce v `docs/chapter-03-configuration/configuration.md` — co patří do `.azure/`, co ignorovat v gitu, per-developer prostředí, `azd env list`/`select` a poskytování hodnot prostředí v CI/CD
- **🧰 Vysvětlení `azd restore` a rozšířené `azd package`** v `resources/cheat-sheet.md` — obnovení závislostí a sestavení deployovatelného artefaktu bez nasazení

#### Změněno
- **🧭 Tabulka lekcí kapitoly 4** aktualizována o novou lekci "Authoring Your Own Template" (Lekce 3)
- **🧭 Tabulka lekcí kapitoly 1** aktualizována o novou lekci "Dev Containers & Codespaces" (Lekce 5); navigační patičky propojily `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Tato verze uzavírá největší mezery pro kompletní průvodce pro začátečníky přidáním dvou nových praktických lekcí (nasaditelné více-agentní cvičení a přidání azd do existující aplikace), úvod pro začátečníky k hookům, sekce Terraform s azd, krok-za-krokem průvodce GitHub Actions pipeline a vysvětlivka pro nové preview extensiony, a explicitní kontrolní seznam pro ověření nasazení.**

#### Přidáno
- **🤝 Nová lekce kapitoly 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plně praktický, nasaditelný průvodce se dvěma agenty (orchestrátor + specialisté) používající reálnou šablonu (`contoso-creative-writer`), pokrývá kdy použít multi-agent, workflow `azd up`, pochopení nasazených zdrojů, tracing mezi agenty, přizpůsobení a úklid
- **📦 Nová lekce kapitoly 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak přidat azd do existujícího projektu s `azd init` ("use code in the current directory"), pochopení `azure.yaml` a `infra/`, `azd infra generate`, detekce hostitele a nasazení pomocí `azd up`
- **🌐 Terraform s azd** sekce přidána do `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigurace, rozložení `.tf` složek, požadované `AZURE_*` outputs a tagování `azd-env-name`, a identický workflow `azd up` / `azd down` (uzavírá mezeru, kde byla zmíněna podpora Terraformu, ale ukazoval se pouze Bicep)
- **⚙️ Krok-za-krokem průvodce GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitáře po automatizované nasazení: `azd pipeline config`, OIDC federovaná přihlašovací údaje (bez uložených tajemství), generovaný `azure-dev.yml` a doporučení ohledně secrets vs. variables
- **🪝 Začátečnický úvod "New to hooks?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — co je hook, tabulka fází hooků, minimální první hook a manuální spouštění hooků s `azd hooks run`
- **✅ Kontrolní seznam "Verify Your Deployment"** přidán do kroku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola health endpointu a explicitní kritéria úspěchu
- **🧩 Vysvětlivka pro nové preview extensiony** `azure.ai.skills` a `azure.ai.connections` (co jsou a kdy je použít) v `docs/chapter-08-production/production-ai-practices.md`

#### Změněno
- **🧭 Tabulka lekcí kapitoly 5** opravena: `multi-agent-basics.md` je nyní Lekce 1 (jediná plně praktická lekce), s upřímným označením, že Lekce 2 je v kapitole 6 a scénář pro retail je architektonický blueprint, nikoli šablona spustitelná jedním příkazem
- **🧭 Tabulka lekcí kapitoly 1** nyní obsahuje novou lekci "Bring Your Own App" (Lekce 4)
- **🔗 Navigační patičky** aktualizovány: `first-project.md` nyní odkazuje dále na `bring-your-own-app.md`

#### Opraveno
- **🧱 Uzavřena mezera "claimed but missing" u Terraformu** — kurz dříve odkazoval na podporu Terraformu, aniž by ji ukazoval
- **🔀 Opraveny zavádějící mezikapitolní odkazy v kapitole 5**, které naznačovaly existenci plné multi-agent implementace, zatímco šlo pouze o architektonický blueprint

#### Aktualizované soubory
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Tato verze znovu validuje kurz proti `azd` `1.25.6` (červen 2026) a extension `azure.ai.agents` `0.1.40-preview`, rozšiřuje AI doporučení od „scaffold agent“ k úplnému životnímu cyklu agenta (test → evaluate → optimize → inspect → delete), odhaluje nové preview extensiony `azure.ai.skills` a `azure.ai.connections` a zmiňuje rebranding produktu ".NET Aspire" → "Aspire".**

#### Přidáno
- **🔁 Pokrytí plného životního cyklu agenta** pro začátečníky a AI inženýry napříč dokumenty:
  - `docs/chapter-01-foundation/azd-basics.md` — přidána tabulka životního cyklu (scaffold → test → measure → improve → inspect → clean up) do sekce Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — nová sekce "Managing the Agent Lifecycle" pokrývající `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — rozšířené AI Agent příkazy o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nové preview extensiony** zdokumentovány: `azure.ai.skills` (znovupoužitelné agentní skills) a `azure.ai.connections` (Foundry connections) přidány do tabulky extensionů a cheat sheetu
- **⏱️ Doporučení k měření odezvy** — příklady `azd ai agent invoke` nyní uvádějí, že vypisuje celkovou latenci a time-to-first-byte
- **📌 Banner verze** v kořenovém README nasměruje studenty na `azd version` a `azd upgrade`

#### Změněno
- **✅ Validace baseline aktualizována** z `azd 1.23.12` (březen 2026) na `azd 1.25.6` (červen 2026) ve všech chaptrech README a workshop dokumentaci
- **🤖 Poznámka o extension v kapitole 2** aktualizována z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Workshop validační příklad** (`azd version` výstup) aktualizován na `1.25.6`
- **🧭 README "What's New in azd Today"** obnovený pro zvýraznění end-to-end životního cyklu agenta, nových AI extensionů a nedávných zlepšení použitelnosti (`azd init` idempotence, `azd auth login` čištění neplatných tokenů, `azd tool` první-run výzva)
- **📖 Chapter 2 agents.md (Option 4)** nyní odkazuje studenty na post-deploy příkazy životního cyklu místo zastavení u `azd up`

#### Opraveno
- **🏷️ Pojmenování produktu** — přidána poznámka o rebrandingu Aspire (".NET Aspire" je nyní jednoduše "Aspire"); podpora Aspire v azd zůstává nezměněna
- **🔎 Live validace vydání** potvrzena proti release feedu Azure Developer CLI: stable CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Aktualizované soubory
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
#### Vyjasnění onboardingu pro začátečníky, ověření nastavení a konečné vyčištění příkazů AZD
**Tato verze navazuje na kontrolu validace AZD 1.23 s dokumentační úpravou zaměřenou na začátečníky: objasňuje postupy autentizace preferující AZD, přidává lokální skripty pro ověření nastavení, ověřuje klíčové příkazy proti aktuálnímu CLI AZD a odstraňuje poslední zastaralé anglické odkazy na příkazy mimo changelog.**

#### Přidáno
- **🧪 Skripty pro ověření nastavení pro začátečníky** s `validate-setup.ps1` a `validate-setup.sh`, aby si si účastníci mohli ověřit požadované nástroje před zahájením Kapitoly 1
- **✅ Předběžné kroky ověření nastavení** v hlavním README a v README Kapitoly 1, aby chybějící předpoklady byly zjištěny před `azd up`

#### Změněno
- **🔐 Pokyny k autentizaci pro začátečníky** nyní konzistentně považují `azd auth login` za primární cestu pro AZD workflowy, přičemž `az login` je uvedeno jako volitelné, pokud se přímo nepoužívají příkazy Azure CLI
- **📚 Onboardingový postup v Kapitole 1** nyní nasměruje účastníky, aby před instalací, autentizací a prvním nasazením ověřili své lokální nastavení
- **🛠️ Zprávy validátoru** nyní jasně oddělují blokující požadavky od volitelných varování Azure CLI pro cestu určenou pouze pro začátečníky používající AZD
- **📖 Konfigurační, řešení potíží a ukázkové dokumenty** nyní rozlišují mezi povinnou AZD autentizací a volitelným přihlášením do Azure CLI tam, kde byly dříve oba přístupy prezentovány bez kontextu

#### Opraveno
- **📋 Zbývající anglické odkazy na příkazy** aktualizovány na aktuální tvary AZD, včetně `azd config show` v cheat sheetu a `azd monitor --overview` tam, kde bylo zamýšleno přehledové vedení v Azure Portal
- **🧭 Afirmace pro začátečníky v Kapitole 1** zmírněny, aby se zabránilo přehnaným slibům o zaručeném bezchybovém chování nebo rollbacku napříč všemi šablonami a zdroji Azure
- **🔎 Live CLI validace** potvrdila aktuální podporu pro `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

### [v3.19.0] - 2026-03-26

#### Validace AZD 1.23.12, rozšíření prostředí workshopu a aktualizace doporučení AI modelů
**Tato verze provádí kontrolu dokumentace vůči `azd` `1.23.12`, aktualizuje zastaralé příklady příkazů AZD, obnovuje doporučení AI modelů na aktuální výchozí hodnoty a rozšiřuje pokyny pro workshop nad rámec GitHub Codespaces tak, aby podporovaly i dev kontejnery a lokální klony.**

#### Přidáno
- **✅ Poznámky k validaci napříč hlavními kapitolami a dokumentací workshopu**, aby byla pro účastníky explicitní testovaná základna AZD při použití novějších nebo starších verzí CLI
- **⏱️ Doporučení pro timeout nasazení** pro dlouhotrvající nasazení AI aplikací s `azd deploy --timeout 1800`
- **🔎 Kroky pro kontrolu rozšíření** s `azd extension show azure.ai.agents` v dokumentaci AI workflowů
- **🌐 Širší pokrytí prostředí workshopu** zahrnující GitHub Codespaces, dev kontejnery a lokální klony s MkDocs

#### Změněno
- **📚 Úvodní README kapitol** nyní konzistentně uvádějí validaci proti `azd 1.23.12` v sekcích foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting a production
- **🛠️ Odkazy na příkazy AZD** aktualizovány na aktuální formy napříč dokumentací:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` nebo `azd env get-value(s)` podle kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kde je zamýšlen přehled Application Insights
- **🧪 Příklady preview provisionu** zjednodušeny na aktuálně podporované použití jako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Workflow workshopu** aktualizován tak, aby účastníci mohli dokončit laby v Codespaces, dev kontejneru nebo lokálním klonu místo předpokladu spuštění pouze v Codespaces
- **🔐 Pokyny k autentizaci** nyní preferují `azd auth login` pro AZD workflowy, přičemž `az login` je umístěno jako volitelné, když se přímo používají příkazy Azure CLI

#### Opraveno
- **🪟 Windows instalační příkazy** normalizovány na aktuální zápis `winget` v instalační příručce
- **🐧 Linux instalační pokyny** opraveny, aby se zabránilo nepodporovaným distro-specifickým instrukcím pro správce balíků `azd` a místo toho směřovaly na release assets, kde je to vhodné
- **📦 Příklady AI modelů** obnoveny z dřívějších výchozích hodnot jako `gpt-35-turbo` a `text-embedding-ada-002` na současné příklady jako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Úryvky nasazení a diagnostiky** opraveny tak, aby používaly aktuální příkazy pro prostředí a stav v logech, skriptech a krocích řešení potíží
- **⚙️ Pokyny pro GitHub Actions** aktualizovány z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny k souhlasu MCP/Copilot** aktualizovány z `azd mcp consent` na `azd copilot consent list`

#### Vylepšeno
- **🧠 Pokyny v kapitole AI** nyní lépe vysvětlují chování `azd ai` citlivé na preview, přihlášení v rámci tenantů, aktuální použití rozšíření a doporučení pro nasazení modelů
- **🧪 Instrukce workshopu** nyní používají realističtější příklady verzí a jasnější jazyk pro nastavení prostředí v praktických cvičeních
- **📈 Dokumentace pro produkci a řešení potíží** nyní lépe odpovídá současným příkladům monitorování, fallback modelů a úrovní nákladů

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

### [v3.18.0] - 2026-03-16

#### Příkazy AZD AI CLI, validace obsahu a rozšíření šablon
**Tato verze přidává pokrytí příkazů `azd ai`, `azd extension` a `azd mcp` napříč všemi kapitolami souvisejícími s AI, opravuje nefunkční odkazy a zastaralý kód v agents.md, aktualizuje cheat sheet a kompletně předělává sekci Example Templates s ověřenými popisy a novými AZD šablonami pro Azure AI.**

#### Přidáno
- **🤖 Pokrytí AZD AI CLI** v 7 souborech (dříve pouze v Kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekce "Extensions and AI Commands" představující `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s porovnávací tabulkou (přístup podle šablony vs manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekce "AZD Extensions for Foundry" a "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start nyní ukazuje cesty nasazení založené jak na šablonách, tak na manifestech
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekce Deploy nyní zahrnuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekce "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nová sekce "AI & Extensions Commands" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI ukázkové šablony** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat používající Langchain4J s možnostmi nasazení na ACA/AKS
  - **contoso-creative-writer** — Multi-agent pro kreativní psaní používající Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG využívající Azure Functions + LangChain.js + Cosmos DB s podporou lokálního vývoje s Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový akcelerátor RAG s administrátorským portálem, integrací do Teams a možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenční aplikace pro více agentů s MCP orchestrace a servery v .NET, Python, Java a TypeScriptu
  - **azd-ai-starter** — Minimální Bicep starter šablona pro Azure AI infrastrukturu
  - **🔗 Odkaz na Awesome AZD AI Gallery** — Odkaz na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablon)

#### Opraveno
- **🔗 Navigace v agents.md**: odkazy Previous/Next nyní odpovídají pořadí lekcí v README Kapitoly 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Rozbité odkazy v agents.md**: `production-ai-practices.md` opraveno na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 Zastaralý kód v agents.md**: `opencensus` nahrazeno `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neplatné API v agents.md**: přesunuto `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 Počítání tokenů v agents.md**: nahrazen hrubý odhad `len//4` funkcí `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: opraveny služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (výchozí hostitel změněn v říjnu 2024)
- **contoso-chat**: aktualizován popis tak, aby odkazoval na Azure AI Foundry + Prompty, odpovídající skutečnému názvu repozitáře a technologickému stacku

#### Odebráno
- **ai-document-processing**: odstraněna reference na nefunkční šablonu (repo není veřejně dostupné jako AZD šablona)

#### Vylepšeno
- **📝 Cvičení v agents.md**: Cvičení 1 nyní ukazuje očekávaný výstup a krok `azd monitor`; Cvičení 2 obsahuje kompletní registraci `FunctionTool`; Cvičení 3 nahrazuje nejasné pokyny konkrétními příkazy `prepdocs.py`
- **📚 Zdroje v agents.md**: aktualizovány odkazy na aktuální dokumentaci Azure AI Agent Service a quickstart
- **📋 Tabulka Next Steps v agents.md**: přidán odkaz na AI Workshop Lab pro kompletní pokrytí kapitoly

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
- **Course Map Table**: Vylepšena o přímé odkazy na lekce, odhady délky a hodnocení složitosti
- **Vyčištění složek**: Odebrány nadbytečné staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validace odkazů**: Ověřeno všech 21+ interních odkazů v tabulce Mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty podle aktuálního brandingu Microsoftu.**

#### Změněno
- **Microsoft Foundry → Microsoft Foundry**: Všechny odkazy aktualizovány v souborech, které nejsou překlady
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován, aby odrážel aktuální branding

#### Aktualizované soubory
- `README.md` - Hlavní vstupní stránka kurzu
- `changelog.md` - Historie verzí
- `course-outline.md` - Struktura kurzu
- `docs/chapter-02-ai-development/agents.md` - Průvodce AI agenty
- `examples/README.md` - Dokumentace příkladů
- `workshop/README.md` - Vstupní stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všechny soubory s instrukcemi workshopu

---

### [v3.15.0] - 2026-02-05

#### Hlavní restrukturalizace repozitáře: názvy složek podle kapitol
**Tato verze restrukturalizuje dokumentaci do vyhrazených složek pro kapitoly pro přehlednější navigaci.**

#### Přejmenování složek
Staré složky byly nahrazeny složkami očíslovanými podle kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migrace souborů
| Soubor | Ze | Do |
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
- **📚 README soubory kapitoly**: Vytvořen README.md v každé složce kapitoly s:
  - Cíle učení a délka trvání
  - Tabulka lekcí s popisy
  - Příkazy pro rychlý start
  - Navigace do ostatních kapitol

#### Změněno
- **🔗 Aktualizovány všechny interní odkazy**: 78+ cest aktualizováno napříč všemi dokumenty
- **🗺️ Hlavní README.md**: Aktualizována mapa kurzu s novou strukturou kapitol
- **📝 examples/README.md**: Aktualizovány křížové odkazy na složky kapitol

#### Odstraněno
- Staré členění složek (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace repozitáře: Navigace kapitol
**Tato verze přidala README soubory pro navigaci kapitol (nahrazeno verzí v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový průvodce AI agenty
**Tato verze přidává obsáhlý průvodce nasazením AI agentů pomocí Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce zahrnující:
  - Co jsou AI agenti a jak se liší od chatbotů
  - Tři šablony pro rychlý start agentů (Foundry Agents, Prompty, RAG)
  - Vzory architektury agentů (single agent, RAG, multi-agent)
  - Konfigurace a přizpůsobení nástrojů
  - Monitoring a sledování metrik
  - Úvahy o nákladech a optimalizace
  - Běžné scénáře řešení problémů
  - Tři praktická cvičení s kritérii úspěchu

#### Struktura obsahu
- **Úvod**: Koncepty agentů pro začátečníky
- **Rychlý start**: Nasazení agentů pomocí `azd init --template get-started-with-ai-agents`
- **Vzory architektury**: Vizuální diagramy vzorů agentů
- **Konfigurace**: Nastavení nástrojů a proměnné prostředí
- **Monitoring**: Integrace s Application Insights
- **Cvičení**: Postupné praktické učení (20-45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace prostředí DevContaineru
**Tato verze aktualizuje konfiguraci vývojového kontejneru o moderní nástroje a lepší výchozí nastavení pro zkušenost s AZD.**

#### Změněno
- **🐳 Základní image**: Aktualizováno z `python:3.12-bullseye` na `python:3.12-bookworm` (nejnovější stabilní Debian)
- **📛 Název kontejneru**: Přejmenováno z "Python 3" na "AZD for Beginners" pro přehlednost

#### Přidáno
- **🔧 Nové funkce Dev Containeru**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verze pro šablony AZD)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazení kontejnerových aplikací

- **🔌 Přesměrování portů**: Předkonfigurované porty pro běžný vývoj:
  - 8000 (náhled MkDocs)
  - 3000 (webové aplikace)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšíření VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojů
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Lintování Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramů
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Gitu
  - `mhutchie.git-graph` - Historie Gitu

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro Python interpreter, formátování při uložení a odstraňování bílých znaků

- **📦 Aktualizován requirements-dev.txt**:
  - Přidán MkDocs minify plugin
  - Přidán pre-commit pro kvalitu kódu
  - Přidány balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Příkaz po vytvoření**: Nyní ověřuje instalaci AZD a Azure CLI při spuštění kontejneru

---

### [v3.11.0] - 2026-02-05

#### Přestavba README přívětivého pro začátečníky
**Tato verze výrazně zlepšuje README.md, aby byl přístupnější pro začátečníky, a přidává základní zdroje pro vývojáře AI.**

#### Přidáno
- **🆚 Porovnání Azure CLI vs AZD**: Jasné vysvětlení, kdy použít který nástroj, s praktickými příklady
- **🌟 Skvělé odkazy na AZD**: Přímé odkazy na galerii šablon komunity a zdroje pro přispívání:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ připravených k nasazení šablon
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Komunitní příspěvky
- **🎯 Rychlý průvodce**: Zjednodušená sekce začínáme ve 3 krocích (Instalace → Přihlášení → Nasazení)
- **📊 Tabulka navigace podle zkušeností**: Jasné pokyny, kde začít na základě zkušeností vývojáře

#### Změněno
- **Struktura README**: Přeorganizováno pro postupné odhalování informací - nejdůležitější informace první
- **Sekce Úvod**: Přepsána tak, aby vysvětlovala „Kouzlo `azd up`“ pro úplné začátečníky
- **Odstraněn duplicitní obsah**: Odstraněna duplicitní sekce řešení problémů
- **Příkazy pro řešení problémů**: Opraven odkaz na `azd logs` tak, aby používal platné `azd monitor --logs`

#### Opraveno
- **🔐 Příkazy pro autentizaci**: Přidáno `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na příkazy**: Odebrány zbývající `azd logs` ze sekce řešení problémů v README

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílová skupina**: Vylepšení zaměřená specificky na vývojáře nové v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující příkazy AZD v celé dokumentaci a zajišťuje, že všechny příklady kódu používají platnou syntaxi Azure Developer CLI.**

#### Opraveno
- **🔧 Odstraněny neexistující příkazy AZD**: Komplexní audit a oprava neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo alternativami Azure CLI
  - `azd service` subcommands (neexistují) → nahrazeny `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistují) → odstraněno nebo nahrazeno platnými alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (neexistují) → odstraněny
  - `azd provision --what-if/--rollback` flags (neexistují) → aktualizováno pro použití `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Soubory aktualizované s opravami příkazů**:
  - `resources/cheat-sheet.md`: Hlavní revize referencí příkazů
  - `docs/deployment/deployment-guide.md`: Opraveny rollback a strategie nasazení
  - `docs/troubleshooting/debugging.md`: Opravené sekce analýzy logů
  - `docs/troubleshooting/common-issues.md`: Aktualizované příkazy pro řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Opravené příkazy pro monitoring
  - `docs/getting-started/first-project.md`: Aktualizované příklady monitoringu a ladění
  - `docs/getting-started/installation.md`: Opravené příklady nápovědy a verzí
  - `docs/pre-deployment/application-insights.md`: Opravené příkazy pro zobrazení logů
  - `docs/pre-deployment/coordination-patterns.md`: Opravené příkazy ladění agentů

#### Změněno
- **Strategie rollbacku**: Dokumentace aktualizována tak, aby používala rollback založený na Gitu (AZD nemá nativní rollback)
- **Prohlížení logů**: Odkazy na `azd logs` nahrazeny `azd monitor --logs`, `azd monitor --live` a příkazy Azure CLI
- **Sekce výkonu**: Odebrány neexistující příznaky pro paralelní/incrementální nasazení, poskytnuty platné alternativy

#### Technické detaily
- **Platné příkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné příznaky azd monitor**: `--live`, `--logs`, `--overview`
- **Odebrané funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a aktualizace kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny nefunkční odkazy v dokumentaci a zlepšuje celkovou kvalitu obsahu pro vývojáře AI používající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument se zásadami přispívání obsahující:
  - Jasné instrukce pro hlášení problémů a navrhování změn
  - Standardy dokumentace pro nový obsah
  - Pokyny pro příklady kódu a konvence zpráv o commitech
  - Informace o zapojení komunity

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Plně dokončený závěrečný modul s:
  - Komplexním souhrnem dosažených výsledků workshopu
  - Sekcí klíčových osvojených konceptů pokrývající AZD, šablony a Microsoft Foundry
  - Doporučeními pro pokračování v učící se cestě
  - Cvičeními a výzvami workshopu s hodnocením obtížnosti
  - Odkazy na zpětnou vazbu komunity a podporu

- **📚 Workshop Module 3 (Deconstruct)**: Aktualizované cíle učení s:
  - Pokyny pro aktivaci GitHub Copilot se servery MCP
  - Porozuměním struktuře složek šablon AZD
  - Vzory organizace infrastructure-as-code (Bicep)
  - Instrukcemi k praktickému laboratornímu cvičení

- **🔧 Workshop Module 6 (Teardown)**: Dokončeno s:
  - Cíli úklidu zdrojů a řízení nákladů
  - Použitím `azd down` pro bezpečné odstranění infrastruktury
  - Pokyny pro obnovu soft-deleted kognitivních služeb
  - Bonusovými průzkumnými podněty pro GitHub Copilot a Azure Portal

#### Fixed
- **🔗 Opravy přerušených odkazů**: Vyřešeno 15+ přerušených interních dokumentačních odkazů:
  - `docs/ai-foundry/ai-model-deployment.md`: Opraveny cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opraveny cesty ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazen neexistující cicd-integration.md souborem deployment-guide.md
  - `examples/retail-scenario.md`: Opraveny cesty k FAQ a průvodci řešením problémů
  - `examples/container-app/microservices/README.md`: Opraveny cesty k úvodní stránce kurzu a průvodci nasazením
  - `resources/faq.md` a `resources/glossary.md`: Aktualizovány odkazy v kapitole AI
  - `course-outline.md`: Opraveny odkazy na průvodce instruktora a laboratoř AI workshopu

- **📅 Workshop Status Banner**: Aktualizováno z "Under Construction" na aktivní stav workshopu s datem únor 2026

- **🔗 Workshop Navigation**: Opraveny poškozené navigační odkazy v workshop README.md směřující do neexistující složky lab-1-azd-basics

#### Changed
- **Workshop Presentation**: Odstraněno varování "under construction", workshop je nyní dokončený a připravený k použití
- **Navigation Consistency**: Zajištěno, že všechny moduly workshopu mají správnou mezimodulovou navigaci
- **Learning Path References**: Aktualizovány křížové odkazy kapitol tak, aby použily správné microsoft-foundry cesty

#### Validated
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Moduly workshopu 0-7 jsou dokončeny s cíli učení
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Jazyk a struktura vstřícné k začátečníkům je zachována v celém dokumentu
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro přispěvatele z komunity

#### Technical Implementation
- **Link Validation**: Automatizovaný PowerShell skript ověřil všechny .md interní odkazy
- **Content Audit**: Ruční kontrola úplnosti workshopu a vhodnosti pro začátečníky
- **Navigation System**: Konzistentní vzory kapitol a modulové navigace aplikovány

#### Notes
- **Scope**: Změny aplikovány pouze na anglickou dokumentaci
- **Translations**: Složky překladů v této verzi nebyly aktualizovány (automatizovaný překlad bude synchronizován později)
- **Workshop Duration**: Kompletní workshop nyní poskytuje 3–4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Tato verze přidává komplexní lekce A-grade o integraci Application Insights, authen­tizačních vzorech a koordinaci multi-agentů pro produkční nasazení.**

#### Added
- **📊 Application Insights Integration Lesson**: v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým provisionováním
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Funkční Python aplikace s vlastní telemetrií (1,200+ řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů Microsoft Foundry Models)
  - 6 Mermaid diagramů (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, monitorování AI)
  - Příklady Kusto dotazů a strategie optimalizace nákladů
  - Streaming živých metrik a ladění v reálném čase
  - Doba učení 40–50 minut s produkčními vzory

- **🔐 Authentication & Security Patterns Lesson**: v `docs/getting-started/authsecurity.md`:
  - 3 autentizační vzory (connection strings, Key Vault, managed identity)
  - Kompletní Bicep infrastrukturní šablony pro zabezpečená nasazení
  - Node.js aplikační kód s integrací Azure SDK
  - 3 kompletní cvičení (povolení managed identity, user-assigned identity, rotace Key Vault)
  - Nejlepší bezpečnostní postupy a konfigurace RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkčně připravené vzory bezheslové autentizace

- **🤖 Multi-Agent Coordination Patterns Lesson**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinačních vzorů (sekvenční, paralelní, hierarchický, event-driven, consensus)
  - Kompletní implementace orchestrátoru služby (Python/Flask, 1,500+ řádků)
  - 3 specializované implementace agentů (Research, Writer, Editor)
  - Integrace Service Bus pro frontování zpráv
  - Správa stavu v Cosmos DB pro distribuované systémy
  - 6 Mermaid diagramů zobrazujících interakce agentů
  - 3 pokročilá cvičení (zpracování timeoutů, retry logika, circuit breaker)
  - Rozpis nákladů ($240-565/month) s optimalizačními strategiemi
  - Integrace Application Insights pro monitorování

#### Enhanced
- **Pre-deployment Chapter**: Nyní obsahuje komplexní monitoring a koordinační vzory
- **Getting Started Chapter**: Vylepšen o profesionální autentizační vzory
- **Production Readiness**: Kompletní pokrytí od bezpečnosti po observability
- **Course Outline**: Aktualizováno tak, aby odkazovalo na nové lekce v Kapitolách 3 a 6

#### Changed
- **Learning Progression**: Lepší integrace bezpečnosti a monitorování napříč kurzem
- **Documentation Quality**: Konzistentní A-grade standardy (95–97%) napříč novými lekcemi
- **Production Patterns**: Kompletní end-to-end pokrytí pro podniková nasazení

#### Improved
- **Developer Experience**: Jasná cesta od vývoje k produkčnímu monitorování
- **Security Standards**: Profesionální vzory pro autentizaci a správu tajemství
- **Observability**: Kompletní integrace Application Insights s AZD
- **AI Workloads**: Specializované monitorování pro Microsoft Foundry Models a multi-agentní systémy

#### Validated
- ✅ Všechny lekce obsahují kompletní funkční kód (ne jen ukázky)
- ✅ Mermaid diagramy pro vizuální učení (celkem 19 napříč 3 lekcemi)
- ✅ Praktická cvičení s verifikačními kroky (celkem 9)
- ✅ Produkčně připravené Bicep šablony deployovatelné přes `azd up`
- ✅ Analýza nákladů a optimalizační strategie
- ✅ Průvodci řešením problémů a nejlepší postupy
- ✅ Kontrolní body znalostí s verifikačními příkazy

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitoringem
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé multi-agentní architektury
- **Overall New Content**: - Konzistentní vysoce kvalitní standardy

#### Technical Implementation
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Authentication**: Managed Identity + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrace
- **Monitoring**: Live metriky + Kusto dotazy + alerty + dashboardy
- **Cost Management**: Strategie vzorkování, politiky retence, kontrola rozpočtů

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**Tato verze zlepšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Kompletní nasazení gpt-4.1 s fungující implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Microsoft Foundry Models (nasazení modelu gpt-4.1)
  - Python příkazové rozhraní pro chat s historií konverzace
  - Integrace Key Vault pro bezpečné ukládání API klíčů
  - Sledování využití tokenů a odhad nákladů
  - Omezování rychlosti (rate limiting) a zpracování chyb
  - Komplexní README s průvodcem nasazením na 35–45 minut
  - 11 produkčně připravených souborů (Bicep šablony, Python aplikace, konfigurace)
- **📚 Dokumentační cvičení**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Víceprostředí konfigurace (15 minut)
  - Cvičení 2: Práce s managementem tajemství (10 minut)
  - Jasná kritéria úspěchu a verifikační kroky
- **✅ Deployment Verification**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontrol zdraví
  - Kontrolní seznam kritérií úspěchu
  - Očekávané výstupy pro všechny příkazy nasazení
  - Rychlá reference pro řešení problémů

#### Enhanced
- **examples/README.md**: Aktualizováno na A-grade kvalitu (93%):
  - Přidán azure-openai-chat do všech relevantních sekcí
  - Aktualizován počet lokálních příkladů z 3 na 4
  - Přidáno do tabulky AI Application Examples
  - Integrované do Quick Start pro středně pokročilé uživatele
  - Přidáno do sekce Microsoft Foundry Templates
  - Aktualizována komparační matice a sekce hledání technologií
- **Documentation Quality**: Zlepšeno z B+ (87%) → A- (92%) v celém složce docs:
  - Přidány očekávané výstupy k důležitým příkladům příkazů
  - Zahrnuty verifikační kroky pro změny konfigurace
  - Vylepšeno praktické učení s praktickými cvičeními

#### Changed
- **Learning Progression**: Lepší integrace AI příkladů pro středně pokročilé studenty
- **Documentation Structure**: Více akčních cvičení s jasnými výsledky
- **Verification Process**: Explicitní kritéria úspěchu přidána do klíčových pracovních postupů

#### Improved
- **Developer Experience**: Nasazení Microsoft Foundry Models nyní trvá 35–45 minut (oproti 60–90 pro složitější alternativy)
- **Cost Transparency**: Jasné odhady nákladů ($50-200/month) pro příklad Microsoft Foundry Models
- **Learning Path**: AI vývojáři mají jasný vstupní bod s azure-openai-chat
- **Documentation Standards**: Konzistentní očekávané výstupy a verifikační kroky

#### Validated
- ✅ Příklad Microsoft Foundry Models plně funkční s `azd up`
- ✅ Všechny 11 implementačních souborů syntakticky správné
- ✅ Instrukce v README odpovídají skutečnému nasazovacímu zážitku
- ✅ Dokumentační odkazy aktualizovány na 8+ místech
- ✅ Index příkladů přesně odráží 4 lokální příklady
- ✅ Žádné duplicitní externí odkazy v tabulkách
- ✅ Všechny navigační reference správné

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps vzor
- **Security**: Připravené Managed Identity, tajemství v Key Vault
- **Monitoring**: Integrace Application Insights
- **Cost Management**: Sledování tokenů a optimalizace využití
- **Deployment**: Jediný příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Tato verze zavádí komplexní, produkčně připravené příklady nasazení kontejnerových aplikací pomocí Azure Developer CLI (AZD), s plnou dokumentací a integrací do učební cesty.**

#### Added
- **🚀 Container App Examples**: Nové lokální příklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletní přehled kontejnerových nasazení, rychlý start, produkce a pokročilé vzory
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API pro začátečníky s scale-to-zero, health probes, monitoringem a řešením problémů
  - [Microservices Architecture](../../examples/container-app/microservices): Produkčně připravené nasazení více služeb (API Gateway, Product, Order, User, Notification), asynchronní messaging, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary nasazení
- **Best Practices**: Bezpečnost, monitoring, optimalizace nákladů a CI/CD doporučení pro kontejnerové pracovní zátěže
- **Code Samples**: Kompletní `azure.yaml`, Bicep šablony a implementace služeb v několika jazycích (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testovací scénáře, příkazy pro monitoring, průvodce řešením problémů

#### Changed
- **README.md**: Aktualizováno, aby zobrazovalo a odkazovalo nové příklady container app pod "Local Examples - Container Applications"
- **examples/README.md**: Aktualizováno, aby zvýraznilo container app příklady, přidalo záznamy do komparační matice a aktualizovalo odkazy na technologie/architekturu
- **Course Outline & Study Guide**: Aktualizovány tak, aby odkazovaly na nové příklady container app a vzory nasazení v příslušných kapitolách

#### Validated
- ✅ Všechny nové příklady deployovatelné pomocí `azd up` a dodržují best practices
- ✅ Dokumentační křížové odkazy a navigace aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé, včetně produkčních mikroservis

#### Notes
- **Scope**: Anglická dokumentace a příklady pouze
- **Next Steps**: Rozšířit o další pokročilé kontejnerové vzory a automatizaci CI/CD v budoucích vydáních

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Tato verze implementuje komplexní změnu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" v celé anglické dokumentaci, odrážející oficiální rebranding Microsoftu.**

#### Changed
- **🔄 Product Name Update**: Kompletní rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizovány všechny reference napříč anglickou dokumentací ve složce `docs/`
  - Přejmenovaná složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references updated
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already using Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references updated (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links updated
  - `docs/getting-started/first-project.md` - 2 chapter navigation links updated
  - `docs/getting-started/installation.md` - 2 next chapter links updated
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references updated (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link updated
  - `docs/troubleshooting/debugging.md` - 1 navigation link updated

- **Course Structure Files** (2 files):
  - `README.md` - 17 references updated (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references updated (overview, learning objectives, chapter resources)

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Notes
- **Scope**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

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
- **🧪 azd provision --preview Feature Documentation**: Comprehensive coverage of the new infrastructure preview capability
  - Command reference and usage examples in cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner indicating workshop development status
  - Gradient design with construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality integrated throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation moved earlier in learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes can now be validated before deployment
- **Team Collaboration**: Preview results can be shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevents confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience with MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for enhanced learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended with comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for streamlined development workflows

#### Improved
- **Accessibility**: Browser-based interface with search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure accommodating different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for enhanced understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructured entire course into 8 progressive learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Consistent navigation headers and footers across all documentation
- **🎯 Progress Tracking**: Course completion checklist and learning verification system
- **🗺️ Learning Path Guidance**: Clear entry points for different experience levels and goals
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Transformed into a structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now includes chapter context and progression guidance
- **Template Organization**: Examples and templates mapped to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connected to relevant chapters
- **Workshop Integration**: Hands-on labs mapped to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Moved from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Repositioned configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout the learning journey
- **Production Content**: Advanced patterns consolidated in Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure suitable for academic and corporate training
- **Learning Efficiency**: Reduced time to find relevant content through improved organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clearly associated with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter includes specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

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
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure prioritizing AI developers and engineers
- **Microsoft Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide covering model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2–3 hodinový praktický workshop pro převod AI aplikací na řešení nasaditelná pomocí AZD
- **Production AI Best Practices**: Vzory připravené pro podnikové nasazení pro škálování, monitorování a zabezpečení AI zátěží
- **AI-Specific Troubleshooting Guide**: Komplexní návod pro řešení problémů s Microsoft Foundry Modely, Cognitive Services a nasazením AI
- **AI Template Gallery**: Vybraná kolekce šablon Microsoft Foundry s hodnocením složitosti
- **Workshop Materials**: Kompletní struktura workshopu s praktickými laboratořemi a referenčními materiály

#### Vylepšené
- **README Structure**: Zaměřeno na AI vývojáře s 45% datem zájmu komunity z Microsoft Foundry Discord
- **Learning Paths**: Dedikovaná cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Template Recommendations**: Vybrané AI šablony včetně azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Community Integration**: Rozšířená podpora komunity na Discordu s kanály a diskusemi specifickými pro AI

#### Security & Production Focus
- **Managed Identity Patterns**: Vzory spravovaných identit pro autentizaci a bezpečnost specifickou pro AI
- **Cost Optimization**: Sledování využití tokenů a kontrola rozpočtu pro AI zátěže
- **Multi-Region Deployment**: Strategie pro globální nasazení AI aplikací
- **Performance Monitoring**: Metriky specifické pro AI a integrace s Application Insights

#### Documentation Quality
- **Linear Course Structure**: Logický postup od začátečníka po pokročilé vzory nasazení AI
- **Validated URLs**: Všechny externí odkazy na repozitáře ověřeny a přístupné
- **Complete Reference**: Všechny interní odkazy v dokumentaci ověřeny a funkční
- **Production Ready**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Tato verze představuje zásadní přepracování struktury repozitáře a prezentace obsahu.**

#### Added
- **Structured Learning Framework**: Všechny stránky dokumentace nyní obsahují sekce Introduction, Learning Goals a Learning Outcomes
- **Navigation System**: Přidány odkazy Previous/Next lesson napříč dokumentací pro řízený postup učení
- **Study Guide**: Komplexní study-guide.md s cíli učení, cvičeními a hodnotícími materiály
- **Professional Presentation**: Odstraněny všechny emoji ikony pro lepší přístupnost a profesionální vzhled
- **Enhanced Content Structure**: Vylepšená organizace a tok výukových materiálů

#### Changed
- **Documentation Format**: Standardizována veškerá dokumentace s konzistentní strukturou orientovanou na učení
- **Navigation Flow**: Implementován logický postup napříč všemi výukovými materiály
- **Content Presentation**: Odstraněny dekorativní prvky ve prospěch jasného, profesionálního formátování
- **Link Structure**: Aktualizovány všechny interní odkazy pro podporu nového navigačního systému

#### Improved
- **Accessibility**: Odstraněna závislost na emoji pro lepší kompatibilitu se čtečkami obrazovky
- **Professional Appearance**: Čisté, akademické zobrazení vhodné pro podnikové vzdělávání
- **Learning Experience**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Content Organization**: Lepší logický tok a provázání souvisejících témat

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Kompletní průvodce getting-started
  - Komplexní dokumentace k nasazení a provisioning
  - Podrobné zdroje pro řešení problémů a návody pro debugování
  - Nástroje a postupy pro přednasazovací validaci

- **Getting Started Module**
  - AZD Basics: Základní koncepty a terminologie
  - Installation Guide: Instrukce pro instalaci specifické pro platformu
  - Configuration Guide: Nastavení prostředí a autentizace
  - First Project Tutorial: Krok za krokem praktické učení

- **Deployment and Provisioning Module**
  - Deployment Guide: Kompletní dokumentace pracovního postupu
  - Provisioning Guide: Infrastruktura jako kód s Bicep
  - Best practices pro produkční nasazení
  - Vzory více služeb v architektuře

- **Pre-deployment Validation Module**
  - Capacity Planning: Ověření dostupnosti Azure prostředků
  - SKU Selection: Komplexní doporučení úrovní služeb
  - Pre-flight Checks: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Troubleshooting Module**
  - Common Issues: Často se vyskytující problémy a jejich řešení
  - Debugging Guide: Systematické metodiky odstraňování problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Resources and References**
  - Command Cheat Sheet: Rychlá reference pro základní příkazy
  - Glossary: Kompletní definice terminologie a zkratek
  - FAQ: Podrobné odpovědi na časté dotazy
  - Externí odkazy a propojení s komunitou

- **Examples and Templates**
  - Příklad jednoduché webové aplikace
  - Šablona pro nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databází
  - Příklady mikroservisní architektury
  - Implementace serverless funkcí

#### Features
- **Multi-Platform Support**: Příručky instalace a konfigurace pro Windows, macOS a Linux
- **Multiple Skill Levels**: Obsah navržený pro studenty i profesionální vývojáře
- **Practical Focus**: Praktické příklady a scénáře z reálného světa
- **Comprehensive Coverage**: Od základních konceptů po pokročilé podnikové vzory
- **Security-First Approach**: Bezpečnostní osvědčené postupy integrovány napříč
- **Cost Optimization**: Doporučení pro nákladově efektivní nasazení a správu prostředků

#### Documentation Quality
- **Detailed Code Examples**: Praktické, otestované ukázky kódu
- **Step-by-Step Instructions**: Jasné, akční pokyny
- **Comprehensive Error Handling**: Řešení běžných chyb
- **Best Practices Integration**: Průmyslové standardy a doporučení
- **Version Compatibility**: Aktuální s nejnovějšími službami Azure a funkcemi azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Vzorové integrace pro Hugging Face, Azure Machine Learning a vlastní modely
- **AI Agent Frameworks**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Advanced RAG Patterns**: Možnosti vektorových databází mimo Azure AI Search (Pinecone, Weaviate, atd.)
- **AI Observability**: Vylepšené monitorování výkonu modelů, využití tokenů a kvality odpovědí

#### Developer Experience
- **VS Code Extension**: Integrované vývojové prostředí AZD + Microsoft Foundry ve VS Code
- **GitHub Copilot Integration**: AI asistent pro generování AZD šablon
- **Interactive Tutorials**: Praktická cvičení s automatizovanou validací pro AI scénáře
- **Video Content**: Doplňující video tutoriály pro vizuální učící se zaměřené na nasazení AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Governance modelů AI, shoda a auditní stopy
- **Multi-Tenant AI**: Vzory pro obsluhu více zákazníků s izolovanými AI službami
- **Edge AI Deployment**: Integrace s Azure IoT Edge a kontejnerovými instancemi
- **Hybrid Cloud AI**: Multi-cloud a hybridní vzory nasazení AI zátěží

#### Advanced Features
- **AI Pipeline Automation**: Integrace MLOps s Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust vzory, private endpoints a pokročilá ochrana proti hrozbám
- **Performance Optimization**: Pokročilé ladění a škálovací strategie pro aplikace s vysokou propustností AI
- **Global Distribution**: Vzory doručení obsahu a edge cache pro AI aplikace

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Komplexní integrace Microsoft Foundry (Dokončeno)
- ✅ **Interactive Tutorials**: Praktický AI workshop lab (Dokončeno)
- ✅ **Advanced Security Module**: Bezpečnostní vzory specifické pro AI (Dokončeno)
- ✅ **Performance Optimization**: Strategie ladění AI zátěží (Dokončeno)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Nasazovací scénáře zaměřené na AI (Dokončeno)
- ✅ **Extended FAQ**: Otázky a řešení specifické pro AI (Dokončeno)
- **Tool Integration**: Rozšířené příručky pro integraci IDE a editorů
- ✅ **Monitoring Expansion**: Monitorování a alertování specifické pro AI (Dokončeno)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responzivní design pro mobilní učení
- **Offline Access**: Stáhnutelné balíčky dokumentace
- **Enhanced IDE Integration**: Rozšíření VS Code pro AZD + AI pracovní postupy
- **Community Dashboard**: Reálná metrika komunity a sledování příspěvků

## Contributing to the Changelog

### Reporting Changes
Při přispívání do tohoto repozitáře zajistěte, prosím, aby záznamy v changelogu obsahovaly:

1. **Version Number**: Podle semantického verzování (major.minor.patch)
2. **Date**: Datum vydání nebo aktualizace ve formátu YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Stručný popis změny
5. **Impact Assessment**: Jak změny ovlivní stávající uživatele

### Change Categories

#### Added
- Nové funkce, sekce dokumentace nebo možnosti
- Nové příklady, šablony nebo vzdělávací zdroje
- Dodatečné nástroje, skripty nebo utilitky

#### Changed
- Úpravy stávající funkčnosti nebo dokumentace
- Aktualizace pro zlepšení srozumitelnosti nebo přesnosti
- Přestrukturování obsahu nebo organizace

#### Deprecated
- Funkce nebo přístupy, které se zavádějí do fáze vyřazování
- Sekce dokumentace plánované k odstranění
- Metody, které mají lepší alternativy

#### Removed
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo přístupy
- Redundantní nebo konsolidovaný obsah

#### Fixed
- Opravy chyb v dokumentaci nebo kódu
- Vyřešení nahlášených problémů
- Zlepšení přesnosti nebo funkčnosti

#### Security
- Bezpečnostní zlepšení nebo opravy
- Aktualizace bezpečnostních osvědčených postupů
- Řešení bezpečnostních zranitelností

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Zásadní změny vyžadující akci uživatele
- Významné přestrukturování obsahu nebo organizace
- Změny, které mění základní přístup nebo metodologii

#### Minor Version (X.Y.0)
- Nové funkce nebo doplnění obsahu
- Vylepšení zachovávající zpětnou kompatibilitu
- Dodatečné příklady, nástroje nebo zdroje

#### Patch Version (X.Y.Z)
- Opravy chyb a korekce
- Drobná vylepšení stávajícího obsahu
- Upřesnění a malé rozšíření

## Community Feedback and Suggestions

Aktivně vybízíme komunitu k poskytnutí zpětné vazby pro zlepšení tohoto výukového zdroje:

### How to Provide Feedback
- **GitHub Issues**: Nahlaste problémy nebo navrhněte vylepšení (dotazy specifické pro AI vítány)
- **Discord Discussions**: Sdílejte nápady a zapojte se do komunity Microsoft Foundry
- **Pull Requests**: Přímo přispějte k obsahu, zejména AI šablonami a návody
- **Microsoft Foundry Discord**: Zapojte se do kanálu #Azure pro diskuse o AZD + AI
- **Community Forums**: Zapojte se do širších diskusí vývojářů Azure

### Feedback Categories
- **AI Content Accuracy**: Opravy informací o integraci a nasazení služeb AI
- **Learning Experience**: Návrhy na zlepšení toku učení pro AI vývojáře
- **Missing AI Content**: Požadavky na doplnění AI šablon, vzorů nebo příkladů
- **Accessibility**: Vylepšení pro různé potřeby učení
- **AI Tool Integration**: Návrhy na lepší integraci pracovních postupů pro vývoj AI
- **Production AI Patterns**: Požadavky na podnikové vzory nasazení AI

### Response Commitment
- **Issue Response**: Do 48 hodin na nahlášené problémy
- **Feature Requests**: Vyhodnocení do jednoho týdne
- **Community Contributions**: Revize do jednoho týdne
- **Security Issues**: Okamžitá priorita s urychlenou odezvou

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Kontrola přesnosti obsahu a ověření odkazů
- **Quarterly Updates**: Významné doplňky obsahu a vylepšení
- **Semi-Annual Reviews**: Komplexní přestrukturování a rozšíření
- **Annual Releases**: Hlavní aktualizace verzí s významnými vylepšeními

### Monitoring and Quality Assurance
- **Automated Testing**: Pravidelná validace ukázek kódu a odkazů
- **Community Feedback Integration**: Pravidelné začleňování návrhů uživatelů
- **Technology Updates**: Soulad s nejnovějšími službami Azure a vydáními azd
- **Accessibility Audits**: Pravidelné kontroly pro inkluzivní návrhové principy

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Plná podpora s pravidelnými aktualizacemi
- **Previous Major Version**: Bezpečnostní aktualizace a kritické opravy po dobu 12 měsíců
- **Legacy Versions**: Pouze komunitní podpora, žádné oficiální aktualizace

### Migration Guidance
Při vydání hlavních verzí poskytujeme:
- **Migration Guides**: Krok za krokem instrukce pro přechod
- **Compatibility Notes**: Detaily o zlomových změnách
- **Tool Support**: Skripty nebo utilitky pro podporu migrace
- **Community Support**: Vyhrazená fóra pro otázky ohledně migrace

---

**Navigace**
- **Předchozí lekce**: [Příručka ke studiu](resources/study-guide.md)
- **Následující lekce**: Návrat na [Hlavní README](README.md)

**Zůstaňte v obraze**: Sledujte tento repozitář pro oznámení o nových vydáních a důležitých aktualizacích výukových materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
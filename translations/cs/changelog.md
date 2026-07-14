# Záznam změn - AZD pro začátečníky

## Úvod

Tento záznam změn dokumentuje všechny významné změny, aktualizace a vylepšení úložiště AZD pro začátečníky. Dodržujeme zásady sémantického verzování a udržujeme tento záznam, aby uživatelé porozuměli tomu, co se mezi verzemi změnilo.

## Výukové cíle

Prohlédnutím tohoto záznamu změn budete:
- Informováni o nových funkcích a doplnění obsahu
- Chápat vylepšení stávající dokumentace
- Sledovat opravy chyb a korekce pro zajištění přesnosti
- Sledovat vývoj učebních materiálů v čase

## Výstupy učení

Po prostudování záznamu změn budete schopni:
- Identifikovat nový obsah a zdroje dostupné k učení
- Chápat, které sekce byly aktualizovány nebo vylepšeny
- Naplánovat si vzdělávací cestu na základě nejaktuálnějších materiálů
- Přispívat zpětnou vazbou a návrhy pro budoucí vylepšení

## Historie verzí

### [v3.23.0] - 2026-07-13

#### Aktualizace na AZD 1.27.1: Aktualizace aktuálnosti verze
**Tato verze znovu ověřuje kurz vůči `azd` `1.27.1` (červenec 2026, nejnovější stabilní vydání) a aktuálnímu preview rozšíření AI agentů `azure.ai.agents` `1.0.0-beta.5`, přičemž všechny bannery „ověřeno vůči“ jsou po vydáních 1.26.0, 1.27.0 a 1.27.1 aktuální.**

#### Změněno
- **✅ Aktualizována validační základna** z `azd 1.25.6` (červen 2026) na `azd 1.27.1` (červenec 2026) na hlavní stránce README, ve všech kapitolových README, lekci dev-containeru v kapitole 1 (včetně příkladů s připnutou verzí), lekci custom-templates v kapitole 4, lekci multi-agent v kapitole 5 a workshopových dokumentech
- **🤖 Základna kapitoly 2 aktualizována** z `azd 1.23.12` (březen 2026) na `azd 1.27.1` v souborech `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` a `microsoft-foundry-integration.md`; data validačních poznámek aktualizována na 2026-07-13
- **🧩 Aktualizováno rozšíření AI agentů** z verze `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na aktuální verzi `1.0.0-beta.5` v README kapitoly 2 a `agents.md`
- **🧪 Ukázka ověření workshopu** (`azd version` výstup) aktualizována na `1.27.1`

#### Poznámky k relevantním vydáním azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora Go pro Azure Functions na Flex Consumption, `azd config sub-filter` filtry předplatného na tenant, samostatné balíčky rozšíření (`azd x pack --bundle`) a `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelování Azure AI Foundry projektů/agentů přímo v `azure.yaml` (init bez Bicep/Terraform), podpora nasazení kontejneru pro App Service (`host: appservice` + `language: docker`), přímý `-s/--source` pro příkazy `azd extension` a `azd tool uninstall`
- **1.27.1 (2026-07-09):** Příznak `--no-dependencies` pro `azd extension install`, výchozí vyloučení zastaralých modelů z katalogu/promptů kvóty a několik oprav chyb

#### Aktualizované soubory
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Vyplnění mezer pro začátečníky #2: Tvorba šablon, Dev kontejnery, Pulumi, Azure DevOps, Servisní principy a více
**Tato verze zavírá zbývající mezery středně pokročilé úrovně z analýzy pokrytí azd: jak vytvořit a publikovat vlastní šablonu, reprodukovatelné dev-container/Codespaces prostředí, poskytovatel infrastruktury Pulumi, průvodce CI/CD v Azure DevOps, autentizace service-principals, pokyny pro výběr hostů (AKS/Spring Apps), vysvětlení `azd restore`/`azd package`, zpracování chyb v hookech a praktiky týmových/společných prostředí.**

#### Přidáno
- **🧱 Nová lekce v kapitole 4** `docs/chapter-04-infrastructure/custom-templates.md` — vytváření vlastní šablony azd: požadovaná struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametrizace infrastruktury pomocí unikátního tokenu `uniqueString()` a tagu `azd-env-name`, lokální testování s `azd init --template <local-path>`, publikace na GitHub a odeslání do galerie Awesome AZD
- **📦 Nová lekce v kapitole 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovatelné azd prostředí pomocí Dev kontejnerů a GitHub Codespaces: minimalistický `.devcontainer/devcontainer.json` využívající oficiální funkci `ghcr.io/azure/azure-dev/azd`, jazykově specifické funkce, `docker-in-docker` pro hostitele kontejnerů a `azd auth login --use-device-code` pro vzdálené přihlášení
- **🧩 Sekce Pulumi s azd** v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, struktura složek Pulumi, mapování stacků na prostředí azd, požadované výstupy/tagování a identický workflow `azd up` / `azd down`
- **🎯 Pokyny pro výběr hosta** v `docs/chapter-04-infrastructure/provisioning.md` — začátečnicky přívětivé srovnání `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp` s radami, kdy zvolit AKS nebo Azure Spring Apps
- **🛠️ Průvodce CI/CD v Azure DevOps** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisní připojení s workload identity federation (OIDC), generovaný `azure-dev.yml` a nastavení skupiny proměnných
- **🔑 Servisní principy (vzorec 4)** přidány do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivní `azd auth login` s klientským tajemstvím vs. federované/OIDC přihlašovací údaje, kdy použít a bezpečné uchovávání přihlašovacích údajů
- **🪝 Podsekce zpracování chyb hooků** v `docs/chapter-04-infrastructure/deployment-guide.md` — ukončovací kódy a `set -e`, `continueOnError`, testování hooků izolovaně s `azd hooks run`, OS-specifické shelly a `--debug`
- **👥 Sekce týmových/společných prostředí** v `docs/chapter-03-configuration/configuration.md` — co je v `.azure/`, co ignorovat v gitu, prostředí na vývojáře, `azd env list`/`select` a poskytování hodnot prostředí v CI/CD
- **🧰 Vysvětlení `azd restore` a rozšířeného `azd package`** v `resources/cheat-sheet.md` — obnovení závislostí a vytvoření deploy-ovatelného artefaktu bez nasazení

#### Změněno
- **🧭 Aktualizace tabulky lekcí kapitoly 4** pro zahrnutí nové lekce „Vytváření vlastní šablony“ (Lekce 3)
- **🧭 Aktualizace tabulky lekcí kapitoly 1** pro zahrnutí nové lekce „Dev kontejnery & Codespaces“ (Lekce 5); navigační patičky propojeny mezi `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Vyplnění mezer pro začátečníky: Praktická lekce více agentů, „přineste si vlastní aplikaci,“ Terraform a průvodce CI/CD
**Tato verze zavírá největší mezery pro kompletní příručku pro začátečníky přidáním dvou nových praktických lekcí (nasaditelný průchod více agentů a přidání azd do existující aplikace), úvod do hooků pro začátečníky, sekce Terraform s azd, krok-za-krokem průvodce pipeline GitHub Actions, vysvětlení nových preview rozšíření a explicitní kontrolní seznam pro ověření nasazení.**

#### Přidáno
- **🤝 Nová lekce v kapitole 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plně praktický, nasaditelný dvouagentní průchod (orchestrátor + specialisté) s reálnou šablonou (`contoso-creative-writer`), pokrývá kdy použít více agentů, workflow `azd up`, pochopení nasazených zdrojů, křížové trasování agentů, přizpůsobení a úklid
- **📦 Nová lekce v kapitole 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak přidat azd do existujícího projektu s `azd init` („použít kód v aktuálním adresáři“), pochopení `azure.yaml` a `infra/`, `azd infra generate`, detekce hostitele a nasazení s `azd up`
- **🌐 Sekce Terraform s azd** přidána do `docs/chapter-04-infrastructure/provisioning.md` — konfigurace `infra.provider: terraform`, struktura `.tf` složek, požadované výstupy `AZURE_*` a tagování `azd-env-name` a identický workflow `azd up` / `azd down` (uzavírá mezeru, kde byla tvrdena podpora Terraform, ale ukázán byl jen Bicep)
- **⚙️ Krok-za-krokem průvodce GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitáře po automatizované nasazení: `azd pipeline config`, OIDC federované přihlašovací údaje (neexistují uložené tajemství), generovaný `azure-dev.yml` a rady ohledně tajemství vs. proměnných
- **🪝 Úvod „Nový v hookech?“ pro začátečníky** v `docs/chapter-04-infrastructure/deployment-guide.md` — co je hook, tabulka fází hooků, minimální první hook a manuální spuštění hooků s `azd hooks run`
- **✅ Přidán kontrolní seznam „Ověřte své nasazení“** do kroku 5 `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola zdraví endpointu a explicitní kritéria úspěchu
- **🧩 Vysvětlení nových preview rozšíření** `azure.ai.skills` a `azure.ai.connections` (co to je a kdy je použít) v `docs/chapter-08-production/production-ai-practices.md`

#### Změněno
- **🧭 Oprava tabulky lekcí kapitoly 5**: `multi-agent-basics.md` je nyní Lekce 1 (jediná plně praktická lekce), s poctivým označením, že Lekce 2 je v kapitole 6 a scénář Retail je architektonický blueprint, ne šablona na jedno příkaz
- **🧭 Tabulka lekcí kapitoly 1** nyní zahrnuje novou lekci „Přineste si vlastní aplikaci“ (Lekce 4)
- **🔗 Navigační patičky** aktualizovány: `first-project.md` nyní odkazuje dále na `bring-your-own-app.md`

#### Opraveno
- **🧱 Uzavřena mezera Terraform, která byla tvrzená, ale chyběla** — kurz dříve zmiňoval podporu Terraform, ale nic z ní neukazoval
- **🔀 Opraveny zavádějící mezitabulkové odkazy v kapitole 5** které naznačovaly existenci plné implementace multi-agent, zatímco šlo jen o architektonický blueprint

#### Aktualizované soubory
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nový)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nový)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Plné příkazy životního cyklu agenta a Aspire Rebranding

**Tato verze znovu ověřuje kurz s `azd` `1.25.6` (červen 2026) a rozšířením `azure.ai.agents` `0.1.40-preview`, rozšiřuje AI pokyny od "vytvořit agenta" po kompletní životní cyklus agenta (test → vyhodnotit → optimalizovat → zkontrolovat → smazat), představuje nová náhledová rozšíření `azure.ai.skills` a `azure.ai.connections` a zaznamenává rebranding produktu ".NET Aspire" → "Aspire".**

#### Přidáno
- **🔁 Kompletní pokrytí životního cyklu agenta** pro začátečníky i AI inženýry v dokumentaci:
  - `docs/chapter-01-foundation/azd-basics.md` — Přidána tabulka životního cyklu (vytvořit → testovat → měřit → zlepšovat → kontrolovat → uklidit) do sekce Rozšíření a AI příkazy
  - `docs/chapter-08-production/production-ai-practices.md` — Nová sekce "Správa životního cyklu agenta" pokrývající `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — Rozšířené AI příkazy agenta o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nová náhledová rozšíření** zdokumentována: `azure.ai.skills` (znovupoužitelné dovednosti agenta) a `azure.ai.connections` (připojení Foundry) přidána do tabulky rozšíření a tenkého návodu
- **⏱️ Pokyny pro časování odezvy** — příklady `azd ai agent invoke` nyní uvádějí celkovou latenci a čas na první byte
- **📌 Verze banneru** v hlavním README, který odkazuje studenty na `azd version` a `azd upgrade`

#### Změněno
- **✅ Aktualizována validační základna** z `azd 1.23.12` (březen 2026) na `azd 1.25.6` (červen 2026) ve všech kapitolách README a dokumentaci workshopu
- **🤖 Aktualizována poznámka o rozšíření Kapitoly 2** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Aktualizován příklad validace workshopu** (výstup `azd version`) na `1.25.6`
- **🧭 Aktualizováno "Co je nového v azd dnes" v README** s důrazem na kompletní životní cyklus agenta, nové AI rozšíření a nedávné vylepšení životního komfortu (`azd init` idempotence, čištění starých tokenů `azd auth login`, výzva při prvním spuštění `azd tool`)
- **📖 Kapitola 2 agents.md (Volba 4)** nyní odkazuje studenty na příkazy životního cyklu po nasazení místo zastavení u `azd up`

#### Opraveno
- **🏷️ Pojmenování produktu** — přidána poznámka o rebrandingu Aspire (".NET Aspire" je nyní jednoduše "Aspire"); podpora Aspire v azd zůstává nezměněna
- **🔎 Živá validace vydání** potvrzena vůči vydávacímu kanálu Azure Developer CLI: stabilní CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

### [v3.19.1] - 27. 3. 2026

#### Vyjasnění pro začátečníky, validace nastavení a čištění posledních příkazů AZD
**Tato verze navazuje na validaci AZD 1.23 a přináší přehlednou dokumentaci zaměřenou na začátečníky: vyjasňuje ověřování AZD, přidává skripty pro validaci lokálního nastavení, ověřuje klíčové příkazy vůči živému AZD CLI a odstraňuje poslední zastaralé odkazy na příkazy v angličtině mimo changelog.**

#### Přidáno
- **🧪 Skripty pro validaci nastavení pro začátečníky** s `validate-setup.ps1` a `validate-setup.sh`, aby si studenti ověřili potřebné nástroje před začátkem Kapitoly 1
- **✅ Předběžné kroky validace nastavení** v hlavním README a README Kapitoly 1, aby chybějící předpoklady byly zachyceny před `azd up`

#### Změněno
- **🔐 Pokyny k autentizaci pro začátečníky** nyní konzistentně zacházejí s `azd auth login` jako hlavní cestou pro AZD workflow, přičemž `az login` je zmíněno jako volitelné, pokud jsou přímo použity příkazy Azure CLI
- **📚 Průvodce onboardingem v Kapitole 1** nyní studenty odkazuje, aby nejprve validovali své lokální prostředí před instalací, autentizací a prvním nasazením
- **🛠️ Zprávy validátoru** nyní jasně oddělují blokující požadavky od volitelných varování Azure CLI pro začátečníky používající jen AZD
- **📖 Dokumentace konfigurace, řešení problémů a příkladů** nyní rozlišuje mezi povinnou AZD autentizací a volitelným přihlášením do Azure CLI tam, kde byly dříve prezentovány bez kontextu

#### Opraveno
- **📋 Zbývající odkazy na příkazy v anglickém zdroji** aktualizovány na aktuální podoby AZD, včetně `azd config show` v cheat sheet a `azd monitor --overview` tam, kde byla zamýšlena přehledová navigace Azure Portal
- **🧭 Tvrzení pro začátečníky v Kapitole 1** zmírněna tak, aby nepřekračovala zaručené chování nulových chyb nebo rollbacku u všech šablon a Azure zdrojů
- **🔎 Živá validace CLI** potvrzena aktuální podpora pro `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

### [v3.19.0] - 26. 3. 2026

#### Validace AZD 1.23.12, rozšíření workshopového prostředí a obnova AI modelu
**Tato verze provádí průchod validace dokumentace vůči `azd` `1.23.12`, aktualizuje zastaralé příklady příkazů AZD, obnovuje pokyny k AI modelům na aktuální výchozí hodnoty a rozšiřuje instrukce workshopu mimo GitHub Codespaces tak, aby podporovaly také vývojové kontejnery a lokální klony.**

#### Přidáno
- **✅ Poznámky k validaci v hlavních kapitolách a dokumentaci workshopu** pro explicitní vyznačení testované základny AZD pro studenty používající novější či starší verze CLI
- **⏱️ Pokyny k časovým limitům nasazení** dlouhotrvajících AI aplikací s `azd deploy --timeout 1800`
- **🔎 Kroky kontroly rozšíření** s `azd extension show azure.ai.agents` v dokumentaci AI workflow
- **🌐 Širší pokyny pro prostředí workshopu** pokrývající GitHub Codespaces, vývojové kontejnery a lokální klony s MkDocs

#### Změněno
- **📚 Úvodní README kapitol** nyní konzistentně uvádějí validaci vůči `azd 1.23.12` ve všech částech jako základy, konfigurace, infrastruktura, multi-agent, přednasazení, řešení problémů a produkce
- **🛠️ Odkazy na příkazy AZD** aktualizovány na aktuální podoby v dokumentaci:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` nebo `azd env get-value(s)` podle kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, pokud je zamýšlen přehled Application Insights
- **🧪 Zjednodušené předvedení příkazů provision preview** na aktuálně podporované použití jako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Aktualizace workshopového postupu** tak, aby studenti mohli dokončit laboratoře v Codespaces, vývojovém kontejneru či lokálním klonu, místo aby se předpokládalo jen Codespaces
- **🔐 Pokyny k autentizaci** nyní upřednostňují `azd auth login` pro AZD workflow, přičemž `az login` je volitelný, pokud se používají příkazy Azure CLI přímo

#### Opraveno
- **🪟 Příkazy instalace Windows** sjednoceny na aktuální velká písmena balíčkového manažeru `winget` v instalačním průvodci
- **🐧 Pokyny pro instalaci Linuxu** opraveny tak, aby se vyhnuly nepodporovaným distro-specifickým příkazům správce balíčků `azd` a místo toho odkazují na vydané assety, pokud je to vhodné
- **📦 Příklady AI modelů** obnoveny z dřívějších výchozích hodnot jako `gpt-35-turbo` a `text-embedding-ada-002` na aktuální jako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Nasazení a diagostické úryvky** opraveny k použití aktuálních příkazů prostředí a stavu v protokolech, skriptech a postupech řešení problémů
- **⚙️ Pokyny pro GitHub Actions** aktualizovány z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny pro MCP/Copilot souhlas** aktualizovány z `azd mcp consent` na `azd copilot consent list`

#### Zlepšeno
- **🧠 Pokyny v kapitole o AI** nyní lépe vysvětlují chování `azd ai`, citlivost na náhledy, přihlášení k tenantovi, aktuální použití rozšíření a aktualizovaná doporučení pro nasazení modelů
- **🧪 Instrukce workshopu** nyní používají realističtější příklady verzí a jasnější jazyk nastavení prostředí pro praktické laboratoře
- **📈 Produkční a troubleshooting dokumentace** nyní lépe ladí s aktuálním monitorováním, fallback modely a nákladovými úrovněmi

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

### [v3.18.0] - 16. 3. 2026

#### Příkazy AZD AI CLI, validace obsahu a rozšíření šablony
**Tato verze přidává pokrytí příkazů `azd ai`, `azd extension` a `azd mcp` ve všech AI souvisejících kapitolách, opravuje nefungující odkazy a zastaralý kód v agents.md, aktualizuje cheat sheet a kompletně přepracovává sekci Příkladových šablon s validovanými popisy a novými Azure AI AZD šablonami.**

#### Přidáno
- **🤖 Pokrytí AZD AI CLI** napříč 7 soubory (dříve jen v Kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekce "Rozšíření a AI příkazy" představující `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Volba 4: `azd ai agent init` s porovnávací tabulkou (šablona vs manifest přístup)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekce "AZD rozšíření pro Foundry" a "Nasazení s agentem jako prvním"

  - `docs/chapter-05-multi-agent/README.md` — Rychlý start nyní ukazuje jak nasazení založené na šabloně, tak na manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekce nasazení nyní obsahuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekce "Příkazy rozšíření AZD AI pro diagnostiku"
  - `resources/cheat-sheet.md` — Nová sekce "Příkazy AI & Extensions" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové příkladové šablony AZD AI** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat používající Langchain4J s možnostmi nasazení ACA/AKS
  - **contoso-creative-writer** — Multi-agent kreativní psaní aplikace používající Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG používající Azure Functions + LangChain.js + Cosmos DB s podporou Ollama pro lokální vývoj
  - **chat-with-your-data-solution-accelerator** — Podnikový RAG akcelerátor s administrátorským portálem, integrací Teams a volbami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenční aplikace pro multi-agent MCP orchestraci se servery v .NET, Python, Java a TypeScript
  - **azd-ai-starter** — Minimální Azure AI infrastruktury startovací šablona v Bicep
  - **🔗 Skvělý odkaz na AZD AI galerii** — Odkaz na [awesome-azd AI galerii](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablon)

#### Opraveno
- **🔗 Navigace agents.md**: Odkazy Předchozí/Další nyní odpovídají pořadí lekcí v README kapitole 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md nefunkční odkazy**: `production-ai-practices.md` opraveno na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 agents.md zastaralý kód**: Nahrazeno `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neplatné API**: `max_tokens` přesunuto z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 agents.md počítání tokenů**: Hrubý odhad `len//4` nahrazen `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opraveny služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (výchozí hostitel změněn v říjnu 2024)
- **contoso-chat**: Aktualizován popis s odkazem na Azure AI Foundry + Prompty, odpovídající skutečnému názvu a technologickému stacku repozitáře

#### Odstraněno
- **ai-document-processing**: Odstraněna nefunkční šablona (repozitář není veřejně přístupný jako AZD šablona)

#### Vylepšeno
- **📝 agents.md cvičení**: Cvičení 1 nyní zobrazuje očekávaný výstup a krok s `azd monitor`; Cvičení 2 obsahuje kompletní kód registrace `FunctionTool`; Cvičení 3 nahrazuje vágní pokyny konkrétními příkazy `prepdocs.py`
- **📚 agents.md zdroje**: Aktualizovány odkazy na dokumentaci na aktuální Azure AI Agent Service dokumentaci a rychlý start
- **📋 agents.md tabulka Další kroky**: Přidán odkaz na workshopovou laboratoř AI pro úplné pokrytí kapitoly

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
**Tato verze vylepšuje navigaci kapitol v README.md pomocí rozšířeného formátu tabulky.**

#### Změněno
- **Tabulka mapy kurzu**: Vylepšena o přímé odkazy na lekce, odhady délky a hodnocení složitosti
- **Úklid složek**: Odstraněny nadbytečné staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Ověření odkazů**: Ověřeno všech 21+ interních odkazů v tabulce mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty podle aktuálního brandingu Microsoftu.**

#### Změněno
- **Microsoft Foundry → Microsoft Foundry**: Všechny odkazy aktualizovány napříč nesignovanými soubory
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován, aby odpovídal současnému brandingu

#### Aktualizované soubory
- `README.md` - Hlavní úvodní stránka kurzu
- `changelog.md` - Historie verzí
- `course-outline.md` - Struktura kurzu
- `docs/chapter-02-ai-development/agents.md` - Průvodce AI agenty
- `examples/README.md` - Dokumentace příkladů
- `workshop/README.md` - Úvodní stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všechny soubory s instrukcemi workshopu

---

### [v3.15.0] - 2026-02-05

#### Významná restrukturalizace repozitáře: Složky pojmenované podle kapitol
**Tato verze reorganizuje dokumentaci do dedikovaných složek podle kapitol pro jasnější navigaci.**

#### Přejmenování složek
Staré složky byly nahrazeny složkami číslovanými podle kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Přidána nová: `docs/chapter-05-multi-agent/`

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
- **📚 README soubory kapitol**: Vytvořen README.md v každé složce kapitoly s:
  - Cíle učení a doba trvání
  - Tabulka lekcí s popisy
  - Příkazy pro rychlý start
  - Navigace do dalších kapitol

#### Změněno
- **🔗 Aktualizovány všechny interní odkazy**: Aktualizováno více než 78 cest ve všech dokumentačních souborech
- **🗺️ Hlavní README.md**: Aktualizována mapa kurzu s novou strukturou kapitol
- **📝 examples/README.md**: Aktualizovány vzájemné odkazy na složky kapitol

#### Odebráno
- Starší struktura složek (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace repozitáře: Navigace kapitol
**Tato verze přidala README soubory pro navigaci kapitol (nahrazeno verzí v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový průvodce AI agenty
**Tato verze přidává komplexní průvodce nasazením AI agentů pomocí Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce pokrývající:
  - Co jsou AI agenti a jak se liší od chatbotů
  - Tři šablony agentů pro rychlý start (Foundry Agents, Prompty, RAG)
  - Vzory architektury agentů (jednotlivý agent, RAG, multi-agent)
  - Konfigurace a přizpůsobení nástrojů
  - Monitorování a sledování metrik
  - Úvahy o nákladech a optimalizaci
  - Běžné scénáře řešení problémů
  - Tři praktická cvičení s kritérii úspěchu

#### Struktura obsahu
- **Úvod**: Koncepty agentů pro začátečníky
- **Rychlý start**: Nasazení agentů s `azd init --template get-started-with-ai-agents`
- **Vzory architektury**: Vizualizace vzorů agentů
- **Konfigurace**: Nastavení nástrojů a proměnných prostředí
- **Monitorování**: Integrace Application Insights
- **Cvičení**: Progresivní praktické učení (20-45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace prostředí DevContainer
**Tato verze aktualizuje konfiguraci vývojového kontejneru s moderními nástroji a lepšími výchozími hodnotami pro AZD zkušenost učení.**

#### Změněno
- **🐳 Základní obraz**: Aktualizováno z `python:3.12-bullseye` na `python:3.12-bookworm` (nejnovější stabilní Debian)
- **📛 Název kontejneru**: Přejmenováno z "Python 3" na "AZD pro začátečníky" pro přehlednost

#### Přidáno
- **🔧 Nové funkce vývojového kontejneru**:
  - `azure-cli` s podporou Bicep povolenou
  - `node:20` (LTS verze pro AZD šablony)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazení kontejnerových aplikací

- **🔌 Přesměrování portů**: Přednastavené porty pro běžný vývoj:
  - 8000 (náhled MkDocs)
  - 3000 (Webové aplikace)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšíření VS Code**:
  - `ms-python.vscode-pylance` - Vylepšený Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojů
  - `yzhang.markdown-all-in-one` - Úprava Markdown
  - `DavidAnson.vscode-markdownlint` - Kontrola Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramů
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Git
  - `mhutchie.git-graph` - Historie Git

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro Python interpreter, formátování při ukládání a ořezávání bílých znaků

- **📦 Aktualizace requirements-dev.txt**:
  - Přidán plugin pro minifikaci MkDocs
  - Přidán pre-commit pro kvalitu kódu
  - Přidány balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Příkaz po vytvoření**: Nyní ověřuje instalaci AZD a Azure CLI při startu kontejneru

---

### [v3.11.0] - 2026-02-05

#### Přehlednější README pro začátečníky
**Tato verze výrazně zlepšuje README.md, aby byl přístupnější pro začátečníky a přidává základní zdroje pro AI vývojáře.**

#### Přidáno
- **🆚 Porovnání Azure CLI a AZD**: Jasné vysvětlení, kdy používat který nástroj s praktickými příklady
- **🌟 Skvělé odkazy na AZD**: Přímé odkazy na galerii šablon komunity a zdroje pro příspěvky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ šablon připravených k nasazení
  - [Přidat šablonu](https://github.com/Azure/awesome-azd/issues) - Příspěvky komunity
- **🎯 Průvodce rychlým startem**: Zjednodušená sekce tří kroků pro začátečníky (Instalace → Přihlášení → Nasazení)
- **📊 Tabulka navigace podle zkušeností**: Jasné pokyny, kde začít na základě zkušeností vývojáře

#### Změněno
- **Struktura README**: Přeuspořádáno pro postupné odkrývání informací – klíčové informace jako první
- **Úvodní sekce**: Přepsána tak, aby vysvětlila „Kouzlo `azd up`“ pro úplné začátečníky
- **Odebrán duplicitní obsah**: Odstraněna duplicitní sekce řešení problémů

- **Příkazy pro řešení problémů**: Opraven odkaz `azd logs` tak, aby používal platný `azd monitor --logs`

#### Opraveno

- **🔐 Příkazy pro autentizaci**: Přidáno `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na příkazy**: Odstraněno zbylé `azd logs` z části README řešení problémů

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílová skupina**: Vylepšení zaměřená speciálně na vývojáře nové v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující příkazy AZD v celé dokumentaci, zajišťuje, že všechny příklady kódu používají platnou syntaxi Azure Developer CLI.**

#### Opraveno
- **🔧 Odstraněny neexistující příkazy AZD**: Komplexní audit a oprava neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo alternativami Azure CLI
  - `azd service` podpříkazy (neexistují) → nahrazeno `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistují) → odstraněno nebo nahrazeno platnými alternativami
  - Přepínače `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistují) → odstraněny
  - Přepínače `azd provision --what-if/--rollback` (neexistují) → aktualizováno na `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Aktualizované soubory s opravami příkazů**:
  - `resources/cheat-sheet.md`: Hlavní přepracování referencí příkazů
  - `docs/deployment/deployment-guide.md`: Opravena strategie rollback a nasazení
  - `docs/troubleshooting/debugging.md`: Opravené sekce analýzy logů
  - `docs/troubleshooting/common-issues.md`: Aktualizovány příkazy pro řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Opraveny příkazy monitoringu
  - `docs/getting-started/first-project.md`: Aktualizovány příklady monitoringu a ladění
  - `docs/getting-started/installation.md`: Opraveny příklady nápovědy a verzí
  - `docs/pre-deployment/application-insights.md`: Opravené příkazy pro prohlížení logů
  - `docs/pre-deployment/coordination-patterns.md`: Opraveny příkazy pro ladění agentů

- **📝 Aktualizace reference verze**: 
  - `docs/getting-started/installation.md`: Změna pevně dané verze `1.5.0` na obecnou `1.x.x` s odkazem na vydání

#### Změněno
- **Strategie rollback**: Aktualizace dokumentace na použití rollbacku založeného na Gitu (AZD nemá nativní rollback)
- **Prohlížení logů**: Nahrazeny odkazy na `azd logs` příkazy `azd monitor --logs`, `azd monitor --live` a příkazy Azure CLI
- **Sekce výkonu**: Odstraněny neexistující přepínače paralelního/incrementálního nasazení, poskytnuty platné alternativy

#### Technické detaily
- **Platné příkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné přepínače azd monitor**: `--live`, `--logs`, `--overview`
- **Odstraněné funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a vylepšení kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny nefunkční odkazy v dokumentaci a zlepšuje celkovou kvalitu obsahu pro AI vývojáře používající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument pokynů pro přispívání s:
  - Jasnými instrukcemi pro hlášení problémů a navrhování změn
  - Standardy dokumentace pro nový obsah
  - Pokyny pro ukázky kódu a konvence zpráv k commitům
  - Informace o zapojení komunity

#### Dokončeno
- **🎯 Workshop modul 7 (Závěr)**: Kompletně dokončený závěrečný modul s:
  - Komplexním shrnutím dosažených cílů workshopu
  - Sekcí klíčových osvojovaných konceptů AZD, šablon a Microsoft Foundry
  - Doporučeními pro další učení
  - Cvičeními a úkoly s hodnocením obtížnosti
  - Odkazy na zpětnou vazbu a podporu komunity

- **📚 Workshop modul 3 (Deconstruct)**: Aktualizované vzdělávací cíle s:
  - Pokyny k aktivaci GitHub Copilot se servery MCP
  - Porozuměním struktuře složek šablon AZD
  - Vzory organizace infrastruktury jako kódu (Bicep)
  - Pokyny k praktickým cvičením

- **🔧 Workshop modul 6 (Úklid)**: Dokončený s:
  - Cíli správy zdrojů a nákladů
  - Použitím `azd down` pro bezpečné odstavení infrastruktury
  - Pokyny k obnově soft-delete kognitivních služeb
  - Bonusovými průzkumnými podněty pro GitHub Copilot a Azure Portal

#### Opraveno
- **🔗 Opravy zlomených odkazů**: Vyřešeno přes 15 nefunkčních interních odkazů v dokumentaci:
  - `docs/ai-foundry/ai-model-deployment.md`: Opraveny cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opraveny cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazen neexistující cicd-integration.md za deployment-guide.md
  - `examples/retail-scenario.md`: Opraveny cesty k FAQ a průvodci řešením problémů
  - `examples/container-app/microservices/README.md`: Opraveny cesty ke kurzovým materiálům a průvodci nasazením
  - `resources/faq.md` a `resources/glossary.md`: Aktualizovány odkazy na kapitoly o AI
  - `course-outline.md`: Opraveny odkazy na průvodce instruktora a AI workshopové laboratoře

- **📅 Banner stavu workshopu**: Aktualizován ze “Ve výstavbě” na aktivní stav workshopu s datem únor 2026

- **🔗 Navigace workshopu**: Opraveny nefunkční odkazy v README workshopu ukazující na neexistující složku lab-1-azd-basics

#### Změněno
- **Prezentace workshopu**: Odstraněno upozornění „ve výstavbě“, workshop je nyní dokončen a připraven k použití
- **Konzistence navigace**: Zajištěna správná mezimodulová navigace ve všech workshopech
- **Odkazy na učební cesty**: Aktualizovány křížové odkazy na správné microsoft-foundry cesty

#### Ověřeno
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Workshopy moduly 0-7 jsou kompletní se vzdělávacími cíli
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Používán jazyk a struktura přátelská pro začátečníky po celou dobu
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro příspěvatele z komunity

#### Technická implementace
- **Validace odkazů**: Automatizovaný PowerShell skript ověřil všechny interní odkazy v .md souborech
- **Audit obsahu**: Ruční kontrola úplnosti workshopu a vhodnosti pro začátečníky
- **Navigační systém**: Konzistentní vzory navigace kapitol a modulů

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci
- **Překlady**: Složky s překlady v této verzi nedodány (automatický překlad bude synchronizován později)
- **Délka workshopu**: Kompletní workshop nyní poskytuje 3-4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitorování, zabezpečení a vzory multi-agentů
**Tato verze přidává komplexní lekce kvality A o integraci Application Insights, vzorech autentizace a koordinaci multi-agentů pro produkční nasazení.**

#### Přidáno
- **📊 Lekce integrace Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Zaměření na AZD nasazení s automatickým provisioningem
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Fungující Python aplikace s vlastní telemetrií (1 200+ řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů Microsoft Foundry Models)
  - 6 Mermaid diagramů (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, AI monitoring)
  - Příklady dotazů Kusto a strategie optimalizace nákladů
  - Streaming reálných metrik a ladění v reálném čase
  - 40-50 minut učebního času s produkčně připravenými vzory

- **🔐 Lekce autentizace a bezpečnostních vzorů**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentizace (connection strings, Key Vault, spravovaná identita)
  - Kompletní Bicep šablony infrastruktury pro bezpečná nasazení
  - Kód Node.js aplikace s integrací Azure SDK
  - 3 kompletní cvičení (aktivace spravované identity, user-assigned identity, rotace Key Vault)
  - Nejlepší bezpečnostní praktiky a konfigurace RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkčně připravené vzory autentizace bez hesla

- **🤖 Lekce koordinace multi-agentů**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorů koordinace (sekvenční, paralelní, hierarchický, řízený událostmi, konsensus)
  - Kompletní implementace orchestrátorské služby (Python/Flask, 1 500+ řádků)
  - 3 specializované implementace agentů (Výzkum, Spisovatel, Editor)
  - Integrace Service Bus pro fronty zpráv
  - Správa stavu Cosmos DB pro distribuované systémy
  - 6 Mermaid diagramů znázorňujících interakce agentů
  - 3 pokročilá cvičení (zpracování timeoutu, retry logika, obvodový spínač)
  - Rozpis nákladů (240-565 USD/měsíc) s optimalizačními strategiemi
  - Integrace Application Insights pro monitorování

#### Vylepšeno
- **Kapitola pre-deploymentu**: Nyní zahrnuje komplexní vzory monitorování a koordinace
- **Kapitola Getting Started**: Vylepšena o profesionální vzory autentizace
- **Připravenost pro produkci**: Kompletní pokrytí od zabezpečení po pozorovatelnost
- **Osnova kurzu**: Aktualizována o odkazy na nové lekce v kapitolách 3 a 6

#### Změněno
- **Progres učení**: Lepší integrace bezpečnosti a monitorování v celém kurzu
- **Kvalita dokumentace**: Konzistentní A-grade standardy (95-97 %) napříč novými lekcemi
- **Produkční vzory**: Kompletní end-to-end pokrytí pro podnikové nasazení

#### Vylepšeno
- **Zkušenost vývojáře**: Jasná cesta od vývoje k produkčnímu monitoringu
- **Bezpečnostní standardy**: Profesionální vzory pro autentizaci a správu tajemství
- **Pozorovatelnost**: Kompletní integrace Application Insights s AZD
- **AI pracovní zátěže**: Specializované monitorování Microsoft Foundry Models a multi-agentních systémů

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní fungující kód (nikoli jen úryvky)
- ✅ Mermaid diagramy pro vizuální učení (19 celkem ve 3 lekcích)
- ✅ Praktická cvičení s kontrolními kroky (9 celkem)
- ✅ Produkčně připravené Bicep šablony nasaditelné přes `azd up`
- ✅ Analýza nákladů a optimalizační strategie
- ✅ Průvodce řešením problémů a nejlepší praktiky
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitorováním
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé multi-agentní architektury
- **Celkový nový obsah**: - Konzistentní vysoké standardy kvality

#### Technická implementace
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Autentizace**: Spravovaná identita + Key Vault + RBAC vzory
- **Multi-agent**: Service Bus + Cosmos DB + Container Apps + orchestrace
- **Monitorování**: Sledování metrik v reálném čase + dotazy Kusto + alerty + dashboardy
- **Správa nákladů**: Strategii sampling, zásady retence, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Vylepšení kvality dokumentace a nový příklad Microsoft Foundry Models
**Tato verze zlepšuje kvalitu dokumentace v celém úložišti a přidává kompletní příklad nasazení Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Přidáno
- **🤖 Příklad chatu Microsoft Foundry Models**: Kompletní nasazení gpt-4.1 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Microsoft Foundry Models (nasazení modelu gpt-4.1)
  - Python rozhraní příkazového řádku se záznamem konverzace
  - Integrace Key Vault pro zabezpečené ukládání API klíčů
  - Sledování použití tokenů a odhad nákladů
  - Omezování rychlosti a zpracování chyb
  - Komplexní README s 35-45 minutovým průvodcem nasazením
  - 11 produkčně připravených souborů (Bicep šablony, Python aplikace, konfigurace)
- **📚 Cvičení z dokumentace**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace pro více prostředí (15 minut)
  - Cvičení 2: Praxe správy tajemství (10 minut)
  - Jasná kritéria úspěchu a ověřovací kroky
- **✅ Ověření nasazení**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontrol zdraví
  - Seznam kritérií úspěchu
  - Očekávané výstupy všech příkazů nasazení
  - Rychlá reference k řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na kvalitu A-grade (93%):
  - Přidáno azure-openai-chat do všech relevantních sekcí
  - Zvýšen počet lokálních příkladů z 3 na 4
  - Přidáno do tabulky příkladů AI aplikací
  - Začleněno do Quick Start pro pokročilé uživatele
  - Přidáno do sekce Microsoft Foundry Templates
  - Aktualizována matice porovnání a sekce hledání technologií
- **Kvalita dokumentace**: Zlepšena z B+ (87%) na A- (92%) v celé složce docs:

  - Přidány očekávané výstupy ke klíčovým příkladům příkazů
  - Zahrnuty ověřovací kroky pro změny konfigurace
  - Vylepšeno praktické učení pomocí cvičení

#### Změněno
- **Postup učení**: Lepší integrace AI příkladů pro středně pokročilé uživatele
- **Struktura dokumentace**: Více akčních cvičení s jasnými výsledky
- **Ověřovací proces**: Přidána explicitní kritéria úspěchu do klíčových pracovních postupů

#### Vylepšeno
- **Zkušenost vývojáře**: Nasazení Microsoft Foundry Models nyní trvá 35-45 minut (oproti 60-90 u složitějších alternativ)
- **Transparentnost nákladů**: Jasné odhady nákladů ($50-200/měsíc) u příkladu Microsoft Foundry Models
- **Učební cesta**: Vývojáři AI mají jasný vstupní bod s azure-openai-chat
- **Standardy dokumentace**: Konzistentní očekávané výstupy a ověřovací kroky

#### Ověřeno
- ✅ Příklad Microsoft Foundry Models plně funkční s `azd up`
- ✅ Všechny 11 implementační soubory syntakticky správné
- ✅ Instrukce v README odpovídají skutečné zkušenosti s nasazením
- ✅ Odkazy v dokumentaci aktualizovány na více než 8 místech
- ✅ Index příkladů přesně odráží 4 lokální příklady
- ✅ Žádné duplicitní externí odkazy v tabulkách
- ✅ Všechny navigační odkazy správné

#### Technická implementace
- **Architektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps pattern
- **Zabezpečení**: Managed Identity připravené, tajemství v Key Vault
- **Monitorování**: Integrace Application Insights
- **Správa nákladů**: Sledování tokenů a optimalizace využití
- **Nasazení**: Jeden příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení Container App
**Tato verze přináší komplexní, do produkce připravené příklady nasazení kontejnerových aplikací pomocí Azure Developer CLI (AZD), s plnou dokumentací a integrací do učební cesty.**

#### Přidáno
- **🚀 Příklady Container App**: Nové lokální příklady v `examples/container-app/`:
  - [Hlavní průvodce](examples/container-app/README.md): Kompletní přehled kontejnerizovaných nasazení, rychlý start, produkce a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): Uživatelsky přívětivé REST API s režimem scale-to-zero, zdravotními kontrolami, monitorováním a odstraňováním problémů
  - [Architektura mikroslužeb](../../examples/container-app/microservices): Produkčně připravené nasazení více služeb (API Gateway, Product, Order, User, Notification), asynchronní zasílání zpráv, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary nasazení
- **Nejlepší postupy**: Zabezpečení, monitorování, optimalizace nákladů a doporučení pro CI/CD u kontejnerových pracovních zatížení
- **Ukázky kódu**: Kompletní `azure.yaml`, Bicep šablony a implementace služeb v několika jazycích (Python, Node.js, C#, Go)
- **Testování a odstraňování problémů**: End-to-end testovací scénáře, monitorovací příkazy, návody k odstranění chyb

#### Změněno
- **README.md**: Aktualizováno o nové příklady container app s odkazy v sekci "Lokální příklady - Kontejnerové aplikace"
- **examples/README.md**: Zvýraznění příkladů container app, přidání položek srovnávací matice a aktualizace technologií/odkazů na architekturu
- **Osnova kurzu a studijní průvodce**: Aktualizováno o odkazy na nové příklady container app a vzory nasazení v příslušných kapitolách

#### Ověřeno
- ✅ Všechny nové příklady lze nasadit pomocí `azd up` a dodržují osvědčené postupy
- ✅ Odkazy v dokumentaci řádně provázané a navigace aktualizována
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé včetně produkčních mikroslužeb

#### Poznámky
- **Rozsah**: Pouze anglická dokumentace a příklady
- **Další kroky**: Rozšíření o pokročilejší kontejnerové vzory a automatizaci CI/CD v budoucích vydáních

### [v3.5.0] - 2025-11-19

#### Přejmenování produktu: Microsoft Foundry
**Tato verze implementuje komplexní změnu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" ve veškeré anglické dokumentaci, odrážející oficiální rebranding Microsoftu.**

#### Změněno
- **🔄 Aktualizace názvu produktu**: Kompletní rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem: 23 aktualizovaných odkazů v 7 dokumentačních souborech

- **📁 Změny ve struktuře složek**:
  - `docs/ai-foundry/` přejmenováno na `docs/microsoft-foundry/`
  - Všechny křížové odkazy aktualizovány dle nové struktury složek
  - Navigační odkazy ověřeny v celé dokumentaci

- **📄 Přejmenování souborů**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všechny interní odkazy aktualizovány na nový název souboru

#### Aktualizované soubory
- **Dokumentace kapitol** (7 souborů):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizace navigačních odkazů
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizace názvů produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Již používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizace odkazů (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 aktualizace křížových odkazů
  - `docs/getting-started/first-project.md` - 2 aktualizace navigačních odkazů kapitol
  - `docs/getting-started/installation.md` - 2 aktualizace odkazů na další kapitoly
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizace odkazů (navigace, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizace navigačního odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizace navigačního odkazu

- **Soubory struktury kurzu** (2 soubory):
  - `README.md` - 17 aktualizací odkazů (přehled kurzu, názvy kapitol, část šablony, názory komunity)
  - `course-outline.md` - 14 aktualizací odkazů (přehled, cíle učení, zdroje kapitol)

#### Ověřeno
- ✅ Žádné zbylé odkazy na cestu ke složce "ai-foundry" v anglické dokumentaci
- ✅ Žádné zbylé odkazy na název produktu "Microsoft Foundry" v anglické dokumentaci
- ✅ Všechny navigační odkazy funkční podle nové struktury složek
- ✅ Úspěšné přejmenování souborů a složek
- ✅ Ověřeny křížové odkazy mezi kapitolami

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci ve složce `docs/`
- **Překlady**: Překladové složky (`translations/`) v této verzi neaktualizovány
- **Workshop**: Materiály workshopu (`workshop/`) v této verzi neaktualizovány
- **Příklady**: Příkladové soubory mohou stále obsahovat odkazy na staré názvy (bude řešeno v budoucí aktualizaci)
- **Externí odkazy**: Externí URL a odkazy na GitHub repozitáře zůstávají nezměněny

#### Průvodce migrací pro přispěvatele
Pokud máte lokální větve nebo dokumentaci odkazující na starou strukturu:
1. Aktualizujte odkazy na složky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na soubory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte název produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Ověřte, že všechny interní odkazy v dokumentaci stále fungují

---

### [v3.4.0] - 2025-10-24

#### Vylepšení náhledu infrastruktury a ověřování
**Tato verze přináší komplexní podporu nové funkce náhledu Azure Developer CLI a zlepšuje uživatelský zážitek workshopu.**

#### Přidáno
- **🧪 Dokumentace funkce azd provision --preview**: Komplexní pokrytí nové možnosti náhledu infrastruktury
  - Referenční příkazy a příklady použití v cheat sheetu
  - Podrobná integrace v průvodci provisioningem s případy použití a přínosy
  - Integrace předběžné kontroly pro bezpečnější ověření nasazení
  - Aktualizace průvodce začátkem s bezpečnostními postupy před nasazením
- **🚧 Stavový banner workshopu**: Profesionální HTML banner indikující stav vývoje workshopu
  - Gradientní design s indikátory stavby pro jasnou komunikaci uživatelům
  - Časová známka poslední aktualizace pro transparentnost
  - Mobilně responzivní design pro všechny typy zařízení

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrována ve všech dokumentech nasazení
- **Přednasazovací ověření**: Automatizované skripty nyní obsahují test náhledu infrastruktury
- **Vývojářský workflow**: Aktualizované sekvence příkazů zahrnují náhled jako nejlepší praxi
- **Zážitek z workshopu**: Jasná očekávání ze strany uživatelů ohledně stavu obsahu

#### Změněno
- **Nejlepší postupy nasazení**: Doporučený postup nyní začíná náhledem
- **Tok dokumentace**: Ověření infrastruktury posunuto na dřívější fázi učení
- **Prezentace workshopu**: Profesionální komunikace stavu s jasným časovým rámcem vývoje

#### Vylepšeno
- **Přístup upřednostňující bezpečnost**: Změny infrastruktury lze nyní ověřit před nasazením
- **Týmová spolupráce**: Výsledky náhledu lze sdílet pro přezkoumání a schválení
- **Povědomí o nákladech**: Lepší pochopení nákladů na zdroje před provisioningem
- **Zmírnění rizik**: Snížení selhání nasazení díky předběžnému ověření

#### Technická implementace
- **Integrace vícestránkové dokumentace**: Funkce náhledu zdokumentována ve 4 klíčových souborech
- **Vzory příkazů**: Konzistentní syntax a příklady v celé dokumentaci
- **Integrace nejlepších praktik**: Náhled zahrnut do ověřovacích workflow a skriptů
- **Vizualizace indikátorů**: Jasné označení NOVÉ funkce pro lepší nalezitelnost

#### Infrastruktura workshopu
- **Komunikace stavu**: Profesionální HTML banner s gradientním designem
- **Uživatelský zážitek**: Jasný stav vývoje zabraňuje zmatkům
- **Profesionální prezentace**: Zachovává důvěryhodnost repozitáře a stanovuje očekávání
- **Transparentnost časové osy**: Časová známka poslední aktualizace října 2025 za účelem odpovědnosti

### [v3.3.0] - 2025-09-24

#### Rozšířené materiály workshopu a interaktivní učební zážitek
**Tato verze přináší komplexní materiály workshopu s prohlížečově založenými interaktivními průvodci a strukturovanými učebními cestami.**

#### Přidáno
- **🎥 Interaktivní průvodce workshopem**: Prohlížečově založený zážitek workshopu s funkcí náhledu MkDocs
- **📝 Strukturované instrukce workshopu**: 7-kroková vedená učební cesta od objevování po přizpůsobení
  - 0-Úvod: Přehled workshopu a nastavení
  - 1-Výběr AI šablony: Proces objevování a výběru šablony
  - 2-Ověření AI šablony: Postupy nasazení a ověřování
  - 3-Rozložení AI šablony: Pochopení architektury šablony
  - 4-Konfigurace AI šablony: Nastavení a přizpůsobení
  - 5-Přizpůsobení AI šablony: Pokročilé úpravy a iterace
  - 6-Demontáž infrastruktury: Úklid a správa zdrojů
  - 7-Závěr: Shrnutí a další kroky
- **🛠️ Nástroje pro workshop**: Konfigurace MkDocs s tématem Material pro vylepšený zážitek učení
- **🎯 Praktická učební cesta**: 3-kroková metodologie (Objevování → Nasazení → Přizpůsobení)
- **📱 Integrace GitHub Codespaces**: Bezproblémové nastavení vývojového prostředí

#### Vylepšeno
- **AI Workshop Lab**: Rozšířeno o komplexní 2-3 hodinový strukturovaný učební zážitek
- **Dokumentace workshopu**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Postup učení**: Jasné krok za krokem vedení od výběru šablony po produkční nasazení
- **Vývojářský zážitek**: Integrované nástroje pro efektivní vývojové workflow

#### Vylepšeno
- **Přístupnost**: Prohlížečové rozhraní s vyhledáváním, funkcí kopírování a přepínačem motivů
- **Učení vlastním tempem**: Flexibilní struktura workshopu vyhovující různým rychlostem učení
- **Praktická aplikace**: Nasazení reálných AI šablon ve scénářích
- **Integrace komunity**: Discord pro podporu workshopu a spolupráci

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé vyhledávání klíčových slov a lekcí
- **Kopírování bloků kódu**: Funkce kopírování kódu na najetí myší u všech příkladů
- **Přepínač tématu**: Podpora tmavého/světlého režimu pro různé preference
- **Vizuální doplňky**: Screenshoty a diagramy pro lepší pochopení
- **Integrace pomoci**: Přímý přístup na Discord pro podporu komunity

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém učení podle kapitol
**Tato verze zavádí komplexní strukturu učení podle kapitol s vylepšenou navigací v celém repozitáři.**

#### Přidáno
- **📚 Systém učení podle kapitol**: Přeorganizovaný celý kurz do 8 postupně navazujících kapitol
  - Kapitola 1: Základy a rychlý start (⭐ - 30-45 minut)
  - Kapitola 2: Vývoj orientovaný na AI (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurace a autentizace (⭐⭐ - 45-60 minut)
  - Kapitola 4: Infrastruktura jako kód a nasazení (⭐⭐⭐ - 1-1.5 hodiny)
  - Kapitola 5: Víceagentové AI řešení (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Přednasazovací ověřování a plánování (⭐⭐ - 1 hodina)
  - Kapitola 7: Řešení problémů a ladění (⭐⭐ - 1-1.5 hodiny)
  - Kapitola 8: Produkční a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Kompletní navigační systém**: Konzistentní záhlaví a zápatí navigace ve všech dokumentech
- **🎯 Sledování pokroku**: Kontrolní seznam dokončení kurzu a ověřovací systém učení
- **🗺️ Vedení učební cesty**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Křížová navigace**: Související kapitoly a předpoklady jasně propojeny

#### Vylepšeno
- **Struktura README**: Přeměněna na strukturovanou učební platformu s organizací podle kapitol
- **Navigace dokumentace**: Každá stránka nyní obsahuje kontext kapitoly a průvodce postupem
- **Organizace šablon**: Příklady a šablony mapovány do příslušných učebních kapitol

- **Integrace zdrojů**: Přehledy, FAQ a studijní příručky propojené s příslušnými kapitolami
- **Integrace workshopů**: Praktické laboratoře mapované na více učebních cílů kapitol

#### Změněno
- **Postup učení**: Přesunuto od lineární dokumentace k flexibilnímu učení založenému na kapitolách
- **Umístění konfigurace**: Přesunuto vedení konfigurace na kapitolu 3 pro lepší tok učení
- **Integrace AI obsahu**: Lepší začlenění obsahu specifického pro AI během celé cesty učení
- **Produkční obsah**: Pokročilé vzory konsolidované v kapitole 8 pro podnikové studenty

#### Vylepšeno
- **Uživatelská zkušenost**: Jasná navigační struktura a ukazatele postupu mezi kapitolami
- **Přístupnost**: Konzistentní navigační vzory pro snadnější orientaci v kurzu
- **Profesionální prezentace**: Univerzitní struktura kurzu vhodná pro akademické a korporátní školení
- **Efektivita učení**: Zkrácený čas na nalezení relevantního obsahu díky lepší organizaci

#### Technická implementace
- **Navigační záhlaví**: Standardizovaná navigace kapitol napříč 40+ dokumentačními soubory
- **Navigace v patičce**: Konzistentní průvodce průběhem a indikátory dokončení kapitol
- **Křížové odkazy**: Komplexní systém interního propojování souvisejících konceptů
- **Mapování kapitol**: Šablony a příklady jasně spojeny s učebními cíli

#### Vylepšení studijní příručky
- **📚 Komplexní učební cíle**: Přestavěná studijní příručka pro sladění s 8-kapitolovým systémem
- **🎯 Hodnocení založené na kapitolách**: Každá kapitola obsahuje konkrétní učební cíle a praktická cvičení
- **📋 Sledování pokroku**: Týdenní učební plán s měřitelnými výsledky a kontrolními seznamy dokončení
- **❓ Otázky k hodnocení**: Otázky pro ověření znalostí pro každou kapitolu s profesionálními výstupy
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešením problémů
- **📊 Postup dovedností**: Jasný posun od základních konceptů k podnikovým vzorům s důrazem na rozvoj kariéry
- **🎓 Certifikační rámec**: Výstupy profesního rozvoje a systém komunitního uznání
- **⏱️ Řízení časové osy**: Strukturovaný 10týdenní učební plán s ověřováním milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená řešení víceagentní AI
**Tato verze zlepšuje multi-agentní maloobchodní řešení lepším pojmenováním agentů a vylepšenou dokumentací.**

#### Změněno
- **Terminologie více agentů**: Nahrazen "Cora agent" pojmem "Customer agent" napříč maloobchodním multi-agentním řešením pro lepší pochopení
- **Architektura agentů**: Aktualizována veškerá dokumentace, ARM šablony a příklady kódu pro jednotné pojmenování "Customer agent"
- **Příklady konfigurace**: Modernizovány vzory konfigurace agentů s aktualizovanými pojmenovacími konvencemi
- **Konzistence dokumentace**: Zajištěno, že všechny reference používají profesionální, popisné názvy agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizace retail-multiagent-arm-template s odkazy na Customer agent
- **Architektonické diagramy**: Oživené Mermaid diagramy s aktualizovaným pojmenováním agentů
- **Příklady kódu**: Python třídy a ukázky implementace nyní používají pojmenování CustomerAgent
- **Proměnné prostředí**: Aktualizovány všechny skripty nasazení pro použití vzorů CUSTOMER_AGENT_NAME

#### Vylepšeno
- **Zkušenost vývojáře**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost do produkce**: Lepší sladění s podnikově orientovanými pojmenovacími konvencemi
- **Učební materiály**: Intuitivnější pojmenování agentů pro vzdělávací účely
- **Použitelnost šablon**: Zjednodušené pochopení funkcí agentů a vzorů nasazení

#### Technické detaily
- Aktualizovány Mermaid architektonické diagramy s odkazy na CustomerAgent
- Nahrazeny třídy CoraAgent za CustomerAgent v Python příkladech
- Upraveny ARM JSON konfigurace pro použití agent typu "customer"
- Aktualizovány proměnné prostředí z CORA_AGENT_* na CUSTOMER_AGENT_*
- Oživeny všechny příkazy nasazení a konfigurace kontejnerů

### [v3.0.0] - 2025-09-12

#### Hlavní změny - Zaměření na AI vývojáře a integrace Microsoft Foundry
**Tato verze transformuje repozitář do komplexního učebního zdroje zaměřeného na AI s integrací Microsoft Foundry.**

#### Přidáno
- **🤖 Učební cesta zaměřená na AI**: Kompletní restrukturalizace s prioritou pro AI vývojáře a inženýry
- **Průvodce integrací Microsoft Foundry**: Komplexní dokumentace propojující AZD se službami Microsoft Foundry
- **Vzory nasazení AI modelů**: Detailní průvodce pokrývající výběr modelů, konfiguraci a strategie nasazení do produkce
- **Workshop AI**: 2-3 hodinový praktický workshop na převedení AI aplikací na řešení nasaditelná pomocí AZD
- **Nejlepší postupy produkční AI**: Podnikové vzory pro škálování, monitorování a zabezpečení AI pracovních zatížení
- **Průvodce řešením problémů s AI**: Komplexní řešení problémů s Microsoft Foundry modely, Cognitive Services a AI nasazením
- **Galerie AI šablon**: Vybraná kolekce Microsoft Foundry šablon s hodnocením složitosti
- **Materiály workshopu**: Kompletní struktura workshopu s praktickými laboratořemi a referenčními materiály

#### Vylepšeno
- **Struktura README**: Zaměřeno na AI vývojáře s 45% komunitním zájmem z Microsoft Foundry Discord
- **Učební cesty**: Vyhrazená cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Doporučené šablony**: Vybrané AI šablony včetně azure-search-openai-demo, contoso-chat, a openai-chat-app-quickstart
- **Integrace komunity**: Vylepšená podpora komunitního Discordu s kanály a diskuzemi specifickými pro AI

#### Zaměření na bezpečnost a produkci
- **Vzorové managed identity**: AI specifická autentifikace a bezpečnostní konfigurace
- **Optimalizace nákladů**: Sledování použití tokenů a kontrola rozpočtu pro AI pracovní zatížení
- **Nasazení v multi-regionu**: Strategie pro globální nasazení AI aplikací
- **Monitorování výkonu**: AI specifické metriky a integrace Application Insights

#### Kvalita dokumentace
- **Lineární struktura kurzu**: Logický postup od začátečníka po pokročilé vzory AI nasazení
- **Ověřené URL**: Všechny externí odkazy na repozitáře ověřené a dostupné
- **Kompletní reference**: Všechny interní dokumentační odkazy ověřené a funkční
- **Připraveno do produkce**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Hlavní změny - Restrukturalizace repozitáře a profesionální vylepšení
**Tato verze představuje významnou revizi struktury repozitáře a prezentace obsahu.**

#### Přidáno
- **Strukturovaný rámec učení**: Všechny dokumentační stránky nyní obsahují sekce Úvod, Učební cíle a Výstupy učení
- **Navigační systém**: Přidány odkazy Přechod zpět/Další lekce v celé dokumentaci pro řízený postup učení
- **Studijní příručka**: Komplexní study-guide.md s učebními cíli, praktickými cvičeními a hodnotícími materiály
- **Profesionální prezentace**: Odstraněny všechny ikony emoji pro lepší přístupnost a profesionální vzhled
- **Vylepšená struktura obsahu**: Zlepšená organizace a tok učebních materiálů

#### Změněno
- **Formát dokumentace**: Standardizováno veškerá dokumentace s konzistentní strukturou zaměřenou na učení
- **Tok navigace**: Zaveden logický postup ve všech učebních materiálech
- **Prezentace obsahu**: Odstraněny dekorativní prvky ve prospěch jasného, profesionálního formátování
- **Struktura odkazů**: Aktualizovány všechny interní odkazy pro podporu nového navigačního systému

#### Vylepšeno
- **Přístupnost**: Odstraněna závislost na emoji pro lepší kompatibilitu s čtečkami obrazovky
- **Profesionální vzhled**: Čistá akademická prezentace vhodná pro podnikové vzdělávání
- **Učební zkušenost**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Organizace obsahu**: Lepší logický tok a propojení mezi souvisejícími tématy

### [v1.0.0] - 2025-09-09

#### Počáteční vydání - Komplexní repozitář pro učení AZD

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní průvodce začátkem
  - Komplexní dokumentace nasazení a provisioningu
  - Podrobné zdroje pro řešení problémů a debugování
  - Nástroje a postupy pro přednasazovací ověření

- **Modul pro začátečníky**
  - Základy AZD: Klíčové koncepty a terminologie
  - Průvodce instalací: Návody pro platformy
  - Vedení konfigurace: Nastavení prostředí a autentifikace
  - První projekt: Krok za krokem praktické učení

- **Modul nasazení a provisioningu**
  - Průvodce nasazením: Kompletní dokumentace workflow
  - Průvodce provisioningem: Infrastruktura jako kód pomocí Bicep
  - Nejlepší postupy pro produkční nasazení
  - Vzory architektury více služeb

- **Modul přednasazovacího ověřování**
  - Plánování kapacit: Ověření dostupnosti Azure zdrojů
  - Výběr SKU: Komplexní pokyny pro úrovně služeb
  - Kontroly před nasazením: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul řešení problémů**
  - Běžné problémy: Často se vyskytující problémy a jejich řešení
  - Průvodce debugováním: Systematické metodiky řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a reference**
  - Přehled základních příkazů: Rychlý přehled důležitých příkazů
  - Slovník: Kompletní definice terminologie a zkratek
  - FAQ: Podrobné odpovědi na časté otázky
  - Externí odkazy a komunitní propojení

- **Příklady a šablony**
  - Příklad jednoduché webové aplikace
  - Šablona nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databází
  - Příklady architektury mikroservis
  - Implementace serverless funkcí

#### Funkce
- **Podpora více platforem**: Průvodci instalací a konfigurací pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah navržený pro studenty až po profesionální vývojáře
- **Praktické zaměření**: Praktické příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé podnikové vzory
- **Přístup zaměřený na bezpečnost**: Nejlepší bezpečnostní postupy začleněné napříč materiály
- **Optimalizace nákladů**: Pokyny pro nákladově efektivní nasazení a správu zdrojů

#### Kvalita dokumentace
- **Podrobné ukázky kódu**: Praktické, otestované vzory kódu
- **Návody krok za krokem**: Jasné, realizovatelné pokyny
- **Komplexní zpracování chyb**: Řešení problémů s běžnými chybami
- **Začlenění nejlepších postupů**: Průmyslové standardy a doporučení
- **Kompatibilita verzí**: Aktuální s nejnovějšími Azure službami a funkcemi azd

## Plánovaná budoucí vylepšení

### Verze 3.1.0 (plánováno)
#### Rozšíření AI platformy
- **Podpora více modelů**: Integrace Hugging Face, Azure Machine Learning a vlastních modelů
- **Rámce AI agentů**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databází nad rámec Azure AI Search (Pinecone, Weaviate apod.)
- **AI Observability**: Vylepšené monitorování výkonu modelů, využití tokenů a kvality odpovědí

#### Zkušenost vývojáře
- **Rozšíření VS Code**: Integrovaná vývojová zkušenost AZD + Microsoft Foundry
- **Integrace GitHub Copilot**: AI asistovaná generace AZD šablon
- **Interaktivní tutoriály**: Praktická cvičení s automatickým ověřováním pro AI scénáře
- **Video obsah**: Doplňkové video návody zaměřené na vizuální studenty učící se AI nasazení

### Verze 4.0.0 (plánováno)
#### Podnikové AI vzory
- **Rámec správy**: Správa AI modelů, dodržování předpisů a auditní stopy
- **Multi-tenancy AI**: Vzory pro poskytování služeb více zákazníkům s izolovanými AI službami
- **Edge AI nasazení**: Integrace s Azure IoT Edge a kontejnerovými instancemi
- **Hybridní cloud AI**: Multi-cloud a hybridní vzory nasazení AI pracovních zatížení

#### Pokročilé funkce
- **Automatizace AI pipeline**: Integrace MLOps s Azure Machine Learning pipelines
- **Pokročilá bezpečnost**: Zero-trust vzory, privátní endpointy a pokročilá ochrana proti hrozbám
- **Optimalizace výkonu**: Pokročilé ladění a škálování pro AI aplikace s vysokou propustností
- **Globální distribuce**: Vzory distribuce obsahu a edge cache pro AI aplikace

### Verze 3.0.0 (plánováno) - nahrazeno aktuálním vydáním
#### Navrhované přidání - nyní implementováno ve v3.0.0
- ✅ **Obsah zaměřený na AI**: Komplexní integrace Microsoft Foundry (dokončeno)
- ✅ **Interaktivní tutoriály**: Praktický AI workshop lab (dokončeno)
- ✅ **Pokročilý bezpečnostní modul**: AI specifické bezpečnostní vzory (dokončeno)
- ✅ **Optimalizace výkonu**: Strategie ladění AI pracovních zatížení (dokončeno)

### Verze 2.1.0 (plánováno) - částečně implementováno ve v3.0.0
#### Menší vylepšení - některá dokončena v aktuálním vydání
- ✅ **Další příklady**: AI zaměřené scénáře nasazení (dokončeno)
- ✅ **Rozšířené FAQ**: AI specifické otázky a řešení problémů (dokončeno)
- **Integrace nástrojů**: Rozšířené průvodce IDE a editor integrací
- ✅ **Rozšíření monitoringu**: AI specifické monitorovací a upozorňovací vzory (dokončeno)

#### Ještě plánováno pro budoucí vydání
- **Mobilně přívětivá dokumentace**: Responzivní design pro mobilní učení
- **Offline přístup**: Stažitelné balíčky dokumentace
- **Vylepšená integrace IDE**: VS Code rozšíření pro AZD + AI pracovní postupy
- **Komunitní dashboard**: Metiky komunity v reálném čase a sledování příspěvků

## Přispívání do změnového logu

### Hlásit změny
Při přispívání do tohoto repozitáře prosím zajistěte, aby záznamy v changelogu obsahovaly:

1. **Číslo verze**: Podle semver (major.minor.patch)
2. **Datum**: Datum vydání nebo aktualizace ve formátu RRRR-MM-DD
3. **Kategorie**: Přidáno, Změněno, Zastaralé, Odebráno, Opraveno, Bezpečnost
4. **Jasný popis**: Stručný popis změny
5. **Hodnocení dopadu**: Jak změny ovlivní stávající uživatele

### Kategorie změn

#### Přidáno
- Nové funkce, dokumentační sekce nebo schopnosti
- Nové příklady, šablony nebo učební zdroje
- Další nástroje, skripty nebo užitečné pomůcky

#### Změněno
- Úpravy stávající funkcionality nebo dokumentace
- Aktualizace pro zlepšení jasnosti nebo přesnosti
- Restrukturalizace obsahu nebo organizace

#### Zastaralé
- Funkce nebo přístupy, které jsou postupně vyřazovány
- Dokumentační sekce určené k odstranění
- Metody, které mají lepší alternativy

#### Odebráno
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo vyřazené přístupy
- Nadbytečný nebo konsolidovaný obsah

#### Opraveno
- Opravy chyb v dokumentaci nebo kódu
- Vyřešení hlášených problémů nebo chyb
- Vylepšení přesnosti nebo funkcionality


#### Zabezpečení
- Vylepšení nebo opravy související se zabezpečením
- Aktualizace nejlepších bezpečnostních postupů
- Řešení bezpečnostních zranitelností

### Pokyny k sémantickému verzování

#### Hlavní verze (X.0.0)
- Zásadní změny vyžadující akci uživatele
- Významná restrukturalizace obsahu nebo organizace
- Změny, které mění základní přístup nebo metodiku

#### Menší verze (X.Y.0)
- Nové funkce nebo přidání obsahu
- Vylepšení zachovávající zpětnou kompatibilitu
- Další příklady, nástroje nebo zdroje

#### Opravná verze (X.Y.Z)
- Opravy chyb a korekce
- Drobná vylepšení stávajícího obsahu
- Upřesnění a menší vylepšení

## Zpětná vazba a návrhy od komunity

Aktivně podporujeme zpětnou vazbu od komunity k vylepšení tohoto vzdělávacího zdroje:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Nahlášení problémů nebo návrhy na vylepšení (problémy specifické pro AI jsou vítány)
- **Diskuse na Discordu**: Sdílení nápadů a komunikace s komunitou Microsoft Foundry
- **Pull Requesty**: Přímý příspěvek ke zlepšení obsahu, zejména AI šablon a průvodců
- **Microsoft Foundry Discord**: Účast v kanálu #Azure pro diskuse o AZD + AI
- **Fóra komunity**: Účast v širších diskuzích Azure vývojářů

### Kategorie zpětné vazby
- **Přesnost AI obsahu**: Opravy informací o integraci a nasazení AI služeb
- **Zážitek z učení**: Návrhy na zlepšení učebního toku pro AI vývojáře
- **Chybějící AI obsah**: Požadavky na další AI šablony, vzory nebo příklady
- **Přístupnost**: Vylepšení pro různé potřeby učení
- **Integrace AI nástrojů**: Návrhy na lepší integraci do AI vývojářského workflow
- **Produktioní AI vzory**: Požadavky na nasazení AI ve firemním prostředí

### Závazek k odpovědi
- **Odpověď na problémy**: Do 48 hodin od nahlášení problémů
- **Požadavky na funkce**: Vyhodnocení do jednoho týdne
- **Příspěvky komunity**: Přezkoumání do jednoho týdne
- **Bezpečnostní problémy**: Okamžitá priorita s urychlenou odpovědí

## Plán údržby

### Pravidelné aktualizace
- **Měsíční kontroly**: Přesnost obsahu a kontrola odkazů
- **Čtvrtletní aktualizace**: Hlavní přídavky a vylepšení obsahu
- **Půlroční kontroly**: Komplexní restrukturalizace a zlepšení
- **Roční vydání**: Hlavní verze s významnými vylepšeními

### Monitorování a zajištění kvality
- **Automatizované testování**: Pravidelná validace ukázek kódu a odkazů
- **Integrace zpětné vazby komunity**: Pravidelné zapracování uživatelských návrhů
- **Aktualizace technologií**: Soulad s nejnovějšími službami Azure a vydáními azd
- **Audity přístupnosti**: Pravidelná kontrola zásad inkluzivního designu

## Politika podpory verzí

### Podpora aktuální verze
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Bezpečnostní aktualizace a kritické opravy po dobu 12 měsíců
- **Starší verze**: Pouze komunitní podpora, bez oficiálních aktualizací

### Pokyny k migraci
Při vydání hlavních verzí poskytujeme:
- **Průvodce migrací**: Postupné instrukce přechodu
- **Poznámky o kompatibilitě**: Podrobnosti o nekompatibilních změnách
- **Podpora nástrojů**: Skripty nebo utility k usnadnění migrace
- **Podpora komunity**: Dedikovaná fóra pro dotazy k migraci

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Návrat do [Hlavního README](README.md)

**Zůstaňte informováni**: Sledujte tento repozitář pro oznámení o nových vydáních a důležitých aktualizacích učebních materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
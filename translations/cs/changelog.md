# Změny - AZD Pro Začátečníky

## Úvod

Tento seznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD Pro Začátečníky. Dodržujeme principy sémantického verzování a tento záznam udržujeme, aby uživatelé pochopili, co se mezi verzemi změnilo.

## Vzdělávací cíle

Přezkoumáním tohoto seznamu změn budete:
- Informováni o nových funkcích a přídavcích obsahu
- Rozumět vylepšením stávající dokumentace
- Sledovat opravy chyb a korekce pro zajištění přesnosti
- Sledovat vývoj učebních materiálů v čase

## Výstupy učení

Po přezkoumání zápisů budete schopni:
- Identifikovat nový obsah a dostupné zdroje k učení
- Pochopit, které části byly aktualizovány nebo vylepšeny
- Naplánovat si vzdělávací cestu podle nejaktuálnějších materiálů
- Přispívat zpětnou vazbou a návrhy na budoucí vylepšení

## Historie verzí

### [v3.24.0]- 2026-11-04

#### Opraveno
- Opravená navigace kurzu v angličtině, cesty přesunutých stránek, chybějící kotvy a zastaralé externí odkazy, včetně odkazu v kapitole 2 na průvodce produkční AI.
- Přezkoumáno aktuální vedení proti publikované verzi AZD 1.37.2, agents 1.0.0-beta.23 a evaluacím 1.0.0-beta.2. Zdokumentován samostatný `azd ai eval` workflow a migrace konfigurace optimalizace.
- Opraveny nepodporované flagy CLI, hranice autentizace, pokyny pro prostý text u prostředí/tajností, aktualizace infrastruktury, konfigurace modelu a příklady destruktivní obnovy.
- Aktualizován workshop podle současného vzoru AI Agents, včetně skutečných háků, vstupů konfigurace, testů evaluací, vstupních bodů red-teamingu a observability.
- Opraveny tvrzení o ukázkové implementaci a opraveny související problémy s aplikací/infrastrukturou/konfigurací. Materiál architektury pro retail je explicitně odlišen od kompletní plně funkční aplikace.
- Obnovena jazyková matice CodeQL, zvolen podporovaný Node.js 24 pro dev kontejner a validátory nasazení hlásí neúspěšné verzovací příkazy.

#### Přidáno
- Offline kontrola odkazu/kotvy pouze v angličtině, regresní testy a workflow pro dokumentaci, které také buduje workshop v přísném režimu. Generované překlady a přeložené obrázky jsou vyloučeny.

#### Rozsah validace
- Kontroly zdrojového kódu, syntaxe, konfigurace, lokálního chování a síťových odkazů nezaručují živé nasazení v Azure, kvóty, RBAC, dostupnost regionálních modelů, fakturaci, bezpečnostní soulad ani připravenost na produkční prostředí.
- Starší záznamy níže jsou historické záznamy, ne aktuální příkazy nebo instrukce pro vydání.

### [v3.23.0] - 2026-07-13

#### Obnovení AZD 1.27.1: Aktualizace verze
**Tato verze znovu validuje kurz podle `azd` `1.27.1` (červenec 2026, nejnovější stabilní vydání) a aktuální náhledové rozšíření AI agentů `azure.ai.agents` `1.0.0-beta.5`, čímž obnovuje všechny bannery "validováno podle" po vydáních 1.26.0, 1.27.0 a 1.27.1.**

#### Změněno
- **✅ Aktualizace validační základny** z `azd 1.25.6` (červen 2026) na `azd 1.27.1` (červenec 2026) napříč hlavním README, všemi kapitoly README, lekcí dev-kontejneru v kapitole 1 (včetně příkladů s připnutými verzemi), lekcí vlastních šablon v kapitole 4, lekcí multi-agent v kapitole 5 a dokumentací workshopu
- **🤖 Obnovení základny kapitoly 2** z `azd 1.23.12` (březen 2026) na `azd 1.27.1` napříč `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` a `microsoft-foundry-integration.md`; data poznámek a validací aktualizována na 2026-07-13
- **🧩 Aktualizace rozšíření AI agenta** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na aktuální vydání `1.0.0-beta.5` v README kapitoly 2 a `agents.md`
- **🧪 Aktualizace validačního příkladu workshopu** (výstup `azd version`) na `1.27.1`

#### Poznámky k relevantním azd vydáním (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora Go pro Azure Functions na Flex Consumption, výběr předplatného na základě nájemce pomocí `azd config sub-filter`, samostatné bundly rozšíření (`azd x pack --bundle`) a `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelování projektů/agentů Azure AI Foundry přímo v `azure.yaml` (inicializace bez Bicep/Terraform), podpora nasazení kontejnerů pro App Service (`host: appservice` + `language: docker`), přímé příkazy `-s/--source` pro `azd extension` a `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` pro `azd extension install`, zastaralé modely ve výchozím nastavení vyloučeny z katalogu/kvótního upozornění a několik oprav chyb

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

#### Začátečnické doplnění #2: Autorská šablona, Dev kontejnery, Pulumi, Azure DevOps, Service Principals a další
**Tato verze zavírá zbývající mezery střední úrovně podle analýzy azd-coverage: jak tvořit a publikovat vlastní šablonu, reprodukovatelná dev-kontejner/Codespaces prostředí, poskytovatel infrastruktury Pulumi, procházení CI/CD v Azure DevOps, autentizace pomocí service principals, pokyny pro výběr hostitele (AKS/Spring Apps), vysvětlení `azd restore`/`azd package`, zpracování chyb hooků a praxe týmového/sdíleného prostředí.**

#### Přidáno
- **🧱 Nová lekce kapitoly 4** `docs/chapter-04-infrastructure/custom-templates.md` — tvorba vlastní azd šablony: požadovaná struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametrizace infrastruktury pomocí tokenu zdroje `uniqueString()` a tagu `azd-env-name`, lokální testování pomocí `azd init --template <local-path>`, publikování na GitHub a podání do galerie Awesome AZD
- **📦 Nová lekce kapitoly 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovatelná prostředí azd pomocí Dev kontejnerů a GitHub Codespaces: minimální `.devcontainer/devcontainer.json` používající oficiální funkci `ghcr.io/azure/azure-dev/azd`, jazykově specifické funkce, `docker-in-docker` pro hostitele kontejneru a `azd auth login --use-device-code` pro vzdálené přihlášení
- **🧩 Pulumi s azd** sekce v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, rozvržení složek Pulumi, stavy namapované na azd prostředí, vyžadované výstupy/tagování a identický workflow `azd up` / `azd down`
- **🎯 Pokyny pro výběr hostitele** v `docs/chapter-04-infrastructure/provisioning.md` — přátelské srovnání `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp`, s radami, kdy zvolit AKS nebo Azure Spring Apps
- **🛠️ Průchod Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, služební připojení pomocí workload identity federation (OIDC), generovaný `azure-dev.yml` a nastavení skupiny proměnných
- **🔑 Service Principals (vzorec 4)** přidáno do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivní `azd auth login` s klientským tajemstvím vs. federovanými/OIDC přihlašovacími údaji, kdy použít a bezpečné ukládání údajů
- **🪝 Zpracování chyb hooků** podsekce v `docs/chapter-04-infrastructure/deployment-guide.md` — ukončovací kódy a `set -e`, `continueOnError`, testování hooků izolovaně pomocí `azd hooks run`, OS-specifické shell prostředí a `--debug`
- **👥 Týmová / sdílená prostředí** sekce v `docs/chapter-03-configuration/configuration.md` — co je v `.azure/`, co ignorovat v gitu, prostředí pro jednotlivé vývojáře, `azd env list`/`select` a poskytování hodnot prostředí v CI/CD
- **🧰 `azd restore` a rozšířená vysvětlení `azd package`** v `resources/cheat-sheet.md` — obnovení závislostí a sestavení nasaditelného artefaktu bez nasazení

#### Změněno
- **🧭 Tabulka lekcí kapitoly 4** aktualizována o novou lekci "Tvorba vlastní šablony" (Lekce 3)
- **🧭 Tabulka lekcí kapitoly 1** aktualizována o novou lekci "Dev kontejnery & Codespaces" (Lekce 5); navigační patičky propojují `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začátečnické doplnění: Praktická lekce multi-agentů, „Bring Your Own App“, Terraform a průchod CI/CD
**Tato verze zavírá největší mezery pro kompletní průvodce začátečníka přidáním dvou nových praktických lekcí (nasaditelný průchod více agentů a přidání azd do existující aplikace), začátečnického úvodu do hooků, sekce Terraform s azd, krok za krokem GitHub Actions průchod, vysvětlovač nových náhledových rozšíření a explicitní kontrolní seznam ověření nasazení.**

#### Přidáno
- **🤝 Nová lekce kapitoly 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plně praktický, nasaditelný dvouagentní průchod (orchestrace + specialisté) používající reálnou šablonu (`contoso-creative-writer`), pokrývající kdy použít multi-agent, workflow `azd up`, porozumění nasazeným zdrojům, trasování mezi agenty, přizpůsobení a úklid
- **📦 Nová lekce kapitoly 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak přidat azd do existujícího projektu pomocí `azd init` ("použít kód v aktuálním adresáři"), porozumění `azure.yaml` a `infra/`, `azd infra generate`, detekce hostitele a nasazení pomocí `azd up`
- **🌐 Sekce Terraform s azd** přidána do `docs/chapter-04-infrastructure/provisioning.md` — konfigurace `infra.provider: terraform`, rozvržení složek `.tf`, potřebné výstupy `AZURE_*` a tagování `azd-env-name`, a identický workflow `azd up` / `azd down` (uzavírá mezeru, kde byla podpora Terraform deklarována, ale byl ukázán pouze Bicep)
- **⚙️ Krok za krokem průchod GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitáře po automatizovaná nasazení: `azd pipeline config`, OIDC federované přihlašovací údaje (bez uložených tajností), generovaný `azure-dev.yml` a pokyny pro tajnosti vs. proměnné
- **🪝 Začátečnický úvod „Nový v hookech?“** v `docs/chapter-04-infrastructure/deployment-guide.md` — co je hook, tabulka stadií hooku, minimální první hook a ruční spuštění hooků pomocí `azd hooks run`
- **✅ Přidán kontrolní seznam „Ověřte své nasazení“** do kroku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola zdraví endpointu a explicitní kritéria úspěchu
- **🧩 Vysvětlení nových náhledových rozšíření** `azure.ai.skills` a `azure.ai.connections` (co jsou a kdy je využívat) v `docs/chapter-08-production/production-ai-practices.md`

#### Změněno
- **🧭 Tabulka lekcí kapitoly 5** opravena: `multi-agent-basics.md` je nyní Lekce 1 (jediná plně praktická lekce), s poctivým označením, že Lekce 2 je v kapitole 6 a scénář Retail je architektonický plán, ne šablona s jedním příkazem
- **🧭 Tabulka lekcí kapitoly 1** nyní zahrnuje novou lekci "Bring Your Own App" (Lekce 4)
- **🔗 Navigační patičky** aktualizovány: `first-project.md` nyní odkazují vpřed na `bring-your-own-app.md`

#### Opraveno
- **🧱 Uzavřena mezera „deklarované, ale chybějící“ Terraform** — kurz dříve zmiňoval podporu Terraform bez její ukázky
- **🔀 Opraveny matoucí křížové odkazy kapitoly 5**, které naznačovaly existenci plné multi-agent implementace, zatímco byla pouze architektonická schéma

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

#### Obnovení AZD 1.25.6, Kompletní příkazy pro životní cyklus agenta a Rebranding Aspire
**Tato verze znovu ověřuje kurz proti `azd` `1.25.6` (červen 2026) a prodloužení `azure.ai.agents` `0.1.40-preview`, rozšiřuje AI pokyny z "vytvoření agenta" na celý životní cyklus agenta (test → vyhodnocení → optimalizace → kontrola → odstranění), zobrazuje nové ukázkové rozšíření `azure.ai.skills` a `azure.ai.connections` a upozorňuje na rebranding produktu z ".NET Aspire" na "Aspire".**

#### Přidáno
- **🔁 Kompletní pokrytí životního cyklu agenta** pro začátečníky i AI inženýry napříč dokumentací:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabulka životního cyklu (vytvoření → testování → měření → zlepšení → kontrola → úklid) přidána do sekce Rozšíření a AI příkazů
  - `docs/chapter-08-production/production-ai-practices.md` — Nová sekce "Správa životního cyklu agenta" zahrnující `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — Rozšířené příkazy AI agenta s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nová ukázková rozšíření** zdokumentována: `azure.ai.skills` (znovupoužitelné agentní dovednosti) a `azure.ai.connections` (Foundry připojení) přidány do tabulky rozšíření a přehledu příkazů
- **⏱️ Pokyny pro časování odpovědi** — příklady `azd ai agent invoke` nyní uvádějí celkové zpoždění a čas do prvního bajtu
- **📌 Banner verze** v hlavním README vede studenty k `azd version` a `azd upgrade`

#### Změněno
- **✅ Aktualizována validační základna** z `azd 1.23.12` (březen 2026) na `azd 1.25.6` (červen 2026) ve všech README kapitol a workshopových dokumentech
- **🤖 Aktualizována poznámka v kapitole 2** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Aktualizován validační příklad workshopu** (výstup `azd version`) na `1.25.6`
- **🧭 README "Co je nového v azd Dnes"** aktualizováno tak, aby vyzdvihovalo celý životní cyklus agenta, nová AI rozšíření a nedávné zlepšení uživatelského komfortu (`azd init` idempotence, `azd auth login` vyčištění zastaralých tokenů, `azd tool` prompt při prvním spuštění)
- **📖 Kapitola 2 agents.md (Volba 4)** nyní vede studenty k příkazům životního cyklu po nasazení místo zastavení u `azd up`

#### Opraveno
- **🏷️ Pojmenování produktu** — přidána poznámka k rebrandingu Aspire (".NET Aspire" je nyní jednoduše "Aspire"); podpora Aspire v azd zůstává beze změny
- **🔎 Živá validace vydání** potvrzena vůči Azure Developer CLI release feed: stabilní CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Upřesnění pro začátečníky, validace nastavení a finální úklid příkazů AZD
**Tato verze navazuje na kontrolu AZD 1.23 s dokumentačním průchodem zaměřeným na začátečníky: objasňuje ověřování s AZD jako první volbou, přidává skripty pro validaci lokálního nastavení, ověřuje klíčové příkazy vůči živému AZD CLI a odstraňuje poslední zastaralé odkazy na příkazy v angličtině mimo changelog.**

#### Přidáno
- **🧪 Skripty pro validaci nastavení pro začátečníky** s `validate-setup.ps1` a `validate-setup.sh`, aby si studenti mohli ověřit potřebné nástroje před začátkem první kapitoly
- **✅ Úvodní kroky validace nastavení** v hlavním README a README první kapitoly pro zajištění zachycení chybějících předpokladů před `azd up`

#### Změněno
- **🔐 Pokyny k autentizaci pro začátečníky** nyní konzistentně považují `azd auth login` za primární cestu pro workflow AZD, přičemž `az login` je uveden jako volitelný, pokud se příkazy Azure CLI používají přímo
- **📚 Průběh onboardingu v kapitole 1** nyní směřuje studenty k ověření jejich lokálního nastavení před instalací, autentizací a prvním nasazením
- **🛠️ Zprávy validátoru** nyní jasně oddělují blokující požadavky od volitelných varování Azure CLI pro cestu začátečníka používajícího pouze AZD
- **📖 Dokumentace ke konfiguraci, řešení problémů a příkladům** nyní rozlišuje mezi požadovaným ověřováním v AZD a volitelným přihlášením v Azure CLI tam, kde byly dříve oba způsoby prezentovány bez kontextu

#### Opraveno
- **📋 Zbývající odkazy na anglické příkazy** aktualizovány na aktuální tvary AZD, včetně `azd config show` v přehledu příkazů a `azd monitor --overview` tam, kde byl zamýšlen návod na Azure Portal
- **🧭 Nároky pro začátečníky v kapitole 1** zmírněny, aby se předešlo nadsázkám o zaručeném bezchybovém nebo rollback chování napříč všemi šablonami a Azure zdroji
- **🔎 Živá validace CLI** potvrzující aktuální podporu pro `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

#### Validace AZD 1.23.12, rozšíření workshopového prostředí a obnovení modelu AI
**Tato verze provádí dokumentační validační průchod vůči `azd` `1.23.12`, aktualizuje zastaralé příklady příkazů AZD, obnovuje AI pokyny k modelům na aktuální výchozí hodnoty a rozšiřuje instrukce workshopu nad rámec GitHub Codespaces také na dev kontejnery a lokální klony.**

#### Přidáno
- **✅ Poznámky k validaci napříč klíčovými kapitolami a dokumentací workshopu** pro explicitní uvedení testované základy AZD pro studenty používající novější či starší verze CLI
- **⏱️ Pokyny pro časový limit nasazení** u dlouhotrvajících AI nasazení s použitím `azd deploy --timeout 1800`
- **🔎 Kroky kontroly rozšíření** s `azd extension show azure.ai.agents` v dokumentaci AI workflow
- **🌐 Rozšířené pokyny pro workshopové prostředí** pokrývající GitHub Codespaces, dev kontejnery a lokální klony pomocí MkDocs

#### Změněno
- **📚 Úvodní README kapitol** nyní konzistentně uvádí validaci vůči `azd 1.23.12` v sekcích základy, konfigurace, infrastruktura, víceagentní, před nasazením, řešení problémů a produkce
- **🛠️ Odkazy na příkazy AZD** aktualizovány na současné formy v celé dokumentaci:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` nebo `azd env get-value(s)` dle kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kde je zamýšlen přehled Application Insights
- **🧪 Ukázky pro preview provisioning** zjednodušeny na aktuálně podporované použití jako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Workshopový průběh** aktualizován tak, aby studenti mohli dokončit laboratoře v Codespaces, dev kontejneru nebo lokálním klonu místo předpokladu pouze Codespaces
- **🔐 Pokyny k autentizaci** nyní preferují `azd auth login` pro AZD workflow, přičemž `az login` je volitelný, pokud se Azure CLI příkazy používají přímo

#### Opraveno
- **🪟 Příkazy pro instalaci ve Windows** normalizovány na aktuální pojmenování balíčku `winget` v instalační příručce
- **🐧 Pokyny pro instalaci v Linuxu** opraveny tak, aby neukazovaly na nepodporované specifické správce balíčků `azd` a místo toho odpovídající odkaz na releasové soubory
- **📦 Příkladové AI modely** obnoveny ze starších výchozích jako `gpt-35-turbo` a `text-embedding-ada-002` na aktuální jako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Nasazovací a diagnostické ukázky** opraveny pro použití aktuálních příkazů prostředí a stavu v protokolech, skriptech a odstraňování problémů
- **⚙️ Pokyny pro GitHub Actions** aktualizovány z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny pro souhlas MCP/Copilot** aktualizovány z `azd mcp consent` na `azd copilot consent list`

#### Vylepšeno
- **🧠 Pokyny pro AI kapitolu** nyní lépe vysvětlují chování citlivé na preview `azd ai`, přihlášení specifické pro tenant, aktuální využití rozšíření a aktualizovaná doporučení pro nasazení modelu
- **🧪 Instrukce workshopu** nyní používají realističtější verze příkladů a jasnější jazyk pro nastavení prostředí v praktických laboratořích
- **📈 Produkční a vyhledávací dokumentace** jsou nyní lépe sladěné s aktuálními příklady monitorování, modelu fallback a úrovní nákladů

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
**Tato verze přidává pokrytí příkazů `azd ai`, `azd extension` a `azd mcp` napříč všemi kapitolami souvisejícími s AI, opravuje nefunkční odkazy a zastaralý kód v agents.md, aktualizuje přehled příkazů a kompletně předělává sekci Příkladových šablon s ověřenými popisy a novými Azure AI AZD šablonami.**

#### Přidáno
- **🤖 Pokrytí AZD AI CLI** ve 7 souborech (dříve pouze v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekce "Rozšíření a AI příkazy" představující `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Volba 4: `azd ai agent init` s porovnávací tabulkou (přístup šablony vs. manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekce "AZD Rozšíření pro Foundry" a "Nasazení prioritou agenta"
  - `docs/chapter-05-multi-agent/README.md` — Rychlý start nyní ukazuje cesty nasazení založené jak na šablonách, tak na manifestech
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekce nasazení nyní obsahuje volbu `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekce "AZD AI rozšíření pro diagnostiku"
  - `resources/cheat-sheet.md` — Nová sekce "AI a Rozšíření Příkazy" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI příkladové šablony** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat s Langchain4J s možnostmi nasazení ACA/AKS
  - **contoso-creative-writer** — Multi-agentní aplikace pro kreativní psaní využívající Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG používající Azure Functions + LangChain.js + Cosmos DB s lokální vývojovou podporou Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový RAG akcelerátor s portálem pro administrátory, integrací do Teams a možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenční aplikace multi-agentní orchestrace MCP se servery v .NET, Python, Java a TypeScript
  - **azd-ai-starter** — Minimální startovací šablona pro infrastrukturu Azure AI v Bicep
  - **🔗 Odkaz na úžasnou galerii AZD AI** — Odkaz na [awesome-azd AI galerii](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablon)

#### Opraveno
- **🔗 navigace agents.md**: Odkazy Předchozí/Další nyní odpovídají pořadí lekcí v kapitole 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 poškozené odkazy v agents.md**: `production-ai-practices.md` opraven na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 zastaralý kód v agents.md**: Nahrazen `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neplatné API v agents.md**: Přesunuto `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 počítání tokenů v agents.md**: Přesná náhrada hrubého odhadu `len//4` přes `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opraveny služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (výchozí hostitel změněn v říjnu 2024)
- **contoso-chat**: Aktualizován popis, který odkazuje na Azure AI Foundry + Prompty, odpovídající skutečnému názvu repozitáře a technologickému zásobníku

#### Odebráno
- **ai-document-processing**: Odebrána nefunkční šablona (repo není veřejně dostupné jako šablona AZD)

#### Vylepšeno
- **📝 cvičení v agents.md**: Cvičení 1 nyní zobrazuje očekávaný výstup a krok `azd monitor`; Cvičení 2 obsahuje kompletní registrační kód `FunctionTool`; Cvičení 3 nahrazuje vágní pokyny konkrétními příkazy `prepdocs.py`
- **📚 zdroje v agents.md**: Aktualizovány odkazy na dokumentaci k Azure AI Agent Service a rychlý start
- **📋 tabulka Další kroky v agents.md**: Přidán odkaz na laboratoř AI Workshop pro kompletní pokrytí kapitoly

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
**Tato verze zlepšuje navigaci v README.md kapitolách s vylepšeným formátem tabulky.**

#### Změny
- **Tabulka mapy kurzu**: Vylepšena o přímé odkazy na lekce, odhady délky a hodnocení složitosti
- **Úklid složek**: Odstraněny redundantní staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Ověření odkazů**: Ověřeno všech 21+ interních odkazů v tabulce mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty podle aktuálního Microsoft brandingu.**

#### Změny
- **Microsoft Foundry → Microsoft Foundry**: Aktualizovány všechny odkazy napříč netranslačními soubory
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován podle současného brandingu

#### Aktualizované soubory
- `README.md` - Hlavní vstupní stránka kurzu
- `changelog.md` - Historie verzí
- `course-outline.md` - Struktura kurzu
- `docs/chapter-02-ai-development/agents.md` - Průvodce AI agenty
- `examples/README.md` - Dokumentace příkladů
- `workshop/README.md` - Úvodní stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všechny soubory s instrukcemi workshopu

---

### [v3.15.0] - 2026-02-05

#### Hlavní restrukturalizace repozitáře: Složky pojmenované dle kapitol
**Tato verze restrukturalizuje dokumentaci do samostatných složek kapitol pro přehlednější navigaci.**

#### Přejmenování složek
Staré složky byly nahrazeny složkami s čísly kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Přidáno nové: `docs/chapter-05-multi-agent/`

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
| Všechny soubory pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Všechny soubory troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Přidáno
- **📚 README soubory kapitol**: Vytvořen README.md v každé složce kapitoly s:
  - Cíli učení a délkou
  - Tabulkou lekcí s popisy
  - Příkazy pro rychlý start
  - Navigací do ostatních kapitol

#### Změny
- **🔗 Aktualizované všechny interní odkazy**: Více než 78 cest aktualizováno ve všech dokumentačních souborech
- **🗺️ Hlavní README.md**: Aktualizována mapa kurzu podle nové struktury kapitol
- **📝 examples/README.md**: Aktualizovány křížové odkazy na složky kapitol

#### Odebráno
- Staré složkové struktury (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace repozitáře: Navigace podle kapitol
**Tato verze přidala README soubory pro navigaci kapitol (nahradila verze v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový průvodce AI agenty
**Tato verze přidává komplexní průvodce nasazením AI agentů s Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce pokrývající:
  - Co jsou AI agenti a jak se liší od chatbotů
  - Tři šablony pro rychlý start agentů (Foundry Agents, Prompty, RAG)
  - Vzory architektury agentů (jediný agent, RAG, multi-agent)
  - Konfigurace a přizpůsobení nástrojů
  - Sledování a metriky
  - Náklady a optimalizace
  - Časté scénáře řešení problémů
  - Tři praktická cvičení s hodnoticími kritérii

#### Struktura obsahu
- **Úvod**: Koncepty agentů pro začátečníky
- **Rychlý start**: Nasazení agentů s `azd init --template get-started-with-ai-agents`
- **Vzory Architektury**: Vizualizace vzorů agentů
- **Konfigurace**: Nastavení nástrojů a proměnné prostředí
- **Monitorování**: Integrace Application Insights
- **Cvičení**: Postupné praktické učení (20-45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace vývojového kontejneru DevContainer
**Tato verze aktualizuje konfiguraci vývojového kontejneru s moderními nástroji a lepšími výchozími hodnotami pro AZD učební zážitek.**

#### Změny
- **🐳 Základní obraz**: Aktualizován z `python:3.12-bullseye` na `python:3.12-bookworm` (nejnovější Debian stable)
- **📛 Název kontejneru**: Přejmenován z "Python 3" na "AZD pro začátečníky" pro větší přehlednost

#### Přidáno
- **🔧 Nové funkce Dev kontejneru**:
  - `azure-cli` s podporou Bicep
  - `node:20` (verze LTS pro AZD šablony)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazování kontejnerových aplikací

- **🔌 Přesměrování portů**: Přednastavené porty pro běžný vývoj:
  - 8000 (náhled MkDocs)
  - 3000 (webové aplikace)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nové rozšíření VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojů
  - `yzhang.markdown-all-in-one` - Úprava Markdown
  - `DavidAnson.vscode-markdownlint` - Kontrola Markdown
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramů
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Git
  - `mhutchie.git-graph` - Historie Git

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro Python interpret, formátování při ukládání a ořezávání mezer

- **📦 Aktualizován requirements-dev.txt**:
  - Přidán MkDocs minify plugin
  - Přidán pre-commit pro kvalitu kódu
  - Přidány balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Post-Create příkaz**: Nyní ověřuje instalaci AZD a Azure CLI při spuštění kontejneru

---

### [v3.11.0] - 2026-02-05

#### Přátelská přepracování README pro začátečníky
**Tato verze výrazně zlepšuje README.md, aby bylo přístupnější pro začátečníky, a přidává důležité zdroje pro vývojáře AI.**

#### Přidáno
- **🆚 Porovnání Azure CLI a AZD**: Jasné vysvětlení, kdy použít který nástroj s praktickými příklady
- **🌟 Úžasné AZD odkazy**: Přímé odkazy na komunitní galerii šablon a zdroje příspěvků:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ připravených šablon k nasazení
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Příspěvek od komunity
- **🎯 Rychlý start průvodce**: Jednoduchá 3-kroková sekce začátku (Instalace → Přihlášení → Nasazení)
- **📊 Tabulka navigace podle zkušeností**: Jasné pokyny, kde začít podle úrovně vývojářských zkušeností

#### Změny
- **Struktura README**: Přeuspořádáno pro postupné odkrývání - klíčové informace na začátku
- **Úvodní sekce**: Přepsáno tak, aby vysvětlila "Magii `azd up`" pro úplné začátečníky
- **Odstraněn duplicitní obsah**: Odstraněna duplicitní sekce řešení problémů
- **Příkazy pro řešení potíží**: Opraven odkaz `azd logs` pro použití platného `azd monitor --logs`

#### Opraveno
- **🔐 Příkazy pro autentizaci**: Přidáno `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na příkazy**: Odebrány zbývající `azd logs` z části README řešení problémů

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílová skupina**: Vylepšení specificky zaměřena na vývojáře nováčky v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující AZD příkazy v celé dokumentaci, aby všechny ukázky kódu používaly platnou syntaxi Azure Developer CLI.**

#### Opraveno
- **🔧 Odebrány neexistující AZD příkazy**: Komplexní audit a korekce neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo alternativami Azure CLI
  - `azd service` podpříkazy (neexistují) → nahrazeno `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistují) → odstraněno nebo nahrazeno platnými alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` příznaky (neexistují) → odstraněny
  - `azd provision --what-if/--rollback` příznaky (neexistují) → aktualizovány na `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Aktualizované soubory s opravami příkazů**:
  - `resources/cheat-sheet.md`: Hlavní přepracování příkazového odkazu
  - `docs/deployment/deployment-guide.md`: Opraveny strategie rollbacku a nasazení
  - `docs/troubleshooting/debugging.md`: Opraveny sekce analýzy logu
  - `docs/troubleshooting/common-issues.md`: Aktualizovány příkazy pro řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Opravené příkazy pro monitorování
  - `docs/getting-started/first-project.md`: Aktualizované příklady monitorování a ladění
  - `docs/getting-started/installation.md`: Opravené příklady nápovědy a verzí
  - `docs/pre-deployment/application-insights.md`: Opravené příkazy pro prohlížení logů
  - `docs/pre-deployment/coordination-patterns.md`: Opravené příkazy pro ladění agenta

- **📝 Aktualizace odkazu na verzi**: 
  - `docs/getting-started/installation.md`: Změněna pevná verze `1.5.0` na generickou `1.x.x` s odkazem na vydání

#### Změněno
- **Strategie vrácení zpět**: Aktualizovaná dokumentace pro použití rollbacku založeného na Gitu (AZD nemá nativní rollback)
- **Prohlížení logů**: Nahrazeny reference `azd logs` příkazy `azd monitor --logs`, `azd monitor --live` a Azure CLI
- **Sekce výkonu**: Odstraněny neexistující příznaky pro paralelní/incrementální nasazení, poskytnuty platné alternativy

#### Technické detaily
- **Platné AZD příkazy**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné příznaky azd monitor**: `--live`, `--logs`, `--overview`
- **Odstraněné funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a aktualizace kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny nefunkční odkazy v dokumentaci a zlepšuje celkovou kvalitu obsahu pro AI vývojáře využívající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument s pokyny pro přispívání obsahující:
  - Jasné instrukce pro hlášení problémů a návrhy změn
  - Standardy dokumentace pro nový obsah
  - Pokyny k příkladům kódu a konvencím zpráv commitů
  - Informace o zapojení komunity

#### Dokončeno
- **🎯 Modul workshopu 7 (Závěr)**: Kompletně dokončený závěrečný modul s:
  - Obsáhlým shrnutím dosažených výsledků workshopu
  - Sekcí klíčových osvojených konceptů pokrývající AZD, šablony a Microsoft Foundry
  - Doporučeními pro pokračování v učební cestě
  - Cvičeními k výzvám workshopu s hodnocením obtížnosti
  - Odkazy na zpětnou vazbu a podporu komunity

- **📚 Modul workshopu 3 (Deconstruct)**: Aktualizované učební cíle s:
  - Návodem k aktivaci GitHub Copilot s MCP servery
  - Pochopením struktury složek šablon AZD
  - Vzory organizace infrastruktury-kódu (Bicep)
  - Instrukcemi pro praktické laboratoře

- **🔧 Modul workshopu 6 (Ukázání)**: Dokončený s:
  - Cíli správy zdrojů a nákladů
  - Použitím `azd down` pro bezpečné odstraňování infrastruktury
  - Návodem pro obnovu soft-smazaných kognitivních služeb
  - Bonusovými úkoly k průzkumu GitHub Copilot a Azure Portal

#### Opraveno
- **🔗 Opravy nefunkčních odkazů**: Vyřešeno přes 15 nefunkčních interních odkazů v dokumentaci:
  - `docs/ai-foundry/ai-model-deployment.md`: Opraveny cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opraveny cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazen neexistující cicd-integration.md za deployment-guide.md
  - `examples/retail-scenario.md`: Opraveny cesty k FAQ a průvodci řešením problémů
  - `examples/container-app/microservices/README.md`: Opraveny cesty k domovské stránce kurzu a průvodci nasazením
  - `resources/faq.md` a `resources/glossary.md`: Aktualizovány reference na AI kapitoly
  - `course-outline.md`: Opraveny odkazy v učitelském průvodci a AI labu

- **📅 Banner stavu workshopu**: Aktualizován z "Ve výstavbě" na aktivní stav workshopu s datem únor 2026

- **🔗 Navigace workshopu**: Opraveny nefunkční navigační odkazy v README.md workshopu směřující do neexistující složky lab-1-azd-basics

#### Změněno
- **Prezentace workshopu**: Odstraněno varování „ve výstavbě“, workshop je nyní kompletní a připravený k použití
- **Konzistence navigace**: Zajištěna správná mezimodulová navigace ve všech modulech workshopu
- **Reference učební cesty**: Aktualizovány průřezové reference kapitol na správné microsoft-foundry cesty

#### Ověřeno
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Moduly workshopu 0-7 jsou kompletní s učebními cíli
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Udržovaný přívětivý jazyk a struktura vhodná pro začátečníky
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro přispěvatele komunity

#### Technická implementace
- **Validace odkazů**: Automatizovaný PowerShell skript prověřil všechny .md interní odkazy
- **Audit obsahu**: Ruční kontrola kompletnosti workshopu a vhodnosti pro začátečníky
- **Navigační systém**: Konzistentní vzory navigace kapitol a modulů

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci
- **Překlady**: Překladové složky nebyly v této verzi aktualizovány (automatizovaný překlad bude synchronizován později)
- **Doba trvání workshopu**: Kompletní workshop nyní nabízí 3-4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitorování, bezpečnost a vzory multi-agentních systémů
**Tato verze přidává rozsáhlé lekce na úrovni A o integraci Application Insights, autentizačních vzorech a koordinaci multi-agentů pro produkční nasazení.**

#### Přidáno
- **📊 Lekce integrace Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým provisionováním
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Funkční Python aplikace s vlastní telemetrií (více než 1 200 řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů Microsoft Foundry Modelů)
  - 6 Mermaid diagramů (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, AI monitorování)
  - Příklady dotazů Kusto a strategie optimalizace nákladů
  - Streamování metrik naživo a ladění v reálném čase
  - 40-50 minut učení s produkčními vzory připravenými k použití

- **🔐 Lekce autentizace a bezpečnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 autentizační vzory (connection strings, Key Vault, spravovaná identita)
  - Kompletní Bicep šablony infrastruktury pro bezpečné nasazení
  - Node.js kód aplikace s integrací Azure SDK
  - 3 kompletní cvičení (aktivace managed identity, user-assigned identity, rotace Key Vault)
  - Nejlepší bezpečnostní praktiky a nastavení RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkční vzory autentizace bez hesla

- **🤖 Lekce koordinace multi-agentů**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorů koordinace (sekvenční, paralelní, hierarchický, událostmi řízený, konsenzus)
  - Kompletní implementace orchestrátorských služeb (Python/Flask, přes 1 500 řádků)
  - 3 specializované implementace agentů (Výzkum, Psaní, Editor)
  - Integrace se Service Bus pro fronty zpráv
  - Správa stavu Cosmos DB pro distribuované systémy
  - 6 Mermaid diagramů znázorňujících interakce agentů
  - 3 pokročilá cvičení (zpracování timeoutů, logika opakování, pojistka)
  - Rozpis nákladů (240-565 $/měsíc) s optimalizačními strategiemi
  - Integrace Application Insights pro monitorování

#### Vylepšeno
- **Kapitola před nasazením**: Nyní obsahuje komplexní vzory monitorování a koordinace
- **Kapitola začínáme**: Rozšířená o profesionální autentizační vzory
- **Produkční připravenost**: Kompletní pokrytí od bezpečnosti po observabilitu
- **Osnova kurzu**: Aktualizováno s odkazy na nové lekce v kapitolách 3 a 6

#### Změněno
- **Postup učení**: Lepší integrace bezpečnosti a monitorování napříč kurzem
- **Kvalita dokumentace**: Konzistentní standardy úrovně A (95-97 %) napříč novými lekcemi
- **Produkční vzory**: Kompletní pokrytí end-to-end pro podnikové nasazení

#### Vylepšeno
- **Vývojářský zážitek**: Jasná cesta od vývoje k monitorování v produkci
- **Bezpečnostní standardy**: Profesionální vzory autentizace a správy tajemství
- **Observabilita**: Kompletní integrace Application Insights s AZD
- **AI zátěže**: Specializované monitorování Microsoft Foundry Modelů a multi-agentních systémů

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní funkční kód (nikoli jen útržky)
- ✅ Mermaid diagramy pro vizuální učení (celkem 19 ve 3 lekcích)
- ✅ Praktická cvičení s ověřovacími kroky (celkem 9)
- ✅ Produkční Bicep šablony nasaditelné pomocí `azd up`
- ✅ Analýza nákladů a optimalizační strategie
- ✅ Průvodci řešením problémů a osvědčené postupy
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitorováním
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé multi-agentní architektury
- **Celkový nový obsah**: - Konzistentní vysoké standardy kvality

#### Technická implementace
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Autentizace**: Spravovaná identita + Key Vault + vzory RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrace
- **Monitorování**: Live metrics + dotazy Kusto + alerty + dashboardy
- **Správa nákladů**: Strategie vzorkování, retenční politiky, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšení kvality dokumentace a nový příklad Microsoft Foundry Models
**Tato verze vylepšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Přidáno
- **🤖 Příklad chatu Microsoft Foundry Models**: Kompletní nasazení gpt-4.1 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Microsoft Foundry Models (nasazení modelu gpt-4.1)
  - Python příkazové rozhraní chatu s historií konverzace
  - Integrace Key Vault pro bezpečné ukládání API klíčů
  - Sledování využití tokenů a odhady nákladů
  - Omezení rychlosti a zpracování chyb
  - Obsáhlý README s průvodcem nasazením na 35-45 minut
  - 11 souborů připravených k produkci (Bicep šablony, Python aplikace, konfigurace)
- **📚 Dokumentační cvičení**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace více prostředí (15 minut)
  - Cvičení 2: Práce se správou tajemství (10 minut)
  - Jasná kritéria úspěchu a ověřovací kroky
- **✅ Ověření nasazení**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontroly stavu
  - Kontrolní seznam kritérií úspěchu
  - Očekávané výstupy všech příkazů nasazení
  - Rychlé odkazy na řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na kvalitu úrovně A (93 %):
  - Přidán azure-openai-chat do všech relevantních částí
  - Zvýšen počet lokálních příkladů z 3 na 4
  - Přidáno do tabulky příkladů AI aplikací
  - Integrované do Rychlého startu pro pokročilé uživatele
  - Přidáno k sekci Microsoft Foundry Templates
  - Aktualizována srovnávací matice a sekce hledání technologií
- **Kvalita dokumentace**: Vylepšena z B+ (87 %) na A- (92 %) v celé složce docs:
  - Přidány očekávané výstupy k důležitým příkladům příkazů
  - Zahrnuty ověřovací kroky ke změnám konfigurace
  - Vylepšené praktické učení s reálnými cvičeními

#### Změněno
- **Postup učení**: Lepší integrace AI příkladů pro pokročilé uživatele
- **Struktura dokumentace**: Akčnější cvičení s jasnými výsledky
- **Ověřovací proces**: Přidána explicitní kritéria úspěchu do klíčových workflow

#### Vylepšeno
- **Vývojářský zážitek**: Nasazení Microsoft Foundry Models nyní trvá 35-45 minut (oproti 60-90 minutám u složitých alternativ)
- **Transparentnost nákladů**: Jasné odhady nákladů (50-200 $/měsíc) pro příklad Microsoft Foundry Models
- **Učební cesta**: AI vývojáři mají jasný vstupní bod s azure-openai-chat
- **Standardy dokumentace**: Konzistentní očekávané výstupy a ověřovací kroky

#### Ověřeno
- ✅ Příklad Microsoft Foundry Models plně funkční s `azd up`
- ✅ Všechny 11 implementační soubory syntakticky korektní
- ✅ Nápověda v README odpovídá skutečnému nasazení
- ✅ Odkazy v dokumentaci aktualizovány na více než 8 místech
- ✅ Index příkladů přesně odráží 4 lokální příklady
- ✅ Žádné duplicitní externí odkazy v tabulkách
- ✅ Všechny navigační reference jsou správné

#### Technická implementace
- **Architektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps vzor
- **Bezpečnost**: Připraveno na managed identity, tajemství v Key Vault
- **Monitorování**: Integrace Application Insights
- **Správa nákladů**: Sledování tokenů a optimalizace použití
- **Nasazení**: Jediný příkaz `azd up` pro kompletní konfiguraci

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení Container App
**Tato verze zavádí komplexní, produkčně připravené příklady nasazení kontejnerových aplikací využívající Azure Developer CLI (AZD), s plnou dokumentací a začleněním do učební cesty.**

#### Přidáno
- **🚀 Příklady Container App**: Nové lokální příklady v `examples/container-app/`:
  - [Hlavní průvodce](examples/container-app/README.md): Kompletní přehled nasazení kontejnerů, rychlý start, produkce a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): Uživatelsky přívětivé REST API s funkcí scale-to-zero, kontrolami stavu, monitorováním a řešením problémů
  - [Architektura mikroslužeb](../../examples/container-app/microservices): Produkčně připravené více-službové nasazení (API Gateway, Produkt, Objednávka, Uživatel, Notifikace), asynchronní zprávy, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary nasazení
- **Nejlepší postupy**: Bezpečnost, monitorování, optimalizace nákladů a doporučení CI/CD pro kontejnery
- **Ukázky kódu**: Kompletní `azure.yaml`, Bicep šablony a implementace služeb v několika jazycích (Python, Node.js, C#, Go)
- **Testování a řešení problémů**: End-to-end testovací scénáře, příkazy pro monitorování, doporučení pro řešení problémů

#### Změněno
- **README.md**: Aktualizováno o nové příklady kontejnerových aplikací pod "Lokální příklady - kontejnerové aplikace"
- **examples/README.md**: Aktualizováno s vyzdvižením příkladů kontejnerových aplikací, přidáním vstupních položek do srovnávací matice a aktualizací referencí technologií/architektur
- **Osnova kurzu a studijní průvodce**: Aktualizováno o nové příklady kontejnerových aplikací a nasazovací vzory v příslušných kapitolách

#### Ověřeno
- ✅ Všechny nové příklady nasaditelné pomocí `azd up` a dodržující nejlepší postupy
- ✅ Dokumentační vzájemné odkazy a navigace aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků po pokročilé včetně produkčních mikroslužeb

#### Poznámky
- **Rozsah**: Pouze anglická dokumentace a příklady
- **Další kroky**: Rozšíření o pokročilé vzory kontejnerů a CI/CD automatizaci v budoucích verzích

### [v3.5.0] - 2025-11-19

#### Přesměrování produktu: Microsoft Foundry
**Tato verze implementuje komplexní přejmenování produktu z "Microsoft Foundry" na "Microsoft Foundry" ve veškeré anglické dokumentaci, reflektující oficiální rebranding Microsoftu.**

#### Změněno
- **🔄 Aktualizace názvu produktu**: Kompletní přejmenování z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem 23 aktualizovaných referencí obsahu ve 7 dokumentačních souborech

- **📁 Změny ve struktuře složek**:
  - `docs/ai-foundry/` přejmenována na `docs/microsoft-foundry/`
  - Aktualizovány všechny vzájemné odkazy tak, aby odpovídaly nové struktuře složek
  - Validovány navigační odkazy napříč celou dokumentací

- **📄 Přejmenování souborů**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Aktualizovány všechny interní odkazy tak, aby odkazovaly na nové názvy souborů

#### Aktualizované soubory
- **Dokumentace kapitol** (7 souborů):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizace navigačních odkazů
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizace referencí názvu produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Již používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizace referencí (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 aktualizace vzájemných odkazů
  - `docs/getting-started/first-project.md` - 2 aktualizace navigačních odkazů kapitol
  - `docs/getting-started/installation.md` - 2 aktualizace odkazů na následující kapitolu
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizace referencí (navigace, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizace navigačního odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizace navigačního odkazu

- **Soubory struktury kurzu** (2 soubory):
  - `README.md` - 17 aktualizovaných referencí (přehled kurzu, názvy kapitol, sekce šablon, komunitní komentáře)
  - `course-outline.md` - 14 aktualizovaných referencí (přehled, učební cíle, zdroje kapitol)

#### Ověřeno
- ✅ Žádné zbývající odkazy na složku "ai-foundry" v anglické dokumentaci
- ✅ Žádné zbývající odkazy na název produktu "Microsoft Foundry" v anglické dokumentaci
- ✅ Všechny navigační odkazy plně funkční s novou strukturou složek
- ✅ Přejmenování souborů a složek úspěšně dokončeno
- ✅ Ověřeny vzájemné odkazy mezi kapitolami

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci ve složce `docs/`
- **Překlady**: Překladové složky (`translations/`) v této verzi nebyly aktualizovány
- **Workshop**: Materiály workshopů (`workshop/`) v této verzi nebyly aktualizovány
- **Příklady**: Příkladové soubory mohou stále obsahovat odkazy na staré názvy (bude řešeno v budoucí aktualizaci)
- **Externí odkazy**: Externí URL a odkazy na repozitář GitHub zůstávají nezměněny

#### Průvodce migrací pro přispěvatele
Pokud máte lokální větve nebo dokumentaci odkazující na starou strukturu:
1. Aktualizujte odkazy na složky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na soubory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte název produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Ověřte, že všechny interní odkazy v dokumentaci stále fungují

---

### [v3.4.0] - 2025-10-24

#### Vylepšení náhledu infrastruktury a ověřování
**Tato verze přináší komplexní podporu nové náhledové funkce Azure Developer CLI a zlepšuje uživatelský zážitek workshopu.**

#### Přidáno
- **🧪 Dokumentace příkazu azd provision --preview**: Podrobný popis nové funkce náhledu infrastruktury
  - Referenční příkazy a příklady použití v cheat sheetu
  - Detailní integrace v průvodci poskytováním s případy použití a přínosy
  - Integrace kontroly před nasazením pro bezpečnější ověření
  - Aktualizace průvodce "začínáme" s bezpečnostními praktikami nasazení
- **🚧 Stavební banner workshopu**: Profesionální HTML banner indikující stav vývoje workshopu
  - Přechodový design se stavebními symboly pro jasnou komunikaci uživatelům
  - Časová známka poslední aktualizace pro transparentnost
  - Responzivní design pro všechna zařízení

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrována napříč dokumentací nasazení
- **Validace před nasazením**: Automatizované skripty nyní zahrnují testování náhledu infrastruktury
- **Vývojářský workflow**: Aktualizované sekvence příkazů s doporučením použití náhledu
- **Zážitek z workshopu**: Jasná očekávání o stavu obsahu pro uživatele

#### Změněno
- **Nejlepší postupy nasazení**: Doporučený přístup s prioritou náhledu
- **Průběh dokumentace**: Validace infrastruktury přesunuta dříve v učebním procesu
- **Prezentace workshopu**: Profesionální komunikace statusu s jasným časovým plánem vývoje

#### Vylepšeno
- **Přístup bezpečnost na prvním místě**: Infrastrukturní změny nyní ověřitelné před nasazením
- **Týmová spolupráce**: Výsledky náhledu lze sdílet k revizi a schválení
- **Informovanost o nákladech**: Lepší pochopení nákladů zdrojů před jejich zajištěním
- **Zmírnění rizik**: Snížení selhání nasazení díky předběžné validaci

#### Technická implementace
- **Integrace do více dokumentů**: Funkce náhledu zdokumentována ve 4 klíčových souborech
- **Vzorové příkazy**: Konzistentní syntaxe a příklady po celé dokumentaci
- **Integrace osvědčených postupů**: Náhled zahrnut do workflow validace a skriptů
- **Vizuální indikátory**: Jasné označení nové funkce pro snazší objevitelnost

#### Workshop infrastruktura
- **Komunikace stavu**: Profesionální HTML banner s přechodovým stylem
- **Uživatelský zážitek**: Jasný stav vývoje zabraňuje nedorozumění
- **Profesionální prezentace**: Zachovává důvěryhodnost repozitáře a nastavuje očekávání
- **Transparentnost časové osy**: Časová známka poslední aktualizace z října 2025 pro zodpovědnost

### [v3.3.0] - 2025-09-24

#### Vylepšené workshopové materiály a interaktivní vzdělávací zážitek
**Tato verze zavádí komplexní workshopové materiály s prohlížečovými interaktivními průvodci a strukturovanými učebními cestami.**

#### Přidáno
- **🎥 Interaktivní průvodce workshopem**: Workshopový zážitek založený na prohlížeči s podporou náhledu MkDocs
- **📝 Strukturované instrukce workshopu**: 7-kroková vedená učební cesta od objevování po přizpůsobení
  - 0-Úvod: Přehled workshopu a nastavení
  - 1-Výběr AI šablony: Proces objevení a výběru šablony
  - 2-Validace AI šablony: Postupy nasazení a ověření
  - 3-Rozebrání AI šablony: Porozumění architektuře šablony
  - 4-Konfigurace AI šablony: Nastavení a přizpůsobení
  - 5-Přizpůsobení AI šablony: Pokročilé úpravy a iterace
  - 6-Odstranění infrastruktury: Úklid a správa zdrojů
  - 7-Závěr: Shrnutí a další kroky
- **🛠️ Workshopové nástroje**: Konfigurace MkDocs s tématem Material pro lepší zážitek z učení
- **🎯 Praktická učební cesta**: 3-kroková metodologie (Objevování → Nasazení → Přizpůsobení)
- **📱 Integrace GitHub Codespaces**: Plynulé nastavení vývojového prostředí

#### Vylepšeno
- **Laboratoř AI workshopu**: Rozšíření o komplexní 2-3 hodinový strukturovaný učební zážitek
- **Workshopová dokumentace**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Postup učení**: Jasné krok za krokem od výběru šablony po nasazení do produkce
- **Vývojářský zážitek**: Integrované nástroje pro zjednodušené workflow vývoje

#### Vylepšeno
- **Přístupnost**: Rozhraní založené na prohlížeči s vyhledáváním, funkcí kopírování a přepínáním témat
- **Samostatné učení**: Flexibilní struktura workshopu pro různé rychlosti učení
- **Praktická aplikace**: Scénáře nasazení AI šablon z reálného světa
- **Integrace komunity**: Integrace Discordu pro podporu workshopu a spolupráci

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé vyhledávání klíčových slov a lekcí
- **Kopírování bloků kódu**: Funkce kopírování při najetí myší u všech kódových příkladů
- **Přepínání témat**: Podpora tmavého/světlého režimu pro různé preference
- **Vizuální materiály**: Snímky obrazovky a diagramy pro lepší pochopení
- **Integrace pomoci**: Přímý přístup na Discord pro komunitní podporu

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém učení založený na kapitolách
**Tato verze zavádí komplexní strukturu učení založenou na kapitolách s vylepšenou navigací v rámci celého repozitáře.**

#### Přidáno
- **📚 Systém učení založený na kapitolách**: Celý kurz přeuspořádán do 8 progresivních učebních kapitol
  - Kapitola 1: Základy a rychlý start (⭐ - 30-45 min)
  - Kapitola 2: Vývoj s AI v popředí (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurace a autentizace (⭐⭐ - 45-60 min)
  - Kapitola 4: Infrastruktura jako kód a nasazení (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Multi-agentní AI řešení (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validace a plánování před nasazením (⭐⭐ - 1 hodina)
  - Kapitola 7: Řešení problémů a ladění (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkční a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexní navigační systém**: Konzistentní záhlaví a zápatí navigace v celé dokumentaci
- **🎯 Sledování pokroku**: Kontrolní seznam a systém ověřování učení
- **🗺️ Vedení učební cesty**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Navigace vzájemných odkazů**: Jasně propojené související kapitoly a předpoklady

#### Vylepšeno
- **Struktura README**: Přeměněna na strukturovanou učební platformu s organizací dle kapitol
- **Navigace dokumentací**: Každá stránka nyní obsahuje kontext kapitoly a pokyny k postupu
- **Organizace šablon**: Příklady a šablony přiřazeny k příslušným učebním kapitolám
- **Integrace zdrojů**: Cheat sheety, často kladené otázky a studijní průvodce propojeny s relevantními kapitolami
- **Integrace workshopu**: Praktické laboratoře přiřazeny k několika učebním cílům kapitol

#### Změněno
- **Postup učení**: Přechod z lineární dokumentace na flexibilní učení založené na kapitolách
- **Umístění konfigurace**: Průvodce konfigurací přesunut do kapitoly 3 pro lepší plynulost učení
- **Integrace AI obsahu**: Lepší integrace obsahu specifického pro AI v celém učebním procesu
- **Produkční obsah**: Pokročilé vzory konsolidovány v kapitole 8 pro firemní uživatele

#### Vylepšeno
- **Uživatelský zážitek**: Jasné navigační drobečky a indikátory postupu kapitol
- **Přístupnost**: Konzistentní vzory navigace pro snazší orientaci v kurzu
- **Profesionální prezentace**: Struktura kurzu ve stylu univerzitního vzdělávání vhodná pro akademické a firemní školení
- **Efektivita učení**: Zkrácení času na nalezení relevantního obsahu díky lepší organizaci

#### Technická implementace
- **Navigační záhlaví**: Standardizovaná navigace kapitol napříč více než 40 dokumentačními soubory
- **Navigace v zápatí**: Konzistentní pokyny k postupu a indikátory dokončení kapitol
- **Vzájemné propojení**: Komplexní systém interních odkazů spojující související koncepty
- **Mapování kapitol**: Šablony a příklady jasně přiřazeny k učebním cílům

#### Vylepšení studijního průvodce
- **📚 Komplexní učební cíle**: Přestavěný studijní průvodce sladěný se systémem 8 kapitol
- **🎯 Hodnocení dle kapitol**: Každá kapitola obsahuje specifické učební cíle a praktická cvičení
- **📋 Sledování pokroku**: Týdenní učební plán s měřitelnými výsledky a kontrolními seznamy
- **❓ Otázky pro ověření znalostí**: Otázky k validaci znalostí za každou kapitolu s profesionálním zaměřením
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešením problémů
- **📊 Postup v dovednostech**: Jasný pokrok od základních konceptů k podnikovým vzorům s důrazem na kariérní rozvoj
- **🎓 Certifikační rámec**: Profesionální výsledky rozvoje a systém komunitního uznání
- **⏱️ Řízení časové osy**: Strukturovaný 10-týdenní učební plán s ověřováním milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená multi-agentní AI řešení
**Tato verze vylepšuje multi-agentní maloobchodní řešení lepším pojmenováním agentů a zdokonalenou dokumentací.**

#### Změněno
- **Terminologie vícenásobných agentů**: Nahrazení "Cora agenta" za "Zákaznického agenta" v celém řešení pro maloobchod s vícenásobnými agenty pro lepší pochopení
- **Architektura agenta**: Aktualizace veškeré dokumentace, ARM šablon a ukázek kódu pro konzistentní pojmenování "Zákaznický agent"
- **Konfigurační příklady**: Modernizace vzorů konfigurace agentů s aktualizovanými pojmenováními
- **Konzistence dokumentace**: Zajištění všech odkazů s profesionálními, popisnými názvy agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizace retail-multiagent-arm-template s odkazy na Zákaznického agenta
- **Architektonické diagramy**: Oživení Mermaid diagramů s aktualizovaným pojmenováním agentů
- **Ukázky kódu**: Python třídy a implementační příklady nyní používají pojmenování CustomerAgent
- **Systémové proměnné**: Aktualizace veškerých nasazovacích skriptů pro použití konvencí CUSTOMER_AGENT_NAME

#### Vylepšeno
- **Zkušenost vývojáře**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost na produkci**: Lepší sladění s podnikatelskými konvencemi pojmenování
- **Vzdělávací materiály**: Intuitivnější pojmenování agentů pro výukové účely
- **Použitelnost šablon**: Zjednodušené porozumění funkcím agentů a vzorům nasazení

#### Technické detaily
- Aktualizace Mermaid architektonických diagramů s odkazy na CustomerAgent
- Nahrazení jmen tříd CoraAgent za CustomerAgent v příkladech Pythonu
- Úprava ARM JSON konfigurací šablon pro použití typu agenta "customer"
- Aktualizace systémových proměnných z CORA_AGENT_* na CUSTOMER_AGENT_*
- Oživení všech příkazů nasazení a kontejnerových konfigurací

### [v3.0.0] - 2025-09-12

#### Hlavní změny - Zaměření na AI vývojáře a integrace Microsoft Foundry
**Tato verze transformuje repozitář na komplexní vzdělávací zdroj zaměřený na AI s integrací Microsoft Foundry.**

#### Přidáno
- **🤖 AI-First Learning Path**: Kompletní restrukturalizace s prioritou na AI vývojáře a inženýry
- **Průvodce integrací Microsoft Foundry**: Obsáhlá dokumentace propojení AZD s Microsoft Foundry službami
- **Vzorové vzory nasazení AI modelů**: Podrobný průvodce výběrem modelu, konfigurací a strategiemi nasazení do produkce
- **AI workshop lab**: 2–3 hodinový praktický workshop pro převod AI aplikací na řešení nasaditelná přes AZD
- **Best Practices pro produkční AI**: Vzory připravené pro podnikové škálování, monitorování a zabezpečení AI zátěží
- **Průvodce řešením problémů s AI**: Komplexní odstraňování potíží s Microsoft Foundry modely, kognitivními službami a AI nasazením
- **Galerie AI šablon**: Vybraná kolekce Microsoft Foundry šablon s hodnocením složitosti
- **Materiály pro workshop**: Kompletní struktura workshopu s praktickými laby a referenčními materiály

#### Vylepšeno
- **Struktura README**: Zaměřeno na AI vývojáře s 45% zájmem komunity podle Microsoft Foundry Discord
- **Vzdělávací cesty**: Vyhrazená cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Doporučení šablon**: Vybrané AI šablony včetně azure-search-openai-demo, contoso-chat, a openai-chat-app-quickstart
- **Integrace komunity**: Vylepšená Discord podpora s AI specifickými kanály a diskuzemi

#### Zaměření na bezpečnost a produkci
- **Vzory spravované identity**: AI specifická autentizace a bezpečnostní konfigurace
- **Optimalizace nákladů**: Sledování využití tokenů a kontrola rozpočtu pro AI zátěže
- **Nasazení přes více regionů**: Strategie globálního nasazení AI aplikací
- **Monitorování výkonu**: AI specifické metriky a integrace Application Insights

#### Kvalita dokumentace
- **Lineární struktura kurzu**: Logický postup od začátečníka po pokročilé vzory nasazení AI
- **Ověřené URL**: Všechny externí odkazy na repozitáře ověřeny a funkční
- **Kompletní reference**: Všechny interní odkazy v dokumentaci ověřeny a funkční
- **Připravené pro produkci**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Hlavní změny - Restrukturalizace repozitáře a profesionální vylepšení
**Tato verze představuje významnou rekonstrukci struktury repozitáře a prezentace obsahu.**

#### Přidáno
- **Strukturovaný rámec učení**: Všechny stránky dokumentace nyní obsahují úvod, cíle učení a výsledky učení
- **Navigační systém**: Přidány odkazy na předchozí/další lekci napříč celou dokumentací pro řízený postup učení
- **Studijní příručka**: Obsáhlý soubor study-guide.md s cíli učení, cvičeními a hodnotícími materiály
- **Profesionální prezentace**: Odstraněny všechny emoji ikony pro lepší přístupnost a profesionální vzhled
- **Vylepšená struktura obsahu**: Lepší organizace a tok vzdělávacích materiálů

#### Změněno
- **Formát dokumentace**: Standardizace veškeré dokumentace s konzistentní strukturou zaměřenou na učení
- **Tok navigace**: Zaveden logický postup napříč všemi vzdělávacími materiály
- **Prezentace obsahu**: Odstraněny dekorativní prvky ve prospěch jasného, profesionálního formátování
- **Struktura odkazů**: Aktualizace všech interních odkazů pro podporu nového navigačního systému

#### Vylepšeno
- **Přístupnost**: Odstraněny závislosti na emoji pro lepší kompatibilitu se čtečkami obrazovky
- **Profesionální vzhled**: Čistá akademická prezentace vhodná pro podnikové vzdělávání
- **Zkušenost učení**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Organizace obsahu**: Lepší logický tok a propojení souvisejících témat

### [v1.0.0] - 2025-09-09

#### První vydání - Komplexní vzdělávací repozitář AZD

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní série průvodců začátkem práce
  - Obsáhlá dokumentace nasazení a zřizování
  - Detailní zdroje pro odstraňování potíží a ladění
  - Nástroje a postupy pro validaci před nasazením

- **Modul začátku práce**
  - Základy AZD: Klíčové koncepty a terminologie
  - Instalační průvodce: Platformově specifické instrukce nastavení
  - Konfigurační průvodce: Nastavení prostředí a autentizace
  - První projekt: Praktický krok za krokem výukový projekt

- **Modul nasazení a zřizování**
  - Průvodce nasazením: Kompletní dokumentace pracovního postupu
  - Průvodce zřizováním: Infrastruktura jako kód s Bicep
  - Nejlepší praxe pro produkční nasazení
  - Vzory více-službové architektury

- **Modul validace před nasazením**
  - Kapacitní plánování: Validace dostupnosti Azure zdrojů
  - Výběr SKU: Kompletní návod na vrstvy služeb
  - Předběžné kontroly: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul odstraňování potíží**
  - Běžné problémy: Často se vyskytující otázky a řešení
  - Průvodce laděním: Systematické metodiky řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a reference**
  - Příručka příkazů: Rychlý přehled základních příkazů
  - Slovník: Obsáhlé definice terminologie a zkratek
  - FAQ: Detailní odpovědi na časté otázky
  - Externí odkazy na zdroje a komunitní propojení

- **Příklady a šablony**
  - Jednoduchý webový aplikační příklad
  - Šablona pro nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databáze
  - Příklady architektury mikroservis
  - Implementace serverless funkcí

#### Funkce
- **Podpora více platforem**: Průvodce instalací a konfigurací pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah navržený od studentů po profesionální vývojáře
- **Praktické zaměření**: Praktické příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé podnikové vzory
- **Přístup "Security First"**: Nejlepší bezpečnostní praktiky integrované po celou dobu
- **Optimalizace nákladů**: Návody pro nákladově efektivní nasazení a správu zdrojů

#### Kvalita dokumentace
- **Detailní příklady kódu**: Praktické, prověřené ukázky kódu
- **Postupné instrukce**: Jasné, proveditelné návody
- **Komplexní zpracování chyb**: Řešení běžných problémů
- **Integrace nejlepších postupů**: Průmyslové standardy a doporučení
- **Kompatibilita verzí**: Aktuální s nejnovějšími Azure službami a funkcemi azd

## Plánovaná budoucí vylepšení

### Verze 3.1.0 (Plánováno)
#### Rozšíření AI platformy
- **Podpora více modelů**: Vzory integrace pro Hugging Face, Azure Machine Learning a vlastní modely
- **Frameworky AI agentů**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databází mimo Azure AI Search (Pinecone, Weaviate atd.)
- **AI observabilita**: Vylepšené monitorování výkonu modelu, používání tokenů a kvality odpovědí

#### Zkušenost vývojáře
- **VS Code rozšíření**: Integrovaný vývojový zážitek AZD + Microsoft Foundry
- **Integrace GitHub Copilot**: AI podporovaná generace AZD šablon
- **Interaktivní tutoriály**: Praktická cvičení v kódování s automatickou validací pro AI scénáře
- **Video obsah**: Doprovodné video tutoriály pro vizuální typy zaměřené na AI nasazení

### Verze 4.0.0 (Plánováno)
#### Podnikové AI vzory
- **Rámec správy**: Governance AI modelů, shoda a auditní stopy
- **Vícenájemnické AI**: Vzory pro servírování více zákazníkům s izolovanými AI službami
- **Edge AI nasazení**: Integrace s Azure IoT Edge a kontejnerovými instancemi
- **Hybridní cloud AI**: Vícecloudové a hybridní vzory nasazení AI zátěží

#### Pokročilé funkce
- **Automatizace AI pipeline**: Integrace MLOps s Azure Machine Learning pipeline
- **Pokročilá bezpečnost**: Vzory zero-trust, privátní koncové body a pokročilá ochrana proti hrozbám
- **Optimalizace výkonu**: Pokročilé ladění a škálování pro AI aplikace s vysokou propustností
- **Globální distribuce**: Vzory distribuce obsahu a edge cache pro AI aplikace

### Verze 3.0.0 (Plánováno) - Nahrazeno současným vydáním
#### Navrhované doplňky - Nyní implementovány ve verzi 3.0.0
- ✅ **Obsah zaměřený na AI**: Komplexní integrace Microsoft Foundry (Dokončeno)
- ✅ **Interaktivní tutoriály**: Praktický AI workshop lab (Dokončeno)
- ✅ **Pokročilý bezpečnostní modul**: AI specifické bezpečnostní vzory (Dokončeno)
- ✅ **Optimalizace výkonu**: Strategické ladění AI zátěží (Dokončeno)

### Verze 2.1.0 (Plánováno) - Částečně implementováno ve verzi 3.0.0
#### Menší vylepšení - Některá dokončena v aktuálním vydání
- ✅ **Další příklady**: AI zaměřené scénáře nasazení (Dokončeno)
- ✅ **Rozšířené FAQ**: AI specifické otázky a řešení problémů (Dokončeno)
- **Integrace nástrojů**: Vylepšené návody pro IDE a editory
- ✅ **Rozšíření monitoringu**: AI specifické vzory monitorování a upozornění (Dokončeno)

#### Stále plánováno pro budoucí vydání
- **Mobilně přívětivá dokumentace**: Responzivní design pro mobilní učení
- **Offline přístup**: Stahovatelné balíčky dokumentace
- **Vylepšená integrace IDE**: Rozšíření VS Code pro AZD + AI workflowy
- **Dashboard komunity**: Reálné metriky komunity a sledování příspěvků

## Přispívání do changelogu

### Hlásit změny
Při přispívání do tohoto repozitáře prosím zajistěte, že záznamy v changelogu obsahují:

1. **Číslo verze**: Podle semver (major.minor.patch)
2. **Datum**: Datum vydání nebo aktualizace ve formátu RRRR-MM-DD
3. **Kategorie**: Přidáno, Změněno, Vyřazeno, Odebráno, Opraveno, Bezpečnost
4. **Jasný popis**: Stručný popis změny
5. **Hodnocení dopadu**: Jak změny ovlivní stávající uživatele

### Kategorie změn

#### Přidáno
- Nové funkce, části dokumentace nebo schopnosti
- Nové příklady, šablony nebo vzdělávací zdroje
- Další nástroje, skripty nebo utilitky

#### Změněno
- Změny ve stávající funkcionalitě nebo dokumentaci
- Aktualizace pro lepší srozumitelnost nebo přesnost
- Restrukturalizace obsahu nebo organizace

#### Vyřazeno
- Funkce nebo přístupy, které jsou postupně ukončovány
- Části dokumentace plánované k odstranění
- Metody, které mají lepší alternativy

#### Odebráno
- Funkce, dokumentace nebo příklady, které už nejsou relevantní
- Zastaralé informace nebo vyřazené přístupy
- Nadbytečný nebo sloučený obsah

#### Opraveno
- Opravy chyb v dokumentaci nebo kódu
- Vyřešení hlášených problémů nebo závad
- Vylepšení přesnosti nebo funkčnosti

#### Bezpečnost
- Vylepšení nebo opravy týkající se bezpečnosti
- Aktualizace nejlepších bezpečnostních postupů
- Vyřešení bezpečnostních zranitelností

### Směrnice pro sémantické verzování

#### Hlavní verze (X.0.0)
- Zlomové změny vyžadující akci uživatele
- Významná restrukturalizace obsahu nebo organizace
- Změny měnící základní přístup nebo metodologii

#### Menší verze (X.Y.0)
- Nové funkce nebo přidání obsahu
- Vylepšení zachovávající zpětnou kompatibilitu
- Další příklady, nástroje nebo zdroje

#### Oprava (X.Y.Z)
- Opravy chyb a korekce
- Menší vylepšení stávajícího obsahu
- Vyjasnění a drobná zlepšení

## Zpětná vazba a návrhy komunity

Aktivně povzbuzujeme zpětnou vazbu komunity pro zlepšení tohoto vzdělávacího zdroje:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Hlaste problémy nebo navrhujte vylepšení (vítány AI specifické problémy)
- **Discord diskuse**: Sdílejte nápady a zapojte se do komunity Microsoft Foundry
- **Pull requesty**: Přímo přispívejte zlepšení obsahu, zejména AI šablon a průvodců
- **Microsoft Foundry Discord**: Účast v kanálu #Azure pro diskuse o AZD + AI
- **Komunitní fóra**: Zapojte se do širších diskuzí Azure vývojářů

### Kategorie zpětné vazby
- **Přesnost AI obsahu**: Opravy informací o integraci a nasazení AI služeb
- **Zkušenost učení**: Návrhy na zlepšení toku učení AI vývojářů
- **Chybějící AI obsah**: Žádosti o další AI šablony, vzory nebo příklady
- **Přístupnost**: Vylepšení pro různé potřeby učení
- **Integrace AI nástrojů**: Návrhy na lepší integraci workflow AI vývoje
- **Vzorové produkční AI**: Požadavky na podnikové AI vzory nasazení

### Závazek reakce
- **Reakce na problémy**: Do 48 hodin na hlášené problémy
- **Žádosti o funkce**: Vyhodnocení do jednoho týdne
- **Komunitní příspěvky**: Revize do jednoho týdne
- **Bezpečnostní problémy**: Okamžitá priorita a rychlá reakce

## Plán údržby

### Pravidelné aktualizace
- **Měsíční revize**: Přesnost obsahu a kontrola odkazů
- **Čtvrtletní aktualizace**: Hlavní doplnění a vylepšení obsahu
- **Půlroční revize**: Komplexní restrukturalizace a vylepšení
- **Roční vydání**: Hlavní verze s významnými zlepšeními

### Monitorování a zajištění kvality
- **Automatizované testování**: Pravidelná validace příkladů kódu a odkazů
- **Integrace zpětné vazby komunity**: Pravidelné zahrnování návrhů uživatelů
- **Aktualizace technologií**: Soulad s nejnovějšími službami Azure a verzemi azd
- **Audity přístupnosti**: Pravidelná kontrola zásad inkluzivního designu

## Politika podpory verzí

### Podpora aktuální verze
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Bezpečnostní aktualizace a kritické opravy po dobu 12 měsíců
- **Starší verze**: Pouze podpora komunity, žádné oficiální aktualizace

### Pokyny pro migraci
Při vydání hlavních verzí poskytujeme:
- **Průvodce migrací**: Krok za krokem přechodové instrukce
- **Poznámky o kompatibilitě**: Detaily o zásadních změnách
- **Podpora nástrojů**: Skripty nebo nástroje na pomoc s migrací
- **Podpora komunity**: Specializovaná fóra pro otázky k migraci

---

**Navigace**
- **Předcházející lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Návrat na [Hlavní README](README.md)

**Buďte v obraze**: Sledujte tento repozitář pro oznámení o nových vydáních a důležitých aktualizacích výukových materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
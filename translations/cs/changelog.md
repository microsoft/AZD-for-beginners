# Záznam změn - AZD pro začátečníky

## Úvod

Tento záznam změn dokumentuje všechny významné změny, aktualizace a vylepšení v repozitáři AZD pro začátečníky. Dodržujeme principy sémantického verzování a udržujeme tento záznam, aby uživatelé lépe porozuměli, co se mezi verzemi změnilo.

## Cíle učení

Přehled tohoto záznamu změn vám umožní:
- Zůstat informován o nových funkcích a přidaném obsahu
- Pochopit vylepšení stávající dokumentace
- Sledovat opravy chyb a korekce pro zajištění přesnosti
- Sledujte vývoj výukových materiálů v čase

## Výsledky učení

Po prostudování záznamu změn budete schopni:
- Identifikovat nový obsah a dostupné zdroje pro učení
- Pochopit, které části byly aktualizovány nebo vylepšeny
- Naplánovat si vzdělávací cestu na základě nejaktuálnějších materiálů
- Přispět zpětnou vazbou a návrhy na budoucí vylepšení

## Historie verzí

### [v3.25.0] - 2026-11-09

#### Rozšíření Microsoft Foundry 1.0 je nyní obecně dostupné

Balíček `microsoft.foundry` 1.0 je **běžně dostupný na produkci**, jak bylo oznámeno dne [5. listopadu 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kurz nyní učí vydaný GA pracovní postup, nikoli připravovanou verzi. Začněte s AZD **1.37.0 nebo novější** a `azd ext install microsoft.foundry`.

#### Dostupné v této aktualizaci kurzu
- Anglické pokyny používají balíček GA jako výchozí instalační cestu a vysvětlují jeho sedm samostatně verzovaných základních rozšíření.
- [Průvodce hosted-agent](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pokrývá příklad upstream rozhraní Python Agent Framework Responses API, aktuální uv, Python 3.13+, výběr nového/stávajícího projektu, opakované použití modelu a revizi `azure.yaml`.
- Pracovní postup lokálně do cloudu pokrývá testování Agent Inspector, náklady na volání modelu s podporou Azure, vzdálené sestavení kódu, nasazené volání, cloudové sledování, náhled nasazení, protokoly a diagnostiku.
- Oddělené pokyny pro hodnocení zahrnují generování a kontrolu datasetů/kritérií, konfiguraci pojmenovaného hodnocení, registraci zdrojů a inspekci výsledků. Starší pokyny k hodnocení/optimalizaci zůstávají migrační historií, nikoli aktuální základnou vydání.
- Pokyny Foundry CI/CD zahrnují instalaci rozšíření běžce, autentizované nasazení, hodnocení aktiv/přístupu a explicitní kvalitou branou.
- Pokyny k úklidu rozlišují nově vytvořené a znovu použité projekty Foundry. Workshop odkazuje na samostatné GA cvičení, aniž by nahrazoval jeho specifické testy příkladů.
- Navigace kurzem, vzdělávací cíle, předpoklady nastavení, příručka, FAQ a studijní průvodce odrážejí pracovní postup GA. Generované překlady nejsou ručně editovány.

#### Rozsah revize
- Na základě oznámení GA, propojených pokynů Microsoft Learn a konfigurace vzorového projektu upstream. Nebylo provedeno žádné živé Azure provádění, nasazení, volání modelu ani hodnocení.
- Balíček GA neznačí GA pro každou volitelnou funkci, samostatné rozšíření nebo SDK, ani necertifikuje příklady pro produkci.

### [v3.24.0]- 2026-11-04

#### Opraveno
- Opravená anglická navigace kurzu, přesun cesty stránek, chybějící kotvy a zastaralé externí odkazy, včetně odkazu Kapitola 2 na produkční AI příručku.
- Přezkoumány aktuální pokyny vůči publikovanému AZD 1.37.2, agentům 1.0.0-beta.23 a hodnocením 1.0.0-beta.2. Zdokumentován samostatný pracovní postup `azd ai eval` a migrace konfigurace optimalizace.
- Opraveny nepodporované příznaky CLI, autentizační hranice, pokyny pro prostý text v prostředí/sekretu, aktualizace infrastruktury, konfigurace modelů a příklady destruktivní obnovy.
- Aktualizován workshop vůči aktuálnímu vzorku AI Agents, včetně skutečných háčků, vstupů konfigurace, hodnotících testů, red-teaming vstupních míst a pozorovatelnosti.
- Opraveny tvrzení o implementaci příkladu a opravena přidružená aplikace/infrastruktura/konfigurace. Materiál o architektuře maloobchodu je explicitně oddělen od kompletní funkční aplikace.
- Obnoven matice jazyků CodeQL, vybrána podpora Node.js 24 pro vývojový kontejner a validátory nastavení hlásí neúspěšné příkazy verzí.

#### Přidáno
- Offline kontrola odkazů/kotev pouze v angličtině, regresní testy a workflow dokumentace, které také budují workshop v přísném režimu. Generované překlady a přeložené obrázky jsou vyňaty.

#### Rozsah ověření
- Kontroly zdroje, syntaxe, konfigurace, lokálního chování a síťového propojení nestanovují schopnost živého nasazení Azure, kvótu, RBAC, regionální dostupnost modelu, účtování, bezpečnostní shodu ani připravenost do produkce.
- Starší položky níže jsou historické záznamy, nikoli aktuální příkazy nebo vydání.

### [v3.23.0] - 2026-07-13

#### Oživení AZD 1.27.1: Aktualizace aktuálnosti verze
**Tato verze znovu ověřuje kurz vůči `azd` `1.27.1` (červenec 2026, nejnovější stabilní vydání) a aktuálnímu náhledovému rozšíření AI agentů `azure.ai.agents` `1.0.0-beta.5`, čímž aktualizuje každý banner „ověřeno proti“ po vydání 1.26.0, 1.27.0 a 1.27.1.**

#### Změněno
- **✅ Aktualizována validační základna** z `azd 1.25.6` (červen 2026) na `azd 1.27.1` (červenec 2026) v hlavním README, ve všech README kapitol, lekci vývojářského kontejneru v Kapitole 1 (včetně příkladů s pevným číslem verze), lekci vlastních šablon v Kapitole 4, lekci multi-agentů v Kapitole 5 a dokumentaci workshopu
- **🤖 Oživení základny Kapitoly 2** z `azd 1.23.12` (březen 2026) na `azd 1.27.1` ve `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` a `microsoft-foundry-integration.md`; data validačních poznámek aktualizována na 2026-07-13
- **🧩 Zvýšení verze rozšíření AI agentů** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na aktuální vydání `1.0.0-beta.5` v README Kapitoly 2 a `agents.md`
- **🧪 Aktualizace validačního příkladu workshopu** (`azd version` výstup) na `1.27.1`

#### Poznámky k příslušným vydáním azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora Go pro Azure Functions na Flex Consumption, `azd config sub-filter` filtry předplatného na nájemce, samostatné balíčky rozšíření (`azd x pack --bundle`) a `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelujte projekty/agenty Azure AI Foundry přímo v `azure.yaml` (inicializace bez Bicepu/Terraforma), podpora nasazení kontejnerů pro App Service (`host: appservice` + `language: docker`), přímé `-s/--source` pro příkazy `azd extension` a `azd tool uninstall`
- **1.27.1 (2026-07-09):** Příznak `--no-dependencies` pro `azd extension install`, výchozí vyloučení zastaralých modelů z katalogu/kvót, a několik oprav chyb

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

#### Začátečnické doplnění #2: Tvorba šablon, vývojářské kontejnery, Pulumi, Azure DevOps, servisní principy a další
**Tato verze uzavírá zbývající středně pokročilé mezery objevené analýzou azd-coverage: jak tvořit a publikovat vlastní šablonu, reprodukovatelné prostředí vývojářských kontejnerů/Codespaces, poskytovatel infrastruktury Pulumi, průvodce Azure DevOps CI/CD, autentizaci servisním principem, pokyny pro výběr hostitele (AKS/Spring Apps), vysvětlení `azd restore`/`azd package`, zpracování chyb háčků a praktiky týmových/společných prostředí.**

#### Přidáno
- **🧱 Nová lekce Kapitoly 4** `docs/chapter-04-infrastructure/custom-templates.md` — tvorba vlastní azd šablony: požadovaná struktura (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametrizace infrastruktury s tokenem zdroje `uniqueString()` a značkou `azd-env-name`, testování lokálně s `azd init --template <local-path>`, publikování na GitHub a odeslání do galerií Awesome AZD
- **📦 Nová lekce Kapitoly 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovatelné azd prostředí s Dev Containery a GitHub Codespaces: minimální `.devcontainer/devcontainer.json` využívající oficiální funkci `ghcr.io/azure/azure-dev/azd`, vlastnosti specifické pro jazyk, `docker-in-docker` pro hostitele kontejnerů a `azd auth login --use-device-code` pro vzdálené přihlášení
- **🧩 Pulumi s azd** sekce v `docs/chapter-04-infrastructure/provisioning.md` — konfigurace `infra.provider: pulumi`, uspořádání složek Pulumi, zásobníky mapované na azd prostředí, požadované výstupy/označování a stejný pracovní postup `azd up` / `azd down`
- **🎯 Pokyny pro výběr hostitele** v `docs/chapter-04-infrastructure/provisioning.md` — přívětivé srovnání `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp` s pokyny, kdy zvolit AKS nebo Azure Spring Apps
- **🛠️ Průvodce Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, připojení služby s workload identity federation (OIDC), generovaný `azure-dev.yml` a nastavení skupiny proměnných
- **🔑 Servisní principy (vzor 4)** přidány do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivní přihlášení `azd auth login` s klientským tajemstvím vs. federované/OIDC údaje, kdy používat a bezpečné uložení přihlašovacích údajů
- **🪝 Zpracování chyb háčků** podsekce v `docs/chapter-04-infrastructure/deployment-guide.md` — kódy ukončení a `set -e`, `continueOnError`, testování háčků izolovaně s `azd hooks run`, OS specifické shelly a `--debug`
- **👥 Týmová / sdílená prostředí** sekce v `docs/chapter-03-configuration/configuration.md` — co žije v `.azure/`, co ignorovat v gitu, prostředí podle vývojáře, `azd env list`/`select`, a poskytování hodnot prostředí v CI/CD
- **🧰 Vysvětlení `azd restore` a rozšíření `azd package`** v `resources/cheat-sheet.md` — obnovování závislostí a budování nasaditelného artefaktu bez nasazení

#### Změněno
- **🧭 Tabulka lekcí Kapitoly 4** aktualizována o novou lekci „Tvorba vlastní šablony“ (Lekce 3)
- **🧭 Tabulka lekcí Kapitoly 1** aktualizována o novou lekci „Dev Containery & Codespaces“ (Lekce 5); navigační patičky propojeny mezi `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začátečnické doplnění: Praktická lekce s více agenty, „Přineste vlastní aplikaci,“ Terraform a průvodce CI/CD
**Tato verze uzavírá největší mezery pro kompletní začátečnický průvodce přidáním dvou nových praktických lekcí (nasaditelný průvodce s více agenty a přidání azd do existující aplikace), přívětivého úvodu k háčkům, sekce Terraform s azd, krok za krokem průvodce pipeline GitHub Actions, vysvětlovače nových náhledových rozšíření a explicitní kontrolní seznam ověření nasazení.**

#### Přidáno
- **🤝 Nová lekce Kapitoly 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plně praktický, nasaditelný průvodce se dvěma agenty (orchestrátor + specialisté) pomocí reálné šablony (`contoso-creative-writer`), zahrnující kdy použít multi-agentní přístup, pracovní postup `azd up`, porozumění nasazených zdrojů, meziagentní trasování, přizpůsobení a úklid
- **📦 Nová lekce Kapitoly 1** `docs/chapter-01-foundation/bring-your-own-app.md` — jak přidat azd do existujícího projektu s `azd init` („použít kód v aktuálním adresáři“), porozumění `azure.yaml` a `infra/`, `azd infra generate`, detekce hostitele a nasazení s `azd up`
- **🌐 Sekce Terraform s azd** přidána do `docs/chapter-04-infrastructure/provisioning.md` — konfigurace `infra.provider: terraform`, uspořádání složek `.tf`, požadované výstupy `AZURE_*` a označování `azd-env-name`, a stejný pracovní postup `azd up` / `azd down` (uzavírá mezeru, kde byla uvedena podpora Terraformu, ale byla demonstrována pouze Bicep)
- **⚙️ Podrobný průvodce GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitáře až po automatizované nasazení: `azd pipeline config`, federované přihlašovací údaje OIDC (žádné uložené tajemství), generované `azure-dev.yml` a pokyny k tajemstvím vs. proměnné
- **🪝 Začátečnický úvod "Nováček v hookech?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — co je hook, tabulka fází hooků, minimální první hook a ruční spuštění hooků pomocí `azd hooks run`
- **✅ Kontrolní seznam "Ověřte své nasazení"** přidán do kroku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola health endpointu a explicitní kritéria úspěchu
- **🧩 Vysvětlení nových preview rozšíření** `azure.ai.skills` a `azure.ai.connections` (co to je a kdy je použít) v `docs/chapter-08-production/production-ai-practices.md`

#### Změněno
- **🧭 Opravená tabulka lekcí kapitoly 5**: `multi-agent-basics.md` je nyní Lekce 1 (jediná plně praktická lekce), s pravdivým označením, že Lekce 2 je v Kapitole 6 a scénář Retail je architektonický plán, nikoli šablona jedním příkazem
- **🧭 Tabulka lekcí kapitoly 1** nyní zahrnuje novou lekci "Přineste svou vlastní aplikaci" (Lekce 4)
- **🔗 Aktualizované navigační patičky**: `first-project.md` nyní odkazuje dopředu na `bring-your-own-app.md`

#### Opraveno
- **🧱 Uzavřená mezera "nárokovaných, ale chybějících" Terraform dovedností** — kurz dříve odkazoval na podporu Terraformu, aniž by ji ukázal
- **🔀 Opravené zavádějící průseky v kapitole 5**, které naznačovaly existenci plné multi-agent implementace, přestože existoval pouze architektonický plán

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

#### Aktualizace AZD 1.25.6, plné příkazy životního cyklu agenta a rebranding Aspire
**Tato verze znovu ověřuje kurz vůči `azd` `1.25.6` (červen 2026) a rozšíření `azure.ai.agents` `0.1.40-preview`, rozšiřuje AI pokyny od "vytvořit agenta" až po celý životní cyklus agenta (test → vyhodnocení → optimalizace → kontrola → odstranění), zviditelňuje nová preview rozšíření `azure.ai.skills` a `azure.ai.connections` a poznamenává rebranding produktu z ".NET Aspire" na "Aspire".**

#### Přidáno
- **🔁 Pokrytí celého životního cyklu agenta** pro začátečníky a inženýry AI v dokumentaci:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabulka životního cyklu (vytvořit → testovat → měřit → zlepšovat → kontrolovat → čistit) přidána do sekce Rozšíření a AI příkazů
  - `docs/chapter-08-production/production-ai-practices.md` — Nová sekce "Řízení životního cyklu agenta" pokrývající `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, a `delete --force`
  - `resources/cheat-sheet.md` — Rozšířené příkazy AI agreta s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nová preview rozšíření** zdokumentována: `azure.ai.skills` (znovupoužitelné dovednosti agenta) a `azure.ai.connections` (připojení Foundry) přidána do tabulky rozšíření a rychlé příručky
- **⏱️ Pokyny pro časování odpovědí** — příklady `azd ai agent invoke` nyní uvádějí, že tiskne celkovou latenci a čas do prvního bajtu
- **📌 Banner verze** v kořenovém README nasměruje uživatele na `azd version` a `azd upgrade`

#### Změněno
- **✅ Aktuální validační základna** z `azd 1.23.12` (březen 2026) na `azd 1.25.6` (červen 2026) napříč všemi kapitolami README a dokumentací workshopu
- **🤖 Aktualizace poznámky k rozšíření v kapitole 2** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Aktualizace příkladu workshopové validace** (výstup `azd version`) na `1.25.6`
- **🧭 Aktualizace README "Co je nového v azd dnes"** k zdůraznění kompletního životního cyklu agenta, nových AI rozšíření a nedávných oprav pro lepší uživatelský zážitek (idempotence `azd init`, čištění zastaralých tokenů `azd auth login`, výzva při prvním spuštění `azd tool`)
- **📖 Kapitola 2 agents.md (Volba 4)** nyní směřuje studenty k příkazům životního cyklu po nasazení namísto ukončení u `azd up`

#### Opraveno
- **🏷️ Pojmenování produktu** — přidána poznámka o rebrandingu Aspire (".NET Aspire" je nyní jednoduše "Aspire"); podpora Aspire v azd zůstává nezměněna
- **🔎 Live validace vydání** potvrzena na základě vydání Azure Developer CLI: stabilní CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Zjednodušení zapojení začátečníků, validace nastavení a úklid finálních AZD příkazů
**Tato verze navazuje na ověřování AZD 1.23 a přináší dokumentační průchod zaměřený na začátečníky: objasňuje pokyny pro autentifikaci s prioritou na AZD, přidává skripty pro ověření lokálního nastavení, ověřuje klíčové příkazy vůči živému AZD CLI a odstraňuje poslední zastaralé reference anglických příkazů mimo changelog.**

#### Přidáno
- **🧪 Skripty pro ověření nastavení začátečníků** pomocí `validate-setup.ps1` a `validate-setup.sh`, aby studenti mohli zkontrolovat potřebné nástroje před začátkem kapitoly 1
- **✅ Předběžné kroky ověření nastavení** v hlavním README a README kapitoly 1, aby se před `azd up` zachytily chybějící předpoklady

#### Změněno
- **🔐 Pokyny k autentifikaci začátečníků** nyní konzistentně považují `azd auth login` za primární cestu pro AZD workflow, přičemž `az login` je označeno jako volitelné, pokud se přímo nepoužívají Azure CLI příkazy
- **📚 Průběh onboardingu v kapitole 1** nyní ukazuje studentům, aby před instalací, autentifikací a prvním nasazením ověřili své lokální nastavení
- **🛠️ Zprávy validátoru** jasně oddělují blokující požadavky od volitelných varování Azure CLI pro začátečnickou cestu zaměřenou pouze na AZD
- **📖 Konfigurační, troubleshootingové a příkladové dokumenty** nyní rozlišují mezi požadovanou AZD autentifikací a volitelným přihlášením do Azure CLI, kde dříve byly oba způsoby prezentovány bez kontextu

#### Opraveno
- **📋 Zbývající reference anglických příkazů** aktualizovány na aktuální formy AZD, včetně `azd config show` v rychlé příručce a `azd monitor --overview` tam, kde měla být uvedena přehledová doporučení Azure Portalu
- **🧭 Mírně snížená očekávání začátečníků v kapitole 1** tak, aby se předešlo přehnaným slibům o bezchybnosti či rollbacku napříč všemi šablonami a zdroji Azure
- **🔎 Validace živého CLI** potvrzena pro aktuální podporu `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

#### Validace AZD 1.23.12, rozšíření prostředí workshopu a aktualizace AI modelu
**Tato verze provádí dokumentační validační průchod vůči `azd` `1.23.12`, aktualizuje zastaralé příklady azd příkazů, obnovuje AI modelová doporučení na aktuální výchozí hodnoty a rozšiřuje pracovní instrukce workshopu nad rámec GitHub Codespaces i na dev kontejnery a lokální klony.**

#### Přidáno
- **✅ Poznámky k validaci napříč hlavními kapitolami a dokumentací workshopu** pro explicitní stanovení testované AZD základny pro studenty používající novější nebo starší verze CLI
- **⏱️ Pokyny k timeoutu nasazení** pro dlouhotrvající nasazení AI aplikací pomocí `azd deploy --timeout 1800`
- **🔎 Kroky inspekce rozšíření** pomocí `azd extension show azure.ai.agents` v AI workflow dokumentech
- **🌐 Širší pokyny pro prostředí workshopu** zahrnující GitHub Codespaces, dev kontejnery a lokální klony s MkDocs

#### Změněno
- **📚 Úvodní README kapitoly** nyní konzistentně uvádí validaci vůči `azd 1.23.12` napříč sekcemi základy, konfigurace, infrastruktury, multi-agent, přednasazení, troubleshooting a produkce
- **🛠️ Aktualizace referencí azd příkazů** na aktuální formy v dokumentaci:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` nebo `azd env get-value(s)` dle kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kde je uveden přehled Application Insights
- **🧪 Zjednodušené příklady preview provisioning** na aktuálně podporované způsoby, například `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Průběh workshopu** aktualizován tak, aby studenti mohli dokončit laboratoře v Codespaces, dev kontejneru nebo lokálním klonu, místo předpokladu výhradního Codespaces provedení
- **🔐 Pokyny k autentifikaci** nyní preferují `azd auth login` pro AZD workflow, přičemž `az login` je pozicováno jako volitelné při přímém použití Azure CLI příkazů

#### Opraveno
- **🪟 Normalizace instalačních příkazů Windows** na aktuální pojmenování balíčku `winget` v instalační příručce
- **🐧 Oprava instrukcí instalace Linuxu** k vyhnutí se nepodporovaným distro-specifickým pokynům balíčkovacích manažerů `azd` a místo toho přesměrování na vydané artefakty tam, kde je to vhodné
- **📦 Aktualizace příkladů AI modelů** z dřívějších výchozích hodnot jako `gpt-35-turbo` a `text-embedding-ada-002` na aktuální příklady jako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Oprava snippetů nasazení a diagnostiky** tak, aby používaly aktuální příkazy prostředí a stavu v logách, skriptech a troubleshootingových krocích
- **⚙️ Pokyny GitHub Actions** aktualizovány z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny pro souhlas MCP/Copilot** aktualizovány z `azd mcp consent` na `azd copilot consent list`

#### Vylepšeno
- **🧠 AI kapitola** nyní lépe vysvětluje chování citlivé na preview verze `azd ai`, přihlašování specifické pro tenant, aktuální používání rozšíření a aktualizovaná doporučení pro nasazení modelů
- **🧪 Instrukce workshopu** nyní používají realističtější příklady verzí a jasnější jazyk nastavení prostředí pro praktické laboratoře
- **📈 Produkční a troubleshooting dokumenty** nyní lépe ladí s aktuálním monitorováním, fallback modelem a příklady nákladových úrovní

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

#### AZD AI CLI příkazy, validace obsahu a rozšíření šablon
**Tato verze přidává pokrytí příkazů `azd ai`, `azd extension` a `azd mcp` napříč všemi kapitolami týkajícími se AI, opravuje nefunkční odkazy a zastaralý kód v agents.md, aktualizuje cheat sheet a zásadně přepracovává sekci Příkladové šablony s ověřenými popisy a novými šablonami Azure AI AZD.**

#### Přidáno
- **🤖 Pokrytí AZD AI CLI** ve 7 souborech (předtím pouze v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekce "Rozšíření a AI příkazy" představující `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s porovnávací tabulkou (šablony vs přístup manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekce "AZD Extensions for Foundry" a "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Rychlý start nyní ukazuje nasazení jak šablonové, tak manifestové
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekce nasazení nyní obsahuje volbu `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekce "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nová sekce "AI & Extensions Commands" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové příkladové šablony AZD AI** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat využívající Langchain4J s možnostmi nasazení ACA/AKS
  - **contoso-creative-writer** — Víceagentní kreativní aplikační psaní pomocí Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Bezserverový RAG pomocí Azure Functions + LangChain.js + Cosmos DB s lokální podporou Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový RAG akcelerátor s admin portálem, integrací Teams a možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenční aplikace MCP orchestrací více agentů s servery v .NET, Python, Java a TypeScript
  - **azd-ai-starter** — Minimální šablona startéru infrastruktury Azure AI v Bicep
  - **🔗 Výborný odkaz do galerie AZD AI** — Odkaz na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablon)

#### Opraveno
- **🔗 navigace v agents.md**: Odkazy Předchozí/Následující nyní odpovídají pořadí lekcí v kapitole 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 nefunkční odkazy v agents.md**: `production-ai-practices.md` opraven na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 zastaralý kód v agents.md**: Nahrazeno `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neplatné API v agents.md**: Přesunuto `max_tokens` z `create_agent()` do `create_run()` jako `max_completion_tokens`
- **🔢 počítání tokenů v agents.md**: Hrubý odhad `len//4` nahrazen precizním `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opraveny služby z „Cognitive Search + App Service“ na „Azure AI Search + Azure Container Apps“ (výchozí hostitel změněn v říjnu 2024)
- **contoso-chat**: Aktualizován popis na základě Azure AI Foundry + Prompty, odpovídající skutečnému názvu a technologické sadě repozitáře

#### Odstraněno
- **ai-document-processing**: Odstraněna nefunkční reference na šablonu (repo není veřejně přístupné jako AZD šablona)

#### Vylepšeno
- **📝 cvičení v agents.md**: Cvičení 1 nyní ukazuje očekávaný výstup a krok `azd monitor`; cvičení 2 obsahuje kompletní registrační kód `FunctionTool`; cvičení 3 nahrazuje vágní pokyny konkrétními příkazy `prepdocs.py`
- **📚 zdroje v agents.md**: Aktualizovány odkazy na dokumentaci Azure AI Agent Service a rychlý start
- **📋 tabulka Další kroky v agents.md**: Přidán odkaz na AI Workshop Lab pro kompletní pokrytí kapitoly

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

#### Vylepšení navigace v kurzu
**Tato verze zlepšuje navigaci kapitol v README.md pomocí rozšířeného formátu tabulky.**

#### Změněno
- **Tabulka plánu kurzu**: Rozšířena o přímé odkazy na lekce, odhad doby trvání a hodnocení složitosti
- **Úklid složek**: Odstraněné redundantní staré složky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Ověření odkazů**: Ověřeno všech 21+ interních odkazů v tabulce plánu kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizace názvů produktů
**Tato verze aktualizuje odkazy na produkty podle současné značky Microsoft.**

#### Změněno
- **Microsoft Foundry → Microsoft Foundry**: Všechny zmínky aktualizovány v souborech bez překladu
- **Azure AI Agent Service → Foundry Agents**: Název služby aktualizován dle současné značky

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

#### Rozsáhlé přeorganizování repozitáře: složky pojmenované podle kapitol
**Tato verze přeuspořádala dokumentaci do vyhrazených složek kapitol pro lepší přehlednost.**

#### Přejmenované složky
Staré složky byly nahrazeny složkami číslovanými podle kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Přidáno nové: `docs/chapter-05-multi-agent/`

#### Migrace souborů
| Soubor | Z | Do |
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
  - Vzdělávacími cíli a délkou trvání
  - Tabulkou lekcí s popisy
  - Příkazy pro rychlý start
  - Navigací do ostatních kapitol

#### Změněno
- **🔗 Aktualizace všech interních odkazů**: 78+ cest aktualizováno ve všech dokumentačních souborech
- **🗺️ Hlavní README.md**: Aktualizován plán kurzu s novou strukturou kapitol
- **📝 examples/README.md**: Aktualizovány křížové odkazy na složky kapitol

#### Odstraněno
- Starší struktura složek (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturalizace repozitáře: navigace kapitol
**Tato verze přidala README soubory s navigací kapitol (nahrazeno verzí v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový průvodce AI agenty
**Tato verze přidává komplexního průvodce nasazením AI agentů s Azure Developer CLI.**

#### Přidáno
- **🤖 docs/microsoft-foundry/agents.md**: Kompletní průvodce zahrnující:
  - Co jsou AI agenti a čím se liší od chatbotů
  - Tři šablony agentů pro rychlý start (Foundry Agents, Prompty, RAG)
  - Vzorce architektury agentů (jednotlivý agent, RAG, víceagentní)
  - Konfigurace nástrojů a přizpůsobení
  - Monitoring a sledování metrik
  - Zohlednění nákladů a optimalizace
  - Běžné scénáře řešení potíží
  - Tři praktická cvičení s kritérii úspěchu

#### Struktura obsahu
- **Úvod**: Koncept agentů pro začátečníky
- **Rychlý start**: Nasazení agentů pomocí `azd init --template get-started-with-ai-agents`
- **Architektonické vzory**: Vizuální diagramy vzorců agentů
- **Konfigurace**: Nastavení nástrojů a proměnné prostředí
- **Monitoring**: Integrace Application Insights
- **Cvičení**: Postupné praktické učení (20-45 minut každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizace prostředí DevContainer
**Tato verze aktualizuje konfiguraci vývojového kontejneru s moderními nástroji a lepšími výchozími hodnotami pro zážitek z učení AZD.**

#### Změněno
- **🐳 Základní obraz**: Aktualizováno z `python:3.12-bullseye` na `python:3.12-bookworm` (nejnovější stabilní Debian)
- **📛 Název kontejneru**: Přejmenováno z "Python 3" na "AZD pro začátečníky" pro lepší srozumitelnost

#### Přidáno
- **🔧 Nové funkce Dev Containeru**:
  - `azure-cli` s podporou Bicep povoleno
  - `node:20` (LTS verze pro AZD šablony)
  - `github-cli` pro správu šablon
  - `docker-in-docker` pro nasazení kontejnerových aplikací

- **🔌 Přesměrování portů**: Přednastavené porty pro běžný vývoj:
  - 8000 (náhled MkDocs)
  - 3000 (webové aplikace)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nová rozšíření VS Code**:
  - `ms-python.vscode-pylance` - Vylepšený Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa zdrojů Azure
  - `yzhang.markdown-all-in-one` - Úprava Markdownu
  - `DavidAnson.vscode-markdownlint` - Kontrola kódu Markdown
  - `bierner.markdown-mermaid` - Podpora diagramů Mermaid
  - `redhat.vscode-yaml` - Podpora YAML (pro azure.yaml)
  - `eamodio.gitlens` - Vizualizace Gitu
  - `mhutchie.git-graph` - Historie Gitu

- **⚙️ Nastavení VS Code**: Přidána výchozí nastavení pro Python interpreter, formátování po uložením a ořezávání mezer

- **📦 Aktualizován requirements-dev.txt**:
  - Přidán plugin MkDocs minify
  - Přidán pre-commit pro kvalitu kódu
  - Přidány balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opraveno
- **Post-Create příkaz**: Nyní kontroluje instalaci AZD a Azure CLI při spuštění kontejneru

---

### [v3.11.0] - 2026-02-05

#### Úprava README pro začátečníky
**Tato verze významně zlepšuje README.md pro lepší přístupnost pro začátečníky a přidává základní zdroje pro vývojáře AI.**

#### Přidáno
- **🆚 Porovnání Azure CLI a AZD**: Jasné vysvětlení, kdy použít který nástroj s praktickými příklady
- **🌟 Výborné AZD odkazy**: Přímé odkazy na komunitní galerii šablon a zdroje příspěvků:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - přes 200 připravených k nasazení šablon
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - komunitní příspěvky
- **🎯 Průvodce rychlým startem**: Zjednodušená sekce na 3 kroky (Instalace → Přihlášení → Nasazení)
- **📊 Tabulka navigace podle zkušeností**: Jasné pokyny, kde začít podle úrovně vývojáře

#### Změněno
- **Struktura README**: Přepracována pro postupné odkrývání - nejdůležitější informace na začátek
- **Úvodní sekce**: Přepsána, aby vysvětlila „Kouzlo `azd up`“ i úplným začátečníkům
- **Odstraněn duplicitní obsah**: Eliminována duplicitní sekce řešení potíží
- **Příkazy pro řešení problémů**: Oprava odkazu `azd logs` na platný `azd monitor --logs`

#### Opraveno
- **🔐 Příkazy pro ověřování**: Přidáno `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na příkazy**: Odebrány zbývající `azd logs` ze sekce README řešení problémů

#### Poznámky
- **Rozsah**: Změny aplikovány na hlavní README.md a resources/cheat-sheet.md
- **Cílová skupina**: Vylepšení zaměřená speciálně na vývojáře nováčky v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizace přesnosti příkazů Azure Developer CLI
**Tato verze opravuje neexistující příkazy AZD v celé dokumentaci a zajišťuje, že všechny ukázky kódu používají platnou syntax Azure Developer CLI.**

#### Opraveno
- **🔧 Neexistující příkazy AZD odstraněny**: Komplexní audit a oprava neplatných příkazů:
  - `azd logs` (neexistuje) → nahrazeno `azd monitor --logs` nebo alternativami Azure CLI
  - `azd service` podpříkazy (neexistují) → nahrazeny `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistuje) → odstraněny nebo nahrazeny platnými alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` přepínače (neexistují) → odstraněny
  - `azd provision --what-if/--rollback` přepínače (neexistují) → aktualizovány na používání `--preview`
  - `azd config validate` (neexistuje) → nahrazeno `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistují) → odstraněny

- **📚 Soubory aktualizované opravou příkazů**:
  - `resources/cheat-sheet.md`: Rozsáhlá revize odkazů na příkazy
  - `docs/deployment/deployment-guide.md`: Opraveny strategie vrácení změn a nasazení
  - `docs/troubleshooting/debugging.md`: Opravené sekce analýzy protokolů
  - `docs/troubleshooting/common-issues.md`: Aktualizované příkazy pro řešení problémů
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekce ladění AZD
  - `docs/getting-started/azd-basics.md`: Opravené příkazy monitorování
  - `docs/getting-started/first-project.md`: Aktualizované příklady monitorování a ladění
  - `docs/getting-started/installation.md`: Opravené příklady nápovědy a verzí
  - `docs/pre-deployment/application-insights.md`: Opravené příkazy pro prohlížení protokolů
  - `docs/pre-deployment/coordination-patterns.md`: Opravené příkazy ladění agenta

- **📝 Aktualizace odkazu na verzi**:
  - `docs/getting-started/installation.md`: Změna pevné verze `1.5.0` na generickou `1.x.x` s odkazem na vydání

#### Změněno
- **Strategie vrácení změn**: Dokumentace aktualizována na používání Gitového vrácení změn (AZD nemá nativní rollback)
- **Prohlížení protokolů**: Nahrazeny odkazy `azd logs` odkazy na `azd monitor --logs`, `azd monitor --live` a příkazy Azure CLI
- **Sekce výkonu**: Odebrány neexistující přepínače pro paralelní/incrementální nasazení, poskytnuty platné alternativy

#### Technické detaily
- **Platné příkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné přepínače azd monitoru**: `--live`, `--logs`, `--overview`
- **Odebrané funkce**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Ověření**: Příkazy ověřeny proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončení workshopu a aktualizace kvality dokumentace
**Tato verze dokončuje interaktivní moduly workshopu, opravuje všechny nefunkční odkazy v dokumentaci a zvyšuje celkovou kvalitu obsahu pro AI vývojáře používající Microsoft AZD.**

#### Přidáno
- **📝 CONTRIBUTING.md**: Nový dokument s pokyny pro přispívání:
  - Jasné instrukce pro nahlášení problémů a návrhy změn
  - Standardy dokumentace pro nový obsah
  - Pokyny pro příklady kódu a konvence zpráv o commitech
  - Informace o zapojení komunity

#### Dokončeno
- **🎯 Workshop Modul 7 (Závěr)**: Plně dokončený závěrečný modul s:
  - Komplexní sumarizací dosažených výsledků workshopu
  - Sekcí klíčových naučených konceptů pokrývajících AZD, šablony a Microsoft Foundry
  - Doporučeními pro pokračování ve vzdělávací cestě
  - Výzvami cvičení workshopu s hodnocením obtížnosti
  - Odkazy na zpětnou vazbu a podporu komunity

- **📚 Workshop Modul 3 (Deconstruction)**: Aktualizované vzdělávací cíle s:
  - Aktivací GitHub Copilot s MCP servery
  - Porozuměním struktuře složek šablon AZD
  - Vzory organizace infrastruktury jako kódu (Bicep)
  - Instrukcemi pro praktické cvičení

- **🔧 Workshop Modul 6 (Demontáž)**: Dokončeno s:
  - Cíli pro čištění zdrojů a správu nákladů
  - Použitím `azd down` pro bezpečné ukončení infrastruktury
  - Pokyny pro obnovu měkkých smazání kognitivních služeb
  - Bonusové průzkumné úkoly pro GitHub Copilot a Azure Portal

#### Opraveno
- **🔗 Opravy nefunkčních odkazů**: Vyřešeno 15+ nefunkčních interních odkazů v dokumentaci:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahrazen neexistující cicd-integration.md za deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty k FAQ a průvodci řešení problémů
  - `examples/container-app/microservices/README.md`: Opravené cesty k domovské stránce kurzu a průvodci nasazením
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy na kapitoly AI
  - `course-outline.md`: Opravené odkazy na průvodce instruktora a AI workshop laby

- **📅 Banner stavu workshopu**: Aktualizováno z „Ve výstavbě“ na aktivní stav workshopu s datem únor 2026

- **🔗 Navigace workshopu**: Opravené nefunkční navigační odkazy v workshop README.md směrující na neexistující složku lab-1-azd-basics

#### Změněno
- **Prezentace workshopu**: Odebráno upozornění „ve výstavbě“, workshop je nyní kompletní a připravený k použití
- **Konzistence navigace**: Zajištěno správné provázání mezi moduly workshopu
- **Odkazy na vzdělávací cestu**: Aktualizovány křížové odkazy kapitol s použitím správných cest microsoft-foundry

#### Ověřeno
- ✅ Všechny anglické markdown soubory mají platné interní odkazy
- ✅ Všechny moduly workshopu 0-7 jsou kompletní a mají vzdělávací cíle
- ✅ Navigace mezi kapitolami a moduly funguje správně
- ✅ Obsah je vhodný pro AI vývojáře používající Microsoft AZD
- ✅ Použito jazykové a strukturní přizpůsobení pro začátečníky
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pro přispěvatele komunity

#### Technická implementace
- **Ověření odkazů**: Automatizovaný PowerShell skript ověřil všechny interní .md odkazy
- **Audit obsahu**: Ruční kontrola úplnosti workshopu a vhodnosti pro začátečníky
- **Navigační systém**: Použití konzistentních navigačních vzorů kapitol a modulů

#### Poznámky
- **Rozsah**: Změny aplikovány pouze na anglickou dokumentaci
- **Překlady**: Překladové složky v této verzi neaktualizovány (automatický překlad bude synchronizován později)
- **Délka workshopu**: Kompletní workshop nyní poskytuje 3-4 hodiny praktického učení

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentace: Monitorování, bezpečnost a vzory multi-agentů
**Tato verze přidává komplexní A-kvalitní lekce o integraci Application Insights, vzorech ověřování a koordinaci multi-agentů pro produkční nasazení.**

#### Přidáno
- **📊 Lekce Integrace Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasazení zaměřené na AZD s automatickým zřizováním
  - Kompletní Bicep šablony pro Application Insights + Log Analytics
  - Funkční Python aplikace s vlastní telemetrií (1 200+ řádků)
  - Vzory monitorování AI/LLM (sledování tokenů/nákladů Microsoft Foundry Models)
  - 6 Mermaid diagramů (architektura, distribuované trasování, tok telemetrie)
  - 3 praktická cvičení (alerty, dashboardy, AI monitorování)
  - Příklady dotazů Kusto a strategie optimalizace nákladů
  - Streamování živých metrik a ladění v reálném čase
  - 40-50 minut výukového času s produkčními vzory

- **🔐 Lekce ověřování a bezpečnostních vzorů**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory ověřování (připojovací řetězce, Key Vault, spravovaná identita)
  - Kompletní Bicep infrastruktura pro bezpečné nasazení
  - Node.js aplikační kód s integrací Azure SDK
  - 3 kompletní cvičení (povolení spravované identity, identity přiřazené uživateli, rotace Key Vault)
  - Nejlepší bezpečnostní postupy a konfigurace RBAC
  - Průvodce řešením problémů a analýza nákladů
  - Produkční vzory bezheslového ověřování

- **🤖 Lekce vzorů koordinace multi-agentů**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorů koordinace (sekvenční, paralelní, hierarchický, na událostech, konsenzus)
  - Kompletní implementace orchestrátorského servisu (Python/Flask, 1 500+ řádků)
  - 3 specializované agentní implementace (výzkumník, spisovatel, editor)
  - Integrace Service Bus pro frontování zpráv
  - Správa stavů Cosmos DB pro distribuované systémy
  - 6 Mermaid diagramů zobrazujících interakce agentů
  - 3 pokročilá cvičení (zpracování timeoutu, logika opakování, obvodový přerušovač)
  - Rozpis nákladů (240-565 $/měsíc) s optimalizačními strategiemi
  - Integrace Application Insights pro monitoring

#### Vylepšeno
- **Kapitola před nasazením**: Nyní obsahuje komplexní vzory monitorování a koordinace
- **Kapitola začínáme**: Vylepšena o profesionální vzory ověřování
- **Připravenost na produkci**: Kompletní pokrytí od bezpečnosti po observabilitu
- **Osnova kurzu**: Aktualizována pro odkazy na nové lekce v kapitolách 3 a 6

#### Změněno
- **Postup učení**: Lepší integrace bezpečnosti a monitoringu napříč kurzem
- **Kvalita dokumentace**: Konzistentní standardy A-kvality (95-97 %) napříč novými lekcemi
- **Produkční vzory**: Kompletní pokrytí end-to-end pro podniková nasazení

#### Vylepšeno
- **Zážitek vývojáře**: Jasná cesta od vývoje k produkčnímu monitoringu
- **Bezpečnostní standardy**: Profesionální vzory pro ověřování a správu tajemství
- **Observabilita**: Kompletní integrace Application Insights s AZD
- **AI zátěže**: Specializované monitorování pro Microsoft Foundry Models a multi-agentní systémy

#### Ověřeno
- ✅ Všechny lekce obsahují kompletní funkční kód (ne pouze úryvky)
- ✅ Mermaid diagramy pro vizuální učení (19 celkem ve 3 lekcích)
- ✅ Praktická cvičení s validačními kroky (celkem 9)
- ✅ Produkční Bicep šablony nasaditelné přes `azd up`
- ✅ Analýza nákladů a optimalizační strategie
- ✅ Průvodce řešením problémů a osvědčené postupy
- ✅ Kontrolní body znalostí s ověřovacími příkazy

#### Výsledky hodnocení dokumentace
- **docs/pre-deployment/application-insights.md**: - Komplexní průvodce monitorováním
- **docs/getting-started/authsecurity.md**: - Profesionální bezpečnostní vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektury multi-agentů
- **Celkový nový obsah**: - Konzistentní vysoké standardy kvality

#### Technická implementace
- **Application Insights**: Log Analytics + vlastní telemetrie + distribuované trasování
- **Ověřování**: Spravovaná identita + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrace
- **Monitorování**: Živé metriky + dotazy Kusto + alerty + dashboardy
- **Správa nákladů**: Strategické vzorkování, politiky uchování, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšení kvality dokumentace a nový příklad Microsoft Foundry Models
**Tato verze zvyšuje kvalitu dokumentace v celém repozitáři a přidává kompletní příklad nasazení Microsoft Foundry Models s chatovacím rozhraním gpt-4.1.**

#### Přidáno
- **🤖 Příklad chatu Microsoft Foundry Models**: Kompletní nasazení gpt-4.1 s funkční implementací v `examples/azure-openai-chat/`:
  - Kompletní infrastruktura Microsoft Foundry Models (nasazení modelu gpt-4.1)
  - Python chatovací rozhraní příkazové řádky s historií konverzací
  - Integrace Key Vault pro bezpečné ukládání API klíčů
  - Sledování využití tokenů a odhad nákladů
  - Omezení rychlosti a zpracování chyb
  - Komplexní README s průvodcem nasazením na 35-45 minut
  - 11 produkčních souborů (Bicep šablony, Python aplikace, konfigurace)
- **📚 Cvičení v dokumentaci**: Přidána praktická cvičení do průvodce konfigurací:
  - Cvičení 1: Konfigurace více prostředí (15 minut)
  - Cvičení 2: Procvičování správy tajemství (10 minut)
  - Jasná kritéria úspěchu a ověřovací kroky
- **✅ Ověření nasazení**: Přidána sekce ověření do průvodce nasazením:
  - Postupy kontroly stavu
  - Kontrolní seznam kritérií úspěchu
  - Očekávané výstupy pro všechny příkazy nasazení
  - Rychlá reference pro řešení problémů

#### Vylepšeno
- **examples/README.md**: Aktualizováno na kvalitu A (93 %):
  - Přidán azure-openai-chat do všech relevantních sekcí
  - Lokální počet příkladů zvýšen z 3 na 4
  - Přidáno do tabulky příkladů AI aplikací
  - Integrované do Rychlého startu pro středně pokročilé uživatele
  - Přidáno do sekce Microsoft Foundry Templates
  - Aktualizovány matice porovnání a sekce hledání technologií
- **Kvalita dokumentace**: Vylepšeno z B+ (87 %) → A- (92 %) v celé složce s dokumentací:
  - Přidány očekávané výstupy k důležitým příkladům příkazů
  - Zahrnuty kroky ověřování změn konfigurace
  - Vylepšeno praktické učení pomocí cvičení

#### Změněno
- **Progres učení**: Lepší integrace příkladů AI pro středně pokročilé
- **Struktura dokumentace**: Více praktických cvičení s jasnými výsledky
- **Proces ověřování**: Přidány explicitní kritéria úspěchu k hlavním pracovním postupům

#### Vylepšeno
- **Zkušenost vývojáře**: Nasazení Microsoft Foundry Models nyní trvá 35-45 minut (oproti 60-90 u složitých alternativ)
- **Transparentnost nákladů**: Jasné odhady nákladů (50–200 USD/měsíc) pro příklad Microsoft Foundry Models
- **Učební cesta**: Vývojáři AI mají jasný vstupní bod s azure-openai-chat
- **Standardy dokumentace**: Konzistentní očekávané výstupy a kroky ověřování

#### Ověřeno
- ✅ Příklad Microsoft Foundry Models plně funkční s `azd up`
- ✅ Všechny 11 implementačních souborů syntakticky správné
- ✅ Pokyny v README odpovídají skutečné zkušenosti s nasazením
- ✅ Odkazy v dokumentaci aktualizovány ve více než 8 lokalitách
- ✅ Index příkladů přesně odráží 4 lokální příklady
- ✅ V tabulkách žádné duplicitní externí odkazy
- ✅ Všechny navigační odkazy správné

#### Technická implementace
- **Architektura Microsoft Foundry Models**: vzor gpt-4.1 + Key Vault + Container Apps
- **Zabezpečení**: Ready Managed Identity, tajné údaje v Key Vault
- **Monitoring**: Integrace Application Insights
- **Řízení nákladů**: Sledování tokenů a optimalizace využití
- **Nasazení**: Jeden příkaz `azd up` pro kompletní nastavení

### [v3.6.0] - 2025-11-19

#### Hlavní aktualizace: Příklady nasazení kontejnerových aplikací
**Tato verze přináší komplexní, produkčně připravené příklady nasazení kontejnerových aplikací pomocí Azure Developer CLI (AZD), s úplnou dokumentací a integrací do učební cesty.**

#### Přidáno
- **🚀 Příklady kontejnerových aplikací**: Nové lokální příklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletní přehled kontejnerizovaných nasazení, rychlý start, produkce a pokročilé vzory
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Uživatelsky přívětivé REST API s možností scale-to-zero, zdravotními sondami, monitoringem a odstraňováním problémů
  - [Microservices Architecture](../../examples/container-app/microservices): Produkčně připravené multi-službové nasazení (API Gateway, Product, Order, User, Notification), asynchronní messaging, Service Bus, Cosmos DB, Azure SQL, distribuované trasování, blue-green/canary nasazení
- **Nejlepší postupy**: Bezpečnost, monitoring, optimalizace nákladů a návody CI/CD pro kontejnerové workloads
- **Ukázkové kódy**: Kompletní `azure.yaml`, Bicep šablony a vícejazyčné implementace služeb (Python, Node.js, C#, Go)
- **Testování a odstraňování problémů**: End-to-end testovací scénáře, příkazy monitoringu, návody k odstraňování problémů

#### Změněno
- **README.md**: Aktualizováno o nové příklady kontejnerových aplikací v sekci „Local Examples - Container Applications“
- **examples/README.md**: Upraveno k zvýraznění kontejnerových příkladů, přidání položek do srovnávací matice a aktualizace technologických/architektonických odkazů
- **Osnova kurzu a studijní průvodce**: Aktualizováno o nové příklady kontejnerových aplikací a vzory nasazení v relevantních kapitolách

#### Ověřeno
- ✅ Všechny nové příklady jsou nasaditelné pomocí `azd up` a odpovídají nejlepším praktikám
- ✅ Křížové odkazy a navigace v dokumentaci aktualizovány
- ✅ Příklady pokrývají scénáře od začátečníků až po pokročilé, včetně produkčních mikroservis

#### Poznámky
- **Rozsah**: Pouze anglická dokumentace a příklady
- **Další kroky**: Rozšířit o další pokročilé kontejnerové vzory a CI/CD automatizaci v budoucích verzích

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Tato verze implementuje komplexní změnu názvu produktu z „Microsoft Foundry“ na „Microsoft Foundry“ ve veškeré anglické dokumentaci a reflektuje oficiální rebranding Microsoftu.**

#### Změněno
- **🔄 Aktualizace názvu produktu**: Kompletní rebranding z „Microsoft Foundry“ na „Microsoft Foundry“
  - Aktualizovány všechny odkazy v anglické dokumentaci ve složce `docs/`
  - Přejmenována složka: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Přejmenován soubor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkem: 23 aktualizací obsahu v 7 dokumentačních souborech

- **📁 Změny struktury složek**:
  - `docs/ai-foundry/` přejmenováno na `docs/microsoft-foundry/`
  - Všechny křížové odkazy aktualizovány tak, aby odrážely novou strukturu složek
  - Navigační odkazy ověřeny ve veškeré dokumentaci

- **📄 Přejmenování souborů**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všechny interní odkazy aktualizovány na nové názvy souborů

#### Aktualizované soubory
- **Dokumentace kapitol** (7 souborů):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizace navigačních odkazů
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizace odkazů na název produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Již používá Microsoft Foundry (z předchozích aktualizací)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizace odkazů (přehled, zpětná vazba komunity, dokumentace)
  - `docs/getting-started/azd-basics.md` - 4 aktualizace křížových odkazů
  - `docs/getting-started/first-project.md` - 2 aktualizace navigačních odkazů kapitol
  - `docs/getting-started/installation.md` - 2 aktualizace odkazů na následující kapitolu
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizace odkazů (navigace, Discord komunita)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizace navigačního odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizace navigačního odkazu

- **Soubory struktury kurzu** (2 soubory):
  - `README.md` - 17 aktualizací odkazů (přehled kurzu, názvy kapitol, sekce šablon, názory komunity)
  - `course-outline.md` - 14 aktualizací odkazů (přehled, učební cíle, zdroje kapitol)

#### Ověřeno
- ✅ Žádné zbývající odkazy na složku „ai-foundry“ v anglických dokumentech
- ✅ Žádné zbývající odkazy na název produktu „Microsoft Foundry“ v anglických dokumentech
- ✅ Všechny navigační odkazy fungují s novou složkovou strukturou
- ✅ Přejmenování souborů a složek dokončeno úspěšně
- ✅ Ověřeny křížové odkazy mezi kapitolami

#### Poznámky
- **Rozsah**: Změny aplikovány pouze v anglické dokumentaci ve složce `docs/`
- **Překlady**: Překladové složky (`translations/`) nebyly v této verzi aktualizovány
- **Workshop**: Materiály workshopu (`workshop/`) nebyly v této verzi aktualizovány
- **Příklady**: Ukázkové soubory mohou stále obsahovat odkazy na staré názvy (bude řešeno v budoucích aktualizacích)
- **Externí odkazy**: Externí URL a odkazy na GitHub repozitáře zůstávají nezměněny

#### Průvodce migrací pro přispěvatele
Pokud máte lokální větve nebo dokumentaci odkazující na starou strukturu:
1. Aktualizujte odkazy na složky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na soubory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte název produktu: „Microsoft Foundry“ → „Microsoft Foundry“
4. Ověřte, že všechny interní odkazy v dokumentaci stále fungují

---

### [v3.4.0] - 2025-10-24

#### Vylepšení náhledu a validace infrastruktury
**Tato verze přináší komplexní podporu nové preview funkce Azure Developer CLI a zlepšuje uživatelský zážitek z workshopu.**

#### Přidáno
- **🧪 Dokumentace příkazu azd provision --preview**: Komplexní pokrytí nové schopnosti náhledu infrastruktury
  - Referenční příkazy a příklady použití v cheat sheetu
  - Detailní integrace do průvodce provisioningu s případy užití a výhodami
  - Integrace předběžné kontroly pro bezpečnější validaci nasazení
  - Aktualizace „getting started“ průvodce s důrazem na bezpečné praktiky nasazení
- **🚧 Banner stavu workshopu**: Profesionální HTML banner indikující stav vývoje workshopu
  - Přechodový design s indikátory stavby pro jasnou komunikaci uživatelům
  - Poslední aktualizace s časovou známkou pro transparentnost
  - Mobilně responzivní design pro všechny typy zařízení

#### Vylepšeno
- **Bezpečnost infrastruktury**: Funkce náhledu integrovaná v dokumentaci nasazení
- **Validace před nasazením**: Automatizované skripty nyní zahrnují testování náhledu infrastruktury
- **Pracovní postup vývojáře**: Aktualizované sekvence příkazů zahrnující náhled jako nejlepší praxi
- **Zážitek z workshopu**: Jasné nastavení očekávání uživatelů ohledně stavu obsahu

#### Změněno
- **Nejlepší postupy pro nasazení**: Doporučen přístup založený na workflow s náhledem jako první
- **Tok dokumentace**: Validace infrastruktury přesunuta dříve v procesu učení
- **Prezentace workshopu**: Profesionální komunikace stavu s jasným časovým harmonogramem vývoje

#### Vylepšeno
- **Přístup zaměřený na bezpečnost**: Změny infrastruktury lze nyní ověřit před nasazením
- **Týmová spolupráce**: Výsledky náhledu mohou být sdíleny k revizi a schválení
- **Povědomí o nákladech**: Lepší pochopení nákladů na zdroje před provisionováním
- **Zmírnění rizik**: Snížení selhání nasazení díky předběžné validaci

#### Technická implementace
- **Integrace do více dokumentů**: Funkce náhledu zdokumentována ve 4 klíčových souborech
- **Vzor příkazů**: Konzistentní syntax a příklady napříč dokumentací
- **Integrace nejlepších praktik**: Náhled zahrnut v ověřovacích workflow a skriptech
- **Vizuální indikátory**: Jasné označení NOVÉ funkce pro lepší viditelnost

#### Infrastruktura workshopu
- **Komunikace stavu**: Profesionální HTML banner s přechodovým stylem
- **Uživatelský zážitek**: Jasné označení stavu vývoje předchází zmatkům
- **Profesní prezentace**: Zachovává důvěryhodnost repozitáře a nastavuje očekávání
- **Transparentnost harmonogramu**: Časová značka poslední aktualizace říjen 2025 pro odpovědnost

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktivní zážitek z učení
**Tato verze zavádí komplexní materiály workshopu s interaktivními průvodci v prohlížeči a strukturovanými učebními cestami.**

#### Přidáno
- **🎥 Interaktivní průvodce workshopem**: Zážitek z workshopu v prohlížeči s možností náhledu MkDocs
- **📝 Strukturované instrukce workshopu**: Sedmistupňová vedená učební cesta od objevování po přizpůsobení
  - 0-Úvod: Přehled workshopu a nastavení
  - 1-Výběr AI šablony: Proces objevování a výběru šablony
  - 2-Ověření AI šablony: Postupy nasazení a validace
  - 3-Analýza AI šablony: Pochopení architektury šablony
  - 4-Konfigurace AI šablony: Nastavení a přizpůsobení
  - 5-Přizpůsobení AI šablony: Pokročilé úpravy a iterace
  - 6-Odstranění infrastruktury: Úklid a správa zdrojů
  - 7-Závěr: Shrnutí a další kroky
- **🛠️ Nástroje workshopu**: Konfigurace MkDocs s tématem Material pro vylepšený zážitek učení
- **🎯 Praktická učební cesta**: Třífázová metodologie (Objevování → Nasazení → Přizpůsobení)
- **📱 Integrace GitHub Codespaces**: Bezproblémové nastavení vývojového prostředí

#### Vylepšeno
- **Laboratoř AI workshopu**: Rozšířena o komplexní 2–3 hodinovou strukturovanou učební zkušenost
- **Workshopová dokumentace**: Profesionální prezentace s navigací a vizuálními pomůckami
- **Progres učení**: Jasné krok za krokem vedení od výběru šablony k produkčnímu nasazení
- **Zkušenost vývojáře**: Integrované nástroje pro zefektivnění vývojových workflow

#### Vylepšeno
- **Přístupnost**: Rozhraní v prohlížeči s vyhledáváním, funkcí kopírování a přepínáním barevného schématu
- **Učení vlastním tempem**: Flexibilní struktura workshopu přizpůsobená různým rychlostem učení
- **Praktická aplikace**: Scénáře nasazení AI šablon v reálném světě
- **Integrace komunity**: Integrace Discordu pro podporu workshopu a spolupráci

#### Funkce workshopu
- **Vestavěné vyhledávání**: Rychlé vyhledávání klíčových slov a lekcí
- **Kopírování bloků kódu**: Funkce kopírování při najetí myší u všech příkladů kódu
- **Přepínač témat**: Podpora tmavého/světelného režimu pro různé preference
- **Vizuální materiály**: Snímky obrazovky a diagramy pro lepší pochopení
- **Integrace nápovědy**: Přímý přístup na Discord pro komunitní podporu

### [v3.2.0] - 2025-09-17

#### Hlavní restrukturalizace navigace a systém učení založený na kapitolách
**Tato verze zavádí komplexní strukturu učení založenou na kapitolách s vylepšenou navigací v celém repozitáři.**

#### Přidáno
- **📚 Systém učení založený na kapitolách**: Celý kurz restrukturován do 8 postupných učebních kapitol
  - Kapitola 1: Základy & rychlý start (⭐ - 30–45 minut)
  - Kapitola 2: AI-First vývoj (⭐⭐ - 1–2 hodiny)
  - Kapitola 3: Konfigurace & autentizace (⭐⭐ - 45–60 minut)
  - Kapitola 4: Infrastruktura jako kód & nasazení (⭐⭐⭐ - 1–1,5 hodiny)
  - Kapitola 5: Víceagentní AI řešení (⭐⭐⭐⭐ - 2–3 hodiny)
  - Kapitola 6: Validace & plánování před nasazením (⭐⭐ - 1 hodina)
  - Kapitola 7: Odstraňování problémů & ladění (⭐⭐ - 1–1,5 hodiny)
  - Kapitola 8: Produkční & enterprise vzory (⭐⭐⭐⭐ - 2–3 hodiny)
- **📚 Komplexní navigační systém**: Konzistentní navigační záhlaví a zápatí ve veškeré dokumentaci
- **🎯 Sledování progresu**: Checklist dokončení kurzu a systém ověřování učení
- **🗺️ Průvodce učební cestou**: Jasné vstupní body pro různé úrovně zkušeností a cíle
- **🔗 Navigace s křížovými odkazy**: Jasně propojené související kapitoly a předpoklady

#### Vylepšeno
- **Struktura README**: Proměněno v strukturovanou učební platformu se členěním podle kapitol
- **Navigace dokumentace**: Každá stránka nyní obsahuje kontext kapitoly a vedení učebním postupem
- **Organizace šablon**: Příklady a šablony přiřazeny odpovídajícím kapitolám učení
- **Integrace zdrojů**: Cheat sheety, FAQ a studijní průvodce připojeny k relevantním kapitolám
- **Integrace workshopu**: Praktické laboratoře napojeny na více učebních cílů kapitol

#### Změněno
- **Postup učení**: Přesun z lineární dokumentace na flexibilní učení založené na kapitolách
- **Umístění konfigurace**: Přesun průvodce konfigurací do kapitoly 3 pro lepší tok učení
- **Integrace obsahu AI**: Lepší integrace obsahu specifického pro AI v průběhu učební cesty
- **Produkční obsah**: Pokročilé vzory sloučené v kapitole 8 pro podnikové studenty

#### Vylepšeno
- **Uživatelská zkušenost**: Jasné navigační drobečky a indikátory postupu kapitol
- **Přístupnost**: Konzistentní vzory navigace pro snadnější orientaci v kurzu
- **Profesionální prezentace**: Struktura kurzu ve stylu univerzity vhodná pro akademické a korporátní školení
- **Efektivita učení**: Zkrácený čas nalezení relevantního obsahu díky lepší organizaci

#### Technická implementace
- **Navigační záhlaví**: Standardizovaná navigace kapitol přes více než 40 dokumentačních souborů
- **Navigace v patičce**: Konzistentní vedení postupu a indikátory dokončení kapitol
- **Křížové odkazy**: Komplexní systém vnitřního propojení souvisejících konceptů
- **Mapování kapitol**: Šablony a příklady jasně spojené s učebními cíli

#### Vylepšení studijního průvodce
- **📚 Komplexní učební cíle**: Přepracovaný studijní průvodce v souladu se systémem osmi kapitol
- **🎯 Hodnocení podle kapitol**: Každá kapitola obsahuje specifické učební cíle a praktická cvičení
- **📋 Sledování pokroku**: Týdenní plán učení s měřitelnými výsledky a kontrolními seznamy dokončení
- **❓ Otázky ke zkoušení**: Ověřovací otázky ke každé kapitole s profesionálními výsledky
- **🛠️ Praktická cvičení**: Praktické aktivity s reálnými scénáři nasazení a řešením problémů
- **📊 Pokrok dovedností**: Jasný postup od základních konceptů po podnikové vzory s důrazem na rozvoj kariéry
- **🎓 Certifikační rámec**: Výsledky profesního rozvoje a systém uznání komunity
- **⏱️ Řízení časové osy**: Strukturovaný desetitýdenní plán učení s ověřováním milníků

### [v3.1.0] - 2025-09-17

#### Vylepšená řešení víceagentové AI
**Tato verze zlepšuje víceagentové maloobchodní řešení s lepším pojmenováním agentů a vylepšenou dokumentací.**

#### Změněno
- **Terminologie více agentů**: Nahrazení "Cora agent" za "Customer agent" v maloobchodním víceagentovém řešení pro lepší pochopení
- **Architektura agenta**: Aktualizace veškeré dokumentace, ARM šablon a příkladů kódu s konzistentním pojmenováním "Customer agent"
- **Příklady konfigurace**: Modernizace vzorů konfigurace agentů s aktualizovanými pojmenovacími konvencemi
- **Konzistence dokumentace**: Zajištění, že všechny odkazy používají profesionální a popisná jména agentů

#### Vylepšeno
- **Balíček ARM šablon**: Aktualizace retail-multiagent-arm-template s odkazy na Customer agent
- **Architektonické diagramy**: Obnovené diagramy Mermaid s aktualizovaným pojmenováním agentů
- **Příklady kódu**: Python třídy a implementační příklady nyní používají pojmenování CustomerAgent
- **Proměnné prostředí**: Aktualizace všech skriptů pro nasazení k použití konvencí CUSTOMER_AGENT_NAME

#### Vylepšeno
- **Vývojářská zkušenost**: Jasnější role a odpovědnosti agentů v dokumentaci
- **Připravenost pro produkci**: Lepší sladění s podnikovými pojmenovacími konvencemi
- **Studijní materiály**: Intuitivnější pojmenování agentů pro vzdělávací účely
- **Použitelnost šablon**: Jednodušší porozumění funkcím agentů a vzorům nasazení

#### Technické podrobnosti
- Aktualizované architektonické diagramy Mermaid s odkazy na CustomerAgent
- Nahrazení názvů tříd CoraAgent za CustomerAgent v příkladech Pythonu
- Úprava konfigurací ARM šablon JSON pro použití typu agenta "customer"
- Aktualizace proměnných prostředí z CORA_AGENT_* na CUSTOMER_AGENT_*
- Obnovení všech příkazů pro nasazení a konfigurací kontejnerů

### [v3.0.0] - 2025-09-12

#### Hlavní změny - zaměření na AI vývojáře a integrace Microsoft Foundry
**Tato verze transformuje repozitář na komplexní zdroj učení zaměřený na AI s integrací Microsoft Foundry.**

#### Přidáno
- **🤖 AI-prioritní učební cesta**: Kompletní restrukturalizace s prioritou AI vývojářů a inženýrů
- **Průvodce integrací Microsoft Foundry**: Komplexní dokumentace pro propojení AZD se službami Microsoft Foundry
- **Vzorové nasazení modelů AI**: Podrobný průvodce výběrem, konfigurací a výrobními strategiemi nasazení modelů
- **AI workshop laboratoř**: 2-3 hodinový praktický workshop pro konverzi AI aplikací na řešení nasaditelná pomocí AZD
- **Nejlepší postupy produkční AI**: Vzory připravené pro podnikové škálování, monitorování a zabezpečení AI pracovních zátěží
- **Průvodce řešením problémů specifických pro AI**: Komplexní řešení problémů s Microsoft Foundry modely, Cognitive Services a nasazením AI
- **Galerie AI šablon**: Výběr šablon Microsoft Foundry s hodnocením složitosti
- **Materiály workshopu**: Kompletní struktura workshopu s praktickými laboratořemi a referenčními materiály

#### Vylepšeno
- **Struktura README**: Zaměření na AI vývojáře s 45% zájmem komunity podle dat z Microsoft Foundry Discord
- **Učební cesty**: Vyhrazená cesta pro AI vývojáře vedle tradičních cest pro studenty a DevOps inženýry
- **Doporučené šablony**: Vybrané AI šablony včetně azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrace komunity**: Rozšířená podpora Discord komunity s AI-specifickými kanály a diskuzemi

#### Zaměření na bezpečnost a produkci
- **Vzory Managed Identity**: AI-specifická autentifikace a bezpečnostní konfigurace
- **Optimalizace nákladů**: Sledování používání tokenů a kontrola rozpočtu pro AI pracovní zátěže
- **Nasazení do více regionů**: Strategie globálního nasazení AI aplikací
- **Monitorování výkonu**: AI-specifické metriky a integrace Application Insights

#### Kvalita dokumentace
- **Lineární struktura kurzu**: Logický postup od začátečníků po pokročilé vzory nasazení AI
- **Ověřené URL**: Všechny odkazy na externí repozitáře ověřeny a dostupné
- **Kompletní referenční odkazy**: Ověřené a funkční všechny interní odkazy v dokumentaci
- **Připraveno pro produkci**: Podnikové vzory nasazení s reálnými příklady

### [v2.0.0] - 2025-09-09

#### Hlavní změny - restrukturalizace repozitáře a profesionální zlepšení
**Tato verze představuje významnou úpravu struktury repozitáře a prezentace obsahu.**

#### Přidáno
- **Strukturovaný rámec učení**: Všechny dokumentační stránky nyní obsahují sekce Úvod, Cíle učení a Výsledky učení
- **Navigační systém**: Přidány odkazy Předchozí/Následující lekce napříč celou dokumentací pro vedený postup učení
- **Studijní průvodce**: Komplexní study-guide.md s učebními cíli, praktickými cvičeními a hodnoticími materiály
- **Profesionální prezentace**: Odstraněny všechny emoji pro lepší přístupnost a profesionální vzhled
- **Vylepšená struktura obsahu**: Lepší organizace a tok učebních materiálů

#### Změněno
- **Formát dokumentace**: Standardizováno vše s konzistentní strukturou zaměřenou na učení
- **Tok navigace**: Implementován logický postup všech učebních materiálů
- **Prezentace obsahu**: Odstraněny dekorativní prvky ve prospěch jasného a profesionálního formátování
- **Struktura odkazů**: Aktualizovány všechny interní odkazy pro podporu nového navigačního systému

#### Vylepšeno
- **Přístupnost**: Odstraněny závislosti na emodži pro lepší kompatibilitu s čtečkami obrazovky
- **Profesionální vzhled**: Čistá prezentace ve stylu akademického kurzu vhodná pro podnikové učení
- **Uživatelská zkušenost**: Strukturovaný přístup s jasnými cíli a výsledky pro každou lekci
- **Organizace obsahu**: Lepší logický tok a propojení souvisejících témat

### [v1.0.0] - 2025-09-09

#### První vydání - komplexní učební repozitář AZD

#### Přidáno
- **Základní struktura dokumentace**
  - Kompletní série průvodců pro začátečníky
  - Komplexní dokumentace nasazení a provisioning
  - Podrobné zdroje řešení problémů a průvodce laděním
  - Nástroje a postupy pro ověření před nasazením

- **Modul Začínáme**
  - AZD základy: Základní pojmy a terminologie
  - Průvodce instalací: Instrukce pro specifické platformy
  - Průvodce konfigurací: Nastavení prostředí a autentifikace
  - První projekt: Krok za krokem praktické učení

- **Modul nasazení a provisioning**
  - Průvodce nasazením: Kompletní dokumentace pracovního postupu
  - Průvodce provisioningem: Infrastruktura jako kód pomocí Bicep
  - Nejlepší postupy pro produkční nasazení
  - Vzory více služeb v architektuře

- **Modul ověření před nasazením**
  - Plánování kapacity: Ověření dostupnosti Azure zdrojů
  - Výběr SKU: Podrobný průvodce úrovněmi služeb
  - Předletové kontroly: Automatizované validační skripty (PowerShell a Bash)
  - Nástroje pro odhad nákladů a plánování rozpočtu

- **Modul řešení problémů**
  - Běžné problémy: Často se vyskytující problémy a jejich řešení
  - Průvodce laděním: Systematické postupy řešení problémů
  - Pokročilé diagnostické techniky a nástroje
  - Monitorování výkonu a optimalizace

- **Zdroje a odkazy**
  - Přehled příkazů: Rychlá reference klíčových příkazů
  - Slovník: Kompletní terminologie a definice zkratek
  - Často kladené otázky (FAQ): Podrobné odpovědi na běžné dotazy
  - Odkazy na externí zdroje a komunitní propojení

- **Příklady a šablony**
  - Příklad jednoduché webové aplikace
  - Šablona nasazení statické webové stránky
  - Konfigurace kontejnerové aplikace
  - Vzory integrace databáze
  - Příklady architektury mikroslužeb
  - Implementace serverless funkcí

#### Funkce
- **Podpora více platforem**: Průvodci instalací a konfigurací pro Windows, macOS a Linux
- **Různé úrovně dovedností**: Obsah přizpůsobený od studentů po profesionální vývojáře
- **Praktický přístup**: Praktické příklady a scénáře z reálného světa
- **Komplexní pokrytí**: Od základních konceptů po pokročilé podnikové vzory
- **Přístup zaměřený na bezpečnost**: Nejlepší bezpečnostní praktiky integrovány v celém obsahu
- **Optimalizace nákladů**: Pokyny pro nákladově efektivní nasazení a správu zdrojů

#### Kvalita dokumentace
- **Podrobné příklady kódu**: Praktické, otestované ukázky kódu
- **Návody krok za krokem**: Jasné a proveditelné instrukce
- **Komplexní řešení chyb**: Postupy pro řešení běžných problémů
- **Integrace nejlepších postupů**: Průmyslové standardy a doporučení
- **Kompatibilita verzí**: Aktuální s nejnovějšími službami Azure a funkcemi azd

## Plánovaná budoucí vylepšení

### Verze 3.1.0 (plánováno)
#### Rozšíření AI platformy
- **Podpora více modelů**: Vzory integrace pro Hugging Face, Azure Machine Learning a vlastní modely
- **Rámce AI agentů**: Šablony pro nasazení LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databází mimo Azure AI Search (Pinecone, Weaviate apod.)
- **AI observabilita**: Vylepšené monitorování výkonu modelů, použití tokenů a kvality odpovědí

#### Vývojářská zkušenost
- **Rozšíření VS Code**: Integrované vývojové prostředí AZD + Microsoft Foundry
- **Integrace GitHub Copilot**: AI-poháněná generace AZD šablon
- **Interaktivní tutoriály**: Praktická cvičení kódování s automatickým ověřováním pro AI scénáře
- **Video obsah**: Doplňkové video tutoriály pro vizuální studenty zaměřené na AI nasazení

### Verze 4.0.0 (plánováno)
#### Podnikové AI vzory
- **Rámec správy**: Řízení, shoda a audit AI modelů
- **AI pro více tenantů**: Vzory pro poskytování izolovaných AI služeb více zákazníkům
- **Nasazení edge AI**: Integrace s Azure IoT Edge a kontejnerovými instancemi
- **Hybridní cloud AI**: Vzory nasazení AI pracovních zátěží v multi-cloud a hybridních prostředích

#### Pokročilé funkce
- **Automatizace AI pipeline**: Integrace MLOps s Azure Machine Learning pipelines
- **Pokročilá bezpečnost**: Vzory zero-trust, privátní koncové body a pokročilá ochrana před hrozbami
- **Optimalizace výkonu**: Pokročilé ladění a škálování pro AI aplikace s vysokou propustností
- **Globální distribuce**: Vzory doručování obsahu a cachování na okraji sítě pro AI aplikace

### Verze 3.0.0 (plánováno) - nahrazeno aktuálním vydáním
#### Navrhované přidání - nyní implementováno ve verzi v3.0.0
- ✅ **AI-zaměřený obsah**: Komplexní integrace Microsoft Foundry (dokončeno)
- ✅ **Interaktivní tutoriály**: Praktická AI workshop laboratoř (dokončeno)
- ✅ **Pokročilý bezpečnostní modul**: AI-specifické bezpečnostní vzory (dokončeno)
- ✅ **Optimalizace výkonu**: Strategie ladění AI pracovních zátěží (dokončeno)

### Verze 2.1.0 (plánováno) - částečně implementováno ve verzi v3.0.0
#### Menší vylepšení - některá dokončena v aktuálním vydání
- ✅ **Další příklady**: AI-zaměřené scénáře nasazení (dokončeno)
- ✅ **Rozšířené FAQ**: AI-specifické otázky a řešení problémů (dokončeno)
- **Integrace nástrojů**: Průvodci rozšířením IDE a editorů
- ✅ **Rozšíření monitorování**: AI-specifické vzory monitorování a hlášení (dokončeno)

#### Stále plánováno pro budoucí vydání
- **Mobilní přátelská dokumentace**: Responzivní design pro mobilní učení
- **Offline přístup**: Stahovatelné balíčky dokumentace
- **Zlepšená integrace IDE**: Rozšíření VS Code pro AZD + AI pracovní toky
- **Komunitní dashboard**: Metody sledování metrik komunity a příspěvků v reálném čase

## Přispívání do changelogu

### Hlásit změny
Při přispívání do tohoto repozitáře zajistěte, že záznamy v changelogu obsahují:

1. **Číslo verze**: Podle semantického verzování (hlavní.menší.aktualizace)
2. **Datum**: Datum vydání nebo aktualizace ve formátu RRRR-MM-DD
3. **Kategorie**: Přidáno, Změněno, Zastaralé, Odebráno, Opraveno, Bezpečnost
4. **Jasný popis**: Stručný popis změn
5. **Hodnocení dopadu**: Jak změny ovlivní stávající uživatele

### Kategorie změn

#### Přidáno
- Nové funkce, dokumentační sekce nebo schopnosti
- Nové příklady, šablony nebo učební zdroje
- Další nástroje, skripty nebo utility

#### Změněno
- Úpravy stávajících funkcí nebo dokumentace
- Aktualizace pro lepší srozumitelnost nebo přesnost
- Restrukturalizace obsahu nebo organizace

#### Zastaralé
- Funkce nebo přístupy, které jsou postupně vyřazovány
- Sekce dokumentace plánované k odstranění
- Metody, které mají lepší alternativy

#### Odebráno
- Funkce, dokumentace nebo příklady, které již nejsou relevantní
- Zastaralé informace nebo vyřazené přístupy
- Nadbytečný nebo sloučený obsah

#### Opraveno
- Opravy chyb v dokumentaci nebo kódu
- Řešení hlášených problémů nebo chyb
- Vylepšení přesnosti nebo funkčnosti

#### Bezpečnost
- Zlepšení nebo opravy související s bezpečností
- Aktualizace nejlepších bezpečnostních praktik
- Řešení zranitelností v oblasti bezpečnosti

### Pokyny k semantickému verzování

#### Hlavní verze (X.0.0)
- Zásadní změny vyžadující akci uživatele
- Významná restrukturalizace obsahu nebo organizace
- Změny, které mění základní přístup nebo metodologii

#### Minor verze (X.Y.0)
- Nové funkce nebo doplnění obsahu
- Vylepšení zachovávající zpětnou kompatibilitu
- Další příklady, nástroje nebo zdroje

#### Patch verze (X.Y.Z)
- Opravy chyb a korekce
- Menší vylepšení stávajícího obsahu
- Upřesnění a drobná vylepšení

## Komunitní zpětná vazba a návrhy

Aktivně vyzýváme komunitu, aby poskytovala zpětnou vazbu pro zlepšení tohoto vzdělávacího zdroje:

### Jak poskytnout zpětnou vazbu
- **GitHub Issues**: Hlásit problémy nebo navrhovat vylepšení (včetně otázek specifických pro AI)
- **Discord diskuse**: Sdílet nápady a komunikovat s komunitou Microsoft Foundry
- **Pull Requests**: Přispívat přímými vylepšeními obsahu, zejména AI šablon a průvodců
- **Microsoft Foundry Discord**: Účastnit se kanálu #Azure pro diskuse o AZD + AI
- **Komunitní fóra**: Zapojit se do širších diskusí vývojářů Azure

### Kategorie zpětné vazby
- **Přesnost AI obsahu**: Opravy integrace služeb AI a informací o nasazení
- **Zážitek z učení**: Návrhy na zlepšení toku učení AI vývojářů
- **Chybějící AI obsah**: Žádosti o další AI šablony, vzory nebo příklady
- **Přístupnost**: Vylepšení pro různé potřeby učení
- **Integrace AI nástrojů**: Návrhy na lepší integraci pracovních postupů AI vývoje
- **Produkční AI vzory**: Žádosti o vzory nasazení AI pro podnikovou sféru

### Zavázání k odpovědi
- **Reakce na problémy**: Do 48 hodin na nahlášené problémy
- **Žádosti o funkce**: Vyhodnocení do jednoho týdne
- **Komunitní příspěvky**: Revize do jednoho týdne
- **Bezpečnostní otázky**: Okamžitá priorita s urychlenou reakcí

## Plán údržby

### Pravidelné aktualizace
- **Měsíční kontroly**: Přesnost obsahu a ověřování odkazů
- **Čtvrtletní aktualizace**: Významné doplnění a vylepšení obsahu
- **Půlroční revize**: Komplexní restrukturalizace a vylepšení
- **Roční vydání**: Hlavní verze s významnými vylepšeními

### Monitorování a zajištění kvality
- **Automatické testování**: Pravidelná validace příkladů kódu a odkazů
- **Integrace komunitní zpětné vazby**: Pravidelné zapracování návrhů uživatelů
- **Aktualizace technologií**: Soulad s nejnovějšími službami Azure a verzemi azd
- **Audity přístupnosti**: Pravidelné přezkoumání principů inkluzivního designu

## Politika podpory verzí

### Podpora aktuálních verzí
- **Nejnovější hlavní verze**: Plná podpora s pravidelnými aktualizacemi
- **Předchozí hlavní verze**: Bezpečnostní aktualizace a kritické opravy po 12 měsíců
- **Starší verze**: Pouze komunitní podpora, žádné oficiální aktualizace

### Návody pro migraci
Při vydání hlavních verzí poskytujeme:
- **Migracní průvodce**: Krok za krokem instrukce pro přechod
- **Poznámky k kompatibilitě**: Detaily o zásadních změnách
- **Podpora nástrojů**: Skripty nebo nástroje pomáhající s migrací
- **Komunitní podpora**: Dedikovaná fóra pro otázky ohledně migrace

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](resources/study-guide.md)
- **Další lekce**: Návrat k [Hlavnímu README](README.md)

**Zůstaňte informováni**: Sledujte tento repozitář pro oznámení o nových vydáních a důležitých aktualizacích vzdělávacích materiálů.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
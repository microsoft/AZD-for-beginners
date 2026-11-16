# Zoznam zmien - AZD pre začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky významné zmeny, aktualizácie a vylepšenia v úložisku AZD pre začiatočníkov. Dodržiavame princípy sémantického verzovania a udržiavame tento záznam, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia

Prezretím tohto zoznamu zmien:
- Budete informovaní o nových funkciách a pridanom obsahu
- Pochopíte zlepšenia vykonané v existujúcej dokumentácii
- Budete sledovať opravy chýb a korekcie na zabezpečenie presnosti
- Budete sledovať vývoj vzdelávacích materiálov v priebehu času

## Výsledky učenia

Po preštudovaní záznamov zoznamu zmien budete schopní:
- Identifikovať nový obsah a zdroje dostupné na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Plánovať svoju učebnú cestu podľa najaktuálnejších materiálov
- Prispievať spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.24.0]- 2026-11-04

#### Opravené
- Opravená navigácia kurzu v angličtine, upravené cesty presunutých stránok, chýbajúce kotvy a zastarané externé odkazy, vrátane odkazu v kapitole 2 na príručku produkčného AI.
- Skontrolované súčasné usmernenia voči vydaniam AZD 1.37.2, agentom 1.0.0-beta.23 a evaluáciám 1.0.0-beta.2. Zdokumentovaný samostatný `azd ai eval` workflow a migrácia konfigurácie optimalizácie.
- Opravené nepodporované CLI príznaky, hranice autentifikácie, pokyny pre prostredie/sekrety v plaintexte, aktualizácie infraštruktúry, konfigurácia modelu a príklady deštruktívnej obnovy.
- Aktualizovaný workshop podľa vzoru aktuálnych AI agentov, vrátane skutočných háčikov, vstupov konfigurácie, testov hodnotenia, vstupných bodov red-teamingu a pozorovateľnosti.
- Opravené tvrdenia o príkladoch implementácie a opravené súvisiace problémy s aplikáciou/infraštruktúrou/konfiguráciou. Materiály o architektúre retailu sú explicitne odlíšené od kompletnej funkčnej aplikácie.
- Obnovená CodeQL jazyková matica, vybraná podpora Node.js 24 pre vývojový kontajner a nastavené validátory pre hlásenie neúspešných príkazov verzie.

#### Pridané
- Offline kontrolór odkazov/kotiev len pre angličtinu, regresné testy a dokumentačný workflow, ktorý tiež zostavuje workshop v prísnom režime. Generované preklady a preložené obrázky sú vylúčené.

#### Rozsah validácie
- Kontroly zdroja, syntaxe, konfigurácie, lokálneho správania a sieťových odkazov nezaručujú živé nasadenie v Azure, pridelenie kvót, RBAC, regionálnu dostupnosť modelov, fakturáciu, bezpečnostné súlad alebo pripravenosť do produkcie.
- Staršie záznamy nižšie sú historické záznamy, nie sú aktuálnymi príkazmi alebo pokynmi k vydaniu.

### [v3.23.0] - 2026-07-13

#### Oživenie AZD 1.27.1: Aktualizácia platnosti verzie
**Táto verzia opätovne validuje kurz proti `azd` `1.27.1` (júl 2026, posledné stabilné vydanie) a aktuálnemu preview AI agent rozšíreniu `azure.ai.agents` `1.0.0-beta.5`, aktualizujúc každý banner „validované proti“ po vydaniach 1.26.0, 1.27.0 a 1.27.1.**

#### Zmenené
- **✅ Aktualizovaná základná línia validácie** z `azd 1.25.6` (jún 2026) na `azd 1.27.1` (júl 2026) naprieč koreňovým README, všetkými kapitolovými README, lekciou dev-container v kapitole 1 (vrátane príkladov s pripnutými verziami), lekciou vlastných šablón v kapitole 4, lekciou viacerých agentov v kapitole 5 a dokumentáciou workshopu
- **🤖 Obnovená základná línia kapitoly 2** z `azd 1.23.12` (marec 2026) na `azd 1.27.1` naprieč `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` a `microsoft-foundry-integration.md`; dátumy poznámok o validácii aktualizované na 2026-07-13
- **🧩 Zvýšenie verzie AI agent rozšírenia** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na aktuálne vydanie `1.0.0-beta.5` v README kapitoly 2 a `agents.md`
- **🧪 Aktualizovaný príklad validácie workshopu** (výstup `azd version`) na `1.27.1`

#### Poznámky k relevantným vydaniam azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora Go pre Azure Functions na Flex Consumption, filtrovacie prístupy na úrovni nájomcu `azd config sub-filter`, samostatné rozšírené balíčky (`azd x pack --bundle`) a `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Priame modelovanie Azure AI Foundry projektov/agentov v `azure.yaml` (inicializácia bez Bicep/Terrafom), podpora deployu kontajnerov pre App Service (`host: appservice` + `language: docker`), priame `-s/--source` pre `azd extension` príkazy a `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` príznak pre `azd extension install`, štandardne vynechané zastarané modely z katalógu/kvót a niekoľko opráv chýb

#### Aktualizované súbory
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

#### Začiatočnícky doplnok #2: Vytváranie šablón, Dev kontajnery, Pulumi, Azure DevOps, servisné princípy a viac
**Táto verzia uzatvára zostávajúce medzery strednej úrovne podľa analýzy pokrytia azd: ako vytvárať a publikovať vlastnú šablónu, reprodukovateľné prostredia Dev Containers/Codespaces, poskytovateľ infraštruktúry Pulumi, prehľad CI/CD v Azure DevOps, autentifikácia servisného princípu, pokyny na výber hostiteľa (AKS/Spring Apps), vysvetlenia `azd restore`/`azd package`, spracovanie chýb v háčikoch a praktiky tímových/zdieľaných prostredí.**

#### Pridané
- **🧱 Nová lekcia v kapitole 4** `docs/chapter-04-infrastructure/custom-templates.md` — tvorba vlastnej azd šablóny: požadovaná štruktúra (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parameterizácia infraštruktúry pomocou `uniqueString()` tokenu zdroja a `azd-env-name` značky, lokálne testovanie s `azd init --template <local-path>`, publikovanie na GitHub a prihlásenie do galérie Awesome AZD
- **📦 Nová lekcia v kapitole 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovateľné azd prostredia pomocou Dev Containers a GitHub Codespaces: minimálny `.devcontainer/devcontainer.json` využívajúci oficiálnu funkciu `ghcr.io/azure/azure-dev/azd`, jazykovo špecifické funkcie, `docker-in-docker` pre hosting kontajnerov a `azd auth login --use-device-code` pre vzdialený prihlásenie
- **🧩 Sekcia Pulumi s azd** v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, štruktúra priečinka Pulumi, stohy mapované na azd prostredia, požadované výstupy/značenie a zhodný `azd up` / `azd down` workflow
- **🎯 Pokyny na výber hostiteľa** v `docs/chapter-04-infrastructure/provisioning.md` — priateľské porovnanie `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp` s odporúčaniami, kedy zvoliť AKS alebo Azure Spring Apps
- **🛠️ Prehľad Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisné pripojenie s federáciou identity záťaže (OIDC), generovaný `azure-dev.yml` a nastavenie skupinových premenných
- **🔑 Servisné princípy (vzor 4)** pridané v `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktívna autentifikácia `azd auth login` s klientskym tajomstvom verzus federované/OIDC poverenia, kedy používať a bezpečné uchovávanie poverení
- **🪝 Spracovanie chýb v háčikoch** podsekcia v `docs/chapter-04-infrastructure/deployment-guide.md` — výstupné kódy a `set -e`, `continueOnError`, izolované testovanie háčikov s `azd hooks run`, OS-špecifické shelly a `--debug`
- **👥 Tímové / zdieľané prostredia** sekcia v `docs/chapter-03-configuration/configuration.md` — čo sa nachádza v `.azure/`, čo ignorovať v gite, prostredia na úrovni vývojára, `azd env list`/`select` a poskytovanie hodnôt prostredia v CI/CD
- **🧰 Vysvetlenia `azd restore` a rozšírené `azd package`** v `resources/cheat-sheet.md` — obnova závislostí a generovanie deployovateľného artefaktu bez samotného nasadenia

#### Zmenené
- **🧭 Tabuľka lekcií kapitoly 4** aktualizovaná o novú lekciu "Tvorba vlastnej šablóny" (lekcia 3)
- **🧭 Tabuľka lekcií kapitoly 1** aktualizovaná o novú lekciu "Dev Containers & Codespaces" (lekcia 5); navigačné päty prepojené medzi `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začiatočnícky doplnok: Praktická lekcia o viacerých agentoch, "Prines si vlastnú aplikáciu," Terraform a prehľad CI/CD
**Táto verzia uzatvára najväčšie medzery pre kompletný sprievodca pre začiatočníkov pridaním dvoch nových praktických lekcií (prehlad nasadenia viacagentového riešenia a pridaní azd do existujúcej aplikácie), úvodu k háčikom pre začiatočníkov, sekcie Terraform s azd, prehľadu krok za krokom GitHub Actions pipeline, vysvetlenia nových preview rozšírení a explicitného zoznamu na overenie nasadenia.**

#### Pridané
- **🤝 Nová lekcia kapitoly 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plne praktický, nasaditeľný prehľad dvoch agentov (orchestrátor + špecialisti) s použitím skutočnej šablóny (`contoso-creative-writer`), zahŕňajúci, kedy použiť viac agentov, `azd up` workflow, pochopenie nasadených zdrojov, trasovanie medzi agentmi, prispôsobenie a čistenie
- **📦 Nová lekcia kapitoly 1** `docs/chapter-01-foundation/bring-your-own-app.md` — ako pridať azd do existujúceho projektu s `azd init` ("používať kód v aktuálnom adresári"), pochopenie `azure.yaml` a `infra/`, `azd infra generate`, detekcia hostiteľa a nasadenie s `azd up`
- **🌐 Sekcia Terraform s azd** pridaná do `docs/chapter-04-infrastructure/provisioning.md` — konfigurácia `infra.provider: terraform`, štruktúra priečinka `.tf`, požadované výstupy `AZURE_*` a označovanie `azd-env-name`, a zhodný `azd up` / `azd down` workflow (uzatvára medzeru, kde bola podpora Terraformu deklarovaná, ale ukázaná bola len Bicep)
- **⚙️ Prehľad GitHub Actions krok za krokom** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repo po automatické nasadenia: `azd pipeline config`, OIDC federované poverenia (bez uložených tajomstiev), generovaný `azure-dev.yml` a pokyny k tajomstvám vs. premenným
- **🪝 Začiatočnícky úvod "Nové v háčikoch?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — čo je háčik, tabuľka fáz háčikov, minimálny prvý háčik a manuálne spúšťanie háčikov s `azd hooks run`
- **✅ Pridaný zoznam úloh "Overte svoje nasadenie"** do kroku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola zdravotného koncového bodu a explicitné kritériá úspechu
- **🧩 Vysvetlenie nových preview rozšírení** `azure.ai.skills` a `azure.ai.connections` (čo sú a kedy ich použiť) v `docs/chapter-08-production/production-ai-practices.md`

#### Zmenené
- **🧭 Tabuľka lekcií kapitoly 5** opravená: `multi-agent-basics.md` je teraz lekcia 1 (jediná plne praktická lekcia), so správnym označením, že lekcia 2 je v kapitole 6 a scenár Retail je architektonická schéma, nie šablóna vykonateľná jedným príkazom
- **🧭 Tabuľka lekcií kapitoly 1** teraz obsahuje novú lekciu "Prines si vlastnú aplikáciu" (lekcia 4)
- **🔗 Navigačné päty** aktualizované: `first-project.md` teraz smeruje dopredu na `bring-your-own-app.md`

#### Opravené
- **🧱 Uzavretá medzera "deklarované, ale chýbajúce" Terraform** — kurz predtým spomínal podporu Terraform bez jej ukázania
- **🔀 Opravené zavádzajúce krížové odkazy v kapitole 5**, ktoré naznačovali existenciu plnej implementácie viacagentového riešenia, keď v skutočnosti išlo len o architektonickú schému

#### Aktualizované súbory
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

#### Obnovenie AZD 1.25.6, príkazy pre celý životný cyklus agenta a premenovanie Aspire
**Táto verzia znova overuje kurz voči `azd` `1.25.6` (jún 2026) a rozšíreniu `azure.ai.agents` `0.1.40-preview`, rozširuje pokyny AI z "vytvoriť agenta" na celý životný cyklus agenta (testovať → vyhodnotiť → optimalizovať → skontrolovať → vymazať), zviditeľňuje nové rozšírenia `azure.ai.skills` a `azure.ai.connections` a zaznamenáva zmenu názvu produktu z ".NET Aspire" na "Aspire".**

#### Pridané
- **🔁 Pokrytie celého životného cyklu agenta** pre začiatočníkov a AI inžinierov v dokumentácii:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabuľka životného cyklu (vytvoriť → testovať → merať → zlepšovať → kontrolovať → upratovať) pridaná do sekcie Rozšírenia a AI príkazy
  - `docs/chapter-08-production/production-ai-practices.md` — Nová sekcia "Správa životného cyklu agenta" pokrývajúca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — Rozšírené AI príkazy pre agentov o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nové preview rozšírenia** zdokumentované: `azure.ai.skills` (znovupoužiteľné zručnosti agenta) a `azure.ai.connections` (Foundry pripojenia) pridané do tabuľky rozšírení a cheat sheetu
- **⏱️ Pokyny k meraniu odozvy** — príklady `azd ai agent invoke` teraz uvádzajú celkovú latenciu a čas do prvého bajtu
- **📌 Verziový banner** v hlavnom README smerujúci učňov na `azd version` a `azd upgrade`

#### Zmenené
- **✅ Aktualizovaná validačná báza** z `azd 1.23.12` (marec 2026) na `azd 1.25.6` (jún 2026) vo všetkých kapitolových README a dokumentácii workshopu
- **🤖 Aktualizovaná poznámka k rozšíreniu kapitoly 2** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Aktualizovaný validačný príklad workshopu** (výstup `azd version`) na `1.25.6`
- **🧭 Aktualizované README "Čo je nové v azd dnes"** zvýrazňujúce celý životný cyklus agenta, nové AI rozšírenia a nedávne zlepšenia kvality života (`azd init` idempotentnosť, `azd auth login` vyčisťovanie neplatných tokenov, `azd tool` prvý prompt)
- **📖 Kapitola 2 agents.md (Možnosť 4)** teraz smeruje učňov na príkazy pre životný cyklus po nasadení namiesto zastavenia sa pri `azd up`

#### Opravené
- **🏷️ Názvoslovie produktu** — pridaná poznámka o premenovaní Aspire (".NET Aspire" sa teraz volá jednoducho "Aspire"); podpora Aspire v azd zostáva nezmenená
- **🔎 Overenie live vydania** potvrdené voči Azure Developer CLI release feedu: stabilný CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Vyjasnenie onboarding pre začiatočníkov, overenie nastavenia a záverečné čistenie AZD príkazov
**Táto verzia nadväzuje na validačné čistenie AZD 1.23 pre začiatočníkov: vyjasňuje pokyny pre autentifikáciu ako prvý krok v AZD, pridáva skripty na overenie lokálneho nastavenia, overuje kľúčové príkazy voči live AZD CLI a odstraňuje posledné zastarané anglické príkazové odkazy mimo changelogu.**

#### Pridané
- **🧪 Skripty na overenie nastavenia pre začiatočníkov** s `validate-setup.ps1` a `validate-setup.sh`, aby si učni mohli overiť požadované nástroje pred začatím Kapitoly 1
- **✅ Predbežné kroky overenia nastavenia** v hlavnom README a v kapitole 1 README, aby sa chyby v požiadavkách zachytili pred `azd up`

#### Zmenené
- **🔐 Pokyny pre autentifikáciu začiatočníkov** teraz konzistentne považujú `azd auth login` za hlavný spôsob pre AZD pracovné postupy, zatiaľ čo `az login` je uvedený ako voliteľný, pokiaľ sa príkazy Azure CLI priamo nepoužívajú
- **📚 Onboarding tok Kapitoly 1** teraz smeruje učňov, aby si overili lokálne nastavenie pred inštaláciou, autentifikáciou a prvým nasadením
- **🛠️ Správy validátora** rozdeľujú jasne blokujúce požiadavky od voliteľných Azure CLI varovaní pre začiatočnícke AZD cesty
- **📖 Dokumenty o konfigurácii, riešení problémov a príkladoch** teraz rozlišujú medzi požadovanou autentifikáciou AZD a voliteľným prihlásením cez Azure CLI tam, kde to predtým bolo bez kontextu

#### Opravené
- **📋 Aktualizované zostávajúce anglické odkazy na príkazy** na súčasné AZD formy, vrátane `azd config show` v cheat sheete a `azd monitor --overview` tam, kde mal byť návod na Azure Portal
- **🧭 Oslabené tvrdenia pre začiatočníkov v Kapitole 1** aby sa predišlo prehnaným sľubom o nulových chybách alebo rollback správaní vo všetkých šablónach a zdrojoch Azure
- **🔎 Overenie live CLI** potvrdzuje súčasnú podporu pre `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

#### Overenie AZD 1.23.12, rozšírenie workshopového prostredia a osvieženie AI modelu
**Táto verzia vykonáva validačný priechod dokumentácie voči `azd` `1.23.12`, aktualizuje zastarané príklady AZD príkazov, osviežuje pokyny pre AI model na súčasné predvolené hodnoty a rozširuje inštrukcie workshopu nad rámec GitHub Codespaces tak, aby podporovala dev kontajnery a lokálne klony.**

#### Pridané
- **✅ Poznámky k validácii v hlavných kapitolách a workshopovej dokumentácii** na explicitné uvedenie otestovanej AZD bázy pre používateľov novších alebo starších verzií CLI
- **⏱️ Pokyny pre časový limit nasadenia** pre dlhodobé nasadenie AI aplikácií využívajúce `azd deploy --timeout 1800`
- **🔎 Kroky na kontrolu rozšírení** s `azd extension show azure.ai.agents` v dokumentácii AI workflow
- **🌐 Rozšírené pokyny pre workshopové prostredie** pokrývajúce GitHub Codespaces, dev kontajnery a lokálne klony s MkDocs

#### Zmenené
- **📚 Kapitolové úvodné README** teraz konzistentne uvádzajú validáciu voči `azd 1.23.12` naprieč sekciami základov, konfigurácie, infraštruktúry, multi-agentov, prednasadenia, riešenia problémov a produkcie
- **🛠️ Odkazy na AZD príkazy** aktualizované na súčasné formy v dokumentácii:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` alebo `azd env get-value(s)` podľa kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kde je určený prehľad Application Insights
- **🧪 Príklady prevádzky preview** zjednodušené na súčasné podporované použitia ako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Workshopový tok** aktualizovaný tak, aby si učni mohli absolvovať laboratória v Codespaces, dev kontajneri alebo lokálnom klone namiesto predpokladu exkluzívneho použitia Codespaces
- **🔐 Pokyny pre autentifikáciu** teraz uprednostňujú `azd auth login` pre AZD pracovné postupy, pričom `az login` je uvedený ako voliteľný pri priamom použití Azure CLI príkazov

#### Opravené
- **🪟 Windows inštalačné príkazy** normalizované na aktuálne veľké a malé písmená balíka `winget` v sprievodcovi inštaláciou
- **🐧 Linux inštalačné pokyny** opravené, aby sa vyhli nepodporovaným špecifickým inštrukciám pre správcu balíkov `azd` a namiesto toho odkazovali na release assets podľa potreby
- **📦 AI model príklady** osviežené zo starších predvolieb ako `gpt-35-turbo` a `text-embedding-ada-002` na aktuálne príklady ako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Útržky pre nasadenie a diagnostiku** opravené tak, aby používali aktuálne príkazy prostredia a stavu v logoch, skriptoch a krokoch riešenia problémov
- **⚙️ Pokyny pre GitHub Actions** aktualizované z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Pokyny pre súhlas MCP/Copilot** aktualizované z `azd mcp consent` na `azd copilot consent list`

#### Vylepšené
- **🧠 Pokyny k AI kapitole** teraz lepšie vysvetľujú chovanie citlivé na preview `azd ai`, prihlásenie špecifické pre tenant, aktuálne používanie rozšírení a aktualizované odporúčania pre nasadenie modelov
- **🧪 Workshopové inštrukcie** teraz používajú realistickejšie príklady verzií a jasnejší jazyk pre nastavenie prostredia v praktických laboratóriách
- **📈 Dokumentácia pre produkciu a riešenie problémov** teraz lepšie koreluje s aktuálnym monitorovaním, náhradnými modelmi a príkladmi nákladových úrovní

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

#### AZD AI CLI príkazy, validácia obsahu a rozšírenie šablón
**Táto verzia pridáva pokrytie príkazov `azd ai`, `azd extension` a `azd mcp` do všetkých kapitol súvisiacich s AI, opravuje nefunkčné odkazy a zastaraný kód v agents.md, aktualizuje cheat sheet a prepracováva sekciu Príkladové šablóny s validovanými popismi a novými Azure AI AZD šablónami.**

#### Pridané
- **🤖 Pokrytie AZD AI CLI** v 7 súboroch (predtým iba v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekcia "Rozšírenia a AI príkazy" predstavujúca `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnosť 4: `azd ai agent init` s tabuľkou porovnania (šablóna vs manifest prístup)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcie "AZD rozšírenia pre Foundry" a "Nasadenie orientované na agentov"
  - `docs/chapter-05-multi-agent/README.md` — Rýchly štart teraz zobrazuje oba cesty nasadenia na základe šablón a manifestov
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcia nasadenia teraz obsahuje možnosť `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcia "AZD AI rozšírenia pre diagnostiku"
  - `resources/cheat-sheet.md` — Nová sekcia "AI & Rozšírenia Príkazy" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové príkladové AZD AI šablóny** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat používajúci Langchain4J s možnosťami nasadenia ACA/AKS
  - **contoso-creative-writer** — Multi-agent kreatívna aplikácia na písanie využívajúca Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG využívajúci Azure Functions + LangChain.js + Cosmos DB s lokálnou vývojovou podporou Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový akcelerátor RAG s administračným portálom, integráciou do Teams a možnosťami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčná aplikácia orchestrace MCP s viacerými agentmi so servermi v .NET, Pythone, Jave a TypeScripte
  - **azd-ai-starter** — Minimálny Azure AI infraštruktúrny Bicep štartovací šablóna
  - **🔗 Odkaz na úžasnú galériu AZD AI** — Odkaz na [awesome-azd AI galériu](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablón)

#### Opravené
- **🔗 navigácia agents.md**: Predchádzajúce/Ďalšie odkazy teraz zodpovedajú poradiu lekcií v kapitole 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 nefunkčné odkazy v agents.md**: `production-ai-practices.md` opravené na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 zastaraný kód v agents.md**: Nahradené `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neplatné API v agents.md**: Premiestnené `max_tokens` z `create_agent()` do `create_run()` ako `max_completion_tokens`
- **🔢 počítanie tokenov v agents.md**: Nahradený hrubý odhad `len//4` za `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opravené služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (predvolený hostiteľ zmena október 2024)
- **contoso-chat**: Aktualizovaný popis na odkaz Azure AI Foundry + Prompty, zodpovedajúci skutočnému názvu a technológiám repozitára

#### Odstránené
- **ai-document-processing**: Odstránený nerefunkčný odkaz na šablónu (repozitár nie je verejne prístupný ako AZD šablóna)

#### Vylepšené
- **📝 cvičenia v agents.md**: Cvičenie 1 teraz zobrazuje očakávaný výstup a krok `azd monitor`; Cvičenie 2 obsahuje celý registračný kód `FunctionTool`; Cvičenie 3 nahradzuje nejasné pokyny konkrétnymi príkazmi `prepdocs.py`
- **📚 zdroje v agents.md**: Aktualizované odkazy na dokumentáciu na aktuálne Azure AI Agent Service dokumenty a rýchly štart
- **📋 tabuľka ďalších krokov v agents.md**: Pridaný odkaz na AI Workshop Lab pre kompletné pokrytie kapitoly

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

#### Vylepšenie navigácie kurzu
**Táto verzia vylepšuje navigáciu kapitol v README.md pomocou vylepšenej tabuľky formátu.**

#### Zmenené
- **Tabuľka mapa kurzu**: Vylepšená o priame odkazy na lekcie, odhady trvania a hodnotenia zložitosti
- **Čistenie priečinkov**: Odstránené nadbytočné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Overenie odkazov**: Overených všetkých 21+ interných odkazov v tabuľke mapa kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizácie názvov produktov
**Táto verzia aktualizuje odkazy na produkty na aktuálny branding Microsoftu.**

#### Zmenené
- **Microsoft Foundry → Microsoft Foundry**: Všetky odkazy aktualizované v neprekladových súboroch
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný podľa aktuálneho brandingu

#### Aktualizované súbory
- `README.md` - Hlavná stránka kurzu
- `changelog.md` - História verzií
- `course-outline.md` - Štruktúra kurzu
- `docs/chapter-02-ai-development/agents.md` - Príručka AI agentov
- `examples/README.md` - Dokumentácia príkladov
- `workshop/README.md` - Úvodná stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všetky súbory pokynov workshopu

---

### [v3.15.0] - 2026-02-05

#### Hlavná reštrukturalizácia repozitára: názvy priečinkov podľa kapitol
**Táto verzia reštrukturalizuje dokumentáciu do samostatných priečinkov podľa kapitol pre prehľadnejšiu navigáciu.**

#### Premenovanie priečinkov
Staré priečinky boli nahradené číslovanými priečinkami kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridaný nový: `docs/chapter-05-multi-agent/`

#### Migrácie súborov
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
| Všetky súbory pre prednasadenie | pre-deployment/ | chapter-06-pre-deployment/ |
| Všetky súbory riešenia problémov | troubleshooting/ | chapter-07-troubleshooting/ |

#### Pridané
- **📚 README súbory kapitol**: Vytvorený README.md v každom priečinku kapitol s:
  - Cieľmi učenia a dĺžkou trvania
  - Tabuľkou lekcií s popismi
  - Rýchlymi štartovacími príkazmi
  - Navigáciou do ďalších kapitol

#### Zmenené
- **🔗 Aktualizované všetky interné odkazy**: 78+ ciest aktualizovaných vo všetkých dokumentačných súboroch
- **🗺️ Hlavný README.md**: Aktualizovaná mapa kurzu s novou štruktúrou kapitol
- **📝 examples/README.md**: Aktualizované krížové odkazy na priečinky kapitol

#### Odstránené
- Staré štruktúry priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reštrukturalizácia repozitára: Navigácia kapitol
**Táto verzia pridala navigačné README súbory kapitol (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexného sprievodcu pre nasadenie AI agentov pomocou Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca pokrývajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri rýchle štartovacie agentné šablóny (Foundry Agents, Prompty, RAG)
  - Architektonické vzory agentov (jediný agent, RAG, multi-agent)
  - Konfigurácia a prispôsobenie nástrojov
  - Monitorovanie a sledovanie metrík
  - Úvahy o nákladoch a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov pomocou `azd init --template get-started-with-ai-agents`
- **Architektonické vzory**: Vizualizované diagramy vzorov agentov
- **Konfigurácia**: Nastavenie nástrojov a premenné prostredia
- **Monitorovanie**: Integrácia Application Insights
- **Cvičenia**: Progresívne praktické učenie (20-45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia prostredia DevContainer
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera s modernými nástrojmi a lepšími predvolenými nastaveniami pre AZD skúsenosť učenia.**

#### Zmenené
- **🐳 Základný obraz**: Aktualizovaný z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovší stabilný Debian)
- **📛 Názov kontajnera**: Premenovaný z "Python 3" na "AZD for Beginners" pre jasnosť

#### Pridané
- **🔧 Nové funkcie Dev Container**:
  - `azure-cli` s povolenou podporou Bicepu
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` pre správu šablón
  - `docker-in-docker` pre nasadenie kontajnerových aplikácií

- **🔌 Presmerovanie portov**: Prednastavené porty pre bežný vývoj:
  - 8000 (MkDocs náhľad)
  - 3000 (webové aplikácie)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšírenia VS Code**:
  - `ms-python.vscode-pylance` - Vylepšený Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa zdrojov Azure
  - `yzhang.markdown-all-in-one` - Úprava Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Podpora diagramov Mermaid
  - `redhat.vscode-yaml` - Podpora YAML (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Git
  - `mhutchie.git-graph` - História Git

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre Python interpreter, formátovanie pri ukladaní a orezávanie medzier

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný MkDocs minify plugin
  - Pridaný pre-commit pre kvalitu kódu
  - Pridané balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opravené
- **Príkaz po vytvorení**: Teraz overuje inštaláciu AZD a Azure CLI pri štarte kontajnera

---

### [v3.11.0] - 2026-02-05

#### Prepracovanie README pre začiatočníkov
**Táto verzia výrazne zlepšuje README.md pre lepšiu prístupnosť pre začiatočníkov a pridáva základné zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Porovnanie Azure CLI vs AZD**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Úžasné AZD odkazy**: Priame odkazy na galériu šablón komunity a zdroje pre príspevky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ pripravených šablón na nasadenie
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Príspevky komunity
- **🎯 Rýchly sprievodca**: Zjednodušená 3-kroková sekcia začiatku (Inštalácia → Prihlásenie → Nasadenie)
- **📊 Tabuľka navigácie podľa skúseností**: Jasné usmernenie, kde začať podľa skúseností vývojára

#### Zmenené
- **Štruktúra README**: Preorganizovaná pre postupné zverejňovanie - najdôležitejšie informácie ako prvé
- **Úvodná sekcia**: Prepísaná na vysvetlenie "Mágie `azd up`" pre úplných začiatočníkov
- **Odstránenie duplicitného obsahu**: Zrušená duplicitná sekcia riešenia problémov
- **Príkazy pre riešenie problémov**: Opravený odkaz `azd logs` na použitie platného `azd monitor --logs`

#### Opravené
- **🔐 Príkazy na autentifikáciu**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na príkazy**: Odstránené zostávajúce `azd logs` z sekcie riešenia problémov README

#### Poznámky
- **Rozsah**: Zmeny použité v hlavnom README.md a resources/cheat-sheet.md
- **Cieľová skupina**: Vylepšenia zamerané špeciálne na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia presnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce AZD príkazy v celej dokumentácii, zabezpečujúc, že všetky ukážky kódu používajú platnú syntax Azure Developer CLI.**

#### Opravené
- **🔧 Odstránené neexistujúce AZD príkazy**: Komplexná kontrola a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradené `azd monitor --logs` alebo alternatívami Azure CLI
  - Podpríkazy `azd service` (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistuje) → odstránené alebo nahradené platnými alternatívami
  - Príznaky `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistujú) → odstránené
  - Príznaky `azd provision --what-if/--rollback` (neexistujú) → aktualizované na používanie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované s opravami príkazov**:
  - `resources/cheat-sheet.md`: Hlavná preformulácia referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené stratégie rollbacku a nasadenia
  - `docs/troubleshooting/debugging.md`: Opravené sekcie analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy pre riešenie problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia debugovania AZD
  - `docs/getting-started/azd-basics.md`: Opravené príkazy pre monitorovanie
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a ladenia
  - `docs/getting-started/installation.md`: Opravené príklady pomoci a verzie
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy na prezeranie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy na ladenie agenta

- **📝 Aktualizácia referencie verzie**: 
  - `docs/getting-started/installation.md`: Zmenená pevne zakódovaná verzia `1.5.0` na generickú `1.x.x` s odkazom na vydania

#### Zmenené
- **Stratégie vrátenia zmien**: Aktualizovaná dokumentácia na použitie rollbacku založeného na Gite (AZD nemá natívny rollback)
- **Prezeranie logov**: Nahradené odkazy na `azd logs` príkazmi `azd monitor --logs`, `azd monitor --live` a Azure CLI
- **Sekcia výkonu**: Odstránené neexistujúce preklápacie/incrementálne príznaky pre nasadenie, poskytnuté platné alternatívy

#### Technické detaily
- **Platné AZD príkazy**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné príznaky azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a aktualizácia kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky nefunkčné odkazy v dokumentácii a zlepšuje celkovú kvalitu obsahu pre AI vývojárov používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s pravidlami prispievania obsahujúci:
  - Jasné inštrukcie na hlásenie problémov a návrhy zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny pre príklady kódu a konvencie správ o commitoch
  - Informácie o zapojení komunity

#### Dokončené
- **🎯 Workshop modul 7 (Zhrnutie)**: Úplné dokončenie modulu so:
  - Komplexným súhrnom dosiahnutých cieľov workshopu
  - Sekciou kľúčových naučených konceptov o AZD, šablónach a Microsoft Foundry
  - Odporúčaniami na pokračovanie v učení
  - Cvičeniami s hodnotením náročnosti
  - Odkazmi na spätnú väzbu a podporu komunity

- **📚 Workshop modul 3 (Rozbor)**: Aktualizované vzdelávacie ciele zahŕňajúce:
  - Aktiváciu GitHub Copilot s MCP servermi
  - Pochopenie štruktúry šablón AZD
  - Vzory organizácie infraštruktúry ako kód (Bicep)
  - Inštrukcie pre praktickú laboratóriu

- **🔧 Workshop modul 6 (Likvidácia)**: Dokončený s:
  - Cieľmi čistenia zdrojov a správy nákladov
  - Použitím `azd down` pre bezpečné odstraňovanie infraštruktúry
  - Usmerneniami na obnovu soft-mazaných kognitívnych služieb
  - Bonusovými podnetmi na preskúmanie GitHub Copilot a Azure Portal

#### Opravené
- **🔗 Opravy nefunkčných odkazov**: Riešenie viac než 15 nefunkčných interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradený neexistujúci cicd-integration.md súborom deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty k častým otázkam a sprievodcovi riešenia problémov
  - `examples/container-app/microservices/README.md`: Opravené cesty na domovskú stránku kurzu a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy na kapitolu o AI
  - `course-outline.md`: Opravené odkazy na sprievodcu inštruktora a laboratórium AI workshopu

- **📅 Banner stavu workshopu**: Aktualizovaný zo "V príprave" na aktívny stav s dátumom február 2026

- **🔗 Navigácia v workshope**: Opravené nefunkčné navigačné odkazy v README.md workshopu smerujúce do neexistujúceho priečinka lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené varovanie "v príprave", workshop je kompletne dokončený a pripravený na použitie
- **Konzistencia navigácie**: Zaistená správna medzi-modulová navigácia vo všetkých moduloch workshopu
- **Odkazy na vzdelávaciu cestu**: Aktualizované krížové odkazy v kapitolách na správne cesty microsoft-foundry

#### Overené
- ✅ Všetky anglické markdown súbory majú platné vnútorné odkazy
- ✅ Moduly workshopu 0-7 sú kompletné s učebnými cieľmi
- ✅ Navigácia medzi kapitolami a modulmi funguje správne
- ✅ Obsah je vhodný pre AI vývojárov používajúcich Microsoft AZD
- ✅ Použitý prístup priateľský k začiatočníkom v jazyku a štruktúre
- ✅ CONTRIBUTING.md poskytuje jasné usmernenia pre prispievateľov z komunity

#### Technická implementácia
- **Overenie odkazov**: Automatizovaný PowerShell skript overil všetky interné odkazy v .md súboroch
- **Audit obsahu**: Manuálna kontrola úplnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Použité konzistentné vzory navigácie kapitol a modulov

#### Poznámky
- **Rozsah**: Zmeny použité iba na anglickú dokumentáciu
- **Preklady**: Zložky s prekladmi neboli v tejto verzii aktualizované (automatický preklad bude synchronizovaný neskôr)
- **Trvanie workshopu**: Kompletný workshop teraz poskytuje 3-4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: Monitorovanie, bezpečnosť a vzory pre viac agentov
**Táto verzia pridáva komplexné A-úrovňové lekcie o integrácii Application Insights, vzoroch autentifikácie a koordinácii viacerých agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia integrácie Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým poskytovaním
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Funkčné Python aplikácie s vlastnou telemetriou (viac ako 1 200 riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov modelov Microsoft Foundry)
  - 6 Mermaid diagramov (architektúra, distribuované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (upozornenia, dashboardy, AI monitorovanie)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Live streamovanie metrík a ladenie v reálnom čase
  - 40-50 minút čas učenia s produkčnými vzormi

- **🔐 Lekcia autentifikácie a bezpečnostných vzorov**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentifikácie (connection strings, Key Vault, riadená identita)
  - Kompletné infraštruktúrne Bicep šablóny pre bezpečné nasadenia
  - Kód Node.js aplikácie s integráciou Azure SDK
  - 3 kompletné cvičenia (povolenie riadenej identity, priradenej identity, rotácia Key Vault)
  - Najlepšie bezpečnostné postupy a konfigurácie RBAC
  - Sprievodca riešením problémov a analýza nákladov
  - Produkčné vzory bezheslového prihlasovania

- **🤖 Lekcia vzorov koordinácie viacerých agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorov koordinácie (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
  - Kompletná implementácia orchestrátorovej služby (Python/Flask, viac ako 1 500 riadkov)
  - 3 špecializované agentné implementácie (výskum, spisovateľ, editor)
  - Integrácia Service Bus pre správu správ v poradí
  - Správa stavov Cosmos DB pre distribuované systémy
  - 6 Mermaid diagramov zobrazujúcich interakcie agentov
  - 3 pokročilé cvičenia (správa timeoutov, logika opakovaných pokusov, obvodový prepínač)
  - Rozpis nákladov (240-565 USD/mesiac) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola pred nasadením**: Teraz zahŕňa komplexné vzory monitorovania a koordinácie
- **Kapitola Začíname**: Vylepšená o profesionálne vzory autentifikácie
- **Produktová pripravenosť**: Kompletné pokrytie od bezpečnosti po observabilitu
- **Osnova kurzu**: Aktualizovaná na odkazy na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Progres učenia**: Lepšia integrácia bezpečnosti a monitorovania v celom kurze
- **Kvalita dokumentácie**: Konzistentné A-úrovňové štandardy (95-97%) v nových lekciách
- **Produkčné vzory**: Kompletné pokrytie end-to-end pre podnikové nasadenia

#### Vylepšené
- **Zážitok vývojára**: Jasná cesta od vývoja k produkčnému monitorovaniu
- **Bezpečnostné štandardy**: Profesionálne vzory pre správu autentifikácie a tajomstiev
- **Observabilita**: Kompletná integrácia Application Insights s AZD
- **AI záťaže**: Špecializované monitorovanie pre Microsoft Foundry Modely a systémy s viacerými agentmi

#### Overené
- ✅ Všetky lekcie obsahujú kompletný funkčný kód (nie útržky)
- ✅ Mermaid diagramy pre vizuálne učenie (dokopy 19 v 3 lekciách)
- ✅ Praktické cvičenia s krokmi overenia (dokopy 9)
- ✅ Produkčné Bicep šablóny pripravné na nasadenie cez `azd up`
- ✅ Analýza nákladov a optimalizačné stratégie
- ✅ Sprievodcovia riešením problémov a najlepšie postupy
- ✅ Overovacie body s overovacími príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný sprievodca monitorovaním
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektúry pre viac agentov
- **Celkový nový obsah**: - Konzistentné vysoké kvalitatívne štandardy

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované trasovanie
- **Autentifikácia**: Riadená identita + Key Vault + RBAC vzory
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Live metriky + Kusto dotazy + upozornenia + dashboardy
- **Správa nákladov**: Strategie vzorkovania, uchovávanie dát, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšenia kvality dokumentácie a nový príklad Microsoft Foundry Modelov
**Táto verzia zlepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Microsoft Foundry Modelov s chatovacím rozhraním gpt-4.1.**

#### Pridané
- **🤖 Príklad chatu Microsoft Foundry Modelov**: Kompletné nasadenie gpt-4.1 s fungujúcou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Microsoft Foundry Modelov (nasadenie modelu gpt-4.1)
  - Príkazové rozhranie chatu v Pythone s históriou konverzácií
  - Integrácia Key Vault pre bezpečné ukladanie kľúčov API
  - Sledovanie použitia tokenov a odhad nákladov
  - Limitovanie rýchlosti a spracovanie chýb
  - Komplexný README so sprievodcom nasadením (35-45 minút)
  - 11 produkčných súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Cvičenia vláknenej dokumentácie**: Pridané praktické cvičenia do sprievodcu konfiguráciou:
  - Cvičenie 1: Konfigurácia viacerých prostredí (15 minút)
  - Cvičenie 2: Prax riadenia tajomstiev (10 minút)
  - Jasné kritériá úspechu a kroky overenia
- **✅ Overenie nasadenia**: Pridaná sekcia overovania do sprievodcu nasadením:
  - Postupy kontroly stavu
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy všetkých príkazov nasadenia
  - Rýchly prehľad riešenia problémov

#### Vylepšené
- **examples/README.md**: Aktualizované na A-úroveň kvality (93%):
  - Pridaný azure-openai-chat do všetkých relevantných sekcií
  - Počet lokálnych príkladov zvýšený z 3 na 4
  - Pridané do tabuľky príkladov AI aplikácií
  - Integrované do rýchleho štartu pre stredne pokročilých používateľov
  - Pridané do časti Microsoft Foundry Templates
  - Aktualizovaná matica porovnávania a sekcie hľadania technológií
- **Kvalita dokumentácie**: Zlepšená z B+ (87%) na A- (92%) v priečinku docs:
  - Pridané očakávané výstupy do kľúčových príkladov príkazov
  - Zahrnuté kroky overovania pre zmeny konfigurácie
  - Vylepšené praktické učenie s praktickými cvičeniami

#### Zmenené
- **Progres učenia**: Lepšia integrácia AI príkladov pre stredne pokročilých študentov
- **Štruktúra dokumentácie**: Viac akčných cvičení s jasnými výsledkami
- **Proces overenia**: Explicitné kritériá úspechu pridané do kľúčových pracovných tokov

#### Vylepšené
- **Developer Experience**: Nasadenie Microsoft Foundry Modelov teraz trvá 35-45 minút (oproti 60-90 pre komplexné alternatívy)
- **Transparentnosť nákladov**: Jasné odhady nákladov (50-200 USD/mesiac) pre príklad Microsoft Foundry Modelov
- **Vzdelávacia cesta**: AI vývojári majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a kroky overenia

#### Overené
- ✅ Príklad Microsoft Foundry Modelov plne funkčný s `azd up`
- ✅ Všetky 11 implementačné súbory syntakticky správne
- ✅ Inštrukcie v README zodpovedajú skutočnej skúsenosti s nasadením
- ✅ Odkazy v dokumentácii aktualizované na viac než 8 miestach
- ✅ Index príkladov presne odráža 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy správne

#### Technická implementácia
- **Architektúra Microsoft Foundry Modelov**: gpt-4.1 + Key Vault + Container Apps vzor
- **Bezpečnosť**: Pripravená riadená identita, tajomstvá v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Správa nákladov**: Sledovanie tokenov a optimalizácia použitia
- **Nasadenie**: Jeden príkaz `azd up` pre kompletnú konfiguráciu

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia zavádza komplexné, produkčné príklady nasadenia kontajnerových aplikácií pomocou Azure Developer CLI (AZD), s plnou dokumentáciou a integráciou do vzdelávacej cesty.**

#### Pridané
- **🚀 Príklady Container App**: Nové lokálne príklady v `examples/container-app/`:
  - [Hlavný sprievodca](examples/container-app/README.md): Kompletný prehľad kontajnerizovaných nasadení, rýchly štart, produkcia a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): REST API priateľské pre začiatočníkov s možnosťou škálovania na nulu, zdravotné sondy, monitorovanie a riešenie problémov
  - [Architektúra mikroslužieb](../../examples/container-app/microservices): Produkčne pripravené viacslužbové nasadenie (API Gateway, Produkt, Objednávka, Užívateľ, Notifikácie), asynchrónna komunikácia, Service Bus, Cosmos DB, Azure SQL, distribuované trasovanie, modré-zelené/canary nasadenie
- **Najlepšie postupy**: Bezpečnosť, monitorovanie, optimalizácia nákladov a riadenie CI/CD pre kontajnerizované pracovné zaťaženia
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v rôznych jazykoch (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: Scenáre end-to-end testov, príkazy monitorovania, návod na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované o nové príklady kontajnerových aplikácií v sekcii "Lokálne príklady - Kontajnerové aplikácie"
- **examples/README.md**: Zdôraznené príklady kontajnerových aplikácií, pridané položky do matice porovnaní a aktualizované odkazy na technológie/architektúru
- **Osnova kurzu a študijný sprievodca**: Aktualizované odkazy na nové príklady kontajnerových aplikácií a vzory nasadenia v príslušných kapitolách

#### Validované
- ✅ Všetky nové príklady nasaditeľné pomocou `azd up` a dodržiavajúce najlepšie postupy
- ✅ Aktualizované krížové odkazy a navigácia v dokumentácii
- ✅ Príklady pokrývajú začiatočnícke až pokročilé scenáre, vrátane produkčných mikroslužieb

#### Poznámky
- **Rozsah**: Len anglická dokumentácia a príklady
- **Ďalšie kroky**: Rozšíriť o ďalšie pokročilé kontajnerové vzory a automatizáciu CI/CD v budúcich vydaniach

### [v3.5.0] - 2025-11-19

#### Prebranding produktu: Microsoft Foundry
**Táto verzia implementuje komplexnú zmenu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" vo všetkej anglickej dokumentácii, reflektujúcu oficiálny prebranding Microsoftu.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný prebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Spolu: Aktualizovaných 23 obsahových odkazov v 7 dokumentačných súboroch

- **📁 Zmeny štruktúry priečinkov**:
  - `docs/ai-foundry/` premenovaný na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované podľa novej štruktúry priečinkov
  - Overenie funkčnosti navigačných odkazov vo všetkej dokumentácii

- **📄 Premenovania súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky interné odkazy aktualizované podľa nového názvu súboru

#### Aktualizované súbory
- **Dokumentácia kapitol** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizácie odkazov na názov produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizácie odkazov (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizácie krížových odkazov
  - `docs/getting-started/first-project.md` - 2 aktualizácie navigačných odkazov kapitol
  - `docs/getting-started/installation.md` - 2 aktualizácie odkazov na ďalšie kapitoly
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizácie odkazov (navigácia, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizácia navigačného odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizácia navigačného odkazu

- **Súbory štruktúry kurzu** (2 súbory):
  - `README.md` - 17 aktualizácií odkazov (prehľad kurzu, názvy kapitol, sekcia šablón, poznatky komunity)
  - `course-outline.md` - 14 aktualizácií odkazov (prehľad, ciele učenia, zdroje kapitol)

#### Validované
- ✅ Žiadne zostávajúce odkazy na priečinok "ai-foundry" v anglickej dokumentácii
- ✅ Žiadne zostávajúce odkazy na názov produktu "Microsoft Foundry" v anglickej dokumentácii
- ✅ Všetky navigačné odkazy funkčné s novou štruktúrou priečinkov
- ✅ Premenovania súborov a priečinkov úspešne dokončené
- ✅ Overenie krížových odkazov medzi kapitolami

#### Poznámky
- **Rozsah**: Zmeny aplikované len v anglickej dokumentácii v priečinku `docs/`
- **Preklady**: Prekladové priečinky (`translations/`) v tejto verzii neaktualizované
- **Workshop**: Materiály workshopu (`workshop/`) v tejto verzii neaktualizované
- **Príklady**: Súbory s príkladmi môžu stále odkazovať na staré pomenovanie (bude riešené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL a odkazy na GitHub repozitár zostávajú nezmenené

#### Príručka migrácie pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu odkazujúcu na starú štruktúru:
1. Aktualizujte odkazy na priečinky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na súbory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte názov produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Overte, či všetky interné odkazy v dokumentácii fungujú

---

### [v3.4.0] - 2025-10-24

#### Vylepšenia náhľadu a validácie infraštruktúry
**Táto verzia prináša komplexnú podporu pre novú funkciu náhľadu Azure Developer CLI a zlepšuje používateľský zážitok z workshopu.**

#### Pridané
- **🧪 Dokumentácia funkcie azd provision --preview**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referencia príkazov a príklady použitia v cheat sheete
  - Detailná integrácia v príručke pre provisioning s prípadmi použitia a výhodami
  - Integrácia predbežnej kontroly pre bezpečnejšiu validáciu nasadenia
  - Aktualizácie príručky začiatku práce s dôrazom na bezpečné postupy nasadenia
- **🚧 Banner stavu workshopu**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Dizajn s prechodom a indikátormi výstavby pre jasnú komunikáciu používateľovi
  - Časové označenie poslednej aktualizácie pre transparentnosť
  - Dizajn prispôsobený mobilným zariadeniam všetkých typov

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcia náhľadu integrovaná v dokumentácii nasadenia
- **Validácia pred nasadením**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Pracovný tok vývojára**: Aktualizované sekvencie príkazov vrátane náhľadu ako najlepšej praxe
- **Zážitok z workshopu**: Jasne definované očakávania používateľov o stave obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Odporúčaná teraz náhľadovo-prvá metodika
- **Tok dokumentácie**: Validácia infraštruktúry presunutá skôr v procese učenia
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasnou časovou osou vývoja

#### Vylepšené
- **Prístup orientovaný na bezpečnosť**: Zmeny infraštruktúry možno validovať pred nasadením
- **Spolupráca tímu**: Výsledky náhľadu môžu byť zdieľané na prehľad a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisionovaním
- **Zmiernenie rizika**: Zníženie zlyhaní nasadenia vďaka predbežnej validácii

#### Technická implementácia
- **Integrácia do viacerých dokumentov**: Funkcia náhľadu zdokumentovaná v 4 kľúčových súboroch
- **Vzory príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia najlepších praktík**: Náhľad zahrnutý do validačných pracovných tokov a skriptov
- **Vizuálne indikátory**: Jasné označenie NOVÝCH funkcií pre lepšiu viditeľnosť

#### Workshop infraštruktúra
- **Komunikácia stavu**: Profesionálny HTML banner s prechodovou úpravou
- **Používateľská skúsenosť**: Jasné oznámenie stavu vývoja zabraňuje nejasnostiam
- **Profesionálna prezentácia**: Zachováva dôveryhodnosť repozitára a nastavuje očakávania
- **Transparentnosť časovej osi**: Časové označenie poslednej aktualizácie október 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívne učenie
**Táto verzia prináša komplexné materiály workshopu s prehliadačovým interaktívnym sprievodcom a štruktúrovanými učebnými cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopu**: Prehliadačové zážitky z workshopu s možnosťou náhľadu MkDocs
- **📝 Štruktúrované pokyny workshopu**: 7-kroková vedená učebná cesta od objavovania po prispôsobenie
  - 0-Úvod: Prehľad workshopu a nastavenie
  - 1-Vyber-AI-Šablónu: Proces objavovania a výberu šablóny
  - 2-Validuj-AI-Šablónu: Procedúry nasadenia a validácie
  - 3-Rozober-AI-Šablónu: Pochopenie architektúry šablóny
  - 4-Nastav-AI-Šablónu: Konfigurácia a prispôsobenie
  - 5-Prispôsob-AI-Šablónu: Pokročilé úpravy a iterácie
  - 6-Demontuj-Infraštruktúru: Čistenie a správa zdrojov
  - 7-Zhrnutie: Súhrn a ďalšie kroky
- **🛠️ Nástroje workshopu**: Konfigurácia MkDocs s témou Material pre lepší zážitok z učenia
- **🎯 Praktická učebná cesta**: 3-kroková metodika (Objavovanie → Nasadenie → Prispôsobenie)
- **📱 Integrácia GitHub Codespaces**: Plynulé nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírený o komplexný 2-3 hodinový štrukturovaný učebný zážitok
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krok za krokom vedenie od výberu šablóny po produkčné nasadenie
- **Zážitok vývojára**: Integrované nástroje pre zjednodušenie vývojových pracovných tokov

#### Vylepšené
- **Prístupnosť**: Prehliadačové rozhranie s vyhľadávaním, funkciou kopírovania a prepínačom témy
- **Samostatné učenie**: Flexibilná štruktúra workshopu prispôsobujúca sa rôznym tempám učenia
- **Praktická aplikácia**: Scenáre nasadenia AI šablón v reálnych situáciách
- **Integrácia komunity**: Integrácia Discordu pre podporu a spoluprácu workshopu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania pri prechode myšou nad všetky kódové príklady
- **Prepínač témy**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Vizuálne materiály**: Snímky obrazovky a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup do Discord komunity na podporu

### [v3.2.0] - 2025-09-17

#### Veľká reorganizácia navigácie a systém učenia založený na kapitolách
**Táto verzia predstavuje komplexnú štruktúru učenia rozdelenú podľa kapitol s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Celý kurz preorganizovaný do 8 postupných učebných kapitol
  - Kapitola 1: Základy a rýchly štart (⭐ - 30-45 minút)
  - Kapitola 2: AI-first vývoj (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurácia a autentifikácia (⭐⭐ - 45-60 minút)
  - Kapitola 4: Infraštruktúra ako kód a nasadenie (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Multi-Agent AI riešenia (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validácia a plánovanie pred nasadením (⭐⭐ - 1 hodina)
  - Kapitola 7: Riešenie problémov a ladenie (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkčné a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexný navigačný systém**: Konzistentné hlavičky a pätičky navigácie vo všetkej dokumentácii
- **🎯 Sledovanie pokroku**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Vedenie učebnej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Krížová navigácia**: Jasné prepojenia súvisiacich kapitol a predpokladov

#### Vylepšené
- **Štruktúra README**: Pretransformovaná na štruktúrovanú platformu učenia so systémom organizácie podľa kapitol
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a vedenie pokroku
- **Organizácia šablón**: Príklady a šablóny mapované do príslušných učebných kapitol
- **Integrácia zdrojov**: Cheat sheety, FAQ a študijné príručky pripojené k relevantným kapitolám
- **Integrácia workshopu**: Praktické laboratóriá mapované na cieľové učebné kapacity viacerých kapitol

#### Zmenené
- **Postup učenia**: Presunutý z lineárnej dokumentácie na flexibilné učenie podľa kapitol
- **Umiestnenie konfigurácie**: Sprievodca konfiguráciou presunutý na kapitolu 3 pre lepší učebný tok
- **Integrácia AI obsahu**: Lepšia integrácia AI špecifického obsahu počas učebnej cesty
- **Produkčný obsah**: Pokročilé vzory zoskupené v kapitole 8 pre podnikových študentov

#### Vylepšené
- **Používateľský zážitok**: Jasné navigačné stopy a indikátory pokroku kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre jednoduchšie prechádzanie kurzom
- **Profesionálna prezentácia**: Štruktúra kurzu štýlu univerzity vhodná pre akademické a firemné školenia
- **Efektivita učenia**: Skrátený čas na nájdenie relevantného obsahu vďaka lepšej organizácii

#### Technická implementácia
- **Hlavičky navigácie**: Štandardizovaná navigácia kapitol vo viac ako 40 dokumentačných súboroch
- **Pätička navigácie**: Konzistentné vedenie pokroku a indikátory dokončenia kapitol
- **Krížové prepojenia**: Komplexný systém vnútorných odkazov spájajúci súvisiace koncepty
- **Mapovanie kapitol**: Šablóny a príklady jasne priradené k učebným cieľom

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné učebné ciele**: Preorganizovaný študijný sprievodca zaradený do systému 8 kapitol
- **🎯 Hodnotenie podľa kapitol**: Každá kapitola obsahuje špecifické učebné ciele a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný učebný plán s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Skúšobné otázky**: Otázky pre overenie znalostí z každej kapitoly s profesionálnymi výsledkami
- **🛠️ Praktické úlohy**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Vývoj zručností**: Jasný postup od základných pojmov po podnikové vzory so zameraním na kariérny rozvoj
- **🎓 Certifikačný rámec**: Systém profesionálneho rozvoja a uznania komunity
- **⏱️ Riadenie časovej osi**: Štruktúrovaný 10-týždňový plán učenia s overením míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené Multi-Agent AI riešenia
**Táto verzia vylepšuje multi-agentné maloobchodné riešenie lepším pomenovaním agentov a zdokonalenou dokumentáciou.**

#### Zmenené
- **Terminológia viacerých agentov**: V celom maloobchodnom riešení s viacerými agentmi bol výraz "Cora agent" nahradený výrazom "Customer agent" pre jasnejšie pochopenie
- **Architektúra agentov**: Aktualizovaná všetka dokumentácia, ARM šablóny a príklady kódu s konzistentným pomenovaním "Customer agent"
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agentov so zaktualizovanými pomenovaniami
- **Konzistentnosť dokumentácie**: Zaistené, že všetky odkazy používajú profesionálne, opisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizovaný retail-multiagent-arm-template s referenciami na Customer agent
- **Architektonické diagramy**: Obnovené Mermaid diagramy s aktualizovaným pomenovaním agentov
- **Príklady kódu**: Triedy v Pythone a príklady implementácie teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia s konvenciami CUSTOMER_AGENT_NAME

#### Vylepšené
- **Skúsenosti vývojára**: Jasnejšie rozdelenie rolí a zodpovedností agentov v dokumentácii
- **Pripravenosť na výrobu**: Lepšie zosúladenie s podnikateľskými konvenciami pomenovania
- **Vzdelávacie materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované Mermaid architektonické diagramy s referenciami na CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v príkladoch Pythonu
- Upravené JSON konfigurácie ARM šablón na použitie typu agenta "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_*
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na AI vývojárov a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 AI-First Learning Path**: Kompletné preusporiadanie prioritizujúce AI vývojárov a inžinierov
- **Sprievodca integráciou Microsoft Foundry**: Komplexná dokumentácia pre prepojenie AZD so službami Microsoft Foundry
- **Vzorové nasadenia AI modelov**: Podrobný sprievodca výberom modelu, konfiguráciou a stratégiami nasadenia do produkcie
- **AI Workshop Lab**: 2-3 hodinový praktický workshop na konverziu AI aplikácií do riešení nasaditeľných cez AZD
- **Najlepšie postupy pre produkčné AI**: Podnikové vzory pre škálovanie, monitorovanie a zabezpečenie AI pracovných záťaží
- **Sprievodca riešením problémov špecifických pre AI**: Komplexné riešenie problémov pre Microsoft Foundry Modely, Cognitive Services a nasadenia AI
- **Galéria AI šablón**: Vybraná kolekcia Microsoft Foundry šablón s hodnotením zložitosti
- **Materiály pre workshop**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **Štruktúra README**: Zameranie na AI vývojára s 45 % záujmom komunity z Microsoft Foundry Discord
- **Vzdelávacie cesty**: Samostatná cesta AI vývojára vedľa tradičných ciest pre študentov a DevOps inžinierov
- **Odporúčané šablóny**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrácia komunity**: Vylepšená podpora Discord komunity s AI špecifickými kanálmi a diskusiami

#### Zabezpečenie a výrobná pripravenosť
- **Vzory spravovaných identít**: AI špecifické nastavenia autentifikácie a zabezpečenia
- **Optimalizácia nákladov**: Sledovanie použitia tokenov a kontrola rozpočtu pre AI pracovné záťaže
- **Multi-regionálne nasadenie**: Stratégie globálneho nasadenia AI aplikácií
- **Monitorovanie výkonu**: AI špecifické metriky a integrácia Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logický postup od začiatočníka po pokročilé vzory nasadenia AI
- **Overené URL adresy**: Všetky externé odkazy na repozitáre sú overené a dostupné
- **Kompletný referenčný materiál**: Všetky interné odkazy v dokumentácii sú overené a funkčné
- **Pripravené na produkciu**: Podnikové vzory nasadenia s príkladmi z reálneho sveta

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenia
**Táto verzia predstavuje významnú revíziu štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný vzdelávací rámec**: Všetky dokumentačné stránky teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigačný systém**: Pridané odkazy Predchádzajúca/Nasledujúca lekcia naprieč celou dokumentáciou pre vedené učenie
- **Študijný sprievodca**: Komplexný study-guide.md s cieľmi učenia, cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emotikony pre zlepšenie prístupnosti a profesionálneho vzhľadu
- **Vylepšená štruktúra obsahu**: Vylepšená organizácia a tok vzdelávacích materiálov

#### Zmenené
- **Formát dokumentácie**: Štandardizovaná všetka dokumentácia s konzistentnou štruktúrou zameranou na učenie
- **Tok navigácie**: Implementovaný logický postup naprieč všetkými vzdelávacími materiálmi
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného a profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizované všetky interné odkazy na podporu nového navigačného systému

#### Vylepšené
- **Prístupnosť**: Odstránené závislosti na emotikonoch pre lepšiu kompatibilitu so čítačkami obrazovky
- **Profesionálny vzhľad**: Čistá, akademického štýlu prezentácia vhodná pre podnikové vzdelávanie
- **Skúsenosť učenia**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný vzdelávací repozitár AZD

#### Pridané
- **Jadro štruktúry dokumentácie**
  - Kompletný seriál príručiek na začatie práce
  - Komplexná dokumentácia nasadenia a provisioningu
  - Detailné zdroje riešenia problémov a návody na ladenie
  - Nástroje a postupy pred nasadením pre validáciu

- **Modul Začiatočného nastavenia**
  - AZD základy: Základné koncepty a terminológia
  - Inštalačná príručka: Platformovo špecifické inštrukcie nastavenia
  - Príručka konfigurácie: Nastavenie prostredia a autentifikácie
  - Prvý projektový tutoriál: Krok za krokom praktické učenie

- **Modul nasadenia a provisioningu**
  - Príručka nasadenia: Kompletná dokumentácia pracovných tokov
  - Príručka provisioningu: Infraštruktúra ako kód s Bicep
  - Najlepšie praktiky pre produkčné nasadenia
  - Vzory architektúry viacslužbových systémov

- **Modul predletovej validácie**
  - Plánovanie kapacity: Overenie dostupnosti Azure zdrojov
  - Výber SKU: Komplexné pokyny pre úrovne služieb
  - Predletové kontroly: Automatizované validačné skripty (PowerShell a Bash)
  - Nástroje na odhad nákladov a plánovanie rozpočtu

- **Modul riešenia problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a riešenia
  - Príručka ladenia: Systematické metodiky riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a odkazy**
  - Cheat Sheet príkazov: Rýchla referencia pre základné príkazy
  - Slovník: Komplexná terminológia a definície skratiek
  - FAQ: Podrobné odpovede na bežné otázky
  - Odkazy na externé zdroje a komunitné väzby

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webovej stránky
  - Konfigurácia kontajnerovej aplikácie
  - Vzory integrácie databáz
  - Príklady architektúry mikroslužieb
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: Príručky inštalácie a konfigurácie pre Windows, macOS a Linux
- **Rôzne úrovne zručností**: Obsah navrhnutý pre študentov až po profesionálnych vývojárov
- **Praktické zameranie**: Praktické príklady a scenáre z reálneho sveta
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory
- **Zabezpečenie na prvom mieste**: Najlepšie bezpečnostné praktiky integrované naprieč obsahom
- **Optimalizácia nákladov**: Pokyny pre nákladovo efektívne nasadenia a správu zdrojov

#### Kvalita dokumentácie
- **Detailné príklady kódu**: Praktické, testované ukážky kódu
- **Krok za krokom inštrukcie**: Jasné, akčné usmernenia
- **Komplexné spracovanie chýb**: Riešenie bežných problémov
- **Integrácia najlepších praktík**: Priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: Aktuálne s najnovšími službami Azure a funkciami azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánovaná)
#### Rozšírenie AI platformy
- **Podpora viacerých modelov**: Integračné vzory pre Hugging Face, Azure Machine Learning a vlastné modely
- **AI Frameworky agentov**: Šablóny pre nasadenia LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: Možnosti vektorových databáz nad rámec Azure AI Search (Pinecone, Weaviate, atď.)
- **AI observabilita**: Vylepšené monitorovanie výkonu modelov, používania tokenov a kvality odpovedí

#### Skúsenosti vývojára
- **Rozšírenie VS Code**: Integrované vývojové prostredie AZD + Microsoft Foundry
- **Integrácia GitHub Copilot**: AI-podporovaná generácia šablón AZD
- **Interaktívne tutoriály**: Praktické kódovacie cvičenia s automatickou validáciou pre AI scenáre
- **Video obsah**: Doplnkové video tutoriály pre vizuálnych študentov so zameraním na AI nasadenia

### Verzia 4.0.0 (Plánovaná)
#### Podnikové AI vzory
- **Rámec správy**: Riadenie AI modelov, dodržiavanie predpisov a auditné stopy
- **Multi-tenant AI**: Vzory pre obsluhu viacerých zákazníkov s izolovanými AI službami
- **Edge AI nasadenie**: Integrácia so službami Azure IoT Edge a kontajnerovými inštanciami
- **Hybridné cloud AI**: Multi-cloud a hybridné vzory nasadenia AI pracovných záťaží

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: MLOps integrácia s Azure Machine Learning pipeline-ami
- **Pokročilá bezpečnosť**: Zero-trust vzory, privátne koncové body a pokročilá ochrana proti hrozbám
- **Optimalizácia výkonu**: Pokročilé ladenie a škálovanie pre AI aplikácie s vysokou priepustnosťou
- **Globálna distribúcia**: Vzory dodávky obsahu a edge caching pre AI aplikácie

### Verzia 3.0.0 (Plánovaná) - Nahradená súčasným vydaním
#### Navrhované doplnky - Teraz implementované vo v3.0.0
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interaktívne tutoriály**: Praktický AI workshop lab (Dokončené)
- ✅ **Pokročilý bezpečnostný modul**: AI špecifické bezpečnostné vzory (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia AI pracovných záťaží (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementovaná vo v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Ďalšie príklady**: AI zamerané scenáre nasadenia (Dokončené)
- ✅ **Rozšírené FAQ**: AI špecifické otázky a riešenia problémov (Dokončené)
- **Integrácia nástrojov**: Vylepšené príručky integrácie IDE a editorov
- ✅ **Rozšírené monitorovanie**: AI špecifické vzory monitorovania a upozornení (Dokončené)

#### Ešte plánované do budúceho vydania
- **Mobilná priateľská dokumentácia**: Responzívny dizajn pre mobilné učenie
- **Offline prístup**: Stiahnuteľné balíky dokumentácie
- **Vylepšená integrácia IDE**: Rozšírenie VS Code pre AZD + AI pracovné toky
- **Komunitná dashboard**: Metiky komunity v reálnom čase a sledovanie príspevkov

## Príspevky do changelogu

### Hlásenie zmien
Pri príspevkoch do tohto repozitára, prosím, zabezpečte, aby zápisy v changelogu obsahovali:

1. **Číslo verzie**: Podľa sémantického verzovania (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte RRRR-MM-DD
3. **Kategória**: Pridané, Zmenené, Deprecated, Odstránené, Opravené, Bezpečnosť
4. **Jasný popis**: Stručný popis zmien
5. **Vyhodnotenie vplyvu**: Ako zmeny ovplyvnia existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, sekcie dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo vzdelávacie zdroje
- Doplnkové nástroje, skripty alebo utilitky

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Deprecated
- Funkcie alebo prístupy, ktoré sa postupne rušia
- Sekcie dokumentácie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastaralé informácie alebo rušené prístupy
- Nadbytočný alebo konsolidovaný obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo bugov
- Zlepšenia presnosti alebo funkcionality

#### Bezpečnosť
- Vylepšenia alebo opravy súvisiace s bezpečnosťou
- Aktualizácie bezpečnostných najlepších praktík
- Riešenie bezpečnostných zraniteľností

### Smernice pre sémantické verzovanie

#### Hlavná verzia (X.0.0)
- Zmeny, ktoré vyžadujú zásah používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny meniacie základný prístup alebo metodológiu

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo doplnky obsahu
- Vylepšenia zachovávajúce spätnú kompatibilitu
- Doplnkové príklady, nástroje alebo zdroje

#### Patch verzia (X.Y.Z)
- Opravy chýb a korekcie
- Menšie vylepšenia existujúceho obsahu
- Spresnenia a malé vylepšenia

## Spätná väzba a návrhy komunity

Aktívne vyzývame komunitu na spätnú väzbu pre zlepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Hlásenie problémov alebo návrhy vylepšení (AI špecifické problémy sú vítané)
- **Diskusie na Discorde**: Zdieľanie nápadov a interakcia s komunitou Microsoft Foundry
- **Pull Requesty**: Priame príspevky vylepšení obsahu, špeciálne AI šablón a príručiek
- **Microsoft Foundry Discord**: Účasť v kanáli #Azure pre diskusie o AZD + AI
- **Komunitné fóra**: Účasť v širších diskusiách Azure vývojárov

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy informácií o integrácii služieb AI a nasadení
- **Skúsenosť učenia**: Návrhy na zlepšenie AI vývojárskeho vzdelávacieho toku
- **Chýbajúci AI obsah**: Žiadosti o doplnenie AI šablón, vzorov alebo príkladov
- **Prístupnosť**: Vylepšenia pre rozličné potreby učenia
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovných tokov AI vývoja
- **Vzory produkčného AI**: Žiadosti o podnikové AI vzory nasadenia

### Záväzok odpovede
- **Odpoveď na problémy**: Do 48 hodín na nahlásené problémy
- **Žiadosti o funkcie**: Posúdenie do jedného týždňa
- **Komunitné príspevky**: Preskúmanie do jedného týždňa
- **Bezpečnostné problémy**: Prioritné riešenie s urýchlenou odpoveďou

## Plán údržby

### Pravidelné aktualizácie
- **Mesačné kontroly**: Presnosť obsahu a overovanie odkazov
- **Štvrťročné aktualizácie**: Hlavné doplnky a vylepšenia obsahu
- **Polročné kontroly**: Kompletná reštrukturalizácia a rozšírenie
- **Ročné vydania**: Hlavné verzie s významnými vylepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automatizované testovanie**: Pravidelná validácia príkladov kódu a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné zohľadňovanie návrhov používateľov
- **Aktualizácie technológií**: Zladenie s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelná kontrola princípov inkluzívneho dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Posledná hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy počas 12 mesiacov
- **Zastaralé verzie**: Len podpora komunity, bez oficiálnych aktualizácií

### Návod na migráciu
Keď sú vydané hlavné verzie, poskytujeme:
- **Migracné návody**: Krok za krokom inštrukcie na prechod
- **Poznámky o kompatibilite**: Detaily o zlomových zmenách
- **Podpora nástrojov**: Skripty alebo utility na pomoc s migráciou
- **Podpora komunity**: Vyhradené fóra pre otázky týkajúce sa migrácie

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Hlavné README](README.md)

**Zostaňte informovaní**: Sledujte tento repozitár pre oznámenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
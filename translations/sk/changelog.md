# Zoznam zmien - AZD pre začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky významné zmeny, aktualizácie a vylepšenia v úložisku AZD pre začiatočníkov. Dodržiavame princípy sémantického verzovania a udržiavame tento záznam, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia

Preštudovaním tohto zoznamu zmien budete:
- Informovaní o nových funkciách a pridaní obsahu
- Rozumieť vylepšeniam existujúcej dokumentácie
- Sledovať opravy chýb a úpravy pre zabezpečenie presnosti
- Sledovať vývoj učebných materiálov v priebehu času

## Výsledky učenia

Po preštudovaní zápisov zoznamu zmien budete schopní:
- Identifikovať nový obsah a dostupné zdroje na učenie
- Rozumieť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať si svoju učebnú cestu na základe najaktuálnejších materiálov
- Prispievať spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.23.0] - 13.07.2026

#### Obnovenie AZD 1.27.1: Aktualizácia verzie
**Táto verzia znovu overuje kurz voči `azd` `1.27.1` (júl 2026, najnovšie stabilné vydanie) a aktuálnemu preview rozšíreniu pre AI agentov `azure.ai.agents` `1.0.0-beta.5`, čím sú všetky bannery "validované voči" aktualizované po vydaniach 1.26.0, 1.27.0 a 1.27.1.**

#### Zmenené
- **✅ Aktualizovaná východisková základňa overenia** z `azd 1.25.6` (jún 2026) na `azd 1.27.1` (júl 2026) v hlavnom README, všetkých kapitolových READMEs, lekcii dev-container Kapitoly 1 (vrátane príkladov s pripnutými verziami), lekcii vlastných šablón Kapitoly 4, lekcii multi-agent Kapitoly 5 a workshopových dokumentoch
- **🤖 Obnovená základňa Kapitoly 2** z `azd 1.23.12` (marec 2026) na `azd 1.27.1` v súboroch `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` a `microsoft-foundry-integration.md`; dátumy poznámok overenia aktualizované na 2026-07-13
- **🧩 Aktualizácia rozšírenia AI agentov** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na aktuálne vydanie `1.0.0-beta.5` v README Kapitoly 2 a v súbore `agents.md`
- **🧪 Aktualizovaný príklad validácie workshopu** (`výstup azd version`) na `1.27.1`

#### Poznámky k relevantným vydaniam azd (1.26.0 → 1.27.1)
- **1.26.0 (24.06.2026):** Podpora Go pre Azure Functions na Flex Consumption, filtrovanie predplatného na základe nájomcu (`azd config sub-filter`), samostatné balíky rozšírení (`azd x pack --bundle`) a `azd tool install azure-skills`
- **1.27.0 (30.06.2026):** Priame modelovanie Azure AI Foundry projektov/agentov v `azure.yaml` (inicializácia bez Bicep/Terraform), podpora nasadenia kontajnerov pre App Service (`host: appservice` + `language: docker`), priame `-s/--source` príkazy `azd extension`, a `azd tool uninstall`
- **1.27.1 (09.07.2026):** Prepínač `--no-dependencies` pre `azd extension install`, štandardné vylúčenie zastaralých modelov z výziev katalógu/kvóty a niekoľko opráv chýb

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

### [v3.22.0] - 16.06.2026

#### Začiatočnícke doplnenie #2: Tvorba šablón, Dev kontejnery, Pulumi, Azure DevOps, Service Principals a viac
**Táto verzia uzatvára zostávajúce medzery strednej úrovne z analýzy pokrytia azd: ako vytvárať a publikovať vlastnú šablónu, reprodukovateľné prostredia dev-container/Codespaces, poskytovateľ infraštruktúry Pulumi, prechádzka Azure DevOps CI/CD, autentifikácia service-principal, usmernenia výberu hostiteľa (AKS/Spring Apps), vysvetlenie `azd restore`/`azd package`, spracovanie chýb hookov a praktiky tímových/zdieľaných prostredí.**

#### Pridané
- **🧱 Nová lekcia Kapitoly 4** `docs/chapter-04-infrastructure/custom-templates.md` — tvorba vlastnej azd šablóny: požadovaná štruktúra (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametrizácia infraštruktúry pomocou tokenu `uniqueString()` a značky `azd-env-name`, testovanie lokálne s `azd init --template <local-path>`, publikovanie na GitHub a zaslanie do galérie Awesome AZD
- **📦 Nová lekcia Kapitoly 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovateľné prostredia azd pomocou Dev Containers a GitHub Codespaces: minimálny `.devcontainer/devcontainer.json` využívajúci oficiálnu funkciu `ghcr.io/azure/azure-dev/azd`, jazykovo špecifické funkcie, `docker-in-docker` pre hostiteľské kontajnery a `azd auth login --use-device-code` pre vzdialené prihlásenie
- **🧩 Pulumi s azd** sekcia v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, rozloženie zložiek Pulumi, stacky mapované na azd prostredia, požadované výstupy/označovanie a identický workflow `azd up` / `azd down`
- **🎯 Usmernenia výberu hostiteľa** v `docs/chapter-04-infrastructure/provisioning.md` — priateľské porovnanie `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp` s radami, kedy vybrať AKS alebo Azure Spring Apps
- **🛠️ Prechod Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, pripojenie služby s federáciou identity pracovnej záťaže (OIDC), generovaný `azure-dev.yml` a nastavenie skupín premenných
- **🔑 Service Principals (vzor 4)** pridané do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktívne `azd auth login` s klientskym tajomstvom vs. federované/OIDC poverenia, kedy použiť a bezpečné uchovávanie poverení
- **🪝 Spracovanie chýb hookov** podsekcia v `docs/chapter-04-infrastructure/deployment-guide.md` — kódy ukončenia a `set -e`, `continueOnError`, testovanie hookov izolovane s `azd hooks run`, OS-špecifické shelly a `--debug`
- **👥 Tímové / zdieľané prostredia** sekcia v `docs/chapter-03-configuration/configuration.md` — čo žije v `.azure/`, čo ignorovať v gite, prostredia na vývojára, `azd env list`/`select` a poskytovanie hodnôt prostredia v CI/CD
- **🧰 Vysvetlenie `azd restore` a rozšírené `azd package`** v `resources/cheat-sheet.md` — obnovenie závislostí a zostavenie deployovateľného artefaktu bez nasadenia

#### Zmenené
- **🧭 Tabuľka lekcií Kapitoly 4** aktualizovaná o novú lekciu „Tvorba vlastnej šablóny“ (Lekcia 3)
- **🧭 Tabuľka lekcií Kapitoly 1** aktualizovaná o novú lekciu „Dev kontejnery & Codespaces“ (Lekcia 5); navigačné pätičky prepojené medzi `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 16.06.2026

#### Začiatočnícke doplnenie: Praktická lekcia Multi-agent, „Prineste si vlastnú aplikáciu,“ Terraform a prechod CI/CD
**Táto verzia uzatvára najväčšie medzery pre kompletný sprievodca pre začiatočníkov pridaním dvoch nových praktických lekcií (nasaditeľný viac-agentový prechod a pridanie azd do existujúcej aplikácie), začiatočníckeho úvodu do hookov, časti Terraform s azd, krok za krokom prechodu GitHub Actions pipeline, vysvetlenia nových preview rozšírení a explicitného zoznamu na overenie nasadenia.**

#### Pridané
- **🤝 Nová lekcia Kapitoly 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plne praktický, nasaditeľný prechod s dvoma agentmi (orchestrátor + špecialisti) použitím reálnej šablóny (`contoso-creative-writer`), pokrývajúci kedy použiť multi-agent, workflow `azd up`, pochopenie nasadených prostriedkov, cross-agent tracing, prispôsobenie a vyčistenie
- **📦 Nová lekcia Kapitoly 1** `docs/chapter-01-foundation/bring-your-own-app.md` — ako pridať azd do existujúceho projektu s `azd init` („použiť kód v aktuálnom adresári“), pochopenie `azure.yaml` a `infra/`, `azd infra generate`, detekcia hostiteľa a nasadenie s `azd up`
- **🌐 Sekcia Terraform s azd** pridaná do `docs/chapter-04-infrastructure/provisioning.md` — konfigurácia `infra.provider: terraform`, rozloženie priečinka `.tf`, požadované výstupy `AZURE_*` a označovanie `azd-env-name`, a identický workflow `azd up` / `azd down` (uzatvára medzeru, kde bola deklarovaná podpora Terraform, no ukázal sa iba Bicep)
- **⚙️ Krok za krokom GitHub Actions prechod** v `docs/chapter-08-production/production-ai-practices.md` — od repozitára GitHub po automatické nasadenia: `azd pipeline config`, OIDC federované poverenia (bez uložených tajomstiev), generovaný `azure-dev.yml` a rady o tajomstvách vs. premenných
- **🪝 Začiatočnícky úvod „Nový na hookoch?“** v `docs/chapter-04-infrastructure/deployment-guide.md` — čo je hook, tabuľka fáz hookov, minimálny prvý hook a manuálne spustenie hookov s `azd hooks run`
- **✅ Pridaný zoznam „Overte svoje nasadenie“** do kroku 5 `docs/chapter-01-foundation/first-project.md` — test dymu, kontrola health-endpointu a explicitné kritériá úspechu
- **🧩 Vysvetľovač nových preview rozšírení** `azure.ai.skills` a `azure.ai.connections` (čo sú a kedy ich použiť) v `docs/chapter-08-production/production-ai-practices.md`

#### Zmenené
- **🧭 Opravena tabuľka lekcií Kapitoly 5**: `multi-agent-basics.md` je teraz Lekcia 1 (jediná plne praktická lekcia), s úprimným označením, že Lekcia 2 je v Kapitole 6 a scénar Retail je architektonický návrh, nie šablóna s jedným príkazom
- **🧭 Tabuľka lekcií Kapitoly 1** teraz zahŕňa novú lekciu „Prineste si vlastnú aplikáciu“ (Lekcia 4)
- **🔗 Aktualizované navigačné pätičky**: `first-project.md` teraz odkazuje vpred na `bring-your-own-app.md`

#### Opravené
- **🧱 Uzavretá medzera Terraform s podporou** — kurz predtým spomínal podporu Terraform bez jej ukázania
- **🔀 Opravili zavádzajúce medzikapitolové odkazy v Kapitole 5** ktoré naznačovali existenciu plnej multi-agent implementácie, keď bola iba architektonická schéma

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

### [v3.20.0] - 16.06.2026

#### Obnovenie AZD 1.25.6, Príkazy pre celý životný cyklus agenta & Rebranding Aspire

**Táto verzia revaliduje kurz proti `azd` `1.25.6` (jún 2026) a rozšíreniu `azure.ai.agents` `0.1.40-preview`, rozširuje AI usmernenia z „vytvoriť agenta“ na kompletný životný cyklus agenta (testovať → vyhodnotiť → optimalizovať → skontrolovať → vymazať), zobrazuje nové náhľadové rozšírenia `azure.ai.skills` a `azure.ai.connections` a upozorňuje na rebranding produktu „.NET Aspire“ na „Aspire“.**

#### Pridané
- **🔁 Kompletné pokrytie životného cyklu agenta** pre začiatočníkov a AI inžinierov v celej dokumentácii:
  - `docs/chapter-01-foundation/azd-basics.md` — Pridaná tabuľka životného cyklu (vytvoriť → testovať → merať → zlepšovať → kontrolovať → upratovať) v sekcii Rozšírenia a AI príkazy
  - `docs/chapter-08-production/production-ai-practices.md` — Nová sekcia „Správa životného cyklu agenta“ pokrývajúca príkazy `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — Rozšírené AI príkazy agenta o `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Nové náhľadové rozšírenia** zdokumentované: `azure.ai.skills` (opakované zručnosti agenta) a `azure.ai.connections` (Foundry prepojenia) pridané do tabuľky rozšírení a cheat sheetu
- **⏱️ Usmernenie k dobe odozvy** — príklady pre `azd ai agent invoke` teraz uvádzajú celkovú latenciu a čas do prvého bytu
- **📌 Banner s verziou** v koreňovom README smerujúci používateľov na `azd version` a `azd upgrade`

#### Zmenené
- **✅ Aktualizovaná validačná základňa** z `azd 1.23.12` (marec 2026) na `azd 1.25.6` (jún 2026) vo všetkých README kapitolách a dokumentoch dielne
- **🤖 Aktualizovaná poznámka ku kapitole 2 o rozšírení** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Aktualizovaný validačný príklad dielne** (výstup `azd version`) na verziu `1.25.6`
- **🧭 Osviežené README „Čo je nové v azd dnes“** so zvýraznením kompletného životného cyklu agenta, nových AI rozšírení a nedávnych zlepšení používateľskej skúsenosti (`azd init` idempotentnosť, vymazávanie neaktívneho tokenu `azd auth login`, prvé spustenie promptu `azd tool`)
- **📖 Kapitola 2 agents.md (možnosť 4)** teraz smeruje používateľov k príkazom životného cyklu po nasadení namiesto zastavenia sa pri `azd up`

#### Opravené
- **🏷️ Názov produktu** — pridaná poznámka o rebrandingu Aspire („.NET Aspire“ je teraz jednoducho „Aspire“); podpora Aspire v azd je nezmenená
- **🔎 Potvrdená živá validácia vydania** proti vydanému kanálu Azure Developer CLI: stabilná verzia CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Vyjasnenie pre začiatočníkov, validácia nastavenia a záverečné čistenie príkazov AZD
**Táto verzia nadväzuje na validačnú kontrolu AZD 1.23 prehľadom dokumentácie zameraným na začiatočníkov: vyjasňuje usmernenia autentifikácie prioritne cez AZD, pridáva skripty na validáciu lokálneho nastavenia, overuje kľúčové príkazy voči živej AZD CLI a odstraňuje posledné neaktuálne odkazy na príkazy v anglickej verzii mimo changelogu.**

#### Pridané
- **🧪 Skripty na validáciu nastavenia pre začiatočníkov** s `validate-setup.ps1` a `validate-setup.sh` na potvrdenie požadovaných nástrojov pred začatím Kapitoly 1
- **✅ Úvodné kroky validácie nastavenia** v koreňovom README a README Kapitoly 1 aby chýbajúce predpoklady boli identifikované ešte pred `azd up`

#### Zmenené
- **🔐 Usmernenie autentifikácie pre začiatočníkov** teraz konzistentne vníma `azd auth login` ako primárnu cestu v AZD workflow, pričom `az login` je voliteľný, ak sa priamo nepoužívajú Azure CLI príkazy
- **📚 Onboardingový tok v Kapitole 1** teraz smeruje používateľov k validácii lokálneho nastavenia pred inštaláciou, autentifikáciou a prvým nasadením
- **🛠️ Správy validátora** teraz jasne rozdeľujú blokujúce požiadavky od voliteľných upozornení Azure CLI v AZD-only začiatočníckej ceste
- **📖 Konfiguračná, troubleshootingová a príkladová dokumentácia** teraz rozlišuje medzi povinnou autentifikáciou AZD a voliteľným prihlásením cez Azure CLI, kde boli predtým bez kontextu

#### Opravené
- **📋 Zvyšné odkazy na príkazy v anglickej verzii** aktualizované na aktuálne formy AZD, vrátane `azd config show` v cheat sheet a `azd monitor --overview` tam, kde bola zamýšľaná náhľadová dokumentácia Azure Portalu
- **🧭 Upokojenie začiatočníckych tvrdení v Kapitole 1** na zabránenie nadmerným sľubom o garantovanej bezchybnosti alebo rollback správaní vo všetkých šablónach a Azure resource
- **🔎 Overenie živého CLI** potvrdené aktuálnou podporou príkazov `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

#### Validácia AZD 1.23.12, rozšírenie prostredia dielne a obnovenie modelu AI
**Táto verzia vykonáva validačný prechod dokumentácie voči `azd` `1.23.12`, aktualizuje zastarané príklady príkazov AZD, obnovuje usmernenia AI modelu na aktuálne predvolené hodnoty a rozširuje inštrukcie dielne okrem GitHub Codespaces aj na podporné dev kontajnery a lokálne klony.**

#### Pridané
- **✅ Poznámky k validácii v hlavných kapitolách a dokumentoch dielne** na explicitné uvedenie testovanej základne AZD pre používateľov starších alebo novších buildov CLI
- **⏱️ Usmernenie k limitu času nasadenia** pre zdĺhavé nasadenia AI aplikácií s `azd deploy --timeout 1800`
- **🔎 Kroky na kontrolu rozšírenia** s `azd extension show azure.ai.agents` v dokumentácii pracovných tokov AI
- **🌐 Rozšírené usmernenia prostredia dielne** pokrývajúce GitHub Codespaces, dev kontajnery a lokálne klony cez MkDocs

#### Zmenené
- **📚 Úvodné README kapitol** teraz konzistentne uvádzajú validáciu proti `azd 1.23.12` v základe, konfigurácii, infraštruktúre, multi-agentovi, prednasadení, troubleshooti a produkcii
- **🛠️ Odkazy na príkazy AZD** aktualizované na aktuálne formy v celom texte:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` alebo `azd env get-value(s)` podľa kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kde je zamýšľaný prehľad v Application Insights
- **🧪 Zjednodušené príklady preview provisioningu** na aktuálne podporované použitia ako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Tok dielne** aktualizovaný tak, aby používatelia mohli dokončiť laboratóriá v Codespaces, dev kontejnery alebo lokálny klon namiesto predpokladu spustenia len v Codespaces
- **🔐 Usmernenie autentifikácie** teraz preferuje `azd auth login` pre AZD workflow, pričom `az login` je voliteľný, ak sa priamo používajú Azure CLI príkazy

#### Opravené
- **🪟 Príkazy inštalácie Windows** normalizované na aktuálne veľké písmená balíčkov `winget` v inštalačnom sprievodcovi
- **🐧 Usmernenie inštalácie Linux** opravené tak, aby sa vyhlo nepodporovaným distribučným špecifickým pokynom na `azd` package manager a namiesto toho ukazuje na release assety tam, kde je to vhodné
- **📦 Príklady AI modelov** obnovené z starších predvolieb ako `gpt-35-turbo` a `text-embedding-ada-002` na aktuálne, napríklad `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Ukážky nasadenia a diagnostiky** upravené na používanie aktuálnych príkazov na prostredie a stav v logoch, skriptoch a troubleshooting krokoch
- **⚙️ Usmernenie GitHub Actions** aktualizované z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Usmernenie súhlasu MCP/Copilot** aktualizované z `azd mcp consent` na `azd copilot consent list`

#### Vylepšené
- **🧠 Usmernenie AI kapitoly** teraz lepšie vysvetľuje preview citlivé správanie `azd ai`, prihlasovanie pre tenant, aktuálne používanie rozšírení a odporúčania pre nasadenie modelov
- **🧪 Inštrukcie pre dielňu** teraz používajú realistickejšie príklady verzií a jasnejší jazyk pre nastavenie prostredia pri praktických cvičeniach
- **📈 Produkčné a troubleshooting dokumenty** teraz lepšie zodpovedajú aktuálnym monitorovacím, záložným modelom a príkladom zlaďovania nákladov

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

#### Príkazy AZD AI CLI, validácia obsahu a rozšírenie šablón
**Táto verzia pridáva pokrytie príkazov `azd ai`, `azd extension` a `azd mcp` do všetkých kapitol súvisiacich s AI, opravuje nefunkčné odkazy a zastaraný kód v agents.md, aktualizuje cheat sheet a prepracováva sekciu Príkladových šablón s overenými popismi a novými Azure AI AZD šablónami.**

#### Pridané
- **🤖 Pokrytie AZD AI CLI** v 7 súboroch (predtým iba v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekcia „Rozšírenia a AI príkazy“ predstavujúca `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnosť 4: `azd ai agent init` s porovnávacou tabuľkou (šablóna vs manifest prístup)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcie „AZD rozšírenia pre Foundry“ a „Agent-prvý deployment“

  - `docs/chapter-05-multi-agent/README.md` — Rýchly štart teraz zobrazuje cesty nasadenia na základe šablóny a manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcia Nasadenie teraz zahŕňa možnosť `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcia "Príkazy rozšírenia AZD AI pre diagnostiku"
  - `resources/cheat-sheet.md` — Nová sekcia "Príkazy AI a rozšírení" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové AZD AI ukážkové šablóny** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat využívajúci Langchain4J s možnosťami nasadenia ACA/AKS
  - **contoso-creative-writer** — Multi-agent kreatívna písacia aplikácia využívajúca Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG využívajúci Azure Functions + LangChain.js + Cosmos DB s podporou lokálneho vývoja Ollama
  - **chat-with-your-data-solution-accelerator** — Firemný RAG akcelerátor s administrátorským portálom, Teams integráciou a možnosťami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčná aplikácia pre multi-agentnú MCP orchestráciu so servermi v .NET, Pythone, Java a TypeScripte
  - **azd-ai-starter** — Minimálna Azure AI infraštruktúra Bicep štartovacia šablóna
  - **🔗 Odkaz na Awesome AZD AI galériu** — Odkaz na [awesome-azd AI galériu](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablón)

#### Opravené
- **🔗 navigácia v agents.md**: Odkazy Predošlý/Ďalší teraz zodpovedajú poradiu lekcií z kapitoly 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 nefunkčné odkazy v agents.md**: `production-ai-practices.md` opravené na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 zastaraný kód v agents.md**: Nahradené `opencensus` za `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neplatné API v agents.md**: `max_tokens` presunuté z `create_agent()` do `create_run()` ako `max_completion_tokens`
- **🔢 počítanie tokenov v agents.md**: Nahradený hrubý odhad `len//4` funkciou `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opravené služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (predvolený hostiteľ zmenený v októbri 2024)
- **contoso-chat**: Aktualizovaný popis odkazujúci na Azure AI Foundry + Prompty, korešpondujúci s aktuálnym názvom a technologickým stackom repozitára

#### Odstránené
- **ai-document-processing**: Odstránený nefunkčný odkaz na šablónu (repozitár nie je verejne dostupný ako AZD šablóna)

#### Vylepšené
- **📝 cvičenia v agents.md**: Cvičenie 1 teraz zobrazuje očakávaný výstup a krok `azd monitor`; Cvičenie 2 obsahuje kompletný registračný kód `FunctionTool`; Cvičenie 3 nahradilo nejasné pokyny konkrétnymi príkazmi `prepdocs.py`
- **📚 zdroje v agents.md**: Aktualizované odkazy na dokumentáciu Azure AI Agent Service a rýchly štart
- **📋 tabuľka Ďalších krokov v agents.md**: Pridaný odkaz na AI Workshop Lab pre kompletné pokrytie kapitoly

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
**Táto verzia vylepšuje navigáciu kapitôl README.md pomocou rozšíreného formátu tabuľky.**

#### Zmenené
- **Tabuľka mapy kurzu**: Vylepšená o priame odkazy na lekcie, odhady trvania a hodnotenia zložitosti
- **Čistenie priečinkov**: Odstránené nadbytočné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validácia odkazov**: Overených všetkých 21+ vnútorných odkazov v tabuľke mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizácie názvov produktov
**Táto verzia aktualizuje produktové odkazy podľa aktuálneho označenia Microsoftu.**

#### Zmenené
- **Microsoft Foundry → Microsoft Foundry**: Všetky odkazy aktualizované vo všetkých súboroch mimo prekladu
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný na aktuálne označenie

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

#### Hlavná reorganizácia repozitára: Nazvy priečinkov podľa kapitol
**Táto verzia reorganizuje dokumentáciu do samostatných priečinkov podľa kapitol pre lepšiu orientáciu.**

#### Premenovanie priečinkov
Staré priečinky boli nahradené priečinkami s číslovaním kapitol:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridané nové: `docs/chapter-05-multi-agent/`

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
| Všetky súbory s riešením problémov | troubleshooting/ | chapter-07-troubleshooting/ |

#### Pridané
- **📚 README súbory kapitol**: Vytvorené README.md v každom priečinku kapitoly s:
  - Vzdelávacie ciele a trvanie
  - Tabuľkou lekcií s popismi
  - Príkazmi rýchleho štartu
  - Navigáciou do ostatných kapitol

#### Zmenené
- **🔗 Aktualizované všetky vnútorné odkazy**: Aktualizovaných viac ako 78 ciest vo všetkých dokumentačných súboroch
- **🗺️ Hlavný README.md**: Aktualizovaná mapa kurzu s novou štruktúrou kapitol
- **📝 examples/README.md**: Aktualizované krížové odkazy na priečinky kapitol

#### Odstránené
- Staré štruktúry priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reorganizácia repozitára: Navigácia podľa kapitol
**Táto verzia pridala navigačné README súbory pre kapitoly (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexného sprievodcu nasadzovaním AI agentov s Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca pokrývajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri šablóny pre rýchly štart agentov (Foundry Agents, Prompty, RAG)
  - Vzory architektúry agentov (jednotlivý agent, RAG, multi-agent)
  - Konfigurácia a prispôsobenie nástrojov
  - Monitorovanie a sledovanie metrík
  - Náklady a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov s `azd init --template get-started-with-ai-agents`
- **Vzory architektúry**: Vizualizácie vzorov agentov
- **Konfigurácia**: Nastavenie nástrojov a premenných prostredia
- **Monitorovanie**: Integrácia s Application Insights
- **Cvičenia**: Postupné praktické učenie (20-45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia prostredia DevContainer
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera o moderné nástroje a lepšie predvolené hodnoty pre zážitok učenia AZD.**

#### Zmenené
- **🐳 Základný obraz**: Aktualizovaný z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovšia stabilná verzia Debianu)
- **📛 Názov kontajnera**: Premenovaný z "Python 3" na "AZD for Beginners" pre väčšiu jasnosť

#### Pridané
- **🔧 Nové funkcie Dev Containeru**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` pre správu šablón
  - `docker-in-docker` pre nasadenie kontajnerových aplikácií

- **🔌 Presmerovanie portov**: Predkonfigurované porty pre bežný vývoj:
  - 8000 (náhľad MkDocs)
  - 3000 (webové aplikácie)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšírenia VS Code**:
  - `ms-python.vscode-pylance` - Vylepšená IntelliSense pre Python
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Dockeru
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojov
  - `yzhang.markdown-all-in-one` - Úpravy Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdownu
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramov
  - `redhat.vscode-yaml` - Podpora YAML (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Git
  - `mhutchie.git-graph` - História Git

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre Python interpreter, formátovanie pri ukladaní a odstraňovanie medzier

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný MkDocs minify plugin
  - Pridaný pre-commit pre kvalitu kódu
  - Pridané balíčky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opravené
- **Príkaz po vytvorení**: Teraz overuje inštaláciu AZD a Azure CLI pri spustení kontajnera

---

### [v3.11.0] - 2026-02-05

#### Prepracovaný README priateľský pre začiatočníkov
**Táto verzia výrazne vylepšuje README.md, aby bol prístupnejší pre začiatočníkov a pridáva zásadné zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Porovnanie Azure CLI a AZD**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Skvelé AZD odkazy**: Priame odkazy na komunitnú galériu šablón a zdroje na príspevky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ pripravených šablón na nasadenie
  - [Predložiť šablónu](https://github.com/Azure/awesome-azd/issues) - Príspevky komunity
- **🎯 Sprievodca rýchlym štartom**: Zjednodušená 3-kroková sekcia na začiatok (Inštalácia → Prihlásenie → Nasadenie)
- **📊 Navigačná tabuľka na základe skúseností**: Jasné usmernenie, kde začať podľa skúseností vývojára

#### Zmenené
- **Štruktúra README**: Preorganizovaná pre postupné odhaľovanie - najdôležitejšie informácie hneď na začiatku
- **Úvodná sekcia**: Prepísaná tak, aby vysvetľovala "Kúzlo `azd up`" pre úplných začiatočníkov
- **Odstránenie duplicitného obsahu**: Odstránená duplicitná sekcia riešenia problémov
- **Oprava príkazov pre riešenie problémov**: Opravený odkaz `azd logs` na platný príkaz `azd monitor --logs`

#### Opravené

- **🔐 Príkazy overenia**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na príkazy**: Odstránené zostávajúce `azd logs` z časti riešenia problémov v README

#### Poznámky
- **Rozsah**: Zmeny aplikované v hlavnom README.md a resources/cheat-sheet.md
- **Cieľová skupina**: Vylepšenia špecificky zamerané na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia presnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce príkazy AZD v celej dokumentácii, čím zabezpečuje, že všetky ukážky kódu používajú platnú syntax Azure Developer CLI.**

#### Opravené
- **🔧 Odstránené neexistujúce príkazy AZD**: Komplexný audit a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradený `azd monitor --logs` alebo alternatívami Azure CLI
  - Podpríkazy `azd service` (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistujú) → odstránené alebo nahradené platnými alternatívami
  - Prekliky `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistujú) → odstránené
  - Prekliky `azd provision --what-if/--rollback` (neexistujú) → aktualizované na použitie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované s opravami príkazov**:
  - `resources/cheat-sheet.md`: Výrazná úprava referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené rollback a stratégie nasadenia
  - `docs/troubleshooting/debugging.md`: Opravené časti analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy riešenia problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia ladenia AZD
  - `docs/getting-started/azd-basics.md`: Opravené príkazy monitorovania
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a ladenia
  - `docs/getting-started/installation.md`: Opravené príklady pomoci a verzie
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy na prezeranie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy ladenia agenta

- **📝 Aktualizovaná referencia verzie**: 
  - `docs/getting-started/installation.md`: Zmenená pevne zakódovaná verzia `1.5.0` na generickú `1.x.x` s odkazom na vydania

#### Zmenené
- **Stratégie rollbacku**: Aktualizovaná dokumentácia na použitie Git-based rollback (AZD nemá natívnu podporu rollbacku)
- **Prezeranie logov**: Nahradené odkazy `azd logs` za `azd monitor --logs`, `azd monitor --live` a príkazy Azure CLI
- **Sekcia výkonnosti**: Odstránené neexistujúce prepínače paralelného/incrementálneho nasadenia, poskytnuté platné alternatívy

#### Technické detaily
- **Platné príkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné prekliky azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené voči Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a aktualizácia kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky nefunkčné odkazy v dokumentácii a zlepšuje celkovú kvalitu obsahu pre AI vývojárov používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s usmerneniami pre príspevky s:
  - Jasné pokyny na hlásenie problémov a navrhovanie zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny pre príklady kódu a konvencie commit správ
  - Informácie o angažovaní komunity

#### Dokončené
- **🎯 Workshop Modul 7 (Zhrnutie)**: Úplne dokončený záverečný modul s:
  - Komplexným súhrnom úspechov workshopu
  - Sekciou kľúčových ovládnutých konceptov AZD, šablón a Microsoft Foundry
  - Odporúčaniami na pokračovanie v učení
  - Cvičeniami z workshopu s hodnotením náročnosti
  - Odkazmi na spätnú väzbu a podporu komunity

- **📚 Workshop Modul 3 (Analýza)**: Aktualizované vzdelávacie ciele s:
  - Sprievodcom aktiváciou GitHub Copilot s MCP servermi
  - Pochopenie štruktúry zložiek AZD šablón
  - Vzory infraštruktúry ako kód (Bicep)
  - Pokyny pre praktickú laboratórnu prácu

- **🔧 Workshop Modul 6 (Zbavenie sa)**: Dokončený s:
  - Cieľmi čistenia zdrojov a riadenia nákladov
  - Použitím `azd down` pre bezpečné odstránenie infraštruktúry
  - Pokynmi na obnovenie soft-delete kognitívnych služieb
  - Bonusové výzvy na preskúmanie GitHub Copilot a Azure Portal

#### Opravené
- **🔗 Opravy nefunkčných odkazov**: Riešených viac než 15 nefunkčných interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty na microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty na ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradený neexistujúci cicd-integration.md za deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty FAQ a sprievodcu riešením problémov
  - `examples/container-app/microservices/README.md`: Opravené cesty na úvod kurzu a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy kapitol AI
  - `course-outline.md`: Opravené odkazy na sprievodcu inštruktora a AI workshop laboratóriá

- **📅 Banner stavu workshopu**: Aktualizovaný zo "Under Construction" na aktívny stav workshopu s dátumom február 2026

- **🔗 Navigácia v workshope**: Opravené nefunkčné navigačné odkazy v README.md workshopu smerujúce na neexistujúci priečinok lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené varovanie "under construction", workshop je teraz kompletný a pripravený na používanie
- **Konzistencia navigácie**: Zabezpečené správne prepojenia medzi modulmi workshopu
- **Odkazy na učebnú cestu**: Aktualizované medziodkazy kapitol na správne cesty microsoft-foundry

#### Overené
- ✅ Všetky anglické markdown súbory majú platné interné odkazy
- ✅ Moduly workshopu 0-7 sú kompletné s cieľmi učenia
- ✅ Navigácia medzi kapitolami a modulmi správne funguje
- ✅ Obsah je vhodný pre AI vývojárov používajúcich Microsoft AZD
- ✅ Použitý jazyk a štruktúra priateľské pre začiatočníkov
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pre prispievateľov komunity

#### Technická realizácia
- **Overovanie odkazov**: Automatizovaný PowerShell skript overil všetky interné odkazy .md
- **Audit obsahu**: Manuálne hodnotenie kompletnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Aplikované konzistentné vzory navigácie kapitol a modulov

#### Poznámky
- **Rozsah**: Zmeny aplikované iba v anglickej dokumentácii
- **Preklady**: Priečinky pre preklad neboli v tejto verzii aktualizované (automatický preklad bude synchronizovaný neskôr)
- **Trvanie workshopu**: Kompletný workshop teraz poskytuje 3-4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: Monitorovanie, zabezpečenie a vzory viacerých agentov
**Táto verzia pridáva komplexné A-kvalitné lekcie o integrácii Application Insights, autentifikačných vzoroch a koordinácii viacerých agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia integrácie Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým provisionovaním
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Funkčné Python aplikácie s vlastnou telemetriou (viac ako 1 200 riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Microsoft Foundry Models)
  - 6 diagramov Mermaid (architektúra, distribuované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (upozornenia, dashboardy, AI monitorovanie)
  - Príklady dotazov Kusto a stratégie optimalizácie nákladov
  - Streamovanie živých metrík a ladenie v reálnom čase
  - Čas učenia 40-50 minút s produkčne pripravenými vzormi

- **🔐 Lekcia autentifikácie a bezpečnostných vzorov**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentifikácie (pripojovacie reťazce, Key Vault, spravovaná identita)
  - Kompletné Bicep infraštruktúrne šablóny pre bezpečné nasadenia
  - Kód Node.js aplikácie s integráciou Azure SDK
  - 3 kompletné cvičenia (povolenie spravovanej identity, identita priradená používateľom, rotácia Key Vault)
  - Najlepšie bezpečnostné postupy a konfigurácie RBAC
  - Sprievodca riešením problémov a analýza nákladov
  - Produkčne pripravené vzory bezheslového overenia

- **🤖 Lekcia vzorov koordinácie viacerých agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorov koordinácie (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
  - Kompletná implementácia orchestrátora služby (Python/Flask, viac než 1 500 riadkov)
  - 3 špecializované agentné implementácie (výskum, pisateľ, editor)
  - Integrácia s Service Bus pre správu fronty správ
  - Správa stavu Cosmos DB pre distribuované systémy
  - 6 diagramov Mermaid znázorňujúcich interakcie agentov
  - 3 pokročilé cvičenia (manipulácia s časovým limitom, logika opakovania, circuit breaker)
  - Rozpis nákladov (240-565 $/mesiac) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola pred nasadením**: Teraz obsahuje komplexné vzory monitorovania a koordinácie
- **Kapitola začiatok práce**: Vylepšená o profesionálne autentifikačné vzory
- **Produkčná pripravenosť**: Kompletné pokrytie od bezpečnosti po pozorovateľnosť
- **Osnova kurzu**: Aktualizovaná s odkazmi na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Pokrok v učení**: Lepšia integrácia bezpečnosti a monitorovania v celom kurze
- **Kvalita dokumentácie**: Konzistentné štandardy A-kvality (95-97 %) v nových lekciách
- **Produkčné vzory**: Kompletné end-to-end pokrytie pre podnikové nasadenia

#### Vylepšené
- **Zážitok vývojára**: Jasná cesta od vývoja po produkčné monitorovanie
- **Bezpečnostné štandardy**: Profesionálne vzory pre autentifikáciu a správu tajomstiev
- **Pozorovateľnosť**: Kompletná integrácia Application Insights s AZD
- **AI záťaže**: Špecializované monitorovanie pre Microsoft Foundry Models a viacagentné systémy

#### Overené
- ✅ Všetky lekcie obsahujú kompletne funkčný kód (nie útržky)
- ✅ Mermaid diagramy pre vizuálne učenie (19 celkom v 3 lekciách)
- ✅ Praktické cvičenia s overovacími krokmi (9 celkom)
- ✅ Produkčne pripravené Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýza nákladov a optimalizačné stratégie
- ✅ Sprievodcovia riešením problémov a najlepšie praktiky
- ✅ Kontrolné body znalostí s overovacími príkazmi

#### Výsledky hodnotenia dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný sprievodca monitorovaním
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé viacagentné architektúry
- **Celkový nový obsah**: - Konzistentné štandardy vysokej kvality

#### Technická realizácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované trasovanie
- **Autentifikácia**: Spravovaná identita + Key Vault + RBAC vzory
- **Viac agentov**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Živé metriky + Kusto dotazy + upozornenia + dashboardy
- **Riadenie nákladov**: Stratégií vzorkovania, pravidlá uchovávania, rozpočtové kontroly

### [v3.7.0] - 2025-11-19

#### Zlepšenia kvality dokumentácie a nový príklad Microsoft Foundry Models
**Táto verzia zlepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Microsoft Foundry Models s chat rozhraním gpt-4.1.**

#### Pridané
- **🤖 Príklad chatovania Microsoft Foundry Models**: Kompletné nasadenie gpt-4.1 s funkčnou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Microsoft Foundry Models (nasadenie modelu gpt-4.1)
  - Python rozhranie príkazového riadku so zachovaním histórie konverzácie
  - Integrácia Key Vault pre bezpečné uloženie API kľúčov
  - Sledovanie využitia tokenov a odhad nákladov
  - Obmedzenie rýchlosti a spracovanie chýb
  - Komplexné README s 35-45 minútovým návodom na nasadenie
  - 11 produkčne pripravených súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Cvičenia dokumentácie**: Pridané praktické cvičenia do sprievodcu konfiguráciou:
  - Cvičenie 1: Konfigurácia pre viac prostredí (15 minút)
  - Cvičenie 2: Prax správy tajomstiev (10 minút)
  - Jasné kritériá úspechu a overovacie kroky
- **✅ Overenie nasadenia**: Pridaná sekcia overenia do sprievodcu nasadením:
  - Postupy kontroly stavu
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy nasadenia
  - Rýchla referencia riešenia problémov

#### Vylepšené
- **examples/README.md**: Aktualizované na A-kvalitu (93 %):
  - Pridané azure-openai-chat do všetkých relevantných častí
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky príkladov AI aplikácií
  - Integrované do Rýchleho štartu pre pokročilých používateľov
  - Pridané do sekcie Microsoft Foundry Templates
  - Aktualizovaná matica porovnaní a sekcie hľadania technológií
- **Kvalita dokumentácie**: Zlepšené z B+ (87 %) na A- (92 %) v priečinku docs

  - Pridané očakávané výstupy ku kľúčovým príkladom príkazov
  - Zaradené kroky overenia zmien konfigurácie
  - Vylepšené praktické učenie s cvičeniami

#### Zmenené
- **Postup učenia**: Lepšia integrácia príkladov AI pre stredne pokročilých študentov
- **Štruktúra dokumentácie**: Viac praktických cvičení s jasnými výsledkami
- **Proces overenia**: Explicitné kritériá úspechu pridané do kľúčových pracovných tokov

#### Vylepšené
- **Skúsenosť vývojára**: Nasadenie Microsoft Foundry Models trvá teraz 35-45 minút (oproti 60-90 minútam pri komplexných alternatívach)
- **Transparentnosť nákladov**: Jasné odhady nákladov (50-200 USD/mesačne) pre príklad Microsoft Foundry Models
- **Učiaca cesta**: AI vývojári majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a kroky overenia

#### Overené
- ✅ Príklad Microsoft Foundry Models plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov syntakticky správnych
- ✅ Inštrukcie v README zodpovedajú skutočnej skúsenosti s nasadením
- ✅ Odkazy v dokumentácii aktualizované na 8+ miestach
- ✅ Index príkladov presne reflektuje 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy sú správne

#### Technická implementácia
- **Architektúra Microsoft Foundry Models**: vzor gpt-4.1 + Key Vault + Container Apps
- **Bezpečnosť**: Manažované identity pripravené, tajomstvá uložené v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Správa nákladov**: Sledovanie tokenov a optimalizácia využívania
- **Nasadenie**: Jediný príkaz `azd up` pre kompletnú konfiguráciu

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia prináša komplexné, produkčne pripravené príklady nasadenia kontajnerových aplikácií pomocou Azure Developer CLI (AZD) s plnou dokumentáciou a začlenením do učiacej cesty.**

#### Pridané
- **🚀 Príklady Container App**: Nové lokálne príklady v `examples/container-app/`:
  - [Hlavný sprievodca](examples/container-app/README.md): Kompletný prehľad kontajnerizovaných nasadení, rýchly štart, produkčné a pokročilé vzory
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api): API prijateľné pre začiatočníkov s možnosťou škálovania na nulu, kontrola zdravia, monitorovanie a riešenie problémov
  - [Architektúra mikroslužieb](../../examples/container-app/microservices): Produkčne pripravené viacslužbové nasadenie (API Gateway, Product, Order, User, Notification), asynchrónna správa správ, Service Bus, Cosmos DB, Azure SQL, distribuované trasovanie, modré-zelené/canary nasadenie
- **Najlepšie postupy**: Bezpečnosť, monitorovanie, optimalizácia nákladov a pokyny CI/CD pre kontajnerové pracovné záťaže
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v rôznych jazykoch (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: Kompletné testovacie scenáre, príkazy pre monitorovanie, návody na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované pre nové príklady kontajnerových aplikácií pod "Lokálne príklady - Kontajnerové aplikácie"
- **examples/README.md**: Aktualizované s dôrazom na príklady kontajnerových aplikácií, pridané položky do porovnávacej matice a aktualizované technologické/architektonické odkazy
- **Štruktúra kurzu a sprievodca štúdiom**: Aktualizované s odkazmi na nové príklady kontajnerových aplikácií a vzory nasadenia v príslušných kapitolách

#### Overené
- ✅ Všetky nové príklady nasaditeľné pomocou `azd up` a dodržiavajú najlepšie postupy
- ✅ Aktualizované krížové odkazy a navigácia v dokumentácii
- ✅ Príklady pokrývajú scenáre od začiatočníkov po pokročilých, vrátane produkčných mikroslužieb

#### Poznámky
- **Rozsah**: Len anglická dokumentácia a príklady
- **Ďalšie kroky**: Rozšírenie o pokročilé kontajnerové vzory a CI/CD automatizáciu v budúcich verziách

### [v3.5.0] - 2025-11-19

#### Prebranding produktu: Microsoft Foundry
**Táto verzia zavádza komplexnú zmenu názvu produktu z "Microsoft Foundry" na "Microsoft Foundry" v celej anglickej dokumentácii, odrážajúc oficiálny rebranding Microsoftu.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný rebranding z "Microsoft Foundry" na "Microsoft Foundry"
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Celkovo: 23 aktualizovaných odkazov v 7 dokumentačných súboroch

- **📁 Zmeny v štruktúre priečinkov**:
  - `docs/ai-foundry/` premenovaný na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované podľa novej štruktúry
  - Navigačné odkazy overené vo všetkej dokumentácii

- **📄 Premenovania súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky vnútorné odkazy aktualizované na nový názov súboru

#### Aktualizované súbory
- **Kapitoly dokumentácie** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizácie názvu produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizácie odkazov (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizácie krížových odkazov
  - `docs/getting-started/first-project.md` - 2 aktualizácie navigačných odkazov kapitol
  - `docs/getting-started/installation.md` - 2 aktualizácie odkazov na nasledujúce kapitoly
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizácie odkazov (navigácia, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizácia navigačného odkazu
  - `docs/troubleshooting/debugging.md` - 1 aktualizácia navigačného odkazu

- **Súbory štruktúry kurzu** (2 súbory):
  - `README.md` - 17 aktualizácií odkazov (prehľad kurzu, názvy kapitol, sekcia šablón, postrehy komunity)
  - `course-outline.md` - 14 aktualizácií odkazov (prehľad, ciele učenia, zdroje kapitol)

#### Overené
- ✅ Žiadne zostávajúce odkazy na priečinok "ai-foundry" v anglickej dokumentácii
- ✅ Žiadne zostávajúce odkazy na názov produktu "Microsoft Foundry" v anglickej dokumentácii
- ✅ Všetky navigačné odkazy funkčné v novej štruktúre priečinkov
- ✅ Premenovania súborov a priečinkov úspešne dokončené
- ✅ Krížové odkazy medzi kapitolami overené

#### Poznámky
- **Rozsah**: Zmeny aplikované len na anglickú dokumentáciu v priečinku `docs/`
- **Preklady**: Prekladové priečinky (`translations/`) neboli aktualizované v tejto verzii
- **Workshop**: Materiály workshopu (`workshop/`) neboli aktualizované v tejto verzii
- **Príklady**: Súbory príkladov môžu stále odkazovať na staré názvy (bude opravené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL a odkazy na GitHub repository zostávajú nezmenené

#### Sprievodca migráciou pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu odkazujúcu na starú štruktúru:
1. Aktualizujte odkazy na priečinky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na súbory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte názov produktu: "Microsoft Foundry" → "Microsoft Foundry"
4. Overte, či všetky vnútorné odkazy v dokumentácii stále fungujú

---

### [v3.4.0] - 2025-10-24

#### Vylepšenia náhľadu infraštruktúry a overovania
**Táto verzia zavádza komplexnú podporu pre novú funkciu náhľadu v Azure Developer CLI a vylepšuje používateľský zážitok z workshopu.**

#### Pridané
- **🧪 Dokumentácia funkcie azd provision --preview**: Komplexné pokrytie novej možnosti náhľadu infraštruktúry
  - Referencia príkazov a príklady použitia v prehľadovom liste
  - Podrobná integrácia do sprievodcu provisioningom s prípadmi použitia a výhodami
  - Integrácia kontroly pred letom pre bezpečnejšie overenie nasadenia
  - Aktualizácie sprievodcu začiatkom práce so zásadami nasadenia so zameraním na bezpečnosť
- **🚧 Banner stavu workshopu**: Profesionálny HTML banner s informáciou o stave vývoja workshopu
  - Gradientný dizajn s indikátormi vývoja pre jasnú komunikáciu používateľom
  - Časová značka poslednej aktualizácie pre transparentnosť
  - Dizajn prispôsobený pre mobilné zariadenia všetkých typov

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcia náhľadu integrovaná naprieč dokumentáciou nasadenia
- **Overenie pred nasadením**: Automatizované skripty teraz zahŕňajú testovanie náhľadu infraštruktúry
- **Pracovné postupy vývojára**: Aktualizované sekvencie príkazov na zahrnutie náhľadu ako najlepšieho postupu
- **Skúsenosť z workshopu**: Jasné nastavenie očakávaní pre užívateľov o stave vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Pracovný postup s náhľadom ako preferovaný prístup
- **Tok dokumentácie**: Overovanie infraštruktúry presunuté na začiatok procesu učenia
- **Prezentácia workshopu**: Profesionálna komunikácia stavu s jasným časovým plánom vývoja

#### Vylepšené
- **Prístup s prioritou bezpečnosti**: Zmeny infraštruktúry možno teraz overiť pred nasadením
- **Spolupráca tímu**: Výsledky náhľadu môžu byť zdieľané na revíziu a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Zmiernenie rizika**: Zníženie zlyhaní nasadenia cez predbežné overovanie

#### Technická implementácia
- **Integrácia viacerých dokumentov**: Funkcia náhľadu dokumentovaná v 4 kľúčových súboroch
- **Vzor príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia najlepších postupov**: Náhľad zahrnutý do validačných pracovných tokov a skriptov
- **Vizuálne indikátory**: Jasné označenie NOVÉ funkcie pre lepšiu dohľadateľnosť

#### Infrastruktúra workshopu
- **Komunikácia stavu**: Profesionálny HTML banner s gradientným štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja zabraňuje nejasnostiam
- **Profesionálna prezentácia**: Zachováva dôveryhodnosť repozitára a zároveň nastavuje očakávania
- **Transparentnosť časového plánu**: Časová značka poslednej aktualizácie v októbri 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívna skúsenosť učenia
**Táto verzia prináša komplexné materiály workshopu s prehliadačom-based interaktívnymi sprievodcami a štruktúrovanými učebnými cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Prehliadačom spustený workshop s možnosťou náhľadu MkDocs
- **📝 Štruktúrované inštrukcie workshopu**: 7-kroková usmernená učebná cesta od objavovania po prispôsobenie
  - 0-Úvod: Prehľad workshopu a nastavenie
  - 1-Výber AI šablóny: Proces objavovania a výberu šablóny
  - 2-Validácia AI šablóny: Postupy nasadenia a overovania
  - 3-Rozklad AI šablóny: Pochopenie architektúry šablóny
  - 4-Konfigurácia AI šablóny: Nastavenia a prispôsobenie
  - 5-Prispôsobenie AI šablóny: Pokročilé úpravy a iterácie
  - 6-Zrušenie infraštruktúry: Vyčistenie a správa zdrojov
  - 7-Zhrnutie: Súhrn a ďalšie kroky
- **🛠️ Nástroje pre workshop**: Konfigurácia MkDocs s témou Material pre vylepšený zážitok učenia
- **🎯 Praktická učebná cesta**: 3-kroková metodológia (Objavovanie → Nasadenie → Prispôsobenie)
- **📱 Integrácia GitHub Codespaces**: Plynulé nastavenie vývojového prostredia

#### Vylepšené
- **AI Workshop Lab**: Rozšírený o komplexnú 2-3 hodinovú štruktúrovanú učebnú skúsenosť
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné krok za krokom vedenie od výberu šablóny po produkčné nasadenie
- **Skúsenosť vývojára**: Integrované nástroje pre zjednodušené pracovné postupy vývoja

#### Vylepšené
- **Prístupnosť**: Prehliadačové rozhranie s vyhľadávaním, funkcionalitou kopírovania a prepínačom témy
- **Samostatné štúdium**: Flexibilná štruktúra workshopu prispôsobujúca sa rôznym tempám učenia
- **Praktické uplatnenie**: Reálne scenáre nasadenia AI šablón
- **Integrácia komunity**: Integrácia Discordu pre podporu workshopu a spoluprácu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania pri prechode myšou nad kódovými ukážkami
- **Prepínač témy**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Vizualizácie**: Snímky obrazovky a diagramy pre lepšie pochopenie
- **Integrácia pomoci**: Priamy prístup na Discord komunitu pre podporu

### [v3.2.0] - 2025-09-17

#### Hlavná reorganizácia navigácie a systém učenia založený na kapitolách
**Táto verzia zavádza komplexnú štruktúru učenia rozdelenú do kapitol so zlepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia rozdelený na kapitoly**: Celý kurz preorganizovaný do 8 progresívnych učebných kapitol
  - Kapitola 1: Základy a rýchly štart (⭐ - 30-45 minút)
  - Kapitola 2: AI-prvý vývoj (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurácia a autentifikácia (⭐⭐ - 45-60 minút)
  - Kapitola 4: Infraštuktúra ako kód a nasadenie (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Multi-agentné AI riešenia (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Validácia a plánovanie pred nasadením (⭐⭐ - 1 hodina)
  - Kapitola 7: Riešenie problémov a ladenie (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkčné a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexný navigačný systém**: Konzistentné hlavičky a päty navigácie vo všetkej dokumentácii
- **🎯 Sledovanie progresu**: Kontrolný zoznam dokončenia kurzu a systém overovania učenia
- **🗺️ Vedenie učebnej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Krížová navigácia**: Príbuzné kapitoly a predpoklady jasne prepojené

#### Vylepšené
- **Štruktúra README**: Pretransformovaná na štruktúrovanú učebnú platformu s organizáciou podľa kapitol
- **Navigácia dokumentácie**: Každá stránka teraz obsahuje kontext kapitoly a vedenie progresu
- **Organizácia šablón**: Príklady a šablóny zmapované na príslušné učebné kapitoly

- **Integrácia zdrojov**: Rýchle príručky, často kladené otázky a študijné príručky prepojené s príslušnými kapitolami
- **Integrácia workshopov**: Praktické laboratórne práce pre mapovanie viacerých cieľov učenia kapitol

#### Zmenené
- **Progres učenia**: Prechod z lineárnej dokumentácie na flexibilné učenie podľa kapitol
- **Umiestnenie konfigurácie**: Presunutý sprievodca konfiguráciou ako kapitola 3 pre lepší priebeh učenia
- **Integrácia obsahu s AI**: Lepšia integrácia obsahu špecifického pre AI v celom procese učenia
- **Produkčný obsah**: Pokročilé vzory zoskupené v kapitole 8 pre podnikových študentov

#### Vylepšené
- **Používateľská skúsenosť**: Jasná navigačná cesta a indikátory pokroku kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre ľahšie prechádzanie kurzom
- **Profesionálna prezentácia**: Štruktúra kurzu vo vysokoškolskej kvalite vhodná pre akademické aj korporátne školenia
- **Efektívnosť učenia**: Skrátený čas na nájdenie relevantného obsahu vďaka lepšej organizácii

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná navigácia kapitol vo viac ako 40 dokumentačných súboroch
- **Navigácia v pätičke**: Konzistentné usmerňovanie postupu a indikátory dokončenia kapitoly
- **Vnútorné prepojenie**: Komplexný systém vnútorných odkazov spájajúcich súvisiace koncepty
- **Mapovanie kapitol**: Šablóny a príklady jasne spojené s cieľmi učenia

#### Vylepšenie študijnej príručky
- **📚 Komplexné ciele učenia**: Štruktúrna obnova študijnej príručky v súlade s 8-kapitolovým systémom
- **🎯 Hodnotenie podľa kapitol**: Každá kapitola obsahuje konkrétne ciele učenia a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný harmonogram učenia s merateľnými výsledkami a kontrolnými zoznamami
- **❓ Otázky na hodnotenie**: Otázky na overenie znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s reálnymi scenármi nasadenia a riešenia problémov
- **📊 Postup zručností**: Jasný pokrok od základných konceptov po podnikové vzory s dôrazom na kariérny rozvoj
- **🎓 Certifikačný rámec**: Profesijný rozvoj a systém uznávania v komunite
- **⏱️ Časový manažment**: Štruktúrovaný 10-týždňový plán s overovaním míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené riešenia Multi-Agent AI
**Táto verzia zlepšuje multi-agentné maloobchodné riešenie lepším pomenovaním agentov a rozšírenou dokumentáciou.**

#### Zmenené
- **Terminológia Multi-Agent**: Výraz „Cora agent“ nahradený výrazom „Customer agent“ v celom maloobchodnom multi-agentnom riešení pre väčšiu prehľadnosť
- **Architektúra agenta**: Aktualizovaná všetka dokumentácia, ARM šablóny a ukážky kódu používajú jednotné pomenovanie „Customer agent“
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agenta s aktualizovanými konvenciami pomenovania
- **Konzistencia dokumentácie**: Zabezpečené, že všetky odkazy používajú profesionálne a popisné názvy agentov

#### Vylepšené
- **Balík ARM šablón**: Aktualizovaný retail-multiagent-arm-template s odkazmi na Customer agent
- **Architektonické diagramy**: Obnovené Mermaid diagramy s aktualizovaným pomenovaním agentov
- **Ukážky kódu**: Triedy Python a príklady implementácie teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia používajúce konvencie CUSTOMER_AGENT_NAME

#### Vylepšené
- **Vývojárska skúsenosť**: Jasnejšie stanovenie rolí a zodpovedností agentov v dokumentácii
- **Pripravenosť pre produkciu**: Lepšie zladenie s podnikmi akceptovanými konvenciami pomenovania
- **Učebné materiály**: Intuitívnejšie pomenovanie agentov pre výučbové účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované Mermaid architektonické diagramy s referenciami CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v príkladoch Pythonu
- Upravené ARM JSON konfigurácie pre typ agenta „customer“
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_* vzory
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Hlavné zmeny - Zameranie na vývojára AI a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný učebný zdroj zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 Učebná cesta zameraná na AI**: Kompletná reštrukturalizácia s prioritou pre vývojárov a inžinierov AI
- **Sprievodca integráciou Microsoft Foundry**: Komplexná dokumentácia pre prepojenie AZD so službami Microsoft Foundry
- **Vzory nasadenia AI modelov**: Podrobný sprievodca výberom modelov, konfiguráciou a stratégiami produkčného nasadenia
- **AI Workshop laboratórium**: 2-3 hodinový praktický workshop na prevod AI aplikácií na riešenia nasaditeľné pomocou AZD
- **Najlepšie praktiky v produkcii AI**: Podnikové vzory pre škálovanie, monitorovanie a zabezpečenie AI pracovných záťaží
- **Sprievodca riešením problémov špecifických pre AI**: Komplexné riešenie problémov s modelmi Microsoft Foundry, kognitívnymi službami a AI nasadením
- **Galéria AI šablón**: Výber Microsoft Foundry šablón s hodnotením podľa náročnosti
- **Materiály pre workshopy**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **Štruktúra README**: Zamerané na vývojárov AI s 45% údajmi o záujme komunity z Discordu Microsoft Foundry
- **Učebné cesty**: Vyhradená cesta vývoja AI spolu s tradičnými cestami pre študentov a DevOps inžinierov
- **Odporúčané šablóny**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrácia komunity**: Vylepšená podpora komunity na Discorde s kanálmi a diskusiami špecifickými pre AI

#### Zameranie na bezpečnosť a produkciu
- **Vzory pre spravovanú identitu**: Špecifické pre AI autentifikačné a bezpečnostné konfigurácie
- **Optimalizácia nákladov**: Sledovanie používania tokenov a kontrola rozpočtu pre AI záťaže
- **Nasadenie v niekoľkých regiónoch**: Stratégie globálneho nasadenia AI aplikácií
- **Monitorovanie výkonu**: AI špecifické metriky a integrácia s Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logický postup od začiatočníka po pokročilé vzory nasadenia AI
- **Overené URL**: Všetky externé odkazy overené a prístupné
- **Kompletná referencia**: Všetky vnútorné odkazy v dokumentácii overené a funkčné
- **Pripravené pre produkciu**: Podnikové vzory nasadenia s príkladmi zo skutočného sveta

### [v2.0.0] - 2025-09-09

#### Hlavné zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenie
**Táto verzia predstavuje významnú rekonštrukciu štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný učebný rámec**: Všetky dokumentačné stránky teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigačný systém**: Pridané odkazy na predchádzajúcu/nasledujúcu lekciu v celej dokumentácii pre riadený postup učenia
- **Študijná príručka**: Komplexná príručka so študijnými cieľmi, praktickými cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emoji ikony pre lepšiu prístupnosť a profesionálny vzhľad
- **Vylepšená štruktúra obsahu**: Zlepšená organizácia a priebeh učebných materiálov

#### Zmenené
- **Formát dokumentácie**: Štandardizovaná všetka dokumentácia s konzistentnou učebnou štruktúrou
- **Priebeh navigácie**: Implementovaný logický postup v celom materiáli na učenie
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného, profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizované všetky vnútorné odkazy na podporu nového navigačného systému

#### Vylepšené
- **Prístupnosť**: Odstránené závislosti na emoji pre lepšiu kompatibilitu s čítačkami obrazovky
- **Profesionálny vzhľad**: Čistá, akademická prezentácia vhodná pre podnikové učenie
- **Skúsenosť s učením**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický priebeh a spojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný repozitár pre učenie AZD

#### Pridané
- **Základná štruktúra dokumentácie**
  - Kompletná séria sprievodcov začiatkom práce
  - Komplexná dokumentácia nasadenia a provisioningu
  - Podrobné zdroje na riešenie problémov a sprievodcovia ladením
  - Nástroje a postupy pred nasadením na overenie

- **Modul Začíname**
  - Základy AZD: Kľúčové koncepty a terminológia
  - Sprievodca inštaláciou: Inštrukcie pre platformu
  - Sprievodca konfiguráciou: Nastavenie prostredia a autentifikácia
  - Prvý projekt: Krok za krokom praktické učenie

- **Modul Nasadenie a Provisioning**
  - Sprievodca nasadením: Kompletná dokumentácia pracovného postupu
  - Sprievodca provisioningom: Infraštruktúra ako kód s Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúry viacerých služieb

- **Modul Pred Nasadením**
  - Plánovanie kapacity: Overovanie dostupnosti Azure zdrojov
  - Výber SKU: Kompletný sprievodca úrovňami služieb
  - Pre-flight kontroly: Automatizované validačné skripty (PowerShell a Bash)
  - Nástroje na odhad nákladov a plánovanie rozpočtu

- **Modul Riešenie problémov**
  - Bežné problémy: Často sa vyskytujúce problémy a riešenia
  - Sprievodca ladením: Systematické metodológie riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a Referencie**
  - Príkazová rýchlopríručka: Rýchla referencia základných príkazov
  - Slovník: Komplexné definície terminológie a skratiek
  - Často kladené otázky: Podrobné odpovede na bežné otázky
  - Externé odkazy na zdroje a komunitné prepojenia

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webovej stránky
  - Konfigurácia kontajnerovej aplikácie
  - Vzory integrácie databáz
  - Príklady architektúry mikroservisov
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: Inštalačné a konfiguračné návody pre Windows, macOS a Linux
- **Viacero úrovní zručností**: Obsah určený pre študentov až po profesionálnych vývojárov
- **Praktické zameranie**: Praktické príklady a scenáre zo života
- **Komplexné pokrytie**: Od základných konceptov po pokročilé podnikové vzory
- **Prístup k bezpečnosti na prvom mieste**: Najlepšie bezpečnostné praktiky integrované v celom obsahu
- **Optimalizácia nákladov**: Pokyny k nákladovo efektívnym nasadeniam a správe zdrojov

#### Kvalita dokumentácie
- **Podrobné príklady kódu**: Praktické, otestované ukážky kódu
- **Kroky krok za krokom**: Jasné, realizovateľné návody
- **Komplexná práca s chybami**: Riešenie problémov pri bežných chybách
- **Integrácia najlepších praktík**: Priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: Aktualizované na najnovšie Azure služby a funkcie azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánovaná)
#### Expanzia AI platforiem
- **Podpora viacerých modelov**: Vzory integrácie pre Hugging Face, Azure Machine Learning a vlastné modely
- **Frameworky AI agentov**: Šablóny pre LangChain, Semantic Kernel a AutoGen nasadenia
- **Pokročilé vzory RAG**: Možnosti vektorových databáz okrem Azure AI Search (Pinecone, Weaviate a pod.)
- **AI pozorovateľnosť**: Vylepšené monitorovanie výkonu modelov, používania tokenov a kvality odpovedí

#### Vývojárska skúsenosť
- **Rozšírenie VS Code**: Integrovaný vývojový zážitok AZD + Microsoft Foundry
- **Integrácia GitHub Copilot**: AI-podporovaná generácia šablón AZD
- **Interaktívne tutoriály**: Praktické kódovacie cvičenia s automatickou validáciou pre AI scenáre
- **Videá**: Doplnkové video tutoriály pre vizuálnych študentov zamerané na AI nasadenia

### Verzia 4.0.0 (Plánovaná)
#### Podnikové AI vzory
- **Rámec správy**: Správa AI modelov, súlad a audity
- **AI pre viacerých nájomníkov**: Vzory pre obsluhu viacerých zákazníkov s izolovanými AI službami
- **Edge AI nasadenie**: Integrácia s Azure IoT Edge a kontajnerovými inštanciami
- **Hybridné cloud AI**: Viaccloudové a hybridné vzory nasadenia pre AI záťaže

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: Integrácia MLOps s Azure Machine Learning pipelinemi
- **Pokročilá bezpečnosť**: Vzory zero-trust, súkromné koncové body a pokročilá ochrana proti hrozbám
- **Optimalizácia výkonu**: Pokročilé ladenie a škálovanie pre AI aplikácie s vysokou priepustnosťou
- **Globálna distribúcia**: Vzory pre doručovanie obsahu a edge caching pre AI aplikácie

### Verzia 3.0.0 (Plánovaná) - Nahradená aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo verzii v3.0.0
- ✅ **Obsah zameraný na AI**: Komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interaktívne tutoriály**: Praktický AI workshop laboratórium (Dokončené)
- ✅ **Pokročilý bezpečnostný modul**: Špecifické pre AI bezpečnostné vzory (Dokončené)
- ✅ **Optimalizácia výkonu**: Stratégie ladenia AI záťaže (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementovaná vo v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Ďalšie príklady**: Nasadenie AI špecifických scenárov (Dokončené)
- ✅ **Rozšírené FAQ**: AI špecifické otázky a riešenie problémov (Dokončené)
- **Integrácia nástrojov**: Vylepšené návody integrácie IDE a editorov
- ✅ **Rozšírené monitorovanie**: AI špecifické vzory monitorovania a vyrozumení (Dokončené)

#### Stále plánované pre budúce vydanie
- **Mobilné priateľská dokumentácia**: Responzívny dizajn pre mobilné učenie
- **Offline prístup**: Sťahovateľné balíčky dokumentácie
- **Vylepšená integrácia IDE**: Rozšírenie VS Code pre AZD + AI pracovné postupy
- **Panel komunity**: Reálne komunitné metriky a sledovanie príspevkov

## Prispievanie do Zmenového Záznamu

### Hlásenie zmien
Pri prispievaní do tohto repozitára prosím zabezpečte, aby položky zmenového záznamu obsahovali:

1. **Číslo verzie**: Podľa semantickej verzie (major.minor.patch)
2. **Dátum**: Dátum vydania alebo aktualizácie vo formáte RRRR-MM-DD
3. **Kategória**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Jasný popis**: Stručný popis toho, čo sa zmenilo
5. **Hodnotenie dopadu**: Ako zmeny ovplyvnia existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, sekcie dokumentácie alebo schopnosti
- Nové príklady, šablóny alebo učebné zdroje
- Dodatočné nástroje, skripty alebo utilitky

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Zastaralé
- Funkcie alebo prístupy, ktoré sa postupne vyraďujú
- Sekcie dokumentácie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastaralé informácie alebo zastarané prístupy
- Nadbytočný alebo zjednotený obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo chýb
- Vylepšenia presnosti alebo funkcionality


#### Bezpečnosť
- Vylepšenia alebo opravy súvisiace s bezpečnosťou
- Aktualizácie najlepších bezpečnostných postupov
- Riešenie bezpečnostných zraniteľností

### Pokyny pre sémantické verzovanie

#### Hlavná verzia (X.0.0)
- Prelomové zmeny, ktoré vyžadujú zásah používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny, ktoré menia základný prístup alebo metodológiu

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo prírastky obsahu
- Vylepšenia zachovávajúce spätnú kompatibilitu
- Dodatočné príklady, nástroje alebo zdroje

#### Patch verzia (X.Y.Z)
- Opravovanie chýb a korekcie
- Menšie vylepšenia existujúceho obsahu
- Objdenia a malé vylepšenia

## Spätná väzba a návrhy komunity

Aktívne podporujeme spätnú väzbu komunity na vylepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Nahláste problémy alebo navrhnite vylepšenia (problémy špecifické pre AI sú vítané)
- **Discord diskusie**: Zdieľajte nápady a zapojte sa do komunity Microsoft Foundry
- **Pull Requests**: Kontribuujte priamo vylepšenia obsahu, najmä AI šablóny a príručky
- **Microsoft Foundry Discord**: Zúčastnite sa kanála #Azure pre diskusie o AZD + AI
- **Fóra komunity**: Zapojte sa do širších diskusií vývojárov Azure

### Kategórie spätnej väzby
- **Presnosť AI obsahu**: Opravy informácií o integrácii a nasadení AI služieb
- **Vzdelávacia skúsenosť**: Návrhy na zlepšenie toku učenia AI vývojárov
- **Chýbajúci AI obsah**: Žiadosti o ďalšie AI šablóny, vzory alebo príklady
- **Prístupnosť**: Vylepšenia pre rozmanité vzdelávacie potreby
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu pracovných tokov AI vývoja
- **Produkčné AI vzory**: Žiadosti o podnikové AI nasadzovacie vzory

### Záväzok reagovania
- **Odpoveď na problémy**: Do 48 hodín od nahlásenia problémov
- **Žiadosti o funkcie**: Hodnotenie do jedného týždňa
- **Príspevky komunity**: Prejav recenzie do jedného týždňa
- **Bezpečnostné problémy**: Okamžitá priorita s urýchlenou reakciou

## Plán údržby

### Pravidelné aktualizácie
- **Mesačné kontroly**: Presnosť obsahu a validácia odkazov
- **Štvrťročné aktualizácie**: Významné prírastky obsahu a vylepšenia
- **Polročné kontroly**: Komplexná reštrukturalizácia a rozšírenie
- **Ročné vydania**: Hlavné verzie s významnými zlepšeniami

### Monitorovanie a zabezpečenie kvality
- **Automatizované testovanie**: Pravidelná validácia kódových príkladov a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné zapracovanie návrhov užívateľov
- **Aktualizácie technológií**: Súlad s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelná kontrola princípov inkluzívneho dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy po dobu 12 mesiacov
- **Staršie verzie**: Iba podpora komunity, žiadne oficiálne aktualizácie

### Pokyny pre migráciu
Pri vydaní hlavných verzií poskytujeme:
- **Migracné príručky**: Krok za krokom inštrukcie pre prechod
- **Poznámky o kompatibilite**: Detaily o prelomových zmenách
- **Nástrojová podpora**: Skripty alebo pomôcky na uľahčenie migrácie
- **Podpora komunity**: Venujúce sa fóra pre otázky týkajúce sa migrácie

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Hlavný README](README.md)

**Zostaňte informovaní**: Sledujte túto repozitár pre oznámenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
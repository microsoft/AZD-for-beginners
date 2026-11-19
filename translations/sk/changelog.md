# Zoznam zmien - AZD pre začiatočníkov

## Úvod

Tento zoznam zmien dokumentuje všetky významné zmeny, aktualizácie a vylepšenia v repozitári AZD pre začiatočníkov. Dodržiavame princípy sémantického verzovania a udržiavame tento zoznam, aby sme používateľom pomohli pochopiť, čo sa zmenilo medzi verziami.

## Ciele učenia sa

Prezretím tohto zoznamu zmien budete:
- Byť informovaný o nových funkciách a pridaných obsahoch
- Pochopiť vylepšenia existujúcej dokumentácie
- Sledovať opravy chýb a korekcie pre zabezpečenie presnosti
- Sledovať vývoj učebných materiálov v priebehu času

## Výsledky učenia sa

Po prezretí zápisov zoznamu zmien budete schopní:
- Identifikovať nový obsah a dostupné zdroje na učenie
- Pochopiť, ktoré sekcie boli aktualizované alebo vylepšené
- Naplánovať svoju vzdelávaciu cestu na základe najaktuálnejších materiálov
- Prispievať spätnou väzbou a návrhmi na budúce vylepšenia

## História verzií

### [v3.25.0] - 2026-11-09

#### Rozšírenie Microsoft Foundry 1.0 je teraz všeobecne dostupné

Balík `microsoft.foundry` 1.0 je **živý a všeobecne dostupný**, ako bolo oznámené [5. novembra 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kurz teraz učí vydaný GA workflow, nie nadchádzajúce vydanie. Začnite s AZD **1.37.0 alebo novším** a `azd ext install microsoft.foundry`.

#### Dostupné v tejto aktualizácii kurzu
- Anglické pokyny používajú GA balík ako predvolenú cestu inštalácie a vysvetľujú jeho sedem nezávisle verzovaných jadrových rozšírení.
- [Prechádzka s hosťujúcim agentom](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pokrýva vzorový API pre odpovede agentov Python Framework upstremu, aktuálnu uv, Python 3.13+, výber nových/existujúcich projektov, znovupoužitie modelu a revíziu `azure.yaml`.
- Lokálny až cloud workflow pokrýva testovanie Agent Inspector, náklady na volania modelu podporované službou Azure, vzdialené zostavovanie kódu, nasadené volania, cloudové sledovanie, náhľad nasadenia, logy a diagnostiku.
- Samostatné pokyny na hodnotenie pokrývajú generovanie a revíziu datasetov/rubrík, konfiguráciu pomenovaného hodnotenia, registráciu aktív a inšpekciu výsledkov. Staršie inštrukcie hodnotenia/optimalizácie zostávajú históriou migrácie, nie sú súčasnou základňou vydania.
- Pokyny Foundry CI/CD zahŕňajú inštaláciu rozšírenia runnera, autentifikované nasadenie, aktíva/prístup na hodnotenie a explicitnú kvalitatívnu bránu.
- Pokyny na vyčistenie odlišujú novovytvorené a znovu použité Foundry projekty. Workshop odkazuje na samostatné GA cvičenie bez nahrádzania jeho testov špecifických pre vzorový príklad.
- Navigácia kurzu, učebné ciele, požiadavky na nastavenie, podvádzací list, FAQ a študijný sprievodca zodpovedajú GA workflow. Generované preklady nie sú manuálne upravované.

#### Rozsah revízie
- Na základe GA oznámenia, prepojených Microsoft Learn pokynov a upstream konfigurácie vzoru. Nebolo vykonané žiadne živé Azure poskytovanie, nasadenie, volanie modelu alebo hodnotenie.
- GA balík neznamená GA pre každú voliteľnú funkciu, nezávislé rozšírenie alebo SDK ani nepotvrdzuje príklady pre produkčné použitie.

### [v3.24.0]- 2026-11-04

#### Opravené
- Opravená anglická navigácia kurzu, premiestnené cesty stránok, chýbajúce kotvy a zastarané externé odkazy, vrátane odkazu na kapitolu 2 k sprievodcovi výrobným AI.
- Revidované aktuálne pokyny voči vydanému AZD 1.37.2, agentom 1.0.0-beta.23 a hodnoteniam 1.0.0-beta.2. Zdokumentovaná samostatná `azd ai eval` workflow a migrácia konfigurácie optimalizácie.
- Opravené nepodporované CLI príznaky, autentifikačné hranice, pokyny pre plaintext prostredie/tajomstvá, aktualizácie infraštruktúry, konfigurácia modelu a príklady deštruktívnej obnovy.
- Aktualizovaný workshop voči aktuálnemu AI Agents vzoru, vrátane aktuálnych háčikov, vstupov konfigurácie, testov hodnotenia, red-teaming entry points a pozorovateľnosti.
- Opravené tvrdenia o implementácii príkladov a opravené súvisiace problémy s aplikáciou/infraštruktúrou/konfiguráciou. Materiál o maloobchodnej architektúre je výslovne odlíšený od kompletnej funkčnej aplikácie.
- Obnovená CodeQL jazyková matica, vybraný podporovaný Node.js 24 pre vývojový kontajner a nastavené validátory na reportovanie neúspešných verziových príkazov.

#### Pridané
- Offline kontrolór odkazov/kotiev len v angličtine, regresné testy a workflow dokumentácie, ktorý tiež buduje workshop v prísnom režime. Generované preklady a preložené obrázky sú vylúčené.

#### Rozsah validácie
- Kontroly zdrojového kódu, syntaxe, konfigurácie, lokálneho správania a sieťových odkazov nezaručujú živú nasaditeľnosť Azure, kvóty, RBAC, regionálnu dostupnosť modelu, fakturáciu, súlad s bezpečnosťou alebo pripravenosť na produkciu.
- Staršie zápisy nižšie sú historické záznamy, nie aktuálne inštrukcie k príkazom alebo vydaniam.

### [v3.23.0] - 2026-07-13

#### Obnovenie AZD 1.27.1: Aktualizácia platnosti verzie
**Táto verzia preukazuje kurz voči `azd` `1.27.1` (júl 2026, najnovšie stabilné vydanie) a aktuálnemu predbežnému AI agent rozšíreniu `azure.ai.agents` `1.0.0-beta.5`, čím aktualizuje každý banner "validated against" po vydaniach 1.26.0, 1.27.0 a 1.27.1.**

#### Zmenené
- **✅ Aktualizovaná validačná základňa** z `azd 1.25.6` (jún 2026) na `azd 1.27.1` (júl 2026) v hlavnom README, všetkých kapitolových README, lekcii vývojového kontajnera v Kapitole 1 (vrátane príkladov so zafixovanými verziami), lekcii vlastných šablón v Kapitole 4, lekcii multi-agent v Kapitole 5 a dokumentácii workshopu
- **🤖 Obnovená základňa Kapitoly 2** z `azd 1.23.12` (marec 2026) na `azd 1.27.1` v `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` a `microsoft-foundry-integration.md`; dátumy poznámok k validácii aktualizované na 2026-07-13
- **🧩 Aktualizované AI agent rozšírenie** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na aktuálne `1.0.0-beta.5` vydanie v README Kapitoly 2 a `agents.md`
- **🧪 Aktualizovaný príklad validácie workshopu** (`azd version` výstup) na `1.27.1`

#### Poznámky k relevantným azd vydaniam (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora Go pre Azure Functions na Flex Consumption, `azd config sub-filter` filtre predplatného na podnájomcu, samostatné balíky rozšírení (`azd x pack --bundle`) a `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Priame modelovanie Azure AI Foundry projektov/agentov v `azure.yaml` (inicializácia bez Bicep/Terraform), podpora nasadenia kontajnera pre App Service (`host: appservice` + `language: docker`), priame `-s/--source` pre `azd extension` príkazy a `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` príznak pre `azd extension install`, predvolene vylúčené nepodporované modely z katalógu/kvóty a niekoľko opráv chýb

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

#### Začiatočnícke doplnenie #2: Tvorba šablón, Dev kontajnery, Pulumi, Azure DevOps, servisní princípi a ďalšie
**Táto verzia uzatvára zostávajúce medzery na strednej úrovni, ktoré sa objavili v analýze azd-coverage: ako vytvárať a publikovať vlastnú šablónu, reprodukovateľné vývojové kontajnerové/prostredia Codespaces, poskytovateľ infraštruktúry Pulumi, prechádzka Azure DevOps CI/CD, autentifikácia servisných princípov, pokyny na výber hostiteľa (AKS/Spring Apps), vysvetlenia `azd restore`/`azd package`, spracovanie chýb háčikov a praktiky tímového/zdieľaného prostredia.**

#### Pridané
- **🧱 Nová lekcia Kapitoly 4** `docs/chapter-04-infrastructure/custom-templates.md` — tvorba vlastnej azd šablóny: požadovaná štruktúra (`azure.yaml`, `infra/`, `src/`), pole `metadata.template`, parametrizácia infraštruktúry pomocou `uniqueString()` tokenu zdroja a `azd-env-name` značky, testovanie lokálne s `azd init --template <local-path>`, publikovanie na GitHub a podávanie do galérie Awesome AZD
- **📦 Nová lekcia Kapitoly 1** `docs/chapter-01-foundation/dev-containers.md` — reprodukovateľné azd prostredia pomocou Dev kontajnerov a GitHub Codespaces: minimálny `.devcontainer/devcontainer.json` využívajúci oficiálnu `ghcr.io/azure/azure-dev/azd` funkciu, jazykovo špecifické funkcie, `docker-in-docker` pre hostiteľské kontajnery a `azd auth login --use-device-code` pre vzdialené prihlásenie
- **🧩 Sekcia Pulumi s azd** v `docs/chapter-04-infrastructure/provisioning.md` — konfigurácia `infra.provider: pulumi`, rozloženie priečinka Pulumi, stacky mapované na azd prostredia, požadované výstupy/značenie a identický `azd up` / `azd down` workflow
- **🎯 Pokyny pre výber hostiteľa** v `docs/chapter-04-infrastructure/provisioning.md` — priateľské porovnanie pre začiatočníkov medzi `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` a `springapp` s pokynmi, kedy si vybrať AKS alebo Azure Spring Apps
- **🛠️ Prechádzka Azure DevOps CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, služobné pripojenie s federáciou identít záťaže (OIDC), generované `azure-dev.yml` a nastavenie skupiny premenných
- **🔑 Servisné princípy (Vzor 4)** pridané do `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktívne `azd auth login` s klientským tajomstvom vs. federované/OIDC poverenia, kedy používať a bezpečné ukladanie poverení
- **🪝 Spracovanie chýb háčikov** podsekcia v `docs/chapter-04-infrastructure/deployment-guide.md` — kódy ukončenia a `set -e`, `continueOnError`, testovanie háčikov izolovane s `azd hooks run`, OS-špecifické shelly a `--debug`
- **👥 Tímové / zdieľané prostredia** sekcia v `docs/chapter-03-configuration/configuration.md` — čo je v `.azure/`, čo ignorovať v gite, prostredia pre jednotlivých vývojárov, `azd env list`/`select` a poskytovanie hodnôt prostredia v CI/CD
- **🧰 Vysvetlenia `azd restore` a rozšírené `azd package`** v `resources/cheat-sheet.md` — obnovovanie závislostí a vytváranie deployovateľného artefaktu bez nasadenia

#### Zmenené
- **🧭 Aktualizovaná tabuľka lekcií Kapitoly 4** zahŕňa novú lekciu „Tvorba vlastnej šablóny“ (Lekcia 3)
- **🧭 Aktualizovaná tabuľka lekcií Kapitoly 1** zahŕňa novú lekciu „Dev kontajnery & Codespaces“ (Lekcia 5); navigačné päty prepojené medzi `bring-your-own-app.md` a `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začiatočnícke doplnenie: Praktická lekcia multi-agenátov, „Prines si vlastnú aplikáciu“, Terraform a prechádzka CI/CD
**Táto verzia uzatvára najväčšie medzery kompletného sprievodcu pre začiatočníkov pridaním dvoch nových praktických lekcií (nasaditeľný multi-agent prechádzka a pridanie azd do existujúcej aplikácie), úvod do háčikov pre začiatočníkov, sekciu Terraform s azd, krok za krokom prechádzku GitHub Actions pipeline, vysvetlenie nových predbežných rozšírení a explicitný kontrolný zoznam na overenie nasadenia.**

#### Pridané
- **🤝 Nová lekcia Kapitoly 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — plne praktický, nasaditeľný prehľad s dvoma agentmi (orchestrátor + špecialisti) použitím reálnej šablóny (`contoso-creative-writer`), pokrývajúci, kedy použiť multi-agent, workflow `azd up`, porozumenie nasadeným zdrojom, cross-agent sledovanie, prispôsobenie a čistenie
- **📦 Nová lekcia Kapitoly 1** `docs/chapter-01-foundation/bring-your-own-app.md` — ako pridať azd do existujúceho projektu s `azd init` („použiť kód v aktuálnom adresári“), pochopenie `azure.yaml` a `infra/`, `azd infra generate`, detekcia hostiteľa a nasadenie s `azd up`
- **🌐 Sekcia Terraform s azd** pridaná do `docs/chapter-04-infrastructure/provisioning.md` — konfigurácia `infra.provider: terraform`, rozloženie priečinka `.tf`, požadované výstupy `AZURE_*` a označovanie `azd-env-name`, identický `azd up` / `azd down` workflow (uzatvára medzeru, kde bola deklarovaná podpora Terraform, ale bola ukázaná iba podpora Bicep)
- **⚙️ Podrobný prehľad GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitára po automatizované nasadenia: `azd pipeline config`, OIDC federované poverenia (žiadne uložené tajomstvá), generovaný `azure-dev.yml` a usmernenia k tajomstvám verzus premenným
- **🪝 Úvod pre začiatočníkov "Noví v hookoch?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — čo je hook, tabuľka fáz hookov, minimálny prvý hook a manuálne spúšťanie hookov cez `azd hooks run`
- **✅ Kontrolný zoznam "Overte svoje nasadenie"** pridaný k kroku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, kontrola endpointu zdravia a explicitné kritériá úspechu
- **🧩 Vysvetlenie nových preview rozšírení** `azure.ai.skills` a `azure.ai.connections` (čo sú a kedy ich použiť) v `docs/chapter-08-production/production-ai-practices.md`

#### Zmenené
- **🧭 Tabuľka lekcií v kapitole 5** opravená: `multi-agent-basics.md` je teraz Lekcia 1 (jediná plne praktická lekcia), s úprimným označením, že Lekcia 2 patrí do kapitoly 6 a scenár Retail je architektonický plán, nie šablóna jedným príkazom
- **🧭 Tabuľka lekcií v kapitole 1** teraz obsahuje novú lekciu "Prineste si vlastnú aplikáciu" (Lekcia 4)
- **🔗 Aktualizované navigačné pätičky**: `first-project.md` teraz odkazuje dopredu na `bring-your-own-app.md`

#### Opravené
- **🧱 Uzavretá "nárokovaná, ale chýbajúca" medzera Terraformu** — kurz predtým spomínal podporu Terraformu bez jej zobrazenia
- **🔀 Opravené zavádzajúce medziodkazy v kapitole 5**, ktoré naznačovali existenciu plnej multi-agent implementácie, kým išlo len o architektonický plán

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

#### Obnova AZD 1.25.6, Plné príkazy životného cyklu agenta & Rebranding Aspire
**Táto verzia znovu overuje kurz proti `azd` `1.25.6` (jún 2026) a rozšíreniu `azure.ai.agents` `0.1.40-preview`, rozširuje AI usmernenia od "vytvorenia agenta" po kompletný životný cyklus agenta (testovať → vyhodnotiť → optimalizovať → preskúmať → vymazať), predstavuje nové preview rozšírenia `azure.ai.skills` a `azure.ai.connections` a upozorňuje na rebranding produktu z ".NET Aspire" na "Aspire".**

#### Pridané
- **🔁 Komplexné pokrytie životného cyklu agenta** pre začiatočníkov a AI inžinierov naprieč dokumentáciou:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabuľka životného cyklu (vytvoriť → testovať → merať → zlepšovať → preskúmať → vyčistiť) pridaná do sekcie Rozšírenia a AI príkazy
  - `docs/chapter-08-production/production-ai-practices.md` — Nová sekcia "Správa životného cyklu agenta" pokrývajúca `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
  - `resources/cheat-sheet.md` — Rozšírené AI Agent príkazy s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` a `delete --force`
- **🧩 Dokumentované nové preview rozšírenia**: `azure.ai.skills` (znovupoužiteľné schopnosti agentov) a `azure.ai.connections` (články Foundry) pridané do tabuľky rozšírení a rýchleho prehľadu
- **⏱️ Usmernenia k načasovaniu odpovede** — príklady `azd ai agent invoke` teraz uvádzajú, že sa vypisujú celkové oneskorenie a čas do prvého bajtu
- **📌 Verziový banner** v hlavnom README, ktorý smeruje študentov na `azd version` a `azd upgrade`

#### Zmenené
- **✅ Aktualizovaná validačná základňa** z `azd 1.23.12` (marec 2026) na `azd 1.25.6` (jún 2026) v README všetkých kapitol a workshopovej dokumentácii
- **🤖 Aktualizovaná poznámka o rozšírení v kapitole 2** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Upravený príklad validácie workshopu** (výstup `azd version`) na `1.25.6`
- **🧭 Obnovené README "Čo je nové v azd dnes"** pre zvýraznenie kompletného životného cyklu agenta, nových AI rozšírení a nedávnych vylepšení použiteľnosti (`azd init` idempotentnosť, `azd auth login` čistenie neplatného tokenu, `azd tool` úvodný prompt)
- **📖 Kapitola 2 agents.md (Možnosť 4)** teraz smeruje študentov na príkazy životného cyklu po nasadení namiesto zastavenia na `azd up`

#### Opravy
- **🏷️ Názvoslovie produktu** — pridaná poznámka o rebrandingu Aspire (".NET Aspire" je teraz jednoducho "Aspire"); podpora azd pre Aspire zostáva nezmenená
- **🔎 Overenie vydania na živo** potvrdené s Azure Developer CLI release feedom: stabilný CLI `1.25.6` (2026-06-12) a `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Ujasnenie onboarding pre začiatočníkov, validácia nastavení & čistenie posledných AZD príkazov
**Táto verzia nadväzuje na validačný priechod AZD 1.23 so zameraním na začiatočníkov: objasňuje usmernenia k autentifikácii v AZD, pridáva skripty validácie lokálneho nastavenia, overuje kľúčové príkazy proti live AZD CLI a odstraňuje posledné zastarané odkazy na anglické príkazy mimo changelogu.**

#### Pridané
- **🧪 Skripty validácie nastavenia pre začiatočníkov** s `validate-setup.ps1` a `validate-setup.sh`, aby si študenti mohli overiť požadované nástroje pred začiatkom kapitoly 1
- **✅ Počiatočné kroky validácie nastavenia** v hlavnom README a README kapitoly 1, aby sa chýbajúce požiadavky odhalili pred `azd up`

#### Zmenené
- **🔐 Usmernenia k autentifikácii pre začiatočníkov** teraz konzistentne považujú `azd auth login` za primárnu cestu AZD workflow, s `az login` označenou ako nepovinná, pokiaľ sa priamo nepoužívajú príkazy Azure CLI
- **📚 Onboarding proces v kapitole 1** teraz smeruje študentov k validácii lokálneho nastavenia pred inštaláciou, autentifikáciou a prvým nasadením
- **🛠️ Správy validátora** teraz jasne oddeľujú blokujúce požiadavky od nepovinných varovaní Azure CLI pre AZD-only začiatočnícku cestu
- **📖 Konfiguračná, riešiteľská a príkladová dokumentácia** teraz rozlišuje požadovanú AZD autentifikáciu a nepovinné prihlásenie do Azure CLI, kde predtým boli prezentované bez kontextu

#### Opravené
- **📋 Zostávajúce odkazy na anglické zdrojové príkazy** aktualizované na aktuálne AZD formy, vrátane `azd config show` v rýchlom prehľade a `azd monitor --overview` tam, kde sa uvádzali rady k Azure Portálu
- **🧭 Začiatočnícke tvrdenia v kapitole 1** zmiernené, aby sa predišlo nadmerným sľubom garantovanej absencie chýb alebo rollback správania vo všetkých šablónach a Azure zdrojoch
- **🔎 Živá validácia CLI** potvrdená aktuálna podpora pre `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` a `azd down --force --purge`

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

#### Validácia AZD 1.23.12, rozšírenie workshopového prostredia & osvieženie AI modelu
**Táto verzia vykonáva validačný priechod dokumentácie proti `azd` `1.23.12`, aktualizuje zastarané príklady AZD príkazov, obnovuje AI usmernenia na aktuálne predvolené hodnoty a rozširuje inštrukcie workshopu za hranice GitHub Codespaces na podporu dev kontajnerov a lokálnych klonov.**

#### Pridané
- **✅ Poznámky k validácii naprieč základnými kapitolami a workshopovou dokumentáciou** pre explicitné uvedenie testovanej AZD základne pre študentov používajúcich novšie alebo staršie verzie CLI
- **⏱️ Usmernenia k timeoutu nasadenia** pre dlhodobé nasadenia AI aplikácií používajúcich `azd deploy --timeout 1800`
- **🔎 Kroky pre inšpekciu rozšírení** s `azd extension show azure.ai.agents` v AI workflow dokumentácii
- **🌐 Širší návod k workshopovému prostrediu** pokrývajúci GitHub Codespaces, dev kontajnery a lokálne klony s MkDocs

#### Zmenené
- **📚 Úvodné README kapitol** teraz konzistentne uvádzajú validáciu voči `azd 1.23.12` v sekciách základov, konfigurácie, infraštruktúry, multi-agent, prednasadenia, riešenia problémov a produkcie
- **🛠️ Odkazy na AZD príkazy** aktualizované na aktuálne formy v celej dokumentácii:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` alebo `azd env get-value(s)` podľa kontextu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kde je zameranie na prehľad Application Insights
- **🧪 Zjednodušené príklady Provision preview** na aktuálne podporované použitia ako `azd provision --preview` a `azd provision --preview -e production`
- **🧭 Update workflowu workshopu** tak, aby študenti mohli dokončiť laby v Codespaces, dev kontajneri alebo lokálnom klone namiesto predpokladu výhradne Codespaces
- **🔐 Usmernenia autentifikácie** teraz preferujú `azd auth login` pre AZD workflowy, pričom `az login` je nepovinný pri priamej práci s Azure CLI príkazmi

#### Opravené
- **🪟 Windows inštalačné príkazy** normalizované na aktuálny tvar `winget` balíka v inštalačnom návode
- **🐧 Linux inštalačné usmernenia** opravené tak, aby sa zabránilo nepodporovaným distribučne špecifickým príkazom správy balíkov `azd` a namiesto toho sa odkazovalo na releasové artefakty, kde je to vhodné
- **📦 Príklady AI modelov** obnovené z starších predvolieb ako `gpt-35-turbo` a `text-embedding-ada-002` na aktuálne príklady ako `gpt-4.1-mini`, `gpt-4.1` a `text-embedding-3-large`
- **📋 Snippety nasadenia a diagnostiky** opravené tak, aby používali aktuálne príkazy prostredia a stav v logoch, skriptoch a krokoch riešenia problémov
- **⚙️ Usmernenia pre GitHub Actions** aktualizované z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Usmernenia k súhlasu MCP/Copilot** aktualizované z `azd mcp consent` na `azd copilot consent list`

#### Vylepšené
- **🧠 Usmernenia pre kapitolu AI** teraz lepšie vysvetľujú preview citlivé správanie `azd ai`, prihlasovanie špecifické pre tenant, aktuálne využitie rozšírení a aktualizované odporúčania pre nasadenie modelov
- **🧪 Návody pre workshop** teraz používajú realistickejšie verzie príkladov a jasnejší jazyk nastavenia prostredia pre praktické laby
- **📈 Produkčné a troubleshoot dokumenty** teraz lepšie korešpondujú s aktuálnym monitorovaním, fallback modelom a príkladmi nákladových úrovní

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

#### Príkazy AZD AI CLI, Validácia obsahu & Rozšírenie šablón
**Táto verzia pridáva pokrytie príkazov `azd ai`, `azd extension` a `azd mcp` vo všetkých kapitolách súvisiacich s AI, opravuje nefunkčné odkazy a zastaraný kód v agents.md, aktualizuje rýchly prehľad a zásadne prerába sekciu Príkladové šablóny s overenými popismi a novými šablónami Azure AI AZD.**

#### Pridané
- **🤖 Pokrytie AZD AI CLI** v 7 súboroch (predtým iba v kapitole 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nová sekcia "Rozšírenia a príkazy AI" predstavujúca `azd extension`, `azd ai agent init` a `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnosť 4: `azd ai agent init` s porovnávacou tabuľkou (prístup pomocou šablóny vs manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podsekcie "AZD rozšírenia pre Foundry" a "Nasadenie s prioritou na agenta"
  - `docs/chapter-05-multi-agent/README.md` — Rýchly štart teraz ukazuje oba cesty nasadenia: cez šablónu aj manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcia Nasadenie teraz obsahuje aj možnosť `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podsekcia "Príkazy AZD AI rozšírenia pre diagnostiku"
  - `resources/cheat-sheet.md` — Nová sekcia "Príkazy AI & rozšírení" s `azd extension`, `azd ai agent init`, `azd mcp` a `azd infra generate`
- **📦 Nové príkladové šablóny AZD AI** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel a podporou hlasového chatu
  - **azure-search-openai-demo-java** — Java RAG chat využívajúci Langchain4J s možnosťami nasadenia ACA/AKS
  - **contoso-creative-writer** — Multi-agentná kreatívna aplikácia na písanie využívajúca Azure AI Agent Service, Bing Grounding a Prompty
  - **serverless-chat-langchainjs** — Serverless RAG využívajúci Azure Functions + LangChain.js + Cosmos DB s podporou lokálneho vývoja Ollama
  - **chat-with-your-data-solution-accelerator** — Podnikový RAG akcelerátor s administrátorským portálom, integráciou Teams a možnosťami PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčná aplikácia na orchestráciu Multi-agent MCP so servermi v .NET, Pythone, Jave a TypeScripte
  - **azd-ai-starter** — Minimálna Azure AI infraštruktúrna štartovacia šablóna v Bicep
  - **🔗 Odkaz na galériu Awesome AZD AI** — Referencia na [awesome-azd AI galériu](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablón)

#### Opravené
- **🔗 Navigácia v agents.md**: Odkazy Predchádzajúca/Nasledujúca teraz zodpovedajú poradiu lekcií v Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Nefunkčné odkazy v agents.md**: `production-ai-practices.md` opravené na `../chapter-08-production/production-ai-practices.md` (3 výskyty)
- **📦 Zastaraný kód v agents.md**: Nahradený `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neplatné API v agents.md**: Presunutý `max_tokens` z `create_agent()` do `create_run()` ako `max_completion_tokens`
- **🔢 Počítanie tokenov v agents.md**: Nahradený hrubý odhad `len//4` s `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Opravené služby z "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (výchozí hostiteľ zmenený október 2024)
- **contoso-chat**: Aktualizovaný popis na odkazovanie na Azure AI Foundry + Prompty, zhodujúci sa s aktuálnym názvom repozitára a technologickým stackom

#### Odstránené
- **ai-document-processing**: Odstránený nefunkčný odkaz na šablónu (repo nebolo verejne prístupné ako AZD šablóna)

#### Vylepšené
- **📝 Cvičenia v agents.md**: Cvičenie 1 teraz ukazuje očakávaný výstup a krok `azd monitor`; Cvičenie 2 obsahuje kompletný registračný kód `FunctionTool`; Cvičenie 3 nahrádza nejasné pokyny konkrétnymi príkazmi `prepdocs.py`
- **📚 Zdroje agents.md**: Aktualizované dokumentačné odkazy na aktuálnu dokumentáciu Azure AI Agent Service a rýchly štart
- **📋 Tabuľka Nasledujúce kroky v agents.md**: Pridaný odkaz na AI Workshop Lab pre kompletné pokrytie kapitoly

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
**Táto verzia zlepšuje navigáciu kapitol v README.md pomocou vylepšenej tabuľkovej štruktúry.**

#### Zmenené
- **Tabuľka mapy kurzu**: Vylepšená o priame odkazy na lekcie, odhady trvania a hodnotenia zložitosti
- **Čistenie priečinkov**: Odstránené nadbytočné staré priečinky (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Overenie odkazov**: Overených všetkých viac ako 21 interných odkazov v tabuľke mapy kurzu

### [v3.16.0] - 2026-02-05

#### Aktualizácia názvu produktu
**Táto verzia aktualizuje odkazy na produkty podľa aktuálneho brandingu Microsoftu.**

#### Zmenené
- **Microsoft Foundry → Microsoft Foundry**: Všetky odkazy aktualizované v súboroch nementeľačných prekladov
- **Azure AI Agent Service → Foundry Agents**: Názov služby aktualizovaný podľa aktuálneho brandingu

#### Aktualizované súbory
- `README.md` - Hlavná stránka kurzu
- `changelog.md` - História verzií
- `course-outline.md` - Štruktúra kurzu
- `docs/chapter-02-ai-development/agents.md` - Sprievodca AI agentmi
- `examples/README.md` - Dokumentácia príkladov
- `workshop/README.md` - Úvodná stránka workshopu
- `workshop/docs/index.md` - Index workshopu
- `workshop/docs/instructions/*.md` - Všetky súbory s inštrukciami workshopu

---

### [v3.15.0] - 2026-02-05

#### Rozsiahla reštrukturalizácia repozitára: Kapitolové názvy priečinkov
**Táto verzia rozdeľuje dokumentáciu do samostatných priečinkov kapitol pre lepšiu orientáciu.**

#### Premenovanie priečinkov
Staré priečinky boli nahradené kapitolovými priečinkami s číslami:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridané nové: `docs/chapter-05-multi-agent/`

#### Migrácie súborov
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
| Všetky súbory pre nasadenie | pre-deployment/ | chapter-06-pre-deployment/ |
| Všetky súbory riešenia problémov | troubleshooting/ | chapter-07-troubleshooting/ |

#### Pridané
- **📚 README súbory kapitol**: Vytvorené README.md v každom priečinku kapitoly s:
  - Cieľmi učenia a trvaním
  - Tabuľkou lekcií s popismi
  - Príkazmi na rýchly štart
  - Navigáciou do ostatných kapitol

#### Zmenené
- **🔗 Aktualizované všetky interné odkazy**: 78+ ciest aktualizovaných naprieč všetkými dokumentačnými súbormi
- **🗺️ Hlavné README.md**: Aktualizovaná mapa kurzu s novou kapitolovou štruktúrou
- **📝 examples/README.md**: Aktualizované krížové odkazy na kapitolové priečinky

#### Odstránené
- Stará štruktúra priečinkov (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reštrukturalizácia repozitára: Navigácia kapitol
**Táto verzia pridala README súbory na navigáciu kapitol (nahradené verziou v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nový sprievodca AI agentmi
**Táto verzia pridáva komplexného sprievodcu nasadením AI agentov s Azure Developer CLI.**

#### Pridané
- **🤖 docs/microsoft-foundry/agents.md**: Kompletný sprievodca zahŕňajúci:
  - Čo sú AI agenti a ako sa líšia od chatbotov
  - Tri šablóny agentov na rýchly štart (Foundry Agents, Prompty, RAG)
  - Vzory architektúry agentov (jednoagentný, RAG, multi-agent)
  - Konfigurácia a prispôsobenie nástrojov
  - Monitorovanie a sledovanie metrík
  - Náklady a optimalizácia
  - Bežné scenáre riešenia problémov
  - Tri praktické cvičenia s kritériami úspechu

#### Štruktúra obsahu
- **Úvod**: Koncepty agentov pre začiatočníkov
- **Rýchly štart**: Nasadenie agentov s `azd init --template get-started-with-ai-agents`
- **Vzory architektúry**: Vizualizácie vzorov agentov
- **Konfigurácia**: Nastavenie nástrojov a premenné prostredia
- **Monitorovanie**: Integrácia Application Insights
- **Cvičenia**: Postupné praktické učenie (20-45 minút každé)

---

### [v3.12.0] - 2026-02-05

#### Aktualizácia DevContainer prostredia
**Táto verzia aktualizuje konfiguráciu vývojového kontajnera s modernými nástrojmi a lepšími predvoľbami pre AZD vzdelávací zážitok.**

#### Zmenené
- **🐳 Základný obraz**: Aktualizovaný z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovší stabilný Debian)
- **📛 Názov kontajnera**: Premenovaný zo "Python 3" na "AZD for Beginners" pre väčšiu zrozumiteľnosť

#### Pridané
- **🔧 Nové funkcie Dev Containera**:
  - `azure-cli` s povolenou podporou Bicep
  - `node:20` (LTS verzia pre AZD šablóny)
  - `github-cli` na správu šablón
  - `docker-in-docker` na nasadenie kontajnerových aplikácií

- **🔌 Presmerovanie portov**: Prednastavené porty pre bežný vývoj:
  - 8000 (prehliadanie MkDocs)
  - 3000 (webové aplikácie)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nové rozšírenia VS Code**:
  - `ms-python.vscode-pylance` - Vylepšené Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora Docker
  - `ms-azuretools.vscode-bicep` - Podpora jazyka Bicep
  - `ms-azure-devtools.azure-resource-groups` - Správa Azure zdrojov
  - `yzhang.markdown-all-in-one` - Úprava Markdown
  - `DavidAnson.vscode-markdownlint` - Kontrola Markdown
  - `bierner.markdown-mermaid` - Podpora Mermaid diagramov
  - `redhat.vscode-yaml` - Podpora YAML (pre azure.yaml)
  - `eamodio.gitlens` - Vizualizácia Git
  - `mhutchie.git-graph` - História Git

- **⚙️ Nastavenia VS Code**: Pridané predvolené nastavenia pre Python interpreter, formátovanie pri ukladaní a orezávanie medzier

- **📦 Aktualizovaný requirements-dev.txt**:
  - Pridaný MkDocs minify plugin
  - Pridaný pre-commit na kontrolu kvality kódu
  - Pridané balíky Azure SDK (azure-identity, azure-mgmt-resource)

#### Opravené
- **Príkaz po vytvorení**: Teraz overuje inštaláciu AZD a Azure CLI pri štarte kontajnera

---

### [v3.11.0] - 2026-02-05

#### Úprava README prístupná pre začiatočníkov
**Táto verzia výrazne vylepšuje README.md, aby bola prístupnejšia pre začiatočníkov a pridáva dôležité zdroje pre AI vývojárov.**

#### Pridané
- **🆚 Porovnanie Azure CLI a AZD**: Jasné vysvetlenie, kedy použiť ktorý nástroj s praktickými príkladmi
- **🌟 Odkazy na úžasné AZD zdroje**: Priame odkazy na komunitnú galériu šablón a zdroje pre príspevky:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - viac ako 200 pripravených na nasadenie šablón
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Príspevky komunity
- **🎯 Príručka na rýchly štart**: Zjednodušená 3-kroková sekcia (Inštalácia → Prihlásenie → Nasadenie)
- **📊 Tabuľka navigácie podľa skúseností**: Jasné usmernenie, kde začať podľa úrovne znalostí vývojára

#### Zmenené
- **Štruktúra README**: Preorganizovaná pre postupné odkrývanie - najdôležitejšie informácie najskôr
- **Úvodná sekcia**: Preformulovaná na vysvetlenie "Kúzla `azd up`" pre úplných začiatočníkov
- **Odstránený duplicitný obsah**: Odstránená duplicitná sekcia riešenia problémov
- **Príkazy na riešenie problémov**: Opravený odkaz `azd logs` na použitie platného `azd monitor --logs`

#### Opravené
- **🔐 Príkazy na autentifikáciu**: Pridané `azd auth login` a `azd auth logout` do cheat-sheet.md
- **Neplatné odkazy na príkazy**: Odstránené zostávajúce `azd logs` z časti riešenia problémov v README

#### Poznámky
- **Rozsah**: Zmeny aplikované na hlavný README.md a resources/cheat-sheet.md
- **Cieľová skupina**: Vylepšenia zamerané špeciálne na vývojárov nových v AZD

---

### [v3.10.0] - 2026-02-05

#### Aktualizácia presnosti príkazov Azure Developer CLI
**Táto verzia opravuje neexistujúce príkazy AZD v celej dokumentácii, zabezpečujúc, že všetky kódové príklady používajú platnú syntax Azure Developer CLI.**

#### Opravené
- **🔧 Neexistujúce príkazy AZD odstránené**: Komplexný audit a oprava neplatných príkazov:
  - `azd logs` (neexistuje) → nahradené `azd monitor --logs` alebo alternatívami Azure CLI
  - Podpríkazy `azd service` (neexistujú) → nahradené `azd show` a Azure CLI
  - `azd infra import/export/validate` (neexistujú) → odstránené alebo nahradené platnými alternatívami
  - Vlajky `azd deploy --rollback/--incremental/--parallel/--detect-changes` (neexistujú) → odstránené
  - Vlajky `azd provision --what-if/--rollback` (neexistujú) → aktualizované na použitie `--preview`
  - `azd config validate` (neexistuje) → nahradené `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neexistujú) → odstránené

- **📚 Súbory aktualizované opravami príkazov**:
  - `resources/cheat-sheet.md`: Hlavná revízia referencie príkazov
  - `docs/deployment/deployment-guide.md`: Opravené stratégie rollbacku a nasadenia
  - `docs/troubleshooting/debugging.md`: Opravené časti analýzy logov
  - `docs/troubleshooting/common-issues.md`: Aktualizované príkazy na riešenie problémov
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravená sekcia ladenia AZD
  - `docs/getting-started/azd-basics.md`: Opravené príkazy monitorovania
  - `docs/getting-started/first-project.md`: Aktualizované príklady monitorovania a ladenia
  - `docs/getting-started/installation.md`: Opravené príklady pomoci a verzie
  - `docs/pre-deployment/application-insights.md`: Opravené príkazy na zobrazenie logov
  - `docs/pre-deployment/coordination-patterns.md`: Opravené príkazy ladenia agenta

- **📝 Aktualizované odkazy na verziu**: 
  - `docs/getting-started/installation.md`: Zmenená pevne zadaná verzia `1.5.0` na generickú `1.x.x` s odkazom na vydania

#### Zmenené
- **Stratégie rollbacku**: Aktualizovaná dokumentácia na použitie rollbacku založeného na Gite (AZD nemá natívny rollback)
- **Zobrazenie logov**: Nahradené odkazy `azd logs` pomocou `azd monitor --logs`, `azd monitor --live` a príkazov Azure CLI
- **Sekcia výkonnosti**: Odstránené neexistujúce vlajky paralelného/incrementálneho nasadenia, poskytnuté platné alternatívy

#### Technické detaily
- **Platné príkazy AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Platné vlajky azd monitor**: `--live`, `--logs`, `--overview`
- **Odstránené funkcie**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Poznámky
- **Overenie**: Príkazy overené proti Azure Developer CLI verzii v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončenie workshopu a aktualizácia kvality dokumentácie
**Táto verzia dokončuje interaktívne moduly workshopu, opravuje všetky nefunkčné dokumentačné odkazy a zlepšuje celkovú kvalitu obsahu pre AI vývojárov používajúcich Microsoft AZD.**

#### Pridané
- **📝 CONTRIBUTING.md**: Nový dokument s pokynmi na prispievanie so:
  - Jasné inštrukcie na hlásenie problémov a návrhy zmien
  - Štandardy dokumentácie pre nový obsah
  - Pokyny pre príklady kódu a konvencie správ commitov
  - Informácie o zapojení komunity

#### Dokončené
- **🎯 Workshop modul 7 (Záver)**: Plne dokončený záverečný modul s:
  - Komplexným zhrnutím dosiahnutých cieľov workshopu
  - Sekciou zvládnutých kľúčových konceptov zahŕňajúcu AZD, šablóny a Microsoft Foundry
  - Odporúčaniami na pokračovanie v vzdelávacej ceste
  - Cvičeniami výzvy workshopu s hodnotením náročnosti
  - Spätnou väzbou od komunity a odkazmi na podporu

- **📚 Workshop modul 3 (Deštrukcia)**: Aktualizované učebné ciele s:
  - Aktiváciou GitHub Copilot s MCP servermi
  - Porozumením štruktúry priečinka šablón AZD
  - Vzorci organizácie infraštruktúry ako kódu (Bicep)
  - Pokynmi pre praktické laboratórne cvičenia

- **🔧 Workshop modul 6 (Demontáž)**: Dokončený s:
  - Cieľmi čistoty zdrojov a riadenia nákladov
  - Použitím `azd down` pre bezpečné ukončenie infraštruktúry
  - Pokynmi na obnovu mäkko zmazaných kognitívnych služieb
  - Bonusové výzvy na prieskum GitHub Copilot a Azure portálu

#### Opravené
- **🔗 Opravy rozbitých odkazov**: Riešenie 15+ zlomených interných odkazov v dokumentácii:
  - `docs/ai-foundry/ai-model-deployment.md`: Opravené cesty k microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Opravené cesty k ai-model-deployment.md a production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nahradené neexistujúce cicd-integration.md súborom deployment-guide.md
  - `examples/retail-scenario.md`: Opravené cesty k FAQ a príručke riešenia problémov
  - `examples/container-app/microservices/README.md`: Opravené cesty na domácu stránku kurzu a deployment guide
  - `resources/faq.md` a `resources/glossary.md`: Aktualizované odkazy na kapitoly AI
  - `course-outline.md`: Opravené odkazy na sprievodcu inštruktora a laboratórne cvičenia AI workshopu

- **📅 Banner stavu workshopu**: Aktualizovaný zo "Stav výstavby" na aktívny stav workshopu s dátumom február 2026

- **🔗 Navigácia vo workshope**: Opravené rozbité navigačné odkazy v README.md workshopu smerujúce na neexistujúci priečinok lab-1-azd-basics

#### Zmenené
- **Prezentácia workshopu**: Odstránené varovanie "vo výstavbe", workshop je kompletne dokončený a pripravený na použitie
- **Konzistencia navigácie**: Zaistená správna navigácia medzi všetkými modulmi workshopu
- **Odkazy na učebné cesty**: Aktualizované krížové odkazy kapitol na správne cesty microsoft-foundry

#### Overené
- ✅ Všetky anglické markdown súbory majú platné interné odkazy
- ✅ Moduly workshopu 0–7 sú dokončené s učebnými cieľmi
- ✅ Navigácia medzi kapitolami a modulmi funguje správne
- ✅ Obsah je vhodný pre AI vývojárov používajúcich Microsoft AZD
- ✅ Udržiavaný priateľský jazyk a štruktúra vhodná pre začiatočníkov
- ✅ CONTRIBUTING.md poskytuje jasné pokyny pre prispievateľov komunity

#### Technická implementácia
- **Overenie odkazov**: Automatizovaný PowerShell skript overil všetky .md interné odkazy
- **Audit obsahu**: Manuálna kontrola kompletnosti workshopu a vhodnosti pre začiatočníkov
- **Navigačný systém**: Konzistentné vzory navigácie kapitol a modulov aplikované

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu
- **Preklady**: Prekladové priečinky zatiaľ neaktualizované (automatický preklad bude synchronizovaný neskôr)
- **Dĺžka workshopu**: Kompletný workshop teraz poskytuje 3–4 hodiny praktického učenia

---

### [v3.8.0] - 2025-11-19

#### Pokročilá dokumentácia: monitorovanie, bezpečnosť a vzory viacerých agentov
**Táto verzia pridáva komplexné lekcie A triedy o integrácii Application Insights, vzory autentifikácie a koordináciu viacerých agentov pre produkčné nasadenia.**

#### Pridané
- **📊 Lekcia integrácie Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nasadenie zamerané na AZD s automatickým provisionovaním
  - Kompletné Bicep šablóny pre Application Insights + Log Analytics
  - Fungujúce Python aplikácie s vlastnou telemetriou (viac než 1 200 riadkov)
  - Vzory monitorovania AI/LLM (sledovanie tokenov/nákladov Microsoft Foundry Models)
  - 6 Mermaid diagramov (architektúra, distribuované trasovanie, tok telemetrie)
  - 3 praktické cvičenia (upozornenia, dashboardy, AI monitorovanie)
  - Príklady Kusto dotazov a stratégie optimalizácie nákladov
  - Live streamovanie metrík a ladenie v reálnom čase
  - 40–50 minút učebného času s produkčne pripravenými vzormi

- **🔐 Lekcia vzorov autentifikácie a bezpečnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzory autentifikácie (connection strings, Key Vault, managed identity)
  - Kompletné Bicep infraštruktúrne šablóny pre bezpečné nasadenia
  - Node.js aplikačný kód s integráciou Azure SDK
  - 3 kompletné cvičenia (povolenie managed identity, user-assigned identity, rotácia Key Vault)
  - Najlepšie bezpečnostné praktiky a konfigurácie RBAC
  - Príručka na riešenie problémov a analýza nákladov
  - Produkčne pripravené bezheslové autentifikačné vzory

- **🤖 Lekcia koordinačných vzorov viacerých agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinačných vzorov (sekvenčný, paralelný, hierarchický, riadený udalosťami, konsenzus)
  - Kompletná implementácia orchestračnej služby (Python/Flask, viac než 1 500 riadkov)
  - 3 špecializované implementácie agentov (výskum, autor, editor)
  - Integrácia Service Bus pre frontovanie správ
  - Správa stavu v Cosmos DB pre distribuované systémy
  - 6 Mermaid diagramov ukazujúcich interakcie agentov
  - 3 pokročilé cvičenia (správa timeoutu, logika opakovaní, circuit breaker)
  - Rozpis nákladov (240–565 $/mesiac) s optimalizačnými stratégiami
  - Integrácia Application Insights pre monitorovanie

#### Vylepšené
- **Kapitola pred nasadením**: Teraz obsahuje komplexné vzory monitorovania a koordinácie
- **Kapitola začiatok práce**: Vylepšená o profesionálne vzory autentifikácie
- **Pripravenosť na produkciu**: Kompletné pokrytie od bezpečnosti po pozorovateľnosť
- **Osnova kurzu**: Aktualizované odkazy na nové lekcie v kapitolách 3 a 6

#### Zmenené
- **Umelecký pokrok**: Lepšia integrácia bezpečnosti a monitorovania v celom kurze
- **Kvalita dokumentácie**: Konzistentné štandardy A triedy (95–97 %) v nových lekciách
- **Produčné vzory**: Kompletné pokrytie end-to-end pre podnikové nasadenia

#### Vylepšené
- **Vývojárska skúsenosť**: Jasná cesta od vývoja po produkčné monitorovanie
- **Bezpečnostné štandardy**: Profesionálne vzory autentifikácie a správy tajomstiev
- **Pozorovateľnosť**: Kompletná integrácia Application Insights s AZD
- **AI pracovné záťaže**: Špecializované monitorovanie pre Microsoft Foundry Models a viacagentové systémy

#### Overené
- ✅ Všetky lekcie obsahujú kompletný funkčný kód (nie len útržky)
- ✅ Mermaid diagramy pre vizuálne učenie (spolu 19 v 3 lekciách)
- ✅ Praktické cvičenia s verifikačnými krokmi (spolu 9)
- ✅ Produkčne pripravené Bicep šablóny nasaditeľné cez `azd up`
- ✅ Analýza nákladov a optimalizačné stratégie
- ✅ Príručky riešenia problémov a najlepšie praktiky
- ✅ Kontrolné body vedomostí s ovládacími príkazmi

#### Hodnotenie kvality dokumentácie
- **docs/pre-deployment/application-insights.md**: - Komplexný sprievodca monitorovaním
- **docs/getting-started/authsecurity.md**: - Profesionálne bezpečnostné vzory
- **docs/pre-deployment/coordination-patterns.md**: - Pokročilé architektúry viacerých agentov
- **Celkový nový obsah**: - Konzistentné vysoké štandardy kvality

#### Technická implementácia
- **Application Insights**: Log Analytics + vlastná telemetria + distribuované trasovanie
- **Autentifikácia**: Managed Identity + Key Vault + RBAC vzory
- **Viac agentov**: Service Bus + Cosmos DB + Container Apps + orchestrácia
- **Monitorovanie**: Live metriky + Kusto dotazy + upozornenia + dashboardy
- **Riadenie nákladov**: Vzory vzorkovania, retencia údajov, kontrola rozpočtu

### [v3.7.0] - 2025-11-19

#### Zlepšenia kvality dokumentácie a nový príklad Microsoft Foundry Models
**Táto verzia vylepšuje kvalitu dokumentácie v celom repozitári a pridáva kompletný príklad nasadenia Microsoft Foundry Models s chatovým rozhraním gpt-4.1.**

#### Pridané
- **🤖 Príklad chatu Microsoft Foundry Models**: Kompletné nasadenie gpt-4.1 s funkčnou implementáciou v `examples/azure-openai-chat/`:
  - Kompletná infraštruktúra Microsoft Foundry Models (nasadenie modelu gpt-4.1)
  - Python príkazové riadkové chatové rozhranie s históriou konverzácií
  - Integrácia Key Vault pre bezpečné uloženie API kľúča
  - Sledovanie využitia tokenov a odhad nákladov
  - Obmedzovanie rýchlosti a spracovanie chýb
  - Komplexné README s 35–45 minútovým návodom na nasadenie
  - 11 produkčných súborov (Bicep šablóny, Python aplikácia, konfigurácia)
- **📚 Dokumentačné cvičenia**: Pridané praktické cvičenia do sprievodcu konfiguráciou:
  - Cvičenie 1: Konfigurácia viacerých prostredí (15 minút)
  - Cvičenie 2: Praktická správa tajomstiev (10 minút)
  - Jasné kritériá úspechu a verifikačné kroky
- **✅ Overenie nasadenia**: Pridaná sekcia overenia do návodu na nasadenie:
  - Postupy kontroly zdravia
  - Kontrolný zoznam kritérií úspechu
  - Očakávané výstupy pre všetky príkazy nasadenia
  - Rýchly referenčný prehľad riešenia problémov

#### Vylepšené
- **examples/README.md**: Aktualizované na kvalitu A triedy (93 %):
  - Pridaný azure-openai-chat do všetkých relevantných sekcií
  - Aktualizovaný počet lokálnych príkladov z 3 na 4
  - Pridané do tabuľky príkladov AI aplikácií
  - Integrované do rýchleho začiatku pre stredne pokročilých používateľov
  - Pridané do sekcie Microsoft Foundry Templates
  - Aktualizované matice porovnania a časti vyhľadávania technológií
- **Kvalita dokumentácie**: Vylepšená z B+ (87 %) na A- (92 %) v celom priečinku docs:
  - Pridané očakávané výstupy ku kritickým príkladom príkazov
  - Zahrnuté kroky overenia pre zmeny konfigurácie
  - Zlepšené praktické učenie s praktickými cvičeniami

#### Zmenené
- **Postup učenia**: Lepšia integrácia príkladov AI pre pokročilých študentov
- **Štruktúra dokumentácie**: Viac praktických cvičení s jasnými výsledkami
- **Verifikačný proces**: Explicitné kritériá úspechu pridané k hlavným pracovným postupom

#### Vylepšené
- **Skúsenosť vývojára**: Nasadenie modelov Microsoft Foundry teraz trvá 35–45 minút (oproti 60–90 minútam pri zložitých alternatívach)
- **Transparentnosť nákladov**: Jasné odhady nákladov (50–200 USD/mesiac) pre príklad Microsoft Foundry Models
- **Učebná cesta**: Vývojári AI majú jasný vstupný bod s azure-openai-chat
- **Štandardy dokumentácie**: Konzistentné očakávané výstupy a kroky overenia

#### Overené
- ✅ Príklad Microsoft Foundry Models plne funkčný s `azd up`
- ✅ Všetkých 11 implementačných súborov syntakticky správnych
- ✅ Inštrukcie v README zodpovedajú skutočnej skúsenosti z nasadenia
- ✅ Odkazy v dokumentácii aktualizované na viac než 8 miestach
- ✅ Index príkladov presne odráža 4 lokálne príklady
- ✅ Žiadne duplicitné externé odkazy v tabuľkách
- ✅ Všetky navigačné odkazy správne

#### Technická implementácia
- **Architektúra Microsoft Foundry Models**: Vzor gpt-4.1 + Key Vault + Container Apps
- **Bezpečnosť**: Pripravené Managed Identity, tajomstvá v Key Vault
- **Monitorovanie**: Integrácia Application Insights
- **Riadenie nákladov**: Sledovanie tokenov a optimalizácia využitia
- **Nasadenie**: Jediný príkaz `azd up` pre kompletnú konfiguráciu

### [v3.6.0] - 2025-11-19

#### Hlavná aktualizácia: Príklady nasadenia Container App
**Táto verzia prináša komplexné, produkčne pripravené príklady nasadenia kontajnerových aplikácií pomocou Azure Developer CLI (AZD), s úplnou dokumentáciou a integráciou do učebnej cesty.**

#### Pridané
- **🚀 Príklady Container App**: Nové lokálne príklady v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletný prehľad kontajnerových nasadení, rýchly štart, produkcia a pokročilé vzory
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Priateľské REST API pre začiatočníkov s scale-to-zero, zdravotnými sondami, monitorovaním a riešením problémov
  - [Microservices Architecture](../../examples/container-app/microservices): Produkčne pripravené nasadenie viacerých služieb (API Gateway, Produkt, Objednávka, Používateľ, Notifikácia), asynchrónna správa správ, Service Bus, Cosmos DB, Azure SQL, distribuované trasovanie, blue-green/canary nasadenie
- **Najlepšie postupy**: Bezpečnosť, monitorovanie, optimalizácia nákladov a vedenie CI/CD pre kontajnerové pracovné záťaže
- **Ukážky kódu**: Kompletné `azure.yaml`, Bicep šablóny a implementácie služieb v rôznych jazykoch (Python, Node.js, C#, Go)
- **Testovanie a riešenie problémov**: Scenáre end-to-end testovania, príkazy na monitorovanie, usmernenia na riešenie problémov

#### Zmenené
- **README.md**: Aktualizované na prezentáciu a prepojenie nových príkladov Container App pod „Lokálne príklady – Kontajnerové aplikácie“
- **examples/README.md**: Aktualizované na zvýraznenie príkladov Container App, pridané porovnávacie maticové položky a aktualizované technologické a architektonické odkazy
- **Osnova kurzu a študijný sprievodca**: Aktualizované na odkazovanie nových príkladov Container App a vzorov nasadenia v príslušných kapitolách

#### Overené
- ✅ Všetky nové príklady sú nasaditeľné s `azd up` a dodržiavajú najlepšie postupy
- ✅ Krížové odkazy a navigácia v dokumentácii aktualizované
- ✅ Príklady pokrývajú scenáre od začiatočníkov až po pokročilých, vrátane produkčných mikroslužieb

#### Poznámky
- **Rozsah**: Len anglická dokumentácia a príklady
- **Ďalšie kroky**: Rozšírenie o ďalšie pokročilé kontajnerové vzory a CI/CD automatizáciu v budúcich vydaniach

### [v3.5.0] - 2025-11-19

#### Rebranding produktu: Microsoft Foundry
**Táto verzia zavádza komplexnú zmenu názvu produktu z „Microsoft Foundry“ na „Microsoft Foundry“ v celej anglickej dokumentácii, čo odráža oficiálny rebranding spoločnosti Microsoft.**

#### Zmenené
- **🔄 Aktualizácia názvu produktu**: Kompletný rebranding z „Microsoft Foundry“ na „Microsoft Foundry“
  - Aktualizované všetky odkazy v anglickej dokumentácii v priečinku `docs/`
  - Premenovaný priečinok: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Premenovaný súbor: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Spolu: 23 obsahových odkazov aktualizovaných v 7 dokumentačných súboroch

- **📁 Zmeny štruktúry priečinka**:
  - `docs/ai-foundry/` premenovaný na `docs/microsoft-foundry/`
  - Všetky krížové odkazy aktualizované pre novú štruktúru priečinka
  - Navigačné odkazy overené vo všetkej dokumentácii

- **📄 Premenovanie súborov**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Všetky vnútorné odkazy aktualizované na nový názov súboru

#### Aktualizované súbory
- **Dokumentácia kapitol** (7 súborov):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 aktualizácie navigačných odkazov
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 aktualizované odkazy na názov produktu
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Už používa Microsoft Foundry (z predchádzajúcich aktualizácií)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 aktualizované odkazy (prehľad, spätná väzba komunity, dokumentácia)
  - `docs/getting-started/azd-basics.md` - 4 aktualizované odkazy na krížové odkazy
  - `docs/getting-started/first-project.md` - 2 aktualizované navigačné odkazy kapitol
  - `docs/getting-started/installation.md` - 2 aktualizované odkazy na ďalšiu kapitolu
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 aktualizované odkazy (navigácia, komunita Discord)
  - `docs/troubleshooting/common-issues.md` - 1 aktualizovaný navigačný odkaz
  - `docs/troubleshooting/debugging.md` - 1 aktualizovaný navigačný odkaz

- **Súbory štruktúry kurzu** (2 súbory):
  - `README.md` - 17 aktualizovaných odkazov (prehľad kurzu, názvy kapitol, sekcia šablón, postrehy komunity)
  - `course-outline.md` - 14 aktualizovaných odkazov (prehľad, vzdelávacie ciele, zdroje kapitol)

#### Overené
- ✅ Žiadne zostávajúce odkazy na priečinok „ai-foundry“ v anglických dokumentoch
- ✅ Žiadne zostávajúce odkazy na názov produktu „Microsoft Foundry“ v anglických dokumentoch
- ✅ Všetky navigačné odkazy funkčné s novou štruktúrou priečinka
- ✅ Premenovania súborov a priečinkov úspešne dokončené
- ✅ Overené krížové odkazy medzi kapitolami

#### Poznámky
- **Rozsah**: Zmeny aplikované iba na anglickú dokumentáciu v priečinku `docs/`
- **Preklady**: Prekladové priečinky (`translations/`) v tejto verzii neboli aktualizované
- **Workshop**: Materiály workshopu (`workshop/`) v tejto verzii neboli aktualizované
- **Príklady**: Súbory príkladov môžu stále obsahovať staršie názvy (riešené v budúcej aktualizácii)
- **Externé odkazy**: Externé URL a GitHub odkazy zostávajú nezmenené

#### Príručka migrácie pre prispievateľov
Ak máte lokálne vetvy alebo dokumentáciu odkazujúcu na starú štruktúru:
1. Aktualizujte odkazy na priečinky: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualizujte odkazy na súbory: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Nahraďte názov produktu: „Microsoft Foundry“ → „Microsoft Foundry“
4. Overte, či všetky vnútorné odkazy v dokumentácii fungujú

---

### [v3.4.0] - 2025-10-24

#### Vylepšenia náhľadu infraštruktúry a overenia
**Táto verzia prináša komplexnú podporu pre novú funkciu náhľadu Azure Developer CLI a zlepšuje používateľskú skúsenosť workshopu.**

#### Pridané
- **🧪 Dokumentácia funkcie azd provision --preview**: Komplexné pokrytie novej schopnosti náhľadu infraštruktúry
  - Referencia príkazov a príklady použitia v prehľadovom liste
  - Detailná integrácia do sprievodcu provisioningom s prípadmi použitia a výhodami
  - Integrácia predletovej kontroly pre bezpečnejšie overenie nasadenia
  - Aktualizácie sprievodcu začiatkom pre prístup k nasadeniu s dôrazom na bezpečnosť
- **🚧 Statusový banner workshopu**: Profesionálny HTML banner indikujúci stav vývoja workshopu
  - Dizajn s gradientom a indikátormi výstavby pre jasnú komunikáciu používateľovi
  - Časová pečiatka poslednej aktualizácie pre transparentnosť
  - Dizajn prispôsobený pre mobilné zariadenia všetkých typov

#### Vylepšené
- **Bezpečnosť infraštruktúry**: Funkcionalita náhľadu integrovaná v celej dokumentácii nasadenia
- **Prednasadené overovanie**: Automatizované skripty teraz obsahujú testy náhľadu infraštruktúry
- **Vývojársky pracovný tok**: Aktualizované sekvencie príkazov vrátane náhľadu ako najlepšej praxe
- **Skúsenosť s workshopom**: Jasné nastavenie očakávaní používateľov o stave vývoja obsahu

#### Zmenené
- **Najlepšie postupy nasadenia**: Teraz odporúčaný prístup najprv s náhľadom
- **Tok dokumentácie**: Overovanie infraštruktúry presunuté skôr v procese učenia
- **Prezentácia workshopu**: Profesionálna komunikácia stavu so zreteľným časovým harmonogramom vývoja

#### Vylepšené
- **Prístup s dôrazom na bezpečnosť**: Zmeny infraštruktúry je možné overiť pred nasadením
- **Tímová spolupráca**: Výsledky náhľadu môžu byť zdieľané na revíziu a schválenie
- **Povedomie o nákladoch**: Lepšie pochopenie nákladov na zdroje pred provisioningom
- **Riziková mitigácia**: Menej chýb nasadenia vďaka predbežnému overeniu

#### Technická implementácia
- **Integrácia viacerých dokumentov**: Funkcia náhľadu zdokumentovaná vo 4 hlavných súboroch
- **Vzory príkazov**: Konzistentná syntax a príklady v celej dokumentácii
- **Integrácia najlepších praktík**: Náhľad súčasťou validačných pracovných tokov a skriptov
- **Vizuálne indikátory**: Jasné označenie NOVÉ funkcie pre ľahkú identifikáciu

#### Infraštruktúra workshopu
- **Komunikácia stavu**: Profesionálny HTML banner s gradientovým štýlom
- **Používateľská skúsenosť**: Jasný stav vývoja predchádza zmätku
- **Profesionálna prezentácia**: Zachováva dôveryhodnosť repozitára a nastavuje očakávania
- **Transparentnosť časovej osi**: Časová pečiatka poslednej aktualizácie október 2025 pre zodpovednosť

### [v3.3.0] - 2025-09-24

#### Vylepšené materiály workshopu a interaktívne učenie
**Táto verzia prináša komplexné materiály workshopu s prehliadačom-based interaktívnymi sprievodcami a štruktúrovanými učebnými cestami.**

#### Pridané
- **🎥 Interaktívny sprievodca workshopom**: Prehliadač-based skúsenosť workshopu s podporou náhľadu MkDocs
- **📝 Štruktúrované inštrukcie workshopu**: 7-kroková vedená učebná cesta od objavovania po prispôsobenie
  - 0-Úvod: Prehľad workshopu a nastavenie
  - 1-Výber šablóny AI: Proces objavovania a výberu šablóny
  - 2-Overenie šablóny AI: Postupy nasadenia a overenia
  - 3-Analýza šablóny AI: Pochopenie architektúry šablóny
  - 4-Konfigurácia šablóny AI: Konfigurácia a prispôsobenie
  - 5-Prispôsobenie šablóny AI: Pokročilé úpravy a iterácie
  - 6-Demontáž infraštruktúry: Upratanie a správa zdrojov
  - 7-Zhrnutie: Súhrn a ďalšie kroky
- **🛠️ Nástroje workshopu**: Konfigurácia MkDocs s témou Material pre lepší zážitok z učenia
- **🎯 Praktická učebná cesta**: 3-kroková metodológia (Objavovanie → Nasadenie → Prispôsobenie)
- **📱 GitHub Codespaces integrácia**: Bezproblémové nastavenie vývojového prostredia

#### Vylepšené
- **Laboratórium AI workshopu**: Rozšírené o komplexnú 2-3 hodinovú štruktúrovanú učebnú skúsenosť
- **Dokumentácia workshopu**: Profesionálna prezentácia s navigáciou a vizuálnymi pomôckami
- **Postup učenia**: Jasné vedenie krok za krokom od výberu šablóny po produkčné nasadenie
- **Skúsenosť vývojára**: Integrované nástroje pre efektívne vývojové pracovné toky

#### Vylepšené
- **Prístupnosť**: Prehliadačové rozhranie s vyhľadávaním, funkciou kopírovania a prepínačom témy
- **Samoštúdium**: Flexibilná štruktúra workshopu prispôsobujúca sa rôznym tempám učenia
- **Praktické použitie**: Scenáre nasadenia reálnych AI šablón
- **Integrácia komunity**: Integrácia Discord pre podporu a spoluprácu počas workshopu

#### Funkcie workshopu
- **Vstavané vyhľadávanie**: Rýchle vyhľadávanie kľúčových slov a lekcií
- **Kopírovanie blokov kódu**: Funkcia kopírovania myšou pri nabehnutí pre všetky príklady kódu
- **Prepínač témy**: Podpora tmavého/svetlého režimu pre rôzne preferencie
- **Vizuálne materiály**: Snímky obrazovky a diagramy pre lepšie porozumenie
- **Integrácia pomoci**: Priamy prístup k Discord komunite pre podporu

### [v3.2.0] - 2025-09-17

#### Hlavná reštrukturalizácia navigácie a systém učenia založený na kapitolách
**Táto verzia prináša komplexnú štruktúru učenia rozdelenú podľa kapitol s vylepšenou navigáciou v celom repozitári.**

#### Pridané
- **📚 Systém učenia založený na kapitolách**: Celý kurz rozdelený do 8 postupných učebných kapitol
  - Kapitola 1: Základy a rýchly štart (⭐ - 30-45 min)
  - Kapitola 2: AI-prvé vývojárstvo (⭐⭐ - 1-2 hodiny)
  - Kapitola 3: Konfigurácia a autentifikácia (⭐⭐ - 45-60 min)
  - Kapitola 4: Infraštruktúra ako kód a nasadenie (⭐⭐⭐ - 1-1,5 hodiny)
  - Kapitola 5: Multi-agentové AI riešenia (⭐⭐⭐⭐ - 2-3 hodiny)
  - Kapitola 6: Overenie a plánovanie pred nasadením (⭐⭐ - 1 hodina)
  - Kapitola 7: Riešenie problémov a ladenie (⭐⭐ - 1-1,5 hodiny)
  - Kapitola 8: Produkčné a podnikové vzory (⭐⭐⭐⭐ - 2-3 hodiny)
- **📚 Komplexný navigačný systém**: Konzistentné hlavičky a päty navigácie naprieč dokumentáciou
- **🎯 Sledovanie pokroku**: Kontrolný zoznam dokončenia kurzu a systém overenia učenia
- **🗺️ Vedenie učebnej cesty**: Jasné vstupné body pre rôzne úrovne skúseností a ciele
- **🔗 Navigácia s krížovými odkazmi**: Kapitoly a predpoklady jasne prepojené

#### Vylepšené
- **Štruktúra README**: Premenená na štruktúrovanú učebnú platformu s organizáciou podľa kapitol
- **Navigácia v dokumentácii**: Každá stránka teraz obsahuje kontext kapitoly a vedenie pokroku
- **Organizácia šablón**: Príklady a šablóny mapované na príslušné učebné kapitoly
- **Integrácia zdrojov**: Prehľady, FAQ a študijné príručky pripojené k relevantným kapitolám
- **Integrácia workshopov**: Praktické laboratóriá mapované na viacero učebných cieľov kapitol

#### Zmenené
- **Pokrok v učení**: Prechod z lineárnej dokumentácie na flexibilné štúdium založené na kapitolách
- **Umiestnenie konfigurácie**: Presunutie sprievodcu konfiguráciou ako Kapitola 3 pre lepší tok učenia
- **Integrácia AI obsahu**: Lepšia integrácia špecifického AI obsahu počas celého vzdelávacieho procesu
- **Produkčný obsah**: Pokročilé vzory zhrnuté v Kapitole 8 pre podnikových študentov

#### Vylepšené
- **Používateľský zážitok**: Jasné navigačné drobné cestičky a indikátory pokroku kapitol
- **Prístupnosť**: Konzistentné navigačné vzory pre jednoduchšie prechádzanie kurzom
- **Profesionálna prezentácia**: Štruktúra kurzu vo štýle univerzity vhodná pre akademické a korporátne školenia
- **Efektívnosť učenia**: Skrátený čas na nájdenie relevantného obsahu vďaka zlepšenej organizácii

#### Technická implementácia
- **Navigačné hlavičky**: Štandardizovaná navigácia kapitol v viac ako 40 dokumentačných súboroch
- **Navigácia v päte**: Konzistentné usmernenie pokroku a indikátory dokončenia kapitol
- **Krížové prepojenia**: Komplexný systém interných odkazov spájajúci súvisiace koncepty
- **Mapa kapitol**: Šablóny a príklady jasne prepojené s cieľmi učenia

#### Vylepšenie študijného sprievodcu
- **📚 Komplexné ciele učenia**: Prepracovaný študijný sprievodca zosúladený so systémom 8 kapitol
- **🎯 Hodnotenie podľa kapitol**: Každá kapitola obsahuje konkrétne ciele učenia a praktické cvičenia
- **📋 Sledovanie pokroku**: Týždenný plán učenia s merateľnými výsledkami a kontrolnými zoznamami dokončenia
- **❓ Otázky na hodnotenie**: Otázky na overenie znalostí pre každú kapitolu s profesionálnymi výsledkami
- **🛠️ Praktické cvičenia**: Praktické aktivity s nasadením v reálnych scenároch a riešením problémov
- **📊 Pokrok v zručnostiach**: Jasné napredovanie od základných konceptov po podnikové vzory s dôrazom na kariérny rozvoj
- **🎓 Certifikačný rámec**: Výsledky profesionálneho rozvoja a systém uznávania v komunite
- **⏱️ Manažment časovej osi**: Štruktúrovaný 10-týždňový plán učenia s overením míľnikov

### [v3.1.0] - 2025-09-17

#### Vylepšené multi-agentné AI riešenia
**Táto verzia vylepšuje multi-agentné maloobchodné riešenie lepším pomenovaním agentov a vylepšenou dokumentáciou.**

#### Zmenené
- **Terminológia multi-agentov**: Nahradenie "Cora agent" za "Customer agent" v celom maloobchodnom multi-agentnom riešení pre lepšie pochopenie
- **Architektúra agenta**: Aktualizácia celej dokumentácie, ARM šablón a príkladov kódu na konzistentné pomenovanie "Customer agent"
- **Príklady konfigurácie**: Modernizované vzory konfigurácie agentov s aktualizovanými pomenovaniami
- **Konzistentnosť dokumentácie**: Zabezpečené používanie profesionálnych a popisných mien agentov všade

#### Vylepšené
- **Balík ARM šablón**: Aktualizovaný retail-multiagent-arm-template s odkazmi na Customer agent
- **Architektonické diagramy**: Obnovené Mermaid diagramy s aktualizovaným pomenovaním agentov
- **Príklady kódu**: Python triedy a implementačné príklady teraz používajú pomenovanie CustomerAgent
- **Premenné prostredia**: Aktualizované všetky skripty nasadenia na používanie konvencií CUSTOMER_AGENT_NAME

#### Vylepšené
- **Vývojárska skúsenosť**: Jasnejšie definované úlohy a zodpovednosti agentov v dokumentácii
- **Produkčná pripravenosť**: Lepšie zosúladenie s podnikateľskými konvenciami pomenovania
- **Výukové materiály**: Intuitívnejšie pomenovanie agentov pre vzdelávacie účely
- **Použiteľnosť šablón**: Zjednodušené pochopenie funkcií agentov a vzorov nasadenia

#### Technické detaily
- Aktualizované Mermaid diagramy architektúry s odkazmi na CustomerAgent
- Nahradené názvy tried CoraAgent za CustomerAgent v Python príkladoch
- Upravené JSON konfigurácie ARM šablón na používanie typu agenta "customer"
- Aktualizované premenné prostredia z CORA_AGENT_* na CUSTOMER_AGENT_*
- Obnovené všetky príkazy nasadenia a konfigurácie kontajnerov

### [v3.0.0] - 2025-09-12

#### Veľké zmeny - Zameranie na AI vývojára a integrácia Microsoft Foundry
**Táto verzia transformuje repozitár na komplexný vzdelávací zdroj zameraný na AI s integráciou Microsoft Foundry.**

#### Pridané
- **🤖 AI-First učebná cesta**: Kompletná restrukturalizácia s prioritou AI vývojárov a inžinierov
- **Sprievodca integráciou Microsoft Foundry**: Komplexná dokumentácia pre prepojenie AZD so službami Microsoft Foundry
- **Vzory nasadenia AI modelov**: Podrobný návod pokrývajúci výber modelu, konfiguráciu a stratégie produkčného nasadenia
- **AI Workshop laboratórium**: 2-3 hodinový praktický workshop na prevod AI aplikácií na riešenia nasaditeľné cez AZD
- **Najlepšie postupy pre produkčné AI**: Podnikové vzory pre škálovanie, monitorovanie a zabezpečenie AI záťaží
- **Sprievodca riešením problémov špecifických pre AI**: Komplexné riešenie problémov pre modely Microsoft Foundry, Cognitive Services a AI nasadenie
- **Galéria AI šablón**: Vybraná kolekcia šablón Microsoft Foundry s hodnotením zložitosti
- **Materiály workshopu**: Kompletná štruktúra workshopu s praktickými laboratóriami a referenčnými materiálmi

#### Vylepšené
- **Štruktúra README**: Zameraná na AI vývojárov s 45% záujmom komunity z Discordu Microsoft Foundry
- **Učebné cesty**: Venovaná cesta AI vývojára vedľa tradičných ciest pre študentov a DevOps inžinierov
- **Odporúčania šablón**: Vybrané AI šablóny vrátane azure-search-openai-demo, contoso-chat a openai-chat-app-quickstart
- **Integrácia komunity**: Vylepšená podpora komunity na Discorde s AI špecifickými kanálmi a diskusiami

#### Zabezpečenie a produkčný fokus
- **Vzory správy identít**: AI špecifické autentifikačné a bezpečnostné konfigurácie
- **Optimalizácia nákladov**: Sledovanie využitia tokenov a kontrola rozpočtu pre AI záťaže
- **Nasadenie v multi-regióne**: Stratégie globálneho nasadenia AI aplikácií
- **Monitorovanie výkonu**: AI špecifické metriky a integrácia Application Insights

#### Kvalita dokumentácie
- **Lineárna štruktúra kurzu**: Logická postupnosť od začiatočníka po pokročilé vzory AI nasadenia
- **Overené URL**: Všetky externé odkazy repozitára overené a prístupné
- **Kompletné referencie**: Všetky interné odkazy v dokumentácii overené a funkčné
- **Pripravené na produkciu**: Podnikové vzory nasadenia s reálnymi príkladmi

### [v2.0.0] - 2025-09-09

#### Veľké zmeny - Reštrukturalizácia repozitára a profesionálne vylepšenie
**Táto verzia predstavuje významnú rekonštrukciu štruktúry repozitára a prezentácie obsahu.**

#### Pridané
- **Štruktúrovaný rámec učenia**: Všetky dokumentačné stránky teraz obsahujú sekcie Úvod, Ciele učenia a Výsledky učenia
- **Navigačný systém**: Pridané odkazy Predchádzajúca/Nasledujúca lekcia vo všetkej dokumentácii pre vedený progres učenia
- **Študijný sprievodca**: Komplexný študijný sprievodca.md s cieľmi učenia, praktickými cvičeniami a hodnotiacimi materiálmi
- **Profesionálna prezentácia**: Odstránené všetky emoji ikony pre lepšiu prístupnosť a profesionálny vzhľad
- **Vylepšená štruktúra obsahu**: Vylepšená organizácia a plynulosť vzdelávacích materiálov

#### Zmenené
- **Formát dokumentácie**: Štandardizácia všetkej dokumentácie s konzistentnou štruktúrou zameranou na učenie
- **Tok navigácie**: Implementovaný logický progres cez všetky vzdelávacie materiály
- **Prezentácia obsahu**: Odstránené dekoratívne prvky v prospech jasného a profesionálneho formátovania
- **Štruktúra odkazov**: Aktualizované všetky interné odkazy na podporu nového navigačného systému

#### Vylepšené
- **Prístupnosť**: Odstránené závislosti na emoji pre lepšiu kompatibilitu so čítačkami obrazovky
- **Profesionálny vzhľad**: Čistá prezentácia v akademickom štýle vhodná pre podnikové vzdelávanie
- **Skúsenosť učenia**: Štruktúrovaný prístup s jasnými cieľmi a výsledkami pre každú lekciu
- **Organizácia obsahu**: Lepší logický tok a prepojenie medzi súvisiacimi témami

### [v1.0.0] - 2025-09-09

#### Počiatočné vydanie - Komplexný repozitár učenia AZD

#### Pridané
- **Základná štruktúra dokumentácie**
  - Kompletný sprievodca začatím série
  - Komplexná dokumentácia o nasadení a pridelení zdrojov
  - Detailné zdroje na riešenie problémov a návody na ladenie
  - Nástroje a postupy na validáciu pred nasadením

- **Modul Začína sa**
  - Základy AZD: základné koncepty a terminológia
  - Inštalačný sprievodca: pokyny pre nastavenie platformy
  - Sprievodca konfiguráciou: nastavenie prostredia a autentifikácia
  - Prvý projekt: krok za krokom praktické učenie

- **Modul Nasadenie a pridelenie zdrojov**
  - Sprievodca nasadením: kompletná dokumentácia pracovného postupu
  - Sprievodca pridelením zdrojov: Infrastructure as Code pomocou Bicep
  - Najlepšie postupy pre produkčné nasadenia
  - Vzory architektúry viacerých služieb

- **Modul validácie pred nasadením**
  - Plánovanie kapacity: overovanie dostupnosti zdrojov Azure
  - Výber SKU: komplexný návod pre úrovne služieb
  - Predletové kontroly: automatizované validačné skripty (PowerShell a Bash)
  - Nástroje pre odhad nákladov a plánovanie rozpočtu

- **Modul riešenia problémov**
  - Bežné problémy: často sa vyskytujúce problémy a riešenia
  - Sprievodca ladením: systematické metodiky riešenia problémov
  - Pokročilé diagnostické techniky a nástroje
  - Monitorovanie výkonu a optimalizácia

- **Zdroje a referencie**
  - Rýchly prehľad príkazov: rýchle odkazy na základné príkazy
  - Slovník: komplexné definície terminológie a akronymov
  - Často kladené otázky: detailné odpovede na bežné otázky
  - Externé zdroje a komunitné prepojenia

- **Príklady a šablóny**
  - Príklad jednoduchej webovej aplikácie
  - Šablóna nasadenia statickej webstránky
  - Konfigurácia kontajnerových aplikácií
  - Vzory integrácie databázy
  - Príklady mikroservisnej architektúry
  - Implementácie serverless funkcií

#### Funkcie
- **Podpora viacerých platforiem**: inštalačné a konfiguračné návody pre Windows, macOS a Linux
- **Rôzne úrovne zručností**: obsah navrhnutý pre študentov až po profesionálnych vývojárov
- **Praktické zameranie**: praktické príklady a scenáre z reálneho sveta
- **Komplexné pokrytie**: od základných konceptov po pokročilé podnikové vzory
- **Prístup k bezpečnosti na prvom mieste**: bezpečnostné postupy integrované naprieč celým obsahom
- **Optimalizácia nákladov**: pokyny pre efektívne nasadenia a správu zdrojov

#### Kvalita dokumentácie
- **Detailné príklady kódu**: praktické, testované vzorky kódu
- **Návody krok za krokom**: jasné a použiteľné pokyny
- **Komplexné riešenie chýb**: riešenie bežných problémov
- **Integrácia najlepších postupov**: priemyselné štandardy a odporúčania
- **Kompatibilita verzií**: aktuálne podľa najnovších Azure služieb a funkcií azd

## Plánované budúce vylepšenia

### Verzia 3.1.0 (Plánovaná)
#### Rozšírenie AI platformy
- **Podpora viacerých modelov**: integračné vzory pre Hugging Face, Azure Machine Learning a vlastné modely
- **Frameworky AI agentov**: šablóny pre nasadenie LangChain, Semantic Kernel a AutoGen
- **Pokročilé RAG vzory**: možnosti vektorových databáz mimo Azure AI Search (Pinecone, Weaviate, a ďalšie)
- **AI pozorovateľnosť**: vylepšené monitorovanie výkonu modelov, využitia tokenov a kvality odpovedí

#### Vývojárska skúsenosť
- **VS Code rozšírenie**: integrovaný vývojový zážitok AZD + Microsoft Foundry
- **Integrácia GitHub Copilot**: AI podporovaná generácia AZD šablón
- **Interaktívne návody**: praktické kódovacie cvičenia s automatickou validáciou pre AI scenáre
- **Video obsah**: doplnkové video návody pre vizuálnych študentov s dôrazom na AI nasadenia

### Verzia 4.0.0 (Plánovaná)
#### Podnikové AI vzory
- **Rámec správy**: správa AI modelov, súlad s predpismi a auditné stopy
- **Multi-tenant AI**: vzory pre poskytovanie služieb viacerým zákazníkom s izolovanými AI službami
- **Edge AI nasadenie**: integrácia s Azure IoT Edge a kontajnerovými inštanciami
- **Hybridné cloud AI**: multi-cloud a hybridné vzory nasadenia AI záťaží

#### Pokročilé funkcie
- **Automatizácia AI pipeline**: MLOps integrácia s Azure Machine Learning pipeline
- **Pokročilá bezpečnosť**: vzory zero-trust, privátne koncové body a pokročilá ochrana proti hrozbám
- **Optimalizácia výkonu**: pokročilé ladenie a škálovacie stratégie pre vysoko výkonné AI aplikácie
- **Globálna distribúcia**: vzory doručovania obsahu a edge cache pre AI aplikácie

### Verzia 3.0.0 (Plánovaná) - Nahradená aktuálnym vydaním
#### Navrhované doplnky - Teraz implementované vo verzii v3.0.0
- ✅ **Obsah zameraný na AI**: komplexná integrácia Microsoft Foundry (Dokončené)
- ✅ **Interaktívne návody**: praktický AI workshop laboratórium (Dokončené)
- ✅ **Modul pokročilej bezpečnosti**: AI špecifické bezpečnostné vzory (Dokončené)
- ✅ **Optimalizácia výkonu**: stratégie ladenia záťaže AI (Dokončené)

### Verzia 2.1.0 (Plánovaná) - Čiastočne implementované vo verzii v3.0.0
#### Menšie vylepšenia - Niektoré dokončené v aktuálnom vydaní
- ✅ **Ďalšie príklady**: AI zamerané scenáre nasadenia (Dokončené)
- ✅ **Rozšírené FAQ**: AI špecifické otázky a riešenie problémov (Dokončené)
- **Integrácia nástrojov**: vylepšené návody na integráciu IDE a editorov
- ✅ **Rozšírenie monitorovania**: AI špecifické vzory monitorovania a upozornení (Dokončené)

#### Ešte plánované na budúce vydanie
- **Mobilná priateľská dokumentácia**: responzívny dizajn pre mobilné učenie
- **Offline prístup**: stiahnuteľné balíky dokumentácie
- **Vylepšená integrácia IDE**: VS Code rozšírenie pre AZD + AI pracovné postupy
- **Dashboard komunity**: metriky komunity v reálnom čase a sledovanie príspevkov

## Prispievanie do zmenového denníka

### Hlásenie zmien
Pri prispievaní do tohto repozitára zabezpečte, prosím, že položky zmenového denníka obsahujú:

1. **Číslo verzie**: podľa semantického verzovania (major.minor.patch)
2. **Dátum**: dátum vydania alebo aktualizácie v formáte RRRR-MM-DD
3. **Kategória**: Pridané, Zmenené, Zastarané, Odstránené, Opravené, Bezpečnosť
4. **Jasný popis**: stručný popis vykonaných zmien
5. **Posúdenie dopadu**: ako zmeny ovplyvnia existujúcich používateľov

### Kategórie zmien

#### Pridané
- Nové funkcie, dokumentačné sekcie alebo možnosti
- Nové príklady, šablóny alebo vzdelávacie zdroje
- Ďalšie nástroje, skripty alebo utilitky

#### Zmenené
- Úpravy existujúcej funkcionality alebo dokumentácie
- Aktualizácie na zlepšenie jasnosti alebo presnosti
- Reštrukturalizácia obsahu alebo organizácie

#### Zastarané
- Funkcie alebo prístupy, ktoré sa postupne vyraďujú
- Dokumentačné sekcie plánované na odstránenie
- Metódy, ktoré majú lepšie alternatívy

#### Odstránené
- Funkcie, dokumentácia alebo príklady, ktoré už nie sú relevantné
- Zastarané informácie alebo vyraďované prístupy
- Nadbytočný alebo zjednotený obsah

#### Opravené
- Opravy chýb v dokumentácii alebo kóde
- Riešenie nahlásených problémov alebo chýb
- Zlepšenia presnosti alebo funkcionality

#### Bezpečnosť
- Bezpečnostné vylepšenia alebo opravy
- Aktualizácie bezpečnostných najlepších praktík
- Riešenie bezpečnostných zraniteľností

### Pokyny pre semantické verzovanie

#### Hlavná verzia (X.0.0)
- Zásadné zmeny vyžadujúce zásah používateľa
- Významná reštrukturalizácia obsahu alebo organizácie
- Zmeny menia základný prístup alebo metodológiu

#### Menšia verzia (X.Y.0)
- Nové funkcie alebo rozšírenia obsahu
- Vylepšenia zachovávajúce spätnú kompatibilitu
- Dodatočné príklady, nástroje alebo zdroje

#### Opravná verzia (X.Y.Z)
- Opravy chýb a korekcie
- Menšie zlepšenia existujúceho obsahu
- Vysvetlenia a malé vylepšenia

## Spätná väzba a návrhy komunity

Aktívne povzbudzujeme spätnú väzbu komunity na zlepšenie tohto vzdelávacieho zdroja:

### Ako poskytnúť spätnú väzbu
- **GitHub Issues**: Nahláste problémy alebo navrhnite zlepšenia (vitáme aj problémy špecifické pre AI)
- **Diskusie na Discorde**: Podeľte sa o nápady a zapojte sa do komunity Microsoft Foundry
- **Pull Requesty**: Priamy prínos k obsahu, najmä AI šablónam a príručkám
- **Microsoft Foundry Discord**: Zapojte sa do kanála #Azure pre diskusie o AZD + AI
- **Fóra komunity**: Zúčastnite sa širších diskusií o Azure pre vývojárov

### Kategórie spätnej väzby
- **Presnosť obsahu AI**: Opravy informácií o integrácii a nasadení AI služieb
- **Vzdelávací zážitok**: Návrhy na zlepšenie učenia sa AI vývojárov
- **Chýbajúci AI obsah**: Žiadosti o ďalšie AI šablóny, vzory alebo príklady
- **Prístupnosť**: Vylepšenia pre rôznorodé vzdelávacie potreby
- **Integrácia AI nástrojov**: Návrhy na lepšiu integráciu vývoja AI workflow
- **Vzory produkčnej AI**: Žiadosti o podnikovú AI deploymnet vzory

### Záväzok k odpovediam
- **Odpoveď na problémy**: Do 48 hodín na nahlásené problémy
- **Žiadosti o funkcie**: Vyhodnotenie do jedného týždňa
- **Príspevky komunity**: Preskúmanie do jedného týždňa
- **Bezpečnostné otázky**: Prioritná a okamžitá reakcia

## Plán údržby

### Pravidelné aktualizácie
- **Mesačné kontroly**: Presnosť obsahu a kontrola odkazov
- **Štvrťročné aktualizácie**: Hlavné doplnenia a zlepšenia obsahu
- **Polročné kontroly**: Komplexná reštrukturalizácia a vylepšenia
- **Ročné vydania**: Hlavné verzie s významnými vylepšeniami

### Monitorovanie a kontrola kvality
- **Automatizované testovanie**: Pravidelná validácia ukážok kódu a odkazov
- **Integrácia spätnej väzby komunity**: Pravidelné zapracovanie používateľských návrhov
- **Aktualizácie technológií**: Súlad s najnovšími službami Azure a vydaniami azd
- **Audity prístupnosti**: Pravidelná kontrola inkluzívnych princípov dizajnu

## Politika podpory verzií

### Podpora aktuálnej verzie
- **Najnovšia hlavná verzia**: Plná podpora s pravidelnými aktualizáciami
- **Predchádzajúca hlavná verzia**: Bezpečnostné aktualizácie a kritické opravy po dobu 12 mesiacov
- **Staršie verzie**: Podpora komunity, bez oficiálnych aktualizácií

### Pokyny pre migráciu
Pri vydaní hlavných verzií poskytujeme:
- **Migracné príručky**: Detailné inštrukcie pre prechod
- **Poznámky o kompatibilite**: Podrobnosti o zlomových zmenách
- **Podpora nástrojov**: Skripty alebo nástroje pomáhajúce pri migrácii
- **Podpora komunity**: Venované fóra pre otázky migrácie

---

**Navigácia**
- **Predchádzajúca lekcia**: [Study Guide](resources/study-guide.md)
- **Nasledujúca lekcia**: Návrat na [Main README](README.md)

**Zostaňte informovaní**: Sledujte tento repozitár pre oznámenia o nových vydaniach a dôležitých aktualizáciách vzdelávacích materiálov.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
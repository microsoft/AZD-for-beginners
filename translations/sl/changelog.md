# Dnevnik sprememb - AZD za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v skladišču AZD za začetnike. Sledimo principom semantičnega verzioniranja in vzdržujemo ta zapis, da pomagamo uporabnikom razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z ogledom tega dnevnika sprememb boste:
- Ostali obveščeni o novih funkcijah in dodatkih vsebine
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali popravke napak in korekture za zagotavljanje natančnosti
- Sledili razvoju učnih gradiv skozi čas

## Izidi učenja

Po pregledu zapisov dnevnika sprememb boste lahko:
- Prepoznali novo vsebino in vire, ki so na voljo za učenje
- Razumeli, kateri odseki so bili posodobljeni ali izboljšani
- Načrtovali svojo učna pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.25.0] - 2026-11-09

#### Razširitev Microsoft Foundry 1.0 je zdaj splošno na voljo

Paket `microsoft.foundry` 1.0 je **aktivno in splošno na voljo**, kot je bilo napovedano  [5. novembra 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Tečaj zdaj uči izdajeni GA potek dela, ne prihajajočega izida. Začnite z AZD **1.37.0 ali novejšo** in `azd ext install microsoft.foundry`.

#### Na voljo v tej posodobitvi tečaja
- Angleške smernice uporabljajo GA paket kot privzeto pot namestitve in pojasnjujejo njegovih sedem samostojno verzioniranih jedrnih razširitev.
- [Vodnik za gostiteljske agente](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) obsega vzorec API Odgovorov Python Agent Framework upstream, trenutno uv, Python 3.13+, izbiro novih/obstoječih projektov, ponovno uporabo modela in pregled `azure.yaml`.
- Potek dela »lokalno v oblak« zajema testiranje Agent Inspectorja, stroške klicev modela, podprtih z Azure, oddaljene izgradnje kode, nameščene klice, sledenje v oblaku, predogled nameščanja, dnevnike in diagnostiko.
- Ločene smernice za ocenjevanje obsegajo generiranje in pregled zbirk podatkov/meril, konfiguracijo imenovanega ocenjevanja, registracijo sredstev in pregled rezultatov. Starejša navodila za ocenjevanje/optimizacijo so zgodovina migracije, ne trenutna osnovna različica.
- Smernice Foundry CI/CD vključujejo namestitev razširitve izvajalca, avtenticirano namestitev, dostop/sredstva za ocenjevanje in izrecna kakovostna vrata.
- Smernice čiščenja razlikujejo med novoustanovljenimi in ponovno uporabljenimi Foundry projekti. Delavnica se sklicuje na ločeno GA vajo, brez nadomeščanja njenih primerkov specifičnih testov.
- Navigacija tečaja, učni cilji, predpogoji za nastavitev, odebeljen povzetek, pogosta vprašanja in študijski vodič odražajo GA potek dela. Generirani prevodi niso ročno urejeni.

#### Obseg pregleda
- Na podlagi GA napovedi, povezanih Microsoft Learn smernic in konfiguracije vzorca upstream. Ni bilo izvajanja v živo Azure, nameščanja, klica modela ali ocenjevanja.
- GA paketa ne pomeni GA za vsako dodatno funkcijo, samostojno razširitev ali SDK, niti ne potrjuje primerov za produkcijo.

### [v3.24.0]- 2026-11-04

#### Popravljeno
- Popravljena angleška navigacija tečaja, poti premaknjenih strani, manjkajoče sidra ter zastarele zunanje reference, vključno s povezavo do poglavja 2 vodnika za produkcijsko AI.
- Pregledana trenutna navodila glede na objavo AZD 1.37.2, agente 1.0.0-beta.23 in ocenjevanja 1.0.0-beta.2. Dokumentirana ločena rutina `azd ai eval` in migracija konfiguracije optimizacije.
- Popravljene nepodprte CLI zastavice, meje avtorizacije, smernice za okolje/tajno v navadnem besedilu, posodobitve infrastrukture, konfiguracija modela in primeri uničujočega obnovitvenega procesa.
- Osvežena delavnica glede na aktualni AI Agents vzorec, vključno z dejanskimi kavljami, vhodnimi konfiguracijami, preizkusi ocenjevanja, vnosi rdečega tima in opazovanjem.
- Popravljene trditve glede primerne realizacije in popravljene povezane težave z aplikacijo/infrastrukturo/konfiguracijo. Material o arhitekturi maloprodaje je jasno ločen od popolne delujoče aplikacije.
- Obnovljena matrika jezika CodeQL, izbran podprt Node.js 24 za razvojni vsebnik in konfigurirani preverjevalci poročajo o neuspelih ukazih različice.

#### Dodano
- Samo angleški brez povezave preverjevalnik povezav/sidra, regresijski testi in dokumentacijski potek dela, ki prav tako gradi delavnico v strogem načinu. Generirani prevodi in prevedene slike so izključeni.

#### Obseg validacije
- Preverjanja vira, sintakse, konfiguracije, lokalnega vedenja in mrežnih povezav ne zagotavljajo dejanske zmožnosti za zagon v živo, kvot, RBAC, regionalne razpoložljivosti modelov, obračunavanja, skladnosti z varnostjo ali pripravljenosti za produkcijo.
- Starejši vnosi spodaj so zgodovinski zapisi, ne trenutna navodila za ukaze ali izdaje.

### [v3.23.0] - 2026-07-13

#### Osvežitev AZD 1.27.1: Posodobitev različice
**Ta različica ponovno potrdi tečaj z `azd` `1.27.1` (julij 2026, zadnja stabilna izdaja) in trenutno predogledno razširitev AI agenta `azure.ai.agents` `1.0.0-beta.5`, s čimer so vsi "preverjeno z" pasice posodobljene po izdajah 1.26.0, 1.27.0 in 1.27.1.**

#### Spremenjeno
- **✅ Posodobljena osnova validacije** z `azd 1.25.6` (junij 2026) na `azd 1.27.1` (julij 2026) v korenskem README-ju, vseh poglavjih README, lekciji o razvojnem vsebniku v poglavju 1 (vključno z primeri pripetih različic), lekciji po meri v poglavju 4, večagentni lekciji v poglavju 5 in dokumentaciji delavnice
- **🤖 Osnova v poglavju 2 osvežena** z `azd 1.23.12` (marec 2026) na `azd 1.27.1` v `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` in `microsoft-foundry-integration.md`; datumi opomb za validacijo so posodobljeni na 2026-07-13
- **🧩 Razširitev AI agenta povečana** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na trenutno izdajo `1.0.0-beta.5` v README poglavja 2 in `agents.md`
- **🧪 Primer validacije delavnice** (`azd version` izhod) posodobljen na `1.27.1`

#### Opombe o relevantnih azd izdajah (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora za Go za Azure Functions na Flex Consumption, `azd config sub-filter` filtri naročnin na najemnika, samostojni paketi razširitev (`azd x pack --bundle`) in `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeliranje Azure AI Foundry projektov/agentov neposredno v `azure.yaml` (inicializacija brez Bicep/Terraform), podpora za nameščanje kontejnerjev za App Service (`host: appservice` + `language: docker`), neposredni `-s/--source` za ukaze `azd extension` in `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` zastavica za `azd extension install`, privzeto izključeni zastareli modeli iz prikazov katalogov/kvot in več popravkov napak

#### Posodobljene datoteke
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

#### Začetniški zapolnitveni #2: Avtoriranje predlog, razvojni vsebniki, Pulumi, Azure DevOps, servisni predstavniki in več
**Ta različica zapira preostale vmesne vrzeli, zaznane z analizo azd-coverage: kako avtorirati in objaviti svojo lastno predlogo, reproducibilna razvojna okolja Dev Containers/Codespaces, Pulumi ponudnik infrastrukture, vodnik po Azure DevOps CI/CD, avtentikacija servisnih predstavnikov, smernice za izbiro gostitelja (AKS/Spring Apps), pojasnila `azd restore`/`azd package`, ravnanje z napakami kaveljev in prakse timskih/deljenih okolij.**

#### Dodano
- **🧱 Nova lekcija poglavja 4** `docs/chapter-04-infrastructure/custom-templates.md` — avtoriranje lastne azd predloge: zahtevana struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametrizacija infrastrukture s sredstvom `uniqueString()` in oznako `azd-env-name`, testiranje lokalno z `azd init --template <local-path>`, objava na GitHub in oddaja v galerijo Awesome AZD
- **📦 Nova lekcija poglavja 1** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okolja z Dev Containers in GitHub Codespaces: minimalen `.devcontainer/devcontainer.json` z uporabo uradne funkcije `ghcr.io/azure/azure-dev/azd`, funkcije, specifične za jezik, `docker-in-docker` za gostitelje kontejnerjev in `azd auth login --use-device-code` za oddaljeno prijavo
- **🧩 Pulumi z azd** razdelek v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, razporeditev mape Pulumi, skladje preslikano v azd okolja, zahtevani izhodi/oznake in identična rutina `azd up` / `azd down`
- **🎯 Smernice za izbiro gostitelja** v `docs/chapter-04-infrastructure/provisioning.md` — prijazna primerjava za začetnike med `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` in `springapp`, z navodili, kdaj izbrati AKS ali Azure Spring Apps
- **🛠️ Azure DevOps CI/CD vodnik** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, povezava servisa z identiteto naloge (OIDC), ustvarjeni `azure-dev.yml` in nastavitev skupin spremenljivk
- **🔑 Servisni predstavniki (vzorec 4)** dodano v `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivna `azd auth login` s skrivnostjo odjemalca proti federiranim/OIDC poverilnicam, kdaj uporabljati in varno shranjevanje poverilnic
- **🪝 Ravnanje z napakami kaveljev** podrazdelek v `docs/chapter-04-infrastructure/deployment-guide.md` — izhodne kode in `set -e`, `continueOnError`, testiranje kavljev v izolaciji z `azd hooks run`, lupine za različne OS in `--debug`
- **👥 Timska / deljena okolja** razdelek v `docs/chapter-03-configuration/configuration.md` — kaj je v `.azure/`, kaj ignorirati z gitom, okolja za posamezne razvijalce, `azd env list`/`select` in zagotavljanje vrednosti okolij v CI/CD
- **🧰 Razložitev `azd restore` in razširjenega `azd package`** v `resources/cheat-sheet.md` — vračanje odvisnosti in gradnja namestljivega artefakta brez nameščanja

#### Spremenjeno
- **🧭 Tabela lekcij poglavja 4** posodobljena z vključitvijo nove lekcije »Avtoriranje lastne predloge« (Lekcija 3)
- **🧭 Tabela lekcij poglavja 1** posodobljena z vključitvijo nove lekcije »Dev Containers & Codespaces« (Lekcija 5); navigacijski nogi povezani med `bring-your-own-app.md` in `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začetniški zapolnitveni: praktična večagentna lekcija, »Prinesi svojo aplikacijo«, Terraform in CI/CD vodič
**Ta različica zapira največje vrzeli za popoln začetniški vodič z dodajanjem dveh novih praktičnih lekcij (vodnik za večagentno nameščanje in dodajanje azd v obstoječo aplikacijo), uvodom prijaznim začetnikom v kavlje, poglavjem Terraform z azd, korak-po-korak vodičem po GitHub Actions cevi, razlago novih predoglednih razširitev in izrecnim kontrolnim seznamom za preverjanje nameščanja.**

#### Dodano
- **🤝 Nova lekcija poglavja 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — popolnoma praktičen, nameščljiv vodnik za dva agenta (orkestrator + specialisti) z uporabo resnične predloge (`contoso-creative-writer`), pokriva, kdaj uporabiti večagentno, potek `azd up`, razumevanje nameščenih sredstev, medagentno sledenje, prilagajanje in čiščenje
- **📦 Nova lekcija poglavja 1** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd v obstoječi projekt z `azd init` (»uporabi kodo v trenutnem imeniku«), razumevanje `azure.yaml` in `infra/`, `azd infra generate`, zaznavanje gostitelja in nameščanje z `azd up`
- **🌐 Poglavje Terraform z azd** dodano v `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, razporeditev mape `.tf`, potrebni izhodi `AZURE_*` in označevanje `azd-env-name` ter identična rutina `azd up` / `azd down` (zapira vrzel, kjer je bila podpora Terraform omenjena, a je bil prikazan le Bicep)
- **⚙️ Podroben vodič po GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do samodejnih namestitev: `azd pipeline config`, OIDC zvezne poverilnice (brez shranjenih skrivnosti), ustvarjeni `azure-dev.yml` in navodila o skrivnostih v primerjavi s spremenljivkami
- **🪝 Uvod za začetnike "Novi pri hooks?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — kaj je hook, tabela faz hooks, minimalni prvi hook in ročno izvajanje hooks z `azd hooks run`
- **✅ Kontrolni seznam "Preverite svojo namestitev"** dodan k koraku 5 v `docs/chapter-01-foundation/first-project.md` — preverjanje delovanja, preverjanje zdrave končne točke in izrecna merila uspeha
- **🧩 Razlaga novih predoglednih razširitev** `azure.ai.skills` in `azure.ai.connections` (kaj so in kdaj jih uporabiti) v `docs/chapter-08-production/production-ai-practices.md`

#### Spremenjeno
- **🧭 Popravljena tabela lekcij 5. poglavja**: `multi-agent-basics.md` je zdaj Lekcija 1 (edina popolnoma praktična lekcija), z jasno oznako, da Lekcija 2 živi v 6. poglavju, Scenarij Retail pa je arhitekturni načrt, ne predloga z enim ukazom
- **🧭 Tabela lekcij 1. poglavja** zdaj vključuje novo lekcijo "Prinesi svojo aplikacijo" (Lekcija 4)
- **🔗 Posodobljeni navigacijski podnožji**: `first-project.md` sedaj vodi naprej do `bring-your-own-app.md`

#### Popravljeno
- **🧱 Zapolnjen "teritorij zahtevan a manjkajoč" pri Terraformu** — tečaj je prej omenjal podporo Terraformu brez prikaza
- **🔀 Popravljene zavajajoče medsebojne povezave 5. poglavja** ki so namigovale na obstoj polne večagentne implementacije, ko je obstajal le arhitekturni načrt

#### Posodobljene datoteke
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(novo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(novo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Osvežitev AZD 1.25.6, celotni ukazi življenjskega cikla agenta & preimenovanje Aspire
**Ta različica ponovno preveri tečaj v skladu z `azd` `1.25.6` (junij 2026) in razširitvijo `azure.ai.agents` `0.1.40-preview`, razširi AI navodila od "zgradi agenta" do popolnega življenjskega cikla agenta (test → oceni → optimiziraj → preglej → izbriši), predstavi nove predogledne razširitve `azure.ai.skills` in `azure.ai.connections` ter omeni preimenovanje izdelka ".NET Aspire" → "Aspire".**

#### Dodano
- **🔁 Celotno pokritje življenjskega cikla agenta** za začetnike in AI inženirje po dokumentaciji:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela življenjskega cikla (zgradi → testiraj → meri → izboljšaj → preglej → počisti) dodana v razdelek Razširitve in AI ukazi
  - `docs/chapter-08-production/production-ai-practices.md` — Nov razdelek "Upravljanje življenjskega cikla agenta" z vsebinami `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
  - `resources/cheat-sheet.md` — Razširjeni AI ukazi za agente z `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
- **🧩 Dokumentirane nove predogledne razširitve**: `azure.ai.skills` (ponovno uporabne veščine agentov) in `azure.ai.connections` (povezave Foundry) dodane v tabelo razširitev in seznam ukazov
- **⏱️ Navodila za odzivni čas** — primeri `azd ai agent invoke` zdaj izpisujejo skupno zakasnitev in čas do prvega bajta
- **📌 Pasica različice** v glavni README datoteki, ki učiči kaže na `azd version` in `azd upgrade`

#### Spremenjeno
- **✅ Posodobljena osnovna raven potrjevanja** iz `azd 1.23.12` (marec 2026) na `azd 1.25.6` (junij 2026) v vseh začetnih README-jih poglavij in delavnic
- **🤖 Posodobljena opomba o razširitvi 2. poglavja** iz `azure.ai.agents` `0.1.18-preview` v `0.1.40-preview`
- **🧪 Posodobljen primer potrjevanja v delavnici** (izhod `azd version`) na `1.25.6`
- **🧭 Osvežen README "Kaj je novega v azd danes"** za poudarjanje celotnega življenjskega cikla agenta, novih AI razširitev in nedavnih izboljšav uporabniške izkušnje (`azd init` idempotentnost, `azd auth login` čiščenje zastarelih žetonov, `azd tool` poziv za prvi zagon)
- **📖 Agenti.md poglavja 2 (možnost 4)** zdaj usmerja uporabnike k ukazom življenjskega cikla po namestitvi namesto da se ustavi pri `azd up`

#### Popravljeno
- **🏷️ Imenovanje izdelka** — dodana opomba o preimenovanju Aspire (".NET Aspire" je zdaj preprosto "Aspire"); podpora Aspire v azd ostaja nespremenjena
- **🔎 Potrjevanje izdaje v živo** potrjeno glede na izdajo Azure Developer CLI: stabilni CLI `1.25.6` (2026-06-12) in `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Posodobljene datoteke
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

#### Poenostavitev uvajanja za začetnike, preverjanje nastavitve & čiščenje končnih ukazov AZD
**Ta različica sledi AZD 1.23 potrditveni obnovi z dokumentacijskim prehodom usmerjenim na začetnike: pojasnjuje navodila za avtentikacijo z AZD kot prvo izbiro, dodaja lokalne skripte za preverjanje nastavitve, preverja ključne ukaze v živo z AZD CLI in odstranjuje zadnje zastarele sklice na ukaze iz angleških virov zunaj dnevnika sprememb.**

#### Dodano
- **🧪 Skripte za preverjanje nastavitve za začetnike** z `validate-setup.ps1` in `validate-setup.sh`, da uporabniki potrdijo zahtevana orodja pred začetkom 1. poglavja
- **✅ Koraki za preverjanje nastavitve predhodno** v glavni README in README 1. poglavja, da se ujamete manjkajoče predpogoje pred `azd up`

#### Spremenjeno
- **🔐 Navodila za avtentikacijo začetnikov** zdaj dosledno obravnavajo `azd auth login` kot glavno pot za AZD delovne procese, pri čemer je `az login` označen kot izbiren razen, če se ukazi Azure CLI uporabljajo neposredno
- **📚 Postopek uvajanja v 1. poglavju** zdaj usmerja uporabnike, da potrdijo lokalno nastavitev pred namestitvijo, avtentikacijo in prvimi koraki namestitve
- **🛠️ Sporočila validatorja** zdaj jasno ločujejo blokirne zahteve od neobveznih opozoril Azure CLI za pot AZD samo za začetnike
- **📖 Nastavitveni, odpravljalni in primeri dokumentacije** zdaj razlikujejo med zahtevano AZD avtentikacijo in neobveznim prijavljanjem v Azure CLI tam, kjer je prej bilo zastavljeno brez konteksta

#### Popravljeno
- **📋 Preostale sklice na ukaze iz angleškega vira** posodobljene na trenutne oblike AZD, vključno z `azd config show` na seznamu ukazov in `azd monitor --overview` tam, kjer je bil mišljena Azure Portal pregledna navodila
- **🧭 Trditve začetnikov v 1. poglavju** omiljene, da se izognejo obljubam zagotovljenega breznapaknega ali povratnega vedenja za vse predloge in Azure vire
- **🔎 Preverjanje v živo ukazne vrstice** potrjuje trenutno podporo za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` in `azd down --force --purge`

#### Posodobljene datoteke
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

#### Validacija AZD 1.23.12, razširitev delavničnega okolja & osvežitev AI modela
**Ta različica izvaja preverjanje dokumentacije proti `azd` `1.23.12`, posodablja zavržene primere ukazov AZD, osvežuje AI navodila na trenutne privzete vrednosti in širi navodila delavnic izven GitHub Codespaces na podporo razvojnim kontejnerjem in lokalnim kopijam.**

#### Dodano
- **✅ Opombe o potrditvi v vseh glavnih poglavjih in dokumentih delavnic** za jasnost preverjene osnovne linije AZD za učence, ki uporabljajo novejše ali starejše CLI različice
- **⏱️ Navodila o časovnih omejitvah namestitve** za dolgotrajne namestitve AI aplikacij z uporabo `azd deploy --timeout 1800`
- **🔎 Koraki pregleda razširitev** z `azd extension show azure.ai.agents` v AI dokumentaciji delovnega toka
- **🌐 Širša navodila za okolje delavnic** pokrivajo GitHub Codespaces, razvojne kontejnere in lokalne kopije z MkDocs

#### Spremenjeno
- **📚 Uvodni README-ji poglavij** zdaj dosledno omenjajo validacijo z `azd 1.23.12` v osnovnih, konfiguracijskih, infrastrukturnih, večagentnih, pred-nameščnih, odpravljalnih in produkcijskih delih
- **🛠️ Sklici na ukaze AZD** posodobljeni na trenutne oblike po dokumentaciji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ali `azd env get-value(s)` odvisno od konteksta
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` tam, kjer je mišljeno predstavitev Application Insights
- **🧪 Poenostavljeni primeri zagotavljanja predogleda** za trenutno podporo, kot so `azd provision --preview` in `azd provision --preview -e production`
- **🧭 Potek delavnice** posodobljen, da uporabniki lahko dokončajo laboratorije v Codespaces, dev kontejnerju ali lokalni kopiji namesto predpostavke o izvajanju samo v Codespaces
- **🔐 Navodila za avtentikacijo** zdaj dajejo prednost `azd auth login` za AZD poteke, z `az login` kot izbirnim, če se ukazi Azure CLI uporabljajo neposredno

#### Popravljeno
- **🪟 Ukazi za namestitev Windows** normalizirani na trenutno velikost paketov `winget` v vodiču za namestitev
- **🐧 Navodila za namestitev Linux** popravljena, da se izognejo nepodprtih navodil za upravitelje paketov, specifičnih za distribucijo `azd`, namesto tega se kaže na izdajo ustreznih paketov
- **📦 Primeri AI modelov** osveženi od starejših privzetih, kot sta bila `gpt-35-turbo` in `text-embedding-ada-002`, do novih primerov kot so `gpt-4.1-mini`, `gpt-4.1` in `text-embedding-3-large`
- **📋 Izrezi za namestitev in diagnostiko** popravljeni, da uporabljajo trenutne ukaze za okolje in stanje v dnevnikih, skriptah in korakih odpravljanja težav
- **⚙️ Navodila za GitHub Actions** posodobljena iz `Azure/setup-azd@v1.0.0` v `Azure/setup-azd@v2`
- **🤖 Navodila za privolitev MCP/Copilot** posodobljena iz `azd mcp consent` v `azd copilot consent list`

#### Izboljšano
- **🧠 Navodila v AI poglavju** zdaj bolje pojasnjujejo predogledno občutljivo vedenje `azd ai`, najemniško specifično prijavo, trenutne razširitve in posodobljena priporočila za namestitev modela
- **🧪 Navodila delavnice** zdaj uporabljajo realističnejše primere različic in jasnejši jezik za nastavitev okolja pri praktičnih laboratorijih
- **📈 Dokumentacija za proizvodnjo in odpravljanje težav** zdaj bolje usklajena s trenutnim spremljanjem, modelom nadzora z rezervno vrednostjo in primeri stroškovnih ravni

#### Posodobljene datoteke
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

#### Ukazi AZD AI CLI, validacija vsebine & razširitev predloge
**Ta različica dodaja pokritost ukazov `azd ai`, `azd extension` in `azd mcp` v vseh poglavjih, povezanih z AI, odpravi pokvarjene povezave in zastarelo kodo v agents.md, posodobi prevarantski list in popolnoma prenovi razdelek z vzorčnimi predlogami z validiranimi opisi in novimi predlogami Azure AI AZD.**

#### Dodano
- **🤖 Pokritost AZD AI CLI** v 7 datotekah (prej samo v poglavju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nov razdelek "Razširitve in AI ukazi", ki predstavlja `azd extension`, `azd ai agent init` in `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s primerjalno tabelo (pristop s predlogo proti manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododelki "AZD razširitve za Foundry" in "Postavitev s prioritetnim agentom"
  - `docs/chapter-05-multi-agent/README.md` — Hiter začetek zdaj prikazuje poti postavitve, osnovane tako na predlogi kot na manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Razdelek postavitve zdaj vključuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododdelek "AZD AI ukazi za diagnostiko"
  - `resources/cheat-sheet.md` — Nov razdelek "Ukazi za AI in razširitve" z `azd extension`, `azd ai agent init`, `azd mcp` in `azd infra generate`
- **📦 Nove pokazne predloge AZD AI** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG klepet z Blazor WebAssembly, Semantic Kernel in podporo za glasovni klepet
  - **azure-search-openai-demo-java** — Java RAG klepet z uporabo Langchain4J in možnostmi postavitve ACA/AKS
  - **contoso-creative-writer** — Večagentna aplikacija za ustvarjalno pisanje z uporabo Azure AI Agent Service, Bing Grounding in Prompty
  - **serverless-chat-langchainjs** — Brezstrežni RAG z uporabo Azure Functions + LangChain.js + Cosmos DB s podporo za lokalni razvoj Ollama
  - **chat-with-your-data-solution-accelerator** — Poslovni RAG pospeševalnik z administratorskim portalom, integracijo Teams in možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Večagentna referenčna aplikacija za orkestracijo MCP s strežniki v .NET, Python, Java in TypeScript
  - **azd-ai-starter** — Minimalna zagonska predloga Azure AI infrastrukture Bicep
  - **🔗 Povezava do odlične galerije AZD AI** — Referenca na [odlično galerijo azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ predlog)

#### Popravljeno
- **🔗 Navigacija v agents.md**: Prejšnje/Naslednje povezave zdaj ustrezajo vrstnemu redu lekcij v poglavju 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Pokvarjene povezave v agents.md**: `production-ai-practices.md` popravljeno v `../chapter-08-production/production-ai-practices.md` (3 pojavitve)
- **📦 Zastarela koda v agents.md**: Zamenjano `opencensus` z `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neveljaven API v agents.md**: Premaknjen `max_tokens` iz `create_agent()` v `create_run()` kot `max_completion_tokens`
- **🔢 Štetje tokenov v agents.md**: Groba ocena `len//4` nadomeščena z `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Popravljene storitve iz "Cognitive Search + App Service" v "Azure AI Search + Azure Container Apps" (privzeti gostitelj spremenjen oktobra 2024)
- **contoso-chat**: Posodobljen opis za sklicevanje na Azure AI Foundry + Prompty, skladno s dejanskim naslovom in tehničnim skladom repozitorija

#### Odstranjeno
- **ai-document-processing**: Odstranjena nefunkcionalna referenca na predlogo (repozitorij ni javno dostopen kot AZD predloga)

#### Izboljšano
- **📝 Vaje v agents.md**: Prva vaja zdaj prikazuje pričakovani izhod in korak `azd monitor`; Druga vaja vključuje celotno `FunctionTool` registracijsko kodo; Tretja vaja zamenja splošna navodila s konkretnimi `prepdocs.py` ukazi
- **📚 Viri v agents.md**: Posodobljene povezave do trenutne dokumentacije Azure AI Agent Service in hitrega začetka
- **📋 Tabela naslednjih korakov v agents.md**: Dodana povezava do AI Workshop Lab za popolno pokritost poglavja

#### Posodobljene datoteke
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Izboljšana navigacija po tečajih
**Ta različica izboljšuje navigacijo po poglavjih v README.md s izboljšano obliko tabele.**

#### Spremenjeno
- **Tabela zemljevida tečaja**: Izboljšana z neposrednimi povezavami do lekcij, ocenami trajanja in ocenami zahtevnosti
- **Čiščenje map**: Odstranjene odvečne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Preverjanje povezav**: Preverjenih vseh 21+ notranjih povezav v tabeli zemljevida tečaja

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodablja sklice na izdelke z uporabo trenutnega Microsoftovega blagovnega značka.**

#### Spremenjeno
- **Microsoft Foundry → Microsoft Foundry**: Vsi sklici posodobljeni v nekode za prevod
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno, da odraža trenutno blagovno znamko

#### Posodobljene datoteke
- `README.md` - Glavna pristajalna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik za AI agente
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Pristajalna stran delavnice
- `workshop/docs/index.md` - Indeks delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke z navodili za delavnico

---

### [v3.15.0] - 2026-02-05

#### Obsežna preureditev repozitorija: imeniki po poglavjih
**Ta različica preuredi dokumentacijo v namenski imenike po poglavjih za jasnejšo navigacijo.**

#### Preimenovanja map
Stare mape so zamenjale mape oštevilčene po poglavjih:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano novo: `docs/chapter-05-multi-agent/`

#### Migracije datotek
| Datoteka | Od | Do |
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
| Vse datoteke pred namestitvijo | pre-deployment/ | chapter-06-pre-deployment/ |
| Vse datoteke za odpravljanje težav | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 Datoteke README v poglavjih**: Ustvarjen README.md v vsakem poglavju z:
  - Cilji učenja in trajanje
  - Tabela lekcij z opisi
  - Ukazi za hiter začetek
  - Navigacija do drugih poglavij

#### Spremenjeno
- **🔗 Posodobljene vse notranje povezave**: Posodobljenih 78+ poti v vseh dokumentacijskih datotekah
- **🗺️ Glavni README.md**: Posodobljen zemljevid tečaja z novo strukturo poglavij
- **📝 examples/README.md**: Posodobljene medsebojne reference na mape poglavij

#### Odstranjeno
- Stara struktura map (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Preureditev repozitorija: navigacija po poglavjih
**Ta različica je dodala datoteke README za navigacijo po poglavjih (preklicana z v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ta različica dodaja obsežen vodič za postavitev AI agentov z Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Celovit vodič, ki zajema:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnih robotov
  - Tri predloge za hiter začetek agentov (Foundry Agents, Prompty, RAG)
  - Vzorci arhitekture agentov (posamezni agent, RAG, večagentni)
  - Konfiguracija in prilagoditev orodij
  - Nadzor in sledenje metrikam
  - Stroškovne premisleke in optimizacijo
  - Pogoste situacije za odpravljanje težav
  - Tri praktične vaje s kriteriji uspeha

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hiter začetek**: Postavitev agentov z `azd init --template get-started-with-ai-agents`
- **Arhitekturni vzorci**: Vizualne diagrame vzorcev agentov
- **Konfiguracija**: Nastavitev orodij in spremenljivk okolja
- **Nadzor**: Integracija Application Insights
- **Vaje**: Progresivno praktično učenje (20-45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev razvojnega kontejnerja
**Ta različica posodablja konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za izkušnjo učenja AZD.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljena z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovejši stabilni Debian)
- **📛 Ime kontejnerja**: Preimenovano z "Python 3" na "AZD za začetnike" za jasnost

#### Dodano
- **🔧 Nove funkcije razvojnega kontejnerja**:
  - `azure-cli` z omogočeno podporo za Bicep
  - `node:20` (LTS različica za AZD predloge)
  - `github-cli` za upravljanje predlog
  - `docker-in-docker` za postavitve container app

- **🔌 Preusmeritev pristanišč**: Prednastavljena pristanišča za skupni razvoj:
  - 8000 (predogled MkDocs)
  - 3000 (spletne aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-ji)

- **🧩 Nove razširitve VS Code**:
  - `ms-python.vscode-pylance` - Izboljšan Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora za Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora za Docker
  - `ms-azuretools.vscode-bicep` - Podpora za jezik Bicep
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure virov
  - `yzhang.markdown-all-in-one` - Urejanje Markdown
  - `DavidAnson.vscode-markdownlint` - Preverjanje Markdown
  - `bierner.markdown-mermaid` - Podpora za diagrame Mermaid
  - `redhat.vscode-yaml` - Podpora za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git
  - `mhutchie.git-graph` - Zgodovina Git

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Pythonov razlagač, oblikovanje ob shranjevanju in odstranjevanje belin

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan vtičnik za stiskanje MkDocs
  - Dodan pre-commit za kvaliteto kode
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Popravljeno
- **Ukaz po ustvaritvi**: Sedaj preverja namestitev AZD in Azure CLI pri zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenova README prijazna začetnikom
**Ta različica pomembno izboljša README.md za lažjo dostopnost začetnikom in doda ključne vire za razvijalce AI.**

#### Dodano
- **🆚 Primerjava Azure CLI in AZD**: Jasna razlaga, kdaj uporabiti katero orodje s praktičnimi primeri
- **🌟 Odlične povezave AZD**: Neposredne povezave do galerije skupnostnih predlog in virov za prispevke:
  - [Odlična galerija AZD](https://azure.github.io/awesome-azd/) - 200+ pripravljenih za postavitev predlog
  - [Predloži predlogo](https://github.com/Azure/awesome-azd/issues) - Prispevek skupnosti
- **🎯 Vodnik za hiter začetek**: Poenostavljen 3-korak sekcija za začetek (Namesti → Prijava → Postavitev)
- **📊 Tabela navigacije na podlagi izkušenj**: Jasna navodila, kje začeti glede na razvojne izkušnje

#### Spremenjeno
- **Struktura README**: Preureditev za postopno razkrivanje - najprej ključne informacije
- **Uvedbeni razdelek**: Prepisano za razlago "Čarovnija `azd up`" za popolne začetnike
- **Odstranjena podvojena vsebina**: Odstranjena podvojena sekcija za odpravljanje težav
- **Ukazi za odpravljanje težav**: Popravljena referenca `azd logs` za uporabo veljavnega `azd monitor --logs`

#### Popravljeno
- **🔐 Ukazi za avtentikacijo**: Dodana `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Neveljavne reference ukazov**: Odstranjene preostale `azd logs` iz razdelka za odpravljanje težav v README

#### Opombe
- **Obseg**: Spremembe uporabljene v glavni README.md in resources/cheat-sheet.md
- **Ciljna publika**: Izboljšave posebej namenjene razvijalcem, ki so novi pri AZD

---

### [v3.10.0] - 2026-02-05

#### Posodobitev natančnosti ukazov Azure Developer CLI
**Ta različica popravi neobstoječe ukaze AZD v celotni dokumentaciji, s čimer zagotovi, da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Popravljeno
- **🔧 Odstranjeni neobstoječi ukazi AZD**: Celovit pregled in popravek neveljavnih ukazov:
  - `azd logs` (ne obstaja) → zamenjan z `azd monitor --logs` ali Azure CLI alternativami
  - `azd service` podukazi (ne obstajajo) → zamenjani z `azd show` in Azure CLI
  - `azd infra import/export/validate` (ne obstajajo) → odstranjeni ali zamenjani z veljavnimi alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne obstajajo) → odstranjene
  - `azd provision --what-if/--rollback` zastavice (ne obstajajo) → posodobljene za uporabo `--preview`
  - `azd config validate` (ne obstaja) → zamenjan z `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne obstajajo) → odstranjene

- **📚 Datoteke posodobljene s popravki ukazov**:
  - `resources/cheat-sheet.md`: Obsežna prenova referenc ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije rollback in nameščanja
  - `docs/troubleshooting/debugging.md`: Popravljeni razdelki za analizo dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi za odpravljanje težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljen razdelek za razhroščevanje AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za spremljanje
  - `docs/getting-started/first-project.md`: Posodobljeni primeri za spremljanje in razhroščevanje
  - `docs/getting-started/installation.md`: Popravljeni primeri za pomoč in različice
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za ogled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za razhroščevanje agentov

- **📝 Posodobljena referenca različice**: 
  - `docs/getting-started/installation.md`: Spremenjena trdo kodirana različica `1.5.0` v generično `1.x.x` z povezavo na izdaje

#### Spremenjeno
- **Strategije rollbacka**: Posodobljena dokumentacija za uporabo rollbacka na osnovi Git (AZD nima nativnega rollbacka)
- **Ogled dnevnikov**: Zamenjane reference `azd logs` z `azd monitor --logs`, `azd monitor --live` in ukazi Azure CLI
- **Razdelek o zmogljivosti**: Odstranjene neobstoječe zastavice za vzporedno/incrementalno nameščanje, ponujene veljavne alternative

#### Tehnični podatki
- **Veljavni ukazi AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavne zastavice azd monitor**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Preverjanje**: Ukazi potrjeni proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončanje delavnice in posodobitev kakovosti dokumentacije
**Ta različica zaključi interaktivne module delavnice, odpravi vse pokvarjene povezave v dokumentaciji in izboljša splošno kakovost vsebine za razvijalce AI, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument pravil prispevkov z:
  - Jasnimi navodili za prijavo težav in predloge sprememb
  - Standardi dokumentacije za novo vsebino
  - Navodila za primere kode in konvencije sporočil ob commitu
  - Informacije o vključenosti skupnosti

#### Dokončano
- **🎯 Modul delavnice 7 (Zaključek)**: Popolnoma dokončan modul zaključka z:
  - Celovitim povzetkom dosežkov delavnice
  - Razdelkom ključnih pojmov, zajemajočim AZD, predloge in Microsoft Foundry
  - Priporočili za nadaljevanje učne poti
  - Naloge za izzive delavnice z ocenami zahtevnosti
  - Povratne informacije skupnosti in povezave za podporo

- **📚 Modul delavnice 3 (Razgradnja)**: Posodobljeni cilji učenja z:
  - Aktivacijo GitHub Copilot z MCP strežniki
  - Razumevanje strukture map predlog AZD
  - Vzorce organizacije infrastrukture kot kode (Bicep)
  - Navodila za praktične laboratorijske vaje

- **🔧 Modul delavnice 6 (Razstavljanje)**: Dokončan z:
  - Cilji čiščenja virov in upravljanja stroškov
  - Uporaba `azd down` za varno odstranjevanje infrastrukture
  - Navodila za obnovitev mehko izbrisanih kognitivnih storitev
  - Bonus pozivi za raziskovanje GitHub Copilot in Azure Portal

#### Popravljeno
- **🔗 Popravki pokvarjenih povezav**: Rešeno 15+ pokvarjenih notranjih povezav v dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljene poti do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljene poti do ai-model-deployment.md in production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamenjana neobstoječa cicd-integration.md z deployment-guide.md
  - `examples/retail-scenario.md`: Popravljene poti FAQ in vodnika za odpravljanje težav
  - `examples/container-app/microservices/README.md`: Popravljene poti do domače strani tečaja in vodnika nameščanja
  - `resources/faq.md` in `resources/glossary.md`: Posodobljene reference AI poglavij
  - `course-outline.md`: Popravljene reference inštruktorjevega vodnika in AI laboratorijskih vaj

- **📅 Oznaka stanja delavnice**: Posodobljena z "V izgradnji" na aktivno stanje delavnice z datumom februar 2026

- **🔗 Navigacija delavnice**: Popravljene pokvarjene navigacijske povezave v README.md delavnice, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Predstavitev delavnice**: Odstranjeno opozorilo "v izgradnji", delavnica je zdaj dokončana in pripravljena za uporabo
- **Konsistentnost navigacije**: Zagotovljena pravilna medmodulska navigacija za vse module delavnice
- **Reference učne poti**: Posodobljene medpoglavne povezave za pravilne poti microsoft-foundry

#### Preverjeno
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so dokončani s cilji učenja
- ✅ Navigacija med poglavji in moduli pravilno deluje
- ✅ Vsebina je primerna za razvijalce AI, ki uporabljajo Microsoft AZD
- ✅ Ohranjen začetniško prijazen jezik in struktura skozi celotno vsebino
- ✅ CONTRIBUTING.md zagotavlja jasna navodila za prispevalce iz skupnosti

#### Tehnična izvedba
- **Preverjanje povezav**: Avtomatiziran PowerShell skript je preveril vse .md notranje povezave
- **Pregled vsebine**: Ročni pregled popolnosti delavnice in primerne stopnje za začetnike
- **Sistem navigacije**: Uporaba doslednih vzorcev v poglavjih in modulih

#### Opombe
- **Obseg**: Spremembe uporabljene samo v angleški dokumentaciji
- **Prevodi**: Prevodi map niso posodobljeni v tej različici (avtomatiziran prevod bo sinhroniziran kasneje)
- **Trajanje delavnice**: Popolna delavnica zdaj ponuja 3-4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Spremljanje, Varnost in Vzorce Multi-Agent
**Ta različica dodaja obsežne učne ure A-ranga o integraciji Application Insights, vzorcih avtentikacije in koordinaciji več agentov za produkcijske namestitve.**

#### Dodano
- **📊 Učna ura o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Naslonjeno na AZD nameščanje z avtomatskim zagonom
  - Popolne predloge Bicep za Application Insights + Log Analytics
  - Delujoče Python aplikacije z lastno telemetrijo (1200+ vrstic)
  - Vzorci spremljanja AI/LLM (sledenje tokov in stroškov Microsoft Foundry modelov)
  - 6 diagramov Mermaid (arhitektura, razporejanje, tok telemetrije)
  - 3 praktične vaje (alarme, nadzorne plošče, AI spremljanje)
  - Kusto primeri poizvedb in strategije optimizacije stroškov
  - Prenos metrik v živo in odpravljanje napak v realnem času
  - 40-50 minut časa učenja z vzorci za produkcijsko uporabo

- **🔐 Učna ura o vzorcih avtentikacije in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci avtentikacije (povezovalne nizi, Key Vault, upravljana identiteta)
  - Popolne predloge infrastrukture Bicep za varne namestitve
  - Node.js koda aplikacij z integracijo Azure SDK
  - 3 kompletne vaje (omogočanje upravljane identitete, identitete uporabnika, rotacije Key Vault)
  - Najboljše varnostne prakse in konfiguracije RBAC
  - Vodnik za odpravljanje težav in analiza stroškov
  - Produkcijsko pripravljeni vzorci avtentikacije brez gesla

- **🤖 Učna ura o koordinacijskih vzorcih multi-agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (zaporedni, vzporedni, hierarhični, sproženi z dogodkom, konsenz)
  - Popolna implementacija storitve orkestratorja (Python/Flask, 1500+ vrstic)
  - 3 specializirane implementacije agentov (Raziskovalec, Pisec, Urednik)
  - Integracija Service Bus za čakanje sporočil
  - Upravljanje stanja Cosmos DB za distribuirane sisteme
  - 6 diagramov Mermaid prikazuje interakcije agentov
  - 3 napredne vaje (upravljanje časovnih omejitev, logika ponovnih poskusov, prekinjevalnik vezja)
  - Razčlenitev stroškov (240-565 $/mesec) z optimizacijskimi strategijami
  - Integracija Application Insights za spremljanje

#### Izboljšano
- **Poglavje pred namestitvijo**: Zdaj vključuje celovite vzorce spremljanja in koordinacije
- **Poglavje za začetek**: Izboljšano s profesionalnimi vzorci avtentikacije
- **Pripravljenost na produkcijo**: Celovito pokritje od varnosti do opazovanja
- **Načrt tečaja**: Posodobljeno z referencami na nove lekcije v poglavjih 3 in 6

#### Spremenjeno
- **Napredovanje učenja**: Boljša integracija varnosti in spremljanja skozi celoten tečaj
- **Kakovost dokumentacije**: Dosledni A-rang standardi (95-97 %) v novih lekcijah
- **Produkcijski vzorci**: Popolno pokritje od začetka do konca za enterprise nameščanja

#### Izboljšano
- **Izkušnja razvijalca**: Jasna pot od razvoja do spremljanja produkcije
- **Varnostni standardi**: Profesionalni vzorci za avtentikacijo in upravljanje skrivnosti
- **Opazovanje**: Popolna integracija Application Insights z AZD
- **AI delovne obremenitve**: Specializirano spremljanje Microsoft Foundry modelov in multi-agent sistemov

#### Preverjeno
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne le odrezke)
- ✅ Mermaid diagrami za vizualno učenje (skupno 19 v 3 lekcijah)
- ✅ Praktične vaje z verifikacijskimi koraki (9 skupaj)
- ✅ Produkcijsko pripravljene predloge Bicep, ki jih je mogoče namestiti preko `azd up`
- ✅ Analiza stroškov in optimizacijske strategije
- ✅ Vodniki za odpravljanje težav in najboljše prakse
- ✅ Kontrolne točke znanja z verifikacijskimi ukazi

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Celovit vodnik za spremljanje
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture multi-agentov
- **Splošna nova vsebina**: - Dosledni visoko kakovostni standardi

#### Tehnična izvedba
- **Application Insights**: Log Analytics + lastna telemetrija + distribuirano sledenje
- **Avtentikacija**: Upravljana identiteta + Key Vault + RBAC vzorci
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Spremljanje**: Prenos metrik v živo + Kusto poizvedbe + alarme + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike zadrževanja, proračunski nadzor

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Microsoft Foundry modelov
**Ta različica izboljšuje kakovost dokumentacije po celotnem repozitoriju in dodaja popoln primer namestitve Microsoft Foundry modelov z vmesnikom za klepet gpt-4.1.**

#### Dodano
- **🤖 Primer klepeta Microsoft Foundry modelov**: Popolna namestitev gpt-4.1 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Microsoft Foundry modelov (namestitev modela gpt-4.1)
  - Python ukazna vrstica za klepet z zgodovino pogovorov
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje porabi tokenov in ocen stroškov
  - Omejitve hitrosti in obravnava napak
  - Celovit README z vodičem za namestitev 35-45 minut
  - 11 datotek pripravljeno za produkcijo (predloge Bicep, Python aplikacija, konfiguracija)
- **📚 Vaje iz dokumentacije**: Dodane praktične vaje v vodič za konfiguracijo:
  - Vaja 1: Konfiguracija za več okolij (15 minut)
  - Vaja 2: Praksa upravljanja skrivnosti (10 minut)
  - Jasna merila uspeha in koraki preverjanja
- **✅ Preverjanje namestitve**: Dodan razdelek preverjanja v vodič za namestitev:
  - Postopki preverjanja stanja sistema
  - Kontrolni seznam meril uspeha
  - Pričakovani rezultati za vse ukaze namestitve
  - Hitra referenca za odpravljanje težav

#### Izboljšano
- **examples/README.md**: Posodobljen na kakovost A-ranga (93 %):
  - Dodan azure-openai-chat v vse relevantne razdelke
  - Posodobljeno število lokalnih primerov iz 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v hitri začetek za srednje uporabnike
  - Dodano v razdelek Microsoft Foundry predlog
  - Posodobljena primerjalna matrika in razdelki za iskanje tehnologij
- **Kakovost dokumentacije**: Izboljšano B+ (87%) → A- (92%) v celotni mapi z dokumenti:
  - Dodani pričakovani izhodi kritičnim primerom ukazov
  - Vključeni postopki preverjanja za spremembe konfiguracije
  - Izboljšano praktično učenje s praktičnimi vajami

#### Spremenjeno
- **Napredek učenja**: Boljša integracija primerov AI za vmesne uporabnike
- **Struktura dokumentacije**: Več dejanskih vaj s jasnimi rezultati
- **Postopek preverjanja**: Dodani jasni kriteriji uspešnosti ključnim delovnim tokovom

#### Izboljšano
- **Razvojna izkušnja**: Implementacija Microsoft Foundry Models zdaj traja 35-45 minut (v primerjavi s 60-90 za kompleksne alternative)
- **Preglednost stroškov**: Jasne ocene stroškov ($50-200/mesec) za primer Microsoft Foundry Models
- **Pot učenja**: Razvijalci AI imajo jasno začetno točko z azure-openai-chat
- **Standardi dokumentacije**: Dosledni pričakovani rezultati in postopki preverjanja

#### Preverjeno
- ✅ Microsoft Foundry Models primer v celoti delujoč z `azd up`
- ✅ Vse 11 izvedbenih datotek sintaktično pravilnih
- ✅ Navodila v README usklajena z dejansko izkušnjo nameščanja
- ✅ Povezave v dokumentaciji posodobljene na več kot 8 mestih
- ✅ Indeks primerov natančno odraža 4 lokalne primere
- ✅ Brez podvojenih zunanjih povezav v tabelah
- ✅ Vse navigacijske reference pravilne

#### Tehnična implementacija
- **Arhitektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps vzorec
- **Varnost**: Pripravljen upravljani identiteti, skrivnosti v Key Vault
- **Nadzor**: Integracija Application Insights
- **Upravljanje stroškov**: Sledenje tokenov in optimizacija uporabe
- **Nameščanje**: En ukaz `azd up` za celotno nastavitev

### [v3.6.0] - 2025-11-19

#### Glavna posodobitev: Primeri nameščanja Container App
**Ta različica uvaja celovite, za produkcijsko rabo pripravljene primere nameščanja kontejnerskih aplikacij z uporabo Azure Developer CLI (AZD), z obsežno dokumentacijo in integracijo v pot učenja.**

#### Dodano
- **🚀 Primeri Container App**: Novi lokalni primeri v `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Celovit pregled kontejneriziranih nameščanj, hitri začetek, produkcija in napredni vzorci
  - [Preprost Flask API](../../examples/container-app/simple-flask-api): Prijazni REST API za začetnike s skaliranjem na nič, zdravstvenimi pregledi, nadzorom in odpravljanjem napak
  - [Arhitektura mikrostoritev](../../examples/container-app/microservices): Za produkcijsko rabo pripravljen razširjen razpored storitev (API Gateway, Product, Order, User, Notification), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, porazdeljeno sledenje, blue-green/canary nameščanje
- **Najboljše prakse**: Varnost, nadzor, optimizacija stroškov in smernice CI/CD za kontejnerizirane delovne obremenitve
- **Vzorci kode**: Celoten `azure.yaml`, Bicep predloge in izvajanje storitev v več jezikih (Python, Node.js, C#, Go)
- **Testiranje in odpravljanje napak**: Celostni testni scenariji, nadzorne komande, smernice za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljen za prikaz in povezavo do novih primerov container app pod "Lokalni primeri - kontejnerske aplikacije"
- **examples/README.md**: Posodobljen za izpostavitev primerov container app, dodajanje primerjalnih matrik in posodobitev tehnoloških/arhitekturnih referenc
- **Načrt tečaja in študijski vodič**: Posodobljen za sklicevanje na nove primere container app in vzorce nameščanja v ustreznih poglavjih

#### Preverjeno
- ✅ Vsi novi primeri so nameščivi z `azd up` in sledijo najboljšim praksam
- ✅ Povezave med dokumenti in navigacija posodobljene
- ✅ Primeri pokrivajo začetniške do napredne scenarije, vključno s produkcijskimi mikrostoritvami

#### Opombe
- **Obseg**: Samo angleška dokumentacija in primeri
- **Naslednji koraki**: Razširitev z dodatnimi naprednimi kontejnerskimi vzorci in avtomatizacijo CI/CD v prihodnjih različicah

### [v3.5.0] - 2025-11-19

#### Preimenovanje izdelka: Microsoft Foundry
**Ta različica izvaja celovito spremembo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preimenovanje Microsofta.**

#### Spremenjeno
- **🔄 Posodobitev imena izdelka**: Popolno preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljene vse reference v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupno: 23 vsebinskih referenc posodobljenih v 7 dokumentacijskih datotekah

- **📁 Spremembe strukture mape**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Vse križne reference posodobljene za odražanje nove strukture
  - Navigacijske povezave preverjene v celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Vse notranje povezave posodobljene za nove imena datotek

#### Posodobljene datoteke
- **Poglavje dokumentacije** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 posodobitve referenc imena izdelka
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (od prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 posodobljene reference (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 posodobljene križne povezave
  - `docs/getting-started/first-project.md` - 2 posodobljene navigacijske povezave poglavij
  - `docs/getting-started/installation.md` - 2 posodobljeni nadaljnji povezavi poglavij
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 posodobljene reference (navigacija, Discord skupnost)
  - `docs/troubleshooting/common-issues.md` - 1 posodobljena navigacijska povezava
  - `docs/troubleshooting/debugging.md` - 1 posodobljena navigacijska povezava

- **Struktura datotek tečaja** (2 datoteki):
  - `README.md` - 17 posodobitev referenc (pregled tečaja, naslovi poglavij, odsek s predlogami, vpogledi skupnosti)
  - `course-outline.md` - 14 posodobitev referenc (pregled, cilji učenja, viri poglavij)

#### Preverjeno
- ✅ Nobenih preostalih poti do mape "ai-foundry" v angleških dokumentih
- ✅ Nobenih preostalih referenc imena izdelka "Microsoft Foundry" v angleških dokumentih
- ✅ Vse navigacijske povezave delujejo z novo strukturo map
- ✅ Preimenovanja datotek in map uspešno izvedena
- ✅ Križne reference med poglavji preverjene

#### Opombe
- **Obseg**: Spremembe uporabljene samo v angleški dokumentaciji v mapi `docs/`
- **Prevodi**: Mape za prevode (`translations/`) v tej različici niso posodobljene
- **Delavnica**: Gradiva delavnic (`workshop/`) niso posodobljena v tej različici
- **Primeri**: Datoteke primerov lahko še vedno vsebujejo stare poimenovalne reference (bodo obravnavane v prihodnji posodobitvi)
- **Zunanje povezave**: Zunanji URL-ji in reference GitHub skladišča ostajajo nespremenjeni

#### Vodnik za migracijo za prispevalce
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite reference do map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite reference do datotek: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje povezave v dokumentaciji še delujejo

---

### [v3.4.0] - 2025-10-24

#### Izboljšave predogleda infrastrukture in validacije
**Ta različica uvaja obsežno podporo novi funkciji predogleda Azure Developer CLI in izboljšuje uporabniško izkušnjo delavnice.**

#### Dodano
- **🧪 Dokumentacija funkcije azd provision --preview**: Celovita pokritost nove zmožnosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v hiti listi
  - Podrobna integracija v vodič za zagotavljanje z uporabo primerov in koristi
  - Integracija preverjanja pred zagonom za varnejšo validacijo nameščanja
  - Posodobitve vodiča za začetek z varnostno prednostjo pri nameščanju
- **🚧 Pasica statusa delavnice**: Profesionalna HTML pasica, ki označuje status razvoja delavnice
  - Oblikovanje z gradientom in indikatorji gradnje za jasno komunikacijo uporabnikom
  - Čas zadnje posodobitve za transparentnost
  - Prilagodljiva oblika za mobilne naprave

#### Izboljšano
- **Varnost infrastrukture**: Funkcionalnost predogleda vključena po vsej dokumentaciji za nameščanje
- **Validacija pred nameščanjem**: Samodejni skripti sedaj vključujejo testiranje predogleda infrastrukture
- **Razvojni delovni tok**: Posodobljene sekvence ukazov za vključitev predogleda kot dobre prakse
- **Izkušnja delavnice**: Jasna pričakovanja za uporabnike glede statusa razvoja vsebine

#### Spremenjeno
- **Najboljše prakse nameščanja**: Priporočena je sedaj metoda z najprej predogledom
- **Tok dokumentacije**: Preverjanje infrastrukture premaknjeno prej v proces učenja
- **Predstavitev delavnice**: Profesionalna komunikacija statusa z jasnim časovnim okvirom razvoja

#### Izboljšano
- **Pristop s prvo varnostjo**: Spremembe infrastrukture je zdaj mogoče validirati pred nameščanjem
- **Sodelovanje ekipe**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred zagotavljanjem
- **Omejevanje tveganj**: Manj neuspehov nameščanja z napredno validacijo

#### Tehnična implementacija
- **Integracija več dokumentov**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorci ukazov**: Konsistentna sintaksa in primeri skozi vso dokumentacijo
- **Integracija najboljših praks**: Predogled vključen v delovne tokove in skripte za preverjanje
- **Vizualni indikatorji**: Jasne oznake NOVE funkcije za lažje odkrivanje

#### Infrastruktura delavnice
- **Komunikacija statusa**: Profesionalna HTML pasica z gradientno obliko
- **Uporabniška izkušnja**: Jasno prikazano stanje razvoja preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja kredibilnost skladišča in postavlja pričakovanja
- **Transparentnost časovnice**: Marca 2025 datum zadnje posodobitve za odgovornost

### [v3.3.0] - 2025-09-24

#### Izboljšane delavnice in interaktivna učna izkušnja
**Ta različica uvaja obsežna gradiva za delavnice z interaktivnimi vodiči v brskalniku in strukturiranimi učnimi potmi.**

#### Dodano
- **🎥 Interaktivni vodič delavnice**: Delavnica v brskalniku z možnostjo predogleda MkDocs
- **📝 Strukturirana navodila za delavnico**: 7-stopenjska vodena učna pot od odkrivanja do prilagoditve
  - 0-Uvod: Pregled delavnice in nastavitev
  - 1-Izbor AI predloge: Postopek odkrivanja in izbire predloge
  - 2-Validacija AI predloge: Postopki nameščanja in preverjanja
  - 3-Razklop AI predloge: Razumevanje arhitekture predloge
  - 4-Konfiguracija AI predloge: Nastavitve in prilagoditve
  - 5-Prilagoditev AI predloge: Napredne spremembe in iteracije
  - 6-Razpustitev infrastrukture: Čiščenje in upravljanje virov
  - 7-Zaključek: Povzetek in naslednji koraki
- **🛠️ Orodja za delavnico**: Nastavitve MkDocs z Material temo za izboljšano učno izkušnjo
- **🎯 Pot ročnega učenja**: 3-stopenjska metodologija (Odkrivanje → Nameščanje → Prilagoditev)
- **📱 Integracija GitHub Codespaces**: Nemotena nastavitev razvojnega okolja

#### Izboljšano
- **AI delavnica v laboratoriju**: Razširjena z obsežno 2-3 urno strukturirano učno izkušnjo
- **Dokumentacija delavnice**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Napredek učenja**: Jasna korak-po-korak navodila od izbire predloge do produkcijskega nameščanja
- **Razvojna izkušnja**: Integrirana orodja za poenostavljene razvojne delovne procese

#### Izboljšano
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, funkcionalnostjo kopiranja in preklopom tem
- **Učenje s samostojnim tempom**: Prilagodljiva struktura delavnice za različne hitrosti učenja
- **Praktična uporaba**: Scenariji za nameščanje AI predlog v resničnem svetu
- **Integracija skupnosti**: Vključitev Discord povezave za podporo delavnice in sodelovanje

#### Značilnosti delavnice
- **Vgrajeno iskanje**: Hitro iskanje ključnih besed in lekcij
- **Kopiranje blokov kode**: Funkcija za kopiranje z lebdenjem nad primeri kode
- **Preklop teme**: Podpora za temen/svetel način za različne želje
- **Vizualna gradiva**: Posnetki zaslona in diagrami za boljše razumevanje
- **Integracija pomoči**: Neposredni dostop do Discord skupnosti za podporo

### [v3.2.0] - 2025-09-17

#### Velika prestrukturiranje navigacije in učni sistem na osnovi poglavij
**Ta različica uvaja celovit učni sistem, organiziran po poglavjih, z izboljšano navigacijo skozi celotno skladišče.**

#### Dodano
- **📚 Učni sistem na osnovi poglavij**: Celotno izobraževanje preurejeno v 8 progresivnih učnih poglavij
  - Poglavje 1: Osnove in hitri začetek (⭐ - 30-45 minut)
  - Poglavje 2: AI-prvi razvoj (⭐⭐ - 1-2 uri)
  - Poglavje 3: Konfiguracija in avtentikacija (⭐⭐ - 45-60 minut)
  - Poglavje 4: Infrastruktura kot koda in nameščanje (⭐⭐⭐ - 1-1.5 ure)
  - Poglavje 5: Multi-agentne AI rešitve (⭐⭐⭐⭐ - 2-3 ure)
  - Poglavje 6: Validacija in načrtovanje pred nameščanjem (⭐⭐ - 1 ura)
  - Poglavje 7: Odpravljanje napak in razhroščevanje (⭐⭐ - 1-1.5 ure)
  - Poglavje 8: Produkcijski in poslovni vzorci (⭐⭐⭐⭐ - 2-3 ure)
- **📚 Celovit navigacijski sistem**: Dosledni glavi in nogi za navigacijo v celotni dokumentaciji
- **🎯 Sledenje napredku**: Seznam opravil za zaključek tečaja in sistem preverjanja znanja
- **🗺️ Vodenje učne poti**: Jasne začetne točke za različne ravni znanja in cilje
- **🔗 Križna navigacija**: Jasne povezave na sorodna poglavja in predpogoje

#### Izboljšano
- **Struktura README**: Preoblikovana v strukturirano učna platforma z organizacijo po poglavjih
- **Navigacija dokumentacije**: Vsaka stran sedaj vsebuje kontekst poglavja in navodila za napredek
- **Organizacija predlog**: Primeri in predloge razporejene v ustrezna učna poglavja
- **Integracija virov**: Hiti listi, pogosta vprašanja in študijski vodiči povezani z relevantnimi poglavji
- **Integracija delavnic**: Praktične laboratorijske vaje usklajene z več učnimi cilji poglavij

#### Spremenjeno
- **Napredek učenja**: Prehod iz linearne dokumentacije na prilagodljivo učenje po poglavjih
- **Postavitev konfiguracije**: Prenesli vodnik za konfiguracijo kot Poglavje 3 za boljši potek učenja
- **Integracija vsebin AI**: Boljša integracija vsebin, specifičnih za AI, skozi celotno učno pot
- **Produkcijska vsebina**: Napredni vzorci združeni v Poglavju 8 za učence na ravni podjetij

#### Izboljšano
- **Uporabniška izkušnja**: Jasne navigacijske drobtinice in kazalci napredka po poglavjih
- **Dostopnost**: Konsistentni vzorci navigacije za lažje premikanje po tečaju
- **Profesionalna predstavitev**: Univerzitetna struktura tečaja primerna za akademsko in korporativno usposabljanje
- **Učinkovitost učenja**: Skrajšan čas iskanja relevantnih vsebin z izboljšano organizacijo

#### Tehnična izvedba
- **Glave navigacije**: Standardizirana navigacija po poglavjih v več kot 40 dokumentacijskih datotekah
- **Navigacija v nogi strani**: Konsistentno vodenje napredka in kazalci zaključka poglavij
- **Medsebojno povezovanje**: Izčrpen sistem notranjih povezav, ki povezuje sorodne koncepte
- **Mapiranje poglavij**: Predloge in primeri jasno povezani z učnimi cilji

#### Izboljšava študijskega vodiča
- **📚 Izčrpni učni cilji**: Prenovljen študijski vodič za uskladitev z 8-poglavnim sistemom
- **🎯 Ocena po poglavjih**: Vsako poglavje vsebuje specifične učne cilje in praktične vaje
- **📋 Sledenje napredku**: Tedenski učni urnik z merljivimi rezultati in kontrolnimi seznami za dokončanje
- **❓ Vprašanja za ocenjevanje**: Vprašanja za preverjanje znanja za vsako poglavje s strokovnimi izidi
- **🛠️ Praktične vaje**: Praktične dejavnosti z resničnimi scenariji nameščanja in odpravljanja težav
- **📊 Napredek veščin**: Jasno napredovanje od osnovnih konceptov do vzorcev za podjetja z osredotočenostjo na karierni razvoj
- **🎓 Okvir za certificiranje**: Strokovni razvojni cilji in sistem skupnostnega priznanja
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 2025-09-17

#### Izboljšane več-agentne AI rešitve
**Ta različica izboljšuje več-agentno rešitev za maloprodajo z boljšo poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremembe
- **Terminologija več agentov**: "Cora agent" zamenjan z "Agent stranke" po celotni več-agentni maloprodajni rešitvi za jasnejše razumevanje
- **Arhitektura agentov**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode za dosledno poimenovanje "Agent stranke"
- **Primeri konfiguracije**: Posodobljeni vzorci konfiguracije agentov z novo konvencijo poimenovanja
- **Konsistentnost dokumentacije**: Zagotovljena uporaba strokovnih in opisnih imen agentov v vseh omembe

#### Izboljšano
- **Paket ARM predlog**: Posodobljen retail-multiagent-arm-template z navedbami Agenta stranke
- **Arhitekturni diagrami**: Osveženi Mermaid diagrami z novim poimenovanjem agentov
- **Primeri kode**: Python razredi in primeri implementacije sedaj uporabljajo poimenovanje CustomerAgent
- **Okoljske spremenljivke**: Posodobljeni vsi skripti za nameščanje za uporabo konvencij CUSTOMER_AGENT_NAME

#### Izboljšano
- **Razvijalska izkušnja**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za produkcijo**: Boljše usklajevanje s korporativnimi konvencijami poimenovanja
- **Učne vsebine**: Bolj intuitivno poimenovanje agentov za izobraževalne namene
- **Uporabnost predlog**: Poenostavljeno razumevanje funkcij agentov in vzorcev nameščanja

#### Tehnični podatki
- Posodobljeni Mermaid arhitekturni diagrami z referencami na CustomerAgent
- Zamenjana imena razredov CoraAgent s CustomerAgent v Python primerih
- Spremenjene ARM predloge JSON konfiguracije za uporabo tipa agenta "customer"
- Posodobljene okoljske spremenljivke iz CORA_AGENT_* v CUSTOMER_AGENT_*
- Osvežene vse komande za nameščanje in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Večje spremembe - Osredotočenost na AI razvijalce in integracija Microsoft Foundry
**Ta različica preoblikuje repozitorij v obsežen vir učenja, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Dodano
- **🤖 Učna pot z osredotočenostjo na AI**: Popolna prenova z osredotočenjem na AI razvijalce in inženirje
- **Vodnik za integracijo Microsoft Foundry**: Izčrpna dokumentacija za povezavo AZD s storitvami Microsoft Foundry
- **Vzorci nameščanja AI modelov**: Podroben vodnik o izbiri modelov, konfiguraciji in strategijah produkcijskega nameščanja
- **Delavnica AI**: 2-3 urna praktična delavnica za pretvorbo AI aplikacij v rešitve primerne za AZD nameščanje
- **Najboljše prakse produkcijskega AI**: Podjetniško pripravljeni vzorci za skaliranje, nadzor in varovanje AI delovnih obremenitev
- **Vodnik za odpravljanje težav specifičnih za AI**: Izčrpen vodič za odpravljanje težav z Microsoft Foundry modeli, kognitivnimi storitvami in AI nameščanjem
- **Galerija AI predlog**: Izbor Microsoft Foundry predlog s stopnjami zahtevnosti
- **Materiali za delavnico**: Celotna struktura delavnice s praktičnimi vajami in referenčnimi materiali

#### Izboljšano
- **Struktura README**: Osredotočeno na AI razvijalce s 45 % podatkov o interesu skupnosti iz Microsoft Foundry Discord
- **Učne poti**: Posvečena pot razvijalca AI poleg tradicionalnih poti za študente in DevOps inženirje
- **Priporočila predlog**: Izpostavljene AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Skupnostna integracija**: Izboljšana podpora Discord skupnosti z AI-specifičnimi kanali in debatami

#### Varnost in produkcijska osredotočenost
- **Vzorec upravljane identitete**: AI-specifične avtentikacijske in varnostne konfiguracije
- **Optimizacija stroškov**: Sledenje uporabi žetonov in nadzor proračuna za AI delovne obremenitve
- **Več-regionalno nameščanje**: Strategije za globalno nameščanje AI aplikacij
- **Nadzor zmogljivosti**: AI-specifični metri in integracija Application Insights

#### Kvaliteta dokumentacije
- **Linearna struktura tečaja**: Logičen napredek od začetniških do naprednih vzorcev AI nameščanja
- **Preverjeni URL-ji**: Vse zunanje povezave do repozitorijev so preverjene in dostopne
- **Popolne reference**: Vse notranje dokumentacijske povezave so preverjene in delujejo
- **Pripravljeno za produkcijo**: Podjetniški vzorci nameščanja z realnimi primeri

### [v2.0.0] - 2025-09-09

#### Večje spremembe - Prenova repozitorija in profesionalna izboljšava
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebine.**

#### Dodano
- **Strukturiran učni okvir**: Vse dokumentacijske strani zdaj vključujejo uvod, učne cilje in učne rezultate
- **Navigacijski sistem**: Dodane povezave na prejšnjo/naslednjo lekcijo za vodeno učenje skozi celotno dokumentacijo
- **Študijski vodič**: Izčrpen study-guide.md z učnimi cilji, praktičnimi vajami in ocenjevalnimi materiali
- **Profesionalna predstavitev**: Odstranjeni vsi emoji ikoni za boljšo dostopnost in profesionalen videz
- **Izboljšana struktura vsebine**: Izboljšana organizacija in potek učnih gradiv

#### Spremenjeno
- **Format dokumentacije**: Standardizirani vsi dokumenti z dosledno strukturo usmerjeno v učenje
- **Potek navigacije**: Uveden logični napredek skozi vsa učna gradiva
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v prid jasni, profesionalni obliki
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emojijev za boljšo združljivost z bralniki zaslona
- **Profesionalen videz**: Čista, akademskega sloga predstavitev primerna za podjetniško učenje
- **Učna izkušnja**: Strukturiran pristop z jasnimi cilji in rezultati za vsako lekcijo
- **Organizacija vsebine**: Boljši logični potek in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prvotna izdaja - Celovit repozitorij za učenje AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Popoln serijski vodič za začetek
  - Izčrpna dokumentacija za nameščanje in zagotavljanje storitev
  - Podrobni viri za odpravljanje težav in vodniki za odpravljanje napak
  - Orodja in postopki za preverjanje pred nameščanjem

- **Modul za začetek uporabe**
  - Osnove AZD: ključni koncepti in terminologija
  - Vodnik za namestitev: navodila za platformo specifično nastavitev
  - Vodnik za konfiguracijo: nastavitev okolja in avtentikacija
  - Prvi projekt: praktično učenje po korakih

- **Modul za nameščanje in zagotavljanje**
  - Vodnik za nameščanje: popolna dokumentacija poteka dela
  - Vodnik za zagotavljanje: infrastruktura kot koda z Bicep
  - Najboljše prakse za produkcijska nameščanja
  - Vzorci arhitekture z več storitvami

- **Modul za preverjanje pred nameščanjem**
  - Načrtovanje kapacitet: preverjanje razpoložljivosti Azure virov
  - Izbira SKU: izčrpen vodič po nivojih storitev
  - Predhodni pregledi: avtomatizirani preverjevalni skripti (PowerShell in Bash)
  - Orodja za ocenjevanje stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: pogosto nastajajoči problemi in rešitve
  - Vodnik za odpravljanje napak: sistematične metode odpravljanja težav
  - Napredne diagnostične tehnike in orodja
  - Nadzor zmogljivosti in optimizacija

- **Viri in reference**
  - Hitri pregled ukazov: kratek pregled osnovnih ukazov
  - Slovarček: izčrpen seznam terminologije in kratic
  - Pogosta vprašanja: podrobni odgovori na pogosta vprašanja
  - Zunanje povezave do virov in skupnostnih povezav

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za nameščanje statične spletne strani
  - Konfiguracija aplikacije v kontejnerju
  - Vzorci integracije podatkovnih baz
  - Primeri arhitekture mikro storitev
  - Implementacije serverless funkcij

#### Značilnosti
- **Večplatformna podpora**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Več stopenj znanja**: Vsebina prilagojena za študente in profesionalne razvijalce
- **Praktični fokus**: Praktični primeri in scenariji iz resničnega sveta
- **Izčrpno pokritje**: Od osnovnih konceptov do naprednih vzorcev za podjetja
- **Pristop z varnostjo na prvem mestu**: Vgrajene najboljše varnostne prakse skozi celotno vsebino
- **Optimizacija stroškov**: Navodila za stroškovno učinkovito nameščanje in upravljanje virov

#### Kvaliteta dokumentacije
- **Podrobni primeri kode**: Praktični, preizkušeni primeri kode
- **Navodila po korakih**: Jasna, ukazna navodila
- **Izčrpno upravljanje napak**: Odpravljanje težav za pogoste napake
- **Integracija najboljših praks**: Standardi in priporočila industrije
- **Združljivost različic**: Posodobljeno z najnovejšimi storitvami Azure in funkcijami azd

## Načrtovane prihodnje izboljšave

### Različica 3.1.0 (načrtovano)
#### Razširitev AI platforme
- **Podpora za več modelov**: Integracijski vzorci za Hugging Face, Azure Machine Learning in prilagojene modele
- **Okviri za AI agente**: Predloge za LangChain, Semantic Kernel in AutoGen nameščanja
- **Napredni RAG vzorci**: Možnosti vektorskih baz podatkov poleg Azure AI Search (Pinecone, Weaviate itd.)
- **AI opazovanje**: Izboljšan nadzor delovanja modelov, uporabe žetonov in kakovosti odzivov

#### Izkušnja razvijalca
- **Razširitev VS Code**: Integrirana izkušnja razvoja AZD + Microsoft Foundry
- **Integracija GitHub Copilot**: Generiranje AI-podprtih predlog AZD
- **Interaktivni tutorijali**: Praktične kode vaje z avtomatsko validacijo za AI scenarije
- **Video vsebine**: Dopolnilni video vodiči za vizualne učence s poudarkom na AI nameščanjih

### Različica 4.0.0 (načrtovano)
#### Podjetniški AI vzorci
- **Upraviteljski okvir**: Upravljenje AI modelov, skladnost in revizijski sledovi
- **Večnajemniški AI**: Vzorci za strežbo več strank z izoliranimi AI storitvami
- **Edge AI nameščanje**: Integracija z Azure IoT Edge in kontejnerskimi primerki
- **Hibridni oblačni AI**: Večoblačni in hibridni vzorci nameščanja za AI delovne obremenitve

#### Napredne funkcije
- **Avtomatizacija AI cevovodov**: Integracija MLOps s cevovodi Azure Machine Learning
- **Napredna varnost**: Vzorci zero-trust, zasebni končni točki in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredno ščuvanje in strategije skaliranja za AI aplikacije z veliko prepustnostjo
- **Globalna distribucija**: Vzorce dostave vsebin in edge keširanja za AI aplikacije

### Različica 3.0.0 (načrtovano) - Nadomeščena s trenutno izdajo
#### Predlagane dodatke - Zdaj izvedeno v v3.0.0
- ✅ **Vsebina osredotočena na AI**: Izčrpna integracija Microsoft Foundry (Dokončano)
- ✅ **Interaktivni tutorijali**: AI delavnica z ročnimi vajami (Dokončano)
- ✅ **Napredni varnostni modul**: AI-specifični varnostni vzorci (Dokončano)
- ✅ **Optimizacija zmogljivosti**: Strategije za nastavljanje AI delovnih obremenitev (Dokončano)

### Različica 2.1.0 (načrtovano) - Delno izvedeno v v3.0.0
#### Manjše izboljšave - Nekatere dokončane v trenutni izdaji
- ✅ **Dodatni primeri**: AI-osredotočeni scenariji nameščanja (Dokončano)
- ✅ **Razširjen FAQ**: AI-specificna vprašanja in odpravljanje težav (Dokončano)
- **Integracija orodij**: Izboljšani vodiči za integracijo IDE in urejevalnikov
- ✅ **Razširjen nadzor**: AI-specificni vzorci nadzora in obveščanja (Dokončano)

#### Še vedno načrtovano za prihodnjo izdajo
- **Dokumentacija prijazna mobilnim napravam**: Prilagodljiv dizajn za mobilno učenje
- **Dostop brez povezave**: Paketi dokumentacije za prenos
- **Izboljšana integracija IDE**: Razširitev VS Code za delovne tokove AZD + AI
- **Nadzorna plošča skupnosti**: Metrične podatke v realnem času in sledenje prispevkov

## Prispevanje k dnevniku sprememb

### Poročanje o spremembah
Pri prispevanju v ta repozitorij prosim zagotovite, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: Upoštevajoč semantično verzioniranje (glavna.manjša.popravek)
2. **Datum**: Datum izdaje ali posodobitve v formatu LLLL-MM-DD
3. **Kategorija**: Dodano, Spremenjeno, Opustjeno, Odstranjeno, Popravljeno, Varnost
4. **Jasen opis**: Jedrnat opis spremenjenega
5. **Vplivna ocena**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcionalnosti, dokumentacijski razdelki ali zmožnosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripti ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve z namenom izboljšanja jasnosti ali točnosti
- Prenova vsebine ali organizacije

#### Opustjeno
- Funkcije ali pristopi, ki se postopoma umikajo
- Dokumentacijski razdelki, predvideni za odstranitev
- Metode, ki imajo boljše alternative

#### Odstranjeno
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali opuščeni pristopi
- Odvečna ali združena vsebina

#### Popravljeno
- Popravki napak v dokumentaciji ali kodi
- Rešitve prijavljenih težav ali problemov
- Izboljšave točnosti ali delovanja

#### Varnost
- Izboljšave ali popravki, povezani z varnostjo
- Posodobitve najboljših varnostnih praks
- Odprava varnostnih ranljivosti

### Smernice za semantično verzioniranje

#### Glavna različica (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrepanje uporabnika
- Pomembna prenova vsebine ali organizacije
- Spremembe, ki spreminjajo temeljni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Nove funkcionalnosti ali dodatki k vsebini
- Izboljšave, ki ohranjajo združljivost z prejšnjimi različicami
- Dodatni primeri, orodja ali viri

#### Popravek različice (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Poenostavitve in manjše izboljšave

## Povratne informacije skupnosti in predlogi

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega gradiva:

### Kako podati povratne informacije
- **GitHub Issues**: Prijava težav ali predlogov za izboljšave (tudi specifično za AI)
- **Discord Pogovori**: Delite ideje in se vključite v skupnost Microsoft Foundry
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, še posebej predloge in vodiče za AI
- **Microsoft Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Forumi Skupnosti**: Pridružite se širšim razpravam med razvijalci Azure

### Kategorije povratnih informacij
- **Natančnost vsebine AI**: Popravki informacij o integraciji in uvajanju AI storitev
- **Učna izkušnja**: Predlogi za izboljšano učno pot za AI razvijalce
- **Manjkajoča AI vsebina**: Zahteve za dodatne AI predloge, vzorce ali primere
- **Dostopnost**: Izboljšave za različne učne potrebe
- **Integracija AI orodij**: Predlogi za boljšo integracijo razvojnega procesa AI
- **Produkcijski AI vzorci**: Zahteve po vzorcih uvajanja AI za podjetja

### Zaveza odgovora
- **Odgovori na težave**: V 48 urah za prijavljene probleme
- **Zahteve za funkcije**: Pregled v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Prioriteta takojšnjega odziva

## Razpored vzdrževanja

### Redne posodobitve
- **Mesečni pregledi**: Preverjanje natančnosti vsebine in povezav
- **Četrtletne posodobitve**: Večji dodatki in izboljšave vsebine
- **Polletni pregledi**: Celovita prenova in izboljšave
- **Letne izdaje**: Večje različice z znatnimi izboljšavami

### Spremljanje in zagotavljanje kakovosti
- **Avtomatizirano testiranje**: Redna validacija primerov kode in povezav
- **Vključevanje povratnih informacij skupnosti**: Redna integracija uporabniških predlogov
- **Tehnološke posodobitve**: Usklajevanje z najnovejšimi storitvami Azure in izdajami azd
- **Preverjanja dostopnosti**: Redni pregledi za vključujoče dizajnerske principe

## Politika podpiranja različic

### Podpora za trenutne različice
- **Zadnja večja različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja večja različica**: Varnostni popravki in kritične popravke 12 mesecev
- **Zgodovinske različice**: Samo podpora skupnosti, brez uradnih posodobitev

### Navodila za migracijo
Ob izidu večjih različic zagotavljamo:
- **Vodnike za migracijo**: Korak za korakom navodila za prehod
- **Opombe o združljivosti**: Podrobnosti o prelomnih spremembah
- **Orodna podpora**: Skripte ali pripomočki za pomoč pri migraciji
- **Podpora skupnosti**: Namenske platforme za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Študijsko gradivo](resources/study-guide.md)
- **Naslednja lekcija**: Povratek na [Glavni README](README.md)

**Ostanite obveščeni**: Spremljajte to repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
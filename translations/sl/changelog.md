# Dnevnik sprememb - AZD Za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD Za začetnike. Sledimo načelom semantičnega verzioniranja in vzdržujemo ta dnevnik, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z pregledom tega dnevnika sprememb boste:
- Ostali obveščeni o novih funkcijah in dodatkih vsebi
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali popravke napak in korekcije za zagotovitev točnosti
- Spremljali razvoj učnih materialov skozi čas

## Rezultati učenja

Po pregledu vnosov dnevnika sprememb boste lahko:
- Prepoznali nove vsebine in vire, ki so na voljo za učenje
- Razumeli, kateri odseki so bili posodobljeni ali izboljšani
- Načrtovali svojo učna pot glede na najsodobnejše materiale
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.24.0]- 2026-11-04

#### Popravljeno
- Popravljena navigacija tečaja v angleščini, poti premaknjenih strani, manjkajoče sidrna mesta in zastarele zunanje reference, vključno s povezavo do 2. poglavja vodnika o proizvodni AI.
- Pregledani trenutni napotki glede objavljenih AZD 1.37.2, agentov 1.0.0-beta.23 in ocen 1.0.0-beta.2. Dokumentirana ločena delovna tokova `azd ai eval` in migracija optimizacijske konfiguracije.
- Popravljene nepodprte CLI zastavice, meje avtentikacije, napotki glede besedilnega okolja/skrivnosti, posodobitve infrastrukture, konfiguracije modela ter primeri uničujočega okrevanja.
- Osvežen delavnica glede na trenutni primer AI agentov, vključno z dejanskimi kljuki, vhodnimi konfiguracijami, testiranjem ocen, točkami za red-teaming in opazovanjem.
- Popravljeni navedki primerov implementacije in popravljene sorodne težave v aplikacijah/infrastrukturi/konfiguraciji. Material o arhitekturi trgovine je jasno ločen od popolne delujoče aplikacije.
- Obnovljena CodeQL jezikovna matrika, izbran podprti Node.js 24 za razvojni kontejner in narejeni validacijski postopki za poročanje o neuspešnih ukazih verzije.

#### Dodano
- Samodejni brez povezave preverjevalnik povezav/sidrišč v angleščini, regresijski testi in delovni tok dokumentacije, ki prav tako prevaja delavnico v strogi način. Ustvarjeni prevodi in prevedene slike so izključeni.

#### Obseg validacije
- Preverjanja vira, sintakse, konfiguracije, lokalnega vedenja in mrežnih povezav ne zagotavljajo žive razpoložljivosti uvajanja v Azure, kvot, RBAC, regijske razpoložljivosti modelov, obračunavanja, skladnosti z varnostnimi zahtevami ali pripravljenosti za produkcijo.
- Starejši vnosi spodaj so zgodovinski zapisi in ne sodobna navodila za ukaze ali izdaje.

### [v3.23.0] - 2026-07-13

#### Osvežitev AZD 1.27.1: Posodobitev trenutne različice
**Ta različica ponovno potrjuje tečaj proti `azd` `1.27.1` (julij 2026, zadnja stabilna izdaja) in trenutni predogled AI agentne razširitve `azure.ai.agents` `1.0.0-beta.5`, s čimer so vse značke "preverjeno proti" posodobljene po izdajah 1.26.0, 1.27.0 in 1.27.1.**

#### Spremenjeno
- **✅ Osnova validacije posodobljena** iz `azd 1.25.6` (junij 2026) na `azd 1.27.1` (julij 2026) po celotnem glavnem README, vseh poglavjih README, lekciji o razvojnih kontejnerjih v 1. poglavju (vključno z zgledi z določeno različico), lekciji o prilagojenih predlogah v 4. poglavju, večagentni lekciji v 5. poglavju in delavnicah
- **🤖 Osnova 2. poglavja osvežena** iz `azd 1.23.12` (marec 2026) na `azd 1.27.1` po `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` in `microsoft-foundry-integration.md`; datumi opomb o validaciji posodobljeni na 2026-07-13
- **🧩 Razširitev AI agentov posodobljena** iz `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na trenutno različico `1.0.0-beta.5` v 2. poglavju README in `agents.md`
- **🧪 Primer validacije delavnice** (izhod `azd version`) posodobljen na `1.27.1`

#### Opombe o pomembnih izdajah azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora Go za Azure Functions na Flex Consumption, filtre naročniških najemnikov `azd config sub-filter`, samoobsežne razširitvene pakete (`azd x pack --bundle`), in `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeliranje Azure AI Foundry projektov/agentov neposredno v `azure.yaml` (inicializacija brez Bicep/Terraform), podpora uvajanju kontejnerjev za App Service (`host: appservice` + `language: docker`), neposredni `-s/--source` za `azd extension` ukaze in `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` zastavica za `azd extension install`, po privzetku so iz kataloga in pozivov za kvote izključeni zastareli modeli ter nekaj popravkov napak

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

#### Začetniški manjkajoči korak #2: Ustvarjanje predlog, razvojni kontejnerji, Pulumi, Azure DevOps, servisni glavni računi in več
**Ta različica zapolni preostale vmesne vrzeli, ki jih je pokazala analiza pokritosti azd: kako ustvariti in objaviti svojo lastno predlogo, reproducibilna razvojna okolja dev-container/Codespaces, ponudnik infrastrukture Pulumi, vodič CI/CD v Azure DevOps, avtentikacija servisnih glavnih računov, navodila za izbor gostitelja (AKS/Spring Apps), razlage `azd restore`/`azd package`, obravnava napak kljuk, in prakse za ekipe/deljena okolja.**

#### Dodano
- **🧱 Nova lekcija 4. poglavja** `docs/chapter-04-infrastructure/custom-templates.md` — ustvarjanje lastne azd predloge: zahtevana struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametri infrastrukture z uporabo tokena vira `uniqueString()` in oznake `azd-env-name`, lokalno testiranje z `azd init --template <local-path>`, objava na GitHub in oddaja v galerijo Awesome AZD
- **📦 Nova lekcija 1. poglavja** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okolja z dev kontejnerji in GitHub Codespaces: minimalen `.devcontainer/devcontainer.json` z uporabo uradne funkcije `ghcr.io/azure/azure-dev/azd`, funkcije specifične za jezik, `docker-in-docker` za gostitelje kontejnerjev in `azd auth login --use-device-code` za oddaljeno prijavo
- **🧩 Sekcija Pulumi z azd** v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, postavitev mape Pulumi, skladov, preslikanih v azd okolja, zahtevani izhodi/oznake in enak delovni tok `azd up` / `azd down`
- **🎯 Navodila za izbor gostitelja** v `docs/chapter-04-infrastructure/provisioning.md` — primerjava prijazna začetnikom med `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` in `springapp` z navodili, kdaj izbrati AKS ali Azure Spring Apps
- **🛠️ Vodič CI/CD v Azure DevOps** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisna povezava z identifikacijo delovne obremenitve (OIDC), ustvarjeni `azure-dev.yml` in nastavitev skupine spremenljivk
- **🔑 Servisni glavni računi (vzorec 4)** dodani v `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivna `azd auth login` z odjemalskim skrivnostnim geslom proti federiranim/OIDC poverilnicam, kdaj uporabljati in varno shranjevanje poverilnic
- **🪝 Obdelava napak kljuk** pododsek v `docs/chapter-04-infrastructure/deployment-guide.md` — izhodne kode in `set -e`, `continueOnError`, testiranje kljuk v izolaciji z `azd hooks run`, OS-specifične lupine in `--debug`
- **👥 Sekcija ekipnih/deljenih okolij** v `docs/chapter-03-configuration/configuration.md` — kaj se nahaja v `.azure/`, kaj vključiti v gitignore, okolja po razvijalcu, `azd env list`/`select` in zagotovitev vrednosti okolja v CI/CD
- **🧰 Razlage `azd restore` in razširjene `azd package`** v `resources/cheat-sheet.md` — obnavljanje odvisnosti in sestavljanje implementabilnega artefakta brez uvajanja

#### Spremenjeno
- **🧭 Tabela lekcij 4. poglavja** posodobljena, da vključuje novo lekcijo »Ustvarjanje lastne predloge« (Lekcija 3)
- **🧭 Tabela lekcij 1. poglavja** posodobljena, da vključuje novo lekcijo »Razvojni kontejnerji in Codespaces« (Lekcija 5); navigacijski nogi povezani med `bring-your-own-app.md` in `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začetniški manjkajoči korak: praktična večagentna lekcija, "Prinesi svojo aplikacijo", Terraform in CI/CD vodič
**Ta različica zapolni največje vrzeli za popoln začetniški vodič z dodajanjem dveh novih praktičnih lekcij (vodnik za uvajanje dveh agentov in dodajanje azd v obstoječo aplikacijo), začetniškim uvodom v kljuke, sekcijo Terraform z azd, korak-po-korak vodičem GitHub Actions, pojasnjevalcem za nove predogledne razširitve in eksplicitnim seznamom za preverjanje uvajanja.**

#### Dodano
- **🤝 Nova lekcija 5. poglavja** `docs/chapter-05-multi-agent/multi-agent-basics.md` — popolnoma praktičen, uvajalni dvoagentni vodič (orkestrator + specialisti) z uporabo prave predloge (`contoso-creative-writer`), ki pokriva, kdaj uporabljati več agentov, delovni tok `azd up`, razumevanje uvajanih virov, sledenje med agenti, prilagoditve in čiščenje
- **📦 Nova lekcija 1. poglavja** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd v obstoječi projekt z uporabo `azd init` ("uporabi kodo v trenutnem imeniku"), razumevanje `azure.yaml` in `infra/`, `azd infra generate`, zaznavanje gostitelja in uvajanje z `azd up`
- **🌐 Sekcija Terraform z azd** dodana v `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, postavitev mape `.tf`, zahtevani izhodi `AZURE_*` in označevanje `azd-env-name`, ter enak delovni tok `azd up` / `azd down` (zapolni vrzel, kjer je bila podpora za Terraform omenjena, a je bil prikazan le Bicep)
- **⚙️ Korak-po-korak vodič GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do avtomatiziranih uvajanj: `azd pipeline config`, federirane OIDC poverilnice (brez shranjenih skrivnosti), ustvarjeni `azure-dev.yml` in navodila za skrivnosti proti spremenljivkam
- **🪝 Začetniški uvod "Nov v kljukah?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — kaj je kljuka, tabela stopenj kljuke, minimalna prva kljuka in ročno zaganjanje kljuk z `azd hooks run`
- **✅ Seznam za preverjanje "Preveri uvajanje"** dodan k koraku 5 z `docs/chapter-01-foundation/first-project.md` — preizkus dima, preverjanje končne točke zdravja in eksplicitni kriteriji uspeha
- **🧩 Pojasnilo za nove predogledne razširitve** `azure.ai.skills` in `azure.ai.connections` (kaj so in kdaj jih uporabiti) v `docs/chapter-08-production/production-ai-practices.md`

#### Spremenjeno
- **🧭 Tabela lekcij 5. poglavja** popravljena: `multi-agent-basics.md` je zdaj Lekcija 1 (edina popolnoma praktična lekcija) z iskreno oznako, da je Lekcija 2 v 6. poglavju in da je scenarij Retail arhitekturna smernica, ne predloga z enim ukazom
- **🧭 Tabela lekcij 1. poglavja** sedaj vključuje novo lekcijo »Prinesi svojo aplikacijo« (Lekcija 4)
- **🔗 Navigacijski nogi** posodobljeni: `first-project.md` sedaj vodi naprej do `bring-your-own-app.md`

#### Popravljeno
- **🧱 Zaprta "omenjena, a manjkajoča" vrzel pri Terraformu** — tečaj je prej omenjal podporo za Terraform brez prikaza le-te
- **🔀 Popravljene zavajajoče navzkrižne povezave v 5. poglavju** ki so namigovale, da obstaja popolna večagentna implementacija, ko gre dejansko le za arhitekturno smernico

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

#### Osvežitev AZD 1.25.6, celotni ukazi življenjskega cikla agenta & Aspire rebranding
**Ta različica ponovno preveri tečaj proti `azd` `1.25.6` (junij 2026) in razširitvi `azure.ai.agents` `0.1.40-preview`, razširja AI navodila od "ustanovi agenta" do celotnega življenjskega cikla agenta (testiraj → oceni → optimiziraj → preglej → izbriši), prikaže nove predogledne razširitve `azure.ai.skills` in `azure.ai.connections`, ter zabeleži preimenovanje izdelka ".NET Aspire" v "Aspire".**

#### Dodano
- **🔁 Celotno pokritje življenjskega cikla agenta** za začetnike in AI inženirje v različnih dokumentih:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabela življenjskega cikla (ustanovi → testiraj → meri → izboljšaj → preglej → pospravi) dodana v poglavje Razširitve in AI ukazi
  - `docs/chapter-08-production/production-ai-practices.md` — Novo poglavje "Upravljanje življenjskega cikla agenta" pokriva `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
  - `resources/cheat-sheet.md` — Razširjeni AI Agent ukazi z `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, in `delete --force`
- **🧩 Nove predogledne razširitve** dokumentirane: `azure.ai.skills` (ponovno uporabne veščine agentov) in `azure.ai.connections` (Foundry povezave) dodane v tabelo razširitev in hitri priročnik
- **⏱️ Navodila za čas odziva** — primeri `azd ai agent invoke` sedaj navajajo, da izpiše skupno latenco in čas do prvega bajta
- **📌 Pasica verzije** v osnovnem README usmerja učence na `azd version` in `azd upgrade`

#### Spremenjeno
- **✅ Posodobljena osnovna linija validacije** iz `azd 1.23.12` (marec 2026) na `azd 1.25.6` (junij 2026) v vseh poglavjih README in delavničnih dokumentih
- **🤖 Posodobljena opomba razširitve poglavja 2** iz `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Posodobljen primer validacije delavnice** (izhod `azd version`) na `1.25.6`
- **🧭 Osvežen README "Kaj je novega v azd danes"** za poudarjanje celotnega življenjskega cikla agenta, novih AI razširitev in nedavnih izboljšav kakovosti življenja (`azd init` idempotentnost, `azd auth login` odstranjevanje zastarelih žetonov, `azd tool` poziv ob prvem zagonu)
- **📖 Poglavje 2 agents.md (možnost 4)** zdaj usmerja učence na ukaze po razmestitvi namesto da se ustavi pri `azd up`

#### Popravljeno
- **🏷️ Imenovanje izdelkov** — dodana je opomba o rebrandingu Aspire (".NET Aspire" je zdaj preprosto "Aspire"); podpora Aspire v azd ostaja nespremenjena
- **🔎 Potrjena validacija žive različice** glede na Microsoft Azure Developer CLI izdajni vir: stabilni CLI `1.25.6` (2026-06-12) in `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Poenostavitev za začetnike, preverjanje nastavitve & končno čiščenje AZD ukazov
**Ta različica nadaljuje s preverjanjem AZD 1.23 z dokumentacijo osredotočeno na začetnike: pojasnjuje navodila za AVTORIZACIJO AZD, dodaja skripte za lokalno preverjanje nastavitev, preverja ključne ukaze glede na živi AZD CLI, in odstranjuje zadnje zastarele reference ukazov v angleškem izvoru zunaj seznama sprememb.**

#### Dodano
- **🧪 Skripte za preverjanje začetne nastavitve** z `validate-setup.ps1` in `validate-setup.sh`, da lahko učenci potrdijo zahtevana orodja pred začetkom poglavja 1
- **✅ Koraki za preverjanje nastavitve na začetku** v osnovnem README in README poglavja 1, da se manjkajoče predpogojne zahteve odkrijejo pred `azd up`

#### Spremenjeno
- **🔐 Navodila za avtentikacijo začetnikov** sedaj dosledno obravnavajo `azd auth login` kot glavno pot za AZD delovne tokove, `az login` pa kot opcijsko, razen če so Azure CLI ukazi uporabljeni neposredno
- **📚 Potek vključevanja v poglavju 1** sedaj usmerja učence k potrditvi lokalne nastavitve pred namestitvijo, avtentikacijo in prvimi koraki razmestitve
- **🛠️ Sporočila validatorja** zdaj jasno ločujejo zahteve, ki preprečujejo nadaljevanje, od opcijskih opozoril Azure CLI za pot AZD samo za začetnike
- **📖 Dokumentacija za konfiguracijo, odpravljanje težav in primere** sedaj ločuje zahtevano AVTORIZACIJO AZD od opcijskega prijavljanja v Azure CLI, kjer je bilo prej predstavljeno brez konteksta

#### Popravljeno
- **📋 Ostale reference ukazov v angleškem izvoru** posodobljene na aktualne oblike AZD, vključno z `azd config show` v priročniku in `azd monitor --overview` tam, kjer je bil namenjen pregled Azure portala
- **🧭 Trditve za začetnike v poglavju 1** omiljene, da se izognejo prevelikim obljubam o zagotovljenem breznapaknem ali povratnem vedenju preko vseh predlog in Azure virov
- **🔎 Validacija živega CLI** potrjena za trenutno podporo `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` in `azd down --force --purge`

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

#### Validacija AZD 1.23.12, razširitev delavničnega okolja & osvežitev AI modelov
**Ta različica izvaja pregled dokumentacije za validacijo proti `azd` `1.23.12`, posodobi zastarele primere ukazov AZD, osveži AI model navodila na aktualne privzete nastavitve, in razširi delavnična navodila izven GitHub Codespaces, da podpira tudi dev container-je in lokalne klone.**

#### Dodano
- **✅ Opombe validacije po glavnih poglavjih in delavničnih dokumentih** za jasnost testirane osnovne linije AZD za učence, ki uporabljajo novejše ali starejše CLI različice
- **⏱️ Navodila za časovne omejitve razmestitve** za dolgotrajne razmestitve AI aplikacij z uporabo `azd deploy --timeout 1800`
- **🔎 Koraki za pregled razširitev** z `azd extension show azure.ai.agents` v AI delovnih tokovih dokumentacije
- **🌐 Širša navodila za delavnična okolja** zajemajo GitHub Codespaces, dev container-je in lokalne klone z MkDocs

#### Spremenjeno
- **📚 Uvodna poglavja README** zdaj dosledno izpostavljajo validacijo proti `azd 1.23.12` čez temeljne, konfiguracijske, infrastrukturne, multi-agentne, pred razmestitvene, odpravljanje težav in produkcijske oddelke
- **🛠️ Reference ukazov AZD** posodobljene na trenutne oblike v celotni dokumentaciji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ali `azd env get-value(s)` odvisno od konteksta
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kjer je bil namenjen pregled Application Insights
- **🧪 Poenostavljeni primeri predogleda razmestitve** za trenutno podprto uporabo, kot sta `azd provision --preview` in `azd provision --preview -e production`
- **🧭 Delavnični tok** posodobljen, da učenci lahko dokončajo vaje v Codespaces, dev container-ju ali lokalnem klonu, namesto da bi predpostavljali samo izvajanje v Codespaces
- **🔐 Navodila za avtentikacijo** zdaj dajejo prednost `azd auth login` za AZD delovne tokove, medtem ko je `az login` opcijska, kadar se uporabljajo ukazi Azure CLI neposredno

#### Popravljeno
- **🪟 Ukazi za namestitev v Windowsu** normalizirani na trenutno obliko paketne oznake `winget` v navodilih za namestitev
- **🐧 Navodila za namestitev na Linuxu** popravljena, da se izognejo nepodprtim distro-specifičnim navodilom upravljalnika paketov `azd` in naslavljajo ustrezne izdaje
- **📦 Primeri AI modelov** osveženi iz starejših privzetih vrednosti, kot so `gpt-35-turbo` in `text-embedding-ada-002`, na aktualne, kot so `gpt-4.1-mini`, `gpt-4.1`, in `text-embedding-3-large`
- **📋 Opravki v odrezkih za razmestitev in diagnostiko** za uporabo aktualnih ukazov okolja in stanja v dnevnikih, skriptah in korakih odpravljanja težav
- **⚙️ Navodila za GitHub Actions** posodobljena z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Navodila za soglasje MCP/Copilot** posodobljena z `azd mcp consent` na `azd copilot consent list`

#### Izboljšano
- **🧠 AI poglavje navodila** sedaj bolje pojasnjujejo občutljivo vedenje `azd ai`, specifično prijavo najemnika, uporabo trenutnih razširitev in posodobljena priporočila za razmestitev modelov
- **🧪 Delavnična navodila** uporabljajo zdaj bolj realistične primere različic in bolj jasno jezikovno predstavitev namestitve okolja za praktične laboratorije
- **📈 Produkcijski in odpravljalni dokumenti** zdaj bolj usklajeni s trenutnim nadzorom, rezervnim modelom in primeri stroškovnih kategorij

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

#### AZD AI CLI ukazi, validacija vsebine & razširitev predlog
**Ta različica dodaja pokritje ukazov `azd ai`, `azd extension` in `azd mcp` v vseh poglavjih, povezanih z AI, popravlja pokvarjene povezave in zastarelo kodo v agents.md, posodablja hiter priročnik ter temeljito prenavlja razdelek Primeri Predlog z validiranimi opisi in novimi Azure AI AZD predlogami.**

#### Dodano
- **🤖 Pokritost AZD AI CLI** v 7 datotekah (prej le v poglavju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Novo poglavje "Razširitve in AI ukazi" z uvodom v `azd extension`, `azd ai agent init` in `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s primerjalno tabelo (predloga proti manifest pristopu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podpoglavji "AZD Razširitve za Foundry" in "Postavitev agenta kot prva"
  - `docs/chapter-05-multi-agent/README.md` — Hitri začetek zdaj kaže poti razmestitve tako s predlogo kot manifestom
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Oddelek za razmestitev zdaj vključuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podpoglavje "AZD AI razširitveni ukazi za diagnostiko"
  - `resources/cheat-sheet.md` — Novo poglavje "AI & Razširitveni ukazi" z `azd extension`, `azd ai agent init`, `azd mcp` in `azd infra generate`
- **📦 Nove predloge za AZD AI primere** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG klepet z Blazor WebAssembly, Semantic Kernel in podporo za glasovni klepet
  - **azure-search-openai-demo-java** — Java RAG klepet s Langchain4J z možnostmi razmestitve ACA/AKS
  - **contoso-creative-writer** — Večagentna aplikacija za kreativno pisanje z Azure AI Agent Service, Bing Grounding in Prompty
  - **serverless-chat-langchainjs** — Brezstrežni RAG z Azure Functions + LangChain.js + Cosmos DB in lokalno podporo Ollama za razvoj
  - **chat-with-your-data-solution-accelerator** — Poslovni pospeševalnik RAG z upravljalskim portalom, integracijo Teams in možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčna aplikacija za orkestracijo z več agenti MCP s strežniki v .NET, Python, Java in TypeScript
  - **azd-ai-starter** — Minimalen začetni vzorec za infrastrukturo Azure AI Bicep
  - **🔗 Povezava do Awesome AZD AI galerije** — Referenca na [awesome-azd AI galerijo](https://azure.github.io/awesome-azd/?tags=ai) (več kot 80 vzorcev)

#### Popravljeno
- **🔗 navigacija v agents.md**: Povezave Prejšnji/Naslednji zdaj ustrezajo vrstnemu redu lekcij v poglavju 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 pokvarjene povezave v agents.md**: `production-ai-practices.md` popravljeno na `../chapter-08-production/production-ai-practices.md` (3 pojavitve)
- **📦 zastarel koda v agents.md**: Zamenjan `opencensus` z `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neveljaven API v agents.md**: Premaknjen `max_tokens` iz `create_agent()` v `create_run()` kot `max_completion_tokens`
- **🔢 štetje tokenov v agents.md**: Grobo oceno `len//4` zamenjano z `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Popravljene storitve iz "Cognitive Search + App Service" v "Azure AI Search + Azure Container Apps" (privzeti gostitelj spremenjen oktober 2024)
- **contoso-chat**: Posodobljen opis z navedbo Azure AI Foundry + Prompty, v skladu z dejanskim naslovom in tehnološko strukturo repozitorija

#### Odstranjeno
- **ai-document-processing**: Odstranjena referenca na nefunkcionalni vzorec (repo ni javno dostopen kot AZD vzorec)

#### Izboljšano
- **📝 vaje v agents.md**: Prva vaja zdaj prikazuje pričakovani izhod in korak `azd monitor`; Druga vaja vključuje celotno registracijsko kodo `FunctionTool`; Tretja vaja nadomešča nejasna navodila s konkretnimi ukazi `prepdocs.py`
- **📚 viri v agents.md**: Posodobljene povezave do trenutne dokumentacije Azure AI Agent Service in hitrih začetkov
- **📋 tabela Naslednji koraki v agents.md**: Dodana povezava do AI Workshop Lab za popolno pokritost poglavja

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

#### Izboljšava navigacije po tečaju
**Ta različica izboljšuje navigacijo poglavij v README.md z izboljšano obliko tabele.**

#### Spremenjeno
- **Tabela zemljevida tečaja**: Izboljšana z neposrednimi povezavami do lekcij, ocenami trajanja in ocenami zahtevnosti
- **Čiščenje map**: Odstranjene odvečne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Preverjanje povezav**: Preverjenih vseh 21+ notranjih povezav v tabeli zemljevida tečaja

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodobi reference izdelkov glede na trenutno Microsoftovo blagovno znamko.**

#### Spremenjeno
- **Microsoft Foundry → Microsoft Foundry**: Posodobljene vse reference v datotekah brez prevodov
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno za odsev trenutne blagovne znamke

#### Posodobljene datoteke
- `README.md` - Glavna začetna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik po AI agentih
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Začetna stran delavnice
- `workshop/docs/index.md` - Indeks delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke navodil delavnice

---

### [v3.15.0] - 2026-02-05

#### Velika preureditev repozitorija: imena map po poglavjih
**Ta različica preuredi dokumentacijo v namensko označene mape poglavij za lažjo navigacijo.**

#### Preimenovanja map
Stare mape so zamenjane z mapami, označenimi s številkami poglavij:
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
| Vse datoteke za prednameščanje | pre-deployment/ | chapter-06-pre-deployment/ |
| Vse datoteke za odpravljanje težav | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 datoteke README poglavij**: Ustvarjen README.md v vsaki mapi poglavja z:
  - Cilji učenja in trajanje
  - Tabela lekcij z opisi
  - Ukazi za hiter začetek
  - Navigacija do drugih poglavij

#### Spremenjeno
- **🔗 Posodobljene vse notranje povezave**: Posodobljenih več kot 78 poti v vseh dokumentacijskih datotekah
- **🗺️ Glavni README.md**: Posodobljen zemljevid tečaja z novo strukturo poglavij
- **📝 examples/README.md**: Posodobljene križne reference do map poglavij

#### Odstranjeno
- Stara struktura map (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Preureditev repozitorija: navigacija po poglavjih
**Ta različica je dodala navigacijske datoteke README po poglavjih (nadomeščene z v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodnik po AI agentih
**Ta različica dodaja obsežen vodnik za uvajanje AI agentov z Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Celovit vodnik, ki zajema:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnih robotov
  - Tri hitre začetne predloge agentov (Foundry Agents, Prompty, RAG)
  - Vzorce arhitekture agentov (posamezni agent, RAG, več agentov)
  - Nastavitev in prilagoditev orodij
  - Spremljanje in sledenje metrike
  - Stroški in optimizacija
  - Pogoste situacije odpravljanja težav
  - Tri praktične vaje s kriteriji uspešnosti

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hiter začetek**: Uvajanje agentov z `azd init --template get-started-with-ai-agents`
- **Arhitekturni vzorci**: Vizualni diagrami vzorcev agentov
- **Konfiguracija**: Nastavitev orodij in okoljske spremenljivke
- **Spremljanje**: Integracija Application Insights
- **Vaje**: Postopno praktično učenje (20–45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev okolja DevContainer
**Ta različica posodobi konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za AZD učno izkušnjo.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljeno iz `python:3.12-bullseye` v `python:3.12-bookworm` (najnovejši stabilni Debian)
- **📛 Ime kontejnerja**: Preimenovano iz "Python 3" v "AZD for Beginners" za jasnost

#### Dodano
- **🔧 Nove funkcije razvoja kontejnerja**:
  - `azure-cli` z omogočeno podporo za Bicep
  - `node:20` (LTS različica za AZD vzorce)
  - `github-cli` za upravljanje vzorcev
  - `docker-in-docker` za uvajanje aplikacij v kontejnerjih

- **🔌 Preusmerjanje vrat**: Vnaprej konfigurirana vrata za običajni razvoj:
  - 8000 (predogled MkDocs)
  - 3000 (spletne aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-ji)

- **🧩 Novi razširitve VS Code**:
  - `ms-python.vscode-pylance` - Izboljšan IntelliSense za Python
  - `ms-azuretools.vscode-azurefunctions` - Podpora za Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora za Docker
  - `ms-azuretools.vscode-bicep` - Podpora za jezik Bicep
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje virov Azure
  - `yzhang.markdown-all-in-one` - Urejanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Preverjanje Markdowna
  - `bierner.markdown-mermaid` - Podpora diagramom Mermaid
  - `redhat.vscode-yaml` - Podpora YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Zgodovina Gita

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Python interpreter, formatiranje ob shranjevanju in odstranjevanje odvečnih presledkov

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan vtičnik za minimizacijo MkDocs
  - Dodan pre-commit za kakovost kode
  - Dodani paketi Azure SDK (azure-identity, azure-mgmt-resource)

#### Popravljeno
- **Ukaz po ustvarjanju**: Sedaj preverja namestitev AZD in Azure CLI ob zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenova README za začetnike
**Ta različica pomembno izboljša README.md, da je bolj dostopen za začetnike, ter doda ključne vire za razvijalce AI.**

#### Dodano
- **🆚 Primerjava Azure CLI in AZD**: Jasna razlaga, kdaj uporabiti katero orodje s praktičnimi primeri
- **🌟 Awesome AZD povezave**: Neposredne povezave do galerije vzorcev skupnosti in virov za prispevke:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - več kot 200 pripravljenih vzorcev za uporabo
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - prispevki skupnosti
- **🎯 Vodnik za hiter začetek**: Poenostavljen 3-koračni odsek (Namesti → Prijavi se → Uvedi)
- **📊 Tabela navigacije glede na izkušnje**: Jasna navodila, kje začeti glede na izkušnje razvijalca

#### Spremenjeno
- **Struktura README**: Preoblikovana za postopno razkrivanje – ključne informacije najprej
- **Uvodni del**: Predelano za razlago "Čarovnija `azd up`" za popolne začetnike
- **Odstranjena podvojena vsebina**: Odstranjen podvojeni odsek odpravljanja težav
- **Ukazi za odpravljanje težav**: Popravljena referenca `azd logs` za uporabo veljavnega `azd monitor --logs`

#### Popravljeno
- **🔐 Ukazi za avtentikacijo**: Dodano `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Neveljavne reference ukazov**: Odstranjene preostale `azd logs` iz README odseka odpravljanja težav

#### Opombe
- **Obseg**: Spremembe uporabljene v glavnem README.md in resources/cheat-sheet.md
- **Ciljna publika**: Izboljšave posebej namenjene razvijalcem, ki so novi v AZD

---

### [v3.10.0] - 2026-02-05

#### Posodobitev natančnosti ukazov Azure Developer CLI
**Ta različica popravlja neobstoječe AZD ukaze v celotni dokumentaciji, s čimer zagotavlja, da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Popravljeno
- **🔧 Odstranjeni neobstoječi AZD ukazi**: Celovit pregled in popravek neveljavnih ukazov:
  - `azd logs` (ne obstaja) → zamenjan z `azd monitor --logs` ali alternativami Azure CLI
  - `azd service` podukazi (ne obstajajo) → zamenjani z `azd show` in Azure CLI
  - `azd infra import/export/validate` (ne obstajajo) → odstranjeni ali zamenjani z veljavnimi alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne obstajajo) → odstranjene
  - `azd provision --what-if/--rollback` zastavice (ne obstajajo) → posodobljene za uporabo `--preview`
  - `azd config validate` (ne obstaja) → zamenjan z `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne obstajajo) → odstranjeni

- **📚 Posodobljene datoteke s popravki ukazov**:
  - `resources/cheat-sheet.md`: Obsežna prenova referenc ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije povrnitve in uvajanja
  - `docs/troubleshooting/debugging.md`: Popravljeni razdelki analize dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi odpravljanja težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljena sekcija za razhroščevanje AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za spremljanje
  - `docs/getting-started/first-project.md`: Posodobljeni primeri spremljanja in odpravljanja napak
  - `docs/getting-started/installation.md`: Popravljeni primeri pomoči in različic
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za ogled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za odpravljanje napak agentov

- **📝 Posodobljen referenčni zapis različice**: 
  - `docs/getting-started/installation.md`: Spremenjena vdelana različica `1.5.0` v generično `1.x.x` s povezavo do izdaj

#### Spremenjeno
- **Strategije povrnitve**: Posodobljena dokumentacija za uporabo povrnitve na osnovi Git (AZD nima nativne povrnitve)
- **Ogled dnevnikov**: Zamenjali sklice `azd logs` z `azd monitor --logs`, `azd monitor --live` in ukazi Azure CLI
- **Oddelek za zmogljivost**: Odstranjene neobstoječe zastavice za vzporedno/incrementalno nameščanje, podani veljavni nadomestki

#### Tehnični podatki
- **Veljavni ukazi AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavne zastavice azd monitor**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Preverjanje**: Ukazi preverjeni proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Zaključek delavnice in posodobitev kakovosti dokumentacije
**Ta različica dokončuje interaktivne module delavnic, popravlja vse prekinjene povezave v dokumentaciji in izboljšuje splošno kakovost vsebine za AI razvijalce, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument s smernicami za prispevke z:
  - Jasna navodila za poročanje o težavah in predlaganje sprememb
  - Standardi dokumentiranja za novo vsebino
  - Smernice za primere kode in konvencije sporočil commita
  - Informacije o vključenosti skupnosti

#### Dokončano
- **🎯 Modul delavnice 7 (Zaključek)**: Popolnoma dokončan zaključni modul z:
  - Celovitim povzetkom dosežkov delavnice
  - Poglavje o obvladanih ključnih konceptih, ki pokriva AZD, predloge in Microsoft Foundry
  - Priporočili za nadaljnjo učni pot
  - Izazovni vajami delavnice z ocenami zahtevnosti
  - Povratne informacije skupnosti in podporne povezave

- **📚 Modul delavnice 3 (Razgradnja)**: Posodobljeni učni cilji z:
  - Navodili za aktivacijo GitHub Copilota z MCP strežniki
  - Razumevanje strukture map predlog AZD
  - Organizacijsko vzorce za Infrastructure-as-code (Bicep)
  - Praktičnimi navodili za delo v laboratoriju

- **🔧 Modul delavnice 6 (Razstavljanje)**: Zaključen z:
  - Cilji čiščenja virov in upravljanja stroškov
  - Uporabami `azd down` za varno odstranjevanje infrastrukture
  - Navodili za obnovitev mehko izbrisanih kognitivnih storitev
  - Bonus izzive za raziskovanje GitHub Copilota in Azure Portala

#### Popravljeno
- **🔗 Popravek prekinjenih povezav**: Rešeno več kot 15 prekinjenih notranjih povezav v dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljene poti do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljene poti do ai-model-deployment.md in production-ai-practices.md
  - `docs/getting-started/first-project.md`: Neobstoječi cicd-integration.md zamenjan s deployment-guide.md
  - `examples/retail-scenario.md`: Popravljene poti do pogostih vprašanj in vodnika za odpravljanje težav
  - `examples/container-app/microservices/README.md`: Popravljene poti do domače strani tečaja in vodnika za nameščanje
  - `resources/faq.md` in `resources/glossary.md`: Posodobljeni sklici na poglavja AI
  - `course-outline.md`: Popravljeni sklici na vodnik predavatelja in laboratorijski delavnico AI

- **📅 Pasica statusa delavnice**: Posodobljena z "V gradnji" na aktiven status delavnice z datumom februar 2026

- **🔗 Navigacija delavnice**: Popravljene prekinjene navigacijske povezave v datoteki README.md delavnice, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Predstavitev delavnice**: Odstranjeno opozorilo "v gradnji", delavnica je zdaj dokončana in pripravljena za uporabo
- **Konsistentnost navigacije**: Zagotovljena pravilna medmodulska navigacija za vse module delavnice
- **Sklici na učne poti**: Posodobljeni medpoglavjski sklici z uporabo pravih poti microsoft-foundry

#### Preverjeno
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so dokončani z učnimi cilji
- ✅ Navigacija med poglavji in moduli deluje pravilno
- ✅ Vsebina je primerna za AI razvijalce, ki uporabljajo Microsoft AZD
- ✅ Ohranjena je prijazna jezikovna struktura za začetnike
- ✅ CONTRIBUTING.md nudi jasne smernice za prispevke skupnosti

#### Tehnična implementacija
- **Preverjanje povezav**: Samodejni PowerShell skript pregledal vse notranje povezave .md
- **Pregled vsebine**: Ročni pregled popolnosti delavnice in primernosti za začetnike
- **Sistem navigacije**: Uporabljeni dosledni vzorci navigacije za poglavja in module

#### Opombe
- **Obseg**: Spremembe so bile uporabljene samo za angleško dokumentacijo
- **Prevodi**: Mape z prevodi niso bile posodobljene v tej različici (samodejni prevod bo sinhroniziran pozneje)
- **Trajanje delavnice**: Popolna delavnica zdaj nudi 3-4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Spremljanje, varnost in vzorci več agentov
**Ta različica dodaja obsežna A-razredna poglavja o integraciji Application Insights, vzorcih preverjanja pristnosti in koordinaciji več agentov za proizvodne ureditve.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Osredotočeno na AZD nameščanje z avtomatskim zagotavljanjem
  - Popolne Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojeno telemetrijo (1.200+ vrstic)
  - Vzorci nadzora AI/LLM (sledilnik žetonov/stroškov Microsoft Foundry Models)
  - 6 Mermaid diagramov (arhitektura, distribuirano sledenje, tok telemetrije)
  - 3 praktične vaje (opozorila, nadzorne plošče, AI spremljanje)
  - Primeri poizvedb Kusto in strategije optimizacije stroškov
  - Pretakanje metrik v živo in odpravljanje napak v realnem času
  - 40-50 minut učenja s proizvodnimi vzorci

- **🔐 Lekcija o preverjanju pristnosti in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci preverjanja pristnosti (niz povezave, Key Vault, upravljana identiteta)
  - Popolne Bicep predloge infrastrukture za varne namestitve
  - Koda aplikacije Node.js z integracijo Azure SDK
  - 3 vaje (omogočanje upravljane identitete, uporabniško dodeljena identiteta, rotacija Key Vault)
  - Najboljše varnostne prakse in nastavitve RBAC
  - Vodnik za odpravljanje težav in analiza stroškov
  - Proizvodne vzorci preverjanja pristnosti brez gesla

- **🤖 Lekcija o vzorcih koordinacije več agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (zaporedni, vzporedni, hierarhični, na dogodkih, soglasje)
  - Popolna implementacija koordinatorske storitve (Python/Flask, 1.500+ vrstic)
  - 3 specializirane implementacije agentov (Raziskovalec, Pisec, Urednik)
  - Integracija Service Bus za čakalno vrsto sporočil
  - Upravljanje stanja v Cosmos DB za distribuirane sisteme
  - 6 Mermaid diagramov, ki prikazujejo interakcije agentov
  - 3 napredne vaje (upravljanje časovne omejitve, logika ponovitve, odklopnik)
  - Razčlenitev stroškov ($240-565/mesec) s strategijami optimizacije
  - Integracija Application Insights za spremljanje

#### Izboljšano
- **Poglavje pred nameščanjem**: Zdaj vključuje obsežne vzorce spremljanja in koordinacije
- **Poglavje za začetek**: Izboljšano z profesionalnimi vzorci preverjanja pristnosti
- **Proizvodna pripravljenost**: Popolna pokritost od varnosti do opazovanja
- **Načrt tečaja**: Posodobljen z novimi lekcijami v poglavjih 3 in 6

#### Spremenjeno
- **Napredek učenja**: Boljša integracija varnosti in spremljanja skozi celoten tečaj
- **Kakovost dokumentacije**: Dosledni A-razredni standardi (95-97 %) v novih lekcijah
- **Proizvodni vzorci**: Popolna end-to-end pokritost za podjetniške ureditve

#### Izboljšano
- **Razvojna izkušnja**: Jasna pot od razvoja do proizvodnega spremljanja
- **Varnostni standardi**: Profesionalni vzorci preverjanja pristnosti in upravljanja skrivnosti
- **Opazovanje**: Popolna integracija Application Insights z AZD
- **AI delovne obremenitve**: Specializirano spremljanje za Microsoft Foundry Models in sisteme z več agenti

#### Preverjeno
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne samo izseke)
- ✅ Mermaid diagrami za vizualno učenje (skupaj 19 v 3 lekcijah)
- ✅ Praktične vaje s preverjalnimi koraki (skupaj 9)
- ✅ Proizvodno pripravljene Bicep predloge, nameščljive z `azd up`
- ✅ Analize stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje težav in najboljše prakse
- ✅ Preverjalne točke z ukazi za validacijo

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Obsežen vodnik za spremljanje
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture več agentov
- **Skupna nova vsebina**: - Dosledni visoki kakovostni standardi

#### Tehnična implementacija
- **Application Insights**: Log Analytics + prilagojena telemetrija + distribuirano sledenje
- **Preverjanje pristnosti**: Upravljana identiteta + Key Vault + vzorci RBAC
- **Več agentov**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Spremljanje**: Pretakanje metrik v živo + poizvedbe Kusto + opozorila + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike zadrževanja, proračunski nadzori

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Microsoft Foundry Models
**Ta različica izboljšuje kakovost dokumentacije v celotnem repozitoriju in dodaja popoln primer nameščanja Microsoft Foundry Models z vmesnikom za klepet gpt-4.1.**

#### Dodano
- **🤖 Primer klepeta Microsoft Foundry Models**: Popolno nameščanje gpt-4.1 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Microsoft Foundry Models (nameščanje modela gpt-4.1)
  - Python vmesnik za klepet v ukazni vrstici s zgodovino pogovorov
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje uporabe žetonov in ocena stroškov
  - Omejevanje hitrosti in ravnanje z napakami
  - Obsežen README z vodnikom za nameščanje dolžine 35-45 minut
  - 11 proizvodno pripravljenih datotek (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Vaje iz dokumentacije**: Dodane praktične vaje v vodnik konfiguracije:
  - Vaja 1: Konfiguracija za več okolij (15 minut)
  - Vaja 2: Praksa upravljanja skrivnosti (10 minut)
  - Jasni kriteriji uspeha in preverjalni koraki
- **✅ Preverjanje nameščanja**: Dodan oddelek za preverjanje v vodnik nameščanja:
  - Postopki preverjanja zdravja
  - Kontrolni seznam kriterijev uspeha
  - Pričakovani izhodi za vse ukaze nameščanja
  - Hiter pregled odpravljanja težav

#### Izboljšano
- **examples/README.md**: Posodobljen na kakovost A-razreda (93 %):
  - Dodan azure-openai-chat v vse relevantne odseke
  - Posodobljeno število lokalnih primerov z 3 na 4
  - Dodan v tabelo primerov AI aplikacij
  - Vključen v hitri začetek za vmesne uporabnike
  - Dodan v odsek Microsoft Foundry predlog
  - Posodobljene tabele primerjav in odseki za iskanje tehnologij
- **Kakovost dokumentacije**: Izboljšano z B+ (87 %) → A- (92 %) v mapi docs:
  - Dodani pričakovani izhodi za ključne primere ukazov
  - Vključeni preverjalni koraki za spremembe konfiguracije
  - Izboljšano praktično učenje z vajami

#### Spremenjeno
- **Napredek učenja**: Boljša integracija AI primerov za vmesne uporabnike
- **Struktura dokumentacije**: Več uporabnih vaj z jasnimi rezultati
- **Postopek preverjanja**: Dodani jasni kriteriji uspeha za ključne delovne tokove

#### Izboljšano
- **Razvojna izkušnja**: Nameščanje Microsoft Foundry Models zdaj traja 35-45 minut (v primerjavi z 60-90 za kompleksne alternative)
- **Preglednost stroškov**: Jasne ocene stroškov ($50-200/mesec) za primer Microsoft Foundry Models
- **Učna pot**: AI razvijalci imajo jasen vstopni punkt z azure-openai-chat
- **Standardi dokumentacije**: Dosledni pričakovani izhodi in preverjalni koraki

#### Preverjeno
- ✅ Primer Microsoft Foundry Models popolnoma funkcionalen z `azd up`
- ✅ Vse 11 implementacijske datoteke so sintaktično pravilne
- ✅ Navodila README se ujemajo z dejavno izkušnjo nameščanja
- ✅ Povezave v dokumentaciji posodobljene na več kot 8 mestih
- ✅ Indeks primerov pravilno prikazuje 4 lokalne primere
- ✅ Brez podvojenih zunanjih povezav v tabelah
- ✅ Vsi navigacijski sklici pravilni

#### Tehnična implementacija
- **Arhitektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + vzorec Container Apps
- **Varnost**: Pripravljena upravljana identiteta, skrivnosti v Key Vault
- **Spremljanje**: Integracija Application Insights
- **Upravljanje stroškov**: Sledenje žetonov in optimizacija uporabe
- **Nameščanje**: En ukaz `azd up` za popolno nastavitev

### [v3.6.0] - 2025-11-19

#### Večji posodobitveni primeri: Primeri nameščanja Container Apps
**Ta različica uvaja obsežne primere za nameščanje produkcijsko pripravljenih aplikacij Container z uporabo Azure Developer CLI (AZD), z obsežno dokumentacijo in integracijo v učno pot.**

#### Dodano
- **🚀 Primeri Container App**: Novi lokalni primeri v `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Celovit pregled kontejneriziranih namestitev, hiter začetek, produkcija in napredni vzorci
  - [Preprosta Flask API](../../examples/container-app/simple-flask-api): Začetniku prijazen REST API s scale-to-zero, preverjanjem zdravja, nadzorom in odpravljanjem težav
  - [Arhitektura mikrostoritev](../../examples/container-app/microservices): Produkcijsko pripravljena namestitev več storitev (API Gateway, Produkt, Naročilo, Uporabnik, Obvestilo), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, distribuirano sledenje, blue-green/canary namestitev
- **Najboljše prakse**: Varnost, nadzor, optimizacija stroškov in CI/CD smernice za kontejnerizirane obremenitve
- **Vzorci kode**: Celovite `azure.yaml`, Bicep predloge in implementacije storitev v več jezikih (Python, Node.js, C#, Go)
- **Testiranje in odpravljanje težav**: Scenariji preglednega testiranja, ukazi za nadzor, smernice za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljen z novimi primeri kontejnerskih aplikacij pod "Lokalni primeri - kontejnerske aplikacije"
- **examples/README.md**: Posodobljen za izpostavitev primerov kontejnerskih aplikacij, dodan matriks primerjav in posodobljene reference tehnologije/arhitekture
- **Osnutek tečaja in študijski vodič**: Posodobljen za sklicevanje na nove primere kontejnerskih aplikacij in vzorce namestitev v relevantnih poglavjih

#### Validirano
- ✅ Vsi novi primeri so nameščivi z `azd up` in sledijo najboljšim praksam
- ✅ Posodobljene medsebojne povezave in navigacija v dokumentaciji
- ✅ Primeri zajemajo scenarije od začetnih do naprednih, vključno s produkcijskimi mikroservisi

#### Opombe
- **Obseg**: Samo angleška dokumentacija in primeri
- **Naslednji koraki**: Razširitev z dodatnimi naprednimi kontejnerskimi vzorci in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 2025-11-19

#### Preimenovanje izdelka: Microsoft Foundry
**Ta različica izvaja celovito spremembo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preimenovanje pri Microsoftu.**

#### Spremenjeno
- **🔄 Posodobitev imena izdelka**: Celovito preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljene vse reference v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: 23 posodobljenih vsebinskih referenc v 7 dokumentacijskih datotekah

- **📁 Spremembe strukture mape**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Posodobljene vse medsebojne reference za odraz nove strukture mape
  - Validirane navigacijske povezave v celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Posodobljene vse notranje povezave, da kažejo na novo ime datoteke

#### Posodobljene datoteke
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 posodobljene reference imena izdelka
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 posodobljene reference (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 posodobljene medsebojne povezave
  - `docs/getting-started/first-project.md` - 2 posodobljeni navigacijski povezavi poglavij
  - `docs/getting-started/installation.md` - 2 posodobljeni povezavi na naslednje poglavje
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 posodobljene reference (navigacija, Discord skupnost)
  - `docs/troubleshooting/common-issues.md` - 1 posodobljena navigacijska povezava
  - `docs/troubleshooting/debugging.md` - 1 posodobljena navigacijska povezava

- **Datoteke strukture tečaja** (2 datoteki):
  - `README.md` - 17 posodobljenih referenc (pregled tečaja, naslovi poglavij, razdelek predlog, vpogledi skupnosti)
  - `course-outline.md` - 14 posodobljenih referenc (pregled, cilji učenja, viri poglavij)

#### Validirano
- ✅ Brez preostalih referenc mape "ai-foundry" v angleški dokumentaciji
- ✅ Brez preostalih referenc imena izdelka "Microsoft Foundry" v angleški dokumentaciji
- ✅ Vse navigacijske povezave delujoče z novo strukturo map
- ✅ Preimenovanja datotek in map uspešno zaključena
- ✅ Medsebojne reference med poglavji validirane

#### Opombe
- **Obseg**: Spremembe veljajo samo za angleško dokumentacijo v mapi `docs/`
- **Prevodi**: Prevodi map (`translations/`) niso posodobljeni v tej različici
- **Delavnica**: Gradiva delavnice (`workshop/`) niso posodobljena v tej različici
- **Primeri**: Datoteke primerov lahko še vedno vsebujejo zastarelo poimenovanje (bo odpravljeno v prihodnji posodobitvi)
- **Zunanje povezave**: Zunanje URL in reference repozitorija GitHub ostajajo nespremenjene

#### Vodič za migracijo za sodelujoče
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite reference map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite reference datotek: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje povezave v dokumentaciji še vedno delujejo

---

### [v3.4.0] - 2025-10-24

#### Izboljšave infrastrukture za predogled in validacijo
**Ta različica uvaja celovito podporo za novo funkcijo Azure Developer CLI predogleda in izboljšuje uporabniško izkušnjo delavnice.**

#### Dodano
- **🧪 Dokumentacija funkcije azd provision --preview**: Celovito pokritje nove zmožnosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe na hitrem pregledu
  - Podrobna integracija v vodnik za namestitev z uporabo primerov in koristmi
  - Integracija preverjanja pred namestitvijo za varnejšo validacijo
  - Posodobitve vodiča za začetnike z varnostnim pristopom namestitve
- **🚧 Banner statusa delavnice**: Profesionalen HTML banner, ki prikazuje stanje razvoja delavnice
  - Gradientni dizajn z indikatorji gradbenih del za jasno uporabniško komunikacijo
  - Čas zadnje posodobitve za transparentnost
  - Mobilno odziven dizajn za vse vrste naprav

#### Izboljšano
- **Varnost infrastrukture**: Funkcionalnost predogleda vključena skozi celotno dokumentacijo namestitve
- **Validacija pred namestitvijo**: Avtomatizirani skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Razvojni tok**: Posodobljeni zaporedni ukazi vključujejo predogled kot najboljšo prakso
- **Uporabniška izkušnja delavnice**: Jasna pričakovanja uporabnikov glede stanja vsebin

#### Spremenjeno
- **Najboljše prakse namestitve**: Priporočeni postopek znotraj predogleda kot prvi korak
- **Potek dokumentacije**: Validacija infrastrukture premaknjena v zgodnejši del učnega procesa
- **Predstavitev delavnice**: Profesionalno obveščanje o statusu z jasno časovno osjo razvoja

#### Izboljšano
- **Pristop, ki postavlja varnost na prvo mesto**: Spremembe infrastrukture je zdaj mogoče validirati pred namestitvijo
- **Sodelovanje ekipe**: Rezultate predogleda lahko delite za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred namestitvijo
- **Omilitev tveganj**: Zmanjšanje napak pri namestitvi zaradi predhodne validacije

#### Tehnična implementacija
- **Integracija več dokumentov**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorce ukazov**: Konsistentna sintaksa in primeri v celotni dokumentaciji
- **Integracija najboljših praks**: Predogled vključen v validacijske postopke in skripte
- **Vizualni indikatorji**: Jasne oznake NOVE funkcionalnosti za boljšo odkritost

#### Infrastruktura delavnice
- **Obveščanje o stanju**: Profesionalen HTML banner z gradientno obliko
- **Uporabniška izkušnja**: Jasno stanje razvoja preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja verodostojnost repozitorija in določa pričakovanja
- **Transparentnost časovnice**: Datum zadnje posodobitve oktobra 2025 za odgovornost

### [v3.3.0] - 2025-09-24

#### Izboljšani materiali delavnice in interaktivna učna izkušnja
**Ta različica uvaja celovite delavnice z interaktivnimi vodniki v brskalniku in strukturiranimi učnimi potmi.**

#### Dodano
- **🎥 Interaktivni vodnik delavnice**: Izkušnja delavnice v brskalniku z možnostjo predogleda MkDocs
- **📝 Strukturirane delavske instrukcije**: 7-stopenjska vodena učna pot od odkritja do prilagoditve
  - 0-Uvod: Pregled delavnice in priprava
  - 1-Izbor-AI-predloge: Proces odkrivanja in izbire predloge
  - 2-Validacija-AI-predloge: Procedura namestitve in validacije
  - 3-Razčlenitev-AI-predloge: Razumevanje arhitekture predloge
  - 4-Konfiguracija-AI-predloge: Nastavljanje in prilagoditve
  - 5-Prilagoditev-AI-predloge: Napredne spremembe in iteracije
  - 6-Počistitev-infrastrukture: Čiščenje in upravljanje virov
  - 7-Povzetek: Povzetek in naslednji koraki
- **🛠️ Orodja delavnice**: Nastavitev MkDocs z Material temo za izboljšano učno izkušnjo
- **🎯 Praktična učna pot**: 3-stopenjska metodologija (Odkritje → Namestitev → Prilagoditev)
- **📱 Integracija GitHub Codespaces**: Gladek razvojni okoljski setup

#### Izboljšano
- **AI delavski laboratorij**: Razširjen s celovito 2-3 urne strukturirane učne izkušnje
- **Dokumentacija delavnice**: Profesionalna predstavitev z navigacijo in slikovnimi pripomočki
- **Učni napredek**: Jasna metoda korak-po-korak od izbire predloge do produkcijske namestitve
- **Razvojna izkušnja**: Integrirana orodja za poenostavljene razvojne tokove

#### Izboljšano
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- **Učenje v lastnem tempu**: Prožnost strukture delavnice za različne hitrosti učenja
- **Praktična uporaba**: Resnični scenariji namestitve AI predlog
- **Integracija skupnosti**: Povezava z Discord za podporo in sodelovanje v delavnici

#### Funkcije delavnice
- **Vgrajeno iskanje**: Hitro odkrivanje ključnih besed in lekcij
- **Kopiranje blokov kode**: Funkcija premikanja za kopiranje vseh primerov kode
- **Preklop teme**: Podpora za temni/svetli način za različne preference
- **Vizualne pripomočke**: Posnetki zaslona in diagrami za boljše razumevanje
- **Integracija pomoči**: Neposreden dostop do Discord skupnosti za podporo

### [v3.2.0] - 2025-09-17

#### Glavna prestrukturiranje navigacije in učenje po poglavjih
**Ta različica uvaja celovito učno strukturo po poglavjih z izboljšano navigacijo po celotnem repozitoriju.**

#### Dodano
- **📚 Sistem učenja po poglavjih**: Celoten tečaj preurejen v 8 progresivnih učnih poglavij
  - Poglavje 1: Osnove in hiter začetek (⭐ - 30-45 min)
  - Poglavje 2: AI-First razvoj (⭐⭐ - 1-2 uri)
  - Poglavje 3: Konfiguracija in overjanje (⭐⭐ - 45-60 min)
  - Poglavje 4: Infrastruktura kot koda in namestitev (⭐⭐⭐ - 1-1.5 ure)
  - Poglavje 5: Večagentne AI rešitve (⭐⭐⭐⭐ - 2-3 ure)
  - Poglavje 6: Validacija in načrtovanje pred namestitvijo (⭐⭐ - 1 ura)
  - Poglavje 7: Odpravljanje težav in razhroščevanje (⭐⭐ - 1-1.5 ure)
  - Poglavje 8: Produkcijski in enterprise vzorci (⭐⭐⭐⭐ - 2-3 ure)
- **📚 Celovit navigacijski sistem**: Standardizirani navigacijski glavi in nogi v vseh dokumentacijah
- **🎯 Sledenje napredku**: Seznam opravil za dokončanje tečaja in sistem preverjanja znanja
- **🗺️ Vodič učne poti**: Jasna izhodišča za različne ravni izkušenj in cilje
- **🔗 Medsebojna navigacija**: Sorodna poglavja in predpogoji jasno povezani

#### Izboljšano
- **Struktura README**: Preoblikovano v strukturirano učno platformo z organizacijo po poglavjih
- **Navigacija dokumentacije**: Vsaka stran zdaj vključuje kontekst poglavja in smernice napredka
- **Organizacija predlog**: Primeri in predloge dodeljeni ustreznim učnim poglavjem
- **Integracija virov**: Potni listi, pogosta vprašanja in študijski vodiči povezani z relevantnimi poglavji
- **Integracija delavnic**: Praktični laboratoriji povezani z več učnimi cilji poglavij

#### Spremenjeno
- **Napredek učenja**: Prehod iz linearne dokumentacije na prožno učenje po poglavjih
- **Postavitev konfiguracije**: Vodnik za konfiguracijo premaknjen na Poglavje 3 za boljši učni tok
- **Integracija AI vsebin**: Boljša integracija specifičnih AI vsebin skozi celotno učno pot
- **Produkcijske vsebine**: Napredni vzorci združeni v Poglavje 8 za enterprise učence

#### Izboljšano
- **Uporabniška izkušnja**: Jasne navigacijske poti in indikatorji napredovanja po poglavjih
- **Dostopnost**: Konsistentni navigacijski vzorci za lažje krmarjenje po tečaju
- **Profesionalna predstavitev**: Univerzitetna struktura tečaja primerna za akademsko in korporativno usposabljanje
- **Učna učinkovitost**: Zmanjšan čas iskanja relevantne vsebine z izboljšano organizacijo

#### Tehnična implementacija
- **Navigacijski glavi**: Standardizirana navigacija po poglavjih v več kot 40 dokumentacijskih datotekah
- **Navigacija v nogi**: Konsistentna smernica napredka in indikatorji dokončanja poglavij
- **Medsebojne povezave**: Celovit sistem notranjih povezav, ki povezuje sorodne koncepte
- **Mapiranje poglavij**: Predloge in primeri jasno povezani z učnimi cilji

#### Izboljšanje študijskega vodiča
- **📚 Celoviti učni cilji**: Študijski vodič preurejen v skladu z 8-poglavno strukturo
- **🎯 Ocena po poglavjih**: Vsako poglavje vključuje specifične učne cilje in praktične vaje
- **📋 Sledenje napredku**: Tedenski učni načrt z merljivimi izidi in seznami opravil
- **❓ Vprašanja za ocenjevanje**: Preverjanje znanja s strokovnimi izidi za vsak del
- **🛠️ Praktične vaje**: Praktične dejavnosti z realnimi scenariji namestitve in odpravljanja težav
- **📊 Napredek veščin**: Jasno napredovanje od osnovnih konceptov do enterprise vzorcev s fokusom na karierni razvoj
- **🎓 Certifikacijski okvir**: Profesionalni razvojni izidi in sistem priznanj skupnosti
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 2025-09-17

#### Izboljšane večagentne AI rešitve
**Ta različica izboljša večagentno maloprodajno rešitev z boljšim poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremenjeno
- **Terminologija večagentnega sistema**: Povsod v rešitvi za maloprodajo večagentnega sistema zamenjan "Cora agent" z "Uporabniški agent" za boljše razumevanje
- **Arhitektura agenta**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode z doslednim imenom "Uporabniški agent"
- **Primeri konfiguracije**: Modernizirani vzorci konfiguracije agentov z posodobljenimi poimenovanji
- **Konzistentnost dokumentacije**: Zagotovljene so profesionalne, opisne oznake agentov v vseh referencah

#### Izboljšano
- **Paket ARM predloge**: Posodobljen retail-multiagent-arm-template z referencami na Uporabniškega agenta
- **Arhitekturni diagrami**: Osveženi Mermaid diagrami s posodobljenimi poimenovanji agentov
- **Primeri kode**: Python razredi in implementacijski primeri sedaj uporabljajo poimenovanje CustomerAgent
- **Okoljske spremenljivke**: Posodobljeni vsi deploy skripti za uporabo vzorcev CUSTOMER_AGENT_NAME

#### Izboljšano
- **Izkušnja razvijalca**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za produkcijo**: Boljša uskladitev z imenskimi konvencijami podjetij
- **Učne vsebine**: Bolj intuitivno poimenovanje agentov za izobraževalne namene
- **Uporabnost predloge**: Poenostavljeno razumevanje funkcij agenta in vzorcev nameščanja

#### Tehnični podatki
- Posodobljeni Mermaid arhitekturni diagrami z referencami na CustomerAgent
- Zamenjana imena razreda CoraAgent z CustomerAgent v Python primerih
- Spremenjene ARM JSON konfiguracije za uporabo tipa agenta "customer"
- Posodobljene okoljske spremenljivke iz CORA_AGENT_* v CUSTOMER_AGENT_*
- Osvežene vse ukaze za nameščanje in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Velike spremembe - Osredotočenost na AI razvijalce in integracija Microsoft Foundry
**Ta izdaja preoblikuje repozitorij v obsežen učni vir, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Dodano
- **🤖 Učni potek z osredotočenostjo na AI**: Popolna prestrukturiranost z prioritetami za AI razvijalce in inženirje
- **Vodnik za integracijo Microsoft Foundry**: Celovita dokumentacija za povezavo AZD z Microsoft Foundry storitvami
- **Vzorec nameščanja AI modelov**: Podroben vodič za izbiro modelov, konfiguracijo in strategije produkcijskega nameščanja
- **AI delavnica**: 2-3-urna praktična delavnica za pretvorbo AI aplikacij v rešitve, ki jih je mogoče namestiti z AZD
- **Najboljše prakse produkcijskega AI**: Vzorec pripravljenosti za podjetja za skaliranje, spremljanje in zavarovanje AI delovnih obremenitev
- **Vodnik za odpravljanje težav specifičnih za AI**: Celovito odpravljanje težav za Microsoft Foundry modele, kognitivne storitve in izzive nameščanja AI
- **Galerija AI predlog**: Izbor Microsoft Foundry predlog z ocenami zahtevnosti
- **Materiali delavnice**: Popolna struktura delavnice s praktičnimi laboratoriji in referenčnimi materiali

#### Izboljšano
- **Struktura README**: Osredotočeno na AI razvijalce z 45 % podatki o interesih skupnosti z Microsoft Foundry Discorda
- **Učni poti**: Posebna AI razvojna pot poleg tradicionalnih poti za študente in DevOps inženirje
- **Priporočila predlog**: Izpostavljene AI predloge vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Integracija skupnosti**: Izboljšana podpora Discord skupnosti z AI-specifičnimi kanali in razpravami

#### Varnost in osredotočenost na produkcijo
- **Vzorec upravljane identitete**: AI-specifične konfiguracije overjanja in varnosti
- **Optimizacija stroškov**: Spremljanje uporabe žetonov in nadzor proračuna za AI delovne obremenitve
- **Večregijsko nameščanje**: Strategije za globalno nameščanje AI aplikacij
- **Spremljanje uspešnosti**: AI-specifični metrični podatki in integracija Application Insights

#### Kakovost dokumentacije
- **Linearna struktura tečaja**: Logičen prehod od začetniških do naprednih vzorcev nameščanja AI
- **Preverjene URL povezave**: Vse zunanje povezave v repozitoriju so preverjene in dostopne
- **Popolne reference**: Vse notranje povezave do dokumentacije so preverjene in delujoče
- **Pripravljenost za produkcijo**: Vzorec nameščanja za podjetja z resničnimi primeri

### [v2.0.0] - 2025-09-09

#### Velike spremembe - Prestrukturiranje repozitorija in profesionalna izboljšava
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebine.**

#### Dodano
- **Strukturiran učni okvir**: Vse dokumentacijske strani zdaj vključujejo uvod, cilje učenja in izide učenja
- **Navigacijski sistem**: Dodane povezave Prejšnja/Naslednja lekcija skozi celotno dokumentacijo za voden napredek učenja
- **Učni načrt**: Celovit study-guide.md z učnimi cilji, vajami in ocenjevalnimi materiali
- **Profesionalna predstavitev**: Odstranjene vse ikone emoji za boljšo dostopnost in profesionalen videz
- **Izboljšana struktura vsebine**: Izboljšana organizacija in pretok učnih materialov

#### Spremenjeno
- **Format dokumentacije**: Standardizirana vsa dokumentacija z dosledno strukturo usmerjeno na učenje
- **Tok navigacije**: Izveden logičen napredek skozi vse učne vsebine
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v prid jasni, profesionalni obliki
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Dostopnost**: Odstranjene odvisnosti od emoji za boljšo združljivost s bralci zaslona
- **Profesionalen videz**: Čista, akademsko-stilska predstavitev primerna za učenje v podjetjih
- **Izkušnja učenja**: Strukturiran pristop z jasnimi cilji in izidi za vsako lekcijo
- **Organizacija vsebine**: Boljši logični pretok in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Začetna objava - Celovit učni repozitorij AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Popolna serija vodičev za začetek
  - Celovita dokumentacija za nameščanje in zagotavljanje virov
  - Podrobni viri za odpravljanje težav in vodniki za razhroščevanje
  - Orodja in postopki za preverjanje pred nameščanjem

- **Modul za začetek**
  - Osnove AZD: osnovni koncepti in terminologija
  - Vodič za namestitev: navodila za nastavitve po platformi
  - Vodič za konfiguracijo: nastavitev okolja in overjanje
  - Prvi projekt - vadnica korak za korakom

- **Modul za nameščanje in zagotavljanje virov**
  - Vodič za nameščanje: popolna dokumentacija poteka
  - Vodič za zagotavljanje: infrastruktura kot koda z Bicep
  - Najboljše prakse za produkcijsko nameščanje
  - Vzorec arhitekture več storitev

- **Modul za preverjanje pred nameščanjem**
  - Načrtovanje kapacitete: preverjanje razpoložljivosti Azure virov
  - Izbor SKU: podroben vodnik po nivojih storitev
  - Preverjanje pred zagonom: avtomatizirani skripti (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: pogosto slišane težave in rešitve
  - Vodič za razhroščevanje: sistematične metode odpravljanja
  - Napredne diagnostične tehnike in orodja
  - Spremljanje uspešnosti in optimizacija

- **Viri in reference**
  - Kratka referenčna lista ukazov
  - Slovarček: podroben seznam terminov in kratic
  - Pogosta vprašanja: podrobni odgovori na pogosto zastavljena vprašanja
  - Zunanje povezave do virov in povezave s skupnostjo

- **Primeri in predloge**
  - Preprost primer spletne aplikacije
  - Predloga za nameščanje statične spletne strani
  - Konfiguracija kontejnerske aplikacije
  - Vzorce integracije podatkovnih baz
  - Primeri mikroservisne arhitekture
  - Implementacije funkcij brez strežnika

#### Značilnosti
- **Podpora za več platform**: Vodiči za namestitev in konfiguracijo za Windows, macOS in Linux
- **Različne ravni znanja**: Vsebina oblikovana za študente do profesionalnih razvijalcev
- **Praktični poudarek**: Praktični primeri in scenariji iz resničnega sveta
- **Obsežna pokritost**: Od osnovnih konceptov do naprednih vzorcev podjetij
- **Varnost na prvem mestu**: Vgrajene najboljše varnostne prakse po celotni vsebini
- **Optimizacija stroškov**: Navodila za stroškovno učinkovito nameščanje in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: Praktični, testirani vzorci kode
- **Navodila korak za korakom**: Jasna, izvedljiva navodila
- **Popolno obravnavanje napak**: Odpravljanje težav z običajnimi napakami
- **Integracija najboljših praks**: Industrijski standardi in priporočila
- **Združljivost z verzijami**: Posodobljeno z najnovejšo storitvijo Azure in funkcijami azd

## Načrtovane prihodnje izboljšave

### Različica 3.1.0 (Načrtovana)
#### Razširitev AI platforme
- **Podpora za več modelov**: Vzorec integracije za Hugging Face, Azure Machine Learning in prilagojene modele
- **Okviri AI agentov**: Predloge za LangChain, Semantic Kernel in AutoGen nameščanja
- **Napredni RAG vzorci**: Možnosti vektorskih podatkovnih baz poleg Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje delovanja modelov, uporabe žetonov in kakovosti odzivov

#### Izkušnja razvijalca
- **Razširitev VS Code**: Integrirana izkušnja razvoja AZD + Microsoft Foundry
- **Integracija GitHub Copilot**: AI-podprta generacija AZD predlog
- **Interaktivne vadnice**: Praktične vaje kodiranja z avtomatiziranim preverjanjem za AI scenarije
- **Video vsebine**: Dopolnilni video vodiči za vizualne učence s poudarkom na AI nameščanju

### Različica 4.0.0 (Načrtovana)
#### Podjetniški AI vzorci
- **Okvir upravljanja**: Upravljanje AI modelov, skladnost in revizijske sledi
- **Večnajemniški AI**: Vzorci za oskrbo več strank z izoliranimi AI storitvami
- **Edge AI nameščanje**: Integracija z Azure IoT Edge in kontejnerskimi primerki
- **Hibridni oblak AI**: Vzorci več-oblaka in hibridnega nameščanja za AI delovne obremenitve

#### Napredne funkcije
- **Avtomatizacija AI pipeline**: MLOps integracija z Azure Machine Learning pipeline
- **Napredna varnost**: Vzorci zero-trust, zasebni končni točki in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredne strategije nastavitve in skaliranja za AI aplikacije z veliko prepustnostjo
- **Globalna distribucija**: Vzorci dostave vsebin in edge predpomnjenja za AI aplikacije

### Različica 3.0.0 (Načrtovana) - Nadomeščena z trenutno izdajo
#### Predlagani dodatki - Sedaj implementirani v v3.0.0
- ✅ **AI-osredotočena vsebina**: Celovita integracija Microsoft Foundry (Dokončano)
- ✅ **Interaktivne vadnice**: Praktična AI delavnica (Dokončano)
- ✅ **Napredni varnostni modul**: AI-specifični varnostni vzorci (Dokončano)
- ✅ **Optimizacija zmogljivosti**: Strategije prilagajanja AI obremenitev (Dokončano)

### Različica 2.1.0 (Načrtovana) - Delno implementirano v v3.0.0
#### Manjše izboljšave - Nekatere dokončane v trenutni izdaji
- ✅ **Dodatni primeri**: AI-osredotočeni scenariji nameščanja (Dokončano)
- ✅ **Razširjen FAQ**: AI-specifična vprašanja in odpravljanje težav (Dokončano)
- **Integracija orodij**: Izboljšani vodiči za IDE in urejevalnike
- ✅ **Širitev spremljanja**: AI-specifični vzorci spremljanja in obvestil (Dokončano)

#### Še vedno načrtovano za prihodnje izdaje
- **Mobilno prijazna dokumentacija**: Prilagodljiv dizajn za mobilno učenje
- **Dostop brez povezave**: Paketi dokumentacije za prenos
- **Izboljšana integracija IDE**: Razširitev VS Code za AZD + AI delovne tokove
- **Skupnostna nadzorna plošča**: Metrični podatki skupnosti in sledenje prispevkom v realnem času

## Prispevanje k dnevniku sprememb

### Poročanje sprememb
Pri prispevanju v ta repozitorij prosimo, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: V skladu s semantičnim verzioniranjem (major.minor.patch)
2. **Datum**: Datum izdaje ali posodobitve v formatu LLLL-MM-DD
3. **Kategorija**: Dodano, Spremenjeno, Zastarelo, Odstranjeno, Popravljeno, Varnost
4. **Jasen opis**: Jedrnat opis spremembe
5. **Ocenitev vpliva**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcije, odseki dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripte ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali točnosti
- Prestrukturiranje vsebine ali organizacije

#### Zastarelo
- Funkcije ali pristopi, ki jih opuščamo
- Načrtovani odseki dokumentacije za odstranitev
- Metode, za katere obstajajo boljše alternative

#### Odstranjeno
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali opuščeni pristopi
- Podvojena ali združena vsebina

#### Popravljeno
- Popravki napak v dokumentaciji ali kodi
- Rešitev prijavljenih problemov ali napak
- Izboljšave natančnosti ali funkcionalnosti

#### Varnost
- Izboljšave ali popravki, povezani z varnostjo
- Posodobitve najboljših praks varnosti
- Reševanje varnostnih ranljivosti

### Smernice za semantično verzioniranje

#### Glavna različica (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrepanje uporabnikov
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spreminjajo osnovni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Dodajanje novih funkcij ali vsebin
- Izboljšave, ki ohranjajo združljivost nazaj
- Dodatni primeri, orodja ali viri

#### Popravna različica (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Razjasnitve in majhne izboljšave

## Povratne informacije skupnosti in predlogi

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:

### Kako podati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (AI-specifične težave so dobrodošle)
- **Discord razprave**: Delite ideje in sodelujte z Microsoft Foundry skupnostjo
- **Pull Requests**: Prispevajte neposredne izboljšave vsebini, zlasti AI predlogam in vodičem
- **Microsoft Foundry Discord**: Sodelujte na kanalu #Azure za razprave o AZD + AI
- **Skupnostni forumi**: Sodelujte v širših Azure razvijalskih razpravah

### Kategorije povratnih informacij
- **Natančnost AI vsebine**: Popravki informacije o integraciji AI storitev in nameščanju
- **Izkušnja učenja**: Predlogi za izboljšanje toka učenja AI razvijalcev
- **Manjkajoča AI vsebina**: Zahteve za dodatne AI predloge, vzorce ali primere
- **Dostopnost**: Izboljšave za različne učne potrebe
- **Integracija AI orodij**: Predlogi za boljšo integracijo AI razvojnih tokov
- **Podjetniški AI vzorci**: Zahteve za vzorce podjetniškega nameščanja AI

### Zaveza odgovora
- **Odgovor na težave**: V roku 48 ur za prijavljene težave
- **Zahteve za funkcije**: Ocena v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Takojšnja prioriteta z pospešenim odzivom

## Razpored vzdrževanja

### Redne posodobitve
- **Mesečna pregledovanja**: Točnost vsebine in preverjanje povezav
- **Četrtletne posodobitve**: Večji dodatki vsebin in izboljšave
- **Polletna pregledovanja**: Obsežno prestrukturiranje in nadgradnje
- **Letne izdaje**: Večje posodobitve verzij z pomembnimi izboljšavami

### Spremljanje in zagotavljanje kakovosti
- **Avtomatizirano testiranje**: Redna validacija primerov kode in povezav
- **Integracija povratnih informacij skupnosti**: Redno vključevanje predlogov uporabnikov
- **Tehnološke posodobitve**: Uskladitev z najnovejšimi storitvami Azure in izdajo azd
- **Pregledi dostopnosti**: Redni pregledi načel vključujočega oblikovanja

## Politika podpore različic

### Podpora za trenutno različico
- **Zadnja večja različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja večja različica**: Varnostne posodobitve in kritične popravke za 12 mesecev
- **Zgodovinske različice**: Le podpora skupnosti, brez uradnih posodobitev

### Navodila za migracijo
Ob izidu večjih različic nudimo:
- **Vodniki za migracijo**: Navodila korak za korakom za prehod
- **Opombe o združljivosti**: Podrobnosti o spremembah, ki lahko prekinejo delovanje
- **Orodja za podporo**: Skripte ali pripomočki za pomoč pri migraciji
- **Podpora skupnosti**: Posvečeni forumi za vprašanja o migraciji

---

**Navezava**
- **Prejšnja lekcija**: [Študijski vodič](resources/study-guide.md)
- **Naslednja lekcija**: Povratek na [Glavni README](README.md)

**Ostanite na tekočem**: Spremljajte to repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
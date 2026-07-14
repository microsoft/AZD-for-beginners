# Zapis sprememb - AZD Za začetnike

## Uvod

Ta zapis sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD Za začetnike. Sledimo načelom semantičnega verzioniranja in vodimo ta dnevnik, da pomagamo uporabnikom razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z ogledom tega zapisa sprememb boste:
- Ostali obveščeni o novih funkcijah in dodatkih vsebin
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali popravke hroščev in popravke za zagotavljanje natančnosti
- Spremljali razvoj učnih gradiv skozi čas

## Izidi učenja

Po pregledu zapisov sprememb boste lahko:
- Prepoznali novo vsebino in vire, ki so na voljo za učenje
- Razumeli, katere odseke so bile posodobljene ali izboljšane
- Načrtovali svojo učno pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 osvežitev: Posodobitev trenutno veljavne različice
**Ta različica ponovno potrjuje tečaj glede na `azd` `1.27.1` (julij 2026, najnovejša stabilna izdaja) in trenutno razširitev AI agenta v predogledu `azure.ai.agents` `1.0.0-beta.5`, kar prinaša vsak "preverjeno glede na" pasico do dneva po izdajah 1.26.0, 1.27.0 in 1.27.1.**

#### Spremenjeno
- **✅ Osnova za preverjanje je posodobljena** z `azd 1.25.6` (junij 2026) na `azd 1.27.1` (julij 2026) na root README, vseh poglavjskih README, lekciji dev-container za Poglavje 1 (vključno s primeri fiksnih različic), lekciji po meri za poglavje 4, lekciji večagentnega sistema za poglavje 5 in dokumentaciji delavnice
- **🤖 Osnova za poglavje 2 je osvežena** z `azd 1.23.12` (marec 2026) na `azd 1.27.1` v `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` in `microsoft-foundry-integration.md`; datumi v validacijskih opombah so posodobljeni na 2026-07-13
- **🧩 Razširitev AI agenta je posodobljena** z `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na trenutno izdajo `1.0.0-beta.5` v README poglavja 2 in `agents.md`
- **🧪 Primer validacije delavnice** (izhod `azd version`) je posodobljen na `1.27.1`

#### Opombe o pomembnih izdajah azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podpora za Go v Azure Functions na Flex Consumption, `azd config sub-filter` filtriranje naročnin na najemnika, samostojni paketki razširitev (`azd x pack --bundle`) in `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeliranje Azure AI Foundry projektov/agentov neposredno v `azure.yaml` (inicializacija brez Bicep/Terraform), podpora za uvajanje kontejnerjev v App Service (`host: appservice` + `language: docker`), neposredna opcija `-s/--source` za ukaze `azd extension` in `azd tool uninstall`
- **1.27.1 (2026-07-09):** Oznaka `--no-dependencies` za `azd extension install`, zastarele modele privzeto izključene iz pozivov za katalog/kvoto in več popravkov hroščev

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

#### Začetniška zapolnitev vrzeli #2: Avtorske predloge, Dev Containers, Pulumi, Azure DevOps, servisni uporabniki in več
**Ta različica zapira preostale vmesne vrzeli, ki jih je pokazala analiza pokritosti azd: kako ustvariti in objaviti svojo predlogo, reproducibilna okolja dev-container/Codespaces, ponudnik infrastrukture Pulumi, predstavitev Azure DevOps CI/CD, overjanje servisnih uporabnikov, navodila za izbiro gostitelja (AKS/Spring Apps), razlage `azd restore`/`azd package`, rokovanje z napakami oglišč, in prakse za skupinska/deljena okolja.**

#### Dodano
- **🧱 Nova lekcija poglavja 4** `docs/chapter-04-infrastructure/custom-templates.md` — avtorske lastne azd predloge: zahtevana struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametrize infrastrukturo z uporabo unikatnega žetona `uniqueString()` in oznake `azd-env-name`, lokalno testiranje z `azd init --template <local-path>`, objava na GitHub in oddaja v galerijo Awesome AZD
- **📦 Nova lekcija poglavja 1** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okolja z Dev Containers in GitHub Codespaces: minimalni `.devcontainer/devcontainer.json` s uradno funkcijo `ghcr.io/azure/azure-dev/azd`, jezikovno specifične funkcije, `docker-in-docker` za gostitelje kontejnerjev in `azd auth login --use-device-code` za oddaljeno prijavo
- **🧩 Pulumi z azd** odsek v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, struktura map Pulumi, skladiščni okolji preslikani v azd okolja, potrebni izvozi/oznake in enak delovni tok `azd up` / `azd down`
- **🎯 Navodila za izbiro gostitelja** v `docs/chapter-04-infrastructure/provisioning.md` — začetniku prijazen primerjava `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` in `springapp`, z nasveti kdaj izbrati AKS ali Azure Spring Apps
- **🛠️ Azure DevOps predstavitev CI/CD** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, povezava s servisom z overjanjem delovne obremenitve (OIDC), generirana datoteka `azure-dev.yml` in nastavitve skupin spremenljivk
- **🔑 Servisni uporabniki (vzorec 4)** dodano v `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivna `azd auth login` z zapisanim skrivnim ključem v nasprotju s federiranim/OIDC overjanjem, kdaj uporabiti in varno shranjevanje poverilnic
- **🪝 Obravnava napak oglišč** podpoglavje v `docs/chapter-04-infrastructure/deployment-guide.md` — izhodne kode in `set -e`, `continueOnError`, testiranje oglišč v izolaciji z `azd hooks run`, sistemi lupine po OS-ju in `--debug`
- **👥 Ekipa / deljena okolja** odsek v `docs/chapter-03-configuration/configuration.md` — kaj je v `.azure/`, kaj ignorirati v git, okolja po razvijalcih, `azd env list`/`select` in zagotavljanje vrednosti okolja v CI/CD
- **🧰 `azd restore` in razširjene razlage `azd package`** v `resources/cheat-sheet.md` — vračanje odvisnosti in gradnja artefakta za uvajanje brez dejanskega uvajanja

#### Spremenjeno
- **🧭 Tabela lekcij poglavja 4** posodobljena za vključitev nove lekcije "Avtorska predloga" (Lekcija 3)
- **🧭 Tabela lekcij poglavja 1** posodobljena za vključitev nove lekcije "Dev Containers & Codespaces" (Lekcija 5); navigacijski nogi povezani med `bring-your-own-app.md` in `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Začetniška zapolnitev vrzeli: praktična večagentna lekcija, "prinesi svojo aplikacijo", Terraform in predstavitev CI/CD
**Ta različica zapira največje vrzeli za popoln začetniški vodič z dodajanjem dveh novih praktičnih lekcij (vodnik za uvajanje več agentov in dodajanje azd k obstoječi aplikaciji), uvodom v oglišča za začetnike, razdelkom o Terraform z azd, korakom po koraku predstavitvijo GitHub Actions cevi, razlago novih predoglednih razširitev in eksplicitnim seznamom preverjanja uvajanja.**

#### Dodano
- **🤝 Nova lekcija poglavja 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — popolnoma praktičen, uvajalni dvoagentni vodnik (koordinator + specialisti) z uporabo resnične predloge (`contoso-creative-writer`), vključuje kdaj uporabiti večagentni sistem, potek dela `azd up`, razumevanje uvajanih virov, sledenje med agenti, prilagoditve in čiščenje
- **📦 Nova lekcija poglavja 1** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd k obstoječemu projektu z `azd init` ("uporabi kodo v trenutnem imeniku"), razlaga `azure.yaml` in `infra/`, `azd infra generate`, zaznavanje gostitelja in uvajanje z `azd up`
- **🌐 Terraform z azd** odsek dodan v `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, struktura mape `.tf`, zahtevani izvozi `AZURE_*` in oznake `azd-env-name`, ter enak potek `azd up` / `azd down` (zapira vrzel, kjer je bila omenjeno podpora za Terraform, a je bilo prikazano samo Bicep)
- **⚙️ Korak-po-korak predstavitev GitHub Actions** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do avtomatiziranih uvajanj: `azd pipeline config`, OIDC federirane poverilnice (brez shranjenih skrivnosti), generirani `azure-dev.yml` in navodila za skrivnosti proti spremenljivkam
- **🪝 Začetniški uvod "Novo v ogliščih?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — kaj je oglišče, tabela faz oglišč, minimalno prvo oglišče in ročno zaganjanje oglišč z `azd hooks run`
- **✅ Dodan seznam preverjanja "Preveri svoj uvod"** v 5. korak `docs/chapter-01-foundation/first-project.md` — dimni test, preverjanje končne točke zdravja in eksplicitni kriteriji uspeha
- **🧩 Razlaga za nove predogledne razširitve** `azure.ai.skills` in `azure.ai.connections` (kaj so in kdaj jih uporabiti) v `docs/chapter-08-production/production-ai-practices.md`

#### Spremenjeno
- **🧭 Tabela lekcij poglavja 5** popravljena: `multi-agent-basics.md` je zdaj Lekcija 1 (edina popolnoma praktična lekcija), z iskreno oznako, da Lekcija 2 živi v poglavju 6, scenarij trgovine pa je arhitekturni načrt in ne en ukaz
- **🧭 Tabela lekcij poglavja 1** zdaj vključuje novo lekcijo "Prinesi svojo aplikacijo" (Lekcija 4)
- **🔗 Navigacijski nogi** posodobljeni: `first-project.md` zdaj vodi naprej na `bring-your-own-app.md`

#### Popravljeno
- **🧱 Zaprta vrzel Terraform** — tečaj je prej navajal podporo za Terraform, ampak jo ni prikazal
- **🔀 Popravljene zavajajoče povezave med poglavjem 5**, ki so namigale na popolno večagentno izvedbo, ko je bil na voljo samo arhitekturni načrt

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

#### Osvežitev AZD 1.25.6, polni ukazi življenjskega cikla agentov in preimenovanje Aspire

**Ta različica ponovno preverja tečaj z `azd` `1.25.6` (junij 2026) in razširitvijo `azure.ai.agents` `0.1.40-preview`, širi AI usmeritve od "zgraditi agenta" do celotnega življenjskega cikla agenta (test → ocena → optimizacija → pregled → brisanje), prikazuje nove predogledne razširitve `azure.ai.skills` in `azure.ai.connections` ter opozarja na preimenovanje izdelka iz ".NET Aspire" v "Aspire".**

#### Dodano
- **🔁 Popolno pokrivanje življenjskega cikla agenta** za začetnike in AI inženirje v vseh dokumentih:
  - `docs/chapter-01-foundation/azd-basics.md` — Dodana tabela življenjskega cikla (zgradba → testiranje → merjenje → izboljšanje → pregled → čiščenje) v razdelek Razširitve in AI ukazi
  - `docs/chapter-08-production/production-ai-practices.md` — Nov razdelek "Upravljanje življenjskega cikla agenta" zajema `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
  - `resources/cheat-sheet.md` — Razširjeni AI ukazi agenta z `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
- **🧩 Nove predogledne razširitve** dokumentirane: `azure.ai.skills` (ponovno uporabne spretnosti agenta) in `azure.ai.connections` (Foundry povezave) dodane v tabelo razširitev in prevara-listo
- **⏱️ Navodila za čas odziva** — primeri `azd ai agent invoke` zdaj prikazujejo skupno latenco in čas do prvega bajta
- **📌 Pasica različice** v osnovnem README, ki uporabnike usmerja k `azd version` in `azd upgrade`

#### Spremenjeno
- **✅ Posodobljena osnovna različica za preverjanje** z `azd 1.23.12` (marec 2026) na `azd 1.25.6` (junij 2026) v vseh README-jih poglavij in dokumentih delavnice
- **🤖 Posodobitev opombe o razširitvi v 2. poglavju** z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Posodobljen primer validacije delavnice** (izpis `azd version`) na `1.25.6`
- **🧭 Osvežen README "Kaj je novega v azd danes"** za poudarek na celotnem življenjskem ciklu agenta, novih AI razširitvah in nedavnih izboljšavah uporabniške izkušnje (`azd init` idempotentnost, čiščenje zastarelih žetonov `azd auth login`, prvi poziv `azd tool`)
- **📖 V 2. poglavju agents.md (Možnost 4)** zdaj usmerja uporabnike k ukazom za življenjski cikel po namestitvi namesto, da se ustavi pri `azd up`

#### Popravljeno
- **🏷️ Poimenovanje izdelka** — dodana opomba o preimenovanju Aspire (".NET Aspire" je zdaj preprosto "Aspire"); podpora za Aspire v azd ni spremenjena
- **🔎 Potrjeno preverjanje sprostitve v živo** na podlagi objave Azure Developer CLI: stabilni CLI `1.25.6` (2026-06-12) in `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Poenostavitev uvoda za začetnike, preverjanje nastavitve in končno čiščenje AZD ukazov
**Ta različica sledi AZD preverjanju 1.23 s prehodom dokumentacije, usmerjeno na začetnike: pojasnjuje navodila za prednostno preverjanje pristnosti v AZD, dodaja skripte za preverjanje lokalne nastavitve, preverja ključne ukaze proti živi AZD CLI in odstranjuje zadnje zastarele angleške reference ukazov zunaj dnevnika sprememb.**

#### Dodano
- **🧪 Skripte za preverjanje nastavitve za začetnike** z `validate-setup.ps1` in `validate-setup.sh`, da lahko uporabniki pred začetkom 1. poglavja potrdijo potrebna orodja
- **✅ Predhodni koraki preverjanja nastavitve** v osnovnem README in README 1. poglavja, da se manjkajoče predpogoje odkrije pred `azd up`

#### Spremenjeno
- **🔐 Navodila za preverjanje pristnosti za začetnike** zdaj dosledno obravnavajo `azd auth login` kot primarno pot za AZD procese, z možnostjo `az login`, če se neposredno uporabljajo ukazi Azure CLI
- **📚 Uvodni tok v 1. poglavju** zdaj usmerja uporabnike k preverjanju lokalne nastavitve pred namestitvijo, preverjanjem pristnosti in prvimi koraki namestitve
- **🛠️ Sporočila validatorja** zdaj jasno ločujejo zahtevane blokade od neobveznih opozoril Azure CLI za pot samo z AZD za začetnike
- **📖 Dokumentacija o konfiguraciji, odpravljanju težav in primerih** zdaj razlikuje med potrebnim preverjanjem pristnosti v AZD in neobveznim prijavljanjem v Azure CLI, kjer sta bila prej prikazana brez konteksta

#### Popravljeno
- **📋 Preostale angleške reference ukazov** posodobljene v trenutne AZD oblike, vključno z `azd config show` v prevari-listi in `azd monitor --overview` tam, kjer je bil namenjen pregled Azure Portala
- **🧭 Trditve za začetnike v 1. poglavju** omiljene, da ne obljubljajo brezhibnega ali povratnega vedenja za vse predloge in Azure vire
- **🔎 Preverjanje v živo CLI** potrjuje trenutno podporo za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` in `azd down --force --purge`

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

#### Preverjanje AZD 1.23.12, širitev okolja delavnice in osvežitev AI modela
**Ta različica izvaja pregled dokumentacije za `azd` `1.23.12`, posodablja zastarele primere AZD ukazov, osvežuje usmeritve za AI modele na trenutne nastavitve in razširja navodila delavnice izven GitHub Codespaces z dodano podporo za razvojna okolja in lokalne klone.**

#### Dodano
- **✅ Opombe o preverjanju po vseh glavnih poglavjih in dokumentih delavnice** da jasno označijo testno osnovo AZD za uporabnike z novejšimi ali starejšimi različicami CLI
- **⏱️ Navodila za časovno omejitev nameščanja** za dolgotrajne nameščanja AI aplikacij z `azd deploy --timeout 1800`
- **🔎 Koraki za pregled razširitev** z `azd extension show azure.ai.agents` v dokumentih o AI procesu
- **🌐 Širša navodila za delavnico** zajemajo GitHub Codespaces, razvojna okolja in lokalne klone z MkDocs

#### Spremenjeno
- **📚 Uvodna README poglavij** zdaj dosledno navajajo preverjanje proti `azd 1.23.12` v temeljih, konfiguraciji, infrastrukturi, multi-agentih, predhodni namestitvi, odpravljanju težav in produkciji
- **🛠️ Posodobitve AZD ukazov** na trenutne oblike v vseh dokumentih:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ali `azd env get-value(s)` glede na kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kjer je zasnovan pregled Application Insights
- **🧪 Poenostavljeni primeri predogleda zagotovitve** na veljavne načine, kot so `azd provision --preview` in `azd provision --preview -e production`
- **🧭 Tok v delavnici** posodobljen, da lahko uporabniki dokončajo delavnice v Codespaces, razvojnem okolju ali lokalnem klonu namesto samo v Codespaces
- **🔐 Navodila za preverjanje pristnosti** zdaj dajejo prednost `azd auth login` za AZD procese, z `az login` kot neobvezno, če se neposredno uporabljajo ukazi Azure CLI

#### Popravljeno
- **🪟 Ukazi za namestitev Windows** uskladili z veljavnim zapisanjem `winget` paketa v vodiču za namestitev
- **🐧 Navodila za namestitev Linux** popravljena, da se izognejo nepodprtih navodil za upravitelje paketov `azd` specifičnih za distribucijo in namesto tega kažejo na objave sprostitev, kjer je to primerno
- **📦 Primeri AI modelov** osveženi iz starejših privzetih, kot so `gpt-35-turbo` in `text-embedding-ada-002`, na nove primere, kot so `gpt-4.1-mini`, `gpt-4.1` in `text-embedding-3-large`
- **📋 Odpravljanje in diagnostika predlog** popravljeni za uporabo trenutnih ukazov okolja in statusa v dnevnikih, skriptah in korakih odpravljanja težav
- **⚙️ Navodila za GitHub Actions** posodobljena z `Azure/setup-azd@v2` namesto `Azure/setup-azd@v1.0.0`
- **🤖 Navodila za soglasje MCP/Copilot** posodobljena z `azd copilot consent list` namesto `azd mcp consent`

#### Izboljšano
- **🧠 Navodila za poglavje o AI** zdaj bolje pojasnjujejo občutljivost za predogled `azd ai`, prijavo na najemnika, uporabo razširitev in posodobljene priporočila za nameščanje modelov
- **🧪 Navodila delavnice** zdaj uporabljajo bolj realistične primere različic in jasnejši jezik za nastavitev okolja za praktične naloge
- **📈 Dokumentacija za produkcijo in odpravljanje težav** zdaj bolje sovpada z aktualnim spremljanjem, modelom za rezervno možnost in primeri stroškovnih ravni

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

#### AZD AI CLI ukazi, preverjanje vsebine in razširitev predloge
**Ta različica dodaja pokritost ukazov `azd ai`, `azd extension` in `azd mcp` v vseh AI povezanih poglavjih, popravlja pokvarjene povezave in zastarelo kodo v agents.md, posodablja prevara-listo in prenavlja razdelek Primeri Predlog z validiranimi opisi in novimi Azure AI AZD predlogami.**

#### Dodano
- **🤖 Pokritost AZD AI CLI** v 7 datotekah (pred tem samo v 8. poglavju):
  - `docs/chapter-01-foundation/azd-basics.md` — Nov razdelek "Razširitve in AI ukazi", ki predstavlja `azd extension`, `azd ai agent init` in `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s primerjalno tabelo (predloga proti manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podrazdelka "AZD razširitve za Foundry" in "Namestitev najprej agenta"

  - `docs/chapter-05-multi-agent/README.md` — Hiter začetek zdaj prikazuje poti uvajanja na podlagi predloge in manifesta
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Razdelek za uvajanje zdaj vključuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podrazdelek "Ukazi razširitve AZD AI za diagnostiko"
  - `resources/cheat-sheet.md` — Novi razdelek "Ukazi za AI in razširitve" z `azd extension`, `azd ai agent init`, `azd mcp` in `azd infra generate`
- **📦 Nove AZD AI primerne predloge** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG klepet z Blazor WebAssembly, Semantic Kernel in podporo za glasovni klepet
  - **azure-search-openai-demo-java** — Java RAG klepet z uporabo Langchain4J z možnostmi uvajanja ACA/AKS
  - **contoso-creative-writer** — Večagentna aplikacija za ustvarjalno pisanje z uporabo Azure AI Agent Service, Bing Grounding in Prompty
  - **serverless-chat-langchainjs** — Brezstrežni RAG z uporabo Azure Functions + LangChain.js + Cosmos DB s podporo za lokalni razvoj Ollama
  - **chat-with-your-data-solution-accelerator** — Poslovni pospeševalnik RAG z administracijskim portalom, integracijo Teams in možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Vzorec aplikacije za večagentno MCP orkestracijo s strežniki v .NET, Python, Java in TypeScript
  - **azd-ai-starter** — Minimalna predloga za začetno Azure AI infrastrukturo Bicep
  - **🔗 Povezava do odlične AZD AI galerije** — Referenca na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (več kot 80 predlog)

#### Popravljeno
- **🔗 navigacija v agents.md**: Povezave Prejšnji/Naslednji sedaj ustrezajo vrstnemu redu lekcij v poglavju 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 poškodovane povezave v agents.md**: `production-ai-practices.md` popravljeno v `../chapter-08-production/production-ai-practices.md` (3 pojavitve)
- **📦 zastarela koda v agents.md**: `opencensus` nadomeščen z `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neveljaven API v agents.md**: `max_tokens` premaknjen iz `create_agent()` v `create_run()` kot `max_completion_tokens`
- **🔢 štetje žetonov v agents.md**: Groba ocena `len//4` nadomeščena z `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Popravljene storitve iz "Cognitive Search + App Service" v "Azure AI Search + Azure Container Apps" (privzeti gostitelj spremenjen oktobra 2024)
- **contoso-chat**: Posodobljen opis, ki zdaj omenja Azure AI Foundry + Prompty, kar se ujema z dejanskim naslovom in tehnološko zasnovo repozitorija

#### Odstranjeno
- **ai-document-processing**: Odstranjena referenca na nefunkcionalno predlogo (repozitorij ni javno dostopen kot AZD predloga)

#### Izboljšano
- **📝 vaje v agents.md**: Vaja 1 zdaj prikazuje pričakovani izhod in korak `azd monitor`; vaja 2 vsebuje celotno registracijo `FunctionTool`; vaja 3 zamenja nejasna navodila s konkretnimi ukazi `prepdocs.py`
- **📚 viri v agents.md**: Posodobljene povezave do dokumentacije Azure AI Agent Service in hitrih začetkov
- **📋 tabela Naslednji koraki v agents.md**: Dodana povezava do AI Workshop Lab za popolno pokritje poglavja

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

#### Izboljšana navigacija po tečaju
**Ta različica izboljša navigacijo po README.md poglavjih z izboljšano obliko tabele.**

#### Spremenjeno
- **Tabela zemljevide tečaja**: Izboljšana z neposrednimi povezavami do lekcij, ocenami trajanja in ocenami zahtevnosti
- **Čiščenje map**: Odstranjene odvečne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Preverjanje povezav**: Preverjenih več kot 21 notranjih povezav v tabeli zemljevida tečaja

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodablja reference izdelkov na trenutno Microsoftovo blagovno znamko.**

#### Spremenjeno
- **Microsoft Foundry → Microsoft Foundry**: Vse reference posodobljene v datotekah brez prevodov
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno glede na trenutno znamko

#### Posodobljene datoteke
- `README.md` - Glavna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik po AI agentih
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Glavna stran delavnice
- `workshop/docs/index.md` - Kazalo delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke z navodili delavnice

---

### [v3.15.0] - 2026-02-05

#### Obsežna preureditev repozitorija: mape po poglavjih
**Ta različica preuredi dokumentacijo v namenske mape poglavij za boljšo navigacijo.**

#### Preimenovanja map
Stare mape so bile zamenjane z mapami, označenimi s številkami poglavij:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodana nova mapa: `docs/chapter-05-multi-agent/`

#### Migracije datotek
| Datoteka | Iz | V |
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
| Vse datoteke iz pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Vse datoteke iz troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke poglavij**: Ustvarjene README.md v vsaki mapi poglavja z:
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

#### Preureditev repozitorija: Navigacija po poglavjih
**Ta različica je dodala datoteke README za navigacijo po poglavjih (nadomeščeno z v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nov vodič za AI agente
**Ta različica dodaja celovit vodič za uvajanje AI agentov z uporabo Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Celovit vodič, ki zajema:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnih robotov
  - Tri predloge za hiter začetek agentov (Foundry Agents, Prompty, RAG)
  - Arhitekturni vzorci agentov (posamezni agent, RAG, večagentni)
  - Konfiguracijo in prilagoditev orodij
  - Spremljanje in merjenje metrik
  - Premisleke o stroških in optimizaciji
  - Pogoste situacije za odpravljanje težav
  - Tri praktične vaje s kriteriji uspeha

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hiter začetek**: Uvajanje agentov z `azd init --template get-started-with-ai-agents`
- **Arhitekturni vzorci**: Vizualni diagrami vzorcev agentov
- **Konfiguracija**: Nastavitev orodij in okoljski spremenljivk
- **Spremljanje**: Integracija Application Insights
- **Vaje**: Postopno praktično učenje (20-45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev razvojnega kontejnerja (DevContainer)
**Ta različica posodablja konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za izkušnjo učenja AZD.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljena z `python:3.12-bullseye` na `python:3.12-bookworm` (najnovejši Debian stabilni)
- **📛 Ime kontejnerja**: Preimenovano iz "Python 3" v "AZD za začetnike" za jasnost

#### Dodano
- **🔧 Nove funkcije razvojnega kontejnerja**:
  - `azure-cli` z omogočeno podporo za Bicep
  - `node:20` (LTS različica za AZD predloge)
  - `github-cli` za upravljanje predlog
  - `docker-in-docker` za uvajanje kontejnerskih aplikacij

- **🔌 Preusmerjanje vrat (Port Forwarding)**: Prednastavljena vrata za pogost razvoj:
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
  - `yzhang.markdown-all-in-one` - Urejanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Podpora za diagrame Mermaid
  - `redhat.vscode-yaml` - Podpora za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git
  - `mhutchie.git-graph` - Zgodovina Git

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Python interpreter, formatiranje ob shranjevanju in odstranjevanje odvečnih presledkov

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan vtičnik za minifikacijo MkDocs
  - Dodan pre-commit za kakovost kode
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Popravljeno
- **Ukaz po kreaciji**: Sedaj preverja namestitev AZD in Azure CLI ob zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenovljen README prijazen začetnikom
**Ta različica znatno izboljša README.md, da je dostopnejša za začetnike in dodaja ključne vire za razvijalce AI.**

#### Dodano
- **🆚 Primerjava Azure CLI in AZD**: Jasna razlaga kdaj uporabiti kateri ukaz z praktičnimi primeri
- **🌟 Odlične AZD povezave**: Neposredne povezave do skupnostne galerije predlog in virov za prispevke:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ pripravljenih predlog za uvajanje
  - [Oddaj predlogo](https://github.com/Azure/awesome-azd/issues) - Prispevek skupnosti
- **🎯 Vodnik za hiter začetek**: Poenostavljen 3-koračni odsek za začetek (Namesti → Prijava → Uvedba)
- **📊 Tabela smernic glede na izkušnje**: Jasna usmeritev, kje začeti glede na raven izkušenj razvijalca

#### Spremenjeno
- **Struktura README**: Preurejena za postopno razkrivanje - ključne informacije na začetku
- **Uvodni razdelek**: Prepisan za razlago "Magičnega `azd up`" za popolne začetnike
- **Odstranjen podvojen vsebinski razdelek**: Odstranjen podvojen razdelek za odpravljanje težav
- **Ukazi za odpravljanje težav**: Popravljena referenca `azd logs` na veljavni `azd monitor --logs`

#### Popravljeno

- **🔐 Ukazi za overjanje**: Dodana `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Napačne sklice na ukaze**: Odstranjen preostali `azd logs` iz razdelka za odpravljanje težav v README

#### Opombe
- **Obseg**: Spremembe uporabljene v glavnem README.md in resources/cheat-sheet.md
- **Namenjena publika**: Izboljšave, namenjene predvsem razvijalcem, ki so novi v AZD

---

### [v3.10.0] - 2026-02-05

#### Posodobitev natančnosti ukazov Azure Developer CLI
**Ta različica popravlja neobstoječe AZD ukaze v celotni dokumentaciji, zagotavljajoč, da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Popravljeno
- **🔧 Odstranjeni neobstoječi AZD ukazi**: Celovit pregled in popravek neveljavnih ukazov:
  - `azd logs` (ne obstaja) → zamenjan z `azd monitor --logs` ali alternativami Azure CLI
  - Podukazi `azd service` (ne obstajajo) → zamenjani z `azd show` in Azure CLI
  - `azd infra import/export/validate` (ne obstajajo) → odstranjeno ali zamenjano z veljavnimi alternativami
  - Preklopi `azd deploy --rollback/--incremental/--parallel/--detect-changes` (ne obstajajo) → odstranjeni
  - Preklopi `azd provision --what-if/--rollback` (ne obstajajo) → posodobljeni na uporabo `--preview`
  - `azd config validate` (ne obstaja) → zamenjan z `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne obstajajo) → odstranjeni

- **📚 Datoteke posodobljene z popravki ukazov**:
  - `resources/cheat-sheet.md`: Obsežen pregled sklicev ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije rollbacka in nameščanja
  - `docs/troubleshooting/debugging.md`: Popravljeni odseki za analizo dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi za odpravljanje težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljena sekcija za odpravljanje napak AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za nadzor
  - `docs/getting-started/first-project.md`: Posodobljeni primeri nadzora in odpravljanja napak
  - `docs/getting-started/installation.md`: Popravljeni primeri pomoči in različic
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za pregled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za odpravljanje napak agentov

- **📝 Posodobljen sklic na različico**: 
  - `docs/getting-started/installation.md`: Spremenjena trdo kodirana različica `1.5.0` v generično `1.x.x` z povezavo do izdaj

#### Spremembe
- **Strategije rollbacka**: Posodobljena dokumentacija za uporabo rollbacka na podlagi Gita (AZD nima izvornega rollbacka)
- **Pregledovanje dnevnikov**: Zamenjani sklici `azd logs` z `azd monitor --logs`, `azd monitor --live` in ukazi Azure CLI
- **Odsek o zmogljivosti**: Odstranjeni neobstoječi preklopi za paralelno/inkrementalno nameščanje, dodane veljavne alternative

#### Tehnični podatki
- **Veljavni AZD ukazi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavni preklopi azd monitor**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Preverjanje**: Ukazi validirani proti Azure Developer CLI verziji v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Zaključek delavnice in posodobitev kakovosti dokumentacije
**Ta različica dokončuje interaktivne module delavnice, popravlja vse prekinjene povezave v dokumentaciji ter izboljšuje celotno kakovost vsebine za razvijalce AI, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument s smernicami za prispevanje, ki vključuje:
  - Jasna navodila za poročanje o težavah in predloge sprememb
  - Standardi dokumentacije za novo vsebino
  - Smernice za primere kode in konvencije sporočil commitov
  - Informacije o vključevanju skupnosti

#### Dokončano
- **🎯 Modul delavnice 7 (Zaključek)**: Popolnoma dokončan zaključni modul z:
  - Obsežnim povzetkom dosežkov delavnice
  - Razdelkom o ključnih obvladanih konceptih o AZD, predlogah in Microsoft Foundry
  - Priporočili za nadaljevanje učne poti
  - Naloge za izziv delavnice z ocenami zahtevnosti
  - Povratne informacije skupnosti in povezave za podporo

- **📚 Modul delavnice 3 (Razčlenitev)**: Posodobljeni cilji učenja z:
  - Navodili za aktivacijo GitHub Copilota s strežniki MCP
  - Razumevanjem strukture map predlog AZD
  - Vzorce organizacije infrastrukture kot kode (Bicep)
  - Navodili za praktično delo v laboratoriju

- **🔧 Modul delavnice 6 (Razpustitev)**: Dokončan z:
  - Cilji čiščenja virov in upravljanja stroškov
  - Uporabo `azd down` za varno odstranjevanje infrastrukture
  - Navodili za obnovitev mehko izbrisanih kognitivnih storitev
  - Dodatnimi raziskovalnimi spodbujami za GitHub Copilot in Azure Portal

#### Popravljeno
- **🔗 Popravki prekinjenih povezav**: Rešenih več kot 15 prekinjenih notranjih povezav v dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljene poti do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljene poti ai-model-deployment.md in production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamenjan neobstoječi cicd-integration.md z deployment-guide.md
  - `examples/retail-scenario.md`: Popravljene poti do pogostih vprašanj in vodnika za odpravljanje težav
  - `examples/container-app/microservices/README.md`: Popravljene poti do domače strani tečaja in vodnika za nameščanje
  - `resources/faq.md` in `resources/glossary.md`: Posodobljeni sklici na poglavja AI
  - `course-outline.md`: Popravljeni sklici na vodnik in lab delavnice AI

- **📅 Pasica statusa delavnice**: Posodobljena iz "V pripravi" v aktiven status delavnice z datumom februar 2026

- **🔗 Navigacija delavnice**: Popravljene prekinjene povezave za navigacijo v README delavnice, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Predstavitev delavnice**: Odstranjena opozorila "v pripravi", delavnica je zdaj dokončana in pripravljena za uporabo
- **Konsistentnost navigacije**: Zagotovljena pravilna medmodulska navigacija za vse module delavnice
- **Sklici učne poti**: Posodobljeni križni sklici poglavij z uporabo pravih poti microsoft-foundry

#### Validirano
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so dokončani z učnimi cilji
- ✅ Navigacija med poglavji in moduli deluje pravilno
- ✅ Vsebina primerna za razvijalce AI, ki uporabljajo Microsoft AZD
- ✅ Ohranjen je jezik in struktura prijazna začetnikom
- ✅ CONTRIBUTING.md zagotavlja jasna navodila za prispevke skupnosti

#### Tehnična izvedba
- **Preverjanje povezav**: Samodejni PowerShell skript je preveril vse notranje povezave .md datotek
- **Revizija vsebine**: Ročni pregled dokončanosti delavnice in primernega nivoja začetnika
- **Sistem navigacije**: Uporabljeni so bili dosledni vzorci navigacije poglavij in modulov

#### Opombe
- **Obseg**: Spremembe uporabljene samo v angleški dokumentaciji
- **Prevodi**: Prevodi niso bili posodobljeni v tej različici (samodejni prevod bo sinhroniziran kasneje)
- **Trajanje delavnice**: Celotna delavnica zdaj nudi 3-4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Nadzor, varnost in vzorci večagentnega sodelovanja
**Ta različica dodaja obsežna A-nivo lekcije o integraciji Application Insights, vzorcih overjanja in koordinaciji več agentov za produkcijska nameščanja.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Nameščanje osredotočeno na AZD z avtomatskim zagotavljanjem
  - Popolne Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojenim telemetrijskim zbiranjem (1200+ vrstic)
  - Vzorci nadzora AI/LLM (sledenje tokenov/stroškov Microsoft Foundry modelov)
  - 6 diagramov Mermaid (arhitektura, distribuirano sledenje, tok telemetrije)
  - 3 praktične vaje (opozorila, nadzorne plošče, AI nadzor)
  - Primeri poizvedb Kusto in strategije optimizacije stroškov
  - Pretakanje meritev v živo in odpravljanje napak v realnem času
  - 40-50 minut časa za učenje z vzorci pripravljenimi za produkcijo

- **🔐 Lekcija o vzorcih overjanja in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci overjanja (povezovalni nizi, Key Vault, upravljana identiteta)
  - Popolne Bicep predloge infrastrukture za varna nameščanja
  - Koda Node.js aplikacije z integracijo Azure SDK
  - 3 popolne vaje (omogočanje upravljane identitete, dodeljene identitete, rotacije Key Vault)
  - Prakse za varnost in RBAC konfiguracije
  - Vodnik za odpravljanje težav in analiza stroškov
  - Produkcijsko pripravljeni vzorci overjanja brez gesla

- **🤖 Lekcija o vzorcih večagentne koordinacije**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (sekvenčno, vzporedno, hierarhično, na dogodke, konsenz)
  - Popolna implementacija orkestra storitve (Python/Flask, 1500+ vrstic)
  - 3 specializirane implementacije agentov (Raziskovalec, Pisec, Urednik)
  - Integracija Service Bus za vrsto sporočil
  - Upravljanje stanja Cosmos DB za distribuirane sisteme
  - 6 Mermaid diagramov, ki prikazujejo interakcije agentov
  - 3 napredne vaje (upravljanje časovnih omejitev, logika ponovnih poskusov, odklopnik)
  - Razčlenitev stroškov (240-565 $/mesec) z optimizacijskimi strategijami
  - Integracija Application Insights za nadzor

#### Izboljšano
- **Poglavje Pred nameščanjem**: Zdaj vključuje obsežne vzorce nadzora in koordinacije
- **Začetek uporabe**: Izboljšano s profesionalnimi vzorci overjanja
- **Pripravljenost za proizvodnjo**: Celovito pokrivanje od varnosti do opazovanja
- **Načrt tečaja**: Posodobljen z vključitvijo novih lekcij v poglavjih 3 in 6

#### Spremenjeno
- **Potek učenja**: Boljša integracija varnosti in nadzora skozi tečaj
- **Kakovost dokumentacije**: Dosledni standardi A-nivoja (95-97 %) v novih lekcijah
- **Vzorec za produkcijo**: Celovito pokritje od začetka do konca za podjetniška nameščanja

#### Izboljšano
- **Uporabniška izkušnja razvijalca**: Jasna pot od razvoja do produkcijskega nadzora
- **Varnostni standardi**: Profesionalni vzorci za overjanje in upravljanje skrivnosti
- **Opazovanje**: Celovita integracija Application Insights z AZD
- **Obremenitve AI**: Specializiran nadzor Microsoft Foundry modelov in večagentnih sistemov

#### Validirano
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne le odlomke)
- ✅ Diagrami Mermaid za vizualno učenje (skupaj 19 čez 3 lekcije)
- ✅ Praktične vaje s preveritvenimi koraki (skupaj 9)
- ✅ Produkcijsko pripravljene Bicep predloge, ki jih je mogoče namestiti z `azd up`
- ✅ Analize stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje težav in dobre prakse
- ✅ Kontrolne točke znanja z ukazi za preverjanje

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Celovit vodnik nadzora
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne večagentne arhitekture
- **Celotna nova vsebina**: - Dosledni visoki standardi kakovosti

#### Tehnična izvedba
- **Application Insights**: Log Analytics + prilagojena telemetrija + distribuirano sledenje
- **Overjanje**: Upravljana identiteta + Key Vault + RBAC vzorci
- **Več agentov**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Metrične meritve v živo + Kusto poizvedbe + opozorila + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike zadrževanja, proračunske kontrole

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Microsoft Foundry Models
**Ta različica izboljšuje kakovost dokumentacije v celotnem repozitoriju in dodaja popoln primer nameščanja Microsoft Foundry Models z vmesnikom za klepet gpt-4.1.**

#### Dodano
- **🤖 Primer klepeta Microsoft Foundry Models**: Popolno nameščanje gpt-4.1 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Microsoft Foundry Models (nameščanje modela gpt-4.1)
  - Ukazna vrstica Python klepetalni vmesnik z zgodovino pogovora
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje porabi tokenov in ocenjevanje stroškov
  - Omejevanje hitrosti in upravljanje napak
  - Obsežen README z navodili za nameščanje trajanja 35-45 minut
  - 11 datotek pripravljenih za produkcijo (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Vaje za dokumentacijo**: Dodane praktične vaje v vodnik za konfiguracijo:
  - Naloga 1: Več-okoljska konfiguracija (15 minut)
  - Naloga 2: Vaja upravljanja skrivnosti (10 minut)
  - Jasna merila uspeha in koraki za preverjanje
- **✅ Preverjanje nameščanja**: Dodan razdelek za preverjanje v vodnik za nameščanje:
  - Postopki zdravstvenega pregleda
  - Kontrolni seznam meril uspeha
  - Pričakovani izhodi za vse ukaze nameščanja
  - Hitri referenčni vodič za odpravljanje težav

#### Izboljšano
- **examples/README.md**: Posodobljeno na kakovost A-nivo (93 %):
  - Dodano azure-openai-chat v vse ustrezne razdelke
  - Posodobljeno število lokalnih primerov s 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v Hitri začetek za srednje uporabnike
  - Dodano v razdelek Microsoft Foundry predloge
  - Posodobljene primerjalne matrike in odseki za tehnologijo
- **Kakovost dokumentacije**: Izboljšano z B+ (87 %) → A- (92 %) čez celotno mapo docs:

  - Dodani pričakovani rezultati k primerom ključnih ukazov
  - Vključeni koraki preverjanja za spremembe konfiguracije
  - Izboljšano učenje z več praktičnimi vajami

#### Spremenjeno
- **Napredek učenja**: Boljša integracija primerov AI za srednje zahtevne uporabnike
- **Struktura dokumentacije**: Več praktičnih vaj z jasnimi rezultati
- **Postopek preverjanja**: Dodani izrecni kriteriji uspeha za ključne delovne tokove

#### Izboljšano
- **Izkušnja razvijalca**: Implementacija Microsoft Foundry Modelov traja zdaj 35-45 minut (namesto 60-90 za zahtevnejše alternative)
- **Preglednost stroškov**: Jasne ocene stroškov (50-200 $/mesec) za primer Microsoft Foundry Modelov
- **Pot učenja**: AI razvijalci imajo jasen začetni točko z azure-openai-chat
- **Standardi dokumentacije**: Dosledni pričakovani izhodi in koraki preverjanja

#### Validirano
- ✅ Primer Microsoft Foundry Modelov popolnoma delujoč z `azd up`
- ✅ Vseh 11 izvajalskih datotek sintaktično pravilnih
- ✅ Navodila v README se ujemajo z dejansko izkušnjo namestitve
- ✅ Povezave v dokumentaciji posodobljene na več kot 8 mestih
- ✅ Indeks primerov točno odraža 4 lokalne primere
- ✅ Ni podvojenih zunanjih povezav v tabelah
- ✅ Vse navigacijske reference so pravilne

#### Tehnična izvedba
- **Arhitektura Microsoft Foundry Modelov**: vzorec gpt-4.1 + Key Vault + Container Apps
- **Varnost**: Upravljen identiteta pripravljena, skrivnosti v Key Vault
- **Nadzor**: Integracija Application Insights
- **Upravljanje stroškov**: Sledenje in optimizacija uporabe žetonov (tokenov)
- **Namestitev**: Sam ukaz `azd up` za popolno nastavitve

### [v3.6.0] - 2025-11-19

#### Glavna posodobitev: Primeri namestitev Container App
**Ta različica uvaja obsežne, produkcijsko pripravljene primere namestitve kontejnerskih aplikacij z uporabo Azure Developer CLI (AZD), z popolno dokumentacijo in vključitvijo v pot učenja.**

#### Dodano
- **🚀 Primeri Container App**: Novi lokalni primeri v `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Celovit pregled kontejnerskih namestitev, hiter začetek, produkcija in napredni vzorci
  - [Preprosta Flask API](../../examples/container-app/simple-flask-api): Prijazen začetnikom REST API z skaliranjem na ničlo, zdravstvenimi sondami, nadzorom in odpravljanjem težav
  - [Arhitektura mikroservisov](../../examples/container-app/microservices): Produkcijsko pripravljena večstoritevna namestitev (API Gateway, Produkt, Naročilo, Uporabnik, Obvestila), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, razdeljeno sledenje, modro-zelena/canary namestitev
- **Najboljše prakse**: Varnost, nadzor, optimizacija stroškov in navodila CI/CD za kontejnerske delovne obremenitve
- **Vzorci kode**: Popoln `azure.yaml`, Bicep predloge in večjezične implementacije storitev (Python, Node.js, C#, Go)
- **Testiranje & Odpravljanje težav**: End-to-end testni scenariji, ukazi za nadzor, navodila za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljen z novimi primeri container app pod "Lokalnimi primeri - kontejnerske aplikacije"
- **examples/README.md**: Posodobljen z izpostavitvijo primerov container app, dodanimi vnosi v primerjalni matriki in posodobljenimi tehnološkimi/arhitekturnimi referencami
- **Načrt tečaja & Vodič za študij**: Posodobljen za reference novih primerov container app in vzorcev namestitve v ustreznih poglavjih

#### Validirano
- ✅ Vsi novi primeri se lahko namestijo z `azd up` in sledijo najboljšim praksam
- ✅ Povezave v dokumentaciji in navigacija posodobljene
- ✅ Primeri zajemajo scenarije od začetnega do naprednega nivoja, vključno s produkcijskimi mikroservisi

#### Opombe
- **Obseg**: Dokumentacija in primeri samo v angleščini
- **Naslednji koraki**: Razširitev z dodatnimi naprednimi kontejnerskimi vzorci in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 2025-11-19

#### Preimenovanje izdelka: Microsoft Foundry
**Ta različica uvaja celovito zamenjavo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v vsej angleški dokumentaciji, kar odraža uradno preimenovanje Microsofta.**

#### Spremenjeno
- **🔄 Posodobitev imena izdelka**: Celovito preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljene vse reference v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: 23 posodobitev referenc v 7 datotekah dokumentacije

- **📁 Spremembe strukture map**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Posodobljene vse križne reference za novo strukturo map
  - Validirane navigacijske povezave v celotni dokumentaciji

- **📄 Preimenovanje datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Posodobljene notranje povezave za novo ime datoteke

#### Posodobljene datoteke
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 posodobitve imen proizvoda
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 posodobitve referenc (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 posodobitve križnih povezav
  - `docs/getting-started/first-project.md` - 2 posodobitve navigacijskih povezav poglavij
  - `docs/getting-started/installation.md` - 2 posodobitve povezav do naslednjih poglavij
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 posodobitve referenc (navigacija, Discord skupnost)
  - `docs/troubleshooting/common-issues.md` - 1 posodobitev navigacijske povezave
  - `docs/troubleshooting/debugging.md` - 1 posodobitev navigacijske povezave

- **Datoteke strukture tečaja** (2 datoteki):
  - `README.md` - 17 posodobitev referenc (pregled tečaja, naslovi poglavij, razdelek predlog, vpogledi skupnosti)
  - `course-outline.md` - 14 posodobitev referenc (pregled, cilji učenja, viri poglavij)

#### Validirano
- ✅ Ni več referenc na mapo "ai-foundry" v angleški dokumentaciji
- ✅ Ni več referenc imena izdelka "Microsoft Foundry" v angleški dokumentaciji
- ✅ Vse navigacijske povezave delujejo z novo strukturo map
- ✅ Preimenovanje datotek in map uspešno izvedeno
- ✅ Validirane križne reference med poglavji

#### Opombe
- **Obseg**: Spremembe veljajo samo za angleško dokumentacijo v mapi `docs/`
- **Prevodi**: Mape prevodov (`translations/`) v tej različici niso posodobljene
- **Delavnica**: Materiali delavnic (`workshop/`) niso posodobljeni v tej različici
- **Primeri**: Vzorne datoteke lahko še vedno vsebujejo stare poimenovanja (bodo obravnavane v prihodnjih posodobitvah)
- **Zunanje povezave**: Zunanji URL-ji in povezave na GitHub repozitorije ostajajo nespremenjeni

#### Vodnik za migracijo za sodelavce
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite reference map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite reference datotek: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje povezave v dokumentaciji še vedno delujejo

---

### [v3.4.0] - 2025-10-24

#### Izboljšave predogleda infrastrukture in validacije
**Ta različica uvaja celovito podporo za novo funkcionalnost Azure Developer CLI predogleda in izboljšuje uporabniško izkušnjo pri delavnici.**

#### Dodano
- **🧪 Dokumentacija funkcije azd provision --preview**: Celovit pregled nove sposobnosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v pomožnem listu
  - Podrobna integracija v vodič za zagotavljanje s primeri uporabe in prednostmi
  - Integracija predhodnih preverjanj za varnejšo validacijo namestitve
  - Posodobitve vodiča za začetek z varnostno usmerjenimi praksami namestitve
- **🚧 Pasica statusa delavnice**: Profesionalna HTML pasica, ki označuje razvojni status delavnice
  - Oblikovanje z gradientom in indikatorji gradbišča za jasno komunikacijo uporabniku
  - Čas zadnje posodobitve za preglednost
  - Oblikovanje prilagojeno za mobilne naprave

#### Izboljšano
- **Varnost infrastrukture**: Funkcija predogleda vključena povsod v dokumentaciji o namestitvi
- **Validacija pred namestitvijo**: Avtomatizirani skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Delovni tok razvijalca**: Posodobljena zaporedja ukazov vključujejo predogled kot najboljšo prakso
- **Uporabniška izkušnja delavnice**: Jasna pričakovanja o statusu razvoja vsebine za uporabnike

#### Spremenjeno
- **Najboljše prakse namestitve**: Zdaj priporočeno delovanje s predogledom na prvem mestu
- **Potek dokumentacije**: Validacija infrastrukture premaknjena prej v proces učenja
- **Predstavitev delavnice**: Profesionalna komunikacija statusa z jasno časovnico razvoja

#### Izboljšano
- **Pristop s prvo varnostjo**: Spremembe infrastrukture je mogoče zdaj preveriti pred namestitvijo
- **Sodelovanje ekipe**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred zagotavljanjem
- **Zmanjšanje tveganj**: Manj napak pri namestitvi z zgodnjo validacijo

#### Tehnična izvedba
- **Integracija več dokumentov**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorce ukazov**: Dosledna sintaksa in primeri skozi celotno dokumentacijo
- **Vključitev najboljših praks**: Predogled vključen v delovne tokove validacije in skripte
- **Vizualni indikatorji**: Jasne oznake NOVE funkcije za lažje odkrivanje

#### Infrastruktura delavnice
- **Komunikacija statusa**: Profesionalna HTML pasica z gradientno obliko
- **Uporabniška izkušnja**: Jasen status razvoja preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja ugled repozitorija in nastavlja pričakovanja
- **Preglednost časovnice**: Čas zadnje posodobitve oktober 2025 za odgovornost

### [v3.3.0] - 2025-09-24

#### Izboljšani materiali delavnic in interaktivna učna izkušnja
**Ta različica uvaja obsežne materiale za delavnico z izkušnjo v brskalniku in strukturirane učne poti.**

#### Dodano
- **🎥 Interaktivni vodič delavnice**: Izkušnja delavnice v brskalniku z zmogljivostjo MkDocs predogleda
- **📝 Strukturirana navodila delavnice**: 7-stopenjska vodena učna pot od odkrivanja do prilagoditve
  - 0-Uvod: Pregled in priprava delavnice
  - 1-Izberi-AI-Šablono: Postopek iskanja in izbire šablone
  - 2-Preveri-AI-Šablono: Postopki namestitve in preverjanja
  - 3-Razstavi-AI-Šablono: Razumevanje arhitekture šablone
  - 4-Konfiguriraj-AI-Šablono: Konfiguracija in prilagoditev
  - 5-Prilagodi-AI-Šablono: Napredne spremembe in iteracije
  - 6-Očisti-Infrastrukturo: Pospravljanje in upravljanje virov
  - 7-Zaključek: Povzetek in naslednji koraki
- **🛠️ Orodja delavnice**: Konfiguracija MkDocs z Material temo za izboljšano učno izkušnjo
- **🎯 Pot praktičnega učenja**: 3-stopenjska metodologija (odkrivanje → namestitev → prilagoditev)
- **📱 Integracija GitHub Codespaces**: Gladka nastavitev razvojnega okolja

#### Izboljšano
- **AI laboratorij delavnice**: Razširjen z obsežno 2-3 urno strukturirano učno izkušnjo
- **Dokumentacija delavnic**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Napredek učenja**: Jasna navodila korak za korakom od izbire šablone do produkcijske namestitve
- **Izkušnja razvijalca**: Integrirana orodja za poenostavljene delovne tokove razvoja

#### Izboljšano
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- **Učenje s svojim tempom**: Prilagodljiva struktura delavnice za različne hitrosti učenja
- **Praktična uporaba**: Scenariji namestitve AI šablon iz resničnega sveta
- **Integracija skupnosti**: Discord vključitev za podporo in sodelovanje pri delavnici

#### Značilnosti delavnice
- **Vgrajeno iskanje**: Hitro odkrivanje ključnih besed in lekcij
- **Kopiranje blokov kode**: Funkcija premik za kopiranje vseh kodnih primerov
- **Preklop teme**: Podpora temni/svetli način za različne preference
- **Vizualni pripomočki**: Posnetki zaslona in diagrami za boljše razumevanje
- **Vključitev pomoči**: Neposreden dostop do Discord skupnosti za podporo

### [v3.2.0] - 2025-09-17

#### Obsežno prestrukturiranje navigacije in učni sistem na osnovi poglavij
**Ta različica uvaja celovit sistem učenja po poglavjih z izboljšano navigacijo po celotnem repozitoriju.**

#### Dodano
- **📚 Učni sistem na osnovi poglavij**: Celoten tečaj preurejen v 8 progresivnih učnih poglavij
  - Poglavje 1: Osnove & hitri začetek (⭐ - 30-45 minut)
  - Poglavje 2: AI-prvi razvoj (⭐⭐ - 1-2 uri)
  - Poglavje 3: Konfiguracija & avtentikacija (⭐⭐ - 45-60 minut)
  - Poglavje 4: Infrastruktura kot koda & namestitev (⭐⭐⭐ - 1-1,5 ure)
  - Poglavje 5: Večagentne AI rešitve (⭐⭐⭐⭐ - 2-3 ure)
  - Poglavje 6: Pre-verifikacija & načrtovanje namestitve (⭐⭐ - 1 ura)
  - Poglavje 7: Odpravljanje težav & razhroščevanje (⭐⭐ - 1-1,5 ure)
  - Poglavje 8: Produkcijski & enterprise vzorci (⭐⭐⭐⭐ - 2-3 ure)
- **📚 Celovit navigacijski sistem**: Dosledni glavi in nogi navigacije po celi dokumentaciji
- **🎯 Spremljanje napredka**: Kontrolni seznam dokončanja tečaja in sistem preverjanja učenja
- **🗺️ Vodnik učne poti**: Jasne začetne točke za različne ravni izkušenj in ciljev
- **🔗 Križno povezovanje navigacije**: Povezana poglavja in predpogojne povezave jasno označene

#### Izboljšano
- **Struktura README**: Preoblikovana v strukturirano učno platformo z organizacijo po poglavjih
- **Navigacija dokumentacije**: Vsaka stran zdaj vključuje kontekst poglavja in navodila za napredek
- **Organizacija šablon**: Primeri in šablone razporejeni po ustreznih učnih poglavjih

- **Integracija virov**: Prevarantske liste, pogosta vprašanja in študijski vodiči povezani z relevantnimi poglavji
- **Integracija delavnic**: Praktične laboratorijske vaje povezane z več učnimi cilji posameznih poglavij

#### Spremenjeno
- **Napredovanje učenja**: Prehod iz linearne dokumentacije na prilagodljivo učenje, osnovano na poglavjih
- **Postavitev konfiguracije**: Premaknjeni vodič za konfiguracijo kot Poglavje 3 za boljši potek učenja
- **Integracija vsebine AI**: Boljša integracija vsebine specifične za AI skozi celotno učno pot
- **Produkcijska vsebina**: Napredni vzorci združeni v Poglavju 8 za učence iz poslovnega okolja

#### Izboljšano
- **Uporabniška izkušnja**: Jasna navigacijska pot in indikatorji napredka po poglavjih
- **Dostopnost**: Konsistentni vzorci navigacije za lažje premikanje po tečaju
- **Profesionalna predstavitev**: Struktura tečaja v univerzitetnem slogu, primerna za akademsko in korporativno usposabljanje
- **Učinkovitost učenja**: Skrajšan čas iskanja relevantne vsebine z izboljšano organizacijo

#### Tehnična implementacija
- **Navigacijski naslovi**: Standardizirana navigacija po poglavjih v več kot 40 dokumentacijskih datotekah
- **Navigacija v nogi strani**: Konsistentna usmeritev za napredovanje in indikatorji zaključka poglavij
- **Medsebojna povezava**: Celovit sistem notranjih povezav, ki povezuje sorodne koncepte
- **Preslikava poglavij**: Predloge in primeri jasno povezani z učnimi cilji

#### Izboljšave študijskega vodiča
- **📚 Celoviti učni cilji**: Prestrukturiran študijski vodič za uskladitev z 8-poglavno shemo
- **🎯 Ocena na osnovi poglavij**: Vsako poglavje vključuje specifične učne cilje in praktične vaje
- **📋 Spremljanje napredka**: Tedenski učni načrt z merljivimi rezultati in kontrolnimi seznamčki
- **❓ Vprašanja za ocenjevanje**: Vprašanja za preverjanje znanja za vsako poglavje z profesionalnimi učinki
- **🛠️ Praktične vaje**: Praktične aktivnosti s pravimi scenariji nameščanja in odpravljanja težav
- **📊 Napredovanje veščin**: Jasno napredovanje od osnovnih konceptov do poslovnih vzorcev s poudarkom na kariernem razvoju
- **🎓 Certifikacijski okvir**: Rezultati profesionalnega razvoja in sistem družbenega priznanja
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 2025-09-17

#### Izboljšane večagentne AI rešitve
**Ta različica izboljšuje večagentsko maloprodajno rešitev z boljšo poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremenjeno
- **Terminologija več agentov**: Izraz "Cora agent" zamenjan z "Uporabniški agent" po celotni maloprodajni večagentski rešitvi za boljšo razumljivost
- **Arhitektura agentov**: Posodobljena vsa dokumentacija, ARM predloge in kode primere za dosledno poimenovanje "Uporabniški agent"
- **Primeri konfiguracije**: Posodobljeni vzorci konfiguracije agentov z novimi poimenovalnimi konvencijami
- **Konsistentnost dokumentacije**: Zagotovljene vse reference s profesionalnimi, opisnimi imeni agentov

#### Izboljšano
- **Paket ARM predlog**: Posodobljen retail-multiagent-arm-template z referencami na Uporabniški agent
- **Arhitekturni diagrami**: Osveženi diagrami Mermaid z novimi poimenovanji agentov
- **Primeri kode**: Python razredi in primeri implementacij zdaj uporabljajo poimenovanje CustomerAgent
- **Okoljske spremenljivke**: Posodobljeni vsi skripti za nameščanje z uporabo konvencij CUSTOMER_AGENT_NAME

#### Izboljšano
- **Izkušnja razvijalca**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za produkcijo**: Boljša skladnost s poslovnimi poimenovalnimi konvencijami
- **Učni materiali**: Intuitivnejše poimenovanje agentov za izobraževalne namene
- **Uporabnost predlog**: Poenostavljeno razumevanje funkcij agentov in vzorcev nameščanja

#### Tehnični podatki
- Posodobljeni Mermaid arhitekturni diagrami z referencami CustomerAgent
- Nadomeščena imena razredov CoraAgent z CustomerAgent v Python primerih
- Spremenjene ARM predloge JSON konfiguracij z uporabo tipa agenta "customer"
- Posodobljene okoljske spremenljivke iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osvežene vse ukaze nameščanja in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Glavne spremembe - Poudarek na AI razvijalcih in integracija Microsoft Foundry
**Ta različica transformira repozitorij v celovit vir za učenje, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Dodano
- **🤖 AI-prvi učni potek**: Popolna prenova z osredotočenostjo na AI razvijalce in inženirje
- **Vodnik za integracijo Microsoft Foundry**: Celovita dokumentacija za povezavo AZD z Microsoft Foundry storitvami
- **Vzorec nameščanja AI modelov**: Podroben vodič za izbiro modela, konfiguracijo in strategije nameščanja v produkciji
- **Laboratorijska delavnica o AI**: 2-3 ure praktične delavnice za pretvorbo AI aplikacij v rešitve, nameščene preko AZD
- **Prakse za produkcijo AI**: Poslovno pripravljeni vzorci za skaliranje, nadziranje in varovanje AI obremenitev
- **Vodič za odpravljanje težav specifičnih za AI**: Celovito odpravljanje težav pri Microsoft Foundry modelih, kognitivnih storitvah in nameščanju AI
- **Galerija AI predlog**: Izbrana zbirka Microsoft Foundry predlog z ocenami zahtevnosti
- **Materiali za delavnico**: Celotna struktura delavnice s praktičnimi laboratorijskimi vajami in referenčnimi materiali

#### Izboljšano
- **Struktura README**: Osredotočeno na AI razvijalce z 45% podatkov interesov skupnosti iz Microsoft Foundry Discorda
- **Učni poti**: Namenjena AI razvijalcem poleg tradicionalnih poti za študente in DevOps inženirje
- **Priporočila predlog**: Izpostavljene AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Integracija skupnosti**: Izboljšana podpora Discord skupnosti z AI-specifičnimi kanali in razpravami

#### Varnost in poudarek na produkcijo
- **Vzorce avtentikacije z upravljano identiteto**: AI-specifične nastavitve varnosti in avtentikacije
- **Optimizacija stroškov**: Sledenje uporabe žetonov in nadzor proračuna za AI obremenitve
- **Nameščanje v več regijah**: Strategije globalnega nameščanja AI aplikacij
- **Nadzor zmogljivosti**: AI-specifične metrike in integracija Application Insights

#### Kakovost dokumentacije
- **Linearni potek tečaja**: Logično napredovanje od začetnika do naprednih vzorcev nameščanja AI
- **Preverjene povezave**: Vse zunanje povezave na repozitorij preverjene in dostopne
- **Celovit referenčni vir**: Vse notranje povezave v dokumentaciji validirane in funkcionalne
- **Pripravljeno za produkcijo**: Poslovni vzorci nameščanja z realnimi primeri

### [v2.0.0] - 2025-09-09

#### Glavne spremembe - Prenova repozitorija in profesionalna izboljšava
**Ta različica predstavlja velik preobrat v strukturi repozitorija in predstavitvi vsebine.**

#### Dodano
- **Strukturiran učni okvir**: Vse dokumentacijske strani zdaj vključujejo uvod, učne cilje in rezultate učenja
- **Navigacijski sistem**: Dodane povezave Prej/Naslednji učni korak čez celotno dokumentacijo za vodeno napredovanje
- **Študijski vodič**: Celovit study-guide.md z učnimi cilji, praktičnimi vajami in ocenjevalnimi materiali
- **Profesionalna predstavitev**: Odstranjene vse emojije za boljšo dostopnost in profesionalen izgled
- **Izboljšana struktura vsebine**: Boljša organizacija in potek učnih materialov

#### Spremenjeno
- **Format dokumentacije**: Standardizirana vsa dokumentacija s konsistentno strukturo, osredotočeno na učenje
- **Potek navigacije**: Implementirano logično napredovanje skozi vse učne materiale
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v korist jasne, profesionalne oblikovne predloge
- **Struktura povezav**: Posodobljene vse notranje povezave za podpiranje novega navigacijskega sistema

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emojijev za boljšo združljivost z bralniki zaslona
- **Profesionalni izgled**: Čista predstavitev v akademskem slogu, primerna za poslovno učenje
- **Učna izkušnja**: Strukturiran pristop z jasnimi cilji in rezultati za vsak učni korak
- **Organizacija vsebine**: Boljši logični potek in povezave med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prva izdaja - Celovit repozitorij za učenje AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Celotna serija vodičev za začetek
  - Celovita dokumentacija za nameščanje in zagotavljanje storitev
  - Podrobni viri za odpravljanje napak in vodniki za odpravljanje težav
  - Orodja in postopki za validacijo pred nameščanjem

- **Modul za začetek**
  - Osnove AZD: osnovni koncepti in terminologija
  - Vodič za namestitev: navodila za specifične platforme
  - Vodič za konfiguracijo: nastavitev okolja in avtentikacija
  - Prvi projekt: praktično učenje po korakih

- **Modul za nameščanje in zagotavljanje**
  - Vodič za nameščanje: celotna dokumentacija delovnega toka
  - Vodič za zagotavljanje: infrastruktura kot koda z Bicep
  - Najboljše prakse za produkcijsko nameščanje
  - Vzorci za arhitekturo več storitev

- **Modul za validacijo pred nameščanjem**
  - Načrtovanje zmogljivosti: preverjanje razpoložljivosti Azure virov
  - Izbor SKU: celovit vodič za ravni storitev
  - Prednaročni pregledi: avtomatizirani validacijski skripti (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: pogosto srečani problemi in rešitve
  - Vodič za odpravljanje napak: sistematične metode odpravljanja težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje in optimizacija zmogljivosti

- **Viri in reference**
  - Prevarantska lista ukazov: hiter pregled osnovnih ukazov
  - Slovar: celovite definicije terminologije in kratic
  - Pogosta vprašanja (FAQ): podrobni odgovori na pogosta vprašanja
  - Zunanje povezave do virov in povezave skupnosti

- **Primeri in predloge**
  - Preprost primer spletne aplikacije
  - Predloga za nameščanje statične spletne strani
  - Konfiguracija aplikacij v kontejnerjih
  - Vzorec integracije podatkovnih baz
  - Primeri arhitekture mikro storitev
  - Implementacije funkcij brez strežnika (serverless)

#### Značilnosti
- **Podpora več platformam**: Vodiči za namestitev in konfiguracijo za Windows, macOS in Linux
- **Več ravni znanja**: Vsebina za študente in profesionalne razvijalce
- **Praktični poudarek**: Praktični primeri in realni scenariji
- **Celostna pokritost**: Od osnovnih konceptov do naprednih poslovnih vzorcev
- **Pristop z varnostjo na prvem mestu**: Vgrajene varnostne najboljše prakse
- **Optimizacija stroškov**: Navodila za stroškovno učinkovita nameščanja in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: praktični, preizkušeni vzorci kode
- **Navodila po korakih**: jasna, izvedljiva navodila
- **Celovito ravnanje z napakami**: odpravljanje težav za pogoste napake
- **Integracija najboljših praks**: industrijski standardi in priporočila
- **Združljivost različic**: Posodobljeno z najnovejšimi Azure storitvami in funkcionalnostmi azd

## Načrtovane prihodnje izboljšave

### Verzija 3.1.0 (Načrtovana)
#### Razširitev AI platforme
- **Podpora več modelom**: Integracijski vzorci za Hugging Face, Azure Machine Learning in prilagojene modele
- **Okviri za AI agente**: Predloge za LangChain, Semantic Kernel in AutoGen nameščanja
- **Napredni vzorci RAG**: Možnosti vektorske baze podatkov poleg Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje zmogljivosti modelov, uporabe žetonov in kakovosti odzivov

#### Izkušnja razvijalca
- **Razširitev VS Code**: Integrirano razvojno okolje AZD + Microsoft Foundry
- **Integracija GitHub Copilot**: AI-podprto generiranje AZD predlog
- **Interaktivni vodiči**: Praktične vaje kodiranja z avtomatizirano validacijo za AI scenarije
- **Video vsebine**: Dodatni video vodiči za vizualne učence, osredotočeni na nameščanje AI

### Verzija 4.0.0 (Načrtovana)
#### Poslovni AI vzorci
- **Okvir upravljanja**: Upravljanje AI modelov, skladnost in revizijske sledi
- **Večstrankarski AI**: Vzorci za servisiranje več strank z izoliranimi AI storitvami
- **Nameščanje AI na robu**: Integracija z Azure IoT Edge in primerki kontejnerjev
- **Hibridni oblak AI**: Vzorci za multi-oblačne in hibridne nameščanja za AI obremenitve

#### Napredne funkcije
- **Avtomatizacija AI procesov**: Integracija MLOps z Azure Machine Learning cevovodi
- **Napredna varnost**: Vzorci ničelnega zaupanja, zasebni končni točki in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredne strategije prilagajanja in skaliranja za AI aplikacije z visoko pretočnostjo
- **Globalna distribucija**: Vzorci dostave vsebin in predpomnjenja na robu za AI aplikacije

### Verzija 3.0.0 (Načrtovana) - Nadomeščena s trenutno izdajo
#### Predlagani dodatki - Zdaj implementirani v v3.0.0
- ✅ **Vsebina osredotočena na AI**: Celovita integracija Microsoft Foundry (Dokončano)
- ✅ **Interaktivni vodiči**: Praktična AI delavnica (Dokončano)
- ✅ **Napredni varnostni modul**: AI-specifični varnostni vzorci (Dokončano)
- ✅ **Optimizacija zmogljivosti**: Strategije prilagajanja AI obremenitev (Dokončano)

### Verzija 2.1.0 (Načrtovana) - Delno implementirana v v3.0.0
#### Manjše izboljšave - Nekaj dokončanih v trenutni izdaji
- ✅ **Dodatni primeri**: Scenariji nameščanja osredotočeni na AI (Dokončano)
- ✅ **Razširjeni FAQ**: AI-specifična vprašanja in odpravljanje težav (Dokončano)
- **Integracija orodij**: Izboljšani vodiči za IDE in urejevalnike
- ✅ **Razširjeno spremljanje**: AI-specifični vzorci spremljanja in opozarjanja (Dokončano)

#### Še načrtovano za prihodnjo izdajo
- **Dokumentacija prijazna mobilnim napravam**: Prilagodljiva zasnova za učenje na mobilnih napravah
- **Dostop brez povezave**: Paketi dokumentacije za prenos
- **Izboljšana integracija IDE**: Razširitev VS Code za AZD + AI delovne tokove
- **Nadzorna plošča skupnosti**: Merjenje skupnostnih metrik in sledenje prispevkov v realnem času

## Prispevanje k dnevniku sprememb

### Prijava sprememb
Pri prispevanju v ta repozitorij, prosimo zagotovite, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: V skladu s semantičnim verzioniranjem (glavna.manša.popravek)
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
- Funkcije ali pristope, ki se ukinjajo
- Razdelki dokumentacije, ki jih je treba odstraniti
- Metode z boljšimi alternativami

#### Odstranjeno
- Funkcije, dokumentacije ali primeri, ki niso več relevantni
- Zastarele informacije ali pristope
- Odvečna ali združena vsebina

#### Popravljeno
- Popravki napak v dokumentaciji ali kodi
- Rešitve prijavljenih težav ali problemov
- Izboljšave točnosti ali funkcionalnosti


#### Varnost
- Izboljšave ali popravki, povezani z varnostjo
- Posodobitve najboljših varnostnih praks
- Reševanje varnostnih ranljivosti

### Smernice za semantično različico

#### Glavna različica (X.0.0)
- Spremembe, ki zahtevajo ukrepanje uporabnika
- Pomembna prestrukturiranja vsebine ali organizacije
- Spremembe, ki spremenijo temeljni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost z nazaj
- Dodatni primeri, orodja ali viri

#### Popravek (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Poenostavitve in manjše izboljšave

## Povratne informacije in predlogi skupnosti

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega gradiva:

### Kako podati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (posebne težave z AI so dobrodošle)
- **Discord Diskusije**: Delite ideje in sodelujte s skupnostjo Microsoft Foundry
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, zlasti AI predloge in vodiče
- **Microsoft Foundry Discord**: Sodelujte v kanalu #Azure za pogovore o AZD + AI
- **Skupnostni forumi**: Sodelujte v širših razpravah razvijalcev Azure

### Kategorije povratnih informacij
- **Natančnost AI vsebin**: Popravki informacij o integraciji in uvajanju AI storitev
- **Učno izkustvo**: Predlogi za izboljšan potek učenja AI razvijalcev
- **Pomanjkljiva AI vsebina**: Zahteve za dodatne AI predloge, vzorce ali primere
- **Dostopnost**: Izboljšave za različne učne potrebe
- **Integracija AI orodij**: Predlogi za boljšo integracijo razvojnega toka AI
- **Vzorci produkcijskega AI**: Zahteve za vzorce uvajanja AI v podjetjih

### Zaveza odgovora
- **Odgovor na težave**: V 48 urah za prijavljene težave
- **Zahteve za funkcije**: Pregled v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Prednostno takojšen odziv

## Urnik vzdrževanja

### Redne posodobitve
- **Mesečni pregledi**: Natančnost vsebine in preverjanje povezav
- **Kvartalne posodobitve**: Večji dodatki in izboljšave vsebine
- **Polletni pregledi**: Celovita prestrukturiranja in izboljšave
- **Letne izdaje**: Posodobitve glavnih različic z pomembnimi izboljšavami

### Nadzor in zagotavljanje kakovosti
- **Avtomatizirano testiranje**: Redno preverjanje primerov kode in povezav
- **Vključevanje povratnih informacij skupnosti**: Redni vključek predlogov uporabnikov
- **Tehnološke posodobitve**: Skladnost z najnovejšimi storitvami Azure in izdajami azd
- **Revizije dostopnosti**: Redni pregledi za vključujoče oblikovne principe

## Politika podpore različic

### Podpora trenutnim različicam
- **Najnovejša glavna različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki 12 mesecev
- **Zgodovinske različice**: Samo podpora skupnosti, brez uradnih posodobitev

### Navodila za migracijo
Ob izdaji glavnih različic zagotovimo:
- **Vodnike za migracijo**: Navodila za postopno prehodnost
- **Opombe o združljivosti**: Podrobnosti o prelomnih spremembah
- **Orodna podpora**: Skripte ali pripomočki za lajšanje migracije
- **Podpora skupnosti**: Namenjeni forumi za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Study Guide](resources/study-guide.md)
- **Naslednja lekcija**: Nazaj na [Main README](README.md)

**Ostanite na tekočem**: Spremljajte ta repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
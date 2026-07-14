# Muudatuste logi - AZD algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik olulised muudatused, uuendused ja täiustused AZD algajatele hoidlas. Me järgime semantilise versioonihalduse põhimõtteid ning hoiame seda logi, et aidata kasutajatel mõista, mis on versioonide vahel muutunud.

## Õpieesmärgid

Selle muudatuste logi ülevaatamisel:
- Hoidke end kursis uute funktsioonide ja sisulisandustega
- Mõistke olemasoleva dokumentatsiooni parendusi
- Jälgige vigade parandusi ja täpsuse tagamist
- Järgige õppematerjalide arengut ajas

## Õpitulemused

Pärast muudatuste logi kirjeid saate:
- Tuvastada uue sisu ja õppematerjalid, mis on saadaval
- Mõista, millised osad on uuendatud või parendatud
- Planeerida oma õppeprotsessi vastavalt kõige uuematele materjalidele
- Anda tagasisidet ja ettepanekuid tulevaste parenduste jaoks

## Versiooni ajalugu

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 värskendus: versiooni kehtivuse uuendus
**See versioon uuendab kursust vastavalt `azd` `1.27.1` (juuli 2026, viimane stabiilne väljaanne) ja praegusele eelvaate AI agentide laiendusele `azure.ai.agents` `1.0.0-beta.5`, uuendades kõiki „valideeritud vastu“ ribasid pärast 1.26.0, 1.27.0 ja 1.27.1 versioone.**

#### Muudetud
- **✅ Valideerimise lähtejoon uuendatud** `azd 1.25.6` juunist 2026 `azd 1.27.1` juuliks 2026 üle kogu peamise README, kõigi peatükkide README-de, peatüki 1 dev-konteinerite õppetunni (sh fikseeritud versioonide näidistega), peatüki 4 kohandatud mallide õppetunni, peatüki 5 mitme agendi õppetunni ja töötoa dokumentatsiooni
- **🤖 Peatükk 2 lähtejoon värskendatud** `azd 1.23.12` märtsist 2026 `azd 1.27.1` versioonini failides `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ja `microsoft-foundry-integration.md`; valideerimise märgiste kuupäevad uuendatud 2026-07-13
- **🧩 AI agendi laiendus tõstetud** `azure.ai.agents` versioonilt `0.1.40-preview`/`0.1.18-preview` praegusele `1.0.0-beta.5` väljaandele peatüki 2 README ja `agents.md` failis
- **🧪 Töötoa valideerimise näide** (`azd version` väljund) uuendatud versioonile `1.27.1`

#### Märkmed asjakohastele azd väljaannetele (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go tugi Azure Functions Flex Consumptionil, `azd config sub-filter` rentnikepõhised tellimuse filtrid, iseseisvad laienduste paketid (`azd x pack --bundle`), ja `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry projektide/agentide modelleerimine otse `azure.yaml`-is (Bicep- ja Terraformivaba algus), konteinerite juurutamise tugi App Service’is (`host: appservice` + `language: docker`), otse `-s/--source` lisamine `azd extension` käskudesse ja `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` lipp `azd extension install` käsule, aegunud mudelid vaikimisi välja jäetud kataloogi/mahupiirangute teavitustest ning mitmed veaparandused

#### Uuendatud failid
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

#### Algajate lünkade täide #2: malliloome, dev-konteinerid, Pulumi, Azure DevOps, teenusepõhised kontod ja rohkem
**See versioon sulgeb azd katvuse analüüsi järgi jäänud keskastme lüngad: kuidas luua ja avaldada oma mall, reprodutseeritavad dev-konteinerite/CodeSpaces keskkonnad, Pulumi infrastruktuuri pakkuja, Azure DevOps CI/CD ülevaade, teenusekonto autentimine, hosti valiku juhendid (AKS/Spring Apps), `azd restore`/`azd package` selgitused, hook'i veahaldus ja meeskonna/jagatud keskkonna praktikaid.**

#### Lisatud
- **🧱 Uus peatükk 4 õppetund** `docs/chapter-04-infrastructure/custom-templates.md` — oma azd malli loomine: vajalik struktuur (`azure.yaml`, `infra/`, `src/`), `metadata.template` väli, infrastruktuuri parametriteks unikaalse stringi kasutamine `uniqueString()` ressurssitokeni ja `azd-env-name` sildiga, kohalik testimine `azd init --template <local-path>`, avaldamine GitHubis ja esitus Awesome AZD galeriis
- **📦 Uus peatükk 1 õppetund** `docs/chapter-01-foundation/dev-containers.md` — reprodutseeritavad azd keskkonnad Dev Containerite ja GitHub Codespacesiga: minimaalne `.devcontainer/devcontainer.json` ametliku `ghcr.io/azure/azure-dev/azd` funktsiooniga, keelepõhised funktsioonid, `docker-in-docker` konteineri hostimiseks ja `azd auth login --use-device-code` kaugallkirjastuseks
- **🧩 Pulumi koos azd-ga** lõik `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi kaustastruktuur, virnad kaardistatud azd keskkondadele, nõutavad väljundid/sildistamine ning sama `azd up` / `azd down` töövoog
- **🎯 Hosti valiku juhendamine** `docs/chapter-04-infrastructure/provisioning.md` — algajasõbralik võrdlus `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, ja `springapp` vahel ning juhised, millal valida AKS või Azure Spring Apps
- **🛠️ Azure DevOps CI/CD ülevaade** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, teenuseühendus töökoormuse identiteedi föderatsiooniga (OIDC), genereeritud `azure-dev.yml` ja muutuja grupi seadistamine
- **🔑 Teenusekontod (muster 4)** lisatud `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, mitteinteraktiivne `azd auth login` kliendisalaga vs föderaal/OIDC volitustega, kasutusjuhised ning turvaline volituste säilitamine
- **🪝 Hook'i veahaldus** alajaotus `docs/chapter-04-infrastructure/deployment-guide.md` — väljumiskoodid ja `set -e`, `continueOnError`, hook'ide testimine isoleeritult `azd hooks run` abil, opsüsteemispetsiifilised shellid ja `--debug`
- **👥 Meeskonna / jagatud keskkonnad** lõik `docs/chapter-03-configuration/configuration.md` — mis elab `.azure/` kaustas, mida ignoreerida gitis, arendajapõhised keskkonnad, `azd env list`/`select` ja keskkonnaväärtuste edastamine CI/CD-s
- **🧰 `azd restore` ja laiendatud `azd package`** selgitused `resources/cheat-sheet.md` — sõltuvuste taastamine ja juurutamiseks sobiva artefakti loomine ilma juurutamiseta

#### Muudetud
- **🧭 Peatüki 4 õppetundide tabel** ajakohastatud, et lisada uus "Oma malli loomine" õppetund (õppetund 3)
- **🧭 Peatüki 1 õppetundide tabel** ajakohastatud, et lisada uus "Dev Containers & Codespaces" õppetund (õppetund 5); navigeerimist jalused ühendatud `bring-your-own-app.md` ja `dev-containers.md` vahel

### [v3.21.0] - 2026-06-16

#### Algajate lünkade täide: praktiline mitme agendi õppetund, "Too oma rakendus", Terraform ja CI/CD ülevaade
**See versioon sulgeb täieliku algajate juhendi suurimad lüngad, lisades kaks uut praktilist õppetundi (deploy'datav mitme agendi läbikäik ja azd lisamine olemasolevale rakendusele), algajasõbraliku hookide tutvustuse, Terraformi-azd sektsiooni, samm-sammulise GitHub Actions pipeline'i ülevaate, uute eelvaate laienduste tutvustuse ja selge juurutuse kinnitamise kontrollnimekirja.**

#### Lisatud
- **🤝 Uus peatükk 5 õppetund** `docs/chapter-05-multi-agent/multi-agent-basics.md` — täielikult praktiline, deploy’datav kahe agendi läbikäik (koordinaator + spetsialistid) kasutades tõelist malli (`contoso-creative-writer`), hõlmates mitme agendi kasutamise ajastust, `azd up` töövoogu, juurutatud ressursside mõistmist, agendide vahelist jälitamist, kohandamist ja koristamist
- **📦 Uus peatükk 1 õppetund** `docs/chapter-01-foundation/bring-your-own-app.md` — kuidas lisada azd olemasolevale projektile `azd init` abil („kasuta koodi käesolevas kataloogis“), `azure.yaml` ja `infra/` mõistmine, `azd infra generate`, hosti tuvastamine ja juurutamine `azd up`-ga
- **🌐 Terraform koos azd-ga** lõik lisatud `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguratsioon, `.tf` kaustade struktuur, nõutavad `AZURE_*` väljundid ja `azd-env-name` sildistamine ning sama `azd up` / `azd down` töövoog (sulgudes lünga, kus Terraformi tugi lubati, aga näidati vaid Bicepit)
- **⚙️ Samm-sammuline GitHub Actions juhend** `docs/chapter-08-production/production-ai-practices.md` — GitHubi hoidlast automatiseeritud juurutusteni: `azd pipeline config`, OIDC föderaalvolitused (ilma salvestatud saladusteta), genereeritud `azure-dev.yml` ja juhised saladuste ja muutujate kohta
- **🪝 Algajate „Uus hook'ide kasutaja?“ tutvustus** `docs/chapter-04-infrastructure/deployment-guide.md` — mis on hook, hook-etappide tabel, minimaalne esimene hook ja hookide käsitsi käivitamine `azd hooks run` abil
- **✅ „Kontrolli oma juurutust“ kontrollnimekiri** lisatud `docs/chapter-01-foundation/first-project.md` sammule 5 — suitsutest, tervisepunkti kontroll ja selged õnnestumiskriteeriumid
- **🧩 Uute eelvaate laienduste selgitus** `azure.ai.skills` ja `azure.ai.connections` (mis need on ja millal kasutada) lisatud `docs/chapter-08-production/production-ai-practices.md`

#### Muudetud
- **🧭 Peatüki 5 õppetundide tabel** parandatud: `multi-agent-basics.md` on nüüd õppetund 1 (ainus täielikult praktiline õppetund), aus märgendus, et õppetund 2 asub peatükis 6 ja jaemüügistsenaarium on arhitektuuriplaan, mitte ühe käsklusega mall
- **🧭 Peatüki 1 õppetundide tabel** nüüd sisaldab uut „Too oma rakendus“ õppetundi (õppetund 4)
- **🔗 Navigeerimise jalused** ajakohastatud: `first-project.md` lingib edasi `bring-your-own-app.md`-le

#### Parandatud
- **🧱 Suletud „lubatud, kuid puuduv“ Terraformi lünk** — kursus viitas varem Terraformi toele ilma selle näitamiseta
- **🔀 Parandatud eksitavad peatüki 5 ristlingid**, mis vihjasid, et täismahus mitme agendi implementatsioon eksisteerib, kuigi oli vaid arhitektuuriplaan

#### Uuendatud failid
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(uus)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(uus)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 uuendus, täiemahulised agendi elutsükli käsud & Aspire brändimuutus

**See versioon valideerib kursuse uuesti `azd` `1.25.6` (juuni 2026) ja `azure.ai.agents` `0.1.40-preview` laienduse vastu, laiendab tehisintellekti juhiseid "agentide raamimise" seadmest terviklikuks agentide elutsükli katmiseks (test → hindamine → optimeerimine → ülevaatus → kustutamine), toob esile uued `azure.ai.skills` ja `azure.ai.connections` eelvaate laiendused ning märgib ".NET Aspire" → "Aspire" tootenime muutuse.**

#### Lisatud
- **🔁 Täielik agentide elutsükli katvus** algajatele ja tehisintellekti inseneridele kogu dokumentatsioonis:
  - `docs/chapter-01-foundation/azd-basics.md` — Elutsükli tabel (raamistamine → testimine → mõõtmine → täiustamine → ülevaatus → puhastamine) lisatud Laienduste ja tehisintellekti käskude jaotisse
  - `docs/chapter-08-production/production-ai-practices.md` — Uus jaotis "Agendi elutsükli haldamine", mis katab `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
  - `resources/cheat-sheet.md` — Laiendatud AI agentide käskude nimekirja `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force` käsud
- **🧩 Uued eelvaate laiendused** dokumenteeritud: `azure.ai.skills` (taaskasutatavad agendi oskused) ja `azure.ai.connections` (Foundry ühendused) lisatud laienduste tabelisse ja abilehele
- **⏱️ Vastuse aja juhised** — `azd ai agent invoke` näidetes on nüüd märgitud kogukõrvalekalle ja esimese baidi saamise aeg
- **📌 Versioonibänner** juur-README-s, mis suunab õppijaid kasutama `azd version` ja `azd upgrade`

#### Muudetud
- **✅ Valideerimise baasjoon uuendatud** `azd 1.23.12` (märts 2026) pealt `azd 1.25.6`-le (juuni 2026) kõigis peatükkide README-des ja töötoa dokumentides
- **🤖 Peatükk 2 laiendusmärkus** uuendatud `azure.ai.agents` `0.1.18-preview` pealt `0.1.40-preview` peale
- **🧪 Töötoa valideerimisnäide** (`azd version` väljund) uuendatud versioonile `1.25.6`
- **🧭 README jaotis "Mis on azd täna uut"** värskendatud, rõhutades lõppkokkuvõttes agentide elutsüklit, uusi tehisintellekti laiendusi ja hiljutisi kvaliteedi parandusi (`azd init` idempotentsus, `azd auth login` aegunud tokeni puhastus, `azd tool` esmase käivituse viip)
- **📖 Peatükk 2 agents.md (Valik 4)** nüüd juhendab õppijaid post-deploy elutsükli käskude kasutamisele `azd up` asemel

#### Parandatud
- **🏷️ Tootenime muutus** — lisatud Aspire brändingumuudatuse märkus (".NET Aspire" on nüüd lihtsalt "Aspire"); azd tugi Aspirile on muutmata
- **🔎 Reaalajas väljaandmise valideerimine** kontrollitud vastavus Azure Developer CLI väljaandmise voo: stabiilne CLI `1.25.6` (2026-06-12) ja `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Uuendatud failid
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

#### Algajate juhendamine, seadistuse valideerimine & viimased AZD käsud
**See versioon järgneb AZD 1.23 valideerimisskoorile algajatele suunatud dokumentatsiooni läbi vaatamisega: selgitab AZD-esimese autentimise juhiseid, lisab kohaliku seadistuse valideerimise skriptid, kontrollib võtmekäsud elava AZD CLI-ga ning eemaldab viimased aegunud ingliskeelsed käsuviited väljaspool muudatuste logi.**

#### Lisatud
- **🧪 Algajate seadistuse valideerimisskriptid** `validate-setup.ps1` ja `validate-setup.sh` abil, et õppijad saaksid enne 1. peatüki alustamist vajalikud tööriistad üle kontrollida
- **✅ Eesmisel seadistuse valideerimise sammud** juur-README-s ja 1. peatüki README-s, et puuduvad eeldused avastatakse enne `azd up` käivitamist

#### Muudetud
- **🔐 Algajate autentimise juhised** käsitlevad nüüdsest järjekindlalt `azd auth login` kui peamist teed AZD töövoogudes, kusjuures `az login` on mainitud kui valikuline, välja arvatud juhul, kui kasutatakse otseselt Azure CLI käske
- **📚 1. peatüki juhendamisvoog** juhendab õppijaid kontrollima oma kohalikku seadistust enne paigaldust, autentimist ja esimest juurutamist
- **🛠️ Valideerija sõnumid** eristavad selgelt blokeerivaid nõudeid taasvalikulisest Azure CLI hoiatustest ainult AZD algajate konfiguratsioonis
- **📖 Konfiguratsiooni, tõrkeotsingu ja näitedokumentide puhul** on selgelt eristatavad kohustuslik AZD autentimine ja valikuline Azure CLI sisselogimine seal, kus varem esitati mõlemad ilma kontekstita

#### Parandatud
- **📋 Jäänud ingliskeelsed käsuviited** uuendatud vastavusse uusimate AZD käskudega, sh `azd config show` abilehel ja `azd monitor --overview` seal, kus viidati Azure portaali ülevaatele
- **🧭 Algajate väited 1. peatükis** pehmendatud, vältimaks lubadusi veavaba või tagasipöörduva käitumise suhtes kõigi mallide ja Azure ressursside puhul
- **🔎 Elava CLI valideerimine** kinnitab tugiteenuseid käskudele `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ja `azd down --force --purge`

#### Uuendatud failid
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

#### AZD 1.23.12 valideerimine, töötoa keskkonna laiendus ja tehisintellekti mudeli värskendus
**See versioon teeb dokumentatsiooni valideerimise läbivaatusena `azd` `1.23.12` vastu, uuendab aegunud AZD käsunäited, värskendab tehisintellekti mudeli juhiseid uute vaikimisi seadistustega ning laiendab töötoa juhiseid GitHub Codespaces-ist ka arenduskonteinerite ja kohalikule kloonimise toetamiseks.**

#### Lisatud
- **✅ Valideerimise märkmed põhiteemadel ja töötoa dokumentides** väljendavad selgelt testitud AZD baasjoont õppijatele, kes kasutavad uuemaid või vanemaid CLI versioone
- **⏱️ Juurutamise ajapiirangu juhised** pikalt kestvate tehisintellekti rakenduste juurutamiseks `azd deploy --timeout 1800`
- **🔎 Laienduste kontrollimise sammud** koos `azd extension show azure.ai.agents` füsiiliselt AI töövoo dokumentides
- **🌐 Laiem töötoa keskkonna juhendamine** hõlmates GitHub Codespaces, arenduskonteinerite ja kohalike kloonide kasutust MkDocsiga

#### Muudetud
- **📚 Peatükkide sissejuhatavad README-d** märkivad järjekindlalt valideerimist `azd 1.23.12` vastu alates sihtasutusest, konfiguratsioonist, infrastruktuurist, mitme agendi, eelsõidu, tõrkeotsingu ja tootmise osadeni
- **🛠️ AZD käskude viited** uuendatud kehtivatele vormidele kogu dokumentatsioonis:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` või `azd env get-value(s)` olenevalt kontekstist
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` seal, kus on mõeldud Application Insights ülevaadet
- **🧪 Juurutamise eelvaate näited** lihtsustatud tänapäevaste toetatud kasutusjuhtumite nagu `azd provision --preview` ja `azd provision --preview -e production` poole
- **🧭 Töötoa voog** uuendatud nii, et õppijad saavad teha labisid Codespaces-is, arenduskonteineris või kohalikus kloonis, mitte eeldades vaid Codespaces-i kasutust
- **🔐 Autentimise juhised** eelistavad nüüd `azd auth login` AZD töövoogude jaoks, kusjuures `az login` on valikuline, kui kasutatakse otseseid Azure CLI käske

#### Parandatud
- **🪟 Windowsi paigalduskäsud** normaliseeritud tänapäevase `winget` paketi kirjaviisi järgi paigaldusjuhendis
- **🐧 Linuxi paigaldusjuhised** parandatud, et vältida toetamata distro-spetsiifilisi `azd` pakihalduri juhiseid ning suunata asjakohaste väljaandmise varade juurde
- **📦 Tehisintellekti mudelinäited** värskendatud varasematest vaikeseadetest nagu `gpt-35-turbo` ja `text-embedding-ada-002` uute näidete juurde nagu `gpt-4.1-mini`, `gpt-4.1` ja `text-embedding-3-large`
- **📋 Juurutamise ja diagnostika kooditükid** parandatud kasutama tänapäevaseid keskkonna ja oleku käske logides, skriptides ja tõrkeotsingus
- **⚙️ GitHub Actions juhendid** uuendatud versioonilt `Azure/setup-azd@v1.0.0` versioonile `Azure/setup-azd@v2`
- **🤖 MCP/Copiloti nõusoleku juhend** uuendatud `azd mcp consent` pealt `azd copilot consent list` peale

#### Parandatud
- **🧠 Tehisintellekti peatükkide juhised** selgitavad nüüd põhjalikumalt eelvaate tundlikku `azd ai` käitumist, tenantide spetsiifilist sisselogimist, praegust laienduste kasutust ja uuendatud mudelite juurutamise soovitusi
- **🧪 Töötoa juhendid** kasutavad nüüd realistlikumaid versiooninäiteid ja selgemaid keskkonna seadistamise sõnastusi praktilistes laborites
- **📈 Tootmise ja tõrkeotsingu dokumendid** vastavad nüüd paremini tänapäevastele monitooringu, tagasipakkumise mudeli ja kulutaseme näidetele

#### Uuendatud failid
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

#### AZD AI CLI käsud, sisu valideerimine ja mallide laiendamine
**See versioon lisab `azd ai`, `azd extension` ja `azd mcp` käsukatte kõigis tehisintellektiga seotud peatükkides, parandab katkised lingid ja aegunud koodi agents.md failis, uuendab abilehte ning muudab Näidismallide jaotist valideeritud kirjelduste ja uute Azure AI AZD mallidega.**

#### Lisatud
- **🤖 AZD AI CLI katvus** 7 failis (enne ainult 8. peatükis):
  - `docs/chapter-01-foundation/azd-basics.md` — Uus jaotis "Laiendused ja AI käsud", mis tutvustab `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Valik 4: `azd ai agent init` võrdlustabeliga (mall vs manifest lähenemine)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD laiendused Foundry jaoks" ja "Agendi-ees juurutamine" alajaotised

  - `docs/chapter-05-multi-agent/README.md` — Kiire algus näitab nüüd nii malli kui ka manifestipõhiseid juurutamisteid
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Juurutamise jaotis sisaldab nüüd `azd ai agent init` valikut
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI laienduse käsud diagnostikaks" alajaotis
  - `resources/cheat-sheet.md` — Uus "AI & laienduste käsud" jaotis koos `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`
- **📦 Uued AZD AI näidismallid** failis `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG vestlus Blazor WebAssembly, Semantic Kernel ja häälvestluse toe abil
  - **azure-search-openai-demo-java** — Java RAG vestlus Langchain4J-ga, ACA/AKS juurutamisvalikutega
  - **contoso-creative-writer** — Mitmeagendiline loominguline kirjutamisrakendus Azure AI Agent Service, Bing Grounding ja Prompty kaasabil
  - **serverless-chat-langchainjs** — Serverivaba RAG Azure Functions + LangChain.js + Cosmos DB ja Ollama kohaliku arendustoe abil
  - **chat-with-your-data-solution-accelerator** — Ettevõtte RAG kiirendi haldusportaali, Teamsi integratsiooni ning PostgreSQL/Cosmos DB valikutega
  - **azure-ai-travel-agents** — Mitmeagendiline MCP orkestreerimise näidistarkvara serveritega .NET, Python, Java ja TypeScriptis
  - **azd-ai-starter** — Minimaalne Azure AI infrastruktuuri Bicep stardimall
  - **🔗 Awesome AZD AI galerii link** — Viide [awesome-azd AI galeriile](https://azure.github.io/awesome-azd/?tags=ai) (80+ malli)

#### Parandatud
- **🔗 agents.md navigeerimine**: Eelmine/Järgmine lingid vastavad nüüd peatüki 2 README õppetundide järjekorrale (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md katkised lingid**: `production-ai-practices.md` parandatud `../chapter-08-production/production-ai-practices.md` (3 esinemist)
- **📦 agents.md aegunud kood**: Asendati `opencensus` `azure-monitor-opentelemetry` + OpenTelemetry SDK-ga
- **🐛 agents.md vigane API**: `max_tokens` viidud `create_agent()` pealt `create_run()`-i kui `max_completion_tokens`
- **🔢 agents.md tokenite lugemine**: Asendati umbkaudne `len//4` hinnang `tiktoken.encoding_for_model()`-ga
- **azure-search-openai-demo**: Teenused parandatud "Cognitive Search + App Service" → "Azure AI Search + Azure Container Apps" (vaikimisi host muudetud oktoober 2024)
- **contoso-chat**: Kirjeldus uuendatud viitamaks Azure AI Foundry + Prompty-le, vastavuses repoloo pealkirja ja tehnoloogiastakiga

#### Eemaldatud
- **ai-document-processing**: Eemaldatud mittetoimiv malli viide (repo ei ole avalikult saadaval AZD mallina)

#### Parendatud
- **📝 agents.md harjutused**: Harjutuses 1 nüüd kuvatakse oodatud väljund ja `azd monitor` samm; Harjutuses 2 sisaldab täielikku `FunctionTool` registreerimiskoodi; Harjutus 3 asendab ebaselged juhised konkreetsete `prepdocs.py` käskudega
- **📚 agents.md ressursid**: Dokumentatsiooni lingid uuendatud vastavalt praegustele Azure AI Agent Service dokumentidele ja kiirele alustamisele
- **📋 agents.md järgmised sammud tabel**: Lisatud AI töötoa laboris link kogu peatüki katvuseks

#### Uuendatud failid
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kursuse navigeerimise täiendus
**See versioon parandab README.md peatükkide navigeerimist täiustatud tabelvorminguga.**

#### Muudetud
- **Kursuse kaardi tabel**: Täiustatud otseste õppetundide linkide, kestuse hinnangute ja keerukuse tasemetega
- **Kaustade korrastus**: Eemaldati mittevajalikud vanad kaustad (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lingikontroll**: Kontrolliti kõiki 21+ sise-linki Kursuse kaardi tabelis

### [v3.16.0] - 2026-02-05

#### Tootenime uuendused
**See versioon uuendab toodete viiteid vastavalt Microsofti praegusele brändingule.**

#### Muudetud
- **Microsoft Foundry → Microsoft Foundry**: Kõik viited uuendatud mitte-tõlke failides
- **Azure AI Agent Service → Foundry Agents**: Teenuse nimi uuendatud vastavalt praegusele brändingule

#### Uuendatud failid
- `README.md` - Peamine kursuse ava
- `changelog.md` - Versioonide ajalugu
- `course-outline.md` - Kursuse struktuur
- `docs/chapter-02-ai-development/agents.md` - AI agentide juhend
- `examples/README.md` - Näidete dokumentatsioon
- `workshop/README.md` - Töötuba ava
- `workshop/docs/index.md` - Töötuba indeks
- `workshop/docs/instructions/*.md` - Kõik töötoa juhendid

---

### [v3.15.0] - 2026-02-05

#### Tõsine repository restruktureerimine: peatükkidepõhised kaustanimed
**See versioon jaotab dokumentatsiooni selgemaks navigeerimiseks pühendatud peatükkide kaustadeks.**

#### Kaustade ümbernimetamine
Vanad kaustad asendatakse peatüki numbriga:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisatud uus: `docs/chapter-05-multi-agent/`

#### Failide üleviimine
| Fail | Algne | Sihtkoht |
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
| Kõik pre-deployment failid | pre-deployment/ | chapter-06-pre-deployment/ |
| Kõik troubleshooting failid | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lisatud
- **📚 Peatükkide README failid**: Igas peatüki kaustas loodud README.md:
  - Õpieesmärgid ja kestus
  - Õppetundide tabel kirjeldustega
  - Kiire alguse käsud
  - Navigeerimine teistele peatükkidele

#### Muudetud
- **🔗 Kõik sisemised lingid uuendatud**: 78+ teekonda muudetud kõigis dokumentatsioonifailides
- **🗺️ Peamine README.md**: Kursuse kaart uuendatud uue peatükkide struktuuriga
- **📝 examples/README.md**: Viited peatükkide kaustadele värskendatud

#### Eemaldatud
- Vana kaustastruktuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository restruktureerimine: peatükkide navigeerimine
**See versioon lisas peatükkide navigeerimise README failid (asendatud versiooniga v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uus AI agentide juhend
**See versioon lisab põhjaliku juhendi AI agentide juurutamiseks Azure arendaja CLI-ga.**

#### Lisatud
- **🤖 docs/microsoft-foundry/agents.md**: Täielik juhend sisaldab:
  - Mis on AI agendid ja kuidas nad erinevad vestlusrobotitest
  - Kolm kiire algusega agentide malli (Foundry Agents, Prompty, RAG)
  - Agendi arhitektuuri mustrid (ühe agendi, RAG, mitme agenid)
  - Tööriistade seadistamine ja kohandamine
  - Jälgimine ja mõõdikute jälgimine
  - Kulude kaalutlused ja optimeerimine
  - Levinud tõrkeotsingu stsenaariumid
  - Kolm praktilist harjutust koos edukriteeriumitega

#### Sisu ülesehitus
- **Sissejuhatus**: Agentide kontseptsioonid algajatele
- **Kiire algus**: Agentide juurutamine käsuga `azd init --template get-started-with-ai-agents`
- **Arhitektuuri mustrid**: Visuaalsed diagrammid agendi mustritest
- **Seadistamine**: Tööriistade seadistamine ja keskkonnamuutujad
- **Jälgimine**: Rakenduse Insightsi integratsioon
- **Harjutused**: Järkjärguline praktiline õppimine (20-45 minutit igaüks)

---

### [v3.12.0] - 2026-02-05

#### DevContaineri keskkonna uuendus
**See versioon uuendab arendusmahuti konfiguratsiooni kaasaegsete tööriistade ja paremate vaikeväärtustega AZD õppimiskogemuse jaoks.**

#### Muudetud
- **🐳 Baaspilt**: Uuendatud `python:3.12-bullseye` pealt `python:3.12-bookworm` peale (viimane stabiilne Debian)
- **📛 Mahuti nimi**: Nimemuutus "Python 3" pealt "AZD algajatele" selguse tagamiseks

#### Lisatud
- **🔧 Uued Dev Containeri funktsioonid**:
  - `azure-cli` koos Bicep toe aktiveerimisega
  - `node:20` (AZD mallide LTS versioon)
  - `github-cli` mallide haldamiseks
  - `docker-in-docker` konteinerirakenduste juurutamiseks

- **🔌 Pordisuunamine**: Eelkonfigureeritud pordid tavaliseks arenduseks:
  - 8000 (MkDocs eelvaade)
  - 3000 (Veebirakendused)
  - 5000 (Python Flask)
  - 8080 (API-d)

- **🧩 Uued VS Code laiendused**:
  - `ms-python.vscode-pylance` - Täiustatud Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions tugi
  - `ms-azuretools.vscode-docker` - Docker tugi
  - `ms-azuretools.vscode-bicep` - Bicep keele tugi
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursihaldus
  - `yzhang.markdown-all-in-one` - Markdowni redigeerimine
  - `DavidAnson.vscode-markdownlint` - Markdown lintimine
  - `bierner.markdown-mermaid` - Mermaid diagrammi tugi
  - `redhat.vscode-yaml` - YAML tugi (azure.yaml jaoks)
  - `eamodio.gitlens` - Git visualiseerimine
  - `mhutchie.git-graph` - Git ajaloo kuvamine

- **⚙️ VS Code seaded**: Lisatud vaikeseaded Python tõlgendi, salvestamisel vormindamise ja tühikute eemaldamiseks

- **📦 Uuendatud requirements-dev.txt**:
  - Lisatud MkDocs minify plugin
  - Lisatud pre-commit koodi kvaliteedi tagamiseks
  - Lisatud Azure SDK paketid (azure-identity, azure-mgmt-resource)

#### Parandatud
- **Post-Create käsk**: Kontrollib nüüd AZD ja Azure CLI installatsiooni mahuti käivitamisel

---

### [v3.11.0] - 2026-02-05

#### Algajatele sõbraliku README uuendus
**See versioon parandab README.md oluliselt, muutes selle algajatele ligipääsetavamaks ja lisades olulised ressursid AI arendajatele.**

#### Lisatud
- **🆚 Azure CLI ja AZD võrdlus**: Selge selgitus, millal kasutada kumbagi tööriista koos praktiliste näidetega
- **🌟 Awesome AZD lingid**: Otselingid kogukonna malligalerii ja panustamisressursside juurde:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ kohe-juurutamiseks valmis malli
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kogukonnapanuste esitamine
- **🎯 Kiire alustamise juhend**: Lihtsustatud 3-sammuline algusosa (Installimine → Sisselogimine → Juurutamine)
- **📊 Kogemuspõhine navigeerimistabel**: Selged juhised, kust alustada arendaja kogemuse põhjal

#### Muudetud
- **README struktuur**: Ümber korraldatud etapiviisiliseks avamiseks - esmalt põhiteave
- **Sissejuhatuse jaotis**: Ümber kirjutatud, selgitamaks "The Magic of `azd up`" täielikele algajatele
- **Topelt sisu eemaldamine**: Kaotatud dubleeritud tõrkeotsingu jaotis
- **Tõrkeotsingu käsud**: Parandatud `azd logs` viide kehtivale `azd monitor --logs` käsule

#### Parandatud

- **🔐 Autentimise käsud**: Lisatud `azd auth login` ja `azd auth logout` faili cheat-sheet.md
- **Kehtetud käskude viited**: Eemaldatud allesjäänud `azd logs` README tõrkeotsingu sektsioonist

#### Märkused
- **Ulatus**: Muudatused rakendatud peamisele README.md-le ja resources/cheat-sheet.md-le
- **Sihtgrupp**: Parandused suunatud spetsiaalselt AZD-ga alustavatele arendajatele

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI käskude täpsuse uuendus
**See versioon parandab dokumentatsioonis esinevad eksisteerimata AZD käsud, tagades, et kõik koodi näited kasutavad kehtivat Azure Developer CLI süntaksit.**

#### Parandatud
- **🔧 Eemaldatud eksisteerimata AZD käsud**: Põhjalik audit ja vigaste käskude parandamine:
  - `azd logs` (ei eksisteeri) → asendatud `azd monitor --logs` või Azure CLI alternatiividega
  - `azd service` alamkäsud (ei eksisteeri) → asendatud `azd show` ja Azure CLI-ga
  - `azd infra import/export/validate` (ei eksisteeri) → eemaldatud või asendatud kehtivate alternatiividega
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` lipud (ei eksisteeri) → eemaldatud
  - `azd provision --what-if/--rollback` lipud (ei eksisteeri) → uuendatud kasutama `--preview`
  - `azd config validate` (ei eksisteeri) → asendatud `azd config list`-iga
  - `azd info`, `azd history`, `azd metrics` (ei eksisteeri) → eemaldatud

- **📚 Failid uuendatud käskude parandustega**:
  - `resources/cheat-sheet.md`: Käskude viite põhjalik uuendus
  - `docs/deployment/deployment-guide.md`: Parandatud rollback ja juurutusstrateegiad
  - `docs/troubleshooting/debugging.md`: Parandatud logi analüüsi sektsioonid
  - `docs/troubleshooting/common-issues.md`: Uuendatud tõrkeotsingu käsud
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud AZD debugimise sektsioon
  - `docs/getting-started/azd-basics.md`: Parandatud monitooringu käsud
  - `docs/getting-started/first-project.md`: Uuendatud monitooringu ja debugimise näited
  - `docs/getting-started/installation.md`: Parandatud abi ja versiooni näited
  - `docs/pre-deployment/application-insights.md`: Parandatud logide vaatamise käsud
  - `docs/pre-deployment/coordination-patterns.md`: Parandatud agendi debugimise käsud

- **📝 Versiooni viited uuendatud**: 
  - `docs/getting-started/installation.md`: Muudetud kõvakodeeritud `1.5.0` versiooniks generiline `1.x.x` koos lingiga väljaannete juurde

#### Muudetud
- **Rollback strateegiad**: Dokumentatsiooni uuendatud kasutamaks Git-põhist rollbacki (AZD-l puudub natiivne rollback)
- **Logide vaatamine**: Asendatud `azd logs` viited `azd monitor --logs`, `azd monitor --live` ja Azure CLI käskudega
- **Jõudlusosa**: Eemaldatud mittekohased paralleel- ja inkrementaalse deploy lipud, pakutud kehtivad alternatiivid

#### Tehnilised üksikasjad
- **Kehtivad AZD käsud**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kehtivad azd monitor lipud**: `--live`, `--logs`, `--overview`
- **Eemaldatud funktsioonid**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Märkused
- **Kinnitamine**: Käskude valideerimine Azure Developer CLI v1.23.x vastu

---

### [v3.9.0] - 2026-02-05

#### Töötuba lõpetatud ja dokumentatsiooni kvaliteedi uuendus
**See versioon lõpetab interaktiivsed töötubade moodulid, parandab kõik katkised dokumentatsiooni lingid ja tõstab üldist sisu kvaliteeti AI arendajatele, kes kasutavad Microsoft AZD-d.**

#### Lisatud
- **📝 CONTRIBUTING.md**: Uus panustamise juhend dokument:
  - Selged juhised probleemide raporteerimiseks ja muudatuste pakkumiseks
  - Dokumentatsiooni standardid uuele sisule
  - Koodi näite juhised ja commit sõnumite konventsioonid
  - Ühiskonna kaasamise info

#### Lõpetatud
- **🎯 Töötuba moodul 7 (kokkuvõte)**: Täielikult lõpetatud kokkuvõtte moodul:
  - Töötuba saavutuste põhjalik kokkuvõte
  - Võtmekontseptsioonid hõlmavad AZD, mallid ja Microsoft Foundry
  - Soovitused õppeteekonna jätkamiseks
  - Töötuba väljakutsete harjutused raskustasemete näitamisega
  - Ühiskonna tagasiside ja tugilingid

- **📚 Töötuba moodul 3 (Lammutamine)**: Uuendatud õpieesmärgid:
  - GitHub Copilot MCP serverite aktiveerimise juhised
  - AZD malli kaustastruktuuri mõistmine
  - Infrastruktuur kui kood (Bicep) korraldusmustrite õppimine
  - Praktilised laborijuhised

- **🔧 Töötuba moodul 6 (lammutamine)**: Lõpetatud:
  - Ressursside puhastamine ja kulude halduse eesmärgid
  - `azd down` kasutamine turvaliseks infrastruktuuri deprovisjonimiseks
  - Pehmelt kustutatud kognitiivsete teenuste taastamise juhised
  - Boonus uurimisküsimused GitHub Copiloti ja Azure portaaliga

#### Parandatud
- **🔗 Katkised lingid fikseeritud**: Lahendatud 15+ katkist sisemist dokumentatsiooni linki:
  - `docs/ai-foundry/ai-model-deployment.md`: Parandatud marsruudid microsoft-foundry-integration.md-le
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud ai-model-deployment.md ja production-ai-practices.md teed
  - `docs/getting-started/first-project.md`: Asendatud eksisteerimatu cicd-integration.md deployment-guide.md-ga
  - `examples/retail-scenario.md`: Parandatud KKK ja veaotsingu juhendi teed
  - `examples/container-app/microservices/README.md`: Parandatud kursuse avalehe ja juurutusjuhendi teed
  - `resources/faq.md` ja `resources/glossary.md`: Uuendatud AI peatüki viited
  - `course-outline.md`: Parandatud juhendaja juhend ja AI töötuba labori viited

- **📅 Töötuba staatuse bänner**: Uuendatud „Väljatöötamisel“ asemel aktiivseks töötuba staatuseks veebruar 2026 kuupäevaga

- **🔗 Töötuba navigeerimine**: Parandatud katkised navigeerimislingid README.md-s, mis osutasid eksisteerimata lab-1-azd-basics kaustale

#### Muudetud
- **Töötuba esitlus**: Eemaldatud „väljatöötamisel“ hoiatus, töötuba on nüüd täielikult valmis ja kasutatav
- **Navigeerimise järjepidevus**: Tagatud, et kõigil töötuba moodulitel on korralik moodulitevaheline navigeerimine
- **Õppeteekonna viited**: Uuendatud peatükkide ristviited õigete microsoft-foundry radadega

#### Kinnitatud
- ✅ Kõik ingliskeelsed markdowni failid sisaldavad kehtivaid sisemisi linke
- ✅ Töötuba moodulid 0-7 on lõpetatud õpieesmärkidega
- ✅ Peatükkide ja moodulitevaheline navigeerimine toimib korrektselt
- ✅ Sisu sobib Microsoft AZD-d kasutavatele AI arendajatele
- ✅ Algajasõbralik keel ja struktuur on säilinud kogu materjalis
- ✅ CONTRIBUTING.md annab selged juhised kogukonna panustajatele

#### Tehniline rakendus
- **Linkide valideerimine**: Automaatne PowerShell skript kontrollis kõiki .md sisemisi linke
- **Sisu audit**: Manuaalne ülevaatus töötuba täituvuse ja algajatele sobivuse osas
- **Navigeerimissüsteem**: Rakendatud järjepidevad peatükkide ja moodulite navigeerimismustrid

#### Märkused
- **Ulatus**: Muudatused rakendatud ainult ingliskeelses dokumentatsioonis
- **Tõlked**: Tõlkekaustad selles versioonis ei uuendatud (automatiseeritud tõlge sünkroniseerib hiljem)
- **Töötuba kestus**: Täielik töötuba pakub 3-4 tundi praktilist õppimist

---

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: monitooring, turvalisus ja multi-agent mustrid
**See versioon lisab põhjalikud A-klassi õppetunnid Application Insights integreerimisest, autentimise mustritest ning multi-agent koordineerimisest tootmisjuurutustes.**

#### Lisatud
- **📊 Application Insights integreerimise õppetund**: `docs/pre-deployment/application-insights.md` failis:
  - AZD-keskne juurutus koos automaatse provisjonimisega
  - Täielikud Bicep mallid Application Insightsi ja Log Analyticsi jaoks
  - Töötavad Python rakendused kohandatud telemeetriaga (üle 1 200 rea)
  - AI/LLM monitooringumustrid (Microsoft Foundry mudelite tokenite/kulude jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetria voog)
  - 3 praktilist harjutust (hoiatused, armatuurlaud, AI monitooring)
  - Kusto päringu näited ja kulude optimeerimise strateegiad
  - Reaalajas mõõdikute voog ja veaparandus reaalajas
  - 40-50 minutit õppematerjali tootmisvalmis mustritega

- **🔐 Autentimise ja turbe mustrite õppetund**: `docs/getting-started/authsecurity.md` failis:
  - 3 autentimise mustrit (ühenduste stringid, Key Vault, hallatud identiteet)
  - Täielikud Bicep infrastruktuuri mallid turvaliste juurutuste jaoks
  - Node.js rakenduse kood Azure SDK integratsiooniga
  - 3 täielikku harjutust (hallatud identiteedi kasutuselevõtt, kasutaja määratud identiteet, Key Vault pöörlemine)
  - Turvalisuse parimad tavad ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kulu analüüs
  - Tootmisvalmis paroolivabad autentimise mustrid

- **🤖 Multi-agent koordineerimise mustrite õppetund**: `docs/pre-deployment/coordination-patterns.md` failis:
  - 5 koordineerimismustrit (järjestikune, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik orkestreerimise teenuse rakendus (Python/Flask, üle 1 500 rea)
  - 3 spetsialiseeritud agendi rakendust (Uurija, Kirjutaja, Toimetaja)
  - Service Bus integreerimine sõnumite järjekorda panekuks
  - Cosmos DB seisundihaldus hajutatud süsteemide jaoks
  - 6 Mermaid diagrammi, mis näitavad agentide omavahelisi suhtlusi
  - 3 keerulist harjutust (aegumine, kordusloogika, vooluahela lüliti)
  - Kulude jaotus (240-565 $/kuus) koos optimeerimisstrateegiatega
  - Application Insights integreerimine monitooringuks

#### Täiustatud
- **Pre-deployment peatükk**: Nüüd sisaldab põhjalikke monitooringu ja koordineerimise mustreid
- **Getting Started peatükk**: Täiustatud professionaalsete autentimise mustritega
- **Tootmisvalmidus**: Täielik katvus turvalisusest jälgitavuseni
- **Kursuse kava**: Uuendatud viited uutele õppetundidele peatükkides 3 ja 6

#### Muudetud
- **Õppimise progression**: Paremini integreeritud turvalisus ja monitooring kogu kursusel
- **Dokumentatsiooni kvaliteet**: Järjepidevad A-klassi standardid (95-97%) uute õppetundide ulatuses
- **Tootmismustrid**: Täielik lõppastme katvus ettevõtte juurutustele

#### Parendatud
- **Arendajakogemus**: Selge tee arendusest tootmisse monitooringuks
- **Turvastandardid**: Professionaalsed mustrid autentimiseks ja saladuste halduseks
- **Jälgitavus**: Täielik Application Insights integreerimine AZD-ga
- **AI töökoormused**: Spetsialiseeritud monitooring Microsoft Foundry mudelitele ja multi-agent süsteemidele

#### Kinnitatud
- ✅ Kõik õppetunnid sisaldavad töökorras koodi (mitte ainult fragmendid)
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19 kolmes õppetunnis)
- ✅ Praktilised harjutused kinnitusetappidega (kokku 9)
- ✅ Tootmisvalmid Bicep mallid, mida saab juurutada `azd up`-ga
- ✅ Kulude analüüs ja optimeerimisstrateegiad
- ✅ Tõrkeotsingu juhendid ja parimad praktikad
- ✅ Teadmiste kontrollpunktid ja valideerimiskäsud

#### Dokumentatsiooni hindamise tulemused
- **docs/pre-deployment/application-insights.md**: - Põhjalik monitooringu juhend
- **docs/getting-started/authsecurity.md**: - Professionaalsed turbemustrid
- **docs/pre-deployment/coordination-patterns.md**: - Edasijõudnud multi-agent arhitektuurid
- **Üldine uus sisu**: - Järjepidevad kõrged kvaliteedistandardid

#### Tehniline rakendus
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine
- **Autentimine**: Hallatud identiteet + Key Vault + RBAC mustrid
- **Multi-agent**: Service Bus + Cosmos DB + Container Apps + orkestreerimine
- **Monitooring**: Reaalajas mõõdikud + Kusto päringud + hoiatused + armatuurlaud
- **Kulu haldus**: Proovivõtu strateegiad, säilituspoliitikad, eelarve kontrollid

### [v3.7.0] - 2025-11-19

#### Dokumentatsiooni kvaliteedi parendused ja uus Microsoft Foundry mudelite näide
**See versioon parandab dokumentatsiooni kvaliteeti kogu repos ja lisab täieliku Microsoft Foundry mudelite juurutamise näite koos gpt-4.1 vestlusliidesega.**

#### Lisatud
- **🤖 Microsoft Foundry mudelite vestlusnäidis**: Täielik gpt-4.1 juurutus koos töökorras rakendusega `examples/azure-openai-chat/`:
  - Täielik Microsoft Foundry mudelite infrastruktuur (gpt-4.1 mudeli juurutus)
  - Python käsklusliiniga vestlusliides koos vestluse ajaloo salvestusega
  - Key Vault integreerimine API võtme turvaliseks hoidmiseks
  - Tokenite kasutuse jälgimine ja kulude hinnang
  - Kiiruspiirangud ja veahaldus
  - Põhjalik README koos 35-45-minutilise juurutusjuhendiga
  - 11 tootmisvalmis faili (Bicep mallid, Python rakendus, konfiguratsioon)
- **📚 Dokumentatsiooniharjutused**: Lisatud praktilised harjutused konfiguratsioonijuhendisse:
  - Harjutus 1: Mitmekeskkonna konfiguratsioon (15 minutit)
  - Harjutus 2: Saladuste haldamise harjutus (10 minutit)
  - Selged edut kriteeriumid ja valideerimisetapid
- **✅ Juurutuse kinnitamine**: Lisatud kinnituse sektsioon juurutusjuhendisse:
  - Tervisekontrolli protseduurid
  - Edu kriteeriumite kontrollnimekiri
  - Kõigi juurutuskäskude oodatavad väljundid
  - Tõrkeotsingu kiire viide

#### Täiustatud
- **examples/README.md**: Uuendatud A-klassi kvaliteedile (93%):
  - Lisatud azure-openai-chat kõigisse asjakohastesse sektsioonidesse
  - Kohaliku näidete arvu suurendatud 3-lt 4-le
  - Lisatud tehisintellekti rakenduste näidete tabelisse
  - Integreeritud Kiire alguse juhendi kesktasemel kasutajatele
  - Lisatud Microsoft Foundry mallide sektsiooni
  - Uuendatud Võrdlusmaatriksi ja tehnoloogiade leidmise sektsiooni
- **Dokumentatsiooni kvaliteet**: Parandatud B+ (87%) → A- (92%) kogu docs kaustas:

  - Lisatud oodatud väljundid kriitiliste käsu näidete juurde
  - Lisatud kontroll sammud konfiguratsiooni muudatuste jaoks
  - Täiendatud praktiliste harjutustega käsitsi õppimist

#### Muudetud
- **Õppejärjestus**: Parem AI näidete integreerimine kesktaseme õppijatele
- **Dokumentatsiooni struktuur**: Rohkem tegutsemisvalmis harjutusi kindlate tulemustega
- **Kontrolliprotsess**: Selged edutõendid lisatud olulistele töövoogudele

#### Parendatud
- **Arendajakogemus**: Microsoft Foundry mudelite juurutamine võtab nüüd 35-45 minutit (varem 60-90 min keeruliste alternatiivide puhul)
- **Kulukus läbipaistvus**: Selged kulude hinnangud (50-200 USD/kuus) Microsoft Foundry mudelite näite jaoks
- **Õpperada**: AI arendajatele on selge sisenemispunkt azure-openai-chat abil
- **Dokumentatsiooni standardid**: Ühtsed oodatud väljundid ja kontroll sammud

#### Kinnitatud
- ✅ Microsoft Foundry mudelite näide töötab täielikult käsuga `azd up`
- ✅ Kõik 11 rakendusfaili on süntaktiliselt korrektsed
- ✅ README juhised vastavad tegelikule juurutuskogemusele
- ✅ Dokumentatsiooni lingid uuendatud üle 8 asukoha
- ✅ Näidete indeksis on õigesti kajastatud 4 kohalikku näidet
- ✅ Puuduvad duplikaatvälised lingid tabelites
- ✅ Kõik navigeerimisviited on õiged

#### Tehniline rakendus
- **Microsoft Foundry mudelite arhitektuur**: gpt-4.1 + Key Vault + Container Apps muster
- **Turvalisus**: Hallatud identiteet valmis, salajased andmed Key Vault’is
- **Jälgimine**: Application Insights integratsioon
- **Kulujuhtimine**: Tokeni jälgimine ja kasutuse optimeerimine
- **Juurutamine**: Üksainus `azd up` käsk kogu seadistuse jaoks

### [v3.6.0] - 2025-11-19

#### Suur uuendus: Container App juurutamisnäited
**See versioon tutvustab põhjalikke, tootmiseks valmis konteinerirakenduste juurutamise näiteid kasutades Azure Developer CLI (AZD), koos täieliku dokumentatsiooni ja integratsiooniga õpperajale.**

#### Lisatud
- **🚀 Container App näited**: Uued kohalikud näited kataloogis `examples/container-app/`:
  - [Põhijuhend](examples/container-app/README.md): Täielik ülevaade konteineriseeritud juurutustest, kiire algus, tootmine ja arenenud mustrid
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): Algajale sobiv REST API koos scale-to-zero, tervisekontrollide, jälgimise ja tõrkeotsinguga
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): Tootmiseks valmis mitme teenuse juurutus (API Gateway, Produkt, Tellimus, Kasutaja, Teavitused), asünkroonne sõnumivahetus, Service Bus, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline/kanarii juurutamine
- **Parimad tavad**: Turvalisus, jälgimine, kuluoptimeerimine ja CI/CD juhendid konteinerikoormustele
- **Koodinäited**: Täielik `azure.yaml`, Bicep mallid ja mitmekeelsed teenuste rakendused (Python, Node.js, C#, Go)
- **Testimine & Tõrkeotsing**: Lõpust-lõpuni teststsenaariumid, jälgimis käsud, tõrkeotsingu juhised

#### Muudetud
- **README.md**: Uuendatud, et lisada ja linkida uued konteinerirakenduste näited jaotises "Kohalikud näited - konteinerirakendused"
- **examples/README.md**: Uuendatud, et rõhutada konteinerirakenduste näiteid, lisada võrdlustabeli kirjeid ja uuendada tehnoloogia/arhitektuuri viiteid
- **Kursuse ülevaade ja õppematerjal**: Uuendatud, et viidata uutele konteinerirakenduste näidetele ja juurutusmustritele vastavates peatükkides

#### Kinnitatud
- ✅ Kõik uued näited on juurutatavad käsuga `azd up` ja järgivad parimaid tavasid
- ✅ Dokumentatsiooni ristviited ja navigeerimine uuendatud
- ✅ Näited hõlmavad algaja kuni arenenud stsenaariume, sh tootmise mikroteenused

#### Märkused
- **Ulatus**: Ainult ingliskeelne dokumentatsioon ja näited
- **Järgmised sammud**: Lisa arenenud konteinerimustri ja CI/CD automaatika lisamine tulevastes versioonides

### [v3.5.0] - 2025-11-19

#### Toote ümbernimetamine: Microsoft Foundry
**See versioon viib läbi põhjaliku tootenime muutuse „Microsoft Foundry“ vastu kogu ingliskeelses dokumentatsioonis, kajastades Microsofti ametlikku ümberbrändimist.**

#### Muudetud
- **🔄 Toote nime uuendus**: Täielik ümbernimetamine „Microsoft Foundry“ vastu
  - Uuendatud kõik viited ingliskeelses dokumentatsioonis kaustas `docs/`
  - Kausta ümbernimetamine: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili ümbernimetamine: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kokku: 23 sisuviite uuendatud 7 dokumentatsiooni failis

- **📁 Kaustastruktuuri muudatused**:
  - `docs/ai-foundry/` ümber nimetatud `docs/microsoft-foundry/`
  - Kõik ristviited uuendatud uue kaustastruktuuri järgi
  - Navigeerimislingid kontrollitud kõikides dokumentides

- **📄 Failide ümbernimetamised**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kõik sisemised lingid uuendatud uut faili nime kasutama

#### Uuendatud failid
- **Peatükkide dokumentatsioon** (7 faili):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tootenime viite uuendust
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Juba kasutab Microsoft Foundryt (eelnevatest uuendustest)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viite uuendust (ülevaade, kogukonna tagasiside, dokumentatsioon)
  - `docs/getting-started/azd-basics.md` - 4 ristviite linki uuendatud
  - `docs/getting-started/first-project.md` - 2 peatüki navigeerimislingi uuendust
  - `docs/getting-started/installation.md` - 2 järgmise peatüki lingi uuendust
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viite uuendust (navigeerimine, Discord kogukond)
  - `docs/troubleshooting/common-issues.md` - 1 navigeerimislingi uuendus
  - `docs/troubleshooting/debugging.md` - 1 navigeerimislingi uuendus

- **Kursuse struktuurifailid** (2 faili):
  - `README.md` - 17 viite uuendust (kursuse ülevaade, peatükkide pealkirjad, mallide jaotis, kogukonna teadmised)
  - `course-outline.md` - 14 viite uuendust (ülevaade, õpieesmärgid, peatükkide ressursid)

#### Kinnitatud
- ✅ Null allesolevaid "ai-foundry" kausta viiteid ingliskeelsetes dokumentides
- ✅ Null allesolevaid "Microsoft Foundry" tootenime viiteid ingliskeelsetes dokumentides
- ✅ Kõik navigeerimislingid töötavad uue kaustastruktuuriga korrektselt
- ✅ Faili- ja kaustanime muutmised edukalt lõpetatud
- ✅ Peatükkide vahelised ristviited on kontrollitud

#### Märkused
- **Ulatus**: Muudatused rakendatud ainult ingliskeelses dokumentatsioonis kaustas `docs/`
- **Tõlked**: Tõlkekaustad (`translations/`) ei ole selles versioonis uuendatud
- **Töötoad**: Töötoa materjalid (`workshop/`) ei ole selles versioonis uuendatud
- **Näited**: Näitfailid võivad endiselt sisaldada pärandnimesid (lahendatakse tulevastes uuendustes)
- **Välised lingid**: Välised URL’id ja GitHub hoidla viited jäävad muutmata

#### Ümberpaigutuse juhend panustajatele
Kui teil on kohalikke harusid või dokumenteerimisviiteid vana struktuuri kohta:
1. Uuendage kaustaviiteid: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uuendage faili viiteid: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Asendage tootenimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Kontrollige, et kõik sisemised dokumentide lingid töötaksid õigesti

---

### [v3.4.0] - 2025-10-24

#### Infrastruktuuri eelvaate ja valideerimise täiustused
**See versioon tutvustab põhjalikku tuge uuele Azure Developer CLI eelvaate funktsioonile ning parandab töötoa kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Põhjalik ülevaade uuest infrastruktuuri eelvaate võimalusest
  - Käsurea viited ja kasutusnäited petulehel
  - Detailne integreerimine provisioneerimisjuhises, kasutusjuhtumite ja eelistega
  - Eltuure kontrolli integratsioon ohutumaks juurutuse valideerimiseks
  - Käivitamisjuhendi uuendused ohutuse prioriteediga
- **🚧 Töötoa staatuse bänner**: Professionaalne HTML bänner, mis näitab töötoa arenduse staatust
  - Gradientkujundus ehitusnäitajatega selgeks kasutajaliikumiseks
  - Viimane uuenduse kuupäev läbipaistvuse tagamiseks
  - Mobiilisõbralik kujundus kõigile seadmetele

#### Täiendatud
- **Infrastruktuuri ohutus**: Eelvaate funktsionaalsus integreeritud kogu juurutuse dokumentatsiooni
- **Enne-juurutamist kontrollimine**: Automaatiskriptid nüüd sisaldavad infrastruktuuri eelvaatamise testimist
- **Arendajatöövoog**: Käsu seeriad uuendatud nii, et eelvaade on parim tava
- **Töötoa kogemus**: Kasutajatele on selgelt esitatud sisu arendusstaatus

#### Muudetud
- **Juurutamise parimad tavad**: Eelvaate-esimene töövoog soovitatud lähenemine
- **Dokumentatsiooni voog**: Infrastruktuuri valideerimine viidud õppimise protsessis varasemaks
- **Töötoa esitlus**: Professionaalne staatusteavitamine selge arendustähtajaga

#### Parendatud
- **Ohutus keskne lähenemine**: Infrastruktuuri muudatusi saab nüüd enne juurutust valideerida
- **Meeskonnatöö**: Eelvaate tulemusi saab jagada ülevaatamiseks ja kinnitamiseks
- **Kulutajastlikkus**: Parem arusaam ressursside kuludest enne provisioneerimist
- **Riskide vähendamine**: Vähendatud juurutusvigade protsent täiendvalideerimise kaudu

#### Tehniline rakendus
- **Mitmed dokumendid integratsioon**: Eelvaate funktsioon dokumenteeritud 4 põhifailis
- **Käsu mustrid**: Ühtne süntaks ja näited kogu dokumentatsioonis
- **Parima tava integreerimine**: Eelvaade lisatud valideerimis töövoogudesse ja skriptidesse
- **Visuaalsed märgendid**: Selged UUE funktsiooni märgistused hõlbustamiseks

#### Töötoa infrastruktuur
- **Staatuse teavitus**: Professionaalne HTML bänner gradientstiiliga
- **Kasutajakogemus**: Selge arenduse staatus, mis väldib segadust
- **Professionaalne esitlus**: Säilitab hoidla usaldusväärsuse ja seab ootused
- **Ajakava läbipaistvus**: Viimane uuendus oktoobris 2025 vastutuse tagamiseks

### [v3.3.0] - 2025-09-24

#### Täiendatud töötoa materjalid ja interaktiivne õpikogemus
**See versioon tutvustab põhjalikke töötoa materjale, brauseripõhiseid interaktiivseid juhendeid ja struktureeritud õpperadu.**

#### Lisatud
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötoa kogemus koos MkDocs eelvaate võimalusega
- **📝 Struktureeritud töötoa juhised**: 7-astmeline juhitud õpperada avastamisest kohandamiseni
  - 0-Intro: Töötoa ülevaade ja seadistus
  - 1-Vali-AI-Mall: Malle avastamine ja valik
  - 2-Kinnita-AI-Mall: Juurutus ja valideerimisprotseduurid
  - 3-Lammutamine-AI-Mall: Malle arhitektuuri mõistmine
  - 4-Konfigureeri-AI-Mall: Konfiguratsioon ja kohandamine
  - 5-Kohanda-AI-Mall: Arendatud muudatused ja iteratsioonid
  - 6-Purusta-Infrastruktuur: Puhastamine ja ressursside haldamine
  - 7-Kokkuvõte: Kokkuvõte ja järgnevad sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfigureerimine Materjal teema kasutamiseks parema õpikogemuse jaoks
- **🎯 Praktiseeriv õpperada**: 3-astmeline metoodika (Ava → Juuruta → Kohanda)
- **📱 GitHub Codespaces integratsioon**: Sujuv arenduskeskkonna seadistus

#### Täiendatud
- **AI töötoa labor**: Laiendatud põhjaliku 2-3 tunni struktureeritud õpikogemusega
- **Töötoa dokumentatsioon**: Professionaalne esitlus navigeerimise ja visuaalsete abivahenditega
- **Õppe järjekord**: Selge samm-sammult juhend mallivalikust kuni tootliku juurutamiseni
- **Arendajakogemus**: Integreeritud tööriistad sujuvate arendustöövoogude jaoks

#### Parandatud
- **Juurdepääsetavus**: Brauseripõhine liides koos otsingu, kopeerimise ja teema vahetusega
- **Isekursuse õppimine**: Paindlik töötoa struktuur erinevate õppemäärade jaoks
- **Praktiline rakendus**: Reaalsed AI malli juurutamise stsenaariumid
- **Kogukonna integratsioon**: Discord tugi töötoa toe ja koostöö jaoks

#### Töötoa funktsioonid
- **Sisseehitatud otsing**: Kiire märksõnade ja õppetükkide leidmine
- **Koodi plokkide kopeerimine**: Hiirüleliikumisega kopeerimine kõigi koodinäidete puhul
- **Teema vahetus**: Tume/heledam režiim erinevate eelistuste jaoks
- **Visuaalsed abivahendid**: Ekraanipildid ja diagrammid parema arusaamise jaoks
- **Abi integratsioon**: Otse juurdepääs Discordi kogukonna toetusele

### [v3.2.0] - 2025-09-17

#### Suur navigeerimise ümberkorraldus ja peatükipõhine õppesüsteem
**See versioon tutvustab põhjalikku peatükipõhist õpistruktuuri koos täiustatud navigeerimisega kogu hoidlas.**

#### Lisatud
- **📚 Peatükipõhine õppesüsteem**: Kogu kursus ümber struktureeritud 8 järjestatud õppepeatükiks
  - Peatükk 1: Alused ja kiire algus (⭐ - 30-45 minutit)
  - Peatükk 2: AI-eelne arendus (⭐⭐ - 1-2 tundi)
  - Peatükk 3: Konfiguratsioon ja autentimine (⭐⭐ - 45-60 minutit)
  - Peatükk 4: Infrastruktuur koodina ja juurutamine (⭐⭐⭐ - 1-1.5 tundi)
  - Peatükk 5: Mitmeagendi AI lahendused (⭐⭐⭐⭐ - 2-3 tundi)
  - Peatükk 6: Enne-juurutamist valideerimine ja planeerimine (⭐⭐ - 1 tund)
  - Peatükk 7: Tõrkeotsing ja silumine (⭐⭐ - 1-1.5 tundi)
  - Peatükk 8: Tootmistaseme ja ettevõtte mustrid (⭐⭐⭐⭐ - 2-3 tundi)
- **📚 Põhjalik navigeerimissüsteem**: Järjepidevad navigeerimis päised ja jalused kõigis dokumentides
- **🎯 Edusammude jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppe valideerimise süsteem
- **🗺️ Õpperaja juhised**: Selged sisenemispunktid erineva kogemustaseme ja eesmärkide jaoks
- **🔗 Ristviidete navigeerimine**: Selgelt ühendatud seotud peatükid ja eeltingimused

#### Täiendatud
- **README struktuur**: Muudetud struktureeritud õppeplatvormiks peatükipõhise korraldusega
- **Dokumentatsiooni navigeerimine**: Iga leht sisaldab nüüd peatüki konteksti ja edenemisjuhiseid
- **Mallide korraldus**: Näited ja mallid on seotud vastavate õppepeatükkidega

- **Ressursside integreerimine**: Petulehed, korduma kippuvad küsimused ja õpiabid, mis on seotud asjakohaste peatükkidega
- **Töötoa integreerimine**: Praktilised laborid, mis on seotud mitme peatüki õpieesmärkidega

#### Muudatused
- **Õppimise edenemine**: Liikus lineaarse dokumentatsiooni juurest paindlikule peatükkidele põhinevale õppele
- **Konfiguratsiooni paigutus**: Konfiguratsiooni juhis ümber positsioneeritud peatükiks 3 parema õpivoo jaoks
- **Tehisintellekti sisu integreerimine**: Parema integreerimise tehisintellekti-spetsiifilise sisu kogu õpiteekonna vältel
- **Tootmiskasutuse sisu**: Täiustatud mustrid koondatud peatükki 8 ettevõtte õppijatele

#### Parandused
- **Kasutajakogemus**: Selged navigeerimisjäljed ja peatükkide edenemise indikaatorid
- **Juurdepääsetavus**: Järjepidevad navigeerimise mustrid kursuse lihtsamaks läbimiseks
- **Professionaalne esitlus**: Ülikoolilaadne kursuse struktuur sobib akadeemiliseks ja ettevõtte koolituseks
- **Õppimise efektiivsus**: Paranenud organiseerimise kaudu relevantse sisu leidmise aeg vähenenud

#### Tehniline rakendus
- **Navigeerimispealkirjad**: Standardiseeritud peatükkide navigeerimine üle 40 dokumentatsioonifaili
- **Alapealkirja navigeerimine**: Järjepidev edasijõudmise juhendamine ja peatükkide lõpetamise indikaatorid
- **Ristviited**: Kõikehõlmav sisemine linkide süsteem seotud mõistete ühendamiseks
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õpieesmärkidega

#### Õpiabi täiustamine
- **📚 Kõikehõlmavad õpieesmärgid**: Õpiabi ümberkorraldus 8-peatükkilisele süsteemile vastavaks
- **🎯 Peatükkidel põhinev hindamine**: Igas peatükis on spetsiifilised õpieesmärgid ja praktilised harjutused
- **📋 Edenemise jälgimine**: Nädalane õppekava mõõdetavate tulemite ja lõpetamise kontrollnimekirjadega
- **❓ Hindamisküsimused**: Iga peatüki teadmiste valideerimise küsimused professionaalsete tulemite jaoks
- **🛠️ Praktilised harjutused**: Käed-külge tegevused päriseluliste juurutamise stsenaariumite ja tõrkeotsinguga
- **📊 Oskuste areng**: Selge edasiminek algtõdedest ettevõtte mustriteni karjääri arengule keskendudes
- **🎓 Sertifitseerimise raamistik**: Professionaalse arengu tulemused ja kogukonna tunnustussüsteem
- **⏱️ Ajakava juhtimine**: Struktureeritud 10-nädalane õppeplaan verstapostide valideerimisega

### [v3.1.0] - 2025-09-17

#### Täiustatud mitmeagendi tehisintellekti lahendused
**Selles versioonis on parendatud jaemüügi mitmeagendi lahendust paremate agendi nimede ja täiustatud dokumentatsiooniga.**

#### Muudatused
- **Mitmeagendi terminoloogia**: "Cora agent" asendatud kogu jaemüügi mitmeagendi lahenduses "Kliendi agendiga" selgema arusaama tagamiseks
- **Agendi arhitektuur**: Uuendatud kogu dokumentatsioon, ARM mallid ja koodinäited järjepideva "Kliendi agendi" nimetuse kasutamiseks
- **Konfiguratsiooni näited**: Kaasaegsed agendi konfiguratsiooni mustrid uuendatud nimetamiskonventsioonidega
- **Dokumentatsiooni järjepidevus**: Tagatud, et kõigis viidetes kasutatakse professionaalseid, kirjeldavaid agendi nimesid

#### Täiustused
- **ARM malli pakett**: Uuendatud retail-multiagent-arm-template koos Kliendi agendi viidetega
- **Arhitektuuri skeemid**: Värskendatud Mermaid diagrammid uuendatud agendi nimetustega
- **Koodinäited**: Python klassid ja rakendusnäited kasutavad nüüd CustomerAgent nimetust
- **Keskkonnamuutujad**: Uuendatud kõik juurutusskriptid CUSTOMER_AGENT_NAME konventsioonide kasutamiseks

#### Parandused
- **Arendajakogemus**: Kõrgem selgus agendi rollides ja vastutustes dokumentatsioonis
- **Tootmiskõlblikkus**: Parema kooskõla ettevõtte nimetamiskonventsioonidega
- **Õppematerjalid**: Intuitiivsem agendi nimetamine hariduslikel eesmärkidel
- **Mallide kasutusmugavus**: Lihtsustatud arusaam agendi funktsioonidest ja juurutamismustritest

#### Tehnilised üksikasjad
- Värskendatud Mermaid arhitektuuri diagrammid koos CustomerAgent viidetega
- Asendatud Python näidetes CoraAgent klassinimed CustomerAgent nimedega
- Muudetud ARM malli JSON konfiguratsioonid kasutama "customer" agendi tüüpi
- Uuendatud keskkonnamuutujad CORA_AGENT_* mustrilt CUSTOMER_AGENT_* mustrile
- Värskendatud kõik juurutamiskäsud ja konteinerite konfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Suured muudatused - AI arendajate fookus ja Microsoft Foundry integratsioon
**See versioon muudab hoidla kõikehõlmavaks tehisintellektile keskenduvaks õpiressursiks Microsoft Foundry integratsiooniga.**

#### Lisatud
- **🤖 AI-esmane õppekäik**: Täielik ümberkorraldus AI arendajate ja inseneride prioriteediks seades
- **Microsoft Foundry integratsiooni juhis**: Kõikehõlmav dokumentatsioon AZD ühendamiseks Microsoft Foundry teenustega
- **AI mudelite juurutamise mustrid**: Detailne juhend mudeli valikuks, konfiguratsiooniks ja tootmisele suunamiseks
- **AI töötoa labor**: 2-3-tunnine praktiline töötuba AI rakenduste muutmiseks AZD-le juurutatavaks lahenduseks
- **Tootmise AI parimad tavad**: Ettevõttevalmiduse mustrid AI töökoormuste skaleerimiseks, jälgimiseks ja turvamiseks
- **AI-spetsiifiline tõrkeotsingu juhend**: Microsoft Foundry mudelite, kognitiivsete teenuste ja AI juurutamisprobleemide põhjalik tõrkeotsing
- **AI malligalerii**: Esiletõstetud Microsoft Foundry mallide kogu keerukuse hinnangutega
- **Töötoa materjalid**: Täielik töötoa struktuur praktiliste laborite ja viitematerjalidega

#### Täiustused
- **README struktuur**: AI arendajatele suunatud koos 45% kogukonna huvi andmetega Microsoft Foundry Discordist
- **Õppejõud**: Pühendatud AI arendajate teekond koos traditsiooniliste teekondadega tudengitele ja DevOps inseneridele
- **Mallisoovitused**: Esiletõstetud AI mallid, sealhulgas azure-search-openai-demo, contoso-chat ning openai-chat-app-quickstart
- **Kogukonna integratsioon**: Täiustatud Discord kogukonna tugi AI-spetsiifiliste kanalite ja aruteludega

#### Turvalisus ja tootmiskohasus
- **Halduse identiteedi mustrid**: AI-spetsiifilised autentimis- ja turvakonfiguratsioonid
- **Kulude optimeerimine**: Tokeni kasutuse jälgimine ja eelarvekontrollid AI töökoormustele
- **Mitmeregiooniline juurutamine**: Globaalsete AI rakenduste juurutamiseks strateegiad
- **Jõudluse jälgimine**: AI-spetsiifilised metrikad ja Application Insights integratsioon

#### Dokumentatsiooni kvaliteet
- **Lineaarne kursuse struktuur**: Loogiline edenemine algajast täiustatud AI juurutamismustriteni
- **Kinnitatud URL-id**: Kõik välised hoidlate lingid on kontrollitud ja kättesaadavad
- **Täielik viitamine**: Kõik sisemise dokumentatsiooni lingid on valideeritud ja funktsionaalsed
- **Tootmiskõlblik**: Ettevõtte juurutamismustrid koos päriseluliste näidetega

### [v2.0.0] - 2025-09-09

#### Suured muudatused - Hoidla ümberkorraldus ja professionaalsem esitlus
**See versioon tähistab hoidla struktuuri ja sisu esituse olulist ümbertegemist.**

#### Lisatud
- **Struktureeritud õpiraamistik**: Kõik dokumentatsioonilehed sisaldavad nüüd Sissejuhatuse, Õpieesmärkide ja Õppimise tulemite sektsioone
- **Navigeerimissüsteem**: Lisatud eelmine/järgmine õppetunni lingid kogu dokumentatsioonis juhitud õppe edendamiseks
- **Õpiabi**: Kõikehõlmav study-guide.md õpieesmärkide, praktikaülesannete ja hindematerjalidega
- **Professionaalne esitlus**: Eemaldatud kõik emotikonid parema juurdepääsetavuse ja professionaalse välimuse jaoks
- **Täiustatud sisustruktuur**: Paranenud õppematerjalide organiseeritus ja voog

#### Muudatused
- **Dokumentatsiooni formaat**: Standardiseeritud kogu dokumentatsioon õpikeskse struktuuriga
- **Navigeerimise voog**: Rakendatud loogiline edenemine kogu õppematerjalides
- **Sisu esitlus**: Eemaldatud dekoratiivsed elemendid selgema ja professionaalsema vormindamise kasuks
- **Lingistruktuur**: Kõik siselinkid uuendatud uue navigeerimissüsteemi toetamiseks

#### Parandused
- **Juurdepääsetavus**: Eemaldatud emotikonide sõltuvused paremaks ekraanilugeja ühilduvuseks
- **Professionaalne välimus**: Puhas, akadeemiline stiil sobib ettevõtte õppeks
- **Õppimise kogemus**: Struktureeritud lähenemine selgete eesmärkide ja tulemitega igas õppetunnis
- **Sisu organiseeritus**: Parema loogilise voolu ja seotud teemade ühendamine

### [v1.0.0] - 2025-09-09

#### Algne väljaanne - Kõikehõlmav AZD õppimise hoidla

#### Lisatud
- **Põhidokumentatsiooni struktuur**
  - Täielik alustamise juhiste seeria
  - Kõikehõlmav juurutamise ja provisioningudokumentatsioon
  - Detailne tõrkeotsinguressursside ja silumisjuhised
  - Eeljuurutamise valideerimise tööriistad ja protseduurid

- **Alustamise moodul**
  - AZD põhitõed: põhikontseptsioonid ja terminoloogia
  - Paigaldusjuhis: platvormipõhised seadistusjuhised
  - Konfiguratsiooni juhis: keskkonna seadistamine ja autentimine
  - Esimese projekti juhend: samm-sammult praktiline õppimine

- **Juurutamise ja provisioning moodsul**
  - Juurutamise juhis: täielik töövoo dokumentatsioon
  - Provisioning juhis: infrastruktuur koodina Bicep abil
  - Parimad tavad tootmise juurutamiseks
  - Mitme teenuse arhitektuuri mustrid

- **Eeljuurutamise valideerimise moodul**
  - Mahuplaanimine: Azure ressursside kättesaadavuse valideerimine
  - SKU valik: kõikehõlmav teenuse tasemete juhend
  - Eelkontrollid: automatiseeritud valideerimisskriptid (PowerShell ja Bash)
  - Kulude hinnangu ja eelarve planeerimise tööriistad

- **Tõrkeotsingu moodul**
  - Levinud probleemid: sagedased probleemid ja lahendused
  - Silumisjuhis: süsteemne tõrkeotsingu metodoloogia
  - Täiustatud diagnostikatehnikad ja tööriistad
  - Jõudluse jälgimine ja optimeerimine

- **Ressursid ja viited**
  - Käsukäigu petuleht: kiire juhend oluliste käskude jaoks
  - Sõnastik: põhjalik terminite ja lühendite seletus
  - KKK: detailne vastuste kogu korduma kippuvatele küsimustele
  - Välised ressursid ja kogukonna ühendused

- **Näited ja mallid**
  - Lihtsa veebirakenduse näide
  - Staatilise veebisaidi juurutamise mall
  - Konteinerirakenduse konfiguratsioon
  - Andmebaasi integreerimise mustrid
  - Mikroteenuste arhitektuuri näited
  - Serverita funktsioonide teostused

#### Omadused
- **Mitme platvormi tugi**: paigaldus- ja konfiguratsioonijuhised Windowsile, macOS-ile ja Linuxile
- **Erinevad oskustasemed**: sisu loodud tudengitele kuni professionaalsete arendajateni
- **Praktiline fookus**: praktilised näited ja päriselulised stsenaariumid
- **Kõikehõlmav kattuvus**: algtõdedest täiustatud ettevõtte mustriteni
- **Turvalisus esikohal**: turvalisuse parimad tavad integreeritud igal sammul
- **Kulude optimeerimine**: juhised kulutõhusa juurutamise ja ressursside haldamise jaoks

#### Dokumentatsiooni kvaliteet
- **Detailne koodinäited**: praktilised, testitud koodinäited
- **Samm-sammult juhised**: selged, teostatavad juhised
- **Kõikehõlmav vigade käsitlemine**: korduvate probleemide tõrkeotsing
- **Parimate tavade integreerimine**: tööstusharu standardid ja soovitused
- **Versioonide ühilduvus**: ajakohane koos viimaste Azure teenuste ja azd funktsioonidega

## Plaanitud tulevased täiustused

### Versioon 3.1.0 (plaanitud)
#### AI platvormi laienemine
- **Mitmemudeline tugi**: integratsioonimustrid Hugging Face, Azure Machine Learning ja kohandatud mudelite jaoks
- **AI agentide raamistikud**: mallid LangChain, Semantic Kernel ja AutoGen juurutusteks
- **Täiustatud RAG mustrid**: vektorandmebaasivalikud Azure AI Searchi kõrval (Pinecone, Weaviate jne)
- **AI jälgitavus**: täiustatud jälgimine mudeli jõudluse, tokeni kasutuse ja vastuste kvaliteedi kohta

#### Arendajakogemus
- **VS Code laiendus**: integreeritud AZD + Microsoft Foundry arenduskogemus
- **GitHub Copilot integratsioon**: AI abil abistatud AZD mallide genereerimine
- **Interaktiivsed õpetused**: praktilised kodeerimisharjutused ja AI stsenaariumide automatiseeritud valideerimine
- **Video sisu**: täiendavad videoõpetused visuaalsetele õppijatele, keskendudes AI juurutustele

### Versioon 4.0.0 (plaanitud)
#### Ettevõtte AI mustrid
- **Haldusraamistik**: AI mudelite haldus, vastavus ja auditeerimisteed
- **Mitme üürniku AI**: mustrid mitme kliendi teenindamiseks isoleeritud AI teenustega
- **Edge AI juurutamine**: integratsioon Azure IoT Edge ja konteinerite eksemplaridega
- **Hübriidpilve AI**: mitmepilve ja hübriidjuurutuse mustrid AI töökoormustele

#### Täiustatud funktsioonid
- **AI torujuhtme automatiseerimine**: MLOps integratsioon Azure Machine Learning torujuhtmetega
- **Täiustatud turvalisus**: nullusaldus mustrid, privaatvõrgu lõpp-punktid ja täiustatud ohutõrje
- **Jõudluse optimeerimine**: täiustatud häälestus- ja skaleerimisstrateegiad suurte voogude AI rakendustele
- **Globaalne levitamine**: sisu edastamine ja äärise mälu mustrid AI rakendustele

### Versioon 3.0.0 (plaanitud) - asendatud praeguse versiooniga
#### Pakutavad lisandused - nüüd rakendatud versioonis 3.0.0
- ✅ **AI-keskne sisu**: põhjalik Microsoft Foundry integratsioon (Valmis)
- ✅ **Interaktiivsed õpetused**: praktiline AI töötoa labor (Valmis)
- ✅ **Täiustatud turvamoodul**: AI-spetsiifilised turbemustrid (Valmis)
- ✅ **Jõudluse optimeerimine**: AI töökoormuste häälestusstrateegiad (Valmis)

### Versioon 2.1.0 (plaanitud) - osaliselt rakendatud versioonis 3.0.0
#### Vigade parandused - osa lõpetatud praeguses versioonis
- ✅ **Täiendavad näited**: AI-kesksete juurutamistsenaariumite lisamine (Valmis)
- ✅ **Laiendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsing (Valmis)
- **Tööriistade integratsioon**: täiustatud IDE ja toimetaja integratsioonijuhised
- ✅ **Jälgimise laienemine**: AI-spetsiifilised jälgimis- ja hoiatusmustrid (Valmis)

#### Jätkuvalt planeeritud tulevikuväljaandeks
- **Mobiilisõbralik dokumentatsioon**: vastupidav disain mobiilse õppe jaoks
- **Võrguühenduseta juurdepääs**: allalaaditavad dokumentatsioonipaketid
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogude jaoks
- **Kogukonna juhtpaneel**: reaalajas kogukonna mõõdikud ja panuste jälgimine

## Panustamine muudatuste logisse

### Muudatuste raporteerimine
Kui panustate sellesse hoidla, palun veenduge, et muudatuste logi kirjed sisaldaksid:

1. **Versiooninumber**: semantilise versioonihalduse järgi (major.minor.patch)
2. **Kuupäev**: väljaande või uuendamise kuupäev formaadis YYYY-MM-DD
3. **Kategooria**: Lisatud, Muudetud, Tööst välja jäetud, Eemaldatud, Parandatud, Turvalisus
4. **Selge kirjeldus**: lühike muudatuste kokkuvõte
5. **Mõju hindamine**: kuidas muudatused mõjutavad olemasolevaid kasutajaid

### Muudatuste kategooriad

#### Lisatud
- Uued funktsioonid, dokumentatsiooniosad või võimekused
- Uued näited, mallid või õpiressursid
- Täiendavad tööriistad, skriptid või utiliidid

#### Muudetud
- Olemasoleva funktsionaalsuse või dokumentatsiooni muudatused
- Uuendused selguse või täpsuse parandamiseks
- Sisu või organisatsiooni ümberkorraldamine

#### Tööst välja jäetud
- Omadused või lähenemised, mida hakatakse järk-järgult eemaldama
- Dokumentatsiooni sektsioonid, mis on kavas eemaldada
- Meetodid, millel on paremad alternatiivid

#### Eemaldatud
- Omadused, dokumentatsioon või näited, mis ei ole enam asjakohased
- Aegunud info või tööst välja jäänud lähenemised
- Üleküllased või koondatud sisud

#### Parandatud
- Vead dokumentatsioonis või koodis parandatud
- Raporteeritud probleemide lahendused
- Täpsuse või funktsionaalsuse paranemised


#### Turvalisus
- Turvalisusega seotud parandused või täiendused
- Turvalisuse parimate tavade uuendused
- Turvaaukude lahendamine

### Semeantilise versioonihaldamise juhised

#### Suur versioon (X.0.0)
- Põhimõttelised muudatused, mis nõuavad kasutaja sekkumist
- Sisukokkuvõtte või struktuuri olulised ümberkorraldused
- Muudatused, mis muudavad põhilist lähenemist või metodoloogiat

#### Väike versioon (X.Y.0)
- Uued funktsioonid või sisulised täiendused
- Täiendused, mis säilitavad tagurpidi ühilduvuse
- Täiendavad näited, tööriistad või ressursid

#### Parandusversioon (X.Y.Z)
- Veaparandused ja korrigeerimised
- Väikesed täiustused olemasolevale sisule
- Selgitused ja väiksed täiustused

## Kogukonna tagasiside ja ettepanekud

Julgustame aktiivselt kogukonna tagasisidet, et seda õppevara täiustada:

### Kuidas tagasisidet esitada
- **GitHub Issues**: Teata probleemidest või tee ettepanekuid (AI-spetsiifilised küsimused on teretulnud)
- **Discordi arutelud**: Jaga ideid ja suhtle Microsoft Foundry kogukonnaga
- **Pull Requestid**: Panusta otse sisuliste täiustustega, eriti AI mallid ja juhendid
- **Microsoft Foundry Discord**: Osale #Azure kanalil AZD + AI aruteludes
- **Kogukonna foorumid**: Osale laiemates Azure arendajate aruteludes

### Tagasiside kategooriad
- **AI sisu täpsus**: Parandused AI teenuste integratsiooni ja juurutamise infole
- **Õppimiskogemus**: Soovitused AI arendajate õppimise voogude parandamiseks
- **Puuduv AI sisu**: Taotlused täiendavate AI mallide, mustrite või näidete järele
- **Ligipääsetavus**: Täiendused mitmekesiste õppimisvajaduste jaoks
- **AI tööriistade integratsioon**: Soovitused parema AI arendustöövoo integreerimiseks
- **Tootmises kasutatavad AI mustrid**: Ettevõtte AI juurutuse mustrite soovitused

### Vastuse kohustus
- **Küsimustele vastamine**: Raporteeritud probleemidele 48 tunni jooksul
- **Funktsioonisoovid**: Hinnang ühe nädala jooksul
- **Kogukonna panused**: Ülevaatus ühe nädala jooksul
- **Turvaprobleemid**: Esmane prioriteet ja kiirendatud reageerimine

## Hooldusplaan

### Regulaarse uuendused
- **Igakuised ülevaated**: Sisu täpsuse ja linkide kontroll
- **Kvartaliuuendused**: Suured sisulised täiendused ja parandused
- **Poolaastased ülevaated**: Põhjalik ümberkorraldus ja täiendamine
- **Aastased versiooniväljaanded**: Suured versiooniuuendused oluliste täiustustega

### Jälgimine ja kvaliteedi tagamine
- **Automaattestimine**: Regulaarne koodinäidete ja linkide valideerimine
- **Kogukonna tagasiside integreerimine**: Kasutajate ettepanekute regulaarne kaasamine
- **Tehnoloogiauudised**: Vastavus uusimatele Azure teenustele ja azd väljaannetele
- **Ligipääsetavuse auditid**: Regulaarne ülevaade kaasava disaini printsiipide järgimiseks

## Versioonitoe poliitika

### Praeguse versiooni tugi
- **Viimane suur versioon**: Täielik tugi koos regulaarsete uuendustega
- **Eelnev suur versioon**: Turvauuendused ja kriitilised parandused 12 kuu jooksul
- **Varasemad versioonid**: Ainult kogukonna tugi, ametlikke uuendusi ei ole

### Migratsiooni juhised
Kui väljastatakse suured versioonid, pakume:
- **Migratsioonijuhendid**: Samm-sammulised ülemineku instruktsioonid
- **Ühilduvuse märkused**: Üksikasjad katkestavate muudatuste kohta
- **Tööriistade tugi**: Skriptid või utiliidid migratsiooni abistamiseks
- **Kogukonna tugi**: Pühendatud foorumid migratsiooniküsimustele

---

**Navigeerimine**
- **Eelmine õppetund**: [Study Guide](resources/study-guide.md)
- **Järgmine õppetund**: Tagasi [Põhijuhendisse](README.md)

**Ole kursis**: Telli selle hoidla muudatusi, et saada teavitusi uute väljaannete ja oluliste õppematerjalide uuenduste kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
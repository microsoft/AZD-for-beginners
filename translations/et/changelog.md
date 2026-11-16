# Muudatuste logi - AZD Algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik märkimisväärsed muudatused, uuendused ja täiustused AZD Algajatele hoidlas. Järgime semantilise versioonihalduse põhimõtteid ja hoiame seda logi selleks, et aidata kasutajatel mõista, mis versioonide vahel muutunud on.

## Õpieesmärgid

Selle muudatuste logi läbivaatamisega:
- Olete kursis uute funktsioonide ja sisulisandustega
- Saate aru olemasoleva dokumentatsiooni parendustest
- Jälgite veaparandusi ja täpsustusi, et tagada täpsus
- Järgite õppematerjalide arengut aja jooksul

## Õpitulemused

Pärast muudatuste logi sissekannete läbivaatamist oskate:
- Tuvastada uut sisu ja õppimiseks saadaval olevaid ressursse
- Mõista, millised osad on uuendatud või parendatud
- Planeerida oma õppeteekonda tuginedes kõige uuematele materjalidele
- Anda tagasisidet ja ettepanekuid edaspidiseks täiustamiseks

## Versiooniajalugu

### [v3.24.0]- 2026-11-04

#### Parandatud
- Parandati ingliskeelse kursuse navigeerimist, liigutatud lehekülgede teid, puuduvate ankrute ja aegunud väliste viidete, sealhulgas 2. peatüki linki tootmisalasele tehisintellekti juhendile.
- Läbivaatati kehtiv juhend AZD 1.37.2, agentide 1.0.0-beta.23 ja hinnangute 1.0.0-beta.2 avaldatud versioonidega. Dokumenteeriti eraldi `azd ai eval` töövoo ja optimiseerimiskonfiguratsiooni migreerimine.
- Parandati toetamatuid CLI lippe, autentimise piire, plane-teksti keskkonna/salajaste juhiseid, infrastruktuuri värskendusi, mudeli konfiguratsiooni ja hävitavate taastemeetmete näiteid.
- Uuendati töötuba vastavalt kehtivale AI agendi näidismaterjalile, kaasa arvatud tegelikud konksud, konfiguratsioonisisendid, hindamistestid, punase meeskonna sisenemispunktid ja jälgitavus.
- Parandati näitenäidete väited ja parandati seotud rakenduse/infrastruktuuri/konfiguratsiooni küsimused. Jaekaubanduse arhitektuurimaterjal on selgelt eristatud täielikust töörakendusest.
- Taastati CodeQL keelematrix, valiti arenduskonteineriks toetatud Node.js 24 ja muudeti seadistuskontrollid teatama ebaõnnestunud versioonikäskudest.

#### Lisatud
- Ainult inglise keeles toimiv offline linkide/ankurite kontrollija, regressioonitestid ja dokumentatsiooni töövoog, mis ehitab töötoa ka range režiimis. Genereeritud tõlked ja tõlgitud pildid on välistatud.

#### Kontrollimise ulatus
- Allikas, süntaks, konfiguratsioon, kohalik käitumine ja võrgu linkide kontrollid ei taga elus Azure'i juurutatavust, kvota, RBAC-i, piirkondliku mudeli kättesaadavust, arveldamist, turvastandardite järgimist ega tootmisvalmidust.
- Vanemad kirjed allpool on ajaloolised arhiivid, mitte praegused käsku- või versioonijuhised.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 uuendus: versiooni ajakohastamine
**See versioon kontrollib kursuse uuesti `azd` `1.27.1` (juuli 2026, viimane stabiilne versioon) ja kehtiva eelvaate AI agents laienduse `azure.ai.agents` `1.0.0-beta.5` vastu, uuendades kõiki "kontrollitud vastu" silte pärast versioone 1.26.0, 1.27.0 ja 1.27.1.**

#### Muudetud
- **✅ Kinnituse lähtejoon uuendatud** versioonilt `azd 1.25.6` (juuni 2026) versioonile `azd 1.27.1` (juuli 2026) üle kogu juur-README, kõigi peatükkide README-failide, peatüki 1 arenduskonteineri tunni (ka kinnitatud versiooni näidised), peatüki 4 kohandatud mallide tunni, peatüki 5 mitme agendi tunni ning töötoa dokumentide
- **🤖 Peatüki 2 lähtejoon värskendatud** versioonilt `azd 1.23.12` (märts 2026) versioonile `azd 1.27.1` failides `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ja `microsoft-foundry-integration.md`; kinnitusmärkimise kuupäevad uuendatud 2026-07-13
- **🧩 Tehisintellekti agendi laiendus uuendatud** versioonilt `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` praegusel versioonil `1.0.0-beta.5` peatüki 2 README-s ja `agents.md`
- **🧪 Töötoa kinnituse näide** (`azd version` väljund) uuendatud versioonile `1.27.1`

#### Märkused asjakohaste azd versioonide kohta (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go tugi Azure Functions jaoks Flex Consumption'l, `azd config sub-filter` rentniku tellimuse filtrid, iseseisvad laienduste paketid (`azd x pack --bundle`) ja `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelleeri Azure AI Foundry projekte/agente otse `azure.yaml` (Bicep-i/s Terraformi ilma algus), konteinerite juurutamise tugi App Service jaoks (`host: appservice` + `language: docker`), otsene `-s/--source` `azd extension` käskude jaoks ja `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` lipp `azd extension install` jaoks, aegunud mudelid vaikimisi seotud kataloogist/kvoodipakkumistest eemaldatud ja mitu veaparandust

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

#### Algaja täitmisülesanne #2: Malli loomine, arenduskonteinerid, Pulumi, Azure DevOps, teeninduskontod ja palju muud
**See versioon sulgeb allesjäänud vaheetapid, mida näitas azd-coverage analüüs: kuidas kirjutada ja avaldada oma mall, taasesitatavad dev-container/Codespaces keskkonnad, Pulumi infrastruktuuri pakkuja, Azure DevOpsi CI/CD läbivaatus, teenuse-pealepandmise autentimine, host-valiku juhised (AKS/Spring Apps), `azd restore`/`azd package` selgitused, hook vigade käsitlemine ja meeskonna/jaotatud keskkondade praktikad.**

#### Lisatud
- **🧱 Uus peatüki 4 õppetund** `docs/chapter-04-infrastructure/custom-templates.md` — oma azd malli loomine: nõutav struktuur (`azure.yaml`, `infra/`, `src/`), `metadata.template` väli, infrastruktuuri parameterdamine `uniqueString()` ressurssi tokeni ja `azd-env-name` sildiga, lokaalne testimine `azd init --template <local-path>` abil, avaldamine GitHubi ning esitamine Awesome AZD galeriisse
- **📦 Uus peatüki 1 õppetund** `docs/chapter-01-foundation/dev-containers.md` — taasesitatavad azd keskkonnad Dev Containers ja GitHub Codespaces abil: minimaalne `.devcontainer/devcontainer.json` kasutades ametlikku `ghcr.io/azure/azure-dev/azd` funktsiooni, keele-spetsiifilised funktsioonid, `docker-in-docker` konteinerihostide jaoks ning `azd auth login --use-device-code` kaugsisselogimiseks
- **🧩 Pulumi koos azd-ga** jaotis `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi kausta paigutus, virnad seostatud azd keskkondadega, nõutavad väljundid/sildistamine ning identsed `azd up` / `azd down` töövood
- **🎯 Hostimise valiku juhised** `docs/chapter-04-infrastructure/provisioning.md` — algajasõbralik võrdlus `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ja `springapp` vahel, juhised, millal valida AKS või Azure Spring Apps
- **🛠️ Azure DevOps CI/CD läbivaatus** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, teenuseühendus koormustöö identiteedi föderatsiooniga (OIDC), genereeritud `azure-dev.yml` ja muutujate grupi seadistamine
- **🔑 Teenusepõhimõtted (muster 4)** lisatud `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, mitteinteraktiivne `azd auth login` kliendi salajasega vs föderatiivsete/OIDC volitustega, kasutamise aeg ja turvaline volituste hoiustamine
- **🪝 Kangi vea käsitlemise** alajaotis `docs/chapter-04-infrastructure/deployment-guide.md` — väljumiskoodid ja `set -e`, `continueOnError`, konksude isoleeritud testimine koos `azd hooks run`, OS-sõltuvad kestad ja `--debug`
- **👥 Meeskonna / jagatud keskkonnad** sektsioon `docs/chapter-03-configuration/configuration.md` — mis elab `.azure/`, mida gitignore’ida, arendaja keskkonnad, `azd env list`/`select` ja keskkonnaväärtuste pakkumine CI/CD-s
- **🧰 `azd restore` ja laienenud `azd package`** seletused `resources/cheat-sheet.md` — sõltuvuste taastamine ja juurutamiseks valmis artefakti ehitamine ilma juurutamiseta

#### Muudetud
- **🧭 4. peatüki õppetundide tabel** uuendatud, lisades uue õppetunni "Kirjuta oma mall" (õppetund 3)
- **🧭 1. peatüki õppetundide tabel** uuendatud, lisades uue õppetunni "Arendusmahutid ja koodiruumid" (õppetund 5); navigeerimise jalused ühendatud `bring-your-own-app.md` ja `dev-containers.md` vahel

### [v3.21.0] - 2026-06-16

#### Algajate täitekursus: praktiline mitme-agendi õppetund „Too oma rakendus“, Terraform ja CI/CD samm-sammuline juhend
**See versioon täidab suurimad puudujäägid täielikus algajate juhendis, lisades kaks uut praktilist õppetundi (paigaldatav mitme-agendi juhend ja azd lisamine olemasolevale rakendusele), algajasõbraliku konksude sissejuhatuse, Terraformi-azd osa, samm-sammulise GitHub Actions töövoo juhendi, uute eelvaate laienduste selgituse ja selge paigalduse kontroll-lehe.**

#### Lisatud
- **🤝 Uus 5. peatüki õppetund** `docs/chapter-05-multi-agent/multi-agent-basics.md` — täielikult praktiline ja kasutusvalmis kahe-agendi juhend (koordinaator + spetsialistid) reaalse malliga (`contoso-creative-writer`), käsitledes mitme-agendi kasutamise olukordi, `azd up` töövoogu, paigaldatud ressursside mõistmist, agendidevahelist jälgimist, kohandamist ja puhastamist
- **📦 Uus 1. peatüki õppetund** `docs/chapter-01-foundation/bring-your-own-app.md` — kuidas lisada azd olemasolevasse projekti koos `azd init` ("kasuta koodi praegusest kaustast"), `azure.yaml` ja `infra/` mõistmine, `azd infra generate`, hosti tuvastamine ja paigaldamine `azd up` abil
- **🌐 Terraform koos azd-ga** lisatud `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguratsioon, `.tf` kaustade paigutus, nõutavad `AZURE_*` väljundid ja `azd-env-name` märgistamine ning identne `azd up` / `azd down` töövoog (avab lünga, kus väideti Terraformi tuge, aga näidati ainult Bicepit)
- **⚙️ Samm-sammuline GitHub Actions juhend** `docs/chapter-08-production/production-ai-practices.md` — GitHubi repositooriumist automatiseeritud paigaldusteni: `azd pipeline config`, OIDC föderatsioonitunnistused (ilma salvestatud saladusteta), genereeritud `azure-dev.yml` ja saladuste vs muutujate juhendamine
- **🪝 Algajate „Uus konksude kohta?“ sissejuhatus** `docs/chapter-04-infrastructure/deployment-guide.md` — mis on konks, konksufaaside tabel, minimaalne esimene konks ja konksude käsitsi käivitamine `azd hooks run` abil
- **✅ "Kontrolli oma paigaldust" nimekiri** lisatud `docs/chapter-01-foundation/first-project.md` 5. sammu juurde — suitsutest, terviseotsingu kontroll ja selged edutunnused
- **🧩 Selgitus uutest eelvaate laiendustest** `azure.ai.skills` ja `azure.ai.connections` (mis need on ja millal neid kasutada) `docs/chapter-08-production/production-ai-practices.md` sees

#### Muudetud
- **🧭 5. peatüki õppetundide tabel** parandatud: `multi-agent-basics.md` on nüüd õppetund 1 (ainult täielikult praktiline õppetund), avameelselt märgitud, et õppetund 2 on 6. peatükis ja jaemüügistsenaarium on arhitektuuri plaan, mitte ühe käsu mall
- **🧭 1. peatüki õppetundide tabel** sisaldab nüüd uut "Too oma rakendus" õppetundi (Õppetund 4)
- **🔗 Navigeerimise jalused** uuendatud: `first-project.md` viitab nüüd edasi `bring-your-own-app.md`

#### Parandatud
- **🧱 Suletud "nõutud, kuid puuduv" Terraform'i auk** — kursus viitas varem Terraform'i toele ilma seda näitamata
- **🔀 Parandatud eksitavad 5. peatüki ristviited**, mis jätsid mulje, nagu oleks olemas täismahus mitme agendi lahendus, kuigi oli ainult arhitektuuri plaan

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

#### AZD 1.25.6 värskendus, täispikk agentide elutsükli käsud ja Aspire'i ümberbrändimine
**See versioon kinnitab kursuse kehtivust uuesti `azd` `1.25.6` (juuni 2026) ja `azure.ai.agents` `0.1.40-preview` laienduse vastu, laiendab tehisintellekti juhiseid „agendi ehitamisest“ tervele agentide elutsüklile (testimine → hindamine → optimeerimine → kontrollimine → kustutamine), tutvustab uusi `azure.ai.skills` ja `azure.ai.connections` eelvaate laiendusi ning märgib ".NET Aspire" → "Aspire" tootemuutust.**

#### Lisatud
- **🔁 Täielik agentide elutsükli katvus** algajatele ja tehisintellekti inseneridele kogu dokumentatsioonis:
  - `docs/chapter-01-foundation/azd-basics.md` — Elutsükli tabel (ehitamine → testimine → mõõtmine → parandamine → kontrollimine → puhastamine) lisatud Laienduste ja tehisintellekti käskude jaotisse
  - `docs/chapter-08-production/production-ai-practices.md` — Uus "Agendi elutsükli haldamine" jaotis, mis käsitleb `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
  - `resources/cheat-sheet.md` — Laiendatud tehisintellekti agendi käsud koos `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
- **🧩 Uued eelvaate laiendused** dokumenteeritud: `azure.ai.skills` (taaskasutatavad agendi oskused) ja `azure.ai.connections` (Foundry ühendused) lisatud laienduste tabelisse ja nipiraamatusse
- **⏱️ Vastuseaja juhised** — `azd ai agent invoke` näited märgivad nüüd, et see kuvab kogu latentsuse ja esimese baiti jõudmise aja
- **📌 Versioonibänner** juure README-s, mis suunab õppijaid `azd version` ja `azd upgrade` juurde

#### Muudetud
- **✅ Kontrollalus uuendatud** alates `azd 1.23.12` (märts 2026) kuni `azd 1.25.6` (juuni 2026) kõikide peatükkide READMEde ja töötuba dokumentide ulatuses
- **🤖 Peatükk 2 laiendusmärkus** uuendatud alates `azure.ai.agents` `0.1.18-preview` kuni `0.1.40-preview`
- **🧪 Töötuba valideerimise näide** (`azd version` väljund) uuendatud kuni `1.25.6`
- **🧭 README "Mis on täna azd-s uus"** värskendatud rõhutamaks kogu agendi elutsüklit, uusi tehisintellekti laiendusi ja hiljutisi elu lihtsustavaid parandusi (`azd init` idempotentsus, `azd auth login` aegunud tähtajalõpu kustutamine, `azd tool` esmakordse käivituse näpunäide)
- **📖 Peatükk 2 agents.md (Variant 4)** juhendab õppijaid nüüd post-deploy elutsükli käskluste juurde, mitte ei peatu `azd up` juures

#### Parandatud
- **🏷️ Toote nimetamine** — lisatud Aspire brändimuudatuse märkus (".NET Aspire" on nüüd lihtsalt "Aspire"); azd Aspire tugi on muutumatuks jäänud
- **🔎 Otse avaldamise valideerimine** kinnitatud Azure Developer CLI release voost: stabiilne CLI `1.25.6` (2026-06-12) ja `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Muudetud failid
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

#### Algaja juhendamine, seadistuse valideerimine ja AZD lõplik käskude koristus
**See versioon järgneb AZD 1.23 valideerimiskorrale algajatele suunatud dokumentide korrigeerimisega: see selgitab AZD-eelistusega autentimise juhiseid, lisab kohaliku seadistuse valideerimise skriptid, kontrollib võtmekäsklusi otse AZD CLI vastu ja eemaldab viimased aegunud ingliskeelsed käsurea viited peale muudatuste logi.**

#### Lisatud
- **🧪 Algaja seadistuse valideerimise skriptid** koos `validate-setup.ps1` ja `validate-setup.sh`, et õppijad saaksid enne 1. peatüki alustamist vajalikud tööriistad kinnitada
- **✅ Enne seadistuse valideerimise sammud** põhijuurde README-s ja 1. peatükis, nii et puuduvad tingimused tabatakse enne `azd up`

#### Muudetud
- **🔐 Algaja autentimise juhised** käsitlevad nüüd järjepidevalt `azd auth login` kui peamist rada AZD töövoogudes, kusjuures `az login` on lisatud valikulise märkusena, välja arvatud juhul kui kasutatakse otse Azure CLI käsklusi
- **📚 1. peatüki sissejuhatus** juhatab õppijaid nüüd oma kohalikku seadistust enne installatsiooni, autentimist ja esimest juurutamist valideerima
- **🛠️ Valideerijate teadete selgem eristus** blokeerivatest nõuetest ja valikulistest Azure CLI hoiatustest AZD-põhise algaja tee jaoks
- **📖 Konfiguratsiooni, tõrkeotsingu ja näitedokumentide** täpsustus: eristatakse nõutud AZD autentimist ja valikulist Azure CLI sisselogimist, kus varem olid mõlemad kontekstita esitatud

#### Parandatud
- **📋 Ingliskeelsete käsurea viidete uuendus** ajakohaste AZD vormide vastu, sh `azd config show` petmislehel ja `azd monitor --overview`, kus oli plaanitud Azure portaal ülevaate juhend
- **🧭 Algaja väited 1. peatükis** leevendatud, et vältida üle lubamist tagatud veavabale või tagasipööramise käitumisele kõigi mallide ja Azure ressursside puhul
- **🔎 Otsepõhine CLI valideerimine** kinnitas praeguse toe `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ja `azd down --force --purge` eest

#### Muudetud failid
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

#### AZD 1.23.12 valideerimine, töötuba keskkonna laiendus ja tehisintellekti mudeli värskendus
**See versioon teostab dokumentide valideerimist vastu `azd` `1.23.12`, uuendab aegunud AZD käsu näiteid, värskendab tehisintellekti mudeli juhiseid vastavalt praegustele vaikeväärtustele ning laiendab töötuba juhised GitHub Codespaces'i kõrval dev konteinerite ja kohalike kloonide toetamiseks.**

#### Lisatud
- **✅ Valideerimise märgised põhiteemade ja töötuba dokumentides** selguse huvides, et õppijad teaksid, millist AZD baasversiooni uuemad või vanemad CLI ehitised kasutavad
- **⏱️ Juurutamise aegumise juhendid** pikaajaliste tehisintellekti rakenduste juurutamiseks kasutades `azd deploy --timeout 1800`
- **🔎 Laienduste kontrollimise sammud** koos `azd extension show azure.ai.agents` tehisintellekti töövoogude dokumentides
- **🌐 Laiemad juhised töötuba keskkonnale** hõlmates GitHub Codespaces, dev konteinerid ja kohalikud kloonid MkDocs kasutades

#### Muudetud
- **📚 Peatükkide sissejuhatuse README-d** nüüd järjepidevalt märgivad valideerimise vastu `azd 1.23.12` alustalad, seadistus, infrastruktuur, mitme agendi, eeltöötluse, tõrkeotsingu ja tootmise sektsioonides
- **🛠️ AZD käsurea viited** uuendatud dokumentides praegustele vormidele:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` või `azd env get-value(s)` kontekstist sõltuvalt
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kui on kavandatud Application Insights ülevaade
- **🧪 Juhtimisnäidete lihtsustumine praeguse toetuse alusel**, näiteks `azd provision --preview` ja `azd provision --preview -e production`
- **🧭 Töötuba käive** nüüd lubab õppijatel laboris toimuda Codespaces-is, dev konteineris või kohalikes kloonides, mitte eeldades vaid Codespaces-i kasutust
- **🔐 Autentimise juhised** eelistavad nüüd `azd auth login` AZD töövoogudes, samas kui `az login` on märgitud valikulise kui kasutatakse otse Azure CLI käske

#### Parandatud
- **🪟 Windows-i installi käsud** ühtlustatud vastavalt uuemale `winget` paketikirjutusele installi juhendis
- **🐧 Linuxi installi juhised** parandatud, vältides toetamata distro-spetsiifilisi `azd` pakihalduri käske ning suunates sobivatelt kujult release varadele
- **📦 Tehisintellekti mudeli näited** uuendatud vanadest vaikeväärtustest nagu `gpt-35-turbo` ja `text-embedding-ada-002` praeguste nagu `gpt-4.1-mini`, `gpt-4.1` ja `text-embedding-3-large` vastu
- **📋 Juurutamise ja diagnostika koodinäidete parandused** praeguste keskkonna ja oleku käskude kasutamiseks logides, skriptides ja tõrkeotsingus
- **⚙️ GitHub Actions juhised** ajakohastatud alates `Azure/setup-azd@v1.0.0` kuni `Azure/setup-azd@v2`
- **🤖 MCP/Copilot nõusoleku juhised** uuendatud alates `azd mcp consent` kuni `azd copilot consent list`

#### Parendused
- **🧠 Tehisintellekti peatüki juhised** selgitavad nüüd paremini eelvaate tundlikku `azd ai` käitumist, üürniku spetsiifilist sisselogimist, praegust laienduste kasutust ja mudeli juurutamise soovitusi
- **🧪 Töötuba juhised** kasutavad nüüd realistlikumaid versiooninäiteid ja selgemat keskkonna seadistuse sõnastust praktiliste laborite jaoks
- **📈 Tootmise ja tõrkeotsingu dokumendid** paremini haakuvad tänaste jälgimiste, varumudeli ja tasemepõhiste kulunäidetega

#### Muudetud failid
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

#### AZD AI CLI käsud, sisu valideerimine ja mallide laiendus
**See versioon lisab `azd ai`, `azd extension` ja `azd mcp` käsude katvuse kõigis tehisintellekti peatükkides, parandab katkised lingid ja aegunud koodi agents.md-s, uuendab petmislehte ning muutub näidismallide sektsiooni valideeritud kirjelduste ja uute Azure AI AZD mallidega.**

#### Lisatud
- **🤖 AZD AI CLI katvus** 7 failis (varem ainult 8. peatükis):
  - `docs/chapter-01-foundation/azd-basics.md` — uus "Laienduste ja AI käskude" sektsioon, mis tutvustab `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Variant 4: `azd ai agent init` koos võrdlustabeliga (mall vs manifesti lähenemine)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD laiendused Foundry-le" ja "Agent-First juurutamine" alajaotised
  - `docs/chapter-05-multi-agent/README.md` — Kiire algus näitab nüüd nii mallipõhist kui manifestipõhist juurutusrada
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Juurutamise sektsioon sisaldab nüüd `azd ai agent init` valikut
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI laienduse käsud diagnostika jaoks" alajaotis
  - `resources/cheat-sheet.md` — uus "AI ja Laienduste käsud" sektsioon koos `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`
- **📦 Uued AZD AI näidismallid** `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG vestlus Blazor WebAssembly, Semantiline Kernel ja häälvestluse toega
  - **azure-search-openai-demo-java** — Java RAG vestlus kasutades Langchain4J koos ACA/AKS juurutamise võimalustega
  - **contoso-creative-writer** — Mitme agendi loominguline kirjutamisrakendus kasutades Azure AI Agent Service, Bing Grounding ja Promptyt
  - **serverless-chat-langchainjs** — Serverita RAG kasutades Azure Functions + LangChain.js + Cosmos DB koos Ollama kohaliku arendustoega
  - **vestlus-teie-andmetega-lahenduse-kiirendi** — Ettevõtte RAG kiirendi administraatori portaaliga, Teamsi integratsiooniga ja PostgreSQL/Cosmos DB valikutega
  - **azure-ai-reisibürood** — Mitme agendi MCP orkestreerimise viiteäpp serveritega .NET, Python, Java ja TypeScriptis
  - **azd-ai-starter** — Minimaalne Azure AI infrastruktuuri Bicep algmall
  - **🔗 Vinge AZD AI galerii link** — Viide [awesome-azd AI galeriile](https://azure.github.io/awesome-azd/?tags=ai) (üle 80 malli)

#### Parandused
- **🔗 agents.md navigeerimine**: Eelnevad/järgmised lingid vastavad nüüd 2. peatüki README õppetükkide järjekorrale (Microsoft Foundry integratsioon → Agendid → AI mudeli juurutamine)
- **🔗 agents.md katkised lingid**: `production-ai-practices.md` parandatud aadressile `../chapter-08-production/production-ai-practices.md` (3 esinemist)
- **📦 agents.md aegunud kood**: Asendatud `opencensus` asemel `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md vigane API**: Liigutatud `max_tokens` asukohast `create_agent()` koha peale `create_run()` kui `max_completion_tokens`
- **🔢 agents.md märgisete lugemine**: Asendatud ligikaudne `len//4` hinnang täpsema `tiktoken.encoding_for_model()` vastu
- **azure-search-openai-demo**: Parandatud teenused "Cognitive Search + App Service" → "Azure AI Search + Azure Container Apps" (vaikimisi host muudeti 2024. oktoobris)
- **contoso-chat**: Uuendatud kirjeldus viitama Azure AI Foundry + Prompty'le, vastates repositooriumi tegelikule pealkirjale ja tehnoloogiate virnale

#### Eemaldatud
- **ai-dokumenditöötlus**: Eemaldatud mittetöötav malliviide (repo pole avatud AZD mallina)

#### Parandatud
- **📝 agents.md harjutused**: Harjutus 1 näitab nüüd oodatud väljundit ja `azd monitor` sammu; harjutus 2 sisaldab täismahus `FunctionTool` registreerimiskoodi; harjutus 3 asendas ebamäärased juhendid konkreetsete `prepdocs.py` käskudega
- **📚 agents.md ressursid**: Uuendatud dokumentatsiooni lingid pärisajani Azure AI Agent Service dokumentatsioonile ja kiirele stardile
- **📋 agents.md järgnevad sammud tabelis**: Lisatud AI jaamu töötoa link katvuse lõpuleviimiseks peatükis

#### Muudetud failid
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kursuse navigeerimise täiustamine
**See versioon parandab README.md peatükkide navigeerimist täiustatud tabelivorminguga.**

#### Muudatused
- **Kursuse kaardi tabel**: Täiendatud otselinkidega õppetükkidele, kestuse hinnangute ja keerukuse reitingutega
- **Kaustade korrastamine**: Eemaldatud dubleeritud vanad kaustad (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lingikontroll**: Kõik 21+ siselinki kursuse kaardi tabelis kontrollitud

### [v3.16.0] - 2026-02-05

#### Tootenimede uuendused
**See versioon uuendab tooteviiteid vastavalt Microsofti praegusele brändingule.**

#### Muudatused
- **Microsoft Foundry → Microsoft Foundry**: Kõik viited uuendatud mitmetes mitte-tõlke failides
- **Azure AI Agent Service → Foundry Agents**: Teenuse nimi uuendatud vastavalt praegusele brändingule

#### Muudetud failid
- `README.md` - Peamine kursuse sihtleht
- `changelog.md` - Versioonide ajalugu
- `course-outline.md` - Kursuse struktuur
- `docs/chapter-02-ai-development/agents.md` - AI agendijuhend
- `examples/README.md` - Näidisdokumentatsioon
- `workshop/README.md` - Töötoa sihtleht
- `workshop/docs/index.md` - Töötoa indeks
- `workshop/docs/instructions/*.md` - Kõik töötoa juhendifailid

---

### [v3.15.0] - 2026-02-05

#### Repo põhjalik ümberkorraldus: peatükipõhised kaustanimed
**See versioon struktureerib dokumentatsiooni eraldi peatükikaustadesse selgema navigeerimise jaoks.**

#### Kaustade ümbernimetamine
Vanad kaustad asendati peatükkide numbritega:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisatud uus: `docs/chapter-05-multi-agent/`

#### Failide migratsioonid
| Fail | Algus | Sihtkoht |
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
| Kõik tõrkeotsingu failid | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lisatud
- **📚 Peatükkide README failid**: Loodud README.md igas peatüki kaustas koos:
  - Õpieesmärgid ja kestus
  - Õppetükkide tabel koos kirjeldustega
  - Kiirkäivituse käsud
  - Navigeerimine teiste peatükkide juurde

#### Muudetud
- **🔗 Värskendatud kõik siselinkid**: Üle 78 tee uuendatud kogu dokumentatsioonis
- **🗺️ Peamine README.md**: Uuendatud kursuse kaart uue peatükkide struktuuriga
- **📝 examples/README.md**: Uuendatud ristviited peatükikaustadele

#### Eemaldatud
- Vana kaustastruktuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repo ümberkorraldus: peatükkide navigeerimine
**See versioon lisas peatükkide navigeerimise README failid (asendatud versiooniga v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uus AI agentide juhend
**See versioon lisab põhjaliku juhendi AI agentide juurutamiseks Azure Developer CLI abil.**

#### Lisatud
- **🤖 docs/microsoft-foundry/agents.md**: Täielik juhend, mis käsitleb:
  - Mis on AI agendid ja kuidas nad erinevad chatbotidest
  - Kolm kiirkäivitusmalli agentidele (Foundry Agents, Prompty, RAG)
  - Agendi arhitektuuri mustrid (üksikagent, RAG, mitmeagendi)
  - Tööriistade seadistamine ja kohandamine
  - Jälgimine ja mõõdikute kogumine
  - Kulutähtsus ja optimeerimine
  - Levinumad tõrkeotsingu stsenaariumid
  - Kolm praktilist harjutust edukriteeriumitega

#### Sisustruktuur
- **Sissejuhatus**: Agendi mõisted algajatele
- **Kiirkäivitus**: Agentide juurutamine `azd init --template get-started-with-ai-agents` abil
- **Arhitektuuri mustrid**: Agentide diagrammid
- **Seadistamine**: Tööriistade seadistamine ja keskkonnamuutujad
- **Jälgimine**: Application Insights integratsioon
- **Harjutused**: Järk-järguline praktiline õppimine (20-45 minutit igaüks)

---

### [v3.12.0] - 2026-02-05

#### DevContainer keskkonna uuendus
**See versioon uuendab arendusmahuti konfiguratsiooni kaasaegsete tööriistade ja paremate vaikeseadistustega AZD õppimise kogemuse jaoks.**

#### Muutused
- **🐳 Baaspildi uuendus**: Uuendatud aadressilt `python:3.12-bullseye` aadressile `python:3.12-bookworm` (viimane stabiilne Debian)
- **📛 Mahuti nimi**: Nimetatud ümber "Python 3" → "AZD algajatele" selguse huvides

#### Lisatud
- **🔧 Uued Dev Container funktsioonid**:
  - `azure-cli` Bicep toe lubamisega
  - `node:20` (LTS versioon AZD mallide jaoks)
  - `github-cli` mallihalduseks
  - `docker-in-docker` mahutirakenduste juurutamiseks

- **🔌 Pordiedastus**: Eelkonfigureeritud pordid tavapäraseks arenduseks:
  - 8000 (MkDocs eelvaade)
  - 3000 (Veebirakendused)
  - 5000 (Python Flask)
  - 8080 (API-d)

- **🧩 Uued VS Code laiendused**:
  - `ms-python.vscode-pylance` - Täiustatud Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions tugi
  - `ms-azuretools.vscode-docker` - Docker tugi
  - `ms-azuretools.vscode-bicep` - Bicep keele tugi
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursside haldus
  - `yzhang.markdown-all-in-one` - Markdown redigeerimine
  - `DavidAnson.vscode-markdownlint` - Markdown lintimine
  - `bierner.markdown-mermaid` - Mermaid diagrammi tugi
  - `redhat.vscode-yaml` - YAML tugi (azure.yaml jaoks)
  - `eamodio.gitlens` - Git visualiseering
  - `mhutchie.git-graph` - Git ajalugu

- **⚙️ VS Code seaded**: Lisatud vaikeseaded Python tõlgendaja, salvestamisel vormindamise ja tühikute eemaldamise jaoks

- **📦 Uuendatud requirements-dev.txt**:
  - Lisatud MkDocs minify plugin
  - Lisatud pre-commit koodi kvaliteedi tagamiseks
  - Lisatud Azure SDK paketid (azure-identity, azure-mgmt-resource)

#### Parandused
- **Post-Create käsk**: Kontrollib nüüd AZD ja Azure CLI installatsiooni mahuti käivitamisel

---

### [v3.11.0] - 2026-02-05

#### Algajate sõbralik README ümbertöötamine
**See versioon parandab oluliselt README.md algajate ligipääsetavust ja lisab olulised ressursid AI arendajatele.**

#### Lisatud
- **🆚 Azure CLI ja AZD võrdlus**: Selge selgitus, millal kasutada kumbagi tööriista praktiliste näidetega
- **🌟 Vinged AZD lingid**: Otselingid kogukonna malligaleriile ja panustamisressurssidele:
  - [Vinge AZD galerii](https://azure.github.io/awesome-azd/) - üle 200 juurutamiseks valmis malli
  - [Saada mall](https://github.com/Azure/awesome-azd/issues) - Kogukonna panustamine
- **🎯 Kiirkäivitusjuhend**: Lihtsustatud 3-sammuline algusosa (Installi → Logi sisse → Juuruta)
- **📊 Kogemusel põhinev navigeerimistabel**: Selged juhised, kust alustada vastavalt arendaja kogemustele

#### Muudetud
- **README struktuur**: Ümber korraldatud progressiivseks info avalikustamiseks — esmalt võtmeinfo
- **Sissejuhatuse osa**: Kirjutatud ümber, et selgitada "The Magic of `azd up`" täiesti algajatele
- **Duplikaat sisu eemaldamine**: Kaotatud korduv tõrkeotsingu jaotis
- **Tõrkeotsingu käsud**: Parandatud `azd logs` viide, kasutades kehtivat `azd monitor --logs`

#### Parandused
- **🔐 Autentimiskäsud**: Lisatud `azd auth login` ja `azd auth logout` failile cheat-sheet.md
- **Vigased käskude viited**: Eemaldatud allesjäänud `azd logs` README tõrkeotsingu osast

#### Märkused
- **Ulatus**: Muudatused tehtud peamisele README.md-le ja resources/cheat-sheet.md-le
- **Märgitud sihtrühm**: Parandused on suunatud eelkõige AZD-ga algajatele arendajatele

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI käskude täpsuse uuendus
**See versioon parandab dokumentatsioonis eksisteerimata AZD käsud, tagades kõigi koodinäidete kehtiva Azure Developer CLI süntaksi.**

#### Parandused
- **🔧 Eksisteerimata AZD käsud eemaldatud**: Põhjalik audit ja vigaste käskude parandamine:
  - `azd logs` (ei eksisteeri) → asendatud `azd monitor --logs` või Azure CLI alternatiividega
  - `azd service` alamkäsud (ei eksisteeri) → asendatud `azd show` ja Azure CLI-ga
  - `azd infra import/export/validate` (ei eksisteeri) → eemaldatud või asendatud kehtivate alternatiividega
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` lipud (ei eksisteeri) → eemaldatud
  - `azd provision --what-if/--rollback` lipud (ei eksisteeri) → uuendatud kasutama `--preview`
  - `azd config validate` (ei eksisteeri) → asendatud `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ei eksisteeri) → eemaldatud

- **📚 Parandatud käsuviidetega failid**:
  - `resources/cheat-sheet.md`: Põhjalik käsurea viidete ülevaatus
  - `docs/deployment/deployment-guide.md`: Parandatud rollback ja juurutamiste strateegiad
  - `docs/troubleshooting/debugging.md`: Parandatud logi analüüsi osad
  - `docs/troubleshooting/common-issues.md`: Uuendatud tõrkeotsingu käsud
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud AZD silumise jaotis
  - `docs/getting-started/azd-basics.md`: Parandatud jälgimiskäsud
  - `docs/getting-started/first-project.md`: Uuendatud jälgimise ja silumise näited
  - `docs/getting-started/installation.md`: Parandatud abi- ja versiooninäited
  - `docs/pre-deployment/application-insights.md`: Parandatud logide vaatamise käsud
  - `docs/pre-deployment/coordination-patterns.md`: Parandatud agendi silumise käsud

- **📝 Versiooniviide uuendatud**: 
  - `docs/getting-started/installation.md`: Muudetud kõvakodeeritud `1.5.0` versioon üldiseks `1.x.x` koos väljalasete lingiga

#### Muudetud
- **Tagasikerimise strateegiad**: Dokumentatsioon uuendatud kasutama Git-põhist tagasikerimist (AZD-l puudub natiivne tagasikerimine)
- **Logide vaatamine**: Asendatud `azd logs` viited käsudega `azd monitor --logs`, `azd monitor --live` ja Azure CLI
- **Jõudluse jaotis**: Eemaldatud mitteolemasolevad paralleel- ja inkrementaalse juurutamise lipud, pakutud kehtivad alternatiivid

#### Tehnilised üksikasjad
- **Kehtivad AZD käsud**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kehtivad azd monitor lipud**: `--live`, `--logs`, `--overview`
- **Eemaldatud funktsioonid**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Märkused
- **Kinnitus**: Käsud on valideeritud Azure Developer CLI v1.23.x vastu

---

### [v3.9.0] - 2026-02-05

#### Töötuba lõpetatud ja dokumentatsiooni kvaliteedi uuendus
**See versioon täiendab interaktiivset töötubade mooduleid, parandab kõik katkised dokumendilinkid ja tõstab üldist sisukvaliteeti Microsoft AZD kasutavate AI arendajate jaoks.**

#### Lisatud
- **📝 CONTRIBUTING.md**: Uus panustamise juhendiga dokument koos:
  - Selgete juhistega probleemide teatamiseks ja muudatuste ettepanekuks
  - Dokumentatsiooni standardid uue sisu jaoks
  - Koodi näidete juhised ja commit-sõnumite kokkulepped
  - Kogukonna kaasamise info

#### Lõpetatud
- **🎯 Töötuba moodul 7 (kokkuvõte)**: Täielikult lõpetatud kokkuvõttekursus koos:
  - Ulatusliku kokkuvõttega töötuba saavutustest
  - Oluliste kontseptsioonide omandamise osaga AZD, mallide ja Microsoft Foundry kohta
  - Soovitustega õppe teekonna jätkamiseks
  - Töötuba väljakutsete harjutustega keerukuse hinnangutega
  - Kogukonna tagasiside ja tugilingid

- **📚 Töötuba moodul 3 (lagundamine)**: Uuendatud õpieesmärgid koos:
  - GitHub Copilot MCP serverite kasutuselevõtu juhised
  - AZD malli kaustastruktuuri mõistmine
  - Infrastruktuur koodina (Bicep) organiseerimisvõtted
  - Praktilised juhised laboritööks

- **🔧 Töötuba moodul 6 (lammutamine)**: Lõpetatud koos:
  - Ressursside puhastamise ja kulude haldamise eesmärkidega
  - `azd down` kasutamine infrastruktuuri turvaliseks eemaldamiseks
  - Kognitiivsete teenuste pehmerenoveerimise juhised
  - Lisapunktide uurimisküsimused GitHub Copiloti ja Azure Portaaliga

#### Parandatud
- **🔗 Katkised lingid parandatud**: Lahendatud 15+ sisemist katkist dokumendilingi:
  - `docs/ai-foundry/ai-model-deployment.md`: Parandatud microsoft-foundry-integration.md radade failitee
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud ai-model-deployment.md ja production-ai-practices.md teed
  - `docs/getting-started/first-project.md`: Asendatud olemasolemata cicd-integration.md käsiraamatu deployment-guide.md-ga
  - `examples/retail-scenario.md`: Parandatud korduma kippuvate küsimuste ja tõrkeotsingu juhendi failiteed
  - `examples/container-app/microservices/README.md`: Parandatud kursuse avalehe ja juurutamissuuna failiteed
  - `resources/faq.md` ja `resources/glossary.md`: Uuendatud tehisintellekti peatüki viited
  - `course-outline.md`: Parandatud juhendaja ja AI töötuba laborite viited

- **📅 Töötuba staatusbanner**: Uuendatud "Ehitamisel" olekust aktiivse töötuba olekuks, lõpuleviimise kuupäevaks veebruar 2026

- **🔗 Töötuba navigeerimine**: Parandatud katkised navigeerimise lingid töötuba README.md failis, mis viitasid mitteolemasolevale lab-1-azd-basics kaustale

#### Muudetud
- **Töötuba esitlus**: Eemaldatud "ehitamisel" hoiatus, töötuba on nüüd täielikult valmis kasutamiseks
- **Navigeerimise järjepidevus**: Tagatud, et kõik töötuba moodulid sisaldavad korrektset moodulite-vahelist navigeerimist
- **Õpperaja viited**: Uuendatud peatükkide ristviited õigete microsoft-foundry failitee abil

#### Kinnitatud
- ✅ Kõik ingliskeelsed markdown failid sisaldavad kehtivaid siselinke
- ✅ Töötuba moodulid 0-7 on täielikud koos õpieesmärkidega
- ✅ Peatükkide ja moodulite vaheline navigeerimine töötab korrektselt
- ✅ Sisu sobib AI arendajatele, kes kasutavad Microsoft AZD
- ✅ Algajale sõbralik keel ja struktuur on kogu ulatuses tagatud
- ✅ CONTRIBUTING.md annab selged juhised kogukonna panustajatele

#### Tehniline rakendus
- **Lingikontroll**: Automaatne PowerShell skript valideeris kõik .md vormingus sisemised lingid
- **Sisu audit**: Töötuba täielikkuse ja algajatele sobivuse käsitsi kontroll
- **Navigeerimissüsteem**: Järjepidevad peatükkide ja moodulite navigeerimise mustrid rakendatud

#### Märkused
- **Ulatus**: Muudatused kehtivad ainult ingliskeelsele dokumentatsioonile
- **Tõlked**: Tõlkekataloogid ei uuendatud selles versioonis (automaatne tõlge teisaldatakse hiljem)
- **Töötuba kestvus**: Täielik töötuba pakub nüüd 3-4 tundi praktilist õppimist

---

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: Jälgimine, turvalisus ja mitme agendi mustrid
**See versioon lisab põhjalikke A-klassi tunde rakenduse Insights'i integratsiooni, autentimismustrite ja mitmeagendi koordineerimise kohta tootmises.**

#### Lisatud
- **📊 Application Insights'i integratsiooni õppetund**: failis `docs/pre-deployment/application-insights.md`:
  - AZD-keskne juurutamine automaatse provisjonimisega
  - Terviklikud Bicep mallid Application Insights + Log Analytics jaoks
  - Töötavad Python rakendused kohandatud telemeetriaga (üle 1200 rea)
  - AI/LLM jälgimismustrid (Microsoft Foundry mudelite märgistus- ja kulude jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetria voog)
  - 3 praktilist harjutust (hoiatused, armatuurlauad, AI jälgimine)
  - Kusto päringu näited ja kulude optimeerimise strateegiad
  - Otseülekande mõõdikud ja reaalajas silumine
  - Õppe aeg 40–50 minutit tootmiskõlblike mustritega

- **🔐 Autentimis- ja turvamustrid**: failis `docs/getting-started/authsecurity.md`:
  - 3 autentimismustrit (ühendusstringid, Key Vault, hallatav identiteet)
  - Täielikud Bicep infrastruktuuri mallid turvaliseks juurutamiseks
  - Node.js rakenduse kood Azure SDK integreerimisega
  - 3 täielikku harjutust (haldatava identiteedi lubamine, kasutaja määratud identiteet, Key Vaulti pööramine)
  - Turvalisuse parimad tavad ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kuluanalüüs
  - Tootmiskõlblikud paroolivabad autentimismustrid

- **🤖 Mitmeagendi koordineerimise mustrid**: failis `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineerimise mustrit (järjestikune, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik orkestreeriva teenuse rakendus (Python/Flask, üle 1500 rea)
  - 3 spetsialiseeritud agendi rakendust (Uurija, Kirjutaja, Toimetaja)
  - Service Bus integreerimine sõnumite järjekorda panekuks
  - Cosmos DB oleku haldamine hajutatud süsteemide jaoks
  - 6 Mermaid diagrammi, mis näitavad agendi interaktsioone
  - 3 täiustatud harjutust (aegumise haldus, taaskatsetamise loogika, vooluahela lüliti)
  - Kulude jaotus (240-565 $ kuus) optimeerimisstrateegiatega
  - Application Insights integratsioon jälgimiseks

#### Täiustatud
- **Juurutamiseelne peatükk**: Nüüd sisaldab laialdast jälgimist ja koordineerimise mustreid
- **Alguse peatükk**: Täiustatud professionaalsete autentimismustritega
- **Tootmiskõlblikkus**: Täielik katvus turvalisusest jälgitavuseni
- **Kursuse ülesehitus**: Uuendatud viited uutele tundidele peatükkides 3 ja 6

#### Muudetud
- **Õppe edenemine**: Turvalisuse ja jälgimise parem integreerimine kogu kursuse vältel
- **Dokumentatsiooni kvaliteet**: Ühtsed A-klassi standardid (95-97%) uutes tundides
- **Tootmismustrid**: Täielik otsast lõpuni katvus ettevõtte juurutustele

#### Paranenud
- **Arendaja kogemus**: Selge tee arendusest tootmise jälgimiseni
- **Turvastandardid**: Professionaalsed mustrid autentimiseks ja saladuste haldamiseks
- **Jälgitavus**: Täielik Application Insights integratsioon koos AZD-ga
- **AI töökoormused**: Spetsialiseeritud jälgimine Microsoft Foundry mudelitele ja mitmeagendi süsteemidele

#### Kinnitatud
- ✅ Kõik tunnid sisaldavad täielikku töötavat koodi (mitte ainult fragmendid)
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19 3 tunni jooksul)
- ✅ Praktilised harjutused koos kontrollimisetappidega (kokku 9)
- ✅ Tootmiseks valmis Bicep mallid, mida saab juurutada käsuga `azd up`
- ✅ Kuluanalüüs ja optimeerimisstrateegiad
- ✅ Tõrkeotsingu juhendid ja parimad praktikad
- ✅ Teadmist kontrollivad punktid koos kinnituskäsudega

#### Dokumentatsiooni hindamise tulemused
- **docs/pre-deployment/application-insights.md**: - Põhjalik jälgimise juhend
- **docs/getting-started/authsecurity.md**: - Professionaalsed turvamustrid
- **docs/pre-deployment/coordination-patterns.md**: - Täiustatud mitmeagendi arhitektuurid
- **Üldine uus sisu**: - Ühtsed kõrge kvaliteediga standardid

#### Tehniline rakendus
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine
- **Autentimine**: Hallatav identiteet + Key Vault + RBAC mustrid
- **Mitmeagentne**: Service Bus + Cosmos DB + Container Apps + orkestreerimine
- **Jälgimine**: Otseülekande mõõdikud + Kusto päringud + hoiatused + armatuurlauad
- **Kulude haldus**: Proovimiseks sobivad strateegiad, säilituspoliitikad, eelarvekontroll

### [v3.7.0] - 2025-11-19

#### Dokumentatsiooni kvaliteedi parendused ja uus Microsoft Foundry mudelite näide
**See versioon täiustab dokumentatsiooni kvaliteeti kogu hoidlas ja lisab täieliku Microsoft Foundry mudelite juurutamise näite koos gpt-4.1 vestlusliidesega.**

#### Lisatud
- **🤖 Microsoft Foundry mudelite vestluse näide**: Täielik gpt-4.1 juurutus koos toimiva rakendusega failis `examples/azure-openai-chat/`:
  - Täielik Microsoft Foundry mudelite infrastruktuur (gpt-4.1 mudeli juurutamine)
  - Python'i käsurea vestlusliides vestlusajaloo salvestusega
  - Key Vault integreerimine turvaliseks API võtmete hoidmiseks
  - Tokeni kasutamise jälgimine ja kulude hindamine
  - Kiirusepiirang ja veahaldus
  - Põhjalik README koos 35-45 minuti pikkuse juurutamisjuhendiga
  - 11 tootmiskõlblikku faili (Bicep mallid, Python rakendus, konfiguratsioon)
- **📚 Dokumentatsiooni harjutused**: Lisatud praktilised harjutused konfiguratsioonijuhendisse:
  - Harjutus 1: Mitmekeskkondade konfiguratsioon (15 minutit)
  - Harjutus 2: Saladuste haldamise praktika (10 minutit)
  - Selged õnnestumis- ja kinnitusnõuded
- **✅ Juurutuse kinnitamine**: Lisatud kinnitamiselõik juurutamisjuhendisse:
  - Tervisekontrolli protseduurid
  - Edukriteeriumite nimekiri
  - Oodatavad väljundid kõigile juurutamiskäskudele
  - Kiire tõrkeotsingu juhend

#### Täiustatud
- **examples/README.md**: Uuendatud A-klassi kvaliteedile (93%):
  - Lisatud azure-openai-chat kõigisse asjakohastesse sektsioonidesse
  - Kohalike näidete arv tõstetud 3-lt 4-le
  - Lisatud AI rakenduste näidete tabelisse
  - Integreeritud kesktaseme algajatele mõeldud kiire alustamise juhendisse
  - Lisatud Microsoft Foundry mallide sektsiooni
  - Uuendatud võrdlusmaatriksit ja tehnoloogia leidmise sektsiooni
- **Dokumentatsiooni kvaliteet**: Paranenud B+ (87%) → A- (92%) kogu docs kaustas:
  - Lisatud oodatavad väljundid kriitilistele käsu näidetele
  - Lisatud konfiguratsiooni muudatuste kinnitusetapid
  - Täiustatud praktilist õpet praktiliste harjutustega

#### Muudetud
- **Õppe edenemine**: AI näidete parem integreerimine kesktaseme õppijatele
- **Dokumentatsiooni struktuur**: Rohkem teostatavaid harjutusi selgete tulemustega
- **Kinnitusprotsess**: Täpsed edukriteeriumid lisatud peamistele töövoogudele

#### Paranenud
- **Arendajakogemus**: Microsoft Foundry mudelite juurutamine võtab nüüd 35-45 minutit (varem 60-90 min keerukate alternatiivide puhul)
- **Kulude läbipaistvus**: Selged kuluarvutused (50–200 $ kuus) Microsoft Foundry mudelite näite jaoks
- **Õpperada**: AI arendajatele selge sisenemispunkt azure-openai-chatiga
- **Dokumentatsiooni standardid**: Ühtsed oodatavad väljundid ja kinnitusetapid

#### Kinnitatud
- ✅ Microsoft Foundry mudelite näide toimib täielikult koos `azd up`
- ✅ Kõik 11 rakendusfaili on süntaktiliselt korrektsed
- ✅ README juhised vastavad tegelikule juurutamiskogemusele
- ✅ Dokumentatsiooni lingid uuendatud üle 8+ asukohas
- ✅ Näidete indeks peegeldab õigesti 4 kohalikku näidet
- ✅ Tabelites pole duplikaatvälistlinke
- ✅ Kõik navigeerimisviited on korrektsed

#### Tehniline rakendus
- **Microsoft Foundry mudelite arhitektuur**: gpt-4.1 + Key Vault + Container Apps muster
- **Turvalisus**: Valmis haldatud identiteedi ja Key Vault saladustega
- **Jälgimine**: Application Insights integratsioon
- **Kulukontroll**: Tokeni jälgimine ja kasutuse optimeerimine
- **Juurutamine**: Ühe `azd up` käsuga täiskomplekti seadistus

### [v3.6.0] - 2025-11-19

#### Suur uuendus: Container App juurutamise näited
**See versioon tutvustab põhjalikke tootmiskõlblikke konteinerirakenduste juurutamise näiteid Azure Developer CLI (AZD) abil koos täieliku dokumentatsiooni ja integreerimisega õpperajale.**

#### Lisatud
- **🚀 Container App näited**: Uued kohalikud näited failis `examples/container-app/`:
  - [Meistri juhend](examples/container-app/README.md): Täielik ülevaade konteineripõhistest juurutustest, kiire stardi juhend, tootmine ja keerukamad mustrid
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): Algajasõbralik REST API, millel on skaaleerimine nullini, tervisekontrollid, jälgimine ja tõrkeotsing
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): Tootmiskõlbulik mitme teenuse juurutus (API värav, toode, tellimus, kasutaja, teavitused), asünkroonne sõnumside, Teenusebuss, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline/kanaari juurutus
- **Parimad tavad**: Konteinerikoormuste turvalisus, jälgimine, kulude optimeerimine ja CI/CD juhised
- **Koodinäited**: Täielikud `azure.yaml`, Bicep mallid ja mitmekeelsed teenuste rakendused (Python, Node.js, C#, Go)
- **Testimine ja tõrkeotsing**: Lõpp-lõpuni teststsenaariumid, jälgimiskäsud, tõrkeotsingu juhised

#### Muudatused
- **README.md**: Uuendatud uute konteinerirakenduste näidete ja linkidega jaotises "Kohalikud näited – konteinerirakendused"
- **examples/README.md**: Uuendatud, et rõhutada konteinerirakenduste näiteid, lisada võrdlustabeli kirjed ja uuendada tehnoloogia/arhitektuuri viiteid
- **Kursuse ülevaade ja õppejuhend**: Uuendatud viited uutele konteinerirakenduste näidetele ja juurutusmustritele asjakohastes peatükkides

#### Kinnitatud
- ✅ Kõik uued näited on juurutatavad `azd up` abil ja järgivad parimaid tavasid
- ✅ Dokumentatsiooni ristviited ja navigeerimine on uuendatud
- ✅ Näited katavad algaja kuni täiustatud stsenaariumid, sealhulgas tootmise mikroteenused

#### Märkused
- **Ulatus**: Ainult ingliskeelne dokumentatsioon ja näited
- **Järgmised sammud**: Tulevikus laiendada täiendavate edasijõudnud konteinerimustrite ja CI/CD automatiseerimisega

### [v3.5.0] - 2025-11-19

#### Tootemärgi ümbernimetamine: Microsoft Foundry
**See versioon rakendab kogu ingliskeelses dokumentatsioonis täieliku tootemärgi nime muudatuse "Microsoft Foundry" → "Microsoft Foundry", peegeldades Microsofti ametlikku ümberbrändimist.**

#### Muudatused
- **🔄 Tootenime uuendus**: Täielik ümberbrändimine "Microsoft Foundry" nimele
  - Uuendatud kõik ingliskeelses dokumentatsioonis olevad viited kaustas `docs/`
  - Kausta ümbernimetamine: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili ümbernimetamine: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kokku: 23 sisuviidet värskendatud 7 dokumentatsioonifailis

- **📁 Kausta struktuuri muudatused**:
  - `docs/ai-foundry/` nimetati ümber `docs/microsoft-foundry/`
  - Kõik ristviited uuendatud vastavalt uuele kausta struktuurile
  - Navigeerimislingid kinnitatud kogu dokumentatsioonis

- **📄 Failide ümbernimetamine**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kõik sisemised lingid uuendatud, et viidata uuele failinimele

#### Uuendatud failid
- **Peatükkide dokumentatsioon** (7 faili):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tootemärgi viite uuendust
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasutab juba Microsoft Foundry’d (eelnevate uuenduste tulemus)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viite uuendust (ülevaade, kogukonna tagasiside, dokumentatsioon)
  - `docs/getting-started/azd-basics.md` - 4 ristviidete uuendust
  - `docs/getting-started/first-project.md` - 2 peatüki navigeerimislingi uuendust
  - `docs/getting-started/installation.md` - 2 järgmise peatüki lingi uuendust
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viite uuendust (navigeerimine, Discord kogukond)
  - `docs/troubleshooting/common-issues.md` - 1 navigeerimislingi uuendus
  - `docs/troubleshooting/debugging.md` - 1 navigeerimislingi uuendus

- **Kursuse struktuuri failid** (2 faili):
  - `README.md` - 17 viite uuendust (kursuse ülevaade, peatükkide pealkirjad, malliosa, kogukonna mõtted)
  - `course-outline.md` - 14 viite uuendust (ülevaade, õppimise eesmärgid, peatükkide ressursid)

#### Kinnitatud
- ✅ Null allesjäänud "ai-foundry" kausta rada-viiteid ingliskeelses dokumentatsioonis
- ✅ Null allesjäänud "Microsoft Foundry" tootemärgi nimi viiteid ingliskeelses dokumentatsioonis
- ✅ Kõik navigeerimislingid töötavad uue kausta struktuuriga
- ✅ Faili- ja kausta ümbernimetused lõpetatud edukalt
- ✅ Peatükkide vaheline ristviidete kontrollitud toimimine

#### Märkused
- **Ulatus**: Muudatused rakendatud ainult ingliskeelsele dokumentatsioonile kaustas `docs/`
- **Tõlked**: Tõlkekaustasid (`translations/`) selles versioonis ei uuendatud
- **Töötoad**: Töötoa materjale (`workshop/`) selles versioonis ei uuendatud
- **Näited**: Näitenimed võivad veel viidata vanale nimetusele (aadressitakse tulevases uuenduses)
- **Välislingid**: Väline URL-id ja GitHubi repositooriumi viited jäid muutumatuks

#### Migratsioonijuhend kaastöötajatele
Kui teil on kohalikud harud või dokumentatsioon vanale struktuurile viitamaks:
1. Uuendage kausta viited: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uuendage faili viited: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Asendage tootemärgi nimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Kontrollige, et kõik sisemised dokumentatsiooni lingid töötavad endiselt

---

### [v3.4.0] - 2025-10-24

#### Tootmiskeskkonna eelvaate ja valideerimise täiustused
**See versioon lisab tervikliku toe uuele Azure Developer CLI eelvaate funktsioonile ning parandab töötoa kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Terviklik ülevaade uuest infrastruktuuri eelvaate võimekusest
  - Käsuviite ja kasutusnäidete ülevaade kiiretabelis
  - Üksikasjalik integreerimine varustamisjuhendis koos kasutusjuhtude ja eelistega
  - Eelkontrolli integratsioon turvalisema juurutamise valideerimiseks
  - Alustamisjuhised uuendatud turvalisusele orienteeritud juurutamise tavadega
- **🚧 Töötoa oleku bänner**: Professionaalne HTML-bänner, mis näitab töötoa arenduse staatust
  - Gradientdisain koos ehitusmärkidega selgeks kasutajale suhtlemiseks
  - Viimane uuendamise aeg läbipaistvuse tagamiseks
  - Mobiilseadme sõbralik disain kõigi seadmetüüpide jaoks

#### Täiustatud
- **Infrastruktuuri turvalisus**: Eelvaate funktsionaalsus integreeritud kogu juurutusdokumentatsiooni
- **Enne juurutamist valideerimine**: Automatiseeritud skriptid sisaldavad nüüd infrastruktuuri eelvaate testimist
- **Arendaja töövoog**: Käskude järjestus uuendatud, et hõlmata eelvaadet kui parimat tava
- **Töötoa kasutajakogemus**: Kasutajatele seatud selged ootused sisu arendamise oleku kohta

#### Muudetud
- **Juurutuse parimad tavad**: Eelvaate-eesmärkne töövoog soovitatavaks praktikaks
- **Dokumentatsiooni voog**: Infrastruktuuri valideerimine viidud õppimise protsessis varasemaks
- **Töötoa esitlus**: Professionaalne oleku infovahetus selge arenduse ajajoonena

#### Parendatud
- **Turvalisusele orienteeritud lähenemine**: Infrastruktuuri muudatused saab nüüd enne juurutamist valideerida
- **Meeskonnatöö**: Eelvaate tulemusi saab jagada ülevaatuseks ja kinnituseks
- **Kulutõhusus**: Ressursside kulude parem mõistmine enne varustamist
- **Riskide vähendamine**: Juurutuse ebaõnnestumiste vähendamine testimise abil

#### Tehniline rakendus
- **Mitme dokumendi integreerimine**: Eelvaate funktsioone dokumenteeritud 4 põhifailis
- **Käskude mustrid**: Ühtlane süntaks ja näited kogu dokumentatsioonis
- **Parimate tavade integratsioon**: Eelvaade kaasatud valideerimisprotsessidesse ja skriptidesse
- **Visuaalsed märgistused**: Uute funktsioonide selged märgised avastatavuse parandamiseks

#### Töötoa infrastruktuur
- **Staatusinfo**: Professionaalne HTML-bänner gradientseadistusega
- **Kasutajakogemus**: Selged arenduse oleku juhised segaduse vältimiseks
- **Professionaalne esitlus**: Säilitab repositsiooni usaldusväärsuse ning seab ootused
- **Ajaskaala läbipaistvus**: Okt 2025 viimane uuendus aja märk

### [v3.3.0] - 2025-09-24

#### Täiustatud töötoa materjalid ja interaktiivne õppe-kogemus
**See versioon toob kaasa terviklikud töötoa materjalid, mis sisaldavad brauseripõhiseid interaktiivseid juhendeid ja struktureeritud õpperadasid.**

#### Lisatud
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötoa kogemus koos MkDocs eelvaate võimekusega
- **📝 Struktureeritud töötoa juhised**: 7-astmeline juhendatud õpperada avastamisest kohandamiseni
  - 0-Sissejuhatus: Töötoa ülevaade ja seadistus
  - 1-Vali tehisintellekti mall: Malle avastamise ja valimise protsess
  - 2-Kinnita tehisintellekti mall: Juurutus- ja valideerimisprotseduurid
  - 3-Lammutai tehisintellekti mall: Malli arhitektuuri mõistmine
  - 4-Konfigureeri tehisintellekti mall: Konfiguratsioon ja kohandamine
  - 5-Kohanda tehisintellekti mall: Täiustatud muutmised ja iteratsioonid
  - 6-Kaota infrastruktuur: Koristus ja ressursside haldus
  - 7-Kokkuvõte: Ülevaade ja järgmised sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfiguratsioon koos Material teemaga parendatud õppe-kogemuseks
- **🎯 Praktiseerimine õppe rajal**: 3-astmeline metoodika (Avastus → Juurutus → Kohandamine)
- **📱 GitHub Codespaces integratsioon**: Sujuv arenduskeskkonna seadistus

#### Täiustatud
- **Tehisintellekti töötoa labor**: Laiendatud terviklikuks 2–3-tunniseks struktureeritud õppe kogemuseks
- **Töötoa dokumentatsioon**: Professionaalne esitlus koos navigeerimise ja visuaalsete abivahenditega
- **Õppe edenemine**: Selged samm-sammult juhised mallide valimisest tootmisjuurutuseni
- **Arendaja kogemus**: Integreeritud tööriistad sujuvamaks arendusvoogudeks

#### Parendatud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimisfunktsiooni ja teema valikuga
- **Isetemponeeruv õpe**: Paindlik töötoa struktuur, mis sobib erineva õpitempojaga kasutajatele
- **Praktiline rakendus**: Reaalse maailma tehisintellekti malli juurutusstsenaariumid
- **Kogukonna integreerimine**: Discord integreeritud töötoa toe ja koostöö jaoks

#### Töötoa funktsioonid
- **Sisseehitatud otsing**: Kiire märksõnade ja õppetundide leidmine
- **Kopeeri koodiplokid**: Hiirega üle minnes kopeerimise funktsioon kõigi koodinäidete juures
- **Teema vahetamine**: Tume/heledateemade tugi erinevate eelistuste jaoks
- **Visuaalsed materjalid**: Ekraanitõmmised ja skeemid parema mõistmise jaoks
- **Abi integreerimine**: Otsene juurdepääs Discordi kogukonnatoele

### [v3.2.0] - 2025-09-17

#### Peamine navigeerimise restruktureerimine ja peatükkidel põhinev õppesüsteem
**See versioon lisab tervikliku peatükkidel põhineva õppesüsteemi koos täiustatud navigeerimisega kogu repositooriumis.**

#### Lisatud
- **📚 Peatükkidel põhinev õppesüsteem**: Terve kursus on ümber korraldatud 8 järkjärgulisse õppepeatükki
  - Peatükk 1: Alused ja kiirstart (⭐ - 30–45 minutit)
  - Peatükk 2: AI-esmane arendus (⭐⭐ - 1–2 tundi)
  - Peatükk 3: Konfiguratsioonid ja autentimine (⭐⭐ - 45–60 minutit)
  - Peatükk 4: Infrastruktuur koodina ja juurutus (⭐⭐⭐ - 1–1,5 tundi)
  - Peatükk 5: Mitmeagendi AI lahendused (⭐⭐⭐⭐ - 2–3 tundi)
  - Peatükk 6: Juurutuse-eelne valideerimine ja planeerimine (⭐⭐ - 1 tund)
  - Peatükk 7: Tõrkeotsing ja silumine (⭐⭐ - 1–1,5 tundi)
  - Peatükk 8: Tootmise ja ettevõtte mustrid (⭐⭐⭐⭐ - 2–3 tundi)
- **📚 Terviklik navigeerimissüsteem**: Ühtsed navigeerimispealkirjad ja jalused kogu dokumentatsioonis
- **🎯 Edenemise jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppe kinnitussüsteem
- **🗺️ Õpperaja juhised**: Selged alguspunktid erinevate kogemus- ja eesmärgitasemete jaoks
- **🔗 Ristviidete navigeerimine**: Selgelt seotud peatükid ja eeltingimused

#### Täiustatud
- **README struktuur**: Muudetud struktureeritud õppeplatvormiks koos peatükkide organiseerimisega
- **Dokumentatsiooni navigeerimine**: Iga lehekülg sisaldab nüüd peatüki konteksti ja edenemise juhiseid
- **Mallide organiseerimine**: Näited ja mallid seostatud sobivate õppepeatükkidega
- **Ressursside integreerimine**: Kiirlehed, KKK-d ja õppejuhendid seotud asjakohaste peatükkidega
- **Töötoa integreerimine**: Käed-küljes laborid seotud mitme peatüki õpieesmärkidega

#### Muudetud
- **Õppe edenemine**: Liikus lineaarse dokumentatsioonilt paindlikule peatükkidepõhisele õppele
- **Konfiguratsiooni asukoht**: Konfiguratsioonijuhend paigutatud paremaks õppevooguks peatükki 3
- **AI sisu integratsioon**: AI-spetsiifiline sisu paremini integreeritud kogu õppeprotsessis
- **Tootmisesisu**: Täiustatud mustrid koondatud peatükki 8 ettevõtte õppijatele

#### Parendatud
- **Kasutajakogemus**: Selged navigeerimise sõrmjäljed ja peatüki edenemise märgistused
- **Juurdepääsetavus**: Ühtsed navigeerimismustrid mugavamaks kursuse läbimiseks
- **Professionaalne esitlus**: Ülikoolistiilis kursuse struktuur sobilik akadeemiliseks ja ettevõttesisekoolituseks
- **Õppimise tõhusus**: Vähenenud aeg asjakohase sisu leidmiseks tänu paremale organiseerimisele

#### Tehniline rakendus
- **Navigeerimispealkirjad**: Ühtlustatud peatükkide navigeerimine rohkem kui 40 dokumentatsioonifailis
- **Jalusenavigatsioon**: Ühtsed edenemise juhendid ja peatükkide lõpetamise näidikud
- **Ristlinkimine**: Terviklik siseviidete süsteem seotud mõistetega
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õpieesmärkidega

#### Õppejuhendi täiustamine
- **📚 Terviklikud õpieesmärgid**: Õppejuhend ümber korraldatud vastavalt 8-peatükkilisele süsteemile
- **🎯 Peatükkidel põhinev hindamine**: Igas peatükis spetsiifilised õpieesmärgid ja praktilised harjutused
- **📋 Edenemise jälgimine**: Nädalane õppimise ajakava mõõdetavate tulemustega ja lõpetamise kontrollnimekirjadega
- **❓ Hindamisküsimused**: Iga peatüki teadmiste valideerimise küsimused professionaalsete tulemuste jaoks
- **🛠️ Praktilised harjutused**: Käed-küljes tegevused reaalse juurutusstsenaariumiga ja tõrkeotsinguga
- **📊 Osakuse edenemine**: Selge areng alustaladest ettevõtte mustriteni karjäärikeskse fookusega
- **🎓 Sertifitseerimisraamistik**: Professionaalne areng ja kogukonna tunnustamine
- **⏱️ Ajakava juhtimine**: Struktureeritud 10-nädalane õppimisplaan verstapostide kontrolliga

### [v3.1.0] - 2025-09-17

#### Täiustatud mitmeagendi tehisintellekti lahendused
**See versioon parandab mitmeagendi jaekaubanduse lahendust paremate agendi nimede ja täiustatud dokumentatsiooniga.**

#### Muudatused
- **Mituagendiline terminoloogia**: Asendatud "Cora agent" termini "Kliendi agendiga" kogu jaemüügi mitmeagendilises lahenduses selgema arusaamise tagamiseks
- **Agendi arhitektuur**: Uuendatud kogu dokumentatsioon, ARM-mallid ja koodinäited, et kasutada järjepidevat "Kliendi agendi" nimetust
- **Konfiguratsiooni näited**: Moderniseeritud agendi konfiguratsioonimustrid koos uuendatud nimetuskombinatsioonidega
- **Dokumentatsiooni järjepidevus**: Tagatud, et kõik viited kasutavad professionaalseid ja kirjeldavaid agendi nimesid

#### Täiustatud
- **ARM-malli pakett**: Uuendatud retail-multiagent-arm-template koos Kliendi agendi viidetega
- **Arhitektuuri diagrammid**: Värskendatud Mermaid diagrammid koos uuendatud agendi nimetustega
- **Koodi näited**: Python klassid ja rakendusnäited kasutavad nüüd CustomerAgent nimetust
- **Keskkonnamuutujad**: Uuendatud kõik juurutusskriptid, kasutades CUSTOMER_AGENT_NAME konventsioone

#### Parandatud
- **Arendajakogemus**: Selgemad agendi rollid ja vastutused dokumentatsioonis
- **Tootmisküpse valmisolek**: Parem joondus ettevõtte nimetamisstandardeid järgides
- **Õppematerjalid**: Intuitiivsem agendi nimetamine õppeotstarbeks
- **Malli kasutatavus**: Lihtsustatud agendi funktsioonide ja juurutusmustrite mõistmine

#### Tehnilised üksikasjad
- Uuendatud Mermaid arhitektuuri diagrammid koos CustomerAgent viidetega
- Asendatud CoraAgent klassinimed Python näidetes CustomerAgent nimedega
- Muudetud ARM malli JSON konfiguratsioonid, kasutades "customer" agendi tüüpi
- Uuendatud keskkonnamuutujad CORA_AGENT_* pealt CUSTOMER_AGENT_* mustrile
- Värskendatud kõik juurutuskäsud ja konteineri konfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Peamised muudatused - AI arendajate fookus ja Microsoft Foundry integratsioon
**See versioon muudab hoidla kõikehõlmavaks tehisintellektipõhiseks õppeallikaks koos Microsoft Foundry integratsiooniga.**

#### Lisatud
- **🤖 AI-esmane õpitee**: Täielik ümberkorraldus, prioriteediks AI arendajad ja insenerid
- **Microsoft Foundry integratsioonijuhend**: Ulatuslik dokumentatsioon AZD ühendamiseks Microsoft Foundry teenustega
- **AI mudeli juurutusmustrid**: Detailne juhend mudeli valiku, konfiguratsiooni ja tootmisse juurutamise strateegiate kohta
- **AI töötuba labor**: 2–3-tunnine praktiline töötuba AI rakenduste konverteerimiseks AZD kaudu juurutatavaks lahenduseks
- **Tootmise AI parimad tavandid**: Ettevõttevalmis mustrid AI töökoormuste skaleerimiseks, jälgimiseks ja turvamiseks
- **AI-spetsiifiline tõrkeotsing**: Ulatuslik tõrkeotsingu juhend Microsoft Foundry mudelite, kognitiivsete teenuste ja AI juurutusprobleemide jaoks
- **AI malli kogu**: Esiletõstetud Microsoft Foundry mallide kollektsioon koos keerukuse hinnangutega
- **Töötubade materjalid**: Täielik töötubade struktuur praktiliste laborite ja viitematerjalidega

#### Täiustatud
- **README struktuur**: AI arendaja fookusega, sisaldades 45% kogukonna huvi andmeid Microsoft Foundry Discordist
- **Õppeteed**: Pühendatud AI arendaja teekond koos traditsiooniliste õppeteedega õpilastele ja DevOps inseneridele
- **Malli soovitused**: Esiletõstetud AI mallid nagu azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Kogukonna integratsioon**: Täiustatud Discord kogukonna tugi AI-spetsiifiliste kanalite ja aruteludega

#### Turvalisus & tootmisküpsus
- **Hallatud identiteedi mustrid**: AI-spetsiifilised autentimis- ja turvakonfiguratsioonid
- **Kuluoptimeerimine**: Märkide kasutuse jälgimine ja eelarvete kontroll AI töökoormustele
- **Mitme regiooni juurutus**: Globaalse AI rakenduse juurutusstrateegiad
- **Jõudluse jälgimine**: AI-spetsiifilised mõõdikud ja Application Insights integratsioon

#### Dokumentatsiooni kvaliteet
- **Lineaarne kursuse struktuur**: Loogiline edenemine algajast kuni täiustatud AI juurutusmustriteni
- **Kinnitatud URL-id**: Kõik välised hoidla lingid on kontrollitud ja ligipääsetavad
- **Täpne viitamine**: Kõigi sise-dokumentatsiooni linkide valideerimine ja töökorras olek
- **Tootmisküps**: Ettevõtte juurutusmustrid koos reaalse elu näidetega

### [v2.0.0] - 2025-09-09

#### Peamised muudatused - hoidla struktuuri ja professionaalse täiustamise ümberkorraldus
**See versioon tähistab hoidla struktuuri ja sisu esituse olulist uuendust.**

#### Lisatud
- **Struktureeritud õppe raamistik**: Kõik dokumentatsiooni lehed sisaldavad nüüd Sissejuhatus, Õpieesmärgid ja Õpiväljundid osi
- **Navigeerimissüsteem**: Lisatud Eelmine/Järgmine õppetükk lingid kogu dokumentatsiooni ulatuses suunatud õppe edenemise jaoks
- **Õppematerjal**: Ulatuslik study-guide.md koos õpieesmärkide, harjutuste ja hindamisvahenditega
- **Professionaalne esitlus**: Kõik emotikonid eemaldatud parema ligipääsetavuse ja professionaalse välimuse tagamiseks
- **Täiendatud sisustruktuur**: Õppematerjalide parema korralduse ja sujuvuse saavutamine

#### Muudetud
- **Dokumentatsiooni vorming**: Kõik dokumentatsioonistandardid ühtlustatud õppimisele keskenduva struktuuriga
- **Navigeerimisvoog**: Laiendatud loogilist edenemist kogu õppematerjali ulatuses
- **Sisu esitlus**: Eemaldatud dekoratiivsed elemendid, eelistades selget ja professionaalset vormindust
- **Linkide struktuur**: Uuendatud kõik siseviited, et toetada uut navigeerimissüsteemi

#### Parandatud
- **Ligipääsetavus**: Eemaldatud emotikonide sõltuvused paremaks ekraanilugerite ühilduvuseks
- **Professionaalne välimus**: Puhtad, akadeemilise stiiliga esitlused sobivad ettevõtte õppimiseks
- **Õppimiskogemus**: Struktureeritud lähenemine, selgete eesmärkide ja väljunditega iga õppetunni puhul
- **Sisu korraldus**: Paranenud loogiline vool ja ühendused seotud teemade vahel

### [v1.0.0] - 2025-09-09

#### Esialgne väljaanne - Kõikehõlmav AZD õppimise hoidla

#### Lisatud
- **Põhidokumentatsiooni struktuur**
  - Täielik juhend algajatele
  - Ulatuslik dokumentatsioon juurutuste ja provisioning’i kohta
  - Detailne tõrkeotsingu ja silumise juhendus
  - Enne juurutust valideerimise tööriistad ja protseduurid

- **Alustamisosa**
  - AZD põhialused: põhimõisted ja terminoloogia
  - Paigaldusjuhend: platvormispetsiifilised seadistusinstruktsioonid
  - Konfiguratsiooni juhend: keskkonna seadistus ja autentimine
  - Esimene projekt: samm-sammuline praktiline juhend

- **Juurutus- ja provisioning osa**
  - Juurutusjuhend: täielik töövoo dokumentatsioon
  - Provisioning juhend: infrastruktuur koodina Bicep abil
  - Parimad tavad tootmise juurutusteks
  - Mitme-teenuse arhitektuuri mustrid

- **Enne juurutust valideerimise osa**
  - Mahuplaanimine: Azure ressursside saadavuse valideerimine
  - SKU valik: ulatuslik teenuse taseme juhend
  - Eelpõhivaatlused: automatiseeritud valideerimisskriptid (PowerShell ja Bash)
  - Kuluarvutuse ja eelarve planeerimise tööriistad

- **Tõrkeotsingu osa**
  - Levinud probleemid: sagedasemad probleemid ja lahendused
  - Silumise juhend: süsteemsed tõrkeotsingu meetodid
  - Täiustatud diagnostikatehnikad ja tööriistad
  - Jõudluse jälgimine ja optimeerimine

- **Vahendid ja viited**
  - Käsurea abileht: kiire viide olulistele käskudele
  - Sõnastik: ulatuslik terminite ja lühendite määratlus
  - KKK: detailne vastus sagedastele küsimustele
  - Välised ressursid ja kogukonna ühendused

- **Näited ja mallid**
  - Lihtne veebi rakenduse näide
  - Staatilise veebisaidi juurutusmall
  - Konteineripõhise rakenduse konfiguratsioon
  - Andmebaasi integratsiooni mustrid
  - Mikroteenuste arhitektuuri näited
  - Serverivabad funktsioonide rakendused

#### Omadused
- **Mitme platvormi tugi**: Windows, macOS ja Linux paigaldus- ja seadistusjuhendid
- **Mitmed oskustasemed**: Sisu kavandatud õpilastest kuni professionaalsete arendajateni
- **Praktiline fookus**: Praktikapõhised näited ja reaalsed stsenaariumid
- **Kõikehõlmav katvus**: Alates põhimõistetest kuni täiustatud ettevõtte mustriteni
- **Turvalisuse esiplaanile seadmine**: Turvalisuse parimad tavad integreeritud kogu jooksul
- **Kuluoptimeerimine**: Juhised kulutõhusate juurutuste ja ressursside haldamise kohta

#### Dokumentatsiooni kvaliteet
- **Detailsemad koodinäited**: Praktilised, testitud koodinäited
- **Samm-sammult juhised**: Selged, rakendatavad juhised
- **Kõikehõlmav vigade käsitlemine**: Levinud probleemide tõrkeotsing
- **Parimate tavade integreerimine**: Tööstusstandardid ja soovitused
- **Versioonide ühilduvus**: Ajakohane Azure teenuste ja azd funktsioonidega

## Kavandatud tulevased täiustused

### Versioon 3.1.0 (Kavandatud)
#### AI platvormi laiendus
- **Mitme mudeli tugi**: Integreerimismustrid Hugging Face, Azure Machine Learning ja kohandatud mudelite jaoks
- **AI agentide raamistikud**: Mallid LangChain, Semantic Kernel ja AutoGen juurutusteks
- **Täiustatud RAG mustrid**: Vektorandmebaasi võimalused Azure AI Search’i kõrval (Pinecone, Weaviate jne)
- **AI jälgitavus**: Täiustatud monitorimine mudeli jõudluse, märkide kasutuse ja vastuste kvaliteedi kohta

#### Arendajakogemus
- **VS Code laiendus**: Integreeritud AZD + Microsoft Foundry arenduskogemus
- **GitHub Copilot integratsioon**: AI abistatud AZD mallide genereerimine
- **Interaktiivsed juhendid**: Praktilised kodeerimisharjutused koos automatiseeritud valideerimisega AI stsenaariumide jaoks
- **Video sisu**: Lisatuutorid visuaalsetele õppijatele AI juurutustele keskendudes

### Versioon 4.0.0 (Kavandatud)
#### Ettevõtte AI mustrid
- **Juhtimismudel**: AI mudelite haldus, järgimine ja auditeerimisteed
- **Mitme üürnikuga AI**: Mustrid mitme kliendi teenindamiseks isoleeritud AI teenustega
- **Edge AI juurutus**: Integratsioon Azure IoT Edge ja konteinerite juurutustega
- **Hübriidpilve AI**: Mitme pilve ja hübriidjuurutusmustrite toetamine AI töökoormustele

#### Täiustatud funktsioonid
- **AI torujuhtme automatiseerimine**: MLOps integratsioon Azure Machine Learning torujuhtmetega
- **Täiustatud turvalisus**: Nullusaldusmustrid, privaatotsad ja täiustatud ohutõrje
- **Jõudluse optimeerimine**: Täiustatud häälestus- ja skaleerimisstrateegiad suure läbilaskevõimega AI rakendustele
- **Globaalse levitamise**: Sisu edastamine ja edge-vahemälu mustrid AI rakendustele

### Versioon 3.0.0 (Kavandatud) - Üle trükitud praeguse väljalasuga
#### Kavandatud lisandused - Nüüd rakendatud versioonis v3.0.0
- ✅ **AI-keskne sisu**: Täielik Microsoft Foundry integratsioon (Lõpetatud)
- ✅ **Interaktiivsed juhendid**: Praktiline AI töötuba labor (Lõpetatud)
- ✅ **Täiustatud turvamoodul**: AI-spetsiifilised turvamustrid (Lõpetatud)
- ✅ **Jõudluse optimeerimine**: AI töökoormuste häälestusstrateegiad (Lõpetatud)

### Versioon 2.1.0 (Kavandatud) - Osaliselt rakendatud versioonis v3.0.0
#### Väiksemad täiustused - Mõned lõpetatud praeguses versioonis
- ✅ **Täiendavad näited**: AI-keskse juurutusstsenaariumid (Lõpetatud)
- ✅ **Laiendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsing (Lõpetatud)
- **Tööriistade integratsioon**: Täiustatud IDE ja redaktori integratsioonijuhendid
- ✅ **Jälgimise laiendus**: AI-spetsiifilised jälgimis- ja häiremustrid (Lõpetatud)

#### Endiselt kavandatud tulevaseks väljaandeks
- **Mobiilisõbralik dokumentatsioon**: Vastuvõtlik kujundus mobiiliõppe jaoks
- **Võimalus töötada võrguühenduseta**: Allalaaditavad dokumentatsioonipaketid
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogude jaoks
- **Kogukonna juhtpaneel**: Reaalajas kogukonna mõõdikud ja panuse jälgimine

## Panustamine muudatuslogisse

### Muudatuste teatamine
Kui panustate sellesse hoidla, siis palun veenduge, et muudatuslogi kirjed sisaldavad:

1. **Versiooni number**: Vastavalt semantilisele versioonihaldusele (peamine.väike.parandus)
2. **Kuupäev**: Väljalaske või uuenduskuupäev vormingus AAAA-KK-PP
3. **Kategooria**: Lisatud, Muudetud, Aegunud, Eemaldatud, Parandatud, Turvalisus
4. **Selge kirjeldus**: Lühike ja konkreetne muudatuse kirjeldus
5. **Mõjuhinnang**: Kuidas muudatused mõjutavad olemasolevaid kasutajaid

### Muudatuste kategooriad

#### Lisatud
- Uued funktsioonid, dokumentatsiooni osad või võimekused
- Uued näited, mallid või õpperessursid
- Täiendavad tööriistad, skriptid või utiliidid

#### Muudetud
- Muudatused olemasolevates funktsioonides või dokumentatsioonis
- Uuendused selguse või täpsuse parandamiseks
- Sisu või korralduse ümberkujundamine

#### Aegunud
- Funktsioonid või lähenemised, mida järkjärgult kaotatakse
- Dokumentatsiooni osad, mis on planeeritud eemaldamiseks
- Meetodid, millel on paremad alternatiivid

#### Eemaldatud
- Funktsioonid, dokumentatsioon või näited, mis pole enam asjakohased
- Aegunud või aegunud lähenemised
- Liigne või koondatud sisu

#### Parandatud
- Parandused dokumentatsiooni või koodi vigades
- Teatatud probleemide või vigade lahendused
- Täpsuse või funktsionaalsuse parandused

#### Turvalisus
- Turvaseotud täiustused või parandused
- Turvalise töökorra parimate tavade uuendused
- Turvaaukude lahendused

### Semantilise versioonihalduse juhised

#### Peamine versioon (X.0.0)
- Murdelised muudatused, mis nõuavad kasutajate tegevust
- Olulised sisu või korralduse ümberkorraldused
- Muudatused, mis muudavad põhimeetodit või lähenemist

#### Väike versioon (X.Y.0)
- Uued funktsioonid või sisulised täiendused
- Täiustused, mis tagavad varasema ühilduvuse
- Täiendavad näited, tööriistad või ressursid

#### Parandusversioon (X.Y.Z)
- Veaparandused ja korrektsioonid
- Väiksemad täiustused olemasolevale sisule
- Selgitused ja väiksemad parandused

## Kogukonna tagasiside ja ettepanekud

Julgustame aktiivselt kogukonna tagasisidet selle õppeallika täiustamiseks:

### Kuidas anda tagasisidet
- **GitHub probleemid**: Teata probleemidest või soovita täiustusi (AI-spetsiifilised probleemid on teretulnud)
- **Discord arutelud**: Jaga ideid ja osale Microsoft Foundry kogukonnas
- **Pull request’id**: Panusta otseseid täiustusi sisule, eriti AI mallidele ja juhenditele
- **Microsoft Foundry Discord**: Osale #Azure kanalil AZD + AI aruteludes
- **Kogukonna foorumid**: Osale laiemates Azure arendajate aruteludes

### Tagasiside kategooriad
- **AI sisu täpsus**: Parandused AI teenuste integratsiooni ja juurutuse infole
- **Õppimiskogemus**: Soovitused AI arendajate õppimise parema voolu saavutamiseks
- **Puuduv AI sisu**: Taotlused täiendavate AI mallide, mustrite või näidete järele
- **Ligipääsetavus**: Täiustused mitmekesiste õpivajaduste jaoks
- **AI tööriistade integratsioon**: Soovitused parema AI arendusvoo integreerimise jaoks
- **Tootmise AI mustrid**: Ettevõtte AI juurutusskeemide taotlused

### Vastuse kohustus
- **Probleemide vastamine**: Teatatud probleemidele vastatakse 48 tunni jooksul
- **Funktsioonisoovid**: Hinnatakse nädalaga
- **Kogukonna panused**: Läbitakse nädalaga
- **Turvaprioriteedid**: Kohene prioriteet ja kiirendatud reageerimine

## Hooldusgraafik

### Regulaarne uuendamine
- **Igakuised ülevaated**: Sisu täpsuse ja linkide valideerimine
- **Kvartaliuuendused**: Suured sisulised lisandused ja täiustused
- **Poolaasta ülevaated**: Ulatuslik ümberkorraldus ja täiustamine
- **Aastased väljaanded**: Põhiversiooni uuendused märkimisväärsete täiustustega

### Jälgimine ja kvaliteedi tagamine
- **Automatiseeritud testimine**: Koodi näidete ja linkide regulaarne valideerimine
- **Kogukonna tagasiside integreerimine**: Kasutajate ettepanekute regulaarne kaasamine
- **Tehnoloogia uuendused**: Viimaste Azure teenuste ja azd väljaannetega kooskõlas
- **Juurdepääsetavuse auditid**: Regulaarne ülevaade kaasavate disaini põhimõtete kohta

## Versioonide toetuspoliitika

### Praeguse versiooni tugi
- **Viimane suurem versioon**: Täielik tugi regulaarselt uuendustega
- **Eelmine suurem versioon**: Turvauuendused ja kriitilised parandused 12 kuu jooksul
- **Pärandversioonid**: Ainult kogukonna tugi, ametlikke uuendusi ei ole

### Migratsiooni juhised
Suurte versioonide väljaandmisel pakume:
- **Migratsiooni juhendid**: Samm-sammult üleminekuinstruktsioonid
- **Ühilduvuse märkused**: Üksikasjad katkestavate muudatuste kohta
- **Tööriistade tugi**: Skriptid või tööriistad migratsiooni abistamiseks
- **Kogukonna tugi**: Pühendatud foorumid migratsiooniküsimustele

---

**Navigeerimine**
- **Eelmine õppetund**: [Õppejuhend](resources/study-guide.md)
- **Järgmine õppetund**: Tagasi [põhijuhendisse](README.md)

**Ole kursis**: Vaatle seda hoidlat, et saada teateid uute väljaannete ja õppematerjalide oluliste uuenduste kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
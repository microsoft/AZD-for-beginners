# Pokyčių žurnalas - AZD Pradedantiesiems

## Įvadas

Šis pokyčių žurnalas dokumentuoja visus reikšmingus pokyčius, atnaujinimus ir patobulinimus AZD Pradedantiesiems saugykloje. Laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį pokyčių žurnalą, jūs:
- Išliksite informuoti apie naujas funkcijas ir turinio papildymus
- Suprasite esamos dokumentacijos patobulinimus
- Seksite klaidų pataisas ir korekcijas, užtikrindami tikslumą
- Seksite mokymosi medžiagos evoliuciją laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pokyčių žurnalo įrašus, galėsite:
- Identifikuoti naują turinį ir mokymosi išteklius
- Suprasti, kurios skiltys buvo atnaujintos ar patobulintos
- Planuoti savo mokymosi kelią pagal naujausią medžiagą
- Teikti atsiliepimus ir pasiūlymus būsimam tobulinimui

## Versijų istorija

### [v3.24.0]- 2026-11-04

#### Ištaisyta
- Sutvarkyta anglų kalbos kurso navigacija, perkeltos puslapio nuorodos, pridėti trūkstami inkarai ir pašalintos pasenusios išorinės nuorodos, įskaitant 2 skyriaus nuorodą į gamybinio AI vadovą.
- Peržiūrėta esama gaires pagal išleistą AZD 1.37.2, agentus 1.0.0-beta.23 ir vertinimus 1.0.0-beta.2. Dokumentuotas atskiras `azd ai eval` darbo srautas ir optimizavimo konfigūracijos migracija.
- Pataisyti nepalaikomi CLI parametrai, autentifikacijos ribos, paprasto teksto aplinkos/slaptumo gairės, infrastruktūros atnaujinimai, modelio konfigūracija ir naikinimo atkūrimo pavyzdžiai.
- Atnaujintas dirbtuvės projektas pagal dabartinį AI agentų pavyzdį, įskaitant tikrus kablius, konfigūracijos įvestis, vertinimo testus, raudonos komandos įėjimo taškus ir observabiliumą.
- Pataisyti pavyzdžių įgyvendinimo teiginiai ir ištaisyti susiję programos/infrastruktūros/konfigūracijos klausimai. Mažmeninės prekybos architektūros medžiaga aiškiai atskirta nuo visiškai veikiančios programos.
- Atstatyta CodeQL kalbų matrica, pasirinkta palaikoma Node.js 24 versija kūrimo konteineryje ir sukurtos diegimo tikrinimo programos, pranešančios apie nesėkmingus versijų komandų vykdymus.

#### Pridėta
- Pridėtas tik anglų kalbos neprisijungus veikiantis nuorodų/inankarų tikrintuvas, regresijos testai ir dokumentacijos darbo eiga, kuri taip pat įveda dirbtuves griežto režimo sąlygomis. Sugeneruotos vertimų versijos ir išversti paveikslėliai neįtraukiami.

#### Tikrinimo apimtis
- Šaltinis, sintaksė, konfigūracija, vietinis elgesys ir tinklo nuorodų patikrinimai neužtikrina tiesioginio Azure diegimo galimybės, kvotos, RBAC, regioninio modelio prieinamumo, atsiskaitymo, saugumo atitikties ar gamybinio pasirengimo.
- Žemiau esantys senesni įrašai yra istoriniai įrašai, o ne dabartinės komandos ar leidimo instrukcijos.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 atnaujinimas: versijos aktualizavimas
**Ši versija patikrina kursą pagal `azd` `1.27.1` (2026 m. liepa, paskutinis stabilus leidimas) ir esamą peržiūros AI agento plėtinį `azure.ai.agents` `1.0.0-beta.5`, atnaujindama visas „patikrinta pagal“ žymas po 1.26.0, 1.27.0 ir 1.27.1 leidimų.**

#### Pakeista
- **✅ Atnaujintas tikrinimo bazinis lygis** nuo `azd 1.25.6` (2026 m. birželis) iki `azd 1.27.1` (2026 m. liepa) visame pagrindiniame README, visų skyrių README, 1 skyriaus kūrimo konteinerio pamokoje (įskaitant pavyzdžius su fiksuotomis versijomis), 4 skyriaus pritaikytų šablonų pamokoje, 5 skyriaus kelių agentų pamokoje ir dirbtuvių dokumentacijoje
- **🤖 2 skyriaus bazinis lygis atnaujintas** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.27.1` @`agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ir `microsoft-foundry-integration.md`; tikrinimo pastabų datos atnaujintos į 2026-07-13
- **🧩 AI agento plėtinyje pakeltas numeris** nuo `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` iki esamo `1.0.0-beta.5` leidimo 2 skyriuje README ir `agents.md`
- **🧪 Atnaujintas dirbtuvių tikrinimo pavyzdys** (`azd version` išvestis) iki `1.27.1`

#### Pastabos apie svarbius azd leidimus (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go palaikymas Azure Functions Flex Consumption, `azd config sub-filter` vienam nuomininkui skirtų prenumeratų filtrai, savarankiško plėtinio paketai (`azd x pack --bundle`) ir `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeliai Azure AI Foundry projektams/agentams tiesiogiai per `azure.yaml` (be Bicep/Terraform inicijavimo), konteinerio diegimo palaikymas App Service (`host: appservice` + `language: docker`), tiesioginės `-s/--source` komandų `azd extension` ir `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` parametras `azd extension install`, numatytuoju būdu pašalinti pasenę modeliai iš katalogo/kvotos užklausų ir keletas klaidų taisymų

#### Atnaujinti failai
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

#### Pradedančiųjų spragos užpildymas #2: šablonų kūrimas, kūrimo konteineriai, Pulumi, Azure DevOps, paslaugų principalai ir dar daugiau
**Ši versija užpildo likusias tarpinio lygio spragas, aptiktas azd aprėpties analizėje: kaip kurti ir publikuoti savo šabloną, atkuriami kūrimo konteinerių/Codespaces aplinkos, Pulumi infrastruktūros tiekėjas, Azure DevOps CI/CD gidas, paslaugų principalų autentifikacija, kompiuterio pasirinkimo gairės (AKS/Spring Apps), `azd restore`/`azd package` paaiškinimai, kablių klaidų tvarkymas ir komandos/bendrų aplinkų praktikos.**

#### Pridėta
- **🧱 Nauja 4 skyriaus pamoka** `docs/chapter-04-infrastructure/custom-templates.md` — savo azd šablono kūrimas: reikalinga struktūra (`azure.yaml`, `infra/`, `src/`), `metadata.template` laukas, infrastruktūros parametrizavimas su `uniqueString()` resurso žyma ir `azd-env-name` žyma, vietinis testavimas su `azd init --template <local-path>`, publikavimas į GitHub ir įtraukimas į Awesome AZD galeriją
- **📦 Nauja 1 skyriaus pamoka** `docs/chapter-01-foundation/dev-containers.md` — atkuriamos azd aplinkos su kūrimo konteineriais ir GitHub Codespaces: minimalus `.devcontainer/devcontainer.json` naudojant oficialią `ghcr.io/azure/azure-dev/azd` funkciją, kalbai specifinės funkcijos, `docker-in-docker` konteinerių priegloboms ir `azd auth login --use-device-code` nuotoliniam prisijungimui
- **🧩 Sekcija „Pulumi su azd“** `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi aplanko struktūra, stack’ai susieti su azd aplinkomis, privalomi išėjimai/žymėjimas ir identiškas `azd up` / `azd down` darbo srautas
- **🎯 Kompiuterio pasirinkimo gairės** `docs/chapter-04-infrastructure/provisioning.md` — pradedančiajam draugiškas palyginimas tarp `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ir `springapp`, gairės, kada rinktis AKS arba Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gidas** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, paslaugų ryšys su darbo krūvio tapatybės federacija (OIDC), sugeneruotas `azure-dev.yml` ir kintamųjų grupės nustatymai
- **🔑 Pridėti paslaugų principalai (modelis 4)** `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktyvi `azd auth login` su kliento slaptumu vs. federuotomis/OIDC paskyromis, kada naudoti ir saugus kredencialų saugojimas
- **🪝 Kablių klaidų tvarkymo** poskyris `docs/chapter-04-infrastructure/deployment-guide.md` — išeities kodai ir `set -e`, `continueOnError`, kablių izoliuotas testavimas su `azd hooks run`, OS specifinės komandinės eilutės ir `--debug`
- **👥 Komandos/bendrų aplinkų** skiltis `docs/chapter-03-configuration/configuration.md` — kas saugoma `.azure/`, ko ignoruoti git’e, kūrėjo specifinės aplinkos, `azd env list`/`select` ir aplinkos reikšmių pateikimas CI/CD metu
- **🧰 `azd restore` ir išplėstos `azd package`** paaiškinimai `resources/cheat-sheet.md` — priklausomybių atkūrimas ir diegiamas artefaktas be tiesioginio diegimo

#### Pakeista
- **🧭 4 skyriaus pamokų lentelė** atnaujinta, įtraukiant naują pamoką „Savo šablono kūrimas“ (3 pamoka)
- **🧭 1 skyriaus pamokų lentelė** atnaujinta, įtraukiant naują pamoką „Kūrimo konteineriai ir Codespaces“ (5 pamoka); navigacijos poraštės sujungtos tarp `bring-your-own-app.md` ir `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pradedančiųjų spragos užpildymas: praktinė kelių agentų pamoka, „Atsinešk savo programą“, Terraform ir CI/CD vadovas
**Ši versija užpildo didžiausias spragas pilname pradedančiųjų gide, pridėdama dvi naujas praktines pamokas (diegiama kelių agentų pamoka ir azd pridėjimas esamai programai), pradedančiajam draugišką kablių įvadą, Terraform su azd skyrių, nuoseklų GitHub Actions pipeline vadovą, peržiūros plėtinių paaiškinimą ir aiškią diegimo patvirtinimo kontrolinę sąrašą.**

#### Pridėta
- **🤝 Nauja 5 skyriaus pamoka** `docs/chapter-05-multi-agent/multi-agent-basics.md` — visiškai praktiška, diegiama dviejų agentų pamoka (organizatorius + specialistai), naudojant tikrą šabloną (`contoso-creative-writer`), apimanti kada naudoti kelių agentų sistemą, `azd up` darbo srautą, supratimą apie diegiamus resursus, kryžminį agentų sekimą, pritaikymą ir išvalymą
- **📦 Nauja 1 skyriaus pamoka** `docs/chapter-01-foundation/bring-your-own-app.md` — kaip pridėti azd prie esamo projekto naudojant `azd init` („naudok kodą einamajame kataloge“), supratimą apie `azure.yaml` ir `infra/`, `azd infra generate`, kompiuterio aptikimą ir diegimą su `azd up`
- **🌐 Terraform su azd** skyrius pridėtas į `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigūracija, `.tf` katalogo struktūra, būtini `AZURE_*` išėjimai ir `azd-env-name` žymėjimas, taip pat identiškas `azd up` / `azd down` darbo srautas (užpildo spragą, kai teigta apie Terraform palaikymą, bet parodytas tik Bicep)
- **⚙️ Nuoseklus GitHub Actions vadovas** `docs/chapter-08-production/production-ai-practices.md` — nuo GitHub repozitorijos iki automatizuotų diegimų: `azd pipeline config`, OIDC federuoti kredencialai (be saugomų slaptumo duomenų), sugeneruotas `azure-dev.yml` ir gairės dėl slaptažodžių ir kintamųjų naudojimo
- **🪝 Pradedančiųjų „Nauja kabliams?“ įvadas** `docs/chapter-04-infrastructure/deployment-guide.md` — kas yra kablis, kablio etapai, minimalus pirmas kablis ir kablių rankiniu būdu paleidimas su `azd hooks run`
- **✅ „Patikrinkite diegimą“ kontrolinis sąrašas** pridėtas 5-ame žingsnyje `docs/chapter-01-foundation/first-project.md` — pirminis testas, sveikatos patikra ir aiškūs sėkmės kriterijai
- **🧩 Naujų peržiūros plėtinių paaiškinimas** `azure.ai.skills` ir `azure.ai.connections` (kas tai yra ir kada juos naudoti) į `docs/chapter-08-production/production-ai-practices.md`

#### Pakeista
- **🧭 5 skyriaus pamokų lentelė** pataisyta: `multi-agent-basics.md` dabar yra 1 pamoka (vienintelė visiškai praktinė pamoka), su sąžiningu ženklinimu, kad 2 pamoka yra 6 skyriuje, o mažmeninės prekybos scenarijus yra architektūros planas, o ne vienos komandos šablonas
- **🧭 1 skyriaus pamokų lentelė** dabar apima naują pamoką „Atsinešk savo programą“ (4 pamoka)
- **🔗 Navigacijos poraštės** atnaujintos: `first-project.md` dabar jungia į priekį su `bring-your-own-app.md`

#### Pataisyta
- **🧱 Užtaisytas "pareikštas, bet trūkstamas" Terraform spraga** — anksčiau kursas nurodė Terraform palaikymą, tačiau jo nerodė
- **🔀 Ištaisyti klaidinantys 5 skyriaus kryžminiai saitai**, kurie tarsi rodė, kad egzistuoja pilna daugiagentė įgyvendinimo versija, kai buvo tik architektūros brėžinys

#### Atnaujinti failai
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(naujas)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(naujas)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 atnaujinimas, pilni agentų gyvavimo ciklo komandų rinkiniai ir Aspire prekės ženklų keitimas
**Ši versija patvirtina kursą pagal `azd` `1.25.6` (2026 m. birželis) ir `azure.ai.agents` `0.1.40-preview` plėtinį, išplečia dirbtinio intelekto gaires nuo "agentų vystymo" iki pilno agento gyvavimo ciklo (testuoti → vertinti → optimizuoti → tikrinti → naikinti), pristato naujus `azure.ai.skills` ir `azure.ai.connections` peržiūros plėtinius, bei pažymi ".NET Aspire" → "Aspire" prekės ženklo atnaujinimą.**

#### Pridėta
- **🔁 Pilnas agentų gyvavimo ciklo aprėptis** pradedantiesiems ir dirbtinio intelekto inžinieriams visose dokumentacijose:
  - `docs/chapter-01-foundation/azd-basics.md` — Gyvavimo ciklo lentelė (agentų kūrimas → testavimas → matavimas → tobulinimas → tikrinimas → valymas) pridėta prie Plėtinių ir DI komandų skyriaus
  - `docs/chapter-08-production/production-ai-practices.md` — Naujas skyrius "Agentų gyvavimo ciklo valdymas" apimantis `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
  - `resources/cheat-sheet.md` — Išplėstos DI agentų komandos su `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
- **🧩 Nauji peržiūros plėtiniai** dokumentuoti: `azure.ai.skills` (pakartotinai naudojamos agentų įgūdžių funkcijos) ir `azure.ai.connections` (Foundry jungtys) pridėti prie plėtinių lentelės ir spausdinimo lapo
- **⏱️ Atsakymų laiko gairės** — `azd ai agent invoke` pavyzdžiai dabar rodo bendrą delsos laiką ir pirmo baito gavimo laiką
- **📌 Versijos baneris** pagrindiniame README nukreipiantis mokinius į `azd version` ir `azd upgrade`

#### Pakeista
- **✅ Patvirtinimo bazė atnaujinta** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.25.6` (2026 m. birželis) visuose skyriaus README ir darbo grupės dokumentuose
- **🤖 2 skyrelio plėtinių pastaba** atnaujinta nuo `azure.ai.agents` `0.1.18-preview` iki `0.1.40-preview`
- **🧪 Darbo grupės patvirtinimo pavyzdys** (`azd version` išvestis) atnaujintas iki `1.25.6`
- **🧭 README „Kas naujo azd šiandien“** atnaujintas, kad išryškintų agentų pilną gyvavimo ciklą, naujus DI plėtinius ir naujausius patogumo patobulinimus (`azd init` idempotentiškumas, `azd auth login` pasenusių žetonų išvalymas, `azd tool` pirmo paleidimo užklausa)
- **📖 2 skyriaus agents.md (Pasirinkimas 4)** dabar nukreipia mokinius į įgyvendinimo po palaikymo ciklo komandas, o ne sustoja prie `azd up`

#### Ištaisyta
- **🏷️ Produkto vardų keitimas** — pridėta Aspire prekės ženklų atnaujinimo pastaba (".NET Aspire" dabar tiesiog "Aspire"); azd Aspire palaikymas lieka nepakitęs
- **🔎 Gyvos versijos patikrinta** pagal Azure Developer CLI leidimų srautą: stabili CLI `1.25.6` (2026-06-12) ir `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Atnaujinti failai
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

#### Pradedančiųjų įvadinio apmokymo paaiškinimas, nustatymo patvirtinimas ir galutinis AZD komandų valymas
**Ši versija seka AZD 1.23 patvirtinimo peržiūrą su pradedantiesiems skirtu dokumentacijos atnaujinimu: paaiškina pradines AZD autentifikacijos gaires, priduria vietinius nustatymo patvirtinimo scenarijus, tikrina svarbiausias komandas tiesiogiai suveikusioje AZD CLI ir pašalina paskutinius pasenusius anglų kalbos komandų paminėjimus už pakeitimų žurnalo ribų.**

#### Pridėta
- **🧪 Pradedančiųjų nustatymo patvirtinimo scenarijai** su `validate-setup.ps1` ir `validate-setup.sh`, kad mokiniai galėtų patikrinti būtinas priemones prieš pradedant 1 skyrių
- **✅ Pradinio nustatymo patvirtinimo žingsniai** pagrindiniame README ir 1 skyriaus README, kad trūkstami išankstiniai reikalavimai būtų pastebėti dar iki `azd up`

#### Pakeista
- **🔐 Pradedančiųjų autentifikacijos gairės** dabar nuosekliai traktuoja `azd auth login` kaip pagrindinį kelią AZD darbo srautams, o `az login` pažymima kaip pasirinktinė, jei tiesiogiai nenaudojamos Azure CLI komandos
- **📚 1 skyriaus įvadinis srautas** dabar nukreipia mokinius patikrinti vietinį nustatymą prieš diegimą, autentifikavimą ir pirmą įgyvendinimą
- **🛠️ Validatoriaus žinutės** aiškiai atskiria blokuojamus reikalavimus nuo pasirenkamų Azure CLI įspėjimų tik AZD pradedančiųjų maršrutui
- **📖 Konfigūracijos, trikties šalinimo ir pavyzdžių dokumentacija** dabar atskiria tarp privalomos AZD autentifikacijos ir pasirenkamos Azure CLI registracijos, kur abu anksčiau pateikti be konteksto

#### Ištaisyta
- **📋 Likę anglų kalbos komandų paminėjimai** atnaujinti į dabartinius AZD formatus, įskaitant `azd config show` spausdinimo lape ir `azd monitor --overview` ten, kur buvo numatyta Azure portalo apžvalgos gairė
- **🧭 Pradedančiųjų teiginiai 1 skyriuje** suminkštinti, kad būtų išvengta per daug pažadėtos garantuotos be klaidų ar atšaukimo elgsenos visose šablonuose ir Azure ištekluose
- **🔎 Tiesioginė CLI patikra** patvirtino esamą palaikymą `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ir `azd down --force --purge`

#### Atnaujinti failai
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

#### AZD 1.23.12 patvirtinimas, darbo grupės aplinkos išplėtimas ir DI modelio atnaujinimas
**Ši versija atlieka dokumentacijos patvirtinimo apžvalgą pagal `azd` `1.23.12`, atnaujina pasenusius AZD komandų pavyzdžius, atnaujina DI modelio gaires iki dabartinių numatytųjų ir išplečia darbo grupės instrukcijas ne tik GitHub Codespaces, bet ir dev konteineriams bei vietinėms kopijoms.**

#### Pridėta
- **✅ Patvirtinimo pastabos pagrindiniuose skyriuose ir darbo grupės dokumentuose** aiškiai nurodo išbandytą AZD bazę mokiniams, naudojantiems naujesnes ar senesnes CLI versijas
- **⏱️ Diegimo laiko gairės** ilgai trunkantiems DI programų diegimams naudojant `azd deploy --timeout 1800`
- **🔎 Plėtinių tikrinimo žingsniai** su `azd extension show azure.ai.agents` DI darbo srauto dokumentuose
- **🌐 Platesnės darbo grupės aplinkos gairės**, apimančios GitHub Codespaces, dev konteinerius ir vietines kopijas su MkDocs

#### Pakeista
- **📚 Skyriaus įvadiniai README** dabar nuosekliai pažymi patvirtinimą pagal `azd 1.23.12`, apimančią pagrindą, konfiguraciją, infrastruktūrą, daugiagentę, išankstinį diegimą, trikčių šalinimą ir gamybos skyrius
- **🛠️ AZD komandų nuorodos** visuose dokumentuose atnaujintos į dabartinius formatus:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` arba `azd env get-value(s)` priklausomai nuo konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, kai numatyta Application Insights apžvalga
- **🧪 Paprasti peržiūros pavyzdžiai** supaprastinti iki dabartinio palaikomo naudojimo, pvz., `azd provision --preview` ir `azd provision --preview -e production`
- **🧭 Darbo grupės eiga** atnaujinta, kad mokiniai galėtų atlikti laboratorijas Codespaces, dev konteineryje arba vietinėje kopijoje, o ne tik Codespaces
- **🔐 Autentifikacijos gairės** dabar pirmenybę teikia `azd auth login` AZD darbo srautams, o `az login` laikomas pasirenkamu, kai tiesiogiai naudojamos Azure CLI komandos

#### Ištaisyta
- **🪟 Windows diegimo komandos** normalizuotos pagal dabartinį `winget` paketo didžiųjų raidžių naudojimą diegimo vadove
- **🐧 Linux diegimo gairės** pataisytos, kad nebūtų nurodymų nepalaikomiems specifiniams platintojams `azd` paketų tvarkyklių ir vietoje to nurodyti atitinkamos versijos leidimai
- **📦 DI modeliavimo pavyzdžiai** atnaujinti nuo senesnių numatytųjų, tokių kaip `gpt-35-turbo` ir `text-embedding-ada-002`, į dabartinius pavyzdžius, pavyzdžiui, `gpt-4.1-mini`, `gpt-4.1` ir `text-embedding-3-large`
- **📋 Diegimo ir diagnostikos ištraukos** pataisytos, kad naudotų dabartines aplinkos ir statuso komandas žurnaluose, scenarijuose ir trikčių šalinimo veiksmuose
- **⚙️ GitHub Actions gairės** atnaujintos nuo `Azure/setup-azd@v1.0.0` iki `Azure/setup-azd@v2`
- **🤖 MCP/Copilot sutikimo gairės** atnaujintos nuo `azd mcp consent` iki `azd copilot consent list`

#### Patobulinta
- **🧠 DI skyriaus gairės** geriau paaiškina peržiūros metu jautrią `azd ai` elgseną, nuomininko specifinį prisijungimą, dabartinį plėtinio naudojimą ir atnaujintas modelio diegimo rekomendacijas
- **🧪 Darbo grupės instrukcijos** dabar naudoja realesnius versijų pavyzdžius ir aiškesnį aplinkos nustatymo aprašymą praktinėms laboratorijoms
- **📈 Gamybos ir trikčių šalinimo dokumentai** geriau suderinami su dabartiniais stebėjimo, atsarginio modelio ir išlaidų sluoksnio pavyzdžiais

#### Atnaujinti failai
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

#### AZD DI CLI komandos, turinio patvirtinimas ir šablonų išplėtimas
**Ši versija prideda `azd ai`, `azd extension` ir `azd mcp` komandų aprėptį visuose su DI susijusiuose skyriuose, ištaisė sugadintas nuorodas ir pasenusį kodą agents.md, atnaujino spausdinimo lapą, ir atnaujino Pavyzdinių šablonų skyrių su patvirtintais aprašymais ir naujais Azure DI AZD šablonais.**

#### Pridėta
- **🤖 AZD DI CLI aprėptis** 7 failuose (anksčiau tik 8 skyriuje):
  - `docs/chapter-01-foundation/azd-basics.md` — Naujas skyrius „Plėtiniai ir DI komandos“ pristatantis `azd extension`, `azd ai agent init` ir `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pasirinkimas 4: `azd ai agent init` su palyginimo lentele (šablonas vs manifestas)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — „AZD plėtiniai Foundry“ ir „Agentų pirmoji diegimo“ poskyriai
  - `docs/chapter-05-multi-agent/README.md` — Greito pradžios dalis dabar rodo abu šablono ir manifesto diegimo kelius
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Diegimo skyrius dabar įtraukia `azd ai agent init` parinktį
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — „AZD DI plėtinių diagnostikos komandos“ poskyris
  - `resources/cheat-sheet.md` — Naujas skyrius „DI ir plėtinių komandos“ su `azd extension`, `azd ai agent init`, `azd mcp` ir `azd infra generate`
- **📦 Nauji AZD DI pavyzdiniai šablonai** įtraukti `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG pokalbių programa su Blazor WebAssembly, Semantic Kernel ir balso pokalbių palaikymu
  - **azure-search-openai-demo-java** — Java RAG pokalbių programa naudojant Langchain4J su ACA/AKS diegimo galimybėmis
  - **contoso-creative-writer** — Daugiagentė kūrybinio rašymo programa naudojant Azure DI agentų paslaugą, Bing pagrindą ir Prompty
  - **serverless-chat-langchainjs** — Serverless RAG naudojant Azure Functions + LangChain.js + Cosmos DB su Ollama vietinio vystymo palaikymu
  - **chat-with-your-data-solution-accelerator** — Įmonių RAG spartintuvas su administravimo portalu, Teams integracija ir PostgreSQL/Cosmos DB galimybėmis
  - **azure-ai-travel-agents** — Daugiaveiklio MCP orkestravimo pavyzdinė programa su serveriais .NET, Python, Java ir TypeScript
  - **azd-ai-starter** — Minimalus Azure AI infrastruktūros Bicep pradžios šablonas
  - **🔗 Awesome AZD AI Gallery link** — Nuoroda į [awesome-azd AI galeriją](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablonų)

#### Pataisyta
- **🔗 agents.md navigacija**: Ankstesnės/Kitos nuorodos dabar atitinka 2 skyriaus README pamokų tvarką (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md sulūžusios nuorodos**: `production-ai-practices.md` pakeista į `../chapter-08-production/production-ai-practices.md` (3 atsiradimai)
- **📦 agents.md pasenęs kodas**: Pakeistas `opencensus` į `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md negaliojantis API**: Perkelta `max_tokens` iš `create_agent()` į `create_run()` kaip `max_completion_tokens`
- **🔢 agents.md žetonų skaičiavimas**: Pakeistas apytikris `len//4` į `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Klaidų pataisymai - paslaugos pakeistos iš "Cognitive Search + App Service" į "Azure AI Search + Azure Container Apps" (numatytasis šeimininkas pakeistas 2024 m. spalio mėn.)
- **contoso-chat**: Aprašymas atnaujintas, kad atitiktų Azure AI Foundry + Prompty, atitinkant repositoriaus tikrą pavadinimą ir technologijų rinkinį

#### Pašalinta
- **ai-document-processing**: Pašalinta neveikianti šablono nuoroda (repo nėra viešai prieinamas kaip AZD šablonas)

#### Patobulinta
- **📝 agents.md pratimai**: 1 pratimas dabar rodo lūkesčių rezultatą ir `azd monitor` žingsnį; 2 pratimas apima visą `FunctionTool` registracijos kodą; 3 pratimas pakeičia nenuoseklius patarimus konkrečiomis `prepdocs.py` komandomis
- **📚 agents.md ištekliai**: Atnaujintos dokumentacijos nuorodos į naujausią Azure AI Agent Service dokumentaciją ir greitą pradžią
- **📋 agents.md Tolimesni Veiksmai lentelė**: Pridėta AI Workshop Lab nuoroda, apimanti visą skyrių

#### Atnaujinti failai
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kurso navigacijos patobulinimas
**Ši versija pagerina README.md skyriaus navigaciją su patobulinta lentelės formatu.**

#### Pakeista
- **Kurso žemėlapio lentelė**: Patobulinta su tiesioginėmis pamokų nuorodomis, trukmės įvertinimais ir sudėtingumo įvertinimais
- **Aplankų valymas**: Pašalinti nereikalingi seni aplankai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Nuorodų tikrinimas**: Patikrintos visos 21+ vidinės nuorodos Kurso žemėlapyje

### [v3.16.0] - 2026-02-05

#### Produkto pavadinimų atnaujinimai
**Ši versija atnaujina produktų nuorodas pagal dabartinį Microsoft prekės ženklą.**

#### Pakeista
- **Microsoft Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas pagal dabartinį prekės ženklą

#### Atnaujinti failai
- `README.md` - Pagrindinis kurso pradžios puslapis
- `changelog.md` - Versijų istorija
- `course-outline.md` - Kurso struktūra
- `docs/chapter-02-ai-development/agents.md` - AI agentų vadovas
- `examples/README.md` - Pavyzdžių dokumentacija
- `workshop/README.md` - Darbų dirbtuvių pradžios puslapis
- `workshop/docs/index.md` - Darbų dirbtuvių indeksas
- `workshop/docs/instructions/*.md` - Visos darbo dirbtuvių instrukcijų bylos

---

### [v3.15.0] - 2026-02-05

#### Didelis saugyklos restruktūrizavimas: skyriais pagrįsti aplankų pavadinimai
**Ši versija pertvarko dokumentaciją į priskirtus skyriaus aplankus aiškesnei navigacijai.**

#### Aplinkų pervadinimai
Seni aplankai pakeisti į skyriaus-daugialypius aplankus:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridėta nauja: `docs/chapter-05-multi-agent/`

#### Failų migracijos
| Failas | Iš | Į |
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
| Visi pre-deployment failai | pre-deployment/ | chapter-06-pre-deployment/ |
| Visi trikčių šalinimo failai | troubleshooting/ | chapter-07-troubleshooting/ |

#### Pridėta
- **📚 Skyrių README failai**: Sukurtas README.md kiekviename skyriaus aplanke su:
  - Mokymosi tikslais ir trukmė
  - Pamokų lentelė su aprašymais
  - Greito paleidimo komandos
  - Navigacija į kitus skyrius

#### Pakeista
- **🔗 Visos vidinės nuorodos atnaujintos**: 78+ kelius atnaujinta visuose dokumentacijos failuose
- **🗺️ Pagrindinis README.md**: Atnaudotas Kurso žemėlapis pagal naują skyriaus struktūrą
- **📝 examples/README.md**: Atnaudotos skyriaus aplankų nuorodos

#### Pašalinta
- Sena aplankų struktūra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Saugyklos restruktūrizavimas: skyriaus navigacija
**Ši versija pridėjo skyriaus navigacijos README failus (pakeista v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Naujas AI agentų vadovas
**Ši versija prideda išsamų vadovą diegiant AI agentus su Azure Developer CLI.**

#### Pridėta
- **🤖 docs/microsoft-foundry/agents.md**: Pilnas vadovas, apimantis:
  - Kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trijų greito paleidimo agentų šablonai (Foundry Agents, Prompty, RAG)
  - Agentų architektūros šablonai (vienas agentas, RAG, daugiaveiklis agentas)
  - Įrankių konfigūracija ir pritaikymas
  - Stebėjimas ir metrikų fiksavimas
  - Kaštų svarstymai ir optimizavimas
  - Dažni trikčių šalinimo scenarijai
  - Trys praktiniai pratimai su sėkmės kriterijais

#### Turinys
- **Įvadas**: Agentų koncepcijos pradedantiesiems
- **Greitas pradėjimas**: Agentų diegimas su `azd init --template get-started-with-ai-agents`
- **Architektūros šablonai**: Agentų šablonų vaizdinės schemos
- **Konfigūracija**: Įrankių nustatymai ir aplinkos kintamieji
- **Stebėjimas**: Application Insights integracija
- **Pratimai**: Progresyvus praktinis mokymasis (20-45 min kiekvienas)

---

### [v3.12.0] - 2026-02-05

#### DevContainer aplinkos atnaujinimas
**Ši versija atnaujina kūrimo konteinerio konfigūraciją su moderniais įrankiais ir geresniais numatytųjų verčių nustatymais AZD mokymosi patirčiai.**

#### Pakeista
- **🐳 Bazinė atvaizda**: Atnaujinta iš `python:3.12-bullseye` į `python:3.12-bookworm` (naujausias Debian stabilus)
- **📛 Konteinerio pavadinimas**: Pervadinta iš "Python 3" į "AZD for Beginners" dėl aiškumo

#### Pridėta
- **🔧 Naujos Dev Container funkcijos**:
  - `azure-cli` su Bicep palaikymu
  - `node:20` (LTS versija AZD šablonams)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerių programėlių diegimams

- **🔌 Prievadų persiuntimas**: Iš anksto sukonfigūruoti dažniausiai naudojami prievadai kūrimui:
  - 8000 (MkDocs peržiūra)
  - 3000 (Tinklalapiai)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nauji VS Code plėtiniai**:
  - `ms-python.vscode-pylance` - Patobulintas Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions palaikymas
  - `ms-azuretools.vscode-docker` - Docker palaikymas
  - `ms-azuretools.vscode-bicep` - Bicep kalbos palaikymas
  - `ms-azure-devtools.azure-resource-groups` - Azure išteklių valdymas
  - `yzhang.markdown-all-in-one` - Markdown redagavimas
  - `DavidAnson.vscode-markdownlint` - Markdown linteris
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code nustatymai**: Pridėti numatytieji nustatymai Python interpretatoriui, formatavimui saugant ir tarpų šalinimui

- **📦 Atnaujintas requirements-dev.txt**:
  - Pridėtas MkDocs minify papildinys
  - Pridėtas pre-commit kodo kokybei
  - Pridėti Azure SDK paketai (azure-identity, azure-mgmt-resource)

#### Pataisyta
- **Post-Create komanda**: Dabar tikrina AZD ir Azure CLI diegimą konteinerio paleidimo metu

---

### [v3.11.0] - 2026-02-05

#### Pradedančiųjų skirtas README pertvarkymas
**Ši versija reikšmingai pagerina README.md, kad jis būtų labiau prieinamas pradedantiesiems, ir prideda svarbius išteklius AI kūrėjams.**

#### Pridėta
- **🆚 Azure CLI vs AZD palyginimas**: Aiški paaiškinimas, kada naudoti kurį įrankį, su praktiniais pavyzdžiais
- **🌟 Awesome AZD nuorodos**: Tiesioginės nuorodos į bendruomenės šablonų galeriją ir bendradarbiavimo išteklius:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ paruoštų diegti šablonų
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Bendruomenės indėlis
- **🎯 Greito starto vadovas**: Supaprastinta 3 žingsnių pradžia (Įdiegti → Prisijungti → Diegti)
- **📊 Patirties pagrindu veikianti navigacijos lentelė**: Aiškios gairės, kur pradėti pagal kūrėjo patirtį

#### Pakeista
- **README struktūra**: Pertvarkyta siekiant laipsniško informacijos atskleidimo - svarbiausia informacija pirma
- **Įvado skyrius**: Perrašytas, kad paaiškintų „The Magic of `azd up`“ visiškai pradedantiesiems
- **Dvigubos turinio pašalinimas**: Pašalinta pasikartojanti trikčių šalinimo dalis
- **Trikčių šalinimo komandos**: Pataisyta `azd logs` nuoroda, kad naudotų galiojantį `azd monitor --logs`

#### Pataisyta
- **🔐 Autentifikacijos komandos**: Pridėta `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Neteisingos komandų nuorodos**: Pašalinta likusi `azd logs` iš README trikčių šalinimo dalies

#### Pastabos
- **Sritis**: Pakeitimai pritaikyti pagrindiniame README.md ir resources/cheat-sheet.md
- **Tikslo auditorija**: Pataisymai skirti ypač AZD pradedantiesiems

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI komandų tikslumo atnaujinimas
**Ši versija taiso neegzistuojančias AZD komandas visoje dokumentacijoje, užtikrindama, kad visi kodo pavyzdžiai naudotų galiojančią Azure Developer CLI sintaksę.**

#### Pataisyta
- **🔧 Pašalintos neegzistuojančios AZD komandos**: Išsamus negaliojančių komandų auditavimas ir taisymas:
  - `azd logs` (neegzistuoja) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` poskomandos (neegzistuoja) → pakeista į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (neegzistuoja) → pašalinta arba pakeista galiojančiomis alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` vėliavos (neegzistuoja) → pašalinta
  - `azd provision --what-if/--rollback` vėliavos (neegzistuoja) → atnaujinta naudoti `--preview`
  - `azd config validate` (neegzistuoja) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neegzistuoja) → pašalinta

- **📚 Failai atnaujinti su komandų pataisymais**:
  - `resources/cheat-sheet.md`: Didelis komandų nuorodų pertvarkymas
  - `docs/deployment/deployment-guide.md`: Pataisyti atšaukimo ir diegimo strategijų skyreliai
  - `docs/troubleshooting/debugging.md`: Pataisyta žurnalų analizės dalis
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyta AZD derinimo dalis
  - `docs/getting-started/azd-basics.md`: Pataisyti stebėjimo komandų nurodymai
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir trikčių šalinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Pataisyti pagalbos ir versijų pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Pataisyti žurnalų peržiūros komandos
  - `docs/pre-deployment/coordination-patterns.md`: Pataisyti agentų trikčių šalinimo komandos

- **📝 Versijos nuoroda atnaujinta**:
  - `docs/getting-started/installation.md`: Pakeista kieta koduota `1.5.0` versija į bendrą `1.x.x` su nuoroda į leidimus

#### Pakeitimai
- **Atšaukimo strategijos**: Dokumentacija atnaujinta, naudojant Git pagrindu veikiančią atšaukimo sistemą (AZD neturi gimtojo atšaukimo funkcijos)
- **Žurnalų peržiūra**: Pakeistos `azd logs` nuorodos į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Veiklos skyrius**: Pašalinti neegzistuojantys lygiagretūs/incremental diegimo parametrai, pateikti galiojantys alternatyvos

#### Techninės detalės
- **Galiojančios AZD komandos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galiojantys azd monitor vėliavėlės**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patikra**: Komandos patikrintos su Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Mokymų užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvius mokymų modulius, pataiso visus neveikiančius dokumentacijos nuorodas ir pagerina bendrą turinio kokybę AI kūrėjams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujame gairių faile apie indėlį:
  - Aiškios instrukcijos problemų pranešimui ir pakeitimų siūlymui
  - Dokumentacijos standartai naujam turiniui
  - Kodo pavyzdžių gairės ir įsipareigojimų pranešimų konvencijos
  - Bendruomenės dalyvavimo informacija

#### Įvykdyta
- **🎯 Mokymų modulis 7 (Apibendrinimas)**: Visiškai užbaigtas apibendrinimo modulis su:
  - Išsamia mokymų pasiekimų santrauka
  - Pagrindinių koncepcijų skyrius, apimantis AZD, šablonus ir Microsoft Foundry
  - Rekomendacijos tolesniam mokymosi keliui
  - Mokymų iššūkių pratimai su sunkumo įvertinimais
  - Bendruomenės atsiliepimų ir palaikymo nuorodos

- **📚 Mokymų modulis 3 (Deconstrukcija)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot su MCP serverių aktyvavimo gairėmis
  - AZD šablonų aplanko struktūros supratimas
  - Infrastruktūros kaip kodo (Bicep) organizavimo modeliai
  - Praktinės laboratorijos instrukcijos

- **🔧 Mokymų modulis 6 (Išardymas)**: Užbaigtas su:
  - Išteklų valymo ir išlaidų valdymo tikslais
  - `azd down` naudojimu saugiam infrastruktūros nutraukimui
  - Minkštai ištrintų kognityvinių paslaugų atstatymo gairės
  - Papildomos tyrimų užduotys GitHub Copilot ir Azure portale

#### Pataisyta
- **🔗 Sugadintų nuorodų taisymas**: Ištaisyta daugiau nei 15 neveikiančių vidinių dokumentacijos nuorodų:
  - `docs/ai-foundry/ai-model-deployment.md`: Ištaisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ištaisyti ai-model-deployment.md ir production-ai-practices.md keliai
  - `docs/getting-started/first-project.md`: Pakeista neegzistuojanti cicd-integration.md į deployment-guide.md
  - `examples/retail-scenario.md`: Ištaisyti DUK ir trikčių šalinimo gairių keliai
  - `examples/container-app/microservices/README.md`: Pataisytos kurso pradžios ir diegimo vadovo nuorodos
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujintos AI skyriaus nuorodos
  - `course-outline.md`: Ištaisyti instruktoriaus vadovo ir AI mokymų laboratorijos nuorodos

- **📅 Mokymų būsenos juosta**: Atnaujinta iš "Kuriama" į aktyvų mokymų statusą su 2026 m. vasario mėn. data

- **🔗 Mokymų navigacija**: Ištaisyti neveikiantys navigacijos saitai README.md nurodantys neegzistuojantį lab-1-azd-basics aplanką

#### Pakeitimai
- **Mokymų pristatymas**: Pašalintas "kuriama" įspėjimas, mokymai dabar pilnai užbaigti ir paruošti naudojimui
- **Navigacijos nuoseklumas**: Užtikrinta tinkama sąveika tarp visų mokymų modulių
- **Mokymosi kelių nuorodos**: Atnaujintos skyriaus tarpusavio nuorodos, naudojant teisingus microsoft-foundry kelius

#### Patvirtinta
- ✅ Visos anglų kalbos markdown bylos turi galiojančias vidines nuorodas
- ✅ Mokymų moduliai nuo 0 iki 7 pilnai užbaigti su mokymosi tikslais
- ✅ Navigacija tarp skyrių ir modulių veikia tinkamai
- ✅ Turinys tinka AI kūrėjams, naudojantiems Microsoft AZD
- ✅ Išlaikyta draugiška pradedantiesiems kalba ir struktūra
- ✅ CONTRIBUTING.md pateikia aiškias gaires bendruomenės indėliui

#### Techninė įgyvendinimas
- **Nuorodų patikrinimas**: Automatinė PowerShell skripto patikrino visas .md vidines nuorodas
- **Turinio auditavimas**: Rankinis mokymų pilnumo ir tinkamumo pradedantiesiems peržiūra
- **Navigacijos sistema**: Taikyti nuoseklūs skyrių ir modulių navigacijos modeliai

#### Pastabos
- **Aprėptis**: Pakeitimai taikomi tik anglų kalbos dokumentacijai
- **Vertimai**: Vertimo aplankai šioje versijoje nebuvo atnaujinti (automatizuotas vertimas bus sinchronizuotas vėliau)
- **Mokymų trukmė**: Pilni mokymai dabar užtrunka 3-4 valandas praktinio mokymosi

---

### [v3.8.0] - 2025-11-19

#### Pažangi dokumentacija: Stebėjimas, saugumas ir kelių agentų modeliai
**Ši versija prideda išsamius A lygio pamokas apie Application Insights integraciją, autentifikacijos modelius ir kelių agentų koordinavimą produkciniuose diegimuose.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: `docs/pre-deployment/application-insights.md`:
  - Diegimas, orientuotas į AZD su automatiniais teikimais
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pritaikyta telemetrija (virš 1 200 eilučių)
  - AI/LLM stebėjimo modeliai (Microsoft Foundry modeliui žetonų/kaštų sekimas)
  - 6 Mermaid diagramos (architektūra, paskirstyta stebėsena, telemetrijos srautas)
  - 3 praktinės užduotys (įspėjimai, informacinės lentos, AI stebėjimas)
  - Kusto užklausų pavyzdžiai ir kaštų optimizavimo strategijos
  - Gyvų metrikų srautas ir realaus laiko trikčių šalinimas
  - 40-50 minučių mokymosi laikas su produkcijos pasiruošimo modeliais

- **🔐 Autentifikacijos ir saugumo modelių pamoka**: `docs/getting-started/authsecurity.md`:
  - 3 autentifikacijos modeliai (jungčių eilutės, Key Vault, valdomoji tapatybė)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js kodas su Azure SDK integracija
  - 3 praktinės užduotys (valdomos tapatybės įjungimas, vartotojo paskirta tapatybė, Key Vault rotacija)
  - Saugumo geriausios praktikos ir RBAC konfigūracijos
  - Trikčių šalinimo vadovas ir kaštų analizė
  - Produkcijoje paruošti be slaptažodžių autentifikacijos modeliai

- **🤖 Kelių agentų koordinavimo modelių pamoka**: `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinavimo modeliai (seka, lygiagretus, hierarchinis, įvykiais valdomas, konsensusas)
  - Pilnas vykdytojo paslaugos įgyvendinimas (Python/Flask, virš 1 500 eilučių)
  - 3 specializuotos agentų įgyvendinimai (tyrimas, rašytojas, redaktorius)
  - Service Bus integracija pranešimų eilėms
  - Cosmos DB valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramos, rodančios agentų sąveikas
  - 3 pažangios praktinės užduotys (time-out valdymas, pakartojimų logika, grandinės pertraukiklis)
  - Kaštų suskirstymas (240–565 $/mėn.) su optimizavimo strategijomis
  - Application Insights integracija stebėjimui

#### Patobulinta
- **Išankstinis diegimo skyrius**: Dabar apima išsamius stebėjimo ir koordinavimo modelius
- **Įvadinis skyrius**: Patobulintas profesionaliais autentifikacijos modeliais
- **Produkcijos parengimas**: Išsami tema nuo saugumo iki stebėjimo
- **Kurso santrauka**: Atnaujinta, nurodant naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi pažanga**: Geresnė saugumo ir stebėjimo integracija per visą kursą
- **Dokumentacijos kokybė**: Nuoseklūs aukščiausios kokybės (95-97 %) standartai naujose pamokose
- **Produkciniai modeliai**: Pilnas end-to-end aprėptis įmonių diegimams

#### Pagerinta
- **Kūrėjų patirtis**: Aiškus kelias nuo kūrimo iki produkcijos stebėjimo
- **Saugumo standartai**: Profesionalių autentifikacijos ir slaptažodžių valdymo modeliai
- **Stebėjimas**: Pilna Application Insights integracija su AZD
- **AI darbo krūviai**: Specializuota stebėsena Microsoft Foundry modeliams ir kelių agentų sistemoms

#### Patvirtinta
- ✅ Visos pamokos turi pilnai veikiančius kodus (ne fragmentus)
- ✅ Mermaid diagramos aiškiam mokymuisi (iš viso 19 per 3 pamokas)
- ✅ Praktinės užduotys su patvirtinimo etapais (iš viso 9)
- ✅ Produkcijai paruošti Bicep šablonai, galintys diegti per `azd up`
- ✅ Kaštų analizė ir optimizavimo strategijos
- ✅ Trikčių šalinimo vadovai ir geriausios praktikos
- ✅ Žinių tikrinimai su patikrinimo komandomis

#### Dokumentacijos įvertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsami stebėjimo vadovas
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo modeliai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios kelių agentų architektūros
- **Bendras naujas turinys**: - Nuoseklūs aukštos kokybės standartai

#### Techninė įgyvendinimas
- **Application Insights**: Log Analytics + pritaikyta telemetrija + paskirstyta stebėsena
- **Autentifikacija**: Valdomoji tapatybė + Key Vault + RBAC modeliai
- **Keli agentai**: Service Bus + Cosmos DB + konteinerių programos + orkestras
- **Stebėjimas**: Gyvos metrikos + Kusto užklausos + įspėjimai + informacinės lentos
- **Išlaidų valdymas**: Imties strategijos, laikymo politikos, biudžeto kontrolės

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Microsoft Foundry Models pavyzdys
**Ši versija pagerina dokumentacijos kokybę visame reikale ir prideda pilną Microsoft Foundry Models diegimo pavyzdį su gpt-4.1 pokalbių sąsaja.**

#### Pridėta
- **🤖 Microsoft Foundry Models pokalbių pavyzdys**: Pilnas gpt-4.1 diegimas su veikiančia implementacija `examples/azure-openai-chat/`:
  - Pilna Microsoft Foundry Models infrastruktūra (gpt-4.1 modelio diegimas)
  - Python komandų eilutės pokalbių sąsaja su pokalbių istorija
  - Key Vault integracija saugiam API rakto saugojimui
  - Žetonų naudojimo stebėjimas ir kaštų įvertinimas
  - Srauto apribojimas ir klaidų valdymas
  - Išsamus README su 35-45 minučių diegimo vadovu
  - 11 produkcijai paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos pratimai**: Pridėti praktiniai pratimai konfigūracijos vadove:
  - Pratimas 1: Multiaplinkos konfigūracija (15 minučių)
  - Pratimas 2: Slaptažodžių valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikros žingsniai
- **✅ Diegimo patikra**: Pridėtas patikros skyrius diegimo vadove:
  - Sveikatos patikros procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Numatyti rezultatai visoms diegimo komandoms
  - Greito trikčių šalinimo nuorodos

#### Patobulinta
- **examples/README.md**: Atnaujinta iki A lygio kokybės (93 %):
  - Pridėtas azure-openai-chat į visus atitinkamus skyrius
  - Vietinių pavyzdžių skaičius padidintas nuo 3 iki 4
  - Pridėta prie AI programų pavyzdžių lentelės
  - Integruota į greito starto instrukcijas vidutiniams vartotojams
  - Pridėta prie Microsoft Foundry šablonų skyriaus
  - Atnaujinta palyginimo matrica ir technologijų paieškos skyriai
- **Dokumentacijos kokybė**: Pagerinta nuo B+ (87 %) iki A- (92 %) visame docs aplanke:
  - Pridėti numatomi rezultatai kritiniams komandų pavyzdžiams
  - Įtraukti konfigūracijos pakeitimų patikros žingsniai
  - Patobulintas praktinis mokymasis su pratimais

#### Pakeista
- **Mokymosi eiga**: Geresnė AI pavyzdžių integracija vidutinio lygio mokiniams
- **Dokumentacijos struktūra**: Daugiau naudingų pratimų su aiškiais rezultatais
- **Patikros procesas**: Aiškūs sėkmės kriterijai pagrindiniams darbflows pridėti

#### Pagerinta
- **Kūrėjų patirtis**: Microsoft Foundry Models diegimas dabar užtrunka 35–45 minutes (prieš tai 60–90 sudėtingesniems sprendimams)
- **Kaštų skaidrumas**: Aiškus kaštų įvertinimas (50–200 $/mėn.) Microsoft Foundry Models pavyzdyje
- **Mokymosi kelias**: AI kūrėjai turi aiškią įėjimo tašką su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs numatyti rezultatai ir patikros žingsniai

#### Patvirtinta
- ✅ Microsoft Foundry Models pavyzdys visiškai funkcionuoja su `azd up`
- ✅ Visi 11 įgyvendinimo failų sintaksiškai teisingi
- ✅ README instrukcijos atitinka faktinę diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra pasikartojančių išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninė įgyvendinimas
- **Microsoft Foundry Models architektūra**: gpt-4.1 + Key Vault + konteinerių programų modelis
- **Saugumas**: Valdomoji tapatybė paruošta, slaptažodžiai Key Vault
- **Stebėjimas**: Application Insights integracija
- **Išlaidų valdymas**: Žetonų stebėjimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda pilnam nustatymui

### [v3.6.0] - 2025-11-19

#### Svarbus atnaujinimas: Konteinerių programų diegimo pavyzdžiai
**Ši versija pristato išsamius, produkcijai pasiruošusius konteinerių programų diegimo pavyzdžius, naudojant Azure Developer CLI (AZD), su visa dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Konteinerių programų pavyzdžiai**: Nauji vietiniai pavyzdžiai `examples/container-app/`:
  - [Pagrindinis vadovas](examples/container-app/README.md): Išsamus konteinerizuotų diegimų apžvalga, greitas startas, gamybinės ir pažangiosios schemos
  - [Paprasta Flask API](../../examples/container-app/simple-flask-api): Pradedantiesiems draugiška REST API su mastelio mažinimu iki nulio, sveikatos patikromis, stebėsena ir trikčių šalinimu
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices): Gamybai paruoštas daugiapakopis diegimas (API vartai, Produktas, Užsakymas, Vartotojas, Pranešimas), asinchroniniai pranešimai, Service Bus, Cosmos DB, Azure SQL, paskirstytas sekimas, mėlynas-žalias/kanarinis diegimas
- **Gerosios praktikos**: Saugumas, stebėsena, kaštų optimizavimas ir CI/CD gairės konteinerizuotoms apkrovoms
- **Kodo pavyzdžiai**: Pilni `azure.yaml`, Bicep šablonai ir daugialypės kalbos paslaugų įgyvendinimai (Python, Node.js, C#, Go)
- **Testavimas ir trikčių šalinimas**: Visapusiški testavimo scenarijai, stebėjimo komandos, trikčių šalinimo gairės

#### Pakeista
- **README.md**: Atnaujintas su naujų konteinerių programų pavyzdžiais skyriuje "Vietiniai pavyzdžiai - konteinerių programos" ir nuorodomis
- **examples/README.md**: Atnaujintas, pabrėžia konteinerių programų pavyzdžius, prideda palyginimo matricos įrašus ir atnaujina technologijos/architektūros nuorodas
- **Kurso santrauka ir studijų vadovas**: Atnaujintas su naujų konteinerių programų pavyzdžiais ir diegimo šablonais atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai diegiami naudojant `azd up` ir atitinka gerąją praktiką
- ✅ Dokumentacijos kryžminiai ryšiai ir navigacija atnaujinti
- ✅ Pavyzdžiai apima nuo pradedančiųjų iki pažangių scenarijų, įskaitant gamybinius mikropaslaugas

#### Pastabos
- **Aprėptis**: Tik anglų kalbos dokumentacija ir pavyzdžiai
- **Tolimesni veiksmai**: Ateities leidimuose išplėsti papildomais pažangiais konteinerių šablonais ir CI/CD automatizavimu

### [v3.5.0] - 2025-11-19

#### Produkto pervadinimas: Microsoft Foundry
**Ši versija įgyvendina išsamų produkto pavadinimo pakeitimą iš "Microsoft Foundry" į "Microsoft Foundry" visuose anglų kalbos dokumentuose, atspindintį oficialų Microsoft prekės ženklo keitimą.**

#### Pakeista
- **🔄 Produkto pavadinimo atnaujinimas**: Išsamus pervadinimas iš "Microsoft Foundry" į "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų kalbos dokumentacijoje `docs/` kataloge
  - Pervadintas katalogas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervadintas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso: 23 turinio nuorodos atnaujintos 7 dokumentacijos failuose

- **📁 Katalogų struktūros pakeitimai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nuorodos atnaujintos pagal naują katalogų struktūrą
  - Navigacijos nuorodos patikrintos visuose dokumentuose

- **📄 Failų pervadinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Visos vidinės nuorodos atnaujintos, kad nurodytų naują failo pavadinimą

#### Atnaujinti failai
- **Skirsnių dokumentacija** (7 failai):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigacijos nuorodų atnaujinimai
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produkto pavadinimo nuorodos atnaujintos
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 nuorodos atnaujinimai (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 kryžminių nuorodų atnaujinimai
  - `docs/getting-started/first-project.md` - 2 skirsnių navigacijos nuorodos atnaujinimai
  - `docs/getting-started/installation.md` - 2 kito skirsnio navigacijos nuorodos atnaujinimai
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 nuorodos atnaujinimai (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijos nuorodos atnaujinimas
  - `docs/troubleshooting/debugging.md` - 1 navigacijos nuorodos atnaujinimas

- **Kurso struktūros failai** (2 failai):
  - `README.md` - 17 nuorodos atnaujinimai (kurso apžvalga, skirsnių pavadinimai, šablonų skyrius, bendruomenės įžvalgos)
  - `course-outline.md` - 14 nuorodos atnaujinimai (apžvalga, mokymosi tikslai, skirsnių ištekliai)

#### Patvirtinta
- ✅ Nėra likusių "ai-foundry" katalogo kelių anglų kalbos dokumentuose
- ✅ Nėra likusių "Microsoft Foundry" produkto pavadinimo nuorodų anglų kalbos dokumentuose
- ✅ Visos navigacijos nuorodos veikia su nauja katalogų struktūra
- ✅ Failų ir katalogų pervadinimai sėkmingai atlikti
- ✅ Kryžminės nuorodos tarp skyrių patikrintos

#### Pastabos
- **Aprėptis**: Pakeitimai taikomi tik anglų kalbos dokumentacijai `docs/` kataloge
- **Vertimai**: Vertimų katalogai (`translations/`) šioje versijoje nebuvo atnaujinti
- **Dirbtuvės**: Dirbtuvių medžiaga (`workshop/`) nebuvo atnaujinta šioje versijoje
- **Pavyzdžiai**: Pavyzdžių failai gali dar turėti senovinių pavadinimų (bus sprendžiama ateityje)
- **Išorinės nuorodos**: Išorinės URL ir GitHub saugyklų nuorodos liko nepakitusios

#### Migracijos vadovas prisidedantiems
Jei turite vietinių šakų ar dokumentacijos, kuri remiasi sena struktūra:
1. Atnaujinkite katalogo nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir patvirtinimo patobulinimai
**Ši versija įveda išsamų palaikymą naujai Azure Developer CLI peržiūros funkcijai ir gerina dirbtuvių naudotojo patirtį.**

#### Pridėta
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsamus naujos infrastruktūros peržiūros galimybės aprašymas
  - Komandų nuoroda ir naudojimo pavyzdžiai spausdinimo lape
  - Detalus integravimas diegimo vadove su naudojimo atvejais ir privalumais
  - Parengiamųjų patikrų integracija saugesnei diegimo patikrai
  - Įvadinis vadovas su saugiausių diegimo praktikų atnaujinimais
- **🚧 Dirbtuvių statuso juosta**: Profesionalus HTML banneris, rodantis dirbtuvių kūrimo būseną
  - Gradientinis dizainas su statybos indikatoriais aiškiam naudotojų informavimui
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas dizainas visiems įrenginiams

#### Pagerinta
- **Infrastruktūros saugumas**: Peržiūros funkcija integruota į visą diegimo dokumentaciją
- **Prieš diegimą vykdoma patikra**: Automatiniai scenarijai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjo darbo eiga**: Atnaujintos komandų sekos, įtraukiant peržiūrą kaip geriausią praktiką
- **Dirbtuvių patirtis**: Aiškūs naudotojų lūkesčiai dėl turinio kūrimo statuso

#### Pakeista
- **Diegimo gerosios praktikos**: Dabar rekomenduojamas peržiūros pirmumo darbo eiga
- **Dokumentacijos eiga**: Infrastruktūros patvirtinimas perkeltas į ankstesnį mokymosi etapą
- **Dirbtuvių pristatymas**: Profesionalus statuso pranešimas su aiškiu kūrimo laiko grafiku

#### Patobulinta
- **Saugumo pirmumas**: Infrastruktūros pakeitimai dabar gali būti patvirtinti prieš diegimą
- **Komandinė sąveika**: Peržiūros rezultatai gali būti bendrinami peržiūrai ir patvirtinimui
- **Sąnaudų suvokimas**: Geresnis išteklių sąnaudų supratimas prieš teikiant resursus
- **Rizikos mažinimas**: Sumažintas diegimo nesėkmių skaičius per ankstesnį patvirtinimą

#### Techninė įgyvendinimas
- **Daugiafunkcinis dokumentų integravimas**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Gerosios praktikos įtraukimas**: Peržiūra įtraukta į patvirtinimo darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJŲ funkcijų žymėjimai, kad būtų lengviau atrasti

#### Dirbtuvių infrastruktūra
- **Statuso komunikacija**: Profesionalus HTML banneris su gradientiniu stiliumi
- **Naudotojo patirtis**: Aiškus kūrimo būsenos rodymas, kad būtų išvengta painiavos
- **Profesionalus pristatymas**: Išlaiko saugyklos patikimumą, nustatydamas lūkesčius
- **Laiko grafiko skaidrumas**: Paskutinio atnaujinimo data – 2025 m. spalis – atsakomybės ženklas

### [v3.3.0] - 2025-09-24

#### Patobulinta dirbtuvių medžiaga ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamią dirbtuvių medžiagą su naršyklėje veikiančiomis interaktyviomis pamokomis ir struktūruotais mokymosi keliais.**

#### Pridėta
- **🎥 Interaktyvus dirbtuvių vadovas**: Naršyklėje veikianti dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Struktūruotos dirbtuvių instrukcijos**: 7 žingsnių vadovaujama mokymosi eiga nuo atradimo iki pritaikymo
  - 0-Įvadas: dirbtuvių apžvalga ir nustatymai
  - 1-AI šablono pasirinkimas: šablono atradimo ir pasirinkimo procesas
  - 2-AI šablono patvirtinimas: diegimo ir patvirtinimo procedūros
  - 3-AI šablono išardymas: šablono architektūros supratimas
  - 4-AI šablono konfiguravimas: konfigūravimas ir pritaikymas
  - 5-AI šablono personalizavimas: pažangūs modifikavimai ir iteracijos
  - 6-Infrastruktūros išardymas: išvalymas ir resursų valdymas
  - 7-Apibendrinimas: apžvalga ir tolesni žingsniai
- **🛠️ Dirbtuvių įrankiai**: MkDocs konfigūracija su Material tema geresnei mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodika (atradimas → diegimas → pritaikymas)
- **📱 GitHub Codespaces integracija**: sklandi kūrimo aplinka

#### Pagerinta
- **AI dirbtuvių laboratorija**: Išplėsta išsamia 2-3 valandų struktūruota mokymosi patirtimi
- **Dirbtuvių dokumentacija**: Profesionalus pristatymas su navigacija ir vizualiniais pagalbininkais
- **Mokymosi eiga**: Aiškios žingsnis po žingsnio gairės nuo šablono pasirinkimo iki gamybinio diegimo
- **Kūrėjo patirtis**: Integruoti įrankiai sklandžiam kūrimo procesui

#### Patobulinta
- **Prieinamumas**: Naršyklėje veikianti sąsaja su paieška, kopijavimo funkcija ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksčios dirbtuvių struktūros, leidžiančios įvairų mokymosi tempą
- **Praktiškas taikymas**: Realių AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Įmontuota paieška**: Greita raktažodžių ir pamokų paieška
- **Kodo blokų kopijavimas**: Kopijavimo pelės ant trajektorijos funkcija visiems kodo pavyzdžiams
- **Temų perjungimas**: Tamsios/šviesios temos palaikymas skirtingiems poreikiams
- **Vaizdinė medžiaga**: Ekrano kopijos ir schemos geresniam supratimui
- **Pagalbos integracija**: Tiesioginis Discord ryšys bendruomenės palaikymui

### [v3.2.0] - 2025-09-17

#### Didelės apimties navigacijos pertvarkymas ir mokymosi sistema pagal skyrius
**Ši versija įveda išsamų mokymosi struktūros suskirstymą į skyrius ir patobulintą navigaciją visoje saugykloje.**

#### Pridėta
- **📚 Mokymasis pagal skyrius**: Perstruktūrizuotas visas kursas į 8 progresyvius mokymosi skyrius
  - Skyrius 1: Pagrindai ir Greitas pradėjimas (⭐ - 30-45 min)
  - Skyrius 2: AI-pirmasis kūrimas (⭐⭐ - 1-2 valandos)
  - Skyrius 3: Konfigūracija ir autentifikacija (⭐⭐ - 45-60 min)
  - Skyrius 4: Infrastruktūra kaip kodas ir diegimas (⭐⭐⭐ - 1-1.5 valandos)
  - Skyrius 5: Daugiapakopės AI sprendimai (⭐⭐⭐⭐ - 2-3 valandos)
  - Skyrius 6: Prieš diegimą atliekama patikra ir planavimas (⭐⭐ - 1 valanda)
  - Skyrius 7: Trikčių šalinimas ir derinimas (⭐⭐ - 1-1.5 valandos)
  - Skyrius 8: Gamybinės ir įmonių schemos (⭐⭐⭐⭐ - 2-3 valandos)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir pėdsakai visuose dokumentuose
- **🎯 Progreso sekimas**: Kurso pabaigos kontrolinis sąrašas ir mokymosi patvirtinimo sistema
- **🗺️ Mokymosi kelių vadovavimas**: Aiškūs įėjimo taškai skirtingiems patirties lygiams ir tikslams
- **🔗 Kryžminė navigacija**: Susiję skyriai ir išankstiniai reikalavimai aiškiai susieti

#### Pagerinta
- **README struktūra**: Pertvarkyta į struktūruotą mokymosi platformą su skyrių organizavimu
- **Dokumentacijos navigacija**: Kiekviename puslapyje dabar pateikiamas skyriaus kontekstas ir mokymosi progresas
- **Šablonų organizavimas**: Pavyzdžiai ir šablonai susieti su tinkamais mokymosi skyriais
- **Ištekliai integracija**: Spausdinimo lapai, DUK ir studijų vadovai susieti su atitinkamais skyriais
- **Dirbtuvių integracija**: Praktinės laboratorijos susijusios su kelių skyrių mokymosi tikslais

#### Pakeista
- **Mokymosi eiga**: Pereita nuo linijinės dokumentacijos prie lanksčios mokymosi struktūros pagal skyrius
- **Konfigūracijos vieta**: Konfigūracijos vadovas perkeltas į 3 skyrių geresnei mokymosi eigai
- **AI turinio įtrauktis**: Geresnis AI specifinio turinio integravimas visame mokymosi procese
- **Gamybinis turinys**: Pažangios schemos konsoliduotos 8 skyriuje įmonių besimokantiems

#### Patobulinta
- **Naudotojo patirtis**: Aiški navigacijos duona ir skyriaus progresijos indikacija
- **Prieinamumas**: Nuoseklūs navigacijos šablonai palengvina kurso apėjimą
- **Profesionalus pristatymas**: Universitetinio tipo kurso struktūra tinkama akademiniam ir įmonių mokymui
- **Mokymosi efektyvumas**: Sutrumpintas laikas surasti aktualų turinį geresnės organizacijos dėka

#### Techninė įgyvendinimas
- **Navigacijos antraštės**: Standartizuota skyriaus navigacija daugiau nei 40 dokumentacijos failuose
- **Pėdų navigacija**: Nuoseklus progresijos vadovas ir skyriaus pabaigos indikatoriai
- **Kryžminės nuorodos**: Išsami vidaus nuorodų sistema, jungiantis susijusias sąvokas
- **Skyriaus susiejimas**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Studijų vadovo patobulinimas
- **📚 Išsamūs mokymosi tikslai**: Pertvarkytas studijų vadovas pritaikytas 8 skyrių sistemai
- **🎯 Vertinimas pagal skyrius**: Kiekviename skyriuje pateikti konkretūs mokymosi tikslai ir praktinės užduotys
- **📋 Progreso sekimas**: Savaitinis mokymosi tvarkaraštis su matuojamais rezultatais ir pabaigos kontroliniais sąrašais
- **❓ Vertinimo klausimai**: Žinių patikros klausimai kiekvienam skyriui su profesionaliais rezultatais
- **🛠️ Praktinės užduotys**: Praktinės veiklos su realiais diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių progresija**: Aiškus pažangumas nuo pagrindinių sąvokų iki įmonių schemų karjeros plėtros kontekste
- **🎓 Sertifikavimo sistema**: Profesinio tobulėjimo rezultatai ir bendruomenės pripažinimo sistema
- **⏱️ Laiko valdymas**: Struktūruotas 10 savaičių mokymosi planas su svarbiausių etapų patikra

### [v3.1.0] - 2025-09-17

#### Patobulinti daugiaagentiniai AI sprendimai
**Ši versija pagerina daugiaagentinį mažmeninės prekybos sprendimą su geresniu agentų pavadinimu ir patobulinta dokumentacija.**

#### Pakeista
- **Daugiapakopių agentų terminologija**: Pakeista „Cora agent“ į „Kliento agentą“ visoje mažmeninės prekybos daugiapakopių agentų sprendime aiškesniam supratimui
- **Agentų architektūra**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai, kad nuosekliai vartotų „Kliento agentas“ pavadinimą
- **Konfigūracijos pavyzdžiai**: Modernizuoti agentų konfigūracijos šablonai su atnaujinta pavadinimų konvencija
- **Dokumentacijos nuoseklumas**: Užtikrinta, kad visi paminėjimai naudotų profesionalius, apibūdinančius agentus pavadinimus

#### Patobulinta
- **ARM šablono paketas**: Atnaujintas retail-multiagent-arm-template su Kliento agento nuorodomis
- **Architektūrinių diagramų atnaujinimas**: Atnaujintos Mermaid diagramos su atnaujintais agentų pavadinimais
- **Kodo pavyzdžiai**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent pavadinimą
- **Aplinkos kintamieji**: Atitinkamai atnaujinti visi diegimo scenarijai su CUSTOMER_AGENT_NAME konvencijomis

#### Pagerinta
- **Vystytojo patirtis**: Aiškesni agentų vaidmenys ir atsakomybės dokumentacijoje
- **Gamybos pasirengimas**: Geresnis suderinamumas su įmonių pavadinimų konvencijomis
- **Mokomoji medžiaga**: Intuityvesnis agentų pavadinimų naudojimas švietimo tikslais
- **Šablonų naudotojams patogumas**: Paprastesnis agentų funkcijų ir diegimo šablonų supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeisti CoraAgent klasių pavadinimai į CustomerAgent Python pavyzdžiuose
- Modifikuotos ARM šablonų JSON konfigūracijos naudoti „customer“ agento tipą
- Atnaujinti aplinkos kintamieji iš CORA_AGENT_* į CUSTOMER_AGENT_* šablonus
- Atnaujinti visi diegimo komandų ir konteinerių konfigūracijos failai

### [v3.0.0] - 2025-09-12

#### Pagrindiniai pakeitimai - dėmesys AI vystytojams ir Microsoft Foundry integracija
**Ši versija pertvarko saugyklą į visapusišką dirbtinio intelekto (DI) mokymo išteklių su Microsoft Foundry integracija.**

#### Pridėta
- **🤖 DI pirmenybės mokymosi kelias**: Visiškai pertvarkytas kursas, orientuotas į DI vystytojus ir inžinierius
- **Microsoft Foundry integracijos vadovas**: Išsami dokumentacija, kaip sujungti AZD su Microsoft Foundry paslaugomis
- **DI modelių diegimo šablonai**: Detalus vadovas apimantis modelių pasirinkimą, konfigūraciją ir gamybinį diegimą
- **DI dirbtuvių laboratorija**: 2–3 valandų praktinis seminaras, skirtas DI programų konvertavimui į AZD diegiamus sprendimus
- **Gamybinės DI gerosios praktikos**: Įmonėms paruošti šablonai mastelio keitimui, stebėjimui ir saugumui užtikrinti
- **DI specifinės trikčių šalinimo gairės**: Išsamios trikčių šalinimo instrukcijos Microsoft Foundry modeliams, Cognitive Services ir DI diegimo problemoms
- **DI šablonų galerija**: Išskirtinė Microsoft Foundry šablonų kolekcija su sudėtingumo įvertinimais
- **Dirbtuvių medžiaga**: Pilna dirbtuvių struktūra su praktinėmis laboratorijomis ir medžiaga

#### Patobulinta
- **README struktūra**: Orientuota į DI vystytojus su 45 % bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Mokymosi keliai**: Skirtas DI vystytojo kelias kartu su tradiciniais studentų ir DevOps inžinierių keliais
- **Šablonų rekomendacijos**: Išskirtiniai DI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Bendruomenės integracija**: Sustiprinta Discord bendruomenės parama su DI specifinėmis kanalais ir diskusijomis

#### Saugumas ir gamyba
- **Valdomos tapatybės šablonai**: DI specifinės autentifikacijos ir saugumo konfigūracijos
- **Sąnaudų optimizavimas**: Žetonų naudojimo stebėjimas ir biudžeto kontrolės DI darbo krūviams
- **Daugiaplokštuminis diegimas**: Pasaulinio DI programų diegimo strategijos
- **Veiklos stebėjimas**: DI specifiniai metrika ir Application Insights integracija

#### Dokumentacijos kokybė
- **Linijinė kursų struktūra**: Logiškas mokymosi progresas nuo pradedančiojo iki pažangių DI diegimo šablonų
- **Patikrinti URL**: Visi išoriniai saugyklos nuorodos patikrinti ir pasiekiami
- **Pilnas nuorodų rinkinys**: Visos vidinės dokumentacijos nuorodos patikrintos ir veikia
- **Gamybai paruošta**: Įmonių diegimo šablonai su realiais pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Pagrindiniai pakeitimai - saugyklos pertvarka ir profesinis tobulinimas
**Ši versija žymi reikšmingą saugyklos struktūros ir turinio pateikimo pertvarką.**

#### Pridėta
- **Struktūruotas mokymosi pagrindas**: Visose dokumentacijos puslapiuose pridėtos Įvado, Mokymosi tikslų ir Mokymosi rezultatų skyriai
- **Navigacijos sistema**: Visose dokumentacijos pridėtos ankstesnės ir kitos pamokos nuorodos, kad būtų sklandus mokymosi progresas
- **Mokymosi vadovas**: Išsamus study-guide.md su mokymosi tikslais, praktikos užduotimis ir vertinimo medžiaga
- **Profesionali pateikimo forma**: Pašalinti visi emocijų piktogramos dėl geresnio prieinamumo ir profesionalumo
- **Patobulinta turinio struktūra**: Geresnis mokymosi medžiagos organizavimas ir raida

#### Pakeista
- **Dokumentacijos formatas**: Standartizuota visa dokumentacija su nuoseklia mokymosi struktūra
- **Navigacijos eiga**: Įgyvendinta logiška eigos tvarka per visą mokymosi medžiagą
- **Turinio pateikimas**: Pašalinti dekoratyviniai elementai, paliekant aiškią, profesionalią formatą
- **Nuorodų struktūra**: Atnaujintos visos vidinės nuorodos, kad palaikytų naują navigacijos sistemą

#### Pagerinta
- **Prieinamumas**: Pašalintos emocijų piktogramos dėl geresnio suderinamumo su ekrano skaitytuvais
- **Profesionalus vaizdas**: Švari, akademiško stiliaus pateikimo forma, tinkama įmoninio mokymosi poreikiams
- **Mokymosi patirtis**: Struktūruotas požiūris su aiškiais tikslais bei rezultatais kiekvienam pamokos etapui
- **Turinio organizavimas**: Geresnė loginė eiga ir temų tarpusavio ryšys

### [v1.0.0] - 2025-09-09

#### Pirminis leidimas - Išsamus AZD mokymosi saugyklos pradžia

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Visas pradžiamokslio vadovėlių serija
  - Išsami diegimo ir aprūpinimo dokumentacija
  - Detalūs trikčių šalinimo ištekliai ir derinimo vadovai
  - Priemonės ir procedūros prieš diegimą

- **Pradinių žinių modulis**
  - AZD pagrindai: Pagrindinės sąvokos ir terminologija
  - Diegimo vadovas: Platformai specifinės įdiegimo instrukcijos
  - Konfigūracijos vadovas: Aplinkos paruošimas ir autentifikacija
  - Pirmojo projekto pamoka: žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir aprūpinimo modulis**
  - Diegimo vadovas: Pilnas darbo eigos dokumentavimas
  - Aprūpinimo vadovas: Infrastruktūra kaip kodas naudojant Bicep
  - Geriausios praktikos gamybiniam diegimui
  - Daugiapakopės paslaugų architektūros šablonai

- **Prieš diegimo patikros modulis**
  - Talpos planavimas: Azure išteklių prieinamumo patikra
  - SKU parinktis: Išsamios paslaugų lygių gairės
  - Prieš skrydžio patikrinimai: Automatizuotos patikros skriptai (PowerShell ir Bash)
  - Sąnaudų vertinimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažnos problemos: Dažnai pasitaikančios problemos ir sprendimai
  - Derinimo vadovas: Sistemingas trikčių šalinimo metodas
  - Pažangios diagnostikos technikos ir įrankiai
  - Veiklos stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų atmintinė: Greita svarbiausių komandų santrauka
  - Žodynas: Išsamus terminų ir akronimų paaiškinimas
  - DUK: Detalūs atsakymai į dažnai užduodamus klausimus
  - Išorinės nuorodos ir bendruomenės ryšiai

- **Pavyzdžiai ir šablonai**
  - Paprastos internetinės programos pavyzdys
  - Statinio tinklapio diegimo šablonas
  - Konteinerinių programų konfigūracija
  - Duomenų bazės integracijos šablonai
  - Mikroservisų architektūros pavyzdžiai
  - Serverless funkcijų įgyvendinimai

#### Savybės
- **Daugiaplatforminis palaikymas**: Įdiegimo ir konfigūracijos vadovai Windows, macOS ir Linux aplinkoms
- **Skirtingų įgūdžių lygių palaikymas**: Turinys pritaikytas tiek studentams, tiek profesionaliems programuotojams
- **Praktinis dėmesys**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Visapusiškas aprėptis**: Nuo pagrindinių sąvokų iki pažangių įmonių šablonų
- **Saugumo prioritetas**: Integruotos geriausios saugumo praktikos
- **Sąnaudų optimizavimas**: Gairės efektyviam diegimui ir išteklių valdymui

#### Dokumentacijos kokybė
- **Išsamūs kodo pavyzdžiai**: Praktiniai, patikrinti kodo pavyzdžiai
- **Žingsnis po žingsnio instrukcijos**: Aiškios, pritaikomos gairės
- **Visapusiškas klaidų tvarkymas**: Trikčių šalinimas įprastoms problemoms
- **Geriausių praktikų integracija**: Pramonės standartai ir rekomendacijos
- **Versijos suderinamumas**: Nuolat atnaujinamas pagal naujausias Azure paslaugas ir azd funkcijas

## Planuojami būsimieji patobulinimai

### Versija 3.1.0 (planuojama)
#### DI platformos plėtra
- **Daugiamodelių palaikymas**: Integracijos šablonai Hugging Face, Azure Machine Learning ir individualiems modeliams
- **DI agentų karkasai**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Pažangūs RAG modeliai**: Vektorinės duomenų bazės pasirinkimai už Azure AI Search ribų (Pinecone, Weaviate ir kt.)
- **DI stebėsena**: Patobulinta modelių veiklos, žetonų naudojimo ir atsakymų kokybės stebėsena

#### Vystytojo patirtis
- **VS Code plėtinys**: Integruota AZD ir Microsoft Foundry vystymo aplinka
- **GitHub Copilot integracija**: DI pagalbinis AZD šablonų generatorius
- **Interaktyvūs mokymai**: Praktinės programavimo užduotys su automatiniu patikrinimu DI scenarijams
- **Vaizdo turinys**: Papildomi vaizdo mokymai vaizdiniams mokytojams, orientuoti į DI diegimus

### Versija 4.0.0 (planuojama)
#### Įmonių DI šablonai
- **Valdymo sistema**: DI modelių valdymas, atitiktis ir auditavimo grandinės
- **Daugiapaskirtinis DI**: Šablonai keliems klientams aptarnauti izoliuotomis DI paslaugomis
- **Edge DI diegimas**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hibridinė debesų DI**: Daugiadebesų ir hibridinių DI darbo krūvių diegimo šablonai

#### Pažangios funkcijos
- **DI darbo eigos automatizavimas**: MLOps integracija su Azure Machine Learning darbo eigomis
- **Pažangus saugumas**: Nulinės pasitikėjimo modeliai, privatūs galiniai taškai ir pažangi grėsmių apsauga
- **Veiklos optimizavimas**: Pažangūs šlifavimo ir mastelio keitimo būdai didelio pralaidumo DI programoms
- **Pasaulinė plėtra**: Turinys ir krašto talpinimo šablonai DI programoms

### Versija 3.0.0 (planuojama) - Pakeista dabartiniu leidimu
#### Siūlomi priedai - Įgyvendinti v3.0.0 versijoje
- ✅ **DI orientuotas turinys**: Visapusiška Microsoft Foundry integracija (Įgyvendinta)
- ✅ **Interaktyvūs mokymai**: Praktinė DI dirbtuvių laboratorija (Įgyvendinta)
- ✅ **Pažangus saugumo modulis**: DI specifiniai saugumo šablonai (Įgyvendinta)
- ✅ **Veiklos optimizavimas**: DI darbo krūvių pritaikymo strategijos (Įgyvendinta)

### Versija 2.1.0 (planuojama) - Iš dalies įgyvendinta v3.0.0 versijoje
#### Nedideli patobulinimai - dalis įgyvendinta dabartiniame leidime
- ✅ **Papildomi pavyzdžiai**: DI orientuoti diegimo scenarijai (Įgyvendinta)
- ✅ **Išplėstas DUK**: DI specifiniai klausimai ir trikčių šalinimas (Įgyvendinta)
- **Įrankių integracija**: Išplėsti IDE ir redaktorių integracijos vadovai
- ✅ **Stebėjimo plėtra**: DI specifiniai stebėjimo ir įspėjimų šablonai (Įgyvendinta)

#### Dar planuojama būsimame leidime
- **Mobiliesiems pritaikyta dokumentacija**: Reaguojantis dizainas mobiliajam mokymuisi
- **Dokumentacijos offline prieiga**: Atsisiunčiami dokumentacijos paketai
- **Patobulinta IDE integracija**: VS Code plėtinys AZD ir DI darbo srautams
- **Bendruomenės skydelis**: Realaus laiko bendruomenės rodikliai ir indėlių sekimas

## Kaip prisidėti prie pakeitimų žurnalo

### Pakeitimų pranešimas
Prisidedant prie šios saugyklos, prašome užtikrinti, kad pakeitimų žurnalas apimtų:

1. **Versijos numeris**: Vadovaujantis semantiniu versijavimu (major.minor.patch)
2. **Data**: Leidimo arba atnaujinimo data YYYY-MM-DD formatu
3. **Kategorija**: Pridėta, Pakeista, Nutraukta, Pašalinta, Ištaisyta, Saugumas
4. **Aiškus aprašymas**: Trumpas, kas pasikeitė
5. **Poveikio vertinimas**: Kaip pakeitimai veikia esamus naudotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujovės, dokumentacijos skyriai arba galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, scenarijai ar paslaugos

#### Pakeista
- Pakeitimai esamoje funkcionalumo ar dokumentacijoje
- Atnaujinimai aiškumo ar tikslumo gerinimui
- Turinio ar organizacijos pertvarka

#### Nutraukta
- Funkcijos ar metodai, kurie yra išimami iš naudojimo
- Dokumentacijos skyriai numatyti pašalinti
- Metodai, turintys geresnių alternatyvų

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebėra aktualūs
- Pasenusi informacija ar nutraukti metodai
- Pasikartojantis ar sujungtas turinys

#### Ištaisyta
- Klaidų dokumentacijoje ar kode taisymai
- Praneštų problemų arba klaidų sprendimai
- Tikslumo ar funkcionalumo gerinimai

#### Saugumas
- Saugumo pagerinimai arba pataisymai
- Saugumo gerosios praktikos atnaujinimai
- Saugumo spragų pašalinimas

### Semantinio versijavimo gairės

#### Pagrindinė versija (X.0.0)
- Reikšmingi pokyčiai, reikalaujantys naudotojo veiksmų
- Svarbi turinio ar organizacijos struktūrizacija
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Antrinė versija (X.Y.0)
- Naujos funkcijos ar turinio pridėjimai
- Pritaikymai išlaikant suderinamumą su ankstesnėmis versijomis
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Pataisos versija (X.Y.Z)
- Klaidų taisymai ir pataisymai
- Nedideli esamo turinio patobulinimai
- Paaiškinimai ir smulkūs patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Aktyviai skatiname bendruomenės grįžtamąjį ryšį, siekiant pagerinti šį mokymosi išteklių:

### Kaip pateikti atsiliepimą
- **GitHub problemos**: Praneškite apie problemas arba pasiūlykite patobulinimus (DI specifinės problemos ypač laukiamos)
- **Discord diskusijos**: Dalinkitės idėjomis ir bendraukite su Microsoft Foundry bendruomene
- **Pull request’ai**: Tiesiogiai prisidėkite prie turinio, ypač DI šablonų ir vadovų
- **Microsoft Foundry Discord**: Dalyvaukite #Azure kanale diskusijose apie AZD ir DI
- **Bendruomenės forumai**: Dalyvaukite platesnėse Azure vystytojų diskusijose

### Atsiliepimų kategorijos
- **DI turinio tikslumas**: Korekcijos DI paslaugų integracijos ir diegimo informacijoje
- **Mokymosi patirtis**: Pasiūlymai dėl geresnio DI vystytojo mokymosi proceso
- **Trūkstamas DI turinys**: Prašymai papildomų DI šablonų, šablonų arba pavyzdžių
- **Prieinamumas**: Pagerinimai įvairesniems mokymosi poreikiams
- **DI įrankių integracija**: Pasiūlymai geresnei DI kūrimo darbo eigos integracijai
- **Gamybiniai DI šablonai**: Įmonių DI diegimo modelių prašymai

### Atsako įsipareigojimas
- **Problemos atsakymas**: Per 48 valandas nuo pranešimo gavimo
- **Funkcijų užklausos**: Įvertinimas per vieną savaitę
- **Bendruomenės indėliai**: Apžvalga per vieną savaitę
- **Saugumo problemos**: Prioritetinis ir spartus atsakas

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Mėnesiniai peržiūros**: Turinys ir nuorodų tikrinimas
- **Ketvirtiniai atnaujinimai**: Dideli turinio papildymai ir patobulinimai
- **Pusmečio peržiūros**: Išsamus struktūros ir funkcionalumo atnaujinimas
- **Metiniai leidimai**: Pagrindiniai versijų atnaujinimai su reikšmingais patobulinimais

### Stebėsena ir kokybės užtikrinimas
- **Automatizuotas testavimas**: Reguliarus kodo pavyzdžių ir nuorodų patikrinimas
- **Bendruomenės atsiliepimų integracija**: Reguliarus naudotojų pasiūlymų įtraukimas
- **Technologijų atnaujinimai**: Suderinimas su naujausiomis Azure paslaugomis ir azd versijomis
- **Prieinamumo auditas**: Reguliarus peržiūrėjimas pagal įtraukiančio dizaino principus

## Versijų palaikymo politika

### Dabartinis versijų palaikymas
- **Naujausia pagrindinė versija**: Pilnas palaikymas su reguliariais atnaujinimais
- **Ankstesnė pagrindinė versija**: Saugumo atnaujinimai ir kritiniai pataisymai 12 mėnesių laikotarpiu
- **Senausios versijos**: Tik bendruomenės palaikymas, oficialių atnaujinimų nėra

### Migracijos gairės
Kai išleidžiamos pagrindinės versijos, mes teikiame:
- **Migracijos gaires**: Žingsnis po žingsnio pereinamojo laikotarpio instrukcijos
- **Suderinamumo pastabas**: Informacija apie pokyčius, kurie gali sulaužyti suderinamumą
- **Įrankių palaikymą**: Skriptai ar utilitai migracijai palengvinti
- **Bendruomenės palaikymas**: Specializuoti forumai migracijos klausimams aptarti

---

**Navigacija**
- **Ankstesnis pamoka**: [Studijų gidas](resources/study-guide.md)
- **Kitas pamoka**: Grįžti į [Pagrindinį README](README.md)

**Sekite naujienas**: Stebėkite šį saugyklą, kad gautumėte pranešimus apie naujus leidimus ir svarbius mokymosi medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
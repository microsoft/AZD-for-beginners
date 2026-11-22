# Pakeitimų žurnalas - AZD Pradedantiesiems

## Įvadas

Šis pakeitimų žurnalas dokumentuoja visus reikšmingus pakeitimus, atnaujinimus ir patobulinimus AZD Pradedantiesiems saugykloje. Mes laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį pakeitimų žurnalą, jūs:
- Būsite informuoti apie naujas funkcijas ir turinio papildymus
- Suprasite patobulinimus esamoje dokumentacijoje
- Seksite klaidų taisymus ir pataisas, kad užtikrintumėte tikslumą
- Seksite mokymosi medžiagų evoliuciją laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pakeitimų įrašus, galėsite:
- Nustatyti, kokį naują turinį ir išteklius galima naudoti mokymuisi
- Suprasti, kurios skiltys buvo atnaujintos arba patobulintos
- Planuoti savo mokymosi kelią remdamiesi naujausia medžiaga
- Teikti atsiliepimus ir pasiūlymus dėl būsimų patobulinimų

## Versijų istorija

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry plėtinys 1.0 dabar yra plačiai prieinamas

Paketas `microsoft.foundry` 1.0 yra **gyvenime ir plačiai prieinamas**, kaip paskelbta [2026 m. lapkričio 5 d.](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kursas dabar moko išleistą GA darbo eigą, o ne būsimą leidimą. Pradėkite naudodami AZD **1.37.0 ar naujesnę versiją** ir `azd ext install microsoft.foundry`.

#### Prieinama šiame kurso atnaujinime
- Anglų kalbos vadovas naudoja GA paketą kaip numatytąją įdiegimo kelią ir paaiškina jo septynias atskirai versijuojamas pagrindines plėtinius.
- [Hosted-agent peržiūra](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) apima aukštesnio lygio Python Agent Framework Responses API pavyzdį, dabartinę uv, Python 3.13+, naujo/esamo projekto pasirinkimą, modelio pakartotinį naudojimą ir `azure.yaml` peržiūrą.
- Vietinis į debesis darbo eiga apima Agent Inspector testavimą, Azure pagrįstas modelių kvietimų sąnaudas, nuotolinius kodo kūrimus, iškeltą kvietimą, debesų sekimą, diegimo peržiūrą, žurnalus ir diagnostiką.
- Atskiras vertinimo vadovas apima duomenų rinkinių/vertinimo kriterijų generavimą ir peržiūrą, vardinio vertinimo konfigūravimą, išteklių registraciją ir rezultatų tikrinimą. Senesnės vertinimo/optimizavimo instrukcijos lieka migracijos istorijoje, ne dabartiniame leidimo pagrinde.
- Foundry CI/CD vadovas apima vykdytojo plėtinio diegimą, autentifikuotą diegimą, vertinimo išteklius/prieigą ir aiškią kokybės vartus.
- Išvalymo vadovas skiria naujai sukurtus ir pakartotinai naudojamus Foundry projektus. Dirbtuvės susieja su atskira GA užduotimi, nekaitant jos pavyzdinių testų.
- Kurso navigacija, mokymosi tikslai, parengties reikalavimai, šablonų lapas, DUK ir studijų gidas atspindi GA darbo eigą. Sugeneruoti vertimai nėra rankiniu būdu redaguojami.

#### Apžvalgos apimtis
- Remiantis GA paskelbimu, susietais Microsoft Learn vadovais ir aukštesnio lygio pavyzdžio konfigūracija. Nevykdyta gyva Azure tiekimas, diegimas, modelių kvietimas ar vertinimas.
- Paketinis GA nereiškia GA kiekvienai pasirenkamai funkcijai, nepriklausomam plėtiniui ar SDK, taip pat nepatvirtina pavyzdžių gamybai.

### [v3.24.0]- 2026-11-04

#### Pataisyta
- Sutvarkyta anglų kalbos kurso navigacija, perkelti puslapio keliai, trūkstamos ankerinės nuorodos ir pasenę išoriniai nurodymai, įskaitant 2 skyriaus nuorodą į gamybinį AI vadovą.
- Peržiūrėti dabartiniai nurodymai pagal paskelbtą AZD 1.37.2, agentų 1.0.0-beta.23 ir vertinimų 1.0.0-beta.2. Dokumentuota atskira `azd ai eval` darbo eiga ir optimizavimo konfigūracijos migracija.
- Pataisyti nepalaikomi CLI vėliavėlės, autentifikacijos ribos, paprastojo teksto aplinkos/slapto nurodymai, infrastruktūros atnaujinimai, modelio konfigūracija ir destruktyvūs atkūrimo pavyzdžiai.
- Atnaujintas seminaras pagal dabartinį AI agentų pavyzdį, įskaitant faktinius kablius, konfigūracijos įvestis, vertinimo testus, raudonojo komandos įėjimo taškus ir stebimumą.
- Pataisytos pavyzdinės įdiegimo teiginiai ir sutvarkytos susijusios programos/infrastruktūros/konfigūracijos problemos. Mažmeninės prekybos architektūros medžiaga aiškiai atskirta nuo pilnos veikiančios taikomosios programos.
- Atstatyta CodeQL kalbų matrica, pasirinktas palaikomas Node.js 24 kūrimo konteineriui ir sukonfigūruoti diegimo tikrintojai, kad praneštų apie nepavykusius versijos komandas.

#### Pridėta
- Tik anglų kalba veikiantis neprisijungęs nuorodų/ankerinių tikrintuvas, regresijos testai ir dokumentacijos darbo eiga, kuri taip pat kuria seminarą griežtame režime. Generuojamos vertimai ir išversti vaizdai neįtraukti.

#### Tikrinimo apimtis
- Šaltinių, sintaksės, konfigūracijos, vietinio elgesio ir tinklo nuorodų tikrinimai nenustato tiesioginio Azure diegimo, kvotų, RBAC, regioninių modelių prieinamumo, atsiskaitymo, saugumo atitikimo ar gamybos pasiruošimo.
- Žemiau pateikti seni įrašai yra istoriniai įrašai, o ne dabartinės komandos ar leidimo instrukcijos.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 atnaujinimas: versijos naujausios būsenos atnaujinimas
**Ši versija iš naujo patvirtina kursą pagal `azd` `1.27.1` (2026 m. liepa, naujausias stabili išleidimas) ir dabartinį peržiūros AI agento plėtinį `azure.ai.agents` `1.0.0-beta.5`, todėl visi „patvirtinta pagal“ ženklai yra atnaujinti po 1.26.0, 1.27.0 ir 1.27.1 versijų išleidimų.**

#### Pakeitimai
- **✅ Patikros bazinė linija atnaujinta** nuo `azd 1.25.6` (2026 m. birželis) iki `azd 1.27.1` (2026 m. liepa) pagrindiniame README, visuose skyriaus README, 1 skyriaus kūrimo konteinerio pamokoje (įskaitant pririštų versijų pavyzdžius), 4 skyriaus pasirinktinių šablonų pamokoje, 5 skyriaus daugiagento pamokoje ir dirbtuvių dokumentacijoje
- **🤖 2 skyriaus bazinė linija atnaujinta** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.27.1` per `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ir `microsoft-foundry-integration.md`; patikros pastabų datos atnaujintos iki 2026-07-13
- **🧩 AI agento plėtinys atnaujintas** nuo `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` iki dabartinės `1.0.0-beta.5` versijos 2 skyriaus README ir `agents.md`
- **🧪 Dirbtuvių patikros pavyzdys** (`azd version` išvestis) atnaujintas iki `1.27.1`

#### Pastabos apie svarbius azd išleidimus (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go palaikymas Azure Functions Flex Consumption, `azd config sub-filter` nuomininkams skirtų prenumeratos filtrų, savarankiški plėtinių paketai (`azd x pack --bundle`), ir `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry projektų/agentų modeliavimas tiesiogiai `azure.yaml` (Bicep ir Terraform nereikalinga inicijavimui), konteinerių diegimo palaikymas App Service (`host: appservice` + `language: docker`), tiesioginė `-s/--source` `azd extension` komandoms, ir `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` ženklas `azd extension install`, pasenę modeliai pagal nutylėjimą neįtraukiami į katalogo/limito užklausas, ir keli klaidų ištaisymų pataisymai

#### Atseikėti failai
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

#### Pradedančiojo tarpų užpildymas #2: Šablonų kūrimas, Dev konteineriai, Pulumi, Azure DevOps, paslaugų principalai ir daugiau
**Ši versija uždaro likusius vidutinio lygio tarpus, kuriuos nustatė azd-coverage analizė: kaip kurti ir publikuoti savo šabloną, atkartojamos dev-konteinerių/Codespaces aplinkos, Pulumi infrastruktūros tiekėjas, Azure DevOps CI/CD žingsnis po žingsnio, paslaugų principalo autentifikacija, kompiuterio pasirinkimo rekomendacijos (AKS/Spring Apps), `azd restore`/`azd package` paaiškinimai, kabliuko klaidų tvarkymas ir komandos/bendrų aplinkų praktikos.**

#### Pridėta
- **🧱 Nauja 4 skyriaus pamoka** `docs/chapter-04-infrastructure/custom-templates.md` — kaip kurti savo azd šabloną: reikalaujama struktūra (`azure.yaml`, `infra/`, `src/`), `metadata.template` laukas, infrastruktūros parametrizavimas naudojant `uniqueString()` resurso žetoną ir `azd-env-name` žymą, lokalus testavimas su `azd init --template <local-path>`, publikavimas GitHub ir pateikimas Awesome AZD galerijai
- **📦 Nauja 1 skyriaus pamoka** `docs/chapter-01-foundation/dev-containers.md` — atkartojamos azd aplinkos su Dev konteineriais ir GitHub Codespaces: minimalus `.devcontainer/devcontainer.json` naudojant oficialią `ghcr.io/azure/azure-dev/azd` funkciją, kalbai specifinės funkcijos, `docker-in-docker` konteinerių priegloboms ir `azd auth login --use-device-code` nuotoliniam prisijungimui
- **🧩 Pulumi su azd** skyrius `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi aplanko išdėstymas, aplankai susieti su azd aplinkomis, privalomi išvesties duomenys/žymėjimas ir vienodas `azd up` / `azd down` darbo eiga
- **🎯 Kompiuterio pasirinkimo patarimai** `docs/chapter-04-infrastructure/provisioning.md` — pradedančiam draugiškas palyginimas tarp `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ir `springapp`, su rekomendacijomis, kada rinktis AKS arba Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gidas** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, paslaugų ryšys su darbo krūvio tapatybės federacija (OIDC), sugeneruotas `azure-dev.yml` ir kintamųjų grupių nustatymas
- **🔑 Paslaugų principalai (Modelis 4)** pridėta `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktyvi `azd auth login` su kliento slaptuoju raktu vs. federuotų/OIDC kredencialų naudojimas, kada naudoti ir saugus kredencialų saugojimas
- **🪝 Kabliukų klaidų tvarkymas** poskyris `docs/chapter-04-infrastructure/deployment-guide.md` — išeities kodai ir `set -e`, `continueOnError`, kabliukų testavimas izoliuotai su `azd hooks run`, OS specifinės konsolės ir `--debug`
- **👥 Komandos / bendros aplinkos** skyrius `docs/chapter-03-configuration/configuration.md` — kas gyvena `.azure/`, ką ignoruoti git, kiekvieno kūrėjo aplinkos, `azd env list`/`select`, ir aplinkos reikšmių pateikimas CI/CD
- **🧰 `azd restore` ir išplėstiniai `azd package`** paaiškinimai `resources/cheat-sheet.md` — priklausomybių atkūrimas ir išplečiamo artefakto kūrimas be diegimo

#### Pakeitimai
- **🧭 4-o skyriaus pamokų lentelė** atnaujinta, įtraukiant naują pamoką „Sukurk savo šabloną“ (3 pamoka)
- **🧭 1-o skyriaus pamokų lentelė** atnaujinta, įtraukiant naują pamoką „Dev konteineriai ir Codespaces“ (5 pamoka); navigacijos poraštės sujungtos tarp `bring-your-own-app.md` ir `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pradedančiųjų trūkstamos dalys: praktinė daugiaagentė pamoka, „Atsinešk savo programą“, Terraform ir CI/CD perėjimas
**Ši versija užpildo didžiausias spragas pilname pradedančiųjų vadove pridėdama dvi naujas praktines pamokas (diegiamą daugiaagentę peržiūrą ir azd pridėjimą prie esamos programos), pradedančiams skirtą kabliukų įvadą, Terraform su azd skyrių, žingsnis po žingsnio GitHub Actions pipeline apžvalgą, naujų peržiūros plėtinių paaiškinimą ir aiškią diegimo patikros kontrolinę sąrašą.**

#### Pridėta
- **🤝 Nauja 5-o skyriaus pamoka** `docs/chapter-05-multi-agent/multi-agent-basics.md` — visiškai praktinė, diegiama dviejų agentų peržiūra (orchestratorius + specialistai) naudojant realų šabloną (`contoso-creative-writer`), apimanti, kada naudoti daugiaagentę, `azd up` darbo eigą, įdiegtų resursų supratimą, tarpagentinį sekimą, pritaikymą ir išvalymą
- **📦 Nauja 1-o skyriaus pamoka** `docs/chapter-01-foundation/bring-your-own-app.md` — kaip pridėti azd prie esamo projekto su `azd init` („naudoti kodą dabartiniame kataloge“), supratimas apie `azure.yaml` ir `infra/`, `azd infra generate`, šeimininko aptikimą ir diegimą su `azd up`
- **🌐 Terraform su azd** skyrius pridėtas prie `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigūracija, `.tf` katalogo struktūra, būtini `AZURE_*` išvestys ir `azd-env-name` žymėjimas, bei identiška `azd up` / `azd down` darbo eiga (užpildo spragą, kur buvo teigiama apie Terraform palaikymą, bet parodytas tik Bicep)
- **⚙️ Žingsnis po žingsnio GitHub Actions vadovas** `docs/chapter-08-production/production-ai-practices.md` — nuo GitHub saugyklos iki automatizuotų diegimų: `azd pipeline config`, OIDC federaciniai kredencialai (be saugomų slaptažodžių), sugeneruotas `azure-dev.yml` ir slaptažodžių prieš kintamuosius gairės
- **🪝 Pradedančiųjų „Naujas su kabliais?“ įvadas** `docs/chapter-04-infrastructure/deployment-guide.md` — kas yra kablis, kablio etapai lentelėje, minimalus pirmas kablis ir kablių paleidimas rankiniu būdu su `azd hooks run`
- **✅ „Patikrinkite savo diegimą“ kontrolinis sąrašas** pridėtas 5 žingsniui `docs/chapter-01-foundation/first-project.md` — kvapo testas, sveikatos patikros taškas ir aiškūs sėkmės kriterijai
- **🧩 Paaiškinimas naujoms peržiūros plėtinėms** `azure.ai.skills` ir `azure.ai.connections` (kas jos yra ir kada jas naudoti) faile `docs/chapter-08-production/production-ai-practices.md`

#### Pakeista
- **🧭 5 skyriaus pamokų lentelė** ištaisyta: `multi-agent-basics.md` dabar yra 1 pamoka (vienintelė visiškai praktinė pamoka), teisingai pažymėta, kad 2 pamoka yra 6 skyriuje, o mažmeninės prekybos scenarijus yra architektūrinis šablonas, o ne vieno komandos šablonas
- **🧭 1 skyriaus pamokų lentelė** dabar apima naują "Atsinešk savo programėlę" pamoką (4 pamoka)
- **🔗 Naršymo poraštės** atnaujintos: `first-project.md` dabar veda į `bring-your-own-app.md`

#### Ištaisyta
- **🧱 Užpildytas "reikalautas, bet trūkstamas" Terraform spraga** — kursas anksčiau minėjo Terraform palaikymą, bet jo nerodė
- **🔀 Ištaisyti klaidinantys 5 skyriaus kryžminiai saitai**, kurie nurodė kad egzistuoja pilnas daugiaagentinis įgyvendinimas, nors buvo tik architektūrinis šablonas

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

#### AZD 1.25.6 atnaujinimas, pilnos agento gyvavimo ciklo komandos ir Aspire prekės ženklas
**Ši versija patikrina kursą pagal `azd` `1.25.6` (2026 m. birželis) ir `azure.ai.agents` `0.1.40-preview` plėtinį, išplečia DI nurodymus nuo „agentą sukurti“ iki pilno agento gyvavimo ciklo (testavimas → vertinimas → optimizavimas → tikrinimas → ištrynimas), pristato naujus `azure.ai.skills` ir `azure.ai.connections` peržiūros plėtinius, ir pažymi ".NET Aspire" → "Aspire" produkcijos pervadinimą.**

#### Pridėta
- **🔁 Pilnas agento gyvavimo ciklo aprašymas** pradedantiesiems ir DI inžinieriams visame dokumente:
  - `docs/chapter-01-foundation/azd-basics.md` — Gyvavimo ciklo lentelė (sudėlioti → testuoti → matuoti → tobulinti → tikrinti → valyti) pridėta skyriuje Plėtiniai ir DI komandos
  - `docs/chapter-08-production/production-ai-practices.md` — Naujas skyrius „Agentų gyvavimo ciklo valdymas“, apimantis `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
  - `resources/cheat-sheet.md` — Išplėstos DI agentų komandos su `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
- **🧩 Nauji peržiūros plėtiniai** dokumentuoti: `azure.ai.skills` (pernaudojami agento įgūdžiai) ir `azure.ai.connections` (Foundry jungtys) pridėti prie plėtinių lentelės ir šarvų lapo
- **⏱️ Atsakymo laiko nurodymai** — `azd ai agent invoke` pavyzdžiai dabar parodo bendrą vėlinimą ir laiką iki pirmo baito
- **📌 Versijos juosta** pagrindiniame README nukreipianti besimokančiuosius į `azd version` ir `azd upgrade`

#### Pakeista
- **✅ Validacijos pagrindas atnaujintas** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.25.6` (2026 m. birželis) visuose skyriaus README ir dirbtuvių dokumentuose
- **🤖 2 skyriaus išplėtimo pastaba** atnaujinta nuo `azure.ai.agents` `0.1.18-preview` iki `0.1.40-preview`
- **🧪 Dirbtuvių validacijos pavyzdys** (`azd version` išvestis) atnaujinta iki `1.25.6`
- **🧭 README „Kas naujo azd šiandien“** atnaujinta paryškinti galutinį agento gyvenimo ciklą, naujas AI išplėtimo galimybes ir neseniai įdiegtus patogumo patobulinimus (`azd init` idempotentiškumas, `azd auth login` pasenusių raktų išvalymas, `azd tool` pirmojo paleidimo užklausa)
- **📖 2 skyriaus agents.md (4 pasirinkimas)** dabar nukreipia besimokančiuosius į diegimo pabaigos komandas, o ne stabdo ties `azd up`

#### Ištaisyta
- **🏷️ Produkto pavadinimas** – pridėta Aspire prekės ženklo pakeitimo pastaba („.NET Aspire“ dabar tiesiog „Aspire“); azd Aspire palaikymas nepakitęs
- **🔎 Gyvos versijos validacija** patvirtinta pagal Azure Developer CLI leidimo srautą: stabili CLI `1.25.6` (2026-06-12) ir `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Pradedančiųjų įvedimo paaiškinimas, nustatymo validacija ir galutinis AZD komandų valymas
**Ši versija seka AZD 1.23 validacijos apžvalgą su pradedančiųjų dokumentacijos peržiūra: ji paaiškina AZD pirmojo prisijungimo gaires, prideda vietinius nustatymo validacijos scenarijus, patikrina pagrindines komandas pagal gyvą AZD CLI ir pašalina paskutinius pasenusius anglų kalbos komandų paminėjimus už pokyčių žurnalo ribų.**

#### Pridėta
- **🧪 Pradedančiųjų nustatymo validacijos scenarijai** su `validate-setup.ps1` ir `validate-setup.sh`, kad besimokantieji galėtų patikrinti reikalingus įrankius prieš pradėdami 1 skyrių
- **✅ Išankstiniai nustatymo validacijos žingsniai** pagrindiniame README ir 1 skyriaus README, kad praleisti išankstiniai reikalavimai būtų aptikti prieš `azd up`

#### Pakeista
- **🔐 Pradedančiųjų prisijungimo gairės** dabar nuosekliai laiko `azd auth login` pagrindiniu AZD darbo srautų keliu, o `az login` išskirtas kaip pasirenkamas, jei tiesiogiai nenaudojamos Azure CLI komandos
- **📚 1 skyriaus įvedimo eiga** dabar nukreipia besimokančiuosius patikrinti vietinį nustatymą prieš diegimą, prisijungimą ir pirmąjį diegimą
- **🛠️ Validatoriaus žinutės** dabar aiškiai atskiria blokuojamus reikalavimus nuo pasirenkamų Azure CLI įspėjimų AZD tik pradedančiųjų keliui
- **📖 Konfigūracijos, trikčių šalinimo ir pavyzdžių dokumentacija** dabar skiria privalomą AZD autentifikaciją nuo pasirenkamo Azure CLI prisijungimo, kur abu anksčiau buvo pateikti be konteksto

#### Ištaisyta
- **📋 Likusios iš anglų kalbos komandinės nuorodos** atnaujintos į dabartines AZD formas, įskaitant `azd config show` sukčiavimo lape ir `azd monitor --overview` ten, kur buvo numatyta Azure portalo apžvalgos gairė
- **🧭 Pradedančiųjų teiginiai 1 skyriuje** sušvelninti, kad nebūtų garantuojamas nulinis klaidų kiekis arba atsitraukimo elgsena visose šablonuose ir Azure ištekliuose
- **🔎 Veikiantis CLI patikrinimas** patvirtino dabartinę `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ir `azd down --force --purge` palaikymą

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

#### AZD 1.23.12 validacija, dirbtuvių aplinkos plėtra ir DI modelio atnaujinimas
**Ši versija atlieka dokumentacijos validacijos patikrinimą pagal `azd` `1.23.12`, atnaujina pasenusius AZD komandos pavyzdžius, atnaujina DI modelio gaires į dabartinius numatytuosius nustatymus ir išplečia dirbtuvių instrukcijas ne tik GitHub Codespaces, bet ir palaiko kūrimo konteinerius bei vietines klonavimo aplinkas.**

#### Pridėta
- **✅ Validacijos pastabos pagrindiniuose skyriuose ir dirbtuvių dokumentacijoje** siekiant aiškiai nurodyti išbandytą AZD pagrindą mokiniams, naudojantiems naujesnes ar senesnes CLI versijas
- **⏱️ Diegimo laiko viršutinės ribos gairės** ilgai trunkantiems DI programų diegimams naudojant `azd deploy --timeout 1800`
- **🔎 Plėtinių tikrinimo žingsniai** su `azd extension show azure.ai.agents` DI darbo eigos dokumentacijoje
- **🌐 Platesnės dirbtuvių aplinkos gairės** apimančios GitHub Codespaces, kūrimo konteinerius ir vietinius klonus naudojant MkDocs

#### Pakeista
- **📚 Skyrių įžangos README failai** dabar nuosekliai pažymi validaciją pagal `azd 1.23.12` pagrindinėse, konfigūracijos, infrastruktūros, daugiaagentų, priešdiegimo, trikčių šalinimo ir gamybos skiltyse
- **🛠️ AZD komandų nuorodos** atnaujintos į dabartines formas visoje dokumentacijoje:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` arba `azd env get-value(s)` priklausomai nuo konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, kai numatyta Application Insights apžvalga
- **🧪 Provizionavimo peržiūros pavyzdžiai** supaprastinti iki dabartinio palaikomo naudojimo, tokio kaip `azd provision --preview` ir `azd provision --preview -e production`
- **🧭 Darbų eigą dirbtuvėse** atnaujinta, kad mokiniai galėtų atlikti laboratorijas Codespaces, kūrėjo konteineryje arba vietinėje kopijoje, o ne tik tikintis vykdymo tik Codespaces aplinkoje
- **🔐 Autentifikacijos gairės** dabar pirmenybę teikia `azd auth login` AZD darbo eigos metu, o `az login` laikomas pasirinktinai, kai tiesiogiai naudojamos Azure CLI komandos

#### Ištaisyta
- **🪟 „Windows“ diegimo komandos** suvienodintos pagal dabartinį `winget` paketo rašybos standartą diegimo vadove
- **🐧 „Linux“ diegimo gairės** pataisytos taip, kad būtų išvengta nepalaikomų distribucijai būdingų `azd` paketų tvarkyklės komandų ir vietoj to, kur reikia, nurodoma į leidimo failus
- **📦 DI modelių pavyzdžiai** atnaujinti nuo senesnių numatytųjų, tokių kaip `gpt-35-turbo` ir `text-embedding-ada-002` iki dabartinių pavyzdžių, tokių kaip `gpt-4.1-mini`, `gpt-4.1` ir `text-embedding-3-large`
- **📋 Diegimo ir diagnostikos fragmentai** pataisyti, kad naudotų dabartinius aplinkos ir būsenos komandų žurnalams, skriptams ir trikčių šalinimo veiksmams
- **⚙️ GitHub Actions gairės** atnaujintos nuo `Azure/setup-azd@v1.0.0` į `Azure/setup-azd@v2`
- **🤖 MCP/Copilot sutikimo gairės** atnaujintos nuo `azd mcp consent` į `azd copilot consent list`

#### Patobulinta
- **🧠 DI skyriaus gairės** dabar geriau paaiškina peržiūros jautrią `azd ai` elgseną, nuomininko specifinį prisijungimą, dabartinį plėtinio naudojimą ir atnaujintas modelio diegimo rekomendacijas
- **🧪 Dirbtuvių instrukcijos** dabar naudoja realesnius versijų pavyzdžius ir aiškesnę aplinkos nustatymo kalbą praktinėms laboratorijoms
- **📈 Gamybos ir trikčių šalinimo dokumentacija** dabar geriau atitinka dabartinius stebėjimo, atsarginio modelio ir kainų lygių pavyzdžius

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

#### AZD DI CLI komandos, turinio validavimas ir šablonų išplėtimas
**Ši versija praplečia `azd ai`, `azd extension` ir `azd mcp` komandų aprėptį visuose su dirbtiniu intelektu susijusiuose skyriuose, ištaiso neveikiančias nuorodas ir pasenusią kodą faile agents.md, atnaujina žinyną ir pertvarko Pavyzdžių šablonų skiltį su patvirtintais aprašymais bei naujais Azure AI AZD šablonais.**

#### Pridėta
- **🤖 AZD AI CLI aprėptis** per 7 failus (anksčiau tik 8 skyriuje):
  - `docs/chapter-01-foundation/azd-basics.md` — Nauja skiltis „Prapleitimai ir DI komandos“, pristatanti `azd extension`, `azd ai agent init` ir `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 4 variantas: `azd ai agent init` su palyginimo lentele (šablono ir manifestų metodai)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pogrupiai „AZD prapletimai Foundry“ ir „Agentų pirminis diegimas“
  - `docs/chapter-05-multi-agent/README.md` — Greito starto skyrius dabar rodo tiek šablono, tiek manifestų pagrindu įdiegtas gaires
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Diegimo skiltyje pridėta `azd ai agent init` parinktis
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pogrupis „AZD DI prapletimų komandų diagnostikai“
  - `resources/cheat-sheet.md` — Nauja skiltis „DI & prapletimų komandos“ su `azd extension`, `azd ai agent init`, `azd mcp` ir `azd infra generate`
- **📦 Naujieji AZD AI pavyzdžių šablonai** faile `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG pokalbis su Blazor WebAssembly, Semantic Kernel ir balso pokalbio palaikymu
  - **azure-search-openai-demo-java** — Java RAG pokalbis naudojant Langchain4J su ACA/AKS diegimo galimybėmis
  - **contoso-creative-writer** — Daugiaprotis kūrybinio rašymo programėlė su Azure AI Agent Service, Bing Grounding ir Prompty
  - **serverless-chat-langchainjs** — Serverless RAG naudojant Azure Functions + LangChain.js + Cosmos DB su vietiniu Ollama kūrimo palaikymu
  - **chat-with-your-data-solution-accelerator** — Įmonių RAG greitintuvas su administravimo portalu, Teams integracija ir PostgreSQL/Cosmos DB pasirinkimais
  - **azure-ai-travel-agents** — Daugiagentinis MCP orkestracijos pavyzdinis projektas su serveriais .NET, Python, Java ir TypeScript kalbomis
  - **azd-ai-starter** — Minimalus Azure AI infrastruktūros Bicep pradžios šablonas
  - **🔗 Nuostabus AZD AI galerijos saitas** — Nuoroda į [awesome-azd AI galeriją](https://azure.github.io/awesome-azd/?tags=ai) (daugiau nei 80 šablonų)

#### Ištaisyta
- **🔗 agents.md navigacija**: Ankstesnės/Kitos nuorodos dabar atitinka 2 skyriaus README pamokų tvarką (Microsoft Foundry integracija → Agentai → DI modelio diegimas)
- **🔗 agents.md sugedusios nuorodos**: `production-ai-practices.md` pataisyta į `../chapter-08-production/production-ai-practices.md` (3 kartus)
- **📦 agents.md pasenęs kodas**: Pakeistas `opencensus` į `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neteisingas API**: Perkeltas `max_tokens` iš `create_agent()` į `create_run()` kaip `max_completion_tokens`
- **🔢 agents.md žetonų skaičiavimas**: Pakeista apytikslė `len//4` į `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Pataisytos paslaugos iš „Cognitive Search + App Service“ į „Azure AI Search + Azure Container Apps“ (naujasis numatytasis hostas nuo 2024 m. spalio)
- **contoso-chat**: Atnaujintas aprašymas su nuoroda į Azure AI Foundry + Prompty, atitinkantis repo tikrą pavadinimą ir technologijas

#### Pašalinta
- **ai-document-processing**: Pašalinta neveikianti šablono nuoroda (repo neprieinamas viešai kaip AZD šablonas)

#### Patobulinta
- **📝 agents.md pratimai**: 1 pratimas dabar rodo laukiamus rezultatus ir `azd monitor` žingsnį; 2 pratimas turi pilną `FunctionTool` registracijos kodą; 3 pratimas pakeičia neaiškius nurodymus konkrečiomis `prepdocs.py` komandomis
- **📚 agents.md šaltiniai**: Atnaujintos nuorodos į dabartinę Azure AI Agent Service dokumentaciją ir greito starto vadovą
- **📋 agents.md Kito veiksmo lentelė**: Pridėta AI dirbtuvių laboratorijos nuoroda su visa skyriaus apimtimi

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
**Ši versija pagerina README.md skyrių navigaciją su patobulinta lentelės forma.**

#### Pakeista
- **Kurso žemėlapio lentelė**: Patobulinta su tiesioginėmis pamokų nuorodomis, trukmės įvertinimais ir sudėtingumo reitingais
- **Aplanko valymas**: Pašalinti nereikalingi seni aplankai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Nuorodų patikra**: Patikrintos visos 21+ vidinės nuorodos Kurso žemėlapio lentelėje

### [v3.16.0] - 2026-02-05

#### Produkto pavadinimų atnaujinimai
**Ši versija atnaujina produkto nuorodas pagal dabartinį Microsoft prekės ženklą.**

#### Pakeista
- **Microsoft Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas pagal dabartinį prekės ženklą

#### Atnaujinti failai
- `README.md` - Pagrindinis kurso pasiekiamasis puslapis
- `changelog.md` - Versijų istorija
- `course-outline.md` - Kurso struktūra
- `docs/chapter-02-ai-development/agents.md` - Dirbtinio intelekto agentų vadovas
- `examples/README.md` - Pavyzdžių dokumentacija
- `workshop/README.md` - Dirbtuvių pagrindinis puslapis
- `workshop/docs/index.md` - Dirbtuvių indeksas
- `workshop/docs/instructions/*.md` - Visi dirbtuvių mokymo failai

---

### [v3.15.0] - 2026-02-05

#### Pagrindinis saugyklos pertvarkymas: aplankai pagal skyrių numerius
**Ši versija pertvarko dokumentaciją į atskirus skyrių aplankus dėl aiškesnės navigacijos.**

#### Aplankų pavadinimų keitimas
Seni aplankai pakeisti į skyrių su numeracija aplankus:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridėta nauja: `docs/chapter-05-multi-agent/`

#### Failų perkėlimai
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
| Visus parengiamuosius failus | pre-deployment/ | chapter-06-pre-deployment/ |
| Visus trikčių šalinimo failus | troubleshooting/ | chapter-07-troubleshooting/ |

#### Pridėta
- **📚 Skyriaus README failai**: Sukurti README.md kiekviename skyriuje su:
  - Mokymosi tikslais ir laiko trukme
  - Pamokų lentelė su aprašymais
  - Greito starto komandos
  - Navigacija į kitus skyrius

#### Pakeista
- **🔗 Atnaujintos visos vidinės nuorodos**: Atnaujinta daugiau kaip 78 kelių visoje dokumentacijoje
- **🗺️ Pagrindinis README.md**: Atnaujintas Kurso žemėlapis su nauja skyriaus struktūra
- **📝 examples/README.md**: Atnaujintos kryžminės nuorodos į skyrių aplankus

#### Pašalinta
- Sena aplankų struktūra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Saugyklos pertvarkymas: skyrių navigacija
**Ši versija pridėjo skyrių navigacijos README failus (vėliau pakeista versijoje v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Naujas DI agentų vadovas
**Ši versija pateikia išsamų vadovą kaip diegti DI agentus naudojant Azure Developer CLI.**

#### Pridėta
- **🤖 docs/microsoft-foundry/agents.md**: Išsamus vadovas apimantis:
  - Kas yra DI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trijų tipų greito starto agentų šablonai (Foundry Agents, Prompty, RAG)
  - Agentų architektūros modeliai (vienas agentas, RAG, daugiagentis)
  - Įrankių konfigūravimas ir pritaikymas
  - Stebėjimas ir matavimų sekimas
  - Sąnaudų svarstymai ir optimizavimas
  - Dažnos trikčių šalinimo situacijos
  - Trys praktiniai pratimai su sėkmės kriterijais

#### Turinys
- **Įvadas**: Agentų sąvokos pradedantiesiems
- **Greitas startas**: Agentų diegimas su `azd init --template get-started-with-ai-agents`
- **Architektūros modeliai**: Agentų modelių vizualizacijos
- **Konfigūracija**: Įrankių nustatymai ir aplinkos kintamieji
- **Stebėjimas**: Application Insights integracija
- **Pratimai**: Progresyvus praktinis mokymasis (20-45 min kiekvienas)

---

### [v3.12.0] - 2026-02-05

#### DevContainer aplinkos atnaujinimas
**Ši versija atnaujina kūrimo konteinerio konfigūraciją su moderniomis priemonėmis ir geresniais numatytosios reikšmės nustatymais AZD mokymosi patirčiai.**

#### Pakeista
- **🐳 Bazinis atvaizdas**: Atnaujinta iš `python:3.12-bullseye` į `python:3.12-bookworm` (naujausias Debian stable)
- **📛 Konteinerio pavadinimas**: Pervadintas iš „Python 3“ į „AZD for Beginners“ aiškumui

#### Pridėta
- **🔧 Naujos Dev konteinerio funkcijos**:
  - `azure-cli` su įjungtu Bicep palaikymu
  - `node:20` (AZD šablonų LTS versija)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerinių programėlių diegimui

- **🔌 Prievadų nukreipimas**: Iš anksto sukonfigūruoti dažnai naudojami kūrimo prievadai:
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
  - `DavidAnson.vscode-markdownlint` - Markdown lintinimas
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code nustatymai**: Pridėti numatyti nustatymai Python interpretatoriui, formatavimui išsaugojus ir tarpo pašalinimui

- **📦 Atnaujintas requirements-dev.txt**:
  - Pridėtas MkDocs sutrumpinimo priedas
  - Pridėtas pre-commit kodo kokybei
  - Pridėti Azure SDK paketai (azure-identity, azure-mgmt-resource)

#### Ištaisyta
- **Po kūrimo komandos patikra**: Dabar tikrina AZD ir Azure CLI įdiegimą konteinerio paleidimo metu

---

### [v3.11.0] - 2026-02-05

#### README pritaikymas pradedantiesiems
**Ši versija ženkliai pagerina README.md suprantamumą pradedantiesiems ir prideda svarbius DI kūrėjų išteklius.**

#### Pridėta
- **🆚 Azure CLI ir AZD palyginimas**: Aiškus paaiškinimas, kada naudoti kurią priemonę su praktiniais pavyzdžiais
- **🌟 Nuostabios AZD nuorodos**: Tiesioginės nuorodos į bendruomenės šablonų galeriją ir indėlio išteklius:
  - [Awesome AZD galerija](https://azure.github.io/awesome-azd/) - daugiau nei 200 paruoštų diegimui šablonų
  - [Pateikti šabloną](https://github.com/Azure/awesome-azd/issues) - bendruomenės indėlis
- **🎯 Greito starto vadovas**: Supaprastintas 3 žingsnių pradžios skyrius (Įdiegti → Prisijungti → Diegti)
- **📊 Navigacijos lentelė pagal patirtį**: Aiškios gairės, kur pradėti pagal kūrėjo patirtį

#### Pakeista
- **README struktūra**: Perorganizuota nuoseklesniam informacijos atskleidimui - svarbiausia iškart
- **Įvado skyrius**: Perrašytas, paaiškinantis „`azd up` magiją“ visiškai pradedantiesiems
- **Pašalintas pasikartojantis turinys**: Ištrintas dubliuojantis trikčių šalinimo skyrius
- **Klaidų šalinimo komandos**: Pataisyta `azd logs` nuoroda, kad naudotų galiojančią `azd monitor --logs`

#### Pataisyta
- **🔐 Autentifikacijos komandos**: Pridėta `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Neteisingos komandų nuorodos**: Pašalintos likusios `azd logs` iš README skyriaus apie trikčių šalinimą

#### Pastabos
- **Mastelis**: Pakeitimai taikyti pagrindiniam README.md ir resources/cheat-sheet.md
- **Tikslinė auditorija**: Patobulinimai skirti ypač naujiems AZD kūrėjams

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI komandų tikslumo atnaujinimas
**Ši versija taiso neegzistuojančias AZD komandas visoje dokumentacijoje, užtikrindama, kad visi kodo pavyzdžiai naudoja galiojančią Azure Developer CLI sintaksę.**

#### Pataisyta
- **🔧 Pašalintos neegzistuojančios AZD komandos**: Visapusiškas neteisingų komandų patikrinimas ir taisymas:
  - `azd logs` (neegzistuoja) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` subkomandos (neegzistuoja) → pakeista į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (neegzistuoja) → pašalinta arba pakeista galiojančiomis alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` vėliavėlės (neegzistuoja) → pašalintos
  - `azd provision --what-if/--rollback` vėliavėlės (neegzistuoja) → atnaujinta naudojant `--preview`
  - `azd config validate` (neegzistuoja) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neegzistuoja) → pašalintos

- **📚 Failai atnaujinti su komandų pataisymais**:
  - `resources/cheat-sheet.md`: Didelis komandų nuorodų atnaujinimas
  - `docs/deployment/deployment-guide.md`: Pataisyti atšaukimo ir diegimo būdai
  - `docs/troubleshooting/debugging.md`: Pataisyti žurnalo analizės skyriai
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisytas AZD derinimo skyrius
  - `docs/getting-started/azd-basics.md`: Pataisytos stebėjimo komandos
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir derinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Pataisyti pagalbos ir versijos pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Pataisytos žurnalo peržiūros komandos
  - `docs/pre-deployment/coordination-patterns.md`: Pataisytos agento derinimo komandos

- **📝 Versijos nuoroda atnaujinta**: 
  - `docs/getting-started/installation.md`: Pakeista kietai įrašyta `1.5.0` versija į bendrinį `1.x.x` su nuoroda į išleidimus

#### Pakeista
- **Atšaukimo strategijos**: Atnaujinta dokumentacija, naudojant Git pagrindu vykdomą atšaukimą (AZD neturi natūralaus atšaukimo)
- **Žurnalo peržiūra**: Pakeistos `azd logs` nuorodos į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Veikimo skyrius**: Pašalintos neegzistuojančios paralelinio/inkrementinio diegimo vėliavėlės, pateiktos galiojančios alternatyvos

#### Techninės detalės
- **Galiojančios AZD komandos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galiojančios azd monitor vėliavėlės**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patikrinimas**: Komandos patikrintos naudojant Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Darbo grupės užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvius darbo grupės modulius, pataiso visas sugadintas dokumentacijos nuorodas ir pagerina bendrą turinio kokybę AI kūrėjams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujas indėlio gairių dokumentas su:
  - Aiškios nurodymai, kaip pranešti apie problemas ir teikti pasiūlymus
  - Dokumentacijos standartai naujam turiniui
  - Kodo pavyzdžių gairės ir užduočių pranešimų konvencijos
  - Bendruomenės įsitraukimo informacija

#### Užbaigta
- **🎯 Darbo grupės modulis 7 (apibendrinimas)**: Pilnai užbaigtas apibendrinimo modulis su:
  - Išsamus darbo grupės pasiekimų santrauka
  - Pagrindinių sąvokų įsisavinimo skyrius apimantis AZD, šablonus ir Microsoft Foundry
  - Rekomendacijos mokymosi kelionės tęstinumui
  - Darbo grupės iššūkių pratimai su sunkumo įvertinimais
  - Bendruomenės atsiliepimų ir palaikymo nuorodos

- **📚 Darbo grupės modulis 3 (dekonstruoti)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot su MCP serverių aktyvavimo gidu
  - AZD šablonų katalogo struktūros supratimu
  - Infrastruktūros kaip kodo (Bicep) organizavimo modeliais
  - Praktinio laboratorinio darbo instrukcijomis

- **🔧 Darbo grupės modulis 6 (ardymas)**: Užbaigtas su:
  - Ištekliai valymas ir išlaidų valdymo tikslais
  - `azd down` naudojimu saugiam infrastruktūros išardymui
  - Minkštai ištrintų pažintinių paslaugų atstatymo instrukcijos
  - Papildomi tyrinėjimo užduotys GitHub Copilot ir Azure portale

#### Pataisyta
- **🔗 Sugadintų nuorodų taisymai**: Išspręsta daugiau nei 15 vidinių dokumentacijos nuorodų klaidų:
  - `docs/ai-foundry/ai-model-deployment.md`: Pataisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyti ai-model-deployment.md ir production-ai-practices.md keliai
  - `docs/getting-started/first-project.md`: Pakeistas neegzistuojantis cicd-integration.md į deployment-guide.md
  - `examples/retail-scenario.md`: Pataisyti DUK ir trikčių šalinimo gido keliai
  - `examples/container-app/microservices/README.md`: Pataisyti kurso pradžios ir diegimo gido keliai
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujintos AI skyriaus nuorodos
  - `course-outline.md`: Pataisyti instruktorinių gidų ir AI darbo grupių laboratorijų nuorodos

- **📅 Darbo grupės būsenos juosta**: Atnaujinta nuo „Statomas“ į aktyvią darbo grupės būseną su 2026 metų vasario data

- **🔗 Darbo grupės navigacija**: Pataisyti sugadinti navigacijos nuorodos darbo grupės README.md, nuorodanti į neegzistuojantį lab-1-azd-basics katalogą

#### Pakeista
- **Darbo grupės pristatymas**: Pašalinta „statomas“ įspėjimo žyma, darbo grupė dabar pilnai užbaigta ir paruošta naudoti
- **Navigacijos nuoseklumas**: Užtikrinta, kad visi darbo grupės moduliai turi tinkamą tarpusavio navigaciją
- **Mokymosi kelio nuorodos**: Atnaujinti skyrimų kryžminiai nuorodos su teisingais microsoft-foundry keliais

#### Patvirtinta
- ✅ Visuose anglų kalbos Markdown failuose galiojančios vidinės nuorodos
- ✅ Darbo grupės moduliai 0-7 pilnai užbaigti su mokymosi tikslais
- ✅ Navigacija tarp skyrių ir modulių veikia tinkamai
- ✅ Turinys tinkamas AI kūrėjams, naudojantiems Microsoft AZD
- ✅ Visur išlaikytas pradedančiųjų draugiškas kalbinis stilius ir struktūra
- ✅ CONTRIBUTING.md pateikia aiškias gaires bendruomenės dalyviams

#### Techninė realizacija
- **Nuorodų patikra**: Automatizuota PowerShell skriptas patikrino visas .md vidines nuorodas
- **Turinio auditavimas**: Rankinis darbo grupės užbaigtumo ir pradedančiųjų tinkamumo vertinimas
- **Navigacijos sistema**: Taikyti nuoseklūs skyriaus ir modulio navigacijos šablonai

#### Pastabos
- **Mastelis**: Pakeitimai atlikti tik anglų dokumentacijoje
- **Vertimai**: Vertimų katalogai šioje versijoje nebuvo atnaujinti (automatizuotas vertimas bus sinchronizuotas vėliau)
- **Darbo grupės trukmė**: Dabar darbo grupė suteikia 3-4 valandas praktinio mokymosi

---

### [v3.8.0] - 2025-11-19

#### Pažengusi dokumentacija: stebėsena, saugumas ir daugi agentų modeliai
**Ši versija prideda išsamias A lygio pamokas apie Application Insights integraciją, autentifikacijos modelius ir daugiagentų koordinavimą gamybai skirtose diegimo aplinkose.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: faile `docs/pre-deployment/application-insights.md`:
  - Diegimas, orientuotas į AZD, su automatiniu paruošimu
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pasirinktinėmis telemetrijomis (daugiau nei 1 200 eilučių)
  - AI/LLM stebėjimo modeliai (Microsoft Foundry Models žetonų/kainų sekimas)
  - 6 Mermaid diagramos (architektūra, paskirstytasis sekimas, telemetrijos srautas)
  - 3 praktinės užduotys (įspėjimai, valdymo skydeliai, AI stebėsena)
  - Kusto užklausų pavyzdžiai ir kaštų optimizavimo strategijos
  - Tiesioginės metrikos srautas ir realaus laiko derinimas
  - 40-50 minučių mokymosi laiko su gamybai paruoštais modeliais

- **🔐 Autentifikacijos ir saugumo modelių pamoka**: faile `docs/getting-started/authsecurity.md`:
  - 3 autentifikacijos modeliai (jungčių eilutės, Key Vault, valdomoji tapatybė)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilnos užduotys (valdomos tapatybės įjungimas, vartotojo priskirta tapatybė, Key Vault sukimasis)
  - Saugumo gerosios praktikos ir RBAC konfiguracijos
  - Trikčių šalinimo gidas ir sąnaudų analizė
  - Produkcijai paruošti bekodės autentifikacijos modeliai

- **🤖 Daugi agentų koordinacijos modelių pamoka**: faile `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinavimo modeliai (seka, lygiagrečiai, hierarchinis, įvykių pagrindu, konsensusas)
  - Pilnas koordinatoriaus paslaugos įgyvendinimas (Python/Flask, daugiau kaip 1 500 eilučių)
  - 3 specializuoti agentų įgyvendinimai (moksliniams tyrimams, rašytojui, redaktoriui)
  - Service Bus integracija pranešimų eilėms
  - Cosmos DB būsenos valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramos rodantis agentų sąveikas
  - 3 pažangios užduotys (laiko limitų valdymas, pakartojimo logika, grandinės pertraukiklis)
  - Kaštų suskaidymas (240-565 $/mėn.) su optimizavimo strategijomis
  - Application Insights integracija stebėsenai

#### Patobulinta
- **Išankstinio diegimo skyrius**: Dabar apima išsamią stebėsenos ir koordinacijos modelių apžvalgą
- **Pradžia skyrius**: Patobulintas profesionaliais autentifikacijos modeliais
- **Gamybos pasirengimas**: Pilnas saugumo ir stebėsenos aprėptis
- **Kurso struktūra**: Atnaujinta su naujomis pamokomis 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi progresas**: Geresnė saugumo ir stebėsenos integracija viso kurso metu
- **Dokumentacijos kokybė**: Nuoseklūs A lygio standartai (95-97 %) naujose pamokose
- **Produkcijos modeliai**: Pilnas end-to-end aprėptis įmonių diegimuose

#### Pagerinta
- **Kūrėjo patirtis**: Aiškus kelias nuo kūrimo iki gamybos stebėsenos
- **Saugumo standartai**: Profesionalūs modeliai autentifikacijai ir slaptųjų duomenų valdymui
- **Stebėsena**: Pilna Application Insights integracija su AZD
- **AI apkrovos**: Specializuota stebėsena Microsoft Foundry Models ir daugi agentų sistemoms

#### Patvirtinta
- ✅ Visos pamokos turi pilną veikiantį kodą (ne fragmentus)
- ✅ Mermaid diagramos vizualiam mokymuisi (iš viso 19 trijose pamokose)
- ✅ Praktinės užduotys su patikrinimo žingsniais (iš viso 9)
- ✅ Produkcijai paruošti Bicep šablonai, diegiami per `azd up`
- ✅ Kaštų analizė ir optimizavimo strategijos
- ✅ Trikčių šalinimo gidai ir geriausios praktikos
- ✅ Žinių patikros taškai su patvirtinimo komandomis

#### Dokumentacijos įvertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsamus stebėsenos gidas
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo modeliai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios daugi agentų architektūros
- **Bendra naujo turinio kokybė**: - Nuoseklūs aukšti kokybės standartai

#### Techninė realizacija
- **Application Insights**: Log Analytics + individuali telemetrija + paskirstytasis sekimas
- **Autentifikacija**: Valdomoji tapatybė + Key Vault + RBAC modeliai
- **Daugi agentai**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Stebėsena**: Tiesioginės metrikos + Kusto užklausos + įspėjimai + valdymo skydeliai
- **Išlaidų valdymas**: Mėginimo strategijos, saugojimo politikos, biudžeto kontrolė

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės gerinimas ir naujas Microsoft Foundry Models pavyzdys
**Ši versija pagerina dokumentacijos kokybę visame saugykloje ir prideda pilną Microsoft Foundry Models diegimo pavyzdį su gpt-4.1 pokalbių sąsaja.**

#### Pridėta
- **🤖 Microsoft Foundry Models pokalbių pavyzdys**: Pilnas gpt-4.1 diegimas su veikiančia implementacija faile `examples/azure-openai-chat/`:
  - Pilna Microsoft Foundry Models infrastruktūra (gpt-4.1 modelio diegimas)
  - Python komandinės eilutės pokalbių sąsaja su pokalbių istorija
  - Key Vault integracija saugiam API raktų saugojimui
  - Žetonų naudojimo sekimas ir kaštų įvertinimas
  - Greičio ribojimas ir klaidų tvarkymas
  - Išsamus README su 35-45 minučių diegimo gidu
  - 11 gamybai paruoštų failų (Bicep šablonai, Python programa, konfiguracija)
- **📚 Dokumentacijos pratimai**: Pridėtos praktinės užduotys konfigūracijos gairėse:
  - Užduotis 1: Daugiaprostorinė konfigūracija (15 minučių)
  - Užduotis 2: Slaptųjų duomenų valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikrinimo žingsniai
- **✅ Diegimo patvirtinimas**: Pridėtas patvirtinimo skyrius diegimo gide:
  - Sveikatos patikros procedūros
  - Sėkmės kriterijų sąrašas
  - Laukiami visų diegimo komandų išėjimai
  - Greita trikčių šalinimo nuoroda

#### Patobulinta
- **examples/README.md**: Atnaujinta į A lygio kokybę (93 %):
  - Pridėtas azure-openai-chat į visas atitinkamas dalis
  - Vietinio pavyzdžių skaičius padidintas nuo 3 iki 4
  - Pridėta prie AI programėlių pavyzdžių lentelės
  - Integruota į Greito paleidimo darbą vidutinio lygio naudotojams
  - Pridėta prie Microsoft Foundry šablonų skyriaus
  - Atnaujintos palyginimo matricos ir technologijų paieškos dalys
- **Dokumentacijos kokybė**: Pagerinta nuo B+ (87 %) iki A- (92 %) visame docs kataloge:
  - Pridėti tikėtini rezultatai prie svarbių komandų pavyzdžių
  - Įtraukti konfigūracijos pakeitimų patikrinimo žingsniai
  - Pagerintas praktinis mokymasis su praktiniais pratimais

#### Pakeista
- **Mokymosi progresavimas**: Geresnė AI pavyzdžių integracija vidutinio lygio besimokantiesiems
- **Dokumentacijos struktūra**: Daugiau veiksmingų pratimų su aiškiais rezultatais
- **Patikros procesas**: Pridėti aiškūs sėkmės kriterijai pagrindiniams darbo eigoms

#### Pagerinta
- **Vystytojo patirtis**: Microsoft Foundry modelių diegimas dabar trunka 35-45 minutes (anksčiau 60-90 komplikuotoms alternatyvoms)
- **Skaidrumas dėl išlaidų**: Aiškios išlaidų sąmatos ($50-200/mėn.) Microsoft Foundry modelių pavyzdyje
- **Mokomasis kelias**: AI vystytojams aiškus įėjimo taškas su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs tikėtini rezultatai ir patikrinimo žingsniai

#### Patvirtinta
- ✅ Microsoft Foundry modelių pavyzdys pilnai veikia su `azd up`
- ✅ Visi 11 įgyvendinimo failų sintaksiškai teisingi
- ✅ README instrukcijos atitinka faktinę diegimo eigą
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra dubliuotų išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninė įgyvendinimas
- **Microsoft Foundry modelių architektūra**: gpt-4.1 + Key Vault + Container Apps šablonas
- **Sauga**: Pasiruošta Managed Identity, slaptieji raktai saugomi Key Vault
- **Stebėsena**: Integracija su Application Insights
- **Išlaidų valdymas**: Tokenų sekimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda pilnam sąrankai

### [v3.6.0] - 2025-11-19

#### Pagrindinis atnaujinimas: Container App diegimo pavyzdžiai
**Ši versija pristato išsamias, produkcijai paruoštas konteinerių taikomųjų programų diegimo pavyzdžius naudojant Azure Developer CLI (AZD), su visa dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Container App pavyzdžiai**: Nauji vietiniai pavyzdžiai `examples/container-app/`:
  - [Pagrindinis vadovas](examples/container-app/README.md): Išsamus konteinerizuotų diegimų apžvalga, greitas pradėjimas, gamybos ir pažangūs šablonai
  - [Paprastas Flask API](../../examples/container-app/simple-flask-api): Pradedančiųjų REST API su scale-to-zero, sveikatos patikromis, stebėsena ir trikčių šalinimu
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices): Gamybai paruoštas daugiapaslaugis diegimas (API Gateway, Produktas, Užsakymas, Vartotojas, Pranešimai), asinchroninis žinučių siuntimas, Service Bus, Cosmos DB, Azure SQL, paskirstytas sekimas, blue-green/canary diegimas
- **Geriausios praktikos**: Sauga, stebėsena, išlaidų optimizavimas ir CI/CD gairės konteinerizuotoms apkrovoms
- **Kodo pavyzdžiai**: Pilni `azure.yaml`, Bicep šablonai ir daugialypių kalbų paslaugų įgyvendinimai (Python, Node.js, C#, Go)
- **Testavimas ir trikčių šalinimas**: Pilnos testavimo scenarijos, stebėjimo komandos, trikčių šalinimo gairės

#### Pakeista
- **README.md**: Atnaujintas, kad apimtų ir susietų naujus konteinerių programų pavyzdžius "Vietiniai pavyzdžiai – konteinerių taikomosios programos"
- **examples/README.md**: Atnaujintas, kad pabrėžtų konteinerių programų pavyzdžius, pridėtų palyginimo matrico skirtus įrašus ir atnaujintų technologijų/architektūros nuorodas
- **Kurso struktūra ir studijų vadovas**: Atnaujinti, kad būtų nurodyti nauji konteinerių programų pavyzdžiai ir diegimo šablonai atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai diegiami su `azd up` ir atitinka gerąsias praktikas
- ✅ Dokumentacijos kryžminės nuorodos ir navigacija atnaujinti
- ✅ Pavyzdžiai apima nuo pradedančiųjų iki pažengusių atvejų, įskaitant gamybos mikropaslaugas

#### Pastabos
- **Apimtis**: Dokumentacija ir pavyzdžiai tik anglų kalba
- **Tolimesni veiksmai**: Plėsti su papildomais pažangiais konteinerių šablonais ir CI/CD automatizavimu būsimuose leidimuose

### [v3.5.0] - 2025-11-19

#### Produkto pervadinimas: Microsoft Foundry
**Ši versija įgyvendina visapusišką produkto pavadinimo pakeitimą iš „Microsoft Foundry“ į „Microsoft Foundry“ visuose anglų dokumentuose, atspindint Microsoft oficialų pervadinimą.**

#### Pakeista
- **🔄 Produkto pavadinimo atnaujinimas**: Visiškas pervadinimas iš „Microsoft Foundry“ į „Microsoft Foundry“
  - Atnaujintos visos nuorodos anglų dokumentacijoje `docs/` kataloge
  - Pervadintas katalogas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervadintas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso: 23 turinio nuorodos atnaujintos 7 dokumentų failuose

- **📁 Katalogų struktūros pakeitimai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nuorodos atnaujintos pagal naują katalogų struktūrą
  - Navigacijos nuorodos patikrintos visuose dokumentuose

- **📄 Failų pervadinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Visos vidinės nuorodos atnaujintos su nauju failo pavadinimu

#### Atnaujinti failai
- **Skyrių dokumentacija** (7 failai):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigacijos nuorodų atnaujinimai
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produkto pavadinimo nuorodos atnaujintos
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 nuorodos atnaujintos (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 kryžminės nuorodos atnaujintos
  - `docs/getting-started/first-project.md` - 2 skyrių navigacijos nuorodos atnaujintos
  - `docs/getting-started/installation.md` - 2 ateinančių skyrių nuorodos atnaujintos
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 nuorodos atnaujintos (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijos nuoroda atnaujinta
  - `docs/troubleshooting/debugging.md` - 1 navigacijos nuoroda atnaujinta

- **Kurso struktūros failai** (2 failai):
  - `README.md` - 17 nuorodų atnaujinimai (kurso apžvalga, skyrių pavadinimai, šablonų skyrius, bendruomenės įžvalgos)
  - `course-outline.md` - 14 nuorodų atnaujinimai (apžvalga, mokymosi tikslai, skyrių ištekliai)

#### Patvirtinta
- ✅ Nėra likusių "ai-foundry" katalogo kelio nuorodų anglų dokumentacijoje
- ✅ Nėra likusių "Microsoft Foundry" produkto pavadinimo nuorodų anglų dokumentacijoje
- ✅ Visos navigacijos nuorodos veikia su nauja katalogų struktūra
- ✅ Failų ir katalogų pervadinimai sėkmingai atlikti
- ✅ Kryžminės nuorodos tarp skyrių patvirtintos

#### Pastabos
- **Apimtis**: Pakeitimai taikomi tik anglų dokumentacijai `docs/` kataloge
- **Vertimai**: Vertimo katalogai (`translations/`) šioje versijoje neatnaujinti
- **Dirbtuvės**: Dirbtuvių medžiaga (`workshop/`) šioje versijoje neatnaujinta
- **Pavyzdžiai**: Pavyzdžių failai gali dar naudoti seną vardyną (bus sprendžiama būsimuose atnaujinimuose)
- **Išorinės nuorodos**: Išoriniai URL ir GitHub repozitorijų nuorodos lieka nepakitusios

#### Migracijos gidas prisidedantiems
Jei turite vietinių šakų arba dokumentaciją, kuri remiasi sena struktūra:
1. Atnaujinkite katalogų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir patikros patobulinimai
**Ši versija pristato išsamų palaikymą naujai Azure Developer CLI peržiūros funkcijai ir pagerina dirbtuvių naudotojo patirtį.**

#### Pridėta
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsami naujos infrastruktūros peržiūros galimybės apžvalga
  - Komandų nuoroda ir naudojimo pavyzdžiai sukčių lape
  - Detali integracija prie tiekimo vadovo su naudojimo atvejais ir privalumais
  - Saugumo patikra prieš diegimą
  - Pradžios vadovo atnaujinimai su saugaus diegimo praktikomis
- **🚧 Dirbtuvių būsenos juosta**: Profesionalus HTML skelbimas apie dirbtuvių vystymo būseną
  - Gradientinis dizainas su statybos indikatoriais aiškiam naudotojų informavimui
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas dizainas visiems įrenginiams

#### Pagerinta
- **Infrastruktūros saugumas**: Peržiūros funkcija integruota visoje diegimo dokumentacijoje
- **Prieš diegimą tikrinimas**: Automatizuoti scenarijai dabar įtraukia infrastruktūros peržiūros testavimą
- **Vystytojų darbo eiga**: Komandų seka atnaujinta su peržiūra kaip geriausia praktika
- **Dirbtuvių patirtis**: Aiškių lūkesčių nustatymas vartotojams apie turinio vystymo būseną

#### Pakeista
- **Diegimo geriausios praktikos**: Rekomenduojama pirmiausia naudoti peržiūros darbo eigą
- **Dokumentacijos srautas**: Infrastruktūros patikra perkelta į ankstesnį mokymosi proceso etapą
- **Dirbtuvių pristatymas**: Profesionalus būsenos pranešimas su aiškiu vystymo grafiku

#### Pagerinta
- **Saugaus prioriteto metodas**: Infrastruktūros pakeitimai dabar gali būti patikrinti prieš diegiant
- **Komandinis bendradarbiavimas**: Peržiūros rezultatus galima dalintis patikrai ir patvirtinimui
- **Išlaidų supratimas**: Geresnis išteklių kaštų suvokimas prieš tiekimą
- **Rizikos mažinimas**: Sumažintos diegimo klaidos dėl išankstinės patikros

#### Techninė įgyvendinimas
- **Daugiadokumentinė integracija**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visuose dokumentuose
- **Geriausių praktikų integracija**: Peržiūra įtraukta į patikros darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJI funkcijų ženklai dėl atrandamumo

#### Dirbtuvių infrastruktūra
- **Būsenos komunikacija**: Profesionalus HTML skelbimas su gradientine stilistika
- **Naudotojo patirtis**: Aiški vystymo būsena apsaugo nuo painiavos
- **Profesionalus pristatymas**: Išlaiko saugyklos patikimumą ir nustato lūkesčius
- **Laiko grafiko skaidrumas**: 2025 m. spalio mėn. paskutinio atnaujinimo atžyma dėl atsakomybių

### [v3.3.0] - 2025-09-24

#### Pagerinta dirbtuvių medžiaga ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamią dirbtuvių medžiagą su naršyklėje pagrįstais interaktyviais vadovais ir struktūruotais mokymosi keliais.**

#### Pridėta
- **🎥 Interaktyvus dirbtuvių vadovas**: Naršyklėje teikiama dirbtuvių patirtis su MkDocs peržiūros galimybe
- **📝 Struktūruotos dirbtuvių instrukcijos**: 7 žingsnių vedamas mokymosi kelias nuo atradimo iki pritaikymo
  - 0-Pradžia: Dirbtuvių apžvalga ir sąranka
  - 1-AI šablono pasirinkimas: Šablono atradimas ir pasirinkimas
  - 2-AI šablono patikra: Diegimo ir patikros procedūros
  - 3-AI šablono analizė: Šablono architektūros supratimas
  - 4-AI šablono konfigūracija: Konfigūracija ir pritaikymas
  - 5-AI šablono pritaikymas: Pažangūs pakeitimai ir iteracijos
  - 6-Infrastruktūros išmontavimas: Švarinimas ir išteklių valdymas
  - 7-Baigiamasis etapas: Santrauka ir tolimesni žingsniai
- **🛠️ Dirbtuvių įrankiai**: MkDocs konfigūracija su Material tema geresnei mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodika (atradimas → diegimas → pritaikymas)
- **📱 GitHub Codespaces integracija**: Sklandus kūrimo aplinkos paruošimas

#### Pagerinta
- **AI dirbtuvių laboratorija**: Pratęsta su išsamu 2-3 valandų struktūruotu mokymosi procesu
- **Dirbtuvių dokumentacija**: Profesionalus pateikimas su navigacija ir vizualine pagalba
- **Mokymosi progresas**: Aiškus žingsnis po žingsnio vadovas nuo šablono pasirinkimo iki gamybinio diegimo
- **Vystymo patirtis**: Integruoti įrankiai sklandžiai kūrimo darbo eigai

#### Pagerinta
- **Prieinamumas**: Naršyklėje veikianti sąsaja su paieška, kopijavimo funkcija ir temos keitimu
- **Savarankiškas mokymasis**: Lanksti dirbtuvių struktūra skirtingam mokymosi tempui
- **Praktinis taikymas**: Realaus pasaulio AI šablonų diegimo situacijos
- **Bendruomenės integracija**: Discord integracija dirbtuvių palaikymui ir bendradarbiavimui

#### Dirbtuvių funkcijos
- **Įmontuota paieška**: Greita raktinių žodžių ir pamokų paieška
- **Kopijuoti kodo blokus**: Užvedus pelę galima nukopijuoti visus kodo pavyzdžius
- **Temos keitimas**: Tamsus/šviesus režimas pagal pageidavimus
- **Vaizdinė medžiaga**: Ekrano nuotraukos ir diagramos geresniam supratimui
- **Pagalbos integracija**: Tiesioginis Discord prieigos palaikymas

### [v3.2.0] - 2025-09-17

#### Pagrindinis navigacijos pertvarkymas ir skyrių pagrindu sukurta mokymosi sistema
**Ši versija pristato visapusišką mokymosi struktūrą pagal skyrius su patobulinta navigacija visoje saugykloje.**

#### Pridėta
- **📚 Mokymosi sistema pagal skyrius**: Visas kursas pertvarkytas į 8 iš eilės einančius mokymosi skyrius
  - Skyrius 1: Pagrindai ir greitas pradėjimas (⭐ - 30-45 min.)
  - Skyrius 2: AI pirmas vystymas (⭐⭐ - 1-2 val.)
  - Skyrius 3: Konfigūravimas ir autentifikacija (⭐⭐ - 45-60 min.)
  - Skyrius 4: Infrastruktūra kaip kodas ir diegimas (⭐⭐⭐ - 1-1.5 val.)
  - Skyrius 5: Daugiaveikliai AI sprendimai (⭐⭐⭐⭐ - 2-3 val.)
  - Skyrius 6: Prieš diegimą patikra ir planavimas (⭐⭐ - 1 val.)
  - Skyrius 7: Trikčių šalinimas ir taisymas (⭐⭐ - 1-1.5 val.)
  - Skyrius 8: Gamybiniai ir įmonių šablonai (⭐⭐⭐⭐ - 2-3 val.)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir poraštės visuose dokumentuose
- **🎯 Progreso sekimas**: Kurso baigimo patikros sąrašas ir mokymosi patvirtinimo sistema
- **🗺️ Mokymosi kelio vadovas**: Aiškūs įėjimo taškai pagal patirties lygius ir tikslus
- **🔗 Kryžminė navigacija**: Susiję skyriai ir pradinės sąlygos aiškiai susieti

#### Pagerinta
- **README struktūra**: Paversta į struktūruotą mokymosi platformą su skyrių organizavimu
- **Dokumentacijos navigacija**: Kiekviename puslapyje dabar pateikiama skyriaus kontekstas ir progresavimo gairės
- **Šablonų organizavimas**: Pavyzdžiai ir šablonai priskirti atitinkamiems mokymosi skyriams
- **Išteklių integracija**: Sukčių lapai, DUK ir studijų vadovai susieti su atitinkamais skyriais
- **Dirbtuvių integracija**: Praktinės laboratorijos priskirtos keliems mokymosi skyriaus tikslams

#### Pakeista
- **Mokymosi eiga**: Perėjimas nuo linijinės dokumentacijos prie lankstaus mokymosi pagal skyrius
- **Konfigūracijos vieta**: Konfigūracijos vadovas perkeliamas į 3 skyrių geresniam mokymosi srautui
- **Dirbtinio intelekto turinio integracija**: Geresnė DI specifinio turinio integracija viso mokymosi metu
- **Produkcijos turinys**: Pažangiosios modelių konsolidacijos 8 skyriuje įmonių mokymuisi

#### Patobulinta
- **Vartotojo patirtis**: Aiškūs naršymo breadcrumb’ai ir skyrių progresijos indikatoriai
- **Prieinamumas**: Nuoseklūs naršymo modeliai lengvesniam kurso perėjimui
- **Profesionali prezentacija**: Universitetinio stiliaus kurso struktūra, tinkama akademiniam ir korporatyviniam mokymuisi
- **Mokymosi efektyvumas**: Sutrumpintas laikas rasti atitinkamą turinį dėl patobulintos organizacijos

#### Techninis įgyvendinimas
- **Naršymo antraštės**: Standartizuota skyrių navigacija daugiau nei 40 dokumentacijos failų
- **Poraštės navigacija**: Nuosekli progresijos gairių ir skyrių užbaigimo indikatorių sistema
- **Kryžminės nuorodos**: Išsamus vidinių nuorodų tinklas, jungiantis susijusias sąvokas
- **Skyrių žemėlapis**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Studijų vadovo patobulinimai
- **📚 Išsamūs mokymosi tikslai**: Pertvarkytas studijų vadovas, suderintas su 8 skyrių sistema
- **🎯 Įvertinimas pagal skyrius**: Kiekviename skyriuje nurodyti konkretūs mokymosi tikslai ir praktinės užduotys
- **📋 Progreso sekimas**: Savaitinė mokymosi tvarkaraštis su išmatuojamais rezultatais ir užduočių kontroliniais sąrašais
- **❓ Vertinimo klausimai**: Kiekvieno skyriaus žinių patikrinimo klausimai su profesionaliais rezultatais
- **🛠️ Praktinės užduotys**: Praktinės veiklos su realiais diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių progresas**: Aiškus pažangumas nuo pagrindinių koncepcijų iki įmonių modelių su karjeros vystymo akcentu
- **🎓 Sertifikavimo sistema**: Profesionalios plėtros rezultatai ir bendruomenės pripažinimo sistema
- **⏱️ Laiko valdymas**: Struktūruotas 10 savaičių mokymosi planas su etapų patvirtinimu

### [v3.1.0] - 2025-09-17

#### Patobulintos kelių agentų DI sprendimai
**Ši versija tobulina kelių agentų mažmeninės prekybos sprendimą su geresniu agentų pavadinimų nustatymu ir patobulinta dokumentacija.**

#### Pakeista
- **Kelių agentų terminologija**: Visame mažmeninės prekybos kelių agentų sprendime „Cora agentas“ pakeistas į „Kliento agentas“ aiškesniam supratimui
- **Agentų architektūra**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai su nuosekliu „Kliento agentas“ pavadinimu
- **Konfigūracijos pavyzdžiai**: Atnaujinti agentų konfigūracijos modeliai su naujomis pavadinimų konvencijomis
- **Dokumentų nuoseklumas**: Užtikrinta, kad visi paminėjimai naudotų profesionalius, aprašomuosius agentų pavadinimus

#### Pagerinta
- **ARM šablonų paketas**: Atnaujintas retail-multiagent-arm-template su Kliento agento nuorodomis
- **Architektūros diagramos**: Atgaivintos Mermaid diagramos su atnaujintais agentų pavadinimais
- **Kodo pavyzdžiai**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent pavadinimą
- **Aplinkos kintamieji**: Visos diegimo scenarijai atnaujinti, naudojant CUSTOMER_AGENT_NAME konvencijas

#### Patobulinta
- **Kūrėjo patirtis**: Aiškesnės agentų rolės ir atsakomybės dokumentacijoje
- **Paruošimas gamybai**: Geresnis atitikimas įmonių pavadinimų konvencijoms
- **Mokymo medžiaga**: Intuityvesni agentų pavadinimai mokymo tikslais
- **Šablonų naudojamumas**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeisti CoraAgent klasės pavadinimai į CustomerAgent Python pavyzdžiuose
- Modifikuotos ARM šablonų JSON konfigūracijos, naudojant „customer“ agento tipą
- Atnaujinti aplinkos kintamieji iš CORA_AGENT_* į CUSTOMER_AGENT_* modelius
- Atgaivinti visi diegimo komandų ir konteinerių konfigūracijos

### [v3.0.0] - 2025-09-12

#### Dideli pokyčiai – DI kūrėjo dėmesys ir Microsoft Foundry integracija
**Ši versija keičia saugyklą į išsamų DI fokusavimo mokymosi išteklių su Microsoft Foundry integracija.**

#### Pridėta
- **🤖 DI pirmenybės mokymosi kelias**: Viso pertvarkymo prioritetas DI kūrėjams ir inžinieriams
- **Microsoft Foundry integracijos vadovas**: Išsami dokumentacija, kaip sujungti AZD su Microsoft Foundry paslaugomis
- **DI modelio diegimo modeliai**: Išsamus vadovas, apimantis modelio pasirinkimą, konfiguraciją ir gamybinio diegimo strategijas
- **DI dirbtuvės laboratorija**: 2–3 valandų praktinės dirbtuvės, skirtos DI programų konvertavimui į AZD diegiamas sprendimus
- **Gamybos DI geriausios praktikos**: Įmonių paruošti modeliai DI mastelio, stebėjimo ir saugumo užtikrinimui
- **DI klaidų šalinimo vadovas**: Išsamus trikčių šalinimas Microsoft Foundry modeliams, kognityvinėms paslaugoms ir DI diegimo problemoms
- **DI šablonų galerija**: Rinktinė Microsoft Foundry šablonų kolekcija su sudėtingumo įvertinimais
- **Dirbtuvių medžiagos**: Išsamios dirbtuvių struktūros su praktinėmis laboratorijomis ir atskaitos medžiaga

#### Patobulinta
- **README struktūra**: DI kūrėjams orientuota su 45 % bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Mokymosi keliai**: Specializuotas DI kūrėjo kelias šalia tradicinių studentų ir DevOps inžinierių kelių
- **Šablonų rekomendacijos**: Parinkti DI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Bendruomenės integracija**: Pagerinta Discord bendruomenės palaikymas su DI specifinėmis kanalais ir diskusijomis

#### Saugumas ir gamybos dėmesys
- **Valdomos tapatybės modeliai**: DI specifiniai autentifikavimo ir saugumo nustatymai
- **Kainų optimizavimas**: Žetonų naudojimo stebėjimas ir biudžeto kontrolė DI apkrovoms
- **Daugiavietis diegimas**: Strategijos globaliam DI programų diegimui
- **Veiklos stebėjimas**: DI specifiniai metrikos ir Application Insights integracija

#### Dokumentacijos kokybė
- **Linijinė kurso struktūra**: Logiška eigos nuo pradedančiųjų iki pažangių DI diegimo modelių
- **Patikrinti URL**: Visos išorinės saugyklos nuorodos patikrintos ir pasiekiamos
- **Išsamus nuorodų patvirtinimas**: Visos vidinės dokumentacijos nuorodos patikrintos ir veikia
- **Gamybai paruošta**: Įmonių diegimo modeliai su realaus pasaulio pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Dideli pokyčiai – saugyklos pertvarkymas ir profesionalus patobulinimas
**Ši versija reiškia reikšmingą saugyklos struktūros ir turinio pateikimo pertvarkymą.**

#### Pridėta
- **Struktūruota mokymosi sistema**: Visose dokumentacijos puslapiuose pridėtos Įvadas, Mokymosi tikslai ir Mokymosi rezultatai skyriai
- **Naršymo sistema**: Pridėtos Ankstesnio/Kito pamokos nuorodos visoje dokumentacijoje, skirtos mokymosi eigai valdyt
- **Studijų vadovas**: Išsamus study-guide.md su mokymosi tikslais, praktiniais pratimais ir vertinimo medžiaga
- **Profesionali prezentacija**: Pašalinti visi emocijų piktogramos geresniam prieinamumui ir profesionaliam vaizdui
- **Patobulinta turinio struktūra**: Pagerintas mokymo medžiagų organizavimas ir srautas

#### Pakeista
- **Dokumentacijos formatas**: Standartizuota visa dokumentacija, naudojant nuoseklią, mokymuisi orientuotą struktūrą
- **Naršymo srautas**: Įgyvendinta logiška mokymosi medžiagų eiga
- **Turinio pateikimas**: Pašalinti dekoratyviniai elementai, vietoj jų aiškus, profesionalus formatavimas
- **Nuorodų struktūra**: Atnaujintos visos vidinės nuorodos, kad palaikytų naują naršymo sistemą

#### Patobulinta
- **Prieinamumas**: Pašalintos emocijų piktogramos geresniam suderinamumui su ekrano skaitytuvais
- **Profesionali išvaizda**: Švarus, akademinio stiliaus pateikimas, tinkamas korporatyviniam mokymuisi
- **Mokymosi patirtis**: Struktūruotas požiūris su aiškiais tikslais ir rezultatais kiekvienai pamokai
- **Turinio organizacija**: Geresnis logiškas srautas ir susijusių temų ryšys

### [v1.0.0] - 2025-09-09

#### Pradinis leidimas – Išsamus AZD mokymosi saugykla

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Išsamus įvadinis gidas
  - Komponentinė diegimo ir aprovizicijos dokumentacija
  - Išsamios trikčių šalinimo priemonės ir derinimo vadovai
  - Priemonės ir procedūros prieš diegimą

- **Pradžios modulis**
  - AZD pagrindai: Pagrindinės sąvokos ir terminologija
  - Diegimo vadovas: Platformos specifinės įdiegimo instrukcijos
  - Konfigūracijos vadovas: Aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto pamoka: Žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir aprovizicijos modulis**
  - Diegimo vadovas: Išsamus darbo eigos aprašymas
  - Aprovisionavimo vadovas: Infrastruktūra kaip kodas naudojant Bicep
  - Gamybos diegimo geriausios praktikos
  - Daugiapakopės architektūros modeliai

- **Prieš diegimą patikrinimo modulis**
  - Talpos planavimas: „Azure“ išteklių prieinamumo patikrinimas
  - SKU pasirinkimas: Išsamios paslaugų lygio gairės
  - Prieš skrydžio patikrinimai: Automatizuoti patikros scenarijai (PowerShell ir Bash)
  - Išlaidų vertinimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažnai pasitaikančios problemos ir sprendimai
  - Derinimo vadovas: Sistemingas trikčių šalinimas
  - Pažangios diagnostikos technikos ir įrankiai
  - Veiklos stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų cheat sheet: Greita būtinų komandų atmintinė
  - Žodynas: Išsamus terminų ir akronimų aiškinimas
  - DUK: Detalūs atsakymai į dažniausiai užduodamus klausimus
  - Išorinės išteklių nuorodos ir bendruomenės sujungimai

- **Pavyzdžiai ir šablonai**
  - Paprastos žiniatinklio programos pavyzdys
  - Statinio svetainės diegimo šablonas
  - Konteinerio programos konfigūracija
  - Duomenų bazės integracijos modeliai
  - Mikroservisų architektūros pavyzdžiai
  - Serverless funkcijų įgyvendinimai

#### Ypatybės
- **Daugiau platformų palaikymas**: Diegimo ir konfigūracijos vadovai Windows, macOS ir Linux sistemoms
- **Skirtingi įgūdžių lygiai**: Turinys skirtas nuo studentų iki profesionalių kūrėjų
- **Praktinis fokusas**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Išsamus aprėptis**: Nuo pagrindinių konceptų iki pažangių įmonių modelių
- **Saugumo prioritetas**: Geriausios saugumo praktikos integruotos per visą turinį
- **Kaštų optimizavimas**: Gairės ekonomiškam diegimui ir išteklių valdymui

#### Dokumentacijos kokybė
- **Išsamūs kodo pavyzdžiai**: Praktinės, išbandytos kodo dalys
- **Instrukcijos žingsnis po žingsnio**: Aiškios ir veiksmingos gairės
- **Išsamus klaidų tvarkymas**: Klaidos šalinimas dažniausiose problemose
- **Geriausios praktikos integracija**: Pramonės standartai ir rekomendacijos
- **Suderinamumas su versijomis**: Naujausia Azure paslaugų ir azd funkcijų palaikymas

## Planuojami būsimieji patobulinimai

### Versija 3.1.0 (planuojama)
#### DI platformos plėtra
- **Daugiamodelių palaikymas**: Integracijos modeliai Hugging Face, Azure Machine Learning ir pritaikytiems modeliams
- **DI agentų sistema**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Pažangūs RAG modeliai**: Vektorinės duomenų bazės išplėtimas už Azure AI Search (Pinecone, Weaviate ir kt.)
- **DI stebėsena**: Pagerintas modelio našumo, žetonų naudojimo ir atsako kokybės monitoringas

#### Kūrėjo patirtis
- **VS Code plėtinys**: Integruota AZD + Microsoft Foundry kūrėjo patirtis
- **GitHub Copilot integracija**: DI palaikoma AZD šablonų generacija
- **Interaktyvios pamokos**: Praktiniai programavimo pratimai su automatiniu DI scenarijų patvirtinimu
- **Vaizdo medžiaga**: Papildomos vaizdo pamokos vizualiems besimokantiesiems apie DI diegimus

### Versija 4.0.0 (planuojama)
#### Įmonių DI modeliai
- **Valdymo sistema**: DI modelių valdymas, atitiktis ir audito takai
- **Daugiavartotojų DI**: Modeliai kelių klientų aptarnavimui su izoliuotomis DI paslaugomis
- **Edge DI diegimas**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hibridinės debesijos DI**: Daugiadebesijos ir hibridinės DI apkrovų diegimo modeliai

#### Pažangios funkcijos
- **DI pipeline automatizavimas**: MLOps integracija su Azure Machine Learning pipeline’ais
- **Pažangus saugumas**: Nulinės pasitikėjimo modeliai, privatūs galiniai taškai ir pažangi grėsmių apsauga
- **Veiklos optimizavimas**: Pažangūs derinimo ir mastelio didinimo metodai aukšto pralaidumo DI programoms
- **Globalus paskirstymas**: Turinys ir vietinė talpinimo kešavimo modeliai DI programoms

### Versija 3.0.0 (planuojama) – Pakeista dabartiniu leidimu
#### Siūlomi papildymai – Dabar įgyvendinti v3.0.0
- ✅ **DI specifinis turinys**: Išsami Microsoft Foundry integracija (atlikta)
- ✅ **Interaktyvios pamokos**: Praktinė DI dirbtuvių laboratorija (atlikta)
- ✅ **Pažangus saugumo modulis**: DI specifiniai saugumo modeliai (atlikta)
- ✅ **Veiklos optimizavimas**: DI apkrovų reguliavimo strategijos (atlikta)

### Versija 2.1.0 (planuojama) – Iš dalies įgyvendinta v3.0.0
#### Nedideli patobulinimai – Kai kurios įgyvendintos dabartiniame leidime
- ✅ **Papildomi pavyzdžiai**: DI fokusuoti diegimo scenarijai (atlikta)
- ✅ **Išplėstas DUK**: DI specifiniai klausimai ir trikčių šalinimas (atlikta)
- **Įrankių integracija**: Patobulinti IDE ir redaktorių integracijos vadovai
- ✅ **Platesnė stebėsena**: DI specifiniai stebėjimo ir perspėjimų modeliai (atlikta)

#### Vis dar planuojama būsimam leidimui
- **Mobiliesiems pritaikyta dokumentacija**: Reaguojančio dizaino mokymuisi mobiliuosiuose įrenginiuose
- **Prieiga neprisijungus**: Atsisiunčiamos dokumentų paketai
- **Patobulinta IDE integracija**: VS Code plėtinys AZD + DI darbo eigoms
- **Bendruomenės valdymo skydelis**: Realaus laiko bendruomenės metrikos ir indėlių stebėsena

## Prisidėjimas prie pakeitimų žurnalo

### Pakeitimų pranešimas
Prisidėdami prie šios saugyklos, prašome užtikrinti, kad pakeitimų žurnale būtų nurodyta:

1. **Versijos numeris**: Laikantis semantinio versijų valdymo (major.minor.patch)
2. **Data**: Leidimo arba atnaujinimo data YYYY-MM-DD formatu
3. **Kategorija**: Pridėta, Pakeista, Nutraukta, Pašalinta, Ištaisyta, Saugumas
4. **Aiškus aprašymas**: Trumpas pakeitimo aprašymas
5. **Poveikio vertinimas**: Kaip pakeitimai veikia esamus vartotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, scenarijai ar įrankių komplektai

#### Pakeista
- Esamos funkcionalybės ar dokumentacijos modifikacijos
- Atnaujinimai, skirti aiškumo arba tikslumo gerinimui
- Turinys arba organizacijos pertvarkymas

#### Nutraukta
- Funkcijos ar metodai, kurie yra palaipsniui šalinami
- Dokumentacijos skyriai, skirti pašalinimui
- Metodai, turintys geresnių alternatyvų

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebeaktualūs
- Pasenusi informacija arba nutraukti metodai
- Dublikatai arba konsoliduotas turinys

#### Ištaisyta
- Klaidos dokumentacijoje ar kode pataisymai
- Praneštų problemų arba klaidų išsprendimas
- Tikslumas arba funkcionalumo patobulinimai

#### Saugumas
- Saugumo patobulinimai arba pataisymai
- Saugumo geriausių praktikų atnaujinimai
- Saugumo spragų ištaisymas

### Semantinio versijų valdymo gairės

#### Didžioji versija (X.0.0)
- Lūžių pokyčiai, reikalaujantys vartotojo veiksmų
- Reikšmingas turinio ar organizacijos pertvarkymas
- Pokyčiai, keičiantys pagrindinį požiūrį ar metodiką

#### Nedidelė versija (X.Y.0)
- Naujos funkcijos arba turinio papildymai
- Patobulinimai, išlaikantys suderinamumą su ankstesnėmis versijomis
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Remonto versija (X.Y.Z)
- Klaidų taisymai ir pataisymai
- Nedideli esamo turinio patobulinimai
- Paaiškinimai ir smulkūs patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Mes aktyviai skatiname bendruomenės atsiliepimus, siekdami patobulinti šį mokymosi išteklių:

### Kaip pateikti atsiliepimus
- **GitHub Issue’ai**: praneškite apie problemas arba siūlykite patobulinimus (AI specifinės problemos taip pat laukiamos)
- **Discord diskusijos**: dalinkitės idėjomis ir bendraukite su Microsoft Foundry bendruomene
- **Pull Request’ai**: tiesiogiai prisidėkite patobulinimais prie turinio, ypač AI šablonų ir gidų
- **Microsoft Foundry Discord**: dalyvaukite #Azure kanale diskusijoms apie AZD ir AI
- **Bendruomenės forumai**: dalyvaukite platesnėse Azure kūrėjų diskusijose

### Atsiliepimų kategorijos
- **AI turinio tikslumas**: pataisymai, susiję su AI paslaugų integracija ir diegimu
- **Mokymosi patirtis**: pasiūlymai geresniam AI kūrėjų mokymosi procesui
- **Trūksta AI turinio**: prašymai dėl papildomų AI šablonų, modelių ar pavyzdžių
- **Prieinamumas**: patobulinimai įvairių mokymosi poreikių užtikrinimui
- **AI įrankių integracija**: pasiūlymai dėl geresnės AI kūrimo darbų eigos integracijos
- **Produkciniai AI modeliai**: įmonių AI diegimo modelių prašymai

### Atsakymų įsipareigojimai
- **Problemos sprendimas**: per 48 valandas nuo problemos pranešimo
- **Funkcijų užklausos**: įvertinimas per vieną savaitę
- **Bendruomenės indėlis**: peržiūra per vieną savaitę
- **Saugumo problemos**: prioritetinis sprendimas ir greitas atsakymas

## Priežiūros grafikas

### Reguliarūs atnaujinimai
- **Mėnesinė apžvalga**: turinio tikslumo ir nuorodų tikrinimas
- **Ketvirtiniai atnaujinimai**: reikšmingi turinio papildymai ir patobulinimai
- **Pusmečio apžvalgos**: išsamus pertvarkymas ir patobulinimai
- **Metiniai leidimai**: pagrindinių versijų atnaujinimai su reikšmingais patobulinimais

### Stebėjimas ir kokybės užtikrinimas
- **Automatizuoti testavimai**: reguliari kodo pavyzdžių ir nuorodų validacija
- **Bendruomenės atsiliepimų integracija**: vartotojų pasiūlymų nuolatinis įtraukimasis
- **Technologijų atnaujinimai**: suderinamumas su naujausiomis Azure paslaugomis ir azd leidimais
- **Prieinamumo auditai**: reguliarus įtraukios dizaino principų tikrinimas

## Versijų palaikymo politika

### Dabartinis versijų palaikymas
- **Naujausia pagrindinė versija**: pilnas palaikymas su reguliariais atnaujinimais
- **Ankstesnė pagrindinė versija**: saugumo atnaujinimai ir kritiniai pataisymai 12 mėnesių
- **Senausioji versija**: tik bendruomenės palaikymas, oficialių atnaujinimų nėra

### Migracijos gairės
Išleidžiant pagrindines versijas, mes suteikiame:
- **Migracijos gidai**: žingsnis po žingsnio pereinamojo laikotarpio instrukcijos
- **Suderinamumo pastabos**: informacija apie lūžių pokyčius
- **Įrankių palaikymas**: scenarijai arba įrankiai, padedantys migracijoje
- **Bendruomenės palaikymas**: specialūs forumai migracijos klausimams

---

**Naršymas**
- **Ankstesnė pamoka**: [Studijų vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinį README](README.md)

**Likite informuoti**: Sekite šį saugyklą, kad gautumėte pranešimus apie naujus leidimus ir svarbius mokymosi medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
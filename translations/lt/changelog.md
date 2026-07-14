# Pakeitimų žurnalas - AZD Pradedantiesiems

## Įvadas

Šis pakeitimų žurnalas dokumentuoja visas pastebimas pakeitimus, atnaujinimus ir patobulinimus AZD Pradedantiesiems saugykloje. Mes laikomės semantinio versijavimo principų ir palaikome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėdami šį pakeitimų žurnalą, jūs:
- Būsite informuoti apie naujas funkcijas ir turinio papildymus
- Suprasite esamos dokumentacijos patobulinimus
- Seksite klaidų taisymus ir pataisas, užtikrinančias tikslumą
- Seksite mokymo medžiagos evoliuciją laikui bėgant

## Mokymosi rezultatai

Peržiūrėję pakeitimų įrašus galėsite:
- Nustatyti naują turinį ir išteklius, kurie yra pasiekiami mokymuisi
- Suprasti, kurios skiltys buvo atnaujintos arba patobulintos
- Planuoti savo mokymosi kelią pagal naujausią medžiagą
- Suteikti atsiliepimų ir pasiūlymų dėl būsimų patobulinimų

## Versijų istorija

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 atnaujinimas: versijos atnaujinimas
**Ši versija peržiūri kursą pagal `azd` `1.27.1` (2026 m. liepa, naujausias stabilus leidimas) ir dabartinį peržiūros AI agentų plėtinį `azure.ai.agents` `1.0.0-beta.5`, atnaujinant visas "patvirtinta pagal" etiketės po 1.26.0, 1.27.0 ir 1.27.1 leidimų.**

#### Pakeista
- **✅ Patvirtinimo pagrindas atnaujintas** nuo `azd 1.25.6` (2026 m. birželis) iki `azd 1.27.1` (2026 m. liepa) pagrindiniame README faile, visuose skyriaus README, 1-o skyriaus dev-container pamokoje (įskaitant pavyzdžius su fiksuotomis versijomis), 4-o skyriaus pasirinktinių šablonų pamokoje, 5-o skyriaus multi-agentų pamokoje ir dirbtuvių dokumentacijoje
- **🤖 2-o skyriaus pagrindas atnaujintas** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.27.1` faile `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ir `microsoft-foundry-integration.md`; patvirtinimo pastabų datos atnaujintos iki 2026-07-13
- **🧩 AI agentų plėtinys atnaujintas** nuo `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` iki dabartinio `1.0.0-beta.5` leidimo 2-o skyriaus README ir `agents.md` failuose
- **🧪 Dirbtuvių patvirtinimo pavyzdys** (`azd version` išvestis) atnaujintas iki `1.27.1`

#### Pastabos apie svarbius azd leidimus (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Golang palaikymas Azure Functions Flex Consumption, `azd config sub-filter` prenumeratos filtrai pagal nuomininką, savarankiški plėtinių paketai (`azd x pack --bundle`), ir `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry projektų/agentų modeliavimas tiesiai `azure.yaml` (be Bicep ir Terraform), konteinerių diegimo palaikymas App Service (`host: appservice` + `language: docker`), tiesioginis `-s/--source` `azd extension` komandoms, ir `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` parametrą `azd extension install`, numatytasis nebevartojamų modelių pašalinimas iš katalogo/quota užklausų, ir keletas klaidų pataisymų

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

#### Pradedančiųjų spragos užpildymas #2: šablonų kūrimas, dev konteineriai, Pulumi, Azure DevOps, paslaugų principalai ir daugiau
**Ši versija užpildo likusias tarpines spragas, atskleistą azd aprėpties analizės metu: kaip kurti ir publikuoti savo šabloną, pakartotinai atkartojamus dev context/Codespaces aplinkas, Pulumi infrastruktūros teikėją, Azure DevOps CI/CD apžvalgą, paslaugų principalų autentifikaciją, šeimininko pasirinkimo patarimus (AKS/Spring Apps), `azd restore`/`azd package` paaiškinimus, klaidų valdymą hook'uose ir komandinės / bendros aplinkos praktiką.**

#### Pridėta
- **🧱 Nauja 4-o skyriaus pamoka** `docs/chapter-04-infrastructure/custom-templates.md` — savo azd šablono kūrimas: privaloma struktūra (`azure.yaml`, `infra/`, `src/`), `metadata.template` laukas, infrastruktūros parametrizavimas su `uniqueString()` resursų žyme ir `azd-env-name` žyma, testavimas vietoje su `azd init --template <local-path>`, publikavimas GitHub ir pateikimas Awesome AZD galerijoje
- **📦 Nauja 1-o skyriaus pamoka** `docs/chapter-01-foundation/dev-containers.md` — pakartotinai atkartojamos azd aplinkos su Dev Containers ir GitHub Codespaces: minimalus `.devcontainer/devcontainer.json` su oficialia `ghcr.io/azure/azure-dev/azd` funkcija, kalbų specifinės funkcijos, `docker-in-docker` konteinerių šeimininkams ir `azd auth login --use-device-code` nuotoliniam prisijungimui
- **🧩 Pulumi su azd** sekcija `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi aplanko išdėstymas, stack'ai susieti su azd aplinkomis, privalomi išėjimai/žymos, ir tapatūs `azd up` / `azd down` darbo procesai
- **🎯 Šeimininko pasirinkimo gairės** `docs/chapter-04-infrastructure/provisioning.md` — pradedantiesiems pritaikytas lyginimas tarp `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ir `springapp`, su patarimais, kada rinktis AKS arba Azure Spring Apps
- **🛠️ Azure DevOps CI/CD apžvalga** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, paslaugų ryšys su darbo krūvio tapatybės federacija (OIDC), sugeneruotas `azure-dev.yml` ir kintamųjų grupių nustatymas
- **🔑 Paslaugų principalai (4 modelis)** pridėta į `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktyvus `azd auth login` su kliento slaptu raktu prieš federuotus/OIDC kredencialus, kada naudoti ir saugus kredencialų saugojimas
- **🪝 Hook klaidų valdymas** poskirsnis `docs/chapter-04-infrastructure/deployment-guide.md` — išėjimo kodai ir `set -e`, `continueOnError`, kabliukų testavimas izoliuotai su `azd hooks run`, OS specifiniai apvalkalai ir `--debug`
- **👥 Komandų / bendros aplinkos** sekcija `docs/chapter-03-configuration/configuration.md` — kas yra `.azure/`, ką ignoruoti git'e, per kūrėją aplinkos, `azd env list`/`select`, ir aplinkos reikšmių pateikimas CI/CD
- **🧰 `azd restore` ir išplėstas `azd package`** paaiškinimai `resources/cheat-sheet.md` — priklausomybių atkūrimas ir diegimui parengto artefakto kūrimas be diegimo

#### Pakeista
- **🧭 4-o skyriaus pamokų lentelė** atnaujinta, įtraukiant naują pamoką „Savo šablono kūrimas“ (Pamoka 3)
- **🧭 1-o skyriaus pamokų lentelė** atnaujinta, įtraukiant naują pamoką „Dev konteineriai ir Codespaces“ (Pamoka 5); navigacijos antraštės sujungtos tarp `bring-your-own-app.md` ir `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pradedančiųjų spragos užpildymas: praktinė multi-agentų pamoka, „Bring Your Own App“, Terraform ir CI/CD apžvalga
**Ši versija užpildo didžiausias spragas iki pilno pradedančiųjų vadovo, pridėdama dvi naujas praktines pamokas (diegtiną multi-agentų apžvalgą ir azd pridėjimą prie esamos programos), pradedančiųjų vadovą apie hook'us, Terraform su azd sekciją, žingsnis po žingsnio GitHub Actions pipeline apžvalgą, naujų peržiūros plėtinių paaiškinimą ir aiškų patvirtinimo sąrašą.**

#### Pridėta
- **🤝 Nauja 5-o skyriaus pamoka** `docs/chapter-05-multi-agent/multi-agent-basics.md` — visiškai praktiška, diegiama dviejų agentų apžvalga (orchestratorius + specialistai) naudojant tikrą šabloną (`contoso-creative-writer`), apimanti kada naudoti multi-agentus, `azd up` darbo eigą, išteklių supratimą, kryžminį agentų sekimą, suasmeninimą ir valymą
- **📦 Nauja 1-o skyriaus pamoka** `docs/chapter-01-foundation/bring-your-own-app.md` — kaip pridėti azd prie esamo projekto su `azd init` („naudoti kodą dabartiniame kataloge“), suprasti `azure.yaml` ir `infra/`, `azd infra generate`, šeimininko aptikimą ir diegimą su `azd up`
- **🌐 Terraform su azd** sekcija pridėta į `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigūracija, `.tf` katalogo išdėstymas, privalomi `AZURE_*` išėjimai ir `azd-env-name` žymėjimas, ir tapatūs `azd up` / `azd down` darbo procesai (užpildo spragą, kurioje buvo minimas Terraform palaikymas, bet demonstravimas buvo tik Bicep)
- **⚙️ Žingsnis po žingsnio GitHub Actions apžvalga** `docs/chapter-08-production/production-ai-practices.md` — nuo GitHub repozitorijos iki automatinių diegimų: `azd pipeline config`, OIDC federuoti kredencialai (be saugomų slaptažodžių), sugeneruotas `azure-dev.yml`, ir patarimai apie slaptažodžius ir kintamuosius
- **🪝 Pradedančiųjų „Nauja hooks?“ įvadas** `docs/chapter-04-infrastructure/deployment-guide.md` — kas yra hook'as, hook'ų etapų lentelė, minimalus pirmas hook'as ir hook'ų rankinis paleidimas su `azd hooks run`
- **✅ „Patvirtink savo diegimą“ sąrašas** pridėtas 5 žingsnyje `docs/chapter-01-foundation/first-project.md` — greitas testas, sveikatos patikrinimas ir aiškūs sėkmės kriterijai
- **🧩 Naujų peržiūros plėtinių paaiškinimas** `azure.ai.skills` ir `azure.ai.connections` (kas jie yra ir kada jų prireikia) `docs/chapter-08-production/production-ai-practices.md`

#### Pakeista
- **🧭 5-o skyriaus pamokų lentelė** taisyta: `multi-agent-basics.md` dabar yra 1 pamoka (vienintelė visiškai praktinė pamoka), su aiškiu ženklinimu, kad 2 pamoka yra 6 skyriuje, o mažmeninės prekybos scenarijus yra architektūros šablonas, o ne vienos komandos šablonas
- **🧭 1-o skyriaus pamokų lentelė** dabar apima naują pamoką „Bring Your Own App“ (4 pamoka)
- **🔗 Navigacijos antraštės** atnaujintos: `first-project.md` dabar jungiasi į `bring-your-own-app.md`

#### Pataisyta
- **🧱 Uždaryta "teigta, bet trūkstama" Terraform spraga** — kursas anksčiau nurodė, kad palaiko Terraform, bet tik rodė Bicep
- **🔀 Ištaisytos klaidinančios 5-o skyriaus kryžminės nuorodos** kurios nurodė, kad yra pilna multi-agentų implementacija, nors buvo tik architektūros šablonas

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

#### AZD 1.25.6 atnaujinimas, pilni agentų gyvavimo ciklo komandų rinkiniai ir Aspire prekės ženklo keitimas

**Ši versija tikrina kursą pagal `azd` `1.25.6` (2026 m. birželis) ir `azure.ai.agents` `0.1.40-preview` plėtinį, išplėčia DI nurodymus nuo „agentų karkasavimo“ iki pilno agentų gyvenimo ciklo (testavimas → vertinimas → optimizavimas → tikrinimas → naikinimas), pristato naujus `azure.ai.skills` ir `azure.ai.connections` peržiūros plėtinius, bei pažymi ".NET Aspire" → "Aspire" produkto prekinio ženklo pakeitimą.**

#### Pridėta
- **🔁 Pilnas agento gyvenimo ciklo aprėptis** pradedantiesiems ir DI inžinieriams visose dokumentacijose:
  - `docs/chapter-01-foundation/azd-basics.md` — Pridėta gyvenimo ciklo lentelė (karkasas → testavimas → matavimas → tobulinimas → tikrinimas → išvalymas) prie Plėtinių ir DI komandų skyriaus
  - `docs/chapter-08-production/production-ai-practices.md` — Naujas skyrius „Agentų gyvenimo ciklo valdymas“, apimantis `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
  - `resources/cheat-sheet.md` — Išplėstos DI agentų komandos su `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ir `delete --force`
- **🧩 Nauji peržiūros plėtiniai** dokumentuoti: `azure.ai.skills` (pakartotinai naudojamos agentų įgūdžių rinkmenos) ir `azure.ai.connections` (Foundry jungtys) pridėti prie plėtinių lentelės ir „cheat sheet“
- **⏱️ Atsako laiko nurodymai** — `azd ai agent invoke` pavyzdžiai dabar nurodo, kad spausdinama bendra delsos ir pirmojo baito gavimo trukmė
- **📌 Versijos juosta** pagrindiniame README, nukreipianti mokinius į `azd version` ir `azd upgrade`

#### Pakeista
- **✅ Validavimo bazė atnaujinta** nuo `azd 1.23.12` (2026 m. kovas) iki `azd 1.25.6` (2026 m. birželis) visuose skyriaus README ir dirbtuvių dokumentuose
- **🤖 2 skyriaus plėtinio pastaba** atnaujinta nuo `azure.ai.agents` `0.1.18-preview` iki `0.1.40-preview`
- **🧪 Dirbtuvių validavimo pavyzdys** (`azd version` išvestis) atnaujintas iki `1.25.6`
- **🧭 README skyrius „Kas naujo šiandien azd“** atnaujintas, kad pabrėžtų pilną agento gyvenimo ciklą, naujus DI plėtinius ir neseniai atliktus patogumo patobulinimus (`azd init` idempotentiškumas, `azd auth login` pasenusio rakto valymas, `azd tool` pirmo paleidimo pranešimas)
- **📖 2 skyriaus agents.md (4 variantas)** dabar nukreipia mokinius į po diegimo vykdomas gyvenimo ciklo komandas, o ne sustoja ties `azd up`

#### Ištaisyta
- **🏷️ Produkto pavadinimo pakeitimas** — pridėta Aspire prekinio ženklo atnaujinimo pastaba (".NET Aspire" dabar tiesiog "Aspire"); azd Aspire palaikymas nekeičiamas
- **🔎 Gyvo leidimo validavimas** patvirtintas pagal Azure Developer CLI leidimo srautą: stabilus CLI `1.25.6` (2026-06-12) ir `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Pradedančiųjų įvedimo patikslinimas, sąrankos validavimas ir galutiniai AZD komandų švarinimai
**Ši versija tęsia AZD 1.23 validavimo apžvalgą su pradedančiųjų dokumentacijos peržiūra: ji patikslina pirmiausia AZD autentifikavimo nurodymus, prideda vietinės sąrankos validavimo skriptus, tikrina svarbias komandas pagal gyvą AZD CLI, ir pašalina paskutines pasenusias anglų kalbos komandas už changelogo ribų.**

#### Pridėta
- **🧪 Pradedančiųjų sąrankos validavimo skriptai** su `validate-setup.ps1` ir `validate-setup.sh`, kad mokiniai galėtų patvirtinti būtinus įrankius prieš pradedant 1 skyrių
- **✅ Išankstiniai sąrankos validavimo veiksmai** pagrindiniame README ir 1 skyriaus README, kad trūkstamos išankstinės sąlygos būtų nustatytos prieš `azd up`

#### Pakeista
- **🔐 Pradedančiųjų autentifikavimo gairės** dabar nuosekliai laikosi `azd auth login` kaip pagrindinio AZD darbo eigos kelio, su `az login` nurodymu kaip pasyviu, jei tiesiogiai neliečiamos Azure CLI komandos
- **📚 1 skyriaus įvadinis procesas** dabar nukreipia mokinius tikrinti savo vietinę sąranką prieš diegimą, autentifikavimą ir pirmąjį diegimą
- **🛠️ Validatoriaus pranešimai** dabar aiškiai atskiria kritinius reikalavimus nuo pasirenkamų Azure CLI įspėjimų AZD vien tik pradedančiųjų kelyje
- **📖 Konfigūracijos, trikčių šalinimo ir pavyzdžių dokumentai** dabar skiria būtiną AZD autentifikavimą nuo pasirenkamo Azure CLI prisijungimo ten, kur anksčiau abu buvo pateikti be konteksto

#### Ištaisyta
- **📋 Likusios anglų kalbos komandų nuorodos** atnaujintos į dabartines AZD formas, įskaitant `azd config show` „cheat sheet“ ir `azd monitor --overview`, kur turėjo būti portalo apžvalga
- **🧭 Pradedančiųjų pareiškimai 1 skyriuje** sušvelninti, kad nebūtų per daug žadama garantuotos klaidų nebuvimo ar atsitraukimo visiems šablonams ir Azure ištekliams
- **🔎 Gyvas CLI validavimas** patvirtintas dabartinis palaikymas `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ir `azd down --force --purge`

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

#### AZD 1.23.12 validavimas, dirbtuvių aplinkos išplėtimas ir DI modelio atnaujinimas
**Ši versija atlieka dokumentacijos validavimo peržiūrą pagal `azd` `1.23.12`, atnaujina pasenusius AZD komandų pavyzdžius, atnaujina DI modelio nurodymus pagal dabartinius numatytuosius nustatymus ir plečia dirbtuvių instrukcijas taip, kad jos apimtų ne tik GitHub Codespaces, bet ir dev konteinerius bei vietines kopijas.**

#### Pridėta
- **✅ Validavimo pastabos pagrindiniuose skyriuose ir dirbtuvių dokumentuose** tam, kad mokiniams būtų aiškiai nurodyta išbandyta AZD bazė naudojant naujesnius ar senesnius CLI leidimus
- **⏱️ Diegimo timeout nurodymai** ilgai trunkantiems DI programų diegimams naudojant `azd deploy --timeout 1800`
- **🔎 Plėtinių tikrinimo žingsniai** su `azd extension show azure.ai.agents` DI darbo eigos dokumentuose
- **🌐 Išplėsti dirbtuvių aplinkos nurodymai** apimantys GitHub Codespaces, dev konteinerius ir vietines kopijas su MkDocs

#### Pakeista
- **📚 Skaityklų įvadiniai README** dabar nuosekliai nurodo validavimą pagal `azd 1.23.12` pagrindinėse temose: pagrindai, konfigūracija, infrastruktūra, daugagentinis, priešdiegiantis, trikčių šalinimas ir gamyba
- **🛠️ AZD komandų nuorodos** atnaujintos į dabartines formas visose dokumentacijose:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` arba `azd env get-value(s)` priklausomai nuo konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, kur numatyta Application Insights apžvalga
- **🧪 Provision peržiūros pavyzdžiai** supaprastinti iki dabartinių palaikomų naudojimo būdų, tokių kaip `azd provision --preview` ir `azd provision --preview -e production`
- **🧭 Dirbtuvių eiga** atnaujinta, kad mokiniai galėtų atlikti laboratorijas Codespaces, dev konteineryje ar vietoje esančioje kopijoje, o ne tik Codespaces aplinkoje
- **🔐 Autentifikavimo gairės** dabar pirmenybę teikia `azd auth login` AZD darbo eigoms, su `az login` kaip pasirenkamu, kai tiesiogiai naudojamos Azure CLI komandos

#### Ištaisyta
- **🪟 Windows diegimo komandos** suvienodintos į dabartinį `winget` paketų pavadinimų rašybos formatą diegimo vadove
- **🐧 Linux diegimo gairės** pataisytos, kad būtų išvengta nepalaikomų distro specifiškų `azd` paketų tvarkyklės nurodymų ir nukreiptų į leidimo paketus, kur reikia
- **📦 DI modelių pavyzdžiai** atnaujinti nuo senesnių numatytųjų, tokių kaip `gpt-35-turbo` ir `text-embedding-ada-002`, iki dabartinių pavyzdžių: `gpt-4.1-mini`, `gpt-4.1` ir `text-embedding-3-large`
- **📋 Diegimo ir diagnostikos fragmentai** pataisyti su dabartinėmis aplinkos ir statuso komandomis žurnaluose, skriptuose ir trikčių šalinimo veiksmuose
- **⚙️ GitHub Actions gairės** atnaujintos nuo `Azure/setup-azd@v1.0.0` iki `Azure/setup-azd@v2`
- **🤖 MCP/Copilot sutikimo nurodymai** atnaujinti nuo `azd mcp consent` iki `azd copilot consent list`

#### Patobulinta
- **🧠 DI skyrių nurodymai** dabar aiškiau paaiškina peržiūros jautrią `azd ai` elgseną, nuomininko specifinį prisijungimą, dabartinį plėtinių naudojimą ir atnaujintas modelių diegimo rekomendacijas
- **🧪 Dirbtuvių instrukcijos** dabar naudoja realistiškesnius versijų pavyzdžius ir aiškesnę aplinkos sąrankos kalbą praktinėms laboratorijoms
- **📈 Gamybos ir trikčių šalinimo dokumentai** geriau atitinka dabartinius stebėjimo, atsarginį modelį ir kainų sluoksnio pavyzdžius

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
**Ši versija prideda `azd ai`, `azd extension` ir `azd mcp` komandų aprėptį visuose DI susijusiuose skyriuose, ištaisytus neveikiančius nuorodas ir pasenusius kodus faile agents.md, atnaujina apeikčių lapą bei peržiūri Pavyzdinių šablonų skyrių su patvirtintais aprašymais ir naujais Azure DI AZD šablonais.**

#### Pridėta
- **🤖 AZD DI CLI aprėptis** per 7 failus (anksčiau tik 8 skyriuje):
  - `docs/chapter-01-foundation/azd-basics.md` — Naujas skirsnis „Plėtiniai ir DI komandos“ pristatantis `azd extension`, `azd ai agent init` ir `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 4 variantas: `azd ai agent init` su palyginimo lentele (šablonas vs manifestas)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — poskyriai „AZD plėtiniai Foundry“ ir „Agentų pirmasis diegimas“

  - `docs/chapter-05-multi-agent/README.md` — Greito pradžios vadovas dabar rodo tiek šablono, tiek manifestu pagrįsto diegimo kelius
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Diegimo skyrius dabar apima `azd ai agent init` parinktį
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI plėtinių komandos diagnostikai" poskyris
  - `resources/cheat-sheet.md` — Naujas skyrius "AI ir plėtinių komandos" su `azd extension`, `azd ai agent init`, `azd mcp` ir `azd infra generate`
- **📦 Nauji AZD AI pavyzdiniai šablonai** faile `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG pokalbis su Blazor WebAssembly, Semantic Kernel ir balso pokalbių palaikymu
  - **azure-search-openai-demo-java** — Java RAG pokalbis naudojant Langchain4J su ACA/AKS diegimo galimybėmis
  - **contoso-creative-writer** — Multi-agent kūrybinio rašymo programa naudojant Azure AI Agent Service, Bing Grounding ir Prompty
  - **serverless-chat-langchainjs** — Serverless RAG naudojant Azure Functions + LangChain.js + Cosmos DB su Ollama lokalaus kūrimo palaikymu
  - **chat-with-your-data-solution-accelerator** — Įmonių RAG greitintuvas su administratoriaus portalu, Teams integracija ir PostgreSQL/Cosmos DB galimybėmis
  - **azure-ai-travel-agents** — Multi-agent MCP orkestravimo pavyzdinė programa su serveriais .NET, Python, Java ir TypeScript kalbomis
  - **azd-ai-starter** — Minimalus Azure AI infrastruktūros Bicep pradžios šablonas
  - **🔗 Awesome AZD AI galerijos nuoroda** — Nuoroda į [awesome-azd AI galeriją](https://azure.github.io/awesome-azd/?tags=ai) (daugiau nei 80 šablonų)

#### Pataisyta
- **🔗 agents.md navigacija**: Ankstesnės/Kitos nuorodos dabar atitinka 2-ojo skyriaus README pamokų tvarką (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md sugedusios nuorodos**: `production-ai-practices.md` pataisyta į `../chapter-08-production/production-ai-practices.md` (3 kartus)
- **📦 agents.md pasenęs kodas**: Pakeista `opencensus` į `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md netinkamas API**: `max_tokens` perkelta iš `create_agent()` į `create_run()` kaip `max_completion_tokens`
- **🔢 agents.md žodžių skaičiavimas**: Grubus `len//4` pakeistas į `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ištaisyta paslaugų pavadinimai iš "Cognitive Search + App Service" į "Azure AI Search + Azure Container Apps" (numatytasis šeimininkas pakeistas 2024 m. spalio mėn.)
- **contoso-chat**: Atnaujintas aprašymas su nuoroda į Azure AI Foundry + Prompty, atitinkantis saugyklos tikrąjį pavadinimą ir technologijų rinkinį

#### Pašalinta
- **ai-document-processing**: Pašalinta neveikianti šablono nuoroda (saugykla nėra viešai prieinama kaip AZD šablonas)

#### Patobulinta
- **📝 agents.md pratimai**: 1 pratimas dabar rodo laukiamą rezultatą ir `azd monitor` žingsnį; 2 pratimas apima visą `FunctionTool` registracijos kodą; 3 pratimas pakeičia neaiškias rekomendacijas konkrečiomis `prepdocs.py` komandomis
- **📚 agents.md šaltiniai**: Atitinkamai atnaujintos nuorodos į naujausias Azure AI Agent Service dokumentacijas ir greito pradžios vadovą
- **📋 agents.md Tolimesni žingsniai lentelėje**: Pridėta AI dirbtuvės laboratorijos nuoroda pilnam skyriaus išmokimui

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

#### Pamokų navigacijos patobulinimas
**Ši versija pagerina README.md skyriaus navigaciją patobulinta lentelės forma.**

#### Pakeista
- **Pamokų žemėlapio lentelė**: Patobulinta su tiesioginėmis nuorodomis į pamokas, trukmės įverčiais ir sudėtingumo reitingais
- **Aplankų valymas**: Pašalinti nereikalingi seni aplankai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Nuorodų patikra**: 21+ vidinių nuorodų pamokų žemėlapio lentelėje patikra atlikta

### [v3.16.0] - 2026-02-05

#### Produkto pavadinimų atnaujinimai
**Ši versija atnaujina produkto pavadinimų nuorodas pagal dabartinį Microsoft prekės ženklą.**

#### Pakeista
- **Microsoft Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas pagal dabartinį prekės ženklą

#### Atnaujinti failai
- `README.md` - Pagrindinis kursų pradinio puslapio dokumentas
- `changelog.md` - Versijų istorija
- `course-outline.md` - Kurso struktūra
- `docs/chapter-02-ai-development/agents.md` - AI agentų vadovas
- `examples/README.md` - Pavyzdžių dokumentacija
- `workshop/README.md` - Dirbtuvių pradinio puslapio dokumentas
- `workshop/docs/index.md` - Dirbtuvių indeksas
- `workshop/docs/instructions/*.md` - Visi dirbtuvių instrukcijų failai

---

### [v3.15.0] - 2026-02-05

#### Daug reikšmingų repozitorijos pertvarkymų: skyrių pagrindu pavadinti aplankai
**Ši versija pertvarko dokumentaciją į atskirus skyrių aplankus aiškesnei navigacijai.**

#### Aplankų pervadinimai
Seni aplankai pakeisti skyriaus numerių aplankais:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridėtas naujas: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Pridėta
- **📚 Skyriaus README failai**: Kiekviename skyriaus aplanke sukurtas README.md su:
  - Mokymosi tikslai ir trukmė
  - Pamokų lentelė su aprašymais
  - Greito pradėjimo komandos
  - Navigacija į kitus skyrius

#### Pakeista
- **🔗 Atnaujinti visi vidiniai saitai**: atnaujinta daugiau nei 78 keliai visuose dokumentacijos failuose
- **🗺️ Pagrindinis README.md**: atnaujinta kursų schema su nauja skyriaus struktūra
- **📝 examples/README.md**: atnaujintos nuorodos į skyriaus aplankus

#### Pašalinta
- Sena aplankų struktūra (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Saugyklos pertvarka: skyriaus navigacija
**Ši versija pridėjo skyriaus navigacijos README failus (atidėta v3.15.0 versijai).**

---

### [v3.13.0] - 2026-02-05

#### Nauja AI agentų vadovas
**Ši versija prideda išsamų vadovą, kaip diegti AI agentus naudojant Azure Developer CLI.**

#### Pridėta
- **🤖 docs/microsoft-foundry/agents.md**: Išsamus vadovas, apimantis:
  - Kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trys greito pradžios agentų šablonai (Foundry Agents, Prompty, RAG)
  - Agentų architektūros modeliai (vienas agentas, RAG, keli agentai)
  - Įrankių konfigūravimas ir pritaikymas
  - Stebėjimas ir metrikų sekimas
  - Išlaidų svarstymai ir optimizavimas
  - Dažniausios trikčių šalinimo situacijos
  - Trys praktiniai pratimai su sėkmės kriterijais

#### Turinys ir struktūra
- **Įvadas**: Agentų koncepcijos pradedantiesiems
- **Greito pradėjimo vadovas**: Agentų diegimas su `azd init --template get-started-with-ai-agents`
- **Architektūros modeliai**: Agentų modelių vizualiniai diagramos
- **Konfigūravimas**: Įrankių nustatymai ir aplinkos kintamieji
- **Stebėjimas**: Application Insights integracija
- **Pratimai**: Nuoseklus praktiškas mokymasis (20-45 min. kiekvienas)

---

### [v3.12.0] - 2026-02-05

#### DevContainer aplinkos atnaujinimas
**Ši versija atnaujina kūrimo konteinerio konfigūraciją su moderniais įrankiais ir geresniais numatytaisiais nustatymais AZD mokymosi patirčiai.**

#### Pakeista
- **🐳 Bazinis vaizdas**: atnaujintas nuo `python:3.12-bullseye` iki `python:3.12-bookworm` (naujausias Debian stabilus leidimas)
- **📛 Konteinerio pavadinimas**: pervadintas iš "Python 3" į "AZD pradedantiesiems" aiškumui

#### Pridėta
- **🔧 Naujos Dev Container funkcijos**:
  - `azure-cli` su įjungta Bicep palaikymu
  - `node:20` (AZD šablonų ilgalaikė palaikoma versija)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerių programų diegimui

- **🔌 Prievadų persiuntimas**: iš anksto sukonfigūruoti prievadai dažnam vystymui:
  - 8000 (MkDocs peržiūra)
  - 3000 (Tinklapiai)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nauji VS Code plėtiniai**:
  - `ms-python.vscode-pylance` - Pagerintas Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions palaikymas
  - `ms-azuretools.vscode-docker` - Docker palaikymas
  - `ms-azuretools.vscode-bicep` - Bicep kalbos palaikymas
  - `ms-azure-devtools.azure-resource-groups` - Azure išteklių valdymas
  - `yzhang.markdown-all-in-one` - Markdown redagavimas
  - `DavidAnson.vscode-markdownlint` - Markdown taisyklių tikrinimas
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code nustatymai**: pridėti numatytieji nustatymai Python interpretatoriui, formatavimui įrašant, ir tarpo simbolių šalinimui

- **📦 atnaujintas requirements-dev.txt**:
  - pridėtas MkDocs minify papildinys
  - pridėtas pre-commit kokybės kontrolei
  - pridėti Azure SDK paketai (azure-identity, azure-mgmt-resource)

#### Ištaisyta
- **Post-Create komanda**: dabar tikrina AZD ir Azure CLI diegimą konteinerio paleidime

---

### [v3.11.0] - 2026-02-05

#### Pradedantiesiems skirtas README pertvarkymas
**Ši versija žymiai pagerina README.md, kad jis būtų prieinamesnis pradedantiesiems ir prideda svarbius išteklius AI kūrėjams.**

#### Pridėta
- **🆚 Azure CLI ir AZD palyginimas**: aiškus paaiškinimas, kada naudoti kurį įrankį su praktiškais pavyzdžiais
- **🌟 Nuostabūs AZD saitai**: tiesioginės nuorodos į bendruomenės šablonų galeriją ir prisidėjimo išteklius:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ paruoštų diegti šablonų
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Bendruomenės prisidėjimas
- **🎯 Greito pradėjimo vadovas**: supaprastintas 3 žingsnių pradžios skaidinys (Įdiegti → Prisijungti → Diegti)
- **📊 Patirties pagrindu veikianti navigacijos lentelė**: aiškios gairės, nuo ko pradėti pagal kūrėjo patirtį

#### Pakeista
- **README struktūra**: pertvarkyta progresyviam informacijos atskleidimui - pirmiausia pagrindinė informacija
- **Įvado skyrius**: perrašytas, paaiškinant „The Magic of `azd up`“ visiškai naujiems vartotojams
- **Pašalintas dubliuotas turinys**: pašalintas pakartotinis trikčių šalinimo skyrius

- **Gedimų šalinimo komandos**: Ištaisyta `azd logs` nuoroda, kad naudotų galiojančią komandą `azd monitor --logs`

#### Ištaisyta

- **🔐 Autentifikavimo komandos**: Įtraukta `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Neteisingi komandų paminėjimai**: Pašalinti likę `azd logs` iš README sprendžiant problemų skyrių

#### Pastabos
- **Aprėptis**: Pakeitimai taikyti pagrindiniam README.md ir resources/cheat-sheet.md
- **Tikslinė auditorija**: Patobulinimai ypač skirti AZD naujokams programuotojams

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI komandų tikslumo atnaujinimas
**Ši versija pataiso neegzistuojančias AZD komandas dokumentacijoje, užtikrindama, kad visi kodo pavyzdžiai naudotų galiojančią Azure Developer CLI sintaksę.**

#### Pataisyta
- **🔧 Pašalintos neegzistuojančios AZD komandos**: Išsamus neteisingų komandų auditavimas ir pataisos:
  - `azd logs` (neegzistuoja) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` subkomandos (neegzistuoja) → pakeista į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (neegzistuoja) → pašalinta arba pakeista galiojančiomis alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` parametrai (neegzistuoja) → pašalinti
  - `azd provision --what-if/--rollback` parametrai (neegzistuoja) → atnaujinta naudojant `--preview`
  - `azd config validate` (neegzistuoja) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (neegzistuoja) → pašalintos

- **📚 Failai atnaujinti su komandų pataisomis**:
  - `resources/cheat-sheet.md`: Didelis komandinio žodyno atnaujinimas
  - `docs/deployment/deployment-guide.md`: Ištaisyta atstatymo ir diegimo strategija
  - `docs/troubleshooting/debugging.md`: Pataisyti log analizes skyriai
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisytas AZD derinimo skyrius
  - `docs/getting-started/azd-basics.md`: Pataisytos stebėjimo komandos
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir derinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Pataisyti pagalbos ir versijų pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Pataisytos logų peržiūros komandos
  - `docs/pre-deployment/coordination-patterns.md`: Pataisytos agentų derinimo komandos

- **📝 Versijos nuorodos atnaujintos**: 
  - `docs/getting-started/installation.md`: Pakeista fiksuota `1.5.0` versija į bendrą `1.x.x` su nuoroda į leidimus

#### Pakeista
- **Atstatymo strategijos**: Dokumentacija atnaujinta naudojant Git pagrindu atliekamą atstatymą (AZD neturi gimtojo atstatymo)
- **Logų peržiūra**: Pakeisti `azd logs` paminėjimai į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Veikimo dalis**: Pašalinti neegzistuojantys paralelinių / inkrementinių diegimų parametrai, pateiktos galiojančios alternatyvos

#### Techninės detalės
- **Galiojančios AZD komandos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galiojančios azd monitor parinktys**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patvirtinimas**: Komandos patikrintos su Azure Developer CLI v1.23.x versija

---

### [v3.9.0] - 2026-02-05

#### Interaktyvaus seminaro užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvius seminaro modulius, pataiso visas sugriautas dokumentacijos nuorodas ir pagerina bendrą turinio kokybę AI programuotojams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujas indėlių gairių dokumentas su:
  - Aiškiomis instrukcijomis problemoms pranešti ir pakeitimams siūlyti
  - Dokumentacijos standartai naujam turiniui
  - Kodo pavyzdžių gairės ir įsipareigojimų pranešimų konvencijos
  - Bendruomenės įsitraukimo informacija

#### Užbaigta
- **🎯 Seminaro modulis 7 (Apibendrinimas)**: Pilnas apibendrinimo modulis su:
  - Išsamia seminaro pasiekimų santrauka
  - Pagrindinių temų skyrius apie AZD, šablonus ir Microsoft Foundry
  - Mokymosi kelio tęstinumo rekomendacijos
  - Seminaro iššūkių užduotys su sunkumo įvertinimais
  - Bendruomenės atsiliepimų ir palaikymo nuorodos

- **📚 Seminaro modulis 3 (Išardymas)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot su MCP serverių aktyvavimo gairėmis
  - AZD šablonų aplanko struktūros supratimu
  - Infrastruktūros kaip kodo (Bicep) organizavimo modeliai
  - Praktinės laboratorijos instrukcijos

- **🔧 Seminaro modulis 6 (Išmontavimas)**: Užbaigtas su:
  - Išteklų valymo ir kaštų valdymo tikslais
  - `azd down` naudojimu saugiam infrastruktūros išmontavimui
  - Nurodymai kaip atkurti minkštai ištrintas kognityvines paslaugas
  - Papildomi tyrinėjimo užduočių pasiūlymai GitHub Copilot ir Azure portale

#### Pataisyta
- **🔗 Sugadintų nuorodų pataisymai**: Išspręsta 15+ sugriautų vidinių dokumentacijos nuorodų:
  - `docs/ai-foundry/ai-model-deployment.md`: Pataisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisytos ai-model-deployment.md ir production-ai-practices.md nuorodos
  - `docs/getting-started/first-project.md`: Pakeistas neegzistuojantis cicd-integration.md į deployment-guide.md
  - `examples/retail-scenario.md`: Pataisyti DUK ir trikčių šalinimo gido keliai
  - `examples/container-app/microservices/README.md`: Pataisyti kurso pradžios ir diegimo gido keliai
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujinti dirbtinio intelekto skyriaus paminėjimai
  - `course-outline.md`: Pataisyti instruktorių gido ir AI seminaro laboratorijos nuorodos

- **📅 Seminaro būsenos skelbimas**: Pakeista iš „Kuriama“ į aktyvią būseną su 2026 m. vasario data

- **🔗 Seminaro navigacija**: Pataisyti sugriautos navigacijos nuorodos README.md, nukreipiančios į neegzistuojantį lab-1-azd-basics aplanką

#### Pakeista
- **Seminaro pristatymas**: Pašalinta „kuriama“ įspėjimo žyma, seminaras dabar baigtas ir paruoštas naudoti
- **Navigacijos nuoseklumas**: Užtikrinta visų seminaro modulių teisinga tarpo modulių navigacija
- **Mokymosi kelio nuorodos**: Atnaujintos skyrių kryžminės nuorodos su teisingais microsoft-foundry keliais

#### Patvirtinta
- ✅ Visuose anglų kalbos markdown failuose galiojančios vidinės nuorodos
- ✅ Seminaro moduliai 0-7 baigti su mokymosi tikslais
- ✅ Navigacija tarp skyrių ir modulių veikia tinkamai
- ✅ Turinys pritaikytas AI programuotojams, naudojantiems Microsoft AZD
- ✅ Visur išlaikyta startinio lygio kalba ir struktūra
- ✅ CONTRIBUTING.md suteikia aiškias gaires bendruomenės indėliui

#### Techninė įgyvendinimas
- **Nuorodų tikrinimas**: Automatizuotas PowerShell scenarijus patikrino visas .md vidines nuorodas
- **Turinio auditas**: Rankinis seminaro užbaigtumo ir pritaikomumo pradedantiesiems peržiūra
- **Navigacijos sistema**: Taikyti nuoseklūs skyrių ir modulio navigacijos modeliai

#### Pastabos
- **Aprėptis**: Pakeitimai taikyti tik anglų kalbos dokumentacijai
- **Vertimai**: Vertimų aplankai šioje versijoje nebuvo atnaujinti (automatinis vertimas bus sinchronizuotas vėliau)
- **Seminaro trukmė**: Užbaigtas seminaras dabar suteikia 3-4 valandas praktinio mokymosi

---

### [v3.8.0] - 2025-11-19

#### Pažengusi dokumentacija: Stebėjimas, saugumas ir daugiagentės koordinavimo modeliai
**Ši versija prideda išsamias A lygio pamokas apie Application Insights integraciją, autentifikavimo modelius ir daugiagentės koordinaciją gamybos diegimams.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: faile `docs/pre-deployment/application-insights.md`:
  - Diegimas orientuotas į AZD su automatiniu resursų sukūrimu
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pritaikyta telemetrija (virš 1 200 eilučių)
  - DI/LLM stebėjimo modeliai (Microsoft Foundry modelių žetonų / sąnaudų sekimas)
  - 6 Mermaid diagramų (architektūra, paskirstytas sekimas, telemetrijos srautas)
  - 3 praktinės užduotys (įspėjimai, informacijos skydeliai, DI stebėjimas)
  - Kusto užklausų pavyzdžiai ir sąnaudų optimizavimo strategijos
  - Tiesioginių rodiklių srautas ir realaus laiko derinimas
  - 40-50 minučių mokymosi trukmė su gamybos modeliais

- **🔐 Autentifikavimo ir saugumo modelių pamoka**: faile `docs/getting-started/authsecurity.md`:
  - 3 autentifikavimo modeliai (jungčių eilutės, Key Vault, valdomoji tapatybė)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilnos užduotys (aktyvuoti valdomą tapatybę, naudotojo priskirtą tapatybę, Key Vault sukimą)
  - Saugumo geriausios praktikos ir RBAC konfigūracijos
  - Trikčių šalinimo vadovas ir sąnaudų analizė
  - Gamybos lygio be slaptažodžio autentifikavimo modeliai

- **🤖 Daugiagentės koordinavimo modelių pamoka**: faile `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinavimo modeliai (sekos, paralelinis, hierarchinis, įvykiais valdomas, konsensuso)
  - Pilnas orkestratoriaus paslaugos įgyvendinimas (Python/Flask, virš 1 500 eilučių)
  - 3 specializuoti agentų įgyvendinimai (Tyrėjas, Rašytojas, Redaktorius)
  - Service Bus integracija pranešimų eilėms
  - Cosmos DB būsenos valdymas paskirstytoms sistemoms
  - 6 Mermaid diagramos parodančios agentų sąveikas
  - 3 pažangios užduotys (laiko limitų valdymas, pakartotinių bandymų logika, grandinės pertraukėjas)
  - Sąnaudų skaidymas ($240-565/mėn) su optimizavimo strategijomis
  - Application Insights integracija stebėjimui

#### Pagerinta
- **Parengimo gamybai skyrius**: Dabar aprėpiamas išsamus stebėjimas ir koordinavimo modeliai
- **Pradžios skyrius**: Sustiprintas su profesionaliais autentifikavimo modeliais
- **Gamybinis parengimas**: Pilnas aprėpties nuo saugumo iki stebėjimo
- **Kurso planas**: Atnaujintas nuorodas į naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi eiga**: Geresnė saugumo ir stebėjimo integracija per visą kursą
- **Dokumentacijos kokybė**: Nuoseklūs A lygio standartai (95-97%) naujose pamokose
- **Gamybiniai modeliai**: Pilnas galutinis pasiūlymas įmonių diegimams

#### Patobulinta
- **Programuotojo patirtis**: Aiškus kelias nuo kūrimo iki gamybinio stebėjimo
- **Saugumo standartai**: Profesionalūs autentifikavimo ir slaptumo valdymo modeliai
- **Stebėsena**: Pilna Application Insights integracija su AZD
- **DI darbo krūviai**: Specializuotas stebėjimas Microsoft Foundry Modeliams ir daugiagentinėms sistemoms

#### Patvirtinta
- ✅ Visos pamokos turi pilną veikiantį kodą (ne tik fragmentus)
- ✅ Mermaid diagramos vizualiam mokymuisi (iš viso 19, per 3 pamokas)
- ✅ Praktinės užduotys su tikrinimo žingsniais (iš viso 9)
- ✅ Gamybai paruošti Bicep šablonai, diegiami per `azd up`
- ✅ Sąnaudų analizė ir optimizavimo strategijos
- ✅ Trikčių šalinimo vadovai ir geriausios praktikos
- ✅ Žinių patikros su tikrinimo komandomis

#### Dokumentacijos vertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsamus stebėjimo vadovas
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo modeliai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios daugiagentės architektūros
- **Visas naujas turinys**: - Nuoseklūs aukštos kokybės standartai

#### Techninė įgyvendinimas
- **Application Insights**: Log Analytics + pritaikyta telemetrija + paskirstytas sekimas
- **Autentifikavimas**: Valdoma tapatybė + Key Vault + RBAC modeliai
- **Daugiagentė sistema**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Stebėjimas**: Tiesioginiai rodikliai + Kusto užklausos + įspėjimai + skydeliai
- **Sąnaudų valdymas**: Atrankos strategijos, išsaugojimo politikos, biudžeto valdikliai

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Microsoft Foundry modelių pavyzdys
**Ši versija pagerina dokumentacijos kokybę visame repozitoriume ir prideda pilną Microsoft Foundry modelių diegimo pavyzdį su gpt-4.1 pokalbių sąsaja.**

#### Pridėta
- **🤖 Microsoft Foundry modelių pokalbių pavyzdys**: Pilnas gpt-4.1 diegimas su veikianti implementacija `examples/azure-openai-chat/`:
  - Pilna Microsoft Foundry modelių infrastruktūra (gpt-4.1 modelio diegimas)
  - Python komandų eilutės pokalbių sąsaja su pokalbių įrašais
  - Key Vault integracija saugiam API raktų saugojimui
  - Žetonų naudojimo stebėjimas ir sąnaudų įvertinimas
  - Srauto ribojimas ir klaidų valdymas
  - Išsamus README su 35-45 minučių diegimo vadovu
  - 11 gamybos paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos pratimai**: Pridėti praktiniai pratimai į konfigūracijos gidą:
  - Pratimas 1: Daugiaprostorinė konfigūracija (15 minučių)
  - Pratimas 2: Slaptumo valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikros žingsniai
- **✅ Diegimo patikra**: Pridėtas patikros skyrius diegimo gairėse:
  - Sveikatos tikrinimo procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Numatomos visų diegimo komandų išeities reikšmės
  - Greitos trikčių šalinimo nuorodos

#### Pagerinta
- **examples/README.md**: Atnaujintas į A lygio kokybę (93%):
  - Įtrauktas azure-openai-chat į visas atitinkamas sekcijas
  - Vietinių pavyzdžių skaičius padidintas nuo 3 iki 4
  - Įrašytas į DI programų pavyzdžių lentelę
  - Integruotas į greito starto vadovą tarpinio lygio vartotojams
  - Pridėtas Microsoft Foundry šablonų skyrius
  - Atnaujintas palyginimo matrica ir technologijų atrankos skyriai
- **Dokumentacijos kokybė**: Pagerinta iš B+ (87%) į A- (92%) dokumentų aplanke:

  - Pridėti tikėtini rezultatai kritinių komandų pavyzdžiuose
  - Įtraukti konfigūracijos pakeitimų patikrinimo žingsniai
  - Patobulintas praktinis mokymasis su praktiniais pratimais

#### Pakeista
- **Mokymosi eiga**: Geresnė AI pavyzdžių integracija vidutinio lygio mokiniams
- **Dokumentacijos struktūra**: Daugiau vykdomų pratimų su aiškiais rezultatais
- **Patikrinimo procesas**: Aiškūs sėkmės kriterijai pridedami prie pagrindinių darbo eigų

#### Pagerinta
- **Kūrėjo patirtis**: Microsoft Foundry modelių diegimas dabar trunka 35–45 minutes (vietoj 60–90 kompleksinėms alternatyvoms)
- **Skaidrumas dėl kaštų**: Aiškios sąnaudos ($50–200/mėn.) Microsoft Foundry modelių pavyzdyje
- **Mokymosi kelias**: AI kūrėjams pateikiama aiški pradžia su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs tikėtini rezultatai ir tikrinimo žingsniai

#### Patvirtinta
- ✅ Microsoft Foundry modelių pavyzdys pilnai veikia su `azd up`
- ✅ Visi 11 įgyvendinimo failų sintaksiškai teisingi
- ✅ README instrukcijos atitinka tikrą diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Duplikatų išorinių nuorodų lentelėse nėra
- ✅ Visos navigacijos nuorodos yra teisingos

#### Techninis įgyvendinimas
- **Microsoft Foundry modelių architektūra**: gpt-4.1 + Key Vault + Container Apps modelis
- **Saugumas**: Paruošta valdomos tapatybės funkcija, slaptieji raktai Key Vault
- **Stebėsena**: Application Insights integracija
- **Kaštų valdymas**: Žetonų sekimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda pilnam nustatymui

### [v3.6.0] - 2025-11-19

#### Pagrindinis atnaujinimas: Container App diegimo pavyzdžiai
**Ši versija pristato išsamų, produkcijai paruoštą konteinerinių programų diegimo pavyzdžių rinkinį, naudojant Azure Developer CLI (AZD), su pilna dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Container App pavyzdžiai**: Nauji vietiniai pavyzdžiai `examples/container-app/`:
  - [Pagrindinė vadovas](examples/container-app/README.md): Išsamus konteinerizuotų diegimų apžvalga, greitas pradėjimas, gamybiniai ir pažangūs modeliai
  - [Paprastas Flask API](../../examples/container-app/simple-flask-api): Pradedančiųjų draugiškas REST API su skalavimo iki nulio, sveikatos patikrinimais, stebėsena ir trikčių šalinimu
  - [Mikropaslaugų architektūra](../../examples/container-app/microservices): Gamybinė daugiapaslapių paslaugų diegimas (API vartai, produktas, užsakymas, naudotojas, pranešimai), asinchroninė žinučių siunta, Service Bus, Cosmos DB, Azure SQL, paskirstytas sekimas, blue-green/canary diegimas
- **Geriausios praktikos**: Saugumas, stebėsena, kaštų optimizavimas ir CI/CD rekomendacijos konteinerizuotoms darbo apkrovoms
- **Kodo pavyzdžiai**: Pilnas `azure.yaml`, Bicep šablonai ir daugiakalbės paslaugų įgyvendinimo pavyzdžiai (Python, Node.js, C#, Go)
- **Testavimas ir trikčių šalinimas**: End-to-end testo scenarijai, stebėjimo komandos, trikčių šalinimo gairės

#### Pakeista
- **README.md**: Atnaujinta, pridedant naujus container app pavyzdžius po „Vietiniai pavyzdžiai – konteinerinės programos“
- **examples/README.md**: Atnaujinta, išryškinant container app pavyzdžius, pridedant palyginimo lenteles ir atnaujinant technologijų/architektūros nuorodas
- **Kurso apžvalga ir mokymosi vadovas**: Atnaujinta, nurodant naujus container app pavyzdžius ir diegimo modelius atitinkamuose skyriuose

#### Patvirtinta
- ✅ Visi nauji pavyzdžiai diegiami su `azd up` ir atitinka geriausias praktikas
- ✅ Dokumentacijos kryžminės nuorodos ir navigacija atnaujintos
- ✅ Pavyzdžiai apima nuo pradedančiųjų iki pažangių scenarijų, įskaitant gamybinius mikropaslaugų sprendimus

#### Pastabos
- **Apimtis**: Tik anglų kalba dokumentacija ir pavyzdžiai
- **Kiti žingsniai**: Ateityje planuojama išplėsti pažangius konteinerių modelius ir CI/CD automatizavimą

### [v3.5.0] - 2025-11-19

#### Produkto pavadinimo keitimas į Microsoft Foundry
**Ši versija įgyvendina visapusišką produkto pavadinimo keitimą nuo "Microsoft Foundry" į "Microsoft Foundry" visoje anglų dokumentacijoje, atspindint oficialų Microsoft prekės ženklo pakeitimą.**

#### Pakeista
- **🔄 Produkto pavadinimo atnaujinimas**: Visapusiškas prekės ženklo keitimas nuo "Microsoft Foundry" į "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų dokumentacijoje `docs/` kataloge
  - Pervadintas katalogas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervadintas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso 23 turinio nuorodos atnaujintos 7 dokumentacijos failuose

- **📁 Katalogų struktūros pakeitimai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nuorodos atnaujintos atspindėti naują katalogų struktūrą
  - Navigacijos nuorodos patikrintos visuose dokumentuose

- **📄 Failų pervadinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Visos vidinės nuorodos atnaujintos, kad nurodytų naujus failų pavadinimus

#### Atnaujinti failai
- **Skyriaus dokumentacija** (7 failai):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigacijos nuorodų atnaujinimai
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produkto pavadinimo nuorodos atnaujintos
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 nuorodos atnaujintos (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 kryžminių nuorodų atnaujinimai
  - `docs/getting-started/first-project.md` - 2 skyriaus navigacijos nuorodos atnaujinimai
  - `docs/getting-started/installation.md` - 2 nuorodos į kitus skyrius atnaujinimai
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 nuorodos atnaujintos (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijos nuoroda atnaujinta
  - `docs/troubleshooting/debugging.md` - 1 navigacijos nuoroda atnaujinta

- **Kurso struktūros failai** (2 failai):
  - `README.md` - 17 nuorodų atnaujinimų (kurso apžvalga, skyrių pavadinimai, šablonai, bendruomenės įžvalgos)
  - `course-outline.md` - 14 nuorodų atnaujinimų (apžvalga, mokymosi tikslai, skyrių ištekliai)

#### Patvirtinta
- ✅ Nėra likusių „ai-foundry“ katalogo nuorodų anglų dokumentacijoje
- ✅ Nėra likusių „Microsoft Foundry“ pavadinimo nuorodų anglų dokumentacijoje
- ✅ Visos navigacijos nuorodos veikia naujoje katalogų struktūroje
- ✅ Failų ir katalogų pervadinimai sėkmingai įvykdyti
- ✅ Kryžminės nuorodos tarp skyrių patikrintos

#### Pastabos
- **Apimtis**: Pakeitimai taikyti tik anglų dokumentacijai `docs/` kataloge
- **Vertimai**: Vertimų katalogai (`translations/`) šioje versijoje neatnaujinti
- **Seminaras**: Seminaro medžiaga (`workshop/`) nebuvo atnaujinta šioje versijoje
- **Pavyzdžiai**: Pavyzdžių failai gali dar turėti seną pavadinimą (bus atnaujinta ateityje)
- **Išorinės nuorodos**: Išoriniai URL ir GitHub saugyklos nuorodos liko nepakitusios

#### Migracijos vadovas prisidedantiems
Jei turite vietines šakas ar dokumentaciją, nurodančią seną struktūrą:
1. Atnaujinkite katalogų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės nuorodos vis dar veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastruktūros peržiūros ir patikros patobulinimai
**Ši versija pristato išsamų palaikymą naujai Azure Developer CLI peržiūros funkcijai ir gerina seminaro naudotojo patirtį.**

#### Pridėta
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsamus naujos infrastruktūros peržiūros galimybės aprašymas
  - Komandų nuoroda ir naudojimo pavyzdžiai spausdinamame lapelyje
  - Išsamus integravimas į derinimo gaires su naudojimo atvejais ir naudomis
  - Išankstinė patikra integruota saugesniam diegimui
  - Naujienų vadovo atnaujinimai su saugumo principu vykdomais diegimais
- **🚧 Seminaro būsenos juosta**: Profesionalus HTML baneris, nurodantis seminaro kūrimo statusą
  - Gradientinis dizainas su statybos indikatoriais, aiškiai informuojantis naudotoją
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas dizainas visų įrenginių palaikymui

#### Patobulinta
- **Infrastruktūros saugumas**: Peržiūros funkcija integruota per visą diegimo dokumentaciją
- **Išankstinis patikrinimas**: Automatiniai skriptai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjo darbo eiga**: Komandų sekos atnaujintos, įtraukiant peržiūrą kaip geriausią praktiką
- **Seminaro patirtis**: Aiškios naudotojų lūkesčių gairės apie kuriamą turinį

#### Pakeista
- **Diegimo geriausios praktikos**: Dabar rekomenduojamas darbo eiga „preview-first“
- **Dokumentacijos srautas**: Infrastruktūros patikra perkelta ankstesniame mokymosi etape
- **Seminaro prezentacija**: Profesionalus statuso rodymas su aiškiu kūrimo grafiku

#### Pagerinta
- **Saugumo principas pirmiausia**: Infrastruktūros pakeitimus galima patikrinti prieš diegimą
- **Komandinis darbas**: Peržiūros rezultatai gali būti dalijami peržiūrai ir patvirtinimui
- **Kaštų suvokimas**: Geresnis išteklių kainų supratimas prieš derinimą
- **Rizikos mažinimas**: Sumažinta diegimo nesėkmių rizika dėl išankstinių patikrų

#### Techninis įgyvendinimas
- **Daugiadokumentinis integravimas**: Peržiūros funkcija dokumentuota 4 pagrindiniuose failuose
- **Komandų modeliai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Geriausių praktikų integracija**: Peržiūra įtraukta į patikrinimo darbo eigas ir skriptus
- **Vizualiniai indikatoriai**: Aiškūs NAUJŲ funkcijų žymėjimai dėl lengvo suradimo

#### Seminaro infrastruktūra
- **Statuso komunikacija**: Profesionalus HTML baneris su gradientiniu stiliumi
- **Naudotojo patirtis**: Aiškus kūrimo statuso rodymas, kad būtų išvengta painiavos
- **Profesionali prezentacija**: Išlaikomas saugyklos patikimumas ir nustatomi lūkesčiai
- **Laiko grafikų skaidrumas**: Spalio 2025 paskutinio atnaujinimo žyma dėl atsakomybės

### [v3.3.0] - 2025-09-24

#### Patobulinta seminaro medžiaga ir interaktyvi mokymosi patirtis
**Ši versija pristato išsamią seminaro medžiagą su naršyklės pagrindu veikiančiomis interaktyviomis pamokomis ir struktūruotus mokymosi kelius.**

#### Pridėta
- **🎥 Interaktyvus seminaro vadovas**: Naršyklėje veikianti seminaro patirtis su MkDocs peržiūros galimybe
- **📝 Struktūruotos seminaro instrukcijos**: 7 žingsnių vedamas mokymosi kelias nuo atradimo iki pritaikymo
  - 0-Įvadas: Seminaro apžvalga ir paruošimas
  - 1-Pasirinkti AI šabloną: Šablono atradimo ir pasirinkimo procesas
  - 2-Patikrinti AI šabloną: Diegimo ir patvirtinimo procedūros
  - 3-Išardyti AI šabloną: Šablono architektūros supratimas
  - 4-Su-konfigūruoti AI šabloną: Konfigūravimas ir pritaikymas
  - 5-Pritaikyti AI šabloną: Pažangūs pakeitimai ir iteracijos
  - 6-Sunaikinti infrastruktūrą: Valymas ir išteklių tvarkymas
  - 7-Apibendrinti: Santrauka ir tolesni žingsniai
- **🛠️ Seminario įrankiai**: MkDocs konfigūracija su Material tema geresnei mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodologija (Atradimas → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces integracija**: Sklandi vystymo aplinkos paruošimo integracija

#### Patobulinta
- **AI seminaro laboratorija**: Išplėsta su išsamia 2–3 valandų struktūruota mokymosi patirtimi
- **Seminaro dokumentacija**: Profesionali prezentacija su navigacija ir vaizdiniais pagalbininkais
- **Mokymosi eiga**: Aiškios žingsnis po žingsnio gairės nuo šablono pasirinkimo iki gamybinio diegimo
- **Kūrėjo patirtis**: Integruoti įrankiai sklandžiai vystymo darbo eigai

#### Pagerinta
- **Prieinamumas**: Naršyklės pagrindo sąsaja su paieška, kopijavimo funkcija ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksčios seminaro struktūros, pritaikytos skirtingiems mokymosi tempams
- **Praktinis taikymas**: Realūs AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija seminaro palaikymui ir bendradarbiavimui

#### Seminaro ypatybės
- **Įmontuota paieška**: Greita raktinių žodžių ir pamokų paieška
- **Kodo blokų kopijavimas**: Pele paspaudus galima nukopijuoti visus kodo pavyzdžius
- **Temos perjungimas**: Šviesaus/tamsaus režimo palaikymas pagal vartotojo pageidavimus
- **Vaizdiniai elementai**: Ekrano kopijos ir diagramos geresniam supratimui
- **Pagalbos integracija**: Tiesioginė Discord prieiga bendruomenės palaikymui

### [v3.2.0] - 2025-09-17

#### Pagrindinė navigacijos pertvarka ir mokymosi sistema pagal skyrius
**Ši versija pristato išsamią mokymosi sistemą pagal skyrius su patobulinta navigacija visoje saugykloje.**

#### Pridėta
- **📚 Mokymosi sistema pagal skyrius**: Perstruktūruotas visas kursas į 8 nuoseklius mokymosi skyrius
  - 1 skyrius: Pagrindai ir greitas startas (⭐ - 30–45 min)
  - 2 skyrius: AI pirmumo kūrimas (⭐⭐ - 1–2 val.)
  - 3 skyrius: Konfigūracija ir autentifikacija (⭐⭐ - 45–60 min)
  - 4 skyrius: Infrastruktūra kaip kodas ir diegimas (⭐⭐⭐ - 1–1,5 val.)
  - 5 skyrius: Daugiagentė AI sprendimai (⭐⭐⭐⭐ - 2–3 val.)
  - 6 skyrius: Išankstinė derinimo patikra ir planavimas (⭐⭐ - 1 val.)
  - 7 skyrius: Trikčių šalinimas ir derinimas (⭐⭐ - 1–1,5 val.)
  - 8 skyrius: Gamybiniai ir įmonių modeliai (⭐⭐⭐⭐ - 2–3 val.)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir poraštės visoje dokumentacijoje
- **🎯 Progreso sekimas**: Kurso užbaigimo kontrolinis sąrašas ir mokymosi patikros sistema
- **🗺️ Mokymosi kelio gairės**: Aiškios įžangos įvairiems patirties lygiams ir tikslams
- **🔗 Kryžminė navigacija**: Susiję skyriai ir išankstiniai reikalavimai aiškiai susieti

#### Patobulinta
- **README struktūra**: Pertvarkyta į struktūruotą mokymo platformą su skyrių pagrindu
- **Dokumentacijos navigacija**: Kiekviename puslapyje dabar pateikiamas skyriaus kontekstas ir mokymosi gairės
- **Šablonų organizavimas**: Pavyzdžiai ir šablonai priskirti tinkamiems mokymosi skyriams

- **Išteklių integracija**: Klaidos lapai, DUK ir mokymosi vadovai susieti su atitinkamomis temomis
- **Dirbtuvių integracija**: Praktiniai užsiėmimai susieti su keliomis skirsnių mokymosi tikslais

#### Pakeista
- **Mokymosi eiga**: Pereita nuo linijinės dokumentacijos prie lanksčios pagal skyrius mokymosi struktūros
- **Konfigūracijos vieta**: Konfigūracijos gidas perkeltas į 3 skyrių geresniam mokymosi srautui
- **DI turinio integracija**: Geresnė DI specifinio turinio integracija viso mokymosi metu
- **Gamybinis turinys**: Pažangios schemos suvestos į 8 skyrių įmonių mokymosi dalyviams

#### Patobulinta
- **Naudotojo patirtis**: Aiškios navigacijos duonos trupiniai ir skyriaus eigos indikatoriai
- **Prieinamumas**: Nuoseklūs navigacijos modeliai patogesniam kurso tyrinėjimui
- **Profesionalus pateikimas**: Universiteto stiliaus kurso struktūra tinkama akademiniam ir korporatyviniam mokymui
- **Mokymosi efektyvumas**: Sutrumpintas laikas ieškant aktualaus turinio perpagerintos organizacijos dėka

#### Techninė implamentacija
- **Navigacijos antraštės**: Standartizuota skyriaus navigacija daugiau nei 40 dokumentacijos failų
- **Poraštės navigacija**: Nuosekli pažangos gairė ir skyriaus pabaigos indikatoriai
- **Tarpinis susiejimas**: Išsamus vidinis susiejimo sistema sujungiant su artimomis sąvokomis
- **Skyrių žemėlapis**: Šablonai ir pavyzdžiai aiškiai siejami su mokymosi tikslais

#### Studijų vadovo patobulinimas
- **📚 Išsamūs mokymosi tikslai**: Studijų vadovas pertvarkytas su 8 skyrių sistema
- **🎯 Vertinimas pagal skyrius**: Kiekviename skyriuje yra konkretūs mokymosi tikslai ir praktinės užduotys
- **📋 Pažangos stebėjimas**: Savaitinis mokymosi planas su matuojamais rezultatais ir užbaigimo sąrašais
- **❓ Vertinimo klausimai**: Žinių patikrinimo klausimai kiekvienam skyriui su profesionaliais rezultatais
- **🛠️ Praktinės užduotys**: Praktiniai užsiėmimai su realių diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių progresas**: Aiškus žingsniavimas nuo pagrindinių sąvokų iki įmonių modelių su karjeros vystymo dėmesiu
- **🎓 Sertifikavimo sistema**: Profesionalaus tobulėjimo rezultatai ir bendruomenės pripažinimo sistema
- **⏱️ Laiko valdymas**: Strukturizuotas 10 savaičių mokymosi planas su etapų patvirtinimu

### [v3.1.0] - 2025-09-17

#### Patobulintos daugianarių DI sprendimai
**Ši versija pagerina daugianarę mažmeninės prekybos sprendimą su geresniu agentų vardų naudojimu ir patobulinta dokumentacija.**

#### Pakeista
- **Daugianarių terminologija**: Visur pakeistas „Cora agent“ į „Kliento agentą“ daugianarių mažmeninės prekybos sprendime aiškesniam supratimui
- **Agentų architektūra**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai nuosekliai naudoja „Kliento agento“ pavadinimą
- **Konfigūracijos pavyzdžiai**: Modernizuoti agentų konfigūracijos modeliai su atnaujintomis vardų konvencijomis
- **Dokumentacijos nuoseklumas**: Užtikrinta, kad visi paminėjimai naudoja profesionalius, aprašomuosius agentų vardus

#### Patobulinta
- **ARM šablonų paketas**: Atnaujintas retail-multiagent-arm-template su Kliento agento nuorodomis
- **Architektūros diagramos**: Atnaujintos Mermaid diagramos su atnaujintu agentų vardinimu
- **Kodo pavyzdžiai**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent vardus
- **Aplinkos kintamieji**: Atnaujinti visi diegimo skriptai su CUSTOMER_AGENT_NAME konvencijomis

#### Pagerinta
- **Kūrėjo patirtis**: Aiškesnės agentų rolės ir atsakomybės dokumentacijoje
- **Parengta gamybai**: Geresnis suderinamumas su įmonių vardų konvencijomis
- **Mokymosi medžiaga**: Intuityvesnis agentų vardų naudojimas švietimo tikslais
- **Šablonų naudojimo paprastumas**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeisti CoraAgent klasių vardai į CustomerAgent Python pavyzdžiuose
- Redaguotos ARM šablonų JSON konfigūracijos naudojant „customer“ agento tipą
- Atnaujinti aplinkos kintamieji nuo CORA_AGENT_* į CUSTOMER_AGENT_* modelius
- Atnaujinti visi diegimo komandų ir konteinerių konfigūracijos

### [v3.0.0] - 2025-09-12

#### Pagrindiniai pakeitimai - DI kūrėjų dėmesys ir Microsoft Foundry integracija
**Ši versija transformuoja saugyklą į išsamų DI orientuotą mokymosi išteklių su Microsoft Foundry integracija.**

#### Pridėta
- **🤖 DI-pirmoji mokymosi kryptis**: Pilnas pertvarkymas, orientuotas į DI kūrėjus ir inžinierius
- **Microsoft Foundry integracijos gidas**: Išsami dokumentacija, skirta susijungimui su AZD ir Microsoft Foundry paslaugomis
- **DI modelio diegimo modeliai**: Išsamus gidas apie modelių parinkimą, konfigūraciją ir gamybinį diegimą
- **DI dirbtuvių laboratorija**: 2–3 valandų praktinės dirbtuvės, skirtos DI programų konvertavimui į AZD diegiamus sprendimus
- **Gamybinių DI gerosios praktikos**: Įmonių paruoštos skalimo, stebėjimo ir saugumo schemos DI darbo krūviams
- **DI specifinis trikčių šalinimo gidas**: Išsamus trikčių šalinimas Microsoft Foundry modeliams, pažinimo paslaugoms ir DI diegimo problemoms
- **DI šablonų galerija**: Rinktinė Microsoft Foundry šablonų kolekcija su sudėtingumo įvertinimais
- **Dirbtuvių medžiagos**: Pilna dirbtuvių struktūra su praktiniais laboratoriniais darbais ir nuorodų medžiaga

#### Pagerinta
- **README struktūra**: DI kūrėjams orientuota su 45 % bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Mokymosi keliai**: Skirtas DI kūrėjų kelias kartu su tradiciniais studentų ir DevOps inžinierių keliais
- **Šablonų rekomendacijos**: Rinktiniai DI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Bendruomenės integracija**: Pagerintas Discord bendruomenės palaikymas su DI specifinėmis kanalais ir diskusijomis

#### Saugumas ir gamybos fokusas
- **Valdomos tapatybės modeliai**: DI specifinės autentifikacijos ir saugumo konfigūracijos
- **Kainų optimizavimas**: Žetonų naudojimo sekimas ir biudžeto kontrolė DI darbo krūviams
- **Daugiavietės diegimas**: Strategijos pasauliniam DI programų diegimui
- **Veiklos stebėjimas**: DI specifiniai rodikliai ir Application Insights integracija

#### Dokumentacijos kokybė
- **Linijinė kurso struktūra**: Logiška eiga nuo pradedančiųjų iki pažangių DI diegimo modelių
- **Patikrinti URL**: Visi išoriniai saugyklos nuorodų veikia ir yra pasiekiami
- **Pilnas nuorodų rinkinys**: Visi vidiniai dokumentacijos saitai patikrinti ir veikia
- **Paruošta gamybai**: Įmonių diegimo modeliai su realaus pasaulio pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Pagrindiniai pakeitimai - Saugyklos pertvarkymas ir profesionalus patobulinimas
**Ši versija žymi reikšmingą saugyklos struktūros ir turinio pateikimo peržiūrą.**

#### Pridėta
- **Struktūruota mokymosi sistema**: Visi dokumentacijos puslapiai dabar turi Įvado, Mokymosi tikslų ir pasiekimų skyrius
- **Navigacijos sistema**: Pridėtos Ankstesnio/Kito pamokos nuorodos visoje dokumentacijoje, siekiant mokymosi proceso lengvinimo
- **Studijų vadovas**: Išsamus study-guide.md su mokymosi tikslais, praktiniais pratimais ir vertinimo medžiaga
- **Profesionalus pateikimas**: Pašalinti visi jaustukų ikonėlės dėl geresnio prieinamumo ir profesionalumo
- **Patobulinta turinio struktūra**: Pagerinta mokymosi medžiagų organizacija ir srautas

#### Pakeista
- **Dokumentacijos formatas**: Standartizuota visa dokumentacija su nuoseklia mokymosi struktūra
- **Navigacijos eiga**: Įdiegta logiška mokymo medžiagų seka
- **Turinio pateikimas**: Pašalinti dekoratyviniai elementai, paliekant aiškų, profesionalų formatavimą
- **Nuorodų struktūra**: Atnaujintos visos vidinės nuorodos, kad palaikytų naują navigacijos sistemą

#### Patobulinta
- **Prieinamumas**: Pašalintos jaustukų priklausomybės dėl geresnio suderinamumo su ekrano skaitytuvais
- **Profesionalus vaizdas**: Švarus, akademinio stiliaus pateikimas tinkamas įmonių mokymuisi
- **Mokymosi patirtis**: Strukturintas požiūris su aiškiais tikslais ir rezultatais kiekvienai pamokai
- **Turinio organizacija**: Pagerintas logiškas srautas ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Pradinis leidimas - Išsamus AZD mokymosi saugykla

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Išsamus pradedančiojo gidų serijų rinkinys
  - Išplėstinė diegimo ir aprovizacijos dokumentacija
  - Detalūs trikčių šalinimo ištekliai ir derinimo vadovai
  - Įrankiai ir procedūros prieš diegimą

- **Pradedančiojo modulis**
  - AZD pagrindai: pagrindinės sąvokos ir terminai
  - Įdiegimo gidas: platformos specifinės nustatymo instrukcijos
  - Konfigūracijos gidas: aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto pamoka: žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir aprovizacijos modulis**
  - Diegimo vadovas: išsami darbo eigos dokumentacija
  - Aprovisionavimo vadovas: infrastruktūra kaip kodas naudojant Bicep
  - Gerosios praktikos gamybinėms diegimams
  - Daugiapakopės paslaugų architektūros modeliai

- **Priešdiegiamos patikros modulis**
  - Talpos planavimas: Azure išteklių prieinamumo patikra
  - SKU pasirinkimas: ištobulinta paslaugų lygio gairė
  - Pradines patikros: automatizuoti patikros skriptai (PowerShell ir Bash)
  - Sąnaudų įvertinimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažnos problemos: dažniausiai sutinkamos problemos ir sprendimai
  - Derinimo vadovas: sistemingas trikčių šalinimas
  - Pažangios diagnostikos technikos ir įrankiai
  - Veiklos stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų klaidų lapas: greita nuoroda į svarbiausias komandas
  - Žodynas: išsamūs terminų ir santrumpų apibrėžimai
  - DUK: išsamūs atsakymai į dažniausiai užduodamus klausimus
  - Išorinės nuorodos ir bendruomenės ryšiai

- **Pavyzdžiai ir šablonai**
  - Paprastos interneto programos pavyzdys
  - Statinio svetainės diegimo šablonas
  - Konteinerių programos konfigūracija
  - Duomenų bazės integracijos modeliai
  - Mikroservisų architektūros pavyzdžiai
  - Bevielių funkcijų įgyvendinimai

#### Funkcijos
- **Daugiaplatforminė palaikymas**: Įdiegimo ir konfigūracijos gidai Windows, macOS ir Linux
- **Keli įgūdžių lygiai**: Turinys skirtas studentams ir profesionaliems kūrėjams
- **Praktinis fokusas**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Išsamus aprėptis**: Nuo pagrindinių sąvokų iki pažangių įmonių modelių
- **Saugumas pirmiausia**: Saugumo gerosios praktikos integruotos visuose lygiuose
- **Sąnaudų optimizavimas**: Gairės efektyviam sąnaudų valdymui ir išteklių naudojimui

#### Dokumentacijos kokybė
- **Išsamūs kodo pavyzdžiai**: Praktiniai, išbandyti kodo pavyzdžiai
- **Žingsnis po žingsnio instrukcijos**: Aiškios, veiksmingos gairės
- **Išsamus klaidų tvarkymas**: Trikčių šalinimas dažnoms problemoms
- **Geriausių praktikų integracija**: Pramonės standartai ir rekomendacijos
- **Versijų suderinamumas**: Naujausia Azure paslaugų ir azd funkcijų versija

## Planuojami ateities patobulinimai

### Versija 3.1.0 (planuojama)
#### DI platformos plėtra
- **Daugiamodelių palaikymas**: Integracijos modeliai Hugging Face, Azure Machine Learning ir individualiems modeliams
- **DI agentų sistemos**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Pažangios RAG schemos**: Vektorinės duomenų bazės pasirinkimai už Azure AI Search ribų (Pinecone, Weaviate ir kt.)
- **DI stebėjimas**: Patobulintas modelių veiklos, žetonų naudojimo ir atsakymų kokybės monitoringas

#### Kūrėjo patirtis
- **VS Code plėtinys**: Integruota AZD + Microsoft Foundry kūrimo patirtis
- **GitHub Copilot integracija**: DI pagalbinė AZD šablonų generacija
- **Interaktyvūs mokymai**: Praktiniai programavimo pratimai su automatiniu vertinimu DI scenarijams
- **Vaizdo turinys**: Priediniai vaizdo pamokos vizualiems mokymams, orientuotos į DI diegimus

### Versija 4.0.0 (planuojama)
#### Įmonių DI modeliai
- **Valdymo sistema**: DI modelių valdymas, atitiktis ir audito įrašai
- **Daugiau paskirstytų DI**: Modeliai kelių klientų aptarnavimui izoliuotuose DI servisuose
- **Edge DI diegimas**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hibridinis debesų DI**: Daugiadebės ir hibridiniai DI darbo krūvių diegimo modeliai

#### Pažangios funkcijos
- **DI kanalo automatizavimas**: MLOps integracija su Azure Machine Learning kanalais
- **Pažangus saugumas**: Nulinės pasitikėjimo schemos, privatūs endpointai ir pažangus grėsmių apsaugos modelis
- **Veiklos optimizavimas**: Pažangios derinimo ir mastelio keitimo strategijos aukšto pralaidumo DI programoms
- **Pasaulinė paskirstymas**: Turinio pateikimo ir pakraščio talpinimo modeliai DI programoms

### Versija 3.0.0 (planuojama) - Pakeista dabartiniu leidimu
#### Siūlomi papildymai - Dabar įgyvendinti v3.0.0
- ✅ **DI-fokusuotas turinys**: Išsami Microsoft Foundry integracija (Įvykdyta)
- ✅ **Interaktyvūs mokymai**: Praktinė DI dirbtuvių laboratorija (Įvykdyta)
- ✅ **Pažangus saugumo modulis**: DI specifiniai saugumo modeliai (Įvykdyta)
- ✅ **Veiklos optimizavimas**: DI darbo krūvio derinimo strategijos (Įvykdyta)

### Versija 2.1.0 (planuojama) - Iš dalies įgyvendinta v3.0.0
#### Nedideli patobulinimai - Kai kurie įvykdyti dabartiniame leidime
- ✅ **Papildomi pavyzdžiai**: DI orientuoti diegimo scenarijai (Įvykdyta)
- ✅ **Išplėsta DUK**: DI specifiniai klausimai ir trikčių šalinimas (Įvykdyta)
- **Įrankių integracija**: Patobulinti IDE ir redaktorių integracijos gidai
- ✅ **Stebėjimo plėtra**: DI specifiniai stebėjimo ir aliarmo modeliai (Įvykdyta)

#### Dar planuojama būsimam leidimui
- **Mobiliesiems pritaikyta dokumentacija**: Reaguojantis dizainas mobiliam mokymuisi
- **Prieiga be interneto**: Atsisiunčiamos dokumentacijos paketus
- **Patobulinta IDE integracija**: VS Code plėtinys AZD + DI darbo srautams
- **Bendruomenės skydelis**: Realaus laiko bendruomenės rodikliai ir įnašų sekimas

## Įnašai į pokyčių žurnalą

### Pokyčių ataskaita
Prisidedant prie šios saugyklos, įsitikinkite, kad pokyčių žurnale pateikti įrašai apie:

1. **Versijos numeris**: Vadovaujantis semantiniu versijų valdymu (major.minor.patch)
2. **Data**: Leidimo arba atnaujinimo data YYYY-MM-DD formatu
3. **Kategorija**: Pridėta, Pakeista, Nutraukta, Pašalinta, Ištaisyta, Saugumas
4. **Aiškus aprašymas**: Trumpas pakeitimų aprašymas
5. **Poveikio vertinimas**: Kaip pakeitimai paveiks esamus naudotojus

### Pokyčių kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai ar galimybės
- Nauji pavyzdžiai, šablonai ar mokymosi ištekliai
- Papildomi įrankiai, skriptai ar įrankių rinkiniai

#### Pakeista
- Dabartinės funkcionalumo ar dokumentacijos modifikacijos
- Atnaujinimai aiškumui ar tikslumui gerinti
- Turinio arba organizacijos pertvarkymas

#### Nutraukta
- Funkcijos ar metodai, kurie bus palaipsniui nutraukti
- Dokumentacijos skyriai, numatyti pašalinti
- Metodai, kuriems yra geresnės alternatyvos

#### Pašalinta
- Funkcijos, dokumentacija ar pavyzdžiai, kurie nebėra aktualūs
- Pasenusi informacija arba nutraukti metodai
- Dublikatai arba sujungtas turinys

#### Ištaisyta
- Dokumentacijos ar kodo klaidų ištaisymai
- Praneštų problemų arba gedimų sprendimas
- Tikslumo arba funkcionalumo patobulinimai


#### Saugumas
- Su saugumu susiję patobulinimai ar pataisymai
- Atnaujinimai, susiję su saugumo geriausiomis praktikomis
- Saugumo pažeidžiamumų šalinimas

### Semantinio versijavimo gairės

#### Didelė versija (X.0.0)
- Esminiai pokyčiai, reikalaujantys vartotojo veiksmų
- Ženklios turinio ar organizacijos pertvarkos
- Pokyčiai, keičiantys esminį požiūrį ar metodiką

#### Mažesnė versija (X.Y.0)
- Naujos funkcijos ar turinio papildymai
- Tobulinimai, palaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai ar ištekliai

#### Pataisos versija (X.Y.Z)
- Klaidų taisymai ir pataisymai
- Nedideli patobulinimai esamam turiniui
- Paaiškinimai ir nedideli patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Aktyviai skatiname bendruomenės atsiliepimus, siekdami tobulinti šį mokymosi išteklių:

### Kaip pateikti atsiliepimus
- **GitHub problemos**: Praneškite apie problemas arba siūlykite patobulinimus (galioja problemos, susijusios su DI)
- **Discord diskusijos**: Dalinkitės idėjomis ir bendraukite su Microsoft Foundry bendruomene
- **Pull Requests**: Tiesiogiai prisidėkite prie turinio patobulinimų, ypač DI šablonų ir vadovų
- **Microsoft Foundry Discord**: Dalyvaukite #Azure kanale, skirtame AZD + DI diskusijoms
- **Bendruomenės forumai**: Dalyvaukite platesnėse Azure kūrėjų diskusijose

### Atsiliepimų kategorijos
- **DI turinio tikslumas**: Pataisymai, susiję su DI paslaugų integracija ir diegimu
- **Mokymosi patirtis**: Pasiūlymai, kaip pagerinti DI kūrėjų mokymosi eigą
- **Trūkstamas DI turinys**: Prašymai dėl papildomų DI šablonų, modelių ar pavyzdžių
- **Prieinamumas**: Tobulinimai, skirti įvairiems mokymosi poreikiams
- **DI įrankių integracija**: Pasiūlymai geresnei DI kūrimo darbo eigai
- **Gamybiniai DI modeliai**: Enterprise DI diegimo modelių prašymai

### Atsakymo įsipareigojimas
- **Problemos atsakymas**: Per 48 valandas nuo problemos pranešimo
- **Funkcijų užklausos**: Įvertinimas per vieną savaitę
- **Bendruomenės indėliai**: Peržiūra per vieną savaitę
- **Saugumo problemos**: Nedelsiant su aukščiausiu prioritetu ir skubiu atsaku

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Mėnesio peržiūros**: Turinio tikslumas ir nuorodų tikrinimas
- **Ketvirčio atnaujinimai**: Pagrindiniai turinio papildymai ir patobulinimai
- **Pusmečio peržiūra**: Išsamios pertvarkos ir tobulinimai
- **Metiniai leidimai**: Dideli versijų atnaujinimai su svarbiais patobulinimais

### Stebėsena ir kokybės užtikrinimas
- **Automatinis testavimas**: Reguliarus kodo pavyzdžių ir nuorodų patikrinimas
- **Bendruomenės atsiliepimų integravimas**: Reguliarus vartotojų pasiūlymų įtraukimas
- **Technologijų atnaujinimai**: Derinimas su naujausiomis Azure paslaugomis ir azd leidimais
- **Prieinamumo auditas**: Reguliarus apžvalga, remiantis įtraukiančios dizaino principais

## Versijų palaikymo politika

### Dabartinių versijų palaikymas
- **Naujausia didelė versija**: Visas palaikymas su reguliarais atnaujinimais
- **Ankstesnė didelė versija**: Saugumo atnaujinimai ir kritiniai pataisymai 12 mėnesių
- **Senaus versijos**: Tik bendruomenės palaikymas, oficialių atnaujinimų nėra

### Migracijos gairės
Kai išleidžiamos didelės versijos, pateikiame:
- **Migracijos vadovus**: Žingsnis po žingsnio pereinamuosius nurodymus
- **Suderinamumo pastabas**: Informacija apie reikšmingus pokyčius
- **Įrankių palaikymą**: Skriptus arba įrankius, padedančius migracijoje
- **Bendruomenės palaikymą**: Skirtus forumus migracijos klausimams

---

**Navigacija**
- **Ankstesnė pamoka**: [Studijų vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinį README](README.md)

**Sekite naujienas**: Stebėkite šį saugyklą, kad gautumėte pranešimus apie naujus leidimus ir svarbius mokymosi medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
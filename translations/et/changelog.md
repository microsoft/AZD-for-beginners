# Muudatused - AZD Algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik olulised muudatused, uuendused ja täiustused AZD Algajatele hoidlas. Järgime semantilise versioonihalduse põhimõtteid ja hoiame seda logi, et aidata kasutajatel mõista, mis versioonide vahel on muutunud.

## Õpieesmärgid

Selle muudatuste logi läbi vaatamisel:
- Olete kursis uute funktsioonide ja sisu lisandustega
- Mõistate olemasoleva dokumentatsiooni parendusi
- Jälgite vigade parandusi ja täpsustusi, et tagada täpsus
- Järgite õppematerjalide arengut aja jooksul

## Õpitulemused

Pärast muudatuste logi kirjete läbivaatamist saate:
- Tuvastada uue sisu ja õppematerjalide kättesaadavuse
- Mõista, milliseid jaotisi on uuendatud või parendatud
- Planeerida oma õppeteekonda vastavalt kõige värskematele materjalidele
- Anda tagasisidet ja ettepanekuid tulevaste täiustuste jaoks

## Versioonide ajalugu

### [v3.22.0] - 2026-06-16

#### Algaja Tühiku Täitmine #2: Mallide koostamine, Arenduskonteinerid, Pulumi, Azure DevOps, Teenusepõhised volitused ja Rohkem
**See versioon sulgeb azd-coverage analüüsi abil tuvastatud ülejäänud kesktaseme lüngad: kuidas koostada ja avaldada oma mall, reprodutseeritavad arenduskonteineri/Codespaces keskkonnad, Pulumi infrastruktuuripakkuja, Azure DevOps CI/CD läbivaatus, teenusepõhise volituse autentimine, hosti valiku juhised (AKS/Spring Apps), `azd restore`/`azd package` selgitused, hook vigade käsitlemine ja meeskonna/jagatud keskkondade praktikad.**

#### Lisatud
- **🧱 Uus 4. peatüki õppetund** `docs/chapter-04-infrastructure/custom-templates.md` — oma azd malli koostamine: nõutud struktuur (`azure.yaml`, `infra/`, `src/`), `metadata.template` väli, infrastruktuuri parameetriseerimine `uniqueString()` ressursi tokeni ja `azd-env-name` sildiga, kohaliku testimise `azd init --template <local-path>` abil, avaldamine GitHubis ja esitamine Awesome AZD galeriisse
- **📦 Uus 1. peatüki õppetund** `docs/chapter-01-foundation/dev-containers.md` — reprodutseeritavad azd keskkonnad Dev Containers ja GitHub Codespaces abil: minimaalne `.devcontainer/devcontainer.json` ametliku `ghcr.io/azure/azure-dev/azd` funktsiooni kasutamisega, keeletäpsemad funktsioonid, `docker-in-docker` konteinerihostide jaoks ja `azd auth login --use-device-code` kaugallkirjastumiseks
- **🧩 Pulumi koos azd-ga** jaotis `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi kaustastruktuur, pinud seostatud azd keskkondadega, nõutavad väljundid/sildistamine ja identne `azd up` / `azd down` töövoog
- **🎯 Hostivaliku juhised** `docs/chapter-04-infrastructure/provisioning.md` — algajasõbralik võrdlus `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ja `springapp` vahel, koos juhistega, millal valida AKS või Azure Spring Apps
- **🛠️ Azure DevOps CI/CD läbilõige** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, teenuseühendus töökoormuse identiteedi föderatsiooniga (OIDC), genereeritud `azure-dev.yml` ja muutujagruppide seadistamine
- **🔑 Teenusepõhised volitused (Muster 4)** lisatud `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, mitteinteraktiivne `azd auth login` kliendisaladuse vs föderaalsete/OIDC volitustega, kasutamise juhised ja turvaline volituste säilitamine
- **🪝 Hook vigade käsitlemine** alajaotis `docs/chapter-04-infrastructure/deployment-guide.md` — väljapääsukoode ja `set -e`, `continueOnError`, hookide isolatsioonis testimine `azd hooks run` abil, operatsioonisüsteemispetsiifilised kestad ja `--debug`
- **👥 Meeskonna / jagatud keskkonnad** sektsioon `docs/chapter-03-configuration/configuration.md` — mis elab `.azure/` kaustas, mida ignoreerida gitis, iga arendaja jaoks keskkonnad, `azd env list`/`select` ja keskkonna väärtuste pakkumine CI/CD-s
- **🧰 `azd restore` ja laiendatud `azd package`** selgitused `resources/cheat-sheet.md` — sõltuvuste taastamine ja edastatava artefakti koostamine ilma juurutamiseta

#### Muudetud
- **🧭 4. peatüki õppetundide tabel** uuendatud, et lisada uus "Oma Malli Koostamine" õppetund (õppetund 3)
- **🧭 1. peatüki õppetundide tabel** uuendatud, et lisada uus "Arenduskonteinerid & Codespaces" õppetund (õppetund 5); navigeerimis jalused ühendatud `bring-your-own-app.md` ja `dev-containers.md` vahel

### [v3.21.0] - 2026-06-16

#### Algaja Tühiku Täitmine: Käed-külge Mitme Agendi Õppetund, "Too Oma Rakendus", Terraform ja CI/CD Läbivaatus
**See versioon sulgeb suurimad lüngad täieliku algaja juhendi jaoks, lisades kaks uut praktilist õppetundi (juurutatav mitme agendi läbivaatus ja azd lisamine olemasolevale rakendusele), algajasõbraliku hookide tutvustuse, Terraform koos azd-ga jaotise, samm-sammult GitHub Actions konveieri läbivaatuse, uute eelvaate laienduste seletuse ja selge juurutamise kinnitamise kontrollnimekirja.**

#### Lisatud
- **🤝 Uus 5. peatüki õppetund** `docs/chapter-05-multi-agent/multi-agent-basics.md` — täielikult praktiline, juurutatav kahe agendi läbivaatus (koordinaator + spetsialistid) reaalse malliga (`contoso-creative-writer`), käsitledes, millal kasutada mitme agendi lähenemist, `azd up` töövoog, juurutatud ressursside mõistmine, agenditevaheline jälgimine, kohandamine ja puhastamine
- **📦 Uus 1. peatüki õppetund** `docs/chapter-01-foundation/bring-your-own-app.md` — kuidas lisada azd olemasolevale projektile `azd init` abil („kasuta koodi praeguses kataloogis“), `azure.yaml` ja `infra/` mõistmine, `azd infra generate`, hosti tuvastamine ja juurutamine `azd up` abil
- **🌐 Terraform koos azd-ga** lisatud jaotis `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguratsioon, `.tf` kaustastruktuur, nõutavad `AZURE_*` väljundid ja `azd-env-name` sildistamine ning identne `azd up` / `azd down` töövoog (sulgeb augu, kus väideti Terraformi tuge, kuid näidati ainult Bicepit)
- **⚙️ Samm-sammult GitHub Actions läbivaatus** `docs/chapter-08-production/production-ai-practices.md` — GitHub hoidlast automatiseeritud juurutusteni: `azd pipeline config`, OIDC föderaalvolitused (salajased andmed mitte salvestatud), genereeritud `azure-dev.yml` ja saladuste vs muutujate juhised
- **🪝 Algaja "Uus hookide kasutaja?" tutvustus** `docs/chapter-04-infrastructure/deployment-guide.md` — mis on hook, hookide etappide tabel, minimaalne esimene hook ja hookide käsitsi käivitamine `azd hooks run` abil
- **✅ "Kontrolli oma juurutust" kontrollnimekiri** lisatud „Esimese projekti“ sammus 5 `docs/chapter-01-foundation/first-project.md` — suitsutest, tervise lõpp-punkti kontroll ja selged õnnestumise kriteeriumid
- **🧩 Uute eelvaate laienduste seletus** `azure.ai.skills` ja `azure.ai.connections` (mis need on ja millal neid kasutada) `docs/chapter-08-production/production-ai-practices.md`

#### Muudetud
- **🧭 5. peatüki õppetundide tabel** parandatud: `multi-agent-basics.md` on nüüd õppetund 1 (ainus täielikult praktiline õppetund), aus märgendus, et õppetund 2 on 6. peatükis ja jaekaubanduse stsenaarium on arhitektuuri plaan, mitte ühe käsu mall
- **🧭 1. peatüki õppetundide tabel** sisaldab nüüd uut "Too Oma Rakendus" õppetundi (õppetund 4)
- **🔗 Navigeerimis jalused** uuendatud: `first-project.md` lingib edasi `bring-your-own-app.md`-le

#### Parandatud
- **🧱 Suletud „väidetud, kuid puuduv“ Terraformi lünk** — kursusel viidati varem Terraformi toe olemasolule, kuid see polnud näidatud
- **🔀 Parandatud eksitavad 5. peatüki ristlingid**, mis viitasid täielikule mitme agendi rakendusele, kuid näitasid ainult arhitektuuri plaani

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

#### AZD 1.25.6 Värskendus, Täielik Agendi Elutsükli Käsud & Aspire Ümberbrändimine
**See versioon valideerib kursuse `azd` `1.25.6` (juuni 2026) ja `azure.ai.agents` `0.1.40-preview` laienduse vastu, laiendab tehisintellekti juhiseid "skafoldi agent" kaudu kogu agendi elutsükli (test → evalveerimine → optimeerimine → kontroll → kustutamine), toob esile uued eelvaate laiendused `azure.ai.skills` ja `azure.ai.connections` ning märgib ".NET Aspire" → "Aspire" toote ümberbrändi.**

#### Lisatud
- **🔁 Täielik agendi elutsükli katvus** algajatele ja tehisintellekti inseneridele kogu dokumentatsioonis:
  - `docs/chapter-01-foundation/azd-basics.md` — Elutsükli tabel (skafold → test → mõõtmine → parandamine → kontrollimine → puhastamine) lisatud Laienduste ja Tehisintellekti Käskude sektsiooni
  - `docs/chapter-08-production/production-ai-practices.md` — Uus "Agendi elutsükli haldamine" sektsioon, mis hõlmab `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
  - `resources/cheat-sheet.md` — Laiendatud tehisintellekti agendi käsud `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
- **🧩 Uued eelvaate laiendused** dokumenteeritud: `azure.ai.skills` (taaskasutatavad agendi oskused) ja `azure.ai.connections` (Foundry ühendused) lisatud laienduste tabelisse ja petulehele
- **⏱️ Vastuse ajastamise juhised** — `azd ai agent invoke` näited märgivad nüüd, et see kuvab kogulatenzi ja esimese tibu saabumise aja
- **📌 Versioonibänner** juurkataloogis README-s juhib õppijaid `azd version` ja `azd upgrade` suunas

#### Muudetud
- **✅ Valideerimise lähtejoon uuendatud** `azd 1.23.12` (märts 2026) pealt `azd 1.25.6` (juuni 2026) peale kõigi peatükkide README-des ja töötubade dokumentides
- **🤖 2. peatüki laienduste märkus** uuendatud `azure.ai.agents` `0.1.18-preview` pealt `0.1.40-preview`
- **🧪 Töötoa valideerimise näide** (`azd version` väljund) uuendatud versioonile `1.25.6`
- **🧭 README "Mis uut täna azd-s?"** uuendatud rõhutamaks lõpp-lõpuni agendi elutsüklit, uusi tehisintellekti laiendusi ja hiljutisi kasutusmugavuse parandusi (`azd init` idempotentsus, `azd auth login` aegunud tokeni tühjendamine, `azd tool` esimene käivituse prompt)
- **📖 2. peatükk agents.md (valik 4)** juhib nüüd õppijaid pärast juurutamist elutsükli käskude juurde, mitte ainult `azd up` juurde

#### Parandatud
- **🏷️ Toote nimetuse märkus** — lisatud Aspire ümberbrändi märkus (".NET Aspire" on nüüd lihtsalt "Aspire"); azd Aspire tugi on muutumatu
- **🔎 Reaalajas väljalaske valideerimine** kinnitatud Azure Developer CLI vabastuste voo vastu: stabiilne CLI `1.25.6` (2026-06-12) ja `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
#### Algaja sissejuhatuse täpsustus, seadistuse valideerimine ja lõplik AZD käsu puhastus
**See versioon jätkab AZD 1.23 valideerimiskorra järel algajatele mõeldud dokumentatsiooni läbivaatust: see selgitab AZD esmase autentimise juhiseid, lisab kohalikud seadistuse valideerimise skriptid, kontrollib võtmekäske otse AZD CLI-ga ning eemaldab viimased aegunud ingliskeelsed käsurea viited changelogist väljaspool.**

#### Lisatud
- **🧪 Algajate seadistuse valideerimise skriptid** `validate-setup.ps1` ja `validate-setup.sh`, et õppijad saaksid enne 1. peatükki alustamist kinnitada vajalike tööriistade olemasolu
- **✅ Võtmesammud seadistuse valideerimiseks** juurkataloogi README-s ja 1. peatüki README-s, et puuduvad eeltingimused avastataks enne `azd up` käivitamist

#### Muudetud
- **🔐 Algajate autentimise juhised** käsitlevad nüüd järjepidevalt `azd auth login` esmane meetodina AZD töövoogudes, kusjuures `az login` on märgitud valikulise variandina, kui kasutatakse otse Azure CLI käske
- **📚 1. peatüki sissejuhatuse voog** juhendab õppijaid kinnitama oma kohalikku seadistust enne installatsiooni, autentimist ja esimest juurutamist
- **🛠️ Valideerijate teated** eristavad nüüd selgelt tõkestavad nõuded valikulistest Azure CLI hoiatused AZD-põhisele algajate teele
- **📖 Konfiguratsiooni, tõrkeotsingu ja näited** eristavad nüüd nõutud AZD autentimist valikulisest Azure CLI sisselogimisest, kus varem mõlemad olid esitatud kontekstita

#### Parandatud
- **📋 Järelejäänud ingliskeelsed käskude viited** uuendatud vastava käesoleva AZD vormi järgi, sealhulgas `azd config show` petutabelis ja `azd monitor --overview` kohtades, kus oli mõeldud Azure Portal ülevaadet
- **🧭 Algajate väited 1. peatükis** leebemad, et vältida garantii lubamist nullvea- või tagasikerimise käitumise kohta kõigis mallides ja Azure ressurssides
- **🔎 Otse CLI valideerimine** kinnitas praeguse toe käskudele `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ja `azd down --force --purge`

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

#### AZD 1.23.12 valideerimine, töötuba keskkonna laiendus ja AI mudeli värskendus
**See versioon teostab dokumentatsiooni valideerimise läbivaatuse `azd` versioonile `1.23.12`, uuendab aegunud AZD käsu näiteid, värskendab AI mudelijuhiseid praegustele vaikeseadetele ning laiendab töötuba juhiseid GitHub Codespacest ka arenduskonteineritele ja kohalikele kloonidele.**

#### Lisatud
- **✅ Valideerimise märkused põhiosades ja töötuba dokumentatsioonis** selgitamaks testitud AZD baastaset õppijatele, kes kasutavad uuemaid või vanemaid CLI versioone
- **⏱️ Juurutamise ajapiirangu juhised** pika jooksuga AI rakenduste juurutuse jaoks `azd deploy --timeout 1800`
- **🔎 Laienduse kontrollimise sammud** koos `azd extension show azure.ai.agents` AI töövoo dokumentatsioonis
- **🌐 Laiemad töötuba keskkonna juhised** hõlmates GitHub Codespaces, arenduskonteinereid ja kohalikke kloone MkDocsiga

#### Muudetud
- **📚 Peatükkide sissejuhatuse README-d** märgivad nüüd järjepidevalt valideerimist `azd 1.23.12` vastu kogu alus-, konfiguratsiooni-, infrastruktuuri-, multi-agent-, eeljuurutuse-, tõrkeotsingu- ja tootmislõikudes
- **🛠️ AZD käsuviited** uuendatud praegustele vormidele dokumentides:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` või `azd env get-value(s)`, olenevalt kontekstist
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kohtades, kus mõeldud Application Insights ülevaade
- **🧪 Provision preview näited** lihtsustatud praegusele toetatud kasutusele nt `azd provision --preview` ja `azd provision --preview -e production`
- **🧭 Töötuba voog** värskendatud nii, et õppijad saavad tööjaamu teha Codespacesis, arenduskonteineris või kohalikus kloonis, mitte eeldada ainult Codespacesist käitamist
- **🔐 Autentimise juhised** eelistavad nüüd `azd auth login` AZD töövoogude puhul, `az login` on märkuses valikulise variandina, kui kasutatakse otse Azure CLI käske

#### Parandatud
- **🪟 Windowsi installikäsud** ühtlustatud praeguse `winget` pakettide nimede kirjadega installijuhendis
- **🐧 Linuxi installimise juhis** parandatud, et vältida toetamata distrospetsiifilisi `azd` paketihalduri juhiseid ja juhendada pigem tegemist vabastuse artefaktidega, kus asjakohane
- **📦 AI mudeli näited** värskendatud vanematest vaikimisi mudelitest nagu `gpt-35-turbo` ja `text-embedding-ada-002` uuematele näiteks `gpt-4.1-mini`, `gpt-4.1` ja `text-embedding-3-large`
- **📋 Juurutuse ja diagnostika koodilõigud** parandatud kasutama praeguseid keskkonna- ja olekukäske logides, skriptides ja tõrkeotsingu sammudes
- **⚙️ GitHub Actions juhised** uuendatud `Azure/setup-azd@v1.0.0` asemel `Azure/setup-azd@v2`
- **🤖 MCP/Copilot nõusoleku juhised** uuendatud `azd mcp consent` asemel `azd copilot consent list`

#### Täiustatud
- **🧠 AI peatüki juhised** selgitavad nüüd paremini eelvaatele tundlikku `azd ai` käitumist, rentniku spetsiifilist sisselogimist, praegust laienduste kasutust ja mudelite juurutamise soovitusi
- **🧪 Töötuba juhised** kasutavad nüüd realistlikumaid versiooninäiteid ja selgemat keskkonna seadistuse keelt praktiliste laborite jaoks
- **📈 Tootmise ja tõrkeotsingu dokumendid** ühtlustatud paremini praeguse jälgimise, varumudeli ja kulutasandi näidetega

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

#### AZD AI CLI käsud, sisu valideerimine ja mallide laiendus
**See versioon lisab käsukatte `azd ai`, `azd extension` ja `azd mcp` kõikidesse AI-ga seotud peatükkidesse, parandab katkised lingid ja aegunud koodi faili agents.md, uuendab petutabelit ning uuendab Näidismallide sektsiooni valideeritud kirjelduste ja uute Azure AI AZD mallidega.**

#### Lisatud
- **🤖 AZD AI CLI tugi** 7 failis (varasemalt ainult 8. peatükis):
  - `docs/chapter-01-foundation/azd-basics.md` — Uus "Laiendused ja AI käsud" sektsioon, mis tutvustab `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Valik 4: `azd ai agent init` ja võrdlustabel (malli vs manifesti lähenemine)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD laiendused Foundry jaoks" ja "Agent Esmane Juurutus" alajaotised
  - `docs/chapter-05-multi-agent/README.md` — Kiire algus näitab nii malli- kui manifestipõhiseid juurutusviise
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Juurutuse sektsioon sisaldab nüüd `azd ai agent init` valikut
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI laienduse käsud diagnostika jaoks" alajaotis
  - `resources/cheat-sheet.md` — Uus "AI ja laienduste käsud" sektsioon koos `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`

- **📦 Uued AZD AI näidismallid** failis `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG vestlus Blazor WebAssembly, Semantic Kernel ja häälvestluse toe abil
  - **azure-search-openai-demo-java** — Java RAG vestlus kasutades Langchain4J koos ACA/AKS juurutuse variantidega
  - **contoso-creative-writer** — Multi-agent loominguline kirjutamisrakendus Azure AI Agent Service, Bing Grounding ja Prompty abil
  - **serverless-chat-langchainjs** — Serverita RAG kasutades Azure Functions + LangChain.js + Cosmos DB + Ollama kohalik arendus tugi
  - **chat-with-your-data-solution-accelerator** — Ettevõtte RAG kiirendaja admin portaaliga, Teamsi integratsioon ja PostgreSQL/Cosmos DB valikud
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreerimise näidetrakendus serveritega .NET, Python, Java ja TypeScript keeles
  - **azd-ai-starter** — Minimalistlik Azure AI infrastruktuuri Bicep algusmall
  - **🔗 Awesome AZD AI Gallery link** — Viide aadressil [awesome-azd AI galerii](https://azure.github.io/awesome-azd/?tags=ai) (üle 80 malli)

#### Parandatud
- **🔗 agents.md navigatsioon**: Eelnevad/järgmised lingid nüüd vastavuses 2. peatüki README õppeteekonnaga (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md katkised lingid**: `production-ai-practices.md` parandatud `../chapter-08-production/production-ai-practices.md` (3 esinemist)
- **📦 agents.md aegunud kood**: Asendatud `opencensus` pakett `azure-monitor-opentelemetry` ja OpenTelemetry SDK-ga
- **🐛 agents.md mittetoimiv API**: `max_tokens` nihutatud funktsioonist `create_agent()` sinna `create_run()` parameetrina `max_completion_tokens`
- **🔢 agents.md tokenite lugemine**: Asendatud umbkaudsete `len//4` arvutusega, kasutades `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Parandas teenused "Cognitive Search + App Service" asemel "Azure AI Search + Azure Container Apps" (vaikehost muutus okt 2024)
- **contoso-chat**: Uuendatud kirjeldus viitama Azure AI Foundry + Prompty-le, vastavalt repole tiitel ja tehnoloogiakogum

#### Eemaldatud
- **ai-document-processing**: Eemaldatud mittefunktsioneeriv malli viide (repo pole avalikult AZD mallina kättesaadav)

#### Parandatud
- **📝 agents.md harjutused**: Harjutus 1 näitab nüüd eeldatavat väljundit ja `azd monitor` sammu; Harjutus 2 sisaldab täielikku `FunctionTool` registreerimise koodi; Harjutus 3 asendab ebaselge juhendamise konkreetsete `prepdocs.py` käskudega
- **📚 agents.md ressursid**: Uuendatud dokumendiviited praegustele Azure AI Agent Service dokumentidele ja kiirele alustamise juhendile
- **📋 agents.md järgmiste sammude tabel**: Lisatud AI töötoa labori link täielikuks peatüki katvuseks

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
#### Kursuse navigeerimise täiustamine
**See versioon parandab README.md peatükkide navigeerimist täiustatud tabeliformaadis.**

#### Muudatused
- **Kursuse kaardi tabel**: Täiustatud otseõppetundide linkide, kestuse hinnangute ja keerukuse hinnetega
- **Kausta puhastus**: Eemaldatud vanad liigsed kaustad (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkide valideerimine**: Kõik 21+ sisemist linki Kursuse kaardi tabelis kontrollitud

### [v3.16.0] - 2026-02-05

#### Tootenime uuendused
**See versioon uuendab toodete viiteid vastavalt Microsofti praegusele brändingule.**

#### Muudatused
- **Microsoft Foundry → Microsoft Foundry**: Kõik viited uuendatud mitte-tõlgitavates failides
- **Azure AI Agent Service → Foundry Agents**: Teenuse nimi uuendatud vastavalt praegusele brändingule

#### Uuendatud failid
- `README.md` - Peamine kursuse avalehte
- `changelog.md` - Versiooniajalugu
- `course-outline.md` - Kursuse struktuur
- `docs/chapter-02-ai-development/agents.md` - AI agentide juhend
- `examples/README.md` - Näidisdokumentatsioon
- `workshop/README.md` - Töötuba avalehte
- `workshop/docs/index.md` - Töötuba indeks
- `workshop/docs/instructions/*.md` - Kõik töötubade juhendifailid

---

### [v3.15.0] - 2026-02-05

#### Põhjalik hoidla ümberkorraldus: peatükkidepõhised kaustanimed
**See versioon struktureerib dokumentatsiooni eraldi peatükkide kaustadesse parema navigeeritavuse jaoks.**

#### Kaustade ümbernimetamine
Vanad kaustad asendati peatükkide numbritega kaustadega:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisatud uus: `docs/chapter-05-multi-agent/`

#### Failide migratsioonid
| Fail | Algus | Sihtkoht |
|------|-------|----------|
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
- **📚 Peatüki README failid**: Igas peatüki kaustas loodud README.md koos:
  - Õpieesmärkide ja kestusega
  - Õppetundide tabel koos kirjeldustega
  - Kiirstart käskude nimekiri
  - Navigeerimine teiste peatükkide juurde

#### Muudatused
- **🔗 Kõik sisemised lingid uuendatud**: 78+ teekonda uuendatud kõigis dokumentatsiooni failides
- **🗺️ Peamine README.md**: Kursuse kaart uuendatud uue peatükkide struktuuriga
- **📝 examples/README.md**: Uuendatud ristviited peatükkide kaustadele

#### Eemaldatud
- Vana kaustastruktuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Hoidla ümberkorraldus: peatükkide navigeerimine
**See versioon lisas peatükkide navigeerimise README failid (asendatud versiooniga v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uus AI agentide juhend
**See versioon lisab põhjaliku juhendi AI agentide juurutamiseks Azure Developer CLI-ga.**

#### Lisatud
- **🤖 docs/microsoft-foundry/agents.md**: Täielik juhend:
  - Mis on AI agendid ja kuidas nad erinevad chatbotidest
  - Kolm kiirstart agentide malli (Foundry Agents, Prompty, RAG)
  - Agendi arhitektuuri mustrid (ühene agent, RAG, mult-agent)
  - Tööriistade seadistus ja kohandamine
  - Jälgimine ja mõõdikute kogumine
  - Kuluaspektid ja optimeerimine
  - Levinud tõrkeotsingu stsenaariumid
  - Kolm praktilist harjutust koos õnnestumise kriteeriumitega

#### Sisu struktuur
- **Sissejuhatus**: Agenti kontseptsioonid algajatele
- **Kiirstart**: Agentide juurutamine käsuga `azd init --template get-started-with-ai-agents`
- **Arhitektuurimustrid**: Visuaalsed diagrammid agentide mustritest
- **Seadistus**: Tööriistade ülesseadmine ja keskkonnamuutujad
- **Jälgimine**: Application Insights integratsioon
- **Harjutused**: Astmeline praktiline õppimine (20–45 minutit igaüks)

---

### [v3.12.0] - 2026-02-05

#### DevContainer keskkonna uuendus
**See versioon uuendab arenduskonteineri konfiguratsiooni kaasaegsete tööriistade ja paremate vaikeväärtustega AZD õppimiskogemuse parandamiseks.**

#### Muudatused
- **🐳 Baaspilt**: Uuendatud `python:3.12-bullseye` → `python:3.12-bookworm` (uusim Debian stabiilne)
- **📛 Konteineri nimi**: Muudetud "Python 3" → "AZD for Beginners" selguse huvides

#### Lisatud
- **🔧 Uued Dev Container funktsioonid**:
  - `azure-cli` koos Bicep toe lubamisega
  - `node:20` (AZD mallide LTS versioon)
  - `github-cli` mallide haldamiseks
  - `docker-in-docker` konteinerirakenduste juurutamiseks

- **🔌 Pordiedastus**: Eelseadistatud pordid levinud arenduseks:
  - 8000 (MkDocs eelvaade)
  - 3000 (Veebiäpid)
  - 5000 (Python Flask)
  - 8080 (API-d)

- **🧩 Uued VS Code laiendused**:
  - `ms-python.vscode-pylance` - täiustatud Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure funktsioonide tugi
  - `ms-azuretools.vscode-docker` - Docker tugi
  - `ms-azuretools.vscode-bicep` - Bicep keele tugi
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursihaldus
  - `yzhang.markdown-all-in-one` - Markdown redigeerimine
  - `DavidAnson.vscode-markdownlint` - Markdown stiilijärelevalve
  - `bierner.markdown-mermaid` - Mermaid diagrammide tugi
  - `redhat.vscode-yaml` - YAML tugi (azure.yaml jaoks)
  - `eamodio.gitlens` - Git visualiseerimine
  - `mhutchie.git-graph` - Git ajaloo visualiseerimine

- **⚙️ VS Code seaded**: Lisa vaikeseaded Python tõlgile, salvestamisel vormindamisele ja tühikute eemaldamisele

- **📦 Uuendatud requirements-dev.txt**:
  - Lisatud MkDocs minify plugin
  - Lisatud pre-commit koodi kvaliteedi tagamiseks
  - Lisatud Azure SDK paketid (azure-identity, azure-mgmt-resource)

#### Parandus
- **Post-Create käsk**: Kontrollib nüüd AZD ja Azure CLI paigaldust konteineri käivitamisel

---

### [v3.11.0] - 2026-02-05

#### Algajatele sobiv README ümberkujundus
**See versioon parandab README.md oluliselt algajatele arusaadavamaks ja lisab olulised ressursid AI arendajatele.**

#### Lisatud
- **🆚 Azure CLI vs AZD võrdlus**: Selge selgitus, millal mõlemat tööriista kasutada, praktiliste näidetega
- **🌟 Awesome AZD lingid**: Otselink kogukonna mallide galeriisse ja panustamise ressurssidesse:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ kasutusvalmis mallid
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kogukonna panustamine
- **🎯 Kiire algus juhend**: Lihtsustatud 3-astmeline alustamine (Installeeri → Logi sisse → Juuruta)
- **📊 Kogemustele põhinev navigeerimistabel**: Selged juhised, kust alustada vastavalt kogemustele

#### Muudatused
- **README struktuur**: Ümberkorraldatud progressiivseks info avalikustamiseks – esmalt võtmeinfo
- **Sissejuhatus**: Kirjutatud ümber, et selgitada "Azdi up võlu" täiesti algajatele
- **Kahesuse eemaldamine**: Dubleeritud tõrkeotsingu sektsioon eemaldatud
- **Tõrkeotsingu käsud**: Parandatud `azd logs` viited kehtivaks `azd monitor --logs` kasutamiseks

#### Parandused
- **🔐 Autentimise käsud**: Lisatud `azd auth login` ja `azd auth logout` cheat-sheet.md-sse
- **Vigased käsureaviited**: Eemaldatud ülejäänud `azd logs` README tõrkeotsingu sektsioonist

#### Märkused
- **Ulatus**: Muudatused peamiselt README.md ja resources/cheat-sheet.md
- **Sihtgrupp**: Eelkõige AZD vähemtundvatele arendajatele

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI käskude täpsustuse uuendus
**See versioon parandab dokumentatsioonis eksisteerimata AZD käsud, tagades kõigi näidete kasutamise kehtiva Azure Developer CLI süntaksiga.**

#### Parandused
- **🔧 Eksisteerimata AZD käsud eemaldatud**: Põhjalik audit ja vigade parandused:
  - `azd logs` (ei eksisteeri) → asendatud `azd monitor --logs` või Azure CLI vastetega
  - `azd service` alamkäsud (ei eksisteeri) → asendatud `azd show` ja Azure CLI-ga
  - `azd infra import/export/validate` (ei eksisteeri) → eemaldatud või asendatud kehtivatega
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` lipud (ei eksisteeri) → eemaldatud
  - `azd provision --what-if/--rollback` lipud (ei eksisteeri) → uuendatud kasutama `--preview`
  - `azd config validate` (ei eksisteeri) → asendatud `azd config list` käsuga
  - `azd info`, `azd history`, `azd metrics` (ei eksisteeri) → eemaldatud

- **📚 Parandatud failid käsuviidete osas**:
  - `resources/cheat-sheet.md`: Käskude ref ühe suur uuendus
  - `docs/deployment/deployment-guide.md`: Parandatud rollback ja juurutamise strateegiad
  - `docs/troubleshooting/debugging.md`: Parandatud logi analüüsi sektsioonid
  - `docs/troubleshooting/common-issues.md`: Uuendatud tõrkeotsingu käske
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud AZD silumise osa
  - `docs/getting-started/azd-basics.md`: Parandatud jälgimise käsud
  - `docs/getting-started/first-project.md`: Uuendatud jälgimise ja silumise näited
  - `docs/getting-started/installation.md`: Parandatud abi ja versiooni näited
  - `docs/pre-deployment/application-insights.md`: Parandatud logivaatamise käsud
  - `docs/pre-deployment/coordination-patterns.md`: Parandatud agendi silumise käsud

- **📝 Versiooni viide uuendatud**:
  - `docs/getting-started/installation.md`: Asendatud kõva kodeeritud `1.5.0` versioon üldiseks `1.x.x` koos linkidega väljaannetele

#### Muudatused
- **Rollback strateegiad**: Dokumentatsioon uuendatud kasutama Git-põhist rollbacki (AZD-l pole natiivset rollbacki)
- **Logide vaatamine**: Asendatud `azd logs` viited `azd monitor --logs`, `azd monitor --live` ja Azure CLI käskudega
- **Tulemuste osas**: Eemaldatud mitteolemasolevad paralleelsed/incremental deploy lipud, antud kehtivad alternatiivid

#### Tehnilised detailid
- **Kehtivad AZD käsud**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kehtivad azd monitor lipud**: `--live`, `--logs`, `--overview`
- **Eemaldatud funktsioonid**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Märkused
- **Kontroll**: Käskude kehtivus kontrollitud Azure Developer CLI v1.23.x vastu

---

### [v3.9.0] - 2026-02-05

#### Töötuba lõpetatud ja dokumentatsiooni kvaliteedi uuendus
**See versioon lõpetab interaktiivsed töötubade moodulid, parandab kõik katkenud dokumendilingid ning tõstab sisu kvaliteeti AI arendajatele Microsoft AZD kasutajatele.**

#### Lisatud
- **📝 CONTRIBUTING.md**: Uus panustamise juhend dokumendiga, mis sisaldab:
  - Selged juhised vigade raportimiseks ja muutuste ettepanekuks
  - Dokumentatsiooni standardid uuele sisule
  - Koodinäidete juhised ja commit-sõnumite konventsioonid
  - Ühiskonna kaasamise info

#### Lõpetatud
- **🎯 Töötuba Moodul 7 (Kokkuvõte)**: Täielikult lõpetatud kokkuvõtte moodul koos:
  - Ülevaatlik kokkuvõte töötoa saavutustest
  - Peamiste õpitulemuste sektsioon hõlmates AZD-d, malle ja Microsoft Foundryt
  - Soovitused õppeprotsessi jätkamiseks
  - Töötuba väljakutsete harjutused raskusastme hindamisega
  - Kogukonna tagasiside ja tugilingid

- **📚 Töötuba Moodul 3 (Lammutamine)**: Ajendatud õpieesmärgid koos:
  - GitHub Copilot MCP serverite aktiveerimise juhistega
  - AZD malli kaustastruktuuri mõistmine
  - Infrastruktuur-koodina (Bicep) organiseerimismustrid
  - Praktiliste labori juhistega

- **🔧 Töötuba Moodul 6 (Lammutamine)**: Lõpetatud koos:
  - Ressursside puhastamise ja kulude haldamise eesmärkidega
  - `azd down` kasutamine ohutuks infrastruktuuri likvideerimiseks
  - Pehme kustutatud kognitiivsete teenuste taastamise juhised
  - Boonusülesanded GitHub Copilot'i ja Azure Portaali uurimiseks

#### Parandatud
- **🔗 Katkised lingid parandused**: Lahendatud 15+ katkist sisemist dokumentatsiooni linki:
  - `docs/ai-foundry/ai-model-deployment.md`: Parandatud tee microsoft-foundry-integration.md-le
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud ai-model-deployment.md ja production-ai-practices.md teed
  - `docs/getting-started/first-project.md`: Asendatud mitteolemasolev cicd-integration.md deploy-guide.md-iga
  - `examples/retail-scenario.md`: Parandatud KKK ja tõrkeotsingu juhendite teed
  - `examples/container-app/microservices/README.md`: Parandatud kursuse kodu ja deploy-guide teed
  - `resources/faq.md` ja `resources/glossary.md`: Uuendatud AI peatükkide viited
  - `course-outline.md`: Parandatud juhendaja juhendi ja AI töötoa laboris viited

- **📅 Töötoa oleku bänner**: Uuendatud "Arendamisel" olekult aktiivseks töötoa olekuks kuupäevaga veebruar 2026

- **🔗 Töötoa navigeerimine**: Parandatud katkised navigeerimislingid töötoa README.md-s, mis osutasid mitteolemasolevale lab-1-azd-basics kaustale

#### Muudetud
- **Töötoa esitlus**: Eemaldatud "arendamisel" hoiatus, töötuba on nüüd täielik ja kasutamiseks valmis
- **Navigeerimise järjepidevus**: Tagatud, et kõigil töötoa moodulitel on korrektsed moodulitevahelised navigeerimisviited
- **Õppeteekide viited**: Uuendatud peatükkide ristviited kasutama õigeid microsoft-foundry teid

#### Kinnitatud
- ✅ Kõik inglise keeles markdown-failid sisaldavad kehtivaid siselinke
- ✅ Töötoa moodulid 0-7 on täielikult lõpetatud koos õpieesmärkidega
- ✅ Peatükkide ja moodulite vaheline navigeerimine toimib korrektselt
- ✅ Sisu sobib AI arendajatele, kes kasutavad Microsoft AZD-d
- ✅ Alustajale sõbralik keel ja struktuur on säilinud kogu materjalis
- ✅ CONTRIBUTING.md annab selged juhised kogukonna panustajatele

#### Tehniline teostus
- **Linkide valideerimine**: Automaatne PowerShell skript kontrollis kõiki .md siselinke
- **Sisu auditeerimine**: Käsitsi ülevaade töötoa täielikkuse ja algajatele sobivuse kohta
- **Navigeerimissüsteem**: Järjepidevad peatüki ja mooduli navigeerimise mustrid rakendatud

#### Märkused
- **Ulatus**: Muudatused kehtivad ainult ingliskeelsele dokumentatsioonile
- **Tõlked**: Tõlkekaustad ei ole selles versioonis uuendatud (automatiseeritud tõlge sünkroonitakse hiljem)
- **Töötoa kestus**: Töötuba pakub nüüd 3-4 tundi praktilist õppetööd

---

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: Jälgimine, turvalisus ja mitme agendi mustrid
**See versioon lisab põhjalikud A-taseme tunnid Application Insightsi integratsiooni, autentimis mustrite ja mitme agendi koordineerimise kohta tootmiskeskkondadele.**

#### Lisatud
- **📊 Application Insightsi integratsiooni õppetund**: failis `docs/pre-deployment/application-insights.md`:
  - AZD-keskne juurutamine koos automaatse proovisoonimisega
  - Täielikud Bicep mallid Application Insightsile + Log Analyticsile
  - Töötavad Python rakendused kohandatud telemeetria ja laiendustega (1200+ rida)
  - AI/LLM jälgimismustrid (Microsoft Foundry mudelite token/kulu jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetria voog)
  - 3 praktilist harjutust (hoiatused, armatuurlaud, AI jälgimine)
  - Kusto päringute näited ja kulutõhususe strateegiad
  - Otseülekande metrilised andmed ja reaalajas silumine
  - Õppetöö kestvus 40-50 minutit, tootmiskõlblikud mustrid

- **🔐 Autentimise ja turvalisuse mustrite õppetund**: failis `docs/getting-started/authsecurity.md`:
  - 3 autentimismudelit (ühendusstringid, Key Vault, hallatav identiteet)
  - Täielikud Bicep infrastruktuuri mallid turvalisteks juurutusteks
  - Node.js rakenduse kood Azure SDK integratsiooniga
  - 3 täielikku harjutust (hallitava identiteedi lubamine, kasutajapõhine identiteet, Key Vaulti rotatsioon)
  - Turvalisuse parimad meetodid ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kuluanalüüs
  - Tootmiskõlblikud paroolita autentimismustrid

- **🤖 Mitme agendi koordineerimismustrite õppetund**: failis `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineerimismustrit (järjestikune, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik korraldaja teenuse teostus (Python/Flask, 1500+ rida)
  - 3 spetsialiseeritud agendi teostust (Uurija, Kirjutaja, Toimetaja)
  - Teenuse buss integratsioon sõnumijärjekorra jaoks
  - Cosmos DB olekute haldamine hajutatud süsteemidele
  - 6 Mermaid diagrammi agendi interaktsioonide kohta
  - 3 edasijõudnud harjutust (aegumishaldus, korduskatsed, vooluringi katkuja)
  - Kulude jaotus (240-565 USD/kuus) optimeerimisstrateegiatega
  - Application Insights integratsioon jälgimiseks

#### Täiustatud
- **Pre-juurutamise peatükk**: Nüüd sisaldab põhjalikku jälgimist ja koordineerimismustreid
- **Alustamise peatükk**: Täiendatud professionaalsete autentimismustritega
- **Tootmiskorras valmisolek**: Täielik ulatus turvalisusest jälgitavuseni
- **Kursuse plaan**: Uuendatud viited uutele õppetundidele peatükkides 3 ja 6

#### Muudetud
- **Õppimise järjekord**: Turvalisuse ja jälgimise parem integreerimine kogu kursusel
- **Dokumentatsiooni kvaliteet**: Järjepidevad A-taseme standardid (95-97%) uutes õppetundides
- **Tootmis mustrid**: Täielik algusest lõpuni ulatus ettevõtete juurutuste jaoks

#### Paranenud
- **Arendajakogemus**: Selge tee arendamisest tootmisjälgimiseni
- **Turvastandardid**: Professionaalsed autentimise ja saladuste halduse mustrid
- **Jälgitavus**: Täielik Application Insights integreerimine AZD-ga
- **AI töökoormused**: Spetsialiseeritud jälgimine Microsoft Foundry mudelitele ja mitme agendi süsteemidele

#### Kinnitatud
- ✅ Kõik õppetunnid sisaldavad täielikku töötavat koodi (mitte ainult koodilõike)
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19 kolme õppetunni jooksul)
- ✅ Praktilised harjutused koos kontrollsammudega (kokku 9)
- ✅ Tootmiskõlblikud Bicep mallid juurutamiseks `azd up`-ga
- ✅ Kuluanalüüs ja optimeerimise strateegiad
- ✅ Tõrkeotsingu juhendid ja parimad tavad
- ✅ Teadmiste kontrollpunktid koos kontrollkäskudega

#### Dokumentatsiooni hindamise tulemused
- **docs/pre-deployment/application-insights.md**: - Põhjalik jälgimisjuhend
- **docs/getting-started/authsecurity.md**: - Professionaalsed turvamustrid
- **docs/pre-deployment/coordination-patterns.md**: - Täiustatud mitme agendi arhitektuurid
- **Üldine uus sisu**: - Järjepidevad kõrgekvaliteedilised standardid

#### Tehniline teostus
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine
- **Autentimine**: Hallatav identiteet + Key Vault + RBAC mustrid
- **Mitme agenti süsteem**: Teenuse buss + Cosmos DB + Container Apps + orkestreerimine
- **Jälgimine**: Otseülekanded + Kusto päringud + hoiatused + armatuurlauad
- **Kuluhaldus**: Valimismustrid, säilituspoliitikad, eelarvekontroll

### [v3.7.0] - 2025-11-19

#### Dokumentatsiooni kvaliteedi parandused ja uus Microsoft Foundry mudelite näide
**See versioon parandab dokumentatsiooni kvaliteeti hoidlates ja lisab täieliku Microsoft Foundry mudelite juurutuse näite koos gpt-4.1 vestluskeskkonnaga.**

#### Lisatud
- **🤖 Microsoft Foundry mudelite vestluse näide**: Täielik gpt-4.1 juurutus koos töötava rakendusega kaustas `examples/azure-openai-chat/`:
  - Täielik Microsoft Foundry mudelite infrastruktuur (gpt-4.1 mudeli juurutus)
  - Python käsurea vestluse liides koos vestluse ajaloo haldusega
  - Key Vault integreerimine turvaliseks API võtmete hoidmiseks
  - Tokeni kasutuse jälgimine ja kulu hinnang
  - Taotlemise piirangud ja veahaldus
  - Ulatuslik README koos 35-45 minuti juurutusjuhisega
  - 11 tootmiskõlblikku faili (Bicep mallid, Python rakendus, konfiguratsioon)
- **📚 Dokumentatsiooniharjutused**: Lisatud praktilised harjutused konfiguratsioonijuhendisse:
  - Harjutus 1: Mitmekeskkondade konfiguratsioon (15 minutit)
  - Harjutus 2: Saladuste haldamise harjutus (10 minutit)
  - Selged edukriteeriumid ja kontrollsammud
- **✅ Juurutuse kontroll**: Lisatud kontrollosa juurutusjuhendisse:
  - Oleku kontrollimise protseduurid
  - Edukriteeriumite nimekiri
  - Oodatavad väljundid kõigile juurutuskäskudele
  - Kiire tõrkeotsingu viited

#### Täiustatud
- **examples/README.md**: Uuendatud A-taseme kvaliteedile (93%):
  - Lisatud azure-openai-chat kõikidesse asjakohastesse jaotistesse
  - Uuendatud kohalik näidete arv 3-lt 4-le
  - Lisatud AI rakenduste näidete tabelisse
  - Integreeritud Kesktasemele suunatud Kiiralgusse
  - Lisatud Microsoft Foundry mallide sektsiooni
  - Uuendatud võrdlustabelid ja tehnoloogia leidmise sektsioonid
- **Dokumentatsiooni kvaliteet**: Parandatud B+ (87%) → A- (92%) kogu docs kaustas:
  - Lisatud oodatavad väljundid kriitilistele käsule
  - Lisatud kontrollsammud konfiguratsiooni muutmisele
  - Paranenud praktiline õpe reaalsemate ülesannetega

#### Muudetud
- **Õppimise järjekord**: Parem AI näidete integreerimine kesktaseme õppijatele
- **Dokumentatsiooni struktuur**: Rohkem tegutsemisele suunatud harjutusi selgete tulemustega
- **Kvaliteedikontroll**: Selged edukriteeriumid oluline töövoo juures

#### Paranenud
- **Arendajakogemus**: Microsoft Foundry mudelite juurutus võtab nüüd 35-45 minutit (varem 60-90 min keerulisemate alternatiividega)
- **Kulukasutuse läbipaistvus**: Selged kuluhinnangud (50-200 USD/kuus) Microsoft Foundry mudelite näitele
- **Õppeteeka selgus**: AI arendajatel on selge alguspunkt azure-openai-chat näitel
- **Dokumentatsiooni standardid**: Järjepidevad oodatavad väljundid ja kontrollsammud

#### Kinnitatud
- ✅ Microsoft Foundry mudelite näide täiesti toimiv koos `azd up`-ga
- ✅ Kõik 11 juurutusfaili süntaktiliselt korrektsed
- ✅ README juhised vastavad tegelikule juurutuskogemusele
- ✅ Dokumentatsiooni lingid uuendatud enam kui 8 kohas
- ✅ Näidete indeks peegeldab õigesti 4 kohalikku näidet
- ✅ Puuduvad duplikaatsed välislingid tabelites
- ✅ Kõik navigeerimisviited korrektsed

#### Tehniline teostus
- **Microsoft Foundry mudelite arhitektuur**: gpt-4.1 + Key Vault + Container Apps muster
- **Turvalisus**: Vahetatav haldatav identiteet, saladused Key Vaultis
- **Jälgimine**: Application Insights integratsioon
- **Kulu haldamine**: Tokenite jälgimine ja kasutuse optimeerimine
- **Juurutus**: Üksik `azd up` käsk kogu seadistuse jaoks

### [v3.6.0] - 2025-11-19

#### Suur uuendus: Container App juurutuse näited
**See versioon tutvustab põhjalikke, tootmiskõlblikke konteinerirakenduste juurutuse näiteid Azure Developer CLI (AZD) abil, koos täieliku dokumentatsiooni ja õppeteekidega integreerimisega.**

#### Lisatud
- **🚀 Container App näited**: Uued kohalikud näited kaustas `examples/container-app/`:
  - [Täielik juhend](examples/container-app/README.md): Ülevaade konteineripõhistest juurutustest, kiiralgus, tootmis- ja edasijõudnud mustrid
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): Algajasõbralik REST API koos scale-to-zero, tervisekontrolli, jälgimise ja tõrkeotsinguga
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): Tootmisvalmis mitme teenuse juurutus (API Gateway, Product, Order, User, Notification), asünkroonne sõnumivahetus, Teenuse Buss, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline ja kanarilennujuurutus
- **Parimad tavad**: Turvalisus, jälgimine, kulude optimeerimine ja CI/CD juhised konteinerikoormuste jaoks
- **Koodinäited**: Täielik `azure.yaml`, Bicep mallid ja mitme keele teenuste teostused (Python, Node.js, C#, Go)
- **Testimine ja tõrkeotsing**: Lõpp-lõpuni teststsenaariumid, jälgimiskäsud, tõrkeotsingu juhendid

#### Muudetud
- **README.md**: Uuendatud, et tutvustada ja linkida uusi konteinerirakenduste näiteid all „Kohalikud näited - konteinerirakendused“ alt
- **examples/README.md**: Uuendatud, et esile tõsta konteinerirakenduste näiteid, lisada võrdlustabeli kirjeid ja uuendada tehnoloogia/arhitektuuri viiteid
- **Kursuse plaan ja õppematerjalid**: Uuendatud, et viidata uutele konteinerirakenduste näidetele ja juurutuse mustritele vastavates peatükkides

#### Kinnitatud
- ✅ Kõik uued näited juurutatavad `azd up`-ga ja järgivad parimaid tavasid
- ✅ Dokumentatsiooni ristviited ja navigeerimine uuendatud
- ✅ Näited katavad algajatest edasijõudnuteni, sealhulgas tootmisvõimelised mikroteenused

#### Märkused
- **Ulatus**: Ainult ingliskeelne dokumentatsioon ja näited
- **Järgmised sammud**: Tulevikus laiendatakse täiendavate edasijõudnud konteinerimustrite ja CI/CD automatiseerimisega

### [v3.5.0] - 2025-11-19

#### Tootemargi ümbernimetamine: Microsoft Foundry
**See versioon rakendab üldise tootemargi nime muutmise "Microsoft Foundry"-st "Microsoft Foundry"-ks kogu ingliskeelses dokumentatsioonis, peegeldades Microsofti ametlikku ümberbrändimist.**

#### Muudetud
- **🔄 Tootemärgi nime uuendus**: Täielik ümberbrändimine "Microsoft Foundry"-st "Microsoft Foundry"-ks
  - Kõik viited uuendatud ingliskeelses dokumentatsioonis `docs/` kaustas
  - Kausta nime muutus: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Muudetud failinimi: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kokku: 23 sisuviidet uuendatud 7 dokumentatsioonifailis

- **📁 Kaustastruktuuri muudatused**:
  - `docs/ai-foundry/` nimetatud ümber `docs/microsoft-foundry/`
  - Kõik ristviited uuendatud uue kaustastruktuuri alusel
  - Navigeerimislingid kontrollitud kogu dokumentatsioonis

- **📄 Failide ümbernimetamised**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kõik sisemised lingid uuendatud osutamaks uuele failinimele

#### Uuendatud failid
- **Peatükkide dokumentatsioon** (7 faili):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tootemäära kohta uuendust
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasutab juba Microsoft Foundry’d (eelmiste uuenduste alusel)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 uuendust (ülevaade, kogukonna tagasiside, dokumentatsioon)
  - `docs/getting-started/azd-basics.md` - 4 ristviide uuendust
  - `docs/getting-started/first-project.md` - 2 peatüki navigeerimislingi uuendust
  - `docs/getting-started/installation.md` - 2 järgmise peatüki linki uuendatud
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 uuendust (navigeerimine, Discordi kogukond)
  - `docs/troubleshooting/common-issues.md` - 1 navigeerimislink uuendatud
  - `docs/troubleshooting/debugging.md` - 1 navigeerimislink uuendatud

- **Kursuse struktuuri failid** (2 faili):
  - `README.md` - 17 viidet uuendatud (kursuse ülevaade, peatükkide nimed, mallide sektsioon, kogukonna teadmised)
  - `course-outline.md` - 14 viidet uuendatud (ülevaade, õppimise eesmärgid, peatükkide ressursid)

#### Kontrollitud
- ✅ Null järelejäänud "ai-foundry" kaustatee viidet ingliskeelsetes dokumentides
- ✅ Null järelejäänud "Microsoft Foundry" tootemäära viidet ingliskeelsetes dokumentides
- ✅ Kõik navigeerimislingid toimivad uue kaustastruktuuriga
- ✅ Failide ja kaustade ümbernimetamised edukalt tehtud
- ✅ Peatükkidevahelised ristviited kontrollitud

#### Märkused
- **Kohaldamisala**: Muudatused tehtud ainult inglise keelsele dokumentatsioonile kaustas `docs/`
- **Tõlked**: Tõlkekaustad (`translations/`) selles versioonis ei ole uuendatud
- **Töötoad**: Töötoa materjalid (`workshop/`) selles versioonis ei ole uuendatud
- **Näited**: Näidisdokumendid võivad endiselt viidata vanale nimetusele (lahendatakse tulevastes uuendustes)
- **Välised lingid**: Välised URL-id ja GitHubi hoidla viited jäävad muutumatuks

#### Migratsioonijuhis kaasautoritele
Kui teil on kohalikud harud või dokumentatsioon, mis viitab vanale struktuurile:
1. Uuendage kaustaviited: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uuendage failiviited: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Asendage tootemäär „Microsoft Foundry“ → „Microsoft Foundry“
4. Kontrollige, et kõik sisemised dokumentatsioonilingid töötavad endiselt

---

### [v3.4.0] - 2025-10-24

#### Taristu eelvaade ja valideerimise täiustused
**See versioon toob põhjaliku toe uuele Azure Developer CLI eelvaate funktsioonile ja täiustab töötoa kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Põhjalik katvus taristu eelvaate võimalusele
  - Käsureferents ja kasutusnäited kiirjuhendis
  - Detailne integreerimine provisjonimisjuhises koos kasutusjuhtude ja kasudega
  - Eelpiloodi kontrollide integreerimine turvalisema juurutuse tagamiseks
  - Algusjuhiste uuendused turvalise esmase juurutamispraktikaga
- **🚧 Töötoa staatusesilt**: Professionaalne HTML-banner, mis näitab töötoa arendusstaatus
  - Gradientne kujundus ehitusmärkidega selgeks kasutajate info edastamiseks
  - Viimane uuendamise kuupäev läbipaistvuseks
  - Mobiilseadmetele kohanduv disain kõikidele seadmetele

#### Täiustatud
- **Taristu turvalisus**: Eelvaate funktsioon integreeritud kogu juurutusdokumentatsiooni
- **Eeljuurutuse valideerimine**: Automaatse skripti laiendused taristu eelvaate testimiseks
- **Arendajate töövoog**: Käsu järjekord uuendatud, et hõlmata eelvaadet parima praktikana
- **Töötoa kogemus**: Selged ootused kasutajatele töötoa sisu arendamise kohta

#### Muudetud
- **Juurutuse parimad praktikad**: Eelvaate esmalt töövoog soovitatavaks lähenemiseks
- **Dokumentatsiooni voog**: Taristu valideerimine viidud varasemasse õppetsüklisse
- **Töötoa esitlus**: Professionaalne staatuse info koos selgete arendusajagraafikutega

#### Paranenud
- **Turvalisuse esmatähtsus**: Taristu muudatusi saab nüüd enne juurutust valideerida
- **Meeskonnatöö**: Eelvaate tulemusi saab jagada ülevaatamiseks ja kinnitamiseks
- **Kuluteadlikkus**: Ressursside kulude parema mõistmise võimalus enne provisjoneerimist
- **Riskide vähendamine**: Juhtimisvigade vähenemine varajase valideerimise kaudu

#### Tehniline rakendus
- **Mitme dokumendi integratsioon**: Eelvaate funktsioon kajastatud neljas põhifailis
- **Käsu mustrid**: Ühtlane süntaks ja näited kogu dokumentatsioonis
- **Parimate tavade integreerimine**: Eelvaade lisatud valideerimisprotsessidesse ja skriptidesse
- **Visuaalsed märgised**: Selgelt välja toodud UUS funktsioon leitavuse tõstmiseks

#### Töötoa taristu
- **Staatuskommunikatsioon**: Professionaalne HTML-banner gradientkujundusega
- **Kasutajakogemus**: Selge arendusstaatus vältimaks segadust
- **Professionaalne esitlus**: Säilitab hoidla usaldusväärsuse ja seab ootused
- **Ajaskaala läbipaistvus**: 2025. aasta oktoobri viimase uuenduse ajatempli avalikustamine

### [v3.3.0] - 2025-09-24

#### Täiendatud töötoa materjalid ja interaktiivne õppimiskogemus
**See versioon lisab põhjalikud töötoa materjalid, brauseripõhise interaktiivse juhendi ja struktureeritud õppeteed.**

#### Lisatud
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötoakogemus koos MkDocs eelvaatevõimega
- **📝 Struktureeritud töötoa juhised**: 7-etapiline juhendatud õppimise rada avastamisest kohandamiseni
  - 0-Sissejuhatus: töötoa ülevaade ja seadistus
  - 1-Select-AI-Template: mallide avastus ja valikuprotsess
  - 2-Validate-AI-Template: juurutus ja valideerimisprotseduurid
  - 3-Deconstruct-AI-Template: malli arhitektuuri mõistmine
  - 4-Configure-AI-Template: konfiguratsioon ja kohandamine
  - 5-Customize-AI-Template: edasijõudnud muudatused ja iteratsioonid
  - 6-Teardown-Infrastructure: koristamine ja ressursside haldamine
  - 7-Lõpetamine: kokkuvõte ja järgmised sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfiguratsioon Materjal-teemaga parema õppimiskogemuse tagamiseks
- **🎯 Käed-külge õppekava**: 3-etapiline metoodika (Avastus → Juurutus → Kohandamine)
- **📱 GitHub Codespaces integratsioon**: sujuv arenduskeskkonna seadistamine

#### Täiustatud
- **AI töötoa praktikum**: Laiendatud põhjaliku 2–3-tunnise struktureeritud õpikogemusega
- **Töötoa dokumentatsioon**: Professionaalne esitlus navigeerimise ja visuaalsete abivahenditega
- **Õppimise edenemine**: Selge samm-sammuline juhend mallide valikust tootmisjuurutuseni
- **Arendajakogemus**: Integreeritud tööriistad sujuvate arendusprotsesside jaoks

#### Paranenud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimise ja teemavaluikude vahetusega
- **Oma tempos õppimine**: Paindlik töötoa struktuur eri õppimise kiiruste toetamiseks
- **Praktiline rakendamine**: Reaalmaailma AI mallide juurutamise stsenaariumid
- **Kogukonna integreerimine**: Discordi integratsioon töötoa toe ja koostöö jaoks

#### Töötoa funktsioonid
- **Sisseehitatud otsing**: Kiire märksõna- ja õppetunni leidmine
- **Kopeeri koodiplokke**: Hiirega üle sõites kopeerimise funktsioon kõikidele näidiskoodidele
- **Teemade vahetus**: Tume/hele režiimi tugi mitmesuguste eelistuste jaoks
- **Visuaalsed materjalid**: Ekraanipildid ja diagrammid parema mõistmise tagamiseks
- **Abi integreerimine**: Otselingi Discordi kogukonna toega

### [v3.2.0] - 2025-09-17

#### Suur navigeerimise ümberkorraldus ja peatükkidel põhinev õppesüsteem
**See versioon loob põhjaliku peatükkidel põhineva õppestruktuuri koos täiustatud navigeerimisega kogu hoidlas.**

#### Lisatud
- **📚 Peatükkidel põhinev õppesüsteem**: Terve kursus ümber korraldatud 8 järkjärgulisse peatükki
  - Peatükk 1: Alused ja kiire alustamine (⭐ - 30–45 minutit)
  - Peatükk 2: AI keskne arendus (⭐⭐ - 1–2 tundi)
  - Peatükk 3: Konfiguratsioon ja autentimine (⭐⭐ - 45–60 minutit)
  - Peatükk 4: Taristu koodina ja juurutus (⭐⭐⭐ - 1–1.5 tundi)
  - Peatükk 5: Mitmeagendiline AI lahendus (⭐⭐⭐⭐ - 2–3 tundi)
  - Peatükk 6: Eeljuurutuse valideerimine ja planeerimine (⭐⭐ - 1 tund)
  - Peatükk 7: Veaotsing ja silumine (⭐⭐ - 1–1.5 tundi)
  - Peatükk 8: Tootmise ja ettevõtluse mustrid (⭐⭐⭐⭐ - 2–3 tundi)
- **📚 Ühtne navigeerimissüsteem**: Ühtsed navigeerimisriba päised ja jalused kogu dokumentatsioonis
- **🎯 Edusammude jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppimise valideerimissüsteem
- **🗺️ Õppeteede juhendamine**: Selged sisenemispunktid erinevate kogemustasemete ja eesmärkide jaoks
- **🔗 Ristviidete navigeerimine**: Seotud peatükid ja eeltingimused selgelt ühendatud

#### Täiustatud
- **README struktuur**: Muudetud struktureeritud õppimisplatvormiks peatükkidel põhineva korraldusega
- **Dokumentatsiooni navigeerimine**: Iga lehekülg sisaldab nüüd peatüki konteksti ja edenemissoovitusi
- **Malli organiseerimine**: Näited ja mallid kaardistatud sobivatele õppimispeatükkidele
- **Ressursside integratsioon**: Kiirjuhendid, korduma kippuvad küsimused ja õppejuhendid seotud asjakohaste peatükkidega
- **Töötoa integratsioon**: Käed-külge laborid kaardistatud mitme peatüki õppimiseesmärkidega

#### Muudetud
- **Õppimise struktuur**: Liiguti lineaarse dokumentatsiooni asemel paindlikku peatükkidel põhinevasse õppimisse
- **Konfiguratsiooni positsioneerimine**: Konfiguratsiooni juhend liigutatud peatükki 3 parema õppevoo jaoks
- **AI sisu integreerimine**: AI-spetsiifiline sisu parem integreerimine kogu õppeteekonna vältel
- **Tootmisalane sisu**: Täiustatud mustrid koondatud peatükki 8 ärikasutajate jaoks

#### Paranenud
- **Kasutajakogemus**: Selged navigeerimismurdjad ja peatükprogressiooni indikaatorid
- **Juurdepääsetavus**: Ühtsed navigeerimismustrid hõlbustavad kursuse läbimist
- **Professionaalne esitlus**: Ülikoolistiilis kursuse struktuur sobib akadeemiliseks ja ettevõtte koolituseks
- **Õppimise efektiivsus**: Sisu läbipaistvam ja kiiremini leitav parema korralduse läbi

#### Tehniline rakendus
- **Navigeerimispead**: Standardiseeritud peatükkide navigeerimine üle 40 dokumentatsioonifaili
- **Jalusnavigatsioon**: Ühtsed edenemissoovitused ja peatüki lõpetamise indikaatorid
- **Ristlingid**: Põhjalik sisemine linkimissüsteem seotud mõjude ühendamiseks
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õppimiseesmärkidega

#### Õppejuhendi täiendus
- **📚 Põhjalikud õppimiseesmärgid**: Õppejuhend ümber korraldatud sobituma 8-peatükkilise süsteemiga
- **🎯 Peatükkidel põhinev hindamine**: Igas peatükis konkreetsed õppimiseesmärgid ja praktilised harjutused
- **📋 Edenemiskontroll**: Nädalane õppemahukava mõõdetavate tulemuste ja lõpetamistabelitega
- **❓ Hindamisküsimused**: Igale peatükile teadmiste valideerimise küsimused professionaalse tulemuslikkusega
- **🛠️ Praktilised harjutused**: Käed-külge tegevused reaalsete juurutamisstsenaariumitega ja veaotsinguga
- **📊 Oskustaseme areng**: Selge edenemine põhitõdedest ettevõtlusmustriteni karjääri edendamise fookusega
- **🎓 Sertifitseerimiskava**: Professionaalse arengu tulemused ja kogukonna tunnustus
- **⏱️ Ajaplaneerimine**: Struktureeritud 10-nädalane õppeplaan tähtajaliste verstapostidega

### [v3.1.0] - 2025-09-17

#### Täiustatud mitmeagendilised AI lahendused
**See versioon parandab mitmeagendilist jaemüügilahendust paremate agendi nimede ning dokumentatsiooni täiustustega.**

#### Muudetud
- **Mitmeagendiliste terminite kasutus**: Asendatud "Cora agent" terminiga "Customer agent" kogu jaemüügiga seotud mitmeagentse lahenduse puhul selgema mõistmise jaoks
- **Agendi arhitektuur**: Uuendatud kogu dokumentatsioon, ARM mallid ja koodinäited kasutama ühtset nimetust "Customer agent"
- **Konfiguratsiooni näited**: Kaasaegsemad agendi konfiguratsiooni mustrid uuendatud nimetuskonventsioonidega
- **Dokumentatsiooni ühtlus**: Tagatud kõikides viidetes professionaalsed ja kirjeldavad agendi nimed

#### Täiustatud
- **ARM-malli pakett**: Uuendatud retail-multiagent-arm-template Customer agent viidetega
- **Arhitektuuridiagrammid**: Värskendatud Mermaid diagrammid uue agendi nimetusega
- **Koodinäited**: Python klassid ja rakenduse näited kasutavad nüüd CustomerAgent nimetust
- **Keskkonnamuutujad**: Uuendatud kõik juurutusskriptid kasutama CUSTOMER_AGENT_NAME konventsiooni

#### Paranenud
- **Arendajakogemus**: Selgemad agendi rollid ja vastutused dokumentatsioonis
- **Tootmiskõlblikkus**: Parema sobivusega ettevõtte terminoloogiaga
- **Õppematerjalid**: Intuitiivsem agendi nimetuse kasutamine õppimise eesmärgil
- **Malli kasutatavus**: Lihtsam arusaamine agendi funktsioonidest ja juurutusmustritest

#### Tehnilised üksikasjad
- Uuendatud Mermaid arhitektuuridiagrammid CustomerAgent viidetega
- Asendatud CoraAgent klassi nimed CustomerAgent’iks Python näidetes
- Muudetud ARM malle JSON konfiguratsioonides agendi tüübiks "customer"
- Uuendatud keskkonnamuutujad CORA_AGENT_* → CUSTOMER_AGENT_*
- Värskendatud kõik juurutuskäsud ja konteineri konfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Suured muudatused – AI arendaja keskendus ja Microsoft Foundry integratsioon
**See versioon muudab hoidla põhjalikuks AI-keskseks õppematerjaliks Microsoft Foundry integreerimisega.**

#### Lisatud
- **🤖 AI-esmase õppetee**: Täielik ümberkorraldus, mis seab prioriteediks AI-arendajad ja insenerid
- **Microsoft Foundry integreerimise juhend**: Põhjalik dokumentatsioon AZD ühendamiseks Microsoft Foundry teenustega
- **AI mudeli juurutusmustrid**: Detailne juhend mudelivalikust, konfiguratsioonist ja tootmisele juurutamise strateegiatest
- **AI töötuba labor**: 2–3-tunnine praktiline töötoa sessioon AI rakenduste teisendamiseks AZD-ga kasutatavatesse lahendustesse  
- **Tootmisvalmis AI parimad tavad**: Ettevõttevalmis mustrid AI töökoormuste skaleerimiseks, jälgimiseks ja turvamiseks  
- **AI-spetsiifiline tõrkeotsingu juhend**: Kõikehõlmav tõrkeotsing Microsoft Foundry mudelite, Cognitive Services ja AI juurutamise probleemide jaoks  
- **AI malligalerii**: Microsoft Foundry mallide esiletõstetud kogumik koos keerukuse hinnanguga  
- **Töötoa materjalid**: Täielik töötoa struktuur praktiliste laborite ja viidematerjalidega  

#### Täiustatud  
- **README struktuur**: AI-arendajatele suunatud, lisaks 45% kogukonna huvipõhine andmestik Microsoft Foundry Discordist  
- **Õppeteed**: Pühendatud AI arendaja teekond koos traditsiooniliste õppeteedega üliõpilastele ja DevOps-inseneridele  
- **Mallisoovitused**: Esiletõstetud AI mallid, sealhulgas azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart  
- **Kogukonna integratsioon**: Täiustatud Discord kogukonna toestus AI-spetsiifiliste kanalite ja aruteludega  

#### Turvalisuse ja tootmiskesksus  
- **Haldatud identiteedi mustrid**: AI-spetsiifilised autentimis- ja turvakonfiguratsioonid  
- **Kuluoptimeerimine**: Tokenite kasutuse jälgimine ja eelarve kontroll AI töökoormustele  
- **Mitme regi juurutamine**: Globaalsete AI rakenduste juurutamise strateegiad  
- **Tulemuste jälgimine**: AI-spetsiifilised mõõdikud ja Application Insights integratsioon  

#### Dokumentatsiooni kvaliteet  
- **Lineaarne kursuse struktuur**: Loogiline areng algajast edasijõudnutele AI juurutamismustrites  
- **Kinnitatud URL-id**: Kõik välised hoidlalingid on kontrollitud ja kättesaadavad  
- **Täpne viide**: Kõik sisemised dokumentatsioonilingid on valideeritud ja toimivad  
- **Tootmiseks valmis**: Ettevõtte juurutamise mustrid reaalse maailma näidetega  

### [v2.0.0] - 2025-09-09  

#### Suured muudatused – hoidla ümberstruktureerimine ja professionaalse täiustamine  
**See versioon tähistab hoidla struktuuri ja sisu esitluse tõsist uuendust.**  

#### Lisatud  
- **Struktureeritud õppimise raamistik**: Kõik dokumentatsioonilehed sisaldavad nüüd Sissejuhatuse, Õpieesmärkide ja Õpitulemuste sektsioone  
- **Navigatsioonisüsteem**: Lisatud Eelmise/Järgmise õppetunni lingid kogu dokumentatsioonis juhendatud õppe edenemise jaoks  
- **Õppematerjalide juhend**: Kõikehõlmav study-guide.md õpieesmärkide, harjutuste ja hinnangumaterjalidega  
- **Professionaalne esitlus**: Kõik emotikonid eemaldatud parema ligipääsetavuse ja professionaalse välimuse nimel  
- **Täiustatud sisu struktuur**: Paranenud õppematerjalide organiseerimine ja voog  

#### Muudetud  
- **Dokumentatsiooni formaat**: Kõik materjalid ühtlustatud järjepidevate õppimissuunaliste struktuuridega  
- **Navigatsiooni voo parandamine**: Rakendatud loogiline edenemine kõigis õppematerjalides  
- **Sisuesitlus**: Eemaldatud dekoratiivsed elemendid, asendatud selge ja professionaalse vormistusega  
- **Linkide struktuur**: Uuendatud kõik sisemised lingid toetamaks uut navigatsioonisüsteemi  

#### Parendatud  
- **Ligipääsetavus**: Emotikonide eemaldamine paremaks ekraanilugejate ühilduvuseks  
- **Professionaalne välimus**: Puhtad, akadeemilise stiiliga esitlused ettevõtteõppe jaoks sobivad  
- **Õpikogemus**: Struktureeritud lähenemine selgete eesmärkide ja tulemustega igas õppetükis  
- **Sisu organiseerimine**: Paranenud loogiline voog ja seosed seotud teemade vahel  

### [v1.0.0] - 2025-09-09  

#### Esimene väljaanne – kõikehõlmav AZD õpiehoidla  

#### Lisatud  
- **Põhidokumentatsiooni struktuur**  
  - Täielik tutvustav juhendite sari  
  - Kõikehõlmav juurutamise ja provisjonimise dokumentatsioon  
  - Detailne tõrkeotsingu ja silumisressursside kogu  
  - Eeljuurutamise valideerimise tööriistad ja protseduurid  

- **Alustamismoodul**  
  - AZD alused: põhimõisted ja terminoloogia  
  - Paigaldusjuhend: platvormipõhised seadistusjuhised  
  - Konfiguratsioonijuhend: keskkonna seadistamine ja autentimine  
  - Esimene projekt: samm-sammult praktiline õppimine  

- **Juurutamise ja provisjonimise moodul**  
  - Juurutamise juhend: täielik töösvoo dokumentatsioon  
  - Provisjonimise juhend: infrastruktuur kui kood Bicep abil  
  - Parimad tavad tootmisjuurutusteks  
  - Mitmest teenusest koosnevad arhitektuuri mustrid  

- **Eeljuurutamise valideerimise moodul**  
  - Võimsuse planeerimine: Azure ressursi saadavuse kontroll  
  - SKU valik: teenuse taseme juhised  
  - Eelpardal kontrollid: automatiseeritud valideerimisskriptid (PowerShell ja Bash)  
  - Kulu prognoosimise ja eelarvestamise tööriistad  

- **Tõrkeotsingu moodul**  
  - Levinumad probleemid: sagedased probleemid ja lahendused  
  - Silumisjuhend: süstemaatilised tõrkeotsingu meetodid  
  - Täiustatud diagnostikatehnikad ja tööriistad  
  - Tulemuslikkuse jälgimine ja optimeerimine  

- **Ressursid ja viited**  
  - Käskluste kiirjuhend: kiire ülevaade olulistest käsklustest  
  - Sõnastik: terminite ja lühendite põhjalik seletus  
  - KKK: vastused sagedastele küsimustele  
  - Väliste ressursside lingid ja kogukonnaga ühenduse võimalused  

- **Näited ja mallid**  
  - Lihtne veebirakenduse näide  
  - Staatilise veebisaidi juurutamise mall  
  - Konteinerite rakenduse konfiguratsioon  
  - Andmebaasi integreerimise mustrid  
  - Mikroteenuste arhitektuuri näited  
  - Serverless funktsioonide rakendused  

#### Funktsioonid  
- **Mitmeplatvormiline tugi**: paigaldus- ja konfiguratsioonijuhised Windowsi, macOS-i ja Linuxi jaoks  
- **Erinevad oskustasemed**: sisu nii üliõpilastele kui ka professionaalsetele arendajatele  
- **Praktiline fookus**: praktilised näited ja reaalsed olukorrad  
- **Kõikehõlmav käsitlus**: alustades põhikontseptsioonidest kuni edasijõudnud ettevõttemustriteni  
- **Turvalisus esikohal**: turvaparimad tavad integreeritud kogu dokumentatsiooni ulatuses  
- **Kuluoptimeerimine**: juhised kulutõhusate juurutuste ja ressursside haldamiseks  

#### Dokumentatsiooni kvaliteet  
- **Detailsemad koodinäited**: praktilised ja testitud koodinäited  
- **Samm-sammult juhised**: selged ja teostatavad suunised  
- **Kõikehõlmav veahaldus**: tõrkeotsing sagedastele vigadele  
- **Parimate tavade integreerimine**: tööstusharu standardite ja soovitustega  
- **Versioonide ühilduvus**: ajakohane uusimate Azure teenuste ja azd funktsioonidega  

## Plaanitud tuleviku täiendused  

### Versioon 3.1.0 (plaanis)  
#### AI platvormi laiendamine  
- **Mitmemudeline tugi**: integreerimismustrid Hugging Face, Azure Machine Learning ja kohandatud mudelite jaoks  
- **AI agendi raamistiku mallid**: LangChain, Semantic Kernel ja AutoGen juurutuse mallid  
- **Täiustatud RAG mustrid**: vektori baaside valikud Azure AI Searchi kõrval (Pinecone, Weaviate jt)  
- **AI jälgitavus**: täiustatud mudeli jõudluse, tokenite kasutuse ja vastuse kvaliteedi jälgimine  

#### Arendajakogemus  
- **VS Code laiendus**: integreeritud AZD + Microsoft Foundry arenduskogemus  
- **GitHub Copiloti integratsioon**: AI abil AZD mallide genereerimine  
- **Interaktiivsed juhendid**: praktilised kodeerimisülesanded automaatse valideerimisega AI stsenaariumite jaoks  
- **Video sisu**: täiendavad videotutorialid visuaalsete õppijate jaoks, mis keskenduvad AI juurutustele  

### Versioon 4.0.0 (plaanis)  
#### Ettevõtte AI mustrid  
- **Haldusraamistik**: AI mudelite valitsemine, vastavus ja auditi jäljed  
- **Mitme üürniku AI**: mustrid mitme kliendi teenindamiseks isoleeritud AI teenustega  
- **Serva-AI juurutamine**: integratsioon Azure IoT Edge ja konteinerite instantsidega  
- **Hübriidpilv AI**: mitmepilve- ja hübriidjuurutamise mustrid AI töökoormustele  

#### Täiustatud funktsioonid  
- **AI torujuhtme automatiseerimine**: MLOps integratsioon Azure Machine Learning torujuhtmete kaudu  
- **Täiustatud turvalisus**: nullusaldusmustrid, privaatpunktid ja täiustatud ohukaitse  
- **Jõudluse optimeerimine**: täiustatud häälestamise ja skaleerimise strateegiad kõrge läbilaskevõimega AI rakenduste jaoks  
- **Globaalse levituse mustrid**: sisujagamine ja serva vahemälu mustrid AI rakendustele  

### Versioon 3.0.0 (plaanis) – asendatud käesoleva väljaandega  
#### Pakutud lisad – nüüd rakendatud versioonis 3.0.0  
- ✅ **AI-keskne sisu**: Microsoft Foundry täielik integratsioon (tehtud)  
- ✅ **Interaktiivsed juhendid**: praktiline AI töötuba labor (tehtud)  
- ✅ **Täiustatud turvafunktsioonid**: AI-spetsiifilised turvapatte (tehtud)  
- ✅ **Jõudluse optimeerimine**: AI töökoormuste häälestuse strateegiad (tehtud)  

### Versioon 2.1.0 (plaanis) – osaliselt rakendatud versioonis 3.0.0  
#### Väikesed täiustused – mõningad tehtud käesolevas versioonis  
- ✅ **Lisatud näited**: AI-kesksete juurutusstsenaariumite näited (tehtud)  
- ✅ **Pikendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsingu juhendid (tehtud)  
- **Tööriistade integratsioon**: täiustatud IDE ja redaktori integratsioonijuhendid  
- ✅ **Jälgimise laiendus**: AI-spetsiifilised jälgimise ja häiresüsteemide mustrid (tehtud)  

#### Endiselt kavandatud tulevaks versiooniks  
- **Mobiilisõbralik dokumentatsioon**: mobiilseadmete jaoks reageeriv disain  
- **Võimalus kasutada võrguühenduseta**: allalaaditavad dokumentatsioonipaketid  
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogude jaoks  
- **Kogukonna armatuurlaud**: reaalajas kogukonna mõõdikud ja panuste jälgimine  

## Panustamine muudatusteloendisse  

### Muudatuste teavitamine  
Kui panustate sellesse hoidla, palun tagage, et muudatuste registris oleksid:  

1. **Versiooninumber**: järgides semantilist versioonihaldust (major.minor.patch)  
2. **Kuupäev**: väljaandmise või uuendamise kuupäev formaadis YYYY-MM-DD  
3. **Kategooria**: Lisatud, Muudetud, Maha võetud, Eemaldatud, Parandatud, Turvalisus  
4. **Selge kirjeldus**: kokkuvõtlik kirjeldus muudatustest  
5. **Mõju hinnang**: kuidas muudatused mõjutavad olemasolevaid kasutajaid  

### Muudatuste kategooriad  

#### Lisatud  
- Uued funktsioonid, dokumentatsiooni sektsioonid või võimalused  
- Uued näited, mallid või õppematerjalid  
- Lisatööriistad, käsud või utiliidid  

#### Muudetud  
- Muudatused olemasoleva funktsionaalsuse või dokumentatsiooni juures  
- Parandused selguse või täpsuse tõstmiseks  
- Sisu või organisatsiooni ümberkorraldamine  

#### Maha võetud  
- Funktsioonid või lähenemised, mida enam ei toeta  
- Dokumentatsiooni sektsioonid, mis on planeeritud eemaldamiseks  
- Meetodid, millele on olemas paremad alternatiivid  

#### Eemaldatud  
- Välja jäetud funktsioonid, dokumentatsioon või näited, mis ei ole enam asjakohased  
- Vananenud info või eemaldatud lähenemised  
- Topeltsisaldunud või ühendatud sisu  

#### Parandatud  
- Parandused dokumentatsiooni või koodi vigadele  
- Lahendatud teatatud probleemid  
- Täpsuse või funktsionaalsuse parandused  

#### Turvalisus  
- Turvaparandused või täiustused  
- Turvalisuse parimate tavade uuendused  
- Turvahaavatavuste lahendused  

### Semantilise versioonihalduse juhised  

#### Suurversioon (X.0.0)  
- Tagurpidiühilduvust rikkuvad muudatused, mis nõuavad kasutaja tegevust  
- Tõsine sisu või organisatsiooni ümberkorraldus  
- Põhimõttelist lähenemist või metoodikat muutevad muudatused  

#### Väikeversioon (X.Y.0)  
- Uued funktsioonid või sisulised täiendused  
- Täiustused, mis säilitavad tagurpidiühilduvuse  
- Lisatud näited, tööriistad või ressursid  

#### Plaasterversioon (X.Y.Z)  
- Veaparandused ja korrektuurid  
- Väikesed parendused olemasolevale sisule  
- Täpsustused ja väikesed täiustused  

## Kogukonna tagasiside ja ettepanekud  

Julgesti julgustame kogukonna tagasisidet selle õpiressursi parandamiseks:  

### Kuidas tagasisidet anda  
- **GitHubi issue’id**: teatage probleemidest või tehke ettepanekuid parandusteks (AI-spetsiifilised probleemid on teretulnud)  
- **Discordi arutelud**: jagage ideid ja osalege Microsoft Foundry kogukonna vestlustes  
- **Pull request’id**: panustage otse sisusse, eriti AI mallide ja juhendite täiustamiseks  
- **Microsoft Foundry Discord**: osalege #Azure kanalil AZD + AI teemadel  
- **Kogukonna foorumid**: osalege laiemates Azure arendajate aruteludes  

### Tagasiside kategooriad  
- **AI sisu täpsus**: parandused AI teenuste integratsiooni ja juurutamise infole  
- **Õppimiskogemus**: ettepanekud õppija voolu parandamiseks AI arendajatele  
- **Puuduv AI sisu**: soovid täiendavate AI mallide, mustrite või näidete jaoks  
- **Ligipääsetavus**: parandused mitmekesiste õppimisvajaduste jaoks  
- **AI tööriistade integratsioon**: ettepanekud AI arendusvoogude paremaks ühendamiseks  
- **Tootmis-AI mustrid**: ettevõtte AI juurutamise mustrite taotlused  

### Vastamiskohustus  
- **Probleemide kättesaamine**: 48 tunni jooksul pärast teavitust  
- **Funktsioonisoovid**: hinnang ühe nädala jooksul  
- **Kogukonna panused**: ülevaatus ühe nädala jooksul  
- **Turbeprobleemid**: esmatähtsad, kiire reageerimine  

## Hooldusplaan  

### Regulaarne uuendamine  
- **Kuuülevaated**: sisu täpsuse ja linkide valideerimine  
- **Kvartaliuuendused**: suuremad sisulised lisandused ja parendused  
- **Poolaasta ülevaated**: põhjalik ümberkorraldus ja täiustused  
- **Aastased väljaanded**: suuremad versiooniuuendused oluliste täiustustega  

### Jälgimine ja kvaliteedi tagamine  
- **Automatiseeritud testimine**: regulaarne koodinäidete ja linkide valideerimine  
- **Kogukonna tagasiside integreerimine**: kasutajate ettepanekute regulaarne kaasamine  
- **Tehnoloogia uuendused**: kooskõlas uusimate Azure teenuste ja azd väljaannetega  
- **Ligipääsetavuse auditid**: regulaarne läbivaatus kaasava disaini põhimõtete osas  

## Versioonitoe poliitika  

### Kehtiv versioonitugi  
- **Viimane suurversioon**: täistugi koos regulaarsete uuendustega  
- **Eelnev suurversioon**: turvaparandused ja kriitilised parandused 12 kuu jooksul  
- **Varasemad versioonid**: ainult kogukonna tugi, ametlikke uuendusi ei ole  

### Migratsioonijuhendid  
Kui suuremad versioonid ilmuvad, pakume:  
- **Migratsioonijuhendid**: samm-sammult juhised üleminekuks  
- **Ühilduvuse märkused**: info tagurpidiühilduvust rikkuvate muudatuste kohta  
- **Tööriistatugi**: skriptid ja utiliidid migratsiooni hõlbustamiseks  
- **Kogukonna tugi**: pühendatud foorumid migratsiooni küsimuste jaoks  

---

**Navigatsioon**  
- **Eelmine õppetund**: [Study Guide](resources/study-guide.md)  
- **Järgmine õppetund**: Tagasi [Main README](README.md)  

**Hoia end kursis**: Jälgi seda hoidlat teavitamaks uutest väljaannetest ja olulistest õppematerjalide uuendustest.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Dnevnik sprememb - AZD za začetnike

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD For Beginners. Sledimo načelom semantičnega verzioniranja in vodimo ta zapis, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

S pregledom tega dnevnika sprememb boste:
- Ostali obveščeni o novih funkcijah in dodatkih vsebine
- Razumeli izboljšave v obstoječi dokumentaciji
- Spremljali popravke napak in korekcije za zagotovitev točnosti
- Sledili razvoju učnih gradiv skozi čas

## Učni rezultati

Po pregledu vnosov v dnevniku sprememb boste lahko:
- Prepoznali novo vsebino in vire, ki so na voljo za učenje
- Razumeli, katere razdelke so posodobili ali izboljšali
- Načrtovali svojo učno pot glede na najnovejše materiale
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Avtorizacija predlog, Dev Containerji, Pulumi, Azure DevOps, servisni principal-i in več
**Ta različica zapira preostale vmesne vrzeli, ki jih je pokazala analiza azd-coverage: kako ustvariti in objaviti lastno predlogo, reproducibilna dev-container/Codespaces okolja, Pogon Pulumi za infrastrukturo, vodnik Azure DevOps CI/CD, avtentikacija servisnih principal-ov, navodila za izbiro gostitelja (AKS/Spring Apps), razlage `azd restore`/`azd package`, obravnava napak v hook-ih in prakse za timska/deljena okolja.**

#### Dodano
- **🧱 Nova lekcija poglavja 4** `docs/chapter-04-infrastructure/custom-templates.md` — ustvarjanje lastne azd predloge: zahtevana struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametraziranje infrastrukture z resource tokenom `uniqueString()` in oznako `azd-env-name`, lokalno testiranje z `azd init --template <local-path>`, objava na GitHub in oddaja v galerijo Awesome AZD
- **📦 Nova lekcija poglavja 1** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okolja z Dev Containerji in GitHub Codespaces: minimalen `.devcontainer/devcontainer.json` z uradno `ghcr.io/azure/azure-dev/azd` funkcijo, jezikovno-specifične funkcije, `docker-in-docker` za gostitelje kontejnerjev in `azd auth login --use-device-code` za oddaljeno prijavo
- **🧩 Pulumi z azd** odsek v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi mapa za foldere, stack-i preslikani na azd okolja, zahtevani outputs/tagging in enak delovni tok `azd up` / `azd down`
- **🎯 Navodila za izbiro gostitelja** v `docs/chapter-04-infrastructure/provisioning.md` — prijazen primerjalni pregled `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` in `springapp`, z usmeritvami, kdaj izbrati AKS ali Azure Spring Apps
- **🛠️ Azure DevOps CI/CD vodnik** v `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection z workload identity federation (OIDC), generiran `azure-dev.yml` in nastavitev variable-group
- **🔑 Servisni principal-i (Vzorac 4)** dodano v `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivni `azd auth login` s client secret proti federiranim/OIDC poverilnicam, kdaj jih uporabiti in varno shranjevanje poverilnic
- **🪝 Obravnava napak v hook-ih** pododsek v `docs/chapter-04-infrastructure/deployment-guide.md` — izhodne kode in `set -e`, `continueOnError`, testiranje hook-ov izolirano z `azd hooks run`, OS-specifične lupine in `--debug`
- **👥 Timska / deljena okolja** odsek v `docs/chapter-03-configuration/configuration.md` — kaj živi v `.azure/`, kaj dodati v .gitignore, okolja po razvijalcu, `azd env list`/`select` in zagotavljanje vrednosti okolja v CI/CD
- **🧰 Razlage `azd restore` in razširjenega `azd package`** v `resources/cheat-sheet.md` — obnavljanje odvisnosti in gradnja deployable artefakta brez nameščanja

#### Spremenjeno
- **🧭 Tabela lekcij poglavja 4** posodobljena, da vključuje novo lekcijo "Authoring Your Own Template" (Lekcija 3)
- **🧭 Tabela lekcij poglavja 1** posodobljena, da vključuje novo lekcijo "Dev Containers & Codespaces" (Lekcija 5); navigacijski nogi povezani med `bring-your-own-app.md` in `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Praktična lekcija o več-agentih, "Bring Your Own App", Terraform in CI/CD vodnik
**Ta različica zapira največje vrzeli za celovit začetniški vodič z dodajanjem dveh novih praktičnih lekcij (vodnik za deployabilen več-agentni scenarij in dodajanje azd v obstoječo aplikacijo), uvodom v hook-e za začetnike, razdelkom o Terraform z azd, korak-po-korak GitHub Actions pipeline vodnikom, razlago za nove preview razširitve in eksplicitnim seznamom za preverjanje deploya.**

#### Dodano
- **🤝 Nova lekcija poglavja 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — popolnoma praktičen, deployabilen vodnik za dva agenta (orchestrator + specialisti) z uporabo resnične predloge (`contoso-creative-writer`), pokriva kdaj uporabiti več agentov, delovni tok `azd up`, razumevanje deployanih virov, sledenje med agenti, prilagoditve in čiščenje
- **📦 Nova lekcija poglavja 1** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd v obstoječi projekt z `azd init` ("use code in the current directory"), razumevanje `azure.yaml` in `infra/`, `azd infra generate`, zaznavanje gostitelja in deploy z `azd up`
- **🌐 Terraform z azd** odsek dodan v `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfiguracija, `.tf` mapa za foldere, zahtevani `AZURE_*` outputs in `azd-env-name` označevanje ter enak delovni tok `azd up` / `azd down` (zapira vrzel, kjer je bila navedena podpora za Terraform, a je bil prikazan le Bicep)
- **⚙️ Korak-po-korak GitHub Actions vodnik** v `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do avtomatiziranih deployov: `azd pipeline config`, OIDC federirane poverilnice (brez shranjenih skrivnosti), generiran `azure-dev.yml` in smernice o skrivnostih proti spremenljivkam
- **🪝 Uvod "Nov pri hook-ih?"** v `docs/chapter-04-infrastructure/deployment-guide.md` — kaj je hook, tabela faz hook-ov, minimalni prvi hook in zagon hook-ov ročno z `azd hooks run`
- **✅ Seznam "Preverite svoj deployment"** dodan v Koraku 5 v `docs/chapter-01-foundation/first-project.md` — smoke test, preverjanje health endpointa in eksplicitna merila uspeha
- **🧩 Razlaga za nove preview razširitve** `azure.ai.skills` in `azure.ai.connections` (kaj so in kdaj jih uporabiti) v `docs/chapter-08-production/production-ai-practices.md`

#### Spremenjeno
- **🧭 Tabela lekcij poglavja 5** popravljena: `multi-agent-basics.md` je sedaj Lekcija 1 (edina popolnoma praktična lekcija), z jasnim označevanjem, da Lekcija 2 živi v Poglavju 6 in da je Retail scenarij arhitekturna zasnova, ne ena ukazna predloga
- **🧭 Tabela lekcij poglavja 1** sedaj vključuje novo lekcijo "Bring Your Own App" (Lekcija 4)
- **🔗 Navigacijski nogi** posodobljeni: `first-project.md` sedaj povezuje naprej na `bring-your-own-app.md`

#### Popravljeno
- **🧱 Zaprta "trditev a manjkajoče" Terraform vrzel** — tečaj je prej skliceval podporo za Terraform brez prikaza le-te
- **🔀 Popravljene zavajajoče križne povezave v poglavju 5**, ki so nakazovale, da obstaja popolna implementacija več-agentov, ko je bila na voljo le arhitekturna zasnova

#### Datoteke posodobljene
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Osvežitev AZD 1.25.6, Celotni življenjski cikel agentov ukazi & Aspire rebranding
**Ta različica ponovno preveri tečaj glede na `azd` `1.25.6` (junij 2026) in razširitev `azure.ai.agents` `0.1.40-preview`, razširi AI smernice od "scaffold agenta" do popolnega življenjskega cikla agenta (test → evaluate → optimize → inspect → delete), izpostavi nove preview razširitve `azure.ai.skills` in `azure.ai.connections` ter zabeleži rebranding produkta ".NET Aspire" → "Aspire".**

#### Dodano
- **🔁 Pokritost celotnega življenjskega cikla agenta** za začetnike in AI inženirje po celotni dokumentaciji:
  - `docs/chapter-01-foundation/azd-basics.md` — tabela življenjskega cikla (scaffold → test → measure → improve → inspect → clean up) dodana v razdelek Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — nov odsek "Managing the Agent Lifecycle" pokriva `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
  - `resources/cheat-sheet.md` — razširjeni AI Agent ukazi z `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` in `delete --force`
- **🧩 Nove preview razširitve** dokumentirane: `azure.ai.skills` (ponovno uporabne agentove veščine) in `azure.ai.connections` (Foundry connections) dodane v tabelo razširitev in cheat sheet
- **⏱️ Navodila za čas odziva** — primeri `azd ai agent invoke` sedaj navajajo, da izpiše skupno latenco in time-to-first-byte
- **📌 Pasica z verzijo** v glavnem README, ki usmerja učeče k `azd version` in `azd upgrade`

#### Spremenjeno
- **✅ Osnova za validacijo posodobljena** iz `azd 1.23.12` (marec 2026) na `azd 1.25.6` (junij 2026) po vseh README-jih poglavij in delavnicah
- **🤖 Opomba o razširitvi v poglavju 2** posodobljena z `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Primer validacije delavnice** (`azd version` izhod) posodobljen na `1.25.6`
- **🧭 README "Kaj je novega v azd danes"** osvežen za poudarek end-to-end življenjskega cikla agenta, novih AI razširitev in nedavnih izboljšav uporabniške izkušnje (`azd init` idempotentnost, `azd auth login` čiščenje zastarelih tokenov, `azd tool` prvi zagon poziv)
- **📖 Poglavje 2 agents.md (Opcija 4)** sedaj usmerja učeče k ukazom življenjskega cikla po deployu namesto, da se ustavi pri `azd up`

#### Popravljeno
- **🏷️ Imenovanje produkta** — dodano obvestilo o rebrandingu Aspire (".NET Aspire" je zdaj preprosto "Aspire"); podpora azd za Aspire ostaja nespremenjena
- **🔎 Živa validacija izdaje** potrjena glede na Azure Developer CLI release feed: stabilni CLI `1.25.6` (2026-06-12) in `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Datoteke posodobljene
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
#### Začetno pojasnilo za uvajanje, preverjanje nastavitve in končno čiščenje AZD ukazov
**Ta različica nadaljuje preverjanje veljavnosti AZD 1.23 z dokumentacijskim pregledom, osredotočenim na začetnike: pojasni smernice glede avtentikacije z AZD kot prvim korakom, doda lokalne skripte za preverjanje nastavitve, preveri ključne ukaze proti živi AZD CLI in odstrani zadnje zastarele sklice na ukaze v angl. izvoru zunaj dnevnika sprememb.**

#### Dodano
- **🧪 Skripte za preverjanje začetne nastavitve** z `validate-setup.ps1` in `validate-setup.sh`, da lahko udeleženci preverijo zahtevana orodja pred začetkom Poglavja 1
- **✅ Koraki za preverjanje nastavitve vnaprej** v korenskem README in README poglavja 1, tako da se manjkajoče predpogoje zazna pred `azd up`

#### Spremenjeno
- **🔐 Smernice za avtentikacijo za začetnike** zdaj dosledno obravnavajo `azd auth login` kot primarno pot za AZD delovne tokove, `az login` pa je označen kot opcijski, razen če se neposredno uporabijo Azure CLI ukazi
- **📚 Uvodni potek Poglavja 1** zdaj usmeri udeležence, naj pred namestitvijo, prijavo in prvimi koraki nameščanja preverijo lokalno nastavitve
- **🛠️ Sporočila validatorja** zdaj jasno ločujejo zahtevane blokirajoče zahteve od opcijskih opozoril Azure CLI za pot, namenjen samo AZD začetnikom
- **📖 Konfiguracijska, odpravljanje napak in primeri dokumentacije** zdaj razlikujejo med zahtevano AZD avtentikacijo in opcijskim vpisom v Azure CLI, kjer sta bila prej predstavljena brez konteksta

#### Popravljeno
- **📋 Preostali sklici na ukaze iz angl. izvora** posodobljeni na trenutne oblike AZD, vključno z `azd config show` v cheat sheetu in `azd monitor --overview`, kjer je bil mišljeno navodilo za pregled v Azure portalu
- **🧭 Trditve za začetnike v Poglavju 1** omiljene, da se izognemo prevelikim obljubam glede zagotavljanja breznapak ali rollback vedenja za vse predloge in Azure vire
- **🔎 Validacija z živim CLI** potrdila trenutno podporo za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` in `azd down --force --purge`

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

#### AZD 1.23.12 Preverjanje, razširitev delavnicnega okolja in osvežitev modelov AI
**Ta različica izvede dokumentacijski pregled v primerjavi z `azd` `1.23.12`, posodobi zastarele primere ukazov AZD, osveži smernice za AI modele na trenutne privzete vrednosti in razširi navodila delavnic poleg GitHub Codespaces tudi za dev containerje in lokalne klone.**

#### Dodano
- **✅ Opombe o validaciji v jedrnih poglavjih in dokumentih delavnice** za jasno navedbo testirane AZD osnovne različice za udeležence, ki uporabljajo novejše ali starejše CLI izdaje
- **⏱️ Smernice za časovne omejitve nameščanja** za dolgotrajne nameščanja AI aplikacij z `azd deploy --timeout 1800`
- **🔎 Koraki za pregled razširitev** z `azd extension show azure.ai.agents` v dokumentaciji delovnega toka AI
- **🌐 Širše smernice za delavnico** vključujejo GitHub Codespaces, dev containerje in lokalne klone z MkDocs

#### Spremenjeno
- **📚 Uvodna README poglavij** zdaj dosledno omenjajo validacijo proti `azd 1.23.12` v poglavjih o osnovah, konfiguraciji, infrastrukturi, večagentnem, pred-namestitvi, odpravljanju napak in produkciji
- **🛠️ Sklici na AZD ukaze** posodobljeni na trenutne oblike po celotnih dokumentih:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ali `azd env get-value(s)` glede na kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`, kjer je mišljen pregled Application Insights
- **🧪 Primeri predogleda provisioninga** poenostavljeni na trenutno podprto rabo, kot je `azd provision --preview` in `azd provision --preview -e production`
- **🧭 Tok delavnice** posodobljen, da lahko udeleženci dokončajo laboratorije v Codespaces, dev containerju ali lokalnem klonu, namesto da bi predpostavljali izključno uporabo Codespaces
- **🔐 Smernice za avtentikacijo** sedaj dajejo prednost `azd auth login` za AZD delovne tokove, `az login` pa je postavljen kot opcijski, kadar se neposredno uporabljajo Azure CLI ukazi

#### Popravljeno
- **🪟 Windows namestitveni ukazi** normalizirani na trenutno rabo velike in male začetnice v `winget` v navodilih za namestitev
- **🐧 Navodila za Linux** popravljena, da se izognemo nepodprtim distribucijskim specifičnim navodilom za upravljanje paketov `azd` in namesto tega usmerimo na release artefakte, kjer je primerno
- **📦 Primeri modelov AI** osveženi iz starejših privzetih, kot so `gpt-35-turbo` in `text-embedding-ada-002`, na trenutne primere, kot so `gpt-4.1-mini`, `gpt-4.1` in `text-embedding-3-large`
- **📋 Izpiski za nameščanje in diagnostiko** popravljeni za rabo trenutnih ukazov za okolje in stanje v dnevnikih, skriptah in korakih za odpravljanje napak
- **⚙️ Navodila za GitHub Actions** posodobljena z `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Navodila za soglasje MCP/Copilot** posodobljena iz `azd mcp consent` v `azd copilot consent list`

#### Izboljšano
- **🧠 Poglavje o AI** zdaj bolje pojasnjuje predogledno občutljivo vedenje `azd ai`, vpis, specifičen za tenant, rabo razširitev in posodobljena priporočila za nameščanje modelov
- **🧪 Navodila delavnice** zdaj uporabljajo bolj realistične primere različic in jasnejši jezik za nastavitev okolja v praktičnih laboratorijih
- **📈 Dokumenti za produkcijo in odpravljanje napak** so zdaj bolj usklajeni s trenutnim nadzorom, nadomestnimi modeli in primeri cenovnih ravni

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

#### AZD AI CLI ukazi, preverjanje vsebine in razširitev predlog
**Ta različica doda pokritost ukazov `azd ai`, `azd extension` in `azd mcp` v vseh AI-povezanih poglavjih, popravi pokvarjene povezave in zastarelo kodo v agents.md, posodobi cheat sheet in prenovi razdelek Primeri predlog z verificiranimi opisi in novimi Azure AI AZD predlogami.**

#### Dodano
- **🤖 Pokritost AZD AI CLI** v 7 datotekah (prej le v Poglavju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova sekcija "Extensions and AI Commands", ki uvaja `azd extension`, `azd ai agent init` in `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s tabelo primerjave (predloga proti manifest pristopu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododdelka "AZD Extensions for Foundry" in "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Hitri začetek zdaj prikazuje poti nameščanja tako na podlagi predlog kot manifestov
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sekcija Deploy zdaj vključuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododdelek "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nova sekcija "AI & Extensions Commands" z `azd extension`, `azd ai agent init`, `azd mcp` in `azd infra generate`
- **📦 Nove AZD AI primerne predloge** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG klepet z Blazor WebAssembly, Semantic Kernel in podporo za glasovni klepet
  - **azure-search-openai-demo-java** — Java RAG klepet z uporabo Langchain4J z možnostmi namestitve na ACA/AKS
  - **contoso-creative-writer** — Večagentna aplikacija za ustvarjalno pisanje z uporabo Azure AI Agent Service, Bing Grounding in Prompty
  - **serverless-chat-langchainjs** — Serverless RAG z Azure Functions + LangChain.js + Cosmos DB in podporo lokalnega razvoja z Ollama
  - **chat-with-your-data-solution-accelerator** — Poslovni RAG pospeševalnik z upravno konzolo, Teams integracijo in možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Večagentna MCP orkestracijska referenčna aplikacija s strežniki v .NET, Python, Java in TypeScript
  - **azd-ai-starter** — Minimalna Bicep začetna predloga za Azure AI infrastrukturo
  - **🔗 Povezava na Awesome AZD AI galerijo** — Referenca na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ predlog)

#### Popravljeno
- **🔗 Navigacija v agents.md**: Povezavi Prejšnje/Naslednje zdaj ustrezata vrstnemu redu lekcij v README poglavja 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Pokvarjene povezave v agents.md**: `production-ai-practices.md` popravljeno v `../chapter-08-production/production-ai-practices.md` (3 pojavitve)
- **📦 Zastarela koda v agents.md**: `opencensus` zamenjan z `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neveljaven API v agents.md**: `max_tokens` premaknjen iz `create_agent()` v `create_run()` kot `max_completion_tokens`
- **🔢 Štetje tokenov v agents.md**: Namesto grobe ocene `len//4` uporabljen `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Popravljena storitvena raba iz "Cognitive Search + App Service" v "Azure AI Search + Azure Container Apps" (privzeti gostitelj spremenjen okt 2024)
- **contoso-chat**: Posodobljen opis, da se sklicuje na Azure AI Foundry + Prompty, v skladu s dejanskim naslovom in tehnologijo repozitorija

#### Odstranjeno
- **ai-document-processing**: Odstranjena referenca na nepoklicno predlogo (repozitorij ni javno dostopen kot AZD predloga)

#### Izboljšano
- **📝 Vaje v agents.md**: Vaja 1 sedaj prikazuje pričakovani izhod in korak `azd monitor`; Vaja 2 vključuje celotno kodo registracije `FunctionTool`; Vaja 3 zamenja nejasna navodila s konkretnimi ukazi `prepdocs.py`
- **📚 Viri v agents.md**: Posodobljene povezave na trenutne dokumente Azure AI Agent Service in hitri začetek
- **📋 Tabela Naslednji koraki v agents.md**: Dodana povezava na AI Workshop Lab za popolno pokritost poglavja

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
**Ta različica izboljša navigacijo poglavij v README.md z izboljšano tabelo.**

#### Spremenjeno
- **Course Map Table**: Izboljšana s neposrednimi povezavami do lekcij, ocenami trajanja in ocenami zahtevnosti
- **Folder Cleanup**: Odstranjene odveč stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Preverjenih je vseh 21+ notranjih povezav v tabeli Zemljevid tečaja

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodobi sklice na izdelke v skladu s trenutno Microsoftovo blagovno znamko.**

#### Spremenjeno
- **Microsoft Foundry → Microsoft Foundry**: Vsi sklici so bili posodobljeni v datotekah, ki niso prevodi
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno, da odraža trenutno blagovno znamko

#### Posodobljene datoteke
- `README.md` - Glavna vstopna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik po AI agentih
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Vstopna stran delavnice
- `workshop/docs/index.md` - Kazalo delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke z navodili delavnice

---

### [v3.15.0] - 2026-02-05

#### Obsežno prestrukturiranje repozitorija: imena map po poglavjih
**Ta različica preureja dokumentacijo v namensko razporejene mape po poglavjih za jasnejšo navigacijo.**

#### Preimenovanja map
Stare mape so bile zamenjane z mapami, označenimi s številkami poglavij:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 Chapter README files**: Ustvarjen README.md v vsaki mapi poglavja z:
  - Cilji učenja in trajanje
  - Tabela lekcij z opisi
  - Ukazi za hiter začetek
  - Navigacija do drugih poglavij

#### Spremenjeno
- **🔗 Posodobljene vse notranje povezave**: Posodobljenih 78+ poti v vseh dokumentacijskih datotekah
- **🗺️ Main README.md**: Posodobljen Zemljevid tečaja z novo strukturo poglavij
- **📝 examples/README.md**: Posodobljeni medsebojni sklici na mape poglavij

#### Odstranjeno
- Stara struktura map (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Prestrukturiranje repozitorija: navigacija po poglavjih
**Ta različica je dodala README datoteke za navigacijo po poglavjih (nadomeščeno z v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nov vodnik za AI agente
**Ta različica dodaja obsežen vodnik za nameščanje AI agentov z Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Celovit vodnik, ki zajema:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnikov
  - Tri predloge agentov za hiter začetek (Foundry Agents, Prompty, RAG)
  - Vzorce arhitekture agentov (en agent, RAG, večagentni)
  - Konfiguracija orodij in prilagajanje
  - Nadzor in spremljanje metrik
  - Upoštevanje stroškov in optimizacija
  - Pogosti scenariji odpravljanja težav
  - Tri praktične vaje z merili uspeha

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hiter začetek**: Namestite agente z `azd init --template get-started-with-ai-agents`
- **Arhitekturni vzorci**: Vizualni diagrami vzorcev agentov
- **Konfiguracija**: Nastavitev orodij in okoljske spremenljivke
- **Nadzor**: Integracija z Application Insights
- **Vaje**: Postopno praktično učenje (20-45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev okolja DevContainer
**Ta različica posodobi konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za izkušnjo učenja AZD.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljeno iz `python:3.12-bullseye` v `python:3.12-bookworm` (najnovejša stabilna različica Debiana)
- **📛 Ime kontejnerja**: Preimenovano iz "Python 3" v "AZD for Beginners" za jasnost

#### Dodano
- **🔧 Nove funkcije DevContainerja**:
  - `azure-cli` z omogočeno podporo za Bicep
  - `node:20` (LTS različica za AZD predloge)
  - `github-cli` za upravljanje predlog
  - `docker-in-docker` za nameščanje aplikacij v kontejnerjih

- **🔌 Port Forwarding**: Prednastavljeni porti za pogosto razvojno delo:
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
  - `DavidAnson.vscode-markdownlint` - Lintanje Markdowna
  - `bierner.markdown-mermaid` - Podpora za Mermaid diagrame
  - `redhat.vscode-yaml` - Podpora za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Zgodovina Gita

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Python interpreter, formatiranje ob shranjevanju in odstranjevanje odvečnih presledkov

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan vtičnik MkDocs minify
  - Dodan pre-commit za kakovost kode
  - Dodane Azure SDK knjižnice (azure-identity, azure-mgmt-resource)

#### Odpravljeno
- **Ukaz po ustvarjanju**: Zdaj preveri namestitev AZD in Azure CLI ob zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenova README za začetnike
**Ta različica pomembno izboljša README.md, da je bolj dostopen začetnikom, in doda ključne vire za AI razvijalce.**

#### Dodano
- **🆚 Primerjava Azure CLI in AZD**: Jasna razlaga, kdaj uporabiti vsako orodje z praktičnimi primeri
- **🌟 Odlični AZD povezave**: Neposredne povezave do galerije skupnostnih predlog in virov za prispevke:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predlog, pripravljenih za nameščanje
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Prispevki skupnosti
- **🎯 Vodnik za hiter začetek**: Poenostavljen 3-koračni oddelek za začetek (Namestitev → Prijava → Objava)
- **📊 Tabela navigacije glede na izkušnje**: Jasna navodila, kje začeti glede na izkušnje razvijalca

#### Spremenjeno
- **Struktura README**: Preurejena za postopno razkrivanje - najprej ključne informacije
- **Uvodni razdelek**: Preoblikovan, da razloži "The Magic of `azd up`" za popolne začetnike
- **Odstranjena podvojena vsebina**: Odstranjen podvojen razdelek o odpravljanju težav
- **Ukazi za odpravljanje težav**: Popravljena referenca `azd logs`, zamenjana z veljavnim `azd monitor --logs`

#### Odpravljeno
- **🔐 Ukazi za avtentikacijo**: Dodana `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Neveljavne reference ukazov**: Odstranjen preostali `azd logs` iz razdelka za odpravljanje težav v README

#### Opombe
- **Obseg**: Spremembe uporabljene v glavnem README.md in resources/cheat-sheet.md
- **Ciljna skupina**: Izboljšave namenjene razvijalcem, novim pri AZD

---

### [v3.10.0] - 2026-02-05

#### Posodobitev natančnosti ukazov Azure Developer CLI
**Ta različica popravlja neobstoječe ukaze AZD v dokumentaciji, s čimer zagotavlja, da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Odpravljeno
- **🔧 Odstranjeni neobstoječi ukazi AZD**: Celovita revizija in popravek neveljavnih ukazov:
  - `azd logs` (ne obstaja) → zamenjan z `azd monitor --logs` ali alternativami Azure CLI
  - `azd service` subcommands (ne obstajajo) → zamenjano z `azd show` in Azure CLI
  - `azd infra import/export/validate` (ne obstajajo) → odstranjeni ali zamenjani z veljavnimi alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (ne obstajajo) → odstranjene
  - `azd provision --what-if/--rollback` flags (ne obstajajo) → posodobljene za uporabo `--preview`
  - `azd config validate` (ne obstaja) → zamenjano z `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne obstajajo) → odstranjeni

- **📚 Datoteke posodobljene s popravki ukazov**:
  - `resources/cheat-sheet.md`: Obsežna prenova sklica ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije za rollback in nameščanje
  - `docs/troubleshooting/debugging.md`: Popravljeni razdelki za analizo dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi za odpravljanje težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljen razdelek za odpravljanje napak AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za nadzor
  - `docs/getting-started/first-project.md`: Posodobljeni primeri nadzora in odpravljanja napak
  - `docs/getting-started/installation.md`: Popravljeni primeri pomoči in različic
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za ogled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za odpravljanje napak agentov

#### Spremenjeno
- **Strategije povrnitve**: Dokumentacija posodobljena za uporabo vračanja sprememb prek Gita (AZD nima vgrajenega rollbacka)
- **Ogled dnevnikov**: Reference na `azd logs` zamenjane z `azd monitor --logs`, `azd monitor --live` in ukazi Azure CLI
- **Razdelek o zmogljivosti**: Odstranjene neobstoječe zastavice za vzporedno/inkrementalno nameščanje, podane veljavne alternative

#### Tehnični podatki
- **Veljavni AZD ukazi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavne zastavice azd monitor**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Preverjanje**: Ukazi preverjeni glede na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončanje delavnice in posodobitev kakovosti dokumentacije
**Ta različica dokonča interaktivne module delavnice, odpravi vse zlomljene povezave v dokumentaciji in izboljša splošno kakovost vsebine za AI razvijalce, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument smernic za prispevanje z:
  - Jasna navodila za prijavo težav in predlaganje sprememb
  - Standardi dokumentacije za novo vsebino
  - Smernice za primere kode in konvencije sporočil commit
  - Informacije o sodelovanju skupnosti

#### Dokončano
- **🎯 Workshop Module 7 (Wrap-up)**: Popolnoma dokončan zaključni modul z:
  - Celovit povzetek dosežkov delavnice
  - Odsek obvladanih ključnih konceptov, ki zajema AZD, predloge in Microsoft Foundry
  - Priporočila za nadaljevanje učne poti
  - Izzivne vaje delavnice z ocenami težavnosti
  - Povezave za povratne informacije skupnosti in podporo

- **📚 Workshop Module 3 (Deconstruct)**: Posodobljeni cilji učenja z:
  - Navodili za aktivacijo GitHub Copilot z MCP strežniki
  - Razumevanjem strukture map AZD predlog
  - Vzorci organizacije Infrastructure-as-Code (Bicep)
  - Navodili za praktično delavnico

- **🔧 Workshop Module 6 (Teardown)**: Dokončan z:
  - Cilji čiščenja virov in upravljanja stroškov
  - Uporabo `azd down` za varno odstranjevanje infrastrukture
  - Navodili za obnovitev mehko izbrisanih kognitivnih storitev
  - Dodatnimi predlogi za raziskovanje GitHub Copilot in Azure Portal

#### Popravljeno
- **🔗 Broken Link Fixes**: Odpravljeno več kot 15 prekinjenih notranjih dokumentacijskih povezav:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljene poti do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljene poti do ai-model-deployment.md in production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamenjan neobstoječi cicd-integration.md z deployment-guide.md
  - `examples/retail-scenario.md`: Popravljene poti do FAQ in vodnika za odpravljanje težav
  - `examples/container-app/microservices/README.md`: Popravljene poti do domače strani tečaja in vodnika za nameščanje
  - `resources/faq.md` in `resources/glossary.md`: Posodobljene sklice na poglavje AI
  - `course-outline.md`: Popravljeni sklici na priročnik za inštruktorje in AI delavnico

- **📅 Workshop Status Banner**: Posodobljeno iz "Under Construction" v aktivni status delavnice z datumom februar 2026

- **🔗 Workshop Navigation**: Popravljene prekinjene navigacijske povezave v workshop README.md, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Workshop Presentation**: Odstranjeno opozorilo "under construction", delavnica je zdaj dokončana in pripravljena za uporabo
- **Navigation Consistency**: Zagotovljeno, da imajo vsi moduli delavnice pravilno medmodulsko navigacijo
- **Learning Path References**: Posodobljeni medpoglavni sklici, da uporabljajo pravilne microsoft-foundry poti

#### Preverjeno
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so zaključeni s cilji učenja
- ✅ Navigacija med poglavji in moduli deluje pravilno
- ✅ Vsebina je primerna za AI razvijalce, ki uporabljajo Microsoft AZD
- ✅ Jezik in struktura prijazna začetnikom ohranjena
- ✅ CONTRIBUTING.md nudi jasna navodila za prispevke skupnosti

#### Tehnična implementacija
- **Link Validation**: Samodejni PowerShell skript je preveril vse .md notranje povezave
- **Content Audit**: Ročni pregled popolnosti delavnice in primernosti za začetnike
- **Navigation System**: Uporabljeni dosledni vzorci navigacije poglavij in modulov

#### Opombe
- **Scope**: Spremembe uporabljene samo v angleški dokumentaciji
- **Translations**: Mape s prevodi v tej izdaji niso posodobljene (samodejni prevod bo sinhroniziran kasneje)
- **Workshop Duration**: Celotna delavnica zdaj nudi 3-4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Spremljanje, varnost in vzorci več-agentnih sistemov
**Ta različica dodaja obsežne lekcije A-ranga o integraciji Application Insights, vzorcih avtentikacije in koordinaciji več agentov za produkcijske razmestitve.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Razmestitev, osredotočena na AZD, z avtomatskim zagotavljanjem virov
  - Celotne Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojeno telemetrijo (1,200+ vrstic)
  - Vzorci spremljanja AI/LLM (sledenje žetonom/stroškom Microsoft Foundry Models)
  - 6 Mermaid diagramov (arhitektura, distribuirano sledenje, potek telemetrije)
  - 3 praktične vaje (opozorila, nadzorne plošče, spremljanje AI)
  - Primeri Kusto poizvedb in strategije optimizacije stroškov
  - Pretakanje metrik v živo in odpravljanje napak v realnem času
  - 40-50 minut učenja z vzorci pripravljenimi za produkcijo

- **🔐 Lekcija o vzorcih avtentikacije in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci avtentikacije (connection strings, Key Vault, managed identity)
  - Celovite Bicep predloge infrastrukture za varne razmestitve
  - Koda aplikacije Node.js z integracijo Azure SDK
  - 3 celovite vaje (omogočanje managed identity, user-assigned identity, rotacija Key Vault)
  - Najboljše varnostne prakse in konfiguracije RBAC
  - Vodnik za odpravljanje težav in analiza stroškov
  - Produkcijsko pripravljeni vzorci avtentikacije brez gesla

- **🤖 Lekcija o vzorcih koordinacije več agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (zaporedni, vzporedni, hierarhični, na dogodke, konsenzus)
  - Popolna implementacija orkestrator storitve (Python/Flask, 1,500+ vrstic)
  - 3 specializirane implementacije agentov (Research, Writer, Editor)
  - Integracija Service Bus za vrstno obdelavo sporočil
  - Upravljanje stanja v Cosmos DB za distribuirane sisteme
  - 6 Mermaid diagramov, ki prikazujejo interakcije agentov
  - 3 napredne vaje (obravnava časovnih omejitev, logika ponovitev, circuit breaker)
  - Razčlenitev stroškov ($240-565/month) z optimizacijskimi strategijami
  - Integracija Application Insights za spremljanje

#### Izboljšano
- **Pre-deployment Chapter**: Poglavje pred razmestitvijo zdaj vključuje obsežne vzorce spremljanja in koordinacije
- **Getting Started Chapter**: Poglavje Začetek izboljšano s profesionalnimi vzorci avtentikacije
- **Production Readiness**: Popolno pokritje od varnosti do opazljivosti
- **Course Outline**: Posodobljeno za sklicevanje na nove lekcije v poglavjih 3 in 6

#### Spremenjeno
- **Learning Progression**: Boljša integracija varnosti in spremljanja skozi celoten tečaj
- **Documentation Quality**: Dosledni A-rangi standardi (95-97%) v novih lekcijah
- **Production Patterns**: Popolno end-to-end pokritje za razmestitve v podjetjih

#### Izboljšano
- **Developer Experience**: Jasna pot od razvoja do spremljanja v produkciji
- **Security Standards**: Profesionalni vzorci za avtentikacijo in upravljanje skrivnosti
- **Observability**: Popolna integracija Application Insights z AZD
- **AI Workloads**: Specializirano spremljanje za Microsoft Foundry Models in več-agentne sisteme

#### Preverjeno
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne odlomke)
- ✅ Mermaid diagrami za vizualno učenje (19 skupaj v 3 lekcijah)
- ✅ Praktične vaje z verifikacijskimi koraki (9 skupaj)
- ✅ Produkcijsko pripravljene Bicep predloge, razmestljive z `azd up`
- ✅ Analiza stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje težav in najboljše prakse
- ✅ Kontrolne točke znanja z verifikacijskimi ukazi

#### Rezultati ocenjevanja dokumentacije
- `docs/pre-deployment/application-insights.md`: - Celovit vodnik za spremljanje
- `docs/getting-started/authsecurity.md`: - Profesionalni varnostni vzorci
- `docs/pre-deployment/coordination-patterns.md`: - Napredne arhitekture več agentov
- `Overall New Content`: - Dosledni visoki standardi kakovosti

#### Tehnična implementacija
- **Application Insights**: Log Analytics + prilagojena telemetrija + distribuirano sledenje
- **Authentication**: Managed Identity + Key Vault + RBAC vzorci
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Monitoring**: Metrike v živo + Kusto poizvedbe + opozorila + nadzorne plošče
- **Cost Management**: Strategije vzorčenja, politike zadrževanja, kontrole proračuna

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Microsoft Foundry Models
**Ta različica izboljša kakovost dokumentacije po celotnem repozitoriju in doda popoln primer razmestitve Microsoft Foundry Models z gpt-4.1 klepetalnim vmesnikom.**

#### Dodano
- **🤖 Primer klepetalnega sistema Microsoft Foundry Models**: Popolna razmestitev gpt-4.1 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Microsoft Foundry Models (razmestitev modela gpt-4.1)
  - Python ukazni vmesnik za klepet z zgodovino pogovorov
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje uporabi žetonov in ocena stroškov
  - Omejevanje hitrosti in obravnava napak
  - Obsežen README z navodili za razmestitev (35-45 minut)
  - 11 datotek pripravljenih za produkcijo (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Vaje v dokumentaciji**: Dodane praktične vaje v vodnik za konfiguracijo:
  - Vaja 1: Konfiguracija za več okolij (15 minut)
  - Vaja 2: Praksa upravljanja skrivnosti (10 minut)
  - Jasna merila uspeha in verifikacijski koraki
- **✅ Verifikacija razmestitve**: Dodan odsek za preverjanje v vodnik za razmestitev:
  - Postopki preverjanja zdravja
  - Kontrolni seznam meril uspeha
  - Pričakovani izhodi za vse ukaze za razmestitev
  - Hiter referenčni vodnik za odpravljanje težav

#### Izboljšano
- **examples/README.md**: Posodobljen na kakovost A-ranga (93%):
  - azure-openai-chat dodan v vse ustrezne odseke
  - Posodobljeno število lokalnih primerov iz 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v hitri začetek za vmesne uporabnike
  - Dodano v odsek Microsoft Foundry predlog
  - Posodobljena primerjalna matrika in odseki za iskanje tehnologij
- **Kakovost dokumentacije**: Izboljšano B+ (87%) → A- (92%) v mapi docs:
  - Dodani pričakovani izhodi k ključnim primerom ukazov
  - Vključeni verifikacijski koraki za spremembe konfiguracije
  - Izboljšano praktično učenje s praktičnimi vajami

#### Spremenjeno
- **Learning Progression**: Boljša integracija AI primerov za vmesne učence
- **Documentation Structure**: Bolj izvedljive vaje z jasnimi rezultati
- **Verification Process**: Dodana eksplicitna merila uspeha v ključne delovne tokove

#### Izboljšano
- **Developer Experience**: Razmestitev Microsoft Foundry Models zdaj traja 35-45 minut (v primerjavi z 60-90 za kompleksne alternative)
- **Cost Transparency**: Jasne ocene stroškov ($50-200/month) za primer Microsoft Foundry Models
- **Learning Path**: AI razvijalci imajo jasen vstop z azure-openai-chat
- **Documentation Standards**: Dosledni pričakovani izhodi in verifikacijski koraki

#### Preverjeno
- ✅ Primer Microsoft Foundry Models popolnoma funkcionalen z `azd up`
- ✅ Vseh 11 implementacijskih datotek je sintaktično pravilnih
- ✅ Navodila v README se ujemajo z dejansko izkušnjo razmestitve
- ✅ Dokumentacijske povezave posodobljene na več kot 8 lokacijah
- ✅ Indeks primerov natančno odraža 4 lokalne primere
- ✅ Ni ponavljajočih se zunanjih povezav v tabelah
- ✅ Vsi sklici za navigacijo so pravilni

#### Tehnična implementacija
- Microsoft Foundry Models Architecture: gpt-4.1 + Key Vault + Container Apps vzorec
- Security: Managed Identity ready, skrivnosti v Key Vault
- Monitoring: Integracija Application Insights
- Cost Management: Sledenje žetonom in optimizacija uporabe
- Deployment: En ukaz `azd up` za popolno nastavitev

### [v3.6.0] - 2025-11-19

#### Večja posodobitev: Primeri razmestitve Container App
**Ta različica uvaja obsežne, za produkcijo primerne primere razmestitve kontejnerskih aplikacij z uporabo Azure Developer CLI (AZD), z vsemi dokumenti in integracijo v učni načrt.**

#### Dodano
- **🚀 Primeri Container App**: Novi lokalni primeri v `examples/container-app/`:
  - [Glavni vodnik](examples/container-app/README.md): Celovit pregled kontejneriziranih razmestitev, hiter začetek, produkcija in napredni vzorci
  - [Preprost Flask API](../../examples/container-app/simple-flask-api): Začetniku prijazen REST API z scale-to-zero, health probes, spremljanjem in odpravljanjem težav
  - [Arhitektura mikrostoritev](../../examples/container-app/microservices): Produkcijsko pripravna večstoritvena razmestitev (API Gateway, Product, Order, User, Notification), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, distribuirano sledenje, blue-green/canary razmestitev
- **Najboljše prakse**: Varnost, spremljanje, optimizacija stroškov in navodila CI/CD za obremenitve v kontejnerjih
- **Vzorcna koda**: Popoln `azure.yaml`, Bicep predloge in implementacije storitev v več jezikih (Python, Node.js, C#, Go)
- **Testiranje in odpravljanje težav**: End-to-end testni scenariji, ukazi za spremljanje, vodnik za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljen za predstavitev in povezavo z novimi primeri container app v razdelku "Local Examples - Container Applications"
- **examples/README.md**: Posodobljen za izpostavitev primerov container app, dodano v primerjalno matriko in posodobljene reference tehnologije/arhitekture
- **Course Outline & Study Guide**: Posodobljeno za sklicevanje na nove primere container app in vzorce razmestitve v ustreznih poglavjih

#### Preverjeno
- ✅ Vsi novi primeri razmestljivi z `azd up` in sledijo najboljšim praksam
- ✅ Dokumentacijske križne povezave in navigacija posodobljene
- ✅ Primeri pokrivajo scenarije od začetniških do naprednih, vključno s produkcijskimi mikroservisi

#### Opombe
- **Scope**: Le angleška dokumentacija in primeri
- **Next Steps**: Razširiti z dodatnimi naprednimi vzorci kontejnerjev in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 2025-11-19

#### Preimenovanje izdelka: Microsoft Foundry
**Ta različica izvaja obsežno spremembo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preoblikovanje Microsofta.**

#### Spremenjeno
- **🔄 Product Name Update**: Popolno preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljeni vsi sklici v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: 23 vsebinskih referenc posodobljenih v 7 datotekah dokumentacije

- **📁 Spremembe strukture map**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Vsi križni sklici posodobljeni, da odražajo novo strukturo map
  - Navigacijske povezave preverjene v celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Vse notranje povezave posodobljene, da se sklicujejo na novo ime datoteke

#### Posodobljene datoteke
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 posodobitve referenc imena produkta
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference posodobljene (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 križne reference posodobljene
  - `docs/getting-started/first-project.md` - 2 navigacijski povezavi poglavij posodobljeni
  - `docs/getting-started/installation.md` - 2 povezavi na naslednje poglavje posodobljeni
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference posodobljene (navigacija, Discord skupnost)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijska povezava posodobljena
  - `docs/troubleshooting/debugging.md` - 1 navigacijska povezava posodobljena

- **Datoteke strukture tečaja** (2 datoteki):
  - `README.md` - 17 referenc posodobljenih (pregled tečaja, naslovi poglavij, razdelek s predlogami, vpogledi skupnosti)
  - `course-outline.md` - 14 referenc posodobljenih (pregled, cilji učenja, viri poglavij)

#### Preverjeno
- ✅ Ni preostalih sklicev poti "ai-foundry" v angleških dokumentih
- ✅ Ni preostalih referenc produkta "Microsoft Foundry" v angleških dokumentih
- ✅ Vse navigacijske povezave delujejo z novo strukturo map
- ✅ Preimenovanja datotek in map uspešno zaključena
- ✅ Križni sklici med poglavji preverjeni

#### Opombe
- **Obseg**: Spremembe uporabljene samo za angleško dokumentacijo v mapi `docs/`
- **Prevodi**: Mape s prevodi (`translations/`) v tej različici niso posodobljene
- **Delavnica**: Materiali delavnice (`workshop/`) v tej različici niso posodobljeni
- **Primeri**: Primeri datotek lahko še vedno vsebujejo sklice na staro poimenovanje (bodo urejeni v prihodnji posodobitvi)
- **Zunanje povezave**: Zunanji URL-ji in sklici na GitHub repozitorij ostajajo nespremenjeni

#### Vodnik za migracijo za prispevkarje
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite sklice map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite sklice datotek: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime produkta: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje povezave v dokumentaciji še delujejo

---

### [v3.4.0] - 2025-10-24

#### Izboljšave predogleda in preverjanja infrastrukture
**Ta različica uvaja obsežno podporo za novo predogledno funkcijo Azure Developer CLI in izboljšuje uporabniško izkušnjo delavnice.**

#### Dodano
- **🧪 azd provision --preview dokumentacija funkcije**: Obsežno pokritje nove zmožnosti predogleda infrastrukture
  - Referenca ukaza in primeri uporabe v pregledu ukazov
  - Podrobna integracija v vodnik za zagotavljanje infrastrukture z use-cases in prednostmi
  - Integracija predletnega preverjanja za varnejšo validacijo razmestitev
  - Posodobitve vodnika za začetek z varnostno usmerjenimi praksami razmestitve
- **🚧 Pasica statusa delavnice**: Profesionalna HTML pasica, ki označuje razvojni status delavnice
  - Gradientni dizajn z indikatorji gradnje za jasno komunikacijo uporabnikom
  - Časovni žig zadnje posodobitve za preglednost
  - Mobilno odziven dizajn za vse vrste naprav

#### Izboljšano
- **Varnost infrastrukture**: Funkcionalnost predogleda integrirana skozi dokumentacijo razmestitve
- **Pred-validacija pred razmestitvijo**: Avtomatizirani skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Delavniški potek dela razvijalca**: Posodobljeni zaporedji ukazov vključujejo predogled kot priporočeno prakso
- **Izkušnja delavnice**: Uporabnikom so jasna pričakovanja glede razvojnega statusa vsebine

#### Spremembe
- **Prakse razmestitve**: Priporočeno delovno zaporedje z osredotočenostjo na predogled
- **Tok dokumentacije**: Validacija infrastrukture premaknjena prej v proces učenja
- **Predstavitev delavnice**: Profesionalna komunikacija statusa z jasnim časovnim načrtom razvoja

#### Izboljšano
- **Pristop z varnostjo v ospredju**: Spremembe infrastrukture je zdaj mogoče validirati pred razmestitvijo
- **Sodelovanje ekipe**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred zagotavljanjem
- **Zmanjšanje tveganj**: Manj neuspelih razmestitev z vnaprejšnjo validacijo

#### Tehnična implementacija
- **Integracija v več dokumentov**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorec ukazov**: Konsistentna sintaksa in primeri skozi dokumentacijo
- **Integracija najboljših praks**: Predogled vključen v poteke preverjanja in skripte
- **Vizualni indikatorji**: Jasne oznake NOVE funkcije za lažjo odkritnost

#### Infrastruktura delavnice
- **Komunikacija statusa**: Profesionalna HTML pasica z gradientnim slogom
- **Uporabniška izkušnja**: Jasno sporočanje razvojnega statusa preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja verodostojnost repozitorija, hkrati pa postavlja pričakovanja
- **Preglednost časovnice**: Časovni žig zadnje posodobitve oktober 2025 za odgovornost

### [v3.3.0] - 2025-09-24

#### Izboljšani materiali delavnice in interaktivna učna izkušnja
**Ta različica uvaja obsežne materiale delavnice z vodniki, ki delujejo v brskalniku, in strukturiranimi učnimi potmi.**

#### Dodano
- **🎥 Interaktivni vodič delavnice**: Izkušnja delavnice v brskalniku z možnostjo predogleda v MkDocs
- **📝 Strukturirana navodila delavnice**: 7-stopenjska vodena učna pot od odkritja do prilagoditve
  - 0-Introduction: Pregled delavnice in nastavitev
  - 1-Select-AI-Template: Odkritje in postopek izbire predloge
  - 2-Validate-AI-Template: Postopki razmestitve in validacije
  - 3-Deconstruct-AI-Template: Razumevanje arhitekture predloge
  - 4-Configure-AI-Template: Konfiguracija in prilagoditve
  - 5-Customize-AI-Template: Napredne spremembe in iteracije
  - 6-Teardown-Infrastructure: Čiščenje in upravljanje virov
  - 7-Wrap-up: Povzetek in naslednji koraki
- **🛠️ Orodja za delavnico**: Konfiguracija MkDocs z Material temo za izboljšano učilno izkušnjo
- **🎯 Praktična učna pot**: 3-stopenjska metodologija (Odkritje → Razmestitev → Prilagoditev)
- **📱 Integracija GitHub Codespaces**: Brezhibna nastavitev razvojnega okolja

#### Izboljšano
- **AI Workshop Lab**: Razširjen z obsežno 2–3 urni strukturirano učna izkušnjo
- **Dokumentacija delavnice**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Napredovanje učenja**: Jasna navodila korak za korakom od izbire predloge do razmestitve v produkcijo
- **Izkušnja razvijalca**: Integrirana orodja za optimizirane delovne tokove razvoja

#### Izboljšave
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, možnostjo kopiranja in preklopom teme
- **Učenje v lastnem tempu**: Fleksibilna struktura delavnice, ki ustreza različnim hitrostim učenja
- **Praktična uporaba**: Scenariji razmestitve AI predlog v realnem svetu
- **Integracija skupnosti**: Povezava z Discordom za podporo delavnice in sodelovanje

#### Značilnosti delavnice
- **Vgrajeno iskanje**: Hitro iskanje ključnih besed in lekcij
- **Kopiraj bloke kode**: Funkcija kopiranja ob premiku kazalca za vse primere kode
- **Preklop teme**: Podpora temam temno/svetlo glede na preference
- **Vizualna gradiva**: Posnetki zaslona in diagrami za boljše razumevanje
- **Integrirana pomoč**: Neposreden dostop do Discord skupnosti za podporo

### [v3.2.0] - 2025-09-17

#### Velika prerazporeditev navigacije in sistem učenja na osnovi poglavij
**Ta različica uvaja celovit sistem učenja, razdeljen na poglavja, z izboljšano navigacijo po celotnem repozitoriju.**

#### Dodano
- **📚 Sistem učenja po poglavjih**: Celovita prerazporeditev tečaja v 8 progresivnih učnih poglavij
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Celovit navigacijski sistem**: Dosledni navigacijski glavi in noge na vseh straneh dokumentacije
- **🎯 Spremljanje napredka**: Preverjalni seznam za dokončanje tečaja in sistem preverjanja znanja
- **🗺️ Vodenje učne poti**: Jasne vstopne točke za različne ravni izkušenj in cilje
- **🔗 Križno-navigacijski sklici**: Sorodna poglavja in predpogoji jasno povezani

#### Izboljšano
- **Struktura README**: Preoblikovana v strukturirano učno platformo z organizacijo po poglavjih
- **Navigacija dokumentacije**: Vsaka stran zdaj vključuje kontekst poglavja in napotke za napredovanje
- **Organizacija predlog**: Primeri in predloge preslikane na ustrezna učna poglavja
- **Integracija virov**: Preproste liste, pogosta vprašanja in učni vodniki povezani s sorodnimi poglavji
- **Integracija delavnic**: Laboratoriji preslikani na več učnih ciljev poglavij

#### Spremembe
- **Napredovanje učenja**: Prehod iz linearne dokumentacije na fleksibilno organizacijo po poglavjih
- **Postavitev konfiguracije**: Vodnik za konfiguracijo premaknjen kot Chapter 3 za boljši potek učenja
- **Integracija vsebine AI**: Boljša vgradnja AI-specifične vsebine skozi celotno učno pot
- **Vsebina za produkcijo**: Napredni vzorci združeni v Chapter 8 za podjetniške učence

#### Izboljšano
- **Uporabniška izkušnja**: Jasne navigacijske drobtinice in indikatorji napredka po poglavjih
- **Dostopnost**: Dosledni navigacijski vzorci za lažje premikanje po tečaju
- **Profesionalna predstavitev**: Struktura v stilu univerze, primerna za akademsko in korporativno izobraževanje
- **Učinkovitost učenja**: Skrajšan čas iskanja relevantne vsebine z izboljšano organizacijo

#### Tehnična implementacija
- **Navigacijski glavi**: Standardizirana poglavna navigacija v več kot 40 dokumentacijskih datotekah
- **Noga z navigacijo**: Dosledne smernice napredovanja in indikatorji dokončanja poglavij
- **Križno povezovanje**: Celovit sistem notranjih povezav, ki povezuje sorodne koncepte
- **Preslikava poglavij**: Predloge in primeri jasno povezani s cilji učenja

#### Izboljšave učnega vodnika
- **📚 Celoviti cilji učenja**: Prestrukturiran učni vodnik, usklajen z 8-poglavnim sistemom
- **🎯 Ocenjevanje po poglavjih**: Vsako poglavje vključuje specifične cilje učenja in praktične vaje
- **📋 Spremljanje napredka**: Tedenski urnik učenja z merljivimi rezultati in kontrolnimi seznami
- **❓ Vprašanja za preverjanje znanja**: Vprašanji za validacijo znanja v vsakem poglavju s profesionalnimi rezultati
- **🛠️ Praktične vaje**: Praktične aktivnosti z resničnimi scenariji razmestitve in odpravljanja napak
- **📊 Napredovanje veščin**: Jasno napredovanje od osnovnih konceptov do podjetniških vzorcev z osredotočenostjo na karierni razvoj
- **🎓 Okvir za certifikacijo**: Izidi strokovnega razvoja in priznanja skupnosti
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 2025-09-17

#### Izboljšane rešitve za večagentni AI
**Ta različica izboljšuje večagentno maloprodajno rešitev z boljšim poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremembe
- **Terminologija večagentnih rešitev**: Zamenjan "Cora agent" z "Customer agent" v celotni maloprodajni večagentni rešitvi za boljše razumevanje
- **Arhitektura agentov**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode za uporabo enotnega poimenovanja "Customer agent"
- **Primeri konfiguracije**: Modernizirani vzorci konfiguracije agentov z novimi konvencijami poimenovanja
- **Konsistentnost v dokumentaciji**: Zagotovljeno, da vse reference uporabljajo profesionalna, opisna imena agentov

#### Izboljšano
- **Paket ARM predlog**: Posodobljen retail-multiagent-arm-template z referencami na Customer agent
- **Arhitekturni diagrami**: Osveženi Mermaid diagrami z novim poimenovanjem agentov
- **Primeri kode**: Python razredi in primeri implementacije zdaj uporabljajo CustomerAgent poimenovanje
- **Spremenljivke okolja**: Posodobljeni vsi skripti za razmestitev, da uporabljajo CUSTOMER_AGENT_NAME konvencijo

#### Izboljšave
- **Izkušnja razvijalca**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za produkcijo**: Boljše usklajevanje s podjetniškimi konvencijami poimenovanja
- **Učni materiali**: Intuitivnejše poimenovanje agentov za izobraževalne namene
- **Uporabnost predlog**: Poenostavljeno razumevanje funkcij agentov in vzorcev razmestitve

#### Tehnični podatki
- Posodobljeni Mermaid arhitekturni diagrami z referencami na CustomerAgent
- Zamenjana imena razredov CoraAgent z CustomerAgent v primerih za Python
- Spremenjene JSON konfiguracije ARM predlog za uporabo tipa agenta "customer"
- Posodobljene okoljske spremenljivke iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osveženi vsi ukazi za razmestitev in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Velike spremembe - Poudarek na AI razvijalcih in integracija z Microsoft Foundry
**Ta različica preoblikuje repozitorij v celovit učni vir, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Dodano
- **🤖 AI-First učna pot**: Popolna prestrukturiranost s poudarkom na AI razvijalcih in inženirjih
- **Microsoft Foundry Integration Guide**: Celovita dokumentacija za povezovanje AZD s storitvami Microsoft Foundry
- **Vzorci za razmestitev AI modelov**: Podroben vodič, ki pokriva izbor modela, konfiguracijo in strategije razmestitve v produkcijo
- **AI Workshop Lab**: 2-3-urna praktična delavnica za pretvorbo AI aplikacij v rešitve, nameščene z AZD
- **Production AI Best Practices**: Vzorci za produkcijsko uporabo, pripravljeni za podjetja, za skaliranje, nadzor in zavarovanje AI delovnih obremenitev
- **AI-Specific Troubleshooting Guide**: Celovit vodič za odpravljanje težav za Microsoft Foundry modele, Cognitive Services in težave pri nameščanju AI
- **AI Template Gallery**: Izpostavljena zbirka Microsoft Foundry predlog s ocenami zahtevnosti
- **Workshop Materials**: Popolna struktura delavnice z laboratorijskimi vajami in referenčnimi gradivi

#### Izboljšano
- **README Structure**: Osredotočeno na AI razvijalce z 45% podatkov o zanimanju skupnosti iz Microsoft Foundry Discord
- **Learning Paths**: Namenjena pot razvoja AI razvijalca poleg tradicionalnih poti za študente in DevOps inženirje
- **Template Recommendations**: Izpostavljene AI predloge vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Community Integration**: Izboljšana podpora skupnosti na Discordu z AI-specifičnimi kanali in razpravami

#### Varnost & Fokus na produkcijo
- **Managed Identity Patterns**: AI-specifične konfiguracije overjanja in varnosti
- **Cost Optimization**: Sledenje uporabi tokenov in kontrola proračuna za AI delovne obremenitve
- **Multi-Region Deployment**: Strategije za globalno nameščanje AI aplikacij
- **Performance Monitoring**: AI-specifične meritve in integracija z Application Insights

#### Kakovost dokumentacije
- **Linear Course Structure**: Logična progresija od začetnega do naprednega na področju nameščanja AI
- **Validated URLs**: Vse zunanje povezave do repozitorijev preverjene in dostopne
- **Complete Reference**: Vse notranje povezave v dokumentaciji preverjene in funkcionalne
- **Production Ready**: Vzorci za nameščanje v produkcijo z realnimi primeri

### [v2.0.0] - 2025-09-09

#### Glavne spremembe - Prestrukturiranje repozitorija in profesionalna izboljšava
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebine.**

#### Dodano
- **Structured Learning Framework**: Vse dokumentacijske strani zdaj vključujejo odseke Introduction, Learning Goals in Learning Outcomes
- **Navigation System**: Dodane povezave Prejšnja/Naslednja lekcija po vsej dokumentaciji za vodeno napredovanje pri učenju
- **Study Guide**: Celovit study-guide.md z učnimi cilji, praktičnimi vajami in materiali za ocenjevanje
- **Professional Presentation**: Odstranjene vse ikone emoji za izboljšano dostopnost in bolj profesionalen videz
- **Enhanced Content Structure**: Izboljšana organizacija in potek gradiv za učenje

#### Spremenjeno
- **Documentation Format**: Standardizirana vsa dokumentacija z dosledno strukturo osredotočeno na učenje
- **Navigation Flow**: Implementirana logična progresija skozi vsa učna gradiva
- **Content Presentation**: Odstranjeni dekorativni elementi v prid jasni, profesionalni postavitvi
- **Link Structure**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Accessibility**: Odstranjene odvisnosti od emoji za boljšo združljivost z bralniki zaslona
- **Professional Appearance**: Čista, akademska predstavitev primerna za učno okolje podjetij
- **Learning Experience**: Strukturiran pristop s jasnimi cilji in izidi učenja za vsako lekcijo
- **Content Organization**: Boljši logični potek in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Začetna izdaja - Celovit AZD učni repozitorij

#### Dodano
- **Core Documentation Structure**
  - Celovita serija vodnikov za začetek
  - Celovita dokumentacija za nameščanje in zagotavljanje virov
  - Podrobni viri za odpravljanje težav in vodniki za razhroščevanje
  - Orodja in postopki za preverjanje pred namestitvijo

- **Getting Started Module**
  - AZD Basics: Temeljni pojmi in terminologija
  - Installation Guide: Navodila za nastavitev, specifična za platformo
  - Configuration Guide: Nastavitev okolja in overjanje
  - First Project Tutorial: Korak za korakom praktično učenje

- **Deployment and Provisioning Module**
  - Deployment Guide: Celovita dokumentacija delovnega toka nameščanja
  - Provisioning Guide: Infrastructure as Code z Bicep
  - Najboljše prakse za produkcijska nameščanja
  - Vzorci arhitekture z več storitvami

- **Pre-deployment Validation Module**
  - Capacity Planning: Preverjanje razpoložljivosti Azure virov
  - SKU Selection: Celovita navodila za izbiro storitvene ravni
  - Pre-flight Checks: Avtomatizirani skripti za preverjanje (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Troubleshooting Module**
  - Common Issues: Pogoste težave in rešitve
  - Debugging Guide: Sistematične metodologije odpravljanja napak
  - Napredne diagnostične tehnike in orodja
  - Nadzor zmogljivosti in optimizacija

- **Resources and References**
  - Hitri priročnik za ukaze
  - Besednjak: Celovite definicije terminologije in kratic
  - FAQ: Podrobni odgovori na pogosta vprašanja
  - Povezave na zunanje vire in povezave skupnosti

- **Examples and Templates**
  - Primer preproste spletne aplikacije
  - Predloga za nameščanje statične spletne strani
  - Konfiguracija kontejnerske aplikacije
  - Vzorec integracije podatkovnih baz
  - Primera arhitekture mikrostoritev
  - Implementacije brezstrežnih funkcij

#### Funkcije
- **Multi-Platform Support**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Multiple Skill Levels**: Vsebine zasnovane za študente do profesionalnih razvijalcev
- **Practical Focus**: Praktični primeri in realni scenariji
- **Comprehensive Coverage**: Od osnovnih pojmov do naprednih vzorcev za podjetja
- **Security-First Approach**: Vgrajene varnostne najboljše prakse
- **Cost Optimization**: Navodila za stroškovno učinkovite namestitve in upravljanje virov

#### Kakovost dokumentacije
- **Detailed Code Examples**: Praktični, preizkušeni primeri kode
- **Step-by-Step Instructions**: Jasna, izvedljiva navodila
- **Comprehensive Error Handling**: Odpravljanje pogostih težav
- **Best Practices Integration**: Industrijski standardi in priporočila
- **Version Compatibility**: Posodobljeno z najnovejšimi Azure storitvami in funkcijami azd

## Načrtovane prihodnje izboljšave

### Različica 3.1.0 (Načrtovano)
#### Razširitev AI platforme
- **Multi-Model Support**: Vzorce integracije za Hugging Face, Azure Machine Learning in lastne modele
- **AI Agent Frameworks**: Predloge za implementacije LangChain, Semantic Kernel in AutoGen
- **Advanced RAG Patterns**: Opcije vektorskih podatkovnih baz onkraj Azure AI Search (Pinecone, Weaviate itd.)
- **AI Observability**: Izboljšan nadzor za zmogljivost modelov, uporabo tokenov in kakovost odgovorov

#### Izkušnja razvijalca
- **VS Code Extension**: Integrirana razvojna izkušnja AZD + Microsoft Foundry v VS Code
- **GitHub Copilot Integration**: AI-podprto ustvarjanje AZD predlog
- **Interactive Tutorials**: Praktične vaje za kodiranje z avtomatizirano validacijo za AI scenarije
- **Video Content**: Dopolnilni video vodiči za vizualne učence, osredotočeni na nameščanje AI

### Različica 4.0.0 (Načrtovano)
#### Podjetniški AI vzorci
- **Governance Framework**: Upravljanje modelov AI, skladnost in revizijske sledi
- **Multi-Tenant AI**: Vzorci za serviranje več strank z izoliranimi AI storitvami
- **Edge AI Deployment**: Integracija z Azure IoT Edge in kontejnerskimi primeri
- **Hybrid Cloud AI**: Vzorci za večoblačno in hibridno nameščanje AI delovnih obremenitev

#### Napredne funkcije
- **AI Pipeline Automation**: Integracija MLOps z Azure Machine Learning pipelini
- **Advanced Security**: Zero-trust vzorci, zasebni končni točki in napredna zaščita pred grožnjami
- **Performance Optimization**: Napredno nastavitev in strategije skaliranja za visoko-pretočne AI aplikacije
- **Global Distribution**: Vzorci za dostavo vsebin in predpomnjenje na robu za AI aplikacije

### Različica 3.0.0 (Načrtovano) - Nadomeščeno s trenutno izdajo
#### Predlagane dopolnitve - zdaj izvedene v v3.0.0
- ✅ **AI-Focused Content**: Celovita Microsoft Foundry integracija (Dokončeno)
- ✅ **Interactive Tutorials**: Praktična AI delavnica lab (Dokončeno)
- ✅ **Advanced Security Module**: AI-specifični varnostni vzorci (Dokončeno)
- ✅ **Performance Optimization**: Strategije za nastavitev AI delovnih obremenitev (Dokončeno)

### Različica 2.1.0 (Načrtovano) - Delno izvedeno v v3.0.0
#### Manjše izboljšave - Nekatere dokončane v trenutni izdaji
- ✅ **Additional Examples**: Scenariji nameščanja osredotočeni na AI (Dokončeno)
- ✅ **Extended FAQ**: AI-specifična vprašanja in odpravljanje težav (Dokončeno)
- **Tool Integration**: Izboljšani vodiči za integracijo IDE in urejevalnikov
- ✅ **Monitoring Expansion**: AI-specifični vzorci za nadzor in opozarjanje (Dokončeno)

#### Še vedno načrtovano za prihodnjo izdajo
- **Mobile-Friendly Documentation**: Reagibilna zasnova za učenje na mobilnih napravah
- **Offline Access**: Paketi dokumentacije za prenos
- **Enhanced IDE Integration**: Razširitev VS Code za AZD + AI delovne tokove
- **Community Dashboard**: Realnočasni metrični podatki skupnosti in spremljanje prispevkov

## Prispevanje v dnevnik sprememb

### Poročanje o spremembah
Ko prispevate v ta repozitorij, prosimo zagotovite, da vnosi v dnevnik sprememb vključujejo:

1. **Version Number**: V skladu s semantičnim verzioniranjem (major.minor.patch)
2. **Date**: Datum izdaje ali posodobitve v formatu YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Jedrnat opis spremembe
5. **Impact Assessment**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcije, razdelki v dokumentaciji ali zmožnosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripti ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebine ali organizacije

#### Zastarelo
- Funkcije ali pristopi, ki se postopoma ukinjajo
- Razdelki dokumentacije, načrtovani za odstranitev
- Metode, za katere obstajajo boljše alternative

#### Odstranjeno
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali pristopi, ki so odpravljeni
- Podvojena ali konsolidirana vsebina

#### Popravljeno
- Popravki napak v dokumentaciji ali kodi
- Reševanje prijavljenih težav
- Izboljšave natančnosti ali funkcionalnosti

#### Varnost
- Izboljšave ali popravki, povezani z varnostjo
- Posodobitve najboljših praks glede varnosti
- Reševanje ranljivosti

### Smernice semantičnega verzioniranja

#### Glavna različica (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrep uporabnika
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spremenijo temeljni pristop ali metodologijo

#### Minor različica (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost nazaj
- Dodatni primeri, orodja ali viri

#### Patch različica (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Pojasnila in manjše dopolnitve

## Povratne informacije skupnosti in predlogi

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:

### Kako podati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (AI-specifična vprašanja so dobrodošla)
- **Discord Discussions**: Delite ideje in sodelujte z Microsoft Foundry skupnostjo
- **Pull Requests**: Neposredno prispevajte izboljšave vsebine, zlasti AI predlog in vodičev
- **Microsoft Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Community Forums**: Sodelujte v širših razpravah med razvijalci Azure

### Kategorije povratnih informacij
- **AI Content Accuracy**: Popravki glede integracije AI storitev in informacij o nameščanju
- **Learning Experience**: Predlogi za izboljšanje učne poti za AI razvijalce
- **Missing AI Content**: Zahteve za dodatne AI predloge, vzorce ali primere
- **Accessibility**: Izboljšave za različne potrebe učenja
- **AI Tool Integration**: Predlogi za boljšo integracijo orodij pri razvoju AI
- **Production AI Patterns**: Zahteve za vzorce nameščanja AI v podjetjih

### Zaveza glede odziva
- **Issue Response**: V roku 48 ur za prijavljene probleme
- **Feature Requests**: Pregled v enem tednu
- **Community Contributions**: Pregled v enem tednu
- **Security Issues**: Neposredna prioriteta z pospešenim odzivom

## Načrt vzdrževanja

### Redne posodobitve
- **Monthly Reviews**: Pregledi točnosti vsebine in validacija povezav
- **Quarterly Updates**: Večje dodatke vsebin in izboljšave
- **Semi-Annual Reviews**: Celovita prestrukturiranja in izboljšave
- **Annual Releases**: Večje izdaje z pomembnimi izboljšavami

### Nadzor in zagotavljanje kakovosti
- **Automated Testing**: Redna validacija primerov kode in povezav
- **Community Feedback Integration**: Redno vključevanje predlogov uporabnikov
- **Technology Updates**: Prilagajanje najnovejšim Azure storitvam in izdajam azd
- **Accessibility Audits**: Redni pregledi za vključujoče oblikovanje

## Politika podpore različic

### Podpora za trenutno različico
- **Latest Major Version**: Polna podpora z rednimi posodobitvami
- **Previous Major Version**: Varnostne posodobitve in kritični popravki 12 mesecev
- **Legacy Versions**: Podpora skupnosti, brez uradnih posodobitev

### Smernice za migracijo
Ko so izdane glavne različice, nudimo:
- **Migration Guides**: Korak-po-korak navodila za prehod
- **Compatibility Notes**: Podrobnosti o prelomnih spremembah
- **Tool Support**: Skripti ali pripomočki za pomoč pri migraciji
- **Community Support**: Namenjene forume za vprašanja o migraciji

---

**Navigation**
- **Previous Lesson**: [Študijski vodnik](resources/study-guide.md)
- **Next Lesson**: Return to [Glavni README](README.md)

**Stay Updated**: Spremljajte ta repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
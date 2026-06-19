# Changelog - AZD For Beginners

## Introduction

Tämä changelog dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD For Beginners -repositoryyn. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään, mitä versioiden välillä on muuttunut.

## Learning Goals

Käymällä tätä changelogia läpi, sinä:
- Pysyt ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärrät olemassa olevan dokumentaation parannukset
- Seuraat bugikorjauksia ja korjauksia varmistaaksesi tarkkuuden
- Seuraat oppimateriaalien kehitystä ajan myötä

## Learning Outcomes

Changelog-merkintöjen läpikäynnin jälkeen pystyt:
- Tunnistamaan uutta sisältöä ja oppimateriaaleja
- Ymmärtämään, mitä osioita on päivitetty tai parannettu
- Suunnittelemaan oppimispolkusi ajantasaisen materiaalin perusteella
- Antamaan palautetta ja ehdotuksia tulevia parannuksia varten

## Version History

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Tämä versio sulkee azd-coverage-analyysin esiin tuomat jäljellä olevat keskitasoiset aukot: miten kirjoittaa ja julkaista oma template, toistettavat dev-container-/Codespaces-ympäristöt, Pulumi-infrastruktuuritoimittaja, Azure DevOps CI/CD -läpipääsy, service-principal -todennus, isäntäkohdan valintaohjeistus (AKS/Spring Apps), `azd restore`/`azd package` -selitykset, hook-virheenkäsittely ja tiimi-/jaetut-ympäristökäytännöt.**

#### Lisätty
- **🧱 Uusi Luku 4 -oppitunti** `docs/chapter-04-infrastructure/custom-templates.md` — oman azd-templaten kirjoittaminen: vaadittu rakenne (`azure.yaml`, `infra/`, `src/`), `metadata.template` -kenttä, infrastruktuurin parametrisointi `uniqueString()`-resurssitunnuksella ja `azd-env-name`-tagilla, paikallinen testaus `azd init --template <local-path>` -komennolla, julkaisu GitHubiin ja lähettäminen Awesome AZD -galleriaan
- **📦 Uusi Luku 1 -oppitunti** `docs/chapter-01-foundation/dev-containers.md` — toistettavat azd-ympäristöt Dev Containersilla ja GitHub Codespacesilla: minimaalinen `.devcontainer/devcontainer.json` joka käyttää virallista `ghcr.io/azure/azure-dev/azd` -ominaisuutta, kielikohtaiset ominaisuudet, `docker-in-docker` konttien isännille ja `azd auth login --use-device-code` etäkirjautumiseen
- **🧩 Pulumi with azd** -osio tiedostossa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-kansion rakenne, stackit kartoitettuna azd-ympäristöihin, vaaditut outputs/taggaus ja identtinen `azd up` / `azd down` -työnkulku
- **🎯 Isäntäkohdan valintaohjeistus** tiedostossa `docs/chapter-04-infrastructure/provisioning.md` — aloittelijaystävällinen vertailu `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ja `springapp` välillä sekä ohjeistus milloin valita AKS tai Azure Spring Apps
- **🛠️ Azure DevOps CI/CD -läpikäynti** tiedostossa `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection workload identity federationilla (OIDC), generoitu `azure-dev.yml` ja variable-group -asetukset
- **🔑 Service Principals (Pattern 4)** lisätty tiedostoon `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ei-interaktiivinen `azd auth login` client secretin vs. federoidun/OIDC-todennuksen kanssa, milloin käyttää ja turvallinen tunnistetietojen tallennus
- **🪝 Hook-virheenkäsittely** alakappale tiedostossa `docs/chapter-04-infrastructure/deployment-guide.md` — exit-koodit ja `set -e`, `continueOnError`, hookien testaaminen erillään `azd hooks run` -komennolla, käyttöjärjestelmäkohtaiset shellit ja `--debug`
- **👥 Tiimi / jaetut ympäristöt** -osio tiedostossa `docs/chapter-03-configuration/configuration.md` — mitä sijaitsee `.azure/`-kansiossa, mitä gitignoretaan, kehittäjäkohtaiset ympäristöt, `azd env list`/`select` ja ympäristöarvojen tarjoaminen CI/CD:ssä
- **🧰 `azd restore` ja laajennettu `azd package`** -selitykset tiedostossa `resources/cheat-sheet.md` — riippuvuuksien palauttaminen ja deployattavan artefaktin rakentaminen ilman deployta

#### Muutettu
- **🧭 Luku 4 oppituntien taulukko** päivitetty sisältämään uusi "Authoring Your Own Template" -oppitunti (Lesson 3)
- **🧭 Luku 1 oppituntien taulukko** päivitetty sisältämään uusi "Dev Containers & Codespaces" -oppitunti (Lesson 5); navigaatiojalustat yhdistetty tiedostojen `bring-your-own-app.md` ja `dev-containers.md` välille

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Tämä versio sulkee suurimmat aukot täydellistä aloittelijaopasta varten lisäämällä kaksi uutta hands-on -oppituntia (deployattava multi-agent -läpipääsy ja azd:n lisääminen olemassa olevaan sovellukseen), aloittelijaystävällisen hooks-introduktion, Terraform-with-azd -osion, vaiheittaisen GitHub Actions -pipeline-läpikäynnin, selityksen uusille preview-extensioille ja eksplisiittisen deploymentin varmistuschecklistan.**

#### Lisätty
- **🤝 Uusi Luku 5 -oppitunti** `docs/chapter-05-multi-agent/multi-agent-basics.md` — täysin hands-on, deployattava kahden agentin walkthrough (orchestrator + specialistit) käyttäen oikeaa templatea (`contoso-creative-writer`), kattaen milloin käyttää multi-agentia, `azd up` -työnkulun, deployattujen resurssien ymmärtämisen, agenttien välisen tracingin, muokkaamisen ja siivouksen
- **📦 Uusi Luku 1 -oppitunti** `docs/chapter-01-foundation/bring-your-own-app.md` — miten lisätä azd olemassa olevaan projektiin `azd init` -komennolla ("use code in the current directory"), `azure.yaml` ja `infra/` -kansion ymmärtäminen, `azd infra generate`, isäntätunnistus ja deploy `azd up` -komennolla
- **🌐 Terraform with azd** -osio lisätty tiedostoon `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` -konfiguraatio, `.tf`-kansion rakenne, vaaditut `AZURE_*` outputs ja `azd-env-name` -taggaus sekä identtinen `azd up` / `azd down` -työnkulku (sulkee aukon, jossa Terraform-tuki oli mainittu mutta esitetty vain Bicepillä)
- **⚙️ Vaiheittainen GitHub Actions -läpikäynti** tiedostossa `docs/chapter-08-production/production-ai-practices.md` — GitHub-reposta automatisoituihin deployihin: `azd pipeline config`, OIDC-federoidut tunnukset (ei tallennettuja salaisuuksia), generoitu `azure-dev.yml` ja ohjeistus salaisuuksien vs. muuttujien käytöstä
- **🪝 Aloittelijan "New to hooks?" -intro** tiedostossa `docs/chapter-04-infrastructure/deployment-guide.md` — mitä hook on, hook-vaihetaulukko, minimaalinen ensimmäinen hook ja hookien ajaminen manuaalisesti `azd hooks run` -komennolla
- **✅ "Verify Your Deployment" -checklista** lisätty Step 5:een tiedostossa `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint -tarkistus ja eksplisiittiset onnistumiskriteerit
- **🧩 Selitys uusille preview-extensioille** `azure.ai.skills` ja `azure.ai.connections` (mikä ne ovat ja milloin käyttää) tiedostossa `docs/chapter-08-production/production-ai-practices.md`

#### Muutettu
- **🧭 Luku 5 oppituntien taulukko** korjattu: `multi-agent-basics.md` on nyt Oppitunti 1 (ainoa täysin hands-on -oppitunti), rehellinen merkintä että Oppitunti 2 sijaitsee Luvussa 6 ja Retail-skenaario on arkkitehtuurisuunnitelma, ei yhden komennon template
- **🧭 Luku 1 oppituntien taulukko** sisältää nyt uuden "Bring Your Own App" -oppitunnin (Lesson 4)
- **🔗 Navigaatiojalustat** päivitetty: `first-project.md` linkittää nyt eteenpäin tiedostoon `bring-your-own-app.md`

#### Korjattu
- **🧱 Suljettu "claimattu mutta puuttuva" Terraform-aukko** — kurssi viittasi aiemmin Terraform-tukeen ilman että sitä esitettiin
- **🔀 Korjattu harhaanjohtavat Luku 5 ristiinlinkitykset** jotka antoivat vaikutelman täydellisestä multi-agent -implementaatiosta, kun todellisuudessa oli vain arkkitehtuurisuunnitelma

#### Päivitetyt tiedostot
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(uusi)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(uusi)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Tämä versio validoi kurssin uudelleen `azd` `1.25.6` (kesäkuu 2026) ja `azure.ai.agents` `0.1.40-preview` -extensionin kanssa, laajentaa AI-ohjeistusta "scaffold an agent" -tasolta koko agentin elinkaaren kattavaksi (test → evaluate → optimize → inspect → delete), tuo esiin uudet `azure.ai.skills` ja `azure.ai.connections` -preview-extensionit ja huomauttaa ".NET Aspire" → "Aspire" -tuotteen uudelleenbrändäyksestä.**

#### Lisätty
- **🔁 Täydellinen agentin elinkaaren kattavuus** aloittelijoille ja AI-insinööreille dokumenteissa:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle-taulukko (scaffold → test → measure → improve → inspect → clean up) lisätty Extensions and AI Commands -osioon
  - `docs/chapter-08-production/production-ai-practices.md` — Uusi "Managing the Agent Lifecycle" -osio kattaa `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
  - `resources/cheat-sheet.md` — Laajennetut AI Agent Commands `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
- **🧩 Uudet preview-extensiot** dokumentoitu: `azure.ai.skills` (uudelleenkäytettävät agenttitaidot) ja `azure.ai.connections` (Foundry-yhteydet) lisätty extensioiden taulukkoon ja cheat sheetiin
- **⏱️ Vastausajan ohjeistus** — `azd ai agent invoke` -esimerkeissä nyt maininta, että se tulostaa kokonaisviiveen ja time-to-first-byte -arvon
- **📌 Versiobanneri** pää-README:ssä ohjaamassa oppijoita `azd version` ja `azd upgrade` -komentoihin

#### Muutettu
- **✅ Validointiperusta päivitetty** `azd 1.23.12` (maaliskuu 2026) -> `azd 1.25.6` (kesäkuu 2026) kaikissa luku-READMEissä ja workshop-dokumenteissa
- **🤖 Luku 2 extension-note** päivitetty `azure.ai.agents` `0.1.18-preview` -> `0.1.40-preview`
- **🧪 Workshopin validointiesimerkki** (`azd version` -tulos) päivitetty arvoon `1.25.6`
- **🧭 README "What's New in azd Today"** päivitetty korostamaan end-to-end agentin elinkaarta, uusia AI-extensioita ja äskettäisiä käytettävyyden parannuksia (`azd init` idempotency, `azd auth login` stale-token -tyhjennys, `azd tool` first-run -kehote)
- **📖 Luku 2 agents.md (Option 4)** ohjaa nyt oppijoita post-deploy elinkaaren komennoille sen sijaan että pysähtyisi `azd up` -vaiheeseen

#### Korjattu
- **🏷️ Tuotenimi** — lisätty Aspire-udelleenbrändäysmerkintä (".NET Aspire" on nyt yksinkertaisesti "Aspire"); azd:n Aspire-tuki on ennallaan
- **🔎 Live release -validointi** varmistettu Azure Developer CLI -julkaisusyötteen perusteella: vakaa CLI `1.25.6` (2026-06-12) ja `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Päivitetyt tiedostot
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
#### Aloittelijan perehdytyksen selvennys, asennuksen vahvistus ja lopullinen AZD-komentojen siivous
**Tämä versio täydentää AZD 1.23 -validointikierrosta aloittelijakeskeisellä dokumenttikierroksella: se selkeyttää AZD-ensijaisia todennusohjeita, lisää paikallisia asennuksen validoivia skriptejä, varmistaa keskeiset komennot live AZD CLI:llä ja poistaa viimeiset vanhentuneet englanninkieliset komentoviittaukset changelogia lukuun ottamatta.**

#### Added
- **🧪 Beginner setup validation scripts** with `validate-setup.ps1` and `validate-setup.sh` so learners can confirm required tools before starting Chapter 1
- **✅ Upfront setup validation steps** in the root README and Chapter 1 README so missing prerequisites are caught before `azd up`

#### Changed
- **🔐 Beginner authentication guidance** now consistently treats `azd auth login` as the primary path for AZD workflows, with `az login` called out as optional unless Azure CLI commands are used directly
- **📚 Chapter 1 onboarding flow** now points learners to validate their local setup before installation, authentication, and first deployment steps
- **🛠️ Validator messaging** now clearly separates blocking requirements from optional Azure CLI warnings for the AZD-only beginner path
- **📖 Configuration, troubleshooting, and example docs** now distinguish between required AZD authentication and optional Azure CLI sign-in where both were previously presented without context

#### Fixed
- **📋 Remaining English-source command references** updated to current AZD forms, including `azd config show` in the cheat sheet and `azd monitor --overview` where Azure Portal overview guidance was intended
- **🧭 Beginner claims in Chapter 1** softened to avoid overpromising guaranteed zero-error or rollback behavior across all templates and Azure resources
- **🔎 Live CLI validation** confirmed current support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, and `azd down --force --purge`

#### Files Updated
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

#### AZD 1.23.12 -validointi, työpajaympäristön laajennus ja AI-mallien päivitys
**Tämä versio suorittaa dokumenttien validointikierroksen `azd` `1.23.12`:a vastaan, päivittää vanhentuneita AZD-komentoesimerkkejä, päivittää AI-malliohjeistuksen nykyisiin oletuksiin ja laajentaa työpajaohjeita GitHub Codespacesin ulkopuolelle tukemaan myös dev-containereita ja paikallisia klooneja.**

#### Added
- **✅ Validation notes across core chapters and workshop docs** to make the tested AZD baseline explicit for learners using newer or older CLI builds
- **⏱️ Deployment timeout guidance** for long-running AI app deployments using `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** with `azd extension show azure.ai.agents` in AI workflow docs
- **🌐 Broader workshop environment guidance** covering GitHub Codespaces, dev containers, and local clones with MkDocs

#### Changed
- **📚 Chapter intro READMEs** now consistently note validation against `azd 1.23.12` across foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, and production sections
- **🛠️ AZD command references** updated to current forms across the docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview is intended
- **🧪 Provision preview examples** simplified to current supported usage such as `azd provision --preview` and `azd provision --preview -e production`
- **🧭 Workshop flow** updated so learners can complete the labs in Codespaces, a dev container, or a local clone instead of assuming Codespaces-only execution
- **🔐 Authentication guidance** now prefers `azd auth login` for AZD workflows, with `az login` positioned as optional when Azure CLI commands are used directly

#### Fixed
- **🪟 Windows install commands** normalized to current `winget` package casing in the installation guide
- **🐧 Linux install guidance** corrected to avoid unsupported distro-specific `azd` package manager instructions and instead point to release assets where appropriate
- **📦 AI model examples** refreshed from older defaults like `gpt-35-turbo` and `text-embedding-ada-002` to current examples such as `gpt-4.1-mini`, `gpt-4.1`, and `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** corrected to use current environment and status commands in logs, scripts, and troubleshooting steps
- **⚙️ GitHub Actions guidance** updated from `Azure/setup-azd@v1.0.0` to `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** updated from `azd mcp consent` to `azd copilot consent list`

#### Improved
- **🧠 AI chapter guidance** now better explains preview-sensitive `azd ai` behavior, tenant-specific login, current extension usage, and updated model deployment recommendations
- **🧪 Workshop instructions** now use more realistic version examples and clearer environment setup language for hands-on labs
- **📈 Production and troubleshooting docs** now align better with current monitoring, fallback model, and cost-tier examples

#### Files Updated
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

#### AZD AI CLI -komennot, sisällön validointi ja mallien laajennus
**Tämä versio lisää `azd ai`, `azd extension`, ja `azd mcp` -komentokattavuuden kaikissa AI:hin liittyvissä luvuissa, korjaa rikkinäiset linkit ja vanhentuneet koodit agents.md:ssä, päivittää pikanäppäintaulukon ja uudistaa Example Templates -osion validoiduilla kuvauksilla ja uusilla Azure AI AZD -malleilla.**

#### Added
- **🤖 AZD AI CLI coverage** across 7 files (previously only in Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section introducing `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` with comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now shows both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now includes `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section with `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat with Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat using Langchain4J with ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app using Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG using Azure Functions + LangChain.js + Cosmos DB with Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator with admin portal, Teams integration, and PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app with servers in .NET, Python, Java, and TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` corrected to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replaced `opencensus` with `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Moved `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replaced rough `len//4` estimate with `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrected services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host changed Oct 2024)
- **contoso-chat**: Updated description to reference Azure AI Foundry + Prompty, matching the repo's actual title and tech stack

#### Removed
- **ai-document-processing**: Removed non-functional template reference (repo not publicly accessible as an AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now shows expected output and `azd monitor` step; Exercise 2 includes full `FunctionTool` registration code; Exercise 3 replaces vague guidance with concrete `prepdocs.py` commands
- **📚 agents.md resources**: Updated documentation links to current Azure AI Agent Service docs and quickstart
- **📋 agents.md Next Steps table**: Added AI Workshop Lab link for complete chapter coverage

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Kurssin navigoinnin parannus
**Tämä versio parantaa README.md-lukujen navigointia parannetulla taulukkomuodolla.**

#### Muutokset
- **Kurssikartan taulukko**: Parannettu suorin oppitunti-linkein, kestoarvioin ja monimutkaisuusluokituksin
- **Kansion siivous**: Poistettu tarpeettomat vanhat kansiot (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkkien validointi**: Kaikki yli 21 sisäistä linkkiä Kurssikartan taulukossa varmistettu

### [v3.16.0] - 2026-02-05

#### Tuotteen nimien päivitykset
**Tämä versio päivittää tuotereferenssit nykyiseen Microsoftin brändäykseen.**

#### Muutokset
- **Microsoft Foundry → Microsoft Foundry**: Kaikki viittaukset päivitetty käännösten ulkopuolisissa tiedostoissa
- **Azure AI Agent Service → Foundry Agents**: Palvelun nimi päivitetty vastaamaan nykyistä brändäystä

#### Päivitetyt tiedostot
- `README.md` - Pääkurssin aloitussivu
- `changelog.md` - Versiohistoria
- `course-outline.md` - Kurssin rakenne
- `docs/chapter-02-ai-development/agents.md` - AI-agenttien opas
- `examples/README.md` - Esimerkkidokumentaatio
- `workshop/README.md` - Työpajan aloitussivu
- `workshop/docs/index.md` - Työpajan indeksi
- `workshop/docs/instructions/*.md` - Kaikki työpajan ohjetiedostot

---

### [v3.15.0] - 2026-02-05

#### Merkittävä repositorion uudelleenjärjestely: lukuperusteiset kansioiden nimet
**Tässä versiossa dokumentaatio on uudelleenjärjestetty omiin luku-kansioihin selkeämpää navigointia varten.**

#### Kansion uudelleennimeäminen
Vanhat kansiot on korvattu luku-numeroiduilla kansioilla:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Tiedostojen siirrot
| Tiedosto | Alkuperä | Kohde |
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

#### Lisätty
- **📚 Luku-README-tiedostot**: Luotu README.md jokaiseen luku-kansioon, sisältäen:
  - Oppimistavoitteet ja kesto
  - Oppituntitaulukko kuvauksineen
  - Pika-aloituskäskyt
  - Navigointi muihin lukuihin

#### Muutokset
- **🔗 Kaikki sisäiset linkit päivitetty**: 78+ polkua päivitetty kaikissa dokumentaatiotiedostoissa
- **🗺️ Main README.md**: Kurssikartta päivitetty uudella lukurakenteella
- **📝 examples/README.md**: Päivitetty ristiinviittaukset luku-kansioihin

#### Poistettu
- Vanha kansiorakenne (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositorion uudelleenjärjestely: lukujen navigointi
**Tämä versio lisäsi lukujen navigointi-README-tiedostot (korvattu versiolla v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uusi AI-agenttien opas
**Tässä versiossa lisätään kattava opas AI-agenttien käyttöönottoon Azure Developer CLI:llä.**

#### Lisätty
- **🤖 docs/microsoft-foundry/agents.md**: Täydellinen opas, joka käsittelee:
  - Mitä AI-agentit ovat ja miten ne eroavat chatboteista
  - Kolme pika-aloitusagenttipohjaa (Foundry Agents, Prompty, RAG)
  - Agenttiarkkitehtuurimallit (yksittäinen agentti, RAG, moniagenttinen)
  - Työkalujen konfigurointi ja mukauttaminen
  - Valvonta ja mittareiden seuranta
  - Kustannusnäkökohdat ja optimointi
  - Yleiset vianmääritystilanteet
  - Kolme käytännön harjoitusta ja onnistumiskriteerit

#### Sisällön rakenne
- **Johdanto**: Agenttikonseptit aloittelijoille
- **Pika-aloitus**: Ota agentit käyttöön komennolla `azd init --template get-started-with-ai-agents`
- **Arkkitehtuurimallit**: Visuaaliset kaaviot agenttimalleista
- **Konfigurointi**: Työkalun asetukset ja ympäristömuuttujat
- **Valvonta**: Application Insights -integraatio
- **Harjoitukset**: Järjestelmällinen käytännön oppiminen (20–45 minuuttia kukin)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-ympäristopäivitys
**Tämä versio päivittää kehityssäiliön konfiguraation moderneilla työkaluilla ja paremmilla oletusasetuksilla AZD-opiskelukokemusta varten.**

#### Muutokset
- **🐳 Peruskuva**: Päivitetty `python:3.12-bullseye` → `python:3.12-bookworm` (uusin Debian stable)
- **📛 Säiliön nimi**: Nimetty uudelleen "Python 3" -> "AZD for Beginners" selkeyden vuoksi

#### Lisätty
- **🔧 Uudet Dev Container -ominaisuudet**:
  - `azure-cli` (Bicep-tuki käytössä)
  - `node:20` (LTS-versio AZD-malleille)
  - `github-cli` mallien hallintaan
  - `docker-in-docker` konttisovellusten käyttöönottoon

- **🔌 Porttien edelleenohjaus**: Esikonfiguroidut portit yleiseen kehitykseen:
  - 8000 (MkDocs-esikatselu)
  - 3000 (Web-sovellukset)
  - 5000 (Python Flask)
  - 8080 (API:t)

- **🧩 Uudet VS Code -laajennukset**:
  - `ms-python.vscode-pylance` - Parannettu Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions -tuki
  - `ms-azuretools.vscode-docker` - Docker-tuki
  - `ms-azuretools.vscode-bicep` - Bicep-kielen tuki
  - `ms-azure-devtools.azure-resource-groups` - Azure-resurssien hallinta
  - `yzhang.markdown-all-in-one` - Markdownin muokkaus
  - `DavidAnson.vscode-markdownlint` - Markdown-linttaus
  - `bierner.markdown-mermaid` - Mermaid-kaavioiden tuki
  - `redhat.vscode-yaml` - YAML-tuki (azure.yaml:lle)
  - `eamodio.gitlens` - Gitin visualisointi
  - `mhutchie.git-graph` - Git-historia

- **⚙️ VS Code -asetukset**: Lisätty oletusasetukset Python-tulkille, muotoilu tallennettaessa ja välilyöntien poistaminen

- **📦 requirements-dev.txt päivitetty**:
  - Lisätty MkDocs-minifiointilaajennus
  - Lisätty pre-commit koodin laadunvarmistukseen
  - Lisätty Azure SDK -paketteja (azure-identity, azure-mgmt-resource)

#### Korjattu
- **Post-Create -komento**: Nyt tarkistaa AZD:n ja Azure CLI:n asennuksen säiliön käynnistyessä

---

### [v3.11.0] - 2026-02-05

#### Aloittelijaystävällisen README:n uudistus
**Tämä versio parantaa merkittävästi README.md-tiedostoa aloittelijoille sopivammaksi ja lisää olennaisia resursseja AI-kehittäjille.**

#### Lisätty
- **🆚 Azure CLI vs AZD -vertailu**: Selkeä selitys siitä, milloin käyttää kumpaakin työkalua käytännön esimerkkien kanssa
- **🌟 Loistavat AZD-linkit**: Suorat linkit yhteisön malligalleriaan ja kontribuutioresursseihin:
  - [Loistava AZD-galleria](https://azure.github.io/awesome-azd/) - 200+ valmiita käyttöönotettavia malleja
  - [Lähetä malli](https://github.com/Azure/awesome-azd/issues) - Yhteisön kontribuutio
- **🎯 Pika-aloitusopas**: Yksinkertaistettu 3-vaiheinen aloitusosio (Asenna → Kirjaudu sisään → Ota käyttöön)
- **📊 Kokemukseen perustuva navigointitaulukko**: Selkeä ohjeistus mistä aloittaa kehittäjän kokemuksen perusteella

#### Muutokset
- **README-rakenne**: Järjestetty uudelleen vaiheittaista paljastamista varten - tärkeimmät tiedot ensin
- **Johdanto-osio**: Uudelleenkirjoitettu selittämään "azd up -komennon taika" täydellisille aloittelijoille
- **Poistettu päällekkäinen sisältö**: Poistettu päällekkäinen vianmääritysosio
- **Vianmäärityskomennot**: Korjattiin `azd logs` -viittaus käyttämään kelvollista `azd monitor --logs`

#### Korjattu
- **🔐 Autentikointikomennot**: Lisätty `azd auth login` ja `azd auth logout` tiedostoon cheat-sheet.md
- **Väärät komennoviittaukset**: Poistettu jäljellä olevat `azd logs` README:n vianmääritysosiosta

#### Huomioita
- **Soveltamisala**: Muutokset kohdistettu pää-README.md:ään ja resources/cheat-sheet.md:ään
- **Kohderyhmä**: Parannukset suunnattu erityisesti AZD:hen tutustuville kehittäjille

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI:n komentojen tarkkuuspäivitys
**Tämä versio korjaa dokumentaation ei-olemassa olevat AZD-komennot varmistaen, että kaikki koodiesimerkit käyttävät kelvollista Azure Developer CLI -syntaksia.**

#### Korjattu
- **🔧 Ei-olemassa olevat AZD-komennot poistettu**: Kattava tarkastus ja virheellisten komentojen korjaus:
  - `azd logs` (ei ole olemassa) → korvattu `azd monitor --logs` tai Azure CLI -vaihtoehdoilla
  - `azd service` alikomennot (eivät ole olemassa) → korvattu `azd show` ja Azure CLI:llä
  - `azd infra import/export/validate` (ei ole olemassa) → poistettu tai korvattu kelvollisilla vaihtoehdoilla
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` liput (eivät ole olemassa) → poistettu
  - `azd provision --what-if/--rollback` liput (eivät ole olemassa) → päivitetty käyttämään `--preview`
  - `azd config validate` (ei ole olemassa) → korvattu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eivät ole olemassa) → poistettu

- **📚 Tiedostot päivitetty komentokorjausten mukaisesti**:
  - `resources/cheat-sheet.md`: Merkittävä komento-opastuksen uudistus
  - `docs/deployment/deployment-guide.md`: Korjattu rollback- ja käyttöönotto-strategiat
  - `docs/troubleshooting/debugging.md`: Korjatut lokianalyysiosiot
  - `docs/troubleshooting/common-issues.md`: Päivitetyt vianmäärityskomennot
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu AZD:n debug-osio
  - `docs/getting-started/azd-basics.md`: Korjatut valvontakomennot
  - `docs/getting-started/first-project.md`: Päivitetyt valvonta- ja debug-esimerkit
  - `docs/getting-started/installation.md`: Korjatut help- ja versioesimerkit
  - `docs/pre-deployment/application-insights.md`: Korjatut lokien katselukomennot
  - `docs/pre-deployment/coordination-patterns.md`: Korjatut agenttien debug-komennot

#### Muutokset
- **Palautusstrategiat**: Dokumentaatio päivitetty käyttämään Git-pohjaista palautusta (AZD:llä ei ole natiivisti palautusta)
- **Lokien katselu**: Korvattu `azd logs` -viittaukset `azd monitor --logs`, `azd monitor --live` ja Azure CLI -komennoilla
- **Suorituskyky-osio**: Poistettu ei-olemassa olevat rinnakkais-/inkrementaaliset käyttöönottoliput, annettu kelvollisia vaihtoehtoja

#### Teknisiä yksityiskohtia
- **Kelvolliset AZD-komennot**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kelvolliset azd monitor -liput**: `--live`, `--logs`, `--overview`
- **Poistetut ominaisuudet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Huomioita
- **Varmennus**: Komennot vahvistettu Azure Developer CLI v1.23.x:ään perustuen

---

### [v3.9.0] - 2026-02-05

#### Työpajan valmistuminen ja dokumentaation laadun päivitys
**Tämä versio täydentää interaktiiviset työpajamoduulit, korjaa kaikki rikkinäiset dokumentaatiolinkit ja parantaa sisällön yleistä laatua AI-kehittäjille, jotka käyttävät Microsoft AZD:ta.**

#### Lisätty
- **📝 CONTRIBUTING.md**: Uusi kontribuutiota koskeva ohjeistusdokumentti, joka sisältää:
  - Selkeät ohjeet virheilmoitusten tekemiseen ja muutosehdotusten jättämiseen
  - Dokumentaation laatuvaatimukset uudelle sisällölle
  - Koodiesimerkkiohjeet ja commit-viestikäytännöt
  - Yhteisön osallistumistiedot

#### Suoritetut
- **🎯 Workshop Module 7 (Wrap-up)**: Täysin valmis päätösmoduuli, joka sisältää:
  - Kattavan yhteenvedon työpajan saavutuksista
  - Avainkäsitteiden osio, joka kattaa AZD:n, mallit ja Microsoft Foundryn
  - Suositukset oppimismatkan jatkamiseksi
  - Työpajan haasteharjoitukset vaikeustasoarvioinneilla
  - Yhteisön palaute- ja tukilinkit

- **📚 Workshop Module 3 (Deconstruct)**: Päivitetyt oppimistavoitteet, jotka sisältävät:
  - Ohjeet GitHub Copilotin aktivoimiseen MCP-palvelimilla
  - AZD-mallikansion rakenteen ymmärtäminen
  - Infrastruktuuri koodina (Bicep) -organisointimallit
  - Käytännön labraohjeet

- **🔧 Workshop Module 6 (Teardown)**: Suoritettu sisältäen:
  - Resurssien siivous- ja kustannustenhallinnan tavoitteet
  - `azd down`-käyttö turvalliseen infrastruktuurin poistoon
  - Ohjeet pehmeästi poistetun Cognitive Servicesin palauttamiseen
  - Bonus-tutkimusaiheita GitHub Copilotille ja Azure Portalille

#### Korjatut
- **🔗 Rikkinäisten linkkien korjaukset**: Korjattiin yli 15 rikkinäistä sisäistä dokumenttilinkkiä:
  - `docs/ai-foundry/ai-model-deployment.md`: Korjattu polut tiedostoon microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu ai-model-deployment.md- ja production-ai-practices.md-polut
  - `docs/getting-started/first-project.md`: Korvattu olematon cicd-integration.md tiedostolla deployment-guide.md
  - `examples/retail-scenario.md`: Korjattu FAQ- ja vianmääritysopas-polut
  - `examples/container-app/microservices/README.md`: Korjattu kurssin kotisivu- ja deployment guide -polut
  - `resources/faq.md` ja `resources/glossary.md`: Päivitetyt AI-lukuviitteet
  - `course-outline.md`: Korjattu instructor guide- ja AI-workshop-lab-viitteet

- **📅 Workshop Status Banner**: Päivitetty tilasta "Under Construction" aktiiviseksi työpajan tilaksi, päivämäärä helmikuu 2026

- **🔗 Workshop Navigation**: Korjattu rikkinäiset navigointilinkit workshop README.md:ssä, jotka osoittivat olemattomaan lab-1-azd-basics-kansioon

#### Muutokset
- **Workshop Presentation**: Poistettu 'under construction' -varoitus, työpaja on nyt valmis ja käyttövalmis
- **Navigation Consistency**: Varmistettu, että kaikilla työpajamoduuleilla on asianmukainen moduulien välinen navigointi
- **Learning Path References**: Päivitetty lukujen ristiviitteet käyttämään oikeita microsoft-foundry-polkuja

#### Vahvistettu
- ✅ Kaikki englanninkieliset markdown-tiedostot sisältävät toimivat sisäiset linkit
- ✅ Työpajan moduulit 0–7 ovat täydellisiä oppimistavoitteineen
- ✅ Navigointi lukujen ja moduulien välillä toimii oikein
- ✅ Sisältö on soveltuva AI-kehittäjille, jotka käyttävät Microsoft AZD:tä
- ✅ Säilytetty aloittelijaystävällinen kieli ja rakenne
- ✅ CONTRIBUTING.md tarjoaa selkeät ohjeet yhteisön kontribuoijille

#### Tekninen toteutus
- **Link Validation**: Automaattinen PowerShell-skripti varmisti kaikkien .md-tiedostojen sisäiset linkit
- **Content Audit**: Manuaalinen tarkastus työpajan täydellisyydestä ja aloittelijasoveltuvuudesta
- **Navigation System**: Johdonmukaiset luku- ja moduulinavigointimallit otettu käyttöön

#### Huomiot
- **Scope**: Muutokset sovellettu vain englanninkieliseen dokumentaatioon
- **Translations**: Käännöskansiot eivät päivity tässä versiossa (automaattinen käännös synkronoi myöhemmin)
- **Workshop Duration**: Täydellinen työpaja tarjoaa nyt 3–4 tuntia käytännön oppimista

---

### [v3.8.0] - 2025-11-19

#### Edistynyt dokumentaatio: valvonta, turvallisuus ja moniedustajamallit
**Tämä versio lisää kattavat A-tason oppitunnit Application Insights -integraatiosta, todennusmalleista ja moniedustajien koordinoinnista tuotantokäyttöön.**

#### Lisätty
- **📊 Application Insights -integraatio-opetus**: tiedostossa `docs/pre-deployment/application-insights.md`:
  - AZD-keskeinen käyttöönotto automaattisella provisioinnilla
  - Täydelliset Bicep-mallit Application Insightsille + Log Analyticsille
  - Toimivat Python-sovellukset mukautetulla telemetrialla (yli 1 200 riviä)
  - AI/LLM-valvontamallit (Microsoft Foundry -mallien tokenien/kustannusten seuranta)
  - 6 Mermaid-kaaviota (arkkitehtuuri, hajautettu jäljitys, telemetriavirtaus)
  - 3 käytännön harjoitusta (hälytykset, dashboardit, AI-valvonta)
  - Kusto-kyselyesimerkit ja kustannusten optimointistrategiat
  - Live-metriikoiden striimaus ja reaaliaikainen virheenkorjaus
  - 40–50 minuutin oppimisaika tuotantovalmiiden mallien kanssa

- **🔐 Todennus- ja turvallisuusmallit -oppitunti**: tiedostossa `docs/getting-started/authsecurity.md`:
  - 3 todennusmallia (yhteysmerkkijonot, Key Vault, hallittu identiteetti)
  - Täydelliset Bicep-infrastruktuurimallit turvallisille käyttöönottoille
  - Node.js-sovelluskoodi Azure SDK -integraatiolla
  - 3 täydellistä harjoitusta (hallinnoidun identiteetin käyttöönotto, käyttäjälle määritetty identiteetti, Key Vaultin kierto)
  - Turvallisuuden parhaat käytännöt ja RBAC-konfiguraatiot
  - Vianmääritysohje ja kustannusanalyysi
  - Tuotantovalmiit salasanattomat todennusmallit

- **🤖 Moniedustajien koordinointimallit -oppitunti**: tiedostossa `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinaatiomallia (sekventiaalinen, rinnakkainen, hierarkkinen, tapahtumapohjainen, konsensus)
  - Täydellinen orkestrointipalvelun toteutus (Python/Flask, yli 1 500 riviä)
  - 3 erikoistettua agenttitoteutusta (Research, Writer, Editor)
  - Service Bus -integraatio viestijonotusta varten
  - Cosmos DB -tilanhallinta hajautetuille järjestelmille
  - 6 Mermaid-kaaviota, jotka näyttävät agenttien vuorovaikutuksen
  - 3 edistynyttä harjoitusta (aikakatkaisu, uudelleenyrittämislogiikka, piirikatkaisin)
  - Kustannuserittely (240–565 $/kk) optimointistrategioineen
  - Application Insights -integraatio valvontaa varten

#### Parannettu
- **Pre-deployment Chapter**: Sisältää nyt kattavat valvonta- ja koordinaatiomallit
- **Getting Started Chapter**: Parannettu ammattimaisilla todennusmalleilla
- **Production Readiness**: Kattava käsittely turvallisuudesta havaittavuuteen
- **Course Outline**: Päivitetty viittaamaan uusiin oppitunteihin luvuissa 3 ja 6

#### Muutokset
- **Learning Progression**: Parempi turvallisuuden ja valvonnan integrointi koko kurssilla
- **Documentation Quality**: Johdonmukaiset A-tason standardit (95–97 %) uusissa oppitunneissa
- **Production Patterns**: Täysi päästä päähän -kattavuus yrityskäyttöönottoa varten

#### Parannukset
- **Developer Experience**: Selkeä polku kehityksestä tuotantovalvontaan
- **Security Standards**: Ammattimallinnukset todennukseen ja salaisuuksien hallintaan
- **Observability**: Täydellinen Application Insights -integraatio AZD:n kanssa
- **AI Workloads**: Erikoistunut valvonta Microsoft Foundry -malleille ja moniedustajajärjestelmille

#### Vahvistettu
- ✅ Kaikissa oppitunneissa on täydellinen toimiva koodi (ei pelkkiä katkelmia)
- ✅ Mermaid-kaaviot visuaalista oppimista varten (yhteensä 19 kolmessa oppitunnissa)
- ✅ Käytännön harjoitukset vahvistusvaiheilla (yhteensä 9)
- ✅ Tuotantovalmiit Bicep-mallit, jotka voi ottaa käyttöön `azd up` -komennolla
- ✅ Kustannusanalyysit ja optimointistrategiat
- ✅ Vianmääritysoppaat ja parhaat käytännöt
- ✅ Tarkistuspisteet vahvistuskomentoineen

#### Dokumentaation arviointitulokset
- **docs/pre-deployment/application-insights.md**: - Kattava valvontaopas
- **docs/getting-started/authsecurity.md**: - Ammattimaiset turvallisuusmallit
- **docs/pre-deployment/coordination-patterns.md**: - Edistyneet moniedustaja-arkkitehtuurit
- **Overall New Content**: - Johdonmukaiset korkeat laatuvaatimukset

#### Tekninen toteutus
- **Application Insights**: Log Analytics + mukautettu telemetria + hajautettu jäljitys
- **Authentication**: Hallittu identiteetti + Key Vault + RBAC-mallit
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrointi
- **Monitoring**: Live-metriikat + Kusto-kyselyt + hälytykset + dashboardit
- **Cost Management**: Otantastrategiat, säilytyskäytännöt, budjettivalvonta

### [v3.7.0] - 2025-11-19

#### Dokumentaation laadun parannuksia ja uusi Microsoft Foundry Models -esimerkki
**Tämä versio parantaa dokumentaation laatua koko repositoriossa ja lisää täydellisen Microsoft Foundry Models -käyttöönottoesimerkin, jossa on gpt-4.1-chat-käyttöliittymä.**

#### Lisätty
- **🤖 Microsoft Foundry Models Chat Example**: Täydellinen gpt-4.1-käyttöönotto toimivalla toteutuksella kansiossa `examples/azure-openai-chat/`:
  - Täydellinen Microsoft Foundry Models -infrastruktuuri (gpt-4.1-mallin käyttöönotto)
  - Python-komentorivinen chat-käyttöliittymä keskusteluhistorialla
  - Key Vault -integraatio API-avainten turvalliseen säilytykseen
  - Tokenien käytön seuranta ja kustannusarviointi
  - Nopeudenrajoitus ja virheenkäsittely
  - Kattava README sisältäen 35–45 minuutin käyttöönotto-opastuksen
  - 11 tuotantovalmista tiedostoa (Bicep-mallit, Python-sovellus, konfiguraatio)
- **📚 Dokumentaation harjoitukset**: Lisätty käytännön harjoituksia konfigurointioppaaseen:
  - Harjoitus 1: Moniympäristökonfiguraatio (15 minuuttia)
  - Harjoitus 2: Salaisuuksien hallintaharjoitus (10 minuuttia)
  - Selkeät onnistumiskriteerit ja vahvistusvaiheet
- **✅ Käyttöönoton varmennus**: Lisätty varmennusosio käyttöönotto-oppaaseen:
  - Terveystarkistusmenettelyt
  - Onnistumiskriteerien tarkistuslista
  - Odotetut tulosteet kaikille käyttöönotto-komennoille
  - Vianmäärityksen pikaopas

#### Parannettu
- **examples/README.md**: Päivitetty A-tason laaduksi (93 %):
  - Lisätty azure-openai-chat kaikkiin asiaankuuluihin osioihin
  - Päivitetty paikallisten esimerkkien määrä 3:sta 4:ään
  - Lisätty AI Application Examples -taulukkoon
  - Integroituna Keskitasoisille käyttäjille -pikaoppaaseen
  - Lisätty Microsoft Foundry -mallit -osioon
  - Päivitetty vertailumatriisi- ja teknologiavalintaosiot
- **Documentation Quality**: Parannettu B+ (87 %) → A- (92 %) docs-kansiossa:
  - Lisätty odotetut tulosteet kriittisiin komentoesimerkkeihin
  - Sisällytetty vahvistusvaiheet konfiguraatiomuutoksille
  - Parannettu käytännön oppimista käytännöllisillä harjoituksilla

#### Muutokset
- **Learning Progression**: Parempi AI-esimerkkien integrointi keskitasoisille oppijoille
- **Documentation Structure**: Toiminnallisempia harjoituksia selkeillä tuloksilla
- **Verification Process**: Selkeät onnistumiskriteerit lisätty keskeisiin työnkulkuihin

#### Parannukset
- **Developer Experience**: Microsoft Foundry Models -käyttöönotto vie nyt 35–45 minuuttia (vs. 60–90 monimutkaisemmille vaihtoehdoille)
- **Cost Transparency**: Selkeät kustannusarviot (50–200 $/kk) Microsoft Foundry Models -esimerkille
- **Learning Path**: AI-kehittäjille selkeä sisäänmeno azure-openai-chat-esimerkin kautta
- **Documentation Standards**: Johdonmukaiset odotetut tulosteet ja vahvistusvaiheet

#### Vahvistettu
- ✅ Microsoft Foundry Models -esimerkki toimii täysin `azd up` -komennolla
- ✅ Kaikki 11 toteutustiedostoa ovat syntaktisesti oikein
- ✅ README-ohjeet vastaavat todellista käyttöönotto-kokemusta
- ✅ Dokumentaatiolinkit päivitetty yli 8 paikassa
- ✅ Esimerkkiluettelo heijastaa oikein 4 paikallista esimerkkiä
- ✅ Taulukoissa ei ole päällekkäisiä ulkoisia linkkejä
- ✅ Kaikki navigointiviitteet ovat oikein

#### Tekninen toteutus
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps -malli
- **Security**: Hallittu identiteetti valmiina, salaisuudet Key Vaultissa
- **Monitoring**: Application Insights -integraatio
- **Cost Management**: Token-seuranta ja käytön optimointi
- **Deployment**: Yksi `azd up` -komento täydelliseen käyttöönottoon

### [v3.6.0] - 2025-11-19

#### Merkittävä päivitys: Container App -käyttöönottoesimerkit
**Tässä versiossa esitellään kattavat, tuotantovalmiit konttisovelluskäyttöönottoesimerkit Azure Developer CLI:n (AZD) avulla, täydellinen dokumentaatio ja integrointi oppimispolkuun.**

#### Lisätty
- **🚀 Container App Examples**: Uudet paikalliset esimerkit kansiossa `examples/container-app/`:
  - [Pääopas](examples/container-app/README.md): Täydellinen yleiskatsaus konttikäyttöönottoihin, pika-aloitus, tuotanto ja edistyneet mallit
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api): Aloittelijaystävällinen REST-API, skaalaus nollaan, health probet, valvonta ja vianmääritys
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices): Tuotantovalmiit monipalvelukäyttöönotot (API Gateway, Product, Order, User, Notification), asynkroninen viestintä, Service Bus, Cosmos DB, Azure SQL, hajautettu jäljitys, blue-green/canary-käyttöönotto
- **Best Practices**: Turvallisuus, valvonta, kustannusten optimointi ja CI/CD-ohjeistus konttityökuormille
- **Code Samples**: Täydelliset `azure.yaml`, Bicep-mallit ja monikieliset palvelutoteutukset (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end-testausskenaariot, valvontakomennot, vianmääritysohjeet

#### Muutokset
- **README.md**: Päivitetty esittelemään ja linkittämään uudet container app -esimerkit osassa "Local Examples - Container Applications"
- **examples/README.md**: Päivitetty korostamaan container app -esimerkkejä, lisätty vertailumatriisin rivejä ja päivitetty teknologia/arkkitehtuuri-viittaukset
- **Course Outline & Study Guide**: Päivitetty viittaamaan uusiin container app -esimerkkeihin ja käyttöönottoihin asiaankuuluvissa luvuissa

#### Vahvistettu
- ✅ Kaikki uudet esimerkit voi ottaa käyttöön `azd up` -komennolla ja ne noudattavat parhaita käytäntöjä
- ✅ Dokumentaation ristiinlinkitykset ja navigointi päivitetty
- ✅ Esimerkit kattavat aloittelija- ja edistynyt-tapaukset, mukaan lukien tuotantomikropalvelut

#### Huomiot
- **Scope**: Englanninkielinen dokumentaatio ja esimerkit vain
- **Next Steps**: Laajennus lisättyjen edistyneiden konttimallien ja CI/CD-automaatioiden suuntaan tulevissa julkaisuissa

### [v3.5.0] - 2025-11-19

#### Tuotteen uudelleennimeäminen: Microsoft Foundry
**Tässä versiossa toteutetaan laaja tuotteen nimenmuutos "Microsoft Foundry" → "Microsoft Foundry" kaikessa englanninkielisessä dokumentaatiossa, heijastaen Microsoftin virallista uudelleennimeämistä.**

#### Muutokset
- **🔄 Product Name Update**: Täydellinen uudelleennimeäminen "Microsoft Foundry" → "Microsoft Foundry"
  - Päivitetty kaikki viittaukset englanninkielisessä dokumentaatiossa kansiossa `docs/`
  - Uudelleennimetty kansio: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Tiedosto nimetty uudelleen: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Yhteensä: 23 sisältöviittausta päivitetty 7 dokumentaatiotiedostossa

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - Kaikki ristiinviittaukset päivitetty vastaamaan uutta kansiorakennetta
  - Navigointilinkit validoitu kaikissa dokumenteissa

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kaikki sisäiset linkit päivitetty viittaamaan uuteen tiedostonimeen

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigointilinkkiä päivitetty
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tuotteen nimen viittausta päivitetty
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Käytössä jo Microsoft Foundry (aiemmista päivityksistä)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viittausta päivitetty (yleiskatsaus, yhteisön palaute, dokumentaatio)
  - `docs/getting-started/azd-basics.md` - 4 ristiinviittauslinkkiä päivitetty
  - `docs/getting-started/first-project.md` - 2 luvunavigointilinkkiä päivitetty
  - `docs/getting-started/installation.md` - 2 seuraavan luvun linkkiä päivitetty
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viittausta päivitetty (navigointi, Discord-yhteisö)
  - `docs/troubleshooting/common-issues.md` - 1 navigointilinkki päivitetty
  - `docs/troubleshooting/debugging.md` - 1 navigointilinkki päivitetty

- **Course Structure Files** (2 files):
  - `README.md` - 17 viittausta päivitetty (kurssin yleiskatsaus, lukujen otsikot, mallipohjaosio, yhteisön näkemykset)
  - `course-outline.md` - 14 viittausta päivitetty (yleiskatsaus, oppimistavoitteet, lukujen resurssit)

#### Validated
- ✅ Ei jäljellä "ai-foundry" kansion polkuviittauksia englanninkielisissä dokumenteissa
- ✅ Ei jäljellä "Microsoft Foundry" tuotteenimen viittauksia englanninkielisissä dokumenteissa
- ✅ Kaikki navigointilinkit toimivat uuden kansiorakenteen kanssa
- ✅ Tiedostojen ja kansioiden uudelleennimeämiset suoritettu onnistuneesti
- ✅ Lukujen väliset ristiinviittaukset validoitu

#### Notes
- **Scope**: Muutokset sovellettu vain englanninkieliseen dokumentaatioon kansiossa `docs/`
- **Translations**: Käännöstiedostokansiot (`translations/`) eivät ole päivitetty tässä versiossa
- **Workshop**: Työpaja-aineistot (`workshop/`) eivät ole päivitetty tässä versiossa
- **Examples**: Esimerkkitiedostot saattavat edelleen viitata vanhentuneisiin nimityksiin (korjataan tulevassa päivityksessä)
- **External Links**: Ulkoiset URL-osoitteet ja GitHub-repositorioon viittaavat linkit pysyvät muuttumattomina

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Tämä versio tuo laajan tuen uudelle Azure Developer CLI:n esikatseluominaisuudelle ja parantaa työpajan käyttäjäkokemusta.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Laaja kuvaus uudesta infrastruktuurin esikatseluominaisuudesta
  - Komentoriviviitteet ja käyttöskenaariot ansioluettelossa
  - Yksityiskohtainen integrointi provisiointiohjeeseen käyttötapauksineen ja hyötyineen
  - Ennen-käynnistys -tarkistuksen integrointi turvallisempaan käyttöönoton validointiin
  - Aloitusoppaan päivitykset turvallisuus edellä -käyttötavoille
- **🚧 Workshop Status Banner**: Ammattimainen HTML-banneri, joka osoittaa työpajan kehitystilan
  - Liukuvärisuunnittelu ja rakennustilan indikaattorit selkeään käyttäjäviestintään
  - Viimeksi päivitetty -aikaleima läpinäkyvyyden vuoksi
  - Mobiili­respon­siiviinen muotoilu kaikille laitteille

#### Enhanced
- **Infrastructure Safety**: Esikatseluominaisuus integroitu läpi käyttöönotto­dokumentaation
- **Pre-deployment Validation**: Automaatiokoodit sisältävät nyt infrastruktuurin esikatselutestauksen
- **Developer Workflow**: Päivitetyt komentojonot sisältävät esikatselun osana parhaiden käytäntöjen suositusta
- **Workshop Experience**: Käyttäjille asetetaan selkeä odotus sisällön kehitystilasta

#### Changed
- **Deployment Best Practices**: Esikatselu-ensimmäinen työnkulku suositeltavana lähestymistapana
- **Documentation Flow**: Infrastruktuurin validointi siirretty aiempaan kohtaan oppimisprosessia
- **Workshop Presentation**: Ammattimainen tilaviestintä selkeällä kehitysaikataululla

#### Improved
- **Safety-First Approach**: Infrastruktuurin muutokset voidaan nyt validoida ennen käyttöönottoa
- **Team Collaboration**: Esikatselun tuloksia voidaan jakaa tarkastusta ja hyväksyntää varten
- **Cost Awareness**: Parempi käsitys resurssikustannuksista ennen provisiointia
- **Risk Mitigation**: Vähemmän käyttöönottohäiriöitä etukäteisvalidoinnin ansiosta

#### Technical Implementation
- **Multi-document Integration**: Esikatseluominaisuus dokumentoitu neljässä keskeisessä tiedostossa
- **Command Patterns**: Johdonmukaiset syntaksiesimerkit läpi dokumentaation
- **Best Practice Integration**: Esikatselu sisällytetty validointityönkulkuihin ja skripteihin
- **Visual Indicators**: UUSI-ominaisuusmerkinnät näkyvyyden parantamiseksi

#### Workshop Infrastructure
- **Status Communication**: Ammattimainen HTML-banneri liukuvärityksellä
- **User Experience**: Selkeä kehitystila estää sekaannuksia
- **Professional Presentation**: Säilyttää repositorion uskottavuuden samalla kun odotukset asetetaan oikein
- **Timeline Transparency**: Lokakuun 2025 viimeisimmän päivityksen aikaleima vastuullisuuden vuoksi

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Tässä versiossa tuodaan laajat workshop-materiaalit selaimessa käytettävine interaktiivisine ohjeineen ja rakenteellisine oppimispolkuineen.**

#### Added
- **🎥 Interactive Workshop Guide**: Selaimessa toimiva workshop-kokemus MkDocs-esikatselulla
- **📝 Structured Workshop Instructions**: 7-vaiheinen ohjattu oppimispolku löytämisestä muokkaamiseen
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs-konfiguraatio Material-teemalla parannetulle oppimiskokemukselle
- **🎯 Hands-On Learning Path**: 3-vaiheinen metodologia (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Saumaton kehitysympäristön käyttöönotto

#### Enhanced
- **AI Workshop Lab**: Laajennettu 2–3 tunnin rakenteelliseksi oppimiskokemukseksi
- **Workshop Documentation**: Ammattimainen esitys navigaatiolla ja visuaalisilla avuilla
- **Learning Progression**: Selkeä askel-askeleelta -ohjeistus mallipohjan valinnasta tuotantoon saattamiseen
- **Developer Experience**: Integroituja työkaluja kehitysprosessin tehostamiseksi

#### Improved
- **Accessibility**: Selaimessa toimiva käyttöliittymä, haku, kopiointi ja teeman vaihto
- **Self-Paced Learning**: Joustava workshop-rakenne eri oppimistahtien tukemiseksi
- **Practical Application**: Todellisia AI-mallien käyttöönoton skenaarioita
- **Community Integration**: Discord-integrointi workshop-tukea ja yhteistyötä varten

#### Workshop Features
- **Built-in Search**: Nopea avainsana- ja oppitason haku
- **Copy Code Blocks**: Hover-kopiointi kaikille koodiesimerkeille
- **Theme Toggle**: Tumma/vaalea teema-valinta eri mieltymyksille
- **Visual Assets**: Kuvakaappaukset ja kaaviot paremman ymmärryksen tukena
- **Help Integration**: Suora Discord-yhteys yhteisötukea varten

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Tässä versiossa otetaan käyttöön kattava luku­pohjainen oppimisrakenne ja parannettu navigaatio koko repositorioon.**

#### Added
- **📚 Chapter-Based Learning System**: Koko kurssi uudelleenjärjestetty 8 etenevään oppilukuun
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Johdonmukaiset navigointipäätteet ja alatunnisteet kaikissa dokumenteissa
- **🎯 Progress Tracking**: Kurssin suorituschecklista ja oppimisen varmennusjärjestelmä
- **🗺️ Learning Path Guidance**: Selkeät aloituspolut eri kokemustasoille ja tavoitteille
- **🔗 Cross-Reference Navigation**: Liittyvät luvut ja esivaatimukset selkeästi linkitettyinä

#### Enhanced
- **README Structure**: Muutettu rakenteelliseksi oppimisalustaksi luku­pohjaisella organisoinnilla
- **Documentation Navigation**: Jokaisella sivulla nyt luvun konteksti ja etenemisohjeistus
- **Template Organization**: Esimerkit ja mallipohjat kartoitettu oikeisiin lukuihin
- **Resource Integration**: Pikaohjeet, UKK ja opintomateriaalit yhdistetty asiaankuuluviin lukuihin
- **Workshop Integration**: Hands-on labit sovitettu monen luvun oppimistavoitteisiin

#### Changed
- **Learning Progression**: Siirtyminen lineaarisesta dokumentoinnista joustavaan luku­pohjaiseen oppimiseen
- **Configuration Placement**: Konfiguraatio-ohje sijoitettu Lukuun 3 paremman oppimisvirran vuoksi
- **AI Content Integration**: AI-spesifinen sisältö paremmin integroituna oppimispolkuun
- **Production Content**: Edistyneet mallit koottu Lukuun 8 yrityskäyttäjille

#### Improved
- **User Experience**: Selkeät navigointipolut ja luvun etenemisindikaattorit
- **Accessibility**: Johdonmukaiset navigointikäytännöt helppoon kurssin läpikäyntiin
- **Professional Presentation**: Yliopistotyyppinen kurssirakenne soveltuu akateemiseen ja yrityskoulutukseen
- **Learning Efficiency**: Lyhennetty aika oikean sisällön löytämiseen parannetun organisoinnin ansiosta

#### Technical Implementation
- **Navigation Headers**: Standardoidut lukunavigoinnit yli 40 dokumenttitiedostossa
- **Footer Navigation**: Johdonmukaiset etenemisehdotukset ja suoritusmerkit alatunnisteessa
- **Cross-Linking**: Laaja sisäinen linkitysjärjestelmä yhdistää aiheita
- **Chapter Mapping**: Mallit ja esimerkit selkeästi sidottu oppimistavoitteisiin

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Opas uudelleenjärjestetty vastaamaan 8-luvun järjestelmää
- **🎯 Chapter-Based Assessment**: Jokaisessa luvussa omat oppimistavoitteet ja käytännön harjoitukset
- **📋 Progress Tracking**: Viikkokohtainen oppimisaikataulu mitattavilla tuloksilla ja checklisteillä
- **❓ Assessment Questions**: Osaamisen varmistuskysymykset jokaisessa luvussa ammatillisilla lopputuloksilla
- **🛠️ Practical Exercises**: Käytännön tehtäviä todellisilla käyttöönotto- ja vianmääritysskenaarioilla
- **📊 Skill Progression**: Selkeä eteneminen perusasioista yritystason malleihin ja urakehitykseen
- **🎓 Certification Framework**: Ammatillinen kehitys ja yhteisön tunnustamisjärjestelmä
- **⏱️ Timeline Management**: Rakenteellinen 10-viikkoinen oppimissuunnitelma välitarkistuksilla

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Tässä versiossa parannetaan multi-agent -ratkaisua vähittäiskaupalle paremmalla agentin nimeämisellä ja parannetulla dokumentaatiolla.**

#### Changed
- **Multi-Agent Terminology**: "Cora agent" korvattu termillä "Customer agent" vähittäiskaupan multi-agent -ratkaisussa selkeyden vuoksi
- **Agent Architecture**: Päivitetty kaikki dokumentaatio, ARM-mallit ja koodiesimerkit käyttämään "Customer agent" -nimitystä
- **Configuration Examples**: Modernisoidut agentin konfiguraatiomallit päivitettyillä nimikointikäytännöillä
- **Documentation Consistency**: Varmistettu, että kaikki viittaukset käyttävät ammattimaista, kuvaavaa agentinnimeämistä

#### Enhanced
- **ARM Template Package**: Päivitetty retail-multiagent-arm-template Customer agent -viittauksilla
- **Architecture Diagrams**: Päivitetyt Mermaid-kaaviot agentin nimeämisellä
- **Code Examples**: Python-luokat ja toteutusesimerkit käyttävät nyt CustomerAgent-nimeämistä
- **Environment Variables**: Kaikki deploy-skriptit päivitetty käyttämään CUSTOMER_AGENT_NAME -käytäntöä

#### Improved
- **Developer Experience**: Selkeämmät agenttien roolit ja vastuut dokumentaatiossa
- **Production Readiness**: Parempi yhdenmukaisuus yritysnimeämiskäytäntöjen kanssa
- **Learning Materials**: Intuitiivisempi agenttien nimeäminen opetustarkoituksiin
- **Template Usability**: Agenttien toimintojen ja käyttöönoton ymmärtäminen yksinkertaistuu

#### Technical Details
- Päivitetyt Mermaid-arkkitehtuurikaaviot CustomerAgent-viittauksilla
- CoraAgent-luokan nimet korvattu CustomerAgent-nimillä Python-esimerkeissä
- ARM-mallien JSON-konfiguraatiot muokattu käyttämään "customer"-agenttityyppiä
- Ympäristömuuttujat päivitetty CORA_AGENT_* → CUSTOMER_AGENT_* -käytäntöihin
- Päivitetty kaikki käyttöönotto-komennot ja konttikokoonpanot

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Tämä versio muuntaa repositorion kattavaksi AI-keskeiseksi oppimisresurssiksi Microsoft Foundry -integraation kera.**

#### Added
- **🤖 AI-First Learning Path**: Täydellinen uudelleenjärjestely AI-kehittäjät ja insinöörit etusijalla
- **Microsoft Foundry Integration Guide**: Kattava ohjeistus AZD:n yhdistämisestä Microsoft Foundry -palveluihin
- **AI Model Deployment Patterns**: Yksityiskohtainen opas mallin valintaan, konfigurointiin ja tuotantoon saattamisen strategioihin
- **AI Workshop Lab**: 2-3 hour hands-on workshop for converting AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Yrityskäyttöön sopivat mallit AI-kuormien skaalaamiseen, valvontaan ja suojaamiseen
- **AI-Specific Troubleshooting Guide**: Kattava vianmääritys Microsoft Foundry -malleille, Cognitive Servicesille ja AI-käyttöönotto-ongelmille
- **AI Template Gallery**: Esillä oleva kokoelma Microsoft Foundry -mallipohjia monimutkaisuusluokituksineen
- **Workshop Materials**: Täydellinen työpajan rakenne käytännön laboratorioineen ja viitemateriaaleineen

#### Enhanced
- **README Structure**: AI-kehittäjille suunnattu rakenne, sisältäen 45% yhteisön kiinnostustiedon Microsoft Foundry Discordista
- **Learning Paths**: Omistettu AI-kehittäjän oppimispolku rinnakkain perinteisten polkujen kanssa opiskelijoille ja DevOps-insinööreille
- **Template Recommendations**: Esiteltyjä AI-mallipohjia, mukaan lukien azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Community Integration**: Parannettu Discord-yhteisötuki AI-kohtaisille kanaville ja keskusteluille

#### Security & Production Focus
- **Managed Identity Patterns**: AI-kohtaiset todennus- ja suojausasetukset
- **Cost Optimization**: Token-käytön seuranta ja budjettikontrollit AI-kuormille
- **Multi-Region Deployment**: Strategiat globaaliin AI-sovellusten käyttöönottoon
- **Performance Monitoring**: AI-kohtaiset mittarit ja Application Insights -integraatio

#### Documentation Quality
- **Linear Course Structure**: Looginen eteneminen aloittelijasta edistyneisiin AI-käyttöönottoihin
- **Validated URLs**: Kaikki ulkoiset lähdekoodivaraston linkit tarkistettu ja saavutettavissa
- **Complete Reference**: Kaikki sisäiset dokumenttilinkit validoitu ja toimivia
- **Production Ready**: Yritystason käyttöönotto-mallit reaalimaailman esimerkeillä

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Kaikilla dokumentaatiovilla sivuilla on nyt Johdanto-, Oppimistavoitteet- ja Oppimistulokset-osiot
- **Navigation System**: Lisätty Edellinen/Seuraava -linkit kautta dokumentaation ohjatun oppimisen etenemiseksi
- **Study Guide**: Kattava study-guide.md, jossa oppimistavoitteet, harjoitustehtävät ja arviointimateriaalit
- **Professional Presentation**: Poistettiin kaikki emojit parannetun saavutettavuuden ja ammattimaisen ulkoasun vuoksi
- **Enhanced Content Structure**: Parannettu oppimateriaalien järjestys ja eteneminen

#### Changed
- **Documentation Format**: Standardoitu kaikki dokumentaatio johdonmukaiseen, oppimiskeskeiseen rakenteeseen
- **Navigation Flow**: Toteutettu looginen eteneminen kaikkien oppimateriaalien läpi
- **Content Presentation**: Poistettu koristeellisia elementtejä selkeämmän ja ammattimaisemman muodon hyväksi
- **Link Structure**: Päivitetty kaikki sisäiset linkit tukemaan uutta navigointijärjestelmää

#### Improved
- **Accessibility**: Poistettu emojien riippuvuudet paremman ruudunlukuohjelmien yhteensopivuuden vuoksi
- **Professional Appearance**: Selkeä, akateeminen esitystyyli sopii yritysoppimiseen
- **Learning Experience**: Rakenteellinen lähestymistapa selkeillä tavoitteilla ja tuloksilla kutakin oppituntia varten
- **Content Organization**: Parempi looginen virtaus ja yhteys aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Täydellinen getting-started -opassarja
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianmääritysresurssit ja debug-oppaat
  - Ennen käyttöönottoa tehtävät validointityökalut ja -menettelyt

- **Getting Started Module**
  - AZD Basics: Keskeiset käsitteet ja terminologia
  - Installation Guide: Alustakohtaiset asennusohjeet
  - Configuration Guide: Ympäristön asetusten ja todennuksen ohjeet
  - First Project Tutorial: Askel askeleelta käytännön oppiminen

- **Deployment and Provisioning Module**
  - Deployment Guide: Täydellinen työnkulun dokumentaatio
  - Provisioning Guide: Infrastructure as Code Bicepillä
  - Parhaat käytännöt tuotantokäyttöön
  - Monipalveluarkkitehtuurin mallit

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure-resurssien saatavuuden validointi
  - SKU Selection: Kattava ohje palvelutasovalinnoille
  - Pre-flight Checks: Automaattiset validointiskriptit (PowerShell ja Bash)
  - Kustannusarviointi ja budjetointityökalut

- **Troubleshooting Module**
  - Common Issues: Usein esiintyvät ongelmat ja ratkaisut
  - Debugging Guide: Systemaattiset vianmäärityksen menetelmät
  - Edistyneet diagnostiikkatekniikat ja työkalut
  - Suorituskyvyn valvonta ja optimointi

- **Resources and References**
  - Command Cheat Sheet: Pikaviite olennaisille komennoille
  - Glossary: Kattava käsitteiden ja lyhenteiden sanasto
  - FAQ: Yksityiskohtaiset vastaukset usein kysyttyihin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteisöyhteydet

- **Examples and Templates**
  - Yksinkertainen web-sovellus-esimerkki
  - Staattisen verkkosivuston käyttöönoton malli
  - Konttisovelluksen konfiguraatio
  - Tietokantaintegraation mallit
  - Mikropalveluarkkitehtuurin esimerkit
  - Serverless-funktioiden toteutukset

#### Features
- **Multi-Platform Support**: Asennus- ja konfigurointioppaat Windowsille, macOS:lle ja Linuxille
- **Multiple Skill Levels**: Sisältö suunniteltu opiskelijoista ammattilaiskehittäjiin
- **Practical Focus**: Käytännön esimerkit ja todelliset skenaariot
- **Comprehensive Coverage**: Peruskäsitteistä edistyneisiin yritysmallleihin
- **Security-First Approach**: Turvallisuusparhaat käytännöt integroituna läpi dokumentaation
- **Cost Optimization**: Ohjeistus kustannustehokkaaseen käyttöönottoon ja resurssien hallintaan

#### Documentation Quality
- **Detailed Code Examples**: Käytännön, testatut koodiesimerkit
- **Step-by-Step Instructions**: Selkeät ja toteuttamiskelpoiset ohjeet
- **Comprehensive Error Handling**: Vianmääritys yleisille ongelmille
- **Best Practices Integration**: Alan standardit ja suositukset
- **Version Compatibility**: Ajantasainen uusimpien Azure-palveluiden ja azd-ominaisuuksien kanssa

## Planned Future Enhancements

### Version 3.1.0 (Suunnitteilla)
#### AI Platform Expansion
- **Multi-Model Support**: Integraatiomallit Hugging Faceen, Azure Machine Learningiin ja mukautettuihin malleihin
- **AI Agent Frameworks**: Mallipohjat LangChainille, Semantic Kernelille ja AutoGen-käyttöönotoille
- **Advanced RAG Patterns**: Vektoripohjaisten tietokantojen vaihtoehdot Azure AI Searchin ulkopuolella (Pinecone, Weaviate jne.)
- **AI Observability**: Laajennettu valvonta mallien suorituskyvylle, token-käytölle ja vastausten laadulle

#### Developer Experience
- **VS Code Extension**: Integroitu AZD + Microsoft Foundry -kehityskokemus
- **GitHub Copilot Integration**: AI-avusteinen AZD-mallipohjien luonti
- **Interactive Tutorials**: Käytännön koodiharjoituksia automaattisella validoinnilla AI-skenaarioissa
- **Video Content**: Täydennysvideot AI-käyttöönottoihin keskittyville visuaalisille oppijoille

### Version 4.0.0 (Suunnitteilla)
#### Enterprise AI Patterns
- **Governance Framework**: AI-mallien hallinta, vaatimustenmukaisuus ja auditointi
- **Multi-Tenant AI**: Mallit useiden asiakkaiden palvelemiseen eristetyillä AI-palveluilla
- **Edge AI Deployment**: Integraatio Azure IoT Edgen ja kontti-instanssien kanssa
- **Hybrid Cloud AI**: Monipilvi- ja hybridi käyttöönottojen mallit AI-kuormille

#### Advanced Features
- **AI Pipeline Automation**: MLOps-integraatio Azure Machine Learning -putkien kanssa
- **Advanced Security**: Zero-trust-mallit, yksityiset päätepisteet ja kehittynyt uhkien suojaus
- **Performance Optimization**: Kehittynyt viritys ja skaalautumisstrategiat suurille AI-latauksille
- **Global Distribution**: Sisällön jakelu ja edge-välimuistitus AI-sovelluksille

### Version 3.0.0 (Suunnitteilla) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Kattava Microsoft Foundry -integraatio (Valmis)
- ✅ **Interactive Tutorials**: Käytännön AI-työpaja (Valmis)
- ✅ **Advanced Security Module**: AI-kohtaiset turvallisuusmallit (Valmis)
- ✅ **Performance Optimization**: AI-kuormien viritysstrategiat (Valmis)

### Version 2.1.0 (Suunnitteilla) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-kohdennetut käyttöönotto-skenaariot (Valmis)
- ✅ **Extended FAQ**: AI-spesifiset kysymykset ja vianmääritys (Valmis)
- **Tool Integration**: Parannetut IDE- ja editori-integraatio-oppaat
- ✅ **Monitoring Expansion**: AI-kohtainen valvonta ja hälytysmallit (Valmis)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsiivinen suunnittelu mobiilioppimiseen
- **Offline Access**: Ladattavat dokumentaatiopakettit
- **Enhanced IDE Integration**: VS Code -laajennus AZD + AI-työnkulkuihin
- **Community Dashboard**: Reaaliaikaiset yhteisömittarit ja kontribuutioseuranta

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- Uudet ominaisuudet, dokumentaatio-osiot tai kyvykkyydet
- Uudet esimerkit, mallipohjat tai oppimateriaalit
- Lisätyt työkalut, skriptit tai apuohjelmat

#### Changed
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai organisaation uudelleenjärjestelyt

#### Deprecated
- Ominaisuudet tai lähestymistavat, joita aletaan poistaa käytöstä
- Dokumentaatio-osiot, jotka on aikataulutettu poistettaviksi
- Menetelmät, joille on parempia vaihtoehtoja

#### Removed
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät ole enää relevantteja
- Vanhentunut tieto tai poistettavat lähestymistavat
- Redundantti tai yhdistetty sisältö

#### Fixed
- Korjaukset dokumentaatio- tai koodivirheisiin
- Raportoitujen ongelmien tai virheiden ratkaisut
- Tarkkuuden tai toiminnallisuuden parannukset

#### Security
- Turvallisuuteen liittyvät parannukset tai korjaukset
- Päivitykset turvallisuusparhaisiin käytäntöihin
- Turvallisuusvulnerabiliteettien korjaukset

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Katkoviat muutokset, jotka vaativat käyttäjätoimenpiteitä
- Merkittävä sisällön tai organisaation uudelleenjärjestely
- Muutokset, jotka muuttavat perustavanlaatuista lähestymistapaa tai metodologiaa

#### Minor Version (X.Y.0)
- Uudet ominaisuudet tai sisältölisäykset
- Parannukset, jotka säilyttävät taaksepäin yhteensopivuuden
- Lisäesimerkit, työkalut tai resurssit

#### Patch Version (X.Y.Z)
- Virhekorjaukset ja korjaukset
- Pienet parannukset olemassa olevaan sisältöön
- Selvennykset ja pienet täydennykset

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Raportoi ongelmat tai tee parannusehdotuksia (AI-spesifiset ongelmat tervetulleita)
- **Discord Discussions**: Jaa ideoita ja osallistu Microsoft Foundry -yhteisöön
- **Pull Requests**: Tee suoria parannuksia sisältöön, erityisesti AI-mallipohjiin ja oppaisiin
- **Microsoft Foundry Discord**: Osallistu #Azure-kanavalla AZD + AI -keskusteluihin
- **Community Forums**: Osallistu laajempiin Azure-kehittäjäkeskusteluihin

### Feedback Categories
- **AI Content Accuracy**: Korjaukset AI-palveluintegraation ja käyttöönoton tiedoissa
- **Learning Experience**: Ehdotukset AI-kehittäjän oppimiskokemuksen parantamiseksi
- **Missing AI Content**: Pyynnöt lisä-AI-mallipohjista, malleista tai esimerkeistä
- **Accessibility**: Parannukset monimuotoisiin oppimistarpeisiin
- **AI Tool Integration**: Ehdotukset paremmasta AI-kehitystyönkulun integroinnista
- **Production AI Patterns**: Pyyntöjä yritystason AI-käyttöönoton malleista

### Response Commitment
- **Issue Response**: Vastataan 48 tunnin kuluessa raportoiduista ongelmista
- **Feature Requests**: Arvioidaan viikon kuluessa
- **Community Contributions**: Tarkastetaan viikon kuluessa
- **Security Issues**: Käsitellään välittömänä prioriteettina nopeutetulla vasteella

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Sisällön tarkkuuden ja linkkien validointi
- **Quarterly Updates**: Merkittävät sisältölisäykset ja parannukset
- **Semi-Annual Reviews**: Kattavat uudelleenjärjestelyt ja parannukset
- **Annual Releases**: Merkittävät versiojulkaisut suurilla parannuksilla

### Monitoring and Quality Assurance
- **Automated Testing**: Säännöllinen validointi koodiesimerkeille ja linkeille
- **Community Feedback Integration**: Käyttäjäpalautteen säännöllinen sisällyttäminen
- **Technology Updates**: Linjaus uusimpien Azure-palveluiden ja azd-julkaisujen kanssa
- **Accessibility Audits**: Säännöllinen tarkastus inklusiivisen suunnittelun periaatteille

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Täysi tuki ja säännölliset päivitykset
- **Previous Major Version**: Turvallisuuspäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Legacy Versions**: Vain yhteisön tuki, ei virallisia päivityksiä

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Askel askeleelta siirtymisohjeet
- **Compatibility Notes**: Yksityiskohdat katkoviasta muutoksista
- **Tool Support**: Skriptit tai työkalut migraation avuksi
- **Community Support**: Omistetut foorumit migraatiosi kysymyksille

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Seuraa tätä arkistoa saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä päivityksistä oppimateriaaleihin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
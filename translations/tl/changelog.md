# Tala ng Pagbabago - AZD Para sa mga Nagsisimula

## Panimula

Ang tala ng pagbabago na ito ay dokumentado ang lahat ng kapansin-pansing pagbabago, pag-update, at pagpapabuti sa repositoryong AZD Para sa mga Nagsisimula. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinananatili ang talaang ito upang tulungan ang mga gumagamit maunawaan kung ano ang nagbago sa pagitan ng mga bersyon.

## Mga Layunin sa Pag-aaral

Sa pamamagitan ng pagrerebyu sa tala ng pagbabago na ito, ikaw ay:
- Mananatiling may kaalaman tungkol sa mga bagong tampok at karagdagang nilalaman
- Mauunawaan ang mga pagpapabuti na ginawa sa umiiral na dokumentasyon
- Masusubaybayan ang mga pag-aayos ng bug at koreksyon upang matiyak ang katumpakan
- Susundan ang ebolusyon ng materyales sa pag-aaral sa paglipas ng panahon

## Mga Kinalabasan ng Pagkatuto

Matapos suriin ang mga entry sa tala ng pagbabago, magagawa mong:
- Tukuyin ang bagong nilalaman at mga mapagkukunan na magagamit para sa pag-aaral
- Mauunawaan kung aling mga seksyon ang na-update o napabuti
- Planuhin ang iyong landas sa pagkatuto batay sa pinakabagong mga materyales
- Magbigay ng puna at mga mungkahi para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Isinara ng bersyong ito ang mga natitirang intermediate na agwat na lumitaw mula sa azd-coverage analysis: kung paano gumawa at mag-publish ng iyong sariling template, reproducible na dev-container/Codespaces environments, ang Pulumi infrastructure provider, walkthrough ng Azure DevOps CI/CD, service-principal authentication, gabay sa pagpili ng host (AKS/Spring Apps), mga paliwanag tungkol sa `azd restore`/`azd package`, paghawak ng error sa hooks, at mga kasanayan para sa koponan/pinagsamang mga kapaligiran.**

#### Idinagdag
- **🧱 Bagong Kabanata 4 aralin** `docs/chapter-04-infrastructure/custom-templates.md` — pagsusulat ng iyong sariling azd template: kinakailangang istruktura (`azure.yaml`, `infra/`, `src/`), ang `metadata.template` field, pag-parameterize ng imprastruktura gamit ang `uniqueString()` resource token at `azd-env-name` tag, pag-test nang lokal gamit ang `azd init --template <local-path>`, pag-publish sa GitHub, at pagsusumite sa Awesome AZD gallery
- **📦 Bagong Kabanata 1 aralin** `docs/chapter-01-foundation/dev-containers.md` — reproducible na azd environments gamit ang Dev Containers at GitHub Codespaces: isang minimal na `.devcontainer/devcontainer.json` na gumagamit ng opisyal na `ghcr.io/azure/azure-dev/azd` feature, language-specific na features, `docker-in-docker` para sa mga container host, at `azd auth login --use-device-code` para sa remote sign-in
- **🧩 Pulumi with azd** na seksyon sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi folder layout, mga stack na naka-map sa azd environments, kinakailangang outputs/tagging, at ang pareho na `azd up` / `azd down` workflow
- **🎯 Gabay sa pagpili ng host** sa `docs/chapter-04-infrastructure/provisioning.md` — isang beginner-friendly na paghahambing ng `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, at `springapp`, kasama ang gabay kung kailan pipiliin ang AKS o Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** sa `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection gamit ang workload identity federation (OIDC), ang generated na `azure-dev.yml`, at setup ng variable-group
- **🔑 Service Principals (Pattern 4)** idinagdag sa `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` gamit ang client secret vs. federated/OIDC credentials, kailan gagamitin, at ligtas na pag-imbak ng kredensyal
- **🪝 Paghawak ng error sa Hook** subseksyon sa `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes at `set -e`, `continueOnError`, pag-test ng hooks nang hiwalay gamit ang `azd hooks run`, OS-specific na mga shell, at `--debug`
- **👥 Koponan / pinagsamang mga kapaligiran** na seksyon sa `docs/chapter-03-configuration/configuration.md` — kung ano ang naninirahan sa `.azure/`, ano ang dapat i-gitignore, per-developer environments, `azd env list`/`select`, at pagbibigay ng mga halaga ng environment sa CI/CD
- **🧰 `azd restore` at pinalawak na mga paliwanag ng `azd package`** sa `resources/cheat-sheet.md` — pag-restore ng dependencies at pagbuo ng deployable artifact nang hindi nagde-deploy

#### Binago
- **🧭 Talahanayan ng mga aralin sa Kabanata 4** na in-update upang isama ang bagong "Authoring Your Own Template" na aralin (Aralin 3)
- **🧭 Talahanayan ng mga aralin sa Kabanata 1** na in-update upang isama ang bagong "Dev Containers & Codespaces" na aralin (Aralin 5); ang navigation footers ay naka-wire sa pagitan ng `bring-your-own-app.md` at `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Isinara ng bersyong ito ang pinakamalalaking agwat para sa isang kumpletong gabay para sa mga nagsisimula sa pamamagitan ng pagdagdag ng dalawang bagong hands-on na aralin (isang deployable multi-agent walkthrough at pagdaragdag ng azd sa umiiral na app), isang beginner-friendly na panimula sa hooks, isang Terraform-with-azd na seksyon, isang step-by-step na GitHub Actions pipeline walkthrough, isang paliwanag para sa mga bagong preview extensions, at isang tiyak na deployment-verification checklist.**

#### Idinagdag
- **🤝 Bagong Kabanata 5 aralin** `docs/chapter-05-multi-agent/multi-agent-basics.md` — isang ganap na hands-on, deployable na two-agent walkthrough (orchestrator + specialists) gamit ang isang totoong template (`contoso-creative-writer`), tumatalakay kung kailan gagamit ng multi-agent, ang `azd up` workflow, pag-unawa sa mga na-deploy na resources, cross-agent tracing, customization, at cleanup
- **📦 Bagong Kabanata 1 aralin** `docs/chapter-01-foundation/bring-your-own-app.md` — kung paano idagdag ang azd sa umiiral na proyekto gamit ang `azd init` ("use code in the current directory"), pag-unawa sa `azure.yaml` at `infra/`, `azd infra generate`, host detection, at pagde-deploy gamit ang `azd up`
- **🌐 Terraform with azd** na seksyon idinagdag sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` folder layout, kinakailangang `AZURE_*` outputs at `azd-env-name` tagging, at ang pareho na `azd up` / `azd down` workflow (isinasara ang agwat kung saan ang suporta sa Terraform ay binanggit ngunit Bicep lang ang ipinakita)
- **⚙️ Step-by-step GitHub Actions walkthrough** sa `docs/chapter-08-production/production-ai-practices.md` — mula sa GitHub repo hanggang automated deploys: `azd pipeline config`, OIDC federated credentials (walang naka-imbak na secrets), ang generated na `azure-dev.yml`, at mga patnubay tungkol sa secrets-vs-variables
- **🪝 Panimulang "Bago sa hooks?" na introduksyon** sa `docs/chapter-04-infrastructure/deployment-guide.md` — ano ang hook, isang hook-stage table, isang minimal na unang hook, at pagpapatakbo ng hooks nang manu-mano gamit ang `azd hooks run`
- **✅ "Verify Your Deployment" checklist** idinagdag sa Hakbang 5 ng `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, at tiyak na success criteria
- **🧩 Paliwanag para sa mga bagong preview extensions** `azure.ai.skills` at `azure.ai.connections` (kung ano ang mga ito at kailan gagamitin) sa `docs/chapter-08-production/production-ai-practices.md`

#### Binago
- **🧭 Talahanayan ng mga aralin sa Kabanata 5** na naitama: ang `multi-agent-basics.md` ay ngayon Aralin 1 (ang nag-iisang ganap na hands-on na aralin), na may tapat na pag-label na ang Aralin 2 ay nasa Kabanata 6 at ang Retail scenario ay isang architecture blueprint, hindi isang one-command template
- **🧭 Talahanayan ng mga aralin sa Kabanata 1** ngayon ay nagsasama ng bagong "Bring Your Own App" na aralin (Aralin 4)
- **🔗 Navigation footers** na na-update: ang `first-project.md` ngayon ay nagli-link pasulong sa `bring-your-own-app.md`

#### Naayos
- **🧱 Isinara ang "binanggit pero nawawala" na Terraform gap** — ang kurso dati ay tumutukoy sa suporta sa Terraform nang hindi ito ipinapakita
- **🔀 Itinama ang nakalilitong cross-links sa Kabanata 5** na nagpapahiwatig na may buong multi-agent implementation habang arkitektural lamang ang blueprint

#### Mga Na-update na File
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(bago)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(bago)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**I-revalidate ng bersyong ito ang kurso laban sa `azd` `1.25.6` (Hunyo 2026) at ang `azure.ai.agents` `0.1.40-preview` extension, pinapalawak ang AI guidance mula sa "scaffold an agent" hanggang sa kumpletong agent lifecycle (test → evaluate → optimize → inspect → delete), inilalantad ang bagong `azure.ai.skills` at `azure.ai.connections` preview extensions, at binanggit ang ".NET Aspire" → "Aspire" na rebrand ng produkto.**

#### Idinagdag
- **🔁 Kumpletong coverage ng agent lifecycle** para sa mga nagsisimula at AI engineers sa buong dokumentasyon:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle table (scaffold → test → measure → improve → inspect → clean up) idinagdag sa Extensions and AI Commands section
  - `docs/chapter-08-production/production-ai-practices.md` — Bagong "Managing the Agent Lifecycle" na seksyon na tumatalakay sa `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
  - `resources/cheat-sheet.md` — Pinalawak na AI Agent Commands na may `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
- **🧩 Mga bagong preview extensions** na dokumentado: `azure.ai.skills` (mga reusable na agent skills) at `azure.ai.connections` (Foundry connections) idinagdag sa extensions table at cheat sheet
- **⏱️ Gabay sa response-timing** — ang mga halimbawa ng `azd ai agent invoke` ay ngayon nagtatala na nagpi-print ng total latency at time-to-first-byte
- **📌 Version banner** sa root README na nagtuturo sa mga nag-aaral sa `azd version` at `azd upgrade`

#### Binago
- **✅ Validation baseline na in-update** mula sa `azd 1.23.12` (Marso 2026) hanggang `azd 1.25.6` (Hunyo 2026) sa lahat ng chapter READMEs at sa workshop docs
- **🤖 Tala sa extension ng Kabanata 2** in-update mula `azure.ai.agents` `0.1.18-preview` hanggang `0.1.40-preview`
- **🧪 Halimbawa ng workshop validation** (`azd version` output) in-update sa `1.25.6`
- **🧭 README "What's New in azd Today"** na ni-refresh upang i-highlight ang end-to-end agent lifecycle, bagong AI extensions, at mga kamakailang quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** ngayon ay nagtuturo sa mga nag-aaral patungkol sa post-deploy lifecycle commands sa halip na huminto sa `azd up`

#### Naayos
- **🏷️ Pangalan ng produkto** — idinagdag ang tala tungkol sa rebrand ng Aspire (ang ".NET Aspire" ay ngayon simpleng "Aspire"); walang pagbabago sa suporta ng azd para sa Aspire
- **🔎 Live release validation** kinumpirma laban sa Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) at `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Mga Na-update na File
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
#### Paglilinaw sa Onboarding para sa Mga Nagsisimula, Pagpapatunay ng Setup at Panghuling Paglilinis ng Mga Utos ng AZD
**Sinusundan ng bersyong ito ang AZD 1.23 validation sweep na may isang dokumentasyong pag-pass na nakatuon sa mga nagsisimula: nililinaw nito ang AZD-first na gabay sa authentication, nagdaragdag ng mga lokal na script para sa pagpapatunay ng setup, sinusuri ang mga pangunahing utos laban sa live na AZD CLI, at inaalis ang huling lipas na mga sanggunian ng utos mula sa English-source na nasa labas ng changelog.**

#### Idinagdag
- **🧪 Mga script para sa pagpapatunay ng setup para sa mga nagsisimula** na may `validate-setup.ps1` at `validate-setup.sh` para makumpirma ng mga nag-aaral ang mga kinakailangang tool bago simulan ang Kabanata 1
- **✅ Mga paunang hakbang para sa pagpapatunay ng setup** sa README sa root at README ng Kabanata 1 upang mahuli ang mga nawawalang kinakailangan bago ang `azd up`

#### Binago
- **🔐 Gabay sa authentication para sa mga nagsisimula** ngayon pare-parehong itinuturing ang `azd auth login` bilang pangunahing landas para sa mga AZD workflow, habang ang `az login` ay tinutukoy bilang opsyonal maliban kung direktang ginagamit ang mga Azure CLI na utos
- **📚 Ang onboarding flow ng Kabanata 1** ngayon itinuturo ang mga nag-aaral na i-validate ang kanilang lokal na setup bago ang pag-install, authentication, at unang mga hakbang sa deployment
- **🛠️ Mensahe ng validator** ngayon malinaw na naghihiwalay ng mga kinakailangang dapat ayusin muna mula sa mga opsyonal na babala ng Azure CLI para sa landas na AZD-lamang para sa mga nagsisimula
- **📖 Ang mga dokumento sa configuration, troubleshooting, at mga halimbawa** ngayon pinag-iiba ang kinakailangang AZD authentication at opsyonal na pag-sign-in sa Azure CLI kung saan dating ipinakita nang walang konteksto ang pareho

#### Naayos
- **📋 Natitirang mga sanggunian ng utos mula sa English-source** na na-update sa kasalukuyang anyo ng AZD, kabilang ang `azd config show` sa cheat sheet at `azd monitor --overview` kung saan ang patnubay para sa Azure Portal overview ang nilayon
- **🧭 Mga pangako para sa mga nagsisimula sa Kabanata 1** pinahuhina upang iwasang mangako ng garantisadong walang-error o rollback na pag-uugali sa lahat ng template at Azure resources
- **🔎 Kinumpirma ng live CLI validation** ang kasalukuyang suporta para sa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, at `azd down --force --purge`

#### Mga Na-update na File
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

#### AZD 1.23.12 Validation, Pagpapalawak ng Kapaligiran ng Workshop at Pag-refresh ng AI Model
**Gumagawa ang bersyong ito ng dokumentasyong validation sweep laban sa `azd` `1.23.12`, ina-update ang mga lipas na halimbawa ng AZD na utos, nire-refresh ang gabay sa AI model sa kasalukuyang defaults, at pinalalawak ang mga instruksiyon ng workshop lampas sa GitHub Codespaces para suportahan din ang dev containers at lokal na clones.**

#### Idinagdag
- **✅ Mga tala ng validation sa mga pangunahing kabanata at dokumento ng workshop** upang gawing malinaw ang nasubok na AZD baseline para sa mga nag-aaral na gumagamit ng mas bagong o mas lumang CLI builds
- **⏱️ Gabay sa deployment timeout** para sa mga long-running na deployment ng AI app gamit ang `azd deploy --timeout 1800`
- **🔎 Mga hakbang para sa inspeksyon ng extension** gamit ang `azd extension show azure.ai.agents` sa mga dokumento ng AI workflow
- **🌐 Mas malawak na gabay sa kapaligiran ng workshop** na sumasaklaw sa GitHub Codespaces, dev containers, at lokal na clones gamit ang MkDocs

#### Binago
- **📚 Mga intro README ng kabanata** ngayon pare-parehong binabanggit ang validation laban sa `azd 1.23.12` sa foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, at production na seksyon
- **🛠️ Mga sanggunian ng AZD na utos** na na-update sa kasalukuyang anyo sa buong mga docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` depende sa konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kung ang Application Insights overview ang nilalayong ipakita
- **🧪 Mga halimbawa ng provision preview** pinasimple sa kasalukuyang suportadong paggamit tulad ng `azd provision --preview` at `azd provision --preview -e production`
- **🧭 Daloy ng workshop** in-update upang makumpleto ng mga nag-aaral ang mga lab sa Codespaces, dev container, o lokal na clone sa halip na ipalagay na Codespaces lamang ang gagamitin
- **🔐 Gabay sa authentication** ngayon mas pinapaboran ang `azd auth login` para sa mga AZD workflow, habang ang `az login` ay inilalagay bilang opsyonal kapag direktang ginagamit ang Azure CLI na mga utos

#### Naayos
- **🪟 Mga utos ng Windows install** inormalisa sa kasalukuyang casing ng `winget` sa installation guide
- **🐧 Gabay sa pag-install sa Linux** itinama upang iwasan ang hindi suportadong distro-specific na mga utos ng package manager para sa `azd` at sa halip ituro ang release assets kung naaangkop
- **📦 Mga halimbawa ng AI model** nirefresh mula sa mas lumang defaults tulad ng `gpt-35-turbo` at `text-embedding-ada-002` patungo sa kasalukuyang mga halimbawa tulad ng `gpt-4.1-mini`, `gpt-4.1`, at `text-embedding-3-large`
- **📋 Mga snippets ng deployment at diagnostics** itinama upang gumamit ng kasalukuyang mga command para sa environment at status sa logs, scripts, at mga hakbang sa troubleshooting
- **⚙️ Gabay sa GitHub Actions** in-update mula sa `Azure/setup-azd@v1.0.0` patungong `Azure/setup-azd@v2`
- **🤖 Gabay sa MCP/Copilot consent** in-update mula sa `azd mcp consent` patungong `azd copilot consent list`

#### Pinabuti
- **🧠 Gabay sa AI na kabanata** ngayon mas mahusay na nagpapaliwanag ng preview-sensitive na pag-uugali ng `azd ai`, tenant-specific na login, kasalukuyang paggamit ng extension, at mga inirerekomendang pamamaraan para sa pag-deploy ng model
- **🧪 Mga instruksiyon ng workshop** ngayon gumagamit ng mas makatotohanang mga halimbawa ng bersyon at mas malinaw na wika sa pag-setup ng kapaligiran para sa hands-on labs
- **📈 Mga dokumento sa production at troubleshooting** mas naka-align na ngayon sa kasalukuyang monitoring, fallback model, at mga halimbawa ng cost-tier

#### Mga Na-update na File
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

#### Mga Utos ng AZD AI CLI, Pag-validate ng Nilalaman at Pagpapalawak ng Template
**Idinagdag ng bersyong ito ang coverage para sa `azd ai`, `azd extension`, at `azd mcp` na mga utos sa lahat ng AI-related na kabanata, naayos ang sirang mga link at deprecated na code sa agents.md, in-update ang cheat sheet, at inayos muli ang seksyon ng Example Templates na may validated na mga deskripsyon at bagong Azure AI AZD templates.**

#### Idinagdag
- **🤖 Coverage para sa AZD AI CLI** sa 7 file (dating nasa Kabanata 8 lamang):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagong seksyong "Extensions and AI Commands" na nagpapakilala sa `azd extension`, `azd ai agent init`, at `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsyon 4: `azd ai agent init` na may comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Mga subseksyon na "AZD Extensions for Foundry" at "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start na ngayon nagpapakita ng parehong template at manifest-based na mga landas ng deployment
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Ang bahagi ng Deploy ngayon naglalaman din ng opsyon na `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseksyon na "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bagong seksyon na "AI & Extensions Commands" na may `azd extension`, `azd ai agent init`, `azd mcp`, at `azd infra generate`
- **📦 Mga bagong AZD AI example templates** sa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat na may Blazor WebAssembly, Semantic Kernel, at suporta sa voice chat
  - **azure-search-openai-demo-java** — Java RAG chat gamit ang Langchain4J na may mga pagpipiliang ACA/AKS para sa deployment
  - **contoso-creative-writer** — Multi-agent creative writing app gamit ang Azure AI Agent Service, Bing Grounding, at Prompty
  - **serverless-chat-langchainjs** — Serverless RAG gamit ang Azure Functions + LangChain.js + Cosmos DB na may Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator na may admin portal, Teams integration, at mga pagpipilian sa PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app na may mga server sa .NET, Python, Java, at TypeScript
  - **azd-ai-starter** — Minimal na Azure AI infrastructure Bicep starter template
  - **🔗 Link sa Awesome AZD AI Gallery** — Sanggunian sa [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Naayos
- **🔗 Pag-navigate sa agents.md**: Ang Previous/Next links ngayon tumutugma sa pagkakasunod-sunod ng mga aralin sa Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Sirang mga link sa agents.md**: `production-ai-practices.md` itinama sa `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 Deprecated na code sa agents.md**: Pinalitan ang `opencensus` ng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Invalid na API sa agents.md**: Inilipat ang `max_tokens` mula sa `create_agent()` papunta sa `create_run()` bilang `max_completion_tokens`
- **🔢 Pagbibilang ng token sa agents.md**: Pinalitan ang payak na pagtatantya na `len//4` ng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Itinama ang mga serbisyong mula sa "Cognitive Search + App Service" papunta sa "Azure AI Search + Azure Container Apps" (nagbago ang default host Okt 2024)
- **contoso-chat**: In-update ang deskripsyon upang tukuyin ang Azure AI Foundry + Prompty, na tumutugma sa aktwal na pamagat at tech stack ng repo

#### Tinanggal
- **ai-document-processing**: Tinanggal ang hindi gumaganang sanggunian ng template (ang repo ay hindi pampublikong naa-access bilang isang AZD template)

#### Pinabuti
- **📝 Mga exercise sa agents.md**: Exercise 1 ngayon nagpapakita ng inaasahang output at hakbang na `azd monitor`; Exercise 2 naglalaman ng buong `FunctionTool` registration code; Exercise 3 pinalitan ang malabong gabay ng konkretong `prepdocs.py` na mga utos
- **📚 Mga resources sa agents.md**: In-update ang mga link sa dokumentasyon sa kasalukuyang Azure AI Agent Service docs at quickstart
- **📋 Next Steps table sa agents.md**: Idinagdag ang AI Workshop Lab na link para sa kumpletong coverage ng kabanata

#### Mga Na-update na File
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Pagpapahusay ng Pag-navigate sa Kurso
**Pinapabuti ng bersyong ito ang pag-navigate sa mga kabanata ng README.md gamit ang pinahusay na format ng talahanayan.**

#### Binago
- **Talaan ng Mapa ng Kurso**: Pinahusay na may direktang mga link ng leksiyon, pagtatantya ng tagal, at mga rating ng kahirapan
- **Paglilinis ng Folder**: Tinanggal ang mga hindi kinakailangang lumang folder (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pagpapatunay ng Link**: Na-verify ang lahat ng 21+ internal na link sa Talaan ng Mapa ng Kurso

### [v3.16.0] - 2026-02-05

#### Mga Pagbabago sa Pangalan ng Produkto
**Ina-update ng bersyong ito ang mga sanggunian sa produkto ayon sa kasalukuyang branding ng Microsoft.**

#### Binago
- **Microsoft Foundry → Microsoft Foundry**: Na-update ang lahat ng sanggunian sa mga file na hindi para sa pagsasalin
- **Azure AI Agent Service → Foundry Agents**: In-update ang pangalan ng serbisyo upang ipakita ang kasalukuyang branding

#### Mga File na In-update
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Malaking Restructuring ng Repository: Mga Pangalan ng Folder na Batay sa Kabanata
**Inaayos ng bersyong ito ang dokumentasyon sa mga dedikadong folder ng kabanata para sa mas malinaw na pag-navigate.**

#### Pagpapalit ng Pangalan ng Folder
Pinalitan ang mga lumang folder ng mga folder na may numero ng kabanata:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Idinagdag: `docs/chapter-05-multi-agent/`

#### File Migrations
File | From | To
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

#### Idinagdag
- **📚 Mga README ng Kabanata**: Nilikha ang README.md sa bawat folder ng kabanata na may:
  - Mga layunin sa pagkatuto at tagal
  - Talaan ng leksyon na may mga paglalarawan
  - Mga mabilis na utos para sa pagsisimula
  - Pag-navigate sa iba pang mga kabanata

#### Binago
- **🔗 In-update ang lahat ng internal na link**: 78+ mga path na in-update sa buong mga dokumento
- **🗺️ Main README.md**: In-update ang Course Map na may bagong istraktura ng kabanata
- **📝 examples/README.md**: In-update ang mga cross-reference sa mga folder ng kabanata

#### Tinanggal
- Lumang istraktura ng folder (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructuring ng Repository: Pag-navigate ng Kabanata
**Idinagdag ng bersyong ito ang mga README ng pag-navigate ng kabanata (napalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Bagong Gabay sa AI Agents
**Idinagdag ng bersyong ito ang isang komprehensibong gabay para sa pag-deploy ng AI agents gamit ang Azure Developer CLI.**

#### Idinagdag
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang mga AI agents at paano sila naiiba mula sa mga chatbot
  - Tatlong quick-start na template ng agent (Foundry Agents, Prompty, RAG)
  - Mga pattern ng arkitektura ng agent (single agent, RAG, multi-agent)
  - Konfigurasyon ng tool at pag-customize
  - Pagsubaybay at pag-track ng metrics
  - Mga konsiderasyon sa gastos at pag-optimize
  - Karaniwang mga senaryo ng troubleshooting
  - Tatlong hands-on na pagsasanay na may mga success criteria

#### Istruktura ng Nilalaman
- **Introduction**: Mga konsepto ng agent para sa mga baguhan
- **Quick Start**: I-deploy ang mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual na mga diagram ng mga pattern ng agent
- **Configuration**: Setup ng tool at mga environment variable
- **Monitoring**: Integrasyon ng Application Insights
- **Exercises**: Progressive na hands-on na pag-aaral (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### Update ng DevContainer Environment
**Ina-update ng bersyong ito ang configuration ng development container gamit ang modernong mga tool at mas mabubuting default para sa karanasan sa pag-aaral ng AZD.**

#### Binago
- **🐳 Base Image**: In-update mula sa `python:3.12-bullseye` hanggang `python:3.12-bookworm` (pinakabagong Debian stable)
- **📛 Container Name**: Pinalitan mula sa "Python 3" tungo sa "AZD for Beginners" para sa kalinawan

#### Idinagdag
- **🔧 Mga Bagong Tampok ng Dev Container**:
  - `azure-cli` na may Bicep support na naka-enable
  - `node:20` (LTS na bersyon para sa mga AZD template)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa pag-deploy ng container app

- **🔌 Port Forwarding**: Pre-configured na mga port para sa karaniwang development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Mga Bagong VS Code Extension**:
  - `ms-python.vscode-pylance` - Pinahusay na Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Suporta para sa Azure Functions
  - `ms-azuretools.vscode-docker` - Suporta sa Docker
  - `ms-azuretools.vscode-bicep` - Suporta sa wika ng Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pamamahala ng Azure resources
  - `yzhang.markdown-all-in-one` - Pag-edit ng Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Suporta sa Mermaid diagram
  - `redhat.vscode-yaml` - Suporta sa YAML (para sa azure.yaml)
  - `eamodio.gitlens` - Visualisasyon ng Git
  - `mhutchie.git-graph` - Kasaysayan ng Git

- **⚙️ Mga Setting ng VS Code**: Idinagdag ang default na mga setting para sa Python interpreter, format on save, at whitespace trimming

- **📦 In-update ang requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang mga Azure SDK package (azure-identity, azure-mgmt-resource)

#### Naayos
- **Post-Create Command**: Ngayon ay sinusuri ang pag-install ng AZD at Azure CLI sa pagsisimula ng container

---

### [v3.11.0] - 2026-02-05

#### Malawakang Pag-aayos ng README para sa mga Baguhan
**Malaki ang pagpapabuti ng bersyong ito sa README.md para maging mas accessible sa mga baguhan at nagdaragdag ng mahahalagang resources para sa mga AI developer.**

#### Idinagdag
- **🆚 Azure CLI vs AZD Comparison**: Maliwanag na paliwanag kung kailan gagamitin ang bawat tool kasama ang mga praktikal na halimbawa
- **🌟 Awesome AZD Links**: Direktang mga link sa community template gallery at mga resource para sa kontribusyon:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Pinadaling 3-step na getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Maliwanag na gabay kung saan magsisimula batay sa karanasan ng developer

#### Binago
- **Istruktura ng README**: Inayos para sa progressive disclosure - pangunahing impormasyon muna
- **Seksyon ng Introduksyon**: Isinulat muli para ipaliwanag ang "The Magic of `azd up`" para sa mga ganap na baguhan
- **Tinanggal ang Dobleng Nilalaman**: Inalis ang duplicated troubleshooting section
- **Mga Utos sa Troubleshooting**: Inayos ang sanggunian sa `azd logs` upang gumamit ng valid na `azd monitor --logs`

#### Naayos
- **🔐 Mga Utos sa Authentication**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Mga Di-wastong Sanggunian sa Utos**: Inalis ang natitirang `azd logs` mula sa README troubleshooting section

#### Mga Tala
- **Saklaw**: Mga pagbabago na inilapat sa main README.md at resources/cheat-sheet.md
- **Target na Audyens**: Mga pagpapahusay na partikular na naka-target sa mga developer na bago sa AZD

---

### [v3.10.0] - 2026-02-05

#### Pagwawasto ng Katumpakan ng Azure Developer CLI Commands
**Inaayos ng bersyong ito ang mga hindi umiiral na AZD commands sa buong dokumentasyon, tinitiyak na ang lahat ng halimbawa ng code ay gumagamit ng wastong Azure Developer CLI syntax.**

#### Naayos
- **🔧 Inalis ang mga Hindi-Umiiral na AZD Commands**: Komprehensibong audit at pagkukwenta ng mga invalid na utos:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o alternatibong Azure CLI
  - `azd service` subcommands (hindi umiiral) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (hindi umiiral) → inalis o pinalitan ng valid na alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (hindi umiiral) → inalis
  - `azd provision --what-if/--rollback` flags (hindi umiiral) → in-update upang gumamit ng `--preview`
  - `azd config validate` (hindi umiiral) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hindi umiiral) → inalis

- **📚 Mga File na In-update na may Pagwawasto ng Commands**:
  - `resources/cheat-sheet.md`: Malaking overhaul ng command reference
  - `docs/deployment/deployment-guide.md`: Inayos ang rollback at deployment strategies
  - `docs/troubleshooting/debugging.md`: Inayos ang mga seksyon sa log analysis
  - `docs/troubleshooting/common-issues.md`: In-update ang mga troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Inayos ang AZD debugging section
  - `docs/getting-started/azd-basics.md`: Inayos ang monitoring commands
  - `docs/getting-started/first-project.md`: In-update ang monitoring at debugging examples
  - `docs/getting-started/installation.md`: Inayos ang help at version examples
  - `docs/pre-deployment/application-insights.md`: Inayos ang mga utos sa pagtingin ng logs
  - `docs/pre-deployment/coordination-patterns.md`: Inayos ang agent debugging commands

- **📝 In-update ang Sanggunian ng Bersyon**: 
  - `docs/getting-started/installation.md`: Pinalitan ang hardcoded `1.5.0` na bersyon ng generic na `1.x.x` na may link sa releases

#### Binago
- **Mga Estratehiya ng Rollback**: In-update ang dokumentasyon upang gumamit ng rollback na batay sa Git (walang native rollback ang AZD)
- **Pagtingin ng Logs**: Pinalitan ang mga sanggunian sa `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at Azure CLI commands
- **Seksyon ng Performance**: Inalis ang mga hindi umiiral na parallel/incremental deployment flags, at nagbigay ng mga valid na alternatibo

#### Teknikal na Detalye
- **Valid na AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid na azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Inalis na Mga Tampok**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Pagberipika**: Ang mga utos ay na-validate laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagkumpleto ng Workshop at Pagpapahusay ng Kalidad ng Dokumentasyon
**Kumpleto ang mga interactive workshop module sa bersyong ito, inayos ang lahat ng sirang mga link sa dokumentasyon, at pinabuti ang pangkalahatang kalidad ng nilalaman para sa mga AI developer na gumagamit ng Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng gabay sa kontribusyon na may:
  - Maliwanag na mga tagubilin para sa pag-uulat ng mga isyu at pagsumite ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga alituntunin sa halimbawa ng code at mga kombensiyon sa mensahe ng commit
  - Impormasyon tungkol sa pakikilahok ng komunidad

#### Nakumpleto
- **🎯 Workshop Module 7 (Wrap-up)**: Ganap na nakumpletong wrap-up module na may:
  - Komprehensibong buod ng mga natapos sa workshop
  - Seksyon ng mga pangunahing konsepto na natutunan na sumasaklaw sa AZD, mga template, at Microsoft Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng paglalakbay sa pagkatuto
  - Mga hamong ehersisyo ng workshop na may mga rating ng kahirapan
  - Mga link para sa feedback ng komunidad at suporta

- **📚 Workshop Module 3 (Deconstruct)**: Na-update na mga layunin sa pagkatuto na may:
  - Patnubay sa pag-activate ng GitHub Copilot kasama ang MCP servers
  - Pag-unawa sa istruktura ng folder ng mga AZD template
  - Mga pattern ng organisasyon para sa infrastructure-as-code (Bicep)
  - Mga instruksyon para sa hands-on na lab

- **🔧 Workshop Module 6 (Teardown)**: Natapos na kasama ang:
  - Mga layunin sa paglilinis ng mga resource at pamamahala ng gastos
  - Paggamit ng `azd down` para sa ligtas na deprovisioning ng imprastruktura
  - Patnubay sa pag-recover ng soft-deleted na cognitive services
  - Karagdagang mga prompt para sa eksplorasyon para sa GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Broken Link Fixes**: Naresolba ang 15+ sirang internal na mga link ng dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Naayos ang mga path patungo sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Naitama ang mga path ng ai-model-deployment.md at production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pinalitan ang hindi umiiral na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Naayos ang mga path ng FAQ at troubleshooting guide
  - `examples/container-app/microservices/README.md`: Naitama ang mga path ng course home at deployment guide
  - `resources/faq.md` and `resources/glossary.md`: Na-update ang mga sanggunian sa kabanata ng AI
  - `course-outline.md`: Naayos ang mga reference sa instructor guide at AI workshop lab

- **📅 Workshop Status Banner**: Na-update mula sa "Under Construction" patungo sa aktibong status ng workshop na may petsang Pebrero 2026

- **🔗 Workshop Navigation**: Naayos ang mga sirang navigation link sa workshop README.md na tumuturo sa hindi umiiral na folder na lab-1-azd-basics

#### Binago
- **Workshop Presentation**: Inalis ang babala na "under construction", kumpleto na ang workshop at handa nang gamitin
- **Navigation Consistency**: Tiniyak na ang lahat ng mga module ng workshop ay may wastong navigasyon sa pagitan ng mga module
- **Learning Path References**: Na-update ang mga cross-reference ng kabanata para gumamit ng tamang microsoft-foundry na mga path

#### Napatunayan
- ✅ Lahat ng Ingles na markdown file ay may wastong internal na mga link
- ✅ Kumpleto ang mga workshop module 0-7 na may mga layunin sa pagkatuto
- ✅ Gumagana nang tama ang navigasyon sa pagitan ng mga kabanata at module
- ✅ Ang nilalaman ay angkop para sa mga AI developer na gumagamit ng Microsoft AZD
- ✅ Napanatili ang wikang angkop sa mga baguhan at istruktura sa kabuuan
- ✅ Nagbibigay ang CONTRIBUTING.md ng malinaw na gabay para sa mga kontribyutor ng komunidad

#### Teknikal na Implementasyon
- **Link Validation**: Isang automated PowerShell script ang nag-verify ng lahat ng .md internal na link
- **Content Audit**: Manwal na review ng kabuuan ng workshop at pagiging angkop para sa mga baguhan
- **Navigation System**: Inilapat ang magkakatugmang mga pattern ng navigasyon ng kabanata at module

#### Mga Tala
- **Scope**: Ang mga pagbabago ay inilapat sa dokumentasyong Ingles lamang
- **Translations**: Hindi na-update ang mga folder ng pagsasalin sa bersyong ito (ang automated na pagsasalin ay magsi-sync mamaya)
- **Workshop Duration**: Nagbibigay na ang kumpletong workshop ng 3-4 na oras ng praktikal na pagkatuto

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Pagmomonitor, Seguridad, at Mga Pattern ng Multi-Agent
**Idinagdag ng bersyong ito ang komprehensibong A-grade na mga aralin sa integrasyon ng Application Insights, mga pattern ng authentication, at koordinasyon ng multi-agent para sa mga deployment sa produksiyon.**

#### Idinagdag
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - Deployment na naka-pokus sa AZD na may awtomatikong provisioning
  - Kumpletong mga Bicep template para sa Application Insights + Log Analytics
  - Mga gumagawang Python na aplikasyon na may custom na telemetry (1,200+ na linya)
  - Mga pattern ng pagmomonitor para sa AI/LLM (pagsubaybay ng token/gastos para sa Microsoft Foundry Models)
  - 6 na Mermaid diagrams (arkitektura, distributed tracing, daloy ng telemetry)
  - 3 praktikal na ehersisyo (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng Kusto query at mga estratehiya sa pag-optimize ng gastos
  - Live na streaming ng metrics at real-time na debugging
  - 40-50 minutong oras ng pagkatuto na may mga pattern na handa para sa produksiyon

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 mga pattern ng authentication (connection strings, Key Vault, managed identity)
  - Kumpletong mga Bicep infrastructure template para sa ligtas na deployment
  - Node.js kodigo ng aplikasyon na may integrasyon ng Azure SDK
  - 3 kumpletong ehersisyo (pag-enable ng managed identity, user-assigned identity, Key Vault rotation)
  - Pinakamahuhusay na kasanayan sa seguridad at mga konfigurasyon ng RBAC
  - Gabay sa troubleshooting at pagsusuri ng gastos
  - Mga pattern ng passwordless authentication na handa para sa produksiyon

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 mga pattern ng koordinasyon (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong implementasyon ng orchestrator service (Python/Flask, 1,500+ na linya)
  - 3 na espesyalisadong implementasyon ng agent (Research, Writer, Editor)
  - Integrasyon ng Service Bus para sa message queuing
  - Pamamahala ng estado gamit ang Cosmos DB para sa distributed systems
  - 6 na Mermaid diagrams na nagpapakita ng interaksyon ng mga agent
  - 3 advanced na ehersisyo (timeout handling, retry logic, circuit breaker)
  - Pagbabasag ng gastos ($240-565/buwan) na may mga estratehiya sa pag-optimize
  - Integrasyon ng Application Insights para sa pagmomonitor

#### Pinahusay
- **Pre-deployment Chapter**: Ngayon ay naglalaman ng komprehensibong mga pattern ng pagmomonitor at koordinasyon
- **Getting Started Chapter**: Pinahusay na may mga propesyonal na pattern ng authentication
- **Production Readiness**: Kumpletong saklaw mula seguridad hanggang observability
- **Course Outline**: Na-update upang i-referensya ang mga bagong aralin sa Kabanata 3 at 6

#### Binago
- **Learning Progression**: Mas mahusay na integrasyon ng seguridad at pagmomonitor sa buong kurso
- **Documentation Quality**: Konsistent na A-grade na mga pamantayan (95-97%) sa mga bagong aralin
- **Production Patterns**: Kumpletong end-to-end na saklaw para sa mga enterprise deployment

#### Pinabuti
- **Developer Experience**: Malinaw na landas mula development hanggang production monitoring
- **Security Standards**: Propesyonal na mga pattern para sa authentication at pamamahala ng mga secret
- **Observability**: Kumpletong integrasyon ng Application Insights kasama ang AZD
- **AI Workloads**: Espesyalisadong pagmomonitor para sa Microsoft Foundry Models at mga multi-agent system

#### Napatunayan
- ✅ Lahat ng aralin ay naglalaman ng kumpletong gumaganang kodigo (hindi snippets)
- ✅ Mermaid diagrams para sa visual na pagkatuto (19 kabuuan sa 3 aralin)
- ✅ Mga praktikal na ehersisyo na may mga hakbang ng beripikasyon (9 kabuuan)
- ✅ Mga Bicep template na handa para sa produksiyon na maideploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa pag-optimize
- ✅ Mga gabay sa troubleshooting at pinakamahuhusay na kasanayan
- ✅ Mga knowledge checkpoint na may mga verification command

#### Resulta ng Pag-grade ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa pagmomonitor
- **docs/getting-started/authsecurity.md**: - Propesyonal na mga pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Mga advanced na arkitekturang multi-agent
- **Overall New Content**: - Konsistent na mataas na pamantayan ng kalidad

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Mga estratehiya ng sampling, mga patakaran sa retention, kontrol ng badyet

### [v3.7.0] - 2025-11-19

#### Mga Pagpapabuti sa Kalidad ng Dokumentasyon at Bagong Halimbawa ng Microsoft Foundry Models
**Pinahusay ng bersyong ito ang kalidad ng dokumentasyon sa buong repository at nagdagdag ng kumpletong halimbawa ng deployment ng Microsoft Foundry Models na may gpt-4.1 chat interface.**

#### Idinagdag
- **🤖 Microsoft Foundry Models Chat Example**: Kumpletong gpt-4.1 deployment na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python na command-line chat interface na may kasaysayan ng pag-uusap
  - Integrasyon sa Key Vault para sa ligtas na pag-iimbak ng API key
  - Pagsubaybay ng paggamit ng token at pagtataya ng gastos
  - Paglilimita ng rate at pag-handle ng mga error
  - Komprehensibong README na may 35-45 minutong gabay sa deployment
  - 11 production-ready na file (mga Bicep template, Python app, configuration)
- **📚 Documentation Exercises**: Idinagdag ang mga praktikal na ehersisyo sa configuration guide:
  - Ehersisyo 1: Multi-environment configuration (15 minuto)
  - Ehersisyo 2: Pagsasanay sa pamamahala ng secret (10 minuto)
  - Malinaw na mga pamantayan ng tagumpay at mga hakbang ng beripikasyon
- **✅ Deployment Verification**: Idinagdag ang seksyon ng beripikasyon sa deployment guide:
  - Mga pamamaraan ng health check
  - Checklist ng mga pamantayan ng tagumpay
  - Inaasahang mga output para sa lahat ng deployment command
  - Mabilisang sanggunian sa troubleshooting

#### Pinahusay
- **examples/README.md**: Na-update sa kalidad na A-grade (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng mga kaugnay na seksyon
  - Na-update ang bilang ng lokal na halimbawa mula 3 hanggang 4
  - Idinagdag sa AI Application Examples table
  - Isinama sa Quick Start para sa mga Intermediate na User
  - Idinagdag sa seksyon ng Microsoft Foundry Templates
  - Na-update ang Comparison Matrix at mga seksyon ng paghahanap ng teknolohiya
- **Documentation Quality**: Pinabuti mula B+ (87%) → A- (92%) sa folder ng docs:
  - Idinagdag ang inaasahang mga output sa kritikal na halimbawa ng command
  - Kasama ang mga hakbang ng beripikasyon para sa mga pagbabago sa configuration
  - Pinahusay ang hands-on na pagkatuto gamit ang praktikal na mga ehersisyo

#### Binago
- **Learning Progression**: Mas mahusay na integrasyon ng mga halimbawa ng AI para sa mga intermediate na mag-aaral
- **Documentation Structure**: Mas maraming actionable na ehersisyo na may malinaw na resulta
- **Verification Process**: Idinagdag ang malinaw na mga pamantayan ng tagumpay sa mga pangunahing workflow

#### Pinabuti
- **Developer Experience**: Ngayon ang deployment ng Microsoft Foundry Models ay tumatagal ng 35-45 minuto (kumpara sa 60-90 para sa mas kumplikadong alternatibo)
- **Cost Transparency**: Malinaw na pagtataya ng gastos ($50-200/buwan) para sa halimbawa ng Microsoft Foundry Models
- **Learning Path**: May malinaw na entry point ang mga AI developer gamit ang azure-openai-chat
- **Documentation Standards**: Konsistent na inaasahang mga output at mga hakbang ng beripikasyon

#### Napatunayan
- ✅ Ang halimbawa ng Microsoft Foundry Models ay ganap na gumagana gamit ang `azd up`
- ✅ Lahat ng 11 na implementation file ay tama ang sintaks
- ✅ Tumutugma ang mga instruksyon sa README sa aktwal na karanasan ng deployment
- ✅ Na-update ang mga link sa dokumentasyon sa higit sa 8 lokasyon
- ✅ Tumpak na pinapakita ng examples index ang 4 lokal na halimbawa
- ✅ Walang duplicate na external link sa mga talahanayan
- ✅ Tama lahat ng mga reference ng navigasyon

#### Teknikal na Implementasyon
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Handa ang Managed Identity, mga secret sa Key Vault
- **Monitoring**: Integrasyon ng Application Insights
- **Cost Management**: Pagsubaybay ng token at pag-optimize ng paggamit
- **Deployment**: Isang `azd up` na utos para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Malaking Pag-update: Mga Halimbawa ng Deployment ng Container App
**Ipinakikilala ng bersyong ito ang komprehensibo, production-ready na mga halimbawa ng deployment ng container application gamit ang Azure Developer CLI (AZD), na may buong dokumentasyon at integrasyon sa learning path.**

#### Idinagdag
- **🚀 Container App Examples**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kumpletong pangkalahatang-ideya ng mga containerized deployment, quick start, produksiyon, at mga advanced na pattern
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API na angkop para sa mga nagsisimula na may scale-to-zero, health probes, pagmomonitor, at troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Seguridad, pagmomonitor, pag-optimize ng gastos, at gabay sa CI/CD para sa mga containerized workload
- **Code Samples**: Kumpleto ang `azure.yaml`, mga Bicep template, at multi-language na implementasyon ng serbisyo (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end na mga senaryo ng test, mga command sa pagmomonitor, gabay sa troubleshooting

#### Binago
- **README.md**: Na-update para i-feature at i-link ang mga bagong container app example sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: Na-update upang i-highlight ang mga container app example, magdagdag ng mga entry sa comparison matrix, at i-update ang mga sanggunian sa teknolohiya/arkitektura
- **Course Outline & Study Guide**: Na-update upang i-referensya ang mga bagong container app example at mga pattern ng deployment sa mga kaugnay na kabanata

#### Napatunayan
- ✅ Lahat ng bagong halimbawa ay maaaring ideploy gamit ang `azd up` at sumusunod sa pinakamahusay na kasanayan
- ✅ Na-update ang mga cross-link ng dokumentasyon at navigasyon
- ✅ Saklaw ng mga halimbawa ang mga senaryo mula baguhan hanggang advanced, kabilang ang production microservices

#### Mga Tala
- **Scope**: Dokumentasyong Ingles at mga halimbawa lamang
- **Next Steps**: Palawakin gamit ang karagdagang advanced na mga pattern ng container at automation ng CI/CD sa mga susunod na release

### [v3.5.0] - 2025-11-19

#### Pag-rebrand ng Produkto: Microsoft Foundry
**Ipinatupad ng bersyong ito ang komprehensibong pagbabago ng pangalan ng produkto mula "Microsoft Foundry" tungo sa "Microsoft Foundry" sa lahat ng dokumentasyong Ingles, na sumasalamin sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Product Name Update**: Kumpletong rebranding mula sa "Microsoft Foundry" tungo sa "Microsoft Foundry"
  - Na-update ang lahat ng reference sa dokumentasyong Ingles sa `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 na mga reference sa nilalaman na na-update sa loob ng 7 dokumentasyon na mga file

- **📁 Mga Pagbabago sa Estruktura ng Folder**:
  - `docs/ai-foundry/` pinalitan ang pangalan sa `docs/microsoft-foundry/`
  - Lahat ng cross-references na-update para ipakita ang bagong estruktura ng folder
  - Mga link sa navigasyon na-validate sa buong dokumentasyon

- **📄 Mga Pinalitang Pangalan ng File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Lahat ng internal na link na-update upang tumukoy sa bagong filename

#### Mga Na-update na File
- **Dokumentasyon ng Kabanata** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 na update sa navigation link
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 na pagbanggit ng pangalan ng produkto na na-update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasalukuyang gumagamit na ng Microsoft Foundry (mula sa mga naunang update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 na reference na na-update (pangkalahatang-ideya, feedback ng komunidad, dokumentasyon)
  - `docs/getting-started/azd-basics.md` - 4 na cross-reference link na na-update
  - `docs/getting-started/first-project.md` - 2 link sa navigation ng kabanata na na-update
  - `docs/getting-started/installation.md` - 2 next chapter link na na-update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference na na-update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link na na-update
  - `docs/troubleshooting/debugging.md` - 1 navigation link na na-update

- **Mga File ng Estruktura ng Kurso** (2 file):
  - `README.md` - 17 na reference na na-update (pangunahing-ideya ng kurso, mga titulo ng kabanata, seksyon ng mga template, insight ng komunidad)
  - `course-outline.md` - 14 na reference na na-update (pangunahing-ideya, mga layunin sa pagkatuto, mga pinagkukunan ng kabanata)

#### Na-validate
- ✅ Walang natitirang "ai-foundry" folder path references sa English docs
- ✅ Walang natitirang "Microsoft Foundry" product name references sa English docs
- ✅ Lahat ng navigation link ay gumagana kasama ang bagong estruktura ng folder
- ✅ Matagumpay na naisagawa ang mga pagbabago sa pangalan ng file at folder
- ✅ Na-validate ang mga cross-reference sa pagitan ng mga kabanata

#### Mga Tala
- **Saklaw**: Mga pagbabago inilapat sa English na dokumentasyon sa `docs/` folder lamang
- **Mga Pagsasalin**: Hindi na-update ang mga folder ng pagsasalin (`translations/`) sa bersyong ito
- **Workshop**: Hindi na-update ang mga materyales ng workshop (`workshop/`) sa bersyong ito
- **Mga Halimbawa**: Maaaring may mga example file na patuloy na nagre-refer sa legacy na pagba-brand (aayusin sa susunod na update)
- **Panlabas na Link**: Mananatiling hindi binago ang mga external URL at mga reference sa GitHub repository

#### Migration Guide para sa mga Kontribyutor
Kung mayroon kang mga lokal na branch o dokumentasyon na tumutukoy sa lumang estruktura:
1. I-update ang mga reference ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga reference ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Microsoft Foundry" → "Microsoft Foundry"
4. I-validate na gumagana pa rin ang lahat ng internal na dokumentasyon na link

---

### [v3.4.0] - 2025-10-24

#### Mga Pagpapahusay sa Infrastructure Preview at Validation
**Ang bersyong ito ay nagdaragdag ng komprehensibong suporta para sa bagong Azure Developer CLI preview feature at pinapahusay ang karanasan ng user sa workshop.**

#### Idinagdag
- **🧪 Dokumentasyon ng azd provision --preview Feature**: Komprehensibong saklaw ng bagong kakayahan sa infrastructure preview
  - Sanggunian ng command at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa provisioning guide na may mga use case at benepisyo
  - Integrasyon ng pre-flight check para sa mas ligtas na deployment validation
  - Mga update sa getting started guide na may safety-first deployment practices
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapahiwatig ng development status ng workshop
  - Disenyong may gradient na may construction indicators para sa malinaw na komunikasyon sa user
  - Timestamp ng huling pag-update para sa transparency
  - Mobile-responsive na disenyo para sa lahat ng uri ng device

#### Pinahusay
- **Infrastructure Safety**: Ang preview functionality ay integrated sa buong deployment documentation
- **Pre-deployment Validation**: Ang mga automated script ay ngayon may kasamang infrastructure preview testing
- **Developer Workflow**: In-update ang mga sequence ng command upang isama ang preview bilang best practice
- **Workshop Experience**: Maliwanag na inaasahan para sa mga user tungkol sa status ng content development

#### Binago
- **Deployment Best Practices**: Preview-first workflow ngayon ang inirerekomendang pamamaraan
- **Documentation Flow**: Ang infrastructure validation ay inilipat nang mas maaga sa proseso ng pagkatuto
- **Workshop Presentation**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng development

#### Pinabuti
- **Safety-First Approach**: Maaaring ma-validate ang mga pagbabago sa infrastructure bago mag-deploy
- **Team Collaboration**: Ang preview results ay maaaring ibahagi para sa review at approval
- **Cost Awareness**: Mas mahusay na pag-unawa sa gastos ng resources bago mag-provision
- **Risk Mitigation**: Nababawasan ang pagkabigo sa deployment sa pamamagitan ng advance validation

#### Teknikal na Implementasyon
- **Multi-document Integration**: Ang preview feature ay dinokumento sa 4 na pangunahing file
- **Command Patterns**: Konsistent na syntax at mga halimbawa sa buong dokumentasyon
- **Best Practice Integration**: Isinama ang preview sa validation workflows at scripts
- **Visual Indicators**: Maliwanag na mga marka ng BAGONG feature para sa madaling matuklasan

#### Workshop Infrastructure
- **Status Communication**: Propesyonal na HTML banner na may gradient styling
- **User Experience**: Ang malinaw na status ng development ay pumipigil sa kalituhan
- **Professional Presentation**: Pinapanatili ang kredibilidad ng repository habang itinatakda ang mga inaasahan
- **Timeline Transparency**: October 2025 na timestamp ng huling pag-update para sa pananagutan

### [v3.3.0] - 2025-09-24

#### Pinahusay na Mga Materyales ng Workshop at Interactive na Karanasan sa Pagkatuto
**Ang bersyong ito ay nagpapakilala ng komprehensibong materyales ng workshop na may browser-based interactive guides at istrukturadong learning paths.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Browser-based na karanasan sa workshop na may MkDocs preview capability
- **📝 Istrukturadong Mga Instruksyon sa Workshop**: 7-step guided learning path mula discovery hanggang customization
  - 0-Introduction: Pangkalahatang-ideya ng workshop at setup
  - 1-Select-AI-Template: Proseso ng pagtuklas at pagpili ng template
  - 2-Validate-AI-Template: Mga pamamaraan sa deployment at validation
  - 3-Deconstruct-AI-Template: Pag-unawa sa arkitektura ng template
  - 4-Configure-AI-Template: Configuration at customization
  - 5-Customize-AI-Template: Advanced na mga pagbabago at pag-uulit
  - 6-Teardown-Infrastructure: Cleanup at pamamahala ng resources
  - 7-Wrap-up: Buod at mga susunod na hakbang
- **🛠️ Tooling para sa Workshop**: MkDocs configuration na may Material theme para sa pinahusay na karanasan sa pagkatuto
- **🎯 Hands-On Learning Path**: 3-step na metodolohiya (Discovery → Deployment → Customization)
- **📱 Integrasyon ng GitHub Codespaces**: Seamless na setup ng development environment

#### Pinahusay
- **AI Workshop Lab**: Pinalawak para sa komprehensibong 2-3 oras na istrukturadong karanasan sa pagkatuto
- **Dokumentasyon ng Workshop**: Propesyonal na presentasyon na may navigation at visual aids
- **Pag-usad ng Pagkatuto**: Maliwanag na step-by-step na gabay mula sa pagpili ng template hanggang sa production deployment
- **Developer Experience**: Integrated na tooling para sa streamline na workflow ng development

#### Pinabuti
- **Accessibility**: Browser-based na interface na may search, copy functionality, at theme toggle
- **Self-Paced Learning**: Flexible na istruktura ng workshop para sa iba't ibang bilis ng pagkatuto
- **Praktikal na Aplikasyon**: Mga totoong senaryo ng deployment ng AI template
- **Integrasyon ng Komunidad**: Integrasyon sa Discord para sa suporta at kolaborasyon sa workshop

#### Mga Tampok ng Workshop
- **Built-in Search**: Mabilis na paghahanap ng keyword at lesson
- **Copy Code Blocks**: Hover-to-copy functionality para sa lahat ng code examples
- **Theme Toggle**: Suporta sa dark/light mode para sa iba't ibang kagustuhan
- **Visual Assets**: Screenshots at diagrams para sa pinahusay na pag-unawa
- **Help Integration**: Direktang access sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Malaking Pagbabago sa Navigation at Chapter-Based Learning System
**Ang bersyong ito ay nagpakilala ng komprehensibong chapter-based learning structure na may pinahusay na navigation sa buong repository.**

#### Idinagdag
- **📚 Chapter-Based Learning System**: Inayos ang buong kurso sa 8 progresibong learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Komprehensibong Navigation System**: Konsistent na navigation headers at footers sa buong dokumentasyon
- **🎯 Pagsubaybay sa Progreso**: Checklist para sa pagkumpleto ng kurso at sistema ng pag-verify ng pagkatuto
- **🗺️ Gabay sa Learning Path**: Malinaw na entry points para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference Navigation**: Malinaw na naka-link ang mga kaugnay na kabanata at prerequisites

#### Pinahusay
- **Estruktura ng README**: Binago upang maging istrukturadong learning platform na may chapter-based na organisasyon
- **Navigation ng Dokumentasyon**: Bawat pahina ay ngayon may konteksto ng kabanata at gabay sa progreso
- **Organisasyon ng Mga Template**: Ang mga halimbawa at template ay naka-map sa mga angkop na kabanata ng pagkatuto
- **Integrasyon ng Mga Resource**: Cheat sheets, FAQs, at study guides na konektado sa mga kaugnay na kabanata
- **Integrasyon ng Workshop**: Hands-on labs na naka-map sa maraming learning objective ng kabanata

#### Binago
- **Pag-usad ng Pagkatuto**: Lumipat mula sa linear na dokumentasyon patungo sa flexible na chapter-based learning
- **Paglalagay ng Configuration**: Inilipat ang configuration guide bilang Chapter 3 para sa mas magandang daloy ng pagkatuto
- **Integrasyon ng AI Content**: Mas mahusay na integrasyon ng AI-specific na nilalaman sa buong learning journey
- **Nilalaman para sa Produksyon**: Mga advanced pattern na pinagsama sa Chapter 8 para sa enterprise learners

#### Pinabuti
- **User Experience**: Maliwanag na navigation breadcrumbs at indicators ng progreso ng kabanata
- **Accessibility**: Konsistent na pattern ng navigation para sa mas madaling pag-navigate ng kurso
- **Professional Presentation**: Estrukturang parang-unibersidad na angkop para sa akademik at korporatibong pagsasanay
- **Episyensya sa Pagkatuto**: Mas maikling oras para mahanap ang kaugnay na nilalaman dahil sa pinahusay na organisasyon

#### Teknikal na Implementasyon
- **Navigation Headers**: Na-standardize na chapter navigation sa higit sa 40 na documentation file
- **Footer Navigation**: Konsistent na gabay sa progreso at mga indicator ng pagkumpleto ng kabanata
- **Cross-Linking**: Komprehensibong internal linking system na kumokonekta sa mga kaugnay na konsepto
- **Chapter Mapping**: Mga template at halimbawa na malinaw na iniuugnay sa mga layunin ng pagkatuto

#### Pagpapahusay ng Study Guide
- **📚 Komprehensibong Mga Layunin sa Pagkatuto**: Inayos ang study guide upang umayon sa 8-chapter system
- **🎯 Chapter-Based Assessment**: Bawat kabanata ay may partikular na layunin sa pagkatuto at praktikal na mga gawain
- **📋 Pagsubaybay sa Progreso**: Lingguhang iskedyul ng pagkatuto na may nasusukat na mga resulta at checklist ng pagkumpleto
- **❓ Mga Tanong sa Pagsusulit**: Mga tanong para sa pag-validate ng kaalaman sa bawat kabanata na may propesyonal na kahihinatnan
- **🛠️ Mga Praktikal na Ehersisyo**: Hands-on na aktibidad na may totoong senaryo ng deployment at troubleshooting
- **📊 Pag-unlad ng Kasanayan**: Maliwanag na pag-angat mula sa mga pangunahing konsepto hanggang sa enterprise patterns na may pokus sa pag-unlad ng karera
- **🎓 Framework para sa Sertipikasyon**: Mga resulta ng propesyonal na pag-unlad at sistema ng pagkilala ng komunidad
- **⏱️ Pamamahala ng Timeline**: Istrukturadong 10-week learning plan na may milestone validation

### [v3.1.0] - 2025-09-17

#### Pinahusay na Multi-Agent AI Solutions
**Pinapabuti ng bersyong ito ang multi-agent retail solution na may mas mahusay na pagkakakilanlan ng mga agent at pinahusay na dokumentasyon.**

#### Binago
- **Multi-Agent Terminology**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pagkakaunawa
- **Agent Architecture**: In-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code upang gumamit ng konsistent na "Customer agent" naming
- **Mga Halimbawa ng Configuration**: Modernisado ang mga pattern ng agent configuration na may na-update na naming conventions
- **Konsistensya sa Dokumentasyon**: Tiniyak na lahat ng reference ay gumagamit ng propesyonal at deskriptibong mga pangalan ng agent

#### Pinahusay
- **ARM Template Package**: In-update ang retail-multiagent-arm-template na may mga reference sa Customer agent
- **Architecture Diagrams**: Ni-refresh ang mga Mermaid diagrams na may na-update na agent naming
- **Mga Halimbawa ng Code**: Ang mga Python classes at implementation examples ay ngayon gumagamit ng CustomerAgent naming
- **Environment Variables**: In-update ang lahat ng deployment script upang gumamit ng CUSTOMER_AGENT_NAME conventions

#### Pinabuti
- **Developer Experience**: Mas malinaw na mga tungkulin at responsibilidad ng agent sa dokumentasyon
- **Production Readiness**: Mas mahusay na pagkakatugma sa enterprise naming conventions
- **Mga Materyales sa Pagkatuto**: Mas intuitive na agent naming para sa mga edukasyonal na layunin
- **Usability ng Template**: Pinadaling pag-unawa sa mga function at pattern ng deployment ng agent

#### Teknikal na Detalye
- In-update ang mga Mermaid architecture diagrams na may CustomerAgent references
- Pinalitan ang CoraAgent class names ng CustomerAgent sa mga Python example
- Binago ang mga konfigurasyon ng ARM template JSON upang gumamit ng "customer" agent type
- In-update ang environment variables mula CORA_AGENT_* patungo sa CUSTOMER_AGENT_* patterns
- Ni-refresh ang lahat ng deployment command at container configurations

### [v3.0.0] - 2025-09-12

#### Malalaking Pagbabago - Pokus sa AI Developer at Integrasyon ng Microsoft Foundry
**Ang bersyong ito ay binago ang repository upang maging isang komprehensibong AI-focused learning resource na may integrasyon ng Microsoft Foundry.**

#### Idinagdag
- **🤖 AI-First Learning Path**: Kumpletong restruktura na inuuna ang mga AI developer at engineer
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa Microsoft Foundry services
- **Mga Pattern sa AI Model Deployment**: Detalyadong gabay na sumasaklaw sa pagpili ng modelo, configuration, at mga estratehiya para sa production deployment
- **AI Workshop Lab**: 2-3 oras na praktikal na workshop para sa pag-convert ng mga AI application sa mga solusyong maaaring i-deploy gamit ang AZD
- **Production AI Best Practices**: Mga pinakamahusay na praktis na handa para sa enterprise para sa pag-scale, pag-monitor, at pag-secure ng mga AI workload
- **AI-Specific Troubleshooting Guide**: Komprehensibong gabay sa pag-troubleshoot para sa Microsoft Foundry Models, Cognitive Services, at mga isyu sa pag-deploy ng AI
- **AI Template Gallery**: Piniling koleksyon ng mga Microsoft Foundry template na may mga rating ng kahirapan
- **Workshop Materials**: Kumpletong estruktura ng workshop na may mga praktikal na lab at materyales na sanggunian

#### Enhanced
- **README Structure**: Nakatuon sa AI-developer na may 45% na datos ng interes ng komunidad mula sa Microsoft Foundry Discord
- **Learning Paths**: Nakalaang paglalakbay para sa AI developer kasabay ng tradisyonal na mga landas para sa mga estudyante at DevOps engineer
- **Template Recommendations**: Mga tampok na AI template kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Community Integration**: Pinahusay na suporta sa Discord ng komunidad na may mga AI-specific na channel at diskusyon

#### Security & Production Focus
- **Managed Identity Patterns**: Mga pattern para sa Managed Identity: partikular na mga authentication at seguridad na konfigurasyon para sa AI
- **Cost Optimization**: Pagsubaybay ng paggamit ng token at mga kontrol sa badyet para sa mga AI workload
- **Multi-Region Deployment**: Mga estratehiya para sa pandaigdigang pag-deploy ng AI application
- **Performance Monitoring**: Mga AI-specific na metric at integrasyon ng Application Insights

#### Documentation Quality
- **Linear Course Structure**: Lohikal na pag-unlad mula sa baguhan hanggang sa mga advanced na pattern ng pag-deploy ng AI
- **Validated URLs**: Lahat ng external repository link ay na-verify at maa-access
- **Complete Reference**: Lahat ng internal na link sa dokumentasyon ay na-validate at gumagana
- **Production Ready**: Mga enterprise deployment pattern na may mga totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Ang bersyong ito ay kumakatawan sa isang makabuluhang overhaul ng estruktura ng repository at presentasyon ng nilalaman.**

#### Added
- **Structured Learning Framework**: Lahat ng pahina ng dokumentasyon ngayon ay may kasamang Seksyon ng Panimula, Mga Layunin sa Pagkatuto, at Mga Kinalabasan ng Pagkatuto
- **Navigation System**: Idinagdag ang mga link na Previous/Next lesson sa buong dokumentasyon para sa gabay na pag-unlad ng pagkatuto
- **Study Guide**: Komprehensibong study-guide.md na may mga layunin sa pagkatuto, practice exercises, at assessment materials
- **Professional Presentation**: Tinanggal ang lahat ng emoji icons para sa pinahusay na accessibility at mas propesyonal na anyo
- **Enhanced Content Structure**: Pinabuting organisasyon at daloy ng mga materyales sa pagkatuto

#### Changed
- **Documentation Format**: Ipinantay ang lahat ng dokumentasyon na may pare-parehong istrukturang nakatuon sa pagkatuto
- **Navigation Flow**: Ipinatupad ang lohikal na pag-unlad sa lahat ng materyales sa pagkatuto
- **Content Presentation**: Tinanggal ang mga dekoratibong elemento pabor sa malinaw at propesyonal na pag-format
- **Link Structure**: In-update ang lahat ng internal na link para suportahan ang bagong sistema ng navigasyon

#### Improved
- **Accessibility**: Tinanggal ang pagdepende sa emoji para sa mas mahusay na compatibility sa screen reader
- **Professional Appearance**: Malinis, istilong akademiko na presentasyon na angkop para sa enterprise learning
- **Learning Experience**: Istrakturadong paraan na may malinaw na mga layunin at kinalabasan para sa bawat aralin
- **Content Organization**: Mas mahusay na lohikal na daloy at koneksyon sa pagitan ng magkakaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Kumpletong serye ng mga gabay sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga mapagkukunan sa pag-troubleshoot at mga gabay sa debugging
  - Mga tool at pamamaraan para sa pre-deployment validation

- **Getting Started Module**
  - AZD Basics: Pangunahing konsepto at terminolohiya
  - Installation Guide: Mga instruksyon sa setup na nakabatay sa platform
  - Configuration Guide: Setup ng environment at authentication
  - First Project Tutorial: Hakbang-hakbang na praktikal na pagkatuto

- **Deployment and Provisioning Module**
  - Deployment Guide: Kumpletong dokumentasyon ng workflow
  - Provisioning Guide: Infrastructure as Code gamit ang Bicep
  - Pinakamahuhusay na praktis para sa production deployments
  - Mga pattern ng multi-service architecture

- **Pre-deployment Validation Module**
  - Capacity Planning: Pag-validate ng availability ng Azure resources
  - SKU Selection: Komprehensibong gabay sa service tier
  - Pre-flight Checks: Mga automated validation script (PowerShell at Bash)
  - Mga tool para sa pagtataya ng gastos at pagpaplano ng badyet

- **Troubleshooting Module**
  - Common Issues: Madalas na nararanasang mga problema at solusyon
  - Debugging Guide: Sistematikong mga metodolohiya ng pag-troubleshoot
  - Mga advanced na diagnostic technique at tool
  - Pag-monitor at pag-optimize ng pagganap

- **Resources and References**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mahahalagang utos
  - Glossary: Komprehensibong mga depinisyon ng termino at mga acronym
  - FAQ: Detalyadong mga sagot sa karaniwang mga tanong
  - Mga external na link ng mapagkukunan at koneksyon ng komunidad

- **Examples and Templates**
  - Halimbawa ng Simpleng Web Application
  - Template para sa pag-deploy ng Static Website
  - Konfigurasyon ng Container Application
  - Mga pattern ng integration ng Database
  - Mga halimbawa ng microservices architecture
  - Mga implementasyon ng serverless function

#### Features
- **Multi-Platform Support**: Mga gabay sa pag-install at konfigurasyon para sa Windows, macOS, at Linux
- **Multiple Skill Levels**: Nilalaman na idinisenyo mula sa mga estudyante hanggang sa mga propesyonal na developer
- **Practical Focus**: Mga praktikal na halimbawa at totoong mga senaryo
- **Comprehensive Coverage**: Mula sa mga pangunahing konsepto hanggang sa mga advanced na enterprise pattern
- **Security-First Approach**: Pinagsamang mga pinakamahusay na praktis sa seguridad sa kabuuan
- **Cost Optimization**: Gabay para sa cost-effective na pag-deploy at pamamahala ng mga resources

#### Documentation Quality
- **Detailed Code Examples**: Praktikal, sinubukang mga halimbawa ng code
- **Step-by-Step Instructions**: Malinaw, maaaring isagawang gabay
- **Comprehensive Error Handling**: Pag-troubleshoot para sa karaniwang mga isyu
- **Best Practices Integration**: Pamantayan at rekomendasyon ng industriya
- **Version Compatibility**: Napapanahon sa pinakabagong Azure services at azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at mga custom na modelo
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Advanced RAG Patterns**: Mga pagpipilian ng vector database lampas sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinahusay na pag-monitor para sa performance ng modelo, paggamit ng token, at kalidad ng mga tugon

#### Developer Experience
- **VS Code Extension**: Pinagsamang karanasan sa pag-develop ng AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-assisted na pagbuo ng AZD template
- **Interactive Tutorials**: Mga praktikal na coding exercise na may automated validation para sa mga senaryong AI
- **Video Content**: Mga karagdagang video tutorial para sa mga visual learner na nakatuon sa AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Pamamahala ng AI model, pagsunod, at audit trails
- **Multi-Tenant AI**: Mga pattern para pagsilbihan ang maramihang customer gamit ang naka-isolate na AI services
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at mga container instance
- **Hybrid Cloud AI**: Mga pattern ng multi-cloud at hybrid na pag-deploy para sa mga AI workload

#### Advanced Features
- **AI Pipeline Automation**: MLOps integrasyon sa Azure Machine Learning pipelines
- **Advanced Security**: Mga zero-trust na pattern, private endpoints, at advanced threat protection
- **Performance Optimization**: Advanced na tuning at scaling na mga estratehiya para sa high-throughput AI applications
- **Global Distribution**: Mga pattern ng content delivery at edge caching para sa AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Komprehensibong integrasyon ng Microsoft Foundry (Kompleto)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Kompleto)
- ✅ **Advanced Security Module**: Mga pattern ng seguridad na partikular sa AI (Kompleto)
- ✅ **Performance Optimization**: Mga estratehiya sa tuning ng AI workload (Kompleto)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Mga senaryong deployment na nakatuon sa AI (Kompleto)
- ✅ **Extended FAQ**: Mga tanong at pag-troubleshoot na partikular sa AI (Kompleto)
- **Tool Integration**: Pinahusay na mga gabay sa integrasyon ng IDE at editor
- ✅ **Monitoring Expansion**: Mga pattern ng monitoring at alerting na partikular sa AI (Kompleto)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive na disenyo para sa pagkatuto sa mobile
- **Offline Access**: Mga downloadable na package ng dokumentasyon
- **Enhanced IDE Integration**: VS Code extension para sa AZD + AI workflows
- **Community Dashboard**: Real-time na mga metric ng komunidad at pagsubaybay ng kontribusyon

## Contributing to the Changelog

### Reporting Changes
Kapag nagbibigay ng kontribusyon sa repositoryong ito, tiyaking ang mga entry sa changelog ay naglalaman ng:

1. **Version Number**: Sumusunod sa semantic versioning (major.minor.patch)
2. **Date**: Petsa ng release o update sa format na YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Maiksing paglalarawan ng mga binago
5. **Impact Assessment**: Paano naaapektuhan ng mga pagbabago ang mga umiiral na gumagamit

### Change Categories

#### Added
- Mga bagong tampok, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o mapagkukunan sa pagkatuto
- Karagdagang mga tool, script, o utility

#### Changed
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga update para mapabuti ang kalinawan o katumpakan
- Pag-restructure ng nilalaman o organisasyon

#### Deprecated
- Mga tampok o pamamaraan na unti-unting inaalis
- Mga seksyon ng dokumentasyon na nakatakdang alisin
- Mga pamamaraan na may mas magagandang alternatibo

#### Removed
- Mga tampok, dokumentasyon, o halimbawa na hindi na angkop
- Lipas na impormasyon o mga deprecated na pamamaraan
- Mga redundant o pinagsamang nilalaman

#### Fixed
- Mga koreksyon sa mga error sa dokumentasyon o code
- Paglutas ng mga naiulat na isyu o problema
- Mga pagpapabuti sa katumpakan o functionality

#### Security
- Mga pagpapabuti o pag-aayos na may kaugnayan sa seguridad
- Mga update sa pinakamahusay na praktis sa seguridad
- Paglutas ng mga vulnerability sa seguridad

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Mga breaking change na nangangailangan ng aksyon mula sa gumagamit
- Makabuluhang restructuring ng nilalaman o organisasyon
- Mga pagbabago na binabago ang pangunahing lapit o metodolohiya

#### Minor Version (X.Y.0)
- Mga bagong tampok o pagdaragdag ng nilalaman
- Mga pagpapahusay na nananatiling backward compatible
- Karagdagang mga halimbawa, tool, o mapagkukunan

#### Patch Version (X.Y.Z)
- Mga pag-aayos ng bug at koreksyon
- Maliit na pagpapahusay sa umiiral na nilalaman
- Mga paglilinaw at maliliit na pagbuti

## Community Feedback and Suggestions

Aktibo naming hinihikayat ang puna ng komunidad para mapabuti ang pinagkukunan ng pagkatuto na ito:

### How to Provide Feedback
- **GitHub Issues**: I-report ang mga problema o magmungkahi ng mga pagpapabuti (AI-specific issues welcome)
- **Discord Discussions**: Ibahagi ang mga ideya at makilahok sa komunidad ng Microsoft Foundry
- **Pull Requests**: Mag-ambag ng direktang pagpapabuti sa nilalaman, lalo na sa mga AI template at gabay
- **Microsoft Foundry Discord**: Lumahok sa #Azure channel para sa mga talakayan ng AZD + AI
- **Community Forums**: Makilahok sa mas malawak na talakayan ng Azure developer

### Feedback Categories
- **AI Content Accuracy**: Mga koreksyon sa integrasyon ng AI service at impormasyon ng deployment
- **Learning Experience**: Mga mungkahi para sa pagpapabuti ng daloy ng pagkatuto para sa AI developer
- **Missing AI Content**: Mga kahilingan para sa karagdagang AI template, pattern, o halimbawa
- **Accessibility**: Mga pagpapahusay para sa iba't ibang pangangailangan sa pagkatuto
- **AI Tool Integration**: Mga mungkahi para sa mas mahusay na integrasyon ng workflow sa pag-develop ng AI
- **Production AI Patterns**: Mga kahilingan para sa enterprise AI deployment pattern

### Response Commitment
- **Issue Response**: Sa loob ng 48 oras para sa mga inulat na problema
- **Feature Requests**: Pagsusuri sa loob ng isang linggo
- **Community Contributions**: Review sa loob ng isang linggo
- **Security Issues**: Agarang prayoridad na may pinabilis na pagtugon

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Pagrepaso buwanan para sa katumpakan ng nilalaman at pag-validate ng mga link
- **Quarterly Updates**: Malalaking pagdaragdag ng nilalaman at pagpapahusay
- **Semi-Annual Reviews**: Komprehensibong restructuring at pagpapahusay
- **Annual Releases**: Malaking pag-update ng bersyon na may makabuluhang pagpapahusay

### Monitoring and Quality Assurance
- **Automated Testing**: Regular na pag-validate ng mga halimbawa ng code at link
- **Community Feedback Integration**: Regular na pagsasama ng mga mungkahi ng gumagamit
- **Technology Updates**: Pagsasaayos sa pinakabagong Azure services at azd releases
- **Accessibility Audits**: Regular na pagrepaso para sa mga prinsipyo ng inklusibong disenyo

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Buong suporta na may regular na mga update
- **Previous Major Version**: Mga security update at kritikal na pag-aayos sa loob ng 12 buwan
- **Legacy Versions**: Suporta ng komunidad lamang, walang opisyal na mga update

### Migration Guidance
Kapag may inilabas na mga major version, nagbibigay kami ng:
- **Migration Guides**: Hakbang-hakbang na mga instruksyon para sa paglipat
- **Compatibility Notes**: Mga detalye tungkol sa breaking changes
- **Tool Support**: Mga script o utility para tumulong sa migrasyon
- **Community Support**: Nakalaang mga forum para sa mga tanong tungkol sa migrasyon

---

**Navigation**
- **Previous Lesson**: [Gabay sa Pag-aaral](resources/study-guide.md)
- **Next Lesson**: Bumalik sa [Pangunahing README](README.md)

**Stay Updated**: Subaybayan ang repositoryong ito para sa mga notification tungkol sa mga bagong release at mahahalagang update sa mga materyales sa pagkatuto.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
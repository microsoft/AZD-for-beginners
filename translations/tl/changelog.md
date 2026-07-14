# Changelog - AZD Para sa mga Baguhan

## Panimula

Itong changelog ay nagdodokumento ng lahat ng mahahalagang pagbabago, update, at pagpapabuti sa AZD Para sa mga Baguhan na repositoryo. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinananatili ang talaang ito upang makatulong sa mga gumagamit na maunawaan kung ano ang nagbago sa pagitan ng mga bersyon.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagrerebyu ng changelog na ito, ikaw ay:
- Mananatiling may alam tungkol sa mga bagong tampok at karagdagang nilalaman
- Maiintindihan ang mga pagpapabuti sa umiiral na dokumentasyon
- Masusubaybayan ang mga pagsasaayos ng bug at mga pagkukulang upang matiyak ang katumpakan
- Masusundan ang ebolusyon ng mga materyales sa pag-aaral sa paglipas ng panahon

## Mga Kinalabasan sa Pagkatuto

Pagkatapos mong suriin ang mga tala ng changelog, magagawa mong:
- Matukoy ang bagong nilalaman at mga mapagkukunan na magagamit para sa pag-aaral
- Maunawaan kung aling mga bahagi ang na-update o pinabuti
- Magplano ng iyong landas sa pagkatuto batay sa mga pinaka-kasalukuyang materyales
- Magbigay ng puna at suhestiyon para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: Update sa Kasalukuyang Bersyon
**Ang bersyong ito ay muling nagberipika ng kurso laban sa `azd` `1.27.1` (Hulyo 2026, pinakabagong matatag na bersyon) at ang kasalukuyang preview AI agent extension na `azure.ai.agents` `1.0.0-beta.5`, na nagdadala ng bawat "validated against" banner sa kasalukuyang estado matapos ang mga release ng 1.26.0, 1.27.0, at 1.27.1.**

#### Mga Binago
- **✅ Na-update ang validation baseline** mula `azd 1.25.6` (Hunyo 2026) hanggang `azd 1.27.1` (Hulyo 2026) sa buong root README, lahat ng chapter README, ang Chapter 1 dev-container lesson (kasama ang mga halimbawa ng pinned-version), ang Chapter 4 custom-templates lesson, ang Chapter 5 multi-agent lesson, at ang mga dokumento ng workshop
- **🤖 Na-refresh ang Chapter 2 baseline** mula `azd 1.23.12` (Marso 2026) hanggang `azd 1.27.1` sa `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, at `microsoft-foundry-integration.md`; na-update ang mga petsa ng validation-note sa 2026-07-13
- **🧩 Na-update ang AI agent extension** mula `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` papuntang kasalukuyang `1.0.0-beta.5` release sa Chapter 2 README at `agents.md`
- **🧪 Na-update ang workshop validation example** (`azd version` output) sa `1.27.1`

#### Mga Tala tungkol sa mga azd release (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporta ng Go para sa Azure Functions sa Flex Consumption, `azd config sub-filter` per-tenant subscription filters, self-contained extension bundles (`azd x pack --bundle`), at `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeling ng Azure AI Foundry projects/agents diretso sa `azure.yaml` (Bicep-less/Terraform-less init), suporta sa container deployment para sa App Service (`host: appservice` + `language: docker`), direktang `-s/--source` para sa `azd extension` commands, at `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` na flag para sa `azd extension install`, mga deprecated models ay hindi na isinasali sa catalog/quota prompts bilang default, at ilang pagwawasto sa mga bug

#### Mga Na-update na File
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

#### Beginner Gap-Fill #2: Pagsulat ng Template, Dev Containers, Pulumi, Azure DevOps, Mga Service Principal, at iba pa
**Ang bersyong ito ay nagsasara ng mga natitirang intermediate gaps na lumitaw sa azd-coverage analysis: kung paano gumawa at mag-publish ng sarili mong template, reproducible na dev-container/Codespaces environments, ang Pulumi infrastructure provider, isang Azure DevOps CI/CD walkthrough, service-principal authentication, host-selection guidance (AKS/Spring Apps), paliwanag ng `azd restore`/`azd package`, error-handling ng hook, at mga practice para sa team/shared environment.**

#### Nadagdag
- **🧱 Bagong Chapter 4 na aralin** `docs/chapter-04-infrastructure/custom-templates.md` — paggawa ng sarili mong azd template: kinakailangang istruktura (`azure.yaml`, `infra/`, `src/`), ang `metadata.template` field, parameterizing infrastructure gamit ang `uniqueString()` resource token at `azd-env-name` tag, pagsubok locally gamit ang `azd init --template <local-path>`, pag-publish sa GitHub, at pagsusumite sa Awesome AZD gallery
- **📦 Bagong Chapter 1 na aralin** `docs/chapter-01-foundation/dev-containers.md` — reproducible azd environments gamit ang Dev Containers at GitHub Codespaces: isang minimal `.devcontainer/devcontainer.json` gamit ang official na `ghcr.io/azure/azure-dev/azd` feature, language-specific features, `docker-in-docker` para sa container hosts, at `azd auth login --use-device-code` para sa remote sign-in
- **🧩 Pulumi kasama ang azd** sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout ng Pulumi folder, stacks na naka-map sa azd environments, kinakailangang outputs/tagging, at identikal na workflow ng `azd up` / `azd down`
- **🎯 Host-selection guidance** sa `docs/chapter-04-infrastructure/provisioning.md` — isang beginner-friendly na paghahambing ng `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, at `springapp`, kasama ang patnubay kung kailan pipiliin ang AKS o Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** sa `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection gamit ang workload identity federation (OIDC), ang generated na `azure-dev.yml`, at setup ng variable-group
- **🔑 Service Principals (Pattern 4)** nadagdag sa `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` gamit ang client secret kumpara sa federated/OIDC credentials, kung kailan gamitin, at ligtas na pagtatago ng kredensyal
- **🪝 Hook error-handling** subsection sa `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes at `set -e`, `continueOnError`, pagsubok ng hooks nang hiwalay gamit ang `azd hooks run`, OS-specific shells, at `--debug`
- **👥 Team / shared environments** seksyon sa `docs/chapter-03-configuration/configuration.md` — ano ang laman ng `.azure/`, ano ang dapat i-gitignore, per-developer environments, `azd env list`/`select`, at pagbibigay ng mga environment value sa CI/CD
- **🧰 Paliwanag ng `azd restore` at pinalawak na `azd package`** sa `resources/cheat-sheet.md` — pagbawi ng dependencies at paggawa ng deployable artifact nang hindi nagde-deploy

#### Binago
- **🧭 Na-update ang talahanayan ng mga aralin sa Chapter 4** para isama ang bagong "Authoring Your Own Template" na aralin (Lesson 3)
- **🧭 Na-update ang talahanayan ng mga aralin sa Chapter 1** para isama ang bagong "Dev Containers & Codespaces" na aralin (Lesson 5); naayos ang navigation footers pagitan ng `bring-your-own-app.md` at `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Magdala ng Sariling App," Terraform, at CI/CD Walkthrough
**Ang bersyong ito ay nagsasara ng pinakamalalaking puwang para sa isang kompletong gabay para sa mga baguhan sa pamamagitan ng pagdaragdag ng dalawang bagong hands-on lessons (isang deployable multi-agent walkthrough at pagdaragdag ng azd sa isang umiiral na app), isang beginner-friendly na pagpapakilala sa hooks, isang seksyon ng Terraform-with-azd, isang step-by-step na walkthrough ng GitHub Actions pipeline, paliwanag sa mga bagong preview extension, at isang malinaw na deployment-verification checklist.**

#### Nadagdag
- **🤝 Bagong Chapter 5 na aralin** `docs/chapter-05-multi-agent/multi-agent-basics.md` — isang ganap na hands-on, deployable na dalawang-agent walkthrough (orchestrator + specialists) gamit ang totoong template (`contoso-creative-writer`), tinatalakay kung kailan gagamit ng multi-agent, ang workflow ng `azd up`, pag-unawa sa mga na-deploy na resources, cross-agent tracing, customization, at paglilinis
- **📦 Bagong Chapter 1 na aralin** `docs/chapter-01-foundation/bring-your-own-app.md` — paano magdagdag ng azd sa isang umiiral na proyekto gamit ang `azd init` ("gamitin ang code sa kasalukuyang direktoryo"), pag-unawa sa `azure.yaml` at `infra/`, `azd infra generate`, pagtuklas ng host, at pag-deploy gamit ang `azd up`
- **🌐 Seksiyon ng Terraform gamit ang azd** nadagdag sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, layout ng `.tf` folder, kinakailangang `AZURE_*` outputs at pag-tag gamit ang `azd-env-name`, at identikal na workflow ng `azd up` / `azd down` (sinara ang puwang kung saan ang suporta ng Terraform ay sinabing meron ngunit Bicep lang ang ipinakita)
- **⚙️ Step-by-step na walkthrough ng GitHub Actions** sa `docs/chapter-08-production/production-ai-practices.md` — mula sa GitHub repo hanggang sa awtomatikong deploys: `azd pipeline config`, OIDC federated credentials (walang tinagong lihim), ang generated na `azure-dev.yml`, at gabay sa secrets-vs-variables
- **🪝 Beginner "Bago sa hooks?" pagpapakilala** sa `docs/chapter-04-infrastructure/deployment-guide.md` — kung ano ang hook, isang hook-stage table, isang minimal na unang hook, at pagpapatakbo ng mga hook nang manu-mano gamit ang `azd hooks run`
- **✅ "I-verify ang Iyong Deployment" checklist** nadagdag sa Hakbang 5 ng `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, at malinaw na criteria ng tagumpay
- **🧩 Paliwanag para sa mga bagong preview extensions** `azure.ai.skills` at `azure.ai.connections` (ano ang mga ito at kailan dapat gamitin) sa `docs/chapter-08-production/production-ai-practices.md`

#### Binago
- **🧭 Inayos ang talahanayan ng mga aralin sa Chapter 5**: ang `multi-agent-basics.md` ngayon ay Lesson 1 (ang nag-iisang ganap na hands-on na aralin), may tamang pag-label na ang Lesson 2 ay nasa Chapter 6 at ang Retail scenario ay isang architecture blueprint, hindi isang one-command na template
- **🧭 Kasama na sa talahanayan ng mga aralin sa Chapter 1** ang bagong "Bring Your Own App" na aralin (Lesson 4)
- **🔗 Na-update ang navigation footers**: ang `first-project.md` ay ngayon ay may link papuntang `bring-your-own-app.md`

#### Naayos
- **🧱 Sinara ang "sinabi pero wala" na puwang ng Terraform** — dating tinutukoy ng kurso ang suporta sa Terraform ngunit hindi ito ipinakita
- **🔀 Inayos ang maling cross-links sa Chapter 5** na nagpapahiwatig na may ganap na multi-agent implementation habang architecture blueprint lang ang meron

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

#### AZD 1.25.6 Refresh, Kumpletong Lifecycle Commands ng Agent & Aspire Rebrand

**Ang bersyong ito ay muling nagrerevalidate ng kurso laban sa `azd` `1.25.6` (Hunyo 2026) at ang `azure.ai.agents` `0.1.40-preview` na extension, pinalalawak ang gabay ng AI mula sa "scaffold an agent" hanggang sa buong lifecycle ng agent (test → evaluate → optimize → inspect → delete), ipinapakita ang mga bagong `azure.ai.skills` at `azure.ai.connections` preview extensions, at binabanggit ang rebrand ng produkto mula ".NET Aspire" → "Aspire".**

#### Nadagdag
- **🔁 Kumpletong coverage ng lifecycle ng agent** para sa mga baguhan at AI engineers sa buong dokumentasyon:
  - `docs/chapter-01-foundation/azd-basics.md` — Idinagdag ang lifecycle table (scaffold → test → measure → improve → inspect → clean up) sa seksyon ng Extensions at AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Bagong seksyon na "Managing the Agent Lifecycle" na sumasaklaw sa `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
  - `resources/cheat-sheet.md` — Pinalawak ang AI Agent Commands na may `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
- **🧩 Mga bagong preview extensions** na naitala: `azure.ai.skills` (mga reusable agent skills) at `azure.ai.connections` (mga Foundry connections) na idinagdag sa extensions table at cheat sheet
- **⏱️ Gabay sa response-timing** — Ang mga halimbawa ng `azd ai agent invoke` ay ngayon nagbabanggit na nagpapakita ito ng kabuuang latency at time-to-first-byte
- **📌 Banner ng version** sa root README na nagtuturo sa mga nag-aaral ng `azd version` at `azd upgrade`

#### Binago
- **✅ Na-update na validation baseline** mula sa `azd 1.23.12` (Marso 2026) patungo sa `azd 1.25.6` (Hunyo 2026) sa lahat ng chapter READMEs at workshop docs
- **🤖 Na-update ang Chapter 2 extension note** mula sa `azure.ai.agents` `0.1.18-preview` patungo sa `0.1.40-preview`
- **🧪 Na-update na Workshop validation example** (`azd version` output) sa `1.25.6`
- **🧭 Binagong README "What's New in azd Today"** para ipakita ang buong lifecycle ng agent, mga bagong AI extensions, at mga kamakailang improvements sa quality-of-life (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Binagong Chapter 2 agents.md (Option 4)** na ngayon ay nagtuturo sa mga nag-aaral tungkol sa mga lifecycle commands pagkatapos ng deployment sa halip na huminto sa `azd up`

#### Naayos
- **🏷️ Pangalan ng produkto** — Idinagdag ang tala ng rebrand ng Aspire (ang ".NET Aspire" ay ngayon simpleng "Aspire"); walang pagbabago sa suporta ng azd para sa Aspire
- **🔎 Live release validation** na nakumpirma laban sa Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) at `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Paglilinaw sa Beginner Onboarding, Validasyon ng Setup & Huling Paglilinis ng AZD Command
**Ang bersyong ito ay sumusunod sa AZD 1.23 validation sweep na may pokus sa mga baguhan sa dokumentasyon: nililinaw nito ang AZD-first authentication guidance, nagdadagdag ng mga local setup validation scripts, nire-verify ang mahahalagang command laban sa live AZD CLI, at inaalis ang huling mga luma at hindi na ginagamit na English-source command references sa labas ng changelog.**

#### Nadagdag
- **🧪 Mga beginner setup validation scripts** na may `validate-setup.ps1` at `validate-setup.sh` upang mapatunayan ng mga nag-aaral ang mga kinakailangang tools bago simulan ang Chapter 1
- **✅ Mga upfront setup validation steps** sa root README at Chapter 1 README upang mahuli ang kulang na prerequisites bago ang `azd up`

#### Binago
- **🔐 Beginner authentication guidance** na ngayon ay consistent na tinatrato ang `azd auth login` bilang pangunahing ruta para sa AZD workflows, na ang `az login` ay binabanggit bilang opsyonal maliban kung direktang ginagamit ang Azure CLI commands
- **📚 Flow ng Chapter 1 onboarding** na ngayon ay nagtuturo sa mga nag-aaral na i-validate muna ang kanilang local setup bago ang pag-install, authentication, at unang deployment
- **🛠️ Validator messaging** na malinaw na naghihiwalay ng blocking requirements mula sa opsyonal na Azure CLI warnings para sa AZD-only beginner na ruta
- **📖 Documentation sa configuration, troubleshooting, at mga halimbawa** na ngayon ay nagkaiba ang mga kinakailangang AZD authentication at opsyonal na Azure CLI sign-in kung saan dati ay pareho lang naipakita

#### Naayos
- **📋 Natitirang mga English-source command references** na na-update sa kasalukuyang mga anyo ng AZD, kabilang ang `azd config show` sa cheat sheet at `azd monitor --overview` kung saan ang Azure Portal overview guidance ang nilalayon
- **🧭 Mga binagong claim para sa beginners sa Chapter 1** upang iwasan ang overpromising na zero-error o rollback behavior sa lahat ng templates at Azure resources
- **🔎 Live CLI validation** na nakumpirma ang kasalukuyang suporta para sa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, at `azd down --force --purge`

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

#### Pag-validate ng AZD 1.23.12, Pagpapalawak ng Workshop Environment & Pag-refresh ng AI Model
**Ang bersyong ito ay nagsasagawa ng dokumentasyong validation sweep laban sa `azd` `1.23.12`, ina-update ang mga luma na halimbawa ng AZD command, nire-refresh ang AI model guidance sa kasalukuyang mga default, at pinalalawak ang mga workshop instructions lampas sa GitHub Codespaces upang suportahan din ang dev containers at mga local clones.**

#### Nadagdag
- **✅ Mga validation note sa mga pangunahing kabanata at workshop docs** upang gawing malinaw ang tested AZD baseline para sa mga nag-aaral na gumagamit ng mas bagong o mas lumang CLI builds
- **⏱️ Gabay sa deployment timeout** para sa mga matagal na AI app deployment gamit ang `azd deploy --timeout 1800`
- **🔎 Mga hakbang sa pagsusuri ng extension** gamit ang `azd extension show azure.ai.agents` sa AI workflow docs
- **🌐 Mas malawak na gabay sa workshop environment** na sumasaklaw sa GitHub Codespaces, dev containers, at local clones gamit ang MkDocs

#### Binago
- **📚 Mga Chapter intro README** na consistent na nagbabanggit ng validation laban sa `azd 1.23.12` sa foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, at production na seksyon
- **🛠️ Mga AZD command na tinukoy** na na-update sa kasalukuyang anyo sa buong docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` depende sa konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kung saan nilalayon ang Application Insights overview
- **🧪 Mga halimbawa ng provision preview** na pinasimple sa kasalukuyang suportadong paggamit tulad ng `azd provision --preview` at `azd provision --preview -e production`
- **🧭 Daloy ng workshop** na na-update upang makumpleto ng mga nag-aaral ang mga lab sa Codespaces, dev container, o local clone sa halip na assumption na Codespaces-only ang pagpapatakbo
- **🔐 Gabay sa authentication** na mas gusto na ngayon ang `azd auth login` para sa AZD workflows, na ang `az login` ay opsyonal kapag direkta namang ginagamit ang Azure CLI commands

#### Naayos
- **🪟 Mga command sa pag-install sa Windows** na na-normalize sa kasalukuyang casing ng `winget` package sa installation guide
- **🐧 Gabay sa pag-install sa Linux** na naitama upang maiwasan ang unsupported na distro-specific `azd` package manager instructions at sa halip ay ituro sa release assets kung nararapat
- **📦 Mga halimbawa ng AI model** na na-refresh mula sa mga lumang default tulad ng `gpt-35-turbo` at `text-embedding-ada-002` sa mga kasalukuyang halimbawa tulad ng `gpt-4.1-mini`, `gpt-4.1`, at `text-embedding-3-large`
- **📋 Mga snippet sa deployment at diagnostics** na naitama upang gamitin ang kasalukuyang commands sa environment at status sa mga logs, scripts, at troubleshooting steps
- **⚙️ Gabay sa GitHub Actions** na na-update mula `Azure/setup-azd@v1.0.0` patungo sa `Azure/setup-azd@v2`
- **🤖 Gabay sa MCP/Copilot consent** na na-update mula `azd mcp consent` patungo sa `azd copilot consent list`

#### Pinabuti
- **🧠 Gabay sa AI chapter** na mas malinaw na nagpapaliwanag ng preview-sensitive na pag-uugali ng `azd ai`, tenant-specific na login, kasalukuyang paggamit ng extension, at mga updated na rekomendasyon sa deployment ng modelo
- **🧪 Mga instruksyon sa workshop** na gumagamit na ngayon ng mas makatotohanang halimbawa ng bersyon at mas malinaw na wika sa pag-setup ng environment para sa hands-on na labs
- **📈 Mga dokumento para sa production at troubleshooting** na mas naiaayon sa kasalukuyang monitoring, fallback model, at mga halimbawa ng cost-tier

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

#### Mga AZD AI CLI Command, Pag-validate ng Nilalaman & Pagpapalawak ng Template
**Ang bersyong ito ay nagdagdag ng coverage ng mga command na `azd ai`, `azd extension`, at `azd mcp` sa lahat ng AI-related na kabanata, inaayos ang mga sirang link at deprecated na code sa agents.md, ina-update ang cheat sheet, at inayos nang mabuti ang seksyon ng Example Templates na may mga validated na deskripsyon at bagong Azure AI AZD templates.**

#### Nadagdag
- **🤖 Coverage ng AZD AI CLI** sa 7 file (dati ay nasa Chapter 8 lamang):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagong seksyon na "Extensions and AI Commands" na nagpapakilala ng `azd extension`, `azd ai agent init`, at `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` na may comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsections na "AZD Extensions for Foundry" at "Agent-First Deployment"

  - `docs/chapter-05-multi-agent/README.md` — Mabilisang Simula ngayon ay nagpapakita ng parehong landas ng deployment gamit ang template at manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Seksyon ng Deploy ngayon ay may kasamang opsyon na `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "Mga Utos ng AZD AI Extension para sa Diagnostics" na subseksyon
  - `resources/cheat-sheet.md` — Bagong seksyon na "Mga Utos para sa AI at Extensions" na may `azd extension`, `azd ai agent init`, `azd mcp`, at `azd infra generate`
- **📦 Mga Bagong Template na halimbawa ng AZD AI** sa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat gamit ang Blazor WebAssembly, Semantic Kernel, at suporta para sa voice chat
  - **azure-search-openai-demo-java** — Java RAG chat gamit ang Langchain4J na may mga opsyon para sa ACA/AKS deployment
  - **contoso-creative-writer** — Multi-agent creative writing app gamit ang Azure AI Agent Service, Bing Grounding, at Prompty
  - **serverless-chat-langchainjs** — Serverless RAG gamit ang Azure Functions + LangChain.js + Cosmos DB na may Ollama lokal na suporta sa dev
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator na may admin portal, Teams integration, at mga opsyon sa PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app na may mga server sa .NET, Python, Java, at TypeScript
  - **azd-ai-starter** — Minimal na Azure AI infrastructure Bicep starter template
  - **🔗 Link sa Kamangha-manghang AZD AI Gallery** — Sanggunian sa [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Naayos
- **🔗 Navigasyon sa agents.md**: Mga link ng Previous/Next ay tumutugma na sa pagkakasunod ng mga aralin sa Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 mga putol na link sa agents.md**: `production-ai-practices.md` naitama sa `../chapter-08-production/production-ai-practices.md` (3 beses)
- **📦 deprecated code sa agents.md**: Pinalitan ang `opencensus` ng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 invalid API sa agents.md**: Inilipat ang `max_tokens` mula sa `create_agent()` papuntang `create_run()` bilang `max_completion_tokens`
- **🔢 pagtatantiya ng token sa agents.md**: Pinalitan ang tantiyang `len//4` ng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Itinama ang serbisyo mula "Cognitive Search + App Service" sa "Azure AI Search + Azure Container Apps" (nagbago ang default host Oktubre 2024)
- **contoso-chat**: In-update ang deskripsyon upang tumukoy sa Azure AI Foundry + Prompty, na tumutugma sa tunay na pamagat at tech stack ng repo

#### Tinanggal
- **ai-document-processing**: Tinanggal ang template reference na hindi gumagana (hindi pampublikong accessible bilang isang AZD template ang repo)

#### Pinahusay
- **📝 exercises sa agents.md**: Ipinapakita na ngayon ng Exercise 1 ang inaasahang output at hakbang ng `azd monitor`; Exercise 2 may kompletong `FunctionTool` registration code; Exercise 3 pinalitan ang malabong gabay ng kongkretong mga utos sa `prepdocs.py`
- **📚 resources sa agents.md**: Na-update ang mga link ng dokumentasyon sa kasalukuyang Azure AI Agent Service docs at quickstart
- **📋 Next Steps table sa agents.md**: Idinagdag ang AI Workshop Lab link para sa kumpletong saklaw ng kabanata

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

#### Pagpapahusay sa Navigasyon ng Kurso
**Pinapabuti ng bersyong ito ang README.md na navigasyon ng kabanata gamit ang pinahusay na format ng talahanayan.**

#### Binago
- **Talahanayan ng Mapa ng Kurso**: Pinahusay na may direktang link sa mga aralin, pagtatantiya ng tagal, at mga rating sa kahirapan
- **Paglilinis ng Folder**: Tinanggal ang mga lumang folder na paulit-ulit (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pag-validate ng Link**: Napatunayan ang lahat ng mahigit 21 na internal na link sa Talahanayan ng Mapa ng Kurso

### [v3.16.0] - 2026-02-05

#### Pag-update ng Pangalan ng Produkto
**Inia-update ng bersyong ito ang mga sanggunian sa produkto alinsunod sa kasalukuyang branding ng Microsoft.**

#### Binago
- **Microsoft Foundry → Microsoft Foundry**: Na-update ang lahat ng sanggunian sa mga hindi isinasaling file
- **Azure AI Agent Service → Foundry Agents**: Na-update ang pangalan ng serbisyo upang tumugma sa kasalukuyang branding

#### Mga Nai-update na File
- `README.md` - Pangunahing landing page ng kurso
- `changelog.md` - Kasaysayan ng bersyon
- `course-outline.md` - Estruktura ng kurso
- `docs/chapter-02-ai-development/agents.md` - Gabay sa AI agents
- `examples/README.md` - Dokumentasyon ng mga halimbawa
- `workshop/README.md` - Landing page ng workshop
- `workshop/docs/index.md` - Index ng workshop
- `workshop/docs/instructions/*.md` - Lahat ng mga file ng instruksyon sa workshop

---

### [v3.15.0] - 2026-02-05

#### Malawakang Pag-restructure ng Repository: Pangalan ng Folder Batay sa mga Kabanata
**Ipinapamahagi ng bersyong ito ang dokumentasyon sa mga dedikadong folder ng kabanata para sa mas malinaw na navigasyon.**

#### Pagbabago ng Pangalan ng Folder
Pinalitan ang mga lumang folder ng mga folder na may bilang ng kabanata:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Nagdagdag ng bago: `docs/chapter-05-multi-agent/`

#### Migration ng File
| File | Mula sa | Papunta sa |
|------|---------|------------|
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
| Lahat ng pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| Lahat ng troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Idinagdag
- **📚 README files ng Kabanata**: Nilikha ang README.md sa bawat folder ng kabanata na may kasamang:
  - Mga layunin sa pagkatuto at tagal
  - Talahanayan ng mga aralin na may mga paglalarawan
  - Mga quick start na utos
  - Navigasyon patungo sa ibang mga kabanata

#### Binago
- **🔗 Na-update ang lahat ng internal na link**: 78+ na mga landas na na-update sa lahat ng dokumentasyon
- **🗺️ Pangunahing README.md**: Na-update ang Course Map upang ipakita ang bagong estruktura ng kabanata
- **📝 examples/README.md**: Na-update ang mga cross-reference patungo sa mga folder ng kabanata

#### Tinanggal
- Lumang estruktura ng folder (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Pag-restructure ng Repository: Navigasyon ng Kabanata
**Idinagdag ng bersyong ito ang mga README file para sa navigasyon ng kabanata (napalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Bagong Gabay para sa AI Agents
**Idinadagdag ng bersyong ito ang komprehensibong gabay para sa deployment ng AI agents gamit ang Azure Developer CLI.**

#### Idinagdag
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang AI agents at paano sila naiiba sa chatbots
  - Tatlong mabilisang template para sa agent (Foundry Agents, Prompty, RAG)
  - Mga pattern sa arkitektura ng agent (iisang agent, RAG, multi-agent)
  - Konfigurasyon at pag-customize ng mga tool
  - Pagsubaybay at pagtutuos ng metrics
  - Mga konsiderasyon sa gastos at optimisasyon
  - Karaniwang mga senaryo ng troubleshooting
  - Tatlong praktikal na ehersisyo na may tagumpay na pamantayan

#### Estruktura ng Nilalaman
- **Panimula**: Mga konsepto ng agent para sa mga baguhan
- **Mabilisang Simula**: I-deploy ang mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Mga Pattern ng Arkitektura**: Visual na mga diagram ng mga pattern ng agent
- **Konfigurasyon**: Pag-setup ng tool at mga environment variable
- **Pagsubaybay**: Integrasyon ng Application Insights
- **Mga Ehersisyo**: Pagsasanay na may pag-unlad na hands-on (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### Update sa DevContainer Environment
**Ina-update ng bersyong ito ang configuration ng development container gamit ang mga modernong tool at mas mahusay na defaults para sa karanasan sa pagkatuto ng AZD.**

#### Binago
- **🐳 Base Image**: In-update mula `python:3.12-bullseye` patungong `python:3.12-bookworm` (pinakabagong Debian stable)
- **📛 Pangalan ng Container**: Pinalitan mula "Python 3" patungong "AZD for Beginners" para sa kalinawan

#### Idinagdag
- **🔧 Bagong mga Tampok ng Dev Container**:
  - `azure-cli` na may suportang Bicep
  - `node:20` (LTS na bersyon para sa mga template ng AZD)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa deployment ng container app

- **🔌 Port Forwarding**: Pre-configured na mga port para sa karaniwang development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Bagong VS Code Extensions**:
  - `ms-python.vscode-pylance` - Pinahusay na Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Suporta sa Azure Functions
  - `ms-azuretools.vscode-docker` - Suporta sa Docker
  - `ms-azuretools.vscode-bicep` - Suporta sa Bicep language
  - `ms-azure-devtools.azure-resource-groups` - Pamamahala ng Azure resource
  - `yzhang.markdown-all-in-one` - Pag-edit ng Markdown
  - `DavidAnson.vscode-markdownlint` - Linting ng Markdown
  - `bierner.markdown-mermaid` - Suporta sa diagram ng Mermaid
  - `redhat.vscode-yaml` - Suporta sa YAML (para sa azure.yaml)
  - `eamodio.gitlens` - Visualisasyon ng Git
  - `mhutchie.git-graph` - Kasaysayan ng Git

- **⚙️ Mga Setting ng VS Code**: Idinagdag ang default na mga setting para sa Python interpreter, format on save, at whitespace trimming

- **📦 Na-update na requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang mga Azure SDK package (azure-identity, azure-mgmt-resource)

#### Naayos
- **Utusang Post-Create**: Ngayong sine-secure ang pag-install ng AZD at Azure CLI habang nagsisimula ang container

---

### [v3.11.0] - 2026-02-05

#### Malawakang Pagbabago ng README na Pang-baguhan
**Malaki ang pagpapabuti ng bersyong ito sa README.md upang maging mas madaling maintindihan para sa mga baguhan at nagdaragdag ng mahahalagang resources para sa mga AI developer.**

#### Idinagdag
- **🆚 Paghahambing ng Azure CLI laban sa AZD**: Malinaw na paliwanag kung kailan gagamitin ang bawat tool gamit ang mga praktikal na halimbawa
- **🌟 Kamangha-manghang mga Link sa AZD**: Direktang link sa gallery ng mga template ng komunidad at mga mapagkukunan sa kontribusyon:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ na mga handang i-deploy na template
  - [Mag-submit ng Template](https://github.com/Azure/awesome-azd/issues) - Kontribusyon ng komunidad
- **🎯 Mabilisang Gabay sa Simula**: Pinasimpleng seksyon ng tatlong hakbang sa pagsisimula (I-install → Mag-login → Mag-deploy)
- **📊 Talahanayan ng Navigasyon Batay sa Karanasan**: Malinaw na gabay kung saan magsisimula base sa karanasan ng developer

#### Binago
- **Estruktura ng README**: Inayos para sa unti-unting paglalantad - ang mga pangunahing impormasyon ang nauna
- **Seksyon ng Panimula**: Isinulat muli upang ipaliwanag ang "Hiwaga ng `azd up`" para sa mga ganap na baguhan
- **Tinanggal ang Dobleng Nilalaman**: Inalis ang dobleng seksyon ng troubleshooting
- **Mga Utos sa Troubleshooting**: Naayos ang sanggunian ng `azd logs` upang gamitin ang wastong `azd monitor --logs`

#### Naayos

- **🔐 Mga Utos sa Pagpapatunay**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Hindi Wastong Mga Sanggunian ng Utos**: Tinanggal ang natitirang `azd logs` mula sa seksyon ng troubleshooting ng README

#### Mga Tala
- **Saklaw**: Mga pagbabagong inilapat sa pangunahing README.md at resources/cheat-sheet.md
- **Target na Madla**: Mga pagpapabuti na partikular na nakatuon sa mga developer na bago sa AZD

---

### [v3.10.0] - 2026-02-05

#### Pag-update sa Katumpakan ng Utos ng Azure Developer CLI
**Nililinya ng bersyong ito ang mga hindi umiiral na AZD na mga utos sa buong dokumentasyon, tiniyak na lahat ng mga halimbawa ng code ay gumagamit ng wastong syntax ng Azure Developer CLI.**

#### Naayos
- **🔧 Tinanggal ang Hindi Umiiral na Mga Utos ng AZD**: Komprehensibong audit at pagtutuwid ng mga hindi wastong utos:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o mga alternatibong Azure CLI
  - `azd service` subcommand (hindi umiiral) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (hindi umiiral) → tinanggal o pinalitan ng mga wastong alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (hindi umiiral) → tinanggal
  - `azd provision --what-if/--rollback` flags (hindi umiiral) → in-update na gumamit ng `--preview`
  - `azd config validate` (hindi umiiral) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hindi umiiral) → tinanggal

- **📚 Mga File na Na-update na may Mga Pagtutuwid sa Utos**:
  - `resources/cheat-sheet.md`: Malaking pagbabago sa sanggunian ng mga utos
  - `docs/deployment/deployment-guide.md`: Naayos ang mga estratehiya sa rollback at deployment
  - `docs/troubleshooting/debugging.md`: Naayos ang mga seksyon ng pagsusuri ng log
  - `docs/troubleshooting/common-issues.md`: Na-update ang mga utos sa troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Naayos ang seksyon ng debugging ng AZD
  - `docs/getting-started/azd-basics.md`: Naayos ang mga utos sa monitoring
  - `docs/getting-started/first-project.md`: Na-update ang mga halimbawa ng monitoring at debugging
  - `docs/getting-started/installation.md`: Naayos ang mga halimbawa ng tulong at bersyon
  - `docs/pre-deployment/application-insights.md`: Naayos ang mga utos sa pagtingin ng log
  - `docs/pre-deployment/coordination-patterns.md`: Naayos ang mga utos sa debugging ng agent

- **📝 Na-update ang Sanggunian ng Bersyon**: 
  - `docs/getting-started/installation.md`: Pinalitan ang hardcoded na `1.5.0` bersyon ng generic na `1.x.x` na may link sa mga releases

#### Binago
- **Mga Estratehiya sa Rollback**: Na-update ang dokumentasyon upang gamitin ang rollback na batay sa Git (walang native rollback ang AZD)
- **Pagtingin ng Log**: Pinalitan ang mga sanggunian ng `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at mga utos ng Azure CLI
- **Seksyon ng Performance**: Tinanggal ang hindi umiiral na parallel/incremental deployment flags, nagbigay ng mga wastong alternatibo

#### Mga Teknikal na Detalye
- **Mga Wastong Utos ng AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Mga Wastong flag ng azd monitor**: `--live`, `--logs`, `--overview`
- **Tinanggal na Mga Tampok**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Bersipikasyon**: Mga utos na napatunayan laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagkumpleto ng Workshop at Pagpapahusay ng Kalidad ng Dokumentasyon
**Tinapos ng bersyong ito ang mga interactive workshop module, inayos ang lahat ng sirang link sa dokumentasyon, at pinahusay ang pangkalahatang kalidad ng nilalaman para sa mga developer ng AI gamit ang Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng mga alituntunin sa kontribusyon na may:
  - Malinaw na mga tagubilin para sa pag-uulat ng mga isyu at pagsusumite ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga gabay sa halimbawa ng code at mga alituntunin sa mensahe ng commit
  - Impormasyon sa pakikilahok ng komunidad

#### Natapos
- **🎯 Workshop Module 7 (Wrap-up)**: Ganap na natapos ang wrap-up module na may:
  - Komprehensibong buod ng mga nagawa sa workshop
  - Seksyon ng mga pangunahing konseptong na-master sa AZD, mga template, at Microsoft Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng paglalakbay sa pagkatuto
  - Mga hamon sa workshop na may antas ng kahirapan
  - Mga link sa puna ng komunidad at suporta

- **📚 Workshop Module 3 (Deconstruct)**: Na-update ang mga layunin ng pagkatuto na may:
  - Gabay sa pag-activate ng GitHub Copilot gamit ang mga MCP server
  - Pag-unawa sa istruktura ng folder ng AZD template
  - Mga pattern ng pagsasaayos ng Infrastructure-as-code (Bicep)
  - Mga tagubilin sa hands-on na lab

- **🔧 Workshop Module 6 (Teardown)**: Natapos na may:
  - Mga layunin sa paglilinis ng mga resource at pamamahala ng gastos
  - Paggamit ng `azd down` para sa ligtas na pag-alis ng imprastruktura
  - Gabay sa pagbawi ng soft-deleted cognitive services
  - Mga bonus na prompt para sa eksplorasyon ng GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Pag-aayos ng mga Sirang Link**: Naresolba ang 15+ na sirang mga panloob na link ng dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Naayos ang mga path papunta sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Naitama ang mga path ng ai-model-deployment.md at production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pinalitan ang hindi umiiral na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Naayos ang mga path ng FAQ at gabay sa troubleshooting
  - `examples/container-app/microservices/README.md`: Naitama ang mga path ng course home at deployment guide
  - `resources/faq.md` at `resources/glossary.md`: Na-update ang mga sanggunian ng kabanata ng AI
  - `course-outline.md`: Naayos ang mga sanggunian sa instructor guide at AI workshop lab

- **📅 Banner ng Status ng Workshop**: Na-update mula sa "Under Construction" sa aktibong status ng workshop na may petsang Pebrero 2026

- **🔗 Pag-navigate sa Workshop**: Naayos ang mga sirang link sa pag-navigate sa workshop README.md na tumuturo sa hindi umiiral na folder na lab-1-azd-basics

#### Binago
- **Presentasyon ng Workshop**: Tinanggal ang babalang "under construction," kumpleto na ang workshop at handa nang gamitin
- **Konsistensi sa Pag-navigate**: Siniiguro ang tamang pag-navigate sa pagitan ng mga module ng workshop
- **Mga Sanggunian sa Learning Path**: Na-update ang cross-reference ng kabanata para gamitin ang wastong mga path ng microsoft-foundry

#### Napatunayan
- ✅ Lahat ng English markdown files ay may wastong panloob na mga link
- ✅ Kumpleto na ang mga workshop module 0-7 na may mga layunin sa pagkatuto
- ✅ Gumagana ng maayos ang pag-navigate sa pagitan ng mga kabanata at module
- ✅ Akma ang nilalaman para sa mga developer ng AI na gumagamit ng Microsoft AZD
- ✅ Napanatili ang wikang madaling maintindihan at istruktura para sa mga baguhan
- ✅ Nagbibigay ang CONTRIBUTING.md ng malinaw na gabay para sa mga kontribyutor ng komunidad

#### Teknikal na Implementasyon
- **Pag-validate ng Link**: Awtomatikong PowerShell script na nag-verify ng lahat ng .md na panloob na mga link
- **Audit ng Nilalaman**: Manu-manong pagsusuri ng pagiging kumpleto ng workshop at angkop sa mga baguhan
- **Sistema ng Pag-navigate**: Inilapat ang pare-parehong mga pattern ng pag-navigate sa kabanata at module

#### Mga Tala
- **Saklaw**: Mga pagbabagong inilapat lamang sa Ingles na dokumentasyon
- **Mga Pagsasalin**: Hindi na-update ang mga folder ng pagsasalin sa bersyong ito (aawtomatikong sasabay ang pagsasalin sa ibang pagkakataon)
- **Tagal ng Workshop**: Nagbibigay na ngayon ang kumpletong workshop ng 3-4 na oras ng hands-on na pagkatuto

---

### [v3.8.0] - 2025-11-19

#### Advanced na Dokumentasyon: Monitoring, Seguridad, at Multi-Agent na Mga Pattern
**Idinagdag ng bersyong ito ang komprehensibong A-grade na mga aralin tungkol sa pagsasama ng Application Insights, mga pattern ng pagpapatunay, at multi-agent na koordinasyon para sa mga production deployment.**

#### Idinagdag
- **📊 Aralin sa Pagsasama ng Application Insights**: sa `docs/pre-deployment/application-insights.md`:
  - Deployment na nakatuon sa AZD na may awtomatikong provisioning
  - Kumpletong Bicep templates para sa Application Insights + Log Analytics
  - Gumaganang Python na mga aplikasyon na may pasadyang telemetry (1,200+ linya)
  - Mga pattern ng AI/LLM monitoring (Microsoft Foundry Models token/cost tracking)
  - 6 na diagram sa Mermaid (arkitektura, distributed tracing, daloy ng telemetry)
  - 3 hands-on na pagsasanay (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng Kusto query at mga estratehiya sa pag-optimize ng gastos
  - Live metrics streaming at real-time debugging
  - 40-50 minutong oras ng pagkatuto na may mga production-ready pattern

- **🔐 Aralin sa Mga Pattern ng Pagpapatunay at Seguridad**: sa `docs/getting-started/authsecurity.md`:
  - 3 pattern ng pagpapatunay (connection strings, Key Vault, managed identity)
  - Kumpletong Bicep infrastructure templates para sa mga secure na deployment
  - Node.js na code ng aplikasyon na may pagsasama ng Azure SDK
  - 3 kumpletong pagsasanay (pag-enable ng managed identity, user-assigned identity, Key Vault rotation)
  - Mga pinakamahusay na kasanayan sa seguridad at mga konfig ng RBAC
  - Gabay sa troubleshooting at pagsusuri ng gastos
  - Mga production-ready na pattern ng passwordless authentication

- **🤖 Aralin sa Mga Pattern ng Multi-Agent Coordination**: sa `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern ng koordinasyon (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong implementasyon ng orchestrator service (Python/Flask, 1,500+ linya)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Integrasyon ng Service Bus para sa message queuing
  - Pamamahala ng estado ng Cosmos DB para sa mga distributed na sistema
  - 6 na diagram ng Mermaid na nagpapakita ng interaksyon ng agent
  - 3 advanced na pagsasanay (timeout handling, retry logic, circuit breaker)
  - Pagsusuri ng gastos ($240-565/buwan) na may mga estratehiya sa pag-optimize
  - Pagsasama ng Application Insights para sa monitoring

#### Pinahusay
- **Kabanata ng Pre-deployment**: Ngayon ay may kasamang komprehensibong monitoring at mga pattern ng koordinasyon
- **Kabanata ng Getting Started**: Pinahusay gamit ang mga propesyonal na pattern ng pagpapatunay
- **Kahandaan sa Produksyon**: Kumpletong saklaw mula sa seguridad hanggang sa observability
- **Balangkas ng Kurso**: Na-update upang sumangguni sa mga bagong aralin sa Mga Kabanata 3 at 6

#### Binago
- **Pag-unlad ng Pagkatuto**: Mas mahusay na integrasyon ng seguridad at monitoring sa buong kurso
- **Kalidad ng Dokumentasyon**: Konsistenteng mga pamantayang A-grade (95-97%) sa mga bagong aralin
- **Production Patterns**: Kumpletong end-to-end na saklaw para sa enterprise deployments

#### Napabuti
- **Karanasan ng Developer**: Malinaw na landas mula sa development hanggang sa production monitoring
- **Mga Pamantayan sa Seguridad**: Mga propesyonal na pattern para sa pagpapatunay at pamamahala ng mga lihim
- **Observability**: Kumpletong pagsasama ng Application Insights gamit ang AZD
- **Mga AI Workload**: Espesyal na monitoring para sa Microsoft Foundry Models at mga multi-agent system

#### Napatunayan
- ✅ Lahat ng mga aralin ay may kumpletong gumaganang code (hindi mga snippet)
- ✅ Mga diagram ng Mermaid para sa biswal na pagkatuto (19 kabuuan sa 3 aralin)
- ✅ Mga hands-on na pagsasanay na may mga hakbang sa beripikasyon (9 kabuuan)
- ✅ Mga production-ready Bicep template na maaaring ideploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa pag-optimize
- ✅ Mga gabay sa troubleshooting at pinakamahusay na mga kasanayan
- ✅ Mga checkpoint sa kaalaman na may mga utos sa beripikasyon

#### Resulta ng Grado ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa monitoring
- **docs/getting-started/authsecurity.md**: - Mga propesyonal na pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Mga advanced na multi-agent na arkitektura
- **Kabuuang Bagong Nilalaman**: - Konsistenteng mataas na kalidad ng mga pamantayan

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + pasadyang telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + mga pattern ng RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Pamamahala ng Gastos**: Mga estratehiya sa sampling, mga polisiya sa retention, mga kontrol sa badyet

### [v3.7.0] - 2025-11-19

#### Mga Pagpapahusay sa Kalidad ng Dokumentasyon at Bagong Halimbawa ng Microsoft Foundry Models
**Pinahusay ng bersyong ito ang kalidad ng dokumentasyon sa buong repositoryo at nagdagdag ng kumpletong halimbawa ng deployment ng Microsoft Foundry Models gamit ang gpt-4.1 chat interface.**

#### Idinagdag
- **🤖 Halimbawa ng Microsoft Foundry Models Chat**: Kumpletong deployment ng gpt-4.1 na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong imprastruktura ng Microsoft Foundry Models (deployment ng gpt-4.1 model)
  - Python command-line chat interface na may kasaysayan ng pag-uusap
  - Integrasyon ng Key Vault para sa secure na pag-iimbak ng API key
  - Pagsubaybay sa paggamit ng token at pagtataya ng gastos
  - Limitasyon sa rate at paghawak ng error
  - Komprehensibong README na may 35-45 minutong gabay sa deployment
  - 11 production-ready na file (Bicep template, Python app, konfig)
- **📚 Mga Ehersisyo sa Dokumentasyon**: Nagdagdag ng mga hands-on na pagsasanay sa gabay sa konfig:
  - Ehersisyo 1: Multi-environment configuration (15 minuto)
  - Ehersisyo 2: Pagsasanay sa pamamahala ng lihim (10 minuto)
  - Malinaw na mga pamantayan ng tagumpay at mga hakbang sa beripikasyon
- **✅ Beripikasyon ng Deployment**: Nagdagdag ng seksyon ng beripikasyon sa gabay sa deployment:
  - Mga pamamaraan sa health check
  - Checklist para sa mga pamantayan ng tagumpay
  - Inaasahang mga output para sa lahat ng utos ng deployment
  - Mabilisang sanggunian sa troubleshooting

#### Pinahusay
- **examples/README.md**: Na-update sa A-grade na kalidad (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng kaugnay na seksyon
  - Na-update ang bilang ng lokal na mga halimbawa mula 3 hanggang 4
  - Idinagdag sa AI Application Examples na talahanayan
  - Isinama sa Quick Start para sa mga Intermediate User
  - Idinagdag sa seksyon ng Microsoft Foundry Templates
  - Na-update ang Comparison Matrix at mga seksyon sa paghahanap ng teknolohiya
- **Kalidad ng Dokumentasyon**: Pinabuting B+ (87%) → A- (92%) sa buong docs folder:

  - Idinagdag ang mga inaasahang output sa mga kritikal na halimbawa ng utos
  - Isinama ang mga hakbang sa beripikasyon para sa mga pagbabago sa konfigurasyon
  - Pinahusay ang hands-on na pagkatuto gamit ang mga praktikal na pagsasanay

#### Binago
- **Pag-unlad ng Pagkatuto**: Mas mahusay na pagsasama ng mga halimbawa ng AI para sa mga intermediate na nag-aaral
- **Istruktura ng Dokumentasyon**: Mas maraming gawaing praktikal na may malinaw na mga resulta
- **Proseso ng Beripikasyon**: Nilagyan ng malinaw na pamantayan ng tagumpay sa mga pangunahing workflow

#### Pinahusay
- **Karanasan ng Developer**: Ang deployment ng Microsoft Foundry Models ay tumatagal na lamang ng 35-45 minuto (kumpara sa 60-90 para sa mga kumplikadong alternatibo)
- **Kalinawan sa Gastos**: Malinaw na pagtataya ng gastos ($50-200/buwan) para sa halimbawa ng Microsoft Foundry Models
- **Daanan ng Pagkatuto**: May malinaw na entry point ang mga AI developer gamit ang azure-openai-chat
- **Pamantayan sa Dokumentasyon**: Konsistenteng mga inaasahang output at hakbang ng beripikasyon

#### Napatunayan
- ✅ Ganap na gumagana ang halimbawa ng Microsoft Foundry Models gamit ang `azd up`
- ✅ Lahat ng 11 implementation file ay tama ang sintaks
- ✅ Tugma ang mga instruksyon sa README sa aktwal na karanasan sa deployment
- ✅ Na-update ang mga link sa dokumentasyon sa higit sa 8 lokasyon
- ✅ Tumpak ang index ng mga halimbawa na nagpapakita ng 4 lokal na halimbawa
- ✅ Walang dobleng mga panlabas na link sa mga talahanayan
- ✅ Tama ang lahat ng mga reperensya sa nabigasyon

#### Teknikal na Implementasyon
- **Arkitektura ng Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps na pattern
- **Seguridad**: Handang Managed Identity, mga lihim sa Key Vault
- **Pagsubaybay**: Pagsasama ng Application Insights
- **Pamamahala ng Gastos**: Pagsubaybay ng token at pag-optimize ng paggamit
- **Deployment**: Isang `azd up` na utos para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Pangunahing Update: Mga Halimbawa ng Deployment ng Container App
**Ipinapakilala ng bersyong ito ang malawakang, handa para sa produksyon na mga halimbawa ng deployment ng container application gamit ang Azure Developer CLI (AZD), na may kumpletong dokumentasyon at integrasyon sa daanan ng pagkatuto.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kumpletong pangkalahatang-ideya ng mga containerized deployment, mabilis na pagsisimula, produksyon, at mga advanced na pattern
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Kaibig-ibig sa mga nagsisimula na REST API na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Handang para sa produksyon na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Pinakamahuhusay na Praktis**: Seguridad, monitoring, pag-optimize ng gastos, at gabay sa CI/CD para sa mga containerized workload
- **Mga Sample na Code**: Kumpleto ang `azure.yaml`, mga template ng Bicep, at mga implementation ng multi-lengguwahe na serbisyo (Python, Node.js, C#, Go)
- **Pagsubok at Troubleshooting**: End-to-end na mga senaryo ng pagsubok, mga utos sa monitoring, at gabay sa troubleshooting

#### Binago
- **README.md**: In-update upang ipakita at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: In-update upang i-highlight ang mga halimbawa ng container app, magdagdag ng mga tala sa paghahambing, at i-update ang mga reperensya sa teknolohiya/arkitektura
- **Balangkas ng Kurso at Gabay sa Pag-aaral**: In-update upang banggitin ang mga bagong halimbawa ng container app at mga pattern ng deployment sa mga kaugnay na kabanata

#### Napatunayan
- ✅ Lahat ng bagong halimbawa ay maaaring ideploy gamit ang `azd up` at sumusunod sa pinakamahusay na mga praktis
- ✅ Na-update ang mga cross-link at nabigasyon sa dokumentasyon
- ✅ Saklaw ng mga halimbawa ang mga senaryong mula sa panimulang hanggang advanced, kasama na ang produksyon ng microservices

#### Mga Tala
- **Saklaw**: Dokumentasyon at mga halimbawa sa wikang Ingles lamang
- **Susunod na Hakbang**: Palawakin gamit ang karagdagang advanced na mga pattern ng container at automation ng CI/CD sa mga susunod na bersyon

### [v3.5.0] - 2025-11-19

#### Rebranding ng Produkto: Microsoft Foundry
**Ipapatupad ng bersyong ito ang malawakang pagbabagong pangalan ng produkto mula "Microsoft Foundry" patungong "Microsoft Foundry" sa lahat ng dokumentasyong Ingles, na sumasalamin sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Pag-update ng Pangalan ng Produkto**: Ganap na rebranding mula "Microsoft Foundry" patungong "Microsoft Foundry"
  - In-update ang lahat ng reperensya sa dokumentasyong Ingles sa folder na `docs/`
  - Pinalitan ang pangalan ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 na reperensya sa nilalaman ang na-update sa 7 dokumentong files

- **📁 Mga Pagbabago sa Istruktura ng Folder**:
  - Pinalitan ang pangalan ng `docs/ai-foundry/` sa `docs/microsoft-foundry/`
  - In-update ang lahat ng cross-references upang ipakita ang bagong istruktura ng folder
  - Napatunayan ang mga link sa nabigasyon sa buong dokumentasyon

- **📄 Mga Pagpapalit ng Pangalan ng File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - In-update lahat ng internal na link upang tumukoy sa bagong pangalan ng file

#### Na-update na Mga File
- **Dokumentasyon ng Kabanata** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 na update sa navigation link
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 na reperensya sa pangalan ng produkto ang na-update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasalukuyang gumagamit na ng Microsoft Foundry (mula sa mga naunang update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 na reperensya ang na-update (pangkalahatang-ideya, feedback ng komunidad, dokumentasyon)
  - `docs/getting-started/azd-basics.md` - 4 na cross-reference link ang na-update
  - `docs/getting-started/first-project.md` - 2 na navigation link ang na-update sa kabanata
  - `docs/getting-started/installation.md` - 2 na next chapter link ang na-update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 na reperensya ang na-update (navigasyon, Discord na komunidad)
  - `docs/troubleshooting/common-issues.md` - 1 na navigation link ang na-update
  - `docs/troubleshooting/debugging.md` - 1 na navigation link ang na-update

- **Mga File ng Istruktura ng Kurso** (2 files):
  - `README.md` - 17 na reperensya ang na-update (pangkalahatang kurso, mga pamagat ng kabanata, seksyon ng templates, mga insight ng komunidad)
  - `course-outline.md` - 14 na reperensya ang na-update (pangkalahatang ideya, mga layunin sa pagkatuto, mga mapagkukunan ng kabanata)

#### Napatunayan
- ✅ Wala nang natitirang mga reperensya sa path ng folder na "ai-foundry" sa mga dokumentong Ingles
- ✅ Wala nang natitirang reperensya sa pangalan ng produkto na "Microsoft Foundry" sa mga dokumentong Ingles
- ✅ Lahat ng mga link sa nabigasyon ay gumagana nang maayos sa bagong istruktura ng folder
- ✅ Matagumpay na naisagawa ang pagpapalit ng pangalan ng file at folder
- ✅ Napatunayan ang mga cross-reference sa pagitan ng mga kabanata

#### Mga Tala
- **Saklaw**: Aplikado ang mga pagbabago sa dokumentasyong Ingles sa folder na `docs/` lamang
- **Pagsasalin**: Hindi na-update ang mga folder ng pagsasalin (`translations/`) sa bersyong ito
- **Workshop**: Hindi na-update ang mga materyales ng workshop (`workshop/`) sa bersyong ito
- **Mga Halimbawa**: Maaaring may mga file ng halimbawa na tumutukoy pa rin sa lumang pangalan (aayusin sa mga susunod na update)
- **Panlabas na Link**: Nanatiling hindi nabago ang mga panlabas na URL at mga reperensya sa repositoryo ng GitHub

#### Gabay sa Migrasyon para sa mga Contributor
Kung mayroon kang mga lokal na branch o dokumentasyon na tumutukoy sa lumang istruktura:
1. I-update ang mga reperensya sa folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga reperensya sa file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Microsoft Foundry" → "Microsoft Foundry"
4. Siguraduhin na gumagana pa rin ang lahat ng internal na link sa dokumentasyon

---

### [v3.4.0] - 2025-10-24

#### Pagpapahusay sa Preview ng Infrastrukturang at Beripikasyon
**Ipinapakilala ng bersyong ito ang malawakang suporta para sa bagong tampok ng Azure Developer CLI preview at pinapahusay ang karanasan ng user sa workshop.**

#### Idinagdag
- **🧪 azd provision --preview Documentation ng Tampok**: Kumpletong saklaw ng bagong kakayahan sa preview ng infrastruktura
  - Reperensyang utos at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa provisioning guide kasama ang mga use case at benepisyo
  - Integrasyon ng pre-flight check para sa mas ligtas na beripikasyon ng deployment
  - Mga update sa getting started guide na may safety-first na mga gawi sa deployment
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapakita ng status ng pag-develop ng workshop
  - Disenyong gradient na may mga tagapagpahiwatig ng konstruksyon para sa malinaw na komunikasyon sa user
  - Huling timestamp ng update para sa transparency
  - Disenyong mobile-responsive para sa lahat ng uri ng aparato

#### Pinahusay
- **Kaligtasan ng Infrastrukturang**: Isinama ang tampok na preview sa buong dokumentasyon ng deployment
- **Beripikasyon Bago Deployment**: Kasama na sa mga script ang pagsubok sa infrastructure preview
- **Daloy ng Developer**: In-update ang mga sunod-sunod na utos upang isama ang preview bilang pinakamahusay na gawi
- **Karanasan sa Workshop**: Malinaw na itinakda ang mga inaasahan para sa mga user tungkol sa status ng pag-develop ng content

#### Binago
- **Pinakamahusay na Gawi sa Deployment**: Inirerekomenda na ngayon ang workflow na preview-first
- **Daloy ng Dokumentasyon**: Inilipat ang infrastruktura validation sa mas maagang bahagi ng proseso ng pagkatuto
- **Presentasyon ng Workshop**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng pag-develop

#### Pinahusay
- **Ligtas na Unang Paraan**: Maaaring beripikahin ang mga pagbabago sa infrastruktura bago ang deployment
- **Pagtutulungan ng Team**: Maaaring ibahagi ang mga resulta ng preview para sa pagsusuri at pag-apruba
- **Kamalayan sa Gastos**: Mas maayos na pag-unawa sa mga gastusin bago mag-provision ng resources
- **Pagsugpo sa Panganib**: Nabawasan ang mga kabiguan sa deployment sa pamamagitan ng paunang beripikasyon

#### Teknikal na Implementasyon
- **Integrasyon ng Maramihang Dokumento**: Naidokumento ang preview feature sa 4 na susi na mga file
- **Mga Pattern ng Utos**: Konsistenteng sintaks at mga halimbawa sa buong dokumentasyon
- **Integrasyon ng Pinakamahusay na Praktis**: Kasama ang preview sa mga workflow ng validation at mga script
- **Mga Visual na Tagapagpahiwatig**: Malinaw na marka ng BAGONG tampok para sa pagkakatuklas

#### Infrastrukturang Workshop
- **Komunikasyon ng Status**: Propesyonal na HTML banner na may gradient styling
- **Karanasan ng User**: Malinaw na status ng pag-develop upang maiwasan ang pagkalito
- **Propesyonal na Presentasyon**: Pinananatili ang kredibilidad ng repository habang itinatakda ang mga inaasahan
- **Transparency ng Timeline**: Oktubre 2025 na huling update timestamp para sa pananagutan

### [v3.3.0] - 2025-09-24

#### Pinahusay na Materyales ng Workshop at Interaktibong Karanasan sa Pagkatuto
**Ipinapakilala ng bersyong ito ang malawakang materyales sa workshop na may browser-based na interaktibong gabay at istrukturadong mga daanan ng pagkatuto.**

#### Idinagdag
- **🎥 Interaktibong Gabay sa Workshop**: Browser-based na karanasan sa workshop na may kakayahan ng MkDocs preview
- **📝 Istrakturadong Instruksyon sa Workshop**: 7-hakbang na ginabay na daanan ng pagkatuto mula diskubre hanggang pagpapasadya
  - 0-Panimula: Pangkalahatang-ideya ng workshop at setup
  - 1-Piliin-ang-AI-Template: Proseso ng pagtuklas at pagpili ng template
  - 2-Beripikahin-ang-AI-Template: Mga pamamaraan sa deployment at beripikasyon
  - 3-Buksan-ang-AI-Template: Pag-unawa sa arkitektura ng template
  - 4-Konpigura-ang-AI-Template: Konfigurasyon at pagpapasadya
  - 5-I-customize-ang-AI-Template: Advanced na mga pagbabago at iteration
  - 6-Pagwawakas-ng-Infrastrukturang: Paglilinis at pamamahala ng resources
  - 7-Pagsasara: Buod at mga susunod na hakbang
- **🛠️ Mga Kagamitan sa Workshop**: Config ng MkDocs na may Material theme para sa pinahusay na karanasan sa pagkatuto
- **🎯 Daanan ng Hands-On na Pagkatuto**: 3-hakbang na metodolohiya (Diskubre → Deployment → Pagpapasadya)
- **📱 Integrasyon sa GitHub Codespaces**: Seamless na setup ng environment ng pag-develop

#### Pinahusay
- **AI Workshop Lab**: Pinalawig na may komprehensibong 2-3 oras na istrakturadong karanasan sa pagkatuto
- **Dokumentasyon ng Workshop**: Propesyonal na presentasyon na may nabigasyon at mga visual aid
- **Pag-unlad sa Pagkatuto**: Malinaw na hakbang-hakbang na gabay mula pagpili ng template hanggang produksyon na deployment
- **Karanasan ng Developer**: Pinagsamang mga kagamitan para sa mas maayos na workflow sa pag-develop

#### Pinabuti
- **Accessibility**: Browser-based na interface na may search, kopyahin na functionality, at theme toggle
- **Self-Paced na Pagkatuto**: Flexible na istruktura ng workshop na tumatanggap ng iba't ibang bilis sa pagkatuto
- **Praktikal na Aplikasyon**: Mga senaryong tunay na deployment ng AI template
- **Integrasyon ng Komunidad**: Integrasyon sa Discord para sa suporta at kolaborasyon ng workshop

#### Mga Tampok ng Workshop
- **Naka-built-in na Search**: Mabilis na paghahanap ng keyword at aralin
- **Kopyahin ang mga Code Block**: Hover-to-copy functionality para sa lahat ng mga halimbawa ng code
- **Theme Toggle**: Suporta sa madilim/maliwanag na mode para sa iba't ibang kagustuhan
- **Visual na Assets**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Integrasyon ng Tulong**: Direktang access sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Pangunahing Pagbabago sa Istruktura ng Nabigasyon at Sistema ng Pagkatuto Batay sa Kabanata
**Ipinapakilala ng bersyong ito ang malawakang istruktura ng pagkatuto batay sa kabanata na may pinahusay na nabigasyon sa buong repository.**

#### Idinagdag
- **📚 Sistema ng Pagkatuto Batay sa Kabanata**: Inistruktura ang buong kurso sa 8 progresibong kabanata ng pagkatuto
  - Kabanata 1: Pundasyon at Mabilis na Simula (⭐ - 30-45 minuto)
  - Kabanata 2: AI-First na Pagdevelop (⭐⭐ - 1-2 oras)
  - Kabanata 3: Konfigurasyon at Authentication (⭐⭐ - 45-60 minuto)
  - Kabanata 4: Infrastrukturang bilang Code at Deployment (⭐⭐⭐ - 1-1.5 oras)
  - Kabanata 5: Solusyong Multi-Agent AI (⭐⭐⭐⭐ - 2-3 oras)
  - Kabanata 6: Pre-Deployment na Beripikasyon at Pagpaplano (⭐⭐ - 1 oras)
  - Kabanata 7: Troubleshooting at Debugging (⭐⭐ - 1-1.5 oras)
  - Kabanata 8: Ginagawa at Enterprise na Mga Pattern (⭐⭐⭐⭐ - 2-3 oras)
- **📚 Komprehensibong Sistema ng Nabigasyon**: Konsistenteng mga header at footer ng nabigasyon sa lahat ng dokumentasyon
- **🎯 Pagsubaybay ng Progreso**: Checklist ng pagkumpleto ng kurso at sistema ng beripikasyon ng pagkatuto
- **🗺️ Gabay sa Daanan ng Pagkatuto**: Malilinaw na entry point para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference na Nabigasyon**: Mga kaugnay na kabanata at pangunahing pangangailangan na malinaw na nakalink

#### Pinahusay
- **Istruktura ng README**: Inilapat bilang isang istrukturadong learning platform na may organisasyon batay sa kabanata
- **Nabigasyon ng Dokumentasyon**: Ngayong kasama na sa bawat pahina ang konteksto ng kabanata at gabay sa pag-usad
- **Organisasyon ng Template**: Inilapat ang mga halimbawa at template sa angkop na kabanata ng pagkatuto

- **Integrasyon ng Mga Mapagkukunan**: Cheat sheets, FAQs, at mga gabay sa pag-aaral na konektado sa mga kaugnay na kabanata
- **Integrasyon ng Workshop**: Mga hands-on na lab na naka-mapa sa maramihang mga layunin sa pag-aaral ng kabanata

#### Binago
- **Pag-usad ng Pag-aaral**: Inilipat mula sa linear na dokumentasyon patungo sa flexible na pag-aaral batay sa kabanata
- **Paglalagay ng Konfigurasyon**: Inilipat ang gabay sa konfigurasyon bilang Kabanata 3 para sa mas maayos na daloy ng pag-aaral
- **Integrasyon ng Nilalaman ng AI**: Mas mahusay na integrasyon ng nilalamang AI-specific sa buong proseso ng pag-aaral
- **Nilalaman ng Produksyon**: Pinagsamang mga advanced na pattern sa Kabanata 8 para sa mga enterprise learners

#### Pinahusay
- **Karanasan ng Gumagamit**: Malinaw na mga navigation breadcrumb at indikasyon ng progreso sa kabanata
- **Accessibility**: Konsistenteng mga pattern ng nabigasyon para sa mas madaliang pagdaan sa kurso
- **Propesyonal na Presentasyon**: Estilo ng kurso sa unibersidad na angkop para sa akademiko at korporatibong pagsasanay
- **Kahusayan sa Pag-aaral**: Nabawasang oras sa paghahanap ng kaugnay na nilalaman sa pamamagitan ng pinahusay na organisasyon

#### Teknikal na Implementasyon
- **Mga Header ng Nabigasyon**: Standardisadong nabigasyon ng kabanata sa mahigit 40 na dokumentong file
- **Footer Navigation**: Konsistenteng mga gabay sa progreso at indikasyon ng pagtatapos ng kabanata
- **Cross-Linking**: Komprehensibong sistema ng interlink na nag-uugnay sa mga kaugnay na konsepto
- **Pagmamapa ng Kabanata**: Mga template at halimbawa na malinaw na kaugnay sa mga layunin sa pag-aaral

#### Pagpapahusay ng Gabay sa Pag-aaral
- **📚 Komprehensibong Mga Layunin sa Pag-aaral**: Naayos ang gabay sa pag-aaral upang umayon sa 8-kabanatang sistema
- **🎯 Pagsusulit Batay sa Kabanata**: Bawat kabanata ay may partikular na mga layunin sa pag-aaral at praktikal na mga gawain
- **📋 Pagsubaybay sa Progreso**: Lingguhang iskedyul sa pag-aaral na may nasusukat na mga kinalabasan at checklist ng pagtatapos
- **❓ Mga Tanong sa Pagsusulit**: Mga tanong para sa pagpapatunay ng kaalaman sa bawat kabanata na may propesyonal na kinalabasan
- **🛠️ Praktikal na Mga Gawain**: Hands-on na mga aktibidad na may totoong scenario ng deployment at troubleshooting
- **📊 Pag-unlad ng Kasanayan**: Malinaw na pag-angat mula sa mga batayang konsepto hanggang sa mga enterprise pattern na may pokus sa pag-unlad ng karera
- **🎓 Balangkas ng Sertipikasyon**: Mga propesyonal na kinalabasan sa pag-unlad at sistema ng pagkilala ng komunidad
- **⏱️ Pamamahala ng Timeline**: Nakabalangkas na 10-linggong plano sa pag-aaral na may pag-validate ng mga milestone

### [v3.1.0] - 2025-09-17

#### Pinahusay na Multi-Agent AI Solutions
**Pinapabuti ng bersyong ito ang multi-agent retail solution gamit ang mas malinaw na pagtatalaga ng pangalan ng agent at pinahusay na dokumentasyon.**

#### Binago
- **Terminolohiya ng Multi-Agent**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pagkaunawa
- **Arkitektura ng Agent**: In-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code upang gumamit ng konsistenteng "Customer agent" na pangalan
- **Mga Halimbawa ng Konfigurasyon**: Modernisado ang mga pattern ng konfigurasyon ng agent gamit ang updated na mga naming convention
- **Konsistensi ng Dokumentasyon**: Tiniyak na ang lahat ng sanggunian ay gumagamit ng propesyonal at deskriptibong mga pangalan ng agent

#### Pinahusay
- **ARM Template Package**: In-update ang retail-multiagent-arm-template na may mga kundisyon sa Customer agent
- **Diagram ng Arkitektura**: Ni-refresh ang mga Mermaid diagrams gamit ang updated na pangalan ng agent
- **Mga Halimbawa ng Code**: Mga Python classes at halimbawa ng implementasyon ngayon ay gumagamit ng CustomerAgent naming
- **Mga Environment Variable**: In-update ang lahat ng deployment scripts upang gumamit ng CUSTOMER_AGENT_NAME conventions

#### Pinahusay
- **Karanasan ng Developer**: Mas malinaw na mga tungkulin at responsibilidad ng agent sa dokumentasyon
- **Kahandaan sa Produksyon**: Mas maayos na pagtutugma sa mga enterprise naming convention
- **Mga Materyales sa Pag-aaral**: Mas madaling intindihin na pangalan ng agent para sa mga edukasyonal na layunin
- **Usability ng Template**: Mas pina-simpleng pagkaunawa ng mga function ng agent at mga pattern ng deployment

#### Teknikal na Detalye
- In-update ang Mermaid architecture diagrams na may mga sanggunian sa CustomerAgent
- Pinalitan ang mga pangalang CoraAgent class ng CustomerAgent sa mga halimbawa ng Python
- Binago ang mga ARM template JSON configuration upang gamitin ang "customer" agent type
- In-update ang mga environment variable mula CORA_AGENT_* patungo sa CUSTOMER_AGENT_* na mga pattern
- Ni-refresh ang lahat ng mga deployment command at mga container configuration

### [v3.0.0] - 2025-09-12

#### Malalaking Pagbabago - Pokus sa AI Developer at Microsoft Foundry Integration
**Ang bersyong ito ay nagbabago sa repositoryo bilang komprehensibong AI-focused na learning resource na may integrasyon ng Microsoft Foundry.**

#### Idinagdag
- **🤖 AI-First Learning Path**: Kumpletong pag-restructure na nagbibigay prioridad sa mga AI developer at engineer
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa mga serbisyo ng Microsoft Foundry
- **Mga Pattern sa AI Model Deployment**: Detalyadong gabay sa pagpili ng modelo, konfigurasyon, at mga estratehiya sa deployment ng produksyon
- **AI Workshop Lab**: 2-3 oras na hands-on workshop para sa pag-convert ng AI applications sa AZD-deployable solutions
- **Pinakamahusay na Praktis sa Produksyon ng AI**: Mga enterprise-ready na pattern para sa scaling, monitoring, at pagsigurado ng AI workloads
- **AI-Specific Troubleshooting Guide**: Komprehensibong troubleshooting para sa Microsoft Foundry Models, Cognitive Services, at mga isyu sa AI deployment
- **AI Template Gallery**: Tampok na koleksyon ng Microsoft Foundry template kasama ang mga rating ng complexity
- **Workshop Materials**: Kumpletong istruktura ng workshop na may hands-on labs at mga materyales na sanggunian

#### Pinahusay
- **Estruktura ng README**: Nakatuon sa AI developer na may 45% data ng interes ng komunidad mula sa Microsoft Foundry Discord
- **Mga Learning Paths**: Nakalaan na AI developer journey kasabay ng tradisyonal na mga landas para sa mga estudyante at DevOps engineer
- **Rekomendasyon ng Template**: Tampok na AI template kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Integrasyon ng Komunidad**: Pinahusay na suporta ng Discord community na may AI-specific na mga channel at diskusyon

#### Seguridad at Pokus sa Produksyon
- **Managed Identity Patterns**: AI-specific na konfigurasyon sa autentikasyon at seguridad
- **Pag-optimize ng Gastos**: Pagsubaybay sa paggamit ng token at kontrol ng badyet para sa AI workloads
- **Multi-Region Deployment**: Mga estratehiya para sa global na deployment ng AI application
- **Monitoring ng Pagganap**: AI-specific na mga metrika at integrasyon ng Application Insights

#### Kalidad ng Dokumentasyon
- **Linear Course Structure**: Lohikal na pag-usad mula sa baguhan hanggang sa advanced na mga pattern ng AI deployment
- **Validated URLs**: Lahat ng panlabas na link sa repositoryo ay na-verify at ma-access
- **Kumpletong Sanggunian**: Lahat ng panloob na link ng dokumentasyon ay na-validate at functional
- **Handa sa Produksyon**: Mga pattern sa enterprise deployment na may totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Malalaking Pagbabago - Pag-restructure ng Repositoryo at Propesyonal na Pagpapahusay
**Ang bersyong ito ay kumakatawan sa isang malaking overhaul ng istruktura ng repositoryo at presentasyon ng nilalaman.**

#### Idinagdag
- **Structured Learning Framework**: Lahat ng dokumentong pahina ngayon ay may seksyon ng Panimula, Mga Layunin sa Pag-aaral, at Mga Kinalabasan sa Pag-aaral
- **Sistema ng Nabigasyon**: Idinagdag ang mga link na Previous/Next lesson sa buong dokumentasyon para sa gabay na pag-usad sa pag-aaral
- **Gabay sa Pag-aaral**: Komprehensibong study-guide.md na may mga layunin sa pag-aaral, praktis na gawain, at mga materyales sa pagsusulit
- **Propesyonal na Presentasyon**: Tinanggal ang lahat ng mga emoji icon para sa pinahusay na accessibility at propesyonal na anyo
- **Pinahusay na Estruktura ng Nilalaman**: Pinahusay na organisasyon at daloy ng mga materyales sa pag-aaral

#### Binago
- **Format ng Dokumentasyon**: Istandardisa ang lahat ng dokumentasyon na may konsistenteng istruktura na nakatuon sa pag-aaral
- **Daloy ng Nabigasyon**: Ipatupad ang lohikal na pag-usad sa lahat ng materyales sa pag-aaral
- **Presentasyon ng Nilalaman**: Tinanggal ang mga dekoratibong elemento pabor sa malinaw at propesyonal na pag-format
- **Istruktura ng Link**: In-update ang lahat ng panloob na link upang suportahan ang bagong sistema ng nabigasyon

#### Pinahusay
- **Accessibility**: Tinanggal ang mga dependency ng emoji para sa mas mahusay na compatibility sa screen reader
- **Propesyonal na Anyong Pang-presentasyon**: Malinis, akademikong istilo na angkop para sa enterprise learning
- **Karanasan sa Pag-aaral**: Nakabalangkas na pamamaraan na may malinaw na mga layunin at kinalabasan para sa bawat aralin
- **Organisasyon ng Nilalaman**: Mas mahusay na lohikal na daloy at koneksyon sa pagitan ng kaugnay na mga paksa

### [v1.0.0] - 2025-09-09

#### Unang Release - Komprehensibong AZD Learning Repository

#### Idinagdag
- **Pangunahing Istruktura ng Dokumentasyon**
  - Kumpletong serye ng gabay sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga mapagkukunan sa troubleshooting at gabay sa debugging
  - Mga tool at pamamaraan para sa pre-deployment validation

- **Module sa Pagsisimula**
  - AZD Basics: Mga pangunahing konsepto at terminolohiya
  - Gabay sa Instalasyon: Mga tagubilin sa platform-specific na setup
  - Gabay sa Konfigurasyon: Setup ng environment at authentication
  - Unang Tutorial ng Proyekto: Step-by-step hands-on na pag-aaral

- **Module ng Deployment at Provisioning**
  - Gabay sa Deployment: Kumpletong dokumentasyon ng workflow
  - Gabay sa Provisioning: Infrastructure as Code gamit ang Bicep
  - Pinakamahusay na mga kasanayan para sa mga production deployment
  - Mga pattern ng multi-service architecture

- **Module ng Pre-deployment Validation**
  - Capacity Planning: Pag-validate ng availability ng Azure resource
  - SKU Selection: Komprehensibong gabay sa tier ng serbisyo
  - Pre-flight Checks: Automated validation scripts (PowerShell at Bash)
  - Mga tool para sa pagtatantiya ng gastos at pagpaplano ng badyet

- **Module ng Troubleshooting**
  - Mga Karaniwang Isyu: Madalas na nararanasang mga problema at solusyon
  - Gabay sa Debugging: Sistematikong mga metodolohiya sa troubleshooting
  - Advanced na mga teknik at tool sa diagnostic
  - Monitoring ng pagganap at optimization

- **Mga Mapagkukunan at Sanggunian**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mga pangunahing command
  - Glossary: Komprehensibong terminolohiya at mga kahulugan ng acronym
  - FAQ: Detalyadong sagot sa mga karaniwang tanong
  - Mga panlabas na link ng mapagkukunan at koneksyon sa komunidad

- **Mga Halimbawa at Template**
  - Halimbawa ng Simple Web Application
  - Template ng Static Website deployment
  - Konfigurasyon ng Container Application
  - Mga pattern ng integrasyon ng Database
  - Mga halimbawa ng microservices architecture
  - Implementasyon ng serverless function

#### Mga Tampok
- **Suporta sa Maramihang Plataporma**: Mga gabay sa instalasyon at konfigurasyon para sa Windows, macOS, at Linux
- **Iba’t Ibang Antas ng Kasanayan**: Nilalaman na dinisenyo mula estudyante hanggang propesyonal na developer
- **Praktikal na Pokus**: Hands-on na mga halimbawa at mga totoong senaryo
- **Komprehensibong Saklaw**: Mula sa mga batayang konsepto hanggang sa mga advanced na enterprise pattern
- **Seguridad bilang Unang Prayoridad**: Pinaka-mahusay na mga praktis sa seguridad na isinama sa buong nilalaman
- **Pag-optimize ng Gastos**: Gabay para sa epektibo sa gastos na deployment at pamamahala ng resource

#### Kalidad ng Dokumentasyon
- **Detalyadong Mga Halimbawa ng Code**: Praktikal at nasubukan na mga sample ng code
- **Mga Tagubilin Isa-isa**: Malinaw at direktang mga gabay
- **Komprehensibong Paghawak ng Error**: Troubleshooting para sa mga karaniwang isyu
- **Pagsasama ng Pinakamahusay na Praktis**: Mga pamantayan at rekomendasyon ng industriya
- **Pagkakatugma sa Bersyon**: Napapanahon sa pinakabagong serbisyo ng Azure at mga feature ng azd

## Planadong Mga Hinaharap na Pagpapahusay

### Bersyon 3.1.0 (Planado)
#### Pagpapalawak ng AI Platform
- **Suporta sa Maramihang Modelo**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at mga custom model
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Mga Advanced na Pattern ng RAG**: Mga pagpipilian ng vector database kapwa bukod sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **Pagmamasid sa AI**: Pinahusay na monitoring para sa pagganap ng modelo, paggamit ng token, at kalidad ng tugon

#### Karanasan ng Developer
- **VS Code Extension**: Pinagsamang karanasan sa pag-develop ng AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-assisted na pagbuo ng AZD template
- **Interaktibong Tutorial**: Hands-on coding exercises na may automated validation para sa AI scenarios
- **Video Content**: Pampunong video tutorial para sa mga visual learner na nakatuon sa AI deployment

### Bersyon 4.0.0 (Planado)
#### Mga Pattern ng Enterprise AI
- **Balangkas ng Gobernansa**: Pamamahala ng AI model, pagsunod, at mga audit trail
- **Multi-Tenant AI**: Mga pattern para pagsilbihan ang maraming customer gamit ang hiwalay na AI service
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga pattern ng multi-cloud at hybrid deployment para sa AI workloads

#### Mga Advanced na Tampok
- **Automation ng AI Pipeline**: MLOps integrasyon sa Azure Machine Learning pipelines
- **Advanced Security**: Mga zero-trust pattern, private endpoint, at advanced na pagprotekta sa banta
- **Pag-optimize ng Pagganap**: Mga advanced na tuning at scaling na estratehiya para sa mataas na throughput AI application
- **Global Distribution**: Mga pattern sa content delivery at edge caching para sa AI application

### Bersyon 3.0.0 (Planado) - Napalitan ng Kasalukuyang Release
#### Pinapanukalang Dagdag - Ngayon ay Naipatupad sa v3.0.0
- ✅ **Nilalamang AI-Focused**: Komprehensibong Microsoft Foundry integration (Natapos na)
- ✅ **Interaktibong Tutorial**: Hands-on na AI workshop lab (Natapos na)
- ✅ **Advanced Security Module**: AI-specific na mga security pattern (Natapos na)
- ✅ **Pag-optimize ng Pagganap**: Mga estratehiya sa fine-tuning ng AI workload (Natapos na)

### Bersyon 2.1.0 (Planado) - Bahagyang Naipatupad sa v3.0.0
#### Maliliit na Pagpapahusay - Ilan ay Natapos na sa Kasalukuyang Release
- ✅ **Karagdagang Mga Halimbawa**: AI-focused na deployment scenarios (Natapos na)
- ✅ **Pinalawig na FAQ**: AI-specific na mga tanong at troubleshooting (Natapos na)
- **Integrasyon ng Tool**: Pinahusay na gabay sa IDE at editor integration
- ✅ **Pagpapalawak ng Monitoring**: AI-specific na mga pattern ng monitoring at alerting (Natapos na)

#### Plano Pa Ring Ilabas sa Hinaharap na Bersyon
- **Mobile-Friendly Documentation**: Responsive na disenyo para sa mobile learning
- **Offline Access**: Maida-download na mga dokumentasyon na package
- **Pinahusay na IDE Integration**: VS Code extension para sa AZD + AI workflow
- **Dashboard ng Komunidad**: Real-time na metrics ng komunidad at pagsubaybay sa kontribusyon

## Pag-aambag sa Changelog

### Pagsumite ng Mga Pagbabago
Kapag nag-aambag sa repositoryong ito, tiyaking ang mga changelog entry ay nagsasama ng:

1. **Numero ng Bersyon**: Sumusunod sa semantic versioning (major.minor.patch)
2. **Petsa**: Petsa ng release o update sa format na YYYY-MM-DD
3. **Kategorya**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Malinaw na Paglalarawan**: Maikling paglalarawan ng mga nabago
5. **Pagsusuri ng Epekto**: Paano naaapektuhan ng mga pagbabago ang mga kasalukuyang gumagamit

### Mga Kategorya ng Pagbabago

#### Idinagdag
- Mga bagong tampok, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o learning resources
- Dagdag na mga tool, script, o utilities

#### Binago
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga pag-update para sa pagpapabuti ng kalinawan o katumpakan
- Pag-restructure ng nilalaman o organisasyon

#### Deprecated
- Mga tampok o pamamaraan na unti-unting tinatanggal
- Mga seksyon ng dokumentasyon na nakatakdang alisin
- Mga pamamaraan na may mas mahusay na alternatibo

#### Tinanggal
- Mga tampok, dokumentasyon, o halimbawa na hindi na angkop
- Lipas na impormasyon o deprecated na pamamaraan
- Redundant o pinagsamang nilalaman

#### Naayos
- Mga pagwawasto sa mga error sa dokumentasyon o code
- Resolusyon ng mga na-report na isyu o problema
- Mga pagpapahusay sa katumpakan o functionality


#### Seguridad
- Mga pagbuti o pag-aayos na may kinalaman sa seguridad
- Mga update sa pinakamahuhusay na gawi sa seguridad
- Pagresolba ng mga kahinaan sa seguridad

### Alituntunin sa Semantic Versioning

#### Pangunahing Bersyon (X.0.0)
- Mga pagbabago na sumisira na nangangailangan ng aksyon mula sa gumagamit
- Malaking pagbabago sa estruktura ng nilalaman o organisasyon
- Mga pagbabago na nagbabago sa pundamental na pamamaraan o metodolohiya

#### Maliit na Bersyon (X.Y.0)
- Mga bagong tampok o dagdag na nilalaman
- Mga pagpapahusay na nananatiling compatible paharap-sa-likod
- Mga dagdag na halimbawa, kasangkapan, o sanggunian

#### Patch na Bersyon (X.Y.Z)
- Mga pag-aayos ng bug at koreksyon
- Maliit na pagbuti sa umiiral na nilalaman
- Pagpapalinaw at maliliit na pagpapahusay

## Feedback at Mga Mungkahi mula sa Komunidad

Aktibo naming hinihikayat ang feedback mula sa komunidad upang mapabuti ang mapagkukunan ng pagkatuto na ito:

### Paano Magbigay ng Feedback
- **GitHub Issues**: Iulat ang mga problema o magmungkahi ng mga pagpapabuti (tanggap ang mga isyu na specific sa AI)
- **Discord Discussions**: Ibahagi ang mga ideya at makihalubilo sa Microsoft Foundry community
- **Pull Requests**: Mag-ambag ng direktang pagpapabuti sa nilalaman, lalo na sa mga AI template at gabay
- **Microsoft Foundry Discord**: Makilahok sa #Azure channel para sa mga diskusyon tungkol sa AZD + AI
- **Community Forums**: Makilahok sa mas malawak na mga diskusyon para sa mga Azure developer

### Mga Kategorya ng Feedback
- **Katumpakan ng AI Content**: Mga pagwawasto sa impormasyon tungkol sa integrasyon at deployment ng AI service
- **Karanasan sa Pagkatuto**: Mga mungkahi para sa mas pinahusay na daloy ng pagkatuto para sa mga AI developer
- **Nawawalang AI Content**: Mga kahilingan para sa karagdagang AI templates, pattern, o mga halimbawa
- **Accessibility**: Mga pagpapabuti para sa iba't ibang pangangailangan sa pagkatuto
- **Integrasyon ng AI Tool**: Mga mungkahi para sa mas mahusay na integrasyon ng workflow sa pag-develop ng AI
- **Production AI Patterns**: Mga kahilingan para sa enterprise AI deployment patterns

### Pangako sa Pagtugon
- **Pagtugon sa Isyu**: Sa loob ng 48 oras para sa mga iniulat na problema
- **Mga Kahilingan sa Tampok**: Ebalwasyon sa loob ng isang linggo
- **Mga Ambag ng Komunidad**: Pagsusuri sa loob ng isang linggo
- **Mga Isyu sa Seguridad**: Agarang prayoridad na may pinaigting na tugon

## Iskedyul ng Maintenance

### Regular na Mga Update
- **Buwanang Pagsusuri**: Katumpakan ng nilalaman at beripikasyon ng mga link
- **Quarterly Updates**: Malalaking dagdag sa nilalaman at pagpapahusay
- **Semi-Annual Reviews**: Malawakang muling estruktura at pagpapabuti
- **Annual Releases**: Mga pangunahing update ng bersyon na may makabuluhang pagpapabuti

### Pagsubaybay at Katiyakan sa Kalidad
- **Automated Testing**: Regular na beripikasyon ng mga halimbawa ng code at mga link
- **Pagsama ng Feedback ng Komunidad**: Regular na pagsasama ng mga mungkahi ng gumagamit
- **Mga Update sa Teknolohiya**: Pagsunod sa pinakabagong Azure services at mga azd release
- **Accessibility Audits**: Regular na pagsusuri para sa mga prinsipyo ng inklusibong disenyo

## Patakaran sa Suporta ng Bersyon

### Suporta para sa Kasalukuyang Bersyon
- **Pinakabagong Pangunahing Bersyon**: Buong suporta na may regular na mga update
- **Nakaraang Pangunahing Bersyon**: Mga update sa seguridad at mahahalagang pag-aayos sa loob ng 12 buwan
- **Mga Legacy na Bersyon**: Suporta ng komunidad lamang, walang opisyal na mga update

### Patnubay sa Migrasyon
Kapag inilalabas ang mga pangunahing bersyon, nagbibigay kami ng:
- **Migration Guides**: Mga hakbang-hakbang na mga tagubilin para sa pagtawid
- **Compatibility Notes**: Mga detalye tungkol sa mga breaking changes
- **Tool Support**: Mga script o utility para tumulong sa migrasyon
- **Community Support**: Mga dedikadong forum para sa mga katanungan tungkol sa migrasyon

---

**Navigation**
- **Nakaraang Aralin**: [Study Guide](resources/study-guide.md)
- **Susunod na Aralin**: Bumalik sa [Main README](README.md)

**Stay Updated**: I-watch ang repositoryong ito para sa mga notipikasyon tungkol sa mga bagong release at mga mahahalagang update sa mga materyales sa pagkatuto.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
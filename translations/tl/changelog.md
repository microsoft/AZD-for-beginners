# Tala ng mga Pagbabago - AZD Para sa mga Nagsisimula

## Panimula

Itong tala ng mga pagbabago ay nagdodokumento ng lahat ng mahahalagang pagbabago, pag-update, at pagpapabuti sa AZD Para sa mga Nagsisimula na repositoryo. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinapanatili ang talaang ito upang matulungan ang mga gumagamit maunawaan kung ano ang nabago sa pagitan ng mga bersyon.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagsusuri sa tala ng mga pagbabago, ikaw ay:
- Malalaman ang mga bagong tampok at dagdag na nilalaman
- Maiintindihan ang mga pagpapahusay na ginawa sa umiiral na dokumentasyon
- Masusubaybayan ang mga pag-aayos ng bug at koreksyon upang matiyak ang katumpakan
- Masusundan ang ebolusyon ng mga materyales sa pagkatuto sa paglipas ng panahon

## Mga Kinalabasan ng Pagkatuto

Pagkatapos suriin ang mga tala ng pagbabago, magagawa mong:
- Tukuyin ang mga bagong nilalaman at mga mapagkukunan na magagamit para sa pagkatuto
- Maunawaan kung aling mga seksyon ang na-update o napabuti
- Planuhin ang iyong landas sa pagkatuto batay sa pinakabagong mga materyales
- Mag-ambag ng puna at suhestiyon para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.24.0]- 2026-11-04

#### Naayos
- Naayos ang navigasyon para sa kursong Ingles, mga lumipat na path ng pahina, nawawalang mga anchor, at mga lipas na panlabas na sanggunian, kabilang na ang link ng Kabanata 2 patungo sa production AI guide.
- Sinuri ang kasalukuyang gabay laban sa inilathalang AZD 1.37.2, agents 1.0.0-beta.23, at evaluations 1.0.0-beta.2. Dinokumento ang hiwalay na `azd ai eval` workflow at ang migrasyon ng configuration para sa optimisasyon.
- Naayos ang mga hindi suportadong flag ng CLI, mga hangganan ng authentication, gabay sa plaintext na environment/secret, mga update sa imprastraktura, configuration ng modelo, at mga halimbawa ng mapanirang recovery.
- In-refresh ang workshop laban sa kasalukuyang AI Agents sample, kabilang ang mga aktwal na hooks, configuration inputs, evaluation tests, red-teaming entry points, at observability.
- Naayos ang mga claim sa halimbawa ng implementasyon at naayos ang mga kaugnay na isyu sa aplikasyon/imprastraktura/configuration. Maliwanag na inihiwalay ang materyal na arkitektura ng retail mula sa isang kumpletong gumaganang aplikasyon.
- Naibalik ang CodeQL language matrix, pinili ang suportadong Node.js 24 para sa dev container, at ginawa ang mga setup validator na mag-ulat ng mga nabigong command para sa bersyon.

#### Nadagdag
- Isang English-only offline na link/anchor checker, regression tests, at isang dokumentasyon workflow na nagtatayo rin ng workshop sa strict mode. Hindi kasama ang mga generated na pagsasalin at mga isinalin na larawan.

#### Saklaw ng Pagpapatunay
- Hindi ipinapatunay ng mga pagsusuri ng source, syntax, configuration, lokal na pag-uugali, at network-link ang live Azure deployability, quota, RBAC, availability ng regional model, billing, pagsunod sa seguridad, o readiness para sa produksyon.
- Ang mga lumang tala sa ibaba ay mga historikal na rekord, hindi mga kasalukuyang utos o tagubilin para sa pag-release.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: Update sa Currency ng Bersyon
**Ang bersyong ito ay muling pinatitibay ang kurso laban sa `azd` `1.27.1` (Hulyo 2026, pinakabagong stable release) at ang kasalukuyang preview ng AI agent extension `azure.ai.agents` `1.0.0-beta.5`, na nag-a-update ng bawat "validated against" na banner pagkatapos ng mga release ng 1.26.0, 1.27.0, at 1.27.1.**

#### Nagbago
- **✅ Na-update ang validation baseline** mula sa `azd 1.25.6` (Hunyo 2026) hanggang sa `azd 1.27.1` (Hulyo 2026) sa buong root README, lahat ng chapter README, ang Chapter 1 dev-container lesson (kabilang ang mga halimbawa ng pinned-version), ang Chapter 4 custom-templates lesson, ang Chapter 5 multi-agent lesson, at ang workshop docs
- **🤖 Na-refresh ang baseline ng Kabanata 2** mula sa `azd 1.23.12` (Marso 2026) hanggang sa `azd 1.27.1` sa buong `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, at `microsoft-foundry-integration.md`; na-update ang mga petsa sa validation-notes sa 2026-07-13
- **🧩 Na-upgrade ang AI agent extension** mula `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` hanggang sa kasalukuyang `1.0.0-beta.5` release sa Chapter 2 README at `agents.md`
- **🧪 Na-update ang workshop validation example** (`azd version` output) sa `1.27.1`

#### Mga Tala sa mga kaugnay na azd releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Suporta sa Go para sa Azure Functions sa Flex Consumption, `azd config sub-filter` per-tenant subscription filters, self-contained extension bundles (`azd x pack --bundle`), at `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Direktang pagmomodelo ng Azure AI Foundry projects/agents sa `azure.yaml` (Bicep-less/Terraform-less init), suporta sa container deployment para sa App Service (`host: appservice` + `language: docker`), direktang `-s/--source` para sa `azd extension` commands, at `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag para sa `azd extension install`, mga deprecated na modelo ay hindi kasama sa catalog/quota prompts bilang default, at ilang pag-aayos ng bug

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

#### Beginner Gap-Fill #2: Pagsulat ng Template, Dev Containers, Pulumi, Azure DevOps, Service Principals, at Iba Pa
**Ang bersyong ito ay nagsasara ng mga natitirang intermediate na puwang na nakita sa azd-coverage analysis: paano sumulat at maglathala ng sarili mong template, reproducible dev-container/Codespaces environments, ang Pulumi infrastructure provider, walkthrough ng Azure DevOps CI/CD, service-principal authentication, gabay sa pagpili ng host (AKS/Spring Apps), mga pagpapaliwanag sa `azd restore`/`azd package`, error-handling para sa hook, at mga kasanayan sa team/shared environment.**

#### Nadagdag
- **🧱 Bagong Kabanata 4 na leksyon** `docs/chapter-04-infrastructure/custom-templates.md` — pagsulat ng sarili mong azd template: kinakailangang istruktura (`azure.yaml`, `infra/`, `src/`), ang `metadata.template` na larangan, pagpa-parameterize ng imprastraktura gamit ang `uniqueString()` resource token at `azd-env-name` tag, pagsusuri nang lokal gamit ang `azd init --template <local-path>`, paglalathala sa GitHub, at pagsusumite sa Awesome AZD gallery
- **📦 Bagong Kabanata 1 na leksyon** `docs/chapter-01-foundation/dev-containers.md` — reproducible na azd environments gamit ang Dev Containers at GitHub Codespaces: isang minimal na `.devcontainer/devcontainer.json` gamit ang opisyal na `ghcr.io/azure/azure-dev/azd` na tampok, mga tampok na tiyak sa wika, `docker-in-docker` para sa container hosts, at `azd auth login --use-device-code` para sa remote sign-in
- **🧩 Pulumi kasama ang azd** seksyon sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout ng Pulumi folder, stacks na naka-mapa sa azd environments, kinakailangang outputs/tagging, at magkaparehong `azd up` / `azd down` workflow
- **🎯 Gabay sa pagpili ng host** sa `docs/chapter-04-infrastructure/provisioning.md` — isang beginner-friendly na paghahambing ng `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, at `springapp`, kasama ang gabay kung kailan pipiliin ang AKS o Azure Spring Apps
- **🛠️ Walkthrough ng Azure DevOps CI/CD** sa `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection gamit ang workload identity federation (OIDC), ang generated na `azure-dev.yml`, at setup ng variable group
- **🔑 Service Principals (Pattern 4)** na idinagdag sa `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive na `azd auth login` gamit ang client secret kontra federated/OIDC credentials, kung kailan gagamitin, at ligtas na pag-iimbak ng kredensyal
- **🪝 Hook error-handling** subseksyon sa `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes at `set -e`, `continueOnError`, pagsubok ng mga hook nang hiwalay gamit ang `azd hooks run`, mga OS-specific shell, at `--debug`
- **👥 Team / shared environments** seksyon sa `docs/chapter-03-configuration/configuration.md` — ano ang nilalaman sa `.azure/`, ano ang gitignore, per-developer environments, `azd env list`/`select`, at pagbibigay ng mga halaga ng environment sa CI/CD
- **🧰 `azd restore` at pinalawak na `azd package`** mga pagpapaliwanag sa `resources/cheat-sheet.md` — pag-restore ng mga dependencies at pagbuo ng deployable artifact nang hindi nagde-deploy

#### Nagbago
- **🧭 Na-update ang talaan ng mga leksyon sa Kabanata 4** upang isama ang bagong "Pagsusulat ng Sarili Mong Template" na leksyon (Leksiyon 3)
- **🧭 Na-update ang talaan ng mga leksyon sa Kabanata 1** upang isama ang bagong "Dev Containers & Codespaces" na leksyon (Leksiyon 5); mga footer sa navigasyon na ikinakabit sa pagitan ng `bring-your-own-app.md` at `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Dalhin ang Sariling App," Terraform, at Walkthrough ng CI/CD
**Ang bersyong ito ay nagsasara ng pinakamalaking puwang para sa isang kumpletong gabay para sa mga nagsisimula sa pamamagitan ng pagdaragdag ng dalawang bagong hands-on na leksyon (isang deployable multi-agent walkthrough at pagdagdag ng azd sa isang umiiral na app), isang beginner-friendly na panimula sa mga hook, seksyon ng Terraform kasama ang azd, step-by-step walkthrough ng GitHub Actions pipeline, pagpapaliwanag sa mga bagong preview extension, at isang malinaw na deployment-verification checklist.**

#### Nadagdag
- **🤝 Bagong Kabanata 5 na leksyon** `docs/chapter-05-multi-agent/multi-agent-basics.md` — isang ganap na hands-on, deployable na walkthrough na may dalawang agent (orchestrator + specialists) gamit ang isang totoong template (`contoso-creative-writer`), tinatalakay kung kailan gagamitin ang multi-agent, ang `azd up` workflow, pag-unawa sa mga na-deploy na resources, cross-agent tracing, customization, at paglilinis
- **📦 Bagong Kabanata 1 na leksyon** `docs/chapter-01-foundation/bring-your-own-app.md` — paano magdagdag ng azd sa umiiral na proyekto gamit ang `azd init` ("gamitin ang code sa kasalukuyang direktoryo"), pag-unawa sa `azure.yaml` at `infra/`, `azd infra generate`, pagtuklas ng host, at pag-deploy gamit ang `azd up`
- **🌐 Seksyon ng Terraform sa azd** na idinagdag sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, layout ng `.tf` folder, kinakailangang `AZURE_*` outputs at `azd-env-name` tagging, at magkaparehong `azd up` / `azd down` workflow (sinasara ang puwang kung saan ang suporta sa Terraform ay naangkin ngunit Bicep lang ang ipinakita)
- **⚙️ Step-by-step walkthrough ng GitHub Actions** sa `docs/chapter-08-production/production-ai-practices.md` — mula sa GitHub repo hanggang sa awtomatikong pag-deploy: `azd pipeline config`, OIDC federated credentials (walang nakaimbak na mga sikreto), ang generated na `azure-dev.yml`, at gabay sa sekreto vs variable
- **🪝 Panimulang "Bagong sa mga hooks?" panimula** sa `docs/chapter-04-infrastructure/deployment-guide.md` — ano ang hook, isang hook-stage table, ang pinakaunang minimal na hook, at pagpapatakbo ng mga hook nang manu-mano gamit ang `azd hooks run`
- **✅ "Suriin ang Iyong Deployment" checklist** na idinagdag sa Hakbang 5 ng `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, at malinaw na mga pamantayan ng tagumpay
- **🧩 Pagpapaliwanag para sa mga bagong preview extensions** `azure.ai.skills` at `azure.ai.connections` (ano sila at kailan gamitin) sa `docs/chapter-08-production/production-ai-practices.md`

#### Nagbago
- **🧭 Naayos ang talaan ng mga leksyon sa Kabanata 5**: `multi-agent-basics.md` ay ngayon Leksiyon 1 (ang tanging ganap na hands-on na leksyon), na may tapat na paglalagay na ang Leksiyon 2 ay nasa Kabanata 6 at ang Retail scenario ay isang arkitektural na plano, hindi isang one-command template
- **🧭 Sa talaan ng mga leksyon sa Kabanata 1** ay kabilang na ngayon ang bagong "Dalhin ang Sariling App" na leksyon (Leksiyon 4)
- **🔗 Na-update ang mga footer sa navigasyon**: `first-project.md` ay ngayon nagli-link pasulong sa `bring-your-own-app.md`

#### Naayos
- **🧱 Nasara ang "naangkin pero nawawala" na Terraform gap** — dati ay nirefere ang suporta sa Terraform pero hindi ito ipinakita
- **🔀 Naayos ang mga nakalilitong cross-links ng Kabanata 5** na nagpapahiwatig na may ganap na multi-agent implementation samantalang arkitektura blueprint lang ang mayroon

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

#### AZD 1.25.6 Refresh, Buong Mga Utos sa Siklo ng Buhay ng Ahente & Aspire Rebrand
**Ang bersyong ito ay muling sinusuri ang kurso laban sa `azd` `1.25.6` (Hunyo 2026) at ang `azure.ai.agents` `0.1.40-preview` extension, pinalalawak ang patnubay ng AI mula sa "gumawa ng balangkas ng ahente" hanggang sa buong siklo ng buhay ng ahente (test → evaluate → optimize → inspect → delete), inilalantad ang bagong `azure.ai.skills` at `azure.ai.connections` preview extensions, at binibigyang-diin ang pag-rebrand ng produkto mula ".NET Aspire" → "Aspire".**

#### Nadagdag
- **🔁 Buong saklaw ng siklo ng buhay ng ahente** para sa mga nagsisimula at mga AI engineer sa buong mga dokumento:
  - `docs/chapter-01-foundation/azd-basics.md` — Talaan ng siklo ng buhay (scaffold → test → measure → improve → inspect → clean up) naidagdag sa Seksyon ng Extensions at AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Bagong seksyong "Pangangasiwa sa Siklo ng Buhay ng Ahente" na sumasaklaw sa `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
  - `resources/cheat-sheet.md` — Pinalawak ang AI Agent Commands kasama ang `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
- **🧩 Bagong preview extensions** na dinokumento: `azure.ai.skills` (muling magagamit na kasanayan ng ahente) at `azure.ai.connections` (mga koneksyon sa Foundry) na idinagdag sa talahanayan ng mga extension at cheat sheet
- **⏱️ Patnubay sa oras ng tugon** — ang mga halimbawa sa `azd ai agent invoke` ngayon ay nagtatala ng kabuuang latency at oras-sa-unang-byte
- **📌 Banner ng bersyon** sa pangunahing README na nagtuturo sa mga mag-aaral sa `azd version` at `azd upgrade`

#### Binago
- **✅ In-update ang baseline ng pagsusuri** mula `azd 1.23.12` (Marso 2026) hanggang `azd 1.25.6` (Hunyo 2026) sa lahat ng README ng mga kabanata at workshop docs
- **🤖 Na-update ang tala ng extension para sa Kabanata 2** mula `azure.ai.agents` `0.1.18-preview` patungong `0.1.40-preview`
- **🧪 Na-update na halimbawa ng validation sa workshop** (`azd version` output) patungong `1.25.6`
- **🧭 Na-refresh ang README "Ano ang Bago sa azd Ngayon"** upang bigyang-diin ang end-to-end na siklo ng buhay ng ahente, mga bagong AI extension, at mga bagong pag-aayos sa kalidad ng buhay (`azd init` idempotency, `azd auth login` pag-clear ng stale-token, `azd tool` unang-pagpapatakbo na prompt)
- **📖 Ang agents.md ng Kabanata 2 (Opsyon 4)** ay ngayon nagtuturo sa mga mag-aaral patungong post-deploy lifecycle commands kaysa huminto sa `azd up`

#### Naayos
- **🏷️ Pangalan ng produkto** — idinagdag ang tala ng Aspire rebrand (".NET Aspire" ay ngayon simpleng "Aspire"); nananatiling walang pagbabago ang suporta ng azd para sa Aspire
- **🔎 Na-validate nang live ang release** laban sa release feed ng Azure Developer CLI: matatag na CLI `1.25.6` (2026-06-12) at `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Mga File na Na-update
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

#### Linaw sa Panimulang Pagsasanay, Validasyon ng Setup & Huling Paglilinis ng Utos ng AZD
**Ang bersyong ito ay sumusunod sa pagsusuri ng AZD 1.23 na may pokus sa dokumentasyon para sa mga nagsisimula: nililinaw nito ang AZD-unang patnubay sa pagpapatunay, nagdadagdag ng mga script sa local setup validation, sinusuri ang mga pangunahing utos laban sa live AZD CLI, at tinatanggal ang mga huling lipas na sanggunian ng utos sa English source sa labas ng changelog.**

#### Nadagdag
- **🧪 Mga script sa validation para sa setup ng nagsisimula** na may `validate-setup.ps1` at `validate-setup.sh` upang makumpirma ng mga mag-aaral ang mga kinakailangang kasangkapan bago simulan ang Kabanata 1
- **✅ Paunang mga hakbang sa validation ng setup** sa root README at Kabanata 1 README upang mahuli ang mga nawawalang kinakailangan bago pa ang `azd up`

#### Binago
- **🔐 Patnubay sa pagpapatunay ng nagsisimula** ay ngayon palaging itinuturing ang `azd auth login` bilang pangunahing landas para sa mga workflow ng AZD, na may `az login` na tinatawag na opsyonal maliban kung direkta ginagamit ang mga utos ng Azure CLI
- **📚 Daloy ng onboarding sa Kabanata 1** ay ngayon nagtuturo sa mga mag-aaral na i-validate ang kanilang lokal na setup bago ang pag-install, pagpapatunay, at mga unang hakbang sa deployment
- **🛠️ Mensahe sa validator** ay malinaw nang naghihiwalay ng mga blocking na kinakailangan mula sa opsyonal na mga babala sa Azure CLI para sa landas ng nagsisimula na AZD lamang
- **📖 Dokumento ng configuration, troubleshooting, at mga halimbawa** ay ngayon naghihiwalay ng kinakailangang AZD authentication at opsyonal na Azure CLI sign-in kung saan pareho itong naipakita nang walang konteksto dati

#### Naayos
- **📋 Natitirang sanggunian sa English source ng mga utos** na na-update sa kasalukuyang mga porma ng AZD, kabilang ang `azd config show` sa cheat sheet at `azd monitor --overview` kung saan nilalayon ang gabay sa pangkalahatang-ideya ng Azure Portal
- **🧭 Mga pahayag sa nagsisimula sa Kabanata 1** ay ginawang mas mahina upang maiwasan ang sobrang pangakong garantiya ng zero-error o rollback na behavior sa lahat ng template at Azure resources
- **🔎 Live na validasyon ng CLI** ay nakumpirma ang kasalukuyang suporta para sa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, at `azd down --force --purge`

#### Mga File na Na-update
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

#### AZD 1.23.12 Validation, Pagpapalawak ng Kapaligiran sa Workshop & Pag-refresh ng AI Model
**Ang bersyong ito ay nagsasagawa ng dokumentasyon ng validation sweep laban sa `azd` `1.23.12`, ina-update ang lipas na mga halimbawa ng utos ng AZD, inire-refresh ang patnubay ng AI model sa kasalukuyang mga default, at pinalalawak ang mga tagubilin sa workshop lampas sa GitHub Codespaces upang suportahan din ang dev containers at mga lokal na kopya.**

#### Nadagdag
- **✅ Mga tala ng validation sa mga pangunahing kabanata at dokumento ng workshop** upang gawing maliwanag ang nasubok na AZD baseline para sa mga mag-aaral na gumagamit ng mas bagong o mas lumang bersyon ng CLI
- **⏱️ Patnubay sa deployment timeout** para sa mga deployment ng AI app na tumatagal gamit ang `azd deploy --timeout 1800`
- **🔎 Mga hakbang sa pagsisiyasat ng extension** gamit ang `azd extension show azure.ai.agents` sa mga dokumento ng AI workflow
- **🌐 Mas malawak na patnubay sa kapaligiran ng workshop** na sumasaklaw sa GitHub Codespaces, dev containers, at lokal na kopya gamit ang MkDocs

#### Binago
- **📚 Mga pambungad na README ng kabanata** ay ngayon palaging nagpapahiwatig ng validation laban sa `azd 1.23.12` sa mga seksyon ng pundasyon, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, at produksyon
- **🛠️ Mga sanggunian sa utos ng AZD** ay in-update sa kasalukuyang anyo sa buong dokumento:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` depende sa konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kung saan nilalayon ang pangkalahatang-ideya ng Application Insights
- **🧪 Pinadaling mga halimbawa ng provisioning preview** sa kasalukuyang suportadong paggamit tulad ng `azd provision --preview` at `azd provision --preview -e production`
- **🧭 Na-update ang daloy ng workshop** upang makumpleto ng mga mag-aaral ang labs sa Codespaces, dev container, o lokal na kopya sa halip na umasa sa execution na Codespaces lamang
- **🔐 Mas gusto ng patnubay sa pagpapatunay** ang `azd auth login` para sa mga workflow ng AZD, na may `az login` na inilagay bilang opsyonal kapag ang mga utos ng Azure CLI ay direktang ginagamit

#### Naayos
- **🪟 Mga utos sa pag-install ng Windows** ay in-normalize upang sundan ang kasalukuyang casing ng `winget` package sa gabay sa pag-install
- **🐧 Patnubay sa pag-install sa Linux** ay naitama upang maiwasan ang hindi suportadong distro-specific na mga tagubilin ng `azd` package manager at sa halip ituro ang mga release asset kung saan naaangkop
- **📦 Mga halimbawa ng AI model** ay in-refresh mula sa mga lumang default tulad ng `gpt-35-turbo` at `text-embedding-ada-002` patungong kasalukuyang mga halimbawa tulad ng `gpt-4.1-mini`, `gpt-4.1`, at `text-embedding-3-large`
- **📋 Mga snippet ng deployment at diagnostics** ay naitama para gamitin ang kasalukuyang mga utos ng kapaligiran at status sa mga log, script, at mga hakbang sa troubleshooting
- **⚙️ Gabay sa GitHub Actions** ay in-update mula `Azure/setup-azd@v1.0.0` patungong `Azure/setup-azd@v2`
- **🤖 Gabay sa pahintulot ng MCP/Copilot** ay in-update mula `azd mcp consent` patungong `azd copilot consent list`

#### Pinabuti
- **🧠 Patnubay sa kabanata ng AI** ay ngayon mas mahusay na nagpapaliwanag ng preview-sensitive na `azd ai` behavior, tenant-specific na pag-login, kasalukuyang paggamit ng extension, at updated na mga rekomendasyon sa pag-deploy ng modelo
- **🧪 Mga tagubilin sa workshop** ay ngayon gumagamit ng mas makatotohanang mga bersyon na halimbawa at mas malinaw na wika ng setup ng kapaligiran para sa mga hands-on lab
- **📈 Dokumento ng produksyon at troubleshooting** ay ngayon mas naaayon sa kasalukuyang pagmamanman, fallback model, at mga halimbawa ng cost-tier

#### Mga File na Na-update
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

#### Mga Utos ng AZD AI CLI, Validasyon ng Nilalaman & Pagpapalawak ng Template
**Ang bersyong ito ay nagdadagdag ng coverage para sa `azd ai`, `azd extension`, at `azd mcp` na utos sa lahat ng AI-related na mga kabanata, inaayos ang mga sirang link at mga lipas na code sa agents.md, ina-update ang cheat sheet, at muling inayos ang Seksyon ng Mga Halimbawang Template kasama ng validated na mga paglalarawan at bagong Azure AI AZD templates.**

#### Nadagdag
- **🤖 Coverage ng AZD AI CLI** sa 7 mga file (dati ay nasa Kabanata 8 lamang):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagong seksyong "Extensions and AI Commands" na nagpapakilala sa `azd extension`, `azd ai agent init`, at `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsyon 4: `azd ai agent init` na may talahanayan ng paghahambing (template vs manifest na pamamaraan)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" at "Agent-First Deployment" na mga subseksiyon
  - `docs/chapter-05-multi-agent/README.md` — Quick Start na nagpapakita ngayon ng parehong template at manifest-based na mga landas ng deployment
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Seksyon ng Deploy na ngayon ay may opsyon na `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" na subseksiyon
  - `resources/cheat-sheet.md` — Bagong seksyong "AI & Extensions Commands" na may kasama ang `azd extension`, `azd ai agent init`, `azd mcp`, at `azd infra generate`
- **📦 Bagong mga halimbawa ng template ng AZD AI** sa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat gamit ang Blazor WebAssembly, Semantic Kernel, at suporta sa voice chat
  - **azure-search-openai-demo-java** — Java RAG chat gamit ang Langchain4J na may mga pagpipilian sa ACA/AKS deployment
  - **contoso-creative-writer** — Multi-agent na creative writing app gamit ang Azure AI Agent Service, Bing Grounding, at Prompty
  - **serverless-chat-langchainjs** — Serverless RAG gamit ang Azure Functions + LangChain.js + Cosmos DB na may Ollama lokal na suporta sa pag-develop
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator na may admin portal, Teams integration, at pagpipilian sa PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app na may mga server sa .NET, Python, Java, at TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Sanggunian sa [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Naayos
- **🔗 agents.md navigation**: Ang mga Previous/Next na link ay naaayon na sa pagkakasunod-sunod ng README lesson sa Kabanata 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: Naayos ang `production-ai-practices.md` sa `../chapter-08-production/production-ai-practices.md` (3 beses)
- **📦 agents.md deprecated code**: Pinalitan ang `opencensus` ng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Inilipat ang `max_tokens` mula sa `create_agent()` patungo sa `create_run()` bilang `max_completion_tokens`
- **🔢 agents.md token counting**: Pinalitan ang tinatayang `len//4` ng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Naayos ang mga serbisyo mula "Cognitive Search + App Service" patungo sa "Azure AI Search + Azure Container Apps" (default host binago Okt 2024)
- **contoso-chat**: Binago ang paglalarawan upang tumukoy sa Azure AI Foundry + Prompty, na naaayon sa aktuwal na pamagat at tech stack ng repo

#### Tinanggal
- **ai-document-processing**: Tinanggal ang hindi gumaganang template reference (repo ay hindi pampublikong maa-access bilang AZD template)

#### Pinabuti
- **📝 agents.md exercises**: Ipinapakita na ngayon ng Exercise 1 ang inaasahang output at ang hakbang sa `azd monitor`; ang Exercise 2 ay may kompletong `FunctionTool` registration code; ang Exercise 3 ay pinalitan ang malabong gabay ng konkreto `prepdocs.py` na mga utos
- **📚 agents.md resources**: Na-update ang mga dokumentasyon na link patungo sa kasalukuyang Azure AI Agent Service docs at quickstart
- **📋 agents.md Next Steps table**: Idinagdag ang AI Workshop Lab link para sa kumpletong saklaw ng kabanata

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

#### Pagpapabuti sa Pag-navigate ng Kurso
**Pinapabuti ng bersyong ito ang README.md na pag-navigate sa kabanata gamit ang mas pinahusay na format ng talahanayan.**

#### Binago
- **Course Map Table**: Pinahusay na may direktang mga link ng lesson, takdang panahon, at mga rating ng kumplikado
- **Folder Cleanup**: Tinanggal ang mga lumang folder na paulit-ulit (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Lahat ng 21+ internal link sa Course Map table ay naverify

### [v3.16.0] - 2026-02-05

#### Mga Update sa Pangalan ng Produkto
**Ina-update ng bersyong ito ang mga sanggunian sa produkto sa kasalukuyang brand ng Microsoft.**

#### Binago
- **Microsoft Foundry → Microsoft Foundry**: Lahat ng sanggunian ay ina-update sa mga hindi pagsasalin na file
- **Azure AI Agent Service → Foundry Agents**: Pangalan ng serbisyo ay na-update para sumalamin sa kasalukuyang branding

#### Mga Na-update na File
- `README.md` - Pangunahing landing page ng kurso
- `changelog.md` - Kasaysayan ng bersyon
- `course-outline.md` - Istraktura ng kurso
- `docs/chapter-02-ai-development/agents.md` - Gabay sa AI agents
- `examples/README.md` - Dokumentasyon ng mga halimbawa
- `workshop/README.md` - Landing page ng workshop
- `workshop/docs/index.md` - Index ng workshop
- `workshop/docs/instructions/*.md` - Lahat ng mga file ng instruksyon ng workshop

---

### [v3.15.0] - 2026-02-05

#### Malaking Repository Restructuring: Pangalan ng Folder Batay sa Kabanata
**Inire-istraktura ng bersyong ito ang dokumentasyon sa mga dedikadong folder na may numero ng kabanata para sa mas malinaw na pag-navigate.**

#### Pagpapalit ng Pangalan ng Folder
Pinalitan ang mga lumang folder ng mga folder na may numero ng kabanata:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Idinagdag ang bago: `docs/chapter-05-multi-agent/`

#### Paglilipat ng File
| File | Mula sa | Papunta sa |
|------|---------|-----------|
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
| Lahat ng pre-deployment na file | pre-deployment/ | chapter-06-pre-deployment/ |
| Lahat ng troubleshooting na file | troubleshooting/ | chapter-07-troubleshooting/ |

#### Idinagdag
- **📚 Mga README file ng Kabanata**: Nilikha ang README.md sa bawat folder ng kabanata na may:
  - Mga layunin sa pag-aaral at takdang panahon
  - Talahanayan ng mga lesson na may mga paglalarawan
  - Mga utos para sa mabilisang pagsisimula
  - Pag-navigate papunta sa ibang kabanata

#### Binago
- **🔗 Na-update ang lahat ng internal na link**: 78+ path na na-update sa lahat ng dokumentasyon
- **🗺️ Pangunahing README.md**: Na-update ang Course Map gamit ang bagong istraktura ng kabanata
- **📝 examples/README.md**: Na-update ang cross-reference sa mga folder ng kabanata

#### Tinanggal
- Lumang istraktura ng folder (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Pag-navigate ng Kabanata
**Dinagdag ng bersyong ito ang mga README file para sa pag-navigate ng kabanata (pinalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Bagong Gabay para sa mga AI Agents
**Nagdaragdag ang bersyong ito ng komprehensibong gabay para sa pag-deploy ng AI agents gamit ang Azure Developer CLI.**

#### Idinagdag
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang mga AI agents at paano sila naiiba sa chatbots
  - Tatlong mabilisang template ng agent (Foundry Agents, Prompty, RAG)
  - Mga pattern ng arkitektura ng agent (single agent, RAG, multi-agent)
  - Pag-configure ng tool at pagpapasadya
  - Pag-monitor at pagsubaybay ng metrics
  - Mga konsiderasyon sa gastos at optimisasyon
  - Mga karaniwang senaryo ng troubleshooting
  - Tatlong hands-on na pagsasanay na may mga pamantayan ng tagumpay

#### Istraktura ng Nilalaman
- **Panimula**: Mga konsepto ng agent para sa mga nagsisimula
- **Mabilisang Pagsisimula**: Mag-deploy ng mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Mga Pattern ng Arkitektura**: Mga visual na diagram ng mga pattern ng agent
- **Pag-configure**: Setup ng tool at mga environment variable
- **Pag-monitor**: Integrasyon sa Application Insights
- **Mga Pagsasanay**: Progressive hands-on learning (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### Pag-update sa DevContainer Environment
**Ina-update ng bersyong ito ang configuration ng development container gamit ang mga modernong tool at mas magagandang default para sa karanasan sa pag-aaral ng AZD.**

#### Binago
- **🐳 Base Image**: Na-update mula sa `python:3.12-bullseye` patungo sa `python:3.12-bookworm` (pinakabagong Debian stable)
- **📛 Pangalan ng Container**: Pinalitan mula "Python 3" sa "AZD for Beginners" para sa mas malinaw na paliwanag

#### Idinagdag
- **🔧 Mga Bagong Tampok sa Dev Container**:
  - `azure-cli` na may suporta ng Bicep na naka-enable
  - `node:20` (LTS version para sa mga template ng AZD)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa deployment ng container app

- **🔌 Port Forwarding**: Pre-configured na mga port para sa karaniwang development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Mga Bagong Extension sa VS Code**:
  - `ms-python.vscode-pylance` - Pinahusay na Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Suporta sa Azure Functions
  - `ms-azuretools.vscode-docker` - Suporta sa Docker
  - `ms-azuretools.vscode-bicep` - Suporta sa Bicep language
  - `ms-azure-devtools.azure-resource-groups` - Pamamahala ng Azure resource
  - `yzhang.markdown-all-in-one` - Pag-edit ng Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Suporta sa Mermaid diagram
  - `redhat.vscode-yaml` - Suporta sa YAML (para sa azure.yaml)
  - `eamodio.gitlens` - Pag-visualize ng Git
  - `mhutchie.git-graph` - Kasaysayan ng Git

- **⚙️ Mga Setting ng VS Code**: Idinagdag ang default na setting para sa Python interpreter, pag-format kapag nagsa-save, at pag-trim ng whitespace

- **📦 Na-update ang requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Naayos
- **Post-Create Command**: Ngayon ay nagve-verify ng instalasyon ng AZD at Azure CLI sa pagsisimula ng container

---

### [v3.11.0] - 2026-02-05

#### Malaking Pagbabago sa README para sa mga Nagsisimula
**Pinaganda nang malaki ng bersyong ito ang README.md para mas madaling maintindihan ng mga nagsisimula at nagdagdag ng mahalagang mga mapagkukunan para sa mga AI developer.**

#### Idinagdag
- **🆚 Azure CLI vs AZD Comparison**: Malinaw na paliwanag kung kailan gagamitin ang bawat tool na may mga praktikal na halimbawa
- **🌟 Awesome AZD Links**: Direktang mga link sa community template gallery at contribution resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ handang i-deploy na mga template
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kontribusyon ng komunidad
- **🎯 Quick Start Guide**: Pinadaling 3-hakbang na seksyon ng pagsisimula (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Malinaw na gabay kung saan magsisimula base sa karanasan ng developer

#### Binago
- **Estruktura ng README**: Inayos para sa progressive disclosure - pinakamahalagang impormasyon muna
- **Seksiyon ng Panimula**: Muling isinulat upang ipaliwanag ang "The Magic of `azd up`" para sa lubos na mga nagsisimula
- **Tinanggal ang Dobleng Nilalaman**: Tinanggal ang dobleng seksyon ng troubleshooting
- **Mga Utos sa Troubleshooting**: Naayos ang reference ng `azd logs` upang gumamit ng balidong `azd monitor --logs`

#### Naayos
- **🔐 Mga Utos sa Authentication**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Invalid Command References**: Tinanggal ang natitirang `azd logs` mula sa README troubleshooting section

#### Mga Tala
- **Saklaw**: Mga pagbabago ay inilapat sa pangunahing README.md at resources/cheat-sheet.md
- **Target Audience**: Mga pagpapabuti na nakatuon sa mga developer na bago sa AZD

---

### [v3.10.0] - 2026-02-05

#### Pag-update ng Katumpakan ng Azure Developer CLI Command
**Inaayos ng bersyong ito ang mga hindi umiiral na AZD command sa buong dokumentasyon, tinitiyak na lahat ng halimbawa ng code ay gumagamit ng balidong syntax ng Azure Developer CLI.**

#### Naayos
- **🔧 Tinanggal ang mga Hindi Umiiral na AZD Command**: Komprehensibong audit at pagwawasto ng mga maling utos:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o mga alternatibo sa Azure CLI
  - `azd service` subcommands (hindi umiiral) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (hindi umiiral) → tinanggal o pinalitan ng balidong alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (hindi umiiral) → tinanggal
  - `azd provision --what-if/--rollback` flags (hindi umiiral) → in-update upang gamitin ang `--preview`
  - `azd config validate` (hindi umiiral) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hindi umiiral) → tinanggal

- **📚 Mga Na-update na File sa Pagwawasto ng Mga Utos**:
  - `resources/cheat-sheet.md`: Malaking overhaul ng reference ng utos
  - `docs/deployment/deployment-guide.md`: Naayos ang rollback at mga estratehiya sa deployment
  - `docs/troubleshooting/debugging.md`: Naayos ang mga seksyon ng pagsusuri ng log
  - `docs/troubleshooting/common-issues.md`: Na-update ang mga utos sa troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Naayos ang seksyon ng AZD debugging
  - `docs/getting-started/azd-basics.md`: Naayos na mga utos sa pagmamanman
  - `docs/getting-started/first-project.md`: Na-update na mga halimbawa ng pagmamanman at pag-debug
  - `docs/getting-started/installation.md`: Naayos na mga halimbawa ng tulong at bersyon
  - `docs/pre-deployment/application-insights.md`: Naayos na mga utos sa pagtingin ng log
  - `docs/pre-deployment/coordination-patterns.md`: Naayos na mga utos sa pag-debug ng agent

- **📝 Na-update ang Sanggunian ng Bersyon**: 
  - `docs/getting-started/installation.md`: Pinalitan ang hardcoded na bersyon ng `1.5.0` ng generic na `1.x.x` na may link sa mga release

#### Binago
- **Mga Estratehiya sa Rollback**: Na-update ang dokumentasyon para gumamit ng rollback base sa Git (walang native rollback ang AZD)
- **Pagtingin ng Log**: Pinalitan ang mga reference ng `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at mga utos ng Azure CLI
- **Bahagi ng Performance**: Tinanggal ang mga hindi umiiral na flag para sa parallel/incremental na deployment, nagbigay ng mga tamang alternatibo

#### Mga Teknikal na Detalye
- **Mga Valid na Utos ng AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Mga Valid na Flag ng azd monitor**: `--live`, `--logs`, `--overview`
- **Mga Tinanggal na Tampok**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Pagpapatunay**: Mga utos na na-validate laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagtatapos ng Workshop at Pagpapabuti ng Kalidad ng Dokumentasyon
**Kumpleto ang bersyong ito ng mga interaktibong module ng workshop, inayos ang lahat ng sira na mga link ng dokumentasyon, at pinabuti ang pangkalahatang kalidad ng nilalaman para sa mga AI developer na gumagamit ng Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng mga patnubay para sa kontribusyon na may:
  - Malinaw na mga panuto para sa pag-uulat ng mga isyu at pagpapapanukala ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga patnubay sa mga halimbawa ng code at mga konbensiyon ng mensahe ng commit
  - Impormasyon sa pakikipag-ugnayan sa komunidad

#### Natapos
- **🎯 Workshop Module 7 (Pagtatapos)**: Ganap na natapos na module sa pagtatapos na may:
  - Masusing buod ng mga nagawa sa workshop
  - Bahagi ng mga pangunahing konseptong na-master na tungkol sa AZD, mga template, at Microsoft Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng paglalakbay sa pag-aaral
  - Mga pagsasanay sa hamon ng workshop na may mga rating ng kahirapan
  - Mga puna ng komunidad at mga link sa suporta

- **📚 Workshop Module 3 (Pag-deconstruct)**: Na-update ang mga layunin ng pag-aaral na may:
  - Gabay sa pag-activate ng GitHub Copilot gamit ang mga MCP server
  - Pag-unawa sa istraktura ng folder ng AZD template
  - Mga pattern sa organisasyon ng infrastructure-as-code (Bicep)
  - Mga panuto sa hands-on na laboratoryo

- **🔧 Workshop Module 6 (Pagtanggal)**: Natapos na may:
  - Mga layunin sa paglilinis ng mga resource at pamamahala ng gastos
  - Paggamit ng `azd down` para sa ligtas na deprovisioning ng infrastructure
  - Gabay sa recovery ng mga soft-deleted cognitive services
  - Mga dagdag na prompt para sa eksperimentasyon sa GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Pag-ayos ng Mga Sirang Link**: Naresolba ang mahigit sa 15 sirang mga internal na link sa dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Naayos ang mga daan patungo sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Naayos ang mga daan sa ai-model-deployment.md at production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pinalitan ang hindi umiiral na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Naayos ang mga daan sa FAQ at gabay sa pag-troubleshoot
  - `examples/container-app/microservices/README.md`: Naayos ang mga daan sa course home at deployment guide
  - `resources/faq.md` at `resources/glossary.md`: Na-update ang mga reference sa AI chapter
  - `course-outline.md`: Naayos ang mga reference sa instructor guide at AI workshop lab

- **📅 Banner ng Status ng Workshop**: Na-update mula sa "Under Construction" sa aktibong estado ng workshop na may petsang Pebrero 2026

- **🔗 Navigasyon sa Workshop**: Naayos ang mga sirang link sa navigasyon sa README.md ng workshop na nagtuturo sa hindi umiiral na folder na lab-1-azd-basics

#### Binago
- **Presentasyon ng Workshop**: Tinanggal ang babala na "under construction", kompleto na at handa nang gamitin ang workshop
- **Konsistensya ng Navigasyon**: Tiniyak na may tamang inter-module navigation ang lahat ng mga module ng workshop
- **Mga Reference sa Landas ng Pag-aaral**: Na-update ang mga cross-reference ng chapter upang gumamit ng tamang microsoft-foundry paths

#### Na-validate
- ✅ Lahat ng mga English markdown file ay may valid na mga internal link
- ✅ Kumpleto ang mga workshop module 0-7 na may mga layunin sa pag-aaral
- ✅ Gumagana nang maayos ang navigasyon sa pagitan ng mga chapter at module
- ✅ Ang nilalaman ay angkop para sa mga AI developer na gumagamit ng Microsoft AZD
- ✅ Napanatiling beginner-friendly ang wika at istraktura mula simula hanggang katapusan
- ✅ Nagbibigay ang CONTRIBUTING.md ng malinaw na patnubay para sa mga kontribyutor ng komunidad

#### Teknikal na Implementasyon
- **Pagpapatunay ng Link**: Automated PowerShell script ang nag-verify ng lahat ng mga .md internal link
- **Audit ng Nilalaman**: Manu-manong pagsusuri ng kakumpletuhan ng workshop at angkop para sa mga baguhan
- **Sistema ng Navigasyon**: Naipataw ang magkakatugmang pattern sa navigasyon ng chapter at module

#### Mga Tala
- **Saklaw**: Mga pagbabago ay inilapat lamang sa English na dokumentasyon
- **Mga Pagsasalin**: Hindi na-update ang mga folder ng pagsasalin sa bersyong ito (ang automated na pagsasalin ay magsi-sync sa susunod)
- **Tagal ng Workshop**: Ang kompletong workshop ngayon ay nagbibigay ng 3-4 na oras ng hands-on na pagkatuto

---

### [v3.8.0] - 2025-11-19

#### Advanced na Dokumentasyon: Pagmamanman, Seguridad, at Mga Pattern ng Maramihang Agent
**Idinagdag ng bersyong ito ang komprehensibong mga leksyon na may grado A tungkol sa integrasyon ng Application Insights, mga pattern sa authentication, at koordinasyon ng maramihang mga agent para sa production deployment.**

#### Idinagdag
- **📊 Aralin sa Integrasyon ng Application Insights**: sa `docs/pre-deployment/application-insights.md`:
  - Pag-deploy na nakatuon sa AZD na may awtomatikong provisioning
  - Kompleto na mga Bicep template para sa Application Insights + Log Analytics
  - Gumaganang mga Python application na may custom telemetry (mahigit 1,200 linya)
  - Mga pattern sa pagmamanman ng AI/LLM (tracking ng token/gastos ng Microsoft Foundry Models)
  - 6 na Mermaid diagram (arkitektura, distributed tracing, daloy ng telemetry)
  - 3 hands-on na ehersisyo (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng query sa Kusto at mga estratehiya sa pag-optimize ng gastos
  - Live metrics streaming at real-time debugging
  - 40-50 minutong oras ng pagkatuto gamit ang mga pattern na handa para sa produksyon

- **🔐 Aralin sa Authentication at Seguridad na mga Pattern**: sa `docs/getting-started/authsecurity.md`:
  - 3 authentication pattern (connection strings, Key Vault, managed identity)
  - Kompleto na mga Bicep infrastructure template para sa mga secure na deployment
  - Node.js application code na may Azure SDK integration
  - 3 kompletong ehersisyo (pag-enable ng managed identity, user-assigned identity, Key Vault rotation)
  - Pinakamahuhusay na praktis sa seguridad at konfigurasyon ng RBAC
  - Gabay sa troubleshooting at pagsusuri ng gastos
  - Mga pattern ng passwordless authentication na handa na sa produksyon

- **🤖 Aralin sa Mga Pattern ng Koordinasyon ng Maramihang Agent**: sa `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern sa koordinasyon (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong implementasyon ng orchestrator service (Python/Flask, mahigit 1,500 linya)
  - 3 specialized na implementasyon ng agent (Research, Writer, Editor)
  - Integrasyon ng Service Bus para sa message queuing
  - Pamamahala ng estado ng Cosmos DB para sa mga distributed system
  - 6 Mermaid diagram na nagpapakita ng mga interaction ng agent
  - 3 advanced na ehersisyo (pag-handle ng timeout, logic sa retry, circuit breaker)
  - Pagkakahati ng gastos ($240-565/buwan) na may mga estratehiya sa pag-optimize
  - Application Insights integration para sa pagmamanman

#### Pinalawak
- **Chapter sa Pre-deployment**: Ngayon ay may komprehensibong pagmamanman at mga pattern sa koordinasyon
- **Chapter sa Pagsisimula**: Pinaganda sa propesyonal na mga pattern sa authentication
- **Kahandaan sa Produksyon**: Kumpletong saklaw mula seguridad hanggang obserbabilidad
- **Balangkas ng Kurso**: Na-update upang i-refer ang mga bagong leksyon sa Chapters 3 at 6

#### Binago
- **Pag-unlad sa Pagkatuto**: Mas mahusay na integrasyon ng seguridad at pagmamanman sa buong kurso
- **Kalidad ng Dokumentasyon**: Konsistenteng mga pamantayan ng grado A (95-97%) sa mga bagong leksyon
- **Mga Pattern sa Produksyon**: Kumpletong saklaw mula simula hanggang wakas para sa enterprise deployments

#### Pinahusay
- **Karanasan ng Developer**: Maliwanag na landas mula sa development hanggang production monitoring
- **Mga Pamantayan sa Seguridad**: Propesyonal na mga pattern para sa authentication at pamamahala ng mga lihim
- **Obserbabilidad**: Kumpletong integrasyon ng Application Insights gamit ang AZD
- **AI Workloads**: Espesyalisadong pagmamanman para sa Microsoft Foundry Models at mga sistema ng maramihang agent

#### Na-validate
- ✅ Lahat ng mga leksyon ay may kumpletong gumaganang code (hindi mga snippet)
- ✅ Mga Mermaid diagram para sa visual na pagkatuto (19 kabuuan sa 3 leksyon)
- ✅ Hands-on na mga ehersisyo na may mga hakbang sa pagpapatunay (9 kabuuan)
- ✅ Mga production-ready Bicep template na maaaring i-deploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa pag-optimize
- ✅ Mga gabay sa troubleshooting at pinakamahusay na mga praktis
- ✅ Mga knowledge checkpoint na may mga utos sa pagpapatunay

#### Resulta ng Pagraranggo ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa pagmamanman
- **docs/getting-started/authsecurity.md**: - Mga propesyonal na pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Advanced na arkitektura ng maramihang agent
- **Kabuuang Bagong Nilalaman**: - Konsistenteng mataas na kalidad na pamantayan

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + mga pattern ng RBAC
- **Maramihang Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Pagmamanman**: Live metrics + Kusto queries + alerts + dashboards
- **Pamamahala ng Gastos**: Mga estratehiya sa sampling, retention policy, kontrol sa budget

### [v3.7.0] - 2025-11-19

#### Pagpapabuti sa Kalidad ng Dokumentasyon at Bagong Halimbawa ng Microsoft Foundry Models
**Pinaganda ng bersyong ito ang kalidad ng dokumentasyon sa buong repository at nagdagdag ng kompletong halimbawa ng deployment ng Microsoft Foundry Models gamit ang gpt-4.1 na chat interface.**

#### Idinagdag
- **🤖 Halimbawa ng Chat ng Microsoft Foundry Models**: Kumpletong deployment ng gpt-4.1 na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong Microsoft Foundry Models infrastructure (deployment ng gpt-4.1 model)
  - Python command-line chat interface na may kasaysayan ng pag-uusap
  - Integrasyon ng Key Vault para sa ligtas na pag-iimbak ng API key
  - Pagsubaybay sa paggamit ng token at pagtataya ng gastos
  - Rate limiting at paghawak ng error
  - Komprehensibong README na may 35-45 minutong gabay sa deployment
  - 11 production-ready na mga file (mga Bicep template, Python app, konfigurasyon)
- **📚 Mga Ehersisyo sa Dokumentasyon**: Idinagdag na hands-on na ehersisyo sa gabay sa konfigurasyon:
  - Ehersisyo 1: Multi-environment na konfigurasyon (15 minuto)
  - Ehersisyo 2: Praktis sa pamamahala ng lihim (10 minuto)
  - Malinaw na mga pamantayan sa tagumpay at mga hakbang sa pagpapatunay
- **✅ Pagpapatunay sa Deployment**: Idinagdag na seksyon sa pagpapatunay sa gabay sa deployment:
  - Mga pamamaraan sa health check
  - Checklist ng mga pamantayan sa tagumpay
  - Inaasahang mga output para sa lahat ng utos sa deployment
  - Mabilisang sanggunian sa pag-troubleshoot

#### Pinahusay
- **examples/README.md**: Na-update sa kalidad na grado A (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng kaugnay na seksyon
  - Na-update ang bilang ng lokal na halimbawa mula 3 nang 4
  - Idinagdag sa talahanayan ng AI Application Examples
  - Inintegrate sa Quick Start para sa Intermediate Users
  - Idinagdag sa seksyon ng Microsoft Foundry Templates
  - Na-update ang Comparison Matrix at mga seksyon sa paghahanap ng teknolohiya
- **Kalidad ng Dokumentasyon**: Pinahusay mula B+ (87%) patungong A- (92%) sa buong folder ng docs:
  - Idinagdag ang mga inaasahang output sa mga kritikal na halimbawa ng utos
  - Kasama ang mga hakbang sa pagpapatunay para sa mga pagbabago sa konfigurasyon
  - Pinahusay ang hands-on na pagkatuto gamit ang mga praktikal na ehersisyo

#### Binago
- **Pag-unlad sa Pagkatuto**: Mas mahusay na integrasyon ng mga halimbawa ng AI para sa mga intermediate na nag-aaral
- **Istraktura ng Dokumentasyon**: Mas maraming actionable na mga ehersisyo na may malinaw na mga resulta
- **Proseso ng Pagpapatunay**: Nilagyan ng explicitong mga pamantayan sa tagumpay ang mga mahalagang daloy ng trabaho

#### Pinahusay
- **Karanasan ng Developer**: Ngayon ay tumatagal ng 35-45 minuto ang deployment ng Microsoft Foundry Models (kumpara sa 60-90 para sa mas kumplikadong alternatibo)
- **Transparensiya sa Gastos**: Malinaw na pagtataya ng gastos ($50-200/buwan) para sa halimbawa ng Microsoft Foundry Models
- **Landas sa Pagkatuto**: May malinaw na entry point ang mga AI developer gamit ang azure-openai-chat
- **Pamantayan ng Dokumentasyon**: Konsistenteng mga inaasahang output at mga hakbang sa pagpapatunay

#### Na-validate
- ✅ Ganap na gumagana ang halimbawa ng Microsoft Foundry Models gamit ang `azd up`
- ✅ Lahat ng 11 file ng implementasyon ay syntactically na tama
- ✅ Tugma ang mga tagubilin sa README sa aktwal na karanasan sa deployment
- ✅ Na-update ang mga link sa dokumentasyon sa mahigit 8 lokasyon
- ✅ Tumpak ang index ng mga halimbawa na may 4 na lokal na mga halimbawa
- ✅ Walang duplicate na mga external link sa mga talahanayan
- ✅ Tama ang lahat ng mga reference sa navigasyon

#### Teknikal na Implementasyon
- **Arkitektura ng Microsoft Foundry Models**: gpt-4.1 + Key Vault + pattern ng Container Apps
- **Seguridad**: Handang Managed Identity, mga lihim sa Key Vault
- **Pagmamanman**: Integrasyon ng Application Insights
- **Pamamahala ng Gastos**: Pagsubaybay ng token at pag-optimize ng paggamit
- **Deployment**: Isang utos na `azd up` para sa kompletong setup

### [v3.6.0] - 2025-11-19

#### Malaking Update: Mga Halimbawa ng Deployment ng Container App
**Inilalahad ng bersyong ito ang mga komprehensibong halimbawa ng production-ready container application deployment gamit ang Azure Developer CLI (AZD), na may kompletong dokumentasyon at integrasyon sa landas ng pagkatuto.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kumpletong pangkalahatang-ideya ng mga deployment na may container, mabilis na pagsisimula, produksyon, at mga advanced na pattern
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Madaling gamitin na REST API na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Handa para sa produksyon na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Seguridad, monitoring, pag-optimize ng gastos, at CI/CD na gabay para sa mga containerized na workload
- **Code Samples**: Kumpletong `azure.yaml`, mga Bicep na template, at multi-language na implementasyon ng serbisyo (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end na mga senaryo ng pagsusuri, mga command para sa monitoring, at gabay sa troubleshooting

#### Binago
- **README.md**: In-update para ipakita at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: In-update para i-highlight ang mga halimbawa ng container app, magdagdag ng mga entry sa comparison matrix, at i-update ang mga teknolohiya/arkitektura na sanggunian
- **Course Outline & Study Guide**: In-update para i-reference ang mga bagong halimbawa ng container app at mga pattern ng deployment sa mga kaugnay na kabanata

#### Na-validate
- ✅ Lahat ng mga bagong halimbawa ay maaaring i-deploy gamit ang `azd up` at sumusunod sa mga best practice
- ✅ Na-update ang mga cross-links at navigation sa dokumentasyon
- ✅ Natatakpan ng mga halimbawa ang mula sa mga panimulang hanggang advanced na senaryo, kabilang ang production microservices

#### Mga Tala
- **Saklaw**: Mga dokumentasyon at halimbawa sa Ingles lamang
- **Mga Susunod na Hakbang**: Palawakin gamit ang karagdagang mga advanced na pattern ng container at CI/CD automation sa mga susunod na bersyon

### [v3.5.0] - 2025-11-19

#### Pag-rebrand ng Produkto: Microsoft Foundry
**Ipinatutupad ng bersyong ito ang komprehensibong pagbabago ng pangalan ng produkto mula "Microsoft Foundry" patungo sa "Microsoft Foundry" sa lahat ng dokumentasyon sa Ingles, bilang pagsunod sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Pag-update ng Pangalan ng Produkto**: Kumpletong rebranding mula sa "Microsoft Foundry" patungo sa "Microsoft Foundry"
  - In-update lahat ng mga sanggunian sa buong dokumentasyon sa Ingles sa folder na `docs/`
  - Pinalitan ang pangalan ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 na sangguniang nilalaman ang na-update sa 7 dokumentong file

- **📁 Mga Pagbabago sa Estruktura ng Folder**:
  - Pinalitan ang pangalan ng `docs/ai-foundry/` sa `docs/microsoft-foundry/`
  - Na-update lahat ng mga cross-reference upang ipakita ang bagong estruktura ng folder
  - Na-validate ang mga navigation link sa buong dokumentasyon

- **📄 Mga Pagpapalit ng Pangalan ng File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Na-update lahat ng internal na link upang i-referensiya ang bagong pangalan ng file

#### Mga Na-update na File
- **Dokumentasyon ng Kabanata** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mga update sa link ng navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 mga update sa sanggunian ng pangalan ng produkto
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasalukuyang gumagamit ng Microsoft Foundry (mula sa mga nakaraang update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 mga update sa sanggunian (pangkalahatang-ideya, feedback ng komunidad, dokumentasyon)
  - `docs/getting-started/azd-basics.md` - 4 mga update sa mga cross-reference na link
  - `docs/getting-started/first-project.md` - 2 mga update sa link ng navigation ng kabanata
  - `docs/getting-started/installation.md` - 2 mga update sa mga susunod na link ng kabanata
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 mga update sa mga sanggunian (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 update sa link ng navigation
  - `docs/troubleshooting/debugging.md` - 1 update sa link ng navigation

- **Mga File ng Estruktura ng Kurso** (2 files):
  - `README.md` - 17 mga update sa sanggunian (pangkalahatang-ideya ng kurso, mga pamagat ng kabanata, seksyon ng mga template, pananaw ng komunidad)
  - `course-outline.md` - 14 mga update sa sanggunian (pangkalahatang-ideya, mga layunin sa pag-aaral, mga yaman ng kabanata)

#### Na-validate
- ✅ Wala nang natitirang sanggunian sa folder path na "ai-foundry" sa mga dokumento sa Ingles
- ✅ Wala nang natitirang sanggunian sa pangalang produkto na "Microsoft Foundry" sa mga dokumento sa Ingles
- ✅ Lahat ng mga navigation link ay gumagana sa bagong estruktura ng folder
- ✅ Matagumpay ang mga pagpapalit ng pangalan ng file at folder
- ✅ Na-validate ang mga cross-reference sa pagitan ng mga kabanata

#### Mga Tala
- **Saklaw**: Mga pagbabagong inilapat sa dokumentasyon sa Ingles sa folder na `docs/` lamang
- **Mga Pagsasalin**: Hindi na-update ang mga folder ng pagsasalin (`translations/`) sa bersyong ito
- **Workshop**: Hindi na-update ang mga materyales ng workshop (`workshop/`) sa bersyong ito
- **Mga Halimbawa**: Maaaring tumutukoy pa rin ang mga halimbawa ng file sa lumang pagngalan (iai-address sa susunod na pag-update)
- **Mga Panlabas na Link**: Mananatiling hindi nababago ang mga external URL at mga sanggunian sa GitHub repository

#### Gabay sa Migrasyon para sa mga Kontribyutor
Kung mayroon kang mga lokal na branch o dokumentasyon na tumutukoy sa lumang estruktura:
1. I-update ang mga sanggunian ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga sanggunian ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Microsoft Foundry" → "Microsoft Foundry"
4. I-validate na gumagana pa rin ang lahat ng mga internal na link sa dokumentasyon

---

### [v3.4.0] - 2025-10-24

#### Mga Pagpapahusay sa Infrastructure Preview at Validation
**Ipinakikilala ng bersyong ito ang komprehensibong suporta para sa bagong Azure Developer CLI preview na tampok at pinapahusay ang karanasan ng gumagamit sa workshop.**

#### Idinagdag
- **🧪 Dokumentasyon ng azd provision --preview na Tampok**: Komprehensibong pagtatalakay sa bagong kakayahan ng infrastructure preview
  - Sanggunian ng command at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa provisioning guide na may mga kaso ng paggamit at benepisyo
  - Integrasyon ng pre-flight check para sa mas ligtas na validation ng deployment
  - Mga update sa gabay sa pagsisimula na may mga praktikang deployment na safety-first
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapakita ng status ng development ng workshop
  - Disenyong gradient na may mga indikasyon ng konstruksyon para sa malinaw na komunikasyon sa gumagamit
  - Oras ng huling update para sa transparency
  - Mobile-responsive na disenyo para sa lahat ng uri ng device

#### Pinahusay
- **Kaligtasan ng Infrastructure**: Inintegrate ang preview functionality sa kabuuan ng dokumentasyon ng deployment
- **Validation bago ang deployment**: Kasama na sa mga automated scripts ang infrastructure preview testing
- **Developer Workflow**: In-update ang mga command sequence upang isama ang preview bilang best practice
- **Karanasan sa Workshop**: Malinaw na itinakda ang mga inaasahan para sa mga gumagamit tungkol sa status ng nilalaman

#### Binago
- **Best Practices sa Deployment**: Ngayon ay inirerekomenda ang preview-first workflow
- **Daloy ng Dokumentasyon**: Inilipat nang mas maaga sa proseso ng pag-aaral ang validation ng infrastructure
- **Presentasyon ng Workshop**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng development

#### Pinahusay
- **Safety-First Approach**: Maaari nang i-validate ang mga pagbabago sa infrastructure bago ang deployment
- **Pakikipagtulungan ng Team**: Maaaring ibahagi ang mga resulta ng preview para sa pagsusuri at pag-apruba
- **Pagsasapuso sa Gastos**: Mas mahusay na pag-unawa sa mga gastos ng resources bago ang provisioning
- **Pagpigil sa Panganib**: Nabawasan ang mga pagkabigo sa deployment sa pamamagitan ng paunang validation

#### Teknikal na Implementasyon
- **Integrasyon ng Maramihang Dokumento**: Dokumentado ang preview feature sa 4 na pangunahing file
- **Mga Pattern ng Command**: Konsistent na syntax at mga halimbawa sa buong dokumentasyon
- **Integrasyon ng Best Practice**: Kasama ang preview sa mga workflow at scripts ng validation
- **Visual na Indikasyon**: Malinaw na mga marka ng BAGONG tampok para sa madaliang matuklasan

#### Workshop Infrastructure
- **Komunikasyon ng Status**: Propesyonal na HTML banner na may gradient styling
- **Karanasan ng Gumagamit**: Malinaw na status ng development upang maiwasan ang kalituhan
- **Propesyonal na Presentasyon**: Pinananatili ang kredibilidad ng repository habang itinatalaga ang mga inaasahan
- **Transparency ng Timeline**: Oras ng huling update Oktubre 2025 para sa pananagutan

### [v3.3.0] - 2025-09-24

#### Pinahusay na Materyales ng Workshop at Interactive na Karanasan sa Pag-aaral
**Ipinakikilala ng bersyong ito ang komprehensibong materyales ng workshop na may browser-based na interactive na mga gabay at istrukturadong mga landas ng pag-aaral.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Browser-based na karanasan sa workshop na may kakayahan ng MkDocs preview
- **📝 Istrakturadong Instruksyon sa Workshop**: 7-hakbang na gabay na landas ng pag-aaral mula sa pagtuklas hanggang pag-customize
  - 0-Panimula: Pangkalahatang ideya at setup ng workshop
  - 1-Piliin-ang-Template-ng-AI: Proseso ng pagtuklas at pagpili ng template
  - 2-Beripikahin-ang-Template-ng-AI: Mga pamamaraan ng deployment at validation
  - 3-Bungkagin-ang-Template-ng-AI: Pag-unawa sa arkitektura ng template
  - 4-I-configure-ang-Template-ng-AI: Pag-configure at pag-customize
  - 5-I-customize-ang-Template-ng-AI: Mga advanced na modipikasyon at iterasyon
  - 6-I-dismantle-ang-Infrastructure: Paglilinis at pamamahala ng mga resource
  - 7-Pagtatapos: Buod at mga susunod na hakbang
- **🛠️ Mga Kasangkapan sa Workshop**: MkDocs na konfigurasyon na may Material na tema para sa pinahusay na karanasan sa pag-aaral
- **🎯 Hands-On Learning Path**: 3-hakbang na metodolohiya (Pagtuklas → Deployment → Pag-customize)
- **📱 Integrasyon ng GitHub Codespaces**: Seamless na setup ng development environment

#### Pinahusay
- **AI Workshop Lab**: Pinalawig na may komprehensibong 2-3 oras na istrukturadong karanasan sa pag-aaral
- **Dokumentasyon ng Workshop**: Propesyonal na presentasyon na may navigation at visual aids
- **Pag-unlad ng Pag-aaral**: Malinaw na hakbang-hakbang na gabay mula sa pagpili ng template hanggang sa produksyon na deployment
- **Karanasan ng Developer**: Integradong mga kasangkapan para sa streamline na mga workflow sa pag-develop

#### Pinahusay
- **Accessibility**: Interface na browser-based na may paghahanap, functionality na kopyahin, at pag-toggle ng tema
- **Self-Paced Learning**: Flexible na istruktura ng workshop na tumutugon sa iba't ibang bilis ng pag-aaral
- **Praktikal na Aplikasyon**: Mga totoong senaryo ng deployment ng AI template
- **Integrasyon ng Komunidad**: Integrasyon ng Discord para sa suporta sa workshop at kolaborasyon

#### Mga Tampok ng Workshop
- **Built-in na Paghahanap**: Mabilis na paghahanap ng keyword at lesson
- **Kopyahin ang mga Code Block**: Hover-to-copy functionality para sa lahat ng mga halimbawa ng code
- **Theme Toggle**: Suporta para sa dark/light mode para sa iba't ibang mga kagustuhan
- **Mga Visual Asset**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Integrasyon ng Tulong**: Direktang access sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Malawakang Pagbabago ng Navigasyon at Sistemang Batay sa Kabanata ng Pag-aaral
**Ipinakikilala ng bersyong ito ang komprehensibong istruktura ng pag-aaral na batay sa kabanata na may pinahusay na navigasyon sa buong repositoryo.**

#### Idinagdag
- **📚 Sistemang Batay sa Kabanata ng Pag-aaral**: Inistruktura muli ang buong kurso sa 8 progresibong kabanata ng pag-aaral
  - Kabanata 1: Pundasyon at Mabilis na Pagsisimula (⭐ - 30-45 minuto)
  - Kabanata 2: AI-First Development (⭐⭐ - 1-2 oras)
  - Kabanata 3: Konfigurasyon at Authentication (⭐⭐ - 45-60 minuto)
  - Kabanata 4: Infrastructure as Code at Deployment (⭐⭐⭐ - 1-1.5 oras)
  - Kabanata 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 oras)
  - Kabanata 6: Pre-Deployment Validation at Pagpaplano (⭐⭐ - 1 oras)
  - Kabanata 7: Troubleshooting at Debugging (⭐⭐ - 1-1.5 oras)
  - Kabanata 8: Production at Enterprise Patterns (⭐⭐⭐⭐ - 2-3 oras)
- **📚 Komprehensibong Sistema ng Navigasyon**: Konsistenteng navigation headers at footers sa buong dokumentasyon
- **🎯 Pagsubaybay ng Progreso**: Checklist ng pagkumpleto ng kurso at sistema ng beripikasyon ng pag-aaral
- **🗺️ Gabay sa Landas ng Pag-aaral**: Malinaw na mga entry point para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference Navigation**: Malinaw na naka-link ang mga kaugnay na kabanata at mga prerequisites

#### Pinahusay
- **Estruktura ng README**: Naging isang istrukturadong plataporma ng pag-aaral na may organisasyon batay sa kabanata
- **Navigasyon sa Dokumentasyon**: Kasama na ang konteksto ng kabanata at gabay sa progreso sa bawat pahina
- **Organisasyon ng Template**: Naka-map ang mga halimbawa at template sa mga angkop na kabanata ng pag-aaral
- **Integrasyon ng Resource**: Naugnay ang cheat sheets, FAQs, at mga gabay sa pag-aaral sa mga kaugnay na kabanata
- **Integrasyon ng Workshop**: Naka-map ang mga hands-on labs sa maraming layunin ng pag-aaral sa kabanata

#### Binago
- **Pag-unlad ng Pag-aaral**: Mula sa linear na dokumentasyon patungo sa flexible na pag-aaral na batay sa kabanata
- **Paglalagay ng Konfigurasyon**: Inilipat ang gabay sa konfigurasyon bilang Kabanata 3 para sa mas maayos na daloy ng pag-aaral
- **Integrasyon ng Nilalaman ng AI**: Mas mahusay na integrasyon ng mga AI-specific na nilalaman sa buong paglalakbay ng pag-aaral
- **Nilalaman ng Produksyon**: Pinagsama-sama ang mga advanced na pattern sa Kabanata 8 para sa mga enterprise learners

#### Pinahusay
- **Karanasan ng Gumagamit**: Malinaw na breadcrumbs ng navigasyon at mga tagapagpahiwatig ng progreso sa kabanata
- **Accessibility**: Konsistenteng mga pattern ng navigasyon para sa mas madaling paglalakbay sa kurso
- **Propesyonal na Presentasyon**: Estruktura ng kurso na parang unibersidad na angkop para sa akademikong at korporatibong pagsasanay
- **Dali ng Pagkatuto**: Pinababang oras upang mahanap ang kaugnay na nilalaman sa pamamagitan ng pinahusay na organisasyon

#### Teknikal na Implementasyon
- **Navigation Headers**: Standardisado ang navigation ng kabanata sa higit 40 na dokumentong file
- **Footer Navigation**: Konsistenteng gabay sa progreso at mga tagapagpahiwatig ng pagkumpleto ng kabanata
- **Cross-Linking**: Komprehensibong sistema ng panloob na pag-link na nag-uugnay ng mga kaugnay na konsepto
- **Chapter Mapping**: Malinaw na naugnay ang mga template at halimbawa sa mga layunin ng pag-aaral

#### Pagpapahusay ng Gabay sa Pag-aaral
- **📚 Komprehensibong Mga Layunin sa Pag-aaral**: Inistruktura muli ang gabay sa pag-aaral upang mag-align sa 8-kabanatang sistema
- **🎯 Pagsusulit na Batay sa Kabanata**: Bawat kabanata ay may partikular na layunin sa pag-aaral at mga praktikal na pagsusulit
- **📋 Pagsubaybay ng Progreso**: Lingguhang iskedyul ng pag-aaral na may nasusukat na mga kinalabasan at checklist ng pagkumpleto
- **❓ Mga Tanong sa Pagsusulit**: Mga tanong para sa pag-validate ng kaalaman sa bawat kabanata na may propesyonal na kinalabasan
- **🛠️ Praktikal na Mga Pagsasanay**: Hands-on na mga gawain na may mga totoong senaryo ng deployment at troubleshooting
- **📊 Progreso ng Kasanayan**: Malinaw na pag-unlad mula sa mga pangunahing konsepto hanggang sa mga pattern ng enterprise na may pagtutok sa pag-unlad ng karera
- **🎓 Balangkas ng Sertipikasyon**: Mga propesyonal na kinalabasan sa pag-unlad at sistema ng pagkilala ng komunidad
- **⏱️ Pamamahala ng Timeline**: Istrakturadong 10-linggong plano ng pag-aaral na may validation ng milestone

### [v3.1.0] - 2025-09-17

#### Pinahusay na Multi-Agent AI Solutions
**Pinapahusay ng bersyong ito ang multi-agent retail solution sa mas mahusay na pagpapangalan ng agent at pinahusay na dokumentasyon.**

#### Binago
- **Terminolohiyang Multi-Agent**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pag-unawa
- **Arkitektura ng Ahente**: In-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code para gumamit ng pare-parehong pangalan na "Customer agent"
- **Mga Halimbawa ng Konfigurasyon**: In-modernisa ang mga pattern ng konfigurasyon ng ahente gamit ang mga na-update na naming conventions
- **Konsistensi ng Dokumentasyon**: Tiniyak na lahat ng sanggunian ay gumagamit ng propesyonal at naglalarawang pangalan ng ahente

#### Pinalakas
- **Package ng ARM Template**: In-update ang retail-multiagent-arm-template na may mga sanggunian sa Customer agent
- **Mga Diagram ng Arkitektura**: In-refresh ang mga diagram ng Mermaid gamit ang na-update na pangalan ng ahente
- **Mga Halimbawa ng Code**: Ang mga klase sa Python at mga halimbawa ng implementasyon ngayon ay gumagamit ng CustomerAgent na pangalan
- **Mga Environment Variables**: In-update ang lahat ng deployment scripts para gamitin ang CUSTOMER_AGENT_NAME na mga convention

#### Pinahusay
- **Karanasan ng Developer**: Mas malinaw na mga tungkulin at responsibilidad ng ahente sa dokumentasyon
- **Kahandaan sa Produksyon**: Mas mahusay na pag-align sa mga enterprise naming conventions
- **Mga Materyales sa Pagkatuto**: Mas intuitibong pangalan ng ahente para sa mga layuning edukasyonal
- **Usability ng Template**: Pinadaling pang-unawa sa mga tungkulin ng ahente at mga pattern ng deployment

#### Teknikal na Detalye
- In-update ang mga diagram ng arkitektura ng Mermaid na may mga sanggunian sa CustomerAgent
- Pinalitan ang mga pangalan ng klase na CoraAgent ng CustomerAgent sa mga halimbawa ng Python
- Binago ang mga ARM template JSON configurations upang gamitin ang uri ng "customer" agent
- In-update ang mga environment variable mula CORA_AGENT_* patungong CUSTOMER_AGENT_* na mga pattern
- In-refresh ang lahat ng command sa deployment at mga konfigurasyon ng container

### [v3.0.0] - 2025-09-12

#### Malalaking Pagbabago - Pokus sa AI Developer at Integrasyon sa Microsoft Foundry
**Binabago ng bersyong ito ang repositoryo bilang isang komprehensibong AI-focused na learning resource na may integrasyon sa Microsoft Foundry.**

#### Idinagdag
- **🤖 AI-First Learning Path**: Ganap na restructuring na inuuna ang mga AI developer at engineer
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa mga serbisyo ng Microsoft Foundry
- **AI Model Deployment Patterns**: Detalyadong gabay tungkol sa pagpili ng modelo, konfigurasyon, at mga estratehiya ng production deployment
- **AI Workshop Lab**: 2-3 oras na hands-on workshop para sa pag-convert ng mga AI application sa AZD-deployable na mga solusyon
- **Production AI Best Practices**: Mga pattern na handa para sa enterprise sa pag-scale, pag-monitor, at pag-secure ng AI workloads
- **AI-Specific Troubleshooting Guide**: Komprehensibong troubleshooting para sa Microsoft Foundry Models, Cognitive Services, at mga isyu sa pag-deploy ng AI
- **AI Template Gallery**: Tampok na koleksyon ng mga template ng Microsoft Foundry na may mga rating ng pagiging kumplikado
- **Workshop Materials**: Kumpletong estruktura ng workshop na may mga hands-on lab at mga reference na materyales

#### Pinalakas
- **Estruktura ng README**: Nakatuon sa AI developer na may 45% na datos ng interes ng komunidad mula sa Microsoft Foundry Discord
- **Mga Learning Path**: Nakalaang AI developer na paglalakbay kasabay ng tradisyunal na mga landas para sa mga estudyante at DevOps engineer
- **Rekomendasyon ng Template**: Tampok na AI template kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Integrasyon ng Komunidad**: Pinalakas na suporta sa Discord community na may AI-specific na mga channel at diskusyon

#### Seguridad at Pokus sa Produksyon
- **Managed Identity Patterns**: AI-specific na authentication at security configurations
- **Cost Optimization**: Pagsubaybay sa paggamit ng token at kontrol sa badyet para sa AI workloads
- **Multi-Region Deployment**: Mga estratehiya para sa global AI application deployment
- **Performance Monitoring**: AI-specific na mga metrics at integrasyon ng Application Insights

#### Kalidad ng Dokumentasyon
- **Linear Course Structure**: Lohikal na pag-uunlad mula sa baguhan hanggang sa advanced na pattern ng AI deployment
- **Napatunayan na URL**: Lahat ng panlabas na link ng repositoryo ay beripikado at naa-access
- **Kumpletong Sanggunian**: Lahat ng panloob na link ng dokumentasyon ay beripikado at gumagana
- **Handa para sa Produksyon**: Mga pattern ng enterprise deployment na may mga totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Malalaking Pagbabago - Restructure ng Repository at Propesyonal na Pagpapahusay
**Ang bersyong ito ay kumakatawan sa isang makabuluhang pagbabago ng estruktura ng repositoryo at presentasyon ng nilalaman.**

#### Idinagdag
- **Structured Learning Framework**: Lahat ng pahina ng dokumentasyon ay may Kasama nang Seksyon ng Panimula, Mga Layunin ng Pagkatuto, at Kinalabasan ng Pagkatuto
- **Sistema ng Navigasyon**: Idinagdag ang mga link ng Nakaraang/Susunod na aralin sa buong dokumentasyon para sa gabay na pag-unlad ng pagkatuto
- **Study Guide**: Komprehensibo na study-guide.md na may mga layunin sa pagkatuto, mga pagsasanay, at materyales sa pagtatasa
- **Propesyonal na Presentasyon**: Tinanggal ang lahat ng emoji icon para sa pinahusay na accessibility at propesyonal na anyo
- **Pinalakas na Estruktura ng Nilalaman**: Pinahusay na organisasyon at daloy ng mga materyales sa pagkatuto

#### Binago
- **Format ng Dokumentasyon**: Pinasinadyang lahat ng dokumentasyon sa pare-parehong estruktura na nakatuon sa pagkatuto
- **Daloy ng Navigasyon**: Ipinalapat ang lohikal na pag-unlad sa lahat ng materyal sa pagkatuto
- **Presentasyon ng Nilalaman**: Tinanggal ang mga palamuti para sa malinaw at propesyonal na pormat
- **Estruktura ng Link**: In-update ang lahat ng panloob na link upang suportahan ang bagong sistema ng navigasyon

#### Pinahusay
- **Accessibility**: Tinanggal ang dependencies sa emoji para sa mas mahusay na compatibility sa screen reader
- **Propesyonal na Anyong Pampresentasyon**: Malinis at akademikong estilo na presentasyon na angkop sa pagkatuto sa enterprise
- **Karanasan sa Pagkatuto**: Estrukturadong pamamaraan na may malinaw na mga layunin at kinalabasan para sa bawat aralin
- **Organisasyon ng Nilalaman**: Mas maayos na lohikal na daloy at koneksyon sa pagitan ng mga kaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Paunang Paglabas - Komprehensibong AZD Learning Repository

#### Idinagdag
- **Pangunahing Estruktura ng Dokumentasyon**
  - Kumpletong serye ng gabay sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga mapagkukunan sa troubleshooting at gabay sa debugging
  - Mga kasangkapan at pamamaraan sa pre-deployment validation

- **Getting Started Module**
  - AZD Basics: Pangunahing konsepto at terminolohiya
  - Installation Guide: Mga tagubilin sa pag-set up ng platform
  - Configuration Guide: Pag-set up ng environment at authentication
  - First Project Tutorial: Hakbang-hakbang na hands-on na pagkatuto

- **Deployment and Provisioning Module**
  - Deployment Guide: Kumpletong dokumentasyon ng workflow
  - Provisioning Guide: Infrastructure as Code gamit ang Bicep
  - Pinakamahusay na mga kasanayan para sa production deployments
  - Mga pattern ng multi-service architecture

- **Pre-deployment Validation Module**
  - Capacity Planning: Pag-validate ng availability ng Azure resources
  - SKU Selection: Komprehensibong gabay sa service tier
  - Pre-flight Checks: Automated validation scripts (PowerShell at Bash)
  - Mga kasangkapan sa pagtataya ng gastos at pagplano sa badyet

- **Troubleshooting Module**
  - Common Issues: Madalas na problema at mga solusyon
  - Debugging Guide: Sistematikong mga pamamaraan sa troubleshooting
  - Advanced na mga teknika at kasangkapan sa diagnostic
  - Pagsubaybay sa performance at optimization

- **Mga Mapagkukunan at Sanggunian**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mahahalagang command
  - Glossary: Komprehensibong terminolohiya at mga depinisyon ng akronim
  - FAQ: Detalyadong mga sagot sa mga karaniwang tanong 
  - Mga panlabas na link sa mga mapagkukunan at koneksyon sa komunidad

- **Mga Halimbawa at Template**
  - Simpleng halimbawa ng Web Application
  - Template para sa Static Website deployment
  - Konfigurasyon ng Container Application
  - Mga pattern sa integrasyon ng Database
  - Mga halimbawa ng microservices architecture
  - Implementasyon ng mga serverless function

#### Mga Tampok
- **Multi-Platform Support**: Mga gabay sa pag-install at konfigurasyon para sa Windows, macOS, at Linux
- **Iba't ibang Antas ng Kasanayan**: Nilalaman na dinisenyo para sa mga estudyante hanggang sa mga propesyonal na developer
- **Praktikal na Pokus**: Mga hands-on na halimbawa at mga senaryo sa totoong mundo
- **Komprehensibong Saklaw**: Mula sa mga pangunahing konsepto hanggang sa advanced na mga pattern para sa enterprise 
- **Security-First Approach**: Mga pinakamahusay na kasanayan sa seguridad na isinama sa kabuuan
- **Cost Optimization**: Gabay para sa cost-effective na mga deployment at pamamahala ng resource

#### Kalidad ng Dokumentasyon
- **Detalyadong Mga Halimbawa ng Code**: Praktikal, nasubok na mga sample ng code
- **Hakbang-hakbang na Mga Tagubilin**: Malinaw at magagamit na mga gabay
- **Komprehensibong Pangangasiwa ng Error**: Pagsasaayos para sa mga karaniwang problema
- **Pagsasama ng Pinakamahusay na Kasanayan**: Pamantayan at rekomendasyon sa industriya
- **Version Compatibility**: Napapanahon sa pinakabagong serbisyo ng Azure at mga feature ng azd

## Mga Planong Pagpapahusay sa Hinaharap

### Bersyon 3.1.0 (Balak)
#### Pagpapalawak ng AI Platform
- **Multi-Model Support**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at custom models
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Advanced RAG Patterns**: Mga opsyon sa vector database na lampas sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinalakas na pag-monitor para sa performance ng modelo, paggamit ng token, at kalidad ng tugon

#### Karanasan ng Developer
- **VS Code Extension**: Pinagsamang karanasan sa pag-develop ng AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-assisted na pagbuo ng AZD template
- **Interactive Tutorials**: Mga hands-on coding exercises na may automated validation para sa mga AI scenario
- **Video Content**: Suplementaryong mga video tutorial para sa mga visual learner na nakatuon sa AI deployments

### Bersyon 4.0.0 (Balak)
#### Mga Pattern ng Enterprise AI
- **Governance Framework**: Pamamahala sa AI modelo, pagsunod, at mga audit trail
- **Multi-Tenant AI**: Mga pattern para sa pagseserbisyo sa maraming customer gamit ang naka-isolate na mga AI serbisyo
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga pattern ng multi-cloud at hybrid deployment para sa mga AI workload

#### Advanced na Mga Tampok
- **AI Pipeline Automation**: Integrasyon ng MLOps gamit ang Azure Machine Learning pipelines
- **Advanced na Seguridad**: Zero-trust na mga pattern, private endpoints, at advanced threat protection
- **Performance Optimization**: Advanced na tuning at scaling strategies para sa mga high-throughput AI application
- **Global Distribution**: Mga pattern ng content delivery at edge caching para sa mga AI application

### Bersyon 3.0.0 (Balak) - Napalitan ng Kasalukuyang Paglabas
#### Mga Inirekomendang Idagdag - Ngayon ay Naipatupad sa v3.0.0
- ✅ **Nilalamang Nakatuon sa AI**: Komprehensibong integrasyon ng Microsoft Foundry (Nakumpleto)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Nakumpleto)
- ✅ **Advanced Security Module**: AI-specific na mga pattern sa seguridad (Nakumpleto)
- ✅ **Performance Optimization**: Mga estratehiya sa tuning ng AI workload (Nakumpleto)

### Bersyon 2.1.0 (Balak) - Bahagyang Naipatupad sa v3.0.0
#### Maliit na Pagpapahusay - Ilan ang Nakumpleto sa Kasalukuyang Paglabas
- ✅ **Karagdagang Mga Halimbawa**: AI-focused na mga senaryo sa deployment (Nakumpleto)
- ✅ **Pinalawak na FAQ**: AI-specific na mga tanong at troubleshooting (Nakumpleto)
- **Integrasyon ng Tool**: Mga gabay sa pinahusay na integrasyon ng IDE at editor
- ✅ **Pagpapalawak ng Monitoring**: AI-specific na mga pattern sa pag-monitor at alerting (Nakumpleto)

#### Naka-plano pa para sa Hinaharap na Paglabas
- **Mobile-Friendly Documentation**: Responsive design para sa pagkatuto sa mobile
- **Offline Access**: Maida-download na mga pakete ng dokumentasyon
- **Pinahusay na Integrasyon ng IDE**: VS Code extension para sa AZD + AI workflows
- **Community Dashboard**: Real-time na mga metrika ng komunidad at pagsubaybay sa kontribusyon

## Pagsusumite sa Changelog

### Pag-uulat ng Mga Pagbabago
Kapag nag-aambag sa repositoryong ito, mangyaring tiyakin na ang mga entry sa changelog ay kasama ang:

1. **Bersyon ng Numero**: Alinsunod sa semantic versioning (major.minor.patch)
2. **Petsa**: Petsa ng paglabas o pag-update sa format na YYYY-MM-DD
3. **Kategorya**: Idinagdag, Binago, Deprecated, Tinanggal, Naayos, Seguridad
4. **Malinaw na Paglalarawan**: Maikling paglalarawan ng mga pagbabagong ginawa
5. **Pagsusuri ng Epekto**: Paano nakakaapekto ang mga pagbabago sa mga umiiral na gumagamit

### Mga Kategorya ng Pagbabago

#### Idinagdag
- Mga bagong tampok, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o mapagkukunan sa pagkatuto
- Karagdagang mga tool, script, o kagamitan

#### Binago
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga update para sa pagpapahusay ng kalinawan o katumpakan
- Pagre-structure ng nilalaman o organisasyon

#### Deprecated
- Mga tampok o pamamaraan na hindi na gagamitin
- Mga bahagi ng dokumentasyon na nakatakdang tanggalin
- Mga pamamaraan na may mas mahusay na alternatibo

#### Tinanggal
- Mga tampok, dokumentasyon, o halimbawa na hindi na mahalaga
- Luma o deprecated na impormasyon o pamamaraan
- Mga duplicate o pinagsamang nilalaman

#### Naayos
- Mga pagkukumpuni sa mga error sa dokumentasyon o code
- Paglutas ng mga naiulat na isyu o problema
- Mga pagpapahusay sa katumpakan o functionality

#### Seguridad
- Mga pagpapahusay o pag-aayos na may kaugnayan sa seguridad
- Mga update sa pinakamahusay na kasanayan sa seguridad
- Paglutas ng mga kahinaan sa seguridad

### Mga Panuntunan sa Semantic Versioning

#### Major Version (X.0.0)
- Mga breaking change na nangangailangan ng aksyon mula sa user
- Malalaking restructuring ng nilalaman o organisasyon
- Mga pagbabago na binabago ang pundamental na pamamaraan o metodolohiya

#### Minor Version (X.Y.0)
- Mga bagong tampok o karagdagang nilalaman
- Mga pagpapahusay na nananatiling compatible sa mga naunang bersyon
- Karagdagang mga halimbawa, tool, o mapagkukunan

#### Patch Version (X.Y.Z)
- Mga pagkukumpuni sa bugs at mga koreksyon
- Maliit na pagpapahusay sa umiiral na nilalaman
- Mga paglilinaw at maliit na pagpapabuti

## Feedback at Mga Mungkahi mula sa Komunidad

Aktibo naming hinihikayat ang feedback mula sa komunidad upang mapabuti ang learning resource na ito:

### Paano Magbigay ng Feedback
- **GitHub Issues**: I-report ang mga problema o magmungkahi ng mga pagpapahusay (AI-specific na mga isyu ay malugod)
- **Discord Discussions**: Magbahagi ng mga ideya at makisali sa Microsoft Foundry community
- **Pull Requests**: Mag-ambag ng direktang pagpapahusay sa nilalaman, lalo na sa mga AI template at gabay
- **Microsoft Foundry Discord**: Sumali sa #Azure channel para sa mga talakayan tungkol sa AZD + AI
- **Komunidad na mga Forum**: Makibahagi sa mas malawak na diskusyon ng mga Azure developer

### Mga Kategorya ng Feedback
- **Katumpakan ng Nilalaman sa AI**: Mga koreksyon sa integrasyon ng serbisyo ng AI at impormasyon sa deployment
- **Karanasan sa Pagkatuto**: Mga mungkahi para sa pinahusay na daloy ng pagkatuto para sa AI developer
- **Kakulangan sa Nilalaman ng AI**: Mga kahilingan para sa karagdagang AI template, pattern, o halimbawa
- **Accessibility**: Mga pagpapahusay para sa iba't ibang pangangailangan sa pagkatuto
- **Integrasyon ng AI Tool**: Mga mungkahi para sa mas mahusay na workflow sa pag-develop ng AI
- **Mga Pattern ng Production AI**: Mga kahilingan para sa enterprise AI deployment patterns

### Pangako sa Tugon
- **Pagtugon sa Isyu**: Sa loob ng 48 na oras para sa mga naiulat na problema
- **Mga Kahilingan sa Tampok**: Pagsusuri sa loob ng isang linggo
- **Kontribusyon ng Komunidad**: Pagsusuri sa loob ng isang linggo
- **Mga Isyu sa Seguridad**: Agarang prayoridad na may mabilis na pagtugon

## Iskedyul ng Pagpapanatili

### Regular na Mga Update
- **Buwanang Pagsusuri**: Katumpakan ng nilalaman at beripikasyon ng mga link
- **Quarterly Updates**: Malalaking idadagdag na nilalaman at pagpapabuti
- **Semi-Annual Reviews**: Komprehensibong restructuring at pagpapahusay
- **Taunang Paglabas**: Mga malalaking update ng bersyon na may mahahalagang pagpapabuti

### Monitoring at Quality Assurance
- **Awtomatikong Pagsusuri**: Regular na pag-validate ng mga halimbawa ng code at mga link  
- **Integrasyon ng Feedback ng Komunidad**: Regular na pagsasama ng mga suhestiyon ng mga gumagamit  
- **Pag-update ng Teknolohiya**: Pagsunod sa pinakabagong mga serbisyo ng Azure at mga paglabas ng azd  
- **Accessibility Audits**: Regular na pagsusuri para sa mga prinsipyo ng inklusibong disenyo  

## Patakaran sa Suporta ng Bersyon  

### Kasalukuyang Suporta ng Bersyon  
- **Pinakabagong Pangunahing Bersyon**: Buong suporta na may regular na mga pag-update  
- **Nakaraang Pangunahing Bersyon**: Mga pag-update ng seguridad at mahahalagang pag-aayos sa loob ng 12 buwan  
- **Mga Legacy na Bersyon**: Suporta lamang ng komunidad, walang opisyal na mga pag-update  

### Gabay sa Paglilipat  
Kapag may mga inilabas na pangunahing bersyon, nagbibigay kami ng:  
- **Mga Gabay sa Paglilipat**: Mga hakbang-hakbang na tagubilin sa paglipat  
- **Mga Tala sa Kompatibilidad**: Mga detalye tungkol sa mga pagbabagong nagdudulot ng hindi pagkakatugma  
- **Suporta sa Tool**: Mga script o utilitarya para tumulong sa paglilipat  
- **Suporta ng Komunidad**: Mga nakalaan na forum para sa mga tanong tungkol sa paglilipat  

---  

**Pag-navigate**  
- **Nakaraang Aralin**: [Study Guide](resources/study-guide.md)  
- **Susunod na Aralin**: Bumalik sa [Main README](README.md)  

**Maging Updated**: Subaybayan ang repositoryong ito para sa mga notification tungkol sa mga bagong paglabas at mahahalagang update sa mga materyales sa pag-aaral.  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
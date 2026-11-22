# Tala ng Pagbabago - AZD Para sa Mga Baguhan

## Panimula

Itong tala ng pagbabago ay nagdodokumento ng lahat ng mahahalagang pagbabago, update, at pagpapabuti sa AZD Para sa Mga Baguhan repositoryo. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinapanatili ang talaang ito upang matulungan ang mga gumagamit na maunawaan kung ano ang nagbago sa pagitan ng mga bersyon.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagsusuri sa tala ng pagbabago na ito, ikaw ay:
- Mananatiling impormado tungkol sa mga bagong tampok at pagdagdag ng nilalaman
- Mauunawaan ang mga pagpapabuti na ginawa sa kasalukuyang dokumentasyon
- Masusubaybayan ang mga pag-aayos ng bug at mga koreksyon upang masiguro ang katumpakan
- Susubaybayan ang ebolusyon ng mga materyales sa pagkatuto sa paglipas ng panahon

## Mga Kinalabasan ng Pagkatuto

Pagkatapos suriin ang mga entry sa tala ng pagbabago, magagawa mong:
- Tukuyin ang bagong nilalaman at mga mapagkukunan na magagamit para sa pagkatuto
- Mauunawaan kung aling mga seksyon ang na-update o napabuti
- Planuhin ang iyong landas ng pagkatuto batay sa pinakabagong mga materyales
- Mag-ambag ng puna at mga mungkahi para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry extension 1.0 ay pangkalahatang magagamit na

Ang `microsoft.foundry` 1.0 bundle ay **live at pangkalahatang magagamit na**, tulad ng inanunsyo noong [Nobyembre 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Itong kurso ay nagtuturo ngayon ng inilabas na GA workflow, hindi isang paparating na release. Magsimula gamit ang AZD **1.37.0 o mas bago** at `azd ext install microsoft.foundry`.

#### Magagamit sa update ng kursong ito
- Ang gabay sa Ingles ay gumagamit ng GA bundle bilang default na path ng pag-install at ipinaliwanag ang pito nitong independiyenteng binersyong pangunahing mga extension.
- Isang [hosted-agent walkthrough](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) ay sumasaklaw sa upstream Python Agent Framework Responses API sample, kasalukuyang uv, Python 3.13+, pagpili ng bagong o umiiral na proyekto, pag-reuse ng modelo, at pagsusuri ng `azure.yaml`.
- Ang local-to-cloud workflow ay sumasaklaw sa Agent Inspector testing, gastos ng Azure-backed model calls, remote code builds, deployed invocation, cloud tracing, deployment preview, logs, at diagnostics.
- Hiwa-hiwalay na gabay sa ebalwasyon ay sumasaklaw sa pagbuo at pagsusuri ng mga datasets/rubrics, pag-configure ng isang named evaluation, pagrerehistro ng mga asset, at pag-inspeksyon ng mga resulta. Ang matatandang mga tagubilin sa ebalwasyon/optimization ay nananatili bilang kasaysayan ng migrasyon, hindi ang kasalukuyang baseline ng release.
- Ang gabay sa Foundry CI/CD ay naglalaman ng runner extension installation, authenticated deployment, evaluation assets/access, at isang malinaw na quality gate.
- Ang cleanup guidance ay naghihiwalay sa mga bagong likha at reused na mga proyekto ng Foundry. Ang workshop ay nag-uugnay sa hiwalay na GA exercise nang hindi pinapalitan ang mga sample-specific na pagsusulit nito.
- Ang navigasyon ng kurso, mga layunin sa pagkatuto, mga kinakailangan sa setup, cheat sheet, FAQ, at study guide ay sumasalamin sa GA workflow. Ang mga generated translation ay hindi mano-manong ine-edit.

#### Saklaw ng Pagsusuri
- Batay sa GA announcement, naka-link na Microsoft Learn guidance, at upstream sample configuration. Walang live Azure provisioning, deployment, model invocation, o ebalwasyon ang isinagawa.
- Ang Bundle GA ay hindi nangangahulugang GA para sa bawat opsyonal na tampok, independiyenteng extension, o SDK, ni kinikilala ang mga halimbawa para sa produksyon.

### [v3.24.0]- 2026-11-04

#### Naayos
- Naayos ang navigasyon ng kurso sa Ingles, mga lumipat na page paths, nawawalang anchors, at mga lipas na panlabas na sanggunian, kabilang ang link ng Kabanata 2 sa gabay ng production AI.
- Sinuri ang kasalukuyang gabay laban sa inilathalang AZD 1.37.2, mga ahente 1.0.0-beta.23, at mga ebalwasyon 1.0.0-beta.2. Naidokumento ang hiwalay na `azd ai eval` workflow at migrasyon ng optimization configuration.
- Itinama ang mga hindi suportadong CLI flags, authentication boundaries, plaintext environment/secret guidance, mga update sa imprastraktura, configuration ng modelo, at mga halimbawa ng destructive recovery.
- Na-refresh ang workshop laban sa kasalukuyang AI Agents sample, kabilang ang aktwal na hooks, mga input sa configuration, mga pagsusuri sa ebalwasyon, mga entry point sa red-teaming, at observability.
- Itinama ang mga halimbawa ng implementasyon at inayos ang mga kaugnay na isyu sa application/imprastraktura/configuration. Ang materyal sa arkitektura ng retail ay malinaw na inihiwalay mula sa isang kumpletong gumaganang aplikasyon.
- Naibalik ang CodeQL language matrix, pinili ang suportadong Node.js 24 para sa dev container, at ginawa ang mga setup validator upang i-report ang mga nabigong version commands.

#### Nadagdag
- Isang link/anchor checker na offline na pang-Ingles lamang, mga regression test, at isang workflow ng dokumentasyon na bumubuo rin ng workshop sa strict mode. Hindi isinama ang mga generated translation at mga isinalin na imahe.

#### Saklaw ng Validation
- Ang source, syntax, configuration, lokal na ugali, at mga pagsuri sa network-link ay hindi nagtatakda ng live Azure deployability, quota, RBAC, availability ng model sa rehiyon, billing, pagsunod sa seguridad, o readiness para sa produksyon.
- Ang mga matatandang entry sa ibaba ay mga kasaysayan ng tala, hindi mga kasalukuyang utos o tagubilin sa release.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: Pag-update sa Kasalukuyang Bersyon
**Ang bersyon na ito ay muling nag-validate ng kurso laban sa `azd` `1.27.1` (Hulyo 2026, pinakabagong stable release) at ang kasalukuyang preview AI agent extension `azure.ai.agents` `1.0.0-beta.5`, na nagdadala ng bawat "validated against" banner na napapanahon matapos ang mga release ng 1.26.0, 1.27.0, at 1.27.1.**

#### Binago
- **✅ Na-update ang validation baseline** mula sa `azd 1.25.6` (Hunyo 2026) hanggang `azd 1.27.1` (Hulyo 2026) sa root README, lahat ng chapter README, ang Kabanata 1 dev-container lesson (kabilang ang mga pinned-version na halimbawa), ang Kabanata 4 custom-templates lesson, Kabanata 5 multi-agent lesson, at mga dokumento ng workshop
- **🤖 Na-refresh ang Chapte 2 baseline** mula `azd 1.23.12` (Marso 2026) hanggang `azd 1.27.1` sa `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, at `microsoft-foundry-integration.md`; mga petsa ng validation-note na na-update sa 2026-07-13
- **🧩 Pinataas ang AI agent extension** mula `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` hanggang kasalukuyang `1.0.0-beta.5` release sa Kabanata 2 README at `agents.md`
- **🧪 Na-update ang workshop validation example** (`azd version` output) sa `1.27.1`

#### Mga Tala tungkol sa mga kaugnay na azd releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go support para sa Azure Functions sa Flex Consumption, `azd config sub-filter` per-tenant subscription filters, self-contained extension bundles (`azd x pack --bundle`), at `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model Azure AI Foundry projects/agents nang direkta sa `azure.yaml` (Bicep-less/Terraform-less init), suporta sa container deployment para sa App Service (`host: appservice` + `language: docker`), direktang `-s/--source` para sa `azd extension` commands, at `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag para sa `azd extension install`, deprecated models na hindi kasama sa catalog/quota prompts bilang default, at ilang pag-aayos ng bug

#### Mga File na Na-update
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

#### Beginner Gap-Fill #2: Pagsulat ng Template, Dev Containers, Pulumi, Azure DevOps, Mga Service Principal, at Iba Pa
**Isinara ng bersyong ito ang natitirang mga intermediate gaps na natuklasan ng azd-coverage analysis: kung paano sumulat at mag-publish ng iyong sariling template, mga reproducible na dev-container/Codespaces na kapaligiran, ang Pulumi infrastructure provider, isang Azure DevOps CI/CD walkthrough, authentication ng service-principal, host-selection na gabay (AKS/Spring Apps), mga paliwanag tungkol sa `azd restore`/`azd package`, paghawak ng hook error, at mga gawi sa team/shared environment.**

#### Nadagdag
- **🧱 Bagong Kabanata 4 na aralin** `docs/chapter-04-infrastructure/custom-templates.md` — pagsulat ng iyong sariling azd template: kinakailangang istruktura (`azure.yaml`, `infra/`, `src/`), ang `metadata.template` na field, pagpaparameterize ng imprastraktura gamit ang `uniqueString()` resource token at `azd-env-name` tag, pagsusuri ng lokal gamit ang `azd init --template <local-path>`, pag-publish sa GitHub, at pagsusumite sa Awesome AZD gallery
- **📦 Bagong Kabanata 1 na aralin** `docs/chapter-01-foundation/dev-containers.md` — reproducible azd environments gamit ang Dev Containers at GitHub Codespaces: isang minimal na `.devcontainer/devcontainer.json` gamit ang opisyal na `ghcr.io/azure/azure-dev/azd` na tampok, mga tampok na pangwika, `docker-in-docker` para sa mga container host, at `azd auth login --use-device-code` para sa remote sign-in
- **🧩 Pulumi gamit ang azd** na seksyon sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout ng Pulumi folder, mga stack na nakamapa sa azd environments, kinakailangang outputs/tagging, at ang kaparehong `azd up` / `azd down` na workflow
- **🎯 Host-selection na gabay** sa `docs/chapter-04-infrastructure/provisioning.md` — isang beginner-friendly na paghahambing ng `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, at `springapp`, na may gabay kung kailan pipiliin ang AKS o Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** sa `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection gamit ang workload identity federation (OIDC), ang generated `azure-dev.yml`, at setup ng variable-group
- **🔑 Mga Service Principal (Pattern 4)** na idinagdag sa `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` gamit ang client secret laban sa federated/OIDC credentials, kung kailan gagamitin, at ligtas na pagsimpan ng credential
- **🪝 Paghawak ng hook error** na subseksyon sa `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes at `set -e`, `continueOnError`, pagsubok ng mga hook nang hiwalay gamit ang `azd hooks run`, mga shell na OS-specific, at `--debug`
- **👥 Mga Team/shared environment** na seksyon sa `docs/chapter-03-configuration/configuration.md` — kung ano ang nasa `.azure/`, ano ang dapat i-gitignore, mga per-developer na environment, `azd env list`/`select`, at pagbibigay ng mga environment value sa CI/CD
- **🧰 `azd restore` at pinalawak na mga paliwanag sa `azd package`** sa `resources/cheat-sheet.md` — pagpapanumbalik ng mga dependency at paggawa ng deployable na artifact nang hindi nagde-deploy

#### Binago
- **🧭 Talaan ng mga aralin sa Kabanata 4** na na-update upang isama ang bagong "Pagsulat ng Iyong Sariling Template" na aralin (Lesson 3)
- **🧭 Talaan ng mga aralin sa Kabanata 1** na na-update upang isama ang bagong "Dev Containers & Codespaces" na aralin (Lesson 5); mga footer ng navigasyon na naka-wire sa pagitan ng `bring-your-own-app.md` at `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Dalhin ang Sariling App," Terraform, at CI/CD Walkthrough
**Isinara ng bersyong ito ang pinakamalaking mga gap para sa isang kumpletong gabay sa mga baguhan sa pamamagitan ng pagdaragdag ng dalawang bagong hands-on na aralin (isang deployable multi-agent walkthrough at pagdagdag ng azd sa umiiral na app), isang beginner-friendly na introduksyon sa hooks, isang seksyon para sa Terraform gamit ang azd, isang step-by-step na walkthrough ng GitHub Actions pipeline, isang paliwanag para sa mga bagong preview na extension, at isang malinaw na checklist para sa pag-verify ng deployment.**

#### Nadagdag
- **🤝 Bagong Kabanata 5 na aralin** `docs/chapter-05-multi-agent/multi-agent-basics.md` — isang ganap na hands-on, deployable na dalawang-agent walkthrough (orchestrator + specialists) gamit ang isang totoong template (`contoso-creative-writer`), sumasaklaw kung kailan gagamitin ang multi-agent, ang `azd up` workflow, pag-unawa sa deployed na mga mapagkukunan, cross-agent tracing, customisation, at paglilinis
- **📦 Bagong Kabanata 1 na aralin** `docs/chapter-01-foundation/bring-your-own-app.md` — kung paano idagdag ang azd sa umiiral na proyekto gamit ang `azd init` ("gamitin ang code sa kasalukuyang direktoryo"), pag-unawa sa `azure.yaml` at `infra/`, `azd infra generate`, pagtuklas ng host, at pag-deploy gamit ang `azd up`
- **🌐 Terraform gamit ang azd** na seksyon na idinagdag sa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, layout ng `.tf` folder, kinakailangang `AZURE_*` outputs at `azd-env-name` tagging, at kaparehong `azd up` / `azd down` workflow (isinara ang gap kung saan inangkin ang Terraform support ngunit ipinakita lamang ang Bicep)
- **⚙️ Hakbang-hakbang na walkthrough ng GitHub Actions** sa `docs/chapter-08-production/production-ai-practices.md` — mula sa GitHub repo hanggang sa automated na pag-deploy: `azd pipeline config`, OIDC federated credentials (walang nakaimbak na mga lihim), ang generated na `azure-dev.yml`, at patnubay tungkol sa mga lihim laban sa mga variable
- **🪝 Panimulang "Bago sa hooks?" pagpapakilala** sa `docs/chapter-04-infrastructure/deployment-guide.md` — ano ang hook, isang hook-stage table, ang pinaka-minimal na unang hook, at pagpapatakbo ng mga hook nang manu-mano gamit ang `azd hooks run`
- **✅ "I-verify ang Iyong Deployment" checklist** idinagdag sa Step 5 ng `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, at malinaw na mga pamantayan sa tagumpay
- **🧩 Paliwanag para sa mga bagong preview na extension** `azure.ai.skills` at `azure.ai.connections` (ano ang mga ito at kailan dapat gamitin) sa `docs/chapter-08-production/production-ai-practices.md`

#### Binago
- **🧭 Talaan ng mga aralin sa Kabanata 5** naitama: ang `multi-agent-basics.md` ay ngayon ang Lesson 1 (ang nag-iisang ganap na hands-on na aralin), na may tapat na pag-label na ang Lesson 2 ay nasa Kabanata 6 at ang Retail scenario ay isang blueprint ng arkitektura, hindi isang one-command na template
- **🧭 Talaan ng mga aralin sa Kabanata 1** ngayo'y kasama na ang bagong "Bring Your Own App" na aralin (Lesson 4)
- **🔗 Mga navigation footer** na-update: ang `first-project.md` ay ngayon nagli-link pasulong sa `bring-your-own-app.md`

#### Naayos
- **🧱 Ipinasara ang "claimed but missing" na puwang sa Terraform** — ang kurso ay dati nang tumukoy ng suporta sa Terraform nang hindi ito ipinapakita
- **🔀 Naitama ang mga nakalilihang cross-links sa Kabanata 5** na nagbibigay ng impresyon na may ganap na multi-agent na implementasyon samantalang blueprint lang ng arkitektura ang mayroon

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

#### AZD 1.25.6 Refresh, Buong Lifecycle ng Agent na Mga Utos & Aspire Rebrand
**Ang bersyong ito ay muling nagbabalidate ng kurso laban sa `azd` `1.25.6` (Hunyo 2026) at ang `azure.ai.agents` `0.1.40-preview` na extension, pinalawak ang patnubay ng AI mula sa "scaffold an agent" hanggang sa buong lifecycle ng agent (test → evaluate → optimize → inspect → delete), ipinakita ang mga bagong `azure.ai.skills` at `azure.ai.connections` na preview extensions, at inilathala ang produkto na rebrand mula ".NET Aspire" → "Aspire".**

#### Idinagdag
- **🔁 Buong lifecycle coverage ng agent** para sa mga baguhan at AI engineers sa buong dokumentasyon:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle table (scaffold → test → measure → improve → inspect → clean up) idinagdag sa Seksyon ng Extensions at AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Bagong "Managing the Agent Lifecycle" na seksyon na sumasaklaw sa `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
  - `resources/cheat-sheet.md` — Pinalawak na AI Agent Commands kasama ang `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, at `delete --force`
- **🧩 Bagong preview extensions** na idokumento: `azure.ai.skills` (mga reusable agent skills) at `azure.ai.connections` (Foundry connections) idinagdag sa talaan ng mga extension at cheat sheet
- **⏱️ Patnubay sa response-timing** — ang mga halimbawa ng `azd ai agent invoke` ngayon ay nagtuturo na nagpi-print ito ng kabuuang latency at time-to-first-byte
- **📌 Banner ng bersyon** sa root README na nagtuturo sa mga nag-aaral sa `azd version` at `azd upgrade`

#### Binago
- **✅ Na-update na baseline ng validation** mula sa `azd 1.23.12` (Marso 2026) hanggang `azd 1.25.6` (Hunyo 2026) sa lahat ng README ng kabanata at dokumento ng workshop
- **🤖 Na-update ang tala ng extension ng Kabanata 2** mula `azure.ai.agents` `0.1.18-preview` patungo sa `0.1.40-preview`
- **🧪 Na-update ang halimbawa ng validation ng workshop** (`azd version` output) sa `1.25.6`
- **🧭 Na-refresh ang README ng Kabanata 2 na "What's New in azd Today"** upang ipakita ang end-to-end lifecycle ng agent, mga bagong AI extensions, at mga kamakailang pag-aayos sa kalidad ng buhay (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Tinuro na ng kabanata 2 agents.md (Option 4)** ang mga nag-aaral sa post-deploy lifecycle commands sa halip na huminto sa `azd up`

#### Naayos
- **🏷️ Pangalan ng produkto** — idinagdag ang tala ng Aspire rebrand (ang ".NET Aspire" ay ngayon simpleng "Aspire"); walang pagbabago sa suporta ng azd para sa Aspire
- **🔎 Na-validate ang live release** laban sa Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) at `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Paglilinaw para sa Baguhan sa Onboarding, Validation ng Setup & Pangwakas na Cleanup ng Utos ng AZD
**Ang bersyong ito ay sumusunod sa pag-validate ng AZD 1.23 na may isang dokumentasyong pagdaan para sa mga baguhan: nililinaw nito ang patnubay sa AZD-first authentication, idinagdag ang mga lokal na validation script ng setup, tina-verifica ang mahahalagang utos laban sa live AZD CLI, at inalis ang mga huling lipas na sanggunian sa Ingles na mga utos sa labas ng changelog.**

#### Idinagdag
- **🧪 Mga script sa pag-validate ng setup para sa mga baguhan** gamit ang `validate-setup.ps1` at `validate-setup.sh` para makumpirma ng mga nag-aaral ang mga kinakailangang tool bago simulan ang Kabanata 1
- **✅ Mga hakbang sa setup validation nang maaga** sa root README at Kabanata 1 README upang mahuli ang mga nawawalang prerequisite bago ang `azd up`

#### Binago
- **🔐 Patnubay sa authentication para sa mga baguhan** ngayon ay palaging itinuturing ang `azd auth login` bilang pangunahing daan para sa mga AZD workflow, na ang `az login` ay tinukoy bilang opsyonal maliban kung direktang ginagamit ang mga Azure CLI na utos
- **📚 Daloy ng onboarding sa Kabanata 1** ngayon ay nagtuturo sa mga nag-aaral na i-validate muna ang kanilang lokal na setup bago mag-install, authentication, at unang deployment na mga hakbang
- **🛠️ Mensahe ng validator** malinaw na naghihiwalay na ngayon ng mga blocking requirement mula sa opsyonal na mga babala ng Azure CLI para sa AZD-only na landas ng baguhan
- **📖 Mga dokumento ng configuration, troubleshooting, at halimbawa** ngayon ay naghihiwalay ng kinakailangang AZD authentication mula sa opsyonal na Azure CLI sign-in kung saan pareho silang ipinakita noon nang walang konteksto

#### Naayos
- **📋 Natitirang mga sanggunian ng English-source na utos** na na-update sa kasalukuyang anyo ng AZD, kasama ang `azd config show` sa cheat sheet at `azd monitor --overview` kung saan nakatuon ang patnubay ng Azure Portal overview
- **🧭 Mga claim ng baguhan sa Kabanata 1** pinalambot upang maiwasan ang sobrang pangako ng garantisadong zero-error o rollback na pag-uugali sa lahat ng mga template at Azure resources
- **🔎 Na-validate ang live CLI** na kasalukuyang sumusuporta sa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, at `azd down --force --purge`

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

#### AZD 1.23.12 Validation, Pagpapalawak ng Kapaligiran ng Workshop & Pag-refresh ng AI Model
**Ang bersyong ito ay nagsasagawa ng pagsusuri ng dokumentasyon laban sa `azd` `1.23.12`, ina-update ang mga lipas na halimbawa ng utos ng AZD, nire-refresh ang patnubay ng AI model sa kasalukuyang mga default, at pinalalawak ang mga tagubilin sa workshop hindi lang sa GitHub Codespaces kundi pati sa mga dev container at lokal na mga clone.**

#### Idinagdag
- **✅ Mga tala ng validation sa mga pangunahing kabanata at dokumento ng workshop** para gawing malinaw ang tested AZD baseline para sa mga nag-aaral na gumagamit ng mas bago o mas lumang mga CLI build
- **⏱️ Patnubay sa deployment timeout** para sa mga matagal na tumatakbong AI app deployment gamit ang `azd deploy --timeout 1800`
- **🔎 Mga hakbang sa inspeksyon ng extension** gamit ang `azd extension show azure.ai.agents` sa dokumentasyon ng AI workflow
- **🌐 Mas malawak na patnubay sa kapaligiran ng workshop** na sumasaklaw ng GitHub Codespaces, dev containers, at mga lokal na clone gamit ang MkDocs

#### Binago
- **📚 Mga intro README ng kabanata** ngayon ay palaging nagtutukoy ng validation laban sa `azd 1.23.12` sa mga seksyon ng pundasyon, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, at production
- **🛠️ Mga sanggunian ng utos ng AZD** na na-update sa kasalukuyang mga anyo sa buong dokumentasyon:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` depende sa konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kung saan nakatuon ang overview ng Application Insights
- **🧪 Mga halimbawa ng provisioning preview** na pinasimple sa kasalukuyang suportadong gamit tulad ng `azd provision --preview` at `azd provision --preview -e production`
- **🧭 Daloy ng workshop** na na-update upang makumpleto ng mga nag-aaral ang mga lab sa Codespaces, dev container, o lokal na clone imbes na assuming Codespaces-only execution
- **🔐 Patnubay sa authentication** ngayon ay mas pinipili ang `azd auth login` para sa mga AZD workflow, na may `az login` na inilagay bilang opsyonal kapag direktang ginagamit ang mga utos ng Azure CLI

#### Naayos
- **🪟 Mga utos sa pag-install sa Windows** na-normalize sa kasalukuyang casing ng `winget` package sa installation guide
- **🐧 Patnubay sa pag-install sa Linux** naitama upang maiwasan ang hindi suportadong distro-specific na `azd` na mga utos ng package manager at itinuro na lamang ang release assets kung kinakailangan
- **📦 Mga halimbawa ng AI model** na na-refresh mula sa mas lumang default tulad ng `gpt-35-turbo` at `text-embedding-ada-002` patungo sa kasalukuyang mga halimbawa tulad ng `gpt-4.1-mini`, `gpt-4.1`, at `text-embedding-3-large`
- **📋 Mga snippet ng deployment at diagnostics** naitama upang gamitin ang kasalukuyang kapaligiran at mga utos ng status sa mga logs, script, at hakbang sa troubleshooting
- **⚙️ Patnubay sa GitHub Actions** na na-update mula `Azure/setup-azd@v1.0.0` patungo `Azure/setup-azd@v2`
- **🤖 Patnubay sa MCP/Copilot consent** na na-update mula `azd mcp consent` patungo `azd copilot consent list`

#### Pinahusay
- **🧠 Patnubay sa kabanata ng AI** ngayon ay mas mahusay na nagpapaliwanag ng preview-sensitive `azd ai` behavior, tenant-specific login, kasalukuyang gamit ng extension, at na-update na mga rekomendasyon sa pag-deploy ng model
- **🧪 Mga tagubilin sa workshop** ngayon ay gumagamit ng mas makatotohanang mga halimbawa ng bersyon at mas malinaw na wika sa setup ng kapaligiran para sa hands-on na mga lab
- **📈 Dokumento sa production at troubleshooting** ngayon ay mas nakaayon sa kasalukuyang pagmamanman, fallback model, at mga halimbawa ng cost-tier

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

#### Mga Utos ng AZD AI CLI, Validation ng Nilalaman & Pagpapalawak ng Template
**Idinagdag ng bersyong ito ang saklaw ng mga utos na `azd ai`, `azd extension`, at `azd mcp` sa lahat ng mga kabanatang may kaugnayan sa AI, inayos ang mga sirang link at mga luma nang code sa agents.md, in-update ang cheat sheet, at inayos nang buo ang Seksyon ng Mga Halimbawang Template na may mga napatunayang paglalarawan at mga bagong Azure AI AZD na template.**

#### Idinagdag
- **🤖 Saklaw ng AZD AI CLI** sa 7 file (noon ay nasa Kabanata 8 lang):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagong seksyong "Mga Extension at AI na Mga Utos" na nagpakilala ng `azd extension`, `azd ai agent init`, at `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsyon 4: `azd ai agent init` na may talahanayan ng paghahambing (template vs manifest na paraan)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Mga sub-seksyong "AZD Extensions para sa Foundry" at "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Ipinapakita ngayon ng Quick Start ang parehong mga template at mga daan ng deployment na batay sa manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Kasama na sa seksyon ng Deploy ang opsyon na `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sub-seksyong "Mga Utos sa AZD AI Extension para sa Diagnosis"
  - `resources/cheat-sheet.md` — Bagong seksyong "Mga Utos ng AI at Mga Extension" na may `azd extension`, `azd ai agent init`, `azd mcp`, at `azd infra generate`
- **📦 Bagong mga halimbawang AZD AI na template** sa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat na may Blazor WebAssembly, Semantic Kernel, at suporta sa voice chat
  - **azure-search-openai-demo-java** — Java RAG chat gamit ang Langchain4J na may ACA/AKS na mga opsyon sa deployment
  - **contoso-creative-writer** — Multi-agent creative writing app gamit ang Azure AI Agent Service, Bing Grounding, at Prompty
  - **serverless-chat-langchainjs** — Serverless RAG gamit ang Azure Functions + LangChain.js + Cosmos DB na may Ollama lokal na suporta sa dev
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator na may admin portal, integrasyon ng Teams, at mga opsyon sa PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app na may mga server sa .NET, Python, Java, at TypeScript
  - **azd-ai-starter** — Minimal na Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Sanggunian sa [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ na mga template)

#### Naayos
- **🔗 navigation sa agents.md**: Ang mga link na Previous/Next ay tumutugma na ngayon sa pagkakasunud-sunod ng mga aralin sa README ng Kabanata 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 mga sirang link sa agents.md**: Inayos ang `production-ai-practices.md` sa `../chapter-08-production/production-ai-practices.md` (3 beses)
- **📦 deprecated na code sa agents.md**: Pinalitan ang `opencensus` ng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 invalid na API sa agents.md**: Inilipat ang `max_tokens` mula `create_agent()` papuntang `create_run()` bilang `max_completion_tokens`
- **🔢 pagbilang ng token sa agents.md**: Pinalitan ang malabong estimate na `len//4` ng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Inayos ang mga serbisyo mula "Cognitive Search + App Service" papuntang "Azure AI Search + Azure Container Apps" (nagbago ang default host Oktubre 2024)
- **contoso-chat**: In-update ang paglalarawan upang tumukoy sa Azure AI Foundry + Prompty, na tumutugma sa aktwal na pamagat at tech stack ng repo

#### Tinanggal
- **ai-document-processing**: Tinanggal ang non-functional na sanggunian sa template (hindi pampublikong accessible ang repo bilang isang AZD template)

#### Pinahusay
- **📝 mga pagsasanay sa agents.md**: Ipinapakita na ngayon ng Pagsasanay 1 ang inaasahang output at ang hakbang na `azd monitor`; Kasama na ang buong code ng pagpaparehistro para sa `FunctionTool` sa Pagsasanay 2; Pinalitan ng mga kongkretong utos na `prepdocs.py` ang mga malabong gabay sa Pagsasanay 3
- **📚 mga resources sa agents.md**: Ini-update ang mga link ng dokumentasyon sa kasalukuyang Azure AI Agent Service docs at quickstart
- **📋 talahanayan ng Mga Susunod na Hakbang sa agents.md**: Idinagdag ang link ng AI Workshop Lab para sa kumpletong saklaw ng kabanata

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

#### Pagpapahusay ng Navigation sa Kurso
**Pinapahusay ng bersyong ito ang navigation ng README.md na kabanata gamit ang pinalawak na format ng talahanayan.**

#### Binago
- **Talahanayan ng Mapa ng Kurso**: Pinalawak na may direktang mga link sa aralin, mga tinantyang tagal, at mga rating ng kahirapan
- **Paglilinis ng Mga Folder**: Tinanggal ang mga dobleng lumang folder (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pagpapatunay ng Link**: Lahat ng 21+ na panloob na link sa talahanayan ng Mapa ng Kurso ay na-verify

### [v3.16.0] - 2026-02-05

#### Mga Update sa Pangalan ng Produkto
**Ini-update ng bersyong ito ang mga sanggunian sa produkto ayon sa kasalukuyang branding ng Microsoft.**

#### Binago
- **Microsoft Foundry → Microsoft Foundry**: Lahat ng sanggunian ay na-update sa mga hindi pagsasalin na file
- **Azure AI Agent Service → Foundry Agents**: Pinalitan ang pangalan ng serbisyo upang sumalamin sa kasalukuyang branding

#### Mga Na-update na File
- `README.md` - Pangunahing landing page ng kurso
- `changelog.md` - Kasaysayan ng bersyon
- `course-outline.md` - Estruktura ng kurso
- `docs/chapter-02-ai-development/agents.md` - Gabay sa AI agents
- `examples/README.md` - Dokumentasyon ng mga halimbawa
- `workshop/README.md` - Landing page ng workshop
- `workshop/docs/index.md` - Index ng workshop
- `workshop/docs/instructions/*.md` - Lahat ng mga file ng instruksiyon sa workshop

---

### [v3.15.0] - 2026-02-05

#### Malawakang Pag-aayos ng Repositoryo: Mga Pangalan ng Folder na Nakabatay sa Kabanata
**Ipinapamahagi ng bersyong ito ang dokumentasyon sa mga nakalaang folder ng kabanata para sa mas malinaw na navigation.**

#### Mga Pagpapalit ng Pangalan ng Folder
Pinalitan ang mga lumang folder ng mga folder na may bilang ng kabanata:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Naganap ang bagong idinagdag: `docs/chapter-05-multi-agent/`

#### Paglilipat ng File
| File | Mula sa | Papunta sa |
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
| Lahat ng pre-deployment na mga file | pre-deployment/ | chapter-06-pre-deployment/ |
| Lahat ng mga troubleshooting na file | troubleshooting/ | chapter-07-troubleshooting/ |

#### Idinagdag
- **📚 Mga README file sa Kabanata**: Nilikha ang README.md sa bawat folder ng kabanata kasama ang:
  - Mga layunin sa pagkatuto at tagal
  - Talahanayan ng mga aralin na may mga paglalarawan
  - Mga utos para sa mabilisang pagsisimula
  - Navigation sa ibang mga kabanata

#### Binago
- **🔗 In-update lahat ng panloob na link**: 78+ na mga landas ang na-update sa lahat ng dokumentong file
- **🗺️ Pangunahing README.md**: In-update ang Mapa ng Kurso gamit ang bagong estruktura ng kabanata
- **📝 examples/README.md**: In-update ang mga cross-reference sa mga folder ng kabanata

#### Tinanggal
- Lumang estruktura ng folder (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Pag-aayos ng Repositoryo: Navigation sa Kabanata
**Idinagdag ng bersyong ito ang mga README file para sa navigation ng kabanata (napalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Bagong Gabay sa AI Agents
**Idinagdag ng bersyong ito ang isang komprehensibong gabay para sa deployment ng AI agents gamit ang Azure Developer CLI.**

#### Idinagdag
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang AI agents at paano sila naiiba sa mga chatbot
  - Tatlong mabilisang mga template ng agent (Foundry Agents, Prompty, RAG)
  - Mga pattern ng arkitektura ng agent (isang agent, RAG, multi-agent)
  - Pag-configure at pagpapasadya ng mga tool
  - Pagsubaybay at pagtala ng mga metriko
  - Mga pagsasaalang-alang sa gastos at pag-optimize
  - Mga pangkaraniwang senaryo sa pag-troubleshoot
  - Tatlong praktikal na pagsasanay na may mga pamantayan ng tagumpay

#### Estruktura ng Nilalaman
- **Panimula**: Mga konsepto ng agent para sa mga nagsisimula
- **Mabilisang Pagsisimula**: I-deploy ang mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Mga Pattern ng Arkitektura**: Mga biswal na diagram ng mga pattern ng agent
- **Pag-configure**: Pag-setup ng tool at mga environment variable
- **Pagsubaybay**: Integrasyon ng Application Insights
- **Mga Pagsasanay**: Paunlarin ang hands-on na pagkatuto (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### Update sa DevContainer Environment
**Inu-update ng bersyong ito ang configuration ng development container gamit ang mga modernong tool at mas mabuting default para sa karanasan sa AZD learning.**

#### Binago
- **🐳 Base Image**: In-update mula `python:3.12-bullseye` papuntang `python:3.12-bookworm` (pinakabagong matatag na Debian)
- **📛 Pangalan ng Container**: Pinalitan mula "Python 3" papuntang "AZD for Beginners" para sa kalinawan

#### Idinagdag
- **🔧 Bagong Mga Tampok ng Dev Container**:
  - `azure-cli` na may suportang Bicep na naka-enable
  - `node:20` (LTS na bersyon para sa mga template ng AZD)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa deployment ng container app

- **🔌 Port Forwarding**: Mga pre-configure na port para sa karaniwang development:
  - 8000 (preview ng MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Bagong Mga Extension sa VS Code**:
  - `ms-python.vscode-pylance` - Pinahusay na Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Suporta sa Azure Functions
  - `ms-azuretools.vscode-docker` - Suporta sa Docker
  - `ms-azuretools.vscode-bicep` - Suporta sa Bicep language
  - `ms-azure-devtools.azure-resource-groups` - Pamamahala ng Azure resource
  - `yzhang.markdown-all-in-one` - Pag-edit ng Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Suporta para sa Mermaid diagram
  - `redhat.vscode-yaml` - Suporta sa YAML (para sa azure.yaml)
  - `eamodio.gitlens` - Visualisasyon ng Git
  - `mhutchie.git-graph` - Kasaysayan ng Git

- **⚙️ Mga Setting ng VS Code**: Idinagdag ang default na mga setting para sa Python interpreter, format on save, at pagtanggal ng puting espasyo

- **📦 Na-update ang requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang mga Azure SDK na package (azure-identity, azure-mgmt-resource)

#### Naayos
- **Post-Create Command**: Ngayon ay sinusuri ang pag-install ng AZD at Azure CLI sa pagsisimula ng container

---

### [v3.11.0] - 2026-02-05

#### Malawakang Pag-aayos ng README para sa mga Baguhan
**Malaki ang pagpapabuti ng bersyong ito sa README.md upang maging mas accessible para sa mga baguhan at nagdadagdag ng mahahalagang resources para sa mga developer ng AI.**

#### Idinagdag
- **🆚 Paghahambing ng Azure CLI at AZD**: Malinaw na paliwanag kung kailan gagamitin ang bawat tool na may praktikal na mga halimbawa
- **🌟 Mga Kahanga-hangang Link sa AZD**: Direktang mga link sa gallery ng komunidad ng mga template at mga mapagkukunan ng kontribusyon:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ na mga ready-to-deploy na template
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kontribusyon ng komunidad
- **🎯 Gabay sa Mabilisang Pagsisimula**: Pinasimpleng 3-hakbang na seksyon sa pagsisimula (Install → Login → Deploy)
- **📊 Talahanayan ng Navigation Batay sa Karanasan**: Malinaw na gabay kung saan magsisimula batay sa karanasan ng developer

#### Binago
- **Estruktura ng README**: Inayos para sa paunang paglalantad - mga pangunahing impormasyon una
- **Seksyon ng Panimula**: Isinulat muli upang ipaliwanag ang "The Magic of `azd up`" para sa mga ganap na baguhan
- **Tinanggal ang Dobleng Nilalaman**: Tinanggal ang dobleng seksyon sa pag-troubleshoot
- **Mga Utos sa Pag-troubleshoot**: Naayos ang `azd logs` na sanggunian upang gumamit ng wastong `azd monitor --logs`

#### Naayos
- **🔐 Mga Utos sa Pagpapatunay**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Hindi Wastong Sanggunian sa Utos**: Tinanggal ang natitirang `azd logs` mula sa seksyon ng troubleshooting sa README

#### Mga Tala
- **Saklaw**: Mga pagbabago na inilapat sa pangunahing README.md at resources/cheat-sheet.md
- **Target na Tagapakinig**: Mga pagpapahusay na espesipikong para sa mga developer na bago sa AZD

---

### [v3.10.0] - 2026-02-05

#### Pag-update ng Katumpakan ng Azure Developer CLI Command
**Inaayos ng bersyon na ito ang mga utos ng AZD na hindi umiiral sa buong dokumentasyon, tinitiyak na lahat ng halimbawa ng code ay gumagamit ng wastong syntax ng Azure Developer CLI.**

#### Naayos
- **🔧 Tinanggal ang Hindi Umiiral na Mga Utos ng AZD**: Komprehensibong pagsusuri at pagwawasto ng mga invalid na utos:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o mga alternatibong Azure CLI
  - `azd service` na mga subcommand (hindi umiiral) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (hindi umiiral) → tinanggal o pinalitan ng mga wastong alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` na mga flag (hindi umiiral) → tinanggal
  - `azd provision --what-if/--rollback` na mga flag (hindi umiiral) → in-update upang gamitin ang `--preview`
  - `azd config validate` (hindi umiiral) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hindi umiiral) → tinanggal

- **📚 Mga File na In-update ng Pagwawasto sa Utos**:
  - `resources/cheat-sheet.md`: Malaking overhaul ng sanggunian ng utos
  - `docs/deployment/deployment-guide.md`: Naayos ang rollback at mga estratehiya sa deployment
  - `docs/troubleshooting/debugging.md`: Naayos ang mga seksyon ng pagsusuri ng log
  - `docs/troubleshooting/common-issues.md`: In-update ang mga utos sa troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Naayos ang seksyon ng AZD debugging
  - `docs/getting-started/azd-basics.md`: Naayos ang mga utos sa monitoring
  - `docs/getting-started/first-project.md`: In-update ang mga halimbawa ng monitoring at debugging
  - `docs/getting-started/installation.md`: Naayos ang mga halimbawa ng tulong at bersyon
  - `docs/pre-deployment/application-insights.md`: Naayos ang mga utos sa pagtingin ng log
  - `docs/pre-deployment/coordination-patterns.md`: Naayos ang mga utos sa agent debugging

- **📝 Na-update ang Sanggunian ng Bersyon**: 
  - `docs/getting-started/installation.md`: Pinalitan ang hardcoded na bersyon ng `1.5.0` ng generic na `1.x.x` na may link sa mga release

#### Binago
- **Mga Estratehiya sa Rollback**: In-update ang dokumentasyon upang gumamit ng Git-based rollback (walang native rollback ang AZD)
- **Pagtingin ng Log**: Pinalitan ang mga sanggunian sa `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at mga utos ng Azure CLI
- **Seksyon ng Performance**: Tinanggal ang mga hindi umiiral na parallel/incremental deployment na mga flag, nagbigay ng mga wastong alternatibo

#### Mga Teknikal na Detalye
- **Wastong Mga Utos ng AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Wastong mga Flag ng azd monitor**: `--live`, `--logs`, `--overview`
- **Tinanggal na mga Tampok**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Pagpapatunay**: Mga utos na na-validate laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagkumpleto ng Workshop at Pagpapabuti ng Kalidad ng Dokumentasyon
**Pinakukumpleto ng bersyong ito ang mga interactive na workshop module, inaayos ang lahat ng sirang link sa dokumentasyon, at pinapabuti ang pangkalahatang kalidad ng nilalaman para sa mga AI developer na gumagamit ng Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng mga patnubay sa kontribusyon na may:
  - Malinaw na mga tagubilin para sa pag-uulat ng mga isyu at pagrerekomenda ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga gabay sa halimbawa ng code at mga konbensyon sa commit message
  - Impormasyon sa pakikilahok ng komunidad

#### Nakumpleto
- **🎯 Workshop Module 7 (Pagtatapos)**: Ganap na nakumpletong wrap-up module na may:
  - Komprehensibong buod ng mga nagawa sa workshop
  - Seksyon ng mga pangunahing konseptong napag-aralan na sumasaklaw sa AZD, mga template, at Microsoft Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng paglalakbay sa pag-aaral
  - Mga pagsasanay sa hamon ng workshop na may marka ng kahirapan
  - Mga link para sa feedback ng komunidad at suporta

- **📚 Workshop Module 3 (Deconstruct)**: In-update ang mga layunin sa pagkatuto na may:
  - Patnubay sa pag-activate ng GitHub Copilot gamit ang MCP servers
  - Pag-unawa sa istraktura ng folder ng AZD template
  - Mga pattern sa organisasyon ng Infrastructure-as-code (Bicep)
  - Mga tagubilin sa hands-on lab

- **🔧 Workshop Module 6 (Teardown)**: Nakumpleto na may:
  - Mga layunin sa paglilinis ng mga resource at pamamahala ng gastos
  - Paggamit ng `azd down` para sa ligtas na pag-deprovision ng infrastructure
  - Gabay sa pagbawi ng soft-deleted na mga cognitive services
  - Mga bonus prompting para sa GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Pag-ayos ng Sirang Link**: Naresolba ang 15+ na sirang internal na mga link sa dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Naayos ang mga path patungo sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Naayos ang mga path ng ai-model-deployment.md at production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pinalitan ang hindi umiiral na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Naayos ang mga path ng FAQ at troubleshooting guide
  - `examples/container-app/microservices/README.md`: Naayos ang mga path ng course home at deployment guide
  - `resources/faq.md` at `resources/glossary.md`: In-update ang mga sanggunian ng kabanata sa AI
  - `course-outline.md`: Naayos ang mga sanggunian sa instructor guide at AI workshop lab

- **📅 Banner ng Workshop Status**: In-update mula sa "Under Construction" patungo sa aktibong status ng workshop na may petsang Pebrero 2026

- **🔗 Navigasyon ng Workshop**: Naayos ang mga sirang link ng navigasyon sa workshop README.md na nagtuturo sa hindi umiiral na folder na lab-1-azd-basics

#### Binago
- **Presentasyon ng Workshop**: Tinanggal ang babalang "under construction", ang workshop ay kumpleto na at handa nang gamitin
- **Konsistensi sa Navigasyon**: Tiniyak na lahat ng mga module ng workshop ay may tamang inter-module na navigasyon
- **Sanggunian sa Learning Path**: In-update ang mga cross-reference ng kabanata upang gumamit ng tamang mga path ng microsoft-foundry

#### Napatunayan
- ✅ Lahat ng mga English markdown na file ay may wastong internal na link
- ✅ Mga workshop module 0-7 ay kumpleto na kasama ang mga layunin sa pagkatuto
- ✅ Gumagana nang tama ang navigasyon sa pagitan ng mga kabanata at module
- ✅ Ang nilalaman ay angkop para sa mga AI developer na gumagamit ng Microsoft AZD
- ✅ Napanatili ang beginner-friendly na wika at estruktura sa buong dokumento
- ✅ Nagbibigay ang CONTRIBUTING.md ng malinaw na gabay para sa mga contributor ng komunidad

#### Teknikal na Pagpapatupad
- **Pagpapatunay ng Link**: Na-verify ng automated PowerShell script ang lahat ng .md internal na link
- **Audit ng Nilalaman**: Manual na pagsusuri ng pagkakumpleto ng workshop at pagiging angkop para sa mga baguhan
- **Sistema ng Navigasyon**: Pare-parehong pattern ng navigasyon ng kabanata at module ang inilapat

#### Mga Tala
- **Saklaw**: Mga pagbabagong inilapat sa dokumentasyong Ingles lamang
- **Mga Salin**: Hindi na-update ang mga folder ng salin sa bersyong ito (iasabay sa awtomatikong pagsasalin sa kalaunan)
- **Tagal ng Workshop**: Ang kumpletong workshop ngayon ay nagbibigay ng 3-4 na oras ng hands-on na pag-aaral

---

### [v3.8.0] - 2025-11-19

#### Advanced na Dokumentasyon: Monitoring, Seguridad, at Mga Pattern ng Multi-Agent
**Idinagdag ng bersyong ito ang komprehensibong mga A-grade na aralin sa pagsasama ng Application Insights, mga pattern ng authentication, at koordinasyon ng multi-agent para sa mga deployment sa production.**

#### Idinagdag
- **📊 Aralin sa Pagsasama ng Application Insights**: sa `docs/pre-deployment/application-insights.md`:
  - Pag-deploy na naka-focus sa AZD na may awtomatikong provisioning
  - Kumpletong Bicep template para sa Application Insights + Log Analytics
  - Gumaganang mga Python application na may custom telemetry (1,200+ linya)
  - Mga pattern ng AI/LLM monitoring (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagrams (arkitektura, distributed tracing, daloy ng telemetry)
  - 3 hands-on na pagsasanay (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng Kusto query at mga estratehiya sa pag-optimize ng gastos
  - Live metrics streaming at real-time debugging
  - 40-50 minutong oras ng pag-aaral kasama ng production-ready na mga pattern

- **🔐 Aralin sa Mga Pattern sa Authentication at Seguridad**: sa `docs/getting-started/authsecurity.md`:
  - 3 mga pattern ng authentication (connection strings, Key Vault, managed identity)
  - Kumpletong mga Bicep infrastructure template para sa ligtas na deployment
  - Node.js na application code na may Azure SDK integration
  - 3 kumpletong pagsasanay (pag-enable ng managed identity, user-assigned identity, Key Vault rotation)
  - Pinakamahusay na kasanayan sa seguridad at mga configuration ng RBAC
  - Gabay sa troubleshooting at pagsusuri ng gastos
  - Production-ready na mga pattern ng passwordless authentication

- **🤖 Aralin sa Mga Pattern ng Multi-Agent Coordination**: sa `docs/pre-deployment/coordination-patterns.md`:
  - 5 mga pattern ng koordinasyon (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong implementasyon ng orchestrator service (Python/Flask, 1,500+ linya)
  - 3 specialized na implementasyon ng agent (Research, Writer, Editor)
  - Integrasyon ng Service Bus para sa message queuing
  - Pamamahala ng estado sa Cosmos DB para sa mga distributed system
  - 6 Mermaid diagrams na nagpapakita ng interaksyon ng mga agent
  - 3 advanced na pagsasanay (timeout handling, retry logic, circuit breaker)
  - Breakdown ng gastos ($240-565/buwan) na may mga estratehiya sa pag-optimize
  - Pagsasama ng Application Insights para sa monitoring

#### Pinahusay
- **Kabanata ng Pre-deployment**: Ngayon ay may komprehensibong monitoring at koordinasyon ng mga pattern
- **Kabanata ng Getting Started**: Pinahusay gamit ang mga propesyonal na pattern ng authentication
- **Kahandaan sa Production**: Kumpletong saklaw mula sa seguridad hanggang sa obserbabilidad
- **Balangkas ng Kurso**: In-update upang sangguniin ang mga bagong aralin sa Mga Kabanata 3 at 6

#### Binago
- **Pag-unlad ng Pagkatuto**: Mas mahusay na pagsasama ng seguridad at monitoring sa buong kurso
- **Kalidad ng Dokumentasyon**: Konsistent na mga pamantayan ng A-grade (95-97%) sa bagong mga aralin
- **Mga Pattern sa Production**: Kumpletong saklaw mula umpisa hanggang dulo para sa mga enterprise deployment

#### Pinabuti
- **Karanasan ng Developer**: Malinaw na landas mula sa development hanggang production monitoring
- **Pamantayan sa Seguridad**: Mga propesyonal na pattern para sa authentication at pamamahala ng mga lihim
- **Obserbabilidad**: Kumpletong pagsasama ng Application Insights gamit ang AZD
- **Mga Workload ng AI**: Espesyal na monitoring para sa Microsoft Foundry Models at mga sistema ng multi-agent

#### Napatunayan
- ✅ Lahat ng mga aralin ay may kumpletong gumaganang code (hindi mga snippet)
- ✅ Mga Mermaid diagram para sa biswal na pagkatuto (19 kabuuan sa 3 aralin)
- ✅ Mga hands-on na pagsasanay na may mga hakbang sa pagpapatunay (9 kabuuan)
- ✅ Production-ready na mga Bicep template na maaaring i-deploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa pag-optimize
- ✅ Mga gabay sa troubleshooting at pinakamahusay na kasanayan
- ✅ Mga knowledge checkpoint na may mga utos sa pagpapatunay

#### Resulta ng Grado sa Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa monitoring
- **docs/getting-started/authsecurity.md**: - Mga propesyonal na pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Advanced na multi-agent na arkitektura
- **Kabuuang Bagong Nilalaman**: - Konsistenteng mataas na kalidad ng pamantayan

#### Teknikal na Pagpapatupad
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC na mga pattern
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Pamamahala ng Gastos**: Mga estratehiya sa sampling, mga polisiya sa retention, mga kontrol sa budget

### [v3.7.0] - 2025-11-19

#### Mga Pagpapabuti sa Kalidad ng Dokumentasyon at Bagong Halimbawa ng Microsoft Foundry Models
**Pinapalakas ng bersyong ito ang kalidad ng dokumentasyon sa buong repositoryo at nagdaragdag ng kumpletong halimbawa ng deployment ng Microsoft Foundry Models gamit ang gpt-4.1 chat interface.**

#### Idinagdag
- **🤖 Halimbawa ng Chat sa Microsoft Foundry Models**: Kumpletong deployment ng gpt-4.1 na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong imprastruktura ng Microsoft Foundry Models (deployment ng modelong gpt-4.1)
  - Python command-line na chat interface na may kasaysayan ng pag-uusap
  - Integrasyon ng Key Vault para sa ligtas na pag-iimbak ng API key
  - Pagsubaybay sa paggamit ng token at pagtataya ng gastos
  - Rate limiting at paghawak ng mga error
  - Komprehensibong README na may 35-45 minutong gabay sa deployment
  - 11 production-ready na file (mga Bicep template, Python app, configuration)
- **📚 Mga Pagsasanay sa Dokumentasyon**: Idinagdag ang mga hands-on na practice na pagsasanay sa gabay sa configuration:
  - Pagsasanay 1: Multi-environment configuration (15 minuto)
  - Pagsasanay 2: Pagsasanay sa pamamahala ng mga lihim (10 minuto)
  - Malinaw na mga pamantayan sa tagumpay at mga hakbang sa pagpapatunay
- **✅ Pagpapatunay sa Deployment**: Idinagdag ang seksyon ng pagpapatunay sa deployment guide:
  - Mga proseso ng health check
  - Checklist ng mga pamantayan sa tagumpay
  - Inaasahang output para sa lahat ng mga utos sa deployment
  - Quick reference sa troubleshooting

#### Pinahusay
- **examples/README.md**: In-update sa kalidad na A-grade (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng kaugnay na seksyon
  - In-update ang bilang ng lokal na halimbawa mula 3 hanggang 4
  - Idinagdag sa talahanayan ng AI Application Examples
  - Isinama sa Quick Start para sa mga Intermediate Users
  - Idinagdag sa seksyon ng Microsoft Foundry Templates
  - In-update ang Comparison Matrix at mga seksyon sa paghahanap ng teknolohiya
- **Kalidad ng Dokumentasyon**: Pinabuting B+ (87%) → A- (92%) sa buong folder ng mga docs:
  - Idinagdag ang mga inaasahang output sa mga mahahalagang halimbawa ng command
  - Isinama ang mga hakbang sa beripikasyon para sa mga pagbabago sa configuration
  - Pinahusay ang hands-on na pag-aaral gamit ang mga praktikal na ehersisyo

#### Nagbago
- **Pag-unlad ng Pagkatuto**: Mas mahusay na integrasyon ng mga halimbawa ng AI para sa mga intermediate na mag-aaral
- **Estruktura ng Dokumentasyon**: Mas maraming actionable exercises na may malinaw na mga resulta
- **Proseso ng Beripikasyon**: Tiyak na mga pamantayan sa tagumpay na idinagdag sa mga pangunahing workflow

#### Pinahusay
- **Karanasan ng Developer**: Ang deployment ng Microsoft Foundry Models ngayon ay tumatagal ng 35-45 minuto (kumpara sa 60-90 para sa mga komplikadong alternatibo)
- **Transparensiya sa Gastos**: Malinaw na pagtataya ng gastos ($50-200/buwan) para sa halimbawa ng Microsoft Foundry Models
- **Landas ng Pagkatuto**: May malinaw na entry point para sa AI developers gamit ang azure-openai-chat
- **Pamantayan ng Dokumentasyon**: Konsistenteng inaasahang outputs at hakbang sa beripikasyon

#### Na-validate
- ✅ Ang halimbawa ng Microsoft Foundry Models ay ganap na gumagana gamit ang `azd up`
- ✅ Lahat ng 11 implementasyon na mga file ay syntactically correct
- ✅ Ang mga tagubilin sa README ay tumutugma sa aktwal na karanasan sa deployment
- ✅ Mga link ng dokumentasyon na na-update sa higit sa 8 lokasyon
- ✅ Ang index ng mga halimbawa ay tumpak na naglalarawan ng 4 na lokal na halimbawa
- ✅ Walang duplicate na mga panlabas na link sa mga talahanayan
- ✅ Lahat ng mga sanggunian sa navigation ay tama

#### Teknikal na Implementasyon
- **Arkitektura ng Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps na pattern
- **Seguridad**: Handang Managed Identity, mga sikreto sa Key Vault
- **Pagsubaybay**: Integrasyon ng Application Insights
- **Pamamahala ng Gastos**: Pagsubaybay ng token at pag-optimize ng paggamit
- **Deployment**: Isang utos na `azd up` para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Pangunahing Update: Mga Halimbawa ng Deployment ng Container App
**Ipinapakilala ng bersyon na ito ang komprehensibong, handa para sa produksyon na mga halimbawa ng deployment ng container application gamit ang Azure Developer CLI (AZD), na may buong dokumentasyon at integrasyon sa landas ng pagkatuto.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kumpletong pangkalahatang-ideya ng mga containerized na deployment, mabilisang pagsisimula, produksyon, at advanced na mga pattern
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly na REST API na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Pinakamainam na Mga Praktis**: Seguridad, pagsubaybay, pag-optimize ng gastos, at gabay sa CI/CD para sa mga containerized na workload
- **Mga Halimbawang Code**: Kumpleto `azure.yaml`, mga template ng Bicep, at multi-language service implementations (Python, Node.js, C#, Go)
- **Pagsubok at Pagtatanggal ng Problema**: End-to-end test scenarios, mga utos sa pagsubaybay, gabay sa troubleshooting

#### Nagbago
- **README.md**: Na-update upang tampokhin at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: Na-update upang bigyang-diin ang mga halimbawa ng container app, magdagdag ng mga entry sa comparison matrix, at i-update ang mga sanggunian sa teknolohiya/arkitektura
- **Balangkas ng Kurso at Gabay sa Pag-aaral**: Na-update upang sangguniin ang mga bagong halimbawa ng container app at mga pattern ng deployment sa mga kaukulang kabanata

#### Na-validate
- ✅ Lahat ng bagong halimbawa ay maipapadeploy gamit ang `azd up` at sumusunod sa pinakamahusay na mga praktis
- ✅ Na-update ang cross-links ng dokumentasyon at navigation
- ✅ Saklaw ng mga halimbawa mula beginner hanggang advanced na mga scenario, kabilang ang produksyon na microservices

#### Mga Tala
- **Saklaw**: Ingles na dokumentasyon at mga halimbawa lamang
- **Susunod na Mga Hakbang**: Palawakin pa gamit ang karagdagang advanced container patterns at CI/CD automation sa mga susunod na bersyon

### [v3.5.0] - 2025-11-19

#### Pag-rebrand ng Produkto: Microsoft Foundry
**Ipapatupad ng bersyon na ito ang komprehensibong pagbabago ng pangalan ng produkto mula "Microsoft Foundry" patungo sa "Microsoft Foundry" sa lahat ng dokumentasyong Ingles, na sumasalamin sa opisyal na pag-rebrand ng Microsoft.**

#### Nagbago
- **🔄 Pag-update ng Pangalan ng Produkto**: Kumpletong rebranding mula "Microsoft Foundry" patungo sa "Microsoft Foundry"
  - Na-update ang lahat ng sanggunian sa buong dokumentasyong Ingles sa `docs/` folder
  - Pinalitan ang pangalan ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 na sanggunian sa nilalaman ang na-update sa 7 dokumentong file

- **📁 Mga Pagbabago sa Estruktura ng Folder**:
  - Ang `docs/ai-foundry/` ay pinalitan ng pangalan sa `docs/microsoft-foundry/`
  - Lahat ng cross-references ay na-update upang sumalamin sa bagong estruktura ng folder
  - Na-validate ang mga link sa navigation sa buong dokumentasyon

- **📄 Pagpapalit ng Pangalan ng File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Lahat ng internal na mga link ay na-update upang sanggunian ang bagong pangalan ng file

#### Mga Na-update na File
- **Dokumentasyon ng Kabanata** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mga update ng link sa navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 na sanggunian sa pangalan ng produkto na na-update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ginagamit na ang Microsoft Foundry (mula sa mga naunang update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 sanggunian na na-update (pangkalahatang-ideya, feedback ng komunidad, dokumentasyon)
  - `docs/getting-started/azd-basics.md` - 4 na cross-reference links na na-update
  - `docs/getting-started/first-project.md` - 2 mga link sa navigation ng kabanata na na-update
  - `docs/getting-started/installation.md` - 2 mga link sa susunod na kabanata na na-update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 sanggunian na na-update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 link sa navigation na na-update
  - `docs/troubleshooting/debugging.md` - 1 link sa navigation na na-update

- **Mga File ng Estruktura ng Kurso** (2 files):
  - `README.md` - 17 sanggunian na na-update (pangkalahatang ideya ng kurso, mga pamagat ng kabanata, seksyon ng mga template, mga pananaw ng komunidad)
  - `course-outline.md` - 14 sanggunian na na-update (pangkalahatang ideya, mga layunin sa pagkatuto, mga mapagkukunan ng kabanata)

#### Na-validate
- ✅ Walang natitirang mga sanggunian sa folder path na "ai-foundry" sa mga dokumentong Ingles
- ✅ Walang natitirang mga sanggunian sa pangalang produkto na "Microsoft Foundry" sa mga dokumentong Ingles
- ✅ Lahat ng mga link sa navigation ay gumagana nang maayos sa bagong estruktura ng folder
- ✅ Matagumpay na natapos ang pagpapalit ng pangalan ng file at folder
- ✅ Na-validate ang mga cross-reference sa pagitan ng mga kabanata

#### Mga Tala
- **Saklaw**: Ang mga pagbabago ay inilapat lamang sa dokumentasyong Ingles sa `docs/` folder
- **Pagsasalin**: Ang mga folder ng pagsasalin (`translations/`) ay hindi na-update sa bersyong ito
- **Workshop**: Ang mga materyales ng workshop (`workshop/`) ay hindi na-update sa bersyong ito
- **Mga Halimbawa**: Ang mga file ng halimbawa ay maaaring tumukoy pa rin sa lumang pangalan (aayusin sa mga susunod na update)
- **Mga Panlabas na Link**: Ang mga panlabas na URL at sanggunian sa repositoryo ng GitHub ay hindi nagbago

#### Gabay sa Migrasyon para sa mga Kontribyutor
Kung mayroon kang mga lokal na sanga o dokumentasyon na tumutukoy sa lumang estruktura:
1. I-update ang mga sanggunian ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga sanggunian sa file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Microsoft Foundry" → "Microsoft Foundry"
4. Beripikahin ang lahat ng mga internal na link sa dokumentasyon na gumagana pa rin

---

### [v3.4.0] - 2025-10-24

#### Mga Pagpapahusay sa Preview at Beripikasyon ng Infrastrukturang Azure
**Ipinapakilala ng bersyon na ito ang komprehensibong suporta para sa bagong preview feature ng Azure Developer CLI at pinahusay ang karanasan ng user sa workshop.**

#### Idinagdag
- **🧪 Dokumentasyon ng azd provision --preview na Tampok**: Kumpletong saklaw ng bagong kakayahan sa preview ng imprastruktura
  - Sanggunian ng command at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa gabay sa provisioning na may mga use case at benepisyo
  - Integrasyon ng pre-flight check para sa mas ligtas na beripikasyon ng deployment
  - Mga update sa gabay sa pagsisimula gamit ang safety-first na mga pamamaraan ng deployment
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapahiwatig ng status ng pag-develop ng workshop
  - Disenyong gradient na may mga indicator ng konstruksyon para sa malinaw na komunikasyon sa user
  - Huling updated na timestamp para sa transparency
  - Mobile-responsive na disenyo para sa lahat ng uri ng device

#### Pinahusay
- **Seguridad ng Infrastrukturang Azure**: Preview functionality na isinama sa buong dokumentasyon ng deployment
- **Pre-deployment Validation**: Mga awtomatikong script ay may kasamang infrastructure preview testing
- **Daloy ng Developer**: Na-update ang mga command sequence upang isama ang preview bilang pinakamahusay na praktis
- **Karanasan sa Workshop**: Malinaw na mga inaasahan para sa mga user tungkol sa content development status

#### Nagbago
- **Pinakamahusay na Praktis sa Deployment**: Ang preview-first workflow ay inirerekomenda na ngayon
- **Daloy ng Dokumentasyon**: Ang beripikasyon ng imprastruktura ay inilipat nang mas maaga sa proseso ng pagkatuto
- **Presentasyon ng Workshop**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng pag-develop

#### Pinabuti
- **Safety-First na Pamamaraan**: Ang mga pagbabago sa imprastruktura ay maaaring beripikahin bago ang deployment
- **Pakikipagtulungan ng Koponan**: Ang mga resulta ng preview ay maaaring ibahagi para sa pagsusuri at pag-apruba
- **Kamulatang Pang-gastos**: Mas mahusay na pag-unawa sa mga gastusin sa mga resource bago ang provisioning
- **Pagsugpo sa Panganib**: Nabawasan ang mga pagkabigo sa deployment dahil sa maagang beripikasyon

#### Teknikal na Implementasyon
- **Multi-document Integration**: Naidokumento ang preview feature sa apat na pangunahing file
- **Mga Pattern ng Command**: Konsistent na syntax at halimbawa sa buong dokumentasyon
- **Integrasyon ng Pinakamahusay na Praktis**: Kasama ang preview sa validation workflows at mga script
- **Visual na Mga Indicator**: Malinaw na mga NEW feature markings para madiskubre

#### Infrastrukturang Workshop
- **Komunikasyon ng Status**: Propesyonal na HTML banner na may gradient styling
- **Karanasan ng User**: Malinaw na status ng pag-develop na pumipigil sa kalituhan
- **Propesyonal na Presentasyon**: Pinapanatili ang kredibilidad ng repository habang nagse-set ng mga inaasahan
- **Transparency sa Timeline**: October 2025 na huling update timestamp para sa pananagutan

### [v3.3.0] - 2025-09-24

#### Pinahusay na Materyales sa Workshop at Interaktibong Karanasan sa Pagkatuto
**Ipinapakilala ng bersyon na ito ang komprehensibong mga materyales sa workshop na may mga interactive guide na nakabase sa browser at istrukturadong landas ng pagkatuto.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Browser-based na karanasan sa workshop na may preview capability ng MkDocs
- **📝 Istrukturadong Mga Tagubilin sa Workshop**: 7-hakbang na gabay sa landas ng pagkatuto mula discovery hanggang customization
  - 0-Panimula: Pangkalahatang ideya at setup ng workshop
  - 1-Piliin-ang-AI-Template: Proseso ng pagtuklas at pagpili ng template
  - 2-Beripikahin-ang-AI-Template: Mga pamamaraan sa deployment at beripikasyon
  - 3-Basagin-ang-AI-Template: Pag-unawa sa arkitektura ng template
  - 4-I-configure-ang-AI-Template: Configuration at customization
  - 5-I-customize-ang-AI-Template: Advanced na mga pagbabago at iteration
  - 6-Pag-alis-ng-Imprastruktura: Paglilinis at pamamahala ng resource
  - 7-Pagwawakas: Buod at mga susunod na hakbang
- **🛠️ Workshop Tooling**: MkDocs configuration na may Material theme para sa pinahusay na karanasan sa pagkatuto
- **🎯 Hands-On Learning Path**: 3-hakbang na metodolohiya (Discovery → Deployment → Customization)
- **📱 Integrasyon ng GitHub Codespaces**: Seamless na setup ng development environment

#### Pinahusay
- **AI Workshop Lab**: Pinalawig na may komprehensibong 2-3 oras na istrukturadong karanasan sa pagkatuto
- **Dokumentasyon ng Workshop**: Propesyonal na presentasyon na may navigation at visual aids
- **Pag-unlad ng Pagkatuto**: Malinaw na step-by-step na gabay mula pagpili ng template hanggang produksyon na deployment
- **Karanasan ng Developer**: Integrated tooling para sa streamlined na workflow ng development

#### Pinabuti
- **Accessibility**: Interface na nakabase sa browser na may search, copy functionality, at theme toggle
- **Self-Paced Learning**: Flexible na istruktura ng workshop na tumatanggap sa iba't ibang bilis ng pagkatuto
- **Praktikal na Aplikasyon**: Mga scenario ng deployment ng AI template sa totoong mundo
- **Integrasyon ng Komunidad**: Discord integration para sa suporta at kolaborasyon sa workshop

#### Mga Tampok ng Workshop
- **Built-in na Paghahanap**: Mabilis na paghahanap ng keyword at leksyon
- **Kopyahin ang mga Code Block**: Hover-to-copy functionality para sa lahat ng halimbawa ng code
- **Theme Toggle**: Suporta sa dark/light mode para sa iba't ibang kagustuhan
- **Mga Visual Asset**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Integrasyon ng Tulong**: Direktang akses sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Malawakang Pagbabago ng Navigation at Sistema ng Pagkatuto Base sa Kabanata
**Ipinapakilala ng bersyon na ito ang komprehensibong istruktura ng pagkatuto base sa kabanata na may pinalakas na navigation sa buong repositoryo.**

#### Idinagdag
- **📚 Sistema ng Pagkatuto Base sa Kabanata**: Muling inayos ang buong kurso sa 8 progresibong mga kabanata ng pagkatuto
  - Kabanata 1: Foundation & Quick Start (⭐ - 30-45 minuto)
  - Kabanata 2: AI-First Development (⭐⭐ - 1-2 oras)
  - Kabanata 3: Configuration & Authentication (⭐⭐ - 45-60 minuto)
  - Kabanata 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 oras)
  - Kabanata 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 oras)
  - Kabanata 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 oras)
  - Kabanata 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 oras)
  - Kabanata 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 oras)
- **📚 Komprehensibong Sistema ng Navigation**: Konsistenteng mga header at footer sa navigation sa buong dokumentasyon
- **🎯 Pagsubaybay ng Progreso**: Checklist ng pagkumpleto ng kurso at sistema ng beripikasyon ng pagkatuto
- **🗺️ Gabay sa Landas ng Pagkatuto**: Malinaw na mga entry point para sa iba't ibang antas ng karanasan at mga layunin
- **🔗 Cross-Reference Navigation**: Malinaw na mga link sa mga kaugnay na kabanata at mga prerekwisito

#### Pinahusay
- **Estruktura ng README**: Ginawang istrukturadong learning platform na may organisasyon base sa kabanata
- **Navigation ng Dokumentasyon**: Bawat pahina ay may konteksto ng kabanata at gabay sa progreso
- **Organisasyon ng Template**: Mga halimbawa at template na naka-mapa sa mga angkop na kabanata ng pagkatuto
- **Integrasyon ng Resource**: Cheat sheets, FAQ, at mga gabay sa pag-aaral na naka-konekta sa mga kaukulang kabanata
- **Integrasyon ng Workshop**: Hands-on labs na naka-mapa sa maraming layunin sa pagkatuto ng kabanata

#### Nagbago
- **Pag-usad sa Pagkatuto**: Lumipat mula sa linear na dokumentasyon patungo sa flexible na learning na naka-base sa mga kabanata
- **Paglalagay ng Konfigurasyon**: Inilipat ang configuration guide bilang Kabanata 3 para sa mas maayos na daloy ng pagkatuto
- **Integrasyon ng Nilalaman ng AI**: Mas mahusay na integrasyon ng AI-specific na nilalaman sa buong paglalakbay ng pagkatuto
- **Nilalaman para sa Produksyon**: Pinagsama-samang advanced na mga pattern sa Kabanata 8 para sa mga enterprise na nag-aaral

#### Pinahusay
- **Karanasan ng User**: Malinaw na navigation breadcrumbs at indikasyon ng pag-usad ng kabanata
- **Accessibility**: Pare-parehong navigation patterns para sa mas madaling pagdaan sa kurso
- **Propesyonal na Presentasyon**: Estruktura ng kurso na parang pang-unibersidad na angkop para sa akademiko at corporate training
- **Epektibo sa Pagkatuto**: Nabawasang oras sa paghahanap ng kaugnay na nilalaman sa pamamagitan ng pinabuting organisasyon

#### Teknikal na Implementasyon
- **Mga Navigation Headers**: Standardisadong navigation ng kabanata sa mahigit 40 dokumentong file
- **Footer Navigation**: Konsistenteng gabay sa pag-usad at mga indikasyon ng pagtatapos ng kabanata
- **Cross-Linking**: Komprehensibong internal linking system na nag-uugnay sa magkakaugnay na konsepto
- **Chapter Mapping**: Mga template at halimbawa na malinaw na konektado sa layunin ng pagkatuto

#### Pagpapahusay ng Gabay sa Pag-aaral
- **📚 Komprehensibong Mga Layunin sa Pagkatuto**: Nires-truktura ang study guide upang umayon sa 8-kabanatang sistema
- **🎯 Pagsusuri Batay sa Kabanata**: Bawat kabanata ay may tiyak na mga layunin sa pagkatuto at praktikal na mga gawain
- **📋 Pagsubaybay ng Progreso**: Lingguhang iskedyul ng pagkatuto na may sukat na resulta at checklist ng pagtatapos
- **❓ Mga Tanong sa Pagsusuri**: Mga tanong para sa pagpapatunay ng kaalaman para sa bawat kabanata na may propesyonal na resulta
- **🛠️ Praktikal na Mga Gawain**: Hands-on na aktibidad na may totoong mga senaryo ng deployment at troubleshooting
- **📊 Pag-unlad ng Kasanayan**: Malinaw na pag-angat mula sa mga pangunahing konsepto hanggang sa mga enterprise na pattern na may pokus sa pag-unlad ng karera
- **🎓 Framework ng Sertipikasyon**: Mga resulta ng propesyonal na pag-unlad at sistema ng pagkilala ng komunidad
- **⏱️ Pamamahala ng Timeline**: Structured na 10-linggong plano sa pagkatuto na may validation ng milestones

### [v3.1.0] - 2025-09-17

#### Pinahusay na Multi-Agent AI Solutions
**Pinapabuti ng bersyong ito ang multi-agent retail solution sa pamamagitan ng mas mahusay na pag-pangalan ng ahente at pinahusay na dokumentasyon.**

#### Binago
- **Multi-Agent Terminolohiya**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong multi-agent retail solution para sa mas malinaw na pagkaunawa
- **Arkitektura ng Ahente**: Na-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code upang gamitin ang pare-parehong pangalang "Customer agent"
- **Mga Halimbawa ng Konfigurasyon**: Modernisadong mga pattern ng konfigurasyon ng ahente na may updated na naming conventions
- **Konsistensi ng Dokumentasyon**: Siguradong lahat ng sanggunian ay gumagamit ng propesyonal at deskriptibong pangalan ng ahente

#### Pinahusay
- **Pangkat ng ARM Template**: Na-update ang retail-multiagent-arm-template na may mga sanggunian sa Customer agent
- **Diagram ng Arkitektura**: Na-refresh na mga Mermaid diagrams na may updated na pangalang ahente
- **Mga Halimbawa ng Code**: Mga Python classes at implementasyon na gumagamit ngayon ng CustomerAgent na pangalan
- **Environment Variables**: Na-update ang lahat ng deployment script upang gamitin ang CUSTOMER_AGENT_NAME conventions

#### Pinabuti
- **Karanasan ng Developer**: Mas malinaw na mga papel at responsibilidad ng ahente sa dokumentasyon
- **Kahandaan para sa Produksyon**: Mas mahusay na pag-align sa mga enterprise naming conventions
- **Mga Materyales sa Pagkatuto**: Mas madaling maintindihan na pag-pangalan ng ahente para sa mga pang-edukasyon na layunin
- **Usability ng Template**: Pinadaling pagkaunawa sa mga tungkulin ng ahente at mga pattern ng deployment

#### Teknikal na Detalye
- Na-update ang Mermaid architecture diagrams na may mga sanggunian sa CustomerAgent
- Pinalitan ang mga pangalan ng klaseng CoraAgent ng CustomerAgent sa mga halimbawa ng Python
- Binago ang ARM template JSON configurations upang gamitin ang "customer" na uri ng ahente
- In-update ang mga environment variables mula CORA_AGENT_* patungong CUSTOMER_AGENT_* patterns
- Ni-refresh ang lahat ng deployment commands at container configurations

### [v3.0.0] - 2025-09-12

#### Malalaking Pagbabago - Pokus sa AI Developer at Microsoft Foundry Integration
**Binabago ng bersyong ito ang repository upang maging komprehensibong AI-focused learning resource na may Microsoft Foundry integration.**

#### Nadagdagan
- **🤖 AI-First Learning Path**: Kumpletong restrukturang naka-prayoridad ang mga AI developer at engineer
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa mga serbisyong Microsoft Foundry
- **AI Model Deployment Patterns**: Detalyadong gabay na sumasaklaw sa pagpili ng modelo, konfigurasyon, at mga estratehiya sa production deployment
- **AI Workshop Lab**: 2-3 oras na hands-on na workshop para sa pagpapalit ng AI application sa AZD-deployable na mga solusyon
- **Pinakamahuhusay na Praktis sa Production AI**: Mga pattern para sa enterprise-ready scaling, monitoring, at security ng AI workloads
- **AI-Specific Troubleshooting Guide**: Komprehensibong troubleshooting para sa Microsoft Foundry Models, Cognitive Services, at mga isyu sa AI deployment
- **AI Template Gallery**: Tampok na koleksyon ng Microsoft Foundry templates na may complexity ratings
- **Workshop Materials**: Kumpletong estruktura ng workshop na may hands-on labs at reference materials

#### Pinahusay
- **Estruktura ng README**: Nakatuon sa AI developer na may 45% community interest data mula sa Microsoft Foundry Discord
- **Mga Learning Paths**: Nakalaang AI developer journey kasabay ng tradisyunal na mga landas para sa mga estudyante at DevOps engineer
- **Rekomendasyon ng Template**: Mga tampok na AI template kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Integrasyon ng Komunidad**: Pinalawak na suporta ng Discord community sa AI-specific na mga channel at talakayan

#### Seguridad at Pokus sa Produksyon
- **Managed Identity Patterns**: AI-specific na authentication at security na konfigurasyon
- **Pag-optimize ng Gastos**: Pagsubaybay ng paggamit ng token at kontrol sa budget para sa AI workloads
- **Deployment sa Maramihang Rehiyon**: Mga estratehiya para sa global AI application deployment
- **Pagmomonitor ng Performance**: AI-specific na mga metrics at Application Insights integration

#### Kalidad ng Dokumentasyon
- **Linear na Estruktura ng Kurso**: Lohikal na pag-usad mula sa beginner hanggang sa advanced na mga pattern ng AI deployment
- **Validated na URL**: Lahat ng panlabas na link sa repository ay nasuri at naa-access
- **Kumpletong Sanggunian**: Lahat ng panloob na link ng dokumentasyon ay nasuri at gumagana
- **Handa para sa Produksyon**: Mga pattern ng enterprise deployment na may mga totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Malalaking Pagbabago - Restructure ng Repository at Propesyonal na Pagpapahusay
**Nagpapakita ang bersyong ito ng malaking pagbabago sa estruktura ng repository at presentasyon ng nilalaman.**

#### Nadagdagan
- **Structured Learning Framework**: Lahat ng pahina ng dokumentasyon ay may kasamang Seksyon ng Introduksyon, Mga Layunin sa Pagkatuto, at Mga Resulta ng Pagkatuto
- **Sistema ng Navigation**: Nadagdagang Mga link ng Nakaraang/Susunod na aralin sa buong dokumentasyon para sa gabay sa pag-usad sa pagkatuto
- **Gabay sa Pag-aaral**: Komprehensibong study-guide.md na may mga layunin sa pagkatuto, mga gawaing praktikal, at mga materyales sa pagsusuri
- **Propesyonal na Presentasyon**: Tinanggal ang lahat ng emoji icon para sa pinabuting accessibility at propesyonal na hitsura
- **Pinahusay na Estruktura ng Nilalaman**: Pinabuting organisasyon at daloy ng mga materyales sa pagkatuto

#### Binago
- **Format ng Dokumentasyon**: In-standardize ang lahat ng dokumentasyon na may konsistenteng learning-focused na estruktura
- **Daloy ng Navigation**: Ipinasok ang lohikal na pag-usad sa lahat ng materyales sa pagkatuto
- **Presentasyon ng Nilalaman**: Tinanggal ang mga pandekorasyong elemento para sa malinaw at propesyonal na pag-format
- **Estruktura ng Link**: Na-update ang lahat ng panloob na link para suportahan ang bagong sistema ng navigation

#### Pinahusay
- **Accessibility**: Tinanggal ang mga dependency sa emoji para sa mas mahusay na compatibility sa mga screen reader
- **Propesyonal na Hitsura**: Malinis, istilong akademiko na presentasyon na angkop para sa enterprise learning
- **Karanasan sa Pagkatuto**: Nakaestrukturang pamamaraan na may malinaw na mga layunin at resulta para sa bawat aralin
- **Organisasyon ng Nilalaman**: Mas maayos na lohikal na pagdaloy at koneksyon sa pagitan ng mga kaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Paunang Paglabas - Komprehensibong AZD Learning Repository

#### Nadagdagan
- **Pangunahing Estruktura ng Dokumentasyon**
  - Kumpletong serye ng gabay sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga mapagkukunan para sa troubleshooting at gabay sa debugging
  - Mga kagamitang validasyon bago ang deployment at mga pamamaraan

- **Module ng Pagpapatakbo**
  - AZD Basics: Mga pangunahing konsepto at terminolohiya
  - Installation Guide: Mga tagubilin sa setup ayon sa platform
  - Configuration Guide: Setup ng kapaligiran at authentication
  - Unang Tutorial ng Proyekto: Hakbang-hakbang na hands-on na pagkatuto

- **Module ng Deployment at Provisioning**
  - Deployment Guide: Kumpletong dokumentasyon ng workflow
  - Provisioning Guide: Infrastructure as Code gamit ang Bicep
  - Mga pinakamahusay na kasanayan para sa production deployment
  - Mga pattern ng multi-service architecture

- **Module ng Pre-deployment Validation**
  - Capacity Planning: Pagpapatunay ng availability ng Azure resources
  - SKU Selection: Komprehensibong gabay sa tier ng serbisyo
  - Pre-flight Checks: Automated validation scripts (PowerShell at Bash)
  - Mga kasangkapang pagtantiya ng gastos at pagpaplano ng budget

- **Module ng Troubleshooting**
  - Common Issues: Mga madalas na problema at solusyon
  - Debugging Guide: Sistematikong metodolohiya sa troubleshooting
  - Mga advanced na teknik at kasangkapan para sa diagnosis
  - Pagmomonitor at pag-optimize ng performance

- **Mga Resorses at Sanggunian**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mahahalagang command
  - Glossary: Komprehensibong terminolohiya at mga depinisyon ng akronim
  - FAQ: Mga detalyadong kasagutan sa mga karaniwang tanong
  - Mga panlabas na link sa resources at koneksyon sa komunidad

- **Mga Halimbawa at Template**
  - Simpleng halimbawa ng Web Application
  - Template ng deployment para sa Static Website
  - Konfigurasyon ng Container Application
  - Mga pattern ng database integration
  - Mga halimbawa ng microservices architecture
  - Mga implementasyon ng serverless function

#### Mga Tampok
- **Suporta sa Maramihang Platform**: Mga gabay sa instalasyon at konfigurasyon para sa Windows, macOS, at Linux
- **Iba-ibang Antas ng Kasanayan**: Nilalaman na dinisenyo para sa mga estudyante hanggang sa mga propesyonal na developer
- **Praktikal na Pokus**: Hands-on na mga halimbawa at totoong senaryo
- **Komprehensibong Saklaw**: Mula sa mga pangunahing konsepto hanggang sa advanced na mga enterprise pattern
- **Pokus sa Seguridad**: Mga pinakamahusay na kasanayan sa seguridad na isinama sa kabuuan
- **Pag-optimize ng Gastos**: Gabay para sa cost-effective na deployment at pamamahala ng mga resources

#### Kalidad ng Dokumentasyon
- **Detalyadong Halimbawa ng Code**: Praktikal at nasubukang mga sample ng code
- **Hakbang-hakbang na Instruksyon**: Malinaw at madaling sundan na mga gabay
- **Komprehensibong Paghawak ng Error**: Mga troubleshooting para sa mga karaniwang problema
- **Integrasyon ng Pinakamahuhusay na Praktis**: Mga pamantayan at rekomendasyon sa industriya
- **Kompatibilidad ng Bersyon**: Napapanahon sa mga pinakabagong Azure services at azd features

## Mga Nakaplanong Hinaharap na Pagpapahusay

### Bersyon 3.1.0 (Nakaplanong)
#### Pagpapalawak ng AI Platform
- **Suporta sa Maramihang Modelo**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at custom na mga modelo
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen na deployment
- **Advanced RAG Patterns**: Mga opsyon sa vector database bukod pa sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinahusay na monitoring para sa performance ng modelo, paggamit ng token, at kalidad ng tugon

#### Karanasan ng Developer
- **VS Code Extension**: Integrated na karanasan sa pag-develop ng AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-assisted na pag-generate ng AZD template
- **Interactive Tutorials**: Hands-on coding exercises na may automated validation para sa mga senaryo ng AI
- **Video Content**: Mga pang-supplement ng video tutorial para sa mga visual learner na nakatuon sa AI deployment

### Bersyon 4.0.0 (Nakaplanong)
#### Mga Enterprise AI Pattern
- **Governance Framework**: Pamamahala, pagsunod, at audit trails para sa AI modelo
- **Multi-Tenant AI**: Mga pattern para pagsilbihan ang maraming customer na may isolated na AI services
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga pattern ng multi-cloud at hybrid na deployment para sa AI workloads

#### Advanced na Mga Tampok
- **AI Pipeline Automation**: MLOps integration gamit ang Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust na mga pattern, private endpoints, at advanced threat protection
- **Pag-optimize ng Performance**: Advanced tuning at scaling strategies para sa AI application na may mataas na throughput
- **Global Distribution**: Content delivery at edge caching patterns para sa AI applications

### Bersyon 3.0.0 (Nakaplanong) - Napalitan ng Kasalukuyang Bersyon
#### Mga Inaalok na Nadagdag - Ngayon ay Naipatupad na sa v3.0.0
- ✅ **AI-Focused na Nilalaman**: Komprehensibo na Microsoft Foundry integration (Natapos)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Natapos)
- ✅ **Advanced Security Module**: AI-specific na security pattern (Natapos)
- ✅ **Pag-optimize ng Performance**: Mga estratehiya sa pag-tune ng AI workload (Natapos)

### Bersyon 2.1.0 (Nakaplanong) - Bahagyang Naipatupad sa v3.0.0
#### Mga Maliit na Pagpapahusay - Ang ilan ay Natapos na sa Kasalukuyang Bersyon
- ✅ **Karagdagang Halimbawa**: AI-focused na mga senaryo ng deployment (Natapos)
- ✅ **Pinalawak na FAQ**: Mga tanong at troubleshooting na AI-specific (Natapos)
- **Integrasyon ng Kasangkapan**: Pinalawak na mga gabay para sa IDE at editor integration
- ✅ **Pagpapalawak ng Monitoring**: AI-specific na mga pattern ng monitoring at alerting (Natapos)

#### Nakalaan Pa rin para sa Hinaharap na Bersyon
- **Mobile-Friendly na Dokumentasyon**: Responsive design para sa pagkatuto gamit ang mobile
- **Offline Access**: Mga pwedeng i-download na package ng dokumentasyon
- **Pinahusay na Integrasyon ng IDE**: VS Code extension para sa AZD + AI workflows
- **Dashboard ng Komunidad**: Real-time na metrics ng komunidad at pagsubaybay sa kontribusyon

## Pagsusumite para sa Changelog

### Pagsusumite ng mga Pagbabago
Kapag nagsusumite sa repository na ito, mangyaring tiyakin na ang mga entry sa changelog ay may kasamang:

1. **Bersyon**: Sumusunod sa semantic versioning (major.minor.patch)
2. **Petsa**: Petsa ng pag-release o update sa format na YYYY-MM-DD
3. **Kategorya**: Nadagdag, Binago, Deprecated, Tinanggal, Naayos, Seguridad
4. **Malinaw na Paglalarawan**: Concise na paglalarawan ng mga pagbabagong ginawa
5. **Pagtatasa ng Epekto**: Paano maaapektuhan ng mga pagbabago ang mga kasalukuyang user

### Mga Kategorya ng Pagbabago

#### Nadagdag
- Mga bagong tampok, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o learning resources
- Mga karagdagang kasangkapan, script, o utility

#### Binago
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga update para mapabuti ang kalinawan o katumpakan
- Pagbabago sa estruktura ng nilalaman o organisasyon

#### Deprecated
- Mga tampok o pamamaraan na unti-unting tinatanggal
- Mga seksyon ng dokumentasyon na nakatakdang alisin
- Mga metodo na may mas mahusay na alternatibo

#### Tinanggal
- Mga tampok, dokumentasyon, o halimbawa na hindi na akma
- Mga lipas na impormasyon o deprecated na pamamaraan
- mga nilalaman na dobleng o pinagsama

#### Naayos
- Mga koreksyon sa mga error sa dokumentasyon o code
- Pagresolba ng mga iniulat na isyu o problema
- Mga pagpapabuti sa katumpakan o functionality

#### Seguridad
- Mga pagpapabuti o pag-aayos na may kaugnayan sa seguridad
- Mga update sa pinakamahuhusay na kasanayan sa seguridad
- Pagresolba ng mga kahinaan sa seguridad

### Mga Patnubay sa Semantic Versioning

#### Major Version (X.0.0)
- Mga pagbabagong malaki na nangangailangan ng aksyon ng gumagamit
- Malaking pagbabago sa istruktura ng nilalaman o organisasyon
- Mga pagbabago na binabago ang pangunahing pamamaraan o metodolohiya

#### Minor na Bersyon (X.Y.0)
- Mga bagong tampok o karagdagan ng nilalaman
- Mga pagpapahusay na nananatiling compatible sa nakaraang bersyon
- Karagdagang mga halimbawa, kasangkapan, o mga mapagkukunan

#### Patch na Bersyon (X.Y.Z)
- Pag-aayos ng bug at mga koreksyon
- Maliit na mga pagpapabuti sa umiiral na nilalaman
- Mga paglilinaw at maliit na mga pagpapahusay

## Mga Feedback at Mungkahi mula sa Komunidad

Aktibo naming hinihikayat ang feedback mula sa komunidad upang mapabuti ang mapagkukunan na ito sa pag-aaral:

### Paano Magbigay ng Feedback
- **GitHub Issues**: I-report ang mga problema o magmungkahi ng mga pagpapabuti (malugod ang mga isyu tungkol sa AI)
- **Discord Discussions**: Ibahagi ang mga ideya at makipag-ugnayan sa komunidad ng Microsoft Foundry
- **Pull Requests**: Mag-ambag ng direktang mga pagpapabuti sa nilalaman, lalo na sa mga template at gabay ng AI
- **Microsoft Foundry Discord**: Lumahok sa #Azure channel para sa mga diskusyon tungkol sa AZD + AI
- **Community Forums**: Lumahok sa mas malawak na mga diskusyon ng mga developer ng Azure

### Mga Kategorya ng Feedback
- **Katumpakan ng Nilalaman ng AI**: Mga koreksyon sa impormasyon tungkol sa integrasyon at deployment ng serbisyo ng AI
- **Karanasan sa Pag-aaral**: Mga mungkahi para sa mas magandang daloy ng pag-aaral para sa mga AI developer
- **Kulang na Nilalaman ng AI**: Mga kahilingan para sa karagdagang mga template, pattern, o halimbawa ng AI
- **Accessibility**: Mga pagpapahusay para sa iba't ibang pangangailangan sa pag-aaral
- **Integrasyon ng AI Tool**: Mga mungkahi para sa mas mahusay na integrasyon ng workflow sa pag-develop ng AI
- **Mga Pattern sa Production AI**: Mga kahilingan para sa enterprise AI deployment patterns

### Pagtatalaga ng Tugon
- **Tugon sa Isyu**: Sa loob ng 48 oras para sa mga nai-ulat na problema
- **Mga Kahilingan sa Tampok**: Pagsusuri sa loob ng isang linggo
- **Mga Ambag mula sa Komunidad**: Rebisyon sa loob ng isang linggo
- **Mga Isyu sa Seguridad**: Prayoridad kaagad na may pinabilis na tugon

## Iskedyul ng Pagpapanatili

### Regular na Mga Update
- **Buwanang Review**: Pagsusuri sa katumpakan ng nilalaman at bisa ng mga link
- **Quarterly Updates**: Malalaking karagdagan at pagpapabuti ng nilalaman
- **Semi-Annual Reviews**: Komprehensibong muling pag-aayos at pagpapahusay
- **Taunang Paglabas**: Mga malaking pag-update ng bersyon na may makabuluhang mga pagpapabuti

### Pagmamanman at Pagsigurado ng Kalidad
- **Automated Testing**: Regular na pagsusuri ng mga halimbawa ng code at mga link
- **Pagsasama ng Feedback ng Komunidad**: Regular na pagsasama ng mga mungkahi ng gumagamit
- **Mga Update sa Teknolohiya**: Pagsunod sa pinakabagong serbisyo ng Azure at mga release ng azd
- **Accessibility Audits**: Regular na pagsusuri para sa inklusibong mga prinsipyo sa disenyo

## Patakaran sa Suporta sa Bersyon

### Kasalukuyang Suporta sa Bersyon
- **Pinakabagong Pangunahing Bersyon**: Buong suporta na may regular na mga update
- **Nakaraang Pangunahing Bersyon**: Mga update sa seguridad at mga critical na pag-aayos para sa 12 buwan
- **Mga Legacy Bersyon**: Suporta lang mula sa komunidad, walang opisyal na mga update

### Gabay sa Migrasyon
Kapag inilalabas ang mga pangunahing bersyon, nagbibigay kami ng:
- **Mga Gabay sa Migrasyon**: Hakbang-hakbang na mga tagubilin sa paglipat
- **Mga Tala sa Compatibility**: Mga detalye tungkol sa mga pagbabago na pumipinsala sa compatibility
- **Suporta sa Kasangkapan**: Mga script o utilities para tumulong sa migrasyon
- **Suporta mula sa Komunidad**: Nakatuong forum para sa mga tanong tungkol sa migrasyon

---

**Pag-navigate**
- **Nakaraang Aralin**: [Study Guide](resources/study-guide.md)
- **Susunod na Aralin**: Bumalik sa [Main README](README.md)

**Maging Updated**: I-watch ang repository na ito para sa mga abiso tungkol sa mga bagong release at mahahalagang update sa mga materyales sa pag-aaral.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
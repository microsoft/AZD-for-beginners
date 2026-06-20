# ပြောင်းလဲမှု မှတ်တမ်း - AZD စတင်သင်ယူသူများအတွက်

## မိတ်ဆက်

ဒီ ပြောင်းလဲမှု မှတ်တမ်းမှာ AZD For Beginners repository အတွက် အဖော်ပြသော ပြောင်းလဲမှုများ၊ အပ်ဒိတ်များနှင့် တိုးတက်မှုများကို အကုန်လုံး မှတ်တမ်းတင်ထားသည်။ ကျွန်တော်တို့သည် semantic versioning အချက်စနစ်ကို လိုက်နာပြီး ဗားရှင်းများအကြား ဘာတွေပြောင်းလဲသွားသည်ကို အသုံးပြုသူများနားလည်နိုင်စေရန် ဒီမှတ်တမ်းကို ထိန်းသိမ်းထားသည်။

## လေ့လာရေး ရည်မှန်းချက်များ

ဒီ ပြောင်းလဲမှုမှတ်တမ်းကို ကြည့်ရှုခြင်းဖြင့် သင်သည်-
- အသစ်ထည့်ထားသော ဖျော်ဖြေချက်များနှင့် အကြောင်းအရာများအကြောင်း အသိပညာရရှိမည်
- ရှိပြီးသား စာတမ်းများတွင် ပြုလုပ်ထားသော တိုးတက်မှုများကို နားလည်နိုင်မည်
- အမှားပြင်ဆင်ချက်များကို ထိန်းကြည့်၍ တိကျမှုကို အာမခံနိုင်မည်
- သင်ယူရေး အရင်းအမြစ်များ၏ ဖွံ့ဖြိုးတိုးတက်မှုကို အချိန်နှင့်တကြ လေ့လာနိုင်မည်

## လေ့လာပြီးရရှိမည့် အကျိုးရလဒ်များ

ပြောင်းလဲမှုမှတ်တမ်း အကြောင်းအရာများကို ကြည့်ရှုပြီးနောက် သင်သည်-
- သင်ယူရန် အသစ်ထည့်ထားသော အကြောင်းအရာများနှင့် ရင်းမြစ်များကို ဖော်ထုတ်နိုင်မည်
- မည်သည့် အပိုင်းများကို ထပ်မံ အပ်ဒိတ်/တိုးတက်မှု ဖြစ်ပေါ်ခဲ့သည်ကို သိရှိနိုင်မည်
- အခေတ်စာအရ အကြောင်းအရာများကို ကိုက်ညီစွာ သင်ယူရန် လမ်းစဉ်ကို စီစဉ်နိုင်မည်
- မှတ်ချက်များနှင့် အကြံပြုချက်များကို အနာဂတ်တိုးတက်မှုများအတွက် ပံ့ပိုးပေးနိုင်မည်

## ဗားရှင်းမှတ်တမ်း

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**ဒီ ဗားရှင်းက azd-coverage ဆန်းစစ်မှုမှ ဖော်ထုတ်သေးသော အလယ်ကြားကိစ္စများကို ပိတ်သိမ်းပေးပါသည်။ ၎င်းတွင် မိမိ template ကို စာတမ်းရေးခြင်းနှင့် ဖြန့်ချိခြင်း၊ ထပ်တူထပ်မျှ dev-container/Codespaces ပတ်ဝန်းကျင်များ၊ Pulumi infrastructure provider၊ Azure DevOps CI/CD လမ်းပြ၊ service-principal authentication၊ host-selection လမ်းညႊန်ချက်များ (AKS/Spring Apps)، `azd restore`/`azd package` ရှင်းလင်းချက်များ၊ hook error-handling နှင့် အသင်း/မျှဝေထားသော ပတ်ဝန်းကျင်လုပ်ဆောင်ချက်များ ပါဝင်သည်။**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — မိမိရဲ့ azd template ကို ရေးသားပုံ: လိုအပ်သော ဖွဲ့စည်းပုံ (`azure.yaml`, `infra/`, `src/`), `metadata.template` ကွက်တိ, `uniqueString()` resource token နဲ့ `azd-env-name` tag ဖြင့် infrastructure ကို parameterize ချရေးခြင်း, `azd init --template <local-path>` နဲ့ လိုကယ်လီစမ်းသပ်ခြင်း, GitHub တွင် ပုံနှိပ်ပြသခြင်း နှင့် Awesome AZD gallery သို့ တင်သွင်းနည်း
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers နှင့် GitHub Codespaces အသုံးပြု၍ ပြန်လည်ထပ်တူထပ်မျှ azd ပတ်ဝန်းကျင်များ ဖန်တီးခြင်း: တစ်ခုချင်း `.devcontainer/devcontainer.json` အနည်းဆုံး သတ်မှတ်ချက် (official `ghcr.io/azure/azure-dev/azd` feature ကို အသုံးပြုထားခြင်း), ဘာသာစကားအလိုက် features များ, container host များအတွက် `docker-in-docker`, နှင့် remote sign-in အတွက် `azd auth login --use-device-code`
- **🧩 Pulumi with azd** အပိုင်း `docs/chapter-04-infrastructure/provisioning.md` မှာ — `infra.provider: pulumi`, Pulumi ဖိုလ်ဒါဖွဲ့စည်းပုံ, stacks တွေကို azd environments နှင့် တွဲမြှပ်ပေးခြင်း, လိုအပ်သော outputs/tagging, နှင့် `azd up` / `azd down` workflow တူညီမှု
- **🎯 Host-selection guidance** `docs/chapter-04-infrastructure/provisioning.md` မှာ — Beginner မိတ်ဆက်အဆင့် ဖြင့် `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, နှင့် `springapp` များကို နှိုင်းယှဉ်ပြီး AKS သို့ Azure Spring Apps ကို ဘယ်အခါရွေးချယ်ရမည်ကို လမ်းညွှန်ချက်ပေးခြင်း
- **🛠️ Azure DevOps CI/CD walkthrough** `docs/chapter-08-production/production-ai-practices.md` မှာ — `azd pipeline config --provider azdo`, workload identity federation (OIDC) ဖြင့် service connection, ပြုလုပ်ပေးသော `azure-dev.yml`, နှင့် variable-group တပ်ဆင်ခြင်း
- **🔑 Service Principals (Pattern 4)** `docs/chapter-03-configuration/authsecurity.md` ထဲသို့ ထည့်သွင်း — `az ad sp create-for-rbac`, non-interactive `azd auth login` ကို client secret နှင့် federated/OIDC credentials ဖြင့် အသုံးပြုခြင်း, ဘယ်အခါအသုံးပြုရမည်နှင့် credential များကို လုံခြုံစွာ သိမ်းဆည်းပုံ
- **🪝 Hook error-handling** အပိုဒ်အငယ် `docs/chapter-04-infrastructure/deployment-guide.md` မှာ — exit codes နှင့် `set -e`, `continueOnError`, `azd hooks run` နဲ့ hooks ကို တစ်ခုချင်းစီစမ်းသပ်ခြင်း, OS-specific shells, နှင့် `--debug`
- **👥 Team / shared environments** အပိုင်း `docs/chapter-03-configuration/configuration.md` မှာ — `.azure/` ထဲမှာ ဘာတွေထားရမည်၊ ဘာတွေကို gitignore ထားရမည်၊ တစ်ဦးချင်း developer ပတ်ဝန်းကျင်များ၊ `azd env list`/`select`, CI/CD ထဲတွင် environment တန်ဖိုးများ ပေးပို့ပုံ
- **🧰 `azd restore` and expanded `azd package`** ရှင်းလင်းချက်များ `resources/cheat-sheet.md` မှာ — dependency များကို ပြန်လည်ထည့်သွင်းခြင်းနှင့် deploy မလုပ်ဘဲ deployable artifact တစ်ခုကို build ပြုလုပ်နည်း

#### Changed
- **🧭 Chapter 4 lessons table** ကို "Authoring Your Own Template" သင်ခန်းစာအသစ် (Lesson 3) ဖြင့် အပ်ဒိတ်ပြုလုပ်ထားသည်
- **🧭 Chapter 1 lessons table** ကို "Dev Containers & Codespaces" သင်ခန်းစာအသစ် (Lesson 5) ဖြင့် အပ်ဒိတ်ပြုလုပ်ထားသည်; `bring-your-own-app.md` နှင့် `dev-containers.md` အကြား navigation footer များ ချိတ်ဆက်ထားသည်

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**ဒီဗားရှင်းက မစတင်သင်ယူသူများအတွက် လုံးဝ ပြည့်စုံတဲ့ လမ်းပြလမ်းညွှန်အတွက် အကြီးမားဆုံး ကိစ္စများကို ပိတ်သိမ်းပေးသည်။ ၎င်းတွင် နှစ်သင်ခန်းစာ သုံးသပ်မှု (deploy လုပ်နိုင်သော multi-agent walkthrough နှင့် ရှိပြီးသား app တစ်ခုတွင် azd ထည့်ခြင်း), beginner-friendly hooks မိတ်ဆက်, Terraform-with-azd အပိုင်း, GitHub Actions pipeline လမ်းလျှောက် အဆင့်လိုက် လမ်းပြချက်, အသစ်ပြသနေသော preview extensions အတွက် အဓိပ္ပာယ်ရှင်းလင်းချက်, နှင့် deployment သက်သေစစ်ဆေးရေး စစ်တမ်းစာရင်းတို့ ပါဝင်သည်။**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — လက်တွေ့ အလေ့အကျင့်စိတ်တိုင်းမကျသော deploy လုပ်နိုင်သော two-agent walkthrough တစ်ခု (orchestrator + specialists) ကို real template (`contoso-creative-writer`) အသုံးပြု၍ ဖော်ပြထားသည်၊ multi-agent ကို ဘယ်အချိန် အသုံးချရမည်၊ `azd up` workflow, deployed resources များကိုနားလည်ခြင်း, agent အလယ်မှတ်စုများအလျှောက် tracing, custom မွမ်းမံခြင်း နှင့် cleanup အဆင့်များကို ဖော်ပြထားသည်
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — `azd init` ဖြင့် ရှိပြီးသား project ထဲသို့ azd ထည့်သွင်းနည်း ("use code in the current directory"), `azure.yaml` နှင့် `infra/` ကို နားလည်ခြင်း, `azd infra generate`, host detection, နှင့် `azd up` ဖြင့် deploy လုပ်နည်း
- **🌐 Terraform with azd** အပိုင်း `docs/chapter-04-infrastructure/provisioning.md` ထည့်သွင်း — `infra.provider: terraform` config, `.tf` ဖိုလ်ဒါဖွဲ့စည်းပုံ, လိုအပ်သော `AZURE_*` outputs နှင့် `azd-env-name` tagging, နှင့် `azd up` / `azd down` workflow တူညီမှု (Terraform ကို ရည်ညွှန်းပေမယ့် Bicep ပဲ ဖော်ပြထားခဲ့သော အခက်အခဲကို ဖြေရှင်း)
- **⚙️ Step-by-step GitHub Actions walkthrough** `docs/chapter-08-production/production-ai-practices.md` မှာ — GitHub repo မှ အလိုအလျောက် deploy များထိ ရောက်အောင်: `azd pipeline config`, OIDC federated credentials (သိုလှောင်ထားသော secret မလို), ပြုလုပ်ပေးသည့် `azure-dev.yml`, နှင့် secrets-vs-variables လမ်းညွှန်ချက်
- **🪝 Beginner "New to hooks?" introduction** `docs/chapter-04-infrastructure/deployment-guide.md` မှာ — hook ဆိုတာဘာလဲ၊ hook-stage ဇယား၊ အနည်းဆုံးမူလ hook တစ်ခု၊ `azd hooks run` ဖြင့် hooks ကို လက်စမ်းပြုလုပ်နည်း
- **✅ "Verify Your Deployment" checklist** ကို `docs/chapter-01-foundation/first-project.md` ၏ Step 5 တွင် ထည့်သွင်း — smoke test, health-endpoint စစ်ဆေးခြင်း, နှင့် အောင်မြင်မှု၏ ထိထိရောက်ရောက် ချက်များ
- **🧩 New preview extensions** `azure.ai.skills` နှင့် `azure.ai.connections` အတွက် ရှင်းလင်းချက်များ (`docs/chapter-08-production/production-ai-practices.md`) — ၎င်းတို့က ဘာလဲ၊ အဘယ်အချိန် မျှော်လင့်သင့်လဲ

#### Changed
- **🧭 Chapter 5 lessons table** ထိန်းသိမ်းပြုပြင်ခြင်း: `multi-agent-basics.md` သည် ယခု Lesson 1 ဖြစ်သည် (တစ်ခုတည်း လက်တွေ့လုပ်ဆောင်နိုင်သော သင်ခန်းစာ), Lesson 2 သည် Chapter 6 တွင် တည်ရှိသည်၊ Retail scenario သည် architecture blueprint တစ်ခုဖြစ်ပြီး one-command template မဟုတ်ကြောင်း တရားဝင် မှတ်သားပြန်ပြော
- **🧭 Chapter 1 lessons table** တွင် "Bring Your Own App" သင်ခန်းစာအသစ် (Lesson 4) ထည့်သွင်း
- **🔗 Navigation footers** အပ်ဒိတ်: `first-project.md` မှ `bring-your-own-app.md` သို့ ရှေ့ဆက်လင့်ခ် ထည့်သွင်း

#### Fixed
- **🧱 "claimed but missing" Terraform gap ကို ပိတ်သိမ်း** — သင်တန်းသည် ယခင်က Terraform ကို ရည်ညွှန်းခဲ့သော်လည်း ပြသမှု မရှိခြင်းကို ဖြေရှင်း
- **🔀 Chapter 5 cross-links မမှန်ကန်မှုကို ပြင်ဆင်** — မမှန်ကန်စွာ full multi-agent implementation ရှိကြောင်း ဖော်ပြထားသော လင့်ခ်များကို မှန်ကန်အောင်ပြုပြင်

#### Files Updated
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

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**ဒီဗားရှင်းက ကိုးကားထားသော `azd` `1.25.6` (June 2026) နှင့် `azure.ai.agents` `0.1.40-preview` extension အပေါ်မှာ သက်မှတ်ပြန်လည်စစ်ဆေးပေးပြီး AI အကြံပြုချက်များကို "agent ကို scaffold စတင်လုပ်ခြင်း" ထက် တစ်လျှောက်လုံး agent lifecycle (test → evaluate → optimize → inspect → delete) အား ဖော်ပြပေးသည်၊ အသစ် `azure.ai.skills` နှင့် `azure.ai.connections` preview extensions များကို ဖော်ထုတ်ပေးပြီး ".NET Aspire" → "Aspire" အမည်ပြောင်းမှုကို မှတ်ချက်ပေးသည်။**

#### Added
- **🔁 Full agent lifecycle coverage** ကို beginner များနှင့် AI engineer များအတွက် စာတမ်းများတွင် ကာလအလိုက် ဖော်ပြ:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle ဇယား (scaffold → test → measure → improve → inspect → clean up) ကို Extensions နှင့် AI Commands အပိုင်းထဲ ထည့်သွင်း
  - `docs/chapter-08-production/production-ai-practices.md` — "Managing the Agent Lifecycle" အပိုင်းအသစ်: `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, နှင့် `delete --force` ကို ဖော်ပြ
  - `resources/cheat-sheet.md` — AI Agent Commands ကို `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, နှင့် `delete --force` ဖြင့် တိုးချဲ့ဖော်ပြ
- **🧩 New preview extensions** အဖြစ် `azure.ai.skills` (reuse-able agent skills) နှင့် `azure.ai.connections` (Foundry connections) ကို extensions ဇယားနှင့် cheat sheet ထဲသို့ ထည့်သွင်း
- **⏱️ Response-timing guidance** — `azd ai agent invoke` ဥပမာများတွင် total latency နှင့် time-to-first-byte ကို ထုတ်ပြောသည်ဟု မှတ်ချက်ထည့်
- **📌 Version banner** ကို root README တွင် ထည့်သွင်း၍ သင်ယူသူများအား `azd version` နှင့် `azd upgrade` ကို အလျင်အမြန် စမ်းကြည့်စေ

#### Changed
- **✅ Validation baseline ကို အပ်ဒိတ်** — `azd 1.23.12` (March 2026) မှ `azd 1.25.6` (June 2026) သို့ အားလုံး chapter README များနှင့် workshop စာတမ်းများတွင် ပြင်ဆင်
- **🤖 Chapter 2 extension မှတ်ချက်** ကို `azure.ai.agents` `0.1.18-preview` မှ `0.1.40-preview` သို့ အပ်ဒိတ်
- **🧪 Workshop validation ဥပမာ** (`azd version` output) ကို `1.25.6` သို့ အပ်ဒိတ်
- **🧭 README "What's New in azd Today"** ကို ပြန်လည်ဆန်းစစ်၍ အပြီးအစီး agent lifecycle, အသစ် AI extensions, နှင့် နောက်ဆုံးပေါ် quality-of-life ပြင်ဆင်ချက်များ (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt) ကို ထိရောက်စေ
- **📖 Chapter 2 agents.md (Option 4)** မှာလည်း learners များအား post-deploy lifecycle commands များသို့ ဦးတည်ရန် ပြောင်းလဲပြောကြား

#### Fixed
- **🏷️ Product naming** — Aspire အမည်ပြောင်းမှုကို မှတ်ချက်ထည့် (".NET Aspire" ကို ယခုမှ "Aspire" ဟု ခေါ်ဆို)；azd ၏ Aspire ထောက်ပံ့မှုမှာ မပြောင်းလဲထား
- **🔎 Live release validation** — Azure Developer CLI release feed ကိုအခြေခံ၍ stable CLI `1.25.6` (2026-06-12) နှင့် `azure.ai.agents` `0.1.40-preview` (2026-06-15) တို့နှင့် ကိုက်ညီမှုကို စစ်ဆေးအတည်ပြု

#### Files Updated
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
#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**ဤဗားရှင်းသည် AZD 1.23 အတည်ပြုစစ်ဆေးမှုအပြီး လူငယ်စတင်သူများအတွက် စာရွက်စာတမ်းအား သေချာစေရန် ပြန်လည်ပြင်ဆင်ထားသော မူကွဲဖြစ်သည်။ ၎င်းတွင် AZD-ကို ဦးစားပေးသော အတည်ပြုလမ်းညွှန်ချက်များကို ပိုမိုရှင်းလင်းစေပြီး၊ ဒေသီယယ် စက်ဆင့်စစ်ဆေးရေး စာချုပ်များ ထည့်သွင်းထားကာ အဓိက အမိန့်များကို ပတ်သက်သမျှ AZD CLI နှင့် ဂောင်းကန်စစ်ဆေးပြီး အပြီးသတ် အမိန့် ရှင်းလင်းမှုများ (changelog ပြင်ပရှိ အင်္ဂလိပ်မူရင်း အမိန့်များကို ဖျက်ခြင်း) ကို လုပ်ဆောင်ထားသည်။**

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

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**ဤဗားရှင်းသည် `azd` `1.23.12` အပေါ် စာရွက်စာတမ်းအတည်ပြုစစ်ဆေးမှုကို ပြုလုပ်ပြီး၊ သက်ဆိုင်ရာ AZD အမိန့်ဥပမာများကို အပ်ဒိတ်လုပ်ထားကာ AI မော်ဒယ် လမ်းညွှန်ချက်များကို လက်ရှိ မည်သည့် defaults များနှင့် ကိုက်ညီစေရန် ပြန်လည်သတ်မှတ်ထားသည်။ ထို့အပြင် workshop လက်တွေ့လေ့ကျင့်မှုများကို GitHub Codespaces အပြင် dev containers နှင့် local clones များတွင်လည်း ထောက်ပံ့နိုင်အောင် ဖေါ်ပြထားသည်။**

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

#### AZD AI CLI Commands, Content Validation & Template Expansion
**ဤဗားရှင်သည် `azd ai`, `azd extension`, နှင့် `azd mcp` အမိန့်များကို AI ဆိုင်ရာ အတွင်းပိုင်း အခန်းများသို့ ထည့်သွင်းပေးပြီး agents.md တွင်ချိုးနေရသော လင့်ခ်များနှင့် အဟောင်းကုဒ်များကို ပြင်ဆင်ထားသည်။ ထို့အပြင် cheat sheet ကို အပ်ဒိတ်လုပ်ပြီး Example Templates အပိုင်းကို တိုးချဲ့ ပြန်လည်ဖော်ပြထားသည်။**

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
#### သင်တန်း လမ်းကြောင်း တိုးတက်မှု
**ဒီဗားရှင်းမှာ README.md အခန်းများ ရှာဖွေရေးကို မြှင့်တင်ဖို့ တိုးတက်လာတဲ့ ဇယားပုံစံနဲ့ တိုးမြှင့်ထားပါတယ်။**

#### ပြောင်းလဲချက်များ
- **Course Map ဇယား**: တန်းတိုက် သင်ခန်းစာလင့်ခ်များ၊ ကြာချိန် ခန့်မှန်းချက်များ နှင့် ခက်ခဲမှု အဆင့်များဖြင့် တိုးမြှင့်ထားသည်။
- **Folder Cleanup**: ရှုပ်ထွေးပြီး မလိုအပ်သော အဟောင်းဖိုလ်ဒါများကို ဖယ်ရှားခဲ့သည် (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Course Map ဇယားထဲရှိ အတွင်းလင့်ခ် 21+ ခုအားလုံးကို စစ်ဆေးပြီး အတည်ပြုခဲ့သည်။

### [v3.16.0] - 2026-02-05

#### ထုတ်ကုန် အမည် အပ်ဒိတ်များ
**ဒီဗားရှင်းသည် ထုတ်ကုန်ကို Microsoft အမှတ်တံဆိပ် လက်ရှိအမှတ်တံဆိပ်နာမည်အတိုင်း ပြောင်းလဲထားသည်။**

#### ပြောင်းလဲခဲ့သည်
- **Microsoft Foundry → Microsoft Foundry**: ဘာသာပြန်ထားသော ဖိုင်များမှ မဟုတ်သော ဖိုင်များတွင် ရည်ညွှန်းချက်များအားလုံးကို အပ်ဒိတ်လုပ်ခဲ့သည်။
- **Azure AI Agent Service → Foundry Agents**: လက်ရှိ အမှတ်တံဆိပ်နာမည်နှင့် ကိုက်ညီရန် ဝန်ဆောင်မှု အမည်ကို ပြောင်းလဲထားသည်။

#### ဖိုင်များ အပ်ဒိတ်
- `README.md` - သင်တန်းပင်မ လက်ခံ စာမျက်နှာ
- `changelog.md` - ဗားရှင်းမှတ်တမ်း
- `course-outline.md` - သင်တန်း ဖွဲ့စည်းပုံ
- `docs/chapter-02-ai-development/agents.md` - AI အေးဂျင့် လမ်းညွှန်
- `examples/README.md` - ဥပမာများ အထောက်အထား
- `workshop/README.md` - Workshop မူလ ဝင်စာမျက်နှာ
- `workshop/docs/index.md` - Workshop အညွှန်း
- `workshop/docs/instructions/*.md` - Workshop အညွှန်းဖိုင်များအားလုံး

---

### [v3.15.0] - 2026-02-05

#### မဟာ ပြုပြင်ပြောင်းလဲမှု - အခန်းအလိုက် ဖိုလ်ဒါ အမည်များ
**ဒီဗားရှင်းသည် စာတမ်းများကို ပိုမိုရှင်းလင်းစေရန် အခန်း သီးသန့် ဖိုလ်ဒါများအဖြစ် ပြန်လည်ဖွဲ့စည်းထားသည်။**

#### ဖိုလ်ဒါ အမည် ပြောင်းလဲချက်များ
အဟောင်းဖိုလ်ဒါများကို အခန်းနံပါတ် ထည့်သတ်ထားသော ဖိုလ်ဒါများဖြင့် အစားထိုးထားသည်။
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### ဖိုင်များ ပြောင်းရွှေ့ခြင်း
| ဖိုင် | မူလနေရာ | သို့ ပြောင်းရွှေ့ |
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

#### ထည့်သွင်းခဲ့သည်
- **📚 အခန်း README ဖိုင်များ**: အခန်းတိုင်းဖိုလ်ဒါတွင် README.md ဖိုင်များကို ဖန်တီးထားပြီး အောက်ပါအချက်များ ပါဝင်သည်။
  - သင်ယူရန် ရည်ရွယ်ချက်များနှင့် ကြာချိန်
  - ဖော်ပြချက်ပါ သင်ခန်းစာ ဇယား
  - အမြန် စတင်ရန် အမိန့်များ
  - အခြား အခန်းများသို့ ရှာဖွေရန် လမ်းကြောင်း

#### ပြောင်းလဲခဲ့သည်
- **🔗 အတွင်းလင့်ခ်အားလုံးကို အပ်ဒိတ် လုပ်ထားသည်**: စာတမ်းများတွင် 78+ လမ်းကြောင်းများ ပြောင်းလဲထားသည်။
- **🗺️ ပင်မ README.md**: Course Map ကို အခန်းဖွဲ့စည်းမှုအသစ်ဖြင့် အပ်ဒိတ်လုပ်ထားသည်။
- **📝 `examples/README.md`**: အခန်း ဖိုလ်ဒါများဆီသို့ ရှေ့ပြေး ထောက်ပြချက်များကို အပ်ဒိတ်လုပ်ထားသည်။

#### ဖယ်ရှားခဲ့သည်
- အဟောင်း ဖိုလ်ဒါ ဖွဲ့စည်းမှု (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**ဒီဗားရှင်းတွင် အခန်း လမ်းကြောင်း README ဖိုင်များ ထည့်သွင်းထားသည် (v3.15.0 မှနေ၍ အစားထိုးခံရပါသည်)。**

---

### [v3.13.0] - 2026-02-05

#### AI အေးဂျင့်များ လမ်းညွှန် အသစ်
**ဒီဗားရှင်းသည် Azure Developer CLI ဖြင့် AI အေးဂျင့်များကို တပ်ဆင်ရန် အသေးစိတ် လမ်းညွှန်စာကို ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🤖 `docs/microsoft-foundry/agents.md`**: အောက်ပါအချက်များကို ဖုံးလာသော လမ်းညွှန် အပြီးအစီး:
  - AI အေးဂျင့်များ ဆိုသည်မှာဘာဖြစ်ပြီး chatbot များနှင့် မည်ကဲ့သို့ ခြားနားသည်ကို ရှင်းပြသည်။
  - အမြန် စတင်ရန် အေးဂျင့် သုံးမျိုး ရာခံပုံစံ (Foundry Agents, Prompty, RAG)
  - အေးဂျင့် ဖွဲ့စည်းပုံ ပုံစံများ (single agent, RAG, multi-agent)
  - ကိရိယာများ ညှိနှိုင်းခြင်းနှင့် ကိုက်ညီစေမှု
  - စောင့်ကြည့်မှုနှင့် သတ်မှတ်ချက်များ လိုက်လံစစ်ဆေးခြင်း
  - ကုန်ကျစရိတ် တွက်ချက်မှုများနှင့် အကောင်းဆုံးတိုးတတ်အောင် လုပ်နည်းများ
  - ရိုးရာ ဖြေရှင်းနည်းများနှင့် ပြဿနာရှာဖွေမှု
  - အောင်မြင်မှု စံချိန်များပါရှိသည့် လက်တွေ့ လေ့ကျင့်ခန်း သုံးခု

#### အကြောင်းအရာ ဖွဲ့စည်းပုံ
- **သင်တန်းနိဒါန်း**: စတင်လေ့လာသူများအတွက် အေးဂျင့် အသိပညာများ
- **အမြန် စတင်**: `azd init --template get-started-with-ai-agents` ဖြင့် အေးဂျင့်များ တပ်ဆင်ပါ။
- **ဖွဲ့စည်းပုံ ပုံစံများ**: အေးဂျင့် ပုံစံများကို မြင်သာအောင် ပုံဆွဲထားသည်။
- **စီမံချက်**: ကိရိယာများ ဖွဲ့စည်းခြင်းနှင့် ပတ်ဝန်းကျင် တန်ဖိုးများ
- **Monitoring**: Application Insights တိုက်ရိုက် ပေါင်းစည်းမှု
- **လေ့ကျင့်ခန်းများ**: တိုးတက်လာသော လက်တွေ့သင်ယူမှုများ (တစ်ခုလျှင် 20-45 မိနစ်)

---

### [v3.12.0] - 2026-02-05

#### DevContainer ပတ်ဝန်းကျင် အပ်ဒိတ်
**ဒီဗားရှင်းသည် ဖွံ့ဖြိုးရေး ကွန်တိန်နာ ဖွဲ့စည်းမှုကို၊ AZD သင်ယူခြင်းအတွေ့အကြုံအတွက် နောက်ဆုံးပေါ် ကိရိယာများနှင့် ပိုမိုကောင်းမွန်သော ရှေ့ထားမှုများဖြင့် အပ်ဒိတ်လုပ်ထားသည်။**

#### ပြောင်းလဲခဲ့သည်
- **🐳 Base Image**: `python:3.12-bullseye` မှ `python:3.12-bookworm` သို့ အပ်ဒိတ်လုပ်ခဲ့သည် (latest Debian stable)
- **📛 Container Name**: "Python 3" မှ "AZD for Beginners" ဟု နာမည်ပြောင်းထားသည်၊ ပိုမိုရှင်းလင်းစေသည်။

#### ထည့်သွင်းချက်များ
- **🔧 Dev Container အသစ်အင်္ဂါရပ်များ**:
  - `azure-cli` (Bicep ပံ့ပိုးမှုပါ)
  - `node:20` (AZD template များအတွက် LTS ဗားရှင်း)
  - `github-cli` (template စီမံခန့်ခွဲမှုအတွက်)
  - `docker-in-docker` (container app များ ထပ်ပေါင်း deploy မလုပ်ရန်)

- **🔌 Port Forwarding**: အထွေထွေ ဖွံ့ဖြိုးရေးအတွက် ကြိုတင်စီစဉ်ထားသော ပို့့များ:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 VS Code Extension အသစ်များ**:
  - `ms-python.vscode-pylance` - Python အတွက် ကောင်းမွန်သော IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions အထောက်အပံ့
  - `ms-azuretools.vscode-docker` - Docker အထောက်အပံ့
  - `ms-azuretools.vscode-bicep` - Bicep ဘာသာစကားအထောက်အပံ့
  - `ms-azure-devtools.azure-resource-groups` - Azure ရင်းမြစ် စီမံခန့်ခွဲမှု
  - `yzhang.markdown-all-in-one` - Markdown တည်းဖြတ်ခြင်း
  - `DavidAnson.vscode-markdownlint` - Markdown linting (စံချိန်စစ်ခြင်း)
  - `bierner.markdown-mermaid` - Mermaid ပုံဆွဲ အထောက်အပံ့
  - `redhat.vscode-yaml` - YAML အထောက်အပံ့ (azure.yaml အတွက်)
  - `eamodio.gitlens` - Git ပြသမှု
  - `mhutchie.git-graph` - Git အတိတ် မှတ်တမ်းကြည့်ရှုခြင်း

- **⚙️ VS Code Settings**: Python interpreter ရွေးချယ်မှု၊ ဖိုင် သိမ်းသည့်အခါ ဖော်မာ့တ်လုပ်ခြင်းနှင့် whitespace ဖြုတ်ပစ်ခြင်းတို့အတွက် ပုံမှန် ဆက်တင်များ ထည့်သွင်းထားသည်။

- **📦 requirements-dev.txt အပ်ဒိတ်များ**:
  - MkDocs minify plugin ထည့်သွင်းထားသည်
  - code quality အတွက် pre-commit ထည့်သွင်းထားသည်
  - Azure SDK package များ ထည့်သွင်းထားသည် (azure-identity, azure-mgmt-resource)

#### ပြင်ဆင်ခဲ့သည်
- **Post-Create Command**: container စတင်မှုတွင် AZD နှင့် Azure CLI ထည့်သွင်းထားမှုကို ယခု အတည်ပြုသည်။

---

### [v3.11.0] - 2026-02-05

#### စတင်လေ့လာသူများအတွက် README ပြင်ဆင်မှုကြီး
**ဒီဗားရှင်းက README.md ကို စတင်လေ့လာသူများအတွက် ပိုမိုလွယ်ကူအောင် တိုးတက်စေပြီး AI ဖန်တီးသူများအတွက် အဓိက အရင်းအမြစ်များကို ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🆚 Azure CLI vs AZD နှိုင်းယှဉ်ချက်**: တစ်ခုချင်းစီကို မည်သည့်အချိန်မှာ အသုံးပြုရမည်ကို ကိုယ်တိုင် လက်တွေ့ ဥပမာများဖြင့် ရှင်းလင်းဖော်ပြထားသည်။
- **🌟 Awesome AZD Links**: ကိုမ뮤니တီ template ဂဲလရီနှင့် ပါဝင်ဆောင်ရွက်ရန် ရင်းမြစ်များသို့ တိုက်ရိုက် လင့်ခ်များ:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - တပ်ဆင်ရန် အသင့်ပြင် 200+ template များ
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - အသိုင်းအဝိုင်းထံ သင်၏ template တင်သွင်းရန်
- **🎯 Quick Start Guide**: ရိုးရှင်းသော 3 အဆင့် စတင်မှု ဗျူဟာ (Install → Login → Deploy)
- **📊 အတွေ့အကြုံ အပေါ် မူတည်သော လမ်းညွှန် ဇယား**: ဖန်တီးသူ၏ အတွေ့အကြုံအဆင့်အရ မည်နေရာမှ စတင်ရမည်ကို သေချာရှင်းလင်းစွာ လမ်းညွှန်သည်။

#### ပြောင်းလဲခဲ့သည်
- **README ဖွဲ့စည်းပုံ**: အချက်အလက်များကို အလင်းချဲ့စနစ်အလိုက် ပြန်လည်စီစဉ်ထားပြီး အဓိကအချက်အလက်များကို ပထမဦးစွာ ထားရှိထားသည်။
- **နိဒါန်း အပိုင်း**: စတင်လေ့လာသူအတွက် "The Magic of `azd up`" ကို ရှင်းလင်းဖော်ပြရန် ပြန်ရေးသားထားသည်။
- **ထပ်တူ ပါဝင်နေသည့် အကြောင်းအရာကို ဖယ်ရှားခြင်း**: troubleshooting အပိုင်းထပ်တူရှိမှုကို ဖယ်ရှားခဲ့သည်။
- **Troubleshooting အမိန့်များ**: `azd logs` ကို သတ်မှတ်ထားသော `azd monitor --logs` ဖြင့် ပြင်ဆင်ထားသည်။

#### ပြင်ဆင်ချက်များ
- **🔐 အတည်ပြုခြင်း အမိန့်များ**: `cheat-sheet.md` ထဲသို့ `azd auth login` နှင့် `azd auth logout` ကို ထည့်သွင်းထားသည်။
- **မှားယွင်းသော command ရည်ညွှန်းချက်များ**: README troubleshooting အပိုင်းမှ ကျန်ရှိသေးသည့် `azd logs` ကို ဖယ်ရှားထားသည်။

#### မှတ်ချက်များ
- **အကျယ်အဝန်း**: ပြောင်းလဲမှုများကို ပင်မ README.md နှင့် resources/cheat-sheet.md တွင် အသုံးပြုထားသည်။
- **ရည်ရွယ်သူများ**: AZD အသစ်လေ့လာသူ developer များကို အထူးလေ့လာအဆင်ပြေစေရန် ပြုပြင်ထားသည်။

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command မှန်ကန်မှု အပ်ဒိတ်
**ဒီဗားရှင်းသည် စာတမ်းများအတွင်း မရှိသည့် AZD command များကို ချက်ချင်းမှားယွင်းမှုများဖြေရှင်းပြီး၊ နမူနာကုဒ်များအားလုံးသည် သုံးနိုင်သော Azure Developer CLI စကားလုံးများကို သုံးပြီး ရေးသားထားစေရန် ပြင်ဆင်ထားသည်။**

#### ပြင်ဆင်ခဲ့သည်
- **🔧 မရှိသော AZD command များ ဖယ်ရှားပြီးပြင်ဆင်ခြင်း**: မမှန်ကန်သော command များကို ကျယ်ပြန့်စွာ စစ်ဆေး၍ တိကျအောင် ပြုပြင်ထားသည်။
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Command ပြင်ဆင်မှုပါ ဖိုင်များ**:
  - `resources/cheat-sheet.md`: command ရည်ညွှန်းချက်များကို ကြီးမားစွာ ပြင်ဆင်ထားသည်
  - `docs/deployment/deployment-guide.md`: rollback နှင့် deployment မဟုတ်သော အရာများပြင်ဆင်ထားသည်
  - `docs/troubleshooting/debugging.md`: log စစ်ဆေးခြင်း အပိုင်းများ တိအောင် ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/common-issues.md`: troubleshooting အမိန့်များ အပ်ဒိတ်လုပ်ထားသည်
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD debugging အပိုင်း ပြင်ဆင်ထားသည်
  - `docs/getting-started/azd-basics.md`: monitoring အမိန့်များ အပ်ဒိတ်လုပ်ထားသည်
  - `docs/getting-started/first-project.md`: monitoring နှင့် debugging ဥပမာများ အပ်ဒိတ်လုပ်ထားသည်
  - `docs/getting-started/installation.md`: help နှင့် version ဥပမာများ ပြင်ဆင်ထားသည်
  - `docs/pre-deployment/application-insights.md`: log ကြည့်ရှုခြင်း အမိန့်များ ချိန်ညှိထားသည်
  - `docs/pre-deployment/coordination-patterns.md`: agent debugging အမိန့်များ ပြင်ဆင်ထားသည်

- **📝 ဗားရှင်း ရည်ညွှန်းချက် အပ်ဒိတ်**:
  - `docs/getting-started/installation.md`: hardcoded `1.5.0` ဗားရှင်းကို generic `1.x.x` သို့ ပြောင်းပြီး release များဆီလင့်ခ် ထည့်ထားသည်

#### ပြောင်းလဲခဲ့သည်
- **Rollback နည်းလမ်းများ**: AZD သည် မူလ rollback ကို မပံ့ပိုးသောကြောင့် Git-based rollback ကို အသုံးပြုရန်စာတမ်းများတွင် နှိုင်းပြောင်းထားသည်။
- **Log ကြည့်ရှုခြင်း**: `azd logs` ကို `azd monitor --logs`, `azd monitor --live` နှင့် Azure CLI အမိန့်များဖြင့် အစားထိုးထားသည်။
- **စွမ်းဆောင်ရည် ပိုင်း**: parallel/incremental deployment flag မရှိသော အရာများကို ဖယ်ရှား၍ အစားထိုး အသုံးပြုနိုင်သော နည်းလမ်းများကို ပေးထားသည်။

#### နည်းပညာ အချက်အလက်များ
- **အသုံးပြုနိုင်သော AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **azd monitor မှ အသုံးပြုနိုင်သော Flag များ**: `--live`, `--logs`, `--overview`
- **ဖယ်ရှားထားသော အင်္ဂါရပ်များ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### မှတ်ချက်များ
- **စစ်ဆေးချက်**: Command များကို Azure Developer CLI v1.23.x အပေါ်တွင် စိစစ်ပြီး မှန်ကန်ကြောင်း အတည်ပြုထားသည်။

---

### [v3.9.0] - 2026-02-05

#### Workshop ပြီးမြောက်မှုနှင့် စာတမ်းအရည်အသွေး အပ်ဒိတ်
**ဒီဗားရှင်းသည် အပြန်အလှန် အလုပ်ရောက်စေသော workshop modules များကို ပြီးစီးစေပြီး ချိုးပျက်နေသည့် စာတမ်းလင့်ခ်များအားလုံးကို ပြုပြင်ထားကာ Microsoft AZD အသုံးပြုသူ AI ဖန်တီးသူများအတွက် အကြောင်းအရာ အရည်အသွေးကို တိုးတက်အောင် ပြုလုပ်ထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **📝 CONTRIBUTING.md**: အသစ်သော အကြံပြုချက် ပို့သည့် လမ်းညွှန် စာတမ်း အောက်ပါအရာများ ပါဝင်သည်။
  - ပြဿနာများ တင်ပြရန် နှင့် ပြောင်းလဲရန် အကြံပြုချက်များ တင်သွင်းရန် သေချာရှင်းလင်းသော ညွှန်ကြားချက်များ
  - အသစ်ထည့်သွင်းမည့် အကြောင်းအရာများအတွက် စာတမ်း စံနှုန်းများ
  - ကုဒ်ဥပမာ လမ်းညွှန်ချက်များနှင့် commit မက်ဆေ့ချ် သတ်မှတ်ချက်များ
  - မိသားစုရောနှောမှု အချက်အလက်များ

#### ပြီးမြောက်ခဲ့သည်
- **🎯 Workshop Module 7 (Wrap-up)**: Wrap-up မော်ဂျူးကို ပြီးစုံစုံ ပြီးမြောက်:
  - ဝတ်ချုပ်အောင်ပြုလုပ်ခဲ့သော workshop အောင်မြင်မှုများ အကျုံးချုပ်
  - AZD, တမ်းပလိတ်များ၊ Microsoft Foundry ကို ကောင်းစွာနားလည်မှု အဓိက အချက်များ
  - သင်ယူရေးခရီးစဉ် ဆက်လက်လုပ်ဆောင်ရန် အကြံပြုချက်များ
  - Workshop စိန်ခေါ်မှု လက်တွေ့ လေ့ကျင့်ခန်းများနှင့် အခက်အခဲ အဆင့်သတ်မှတ်ချက်များ
  - လူထုတုံ့ပြန်ချက်နှင့် ပံ့ပိုးမှု လူမှုကွန်ရက် လင့်ခ်များ

- **📚 Workshop Module 3 (Deconstruct)**: သင်ယူရည်ရွယ်ချက်များကို အပ်ဒိတ်လုပ်ပြီး:
  - GitHub Copilot နှင့် MCP servers အဖြစ် စတင်ဖွင့်လှစ်သတ်မှတ်ချက် ညွှန်ကြားချက်များ
  - AZD template ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို နားလည်ခြင်း
  - Infrastructure-as-code (Bicep) အဖွဲ့အစည်း ပုံစံများ
  - လက်တွေ့ လေ့ကျင့်ခန်း ညွှန်ကြားချက်များ

- **🔧 Workshop Module 6 (Teardown)**: ပြီးစုံပြီး:
  - အရင်းအမြစ် သန့်ရှင်းရေးနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု ရည်ရွယ်ချက်များ
  - လုံခြုံစိတ်ချစွာ အင်ဖ್ರတ်စပ်ချာကို ဖယ်ရှားရန် `azd down` အသုံးပြုခြင်း
  - Soft-deleted cognitive services ကို ပြန်လည်ကယ်ဆယ်နည်းလမ်းများ
  - GitHub Copilot နှင့် Azure Portal အတွက် အပို စူးစမ်းစရာ ဆွေးနွေးချက်များ

#### ပြင်ဆင်ပြီး
- **🔗 မိမိရဲ့ link များ ပြင်ဆင်ခြင်း**: အတွင်းရေးသားထားသည့်စာရွက် 15+ ချို့ယွင်းနေသော link များကို ဖြေရှင်းပြီး:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md သို့ path များကို အမှန်ပြန်ပြင်လိုက်သည်
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md နှင့် production-ai-practices.md path များကို မှန်ကန်အောင် ပြင်လိုက်သည်
  - `docs/getting-started/first-project.md`: မရှိသေးသော cicd-integration.md ကို deployment-guide.md ဖြင့် အစားထိုးလိုက်သည်
  - `examples/retail-scenario.md`: FAQ နှင့် troubleshooting guide path များကို ပြင်လုပ်လိုက်သည်
  - `examples/container-app/microservices/README.md`: သင်ကြားမူလမ်းနှင့် deployment guide path များကို မှန်ကန်အောင် ပြင်လိုက်သည်
  - `resources/faq.md` နှင့် `resources/glossary.md`: AI အပိုင်း ရည်ညွှန်းချက်များကို အပ်ဒိတ်လုပ်လိုက်သည်
  - `course-outline.md`: instructor guide နှင့် AI workshop lab အတွက် reference များကို ပြင်လိုက်သည်

- **📅 Workshop အခြေအနေ ဗန်နာ**: "Under Construction" မှ ဖေဖော်ဝါရီ 2026 နေ့စွဲပါ အကြောင်းအရ လည်ပတ်နေသည့် workshop အခြေအနေ သို့ အပ်ဒိတ်လုပ်ၿပီး

- **🔗 Workshop navigation**: workshop README.md ထဲရှိ lab-1-azd-basics မရှိသေးသော ဖိုလ်ဒါကို ကိုးကားနေသော navigation link များကို ပြင်ဆင်လိုက်သည်

#### ပြောင်းလဲထားသည်
- **Workshop Presentation**: "under construction" သတိပေးချက်ကို ဖယ်ရှားပြီး၊ workshop အခု ပြီးစုံပြီး အသုံးချရန် ပြင်ဆင်ပြီးဖြစ်သည်
- **Navigation Consistency**: Workshop မော်ဂျူးများအားလုံးတွင် မော်ဂျူးများအကြား သွားလာနိုင်ရေး ကိုက်ညီမှု အတိအကျရှိစေလိုက်သည်
- **Learning Path References**: chapter cross-references များကို microsoft-foundry မှန်ကန်သော path များသုံးရန် အပ်ဒိတ်ပြုလုပ်သည်

#### မှန်ကန်ကြောင်း အတည်ပြု
- ✅ အင်္ဂလိပ် markdown ဖိုင်များအားလုံးတွင် အတွင်း link များ မှန်ကန်သည်
- ✅ Workshop မော်ဂျူး 0-7 အားလုံး သင်ယူရည်ရွယ်ချက်များနှင့် အပြီးသတ်ဖြစ်သည်
- ✅ အခန်းများနှင့် မော်ဂျူးများ အကြား မှန်ကန်စွာ သွားလာနိုင်သည်
- ✅ သတင်းအချက်အလက်များသည် Microsoft AZD အသုံးပြုသည့် AI developer များအတွက် သင့်တော်သည်
- ✅ စတင်ခွင့်ပြုသူများအတွက် နားလည်ရလွယ်သော ဘာသာစကားနှင့် ဖွဲ့စည်းပုံကို ထိန်းသိမ်းထားသည်
- ✅ CONTRIBUTING.md သည် လူထု အဖွဲ့ဝင်များအတွက် ဖော်ပြချက်များအား တိကျစွာ ပေးထားသည်

#### နည်းပညာ အကောင်အထည်ဖော်ခြင်း
- **Link Validation**: Automated PowerShell script က .md အတွင်း link များအားလုံးကို စစ်ဆေးထားသည်
- **Content Audit**: Workshop ပြည့်စုံမှုနှင့် စတင်သူ များအတွက် သင့်တော်မှုကို လက်ဖြင့် ပြန်လည်သုံးသပ်ထားသည်
- **Navigation System**: အခန်းနှင့် မော်ဂျူး navigation ပုံစံများကို ထပ်တူညီမျှ အကောင်အထည်ဖော်ထားသည်

#### မှတ်ချက်များ
- **Scope**: ပြောင်းလဲမှုများကို အင်္ဂလိပ်စာတမ်းသာ လက်ခံပြီး လုပ်ဆောင်ထားသည်
- **Translations**: ဘာသာပြန်ဖိုလ်ဒါများကို ဤထုတ်ဝေမှုတွင် အပ်ဒိတ်မလုပ်သေးပါ (အလျှောက်ရောနှော အလိုအလျောက်ဘာသာပြန်မှု မလာမီ သို့်မဟုတ်နောက်ပိုင်း sync ပြုလုပ်မည်)
- **Workshop သင်ယူချိန်**: အပြီးသတ် workshop သည် လက်တွေ့ လေ့ကျင့်မှု 3-4 နာရီ လုပ်ဆောင်နိုင်သည်

---

### [v3.8.0] - 2025-11-19

#### တိုးချဲ့ထားသော စာတမ်းများ: မော်နစ်တာရေးရှင်း, လုံခြုံရေး နှင့် Multi-Agent ပုံစံများ
**ဤဗားရှင်းတွင် Application Insights ပေါင်းစည်းခြင်း, အတည်ပြုရေး ပုံစံများနှင့် ထုတ်လုပ်ရေး သုံး multi-agent ကိုဌာနချိတ်ဆက်သွားရန် A-grade သင်ခန်းစာများ သွင်းထည့်ထားသည်။**

#### ထပ်ထည့်ပြီး
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - စက်တင် AZD လက်ခံ deployment နှင့် အလိုအလျောက် provisioning
  - Application Insights + Log Analytics အတွက် ပြည့်စုံသော Bicep တမ်းပလိတ်များ
  - custom telemetry ပါဝင်သည့် အလုပ်လုပ်နိုင်သော Python app များ (1,200+ စာကြောင်း)
  - AI/LLM မော်နစ်တာရေး ပုံစံများ (Microsoft Foundry Models token/ကုန်ကျစရိတ် ချက်ချင်းစာရင်းထားခြင်း)
  - 6 ခုသော Mermaid ဖော်ပြချက်များ (စီမံအင်အားပုံ, distributed tracing, telemetry flow)
  - လက်တွေ့ လေ့ကျင့်ခန်း 3 ခု (အချက်ပေးချက်များ, dashboard များ, AI မော်နစ်တာ)
  - Kusto query ဥပမာများနှင့် ကုန်ကျစရိတ် အနိမ့်ချခြင်း မဟာဗျူး
  - Live metrics streaming နှင့် real-time debugging
  - 40-50 မိနစ် သင်ယူချိန်နှင့် ထုတ်လုပ်ရန် အသင့်ဖြစ်သော ပုံစံများ

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - authentication ပုံစံ 3 မျိုး (connection strings, Key Vault, managed identity)
  - လုံခြုံစိတ်ချစေရန် ပြည့်စုံသော Bicep အင်ဖ্রါစထက်ချာ တမ်းပလိတ်များ
  - Azure SDK ပေါင်းစည်းထားသည့် Node.js application ကုဒ်
  - လက်တွေ့ လေ့ကျင့်ခန်း 3 ခု (managed identity အသုံးပြုခြင်း, user-assigned identity, Key Vault rotation)
  - လုံခြုံရေး အကောင်းဆုံး လေ့လာရမည့်အချက်များနှင့် RBAC ကွန်ဖစ်ဂျာရေးရှင်းများ
  - ပြဿနာဖြေရှင်းနည်း နှင့် ကုန်ကျစရိတ် ဉာဏ်ခေါ်ချက်
  - ထုတ်လုပ်ရေး အသုံးပြုနိုင်သော passwordless authentication ပုံစံများ

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - coordination ပုံစံ 5 မျိုး (စဥ်လိုက်, 병렬, အဆင့်လိုက်, event-driven, consensus)
  - ပြည့်စုံသော orchestrator service အကောင်အထည် (Python/Flask, 1,500+ စာကြောင်း)
  - အထူးပြင်ဆင်ထားသည့် agent အကောင်အထည် 3 မျိုး (Research, Writer, Editor)
  - message queuing အတွက် Service Bus ပေါင်းစည်းခြင်း
  - distributed systems အတွက် Cosmos DB state management
  - agent အပြန်အလှန်သက်ဆိုင်မှုများကို ဖော်ပြသည့် Mermaid ဖော်ပြချက် 6 ခု
  - အဆင့်မြင့် လေ့ကျင့်ခန်း 3 ခု (timeout ကိုင်တွယ်ခြင်း, retry logic, circuit breaker)
  - ကုန်ကျစရိတ် ခွဲခြမ်းချက် ($240-565/month) နှင့် အကောင်းဆုံးချိန်ညှိနည်းများ
  - မော်နစ်တာရေးအတွက် Application Insights ပေါင်းစည်းခြင်း

#### တိုးမြှင့်ထားသည်
- **Pre-deployment အခန်း**: မော်နစ်တာရေးနှင့် coordination ပုံစံများကို ပြည့်စုံစွာ ထည့်သွင်းထားသည့် အပိုင်းဖြစ်သွားပါသည်
- **Getting Started အခန်း**: ပရော်ဖက်ရှင်နယ် authentication ပုံစံများပါ အသုံးပြုမှုအား တိုးမြှင့်ထားသည်
- **Production Readiness**: လုံခြုံရေးမှ ရှာဖွေရေး အထိ ပြည့်စုံစွာ ကာကွယ်ထားသည်
- **Course Outline**: အခန်း 3 နှင့် 6 တွင် အသစ်ထည့်သွင်းထားသော သင်ခန်းစာများကို ကိုးကားရန် အပ်ဒိတ်လုပ်ထားသည်

#### ပြောင်းလဲထားသည်
- **Learning Progression**: security နှင့် monitoring ကို course အတွင်းပိုင်းတွင် ပိုမိုကောင်းမွန်စွာ ပေါင်းစပ်ထားသည်
- **Documentation Quality**: အသစ်ထည့်သွင်းသည့် သင်ခန်းစာများ တွင် အဆင့် A အရည်အသွေး (95-97%) ကို ထိန်းသိမ်းထားသည်
- **Production Patterns**: အစွမ်းထက် enterprise ထုတ်လုပ်မှုများအတွက် အဆုံးအဖြတ် ပုံစံများကို ပြည့်စုံဖော်ပြထားသည်

#### တိုးတက်စေသည်
- **Developer Experience**: ဖွံ့ဖြိုးမှထုတ်လုပ်မှု မော်နစ်တာရေးသို့ ပြောင်းရွှေ့နိုင်ရန်မှန်ကန်သော လမ်းညွှန်ချက်
- **Security Standards**: authentication နှင့် secrets management အတွက် ပရော်ဖက်ရှင်နယ် ပုံစံများ
- **Observability**: AZD နှင့်တွဲဖက်၍ Application Insights အပြည့်အဝ ပေါင်းစည်းမှု
- **AI Workloads**: Microsoft Foundry Models နှင့် multi-agent စနစ်များအတွက် အထူးတပ်ဆင်ထားသည့် မော်နစ်တာရေး

#### မှန်ကန်ကြောင်း အတည်ပြု
- ✅ သင်ခန်းစာအားလုံးတွင် လုပ်ဆောင်နိုင်သော ကုဒ်များ ပါဝင်သည် (ကုတ်ခ် snippets မဟုတ်)
- ✅ ပညာရေးအတွက် ဖော်ပြချက်များအတွက် Mermaid ဖော်ပြချက်များပါရှိသည် (သင်ခန်းစာ 3 ခုတွင် စုစုပေါင်း 19 ခု)
- ✅ လက်တွေ့ လေ့ကျင့်ခန်းများနှင့် အတည်ပြုခြင်း အဆင့်များ (စုစုပေါင်း 9 ခု)
- ✅ `azd up` ဖြင့် deploy ရနိုင်သော ထုတ်လုပ်ရေးအဆင်သင့် Bicep တမ်းပလိတ်များ
- ✅ ကုန်ကျစရိတ် ခွဲခြမ်းချက်နှင့် အကောင်းဆုံးသုံးစွဲရေး သေချာချက်များ
- ✅ ပြဿနာဖြေရှင်းလမ်းညွှန်များနှင့် အကောင်းဆုံး လေ့လာမှုအဆင့်များ
- ✅ သိပ္ပံပိုင်း စိစစ်ခိုင်မာချက်များနှင့် အတည်ပြု မှာကြားချက်များ

#### စာတမ်းအရည်အသွေး အနှိုင်းအဖျား ရလဒ်များ
- **docs/pre-deployment/application-insights.md**: - မော်နစ်တာရေး လမ်းညွှန် ပြည့်စုံ
- **docs/getting-started/authsecurity.md**: - ပရော်ဖက်ရှင်နယ် လုံခြုံရေး ပုံစံများ
- **docs/pre-deployment/coordination-patterns.md**: - အဆင့်မြင့် multi-agent အသုံးချမှု ဖွဲ့စည်းပုံများ
- **အသစ်ထည့်သွင်းထားသည့် အကြောင်းအရာ ဆိုင်ရာ ပုံစံ**: - တူညီသော အရည်အသွေး အဆင့် (high-quality) ကို ထိန်းသိမ်းထားသည်

#### နည်းပညာ အကောင်အထည်ဖော်ခြင်း
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC ပုံစံများ
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### စာတမ်းအရည်အသွေး တိုးတက်မှုများနှင့် Microsoft Foundry Models ဥပမာ အသစ်
**ဤဗားရှင်းသည် စာတမ်းအရည်အသွေးကို repository အားလုံးတွင် တိုးတက်စေပြီး gpt-4.1 chat interface ပါသော Microsoft Foundry Models deployment ဥပမာ တစ်ခု ကို ထည့်သွင်းထားသည်။**

#### ထပ်ထည့်ပြီး
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Microsoft Foundry Models အင်ဖရာစထက်ချာ ပြည့်စုံ (gpt-4.1 model deployment)
  - စကားပြောမှတ်တမ်း ဖြင့် Python command-line chat interface
  - API key ကို လုံခြုံစွာ သိမ်းဆည်းရန် Key Vault ပေါင်းစည်းမှု
  - token အသုံးပြုမှု ချက်ချင်း သိမ်းစာရင်းနှင့် ကုန်ကျစရိတ် ခန့်မှန်းချက်
  - rate limiting နှင့် error handling
  - 35-45 မိနစ် deploy လမ်းညွှန် ပါသော ဖော်ပြချက် README
  - ထုတ်လုပ်ရန် အသင့် 11 ဖိုင် (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: configuration guide တွင် လက်တွေ့ လေ့ကျင့်ခန်းများ ထည့်သွင်း:
  - အလေ့အကျင့် 1: Multi-environment configuration (15 minutes)
  - အလေ့အကျင့် 2: Secret management practice (10 minutes)
  - အောင်မြင်မှု အတိုင်းအတာနှင့် အတည်ပြုခြင်း ချက်များ ထည့်သွင်း
- **✅ Deployment Verification**: deployment guide တွင် verification အပိုင်း ထည့်သွင်း:
  - health check နည်းစနစ်များ
  - အောင်မြင်မှု အချက်လက္ခဏာ စစ်ဆေးစာရင်း
  - deployment command များအတွက် မျှော်လင့်ချက်ထုတ်ရလဒ်များ
  - ပြဿနာဖြေရှင်းခြင်း အတိုချုံး အညွှန်း

#### တိုးမြှင့်ထားသည်
- **examples/README.md**: A-grade အရည်အသွေးသို့ အပ်ဒိတ် (93%):
  - azure-openai-chat ကို သက်ဆိုင်ရာ အပိုင်းအားလုံးတွင် ထည့်သွင်း
  - ဒေသတွင်းဥပမာ စာရင်းကို 3 မှ 4 သို့ အပ်ဒိတ်
  - AI Application Examples ဇယားတွင် ထည့်သွင်း
  - Intermediate users အတွက် Quick Start ထဲသို့ ထည့်သွင်း
  - Microsoft Foundry Templates အပိုင်းသို့ ထည့်သွင်း
  - နှိုင်းယှဉ်ဇယားနှင့် နည်းပညာ ရှာဖွေမှု အပိုင်းများ အပ်ဒိတ်
- **Documentation Quality**: B+ (87%) → A- (92%) အထိ တိုးတက်:
  - အရေးကြီး command ဥပမာများအတွက် မျှော်လင့်ရလဒ်များထည့်သွင်း
  - configuration ပြောင်းလဲမှုများအတွက် အတည်ပြု အဆင့်များ ထည့်သွင်း
  - လက်တွေ့ သင်ယူမှုများအတွက် အသုံးဝင်သော လေ့ကျင့်ခန်းများ တိုးမြှင့်

#### ပြောင်းလဲထားသည်
- **Learning Progression**: intermediate လေ့လာသူများအတွက် AI ဥပမာများ ပိုမိုထည့်သွင်း
- **Documentation Structure**: ရလဒ်ရှင်းလင်းသော လေ့ကျင့်ခန်းများနှင့် အကျိုးအမြင် ရရှိစေရန် ဖွဲ့စည်းပုံပိုမိုတိုးတက်
- **Verification Process**: အဓိက အလုပ်လုပ်ငန်းများတွင် ငါးအောင်မြင်မှုထောက်ကွက်များ ထည့်သွင်း

#### တိုးတက်စေသည်
- **Developer Experience**: Microsoft Foundry Models deployment အချိန်ကို 35-45 မိနစ် (ရှုပ်ထွေးသော အခြားရွေးချယ်မှုများ 60-90 မိနစ်နှင့် နှိုင်းယှဉ်)
- **Cost Transparency**: Microsoft Foundry Models ဥပမာ အတွက် ကုန်ကျစရိတ် ခန့်မှန်းချက် ($50-200/month)
- **Learning Path**: AI developer များအတွက် azure-openai-chat ဖြင့် ရှင်းလင်းသော စတင်ရာနေရာ
- **Documentation Standards**: မျှော်လင့်ထားသော ထုတ်လွှင့်ရလဒ်များနှင့် အတည်ပြု လုပ်ထုံးလုပ်နည်းများ တပြည့်တည်း ထည့်သွင်း

#### မှန်ကန်ကြောင်း အတည်ပြု
- ✅ Microsoft Foundry Models ဥပမာသည် `azd up` ဖြင့် ပြည့်စုံစွာ လုပ်ဆောင်နိုင်သည်
- ✅ အကောင်အထည်ဖော်ရန် ဖိုင် 11 လုံးအားလုံး သရုပ်ပြဇီဝရှင်အား ဖြေရှင်းနိုင်သည်
- ✅ README ညွှန်ကြားချက်များသည် အကောင်အထည်ဖော်ခြင်း အတွေ့အကြုံနှင့် ကိုက်ညီသည်
- ✅ စာတမ်း link များကို 8+ နေရာတွင် အပ်ဒိတ်လုပ်ထားသည်
- ✅ examples index သည် ဒေသတွင်း ဥပမာ 4 ခုကို မှန်ကန်စွာ ဖော်ပြထားသည်
- ✅ ဇယားများတွင် အပြန်အလှန် ထပ်တူသော အပြင် link များ မရှိတော့
- ✅ navigation မှာ ကိုးကားချက်အားလုံး မှန်ကန်သည်

#### နည်းပညာ အကောင်အထည်ဖော်ခြင်း
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps ပုံစံ
- **Security**: Managed Identity အဆင်သင့်, Key Vault တွင် secrets သိမ်းဆည်း
- **Monitoring**: Application Insights ပေါင်းစည်းမှု
- **Cost Management**: Token tracking နှင့် အသုံးပြုမှု တိုးတက်စေရန် နည်းလမ်းများ
- **Deployment**: Single `azd up` command ဖြင့် ပြည့်စုံသတ်မှတ်ထားသော setup

### [v3.6.0] - 2025-11-19

#### မူလ အပ်ဒိတ်: Container App Deployment ဥပမာများ
**ဤဗားရှင်းသည် Azure Developer CLI (AZD) အသုံးပြုပြီး ထုတ်လုပ်ရန်အဆင်သင့် container application deployment ဥပမာများကို ပြည့်စုံစွာ မိတ်ဆက်ပြီး သင်ယူလမ်းကြောင်းထဲသို့ ပေါင်းစည်းထားသည်။**

#### ထပ်ထည့်ပြီး
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): containerized deployments, quick start, production, နှင့် အဆင့်မြင့် ပုံစံများ အကျုံးချုပ်
  - [Simple Flask API](../../examples/container-app/simple-flask-api): စတင်သူများအတွက် REST API (scale-to-zero, health probes, monitoring, troubleshooting)
  - [Microservices Architecture](../../examples/container-app/microservices): ထုတ်လုပ်ရေးအဆင်သင့် multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **အကောင်းဆုံး အကျင့်များ**: containerized workloads အတွက် လုံခြုံရေး, မော်နစ်တာရေး, ကုန်ကျစရိတ် ထိန်းချုပ်ခြင်း, CI/CD လမ်းညွှန်ချက်များ
- **ကုဒ် ဥပမာများ**: ပြည့်စုံသော `azure.yaml`, Bicep templates, နှင့် အမျိုးဘာသာ စာသားအလိုက် service အကောင်အထည်များ (Python, Node.js, C#, Go)
- **စမ်းသပ်ခြင်း & ပြဿနာဖြေရှင်းခြင်း**: end-to-end စမ်းသပ်မှု အခြေအနေများ, မော်နစ်တာရေး command များ, ပြဿနာဖြေရှင်း ညွှန်ကြားချက်များ

#### ပြောင်းလဲထားသည်
- **README.md**: "Local Examples - Container Applications" အောက်တွင် container app ဥပမာအသစ်များကို ဖော်ပြရန် အပ်ဒိတ်လုပ်ထားသည်
- **examples/README.md**: container app ဥပမာများကို ထင်ပေါ်စေပြီး နှိုင်းယှဉ်ဇယား အချက်အလက်များကို အပ်ဒိတ်လုပ်ထားသည်
- **Course Outline & Study Guide**: container app ဥပမာများနှင့် deployment ပုံစံများကို သက်ဆိုင်ရာ အခန်းများတွင် ကိုးကားရန် အပ်ဒိတ်လုပ်ထားသည်

#### မှန်ကန်ကြောင်း အတည်ပြု
- ✅ ဥပမာအသစ်များအားလုံး `azd up` ဖြင့် deploy လုပ်နိုင်ပြီး အကောင်းဆုံး အကျင့်များ လိုက်နာထားသည်
- ✅ စာတမ်းများအတွင်း cross-links နှင့် navigation ကို အပ်ဒိတ်လုပ်ပြင်ထားသည်
- ✅ ဥပမာများသည် စတင်သူများမှ အဆင့်မြင့် scenarios အထိ ဖုံးလွှမ်းထားသည်၊ ထုတ်လုပ်ရေး microservices အပါအဝင်

#### မှတ်ချက်များ
- **Scope**: အင်္ဂလိပ်စာတမ်းများနှင့် ဥပမာများသာ ပတ်သက်သည်
- **Next Steps**: အဆင့်မြင့် container ပုံစံများနှင့် CI/CD automation များဖြင့် ထပ်မံချဲ့ထွင်ရန်

### [v3.5.0] - 2025-11-19

#### ကုန်ပစ္စည်း အမည်ပြောင်းလဲခြင်း: Microsoft Foundry
**ဤဗားရှင်းသည် "Microsoft Foundry" အမည်အပြောင်းအလဲကို အင်္ဂလိပ်စာတမ်းများအားလုံးတွင် အပြည့်အစုံ တွက်ဖျောက်ပြောင်းလဲထားသည်။**

#### ပြောင်းလဲထားသည်
- **🔄 Product Name Update**: "Microsoft Foundry" သို့ အမည်ပြောင်းလဲခြင်း အပြည့်အစုံ
  - `docs/` ဖိုလ်ဒါရှိ အင်္ဂလိပ်စာတမ်းများတွင် အထူးပြောင်းလဲမှုများ
  - ဖိုလ်ဒါအမည် ပြောင်းရန်: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ဖိုင်အမည် ပြောင်းလဲခြင်း: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - စုစုပေါင်း: တစ်ခုချင်း 7 ဖိုင်တွင် 23 ခုသော မူကြောင်း (content) ကို ရည်ညွှန်းချက်များ ပြင်ဆင်ထားပါသည်

- **📁 ဖိုလ်ဒါ ဖွဲ့စည်းပုံ ပြောင်းလဲချက်များ**:
  - `docs/ai-foundry/` ကို `docs/microsoft-foundry/` သို့ အမည်ပြောင်းထားသည်
  - ဖိုလ်ဒါ ဖွဲ့စည်းပုံ အသစ်ကို ကိုက်ညီရန် Cross-reference အားလုံး ပြင်ဆင်ထားသည်
  - Navigation link များကို စာတမ်းအားလုံးတွင် အတည်ပြုပြီးပါပြီ

- **📄 ဖိုင် အမည် ပြောင်းလဲချက်များ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - အတွင်းရေးရာ link အားလုံးကို ဖိုင်အမည် အသစ်အား ရည်ညွှန်းရန် ပြင်ဆင်ထားသည်

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - navigation link 3 ခု ပြင်ဆင်ထားသည်
  - `docs/microsoft-foundry/ai-workshop-lab.md` - product name ရည်ညွှန်းချက် 4 ခု ပြင်ဆင်ထားသည်
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ယခင်အပ်ဒိတ်များကနေ Microsoft Foundry ကို အသုံးပြုထားပြီး ဖြစ်ပါသည်
  - `docs/microsoft-foundry/production-ai-practices.md` - ရည်ညွှန်းချက် 3 ခု (အကျဉ်းချုပ်, community မှတုံ့ပြန်ချက်, စာတမ်း) ပြင်ဆင်ထားသည်
  - `docs/getting-started/azd-basics.md` - cross-reference link 4 ခု ပြင်ဆင်ထားသည်
  - `docs/getting-started/first-project.md` - chapter navigation link 2 ခု ပြင်ဆင်ထားသည်
  - `docs/getting-started/installation.md` - next chapter link 2 ခု ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/ai-troubleshooting.md` - ရည်ညွှန်းချက် 3 ခု (navigation, Discord community) ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/common-issues.md` - navigation link 1 ချက် ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/debugging.md` - navigation link 1 ချက် ပြင်ဆင်ထားသည်

- **Course Structure Files** (2 files):
  - `README.md` - ရည်ညွှန်းချက် 17 ခု ပြင်ဆင်ထားသည် (course အကျဉ်းချုပ်, chapter ခေါင်းစဉ်များ, template အပိုင်း, community အမြင်များ)
  - `course-outline.md` - ရည်ညွှန်းချက် 14 ခု ပြင်ဆင်ထားသည် (အကျဉ်းချုပ်, သင်ယူမှု ရည်မှန်းချက်များ, chapter ရင်းမြစ်များ)

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### မှတ်ချက်များ
- **Scope**: ပြင်ဆင်မှုများကို `docs/` ဖိုလ်ဒါရှိ အင်္ဂလိပ်စာရွက်စာတမ်းများတွင်သာ အသုံးပြုထားသည်
- **Translations**: `translations/` ဖိုလ်ဒါများကို ဤဗားရှင်းတွင် မပြောင်းလဲထားပါ
- **Workshop**: `workshop/` အလေ့အကျင့်ပစ္စည်းများကို ဤဗားရှင်းတွင် မပြောင်းလဲထားပါ
- **Examples**: ဥပမာ ဖိုင်များတွင် အဟောင်းအမည် ရည်ညွှန်းချက်များ ပျက်ကွက်နေနိုင်သည် (နောက်ထပ် ဗားရှင်းတွင် ဖြေရှင်းမည်)
- **External Links**: အပြင်လင့်ခ်များနှင့် GitHub repository ရည်ညွှန်းချက်များကို မပြောင်းလဲထားပါ

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### ကွန်စထရပ်ရှင်း ကြိုကြည့်ခြင်းနှင့် အတည်ပြုမှု တိုးတက်စေရေး
**ဤဗားရှင်းသည် Azure Developer CLI preview လုပ်ဆောင်ချက်အသစ်အတွက် ဖုံးလွှမ်းအားဖြင့် ထောက်ပံ့မှုထည့်သွင်းပေးပြီး workshop အသုံးပြုသူ အတွေ့အကြုံကို ကောင်းမွန်စေပါသည်။**

#### Added
- **🧪 azd provision --preview Feature Documentation**: infrastructure preview စွမ်းဆောင်ရည်အသစ်ကို လုံးဝဖော်ပြထားသည်
  - Command reference နှင့် အသုံးပြုနည်းဥပမာများကို cheat sheet တွင် ထည့်သွင်းထားသည်
  - provisioning လမ်းညွှန်တွင် အသုံးမှုကိစ္စများနှင့် အကျိုးကျေးဇူးများ အပြည့်အစုံ လက်တွဲထည့်သွင်းထားသည်
  - safer deployment အတွက် pre-flight check အင်တာဂရိတ် ထည့်သွင်းထားသည်
  - safety-first deployment လေ့လာမှုများနှင့် သင်ရောက်စေသော Getting started လမ်းညွှန်များကို အပ်ဒိတ်ပြုလုပ်ထားသည်
- **🚧 Workshop Status Banner**: workshop ပြုလုပ်ဆောင်ရွက်မှု ထင်ရှားစေရန် professional HTML banner တစ်ခု ထည့်သွင်းထားသည်
  - ဂရေဒီယန့်ဒီဇိုင်းနှင့် ဆောက်လုပ်ရေး အညွှန်းအချက်များပါရှိသော ပြထားမှု
  - Transparency အတွက် last updated timestamp ထည့်ထားသည်
  - မိုဘိုင်းနှင့် အခြား စက်ပစ္စည်းများအတွက် တုံ့ပြန်နိုင်သော ဒီဇိုင်း

#### Enhanced
- **Infrastructure Safety**: preview functionality ကို deployment စာတမ်းများတစ်လျှောက်လုံးတွင် ပေါင်းထည့်ထားသည်
- **Pre-deployment Validation**: automated scripts များတွင် infrastructure preview စမ်းသပ်မှုများ ပါဝင်လာသည်
- **Developer Workflow**: preview ကို အကောင်းဆုံး လေ့လာမှုအနေဖြင့် command တန်းစဉ်များတွင် update ပြုလုပ်ထားသည်
- **Workshop Experience**: အကြောင်းအရာ ဖွံ့ဖြိုးရေး အခြေအနေများကို အသုံးပြုသူများ ထင်ဟပ်စေသော ရှင်းလင်းချက်များ ထည့်သွင်းထားသည်

#### Changed
- **Deployment Best Practices**: preview-first workflow ကို အဆိုပြုနည်းလမ်းအဖြစ် ထည့်သွင်းလိုက်သည်
- **Documentation Flow**: infrastructure validation ကို သင်ယူမှု လမ်းစဉ်တွင် နောက်ကျသည့် အပိုင်းမှ ဘယ်လောက်ရှေ့သို့ ဆင့်ကူးထားသည်
- **Workshop Presentation**: ဖွံ့ဖြိုးရေး အချိန်ဇယားနှင့် ပိုင်ရှင်မှတ်ချက်များကို professional အနေဖြင့် ပြသထားသည်

#### Improved
- **Safety-First Approach**: deployment မပြုခင် infrastructure ပြောင်းလဲမှုများကို ကြိုတင်စစ်ဆေးနိုင်သည်
- **Team Collaboration**: preview ရလဒ်များကို မွေးမြူ ဆွေးနွေးရန် အမျိုးအစားများဖြင့် শာလှယ်နိုင်သည်
- **Cost Awareness**: provision မှမတိုင်ခင် resource ကုန်ကျစရိတ်များကို ပိုမိုနားလည်စေသည်
- **Risk Mitigation**: ကြိုတင် အတည်ပြုမှုအားဖြင့် deployment မအောင်မြင်မှုများ လျှော့ချနိုင်သည်

#### Technical Implementation
- **Multi-document Integration**: preview feature ကို 4 ချက်သော အဓိက ဖိုင်များတွင် ဖော်ပြထားသည်
- **Command Patterns**: စတိုင်နှင့် ဥပမာများကို စဉ်ဆက်မပြတ် ထပ်တူသုံးထားသည်
- **Best Practice Integration**: preview ကို validation workflows နှင့် scripts များတွင် ထည့်သွင်းထားသည်
- **Visual Indicators**: အသစ်ဖြစ်သော feature များအတွက် သိသာထင်ရှားစေရန် NEW အမှတ်အသားများ ထည့်ထားသည်

#### Workshop Infrastructure
- **Status Communication**: ဂရေဒီယန့်စတိုင်နှင့် professional HTML banner ဖြင့် အခြေအနေ သတင်းပို့ခြင်း
- **User Experience**: ဖွံ့ဖြိုးရေး အခြေအနေရှင်းလင်းမှုကြောင့် ဖိုရမ်ဖွံ့ဖြိုးမှုမှ သံသယမရှိစေ
- **Professional Presentation**: repository ၏ ယုံကြည်ရစေရန် ထိန်းသိမ်းပေးပြီး မျှော်လင့်ချက်များ သတ်မှတ်ပေးသည်
- **Timeline Transparency**: October 2025 last updated timestamp ဖြင့် တာဝန်ရှိမှုကို ပြသထားသည်

### [v3.3.0] - 2025-09-24

#### Workshop ပစ္စည်းများတိုးချဲ့ခြင်းနှင့် အင်တာက်တက်တင်လေ့လာမှု အတွေ့အကြုံ
**ဤဗားရှင်းသည် browser-based interactive guide များနှင့် ဖွဲ့စည်းထားသော သင်ယူမှု လမ်းကြောင်းများကို လုံးဝထည့်သွင်းပေးပါသည်။**

#### Added
- **🎥 Interactive Workshop Guide**: MkDocs preview စွမ်းရည်နှင့် browser-based workshop အတွေ့အကြုံ
- **📝 Structured Workshop Instructions**: ရှာဖွေခြင်းမှ စိတ်ကြိုက်ပြင်ဆင်ခြင်းထိ အဆင့် 7 ချက် လမ်းညွှန်ထားသည်
  - 0-Introduction: Workshop အကျဉ်းချုပ်နှင့် စတင်ဆက်သွားရန် ပြင်ဆင်မှုများ
  - 1-Select-AI-Template: Template ရှာဖွေရေးနှင့် ထုတ်ယူပေးနည်း
  - 2-Validate-AI-Template: Deployment နှင့် validation လုပ်ငန်းစဉ်များ
  - 3-Deconstruct-AI-Template: Template ဖွဲ့စည်းပုံ နားလည်ခြင်း
  - 4-Configure-AI-Template: ဖွဲ့စည်းတပ်ဆင်ခြင်းနှင့် စိတ်ကြိုက်ပြင်ဆင်ခြင်း
  - 5-Customize-AI-Template: အဆင့်မြင့် ပြင်ဆင်မှုများနှင့် iteration များ
  - 6-Teardown-Infrastructure: ပြန်လင်းစင်ကြယ်ရေးနှင့် resource စီမံခန့်ခွဲမှု
  - 7-Wrap-up: အနှိပ်အဖျားနှင့် နောက်တစ်ဆင့်အကြံပြုချက်များ
- **🛠️ Workshop Tooling**: MkDocs configuration နှင့် Material theme အသုံးပြုထားခြင်း
- **🎯 Hands-On Learning Path**: 3-အဆင့် များ (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: တိကျစွာ တပ်ဆင်ထားသော development environment

#### Enhanced
- **AI Workshop Lab**: 2-3 နာရီ အတွင်း တိကျစွာ ဖွဲ့စည်းထားသော သင်ယူမှု အတွေ့အကြုံတိုးချဲ့ထားသည်
- **Workshop Documentation**: navigation နှင့် ဗီဇြွယ် အကူအညီများဖြင့် professional အမျိုးအစား၌ ပြသထားသည်
- **Learning Progression**: template ရွေးချယ်ခြင်မှ production deployment ထိ အဆင့်လိုက် အကူအညီ ရှင်းလင်းစွာ ဖော်ပြထားသည်
- **Developer Experience**: development workflow များကို ပိုမိုလွယ်ကူစေရန် tooling ပေါင်းစပ်ထားသည်

#### Improved
- **Accessibility**: browser-based interface, search, copy လုပ်နိုင်မှုနှင့် theme toggle စသည်ဖြင့် အသုံးပြုရလွယ်ကူစေသည်
- **Self-Paced Learning**: သင်ယူချိန်ကို ကိုက်ညီစေသော ဖွဲ့စည်းမှု
- **Practical Application**: အမှန်တကယ် AI template များကို deployment ပြုလုပ်ခြင်းအတွေ့အကြုံ
- **Community Integration**: workshop အတွက် Discord ဖြင့် ပံ့ပိုးမှု နှင့် ပူးပေါင်းဆောင်ရွက်မှု

#### Workshop Features
- **Built-in Search**: စကားလုံးဖြင့် အချိန်တိုအတွင်း သင်ခန်းစာ ရှာဖွေနိုင်မှု
- **Copy Code Blocks**: code ဧကရာများကို hover လုပ်ကာ copy လုပ်နိုင်မှု
- **Theme Toggle**: မှောင်/အလင်း မူကို အသုံးပြုနိုင်မှု
- **Visual Assets**: screenshot များနှင့် diagram များ ဖြင့် ဖော်ပြချက် တိုးတက်စေခြင်း
- **Help Integration**: community ပံ့ပိုးမှုအတွက် Discord ကို တိုက်ရိုက် ဝင်ရောက်ရန် လမ်းကြောင်း

### [v3.2.0] - 2025-09-17

#### အဓိက Navigation ပြုပြင်ခြင်းနှင့် အခန်းအလိုက် သင်ယူရေးစနစ်
**ဤဗားရှင်းသည် repository အနှံ့လုံးကို အခန်းအလိုက် သင်ယူမှုစနစ်ဖြင့် ပြန်လည်ဖွဲ့စည်းပေးပြီး navigation ကို တိုးတက်ကောင်းမွန်စေပါသည်။**

#### Added
- **📚 Chapter-Based Learning System**: သင်ရိုးကို အစဉ်လိုက် 8 ချက် အခန်းအလိုက် ပြန်လည်တည်ဆောက်ထားသည်
  - Chapter 1: အခြေခံနှင့် Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: စာတမ်းအားလုံးတွင် consistent navigation header နှင့် footer များထည့်သွင်းထားသည်
- **🎯 Progress Tracking**: Course completion checklist နှင့် သင်ယူမှုပမာဏ အတည်ပြုစနစ်
- **🗺️ Learning Path Guidance**: အတွေ့အကြုံနှင့် ရည်ရွယ်ချက်အလိုက် ဝင်ရောက်စတင်ရန် လမ်းညွှန်ချက်များ
- **🔗 Cross-Reference Navigation**: ဆက်စပ် chapter များနှင့် prerequisite များကို သေချာ ချိတ်ဆက်ပြထားသည်

#### Enhanced
- **README Structure**: Chapter အစီအစဉ်နှင့် တွဲဖက်၍ ရှင်းလင်းသိသာစေရန် ပြင်ဆင်ထားသည်
- **Documentation Navigation**: စာမျက်နှာတစ်ခုချင်းစီတွင် chapter context နှင့် progression လမ်းညွှန်များ ပါရှိသည်
- **Template Organization**: ဥပမာများနှင့် template များကို သင်ယူမှု အခန်းများနှင့် ကိုက်ညီအောင် ပြင်ဆင်ထားသည်
- **Resource Integration**: Cheat sheets, FAQs, study guides များကို သက်ဆိုင်ရာ chapter များနှင့် ချိတ်ဆက်ထားသည်
- **Workshop Integration**: Hands-on lab များကို အခန်းထိပ်ဆိုင်ရာ သင်ယူမှု ရည်မှန်းချက်များနှင့် ကိုက်ညီအောင် ချိန်ညှိထားသည်

#### Changed
- **Learning Progression**: ရိုးရာ လမ်းစဉ်မှ chapter-based မျိုးဆက်သစ် သို့ ပြောင်းလဲထားသည်
- **Configuration Placement**: configuration guide ကို လေ့လာမှုပုံစံအတွက် Chapter 3 အဖြစ် ပြင်ဆင်ထားသည်
- **AI Content Integration**: AI-specific အကြောင်းအရာများကို သင်ယူမှုလမ်းကြောင်းတစ်လျှောက်လုံး ပိုမိုထည့်သွင်းထားသည်
- **Production Content**: Advanced patterns များကို enterprise သင်ယူသူများအတွက် Chapter 8 တွင် ကပ်လျက်ထားသည်

#### Improved
- **User Experience**: navigation breadcrumbs နှင့် chapter progression ကို ပိုမိုရှင်းလင်းစေပါသည်
- **Accessibility**: navigation ပုံစံများကို တွဲဖက်အသုံးပြုရ လွယ်ကူစေသည်
- **Professional Presentation**: တက္ကသိုလ်ပုံစံသင်တန်းလိုပွဲအတွက် သင့်တော်သော အဖွဲ့အစည်းတစ်ရပ်ဖြစ်စေသည်
- **Learning Efficiency**: သက်ဆိုင်ရာ အကြောင်းအရာ ရှာဖွေချိန်ကို လျော့နည်းစေသည်

#### Technical Implementation
- **Navigation Headers**: 40+ စာရွက်စာတမ်းများတွင် standardized chapter navigation ထည့်သွင်းထားသည်
- **Footer Navigation**: progression လမ်းညွှန်ချက်များနှင့် chapter အပြီးသတ် အချက်ပြ စနစ် တူညီစွာ ထည့်သွင်းထားသည်
- **Cross-Linking**: ဆက်စပ် စကားများကို အတွင်းရေးရာ link များဖြင့် တိကျစွာ ချိတ်ဆက်ထားသည်
- **Chapter Mapping**: template များနှင့် ဥပမာများကို သင်ယူမှု ရည်မှန်းချက်များနှင့် သက်ဆိုင်အောင် မှတ်တမ်းထားသည်

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8-chapter စနစ်နှင့် ကိုက်ညီအောင် သင်ယူမှု ရည်မှန်းချက်များ ပြင်ဆင်ထားသည်
- **🎯 Chapter-Based Assessment**: chapter တစ်ခုပြီးချင်း သတ်မှတ် learning objectives နှင့် လက်တွေ့ လေ့ကျင့်မှုများပါရှိသည်
- **📋 Progress Tracking**: တစ်ပါတ်စီ သင်ယူပုံစံ နှင့် အောင်မြင်မှုများကို တိုင်းတာနိုင်သော စာရင်း
- **❓ Assessment Questions**: chapter တစ်ခုချင်းစီအတွက် ဗဟုသုတ စစ်ဆေးမေးခွန်းများ
- **🛠️ Practical Exercises**: လက်တွေ့ လေ့ကျင့်ခန်းများနှင့် real deployment စถานการณ์များ
- **📊 Skill Progression**: အခြေခံ မှ စ၍ enterprise pattern များအထိ အသိပညာတိုးတက်မှုများကို သေချာ ဖော်ပြသည်
- **🎓 Certification Framework**: professional development အထူးသင်တန်းများနှင့် community မှ အသိအမှတ်ပြုမှုစနစ်
- **⏱️ Timeline Management**: 10-ပတ် သင်ယူရန် စီမံချက်နှင့် မိုင်လ်စတိုင်း အတည်ပြုမှုများ

### [v3.1.0] - 2025-09-17

#### Multi-Agent AI Solutions အား တိုးတက်ကောင်းမွန်စေခြင်း
**ဤဗားရှင်းသည် retail multi-agent ဖြေရှင်းချက်ကို agent အမည်များပိုမိုသေချာစေရန် နှင့် စာတမ်းများကို တိုးတက်စေပါသည်။**

#### Changed
- **Multi-Agent Terminology**: "Cora agent" ကို "Customer agent" ဖြင့် အစားထိုးထားသည် (retail multi-agent ဖြေရှင်းချက်တွင် ပိုမိုရှင်းလင်းစေရန်)
- **Agent Architecture**: documentation, ARM templates, code ဥပမာများအားလုံးတွင် "Customer agent" အမည်ကို သာမန်အသုံးပြုထားသည်
- **Configuration Examples**: agent configuration အပိုင်းများကို ခေတ်မီ အမည်ပြောင်းလဲမှုများနှင့် အတူ ပြုပြင်ထားသည်
- **Documentation Consistency**: အကြောင်းအရာအားလုံးတွင် ပရော်ဖက်ရှင်နယ်၊ ဖော်ပြချက်ပြည့်သော agent အမည်များ အသုံးပြုမှုကို သေချာစေထားသည်

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template ကို Customer agent ရည်ညွှန်းချက်များနှင့် update ပြုလုပ်ထားသည်
- **Architecture Diagrams**: Mermaid diagrams များကို agent အမည်အသစ်ဖြင့် ပြန်လည်သွင်းထားသည်
- **Code Examples**: Python class များနှင့် implementation ဥပမာများတွင် CustomerAgent အမည်ကို အသုံးပြုထားသည်
- **Environment Variables**: deployment script များအား CUSTOMER_AGENT_NAME ကဲ့သို့သော convention သို့ အပ်ဒိတ်ပြုလုပ်ထားသည်

#### Improved
- **Developer Experience**: documentation တွင် agent အခန်း၏ တာဝန်များပိုမိုရှင်းလင်းစေသည်
- **Production Readiness**: enterprise naming convention များနှင့် ပိုမိုသင့်တော်စေသည်
- **Learning Materials**: သင်ကြားမှုအတွက် agent အမည်များ ပိုမိုလက်လှမ်းရရှိစေသည်
- **Template Usability**: agent လုပ်ဆောင်ချက်များနှင့် deployment ပုံစံများ ပိုမိုနားလည်ရလွယ်ကူစေသည်

#### Technical Details
- Mermaid architecture diagram များကို CustomerAgent reference များဖြင့် update ပြုလုပ်ထားသည်
- CoraAgent class name များကို Python ဥပမာများတွင် CustomerAgent ဖြင့် အစားထိုးထားသည်
- ARM template JSON configuration များတွင် "customer" agent type ကို အသုံးပြုရန် ပြင်ဆင်ထားသည်
- Environment variables များကို CORA_AGENT_* မှ CUSTOMER_AGENT_* pattern ပြောင်းလဲထားသည်
- Deployment command များနှင့် container configuration များအား ပြန်လည်စိစစ်ပြီး အပ်ဒိတ်ပြုလုပ်ထားသည်

### [v3.0.0] - 2025-09-12

#### အဓိက ပြောင်းလဲမှုများ - AI Developer အာရုံစိုက်မှုနှင့် Microsoft Foundry ပေါင်းစည်းမှု
**ဤဗားရှင်းသည် repository ကို AI developer၊ engineer များအတွက် ပြည့်စုံသော သင်ယူရန် အရင်းအမြစ်အဖြစ် ပြောင်းလဲပေးပြီး Microsoft Foundry ပေါင်းစည်းမှုကို ထည့်သွင်းထားသည်။**

#### Added
- **🤖 AI-First Learning Path**: AI developer နှင့် engineer များကို ဦးတည်၍ လုံးဝပြန်လည်ဖွဲ့စည်းထားသည်
- **Microsoft Foundry Integration Guide**: AZD ကို Microsoft Foundry services နှင့် ဆက်သွယ်ရန် အပြည့်အစုံ လမ်းညွှန်
- **AI Model Deployment Patterns**: မော်ဒယ် ရွေးချယ်ခြင်း၊ ဖွဲ့စည်းတပ်ဆင်ခြင်းနှင့် production deployment များအတွက် အသေးစိတ်လမ်းညွှန်များ
- **AI Workshop Lab**: 2-3 နာရီ ကြာ လက်တွေ့ လေ့ကျင့်ပို့ချပွဲ — AI အပလီကေးရှင်းများကို AZD သို့ deploy ပြုလုပ်နိုင်သော ဖြေရှင်းချက်များသို့ ပြောင်းလဲခြင်း
- **Production AI Best Practices**: AI ဝတ်လုပ်ငန်းများကို အရွယ်ချဲ့မှု၊ မော်နီတာ၊ နှင့် လုံခြုံစိတ်ချစေရေးအတွက် အဖွဲ့အစည်း အသုံးပြုနိုင်သော ပုံစံများ
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services နှင့် AI deployment ပြဿနာများအတွက် လုံးလုံးလက်လက် ဖြေရှင်းနည်းလမ်းညွှန်
- **AI Template Gallery**: ပြင်းထန်မှု အဆင့် သတ်မှတ်ချက်များ ပါရှိသည့် Microsoft Foundry တမ်းပလိတ် စုစည်းမှု
- **Workshop Materials**: လက်တွေ့လက်ခံ လက်တွေ့ လက်တွေ့ လေ့ကျင့်ခန်းများနှင့် ကိုးကားစာတမ်းများ ပါရှိသည့် ပြီးပြည့်စုံသော အလုပ်ရုံပစ္စည်းများ

#### တိုးတက်ချက်များ
- **README Structure**: AI ဖန်တီးသူတွေအတွက် အာရုံစိုက်ထားပြီး Microsoft Foundry Discord မှ ၄၅% အသိုင်းအဝိုင်း စိတ်ဝင်စားမှု ဒေတာပါဝင်သည့် ဖတ်ရှုမှု အဖွဲ့အစည်း
- **Learning Paths**: ကျောင်းသားများနှင့် DevOps အင်ဂျင်နီယာများအတွက် ရိုးရာ လမ်းကြောင်းများနှင့်အတူ သီးခြား AI ဖန်တီးသူ လေ့လာ မှတ်တမ်း
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart အပါအဝင် ထင်ရှားသော AI တမ်းပလိတ်များ အချက်အလက်
- **Community Integration**: AI သီးသန့် ချန်နယ်များနှင့် ဆွေးနွေးပွဲများ ပါဝင်သော Discord အသိုင်းအဝိုင်း အထောက်အပံ့ မြှင့်တင်ထားခြင်း

#### Security & Production Focus
- **Managed Identity Patterns**: AI သီးသန့် အတည်သတ်ခြင်းနှင့် လုံခြုံရေး ဖွဲ့စည်းမှုများ
- **Cost Optimization**: AI ဝန်ထမ်းလုပ်ငန်းများအတွက် token အသုံးပြုမှု ထိန်းသိမ်းခြင်းနှင့် ဘတ်ဂျက် ထိန်းချုပ်မှုများ
- **Multi-Region Deployment**: ကမ္ဘာတဝှမ်း AI အပလီကေးရှင်း ထုတ်ပေးရန် မဟာဗျူဟာများ
- **Performance Monitoring**: AI သီးသန့် မီထရစ်များနှင့် Application Insights ပေါင်းစည်းခြင်း

#### Documentation Quality
- **Linear Course Structure**: စတင်သူမှ တိုးတက်သူအထိ AI deployment ပုံစံများကို တက်ကြွစွာ လမ်းကြောင်းတိုးတက်စေသော အဆင့်လိုက် ဖွဲ့စည်းမှု
- **Validated URLs**: ဘယ်အပြင် repository link မဆို အတည်ပြုပြီး လက်လှမ်းမီ
- **Complete Reference**: အတွင်း documentation link များအားလုံး အတည်ပြုပြီး လုပ်ဆောင်နိုင်
- **Production Ready**: အမှန်တကယ် အသုံးချနိုင်သော ဥပမာများပါရှိသည့် အဖွဲ့အစည်း တပ်ဆင်နိုင်သော ပုံစံများ

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**ဤဗားရှင်းသည် repository ဖွဲ့စည်းပုံနှင့် အကြောင်းအရာတင်သွင်းပုံများကို ထူးခြားစွာ ပြန်လည်ပြင်ဆင်ထားခြင်းကို ကိုယ်စားပြုပါသည်။**

#### Added
- **Structured Learning Framework**: စာရွက်စာတမ်းများအားလုံးတွင် Introduction, Learning Goals, နှင့် Learning Outcomes အပိုင်းများ ထည့်သွင်းထားခြင်း
- **Navigation System**: လမ်းညွှန်ပေးရန် Previous/Next သင်ခန်းစာလင့်များအား စာရွက်စာတမ်းများတစ်ရွေ့လျှောက် ထည့်သွင်းထားခြင်း
- **Study Guide**: learning objectives, practice exercises, နှင့် assessment materials ပါဝင်သည့် study-guide.md လုံးလုံးလက်လက် လမ်းညွှန်စာတမ်း
- **Professional Presentation**: 접근မြင့်မားမှုနှင့် ပရော်ဖက်ရှင်နယ် ထင်ရှားမှု တိုးတက်စေရန် emoji အိုင်ကွန်များအား စာရွက်စာတမ်းမှ ဖယ်ရှားထားခြင်း
- **Enhanced Content Structure**: သင်ယူမှုအကြောင်းအရာများ၏ အုပ်ချုပ်မှုနှင့် စီးဆင်းမှု ကောင်းမွန်အောင် ဖွဲ့စည်းမှု မြှင့်တင်ခြင်း

#### Changed
- **Documentation Format**: သင်ယူမှုအာရုံစိုက်သော စံတန်းဖြင့် စာရွက်စာတမ်းအားလုံးကို စံမျဉ်းတူပြုပြင်ထားခြင်း
- **Navigation Flow**: သင်ယူမှုအကြောင်းအရာများကို အဓိကသဘောတရားနှင့် အဆင့်လိုက် တက်ကြွစေရန် လမ်းကြောင်းတိုးတက်မှု ထည့်သွင်းထားခြင်း
- **Content Presentation**: ထူးဆန်းဖျော်ဖြေရေး အစိတ်အပိုင်းများကို ဖျက်ပြီး ရှင်းလင်း၍ ပရော်ဖက်ရှင်နယ် ပုံစံသို့ ပြောင်းလဲပေးခြင်း
- **Link Structure**: navigation system အသစ်ကို ထောက်ပံ့ရန် အတွင်းလင့်များအားလုံးကို အပ်ဒိတ်လုပ်ထားခြင်း

#### Improved
- **Accessibility**: စကရင်းရိုးဒါအဖတ်စက်များနှင့် ကောင်းမွန်စေရန် emoji အားလုံး ဖယ်ရှားထားခြင်း
- **Professional Appearance**: အဖွဲ့အစည်း သင်ကြားမှုအတွက် သင့်လျော်သော သန့်ရှင်းပြီး သင်္ကေတနည်း စတိုင် ပုံစံ
- **Learning Experience**: သင်ခန်းစာတစ်ခုချင်းစီအတွက် ရှင်းလင်းသော ရည်မှန်းချက်များနှင့် ရလဒ်များပါသော ဖွဲ့စည်းမှု
- **Content Organization**: ဆက်စပ်ဘာသာရပ်များအကြား လက်ရှိ ဆက်သွယ်မှုနှင့် စည်းမျဉ်း သာလွန်ကောင်းမွန်ခြင်း

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - getting-started guide စာရင်းလုံး
  - deployment နှင့် provisioning အတွက် စုံလင်သော စာရွက်စာတမ်းများ
  - troubleshooting အပြည့်အစုံနှင့် debugging လမ်းညွှန်များ
  - pre-deployment validation ကိရိယာများနှင့် ယန္တရားများ

- **Getting Started Module**
  - AZD Basics: အခြေခံ အယူအဆများနှင့် အရင်းအနှီး တရားစကားလုံးများ
  - Installation Guide: ပလက်ဖောင်းအလိုက် ဖွဲ့စည်းသတ်မှတ်ချက်များ
  - Configuration Guide: ပတ်ဝန်းကျင် သတ်မှတ်ခြင်းနှင့် အတည်ပြုမှု
  - First Project Tutorial: လက်တွေ့ အဆင့်လိုက် လေ့ကျင့်မှု

- **Deployment and Provisioning Module**
  - Deployment Guide: လုံးဝ ကိရိယာ workflow စာရွက်စာတမ်းများ
  - Provisioning Guide: Bicep အသုံးပြု၍ Infrastructure as Code
  - production deployments အတွက် အကောင်းဆုံး လက်တွေ့နည်းလမ်းများ
  - Multi-service အက်ီတက်စ် ပုံစံများ

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource ရရှိနိုင်မှု အတည်ပြုခြင်း
  - SKU Selection: ဝန်ဆောင်မှုအဆင့်များအတွက် လမ်းညွှန်ချက်တိကျစွာ
  - Pre-flight Checks: အလိုအလျောက် စစ်ဆေးနိုင်သော စက်ရုပ် စာ scripts (PowerShell နှင့် Bash)
  - ကုန်ကျစရိတ် ခန့်မှန်းခြင်းနှင့် ဘတ်ဂျက် စီမံခန့်ခွဲမှု ကိရိယာများ

- **Troubleshooting Module**
  - Common Issues: အကြုံတွေ့လေ့ရှိသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
  - Debugging Guide: စနစ်တကျ ဖြေရှင်းနည်းများ
  - အဆင့်မြင့် ရှာဖွေသိရှိမှု နည်းစနစ်များနှင့် ကိရိယာများ
  - တင်ဆက်မှုစွမ်းဆောင်မှု မော်နီတာနှင့် တိုးတက်အောင် ဆောင်ရွက်ခြင်း

- **Resources and References**
  - Command Cheat Sheet: အရေးကြီး command များအတွက် အမြန်ကိုးကား စာရွက်
  - Glossary: အသုံးအနှုန်းနှင့် အကြောင်းအရာ အဝှမ်းအပြည့် ဖော်ပြချက်များ
  - FAQ: မေးခွန်းများအတွက် အသေးစိတ် ဖြေကြားချက်များ
  - အပြင်အဆင် အရင်းအမြစ် လင့်များနှင့် အသိုင်းအဝိုင်း ဆက်သွယ်မှုများ

- **Examples and Templates**
  - စိတ်ရှည် Web Application ဥပမာ
  - Static Website deployment တမ်းပလိတ်
  - Container Application ဖွဲ့စည်းမှု
  - ဒေတာဘေ့စ် ပေါင်းစည်းမှု ပုံစံများ
  - Microservices ဆောက်တည်ပုံစံ ဥပမာများ
  - Serverless function အကောင်အထည်ဖော်မှုများ

#### Features
- **Multi-Platform Support**: Windows, macOS, နှင့် Linux အတွက် installation နှင့် configuration လမ်းညွှန်ချက်များ
- **Multiple Skill Levels**: ကျောင်းသားများမှ ပရော်ဖက်ရှင်နယ်developer များအထိ ကိုက်ညီသော အကြောင်းအရာ
- **Practical Focus**: လက်တွေ့ ဥပမာများနှင့် အမှန်တကယ် ဖြစ်ပျက်စေသော ခံစားမှုများ
- **Comprehensive Coverage**: အခြေခံ အယူအဆများမှ အဆင့်မြင့် အဖွဲ့အစည်း ပုံစံများအထိ အကျယ်တဝန်း ဖော်ပြခြင်း
- **Security-First Approach**: လုံခြုံရေး အကောင်းဆုံးလမ်းညွှန်ချက်များကို တစ်စိတ်တစ်ပိုင်းအဖြစ် ပေါင်းထည့်ထားခြင်း
- **Cost Optimization**: သင့်တော်သော ကုန်ကျစရိတ် ဖြေရှင်းနည်းများနှင့် resource စီမံခန့်ခွဲမှု လမ်းညွှန်ချက်များ

#### Documentation Quality
- **Detailed Code Examples**: လက်တွေ့၊ စမ်းသပ်ပြီးသား ကုဒ် ဥပမာများ
- **Step-by-Step Instructions**: ရှင်းလင်း၍ လက်တွေ့ဆောင်ရွက်နိုင်သော လမ်းညွှန်ချက်များ
- **Comprehensive Error Handling**: ဓာတ်မတည့်သော ပြဿနာများအတွက် troubleshooting
- **Best Practices Integration**: စက်မှုလုပ်ငန်း စံနှုန်းများနှင့် အကြံပြုချက်များ
- **Version Compatibility**: နောက်ဆုံး Azure ဝန်ဆောင်မှုများနှင့် azd အင်္ဂါရပ်များနှင့် ကိုက်ညီမှု

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, နှင့် custom models အတွက် ပေါင်းစည်းမှု ပုံစံများ
- **AI Agent Frameworks**: LangChain, Semantic Kernel, နှင့် AutoGen ပို့ဆောင်မှုများအတွက် တမ်းပလိတ်များ
- **Advanced RAG Patterns**: Azure AI Search အပြင် Pinecone, Weaviate အစရှိသည့် vector database ရွေးချယ်စရာများ
- **AI Observability**: မော်ဒယ် စွမ်းဆောင်ချက်၊ token အသုံးပြုမှုနှင့် ဖြေရှင်းမှု အရည်အသွေး အတွက် မော်နီတာ တိုးမြှင့်ခြင်း

#### Developer Experience
- **VS Code Extension**: AZD + Microsoft Foundry ဖန်တီးသူ အတွေ့အကြုံ ပေါင်းစည်းထားသော extension
- **GitHub Copilot Integration**: AZD တမ်းပလိတ် ဇာတ်အိမ်များအတွက် AI ကူညီသည့် ဖန်တီးမှု
- **Interactive Tutorials**: AI အခြေအနေများအတွက် အလိုအလျောက် အတည်ပြုချက် ပါသော လက်တွေ့ ကုဒ်ရေးခြင်း လေ့ကျင့်ခန်းများ
- **Video Content**: AI ပို့ဆောင်မှုများကို ဗီဒီယို သင်ခန်းစာများဖြင့် အမြင်ရရှိစေရန် ထောက်ပံ့မှု

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI မော်ဒယ် အုပ်ချုပ်မှု၊ လုပ်ထုံးလုပ်နည်းနှင့် audit trail များ
- **Multi-Tenant AI**: တစ်ချိန်တည်းအမျိုးမျိုးသော ဖောက်သည်များကို တစ်သီးတစ်ခြား သီးပုကျပ် အနေဖြင့် ပံ့ပိုးပေးနိုင်သော ပုံစံများ
- **Edge AI Deployment**: Azure IoT Edge နှင့် container instance များနှင့် ပေါင်းစည်းခြင်း
- **Hybrid Cloud AI**: မျိုးစုံ cloud နှင့် hybrid deployment ပုံစံများ

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning pipeline များနှင့် MLOps ပေါင်းစည်းမှု
- **Advanced Security**: Zero-trust ပုံစံများ၊ private endpoints နှင့် အန္တရာယ်ကာကွယ်မှု အဆင့်မြှင့်
- **Performance Optimization**: throughput များသော AI အပလီကေးရှင်းများအတွက် အဆင့်မြှင့် တိတိကျကျ ဆန့်ကျင်မှုနှင့် မျှမျှတတ တိုးတက်မှု
- **Global Distribution**: AI အပလီကေးရှင်းများအတွက် content delivery နှင့် edge caching ပုံစံများ

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: မိုဘိုင်း လေ့လာမှုအတွက် တုံ့ပြန်နိုင်သည့် ဒီဇိုင်း
- **Offline Access**: ဒေါင်းလုတ်လုပ်၍ အသုံးပြုနိုင်သော စာရွက်စာတမ်း package များ
- **Enhanced IDE Integration**: AZD + AI workflow များအတွက် VS Code extension
- **Community Dashboard**: အသိုင်းအဝိုင်း စာရင်းအင်း နှင့် လှုပ်ရှားမှုစာရင်း ဘောဒါ်ရှ်

## Contributing to the Changelog

### Reporting Changes
ဒီ repository သို့ အပြောင်းအလဲများ ပေးပို့ချင်ပါက changelog အကြောင်းစဉ်များတွင် အောက်ပါအချက်များ ပါဝင်စေပါ:

1. **Version Number**: semantic versioning (major.minor.patch) ကို လိုက်နာခြင်း
2. **Date**: ထုတ်ပြန်သည့် သို့မဟုတ် အပ်ဒိတ်ရက် (YYYY-MM-DD)
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: ဘာပြောင်းလဲသွားသည်ကို တိတိကျကျ ဖော်ပြချက်
5. **Impact Assessment**: ပြောင်းလဲမှုများသည် ရှိပြီးသား အသုံးပြုသူများကို မည်သို့ သက်ရောက်မည်နည်း

### Change Categories

#### Added
- အသစ်ထည့်သွင်းသော အင်္ဂါရပ်များ၊ စာရွက်စာတမ်း အပိုင်းများ သို့မဟုတ် စွမ်းရည်များ
- အသစ်ထည့်သွင်းသော ဥပမာများ၊ တမ်းပလိတ်များ သို့မဟုတ် သင်ယူမှု အရင်းအမြစ်များ
- ဖြည့်စွက် tool များ၊ script များ သို့မဟုတ် အကူအညီကိရိယာများ

#### Changed
- ရှိပြီးသား လုပ်ဆောင်ချက်များ သို့မဟုတ် စာရွက်စာတမ်းများတွင် ပြုပြင်ပြောင်းလဲမှုများ
- ဖော်ပြချက်များ တိကျမှု တိုးတက်စေရန် အပ်ဒိတ်လုပ်ခြင်း
- အကြောင်းအရာ သို့မဟုတ် အုပ်ချုပ်မှု ပြန်လည်စီစဉ်ခြင်း

#### Deprecated
- ဖြတ်လမ်း ထုတ်ပယ်ခြင်း လမ်းကြောင်းများ
- ဖယ်ရှားရန် စီစဉ်ထားသော စာရွက်စာတမ်း အပိုင်းများ
- ပိုကောင်းသော အစားထိုးနည်းလမ်းများ ရှိလာသည့် နည်းလမ်းများ

#### Removed
- မသင့်လျော်သော် features၊ စာရွက်စာတမ်း သို့မဟုတ် ဥပမာများ
- အစောပိုင်း သတင်းအချက်အလက်များ သို့မဟုတ် ဖျက်သိမ်းထားသည့် နည်းလမ်းများ
- 重複ဖြစ်သည့် သို့မဟုတ် အပေါင်းချုပ်ထားသည့် အကြောင်းအရာများ

#### Fixed
- စာရွက်စာတမ်း သို့မဟုတ် ကုဒ် အမှားများကို ပြင်ဆင်ခြင်း
- ရှင်းလင်းပြဿနာများ သို့မဟုတ် အဆိုပြုထားသည့် ပြဿနာများကို ဖြေရှင်းခြင်း
- တိကျမှုနှင့် လုပ်ဆောင်နိုင်မှု တိုးတက်စေရန် အရေအတွက်များ

#### Security
- လုံခြုံရေး ပိုင်းဆိုင်ရာ တိုးတက်မှုများ သို့မဟုတ် fixed များ
- လုံခြုံရေး အကောင်းဆုံးလမ်းညွှန်ချက်များ အပ်ဒိတ်များ
- လုံခြုံရေး ညစ်ညမ်းမှုများကို ဖြေရှင်းထုတ်ပေးခြင်း

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- အသုံးပြုသူ လုပ်ဆောင်ရန် လိုအပ်သော breaking changes များ
- အကြောင်းအရာ သို့မဟုတ် အုပ်ချုပ်မှု ပြောင်းလဲမှု အထူးပြင်းထန်သော ပြင်ဆင်မှုများ
- အခြေခံ ချဉ်းကပ်မှု သို့မဟုတ် နည်းပညာ အခြေခံဖွဲ့စည်းမှု ပြောင်းလဲခြင်း

#### Minor Version (X.Y.0)
- အသစ် ထည့်သွင်းထားသော အင်္ဂါရပ်များ သို့မဟုတ် အကြောင်းအရာများ
- backward compatibility ထိန်းသိမ်းထားသည့် တိုးတက်မှုများ
- နမူနာ၊ tool များ သို့မဟုတ် အရင်းအမြစ် အသစ်များ

#### Patch Version (X.Y.Z)
- ဘတ်ဂျ် ပြင်ဆင်မှုများနှင့် အမှားဖျက်ခြင်းများ
- ရှိပြီးသား အကြောင်းအရာများအတွက် ဂရုပြုကောင်းမွန်မှုများ
- ဖော်ပြချက်များကို ပိုမိုရှင်းလင်းစေသော အသေးစိတ် ပြင်ဆင်မှုများ

## Community Feedback and Suggestions

ကျွန်ုပ်တို့သည် ဤ သင်ယူမှု အရင်းအမြစ်ကို ကောင်းမွန်အောင် ပြင်ဆင်ရန် အသိုင်းအဝိုင်း တုံ့ပြန်ချက်များကို အဓိကအားဖြင့် လက်ခံကြသည်။

### How to Provide Feedback
- **GitHub Issues**: ပြဿနာများကို သတင်းပို့ရန် သို့မဟုတ် တိုးတက်စေရန် အကြံပြုချက် ပေးနိုင်သည် (AI သီးသန့် ပြဿနာများ အားလုံး ကြိုဆိုပါသည်)
- **Discord Discussions**: Microsoft Foundry အသိုင်းအဝိုင်းနှင့် အတွေးများ ဝေမျှရန်
- **Pull Requests**: အထူးသဖြင့် AI တမ်းပလိတ်များနှင့် လမ်းညွှန်ချက်များအတွက် တိုက်ရိုက် ကမ်းလှမ်းချက်များ
- **Microsoft Foundry Discord**: AZD + AI ဆွေးနွေးချက်များအတွက် #Azure channel တွင် ပါဝင်ဆွေးနွေးနိုင်သည်
- **Community Forums**: ကျယ်ပြန့်သော Azure ဖန်တီးသူ ဆွေးနွေးပွဲများတွင် ပါဝင်ဆွေးနွေးရန်

### Feedback Categories
- **AI Content Accuracy**: AI ဝန်ဆောင်မှု ပေါင်းစည်းမှုနှင့် deployment အချက်အလက်များ အတွက် ချိုးဖောက်ချက်များ
- **Learning Experience**: AI ဖန်တီးသူ သင်ယူမှု လမ်းကြောင်းပိုမိုကောင်းမွန်စေရန် အကြံပြုချက်များ
- **Missing AI Content**: ထပ်မံလိုအပ်သည့် AI တမ်းပလိတ်များ၊ ပုံစံများ သို့မဟုတ် ဥပမာများ အတွက် တောင်းဆိုချက်များ
- **Accessibility**: မတူကွဲပြားသော သင်ယူမှု လိုအပ်ချက်များအတွက် တိုးတက်မှုများ
- **AI Tool Integration**: AI ဖန်တီးမှု လုပ်ငန်းစဉ်များနှင့် ပိုမိုကောင်းမွန်စေရန် အကြံပြုချက်များ
- **Production AI Patterns**: အဖွဲ့အစည်း AI deployment ပုံစံများအတွက် တောင်းဆိုချက်များ

### Response Commitment
- **Issue Response**: တင်ပြထားသော ပြဿနာများအနေဖြင့် ၄၈ နာရီ အတွင်း တုံ့ပြန်မည်
- **Feature Requests**: တောင်းဆိုချက်များကို တစ်ပတ် အတွင်း သုံးသပ်မည်
- **Community Contributions**: တစ်ပတ် အတွင်း ပြန်လည်သုံးသပ်မည်
- **Security Issues**:  ဦးတည်ချက်မြန်ဆန်စွာ နှင့် အရေးပေါ် ဦးတည်ချက်ဖြင့် တုံ့ပြန်မည်

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: အကြောင်းအရာ တိကျမှုနှင့် လင့်များ အတည်ပြုပြီစစ်ဆေးမှုများ
- **Quarterly Updates**: အဓိက အကြောင်းအရာ ဖြည့်စွက်ခြင်းနှင့် တိုးတက်မှုများ
- **Semi-Annual Reviews**: လုံးလုံးလက်လက် ပြန်လည်စီမံခြင်းနှင့် တိုးတက်မှုများ
- **Annual Releases**: အဓိက ဗားရှင်း အသစ်များနှင့် အရေးပါသော တိုးတက်မှုများ

### Monitoring and Quality Assurance
- **Automated Testing**: ကုဒ် ဥပမာများနှင့် လင့်များအား အလိုအလျောက် အတည်ပြုစစ်ဆေးခြင်း
- **Community Feedback Integration**: အသုံးပြုသူ အကြံပြုချက်များကို ပုံမှန် ထည့်သွင်းဆောင်ရွက်ခြင်း
- **Technology Updates**: နောက်ဆုံး Azure ဝန်ဆောင်မှုများနှင့် azd ထုတ်လုပ်ချက်များနှင့် ကိုက်ညီစေရန် ချိန်းနှိုင်းခြင်း
- **Accessibility Audits**: အပါအဝင် ဒီဇိုင်း အယူအဆများအတွက် ပုံမှန် စစ်ဆေးခြင်း

## Version Support Policy

### Current Version Support
- **Latest Major Version**: ပုံမှန် အပ်ဒိတ်များနှင့် ပြည့်စုံစွာ ထောက်ပံ့ပေးမည်
- **Previous Major Version**: ၁၂ လအတွင်း လုံခြုံရေး အပ်ဒိတ်များနှင့် အရေးပါသော ဖျက်ချုပ် ပြင်ဆင်မှုများ
- **Legacy Versions**: အရာများ၏ အသိုင်းအဝိုင်း ထောက်ပံ့မှုသာ ရရှိမည်၊ တရားဝင် အပ်ဒိတ် မရှိပါ

### Migration Guidance
Major ဗားရှင်းများ ထွက်လာသောအခါ ကျွန်ုပ်တို့ပေးသည့်အရာများမှာ-
- **Migration Guides**: အဆင့်လိုက် ပြောင်းရွှေ့ခြင်း လမ်းညွှန်ချက်များ
- **Compatibility Notes**: breaking changes အကြောင်း အသေးစိတ် မှတ်စုများ
- **Tool Support**: ပြောင်းရွှေ့ရေး အကူအညီ ပေးသည့် script များ သို့မဟုတ် ကိရိယာများ
- **Community Support**: ပြောင်းရွှေ့ရေး စံနှုန်းများအတွက် သီးသန့် ဖိုရမ်များ

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: ဤ repository ကို ကြည့်ရှု၍ သင်ယူမှု စာရွက်စာတမ်းများအတွက် ထုတ်ပြန်ချက်အသစ်များနှင့် အရေးပါ အပ်ဒိတ်များအကြောင်း အချက်ကြောင်း သတိပေးချက်များ ရယူပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
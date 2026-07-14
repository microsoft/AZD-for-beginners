# Changelog - AZD အတွက် စတင်လေ့လာသူများ

## နိဒါန်း

ဒီ changelog က AZD အတွက် စတင်လေ့လာသူများ repository မှတ်တမ်းထားသည့် ပြောင်းလဲမှု၊ update များနဲ့ တိုးတက်မှုအချက်အလက်အားလုံးကို စုစည်းဖော်ပြထားပါတယ်။ ကျွန်ုပ်တို့ semantic versioning သဘောတရားများကို လိုက်နာပြီး ဤမှတ်တမ်းကို အသုံးပြုသူများအတွက် version များအကြား ဘာတွေ ပြောင်းလဲခဲ့သည်ကို နားလည်နိုင်စေရန် ထိန်းသိမ်းထားပါတယ်။

## သင်ယူလိုသည့်ရည်ရွယ်ချက်များ

ဒီ changelog ကို ပြန်လည်သုံးသပ်ဖတ်ရှုခြင်းဖြင့်၊ သင်သည်
- အသစ်ထည့်စရာ features များနဲ့ အကြောင်းအရာ အသစ်များကို အသိပညာရရှိပြီး
- ရှိပြီးသားစာတမ်းများတွင် တိုးတက်မွမ်းမံမှုများကို နားလည်နိုင်ပြီး
- အမှားပြင်ဆင်မှုများနှင့် bug fixes များကို လိုက်နာသိရှိနိုင်ပြီး
- သင်ယူမှု အကြောင်းအရာများ၏ တိုးတက်ဖွံ့ဖြိုးမှုကို အချိန်အလိုက် ဆက်လက်သိရှိနိုင်ပါမည်။

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

changelog entry များကို ကြည့်ပြီးနောက် သင်တတ်နိုင်မှာကတော့
- သင်ယူရန် အသစ်ထည့်သွင်းထားသော အကြောင်းအရာများနှင့် ရင်းမြစ်များကို ဖော်ထုတ်နိုင်မည်
- ဘာများကို update လုပ်ပြီး တိုးတက်ပြောင်းလဲမှုရှိသည်ကို နားလည်နိုင်မည်
- နောက်ဆုံးထုတ်ပြန်ထားသော သင်ခန်းစာများအပေါ် မူတည်၍ သင်ကြားမှုလမ်းကြောင်းကို စီစဉ်နိုင်မည်
- အနာဂတ် တိုးတက်မှုများအတွက် Feedback နှင့် အကြံပြုချက်များ ပေးနိုင်မည်

## Version အစဉ်အလာ မှတ်တမ်း

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: ဗားရှင်းထုတ်လုပ်မှု စိစစ် တင်ပြမှု
**ဤဗားရှင်းမှာ `azd` ရဲ့ `1.27.1` (2026 ခုနှစ် ဇူလိုင်လ၊ နောက်ဆုံးတည်ငြိမ်မှု ထုတ်လွှင့်ချက်) နှင့် လက်ရှိ preview AI agent extension `azure.ai.agents` `1.0.0-beta.5` တို့အပေါ် အတည်ပြုစစ်ဆေးထားပြီး 1.26.0၊ 1.27.0၊ နဲ့ 1.27.1 ထုတ်လုပ်မှုများအပြီးတွင် "validated against" အမှတ်အသားများအားလုံးကို အပ်ဒိတ်လုပ်ပေးလိုက်သည်။**

#### ပြောင်းလဲချက်များ
- **✅ အတည်ပြုပြင်ဆင်မှုအခြေခံမွမ်းမံမှု** ကို `azd 1.25.6` (2026 ခုနှစ် ဇွန်လ) မှ `azd 1.27.1` (2026 ခုနှစ် ဇူလိုင်လ) သို့ ရှုမဝင် README များ၊ ဘာသာရပ်တိုင်း README များ၊ Chapter 1 dev-container သင်ခန်းစာ (pinned-version နမူနာများအပါအဝင်)၊ Chapter 4 custom-templates သင်ခန်းစာ၊ Chapter 5 multi-agent သင်ခန်းစာ နှင့် workshop စာရွက်များ အားသွင်းယူပြင်ဆင်ခဲ့သည်။
- **🤖 Chapter 2 အခြေခံမွမ်းမံမှု** ကို `azd 1.23.12` (2026 ခုနှစ် မတ်လ) မှ `azd 1.27.1` သို့ `agents.md`၊ `ai-model-deployment.md`၊ `ai-workshop-lab.md` နှင့် `microsoft-foundry-integration.md` ပေါ်တွင် ပြောင်းလဲ ပြင်ဆင်ခဲ့ပြီး validation-note ရက်စွဲများကို 2026-07-13 အထိ ဂရုစိုက်ပြင်ဆင်ခဲ့သည်။
- **🧩 AI agent extension တိုးတက်မှု** ကို `azure.ai.agents` ရဲ့ `0.1.40-preview`/`0.1.18-preview` မှ လက်ရှိ `1.0.0-beta.5` ဗားရှင်း သို့ Chapter 2 README နှင့် `agents.md` တွင် တိုးချဲ့ပြင်ဆင်ခဲ့သည်။
- **🧪 Workshop validation နမူနာ** (`azd version` ထုတ်လွှင့်ချက်) ကို `1.27.1` သို့ ပြောင်းလဲ ပြင်ဆင်ခဲ့သည်။

#### azd ချိတ်ဆက်ထုတ်လုပ်မှုများအပေါ်မှတ်ချက်များ (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions များအတွက် Flex Consumption တွင် Go language ပံ့ပိုးမှု၊ `azd config sub-filter` tenant အလိုက် subscription စစ်စစ်သည့် ဖင်တာများ၊ self-contained extension bundle များ (`azd x pack --bundle`), နှင့် `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml` တွင် Azure AI Foundry projects/agents များကို တိုက်ရိုက်မော်ဒယ်ဖြတ်ကိုင် (Bicep မလိုအပ်သော/Terraform မလိုအပ်သော init), App Service အတွက် container deployment ပံ့ပိုးမှု (`host: appservice` + `language: docker`), `azd extension` command များတွင် တိုက်ရိုက် `-s/--source` အသုံးပြုခြင်းနှင့် `azd tool uninstall` လုပ်ဆောင်ချက်များ
- **1.27.1 (2026-07-09):** `azd extension install` အတွက် `--no-dependencies` flag, deprecated မော်ဒယ်များ default အနေဖြင့် catalog/quota မခံရ၊ စာရင်းခွဲခြားမှားယွင်းမှုများ အစရှိသည်တို့ကို ပြင်ဆင်ထားသည်။

#### ပြင်ဆင်ထားသော ဖိုင်များ
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

#### စတင်လေ့လာသူ အား ထည့်သွင်းပြင်ဆင်မှု #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals နှင့် အခြားများ
**ဤဗားရှင်းသည် azd-coverage စစ်တမ်းဖြစ်စဉ်မှ ထွက်ပေါ်လာသော အလယ်အလတ် အနားများအားလုံးကို ပိတ်ပင်ပြီး ကိုယ့် template ကို ဖန်တီးထုတ်ဝေရန်နည်းလမ်း၊ ပြန်လည်ထုတ်လုပ်နိုင်သော dev-container/Codespaces ပတ်ဝန်းကျင်များ၊ Pulumi အခြေခံပေးသည့် infrastructure provider, Azure DevOps CI/CD လမ်းညွှန်ခြင်း, service-principal အတည်ပြုခြင်း, host ရွေးချယ်မှု လမ်းညွှန်ချက်များ (AKS/Spring Apps), `azd restore`/`azd package` အဓိပ္ပါယ်ရှင်းပြချက်, hook errorhandling, နှင့် အဖွဲ့/မွေ့ဝိုင်း ပတ်ဝန်းကျင်များ စနစ်တို့ ပါဝင်သည်။**

#### ထည့်သွင်းချက်များ
- **🧱 Chapter 4 အသစ်သင်ခန်းစာ** `docs/chapter-04-infrastructure/custom-templates.md` — ကိုယ့် azd template ကို ကိုယ့်ဘာသာရေးသားခြင်း၊ လိုအပ်သောဖွဲ့စည်းမှု (`azure.yaml`, `infra/`, `src/`), `metadata.template` အကွက်, infrastructure ကို `uniqueString()` resource token နှင့် `azd-env-name` tag ဖြင့် parameterize လုပ်ခြင်း, ဒေသဆိုင်ရာ `azd init --template <local-path>` ဖြင့် စမ်းသပ်ခြင်း, GitHub တွင် ထုတ်ဝေဖို့, Awesome AZD gallery သို့ တင်ပြရန်
- **📦 Chapter 1 အသစ်သင်ခန်းစာ** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers နှင့် GitHub Codespaces ဖြင့် ပြန်လည်ထုတ်လုပ်နိုင်သော azd ပတ်ဝန်းကျင်များ: အနည်းဆုံး `.devcontainer/devcontainer.json` ရေးဆွဲမှုနှင့် အတည်ပြု `ghcr.io/azure/azure-dev/azd` feature ကိုအသုံးပြုခြင်း၊ ဘာသာစကားပေါ်မူတည်၍ နည်းလမ်းများ၊ container များအတွက် `docker-in-docker`, နှင့် remote sign-in အတွက် `azd auth login --use-device-code`
- **🧩 Pulumi နှင့် azd** `docs/chapter-04-infrastructure/provisioning.md` တွင်ပါတဲ့ အပိုင်း — `infra.provider: pulumi`, Pulumi folder စီစဉ်မှု, azd environment များနှင့် stack များ ဆက်သွယ်မှု, လိုအပ်သော Outputs/Tagging, တူညီသော `azd up` / `azd down` workflow
- **🎯 Host-selection လမ်းညွှန်ချက်** `docs/chapter-04-infrastructure/provisioning.md` တွင် ပါဝင်သည် — Beginner များအတွက် `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, နှင့် `springapp` သဘောတူညီမှုနှိုင်းယှဉ်ချက်များ၊ AKS သို့မဟုတ် Azure Spring Apps ရွေးချယ်မှုအခါအသုံးပြုရန် လမ်းညွှန်ချက်
- **🛠️ Azure DevOps CI/CD လမ်းညွှန်ချက်** `docs/chapter-08-production/production-ai-practices.md` တွင်ပါသည် — `azd pipeline config --provider azdo`, workload identity federation (OIDC) နှင့် service connection, ပြုလုပ်သည့် `azure-dev.yml`, variable-group တပ်ဆင်ပုံ
- **🔑 Service Principals (Pattern 4)** ကို `docs/chapter-03-configuration/authsecurity.md` တွင် ထည့်သွင်း — `az ad sp create-for-rbac`, client secret နှင့် federated/OIDC အသုံးပြု၍ non-interactive `azd auth login`, အသုံးပြုရမည့်အချိန်များ နှင့် လုံခြုံသိမ်းဆည်းမှုနည်းလမ်းများ
- **🪝 Hook errorhandling** subsection ကို `docs/chapter-04-infrastructure/deployment-guide.md` တွင်ပါဝင်သည် — exit codes နှင့် `set -e`, `continueOnError`, `azd hooks run` ဖြင့် ကိုယ်တိုင် စမ်းသပ်ခြင်း, OS နှင့်အလိုက် မှတ်ပုံတင် shell များ, နှင့် `--debug` option
- **👥 အဖွဲ့ / မွေ့ဝိုင်းပတ်ဝန်းကျင်များ** section ကို `docs/chapter-03-configuration/configuration.md` တွင် ပါဝင်သည် — `.azure/` အတွင်း ဖိုင်များ, gitignore ပြုလုပ်ရန်, တစ်ဦးချင်း developer အတွက် environment များ, `azd env list`/`select`, CI/CD တွင် environment တန်ဖိုးများ ပေးသွင်းပုံ
- **🧰 `azd restore` နှင့် သွားပြီးပို၍ဖော်ပြချက်ထည့်သွင်းထားသော `azd package`** ကို `resources/cheat-sheet.md` တွင် ရှင်းပြသည် — dependency များ ပြန်လည်ထည့်သွင်းခြင်းနှင့် deploy လုပ်ရန် အသင့်တော်သော artifact တည်ဆောက်ခြင်း (deploy မလုပ်ဘဲ)

#### ပြောင်းလဲချက်များ
- **🧭 Chapter 4 သင်ခန်းစာများ ဇယား** သစ်သင်ခန်းစာ "ကိုယ့် Template ကိုရေးသားခြင်း" သင်ခန်းစာ (သင်ခန်းစာ 3) ထည့်သွင်း ပြင်ဆင်ပြီး
- **🧭 Chapter 1 သင်ခန်းစာများ ဇယား** သစ်သင်ခန်းစာ "Dev Containers & Codespaces" သင်ခန်းစာ (သင်ခန်းစာ 5) ထည့်သွင်းပြီး `bring-your-own-app.md` နှင့် `dev-containers.md` အကြား navigation footer များကို ချိတ်ဆက်တင်ပြထားသည်။

### [v3.21.0] - 2026-06-16

#### စတင်လေ့လာသူ အား ဖြည့်ဆည်းမှု: မျက်နှာချင်းဆိုင် Multi-Agent သင်ခန်းစာ, "Bring Your Own App," Terraform, နှင့် CI/CD လမ်းညွှန်
**ဤဗားရှင်းသည် စတင်လေ့လာသူများအတွက် အပြည့်အစုံလမ်းညွှန်ကို dhammaနည်း two hands-on lessons (deploy လုပ်နိုင်သော multi-agent walkthrough နှင့် azd ကို ရှိပြီးသား app တွင် ထည့်သွင်းခြင်း), beginner-friendly hooks မိတ်ဆက်မှု, Terraform အပိုင်း, GitHub Actions pipeline လမ်းညွှန်ခြင်း ၁ချက်, preview extension အသစ်များဖော်ပြချက် နှင့် အတည်ပြု မူဝါဒ စာရင်းပေးခြင်းတို့ပါဝင်သည်။**

#### ထည့်သွင်းချက်များ
- **🤝 Chapter 5 အသစ်သင်ခန်းစာ** `docs/chapter-05-multi-agent/multi-agent-basics.md` — လက်တွေ့ လုပ်ဆောင်နိုင်သော agent နှစ်ခု deployment walkthrough (orchestrator + specialists) ကို မူရင်း template (`contoso-creative-writer`) ဖြင့်ကြည့်ရှုသည်။ multi-agent အသုံးပြုရန် အခါအားလုံး, `azd up` workflow, deployed resource များနားလည်မှု, cross-agent tracing, customization, နှင့် သန့်ရှင်းရေး
- **📦 Chapter 1 အသစ်သင်ခန်းစာ** `docs/chapter-01-foundation/bring-your-own-app.md` — ယခင် project တစ်ခုတွင် azd ထည့်သွင်းခြင်း ပြုလုပ်နည်း `azd init` ("လက်ရှိ directory တွင် code ကို အသုံးပြု") နားလည်မှု, `azure.yaml` နှင့် `infra/` အသိပညာ, `azd infra generate`, host များ ရှာဖွေခြင်း, နှင့် `azd up` ဖြင့် deployment
- **🌐 Terraform နှင့် azd** `docs/chapter-04-infrastructure/provisioning.md` တွင် အပိုင်း — `infra.provider: terraform` config, `.tf` folder စီမံခန့်ခွဲမှု, လိုအပ်သော `AZURE_*` outputs နှင့် `azd-env-name` tagging, နှင့် တပ်ဆင်မှု `azd up` / `azd down` workflow (Terraform ပံ့ပိုးမှုဆိုသည်ကို ဒဏ်ရာဖြစ်ခဲ့ခြင်းကို ဖြေရှင်းသည်၊ ပြီးခဲ့သည်မှာ Bicep လက်တွေ့အသုံးပြုခြင်းသာပြသ)
- **⚙️ GitHub Actions လမ်းညွှန် အဆင့်ဆင့်** `docs/chapter-08-production/production-ai-practices.md` — GitHub repo မှ စ၍ automated deploy ထိ: `azd pipeline config`, OIDC federated credentials (သိုလှောင်ထားသောစကားဝှက်မပါ), ပြုလုပ်ပြီး `azure-dev.yml`, secret နှင့် variable များအကြား လမ်းညွှန်ချက်
- **🪝 Beginner "hooks အသစ်လား?" မိတ်ဆက်** `docs/chapter-04-infrastructure/deployment-guide.md` — hook ဆိုတာဘာလဲ, hook-stage ဇယား, အနည်းဆုံး hook ပထမ ဦးဆုံး, နှင့် `azd hooks run` ဖြင့် ကိုယ်တိုင် လုပ်ဆောင်ခြင်း
- **✅ "Deployment ကို အတည်ပြုပါ" စစ်ဆေးစာရင်း** `docs/chapter-01-foundation/first-project.md` ၏ အဆင့် 5 တွင် ထည့်သွင်း - smoke test, health-endpoint စစ်ဆေးခြင်း, တိကျသော အောင်မြင်မှု များ
- **🧩 preview extensions အသစ်များ ရှင်းပြချက်** `azure.ai.skills` နှင့် `azure.ai.connections` (ဘာလဲနဲ့ ဘယ်တော့သုံးရမယ်) ကို `docs/chapter-08-production/production-ai-practices.md` တွင် ပါဝင်သည်။

#### ပြောင်းလဲချက်များ
- **🧭 Chapter 5 သင်ခန်းစာ ဇယား** ပြင်ဆင်ပြီး: `multi-agent-basics.md` သည် ယခု သင်ခန်းစာ 1 ဖြစ်ပြီး (တစ်ခုတည်းသော လက်တွေ့သင်ခန်းစာ), သင်ခန်းစာ 2 သည် Chapter 6 တွင်ရှိပြီး၊ Retail ရှင်းလင်းချက်သည် architecture blueprint ဖြစ်ပြီး တစ်ချက် command template မဟုတ်ပါ။
- **🧭 Chapter 1 သင်ခန်းစာ ဇယား** ထပ်ပြီး "Bring Your Own App" သင်ခန်းစာ (သင်ခန်းစာ 4) ပါဝင်သည်။
- **🔗 ကူးကြိုး Navigation footer များ** အချက်အလက် များပြုပြင်ပြီး: `first-project.md` မှ `bring-your-own-app.md` သို့ ချိတ်ဆက်ရှိသည်။

#### ပြင်ဆင်မှုများ
- **🧱 "Terraform ပံ့ပိုးမှုရှိသည် ဟုဆိုပြီး မပါဝင်ခြင်း" အနားကွက်ကို ပိတ်ပင်ထားပြီ** — အဆိုပါ အတန်းသည် ယခင်က Terraform support ကို ရည်ညွှန်းခဲ့သော်လည်း ပြသမှုရှိခြင်းမရှိခဲ့ပါ။
- **🔀 Chapter 5 cross-links မမှန်ကန်မှု ပြင်ဆင်ပြီး** — multi-agent အကောင်အထည်ဖော်မှု စုံလင်ခြင်းရှိသည်ဟု ညွှန်ပြတဲ့ Link များကို architecture blueprint သာရှိတာဖြစ်ပါကြောင်း ပြင်ဆင်တင်ပြခဲ့သည်။

#### ပြင်ဆင်ထားသော ဖိုင်များ
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(အသစ်)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(အသစ်)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, အပြည့်အစုံ Agent အသက်တာစက်ဝန်း Commands နှင့် Aspire Rebrand

**ဤဗားရှင်းသည် `azd` `1.25.6` (ဇွန် ၂၀၂၆) နှင့် `azure.ai.agents` `0.1.40-preview` extension နှစ်ခုအပေါ် သင်တန်းကို ပြန်လည်အတည်ပြု၊ AI လမ်းညွှန်မှုကို "agent တည်ဆောက်ခြင်း" မှ အေးဂျင့်၏ အသက်တာတစ်လျှောက်လုံး (စမ်းသပ် → အကဲဖြတ် → ပိုမိုကောင်းမွန်စေရန် → ကြည့်ရှု → ဖျက်) သို့ ကွဲပြားဖော်ပြ၊ `azure.ai.skills` နှင့် `azure.ai.connections` preview extension အသစ်များကို မြင်သာစေပြီး ".NET Aspire" → "Aspire" ထုတ်ကုန်ပြန်လည်အမည်ပြောင်းခြင်းကို မှတ်သားထားပါသည်။**

#### ထည့်သွင်းလိုက်သည်
- **🔁 စတင်သင်ယူသူများနှင့် AI အင်ဂျင်နီယာများအတွက် အပြည့်အစုံ agent အသက်တာအချိန်ခရီးကြောင်း ဖော်ပြချက်** :
  - `docs/chapter-01-foundation/azd-basics.md` — Extension များနှင့် AI ကော်မန်းများ အပိုင်းတွင် Lifecycle အပိုင်းဇယား (တည်ဆောက် → စမ်းသပ် → တိုင်းတာ → တိုးတက်စေရန် → ကြည့်ရှု → သန့်ရှင်းရေး) ထည့်သွင်း
  - `docs/chapter-08-production/production-ai-practices.md` — အချို့အသစ် "Agent Lifecycle ကို စီမံခြင်း" အပိုင်းတွင် `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, နှင့် `delete --force` အကြောင်းဖော်ပြ
  - `resources/cheat-sheet.md` — AI Agent Commands ကို `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, နှင့် `delete --force` ဖြင့်ကျယ်ပြန့်စွာဖော်ပြ
- **🧩 အသစ်ထည့်သွင်းသော preview extension များ** : `azure.ai.skills` (agent ကျွမ်းကျင်မှုများကို ပြန်လည်အသုံးပြုနိုင်သည်) နှင့် `azure.ai.connections` (Foundry connections) ကို extensions ဇယားနှင့် cheat sheet တွင် ထည့်သွင်း
- **⏱️ တုံ့ပြန်ချိန်အကြောင်း လမ်းညွှန်ချက်များ** — `azd ai agent invoke` ဥပမာများတွင် စုစုပေါင်းအနောက်အပေါ်ချိန်နှင့် ပထမလုံးအချိန်တိုင်ထိ မျှော်မှန်းချက်များကို ဖော်ပြသည်
- **📌 ဗားရှင်းဘန်နာ** ကို root README တွင် ထည့်သွင်းပြီး သင်ယူသူများအား `azd version` နှင့် `azd upgrade` သို့ ဦးတည်ရန် ဖော်ပြသည်

#### ပြောင်းလဲချက်များ
- **✅ အတည်ပြုခြင်းအခြေခံပမာဏကို `azd 1.23.12` (မတ် ၂၀၂၆) မှ `azd 1.25.6` (ဇွန် ၂၀၂၆) သို့ အခန်းတိုင်း READMEs နှင့် workshop စာရွက်များတွင် ပြောင်းလဲ
- **🤖 အခန်း ၂ ရဲ့ extension မှတ်ချက်ကို `azure.ai.agents` `0.1.18-preview` မှ `0.1.40-preview` သို့ ပြင်ဆင်
- **🧪 Workshop အတည်ပြုမှု ဥပမာများ** (`azd version` အထုတ်) ကို `1.25.6` သို့ အပ်ဒိတ်လုပ်
- **🧭 README "azd တွင် ယနေ့ဘာအသစ်ရှိသနည်း"** ကို အီးဇ်ဂျင့်အသက်တာလမ်းကြောင်း အကုန်လုံး၊ အသစ်ထည့်သွင်း AI extension များနဲ့ လက်ရှိ အရည်အချင်းတိုးတက်မှုများ (`azd init` လက်ခံထားမှု ပြန်လည်လုပ်ခြင်း, `azd auth login` စက်လျင်မြန် Tokens အမှုရှင်းခြင်း၊ `azd tool` ပထမသုံးဆောင်မှု တုံ့ပြန်ချက်) ပြန်လည်တင်ပြ
- **📖 အခန်း ၂ ရဲ့ agents.md (ရွေးချယ်စရာ ၄)** သည် သင်ကြားသူများအား post-deploy lifecycle များတွင် ဦးတည်စေပြီး `azd up` တွင် မနားသောအစား ဖော်ပြ

#### ပြင်ဆင်ချက်များ
- **🏷️ ထုတ်ကုန်အမည်ပြောင်းခြင်း** — Aspire ပြန်လည်အမည်ပြောင်းခြင်းမှတ်ချက် ထည့်သွင်း (".NET Aspire" မှာ ယခု "Aspire" သာ ဖြစ်သည်); azd ၏ Aspire ပံ့ပိုးမှု မပြောင်းလဲ
- **🔎 တိုက်ရိုက်ထုတ်ပေးမှု အတည်ပြုရန်** Azure Developer CLI ထုတ်ပေးမှု ပြားအတွက်: stable CLI `1.25.6` (2026-06-12) နှင့် `azure.ai.agents` `0.1.40-preview` (2026-06-15) ပြုလုပ်ပြီး

#### ဖိုင်များ ပြင်ဆင်ထားသည်
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

#### စတင်ခေါ်ယူသူလက်ခံမှုရှင်းလင်းချက်၊ စနစ်ဖွင့်လှစ်မှု အတည်ပြုခြင်းနှင့် နောက်ဆုံး AZD ကော်မန်းများ ရှင်းလင်းခြင်း
**ဤဗားရှင်းသည် AZD 1.23 အတည်ပြုမှု လမ်းကြောင်းပြန်လည်မျှော်စင်ပြီး စတင်သင်ယူသူများ အတည်ပြုမှုများ, သိမ်းဆည်းမှုပြုလုပ်မှုစနစ်ဖွင့်လှစ်မှုစခရစ်ပတ်များ ထည့်သွင်း, အသီးသီးသော AZD CLI နှင့် မဟာဗျူဟာ ကော်မန်းများကိုအတည်ပြုနှင့် ပြင်ဆင်ခြင်း အပြင် Changelog ပြင်ပမှ နောက်ဆုံး အသုံးမပြုတော့သော အင်္ဂလိပ်ဘာသာကော်မန်းများကို ဖယ်ရှားထားသည်။**

#### ထည့်သွင်းသည်
- **🧪 စတင်သင်ယူသူ setup validation စခရစ်ပတ်များ** `validate-setup.ps1` နှင့် `validate-setup.sh` ဖြင့် Chapter 1 စတင်ခြင်းမပြုခင် လိုအပ်သော ကိရိယာများ ရှိမရှိ မဟုတ်မဖြစ်စစ်ဆေးနိုင်
- **✅ စတင်လုပ်ငန်းစဉ် validation အဆင့်များ** root README နှင့် Chapter 1 README တွင် ထည့်သွင်းပြီး `azd up` မပြုလုပ်ခင် လိုအပ်ချက်များ မပါလျှင် ဖမ်းဆီး

#### ပြောင်းလဲသည်
- **🔐 စတင်သင်ယူသူ authentication လမ်းညွှန်ချက်များ** အရ `azd auth login` ကို AZD workflows အတွက် အဓိကလမ်းကြောင်းကဲ့သို့ ဆက်တိုက် အသုံးပြု, မရနိုင်သောအခါသာ `az login` ကိုရွေးချယ်ရန် သတ်မှတ်
- **📚 အခန်း ၁ onboarding လမ်းကြောင်း** သင်ယူသူများအား ဒေသခံ setup စစ်ဆေးမှု ပြုလုပ်ပြီးမှ တပ်ဆင်ခြင်း, authentication, ပထမ deployment အဆင့်များ စတင်ရန် ဦးတည်
- **🛠️ Validator ဆက်သွယ်ချက်များ** AZD သာ အသုံးပြုသော စတင်သင်ယူသူလမ်းကြောင်းအတွက် ဖြတ်တောက်တားမြစ်ချက်များကို ၊ optional Azure CLI ဂရုစိုက်ရန် သတိပေးချက်များမှ ပြတ်သားခွဲခြားပြသ
- **📖 configuration, troubleshooting နှင့် ဥပမာစာရွက်များ** တွင် လိုအပ်သော AZD authentication နှင့် Optional Azure CLI sign-in ဆိုင်ရာ များကို ယခင်က context မရှိဘဲ ဖော်ပြမှုများအား ခြားနားစေရန် ပြင်ဆင်

#### ပြင်ဆင်ချက်များ
- **📋 ကျန်ရှိသော အင်္ဂလိပ်ဘာသာ ကော်မန်းများ** လက်ရှိ AZD ပုံစံများဖြင့် ပြောင်းလဲထားပြီး အထူးသဖြင့် cheat sheet ၏ `azd config show` နှင့် `azd monitor --overview` (Azure Portal နေရာညွှန်မှုရှိသောနေရာ)
- **🧭 အခန်း ၁ တွင် စတင်သင်ယူသူမှု အာမခံချက်များ** မှားယွင်းမရှိသော rolled back များ မရှိမှုအထိ အာမခံချက်များ မထူးထူးခြားခြား မပြုရန် ကြီးစိုးချ
- **🔎 တိုက်ရိုက် CLI validation** သည် `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, နှင့် `azd down --force --purge` များကို လက်ရှိ ထောက်ခံချက်ဖြင့် အတည်ပြု

#### ဖိုင်များ ပြင်ဆင်ထားသည်
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

#### AZD 1.23.12 အတည်ပြုခြင်း, Workshop ပတ်ဝန်းကျင်ကျယ်ပြန့်ခြင်းနှင့် AI မော်ဒယ် အသစ်များပြောင်းလဲခြင်း
**ဤဗားရှင်းသည် `azd` `1.23.12` အပေါ် အတည်ပြုမှု စစ်ဆေး၊ ဆော့ဖ်ဝဲ AZD ကော်မန်း ဥပမာအဟောင်းများကို ပြုပြင်၊ AI မော်ဒယ် လမ်းညွှန်ချက်များကို ယနေ့လက်ရှိ ကိုယ်ပိုင် ပုံစံများဖြင့် ပြောင်းလဲပြီး၊ GitHub Codespaces အပြင် dev containers နှင့် ဒေသန့်ค clones များကိုပါ ပံ့ပိုးရန် workshop ညွှန်ကြားချက်များ ကျယ်ပြန့်စေသည်။**

#### ထည့်သွင်းသည်
- **✅ အခြေခံ အခန်းများနှင့် workshop စာရွက်များအလိုက် အတည်ပြု မှတ်ချက်များ** သင်ကြားသူများအတွက် AZD testing baseline ကို ပြတ်သားစွာ ဖော်ပြ
- **⏱️ စောင့်ကြည့်ချိန် လမ်းညွှန်ချက်များ** AI app deployment များအတွက် `azd deploy --timeout 1800`
- **🔎 Extension စစ်ဆေးခြင်း အဆင့်များ** `azd extension show azure.ai.agents` ဖြင့် AI workflow စာရွက်များတွင် ဖော်ပြ
- **🌐 Workshop ပတ်ဝန်းကျင် လမ်းညွှန်ချက်များ** GitHub Codespaces, dev containers နှင့် ဒေသန္တ clones များအပေါ် MkDocs ဖြင့် ဖော်ပြ

#### ပြောင်းလဲသည်
- **📚 Chapter များ၏ အနိမ့်အမြင့် README များ** foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting နှင့် production အပိုင်းများတွင် `azd 1.23.12` ကို အတည်ပြုမှု အနေဖြင့် ဖော်ပြနေသည်
- **🛠️ AZD ကော်မန်း မူကွဲများ** ကို docs အနှံ့လက်ရှိ ပုံစံများအတိုင်းပြောင်းလဲ:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` သို့မဟုတ် `azd env get-value(s)` (အကြောင်းအရာအရ)
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` (Application Insights အနှာတ)
- **🧪 Provision preview ဥပမာများ** ကို လက်ရှိ ပံ့ပိုးမှုဖြင့်ရိုးရှင်းခွင့်ပြု `azd provision --preview` နှင့် `azd provision --preview -e production`
- **🧭 Workshop လုပ်ငန်းစဉ်** ကို Codespaces, dev container သို့ local clone တွင် ပြီးမြောက်နိုင်ရန် ပြောင်းလဲ ပြသ
- **🔐 Authentication လမ်းညွှန်ချက်** ကို AZD workflows အတွက် `azd auth login` ကို အားသာချက်ဖြင့် အတည်ပြု, Azure CLI ကွန်မန္များကို တိုက်ရိုက် အသုံးပြုမှုတွင်သာ `az login` ကို ရွေးစရာထား

#### ပြင်ဆင်ချက်များ
- **🪟 Windows installation ကော်မန်းများ** Installation လမ်းညွှန်အတွက် လက်ရှိ `winget` package casing ဖြင့် ပြင်ဆင်ထား
- **🐧 Linux installation လမ်းညွှန်ချက်** ကို မပံ့ပိုးသော distro အလိုက် `azd` package manager အကြောင်း အကြံပြုချက်များခန့်မှန်းခြေ ရေရှည် assets သို့ ဦးတည်စေ
- **📦 AI မော်ဒယ် ဥပမာများ** ကို အဟောင်း default များဖြစ်သော `gpt-35-turbo` နှင့် `text-embedding-ada-002` မှ ယခု `gpt-4.1-mini`, `gpt-4.1`, နှင့် `text-embedding-3-large` အစားထိုး
- **📋 Deployment နှင့် diagnostic ငှားယူမှုများ** တာဝန်ရှိသော log, script များနှင့် troubleshooting အဆင့်များတွင် လက်ရှိ environment နှင့် status commands များကို အသုံးပြု
- **⚙️ GitHub Actions လမ်းညွှန်ချက်များ** ကို `Azure/setup-azd@v1.0.0` မှ `Azure/setup-azd@v2` သို့ အပ်ဒိတ်
- **🤖 MCP/Copilot ခွင့်ပြုချက် လမ်းညွှန်ချက်** ကို `azd mcp consent` မှ `azd copilot consent list` သို့ ပြောင်းလဲ

#### တိုးတက်မှုများ
- **🧠 AI အခန်း လမ်းညွှန်ချက်များ** အခုလက်ရှိ preview-sensitive `azd ai` လုပ်ဆောင်ချက်, tenant-specific login, လက်ရှိ extension အသုံးပြုပုံနှင့် မော်ဒယ် deployment အကြံပြုမှုအသစ်များရှင်းလင်းပြသ
- **🧪 Workshop ညွှန်ကြားချက်များ** အခုလက်ရှိ ဗားရှင်းဥပမာများနှင့် ပိုမိုနားလည်ရလွယ်သော ပတ်ဝန်းကျင် setup ဘာသာစကားအသုံးပြု
- **📈 Production နှင့် troubleshooting စာရွက်များ** လက်ရှိ monitoring, fallback model နှင့် ကုန်ကျစရိတ်အဆင့် ဥပမာများနှင့် ပိုမိုကိုက်ညီအောင် ပြင်ဆင်

#### ဖိုင်များ ပြင်ဆင်ထားသည်
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

#### AZD AI CLI ကော်မန်းများ၊ အကြောင်းအရာ အတည်ပြုခြင်းနှင့် Template ကျယ်ပြန့်ခြင်း
**ဤဗားရှင်းသည် `azd ai`, `azd extension`, နှင့် `azd mcp` များအား AI နှင့် ပတ်သက်သည့် အခန်းအားလုံးတွင်ထည့်သွင်း၊ agents.md တွင် ချိုးဖောက်သောလင့့်များနှင့် အဟောင်းကုဒ်များ ပြင်ဆင်ပြီး cheat sheet ကို နောက်အသစ်ပြုလုပ်၊ နမူနာ Templates အပိုင်းကို အတည်ပြုထားသော ဖော်ပြချက်များနှင့် အသစ်ထည့်သွင်းထားသော Azure AI AZD templates များဖြင့် ပြန်လည်ပြင်ဆင်သည်။**

#### ထည့်သွင်းသည်
- **🤖 AZD AI CLI ဖုံးကွယ်မှု** (ယခင်တွင် အခန်း 8 မှသာရှိသည်) 7 ဖိုင်အားလုံးတွင် ဖော်ပြ:
  - `docs/chapter-01-foundation/azd-basics.md` — Extension များနှင့် AI ကော်မန်းများ အပိုင်းသစ်တွင် `azd extension`, `azd ai agent init`, နှင့် `azd mcp` အသစ်များ မိတ်ဆက်
  - `docs/chapter-02-ai-development/agents.md` — ရွေးချယ်စရာ 4: `azd ai agent init` နှင့် မှန်းဆထားချက်ဇယား (template နှင့် manifest နည်းလမ်းများ)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" နှင့် "Agent-First Deployment" စာပိုဒ်များ

  - `docs/chapter-05-multi-agent/README.md` — လျင်မြန်စွာစတင်ခြင်းတွင် template နှင့် manifest အခြေပြု 배포 လမ်းကြောင်းနှစ်မျိုးကို ပြသပါသည်
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy အပိုင်းတွင် `azd ai agent init` ရွေးချယ်စရာအသစ်ထည့်သွင်းထားသည်
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" အခန်းငယ်ပိုင်း
  - `resources/cheat-sheet.md` — အသစ် "AI & Extensions Commands" အပိုင်း၊ `azd extension`, `azd ai agent init`, `azd mcp`, နှင့် `azd infra generate` ပါဝင်သည်
- **📦 အသစ်ထည့်သွင်းသော AZD AI နမူနာ template များ** `microsoft-foundry-integration.md` တွင်-
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel နှင့် အသံစကားသံ ပေါင်းစပ်ထားသော .NET RAG စကားပြောမှု
  - **azure-search-openai-demo-java** — Langchain4J နှင့် ACA/AKS 배포 ရွေးချယ်စရာများပါသော Java RAG စကားပြောမှု
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding နှင့် Prompty အသုံးပြု multi-agent ဖန်တီးရေးဆွဲမှု app
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ဖြင့် Ollama local dev ကို ထောက်ပံ့ပေးသော serverless RAG
  - **chat-with-your-data-solution-accelerator** — ပိုင်ရှင်တည်းဖြတ်ခွင့်နှင့် Teams ပေါင်းစည်းမှု၊ PostgreSQL/Cosmos DB ရွေးချယ်စရာများပါရှိသော Enterprise RAG အရရှိမြန်ဆန်စေခြင်း
  - **azure-ai-travel-agents** — .NET, Python, Java, နှင့် TypeScript ဆာဗာများနှင့် multi-agent MCP orchestration ကိုယ်စားလှယ် app ကို ရည်ညွှန်းသည်
  - **azd-ai-starter** — အနည်းဆုံး Azure AI အဆောက်အအုံ Bicep စတား template
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (template 80+ ခု) ကို ရည်ညွှန်းချက်

#### ပြုပြင်ပြီး
- **🔗 agents.md navigation**: vorige/Next ချိတ်သည် Chapter 2 README သင်ခန်းစာ စီတန်းမှုနှင့် ကိုက်ညီပြီ (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ပြတ်ယွင်းသော link များ**: `production-ai-practices.md` ကို `../chapter-08-production/production-ai-practices.md` သို့မှန်ကန်စေရန် ပြင်ဆင်ခဲ့သည် (3 ကြိမ်)
- **📦 agents.md သုံးမရသော code**: `opencensus` ကို `azure-monitor-opentelemetry` နှင့် OpenTelemetry SDK ဖြင့် အစားထိုးခဲ့သည်
- **🐛 agents.md မမှန်သော API**: `max_tokens` ကို `create_agent()` မှ `create_run()` များသို့ `max_completion_tokens` အနေဖြင့် ညွှန်ပြောင်းထားသည်
- **🔢 agents.md token တွက်ချက်မှု**: မမှန်သော `len//4` ခန့်မှန်းချက်ကို `tiktoken.encoding_for_model()` ဖြင့် အစားထိုးခဲ့သည်
- **azure-search-openai-demo**: "Cognitive Search + App Service" မှ "Azure AI Search + Azure Container Apps" သို့ဝန်ဆောင်မှုများကို ပြင်ဆင်သည် (ပုံမှန် host ကို 2024 ခုနှစ် အောက်တိုဘာတွင် ပြောင်းလဲသည်)
- **contoso-chat**: ပေါင်းစပ်ရေးဆွဲမှုနှင့် repo မှန်ကန်မှုနှင့် နည်းပညာ အခြေခံဖြစ်အောင် Azure AI Foundry + Prompty ကို ဖော်ပြသည့် ဖော်ပြချက်ကို update ပြုလုပ်ခဲ့သည်

#### ဖယ်ရှားသိမ်းဆည်းပြီး
- **ai-document-processing**: ပြုပြင်၍မရသော template ရည်ညွှန်းချက် ဖယ်ရှားပြီး (repo ကို AZD template အဖြစ် ဆိုင်ရာပြင်ပမှ မရရှိနိုင်)

#### ကောင်းမွန်လာစေခဲ့သည်
- **📝 agents.md လေ့ကျင့်ခန်းများ**: လေ့ကျင့်ခန်း 1 တွင် မျှော်မှန်းထားသော output နှင့် `azd monitor` အဆင့်ပြသသည်; လေ့ကျင့်ခန်း 2 တွင် FunctionTool မှတ်ပုံတင်မှု code ပြည့်စုံသည်; လေ့ကျင့်ခန်း 3 တွင် မွန်ခင်းသော `prepdocs.py` အမိန့်များဖြင့် ပြောင်းလဲခဲ့သည်
- **📚 agents.md အရင်းအမြစ်များ**: Azure AI Agent Service စာတမ်းများနှင့် လျင်မြန်စွာစတင်ရန် အတိုကောက် link များကို update ပြုလုပ်ခဲ့သည်
- **📋 agents.md နောက်လှမ်းခွင့် ဇယား**: စာပေမြောက် AI ဂျာနယ်လိင်အဖွဲ့လင့်ခ် ထည့်သွင်းထားသည်

#### update ပြုလုပ်သည့် ဖိုင်များ
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### သင်ခန်းစာ များအတွက် လမ်းညွှန် တိုးတက်မှု
**ဤဗားရှင်းမှ README.md အခန်းများအတွက် တိုးတက်ကောင်းမွန်သော ဇယားဖော်ပြမှု ရယူထားသည်။**

#### ပြောင်းလဲမှုများ
- **သင်ခန်းစာဇယား**: သင်ခန်းစာတိုက်ရိုက်ချိတ်ဆက်မှုများ၊ သင်တန်းကြာမြင့်ချိန်နှင့် ရှုပ်ထွေးမှုအဆင့်များ တိုးတက်အောင် ဖြည့်စွက်ထားသည်
- **ဖိုလ်ဒါ မလိုအပ်သောအရာဖယ်ရှားခြင်း**: အဟောင်းဖိုလ်ဒါများ (deployment/, getting-started/, pre-deployment/, troubleshooting/) ဖယ်ရှားခဲ့သည်
- **လင့်ခ် အတည်ပြုခြင်း**: သင်ခန်းစာဇယားရှိ 21+ အတွင်းရေးလင့်ခ်များအားလုံး စစ်ဆေးပြီး

### [v3.16.0] - 2026-02-05

#### ထုတ်ကုန်အမည်အသစ် ပြောင်းလဲမှုများ
**ဤဗားရှင်းတွင် Microsoft အမှတ်တံဆိပ်အသစ်အလိုက် ထုတ်ကုန်အမည်များကို update လုပ်ထားသည်။**

#### ပြောင်းလဲမှုများ
- **Microsoft Foundry → Microsoft Foundry**: ဘာသာပြန် မဟုတ်သော ဖိုင်များတွင် အားလုံးကို update ပြုလုပ်သည်
- **Azure AI Agent Service → Foundry Agents**: နောက်ဆုံးအမှတ်တံဆိပ်ရန်အတွက် ဝန်ဆောင်မှုအမည် ပြောင်းလဲသွားသည်

#### ဇယားများ update ပြုလုပ်ခြင်း
- `README.md` - အဓိက သင်ခန်းစာ စတင်စာမျက်နှာ
- `changelog.md` - ဗားရှင်း မှတ်တမ်း
- `course-outline.md` - သင်ခန်းစာဖွဲ့စည်းမှု
- `docs/chapter-02-ai-development/agents.md` - AI သံတမန္လမ်းညွှန်
- `examples/README.md` - နမူနာ စာတမ်း
- `workshop/README.md` - လေ့ကျင့်ခန်း စတင်စာမျက်နှာ
- `workshop/docs/index.md` - လေ့ကျင့်ခန်း အညွှန်းစာမျက်နှာ
- `workshop/docs/instructions/*.md` - လေ့ကျင့်ခန်း ကြေညာချက်ဖိုင်များအားလုံး

---

### [v3.15.0] - 2026-02-05

#### Repository အဓိကပြုပြင်ခြင်း: အခန်းလိုက် ဖိုလ်ဒါ အမည်များ
**ဤဗားရှင်းတွင် စာတမ်းများကို အခန်းအလိုက် စုပြီး လမ်းညွှန်ပုံ များ ပိုမိုရှင်းလင်းအောင် ပြုပြင်ထားသည်။**

#### ဖိုလ်ဒါ အမည် ပြောင်းလဲမှုများ
အဟောင်းဖိုလ်ဒါများကို အခန်းနံပါတ်ဖြင့် ဖိုလ်ဒါအသစ်များဖြင့် အစားထိုးမှု-
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- အသစ်ထည့်သွင်းသည် - `docs/chapter-05-multi-agent/`

#### ဖိုင် လွှဲပြောင်းမှုများ
| ဖိုင် | မှ | သို့ |
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
| pre-deployment ထဲရှိ ဖိုင်အားလုံး | pre-deployment/ | chapter-06-pre-deployment/ |
| troubleshooting ထဲရှိ ဖိုင်အားလုံး | troubleshooting/ | chapter-07-troubleshooting/ |

#### ထည့်သွင်းပြီး
- **📚 အခန်း README ဖိုင်များ**: အခန်းတိုင်းတွင် README.md ဖိုင် ပြုလုပ်ပြီး-
  - သင်ယူရမည့် ရည်ရွယ်ချက်များနှင့် ကြာမြင့်ချိန်
  - သင်ခန်းစာဇယားနှင့် ဖော်ပြချက်များ
  - လျင်မြန်စတင်ရန် command များ
  - အခြားအခန်းများသို့ လမ်းညွှန်မှု

#### ပြောင်းလဲပြီး
- **🔗 အတွင်းရေးလင့်ခ်အားလုံးကို update ပြုလုပ်ခြင်း**: စာတမ်းအားလုံးတွင် 78+ လမ်းကြောင်း
- **🗺️ အဓိက README.md**: သင်ခန်းစာဇယားကို အခန်းဖွဲ့စည်းမှူအသစ်ဖြင့် ပြင်ဆင်ထားသည်
- **📝 examples/README.md**: အခန်းဖိုလ်ဒါများသို့ လင့်ခ်များကို update ပြုလုပ်ခဲ့သည်

#### ဖယ်ရှားပြီး
- အဟောင်းဖိုလ်ဒါ အစီအစဉ် (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository ပြုပြင်ခြင်း: အခန်း လမ်းညွှန်ခြင်း
**ဤဗားရှင်းတွင် အခန်း လမ်းညွှန် README ဖိုင်များ ထည့်သွင်းပြီး (v3.15.0 တွင် အစားထိုးထားသည်)။**

---

### [v3.13.0] - 2026-02-05

#### လက်ရှိ AI Agents မောင်းနှင်သူ လမ်းညွှန် စာတမ်းအသစ်
**ဤဗားရှင်းသည် Azure Developer CLI ဖြင့် AI agents 배포 လုပ်ခြင်းကို တစ်စိတ်တစ်ပိုင်း ကျယ်ပြန့်စွာ လမ်းညွှန်ထားသည်။**

#### ထည့်သွင်းပြီး
- **🤖 docs/microsoft-foundry/agents.md**: အပြည့်အစုံလမ်းညွှန်ချက်များ-
  - AI agents ဆိုသည်မှာ ဘာလဲ၊ chatbot များနှင့် မတူညီချက်များ
  - စတင်ဖွဲ့စည်းနိုင်သော agent template သုံးမျိုး (Foundry Agents, Prompty, RAG)
  - Agent အုပ်စုဖွဲ့ပုံစံများ (single agent, RAG, multi-agent)
  - ကိရိယာများ စက်တင်နှင့် ကိုယ်ပိုင်ပြင်ဆင်ခြင်း
  - မူကြမ်းစောင့်ကြည့်မှု နှင့် စာရင်းတင်ခြင်း
  - ကုန်ကျစရိတ် သုံးသပ်မှုနှင့် တိုးတက်အောင်လုပ်ခြင်း
  - ပုံမှန်ဖြေရှင်းရန် အခက်အခဲများ
  - လက်တွေ့လုပ်ငန်း သုံးခုနှင့် အောင်မြင်မှု သတ်မှတ်ချက်များ

#### အကြောင်းအရာဖွဲ့စည်းမှု
- **နိဒါန်း**: စတင်သူများအတွက် အ_AGENT_ အကြောင်းသင်ခန်းစာ
- **လျင်မြန် စတင်ခြင်း**: agents များကို `azd init --template get-started-with-ai-agents` ဖြင့် 배포
- **ဖွဲ့စည်းပုံ များ**: Agent pattern များ ဗျူဟာဇယားများ
- **စနစ်တကျ ပြင်ဆင်ခြင်း**: ကိရိယာများ ရှိဒ်ကို သတ်မှတ်ခြင်းနှင့်ပတ်သက်မှု
- **စောင့်ကြည့်ခြင်း**: Application Insights ပေါင်းစည်းမှု
- **လေ့ကျင့်မှုများ**: အဆင့်ဆင့် လက်တွေ့သင်ယူခြင်း (တစ်ခုချင်း 20-45 မိနစ်)

---

### [v3.12.0] - 2026-02-05

#### DevContainer ပတ်ဝန်းကျင်အား အသစ်ပြင်ဆင်ခြင်း
**AZD သင်ယူမှုအတွေ့အကြုံအတွက် နောက်ဆုံးအဆင့်ကိရိယာများနှင့် ကောင်းမွန်သော default များဖြင့် development container စနစ်ပြောင်းလဲခြင်း။**

#### ပြောင်းလဲမှုများ
- **🐳 ကုန့်များ Image**: `python:3.12-bullseye` မှ `python:3.12-bookworm` (နောက်ဆုံးသတ်မှတ်ထားသော Debian stable) သို့ အပ်ဒိတ်လုပ်ခြင်း
- **📛 ကုန်တင်အမည်**: "Python 3" မှ "AZD for Beginners" သို့ အမည်ပြောင်း၍ ပိုမိုရှင်းလင်းအောင် ပြုလုပ်

#### ထည့်သွင်းပြီး
- **🔧 အသစ်ထည့်သွင်း Dev Container လက္ခဏာများ**:
  - `azure-cli` နှင့် Bicep ထောက်ပံ့မှု ဖွင့်ထားသည်
  - `node:20` (AZD template များအတွက် LTS ဗားရှင်း)
  - `github-cli` template စီမံခန့်ခွဲမှုအတွက်
  - `docker-in-docker` container app 배포 အတွက်

- **🔌 ပေါ့့တ်ဖော်ဒင်း**: ပုံမှန်ဖွံ့ဖြိုးရေးအတွက် ပြင်ဆင်ထားသော ပေါ့့တ်များ:
  - 8000 (MkDocs 미리보기)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 အသစ်ထည့်သွင်း VS Code Extension များ**:
  - `ms-python.vscode-pylance` - မြှင့်တင်ထားသော Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ထောက်ပံ့မှု
  - `ms-azuretools.vscode-docker` - Docker ထောက်ပံ့မှု
  - `ms-azuretools.vscode-bicep` - Bicep ဘာသာစကား ထောက်ပံ့မှု
  - `ms-azure-devtools.azure-resource-groups` - Azure resource စီမံခန့်ခွဲမှု
  - `yzhang.markdown-all-in-one` - Markdown တည်းဖြတ်မှု
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid ဇယား ထောက်ပံ့မှု
  - `redhat.vscode-yaml` - YAML ထောက်ပံ့မှု (azure.yaml အတွက်)
  - `eamodio.gitlens` - Git မြင်ကွင်းအာရုံ
  - `mhutchie.git-graph` - Git မှတ်တမ်း

- **⚙️ VS Code Settings**: Python interpreter, သိမ်းခြင်းအချိန် ပုံစံနှင့် နေရာအနည်းငယ်ဖြတ်ခြင်း အတွက် ပုံမှန်အချက်အလက်များ ထည့်သွင်းခဲ့သည်

- **📦 requirements-dev.txt အပ်ဒိတ်**:
  - MkDocs minify plugin ထည့်သွင်းပြီး
  - code ကျွမ်းကျင်မှုအတွက် pre-commit ထည့်သွင်းပြီး
  - Azure SDK package များ ပါဝင်သည် (azure-identity, azure-mgmt-resource)

#### ပြုပြင်ပြီး
- **Post-Create Command**: ကုန်တင်ဖွင့်ချိန်တွင် AZD နှင့် Azure CLI တပ်ဆင်မှု စစ်ဆေးသေချာမှု တိုးတက်စေ

---

### [v3.11.0] - 2026-02-05

#### စတင်သူများအတွက် README အပြင်ပြင် စနစ်ပြောင်းလဲမှု
**ဤဗားရှင်းသည် README.md ကို စတင်သူများအတွက် ပိုမို လွယ်ကူသုံးနိုင်စေရန် တိုးတက်ကောင်းမွန်စေပြီး AI ဖွံ့ဖြိုးသူများအတွက် လိုအပ်သော အရင်းအမြစ်များ ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းပြီး
- **🆚 Azure CLI နှင့် AZD နှိုင်းယှဉ်ခြင်း**: သုံးစွဲမှုအခြေအနေ အပြန်အလှန် နားလည်ရန် နမူနာများဖြင့် ရှင်းလင်းပြသ
- **🌟 Awesome AZD Links**: အသိုင်းအဝိုင်း template gallery နှင့် အဖွဲ့အစည်း လင်းပြိုင်မှု အရင်းအမြစ်များသိုက်သွားမှတ်ချက်များ:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ နမူနာ template များ
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - အသိုင်းအဝိုင်း ထောက်ပံ့မှု
- **🎯 လျင်မြန်စတင်လမ်းညွှန်**: 3 အဆင့် အသုံးပြုခြင်းကို ပိုမို လွယ်ကူစေသည် (ထည့်သွင်း → လော့ဂ်အင် → 배포)
- **📊 အတွေ့အကြုံအပေါ် မူတည်၍ လမ်းညွှန်ဇယား**: ဖွံ့ဖြိုးသူအတွေ့အကြုံအရ စတင်ရန် နေရာတိတိကို ရှင်းလင်းပေးသည်

#### ပြောင်းလဲမှုများ
- **README ဖွဲ့စည်းမှု**: အချက်အလက်များ နောက်တူနောက် သက်သာစေသည်ကားစနစ်ဖြင့် ပြန်လည် စီစဉ်ပေး
- **နိဒါန်းအပိုင်း**: “`azd up` ၏ မာယာ” ကို စတင်သူများအတွက် ရိုးရှင်းပြောကြားရေး ပြုလုပ်ခဲ့သည်
- **မတူညီသော အကြောင်းအရာ ဖယ်ရှားသိမ်းဆည်းခြင်း**: ပြဿနာဖြေရှင်း အပိုင်း ထပ်ခါထပ်ခါတည်းကူး များ ဖယ်ရှားခဲ့သည်
- **ပြဿနာဖြေရှင်းခြင်း Command များ**: `azd logs` ကိုသုံး၍ မရ၊ အစား `azd monitor --logs` အသုံးပြုရန် ပြင်ဆင်ခဲ့သည်

#### ပြုပြင်ချက်များ

- **🔐 အထောက်အထား ရရှိခြင်း အမိန့်များ**: `azd auth login` နှင့် `azd auth logout` ကို cheat-sheet.md တွင် ထပ်ဖြည့်သွင်းခဲ့သည်။
- **မှားသော အမိန့် တွဲဆိုင်မှုများ**: README troubleshooting အပိုင်းမှ ကွာရှင်းခဲ့သော `azd logs` ကို ဖယ်ရှားခဲ့သည်။

#### မှတ်ချက်များ
- **အကျယ်အ၀န်း**: မူလ README.md နှင့် resources/cheat-sheet.md တို့တွင် ပြင်ဆင်မှုများ ပြုလုပ်ခဲ့သည်။
- **ရည်ညွှန်းထားသည့် ပရိသတ်**: AZD အသစ်လေ့လာသူများအတွက် အထူးပြုဖြေရှင်းချက်များဖြစ်သည်။

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI အမိန့် သေချာမှု သင်တန်းအပ်ဒိတ်
**ဤဗားရှင်းတွင် တစ်ခုတည်းမှ မရှိသည့် AZD အမိန့်များအား ရှာဖွေမှ စိစစ်၍ ပြင်ဆင်ထားပြီး၊ ကိုးဒ်နမူနာများအားလုံးကို မှန်ကန်သော Azure Developer CLI စနစ်ဖြင့် အသုံးပြုထားသည်။**

#### ပြင်ဆင်ပြီး
- **🔧 မရှိသော AZD အမိန့်များ ဖယ်ရှားမှု**: မမှန်ကန်သော အမိန့်များအတွက် တိကျစွာစစ်ဆေးခြင်းနှင့် တည်းဖြတ်ခြင်း:
  - `azd logs` (မရှိပါ) → `azd monitor --logs` သို့မဟုတ် Azure CLI အခြားနည်းလမ်းများဖြင့် အစားထိုးသည်
  - `azd service` subcommands (မရှိပါ) → `azd show` နှင့် Azure CLI အသုံးပြုမှုဖြင့်အစားထိုးသည်
  - `azd infra import/export/validate` (မရှိပါ) → ဖယ်ရှားသို့မဟုတ် မှန်ကန်သောနည်းလမ်းဖြင့်အစားထိုးသည်
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` အဲတားများ (မရှိပါ) → ဖယ်ရှားထားသည်
  - `azd provision --what-if/--rollback` အဲတားများ (မရှိပါ) → `--preview` အသုံးပြုမှုအဖြစ် ပြောင်းလဲထားသည်
  - `azd config validate` (မရှိပါ) → `azd config list` ဖြင့်အစားထိုးသည်
  - `azd info`, `azd history`, `azd metrics` (မရှိပါ) → ဖယ်ရှားထားသည်

- **📚 အမိန့် ပြင်ဆင်မှုများနှင့် ဖိုင်များ**:
  - `resources/cheat-sheet.md`: အမိန့် ထည့်သွင်းမှု အကြီးစား ပြုပြင်ထားသည်
  - `docs/deployment/deployment-guide.md`: Rollback နှင့် ဝင်ရှိမှု လမ်းညွှန်ချက် ပြုပြင်ထားသည်
  - `docs/troubleshooting/debugging.md`: Log အသေးစိတ်တွဲဖက်စစ်ဆေးမှု ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/common-issues.md`: Troubleshooting အမိန့်များ အထုတ်ပြန်ထားသည်
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD debugging အပိုင်း ပြင်ဆင်ထားသည်
  - `docs/getting-started/azd-basics.md`: မော်နီတာ အမိန့်များ ပြင်ဆင်ထားသည်
  - `docs/getting-started/first-project.md`: မော်နီတာနှင့် debugging ဥပမာများ ပြောင်းလဲထားသည်
  - `docs/getting-started/installation.md`: ကူညီမှု နှင့် ဗားရှင်း ဥပမာများ ပြင်ဆင်ထားသည်
  - `docs/pre-deployment/application-insights.md`: Log ကြည့်ရှုခြင်း အမိန့်များ ပြင်ဆင်ထားသည်
  - `docs/pre-deployment/coordination-patterns.md`: Agent debugging အမိန့်များ ပြင်ဆင်ထားသည်

- **📝 ဗားရှင်း ရည်ညွှန်းချက် ပြုလုပ်ခြင်း**: 
  - `docs/getting-started/installation.md`: အတိအကျသတ်မှတ်ထားသော `1.5.0` ဗားရှင်းမှသာမက `1.x.x` ဗားရှင်းသို့ ပြောင်းလဲပြီး releases များဆီသို့ လင့်ခ် ထည့်သွင်းထားသည်။

#### ပြောင်းလဲခြင်းများ
- **Rollback မဟာဗျူဟာများ**: AZD native rollback မရှိသောကြောင့် Git-based rollback အသုံးပြုမှုအဖြစ် ပြောင်းလဲထားသည်။
- **Log ကြည့်ရှုခြင်း**: `azd logs` ကို `azd monitor --logs`, `azd monitor --live` သို့မဟုတ် Azure CLI အမိန့်များနှင့် အစားထိုးထားသည်။
- **စွမ်းဆောင်ရည် အပိုင်း**: မရှိသော parallel/incremental deployment အဲတားများကို ဖယ်ရှားပြီး မှန်ကန်သောနည်းလမ်းများ ထည့်သွင်းထားသည်။

#### နည်းပညာအသေးစိတ်
- **မှန်ကန်သော AZD အမိန့်များ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **မှန်ကန်သော azd monitor အဲတားများ**: `--live`, `--logs`, `--overview`
- **ဖယ်ရှားသည့် လုပ်ဆောင်ချက်များ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### မှတ်ချက်များ
- **အတည်ပြုချက်**: အမိန့်များအား Azure Developer CLI v1.23.x ဖြင့် စိစစ်ထားသည်။

---

### [v3.9.0] - 2026-02-05

#### အလုပ်ရုံသင်တန်း ပြီးဆုံးခြင်းနှင့် စာတမ်း အရည်အသွေး မြှင့်တင်ခြင်း
**ဤဗားရှင်းတွင် အလုပ်ရုံသင်တန်း မော်ဂျူးများ ပြီးစီးအောင်မြင်ပြီး၊ ဖျက်ဆီးထားသော စာတမ်းလင့်ခ်များအားလုံး ပြင်ဆင်ပြီး Microsoft AZD ကို အသုံးပြုသော AI ဖန်တီးသူများအတွက် အကြောင်းအရာ အရည်အသွေး တိုးတက်စေသည်။**

#### ထပ်ဖြည့်စွက်ချက်များ
- **📝 CONTRIBUTING.md**: အသစ် ပြုလုပ်ထားသော ဝင်ရောက်ဆောင်ရွက်ခြင်း လမ်းညွှန်စာတမ်းတွင်:
  - ပြဿနာများ အစီရင်ခံခြင်းနှင့် ပြောင်းလဲတင်သွင်းမှုပုံစံ ပြပေးခြင်း
  - အသစ်ထည့်သွင်းသော အကြောင်းအရာများ အတွက် စာတမ်းစံများ
  - ကိုးဒ်နမူနာနှင့် commit message များအတွက် လမ်းညွှန်ချက်များ
  - အသိုင်းအဝိုင်း ပါဝင်မှုအချက်အလက်များ

#### ပြီးစီးခဲ့သည်
- **🎯 အလုပ်ရုံသင်တန်း မော်ဂျူး 7 (ပြီးစီးခြင်း)**: အောက်ပါအရာများနှင့်အတူ ပြီးစီးအောင်လုပ်ဆောင်ပြီးသည်။
  - အလုပ်ရုံသင်တန်း အောင်မြင်မှုများ အကျဉ်းချုပ်တင်ပြချက်
  - AZD, template များနှင့် Microsoft Foundry အကြောင်းထားပြီး သင်ယူထားသော အဓိက အယူအဆများ
  - သင်ယူမှု ခရီးစဉ် ဆက်လက်အကြံပြုချက်များ
  - အခက်အခဲ အဆင့်များအလိုက် ရှေ့ဆောင်အသုံးပြုကိန်းနှင့် အလုပ်ရုံတန်း စိန်ခေါ်လေ့ကျင့်ခန်းများ
  - အသိုင်းအဝိုင်း ပြန်လည်တုံ့ပြန်မှုနှင့် အထောက်အပံ့လင့်ခ်များ

- **📚 အလုပ်ရုံသင်တန်း မော်ဂျူး 3 (ခွဲခြမ်းစိတ်ဖြာခြင်း)**: သင်ယူရေးရည်မှတ်များ ပြုပြင်ထားပြီး:
  - GitHub Copilot နှင့် MCP servers ဖွင့်တက်ရေး လမ်းညွှန်ချက်
  - AZD template ဖိုလ်ဒါ ဖွဲ့စည်းပုံ အသိအမှတ်ပြုခြင်း
  - Infrastructure-as-code (Bicep) စီမံခန့်ခွဲမှု မော်ဒယ်များ
  - လက်တွေ့ လေ့ကျင့်ခန်းများ အတွက် လမ်းညွှန်ချက်

- **🔧 အလုပ်ရုံသင်တန်း မော်ဂျူး 6 (ဖျက်စီးခြင်း)**: အောက်ပါအချက်များ ဖြင့် ပြီးစီးခဲ့သည်။
  - 리소스 정리 및 비용 관리 ရည်မှတ်များ
  - 안정적인 인프라 해체를 위한 `azd down` 사용법
  - Soft-deleted cognitive services 복구 안내
  - GitHub Copilot 및 Azure Portal 탐색을 위한 추가 안내

#### ပြင်ဆင်ပြီး
- **🔗 ချိုးကျသွားသော လင့်ခ် ပြုပြင်မှု**: အတွင်းရေး စာတမ်းလင့်ခ် 15+ ခု ပြင်ဆင်ပြီး
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md သို့ လမ်းကြောင်းပြင်ဆင်ထားသည်။
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md နှင့် production-ai-practices.md လမ်းကြောင်းများ ပြင်ဆင်ထားသည်။
  - `docs/getting-started/first-project.md`: မရှိသော cicd-integration.md ကို deployment-guide.md ဖြင့် အစားထိုးထားသည်။
  - `examples/retail-scenario.md`: FAQ နှင့် troubleshooting လမ်းညွှန်များ လမ်းကြောင်းပြင်ဆင်ထားသည်။
  - `examples/container-app/microservices/README.md`: သင်တန်း အိမ်နှင့် deployment guide လမ်းကြောင်း ပြင်ဆင်ထားသည်။
  - `resources/faq.md` နှင့် `resources/glossary.md`: AI အခန်းခွဲများ ပြန်လည်သုံးသပ်ထားသည်။
  - `course-outline.md`: သင်ကြားမှုလမ်းညွှန်နှင့် AI သင်တန်းရုံလေ့ကျင့်ခန်း ရည်ညွှန်းချက် ပြင်ဆင်ထားသည်။

- **📅 အလုပ်ရုံသင်တန်း အခြေအနေ အမှတ်တံဆိပ်**: "Under Construction" မှ ပြောင်းလဲ၍ 2026 ဖေဖော်ဝါရီ ရက်စွဲဖြင့် လုပ်ငန်းအခြေအနေ ဖော်ပြထားသည်။

- **🔗 အလုပ်ရုံသင်တန်း လမ်းညွှန်**: README.md တွင် မရှိသေးသည့် lab-1-azd-basics ဖိုလ်ဒါကို ရည်ညွှန်းနေသော ချိုးကျသွားသော လမ်းကြောင်း အတည်ပြုပြင်ဆင်သည်။

#### ပြောင်းလဲမှုများ
- **အလုပ်ရုံသင်တန်း တင်ပြမှု**: "under construction" သတိပေးချက် ဖယ်ရှားပြီး အလုပ်ရုံသင်တန်း ပြီးမြောက်ပြီး အသုံးပြုရန် အသင့်ရှိပါပြီ။
- **လမ်းညွှန် စနစ်တကျ ဖော်ဆောင်မှု**: အလုပ်ရုံသင်တန်း မော်ဂျူးအားလုံးအတွက် module-အလိုက် လမ်းညွှန်မှု မပြတ်လပ်စေရန် ပြုလုပ်ထားသည်။
- **သင်ယူမှုပုံစံ ရည်ညွှန်းမှုများ**: microsoft-foundry လမ်းကြောင်းများကို မှန်ကန်စွာ ပြင်ဆင်ထားသည်။

#### အတည်ပြုချက်
- ✅ အင်္ဂလိပ်ဘာသာ Markdown ဖိုင်အားလုံးတွင် အတွင်းရေး လင့်ခ်များ မှန်ကန်ပါသည်။
- ✅ အလုပ်ရုံသင်တန်း မော်ဂျူး 0-7 ပြီးစီးပြီး သင်ယူရည်မှတ်များပါဝင်သည်။
- ✅ အခန်းများနှင့် မော်ဂျူးများ အကြား လမ်းညွှန်မှု မှန်ကန်စွာ လည်ပတ်ပါသည်။
- ✅ Microsoft AZD အသုံးပြုသော AI ဖန်တီးသူများအတွက် အကြောင်းအရာ သင့်တော်သည်။
- ✅ စတင်လေ့လာသူများအတွက် ဘာသာစကားနှင့် ဖွဲ့စည်းပုံ သက်သာမှု စောင့်ရှောက်ထားသည်။
- ✅ CONTRIBUTING.md တွင် အသိုင်းအဝိုင်း ပံ့ပိုးသူများအတွက် လမ်းညွှန်ချက် ထည့်သွင်းထားသည်။

#### နည်းပညာ အကောင်အထည်ဖော်ခြင်း
- **လင့်ခ် အတည်ပြုခြင်း**: PowerShell script ဖြင့် .md အတွင်းရေး လင့်ခ်အားလုံး စစ်ဆေးပြီး
- **အကြောင်းအရာ စစ်ဆေးခြင်း**: အလုပ်ရုံသင်တန်း ပြည့်စုံမှုနှင့် စတင်လေ့လာသူ သင့်တော်မှုကို လက်ဖြင့် စစ်ဆေးသည်။
- **လမ်းညွှန် စနစ်**: အခန်းနှင့် မော်ဂျူး များအကြား တည်ငြိမ်သော လမ်းညွှန် စနစ် အသုံးပြုထားသည်။

#### မှတ်ချက်များ
- **အကျယ်အ၀န်း**: အင်္ဂလိပ် စာတမ်းများတွင်သာ ပြင်ဆင်မှုများ ပြုလုပ်ထားသည်။
- **ဘာသာပြန်ခြင်းများ**: ဤဗားရှင်းတွင် ဘာသာပြန် ဖိုလ်ဒါ မပြောင်းလဲထား (အလိုအလျောက်ဘာသာပြန်မှု နောက်ပိုင်းတွင် đồng bộ လုပ်မည်)။
- **အလုပ်ရုံသင်တန်း ကြာချိန်**: လက်တွေ့ လေ့လာမှု ၃-၄ နာရီ အထိ ပံ့ပိုးပေးနေပါသည်။

---

### [v3.8.0] - 2025-11-19

#### တိုးတက်သော စာတမ်းများ: မော်နီတာ၊ လုံခြုံရေးနှင့် agent စနစ်များ
**ဤဗားရှင်းတွင် Application Insights ပေါင်းစပ်ခြင်း၊ အထောက်အထား စနစ်များနှင့် multi-agent စနစ်များအတွက် ဘာသာရပ်အဆင့်မြင့် သင်ခန်းစာများ ထည့်သွင်းထားသည်။**

#### ထပ်ဖြည့်စွက်ချက်များ
- **📊 Application Insights ပေါင်းစပ်ခြင်း သင်ခန်းစာ**: `docs/pre-deployment/application-insights.md` တွင်:
  - AZD အထူးပြု လက်မောင်းပြင်ဆင်မှု
  - Application Insights + Log Analytics အတွက် Bicep templates ပြည့်စုံ
  - Telemetry ကိုယ်တိုင် ကူးမှိန်းထားသည့် Python ဆော့ဖ်ဝဲ လုပ်ဆောင်ချက်များ (1,200+ လိုင်း)
  - AI/LLM မော်နီတာ စနစ်များ (Microsoft Foundry Models token/cost ချုပ်ကိုင်ခြင်း)
  - 6 ခုအထိ Mermaid diagram များ (ဖွဲ့စည်းမှု၊ သယံဇာတ ချောချာမှု၊ telemetry လုပ်ငန်းစဉ်)
  - 3 လက်တွေ့လေ့ကျင့်ခန်းများ (အချက်ပေးမှုများ၊ dashboard များ၊ AI မော်နီတာ)
  - Kusto စကားများနှင့် ကုန်ကျစရိတ် ထိန်းချုပ်မှု မဟာဗျူဟာများ
  - စွမ်းဆောင်ရည် တိုးတက်မှု ပြသမှု နှင့် အချိန်နှင့်တစ်ပြေးညီ debugging
  - 40-50 မိနစ် သင်ယူမှုပြီးမြောက်ရန် အချိန်တိကျသည်

- **🔐 Authentication & Security Patterns သင်ခန်းစာ**: `docs/getting-started/authsecurity.md` တွင်:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - လုံခြုံစိတ်ချရသော deployment များအတွက် Bicep ပုံစံများ ပြည့်စုံ
  - Node.js application code နှင့် Azure SDK ပေါင်းစပ်မှု
  - 3 လက်တွေ့ အပစ်အခ၊ managed identity အတွက် လုပ်ဆောင်ချက်များ
  - လုံခြုံရေးအကောင်းဆုံး အလေ့အထများနှင့် RBAC စနစ်များ
  - ပြဿနာဖြေရှင်း နည်းလမ်းများနှင့် ကုန်ကျစရိတ် စိစစ်ခြင်း
  - ပေါင်းတယ် passwordless authentication မော်ဒယ်များ

- **🤖 Multi-Agent Coordination Patterns သင်ခန်းစာ**: `docs/pre-deployment/coordination-patterns.md` တွင်:
  - 5 coordination patterns (စဉ်ဆက်, 병렬, 계층적, အခန်းက႑စနစ်, သဘောတူညီချက်)
  - orchestrator service တည်ဆောက်မှု (Python/Flask, 1,500+ လိုင်း)
  - အထူးပြု agent များ (သုတေသန, စာရေးသူ, ပြုပြင်သူ)
  - Service Bus ပေါင်းစည်းခြင်း message queuing အတွက်
  - Cosmos DB state management ဖြင့် distributed systems အသုံးပြုမှု
  - 6 Mermaid diagrams ပြသ agent အပြန်အလှန် ဆက်သွယ်မှု
  - 3 အဆင့်မြင့် လက်တွေ့လေ့ကျင့်ခန်း (timeout handling, retry logic, circuit breaker)
  - ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာမှု ($240-565/လ) နှင့် optimization မဟာဗျူဟာများ
  - Application Insights ပေါင်းစပ်မှုဖြင့် မော်နီတာလုပ်ဆောင်မှု

#### မြှင့်တင်ထားသည်
- **Pre-deployment အခန်း**: မော်နီတာ နှင့် စနစ် ပေါင်းစပ်မှု ကို စာတမ်းပြုစုမှု ထည့်သွင်းပြီး
- **Getting Started အခန်း**: လုပ်ငန်းအတွေ့အကြုံများအတွက် ဖြည့်စွက်ထားသော authentication patterns
- **Production အဆင်သင့်မှု**: လုံခြုံရေးမှ စောင့်ကြည့်မှု အထိ အစုံအလင် ညွှန်ပြချက်ပါဝင်သည်။
- **သင်တန်း ရည်ညွှန်းစာ**: အခန်း ၃ နှင့် ၆ တွင် အသစ်ထည့်သွင်းသည့် သင်ခန်းစာများအတွက် ပြင်ဆင်ထားသည်။

#### ပြောင်းလဲမှုများ
- **သင်ယူရေးပြီးမြောက်မှု**: လုံခြုံရေးနှင့် မော်နီတာလုပ်ငန်းများအား ပိုမိုမြှင့်တင်ပေါင်းစည်းမှု
- **စာတမ်း အရည်အသွေး**: နောက်ထပ် သင်ခန်းစာများတွင် တည်ငြိမ်သော A-grade စံနစ် (95-97%) ထိန်းသိမ်းထားခြင်း။
- **Production မော်ဒယ်များ**: ဖျော်ဖြေပေးမှု ရည်ရွယ်ချက်အတွက် အစုံအလင် မချန်တုန်းသော ဆောင်ရွက်ချက်များ

#### တိုးတက်မှုများ
- **ဖန်တီးသူ အတွေ့အကြုံ**: ဖန်တီးမှ ညှိနှိုင်းမှုနှင့် မော်နီတာခြင်းအထိ ဖောက်သည့်လမ်းကြောင်း ပြင်ဆင်မှု
- **လုံခြုံရေး စံနှုန်း**: authentication နှင့် secrets management အတွက် စက်မှုလုပ်ငန်းစံချိန်များ
- **ကြည့်ရှုနိုင်မှု**: AZD ဖြင့် Application Insights ပေါင်းစပ်မှု ပြည့်စုံ
- **AI အလုပ်ချိန်များ**: Microsoft Foundry Models နှင့် multi-agent စနစ်များအတွက် အထူးပြု မော်နီတာမှု

#### အတည်ပြုချက်
- ✅ သင်ခန်းစာ အားလုံးတွင် ဖော်ပြချက်မဖြစ်သော၊ လုပ်ဆောင်နိုင်သော ကိုးဒ်များ ပါဝင်ပြီး
- ✅ သင်ခန်းစာ ၃ ခုလုံးတွင် မြင်သာရေးအတွက် Mermaid diagram 19 ခုပေါင်း
- ✅ လက်တွေ့ လေ့ကျင့်ခန်းများ ၉ ခု မှတ်ပုံတင်ပေးမှုနှင့်အတူ ပြုလုပ်ထားသည်
- ✅ `azd up` ကနေ ဖြန့်ဝေနိုင်သော production-ready Bicep templates များပါဝင်သည်
- ✅ ကုန်ကျစရိတ် စိစစ်ခြင်းနှင့် optimization မဟာဗျူဟာများပါဝင်သည်
- ✅ ပြဿနာဖြေရှင်းခြင်း လမ်းညွှန်များနှင့် အကောင်းဆုံးအလေ့အထများပါဝင်သည်
- ✅ အသိပညာ စစ်ဆေးမှုများ အတည်ပြုချက် အမိန့်များနှင့်အတူ

#### စာတမ်း အဆင့်သတ်မှတ်ခြင်း ရလဒ်များ
- **docs/pre-deployment/application-insights.md**: - အကျယ်ပြန့်သော မော်နီတာ လမ်းညွှန်ချက်
- **docs/getting-started/authsecurity.md**: - ပရော်ဖက်ရှင်နယ် လုံခြုံရေး စနစ်များ
- **docs/pre-deployment/coordination-patterns.md**: - အဆင့်မြင့် multi-agent အခြေခံဖွဲ့စည်းမှုများ
- **စုစုပေါင်း အသစ် အကြောင်းအရာ**: - တည်ငြိမ်သော အရည်အသွေးမြင့် စံနှုန်းများ

#### နည်းပညာ အကောင်အထည်ဖော်ခြင်း
- **Application Insights**: Log Analytics + ကိုယ်ပိုင် telemetry + ကူးသန်းမှု စနစ်များ
- **Authentication**: Managed Identity + Key Vault + RBAC စနစ်များ
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **မော်နီတာခြင်း**: real-time metrics + Kusto စကားများ + အချက်ပေးမှုများ + dashboard များ
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: စမ်းသပ်နည်းများ၊ သိုလှောင်မှု မူဝါဒများ၊ ဘတ်ဂျက် ထိန်းချုပ်မှု

### [v3.7.0] - 2025-11-19

#### စာတမ်းအရည်အသွေး မျှတပြောင်းလဲမှုများနှင့် Microsoft Foundry Models ဥပမာအသစ်
**ဤဗားရှင်းတွင် များပြားစွာသော စာတမ်းအရည်အသွေး တိုးတက်မှုများ ဆောင်ရွက်ပြီး၊ GPT-4.1 chat interface ဖြင့် မြောက်မြားသော Microsoft Foundry Models deployment ဥပမာကို ထည့်သွင်းထားသည်။**

#### ထပ်ဖြည့်စွက်ချက်များ
- **🤖 Microsoft Foundry Models Chat ဥပမာ**: `examples/azure-openai-chat/` တွင် GPT-4.1 မော်ဒယ်နှင့် စုံလင်သော deployment:
  - Microsoft Foundry Models အားလုံးတည်ဆောက်မှု (gpt-4.1 model deployment)
  - Python command-line chat interface နှင့် စကားပြောသမိုင်း
  - သေချာသော API key သိမ်းဆည်းမှုအတွက် Key Vault ပေါင်းစည်းခြင်း
  - Token အသုံးပြုမှု ချုပ်ကိုင်ခြင်းနှင့် ကုန်ကျစရိတ် ခန့်မှန်းခြေ
  - အနှောင့်အဖြား နှိမ့်ချခြင်းနှင့် error စီမံခန့်ခွဲမှု
  - ၃၅-၄၅ မိနစ် deployment လမ်းညွှန် စာမျက်နှာလုံးကြီးပါဝင်သည်
  - ထုတ်လုပ်ရန် ဖြန့်ချိနိုင်သည့် ဖိုင် ၁၁ ခု (Bicep templates, Python app, အပြင်အဆင်)
- **📚 စာတမ်း လေ့ကျင့်ခန်းများ**: configuration လမ်းညွှန်တွင် လက်တွဲလေ့ကျင့်ခန်းများထည့်သွင်း:
  - လေ့ကျင့်ခန်း ၁: ပတ်ဝန်းကျင် ပွင့်လင်းမှု စီမံခန့်ခွဲမှု (15 မိနစ်)
  - လေ့ကျင့်ခန်း ၂: လျှိုဝှက်စီမံခန့်ခွဲမှု လေ့ကျင့်ခန်း (10 မိနစ်)
  - အောင်မြင်မှု အချက်အလက်များနှင့် အတည်ပြုချက် အဆင့်များ
- **✅ Deployment အတည်ပြုခြင်း**: deployment လမ်းညွှန်တွင် အတည်ပြုခြင်း အပိုင်းထည့်သွင်း:
  - ကျန်းမာရေး စစ်ဆေး ပုံစံ
  - အောင်မြင်မှု စစ်ဆေးရမည့် စစ်တမ်း
  - deployment အမိန့်တိုင်းအတွက် မျှော်လင့်ရရှိနိုင် စပါယ်များ
  - ပြဿနာဖြေရှင်း ချက်ချင်း ရှာဖွေမှု လမ်းညွှန်

#### မြှင့်တင်မှုများ
- **examples/README.md**: A-grade အရည်အသွေး (93%) သို့ ပြင်ဆင်:
  - azure-openai-chat ကို များစွာသော အပိုင်းများတွင် ထပ်ဖြည့်ထားသည်။
  - ပြည်တွင်း ဥပမာ အရေအတွက် ၃ မှ ၄ သို့ တိုးမြှင့်ထားသည်။
  - AI လျှင်မြန်သုံးနေမှု အတွက် ဥပမာဇယားတွင် ထည့်သွင်းထားသည်။
  - အလယ်အလတ် အသုံးပြုသူများအတွက် Quick Start ထဲသို့ ပေါင်းစည်းထားသည့်အတိုင်း
  - Microsoft Foundry Templates အပိုင်းထဲ ပေါင်းထည့်ထားသည့်အတိုင်း
  - နှိုင်းယှဉ်ဇယား နှင့် နည်းပညာ ရှာဖွေရေးအပိုင်းများ ပြင်ဆင်ထားသည်။
- **စာတမ်း အရည်အသွေး**: docs ဖိုလ်ဒါတွင် B+ (87%) → A- (92%) သို့ မြှင့်တင်ထားသည်။

  - အရေးကြီးသော command ဥပမာများတွင် မျှော်မှန်းထားသော output များ ထည့်သွင်းပြီးဖြည့်စွက်ခဲ့သည်
  - configuration ပြောင်းလဲမှုများအတွက် စစ်ဆေးရန်အဆင့်များ ထည့်သွင်းခဲ့သည်
  - လက်တွေ့ အလုပ်လုပ်သင်ကြားမှုများဖြင့် လက်တွေ့ကျဆုံးသင်ကြားမှု တိုးတက်စေခဲ့သည်

#### ပြောင်းလဲခဲ့သည်
- **သင်ယူမှု တိုးတက်မှု**: အလယ်အလတ် သင်ယူသူများအတွက် AI ဥပမာများ ပိုမိုပေါင်းစည်းထည့်သွင်းထားသည်
- **စာတမ်းဖွဲ့စည်းမှု**: ရှင်းလင်းကျယ်ပြန့်သောရလဒ်များနှင့် လုပ်ဆောင်နိုင်သော လေ့ကျင့်ခန်းများ ပိုမိုထည့်သွင်းထားသည်
- **စစ်ဆေးမှု လုပ်ငန်းစဉ်**: အရေးကြီးသော workflow များတွင် အောင်မြင်မှုစံသတ်မှတ်ချက်များ ထည့်သွင်းထားသည်

#### တိုးတက်လာသည်
- **Developer အတွေ့အကြုံ**: Microsoft Foundry Models deploy လုပ်ခြင်းတွင် အချိန် ၃၅-၄၅ မိနစ်သာ (ခက်ခဲသော လမ်းညွှန်တူညီမှု ၆၀-၉၀ မိနစ်ထက်)
- **ကုန်ကျစရိတ် ထင်ရှားမှု**: Microsoft Foundry Models ဥပမာများအတွက် ပြတ်သားသော ကုန်ကျစရိတ် ခန့်မှန်းချက်များ ($50-200/လ)
- **သင်ယူမှုလမ်းစဉ်**: AI developer များအတွက် azure-openai-chat ဖြင့် ပြတ်သားသော ဝင်ရောက်မှု နယ်နိမိတ်ရရှိ
- **စာတမ်းစံနှုန်းများ**: မျှော်မှန်းထားသော output နှင့် စစ်ဆေးရေး အဆင့်များကို ချိန်ညှိထားပြီး တူညီမှုရှိ

#### အတည်ပြုခဲ့သည်
- ✅ Microsoft Foundry Models ဥပမာကို `azd up` ဖြင့် ပြည့်စုံစွာ လုပ်ဆောင်နိုင်သည်
- ✅ အကောင်အထည်ဖော်မှု ဖိုင် ၁၁ ဖိုင်လုံး စနစ်တကျ မှန်ကန်သည်
- ✅ README လမ်းညွှန်ချက်များသည် အကျိုးသက်ရောက်မှုရှိသော deployment အတွေ့အကြုံနှင့် ကိုက်ညီသည်
- ✅ စာတမ်းတွင် လင့်များအားလုံး ၈+ နေရာအတွင်း ပြင်ဆင်ထားသည်
- ✅ ဥပမာများ စာရင်း ၄ ခုသော ဒေသအတိုင်းမှန်ကန်သည်
- ✅ စာရင်းများတွင် အပြန်အလှန် လင့်များ မရှိပါ
- ✅ သွားလာမှု ရည်ညွှန်းချက်အားလုံး မှန်ကန်သည်

#### နည်းပညာ အကောင်အထည်ဖော်မှု
- **Microsoft Foundry Models သြဇာတိုက်ပုံစံ**: gpt-4.1 + Key Vault + Container Apps နမူနာမျိုးစုံ
- **လုံခြုံရေး**: Managed Identity အသင့်ပြင်, Key Vault တွင် လျှော်ကောက်ထားသည်
- **စောင့်ကြည့်မှု**: Application Insights ပေါင်းစပ်ထားသည်
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: Token လိုက်လံခြင်းနှင့် အသုံးပြုမှု အာရုံစူးစိုက်မှု
- **တပ်ဆင်ခြင်း**: ပြည့်စုံသော setup အတွက် တစ်ခုတည်းသော `azd up` ကုဒ်ကို ခေါ်ယူမှု

### [v3.6.0] - 2025-11-19

#### အဓိက အပ်ဒိတ်: Container App Deployment ဥပမာများ
**ဤဗားရှင်းသည် Azure Developer CLI (AZD) ကို အသုံးပြု၍ တည်ဆောက်ထားသော အပြည့်အဝ ထုတ်လုပ်ရန်သင့် app container application deployment ဥပမာများကို ပူးပေါင်းပြီး၊ လေ့လာမှု လမ်းကြောင်းတွင် ပေါင်းစည်းထားသော လက်တွေ့စာရွက်များနှင့်အတူပါဝင်သည်။**

#### ထည့်သွင်းခဲ့သည်
- **🚀 Container App ဥပမာများ**: `examples/container-app/` အတွင်း ဥပမာအသစ်များ
  - [Master Guide](examples/container-app/README.md): containerized deployment များ၏ ပြည့်စုံသော အကွာအဝေး, လျင်မြန်စတင်ခြင်း၊ ထုတ်လုပ်မှု နှင့် ကြီးမားသော နမူနာများ
  - [Simple Flask API](../../examples/container-app/simple-flask-api): စတင်သူများအတွက် REST API, scale-to-zero, health probes, စောင့်ကြည့်မှုနှင့် ပြဿနာရှာဖွေမှု
  - [Microservices Architecture](../../examples/container-app/microservices): ထုတ်လုပ်ရန်သင့် multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, ဖြန့်ဖြူးတာခြင်း, blue-green/canary deployment စသောနည်းစနစ်များ
- **အကောင်းဆုံးလေ့လာပုံများ**: containerized ကုန်ဆောင်မှုများအတွက် လုံခြုံရေး၊ စောင့်ကြည့်မှု၊ ကုန်ကျစရိတ် မြှင့်တင်ခြင်းနှင့် CI/CD လမ်းညွှန်မှုများ
- **ကုဒ်နမူနာများ**: ပြည့်စုံသော `azure.yaml`၊ Bicep templates နှင့် ဘာသာစကားစုံဖြင့် ဝန်ဆောင်မှုဆိုင်ရာ အကောင်အထည်ဖော်မှု (Python, Node.js, C#, Go)
- **စမ်းသပ်မှုနှင့် ပြဿနာရှာဖွေမှု**: စပြီးနောက်ဆုံး စမ်းသပ်မှုအခြေအနေများ, စောင့်ကြည့်မှု commands, ပြဿနာရှာဖွေမှု လမ်းညွှန်မှုများ

#### ပြောင်းလဲခဲ့သည်
- **README.md**: အသစ်ထည့်သွင်းသော container app ဥပမာများကို "Local Examples - Container Applications" အတွင်း ဖော်ပြထားပြီး လင့်များ ပြောင်းလဲထားသည်
- **examples/README.md**: container app ဥပမာများကို ထူးဟောင်းဖြင့် ဖော်ပြခြင်း၊ နှိုင်းယှဉ်ဇယား အသစ်ထည့်ခြင်းနှင့် နည်းပညာ/အစီအစဉ် ရည်ညွှန်းချက် အသစ်ထည့်သွင်းခြင်း
- **သင်တန်း အကြောင်းအရာနှင့် လေ့လာမှု လမ်းညွှန်**: သက်ဆိုင်ရာ အခန်းများတွင် အသစ် ထည့်သွင်းသော container app ဥပမာနှင့် deployment နမူနာများ ရည်ညွှန်းမှုများ ပြုလုပ်ခဲ့သည်

#### အတည်ပြုခဲ့သည်
- ✅ အသစ်ထည့်သွင်းထားသော ဥပမာများအားလုံး `azd up` ဖြင့် deploy လုပ်နိုင်ပြီး အကောင်းဆုံးလေ့ကျင့်မှုများကို လိုက်နာသည်
- ✅ စာတမ်းလင့်များနှင့် သွားလာမှု ပြုပြင်ထားပြီး
- ✅ ဥပမာများသည် စတင်သူမှ ကြီးမြတ်သူအဆင့်များအတွင်း ထုတ်လုပ်မှု microservices အပါအဝင် သုံးသပ်ထားသည်

#### မှတ်ချက်များ
- **အကျယ်အဝန်း**: အင်္ဂလိပ်စာတမ်းများ နှင့် ဥပမာများသာရည်ရွယ်
- **နောက်တစ်ဆင့်များ**: အဆင့်မြင့် container pattern များနှင့် CI/CD automation များ တိုးချဲ့မည်

### [v3.5.0] - 2025-11-19

#### ကုန်ပစ္စည်း အမှတ်တံဆိပ် ပြောင်းလဲမှု: Microsoft Foundry
**ဤဗားရှင်းသည် "Microsoft Foundry" ကို လုံးဝကုန်ပစ္စည်းနာမည် အားလုံးတွင် အင်္ဂလိပ်စာတမ်းများအတိုင်း Microsoft ၏ တရားဝင် အမှတ်တံဆိပ် ပြောင်းလဲမှုပေါ် မူတည်၍ အကောင်အထည်ဖော်ထားသည်။**

#### ပြောင်းလဲခဲ့သည်
- **🔄 ကုန်ပစ္စည်းနာမည် ပြောင်းလဲခြင်း**: "Microsoft Foundry" မှ "Microsoft Foundry" သို့ ပြောင်းလဲမှု လုံးဝပြုလုပ်ခဲ့သည်
  - `docs/` ဖိုလ်ဒါအတွင်း အင်္ဂလိပ်စာတမ်းများ အစုလိုက် ပြုပြင်ထားသည်
  - ဖိုလ်ဒါအမည်ပြောင်းခြင်း: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ဖိုင်အမည်ပြောင်းခြင်း: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - စုစုပေါင်း: ၇ စာတမ်းဖိုင်အတွင်း အကြောင်းအရာ ရည်ညွှန်းချက် ၂၃ ခု ပြောင်းလဲ

- **📁 ဖိုလ်ဒါ ဖွဲ့စည်းမှု ပြောင်းလဲခြင်း**:
  - `docs/ai-foundry/` မှ `docs/microsoft-foundry/` သို့ ပြောင်းထားသည်
  - ဖိုလ်ဒါ structure အသစ်ကို အသိအမှတ်ပြုရန် စာတမ်းများ လမ်းညွှန်မှုများ ပြောင်းလဲထားသည်
  - အားလုံးသော စာတမ်းများအတွင်း သွားလာမှု လင့်များစစ်ဆေးပြီး

- **📄 ဖိုင်အမည်ပြောင်းခြင်းများ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - အတွင်းရေးစာတမ်းလင့်များအားလုံးကို အသစ်အမည်ဖြင့် ပြောင်းလဲထားသည်

#### ပြင်ဆင်ထားသောဖိုင်များ
- **အခန်း Documentation** (ဖိုင် ၇ ဖိုင်):
  - `docs/microsoft-foundry/ai-model-deployment.md` - သွားလာမှု လင့် ၃ ခု ပြင်ဆင်သည်
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ကုန်ပစ္စည်းနာမည် ရည်ညွှန်းချက် ၄ ခု ပြင်ဆင်သည်
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Microsoft Foundry အသုံးပြုမှု ရှိပြီး (ယခင်ပြင်ဆင်မှုမှ)
  - `docs/microsoft-foundry/production-ai-practices.md` - ရည်ညွှန်းချက် ၃ ခု ပြင်ဆင် (အကြမ်းဖျင်း, မိတ်ဆက်အသိုင်းအဝိုင်း, စာတမ်း)
  - `docs/getting-started/azd-basics.md` - သွားလာမှု လင့် ၄ ခု ပြင်ဆင်
  - `docs/getting-started/first-project.md` - အခန်း သွားလာမှု လင့် ၂ ခု ပြောင်းလဲ
  - `docs/getting-started/installation.md` - နောက်တစ်ခန်းသို့ လင့် ၂ ခု ပြင်ဆင်
  - `docs/troubleshooting/ai-troubleshooting.md` - ရည်ညွှန်းချက် ၃ ခု လမ်းညွှန်မှုနှင့် Discord အသိုင်းအဝိုင်း အသစ်ပြုလုပ်မှုများ
  - `docs/troubleshooting/common-issues.md` - လမ်းညွှန်မှု လင့် ၁ ခု ပြင်ဆင်
  - `docs/troubleshooting/debugging.md` - လမ်းညွှန်မှု လင့် ၁ ခု ပြင်ဆင်

- **သင်တန်း ဖွဲ့စည်းမှုဖိုင်များ** (ဖိုင် ၂ ဖိုင်):
  - `README.md` - အကြောင်းအရာ ၁၇ ခု ပြောင်းလဲထားသည် (သင်တန်းအကျဥ်း, အခန်းခေါင်းစဉ်များ, template အပိုင်း, အသိုင်းအဝိုင်း အကြံပြုချက်)
  - `course-outline.md` - အကြောင်းအရာ ၁၄ ခု ပြောင်းလဲထားသည် (အကျဥ်းချုပ်, သင်ယူထောက်ခံချက်များ, အခန်း အရင်းအမြစ်များ)

#### အတည်ပြုခဲ့သည်
- ✅ အင်္ဂလိပ်စာတမ်းများတွင် "ai-foundry" folder လမ်းကြောင်း ရှင်းလင်းမှန်ကန်မှူရှိ
- ✅ အင်္ဂလိပ်စာတမ်းများတွင် "Microsoft Foundry" ကုန်ပစ္စည်း နာမည် မမှန်ကန်သော ဟာ မရှိ
- ✅ ဖိုလ်ဒါ structure အသစ်နှင့် သွားလာမှု လင့် များအားလုံး လည်ပတ်မှုရှိ
- ✅ ဖိုင်များနှင့် ဖိုလ်ဒါများ အမည်ပြောင်းမှု အောင်မြင်စွာ ပြီးစီး
- ✅ အခန်းများအကြား လမ်းညွှန်မှုများ အတည်ပြုခြင်း

#### မှတ်ချက်များ
- **အကွာအဝန်း**: `docs/` ဖိုလ်ဒါအတွင်း အင်္ဂလိပ်စာတမ်းများသာပြုလုပ်
- **ဘာသာပြန်ခြင်းများ**: ဤဗားရှင်းတွင် ဘာသာပြန်ဖိုင်များ (`translations/`) မပြင်ဆင်ရသေး
- **နယ်ပယ်ကျောင်း**: နယ်ပယ်ကျောင်း ပစ္စည်းများ (`workshop/`) မပြောင်းလဲရသေး
- **ဥပမာများ**: ဥပမာဖိုင်များတွင် ယခင်နာမည်များကို ရှေးဟောင်းသုံးခြင်းရှိနိုင်ပြီး နောက်ဗားရှင်းတွင်ပြုပြင်မည်
- **ပြင်ပလင့်များ**: ပြင်ပ URL များနှင့် GitHub ရှိ repository ရည်ညွှန်းချက်များမပြောင်းလဲရသေး

#### လွှဲပြောင်းလမ်းညွှန်ချက် များ သုံးစွဲသူများအတွက်
သင်တို့မှာ ဒေသတွင်း branch များ သို့မဟုတ် စာတမ်းများတွင် လိုအပ်သော မူရင်းဖွဲ့စည်းမှု ရှိပါက
1. ဖိုလ်ဒါ ရည်ညွှန်းအား ပြောင်းလဲပါ: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ဖိုင်အမည် ရည်ညွှန်းအား ပြောင်းလဲပါ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ကုန်ပစ္စည်း နာမည် အစားထိုးပါ: "Microsoft Foundry" → "Microsoft Foundry"
4. အတွင်းရေး စာတမ်းလင့်များ အားလုံး လည်ပတ်မှုရှိမရှိ စစ်ဆေးပါ

---

### [v3.4.0] - 2025-10-24

#### အထောက်အထားကြည့်ခြင်း နှင့် အတည်ပြုမှု တိုးတက်မှုများ
**ဤဗားရှင်းသည် Azure Developer CLI preview လုပ်ဆောင်ချက် အသစ်ကို ထည့်သွင်းကာ နယ်ပယ်ကျောင်း အသုံးပြုသူ အတွေ့အကြုံကို တိုးတက်စေသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🧪 azd provision --preview လုပ်ဆောင်ချက် စာရွက်စာတမ်း**: အင်ဖရာစက်မှုပြင်ဆင်မှု preview feature အပြည့်အစုံ ဖော်ပြချက်
  - command အသုံးပြုမှုနှင့် နမူနာများ cheat sheet တွင် တင်ပြသည်
  - provisioning guide တွင် အသုံးပြုမှုကိစ္စများနှင့်အကျိုးကျေးဇူးများ ဖော်ပြချက်နက်ရှိုင်းစွာ
  - ဘေးကင်းရေး စစ်ဆေးမှုမြှင့်တင်မှု မျိုးစုံပါဝင်
  - စတင်လေ့လာမှု လမ်းညွှန်မှုများ နောက်ဆုံး ပြုပြင်ထားသည်
- **🚧 workshop အခြေအနေတန်းပြ**: professional HTML banner ဖြင့် workshop အခြေအနေ အဆင့်ကို ဖော်ပြ
  - အဆောက်အအုံ အညွှန်းများပါ gradient design ဖြင့် အသုံးပြုထားသည်
  - နောက်ဆုံး ပြုပြင်ချိန် ဖော်ပြချက်ပါရှိသည်
  - မိုဘိုင်းနှင့် အခြား စက်များအတွက် တုံ့ပြန်မှုရှိမှုဖြင့် တည်ဆောက်ထားသည်

#### တိုးတက်လာသည်
- **အင်ဖရာစက်မှုပြင်ဆင်မှု လုံခြုံရေး**: preview လုပ်ဆောင်ချက်အား deployment စာတမ်းပေါင်းစပ်မှုများတွင် ထည့်သွင်း
- **တပ်ဆင်မတိုင်မီ စစ်ဆေးမှု**: ကြိုတင် စစ်ဆေးမှုအတွက် scripting များ ထည့်သွင်းထားသည်
- **Developer workflow**: preview အသုံးပြုမှု လမ်းစဉ် update ပြုလုပ်ထားသည်
- **Workshop အသုံးပြုသူ အတွေ့အကြုံ**: အကြောင်းအရာ ဖွံ့ဖြိုးတိုးတက်မှု အခြေအနေ ရှင်းလင်းရေး

#### ပြောင်းလဲခဲ့သည်
- **Deployment အကောင်းဆုံး လုပ်နည်း**: preview ပထမဆုံး workflow ကို အကြံပြုလမ်း
- **စာတမ်း စီးဆင်းမှု**: infrastructure အတည်ပြုမှု စစ်ဆေးမှုကို သင်ယူမှု ဦးတည်ရာတွင်အလျင်အမြန်ထား
- **Workshop မိတ်ဆက်မှု**: professional status communication နှင့် ဖွံ့ဖြိုးတိုးတက်မှု အချိန်ဇယား ပေးထားသည်

#### တိုးတက်လာသည်
- **ဘေးကင်းရေး အလေးထားမှု**: deployment မတိုင်မီ အင်ဖရာစက်မှုပြင်ဆင်မှုကို စစ်ဆေးနိုင်သည်
- **အဖွဲ့ ပူးပေါင်းဆောင်ရွက်မှု**: preview ရလဒ်များကို ပြန်လည်ဆန်းစစ်ခြင်းနှင့် ခွင့်ပြုခြင်းအတွက် မျှဝေလို့ရသည်
- **ကုန်ကျစရိတ် အသိပညာ**: provisioning မတိုင်မီ အရင်းအမြစ်ကုန်ကျစရိတ်ကို ပိုမိုနားလည်မှု ရရှိ
- **အန္တရာယ် လျော့နည်းမှု**: ကြိုတင် စစ်ဆေးမှုဖြင့် deployment မအောင်မြင်မှုလျော့နည်း

#### နည်းပညာ အကောင်အထည်ဖော်မှု
- **စာတမ်း မျိုးစုံ ပေါင်းစပ်မှု**: preview feature ကို ဖော်ပြထားသော ဖိုင် ၄ ဖိုင်တွင် ပါဝင်
- **command နမူနာများ**: စနစ်တကျ syntax နှင့် ဥပမာများအား စာတမ်းတွင် တူညီမှုရှိသည်
- **အကောင်းဆုံး လုပ်နည်း ပေါင်းစပ်မှု**: validation workflow နှင့် scripting များတွင် preview ပါဝင်သည်
- **မြင်သာသော အညွှန်းများ**: feature အသစ်များအတွက် မြင်သာသော NEW အမှတ်အသားများ ထားရှိသည်

#### Workshop အင်ဖရာစက်မှု
- **အခြေအနေ ဆက်သွယ်မှု**: gradient 스타일 HTML banner အသုံးပြုထားသည်
- **အသုံးပြုသူ အတွေ့အကြုံ**: ဖွံ့ဖြိုးမှု အခြေအနေ ပြတ်သားပြီ စိတ်ရှုပ်ထွေးမှုကင်း
- **professional Presentation**: repository ကို ယုံကြည်စိတ်ချစွာ ထိန်းသိမ်းပြီး မျှော်မှန်းချက် ဖြည့်ဆည်းခြင်း
- **အချိန်ဇယား ထင်ရှားမှု**: အောက်တိုဘာ ၂၀၂၅ နောက်ဆုံး ပြင်ဆင်ချိန် ဖော်ပြချက် ဖြည့်သွင်း

### [v3.3.0] - 2025-09-24

#### Workshop ပစ္စည်းများ မြှင့်တင်ခြင်းနှင့် အပြန်အလှန် လေ့လာမှု အတွေ့အကြုံ မြှင့်တင်မှု
**ဤဗားရှင်းတွင် browser-based လေ့လာရေး လမ်းညွှန်ဂိုင်များနှင့် ဖွဲ့စည်းထားသော သင်ယူမှုလမ်းကြောင်းများ ပါဝင်သည်။**

#### ထည့်သွင်းခဲ့သည်
- **🎥 ပြင်ပလုပ်ပေးသော Workshop လမ်းညွှန်ချက်**: MkDocs preview လုပ်ဆောင်ချက်နှင့် browser-based လေ့လာမှု
- **📝 ဖွဲ့စည်းထားသော Workshop လမ်းညွှန်ချက်များ**: ရှာဖွေရေးမှ စိတ်ကြိုက်ပြုလုပ်ခြင်းအထိ ၇ ဆင့်လမ်းကြောင်း
  - 0-မိတ်ဆက်: Workshop အကျဉ်းချုပ် နှင့် တပ်ဆင်ခြင်း
  - 1-AI Template ရွေးချယ်ခြင်း: template ရှာဖွေရေးနှင့် ရွေးချယ်ခြင်း PROCESS
  - 2-AI Template စစ်ဆေးခြင်း: တပ်ဆင်ခြင်းနှင့် validation လုပ်ငန်းစဉ်များ
  - 3-AI Template ဖျော်ဖြေခြင်း: template ၏ ပုံစံနားလည်ခြင်း
  - 4-AI Template ပြင်ဆင်ခြင်း: config ပြင်ဆင်ခြင်းနှင့် အသိအမှတ်ပြုခြင်း
  - 5-AI Template မိတ်ဆက်ရေး: တိုးတက်သောပြင်ဆင်မှုများနှင့် iteration များ
  - 6-အင်ဖရာစက်မှုပြုပြင်ခြင်း: သန့်ရှင်းရေးနှင့် resource စီမံခန့်ခွဲမှု
  - 7-အနားယူခြင်း: အကျဉ်းချုပ်နှင့် နောက်တက်ဆင့်များ
- **🛠️ Workshop ကိရိယာများ**: MkDocs config နှင့် Material theme ဖြင့် သင်ယူမှု အမြင့်ဆုံးအဆင့်
- **🎯 လက်တွေ့သင်ယူမှု လမ်းကြောင်း**: ၃ ဆင့် နည်းလမ်း (ရှာဖွေခြင်း → တပ်ဆင်ခြင်း → စိတ်ကြိုက်ပြင်ဆင်ခြင်း)
- **📱 GitHub Codespaces ပေါင်းစည်းခြင်း**: တစိတ်တပိုင်း ဖွံ့ဖြိုးတိုးတက်စေရေး ပတ်ဝန်းကျင် တပ်ဆင်မှု

#### တိုးတက်လာသည်
- **AI Workshop အလုပ်ခန်း**: ၂နာရီမှ ၃ နာရီအထိ တိကျသော ဖွဲ့စည်းတည်ဆောက်မှုနှင့် ပညာရေးအတွေ့အကြုံ ပိုတိုးလာသည်
- **Workshop Documentation**: professional ပုံစံနဲ့ စာမျက်နှာများ, လမ်းညွှန်မှု ၊ မြင်ကွင်းထောက်ခံချက်များ ပါသော
- **သင်ယူမှု တိုးတက်မှု**: template ရွေးချယ်မှုမှ ထုတ်လုပ်မှု deployment အထိ တိကျသော်လည်း လိုက်နာစေရန် သွားလာနိုင်စေရန် ဦးတည်ချက်များ
- **Developer အတွေ့အကြုံ**: ဖွံ့ဖြိုးရန် workflow များ အသားပေး ကိရိယာများ ပေါင်းစပ်ထားသည်

#### တိုးတက်လာသည်
- **လက်လှမ်းမီမှု**: browser-based အင်တာဖေ့စ်နှင့် ရှာဖွေခြင်း၊ ကူးယူမှု လုပ်ဆောင်မှု၊ theme toggle ပါ
- **ကိုယ်ပိုင် အချိန်နဲ့ သင်ယူမှု**: လွတ်လပ်သော Workshop ဖွဲ့စည်းမှု၊ သင်ယူသူ ရဲ့ အမြန်နှုန်းကို အသင့်နားလည်စေရန်
- **လက်တွေ့အသုံးပြုမှု**: အမှန်တကယ် AI template deployment အခြေအနေများ
- **အသိုင်းအဝိုင်း ပေါင်းစည်းမှု**: Discord ပေါင်းစည်းပြီး Workshop ပံ့ပိုးမှုနှင့် ပူးပေါင်းဆောင်ရွက်မှု

#### Workshop လက္ခဏာများ
- **Search built-in**: မျက်နှာဖုံးတွင် ခလုတ်နှိပ်၍ လျင်မြန်စွာ စကားလုံး/သင်ခန်းစာ ရှာဖွေရန်
- **ကုဒ် နမူနာများ ကူးယူခြင်း**: မျှဝေရာတွင် hover လုပ်ကူးယူဖို့ စွမ်းဆောင်ရည်
- **Theme Toggle**: မီးမှောင်/မီးရှင်း mode ကို စိတ်ကြိုက် ရွေးချယ်အသုံးပြုနိုင်ခြင်း
- **မြင်သာသော ပုံရိပ်များ**: Screenshots နှင့် ပုံစုများဖြင့် နားလည်မှု မြှင့်တင်
- **အကူအညီ ပေါင်းစည်းမှု**: Discord တွင် တိုက်ရိုက် ဝင်ရောက်ဖို့ လမ်းညွှန်ချက်

### [v3.2.0] - 2025-09-17

#### အဓိက သွားလာမှု ပြုပြင်ပြောင်းလဲမှု နှင့် အခန်းအလိုက် သင်ယူမှု စနစ်
**ဤဗားရှင်းသည် စုစည်းမှုလုံးဝသစ် Chapter-Based သင်ယူမှု ဖွဲ့စည်းမှုနှင့် repository တစ်လုံးလုံးတွင် သွားလာမှု တိုးတက်မှု ရှိစေရန် ဖော်ပြသည်။**

#### ထည့်သွင်းခဲ့သည်
- **📚 အခန်းအလိုက် သင်ယူမှု စနစ်**: သင်တန်းကို ဆက်တိုက်တိုးတက်နေသော အခန်း ၈ ခုပြုစုပျိုးထောင်ထားသည်
  - အခန်း ၁: အခြေခံနှင့် လျင်မြန် စတင်ခြင်း (⭐ - ၃၀-၄၅ မိနစ်)
  - အခန်း ၂: AI-ကို ဦးစားပေးဖွံ့ဖြိုးခြင်း (⭐⭐ - ၁-၂ နာရီ)
  - အခန်း ၃: စီမံခန့်ခွဲမှုနှင့် သက်ဆိုင်သော အတည်ပြုခြင်း (⭐⭐ - ၄၅-၆၀ မိနစ်)
  - အခန်း ၄: Infrastructure as Code နှင့် deployment (⭐⭐⭐ - ၁-၁.၅ နာရီ)
  - အခန်း ၅: Multi-Agent AI ဖြေရှင်းချက် (⭐⭐⭐⭐ - ၂-၃ နာရီ)
  - အခန်း ၆: Deployment မတိုင်မီ အတည်ပြုခြင်းနှင့် စီမံကိန်းချခြင်း (⭐⭐ - ၁ နာရီ)
  - အခန်း ၇: ပြဿနာရှာဖွေရေးနှင့် Debugging (⭐⭐ - ၁-၁.၅ နာရီ)
  - အခန်း ၈: ထုတ်လုပ်မှုနှင့် စီးပွားရေးပုံစံများ (⭐⭐⭐⭐ - ၂-၃ နာရီ)
- **📚 ပြည့်စုံသော သွားလာမှုစနစ်**: စာတမ်းအားလုံးတွင် တူညီသည့် navigation header နှင့် footer များ
- **🎯 ဖွံ့ဖြိုးမှု တိုးတက်မှု ထောက်လှမ်းခြင်း**: သင်တန်းပြီးစီးခြင်း စစ်ဆေးရေး နှင့် သင်ယူမှု အတည်ပြုမှု စနစ်
- **🗺️ သင်ယူမှု လမ်းညွှန်မှု**: အတွေ့အကြုံအဆင့်နှင့် ရည်မှန်းချက်အလိုက် ဝင်ရောက်ရန် ဖော်ပြချက်များ
- **🔗 အကြားသွားလာမှု လင့်များ**: ဆက်နွယ်းသောအခန်းများနှင့် ပိုမိုအသိပညာလိုအပ်ချက်များ ရင်းနှီးမှု

#### တိုးတက်လာသည်
- **README ဖွဲ့စည်းမှု**: chapter-based စီစဉ်မှုပုံစံ လေ့လာမှု စနစ်ဖြင့် ပြောင်းလဲထားသည်
- **စာတမ်း သွားလာမှု**: မျက်နှာကျယ်တစ်ခုချင်းစီတွင် အခန်းအတွက် နယ်ပယ်နှင့် တိုးတက်မှု လမ်းညွှန်မှု ပါရှိသည်
- **Template မှတ်တမ်းများ**: ဥပမာများနှင့် template များကို သင်ယူမှု အခန်းများနှင့် တွဲဖက်ညှိထားသည်

- **အရင်းအမြစ် ပေါင်းစည်းခြင်း**: Cheat sheets, FAQs, နှင့် သင်ခန်းစာလောကနဲ့ ဆက်စပ်သည့် စာအုပ်ခန်းများ
- **Workshop ပေါင်းစည်းခြင်း**: လက်တွေ့လုပ်ဆောင်မှု လာဘ်များကို စာအုပ်ခန်းများအလိုက် သင်ယူမှု ရည်မှန်းချက်များနှင့် ဆက်စပ်ခြင်း

#### ပြောင်းလဲမှုများ
- **သင်ယူမှု တိုးတက်မှု**: လိုင်းနာ ဒေါက်ခွံမှ ချိတ်ဆက်ပြီး စာအုပ်ခန်းအခြေပြု သင်ယူမှုပုံစံသို့ ပြောင်းလဲခြင်း
- **တပ်ဆင်မှု နေရာချထားခြင်း**: သင်ယူမှု စီးဆင်းမှုပိုမိုကောင်းမွန်ရေးအတွက် စနစ်တကျ ၃ ခန်းအနေဖြင့် အဆောက်အအုံ လမ်းညွှန်ကို ပြောင်းရွှေ့ခြင်း
- **AI ပါဝင်သော အကြောင်းအရာ ပေါင်းစည်းခြင်း**: သင်ယူမှုခရီး၏ အတွင်း AI နဲ့ သက်ဆိုင်သော အကြောင်းအရာ ပိုမို မြင့်မားကောင်းမွန်စွာ ပေါင်းစည်းခြင်း
- **ထုတ်လုပ်မှု အကြောင်းအရာ**: စီးပွားရေး သင်ယူသူများအတွက် စာအုပ်ခန်း ၈ မှ အဆင့်မြှင့် နမူနာများ တစ်စုချုပ်

#### တိုးတတ်မှုများ
- **အသုံးပြုသူ အတွေ့အကြုံ**: သော့ချက် လမ်းကြောင်း နှင့် စာအုပ်ခန်း တိုးတက်မှု ဖော်ပြချက်များ အသေးစိတ်ရှင်းလင်းမှု
- **လွယ်ကူစွာ ဝင်ရောက်နိုင်မှု**: သင်တန်း လမ်းကြောင်း လွယ်ကူစေရန် ဆက်လက်တည်ငြိမ်သော လမ်းညွှန်ပုံများ
- **ပရော်ဖက်ရှင်နယ် တင်ဆက်မှု**: ဘာသာရပ်နှင့် ကော်ပိုရေးရှင်း လေ့ကျင့်မှုအတွက် တက္ကသိုလ်ပုံစံ သင်တန်းစနစ်
- **သင်ယူမှု ထိရောက်ခြင်း**: စနစ်တကျ စီစဉ်မှုတိုးတက်ကာ သက်ဆိုင်ရာ အကြောင်းအရာ ရှာဖွေရန် အချိန်လျှော့ချခြင်း

#### နည်းပညာ ဆောင်ရွက်ချက်များ
- **ဦးတည် ထုတ်လုပ်ခြင်း ခေါင်းစီး**: ၄၀ ကျော် မွတ်ထားသော စာတမ်း ဖိုင်များအပေါ် စာအုပ်ခန်းလမ်းကြောင်း စံနှုန်းပြုလုပ်ခြင်း
- **အောက်ဆုံးလမ်းညွှန်**: တစ်ဆက်တည်း တိုးတက်မှု လမ်းညွှန်နှင့် စာအုပ်ခန်း ပြီးမြောက်မှု ဖော်ပြချက်များ တည်ငြိမ်စွာ ထားရှိခြင်း
- **စေ့စပ်လင့်ခ်များ**: ဆက်စပ်သော အယူအဆများ အတွင်းပိုင်း ဆက်သွယ်ရေး စနစ် ပြည့်စုံမှု
- **စာအုပ်ခန်း မျက်နှာပြင်**: ပုံစံများနှင့် နမူနာများကို သင်ယူမှု ရည်မှန်းချက်နှင့် ရှင်းလင်းစွာ ဆက်ဆံခြင်း

#### သင်ခန်းစာလမ်းညွှန် တိုးတက်ခြင်း
- **📚 သင်ယူမှု ရည်မှန်းချက်များ ပြည့်စုံမှု**: ၈ စာအုပ်ခန်း စနစ်နှင့် ကိုက်ညီအောင် သင်ခန်းစာလမ်းညွှန် ပြုပြင်ပြောင်းလဲခြင်း
- **🎯 စာအုပ်ခန်းအခြေပြု သုံးသပ်ချက်**: စာအုပ်ခန်း တစ်ခုလျှင် သီးခြား သင်ယူမှု ရည်မှန်းချက်များနှင့် လက်တွေ့ လေ့ကျင့်မှုများ ပါဝင်ခြင်း
- **📋 တိုးတက်မှု ရှာဖွေရေး**: တစ်ပတ်စာ သင်ယူ ရက်စွဲဇယား၊ တိုင်းတာနိုင်သော အကျိုးအမြတ်များနှင့် ပြီးမြောက်မှု စစ်ဆေးစာရင်းများ
- **❓ သုံးသပ်မေးခွန်းများ**: စာအုပ်ခန်းများအလိုက် အသိပညာ စစ်ဆေးမေးခွန်းများ၊ ပရော်ဖက်ရှင်နယ် ပြဿနာဖြေရှင်းမှုများ
- **🛠️ လက်တွေ့ လေ့ကျင့်မှုများ**: လက်တွေ့ လုပ်ငန်းတာဝန်များနှင့် နေရာချထားခြင်း၊ ပြဿနာဖြေရှင်းခြင်း လုပ်ငန်းစဉ်များ
- **📊 ကျွမ်းကျင်မှု တိုးတက်မှု**: အခြေခံအယူအဆများမှ စီးပွားရေး ပုံစံများအထိ တိုးတက်မှု ရှင်းလင်းမှု၊ အလုပ်အကိုင် ဖွံ့ဖြိုးတိုးတက်မှု အာရုံစိုက်မှု
- **🎓 လက်မှတ် စနစ်**: ပရော်ဖက်ရှင်နယ် ဖွံ့ဖြိုးတိုးတက်မှုနှင့် လူမှုအသိုင်းအဝိုင်း အသိအမှတ်ပြုစနစ်
- **⏱️ အချိန်ဇယား စီမံခန့်ခွဲမှု**: အခြေတည်စီးပွားရေး ၁၀ ပတ် သင်ယူမှု မိုက်အ်လ်စိန်း ထောက်ပံ့ခြင်း

### [v3.1.0] - 2025-09-17

#### Multi-Agent AI ဖြေရှင်းချက် ပိုမိုတိုးတက်မှု
**ဒီဗားရှင်းသည် များစွာသော အေးဂျင့်တွေကို အတိအကျ နာမည်ပေးခြင်းနှင့် စာရွက်စာတမ်းကောင်းမှု မြှင့်တင်ကာ Multi-Agent retail ဖြေရှင်းချက် ကိုတိုးတက်စေသည်။**

#### ပြောင်းလဲချက်များ
- **Multi-Agent ဆိုလိုချက်**: retail multi-agent ဖြေရှင်းချက်အတွင်း "Cora agent" ကို "Customer agent" ဖြင့် ပြောင်းလဲထားခြင်း၊ ပိုမိုရှင်းလင်းဖို့
- **Agent တည်ဆောက်ပုံ**: စာရွက်စာတမ်းများပြင်၍ ARM ပုံစံများနှင့် ကုတ် နမူနာများအားလုံးတွင် "Customer agent" နာမည်ကို မျှတစွာ သုံးစွဲမှု
- **တပ်ဆင်မှု နမူနာများ**: အေးဂျင့် တပ်ဆင်မှု ပုံစံများကို နာမည်ပုံစံ အသစ်များဖြင့် အဆင့်မြှင့်ခြင်း
- **စာရွက်စာတမ်း တူညီမှု**: အားလုံးကို ပရော်ဖက်ရှင်နယ်၊ ဖော်ပြချက် ပါသော အေးဂျင့်နာမည်များဖြင့် အသုံးပြုမှုကို သေချာအောင် ပြုလုပ်ခြင်း

#### တိုးတက်ချက်များ
- **ARM ပုံစံ အထုပ်**: retail-multiagent-arm-template ကို Customer agent ကို ရည်ညွှန်းကာ update ပြုလုပ်ခြင်း
- **တည်ဆောက်ပုံ ကိုယ်ပွားပုံ**: Mermaid diagrams များကို Customer agent နာမည်အသစ်ဖြင့် ပြန်လည်သင့်တော်အောင် ပြုပြင်ခြင်း
- **ကုဒ် နမူနာများ**: Python class များနှင့် အကောင်အထည်ဖော် နမူနာများတွင် CustomerAgent နာမည် အသုံးပြုခြင်း
- **ပတ်ဝန်းကျင် အမျိုးအစားများ**: deployment script ทั้งหมดကို CUSTOMER_AGENT_NAME ပုံစံ အသုံးပြုရန် အပ်ဒိတ်လုပ်ထားခြင်း

#### တိုးတက်မှုများ
- **Developer အတွေ့အကြုံ**: စာရွက်စာတမ်းအတွင်း အေးဂျင့် အခန်းကဏ္ဍများ နှင့် တာဝန်များ ပိုမိုရှင်းလင်းပြတ်သားစေရန်
- **ထုတ်လုပ်မှု စမ်းသပ်မှု**: စီးပွားရေး မှတ်သားမှု နာမည်ပုံစံနှင့် ပိုမိုကိုက်ညီစေရန်
- **သင်ခန်းစာအကြောင်းအရာများ**: ပညာပေးအတွက် အေးဂျင့် နာမည် ပိုမို အတွင်းမြင်သာစေရန်
- **ပုံစံ အသုံးပြုနိုင်မှု**: အေးဂျင့် လုပ်ဆောင်ချက်များနှင့် deployment ပုံစံများ ကင်းလွတ်လွယ်ကူစေရန် ပိုမို ရိုးရှင်းစေခြင်း

#### နည်းပညာ အသေးစိတ်
- CustomerAgent ကို ရည်ညွှန်းသော Mermaid architecture diagrams များ အပ်ဒိတ်လုပ်ခြင်း
- Python နမူနာတွင် CoraAgent class နာမည်များကို CustomerAgent အဖြစ် ပြောင်းလဲမှု
- ARM template JSON ဆင့်ဆင့်များတွင် "customer" agent အမျိုးအစား အသုံးပြုရန် ပြောင်းလဲသည်
- 환경 변수များကို CORA_AGENT_* ကနေ CUSTOMER_AGENT_* ပုံစံသို့ ပြောင်းလဲမှု
- deployment အမိန့်များနှင့် container စနစ်များ အားလုံး ပြန်လည်နိမိတ်ခြင်း

### [v3.0.0] - 2025-09-12

#### အဓိက ပြောင်းလဲမှုများ - AI Developer အာရုံစိုက်မှုနှင့် Microsoft Foundry ပေါင်းစည်းမှု
**ဒီဗားရှင်းသည် repository ကို AI အခြေပြု သင်ယူမှု အရင်းအမြစ် ပြည့်စုံမှု Microsoft Foundry ဖြင့် ပေါင်းစည်းထားသော စနစ်အဖြစ် သို့ ပြောင်းလဲထားသည်။**

#### ပေါင်းထည့်ခဲ့သော အချက်များ
- **🤖 AI ပထမဆုံး သင်ယူမှု လမ်းကြောင်း**: AI developer များနှင့် engineer များကို ဦးစားပေး ပြုပြင်တည်ဆောက်မှု
- **Microsoft Foundry ပေါင်းစည်းမှု လမ်းညွှန်**: AZD နှင့် Microsoft Foundry ဝန်ဆောင်မှုများ ချိတ်ဆက်ခြင်းအတွက် စာရွက်စာတမ်း ပြည့်စုံမှု
- **AI မော်ဒယ် တပ်ဆင်မှု ပုံစံများ**: မော်ဒယ် ရွေးချယ်ခြင်း၊ ဆက်တင်၊ ထုတ်လုပ်မှု တပ်ဆင်မှု မဟာဗျူဟာ အကြောင်းအရာများအသေးစိတ်
- **AI Workshop Lab**: AI แอปလီကေးရှင်းများကို AZD deploy ပြုလုပ်နိုင်ရန် လက်တွေ့ လမ်းညွှန်မှု ၂-၃ နာရီ
- **ထုတ်လုပ်မှု AI အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ**: AI အလုပ်စီးရီး စ scalable, monitoring နှင့် security ပြုခြင်း အတွက် စနစ်
- **AI အတွက် ပျက်ကွက်ပြဿနာဖြေရှင်း လမ်းညွှန်**: Microsoft Foundry Models, Cognitive Services နှင့် AI deployment ပြဿနာများကို တင်းကျပ်စွာ ဖြေရှင်းခြင်း
- **AI ဖန်တီးမှုပုံစံ ပေါင်းစည်းမှု**: Microsoft Foundry ပုံစံ စုပေါင်းထားပြီး အခက်အခဲ အဆင့်အတန်းများဖြင့် ဖော်ပြခြင်း
- **Workshop အထောက်အကူပစ္စည်းများ**: လက်တွေ့ လုပ်ငန်းနှင့် ကိုးကားစာရွက်များ ပါဝင်သော လက်တွေ့ လမ်းညွှန်

#### တိုးတက်မှုများ
- **README အဆောက်အအုံ**: AI developer အတွက် အာရုံစိုက်ပြီး Microsoft Foundry Discord မှ ၄၅% လူမှု ပါဝင်မှု သတင်းအချက်အလက်
- **သင်ယူမှု လမ်းကြောင်းများ**: ကျောင်းသားများနှင့် DevOps engineer များအတွက် ရိုးရာ လမ်းကြောင်းအပြင် AI developer လမ်းကြောင်းလည်း ပါဝင်
- **ပုံစံ အကြံပြုချက်များ**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart တို့အား AI ပုံစံ အဖြစ် အထူးပြုရန်
- **လူမှုအသိုင်းအဝိုင်း ပေါင်းစည်းမှု**: AI-specific ချန်နယ်များနဲ့ ဆွေးနွေးမှုများပါဝင်သော Discord လူမှုအသိုင်းအဝိုင်း ထောက်ပံ့မှု တိုးတက်ခြင်း

#### လုံခြုံရေးနှင့် ထုတ်လုပ်မှု အာရုံစိုက်ချက်
- **Managed Identity ပုံစံများ**: AI ဖြစ်စဉ်များအတွက် အထူးလုံခြုံရေးနှင့် အတည်ပြုနည်းများ
- **ကုန်ကျစရိတ် လျှော့ချပေးမှု**: AI အလုပ်စီးရီးအတွက် token အသုံးပြုမှု ထိန်းသိမ်းချက်များ နှင့် သုံးစွဲမှု ကန့်သတ်များ
- **မြေပြင်အရပ်မျိုးစုံ တပ်ဆင်မှု**: ကမ္ဘာလုံးဆိုင်ရာ AI app တပ်ဆင်မှုဆိုင်ရာ မဟာဗျူဟာများ
- **ဆောင်ရွက်မှု ကိုင်တွယ်မှု**: AI-specific သင်္ကေတများနှင့် Application Insights ပေါင်းစည်းမှု

#### စာရွက်စာတမ်းအရည်အသွေး
- **တန်းတူ သင်တန်းစနစ်**: အစမှ အဆင့်မြင့် AI ကို တင်ဆက်ပုံစံ ကျစ်လစ်သော တိုးတက်မှု
- **စာရွက်စာတမ်း URL စစ်ဆေးမှု**: ပြင်ပ repository လင့်ခ်အားလုံး စစ်ဆေးပြီး အသုံးပြုနိုင်မှုရှိစေရန်
- **ပြည့်စုံသော ကိုးကားချက်**: အတွင်းပိုင်း စာရွက်စာတမ်း လင့်ခ်များအားလုံး စစ်ဆေးပြီး အသုံးပြုနိုင်မှု ရှိစေရန်
- **ထုတ်လုပ်မှု သင့်တော်မှု**: စီးပွားရေး application များအတွက် အဆင့်မြင့် deployment pattern နမူနာများ

### [v2.0.0] - 2025-09-09

#### အဓိက ပြောင်းလဲမှုများ - Repository တည်ဆောက်မှု ပြင်ဆင်ခြင်းနှင့် ပရော်ဖက်ရှင်နယ် တိုးတက်မှု
**ဒီဗားရှင်းသည် repository တည်ဆောက်ပုံနှင့် အကြောင်းအရာ တင်ဆက်ပုံ တစ်ခုလုံး ပြောင်းလဲသွားခြင်းကို ကိုယ်စားပြုသည်။**

#### ပေါင်းထည့်ခဲ့သောအချက်များ
- **စနစ်တကျ သင်ယူမှု ဖွဲ့စည်းပုံ**: စာရွက်စာတမ်း စာမျက်နှာအားလုံးတွင် နိဒါန်း၊ သင်ယူရမည့် ရည်မှန်းချက်များ နှင့် သင်ယူပြီးရရှိသည့် အကျိုးအမြတ်များ ထည့်သွင်းခြင်း
- **လမ်းညွှန် သူ/အတန်း ဆက်စပ်မှု**: ဦးတည်ချက်အဖြစ် အရင်၊ နောက် သင်ခန်းစာလင့်ခ်များ ထည့်သွင်းပြီး လေ့လာမှု အဆင်ပြေစေရန်
- **သင်ခန်းစာ လမ်းညွှန်**: သင်ယူရမည့် ရည်မှန်းချက်များ၊ လေ့ကျင့်မှုများနှင့် သုံးသပ်ချက်ပစ္စည်းများ ပါဝင်သော study-guide.md တည်ဆောက်မှု
- **ပရော်ဖက်ရှင်နယ် တင်ဆက်မှု**: ဝမ်းမြောက်မှုအတွက် emoji icon များအားလုံး ဖယ်ရှားထားခြင်း
- **အကြောင်းအရာ ဖွဲ့စည်းမှု တိုးတက်မှု**: သင်ယူမှု ပစ္စည်းများ တင်ဆက်မှုနှင့် စီးဆင်းမှု ပိုမိုကောင်းမွန်စေရန်

#### ပြောင်းလဲမှုများ
- **စာရွက်စာတမ်း ပုံစံ**: သင်ယူမှုပေါ် အခြေခံပြီး စနစ်တကျ စာရေးပုံမှန် ပြုပြင်တည်ဆောက်မှု
- **လမ်းကြောင်း စီမံချက်**: သင်ယူမှု ပစ္စည်းအားလုံးကို သီးခြား သင့်တော်စွာ လမ်းကြောင်း တည်ဆောက်ခြင်း
- **အကြောင်းအရာ တင်ဆက်မှု**: ပုံပန်း ဖော်ပြချက်များ ဖယ်ရှားပြီး ပိုမိုရှင်းလင်းသော ပုံစံဖြင့် ဖော်ပြခြင်း
- **လင့်ခ် ဖွဲ့စည်းပုံ**: ပိုမိုသေချာစေရန် အတွင်းလင့်ခ်များအားလုံးအသစ်လမ်းကြောင်းနှင့် update ပြုလုပ်ခြင်း

#### တိုးတက်မှုများ
- **ဝင်ရောက် မြင်သာမှု**: Screen reader တွင် ပိုမိုအဆင်ပြေစေရန် emoji များကို ဖယ်ရှားခြင်း
- **ပရော်ဖက်ရှင်နယ် ပေါ်တင်မှု**: စင်ကြယ်ပြီး တက္ကသိုလ်ပုံစံ စနစ်ဖြင့် စီစဉ်တင်ဆက်မှု၊ စီးပွားရေးသင်ယူမှုအတွက် သင့်တော်မှု
- **သင်ယူမှု အတွေ့အကြုံ**: အတန်းလိုက်သင်တန်း တစ်ခုချင်းစီအတွက် ရည်ရွယ်ချက်နှင့် အကျိုးအမြတ် မျှတစွာ တိုက်ဆိုင်စေရန် ဖွဲ့စည်းမှု
- **အကြောင်းအရာ စီမံခန့်ခွဲမှု**: ဆက်စပ်ရာဘာသာရပ်များနှင့် ပိုမိုသေချာမြောက်မည့် စီးဆင်းမှု

### [v1.0.0] - 2025-09-09

#### ပထမဆုံး ထုတ်ပြန်မှု - AZD သင်ယူမှု စုစည်းမှု ပြည့်စုံခြင်း

#### ပေါင်းထည့်ချက်များ
- **အခြေခံ စာရွက်စာတမ်း ဖွဲ့စည်းမှု**
  - အစပြု သင်ခန်းစာ များ အစဉ်လိုက် လမ်းညွှန် စီးရီး
  - ထုတ်လုပ်ခြင်းနှင့် Provisioning စာရွက်စာတမ်း များ ပြည့်စုံမှု
  - ပြဿနာများဖြေရှင်းမှု နှင့် debugging လမ်းညွှန်များ အသေးစိတ်
  - တပ်ဆင်မှုမတိုင်ခင် စစ်ဆေးမှု ကိရိယာများ နှင့် လုပ်ထုံးလုပ်နည်းများ

- **အစပြုပုံ မော်ဂျူး**
  - AZD အခြေခံ အယူအဆများ နှင့် ခေါင်းစဉ်များ
  - တပ်ဆင်ခြင်း လမ်းညွှန်: ပလက်ဖောင်းအလိုက် ပြုလုပ်ခြင်း
  - စနစ်တည့်တည့် ဆက်တင် ပြုလုပ်ခြင်းနှင့် အတည်ပြုခြင်း
  - ပထမဆုံး ပရောဂျက် လေ့လာမှု အဆင့်ဆင့် လက်တွေ့

- **ထုတ်လုပ်ခြင်း နှင့် Provisioning မော်ဂျူး**
  - ထုတ်လုပ်ခြင်း လမ်းညွှန်: လုပ်ငန်းစဉ်များ စုံလင်ခြင်း
  - Provisioning လမ်းညွှန်: Bicep ကုဒ်ဖြင့် စက်မှုလုပ်ငန်း ဂေဟစနစ်
  - ထုတ်လုပ်မှုအတွက် ကောင်းမွန်ဆုံး လုပ်ထုံးလုပ်နည်းများ
  - များစွာသော ဝန်ဆောင်မှု စနစ် ပုံစံများ

- **တပ်ဆင်ခြင်း မတိုင်ခင် စစ်ဆေးမှု မော်ဂျူး**
  - ပါဝင်မှု စီမံခြင်း: Azure အရင်းအမြစ် ရရှိနိုင်မှု စစ်ဆေးမှု
  - SKU ရွေးချယ်မှု: ဝန်ဆောင်မှု ခြားနားမှုများအတွက် လမ်းညွှန်ချက်များ
  - မတိုင်ခင် စစ်ဆေးမှု စာရွက်စာတမ်းများ (PowerShell နှင့် Bash)
  - ကုန်ကျစရိတ် ခန့်မှန်းခြေ နှင့် ငွေကြေးစီမံခန့်ခွဲမှု ကိရိယာများ

- **ပြဿနာဖြေရှင်းမှု မော်ဂျူး**
  - ဖြစ်ပေါ်လွယ်သော ပြဿနာများ နှင့် ဖြေရှင်းနည်းများ
  - Debugging လမ်းညွှန်: စနစ်တကျ ပြဿနာဖြေရှင်းနည်းများ
  - အဆင့်မြင့် ကွင်းဆက် စစ်ဆေးနည်းများနှင့် လက်နက်များ
  - စွမ်းဆောင်ရည် စောင့်ကြပ်မှုနှင့် တိုးတက်မှု

- **အရင်းအမြစ်များနှင့် ကိုးကားချက်များ**
  - အမိန့် အရသာစာရွက်: အဓိက အမိန့်များ အတွက် လျင်မြန်ရောက်ရှိစေမှု ကိုးကားချက် 
  - အဓိပ္ပာယ်ဖွင့်ဆိုချက် စာမျက်နှာ: အကြောင်းအရာများနှင့် အက္ခရာအတိုကောက် များ ရှင်းလင်းကူညီမှု
  - မေးမြန်းချက်များ စာမျက်နှာ: အများဆုံး မေးခွန်းများ ပြန်လည်ဖြေဆိုခြင်း
  - ပြင်ပ အရင်းအမြစ် လင့်ခ်များနှင့် လူမှုအသိုင်းအဝိုင်း ချိတ်ဆက်မှုများ

- **နမူနာများနှင့် ပုံစံများ**
  - ရိုးရှင်းသော ဝက်ဘ် application နမူနာ
  - Static ဝက်ဘ်ဆိုက် တပ်ဆင်မှု ပုံစံ
  - ကွန်တိန်နာ app configuration
  - ဒေတာဘေ့စ် ပေါင်းစည်းမှု ပုံစံများ
  - မိုက်ခရိုဆာဗာဆစ် ပုံစံ နမူနာများ
  - Serverless လုပ်ဆောင်ချက် တည်ဆောက်မှု

#### လက္ချက်များ
- **မိုက်လ်တင်း ပလက်ဖောင်း ထောက်ခံမှု**: Windows, macOS, Linux တို့အတွက် တပ်ဆင်ခြင်းနှင့် ဖွဲ့စည်းခြင်း လမ်းညွှန်များ
- **ကျွမ်းကျင်မှု အဆင့်စုံ**: ကျောင်းသားများမှ ပရော်ဖက်ရှင်နယ် developer များအထိ အကြောင်းအရာ အသုံးပြုမှု
- **လက်တွေ့ အခြေပြု**: လက်တွေ့နမူနာများနှင့် အမှန်တကယ်ဖြစ်ပေါ်မည့် လုပ်ငန်းအခြေအနေများ
- **ပြည့်စုံသော ဖုံးလွှမ်းမှု**: အခြေခံအယူအဆများမှ စီးပွားရေးအဆင့်မြင့်ပုံစံများအထိ
- **လုံခြုံရေး ပထမဦးဆုံး စနစ်**: လုံခြုံရေးအကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ အားလုံးတွင် ထည့်သွင်းထားခြင်း
- **ကုန်ကျစရိတ် ထိန်းသိမ်းမှု**: သက်သာစွာ ထုတ်လုပ်ခြင်းနှင့် အရင်းအမြစ် စီမံခန့်ခွဲမှု လမ်းညွှန်ချက်များ

#### စာရွက်စာတမ်း အရည်အသွေး
- **အသေးစိတ် ကုဒ် နမူနာများ**: လက်တွေ့အသုံးပြုနိုင်ပြီး စမ်းသပ်ပြီးသား အကောင်အထည်ဖော်ကုဒ်များ
- **အဆင့်ဆင့် ညွှန်ကြားချက်များ**: ရှင်းလင်းတိကျပြီး လုပ်ဆောင်နိုင်သည့် လမ်းညွှန်ခြင်း
- **ပြည့်စုံသော အမှား ပြင်ဆင်မှု**: ဖြစ်တတ်သော ပြဿနာအတွက် ဖြေရှင်းနည်းများ
- **အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ**: စက်မှုလုပ်ငန်း စံနှုန်းများနှင့် အကြံပြုချက်များ ထည့်သွင်းမှု
- **ဗားရှင်း တစ်ခုထိနေရန်**: နောက်ဆုံး Azure ဝန်ဆောင်မှုများနှင့် azd လုပ်ဆောင်ချက်များနှင့် ကိုက်ညီမှု

## ဆက်လက် ဖွံ့ဖြိုးတိုးတက်မှု စီမံချက်

### ဗားရှင်း ၃.၁.၀ (စီစဉ်ထားသည်)
#### AI ပလက်ဖောင်း တိုးချဲ့မှု
- **မော်ဒယ်စုံ ထောက်ခံမှု**: Hugging Face, Azure Machine Learning, နှင့် ကိုယ်ပိုင်မော်ဒယ် များအတွက် ပေါင်းစည်းမှု စနစ်များ
- **AI အေးဂျင့် ဖန်တီးမှု စနစ်များ**: LangChain, Semantic Kernel, AutoGen တို့အတွက် ပုံစံများ
- **ကြီးမားသော RAG ပုံစံများ**: Azure AI Search အပြင် Vector database ရွေးချယ်မှုများ (Pinecone, Weaviate, စသည်)
- **AI စောင့်ကြည့်ရေး**: မော်ဒယ် ဆောင်ရွက်မှု၊ token အသုံးပြုမှုနှင့် ဖြေကြားမှု အရည်အသွေး မျှတစွာ စောင့်ကြည့်ရန်

#### Developer အတွေ့အကြုံ
- **VS Code Extension**: AZD နှင့် Microsoft Foundry ပေါင်းစည်းမှု ကွန်ယက်ဆိုင်ရာ ဖန်တီးမှု လုပ်ငန်းစဉ်
- **GitHub Copilot ပေါင်းစည်းမှု**: AI ကူညီထောက်ပံ့မှုရှိသော AZD ပုံစံ ဖန်တီးခြင်း
- **အကျိုးသက်ရောက်မှုရှိသော လေ့ကျင့်ခန်းများ**: AI လုပ်ငန်းစဉ်များအတွက် လက်တွေ့ အလုပ်များ၊ အလိုအလျောက် စစ်ဆေးမှုနှင့် ပို့ချမှု
- ** ဗွီဒီယို ပါဝင်မှု**: AI deployment သို့ ဦးတည်သည့် မြင်ကွင်းရှုမြင်သူများအတွက် ဗွီဒီယို သင်ခန်းစာများ

### ဗားရှင်း ၄.၀.၀ (စီစဉ်ထားသည်)
#### စီးပွားရေး AI ပုံစံများ
- **အုပ်ချုပ်ရေး စနစ်**: AI မော်ဒယ် အုပ်ချုပ်မှု၊ လိုက်နာမှုနှင့် စစ်ဆေးခြင်း
- **အမျိုးမျိုးသော လုပ်ငန်းရှင် AI**: ဖောက်သည် စနစ်တိတိများအတွက် AI ဝန်ဆောင်မှု တစ်ခုချင်းစီ ထားရှိခြင်းမှစရေး အလုပ်လုပ်နည်းများ
- **အစွန်းအထင်း AI Deployment**: Azure IoT Edge နှင့် container instance များနှင့် ပေါင်းစည်းခြင်း
- **ချိတ်ဆက်သင့်သည့် Cloud လုပ်ငန်းစဉ်များ**: Multi-cloud နှင့် hybrid deployment များ AI အလုပ်အတွက်

#### အဆင့်မြင့် အင်္ဂါရပ်များ
- **AI Pipeline Automation**: Azure Machine Learning pipeline များဖြင့် MLOps ပေါင်းစည်းခြင်း
- **အဆင့်မြင့် လုံခြုံရေး**: Zero-trust မော်ဒယ်၊ ပုဂ္ဂိုလ်ရေး endpoint များနှင့် ခြိမ်းခြောက်မှုကာကွယ်မှု
- **ဆောင်ရွက်မှုပိုမိုကောင်းမွန်ခြင်း**: မြင့်မားသော Throughput ရရှိစေရန် AI application များအတွက် ပြုပြင် တိုးတက်မှုများ
- **ကမ္ဘာလုံးဆိုင်ရာ ဖြန့်ချိမှု**: အကြောင်းအရာ ပို့ဆောင်မှု နှင့် edge caching ပုံစံများ AI application များအတွက်

### ဗားရှင်း ၃.၀.၀ (စီစဉ်ထားပြီး ယခုထုတ်ပြန်ထားသည်)
#### အကြံပြု ထည့်သွင်းချက်များ - ယခု v3.0.0 တွင် အပြီးသတ်ဖြစ်ပေါ်
- ✅ **AI အား ရည်ရွယ်သော အကြောင်းအရာ**: Microsoft Foundry ပေါင်းစည်းမှု စုံလင်စွာ (ပြီးစီး)
- ✅ **လက်တွေ့သင်တန်း**: AI Workshop Lab (ပြီးစီး)
- ✅ **အဆင့်မြင့် လုံခြုံရေး မော်ဂျူး**: AI ပိုင်ရှင် လုံခြုံရေးပုံစံများ (ပြီးစီး)
- ✅ **ဆောင်ရွက်မှုပိုမိုကောင်းမွန်ခြင်း**: AI အလုပ်စီးရီး အတွက် ထိန်ချုပ်မှုနည်းလမ်းများ (ပြီးစီး)

### ဗားရှင်း ၂.၁.၀ (စီစဉ်ပြီး အချို့ v3.0.0 မှ ရရှိ)
#### ငယ်ငယ် တိုးတက်မှုများ - ယခုထုတ်ပြန်မှုတွင် အချို့ ပြီးပြည့်စုံ
- ✅ **နမူနာများ ထပ်ဆောင်း**: AI အရည်အသွေးတိုးတက်မှု ကျင့်သုံးမှု (ပြီးစီး)
- ✅ **အကြံပြု မေးခွန်းများ တိုးချဲ့မှု**: AI ပိုင်ရှင် မေးခွန်းများနှင့် ပြဿနာဖြေရှင်းမှု (ပြီးစီး)
- **ကိရိယာ ပေါင်းစည်းမှု**: IDE နှင့် စာမူရေးသူ ပေါင်းစည်းမှု လမ်းညွှန်
- ✅ **စောင့်ကြပ်မှု အသွင်တိုးချဲ့မှု**: AI အထူး ထားရှိသော စောင့်ကြပ်မှု နှင့် သတိပေး ပုံစံများ (ပြီးစီး)

#### အနာဂတ်ထုတ်ပြန်မှုအတွက် စီစဉ်ထားသော အမှုများ
- **ကိရိယာ မိုဘိုင်းသုံး လူကြိုက်များအတွက် စာရွက်စာတမ်း**: မိုဘိုင်းသင်ယူမှု အဆင်ပြေစေမည့် responsive ဒီဇိုင်း
- **အွန်လိုင်းမလို အလွယ်တကူ ဗားရှင်းဆွဲနိုင်ခြင်း**: ဒေါင်းလုတ်လွယ်သော စာရွက်စာတမ်း အထုပ်များ
- **IDE ပေါင်းစည်းမှု တိုးတက်မှု**: VS Code extension AZD နှင့် AI workflow အတွက်
- **လူမှုအသိုင်းအဝိုင်း ဒိုင်ရှ်ဘုတ်**: လူမှုအသိုင်းအဝိုင်း တိုးတက်မှုနှင့် အတူတူ ပံ့ပိုးမှုများကို အချိန်နှင့်တပြေးညီ ကြည့်ရှုနိုင်မှု

## Changelog အတွက် ပါဝင်ဆောင်ရွက်ခြင်း

### ပြောင်းလဲမှုများ ထည့်သွင်း ဖော်ပြခြင်း
ဒီ repository တွင် ပါဝင်ဆောင်ရွက်ရာတွင် changelog မှတ်တမ်းများတွင် အောက်ပါ အချက်များ ပါဝင်စေရန် သေချာပါစေ

1. **ဗားရှင်း နံပါတ်**: semantic versioning အညီ (major.minor.patch)
2. **ရက်စွဲ**: ထုတ်ပြန်ချိန် သို့မဟုတ် အပ်ဒိတ်ပြုလုပ်ချက် ရက်စွဲ (YYYY-MM-DD ပုံစံ)
3. **အမျိုးအစား**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **ရှင်းလင်းပြီး တိကျသော ဖော်ပြချက်**: ပြောင်းလဲချက်များ ဘာတွေလဲဆိုတာ တိုက်ရိုက်ဖော်ပြပေးခြင်း
5. **အကျိုးသက်ရောက်မှု တွက်ချက်ချက်**: ရှိပြီးသား အသုံးပြုသူများအပေါ် အပြောင်းအလဲများဟာ ဘယ်လို သက်ရောက်မှုရှိမလဲ ဆိုတာ

### ပြောင်းလဲမှု အမျိုးအစားများ

#### ပေါင်းထည့်ချက်များ
- စွမ်းဆောင်ရည် အသစ်များ၊ စာရွက်စာတမ်း အပိုင်းများ သို့မဟုတ် အင်အားများ
- နမူနာအသစ်များ၊ ပုံစံများ၊ သင်ယူမှု အရင်းအမြစ်များ
- ကိရိယာများ၊ စာရွက်များ သို့မဟုတ် စနစ်များ ထပ်ထည့်ခြင်း

#### ပြောင်းလဲချက်များ
- ရှိပြီးသား လုပ်ဆောင်ချက် သို့မဟုတ် စာရွက်စာတမ်း ပြင်ဆင်မှုများ
- ပိုမိုရှင်းလင်း သို့မဟုတ် တိကျမှန်ကန်စေရန် အပ်ဒိတ်များ
- အကြောင်းအရာ သို့မဟုတ် စနစ် ပြုပြင်ပြောင်းလဲမှုများ

#### သတိပေးချက် ထုတ်ပြန်ချက်များ
- ကာလကြာမြင့်စွာ အသုံးမပြုတော့သော စွမ်းဆောင်ရည်များ
- ဖယ်ရှားရန် စီစဉ်ထားသော စာရွက်စာတမ်း အပိုင်းများ
- အခြားနည်းလမ်းများ ပိုမိုကောင်းမွန်သော နည်းလမ်းများရှိသည့် နည်းများ

#### ဖယ်ရှားခြင်းများ
- သက်ဆိုင်မှုမရှိတော့သော စွမ်းဆောင်ရည်များ၊ စာရွက်စာတမ်းများ သို့မဟုတ် နမူနာများ
- အသစ်မဟုတ်တော့သော အချက်အလက်များ သို့မဟုတ် သတိပေးချက်များ
- ထပ်တူညီမျှ သို့မဟုတ် စုပေါင်းထားသော အကြောင်းအရာများ

#### ပြင်ဆင်ပြီးသားများ
- စာရွက်စာတမ်း သို့မဟုတ် ကုဒ်အတွင်း အမှားများ ပြင်ဆင်ခြင်း
- ထုတ်ဖော်ပြခဲ့သော ပြဿနာများ သက်မှတ်ထားခြင်း နှင့် ဖြေရှင်းခြင်း
- တိကျမှန်ကန်မှု နှင့် လုပ်ဆောင်ချက် တိုးတက်မှု


#### လုံခြုံရေး
- လုံခြုံရေးနှင့်သက်ဆိုင်သောတိုးတက်မှုများ သို့မဟုတ် ပြင်ဆင်ချက်များ
- လုံခြုံရေး အကောင်းဆုံး လေ့လာမှုများသို့ အပ်ဒိတ်များ
- လုံခြုံရေး ချွတ်ချက်များ ဖြေရှင်းခြင်း

### အဓိပ္ပာယ်ရသော ဗားရှင်းနည်းပြ ညွှန်ကြားချက်များ

#### အဓိက ဗားရှင်း (X.0.0)
- အသုံးပြုသူ လုပ်ဆောင်ချက်လိုအပ်သော ချိုးဖျက်မည့် ပြောင်းလဲမှုများ
- အကြောင်းအရာ သို့မဟုတ် အဖွဲ့အစည်းတစ်ခုလုံး ပြုစုပြင်ဆင်မှုကြီးများ
- အခြေခံနည်းလမ်း သို့မဟုတ် နည်းဗျူဟာကိုပြောင်းလဲသော ပြောင်းလဲမှုများ

#### အနည်းငယ်ဗားရှင်း (X.Y.0)
- အသစ်ထည့်သွင်းထားသော အင်္ဂါရပ်များ သို့မဟုတ် အကြောင်းအရာများ
- နောက်ဆက်တွဲလိုက်နာမှုကို ထိန်းသိမ်းထားသည့် တိုးတက်မှုများ
- နမူနာများ၊ ကိရိယာများ သို့မဟုတ် ရင်းမြစ်များ ပိုမိုထည့်သွင်းခြင်း

#### ပြင်ဆင်မှု ဗားရှင်း (X.Y.Z)
- အမှားများပြင်ဆင်ခြင်းနှင့် မွမ်းမံမှုများ
- ရှိပြီးသား အကြောင်းအရာတွင် အသေးငယ်ပြုလုပ်ထားသည့် တိုးတက်မှုများ
- ရှင်းလင်းချက်များနှင့် အသေးစားတိုးတက်မှုများ

## အသိုင်းအဝိုင်း မှာယူချက်များနှင့် အကြံပြုချက်များ

ဤသင်ယူမှုရင်းမြစ်ကိုတိုးတက်အောင်အသိုင်းအဝိုင်းမှ မှတ်ချက်များ ပေးပို့ရန် ကျွန်ုပ်တို့ စိတ်အားထက်သန်အားထုတ်ပါသည်။

### မှတ်ချက်ပေးပုံ
- **GitHub Issues**: ပြဿနာများကိုအစီရင်ခံခြင်း သို့မဟုတ် တိုးတက်မှုများအကြံပြုခြင်း (AI သက်ဆိုင်ရာ ပြဿနာများလက်ခံသည်)
- **Discord Discussions**: ကြံစည်ချက်များမျှဝေခြင်းနှင့် Microsoft Foundry အသိုင်းအဝိုင်းနှင့် ပူးပေါင်းဆွေးနွေးခြင်း
- **Pull Requests**: အကြောင်းအရာများသို့ တိုက်ရိုက်တိုးတက်မှုများ ပေးသွင်းခြင်း၊ အထူးသဖြင့် AI ပုံစံများ နှင့် လမ်းညွှန်များအတွက်
- **Microsoft Foundry Discord**: #Azure ချန်နယ်တွင် AZD + AI ဆွေးနွေးမှုများတွင် ပါဝင်ဆောင်ရွက်ခြင်း
- **Community Forums**: ပိုမိုကျယ်ပြန့်သည့် Azure ဖန်တီးသူ ဆွေးနွေးပွဲများတွင် ပါဝင်ဆွေးနွေးခြင်း

### မှတ်ချက်အမျိုးအစားများ
- **AI အကြောင်းအရာမှန်ကန်မှု**: AI ဝန်ဆောင်မှု ပေါင်းစည်းခြင်းနှင့် တပ်ဆင်ခြင်းနည်းလမ်းများ အတွက် စစ်မှန်မှုပြင်ဆင်မှုများ
- **သင်ယူမှုပုံစံ**: AI ဖန်တီးသူ သင်ယူမှုပုံစံတိုးတက်ရေးအတွက် အကြံပြုချက်များ
- **AI အကြောင်းအရာလွတ်လပ်မှု**: ထပ်မံထည့်သွင်းရန် AI ပုံစံများ၊ ဒီဇိုင်များ သို့မဟုတ် နမူနာများ ဆန္ဒရှိမှုများ
- **လက်လှမ်းမီမှု**: တပ်ဆင်သည့် သင်ယူသူများအတွက် တိုးတက်မှုများ
- **AI ကိရိယာ ပေါင်းစည်းမှု**: AI ဖန်တီးမှုလုပ်ငန်းစဉ် ပိုမိုကောင်းမွန်စေရန် အကြံပြုချက်များ
- **ထုတ်လုပ်မှု AI ဒီဇိုင်းများ**: စီးပွားရေး AI တပ်ဆင်မှု ဒီဇိုင်းများတောင်းဆိုချက်များ

### ဖြေကြားမှု မျှတမှု
- **ပြဿနာများအတွက် ဖြေကြားမှု**: တင်ပြထားသည့် ပြဿနာများအား ၄၈ နာရီအတွင်း
- **အင်္ဂါရပ်တောင်းဆိုမှုများ**: တစ်ပတ်အတွင်း စိစစ်သုံးသပ်ခြင်း
- **အသိုင်းအဝိုင်း ပါဝင်ဆောင်ရွက်မှုများ**: တစ်ပတ်အတွင်း ပြန်လည်သုံးသပ်ခြင်း
- **လုံခြုံရေး ပြဿနာများ**: အလိုအလျောက် ဦးစားပေးဖြေရှင်းခြင်းနှင့် မြန်ဆန်သောတုံ့ပြန်မှု

## မူလမ်းညွှန်ထားသည့် ပြုပြင်ထိန်းသိမ်းရေး အချိန်ဇယား

### ပုံမှန် အပ်ဒိတ်များ
- **လစဉ် သုံးသပ်ချက်များ**: အကြောင်းအရာမှန်ကန်မှုနှင့် လင့်ခ်စစ်ဆေးခြင်း
- **သုံးလအပ်ဒိတ်များ**: အကြောင်းအရာအဓိက ထပ်မံထည့်သွင်းခြင်းနှင့် တိုးတက်မှုများ
- **အမယ်ဗျာ သုံးလအကြိမ် များ**: ပြန်လည်ပြုပြင်မှုကြီးများနှင့် တိုးတက်မြှင့်တင်မှုများ
- **နှစ်စဉ် ထုတ်ကုန်များ**: အဓိက ဗားရှင်းများ အပ်ဒိတ်နှင့် အရေးပါတဲ့ တိုးတက်မှုများ

### စောင့်ကြည့်ခြင်းနှင့် အရည်အသွေး အာမခံခြင်း
- **အလိုအလျောက်စမ်းသပ်မှု**: ကုဒ်နမူနာများနှင့် လင့်ခ်များကို ပုံမှန် စစ်ဆေးမှု
- **အသိုင်းအဝိုင်းမှ မှတ်ချက်များ ပေါင်းစည်းမှု**: အသုံးပြုသူ အကြံပြုချက်များကို ပုံမှန် ထည့်သွင်းခြင်း
- **နည်းပညာ အပ်ဒိတ်များ**: နောက်ဆုံးပေါ် Azure ဝန်ဆောင်မှုများနှင့် azd ထုတ်ဝေမှုများနှင့် ကိုက်ညီမှု
- **လက်လှမ်းမီမှု စစ်ဆေးမှုများ**: အားလုံးပါဝင်မှု ဒီဇိုင်းနည်းလမ်းများအတွက် ပုံမှန် သုံးသပ်ခြင်း

## ဗားရှင်းထောက်ပံ့မှု မူဝါဒ

### လောကီ ဗားရှင်း ထောက်ပံ့မှု
- **နောက်ဆုံးပေါ် အဓိက ဗားရှင်း**: ပုံမှန် အပ်ဒိတ်များနှင့်အတူ ပြည့်ပြည့်စုံစုံ ထောက်ပံ့မှု
- **ယခင် အဓိက ဗားရှင်း**: လုံခြုံရေး အပ်ဒိတ်များနှင့် အရေးကြီး ပြင်ဆင်မှုများအား ၁၂ လအထိ
- **အတိတ် ဗားရှင်းများ**: အသိုင်းအဝိုင်းမှ ထောက်ပံ့မှုများသာ ရရှိနိုင်ပြီး တရားဝင် အပ်ဒိတ် မရှိပါ

### ပြောင်းရွှေ့ခြင်း လမ်းညွှန်ချက်များ
အဓိက ဗားရှင်း အသစ်များ ထုတ်ဝေသည့်အခါ ကျွန်ုပ်တို့ ပံ့ပိုးပေးသည်မှာ-
- **ပြောင်းရွှေ့မှု လမ်းညွှန်များ**: အဆင့်ဆင့် မောင်းနှင်ပုံများ
- **လိုက်လျောညီထွေ မှတ်ချက်များ**: ချိုးဖျက်မည့် ပြောင်းလဲမှုအကြောင်း အသေးစိတ်
- **ကိရိယာထောက်ပံ့မှု**: ပြောင်းရွှေ့ခြင်း အတွက် ကူညီပေးသော စက်ရုပ်များ သို့မဟုတ် အသုံးချမှုများ
- **အသိုင်းအဝိုင်း ထောက်ပံ့မှု**: ပြောင်းရွှေ့ခြင်းဆိုင်ရာ မေးခွန်းများအတွက် ရည်ရွယ်ထားသည့် ဖိုရမ်များ

---

**လမ်းညွှန်မှု**
- **ယခင် သင်ခန်းစာ**: [လေ့လာမှု လမ်းညွှန်](resources/study-guide.md)
- **နောက်ထပ် သင်ခန်းစာ**: [အဓိက README](README.md) သို့ ပြန်သွားရန်

**သတင်းအချက်အလက် ထိန်းသိမ်းရန်**: သင်ယူမှုပစ္စည်းအသစ်များနှင့် အရေးပါတဲ့ အပ်ဒိတ်များအတွက် ဤ Repository ကို ကြည့်ရှုရန်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
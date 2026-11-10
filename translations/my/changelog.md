# Changelog - AZD အတွက် စတုဒိန်များ

## ဝင်ကြောင်း

ဒီ changelog ဟာ AZD အတွက် စတုဒိန်များ repository မှာ ဖြစ်ပေါ်ခဲ့တဲ့ အရေးပါဆုံးပြောင်းလဲမှုများ၊ update များနဲ့တိုးတက်မှုများအားလုံးကို မှတ်တမ်းတင်ထားပါတယ်။ ကျနော်တို့ semantic versioning အခြေခံချက်တွေကိုလိုက်နာပြီး ဤမှတ်တမ်းကို အသုံးပြုသူတွေကို version များကြား ဘာတွေပြောင်းလဲသွားမှန်းနားလည်နိုင်ဖို့ ထိန်းသိမ်းထားပါတယ်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီ changelog ကို ပြန်လည်ကြည့်ရှုပြီးနောက်မှာ သင်သည် -
- အသစ်ထည့်သွင်းသော feature နဲ့ အကြောင်းအရာများအကြောင်း သိရှိနားလည်ထားနိုင်မှာဖြစ်သည်
- ရှိပြီးသားစာတမ်းများအပေါ် အဆင့်မြှင့်တင်မှုများကို နားလည်နိုင်သည်
- မှားယွင်းချက်များနဲ့ပြင်ဆင်မှုများကို လိုက်လံကြည့်ရှု၍ တိကျမှန်ကန်မှုကိုသေချာစွာ ထိန်းသိမ်းနိုင်သည်
- သင်ယူမှုအကြောင်းအရာများ၏ ဖွံ့ဖြိုးတိုးတက်မှုကို အချိန်အလိုက် လေ့လာနိုင်သည်

## သင်ယူ၏ရလဒ်များ

changelog မှတ်ချက်များကို ကြည့်ရှုပြီးနောက် သင်သည် -
- အသစ်ထည့်သွင်းသည့် အကြောင်းအရာနှင့် စနစ်များကို မှတ်သားနိုင်မည်
- အပိုင်းများဘယ်ဟာတွေ ပြောင်းလဲတိုးတက်မှုခံထားရပြီးမှတ်သားနိုင်သည်
- နောက်ဆုံးပေါ် အကြောင်းအရာများအပေါ် အခြေခံပြီး သင့်သင်ယူခြင်းလမ်းကြောင်းကို လမ်းညွှန်စီမံနိုင်မည်
- နောင်လာမည့်တိုးတက်မှုများအတွက် အကြံပေးချက်များနှင့် အကြံဉာဏ်များ ပံ့ပိုးပေးနိုင်မည်

## ဗားရှင်းမှတ်တမ်း

### [v3.24.0]- 2026-11-04

#### ပြင်ဆင်ပြီး
- အင်္ဂလိပ်ဘာသာဖြင့် သင်တန်းလမ်းညွှန်မှု၊ လိုအပ်သည့် စာမျက်နှာလမ်းကြောင်းများ၊ anchor များမပါသောနေရာများ နှင့် အသုံးမပြုတော့သော အပြင်ဘက်ရင်းမြစ်များကို ပြင်ဆင်ပြီး၊ Chapter 2 တွင်ပါဝင်သော ထုတ်လုပ်ရေး AI လမ်းညွှန်ချက် ဆက်သွယ်ချက်လင့်ခ် များပါ ပါဝင်သည်။
- လက်ရှိလမ်းညွှန်ချက်များကို AZD 1.37.2, agents 1.0.0-beta.23 နှင့် evaluations 1.0.0-beta.2 ဖော်ပြမှုများနှင့် နှိုင်းယှဉ် ပြန်လည်သုံးသပ်ထားပြီး၊ ဤမှတ်တမ်းတွင် မတူညီသော `azd ai eval` workflow နှင့် optimization configuration ကို ကူးပြောင်းမှုအကြောင်း ဖော်ပြထားသည်။
- ပံ့ပိုးမှုမရသော CLI အမှတ်အသားများ၊ နောက်ခံမှန်ကန်မှုများ၊ ပြောကြားချက်မပါသော ပတ်ဝန်းကျင်/လျှိုဝှက်ချက် လမ်းညွှန်ချက်များ၊ အခြေခံအဆောက်အအုံနဲ့ မော်ဒယ်ပုံစံကွပ်မျက်မှုနှင့် ဖျက်ဆီးမှုပြန်လည်ထိန်းသိမ်းမှု ဥပမာများအားဖြင့် ပြင်ဆင်ထိန်းသိမ်းခဲ့သည်။
- လက်ရှိ AI Agents စမ်းသပ်မှုများနှင့် အညီ စမ်းသပ်ဆောင်ရွက်မှု၊ သတ်မှတ်ချက်ထည့်သွင်းမှုများ၊ အကဲဖြတ်မှုစမ်းသပ်ရေးများ၊ အန္တရာယ်လုံခြုံရေးအသုံးပြုမှုများကို ပြန်လည်ပြောင်းလဲပြီး စူးစမ်းလေ့လာခဲ့သည်။
- ဥပမာဆောင်ရွက်မှု ပြောကြားချက်များကိုမှန်ကန်စွာပြုပြင်ပြီး၊ ပတ်စပတ်လည် application, infrastructure, configuration ထိန်းသိမ်းမှုများကို ပြန်လည်အပ်နှံခဲ့သည်။ Retail architecture အကြောင်းအရာသည် လုံးဝ တက်တိကျသော application မှ မတူဘဲ ပိုမိုရှင်းလင်းစွာ ဖော်ပြထားသည်။
- CodeQL ဘာသာစကား matrix ကို ပြန်လည်ထူထောင်ခဲ့ပြီး Node.js 24 ကို dev container များအတွက် ရွေးချယ်ခဲ့သည်။ စတင်တပ်ဆင်စစ်ဆေးသူများသည် လက်ရှိအသုံးပြု version မဟုတ်ပါသော command များကို ဖော်ပြသည်။

#### ထည့်သွင်းခဲ့သည်
- အင်္ဂလိပ်ဘာသာပဲ အသုံးပြုသော offline link/anchor စစ်ဆေးရေး စနစ်၊ regression စမ်းသပ်မှုများနှင့် စောင့်ရှောက်ရေးလုပ်ငန်းစဉ်ကို လည်း strict mode တွင် workshop ကို တည်ဆောက်သည့် documentation workflow တစ်ခု ထည့်သွင်းခဲ့သည်။ ပြန်ဆိုမှုများနှင့် ဘာသာပြန်ပြီး ဓာတ်ပုံများကို မပါဝင်ပါ။

#### အတည်ပြုမှု နယ်ပယ်
- source, syntax, configuration, ပြည်တွင်း လုပ်ဆောင်ချက်များနှင့် network-link စစ်ဆေးချက်များသည် live Azure deployability, quota, RBAC, တိုင်းဒေသဆိုင်ရာ မော်ဒယ်ရရှိနိုင်မှု၊ billing, ရှိသေးသောလုံခြုံရေးလိုက်နာမှုများ သို့မဟုတ် ထုတ်လုပ်ရေးအသင့်ရှိမှုအား ပြည့်စုံစစ်ဆေးရန် မဖြစ်စေပါ။
- အောက်ပါ ရှေးအချိန် မှတ်တမ်းများမှာ သမိုင်းဝင်မှတ်တမ်းများဖြစ်ပြီး လက်ရှိ command သို့မဟုတ် release အညွှန်းမဟုတ်ပါ။

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: ဗားရှင်းမှန်ကန်မှု အပ်ဒိတ်
**ဤဗားရှင်းသည် `azd` `1.27.1` (2026 ခုနှစ် ဇူလိုင်၊ နောက်ဆုံးတည်ငြိမ်သောထုတ်လုပ်မှု) နှင့် လက်ရှိ AI agent extension ထည့်သွင်းချက် `azure.ai.agents` `1.0.0-beta.5` အပေါ် အခြေခံ၍ ပြန်လည်စစ်ဆေးပြီး 1.26.0, 1.27.0, နှင့် 1.27.1 ထွက်ရှိမှုများတကြောင်း “validated against” အလံများအားလုံးကို နောက်ဆုံးသတ်မှတ်ထားသည်။**

#### ပြောင်းလဲမှုများ
- **✅ အတည်ပြုခြင်း အခြေခံလိုင်းပြင်ဆင်မှု** ကို `azd 1.25.6` (ဇွန် 2026) မှ `azd 1.27.1` (ဇူလိုင် 2026) သို့ အမြစ် README, အခန်းများ၏ README များအားလုံး, အခန်း 1 dev-container သင်ခန်းစာ (ဗားရှင်းချုပ်ထားသော နမူနာများအပါအဝင်), အခန်း 4 custom-templates သင်ခန်းစာ, အခန်း 5 multi-agent သင်ခန်းစာနှင့် အလုပ်ရုံဆွေးနွေးမှု စာရွက်များတွင် ပြင်ဆင်ခဲ့သည်။
- **🤖 အခန်း 2 အခြေခံလိုင်းပြန်လည်သစ်တမ်းဆွဲခြင်း** ကို `azd 1.23.12` (မတ် 2026) မှ `azd 1.27.1` ဆီသို့ `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, နှင့် `microsoft-foundry-integration.md` တွင် ပြင်ဆင်ပေးခဲ့သည်။ အတည်ပြုချက်မှတ်ချက်ရက်စွဲများကို 2026-07-13 သို့ပြင်ဆင်ခဲ့သည်။
- **🧩 AI agent extension bumped** မှ `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` မှ ယခုလက်ရှိ `1.0.0-beta.5` ထုတ်လွှင့်မှုသို့ Chapter 2 README နှင့် `agents.md` တွင်တိုးမြှင့်ထားပါသည်
- **🧪 workshop မှ စစ်ဆေးချက်နမူနာ** (`azd version` output) ကို `1.27.1` သို့ ပြင်ဆင်ပြီး

#### သက်ဆိုင်ရာ azd ထုတ်လွှင့်မှုများအပေါ် မှတ်စုများ (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Flex Consumption ပေါ်တွင် Azure Functions အတွက် Go ပံ့ပိုးမှု, `azd config sub-filter` တစ်ဦးချင်း tenant subscription စစ်ထုတ်မှုများ, ကိုယ်ပိုင် မျိုးဆက်ချိတ်ဆက်ပက်ကေ့ဂျ်များ (`azd x pack --bundle`), နှင့် `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry ပရောဇက်များ/အေဂျင့်များကို တိုက်ရိုက် `azure.yaml` တွင် မော်ဒယ်လုပ်ဆောင်ခြင်း (Bicep-less/Terraform-less init), App Service အတွက် container deployment ပံ့ပိုးမှု (`host: appservice` + `language: docker`), `-s/--source` အတွက် တိုက်ရိုက် `azd extension` အမိန့်များနှင့် `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag အတွက် `azd extension install`, deprecated မော်ဒယ်များကို ပုံမှန်အားဖြင့် ကတ်တလော့/ကွိုတာ စာရင်းမှ ဖယ်ရှားပြီး နှင့် အချို့သော bug ပြင်ဆင်မှုများ

#### ပြင်ဆင်ထားသည့် ဖိုင်များ
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

#### ဝင်ရောက်အသုံးပြုသူ အတတ်ပညာ ဖြည့်စွက် #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, နှင့် အခြားများ
**ဒီဗားရှင်းက azd-coverage အကဲဖြတ်မှုမှ ဖော်ပြခဲ့သော ကျန်ရှိနေသော အလယ်အလတ် အကြားအကြောင်းအရာများကို ပိတ်ဆို့ပေးသည်။ မိမိ၏ ကိုယ်ပိုင် template ကို အောက်ပြပေးခြင်းနည်း၊ ပြန်လည်ထုတ်လုပ်နိုင်သော dev-container/Codespaces ပတ်ဝန်းကျင်များ၊ Pulumi အုပ်ချုပ်မှုပံ့ပိုးသူ၊ Azure DevOps CI/CD မှာ လမ်းညွှန်ချက်၊ service-principal အတည်ပြုမှု၊ အိပ်တန်ဆာ ရွေးချယ်မှု လမ်းညွှန်ချက် (AKS/Spring Apps)၊ `azd restore`/`azd package` ရှင်းလင်းချက်များ၊ hook အမှား ကိုင်တွယ်ခြင်း၊ နှင့် အဖွဲ့/မျှဝေသော ပတ်ဝန်းကျင် လေ့လာမှုများကို ဖော်ပြထားသည်။**

#### ဖြည့်စွက်ပြီး
- **🧱 ဂျစ်သစ် အခန်း ၄ သင်ခန်းစာ** `docs/chapter-04-infrastructure/custom-templates.md` — ကိုယ်ပိုင် azd template ကို ဖန်တီးခြင်း: လိုအပ်သော ဖွဲ့စည်းပုံ (`azure.yaml`, `infra/`, `src/`), `metadata.template` ကွက်၊ `uniqueString()` အရင်းအမြစ် ကုဒ်နှင့် `azd-env-name` တံဆိပ်ဖြင့် အုပ်ချုပ်မှု၊ `azd init --template <local-path>` ဖြင့် ဒေသခံစမ်းသပ်ခြင်း၊ GitHub တွင် ထုတ်ဝေခြင်း နှင့် Awesome AZD ပြခန်းသို့ တင်သွင်းခြင်း
- **📦 ဘွဲ့သစ် အခန်း ၁ သင်ခန်းစာ** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers နဲ့ GitHub Codespaces ကို အသုံးပြု၍ ပြန်လည်ထုတ်လုပ်နိုင်တဲ့ azd ပတ်ဝန်းကျင်များ။ အနည်းဆုံး `.devcontainer/devcontainer.json` ရိုးရိုးနှင့် အတူ တရားဝင် `ghcr.io/azure/azure-dev/azd` လက္ခဏာ၊ ဘာသာစကားအထူးလက္ခဏာများ၊ ကွန်တိန်နာဟိုစ့်များအတွက် `docker-in-docker` နှင့် ဝေးရာမှ အိုင်ဒီဇင်အင်အတွက် `azd auth login --use-device-code` ကို အသုံးပြုခြင်း။
- **🧩 Pulumi နှင့် azd** အပိုဒ်တွင် `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi ဖိုလဒါ တည်ဆောက်ပုံ, stacks များကို azd ပတ်ဝန်းကျင်များနှင့် ကိုက်ညီစွာချိတ်ဆက်ခြင်း, လိုအပ်သော outputs/tagging, နှင့် အတူတူသော `azd up` / `azd down` လုပ်ငန်းစဉ်
- **🎯 ဟိုတ်စ်ရွေးချယ်မှုလမ်းညွှန်မှု** ကို `docs/chapter-04-infrastructure/provisioning.md` တွင် — စပြီးသားများအတွက် `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, နှင့် `springapp` တို့၏နှိုင်းယှဉ်ချက်၊ AKS သို့မဟုတ် Azure Spring Apps ရွေးချယ်သင့်သည့်အချိန်အတွက် လမ်းညွှန်ချက်ပါရှိသည်
- **🛠️ Azure DevOps CI/CD လမ်းညွှန်** ကို `docs/chapter-08-production/production-ai-practices.md` တွင် — `azd pipeline config --provider azdo`, workload identity federation (OIDC) ဖြင့် service connection, ထုတ်လုပ်ထားသော `azure-dev.yml`, နှင့် variable-group တပ်ဆင်မှု
- **🔑 Service Principals (ပုံစံ 4)** ကို `docs/chapter-03-configuration/authsecurity.md` တွင် ထည့်သွင်းပြီး — `az ad sp create-for-rbac`, client secret ဝင်ရောက်မှုမလိုသော `azd auth login` နှင့် federated/OIDC အတည်ပြုချက်များ၊ အသုံးပြုသင့်သည့်အချိန်၊ နှင့် လုံခြုံသော အတည်ပြုချက်သိုလှောင်မှု
- **🪝 Hook အမှားကိုင်တွယ်မှု** အပိုင်းသည် `docs/chapter-04-infrastructure/deployment-guide.md` တွင် — ထွက်မည့်ကုဒ်များနှင့် `set -e`, `continueOnError`, သီးခြား hook များကို `azd hooks run` ဖြင့် စစ်ဆေးခြင်း, OS အထူး shell များ, နှင့် `--debug` ပါဝင်သည်
- **👥 အသင်း / ပူးပေါင်းသုံး ပြင်ပပတ်ဝန်းကျင်များ** အပိုင်းဆိုက်ရန် `docs/chapter-03-configuration/configuration.md` — `.azure/` အတွင်းရှိအရာများ, gitignore ပြုရမည့်အရာများ, တစ်ဦးချင်းသုံး ပြင်ပပတ်ဝန်းကျင်များ, `azd env list`/`select`, နှင့် CI/CD တွင် ပြင်ပပတ်ဝန်းကျင်တန်ဖိုးများပေးသွင်းခြင်း
- **🧰 `azd restore` နှင့် ကျယ်ပြန့်စွာရှင်းလင်းချက်များရှိသော `azd package`** ကို `resources/cheat-sheet.md` တွင် — လိုအပ်ချက်ပြန်လည်တင်သွင်းခြင်းနှင့် တပ်ဆင်နိုင်သည့်အထောက်အထားတစ်ခုတည်ဆောက်ခြင်း၊ တပ်ဆင်ခြင်းမလုပ်ဘဲ

#### ပြောင်းလဲသည်
- **🧭 အခန်း 4 သင်ခန်းစာဇယား** သစ် "သင့်ကိုယ်ပိုင် စံတမ်းရေးသားခြင်း" သင်ခန်းစာ (သင်ခန်းစာ 3) ပါဝင်သည့်အတွက် အပ်ဒိတ်ပြုလုပ်သည်
- **🧭 အခန်း 1 သင်ခန်းစာဇယား** သစ် "Dev Containers & Codespaces" သင်ခန်းစာ (သင်ခန်းစာ 5) ပါဝင်သည့်အတွက် အပ်ဒိတ်ပြုလုပ်ပြီး `bring-your-own-app.md` နှင့် `dev-containers.md` အကြားလမ်းညွှန်ခြင်း footer များထည့်သွင်းသည်

### [v3.21.0] - 2026-06-16

#### စပြီးသူများအတွက် အားနည်းချက်ဖြည့်တင်းခြင်း: လက်တွေ့အသုံးပြု Multi-Agent သင်ခန်းစာ၊ "သင့်ကိုယ်ပိုင် အပ်ပလီကေးရှင်း", Terraform, နှင့် CI/CD လမ်းညွှန်
**ဤဗားရှင်းသည် စပြီးတဲ့လူများအတွက် လုပ်ဆောင်မှုများအများဆုံး ပြည့်စုံစေရန် လက်တွေ့အသုံးပြုသင်ခန်းစာနှစ်ခု (တပ်ဆင်နိုင်သည့် multi-agent လမ်းညွှန်မှုနှင့် လက်ရှိအပ်ပလီကေးရှင်းတွင် azd တွဲချိတ်ခြင်း), စပြီးသူများအတွက် hooks မိတ်ဆက်ခြင်း, Terraform နှင့် azd ကဏ္ဍ, အဆင့်တိုင်းပြုလုပ်သော GitHub Actions pipeline လမ်းညွှန်မှု, အသစ် preview extensions ရှင်းလင်းချက်, နှင့် ထိရောက်သော တပ်ဆင်မှုအတည်ပြု စစ်ဆေးစာရင်း တို့ကို ပေါင်းထည့်ထားသည်။**

#### ထည့်သွင်းသည်
- **🤝 အခန်းသစ် ၅ သင်ခန်းစာ** `docs/chapter-05-multi-agent/multi-agent-basics.md` — လက်တွေ့အသုံးပြုနိုင်သော လက်တွေ့ လမ်းညွှန်ချက်အပြည့်အစုံဖြစ်ပြီး (ဦးစွာစီမံခန့်ခွဲသူ + အထူးပြုသူများ) ကို အမှန်တကယ် အတန်းပုံစံ (`contoso-creative-writer`) ဖြင့် အသုံးချပြသခြင်း၊ multi-agent ကို မည်သို့အသုံးပြုရမည်၊ `azd up` workflow၊ တပ်ဆင်ထားသော အရင်းအမြစ်များကို နားလည်ခြင်း၊ agent များအကြား ချိတ်ဆက်ခြင်း၊ စိတ်ကြိုက်ပြုပြင်ခြင်းနှင့် စနစ်သန့်ရှင်းရေး အကြောင်းများကို ဖော်ပြသည်။
- **📦 အခန်းသစ် ၁ သင်ခန်းစာ** `docs/chapter-01-foundation/bring-your-own-app.md` — ရှိပြီးသား စီမံကိန်းတွင် azd ကို မည်သို့ ပေါင်းထည့်မည်ကို `azd init` ("လက်ရှိဒိုင်ယာရက်ထရီရှိ ကုဒ်ကို အသုံးပြုပါ") ဖြင့်ရှင်းပြခြင်း၊ `azure.yaml` နှင့် `infra/`, `azd infra generate`, host ရှာဖွေရေးနှင့် `azd up` ဖြင့် တပ်ဆင်ခြင်းတို့ကို နားလည်စေရန်။
- **🌐 azd နှင့် Terraform** အပိုင်းကို `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` ဖိုင်အစု, လိုအပ်သော `AZURE_*` output များနှင့် `azd-env-name` tagging ကို ထည့်သွင်းပြီး၊ တူညီသော `azd up` / `azd down` workflow ကိုပါ ထည့်သွင်းခဲ့သည် (Terraform အထောက်အပံ့ကို ဖော်ပြခဲ့သော်လည်း Bicep သာ ပြသခဲ့သော အနေအထားကို ဖြည့်ဆည်းပေးသည်)
- **⚙️ GitHub Actions ကို အဆင့်လိုက် လမ်းညွှန်ချက်** ကို `docs/chapter-08-production/production-ai-practices.md` တွင် — GitHub repo မှ automated deploys အထိ: `azd pipeline config`, OIDC federated credentials (လျှို့ဝှက်ချက် မသိမ်းဆည်းထားသော), ဖန်တီးထားသော `azure-dev.yml`, နှင့် secrets-vs-variables လမ်းညွှန်ချက်များ
- **🪝 အစ Beginners များအတွက် "Hooks အသစ်လား?" မိတ်ဆက်ချက်** ကို `docs/chapter-04-infrastructure/deployment-guide.md` တွင် — hook ဆိုသည်မှာ 무엇인지, hook-stage အဟောင်းဇယား, အနည်းဆုံး ပထမ Hook, နှင့် `azd hooks run` ဖြင့် hook များကို လက်ရှိလည်ပတ်ခြင်း
- **✅ "သင်၏ Deploy ကို စစ်ဆေးပါ" စစ်ဆေးစာရင်း** ကို `docs/chapter-01-foundation/first-project.md` ၏ အဆင့် 5 တွင် ထည့်သွင်းခဲ့သည် — smoke test, health-endpoint စစ်ဆေးခြင်း, နှင့် တိကျသော အောင်မြင်မှုစံချိန်များ
- **🧩 အသစ်သော ကြိုတင်ကြည့်ရှုမှု အပိုဆောင်းဖွဲ့စည်းမှုများအတွက် ရှင်းလင်းချက်** `azure.ai.skills` နှင့် `azure.ai.connections` (၎င်းတို့မှာအဘယ်နည်းနှင့် ဘယ်အချိန်တွင် အသုံးပြုရမည်ကို) ကို `docs/chapter-08-production/production-ai-practices.md` မှာ

#### ပြောင်းလဲပါသည်
- **🧭 အခန်း 5 သင်ခန်းစာဇယား** ပြင်ဆင်ပြီး: `multi-agent-basics.md` သည် ယခု Lesson 1 ဖြစ်သည် (တစ်ခုတည်းသောလက်တွေ့ကျကျ သင်ခန်းစာဖြစ်သည်)၊ Lesson 2 သည် အခန်း 6 တွင်တည်ရှိပြီး Retail အခြေအနေသည် တစ်ချက်ကွန်မန့္အဖြစ်မဟုတ်ဘဲ စက်နည်းဗေဒ အပြ blueprint တစ်ခုဖြစ်ကြောင်း ရိုးသားစွာ မှတ်သားပေးထားသည်။
- **🧭 အခန်း 1 သင်ခန်းစာဇယား** တွင် ယခင် "မိမိ၏ ကိုယ်ပိုင်အက်ပလီကေးရှင်း ယူလာမည်" သင်ခန်းစာအသစ် (Lesson 4) ပါဝင်လာသည်။
- **🔗 ရှာဖွေသွားသော ခြေဝက်အောက်ပိုင်းများ** ပြင်ဆင်ပြီး: `first-project.md` သည် ယခု `bring-your-own-app.md` သို့ တိုက်ရိုက်လင့်ခ်ပေးထားသည်။

#### ပြင်ဆင်ပြီးသောအချက်များ
- **🧱 "ယူယူထားသော သို့သော် မရှိသေးသော" Terraform အကွာအဝေးကို ပိတ်ပြီး** — သင်တန်းက Terraform အထောက်အပံ့ကို ရှင်းပြခြင်းမပြုဘဲ ပြောဆိုထားသည်။
- **🔀 အခန်း 5 တွင် မမှန်ကန်သော လမ်းညွှန်ခွဲများကို ပြင်ဆင်ပြီး** ကျွန်ုပ်တို့အနေဖြင့် စပျစ်ထဲတွင် စုံလင်စွာ multi-agent လုပ်ဆောင်မှုရှိမှုကို ရည်ညွှန်းသော်လည်း ဖြေဆိုခြင်းမှာ architecture blueprint တစ်ခုသာရှိနေသည်။

#### သွပ်ဖွင့်ထားသော ဖိုင်များ
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

#### AZD 1.25.6 ဖြန့်ချိပါ၊ အပြည့်အစုံ Agent အသက်တာစဉ် Command များ & Aspire အမှတ်တံဆိပ်ပြောင်းခြင်း
**ဤဗားရှင်းသည် သင်ရိုးကို `azd` `1.25.6` (ဇွန် ၂၀၂၆) နှင့် `azure.ai.agents` `0.1.40-preview` အချိန်တိုးချဲ့မှု တို့နှင့် ပြန်လည်စစ်ဆေးပြီး၊ "အေးဂျင့်တစ်ခုကို အခြေခံဖွဲ့စည်းခြင်း" မှ အေးဂျင့်ဇီဝဇာတ်လမ်းအချိုးအကွေ့ (စမ်းသပ် → အကဲဖြတ် → အကောင်းဆုံးဖြစ်အောင် ပြင်ဆင် → စစ်ဆေး → ဖျက်ရန်) အထိ AI လမ်းညွှန်ချက်ကို တိုးချဲ့ထားပြီး၊ အသစ်ထည့်သွင်းထားသော `azure.ai.skills` နှင့် `azure.ai.connections` ကြိုကြည့်ချဲ့ထွင်မှုများကို ဖော်ပြထားပြီး၊ ".NET Aspire" မှ "Aspire" ထုတ်ကုန်ပြောင်းလဲမှုကို မှတ်သားထားသည်။**

#### ထည့်သွင်းသစ်
- **🔁 စာတမ်းများအတွင်း စတင်သူများနှင့် AI အင်ဂျင်နီယာများအတွက် အေးဂျင့်၏ ပိတ်သတ်ဘဝလမ်းကြောင်းအပြည့်အစုံလုံလောက်မှု**  
  - `docs/chapter-01-foundation/azd-basics.md` — အချိန်ဇယား (အခြေခံဖွဲ့စည်းခြင်း → စမ်းသပ် → တိုင်းတာ → တိုးတက်အောင်ပြုလုပ် → စစ်ဆေး → ရှင်းလင်း) ကို ချဲ့ထွင်ပြီး Extensions နှင့် AI Commands အပိုင်းထဲတွင် ထည့်သွင်းထားသည်  
  - `docs/chapter-08-production/production-ai-practices.md` — "အေးဂျင့်ပိတ်သတ်ဘဝကို စီမံခန့်ခွဲခြင်း" အပိုင်းအသစ်သည် `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, နှင့် `delete --force` များကို ဖုံးလွှမ်းသည်  
  - `resources/cheat-sheet.md` — AI Agent Commands ကို `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, နှင့် `delete --force` ဖြင့် ပြည့်စုံအောင် တိုးချဲ့ထားသည်  
- **🧩 အသစ်ထည့်သွင်းသော ကြိုကြည့်ချဲ့ထွင်မှုများ** မှာ `azure.ai.skills` (ပြန်လည်အသုံးပြုနိုင်သော အေးဂျင့်ကျွမ်းကျင်မှုများ) နှင့် `azure.ai.connections` (Foundry ဆက်သွယ်မှုများ) ကို extensions ဇယားနှင့် cheat sheet ထဲ ထည့်သွင်းထားသည်  
- **⏱️ တုံ့ပြန်ချိန် ညွှန်ကြားချက်** — `azd ai agent invoke` ဥပမာများသည် စုစုပေါင်းအချိန်နှင့် ပထမအောက်ခံဒေတာရောက်ချိန်ကို ထုတ်ပြသည်ဟု မှတ်သားထားသည်  
- **📌 ဗားရှင်း သင်္ကေတ** ကို root README တွင် ထည့်သွင်းကာ သင်ယူလိုသူများကို `azd version` နှင့် `azd upgrade` ဆီသို့ ဦးတည်ပေးသည်  

#### ပြောင်းလဲမှုများ  
- **✅ အတည်ပြုခြင်းအခြေခံတန်း အသစ်သတ်မှတ်** ကို `azd 1.23.12` (မတ် ၂၀၂၆) မှ `azd 1.25.6` (ဇွန် ၂၀၂၆) သို့ စာအုပ်တိုင်း READMEs နှင့် workshop စာရွက်စာတမ်းများတွင်ပြောင်းလဲထားသည်
- **🤖 အခန်း ၂ တိုးချဲ့ချက်မှတ်ချက်** ကို `azure.ai.agents` `0.1.18-preview` မှ `0.1.40-preview` သို့ အပ်ဒိတ်လုပ်ပြီးဖြစ်သည်
- **🧪 စမ်းသပ်ရန် ဓာတ်ခွဲခန်း ဥပမာ** (`azd version` output) ကို `1.25.6` သို့ အပ်ဒိတ်လုပ်ပြီးဖြစ်သည်
- **🧭 README "azd Today တွင် What's New"** ကို end-to-end agent lifecycle၊ AI extensions အသစ်များနှင့် quality-of-life ပြင်ဆင်ချက်အသစ်များကို အလင်းပေးရန် ပြန်လည်သစ်သည့်အခြေအနေ (`azd init` idempotency, `azd auth login` stale-token အင်းထွက်, `azd tool` ပထမဆုံး run prompt)
- **📖 Chapter 2 agents.md (Option 4)** သည် သင်ယူသူများအား post-deploy lifecycle commands သို့ ဆိုင်းငံ့မထားဘဲ ဦးတည်စေသည် `azd up`

#### ပြင်ဆင်ပြီး
- **🏷️ ထုတ်ကုန်အမည်ဆိုင်းငံ့ချက်** — Aspire ပြင်ဆင်မှုမှတ်ချက်တစ်ခု ထည့်သွင်းထားသည် (".NET Aspire" သည် ယခု "Aspire"သာဖြစ်သည်); azd ၏ Aspire ထောက်ခံမှုမပြောင်းလဲပါ
- **🔎 Live release အတည်ပြုခြင်း** ကို Azure Developer CLI ထုတ်လွှင့်ချက် feed ဖြင့် အတည်ပြုသည်: stable CLI `1.25.6` (2026-06-12) နှင့် `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### ဖိုင်များ ပြင်ဆင်ထားသော
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

#### စတင်သူများ အတည်ပြုပြဋ္ဌာန်းချက်၊ ပတ်သက်မှုစစ်ဆေးခြင်းနှင့် အဆုံးသတ် AZD အမိန့်သန့်ရှင်းမှု
**ဤ ဗားရှင်းသည် AZD 1.23 အတည်ပြုပြဋ္ဌာန်းချက်စစ်ဆေးမှုကို ဆက်လက်၍ စတင်သူများအတွက် စာတမ်းများအား လေ့လာသုံးသပ်ခြင်းဖြစ်သည်။ ၎င်းသည် AZD-ပထမဆုံး အတည်ပြုမှု လမ်းညွှန်များကို ရှင်းလင်းပြသပေးပြီး၊ ဒေသ့စနစ် စစ်ဆေးစက်ရုပ်များ ထည့်သွင်းပေး၍၊ အဓိကအမိန့်များကို တိုက်ရိုက် AZD CLI တွင် စစ်ဆေးပြီး၊ ယခင်အင်္ဂလိပ်ဘာသာဖြင့်ချန်လာခံ ရေးသားချက်များကို ဖျက်ပစ်ပေးထားသည်။**

#### ထပ်မံထည့်သွင်းထားသည်
- **🧪 စတင်သူများ စနစ်စစ်ဆေးစက်ရုပ်များ** ကို `validate-setup.ps1` နှင့် `validate-setup.sh` ဖြင့် ထည့်သွင်းထားပြီး သင်ကြားသူများသည် အခန်း ၁ စတင်ရန်မတိုင်မီ လိုအပ်သောကိရိယာများကို အတည်ပြုနိုင်သည်
- **✅ မူလစက်တင် စနစ်စစ်ဆေးခြင်းအဆင့်များ** ကို root README နှင့် အခန်း ၁ README တွင် ထည့်သွင်းထားတာဖြစ်ပြီး မရှိဆုံးစာရင်းများသည် `azd up` မတိုင်မီ ဖမ်းဆီးနိုင်သည်

#### ပြောင်းလဲထားသည်
- **🔐 စတင်သူ အတည်ပြုမှု လမ်းညွှန်ချက်များ** တွင် AZD ဝါနယ်လမ်းကြောင်းအနေဖြင့် `azd auth login` ကို အဓိကလမ်းကြောင်းအဖြစ် တည်ဆောက်ထားပြီး Azure CLI အမိန့်များကို တိုက်ရိုက် အသုံးပြုခြင်းမရှိပါက `az login` ကို ရွေးချယ်စရာ အဖြစ် အသိပေးထားသည်
- **📚 အခန်း ၁ စတင်ခြင်း လမ်းကြောင်း** တွင် သင်ကြားသူများကို ဒေသတွင်းစနစ်ကို စတင်တပ်ဆင်ခြင်း၊ အတည်ပြုခြင်းနှင့် ပထမဆုံး ထုတ်လုပ်ခြင်း မလုပ်မီ စစ်ဆေးရန်အညွှန်းပြသထားသည်
- **🛠️ စစ်ဆေးသူ စကားပုံ** တွင် AZD သီးသန့် စတင်သူလမ်းကြောင်းအတွက် တားမြစ်ထားသောလိုအပ်ချက်များနှင့် ရွေးချယ်စရာ Azure CLI သတိပေးချက်များကို သေချာခွဲခြားပြထားသည်
- **📖 ဖွဲ့စည်းမှု၊ ပြဿနာဖြေရှင်းနည်းနှင့် နမူနာစာတမ်းများ** သည် လိုအပ်သော AZD အတည်ပြုမှုနှင့် စိတ်ကြိုက် Azure CLI စနစ်ဝင်မှုတို့ကို ယခင်က နိုင်ငံရေးမပါဘဲ ပေါင်းစပ်ဖော်ပြထားသောနေရာများတွင် ခွဲခြားပြသပေးသည်

#### ပြင်ဆင်ပြီးသွားပြီ
- **📋 ကျန်ရှိသော အင်္ဂလိပ်ဘာသာအခြေခံ command ရင်းမြစ်ကို လက်ရှိ AZD ဖောင်များသို့ အပ်ဒိတ်လုပ်ပြီး** cheat sheet တွင် `azd config show` နှင့် Azure Portal မျှဝေမှုလမ်းညွှန်လိုသောနေရာတွင် `azd monitor --overview` ကဲ့သို့ပါဝင်သည်
- **🧭 အဆင်သင့်များအတွက် ပထမပိုင်း စာတမ်းများ** တွင် အဘယ့် template နှင့် Azure resource များအားလုံးတွင် အမှားမရှိခြင်း သို့မဟုတ် နောက်ပြန်ဆုတ်ခြင်း အာမခံချက်မရှိကြောင်း အသေးစိတ်ဖော်ပြသည်
- **🔎 Live CLI အတည်ပြုချက်** သည် လက်ရှိတွင် `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, နှင့် `azd down --force --purge` ကို ထောက်ခံမှုရှိကြောင်း သေချာပြီ

#### ဖိုင်များ အပ်ဒိတ်လုပ်ပြီး
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

#### AZD 1.23.12 အတည်ပြုခြင်း၊ ကုန်ကြမ်းသုံးပတ်ဝန်းကျင် ဖြန့်ချိမှု နှင့် AI မော်ဒယ် ထပ်မံ လန်းဆန်းအောင် ပြုလုပ်ခြင်း
**ဤဗားရှင်းသည် `azd` `1.23.12` ကို အခြေခံ၍ စာတမ်းအတည်ပြုခြင်းလုပ်ငန်းများကို လုပ်ဆောင်ပြီး၊ ယခင်က ထွက်ရှိပြီးသား AZD command နမူနာများကို အပ်ဒိတ်လုပ်ပေး၊ AI မော်ဒယ်လမ်းညွှန်မှုများအား လက်ရှိပုံသတ်ထားသည့်ပုံစံများအတိုင်း ပြင်ဆင်ပေး၍ GitHub Codespaces ထက်သာ ရှိသော dev container များနှင့် ဒေသခံ clone များကို လည်း workshop လမ်းညွှန်မှုများတွင် ထည့်သွင်းပါသည်။**

#### ထည့်သွင်းပြီး
- **✅ အခြေခံပိုင်းများနှင့် workshop စာတမ်းများတွင် စစ်ဆေးမှု မှတ်ချက်များ** များသို့လည်း အသစ် သို့ဟောပြောသူများအသုံးပြုနိုင်ရန် AZD ပုံစံအသစ် သို့မဟုတ် ရှေးဟောင်း CLI build များသုံးသူများအတွက် ဖြေရှင်းချက်ဖြစ်စေ
- **⏱️ အချိန်မီ မဟာဗျူဟာ AI အက်ပ်ဖြန့်ချိမှုများအတွက် timeout လမ်းညွှန်ချက်များ** `azd deploy --timeout 1800` အသုံးပြုမှုအတွက်
- **🔎 AI workflow စာတမ်းများတွင် extension စစ်ဆေးခြင်းအဆင့်များ** `azd extension show azure.ai.agents` ဖြင့်
- **🌐 Workshop ပတ်ဝန်းကျင် အပိုင်း** GitHub Codespaces, dev container များနှင့် ဒေသခံ clone များအပါအဝင် MkDocs ဖြင့် လွန်ကျူးအုပ်စုအစီအစဉ်အပိုင်း

#### ပြောင်းလဲပြီး
- **📚 အခန်းနောက်ခံ README များ** သည် အုတ်မြစ်၊ ဖွဲ့စည်းမှု၊ အုတ်မြစ်အဆောက်အဦး၊ đa-အေဂျင့်၊ ကြိုတင်ဖြန့်ချိမှု၊ ပြဿနာဩဇာကာကွယ်ရေးနှင့် ထုတ်လုပ်မှု အပိုင်းများတွင် `azd 1.23.12` ဖြင့် အတည်ပြုချက် ဖော်ပြမှုကို ချဉ်းကပ်မှုတစ်ခုအနေဖြင့် ယုံကြည်စိတ်ချစွာ မှတ်သားသည်
- **🛠️ AZD command ရင်းမြစ်များ** လက်ရှိပုံစံဖြင့် စာတမ်းများအတွင်း အပ်ဒိတ်လုပ်ထားသည်။
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` သို့မဟုတ် `azd env get-value(s)` အချို့အခြေအနေများအရ ပြောင်းလဲနိုင်သည်
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` Application Insights ကြည့်ရှုချက် မြင်သာရေးအတွက်
- **🧪 Provision preview နမူနာများ** ယနေ့အခါ `azd provision --preview` နှင့် `azd provision --preview -e production` ကဲ့သို့ လက်ခံရန် လွယ်ကူ၍ မျှတသည့် အသုံးပြုပုံများအသုံးပြု
- **🧭 Workshop ဖြတ်သန်းလမ်းညွှန်မှု** သည် Codespaces, dev container သို့ ဒေသခံ clone တစ်ခုခုတွင် လုပ်ဆောင်နိုင်ရန်အတွက် ပြုပြင်ထိန်းသိမ်းပြီး Codespaces တစ်ခုချင်းစီကိုသာ မျှော်လင့် ထားခြင်း မဟုတ်ဘဲ အသုံးပြုသူများအတွက် အရားပြည့်စေသည်
- **🔐 အတည်ပြုခြင်း ညွှန်ကြားချက်** ကို AZD အလုပ်စဉ်များအတွက် အကြိုက်ဆုံးဖြစ်သော `azd auth login` သို့ပြောင်းလဲပြီး Azure CLI ကမ္မဏဍ်တွေကို တိုက်ရိုက်အသုံးပြုတဲ့အခါမှာတော့ `az login` ကို ရွေးချယ်စရာအဖြစ်ထားသည်။

#### ပြင်ဆင်ပြီး
- **🪟 Windows တပ်ဆင်ရေးကမ်းလှမ်းချက်များ** ကို installation guide တွင်လက်ရှိ `winget` package casing နဲ့ သေချာညီမှီစေခဲ့သည်။
- **🐧 Linux တပ်ဆင်ရေးညွှန်ကြားချက်များ** မှားယွင်းထားသော distro-specific `azd` package manager အညွှန်းများကို ရှောင်ရှားပြီး ထိုက်သင့်သော release assets ဆီကို ညွှန်ပြခဲ့သည်။
- **📦 AI မော်ဒယ် နမူနာများ** ကို `gpt-35-turbo` နှင့် `text-embedding-ada-002` ကဲ့သို့အဟောင်းတွေမှ ယခုကဲ့သို့ `gpt-4.1-mini`, `gpt-4.1`, နှင့် `text-embedding-3-large` တို့အထိ ပြန်လည်မွမ်းမံခဲ့သည်။
- **📋 Deployment နှင့် diagnostics ဇယားများ** သည် လက်ရှိ ပတ်ဝန်းကျင်နှင့် အခြေအနေကမ္မဏဍ်များကို logs, scripts နှင့် troubleshooting လုပ်ငန်းစဉ်များတွင်မှန်ကန်စွာ သုံးရေးသားခဲ့သည်။
- **⚙️ GitHub Actions ညွှန်ကြားချက်များ** ကို `Azure/setup-azd@v1.0.0` မှ `Azure/setup-azd@v2` သို့ ပြောင်းလဲခဲ့သည်။
- **🤖 MCP/Copilot ခွင့်ပြုချက် ညွှန်ကြားချက်များ** ကို `azd mcp consent` မှ `azd copilot consent list` သို့ ပြန်လည်အသစ်ပြုပြင်ခဲ့သည်။

#### တိုးတက်မှုများ
- **🧠 AI ဘာသာရပ် ညွှန်ကြားချက်များ** သည် preview-sensitive `azd ai` အပြုအမှု, tenant-specific login, လက်ရှိ extension သုံးစွဲမှုနှင့် မော်ဒယ်တပ်ဆင်ရေးအကြံပြုချက်များကို ပိုမိုပေါ်လွင်စေနိုင်သည်။
- **🧪 လက်တွေ့ သင်တန်းညွှန်ကြားချက်များ** တွင် ပိုမိုရွေးချယ်ပြီး တိကျတဲ့ version နမူနာများနှင့် ပိုမိုရှင်းလင်းသော ပတ်ဝန်းကျင်ပြင်ဆင်မှု ဘာသာစကားကို အသုံးပြုသည်။
- **📈 ထုတ်လုပ်မှုနှင့် ပြဿနာဖြေရှင်းစာရွက်များ** ကို လက်ရှိ မော်နီတာလုပ်ငန်းစဉ်, fallback မော်ဒယ်, နှင့် ကုန်ကျစရိတ်အဆင့်နမူနာများနှင့် ပိုမိုညီညွတ်စေသည်။

#### ဖိုင်များ အပ်ဒိတ်များ
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

#### AZD AI CLI ကမ္မဏဍ်များ၊ အကြောင်းအရာ အတည်ပြုခြင်းနှင့် ပုံစံချဲ့ထွင်မှု
**ဤဗားရှင်းတွင် `azd ai`, `azd extension`, နှင့် `azd mcp` ကမ္မဏဍ်များအား AI ဆိုင်ရာ ချုပ်ပိုင်းများအားလုံးတွင် ထည့်သွင်းပြီး agents.md အတွင်း ဖျက်သိမ်းသွားသောလင့်ခ်များနှင့် သက်တမ်းကုန်ကုဒ်များကို ပြုပြင်ထားသည်၊ cheat sheet ကို ပြင်ဆင်ထားပြီး Example Templates အပိုင်းကိုလည်း အတည်ပြုထားသည့် ဖော်ပြချက်များနှင့် အသစ် Azure AI AZD ပုံစံများဖြင့် ပြင်ဆင်ထားသည်။**

#### ထပ်ဆောင်းများ
- **🤖 AZD AI CLI ကမ္မဏဍ်များ** ကို ၇ ဖိုင်တွင်တိုးချဲ့ထားသည် (ယခင်က အခန်း ၈ မှသာ ရှိသည်)။
  - `docs/chapter-01-foundation/azd-basics.md` — "Extensions နှင့် AI Commands" အသစ်သော အပိုင်းသည် `azd extension`, `azd ai agent init`, နှင့် `azd mcp` ကို မိတ်ဆက်သည်။
  - `docs/chapter-02-ai-development/agents.md` — ရွေးချယ်မှု ၄: `azd ai agent init` နှင့် နှိုင်းယှဉ်မှုဇယား (အချိန်ဇယား ဆန့်နွက်မှုနှင့် manifest နည်းလမ်း)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" နှင့် "Agent-First Deployment" ပြုပြင်ပိုင်းများ
  - `docs/chapter-05-multi-agent/README.md` — အမြန်စတင်မှုတွင် template နှင့် manifest အခြေပြု တပ်ဆင် routes နှစ်မျိုးကို ပြသသည်
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy ဆက်စပ်ပိုင်းတွင် ယခု `azd ai agent init` ရွေးချယ်မှုပါဝင်သည်
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" ပြုပြင်ပိုင်း
  - `resources/cheat-sheet.md` — အသစ်သော "AI & Extensions Commands" အပိုင်း၊ `azd extension`, `azd ai agent init`, `azd mcp`, နှင့် `azd infra generate` ပါဝင်သည်
- **📦 AZD AI ဥပမာ template အသစ်များ** ကို `microsoft-foundry-integration.md` တွင်ပါရှိသည်-
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, နှင့် အသံစကားပြောခြင်း ပံ့ပိုးမှုဖြင့် .NET RAG စကားပြော
  - **azure-search-openai-demo-java** — Langchain4J အသုံးပြုသော Java RAG စကားပြော၊ ACA/AKS တပ်ဆင်မှုရွေးချယ်စရာများဖြင့်
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, နှင့် Prompty ကို အသုံးပြုသော အေးဂျင့်အများအတွက် ဖန်တီးရေးဆရာ အက်ပ်
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB သုံးပြီး Ollama ဒေသခံဖွံ့ဖြိုးရေး ပံ့ပိုးမှုပါရှိသည့် Serverless RAG
  - **chat-with-your-data-solution-accelerator** — စီးပွားရေး RAG အေးခ််စီလေးတာ၊ အုပ်ချုပ်မှု ပေါ်တယ်၊ Teams ပေါင်းစပ်မှု၊ နှင့် PostgreSQL/Cosmos DB ရွေးချယ်စရာများ ပါရှိသည်
  - **azure-ai-travel-agents** — .NET, Python, Java, နှင့် TypeScript တွင် ဆာဗာများနှင့် အများ Agents MCP စီမံခန့်ခွဲမှု ဥပမာ App
  - **azd-ai-starter** — အနည်းဆုံး Azure AI အခြေခံအဆောက်အအုံ Bicep စတားတာ တမ်းပလိတ်
  - **🔗 Awesome AZD AI Gallery link** — ကိုးကားချက်အနေဖြင့် [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (အပို templates 80+)

#### ပြင်ဆင်ပြီး
- **🔗 agents.md navigation**: ယခင်/နောက်တစ်ခုလင့်ခ်များသည် အခန်း ၂ README သင်ခန်းစာစဉ်နှင့် ကိုက်ညီသည် (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ပြတ်သားသော လင့်ခ်များ**: `production-ai-practices.md` ကို `../chapter-08-production/production-ai-practices.md` ဖြင့် ပြင်ဆင်ပြီး (၃ ကြိမ်)
- **📦 agents.md အဟောင်းကုဒ်**: `opencensus` ကို `azure-monitor-opentelemetry` နှင့် OpenTelemetry SDK ဖြင့် အစားထိုးခဲ့သည်
- **🐛 agents.md မမှန်ကန်သော API**: `max_tokens` ကို `create_agent()` မှ `create_run()` သို့ `max_completion_tokens` အဖြစ် ရွှေ့လိုက်သည်
- **🔢 agents.md token counting**: ခန့်မှန်းချက် မကြောက်လောက်တဲ့ `len//4` အစား `tiktoken.encoding_for_model()` ဖြင့် အစားထိုး
- **azure-search-openai-demo**: စက်မှုဝန်ဆောင်မှုများကို "Cognitive Search + App Service" မှ "Azure AI Search + Azure Container Apps" သို့ ပြင်ဆင်သည် (default host ကို 2024 အောက်တိုဘာတွင် ပြောင်းသည်)
- **contoso-chat**: ဖော်ပြချက်ကို Azure AI Foundry + Prompty ကို ကိုးကား၍ update ပြုလုပ်၊ အမှန်တကယ် repo ၏ ခေါင်းစဉ်နှင့် နည်းပညာ stack နှင့် ကိုက်ညီစေရန်

#### ဖျက်ခဲ့သည်
- **ai-document-processing**: မလည်ပတ်သော template ကို ဖျက်သိမ်း (repo ကို AZD template အနေနှင့် public မရရှိနိုင်ခြင်း)

#### တိုးတက်မွမ်းမံခဲ့သည်
- **📝 agents.md exercises**: လေ့ကျင့်ခန်း 1 တွင် မျှော်လင့် output နှင့် `azd monitor` အဆင့်ပြသ; လေ့ကျင့်ခန်း 2 တွင် အပြည့်အစုံ `FunctionTool` မှတ်ပုံတင်ကုဒ် ပါဝင်; လေ့ကျင့်ခန်း 3 တွင် မပြတ်သားသည့် လမ်းညွှန်မှုကို အတိအကျ `prepdocs.py` command များဖြင့် အစားထိုး
- **📚 agents.md resources**: ယခုနေ့မကာ AI Agent Service စာရွက်စာတမ်းများနှင့် quickstart ကို update ပြုလုပ်
- **📋 agents.md Next Steps table**: အခန်းအားလုံးအတွက် AI Workshop Lab link ထည့်သွင်း

#### ဖိုင်များကို update ပြုလုပ်
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### သင်ခန်းစာ လမ်းညွှန်မှု တိုးတတ်မှု
**ဤဗားရှင်းသည် README.md အခန်းများသို့ လမ်းညွှန်မှုကို တိုးတတ်ကောင်းမွန်သော ဇယားပုံစံဖြင့် တိုးမြှင့်ထားသည်။**

#### ပြောင်းလဲခဲ့သည်
- **သင်ခန်းစာ မြေပုံ ဇယား**: တိုက်ရိုက် သင်ခန်းစာ link များ၊ သင်ကြားချိန် ခန့်မှန်းချက်များနှင့် စိန်ခေါ်မှုအဆင့်များနှင့် တိုးမြှင့်
- **ဖိုလ်ဒါ စင်ကြယ်ရေး**: ဇယားတွင် ပါဝင်သည့် အသုံးမရှိအတဲ့ ဟောင်းရေကူးဖိုလ်ဒါများ ဖယ်ရှား (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **လင့်ခ် များ၏ မှန်ကန်မှု စစ်ဆေးခြင်း**: သင်ခန်းစာ မြေပုံ ဇယားတွင် 21+ အတွင်းပိုင်း လင့်ခ်အားလုံး တူညီစစ်ဆေး

### [v3.16.0] - 2026-02-05

#### ပစ္စည်း အမည်များ ပြင်ဆင်မှု
**ဤဗားရှင်းတွင် Microsoft ၏ လက်ရှိ brand အမည်များသို့ ပြောင်းလဲခြင်းဖြစ်သည်။**

#### ပြောင်းလဲခဲ့သည်
- **Microsoft Foundry → Microsoft Foundry**: ဘာသာပြန်မဟုတ်သော ဖိုင်များတွင် အားလုံးကို update ပြုလုပ်
- **Azure AI Agent Service → Foundry Agents**: ဝန်ဆောင်မှု အမည် ယခု brand အမည်သို့ ပြောင်းလဲသည်

#### ဖိုင်များ update ပြုလုပ်
- `README.md` - မူလ သင်ခန်းစာ စတင် စာမျက်နှာ
- `changelog.md` - ဗားရှင်း အတိတ်
- `course-outline.md` - သင်ခန်းစာ ဖွဲ့စည်းပုံ
- `docs/chapter-02-ai-development/agents.md` - AI အေးဂျင့် များ လမ်းညွှန်စာအုပ်
- `examples/README.md` - ဥပမာ စာရွက်စာတမ်း
- `workshop/README.md` - ဝေါ့ရှော့ ပေ့ချ်တင် စာမျက်နှာ
- `workshop/docs/index.md` - ဝေါ့ရှော့ စာရင်း
- `workshop/docs/instructions/*.md` - ဝေါ့ရှော့ သင်ကြားမှုဖိုင် အားလုံး

---

### [v3.15.0] - 2026-02-05

#### အကြီးစား repository ပြုပြင်ပြောင်းလဲမှု: အခန်းအလိုက် ဖိုလ်ဒါ အမည်များ
**ဤဗားရှင်းတွင် စာရွက်စာတမ်းများကို ပိုမိုရှင်းလင်းစေသော အခန်းဖိုလ်ဒါများ သတ်မှတ်ထားသည်။**

#### ဖိုလ်ဒါ အမည် ပြောင်းလဲမှု
မူလ ဖိုလ်ဒါများကို အခန်းနံပါတ်ဖြင့် အစားထိုးထားသည်။ 
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- အသစ်ဖြည့်စွက်: `docs/chapter-05-multi-agent/`

#### ဖိုင် မိုက်ဂရိတ်များ
| ဖိုင်နာမည် | မူလနေရာ | သို့ပြောင်းရန် |
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
| pre-deployment အားလုံး ဖိုင်များ | pre-deployment/ | chapter-06-pre-deployment/ |
| troubleshooting အားလုံး ဖိုင်များ | troubleshooting/ | chapter-07-troubleshooting/ |

#### ထည့်သွင်းခဲ့သည်
- **📚 အခန်းများ၏ README ဖိုင်များ**: README.md ကို အခန်းဖိုလ်ဒါတွင်း ဖန်တီးပြီး အောက်ပါအတိုင်း ဖြည့်စွက်
  - သင်ယူရမည့် ရည်ရွယ်ချက်များနှင့် သင်ကြားချိန်
  - သင်ခန်းစာဇယားနှင့် ဖော်ပြချက်များ
  - လျင်မြန်စတင်နိုင်ရန် command များ
  - အခြားအခန်းများသို့ လမ်းညွှန်မှု

#### ပြောင်းလဲခဲ့သည်
- **🔗 အတွင်းပိုင်း လင့်ခ်အားလုံး ပြုပြင်မှုပြုလုပ်**: 78+ လမ်းကြောင်းအားလုံးကို စာရွက်စာတမ်းဖိုင်များတွင် ပြင်ဆင်ထားသည်
- **🗺️ မူလ README.md**: သင်ခန်းစာ မြေပုံကို အသစ်အခန်းဖွဲ့စည်းပုံနှင့် ပြင်ဆင်
- **📝 examples/README.md**: အခန်းဖိုလ်ဒါများကို လမ်းညွှန်မှုများ ပြောင်းလဲမွမ်းမံ

#### ဖျက်သိမ်းခဲ့သည်
- ဟောင်းသား ဖိုလ်ဒါ ဖွဲ့စည်းပုံများ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### repository ပြုပြင်ပြောင်းလဲမှု: အခန်း လမ်းညွှန် README ဖိုင် ထည့်သွင်းမှု
**ဤဗားရှင်းသစ်တွင် အခန်းလမ်းညွှန် README ဖိုင်များ ထည့်သွင်းထားပြီး v3.15.0 မှ နောက်ကျပြီးဖြစ်သည်။**

---

### [v3.13.0] - 2026-02-05

#### AI အေးဂျင့်လမ်းညွှန် အသစ်
**ဤဗားရှင်းတွင် Azure Developer CLI သုံးပြီး AI အေးဂျင့်များ ထည့်သွင်းမှု လမ်းညွှန်စာအုပ် တစ်ခု ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🤖 docs/microsoft-foundry/agents.md**: အားလုံး ဖုံးလွှမ်းသော လမ်းညွှန်စာအုပ်
  - AI အေးဂျင့်ဆိုတာဘာလဲ၊ chatbot များနှင့် မတူဘဲ ဖြစ်ပုံ
  - ဗဟိုသုံး agent templates သုံးခု (Foundry Agents, Prompty, RAG)
  - agent ပုံစံများ (single agent, RAG, multi-agent)
  - ကိရိယာ စနစ်ပြုပြင်ခြင်းနှင့် ထပ်တိုးခြင်း
  - မိုနတာစနစ်နှင့် အတိုင်းအတာကောက်ယူခြင်း
  - ကုန်ကျစရိတ် စဉ်းစားမှုများနှင့် ပြုပြင်ခြင်း
  - လူကြိုက်များသော ပြဿနာများကို ဖြေရှင်းခြင်း
  - လက်တွေ့ စမ်းသပ်လေ့ကျင့်ခန်း သုံးခု၊ တိုးတက်မှု စံချိန်များနှင့်

#### စာရွက်စာတမ်း ဖွဲ့စည်းမှု
- **နိဒါန်း**: စတင်သင်ယူသူများအတွက် အေးဂျင့် အကြောင်း
- **လျင်မြန်စတင်ခြင်း**: `azd init --template get-started-with-ai-agents` ဖြင့် အေးဂျင့်ထည့်သွင်းခြင်း
- **ပုံစံများ**: အေးဂျင့်ပုံစံများ ဗေဒါဓာတ်ပုံများ
- **ချိန်ညှိမှု**: ကိရိယာ ပတ်ဝန်းကျင် နှင့် စည်းမျဉ်းများ
- **မိုနတာစနစ်**: Application Insights ထည့်သွင်းခြင်း
- **လေ့ကျင့်ခန်းများ**: အဆင့်တက် လက်တွေ့ သင်ကြားမှု (20-45 မိနစ်)

---

### [v3.12.0] - 2026-02-05

#### DevContainer ပတ်ဝန်းကျင် update
**ဤဗားရှင်းသည် AZD သင်ယူမှု အတွေ့အကြုံအတွက် နောက်ဆုံးပေါ် ကိရိယာများနှင့် ပိုမိုကောင်းမွန်သော defaults ဖြင့် ဖွံ့ဖြိုးမှု ကွန်တိန်နာချ် ရည်ရွယ်ချက်ကို update ပြုလုပ်ထားသည်။**

#### ပြောင်းလဲခဲ့သည်
- **🐳 အခြေခံချ်တ်ရုပ်ပုံ**: `python:3.12-bullseye` မှ `python:3.12-bookworm` သို့ update ပြုလုပ် (Debian stable နောက်ဆုံးက)
- **📛 ကွန်တိန်နာ အမည်**: "Python 3" မှ "AZD for Beginners" သို့ အနားလေးရှင်းပြ

#### ထည့်သွင်းခဲ့သည်
- **🔧 Dev Container အသစ်သော လက္ခဏာများ**:
  - `azure-cli` ဖြင့် Bicep ထောက်ပံ့မှု ဖွင့်ထားပြီး
  - `node:20` (AZD templates အတွက် LTS ဗားရှင်း)
  - `github-cli` အတွက် template စီမံခန့်ခွဲမှု
  - `docker-in-docker` အတွက် container app များ ထည့်သွင်းခြင်း

- **🔌 ပို့ခ ပို့ဆောင်ခြင်း**: ပုံမှန် ဖွံ့ဖြိုးမှုအတွက် port များ ကြိုတင်ချိန်ဆမှတ်ထားသည်
  - 8000 (MkDocs ကြိုတင်ကြည့်ရှုမှု)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 VS Code အနွယ်တိုင် အပိုထည့်သွင်းများ**:
  - `ms-python.vscode-pylance` - Python IntelliSense တိုးတက်ခဲြချက်နဲ့
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ဖေးလာ
  - `ms-azuretools.vscode-docker` - Docker ထောက်ပံ့မှု
  - `ms-azuretools.vscode-bicep` - Bicep ဘာသာစကား ထောက်ပံ့မှု
  - `ms-azure-devtools.azure-resource-groups` - Azure resource စီမံခန့်ခွဲမှု
  - `yzhang.markdown-all-in-one` - Markdown များ တည်းဖြတ်ခြင်း
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram ထောက်ပံ့မှု
  - `redhat.vscode-yaml` - YAML ထောက်ပံ့မှု (azure.yaml အတွက်)
  - `eamodio.gitlens` - Git ဗিজွယ်ရေး
  - `mhutchie.git-graph` - Git မှတ်တမ်း

- **⚙️ VS Code ဆက်တင်များ**: Python interpreter၊ ဖိုင် သိမ်းသိမ်းဖြင့် အလိုအလျောက် ဖော်မြူချက်၊ အနားတောင်ဖယ်ခြင်းကို အခြေခံ ဆက်တင် ထည့်သွင်း

- **📦 requirements-dev.txt ပြင်ဆင်မှု**:
  - MkDocs minify plugin ထည့်သွင်း
  - pre-commit ကုဒ်အရည်အသွေး သတ်မှတ်မှု ထည့်သွင်း
  - Azure SDK package များ (azure-identity, azure-mgmt-resource) ထည့်သွင်း

#### ပြုပြင်မွမ်းမံခဲ့သည်
- **Post-Create command**: ကွန်တိန်နာ စတင်ချိန် AZD နှင့် Azure CLI တပ်ဆင်မှုကို စစ်ဆေး

---

### [v3.11.0] - 2026-02-05

#### စတင်သင်ယူသူ များအတွက် README ပြုပြင်မှု
**ဤဗားရှင်းသည် README.md ကို စတင်သင်ယူသူများအတွက် ပိုမိုရိုးရှင်းသုံးစွဲနိုင်ရန် ပြုပြင်ပြီး AI ဖွံ့ဖြိုးသူများအတွက် အရေးကြီးသော အရင်းအနှီးများထည့်သွင်းထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🆚 Azure CLI နှင့် AZD နှိုင်းယှဉ်ချက်**: အသုံးပြုသင့်သော ကိရိယာကို ဥပမာများဖြင့် ရှင်းလင်းပြောကြား
- **🌟 အံ့သြစရာ AZD လင့်ခ်များ**: မူဗက်ဆေး template ပြတိုက်နှင့် ပံ့ပိုးမှု လင့်ခ်များ
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - အဆင်သင့် template 200+ ခု
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - အသင်းဝင် မူကြို
- **🎯 လျင်မြန်စတင်လမ်းညွှန်**: ရိုးရိုးရှင်းရှင်း ၃အဆင့် (တပ်ဆင် → ဝင်ရောက် → ထည့်သွင်း)
- **📊 အတွေ့အကြုံ အခြေပြု လမ်းညွှန်ဇယား**: ဖွံ့ဖြိုးသူ အတွေ့အကြုံအလိုက် နေရာ ရှာဖွေ

#### ပြောင်းလဲခဲ့သည်
- **README ဖွဲ့စည်းမှု**: ကြာရှိန်မြှင့်ရန် တိုးတက်စေသော သတင်းအချက်အလက် အစီအစဉ်
- **နိဒါန်း အစိတ်အပိုင်း**: အစပျိုးသူများအတွက် "`azd up`" ၏ မှန်ကန်သော သဘောတရား ပြန်လည်ရေးသား
- **ကူးယူထားသော အကြောင်းအရာ ဖယ်ရှားခြင်း**: ထပ်တူဖြစ်သော troubleshooting အပိုင်း ဖယ်ရှား
- **Troubleshooting command များ**: `azd logs` ကို သက်ဆိုင်ရာ `azd monitor --logs` ဖြင့် ပြင်ဆင်

#### ပြုပြင်မှု
- **🔐 အတည်ပြုခြင်း command များ**: cheat-sheet.md တွင် `azd auth login` နှင့် `azd auth logout` ထည့်သွင်း
- **မှားယွင်းသော command ကိုးကားချက်များ**: README troubleshooting အတွင်း အတည်မပြုသော `azd logs` များ ဖယ်ရှား

#### မှတ်ချက်များ
- **အတိုးအကျယ်**: မူလ README.md နှင့် resources/cheat-sheet.md တွင် ပြောင်းလဲမှုများ တက်ရှိ
- **အာရုံစိုက် အဖွဲ့**: AZD အသစ်လေ့လာသူ ပြုလုပ်သူများအတွက် အထူးတလည်လမ်းညွှန်ချက်များ

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command မှန်ကန်မှု ပြင်ဆင်မှု
**ဤဗားရှင်းတွင် စာရွက်စာတမ်းများအတွင်း မရှိသေးသော AZD command များအား မှန်ကန်စွာပြင်ဆင်ထားပြီး Azure Developer CLI မှန်ကန်သော စာသားအသုံးပြုထားသည်။**

#### ပြုပြင်ခဲ့သည်
- **🔧 မရှိသေးသော AZD Commands ဖယ်ရှားခြင်း**: မှားယွင်းသော command များအား စိစစ်၍ ပြင်ဆင်:
  - `azd logs` (မရှိပါ) → `azd monitor --logs` သို့မဟုတ် Azure CLI ကုဒ်များဖြင့် အစားထိုး
  - `azd service` subcommands (မရှိပါ) → `azd show` နှင့် Azure CLI သုံးပြီး အစားထိုး
  - `azd infra import/export/validate` (မရှိပါ) → ဖယ်ရှား သို့မဟုတ် မှန်ကန်သောနည်းလမ်းအသစ် စီစစ်
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (မရှိပါ) → ဖယ်ရှား
  - `azd provision --what-if/--rollback` flags (မရှိပါ) → `--preview` အသုံးပြုမှု ဖြင့် ပြင်ဆင်
  - `azd config validate` (မရှိပါ) → `azd config list` ဖြင့် အစားထိုး
  - `azd info`, `azd history`, `azd metrics` (မရှိပါ) → ဖယ်ရှား

- **📚 command အမှားပြင်ဆင်ပြီး ဖိုင်များ update**:
  - `resources/cheat-sheet.md`: command ကိုးကားချက် အကြီးစား ပြုပြင်
  - `docs/deployment/deployment-guide.md`: rollback နှင့် deployment အကြံပြုနည်း ပြင်ဆင်
  - `docs/troubleshooting/debugging.md`: log အစိတ်အပိုင်း ချက်တောက်ပြင်ဆင်
  - `docs/troubleshooting/common-issues.md`: troubleshooting command များ update
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD debugging အစိတ်အပိုင်း ပြင်ဆင်
  - `docs/getting-started/azd-basics.md`: တိကျသော ကြည့်ထောက်ရေး ကိရိယာများ ပြင်ချက်များ
  - `docs/getting-started/first-project.md`: ကြည့်ထောက်ရေးနှင့် ဒိုင်ဘာဂျင်နာင်း ဥပမာများ အသစ်ပြင်ဆင်မှုများ
  - `docs/getting-started/installation.md`: အကူအညီနှင့် ဗားရှင်း ဥပမာများ ပြင်ဆင်ခြင်း
  - `docs/pre-deployment/application-insights.md`: မှတ်တမ်း ကြည့်ရှုမှု ကိရိယာများ တိကျမှု ပြန်လည်ပြင်ဆင်ခြင်း
  - `docs/pre-deployment/coordination-patterns.md`: ဂျင်နာင်း ကိရိယာများ ပြင်ဆင်ခြင်း

- **📝 ဗားရှင်း ရည်ညွှန်းချက် အသစ်ပြင်ဆင်ခြင်း**: 
  - `docs/getting-started/installation.md`: အားဖြည့်ထားသော `1.5.0` ဗားရှင်းမှ အထူးသီးသန့် `1.x.x` သို့ပြောင်းလဲပြီး ထုတ်လွှတ်မှုလင့်ခ်ထည့်သွင်းခြင်း

#### ပြောင်းလဲမှုများ
- **နောက်ပြန်ဆုတ်ခွာ မဟာဗျူဟာများ**: Git-based နောက်ပြန်ဆုတ်ခွာ အသုံးပြုရန် စာမျက်နှာပြောင်းလဲခြင်း (AZD သည် မူလ နောက်ပြန်ဆုတ်ခွာအများပြု မပါရှိ)
- **မှတ်တမ်း ကြည့်ရှုခြင်း**: `azd logs` ကို `azd monitor --logs`, `azd monitor --live` နှင့် Azure CLI ကော်မန်းများဖြင့် အစားထိုးပြီး အသုံးပြုခြင်း
- **စွမ်းဆောင်ရည်ပိုင်း**: မရှိသော ပရလာလယ်/ချဲ့ထွင် တပ်ဆင်မှု အမှတ်အသားများ ပယ်ဖျက်ပြီး မှန်ကန်သော အစားထိုး ပေးခြင်း

#### နည်းပညာအသေးစိတ်
- **မှန်ကန်သည့် AZD ကော်မန်းများ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **မှန်ကန်သည့် azd monitor အမှတ်အသားများ**: `--live`, `--logs`, `--overview`
- **ဖယ်ရှားထားသော လုပ်ဆောင်ချက်များ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### မှတ်ချက်များ
- **အတည်ပြုခြင်း**: ကော်မန်းများအား Azure Developer CLI v1.23.x နှင့် အတည်ပြုပြီး

---

### [v3.9.0] - 2026-02-05

#### လက်တွေ့ကျကျဆောင်ရွက်မှုနှင့် စာတမ်းရုပ်ပြ အရည်အသွေး တိုးတက်စေခြင်း
**ဤဗားရှင်းသည် အပြန်အလှန်လုပ်ငန်းအစိတ်အပိုင်းများကို ပြီးစီးစေပြီး၊ ချိုးဖျက်နေသော စာတမ်းလင့်ခ်များအားလုံး ပြင်ဆင်ပေးကာ Microsoft AZD အသုံးပြုသည့် AI ဖန်တီးသူများအတွက် အကြောင်းအရာအရည်အသွေး တိုးတက်ကောင်းမွန်စေသည်။**

#### ထည့်သွင်းပြီး
- **📝 CONTRIBUTING.md**: ထည့်သွင်းသည့် လမ်းညွှန် စာတမ်းအသစ်
  - ပြဿနာအစီရင်ခံခြင်းနှင့် ပြောင်းလဲမှု အကြံပြုချက်များအတွက် ရိုးရှင်းသေချာသော အညွှန်းများ
  - အသစ်ထည့်သွင်းမည့် အကြောင်းအရာများအတွက် စာတမ်းစံသတ်မှတ်ချက်များ
  - ကုဒ်ဥပမာ လမ်းညွှန်ချက်များနှင့် commit ဆောင်ရွက်မှု သာမက စည်းကမ်းများ
  - လူမှုအသိုင်းအဝိုင်း ပါဝင်ဆောင်ရွက်မှု အချက်အလက်များ

#### ပြီးစီးပြီး
- **🎯 အလုပ်ရုံဆွေးနွေးပွဲ မော်ဂျူး ၇ (အဆုံးသတ်)**: အပြည့်အစုံ အလုပ်ရုံဆွေးနွေးမှု အဆုံးသတ် မော်ဂျူး
  - အလုပ်ရုံဆွေးနွေးမှု အောင်မြင်မှုများ အကျုံးဝင်မှု ကောက်ခေါ်ခြင်း
  - AZD, template များနှင့် Microsoft Foundry ကို ပါဝင်သော အခြေခံ အယူအဆများ ဆိုင်ရာ အပေါ်နေရာသတ်မှတ်ခြင်း
  - သင်ယူမှု ခရီးစဉ် နောက်ဆက်တွဲ အကြံပြုချက်များ
  - အလုပ်ရုံစမ်းစစ်မှု လေ့ကျင့်ခန်းများ အဆင့်အတန်း နှုန်းထားအပါအဝင်
  - လူမှုအသိုင်းအဝိုင်း တုံ့ပြန်ချက်နှင့် အထောက်အပံ့ လင့်ခ်များ

- **📚 အလုပ်ရုံဆွေးနွေးပွဲ မော်ဂျူး ၃ (ခွဲခြမ်းစိတ်ဖြာခြင်း)**: သင်ယူမှု ရည်ရွယ်ချက်များ အသစ် ပြင်ဆင်ခြင်း
  - GitHub Copilot နှင့် MCP servers ဖွင့်ခြင်း လမ်းညွှန်ချက်များ
  - AZD template ဖိုင်ဖွဲ့စည်းမှု ပုံစံများ လေ့လာ
  - Infrastructure-as-code (Bicep) ဗဟိုအစီအစဉ်
  - လက်တွေ့ လေ့ကျင့်ခန်း ညွှန်ကြားမှုများ

- **🔧 အလုပ်ရုံဆွေးနွေးပွဲ မော်ဂျူး ၆ (ပိတ်ပင်ခြင်း)**: ပြီးစီးခဲ့ပြီး
  - အရင်းအမြစ် သန့်ရှင်းခြင်း နှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု ရည်ရွယ်ချက်များ
  - `azd down` အသုံးပြုခြင်းဖြင့် အင်ဖရွာစထရပ်ချာ အလုံအလောက် ရှင်းလင်းခြင်း
  - soft-deleted cognitive services ပြန်လည်ရယူခြင်း လမ်းညွှန်ချက်များ
  - GitHub Copilot နှင့် Azure Portal အတွက် အပိုအတိုး စူးစမ်းမေးမြန်းမှုများ

#### ပြင်ဆင်မှုများ
- **🔗 ချိုးဖျက်နေသော လင့်ခ်များ ပြင်ဆင်ခြင်း**: ဝဘ်စာမျက်နှာတွင်း ၁၅ ကျော် ချိုးဖျက်နေသော လင့်ခ်များ နှစ်သက်ရာဖြင့် ပြန်လည်ပြုပြင်ခြင်း
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md လင့်ခ်ပုံမှန် ပြင်ဆင်ခြင်း
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md နှင့် production-ai-practices.md လင့်ခ်မှားများ ပြင်ဆင်ခြင်း
  - `docs/getting-started/first-project.md`: မရှိသည့် cicd-integration.md ကို deployment-guide.md ဖြင့် အစားထိုးခြင်း
  - `examples/retail-scenario.md`: FAQ နှင့် troubleshooting guide လင့်ခ်များ ပြင်ဆင်ခြင်း
  - `examples/container-app/microservices/README.md`: course home နှင့် deployment guide လင့်ခ်မှားများ ပြင်ဆင်ခြင်း
  - `resources/faq.md` နှင့် `resources/glossary.md`: AI အခန်းဆက် ဖော်ပြမှု အသစ်ပြင်ဆင်ခြင်း
  - `course-outline.md`: instructor guide နှင့် AI workshop lab ဖော်ပြချက်များပြင်ဆင်ခြင်း

- **📅 အလုပ်ရုံအခြေအနေ နှင့် ကြော်ငြာ**: "Under Construction" မှ "လုပ်ဆောင်နေဆဲ" စတိတ်သို့ ပြောင်းလဲပြီး ၂၀၂၆ ဖေဖော်ဝါရီနေ့စွဲ သတ်မှတ်ခြင်း

- **🔗 အလုပ်ရုံလမ်းညွှန်**: README.md တွင် လမ်းညွှန် လင့်ခ်များမှ lab-1-azd-basics ဖိုလ်ဒါ မရှိသည့် ပြဿနာ ပြင်ဆင်ခြင်း

#### ပြောင်းလဲမှုများ
- **အလုပ်ရုံတင်ပြချက်**: "under construction" သတိပေးချက် ဖယ်ရှားပြီး အလုပ်ရုံ ပြီးစီးပြီး အသုံးပြုရန် ပြင်ဆင်ထားခြင်း
- **လမ်းညွှန် တစ်ဆက်တည်းဖြစ်မှု**: အလုပ်ရုံ မော်ဂျူးများ အားလုံးတွင် proper inter-module လမ်းညွှန် ရှိခြင်း
- **သင်ယူမှုလမ်းညွှန် ရည်ညွှန်းချက်များ**: microsoft-foundry လမ်းညွှန် ထိန်းသိမ်းမှုကို မှန်ကန်စွာ ပြုပြင်ခြင်း

#### အတည်ပြုအောင် ပြုလုပ်မှု
- ✅ အင်္ဂလိပ်ဘာသာ စာတမ်းဖိုင်များအားလုံးတွင် အတွင်းလင့်ခ် များမှန်ကန်ခြင်း
- ✅ အလုပ်ရုံ မော်ဂျူး 0-7 ပြီးစီးပြီး သင်ယူမှု ရည်ရွယ်ချက်များပါရှိခြင်း
- ✅ အခန်းများနှင့် မော်ဂျူးများအကြား လမ်းညွှန် လုပ်ဆောင်မှုမှန်ကန်ခြင်း
- ✅ Microsoft AZD အသုံးပြုသည့် AI ဖန်တီးသူများအတွက် အကြောင်းအရာ သင့်တော်မှုရှိခြင်း
- ✅ စတင်သင်ယူသူ Friendly ဘာသာစကားနှင့် ဖွဲ့စည်းမှု များ ထိန်းသိမ်းထားခြင်း
- ✅ CONTRIBUTING.md တွင် လူမှုအသိုင်းအဝိုင်း စီမံမှုများအတွက် သေချာသော လမ်းညွှန်ချက် ပေးထားခြင်း

#### နည်းပညာဆိုင်ရာ အကောင်အထည်ဖော်မှု
- **လင့်ခ် အတည်ပြုမှု**: PowerShell script က automated အတွင်းလင့်ခ်အားလုံး အတည်ပြုခြင်း
- **အကြောင်းအရာ စစ်ဆေးခြင်း**: လက်တွေ့သင်ယူမှု ပြည့်စုံမှုနှင့် စတင်သူအတွက် သင့်တော်မှု ကို လက်ဖြင့် စစ်ဆေးခြင်း
- **လမ်းညွှန် စနစ်**: အခန်းနှင့် မော်ဂျူးများအတွက် တသန်းတည်းအလိုက် လမ်းညွှန်ပုံစံများ အသုံးပြုထားခြင်း

#### မှတ်ချက်များ
- **အကွာအဝေး**: အင်္ဂလိပ်စာတမ်းများတွင်သာ ပြောင်းလဲမှုများ ဖြစ်ပေါ်ထားခြင်း
- **ဘာသာပြန်မှုများ**: ဤဗားရှင်းတွင် ဘာသာပြန် ဖိုလ်ဒါများ မဖွဲ့ထားခြင်း (အလိုအလျောက် ဘာသာပြန်မှု မကြာမှီ Update လုပ်မည်)
- **အလုပ်ရုံ ကြာမြင့်ချိန်**: လက်တွေ့သင်ယူမှုအတွက် ၃-၄ နာရီ ပေးမည်ဖြစ်

---

### [v3.8.0] - 2025-11-19

#### တိုးတက်သော စာတမ်းဆိုင်ရာ: ကြည့်ထောက်ခြင်း၊ လုံခြုံရေးနှင့် မျိုးစုံအေဂျင့် ပုံစံများ
**ဤဗားရှင်းသည် Application Insights ပေါင်းစည်းမှု၊ အထောက်အထားဉပမာများနှင့် မျိုးစုံအေဂျင့် ညှိနှိုင်းမှုဆိုင်ရာ နည်းပညာများကို လေ့လာသင်ယူရန် A-အဆင့် သင်ခန်းစာများ ပါဝင်သည်။**

#### ထည့်သွင်းပြီး
- **📊 Application Insights ပေါင်းစည်းမှု သင်ခန်းစာ**: `docs/pre-deployment/application-insights.md` တွင်
  - AZD အခြေပြု တပ်ဆင်မှုဖြင့် အလိုအလျောက် ဖြန့်ချိခြင်း
  - Application Insights နှင့် Log Analytics အတွက် Bicep templates ပြည့်စုံ
  - စီစဉ်ထားသော Python application များ  ကိုယ်ပိုင် telemetry (1,200+ အတန်း)
  - AI/LLM ကြည့်ထောက် ပုံစံများ (Microsoft Foundry Models Token/စျေးနှုန်း တွက်ချက်မှု)
  - ၆ ခု Mermaid Diagram များ (ဝိဇ္ဇာတည်းဖြတ်ပုံ၊ ကွဲပြားသော ချိတ်ဆက်မှု၊ telemetry စီးဆင်းမှု)
  - ၃ ခု လက်တွေ့ လေ့ကျင့်ခြင်းများ (แจ้งเตือนများ၊ dashboards, AI ကြည့်ထောက်မှု)
  - Kusto ရှာဖွေနည်း ဥပမာများနှင့် ကုန်ကျစရိတ် အောင်မြင်စွာ စီမံခြင်း
  - တိုက်ရိုက် မီမက်ထရစ် သယ်ဆောင်ခြင်းနှင့် အချိန်နှင့် တပြေးညီ ဒိုင်ဗားဂျင်နာင်း
  - ၄၀-၅၀ မိနစ် သင်ယူချိန်နှင့် စက်ပစ္စည်း အသုံးပြု ချိန်ကြာမှု

- **🔐 အတည်ပြုမှုနှင့် လုံခြုံရေး သင်ခန်းစာ**: `docs/getting-started/authsecurity.md` တွင်
  - အတည်ပြုမှု မျိုးစုံ (connection strings, Key Vault, managed identity)
  - လုံခြုံစိတ်ချစေသော Bicep အင်ဖရွာစထရပ်ချာ ဆောက်လုပ်မှု
  - Node.js application code နှင့် Azure SDK ပေါင်းစည်းမှု
  - ၃ လုပ်ဆောင်ချက် ပြည့်စုံမှု (managed identity ဖွင့်လှစ်ခြင်း၊ user-assigned identity, Key Vault rotation)
  - လုံခြုံရေး ကောင်းမွန်သော အကောင်းဆုံးအကြံပြုချက်များနှင့် RBAC စီမံချက်များ
  - ပြဿနာရှာဖွေရေးလမ်းညွှန်နှင့် ကုန်ကျစရိတ် သုံးသပ်ချက်
  - ပရိုဒက်ရှင်းအဆင်သင့် passwordless အတည်ပြုမှု ထုတ်ပေါ်မှုများ

- **🤖 မျိုးစုံအေဂျင့် ညှိနှိုင်း ပုံစံ သင်ခန်းစာ**: `docs/pre-deployment/coordination-patterns.md` တွင်
  - ညှိနှိုင်းမှု ပုံစံ ၅ မျိုး (အဆင့်လိုက်၊ ပရလာလယ်၊ အဆင့်ဦး၊ ဖြစ်ရပ်အခြေပြု၊ သဘောတူညီမှု)
  - ပြည့်စုံသော စာချုပ်အမျိုးအစား ဝန်ဆောင်မှု ဆောင်ရွက်မှု (Python/Flask, 1,500+ အတန်း)
  - အထူးအေဂျင့် ၃ မျိုး (သုတေသန၊ စာရေးသူ၊ ပြုပြင်သူ)
  - message queueing အတွက် Service Bus ပေါင်းစည်းမှု
  - စနစ် ဖြန့်ချိမှု အတွက် Cosmos DB အသုံးပြုမှု
  - အေဂျင့် ဆက်သွယ်မှု ဖော်ပြသည့် ၆ ခု Mermaid Diagram များ
  - ၃ လေ့ကျင့်မှု အဆင့်မြှင့် (Timeout ကိုင်တွယ်ခြင်း၊ ထပ်မံကြိုးစားခြင်း၊ လီး၏အလုပ်မလုပ်ခြင်း)
  - ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာမှု ($240-565/လ) နှင့် စနစ်တကျ စီမံခန့်ခွဲမှု
  - ကြည့်ထောက်မှုအတွက် Application Insights ပေါင်းစည်းမှု

#### တိုးတက်မှုများ
- **တပ်ဆင်မှု အခန်း**: ကြည့်ထောက်မှုနှင့် ညှိနှိုင်းပုံစံများ တိုးတက်စွာ ထည့်သွင်းခြင်း
- **အစ သင်ခန်းစာ အခန်း**: ပရော်ဖက်ရှင်နယ် အတည်ပြုမှု ပုံစံများ ဖြည့်စွက်ခြင်း
- **ပရိုဒက်ရှင်း အသင့်တော်မှု**: လုံခြုံရေးမှ ကြည့်ရှုနိုင်ရေး အပေါ်ကျယ်ပြန့်စွာ သတ်မှတ်ခြင်း
- **သင်တန်းအစီအစဉ်**: အခန်း ၃ နှင့် ၆ တွင် အသစ်ထည့်သွင်းသည့် သင်ခန်းစာများ ရည်ညွှန်းမှု ပြုပြင်ထားခြင်း

#### ပြောင်းလဲမှုများ
- **သင်ယူမှု တိုးတက်မှု**: လုံခြုံရေးနှင့် ကြည့်ရှုနိုင်မှု ပိုင်းဆိုင်ရာ ပိုမိုချိတ်ဆက်ထားခြင်း
- **စာတမ်းအရည်အသွေး**: ရောနှောအသစ်များတွင် A-အဆင့် စံနှုန်း (95-97%) ပြည့်စုံစွာ ထိန်းသိမ်းခြင်း
- **ပရိုဒက်ရှင်း ပုံစံများ**: စီးပွားရေးလုပ်ငန်း တပ်ဆင်မှုများအတွက် အစမှ အဆုံးပြည့်စုံသော ကြီးကြပ်မှု

#### တိုးတက်မှုစနစ်များ
- **ဖန်တီးသူအတွေ့အကြုံ**: ဖန်တီးမှ ပရိုဒက်ရှင်း ကြည့်ထောက်မှု သို့ ရိုးရှင်းသည့် လမ်းကြောင်း
- **လုံခြုံရေး စံများ**: အတည်ပြုမှုနှင့် လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှုအတွက် ပရော်ဖက်ရှင်နယ် နမူနာများ
- **ကြည့်ရှု နိုင်စွမ်း**: AZD နှင့် Application Insights ပေါင်းစပ်ရေး အပြည့်အစုံ
- **AI အလုပ်တွင် မျိုးစုံအေဂျင့်များနှင့် Microsoft Foundry Models အတွက် အထူးပြုပြင်ထားသော ကြည့်ထောက်မှုများ

#### အတည်ပြုအောင် ပြုလုပ်ခြင်း
- ✅ သင်ခန်းစာအားလုံးတွင် ဖော်ပြထားသော ကုဒ် များ အပြည့်အစုံပါရှိခြင်း (snippet မဟုတ်)
- ✅ ကြည့်ရှုနိုင်သော လေ့လာရေးအတွက် Mermaid diagrams ၁၉ ဆုပ်လုံးရှိခြင်း
- ✅ လက်တွေ့လုပ်ဆောင်မှု လေ့ကျင့်ခန်း ၉ ခုအပြည့်အစုံနှင့် အတည်ပြုခြင်းအဆင့်များ
- ✅ `azd up` ဖြင့် တပ်ဆင်နိုင်သည့် production-ready Bicep templates
- ✅ ကုန်ကျစရိတ် စစ်ဆေးမှုနှင့် စီမံခန့်ခွဲမှု နည်းလမ်းများ
- ✅ ပြဿနာရှာဖွေရေး လမ်းညွှန်များနှင့် အကောင်းဆုံးအတိုင်ပင်ခံ စံနှုန်းများ
- ✅ အတည်ပြုခြင်းအဆင့်အတန်းများနှင့် Knowledge checkpoints

#### စာတမ်း အဆင့်သတ်မှတ်ခြင်း ရလဒ်များ
- **docs/pre-deployment/application-insights.md**: - ကြည့်ရှုစနစ်အပြည့်အစုံ လမ်းညွှန်ချက်
- **docs/getting-started/authsecurity.md**: - ပရော်ဖက်ရှင်နယ် လုံခြုံရေး ပုံစံများ
- **docs/pre-deployment/coordination-patterns.md**: - တိုးတက်သော မျိုးစုံအေဂျင့် ဖွဲ့စည်းမှုများ
- **စုစုပေါင်း အသစ်အကြောင်းအရာ**: - တကျွမ်းတည်းသော အရည်အသွေး စံနှုန်းများ

#### နည်းပညာ အကောင်အထည်ဖော်မှု
- **Application Insights**: Log Analytics + personal telemetry + ကြည့်ရှုမှု ချိတ်ဆက်မှု
- **Authentication**: Managed Identity + Key Vault + RBAC ပုံစံများ
- **မျိုးစုံအေဂျင့်**: Service Bus + Cosmos DB + Container Apps + orchestration
- **ကြည့်ရှုမှု**: Live metrics + Kusto ရှာဖွေ + แจ้งเตือน + dashboards
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: Sampling နည်းဗျူဟာများ၊ သိုလှောင်ရာ မူဝါဒများ၊ ဘတ်ဂျက်ထိန်းချုပ်မှုများ

### [v3.7.0] - 2025-11-19

#### စာတမ်း အရည်အသွေးတိုးတက်မှုနှင့် Microsoft Foundry Models ဥပမာအသစ်
**ဤဗားရှင်းသည် စာတမ်းအရည်အသွေးကို စုစည်းထားသည့် ဌာနများအားလုံးတွင် တိုးတက်အောင်လုပ်ပြီး၊ gpt-4.1 စကားပြောအင်တာဖေ့စ်ဖြင့် Microsoft Foundry Models ဖြန့်ချိမှု ဥပမာ အပြည့်အစုံ ထည့်သွင်းပေးသည်။

#### ထည့်သွင်းပြီး
- **🤖 Microsoft Foundry Models စကားပြော ဥပမာ**: `examples/azure-openai-chat/` တွင် ပြည့်စုံစွာ gpt-4.1 ဖြင့် တပ်ဆင်ခြင်း
  - Microsoft Foundry Models အင်ဖရာစထရပ်ချာ အပြည့်အစုံ (gpt-4.1 မော်ဒယ် တပ်ဆင်မှု)
  - စကားပြော အကြောင်းအရာမှတ်တမ်းရှိ Python command-line interface
  - API key လုံခြုံမှုအတွက် Key Vault ပေါင်းစည်းမှု
  - Token အသုံးပြုမှု တိုင်းတာခြင်းနှင့် ကုန်ကျစရိတ် ခန့်မှန်းခြင်း
  - နှုန်းချုပ်ခြင်းနှင့် မှားယွင်းချက် ကိုင်တွယ်မှု
  - ၃၅-၄၅ မိနစ် အသုံးပြုနိုင်သော README ဖိုင် အပြည့်အစုံ
  - ပြီးပြည့်စုံသော ဖိုင် ၁၁ ခု (Bicep template များ၊ Python အက်ပလီကေးရှင်း၊ configuration)
- **📚 စာတမ်း လေ့ကျင့်ခန်းများ**: configuration လမ်းညွှန်တွင် လက်တွေ့ လေ့ကျင့်ခန်းများ ထည့်သွင်းခြင်း
  - လေ့ကျင့်ခန်း ၁: မျိုးစုံပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း (၁၅ မိနစ်)
  - လေ့ကျင့်ခန်း ၂: လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှု လေ့ကျင့်ခြင်း (၁၀ မိနစ်)
  - အောင်မြင်မှုအချက်ပြများနှင့် အတည်ပြုခြင်းခြေလှမ်းများ ရှင်းလင်းပြတ်သားမှု
- **✅ တပ်ဆင်မှု အတည်ပြုခြင်း**: တပ်ဆင်မှုလမ်းညွှန်တွင် အတည်ပြုမှု အပိုင်း ထည့်သွင်းခြင်း
  - ကျန်းမာရေး စစ်ဆေးမှု နည်းလမ်းများ
  - အောင်မြင်မှု စစ်တမ်းစာရင်းများ
  - တပ်ဆင်မှု ကော်မန်းအားလုံးတွင် မျှော်မှန်းထားသော ထွက်ရှိချက်များ
  - ပြဿနာရှာဖွေရေးအမြန်ဆောင်ရွက်မှုလမ်းညွှန်

#### တိုးတက်မှုများ
- **examples/README.md**: A-အဆင့်အရည်အသွေး (93%) သို့ အပ်ဒိတ်လုပ်ခြင်း
  - azure-openai-chat ကို အစိတ်အပိုင်း များအားလုံးတွင် ထည့်သွင်းခြင်း
  - ဒေသခံ ဥပမာ အရေအတွက် ၃ မှ ၄ အထိ တိုးမြှင့်ခြင်း
  - AI Application ဥပမာ စာရင်းတွင် ထည့်သွင်းခြင်း
  - အလယ်အလတ် သုံးစွဲသူများအတွက် Quick Start တွင် ပေါင်းထည့်ခြင်း
  - Microsoft Foundry Templates အပိုင်းတွင် ထည့်သွင်းခြင်း
  - နှိုင်းယှဉ် ဇယားနှင့် နည်းပညာ ရှာဖွေမှု အပိုင်းများ ပြင်ဆင်ခြင်း
- **စာတမ်းအရည်အသွေး**: docs ဖိုလ်ဒါတွင်း B+(87%) မှ A-(92%) အထိ တိုးတက်ပြီး
  - အရေးကြီး ကော်မန်း ဥပမာများတွင် မျှော်မှန်းထားသော ထွက်ရှိချက် ထည့်သွင်းခြင်း
  - စနစ်တကျ ပြောင်းလဲမှုများ၏ အတည်ပြု ခြေလှမ်းများ ပါဝင်ခြင်း
  - လက်တွေ့သင်ယူမှုကောင်းမွန်စေရန် လေ့ကျင့်ခန်းများ တိုးတက်ခြင်း

#### ပြောင်းလဲမှုများ
- **သင်ယူမှု တိုးတက်မှု**: အလယ်အလတ် သင်ယူသူများအတွက် AI ဥပမာများ ပိုမို ထည့်သွင်းခြင်း
- **စာတမ်း ဖွဲ့စည်းမှု**: ပြလေ့ကျင့်ခန်းများကို ပိုမို ချမှတ်နိုင်ရန် ပြုပြင်ခြင်း
- **အတည်ပြုမှု ပရိုစေ့**: အဓိကလုပ်ငန်းစဉ်များတွင် အောင်မြင်မှု အချက်ပြ ထည့်သွင်းခြင်း

#### တိုးတက်မှုများ
- **ဖန်တီးသူ အတွေ့အကြုံ**: Microsoft Foundry Models တပ်ဆင်မှု ၃၅-၄၅ မိနစ် (ရှုပ်ထွေးမှုများ ၆၀-၉၀ မိနစ်နှင့် ယှဉ်)
- **ကုန်ကျစရိတ် ပွင့်လင်းမှု**: Microsoft Foundry Models ဥပမာအတွက် $50-200/လ ကုန်ကျစရိတ် ခန့်မှန်းခြင်း
- **သင်ယူမှု လမ်းကြောင်း**: azure-openai-chat ဖြင့် AI ဖန်တီးသူများအတွက် ဖွင့်လှစ်ချက် ပြန်လည်တင်ပြမှု
- **စာတမ်း စံနှုန်းများ**: မျှော်မှန်းထားသော ထွက်ရှိချက်များနှင့် အတည်ပြုသည့် ခြေလှမ်းများနှင့် တကျွမ်းတည်းဖြစ်စေခြင်း

#### အတည်ပြုအောင် ပြုလုပ်ခြင်း
- ✅ Microsoft Foundry Models ဥပမာ အပြည့်စုံ `azd up` နှင့် အလုပ်လက်တွေ့ ဆောင်ရွက်နိုင်ခြင်း
- ✅ ဖိုင် ၁၁ ခုအား စိတ်ရှည်ရှည်စွာ စနစ်တကျရေးသားထားခြင်း
- ✅ README ၏ လမ်းညွှန်ချက်များ တပ်ဆင်မှုအတွေ့အကြုံနှင့် ကိုက်ညီခြင်း
- ✅ စာတမ်း လင့်ခ်များ ၈ ကျော်နေရာတွင် ပြင်ဆင်ထားခြင်း
- ✅ ဥပမာများ စာရင်းတွင် ဒေသခံ ဥပမာ ၄ ခုမှန်ကန်စွာ ဖော်ပြထားခြင်း
- ✅ ဇယားထဲတွင် ထပ်ခါတလဲလဲ ပြင်ဆင်မှု မရှိခြင်း
- ✅ လမ်းညွှန် ရည်ညွှန်းချက်များအားလုံး မှန်ကန်ခြင်း

#### နည်းပညာ အကောင်အထည်ဖော်မှု
- **Microsoft Foundry Models လုပ်ငန်းပုံပြင်**: gpt-4.1 + Key Vault + Container Apps ပုံစံ
- **လုံခြုံရေး**: Managed Identity အသင့်တော်စွာ၊ Key Vault တွင် လျှို့ဝှက်ချက်များ သိမ်းဆည်းခြင်း
- **ကြည့်ရွုနိုင်စွမ်း**: Application Insights ပေါင်းစည်းမှု
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: Token ထိန်းသိမ်းမှုနှင့် အသုံးပြုမှု တိုးတက်အောင်လုပ်ခြင်း
- **တပ်ဆင်မှု**: `azd up` ဟူသော တစ်ခုတည်းသော ကော်မန်းဖြင့် စုံလင်စွာ ပြင်ဆင်ထားခြင်း

### [v3.6.0] - 2025-11-19

#### အရေးပါသော အသစ်: Container App တပ်ဆင်မှု ဥပမာများ
**ဤဗားရှင်းတွင် Azure Developer CLI (AZD) အသုံးပြု၍ ပြည့်စုံသော ပရိုဒက်ရှင်း အဆင့် Container App တပ်ဆင်မှု ဥပမာများ၊ စာတမ်းအပြည့်အစုံနှင့် သင်ယူမှု လမ်းကြောင်းအတွင်း ပေါင်းစည်းမှု ပါဝင်သည်။**

#### ထည့်သွင်းပြီး
- **🚀 Container App ဥပမာများ**: `examples/container-app/` တွင် ဒေသခံ ဥပမာအသစ်များ
  - [မစ်စတာဂိုက်ဒ်](examples/container-app/README.md): ကွန်တိန်နာထည့်သွင်းမှုများ၏ ပြည့်စုံသောအကျဉ်းချုပ်၊ ဦးစွာစတင်ခြင်း၊ ထုတ်လုပ်မှုနှင့် ပြောင်းလဲတိုးတက်မှု ပုံစံများ
  - [ရိုးရှင်းသော Flask API](../../examples/container-app/simple-flask-api): စတင်အသုံးပြုသူများအတွက် သဟဇာတ REST API သည် scale-to-zero၊ ကျန်းမာရေးစစ်ဆေးခြင်းများ၊ စောင့်ကြည့်မှုများနှင့် ပြဿနာရှာဖွေရေးပါဝင်သည်
  - [မိုက်ခရိုဆာဗစ်များ နည်းဗျူဟာ](../../examples/container-app/microservices): ထုတ်လုပ်မှုအဆင်သင့် multi-service ထည့်သွင်းမှု (API Gateway, Product, Order, User, Notification), အဆက်မပြတ် စာတိုက်ပို့ခြင်း၊ Service Bus, Cosmos DB, Azure SQL, ခွဲခြမ်းစစ်ဆေးခြင်း၊ blue-green/canary ထည့်သွင်းမှု
- **အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ**: လုံခြုံရေး၊ စောင့်ကြည့်မှု၊ ကုန်ကျစရိတ် ချွေတာမှုနှင့် CI/CD လမ်းညွှန်ချက်များ containerized workloads များအတွက်
- **ကုဒ်နမူနာများ**: ပြည့်စုံသော `azure.yaml`, Bicep ပုံစံများနှင့် ပလက်ဖောင်းစုံ ဝန်ဆောင်မှု ကုဒ်အကောင်အထည်ဖော်မှုများ (Python, Node.js, C#, Go)
- **စမ်းသပ်မှု & ပြဿနာရှာဖွေရေး**: အဆုံးအစ စမ်းသပ်မှုအခြေအနေများ၊ စောင့်ကြည့်မှုကမ်းလှမ်းချက်များ၊ ပြဿနာရှာဖွေရေး လမ်းညွှန်ချက်များ

#### ပြောင်းလဲခဲ့သည်
- **README.md**: "နေရာဒေသ စမ်းသပ်မှုများ - ကွန်တိန်နာလျာရပ်အပ်ပလီကေးရှင်းများ" အောက်တွင် အသစ်ကွန်တိန်နာအက်ပ်နမူနာများနှင့် ချိတ်ဆက်ထားရန် အသစ်ပြောင်းလဲထားသည်
- **examples/README.md**: ကွန်တိန်နာအက်ပ်နမူနာများအား ထူးခြားစွာဖော်ပြရန်၊ နှိုင်းယှဉ်မှုဇယားထည့်ရန်နှင့် နည်းပညာ/နည်းဗျူဟာ ရည်ညွှန်းချက်များ ပြောင်းလဲထားသည်
- **သင်တန်း အကြောင်းအရာနှင့် သင်ကြားမှု လမ်းညွှန်**: သက်ဆိုင်ရာအခန်းများ၌ အသစ်ကွန်တိန်နာအက်ပ်နမူနာများနှင့် ထည့်သွင်းမှု ပုံစံများကို ရည်ညွှန်းရန် ပြောင်းလဲထားသည်

#### အတည်ပြုခဲ့သည်
- ✅ အသစ်သော နမူနာအသီးသီးအား `azd up` ဖြင့် ထည့်သွင်းနိုင်ပြီး အကောင်းဆုံးလုပ်ထုံးလုပ်နည်းများကို လိုက်နာထားသည်
- ✅ စာရွက်စာတမ်း ချိတ်ဆက်မှုများနှင့် နေရာလမ်းညွှန်များ ပြောင်းလဲပြီးမွမ်းမံထားသည်
- ✅ နမူနာများ၌ စတင်သူမှ တိုက်ရိုက် ဝန်ဆောင်မှုများထိ အဆင့်မြင့်အထိ မိတ်ဆက်ထားသည်

#### မှတ်ချက်များ
- **အကွာအဝေး**: အင်္ဂလိပ်စာရွက်စာတမ်းများနှင့် နမူနာများသာ
- **နောက်ထပ် အဆင့်များ**: နောင်လာသည့်ထုတ်လုပ်မှုများတွင် အဆင့်မြင့် container ပုံစံများနှင့် CI/CD အလိုအလျောက် ပြုလုပ်မှု ထပ်မံတိုးချဲ့ရန်

### [v3.5.0] - 2025-11-19

#### ထုတ်ကုန် အမည်ပြောင်းလဲခြင်း: Microsoft Foundry
**ဤဗားရှင်းသည် "Microsoft Foundry" မှ "Microsoft Foundry" သို့ ပြည့်စုံသော ထုတ်ကုန်အမည် ပြောင်းလဲမှုကို အင်္ဂလိပ်စာရွက်စာတမ်း အားလုံးတွင် ကျင်းပပြီး Microsoft ၏ တရားဝင်အမှတ်တံဆိပ် ပြောင်းလဲမှုအား ဖော်ပြသည်။**

#### ပြောင်းလဲခဲ့သည်
- **🔄 ထုတ်ကုန် အမည် အသစ်ပြောင်းလဲခြင်း**: "Microsoft Foundry" မှ "Microsoft Foundry" သို့ ပြောင်းလဲခြင်း လုံးဝ ပြီးစီးပြီး
  - အင်္ဂလိပ်စာရွက်စာတမ်းများ ဖိုင် `docs/` တွင် ရည်ညွှန်းချက် အားလုံး ပြောင်းလဲထားသည်
  - ဖိုင်အမည်ပြောင်းလဲမှု: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ဖိုင်အမည်ပြောင်းလဲမှု: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - စုစုပေါင်း: စာရွက်စာတမ်း ၇ ဖိုင်တွင် ရည်ညွှန်းချက် ၂၃ ခု ပြောင်းလဲ

- **📁 ဖိုင်ဖိုလ်ဒါ အဆောက်အအုံ ပြောင်းလဲမှုများ**:
  - `docs/ai-foundry/` ကို `docs/microsoft-foundry/` အဖြစ် ပြောင်းလဲခဲ့သည်
  - ဖိုင်ဖိုလ်ဒါ ဖွဲ့စည်းပုံအသစ်အတိုင်း ချိတ်ဆက်ချက်များအားလုံး ပြင်ဆင်ထားသည်
  - စာရွက်စာတမ်း အားလုံးတွင် လမ်းညွှန်ချိတ်ဆက်ချက်များ အတည်ပြုထားသည်

- **📄 ဖိုင်အမည် ပြောင်းလဲခြင်းများ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - ဖိုင်အတွင်း ချိတ်ဆက်ချက်များအားလုံးကို ဖိုင်အမည်အသစ်နှင့်ကိုက်ညီစေရန် ပြင်ဆင်ပြီး

#### ပြောင်းလဲဖိုင်များ
- **အခန်း စာရွက်စာတမ်းများ** (၇ ဖိုင်):
  - `docs/microsoft-foundry/ai-model-deployment.md` - အထက်တွင် လမ်းညွှန်ချက် ၃ ချက် ပြောင်းလဲထားသည်
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ထုတ်ကုန်အမည် ၄ ချက် တွင် ပြောင်းလဲထားသည်
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - အကြိုပြင်ဆင်ထားပြီးဖြစ်သော Microsoft Foundry ကို အသုံးပြုနေဆဲ (ယခင်နောက်ဆက်တွဲများမှ)
  - `docs/microsoft-foundry/production-ai-practices.md` - ၃ ဆင့်ကို အပ်ဒိတ်လုပ်ပြီး (အနှစ်ချုပ်၊ အသိုင်းအဝိုင်းတုံ့ပြန်ချက်၊ စာရွက်စာတမ်း)
  - `docs/getting-started/azd-basics.md` - ၄ ခုသော အချိတ်ဆက်များကို ပြင်ဆင်ပြီးဖြစ်သည်
  - `docs/getting-started/first-project.md` - ၂ ခုသော အခန်းလမ်းညွှန်အချက်များကို ပြင်ဆင်ပြီးဖြစ်သည်
  - `docs/getting-started/installation.md` - နောက်တစ်ခန်း လင့်ခ် ၂ ခု စတင်ပြန်လည်အပ်ဒိတ်လုပ်ပြီး
  - `docs/troubleshooting/ai-troubleshooting.md` - ကိုးရောက်ချက် ၃ ခု အပ်ဒိတ်လုပ်ပြီး (လမ်းညွှန်၊ Discord အသင်း)
  - `docs/troubleshooting/common-issues.md` - လမ်းညွှန် လင့်ခ် ၁ ခု အပ်ဒိတ်လုပ်ပြီး
  - `docs/troubleshooting/debugging.md` - လမ်းညွှန် လင့်ခ် ၁ ခု အပ်ဒိတ်လုပ်ပြီး

- **သင်ခန်းစာဖွဲ့စည်းမှုဖိုင်များ** (ဖိုင် 2 ခု):
  - `README.md` - ကိုးကားချက် ၁၇ ခု အပ်ဒိတ်လုပ်ပြီး (သင်ခန်းစာအကျဉ်း, အခန်းခေါင်းစဉ်များ, စံနမူနာပြုစင်ကေတ ဌာန, အသိုင်းအဝိုင်း အမြင်များ)
  - `course-outline.md` - ကိုးကားချက် ၁၄ ခု အပ်ဒိတ်လုပ်ပြီး (အကျဉ်းချုပ်, သင်ယူရမည့်ရည်မှန်းချက်များ, အခန်းအရင်းအမြစ်များ)

#### အတည်ပြုပြီး
- ✅ အင်္ဂလိပ်စာရွက်စာတမ်းများတွင် "ai-foundry" ဖိုင်ဖိုလ်ဒါလမ်းကြောင်းကို ကျန်ရှိမှု သုည
- ✅ အင်္ဂလိပ်စာရွက်စာတမ်းများတွင် "Microsoft Foundry" ထုတ်ကုန်အမည်ကို ကျန်ရှိမှု သုည
- ✅ ဖိုလ်ဒါဖွဲ့စည်းမှုအသစ်နှင့်အညီ လမ်းညွှန်လင့်ခ်အားလုံး လုပ်ဆောင်နိုင်မှုရှိ
- ✅ ဖိုင်နှင့်ဖိုလ်ဒါအမည်ပြောင်းလုပ်ဆောင်မှုများ အောင်မြင်စွာ ပြီးစီး
- ✅ အခန်းများအကြား အချိတ်အဆက်များ အတည်ပြုပြီး

#### မှတ်ချက်များ
- **အကွာအဝေး**: အင်္ဂလိပ်စာရွက်စာတမ်းများအတွက်သာ `docs/` ဖိုလ်ဒါတွင် ပြင်ဆင်မှုများ ပြုလုပ်ပြီးဖြစ်သည်
- **ဘာသာပြန်ချက်များ**: ဘာသာပြန်ဖိုလ်ဒါများ (`translations/`) ကို ဤဗားရှင်းတွင် မမှန်ကန်စွာပြင်ဆင်ထားပါ
- **အလုပ်ရုံဆွေးနွေးပွဲ**: အလုပ်ရုံ အရာဝတ္ထုများ (`workshop/`) ကို ဤဗားရှင်းတွင် မမှန်ကန်စွာပြင်ဆင်ထားပါ
- **ဥပမာများ**: ဥပမာဖိုင်များတွင် ယခင်အမည်များကို မျှတအောင်ပြုလုပ်ခြင်း မရှိနိုင်သေး (နောင်ပေါ်အသစ်ထွက်မည့် မူပိုင်)
- **အပြင်ဘက်လင့်ခ်များ**: အပြင်ဘက် URL များနှင့် GitHub repository ကိုးကားချက်များ မပြောင်းလဲထားပါ

#### ပံ့ပိုးပေးသူများအတွက် ရွှေ့ပြောင်း လမ်းညွှန်
သင်တွင် ဒေသဆိုင်ရာ branch များ သို့မဟုတ် အဟောင်း ဖွဲ့စည်းတည်ဆောက်မှုကို ကိုးကားထားသော စာရွက်စာတမ်းများရှိလျှင် -
1. ဖိုင်တွဲ ကိုးကားချက်များကို သို့မဟုတ်ပြင်ဆင်ပါ: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ဖိုင်ကိုးကားချက်များကို ဖော်ပြပါ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ကုန်ပစ္စည်းအမည်ကို အစားထိုးပါ: "Microsoft Foundry" → "Microsoft Foundry"
4. အတွင်းပိုင်း စာရွက်စာတမ်းလင့်ခ်များအားလုံး သေးစိတ်စစ်ဆေးပါ

---

### [v3.4.0] - 2025-10-24

#### အခြေခံအသုံးပြုမှုကြိုတင်ကြည့်ရှုခြင်းနှင့် အတည်ပြုမှု တိုးတက်မှုများ
**ဒီဗားရှင်းသည် Azure Developer CLI ကြိုတင်ကြည့်ရှုနိုင်သော အင်္ဂါရပ်အသစ်အတွက် စုံလင်သော ပံ့ပိုးမှုကို တင်ပြပေးပြီး အလုပ်ရုံ သုံးစွဲသူ အတွေ့အကြုံကို တိုးတက်စေခဲ့သည်။**

#### ဖြည့်စွက်ထည့်သွင်းထားသည့်အချက်များ
- **🧪 azd provision --preview အင်္ဂါရပ် စာတမ်း**: အခြေခံအသုံးပြုမှု ကြိုတင်ကြည့်ရှုရန် အင်္ဂါရပ်ကို စုံလင်စွာ ဖော်ပြသည်
  - အမိန့်ရည်ညွှန်းချက်နှင့် အသုံးပြုနမူနာများ မြန်ဆန်ပြ သော စာရင်းတွင် ပါဝင်သည်
  - အသုံးချလမ်းညွှန်တွင် အသုံးပြုမှုနှင့် အကျိုးထာဝရများကို အသေးစိတ် ပေါင်းစပ်ထားသည်
  - စောင့်ကြည့်စစ်ဆေးမှု ထည့်သွင်း၍ ပိုမိုလုံခြုံစိတ်ချရသော တာဝန်ပေးစစ်ဆေးမှု
  - စတင်အသုံးပြုသူ လမ်းညွှန်များကို လုံခြုံမှု ဦးစားပေး တင်ပြချက်နှင့် ပြင်ဆင်ထားသည်
- **🚧 အလုပ်ရုံအခြေအနေ ဘနေါ**: အလုပ်ရုံဖွံ့ဖြိုးတိုးတက်မှု အခြေအနေကို ပြသသည့် အတတ်ပညာ HTML ဘနေါ
  - အမြှုပ်ဒီဇိုင်နာဖြင့် တည်ဆောက်မှု ပြသသည့် အချက်ပြများဖြင့် အသုံးပြုသူအား ပိုမိုရှင်းလင်းသော ဆက်သွယ်မှု
  - နောက်ဆုံး အပ်ဒိတ်ရက်စွဲဖော်ပြချက် ဖြင့် ပွတ်ပြတ်မြင်သာမှု
  - မိုဘိုင်း၊ တက်ဘလက် နှင့် ဒက်စ်ကုမ္ပျူတာ များအတွက် အမြဲတုံ့ပြန်နိုင်သည့် ဒီဇိုင်နာ

#### တိုးတက်အဆင့်မြှင့်ထားသောအချက်များ
- **အခြေခံလုံခြုံရေး**: ကြိုတင်ကြည့်ရှုမှုလုပ်ဆောင်ချက်အား တာဝန်ပေး စာရွက်စာတမ်း အပြီးအစီးတွင် ပေါင်းစပ်ထား
- **တင်သွင်းမှုမတိုင်မီ အတည်ပြုမှု**: အလိုအလျောက် စာမျက်နှာများတွင် တင်သွင်းမှုမတိုင်မီ ကြိုတင်ကြည့်ရှုစစ်ဆေးမှု ထည့်သွင်းထား
- **ဖွံ့ဖြိုးရေးသူ အလုပ်စဉ်**: ကြိုတင်ကြည့်ရှုမှုပေါင်းစပ်ထားသော မျဉ်းဆွဲအမိန့် စဉ်ကို ပြင်ဆင်ထား
- **အလုပ်ရုံအတွေ့အကြုံ**: အကြောင်းအရာ ဖွဲ့တည်မှု အဆင့်အတန်းကို အသုံးပြုသူအား သိရှိစေရန် ဖော်ပြထား

#### ပြောင်းလဲမှုများ
- **တင်သွင်းမှု အကောင်းဆုံး လေ့လာမှုများ**: ကြိုတင်ကြည့်ရှုမှုပဋိညာဉ် လမ်းစဉ် အသုံးပြုရန် အကြံပြုသည်
- **စာတမ်းထုတ်လွှင့်မှုစီးဆင်းမှု**: အင်ဖရပ်စတျက် အတည်ပြုခြင်းကို သင်ယူမှုလုပ်ငန်းစဉ်တွင် မြန်ဆန်စွာ ရွှေ့ထားပြီး
- **အလုပ်ရုံတင်ဆက်မှု**: တိကျရှင်းလင်းသောဖွံ့ဖြိုးတိုးတက်မှုအချိန်ဇယားနှင့်အတူ ပရော်ဖက်ရှင်နယ်အဆင့်ဆက်သွယ်မှု

#### တိုးတက်သွားသောအချက်များ
- **လုံခြုံရေးဦးစားပေးနည်းလမ်း**: အင်ဖရាសထရပ်ချိန်ပြောင်းလဲမှုများကို ထည့်သွင်းမှမတိုင်မီ အတည်ပြုနိုင်မှု
- **အဖွဲ့အလုပ်ပေါင်းဖက်မှု**: ရလဒ်များကို ကြိုတင်ကြည့်ရှုခြင်းအတွက် မျှဝေပေးနိုင်ခြင်းနှင့် သဘောတူညီမှုရရှိစေမှု
- **ကုန်ကျစရိတ်သတိပေးမှု**: ပရိုဗွိုင်းဒင်းမလုပ်မီ အရင်းအမြစ်ကုန်ကျစရိတ်များကို ပိုမိုနားလည်မှုရှိခြင်း
- **အန္တရာယ်လျှော့ချမှု**: ကြိုတင်အတည်ပြုပြီး အကောင်အထည်ဖော်မှုအခက်အခဲများ လျှော့ချနိုင်ခြင်း

#### နည်းပညာဆိုင်ရာအကောင်အထည်ဖော်မှု
- **စာရွက်စာတမ်းများစွာပေါင်းစပ်မှု**: ကြိုတင်ကြည့်ရှုမှုအစိတ်အပိုင်းကို အရေးကြီးသောဖိုင် ၄ ဖိုင်တွင် မှတ်တမ်းတင်ခြင်း
- **ကမန့်ဖျော်မိတ်ပုံစံများ**: စာရွက်စာတမ်းအလိုက် စနစ်တကျစာလုံးပုံစံနှင့် ဥပမာများ
- **အကောင်းဆုံးလက်တွေ့ကျမှုပေါင်းစပ်မှု**: ကြိုတင်ကြည့်ရှုမှုကို အတည်ပြုမှုလုပ်ငန်းစဉ်များနှင့် စကရစ်တွဲထဲသို့ ထည့်သွင်းခြင်း
- **မြင်သာသည့်ညွှန်းပြချက်များ**: ရှာဖွေရေးအတွက် အသစ်ဖြစ်သော လက္ခဏာများကို ပေါ်လွင်စေခြင်း

#### အလုပ်ရုံအင်ဖရားစထရပ်
- **အခြေအနေဆက်သွယ်မှု**: လှပသော HTML ဗန္နာ နှင့် ဂရေဒီယင်ပုံစံပေးခြင်း
- **အသုံးပြုသူအတွေ့အကြုံ**: ဖွံ့ဖြိုးတိုးတက်မှုအခြေအနေအသေးစိတ်ရှင်းလင်းစေရန်
- **ပရော်ဖက်ရှင်နယ်တင်ဆက်မှု**: ရေရှည်အတွက် သိမ်းဆည်းထားမှုအား အားပေးပြီး မျှော်လင့်ချက်များကို သတ်မှတ်ခြင်း
- **အချိန်ဇယားထင်ရှားမှု**: တာဝန်ယူမှုအတွက် 2025 ခုနှစ် အောက်တိုဘာလ နောက်ဆုံးအပ်ဒိတ်စက်တင်

### [v3.3.0] - 2025-09-24

#### တိုးတက်သောအလုပ်ရုံစာရွက်စာတမ်းများနှင့် အပြန်အလှန်သင်ယူမှုအတွေ့အကြုံ
**ဤဗားရှင်းသည် Browser သုံးသော အပြန်အလှန်လမ်းညွှန်များနှင့် ဖွဲ့စည်းတည်ဆောက်ထားသောသင်ယူမှုလမ်းကြောင်းများပါဝင်သော စုံလင်သောအလုပ်ရုံစာရွက်စာတမ်းများကို မိတ်ဆက်ပေးသည်။**

#### ထည့်သွင်းထားသောအချက်များ
- **🎥 အပြန်အလှန်အလုပ်ရုံလမ်းညွှန်**: MkDocs ကြိုတင်ကြည့်ရှုနိုင်စွမ်းရှိသော Browser အခြေခံ အလုပ်ရုံအတွေ့အကြုံ
- **📝 ဖွဲ့စည်းတည်ဆောက်ထားသောအလုပ်ရုံညွှန်ကြားချက်များ**: ရှာဖွေရေးမှ စိတ်ကြိုက်ပြင်ဆင်ခြင်းထိ အဆင့် ၇ ချက်သင်ယူမှုလမ်းကြောင်း
  - 0-နိဒါန်း: အလုပ်ရုံအကျဉ်းချုပ်နှင့် စတင်ပြင်ဆင်ခြင်း
  - 1-AI-ပုံစံရွေးချယ်ခြင်း: ပုံစံရှာဖွေရေး နှင့် ရွေးချယ်မှု လုပ်ငန်းစဉ်
  - 2-AI-ပုံစံအတည်ပြုမှု: တပ်ဆင်ခြင်းနှင့် အတည်ပြုလုပ်ငန်းစဉ်များ
  - 3-AI-ပုံစံခွဲခြမ်းစိတ်ဖြာခြင်း: ပုံစံဖွဲ့စည်းပုံနားလည်ခြင်း
  - 4-AI-ပုံစံဖွဲ့စည်းမှု: ဖွဲ့စည်းခြင်းနှင့် စိတ်ကြိုက်ပြင်ဆင်ခြင်း
  - 5-AI-ပုံစံပြင်ဆင်မှု: တိုးတက်ပြုပြင်ခြင်းနှင့် ထပ်ဆင့်အစိတ်အပိုင်းများ
  - 6-အင်ဖရားစထရပ်ဖျက်သိမ်းခြင်း: သန့်ရှင်းရေးနှင့် အရင်းအမြစ်စီမံခန့်ခွဲမှု
  - 7-အဆုံးသတ်: အကျဉ်းချုပ်နှင့် နောက်တိုးခြေလှမ်းများ
- **🛠️ အလုပ်ရုံကိရိယာများ**: ပိုမိုကောင်းမွန်သောသင်ကြားမှုအတွက် Material theme ဖြင့် MkDocs ဖော်ပြချက်
- **🎯 လက်တွေ့သင်ယူမှုလမ်းကြောင်း**: ၃ အဆင့်နည်းလမ်း (ရှာဖွေရေး → တပ်ဆင်ခြင်း → စိတ်ကြိုက်ပြင်ဆင်ခြင်း)
- **📱 GitHub Codespaces ပေါင်းသင်းမှု**: ဖွံ့ဖြိုးတိုးတက်မှုပတ်ဝန်းကျင်ကို အဆင်ပြေအောင် သွင်းစည်းခြင်း

#### တိုးတက်လာသောအချက်များ
- **AI အလုပ်ရုံဓာတ်ခွဲခန်း**: ၂-၃ နာရီ ကြာကြာ ရှုထောင့်ဖွင့်သင်ယူမှုလိုက်နာမှု တိုးချဲ့ခြင်း
- **အလုပ်ရုံစာရွက်စာတမ်းများ**: သဘာဝကျသောတင်ဆက်မှုနှင့် လမ်းညွှန်မှု၊ မြင်သာစေသည့် ပစ္စည်းများဖြင့်
- **သင်ယူမှုတိုးတက်မှု**: ပုံစံရွေးချယ်မှုပြု၍ ထုတ်လုပ်မှု တပ်ဆင်မှုအထိ ဦးတည်ချက်စာလမ်းညွှန်ချက်
- **ဖန်တီးသူအတွေ့အကြုံ**: တက်ကြွစွာ ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ်များအတွက် ကိရိယာများ ပေါင်းစည်းမှု

#### တိုးတက်လာသောအချက်များ
- **ရရှိနိုင်မှု**: ရှာဖွေမှု၊ မိတ္တူလုပ်ရေး လုပ်ဆောင်ချက်များနှင့် အနက်/အဖြူ အပြောင်းအလဲ ထောက်ခံမှု ပါဝင်သည့် Browser အင်တာဖေ့စ်
- **ကိုယ့်မြန်နှုန်းအားဖြင့် သင်ယူမှု**: သင်ယူမှုအမြန်နှုန်းကွဲပြားမှုကို လိုက်လျောညီထွေစေရန် အလုပ်ရုံဖွဲ့စည်းတည်ဆောက်မှုနည်းပညာ
- **လက်တွေ့အသုံးပြုမှု**: အမှန်တကယ် AI ပုံစံတပ်ဆင်မှု ရှုထောင့်များ
- **လူမှုအသိုင်းအဝိုင်း ပေါင်းစည်းမှု**: အလုပ်ရုံ ထောက်ခံမှုနှင့် ပူးပေါင်းဆောင်ရွက်မှုအတွက် Discord ပေါင်းသင်းမှု

#### အလုပ်ရုံအင်္ဂါရပ်များ
- **တည်ဆောက်စဉ် ရှာဖွေရေး**: စကားလုံးများနှင့် သင်ခန်းစာ အလျင်မြန်တွေ့ရှိနိုင်ခြင်း
- **ကုဒ်ကူးယူခြင်း**: အကုဒ်ဥပမာများအားလုံးအတွက် ဟူးဘာလေးရပ် ရိုက်ကြည့်ကူးယူနိုင်မှု
- **အနက်/အဖြူ အပြောင်းအလဲ**: စိတ်ကြိုက်ပြောင်းလဲနိုင်မှု အတွက် မိုးလင်း/မှောင်မိုက် မုဒ်ထောက်ခံမှု
- **မြင်သာသောပုံရိပ်များ**: နားလည်မှုမြင့်မားစေရန် ဖန်တီးထားသော Screenshot များနှင့် စာချုပ်များ
- **အကူအညီပေါင်းသင်းမှု**: လူမှုအသိုင်းအဝိုင်းထောက်ခံမှုပေးရန်တိုက်ရိုက် Discord ဝင်ရောက်နိုင်မှု

### [v3.2.0] - 2025-09-17

#### အဓိကလမ်းကြောင်းပြောင်းလဲမှုများနှင့် အခန်းအလိုက် သင်ယူမှုစနစ်
**ဤဗားရှင်းသည် အပြည့်အစုံရှိသော ခေါင်းစဉ်အခြေပြု သင်ကြားမှုဖွဲ့စည်းမှုကို မိတ်ဆက်ပေးပြီး၊ မည်သည့်အပိုင်းဖြင့်မဆို လွယ်ကူစွာလမ်းညွှန်နိုင်သော ပလက်ဖောင်းတစ်ခုအတွက် တိုးတက်မှုတစ်ခုဖြစ်သည်။**

#### ထည့်သွင်းခဲ့သည်
- **📚 ခေါင်းစဉ်အခြေပြု သင်ကြားမှုစနစ်**: သင်ခန်းစာအားလုံးကို အဆင့်မြှင့်တင်သော ၈ ခေါင်းစဉ်သို့ ပြန်လည်ဖွဲ့စည်းခြင်း
  - ခေါင်းစဉ် ၁: အခြေခံနှင့် အရေးကြီးအစ (⭐ - ၃၀-၄၅ မိနစ်)
  - ခေါင်းစဉ် ၂: AI-ပထမ အဆင့် ဖွံ့ဖြိုးတိုးတက်မှု (⭐⭐ - ၁-၂ နာရီ)
  - ခေါင်းစဉ် ၃: ဖွဲ့စည်းမှုနှင့် အတည်ပြုခြင်း (⭐⭐ - ၄၅-၆၀ မိနစ်)
  - ခေါင်းစဉ် ၄: အင်ဖရာစတီးချာ အဖြစ် ကုဒ်နှင့် ဖြန့်ချိခြင်း (⭐⭐⭐ - ၁-၁.၅ နာရီ)
  - ခေါင်းစဉ် ၅: Multi-Agent AI ဖြေရှင်းချက်များ (⭐⭐⭐⭐ - ၂-၃ နာရီ)
  - ခေါင်းစဉ် ၆: ကြိုတင် ဖြန့်ချိမှု စစ်ဆေးခြင်းနှင့် စီမံချက် (⭐⭐ - ၁ နာရီ)
  - ခေါင်းစဉ် ၇: ပြဿနာဖြေရှင်းခြင်းနှင့် ဒြပ်စင်ပြင်ဆင်ခြင်း (⭐⭐ - ၁-၁.၅ နာရီ)
  - ခေါင်းစဉ် ၈: ထုတ်လုပ်မှုနှင့် လုပ်ငန်းပုံစံများ (⭐⭐⭐⭐ - ၂-၃ နာရီ)
- **📚 အပြည့်အစုံ လမ်းညွှန်မှု စနစ်**: စာရွက်စာတမ်းအားလုံးတွင် စံနှုန်းမပြောင်းလဲသော ခေါင်းစဉ်နာမည်နှင့် အောက်ခြေ navigation များဖြင့် အတူတကွဖြစ်သည်။
- **🎯 တိုးတက်မှု လမ်းညွှန်မှု**: သင်ခန်းစာပြီးမြောက်မှု စစ်တမ်းနှင့် သင်ကြားမှုအတည်ပြုစနစ်
- **🗺️ သင်ကြားမှုလမ်းကြောင်း ညွှန်ကြားမှု**: အတွေ့အကြုံ အဆင့်နှင့် ရည်မှတ်များအတွက် ဖြတ်သန်းရန် အဓိက ဝင်ခွင့်နေရာများ
- **🔗 အပြန်အလှန် သွားလာမှု စနစ်**: ဆက်စပ်ခေါင်းစဉ်များနှင့် လိုအပ်ချက်များ ထောက်ပံ့ထားသော ဖိုင်များ

#### တိုးတက်စေသည်
- **README ဖွဲ့စည်းမှု**: ခေါင်းစဉ်အခြေပြု အစီအစဉ်ဖြင့် ဖွဲ့စည်းထားသော သင်ကြားရေးပလပ်ဖောင်းတစ်ခုသို့ ပြောင်းရွှေ့ခြင်း
- **စာရွက်စာတမ်း လမ်းညွှန်မှု**: စာမျက်နှာတိုင်းတွင် ခေါင်းစဉ် ပတ်ဝန်းကျင်နှင့် တိုးတက်မှု ဦးကြောင်းညွှန်ပြချက်များ အပါအဝင်
- **နမူနာအစီအစဉ်**: နမူနာများနှင့် ပုံစံများကို သင်ကြားရေးခေါင်းစဉ်နှင့် ချိတ်ဆက်ထားခြင်း
- **အရင်းအမြစ် ပေါင်းသင်းမှု**: Cheat sheet များ၊ မေးလ်များနှင့် သင်ကြားနိုင်သော လေ့လာမှုလမ်းညွှန်များကို သက်ဆိုင်ရာ ခေါင်းစဉ်များနှင့် ချိတ်ဆက်ခြင်း
- **အလုပ်ရုံပေါ်ပေါင်းစပ်မှု**: လက်တွေ့ လေ့ကျင့်ခန်းများကို အများဆုံး ခေါင်းစဉ် သင်ကြားမှု ရည်ရွယ်ချက်များနှင့် ချိတ်ဆက်ခြင်း

#### ပြောင်းလဲခဲ့သည်
- **သင်ကြားမှု တိုးတက်မှု**: လိုင်းနည်းလမ်းဖြင့် သက်ဆိုင်ရာ သင်ကြားမှုမှ ခေါင်းစဉ်အခြေပြုသို့ ပြောင်းလဲခြင်း
- **ဖွဲ့စည်းမှု တည်နေရာ**: တိုးတက်မှုပိုမိုကောင်းမွန်စေရန် ဖွဲ့စည်းမှုလမ်းညွှန်ကို ခေါင်းစဉ် ၃ အဖြစ် ကူးပြောင်းခြင်း
- **AI အကြောင်းအရာ ပေါင်းစပ်မှု**: သင်ကြားမှုခရီးလျှက် AI နှင့်ဆိုင်သော အကြောင်းအရာ ပေါင်းစပ်မှုပိုမိုကောင်းမွန်စေရန်
- **ထုတ်လုပ်မှု အကြောင်းအရာ**: အဆင့်မြင့် ပုံစံများကို အဆိုပါ ခေါင်းစဉ် ၈ အောက်တွင် ချုပ်ဆိုကာ လုပ်ငန်းသင်ယူသူများအတွက် စုစည်းထားခြင်း

#### တိုးတက်စေသည်
- **အသုံးပြုသူ အတွေ့အကြုံ**: လမ်းညွှန်မှု ခြေလျင်မှတ်များနှင့် ခေါင်းစဉ် တိုးတက်မှု သင်္ကေတများကို ထင်ဟပ်စေရန်
- **လက်လွှမ်းမီမှု**: သင်ခန်းစာလျှောက်လွှာ စတိုင်များကို တိကျစေပြီးလွယ်ကူစေခြင်း
- **အသက်မွေးမှု ပရော်ဖက်ရှင်နယ် မျက်နှာပြင်**: တက္ကသိုလ်ပုံစံ သင်တန်းအစီအစဉ် ဩဇာသာဖြစ်အောင် ချဉ်းကပ်မှု
- **သင်ယူမှု ထိရောက်မှု**: သက်ဆိုင်ရာ အကြောင်းအရာများ ရှာဖွေရာ အချိန်တစ်စိတ်တစ်ပိုင်း လျော့ချရန်

#### နည်းပညာဆိုင်ရာ အကောင်အထည်ဖော်မှု
- **လမ်းညွှန် ခေါင်းစဉ်များ**: စာရွက်စာတမ်း ၄၀ ကျော်တွင် ခေါင်းစဉ် အတိုင်း လမ်းညွှန်မှု စံမှတ်တမ်းတက်ဖွဲ့စည်းခြင်း
- **အောက်ခြေ လမ်းညွှန်မှု**: တိုးတက်မှု ဦးကြောင်းညွှန်ပြချက်နှင့် ခေါင်းစဉ် ပြည့်စုံမှု သင်္ကေတများ
- **အပြန်အလှန် ဆက်သွယ်မှု**: သတ်မှတ်ထားသော အတွင်းဆက်သွယ်မှု စနစ်ဖြင့် ဆက်စပ် အယူအဆများကို ချိတ်ဆက်ထားခြင်း
- **ခေါင်းစဉ် မြေပုံဆွဲခြင်း**: နမူနာများနှင့် ပုံစံများကို သင်ကြားမှု ရည်ရွယ်ချက်များနှင့် တိကျစွာချိတ်ဆက်ခြင်း

#### သင်ယူမှုလမ်းညွှန် တိုးတက်မှု
- **📚 အပြည့်အဝ သင်ယူရမည့် ရည်ရွယ်ချက်များ**: ၈ ခေါင်းစဉ်စနစ်နှင့် ကိုက်ညီစေရန် သင်ယူမှု လမ်းညွှန်ကို ပြန်ဖွဲ့စည်းခြင်း
- **🎯 ခေါင်းစဉ်အခြေပြု သုံးသပ်ခြင်း**: ခေါင်းစဉ်တိုင်းတွင် သီးသန့် ရည်ရွယ်ချက်များနှင့် လက်တွေ့ လေ့ကျင့်ခန်းများ ပါဝင်သည်
- **📋 တိုးတက်မှု စစ်တမ်း**: သီတင်းပတ်အလိုက် သင်ယူမှု အချိန်ဇယားနှင့် တိုင်းတာနိုင်သော ရလဒ်များ၊ ပြီးမြောက်မှုစာရင်း
- **❓ သုံးသပ်မေးခွန်းများ**: ခေါင်းစဉ်တိုင်းအတွက် နည်းပညာပိုင်း အတည်ပြုမေးခွန်းများနှင့် ပရော်ဖက်ရှင်နယ်ရလဒ်များ
- **🛠️ လက်တွေ့ လေ့ကျင့်ခန်းများ**: လက်တွေ့ဖြန့်ချိမှု ရှုမြင်နေလေ့ကျင့်ခန်းများနှင့် ပြဿနာဖြေရှင်းမှု
- **📊ကျွမ်းကျင်မှု တိုးတက်မှု**: အခြေခံအယူအဆမှ စ၍ လုပ်ငန်းထဲရောက်သည့် ပုံစံများအထိ ရှင်းလင်းစွာတိုးတက်မှု၊ အသက်မွေးမှုအတွက် အာရုံစိုက်မှု
- **🎓 အသိအမှတ်ပြုဆုစနစ်**: ပရော်ဖက်ရှင်နယ် တိုးတက်မှု ရလဒ်များနှင့် လူမှုအသိုင်းအဝိုင်း မှတ်ပုံတင်ခြင်းစနစ်
- **⏱️ အချိန်စာရင်းစီမံခန့်ခွဲမှု**: အသီးသီးသော နောက်တော်တစ်ကြိမ်သုံး ပြည့်စုံစီမံကိန်းနှင့် မိုင်လ်စတုံးအတည်ပြုခြင်း

### [v3.1.0] - 2025-09-17

#### တိုးတက်မွေ့မြသော လုပ်ဆောင်သူအများစု AI ဖြေရှင်းချက်များ
**ဤဗားရှင်းသည် လုပ်ဆောင်သူအများစု၏ လက်လီရောင်းချမှု ဖြေရှင်းချက်များကို ကောင်းမွန်သော အမည်ပေးခြင်းနှင့် တိုးတက်သောစာတမ်းများဖြင့် တိုးတက်စေသည်။**

#### ပြောင်းလဲသွားသည်
- **အများပြည်သူ​​အေးဂျင့် အသုံးအနှုန်း**: လူသုံးစွဲသူ အသိပညာပိုမြင့်စေရန် ဆိုင်ကအေးဂျင့်ကို "Customer agent" ပြောင်းလဲအသုံးပြုခြင်း
- **အေးဂျင့် အင်တာဗျူတာ**: အားလုံးအတွက် စည်းမျဉ်းတူလျက် "Customer agent" အမည်ဖြင့် အချက်အလက်၊ ARM ပုံစံများနှင့် ကုဒ်နမူနာများကို ပြုပြင်အသုံးပြုခြင်း
- **ဖွဲ့စည်းမှု နမူနာများ**: အေးဂျင့် ဖွဲ့စည်းမှု ပုံစံများကို နာမည်ပုံစံများ အပ်ဒိတ်ပြုလုပ်ပြီး ခေတ်မီစေရန်
- **စာရွက်စာတမ်း ညီညွတ်မှု**: အားလုံးရဲ့ရည်ညွှန်းမှုများကို ပရော်ဖက်ရှင်နယ်၊ ဖော်ပြချက်ထည့်သော အေးဂျင့်အမည်များဖြင့်သေချာစေရန်

#### တိုးတက်အောင်မြင်မှု
- **ARM Template Package**: retail-multiagent-arm-template ကို Customer agent ပြုပြင်ပြီး အသုံးပြုခြင်း
- **ဖွဲ့စည်းမှု ရုပ်ပုံတည်ဆောက်မှုများ**: Mermaid diagram များကို အေးဂျင့် အမည်အသစ်များဖြင့် သစ်တမ်းပြုလုပ်ခြင်း
- **ကုဒ် နမူနာများ**: Python class များနှင့် အကောင်အထည်ဖော်နမူနာများတွင် CustomerAgent အမည်အသုံးပြုခြင်း
- **ပတ်ဝန်းကျင် အပြောင်းအလဲများ**: deployment စာရင်းအစီအစဉ်အားလုံးတွင် CUSTOMER_AGENT_NAME ကုဒ်များအသုံးပြုသောပြင်ဆင်မှု

#### တိုးတက်မှုများ
- **Developer အတွေ့အကြုံ**: အေးဂျင့် တာဝန်နှင့် အခန်းကဏ္ဍများကို ပိုမိုရှင်းလင်းစွာစာရွက်စာတမ်းတွင်ဖေါ်ပြခြင်း
- **ထုတ်လုပ်မှု အသင့်ဖြစ်မှု**: စီးပွားရေးဖိုင်နာမ်နည်းလမ်းများနှင့်ပိုမိုကိုက်ညီမှု
- **သင်ယူမှု ပစ္စည်းများ**: ပိုမိုနားလည်နိုင်သော အေးဂျင့် အမည်ပုံစံများဖြင့် ပြုလုပ်ခြင်း
- **Template အသုံးပြုရလွယ်မှု**: အေးဂျင့်လုပ်ဆောင်ချက်နှင့် deployment ပုံစံများကို ဖတ်ရှုနားလည်ရလွယ်ကူခြင်း

#### နည်းပညာ အသေးစိတ်
- Mermaid architecture diagram များကို CustomerAgent ခေါ်အမည်ဖြင့် အပ်ဒိတ်တင်ခြင်း
- Python နမူနာများတွင် CoraAgent class များကို CustomerAgent ဖြင့်အစားထိုးခြင်း
- ARM template JSON ဖိုင်များကို "customer" အေးဂျင့် အမျိုးအစားအသစ်ဖြင့် ပြောင်းလဲခြင်း
- ပတ်ဝန်းကျင်အပြောင်းအလဲများကို CORA_AGENT_* မှ CUSTOMER_AGENT_* ပုံစံအားအသုံးပြုခြင်း
- Deployment command များနှင့် container ဖွဲ့စည်းမှုများအားလုံးကို သစ်တမ်းပြုလုပ်ခြင်း

### [v3.0.0] - 2025-09-12

#### အကြီးစားပြောင်းလဲမှုများ - AI Developer ဦးတည်မှုနှင့် Microsoft Foundry ပေါင်းစည်းမှု
**ဤဗားရှင်းသည် စုစည်းမှုကို AI ဦးတည်မှု သင်ကြားမှုအရ ပြောင်းလဲပြီး Microsoft Foundry ပေါင်းစည်းမှုရှိသော အရင်းအမြစ်တစ်ခုဖြစ်စေသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🤖 AI-ပထမအဆင့် သင်ယူမှု လမ်းကြောင်း**: AI developer များနှင့် အင်ဂျင်နီယာများအတွက် ပြန်လည်ဖွဲ့စည်းခြင်း
- **Microsoft Foundry ပေါင်းစည်းမှု လမ်းညွန်စာတမ်း**: AZD နှင့် Microsoft Foundry ဝန်ဆောင်မှုများ ချိတ်ဆက်ခြင်း အတွက် စာရွက်စာတမ်း ကြီး
- **AI မော်ဒယ်တင်ခြင်း ပုံစံများ**: မော်ဒယ်ရွေးချယ်ခြင်း၊ ဖွဲ့စည်းခြင်းနှင့် ထုတ်လုပ်မှု တင်ဆက်မှုနည်းလမ်းများ ဖော်ပြချက်
- **AI ဆွေးနွေးပြုလုပ်ခြင်း ဓါတ်ဆောင်ခန်း**: ၂-၃ နာရီကြာ AI application များကို AZD တင်ဖို့ လက်တွေ့လုပ်ကိုင်ခြင်း
- **ထုတ်လုပ်မှု AI လုပ်ငန်းစဥ်အတွက် အကောင်းဆုံးလုပ္နည္းများ**: စီးပွားရေးအသုံးပြုမှုအတွက် တိုးတက်မှု၊ စောင့်ကြပ်မှုနှင့် ဘေးကင်းမှု စနစ်များ
- **AI အထူးပြု ပြဿနာကောင်းစီမံ ချဉ်းကပ်မှုလမ်းညွန်**: Microsoft Foundry မော်ဒယ်များ၊ Cognitive Services နှင့် AI တင်ခြင်း ဆိုင်ရာပြဿနာများ အတွက် စနစ်တကျ သုံးသပ်ချက်
- **AI ပုံစံ ဖန်တီးမှု ပြခန်း**: Microsoft Foundry ပုံစံများ ရှာဖွေကြည့်ရှုနိုင်သော နှုန်းထားရှိသော စုစည်းမှု
- **ဆွေးနွေးပွဲ ပစ္စည်းများ**: လက်တွေ့လုပ်ငန်းစဉ်များနှင့် ကိုးကားစာရွက်စာတမ်းများပါဝင်သော ပြည့်စုံသော အဆောက်အဦ

#### တိုးတက်အောင်မြင်မှု
- **README ဖွဲ့စည်းမှု**: AI developer ဦးတည်ပြီး Microsoft Foundry Discord မှ လူထုစိတ်ဝင်စားမှု ၄၅% အတည်ပြုချက်ပါ
- **သင်ယူမှု လမ်းကြောင်းများ**: ကျောင်းသားများနှင့် DevOps အင်ဂျင်နီယာများအတွက် နိုင်ငံတကာ လမ်းကြောင်းပါသော AI developer လမ်းကြောင်း
- **ပုံစံ ပုံးချုပ်အသုံးပြုမှု**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart တို့အား AI ပုံစံများအဖြစ် အထူးပြုခေါ်ဆိုမှု
- **လူထု ပေါင်းစည်းမှု**: Discord လူထုအထူးတန်းချုပ် ထောက်ခံမှု AI ချန်နယ်များနှင့် ဆွေးနွေးမှုများ မြှင့်တင်ခြင်း

#### ဘေးကင်းရေးနှင့် ထုတ်လုပ်မှု ဦးတည်ချက်
- **Managed Identity ပုံစံများ**: AI အတွက် အတည်ပြုခြင်းနှင့် ဘေးကင်းမှု စနစ်များ
- **ကုန်ကျစရိတ်သက်သာစေရေး**: Token အသုံးပြုမှု စစ်ဆေးခြင်းနှင့် အတွက်ပုံကော် စီမံခန့်ခွဲမှု
- **မလ်တီဒေသ တင်ဆက်မှု**: ကမ္ဘာလုံးဆိုင်ရာ AI application တင်ဆက်မှုနည်းလမ်းများ
- **ဆောင်ရွက်မှု စောင့်ကြည့်မှု**: AI အတွက် စံချိန်များနှင့် Application Insights ပေါင်းစည်းမှု

#### စာရွက်စာတမ်း အရည်အသွေး
- **တိုက်ရိုက်သင်တန်းအစီအစဉ်**: အခြေခံမှ တိုးတက်ကျွမ်းကျင် AI တင်ခြင်း ပုံစံများ အဆင့်ဆင့် ဖော်ပြမှု
- **ပြဿနာကင်းပါသော URL များ**: အပြင်အဆင်အထဲရှိ ကြည့်ရှုနိုင်သော အချက်အလက် URL များအားလုံး အတည်ပြုထားသည်
- **ပြည့်စုံသော ရည်ညွှန်းချက်များ**: အတွင်းပိုင်း စာရွက်စာတမ်းလင့်များအားလုံး အတည်ပြုပြီး အသုံးပြုနိုင်ခြင်းရှိသည်
- **ထုတ်လုပ်ရန် အသင့်ဖြစ်သော**: အမှန်တကယ် အသုံးချနိုင်သော စီးပွားရေး ပုံစံများပါဝင်သည်

### [v2.0.0] - 2025-09-09

#### အကြီးစား ပြောင်းလဲမှုများ - စုစည်းမှု ပြန်လည်ဖွဲ့စည်းမှုနှင့် ပရော်ဖက်ရှင်နယ်တိုးတက်မှု
**ဤဗားရှင်းသည် စုစည်းမှု ဖွဲ့စည်းမှုနှင့် အကြောင်းအရာဖော်ပြမှုများအတွက် အရေးပါပြောင်းလဲမှုတစ်ခုဖြစ်သည်။**

#### ထည့်သွင်းခဲ့သည်
- **သင်ကြားမှု ဖွဲ့စည်းမှု**: အားလုံးစာရွက်စာတမ်း စာမျက်နှာများတွင် နိဒါန်း၊ သင်ယူရည်ရွယ်ချက်နှင့် သင်ယူမှုရလဒ် အပိုင်းများ ထည့်သွင်းခြင်း
- **လမ်းညွှန် ပြောင်းလဲမှု စနစ်**: သင်ကြားမှု တိုးတက်မှုအတွက် အားလုံးစာရွက်စာတမ်း များတွင် ရှေ့တွင်/နောက်တွင် သင်တန်းလင့်များ ထည့်သွင်းခြင်း
- **သင်တန်းလမ်းညွှန်စာအုပ်**: သင်ယူရည်ရွယ်ချက်များ၊ လေ့ကျင့်ခန်းများနှင့် သုံးသပ်မှု ပစ္စည်းများ ပါဝင်သော study-guide.md ဖိုင် ပြုလုပ်ခြင်း
- **ပရော်ဖက်ရှင်နယ် ဖော်ပြမှု**: အသုံးပြုရလွယ်ပြီး ပရော်ဖက်ရှင်နယ်ပုံစံတွင် emoji icon များဖယ်ရှားခြင်း
- **အရာဝတ္တု ဖွဲ့စည်းမှု တိုးတက်မှု**: သင်ယူမှု ပစ္စည်းများ၏ အစီအစဉ်နှင့် စီးဆင်းမှုကောင်းမွန်မှုမြှင့်တင်ခြင်း

#### ပြောင်းလဲမှုများ
- **စာရွက်စာတမ်းပုံစံ**: သင်ယူမှုအရ လိုက်လျောညီထွေဖြစ်အောင် စံနှုန်းတူဖွဲ့စည်းမှုချထားခြင်း
- **လမ်းညွှန် စီးဆင်းမှု**: အားလုံး သင်ယူမှု ပစ္စည်းများတွင် တရားဝင်စနစ်တကျ အားဖြင့်ရွေ့လျားမှု ကျင့်သုံးခြင်း
- **အကြောင်းအရာ ဖော်ပြမှု**: ပုံစံဆွဲခြင်းအား ဖယ်ရှားပြီး ပရော်ဖက်ရှင်နယ် ထင်ဟပ်မှုမြင့်စေခြင်း
- **လင့်ခ် ဖွဲ့စည်းမှု**: အတွင်းဆက်သွယ်မှုလမ်းကြောင်းအသစ် ပံ့ပိုးအတွက် အတွင်းလင့်များအား အပ်ဒိတ်ပြုလုပ်ခြင်း

#### တိုးတက်အောင်မြင်မှု
- **အသုံးချမှုလွယ်ကူမှု**: မျက်နှာဖုံးနဲ့ပတ်သက်တဲ့ emoji များကိုဖယ်ရှားခြင်း
- **ပရော်ဖက်ရှင်နယ်ပုံစံ**: ပန်းထောင်များသွားသော ပုံစံနဲ့ စနစ်တကျ ဖော်ပြခြင်း
- **သင်ယူမှု အတွေ့အကြုံ**: တိကျကျ သတ်မှတ်ချက်များနှင့် ရလဒ်အတည်ပြုပြီး သင်တန်းအဆင့်များစီစဉ်မှု
- **အကြောင်းအရာ စည်းမျဉ်း**: ဆက်စပ်ချက်များနှင့် စနစ်တကျ တိုးတက်မှု ရရှိစေခြင်း

### [v1.0.0] - 2025-09-09

#### ပထမဆုံး ထုတ်ဝေမှု - ပြည့်စုံသော AZD သင်ကြားမှု စုစည်းမှု

#### ထည့်သွင်းခဲ့သည်
- **အခြေခံ စာရွက်စာတမ်း ဖွဲ့စည်းမှု**
  - လက်တွေ့ စတင်လုပ်ကိုင်မှု လမ်းညွှန် စီးရီး
  - deployment နှင့် provisioning စာရွက်စာတမ်း ပြည့်စုံစွာ ဖော်ပြမှု
  - ပြဿနာအဖြေရှာခြင်းနှင့် debugging လမ်းညွှန်စာရွက်များ
  - မတင်မီ စစ်ဆေးမှုကိရိယာများနှင့် လုပ်ထုံးလုပ်နည်းများ

- **စတင်စီစဉ်မှု မော်ဂျူး**
  - AZD အခြေခံများ: အဓိကအယူအဆနှင့် စကားလုံးများ
  - တပ်ဆင်မှု လမ်းညွှန်: ပလက်ဖောင်းလိုက် လုပ်ထုံးလုပ်နည်းများ
  - ဖွဲ့စည်းမှု လမ်းညွှန်: ပတ်ဝန်းကျင် စီမံခြင်းနှင့် အတည်ပြုခြင်း
  - ပထမဆုံး ပရောဂျက် သင်ကြားမှု: လက်တွေ့ လေ့ကျင့်မှု အဆင့်လိုက်

- **deployment နှင့် provisioning မော်ဂျူး**
  - deployment လမ်းညွှန်: အစဉ်အလာ ထပ်တူလုပ်နေမှု စာရွက်စာတမ်း
  - provisioning လမ်းညွှန်: Infrastructure as Code မှာ Bicep ကို အသုံးပြုခြင်း
  - ထုတ်လုပ်မှု လုပ်ငန်းစဉ် ကျင့်သုံးမှုအကောင်းဆုံး ရည်ညွှန်းမှု
  - multi-service ဖွဲ့စည်းမှု ပုံစံများ

- **မတင်မီ စစ်ဆေးမှု မော်ဂျူး**
  - တာဝန်ခွဲရေး စီမံကိန်း: Azure resource ရရှိနိုင်မှု စစ်ဆေးခြင်း
  - SKU ရွေးချယ်မှု: ဝန်ဆောင်မှု အဆင့် အပြည့်အစုံ လမ်းညွှန်
  - စစ်ဆေးမှု အလိုအလျောက် စင်မြင်ချက်များ (PowerShell နှင့် Bash စာရွက်)
  - ကုန်ကျစရိတ် ခန့်မှန်းခြေ နှင့် ဘတ်ဂျက် စီမံချက် ကိရိယာများ

- **ပြဿနာရှာဖွေခြင်း မော်ဂျူး**
  - ပုံမှန်ထိခိုက်မှုများ: ရင်ဆိုင်ကြုံတွေ့ရသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
  - Debugging လမ်းညွှန်: စနစ်တကျ ပြဿနာရှာဖွေမှုနည်းပညာများ
  - အဆင့်မြင့် စစ်ဆေးမှု နည်းလမ်းများနှင့် ကိရိယာများ
  - ဆောင်ရွက်မှု ဆန်းစစ်ခြင်း နှင့် တိုးတက်မှု

- **အရင်းအမြစ်များနှင့် ရည်ညွှန်းချက်များ**
  - ကိရိယာ အချက်အလက်စာရွက်: အဓိကကွန်မန်းများ အတော်လေးလျင်မြန် ရှာဖွေရန်
  - အကြောင်းအရာ စားတွဲ: အချက်အလက်နဲ့ akronym ဖေါ်ပြချက်များ ပြည့်စုံ
  - မေးခွန်းများ: ပုံမှန် မေးခွန်းများအတွက် အသေးစိတ် အဖြေများ
  - အပြင်ရင်းမြစ် Link များနှင့် လူထုဆက်သွယ်မှု

- **နမူနာများနှင့် ပုံစံများ**
  - ရိုးရှင်းသော 웹 application နမူနာ
  - စတတစ် website deployment ပုံစံ
  - ကွန်တိန်နာ application ဖွဲ့စည်းမှု
  - ဒေတာဘေ့စ် ပေါင်းစည်းမှု ပုံစံများ
  - microservices architecture နမူနာများ
  - Serverless function အကောင်အထည်ဖော်မှုများ

#### လက္ခဏာများ
- **ဗဟို စနစ်များနှင့် သက်ဆိုင်ရာ platform များထောက်ပံ့မှု**: Windows, macOS နှင့် Linux အတွက် တပ်ဆင်ခြင်းနှင့် ဖွဲ့စည်းမှု လမ်းညွှန်
- **အတန်းအဆင့် များစွာ**: ကျောင်းသားမှ ပရော်ဖက်ရှင်နယ် developer အထိ အကြောင်းအရာ များကို ဒီဇိုင်းလုပ်ထားခြင်း
- **လက်တွေ့အခြေပြု အာရုံစူးစိုက်မှု**: လက်တွေ့နမူနာများနှင့် အမှန်တကယ် ရလဒ်များပါ
- **ပြည့်စုံစွာ ဖုံးလွှမ်းမှု**: အခြေခံအယူအဆမှ စီးပွားရေး အဆင့်မြင့် ပုံစံများအထိ
- **ဘေးကင်းမှု ဦးစားပေးမှု**: ဘေးကင်းရေးအကောင်းဆုံး လမ်းညွှန်ချက်များ ထည့်သွင်းထားခြင်း
- **ကုန်ကျစရိတ် သက်သာစေရေး**: စရိတ်ထိရောက်စွာ deployment နှင့် resource စီမံခြင်း အတွက် လမ်းညွှန်ချက်များ

#### စာရွက်စာတမ်း အရည်အသွေး
- **အသုံးချပြီး စမ်းသပ်ထားသော ကုဒ် နမူနာများ**: လက်တွေ့ ပြုလုပ်နိုင်သောကုဒ်နမူနာများ
- **အဆင့်လိုက် လမ်းညွှန်ချက်များ**: တိကျသေချာသော လမ်းညွှန်ချက်များ
- **ပြဿနာကင်းရှင်းမှု စနစ်များ**: ပုံမှန်များသက်ဆိုင်သော ပြဿနာများအတွက် ဖြေရှင်းနည်းများ
- **အကောင်းဆုံး လုပ်ထုံးလုပ်နည်း ပေါင်းစပ်မှု**: စက်မှုလုပ်ငန်း စံနှုန်းများနှင့် တိုက်ရိုက်စနစ်များ
- **ဗားရှင်းလိုက်ဖက်ညီမှု**: လတ်တလော Azure ဝန်ဆောင်မှုများနှင့် azd features နှင့် ကိုက်ညီမှုရှိသည်

## မျှော်မှန်းထားသော နောင်တစ်ကြိမ်တိုးတတ်မှုများ

### Version 3.1.0 ( မျှော်မှန်းထားသည် )
#### AI ပလက်ဖောင်း တိုးချဲ့မှု
- **မော်ဒယ်စနစ် များစွာ ထောက်ပံ့မှု**: Hugging Face, Azure Machine Learning နှင့် ကိုယ်ပိုင်မော်ဒယ်များ ပေါင်းစည်းခြင်း ပုံစံများ
- **AI Agent Frameworks**: LangChain, Semantic Kernel, AutoGen တို့အတွက် template များ
- **အဆင့်မြင့် RAG ပုံစံများ**: Azure AI Search ရှေ့က Pinecone, Weaviate စသည့် Vector database ရွေးချယ်စရာများ
- **AI ကြည့်ရှုမှု**: မော်ဒယ် စွမ်းဆောင်ရည်၊ token အသုံးပြုမှုနှင့် ဖြေကြားမှု အရည်အသွေးမြှင့်တင်သော စောင့်ကြည့်မှု

#### Developer အတွေ့အကြုံ
- **VS Code Extension**: AZD နှင့် Microsoft Foundry ပေါင်းစပ် ထွန်းကားရေး အတွေ့အကြုံ
- **GitHub Copilot ပေါင်းစည်းမှု**: AI ကူညီအားဖြည့်သည့် AZD template ဖန်တီးခြင်း
- **အပြန်အလှန် သင်ကြားမှုများ**: AI အခြေအနေများအတွက် လက်တွေ့ coding လေ့ကျင့်မှုများ နှင့် အလိုအလျောက် စစ်ဆေးမှု
- **ဗီဒီယို အကြောင်းအရာ**: AI deployment များအတွက် မြင်သာသော သင်တန်းဗီဒီယိုများ

### Version 4.0.0 ( မျှော်မှန်းထားသည် )
#### စီးပွားရေး AI ပုံစံများ
- **အုပ်ချုပ်မှု စနစ်**: AI မော်ဒယ် စီမံခန့်ခွဲမှု၊ ကိုက်ညီမှုနှင့် စစ်ဆေးမှု
- **အများနှင့် ဖိတ်ပေါ် AI ဝန်ဆောင်မှု**: ဖောက်သည်အစုအဝေး များ့ AI ဝန်ဆောင်မှု ထောက်ပံ့မှု ပုံစံများ
- **Edge AI ထုတ်လုပ်မှု**: Azure IoT Edge နှင့် container instances ပေါင်းစပ်မှု
- **Hybrid Cloud AI**: မလ်တီ-ကလောင်နှင့် hybrid deployment ပုံစံများ

#### အဆင့်မြင့် လုပ်ဆောင်ချက်များ
- **AI Pipeline Automation**: Azure Machine Learning pipeline များနှင့် MLOps ပေါင်းစည်းမှု
- **အဆင့်မြင့် ဘေးကင်းမှု**: Zero-trust ပုံစံများ၊ ကိုယ်ပိုင် အဆုံးအဖြတ်နှင့် အဆင့်မြင့် အန္တရာယ်ကာကွယ်မှု
- **စွမ်းဆောင်ရည် မွမ်းမံခြင်း**: မြင့်မားသော throughput AI အတွက် တိုးတက်သွားရေးနှင့် အရွယ်ပမာဏ ချိန်ညှိမှု
- **ကမ္ဘာလုံးဆိုင်ရာ ဖြန့်ချိမှု**: Content delivery နှင့် edge caching ပုံသွင်များ

### Version 3.0.0 ( မျှော်မှန်းထားသည် ) - ယခုထုတ်ဝေမှု ဖြင့် အစားထိုးပြီး
#### မျှော်မှန်းထားသော ထည့်သွင်းချက်များ - v3.0.0 တွင် ဆောင်ရွက်ပြီး
- ✅ **AI ဦးတည်သော အကြောင်းအရာများ**: Microsoft Foundry ပေါင်းစည်းမှု စုံလင်စွာ (ပြီးစီး)
- ✅ **အပြန်အလှန် သင်ကြားမှုများ**: လက်တွေ့ AI ဆွေးနွေးပွဲ (ပြီးစီး)
- ✅ **အဆင့်မြင့် ဘေးကင်းမှုမော်ဂျူး**: AI အတွက် အထူးဘေးကင်းမှု ပုံစံများ (ပြီးစီး)
- ✅ **လုပ်ဆောင်မှုအရှိန်မြှင့်ခြင်း**: AI လုပ်ငန်းအတွက် တိုးတက်မှု နည်းလမ်းများ (ပြီးစီး)

### Version 2.1.0 ( မျှော်မှန်းထားသည် ) - v3.0.0 တွင် အစိတ်အပိုင်း ဆောင်ရွက်ပြီး
#### သေးငယ်သည့် တိုးတက်မှုများ - ယနေ့ထုတ်ဝေမှုတွင် ဂဏန်းအတော်များပြီ
- ✅ **နမူနာ အပိုင်းများ**: AI ဦးတည် ချဉ်းကပ်မှု deployment အခြေအနေများ (ပြီးစီး)
- ✅ **FAQ တိုးချဲ့မှု**: AI အထူးပြု မေးခွန်းများနှင့် ပြဿနာရှာဖွေမှု (ပြီးစီး)
- **ကိရိယာ ပေါင်းစည်းမှု**: IDE နှင့် editor ပေါင်းစည်းမှုလမ်းညွှန်များ တိုးတက်စေရန်
- ✅ **စောင့်ကြည့်မှု တိုးချဲ့မှု**: AI အထူးကိရိယာအသုံးပြုမှုနှင့် သတိပေးပုံစံများ (ပြီးစီး)

#### နောင်လာ မိနစ်တွင် စီစဉ်ထားသည်
- **မိုဘိုင်းဆက်သွယ်ရေးအတွက် သင့်လျော်သော စာရွက်စာတမ်း**: မိုဘိုင်း သင်ကြားမှုအတွက် အကြမ်းဖျင်း ဒီဇိုင်း
- **အော့ဖ်လိုင်း အသုံးပြုခွင့်**: စာရွက်စာတမ်း အဖွဲ့အစည်းများကို ဒေါင်းလုပ်လုပ်နိုင်ခြင်း
- **IDE ပေါင်းစည်းမှု မြှင့်တင်ခြင်း**: AZD + AI လုပ်ငန်းစဥ်များအတွက် VS Code extension
- **လူထု ဒိုင်ယာဂရမ်**: လူထု စာရင်း အချက်အလက်များနှင့် ပူးပေါင်းဆောင်ရွက်မှု ကိရိယာများ

## ChangeLog သို့ အထောက်အပံ့ပြုခြင်း

### ပြောင်းလဲချက်များ ကိုรายงานခြင်း
ဤ repository တွင် အထောက်အပံ့ပြုရာတွင် changelog မှတ်တမ်းတွင် အောက်ပါ အချက်များပါဝင်ရန် သေချာစေရန်။

1. **ဗားရှင်း နံပါတ်**: semantic versioning အရ (major.minor.patch)
2. **ရက်စွဲ**: ထုတ်ဝေသည့် ရက်စွဲ၊ YYYY-MM-DD ပုံစံဖြင့်
3. **အမျိုးအစား**: ထည့်သွင်းခဲ့သည်၊ ပြောင်းလဲခဲ့သည်၊ ပယ်ဖျက်သည်၊ စီမံချက် မိမိ၊ ပြေအုံ့တပ်၏သော တိုးချဲ့ခြင်းများ
4. **ရှင်းလင်းသော ဖော်ပြချက်**: ဘာတွေပြောင်းလဲခဲ့ကြောင်း အကျဉ်းချုပ်ဖော်ပြချက်
5. **သက်ရောက်မှု အကဲဖြတ်ချက်**: မရှိ၊ အသုံးပြုသူတွေဘယ်လိုသက်ရောက်မယ်ဆိုတာ

### ပြောင်းလဲမှု အမျိုးအစားများ

#### ထည့်သွင်းခဲ့သည်
- အသစ်သော လုပ်ဆောင်ချက်များ၊ စာရွက်စာတမ်း အပိုင်းများ သို့မဟုတ် အခွင့်အလမ်းများ
- အသစ်သော နမူနာများ၊ အစီအစဉ်များ သို့မဟုတ် သင်ယူမှု အရင်းအမြစ်များ
- ပိုဆောင်းကိရိယာများ၊ စာရင်းများ သို့မဟုတ် အထောက်အကူပြုအစီအစဉ်များ

#### ပြောင်းလဲခဲ့သည်
- လက်ရှိ လုပ်ဆောင်ချက် သို့မဟုတ် စာရွက်စာတမ်း ပြုပြင်ပြောင်းလဲမှုများ
- ပိုမိုရှင်းလင်း တိကျစေရန် ပြုပြင်ပြောင်းလဲမှုများ
- အကြောင်းအရာ သို့မဟုတ် ဖွဲ့စည်းမှု ပြန်လည်ပိုင်းခြားပြင်ဆင်မှုများ

#### ပယ်ဖျက်ထားသည်
- အဆုတ်အရာများ သို့မဟုတ် နည်းလမ်းများ ခုနှစ်တိုင်း ပယ်ဖျက်နေခြင်း
- စာရွက်စာတည်းအပိုင်းများ ပယ်ဖျက်မည့် စီမံချက်များ
- ပိုမိုကောင်းမွန်သော နည်းလမ်းများ ရှိနေသော နည်းလမ်းများ

#### ဖယ်ရှားခဲ့သည်
- သက်ဆိုင်ရာမဖြစ်တော့မှု များ၊ စာရွက်စာတမ်း သို့မဟုတ် နမူနာများ ဖယ်ရှားခြင်း
- အဟောင်းပါ အချက်အလက်များ သို့မဟုတ် ပယ်ဖျက်ထားသော နည်းလမ်းများ
- ။ ထပ်တူတူရှိသော အချက်အလက်များ ညှပ်ပျက်ထုတ်ခြင်း

#### ပြင်ဆင်ပြီး
- စာရွက်စာတမ်း သို့မဟုတ် ကုဒ် အမှားများ ပြင်ဆင်ခြင်း
- ပေးပို့ထားသော ပြဿနာများဖြေရှင်းခြင်း
- တိကျမှန်ကန်မှုနှင့် လုပ်ဆောင်ချက် မြှင့်တင်မှုများ

#### ဘေးကင်းရေး
- ဘေးကင်းရေးနှင့်ဆိုင်သော တိုးတက်မှုများ သို့မဟုတ် ပြုပြင်မှုများ
- ဘေးကင်းရေး အကောင်းဆုံးလမ်းညွှန်ချက်များ ပြောင်းလဲမှုများ
- ဘေးကင်းရေး ဒဏ်ရာများ ဖြေရှင်းမှု

### Semantic Versioning လမ်းညွှန်ချက်များ

#### အကြီးစား ဗားရှင်း (X.0.0)
- အသုံးပြုသူ လုပ်ဆောင်ရန် လိုအပ်သော ပြောင်းလဲမှုများ
- အကြောင်းအရာ သို့မဟုတ် ဖွဲ့စည်းမှု ပြောင်းလဲမှုများ အရေးကြီး
- အခြေခံ နည်းလမ်း သို့မဟုတ် နည်းဗျူဟာ ပြောင်းလဲမှုများ

#### သေးငယ်သော ဗားရှင်း (X.Y.0)
- အသစ်သော လုပ်ဆောင်ချက်များ သို့မဟုတ် အကြောင်းအရာ ထည့်သွင်းချက်များ
- နောက်ကျောများနှင့် ကိုက်ညီမှု ထိန်းသိမ်းထားသော မြှင့်တင်မှုများ
- ပိုဆောင်းသော နမူနာများ၊ ကိရိယာများ သို့မဟုတ် အထောက်အကူ ပြု အရင်းအမြစ်များ

#### Patch ဗားရှင်း (X.Y.Z)
- အမှားအယွင်းများ ဖြေရှင်းမှုများ
- လက်ရှိအကြောင်းအရာအတွက် သေးငယ်သော မြှင့်တင်မှုများ
- ရှင်းလင်းချက်များနှင့် များသော အနည်းငယ်တိုးတက်မှုများ

## လူထု အကြံပြုချက်များနှင့် အကြံဉာဏ်များ

ဤသင်ကြားမှု အရင်းအမြစ်ကို မြှင့်တင်ရန် လူထုမှ အကြံပြုချက်များကို တက်တက်ကြွကြွ လက်ခံကြပါသည်။

### အကြံပြုမှု ပေးပို့နည်းများ
- **GitHub Issues**: ပြဿနာများ ပေးပို့ခြင်း သို့မဟုတ် မြှင့်တင်ရန် အကြံပေးခြင်း (AI နှင့် ပတ်သက်သော ပြဿနာများလက်ခံသည်)
- **Discord ဆွေးနွေးမှုများ**: Microsoft Foundry လူထုပိုင်းနှင့် တွဲဖက်ဆွေးနွေးခြင်း
- **Pull Requests**: အကြောင်းအရာ တိုးတက်အောင် တိုက်ရိုက် ဆောင်ရွက်တင်ပြခြင်း၊ အထူးသဖြင့် AI ပုံစံများနှင့် လမ်းညွန်များ
- **Microsoft Foundry Discord**: AZD + AI ဆွေးနွေးချက်များအတွက် #Azure ချန်နယ်တွင် ပါဝင်ဆွေးနွေးခြင်း
- **လူထုဝက်ဘ်ဘိုင်းများ**: ပိုမိုကျယ်ပြန့်သော Azure developer ဆွေးနွေးမှုများရဲ့ အစိတ်အပိုင်းအသီးသီးတွင် ပါဝင်ခြင်း

### အကြံပြုမှု အမျိုးအစားများ
- **AI အကြောင်းအရာ မှန်ကန်မှု**: AI ဝန်ဆောင်မှု ပေါင်းစည်းမှုနှင့် တင်ခြင်းအချက်အလက်များ ပြင်ဆင်ချက်များ
- **သင်ယူမှု အတွေ့အကြုံ**: AI developer သင်ကြားမှု စဉ်ဆက်မပြတ် ပိုမိုကောင်းမွန်အောင်အကြံပေးချက်များ
- **AI အကြောင်းအရာ မပါဝင်မှု**: အပို AI ပုံစံများ၊ ပုံစံ သို့မဟုတ် နမူနာများ တောင်းဆိုမှုများ
- **အသုံးပြုရလွယ်ကူမှု**: သင်ယူမှု လိုအပ်ချက်မျိုးစုံအတွက် တိုးတက်မှုများ
- **AI ကိရိယာ ပေါင်းစည်းမှု**: AI ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ် အကောင်းဆုံး ပေါင်းစည်းမူ အကြံပေးချက်များ
- **ထုတ်လုပ်မှု AI ပုံစံများ**: စီးပွားရေး AI deployment ပုံစံ တောင်းဆိုမှုများ

### တုံ့ပြန်ခြင်း ရည်မှန်းချက်
- **ပြဿနာတုံ့ပြန်မှု**: ဖော်ပြချက် ပြဿနာများအတွက် ၄၈ နာရီအတွင်း
- **အင်္ဂါရပ်တောင်းဆိုမှုများ**: တစ်ပတ်အတွင်း အကဲဖြတ်မှု
- **လူထု ပံ့ပိုးမှုများ**: တစ်ပတ်အတွင်း ပြန်လည်သုံးသပ်ခြင်း
- **ဘေးကင်းရေး ပြဿနာများ**: လျင်မြန်စွာ ဦးတည်ပြီး အရေးပါတဲ့ တုံ့ပြန်ချက်

## ထိန်းသိမ်းမှု အစီအစဉ်

### ပုံမှန် ပြင်ဆင်မှုများ
- **လစဉ် သုံးသပ်ခြင်းများ**: အကြောင်းအရာ ရှင်းလင်းမှုနှင့် link ပြန်လည်စစ်ဆေးခြင်း
- **လွန်ခဲ့သုံးလ များအတွက် ပြင်ဆင်မှုများ**: အကြီးစား ထည့်သွင်းချက်များနှင့် တိုးတက်မှုများ
- **နှစ်ပတ်လည် သုံးသပ်ခြင်းများ**: ပြန်လည်ဖွဲ့စည်းခြင်းစုံလင်မှု နှင့် တိုးတက်မှု
- **နှစ်တစ်ကြိမ် ထုတ်ဝေမှုများ**: အရေးပါ ဆန်းသစ်မှုများနှင့် ဗားရှင်းအသစ်များ ထုတ်ဝေခြင်း

### စောင့်ကြည့်မှုနှင့် အရည်အသွေး အာမခံမှု
- **အလိုအလျောက် စမ်းသပ်ခြင်း**: ကုဒ်ဥပမာများနှင့် လင့်ခ်များကို ပုံမှန် စစ်ဆေးခြင်း
- **အသိုင်းအဝိုင်း မှတုံ့ပြန်ချက် ပေါင်းစပ်ခြင်း**: အသုံးပြုသူ အကြံပြုချက်များကို ပုံမှန် ပေါင်းစပ်ထည့်သွင်းခြင်း
- **နည်းပညာ အပ်ဒိတ်များ**: နောက်ဆုံး Azure ဝန်ဆောင်မှုများနှင့် azd ဖြန့်ချိခြင်းများနှင့် ကိုက်ညီမှု
- **ဝင်ရောက်လွယ်ကူမှု စစ်ဆေးမှုများ**: မျှဝေဖွံ့ဖြိုးရေး နည်းလမ်းများအတွက် ပုံမှန် ပြန်လည်သုံးသပ်ခြင်း

## ဗားရှင်း ထောက်ပံ့မှု မူဝါဒ

### လက်ရှိ ဗားရှင်း ထောက်ပံ့မှု
- **နောက်ဆုံး အဓိက ဗားရှင်း**: ပုံမှန် အပ်ဒိတ်များနှင့် အပြည့်အစုံ ထောက်ပံ့မှု
- **ယခင် အဓိက ဗားရှင်း**: ၁၂ လအတွင်း လုံခြုံရေး အပ်ဒိတ်များနှင့် အရေးပေါ် ပြင်ဆင်မှုများ
- **အဟောင်း ဗားရှင်းများ**: အသိုင်းအဝိုင်း ထောက်ပံ့မှုသာဖြစ်ပြီး တရားဝင် အပ်ဒိတ် မရှိပါ

### ပြောင်းရွှေ့ခြင်း လမ်းညွှန်ချက်များ
အဓိက ဗားရှင်းများ ထွက်ရှိသည့်အခါ၊ ကျွန်ုပ်တို့ သည် ပေးပါသည်။
- **ပြောင်းရွှေ့မှု လမ်းညွှန်များ**: ခြေလှမ်းအလိုက် လမ်းညွှန်ချက်များ
- **ကိုက်ညီမှု မှတ်ချက်များ**: ပြောင်းလဲမှုများအကြောင်း အသေးစိတ်
- **ကိရိယာ ထောက်ပံ့မှု**: ပြောင်းရွှေ့မှုအတွက် scripts သို့မဟုတ် utilities များ
- **အသိုင်းအဝိုင်း ထောက်ပံ့မှု**: ပြောင်းရွှေ့မှု မေးခွန်းများအတွက် အထူးကဏ္ဍများ

---

**လမ်းညွှန်မှု**
- **ယခင် အခန်း**: [လေ့လာရေး လမ်းညွှန်](resources/study-guide.md)
- **နောက်တစ်ခန်း**: သို့ပြန်သွားရန် [Main README](README.md)

**လတ်တလောအခြေအနေကိုသိရှိထားရန်**: အသစ်ထွက်ရှိလာသောဗားရှင်းများနှင့် သင်ယူမှု ပစ္စည်းများအတွက် အရေးကြီးသော အပ်ဒိတ်များအတွက် ဒီ repository ကို ကြည့်ရှုရန် စောင့်ကြည့်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
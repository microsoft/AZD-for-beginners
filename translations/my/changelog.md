# အပြောင်းအလဲ မှတ်တမ်း - AZD For Beginners

## မိတ်ဆက်

ဤ changelog မှတ်တမ်းသည် AZD For Beginners repository အတွက် အရေးပါသည့်ပြောင်းလဲမှုများ၊ အပ်ဒိတ်များနှင့် တိုးတက်စေမှုများအားလုံးကို မှတ်တမ်းတင်ထားသည်။ ကျွန်ုပ်တို့သည် semantic versioning ပေါင်းစည်းမှုချက်များကိုလိုက်နာပြီး ဤမှတ်တမ်းကိုဗားရှင်းများအကြား မည်သည့်အရာများပြောင်းလဲသွားသည်ကို အသုံးပြုသူများအား နားလည်နိုင်စေရန် ထိန်းသိမ်းထားသည်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဤ changelog ကို ပြန်လည်ကြည့်ရှုခြင်းဖြင့် သင်သည် -
- အင်္ဂါရပ်အသစ်များနှင့် အကြောင်းအရာထည့်သွင်းမှုများအကြောင်း အသိပေးထားနိုင်မည်
- ရှိပြီးသားစာတမ်းများတွင် ပြုလုပ်ထားသည့် တိုးတက်ချက်များကို နားလည်နိုင်မည်
- အမွားပြင်ဆင်မှုများနှင့် အချက်အလက်တိကျမှုအတွက် bug fixes များကို လိုက်လံစစ်ဆေးနိုင်မည်
- သင်ယူမည့်ပစ္စည်းများ၏ တိုးတက်စဉ်ကို အချိန်နှင့်အမျှ လိုက်လံကြည့်ရှုနိုင်မည်

## သင်ယူပြီးရရှိမည့် outcomes

changelog အ entries များကို ပြန်လည်ကြည့်ရှုပြီးနောက် သင်သည် -
- သင်ယူရန်အသစ်ထည့်သွင်းထားသော အကြောင်းအရာများနှင့် အရင်းအမြစ်များကို ဖော်ထုတ်နိုင်မည်
- ပြုလုပ်ပြီးသား အပိုင်းများထဲတွင် မည်သည်များကို အပ်ဒိတ်/တိုးတက်စေထားသည်ကို နားလည်နိုင်မည်
- နောက်ဆုံးထိခေတ်မီပစ္စည်းများအပေါ် အခြေခံ၍ သင်၏ သင်ယူမှုလမ်းကြောင်းကို စီမံနိုင်မည်
- နောက်ထပ်တိုးတက်စေရေးအတွက် တွေ့ကြုံချက်များနှင့် အကြံပြုချက်များ ပေးစွမ်းနိုင်မည်

## ဗားရှင်းမှတ်တမ်း

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**ဤဗားရှင်းသည် AZD 1.23 validation စစ်ဆေးမှုကို အပြီးသတ်လိုက်၍ စတင်လေ့လာသူများအတွက် အထူးအာရုံစိုက်ထားသော စာတမ်းဆိုင်ရာ ပြုပြင်မွမ်းမံမှုများကို ပြန်လည်ဆောင်ရွက်ထားသည် — AZD-first authentication လမ်းညွှန်ကို ပိုမိုရှင်းလင်းစေပြီး၊ ဒေသခံ setup စစ်ဆေးရေး script များထည့်သွင်းကာ အဓိက command များကို live AZD CLI တို့နှင့် ထပ်တူစစ်ဆေးပြီး အချို့ အရင်းအမြစ်ပေါ်ရှိ အဟောင်း English-source command ကို changelog အပြင်နေရာများမှ ဖယ်ရှားထားသည်။**

#### Added
- **🧪 စတင်လေ့လာသူ setup စစ်ဆေးရေး script များ** — `validate-setup.ps1` နှင့် `validate-setup.sh` ကို ထည့်သွင်းထားပြီး သင်တန်းသားများသည် Chapter 1 စတင်ရန်မတိုင်မီ လိုအပ်သည့် tools များကို အတည်ပြုနိုင်မည်
- **✅ မူလ setup စစ်ဆေးခြင်း အဆင့်များ** ကို root README နှင့် Chapter 1 README တို့တွင် ထည့်သွင်းထားပြီး `azd up` ကို 실행မပြုမီ မလိုအပ်သော prerequisite များကို ဖမ်းနိုင်မည်

#### Changed
- **🔐 စတင်လေ့လာသူ authentication လမ်းညွှန်ချက်များ** — `azd auth login` ကို AZD workflow များအတွက် အဓိကလမ်းကြောင်းအဖြစ် အမြဲသတ်မှတ်ထားပြီး `az login` ကို Azure CLI command များကို တိုက်ရိုက် အသုံးပြုသည့်အခါသာ ရွေးချယ်စရာအဖြစ် ဖော်ပြထားသည်
- **📚 Chapter 1 onboarding flow** — သင်တန်းသားများကို installation, authentication နှင့် ပထမဆုံး deployment အဆင့်များမပြုလုပ်မှီ ဒေသခံ setup ကို အရင်စစ်ဆေးရန် ညွှန်ပြထားသည်
- **🛠️ Validator မက်ဆေ့ချ်များ** — AZD-only စတင်လေ့လာသူလမ်းကြောင်းအတွက် အတားအဆီးဖြစ်စေသော လိုအပ်ချက်များကို မရှိမဖြစ်လိုအပ်သောသတိပေးချက်များနှင့် optional Azure CLI သတိပေးချက်များကို သေချာ ခွဲခြားပြထားသည်
- **📖 Configuration, troubleshooting, နှင့် example စာတမ်းများ** — လိုအပ်သော AZD authentication နှင့် optional Azure CLI sign-in များကို ယခင်က context မရှိဘဲ တပြိုင်နက်တည်း ဖော်ပြထားသောနေရာများတွင် မည်သည်နှင့်မည်သည်ကို ချဲ့ထွင် ခွဲခြားပြထားသည်

#### Fixed
- **📋 ကျန်ရှိနေသေးသော English-source command ကိုးကားချက်များ** ကို လက်ရှိ AZD ပုံစံများသို့ အပ်ဒိတ်ပြုလုပ်ထားသည်၊ ထို့ထဲတွင် cheat sheet အတွက် `azd config show` နှင့် Azure Portal overview လမ်းညွှန်ရန် ရည်ရွယ်ထားသော `azd monitor --overview` ပါဝင်သည်
- **🧭 Chapter 1 များတွင် စတင်လေ့လာသူအား ဖြောင့်မတ်မှုများ** ကို template များနှင့် Azure resource များ အားလုံးအပေါ် အမှားမဖြစ်အပ်/rollback အာမခံချက် မပေးနိုင်သည့် အခြေအနေများကို သက်သာစေရန် ချိန်ညှိထားသည်
- **🔎 Live CLI သက်ဆိုင်စစ်ဆေးမှု** — `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, နှင့် `azd down --force --purge` များအတွက် လက်ရှိထောက်ပံ့မှုကို အတည်ပြုထားသည်

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
**ဤဗားရှင်းသည် `azd` `1.23.12` အပေါ် စာတမ်းအကဲဖြတ်စစ်ဆေးမှုကို ဆောင်ရွက်ပြီး၊ အသက်ဝင်မှုမရှိသေးသည့် AZD command ဥပမာများကို အပ်ဒိတ်လုပ်ကာ AI model လမ်းညွှန်ချက်များကို လက်ရှိ defaults အတိုင်း ပြန်လည်အသစ်ပေါင်းထည့်ထားပြီး GitHub Codespaces အပြင် dev containers နှင့် ဒေသခံ clone များကိုလည်း ပံ့ပိုးပေးရန် workshop နှစ်ဖက်သားညွှန်ကြားမှုကို ကျယ်ပြန့်စေထားသည်။**

#### Added
- **✅ အဓိကအခန်းများနှင့် workshop စာရွက်များအတွင်း validation မှတ်ချက်များ** — စမ်းသပ်ထားသည့် AZD baseline ကို အသုံးပြုသူများသိရှိနိုင်စေရန် ထည့်သွင်းထားသည်
- **⏱️ အချိန်ကုန်ဆုံးမှု (deployment timeout) လမ်းညွှန်ချက်** — ကြာရှည်တည်ဆောက်နေသည့် AI app deployment များအတွက် `azd deploy --timeout 1800` ကို ညွှန်ပြထားသည်
- **🔎 Extension စစ်ဆေးခြင်း အဆင့်များ** — AI workflow စာတမ်းများတွင် `azd extension show azure.ai.agents` ကို ထည့်သွင်းထားသည်
- **🌐 Workshop ပတ်ဝန်းကျင် လမ်းညွှန်ချက်များ ပိုမိုစုံလင်စေခြင်း** — GitHub Codespaces, dev containers, နှင့် local clones များအတွက် MkDocs ဖြင့် ထောက်ခံပေးထားသည်

#### Changed
- **📚 အခန်းမိတ်ဆက် README များ** — foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, နှင့် production အပိုင်းများတွင် `azd 1.23.12` ကို စမ်းသပ်ထားကြောင်း ဆိုင်းဘုတ်အဖြစ် ထည့်သွင်းပြထားသည်
- **🛠️ AZD command ကိုးကားချက်များ** — စာတမ်းများတလျောက် လက်ရှိပုံစံများသို့ ပြင်ဆင်ထားသည်။
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` (context အပေါ်မူတည်)
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` (Application Insights overview ရည်ရွယ်ချက်ရှိသောနေရာများ)
- **🧪 Provision preview ဥပမာများ** — `azd provision --preview` နှင့် `azd provision --preview -e production` ကဲ့သို့ လက်ရှိထောက်ခံထားသော အသုံးပြုမှုများကို ရိုးရိုးလက်ခံနိုင်အောင် လိုင်းရှင်းထားသည်
- **🧭 Workshop လမ်းစဉ်** — သင်တန်းသားများသည် Codespaces, dev container, သို့မဟုတ် local clone တို့တွင် labs များကို ပြီးမြောက်နိုင်အောင် အသစ်ပြင်ဆင်ထားသည်
- **🔐 Authentication လမ်းညွှန်ချက်များ** — AZD workflow များအတွက် `azd auth login` ကို အကြောင်းပြု၍ ထိန်းသိမ်းထားပြီး Azure CLI ကို တိုက်ရိုက်သုံးသောအခါ `az login` ကို optional အဖြစ် ဖော်ပြထားသည်

#### Fixed
- **🪟 Windows installation command များ** — installation guide တွင် `winget` package casing ကို လက်ရှိမှန်သလို အသုံးပြုရန် စံချိန်ညိှထားသည်
- **🐧 Linux installation လမ်းညွှန်ချက်များ** — distro-specific unsupported `azd` package manager ညွှန်ချက်များကို ဖယ်ရှားပြီး release assets များသို့ ညွှန်ပေးထားသည်
- **📦 AI model ဥပမာများ** — အဟောင်း defaults ဖြစ်သော `gpt-35-turbo` နှင့် `text-embedding-ada-002` တို့ကို လက်ရှိဥပမာများဖြစ်သော `gpt-4.1-mini`, `gpt-4.1`, နှင့် `text-embedding-3-large` သို့ ပြန်လည်ပြင်ဆင်ထားသည်
- **📋 Deployment နှင့် diagnostics နမူနာများ** — logs, script များနှင့် troubleshooting အဆင့်များတွင် လက်ရှိ environment နှင့် status command များကို အသုံးပြုသည့်ပုံစံဖြင့် ပြင်ဆင်ထားသည်
- **⚙️ GitHub Actions လမ်းညွှန်ချက်များ** — `Azure/setup-azd@v1.0.0` မှ `Azure/setup-azd@v2` သို့ ပြောင်းလဲထားသည်
- **🤖 MCP/Copilot consent လမ်းညွှန်ချက်များ** — `azd mcp consent` မှ `azd copilot consent list` သို့ အပ်ဒိတ်ပြုလုပ်ထားသည်

#### Improved
- **🧠 AI အခန်းလမ်းညွှန်ချက်များ** — preview-sensitive `azd ai` အပြုအမူများ၊ tenant-specific login လုပ်နည်း၊ လက်ရှိ extension အသုံးပြုမှု နှင့် မော်ဒယ် deployment အကြံပြုချက်များကို ပိုမိုရှင်းလင်းစွာ ရှင်းပြထားသည်
- **🧪 Workshop အညွှန်းများ** — ပိုမိုယုံကြည်ရသော ဗားရှင်းဥပမာများနှင့် ပတ်ဝန်းကျင် setup အသုံးအနှုန်းရွေးချယ်မှုများကို ပိုမိုရှင်းလင်းစေခဲ့သည်
- **📈 Production နှင့် troubleshooting စာတမ်းများ** — လက်ရှိ monitoring, fallback model, နှင့် cost-tier ဥပမာများနှင့် ပိုမိုကိုက်ညီလာစေခဲ့သည်

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
**ဤဗားရှင်းတွင် `azd ai`, `azd extension`, နှင့် `azd mcp` command များကို AI သက်ဆိုင်ရာအခန်းများတွင် အကျယ်တဝင်ကို ဖော်ထုတ်ပေးထားပြီး၊ agents.md တွင် ချိုးကျသွားသော link များနှင့် အဟောင်း code များကို ပြုပြင်ကာ cheat sheet ကို အပ်ဒိတ်လုပ်ပြီး Example Templates အပိုင်းကို မှန်ကန်သည့်ဖော်ပြချက်များနှင့် Azure AI AZD templates အသစ်များဖြင့် ပြန်လည်ပြုပြင်ထားသည်။**

#### Added
- **🤖 AZD AI CLI ကမ်းလှမ်းချက်များ** — အောက်ပါ 7 ဖိုင်တစ်ဝက်ထဲလုံး အပါအဝင် (ယခင်တွင် Chapter 8 သာရှိခဲ့သည်)။
  - `docs/chapter-01-foundation/azd-basics.md` — "Extensions and AI Commands" အပိုင်း အသစ် ( `azd extension`, `azd ai agent init`, နှင့် `azd mcp` ကို မိတ်ဆက်)
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` (template vs manifest လမ်းစဉ် နှိုင်းယှဉ်ဇယား အပါအဝင်)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" နှင့် "Agent-First Deployment" သက်ဆိုင်ရာစုစည်းမှုများ
  - `docs/chapter-05-multi-agent/README.md` — Quick Start တွင် template-based နှင့် manifest-based deployment လမ်းစဉ်နှစ်ခုလုံးပြသ
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy အပိုင်းတွင် `azd ai agent init` ရွေးချယ်စရာ ပါဝင်
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" အပိုင်းအသစ်
  - `resources/cheat-sheet.md` — "AI & Extensions Commands" အပိုင်းအသစ် ( `azd extension`, `azd ai agent init`, `azd mcp`, နှင့် `azd infra generate` စသည်ဖြင့်)
- **📦 AZD AI ဥပမာ template အသစ်များ** (`microsoft-foundry-integration.md` တွင်):
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, နှင့် အသံစကားပြော chat ကို ထည့်သွင်းထားသော .NET RAG chat
  - **azure-search-openai-demo-java** — Langchain4J ကို အသုံးပြုသော Java RAG chat (ACA/AKS deployment ရွေးချယ်စရာ)
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, နှင့် Prompty ကို အသုံးပြုသည့် Multi-agent creative writing app
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB အသုံးပြုသည့် Serverless RAG (Ollama local dev ထောက်ခံမှုပါ)
  - **chat-with-your-data-solution-accelerator** — admin portal, Teams integration, နှင့် PostgreSQL/Cosmos DB ရွေးချယ်စရာပါရှိသော Enterprise RAG accelerator
  - **azure-ai-travel-agents** — .NET, Python, Java, နှင့် TypeScript တို့တွင် servers ပါဝင်သည့် Multi-agent MCP orchestration ကို ကိုးကားထားသော reference app
  - **azd-ai-starter** — များမကြီးသော Azure AI အခြေခံ infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates) ထံကို ကိုးကား

#### Fixed
- **🔗 agents.md navigation** — Previous/Next links များကို Chapter 2 README သင်ခန်းစာ အစီအစဉ်နှင့် ကိုက်ညီအောင် ပြင်ဆင်ထားသည် (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links** — `production-ai-practices.md` ကို `../chapter-08-production/production-ai-practices.md` သို့ ပြင်ဆင်ထားသည် (3 ခေါက်)
- **📦 agents.md deprecated code** — `opencensus` ကို `azure-monitor-opentelemetry` + OpenTelemetry SDK ဖြင့် အစားထိုးထားသည်
- **🐛 agents.md invalid API** — `create_agent()` မှ `max_tokens` ကို `create_run()` ထဲသို့ `max_completion_tokens` အဖြစ် ရွှေ့ထားသည်
- **🔢 agents.md token counting** — အနီးကပ်ကြမ်းတမ်းသော `len//4` ခန့်မှန်းချက်ကို `tiktoken.encoding_for_model()` ဖြင့် အစားထိုးထားသည်
- **azure-search-openai-demo** — service များကို "Cognitive Search + App Service" မှ "Azure AI Search + Azure Container Apps" သို့ ပြင်ဆင်ထားသည် (default host မပြောင်းလဲမှု Oct 2024 မှာရှိ)
- **contoso-chat** — ဖော်ပြချက်ကို repo ၏ တိုက်ရိုက်ခေါင်းစဉ်နှင့် နည်းပညာစနစ်နှင့် ကိုက်ညီအောင် Azure AI Foundry + Prompty ကို ကိုးကားအဖြစ် ပြင်ဆင်ထားသည်

#### Removed
- **ai-document-processing** — ဖောက်လှမ်း၍မရသော template ကို ဖျက်ပြီး ဖြုတ်ပစ်ထားသည် (repo သည် အများပြည်သူအတွက် ရရှိနိုင်ခြင်းမရှိသောကြောင့်)

#### Improved
- **📝 agents.md exercises**: Exercise 1 အတွက် ယခု မျှော်လင့်ထားသည့် ထွက်ပေါက်ကို ပြသပြီး `azd monitor` အဆင့်ထည့်သွင်းထားသည်; Exercise 2 တွင် `FunctionTool` မှတ်ပုံတင် ကုဒ် အပြည့်အစုံ ပါရှိသည်; Exercise 3 သည် မကြာခဏ မရှင်းလင်းသော ညွှန်ကြားချက်များကို `prepdocs.py` အမိန့်များဖြင့် တိကျစေရန် ပြောင်းလဲထားသည်
- **📚 agents.md resources**: လက်ရှိ Azure AI Agent Service မှတ်တမ်းများနှင့် quickstart သို့ ဗဟိုချထားသော documentation လင့်ခ်များကို အပ်ဒိတ်လုပ်ထားသည်
- **📋 agents.md Next Steps table**: အခန်းအားလုံး ဖုံးလွှမ်းမှုကို ပြည့်စုံစေသော AI Workshop Lab လင့်ခ်ကို ထည့်သွင်းထားသည်

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

#### Course Navigation Enhancement
**ဤဗားရှင်းသည် README.md ရဲ့ အခန်း သွားရာလမ်းညွှန်ကို တိုးတက်လာသော ဇယားပုံစံဖြင့် ကောင်းမွန်စေခဲ့သည်။**

#### Changed
- **Course Map Table**: တန်းတိုက်သင်ခန်းစာ လင့်ခ်များ၊ ကြာချိန် ခန့်မှန်းချက်များနှင့် ရှုပ်ထွေးမှု အဆင့်များနှင့်အတူ တိုးချဲ့ထားသည်
- **Folder Cleanup**: အလွန်လိုအပ်နည်းသော အဟောင်း ဖိုင်ဖေါ်ဒါများ (deployment/, getting-started/, pre-deployment/, troubleshooting/) ကို ဖျက်ပစ်ထားသည်
- **Link Validation**: Course Map ဇယားအတွင်းရှိ 21+ ပြင်ပ မဟုတ်သော လင့်ခ်အားလုံးကို စစ်ဆေးအတည်ပြုထားသည်

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**ဤဗားရှင်းသည် မိုင်ခရိုဆိုက်၏ လက်ရှိ ဘရန်းဒင်းနာမည်များအတိုင်း ထုတ်ကုန်အညွှန်းများကို ပြင်ထားသည်။**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: မဘာသာပြန်ထားသော ဖိုင်များတွင် ရည်ညွှန်းချက်အားလုံးကို အပ်ဒိတ်လုပ်ထားသည်
- **Azure AI Agent Service → Foundry Agents**: လက်ရှိ ဘရန်းဒင်းနှင့် ကိုက်ညီစေရန် ဝန်ဆောင်မှု နာမည်ကို အပ်ဒိတ်လုပ်ထားသည်

#### Files Updated
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

#### Major Repository Restructuring: Chapter-Based Folder Names
**ဤဗားရှင်းသည် စာတမ်းများကို ပိုမိုရှင်းလင်းစေရန် အခန်းအလိုက် ဖေါ်ဒါများဖြင့် ပြန်လည်ဖွဲ့စည်းထားသည်။**

#### Folder Renames
အဟောင်း ဖေါ်ဒါများကို အခန်းအမှတ်ပြထားသော ဖေါ်ဒါများဖြင့် အစားထိုးပြုလုပ်ထားသည်။
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| File | From | To |
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

#### Added
- **📚 Chapter README files**: အခန်းတိုင်းဖေါ်ဒါ၌ README.md ဖိုင်များကို ဖန်တီးပြီး အောက်ပါအချက်များကို ထည့်သွင်းထားသည်။
  - သင်ယူရမည့် ရည်မှန်းချက်များနှင့် ကြာချိန်
  - သင်ခန်းစာဇယားနှင့် ဖော်ပြချက်များ
  - အမြန်စတาร์့ အမိန့်များ
  - အခန်းများပေါ်သို့ ဖော်ပြချက်များ

#### Changed
- **🔗 Updated all internal links**: စာတမ်းများအနှံ့ 78+ လမ်းကြောင်းများကို သိရှိပြီး အပ်ဒိတ်လုပ်ထားသည်
- **🗺️ Main README.md**: Course Map ကို အခန်းဖွဲ့စည်းမှုအသစ်နှင့် တွဲဖက် ပြင်ဆင်ထားသည်
- **📝 examples/README.md**: chapter ဖေါ်ဒါများသို့ အချိန်နှုတ် cross-references များကို အပ်ဒိတ်လုပ်ထားသည်

#### Removed
- အဟောင်း ဖေါ်ဒါဖွဲ့စည်းမှုများ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/) ကို ဖယ်ရှားထားသည်

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**ဤဗားရှင်းသည် အခန်း သွားရာလမ်းကြောင်း README ဖိုင်များကို ထည့်သွင်းခဲ့သည် (v3.15.0 က အသစ်ပိုမိုကောင်းမွန်သောအရ ပြင်ဆင်ထားသည်)।**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**ဤဗားရှင်းတွင် Azure Developer CLI ဖြင့် AI agents များကို တပ်ဆင်ပေးရန် အပြည့်အစုံ လမ်းညွှန်စာတမ်းကို ထည့်သွင်းထားသည်။**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: အောက်ပါအရာများအား ဖော်ပြသည့် ပြည့်စုံသော လမ်းညွှန်စာတမ်း
  - AI agents ဆိုသည်မှာ အဘယ်နှင့် chatbot များနှင့် မည်ကဲ့သို့ ကွာခြားသည်ကို ရှင်းလင်းပြသခြင်း
  - သုံးမျိုးသော အမြန်စတาร์့ agent တမ်းပလိတ်များ (Foundry Agents, Prompty, RAG)
  - Agent အောက်ဆောက်ပုံ ပုံစံများ (single agent, RAG, multi-agent)
  - Tool များ စီမံခန့်ခွဲခြင်းနှင့် မိမိလိုအပ်သည့်အတိုင်း ပြင်ဆင်နိုင်မှု
  - မော်နတာနှင့် မက်ထရစ်များလိုအပ်ချက်
  - ကုန်ကျစရိတ် တွက်ချက်ခြင်းနှင့် အာနိသင်တိုးတက်အောင်လုပ်ခြင်း
  - အများကြုံ တွေ့ရသည့် ပြဿနာဖြေရှင်း နည်းလမ်းများ
  - အောင်မြင်မှု ချက်ရှိသည့် လက်တွေ့ လေ့ကျင့်ခန်းသုံးခု

#### Content Structure
- **Introduction**: စတင်လေ့လာသူများအတွက် agent အယူအဆများ
- **Quick Start**: `azd init --template get-started-with-ai-agents` ဖြင့် agent များကို တပ်ဆင်ရန် အတိုချုံးလမ်းညွှန်
- **Architecture Patterns**: agent ပုံစံများ၏ ဗီဇွယ် ပုံများ
- **Configuration**: Tool များ သတ်မှတ်ခြင်းနှင့် ပတ်ဝန်းကျင် အတည်ပြုချက်များ
- **Monitoring**: Application Insights ထည့်သွင်းသည့် နည်းလမ်းများ
- **Exercises**: 20-45 မိနစ်ကြာသော တိုးတက်ကာ လက်တွေ့ လေ့ကျင့်ခန်းများ

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**ဤဗားရှင်းသည် ဖြံ့ဖြိုးရေး ကွန်တိနာ ပတ်ဝန်းကျင်ကို ခေတ်မီကိရိယာများနှင့် ပိုမိုကောင်းမွန်သော ဖော်ပြချက်များဖြင့် အပ်ဒိတ်လုပ်ထားသည်။**

#### Changed
- **🐳 Base Image**: `python:3.12-bullseye` မှ `python:3.12-bookworm` (အကြာဆုံး Debian stable) သို့ အပ်ဒိတ်လုပ်ထားသည်
- **📛 Container Name**: အသွင်အပြင်အတွက် "Python 3" မှ "AZD for Beginners" သို့ ပြောင်းထားသည်

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` နှင့် Bicep support ကို ဖွင့်ထားသည်
  - `node:20` (AZD templates အတွက် LTS ဗားရှင်း)
  - `github-cli` သို့ template စီမံခန့်ခွဲရန်
  - `docker-in-docker` ကို container app deployments အတွက် ထည့်သွင်းထားသည်

- **🔌 Port Forwarding**: ပုံမှန် ဖွံ့ဖြိုးရေးအတွက် ကြိုတင်ညှိထားသော ဆိပ်ကမ်းများ
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ VS Code Settings**: Python interpreter, format on save, whitespace trimming အတွက် မူကြမ်း သတ်မှတ်ချက်များ ထည့်သွင်းထားသည်

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify plugin ကို ထည့်သွင်းထားသည်
  - pre-commit ကို အရည်အသွေး စစ်ဆေးရေးအတွက် ထည့်ထားသည်
  - Azure SDK packages (azure-identity, azure-mgmt-resource) ကို ထည့်ထားသည်

#### Fixed
- **Post-Create Command**: ကွန်တိနာ စတင်လာချိန်တွင် AZD နှင့် Azure CLI တပ်ဆင်မှုကို အတည်ပြုစစ်ဆေးသည်

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**ဤဗားရှင်းသည် README.md ကို စတင်လေ့လာသူများအတွက် ပိုမိုလွယ်ကူစေရန် အလေးပေး ပြန်လည်ရေးသားပြီး AI ဖွံ့ဖြိုးရေးသူများအတွက် မရှိမဖြစ် လိုအပ်သော အရင်းအမြစ်များကို ထည့်သွင်းထားသည်။**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: တိုက်ရိုက် အသုံးပြုသင့်သည့် ကိရိယာကို ရှင်းလင်းဖော်ပြထားပြီး အသုံးချ နမူနာများပါဝင်သည်
- **🌟 Awesome AZD Links**: ဆွဲဆောင်မှုရှိသော AZD တန်ဖိုးများနှင့် ပံ့ပိုးမှု အရင်းအမြစ်များ (direct links)
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: ထပ်ရှင်းသော 3-ခြေလှမ်း စတတ်လမ်းညွှန် (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: developer အတွေ့အကြုံ အလိုက် စတင်ရန် နေရာများကို ရှင်းလင်းပြထားသည်

#### Changed
- **README Structure**: အချက်အလက် အရေးကြီးဆုံးကို ဦးစားပေးဖော်ပြရန် ပြန်လည်စီစဉ်ထားသည်
- **Introduction Section**: စတင်လေ့လာသူများအတွက် "The Magic of `azd up`" ကို ရိုးရှင်းစွာ ရှင်းလင်းပြထားသည်
- **Removed Duplicate Content**: ထပ်နေသော troubleshooting အပိုဒ်ကို ဖြုတ်ပစ်ထားသည်
- **Troubleshooting Commands**: `azd logs` ကို တရားဝင် `azd monitor --logs` ဖြင့် အသုံးပြုရန် ပြင်ဆင်ထားသည်

#### Fixed
- **🔐 Authentication Commands**: cheat-sheet.md တွင် `azd auth login` နှင့် `azd auth logout` ကို ထည့်သွင်းထားသည်
- **Invalid Command References**: README troubleshooting အပိုင်းမှ ကျန်ရှိသေးသော `azd logs` ကို ဖယ်ရှားထားသည်

#### Notes
- **Scope**: ပြင်ဆင်မှုများကို main README.md နှင့် resources/cheat-sheet.md တွင် အဓိက အကောင်အထည်ဖော်ထားသည်
- **Target Audience**: AZD အသစ်စတင်သော developer များအတွက် အထူးအာရုံစိုက်ထားသည်

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**ဤဗားရှင်းသည် စာတမ်းများအတွင်း တွေ့ရသည့် မရှိမဖြစ် AZD command များကို ပြင်ဆင်ပြီး ကုဒ်နမူနာများအားလုံး တိကျသည့် Azure Developer CLI syntax များကို အသုံးပြုစေသည်။**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: မရှိသော azd command များအား လုံးကို စိစစ်ဖယ်ရှားပြီး တိကျသော အစားထိုးများကို ထည့်သွင်းထားသည်။
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: 固定された `1.5.0` ဗားရှင်းကို `1.x.x` အဖြစ်ပြောင်းပြီး releases အတွက် link ထည့်ထားသည်

#### Changed
- **Rollback Strategies**: AZD သည် မတည်ဆောက်သည့် native rollback များမရှိသောကြောင့် Git-based rollback ကို အသုံးပြုရန် အသိပေးထားသည်
- **Log Viewing**: `azd logs` ကို `azd monitor --logs`, `azd monitor --live`, နှင့် Azure CLI အစီအစဉ်များဖြင့် အစားထိုးပြင်ဆင်ထားသည်
- **Performance Section**: မရှိသော parallel/incremental deployment flag များကို ဖယ်ရှားပြီး သက်ဆိုင်ရာ တရားဝင် အစားထိုးနည်းလမ်းများကို ဖော်ပြထားသည်

#### Technical Details
- **မှန်ကန်သော AZD အမိန့်များ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **မှန်ကန်သော azd monitor အတွက် Flag များ**: `--live`, `--logs`, `--overview`
- **ဖယ်ရှားထားသော အင်္ဂါရပ်များ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### မှတ်ချက်များ
- **အတည်ပြုချက်**: Azure Developer CLI v1.23.x အပေါ် အမိန့်များကို စမ်းသပ်အတည်ပြုထားသည်

---

### [v3.9.0] - 2026-02-05

#### ဇယားသင်တန်းပြီးစီးမှုနှင့် စာရွက်စာတမ်း အရည်အသွေး အပ်ဒိတ်
**ဤဗားရှင်းသည် အင်တာแက်တက် ဗဟိုပြီး သင်တန်းမော်ဂျူးများကို ပြီးမြောက်စေကာ ချိုးယွင်းနေသော စာရွက်စာတမ်း ချိတ်ဆက်များကို ပြင်ဆင်ပြီး Microsoft AZD အသုံးပြု နေသော AI developer များအတွက် အကြောင်းအရာ အလုံးစုံအရည်အသွေး ကို မြှင့်တင်ပေးသည်။**

#### Added
- **📝 CONTRIBUTING.md**: အကူအညီပေးရန် အသစ်သော ပြန်လည်ပေးဆောင်မှုလမ်းညွှန်စာရွက် ပါရှိသည့် စာရွက်:
  - ပြဿနာများ ထောက်ပြခြင်းနှင့် ပြင်ဆင်မှု အကြံပြုခြင်းအတွက် ပြတ်သားသော ညွှန်ကြားချက်များ
  - အကြောင်းအရာအသစ်များအတွက် စာရွက်စာတမ်း စံနှုန်းများ
  - ကုဒ် နမူနာ နည်းလမ်းများနှင့် commit မက်ဆေ့ စနစ်များအတွက် ညွှန်ကြားချက်များ
  - အသိုင်းအဝိုင်း ပါဝင်ဆောင်ရွက်မှု အချက်အလက်များ

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: အဆုံးသတ် Module ကို ပြီးစီးပြီး အောက်ပါများပါဝင်သည်:
  - သင်တန်းအမှတ်တရ လေ့ကျင့်ခဲ့သော အလုပ်ရလဒ်များအကျဉ်းချုံး
  - AZD, templates, နှင့် Microsoft Foundry အပါအဝင် ကျွမ်းကျင်ခဲ့သည့် အဓိက မှတ်စုများ
  - သင်ယူမှု ခရီးကို ဆက်လက်တိုးတက်ရန် အကြံပြုချက်များ
  - အခက်အခဲ အဆင့်အလိုက် သင်တန်း စိန်ခေါ်မှု လေ့ကျင့်ခန်းများ
  - အသိုင်းအဝိုင်း တုံ့ပြန်ချက်နှင့် ထောက်ခံမှု ချိတ်ဆက်များ

- **📚 Workshop Module 3 (Deconstruct)**: သင်ယူရည်မှန်းချက်များကို အပ်ဒိတ်လုပ်ပြီး အောက်ပါများပါဝင်သည်:
  - GitHub Copilot နှင့် MCP servers ကို ဖွင့်သတ်ခြင်း ညွှန်ကြားချက်များ
  - AZD template ဖိုလ်ဒါ ဖွဲ့စည်းပုံ နားလည်မှု
  - Infrastructure-as-code (Bicep) အဖွဲ့အစည်း ပုံစံများ
  - လက်တွေ့ လေ့ကျင့်ခန်း ညွှန်ကြားချက်များ

- **🔧 Workshop Module 6 (Teardown)**: ပြီးစီးပြီး အောက်ပါများပါဝင်သည်:
  - အရင်းအမြစ် ရှင်းလင်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု ရည်ရွယ်ချက်များ
  - လုံခြုံစွာ အင်ဖ্রာစ्ट्रက်ချာ ဖျက်ပစ်ရန် `azd down` အသုံးပြုနည်း
  - soft-delete လုပ်ထားသော Cognitive Services များ ပြန်လည် ရယူခြင်းအတွက် ညွှန်ကြားချက်
  - GitHub Copilot နှင့် Azure Portal အတွက် အပို စူးစမ်းဖွယ် အကြံပြုချက်များ

#### Fixed
- **🔗 ချိုးဆီးနေသော ချိတ်ဆက်များ ပြင်ဆင်မှုများ**: အတွင်း စာရွက်စာတမ်း ချိတ်ဆက် ချိုးယွင်းချက် 15+ ခုကို ဖြေရှင်းခဲ့သည်:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md သို့ ဦးတည်နေသော လမ်းကြောင်းများကို မှန်ကန်အောင် ပြင်ဆင်ခဲ့သည်
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md နှင့် production-ai-practices.md သို့ ချိတ်ဆက်ရာ လမ်းကြောင်းများကို ချိန်ညှိပြင်ဆင်ခဲ့သည်
  - `docs/getting-started/first-project.md`: မရှိတော့သော cicd-integration.md ကို deployment-guide.md ဖြင့် အစားထိုးပြင်ဆင်ခဲ့သည်
  - `examples/retail-scenario.md`: FAQ နှင့် troubleshooting guide လမ်းကြောင်းများကို ပြင်ဆင်ခဲ့သည်
  - `examples/container-app/microservices/README.md`: course home နှင့် deployment guide လမ်းကြောင်းများကို သင့်တော်အောင် ပြင်ဆင်ခဲ့သည်
  - `resources/faq.md` နှင့် `resources/glossary.md`: AI အခန်းပိုင်း ရည်ညွှန်းချက်များကို အပ်ဒိတ်ပြုလုပ်ခဲ့သည်
  - `course-outline.md`: instructor guide နှင့် AI workshop lab ရည်ညွှန်းချက်များကို မှန်ကန်အောင် ပြင်ဆင်ခဲ့သည်

- **📅 Workshop Status Banner**: "Under Construction" မှ ဖေဖော်ဝါရီ 2026 နေ့စွဲပါ active workshop အခြေအနေသို့ အပ်ဒိတ်ပြုလုပ်ခဲ့သည်

- **🔗 Workshop Navigation**: workshop README.md တွင် lab-1-azd-basics ဖိုလ်ဒါ မရှိတော့သောနေရာကို ညွှန်ပြနေသည့် ချိတ်ဆက် အမှားများကို ပြင်ဆင်ခဲ့သည်

#### Changed
- **Workshop Presentation**: "under construction" သတိပေးချက်ကို ဖယ်ရှားပြီး သင်တန်းသည် ယခု ပြီးစီးပြီး အသုံးပြုရန် ကျန်ရှိနေပြီဖြစ်သည်
- **Navigation Consistency**: အစိတ်အပိုင်းများ အကြား သင့်တော်သော navigation ကို အားလုံးတွင် အတည်ပြုထားသည်
- **Learning Path References**: chapter နှင့် chapter အကြား ရည်ညွှန်းချက်များကို microsoft-foundry သို့ သတ်မှတ်ချက်များဖြင့် ပြင်ဆင်ထားသည်

#### Validated
- ✅ အင်္ဂလိပ် Markdown ဖိုင်များအားလုံးတွင် အတွင်းချိတ်ဆက်များ တိကျမှန်ကန်သိရသည်
- ✅ Workshop module 0-7 များသည် သင်ယူရည်မှန်းချက်များနှင့် အပြီးအစီးဖြစ်သည်
- ✅ အခန်းများနှင့် မော်ဂျူးများအကြား navigation သာမက တပြိုင်နက် လည်ပတ်နိုင်သည်
- ✅ အကြောင်းအရာသည် Microsoft AZD သုံး AI developer များအတွက် သင့်တော်သည်
- ✅ စတရင်သူများအတွက် သင့်လျော်သော ဘာသာစကားနှင့် ဖွဲ့စည်းပုံကို ထိန်းသိမ်းထားသည်
- ✅ CONTRIBUTING.md သည် အသိုင်းအဝိုင်း တက်ကြွသူများအတွက် ရှင်းလင်းသော လမ်းညွှန်ချက်များပေးထားသည်

#### Technical Implementation
- **Link Validation**: အလိုအလျောက် PowerShell script ဖြင့် .md ဖိုင်များအားလုံး၏ အတွင်းချိတ်ဆက်များကို စစ်ဆေးခဲ့သည်
- **Content Audit**: သင်တန်း ပြီးစီးမှုနှင့် စတင်သူအတွက် သင့်လျော်မှုကို ကိုယ်တိုင် သုံးသပ်ချက်ပြုလုပ်ခဲ့သည်
- **Navigation System**: အခန်းနှင့် မော်ဂျူးများအတွက် တစ်မျိုးတည်း Navigation ပုံစံများကို အကောင်အထည်ဖော်ထားသည်

#### မှတ်ချက်များ
- **Scope**: ပြင်ဆင်မှုများကို အင်္ဂလိပ် စာရွက်စာတမ်းများပေါ်တွင်သာ အသက်သွင်းထားသည်
- **Translations**: ဘာသာပြန် ဖိုလ်ဒါများကို ဤဗားရှင်းတွင် မသိမ်းဆည်းထားပါ (အလိုအလျောက် ဘာသာပြန်ခြင်းသည် နောက်ပိုင်းတွင် ကိုက်တွယ်မည်)
- **Workshop Duration**: ပြီးပြည့်စုံသော သင်တန်းသည် လက်တွေ့ လေ့ကျင့်ခန်း 3-4 နာရီ ခန့် ပေးထားသည်

---

### [v3.8.0] - 2025-11-19

#### အဆင့်မြင့် စာရွက်စာတမ်းများ: မော်နီတာရေးရှင်း၊ လုံခြုံရေးနှင့် Multi-Agent ပုံစံများ
**ဤဗားရှင်းသည် Application Insights ပေါင်းစည်းခြင်း၊ အတည်ပြုရေး ပုံစံများနှင့် ထုတ်လုပ်ရေး သုံး multi-agent စီမံခန့်ခွဲမှုများအတွက် အပြည့်အစုံ A-အဆင့် သင်ခန်းစာများကို ထပ်ဆင့်ထည့်သွင်းသည်။**

#### Added
- **📊 Application Insights Integration Lesson**: ကို `docs/pre-deployment/application-insights.md` တွင် ထည့်သွင်း:
  - AZD အလျောက် provisioning အား ဖြည့်စွက်ထားသော deployment ဗဟိုစနစ်
  - Application Insights + Log Analytics အတွက် အပြည့်အစုံ Bicep template များ
  - custom telemetry ဖြင့် အလုပ်လုပ်နိုင်သော Python application များ (1,200+ စာကြောင်း)
  - AI/LLM မော်နီတာရေးရှင်း ပုံစံများ (Microsoft Foundry Models token/ကုန်ကျစရိတ် လမ်းကြောင်းများ)
  - 6 ချိတ်ဆက် Mermaid စာကြည့် (architecture, distributed tracing, telemetry flow)
  - လက်တွေ့ လေ့ကျင့်ခန်း 3 ခု (alerts, dashboards, AI monitoring)
  - Kusto query နမူနာများနှင့် ကုန်ကျစရိတ် အကျိုးကောင်းဆုံး စီမံခန့်ခွဲရေး နည်းလမ်း
  - Live metrics streaming နှင့် real-time debugging
  - သင်ယူချိန် 40-50 မိနစ်၊ ထုတ်လုပ်ရေးသင့် ပုံစံများပါဝင်

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md` တွင်:
  - authentication ပုံစံ 3 မျိုး (connection strings, Key Vault, managed identity)
  - လုံခြုံစိတ်ချရသော deploy များအတွက် အပြည့်အစုံ Bicep template များ
  - Azure SDK ပေါင်းစည်းထားသည့် Node.js application ကိုဒ်နမူနာ
  - လက်တွေ့ လေ့ကျင့်ခန်း 3 ခု (managed identity enable စာရင်း, user-assigned identity, Key Vault rotation)
  - လုံခြုံရေး ကောင်းမွန်ရေး အကောင်းဆုံး ကမ်းလှမ်းချက်များနှင့် RBAC အပြင်အဆင်များ
  - အခက်အခဲ ဖြေရှင်းလမ်းညွှန်နှင့် ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာချက်
  - ထုတ်လုပ်ရေးသင့် passwordless authentication ပုံစံများ

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md` တွင်:
  - coordination ပုံစံ 5 မျိုး (sequential, parallel, hierarchical, event-driven, consensus)
  - အပြည့်အစုံ orchestrator service implementation (Python/Flask, 1,500+ စာကြောင်း)
  - အထူးပြု agent implementation 3 မျိုး (Research, Writer, Editor)
  - message queuing အတွက် Service Bus ပေါင်းစည်းမှု
  - distributed systems အတွက် Cosmos DB state မာနေဂျ်မင့်
  - agent interaction ကို ဖော်ပြသည့် Mermaid ဆွဲပုံ 6 ချက်
  - အဆင့်မြင့် လက်တွေ့ လေ့ကျင့်ခန်း 3 ချက် (timeout handling, retry logic, circuit breaker)
  - ကုန်ကျစရိတ် ခွဲချက် ($240-565/month) နှင့် အရင်းအမြစ် အကောင်းဆုံးသုံး စနစ်များ
  - မော်နီတာရေးရှင်းအတွက် Application Insights ပေါင်းစည်းထားမှု

#### Enhanced
- **Pre-deployment Chapter**: မော်နီတာရေးရှင်း နှင့် coordination ပုံစံများ အပြည့်အစုံ ထည့်သွင်းပြီးပါပြီ
- **Getting Started Chapter**: ဝါရင့် ရည်ညွှန်း authentication ပုံစံများဖြင့် အဆင့်မြှင့်ထားသည်
- **Production Readiness**: လုံခြုံရေးမှ observable ဝန်ဆောင်မှုများအထိ အပြည့်အစုံ ဖော်ပြချက်
- **Course Outline**: အပိုသင်ခန်းစာများကို အခန်း 3 နှင့် 6 တွင် ရည်ညွှန်းထားသည်

#### Changed
- **Learning Progression**: security နှင့် monitoring ကို သင်ကြားမှုတစ်လျှောက်လုံးနဲ့ ပိုမိုထိရောက်စေမှု
- **Documentation Quality**: အသစ်ထည့်သွင်းသော သင်ခန်းစာများတွင် A-အဆင့်(95-97%) အဆင့် ထိကောင်းမွန်မှုရှိစေသည်
- **Production Patterns**: အစမှ အဆုံးထိ စီးပွားရေးအသုံးအဆောင် ထုတ်လုပ်ရေး လမ်းစဉ်များ အပြည့်အဝ ဖော်ပြထားသည်

#### Improved
- **Developer Experience**: ဖွံ့ဖြိုးမှုမှ ထုတ်လုပ်ရေး မော်နီတာရေးရှင်းထိ ပို့ဆောင်မှုပြတ်သားခြင်း
- **Security Standards**: authentication နှင့် secrets များ စီမံခန့်ခွဲရေးအတွက် ပရော်ဖက်ရှင်နယ် ပုံစံများ
- **Observability**: AZD နှင့် အတူ Application Insights ပေါင်းစည်းထားမှု အပြည့်အစုံ
- **AI Workloads**: Microsoft Foundry Models နှင့် multi-agent စနစ်များအတွက် အထူးပြု မော်နီတာရေးရှင်း

#### Validated
- ✅ သင်ခန်းစာအားလုံးတွင် အလုပ်လုပ်နိုင်သော ကုဒ် တစ်ထောင့်လုံးပါဝင်သည် (snippet မဟုတ်)
- ✅ မျိုးဖေါ်ပြထားသည့် Mermaid ဆွဲပုံများ (သင်ခန်းစာ 3 ခုတွင် စုစုပေါင်း 19)
- ✅ လက်တွေ့ လေ့ကျင့်ခန်းများနှင့် အတည်ပြုချက်ခြေလှမ်းများ (စုစုပေါင်း 9)
- ✅ `azd up` ဖြင့် deploy ပြုလုပ်နိုင်သည့် ထုတ်လုပ်ရေးသင့် Bicep templates များ
- ✅ ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာချက်များနှင့် အကောင်းဆုံးသုံးနည်းများ
- ✅ အခက်အခဲ ဖြေရှင်းရေးလမ်းညွှန်များနှင့် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ
- ✅ ဗဟုသုတ စစ်ဆေးစရာများနှင့် အတည်ပြုคำ령များ

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - အပြည့်အစုံ မော်နီတာရေးရှင်းလမ်းညွှန်
- **docs/getting-started/authsecurity.md**: - ပရော်ဖက်ရှင်နယ် လုံခြုံရေး ပုံစံများ
- **docs/pre-deployment/coordination-patterns.md**: - အဆင့်မြင့် multi-agent အဆောက်အအုံများ
- **Overall New Content**: - တစ်ပြိုင်နက် အရည်အသွေး မြင့်မားစနစ်သည်

#### Technical Implementation
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC ပုံစံများ
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### စာရွက်စာတမ်း အရည်အသွေး တိုးတက်မှုများနှင့် Microsoft Foundry Models ဥပမာ အသစ်
**ဤဗားရှင်းသည် repository အတွင်း စာရွက်စာတမ်း အရည်အသွေးကို မြှင့်တင်ပေးကာ gpt-4.1 chat interface ပါရှိသည့် Microsoft Foundry Models deployment ဥပမာ တစ်ခုကို ထည့်သွင်းပေးသည်။**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` တွင် gpt-4.1 deployment နှင့် အလုပ်လုပ်နိုင်သော အကောင်အထည်ဖော်မှု:
  - Microsoft Foundry Models အင်ဖရန်စထချာ အပြည့်အစုံ (gpt-4.1 model deployment)
  - စာမျက်နှာ တွေ့ဆုံ ဖော်ဖြေ သော Python command-line chat interface နှင့် ဆက်သွယ်မှုမှတ်တမ်း
  - လုံခြုံစိတ်ချစေရန် Key Vault ပေါင်းစည်းထားမှု
  - token အသုံးပြုမှု ခန့်မှန်းနှင့် ကုန်ကျစရိတ် အကဲခတ်ခြင်း
  - rate limiting နှင့် error handling
  - 35-45 မိနစ် deploy လမ်းညွှန် သီးသန့် README
  - 11 ဖိုင် (Bicep templates, Python app, configuration) အပြည့်အစုံ ထုတ်လုပ်ရေး အသင့်ဖိုင်များ
- **📚 Documentation Exercises**: configuration guide တွင် လက်တွေ့ လေ့ကျင့်ခန်းများ ထည့်သွင်း:
  - လေ့ကျင့်ခန်း 1: Multi-environment configuration (15 မိနစ်)
  - လေ့ကျင့်ခန်း 2: Secret management လက်တွေ့ (10 မိနစ်)
  - အောင်မြင်မှု စံနှုန်းများနှင့် အတည်ပြုခြေလှမ်းများ ပြတ်သားစွာဖော်ပြထားသည်
- **✅ Deployment Verification**: deployment guide တွင် အတည်ပြုချက် အပိုင်း ထည့်သွင်း:
  - Health check လုပ်ထုံးလုပ်နည်းများ
  - အောင်မြင်မှု စစ်ဆေးချက် စာရင်း
  - မည်သည့် deployment command မဆို ရရှိသင့်သည့် output များ
  - အခက်အခဲ ဖြေရှင်းရန် အချက်တိုအချက် ပြည့်စုံ

#### Enhanced
- **examples/README.md**: A-အဆင့် အရည်အသွေးအထိ (93%) အပ်ဒိတ်လုပ်:
  - azure-openai-chat ကို သက်ဆိုင်ရာ အပိုင်းများသို့ ထည့်သွင်း
  - local example အရေအတွက် 3 ကနေ 4 သို့ တိုးမြှင့်
  - AI Application Examples အဇယားတွင် ထည့်သွင်း
  - Intermediate Users အတွက် Quick Start တွင် ပါဝင်
  - Microsoft Foundry Templates အပိုင်းတွင် ထည့်သွင်း
  - တွဲဖက်နှိုင်းယှဥ်မှုဇယား နှင့် နည်းပညာ ရှာဖွေမှု အပိုင်းများကို အပ်ဒိတ်
- **Documentation Quality**: docs ဖိုလ်ဒါအတွင်း B+ (87%) → A- (92%) အထိ တိုးတက်:
  - အရေးကြီး command ဥပမာများအတွက် မျှော်လင့်ရလဒ်များ ထည့်သွင်း
  - configuration ပြောင်းလဲမှုများအတွက် အတည်ပြုခြေလှမ်းများ ထည့်သွင်း
  - လက်တွေ့ သင်ယူမှု တိုးတက်အောင် လေ့ကျင့်ခန်းများကို အားဖြည့်

#### Changed
- **Learning Progression**: intermediate learners အတွက် AI ဥပမာများ ပို၍ သေချာ ညီထွေထုလုပ်ဆောင်မှု
- **Documentation Structure**: ရလဒ် ပိုမိုအမှန်တကယ် ရရှိစေသော လုပ်ဆောင်ချက်များဖြင့် ဖွဲ့စည်းမှုကို ကောင်းမွန်စေသည်
- **Verification Process**: အဓိက workflow များတွင် အောင်မြင်မှု သတ်မှတ်ချက်များ ထပ်မံ ထည့်သွင်း

#### Improved
- **Developer Experience**: Microsoft Foundry Models deployment သည် ယခင် 60-90 မိနစ်ဖြင့် နှိုင်းယှဥ်ပါက 35-45 မိနစ်ခန့်သာ လိုအပ်သည်
- **Cost Transparency**: Microsoft Foundry Models ဥပမာအတွက် ကုန်ကျစရိတ် ခန့်မှန်းချက်များ ($50-200/month) ကို ထည့်သွင်း ဖော်ပြထားသည်
- **Learning Path**: AI developer များအတွက် azure-openai-chat ဖြင့် ဖွင့်သင်းသွားရန် တိကျသော အစပြုချက် ရှိသည်
- **Documentation Standards**: အကြံပြုချက်များနှင့် အတည်ပြုရလဒ်များကို တည်ငြိမ်စွာ ဖော်ပြထားသည်

#### Validated
- ✅ Microsoft Foundry Models ဥပမာသည် `azd up` ဖြင့် အပြည့်အဝ လည်ပတ်နိုင်သည်
- ✅ 11 ဖိုင်အားလုံးသည် syntax အရ မှန်ကန်သည်
- ✅ README အညွှန်ကြားချက်များသည် သက်ဆိုင်ရာ deployment အတွေ့အကြုံနှင့် ကိုက်ညီသည်
- ✅ စာရွက်စာတမ်း ချိတ်ဆက်များကို 8+ နေရာတွင် အပ်ဒိတ်ပြုလုပ်ထားသည်
- ✅ Examples index သည် 4 local examples ကို မှန်ကန်စွာ ဖော်ပြထားသည်
- ✅ ဇယားများတွင် ပြတင်းပေါက် အပြင်အဆင် မရှိသော ရင်းမြစ်ချိတ်ဆက် မရှိ
- ✅ navigation ရည်ညွှန်းချက်များ အားလုံး မှန်ကန်သည်

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps ပုံစံ
- **Security**: Managed Identity ရှိပြီး၊ Key Vault တွင် secrets သိမ်းဆည်းထားသည်
- **Monitoring**: Application Insights ပေါင်းစည်းထားသည်
- **Cost Management**: Token tracking နှင့် အသုံးစရိတ် အတိအကျ ခန့်မှန်းခြင်း
- **Deployment**: Single `azd up` command ဖြင့် အပြည့်အစုံ ထည့်သွင်းနိုင်သည်

### [v3.6.0] - 2025-11-19

#### အကြီးစား အပ်ဒိတ်: Container App Deployment ဥပမာများ
**ဤဗားရှင်းတွင် Azure Developer CLI (AZD) ကို အသုံးပြုပြီး ထုတ်လုပ်ရေးသင့် container application deployment ဥပမာများကို အပြည့်အစုံ ထည့်သွင်းထားရှိပြီး သင်ယူလမ်းကြောင်းထဲသို့ ပေါင်းထည့်ထားသည်။**

#### Added
- **🚀 Container App Examples**: `examples/container-app/` တွင် အသစ်သော local ဥပမာများ:
  - [Master Guide](examples/container-app/README.md): containerized deployments အပေါ် အပြည့်အစုံ အထောက်အကူ, quick start, production နှင့် အဆင့်မြင့် ပုံစံများ
  - [Simple Flask API](../../examples/container-app/simple-flask-api): scale-to-zero, health probes, monitoring, နှင့် troubleshooting ပါဝင်သော စတင်သူများအတွက် REST API
  - [Microservices Architecture](../../examples/container-app/microservices): ထုတ်လုပ်ရေးသင့် multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: containerized အလုပ်ပေါ် မူတည်၍ လုံခြုံရေး, မော်နီတာရေးရှင်း, ကုန်ကျစရိတ် အကောင်းဆုံး လုပ်နည်းများနှင့် CI/CD လမ်းညွှန်ချက်များ
- **Code Samples**: အပြည့်အစုံ `azure.yaml`, Bicep templates, နှင့် ဘာသာစကား အမျိုးမျိုးဖြင့် service implementation များ (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: end-to-end စမ်းသပ်မှု အခြေအနေများ, မော်နီတာ ရာ၊ troubleshooting ညွှန်ကြားချက်များ

#### Changed
- **README.md**: Local Examples - Container Applications အောက်ရှိ container app ဥပမာအသစ်များကို ဖော်ပြ၍ လင့်ခ်ထည့်ပြီး အပ်ဒိတ်လုပ်ခဲ့သည်
- **examples/README.md**: container app ဥပမာများကို အထူးဖော်ပြရန် အပ်ဒိတ်လုပ်ပြီး နှိုင်းယှဉ်မက်ထရီဇ် အချက်များ ထည့်သွင်းခဲ့သည်၊ နည်းပညာ/သတ်မှတ်ချက်များကို အပ်ဒိတ်လုပ်ခဲ့သည်
- **Course Outline & Study Guide**: သက်ဆိုင်ရာအခန်းများတွင် container app ဥပမာအသစ်များနှင့် deployment ပုံစံများကို ရည်ညွှန်းရန် အပ်ဒိတ်လုပ်ခဲ့သည်

#### Validated
- ✅ အားလုံးသော ဥပမာအသစ်များကို `azd up` ဖြင့် deploy လုပ်နိုင်ပြီး အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို လိုက်နာထားပါသည်
- ✅ စာရွက်စာတမ်းအကြား cross-links နှင့် navigation ကို အပ်ဒိတ်လုပ်ထားပါသည်
- ✅ ဥပမာများတွင် စတင်သူမှ အဆင့်မြင့်သူထိ လုံးဝ ဖုံးလွှမ်းထားပြီး production microservices အပါအဝင်ပါဝင်သည်

#### Notes
- **Scope**: အင်္ဂလိပ်စာ documentation နှင့် ဥပမာများသာ
- **Next Steps**: နောက်ထွက်ဗားရှင်းများတွင် ပိုမိုတိုးချဲ့သော advanced container pattern များနှင့် CI/CD automation များထည့်သွင်းရန်

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
** ဤဗားရှင်းသည် အင်္ဂလိပ်စာ documentation အားလုံးတွင် "Microsoft Foundry" ကို "Microsoft Foundry" သို့ တစ်ခြားကျယ်ပြန့်စွာ ထိန်းသိမ်းထားခြင်းဖြင့် ထုတ်ကုန်အမည်ပြောင်းလဲမှုကို အပြည့်အစုံ အကောင်အထည်ဖော်ထားသည်။**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" ကို "Microsoft Foundry" အဖြစ် ပြောင်းလဲခြင်း အပြည့်အစုံ
  - `docs/` ဖိုလ်ဒါအတွင်းရှိ အင်္ဂလိပ်စာ documentation အားလုံးတွင် အဆိုပါ ရည်ညွှန်းချက်များကို အပ်ဒိတ်လုပ်ထားသည်
  - ဖိုလ်ဒါအမည် Rename: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ဖိုင်အမည် Rename: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - စုစုပေါင်း: 7 ဖိုင်တွင်း 23 ချက်သော 콘텐츠 ရည်ညွှန်းချက်များကို အပ်ဒိတ်လုပ်ခဲ့သည်

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` ကို `docs/microsoft-foundry/` သို့ ပြောင်းသိမ်းထားသည်
  - ဖိုလ်ဒါငယ်ပေါ်ရှိ အားလုံးသော cross-reference များကို အသစ်သော ဖိုလ်ဒါဖွဲ့စည်းပုံ အလိုက် အပ်ဒိတ်လုပ်ထားသည်
  - စာရွက်စာတမ်းများအတွင်း Navigation links များကို စစ်ဆေးအတည်ပြုထားသည်

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - အတွင်းရေးသားထားသော link များကို အားလုံး အသစ်သော ဖိုင်အမည်နှင့် ကိုက်ညီအောင် ပြောင်းထားသည်

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - navigation link 3 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/microsoft-foundry/ai-workshop-lab.md` - product name ကို ရည်ညွှန်းထားသော အချက် 4 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ယခင်အပ်ဒိတ်များမှ ပြီးသား Microsoft Foundry ကို အသုံးပြုထားပါသည်
  - `docs/microsoft-foundry/production-ai-practices.md` - အကျဉ်းချုပ်၊ community feedback၊ documentation အစိတ်အပိုင်း 3 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/getting-started/azd-basics.md` - cross-reference link 4 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/getting-started/first-project.md` - chapter navigation link 2 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/getting-started/installation.md` - next chapter link 2 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/troubleshooting/ai-troubleshooting.md` - navigation, Discord community အတွက် အချက် 3 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/troubleshooting/common-issues.md` - navigation link 1 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `docs/troubleshooting/debugging.md` - navigation link 1 ချက် အပ်ဒိတ်လုပ်ထားသည်

- **Course Structure Files** (2 files):
  - `README.md` - course overview, chapter titles, templates section, community insights အစရှိသည့် နေရာ 17 ချက် အပ်ဒိတ်လုပ်ထားသည်
  - `course-outline.md` - overview, learning objectives, chapter resources အစရှိသည့် နေရာ 14 ချက် အပ်ဒိတ်လုပ်ထားသည်

#### Validated
- ✅ အင်္ဂလိပ်စာ docs အတွင်း `ai-foundry` ဖိုလ်ဒါ လမ်းကြောင်းများ တစ်ခုလုံး ဤဗားရှင်းတွင် မရှိတော့ပါ
- ✅ အင်္ဂလိပ်စာ docs အတွင်း Microsoft Foundry ထုတ်ကုန်အမည် ရည်ညွှန်းချက်များ မရှိတော့ပါ
- ✅ အသစ်သော ဖိုလ်ဒါဖွဲ့စည်းပုံနှင့်အညီ navigation links များ အလုပ်လုပ်နိုင်မှု အတည်ပြုထားပါသည်
- ✅ ဖိုင်နာမည်နှင့် ဖိုလ်ဒါ Rename အလုပ်အဆင်ပြေစွာ ပြီးစီးထားပါသည်
- ✅ အခန်းများအကြား cross-reference များ စစ်ဆေးပြီး အတည်ပြုထားပါသည်

#### Notes
- **Scope**: ပြောင်းလဲချက်များကို `docs/` ဖိုလ်ဒါအတွင်းရှိ အင်္ဂလိပ်စာ documentation များတွင်သာ အကောင်အထည်ဖော်ထားသည်
- **Translations**: ဘာသာပြန်ထားသော ဖိုလ်ဒါများ (`translations/`) သို့ မပြောင်းလဲထားပါ
- **Workshop**: workshop materials (`workshop/`) ကို ဤဗားရှင်းတွင် မပြောင်းလဲထားပါ
- **Examples**: ဥပမာဖိုင်များတွင် အမွေကျန် နာမည်များကို ဆက်လက် ရည်ညွှန်းထားနိုင်ပြီး (နောက်ထပ် အပ်ဒိတ်တွင် ကိုင်တွယ်မည်)
- **External Links**: အပြင်ဘက် URL များနှင့် GitHub repository ရည်ညွှန်းချက်များကို မမှီခင်အတိုင်း ထိန်းသိမ်းထားပါသည်

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
** ဤဗားရှင်းတွင် Azure Developer CLI preview feature အသစ်အတွက် အပြည့်အစုံ ထောက်ပံ့မှုနှင့် workshop အသုံးပြုသူအတွေ့အကြုံကို မြှင့်တင်ပေးထားပါသည်။**

#### Added
- **🧪 azd provision --preview Feature Documentation**: infrastructure preview စွမ်းဆောင်မှုအသစ်အတွက် အပြည့်အစုံ ဖော်ပြချက်
  - Command reference နှင့် အသုံးပြုမှု ဥပမာများကို cheat sheet တွင် ထည့်သွင်းထားသည်
  - provisioning guide တွင် use case များနှင့် အကျိုးကျေးဇူးများ နှိုင်းယှဉ် ဖော်ပြထားသည်
  - Pre-flight စစ်ဆေးမှုကို ပေါင်းစည်းထား၍ deploy မပြုမီ စစ်ဆေးနိုင်စေသည်
  - Getting started လမ်းညွှန်ကို safety-first deployment အလမ်းစဉ်များနှင့် အပ်ဒိတ်လုပ်ထားသည်
- **🚧 Workshop Status Banner**: workshop ဖွံ့ဖြိုးရေး အခြေအနေကို ပြသသည့် professional HTML banner
  - ရောင်စုံ gradient ဒီဇိုင်းနှင့် ဆောက်လုပ်ရေး သင်္ကေတများဖြင့် အသုံးပြုသူ ပိုမိုရှင်းလင်းစေရန် ဖော်ပြထားသည်
  - ဖော်ပြချက်အလင်းအလင်းအတိအကျ အတွက် နောက်ဆုံး အပ်ဒိတ် timestamp ထည့်ထားသည်
  - မိုဘိုင်းနှင့် device အမျိုးအစားအားလုံးအတွက် responsive ဒီဇိုင်း

#### Enhanced
- **Infrastructure Safety**: preview လုပ်ဆောင်ချက်ကို deployment စာရွက်စာတမ်းများတလျောက် ပေါင်းထည့်ထားသည်
- **Pre-deployment Validation**: automated script များတွင် infrastructure preview စစ်ဆေးမှုများ ထည့်သွင်းထားသည်
- **Developer Workflow**: command အစီအစဉ်များကို preview ကို အကောင်းဆုံးလက်တွဲနည်းလမ်းအဖြစ် ထည့်သွင်းထားသည်
- **Workshop Experience**: အကြောင်းအရာ ဖွံ့ဖြိုးရေး အခြေအနေများအတွက် အသုံးပြုသူ မျှော်လင့်ချက်များကို ပြတ်သားစွာ ဆက်သွယ်ထားသည်

#### Changed
- **Deployment Best Practices**: preview-first workflow ကို အကြံပြုထားသည့် လမ်းစဉ်အဖြစ် ပြောင်းလဲထားသည်
- **Documentation Flow**: infrastructure validation ကို သင်ယူမှု အစဉ်အတိုင်း မေ့မရစေရန် မျဉ်းပေါ်ပို မျှဝေထားသည်
- **Workshop Presentation**: professional အသိပေးပုံစံဖြင့် ဖော်ပြထားသည်၊ ဖွံ့ဖြိုးရေး အချိန်ပြဇယားအား ပြတ်သားစွာ ဖော်ပြထားသည်

#### Improved
- **Safety-First Approach**: deployment မလုပ်ခင် infrastructure ပြောင်းလဲမှုများကို စစ်ဆေး၍ အန္တရာယ်လျော့ချနိုင်သည်
- **Team Collaboration**: preview ရလဒ်များကို ပြန်လည်သုံးသပ်ခြင်းနှင့် အတည်ပြုချက်အတွက် မျှဝေနိုင်သည်
- **Cost Awareness**: provision လုပ်ခင် အရင်းအနှီး ကုန်ကျစရိတ်များကို ပိုမို သိရှိနိုင်စေသည်
- **Risk Mitigation**: ကြိုတင်စစ်ဆေးခြင်းမှတဆင့် deployment မအောင်မြင်မှုများ လျော့နည်းစေသည်

#### Technical Implementation
- **Multi-document Integration**: preview feature ကို အဓိကဖိုင် 4 ခုအတွင်း အပြည့်အစုံ လက်တွေ့အသုံးပြုထားသည်
- **Command Patterns**: စနစ်တကျ syntax နှင့် ဥပမာများကို စာရွက်စာတမ်းများတလျောက် တစ်ပြိုင်နက် ထည့်သွင်းထားသည်
- **Best Practice Integration**: preview ကို validation workflow များနှင့် script များတွင် ထည့်သွင်းထားသည်
- **Visual Indicators**: discoverability အတွက် NEW feature အမှတ်အသားများကို ထင်ရှားစေထားသည်

#### Workshop Infrastructure
- **Status Communication**: gradient styling ပါသော professional HTML banner ဖြင့် အခြေအနေ ဆက်သွယ်ထားသည်
- **User Experience**: ဖွံ့ဖြိုးရေး အခြေအနေ ပြတ်သားစေခြင်းဖြင့် အသုံးပြုသူ မေးမြန်းမှုများ လျော့ချစေသည်
- **Professional Presentation**: စုစုပေါင်း repository ၏ ယုံကြည်ရမှုကို ထိန်းသိမ်းထားကာ မျှော်လင့်ချက်များကို သတ်မှတ်ထားသည်
- **Timeline Transparency**: October 2025 အတွက် နောက်ဆုံး အပ်ဒိတ် ရက်ကို တိတိကျကျ ဖော်ပြထားသည်

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
** ဤဗားရှင်းတွင် browser-based interactive guide များနှင့် ဖွဲ့စည်းထားသည့် သင်ယူမှုလမ်းကြောင်းများဖြင့် workshop ချဉ်းကပ်မှုကို အပြည့်အစုံ ဖြည့်စွက်ပေးထားသည်။**

#### Added
- **🎥 Interactive Workshop Guide**: MkDocs preview စနစ်ဖြင့် browser-based workshop အတွေ့အကြုံ
- **📝 Structured Workshop Instructions**: ရှာဖွေရေးမှ အပြင်ဆင်ခြင်းထိ 7-ဆင့် လမ်းကြောင်း အစီအစဉ်
  - 0-Introduction: Workshop အကျဉ်းချုပ်နှင့် setup
  - 1-Select-AI-Template: template ရှာဖွေရေးနှင့် ရွေးချယ်ရန် လုပ်ငန်းစဉ်
  - 2-Validate-AI-Template: deployment နှင့် validation နည်းလမ်းများ
  - 3-Deconstruct-AI-Template: template architecture ကို နားလည်ခြင်း
  - 4-Configure-AI-Template: configuration နှင့် customization
  - 5-Customize-AI-Template: အဆင့်မြင့် ပြင်ဆင်ခြင်းနှင့် iteration များ
  - 6-Teardown-Infrastructure: resources များကို cleanup နှင့် စီမံခန့်ခွဲခြင်း
  - 7-Wrap-up: အကျဉ်းချုပ်နှင့် နောက်ဆက်တွဲ အဆင့်များ
- **🛠️ Workshop Tooling**: enhanced learning experience အတွက် Material theme ဖြင့် MkDocs configuration
- **🎯 Hands-On Learning Path**: 3-အဆင့် မျဉ်းစေမည့် ဖြစ်စဉ် (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို လျင်မြန်စေသော ပေါင်းစည်းမှု

#### Enhanced
- **AI Workshop Lab**: 2-3 နာရီ ကြာ သင်ယူနိုင်သော စနစ်တကျ လမ်းကြောင်းအပါအဝင် ပိုမိုတိုးချဲ့ထားသည်
- **Workshop Documentation**: navigation နှင့် visual aids ဖြင့် 전문적 ဖော်ပြထားသည်
- **Learning Progression**: template ရွေးချယ်ခြင်းမှ production deployment ထိ အဆင့်ဆင့် လမ်းညွှန်မှု ရှင်းလင်းစွာ ဖော်ပြထားသည်
- **Developer Experience**: ဖော်ပြထားသော tooling များဖြင့် ဖွံ့ဖြိုးရေးလှုပ်ရှားမှုများ ပိုမိုချောမွေ့စေသည်

#### Improved
- **Accessibility**: search, copy function နှင့် theme toggle ပါရှိသည့် browser-based interface
- **Self-Paced Learning**: သင်ယူသူ၏ အမြန်နှုန်းအလိုက် မျှတစွာ လေ့လာနိုင်သည့် ဖွဲ့စည်းမှု
- **Practical Application**: ကိုယ်တိုင် လက်တွေ့အသုံးပြုနိုင်သည့် AI template deployment အခြေခံ များ
- **Community Integration**: workshop အတွက် Discord ပေါ်မှ အထောက်အပံ့နှင့် ပူးပေါင်းဆောင်ရွက်မှု

#### Workshop Features
- **Built-in Search**: စကားလုံးအလိုက် သင်ခန်းစာများကို ချက်ချက်ရှာဖွေရန်
- **Copy Code Blocks**: ကုဒ်ဥပမာများအားလုံးတွင် hover-to-copy စနစ်
- **Theme Toggle**: မီးမှောင်/မီးပေါ် mode support
- **Visual Assets**: ပုံတစ်ချို့နှင့် diagram များဖြင့် နားလည်ရလွယ်စေခြင်း
- **Help Integration**: community အထောက်အပံ့အတွက် တိုက်ရိုက် Discord သို့ ချိတ်ဆက်ထားသည်

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
** ဤဗားရှင်းသည် စာရင်းအဆင့်ဖြန့်ချိထားသည့် chapter-based သင်ယူမှုဖွဲ့စည်းမှုနှင့် repository အနှံ့ navigation ကို ကျယ်ပြန့်စွာပြောင်းလဲထားသည်။**

#### Added
- **📚 Chapter-Based Learning System**: သင်တန်းအစီအစဉ်အား 8 ခန်းသို့ ပြန်လည်ဖွဲ့စည်းထားပြီး အဆင့်တက်သင်ယူမှုများပါဝင်သည်
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: စာရွက်စာတမ်းအားလုံးတွင် ယေဘုယျ navigation header နှင့် footer များကို တဏှာတင်းတန်း ပြန်လည်ထည့်သွင်းထားသည်
- **🎯 Progress Tracking**: သင်တန်းပြီးစီးခြင်း စစ်တမ်းနှင့် သင်ယူမှုပေါ်ဆိုင်ရာ အတည်ပြုပုံစနစ်
- **🗺️ Learning Path Guidance**: အတွေ့အကြုံအလိုက် ဝင်ရောက်ရန် ရှင်းလင်းသော အစီအချက်
- **🔗 Cross-Reference Navigation**: သက်ဆိုင်သော chapter များနှင့် prerequisite များကို ရှင်းလင်းစွာ ချိတ်ဆက်ထားသည်

#### Enhanced
- **README Structure**: README ကို သင်ယူမှုအခြေခံ ပလက်ဖောင်းအဖြစ် ပြောင်းလဲထားပြီး chapter-based အစီအစဉ်ဖြင့် သတ်မှတ်ထားသည်
- **Documentation Navigation**: စာမျက်နှာတိုင်းတွင် chapter context နှင့် progression လမ်းညွှန်မှု ထည့်သွင်းထားသည်
- **Template Organization**: ဥပမာများနှင့် template များကို သင်ယူမှု chapter များနှင့် ကိုက်ညီအောင် မတ်တပ်ရုပ်ဖော်ပြထားသည်
- **Resource Integration**: cheat sheets, FAQs, study guides များကို သက်ဆိုင်ရာ chapter များနှင့် ချိတ်ဆက်ထားသည်
- **Workshop Integration**: hands-on lab များကို chapter များနှင့် ဆက်စပ်ထားသည်

#### Changed
- **Learning Progression**: လမ်းကြောင်းကို လိုင်းပြောနည်းမှ chapter-based အဆင်များဖြင့် တည်ဆောက်မှုသို့ ပြောင်းထားသည်
- **Configuration Placement**: configuration guide ကို Chapter 3 အဖြစ် ပြောင်းထား၍ သင်ယူမှုစဉ်ကို ကောင်းမွန်စေသည်
- **AI Content Integration**: AI သက်ဆိုင်ရာ အကြောင်းအရာများကို သင်ယူမှုလမ်းကြောင်းတလျောက် ပို၍ ထည့်သွင်းထားသည်
- **Production Content**: အဆင့်မြင့် ပုံစံများကို Enterprise learners များအတွက် Chapter 8 အတွင်း စုစည်းထားသည်

#### Improved
- **User Experience**: navigation breadcrumbs နှင့် chapter progression အညွှန်းများ ပိုမိုရှင်းလင်းစေသည်
- **Accessibility**: တူညီသော navigation ပုံစံများဖြင့် သင်တန်းလမ်းကြောင်း ရှာဖွေရေး လွယ်ကူစေသည်
- **Professional Presentation**: တက္ကသိုလ်စတိုင် သင်တန်းဖွဲ့စည်းမှုအတိုင်း သင်တန်းနှင့် ကုမ္ပဏီလေ့လာရေးအတွက် သင့်လျော်သည်
- **Learning Efficiency**: အဖွဲ့အစည်းက အသိပညာ သင်ယူရန် အချိန်လျော့နည်းစေသည်

#### Technical Implementation
- **Navigation Headers**: 40+ စာရွက်စာတမ်းများတွင် standard chapter navigation ကို စံပြအတိုင်း ထည့်သွင်းထားသည်
- **Footer Navigation**: တူညီသော progression လမ်းညွှန်မှုနှင့် chapter completion အညွှန်းများပါရှိသည်
- **Cross-Linking**: ဆက်စပ်အကြောင်းအရာများကို အပြည့်အဝ ချိတ်ဆက်ထားသည်
- **Chapter Mapping**: template များနှင့် ဥပမာများကို သင်ယူမှုရည်ရွယ်ချက်များနှင့် သေချာစွာ ချိတ်ဆက်ထားသည်

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8-chapter စနစ်နှင့် ကိုက်ညီအောင် study guide ကို ပြန်လည်စီစဉ်ထားသည်
- **🎯 Chapter-Based Assessment**: တစ်ခန်းချင်းစီတွင် သင်ယူရမည့် ရည်ရွယ်ချက်များနှင့် လက်တွေ့ လေ့ကျင့်ခန်းများ ပါဝင်သည်
- **📋 Progress Tracking**: အပတ်စဉ် သင်ယူမှု အချိန်ဇယားနှင့် တိုင်းတာနိုင်သော ရလဒ်များ ဖော်ပြထားသည်
- **❓ Assessment Questions**: တစ်ခန်းချင်းစီအတွက် ဗဟုသုတ စစ်ဆေးမေးခွန်းများနှင့် ပရော်ဖက်ရှင်နယ်ရလဒ်များ
- **🛠️ Practical Exercises**: real deployment ကျင့်သုံးမှုများနှင့် troubleshooting ကို ထည့်သွင်းထားသည်
- **📊 Skill Progression**: အခြေခံအမှုပိုင်းမှ Enterprise ပုံစံအထိ တိုးတက်မှုများကို မှတ်သားထားသည်
- **🎓 Certification Framework**: ပရော်ဖက်ရှင်နယ် ဖွံ့ဖြိုးရေး ရလဒ်များနှင့် community မှ အသိမှတ်ပြုချက်များ
- **⏱️ Timeline Management**: milestone အတည်ပြုချက်များပါဝင်သည့် 10-week သင်ယူမှုအစီအစဉ်

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
** ဤဗားရှင်းတွင် retail multi-agent ဖြေရှင်းချက်အား agent အမည်များ တိုးတက်အောင် ပြင်ဆင်ပြီး documentation ကို ကောင်းမွန်အောင် မြှင့်တင်ထားသည်။**

#### Changed
- **Multi-Agent Terminology**: retail multi-agent ဖြေရှင်းချက်တွင် "Cora agent" ကို "Customer agent" ဖြင့် အစားထိုး ပြောင်းလဲထားသည် เพื่อ နားလည်ရလွယ်ကူစေရန်
- **Agent Architecture**: အချက်အလက်အားလုံး၊ ARM template များနှင့် code ဥပမာများကို "Customer agent" အမည်သုံးစွဲမှုနှင့် ကိုက်ညီအောင် ပြင်ဆင်ထားသည်
- **Configuration Examples**: agent configuration ပုံစံများကို ယူသုံးရလွယ်ကူအောင် အပ်ဒိတ်လုပ်ထားသည်
- **Documentation Consistency**: အားလုံးသော ရည်ညွှန်းချက်များတွင် ပရော်ဖက်ရှင်နယ်၊ ဖော်ပြချက်အရ agent အမည်များကို သေချာကျင့်သုံးထားသည်

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template ကို Customer agent ရည်ညွှန်းချက်များဖြင့် အပ်ဒိတ်လုပ်ခဲ့သည်
- **Architecture Diagrams**: Mermaid diagrams များကို agent အမည်သစ်ဖြင့် ပြန်လည်သန့်စင်ထားသည်
- **Code Examples**: Python classes နှင့် implementation ဥပမာများတွင် ယခု CustomerAgent အမည်ကို အသုံးပြုထားသည်
- **Environment Variables**: deployment script များအားလုံးကို CUSTOMER_AGENT_NAME သတ်မှတ်ချက်များအတိုင်း အပ်ဒိတ်လုပ်ထားသည်

#### Improved
- **Developer Experience**: အဆိုပါ documentation တွင် agent တာဝန်များနှင့် တာဝန်ယူချက်များ ပိုမိုရှင်းလင်းစေခဲ့သည်
- **Production Readiness**: စီးပွားရေးအဆင့်အတန်းအမည်စနစ်များနှင့် ပိုမိုကိုက်ညီစေခဲ့သည်
- **Learning Materials**: ပညာပေးရည်ရွယ်ချက်များအတွက် agent အမည်သတ်မှတ်မှုများ ပိုမိုနားလည်ရလွယ်ကူစေခဲ့သည်
- **Template Usability**: agent လုပ်ဆောင်ချက်များနှင့် deployment ပုံစံများကို လွယ်ကူစွာနားလည်နိုင်စေခဲ့သည်

#### Technical Details
- CustomerAgent ကို ကိုယ်စားပြု၍ Mermaid architecture diagrams များကို ပြင်ဆင်ထားသည်
- Python ဥပမာများတွင် CoraAgent class အမည်များကို CustomerAgent ဖြင့် အစားထိုးထားသည်
- ARM template JSON configuration များကို "customer" agent type အသုံးပြုရန် ပြင်ဆင်ထားသည်
- Environment variables များကို CORA_AGENT_* မှ CUSTOMER_AGENT_* ပုံစံသို့ အပ်ဒိတ်ပြောင်းလဲထားသည်
- deployment command များနှင့် container configuration များအားလုံးကို ပြန်လည်အသစ်ပြင်ဆင်ထားသည်

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: စတင်မှုအနေဖြင့် AI developer များနှင့် engineer များကို ဦးစားပေးထားသော စနစ်တကျ ပြန်လည်ဖွဲ့စည်းမှု
- **Microsoft Foundry Integration Guide**: AZD ကို Microsoft Foundry services များနှင့်ဆက်သွယ်ရာအတွက် စုံလင်သည့် စာတမ်းများ
- **AI Model Deployment Patterns**: မော်ဒယ်ရွေးချယ်မှု၊ ဖွန်ချ်ချိန်ညှိနှိုင်းမှုနှင့် production သို့ ထုတ်ပြန်ခြင်း များကို ကောင်းစွာဖော်ပြထားသည့် လမ်းညွှန်စာမျက်နှာ
- **AI Workshop Lab**: AI applications များကို AZD ဖြင့် deploy ပြုလုပ်နိုင်ရန် ပြောင်းလဲသင်ကြားရန် 2-3 နာရီကြာ hands-on workshop
- **Production AI Best Practices**: AI workloads များအတွက် များပြားစွာ အသုံးပြုနိုင်သော scaling, monitoring, နှင့် security ပုံစံများ
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, နှင့် AI deployment စာရင်းများဆိုင်ရာ ပြဿနာများအတွက် စုံလင်သည့် troubleshooting ဗျူဟာများ
- **AI Template Gallery**: Microsoft Foundry templates များကို complexity ထိန်းသတ်ချက်များနှင့်အတူ ဖော်ပြထားသည့် စုစည်းမှု
- **Workshop Materials**: hands-on lab များနှင့် ကိုးကားအတွက် reference စာတမ်းများပါရှိသည့် workshop ပစ္စည်းတစ်ထုပ်

#### Enhanced
- **README Structure**: AI-developer အာရုံစိုက်ထားသော ဖွဲ့စည်းပုံ၊ Microsoft Foundry Discord မှ community စိတ်ဝင်စားမှု အချက်အလက် 45% ကို ထည့်သွင်းထားသည်
- **Learning Paths**: 학생များနှင့် DevOps engineer များအတွက် ရိုးရာ learning path များအပြင် dedicated AI developer ခရီးစဉ်ကို ထည့်သွင်းထားသည်
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, နှင့် openai-chat-app-quickstart အပါအဝင် သတ်မှတ်ထားသော AI templates များကို ဖော်ပြထားသည်
- **Community Integration**: AI-specific channel များနှင့် ဆွေးနွေးမှုများပါရှိသော Discord community ကို တိုးချဲ့ထားသည်

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication နှင့် security configuration များ
- **Cost Optimization**: Token usage tracking နှင့် AI workloads တွင် ဘတ်ဂျက်ထိန်းချုပ်မှုများ
- **Multi-Region Deployment**: global AI application deployment အတွက် စနစ်များ
- **Performance Monitoring**: AI-specific metrics နှင့် Application Insights ကိုပေါင်းစပ်သုံးစွဲခြင်း

#### Documentation Quality
- **Linear Course Structure**: beginner မှ advanced AI deployment ပုံစံများသို့ တန်းတန်းလိုက် တိုးတက်သွားစေသည့် အစီအစဉ်
- **Validated URLs**: အပြင် repository link အားလုံးကို စစ်ဆေးသပ်ရပ်ပြီး အသုံးပြုနိုင်စေ
- **Complete Reference**: အတွင်းပိုင်း documentation link အားလုံး အလုပ်လုပ်နိုင်စေရန် စစ်ဆေးထားသည်
- **Production Ready**: အထူးသုံးသူများအတွက် enterprise deployment ပုံစံများနှင့် အမှန်တကယ် အသုံးပြုနိုင်သော ဥပမာများ

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: documentation စာမျက်နှာများအားလုံးတွင် Introduction, Learning Goals, နှင့် Learning Outcomes အပိုင်းများ ထည့်သွင်းထားသည်
- **Navigation System**: ทุก documentation များတွင် Previous/Next lesson links များ ထည့်သွင်းပြီး လမ်းညွှန်ပုံစံဖြင့် ဆက်လက်လေ့လာနိုင်စေသည်
- **Study Guide**: learning objectives, practice exercises, နှင့် assessment materials ပါရှိသည့် comprehensive study-guide.md
- **Professional Presentation**: ပထမဦးဆုံး ဖော်ပြချက်များမှ emoji icon များကို ဖယ်ရှားပြီး 접근성နှင့် professional ဖြစ်ပေါ်မှုတိုးတက်စေခဲ့သည်
- **Enhanced Content Structure**: learning materials များ၏ အစုအဝေးနှင့် စဉ်ဆက်ဖြစ်စဉ်ကို ပြုပြင်တိုးမြှင့်ထားသည်

#### Changed
- **Documentation Format**: စာတမ်းများအားလုံးကို တစ်သံတည်း learning-focused ဖွဲ့စည်းပုံဖြင့် စံချိန်သတ်မှတ်ထားသည်
- **Navigation Flow**: learning materials အားလုံးအတွင်း အဆင့်လိုက် တိုးတက်မှုကို အရသာရှိအောင် ပြုပြင်ထားသည်
- **Content Presentation**: ကိုယ်ကျေနပ်စရာ အလှဆင်သည့် အချက်များကို ဖယ်ရှား၍ ရိုးရှင်းသည့် professional ဖော်ပြချက်ကို ဦးစားပေးထားသည်
- **Link Structure**: navigation system အသစ်ကို ထောက်ပံ့ရန် အတွင်းလင့်များအား အပ်ဒိတ်ပြုလုပ်ထားသည်

#### Improved
- **Accessibility**: screen reader များအတွက် emoji များမလိုအပ်အောင် ဖယ်ရှားပြီး မျက်နှာဖုံးရောက်မှုတိုးတက်စေခဲ့သည်
- **Professional Appearance**: သက်ဆိုင်ရာ စီးပွားရေးနှင့် သင်ယူမှုများအတွက် သင့်တော်သည့် ရိုးရှင်းသည့် ပုံစံ
- **Learning Experience**: သင်ခန်းစာတိုင်းအတွက် ရည်မှန်းချက်များနှင့် ရလဒ်များကို ဖော်ထုတ်ထားသည့် စနစ်တကျနည်းလမ်း
- **Content Organization**: ဆက်စပ်သောခေါင်းစဉ်များအကြား အဆက်အသေးအဖွဲ့၍ ကောင်းမွန်စွာ ဖော်စပ်ထားသည်

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Windows, macOS, နှင့် Linux များအတွက် installation နှင့် configuration လမ်းညွှန်ချက်များ
- **Multiple Skill Levels**: ကျောင်းသားများမှ professional developer များအထိ သင်ယူနိုင်သောအဆင့်များအတွက် ဒီဇိုင်းပြုထားသည်
- **Practical Focus**: လက်တွေ့အသုံးပြုနိုင်သော ဥပမာများနှင့် အမှန်တကယ်ဖြစ်သော ရုပ်သိမ်းပုံရိပ်များ
- **Comprehensive Coverage**: အခြေခံအတွေးများမှ advanced enterprise ပုံစံများအထိ ဖုံးလွှမ်းထားသည်
- **Security-First Approach**: လုံခြုံရေးအကောင်းမြင်ချက်များကို အစဉ်အမြဲ ထည့်သွင်းထားသည်
- **Cost Optimization**: အသုံးပြုမှုကုန်ကျစရိတ် သက်သာစေရန် လမ်းညွှန်ချက်များ

#### Documentation Quality
- **Detailed Code Examples**: လက်တွေ့နှင့် စမ်းသပ်ပြီးသော code နမူနာများ
- **Step-by-Step Instructions**: ရှင်းလင်း၍ လုပ်ဆောင်နိုင်သည့် အဆင့်လိုက် ညွှန်ပြချက်များ
- **Comprehensive Error Handling**: အများဆုံ ဖြစ်ပေါ်တတ်သော ပြဿနာများအတွက် troubleshooting
- **Best Practices Integration**: စက်မှုလုပ်ငန်းစံနှင့် အကြံပြုချက်များ ပေါင်းစပ်ထားသည်
- **Version Compatibility**: နောက်ဆုံး Azure services နှင့် azd အစီအစဉ်များနှင့် သင့်တော်အောင် ထိန်းသိမ်းထားသည်

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, နှင့် custom models များအတွက် integration pattern များ
- **AI Agent Frameworks**: LangChain, Semantic Kernel, နှင့် AutoGen deployments အတွက် template များ
- **Advanced RAG Patterns**: Azure AI Search အပြင် Pinecone, Weaviate စသဖြင့် vector database ရွေးချယ်မှုများ
- **AI Observability**: မော်ဒယ် performance, token အသုံးပြုမှု, နှင့် response မှတ္တမ်းအရည်အသွေးများအတွက် monitoring တိုးတက်စေမှု

#### Developer Experience
- **VS Code Extension**: AZD + Microsoft Foundry အတွက် ပေါင်းစပ်ထားသည့် development အတွေ့အကြုံ
- **GitHub Copilot Integration**: AI ကူညီပေးသည့် AZD template ဖန်တီးမှု
- **Interactive Tutorials**: AI စက်မှုလုပ်ငန်းများအတွက် automated validation ပါရှိသည့် hands-on coding လေ့ကျင့်ခန်းများ
- **Video Content**: AI deployments များအပေါ် ဗီဒီယို သင်ကြားမှုများ

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, နှင့် audit trail များ
- **Multi-Tenant AI**: သီးခြားထားသော AI ဝန်ဆောင်မှုများဖြင့် ငွေပေးချေခွင့်မိတျသော ဖောက်သည်များစွာကို service ပေးနိုင်သော ပုံစံများ
- **Edge AI Deployment**: Azure IoT Edge နှင့် container instances ဖြင့် ပေါင်းစည်းခြင်း
- **Hybrid Cloud AI**: မျိုးစုံ cloud နှင့် hybrid deployment ပုံစံများ

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning pipelines နှင့် MLOps ပေါင်းစည်းမှု
- **Advanced Security**: Zero-trust patterns, private endpoints, နှင့် advanced threat protection
- **Performance Optimization**: high-throughput AI applications များအတွက် တိုက်ရိုက်ညှိနှိုင်းခြင်းနှင့် scaling နည်းလမ်းများ
- **Global Distribution**: AI applications များအတွက် content delivery နှင့် edge caching ပုံစံများ

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Microsoft Foundry integration အပြည့်အစုံ (Completed)
- ✅ **Interactive Tutorials**: hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: IDE နှင့် editor ပေါင်းစည်းမှုလမ်းညွှန်ချက်များ တိုးချဲ့မှု
- ✅ **Monitoring Expansion**: AI-specific monitoring နှင့် alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: mobile learning အတွက် responsive design
- **Offline Access**: downloadable documentation package များ
- **Enhanced IDE Integration**: AZD + AI workflow များအတွက် VS Code extension
- **Community Dashboard**: real-time community metrics နှင့် contribution tracking

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
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: AI service integration နှင့် deployment သတင်းအချက်အလက်များ၏ မှန်ကန်မှုအပေါ် ဖော်ပြချက်များ
- **Learning Experience**: AI developer သင်ယူမှု စီးဆင်းမှုကို တိုးတက်စေသည့် အကြံပေးချက်များ
- **Missing AI Content**: ထပ်မံ လိုအပ်သေးသော AI templates, patterns, သို့မဟုတ် ဥပမာများအတွက် တောင်းဆိုချက်များ
- **Accessibility**: အမျိုးမျိုးသောသင်ယူခွင့်များအတွက် တိုးတက်စေရန် အကြံပြုချက်များ
- **AI Tool Integration**: AI development workflow ပေါင်းစည်းမှုကို ပိုမိုကောင်းမွန်စေရန် အကြံပြုချက်များ
- **Production AI Patterns**: enterprise AI deployment ပုံစံများအတွက် တောင်းဆိုချက်များ

### Response Commitment
- **Issue Response**: Report ပြဿနာများအတွက် 48 နာရီအတွင်းပြန်လည်ဖြေကြားမှု
- **Feature Requests**: တောင်းဆိုချက်များကို တစ်ပါတ်အတွင်း အကဲဖြတ်မှု
- **Community Contributions**: တစ်ပါတ်အတွင်း ပြန်လည်သုံးသပ်မှု
- **Security Issues**: အရေးပေါ် ဦးစားပေးပြီး အမြန်ဆုံးပြန်လည်ဆောင်ရွက်မှု

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: content မှန်ကန်မှုနှင့် link သက်ရောက်မှု စစ်ဆေးခြင်း
- **Quarterly Updates**: အကြီးစား content ထည့်သွင်းမှုများနှင့် တိုးတက်မှုများ
- **Semi-Annual Reviews**: စနစ်တကျ ပြုပြင်မွမ်းမံခြင်းနှင့် တိုးတက်မှုများ
- **Annual Releases**: အကြီးစား version update များနှင့် အရေးပါသော တိုးတက်မှုများ

### Monitoring and Quality Assurance
- **Automated Testing**: code နမူနာများနှင့် link များကို အလိုအလျောက် စစ်ဆေးခြင်း
- **Community Feedback Integration**: အသုံးပြုသူ တောင်းဆိုချက်များကို ပုံမှန် တင်ပြထည့်သွင်းခြင်း
- **Technology Updates**: နောက်ဆုံး Azure services နှင့် azd releases များနှင့် ကိုက်ညီစေရန် အဆက်မပြတ် သက်ဆိုင်မှု ထိန်းသိမ်းခြင်း
- **Accessibility Audits**: ဝင်ရောက်လေ့လာသူများအတွက် အပြန်အလှန် ဒီဇိုင်းမူဝါဒများကို ပုံမှန် စစ်ဆေးခြင်း

## Version Support Policy

### Current Version Support
- **နောက်ဆုံး မေဂျာ ဗားရှင်း**: ပုံမှန် အပ်ဒိတ်များနှင့် အပြည့်အစုံ ပံ့ပိုးမှု
- **ယခင် မေဂျာ ဗားရှင်း**: လုံခြုံရေး အပ်ဒိတ်များနှင့် အရေးကြီး ပြုပြင်ချက်များကို 12 လအထိ ပေးဆောင်မည်
- **အဟောင်းဗားရှင်းများ**: အသိုင်းအဝိုင်းမှပဲ ပံ့ပိုးမှု ရရှိ하며 တရားဝင် အပ်ဒိတ် မရှိပါ

### လွှဲပြောင်း လမ်းညွှန်
မေဂျာ ဗားရှင်းများ ထုတ်ပြန်သောအခါ၊ ကျွန်ုပ်တို့ပေးဆောင်သည့် အရာများ:
- **လွှဲပြောင်း လမ်းညွှန်များ**: အဆင့်လိုက် လွှဲပြောင်းနည်း ညွှန်ကြားချက်များ
- **ကိုက်ညီမှု မှတ်စုများ**: ကိုက်ညီမှုကို ပျက်စီးစေသော ပြောင်းလဲမှုများအကြောင်း အသေးစိတ်
- **ကိရိယာ ပံ့ပိုးမှု**: လွှဲပြောင်းရာတွင် အကူအညီပေးရန် script များ သို့မဟုတ် utility များ
- **အသိုင်းအဝိုင်း ပံ့ပိုးမှု**: လွှဲပြောင်းနှင့် ပတ်သက်သော မေးခွန်းများအတွက် အထူး ဖိုရမ်များ

---

**လမ်းကြောင်း**
- **ယခင် သင်ခန်းစာ**: [လေ့လာရေး လမ်းညွှန်](resources/study-guide.md)
- **နောက်ထပ် သင်ခန်းစာ**: သို့ ပြန်သွားရန် [အဓိက README](README.md)

**နောက်ဆုံးအချက်အလက်များကို သိရှိထားပါ**: ဒီ repository ကို စောင့်ကြည့်ပြီး ထုတ်ဝေမှုအသစ်များနှင့် သင်ယူရေးပစ္စည်းများဆိုင်ရာ အရေးကြီး အပ်ဒိတ်များအတွက် အသိပေးချက်များကို လက်ခံပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် တိကျမှုနည်းပါးမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာရွက်ကို မူလဘာသာဖြင့် ရှိသည့် အကျိုးသက်ရောက်သော အရင်းအမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးပါတဲ့ သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သော နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ်မှားယွင်းမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
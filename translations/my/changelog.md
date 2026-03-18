# ပြောင်းလဲမှုမှတ်တမ်း - AZD For Beginners

## နိဒါန်း

ဤ ပြောင်းလဲမှုမှတ်တမ်းတွင် AZD For Beginners repository တွင် ဖြစ်ပေါ်ခဲ့သည့် ထင်သာလောက်ရာ ပြောင်းလဲမှုများ၊ အပ်ဒိတ်များနှင့် တိုးတက်မှုများကို စာရင်းတင်ထားပါတယ်။ ကျွန်ုပ်တို့သည် semantic versioning စံနှုန်းများကို လိုက်နာကာ ဗားရှင်းများအကြား ဘာတွေပြောင်းလဲထားသလဲဆိုတာ အသုံးပြုသူများဘယ်လိုနားလည်ရမယ်ဆိုတာ ကူညီရန် ဤ မှတ်တမ်းကို ထိန်းသိမ်းထားပါသည်။

## သင်ယူစရာရည်မှန်းချက်များ

ဤ ပြောင်းလဲမှုမှတ်တမ်းကို ပြန်လည်လေ့လာခြင်းအားဖြင့် သင်သည်
- လတ်တလော ထည့်သွင်းထားသည့် feature များနှင့် အကြောင်းအရာများအကြောင်း အသိပေးချက်များ ရယူနိုင်မည်
- ရှိပြီးသား စာရွက်စာတမ်းများ၌ ပြုလုပ်ထားသည့် တိုးတက်မှုများကို နားလည်နိုင်မည်
- အမှားပြင်ဆင်ချက်များနှင့် ကျင့်သုံးချက်များအား ကြည့်ရှု၍ တိကျမှန်ကန်မှုကို သေချာစေမည်
- သင်ယူမှုပစ္စည်းများ၏ တိုးတက်ဖွံ့ဖြိုးမှုကို အချိန်အခါနှင့်အမျှ ဆက်လက်လိုက်လံနိုင်မည်

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ပြောင်းလဲမှုမှတ်တမ်းအEntries များကို ပြန်လည်ကြည့်ရှုပြီးနောက် သင်သည်
- သင်ယူရန် အသစ်ဖြစ်ထွန်းလာသည့် အကြောင်းအရာများနှင့် အရင်းအမြစ်များကို ဖော်ထုတ်နိုင်မည်
- မည်သည့် အပိုင်းများကို အပ်ဒိတ်လုပ်ပြီး ထိန်းသိမ်းထားသလဲဆိုတာ နားလည်နိုင်မည်
- လတ်တလောအချက်အလက်များအပေါ် အခြေခံ၍ သင်၏ သင်ယူမှုလမ်းကြောင်းကို စီစဉ်နိုင်မည်
- အနာဂတ်တိုးတက်မှုများအတွက် တုံ့ပြန်ချက်များနှင့် အကြံပေးချက်များ ပေးပို့နိုင်မည်

## ဗားရှင်းဖြတ်သန်းမှတ်တမ်း

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**ဤဗားရှင်းမှာ `azd ai`, `azd extension`, နှင့် `azd mcp` ကဲ့သို့သော command များကို AI ဆိုင်ရာ အခန်းတွေရဲ့ မျိုးစုံတွင် ဖြန့်ဝေမှုရှိစေပြီး agents.md တွင် ပျက်စီးနေသော link များနှင့် ဟောင်းနေသော code များကို ပြင်ဆင်ခဲ့သည်၊ cheat sheet ကို အပ်ဒိတ်လုပ်လိုက်ပြီး Example Templates အပိုင်းကို အပြည့်အဝ ပြန်လည်စစ်ဆေးထားသော ဖော်ပြချက်များနှင့် အသစ်ထည့်သွင်းထားသော Azure AI AZD templates များဖြင့် ပြောင်းလဲတိုးချဲ့ထားသည်။**

#### Added
- **🤖 AZD AI CLI ကဲ့သို့သော coverage** ကို ဖိုင် 7 ဖိုင် အတွင်း တိုးချဲ့ထားသည် (မဖြစ်ခင်တွင် Chapter 8 မှာပဲ ပါဝင်ခဲ့သည်)။
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section သစ်တွင် `azd extension`, `azd ai agent init`, နှင့် `azd mcp` ကို ဆိုင်းငံ့မထားဘဲ မိတ်ဆက်ပေးထားသည်
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` နှင့် template နည်းလမ်းနှင့် manifest နည်းလမ်းကို နှိုင်းယှဉ်ထားသည့် ကိန်းတန်းဇယားပါရှိသည်
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" နှင့် "Agent-First Deployment" များအတွက် အပိုင်းများ ထည့်သွင်းထားသည်
  - `docs/chapter-05-multi-agent/README.md` — Quick Start မှာ template-based နှင့် manifest-based deployment လမ်းကြောင်း နှစ်မျိုးကို ပြသထားသည်
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy အပိုင်းတွင် `azd ai agent init` ရွေးချယ်စရာ အနည်းငယ်ထည့်သွင်းထားသည်
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" အပိုင်းထည့်သွင်းထားသည်
  - `resources/cheat-sheet.md` — "AI & Extensions Commands" အပိုင်းသစ်ထည့်သွင်း၍ `azd extension`, `azd ai agent init`, `azd mcp`, နှင့် `azd infra generate` များကို ဖော်ပြထားသည်
- **📦 AZD AI ဥပမာ template များ အသစ်များ** ကို `microsoft-foundry-integration.md` တွင် ထည့်သွင်းထားသည်။
  - **azure-search-openai-demo-csharp** — .NET RAG chat ဖြစ်ပြီး Blazor WebAssembly, Semantic Kernel နှင့် voice chat ထောက်ပံ့မှုများ ပါဝင်သည်
  - **azure-search-openai-demo-java** — Langchain4J ကို အသုံးပြုသော Java RAG chat; ACA/AKS ဖြင့် deploy ရွေးချယ်နိုင်သည်
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, နှင့် Prompty ကို အသုံးပြုသော multi-agent စာရေးဆိုင်ရာ အက်ပလီကေးရှင်း
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ကို အသုံးပြုသည့် serverless RAG; Ollama local dev အထောက်အပံ့ပါရှိသည်
  - **chat-with-your-data-solution-accelerator** — အစိုးရ/ လုပ်ငန်းအဆင့် RAG accelerator ဖြစ်ပြီး admin portal, Teams အတွဲဖက်နှင့် PostgreSQL/Cosmos DB ရွေးချယ်စရာများပါရှိသည်
  - **azure-ai-travel-agents** — servers များကို .NET, Python, Java, နှင့် TypeScript ဖြင့် တည်ဆောက်ထားသည့် multi-agent MCP orchestration ကို ကိုးကားထားသည့် reference app
  - **azd-ai-starter** — Azure AI အခြေခံ အင်ဖရာစတက်ချာ Bicep starter template အနု
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) ကို ကိုးကားထားသည် (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next လင့်ခ်များသည် Chapter 2 README သင်ခန်းစာ အဆင့်အတန်းလိုက်အတိုင်း (Microsoft Foundry Integration → Agents → AI Model Deployment) ကို သေချာ လိုက်ဖက်အောင် ပြင်ဆင်ထားသည်
- **🔗 agents.md ပျက်စီးနေသော link များ**: `production-ai-practices.md` ကို `../chapter-08-production/production-ai-practices.md` သို့ ပြင်ဆင်ပြီး (3 ကြိမ်)
- **📦 agents.md ဟောင်းနေသော code များ**: `opencensus` ကို `azure-monitor-opentelemetry` + OpenTelemetry SDK ဖြင့် အစားထိုးပြောင်းလဲထားသည်
- **🐛 agents.md မှ မှားယွင်းသော API အသုံးပြုမှု**: `max_tokens` ကို `create_agent()` ထဲမှ ဘာသာရပ်ပေးပြီး `create_run()` အတွင်း `max_completion_tokens` အဖြစ် ရ 옮ထားသည်
- **🔢 agents.md token ကောက်ချက်နည်း**: မျှခွဲခြုံလေး `len//4` ခန့်မှန်းချက်ကို `tiktoken.encoding_for_model()` အသုံးပြုရန် ဖြည့်စွက်ပြောင်းလဲထားသည်
- **azure-search-openai-demo**: ဝန်ဆောင်မှုများကို "Cognitive Search + App Service" မှ "Azure AI Search + Azure Container Apps" သို့ ပြင်ဆင်ထားသည် (default host ကို Oct 2024 မှ ပြောင်းလဲခဲ့သည်)
- **contoso-chat**: ဖော်ပြချက်ကို repo ရဲ့ အမည်နှင့် နည်းပညာ သက်ရောက်မှုနှင့် ကိုက်ညီရန် Azure AI Foundry + Prompty ကို ကိုးကားသည့် ဖော်ပြချက်သို့ အပ်ဒိတ်လုပ်ထားသည်

#### Removed
- **ai-document-processing**: AZD template အဖြစ် အများပြည်သူ သို့ ဝင်ရောက်ချင်စိတ်မရှိသော repo ဖြစ်သောကြောင့် အလုပ်မလုပ်သော template ကို ဖယ်ရှားလိုက်သည်

#### Improved
- **📝 agents.md လက်တွေ့လုပ်ငန်းလုပ်ဆောင်မှုများ**: Exercise 1 တွင် အထင်မွန်းထားသော output နှင့် `azd monitor` အဆင့်ကို ပြသထားသည်; Exercise 2 တွင် FunctionTool အား register ပြုလုပ်သည့် လက်တွေ့ code ကို ပြည့်စုံ ထည့်သွင်းထားသည်; Exercise 3 တွင် မရှင်းလင်းသော ညွှန်ကြားချက်များကို concrete `prepdocs.py` command များဖြင့် အစားထိုးထားသည်
- **📚 agents.md အရင်းအမြစ်များ**: Azure AI Agent Service documents နှင့် quickstart များသို့ လက်ရှိ link များအဖြစ် အပ်ဒိတ်လုပ်ထားသည်
- **📋 agents.md Next Steps အကြောင်းအရာဇယား**: အပိုင်းအကုန်ဖုံးလွှမ်းသည့် AI Workshop Lab link ကို ထည့်သွင်းထားသည်

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

#### သင်တန်းလမ်းညွှန် မြှင့်တင်မှု
**ဤဗားရှင်းသည် README.md အတွင်း chapter navigation ကို အကောင်းမြင့်သော အကောင်အထည်ဖော်ထားသော ဇယားပုံစံဖြင့် တိုးတက်အောင် ပြုလုပ်ထားသည်။**

#### Changed
- **သင်တန်းမြေပုံဇယား (Course Map Table)**: တိုက်ရိုက် သင်ခန်းစာ လင့်ခ်များ၊ ထာဝရချိန် ခန့်မှန်းချက်များနှင့် ပြင်းထန်မှု အဆင့်သတ်မှတ်ချက်များ ဖြည့်စွက်ထားသည်
- **ဖိုလ်ဒါ သန့်ရှင်းမှု**: ပြန်မလိုအပ်သော ဟောင်းနေသော ဖိုလ်ဒါများ (deployment/, getting-started/, pre-deployment/, troubleshooting/) ကို ဖယ်ရှားထားသည်
- **လင့်ခ်စစ်ဆေးမှု**: Course Map ဇယားအတွင်းရှိ 21+ internal link များအားလုံး ကို စစ်ဆေးပြီး အတည်ပြုထားသည်

### [v3.16.0] - 2026-02-05

#### ထုတ်ကုန်အမည် အပ်ဒိတ်
**ဤဗားရှင်းသည် ထုတ်ကုန်ကို ယနေ့ရှိ Microsoft branding အရ အမည်များကို အပ်ဒိတ်လုပ်ထားသည်။**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: ဘာသာပြန်မထားသော ဖိုင်များအတွက် အားလုံးကို အပ်ဒိတ်လုပ်ထားသည်
- **Azure AI Agent Service → Foundry Agents**: ဝန်ဆောင်မှုအမည်ကို လက်ရှိ branding အတိုင်း ပြောင်းလဲထားသည်

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

#### အကြီးစား Repository ဖွဲ့စည်းပုံ ပြန်လည်ဖွဲ့စည်းခြင်း: Chapter အလိုက် ဖိုလ်ဒါ အမည်များ
**ဤဗားရှင်းတွင် စာရွက်စာတမ်းများကို ပိုမိုရှင်း明နားလင်းစေရန် သတ်သတ်မှတ်မှတ် Chapter ဖိုလ်ဒါများအား ဖွဲ့စည်းပေးထားသည်။**

#### ဖိုလ်ဒါနာမည်ပြောင်းလဲမှုများ
ဟောင်းနေသော ဖိုလ်ဒါများကို chapter-numbered ဖိုလ်ဒါများဖြင့် အစားထိုးထားသည်။
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### ဖိုင်များရွေ့ပြောင်းမှုများ
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 Chapter README ဖိုင်များ**: တစ်ခုချင်းစီသော chapter ဖိုလ်ဒါများအတွက် README.md ဖိုင်များ အသစ်ထည့်သွင်းထားပြီး အတွင်းတွင်:
  - သင်ယူရမည့် ရည်မှန်းချက်များနှင့် ကြာချိန်
  - သင်ခန်းစာဇယားနှင့် ဖော်ပြချက်များ
  - Quick start command များ
  - အခြား chapter များသို့ သွားရာ navigation ကို ထည့်သွင်းထားသည်

#### Changed
- **🔗 အတွင်းလင့်ခ်အားလုံးကို အပ်ဒိတ်**: စာရွက်စာတမ်းများအနှံ့ 78+ လမ်းကြောင်းများကို အပ်ဒိတ်လုပ်ထားသည်
- **🗺️ Main README.md**: Course Map ကို chapter အသစ်စနစ်အတိုင်း ထပ်ပြီး ပြင်ဆင်ထားသည်
- **📝 examples/README.md**: chapter ဖိုလ်ဒါများသို့ အညွှန်းများကို အပ်ဒိတ်လုပ်ထားသည်

#### Removed
- ဟောင်းနေသော ဖိုလ်ဒါ ပုံစံများ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository ဖွဲ့စည်းပုံ ပြန်လည်ဖွဲ့စည်းခြင်း: Chapter Navigation
**ဤဗားရှင်းတွင် chapter navigation README ဖိုင်များကို ထည့်သွင်းခဲ့သည် (v3.15.0 မှာ အစားထိုးတင်ထားသည်)।**

---

### [v3.13.0] - 2026-02-05

#### AI Agents လမ်းညွှန်အသစ်
**ဤဗားရှင်းတွင် Azure Developer CLI ဖြင့် AI agents များ deploy လုပ်ရာ အတွက် ပိုမိုတိကျစွာ လမ်းညွှန်ပေးသည့် လက်စွဲစာမျက်နှာ အသစ်တစ်ခု ထည့်သွင်းထားသည်။**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: အပြည့်အစုံ လမ်းညွှန်စာမျက်နှာတစ်ခုကို ထည့်သွင်းထားပြီး အောက်ပါအရာများကို ဖော်ပြသည်။
  - AI agents ဆိုသည်မှာ ဘာလဲ၊ chatbots များနှင့် ဘယ်လိုကွဲပြားသည်
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture ပုံစံများ (single agent, RAG, multi-agent)
  - Tool ဖွဲ့စည်းမှုနှင့် စိတ်ကြိုက်ပြင်ဆင်မှု
  - မော်နီတာနှင့် မက်ထရစ်စာရင်းကြည့်ခြင်း
  - ကုန်ကျစရိတ် စဉ်းစားချက်များနှင့် အကောင်းဆုံးအသုံးပြုမှု
  - လက်တွေ့ဖြေရှင်းမှု အခက်အခဲများနှင့် ကျော်ဖြတ်နည်းများ
  - အောင်မြင်ရေးသတ်မှတ်ချက်နှင့်အတူ လက်တွေ့လေ့လာရေး အလေ့အကျင့်သုံးခု

#### အကြောင်းအရာ ဖွဲ့စည်းပုံ
- **နိဒါန်း**: စတင်လေ့လာသူများအတွက် agent ကို မိတ်ဆက်ခြင်း
- **Quick Start**: `azd init --template get-started-with-ai-agents` ဖြင့် agents များကို deploy လုပ်ရန်
- **Architecture Patterns**: agent ပုံစံများ၏ ကြည့်ရှုနိုင်သော ဇယားများ
- **Configuration**: Tool စနစ်တပ်ဆင်ခြင်းနှင့် environment variable များ
- **Monitoring**: Application Insights နှင့် ပေါင်းစည်းခြင်း
- **Exercises**: တိုးတက်လျှင် လက်တွေ့ လေ့လာနိုင်သော လေ့ကျင့်ခန်းများ (တစ်ခုလျှင် 20-45 မိနစ်)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment အပ်ဒိတ်
**ဤဗားရှင်းတွင် ဖွံ့ဖြိုးရေး container ကို လက်ရှိကာလနှင့် သင့်တော်သည့် ကိရိယာများနှင့် အကောင်းဆုံး default များဖြင့် အပ်ဒိတ်ပြုလုပ်ထားသည်၊ ဤသည်ဖြင့် AZD သင်ယူမှုအတွေ့အကြုံ တိုးတက်စေသည်။**

#### Changed
- **🐳 Base Image**: `python:3.12-bullseye` မှ `python:3.12-bookworm` (latest Debian stable) သို့ အပ်ဒိတ်ပြောင်းလဲထားသည်
- **📛 Container အမည်**: clarity ရရှိစေရန် "Python 3" မှ "AZD for Beginners" အမည်သို့ ပြောင်းပြင်ထားသည်

#### Added
- **🔧 ဖွံ့ဖြိုးရေး ကွန်တိန်းနာ အသစ်အင်္ဂါရပ်များ**:
  - `azure-cli` သည် Bicep အတွက် အထောက်အပံ့ ဖွင့်ထားပါသည်
  - `node:20` (AZD templates များအတွက် LTS ဗားရှင်း)
  - `github-cli` ကို template များ စီမံခန့်ခွဲရန်
  - `docker-in-docker` ကို container app များကို deploy လုပ်ရန်

- **🔌 Port Forwarding**: လူသုံးများသော ဖွံ့ဖြိုးရေးအတွက် ကြိုတင် ဖော်ပြထားသော ports:
  - 8000 (MkDocs ကြိုတင်ပြသခြင်း)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 VS Code အတွက် Extension အသစ်များ**:
  - `ms-python.vscode-pylance` - Python IntelliSense ကို မြှင့်တင်ပေးသည်
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions အထောက်အပံ့
  - `ms-azuretools.vscode-docker` - Docker အထောက်အပံ့
  - `ms-azuretools.vscode-bicep` - Bicep ဘာသာစကား အထောက်အပံ့
  - `ms-azure-devtools.azure-resource-groups` - Azure resource စီမံခန့်ခွဲမှု
  - `yzhang.markdown-all-in-one` - Markdown တည်းဖြတ်ခြင်း
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid စရန်ပုံများ အထောက်အပံ့
  - `redhat.vscode-yaml` - YAML အထောက်အပံ့ (azure.yaml အတွက်)
  - `eamodio.gitlens` - Git ကို ကြည့်ရှုမြင်သာစေခြင်း
  - `mhutchie.git-graph` - Git သမိုင်း

- **⚙️ VS Code Settings**: Python interpreter, ဖိုင်ကို သိမ်းသည့်အချိန်တွင် ဖော်မတ်လုပ်ခြင်းနှင့် whitespace ကို ဖြုတ်ဖယ်ပေးရန် စသည်တို့အတွက် မူရင်းချိန်ညှိချက်များ ထည့်သွင်းထားသည်

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify plugin ထည့်သွင်းထားသည်
  - code အရည်အသွေးအတွက် pre-commit ထည့်သွင်းထားသည်
  - Azure SDK ပက်ကေ့ချ်များ ထည့်သွင်းထားသည် (azure-identity, azure-mgmt-resource)

#### ပြုပြင်ခြင်းများ
- **Post-Create Command**: container start အချိန်တွင် AZD နှင့် Azure CLI တပ်ဆင်မှုကို အတည်ပြုသည်

---

### [v3.11.0] - 2026-02-05

#### စတင်လေ့လာသူအတွက် အဆင်ပြေသော README ပြင်ဆင်ခြင်း
**ဤဗားရှင်းသည် README.md ကို စတင်လေ့လာသူများအတွက် ပိုမိုလွယ်ကူစေရန် အရေးကြီးပြုပြင်ပြီး AI ဖွံ့ဖြိုးရေးသူများအတွက် မရှိမဖြစ်လိုအပ်သော အရင်းအမြစ်များကို ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းထားသည်
- **🆚 Azure CLI vs AZD နှိုင်းယှဉ်ချက်**: ဘယ်တ/tools ကို ဘယ်အချိန် အသုံးပြုရမည်ကို လက်တွေ့ နမူနာများနှင့် ဖော်ပြချက်ရှင်းလင်းတိကျစေခြင်း
- **🌟 Awesome AZD လင့်ခ်များ**: အသိုင်းအဝိုင်း၏ template ပြခန်းနှင့် ဖောင်ထည့်ပေးရန် အရင်းအမြစ်များသို့ တိုက်ရိုက် လင့်ခ်များ:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - တပ်ဆင်ရန် ပြင်ဆင်ပြီးသော template များ 200+ 
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - အသိုင်းအဝိုင်း ပါဝင်ပို့ခွင့်
- **🎯 Quick Start Guide**: စတင်ရန် လွယ်ကူသည့် 3 အဆင့် ဝန်းကျင် (Install → Login → Deploy)
- **📊 အတွေ့အကြုံအပေါ် အခြေခံ၍ လမ်းညွှန်ပေးသည့် ဇယား**: ဖွံ့ဖြိုးရေးသူ အတွေ့အကြုံအလိုက် မည်နေရာမှ စတင်ရသည်ကို ဖော်ပြထားသည်

#### ပြောင်းလဲခဲ့သည်
- **README ဖွဲ့စည်းပုံ**: မကျန်ရစ်စွာ ဖော်ပြပေးရန် အဖွဲ့အစည်း ပြင်ဆင်ထားပြီး အချက်အလက် အရေးကြီးဆုံးကို မူလဦးစွာထားသည်
- **မိတ်ဆက် အပိုင်း**: "The Magic of `azd up`" ကို စတင်လေ့လာသူများအတွက် ရှင်းလင်းစွာ ရေးသားပြန်လည်ပြင်ဆင်ထားသည်
- **ထပ်ထွက် duplicate အကြောင်းအရာများကို ဖယ်ရှားလိုက်သည်**: အခက်အခဲ ဖြေရှင်းခြင်း အပိုင်း ထပ်နေသည်များ ရှင်းလင်းပြီး ဖယ်ထုတ်ထားသည်
- **Troubleshooting Commands**: `azd logs` ကို သက်ဆိုင်သော `azd monitor --logs` သို့ ပြောင်းလဲ၍ မှားယွင်းချက်များကို ပြင်ဆင်ထားသည်

#### ပြုပြင်ပြီးသည့် အချက်များ
- **🔐 Authentication Commands**: cheat-sheet.md တွင် `azd auth login` နှင့် `azd auth logout` ကို ထည့်သွင်းထားသည်
- **မမှန်ကန်သော Command အညွှန်းများ**: README troubleshooting အပိုင်းမှ ကျန်ရှိခဲ့သော `azd logs` ကို ဖယ်ရှားထားသည်

#### မှတ်စုများ
- **Scope**: ပြောင်းလဲမှုများကို main README.md နှင့် resources/cheat-sheet.md တို့တွင် အသုံးပြုထားသည်
- **ရည်ညွှန်းထားသည့် ပရဟိတ**: AZD အသစ်သင်ကြားရေးအတွက် စတင်လေ့လာသူများကို အထူးရည်ရွယ်သည်

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command တိကျမှု အပ်ဒိတ်
**ဤဗားရှင်းသည် စာရွက်စာတမ်းများအတွင်း မရှိနိုင်သော AZD command များကို ပြန်လည်ဖယ်ရှား၍ Azure Developer CLI သင်္ကေတများအားလုံး တိကျစေရန် ဥပမာကုဒ်များကို ပြင်ဆင်ထားသည်။**

#### ပြုပြင်ထားသည်
- **🔧 မရှိ/မှားနေသော AZD Commands များ ဖယ်ရှားပြီး ပြင်ဆင်ထားသည်**: မမှန်ကန်သော command များကို ကြိုတင်စစ်ဆေးပြီး ပြင်ဆင်ထားသည်။
  - `azd logs` (မရှိ) → `azd monitor --logs` သို့မဟုတ် Azure CLI အခြားရွေးချယ်စရာများဖြင့် အစားထိုးထားသည်
  - `azd service` subcommands (မရှိ) → `azd show` နှင့် Azure CLI ကို အသုံးပြုရန် အစားထိုးထားသည်
  - `azd infra import/export/validate` (မရှိ) → ဖယ်ရှား သို့မဟုတ် မှန်ကန်သည့် အခြားနည်းလမ်းဖြင့် အစားထိုးထားသည်
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (မရှိ) → ဖယ်ရှားထားသည်
  - `azd provision --what-if/--rollback` flags (မရှိ) → `--preview` အသုံးပြုရန် အပ်ဒိတ်ပြုလုပ်ထားသည်
  - `azd config validate` (မရှိ) → `azd config list` ဖြင့် အစားထိုးထားသည်
  - `azd info`, `azd history`, `azd metrics` (မရှိ) → ဖယ်ရှားထားသည်

- **📚 Command များ ပြင်ဆင်ထားသော ဖိုင်များ**:
  - `resources/cheat-sheet.md`: Command ကိုးကားစာရင်း အပြည့်အစုံ ပြင်ဆင်ထားသည်
  - `docs/deployment/deployment-guide.md`: Rollback နှင့် deployment မျက်နှာစာရင်းများ ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/debugging.md`: log စိစစ်မှု အပိုင်းများကို မှန်ကန်စေသည်
  - `docs/troubleshooting/common-issues.md`: Troubleshooting command များ အပ်ဒိတ်
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD debugging အပိုင်း ပြင်ဆင်ထားသည်
  - `docs/getting-started/azd-basics.md`: monitoring command များ ပြင်ဆင်ထားသည်
  - `docs/getting-started/first-project.md`: monitoring နှင့် debugging ဥပမာများကို အပ်ဒိတ်လုပ်ထားသည်
  - `docs/getting-started/installation.md`: help နှင့် version ဥပမာများ ကို ပြင်ဆင်ထားသည်
  - `docs/pre-deployment/application-insights.md`: log ကြည့်ရှုမှုပြဿနာများ ကို ပြင်ဆင်ထားသည်
  - `docs/pre-deployment/coordination-patterns.md`: agent debugging ဥပမာများကို ပြင်ဆင်ထားသည်

- **📝 ဗားရှင်း ကိုးကား အပ်ဒိတ်**:
  - `docs/getting-started/installation.md`: 1.5.0 ဟု ခိုင်လုံစွာ သတ်မှတ်ထားသော ဗားရှင်း ကို `1.x.x` အဖြစ် အစားထိုးထားပြီး releases link ထည့်ထားသည်

#### ပြောင်းလဲချက်များ
- **Rollback နည်းဗျူဟာများ**: AZD တွင် native rollback မရှိသောကြောင့် Git အခြေပြု rollback ကို အသုံးပြုရန် ညွှန်ပြထားသည်
- **Log ကြည့်ရှုခြင်း**: `azd logs` မှ အညွှန်းများကို `azd monitor --logs`, `azd monitor --live` နှင့် Azure CLI command များဖြင့် အစားထိုးထားသည်
- **Performance အပိုင်း**: မရှိသော parallel/incremental deployment flags များကို ဖယ်ရှားပြီး မှန်ကန်သော ရွေးချယ်စရာများ ပေးထားသည်

#### နည်းပညာဆိုင်ရာ အသေးစိတ်
- **မှန်ကန်သော AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **azd monitor အတွက် မှန်ကန်သော Flags များ**: `--live`, `--logs`, `--overview`
- **ဖယ်ရှားလိုက်သော အင်္ဂါရပ်များ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### မှတ်စုများ
- **စစ်ဆီးမှု**: Commands အားလုံးကို Azure Developer CLI v1.23.x နှင့် ကိုက်ညီမှု ရှိကြောင်း အတည်ပြုထားသည်

---

### [v3.9.0] - 2026-02-05

#### ဝေါ့ရှော့(Workshop) ပြီးမြောက်မှုနှင့် စာတမ်းရည်မှန်းချက် အရည်အသွေး အပ်ဒိတ်
**ဤဗားရှင်းသည် အပြန်အလှန် ဆွေးနွေးနိုင်သည့် workshop modules များကို ပြီးစီးစေပြီး ချက်ချင်းပျက်ကွက်နေသော စာတမ်းလင့်ခ်များကို ပြုပြင်ကောင်းမွန်စေသည်၊ Microsoft AZD အသုံးပြုသော AI ဖွံ့ဖြိုးရေးသူများအတွက် အကြောင်းအရာအရည်အသွေးကို မြှင့်တင်ထားသည်။**

#### ထည့်သွင်းထားသည်
- **📝 CONTRIBUTING.md**: အသစ်ထည့်သွင်းထားသော လှုံ့ဆော်မှု စည်းကမ်းများစာတမ်း၊ ယင်းတွင်:
  - ပြဿနာအစီအစဉ် တင်ရန်နှင့် ပြင်ဆင်မှု အကြံပြုရန် သတ်မှတ်ချက်များ
  - အကြောင်းအရာ အသစ်များအတွက် စာတမ်းစံနှုန်းများ
  - ကုဒ်နမူနာ ညွှန်ကြားချက်များနှင့် commit message စံနစ်များ
  - အသိုင်းအဝိုင်း ပါဝင်ဆောင်ရွက်ရေး သတင်းအချက်အလက်များ

#### အပိုင်းများ ပြီးမြောက်စေပြီး
- **🎯 Workshop Module 7 (Wrap-up)**: Wrap-up module ကို အပြည့်အဝ ပြီးဆုံးထားပြီး:
  - Workshop အပြုပ်အတွဲ အကျဉ်းချုံး
  - AZD, template များနှင့် Microsoft Foundry ကို ကွဲပြားစွာ နားလည်ပြီး မိတ်ဆက်ထားသည်
  - သင်ယူမှု ဆက်လက်လုပ်ရန် အကြံပြုချက်များ
  - Workshop challenge လေ့ကျင့်ခန်းများကို အတန်းအစား အဆင့်သတ်မှတ်ချက်များနှင့်ဖြင့်ထည့်သွင်းထားသည်
  - အသိုင်းအဝိုင်း အကြံပြုချက်နှင့် အထောက်အပံ့ လင့်ခ်များ

- **📚 Workshop Module 3 (Deconstruct)**: သင်ယူရည်ရွယ်ချက်များကို အပ်ဒိတ်လုပ်ထားပြီး:
  - GitHub Copilot နှင့် MCP servers ဖန်တီးခြင်း လုပ်ငန်းစဉ်များ ညွှန်ပြချက်
  - AZD template ဖိုလ်ဒါ ဖွဲ့စည်းပုံ အကြောင်းနားလည်မှု
  - Infrastructure-as-code (Bicep) စီမံခန့်ခွဲမှု ပုံစံများ
  - လက်တွေ့ လက်တွေ့လက်ခံ လေ့ကျင့်ခန်းများ

- **🔧 Workshop Module 6 (Teardown)**: ပြီးစီးထားပြီး:
  - အရင်းအမြစ် ရှင်းလင်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု ရည်ရွယ်ချက်များ
  - အင်ဖရာကို 안전하게 ဖယ်ရှားရန် `azd down` အသုံးပြုပုံ
  - Soft-deleted cognitive services ပြန်လည်ကောင်းမွန်စေရန် လမ်းညွှန်ချက်များ
  - GitHub Copilot နှင့် Azure Portal ကို အပိုစူးစမ်းရန် အကြံပြုချက်များ

#### ပြုပြင်ထားသည်
- **🔗 ပျက်ကွက်နေသော လင့်ခ်များ ပြုပြင်ခြင်း**: 15+ ကျော်သော အတွင်းရေးစာရွက်လင့်ခ်များကို ပြုပြင်ပြီး:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md သို့ လမ်းကြောင်းများ ပြင်ဆင်ထားသည်
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md နှင့် production-ai-practices.md လမ်းကြောင်းများကို ပြင်ဆင်ထားသည်
  - `docs/getting-started/first-project.md`: မရှိတော့သော cicd-integration.md ကို deployment-guide.md ဖြင့် အစားထိုးထားသည်
  - `examples/retail-scenario.md`: FAQ နှင့် troubleshooting ဂိုဏ်းလမ်းကြောင်းများ ကို ပြုပြင်ထားသည်
  - `examples/container-app/microservices/README.md`: course home နှင့် deployment guide လမ်းကြောင်းများ ပြင်ဆင်ထားသည်
  - `resources/faq.md` နှင့် `resources/glossary.md`: AI အခန်း အရင်းအမြစ် ကို အပ်ဒိတ်လုပ်ထားသည်
  - `course-outline.md`: instructor guide နှင့် AI workshop lab လမ်းကြောင်းများ ကို ပြင်ဆင်ထားသည်

- **📅 Workshop အခြေနေ ဘားနာ**: "Under Construction" မှ ဖေဖော်ဝါရီ 2026 နေ့စွဲနဲ့ active workshop အခြေအနေသို့ ပြောင်းလဲထားသည်

- **🔗 Workshop သွားလာမှု လမ်းကြောင်း**: workshop README.md တွင် lab-1-azd-basics ဖိုလ်ဒါ မရှိသည့် လမ်းကြောင်းများကို ပြင်ဆင်ထားသည်

#### ပြောင်းလဲချက်များ
- **Workshop တင်ဆက်မှု**: "under construction" သတိပေးမှုကို ဖယ်ရှားပြီး workshop ကို အပြည့်အဝ အသုံးပြုနိုင်အောင် ပြုပြင်ထားသည်
- **သွားလာမှု တိကျမှု**: အပိုင်းအလိုက် သွားလာရန် လမ်းညွှန်ချက်များကို စနစ်တကျ ထားရှိထားသည်
- **သင်ကြားမှုပုံစံ ရည်ညွှန်းချက်များ**: chapter များအကြား cross-reference များကို microsoft-foundry လမ်းကြောင်းများဖြင့် အပ်ဒိတ်ထားသည်

#### အတည်ပြုချက်များ
- ✅ အင်္ဂလိပ် markdown ဖိုင်များအားလုံးတွင် အတွင်းလင့်ခ်များ မှန်ကန်ပါသည်
- ✅ Workshop modules 0-7 အားလုံးသည် သင်ယူရည်ရွယ်ချက်များနှင့် အပြည့်အဝ ပြီးစီးပါပြီ
- ✅ အခန်းများနှင့် module များအကြား သွားလာမှု များသည် မှန်ကန်စွာ လုပ်ဆောင်နိုင်ပါသည်
- ✅ Microsoft AZD အသုံးပြုသော AI ဖွံ့ဖြိုးရေးသူများအတွက် အကြောင်းအရာ သင့်တော်သည်
- ✅ စတင်လေ့လာသူအတွက် ဘာသာစကားနှင့် ဖွဲ့စည်းပုံကို ထိန်းသိမ်းထားသည်
- ✅ CONTRIBUTING.md သည် အသိုင်းအဝိုင်း အတွက် ရှင်းလင်းသော လမ်းညွှန်ချက်များ ပေးထားသည်

#### နည်းပညာဆိုင်ရာ အကောင်အထည်ဖော်ချက်
- **လင့်ခ် စစ်ဆေးမှု**: Automated PowerShell script တစ်ခုက .md internal link အားလုံးကို စစ်ဆေးထားသည်
- **အကြောင်းအရာ စစ်ဆေးမှု**: Workshop ပြီးစီးမှုနှင့် စတင်လေ့လာသူအဆင်ပြေမှုအား လက်ဖြင့် စစ်ဆေးထားသည်
- ** navigation system **: chapter နှင့် module များအတွက် တူညီသော သွားလာမှု ပုံစံများကို အသုံးပြုထားသည်

#### မှတ်စုများ
- **Scope**: ပြောင်းလဲမှုများကို အင်္ဂလိပ် စာရွက်စာတမ်းများတွင်သာ အသုံးပြုထားသည်
- **ဘာသာပြန်ချက်များ**: ဤဗားရှင်းတွင် ဘာသာပြန် ဖိုလ်ဒါများကို အပ်ဒိတ်မပြုလုပ်ထားပါ (အလိုအလျောက် ဘာသာပြန်မှု နောက်ပိုင်းတွင် ကိုက်ညီစေမည်)
- **Workshop သင်ကြားချိန်**: ပြီးစီးသော workshop သည် လက်တွေ့ လေ့ကျင့်ရန် 3-4 နာရီ ကာလ ပေးသည်

---

### [v3.8.0] - 2025-11-19

#### အဆင့်မြင့် စာတမ်းများ: မျက်မှောက်ကြည့်ခြင်း (Monitoring), လုံခြုံရေး, နှင့် Multi-Agent ပုံစံများ
**ဤဗားရှင်းသည် Application Insights ပေါင်းစည်းခြင်း, authentication ပုံစံများနှင့် production deployments အတွက် multi-agent coordination ပုံစံများအပေါ် A-grade သင်ခန်းစာများကို လက်ခံထည့်သွင်းထားသည်။**

#### ထည့်သွင်းထားသည်
- **📊 Application Insights ပေါင်းစည်းမှု သင်ခန်းစာ**: `docs/pre-deployment/application-insights.md` တွင်-
  - AZD အာရုံစိုက်ထားသော deployment နည်းလမ်းများနှင့် အလိုအလျောက် provisioning
  - Application Insights + Log Analytics အတွက် ပြည့်စုံသော Bicep templates များ
  - custom telemetry ပါရှိသည့် Python application များ (1,200+ သင်္ကေတလိုင်း)
  - AI/LLM များအတွက် မော်နီတာလုပ်ပုံများ (Microsoft Foundry Models token/cost tracking)
  - 6 ခု의 Mermaid ပုံစံဇယားများ (architecture, distributed tracing, telemetry flow)
  - 3 ခု의 လက်တွေ့ လေ့ကျင့်ခန်းများ (alerts, dashboards, AI monitoring)
  - Kusto query ဥပမာများနှင့် ကုန်ကျစရိတ် အကောင်းဆုံး စီမံခန့်ခွဲမှု နည်းဗျူဟာများ
  - Live metrics streaming နှင့် အစစ်အမှန် အချိန် debugging
  - သင်ယူရန် 40-50 မိနစ် ကာလ အတိအကျနှင့် production-ready ပုံစံများ

- **🔐 Authentication နှင့် Security ပုံစံ သင်ခန်းစာ**: `docs/getting-started/authsecurity.md` တွင်-
  - authentication ပုံစံ 3 မျိုး (connection strings, Key Vault, managed identity)
  - လုံခြုံစိတ်ချရသော deployments အတွက် ပြည့်စုံသော Bicep infrastructure templates များ
  - Node.js application ကို Azure SDK နှင့် ပေါင်းစပ်ထားသော ကုဒ်နမူနာ
  - managed identity ဖွင့်ခြင်း၊ user-assigned identity၊ Key Vault rotation စသည်တို့အတွက် လေ့ကျင့်ခန်း 3 ခု
  - လုံခြုံရေး အကောင်းဆုံး လမ်းညွှန်ချက်များနှင့် RBAC ဆက်တင်များ
  - troubleshooting လမ်းညွှန်ချက်နှင့် ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာချက်
  - production-ready passwordless authentication ပုံစံများ

- **🤖 Multi-Agent Coordination ပုံစံ သင်ခန်းစာ**: `docs/pre-deployment/coordination-patterns.md` တွင်-
  - coordination ပုံစံ 5 မျိုး (sequential, parallel, hierarchical, event-driven, consensus)
  - ပြည့်စုံသော orchestrator service အကောင်အထည်ဖော်ချက် (Python/Flask, 1,500+ သင်္ကေတလိုင်း)
  - အထူးပြု agent များ 3 မျိုး (Research, Writer, Editor)
  - Service Bus အတွက် message queuing ပေါင်းစည်းမှု
  - Cosmos DB ကို distributed systems အတွက် state management အနေဖြင့် အသုံးပြုခြင်း
  - agent interaction များကို ဖော်ပြသည့် Mermaid ပုံစံ 6 ခု
  - အဆင့်မြင့် လေ့ကျင့်ခန်း 3 ခု (timeout handling, retry logic, circuit breaker)
  - ကုန်ကျစရိတ် ခွဲခြမ်းချက် ($240-565/month) နှင့် အကောင်းဆုံး စီမံခန့်ခွဲမှု နည်းဗျူဟာများ
  - မော်နီတာအတွက် Application Insights ပေါင်းစည်းထားခြင်း

#### တိုးတက်စေထားသည်
- **Pre-deployment အခန်း**: မော်နီတာနှင့် coordination ပုံစံများကို အပြည့်အစုံ ထည့်သွင်းထားသည်
- **Getting Started အခန်း**: ပရော်ဖက်ရှင်နယ် authentication ပုံစံများဖြင့် မြှင့်တင်ထားသည်
- **Production ပြင်ဆင်မှု**: လုံခြုံရေးမှ observability အထိ အပြည့်အ၀ ဖုံးလွှမ်းထားသည်
- **Course Outline**: Chapter 3 နှင့် 6 တွင် သင်ခန်းစာအသစ်များကို ရည်ညွှန်းထားသည်

#### ပြောင်းလဲချက်များ
- **သင်ယူမှု တိုးတက်မှု**: လုံခြုံရေးနှင့် monitoring ကို သင်ကြားမှုအတွင်း ပိုမို ထည့်သွင်းထားသည်
- **စာတမ်း အရည်အသွေး**: သင်ခန်းစာ အသစ်များတွင် A-grade နည်းစံအတိုင်း ထိန်းသိမ်းထားသည် (95-97%)
- **Production ပုံစံများ**: အစတွင်မှ အဆုံးအထိ Enterprise deployment များအတွက် ပြည့်စုံစွာ ဖော်ပြထားသည်

#### တိုးတက်မှုများ
- **Developer Experience**: ဖွံ့ဖြိုးရေးသူအတွေ့အကြုံ — ဖွံ့ဖြိုးမှုမှ ထုတ်လုပ်မှုဆီသို့ မော်နီတာလုပ်ငန်းသို့ သေချာရှင်းလင်းသော လမ်းကြောင်း
- **Security Standards**: လုံခြုံရေးစံနှုန်းများ — အတည်ပြုမှုနှင့် လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှုအတွက် ပရော်ဖက်ရှင်နယ် ပုံစံများ
- **Observability**: AZD ဖြင့် အပြည့်အစုံ Application Insights ပေါင်းစည်းမှု
- **AI Workloads**: Microsoft Foundry Models နှင့် multi-agent စနစ်များအတွက် အထူးပြု မော်နီတာလုပ်ငန်း

#### အတည်ပြု済
- ✅ သင်ခန်းစာအားလုံးတွင် အပြည့်အစုံ လုပ်ဆောင်နိုင်သော ကုဒ်များ ပါဝင်သည် (ကုတ်အပိုင်းအစ မဟုတ်ပါ)
- ✅ အမြင်ယူသင်ကြားရေးအတွက် Mermaid တိုက်ရိုက်ပုံဆွဲများ (စုစုပေါင်း 19 ခု၊ သင်ခန်းစာ 3 ခုတွင် ဖြန့်ဝေထားသည်)
- ✅ လက်တွေ့ လေ့ကျင့်ခန်းများနှင့် အတည်ပြုခြင်း အဆင့်များ ပါဝင်သည် (စုစုပေါင်း 9 ခု)
- ✅ `azd up` ဖြင့် တပ်ဆင်နိုင်သော ထုတ်လုပ်မှု အသင့် Bicep မော်ဒယ်များ
- ✅ ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာခြင်းနှင့် ထိရောက်စေရေး မဟာဗျူဟာများ
- ✅ ပြဿနာရှာဖွေရေး လမ်းညွှန်များနှင့် အကောင်းဆုံး လေ့ကျင့်မှုများ
- ✅ သိမြင်စစ်ဆေးရေးချက်များနှင့် အတည်ပြု အမိန့်များ

#### စာရွက်စာတမ်း အရည်အသွေး အကဲဖြတ် ရလဒ်
- **docs/pre-deployment/application-insights.md**: - အပြည့်အစုံ မော်နီတာ ညွှန်ကြားချက်
- **docs/getting-started/authsecurity.md**: - ပရော်ဖက်ရှင်နယ် လုံခြုံရေး ပုံစံများ
- **docs/pre-deployment/coordination-patterns.md**: - အဆင့်မြင့် multi-agent စနစ် ဆောက်လုပ်ပုံများ
- **Overall New Content**: - တူညီ၍ အရည်အသွေး မြင့်မားသော စံနှုန်းများ

#### နည်းပညာဆိုင်ရာ အကောင်အထည်ဖော်ခြင်း
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### စာရွက်စာတမ်း အရည်အသွေး တိုးတက်မှုများနှင့် Microsoft Foundry Models ဥပမာအသစ်
**ဤဗားရှင်းသည် repository အတွင်း စာရွက်စာတမ်းအရည်အသွေးကို တိုးမြှင့်ပေးပြီး gpt-4.1 chat အင်တာဖေ့စ်ပါရှိသည့် Microsoft Foundry Models အပြည့်အစုံ တပ်ဆင်မှု ဥပမာကို ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` တွင် လက်တွေ့အသုံးလုပ်နိုင်သော အပြည့်အစုံ gpt-4.1 တပ်ဆင်မှုနှင့် အကောင်အထည်ဖော်ထားသော အကောင်အထည်:
  - gpt-4.1 model တပ်ဆင်မှုပါသည့် Microsoft Foundry Models အပြည့်အစုံအင်ဖရာစထက်ချာ
  - စာသားမှတ်တမ်းပါရှိသည့် Python command-line chat အင်တာဖေ့စ်
  - API key များ လုံခြုံစွာ သိမ်းဆည်းရန် Key Vault ပေါင်းစည်းမှု
  - token အသုံးပြုမှု အလေးချိန်နှင့် ကုန်ကျစရိတ် ခန့်မှန်းခြေ
  - အမြန်နှုန်း အကန့်အသတ်သတ်မှတ်ခြင်းနှင့် အမှားကိုင်တွယ်ခြင်း
  - 35-45 မိနစ် အတွင်း တပ်ဆင်နိုင်ရန် အကြမ်းဖျဉ် README
  - Bicep မော်ဒယ်များ၊ Python app နှင့် ကွန်ဖစ်ဂျာရေးရှင်းများ ပါဝင်သည့် 11 ဖိုင် ထုတ်လုပ်မှု အသင့် ဖိုင်များ
- **📚 Documentation Exercises**: ကွန်ဖစ်ဂျူရေးရှင်း ညွှန်ကြားချက်တွင် လက်တွေ့ လေ့ကျင့်ခန်းများ ထည့်သွင်းထားသည်:
  - လေ့ကျင့်ခန်း 1: Multi-environment configuration (15 minutes)
  - လေ့ကျင့်ခန်း 2: Secret management practice (10 minutes)
  - အောင်မြင်မှု သတ်မှတ်ချက်များနှင့် အတည်ပြုခြင်း အဆင့်များ ရှင်းလင်းပြတ်သားစွာ ဖော်ပြထားသည်
- **✅ Deployment Verification**: တပ်ဆင်မှု ညွှန်ကြားချက်တွင် အတည်ပြုရေး ပိုင်း ထည့်သွင်းလိုက်သည်:
  - ကျန်းမာရေး စစ်ဆေးမှု လုပ်ထုံးလုပ်နည်းများ
  - အောင်မြင်မှု စစ်ဆေးစာရင်း
  - တပ်ဆင်ကာ အမိန့်များအတွက် မျှော်မှန်းနိုင်သော ထွက်ရှိမှုများ
  - ပြဿနာရှာဖွေမှု အရေးပေါ် အညွှန်းများ

#### တိုးမြှင့်ထားသည်
- **examples/README.md**: A-grade အရည်အသွေး (93%) သို့ အဆင့်မြှင့်တင်ပြီး အောက်ပါများပြုလုပ်ထားသည်:
  - azure-openai-chat ကို သက်ဆိုင်ရာ အပိုင်းအားလုံးတွင် ထည့်သွင်းခဲ့သည်
  - ဒေသခံ ဥပမာ အရေအတွက်ကို 3 မှ 4 သို့ သတ်မှတ်ပြောင်းလဲခဲ့သည်
  - AI Application Examples ဇယားသို့ ထည့်သွင်းထားသည်
  - Intermediate Users အတွက် Quick Start ထဲသို့ ပေါင်းထည့်ထားသည်
  - Microsoft Foundry Templates အပိုင်းသို့ ထည့်သွင်းထားသည်
  - တွဲအလားသဏ္ဍာန်နှင့် နည်းပညာ ရှာဖွေရေး အပိုင်းများကို အပ်ဒိတ်လုပ်ထားသည်
- **Documentation Quality**: B+ (87%) → A- (92%) အထိ ကောင်းမွန်အောင် တိုးတက်စေခဲ့သည်:
  - အရေးကြီး ကမ်းလှမ်းချက်များသို့ မျှော်မှန်း ထွက်ရန် ဖော်ပြချက်များ ထည့်သွင်းထားသည်
  - ကွန်ဖစ်ဂျူရေးရှင်း ပြောင်းလဲမှုများအတွက် အတည်ပြုခြင်း အဆင့်များ ထည့်သွင်းထားသည်
  - လက်တွေ့သင်ယူမှုကို ပိုမိုကောင်းမွန်စေရန် လေ့ကျင့်ခန်းများ တိုးမြှင့်ထားသည်

#### ပြောင်းလဲချက်များ
- **Learning Progression**: मध्यတန်း သင်ယူသူများအတွက် AI ဥပမာများ ပိုပြီးညှိနှိုင်း ထည့်သွင်းထားသည်
- **Documentation Structure**: ရလဒ်ရှင်းလင်းသော လက်တွေ့ လေ့ကျင့်ခန်းများ ပိုမိုထည့်သွင်းထားသည်
- **Verification Process**: အဓိကလုပ်ငန်းစဉ်များတွင် အောင်မြင်မှု သတ်မှတ်ချက်များ ထပ်တိုး ဖော်ပြထားသည်

#### တိုးတက်မှုများ
- **Developer Experience**: Microsoft Foundry Models တပ်ဆင်ခြင်း အချိန်ကို 35-45 မိနစ် (ရှုပ်ထွေးသော အခြားရွေးချယ်စရာများတွင် 60-90 မိနစ်နှင့် နှိုင်းယှဉ်) သို့ လျှော့ချလိုက်သည်
- **Cost Transparency**: Microsoft Foundry Models ဥပမာအတွက် ကုန်ကျစရိတ် ခန့်မှန်းချက်များ ($50-200/month) ကို ရှင်းလင်းဖော်ပြထားသည်
- **Learning Path**: AI ဖွံ့ဖြိုးရေးသူများအတွက် azure-openai-chat ဖြင့် စတင်ရန် သေချာရှင်းလင်းသော လမ်းကြောင်းစေသည်
- **Documentation Standards**: မျှော်မှန်း ထွက်ရှိမှုများနှင့် အတည်ပြုခြင်း အဆင့်များကို တစ်ရပ်တည်း ချထားသည်

#### အတည်ပြု済
- ✅ Microsoft Foundry Models ဥပမာ `azd up` ဖြင့် အပြည့်အစုံလည်းလည်တည်ဆောက်နိုင်သည်
- ✅ အကောင်အထည်ဖော် နေသော ဖိုင် 11 ခု အားလုံး syntax မှားယြင်းချက် မရှိပါ
- ✅ README အကြောင်းအရာများ သတ်မှတ်ထားသည့် တပ်ဆင်မှု အတွေ့အမြင်နှင့် ကိုက်ညီသည်
- ✅ စာရွက်စာတမ်းလင့်ခ်များကို 8+ နေရာတွင် update ပြုလုပ်ထားသည်
- ✅ Examples index သည် ဒေသခံ ဥပမာ 4 ခုကို မှန်ကန်စွာ ဖော်ပြထားသည်
- ✅ ဇယားများတွင် ထပ်တူ link မရှိပါ
- ✅ မည်သည့် navigation ကိုးကားချက်များမှားယွင်းခြင်း မရှိပါ

#### နည်းပညာဆိုင်ရာ အကောင်အထည်ဖော်ခြင်း
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps ပုံစံ
- **Security**: Managed Identity တပ်ဆင်ပြီး secrets များကို Key Vault တွင် သိမ်းဆည်းထားသည်
- **Monitoring**: Application Insights ပေါင်းစည်းထားခြင်း
- **Cost Management**: Token ချိန်ညှိမှုနှင့် အသုံးပြုမှု ထိရောက်စေရေး
- **Deployment**: တစ်ချက် `azd up` ဖြင့် အပြည့်အစုံ တပ်ဆင်နိုင်သည်

### [v3.6.0] - 2025-11-19

#### အကြီးမားဆုံး အပ်ဒိတ်: Container App တပ်ဆင်မှု ဥပမာများ
**ဤဗားရှင်းသည် Azure Developer CLI (AZD) ကို အသုံးပြုပြီး ထုတ်လုပ်မှု အသင့် Container application တပ်ဆင်မှု ဥပမာများအား အပြည့်အစုံ ထည့်သွင်းထားပြီး သေချာ documentationနှင့် သင်ကြားရေးလမ်းကြောင်းများထံဆက်သွယ်ထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🚀 Container App Examples**: `examples/container-app/` တွင် ဒေသခံ ဥပမာအသစ်များ:
  - [Master Guide](examples/container-app/README.md): ကုန်ကျစရိတ်၊ quick start၊ ထုတ်လုပ်မှုနှင့် အဆင့်မြင့် ပုံစံများ အခြေခံ အကျဉ်းချုပ်
  - [Simple Flask API](../../examples/container-app/simple-flask-api): စတင်သူများအတွက် REST API — scale-to-zero, health probes, monitoring နှင့် troubleshooting ပါဝင်သည်
  - [Microservices Architecture](../../examples/container-app/microservices): ထုတ်လုပ်မှု အသင့် multi-service တပ်ဆင်မှု (API Gateway, Product, Order, User, Notification), အဆင့်လိုက် မက်ဆေ့ဂျင်း၊ Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: လုံခြုံရေး၊ မော်နီတာရေး၊ ကုန်ကျစရိတ် လျှော့ချခြင်းနှင့် CI/CD လမ်းညွှန်ချက်များ
- **Code Samples**: အပြည့်အစုံ `azure.yaml`, Bicep မော်ဒယ်များနှင့် ဘာသာစကား အမျိုးမျိုးဖြင့် service အကောင်အဖြစ် 구현 (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: အဆုံးသတ် စစ်ဆေးမှု ကြောင်း၊ မော်နီတာ အမိန့်များ၊ ပြဿနာရှာဖွေရေး လမ်းညွှန်ချက်များ

#### ပြောင်းလဲချက်များ
- **README.md**: Local Examples - Container Applications အတွဲတွင် အသစ်ထည့်သွင်းထားသော container app ဥပမာများကို ကိုးကားရန် ပြင်ဆင်ထားသည်
- **examples/README.md**: container app ဥပမာများကို ထင်ဟပ်စေပြီး နှိုင်းယှဉ်ဇယား၊ နည်းပညာ/ဆောက်လုပ်ပုံ ကိုးကားချက်များကို အပ်ဒိတ်လုပ်ထားသည်
- **Course Outline & Study Guide**: သင်ခန်းစာအကြောင်းအရာများတွင် container app ဥပမာများနှင့် တပ်ဆင်မှု ပုံစံများကို ကိုးကားရန် ပြင်ဆင်ထားသည်

#### အတည်ပြု済
- ✅ ဥပမာအသစ်များအားလုံး `azd up` ဖြင့် တပ်ဆင်နိုင်ပြီး အကောင်းဆုံး ပုံစံများကိုလိုက်နာထားသည်
- ✅ စာရွက်စာတမ်း cross-links နှင့် navigation များကို အပ်ဒိတ်လုပ်ပြီး တိကျစွာ ပြင်ဆင်ထားသည်
- ✅ ဥပမာများသည် စတင်သူမှ အဆင့်မြင့်အထိ အခြေအနေများကို ဖုံးလွှမ်းထားသည်

#### မှတ်ချက်များ
- **Scope**: အင်္ဂလိပ် စာရွက်စာတမ်းနှင့် ဥပမာများသာလျှင်
- **Next Steps**: အဆင့်မြင့် container ပုံစံများနှင့် CI/CD automation များကို နောက်ထပ်မျိုးစုံထည့်သွင်းရန်

### [v3.5.0] - 2025-11-19

#### ထုတ်ကုန်အမည် ပြောင်းလဲခြင်း: Microsoft Foundry
**ဤဗားရှင်းတွင် "Microsoft Foundry" အမည်ကို အင်္ဂလိပ် စာရွက်စာတမ်းအားလုံးတွင် ထည့်သွင်းပြုပြင်ထားသည်။**

#### ပြောင်းလဲချက်များ
- **🔄 ထုတ်ကုန်အမည် အပ်ဒိတ်**: "Microsoft Foundry" သို့ အပြောင်းအလဲ ပြုလုပ်ခြင်း
  - `docs/` ဖိုင်များအတွင်းရှိ ကိုးကားချက်များအားလုံး အသစ်အတိုင်း ပြင်ဆင်ထားသည်
  - ဖိုလ်ဒါအမည် ပြောင်းလဲမှု: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ဖိုင်အမည် ပြောင်းလဲမှု: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - စုစုပေါင်း: အကြောင်းအရာ 23 ခုကို 7 ဖိုင်တွင် ပြောင်းလဲပြီး ဖြစ်သည်

- **📁 ဖိုလ်ဒါ ဖွဲ့စည်းပုံ ပြောင်းလဲချက်များ**:
  - `docs/ai-foundry/` ကို `docs/microsoft-foundry/` သို့ အမည်ပြောင်းထားသည်
  - အတွင်းပိုင်း ကိုးကားချက်များအားလုံး ကို အမည်အသစ်နှင့် ကိုက်ညီအောင် အပ်ဒိတ်လုပ်ထားသည်
  - navigation လင့်ခ်များကို အတည်ပြုပြီး ဖြစ်သည်

- **📄 ဖိုင်အမည် ပြောင်းလဲချက်များ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - အတွင်းပိုင်း လင့်ခ်များအားလုံးကို အသစ်အမည်ဖြင့် update ပြုလုပ်ထားသည်

#### အပ်ဒိတ်ခဲ့သော ဖိုင်များ
- **Chapter Documentation** (7 ဖိုင်):
  - `docs/microsoft-foundry/ai-model-deployment.md` - navigation link 3 ခု update ပြုလုပ်ထားသည်
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ထုတ်ကုန်အမည် ကိုးကားချက် 4 ခုပြောင်းထားသည်
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ယခုထိ Microsoft Foundry အမည်ကို အသုံးပြုထားသည် (ယခင် update များကြောင့်)
  - `docs/microsoft-foundry/production-ai-practices.md` - အကြောင်းအရာ 3 ခု အပ်ဒိတ်ပြုလုပ်ထားသည် (အကျဉ်းချုံး၊ community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - cross-reference link 4 ခု update ပြုလုပ်ထားသည်
  - `docs/getting-started/first-project.md` - chapter navigation link 2 ခု update ပြုလုပ်ထားသည်
  - `docs/getting-started/installation.md` - next chapter link 2 ခု update ပြုလုပ်ထားသည်
  - `docs/troubleshooting/ai-troubleshooting.md` - ကိုးကားချက် 3 ခု update ပြုလုပ်ထားသည် (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - navigation link 1 ခု update ပြုလုပ်ထားသည်
  - `docs/troubleshooting/debugging.md` - navigation link 1 ခု update ပြုလုပ်ထားသည်

- **Course Structure Files** (2 ဖိုင်):
  - `README.md` - 17 ကိုးကားချက် update ပြုလုပ်ထားသည် (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 ကိုးကားချက် update ပြုလုပ်ထားသည် (overview, learning objectives, chapter resources)

#### အတည်ပြု済
- ✅ English docs များတွင် "ai-foundry" ဖိုလ်ဒါ path ကို အရှုံးမရှိစေရန် စစ်ဆေးပြီး ဖြစ်သည်
- ✅ "Microsoft Foundry" ထုတ်ကုန်အမည် ကို English docs အားလုံးတွင် အပြည့်အဝ အသုံးပြုထားသည်
- ✅ နောက်ခံ navigation လင့်ခ်များ အလုပ်လုပ်နိုင်မှုကို အတည်ပြုထားသည်
- ✅ ဖိုင်နှင့် ဖိုလ်ဒါ အမည် ပြောင်းလဲခြင်းများ အောင်မြင်စွာ ပြီးစီးထားသည်
- ✅ အခင်းအနောက်အတွင်း တွဲဆက်ရာ ကိုးကားချက်များ စစ်ဆေးပြီး ဖြစ်သည်

#### မှတ်ချက်များ
- **Scope**: ပြောင်းလဲချက်များကို `docs/` ဖိုလ်ဒါအတွင်း အင်္ဂလိပ် စာရွက်စာတမ်းများသာ သက်ဆိုင်သည်
- **Translations**: ပြောင်းလဲချက်များတွင် ဘာသာပြန် ဖိုင်များ (`translations/`) များကို update မလုပ်ထားသေးပါ
- **Workshop**: `workshop/` အထောက်အပံ့စာသားများကို update မလုပ်ထားသေးပါ
- **Examples**: ဥပမာ ဖိုင်များတွင် legacy naming ကို တွေ့နိုင်သည် (နောက်ထပ် update တွင် ဖြေရှင်းမည်)
- **External Links**: အပြင်ဘက် URLs နှင့် GitHub ကိုးကားချက်များကို မပြောင်းလဲထားပါ

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**ဤဗားရှင်းသည် Azure Developer CLI preview ထူးခြားချက်အသစ်အတွက် အပြည့်အဝ ထောက်ပံ့မှုနှင့် workshop အသုံးပြုသူ အတွေ့အကြုံကို တိုးမြှင့်ပေးထားသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🧪 azd provision --preview Feature Documentation**: အင်ဖရာစထက် preview စွမ်းဆောင်ရည် အသစ်အတွက် အသေးစိတ် ဖော်ပြချက်
  - cheat sheet တွင် command ကိုးကားချက်များနှင့် အသုံးပြုနည်း နမႈ
  - provisioning guide အတွင်း အသုံးပြုမှုနည်းလမ်းများနှင့် အကျိုးကျေးဇူးများ နှင့် အသေးစိတ် ပေါင်းထည့်ထားသည်
  - pre-flight check integration — တပ်ဆင်မှု မတိုင်မီ စစ်ဆေးရေး အပိုင်းများ
  - Getting started guide ကို safety-first deployment လုပ်ထုံးလုပ်နည်းများနှင့် အပ်ဒိတ်လုပ်ထားသည်
- **🚧 Workshop Status Banner**: workshop အလုပ်တိုးတတ်နေသည့် အခြေအနေကို ပြသသည့် professional HTML banner
  - gradient ဒီဇိုင်းနှင့် တည်ဆောက်ရေး စနစ်ကို ဖော်ပြရန် အချက်ပြများ
  - နောက်ဆုံး 업데이트ချိန်ကို ဖော်ပြထား၍ ပူးပေါင်းသူများ အတွက် ဖော်ပြချက် ရှင်းလင်းစေသည်
  - မိုဘိုင်း အျမင့်အမြင်တွင်လည်း မြင်သာစေရန် ပြင်ဆင်ထားသည်

#### တိုးမြှင့်ထားသည်
- **Infrastructure Safety**: preview လုပ်ဆောင်ချက်ကို deployment documentation အစုံတွင် ပေါင်းထည့်ထားသည်
- **Pre-deployment Validation**: automated script များတွင် infrastructure preview စစ်တမ်းများ ပါဝင်လာသည်
- **Developer Workflow**: command စဉ်များကို preview ကို အကောင်းဆုံးလက်တွေ့အဆင့်အဖြစ် ထည့်သွင်းထားသည်
- **Workshop Experience**: အကြောင်းအရာ ဖွံ့ဖြိုးတိုးတက်ရေး အခြေအနေကို အသုံးပြုသူများအား ရှင်းလင်းစွာ အသိပေးထားသည်

#### ပြောင်းလဲချက်များ
- **Deployment Best Practices**: preview-first workflow ကို အကြံပြု အကောင်းဆုံး လမ်းစဉ်အဖြစ် အကြံပြုထားသည်
- **Documentation Flow**: infrastructure validation ကို သင်ကြားမှု လမ်းကြောင်းတွင် မျက်နှာဖုံး အစောပိုင်းသို့ ရွှေ့ထားသည်
- **Workshop Presentation**: professional status ဖြင့် ဖော်ပြမှုများ ထပ်မံ ပိုမို ထင်ရှားစေထားသည်

#### တိုးတက်မှုများ
- **Safety-First Approach**: infrastructure ပြောင်းလဲမှုများကို တပ်ဆင်မပြုမီ စစ်ဆေးနိုင်ရန် preview တွင် ရနိုင်ပါပြီ
- **Team Collaboration**: preview နောက်ဆုံး ရလဒ်များကို သုံးသပ်၍ အတည်ပြုရန် မျှဝေ နိုင်သည်
- **Cost Awareness**: provisioning မပြုမီ resource ကုန်ကျစရိတ်ကိုပိုမိုသိရှိနိုင်သည်
- **Risk Mitigation**: ကြိုတင် စမ်းသပ်ခြင်းဖြင့် တပ်ဆင်မှု မအောင်မြင်မှုများ လျော့ချနိုင်သည်

#### နည်းပညာဆိုင်ရာ အကောင်အထည်ဖော်ခြင်း
- **Multi-document Integration**: preview အင်္ဂါရပ်ကို ဖော်ပြထားသော အဓိက 4 ဖိုင်များတွင် နှစ်ဆမှု ရှိသည်
- **Command Patterns**: documentation အထဲတွင် စနစ်တကျ syntax နှင့် နမူနာ များ ထည့်သွင်းထားသည်
- **Best Practice Integration**: preview ကို validation workflows နှင့် scripts များတွင် တပ်ဆင်ထားသည်
- **Visual Indicators**: အသစ်ဖြစ်သော feature များကို အတွင်းတွင် အသေးစိတ် အမှတ်အသားထား၍ ရှာတွေ့ရလွယ်စေသည်

#### Workshop Infrastructure
- **Status Communication**: gradient styling နှင့် professional HTML banner တစ်ခုဖြင့် အခြေအနေကို ဖော်ပြထားသည်
- **User Experience**: ဖွံ့ဖြိုးရေးအခြေအနေကို ရှင်းလင်းစွာ ပေးထား၍ အသုံးပြုသူ ပျက်စီးမဖြစ်စေ
- **Professional Presentation**: repository ၏ မှတ်တမ်းထိထိန်းသိမ်းမှုနှင့် ယုံကြည်စိတ်ချမှု ကိုထိန်းသိမ်းထားသည်
- **Timeline Transparency**: October 2025 နောက်ဆုံး update ချိန်ကို ဖော်ပြထားပြီး အကွင့်တင်အားရှိသည်

### [v3.3.0] - 2025-09-24

#### Workshop ပစ္စည်းများ ဖွံ့ဖြိုးတိုးတက်မှုနှင့် အပြန်အလှန် သင်ယူသင်ကြားမှု အတွေ့အကြုံ တိုးမြှင့်ခြင်း
**ဤဗားရှင်းတွင် browser-အခြေပြု အင်တာแက်တက်တစ် ညွှန်ပြမှုများနှင့် ဖွဲ့စည်းထားသော သင်ယူမှု လမ်းကြောင်းများ ပါဝင်လာပါသည်။**

#### ထည့်သွင်းခဲ့သည်
- **🎥 Interactive Workshop Guide**: MkDocs ကြိုကြည့်မှု စွမ်းရည်ပါရှိသော ဘရောက်ဇာအခြေပြု လက်တွေ့အလုပ်ရုံ အတွေ့အကြုံ
- **📝 Structured Workshop Instructions**: ရှာဖွေမှုမှ စိတ်ကြိုက်ပြုပြင်ခြင်း အထိ ၇-ဆင့် လမ်းညွှန်သင်ယူမှု
  - 0-Introduction: အလုပ်ရုံအကျဉ်းချုပ်နှင့် စတင်တပ်ဆင်ခြင်း
  - 1-Select-AI-Template: ပုံစံ ရှာဖွေရေးနှင့် ရွေးချယ်ချိန်ဆောင်ရွက်ချက်
  - 2-Validate-AI-Template: တပ်ဆင်ခြင်းနှင့် အတည်ပြုလုပ်ထုံးလုပ်နည်းများ
  - 3-Deconstruct-AI-Template: ပုံစံ معمိဏ်သဘောထားကို နားလည်ခြင်း
  - 4-Configure-AI-Template: ဖော်ပြချက်နှင့် စိတ်ကြိုက်ပြင်ဆင်ခြင်း
  - 5-Customize-AI-Template: အဆင့်မြင့် ပြင်ဆင်မှုများနှင့် အကြိမ်ကြိမ် ပြင်ဆင်ခြင်း
  - 6-Teardown-Infrastructure: သုံးစွဲသော အရင်းအမြစ်များကို သန့်ရှင်းရေးနှင့် စီမံခန့်ခွဲခြင်း
  - 7-Wrap-up: အကျဉ်းချုပ်နှင့် နောက်ဆက်တွဲခြေလှမ်းများ
- **🛠️ Workshop Tooling**: မြှင့်တင်ထားသည့် သင်ယူမှု အတွေ့အကြုံအတွက် Material theme ပါသည့် MkDocs ဖော်ပြချက်
- **🎯 Hands-On Learning Path**: ၃-ဆင့် နည်းဗျူဟာ (ရှာဖွေခြင်း → တပ်ဆင်ခြင်း → စိတ်ကြိုက်ပြုပြင်ခြင်း)
- **📱 GitHub Codespaces Integration**: ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်ကို အဆင်ပြေစွာ တပ်ဆင်ရန် ပေါင်းစည်းမှု

#### Enhanced
- **AI Workshop Lab**: ၄င်းကို တိုးချဲ့ထားပြီး အပြည့်အစုံ ၂-၃ နာရီ အစီအစဉ် သင်ယူမှု အတွေ့အကြုံ
- **Workshop Documentation**: လမ်းကြောင်းနှင့် ဗျူအာ ရုပ်ပိုင်းဆိုင်ရာ အကူအညီများပါသည့် ပရော်ဖက်ရှင်နယ် တင်ဆက်မှု
- **Learning Progression**: ပုံစံရွေးချယ်မှုမှ ထုတ်လုပ်မှု တင်သွင်းရေးအထိ ပြင်းပြသော အဆင့်ဆင့် လမ်းညွှန်ချက်များ
- **Developer Experience**: ဖွံ့ဖြိုးရေးလုပ်ငန်းစဉ်များကို ပေါင်းစည်းသုံးစွဲနိုင်စေရန် ပေါင်းစည်းထားသော ကိရိယာများ

#### Improved
- **Accessibility**: ရှာဖွေရန်၊ မိတ္တူကူးရန် လုပ်ဆောင်ချက်နှင့် အမှောင်/အလင်းစနစ် ပြောင်းနိုင်မှုပါရှိသော ဘရောက်ဇာအခြေပြု အင်တာဖေ့စ်
- **Self-Paced Learning**: သင်ယူနှုန်းကွဲများနှင့် ကိုက်ညီနိုင်သည့် လိုက်လျောညီထွေနိုင်သော အလုပ်ရုံ ဖွဲ့စည်းမှု
- **Practical Application**: အမှန်တကယ် အသုံးချနိုင်သည့် AI ပုံစံ တပ်ဆင်ရေး ဇာတ်လမ်းများ
- **Community Integration**: အလုပ်ရုံအတွက် အထောက်အပံ့နှင့် ပူးပေါင်းဆောင်ရွက်ရန် Discord ပေါင်းစည်းမှု

#### Workshop Features
- **Built-in Search**: စကားလုံးနှင့် သင်ခန်းစာများကို အမြန်ရှာဖွေရန်
- **Copy Code Blocks**: ကုဒ်ဥပမာအားလုံးအတွက် မောက်ဆာထားကူးယူနိုင်မှု
- **Theme Toggle**: ရွေးချယ်မှုမျိုးစုံအတွက် အမှောင်/အလင်း မုဒ် ပံ့ပိုးမှု
- **Visual Assets**: နားလည်မှုကောင်းစေရန် စကရင်ရှော့များနှင့် ဇယားများ
- **Help Integration**: အသိုင်းအဝိုင်း အထောက်အပံ့အတွက် တိုက်ရိုက် Discord ဝင်ရောက်မှု

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**ဤဗားရှင်းတွင် ပြည့်စုံသော အခန်းအလိုက် သင်ယူမှု ဖွဲ့စည်းပုံနှင့် သိုက်လှုပ်ရှားမှုကောင်းမွန်သည့် နာဗီဂေးရှင်းများကို မူလ စုစည်းမှုတစ်လျှောက် ထည့်သွင်းထားပါသည်။**

#### Added
- **📚 Chapter-Based Learning System**: သင်တန်းတစ်ခုလုံးကို တိုးတက်မှုအဆင့် ၈ ချက်အဖြစ် ပြန်လည်ဖွဲ့စည်းထားသည်
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: စာတမ်းများအတွင်း အမြဲတမ်းတည်ရှိသည့် နာဗီဂေးရှင်း ခေါင်းစီးနှင့် အောက်ခြေ စနစ်များ
- **🎯 Progress Tracking**: သင်တန်းပြီးစီးမှု စစ်တမ်းစာရင်းနှင့် သင်ယူမှု အတည်ပြုစနစ်
- **🗺️ Learning Path Guidance**: အတွေ့အကြုံနှင့် ရည်မှန်းချက် အမျိုးအစားအလိုက် ရှင်းလင်းသော ဝင်ရောက်ရန် လမ်းကြောင်းများ
- **🔗 Cross-Reference Navigation**: ဆက်စပ် အခန်းများနှင့် ကြိုတင်တတ်ရှိရန် တိုက်ရိုက် ဆက်သွယ်ချက်များ

#### Enhanced
- **README Structure**: README ဖိုင်ကို အခန်းအလိုက် အစီအစဉ်ထားသည့် သင်ယူရေး ပလက်ဖောင်းအဖြစ် ပြောင်းလဲထားသည်
- **Documentation Navigation**: စာမျက်နှာတိုင်းတွင် အခန်းဆိုင်ရာ အကြောင်းအရာနှင့် တိုးတက်မှု လမ်းညွှန်ချက်များပါဝင်သည်
- **Template Organization**: ဥပမာများနှင့် ပုံစံများကို သင်ယူမှုအခန်းများနှင့် ကိုက်ညီအောင် တိတိကျကျ ပေါင်းစည်းထားသည်
- **Resource Integration**: cheat sheets, FAQs နှင့် သုတေသနလမ်းညွှန်များကို သက်ဆိုင်ရာ အခန်းများနှင့် ချိတ်ဆက်ထားသည်
- **Workshop Integration**: လက်တွေ့ လက်ငယ်လက်ချာ အလုပ်ရုံများကို หลายခန်းသင်ယူမှု ရည်မှန်းချက်များနှင့် ချိတ်ဆက်ထားသည်

#### Changed
- **Learning Progression**: တန်းတန်းတိုက်ရိုက် စာတမ်းများမှ အခန်းအလိုက် မျိုးဆက်ပြောင်းလဲနိုင်သည့် သင်ယူမှုသို့ ပြောင်းလဲသည်
- **Configuration Placement**: သင်ယူမှု လိုက်လျောမှုကောင်းစေရန် ဖော်ပြချက်လမ်းညွှန်ကို အခန်း ၃ အဖြစ် ပြန်တည်ရာချထားသည်
- **AI Content Integration**: သင်ယူမှု လမ်းကြောင်းတလျှောက် AI-အထူး အကြောင်းအရာများကို ပိုမိုကောင်းမွန်စွာ ပေါင်းစည်းထားသည်
- **Production Content**: စီးပွားရေး သင်ယူသူများအတွက် အဆင့်မြင့် ပုံစံများကို အခန်း ၈ တွင် စုစည်းထားသည်

#### Improved
- **User Experience**: လမ်းကြောင်း breadcrumb နှင့် အခန်း တိုးတက်မှု ညွှန်ပြချက်များ ပိုမိုရှင်းလင်းစေသည်
- **Accessibility**: သင်တန်းလမ်းကြောင်းလျှောက်ရှိရာတွင် သာမာန် နာဗီဂေးရှင်း ပုံစံများ တစ်နေရာတည်းရှိစေရန်
- **Professional Presentation**: တက္ကသိုလ်ပုံစံ သင်တန်းပုံစံနှင့် ကိုက်ညီသော ပရော်ဖက်ရှင်နယ် တင်ဆက်မှု
- **Learning Efficiency**: ကောင်းမွန်သည့် အဖွဲ့အစည်းမှုဖြင့် သက်ဆိုင်ရာ အကြောင်းအရာ ရှာဖွေရှာရသည့် အချိန်လျော့ပါးစေသည်

#### Technical Implementation
- **Navigation Headers**: 40+ စာတမ်းဖိုင်များအားလုံးတွင် အခန်းနာဗီဂေးရှင်း များကို စံတင့်တူ သတ်မှတ်ထားသည်
- **Footer Navigation**: တိုးတက်မှု လမ်းညွှန်ချက်များနှင့် အခန်းပြီးစီးမှု ပြသချက်များကို တစ်ပြိုင်နက် အတိုက်အခံ ပြသပေးမှု
- **Cross-Linking**: ဆက်စပ် အယူအဆများကို ချိတ်ဆက်ပေးသည့် အတွင်းပိုင်း ချိတ်ဆက်မှု စနစ်
- **Chapter Mapping**: ပုံစံများနှင့် ဥပမာများကို သင်ယူမှု ရည်မှန်းချက်များနှင့် ထင်ရှားစွာ ဆက်သွယ်ထားခြင်း

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: အခန်း ၈ ချက် စနစ်နှင့် ကိုက်ညီစေရန် သုတေသနလမ်းညွှန်ကို ပြန်လည်ဖွဲ့စည်းထားသည်
- **🎯 Chapter-Based Assessment**: အခန်းတိုင်းတွင် သီးသန့် သင်ယူရန် ရည်မှန်းချက်များနှင့် လက်တွေ့ လေ့ကျင့်ခန်းများ ပါဝင်သည်
- **📋 Progress Tracking**: အပတ်စဉ် သင်ယူချိန်ဇယားနှင့် တိုင်းတာနိုင်သည့် ရလဒ်များ၊ ပြီးစီးမှု စစ်တမ်းစာရင်းများ
- **❓ Assessment Questions**: အခန်းတိုင်းအတွက် အသိပညာ အတည်ပြုမေးခွန်းများနှင့် ပရော်ဖက်ရှင်နယ် ရလဒ်များ
- **🛠️ Practical Exercises**: တကယ့်တကယ် တပ်ဆင်ရေး အခြေအနေများနှင့် ပြဿနာဖြေရှင်းမှု ပါဝင်သည့် လက်တွေ့ လှုပ်ရှားမှုများ
- **📊 Skill Progression**: အခြေခံ အယူအဆမှ စီးပွားရေး ပုံစံများသို့ ရှင်းလင်းစွာ တိုးတက်ကာ အလုပ်အကိုင် ဖွံ့ဖြိုးရာကို အာရုံစိုက်မှု
- **🎓 Certification Framework**: ပရော်ဖက်ရှင်နယ် တိုးတက်ရေး ရလဒ်များနှင့် အသိုင်းအဝိုင်း မှတ်သားကြောင်း စနစ်
- **⏱️ Timeline Management**: အဆင့်သတ်မှတ်ချက်များကို အတည်ပြုနိုင်သည့် ၁၀-အပတ် သင်ယူမှု အစီအစဉ်

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**ဤဗားရှင်းသည် စက်ရုံစတင် ဆိုင်ရာ multi-agent retail solution ကို အေးဂျင့်အမည်ပေးမှုကို ပိုမိုရှင်းလင်းစေရန် နှင့် စာတမ်းများကို တိုးတက်အောင် တင်ပြထားသည်။**

#### Changed
- **Multi-Agent Terminology**: ရောင်းအား ပိုင်းဆိုင်ရာ multi-agent ဖြေရှင်းချက်တစ်ခုလုံးတွင် နားလည်ရလွယ်အောင် "Cora agent" ကို "Customer agent" ဖြင့် အစားထိုးထားသည်
- **Agent Architecture**: စာတမ်းများအားလုံး၊ ARM templates နှင့် ကုဒ်ဥပမာများကို ညီညာအောင် "Customer agent" အမည်ကို အသုံးပြုသွားသည်
- **Configuration Examples**: အမည်ပေးမှု ရိုးရာများကို အပ်ဒိတ်လုပ်၍ တွဲဖက် agent ဖော်ပြချက် ပုံစံများကို မော်ဒန်ပြုလုပ်ထားသည်
- **Documentation Consistency**: အရာအားလုံးကို ပရော်ဖက်ရှင်နယ်၊ ဖေါ်ပြချက်ပြည့်ဝသော agent အမည်များနှင့် ကိုက်ညီစေရန် သေချာစေထားသည်

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template ကို Customer agent ကိုးကားချက်များဖြင့် အပ်ဒိတ်လုပ်ထားသည်
- **Architecture Diagrams**: Mermaid ဇယားများကို အမည်အပ်ဒိတ်ဖြင့် ပြန်လည်မွမ်းမံထားသည်
- **Code Examples**: Python class များနှင့် အကောင်အထည်ဖော်အတွက် ဥပမာများတွင် ယခု CustomerAgent အမည်ကို အသုံးပြုထားသည်
- **Environment Variables**: တပ်ဆင်ရေး စက်ရုံ script များအားလုံးကို CUSTOMER_AGENT_NAME ကွန်ဗင်ရှင်းများကို အသုံးပြုအောင် အပ်ဒိတ်လုပ်ထားသည်

#### Improved
- **Developer Experience**: စာတမ်းများတွင် agent အခန်းကဏ္ဍများနှင့် တာဝန်များ ပိုမိုရှင်းလင်းစေရန်
- **Production Readiness**: စီးပွားရေးအဆင့်အတန်းနှင့် ကိုက်ညီသော အမည်ပေးမှုများဖြင့် ပိုမိုသင့်လျော်စေခြင်း
- **Learning Materials**: ပညာသင်ကြားရေးအတွက် agent အမည်ကို ပိုမိုနားလည်ရလွယ်အောင် ပြုလုပ်ထားသည်
- **Template Usability**: agent တာဝန်များနှင့် တပ်ဆင်ရေး လမ်းစဉ်များကို ရိုးရှင်းစေသည်

#### Technical Details
- Mermaid architecture diagrams များကို CustomerAgent ကိုးကားချက်များဖြင့် အပ်ဒိတ်လုပ်ထားသည်
- CoraAgent class အမည်များကို Python ဥပမာများတွင် CustomerAgent အဖြစ် အစားထိုးထားသည်
- ARM template JSON ဖိုင်များကို "customer" agent အမျိုးအစား အသုံးပြုရန် ပြင်ဆင်ထားသည်
- ဆက်တင် အပတ်အပြင်များကို CORA_AGENT_* မှ CUSTOMER_AGENT_* ပုံစံသို့ ပြောင်းလဲထားသည်
- တပ်ဆင်ရေး command များနှင့် ကွန်တိန်နာ cấu ပုံစံများကို ပြန်လည်အသစ်ပြင်ဆင်ထားသည်

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**ဤဗားရှင်းသည် မော်ကွန်းတင် AI အထူးပြု သင်ကြားရေး အရင်းအမြစ်တစ်ခုအဖြစ် repository ကို ပြောင်းလဲပေးပြီး Microsoft Foundry ပေါင်းစည်းမှုကို ထည့်သွင်းထားသည်။**

#### Added
- **🤖 AI-First Learning Path**: AI ဖွံ့ဖြိုးရေးသူများနှင့် အင်ဂျင်နီယာများအား ဦးစားပေး၍ ပြန်လည်စဉ်းစားထားသည့် ပြုပြင်အသစ်
- **Microsoft Foundry Integration Guide**: AZD ကို Microsoft Foundry ဝန်ဆောင်မှုများနှင့် ချိတ်ဆက်ရန် တိကျသော လမ်းညွှန်စာတမ်း
- **AI Model Deployment Patterns**: မော်ဒယ်ရွေးချယ်မှု၊ ဖော်ပြချက်နှင့် ထုတ်လုပ်မှုတင်သွင်းရေးနည်းဗျူဟာများအား ဖော်ပြထားသည့် လမ်းညွှန်
- **AI Workshop Lab**: AI အပလီကေးရှင်းများကို AZD ဖြင့် တပ်ဆင်နိုင်အောင် ပြောင်းလဲပေးသည့် ၂-၃ နာရီ လက်တွေ့ အလုပ်ရုံ
- **Production AI Best Practices**: AI အလုပ်အကိုင်များကို အတိုင်းအတာတင်မယ်၊ စောင့်ကြည့်မယ်၊ လုံခြုံရေးဆိုင်ရာ pattern များ
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services နှင့် AI တပ်ဆင်မှု ပြဿနာများအတွက် အပြည့်အစုံ ပြဿနာဖြေရှင်းလမ်းညွှန်
- **AI Template Gallery**: Microsoft Foundry ပုံစံများ ပါဝင်သည့် ဖော်ပြချက် စုစည်းမှုနှင့် အခက်အခဲ အဆင့်ထားရာ
- **Workshop Materials**: လက်တွေ့ လက်ဖြတ် Lab များနှင့် ကိုးကားစာရွက်စာတမ်းများ

#### Enhanced
- **README Structure**: AI-ဖွံ့ဖြိုးရေးသူများကို ဦးစားပေးသည့် ဖွဲ့စည်းပုံနှင့် Microsoft Foundry Discord မှ ကောင်းမွန်သော အသိုင်းအဝိုင်း စိတ်ဝင်စားမှု ဒေတာ ၄၅% ဖြင့်
- **Learning Paths**: ကျောင်းသားများနှင့် DevOps အင်ဂျင်နီယာများအတွက် ရိုးရာလမ်းကြောင်းများနှင့် အတူ AI ဖွံ့ဖြိုးရေးသူများအတွက် သီးသန့် လမ်းကြောင်းများ
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, နှင့် openai-chat-app-quickstart စသည့် အကြံပြုထားသော AI ပုံစံများ
- **Community Integration**: AI-အထူး ချန်နယ်များနှင့် ဆွေးနွေးမှုများပါရှိသော Discord အသိုင်းအဝိုင်း ပံ့ပိုးမှု တိုးတက်မှု

#### Security & Production Focus
- **Managed Identity Patterns**: AI-အထူး အတည်ပြုမှုနှင့် လုံခြုံရေး ဖော်ပြချက်များ
- **Cost Optimization**: Token အသုံးပြုမှုကို စောင့်ကြည့်ခြင်းနှင့် ဘတ်ဂျက် ထိန်းချုပ်မှုများ
- **Multi-Region Deployment**: ကမ္ဘာလုံးဆိုင်ရာ AI အပလီကေးရှင်း တပ်ဆင်ခြင်း ကြံဆ
- **Performance Monitoring**: AI-အထူး မီထရစ်များနှင့် Application Insights ပေါင်းစည်းမှု

#### Documentation Quality
- **Linear Course Structure**: အခြေခံမှ အဆင့်မြင့် AI တင်သွင်းမှုနည်းပညာများသို့ အ منطقي အဆင့်ဆင့် လမ်းကြောင်း
- **Validated URLs**: အပြင်ဘက် repository လင့်များအားလုံး စစ်ဆေးပြီး အသုံးပြုနိုင်သည်
- **Complete Reference**: အတွင်းစာရွက်လင့်များအားလုံး စစ်ဆေးပြီး လုပ်ဆောင်နိုင်ခ
- **Production Ready**: အမှန်တကယ် အသုံးပြုနိုင်သည့် စီးပွားရေး တင်သွင်းနည်းပညာများနှင့် ဥပမာများ

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**ဤဗားရှင်းသည် repository ဖွဲ့စည်းမှုနှင့် အကြောင်းအရာ တင်ဆက်မှုကို အပြင်းအထန် ပြင်ဆင်ထားသည့် အဓိက ပြောင်းလဲမှုကို ကိုယ်စားပြုသည်။**

#### Added
- **Structured Learning Framework**: အစာတမ်းစာမျက်နှာများအားလုံးတွင် ဦးတည်ချက်၊ သင်ယူရည်မှန်းချက်များနှင့် သင်ယူမှုပေါင်းသင့်ရလဒ် များပါဝင်သည်
- **Navigation System**: လမ်းညွှန်သင်ခန်းစာများအားလုံးတွင် Previous/Next ပေါ်လာသော လင့်ခ်များ ထည့်သွင်းထားသည်
- **Study Guide**: သင်ယူရည်မှန်းချက်များ၊ လေ့ကျင့်ခန်းများနှင့် သုံးသပ်မေးခွန်းများ ပါဝင်သည့် study-guide.md
- **Professional Presentation**: လက်တွေ့ ဖတ်ရှုမှုနှင့် ပရော်ဖက်ရှင်နယ် ပုံစံအတွက် emoji အများစုကို ဖယ်ရှားထားသည်
- **Enhanced Content Structure**: သင်ယူမှု ဖြန့်ချိမှုနှင့် အကြောင်းအရာ ကောင်းမွန်စေရန် အဖွဲ့စည်းမှု တိုးတက်

#### Changed
- **Documentation Format**: စာတမ်းများအားလုံးကို သင်ယူမှုအာရုံစိုက်သော တူညီသည့် ဖွဲ့စည်းပုံဖြင့် စံမကျသတ်မှတ်ထားသည်
- **Navigation Flow**: သင်ယူမှု အစဥ်အလာကို အကျိုးရှိအောင် ဖွဲ့စည်းထားသည်
- **Content Presentation**: အလှဆင်သော အရာများကို ဖယ်ရှားပြီး ရှင်းလင်းသည့် ပေးပို့ပုံကို အသုံးပြုထားသည်
- **Link Structure**: နာဗီဂေးရှင်း အသစ်ကို ပံ့ပိုးရန် အတွင်းလင့်များကို ပြင်ဆင်ထားသည်

#### Improved
- **Accessibility**: Screen reader များအတွက်ပိုမိုသင့်လျော်စေရန် emoji များကို ဖယ်ရှားထားသည်
- **Professional Appearance**: စီးပွားရေးနှင့် ပညာရေးသင်တန်းများအတွက် သင့်လျော်သည့် ပရော်ဖက်ရှင်နယ် ပုံစံ
- **Learning Experience**: သင်ခန်းစာတိုင်းအတွက် ရည်မှန်းချက်နှင့် ရလဒ်တို့ပါသည့် ဖွဲ့စည်းပုံ
- **Content Organization**: ဆက်စပ်ခန့်မှန်းချက်များနှင့် အကြောင်းအရာ အချိတ်အဆက် ကောင်းမွန်စေခြင်း

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - အစပြု မိတ်ဆက် လမ်းညွှန် စီးရီး အပြည့်အစုံ
  - တပ်ဆင်ခြင်းနှင့် ပံ့ပိုးမှု စာတမ်းများ အပြည့်အစုံ
  - ပြဿနာဖြေရှင်းမှုနှင့် ဒက်ဘတ်ဂျင်း လမ်းညွှန်များ အသေးစိတ်
  - တပ်ဆင်မှုမပြုမီ စစ်ဆေးရေး ကိရိယာများနှင့် လုပ်ထုံးလုပ်နည်းများ

- **Getting Started Module**
  - AZD အခြေခံများ: အဓိကအယူအဆများနှင့် သတ်မှတ်ချက်များ
  - Installation Guide: စနစ်အလိုက် ထည့်သွင်းခြင်း လမ်းညွှန်ချက်များ
  - Configuration Guide: ပတ်ဝန်းကျင် တပ်ဆင်ခြင်းနှင့် အတည်ပြုရေး
  - First Project Tutorial: အဆင့်ချင်း လက်တွေ့လေ့ကျင့်နည်း

- **Deployment and Provisioning Module**
  - Deployment Guide: အလုပ်လျှောက်လမ်းစဉ် အပြည့်အစုံ
  - Provisioning Guide: Bicep ဖြင့် Infrastructure as Code
  - ထုတ်လုပ်မှု တင်သွင်းရာတွင် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ
  - Multi-service architecture နမူနာများ

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure ရင်းနှီးမြှုပ်နှံမှု စွမ်းရည် စစ်တမ်း
  - SKU Selection: ဝန်ဆောင်မှု အဆင့်ရွေးချယ်မှုပေးလာမှုများ
  - Pre-flight Checks: အလိုအလျောက် အတည်ပြုခြင်း script များ (PowerShell နှင့် Bash)
  - ကုန်ကျစရိတ် ခန့်မှန်းခြင်းနှင့် ဘတ်ဂျက်စီမံခန့်ခွဲမှုကိရိယာများ

- **Troubleshooting Module**
  - Common Issues: ထင်ရှားကြုံတွေ့ရသည့် ပြဿနာများနှင့် ဖြေရှင်းနည်း
  - Debugging Guide: စနစ်တကျ ပြဿနာရှာဖွေရေး နည်းဗျူဟာများ
  - အဆင့်မြင့် ရှာဖွေခြင်း နည်းပညာများနှင့် ကိရိယာများ
  - စွမ်းဆောင်ရည် စောင့်ကြည့်ခြင်းနှင့် ထိရောက်ရေး တိုးတက်စေရေး

- **Resources and References**
  - Command Cheat Sheet: အရေးကြီး အမိန့်များအတွက် လျှပ်စစ် မှတ်စု
  - Glossary: အသုံးအနှုန်းများနှင့် ကိုးကားသတ်မှတ်ချက်များ
  - FAQ: မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများအတွက် အသေးစိတ် ဖြေကြားချက်များ
  - အပြင်ဘက် အရင်းအမြစ် လင့်များနှင့် အသိုင်းအဝိုင်း ဆက်သွယ်ရန် နည်းလမ်းများ

- **Examples and Templates**
  - Simple Web Application ဥပမာ
  - Static Website တပ်ဆင်ရေး ပုံစံ
  - Container Application ဖော်ပြချက်
  - Database ပေါင်းစည်းမှု နမူနာများ
  - Microservices architecture နမူနာများ
  - Serverless function အကောင်အထည်ဖော်ချက်များ

#### Features
- **Multi-Platform Support**: Windows, macOS, နှင့် Linux များအတွက် ထည့်သွင်းခြင်းနှင့် ဖော်ပြချက် လမ်းညွှန်ချက်များ
- **Multiple Skill Levels**: ကျောင်းသားများမှ စ၍ ပရော်ဖက်ရှင်နယ် ဖွံ့ဖြိုးသူများထိ အသင့်
- **Practical Focus**: လက်တွေ့ ဥပမာများနှင့် အနုတ်လက္ခဏာ သဘောထားများ
- **Comprehensive Coverage**: အခြေခံ အယူအဆမှ အဆင့်မြင့် စီးပွားရေး ပုံစံများအထိ
- **Security-First Approach**: လုံခြုံရေး အကောင်းဆုံး လက်တွေ့များကို ချိတ်ဆက်ထားခြင်း
- **Cost Optimization**: ကုန်ကျစရိတ် ထိထိမိမိ တင်ပြမှုနှင့် အရင်းအမြစ် စီမံခန့်ခွဲမှု

#### Documentation Quality
- **Detailed Code Examples**: လက်တွေ့ အသုံးပြုနိုင်ပြီး စမ်းသပ်ထားသော ကုဒ် ဥပမာများ
- **Step-by-Step Instructions**: ရှင်းလင်း၍ လိုက်နာနိုင်သော လမ်းညွှန်ချက်များ
- **Comprehensive Error Handling**: အချိန်ကြာကြာ ကြုံတွေ့နိုင်သည့် ပြဿနာများအတွက် ပြုပြင်နည်းများ
- **Best Practices Integration**: စက်မှုပုံစံနှင့် အကြံပြုချက်များ
- **Version Compatibility**: နောက်ဆုံး Azure ဝန်ဆောင်မှုများနှင့် azd ထောက်ပံ့မှုနှင့် ကိုက်ညီမှု

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, နှင့် စိတ်ကြိုက် မော်ဒယ်များအတွက် ပေါင်းစည်းမှု ပုံစံများ
- **AI Agent Frameworks**: LangChain, Semantic Kernel, နှင့် AutoGen အသုံးချမှုများအတွက် စံနမူနာများ
- **Advanced RAG Patterns**: Azure AI Search အပြင် ရွေးချယ်နိုင်သော ဗက်တာ ဒေတာဘေ့(စ်) အစီအစဉ်များ (Pinecone, Weaviate, စသည်)
- **AI Observability**: မော်ဒယ် စွမ်းဆောင်ရည်၊ token သုံးစွဲနှုန်း နှင့် တုံ့ပြန်ချက် အရည်အသွေးတို့အတွက် တိုးတက် ပြည့်စုံအကောင်းမြင်မှု

#### Developer Experience
- **VS Code Extension**: AZD + Microsoft Foundry ပေါင်းစပ်ထားသည့် ဖွံ့ဖြိုးရေး အတွေ့အကြုံ
- **GitHub Copilot Integration**: AI ကူညီပေးသည့် AZD စံနမူနာ ဖန်တီးခြင်း
- **Interactive Tutorials**: AI ရှေ့ဆိုင်သော အခြေအနေများအတွက် အလိုအလျောက် စစ်ဆေးမှုဖြင့် လက်တွေ့ ကုတ်ရေး လေ့ကျင့်ခန်းများ
- **Video Content**: AI တင်သွင်းမှုအပေါ် အာရုံစိုက်၍ ဗီဒီယို သင်ခန်းစာများဖြင့် ဗစ်ရှွယ် အလေ့လာသူများအတွက် ထောက်ပံ့ချက်

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI မော်ဒယ် အုပ်ချုပ်မှု၊ လိုက်နာမှုနှင့် audit လမ်းကြောင်းများ
- **Multi-Tenant AI**: အများအပြား ဖောက်သည်များကို သီးခြားထားသော AI ဝန်ဆောင်မှုများဖြင့် ဝန်ဆောင်မှုပေးနိုင်ရန်ပုံစံများ
- **Edge AI Deployment**: Azure IoT Edge နှင့် ကွန်တိန်နာ အရင်းအမြစ်များနှင့် ပေါင်းစည်းခြင်း
- **Hybrid Cloud AI**: AI လုပ်ငန်းများအတွက် မလွန်မလျော့ multi-cloud နှင့် hybrid တင်သွင်းမှု ပုံစံများ

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning pipeline များနှင့် MLOps ပေါင်းစည်းခြင်း
- **Advanced Security**: Zero-trust ပုံစံများ၊ ပုဂ္ဂိုလ်ရေး endpoints များနှင့် တိုးတက်သော အန္တရာယ် ကာကွယ်မှု
- **Performance Optimization**: အမြင့် throughput AI အက်ပလီကေးရှင်းများအတွက် တိုးတက်အောင် ထိန်းညှိခြင်းနှင့် အသံချဲ့မှု မဟာဗျူဟာများ
- **Global Distribution**: AI အက်ပလီကေးရှင်းများအတွက် အကြောင်းအရာ ပို့ဆောင်ခြင်းနှင့် edge caching ပုံစံများ

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Microsoft Foundry အပြည့်အစုံ ပေါင်းစည်းမှု (ပြီးစီး)
- ✅ **Interactive Tutorials**: လက်တွေ့ AI အလုပ်ရုံသင်တန်း (ပြီးစီး)
- ✅ **Advanced Security Module**: AI သီးသန့် လုံခြုံရေး ပုံစံများ (ပြီးစီး)
- ✅ **Performance Optimization**: AI လုပ်ဆောင်မှု ညှိချက် မဟာဗျူဟာများ (ပြီးစီး)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI အာရုံစိုက် တင်သွင်းမှု အခြေအနေများ (ပြီးစီး)
- ✅ **Extended FAQ**: AI သီးသန့် မေးခွန်းများနှင့် ပြဿနာဖြေရှင်းခြင်း (ပြီးစီး)
- **Tool Integration**: IDE နှင့် editor ပေါင်းစည်းမှု လမ်းညွှန်များ တိုးမြှင့်ခြင်း
- ✅ **Monitoring Expansion**: AI သီးသန့် မောနီတာနှင့် အချက်ပေးရေး ပုံစံများ (ပြီးစီး)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: မိုဘိုင်း သင်ယူမှုအတွက် တုံ့ပြန်နိုင်သော ဒီဇိုင်း
- **Offline Access**: ဒေါင်းလုဒ်လုပ်၍ အသုံးပြုနိုင်သော စာတမ်း ထုပ်ပိုးမှုများ
- **Enhanced IDE Integration**: AZD + AI လုပ်ငန်းစဉ်များအတွက် VS Code တိုးချဲ့မှု
- **Community Dashboard**: real-time လူမှု သတင်းအချက်အလက်များနှင့် အထားဆောင်မှု တွက်ချက်ခြင်း

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: သို့ရိုက်ပြတ်ထားသော ပြောင်းလဲချက် ဖော်ပြချက်
5. **Impact Assessment**: ပြောင်းလဲမှုများက ရှိပြီးသား အသုံးပြုသူများကို မည်သို့ သက်ရောက်မည်ကို ဖော်ပြခြင်း

### Change Categories

#### Added
- အသစ်ထည့်သွင်းထားသော အင်္ဂါရပ်များ၊ စာတမ်း အပိုင်းများ သို့မဟုတ် လုပ်ဆောင်နိုင်မှုများ
- အသစ်သော နမူနာများ၊ စံနမူနာများ သို့မဟုတ် သင်ယူရေး အရင်းအမြစ်များ
- နောက်ထပ် ကိရိယာများ၊ စကရပ်(စ်)များ သို့မဟုတ် အသုံးဝင် ကိရိယာများ

#### Changed
- ရှိပြီးသား လုပ်ဆောင်ချက် သို့မဟုတ် စာတမ်းများကို ပြင်ဆင်ပြောင်းလဲခြင်း
- ရှင်းလင်းမှု သို့မဟုတ် တိကျမှုကို တိုးတက်စေရန် အပ်ဒိတ်များ
- အကြောင်းအရာ သို့မဟုတ် အဖွဲ့အစည်း ဖွဲ့စည်းပုံ ပြန်လည်ပြုပြင်ခြင်း

#### Deprecated
- သုတ်သာဖျက်ချေခံနေရသော အင်္ဂါရပ်များ သို့မဟုတ် နည်းလမ်းများ
- ဖယ်ရှားရန် စီစဉ်ထားသည့် စာတမ်း အပိုင်းများ
- ပိုမိုကိုက်ညီသော အခြား နည်းလမ်းများ ရှိနေသော နည်းပုံများ

#### Removed
- အရေးမကြီးတော့သော အင်္ဂါရပ်များ၊ စာတမ်းများ သို့မဟုတ် နမူနာများ
- ဟောင်းပြစ်နေသော အချက်အလက်များ သို့မဟုတ် အသုံးမပြုတော့သော နည်းလမ်းများ
- ထပ်တူဖြစ်နေသော သို့မဟုတ် ပေါင်းစည်းထားသော အကြောင်းအရာများ

#### Fixed
- စာတမ်း သို့မဟုတ် ကုဒ်အတွင်း အမှားများကို ပြင်ဆင်ခြင်း
- တင်ပြထားသည့် ပြဿနာများ သို့မဟုတ် အခက်အခဲများကို ဖြေရှင်းခြင်း
- တိကျမှု သို့မဟုတ် လုပ်ဆောင်နိုင်မှု တိုးတက်စေရန် တိုးတက်မှုများ

#### Security
- လုံခြုံရေးဆိုင်ရာ တိုးတက်မှုများ သို့မဟုတ် ပြင်ဆင်မှုများ
- လုံခြုံရေး အကောင်းဆုံး လမ်းစဉ်များအတွက် အပ်ဒိတ်များ
- လုံခြုံရေး ချို့ယွင်းချက်များကို ဖြေရှင်းခြင်း

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- အသုံးပြုသူ၏ လုပ်ဆောင်ချက် လိုအပ်စေသော ချိုးဖျက်သည့် ပြောင်းလဲမှုများ
- အကြောင်းအရာ သို့မဟုတ် အဖွဲ့အစည်း၏ အဓိက ပြုပြင်ပြောင်းလဲမှုများ
- မူလ ယုံကြည်ချက် သို့မဟုတ် နည်းဗျူဟာကို ပြောင်းလဲစေသည့် ပြောင်းလဲမှုများ

#### Minor Version (X.Y.0)
- အသစ်အင်္ဂါရပ်များ သို့မဟုတ် အကြောင်းအရာ ထည့်သွင်းခြင်းများ
- နောက်ကျောလိုက်သော ကိုက်ညီမှုကို ထိန်းသိမ်းထားပါသော တိုးတက်မှုများ
- နောက်ထပ် နမူနာများ၊ ကိရိယာများ သို့မဟုတ် အရင်းအမြစ်များ

#### Patch Version (X.Y.Z)
- အမှားပြင်ဆင်ခြင်းများနှင့် သက်သာစေသော ပြုပြင်ချက်များ
- ရှိပြီးသား အကြောင်းအရာများအတွက် အသေးစား တိုးတက်မှုများ
- ရှင်းလင်းရေးနည်းလမ်းများနှင့် အသေးစား တိုးတက်မှုများ

## Community Feedback and Suggestions

ကျွန်ုပ်တို့သည် ဤ သင်ယူရေး အရင်းအမြစ်ကို တိုးတက်အောင် လုပ်ရန် လူမှုအသိုင်းအဝိုင်း၏ တုံ့ပြန်ချက်များကို လှုံ့ဆော်အားပေးပါသည်။

### How to Provide Feedback
- **GitHub Issues**: ပြဿနာများကိုအစီရင်ခံရန် သို့မဟုတ် တိုးတက်စေရန် အကြံပြုရန် (AI သီးသန့် ပြဿနာများကိုလည်း ကြိုဆိုပါသည်)
- **Discord Discussions**: အယူအဆများမျှဝေရန်နှင့် Microsoft Foundry လူမှုအသိုင်းအဝိုင်းနှင့် ပါဝင်ဆွေးနွေးရန်
- **Pull Requests**: အကြောင်းအရာများကို တိုက်ရိုက် တိုးတက်စေရန် ဆက်လက်ထည့်သွင်းရန်၊ အထူးသဖြင့် AI စံနမူနာများနှင့် လမ်းညွှန်များ
- **Microsoft Foundry Discord**: AZD + AI ဆွေးနွေးချက်များအတွက် #Azure ချန်နယ်တွင် ပါဝင်ဆွေးနွေးပါ
- **Community Forums**: ကျယ်ပြန့်သော Azure ဖွံ့ဖြိုးရေးသူ ဆွေးနွေးချက်များတွင် ပါဝင်ဆောင်ရွက်ပါ

### Feedback Categories
- **AI Content Accuracy**: AI ဝန်ဆောင်မှု ပေါင်းစည်းမှုနှင့် တင်သွင်းခြင်း အချက်အလက်များအတွက် ပြင်ဆင်ချက်များ
- **Learning Experience**: AI ဖွံ့ဖြိုးရေးသူများအတွက် သင်ယူမှု အတွေ့အကြုံကို တိုးတက်စေရန် အကြံပြုချက်များ
- **Missing AI Content**: နောက်ထပ် AI စံနမူနာများ၊ ပုံစံများ သို့မဟုတ် နမူနာများ တောင်းဆိုချက်များ
- **Accessibility**: မတူကွဲပြားသည့် သင်ယူသူလိုအပ်ချက်များအတွက် တိုးတက်မှုများ
- **AI Tool Integration**: AI ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ် ပေါင်းစည်းမှုကို ပိုမိုကောင်းမွန်အောင် အကြံပြုချက်များ
- **Production AI Patterns**: လုပ်ငန်းအဆင့် AI တင်သွင်းမှု ပုံစံများအတွက် တောင်းဆိုချက်များ

### Response Commitment
- **Issue Response**: တင်ပြထားသော ပြဿနာများအတွက် ၄၈ နာရီအတွင်း တုံ့ပြန်ပါမည်
- **Feature Requests**: တစ်ပတ်အတွင်း သုံးသပ်ပါမည်
- **Community Contributions**: တစ်ပတ်အတွင်း ပြန်လည်သုံးသပ်ပါမည်
- **Security Issues**: အရေးပေါ် ဦးစားပေး၍ ချက်ချင်း တုံ့ပြန်ပါမည်

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: အကြောင်းအရာ တိကျမှုနှင့် လင့်ခ် များ စစ်ဆေးခြင်း
- **Quarterly Updates**: အကြောင်းအရာ အကြီးစား ထည့်သွင်းမှုများနှင့် တိုးတက်မှုများ
- **Semi-Annual Reviews**: အပြည့်အစုံ ပြန်လည်ဖွဲ့စည်းခြင်းနှင့် တိုးတက်မှုများ
- **Annual Releases**: အရေးကြီးတိုးတက်မှုများပါသော အဓိက ဗားရှင်း အပ်ဒိတ်များ

### Monitoring and Quality Assurance
- **Automated Testing**: ကုဒ် နမူနာများနှင့် လင့်ခ် များကို ပုံမှန် စစ်ဆေးနိုင်ရန် အလိုအလျောက် စမ်းသပ်မှု
- **Community Feedback Integration**: အသုံးပြုသူ အကြံပြုချက်များကို ပုံမှန် ထည့်သွင်းခြင်း
- **Technology Updates**: နောက်ဆုံး Azure ဝန်ဆောင်မှုများနှင့် azd ထုတ်ဝေမှုများနှင့် လိုက်၍ အပ်ဒိတ်လုပ်ခြင်း
- **Accessibility Audits**: ထည့်သွင်းအသုံးပြုနိုင်ရေး ဒီဇိုင်း နိယာမများအတွက် ပုံမှန် ပြန်လည်သုံးသပ်ခြင်း

## Version Support Policy

### Current Version Support
- **Latest Major Version**: ပုံမှန် အပ်ဒိတ်များနှင့်အတူ အပြည့်အဝ ထောက်ပံ့မှု
- **Previous Major Version**: လုံခြုံရေး အပ်ဒိတ်များနှင့် အရေးကြီး ပြင်ဆင်ချက်များကို ၁၂ လအတွင်း ပေးစီမံမှု
- **Legacy Versions**: လူမှုပဲ ထောက်ပံ့မှုရှိပြီး တရားဝင် အပ်ဒိတ် မပေးပါ

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: အဆင့်လိုက် ပြောင်းရွှေ့ခြင်း သို့မဟုတ် လမ်းညွှန်ချက်များ
- **Compatibility Notes**: ချိုးဖျက်သည့် ပြောင်းလဲမှုများနှင့်ဆိုင်သော အသေးစိတ် အချက်အလက်များ
- **Tool Support**: ပြောင်းရွှေ့မှုကို ကူညီပေးနိုင်သော script များ သို့မဟုတ် အသုံးဝင် ကိရိယာများ
- **Community Support**: ပြောင်းရွှေ့မှု မေးခွန်းများအတွက် သီးသန့် ဖိုရမ်များ

---

**Navigation**
- **Previous Lesson**: [လေ့လာမှု လမ်းညွှန်](resources/study-guide.md)
- **Next Lesson**: ပြန်သွားရန် [အဓိက README](README.md)

**Stay Updated**: ဤ repository ကို ကြည့်ရှု၍ သင်ယူရေးပစ္စည်းများအတွက် ထုတ်ဝေမှုအသစ်များနှင့် အရေးကြီး အပ်ဒိတ်များအကြောင်း အသိပေးချက်များ ရရှိရန် ထိန်းလိုက်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ကြေညာချက်**:
စာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုလျော့နည်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာဖြင့် အကျိုးသက်ရောက်သော အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်သူအား အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသော နားလည်မှုချွတ်မြေ သို့မဟုတ် အဓိပ္ပါယ်အား ခွဲဝေပေါက်ဖွားမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
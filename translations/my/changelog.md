# Changelog - AZD For Beginners

## အနိဌာရုံ

ဒီ changelog က AZD For Beginners repository ရဲ့ အရေးကြီးတဲ့ ပြောင်းလဲမှုတွေ၊ အပ်ဒိတ်တွေ၊ တိုးတက်မှုတွေကို မှတ်တမ်းတင်ထားတာပါ။ Semantic versioning စံနှုန်းတွေကို လိုက်နာပြီး version တစ်ခုနဲ့ တစ်ခုကြားမှာ ဘာတွေပြောင်းလဲသွားတယ်ဆိုတာကို အသုံးပြုသူတွေ သိရှိနိုင်ဖို့ ဒီ log ကို ထိန်းသိမ်းထားပါတယ်။

## သင်ယူရမယ့် ရည်မှန်းချက်များ

ဒီ changelog ကို ကြည့်ရှုခြင်းအားဖြင့် သင်သည်:
- အင်္ဂါရပ်အသစ်များနှင့် အကြောင်းအရာ ထပ်တိုးမှုများကို သိရှိနိုင်မည်
- ရှိပြီးသား documentation တွေမှာ ပြုပြင်မွမ်းမံမှုတွေကို နားလည်နိုင်မည်
- အမှားပြင်ဆင်မှုများနှင့် တိကျမှုအတွက် bug fix တွေကို လိုက်လံကြည့်ရှုနိုင်မည်
- သင်ယူရေးအတွက် learning materials တွေ ဘယ်လိုတိုးတက်လာတယ်ဆိုတာကို နားလည်နိုင်မည်

## သင်ယူပြီးရမယ့် ရလဒ်များ

Changelog မှတ်တမ်းတွေကို ကြည့်ရှုပြီးနောက် သင်သည်:
- သင်ယူရေးအတွက် အသစ်ထည့်ထားတဲ့ အကြောင်းအရာများနှင့် resources တွေကို သိရှိနိုင်မည်
- ဘယ်အပိုင်းတွေကို ပြုပြင်မွမ်းမံထားတယ်ဆိုတာ နားလည်နိုင်မည်
- လက်ရှိအကြောင်းအရာများအပေါ် အခြေခံပြီး သင်ယူရေးလမ်းကြောင်းကို စီစဉ်နိုင်မည်
- အနာဂတ်အတွက် တိုးတက်မှုအတွက် အကြံပြုချက်များပေးနိုင်မည်

## Version History

### [v3.8.0] - 2025-11-19

#### အဆင့်မြင့် Documentation: Monitoring, Security, နှင့် Multi-Agent Patterns
**ဒီ version မှာ Application Insights integration, authentication patterns, နှင့် production deployments အတွက် multi-agent coordination အပေါ် အပြည့်အစုံ A-grade သင်ခန်းစာတွေ ထည့်သွင်းထားပါတယ်။**

#### ထည့်သွင်းထားသည်
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md` မှာ:
  - AZD အခြေခံ deployment နဲ့ automatic provisioning
  - Application Insights + Log Analytics အတွက် အပြည့်အစုံ Bicep templates
  - Custom telemetry ပါတဲ့ Python application (1,200+ lines)
  - AI/LLM monitoring patterns (Azure OpenAI token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query ตัวอย่างများနှင့် cost optimization strategies
  - Live metrics streaming နှင့် real-time debugging
  - 40-50 မိနစ် သင်ယူရေးအချိန်နဲ့ production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md` မှာ:
  - Authentication patterns 3 ခု (connection strings, Key Vault, managed identity)
  - Secure deployments အတွက် အပြည့်အစုံ Bicep infrastructure templates
  - Azure SDK integration ပါတဲ့ Node.js application code
  - 3 complete exercises (managed identity enablement, user-assigned identity, Key Vault rotation)
  - Security best practices နှင့် RBAC configurations
  - Troubleshooting guide နှင့် cost analysis
  - Production-ready passwordless authentication patterns

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md` မှာ:
  - Coordination patterns 5 ခု (sequential, parallel, hierarchical, event-driven, consensus)
  - Orchestrator service implementation အပြည့်အစုံ (Python/Flask, 1,500+ lines)
  - Specialized agent implementations 3 ခု (Research, Writer, Editor)
  - Service Bus integration for message queuing
  - Cosmos DB state management for distributed systems
  - 6 Mermaid diagrams showing agent interactions
  - Advanced exercises 3 ခု (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/month) နှင့် optimization strategies
  - Application Insights integration for monitoring

#### တိုးတက်မှုများ
- **Pre-deployment Chapter**: Comprehensive monitoring နှင့် coordination patterns ပါဝင်
- **Getting Started Chapter**: Professional authentication patterns ဖြင့် တိုးတက်မှုရှိ
- **Production Readiness**: Security မှ observability အထိ အပြည့်အစုံ coverage
- **Course Outline**: Chapter 3 နှင့် 6 မှာ အသစ်ထည့်ထားတဲ့ lessons ကို reference ပြုလုပ်ထား

#### ပြောင်းလဲမှုများ
- **Learning Progression**: Security နှင့် monitoring ကို သင်ခန်းစာတစ်ခုလုံးမှာ ပိုမိုပေါင်းစည်းထား
- **Documentation Quality**: အသစ်ထည့်ထားတဲ့ lessons တွေမှာ A-grade standards (95-97%) တစ်ခုလုံး consistent ဖြစ်
- **Production Patterns**: Enterprise deployments အတွက် end-to-end coverage

#### တိုးတက်မှုများ
- **Developer Experience**: Development မှ production monitoring အထိ ရှင်းလင်းတဲ့ လမ်းကြောင်း
- **Security Standards**: Authentication နှင့် secrets management အတွက် professional patterns
- **Observability**: AZD နဲ့ Application Insights integration အပြည့်အစုံ
- **AI Workloads**: Azure OpenAI နှင့် multi-agent systems အတွက် monitoring အထူးပြု

#### အတည်ပြုထားသည်
- ✅ Lessons အားလုံးမှာ complete working code ပါဝင် (snippets မဟုတ်)
- ✅ Visual learning အတွက် Mermaid diagrams (19 total across 3 lessons)
- ✅ Verification steps ပါတဲ့ hands-on exercises (9 total)
- ✅ Production-ready Bicep templates ကို `azd up` နဲ့ deploy လုပ်နိုင်
- ✅ Cost analysis နှင့် optimization strategies
- ✅ Troubleshooting guides နှင့် best practices
- ✅ Knowledge checkpoints နဲ့ verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Comprehensive monitoring guide
- **docs/getting-started/authsecurity.md**: - Professional security patterns
- **docs/pre-deployment/coordination-patterns.md**: - Advanced multi-agent architectures
- **Overall New Content**: - Consistent high-quality standards

#### Technical Implementation
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements နှင့် Azure OpenAI Example အသစ်
**ဒီ version မှာ documentation quality ကို repository တစ်ခုလုံးမှာ တိုးတက်စေပြီး GPT-4 chat interface ပါတဲ့ Azure OpenAI deployment example အပြည့်အစုံကို ထည့်သွင်းထားပါတယ်။**

#### ထည့်သွင်းထားသည်
- **🤖 Azure OpenAI Chat Example**: GPT-4 deployment အပြည့်အစုံနဲ့ working implementation `examples/azure-openai-chat/` မှာ:
  - Azure OpenAI infrastructure အပြည့်အစုံ (GPT-4 model deployment)
  - Conversation history ပါတဲ့ Python command-line chat interface
  - Secure API key storage အတွက် Key Vault integration
  - Token usage tracking နှင့် cost estimation
  - Rate limiting နှင့် error handling
  - Comprehensive README နဲ့ 35-45 မိနစ် deployment guide
  - Production-ready files 11 ခု (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Configuration guide မှာ hands-on practice exercises ထည့်သွင်းထား:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria နှင့် verification steps
- **✅ Deployment Verification**: Deployment guide မှာ verification section ထည့်သွင်းထား:
  - Health check procedures
  - Success criteria checklist
  - Deployment commands အတွက် expected outputs
  - Troubleshooting quick reference

#### တိုးတက်မှုများ
- **examples/README.md**: A-grade quality (93%) အထိ တိုးတက်မှုရှိ:
  - azure-openai-chat ကို သက်ဆိုင်ရာ အပိုင်းအားလုံးမှာ ထည့်သွင်းထား
  - Local example count ကို 3 မှ 4 အထိ update လုပ်ထား
  - AI Application Examples table မှာ ထည့်သွင်းထား
  - Intermediate Users အတွက် Quick Start မှာ ထည့်သွင်းထား
  - Azure AI Foundry Templates section မှာ ထည့်သွင်းထား
  - Comparison Matrix နှင့် technology finding sections ကို update လုပ်ထား
- **Documentation Quality**: B+ (87%) → A- (92%) အထိ docs folder တစ်ခုလုံးမှာ တိုးတက်မှုရှိ:
  - Critical command examples အတွက် expected outputs ထည့်သွင်းထား
  - Configuration changes အတွက် verification steps ထည့်သွင်းထား
  - Practical exercises နဲ့ hands-on learning ကို တိုးတက်စေထား

#### ပြောင်းလဲမှုများ
- **Learning Progression**: Intermediate learners အတွက် AI examples ကို ပိုမိုပေါင်းစည်းထား
- **Documentation Structure**: Actionable exercises တွေကို ပိုမိုရှင်းလင်းစေထား
- **Verification Process**: Key workflows အတွက် explicit success criteria ထည့်သွင်းထား

#### တိုးတက်မှုများ
- **Developer Experience**: Azure OpenAI deployment အချိန်ကို 35-45 မိနစ်အထိ လျှော့ချထား (vs 60-90 မိနစ်)
- **Cost Transparency**: Azure OpenAI example အတွက် cost estimates ($50-200/month) ရှင်းလင်းစေထား
- **Learning Path**: AI developers အတွက် azure-openai-chat နဲ့ ရှင်းလင်းတဲ့ entry point
- **Documentation Standards**: Expected outputs နှင့် verification steps တစ်ခုလုံး consistent ဖြစ်

#### အတည်ပြုထားသည်
- ✅ Azure OpenAI example ကို `azd up` နဲ့ အပြည့်အစုံ functional ဖြစ်
- ✅ Implementation files 11 ခု အားလုံး syntactically correct ဖြစ်
- ✅ README instructions တွေ actual deployment experience နဲ့ ကိုက်ညီ
- ✅ Documentation links ကို 8+ locations မှာ update လုပ်ထား
- ✅ Examples index မှာ local examples 4 ခုကို မှန်ကန်စွာ ပြထား
- ✅ Tables မှာ duplicate external links မရှိ
- ✅ Navigation references အားလုံး မှန်ကန်

#### Technical Implementation
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking နှင့် usage optimization
- **Deployment**: Single `azd up` command နဲ့ complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**ဒီ version မှာ Azure Developer CLI (AZD) ကို အသုံးပြုပြီး production-ready container application deployment examples အပြည့်အစုံကို documentation နဲ့ learning path မှာ ထည့်သွင်းထားပါတယ်။**

#### ထည့်သွင်းထားသည်
- **🚀 Container App Examples**: Local examples အသစ် `examples/container-app/` မှာ:
  - [Master Guide](examples/container-app/README.md): Containerized deployments, quick start, production, နှင့် advanced patterns အပြည့်အစုံ overview
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, နှင့် troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, နှင့် CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, နှင့် multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### ပြောင်းလဲမှုများ
- **README.md**: Container app examples ကို "Local Examples - Container Applications" အပိုင်းမှာ feature နှင့် link ပြုလုပ်ထား
- **examples/README.md**: Container app examples ကို highlight ပြုလုပ်ပြီး comparison matrix entries ထည့်သွင်းထား
- **Course Outline & Study Guide**: Container app examples နှင့် deployment patterns ကို သက်ဆိုင်ရာ chapters မှာ reference ပြုလုပ်ထား

#### အတည်ပြုထားသည်
- ✅ Examples အသစ်အားလုံးကို `azd up` နဲ့ deploy လုပ်နိုင်ပြီး best practices ကို လိုက်နာထား
- ✅ Documentation cross-links နှင့် navigation ကို update လုပ်ထား
- ✅ Examples တွေ beginner မှ advanced scenarios အထိ cover လုပ်ထား

#### Notes
- **Scope**: English documentation နှင့် examples တွေကိုသာ အကျုံးဝင်
- **Next Steps**: အနာဂတ် releases မှာ CI/CD automation နဲ့ advanced container patterns ထည့်သွင်းရန်

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**ဒီ version မှာ "Azure AI Foundry" ကို "Microsoft Foundry" အဖြစ် Microsoft ရဲ့ official rebranding ကို English documentation တစ်ခုလုံးမှာ ပြုလုပ်ထားပါတယ်။**

#### ပြောင်းလဲမှုများ
- **🔄 Product Name Update**: "Azure AI Foundry" → "Microsoft Foundry" အဖြစ် rebranding ပြုလုပ်ထား
  - English documentation `docs/` folder မှာ references အားလုံးကို update လုပ်ထား
  - Folder name: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - File name: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: Documentation files 7 ခုမှာ content references 23 ခု update လုပ်ထား

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` ကို `docs/microsoft-foundry/` အဖြစ် rename လုပ်ထား
  - Cross-references အားလုံးကို အသစ် folder structure နဲ့ ကိုက်ညီအောင် update လုပ်ထား
  - Navigation links အားလုံးကို validate လုပ်ထား

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Internal links အားလုံးကို အသစ် filename နဲ့ update လုပ်ထား

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - Navigation link updates 3 ခု
  - `docs/microsoft-foundry/ai-workshop-lab.md` - Product name references update 4 ခု
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Microsoft Foundry ကို အရင် version မှ update လုပ်ထားပြီးသား
  - `docs/microsoft-foundry/production-ai-practices.md` - References update 3 ခု (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - Cross-reference links update 4 ခု
  - `docs/getting-started/first-project.md` - Chapter navigation links update 2 ခု
  - `docs/getting-started/installation.md` - Next chapter links update 2 ခု
  - `docs/troubleshooting/ai-troubleshooting.md` - References update 3 ခု (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - Navigation link update 1 ခု
  - `docs/troubleshooting/debugging.md` - Navigation link update 1 ခု

- **Course Structure Files** (2 files):
  - `README.md` - References update 17 ခု (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - References update 14 ခု (overview, learning objectives, chapter resources)

#### အတည်ပြုထားသည်
- ✅ English docs မှာ "ai-foundry" folder path references မရှိတော့
- ✅ English docs မှာ "Azure AI Foundry" product name references မရှိတော့
- ✅ Navigation links အားလုံး အသစ် folder structure နဲ့ အလုပ်လုပ်
- ✅ File နှင့် folder renames အောင်မြင်စွာ ပြုလုပ်ပြီး
- ✅ Chapters ကြားမှာ cross-references အားလုံး validated

#### Notes
- **Scope**: English documentation `docs/` folder မှာသာ ပြုလုပ်ထား
- **Translations**: Translation folders (`translations/`) ကို ဒီ version မှာ update မပြုလုပ်သေး
- **Workshop**: Workshop ပစ္စည်းများ (`workshop/`) ကို ဤဗားရှင်းတွင် မပြင်ဆင်ထားပါ
- **Examples**: နမူနာဖိုင်များတွင် ရှေးဟောင်းနာမည်များကို ရည်ညွှန်းထားနိုင်ပြီး (အနာဂတ်အပ်ဒိတ်တွင် ပြင်ဆင်မည်)
- **External Links**: အပြင် URL များနှင့် GitHub repository ရည်ညွှန်းချက်များ မပြောင်းလဲပါ

#### Contributor များအတွက် Migration လမ်းညွှန်
သင်၏ local branches သို့မဟုတ် documentation တွင် ရှေးဟောင်းဖွဲ့စည်းမှုကို ရည်ညွှန်းထားပါက:
1. Folder ရည်ညွှန်းချက်များကို ပြင်ဆင်ပါ: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ဖိုင်ရည်ညွှန်းချက်များကို ပြင်ဆင်ပါ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ထုတ်ကုန်နာမည်ကို အစားထိုးပါ: "Azure AI Foundry" → "Microsoft Foundry"
4. Internal documentation links အားလုံးကို အလုပ်လုပ်နေဆဲဖြစ်ကြောင်း အတည်ပြုပါ

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview နှင့် Validation အဆင့်မြှင့်တင်မှုများ
**ဤဗားရှင်းတွင် Azure Developer CLI preview feature အသစ်ကို အပြည့်အဝပံ့ပိုးမှုနှင့် workshop အသုံးပြုသူအတွေ့အကြုံကို မြှင့်တင်ထားသည်။**

#### ထည့်သွင်းထားသည်
- **🧪 azd provision --preview Feature Documentation**: Infrastructure preview စွမ်းဆောင်ရည်အသစ်ကို အပြည့်အဝဖော်ပြထားသည်
  - Command reference နှင့် cheat sheet တွင် အသုံးပြုနည်းနမူနာများ
  - Provisioning guide တွင် အသုံးပြုမှုနည်းလမ်းများနှင့် အကျိုးကျေးဇူးများကို အသေးစိတ်ဖော်ပြထားသည်
  - Pre-flight check integration ဖြင့် deployment validation ကို ပိုမိုလုံခြုံစေသည်
  - Safety-first deployment လုပ်ဆောင်မှုများနှင့်အတူ Getting started guide ကို အပ်ဒိတ်လုပ်ထားသည်
- **🚧 Workshop Status Banner**: Workshop ဖွံ့ဖြိုးမှုအခြေအနေကို ဖော်ပြသည့် HTML banner
  - Gradient design နှင့် construction indicators ဖြင့် အသုံးပြုသူများကို ရှင်းလင်းစွာ ဆက်သွယ်ပေးသည်
  - Transparency အတွက် နောက်ဆုံးအပ်ဒိတ်ရက်စွဲ
  - Mobile-responsive design ဖြင့် စက်ပစ္စည်းအားလုံးအတွက် အဆင်ပြေစေသည်

#### အဆင့်မြှင့်တင်ထားသည်
- **Infrastructure Safety**: Deployment documentation တစ်လျှောက် preview functionality ကို ပေါင်းစပ်ထားသည်
- **Pre-deployment Validation**: Automated scripts တွင် infrastructure preview testing ကို ထည့်သွင်းထားသည်
- **Developer Workflow**: Preview ကို အကောင်းဆုံးအလုပ်လုပ်နည်းအဖြစ် ထည့်သွင်းထားသော command sequences
- **Workshop Experience**: Workshop content ဖွံ့ဖြိုးမှုအခြေအနေကို အသုံးပြုသူများအတွက် ရှင်းလင်းစွာ ဖော်ပြထားသည်

#### ပြောင်းလဲထားသည်
- **Deployment Best Practices**: Preview-first workflow ကို အကြံပြုထားသော နည်းလမ်းအဖြစ် ပြောင်းလဲထားသည်
- **Documentation Flow**: Infrastructure validation ကို သင်ကြားမှုလုပ်ငန်းစဉ်အစပိုင်းတွင် ရွှေ့ထားသည်
- **Workshop Presentation**: Development timeline ကို ရှင်းလင်းစွာ ဖော်ပြထားသော Professional status communication

#### တိုးတက်မှုများ
- **Safety-First Approach**: Infrastructure ပြောင်းလဲမှုများကို deployment မပြုလုပ်မီ အတည်ပြုနိုင်သည်
- **Team Collaboration**: Preview ရလဒ်များကို ပြန်လည်သုံးသပ်ခြင်းနှင့် အတည်ပြုခြင်းအတွက် မျှဝေနိုင်သည်
- **Cost Awareness**: Provisioning မပြုလုပ်မီ resource ကုန်ကျစရိတ်ကို ပိုမိုနားလည်စေသည်
- **Risk Mitigation**: အတည်ပြုမှုကြိုတင်ပြုလုပ်ခြင်းမှတစ်ဆင့် deployment မအောင်မြင်မှုများကို လျှော့ချနိုင်သည်

#### Technical Implementation
- **Multi-document Integration**: Preview feature ကို documentation အရေးပါသော ၄ ဖိုင်တွင် ဖော်ပြထားသည်
- **Command Patterns**: Syntax နှင့် နမူနာများကို documentation တစ်လျှောက် တူညီစွာ အသုံးပြုထားသည်
- **Best Practice Integration**: Validation workflows နှင့် scripts တွင် preview ကို ထည့်သွင်းထားသည်
- **Visual Indicators**: Discoverability အတွက် NEW feature အမှတ်အသားများကို ရှင်းလင်းစွာ ဖော်ပြထားသည်

#### Workshop Infrastructure
- **Status Communication**: Gradient styling ပါရှိသော Professional HTML banner
- **User Experience**: Development status ရှင်းလင်းစွာ ဖော်ပြထားသည်
- **Professional Presentation**: Repository ရဲ့ ယုံကြည်စိတ်ချမှုကို ထိန်းသိမ်းထားပြီး မျှော်လင့်ချက်များကို သတ်မှတ်ထားသည်
- **Timeline Transparency**: Accountability အတွက် 2025 အောက်တိုဘာ နောက်ဆုံးအပ်ဒိတ်ရက်စွဲ

### [v3.3.0] - 2025-09-24

#### Workshop Materials နှင့် Interactive Learning Experience အဆင့်မြှင့်တင်မှု
**ဤဗားရှင်းတွင် browser-based interactive guides နှင့် structured learning paths ပါရှိသော workshop materials အပြည့်အဝ ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းထားသည်
- **🎥 Interactive Workshop Guide**: MkDocs preview စွမ်းဆောင်ရည်ဖြင့် browser-based workshop အတွေ့အကြုံ
- **📝 Structured Workshop Instructions**: Discovery မှ Customization အထိ 7-step guided learning path
  - 0-Introduction: Workshop အကျဉ်းချုပ်နှင့် setup
  - 1-Select-AI-Template: Template ရှာဖွေမှုနှင့် ရွေးချယ်မှုလုပ်ငန်းစဉ်
  - 2-Validate-AI-Template: Deployment နှင့် validation လုပ်ငန်းစဉ်များ
  - 3-Deconstruct-AI-Template: Template architecture ကို နားလည်ခြင်း
  - 4-Configure-AI-Template: Configuration နှင့် customization
  - 5-Customize-AI-Template: အဆင့်မြင့်ပြင်ဆင်မှုများနှင့် iteration
  - 6-Teardown-Infrastructure: Cleanup နှင့် resource စီမံခန့်ခွဲမှု
  - 7-Wrap-up: အကျဉ်းချုပ်နှင့် နောက်တစ်ဆင့်များ
- **🛠️ Workshop Tooling**: Material theme ပါရှိသော MkDocs configuration
- **🎯 Hands-On Learning Path**: Discovery → Deployment → Customization အဆင့် 3-step methodology
- **📱 GitHub Codespaces Integration**: Development environment setup ကို seamless ဖြစ်စေသည်

#### အဆင့်မြှင့်တင်ထားသည်
- **AI Workshop Lab**: 2-3 နာရီ structured learning အတွေ့အကြုံဖြင့် တိုးချဲ့ထားသည်
- **Workshop Documentation**: Navigation နှင့် visual aids ပါရှိသော Professional presentation
- **Learning Progression**: Template ရွေးချယ်မှုမှ Production deployment အထိ အဆင့်ဆင့် လမ်းညွှန်မှု
- **Developer Experience**: Development workflows ကို ပိုမိုလွယ်ကူစေသော tooling ထည့်သွင်းထားသည်

#### တိုးတက်မှုများ
- **Accessibility**: Search, copy functionality, နှင့် theme toggle ပါရှိသော browser-based interface
- **Self-Paced Learning**: အချိန်နှင့်အမျှ သင်ယူနိုင်သော workshop ဖွဲ့စည်းမှု
- **Practical Application**: AI template deployment scenarios များကို အကောင်အထည်ဖော်နိုင်သည်
- **Community Integration**: Workshop support နှင့် collaboration အတွက် Discord integration

#### Workshop Features
- **Built-in Search**: Keyword နှင့် lesson ရှာဖွေမှုကို လွယ်ကူစေသည်
- **Copy Code Blocks**: Code နမူနာများအတွက် hover-to-copy စွမ်းဆောင်ရည်
- **Theme Toggle**: Dark/light mode ကို အသုံးပြုသူနှစ်သက်မှုအလိုက် ပြောင်းလဲနိုင်သည်
- **Visual Assets**: နားလည်မှုတိုးတက်စေရန် Screenshots နှင့် diagrams
- **Help Integration**: Community support အတွက် Discord ကို တိုက်ရိုက်ရောက်ရှိနိုင်သည်

### [v3.2.0] - 2025-09-17

#### Navigation ပြုပြင်မှုများနှင့် Chapter-Based Learning System
**ဤဗားရှင်းတွင် repository တစ်ခုလုံးအတွင်း navigation ကို တိုးတက်စေသော chapter-based learning structure ကို ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းထားသည်
- **📚 Chapter-Based Learning System**: 8 progressive learning chapters အဖြစ် course တစ်ခုလုံးကို ပြုပြင်ထားသည်
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 မိနစ်)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 နာရီ)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 မိနစ်)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 နာရီ)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 နာရီ)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 နာရီ)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 နာရီ)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 နာရီ)
- **📚 Comprehensive Navigation System**: Documentation အားလုံးတွင် navigation headers နှင့် footers တူညီစွာ ထည့်သွင်းထားသည်
- **🎯 Progress Tracking**: Course completion checklist နှင့် learning verification system
- **🗺️ Learning Path Guidance**: အတွေ့အကြုံအဆင့်များနှင့် ရည်မှန်းချက်များအတွက် ရှင်းလင်းသော entry points
- **🔗 Cross-Reference Navigation**: Related chapters နှင့် prerequisites ကို ရှင်းလင်းစွာ ရည်ညွှန်းထားသည်

#### အဆင့်မြှင့်တင်ထားသည်
- **README Structure**: Chapter-based organization ဖြင့် structured learning platform အဖြစ် ပြောင်းလဲထားသည်
- **Documentation Navigation**: Chapter context နှင့် progression guidance ပါရှိသော စာမျက်နှာအားလုံး
- **Template Organization**: Examples နှင့် templates များကို သင်ကြားမှု chapters နှင့် mapping ပြုလုပ်ထားသည်
- **Resource Integration**: Cheat sheets, FAQs, နှင့် study guides ကို သက်ဆိုင်ရာ chapters နှင့် ချိတ်ဆက်ထားသည်
- **Workshop Integration**: Hands-on labs များကို multiple chapter learning objectives နှင့် mapping ပြုလုပ်ထားသည်

#### ပြောင်းလဲထားသည်
- **Learning Progression**: Linear documentation မှ Flexible chapter-based learning သို့ ပြောင်းလဲထားသည်
- **Configuration Placement**: Configuration guide ကို Chapter 3 အဖြစ် reposition ပြုလုပ်ထားသည်
- **AI Content Integration**: Learning journey တစ်လျှောက် AI-specific content ကို ပိုမိုထည့်သွင်းထားသည်
- **Production Content**: Enterprise learners အတွက် advanced patterns ကို Chapter 8 တွင် စုစည်းထားသည်

#### တိုးတက်မှုများ
- **User Experience**: Navigation breadcrumbs နှင့် chapter progression indicators
- **Accessibility**: Course traversal ကို ပိုမိုလွယ်ကူစေသော navigation patterns
- **Professional Presentation**: Academic နှင့် corporate training အတွက် သင့်လျော်သော University-style course structure
- **Learning Efficiency**: Improved organization မှတစ်ဆင့် သက်ဆိုင်ရာ content ရှာဖွေမှုအချိန်ကို လျှော့ချနိုင်သည်

#### Technical Implementation
- **Navigation Headers**: Documentation ဖိုင် 40+ တွင် standardized chapter navigation
- **Footer Navigation**: Chapter completion indicators နှင့် consistent progression guidance
- **Cross-Linking**: Related concepts များကို ချိတ်ဆက်ထားသော internal linking system
- **Chapter Mapping**: Learning objectives နှင့် mapping ပြုလုပ်ထားသော templates နှင့် examples

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8-chapter system နှင့် alignment ပြုလုပ်ထားသော study guide
- **🎯 Chapter-Based Assessment**: Chapter တစ်ခုစီတွင် specific learning objectives နှင့် practical exercises
- **📋 Progress Tracking**: Weekly learning schedule နှင့် measurable outcomes
- **❓ Assessment Questions**: Professional outcomes ရရှိစေရန် knowledge validation questions
- **🛠️ Practical Exercises**: Real deployment scenarios နှင့် troubleshooting ပါရှိသော hands-on activities
- **📊 Skill Progression**: Basic concepts မှ Enterprise patterns အထိ career development focus
- **🎓 Certification Framework**: Community recognition system နှင့် professional development outcomes
- **⏱️ Timeline Management**: Milestone validation ပါရှိသော 10-week learning plan

### [v3.1.0] - 2025-09-17

#### Multi-Agent AI Solutions အဆင့်မြှင့်တင်မှု
**ဤဗားရှင်းတွင် multi-agent retail solution ကို agent naming နှင့် documentation တိုးတက်စေရန် ပြုပြင်ထားသည်။**

#### ပြောင်းလဲထားသည်
- **Multi-Agent Terminology**: Retail multi-agent solution တစ်လျှောက် "Cora agent" ကို "Customer agent" အဖြစ် အစားထိုးထားသည်
- **Agent Architecture**: Documentation, ARM templates, နှင့် code examples အားလုံးကို "Customer agent" naming ဖြင့် ပြုပြင်ထားသည်
- **Configuration Examples**: Updated naming conventions ဖြင့် agent configuration patterns ကို modernized ပြုလုပ်ထားသည်
- **Documentation Consistency**: Professional, descriptive agent names ဖြင့် references အားလုံးကို အတည်ပြုထားသည်

#### အဆင့်မြှင့်တင်ထားသည်
- **ARM Template Package**: Customer agent references ပါရှိသော retail-multiagent-arm-template ကို အပ်ဒိတ်လုပ်ထားသည်
- **Architecture Diagrams**: Updated agent naming ဖြင့် Mermaid diagrams ကို refresh ပြုလုပ်ထားသည်
- **Code Examples**: CustomerAgent naming ဖြင့် Python classes နှင့် implementation examples
- **Environment Variables**: CUSTOMER_AGENT_NAME conventions ဖြင့် deployment scripts အားလုံးကို အပ်ဒိတ်လုပ်ထားသည်

#### တိုးတက်မှုများ
- **Developer Experience**: Documentation တွင် agent roles နှင့် တာဝန်များကို ပိုမိုရှင်းလင်းစေသည်
- **Production Readiness**: Enterprise naming conventions နှင့် ပိုမိုသင့်လျော်စေသည်
- **Learning Materials**: Educational purposes အတွက် agent naming ကို ပိုမိုနားလည်လွယ်စေသည်
- **Template Usability**: Agent functions နှင့် deployment patterns ကို ပိုမိုလွယ်ကူစေသည်

#### Technical Details
- CustomerAgent references ပါရှိသော Mermaid architecture diagrams ကို အပ်ဒိတ်လုပ်ထားသည်
- Python examples တွင် CoraAgent class names ကို CustomerAgent အဖြစ် အစားထိုးထားသည်
- ARM template JSON configurations တွင် "customer" agent type ကို အသုံးပြုထားသည်
- Environment variables တွင် CORA_AGENT_* မှ CUSTOMER_AGENT_* patterns သို့ ပြောင်းလဲထားသည်
- Deployment commands နှင့် container configurations အားလုံးကို refresh ပြုလုပ်ထားသည်

### [v3.0.0] - 2025-09-12

#### AI Developer အာရုံစိုက်မှုနှင့် Azure AI Foundry Integration
**ဤဗားရှင်းတွင် repository ကို AI-focused learning resource အဖြစ် ပြောင်းလဲထားပြီး Azure AI Foundry integration ကို ထည့်သွင်းထားသည်။**

#### ထည့်သွင်းထားသည်
- **🤖 AI-First Learning Path**: AI developers နှင့် engineers အတွက် priority ရှိသော restructure
- **Azure AI Foundry Integration Guide**: AZD ကို Azure AI Foundry services နှင့် ချိတ်ဆက်ရန် documentation
- **AI Model Deployment Patterns**: Model ရွေးချယ်မှု, configuration, နှင့် production deployment strategies
- **AI Workshop Lab**: AZD-deployable solutions သို့ AI applications ကို ပြောင်းလဲရန် 2-3 နာရီ hands-on workshop
- **Production AI Best Practices**: AI workloads အတွက် enterprise-ready patterns
- **AI-Specific Troubleshooting Guide**: Azure OpenAI, Cognitive Services, နှင့် AI deployment အခက်အခဲများအတွက် troubleshooting
- **AI Template Gallery**: Complexity ratings ပါရှိသော Azure AI Foundry templates collection
- **Workshop Materials**: Hands-on labs နှင့် reference materials ပါရှိသော complete workshop structure

#### အဆင့်မြှင့်တင်ထားသည်
- **README Structure**: Azure AI Foundry Discord မှ 45% community interest data ဖြင့် AI-developer focused
- **Learning Paths**: AI developer journey နှင့် students နှင့် DevOps engineers အတွက် traditional paths
- **Template Recommendations**: Featured AI templates (azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart)
- **Community Integration**: AI-specific channels နှင့် discussions ပါရှိသော Discord community support

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication နှင့် security configurations
- **Cost Optimization**: AI workloads အတွက် token usage tracking နှင့် budget controls
- **Multi-Region Deployment**: Global AI application deployment အတွက် strategies
- **Performance Monitoring**: AI-specific metrics နှင့် Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Beginner မှ advanced AI deployment patterns အထိ logical progression

- **အကြောင်းအရာတင်ဆက်မှု**: အလှဆင်အရာများကို ဖယ်ရှားပြီး ရှင်းလင်းသော၊ ပရော်ဖက်ရှင်နယ်ပုံစံဖြင့် ဖော်ပြထားသည်။
- **လင့်ခ်ဖွဲ့စည်းမှု**: အတွင်းပိုင်းလင့်ခ်များအားလုံးကို navigation system အသစ်နှင့်အညီ ပြင်ဆင်ထားသည်။

#### တိုးတက်မှုများ
- **လက်လှမ်းမီမှု**: Screen reader compatibility အတွက် emoji အားမလိုအပ်အောင် ဖယ်ရှားထားသည်။
- **ပရော်ဖက်ရှင်နယ်ပုံစံ**: စီးပွားရေးသင်ကြားမှုအတွက် သင့်လျော်သော သန့်ရှင်းပြီး ပညာရေးပုံစံ။
- **သင်ယူမှုအတွေ့အကြုံ**: သင်ခန်းစာတစ်ခုစီအတွက် ရှင်းလင်းသောရည်ရွယ်ချက်များနှင့်ရလဒ်များဖြင့် ဖွဲ့စည်းထားသည်။
- **အကြောင်းအရာစီစဉ်မှု**: ဆက်စပ်သောအကြောင်းအရာများအကြား ပိုမိုသိသာသော အဆင့်လိုက်စဉ်လျှောက်မှု။

### [v1.0.0] - 2025-09-09

#### စတင်ထုတ်ဝေမှု - AZD သင်ယူမှုအရင်းအမြစ်များကို စုံလင်စွာဖော်ပြထားသည်။

#### ထည့်သွင်းထားသည်
- **အဓိကစာရွက်စည်းမျဉ်း**
  - စတင်အသုံးပြုမှုလမ်းညွှန်စီးရီးကို ပြည့်စုံစွာဖော်ပြထားသည်။
  - Deployment နှင့် Provisioning အကြောင်းအရာများကို စုံလင်စွာဖော်ပြထားသည်။
  - Troubleshooting အရင်းအမြစ်များနှင့် Debugging လမ်းညွှန်များကို အသေးစိတ်ဖော်ပြထားသည်။
  - Pre-deployment validation tools နှင့် လုပ်ထုံးလုပ်နည်းများကို ဖော်ပြထားသည်။

- **စတင်အသုံးပြုမှု Module**
  - AZD အခြေခံများ: အဓိကအယူအဆများနှင့် အသုံးအနှုန်းများ
  - Installation Guide: Platform-specific setup လမ်းညွှန်များ
  - Configuration Guide: Environment setup နှင့် authentication
  - First Project Tutorial: လက်တွေ့လုပ်ဆောင်မှုအဆင့်လိုက်လမ်းညွှန်

- **Deployment နှင့် Provisioning Module**
  - Deployment Guide: Workflow documentation အပြည့်အစုံ
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Production deployments အတွက် အကောင်းဆုံးအလေ့အကျင့်များ
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Service tier လမ်းညွှန်အပြည့်အစုံ
  - Pre-flight Checks: Automated validation scripts (PowerShell နှင့် Bash)
  - ကုန်ကျစရိတ်ခန့်မှန်းခြင်းနှင့် ဘတ်ဂျက်စီမံခန့်ခွဲမှု tools

- **Troubleshooting Module**
  - Common Issues: မကြုံဖူးသောပြဿနာများနှင့် ဖြေရှင်းနည်းများ
  - Debugging Guide: Troubleshooting လုပ်ထုံးလုပ်နည်းများ
  - အဆင့်မြင့် diagnostic နည်းလမ်းများနှင့် tools
  - Performance monitoring နှင့် optimization

- **အရင်းအမြစ်များနှင့် ရည်ညွှန်းချက်များ**
  - Command Cheat Sheet: အရေးကြီးသော command များအတွက် အမြန်ရည်ညွှန်း
  - Glossary: အဓိကအသုံးအနှုန်းများနှင့် အတိုကောက်အဓိပ္ပါယ်များ
  - FAQ: မကြုံဖူးသောမေးခွန်းများအတွက် အသေးစိတ်အဖြေများ
  - အပြင်အရင်းအမြစ်လင့်ခ်များနှင့် community ဆက်သွယ်မှုများ

- **ဥပမာများနှင့် Template များ**
  - Simple Web Application ဥပမာ
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture ဥပမာများ
  - Serverless function implementations

#### အင်္ဂါရပ်များ
- **Multi-Platform Support**: Windows, macOS, နှင့် Linux အတွက် Installation နှင့် configuration လမ်းညွှန်များ
- **Multiple Skill Levels**: ကျောင်းသားများမှ ပရော်ဖက်ရှင်နယ် developer များအထိ
- **Practical Focus**: လက်တွေ့ဥပမာများနှင့် အမှန်တကယ်အခြေအနေများ
- **Comprehensive Coverage**: အခြေခံအယူအဆများမှ စီးပွားရေးပုံစံများအထိ
- **Security-First Approach**: လုံခြုံရေးအကောင်းဆုံးအလေ့အကျင့်များကို ပေါင်းစပ်ထားသည်။
- **Cost Optimization**: ကုန်ကျစရိတ်သက်သာစေရန် deployment နှင့် resource စီမံခန့်ခွဲမှုလမ်းညွှန်များ

#### Documentation အရည်အသွေး
- **အသေးစိတ် Code ဥပမာများ**: လက်တွေ့၊ စမ်းသပ်ပြီး code ဥပမာများ
- **အဆင့်လိုက်လမ်းညွှန်များ**: ရှင်းလင်းပြီး လုပ်ဆောင်နိုင်သော လမ်းညွှန်များ
- **Error Handling အပြည့်အစုံ**: မကြုံဖူးသောပြဿနာများအတွက် troubleshooting
- **အကောင်းဆုံးအလေ့အကျင့်ပေါင်းစပ်မှု**: စက်မှုလုပ်ငန်းစံနှင့် အကြံပြုချက်များ
- **Version Compatibility**: Azure service များနှင့် azd အင်္ဂါရပ်များ၏ နောက်ဆုံးပေါ်အခြေအနေနှင့်အညီ

## အနာဂတ်တိုးတက်မှုများ

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, နှင့် custom models အတွက် integration patterns
- **AI Agent Frameworks**: LangChain, Semantic Kernel, နှင့် AutoGen deployment templates
- **Advanced RAG Patterns**: Azure AI Search (Pinecone, Weaviate, စသည်တို့) အပြင် Vector database ရွေးချယ်မှုများ
- **AI Observability**: Model performance, token usage, နှင့် response quality အတွက် monitoring တိုးတက်မှု

#### Developer Experience
- **VS Code Extension**: AZD + AI Foundry development အတွေ့အကြုံ
- **GitHub Copilot Integration**: AI-assisted AZD template ဖန်တီးမှု
- **Interactive Tutorials**: AI အခြေအနေများအတွက် automated validation ဖြင့် coding လက်တွေ့လေ့ကျင့်မှု
- **Video Content**: AI deployment အပေါ်အခြေခံ visual learners အတွက် supplementary video tutorials

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, နှင့် audit trails
- **Multi-Tenant AI**: Isolated AI services ဖြင့် customer များစီစဉ်မှု patterns
- **Edge AI Deployment**: Azure IoT Edge နှင့် container instances integration
- **Hybrid Cloud AI**: Multi-cloud နှင့် hybrid deployment patterns

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning pipelines နှင့် MLOps integration
- **Advanced Security**: Zero-trust patterns, private endpoints, နှင့် advanced threat protection
- **Performance Optimization**: High-throughput AI applications အတွက် tuning နှင့် scaling strategies
- **Global Distribution**: AI applications အတွက် content delivery နှင့် edge caching patterns

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Azure AI Foundry integration (ပြီးစီး)
- ✅ **Interactive Tutorials**: AI workshop lab (ပြီးစီး)
- ✅ **Advanced Security Module**: AI-specific security patterns (ပြီးစီး)
- ✅ **Performance Optimization**: AI workload tuning strategies (ပြီးစီး)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (ပြီးစီး)
- ✅ **Extended FAQ**: AI-specific questions နှင့် troubleshooting (ပြီးစီး)
- **Tool Integration**: IDE နှင့် editor integration လမ်းညွှန်များတိုးတက်မှု
- ✅ **Monitoring Expansion**: AI-specific monitoring နှင့် alerting patterns (ပြီးစီး)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Mobile learning အတွက် responsive design
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: AZD + AI workflows အတွက် VS Code extension
- **Community Dashboard**: Real-time community metrics နှင့် contribution tracking

## Changelog အတွက် အထောက်အကူပြုမှု

### Changes Report လုပ်နည်း
ဤ repository သို့ အထောက်အကူပြုသောအခါ changelog entries တွင် ပါဝင်ရမည့်အရာများမှာ -

1. **Version Number**: Semantic versioning (major.minor.patch) အတိုင်း
2. **Date**: YYYY-MM-DD format ဖြင့် ထုတ်ဝေမှုရက်စွဲ
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **ရှင်းလင်းသောဖော်ပြချက်**: ပြောင်းလဲမှုအကြောင်းအရာကို တိုတောင်းရှင်းလင်းစွာဖော်ပြရန်
5. **Impact Assessment**: ပြောင်းလဲမှုများသည် ရှိပြီးသားအသုံးပြုသူများကို ဘယ်လိုသက်ရောက်မည်ကို ဖော်ပြရန်

### Change Categories

#### Added
- အသစ်ထည့်သွင်းထားသော အင်္ဂါရပ်များ၊ documentation အပိုင်းများ၊ သို့မဟုတ် စွမ်းဆောင်ရည်များ
- အသစ်ထည့်သွင်းထားသော ဥပမာများ၊ template များ၊ သို့မဟုတ် သင်ယူမှုအရင်းအမြစ်များ
- အသစ်ထည့်သွင်းထားသော tools, scripts, သို့မဟုတ် utilities

#### Changed
- ရှိပြီးသား functionality သို့မဟုတ် documentation ကို ပြင်ဆင်ထားသည်။
- ရှင်းလင်းမှု သို့မဟုတ် တိကျမှု တိုးတက်စေရန် ပြင်ဆင်မှုများ
- အကြောင်းအရာ သို့မဟုတ် စီမံခန့်ခွဲမှု ပြောင်းလဲမှုများ

#### Deprecated
- ဖယ်ရှားရန်စီစဉ်ထားသော အင်္ဂါရပ်များ သို့မဟုတ် နည်းလမ်းများ
- ဖယ်ရှားရန်စီစဉ်ထားသော documentation အပိုင်းများ
- ပိုမိုကောင်းမွန်သော နည်းလမ်းများရှိသော နည်းလမ်းများ

#### Removed
- မရှိတော့သော အင်္ဂါရပ်များ၊ documentation, သို့မဟုတ် ဥပမာများ
- ရှေးဟောင်းသော သတင်းအချက်အလက် သို့မဟုတ် ဖယ်ရှားထားသော နည်းလမ်းများ
- ထပ်တူထပ်မျှ သို့မဟုတ် ပေါင်းစပ်ထားသော အကြောင်းအရာ

#### Fixed
- Documentation သို့မဟုတ် code အမှားများကို ပြင်ဆင်ထားသည်။
- Report ပြုလုပ်ထားသော ပြဿနာများ သို့မဟုတ် ပြဿနာများကို ဖြေရှင်းထားသည်။
- တိကျမှု သို့မဟုတ် စွမ်းဆောင်ရည် တိုးတက်စေရန် ပြင်ဆင်မှုများ

#### Security
- လုံခြုံရေးနှင့်ဆိုင်သော တိုးတက်မှုများ သို့မဟုတ် ပြင်ဆင်မှုများ
- လုံခြုံရေးအကောင်းဆုံးအလေ့အကျင့်များကို update ပြုလုပ်ထားသည်။
- လုံခြုံရေးအခက်အခဲများကို ဖြေရှင်းထားသည်။

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- အသုံးပြုသူများ၏ လုပ်ဆောင်မှုလိုအပ်သော ပြောင်းလဲမှုများ
- အကြောင်းအရာ သို့မဟုတ် စီမံခန့်ခွဲမှုကို အရေးကြီးပြောင်းလဲမှုများ
- အခြေခံနည်းလမ်း သို့မဟုတ် methodology ကို ပြောင်းလဲမှုများ

#### Minor Version (X.Y.0)
- အသစ်ထည့်သွင်းထားသော အင်္ဂါရပ်များ သို့မဟုတ် အကြောင်းအရာများ
- Backward compatibility ကို ထိန်းသိမ်းထားသော တိုးတက်မှုများ
- အသစ်ထည့်သွင်းထားသော ဥပမာများ၊ tools, သို့မဟုတ် အရင်းအမြစ်များ

#### Patch Version (X.Y.Z)
- Bug fix နှင့် အမှားပြင်ဆင်မှုများ
- ရှိပြီးသားအကြောင်းအရာများကို အနည်းငယ်တိုးတက်စေရန်
- ရှင်းလင်းမှုနှင့် သေးငယ်သော တိုးတက်မှုများ

## Community Feedback နှင့် အကြံပြုချက်များ

ဤသင်ယူမှုအရင်းအမြစ်ကို တိုးတက်စေရန် community feedback ကို အလွန်အားပေးပါသည်။

### Feedback ပေးနည်း
- **GitHub Issues**: ပြဿနာများကို report ပြုလုပ်ရန် သို့မဟုတ် တိုးတက်မှုများကို အကြံပြုရန် (AI-specific issues အားလုံးကို ကြိုဆိုပါသည်)
- **Discord Discussions**: အကြံပြုချက်များကို မျှဝေပြီး Azure AI Foundry community နှင့် ဆွေးနွေးရန်
- **Pull Requests**: AI templates နှင့် လမ်းညွှန်များအတွက် content တိုးတက်မှုများကို တိုက်ရိုက်အထောက်အကူပြုရန်
- **Azure AI Foundry Discord**: AZD + AI ဆွေးနွေးမှုများအတွက် #Azure channel တွင် ပါဝင်ရန်
- **Community Forums**: Azure developer ဆွေးနွေးမှုများတွင် ပါဝင်ရန်

### Feedback Categories
- **AI Content Accuracy**: AI service integration နှင့် deployment အချက်အလက်များကို ပြင်ဆင်ရန်
- **Learning Experience**: AI developer သင်ယူမှုစဉ်လျှောက်မှုကို တိုးတက်စေရန် အကြံပြုချက်များ
- **Missing AI Content**: AI templates, patterns, သို့မဟုတ် ဥပမာများကို ထည့်သွင်းရန် တောင်းဆိုချက်များ
- **Accessibility**: အမျိုးမျိုးသော သင်ယူမှုလိုအပ်ချက်များအတွက် တိုးတက်မှုများ
- **AI Tool Integration**: AI development workflow integration ကို ပိုမိုကောင်းမွန်စေရန် အကြံပြုချက်များ
- **Production AI Patterns**: စီးပွားရေး AI deployment pattern တောင်းဆိုချက်များ

### Response Commitment
- **Issue Response**: Report ပြုလုပ်ထားသော ပြဿနာများအတွက် 48 နာရီအတွင်း
- **Feature Requests**: တောင်းဆိုချက်များကို တစ်ပတ်အတွင်း အကဲဖြတ်မှု
- **Community Contributions**: Content တိုးတက်မှုများကို တစ်ပတ်အတွင်း ပြန်လည်သုံးသပ်မှု
- **Security Issues**: အရေးပေါ်အဆင့်ဖြင့် အမြန်တုံ့ပြန်မှု

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content တိကျမှုနှင့် link validation
- **Quarterly Updates**: အကြီးမားသော content ထည့်သွင်းမှုများနှင့် တိုးတက်မှုများ
- **Semi-Annual Reviews**: Comprehensive restructuring နှင့် တိုးတက်မှု
- **Annual Releases**: အရေးကြီးသော version updates များနှင့် တိုးတက်မှုများ

### Monitoring နှင့် Quality Assurance
- **Automated Testing**: Code ဥပမာများနှင့် link များကို အကြိမ်ကြိမ်စမ်းသပ်မှု
- **Community Feedback Integration**: User အကြံပြုချက်များကို အကြိမ်ကြိမ်ထည့်သွင်းမှု
- **Technology Updates**: Azure service များနှင့် azd releases များ၏ နောက်ဆုံးပေါ်အခြေအနေနှင့်အညီ
- **Accessibility Audits**: Inclusive design principles အတွက် အကြိမ်ကြိမ်ပြန်လည်သုံးသပ်မှု

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Regular updates ဖြင့် အပြည့်အဝထောက်ခံမှု
- **Previous Major Version**: 12 လအတွင်း Security updates နှင့် အရေးကြီးသော ပြင်ဆင်မှုများ
- **Legacy Versions**: Community support သာလျှင် ရရှိနိုင်ပြီး တရားဝင် updates မရှိပါ။

### Migration Guidance
Major versions ထုတ်ဝေသောအခါ၊ ကျွန်ုပ်တို့သည် -
- **Migration Guides**: အဆင့်လိုက်ပြောင်းလဲမှုလမ်းညွှန်များ
- **Compatibility Notes**: Breaking changes အကြောင်းအသေးစိတ်
- **Tool Support**: Scripts သို့မဟုတ် utilities များကို ပြောင်းလဲမှုအတွက် အထောက်အကူပြုရန်
- **Community Support**: Migration မေးခွန်းများအတွက် အထူး forums

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: ဤ repository ကို Watch လုပ်ပြီး သင်ယူမှုအရ

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
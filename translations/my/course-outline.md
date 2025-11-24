<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-23T22:29:17+00:00",
  "source_file": "course-outline.md",
  "language_code": "my"
}
-->
# AZD သင်ခန်းစာများအတွက် အခြေခံသင်တန်း: သင်ခန်းစာအကြောင်းအရာနှင့် သင်ယူမှုဖွံ့ဖြိုးရေး

## သင်ခန်းစာအကျဉ်းချုပ်

Azure Developer CLI (azd) ကို အဆင့်လိုက်သင်ယူမှုအတွက် စီစဉ်ထားသော အခန်းများမှတဆင့် ကျွမ်းကျင်မှုရရှိပါမည်။ **Microsoft Foundry ပေါင်းစည်းမှုဖြင့် AI အက်ပလီကေးရှင်းများကို တင်သွင်းခြင်းအပေါ် အထူးအာရုံစိုက်ထားသည်။**

### အခေတ်မီ Developer များအတွက် သင်ခန်းစာသည် အရေးကြီးသောအကြောင်းရင်း

Microsoft Foundry Discord အသိုင်းအဝိုင်းမှ အချက်အလက်များအပေါ် အခြေခံ၍ **Developer များ၏ ၄၅% သည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြသည်** သို့သော် အောက်ပါအခက်အခဲများကြုံတွေ့ရသည်။
- AI ဝန်ဆောင်မှုများစွာပါဝင်သော architecture များ၏ ရှုပ်ထွေးမှု
- Production AI တင်သွင်းမှုအတွက် အကောင်းဆုံးအလေ့အကျင့်များ  
- Azure AI ဝန်ဆောင်မှုများကို ပေါင်းစည်းခြင်းနှင့် ဖွဲ့စည်းခြင်း
- AI workload များအတွက် ကုန်ကျစရိတ်ကို အကောင်းဆုံးဖြစ်စေရန်
- AI-specific တင်သွင်းမှုအခက်အခဲများကို ဖြေရှင်းခြင်း

### အဓိက သင်ယူရမည့်ရည်ရွယ်ချက်များ

ဒီစီစဉ်ထားသော သင်ခန်းစာကို ပြီးမြောက်ပါက၊ သင်သည်:
- **AZD အခြေခံများကို ကျွမ်းကျင်မှုရရှိမည်**: အဓိကအကြောင်းအရာများ၊ ထည့်သွင်းခြင်းနှင့် ဖွဲ့စည်းခြင်း
- **AI အက်ပလီကေးရှင်းများကို တင်သွင်းခြင်း**: AZD ကို Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အသုံးပြုခြင်း
- **Infrastructure as Code ကို အကောင်အထည်ဖော်ခြင်း**: Azure resources များကို Bicep templates ဖြင့် စီမံခန့်ခွဲခြင်း
- **တင်သွင်းမှုများကို Troubleshoot လုပ်ခြင်း**: အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် ပြဿနာများကို Debug လုပ်ခြင်း
- **Production အတွက် အကောင်းဆုံးဖြစ်စေရန်**: လုံခြုံရေး၊ အတိုင်းအတာချဲ့ထွင်ခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု
- **Multi-Agent Solutions တည်ဆောက်ခြင်း**: ရှုပ်ထွေးသော AI architecture များကို တင်သွင်းခြင်း

## 🎓 Workshop သင်ယူမှုအတွေ့အကြုံ

### သင်ယူမှုပေးပို့မှုအတွက် အလွယ်တကူရွေးချယ်နိုင်သောရွေးချယ်မှုများ
ဒီသင်ခန်းစာကို **ကိုယ်တိုင်အချိန်လိုက်သင်ယူမှု** နှင့် **Workshop session များ** နှစ်မျိုးစလုံးအတွက် ထောက်ပံ့ထားပြီး၊ AZD ကို လက်တွေ့ကျကျ အသုံးပြုရင်း ကျွမ်းကျင်မှုရရှိစေရန် interactive exercises များဖြင့် သင်ယူမှုကို ဖွံ့ဖြိုးစေသည်။

#### 🚀 ကိုယ်တိုင်အချိန်လိုက်သင်ယူမှု
**Individual Developer များနှင့် ဆက်လက်သင်ယူမှုအတွက် အကောင်းဆုံး**

**အင်္ဂါရပ်များ:**
- **Browser-Based Interface**: MkDocs-powered workshop ကို ဘရောက်ဇာမည်သည့်အမျိုးအစားမှမဆို အသုံးပြုနိုင်သည်
- **GitHub Codespaces Integration**: တစ်ချက်နှိပ်ရုံဖြင့် Development Environment ကို စတင်နိုင်သည်
- **Interactive DevContainer Environment**: Local setup မလိုအပ်ဘဲ ချက်ချင်း Coding စတင်နိုင်သည်
- **Progress Tracking**: Built-in checkpoints နှင့် validation exercises
- **Community Support**: Azure Discord channel များမှ မေးခွန်းများနှင့် ပူးပေါင်းဆောင်ရွက်မှု

**သင်ယူမှုဖွဲ့စည်းမှု:**
- **Flexible Timing**: အခန်းများကို ကိုယ်တိုင်အချိန်လိုက် သင်ယူနိုင်သည်
- **Checkpoint System**: ရှုပ်ထွေးသောအကြောင်းအရာများသို့ ရောက်ရှိမီ သင်ယူမှုကို အတည်ပြုခြင်း
- **Resource Library**: အကျဉ်းချုပ် documentation, ဥပမာများနှင့် troubleshooting guide များ
- **Portfolio Development**: Professional portfolio များအတွက် deploy လုပ်နိုင်သော project များတည်ဆောက်ခြင်း

**စတင်ခြင်း (ကိုယ်တိုင်အချိန်လိုက်):**
```bash
# အရွေးချယ်မှု ၁: GitHub Codespaces (အကြံပြုထားသည်)
# Repository သို့သွားပြီး "Code" → "Create codespace on main" ကိုနှိပ်ပါ

# အရွေးချယ်မှု ၂: ဒေသတွင်းဖွံ့ဖြိုးမှု
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md တွင်ရှိသော setup အညွှန်းများကိုလိုက်နာပါ
```

#### 🏛️ Facilitated Workshop Sessions
**Corporate Training, Bootcamp များနှင့် ပညာရေးအဖွဲ့အစည်းများအတွက် အကောင်းဆုံး**

**Workshop Format ရွေးချယ်မှုများ:**

**📚 Academic Course Integration (8-12 weeks)**
- **University Programs**: တစ်ဆယ်မာတာအတွင်း အပတ်စဉ် ၂ နာရီ session များ
- **Bootcamp Format**: ၃-၅ ရက်အတွင်း တစ်နေ့ ၆-၈ နာရီ session များ
- **Corporate Training**: လစဉ် Team session များနှင့် လက်တွေ့ project တည်ဆောက်ခြင်း
- **Assessment Framework**: Graded assignments, peer reviews, နှင့် final projects

**🚀 Intensive Workshop (1-3 days)**
- **Day 1**: Foundation + AI Development (Chapters 1-2) - 6 နာရီ
- **Day 2**: Configuration + Infrastructure (Chapters 3-4) - 6 နာရီ  
- **Day 3**: Advanced Patterns + Production (Chapters 5-8) - 8 နာရီ
- **Follow-up**: Optional 2-week mentorship for project completion

**⚡ Executive Briefing (4-6 hours)**
- **Strategic Overview**: AZD value proposition နှင့် business impact (1 နာရီ)
- **Hands-On Demo**: AI application ကို အဆုံးအထိ တင်သွင်းခြင်း (2 နာရီ)
- **Architecture Review**: Enterprise patterns နှင့် governance (1 နာရီ)
- **Implementation Planning**: အဖွဲ့အစည်းအတွင်း အသုံးပြုမှုစီမံချက် (1-2 နာရီ)

#### 🛠️ Workshop သင်ယူမှုနည်းလမ်း
**Discovery → Deployment → Customization နည်းလမ်းဖြင့် လက်တွေ့ကျကျ ကျွမ်းကျင်မှုရရှိစေရန်**

**Phase 1: Discovery (45 မိနစ်)**
- **Template Exploration**: Azure AI Foundry template များနှင့် ဝန်ဆောင်မှုများကို စိစစ်ခြင်း
- **Architecture Analysis**: Multi-agent patterns နှင့် deployment strategy များကို နားလည်ခြင်း
- **Requirement Assessment**: အဖွဲ့အစည်းလိုအပ်ချက်များနှင့် အကန့်အသတ်များကို သတ်မှတ်ခြင်း
- **Environment Setup**: Development environment နှင့် Azure resources များကို configure လုပ်ခြင်း

**Phase 2: Deployment (2 နာရီ)**
- **Guided Implementation**: AZD ဖြင့် AI application များကို တင်သွင်းခြင်း
- **Service Configuration**: Azure AI service များ၊ endpoint များနှင့် authentication ကို configure လုပ်ခြင်း
- **Security Implementation**: Enterprise security patterns နှင့် access control များကို အသုံးပြုခြင်း
- **Validation Testing**: တင်သွင်းမှုများကို အတည်ပြုခြင်းနှင့် အခက်အခဲများကို troubleshoot လုပ်ခြင်း

**Phase 3: Customization (45 မိနစ်)**
- **Application Modification**: Template များကို သတ်မှတ်လိုအပ်ချက်များနှင့် ကိုက်ညီစေရန် ပြင်ဆင်ခြင်း
- **Production Optimization**: Monitoring, cost management, နှင့် scaling strategy များကို အကောင်အထည်ဖော်ခြင်း
- **Advanced Patterns**: Multi-agent coordination နှင့် ရှုပ်ထွေးသော architecture များကို စူးစမ်းခြင်း
- **Next Steps Planning**: ဆက်လက်သင်ယူမှုအတွက် လမ်းကြောင်းသတ်မှတ်ခြင်း

#### 🎯 Workshop သင်ယူမှုရလဒ်များ
**လက်တွေ့ကျကျ လေ့ကျင့်မှုမှတဆင့် ဖွံ့ဖြိုးမှုရရှိသော ကျွမ်းကျင်မှုများ**

**Technical Competencies:**
- **Deploy Production AI Applications**: AI-powered solution များကို အောင်မြင်စွာ တင်သွင်းခြင်းနှင့် configure လုပ်ခြင်း
- **Infrastructure as Code Mastery**: Bicep template များကို တည်ဆောက်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- **Multi-Agent Architecture**: AI agent များကို ပေါင်းစည်းထားသော solution များကို တည်ဆောက်ခြင်း
- **Production Readiness**: Security, monitoring, နှင့် governance patterns များကို အသုံးပြုခြင်း
- **Troubleshooting Expertise**: တင်သွင်းမှုနှင့် configuration ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းခြင်း

**Professional Skills:**
- **Project Leadership**: Cloud deployment စီမံချက်များတွင် Technical Team များကို ဦးဆောင်ခြင်း
- **Architecture Design**: Scalable, cost-effective Azure solution များကို ဒီဇိုင်းဆွဲခြင်း
- **Knowledge Transfer**: AZD အကောင်းဆုံးအလေ့အကျင့်များကို အလုပ်ဖော်များကို သင်ကြားခြင်း
- **Strategic Planning**: Cloud adoption strategy များကို အဖွဲ့အစည်းအတွင်း သက်ရောက်မှုရှိစေရန်

#### 📋 Workshop Resources နှင့် Materials
**Facilitator များနှင့် သင်ယူသူများအတွက် အပြည့်အစုံ toolkit**

**Facilitator များအတွက်:**
- **Instructor Guide**: [Workshop Facilitation Guide](workshop/docs/instructor-guide.md) - Session planning နှင့် delivery tips
- **Presentation Materials**: Slide deck များ၊ architecture diagram များနှင့် demo script များ
- **Assessment Tools**: လက်တွေ့ကျကျ exercises, knowledge check များနှင့် အကဲဖြတ်မှု rubrics
- **Technical Setup**: Environment configuration, troubleshooting guide များနှင့် backup plan များ

**သင်ယူသူများအတွက်:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based learning platform
- **Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Implementation walkthrough များ
- **Reference Documentation**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-focused deep dive များ
- **Community Resources**: Azure Discord channel များ၊ GitHub discussion များနှင့် အထောက်အပံ့

#### 🏢 Enterprise Workshop Implementation
**အဖွဲ့အစည်းအတွင်း တင်သွင်းမှုနှင့် သင်တန်းပေးမှု strategy များ**

**Corporate Training Programs:**
- **Developer Onboarding**: AZD အခြေခံများနှင့် New hire orientation (2-4 weeks)
- **Team Upskilling**: လစဉ် workshop များ (1-2 days)
- **Architecture Review**: Senior engineers နှင့် architects များအတွက် လစဉ် session များ (4 hours)
- **Leadership Briefings**: Technical decision maker များအတွက် Executive workshop များ (half-day)

**Implementation Support:**
- **Custom Workshop Design**: အဖွဲ့အစည်းလိုအပ်ချက်များအတွက် အထူး content
- **Pilot Program Management**: Structured rollout နှင့် success metrics
- **Ongoing Mentorship**: Project implementation အတွက် workshop အပြီး support
- **Community Building**: Internal Azure AI developer community များနှင့် knowledge sharing

**Success Metrics:**
- **Skill Acquisition**: Pre/post assessment များမှ Technical competency ဖွံ့ဖြိုးမှု
- **Deployment Success**: Production application များကို အောင်မြင်စွာ deploy လုပ်ခြင်း
- **Time to Productivity**: Azure AI project များအတွက် onboarding အချိန်လျှော့ချခြင်း
- **Knowledge Retention**: Workshop အပြီး 3-6 လအတွင်း Follow-up assessment

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (30-45 မိနစ်) 🌱
**လိုအပ်ချက်များ**: Azure subscription, basic command line knowledge  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐

#### သင်ယူရမည့်အရာများ
- Azure Developer CLI အခြေခံများကို နားလည်ခြင်း
- AZD ကို သင့် platform တွင် ထည့်သွင်းခြင်း  
- သင့်ရဲ့ ပထမဆုံးအောင်မြင်သော deployment
- အဓိကအကြောင်းအရာများနှင့် အဘိဓာန်

#### သင်ယူမှုအရင်းအမြစ်များ
- [AZD Basics](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများ
- [Installation & Setup](docs/getting-started/installation.md) - Platform-specific guide များ
- [Your First Project](docs/getting-started/first-project.md) - လက်တွေ့ကျကျ tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Quick reference

#### လက်တွေ့ရလဒ်
AZD ကို အသုံးပြု၍ Azure တွင် ရိုးရှင်းသော web application တစ်ခုကို အောင်မြင်စွာ deploy လုပ်ပါ

---

### Chapter 2: AI-First Development (1-2 နာရီ) 🤖
**လိုအပ်ချက်များ**: Chapter 1 ပြီးမြောက်ထားရမည်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်ယူရမည့်အရာများ
- Microsoft Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း
- AI-powered application များကို deploy လုပ်ခြင်း
- AI service configuration များကို နားလည်ခြင်း
- RAG (Retrieval-Augmented Generation) patterns

#### သင်ယူမှုအရင်းအမြစ်များ
- [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **NEW**: 2-3 နာရီ လက်တွေ့ကျကျ lab
- [Interactive Workshop Guide](workshop/README.md) - **NEW**: Browser-based workshop MkDocs preview
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NEW**: လမ်းညွှန်ချက်များ

#### လက်တွေ့ရလဒ်
RAG စွမ်းရည်များပါဝင်သော AI-powered chat application ကို deploy လုပ်ပြီး configure လုပ်ပါ

#### Workshop Learning Path (Optional Enhancement)
**NEW Interactive Experience**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 မိနစ်): Template ရွေးချယ်ခြင်းနှင့် စိစစ်ခြင်း
2. **Deployment** (45 မိနစ်): AI template functionality ကို deploy လုပ်ပြီး validate လုပ်ပါ  
3. **Deconstruction** (30 မိနစ်): Template architecture နှင့် components ကို နားလည်ပါ
4. **Configuration** (30 မိနစ်): Setting နှင့် parameters များကို customize လုပ်ပါ
5. **Customization** (45 မိနစ်): ပြင်ဆင်ပြီး ကိုယ်ပိုင်အဖြစ်ပြောင်းပါ
6. **Teardown** (15 မိနစ်): Resource များကို clean up လုပ်ပြီး lifecycle ကို နားလည်ပါ
7. **Wrap-up** (15 မိနစ်): နောက်တစ်ဆင့်များနှင့် အဆင့်မြှင့်သင်ယူမှုလမ်းကြောင်း

---

### Chapter 3: Configuration & Authentication (45-60 မိနစ်) ⚙️
**လိုအပ်ချက်များ**: Chapter 1 ပြီးမြောက်ထားရမည်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်ယူရမည့်အရာများ
- Environment configuration နှင့် စီမံခန့်ခွဲမှု
- Authentication နှင့် security အကောင်းဆုံးအလေ့အကျင့်များ
- Resource naming နှင့် organization
- Multi-environment deployment များ

#### သင်ယူမှုအရင်းအမြစ်များ
- [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- [Authentication & Security Patterns](docs/getting-started/authsecurity.md) - Managed identity နှင့် Key Vault integration
- Multi-environment ဥပမာများ

#### လက်တွေ့ရလဒ်
Authentication နှင့် security ကို သင့်တော်စွာ အသုံးပြု၍ environment များစီမံခန့်ခွဲပါ

---

### Chapter 4: Infrastructure as Code & Deployment (1-1.5 နာရီ) 🏗️
**လိုအပ်ချက်များ**: Chapter 1-3
အကောင့်များနှင့် အကောင်းဆုံးဖြေရှင်းနည်းများကို အကောင့်များနှင့် အကောင်းဆုံးဖြေရှင်းနည်းများကို အကောင့်များနှင့် အကောင်းဆုံးဖြေရှင်းနည်းများကို အကောင့်များနှင့် အကောင်းဆုံးဖြေရှင်းနည်းများကို အကောင့်များနှင့် အကောင်းဆုံးဖြေရှင်းနည်းများကို

---

### အခန်း ၇: ပြဿနာရှာဖွေခြင်းနှင့် Debugging (၁-၁.၅ နာရီ) 🔧
**လိုအပ်ချက်များ**: Deployment အခန်းတစ်ခုခုပြီးစီးထားရမည်  
**အဆင့်အတန်း**: ⭐⭐

#### သင်လေ့လာနိုင်မည့်အရာများ
- စနစ်တကျ Debugging လုပ်နည်းများ
- အများဆုံးဖြစ်တတ်သောပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI အထူးပြဿနာရှာဖွေခြင်း
- စွမ်းဆောင်ရည်တိုးတက်အောင်လုပ်ခြင်း

#### သင်ယူရန်အရင်းအမြစ်များ
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ နှင့် ဖြေရှင်းနည်းများ
- [Debugging Guide](docs/troubleshooting/debugging.md) - အဆင့်ဆင့်နည်းလမ်းများ
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှုဆိုင်ရာပြဿနာများ

#### လက်တွေ့ရလဒ်
Deployment ပြဿနာများကို ကိုယ်တိုင်ရှာဖွေပြီး ဖြေရှင်းနိုင်ခြင်း

---

### အခန်း ၈: Production နှင့် Enterprise Patterns (၂-၃ နာရီ) 🏢
**လိုအပ်ချက်များ**: အခန်း ၁-၄ ပြီးစီးထားရမည်  
**အဆင့်အတန်း**: ⭐⭐⭐⭐

#### သင်လေ့လာနိုင်မည့်အရာများ
- Production deployment နည်းလမ်းများ
- Enterprise security patterns
- Monitoring နှင့် ကုန်ကျစရိတ်အဆင့်မြှင့်ခြင်း
- Scalability နှင့် governance

- Production container app deployment အတွက် အကောင်းဆုံးနည်းလမ်းများ (လုံခြုံရေး၊ monitoring၊ ကုန်ကျစရိတ်၊ CI/CD)

#### သင်ယူရန်အရင်းအမြစ်များ
- [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Enterprise patterns
- Microservices နှင့် enterprise ဥပမာများ
- Monitoring နှင့် governance frameworks
- [Microservices Architecture Example](../../examples/container-app/microservices) - Blue-green/canary deployment, distributed tracing, နှင့် ကုန်ကျစရိတ်အဆင့်မြှင့်ခြင်း

#### လက်တွေ့ရလဒ်
Enterprise-ready application များကို production အဆင့်တွင် deploy လုပ်နိုင်ခြင်း

---

## သင်ယူမှုတိုးတက်မှုနှင့် အဆင့်အတန်း

### တိုးတက်မှုအဆင့်လိုက် ကျွမ်းကျင်မှုတိုးတက်ခြင်း

- **🌱 Beginner**: အခန်း ၁ (Foundation) → အခန်း ၂ (AI Development)
- **🔧 Intermediate**: အခန်း ၃-၄ (Configuration & Infrastructure) → အခန်း ၆ (Validation)
- **🚀 Advanced**: အခန်း ၅ (Multi-Agent Solutions) → အခန်း ၇ (Troubleshooting)
- **🏢 Enterprise**: အခန်းအားလုံးပြီးစီးပြီး အခန်း ၈ (Production Patterns) အာရုံစိုက်ပါ

- **Container App Path**: အခန်း ၄ (Containerized deployment), ၅ (Microservices integration), ၈ (Production best practices)

### အဆင့်အတန်းပြသမှု

- **⭐ Basic**: အကြောင်းအရာတစ်ခုတည်း၊ လမ်းညွှန်သင်ခန်းစာများ၊ ၃၀-၆၀ မိနစ်
- **⭐⭐ Intermediate**: အကြောင်းအရာများစွာ၊ လက်တွေ့ကျကျ လေ့ကျင့်မှု၊ ၁-၂ နာရီ  
- **⭐⭐⭐ Advanced**: Architecture အဆင့်မြင့်၊ အထူးပြုဖြေရှင်းနည်းများ၊ ၁-၃ နာရီ
- **⭐⭐⭐⭐ Expert**: Production စနစ်များ၊ Enterprise patterns၊ ၂-၄ နာရီ

### Flexible Learning Paths

#### 🎯 AI Developer Fast Track (၄-၆ နာရီ)
1. **အခန်း ၁**: Foundation & Quick Start (၄၅ မိနစ်)
2. **အခန်း ၂**: AI-First Development (၂ နာရီ)  
3. **အခန်း ၅**: Multi-Agent AI Solutions (၃ နာရီ)
4. **အခန်း ၈**: Production AI Best Practices (၁ နာရီ)

#### 🛠️ Infrastructure Specialist Path (၅-၇ နာရီ)
1. **အခန်း ၁**: Foundation & Quick Start (၄၅ မိနစ်)
2. **အခန်း ၃**: Configuration & Authentication (၁ နာရီ)
3. **အခန်း ၄**: Infrastructure as Code & Deployment (၁.၅ နာရီ)
4. **အခန်း ၆**: Pre-Deployment Validation & Planning (၁ နာရီ)
5. **အခန်း ၇**: Troubleshooting & Debugging (၁.၅ နာရီ)
6. **အခန်း ၈**: Production & Enterprise Patterns (၂ နာရီ)

#### 🎓 Complete Learning Journey (၈-၁၂ နာရီ)
အခန်း ၈ ခုအားလုံးကို လက်တွေ့ကျကျ လေ့ကျင့်မှုနှင့် validation ဖြင့် အဆင့်လိုက်ပြီးစီးခြင်း

## သင်ခန်းစာပြီးစီးမှု Framework

### Knowledge Validation
- **အခန်း Checkpoints**: လက်တွေ့ကျကျ လေ့ကျင့်မှုများနှင့် measurable ရလဒ်များ
- **Hands-On Verification**: အခန်းတစ်ခုစီအတွက် အလုပ်လုပ်သော ဖြေရှင်းနည်းများကို deploy လုပ်ပါ
- **Progress Tracking**: Visual indicators နှင့် completion badges
- **Community Validation**: Azure Discord channel များတွင် အတွေ့အကြုံများကို မျှဝေပါ

### Learning Outcomes Assessment

#### အခန်း ၁-၂ ပြီးစီးမှု (Foundation + AI)
- ✅ AZD ကို အသုံးပြု၍ အခြေခံ web application တစ်ခုကို deploy လုပ်ပါ
- ✅ RAG ဖြင့် AI-powered chat application တစ်ခုကို deploy လုပ်ပါ
- ✅ AZD core concepts နှင့် AI integration ကို နားလည်ပါ

#### အခန်း ၃-၄ ပြီးစီးမှု (Configuration + Infrastructure)  
- ✅ Multi-environment deployments ကို စီမံပါ
- ✅ Custom Bicep infrastructure templates ကို ဖန်တီးပါ
- ✅ Secure authentication patterns ကို အကောင်အထည်ဖော်ပါ

#### အခန်း ၅-၆ ပြီးစီးမှု (Multi-Agent + Validation)
- ✅ Complex multi-agent AI solution ကို deploy လုပ်ပါ
- ✅ Capacity planning နှင့် cost optimization ကို လုပ်ဆောင်ပါ
- ✅ Automated pre-deployment validation ကို အကောင်အထည်ဖော်ပါ

#### အခန်း ၇-၈ ပြီးစီးမှု (Troubleshooting + Production)
- ✅ Deployment ပြဿနာများကို ကိုယ်တိုင် debug လုပ်ပြီး ဖြေရှင်းပါ  
- ✅ Enterprise-grade monitoring နှင့် security ကို အကောင်အထည်ဖော်ပါ
- ✅ Governance ဖြင့် production-ready applications ကို deploy လုပ်ပါ

### Certification and Recognition
- **Course Completion Badge**: အခန်း ၈ ခုအားလုံးကို လက်တွေ့ကျကျ validation ဖြင့် ပြီးစီးပါ
- **Community Recognition**: Microsoft Foundry Discord တွင် တက်ကြွစွာ ပါဝင်ပါ
- **Professional Development**: AZD နှင့် AI deployment ကျွမ်းကျင်မှုများ
- **Career Advancement**: Enterprise-ready cloud deployment ကျွမ်းကျင်မှုများ

## 🎓 Comprehensive Learning Outcomes

### Foundation Level (အခန်း ၁-၂)
Foundation အခန်းများကို ပြီးစီးပြီးနောက်၊ သင်တန်းသားများသည် အောက်ပါအရာများကို ပြသနိုင်ပါမည်-

**Technical Capabilities:**
- AZD commands ကို အသုံးပြု၍ အခြေခံ web applications ကို Azure တွင် deploy လုပ်ပါ
- RAG capabilities ဖြင့် AI-powered chat applications ကို configure နှင့် deploy လုပ်ပါ
- AZD core concepts ကို နားလည်ပါ- templates, environments, provisioning workflows
- Microsoft Foundry services ကို AZD deployments နှင့် ပေါင်းစပ်ပါ
- Azure AI service configurations နှင့် API endpoints ကို navigate လုပ်ပါ

**Professional Skills:**
- Structured deployment workflows ကို လိုက်နာပြီး အောင်မြင်သောရလဒ်များရရှိပါ
- Logs နှင့် documentation ကို အသုံးပြု၍ အခြေခံ deployment ပြဿနာများကို troubleshoot လုပ်ပါ
- Cloud deployment processes အကြောင်းကို ထိရောက်စွာ ဆက်သွယ်ပါ
- Secure AI service integration အတွက် အကောင်းဆုံးနည်းလမ်းများကို အသုံးပြုပါ

**Learning Verification:**
- ✅ `todo-nodejs-mongo` template ကို အောင်မြင်စွာ deploy လုပ်ပါ
- ✅ `azure-search-openai-demo` ကို RAG ဖြင့် deploy နှင့် configure လုပ်ပါ
- ✅ Discovery phase workshop exercises ကို ပြီးစီးပါ
- ✅ Azure Discord community discussions တွင် ပါဝင်ဆွေးနွေးပါ

### Intermediate Level (အခန်း ၃-၄)
Intermediate အခန်းများကို ပြီးစီးပြီးနောက်၊ သင်တန်းသားများသည် အောက်ပါအရာများကို ပြသနိုင်ပါမည်-

**Technical Capabilities:**
- Multi-environment deployments (dev, staging, production) ကို စီမံပါ
- Infrastructure as code အတွက် custom Bicep templates ကို ဖန်တီးပါ
- Managed identity ဖြင့် secure authentication patterns ကို အကောင်အထည်ဖော်ပါ
- Custom configurations ဖြင့် complex multi-service applications ကို deploy လုပ်ပါ
- Cost နှင့် performance အတွက် resource provisioning strategies ကို optimize လုပ်ပါ

**Professional Skills:**
- Scalable infrastructure architectures ကို ဒီဇိုင်းဆွဲပါ
- Cloud deployments အတွက် security အကောင်းဆုံးနည်းလမ်းများကို အကောင်အထည်ဖော်ပါ
- Infrastructure patterns ကို documentation လုပ်ပြီး အဖွဲ့နှင့် ပေါင်းစပ်ပါ
- Requirements အတွက် သင့်လျော်သော Azure services ကို အကဲဖြတ်ပြီး ရွေးချယ်ပါ

**Learning Verification:**
- ✅ Environment-specific settings ဖြင့် separate environments ကို configure လုပ်ပါ
- ✅ Multi-service application အတွက် custom Bicep template ကို ဖန်တီးပြီး deploy လုပ်ပါ
- ✅ Managed identity authentication ကို secure access အတွက် အကောင်အထည်ဖော်ပါ
- ✅ Configuration management exercises ကို လက်တွေ့ကျကျ scenario များဖြင့် ပြီးစီးပါ

### Advanced Level (အခန်း ၅-၆)
Advanced အခန်းများကို ပြီးစီးပြီးနောက်၊ သင်တန်းသားများသည် အောက်ပါအရာများကို ပြသနိုင်ပါမည်-

**Technical Capabilities:**
- Coordinated workflows ဖြင့် multi-agent AI solutions ကို deploy နှင့် orchestrate လုပ်ပါ
- Retail scenarios အတွက် Customer နှင့် Inventory agent architectures ကို အကောင်အထည်ဖော်ပါ
- Comprehensive capacity planning နှင့် resource validation ကို လုပ်ဆောင်ပါ
- Automated pre-deployment validation နှင့် optimization ကို အကောင်အထည်ဖော်ပါ
- Workload requirements အပေါ်မူတည်၍ cost-effective SKU selections ကို ဒီဇိုင်းဆွဲပါ

**Professional Skills:**
- Production environments အတွက် complex AI solutions ကို architect လုပ်ပါ
- AI deployment strategies အကြောင်း technical discussions ကို ဦးဆောင်ပါ
- AZD နှင့် AI deployment အကောင်းဆုံးနည်းလမ်းများကို junior developers များကို သင်ကြားပါ
- Business requirements အတွက် AI architecture patterns ကို အကဲဖြတ်ပြီး အကြံပေးပါ

**Learning Verification:**
- ✅ ARM templates ဖြင့် retail multi-agent solution အပြည့်အစုံကို deploy လုပ်ပါ
- ✅ Agent coordination နှင့် workflow orchestration ကို ပြသပါ
- ✅ Resource constraints အပြည့်အစုံဖြင့် capacity planning exercises ကို ပြီးစီးပါ
- ✅ Automated pre-flight checks ဖြင့် deployment readiness ကို validate လုပ်ပါ

### Expert Level (အခန်း ၇-၈)
Expert အခန်းများကို ပြီးစီးပြီးနောက်၊ သင်တန်းသားများသည် အောက်ပါအရာများကို ပြသနိုင်ပါမည်-

**Technical Capabilities:**
- Deployment ပြဿနာများကို ကိုယ်တိုင်ရှာဖွေပြီး ဖြေရှင်းပါ
- Enterprise-grade security patterns နှင့် governance frameworks ကို အကောင်အထည်ဖော်ပါ
- Monitoring နှင့် alerting strategies ကို comprehensive ဒီဇိုင်းဆွဲပါ
- Scale, cost, နှင့် performance အတွက် production deployments ကို optimize လုပ်ပါ
- Testing နှင့် validation အတွက် CI/CD pipelines ကို အကောင်အထည်ဖော်ပါ

**Professional Skills:**
- Enterprise cloud transformation အစီအစဉ်များကို ဦးဆောင်ပါ
- Organizational deployment standards ကို ဒီဇိုင်းဆွဲပြီး အကောင်အထည်ဖော်ပါ
- Development teams များကို AZD အဆင့်မြင့်နည်းလမ်းများတွင် သင်ကြားပါ
- Enterprise AI deployments အတွက် technical decision-making ကို အကျိုးသက်သာစွာ လုပ်ဆောင်ပါ

**Learning Verification:**
- ✅ Multi-service deployment failures အဆင့်မြင့်ကို ဖြေရှင်းပါ
- ✅ Compliance requirements ဖြင့် enterprise security patterns ကို အကောင်အထည်ဖော်ပါ
- ✅ Application Insights ဖြင့် production monitoring ကို ဒီဇိုင်းဆွဲပြီး deploy လုပ်ပါ
- ✅ Enterprise governance framework implementation ကို ပြီးစီးပါ

## 🎯 သင်ခန်းစာပြီးစီးမှုအထောက်အထား

### Progress Tracking Framework
သင်၏သင်ယူမှုတိုးတက်မှုကို structured checkpoints များဖြင့် စစ်ဆေးပါ:

- [ ] **အခန်း ၁**: Foundation & Quick Start ✅
- [ ] **အခန်း ၂**: AI-First Development ✅  
- [ ] **အခန်း ၃**: Configuration & Authentication ✅
- [ ] **အခန်း ၄**: Infrastructure as Code & Deployment ✅
- [ ] **အခန်း ၅**: Multi-Agent AI Solutions ✅
- [ ] **အခန်း ၆**: Pre-Deployment Validation & Planning ✅
- [ ] **အခန်း ၇**: Troubleshooting & Debugging ✅
- [ ] **အခန်း ၈**: Production & Enterprise Patterns ✅

### Verification Process
အခန်းတစ်ခုစီကို ပြီးစီးပြီးနောက်၊ သင်၏ကျွမ်းကျင်မှုကို အောက်ပါနည်းလမ်းများဖြင့် စစ်ဆေးပါ:

1. **Practical Exercise Completion**: အခန်းတစ်ခုစီအတွက် အလုပ်လုပ်သော ဖြေရှင်းနည်းများကို deploy လုပ်ပါ
2. **Knowledge Assessment**: FAQ အပိုင်းများကို ပြန်လည်သုံးသပ်ပြီး Self-assessments ကို ပြီးစီးပါ
3. **Community Engagement**: အတွေ့အကြုံများကို မျှဝေပြီး Azure Discord တွင် feedback ရယူပါ
4. **Portfolio Development**: သင်၏ deployments နှင့် သင်ခန်းစာများကို documentation လုပ်ပါ
5. **Peer Review**: အခြေခံ scenario များတွင် အခြားသင်တန်းသားများနှင့် ပေါင်းစပ်ပါ

### သင်ခန်းစာပြီးစီးမှုအကျိုးကျေးဇူးများ
အခန်းအားလုံးကို verification ဖြင့် ပြီးစီးပြီးနောက်၊ သင်တန်းသားများသည် အောက်ပါအကျိုးကျေးဇူးများရရှိပါမည်-

**Technical Expertise:**
- **Production Experience**: အမှန်တကယ် AI applications များကို Azure environments တွင် deploy လုပ်ထားခြင်း
- **Professional Skills**: Enterprise-ready deployment နှင့် troubleshooting ကျွမ်းကျင်မှုများ  
- **Architecture Knowledge**: Multi-agent AI solutions နှင့် complex infrastructure patterns
- **Troubleshooting Mastery**: Deployment နှင့် configuration ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်ခြင်း

**Professional Development:**
- **Industry Recognition**: AZD နှင့် AI deployment အထူးပြုကျွမ်းကျင်မှုများ
- **Career Advancement**: Cloud architect နှင့် AI deployment specialist အခန်းကဏ္ဍများအတွက် အရည်အချင်း
- **Community Leadership**: Azure developer နှင့် AI community များတွင် တက်ကြွစွာ ပါဝင်မှု
- **Continuous Learning**: Microsoft Foundry အထူးပြုသင်တန်းများအတွက် အခြေခံ

**Portfolio Assets:**
- **Deployed Solutions**: AI applications နှင့် infrastructure patterns များ၏ အလုပ်လုပ်သော ဥပမာများ
- **Documentation**: Deployment guides နှင့် troubleshooting လုပ်နည်းများ  
- **Community Contributions**: Azure community နှင့် မျှဝေထားသော ဆွေးနွေးချက်များ၊ ဥပမာများ၊ နှင့် တိုးတက်မှုများ
- **Professional Network**: Azure ကျွမ်းကျင်သူများနှင့် AI deployment လုပ်ငန်းရှင်များနှင့် ဆက်သွယ်မှု

### Post-Course Learning Path
သင်တန်းပြီးစီးသူများသည် အောက်ပါအထူးပြုသင်တန်းများအတွက် ပြင်ဆင်ထားပါသည်-
- **Microsoft Foundry Expert**: AI model deployment နှင့် orchestration အထူးပြု
- **Cloud Architecture Leadership**: Enterprise-scale deployment design နှင့် governance
- **Developer Community Leadership**: Azure samples နှင့် community resources များတွင် ပါဝင်မှု
- **Corporate Training**: AZD နှင့် AI deployment ကျွမ်းကျင်မှုများကို အဖွဲ့အစည်းများတွင် သင်ကြားခြင်း

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
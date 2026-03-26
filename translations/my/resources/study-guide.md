# Study Guide - Comprehensive Learning Objectives

**Learning Path Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Start Learning**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progress Tracking**: [Course Completion](../README.md#-course-completion--certification)

## Introduction

ဤ ပြည့်စုံသော study guide သည် Azure Developer CLI (azd) ကိုကျွမ်းကျင်ရန် အဆင်သင့် ဖွဲ့စည်းထားသော သင်ယူရန် ရည်ရွယ်ချက်များ၊ အဓိက အကြောင်းအရာများ၊ လေ့ကျင့်မှုလေ့ရဲ့ လက်တွေ့ လက်မှတ်ပေးအရာများနှင့် သုံးသပ် စစ်ဆေးမှု ပစ္စည်းများကို ဖော်ပြထားသည်။ သင်၏ တိုးတက်မှုကို လိုက်ကြည့်ရန်နှင့် မလိုလားအပ်သော အချက်များကို ကြည့်ရန် ဤလမ်းညွှန်ကို အသုံးပြုပါ။

## Learning Goals

ဤ study guide ကို ပြီးစီးလျှင် သင်သည်-
- Azure Developer CLI ၏ အခြေခံ နှင့် အဆင့်မြင့် အကြောင်းအရာများအားလုံးကို ကျွမ်းကျင်နိုင်မည်
- Azure လျှပ်စစ်လျှောက်လွှာများကို တပ်ဆင်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း ဆိုင်ရာ လက်တွေ့ကျကျ ကျွမ်းကျင်မှုများ ရရှိမည်
- တပ်ဆင်မှုများကို ပြန်လည်ဖြေရှင်းခြင်းနှင့် အထိရောက်စွာ အကောင်းကောင်းလုပ်ဆောင်နိုင်မှု တွင် ယုံကြည်မှု တည်ဆောက်မည်
- ထုတ်လုပ်ရေးတင်သွင်းနိုင်စွမ်းရှိသော deployment လက်နက်များနှင့် လုံခြုံရေး စဉ်းစားချက်များကို နားလည်မည်

## Learning Outcomes

ဤ study guide ၏ အပိုင်းအားလုံးကို ပြီးစီးလျှင် သင်သည်-
- azd ကို အသုံးပြုကာ ပြည့်စုံသော application architecture များကို ဒီဇိုင်းရေးဆွဲ၊ တပ်ဆင်နှင့် စီမံခန့်ခွဲနိုင်မည်
- နာရီလုံး monitoring, security, cost optimization များကို အကောင်အထည်ဖော်နိုင်မည်
- အဆင်ပြေစွာ စီမံခန့်ခွဲ၍ deployment ပြဿနာရှာဖွေရန် သဘောတရားပြေကျစွာ ဖြေရှင်းနိုင်မည်
- custom templates များ ဖန်တီး၍ azd community ထဲသို့ အကူအညီပေးနိုင်မည်

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (Week 1)
**Duration**: 30-45 minutes | **Complexity**: ⭐

#### Learning Objectives
- Azure Developer CLI ၏ အဓိက အယူအဆများနှင့် အသုံးအနှုန်းများကို နားလည်ရန်
- သင်၏ ဖွံ့ဖြိုးရေး platform ပေါ်တွင် AZD ကို မအောင်မြင်စွာ install လုပ်၍ ဖွဲ့စည်းရန်
- ရှိပြီးသား template တစ်ခုကို အသုံးပြုကာ ပထမဆုံး application ကို deploy ပြုလုပ်ရန်
- AZD command-line interface ကို ထိရောက်စွာ တရားဝင်သိရှိရန်

#### Key Concepts to Master
- AZD project အဖွဲ့စည်းနှင့် component များ (azure.yaml, infra/, src/)
- Template အခြေပြု deployment workflow များ
- Environment configuration အခြေခံများ
- Resource group နှင့် subscription စီမံခန့်ခွဲမှု

#### Practical Exercises
1. **Installation Verification**: Install AZD and verify with `azd version`
2. **First Deployment**: Deploy todo-nodejs-mongo template successfully
3. **Environment Setup**: Configure your first environment variables
4. **Resource Exploration**: Navigate deployed resources in Azure Portal

#### Assessment Questions
- AZD project ၏ အဓိက component များ ဘာတွေဖြစ်သနည်း?
- Template မှာနေ၍ project အသစ်ကို ဘယ်လို initialize လုပ်နိုင်သလဲ?
- `azd up` နဲ့ `azd deploy` ရဲ့ ကွာခြားချက်က ဘာလဲ?
- AZD ဖြင့် အမျိုးမျိုးသော environments များကို ဘယ်လိုစီမံခန့်ခွဲရမယ်?

---

### Chapter 2: AI-First Development (Week 2)
**Duration**: 1-2 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- Microsoft Foundry services များကို AZD workflows နှင့် ပေါင်းစည်းခြင်း
- AI အင်အားဖြင့် အက်ပလီကေးရှင်းများကို deploy နှင့် configure ပြုလုပ်ခြင်း
- RAG (Retrieval-Augmented Generation) အကောင်အထည်ဖော်မှု pattern များကို နားလည်ရန်
- AI model များ၏ deployment နှင့် scaling ကို စီမံခန့်ခွဲရန်

#### Key Concepts to Master
- Microsoft Foundry Models service integration နှင့် API ကိုစီမံခြင်း
- AI Search configuration နှင့် vector indexing
- Model deployment ညွှန်ကြားချက်များနှင့် capacity planning
- AI application များအတွက် monitoring နှင့် performance optimization

#### Practical Exercises
1. **AI Chat Deployment**: Deploy azure-search-openai-demo template
2. **RAG Implementation**: Configure document indexing and retrieval
3. **Model Configuration**: Set up multiple AI models with different purposes
4. **AI Monitoring**: Implement Application Insights for AI workloads

#### Assessment Questions
- AZD template တွင် Microsoft Foundry Models services ကို ဘယ်လို configure လုပ်ရမည်နည်း?
- RAG architecture ၏ အဓိက component များ ဘာတွေရှိသနည်း?
- AI model capacity နှင့် scaling ကို ဘယ်လို စီမံရမည်နည်း?
- AI application များအတွက် အရေးကြီး monitoring metrics များ ဘာတွေဖြစ်သနည်း?

---

### Chapter 3: Configuration & Authentication (Week 3)
**Duration**: 45-60 minutes | **Complexity**: ⭐⭐

#### Learning Objectives
- Environment configuration နှင့် management နည်းဗျူဟာများအား ကျွမ်းကျင်ရန်
- လုံခြုံသော authentication နမူနာများနှင့် managed identity ကို အကောင်အထည်ဖော်ရန်
- သင့် resource များကို မှန်ကန်သည့် နာမည်ပေးခြင်း နည်းလမ်းများဖြင့် စီမံရန်
- Multi-environment deployments (dev, staging, prod) ကို configure လုပ်ရန်

#### Key Concepts to Master
- Environment hierarchy နှင့် configuration precedence
- Managed identity နှင့် service principal authentication
- Key Vault integration မှတဆင့် secrets management
- Environment-specific parameter management

#### Practical Exercises
1. **Multi-Environment Setup**: Configure dev, staging, and prod environments
2. **Security Configuration**: Implement managed identity authentication
3. **Secrets Management**: Integrate Azure Key Vault for sensitive data
4. **Parameter Management**: Create environment-specific configurations

#### Assessment Questions
- AZD ဖြင့် ကွဲပြားသော environments များကို ဘယ်လို configure လုပ်ရမည်နည်း?
- managed identity ကို service principals ထက် အသုံးချရသည့် အကျိုးကျေးဇူးများက ဘာလဲ?
- application secrets များကို ဘယ်လိုလုံခြုံစွာ စီမံသိမ်းဆည်းရမည်နည်း?
- AZD တွင် configuration hierarchy ဆိုသည်မှာ ဘာလဲ?

---

### Chapter 4: Infrastructure as Code & Deployment (Week 4-5)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐⭐

#### Learning Objectives
- Bicep infrastructure templates များ ဖန်တီး နိုင်ခြင်း နှင့် ထပ်တိုးပြင်ဆင်နိုင်ခြင်း
- တပ်ဆင်မှု pattern များနှင့် workflow များ အဆင့်မြှင့် အကောင်အထည်ဖော်ခြင်း
- resource provisioning strategies များကို နားလည်ရန်
- scalable multi-service architectures များ ဒီဇိုင်းရေးဆွဲရန်

- Deploy containerized applications using Azure Container Apps and AZD


#### Key Concepts to Master
- Bicep template structure နှင့် အကောင်းဆုံးလက်တွေ့ကျကျ အသုံးချနည်းများ
- Resource dependencies နှင့် deployment ordering
- Parameter files နှင့် template modularity
- Custom hooks နှင့် deployment automation
- Container app deployment pattern များ (quick start, production, microservices)

#### Practical Exercises
1. **Custom Template Creation**: Build a multi-service application template
2. **Bicep Mastery**: Create modular, reusable infrastructure components
3. **Deployment Automation**: Implement pre/post deployment hooks
4. **Architecture Design**: Deploy complex microservices architecture
5. **Container App Deployment**: Deploy the [Simple Flask API](../../../examples/container-app/simple-flask-api) and [Microservices Architecture](../../../examples/container-app/microservices) examples using AZD

#### Assessment Questions
- AZD အတွက် custom Bicep templates များကို ဘယ်လို ဖန်တီးရမည်နည်း?
- infrastructure code ကို အစီအရင်ခံ ဘယ်လို စီစဉ်ရမည်နည်း?
- templates တွင် resource dependencies များကို ဘယ်လို ကောင်းစွာ ကိုင်တွယ်ရမည်နည်း?
- zero-downtime updates ကို ဘယ် deployment pattern များမောင်းနှင်နိုင်သလဲ?

---

### Chapter 5: Multi-Agent AI Solutions (Week 6-7)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- Multi-agent AI architectures များကို ဒီဇိုင်းရေးဆွဲ၍ အကောင်အထည်ဖော်နိုင်ခြင်း
- Agent coordination နှင့် ဆက်သွယ်ဆက်ဆံမှုကို စီမံမောင်းမြန်းနိုင်ခြင်း
- production-ready AI solutions များကို monitoring နဲ့ တပ်ဆင်နိုင်ခြင်း
- Agent specialization နှင့် workflow pattern များကို နားလည်ရန်
- Multi-agent solutions ၏ အစိတ်အပိုင်းအဖြစ် containerized microservices များကို ပေါင်းစည်းရန်

#### Key Concepts to Master
- Multi-agent architecture pattern များနှင့် ဒီဇိုင်း သဘောတရားများ
- Agent ဆက်သွယ်ရေး ပရိုတိုကောများနှင့် data flow
- AI agents များအတွက် load balancing နှင့် scaling strategy များ
- Multi-agent systems အတွက် production monitoring
- containerized ပတ်ဝန်းကျင်တွင် service-to-service ဆက်သွယ်ရေး

#### Practical Exercises
1. **Retail Solution Deployment**: Deploy the complete multi-agent retail scenario
2. **Agent Customization**: Modify Customer and Inventory agent behaviors
3. **Architecture Scaling**: Implement load balancing and auto-scaling
4. **Production Monitoring**: Set up comprehensive monitoring and alerting
5. **Microservices Integration**: Extend the [Microservices Architecture](../../../examples/container-app/microservices) example to support agent-based workflows

#### Assessment Questions
- ထိရောက်သော multi-agent ဆက်သွယ်ရေး pattern များကို ဘယ်လို ဒီဇိုင်းရေးဆွဲရမည်နည်း?
- AI agent workloads များကို scale လုပ်ရာတွင် အဓိက စဉ်းစားရမည့် အချက်များ ဘာတွေပါသလဲ?
- multi-agent AI systems များကို ဘယ်လို monitor နဲ့ debug လုပ်ရမည်နည်း?
- AI agents များအတွက် ယုံကြည်စိတ်ချရမှု ရရှိစေရန် ထုတ်လုပ်ရေး pattern များ ဘာတွေလုပ်ဆောင်သလဲ?

---

### Chapter 6: Pre-Deployment Validation & Planning (Week 8)
**Duration**: 1 hour | **Complexity**: ⭐⭐

#### Learning Objectives
- လုံလောက်သော capacity planning နှင့် resource validation များကို ပြုလုပ်နိုင်ရန်
- သင့်ရည်ရွယ်ချက်နှင့် ကိုက်ညီသော Azure SKUs များကို ရွေးချယ်နိုင်ရန်
- အလိုအလျောက် pre-flight checks နှင့် validation များကို ဆောင်ရွက်နိုင်ရန်
- cost optimization ကို ထည့်သွင်း၍ deployment များကို စီမံပံ့ပိုးရန်

#### Key Concepts to Master
- Azure resource quotas နှင့် capacity ကန့်သတ်ချက်များ
- SKU ရွေးချယ်မှုเกณฑ์များနှင့် cost optimization
- အလိုအလျောက် validation scripts နှင့် စမ်းသပ်မှုများ
- Deployment စီမံကိန်းရေးဆွဲခြင်းနှင့် risk အကဲဖြတ်မှု

#### Practical Exercises
1. **Capacity Analysis**: Analyze resource requirements for your applications
2. **SKU Optimization**: Compare and select cost-effective service tiers
3. **Validation Automation**: Implement pre-deployment check scripts
4. **Cost Planning**: Create deployment cost estimates and budgets

#### Assessment Questions
- Deployment မလုပ်မီ Azure capacity ကို ဘယ်လို သေချာစစ်ဆေးရမည်နည်း?
- SKU ရွေးချယ်ရာတွင် သယ်ယူလွှဲပြောင်းမှုကို ထိခိုက်စေသည့် ဖакторများ ဘာတွေပါသလဲ?
- pre-deployment validation ကို ဘယ်လို အလိုအလျောက် လုပ်ဆောင်နိုင်မည်နည်း?
- deployment ကုန်ကျစရိတ်များအား အကောင်းဆုံး ဖြတ်တောက်ရန် မည်သည့် နည်းဗျူဟာများကို အသုံးပြုနိုင်သလဲ?

---

### Chapter 7: Troubleshooting & Debugging (Week 9)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- AZD deployment များအတွက် စနစ်တကျ debugging နည်းလမ်းများ ဖန်တီးနိုင်ရန်
- ရိုးရှင်းသော deployment နှင့် configuration ပြဿနာများကို ဖြေရှင်းနိုင်ရန်
- AI သက်ဆိုင်သော ပြဿနာများနှင့် performance ပြဿနာများကို debug လုပ်နိုင်ရန်
- အချိန်မီ ပြဿနာရှာဖွေမှုအတွက် monitoring နှင့် alerting ကို ထည့်သွင်းနိုင်ရန်

#### Key Concepts to Master
- Diagnostic နည်းလမ်းများနှင့် logging အခြေခံနည်းဗျူဟာများ
- မကြာခဏ ဖြစ်ပေါ်သော မအောင်မြင်မှု ပုံစံများနှင့် ဖြေရှင်းနည်းများ
- Performance monitoring နှင့် optimization
- Incident response နှင့် recovery လုပ်ထုံးလုပ်နည်းများ

#### Practical Exercises
1. **Diagnostic Skills**: Practice with intentionally broken deployments
2. **Log Analysis**: Use Azure Monitor and Application Insights effectively
3. **Performance Tuning**: Optimize slow-performing applications
4. **Recovery Procedures**: Implement backup and disaster recovery

#### Assessment Questions
- အများအားဖြင့် ဖြစ်ပေါ်သော AZD deployment မအောင်မြင်မှုများက ဘာတွေဖြစ်သနည်း?
- authentication နှင့် permission ပြဿနာများကို ဘယ်လို debug လုပ်ရမည်နည်း?
- ထုတ်လုပ်ရေးပြဿနာများကို ကာကွယ်ရန် ဘယ် monitoring နည်းဗျူဟာများ အသုံးပြုသင့်သလဲ?
- Azure တွင် application performance ကို ဘယ်လို တိုးတက်စေမည်နည်း?

---

### Chapter 8: Production & Enterprise Patterns (Week 10-11)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- စီးပွားရေးအဆင့် deployment ဥပဒ်များကို အကောင်အထည်ဖော်ရန်
- လုံခြုံရေး pattern များနှင့် compliance ဖွဲ့စည်းချက်များ ဒီဇိုင်းရေးဆွဲရန်
- monitoring၊ governance နှင့် cost management ကို တည်ဆောက်ရန်
- AZD အင်တာဂရိတ်ရှိ scalable CI/CD pipeline များ ဖန်တီးရန်
- production container app deployments အတွက် အကောင်းဆုံးအလေ့အကျင့်များကို (security, monitoring, cost, CI/CD) သုံးနိုင်ရန်

#### Key Concepts to Master
- Enterprise security နှင့် compliance လိုအပ်ချက်များ
- Governance frameworks နှင့် policy အကောင်အထည်ဖော်ခြင်း
- Advanced monitoring နှင့် cost management
- CI/CD integration နှင့် အလိုအလျော့ deployment pipeline များ
- Containerized workloads များအတွက် blue-green နှင့် canary deployment strategy များ

#### Practical Exercises
1. **Enterprise Security**: Implement comprehensive security patterns
2. **Governance Framework**: Set up Azure Policy and resource management
3. **Advanced Monitoring**: Create dashboards and automated alerting
4. **CI/CD Integration**: Build automated deployment pipelines
5. **Production Container Apps**: Apply security, monitoring, and cost optimization to the [Microservices Architecture](../../../examples/container-app/microservices) example

#### Assessment Questions
- AZD deployments တွင် enterprise security ကို ဘယ်လို အကောင်အထည်ဖော်ရမည်နည်း?
- compliance နှင့် ကုန်ကျစရိတ်ထိန်းချုပ်မှုအတွက် governance pattern များ ဘာတွေပါသလဲ?
- ထုတ်လုပ်ရေး စနစ်များအတွက် scalable monitoring ကို ဘယ်လို ဒီဇိုင်းရေးဆွဲရမည်နည်း?
- AZD workflows များနှင့် အကောင်းဆုံး လက်တွေ့သုံးသော CI/CD pattern များမှာ ဘာတွေလဲ?

#### Learning Objectives
- Azure Developer CLI fundamentals နှင့် အဓိက အယူအဆများကို နားလည်ရန်
- သင့်ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်ပေါ်တွင် azd ကို အောင်မြင်စွာ install လုပ်၍ configure လုပ်ရန်
- ရှိပြီးသား template တစ်ခုကို အသုံးပြုကာ ပထမဆုံး deployment ကို ပြီးမြောက်စေရန်
- azd project structure ကို လမ်းစဉ်ပေါ်တွင် စူးစမ်းနားလည်ပြီး အဓိက component များကို သိရှိရန်

#### Key Concepts to Master
- Templates, environments, နှင့် services
- azure.yaml configuration structure
- အခြေခံ azd တိုက်ရိုက်အသုံးများ (init, up, down, deploy)
- Infrastructure as Code သဘောတရားများ
- Azure authentication နှင့် authorization

#### Practice Exercises

**Exercise 1.1: Installation and Setup**
```bash
# အောက်ပါ အလုပ်များကို ပြီးစီးပါ:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# ရိုးရှင်းသော ဝက်ဘ် အက်ပလီကေးရှင်း တစ်ခုကို ဖြန့်ချိပါ:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Project Structure Analysis**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Self-Assessment Questions
1. azd architecture ၏ သုံးခု အဓိက အယူအဆများ ဘာတွေလဲ?
2. azure.yaml ဖိုင်၏ ကိစ္စရည်ရွယ်ချက်က ဘာလဲ?
3. environments များသည် ကွဲပြားသော deployment target များကို ဘယ်လို ကူညီပေးသလဲ?
4. azd နှင့် အသုံးပြုနိုင်သော authentication မျိုးများ ဘာတွေလဲ?
5. ပထမဆုံးအကြိမ် `azd up` ကို chạy လို့ ဘာတွေဖြစ်စေသနည်း?

---

## Progress Tracking and Assessment Framework
```bash
# ပတ်ဝန်းကျင်အမျိုးမျိုးကို ဖန်တီးပြီး ပြင်ဆင်ပါ:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercise 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercise 2.3: Security Configuration**
```bash
# လုံခြုံရေးဆိုင်ရာ အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို အကောင်အထည်ဖော်ပါ:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Self-Assessment Questions
1. azd သည် environment variable precedence ကို ဘယ်လို ကိုင်တွယ်ကာ အလုပ်လုပ်သနည်း?
2. deployment hooks များဆိုတာဘာလဲ၊ မည်သည့်အခါတွင် အသုံးပြုသင့်သနည်း?
3. ကွဲပြားသော environments များအတွက် မည်သို့ SKUs များ configure လုပ်ရမည်နည်း?
4. မတူညီသော authentication နည်းလမ်းများ၏ လုံခြုံရေး သက်ရောက်မှုများ များက ဘာတွေလဲ?
5. secrets နှင့် အလှည့်အပြောင်း configuration ဒေတာများကို ဘယ်လို စီမံရမည်နည်း?

### Module 3: Deployment and Provisioning (Week 4)

#### Learning Objectives
- deployment workflows နှင့် အကောင်းဆုံးလက်တွေ့ အကြောင်းအရာများကို ကျွမ်းကျင်ရန်
- Bicep templates ဖြင့် Infrastructure as Code ကို နားလည်ရန်
- စုံလင်သော multi-service architectures များကို အကောင်အထည်ဖော်ရန်
- deployment performance နှင့် ယုံကြည်စိတ်ချမှုကို ကိုင်တွယ် အဆင်ပြေစေရန်

#### Key Concepts to Master
- Bicep template structure နှင့် modules
- Resource dependencies နှင့် ordering
- Deployment strategies (blue-green, rolling updates)
- Multi-region deployments
- Database migrations နှင့် data management

#### Practice Exercises

**Exercise 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercise 3.2: Multi-Service Application**
```bash
# မိုက်ခရိုဆာဗစ်စနစ်တစ်ခုကို ဖြန့်ချိပါ:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# ဒေတာဘေ့စ် တပ်ဆင်ရေး ပုံစံများကို အကောင်အထည်ဖော်ပါ:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Self-Assessment Questions
1. Bicep ကို ARM templates ထက် အသုံးချရာတွင် အားသာချက်များ ဘာတွေလဲ?
2. azd deployments တွင် database migrations များကို ဘယ်လို ကိုင်တွယ်သင့်သလဲ?
3. zero-downtime deployments ရရှိစေရန် မည်သည့် strategy များ ရှိသနည်း?
4. services များအကြား dependencies များကို ဘယ်လို စီမံရမည်နည်း?
5. multi-region deployments အတွက် စဉ်းစားရမည့် အချက်များ ဘာတွေလဲ?

### Module 4: Pre-Deployment Validation (Week 5)

#### Learning Objectives
- ကြိုတင်ထုတ်လုပ်မှုအလိုရှိမှုများကို အကျယ်တဝင့် စစ်ဆေးရန် အကောင်အထည်ဖော်ပါ
- စွမ်းဆောင်ရည် စီမံကိန်းများနှင့် အရင်းအမြစ် အတည်ပြုမှုကို ကျွမ်းကျင်ပါ
- SKU ရွေးချယ်မှုနှင့် ကုန်ကျစရိတ် မျှတစွာ လျှော့ချမှုကို နားလည်ပါ
- အလိုအလျောက် အတည်ပြုရေး pipeline များ တည်ဆောက်ပါ

#### Key Concepts to Master
- Azure resource quotas and limits
- SKU selection criteria and cost implications
- Automated validation scripts and tools
- Capacity planning methodologies
- Performance testing and optimization

#### Practice Exercises

**Exercise 4.1: Capacity Planning**
```bash
# စွမ်းရည်စစ်ဆေးမှုကို အကောင်အထည်ဖော်ပါ:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# ပြည့်စုံသော အတည်ပြုစစ်ဆေးရေး လုပ်ငန်းစဉ် တည်ဆောက်ပါ:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# ဝန်ဆောင်မှု ဖွဲ့စည်းချက်များကို အကောင်းဆုံးပြုလုပ်ပါ:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Self-Assessment Questions
1. SKU ရွေးချယ်မှု ဆုံးဖြတ်ရာတွင် ဘယ်ဖက်မှ အချက်များက သွက်လက်စေသင့်သနည်း?
2. ဖြန့်ချိမှုပြုမတိုင်မီ Azure resource များ ရရှိနိုင်မှုကို မည်သို့ အတည်ပြုသနည်း?
3. pre-flight စစ်ဆေးမှု စနစ် တစ်ခု၏ အဓိက တွဲဖက်ပစ္စည်းများက ဘာတွေပါသလဲ?
4. ဖြန့်ချိမှုကုန်ကျစရိတ်များကို မည်သို့ ခန့်မှန်းပြီးထိန်းချုပ်သနည်း?
5. စွမ်းဆောင်ရည် စီမံခန့်ခွဲမှုအတွက် မည်သည့် မီထရစ်များကို ကြီးကြပ်ရမည်နည်း?

### Module 5: Troubleshooting and Debugging (အပတ် 6)

#### Learning Objectives
- စနစ်တကျ ဖြစ်ပေါ်လာသော ပြဿနာများကို ရှာဖွေဖြေရှင်းနိုင်စေတဲ့ နည်းဗျူဟာများ ကျွမ်းကျင်ရန်
- ဖြန့်ချိမှုများတွင် ဖြစ်ပေါ်လာသော ရှုပ်ထွေးသော အမှားများကို debugging တွင် ကျွမ်းကျင်ရန်
- ကျယ်ပြန့်သော မော်နီတာနှင့် အချက်ပေးချက်များကို အကောင်အထည်ဖော်ရန်
- ဖြစ်ရပ်ဆိုင်ရာ တုံ့ပြန်မှုနှင့် ပြန်လည်ရယူရေး လုပ်ထုံးလုပ်နည်းများ တည်ဆောက်ရန်

#### Key Concepts to Master
- Common deployment failure patterns
- Log analysis and correlation techniques
- Performance monitoring and optimization
- Security incident detection and response
- Disaster recovery and business continuity

#### Practice Exercises

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# ပုံမှန်တွေ့ရသော ပြဿနာများကို ဖြေရှင်းရန် လေ့ကျင့်ပါ:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# ပြည့်စုံသည့် စောင့်ကြည့်မှုစနစ်ကို တပ်ဆင်ပါ:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# အဖြစ်အပျက် တုံ့ပြန်မှု လုပ်ထုံးလုပ်နည်းများ ဖန်တီးပါ:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Self-Assessment Questions
1. azd ဖြင့် ဖြန့်ချိမှုများကို ဖြေရှင်းရာတွင် စနစ်တကျ လုပ်ဆောင်ရမည့် နည်းလမ်းက ဘာလဲ?
2. ဝန်ဆောင်မှုနှင့် အရင်းအမြစ်များစွာအတွင်းမှ журналများကို မည်သို့ ဆက်စပ်စဉ်ဆက်ဖော်ထုတ်သလဲ?
3. ပြဿနာများကို အစောပိုင်း တွေ့ရှိနိုင်ရန် အရေးကြီးဆုံး မီထရစ်များက ဘာတွေလဲ?
4. ထိရောက်သော disaster recovery လုပ်ထုံးလုပ်နည်းများကို မည်သို့ အကောင်အထည်ဖော်သနည်း?
5. ဖြစ်ရပ်ဆိုင်ရာ တုံ့ပြန်မှု စီမံချက်တစ်ခု၏ အဓိက အစိတ်အပိုင်းများက ဘာတွေပါသလဲ?

### Module 6: Advanced Topics and Best Practices (အပတ် 7-8)

#### Learning Objectives
- စက်မှုလုပ်ငန်းအဆင့် များအတွက် ဖြန့်ချိမှု ပုံစံများကို အကောင်အထည်ဖော်ရန်
- CI/CD ပေါင်းစည်းမှုနှင့် အလိုအလျောက်သုံးစနစ်များကို ကျွမ်းကျင်ရန်
- စိတ်တိုင်းမီ custom template များ ဖန်တီးပြီး community သို့ ဗဟုသုတ ပေးဆောင်ရန်
- လုံခြုံရေးနှင့် အညီထမ်းဆောင်မှုဆိုင်ရာ အဆင့်မြင့် တရားကို နားလည်ရန်

#### Key Concepts to Master
- CI/CD pipeline integration patterns
- Custom template development and distribution
- Enterprise governance and compliance
- Advanced networking and security configurations
- Performance optimization and cost management

#### Practice Exercises

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# စိတ်ကြိုက် ပုံစံများကို ဖန်တီး၍ ထုတ်ဝေပါ:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# လုပ်ငန်းအဆင့် အရည်အသွေးမြင့် အင်္ဂါရပ်များကို အကောင်အထည်ဖော်ပါ:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Self-Assessment Questions
1. azd ကို ရှိပြီးသား CI/CD workflow များနှင့် မည်သို့ ပေါင်းစည်းသနည်း?
2. custom template ဖန်တီးရာတွင် တွေးဆရမည့် အဓိက အချက်များက ဘာတွေလဲ?
3. azd ဖြင့် ဖြန့်ချိခြင်းများတွင် အုပ်ချုပ်မှုနှင့် ကူးကျင့်မှုများကို မည်သို့ အကောင်အထည်ဖော်သနည်း?
4. စက်မှုအဆင့် ဖြန့်ချိမှုများအတွက် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများက ဘာတွေလဲ?
5. azd community ထဲမှာ ထိရောက်စွာ ပါဝင်ရန် မည်သို့ ဝေမျှဆောင်ရွက်သနည်း?

## Practical Projects

### Project 1: Personal Portfolio Website
**Complexity**: Beginner  
**Duration**: 1-2 weeks

ကိုယ်ပိုင် portfolio ဝက်ဘ်ဆိုက် တစ်ခုကို တည်ဆောက်ပြီး ဖြန့်ချိပါ -
- Static website hosting on Azure Storage
- Custom domain configuration
- CDN integration for global performance
- Automated deployment pipeline

**Deliverables**:
- Azure ပေါ်တွင် လည်ပတ်နေသော ဝက်ဘ်ဆိုက်
- Portfolio deployments အတွက် custom azd template
- ဖြန့်ချိမှုလုပ်ငန်းစဉ်၏ အချက်အလက်များကို မှတ်တမ်းတင်ထားသော စာရွက်စာတမ်း
- ကုန်ကျစရိတ် ခွဲခြမ်းစစ်ဆေးချက်များနှင့် အဆင်ပြေအောင် အကြံပြုချက်များ

### Project 2: Task Management Application
**Complexity**: Intermediate  
**Duration**: 2-3 weeks

အပြည့်အစုံ full-stack task management application တစ်ခုကို ဖန်တီးပါ -
- React frontend deployed to App Service
- Node.js API backend with authentication
- PostgreSQL database with migrations
- Application Insights monitoring

**Deliverables**:
- အသုံးပြုသူ အတည်ပြုချက်ပါ အပြည့်အစုံ application
- Database schema နှင့် migration scripts
- မော်နီတာချိန်ဇယားများနှင့် အချက်ပေးစည်းမျဉ်းများ
- Multi-environment ဖြန့်ချိမှု စီမံချက်

### Project 3: Microservices E-commerce Platform
**Complexity**: Advanced  
**Duration**: 4-6 weeks

မိုက်ခရိုဆာဗစ် အခြေပြု e-commerce platform တစ်ခုကို ဒီဇိုင်းရေးဆွဲပြီး အကောင်အထည်ဖော်ပါ -
- Multiple API services (catalog, orders, payments, users)
- Message queue integration with Service Bus
- Redis cache for performance optimization
- Comprehensive logging and monitoring

**Reference Example**: See [Microservices Architecture](../../../examples/container-app/microservices) for a production-ready template and deployment guide

**Deliverables**:
- အပြီးအစီး မိုက်ခရိုဆာဗစ် ပံ့ပိုးဆိုင်ရာ ဆက်ဆံရေး
- ဝန်ဆောင်မှုများအကြား ဆက်သွယ်ပုံများ
- စွမ်းဆောင်ရည် စမ်းသပ်မှုများနှင့် တိုးတက်အောင်လုပ်ခြင်း
- ထုတ်လုပ်မှုအဆင့် လုံခြုံရေး အကောင်အထည်ဖော်မှု

## Assessment and Certification

### Knowledge Checks

Complete these assessments after each module:

**Module 1 Assessment**: Basic concepts and installation
- Multiple choice questions on core concepts
- Practical installation and configuration tasks
- Simple deployment exercise

**Module 2 Assessment**: Configuration and environments
- Environment management scenarios
- Configuration troubleshooting exercises
- Security configuration implementation

**Module 3 Assessment**: Deployment and provisioning
- Infrastructure design challenges
- Multi-service deployment scenarios
- Performance optimization exercises

**Module 4 Assessment**: Pre-deployment validation
- Capacity planning case studies
- Cost optimization scenarios
- Validation pipeline implementation

**Module 5 Assessment**: Troubleshooting and debugging
- Problem diagnosis exercises
- Monitoring implementation tasks
- Incident response simulations

**Module 6 Assessment**: Advanced topics
- CI/CD pipeline design
- Custom template development
- Enterprise architecture scenarios

### Final Capstone Project

ဒီအရာအားလုံး၏ အကျွမ်းတဝင်ဖြစ်မှုကို ပြသနိုင်မည့် အပြည့်အစုံ ဖြေရှင်းချက်တစ်ခုကို ဒီဇိုင်းရေးဆွဲပြီး အကောင်အထည်ဖော်ပါ။

**Requirements**:
- Multi-tier application architecture
- Multiple deployment environments
- Comprehensive monitoring and alerting
- Security and compliance implementation
- Cost optimization and performance tuning
- Complete documentation and runbooks

**Evaluation Criteria**:
- နည်းပညာပိုင်း ဆောင်ရွက်မှု အရည်အသွေး
- စာရွက်စာတမ်း ပြည့်စုံမှု
- လုံခြုံရေးနှင့် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို လိုက်နာမှု
- စွမ်းဆောင်ရည်နှင့် ကုန်ကျစရိတ် တိုးတက်အောင်လုပ်မှု
- ပြဿနာရှာဖွေရေးနှင့် မော်နီတာအကျိုးသက်ရောက်မှု

## Study Resources and References

### Official Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Resources
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Practice Environments
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Additional Tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Study Schedule Recommendations

### Full-Time Study (8 weeks)
- **Weeks 1-2**: Modules 1-2 (Getting Started, Configuration)
- **Weeks 3-4**: Modules 3-4 (Deployment, Pre-deployment)
- **Weeks 5-6**: Modules 5-6 (Troubleshooting, Advanced Topics)
- **Weeks 7-8**: Practical Projects and Final Assessment

### Part-Time Study (16 weeks)
- **Weeks 1-4**: Module 1 (Getting Started)
- **Weeks 5-7**: Module 2 (Configuration and Environments)
- **Weeks 8-10**: Module 3 (Deployment and Provisioning)
- **Weeks 11-12**: Module 4 (Pre-deployment Validation)
- **Weeks 13-14**: Module 5 (Troubleshooting and Debugging)
- **Weeks 15-16**: Module 6 (Advanced Topics and Assessment)

---

## Progress Tracking and Assessment Framework

### Chapter Completion Checklist

Track your progress through each chapter with these measurable outcomes:

#### 📚 Chapter 1: Foundation & Quick Start
- [ ] **Installation Complete**: AZD installed and verified on your platform
- [ ] **First Deployment**: Successfully deployed todo-nodejs-mongo template
- [ ] **Environment Setup**: Configured first environment variables
- [ ] **Resource Navigation**: Explored deployed resources in Azure Portal
- [ ] **Command Mastery**: Comfortable with basic AZD commands

#### 🤖 Chapter 2: AI-First Development  
- [ ] **AI Template Deployment**: Deployed azure-search-openai-demo successfully
- [ ] **RAG Implementation**: Configured document indexing and retrieval
- [ ] **Model Configuration**: Set up multiple AI models with different purposes
- [ ] **AI Monitoring**: Implemented Application Insights for AI workloads
- [ ] **Performance Optimization**: Tuned AI application performance

#### ⚙️ Chapter 3: Configuration & Authentication
- [ ] **Multi-Environment Setup**: Configured dev, staging, and prod environments
- [ ] **Security Implementation**: Set up managed identity authentication
- [ ] **Secrets Management**: Integrated Azure Key Vault for sensitive data
- [ ] **Parameter Management**: Created environment-specific configurations
- [ ] **Authentication Mastery**: Implemented secure access patterns

#### 🏗️ Chapter 4: Infrastructure as Code & Deployment
- [ ] **Custom Template Creation**: Built a multi-service application template
- [ ] **Bicep Mastery**: Created modular, reusable infrastructure components
- [ ] **Deployment Automation**: Implemented pre/post deployment hooks
- [ ] **Architecture Design**: Deployed complex microservices architecture
- [ ] **Template Optimization**: Optimized templates for performance and cost

#### 🎯 Chapter 5: Multi-Agent AI Solutions
- [ ] **Retail Solution Deployment**: Deployed complete multi-agent retail scenario
- [ ] **Agent Customization**: Modified Customer and Inventory agent behaviors
- [ ] **Architecture Scaling**: Implemented load balancing and auto-scaling
- [ ] **Production Monitoring**: Set up comprehensive monitoring and alerting
- [ ] **Performance Tuning**: Optimized multi-agent system performance

#### 🔍 Chapter 6: Pre-Deployment Validation & Planning
- [ ] **Capacity Analysis**: Analyzed resource requirements for applications
- [ ] **SKU Optimization**: Selected cost-effective service tiers
- [ ] **Validation Automation**: Implemented pre-deployment check scripts
- [ ] **Cost Planning**: Created deployment cost estimates and budgets
- [ ] **Risk Assessment**: Identified and mitigated deployment risks

#### 🚨 Chapter 7: Troubleshooting & Debugging
- [ ] **Diagnostic Skills**: Successfully debugged intentionally broken deployments
- [ ] **Log Analysis**: Used Azure Monitor and Application Insights effectively
- [ ] **Performance Tuning**: Optimized slow-performing applications
- [ ] **Recovery Procedures**: Implemented backup and disaster recovery
- [ ] **Monitoring Setup**: Created proactive monitoring and alerting

#### 🏢 Chapter 8: Production & Enterprise Patterns
- [ ] **Enterprise Security**: Implemented comprehensive security patterns
- [ ] **Governance Framework**: Set up Azure Policy and resource management
- [ ] **Advanced Monitoring**: Created dashboards and automated alerting
- [ ] **CI/CD Integration**: Built automated deployment pipelines
- [ ] **Compliance Implementation**: Met enterprise compliance requirements

### Learning Timeline and Milestones

#### Week 1-2: Foundation Building
- **Milestone**: Deploy first AI application using AZD
- **Validation**: Working application accessible via public URL
- **Skills**: Basic AZD workflows and AI service integration

#### Week 3-4: Configuration Mastery
- **Milestone**: Multi-environment deployment with secure authentication
- **Validation**: Same application deployed to dev/staging/prod
- **Skills**: Environment management and security implementation

#### Week 5-6: Infrastructure Expertise
- **Milestone**: Custom template for complex multi-service application
- **Validation**: Reusable template deployed by another team member
- **Skills**: Bicep mastery and infrastructure automation

#### Week 7-8: Advanced AI Implementation
- **Milestone**: Production-ready multi-agent AI solution
- **Validation**: System handling real-world load with monitoring
- **Skills**: Multi-agent orchestration and performance optimization

#### Week 9-10: Production Readiness
- **Milestone**: Enterprise-grade deployment with full compliance
- **Validation**: Passes security review and cost optimization audit
- **Skills**: Governance, monitoring, and CI/CD integration

### Assessment and Certification

#### Knowledge Validation Methods
1. **Practical Deployments**: Working applications for each chapter
2. **Code Reviews**: Template and configuration quality assessment
3. **Problem Solving**: Troubleshooting scenarios and solutions
4. **Peer Teaching**: Explain concepts to other learners
5. **Community Contribution**: Share templates or improvements

#### Professional Development Outcomes
- **ပို့ဖိုလ်ယို စီမံကိန်းများ**: ထုတ်လုပ်ရန် အသင့်ဖြစ်သော တပ်ဆင်မှု ၈ ခု
- **နည်းပညာ ကျွမ်းကျင်မှုများ**: လုပ်ငန်းစံနှင့် ကိုက်ညီသော AZD နှင့် AI တပ်ဆင်မှု ကျွမ်းကျင်မှု
- **ပြဿနာဖြေရှင်းနိုင်စွမ်း**: သီးသန့် ပြဿနာရှာဖွေဖြေရှင်းခြင်းနှင့် စနစ်တကျ တိုးတက်အောင်ပြင်ဆင်ခြင်း
- **အဖွဲ့ဝင် အသိအမှတ်ပြုခြင်း**: Azure ဖွံ့ဖြိုးသူ အဖွဲ့တွင် တက်ကြွပါဝင်ခြင်းကြောင့် ရရှိသော အသိအမှတ်ပြုမှု
- **အလုပ်အကိုင် တိုးတက်ရေး**: Cloud နှင့် AI တာဝန်များတွင် တိုက်ရိုက် အသုံးချနိုင်သော ကျွမ်းကျင်မှုများ

#### အောင်မြင်မှုတိုင်းတာချက်များ
- **တပ်ဆင်မှု အောင်မြင်မှုနှုန်း**: >95% အောင်မြင်သော တပ်ဆင်မှုများ
- **ပြဿနာဖြေရှင်းချိန်**: ပုံမှန် ပြဿနာများအတွက် <30 မိနစ်
- **စွမ်းဆောင်ရည် တိုးတက်မှု**: ကုန်ကျစရိတ်နှင့် စွမ်းဆောင်ရည်တွင် ထင်ရှားသော တိုးတက်မှုများကို ထည့်သွင်း ပြသနိုင်ခြင်း
- **လုံခြုံရေး လိုက်နာမှု**: စီမံကိန်းများအားလုံးသည် လုပ်ငန်းအဆင့် လုံခြုံရေး စံသတ်မှတ်ချက်များကို လိုက်နာသည်
- **အသိပညာ လွှဲပြောင်းနိုင်မှု**: အခြား ဖွံ့ဖြိုးရေးသူများကို လမ်းညွှန်ပေးနိုင်သော စွမ်းရည်

### ဆက်လက်လေ့လာရေးနှင့် အဖွဲ့ဝင် ပါဝင်ဆောင်ရွက်မှု

#### နောက်ဆုံးအချက်အလက်များကို ထိန်းသိမ်းပါ
- **Azure Updates**: Azure Developer CLI ထုတ်ဝေမှတ်စုများကို လိုက်နာပါ
- **Community Events**: Azure နှင့် AI ဖွံ့ဖြိုးသူ အစည်းအဝေးများတွင် ပါဝင်ဆောင်ရွက်ပါ
- **Documentation**: ကွန်ယက် စာတမ်းများနှင့် ဥပမာများအား လက်ခံပံ့ပိုးပေးပါ
- **Feedback Loop**: သင်တန်း အကြောင်းအရာများနှင့် Azure ဝန်ဆောင်မှုများအပေါ် တုံ့ပြန်ချက်ပေးပါ

#### အလုပ်အကိုင် ဖွံ့ဖြိုးတိုးတက်ရေး
- **Professional Network**: Azure နှင့် AI ကျွမ်းကျင်သူများနှင့် ဆက်သွယ်ပါ
- **Speaking Opportunities**: ကွန်ဖရင့်များ သို့မဟုတ် မိတ်ဖက်အစည်းအဝေးများတွင် သင်လေ့လာသည့်အရာများကို တင်ပြပါ
- **Open Source Contribution**: AZD အခ$template များနှင့် ကိရိယာများအား ပံ့ပိုးထောက်ပံ့ပါ
- **Mentorship**: AZD သင်ယူရေး ခရီး၌ အခြား ဖွံ့ဖြိုးရေးသူများကို လမ်းညွှန်ပါ

---

**အခန်း လမ်းညွှန်:**
- **📚 Course Home**: [AZD စတင်လေ့လာသူများအတွက်](../README.md)
- **📖 Start Learning**: [အခန်း 1: အခြေခံ & အမြန်စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progress Tracking**: သင်၏ တိုးတက်မှုကို အပြည့်အစုံ ၈ အခန်းပါ သင်ယူရေးစနစ်မှတဆင့် စောင့်ကြည့်ပါ
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) အတွက် အထောက်အပံ့နှင့် ဆွေးနွေးမှုများ

**လေ့လာရေး တိုးတက်မှု စောင့်ကြည့်ခြင်း**: အတိုင်းအတာချထားနိုင်သည့် ရလဒ်များနှင့် ပရဖက်ရှင်နယ် ဖွံ့ဖြိုးတိုးတက်မှုအကျိုးများကို ရရှိစေသည့် တိုးတက်ဆက်လက် လက်တွေ့သင်ယူမှုဖြင့် Azure Developer CLI ကို ကျွမ်းကျင်စေရန် ဤ ဖွဲ့စည်းထားသော လမ်းညွှန်ကို အသုံးပြုပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ တိကျမှုအတွက် ကြိုးပမ်းပေမယ့် အော်တိုမက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းစာတမ်းကို အာဏာပိုင် အရင်းအမြစ်အဖြစ် သတ်မှတ်ရန် လိုအပ်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် သက်ဆိုင်ရာ ပရော်ဖက်ရှင်နယ် လူသား ဘာသာပြန်တစ်ဦး၏ ဘာသာပြန်ချက်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်နိုင်သော နားလည်မှုမှားယွင်းခြင်းများ သို့မဟုတ် အဓိပ္ပာယ် အလွဲအလျှာများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
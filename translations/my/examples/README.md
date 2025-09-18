<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T13:27:13+00:00",
  "source_file": "examples/README.md",
  "language_code": "my"
}
-->
# ဥပမာများ - AZD Template နှင့် Configuration များကို လက်တွေ့အသုံးပြုခြင်း

**ဥပမာများမှ သင်ယူခြင်း - အခန်းအလိုက် စီစဉ်ထားသော**
- **📚 သင်ခန်းစာအိမ်**: [AZD For Beginners](../README.md)
- **📖 အခန်းစီစဉ်မှု**: သင်ယူရလွယ်ကူမှုအလိုက် စီစဉ်ထားသော ဥပမာများ
- **🚀 ရိုးရှင်းစွာ စတင်ပါ**: [Chapter 1 Examples](../../../examples)
- **🤖 AI ဥပမာများ**: [Chapter 2 & 5 AI Solutions](../../../examples)

## မိတ်ဆက်

ဒီ directory မှာ Azure Developer CLI ကို လက်တွေ့ကျကျ သင်ယူနိုင်ဖို့ practical ဥပမာများ၊ template များနဲ့ အမှန်တကယ်ဖြစ်ရပ်များပါဝင်ပါတယ်။ အခန်းတိုင်းမှာ အပြည့်အစုံ code၊ infrastructure template များနဲ့ application architecture များနှင့် deployment pattern များအတွက် အသေးစိတ်လမ်းညွှန်ချက်များပါဝင်ပါတယ်။

## သင်ယူရည်မှန်းချက်များ

ဒီဥပမာများကို လုပ်ဆောင်ခြင်းအားဖြင့် သင်သည်:
- Azure Developer CLI workflow များကို အမှန်တကယ် application scenario များနှင့် လက်တွေ့ကျကျ လေ့ကျင့်နိုင်မည်
- application architecture များနှင့် သူတို့ရဲ့ azd implementation များကို နားလည်နိုင်မည်
- Azure service များအတွက် Infrastructure as Code pattern များကို ကျွမ်းကျင်နိုင်မည်
- configuration management နဲ့ environment-specific deployment strategy များကို အသုံးချနိုင်မည်
- monitoring, security, နဲ့ scaling pattern များကို လက်တွေ့ context များတွင် အသုံးချနိုင်မည်
- deployment scenario များကို troubleshooting နဲ့ debugging လုပ်နိုင်မည်

## သင်ယူရလဒ်များ

ဒီဥပမာများကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးနောက် သင်သည်:
- Azure Developer CLI ကို အသုံးပြုပြီး application အမျိုးမျိုးကို ယုံကြည်စိတ်ချစွာ deploy လုပ်နိုင်မည်
- ပေးထားသော template များကို ကိုယ်ပိုင် application လိုအပ်ချက်များအတွက် ပြောင်းလဲအသုံးပြုနိုင်မည်
- Bicep ကို အသုံးပြုပြီး custom infrastructure pattern များကို ဒီဇိုင်းဆွဲနိုင်မည်
- dependency များကို သင့်တော်စွာ ချိတ်ဆက်ထားသော complex multi-service application များကို configure လုပ်နိုင်မည်
- လက်တွေ့ scenario များတွင် security, monitoring, နဲ့ performance အကောင်းဆုံးနည်းလမ်းများကို အသုံးပြုနိုင်မည်
- လက်တွေ့အတွေ့အကြုံအပေါ် အခြေခံပြီး deployment များကို troubleshooting နဲ့ optimize လုပ်နိုင်မည်

## Directory ဖွဲ့စည်းမှု

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Quick Start ဥပမာများ

### Beginner များအတွက်
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express web application ကို MongoDB ဖြင့် deploy လုပ်ပါ
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - React static website ကို Azure Static Web Apps ဖြင့် host လုပ်ပါ
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Containerized Python Flask application ကို deploy လုပ်ပါ

### Intermediate အသုံးပြုသူများအတွက်
4. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API နဲ့ Azure SQL Database ပါဝင်တဲ့ web application
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP trigger နဲ့ Cosmos DB ပါဝင်တဲ့ Python Azure Functions
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container Apps နဲ့ API gateway ပါဝင်တဲ့ multi-service Java application

### Azure AI Foundry Template များ

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI ဖြင့် Intelligent chat application
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI service များကို အသုံးပြုပြီး စာရွက်စာတမ်းများကို analysis လုပ်ခြင်း
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning ဖြင့် MLOps workflow

### အမှန်တကယ်ဖြစ်ရပ်များ

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

Enterprise-grade AI application deployment ကို AZD ဖြင့် ပြသထားသော production-ready multi-agent customer support solution တစ်ခု။ ဒီ scenario မှာ ပါဝင်သည်:

- **Architecture အပြည့်အစုံ**: Customer service နဲ့ inventory management agent များပါဝင်တဲ့ multi-agent system
- **Production Infrastructure**: Multi-region Azure OpenAI deployment များ၊ AI Search၊ Container Apps၊ နဲ့ monitoring အပြည့်အစုံ
- **Ready-to-Deploy ARM Template**: Minimal/Standard/Premium configuration mode များဖြင့် One-click deployment
- **အဆင့်မြင့် Features**: Security validation, agent evaluation framework, cost optimization, troubleshooting guide များ
- **အမှန်တကယ် Business Context**: File upload, search integration, နဲ့ dynamic scaling ပါဝင်တဲ့ retailer customer support use case

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**အဆင့်**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**သင့်တော်သောသူများ**: AI developer များ၊ solution architect များ၊ production multi-agent system များကို တည်ဆောက်နေသောအဖွဲ့များ

**Quick Start**: ARM template ပါဝင်တဲ့ `./deploy.sh -g myResourceGroup` ကို အသုံးပြုပြီး ၃၀ မိနစ်အတွင်း solution အပြည့်အစုံကို deploy လုပ်ပါ

## 📋 အသုံးပြုရန် လမ်းညွှန်ချက်

### ဥပမာများကို Local မှာ Run လုပ်ခြင်း

1. **ဥပမာကို Clone သို့မဟုတ် Copy လုပ်ပါ**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD Environment ကို Initialize လုပ်ပါ**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Environment ကို Configure လုပ်ပါ**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy လုပ်ပါ**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### ဥပမာများကို ပြောင်းလဲအသုံးပြုခြင်း

ဥပမာတိုင်းမှာ ပါဝင်သည်:
- **README.md** - Setup နဲ့ customization အတွက် အသေးစိတ်လမ်းညွှန်ချက်
- **azure.yaml** - AZD configuration နဲ့ comment များ
- **infra/** - Parameter အကြောင်းအရာများပါဝင်တဲ့ Bicep template များ
- **src/** - Sample application code
- **scripts/** - Common task များအတွက် Helper script များ

## 🎯 သင်ယူရည်မှန်းချက်များ

### ဥပမာအမျိုးအစားများ

#### **ရိုးရှင်းသော Deployment များ**
- Single-service application များ
- ရိုးရှင်းသော infrastructure pattern များ
- Basic configuration management
- Development အတွက် အကုန်အကျသက်သာသော setup များ

#### **အဆင့်မြင့် Scenario များ**
- Multi-service architecture များ
- Complex networking configuration များ
- Database integration pattern များ
- Security နဲ့ compliance implementation များ

#### **Production-Ready Pattern များ**
- High availability configuration များ
- Monitoring နဲ့ observability
- CI/CD integration
- Disaster recovery setup များ

## 📖 ဥပမာဖော်ပြချက်များ

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**အဆင့်**: Beginner  
**Concepts**: Basic deployment, REST API, NoSQL database integration

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**အဆင့်**: Beginner  
**Concepts**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry  
**အဆင့်**: Beginner  
**Concepts**: Containerization, microservices architecture, API development

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**အဆင့်**: Intermediate  
**Concepts**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**အဆင့်**: Intermediate  
**Concepts**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**အဆင့်**: Intermediate  
**Concepts**: Microservices communication, distributed systems, enterprise pattern များ

### Azure AI Foundry ဥပမာများ

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**အဆင့်**: Intermediate  
**Concepts**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**အဆင့်**: Intermediate  
**Concepts**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**အဆင့်**: Advanced  
**Concepts**: Model training, deployment pipeline များ, monitoring

## 🛠 Configuration ဥပမာများ

`configurations/` directory မှာ အသုံးပြုနိုင်တဲ့ component များပါဝင်သည်:

### Environment Configuration များ
- Development environment setting များ
- Staging environment configuration များ
- Production-ready configuration များ
- Multi-region deployment setup များ

### Bicep Module များ
- Reusable infrastructure component များ
- Common resource pattern များ
- Security-hardened template များ
- Cost-optimized configuration များ

### Helper Script များ
- Environment setup automation
- Database migration script များ
- Deployment validation tool များ
- Cost monitoring utility များ

## 🔧 Customization လမ်းညွှန်ချက်

### ကိုယ်ပိုင် Use Case အတွက် ဥပမာများကို ပြောင်းလဲခြင်း

1. **Prerequisite များကို ပြန်လည်သုံးသပ်ပါ**
   - Azure service လိုအပ်ချက်များကို စစ်ဆေးပါ
   - Subscription limit များကို အတည်ပြုပါ
   - Cost implication များကို နားလည်ပါ

2. **Configuration ကို ပြောင်းလဲပါ**
   - `azure.yaml` service definition များကို update လုပ်ပါ
   - Bicep template များကို customize လုပ်ပါ
   - Environment variable များကို ပြင်ဆင်ပါ

3. **အပြည့်အဝ စမ်းသပ်ပါ**
   - Development environment မှာ အရင် deploy လုပ်ပါ
   - Functionality ကို အတည်ပြုပါ
   - Scaling နဲ့ performance ကို စမ်းသပ်ပါ

4. **Security Review လုပ်ပါ**
   - Access control များကို ပြန်လည်သုံးသပ်ပါ
   - Secrets management ကို implement လုပ်ပါ
   - Monitoring နဲ့ alerting ကို enable လုပ်ပါ

## 📊 Comparison Matrix

| ဥပမာ | Service များ | Database | Auth | Monitoring | အဆင့် |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 သင်ယူလမ်းကြောင်း

### အကြံပြု Progression

1. **Simple Web App ဖြင့် စတင်ပါ**
   - AZD အခြေခံ concept များကို သင်ယူပါ
   - Deployment workflow ကို နားလည်ပါ
   - Environment management ကို လေ့ကျင့်ပါ

2. **Static Website ကို စမ်းသပ်ပါ**
   - Hosting option များကို လေ့လာပါ
   - CDN integration ကို သင်ယူပါ
   - DNS configuration ကို နားလည်ပါ

3. **Container App ကို ရောက်ပါ**
   - Containerization အခြေခံကို သင်ယူပါ
   - Scaling concept များကို နားလည်ပါ
   - Docker ကို လေ့ကျင့်ပါ

4. **Database Integration ကို ထည့်ပါ**
   - Database provisioning ကို သင်ယူပါ
   - Connection string များကို နားလည်ပါ
   - Secrets management ကို လေ့ကျင့်ပါ

5. **Serverless ကို စမ်းသပ်ပါ**
   - Event-driven architecture ကို နားလည်ပါ
   - Trigger နဲ့ binding များကို သင်ယူပါ
   - API များကို လေ့ကျင့်ပါ

6. **Microservices ကို တည်ဆောက်ပါ**
   - Service communication ကို သင်ယူပါ
   - Distributed system များကို နားလည်ပါ
   - Complex deployment များကို လေ့ကျင့်ပါ

## 🔍 သင့်အတွက် သင့်တော်သော ဥပမာကို ရှာဖွေခြင်း

### Technology Stack အလိုက်
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **Enterprise Production**: **Retail Multi-Agent Solution**

### Architecture Pattern အလိုက်
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: **Retail Multi-Agent Solution**

### Complexity Level အလိုက်
- **Beginner**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermediate**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 အပိုဆောင်း Resources

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### အကောင်းဆုံး လုပ်ဆောင်မှုများ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ဥပမာများကို ပူးပေါင်းပါ

အသုံးဝင်တဲ့ ဥပမာတစ်ခုကို မျှဝေချင်ပါသလား? ကျွန်ုပ်တို့ ပူးပေါင်းမှုများကို ကြိုဆိုပါတယ်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. သတ်မှတ်ထားတဲ့ ဖိုင်ဖွဲ့စည်းမှုကို လိုက်နာပါ
2. ပြည့်စုံတဲ့ README.md ကို ထည့်သွင်းပါ
3. ဖိုင်များ၏ configuration တွင် မှတ်ချက်များ ထည့်သွင်းပါ
4. တင်သွင်းမီ စစ်ဆေးမှုကို ပြည့်စုံစွာ ပြုလုပ်ပါ
5. ကုန်ကျစရိတ်ခန့်မှန်းချက်များနှင့် လိုအပ်ချက်များ ထည့်သွင်းပါ

### ဥပမာ Template ဖွဲ့စည်းမှု
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**အသုံးဝင်သော အကြံပြုချက်**: သင့်နည်းပညာ stack ကို ကိုက်ညီတဲ့ အလွယ်ဆုံး ဥပမာနဲ့ စတင်ပြီး၊ အဆင့်မြင့်တဲ့ အခြေအနေများဆီသို့ တဖြည်းဖြည်း တိုးတက်ပါ။ ဥပမာတစ်ခုစီသည် ယခင်အကြောင်းအရာများကို အခြေခံထားပါသည်။

**နောက်တစ်ဆင့်**: 
- သင့်ကျွမ်းကျင်မှုအဆင့်နှင့် ကိုက်ညီတဲ့ ဥပမာကို ရွေးပါ
- ဥပမာ၏ README တွင်ပါရှိတဲ့ setup လမ်းညွှန်ချက်များကို လိုက်နာပါ
- အတုအယောင်များကို စမ်းသပ်ပါ
- သင်၏ သင်ယူမှုများကို အသိုင်းအဝိုင်းနှင့် မျှဝေပါ

---

**Navigation**
- **ယခင် သင်ခန်းစာ**: [လေ့လာမှု လမ်းညွှန်](../resources/study-guide.md)
- **ပြန်သွားရန်**: [Main README](../README.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:28:30+00:00",
  "source_file": "examples/README.md",
  "language_code": "my"
}
-->
# ဥပမာများ - AZD Template နှင့် Configuration များကို လက်တွေ့ကျကျ အသုံးချခြင်း

## အကျဉ်းချုပ်

ဒီ directory တွင် Azure Developer CLI ကို လက်တွေ့ကျကျ လေ့လာနိုင်ရန် practical ဥပမာများ၊ template များနှင့် အမှန်တကယ်ဖြစ်ပျက်သော အခြေအနေများပါဝင်သည်။ ဤဥပမာများသည် application architecture များနှင့် deployment pattern များအတွက် အပြည့်အစုံ code၊ infrastructure template များနှင့် အသေးစိတ်လမ်းညွှန်ချက်များကို ပေးထားသည်။

## လေ့လာရန် ရည်ရွယ်ချက်များ

ဤဥပမာများကို လေ့လာခြင်းအားဖြင့် သင်သည်:
- အမှန်တကယ် application scenario များနှင့် Azure Developer CLI workflow များကို လေ့ကျင့်နိုင်မည်
- application architecture များနှင့် ၎င်းတို့၏ azd implementation များကို နားလည်နိုင်မည်
- Azure service များအတွက် Infrastructure as Code pattern များကို ကျွမ်းကျင်နိုင်မည်
- configuration management နှင့် environment-specific deployment strategy များကို အသုံးချနိုင်မည်
- monitoring, security, နှင့် scaling pattern များကို လက်တွေ့ကျကျ အကောင်အထည်ဖော်နိုင်မည်
- deployment scenario များကို troubleshooting နှင့် debugging လုပ်နိုင်မည်

## လေ့လာပြီးရရှိမည့် အကျိုးကျေးဇူးများ

ဤဥပမာများကို ပြီးမြောက်စွာ လေ့လာပြီးနောက် သင်သည်:
- Azure Developer CLI ကို အသုံးပြု၍ application အမျိုးမျိုးကို ယုံကြည်စိတ်ချစွာ deploy လုပ်နိုင်မည်
- ပေးထားသော template များကို သင့် application လိုအပ်ချက်များနှင့် ကိုက်ညီအောင် ပြောင်းလဲနိုင်မည်
- Bicep ကို အသုံးပြု၍ custom infrastructure pattern များကို ဒီဇိုင်းဆွဲပြီး အကောင်အထည်ဖော်နိုင်မည်
- dependency များကို သင့်တော်စွာ ချိန်ညှိထားသော complex multi-service application များကို configure လုပ်နိုင်မည်
- လက်တွေ့ scenario များတွင် security, monitoring, နှင့် performance အကောင်းဆုံး လုပ်နည်းများကို အသုံးချနိုင်မည်
- troubleshooting နှင့် optimization ကို လက်တွေ့ကျကျ လုပ်ဆောင်နိုင်မည်

## Directory ဖွဲ့စည်းပုံ

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

## အမြန်စတင်ရန် ဥပမာများ

### Beginner များအတွက်
1. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express web application ကို MongoDB ဖြင့် deploy လုပ်ပါ
2. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - React static website ကို Azure Static Web Apps ဖြင့် host လုပ်ပါ
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - containerized Python Flask application ကို deploy လုပ်ပါ

### Intermediate User များအတွက်
4. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API နှင့် Azure SQL Database ပါဝင်သော web application
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP trigger နှင့် Cosmos DB ပါဝင်သော Python Azure Functions
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container Apps နှင့် API gateway ပါဝင်သော multi-service Java application

### Azure AI Foundry Template များ

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI ဖြင့် Intelligent chat application
2. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI service များကို အသုံးပြု၍ Document analysis
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning ဖြင့် MLOps workflow

## 📋 အသုံးပြုရန် လမ်းညွှန်ချက်များ

### ဥပမာများကို Local မှာ run လုပ်ခြင်း

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

ဥပမာတစ်ခုစီတွင် ပါဝင်သည်:
- **README.md** - setup နှင့် customization လမ်းညွှန်ချက်များ
- **azure.yaml** - AZD configuration နှင့် မှတ်ချက်များ
- **infra/** - parameter ရှင်းလင်းချက်များပါဝင်သော Bicep template များ
- **src/** - sample application code
- **scripts/** - common task များအတွက် helper script များ

## 🎯 လေ့လာရန် ရည်ရွယ်ချက်များ

### ဥပမာအမျိုးအစားများ

#### **Basic Deployments**
- Single-service application များ
- ရိုးရှင်းသော infrastructure pattern များ
- Basic configuration management
- Development အတွက် စျေးသက်သာသော setup များ

#### **Advanced Scenarios**
- Multi-service architecture များ
- ရှုပ်ထွေးသော networking configuration များ
- Database integration pattern များ
- Security နှင့် compliance implementation များ

#### **Production-Ready Pattern များ**
- High availability configuration များ
- Monitoring နှင့် observability
- CI/CD integration
- Disaster recovery setup များ

## 📖 ဥပမာ ရှင်းလင်းချက်များ

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: Basic deployment, REST API, NoSQL database integration

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry  
**Complexity**: Beginner  
**Concepts**: Containerization, microservices architecture, API development

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: Microservices communication, distributed systems, enterprise patterns

### Azure AI Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: Model training, deployment pipelines, monitoring

## 🛠 Configuration ဥပမာများ

`configurations/` directory တွင် အသုံးပြုနိုင်သော component များပါဝင်သည်:

### Environment Configuration များ
- Development environment setting များ
- Staging environment configuration များ
- Production-ready configuration များ
- Multi-region deployment setup များ

### Bicep Module များ
- အသုံးပြုနိုင်သော infrastructure component များ
- ရိုးရှင်းသော resource pattern များ
- Security-hardened template များ
- စျေးသက်သာသော configuration များ

### Helper Script များ
- Environment setup automation
- Database migration script များ
- Deployment validation tool များ
- Cost monitoring utility များ

## 🔧 Customization လမ်းညွှန်ချက်

### သင့် Use Case အတွက် ဥပမာများကို ပြောင်းလဲခြင်း

1. **လိုအပ်ချက်များကို ပြန်လည်သုံးသပ်ပါ**
   - Azure service လိုအပ်ချက်များကို စစ်ဆေးပါ
   - Subscription limit များကို အတည်ပြုပါ
   - စျေးနှုန်းဆိုင်ရာ အကျိုးသက်ရောက်မှုများကို နားလည်ပါ

2. **Configuration ကို ပြောင်းလဲပါ**
   - `azure.yaml` service definition များကို update လုပ်ပါ
   - Bicep template များကို customize လုပ်ပါ
   - Environment variable များကို ချိန်ညှိပါ

3. **အပြည့်အဝ စမ်းသပ်ပါ**
   - Development environment တွင် အရင် deploy လုပ်ပါ
   - Functionality ကို အတည်ပြုပါ
   - Scaling နှင့် performance ကို စမ်းသပ်ပါ

4. **Security ကို ပြန်လည်သုံးသပ်ပါ**
   - Access control များကို ပြန်လည်သုံးသပ်ပါ
   - Secrets management ကို အကောင်အထည်ဖော်ပါ
   - Monitoring နှင့် alerting ကို enable လုပ်ပါ

## 📊 Comparison Matrix

| ဥပမာ | Service များ | Database | Auth | Monitoring | Complexity |
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

## 🎓 Learning Path

### အကြံပြုထားသော လေ့လာမှု အဆင့်များ

1. **Simple Web App ကို စတင်ပါ**
   - AZD အခြေခံ concept များကို လေ့လာပါ
   - Deployment workflow ကို နားလည်ပါ
   - Environment management ကို လေ့ကျင့်ပါ

2. **Static Website ကို စမ်းသပ်ပါ**
   - Hosting option များကို လေ့လာပါ
   - CDN integration ကို နားလည်ပါ
   - DNS configuration ကို လေ့ကျင့်ပါ

3. **Container App ကို စမ်းသပ်ပါ**
   - Containerization အခြေခံကို လေ့လာပါ
   - Scaling concept များကို နားလည်ပါ
   - Docker ကို လေ့ကျင့်ပါ

4. **Database Integration ကို ထည့်သွင်းပါ**
   - Database provisioning ကို လေ့လာပါ
   - Connection string များကို နားလည်ပါ
   - Secrets management ကို လေ့ကျင့်ပါ

5. **Serverless ကို စမ်းသပ်ပါ**
   - Event-driven architecture ကို နားလည်ပါ
   - Trigger နှင့် binding များကို လေ့လာပါ
   - API များကို လေ့ကျင့်ပါ

6. **Microservices ကို တည်ဆောက်ပါ**
   - Service communication ကို လေ့လာပါ
   - Distributed system ကို နားလည်ပါ
   - ရှုပ်ထွေးသော deployment များကို လေ့ကျင့်ပါ

## 🔍 သင့်အတွက် သင့်တော်သော ဥပမာကို ရှာဖွေခြင်း

### Technology Stack အလိုက်
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Architecture Pattern အလိုက်
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Complexity Level အလိုက်
- **Beginner**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Intermediate**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline

## 📚 အပိုဆောင်း ရင်းမြစ်များ

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

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ဥပမာများကို ပံ့ပိုးခြင်း

အသုံးဝင်သော ဥပမာတစ်ခုကို မျှဝေလိုပါသလား? ကျွန်ုပ်တို့သည် ပံ့ပိုးမှုကို ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. ဖွဲ့စည်းပုံကို လိုက်နာပါ
2. Comprehensive README.md ကို ထည့်သွင်းပါ
3. Configuration file များတွင် မှတ်ချက်များ ထည့်သွင်းပါ
4. တင်သွင်းမီ အပြည့်အဝ စမ်းသပ်ပါ
5. စျေးနှုန်းခန့်မှန်းချက်များနှင့် လိုအပ်ချက်များကို ထည့်သွင်းပါ

### ဥပမာ Template ဖွဲ့စည်းပုံ
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

**Pro Tip**: သင့် technology stack နှင့် ကိုက်ညီသော ရိုးရှင်းသော ဥပမာမှ စတင်ပြီး၊ အဆင့်မြင့် scenario များသို့ တဖြည်းဖြည်း ရောက်ရှိပါ။ ဤဥပမာတစ်ခုစီသည် ယခင် concept များကို အခြေခံထားသည်။

**Next Steps**: 
- သင့် skill level နှင့် ကိုက်ညီသော ဥပမာကို ရွေးပါ
- ဥပမာ၏ README တွင်ပါဝင်သော setup လမ်းညွှန်ချက်များကို လိုက်နာပါ
- Customization များကို စမ်းသပ်ပါ
- သင်၏ လေ့လာမှုများကို community နှင့် မျှဝေပါ

---

**Navigation**
- **Previous Lesson**: [Study Guide](../resources/study-guide.md)
- **Return to**: [Main README](../README.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
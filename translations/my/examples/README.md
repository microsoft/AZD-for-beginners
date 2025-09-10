<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-10T07:04:15+00:00",
  "source_file": "examples/README.md",
  "language_code": "my"
}
-->
# ဥပမာများ - AZD Template နှင့် Configuration များကို လက်တွေ့အသုံးပြုခြင်း

## အကျဉ်းချုပ်

ဒီ directory တွင် Azure Developer CLI ကို လက်တွေ့ကျကျ လေ့လာနိုင်ရန် အတွက် အသုံးဝင်သော ဥပမာများ၊ template များနှင့် အမှန်တကယ်ဖြစ်ရပ်များပါဝင်သည်။ ဤဥပမာများတွင် အပြည့်အစုံသော အလုပ်လုပ်နိုင်သော code များ၊ infrastructure template များနှင့် အမျိုးမျိုးသော application architecture များနှင့် deployment pattern များအတွက် အသေးစိတ်ညွှန်ကြားချက်များပါဝင်သည်။

## လေ့လာရမည့် ရည်မှန်းချက်များ

ဤဥပမာများကို လေ့လာပြီးနောက် သင်သည်:
- အမှန်တကယ် application scenario များနှင့်အတူ Azure Developer CLI workflow များကို လေ့ကျင့်နိုင်မည်
- အမျိုးမျိုးသော application architecture များနှင့် ၎င်းတို့၏ azd အကောင်အထည်ဖော်မှုများကို နားလည်နိုင်မည်
- Azure service များအတွက် Infrastructure as Code pattern များကို ကျွမ်းကျင်နိုင်မည်
- Configuration management နှင့် ပတ်ဝန်းကျင်အလိုက် deployment များကို အကောင်အထည်ဖော်နိုင်မည်
- လက်တွေ့အခြေအနေများတွင် monitoring, security နှင့် scaling pattern များကို အသုံးချနိုင်မည်
- အမှန်တကယ် deployment scenario များကို ပြဿနာရှာဖွေခြင်းနှင့် debugging လုပ်ငန်းစဉ်များကို ကျွမ်းကျင်နိုင်မည်

## လေ့လာပြီးရမည့် ရလဒ်များ

ဤဥပမာများကို ပြီးမြောက်စွာ လေ့လာပြီးနောက် သင်သည်:
- Azure Developer CLI ကို အသုံးပြု၍ အမျိုးမျိုးသော application များကို ယုံကြည်စိတ်ချစွာ deploy လုပ်နိုင်မည်
- ပေးထားသော template များကို သင့် application လိုအပ်ချက်များအတွက် ပြောင်းလဲအသုံးပြုနိုင်မည်
- Bicep ကို အသုံးပြု၍ သင့်အလိုက် infrastructure pattern များကို ဒီဇိုင်းဆွဲပြီး အကောင်အထည်ဖော်နိုင်မည်
- Dependency များကို မှန်ကန်စွာ သတ်မှတ်ထားသော complex multi-service application များကို configure လုပ်နိုင်မည်
- လက်တွေ့အခြေအနေများတွင် security, monitoring နှင့် performance အကောင်းဆုံးလေ့ကျင့်မှုများကို အသုံးချနိုင်မည်
- လက်တွေ့အတွေ့အကြုံအပေါ်မူတည်၍ deployment များကို ပြဿနာရှာဖွေပြီး optimize လုပ်နိုင်မည်

## Directory ဖွဲ့စည်းပုံ

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## အစပိုင်း ဥပမာများ

### စတင်သူများအတွက်
1. **[Simple Web App](../../../examples/simple-web-app)** - အခြေခံ Node.js web application တစ်ခုကို deploy လုပ်ခြင်း
2. **[Static Website](../../../examples/static-website)** - Azure Storage တွင် static website တစ်ခုကို host လုပ်ခြင်း
3. **[Container App](../../../examples/container-app)** - Containerized application တစ်ခုကို deploy လုပ်ခြင်း

### အလယ်အလတ် အသုံးပြုသူများအတွက်
4. **[Database App](../../../examples/database-app)** - PostgreSQL database ပါဝင်သော web application
5. **[Serverless Function](../../../examples/serverless-function)** - HTTP trigger များပါဝင်သော Azure Functions
6. **[Microservices](../../../examples/microservices)** - API gateway ပါဝင်သော multi-service application

## 📋 အသုံးပြုရန် ညွှန်ကြားချက်များ

### ဥပမာများကို Local တွင် run လုပ်ခြင်း

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

ဥပမာတိုင်းတွင် ပါဝင်သည်:
- **README.md** - Setup နှင့် customization အတွက် အသေးစိတ်ညွှန်ကြားချက်များ
- **azure.yaml** - Comment များပါဝင်သော AZD configuration
- **infra/** - Parameter ရှင်းလင်းချက်များပါဝင်သော Bicep template များ
- **src/** - Sample application code
- **scripts/** - အထောက်အကူပြု script များ

## 🎯 လေ့လာရမည့် ရည်မှန်းချက်များ

### ဥပမာအမျိုးအစားများ

#### **အခြေခံ Deployment များ**
- Single-service application များ
- ရိုးရှင်းသော infrastructure pattern များ
- အခြေခံ configuration management
- အကုန်အကျသက်သာသော development setup များ

#### **အဆင့်မြင့် အခြေအနေများ**
- Multi-service architecture များ
- ရှုပ်ထွေးသော networking configuration များ
- Database ပေါင်းစည်းမှု pattern များ
- Security နှင့် compliance အကောင်အထည်ဖော်မှုများ

#### **ထုတ်လုပ်မှုအဆင့် Pattern များ**
- High availability configuration များ
- Monitoring နှင့် observability
- CI/CD ပေါင်းစည်းမှု
- Disaster recovery setup များ

## 📖 ဥပမာဖော်ပြချက်များ

### Simple Web App
**Technologies**: Node.js, App Service, Application Insights  
**အဆင့်**: စတင်သူ  
**အကြောင်းအရာများ**: အခြေခံ deployment, environment variable များ, health check များ

### Static Website
**Technologies**: HTML/CSS/JS, Storage Account, CDN  
**အဆင့်**: စတင်သူ  
**အကြောင်းအရာများ**: Static hosting, CDN ပေါင်းစည်းမှု, custom domain များ

### Container App
**Technologies**: Docker, Container Apps, Container Registry  
**အဆင့်**: အလယ်အလတ်  
**အကြောင်းအရာများ**: Containerization, scaling, ingress configuration

### Database App
**Technologies**: Python Flask, PostgreSQL, App Service  
**အဆင့်**: အလယ်အလတ်  
**အကြောင်းအရာများ**: Database connection များ, secrets management, migration များ

### Serverless Function
**Technologies**: Azure Functions, Cosmos DB, API Management  
**အဆင့်**: အလယ်အလတ်  
**အကြောင်းအရာများ**: Event-driven architecture, binding များ, API management

### Microservices
**Technologies**: Multiple services, Service Bus, API Gateway  
**အဆင့်**: အဆင့်မြင့်  
**အကြောင်းအရာများ**: Service communication, message queuing, load balancing

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
- အကုန်အကျသက်သာသော configuration များ

### Helper Script များ
- Environment setup ကို အလိုအလျောက်လုပ်ဆောင်ခြင်း
- Database migration script များ
- Deployment ကို အတည်ပြုစစ်ဆေးခြင်း
- အကုန်အကျ စောင့်ကြည့်မှု tool များ

## 🔧 Customization လမ်းညွှန်

### သင့်လိုအပ်ချက်အတွက် ဥပမာများကို ပြောင်းလဲခြင်း

1. **လိုအပ်ချက်များကို ပြန်လည်စစ်ဆေးပါ**
   - Azure service လိုအပ်ချက်များကို စစ်ဆေးပါ
   - Subscription အကန့်အသတ်များကို စစ်ဆေးပါ
   - အကုန်အကျ သက်သာမှုများကို နားလည်ပါ

2. **Configuration ကို ပြင်ဆင်ပါ**
   - `azure.yaml` service definition များကို update လုပ်ပါ
   - Bicep template များကို customize လုပ်ပါ
   - Environment variable များကို ပြင်ဆင်ပါ

3. **စစ်ဆေးမှုများ ပြုလုပ်ပါ**
   - Development environment တွင် deploy လုပ်ပါ
   - Functionality ကို အတည်ပြုပါ
   - Scaling နှင့် performance ကို စမ်းသပ်ပါ

4. **Security ကို ပြန်လည်သုံးသပ်ပါ**
   - Access control များကို ပြန်လည်စစ်ဆေးပါ
   - Secrets management ကို အကောင်အထည်ဖော်ပါ
   - Monitoring နှင့် alerting ကို enabled လုပ်ပါ

## 📊 နှိုင်းယှဉ်ဇယား

| ဥပမာ | Service များ | Database | Auth | Monitoring | အဆင့် |  
|---------|----------|----------|------|------------|------------|  
| Simple Web App | 1 | ❌ | အခြေခံ | အခြေခံ | ⭐ |  
| Static Website | 1 | ❌ | ❌ | အခြေခံ | ⭐ |  
| Container App | 1 | ❌ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐ |  
| Database App | 2 | ✅ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐⭐ |  
| Serverless Function | 3 | ✅ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐⭐ |  
| Microservices | 5+ | ✅ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐⭐⭐ |  

## 🎓 လေ့လာရေး လမ်းကြောင်း

### အကြံပြုထားသော အဆင့်ဆင့်

1. **Simple Web App ဖြင့် စတင်ပါ**
   - AZD အခြေခံအယူအဆများကို လေ့လာပါ
   - Deployment workflow ကို နားလည်ပါ
   - Environment management ကို လေ့ကျင့်ပါ

2. **Static Website ကို စမ်းသပ်ပါ**
   - Hosting ရွေးချယ်မှုများကို စူးစမ်းပါ
   - CDN ပေါင်းစည်းမှုကို လေ့လာပါ
   - DNS configuration ကို နားလည်ပါ

3. **Container App သို့ ရွှေ့ပါ**
   - Containerization အခြေခံကို လေ့လာပါ
   - Scaling အယူအဆများကို နားလည်ပါ
   - Docker နှင့် လေ့ကျင့်ပါ

4. **Database Integration ကို ထည့်ပါ**
   - Database provisioning ကို လေ့လာပါ
   - Connection string များကို နားလည်ပါ
   - Secrets management ကို လေ့ကျင့်ပါ

5. **Serverless ကို စူးစမ်းပါ**
   - Event-driven architecture ကို နားလည်ပါ
   - Trigger နှင့် binding များကို လေ့လာပါ
   - API များနှင့် လေ့ကျင့်ပါ

6. **Microservices ကို တည်ဆောက်ပါ**
   - Service communication ကို လေ့လာပါ
   - Distributed system များကို နားလည်ပါ
   - ရှုပ်ထွေးသော deployment များကို လေ့ကျင့်ပါ

## 🔍 သင့်အတွက် သင့်လျော်သော ဥပမာ ရှာဖွေခြင်း

### Technology Stack အလိုက်
- **Node.js**: Simple Web App, Microservices  
- **Python**: Database App, Serverless Function  
- **Static Sites**: Static Website  
- **Containers**: Container App, Microservices  
- **Databases**: Database App, Serverless Function  

### Architecture Pattern အလိုက်
- **Monolithic**: Simple Web App, Database App  
- **Static**: Static Website  
- **Microservices**: Microservices example  
- **Serverless**: Serverless Function  
- **Hybrid**: Container App  

### အဆင့်အလိုက်
- **စတင်သူ**: Simple Web App, Static Website  
- **အလယ်အလတ်**: Container App, Database App, Serverless Function  
- **အဆင့်မြင့်**: Microservices  

## 📚 အပိုဆောင်း အရင်းအမြစ်များ

### Documentation Links
- [AZD Template Specification](https://aka.ms/azd/templates)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community Examples
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)  

### အကောင်းဆုံး လေ့ကျင့်မှုများ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 ဥပမာများကို ပံ့ပိုးခြင်း

အသုံးဝင်သော ဥပမာတစ်ခုကို မျှဝေလိုပါသလား? ကျွန်ုပ်တို့သည် ပံ့ပိုးမှုများကို ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. သတ်မှတ်ထားသော directory ဖွဲ့စည်းပုံကို လိုက်နာပါ  
2. Comprehensive README.md ကို ထည့်သွင်းပါ  
3. Configuration ဖိုင်များတွင် comment များထည့်ပါ  
4. တင်သွင်းမီ စစ်ဆေးမှုများ ပြုလုပ်ပါ  
5. အကုန်အကျ ခန့်မှန်းချက်များနှင့် လိုအပ်ချက်များကို ထည့်သွင်းပါ  

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

**အကြံပြုချက်**: သင့် technology stack နှင့် ကိုက်ညီသော အလွယ်ဆုံး ဥပမာမှ စတင်ပြီး၊ အဆင့်မြင့်သော အခြေအနေများသို့ တဖြည်းဖြည်း ရွှေ့ပါ။ ဥပမာတိုင်းသည် ယခင်အကြောင်းအရာများအပေါ် အခြေခံထားသည်။

**နောက်တစ်ဆင့်**:  
- သင့်ကျွမ်းကျင်မှုအဆင့်နှင့် ကိုက်ညီသော ဥပမာတစ်ခုကို ရွေးပါ  
- ဥပမာ၏ README တွင်ပါရှိသော setup ညွှန်ကြားချက်များကို လိုက်နာပါ  
- Customization များကို စမ်းသပ်ပါ  
- သင့်လေ့လာမှုများကို community နှင့် မျှဝေပါ  

---

**Navigation**  
- **ယခင်သင်ခန်းစာ**: [Study Guide](../resources/study-guide.md)  
- **ပြန်သွားရန်**: [Main README](../README.md)  

---

**ဝက်ဘ်ဆိုက်မှတ်ချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက်ဘာသာပြန်ဆိုမှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာစကားဖြင့် အာဏာတည်သောရင်းမြစ်အဖြစ် သတ်မှတ်ရန် လိုအပ်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ အတည်ပြုထားသော ဘာသာပြန်ဆိုမှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုမှားများ သို့မဟုတ် အဓိပ္ပာယ်မှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
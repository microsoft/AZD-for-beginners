<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:28:35+00:00",
  "source_file": "examples/README.md",
  "language_code": "my"
}
-->
# ဥပမာများ - AZD Template နှင့် Configuration များကို လက်တွေ့အသုံးပြုခြင်း

## အကျဉ်းချုပ်

ဒီ directory တွင် Azure Developer CLI ကို လက်တွေ့ကျကျ သင်ယူနိုင်ရန် အတွက် အသုံးဝင်သော ဥပမာများ၊ template များနှင့် အမှန်တကယ်ဖြစ်ရပ်များပါဝင်သည်။ ဤဥပမာများတွင် အပြည့်အစုံသော အလုပ်လုပ်နိုင်သော code များ၊ infrastructure template များနှင့် အမျိုးမျိုးသော application architecture များနှင့် deployment ပုံစံများအတွက် အသေးစိတ်ညွှန်ကြားချက်များပါဝင်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤဥပမာများကို လေ့လာခြင်းဖြင့် သင်သည်:
- အမှန်တကယ် application အခြေအနေများနှင့်အတူ Azure Developer CLI workflow များကို လေ့ကျင့်နိုင်မည်
- အမျိုးမျိုးသော application architecture များနှင့် ၎င်းတို့၏ azd အကောင်အထည်ဖော်မှုများကို နားလည်နိုင်မည်
- Azure ဝန်ဆောင်မှုများအတွက် Infrastructure as Code ပုံစံများကို ကျွမ်းကျင်နိုင်မည်
- Configuration management နှင့် ပတ်ဝန်းကျင်အလိုက် deployment များကို အကောင်အထည်ဖော်နိုင်မည်
- လက်တွေ့အခြေအနေများတွင် monitoring, security နှင့် scaling ပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- အမှန်တကယ် deployment အခြေအနေများကို ပြဿနာရှာဖွေခြင်းနှင့် debugging လုပ်ငန်းစဉ်များကို ကျွမ်းကျင်နိုင်မည်

## သင်ယူပြီးရမည့် ရလဒ်များ

ဤဥပမာများကို ပြီးမြောက်စွာ လေ့လာပြီးပါက သင်သည်:
- Azure Developer CLI ကို အသုံးပြု၍ အမျိုးမျိုးသော application များကို ယုံကြည်စိတ်ချစွာ deploy လုပ်နိုင်မည်
- ပေးထားသော template များကို သင့် application လိုအပ်ချက်များအတွက် ပြောင်းလဲအသုံးပြုနိုင်မည်
- Bicep ကို အသုံးပြု၍ ကိုယ်ပိုင် infrastructure ပုံစံများကို ဒီဇိုင်းဆွဲပြီး အကောင်အထည်ဖော်နိုင်မည်
- Dependency များကို မှန်ကန်စွာ သတ်မှတ်ထားသော complex multi-service application များကို configure လုပ်နိုင်မည်
- လက်တွေ့အခြေအနေများတွင် security, monitoring နှင့် performance အကောင်းဆုံးလက်တွေ့ကျကျနည်းလမ်းများကို အသုံးပြုနိုင်မည်
- လက်တွေ့အတွေ့အကြုံအပေါ်မူတည်၍ deployment များကို ပြဿနာရှာဖွေပြီး အကောင်းဆုံးအခြေအနေသို့ optimize လုပ်နိုင်မည်

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

## အမြန်စတင်နိုင်သော ဥပမာများ

### စတင်သူများအတွက်
1. **[Simple Web App](../../../examples/simple-web-app)** - အခြေခံ Node.js web application တစ်ခုကို deploy လုပ်ခြင်း  
2. **[Static Website](../../../examples/static-website)** - Azure Storage တွင် static website တစ်ခုကို host လုပ်ခြင်း  
3. **[Container App](../../../examples/container-app)** - Containerized application တစ်ခုကို deploy လုပ်ခြင်း  

### အလယ်အလတ် အသုံးပြုသူများအတွက်
4. **[Database App](../../../examples/database-app)** - PostgreSQL database ပါဝင်သော web application  
5. **[Serverless Function](../../../examples/serverless-function)** - HTTP trigger များပါဝင်သော Azure Functions  
6. **[Microservices](../../../examples/microservices)** - API gateway ပါဝင်သော multi-service application  

## 📋 အသုံးပြုရန်ညွှန်ကြားချက်များ

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
- **scripts/** - အထောက်အကူပြုလုပ်ငန်းများအတွက် helper script များ  

## 🎯 သင်ယူရမည့် ရည်မှန်းချက်များ

### ဥပမာအမျိုးအစားများ

#### **အခြေခံ Deployment များ**
- Single-service application များ  
- ရိုးရှင်းသော infrastructure ပုံစံများ  
- အခြေခံ configuration management  
- စျေးနှုန်းသက်သာသော development setup များ  

#### **အဆင့်မြင့် အခြေအနေများ**
- Multi-service architecture များ  
- ရှုပ်ထွေးသော networking configuration များ  
- Database ပေါင်းစည်းမှု ပုံစံများ  
- Security နှင့် compliance အကောင်အထည်ဖော်မှုများ  

#### **ထုတ်လုပ်မှုအဆင့် ပုံစံများ**
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

`configurations/` directory တွင် ပြန်လည်အသုံးပြုနိုင်သော component များပါဝင်သည်:

### Environment Configuration များ
- Development environment setting များ  
- Staging environment configuration များ  
- Production-ready configuration များ  
- Multi-region deployment setup များ  

### Bicep Module များ
- ပြန်လည်အသုံးပြုနိုင်သော infrastructure component များ  
- ရိုးရှင်းသော resource ပုံစံများ  
- Security-hardened template များ  
- စျေးနှုန်းသက်သာသော configuration များ  

### Helper Script များ
- Environment setup ကို အလိုအလျောက်လုပ်ဆောင်ခြင်း  
- Database migration script များ  
- Deployment ကို အတည်ပြုစစ်ဆေးခြင်း  
- စျေးနှုန်းကို စောင့်ကြည့်ခြင်း  

## 🔧 Customization လမ်းညွှန်

### သင့်လိုအပ်ချက်အတွက် ဥပမာများကို ပြောင်းလဲခြင်း

1. **လိုအပ်ချက်များကို ပြန်လည်သုံးသပ်ပါ**
   - Azure ဝန်ဆောင်မှုလိုအပ်ချက်များကို စစ်ဆေးပါ  
   - Subscription အကန့်အသတ်များကို အတည်ပြုပါ  
   - စျေးနှုန်းဆိုင်ရာ သက်ရောက်မှုများကို နားလည်ပါ  

2. **Configuration ကို ပြောင်းလဲပါ**
   - `azure.yaml` service definition များကို update လုပ်ပါ  
   - Bicep template များကို customize လုပ်ပါ  
   - Environment variable များကို ပြင်ဆင်ပါ  

3. **စစ်ဆေးမှုကို အပြည့်အဝ ပြုလုပ်ပါ**
   - Development environment တွင် အရင် deploy လုပ်ပါ  
   - Functionality ကို အတည်ပြုပါ  
   - Scaling နှင့် performance ကို စမ်းသပ်ပါ  

4. **Security ကို ပြန်လည်သုံးသပ်ပါ**
   - Access control များကို ပြန်လည်စစ်ဆေးပါ  
   - Secrets management ကို အကောင်အထည်ဖော်ပါ  
   - Monitoring နှင့် alerting ကို enabled လုပ်ပါ  

## 📊 နှိုင်းယှဉ်ဇယား

| ဥပမာ | ဝန်ဆောင်မှုများ | Database | Auth | Monitoring | အဆင့် |  
|---------|----------|----------|------|------------|------------|  
| Simple Web App | 1 | ❌ | အခြေခံ | အခြေခံ | ⭐ |  
| Static Website | 1 | ❌ | ❌ | အခြေခံ | ⭐ |  
| Container App | 1 | ❌ | အခြေခံ | အပြည့်အစုံ | ⭐⭐ |  
| Database App | 2 | ✅ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐⭐ |  
| Serverless Function | 3 | ✅ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐⭐ |  
| Microservices | 5+ | ✅ | အပြည့်အစုံ | အပြည့်အစုံ | ⭐⭐⭐⭐ |  

## 🎓 သင်ယူမှုလမ်းကြောင်း

### အကြံပြုထားသော အဆင့်ဆင့်လမ်းညွှန်

1. **Simple Web App ဖြင့် စတင်ပါ**
   - AZD အခြေခံအယူအဆများကို သင်ယူပါ  
   - Deployment workflow ကို နားလည်ပါ  
   - Environment management ကို လေ့ကျင့်ပါ  

2. **Static Website ကို စမ်းသပ်ပါ**
   - Hosting ရွေးချယ်မှုများကို စူးစမ်းပါ  
   - CDN ပေါင်းစည်းမှုကို သင်ယူပါ  
   - DNS configuration ကို နားလည်ပါ  

3. **Container App သို့ ရောက်ပါ**
   - Containerization အခြေခံအယူအဆများကို သင်ယူပါ  
   - Scaling အယူအဆများကို နားလည်ပါ  
   - Docker နှင့် လေ့ကျင့်ပါ  

4. **Database Integration ကို ထည့်ပါ**
   - Database provisioning ကို သင်ယူပါ  
   - Connection string များကို နားလည်ပါ  
   - Secrets management ကို လေ့ကျင့်ပါ  

5. **Serverless ကို စူးစမ်းပါ**
   - Event-driven architecture ကို နားလည်ပါ  
   - Trigger နှင့် binding များကို သင်ယူပါ  
   - API များနှင့် လေ့ကျင့်ပါ  

6. **Microservices ကို တည်ဆောက်ပါ**
   - Service communication ကို သင်ယူပါ  
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

## 📚 ထပ်မံသင်ယူရန် အရင်းအမြစ်များ

### Documentation Links
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community Examples
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 ဥပမာများကို ပံ့ပိုးမှု

အသုံးဝင်သော ဥပမာတစ်ခုကို မျှဝေလိုပါသလား? ကျွန်ုပ်တို့သည် ပံ့ပိုးမှုကို ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. သတ်မှတ်ထားသော directory ဖွဲ့စည်းပုံကို လိုက်နာပါ  
2. အပြည့်အစုံသော README.md ကို ထည့်သွင်းပါ  
3. Configuration ဖိုင်များတွင် comment များထည့်ပါ  
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

**အထောက်အကူပြု အကြံပြုချက်**: သင့် technology stack နှင့် ကိုက်ညီသော အလွယ်ဆုံး ဥပမာမှ စတင်ပြီး၊ အဆင့်မြင့်သော အခြေအနေများသို့ တဖြည်းဖြည်း ရောက်ရှိပါ။ ဥပမာတိုင်းသည် ယခင်အကြောင်းအရာများကို အခြေခံထားသည်။

**နောက်တစ်ဆင့်**:  
- သင့်ကျွမ်းကျင်မှုအဆင့်နှင့် ကိုက်ညီသော ဥပမာတစ်ခုကို ရွေးချယ်ပါ  
- ဥပမာ၏ README တွင်ပါရှိသော setup ညွှန်ကြားချက်များကို လိုက်နာပါ  
- Customization များကို စမ်းသပ်ပါ  
- သင်၏ သင်ယူမှုများကို community နှင့် မျှဝေပါ  

---

**Navigation**  
- **ယခင်သင်ခန်းစာ**: [Study Guide](../resources/study-guide.md)  
- **ပြန်သွားရန်**: [Main README](../README.md)  

---

**ဝက်ဘ်ဆိုက်မှတ်ချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက်ဘာသာပြန်ဆိုမှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာစကားဖြင့် အာဏာတည်သောရင်းမြစ်အဖြစ် သတ်မှတ်ပါ။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပြန်ဆိုမှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုမှားများ သို့မဟုတ် အဓိပ္ပာယ်မှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
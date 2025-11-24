<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-23T22:32:18+00:00",
  "source_file": "examples/README.md",
  "language_code": "my"
}
-->
# ဥပမာများ - AZD Template နှင့် Configuration များအတွက် လက်တွေ့အသုံးပြုနိုင်သော လမ်းညွှန်

**ဥပမာများမှ သင်ယူခြင်း - အခန်းအလိုက် စီစဉ်ထားခြင်း**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 အခန်းအလိုက် စီစဉ်မှု**: သင်ယူမှု အခက်အခဲအလိုက် စီစဉ်ထားသော ဥပမာများ
- **🚀 ဒေသတွင်း ဥပမာ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 ပြင်ပ AI ဥပမာများ**: Azure Samples repositories link များ

> **📍 အရေးကြီး: ဒေသတွင်း vs ပြင်ပ ဥပမာများ**  
> ဤ repository တွင် **အပြည့်အစုံသော ဒေသတွင်း ဥပမာ ၄ ခု** ပါဝင်ပြီး အကောင်အထည်ဖော်ထားသည်။  
> - **Azure OpenAI Chat** (GPT-4 chat interface ဖြင့် deployment)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> အပိုဆောင်း ဥပမာများမှာ Azure-Samples repositories မှ **ပြင်ပ ရင်းမြစ်များ** ဖြစ်ပြီး clone လုပ်နိုင်ပါသည်။

## နိဒါန်း

ဤ directory သည် Azure Developer CLI ကို လက်တွေ့ကျကျ လေ့ကျင့်ရန်အတွက် လက်တွေ့ ဥပမာများနှင့် ရင်းမြစ်များကို ပံ့ပိုးပေးသည်။ Retail Multi-Agent scenario သည် ဤ repository တွင် ပါဝင်သော အပြည့်အစုံ၊ ထုတ်လုပ်မှုအဆင့် အကောင်အထည်ဖော်မှုဖြစ်သည်။ အပိုဆောင်း ဥပမာများမှာ AZD pattern များကို ပြသသည့် တရားဝင် Azure Samples များကို ရည်ညွှန်းသည်။

### အခက်အခဲ အဆင့်သတ်မှတ်ချက်

- ⭐ **Beginner** - အခြေခံအကြောင်းအရာများ၊ တစ်ခုတည်းသော service၊ ၁၅-၃၀ မိနစ်
- ⭐⭐ **Intermediate** - အများအပြားသော service များ၊ database ပေါင်းစည်းမှု၊ ၃၀-၆၀ မိနစ်
- ⭐⭐⭐ **Advanced** - ရှုပ်ထွေးသော architecture၊ AI ပေါင်းစည်းမှု၊ ၁-၂ နာရီ
- ⭐⭐⭐⭐ **Expert** - ထုတ်လုပ်မှုအဆင့်၊ စီးပွားရေး pattern များ၊ ၂ နာရီနှင့်အထက်

## 🎯 ဤ Repository တွင် ပါဝင်သော အချက်အလက်များ

### ✅ ဒေသတွင်း အကောင်အထည်ဖော်မှု (အသုံးပြုရန် အသင့်)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**ဤ repo တွင် ပါဝင်သော GPT-4 deployment နှင့် chat interface အပြည့်အစုံ**

- **တည်နေရာ**: `examples/azure-openai-chat/`
- **အခက်အခဲ**: ⭐⭐ (Intermediate)
- **ပါဝင်သောအရာများ**:
  - Azure OpenAI deployment (GPT-4) အပြည့်အစုံ
  - Python command-line chat interface
  - API key များအတွက် Key Vault ပေါင်းစည်းမှု
  - Bicep infrastructure templates
  - Token အသုံးပြုမှုနှင့် ကုန်ကျစရိတ် ထိန်းချုပ်မှု
  - Rate limiting နှင့် error handling

**Quick Start:**
```bash
# ဥပမာသို့သွားပါ
cd examples/azure-openai-chat

# အားလုံးကိုဖြန့်ချိပါ
azd up

# လိုအပ်သောအရာများကိုတပ်ဆင်ပြီးစကားပြောရန်စတင်ပါ
pip install -r src/requirements.txt
python src/chat.py
```

**နည်းပညာများ**: Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ဤ repo တွင် ပါဝင်သော container deployment ဥပမာများ**

- **တည်နေရာ**: `examples/container-app/`
- **အခက်အခဲ**: ⭐-⭐⭐⭐⭐ (Beginner မှ Advanced အထိ)
- **ပါဝင်သောအရာများ**:
  - [Master Guide](container-app/README.md) - container deployment များအတွက် အပြည့်အစုံ လမ်းညွှန်
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - အခြေခံ REST API ဥပမာ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ထုတ်လုပ်မှုအဆင့် multi-service deployment
  - Quick Start, Production, နှင့် Advanced pattern များ
  - Monitoring, security, နှင့် cost optimization

**Quick Start:**
```bash
# မာစတာလမ်းညွှန်ကိုကြည့်ပါ
cd examples/container-app

# ရိုးရှင်းသော Flask API ကိုထုတ်လုပ်ပါ
cd simple-flask-api
azd up

# မိုက်ခရိုဆာဗစ်များနမူနာကိုထုတ်လုပ်ပါ
cd ../microservices
azd up
```

**နည်းပညာများ**: Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ဤ repo တွင် ပါဝင်သော ထုတ်လုပ်မှုအဆင့် အကောင်အထည်ဖော်မှု**

- **တည်နေရာ**: `examples/retail-multiagent-arm-template/`
- **အခက်အခဲ**: ⭐⭐⭐⭐ (Advanced)
- **ပါဝင်သောအရာများ**:
  - ARM deployment template အပြည့်အစုံ
  - Multi-agent architecture (Customer + Inventory)
  - Azure OpenAI ပေါင်းစည်းမှု
  - AI Search with RAG
  - Monitoring အပြည့်အစုံ
  - One-click deployment script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**နည်းပညာများ**: Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ပြင်ပ Azure Samples (Clone လုပ်ရန်)

အောက်ပါ ဥပမာများကို တရားဝင် Azure-Samples repositories တွင် ထိန်းသိမ်းထားသည်။ AZD pattern များကို လေ့လာရန် clone လုပ်ပါ:

### အခြေခံ အပလီကေးရှင်းများ (အခန်း ၁-၂)

| Template | Repository | အခက်အခဲ | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**အသုံးပြုရန် နည်းလမ်း:**
```bash
# မည်သည့်နမူနာမဆို ကူးယူပါ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# တင်သွင်းပါ
azd up
```

### AI အပလီကေးရှင်း ဥပမာများ (အခန်း ၂, ၅, ၈)

| Template | Repository | အခက်အခဲ | အဓိက |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | အခြေခံ AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | စီးပွားရေး AI |

### Database & Advanced Patterns (အခန်း ၃-၈)

| Template | Repository | အခက်အခဲ | အဓိက |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## သင်ယူရည်မှန်းချက်များ

ဤဥပမာများကို လေ့ကျင့်ခြင်းဖြင့် သင်သည်:
- လက်တွေ့ကျကျ application scenario များဖြင့် Azure Developer CLI workflow များကို လေ့ကျင့်နိုင်မည်
- အမျိုးမျိုးသော application architecture များနှင့် ၎င်းတို့၏ azd implementation များကို နားလည်နိုင်မည်
- Azure service များအတွက် Infrastructure as Code pattern များကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- Configuration management နှင့် ပတ်ဝန်းကျင်အလိုက် deployment strategy များကို အသုံးချနိုင်မည်
- Monitoring, security, နှင့် scaling pattern များကို လက်တွေ့ context များတွင် အကောင်အထည်ဖော်နိုင်မည်
- လက်တွေ့ deployment scenario များတွင် ပြဿနာရှာဖွေခြင်းနှင့် debugging လုပ်ငန်းစဉ်များကို ကျွမ်းကျင်စွာ ဆောင်ရွက်နိုင်မည်

## သင်ယူရလဒ်များ

ဤဥပမာများကို ပြီးမြောက်စွာ လေ့ကျင့်ပြီးပါက သင်သည်:
- Azure Developer CLI ကို အသုံးပြု၍ အမျိုးမျိုးသော application များကို ယုံကြည်စွာ deploy လုပ်နိုင်မည်
- ပေးထားသော template များကို သင့် application လိုအပ်ချက်များအတွက် ပြောင်းလဲနိုင်မည်
- Bicep အသုံးပြု၍ မိမိစိတ်ကြိုက် infrastructure pattern များကို ဒီဇိုင်းဆွဲပြီး အကောင်အထည်ဖော်နိုင်မည်
- Dependency များကို မှန်ကန်စွာ ပေါင်းစည်းထားသော ရှုပ်ထွေးသော multi-service application များကို configure လုပ်နိုင်မည်
- လက်တွေ့ scenario များတွင် security, monitoring, နှင့် performance အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို အသုံးပြုနိုင်မည်
- လက်တွေ့ deployment များကို troubleshooting နှင့် optimize လုပ်နိုင်မည်

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

> **💡 AZD အသစ်စတင်သူများအတွက်**: ဥပမာ #1 (Flask API) ဖြင့် စတင်ပါ - ၂၀ မိနစ်ခန့်သာ ကြာပြီး အခြေခံအကြောင်းအရာများကို သင်ပေးပါသည်။

### Beginner များအတွက်
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Scale-to-zero ဖြင့် အခြေခံ REST API တစ်ခုကို deploy လုပ်ပါ  
   **အချိန်**: ၂၀-၂၅ မိနစ် | **ကုန်ကျစရိတ်**: $0-5/month  
   **သင်လေ့လာမည့်အရာများ**: အခြေခံ azd workflow, containerization, health probes  
   **မျှော်မှန်းရလဒ်**: "Hello, World!" ပြန်ပေးသော monitoring ပါဝင်သည့် API endpoint

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB ဖြင့် Node.js Express web application တစ်ခု deploy လုပ်ပါ  
   **အချိန်**: ၂၅-၃၅ မိနစ် | **ကုန်ကျစရိတ်**: $10-30/month  
   **သင်လေ့လာမည့်အရာများ**: Database integration, environment variables, connection strings  
   **မျှော်မှန်းရလဒ်**: Create/read/update/delete လုပ်ဆောင်နိုင်သည့် Todo list app

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ဖြင့် React static website တစ်ခု host လုပ်ပါ  
   **အချိန်**: ၂၀-၃၀ မိနစ် | **ကုန်ကျစရိတ်**: $0-10/month  
   **သင်လေ့လာမည့်အရာများ**: Static hosting, serverless functions, CDN deployment  
   **မျှော်မှန်းရလဒ်**: React UI နှင့် API backend, automatic SSL, global CDN

### Intermediate အသုံးပြုသူများအတွက်
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   GPT-4 နှင့် chat interface ကို secure API key management ဖြင့် deploy လုပ်ပါ  
   **အချိန်**: ၃၅-၄၅ မိနစ် | **ကုန်ကျစရိတ်**: $50-200/month  
   **သင်လေ့လာမည့်အရာများ**: Azure OpenAI deployment, Key Vault integration, token tracking  
   **မျှော်မှန်းရလဒ်**: GPT-4 နှင့် cost monitoring ပါဝင်သည့် chat application

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   ထုတ်လုပ်မှုအဆင့် multi-service architecture  
   **အချိန်**: ၄၅-၆၀ မိနစ် | **ကုန်ကျစရိတ်**: $50-150/month  
   **သင်လေ့လာမည့်အရာများ**: Service communication, message queuing, distributed tracing  
   **မျှော်မှန်းရလဒ်**: Monitoring ပါဝင်သည့် 2-service system (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API နှင့် Azure SQL Database ပါဝင်သည့် web application  
   **အချိန်**: ၃၀-၄၅ မိနစ် | **ကုန်ကျစရိတ်**: $20-80/month  
   **သင်လေ့လာမည့်အရာများ**: Entity Framework, database migrations, connection security  
   **မျှော်မှန်းရလဒ်**: Azure SQL backend နှင့် automatic schema deployment ပါဝင်သည့် C# API

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP triggers နှင့် Cosmos DB ပါဝင်သည့် Python Azure Functions  
   **အချိန်**: ၃၀-၄၀ မိနစ် | **ကုန်ကျစရိတ်**: $10-40/month  
   **သင်လေ့လာမည့်အရာများ**: Event-driven architecture, serverless scaling, NoSQL integration  
   **မျှော်မှန်းရလဒ်**: Cosmos DB storage ဖြင့် HTTP requests ကို တုံ့ပြန်သော Function app

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps နှင့် API gateway ပါဝင်သည့် multi-service Java application  
   **အချိန်**: ၆၀-၉၀ မိနစ် | **ကုန်ကျစရိတ်**: $80-200/month  
   **သင်လေ့လာမည့်အရာများ**: Spring Boot deployment, service mesh, load balancing  
   **မျှော်မှန်းရလဒ်**: Service discovery နှင့် routing ပါဝင်သည့် multi-service Java system

### Azure AI Foundry Template များ

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   GPT-4 deployment နှင့် chat interface အပြည့်အစုံ  
   **အချိန်**: ၃၅-၄၅ မိနစ် | **ကုန်ကျစရိတ်**: $50-200/month  
   **မျှော်မှန်းရလဒ်**: Token tracking နှင့် cost monitoring ပါဝင်သည့် chat application

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG architecture ဖြင့် intelligent chat application  
   **အချိန်**: ၆၀-၉၀ မိနစ် | **ကုန်ကျစရိတ်**: $100-300/month  
   **မျှော်မှန်းရလဒ်**: Document search နှင့် citations ပါဝင်သည့် RAG-powered chat interface

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI services အသုံးပြု၍ document analysis  
   **အချိန်**: ၄၀-၆၀ မိနစ် | **ကုန်ကျစရိတ်**: $20-80/month  
   **မျှော်မှန်းရလဒ်**: Upload လုပ်ထားသော document များမှ text, tables, နှင့် entities ကို API ဖြင့် extract လုပ်ခြင်း

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/ml
- **ထုတ်လုပ်မှုအခြေခံအဆောက်အအုံ**: Multi-region Azure OpenAI တည်ဆောက်မှုများ၊ AI ရှာဖွေမှု၊ Container Apps နှင့် စုံလင်သောစောင့်ကြည့်မှု
- **အသင့်အသုံးပြုနိုင်သော ARM Template**: တစ်ချက်နှိပ်ပြီး deployment ပြုလုပ်နိုင်မှု၊ အမျိုးမျိုးသော configuration modes (Minimal/Standard/Premium) ဖြင့်
- **အဆင့်မြင့်အင်္ဂါရပ်များ**: Red teaming လုံခြုံရေးစစ်ဆေးမှု၊ agent အကဲဖြတ်မှုစနစ်၊ ကုန်ကျစရိတ်အပေါ်ထိန်းချုပ်မှုနှင့် ပြဿနာဖြေရှင်းလမ်းညွှန်များ
- **စစ်မှန်သောစီးပွားရေးအခြေအနေ**: Retailer ဖောက်သည်ပံ့ပိုးမှုအတွက် file upload, search integration နှင့် dynamic scaling ပါဝင်သော use case

**နည်းပညာများ**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐⭐ (အဆင့်မြင့် - စီးပွားရေးထုတ်လုပ်မှုအဆင့်)

**အကောင်းဆုံးသင့်လျော်မှု**: AI ဖွံ့ဖြိုးရေးသူများ၊ solution architects များနှင့် ထုတ်လုပ်မှု multi-agent စနစ်များတည်ဆောက်နေသောအဖွဲ့များ

**အမြန်စတင်ရန်**: `./deploy.sh -g myResourceGroup` ဖြင့် ARM template ကို အသုံးပြု၍ ၃၀ မိနစ်အတွင်း အပြည့်အစုံဖြေရှင်းချက်ကို deploy ပြုလုပ်ပါ။

## 📋 အသုံးပြုမှုညွှန်ကြားချက်များ

### လိုအပ်ချက်များ

မည်သည့်ဥပမာကိုမဆို run မပြုမီ:
- ✅ Owner သို့မဟုတ် Contributor access ပါသော Azure subscription
- ✅ Azure Developer CLI install ပြုလုပ်ပြီး ([Installation Guide](../docs/getting-started/installation.md))
- ✅ Docker Desktop run လုပ်နေ (container ဥပမာများအတွက်)
- ✅ သင့်လျော်သော Azure quotas (ဥပမာ-specific လိုအပ်ချက်များကိုစစ်ဆေးပါ)

> **💰 ကုန်ကျစရိတ်သတိပေးချက်**: ဤဥပမာများသည် အမှန်တကယ် Azure resources များကိုဖန်တီးပြီး ကုန်ကျစရိတ်ရှိစေသည်။ တစ်ခုချင်းစီ README ဖိုင်များတွင် ကုန်ကျစရိတ်ခန့်မှန်းချက်များကိုကြည့်ပါ။ အဆင့်သတ်မှတ်ပြီးနောက် `azd down` ကို run လုပ်ပါ။

### ဥပမာများကို ဒေသတွင်းတွင် run လုပ်ခြင်း

1. **ဥပမာကို Clone သို့မဟုတ် Copy ပြုလုပ်ပါ**
   ```bash
   # ရွေးချယ်လိုသော နမူနာသို့ သွားပါ
   cd examples/simple-web-app
   ```

2. **AZD Environment ကို Initialize ပြုလုပ်ပါ**
   ```bash
   # ရှိပြီးသား template ကို စတင်ပါ
   azd init
   
   # သို့မဟုတ် အခြား environment အသစ်တစ်ခုကို ဖန်တီးပါ
   azd env new my-environment
   ```

3. **Environment ကို Configure ပြုလုပ်ပါ**
   ```bash
   # လိုအပ်သောအပြောင်းလဲများကို သတ်မှတ်ပါ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy ပြုလုပ်ပါ**
   ```bash
   # အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်းကို တင်သွင်းပါ
   azd up
   ```

5. **Deployment ကို Verify ပြုလုပ်ပါ**
   ```bash
   # ဝန်ဆောင်မှုအဆုံးစွန်များကိုရယူပါ
   azd env get-values
   
   # အဆုံးစွန်ကိုစမ်းသပ်ပါ (ဥပမာ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **အောင်မြင်မှုအညွှန်းများ:**
   - ✅ `azd up` အမှားမရှိဘဲပြီးဆုံးသည်
   - ✅ Service endpoint သည် HTTP 200 ကိုပြန်ပေးသည်
   - ✅ Azure Portal တွင် "Running" status ပြသသည်
   - ✅ Application Insights သို့ telemetry ရောက်ရှိနေသည်

> **⚠️ ပြဿနာများ?** Deployment troubleshooting အတွက် [Common Issues](../docs/troubleshooting/common-issues.md) ကိုကြည့်ပါ။

### ဥပမာများကို ပြင်ဆင်ခြင်း

ဥပမာတစ်ခုချင်းစီတွင်ပါဝင်သည်:
- **README.md** - အသေးစိတ် setup နှင့် customization ညွှန်ကြားချက်များ
- **azure.yaml** - AZD configuration (မှတ်ချက်များပါဝင်သည်)
- **infra/** - Bicep templates (parameter ရှင်းလင်းချက်များပါဝင်သည်)
- **src/** - နမူနာ application code
- **scripts/** - သုံးစွဲမှုများအတွက် အကူအညီ script များ

## 🎯 သင်ယူမှုရည်မှန်းချက်များ

### ဥပမာအမျိုးအစားများ

#### **အခြေခံ Deployment များ**
- Single-service applications
- ရိုးရှင်းသော infrastructure patterns
- အခြေခံ configuration management
- ကုန်ကျစရိတ်သက်သာသော ဖွံ့ဖြိုးရေး setup များ

#### **အဆင့်မြင့်အခြေအနေများ**
- Multi-service architectures
- ရှုပ်ထွေးသော networking configurations
- Database integration patterns
- လုံခြုံရေးနှင့်လိုက်နာမှုဆိုင်ရာအကောင်အထည်ဖော်မှုများ

#### **ထုတ်လုပ်မှုအဆင့်ပုံစံများ**
- High availability configurations
- Monitoring နှင့် observability
- CI/CD integration
- Disaster recovery setups

## 📖 ဥပမာဖော်ပြချက်များ

### ရိုးရှင်းသော Web App - Node.js Express
**နည်းပညာများ**: Node.js, Express, MongoDB, Container Apps  
**ရှုပ်ထွေးမှု**: Beginner  
**အယူအဆများ**: အခြေခံ deployment, REST API, NoSQL database integration

### Static Website - React SPA
**နည်းပညာများ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ရှုပ်ထွေးမှု**: Beginner  
**အယူအဆများ**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**နည်းပညာများ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ရှုပ်ထွေးမှု**: Beginner  
**အယူအဆများ**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**တည်နေရာ**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**နည်းပညာများ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ရှုပ်ထွေးမှု**: Advanced  
**အယူအဆများ**: Multi-service architecture, service communication, message queuing, distributed tracing  
**တည်နေရာ**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**နည်းပညာများ**: C# ASP.NET Core, Azure SQL Database, App Service  
**ရှုပ်ထွေးမှု**: Intermediate  
**အယူအဆများ**: Entity Framework, database connections, web API development

### Serverless Function - Python Azure Functions
**နည်းပညာများ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ရှုပ်ထွေးမှု**: Intermediate  
**အယူအဆများ**: Event-driven architecture, serverless computing, full-stack development

### Microservices - Java Spring Boot
**နည်းပညာများ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ရှုပ်ထွေးမှု**: Intermediate  
**အယူအဆများ**: Microservices communication, distributed systems, enterprise patterns

### Azure AI Foundry Examples

#### Azure OpenAI Chat App
**နည်းပညာများ**: Azure OpenAI, Cognitive Search, App Service  
**ရှုပ်ထွေးမှု**: Intermediate  
**အယူအဆများ**: RAG architecture, vector search, LLM integration

#### AI Document Processing
**နည်းပညာများ**: Azure AI Document Intelligence, Storage, Functions  
**ရှုပ်ထွေးမှု**: Intermediate  
**အယူအဆများ**: Document analysis, OCR, data extraction

#### Machine Learning Pipeline
**နည်းပညာများ**: Azure ML, MLOps, Container Registry  
**ရှုပ်ထွေးမှု**: Advanced  
**အယူအဆများ**: Model training, deployment pipelines, monitoring

## 🛠 Configuration ဥပမာများ

`configurations/` directory တွင် အသုံးပြုနိုင်သော components များပါဝင်သည်:

### Environment Configurations
- ဖွံ့ဖြိုးရေးအတွက် environment settings
- Staging environment configurations
- ထုတ်လုပ်မှုအဆင့် configurations
- Multi-region deployment setups

### Bicep Modules
- အသုံးပြုနိုင်သော infrastructure components
- ရိုးရှင်းသော resource patterns
- လုံခြုံရေးအတွက် အထူးပြု templates
- ကုန်ကျစရိတ်သက်သာသော configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- ကုန်ကျစရိတ်စောင့်ကြည့်မှု utilities

## 🔧 Customization Guide

### သင့် Use Case အတွက် ဥပမာများကို ပြင်ဆင်ခြင်း

1. **လိုအပ်ချက်များကို ပြန်လည်စစ်ဆေးပါ**
   - Azure service လိုအပ်ချက်များကိုစစ်ဆေးပါ
   - Subscription အကန့်အသတ်များကိုစစ်ဆေးပါ
   - ကုန်ကျစရိတ်အကျိုးဆက်များကိုနားလည်ပါ

2. **Configuration ကို ပြင်ဆင်ပါ**
   - `azure.yaml` service definitions ကို update ပြုလုပ်ပါ
   - Bicep templates ကို customize ပြုလုပ်ပါ
   - Environment variables ကိုပြင်ဆင်ပါ

3. **အပြည့်အဝ စမ်းသပ်ပါ**
   - ဖွံ့ဖြိုးရေး environment တွင် deploy ပြုလုပ်ပါ
   - လုပ်ဆောင်မှုကိုအတည်ပြုပါ
   - Scaling နှင့် performance ကိုစမ်းသပ်ပါ

4. **လုံခြုံရေးစစ်ဆေးမှု**
   - Access controls ကိုပြန်လည်စစ်ဆေးပါ
   - Secrets management ကိုအကောင်အထည်ဖော်ပါ
   - Monitoring နှင့် alerting ကို enable ပြုလုပ်ပါ

## 📊 Comparison Matrix

| ဥပမာ | Services | Database | Auth | Monitoring | ရှုပ်ထွေးမှု |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Learning Path

### အကြံပြုထားသော အဆင့်လိုက်တိုးတက်မှု

1. **ရိုးရှင်းသော Web App ဖြင့် စတင်ပါ**
   - AZD အခြေခံအယူအဆများကိုလေ့လာပါ
   - Deployment workflow ကိုနားလည်ပါ
   - Environment management ကိုလေ့ကျင့်ပါ

2. **Static Website ကို စမ်းသပ်ပါ**
   - Hosting options များကိုလေ့လာပါ
   - CDN integration ကိုနားလည်ပါ
   - DNS configuration ကိုနားလည်ပါ

3. **Container App သို့ ရွှေ့ပါ**
   - Containerization အခြေခံကိုလေ့လာပါ
   - Scaling အယူအဆများကိုနားလည်ပါ
   - Docker ဖြင့်လေ့ကျင့်ပါ

4. **Database Integration ကို ထည့်ပါ**
   - Database provisioning ကိုလေ့လာပါ
   - Connection strings ကိုနားလည်ပါ
   - Secrets management ကိုလေ့ကျင့်ပါ

5. **Serverless ကို စမ်းသပ်ပါ**
   - Event-driven architecture ကိုနားလည်ပါ
   - Triggers နှင့် bindings ကိုလေ့လာပါ
   - APIs ဖြင့်လေ့ကျင့်ပါ

6. **Microservices ကို တည်ဆောက်ပါ**
   - Service communication ကိုလေ့လာပါ
   - Distributed systems ကိုနားလည်ပါ
   - ရှုပ်ထွေးသော deployments များကိုလေ့ကျင့်ပါ

## 🔍 သင့်အတွက် သင့်လျော်သော ဥပမာရှာဖွေခြင်း

### နည်းပညာ Stack အလိုက်
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Architecture Pattern အလိုက်
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ရှုပ်ထွေးမှုအဆင့်အလိုက်
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 အပိုဆောင်းအရင်းအမြစ်များ

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

### အကောင်းဆုံး လုပ်ဆောင်ရန်နည်းလမ်းများ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ဥပမာများ ထည့်သွင်းရန်

အသုံးဝင်သော ဥပမာတစ်ခုကို မျှဝေချင်ပါသလား? ကျွန်ုပ်တို့သည် ထည့်သွင်းမှုများကို ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. သတ်မှတ်ထားသော ဖိုင်ဖွဲ့စည်းမှုကို လိုက်နာပါ  
2. ပြည့်စုံသော README.md ကို ထည့်သွင်းပါ  
3. ဖိုင်များတွင် မှတ်ချက်များ ထည့်သွင်းပါ  
4. တင်သွင်းမီ စမ်းသပ်မှု ပြုလုပ်ပါ  
5. ကုန်ကျစရိတ် ခန့်မှန်းချက်များနှင့် လိုအပ်ချက်များ ထည့်သွင်းပါ  

### ဥပမာ ဖိုင်ဖွဲ့စည်းမှု
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

**အကြံပြုချက်**: သင့်နည်းပညာစနစ်နှင့် ကိုက်ညီသော အလွယ်ဆုံး ဥပမာမှ စတင်ပြီး၊ နောက်ပိုင်းတွင် ပိုမိုရှုပ်ထွေးသော အခြေအနေများသို့ တဖြည်းဖြည်း တိုးတက်ပါ။ ဤဥပမာများသည် ယခင်အကြောင်းအရာများကို အခြေခံထားသည်။

## 🚀 စတင်ရန် အသင့်ဖြစ်ပြီလား?

### သင့်၏ သင်ကြားမှုလမ်းကြောင်း

1. **အခြေခံမရှိသေးပါလား?** → [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 မိနစ်) ဖြင့် စတင်ပါ  
2. **AZD အခြေခံကို သိပြီးပါသလား?** → [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 မိနစ်) ကို စမ်းကြည့်ပါ  
3. **AI အက်ပ်များ တည်ဆောက်နေပါသလား?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 မိနစ်) သို့မဟုတ် [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ နာရီ) ကို စမ်းကြည့်ပါ  
4. **သင့်နည်းပညာစနစ်အတွက် သီးသန့်လိုအပ်ချက်ရှိပါသလား?** → [Finding the Right Example](../../../examples) အပိုင်းကို အသုံးပြုပါ  

### နောက်တစ်ဆင့်များ

- ✅ အထက်ပါ [Prerequisites](../../../examples) ကို ပြန်လည်သုံးသပ်ပါ  
- ✅ သင့်ကျွမ်းကျင်မှုအဆင့်နှင့် ကိုက်ညီသော ဥပမာတစ်ခုကို ရွေးချယ်ပါ ([Complexity Legend](../../../examples) ကို ကြည့်ပါ)  
- ✅ ဥပမာ၏ README ကို တိတိကျကျ ဖတ်ရှုပါ  
- ✅ စမ်းသပ်ပြီးနောက် `azd down` ကို ပြုလုပ်ရန် သတိပေးချက် ထားပါ  
- ✅ GitHub Issues သို့မဟုတ် Discussions မှတစ်ဆင့် သင့်အတွေ့အကြုံကို မျှဝေပါ  

### အကူအညီလိုအပ်ပါသလား?

- 📖 [FAQ](../resources/faq.md) - မေးလေ့ရှိသော မေးခွန်းများ  
- 🐛 [Troubleshooting Guide](../docs/troubleshooting/common-issues.md) - တင်သွင်းမှု ပြဿနာများကို ဖြေရှင်းပါ  
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - အသိုင်းအဝိုင်းနှင့် မေးမြန်းပါ  
- 📚 [Study Guide](../resources/study-guide.md) - သင့်၏ သင်ကြားမှုကို တိုးတက်စေပါ  

---

**Navigation**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)  
- **📖 သင်ကြားမှု ပစ္စည်းများ**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)  
- **🔧 အရင်းအမြစ်များ**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/troubleshooting/common-issues.md)  

---

*နောက်ဆုံးအပ်ဒိတ်: နိုဝင်ဘာ 2025 | [ပြဿနာများรายงาน](https://github.com/microsoft/AZD-for-beginners/issues) | [ဥပမာများ ထည့်သွင်းပါ](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
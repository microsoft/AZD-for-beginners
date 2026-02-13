# ဥပမာများ - လက်တွေ့ AZD ဖောင်တမ်းများနှင့် ဖွဲ့စည်းမှုများ

**ဥပမာဖြင့် သင်ယူရန် - အခန်းအလိုက် စီစဉ်ထားသည်**
- **📚 ကို႔သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD စတင်သူများအတွက်](../README.md)
- **📖 အခန်း မြေပုံစနစ်**: သင်ယူခြင်း၏ အခွင့်အလမ်းအမျိုးအစားအရ ဥပမာများ စီစဉ်ထားသည်
- **🚀 ကိုယ်ပိုင် ဥပမာ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 ပြင်ပ AI ဥပမာများ**: Azure Samples ကိုင်တွယ်ထားသည့် repository များသို့ လင့်ခ်များ

> **📍 အရေးကြီး: ကိုယ်ပိုင် ဥပမာများနှင့် ပြင်ပ ဥပမာများ**  
> ဤ repository တွင် အပြည့်အစုံ တည်ဆောက်ထားသော **ကိုယ်ပိုင် ဥပမာ 4 ခု** ပါဝင်သည်။  
> - **Azure OpenAI Chat** (GPT-4 ဖြန့်ချိမှုနှင့် ဆက်သွယ်ပြောဆိုမည့် အင်တာဖေ့စ်)  
> - **Container Apps** (Simple Flask API + မိုက်ကရိုစားဗစ်များ)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (စီးပွားရေး AI ဖြေရှင်းချက်)  
>  
> အပိုထပ်ထည့်ထားသော ဥပမာများမှာ clone ယူနိုင်သော Azure-Samples repository များသို့ ညွှန်ပြထားသော **ပြင်ပ ရည်ညွှန်းချက်များ** ဖြစ်သည်။

## နိဒါန်း

ဤ directory သည် Azure Developer CLI ကို လက်တွေ့ကျကျ လေ့လာနိုင်စေရန် လက်တွဲ လေ့ကျင့်ရေး ဥပမာများနှင့် ရည်ညွှန်းချက်များကို ပေးထားသည်။ Retail Multi-Agent သဘောတရားသည် ဤ repository တွင် ပါဝင်သည့် စီးပွားရေး အသုံးပြုနိုင်အဆင့် အပြည့်အစုံဖြစ်သော အကောင်အထည်ဖော်မှုတစ်ခုဖြစ်သည်။ အပိုအတိုးပေးထားသည့် ဥပမာများမှာ မတူညီသော AZD ပုံစံများကို ပြသသည့် တရားဝင် Azure Samples များကို ရည်ညွှန်းထားသည်။

### ရှုပ်ထွေးမှု အဆင့် အညွှန်း

- ⭐ **စတင်သူ** - အခြေခံ အ概念များ၊ တစ်ဝန်ဆောင်မှုတည်း၊ 15-30 မိနစ်
- ⭐⭐ **အလယ်အလတ်** - ဝန်ဆောင်မှုမျိုးစုံ၊ ဒေတာဘေ့စ် ပေါင်းစည်းမှု၊ 30-60 မိနစ်
- ⭐⭐⭐ **မြင့်မား** - ဖွဲ့စည်းမှု မျိုးစုံ၊ AI ပေါင်းစည်းမှု၊ 1-2 နာရီ
- ⭐⭐⭐⭐ **အထူးကျွမ်းကျင်သူ** - ထုတ်လုပ်မှုအသင့်၊ စီးပွားရေး ပုံစံများ၊ 2 နာရီထက်များ

## 🎯 ဤ Repository တွင် အရာများ ဘာတွေ ပါလဲ

### ✅ ကိုယ်ပိုင် အကောင်အထည် (အသုံးပြုရန် အသင့်)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**ဤ repo ထဲတွင် GPT-4 ဖြန့်ချိမှုနှင့် ဆွေးနွေးမှု အင်တာဖေ့စ် အပြည့်အစုံ ပါရှိသည်**

- **တည်နေရာ:** `examples/azure-openai-chat/`
- **အခက်အခဲ:** ⭐⭐ (အလယ်အလတ်)
- **ပါဝင်သည့်အရာများ:**
  - Azure OpenAI ဖြန့်ချိမှု အပြည့်အစုံ (GPT-4)
  - Python command-line ဆွေးနွေးမှု အင်တာဖေ့စ်
  - API key များအတွက် Key Vault ပေါင်းစည်းမှု
  - Bicep အဆောက်အအုံ ဖောင့်တမ်းများ
  - တိုကင် အသုံးပြုမှုနှင့် ကုန်ကျစရိတ် မှတ်တမ်းတင်ခြင်း
  - နှုန်းချိန် ကန့်သတ်ခြင်းနှင့် အမှားကိုင်တွယ်မှုပုံစံများ

**Quick Start:**
```bash
# ဥပမာသို့ သွားပါ
cd examples/azure-openai-chat

# အားလုံးကို ဖြန့်ချိပါ
azd up

# လိုအပ်သော dependency များကို ထည့်သွင်းပြီး စကားပြောခြင်းကို စတင်ပါ
pip install -r src/requirements.txt
python src/chat.py
```

**နည်းပညာများ:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ဤ repo တွင် ကွန်တိနာ ဖြန့်ချိမှု အပြည့်အစုံ ပါရှိသည်**

- **တည်နေရာ:** `examples/container-app/`
- **အခက်အခဲ:** ⭐-⭐⭐⭐⭐ (စတင်သူမှ မြင့်မားသူအထိ)
- **ပါဝင်သည့်အရာများ:**
  - [Master Guide](container-app/README.md) - ကွန်တိနာ ဖြန့်ချိမှုများ၏ အနှစ်ချုပ်
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - အခြေခံ REST API ဥပမာ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ထုတ်လုပ်ရေး အဆင့်သင့် မာလတီ-ဆာဗစ် ဖြန့်ချိမှု
  - Quick Start, Production, နှင့် Advanced ပုံစံများ
  - မော်နီတာရေး၊ လုံခြုံရေး၊ နှင့် ကုန်ကျစရိတ် တိုးတက်မှုများ

**Quick Start:**
```bash
# ဦးဆောင်လမ်းညွှန်ကိုကြည့်ရန်
cd examples/container-app

# ရိုးရှင်းသော Flask API ကိုတပ်ဆင်ရန်
cd simple-flask-api
azd up

# မိုက်ခရိုဆာဗစ် ဥပမာကို တပ်ဆင်ရန်
cd ../microservices
azd up
```

**နည်းပညာများ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ဤ repo တွင် ထုတ်လုပ်ရေး အသင့် အပြည့်အစုံ ပါရှိသော အကောင်အထည်**

- **တည်နေရာ:** `examples/retail-multiagent-arm-template/`
- **အခက်အခဲ:** ⭐⭐⭐⭐ (မြင့်မား)
- **ပါဝင်သည့်အရာများ:**
  - ARM ဖြန့်ချိမှု ဖောင်တမ်း အပြည့်အစုံ
  - Multi-agent ဖွဲ့စည်းမှု (Customer + Inventory)
  - Azure OpenAI ပေါင်းစည်းမှု
  - RAG ဖြင့် AI Search
  - ကျယ်ပြန့်သော မော်နီတာရေးအချက်အလက်များ
  - One-click ဖြန့်ချိရေး script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**နည်းပညာများ:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ပြင်ပ Azure Samples (Clone ယူ၍ အသုံးပြုနိုင်ပါသည်)

အောက်ပါ ဥပမာများသည် တရားဝင် Azure-Samples repositories များတွင် ထိန်းသိမ်းထားသည်။ မိတ္တူကူး၍ မတူညီသော AZD ပုံစံများကို လေ့လာပါ။

### ရိုးရှင်းသော အက်ပလိကေးရှင်းများ (အခန်း 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ဒေသ (Local): simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ဒေသ (Local): microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | မာလတီ-ဆာဗစ်၊ Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**အသုံးပြုပုံ:**
```bash
# မည့်သည့်ဥပမာကိုမဆို ကလုန်းလုပ်ပါ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# တပ်ဆင်ပါ
azd up
```

### AI အက်ပလိကေးရှင်း ဥပမာများ (အခန်း 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [ဒေသ (Local): azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 ဖြန့်ချိမှု |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | အခြေခံ AI စကားဝိုင်း |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | အေဂျင့် ဖရိမ်းဝက်크 |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ပုံစံ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | စီးပွားရေး AI |

### ဒေတာဘေ့စ်နှင့် အဆင့်မြင့် ပုံစံများ (အခန်း 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ဒေတာဘေ့စ် ပေါင်းစည်းမှု |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | မာလတီ-ဆာဗစ် |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## သင်ယူမှု ရည်မှန်းချက်များ

ဤ ဥပမာများအား လက်တွေ့ လုပ်ဆောင်ခြင်းဖြင့် သင်သည်:
- အမှန်တကယ် အသုံးချနိုင်သော application များနှင့် Azure Developer CLI workflow များကို လေ့ကျင့်နိုင်မည်
- မတူညီသည့် application ဖွဲ့စည်းမှုများနှင့် ၎င်းတို့၏ azd အကောင်အထည်ဖော်မှုများကို နားလည်သိရှိမည်
- မတူညီသော Azure ဝန်ဆောင်မှုများအတွက် Infrastructure as Code ပုံစံများကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- ပတ်ဝန်းကျင်အထူး deployment နဲ့ configuration စီမံခန့်ခွဲမှုများကို ကျင့်သုံးနိုင်မည်
- မော်နီတာရေး၊ လုံခြုံရေးနှင့် တိုးချဲ့နိုင်မှု ပုံစံများအား လက်တွေ့အသုံးပြုနိုင်မည်
- တကယ့် deployment အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် ပြဿနာရှာဖွေခြင်း အတွေ့အကြုံ ရရှိမည်

## သင်ယူပြီးရမည့် နောက်ဆက်တွဲ အကျိုးသက်ရောက်မှုများ

ဥပမာများကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးနောက် သင်သည်:
- Azure Developer CLI ကို အသုံးပြုပြီး မတူညီသော application အမျိုးအစားများကို ကိုယ့်အလိုက် ဖြန့်ချိနိုင်မည်
- ပေးထားသည့် ဖောင်တမ်းများကို ကိုယ့် application လိုအပ်ချက်များအတိုင်း ညှိနှိုင်းပြင်ဆင်နိုင်မည်
- Bicep အသုံးပြုပြီး ကိုယ့်ပုဂ္ဂိုလ်ရေး အဆောက်အအုံ ပုံစံများကို ဒီဇိုင်းဆွဲတည်ဆောက်နိုင်မည်
- လိုအပ်သည့် လုပ်ငန်းကြီးများအတွက် dependencies များကို သတ်မှတ်ပြီး မာလတီ-ဆာဗစ် applications များကို ဖောင့်ချတည်ဆောက်နိုင်မည်
- လုံခြုံရေး၊ မော်နီတာရေးနှင့် စွမ်းဆောင်ရည် တိုးတက်ရေး အကောင်းဆုံးနည်းလမ်းများကို လက်တွေ့အသုံးချနိုင်မည်
- လက်တွေ့အခြေအနေများအပေါ် အခြေခံ၍ deployment များကို ပြဿနာဖြေရှင်းခြင်းနှင့် မြှင့်တင်ခြင်းများ ပြုလုပ်နိုင်မည်

## ဖိုင်ဖွဲ့စည်းတည်နေရာ

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

## အမြန် စတင်ရန် ဥပမာများ

> **💡 AZD ကို မသိသေးပါသလား?** ဥပမာ #1 (Flask API) ဖြင့် စတင်ပါ - အချိန် ~20 မိနစ်ယူလိမ့်မည်နှင့် အခြေခံ အယူအဆများကို သင်ကြားပေးပါမည်။

### စတင်သူများအတွက်
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ဒေသ) ⭐  
   scale-to-zero ဖြင့် ရိုးရှင်းသော REST API တစ်ခု ဖြန့်ချိပါ  
   **အချိန်:** 20-25 မိနစ် | **ကုန်ကျစရိတ်:** $0-5/လ  
   **သင်ယူရန်:** အခြေခံ azd workflow, containerization, health probes  
   **မျှော်မှန်းသည့် ရလဒ်:** "Hello, World!" ပြန်လည်ထုတ်ပေးမည့် အလုပ်လုပ်နိုင်သော API endpoint နှင့် မော်နီတာရေး

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB နှင့် Node.js Express web application တစ်ခု ဖြန့်ချိပါ  
   **အချိန်:** 25-35 မိနစ် | **ကုန်ကျစရိတ်:** $10-30/လ  
   **သင်ယူရန်:** ဒေတာဘေ့စ် ပေါင်းစည်းမှု, environment variables, connection strings  
   **မျှော်မှန်းသည့် ရလဒ်:** create/read/update/delete အလုပ်လုပ်နိုင်သည့် Todo list app

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ဖြင့် React static website ကို မက်စ်တင်ပါ  
   **အချိန်:** 20-30 မိနစ် | **ကုန်ကျစရိတ်:** $0-10/လ  
   **သင်ယူရန်:** Static hosting, serverless functions, CDN ဖြန့်ချိမှု  
   **မျှော်မှန်းသည့် ရလဒ်:** API backend ပါရှိသည့် React UI, automatic SSL, global CDN

### အလယ်အလတ် သုံးသူများအတွက်
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (ဒေသ) ⭐⭐  
   GPT-4 ဖြန့်ချိမှုနှင့် စကားပြောအင်တာဖေ့စ်၊ API key များလုံခြုံစွာ စီမံခြင်း  
   **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/လ  
   **သင်ယူရန်:** Azure OpenAI ဖြန့်ချိမှု, Key Vault ပေါင်းစည်းမှု, တိုကင် ချက်ပိုင်း ထိန်းသိမ်းမှု  
   **မျှော်မှန်းသည့် ရလဒ်:** GPT-4 ပါရှိသော စကားဝိုင်းအက်ပလိကေးရှင်းနှင့် ကုန်ကျစရိတ် မော်နီတာရေး

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ဒေသ) ⭐⭐⭐⭐  
   ထုတ်လုပ်ရေးအသင့် မာလတီ-ဆာဗစ် ဖွဲ့စည်းမှု  
   **အချိန်:** 45-60 မိနစ် | **ကုန်ကျစရိတ်:** $50-150/လ  
   **သင်ယူရန်:** ဝန်ဆောင်မှု ဆက်သွယ်ရေး, message queuing, distributed tracing  
   **မျှော်မှန်းသည့် ရလဒ်:** API Gateway + Product Service ပါရှိသည့် 2-စနစ် စနစ်နှင့် မော်နီတာရေး

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API နှင့် Azure SQL Database ပါသော Web application  
   **အချိန်:** 30-45 မိနစ် | **ကုန်ကျစရိတ်:** $20-80/လ  
   **သင်ယူရန်:** Entity Framework, database migrations, connection security  
   **မျှော်မှန်းသည့် ရလဒ်:** Azure SQL backend နဲ့ C# API၊ အလိုအလျောက် schema ဖြန့်ချိမှု

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP triggers နှင့် Cosmos DB ပါသည့် Python Azure Functions  
   **အချိန်:** 30-40 မိနစ် | **ကုန်ကျစရိတ်:** $10-40/လ  
   **သင်ယူရန်:** event-driven architecture, serverless scaling, NoSQL ပေါင်းစည်းမှု  
   **မျှော်မှန်းသည့် ရလဒ်:** HTTP request များကို တုံ့ပြန်နိုင်သည့် Function app နှင့် Cosmos DB သိုလှောင်မှု

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps နှင့် API gateway ပါသည့် မာလတီ-ဆာဗစ် Java application  
   **အချိန်:** 60-90 မိနစ် | **ကုန်ကျစရိတ်:** $80-200/လ  
   **သင်ယူရန်:** Spring Boot ဖြန့်ချိမှု, service mesh, load balancing  
   **မျှော်မှန်းသည့် ရလဒ်:** service discovery နှင့် routing ပါရှိသည့် မာလတီ-ဆာဗစ် Java စနစ်

### Microsoft Foundry ဖောင်တမ်းများ

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   GPT-4 ဖြန့်ချိမှုနှင့် စကားဝိုင်း အင်တာဖေ့စ် အပြည့်အစုံ  
   **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/လ  
   **မျှော်မှန်းသည့် ရလဒ်:** တိုကင် များကို မှတ်တမ်းတင်နိုင်သည့် စကားဝိုင်း အက်ပလိကေးရှင်း

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ဖွဲ့စည်းမှုပါရှိသည့် တိုးတက်သော စကားဝိုင်း အက်ပလိကေးရှင်း  
   **အချိန်:** 60-90 မိနစ် | **ကုန်ကျစရိတ်:** $100-300/လ  
   **မျှော်မှန်းသည့် ရလဒ်:** စာရွက်စာတမ်းရှာဖွေရေးနှင့် ကိုးကားချက်များပါရှိသည့် RAG အားဖြင့် အလုပ်လုပ်သော စကားဝိုင်း

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ဝန်ဆောင်မှုများကို အသုံးပြု၍ စာရွက်စာတမ်း विश्लेषण  
   **အချိန်:** 40-60 မိနစ် | **ကုန်ကျစရိတ်:** $20-80/လ  
   **မျှော်မှန်းသည့် ရလဒ်:** တင်သွင်းထားသော စာရွက်စာတမ်းများမှ စာသား၊ ဇယားများနှင့် အရာဝတ္ထုများ ထုတ်ယူမည့် API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ဖြင့် MLOps workflow  
   **အချိန်:** 2-3 နာရီ | **ကုန်ကျစရိတ်:** $150-500/လ  
   **မျှော်မှန်းသည့် ရလဒ်:** သင်တန်းမှု၊ ဖြန့်ချိမှု နှင့် မော်နီတာရေး ပါရှိသည့် အလိုအလျောက် ML pipeline

### အမှန်တကယ် အသုံးချနိုင်သော ရောနှောမှုများ

#### **Retail Multi-Agent Solution** 🆕
**[အပြည့်အစုံ အကောင်အထည်ဖော်လမ်းညွှန်](./retail-scenario.md)**

AZD ဖြင့် ထုတ်လုပ်ရေး အသင့်၊ စီးပွားရေးအဆင့် AI application ဖြန့်ချိမှုကို ပြသသည့် ကာတွန်းတစ်ခုဖြစ်သည်။ ဤဇာတ်ကောင်တွင် သင့်အား ပေးစွမ်းသည်မှာ -

- **အပြည့်အစုံ ဖွဲ့စည်းပုံ**: ဖောက်သည် ဝန်ဆောင်မှုနှင့် လက်ကျန် စီမံခန့်ခွဲမှုအေဂျင့်များပါရှိသည့် multi-agent စနစ်
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 အသုံးပြုနည်း ညွှန်ကြားချက်များ

### မလိုအပ်မီ

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 စရိတ် သတိပေးချက်:** All examples create real Azure resources that incur charges. See individual README files for cost estimates. Remember to run `azd down` when done to avoid ongoing costs.

### ပုံမှန်အား locally examples များ चलाउनနည်း

1. **Clone or Copy Example**
   ```bash
   # လိုချင်သော ဥပမာသို့ သွားပါ
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # ရှိပြီးသား နမူနာဖြင့် စတင်ပါ
   azd init
   
   # သို့မဟုတ် အသစ်သော ပတ်ဝန်းကျင် ဖန်တီးပါ
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # လိုအပ်သော ဗားရီးယားများကို သတ်မှတ်ပါ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # အခြေခံအဆောက်အဦးနှင့် အက်ပလီကေးရှင်းကို ဖြန့်ချိပါ
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # ဝန်ဆောင်မှု endpoints များကို ရယူပါ
   azd env get-values
   
   # endpoint ကို စမ်းသပ်ပါ (ဥပမာ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Expected Success Indicators:**
   - ✅ `azd up` completes without errors
   - ✅ Service endpoint returns HTTP 200
   - ✅ Azure Portal shows "Running" status
   - ✅ Application Insights receiving telemetry

> **⚠️ ပြဿနာများ ရှိပါသလား?** See [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) for deployment troubleshooting

### ဥပမာများကို ကိုင်တွယ်ချိန် အက်ဒပ်

Each example includes:
- **README.md** - အသေးစိတ် စတင်ခြင်းနှင့် ပုံစံပြင်ဆင်မှု ညွှန်ကြားချက်များ
- **azure.yaml** - AZD ဖိုင်ကော်ဖီဂျာရေးရှင်းနှင့် မှတ်ချက်များ
- **infra/** - parameter ရှင်းလင်းချက်များပါရှိသော Bicep ပုံစံများ
- **src/** - နမူနာ application ကုဒ်
- **scripts/** - ပုံမှန် အလုပ်များအတွက် အကူအ assistance စကရစ်များ

## 🎯 သင်ယူရမည့် ရည်ရွယ်ချက်များ

### ဥပမာအမျိုးအစားများ

#### **အခြေခံ တင်သွင်းမှုများ**
- တစ်ခုတည်း ဝန်ဆောင်မှု applications
- ရိုးရှင်းသော အင်ဖရာပုံစံများ
- မူဝါဒ ဖိုင်ဖိဆိုင်းချုပ် စီမံခန့်ခွဲမှု
- စျေးနှုန်းသက်သာသည့် ဖွံ့ဖြိုးရေး အတည်ပြုစနစ်များ

#### **တိုးတက်ထားသော အခြေအနေများ**
- အများစုပင် ဝန်ဆောင်မှု ဆောက်လုပ်ပုံများ
- တည်ဆောက်ရေး ရှုပ်ထွေးသော ကြိုးပင်ကွန်ရက် ဖော်ပြချက်များ
- ဒေတာဘေ့စ် ပေါင်းစည်းမှု ပုံစံများ
- လုံခြုံရေးနှင့် ကန့်သတ်ချက် အသုံးချမှုများ

#### **ထုတ်လုပ်မှု အသင့် ပုံစံများ**
- အမြင့်တင်ရရှိမှု ဖော်ပြချက်များ
- မော်နီတာင်နှင့် ကြည့်ရှုနိုင်မှု
- CI/CD ပေါင်းစည်းမှု
- မတော်တဆဖြေရှင်းရေး ပြင်ဆင်မှုများ

## 📖 ဥပမာဖော်ပြချက်များ

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: Basic deployment, REST API, NoSQL database integration

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: Static hosting, serverless backend, modern web development

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: Multi-service architecture, service communication, message queuing, distributed tracing  
**Location**: [Local Example](../../../examples/container-app/microservices)

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

### Microsoft Foundry Examples

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

## 🛠 ဖိုင်ကို ကိုယ်ကျင့်သတ်မှတ် စနစ်များ

The `configurations/` directory contains reusable components:

### ပတ်ဝန်းကျင် ဖော်ပြချက်များ
- ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ဆက်တင်များ
- Staging ပတ်ဝန်းကျင် ဖော်ပြချက်များ
- ထုတ်လုပ်မှု အသင့် ဖော်ပြချက်များ
- မူတည်ရာ မျိုးစုံ ဒေသ တင်သွင်းမှု စနစ်များ

### Bicep Modules
- အသုံးပြုနိုင်သော အင်ဖရာ ကွန်ပွန်နင့်များ
- ပုံမှန် ရင်းမြစ် ပုံစံများ
- လုံခြုံရေး အားကောင်းစေသော ပုံစံများ
- စရိတ် သက်သာစေသော ဖော်ပြချက်များ

### အကူအညီ စကရစ်များ
- ပတ်ဝန်းကျင် စတင်စနစ် အလိုအလျောက်လုပ်ငန်းများ
- ဒေတာဘေ့စ် မိုင်းရေးရှင်း စကရစ်များ
- တင်သွင်းချက် အတည်ပြု တစ်စိတ်တစ်ပိုင်း ကိရိယာများ
- စရိတ် စောင့်ကြည့်ရေး ကိရိယာများ

## 🔧 အမှန်တကယ် ပြင်ဆင်ရန် လမ်းညွှန်

### သင့်အသုံးအတွက် ဥပမာများကို ကိုက်ညီစေခြင်း

1. **Prerequisites များကို ပြန်လည်စစ်ဆေးပါ**
   - Azure ဝန်ဆောင်မှု လိုအပ်ချက်များကို စစ်ဆေးပါ
   - Subscription ကန့်သတ်ချက်များကို အတည်ပြုပါ
   - စရိတ် သက်ရောက်မှုများကို နားလည်ပါ

2. **Configuration ကို ပြင်ဆင်ပါ**
   - `azure.yaml` ဝန်ဆောင်မှု အမည်သတ်မှတ်ချက်များကို အပ်ဒိတ်လုပ်ပါ
   - Bicep ပုံစံများကို အသုံးပြုရန် ပြင်ဆင်ပါ
   - ပတ်ဝန်းကျင် အခြေအနေ များကို ချိန်ညှိပါ

3. **စမ်းသပ်မှုကို ပြုလုပ်ပါ**
   - ဦးစွာ ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်သို့ တင်သွင်းပါ
   - လုပ်ဆောင်ချက်များကို အတည်ပြုပါ
   - စွမ်းဆောင်ရည်နှင့် အတိုင်းအတာ စမ်းသပ်ပါ

4. **လုံခြုံရေး ပြန်လည်သုံးသပ်ပါ**
   - ဝင်ရောက်ခွင့်ထိန်းချုပ်မှုများကို ကြည့်ပါ
   - Secrets စီမံခန့်ခွဲမှု ကို အကောင်အထည်ဖော်ပါ
   - မော်နီတာင်နှင့် အကြောင်းကြားမှုများ ဖွင့်ပါ

## 📊 နှိုင်းယှဉ် စာရင်းဇယား

| Example | Services | Database | Auth | Monitoring | Complexity |
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

## 🎓 သင်ယူရေး လမ်းကြောင်း

### အကြံပြု တိုးတက်မှု ခြေလှမ်းများ

1. **Simple Web App နဲ့ စတင်ပါ**
   - AZD အခြေခံแนวคิดများကို သင်ယူပါ
   - တင်သွင်းရေး လုပ်ငန်းစဉ်ကို နားလည်ပါ
   - ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုကို လေ့ကျင့်ပါ

2. **Static Website ကို ကြိုးစားပါ**
   - မတူညီသည့် ဟိုစတင်း ရွေးချယ်မှုများကို နေ့လည်လေ့လာပါ
   - CDN ပေါင်းစည်းမှုကို စူးစမ်းပါ
   - DNS ဖော်ပြချက်ကို နားလည်ပါ

3. **Container App သို့ တိုးတက်ပါ**
   - ကွန်တိန်နာ အခြေခံများကို သင်ယူပါ
   - အတိုင်းအတာချိန် ဆိုင်ရာ แนวคิดများကို နားလည်ပါ
   - Docker ဖြင့် လက်တွေ့ကျက်သရေ အလုပ်လုပ်ပါ

4. **ဒေတာဘေ့စ် ပေါင်းစည်းမှု ထည့်ပါ**
   - ဒေတာဘေ့စ် ပေးသွင်းရေးကို သင်ယူပါ
   - connection string များကို နားလည်ပါ
   - secrets စီမံခန့်ခွဲမှုကို လေ့ကျင့်ပါ

5. **Serverless ကို လေ့လာပါ**
   - Event-driven ဖွဲ့စည်းမှုကို နားလည်ပါ
   - Trigger နှင့် Binding မျိုးစုံကို သင်ယူပါ
   - API များနှင့် လက်တွေ့ လေ့ကျင့်ပါ

6. **Microservices ဆောက်လုပ်ပါ**
   - ဝန်ဆောင်မှု ဆက်သွယ်မှုများကို သင်ယူပါ
   - ဖန်တီးချုပ် စနစ်များကို နားလည်ပါ
   - ရှုပ်ထွေးသော တင်သွင်းရေးများကို လေ့ကျင့်ပါ

## 🔍 ကိုယ့်အတွက် မှန်ကန်တဲ့ ဥပမာ ရှာဖွေရန်

### နည်းပညာ စတက်

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

### အင်ဂျင်နီယာ အဆင့်ပုံစံ အလိုက်
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ပြတ်သားမှု အဆင့်အလိုက်
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 ထပ်ဆင့် အရင်းအမြစ်များ

### စာတမ်းလင့်ခ်များ
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### အသိုင်းအဝိုင်း ဥပမာများ
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js နှင့် PostgreSQL ဖြင့် Todo အက်ပ်](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ဖြင့် React ဝက်ဘ် အက်ပ်](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ဖြင့် Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### အကောင်းဆုံး လက်တွေ့လုပ်ထုံးလုပ်နည်းများ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ဥပမာများ ပံ့ပိုးရန်

ဝေငှရန် အသုံးဝင်သော ဥပမာတစ်ခု ရှိပါသလား? ကျွန်တော်တို့သည် အထောက်အပံ့များကို ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. အစီအစဉ်တည်ဆောက်ထားသည့် directory ဖွဲ့စည်းပုံကို လိုက်နာပါ
2. အပြည့်အစုံ README.md ထည့်ပါ
3. configuration ဖိုင်များတွင် မှတ်ချက်များ ထည့်ပါ
4. တင်သွင်းမီ ကောင်းစွာ စစ်ဆေးပါ
5. ကုန်ကျစရိတ် ခန့်မှန်းချက်များ နှင့် ကြိုတင်လိုအပ်ချက်များ ထည့်ပါ

### ဥပမာ စမ်းနမူနာ ဖွဲ့စည်းပုံ
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

**Pro Tip**: သင့်နည်းပညာ စတက်နှင့် ကိုက်ညီသည့် အနည်းဆုံး ရိုးရှင်းသော ဥပမာနဲ့ စတင်ပါ၊ ထို့နောက် များပြီး ချိန်ခါလာသော နည်းပညာဆိုင်ရာ အခြေအနေပေါ် ကိုက်ညီစေရန် တဖြည်းဖြည်း မြှင့်တင်ပါ။ ဥပမာတိုင်းသည် ယခင် ဥပမာများ၏ အယူအဆများပေါ်တွင် တည်ဆောက်ထားသည်။

## 🚀 စတင်ရန် အသင့်လား?

### သင်လေ့လာရန် လမ်းစဉ်

1. **လုံးဝ စတင်သူလား?** → [Flask API](../../../examples/container-app/simple-flask-api) ဖြင့် စတင်ပါ (⭐, 20 မိနစ်)
2. **AZD အခြေခံ သိမြင်မှု ရှိပါသလား?** → [Microservices](../../../examples/container-app/microservices) ကို လုပျစားကြည့်ပါ (⭐⭐⭐⭐, 60 မိနစ်)
3. **AI အက်ပ်များ တည်ဆောက်နေပါသလား?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) ဖြင့် စတင်ပါ (⭐⭐, 35 မိနစ်) သို့မဟုတ် [Retail Multi-Agent](retail-scenario.md) ကို စူးစမ်းပါ (⭐⭐⭐⭐, 2+ နာရီ)
4. **တိတိကျကျ နည်းပညာ စတက် လိုအပ်ပါသလား?** → အထက်ပါ [မှန်ကန်သော ဥပမာ ရှာဖွေရေး](../../../examples) အပိုင်းကို အသုံးပြုပါ

### နောက်ဆက်တွဲ အဆင့်များ

- ✅ အထက်ပါ [လိုအပ်ချက်များ](../../../examples) ကို ပြန်လည်သုံးသပ်ပါ
- ✅ သင့် ကျွမ်းကျင်မှု အဆင့်နှင့် ကိုက်ညီသော ဥပမာကို ရွေးပါ (ကြည့်ရန် [Complexity Legend](../../../examples))
- ✅ ထည့်သွင်းမီ ဥပမာ၏ README ကို အရေးကြီးစွာ ဖတ်ပါ
- ✅ စမ်းသပ်ပြီးနောက် `azd down` ကို चलရန် မှတ်ချက် ထားပါ
- ✅ GitHub Issues သို့မဟုတ် Discussions မှတဆင့် သင့် အတွေ့အကြုံကို ဝေစုပါ

### အကူအညီ လိုပါသလား?

- 📖 [FAQ](../resources/faq.md) - အမြဲမေးတော့သော မေးခွန်းများဖြေကြားချက်များ
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - deployment ပြဿနာများကို ဖြေရှင်းရန်
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ကွန်မြူနစ်ဖြင့် ဆွေးနွေးရန်
- 📚 [Study Guide](../resources/study-guide.md) - သင်ယူမှုကို အားကျစေရန်

---

**Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Study Materials**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Resources**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*နောက်ဆုံး အပ်ဒိတ်ပြုထားသည်: နိုဝင်ဘာ 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန် ဝန်ဆောင်မှု "Co-op Translator" (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုနည်းပါးမှုများ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူရင်းစာတမ်းကို သဘာဝဘာသာဖြင့် ရေးသားထားသော မူရင်းကို အာဏာပိုင် မဲဖြင့်ယူဆရန် သင့်တော်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူမီ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ချက်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်စွာ အဓိပ္ပာယ်ယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မရှိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
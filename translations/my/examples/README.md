# နမူနာများ - လက်တွေ့အသုံးပြုနိုင်သော AZD ပုံစံများနှင့် ဖွဲ့စည်းချက်များ

**နမူနာဖြင့် သင်ယူခြင်း - အခန်းအလိုက် စီစဉ်ထားသည်**
- **📚 Course Home**: [AZD စတင်သူများအတွက်](../README.md)
- **📖 Chapter Mapping**: နမူနာများကို သင်ယူမှုပမာဏအလိုက် စီစဉ်ထားသည်
- **🚀 Local Example**: [ရောင်းဝယ်ရေး မျိုးစုံ အေးဂျင့် ဖြေရှင်းချက်](retail-scenario.md)
- **🤖 External AI Examples**: Azure Samples repository များသို့ ချိတ်ဆက်ထားသော လင့်ခ်များ

> **📍 အရေးကြီး - ဒေသတွင်း နှင့် ပြင်ပ နမူနာများ ခွဲခြားချက်**  
> ဤ repository တွင် **ဒေသတွင်း အပြည့်အစုံ ၄ ခု** ပါရှိပြီး အပြည့်အစုံ အကောင်အထည်ဖော်မှုများပါရှိသည်။  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment နှင့် chat interface)  
> - **Container Apps** (ရိုးရှင်း Flask API + မိုက်ခရိုဆာဗစ်များ)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (စီးပွားရေးအဆင့် AI ဖြေရှင်းချက်)  
>  
> ထပ်မံပါဝင်သော နမူနာများသည် သင် clone လုပ်နိုင်သော Azure-Samples repositories သို့ ရည်ညွှန်းထားသော ဖြစ်သည်။

## နိဒါန်း

ဤဖိုလ်ဒါတွင် လက်တွေ့ လေ့လာနိုင်ရန် Azure Developer CLI ကို လက်တွေ့လုပ်ငန်းများဖြင့် သင်ယူစေမည့် နမူနာများနှင့် ကိုးကားချက်များ ပါရှိသည်။ Retail Multi-Agent ဖြစ်ရပ်ကိစ္စမှာ ဤ repository တွင် ပါဝင်သော အပြည့်အစုံ၊ ထုတ်လုပ်နိုင်သော အကောင်အထည်ဖော်မှုဖြစ်သည်။ ထပ်ဆင့် နမူနာများမှာ အမျိုးမျိုးသော AZD ပုံစံများကို ဖော်ပြသည့် တရားဝင် Azure Samples ကိုးကားချက်များကို ရည်ညွှန်းသည်။

### ခက်ခဲမှု အဆင့်ဖော်ပြချက်

- ⭐ **စတင်သူ** - အခြေခံ အယူအစာများ၊ တစ်ခုသော ဝန်ဆောင်မှု၊ 15-30 မိနစ်
- ⭐⭐ **အလယ်အလတ်** - ဝန်ဆောင်မှုများစွာ၊ ဒေတာဘေ့စ် ပေါင်းစည်းမှု၊ 30-60 မိနစ်
- ⭐⭐⭐ **အဆင့်မြင့်** - ဖွဲ့စည်းပုံရှုပ်ထွေးမှု၊ AI ပေါင်းစည်းခြင်း၊ 1-2 နာရီ
- ⭐⭐⭐⭐ **ကျွမ်းကျင်သူ** - ထုတ်လုပ်နိုင်သော အဆင့်၊ စီးပွားရေးပုံစံများ၊ 2 နာရီကျော်

## 🎯 ဤ repository တွင် ပါဝင်သော အရာများ

### ✅ ဒေသတွင်း အကောင်အထည်ဖော်မှု (အသုံးပြုရန် အဆင်သင့်)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**ဤ repository တွင် chat အင်တာဖေ့စ်နှင့်အတူ gpt-4.1 အပြည့်အစုံ ထည့်သွင်းထားသော deployment တစ်ခု ပါဝင်သည်**

- **တည်နေရာ:** `examples/azure-openai-chat/`
- **ခက်ခဲမှု:** ⭐⭐ (အလယ်အလတ်)
- **ပါဝင်သည်များ:**
  - Microsoft Foundry Models အပြည့်အစုံ deployment (gpt-4.1)
  - Python command-line chat အင်တာဖေ့စ်
  - လုံခြုံသော API key များအတွက် Key Vault ပေါင်းစည်းမှု
  - Bicep အင်ဖရာစထရပ် template များ
  - တိုကင် အသုံးပြုမှုနှင့် ကုန်ကျစရိတ် လိုက်နာခြင်း
  - အမြန်နှုန်း ကန့်သတ်ခြင်းနှင့် အမှား ကိုင်တွယ်ခြင်း

**အမြန်စတင်ရန်:**
```bash
# example သို့ သွားပါ
cd examples/azure-openai-chat

# အားလုံးကို ဖြန့်ချိပါ
azd up

# လိုအပ်သော ထောက်ပံ့ပစ္စည်းများကို ထည့်သွင်းပြီး စကားပြောကို စတင်ပါ
pip install -r src/requirements.txt
python src/chat.py
```

**နည်းပညာများ:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ဤ repository တွင် container များအား တပ်ဆင်သည့် နမူနာများ အပြည့်အစုံ ပါဝင်သည်**

- **တည်နေရာ:** `examples/container-app/`
- **ခက်ခဲမှု:** ⭐-⭐⭐⭐⭐ (စတင်သူ မှ အဆင့်မြင့်)
- **ပါဝင်သည်များ:**
  - [Master Guide](container-app/README.md) - container deployment များအတွက် အပြည့်အစုံ အကျဉ်းချုပ်
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - အခြေခံ REST API ဥပမာ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ထုတ်လုပ်နိုင်သော မျိုးစုံ ဝန်ဆောင်မှု တပ်ဆင်မှု
  - အမြန်စတင်ခြင်း၊ ထုတ်လုပ်မှုနှင့် တိုးတက်သော ပုံစံများ
  - မော်နီတာရေး၊ လုံခြုံရေးနှင့် ကုန်ကျစရိတ် တိုးတက်အောင်မြင်ရေး

**အမြန်စတင်ရန်:**
```bash
# မาสตာ လမ်းညွှန်ကို ကြည့်ရန်
cd examples/container-app

# ရိုးရှင်းသော Flask API ကို တပ်ဆင်ရန်
cd simple-flask-api
azd up

# မိုက်ခရိုဆာဗစ် ဥပမာကို တပ်ဆင်ရန်
cd ../microservices
azd up
```

**နည်းပညာများ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ဤ repository တွင် ပါဝင်သော အပြည့်အစုံ၊ ထုတ်လုပ်နိုင်သော အကောင်အထည်ဖော်မှု**

- **တည်နေရာ:** `examples/retail-multiagent-arm-template/`
- **ခက်ခဲမှု:** ⭐⭐⭐⭐ (အဆင့်မြင့်)
- **ပါဝင်သည်များ:**
  - ARM deployment template အပြည့်အစုံ
  - မျိုးစုံ အေးဂျင့် ဖွဲ့စည်းပုံ (Customer + Inventory)
  - Microsoft Foundry Models ပေါင်းစည်းမှု
  - RAG ပါရှိသော AI ရှာဖွေရေး
  - စုံလင်သော မော်နီတာရေး
  - တစ်ချက်နှိပ် တပ်ဆင်ရေး script

**အမြန်စတင်ရန်:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**နည်းပညာများ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ပြင်ပ Azure Samples (အသုံးပြုရန် Clone လုပ်ပါ)

အောက်ပါ နမူနာများကို တရားဝင် Azure-Samples repositories များတွင် ထိန်းသိမ်းထားပါသည်။ အမျိုးမျိုးသော AZD ပုံစံများကို လေ့လာရန် ထို repositories များကို clone လုပ်ပါ။

### ရိုးရှင်းသော အက်ပလီကေးရှင်းများ (အခန်း 1-2)

| ပုံစံ | Repository | ခက်ခဲမှု | ဝန်ဆောင်မှုများ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ဒေသတွင်း: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ဒေသတွင်း: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ဘယ်လို အသုံးပြုမလဲ:**
```bash
# မည်သည့် ဥပမာကိုမဆို ကလုန်းလုပ်ပါ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ဖြန့်ချိပါ
azd up
```

### AI အက်ပလီကေးရှင်း နမူနာများ (အခန်း 2, 5, 8)

| ပုံစံ | Repository | ခက်ခဲမှု | အာရုံစိုက်ချက် |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [ဒေသတွင်း: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | အခြေခံ AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ပုံစံ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | စီးပွားရေးအဆင့် AI |

### ဒေတာဘေ့စ်နှင့် တိုးတက်သော ပုံစံများ (အခန်း 3-8)

| ပုံစံ | Repository | ခက်ခဲမှု | အာရုံစိုက်ချက် |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ဒေတာဘေ့စ် ပေါင်းစည်းမှု |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## သင်ယူရမည့် ရည်မှန်းချက်များ

အောက်ပါအရာများကို လေ့လာခြင်းဖြင့် သင်သည်:
- အဖြစ်မှန်သော အက်ပလီကေးရှင်းအခြေအနေများနှင့်အတူ Azure Developer CLI workflow များကို လက်တွေ့ကျကျ လေ့ကျင့်နိုင်မည်
- အမျိုးမျိုးသော အက်ပလီကေးရှင်း ဖွဲ့စည်းပုံများနှင့် ၎င်းတို့၏ azd အကောင်အထည်ဖော်မှုများကို နားလည်လာမည်
- မတူညီသော Azure ဝန်ဆောင်မှုများအတွက် Infrastructure as Code ပုံစံများကို ကျွမ်းကျင်စွာ အသုံးချနိုင်မည်
- ဖိုင်ဖော်မတ်များနှင့် ပတ်ဝန်းကျင်-အထူး deployment မဟာဗျူဟာများကို အသုံးချနိုင်မည်
- လက်တွေ့ ကိစ္စများတွင် မော်နီတာရေး၊ လုံခြုံရေး နှင့် စွမ်းဆောင်ရည် တိုးတက်ရေးပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- အကောင်အထည်ဖော်ထားသည့် deployment များ၏ ပြဿနာရှာဖွေခြင်းနှင့် အမှားရှင်းလင်းရေးအတွေ့အကြုံ တည်ဆောက်နိုင်မည်

## သင်ယူပြီးရလဒ်များ

ဤနမူနာများကို ပြီးမြောက်စွာ လုပ်ဆောင်နိုင်ပါက သင်သည်:
- Azure Developer CLI ဖြင့် အမျိုးမျိုးသော အက်ပလီကေးရှင်းအမျိုးအစားများကို ယုံကြည်စွာ တပ်ဆင်နိုင်မည်
- ပေးထားသော ပုံစံများကို မိမိ၏ အက်ပလီကေးရှင်း လိုအပ်ချက်များနှင့် သက်ဆိုင်အောင် ပြန်လည် ရေးဆွဲနိုင်မည်
- Bicep ကို အသုံးပြု၍ စိတ်တိုင်းမမှန်သော အင်ဖရာစထရပ် ပုံစံများ အကောင်အထည်ဖော်နိုင်မည်
- dependency များကို သေချာ ထိန်းသိမ်း၍ မျိုးစုံ ဝန်ဆောင်မှုများကို ဖော်ပြနိုင်မည်
- လုံခြုံရေး၊ မော်နီတာရေး နှင့် စွမ်းဆောင်ရည် အကောင်းဆုံးလုပ်ဆောင်ချက်များကို လက်တွေ့ အကောင်အထည်ဖော်နိုင်မည်
- လက်တွေ့အခြေအနေများအပေါ် မူတည်၍ deployment များကို ပြဿနာရှာဖွေခြင်းနှင့် တိုးတက်အောင်မြင်ရေး ပြုလုပ်နိုင်မည်

## ဖိုလ်ဒါ ဖွဲ့စည်းမှု

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

## အမြန်စတင်နမူနာများ

> **💡 AZD အသစ်လား?** နမူနာ #1 (Flask API) ဖြင့် စတင်ပါ — ခန့်မှန်း၍ ~20 မိနစ် ကြာပြီး အခြေခံ ယူဆချက်များကို သင်ယူနိုင်ပါသည်။

### စတင်သူများအတွက်
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ဒေသတွင်း) ⭐  
   ရိုးရှင်းသော REST API ကို scale-to-zero feature ဖြင့် တပ်ဆင်ပါ  
   **အချိန်:** 20-25 မိနစ် | **ကုန်ကျစရိတ်:** $0-5/လ  
   **သင်ယူရမည့်အချက်များ:** အခြေခံ azd workflow, containerization, health probes  
   **မျှော်လင့်ရမည့် ရလဒ်:** "Hello, World!" ကို return ပြန်သည့် အလုပ်လုပ်နိုင်သော API endpoint တစ်ခု မော်နီတာနှင့်အတူ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB နှင့် တွဲ၍ Node.js Express web application တစ်ခု တပ်ဆင်ပါ  
   **အချိန်:** 25-35 မိနစ် | **ကုန်ကျစရိတ်:** $10-30/လ  
   **သင်ယူရမည့်အချက်များ:** ဒေတာဘေ့စ် ပေါင်းစည်းမှု, ပတ်ဝန်းကျင် အပြင်ဘက် သတ်မှတ်ချက်များ, connection strings  
   **မျှော်လင့်ရမည့် ရလဒ်:** CRUD လုပ်ဆောင်နိုင်သော Todo list app

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ဖြင့် React static website တင်ဆောင်ပါ  
   **အချိန်:** 20-30 မိနစ် | **ကုန်ကျစရိတ်:** $0-10/လ  
   **သင်ယူရမည့်အချက်များ:** Static hosting, serverless functions, CDN တပ်ဆင်ခြင်း  
   **မျှော်လင့်ရမည့် ရလဒ်:** API backend ရှိသည့် React UI, အလိုအလျောက် SSL, ကမ္ဘာလုံးဆိုင်ရာ CDN

### အလယ်အလတ် အသုံးပြုသူများ
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ဒေသတွင်း) ⭐⭐  
   gpt-4.1 ကို chat အင်တာဖေ့စ်နှင့် လုံခြုံသော API key စီမံခန့်ခွဲမှုဖြင့် တပ်ဆင်ပါ  
   **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/လ  
   **သင်ယူရမည့်အချက်များ:** Microsoft Foundry Models deployment, Key Vault ပေါင်းစည်းမှု, token tracking  
   **မျှော်လင့်ရမည့် ရလဒ်:** gpt-4.1 နှင့် ကုန်ကျစရိတ်ပြန်လည်ကြည့်ရှုနိုင်သော chat application တစ်ခု

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ဒေသတွင်း) ⭐⭐⭐⭐  
   ထုတ်လုပ်နိုင်သော မျိုးစုံ ဝန်ဆောင်မှု ဖွဲ့စည်းပုံ  
   **အချိန်:** 45-60 မိနစ် | **ကုန်ကျစရိတ်:** $50-150/လ  
   **သင်ယူရမည့်အချက်များ:** ဝန်ဆောင်မှုဆက်သွယ်မှု, message queuing, distributed tracing  
   **မျှော်လင့်ရမည့် ရလဒ်:** API Gateway + Product Service တို့ပါဝင်သည့် 2-ဝန်ဆောင်မှု စနစ်နှင့် မော်နီတာရေး

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API နှင့် Azure SQL Database ပါသော Web application  
   **အချိန်:** 30-45 မိနစ် | **ကုန်ကျစရိတ်:** $20-80/လ  
   **သင်ယူရမည့်အချက်များ:** Entity Framework, database migrations, connection security  
   **မျှော်လင့်ရမည့် ရလဒ်:** Azure SQL backend နှင့် C# API တစ်ခု

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP trigger များနှင့် Cosmos DB ကို အသုံးပြုသည့် Python Azure Functions  
   **အချိန်:** 30-40 မိနစ် | **ကုန်ကျစရိတ်:** $10-40/လ  
   **သင်ယူရမည့်အချက်များ:** အဖြစ်အပေါ် အခြေခံ Architecture, serverless scaling, NoSQL ပေါင်းစည်းမှု  
   **မျှော်လင့်ရမည့် ရလဒ်:** HTTP request များကို တုံ့ပြန်နိုင်သော Function app တစ်ခု

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps နှင့် API gateway ကို အသုံးပြုသည့် မျိုးစုံ Java application  
   **အချိန်:** 60-90 မိနစ် | **ကုန်ကျစရိတ်:** $80-200/လ  
   **သင်ယူရမည့်အချက်များ:** Spring Boot တပ်ဆင်ခြင်း, service mesh, load balancing  
   **မျှော်လင့်ရမည့် ရလဒ်:** service discovery နှင့် routing ပါဝင်သည့် မျိုးစုံ Java စနစ်

### Microsoft Foundry ပုံစံများ

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   gpt-4.1 အပြည့်အစုံ deployment နှင့် chat အင်တာဖေ့စ်  
   **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/လ  
   **မျှော်လင့်ရမည့် ရလဒ်:** token tracking နှင့် ကုန်ကျစရိတ် မော်နီတာရေး ပါရှိသည့် chat application တစ်ခု

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG ဆောက်လုပ်ပုံပါရှိသည့် ထူးခန်းသော chat application  
   **အချိန်:** 60-90 မိနစ် | **ကုန်ကျစရိတ်:** $100-300/လ  
   **မျှော်လင့်ရမည့် ရလဒ်:** စာရွက်စာတမ်း ရှာဖွေရေးနှင့် ကိုးကားချက်များ ပါဝင်သည့် RAG အခြေခံ chat အင်တာဖေ့စ်

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ဝန်ဆောင်မှုများကို အသုံးပြုသော စာရွက်စာတမ်း ခွဲခြမ်းစိတ်ဖြာခြင်း  
   **အချိန်:** 40-60 မိနစ် | **ကုန်ကျစရိတ်:** $20-80/လ  
   **မျှော်လင့်ရမည့် ရလဒ်:** တင်သွင်းထားသော စာရွက်စာတမ်းများမှ စာသား၊ စားပွဲများနှင့် အရာဝတ္ထုများကို ထုတ်ယူသည့် API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ဖြင့် MLOps workflow  
   **အချိန်:** 2-3 နာရီ | **ကုန်ကျစရိတ်:** $150-500/လ  
   **မျှော်လင့်ရမည့် ရလဒ်:** သင်ကြားရေး၊ ထုတ်လုပ်ခြင်းနှင့် မော်နီတာရေး ပါရှိသည့် အလိုအလျောက် ML pipeline

### လက်တွေ့အခြေအနေများ

#### **ရောင်းဝယ်ရေး မျိုးစုံ အေးဂျင့် ဖြေရှင်းချက်** 🆕  
**[အပြည့်အစုံ အကောင်အထည်ဖော်ခြင်း လမ်းညွှန်ချက်](./retail-scenario.md)**

လက်တွေ့အသုံးချနိုင်ပြီး ထုတ်လုပ်မှုအဆင့်ကို တက်နိုင်သော မျိုးစုံ အေးဂျင့် ဖောက်သည်ပံ့ပိုးမှု ဖြေရှင်းချက်တစ်ခုဖြစ်ကာ AZD ဖြင့် စီးပွားရေးအဆင့် AI အက်ပလီကေးရှင်း တပ်ဆင်မှုကို ပြသပေးသည်။ ဤ ဖြစ်ရပ်ကိစ္စသည် အောက်ပါအရာများကို ပံ့ပိုးပေးသည်:
- **Complete Architecture**: မူလီ-အေးဂျင့် စနစ် — ဖောက်သည်ဝန်ဆောင်မှုနှင့် ကုန်ပစ္စည်း စီမံခန့်ခွဲမှုအတွက် အထူးပြု အေးဂျင့်များပါဝင်သည်
- **Production Infrastructure**: များစွာသော ဒေသများတွင် Microsoft Foundry Models တင်ဆက်မှုများ၊ Azure AI Search, Container Apps နှင့် စုံလင်သော မော်နီတာလုပ်ငန်းစဉ်များ
- **Ready-to-Deploy ARM Template**: တစ်ချက်နှိပ်ခြင်းဖြင့် တပ်ဆင်နိုင်ပြီး မတူညီသည့် ဖွဲ့စည်းပုံ မီ (Minimal/Standard/Premium) များပါဝင်သည်
- **Advanced Features**: ကိုက်ရိုက်လုံခြုံရေးစစ်ဆေးမှု (red teaming), အေးဂျင့်အကဲဖြတ်မှု ဖရိမ်းဝပ်, ကုန်ကျစရိတ် အလိုက်သိမြင်ရန်, ပြဿနာရှာဖွေထုတ်ပြန်ချက်များ
- **Real Business Context**: လက်လီရောင်းသူ ဖောက်သည်ထောက်ခံမှု အလုပ်လက်တွေ့ကိစ္စ — ဖိုင်တင်ခြင်း၊ ရှာဖွေမှု ပေါင်းစည်းမှုနှင့် နိုင်ငံခြားအလိုက် စနစ်ကာလာပေးမှု

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (အဆင့်မြင့် - အဖွဲ့အစည်း ထုတ်လုပ်မှု အသင့်)

**Perfect for**: AI ဖွံ့ဖြိုးရေးသူများ၊ ဖြေရှင်းချက် ဖန်တီးသူများနှင့် ထုတ်လုပ်မှု မူလီ-အေးဂျင့် စနစ်များ တည်ဆောက်နေသော အဖွဲ့များ

**Quick Start**: နှစ်ရာမိနစ် 30 ထက်နည်းစြာ ဖြင့် အပြည့်အစုံဖြဲ ့စည်းမှုကို ARM တမ်းပလိတ်ဖြင့် တပ်ဆင်ရန် `./deploy.sh -g myResourceGroup` ကို အသုံးပြုပါ

## 📋 အသုံးပြုနည်းလမ်းညွှန်

### ရရှိရန်လိုအပ်ချက်များ

Before running any example:
- ✅ Azure subscription သည် Owner သို့ Contributor ခွင့်များရှိရပါမည်
- ✅ Azure Developer CLI တပ်ဆင်ပြီးဖြစ်ရမည် ([တပ်ဆင်ခြင်းလမ်းညွှန်](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop သတ်မှတ်ထားသလို စတင်လုပ်ဆောင်နေပါစေ (container ဥပမာများအတွက်)
- ✅ လိုအပ်သည့် Azure quota များ ရှိ/ခွင့်ပြုထားသည်ကို စစ်ဆေးပါ (ဥပမာအလိုက်လိုအပ်ချက်များကို ကြည့်ပါ)

> **💰 Cost Warning:** ဥပမာအားလုံးသည် အချက်အလက်များဖန်တီးပြီး အခကြေးငွေ တင်ဖို့ ဖြစ်စေပါသည်။ ကုန်ကျစရိတ် ခန့်မှန်းချက်များအတွက် သီးခြား README ဖိုင်များကို ကြည့်ပါ။ အလုပ်ပြီးပါက အခက်အခဲများမဖြစ်စေရန် `azd down` ကို အလုပ်လုပ်စေပါ။

### တိုက်ရိုက် ကိုင်တွယ် ပြုလုပ်ခြင်း (Running Examples Locally)

1. **Clone or Copy Example**
   ```bash
   # လိုချင်သည့် ဥပမာသို့ သွားပါ
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # ရှိပြီးသား နမူနာဖြင့် စတင်ပါ
   azd init
   
   # သို့မဟုတ် ပတ်ဝန်းကျင် အသစ် တစ်ခု ဖန်တီးပါ
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # လိုအပ်သော တန်ဖိုးများကို သတ်မှတ်ပါ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # အင်ဖရာစထရက်ချာနှင့် အက်ပလီကေးရှင်းကို ဖြန့်ချိပါ
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # ဝန်ဆောင်မှု endpoint များကို ရယူပါ
   azd env get-values
   
   # endpoint ကို စမ်းသပ်ပါ (ဥပမာ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Expected Success Indicators:**
   - ✅ `azd up` ဆိုရင် အမှားမရှိဘဲ ပြီးဆုံးရမည်
   - ✅ ဝန်ဆောင်မှု endpoint မှ HTTP 200 ပြန်လာရမည်
   - ✅ Azure Portal တွင် "Running" အခြေအနေကို ပြပါလိမ့်မည်
   - ✅ Application Insights သို့ telemetry စာရင်းများ လက်ခံရရှိနေပါသည်

> **⚠️ Issues?** တပ်ဆင်မှု ပြဿနာများအတွက် [ပုံမှန် ပြဿနာများ](../docs/chapter-07-troubleshooting/common-issues.md) ကို ကြည့်ပါ

### ဥပမာများကို ကိုယ့်လို အလိုက် ပြင်ဆင်ခြင်း

Each example includes:
- **README.md** - သေချာသော စတင်အဆင့်နှင့် စိတ်ကြိုက်ပြင်ဆင်ရေး လမ်းညွှန်ချက်များ
- **azure.yaml** - မှတ်ချက်များပါရှိသည့် AZD ဖွဲ့စည်းပုံ
- **infra/** - parameter အကြောင်းရှင်းလင်းချက်များပါသော Bicep တမ်းပလိတ်များ
- **src/** - နမူနာ အက်ပလီကေးရှင်း ကုဒ်
- **scripts/** - အထူးအလုပ်များအတွက် အကူအညီ စက်ရုပ် စာရွက်များ

## 🎯 သင်ယူရန် ရည်ရွယ်ချက်များ

### ဥပမာ အမျိုးအစားများ

#### **အခြေခံ တင်ဆက်မှုများ**
- တစ်ဝန်ဆောင်မှု အသေးစား အက်ပလီကေးရှင်းများ
- ရိုးရှင်းသော အင်ဖရာစတပ်ချာ ပုံစံများ
- မူလက်ဖိုင်ပြုပြင်ခြင်း မစုံလင်သော ကွန်ဖစ်ဂျူရေးရှင်းများ
- သက်သာစွာ ဖွံ့ဖြိုးရေး သတ်မှတ်ချက်များ

#### **တိုးတက်သော အခြေအနေများ**
- မျိုးစုံ ဝန်ဆောင်မှု ပက်သ်ဖော်မားများ
- ပြင်းထန်သော ကွန်ယက် ဖွဲ့စည်းမှုများ
- ဒေတာဘေ့စ် ပေါင်းစည်းမှု ပုံစံများ
- လုံခြုံရေးနှင့် မွန်ကြမ်းအချက်များ အကောင်အထည်ဖော်ခြင်း

#### **ထုတ်လုပ်မှု အသင့် ပုံစံများ**
- အမြင့်ရရှိနိုင်စွမ်း ဖွဲ့စည်းမှုများ
- မော်နီတာနှင့် ကြည့်ရှုနိုင်မှု
- CI/CD ပေါင်းစည်းမှု
- ဘေးအန္တရာယ် ပြန်လည်ယူသံခေါင်း ဖြေရှင်းနည်းများ

## 📖 ဥပမာ ဖော်ပြချက်များ

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: အခြေခံ တင်ဆက်မှု, REST API, NoSQL ဒေတာဘေ့စ် ပေါင်းစည်းမှု

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: Static hosting, serverless backend, ခေတ်မှီ ဝက်ဘ်ဖွံ့ဖြိုးရေး

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: ကွန်တိန်နာပြုပြင်ခြင်း, REST API, scale-to-zero, health probes, မော်နီတာလုပ်ငန်း  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: မျိုးစုံ ဝန်ဆောင်မှု ဖွဲ့စည်းမှု, ဝန်ဆောင်မှု ဆက်သွယ်ရေး, message queuing, distributed tracing  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework, ဒေတာဘေ့စ် ချိတ်ဆက်မှုများ, ဝက်ဘ် API ဖွံ့ဖြိုးရေး

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: event-driven ဖွဲ့စည်းမှု, serverless ကွန်ပျူတင်း, full-stack ဖွံ့ဖြိုးရေး

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: မိုက်ခရိုဆာဗစ် ဆက်သွယ်ရေး, distributed systems, အဖွဲ့အစည်း ပုံစံများ

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG architecture, vector search, LLM ပေါင်းစည်းမှု

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: စာရွက်စာတမ်း သုံးသပ်ခြင်း, OCR, ဒေတာ ထုတ်ယူခြင်း

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: မော်ဒယ် သင်ကြားမှု, တင်သွင်းရေး လိုင်းများ, မော်နီတာလုပ်ငန်း

## 🛠 ဖော်ပြချက်များ (Configuration Examples)

The `configurations/` directory contains reusable components:

### ပတ်ဝန်းကျင် ဖော်ပြချက်များ
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep Modules
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### အကူအညီ စကရစ်များ
- ပတ်ဝန်းကျင် စတင်ခြင်း အလိုအလျောက်လုပ်ဆောင်ရေး
- ဒေတာဘေ့စ် ပြောင်းရွှေ့ရေး စကရစ်များ
- တပ်ဆင်မှု အတည်ပြု စစ်ဆေးရေး ကိရိယာများ
- ကုန်ကျစရိတ် တွက်မည့် အကူအညီ စနစ်များ

## 🔧 စိတ်ကြိုက် ပြင်ဆင်ခြင်း လမ်းညွှန်

### ကိုယ့်လို အကြောင်းအရာအတွက် ဥပမာများကို ပြင်ဆင်ခြင်း

1. **လိုအပ်ချက်များကို ပြန်သုံးသပ်ပါ**
   - Azure ဝန်ဆောင်မှု မလိုအပ်ချက်များကို စစ်ဆေးပါ
   - subscription အကန့်ကြေးများကို အတည်ပြုပါ
   - ကုန်ကျစရိတ် သဘောထားကို နားလည်ပါ

2. **ဖော်ပြချက်များကို ပြင်ဆင်ပါ**
   - `azure.yaml` မှာ ဝန်ဆောင်မှု သတ်မှတ်ချက်များကို အပ်ဒိတ်လုပ်ပါ
   - Bicep template များကို စိတ်ကြိုက် ပြင်ဆင်ပါ
   - ပတ်ဝန်းကျင် များအတွက် environment variables များ ပြင်ဆင်ပါ

3. **ပထမဦးဆုံး Thorough စမ်းသပ်ပါ**
   - Development ပတ်ဝန်းကျင်တွင် ပထမဦးဆုံး တင်ဆင်ပါ
   - လုပ်ဆောင်ချက်များကို အတည်ပြုပါ
   - scaling နှင့် performance ကို စမ်းသပ်ပါ

4. **လုံခြုံရေး ပြန်လည်စစ်ဆေးခြင်း**
   - access control များကို စစ်ဆေးပါ
   - secrets မန်နေဂျ်မင့် ကို အကောင်အထည်ဖော်ပါ
   - မော်နီတာနှင့် အချက်အလက် သတိပေးမှုများ ဖွင့်ပါ

## 📊 နှိုင်းယှဉ်ဇယား (Comparison Matrix)

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 သင်ယူရေး လမ်းကြောင်း

### အကြံပြု တိုးတက်မှု အဆင့်များ

1. **Simple Web App နှင့် စတင်ပါ**
   - AZD အခြေခံ အယူအဆများကို လေ့လာပါ
   - တင်ဆင်မှု လုပ်ငန်းစဉ်ကို နားလည်ပါ
   - ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုကို လေ့ကျင့်ပါ

2. **Static Website ကို ကြိုက်နှစ်သက်ပါ**
   - အမျိုးမျိုးသော hosting ရွေးချယ်စရာများကို စူးစမ်းပါ
   - CDN ပေါင်းစည်းမှုကို လေ့လာပါ
   - DNS ဖော်ပြချက်များကို နားလည်ပါ

3. **Container App ဆီသို့ ရောက်ပါ**
   - ကွန်တိန်နာ အခြေခံများကို သင်ယူပါ
   - scaling အယူအဆများကို နားလည်ပါ
   - Docker နှင့် လက်တွေ့ လေ့ကျင့်ပါ

4. **ဒေတာဘေ့စ် ပေါင်းစည်းမှု ထပ်ထည့်ပါ**
   - ဒေတာဘေ့စ် ပူးပေါင်းမှုကို အတည်ပြုရန် သင်ယူပါ
   - connection strings များကို နားလည်ပါ
   - secrets မန်နေဂျ်မင့် ကို လက်တွေ့ ပြုလုပ်ကြည့်ပါ

5. **Serverless ကို စူးစမ်းပါ**
   - event-driven ဖွဲ့စည်းမှုကို နားလည်ပါ
   - triggers နှင့် bindings များကို သင်ယူပါ
   - API များနှင့် လက်တွေ့ လေ့ကျင့်ပါ

6. **Microservices တည်ဆောက်ပါ**
   - ဝန်ဆောင်မှု ဆက်သွယ်ရေးကို သင်ယူပါ
   - distributed systems ကို နားလည်ပါ
   - ရိုင်းစိုင်းသော တင်ဆင်မှုများကို လေ့လာပါ

## 🔍 ကိုယ့်အတွက် မှန်ကန်သည့် ဥပမာ ရှာဖွေခြင်း

### နည်းပညာအရ (By Technology Stack)
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ဖွဲ့စည်းမှု ဗဟိုအပေါ် (By Architecture Pattern)
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### စိမ်းလန်းမှု အဆင့်တန်း အရ (By Complexity Level)
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (စုံလင်သော မူလီ-အေးဂျင့် စနစ်နှင့် ARM template တပ်ဆင်မှု)

## 📚 ထပ်မံ ရယူနိုင်သော အရင်းအမြစ်များ

### Documentation Links
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure Samples AZD နမူနာပုံစံများ](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry နမူနာပုံစံများ](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI ပြခန်း](https://azure.github.io/awesome-azd/)
- [C# နှင့် Azure SQL ဖြင့် Todo အက်ပ်](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python နှင့် MongoDB ဖြင့် Todo အက်ပ်](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js နှင့် PostgreSQL ဖြင့် Todo အက်ပ်](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API ဖြင့် React ဝက်ဘ် အက်ပ်](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps အလုပ်](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ဖြင့် Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ
- [Azure Well-Architected ဖရိမ်ဝတ်](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption ဖရိမ်ဝတ်](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ဥပမာများ ပံ့ပိုးမှု

မျှဝေလိုသော အသုံးဝင်သော ဥပမာ တစ်ခု ရှိပါသလား? ဥပမာများ ပေးပို့ရန် ကျွန်တော်တို့သည် ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. တိကျစွာ သတ်မှတ်ထားသည့် ဖိုင်ဖွဲ့စည်းပုံကို လိုက်နာပါ
2. စုံလင်သော README.md ကို ထည့်ပါ
3. ဖော်ပြချက်ဖိုင်များတွင် မှတ်ချက်များ ထည့်ပါ
4. တင်သွင်းမီ အပြည့်အစုံ စမ်းသပ်ပါ
5. ကုန်ကျစရိတ် ခန့်မှန်းချက်များနှင့် လိုအပ်ချက်များကို ထည့်ပါ

### ဥပမာ ပုံစံ ဖွဲ့စည်းပုံ
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

**အကြံပေးချက်**: သင့်နည်းပညာ စက်တင်နှင့် ကိုက်ညီသော အလွယ်ဆုံး ဥပမာဖြင့် စတင်ပါ၊ ထို့နောက် ဖြင့်ပိုပြီး ရှုပ်ထွေးတဲ့ အခြေအနေများဆီသို့ ဖြေရှင်းပုံများအား စဥ်ဆက်မပြတ် တိုးတက်စေပါ။ မည်သည့် ဥပမာမျိုးမဆို ယခင် ဥပမာများမှ အကြောင်းအရာများကို အခြေခံပြီး တည်ဆောက်ထားသည်။

## 🚀 စတင်ဖို့ အသင့်ပါပြီ?

### သင့် သင်ယူရေး လမ်းစဉ်

1. **လုံးဝ စတင်သူလား?** → [Flask API](../../../examples/container-app/simple-flask-api) မှ စတင်ပါ (⭐, 20 မိနစ်)
2. **AZD အခြေခံအသိပညာ ရှိပါသလား?** → [Microservices](../../../examples/container-app/microservices) ကို စမ်းသပ်ကြည့်ပါ (⭐⭐⭐⭐, 60 မိနစ်)
3. **AI အက်ပ်များ တည်ဆောက်နေပါသလား?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) ဖြင့် စတင်ပါ (⭐⭐, 35 မိနစ်) သို့မဟုတ် [Retail Multi-Agent](retail-scenario.md) ကို ရှာဖွေကြည့်ပါ (⭐⭐⭐⭐, 2 နာရီကျော်)
4. **တိကျတဲ့ နည်းပညာ စက်တင် လိုပါသလား?** → အထက်ပါ [Finding the Right Example](#-finding-the-right-example) အပိုင်းကို သုံးပါ

### နောက်တစ်ဆင့်များ

- ✅ အထက်ပါ [Prerequisites](#ရရှိရန်လိုအပ်ချက်များ) ကို ပြန်လည်ဆန်းစစ်ပါ
- ✅ သင့် ကျွမ်းကျင်မှုအဆင့်နှင့် ကိုက်ညီသည့် ဥပမာကို ရွေးချယ်ပါ (ကြည့်ရန် [Complexity Legend](#ခက်ခဲမှု-အဆင့်ဖော်ပြချက်))
- ✅ တပ်ဆင်ရန်မလုပ်မီ ဥပမာ၏ README ကို စုံစမ်းဖတ်ရှုပါ
- ✅ စမ်းသပ်ပြီးနောက် `azd down` ကို ပြေးရန် သတိပေးချက် တစ်ခု ထားပါ
- ✅ သင့် အတွေ့အကြုံကို GitHub Issues သို့မဟုတ် Discussions မှတဆင့် မျှဝေပါ

### အကူအညီ လိုပါသလား?

- 📖 [FAQ](../resources/faq.md) - တွေ့ရလေ့ရှိသော မေးခွန်းများကို ဖြေကြားထားသည်
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - တပ်ဆင်ခြင်း ဆိုင်ရာပြဿနာများကို ဖြေရှင်းရန်
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - အသိုင်းအဝိုင်းထံ မေးမြန်းပါ
- 📚 [Study Guide](../resources/study-guide.md) - သင်ယူမှုကို အတိုးအမြှင့်ပြုပါ

---

**လမ်းညွှန်**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 သင်ယူရေး ပစ္စည်းများ**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 ရင်းမြစ်များ**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*နောက်ဆုံး ပြင်ဆင်သည့်ရက်: နိုဝင်ဘာ 2025 | [Report Issues](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribute Examples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) က ဖြင့် ဘာသာပြန်ထားသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသည်၊ သို့သော် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်သည့် အချက်အလက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလဘာသာဖြင့် ရေးသားထားသည့် မူရင်းစာတမ်းကို အာဏာပိုင် မူရင်းအရင်းအမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဖြင့် ပြုလုပ်သော ဘာသာပြန်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်အတွက် ဖြစ်ပေါ်လာနိုင်သော နားလည်မမှန်ခြင်းများ သို့မဟုတ် အဓိပ္ပာယ်မှားဖော်ပြမှုများအတွက် ကျွန်ုပ်တို့ တာဝန် မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
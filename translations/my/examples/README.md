# ဥပမာများ - လက်တွေ့ AZD နမူနာများနှင့် ဖွဲ့စည်းမှုများ

**ဥပမာဖြင့် သင်ယူခြင်း - အခန်းအလိုက် စီစဉ်ထားသည်**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 အခန်း သတ်မှတ်ချက်**: သင်ယူမှု၏ ရှုပ်ထွေးမှုအလိုက် စီစဉ်ထားသော ဥပမာများ
- **🚀 ဒေသိယ ဥပမာ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 အပြင်ဘက် AI ဥပမာများ**: Azure Samples repository များထံ လင့်ခ်များ

> **📍 အရေးကြီးချက်: ဒေသိယ ဥပမာများ vs အပြင်ဘက် ဥပမာများ**  
> ဒီ repository ထဲတွင် **ပြည့်စုံပြီး ပစ္စည်းထုတ်လုပ်ရန် အသင့်ဖြစ်သော ဒေသိယ ဥပမာ 4 ခု** ပါဝင်သည်။  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment နှင့် chat မျက်နှာပြင်)  
> - **Container Apps** (ရိုးရှင်းသော Flask API + မိုက်ခရိုဆာဗစ်များ)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (စီးပွားရေးအဆင့် AI ဖြေရှင်းချက်)  
>  
> ထို့အပြင် ဥပမာများအနက် အချို့သည် AZURE-Samples repository များထံ၏ **အပြင်ဘက် ရည်ညွှန်းချက်** ဖြစ်သည်။

## မိတ်ဆက်

ဤဖိုလ်ဒါတွင် Azure Developer CLI ကို လက်တွေ့ လေ့ကျင့်နိုင်ရန် လက်တွေ့ ဥပမာများနှင့် ရည်ညွှန်းချက်များ ပါဝင်သည်။ Retail Multi-Agent စနစ်သည် ဤ repository တွင်ပါဝင်သော ပြည့်စုံပြီး ထုတ်လုပ်နိုင်သော အကောင်အထည်ဖော်မှုဖြစ်သည်။ အခြား ဥပမာများသည် အမျိုးမျိုးသော AZD ပုံစံများကို ပြသသည့် အသိအမှတ်ပြု Azure Samples များကို ရည်ညွှန်းထားသည်။

### ရှုပ်ထွေးမှု အဆင့် လမ်းညွှန်

- ⭐ **အစပြုသူ** - အခြေခံ အယူအဆများ၊ တစ်ခုတည်းသော ဝန်ဆောင်မှု၊ 15-30 မိနစ်
- ⭐⭐ **အလယ်အလတ်** - ဝန်ဆောင်မှုအများစွာ၊ ဒေတာဘေ့စ် ပေါင်းစည်းမှု၊ 30-60 မိနစ်
- ⭐⭐⭐ **မြင့်ကျွမ်းကျင်သူ** - ရှုပ်ထွေးသော အဆောက်အအုံ၊ AI ပေါင်းစည်းမှု၊ 1-2 နာရီ
- ⭐⭐⭐⭐ **ကျွမ်းကျင်သူ** - ထုတ်လုပ်ရန် အသင့်၊ စီးပွားရေး ပုံစံများ၊ 2 နာရီထက်ပို

## 🎯 ဒီ Repository ထဲမှာ အမှန်တကယ် ဘာတွေ ပါသလဲ

### ✅ ဒေသိယ အကောင်အထည်ဖော်မှု (အသုံးပြုပြီးသား)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**ဤ repo တွင် gpt-4.1 deployment နှင့် chat မျက်နှာပြင် ပြည့်စုံ ပါဝင်သည်**

- **တည်နေရာ:** `examples/azure-openai-chat/`
- **ရှုပ်ထွေးမှု:** ⭐⭐ (အလယ်အလတ်)
- **ပါဝင်သော အရာများ:**
  - Microsoft Foundry Models အပြည့်အစုံ တပ်ဆင်မှု (gpt-4.1)
  - Python command-line စကားဝိုင်း မျက်နှာပြင်
  - API key များ အတွက် Key Vault ပေါင်းစည်းမှု
  - Bicep အင်ဖ্রာစထဒ် တွင် template များ
  - တိုကင် အသုံးပြုမှုနှင့် ကုန်ကျစရိတ် ချုပ်ကိုင်ခြင်း
  - Rate limiting နှင့် အမှား ကွက်လပ် ကိုင်တွယ်မှု

**လျင်မြန်စတင်ရန်:**
```bash
# example သို့ သွားပါ
cd examples/azure-openai-chat

# အားလုံးကို ဖြန့်ချိပါ
azd up

# လိုအပ်သည့် dependency များကို တပ်ဆင်ပြီး စကားပြောကို စတင်ပါ
pip install -r src/requirements.txt
python src/chat.py
```

**နည်းပညာများ:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**ဤ repo တွင် container တပ်ဆင်မှု များ၏ အပြည့်အစုံ ဥပမာများ ပါဝင်သည်**

- **တည်နေရာ:** `examples/container-app/`
- **ရှုပ်ထွေးမှု:** ⭐-⭐⭐⭐⭐ (အစပြုသူ မှ မြင့်ကျွမ်းကျင်သူ)
- **ပါဝင်သော အရာများ:**
  - [Master Guide](container-app/README.md) - container တပ်ဆင်မှုများ၏ အကျဉ်းချုပ်
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - အခြေခံ REST API ဥပမာ
  - [Microservices Architecture](../../../examples/container-app/microservices) - ထုတ်လုပ်ရန် အသင့် မိုက်ခရိုဆာဗစ်ပုံစံ
  - လျင်မြန်စတင်ခြင်း၊ ထုတ်လုပ်မှုနှင့် အဆင့်မြင့် မျိုးစုံပုံစံများ
  - ကြားဖြတ်စောင့်ကြည့်မှု၊ လုံခြုံရေးနှင့် ကုန်ကျစရိတ် တိကျစွာ စီမံခြင်း

**လျင်မြန်စတင်ရန်:**
```bash
# မူလလမ်းညွှန်ကို ကြည့်ပါ
cd examples/container-app

# ရိုးရှင်းသော Flask API ကို ဖြန့်ချိပါ
cd simple-flask-api
azd up

# မိုက်ခရိုဆာဗစ် နမူနာကို ဖြန့်ချိပါ
cd ../microservices
azd up
```

**နည်းပညာများ:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**ဤ repo တွင် ပြည့်စုံပြီး ထုတ်လုပ်ရန် အသင့်ဖြစ်သော အကောင်အထည်ဖော်မှု ပါဝင်သည်**

- **တည်နေရာ:** `examples/retail-multiagent-arm-template/`
- **ရှုပ်ထွေးမှု:** ⭐⭐⭐⭐ (မြင့်ကျွမ်းကျင်)
- **ပါဝင်သော အရာများ:**
  - အပြည့်အစုံ ARM တပ်ဆင်ရေး template
  - Multi-agent ဖွဲ့စည်းပုံ (Customer + Inventory)
  - Microsoft Foundry Models ပေါင်းစည်းမှု
  - RAG ဖြင့် AI Search
  - ဖုံးလွှမ်းစုံစမ်းသော စောင့်ကြည့်မှု
  - တစ်ချက်နှိပ်ပြီး တပ်ဆင်နိုင်သော စာရွက်စနစ်

**လျင်မြန်စတင်ရန်:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**နည်းပညာများ:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 အပြင်ဘက် Azure Samples (Clone လုပ်၍ အသုံးပြုရန်)

အောက်ပါ ဥပမာများကို Azure-Samples တရားဝင် repository များတွင် သိမ်းဆည်းထားသည်။ မျိုးစုံ AZD ပုံစံများကို စူးစမ်းရန် ကလုန်း (clone) လုပ်ပါ။

### ရိုးရှင်းသော အက်ပလီကေးရှင်းများ (အခန်း 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [ဒေသိယ: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [ဒေသိယ: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**အသုံးပြုနည်း:**
```bash
# မည်သည့်ဥပမာမဆို မိတ္တူကူးယူပါ
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ဖြန့်ချိပါ
azd up
```

### AI အက်ပလီကေးရှင်း ဥပမာများ (အခန်း 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [ဒေသိယ: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | အခြေခံ AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG ပုံစံ |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | စီးပွားရေးဆိုင်ရာ AI |

### ဒေတာဘေ့စ်နှင့် အဆင့်မြင့် ပုံစံများ (အခန်း 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database ပေါင်းစည်းမှု |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | မိုက်ခရိုဆာဗစ်များ |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## သင်ယူရန် ရည်မှန်းချက်များ

ဤဥပမာများအား လက်တွေ့ လေ့ကျင့်ခြင်းဖြင့် သင်သည်:
- အသက်ဝင်သော အက်ပလီကေးရှင်း စနစ်များနှင့် Azure Developer CLI လုပ်ငန်းစဉ်များကို လေ့ကျင့်နိုင်မည်
- အမျိုးမျိုးသော အက်ပလီကေးရှင်း ဖွဲ့စည်းပုံများနှင့် ၎င်းတို့၏ azd အကောင်အထည်ဖော်မှုများကို နားလည်မည်
- အမျိုးမျိုးသော Azure ဝန်ဆောင်မှုများအတွက် Infrastructure as Code ပုံစံများကို ကျွမ်းကျင်မည်
- ဖိုင်ချိန်ညှိနှိုင်းမှုနှင့် ပတ်ဝန်းကျင် အလိုက် တပ်ဆင်မှုနည်းလမ်းများကို အသုံးချနိုင်မည်
- ကြားဖြတ်စောင့်ကြည့်မှု၊ လုံခြုံရေးနှင့် အတိုင်းအတာ(regulating scaling) ပုံစံများကို လက်တွေ့ အကောင်အထည်ဖော်နိုင်မည်
- တကယ့် ထုတ်လုပ်မှုပတ်ဝန်းကျင်များတွင် ဖြစ်ပေါ်တတ်သည့် ပြဿနာများကို အမှန်တကယ် ဖြေရှင်းခြင်းနှင့် အမှားရှာဖွေရေး အတွေ့အကြုံ ရရှိမည်

## သင်ယူပြီး ရရှိမည့် ရလဒ်များ

ဤဥပမာများကို ပြီးမြောက်လျှင် သင်သည်:
- Azure Developer CLI ဖြင့် အမျိုးမျိုးသော အက်ပလီကေးရှင်း များကို ယုံကြည်စိတ်ချစွာ တပ်ဆင်နိုင်မည်
- ပေးထားသော template များကို သင့်အပ်lication လိုအပ်ချက်များအတိုင်း ကိုက်ညီစွာ ပြင်ဆင်နိုင်မည်
- Bicep ကို အသုံးပြုပြီး စိတ်ကြိုက် အင်ဖရာစထဒ် ပုံစံများ ဒီဇိုင်းဆွဲနှင့် ဖန်တီးနိုင်မည်
- တာဝန်ချီးမြှင့်ထားသော multi-service အက်ပလီကေးရှင်းများကို မှန်ကန်သော အချိန် ကန့်သတ်ချက်နှင့် သက်ဆိုင်ရာ အားပေးမှုများနှင့် ပြင်ဆင်နိုင်မည်
- လုံခြုံရေး၊ စောင့်ကြည့်မှုနှင့် ဖျော်ဖြေရေး အကောင်းဆုံးလေ့ကျင့်မှုများကို လက်တွေ့ အကောင်အထည်ဖော်နိုင်မည်
- လက်တွေ့ အခြေအနေများအရ ထပ်ပိုင်းပြဿနာရှာဖွေအား အမှန်တကယ် ဖြေရှင်းနိုင်မည်

## ဖိုင်များ ဖွဲ့စည်းပုံ

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

## လျင်မြန်စတင်ရန် ဥပမာများ

> **💡 AZD ကို အသစ်လေ?** ဥပမာ #1 (Flask API) နှင့် စတင်ပါ - လက်တွေ့ အနည်းငယ် ~20 မိနစ်ယူပြီး အဓိက အယူအဆများကို သင်ယူစေမည်။

### အစပြုသူများအတွက်
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ဒေသိယ) ⭐  
   scale-to-zero အားဖြင့် ရိုးရှင်း REST API တပ်ဆင်ပါ  
   **အချိန်:** 20-25 မိနစ် | **ကုန်ကျစရိတ်:** $0-5/month  
   **သင်ယူရမည့်အရာများ:** azd အခြေခံ လုပ်ငန်းစဉ်၊ containerization, health probes  
   **မျှော်မှန်းရလဒ်:** "Hello, World!" ကို ပြန်လည်ပေးသွားမည့် လက်တွေ့ API endpoint နှင့် စောင့်ကြည့်မှု

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express web app ကို MongoDB နှင့် တပ်ဆင်ပါ  
   **အချိန်:** 25-35 မိနစ် | **ကုန်ကျစရိတ်:** $10-30/month  
   **သင်ယူရမည့်အရာများ:** ဒေတာဘေ့စ် ပေါင်းစည်းမှု, environment variables, connection strings  
   **မျှော်မှန်းရလဒ်:** create/read/update/delete လုပ်ဆောင်နိုင်သည့် Todo list app

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps ဖြင့် React static website ကို တင်ဆက်ပါ  
   **အချိန်:** 20-30 မိနစ် | **ကုန်ကျစရိတ်:** $0-10/month  
   **သင်ယူရမည့်အရာများ:** static hosting, serverless functions, CDN တင်ဆက်ခြင်း  
   **မျှော်မှန်းရလဒ်:** API backend ပါရှိသည့် React UI, အလိုအလျောက် SSL, အပြည်ပြည်ဆိုင်ရာ CDN

### အလယ်အလတ် အသုံးပြုသူများ
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (ဒေသိယ) ⭐⭐  
   gpt-4.1 နှင့် chat မျက်နှာပြင်၊ API key များကို လုံခြုံစွာ စီမံချက်များဖြင့် တပ်ဆင်ပါ  
   **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/month  
   **သင်ယူရမည့်အရာများ:** Microsoft Foundry Models တပ်ဆင်ခြင်း, Key Vault ပေါင်းစည်းမှု, token တွက်ချက်မှု  
   **မျှော်မှန်းရလဒ်:** gpt-4.1 အား အသုံးပြုပြီး token tracking နှင့် ကုန်ကျစရိတ် စောင့်ကြည့်နိုင်သည့် စကားဝိုင်း အက်ပလီကေးရှင်း

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (ဒေသိယ) ⭐⭐⭐⭐  
   ထုတ်လုပ်ရန် အသင့် multi-service ဖွဲ့စည်းပုံ  
   **အချိန်:** 45-60 မိနစ် | **ကုန်ကျစရိတ်:** $50-150/month  
   **သင်ယူရမည့်အရာများ:** ဝန်ဆောင်မှု ဆက်သွယ်မှု, message queuing, distributed tracing  
   **မျှော်မှန်းရလဒ်:** API Gateway + Product Service တို့ပါသည့် 2-ဝန်ဆောင်မှု စနစ်နှင့် စောင့်ကြည့်မှု

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API နှင့် Azure SQL Database ပါသည့် web app  
   **အချိန်:** 30-45 မိနစ် | **ကုန်ကျစရိတ်:** $20-80/month  
   **သင်ယူရမည့်အရာများ:** Entity Framework, database migrations, connection security  
   **မျှော်မှန်းရလဒ်:** Azure SQL backend ဖြင့် C# API, အလိုအလျောက် schema တပ်ဆင်မှု

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP triggers နှင့် Cosmos DB ထောက်ပံ့မှုရှိသည့် Python Azure Functions  
   **အချိန်:** 30-40 မိနစ် | **ကုန်ကျစရိတ်:** $10-40/month  
   **သင်ယူရမည့်အရာများ:** event-driven architecture, serverless scaling, NoSQL ပေါင်းစည်းခြင်း  
   **မျှော်မှန်းရလဒ်:** HTTP request များကို တုံ့ပြန်ပြီး Cosmos DB သို့ သိမ်းဆည်းနိုင်သည့် function app

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps နှင့် API gateway ပါသော Multi-service Java app  
   **အချိန်:** 60-90 မိနစ် | **ကုန်ကျစရိတ်:** $80-200/month  
   **သင်ယူရမည့်အရာများ:** Spring Boot တပ်ဆင်မှု, service mesh, load balancing  
   **မျှော်မှန်းရလဒ်:** service discovery နှင့် routing ပါသော multi-service Java စနစ်

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   gpt-4.1 deployment နှင့် chat မျက်နှာပြင် ပြည့်စုံ  
   **အချိန်:** 35-45 မိနစ် | **ကုန်ကျစရိတ်:** $50-200/month  
   **မျှော်မှန်းရလဒ်:** token tracking နှင့် ကုန်ကျစရိတ် စောင့်ကြည့်မှု ပါရှိသည့် chat အက်ပလီကေးရှင်း

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG အဆောက်အအုံပါ Intelligent chat application  
   **အချိန်:** 60-90 မိနစ် | **ကုန်ကျစရိတ်:** $100-300/month  
   **မျှော်မှန်းရလဒ်:** document search နှင့် citation များပါဝင်သည့် RAG အခြေခံ chat မျက်နှာပြင်

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI ဝန်ဆောင်မှုများကို အသုံးပြု၍ စာရွက်စာတမ်း ခွဲခြားစိစစ်ခြင်း  
   **အချိန်:** 40-60 မိနစ် | **ကုန်ကျစရိတ်:** $20-80/month  
   **မျှော်မှန်းရလဒ်:** အပ်လုတ်ထားသော စာရွက်များမှ စာသား၊ ဇယားနှင့် အချက်အလက်များ ထုတ်ယူပေးသည့် API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning ဖြင့် MLOps လုပ်ငန်းစဉ်  
   **အချိန်:** 2-3 နာရီ | **ကုန်ကျစရိတ်:** $150-500/month  
   **မျှော်မှန်းရလဒ်:** သင်ကြားရေး၊ တပ်ဆင်ရေးနှင့် စောင့်ကြည့်မှုပါရှိသည့် အလိုအလျောက် ML pipeline

### လက်တွေ့ အခြေအနေများ

#### **Retail Multi-Agent Solution** 🆕
**[ပြည့်စုံ အကောင်အထည်ဖော် လမ်းညွှန်](./retail-scenario.md)**

စီးပွားရေးအဆင့် AI အက်ပလီကေးရှင်းကို AZD ဖြင့် တပ်ဆင်သည့် အကောင်အထည်ဖော်မှုများကို ပြသသည့် ပြည့်စုံ၊ ထုတ်လုပ်ရန် အသင့် multi-agent ဖောက်သည်ပံ့ပိုးမှု ဖြေရှင်းချက် ဖြစ်သည်။ ဒီစနစ်တွင် အောက်ပါအရာများ ပါဝင်သည် -

- **အပြည့်အစုံ အဆောက်အအုံ:** အထူးပြု ဖောက်သည်ဆိုင်ရာ ဝန်ဆောင်မှု agent နှင့် အရေအတွက်စီမံခန့်ခွဲမှု agent များပါဝင်သည့် multi-agent စနစ်
- **ထုတ်လုပ်ရေးအဆောက်အအုံ (Production Infrastructure)**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **တပ်ဆင်ရန် အသင့်ဖြစ်သော ARM Template**: တစ်ချက်နှိပ်ပြီး အမျိုးမျိုးသော configuration မုဒ်များဖြင့် တပ်ဆင်နိုင်သည် (Minimal/Standard/Premium)
- **တိုးတက်သော လက္ခဏာများ (Advanced Features)**: red teaming လုံခြုံရေး အတည်ပြုချက်, agent အကဲဖြတ်ရေး ဖရိမ်းဝတ်, ကုန်ကျစရိတ် ထိရောက်စွာ စီမံခြင်း၊ နှင့် ပြဿနာဖြေရှင်းရေး လမ်းညွှန်များ
- **အမှန်တကယ် စီးပွားရေး အခြေအနေ (Real Business Context)**: ဖိုင်အပ်လုတ်များ၊ ရှာဖွေမှု ပေါင်းစည်းခြင်းနှင့် dynamic scaling ပါဝင်သည့် လက်ကား/လက်လီ ဆိုင်ဖောက်သည် ထောက်ပံ့မှု စနစ်

**နည်းပညာများ (Technologies)**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**ရှုပ်ထွေးမှု (Complexity)**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**သင့်တော်သည့်ပုဂ္ဂိုလ်/အသင်း (Perfect for)**: AI ဖန်တီးသူများ, solution architects, နှင့် production multi-agent systems တည်ဆောက်နေသော အသင်းများ

**လျင်မြန်စတင်ရန် (Quick Start)**: အတွင်းပါ ARM template ကို အသုံးပြုပြီး `./deploy.sh -g myResourceGroup` ဖြင့် 30 မိနစ်အတွင်း အပြည့်အစုံကို တပ်ဆင်နိုင်သည်

## 📋 အသုံးပြုမှု ညွှန်ကြားချက်များ

### အရင်လိုအပ်ချက်များ

မည်သည့် ဥပမာကိုမဆို လည်ပတ်ရမီ:
- ✅ Owner သို့မဟုတ် Contributor ခွင့်ရှိသော Azure subscription
- ✅ Azure Developer CLI 설치ပြီး 있음 ([တပ်ဆင်ခြင်း လမ်းညွှန်](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop တက်နေမှု (container ဥပမာများအတွက်)
- ✅ သင့်တော်သော Azure quota များ (ဥပမာအလိုက်လိုအပ်ချက်များကို စစ်ဆေးပါ)

> **💰 သတိပေးချက် (Cost Warning):** ဥပမာများအားလုံးသည် စစ်မှန် Azure အရင်းအမြစ်များကို ဖန်တီးသည့်အတွက် ကုန်ကျစရိတ် ဖြစ်ပေါ်စေပါသည်။ ကုန်ကျစရိတ် ခန့်မှန်းချက်များအတွက် အသီးသီး README ဖိုင်များကို ကြည့်ပါ။ အဆက်မပြတ် သက်တမ်းရှည် ဖြစ်နေမခံရန် ပြီးဆုံးပြီးနောက် `azd down` ကို အကောင်အထည်ဖော်ရန် မမေ့ပါနှင့်။

### နမူနာများကို တိုက်ရိုက် မူလကနေ လည်ပတ်ခြင်း

1. **ဥပမာကို Clone သို့မဟုတ် ကူးယူပါ**
   ```bash
   # လိုချင်သော ဥပမာသို့ သွားပါ
   cd examples/simple-web-app
   ```

2. **AZD ပတ်ဝန်းကျင်ကို စတင်ပါ**
   ```bash
   # ရှိပြီးသား နမူနာဖြင့် စတင်ပါ
   azd init
   
   # သို့မဟုတ် ပတ်ဝန်းကျင်အသစ်တစ်ခု ဖန်တီးပါ
   azd env new my-environment
   ```

3. **ပတ်ဝန်းကျင်ကို ဆက်တင်ပြင်ဆင်ပါ**
   ```bash
   # လိုအပ်သော ပြောင်းလဲနိုင်သော တန်ဖိုးများကို သတ်မှတ်ပါ
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **တပ်ဆင်ပါ**
   ```bash
   # အခြေခံအဆောက်အအုံနှင့် လျှာက္လွှာကို ဖြန့်ချိပါ
   azd up
   ```

5. **တပ်ဆင်မှုကို အတည်ပြုပါ**
   ```bash
   # ဝန်ဆောင်မှု endpoints များကို ရယူပါ
   azd env get-values
   
   # endpoint ကို စမ်းသပ်ပါ (ဥပမာ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **မျှော်မှန်းထားသော အောင်မြင်မှု အချက်ပြများ:**
   - ✅ `azd up` အမှားမပါဘဲ ပြီးမြောက်ခြင်း
   - ✅ service endpoint မှ HTTP 200 response ပြန်လာခြင်း
   - ✅ Azure Portal တွင် "Running" အခြေအနေ မြင်ရခြင်း
   - ✅ Application Insights သို့ telemetry လက်ခံလာနေခြင်း

> **⚠️ ပြဿနာများ ရှိပါသလား?** တပ်ဆင်မှု ပြဿနာများအတွက် [အထွေထွေ ပြဿနာများ](../docs/chapter-07-troubleshooting/common-issues.md) ကို ကြည့်ပါ

### ဥပမာများ ကို ကိုက်ညီစေရန် ပြင်ဆင်ခြင်း

ဥပမာ တစ်ခုချင်းစီတွင် ပါဝင်သောအရာများ:
- **README.md** - အသေးစိတ် တပ်ဆင်မှုနှင့် ကိုက်ညီမှု ပြင်ဆင်နည်းလမ်းညွှန်
- **azure.yaml** - မှတ်ချက်များပါရှိသည့် AZD ဖော်ပြချက်
- **infra/** - parameter ရှင်းလင်းချက်များပါရှိသည့် Bicep templates
- **src/** - နမူနာ application ကုဒ်
- **scripts/** - အရိုးရှင်းဆုံး လုပ်ငန်းများအတွက် ကူညီသော script များ

## 🎯 သင်ယူရမည့် ရည်ရွယ်ချက်များ

### ဥပမာ အမျိုးအစားများ

#### **အခြေခံ တပ်ဆင်မှုများ**
- တစ်ခုတည်း ဝန်ဆောင်မှုများ
- ရိုးရှင်းသော အင်ဖရာစထက်ချာ နမူနာများ
- အခြေခံ configuration စီမံခြင်း
- ကုန်ကျစရိတ် သက်သာသော ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်များ

#### **တိုးတက်သော အခြေအနေများ**
- အဆင်အဆာ ဝန်ဆောင်မှုများ ချိတ်ဆက်မှု
- ရှုပ်ထွေးသော ကွန်ယက် ဖော်ဆောင်မှုများ
- ဒေတာဘေ့စ် ပေါင်းစည်းခြင်း ပုံစံများ
- လုံခြုံရေးနှင့် သတ်မှတ်ချက်လိုက်နာရေး အကောင်အထည်ဖော်ခြင်း

#### **ထုတ်လုပ်မှုအဆင့် အသင့် ပုံစံများ**
- အမြင့် မရပ်တန့်နိုင်သော ဖော်မက်များ
- ကြီးကြပ်မှုနှင့် မြင်သာမှု
- CI/CD ပေါင်းစည်းမှု
- ဒုက္ခပျက် ကယ်တင်ရေး စနစ်များ

## 📖 ဥပမာ ဖော်ပြချက်များ

### Simple Web App - Node.js Express
**နည်းပညာများ**: Node.js, Express, MongoDB, Container Apps  
**ရှုပ်ထွေးမှု**: စတင်သင်ယူသူ (Beginner)  
**အယူအဆများ**: အခြေခံ တပ်ဆင်ခြင်း, REST API, NoSQL ဒေတာပေါင်းစည်းခြင်း

### Static Website - React SPA
**နည်းပညာများ**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ရှုပ်ထွေးမှု**: စတင်သင်ယူသူ  
**အယူအဆများ**: Static hosting, serverless backend, စမတ် ဝက်ဘ် ဖွံ့ဖြိုးရေး

### Container App - Python Flask
**နည်းပညာများ**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ရှုပ်ထွေးမှု**: စတင်သင်ယူသူ  
**အယူအဆများ**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**တည်နေရာ**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**နည်းပညာများ**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ရှုပ်ထွေးမှု**: တိုးတက်  
**အယူအဆများ**: Multi-service architecture, ဝန်ဆောင်မှု ဆက်သွယ်မှု, message queuing, distributed tracing  
**တည်နေရာ**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**နည်းပညာများ**: C# ASP.NET Core, Azure SQL Database, App Service  
**ရှုပ်ထွေးမှု**: အလယ်အလတ်  
**အယူအဆများ**: Entity Framework, database ချိတ်ဆက်မှုများ, web API ဖွံ့ဖြိုးရေး

### Serverless Function - Python Azure Functions
**နည်းပညာများ**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ရှုပ်ထွေးမှု**: အလယ်အလတ်  
**အယူအဆများ**: event-driven architecture, serverless computing, full-stack ဖွံ့ဖြိုးရေး

### Microservices - Java Spring Boot
**နည်းပညာများ**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ရှုပ်ထွေးမှု**: အလယ်အလတ်  
**အယူအဆများ**: microservices ဆက်သွယ်ရေး, distributed systems, အဖွဲ့အစည်းဆိုင်ရာ ပုံစံများ

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**နည်းပညာများ**: Microsoft Foundry Models, Azure AI Search, App Service  
**ရှုပ်ထွေးမှု**: အလယ်အလတ်  
**အယူအဆများ**: RAG architecture, vector search, LLM ပေါင်းစည်းမှု

#### AI Document Processing
**နည္းပညာများ**: Azure AI Document Intelligence, Storage, Functions  
**ရှုပ်ထွေးမှု**: အလယ်အလတ်  
**အယူအဆများ**: စာရွက်စာတမ်း စစ်ဆေးခြင်း, OCR, ဒေတာ ထုတ်ယူခြင်း

#### Machine Learning Pipeline
**နည္းပညာများ**: Azure ML, MLOps, Container Registry  
**ရှုပ်ထွေးမှု**: တိုးတက်  
**အယူအဆများ**: မော်ဒယ်လေ့ကျင့်ခြင်း, အတန်းချပြ ပိုင်းဆိုင်ရာ တင်ပို့မှုများ, ကြီးကြပ်မှု

## 🛠 ဖော်ပြထားသည့် ကွန်ဖစ်ဂျာရေးရှင်း ဥပမာများ

configurations/ ဖိုလ်ဒါတွင် အသုံးပြုနိုင်သော အစိတ်အပိုင်းများပါဝင်သည်:

### ပတ်ဝန်းကျင် ကွန်ဖစ်ဂျာရေးရှင်းများ
- ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် ဆက်တင်များ
- Staging ပတ်ဝန်းကျင် ကွန်ဖစ်ဂျာရေးရှင်းများ
- ထုတ်လုပ်မှုအဆင့် အသင့် ကွန်ဖစ်ဂျာရေးရှင်းများ
- Multi-region ထုတ်လုပ်မှု သတ်မှတ်ချက်များ

### Bicep Modules
- ပြန်လည်အသုံးပြုနိုင်သည့် အင်ဖရာစထက်ချာ အစိတ်အပိုင်းများ
- ပုံမှန် ရင်းမြစ် ပုံစံများ
- လုံခြုံရေးပိုင်း အာရုံစိုက်ထားသော template များ
- ကုန်ကျစရိတ် ထိရောက်စေသည့် ကွန်ဖစ်ဂျာရေးရှင်းများ

### ကူညီဆောင်ရွက်သော Scripts
- ပတ်ဝန်းကျင် စတင်အတွက် အလိုအလျောက်လုပ်ဆောင်မှုများ
- ဒေတာဘေ့စ် မိုက်ဂရေးရှင်း စကရစ်များ
- တပ်ဆင်မှု စစ်ဆေးရေး ကိရိယာများ
- ကုန်ကျစရိတ် အခြေခံ မျှော်မှန်းချက် စောင့်ကြည့်ရေး ကိရိယာများ

## 🔧 ကိုယ်ပိုင်ပြင်ဆင်မှု လမ်းညွှန်

### သင်၏ အသုံးချမှုအတွက် ဥပမာများကို ကိုက်ညီစေရန်

1. **လိုအပ်ချက်များကို ပြန်လည်သုံးသပ်ပါ**
   - Azure ဝန်ဆောင်မှုလိုအပ်ချက်များကို စစ်ဆေးပါ
   - subscription အကန့်အသတ်များကို ဗလာပြု၍ စစ်ဆေးပါ
   - ကုန်ကျစရိတ် ထိတွေ့နိုင်မှုများကို နားလည်ပါ

2. **ကွန်ဖစ်ဂျာရေးရှင်းကို ပြင်ဆင်ပါ**
   - `azure.yaml` တွင် ဝန်ဆောင်မှု သတ်မှတ်ချက်များကို update လုပ်ပါ
   - Bicep templates များကို စိတ်တိုင်းမကျ ပြင်ဆင်ပါ
   - ပတ်ဝန်းကျင် အတန်းများ (environment variables) ကို ကိုက်ညီစေပါ

3. **စမ်းသပ်မှုများကို မရေမတွက် စမ်းသပ်ပါ**
   - စတင်အားဖြင့် ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
   - လုပ်ဆောင်ချက်များကို အတည်ပြုပါ
   - စကေးလ်နှင့် ဆောင်ရွက်မှုပိုင်း စမ်းသပ်ပါ

4. **လုံခြုံရေး ပြန်လည်သုံးသပ်ပါ**
   - ခွင့်ကြီးကြပ်မှုများကို ပြန်လည်စစ်ဆေးပါ
   - secrets management ကို အကောင်အထည်ဖော်ပါ
   - ကြီးကြပ်မှုနှင့် အခေါ်အဝေါ် အသိပေးမှုများကို ဖွင့်ပါ

## 📊 နှိုင်းယှဉ် မြေပုံ (Comparison Matrix)

| ဥပမာ | ဝန်ဆောင်မှုများ | ဒေတာဘေ့စ် | အတည်ပြုခြင်း | ကြီးကြပ်မှု | ရှုပ်ထွေးမှု |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | အပြည့် | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | အခြေခံ | အပြည့် | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | တိုးတတ် | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | အခြေခံ | အခြေခံ | ⭐ |
| React SPA + Functions | 3 | ✅ | အခြေခံ | အပြည့် | ⭐ |
| Python Flask Container | 2 | ❌ | အခြေခံ | အပြည့် | ⭐ |
| C# Web API + SQL | 2 | ✅ | အပြည့် | အပြည့် | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | အပြည့် | အပြည့် | ⭐⭐ |
| Java Microservices | 5+ | ✅ | အပြည့် | အပြည့် | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | အပြည့် | အပြည့် | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | အခြေခံ | အပြည့် | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | အပြည့် | အပြည့် | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **တိုးတက်** | **⭐⭐⭐⭐** |

## 🎓 သင်ယူရေး လမ်းကြောင်း

### အကြံပြု အဆင့်မြှင့်တင်မှု

1. **Simple Web App နဲ့ စတင်ပါ**
   - AZD အခြေခံ အယူအဆများကို သင်ယူပါ
   - တပ်ဆင်မှု workflow ကို နားလည်ပါ
   - ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှုကို လေ့ကျင့်ပါ

2. **Static Website ကို စမ်းသပ်ပါ**
   - မတူညီသော hosting ရွေးချယ်မှုများကို စူးစမ်းပါ
   - CDN ပေါင်းစည်းမှုအကြောင်း သင်ယူပါ
   - DNS ဖွဲ့စည်းမှုကို နားလည်ပါ

3. **Container App သို့ ရွှေ့ပါ**
   - containerization အခြေခံကို သင်ယူပါ
   - scaling အယူအဆများကို နားလည်ပါ
   - Docker ဖြင့် လက်တွေ့ လေ့ကျင့်ပါ

4. **ဒေတာဘေ့စ် ပေါင်းစည်းခြင်း ထည့်ပါ**
   - database provisioning ကို သင်ယူပါ
   - connection strings ကို နားလည်ပါ
   - secrets management ကို လေ့ကျင့်ပါ

5. **Serverless ကို လေ့လာပါ**
   - event-driven architecture ကို နားလည်ပါ
   - triggers နှင့် bindings များအကြောင်း သိရှိပါ
   - APIs အတွက် လက်တွေ့ လေ့ကျင့်ပါ

6. **Microservices တည်ဆောက်ပါ**
   - ဝန်ဆောင်မှု ဆက်သွယ်မှုကို သင်ယူပါ
   - distributed systems ကို နားလည်ပါ
   - ရှုပ်ထွေးသော တပ်ဆင်မှုများကို လက်တွေ့ လေ့ကျင့်ပါ

## 🔍 သင့်အတွက် မှန်ကန်သည့် ဥပမာ ရွေးခြင်း

### နည်းပညာအခြေခံအလိုက်
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

### ဗျည်းပုံ (Architecture Pattern) အလိုက်
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### ရှုပ်ထွေးမှု အဆင့် အလိုက်
- **စတင်သင်ယူသူ (Beginner)**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **အလယ်အလတ် (Intermediate)**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **တိုးတက် (Advanced)**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (message queuing ပါဝင်သည့် Multi-service), **Retail Multi-Agent Solution** (ARM template ဖြင့် အပြည့်အစုံ multi-agent စနစ်)

## 📚 ထပ်ဆောင်း အရင်းအမြစ်များ

### စာတမ်းနှင့် လင့်ခ်များ
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### အသိုင်းအဝိုင်း နမူနာများ
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React ဝဘ်အက်ပ် (C# API ဖြင့်)](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Java ဖြင့် Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### အကောင်းဆုံး လေ့ကျင့်ချက်များ
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 ဥပမာများ ပံ့ပိုးရန်

မျှဝေရန် အသုံးဝင်သော ဥပမာရှိပါသလား? ပံ့ပိုးမှုများကို ကြိုဆိုပါသည်!

### တင်သွင်းရန် လမ်းညွှန်ချက်များ
1. တည်ဆောက်ထားသော ဖိုင်ဇယား ဖွဲ့စည်းပုံကို လိုက်နာပါ
2. အပြည့်အစုံ README.md ထည့်သွင်းပါ
3. ဖွဲ့စည်းမှု ဖိုင်များတွင် မှတ်ချက်များ ထည့်ပါ
4. တင်ရန်မတိုင်မီ ကောင်းစွာ စမ်းသပ်ပါ
5. ကုန်ကျစရိတ် ခန့်မှန်းချက်များနှင့် လိုအပ်ချက်များ ထည့်သွင်းပါ

### ဥပမာ နမူနာ ဖွဲ့စည်းပုံ
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

**Pro Tip**: သင့် နည်းပညာစုစည်းမှုနှင့် ကိုက်ညီသည့် အလွယ်ဆုံး ဥပမာဖြင့် စတင်ပါ၊ နောက်ပိုင်းတွင် တဖြည်းဖြည်း ပိုရှုပ်ထွေးသော အခြေအနေများသို့ အဆင့်ဆင့် တိုးမြှင့်ပါ။ ဥပမာတိုင်းသည် ယခင်ဥပမာများမှ သင်ယူထားသော အယူအဆများပေါ်တွင် တည်ဆောက်ထားပါသည်။

## 🚀 စတင်ရန် အသင့်ပြီလား?

### သင့် သင်ယူမှု လမ်းကြောင်း

1. **လုံးဝ စတင်သူလား?** → [Flask API](../../../examples/container-app/simple-flask-api) ဖြင့် စတင်ပါ (⭐, 20 mins)
2. **AZD အခြေခံ အသိပညာ ရှိပါသလား?** → [Microservices](../../../examples/container-app/microservices) ကို ကြိုးစားကြည့်ပါ (⭐⭐⭐⭐, 60 mins)
3. **AI အက်ပ်များ တည်ဆောက်နေပါသလား?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) ဖြင့် စတင်ပါ (⭐⭐, 35 mins) သို့မဟုတ် [Retail Multi-Agent](retail-scenario.md) ကို သုံးသပ်ပါ (⭐⭐⭐⭐, 2+ hours)
4. **အထူးနည်းပညာ စုစည်းမှု လိုပါသလား?** → အထက်ပါ [Finding the Right Example](#-finding-the-right-example) ဆိုင်ရာကို အသုံးပြုပါ

### နောက်ဆက်လုပ်ရမည့် အချက်များ

- ✅ အထက်ပါ [လိုအပ်ချက်များ](#အရင်လိုအပ်ချက်များ) ကို ပြန်လည်ဆန်းစစ်ပါ
- ✅ ကိုယ့် ကျွမ်းကျင်မှု အဆင့်နှင့် ကိုက်ညီသော ဥပမာကို ရွေးချယ်ပါ (ကြည့်ရန် [ရှုပ်ထွေးမှု အဆင့်](#ရှုပ်ထွေးမှု-အဆင့်-လမ်းညွှန်))
- ✅ ဥပမာ၏ README ကို တပ်ဆင်မပြုမီ အပြည့်အစုံ ဖတ်ရှုပါ
- ✅ စမ်းသပ်ပြီးနောက် `azd down` ကို ပြေးဆောင်ရန် မှတ်ချိန်းထားပါ
- ✅ ကိုယ့်အတွေ့အကြုံကို GitHub Issues သို့မဟုတ် Discussions မှတစ်ဆင့် မျှဝေပါ

### အကူအညီ လိုပါသလား?

- 📖 [မေးလေ့ရှိသော မေးခွန်းများ](../resources/faq.md) - ပုံမှန်မေးလေ့ရှိသော မေးခွန်းများကို ဖြေကြားထားသည်
- 🐛 [ပြဿနာဖြေရှင်းချက် လမ်းညွှန်](../docs/chapter-07-troubleshooting/common-issues.md) - တပ်ဆင်ရာရှိ ပြဿနာများကို ပြုပြင်ရန်
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - အသိုင်းအဝိုင်းထံ မေးမြန်းပါ
- 📚 [လေ့လာရေး လမ်းညွှန်](../resources/study-guide.md) - သင်ယူမှုကို တိုးတက်စေပါ

---

**လမ်းညွှန်ချက်**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 သင်ကြားရေး ပစ္စည်းများ**: [လေ့လာရေး လမ်းညွှန်](../resources/study-guide.md) | [အကျဉ်းချုံး မှတ်စု](../resources/cheat-sheet.md) | [အဘိဓာန်](../resources/glossary.md)
- **🔧 ရင်းမြစ်များ**: [မေးလေ့ရှိသော မေးခွန်းများ](../resources/faq.md) | [ပြဿနာဖြေရှင်းချက်များ](../docs/chapter-07-troubleshooting/common-issues.md)

---

*နောက်ဆုံး ပြင်ဆင်ထားသည့် ရက်စွဲ: November 2025 | [ပြဿနာများ တင်ပြရန်](https://github.com/microsoft/AZD-for-beginners/issues) | [ဥပမာများ ပံ့ပိုးရန်](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# উদাহরণসমূহ - ব্যবহারিক AZD টেমপ্লেট এবং কনফিগারেশন

**উদাহরণ থেকে শেখা - অধ্যায় অনুসারে সংগঠিত**
- **📚 কোর্স হোম**: [AZD নবাগতদের জন্য](../README.md)
- **📖 অধ্যায় মানচিত্র**: শেখার জটিলতা অনুযায়ী সংগঠিত উদাহরণসমূহ
- **🚀 লোকাল উদাহরণ**: [রিটেইল মাল্টি-এজেন্ট সলিউশন](retail-scenario.md)
- **🤖 এক্সটার্নাল AI উদাহরণ**: Azure Samples রিপোজিটরি লিঙ্কসমূহ

> **📍 গুরুত্বপূর্ণ: লোকাল বনাম এক্সটার্নাল উদাহরণ**  
> এই রিপোজিটরিতে পূর্ণ বাস্তবায়নসহ **4টি সম্পূর্ণ লোকাল উদাহরণ** রয়েছে:  
> - **Azure OpenAI Chat** (GPT-4 ডিপ্লয়মেন্ট সহ চ্যাট ইন্টারফেস)  
> - **Container Apps** (সাধারণ Flask API + মাইক্রোসার্ভিসেস)  
> - **Database App** (ওয়েব + SQL ডাটাবেস)  
> - **Retail Multi-Agent** (এন্টারপ্রাইজ AI সলিউশন)  
>  
> অতিরিক্ত উদাহরণগুলি আপনি ক্লোন করতে পারবেন এমন Azure-Samples রিপোজিটরির **এক্সটার্নাল রেফারেন্স**।

## পরিচিতি

এই ডিরেক্টরি আপনাকে হাতে-কলমে অনুশীলনের মাধ্যমে Azure Developer CLI শিখতে সহায়তার জন্য ব্যবহারিক উদাহরণ ও রেফারেন্স প্রদান করে। রিটেইল মাল্টি-এজেন্ট সিনারিওটি এই রিপোজিটরিতে অন্তর্ভুক্ত একটি পূর্ণাঙ্গ, প্রোডাকশন-রেডি ইমপ্লিমেন্টেশন। অতিরিক্ত উদাহরণগুলি বিভিন্ন AZD প্যাটার্ন প্রদর্শন করে এমন অফিসিয়াল Azure Samples-কে রেফারেন্স করে।

### জটিলতা রেটিং লেজেন্ড

- ⭐ **প্রারম্ভিক** - মৌলিক ধারণা, একক সার্ভিস, 15-30 মিনিট
- ⭐⭐ **মধ্যবর্তী** - একাধিক সার্ভিস, ডাটাবেস ইন্টিগ্রেশন, 30-60 মিনিট
- ⭐⭐⭐ **উন্নত** - জটিল আর্কিটেকচার, AI ইন্টিগ্রেশন, 1-2 ঘন্টা
- ⭐⭐⭐⭐ **বিশেষজ্ঞ** - প্রোডাকশন-রেডি, এন্টারপ্রাইজ প্যাটার্ন, 2+ ঘন্টা

## 🎯 এই রিপোজিটরিতে আসলে কি আছে

### ✅ লোকাল ইমপ্লিমেন্টেশন (ব্যবহারের জন্য প্রস্তুত)

#### [Azure OpenAI চ্যাট অ্যাপ্লিকেশন](azure-openai-chat/README.md) 🆕
**এই রিপোজিটরিতে চ্যাট ইন্টারফেসসহ সম্পূর্ণ GPT-4 ডিপ্লয়মেন্ট অন্তর্ভুক্ত**

- **অবস্থান:** `examples/azure-openai-chat/`
- **জটিলতা:** ⭐⭐ (মধ্যবর্তী)
- **কী অন্তর্ভুক্ত আছে:**
  - সম্পূর্ণ Azure OpenAI ডিপ্লয়মেন্ট (GPT-4)
  - Python কমান্ড-লাইন চ্যাট ইন্টারফেস
  - সিকিউর API কী-এর জন্য Key Vault ইন্টিগ্রেশন
  - Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেট
  - টোকেন ব্যবহার এবং খরচ ট্র্যাকিং
  - রেট লিমিটিং এবং ত্রুটি পরিচালনা

**দ্রুত শুরু:**
```bash
# উদাহরণে যান
cd examples/azure-openai-chat

# সবকিছু ডিপ্লয় করুন
azd up

# নির্ভরশীল প্যাকেজগুলো ইনস্টল করে চ্যাট শুরু করুন
pip install -r src/requirements.txt
python src/chat.py
```

**প্রযুক্তিগুলো:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App উদাহরণসমূহ](container-app/README.md) 🆕
**এই রিপোজিটরিতে বিস্তৃত কনটেইনার ডিপ্লয়মেন্ট উদাহরণসমূহ অন্তর্ভুক্ত**

- **অবস্থান:** `examples/container-app/`
- **জটিলতা:** ⭐-⭐⭐⭐⭐ (প্রারম্ভিক থেকে উন্নত)
- **কী অন্তর্ভুক্ত আছে:**
  - [মাস্টার গাইড](container-app/README.md) - কনটেইনার ডিপ্লয়মেন্টের সম্পূর্ণ ওভারভিউ
  - [সাধারণ Flask API](../../../examples/container-app/simple-flask-api) - ব্যাসিক REST API উদাহরণ
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../../examples/container-app/microservices) - প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট
  - দ্রুত শুরু, প্রোডাকশন, এবং উন্নত প্যাটার্নসমূহ
  - মনিটরিং, সিকিউরিটি, এবং খরচ অপ্টিমাইজেশন

**দ্রুত শুরু:**
```bash
# মাস্টার গাইড দেখুন
cd examples/container-app

# সহজ Flask API ডিপ্লয় করুন
cd simple-flask-api
azd up

# মাইক্রোসার্ভিসের উদাহরণ ডিপ্লয় করুন
cd ../microservices
azd up
```

**প্রযুক্তিগুলো:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [রিটেইল মাল্টি-এজেন্ট সলিউশন](retail-scenario.md) 🆕
**এই রিপোজিটরিতে সম্পূর্ণ প্রোডাকশন-রেডি ইমপ্লিমেন্টেশন অন্তর্ভুক্ত**

- **অবস্থান:** `examples/retail-multiagent-arm-template/`
- **জটিলতা:** ⭐⭐⭐⭐ (উন্নত)
- **কী অন্তর্ভুক্ত আছে:**
  - সম্পূর্ণ ARM ডিপ্লয়মেন্ট টেমপ্লেট
  - মাল্টি-এজেন্ট আর্কিটেকচার (কাস্টমার + ইনভেন্টরি)
  - Azure OpenAI ইন্টিগ্রেশন
  - RAG সহ AI সার্চ
  - বিস্তৃত মনিটরিং
  - এক-ক্লিক ডিপ্লয়মেন্ট স্ক্রিপ্ট

**দ্রুত শুরু:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**প্রযুক্তিগুলো:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 এক্সটার্নাল Azure স্যাম্পলস (ক্লোন করে ব্যবহার করুন)

নিচের উদাহরণগুলো অফিসিয়াল Azure-Samples রিপোজিটরিতে রক্ষণাবেক্ষণ করা হয়। বিভিন্ন AZD প্যাটার্ন অন্বেষণ করার জন্য এগুলো ক্লোন করুন:

### সহজ অ্যাপ্লিকেশনসমূহ (অধ্যায় 1-2)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | সার্ভিস |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [লোকাল: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [লোকাল: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | মাল্টি-সার্ভিস, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**কিভাবে ব্যবহার করবেন:**
```bash
# কোনো উদাহরণ ক্লোন করুন
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ডেপ্লয় করুন
azd up
```

### AI অ্যাপ্লিকেশন উদাহরণসমূহ (অধ্যায় 2, 5, 8)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | ফোকাস |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [লোকাল: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 ডিপ্লয়মেন্ট |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### ডাটাবেস ও উন্নত প্যাটার্ন (অধ্যায় 3-8)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | ফোকাস |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## শেখার লক্ষ্য

- এই উদাহরণগুলি অনুসরণ করে কাজ করে আপনি পারবেন:
- বাস্তবসম্মত অ্যাপ্লিকেশন পরিস্থিতিতে Azure Developer CLI ওয়ার্কফ্লো প্র্যাকটিস করা
- বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং সেগুলির azd ইমপ্লিমেন্টেশন বুঝতে পারা
- বিভিন্ন Azure সার্ভিসের জন্য Infrastructure as Code প্যাটার্নে দক্ষতা অর্জন করা
- কনফিগারেশন ম্যানেজমেন্ট এবং পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট কৌশল প্রয়োগ করা
- বাস্তব পরিস্থিতিতে মনিটরিং, সিকিউরিটি, এবং স্কেলিং প্যাটার্ন বাস্তবায়ন করা
- প্রকৃত ডিপ্লয়মেন্ট পরিস্থিতিতে ট্রাবলশুটিং এবং ডিবাগিং-এর অভিজ্ঞতা গড়ে তোলা

## শেখার ফলাফল

এই উদাহরণগুলো সম্পন্ন করলে আপনি সক্ষম হবেন:
- আত্মবিশ্বাসের সাথে Azure Developer CLI ব্যবহার করে বিভিন্ন ধরনের অ্যাপ্লিকেশন ডিপ্লয় করা
- প্রদত্ত টেমপ্লেটগুলো আপনার নিজস্ব অ্যাপ্লিকেশন প্রয়োজন অনুযায়ী অভিযোজিত করা
- Bicep ব্যবহার করে কাস্টম ইনফ্রাস্ট্রাকচার প্যাটার্ন ডিজাইন ও ইমপ্লিমেন্ট করা
- সঠিক ডিপেন্ডেন্সিসহ জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন কনফিগার করা
- বাস্তব পরিস্থিতিতে সিকিউরিটি, মনিটরিং, এবং পারফর্ম্যান্সের সেরা অনুশীলন প্রয়োগ করা
- ব্যবহারিক অভিজ্ঞতার ভিত্তিতে ডিপ্লয়মেন্ট ট্রাবলশুট ও অপ্টিমাইজ করা

## ডিরেক্টরি স্ট্রাকচার

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

## দ্রুত শুরু উদাহরণসমূহ

> **💡 AZD-এ নতুন?** উদাহরণ #1 (Flask API) দিয়ে শুরু করুন - এটি ~20 মিনিট সময় লাগে এবং কোর কনসেপ্টগুলো শেখায়।

### প্রারম্ভিকদের জন্য
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (লোকাল) ⭐  
   একটি সিম্পল REST API ডিপ্লয় করুন, scale-to-zero সহ  
   **সময়:** 20-25 মিনিট | **খরচ:** $0-5/মাস  
   **আপনি কি শিখবেন:** বেসিক azd ওয়ার্কফ্লো, কনটেইনারাইজেশন, হেলথ প্রোবস  
   **আশান্বিত ফলাফল:** মনিটরিংসহ একটি কার্যকর API এন্ডপয়েন্ট যা "Hello, World!" রিটার্ন করে

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB সহ একটি Node.js Express ওয়েব অ্যাপ ডিপ্লয় করুন  
   **সময়:** 25-35 মিনিট | **খরচ:** $10-30/মাস  
   **আপনি কি শিখবেন:** ডাটাবেস ইন্টিগ্রেশন, এনভায়রনমেন্ট ভ্যারিয়েবল, কানেকশন স্ট্রিংস  
   **আশান্বিত ফলাফল:** তৈরি/পড়া/আপডেট/ডিলিট কার্যকারিতা সহ Todo লিস্ট অ্যাপ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps দিয়ে একটি React স্ট্যাটিক ওয়েবসাইট হোস্ট করুন  
   **সময়:** 20-30 মিনিট | **খরচ:** $0-10/মাস  
   **আপনি কি শিখবেন:** স্ট্যাটিক হোস্টিং, সার্ভারলেস ফাংশন, CDN ডিপ্লয়মেন্ট  
   **আশান্বিত ফলাফল:** API ব্যাকএন্ডসহ React UI, স্বয়ংক্রিয় SSL, গ্লোবাল CDN

### মধ্যবর্তী ব্যবহারকারীদের জন্য
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (লোকাল) ⭐⭐  
   GPT-4 চ্যাট ইন্টারফেস এবং সিকিউর API কী ম্যানেজমেন্ট সহ ডিপ্লয় করুন  
   **সময়:** 35-45 মিনিট | **খরচ:** $50-200/মাস  
   **আপনি কি শিখবেন:** Azure OpenAI ডিপ্লয়মেন্ট, Key Vault ইন্টিগ্রেশন, টোকেন ট্র্যাকিং  
   **আশান্বিত ফলাফল:** GPT-4 এবং খরচ মনিটরিং সহ একটি কার্যকর চ্যাট অ্যাপ্লিকেশন

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (লোকাল) ⭐⭐⭐⭐  
   প্রোডাকশন-রেডি মাল্টি-সার্ভিস আর্কিটেকচার  
   **সময়:** 45-60 মিনিট | **খরচ:** $50-150/মাস  
   **আপনি কি শিখবেন:** সার্ভিস কমিউনিকেশন, মেসেজ কিউয়িং, ডিস্ট্রিবিউটেড ট্রেসিং  
   **আশান্বিত ফলাফল:** 2-সার্ভিস সিস্টেম (API Gateway + Product Service) মনিটরিং সহ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API এবং Azure SQL Database সহ ওয়েব অ্যাপ্লিকেশন  
   **সময়:** 30-45 মিনিট | **খরচ:** $20-80/মাস  
   **আপনি কি শিখবেন:** Entity Framework, ডাটাবেস মাইগ্রেশন, কানেকশন সিকিউরিটি  
   **আশান্বিত ফলাফল:** Azure SQL ব্যাকএন্ড সহ C# API, স্বয়ংক্রিয় স্কিমা ডিপ্লয়মেন্ট

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ট্রিগার এবং Cosmos DB সহ Python Azure Functions  
   **সময়:** 30-40 মিনিট | **খরচ:** $10-40/মাস  
   **আপনি কি শিখবেন:** ইভেন্ট-চালিত আর্কিটেকচার, সার্ভারলেস স্কেলিং, NoSQL ইন্টিগ্রেশন  
   **আশান্বিত ফলাফল:** HTTP রিকোয়েস্টের প্রতিক্রিয়ায় Cosmos DB স্টোরেজ ব্যবহার করে একটি ফাংশন অ্যাপ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps এবং API গেটওয়ে সহ মাল্টি-সার্ভিস Java অ্যাপ্লিকেশন  
   **সময়:** 60-90 মিনিট | **খরচ:** $80-200/মাস  
   **আপনি কি শিখবেন:** Spring Boot ডিপ্লয়মেন্ট, সার্ভিস মেশ, লোড ব্যালান্সিং  
   **আশান্বিত ফলাফল:** সার্ভিস ডিসকভারি এবং রাউটিং সহ মাল্টি-সার্ভিস Java সিস্টেম

### Microsoft Foundry টেমপ্লেট

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   GPT-4 চ্যাট ইন্টারফেসসহ সম্পূর্ণ ডিপ্লয়মেন্ট  
   **সময়:** 35-45 মিনিট | **খরচ:** $50-200/মাস  
   **আশান্বিত ফলাফল:** টোকেন ট্র্যাকিং এবং খরচ মনিটরিং সহ একটি কার্যকর চ্যাট অ্যাপ্লিকেশন

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG আর্কিটেকচারের সাথে ইন্টেলিজেন্ট চ্যাট অ্যাপ্লিকেশন  
   **সময়:** 60-90 মিনিট | **খরচ:** $100-300/মাস  
   **আশান্বিত ফলাফল:** ডকুমেন্ট সার্চ এবং উত্সসহ RAG-চালিত চ্যাট ইন্টারফেস

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI সার্ভিস ব্যবহার করে ডকুমেন্ট বিশ্লেষণ  
   **সময়:** 40-60 মিনিট | **খরচ:** $20-80/মাস  
   **আশান্বিত ফলাফল:** আপলোড করা ডকুমেন্ট থেকে টেক্সট, টেবিল, এবং এন্টিটি বের করে দেওয়ার API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning সহ MLOps ওয়ার্কফ্লো  
   **সময়:** 2-3 ঘন্টা | **খরচ:** $150-500/মাস  
   **আশান্বিত ফলাফল:** ট্রেনিং, ডিপ্লয়মেন্ট, এবং মনিটরিংসহ স্বয়ংক্রিয় ML পাইপলাইন

### বাস্তব-জগতের পরিস্থিতি

#### **রিটেইল মাল্টি-এজেন্ট সলিউশন** 🆕
**[সম্পূর্ণ ইমপ্লিমেন্টেশন গাইড](./retail-scenario.md)**

একটি বিস্তৃত, প্রোডাকশন-রেডি মাল্টি-এজেন্ট কাস্টমার সাপোর্ট সলিউশন যা AZD দিয়ে এন্টারপ্রাইজ-গ্রেড AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট প্রদর্শন করে। এই সিনারিওটি প্রদান করে:

- **সম্পূর্ণ আর্কিটেকচার**: বিশেষায়িত কাস্টমার সার্ভিস এবং ইনভেন্টরি ম্যানেজমেন্ট এজেন্টসহ মাল্টি-এজেন্ট সিস্টেম
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 ব্যবহার নির্দেশিকা

### পূর্বশর্তসমূহ

Before running any example:
- ✅ Azure subscription with Owner or Contributor access
- ✅ Azure Developer CLI installed ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop running (for container examples)
- ✅ Appropriate Azure quotas (check example-specific requirements)

> **💰 খরচ সতর্কীকরণ:** All examples create real Azure resources that incur charges. See individual README files for cost estimates. Remember to run `azd down` when done to avoid ongoing costs.

### লোকালি উদাহরণ চালানো

1. **Clone or Copy Example**
   ```bash
   # ইচ্ছিত উদাহরণে যান
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # বিদ্যমান টেমপ্লেট দিয়ে শুরু করুন
   azd init
   
   # অথবা নতুন পরিবেশ তৈরি করুন
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # প্রয়োজনীয় ভেরিয়েবল সেট করুন
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন স্থাপন করুন
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # সার্ভিস এন্ডপয়েন্টগুলো পান
   azd env get-values
   
   # এন্ডপয়েন্টটি পরীক্ষা করুন (উদাহরণ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Expected Success Indicators:**
   - ✅ `azd up` completes without errors
   - ✅ Service endpoint returns HTTP 200
   - ✅ Azure Portal shows "Running" status
   - ✅ Application Insights receiving telemetry

> **⚠️ সমস্যা হচ্ছে?** Deployment troubleshooting দেখুন [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md)

### উদাহরণগুলো অভিযোজিত করা

প্রতিটি উদাহরণ অন্তর্ভুক্ত করে:
- **README.md** - বিস্তারিত সেটআপ এবং কাস্টমাইজেশন নির্দেশিকা
- **azure.yaml** - মন্তব্যসহ AZD কনফিগারেশন
- **infra/** - প্যারামিটার ব্যাখ্যাসহ Bicep টেমপ্লেট
- **src/** - নমুনা অ্যাপ্লিকেশন কোড
- **scripts/** - সাধারণ কাজের জন্য সহায়ক স্ক্রিপ্ট

## 🎯 শেখার উদ্দেশ্য

### উদাহরণ শ্রেণীবিভাগ

#### **Basic Deployments**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **Advanced Scenarios**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **Production-Ready Patterns**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 উদাহরণ বর্ণনা

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

## 🛠 কনফিগারেশন উদাহরণ

The `configurations/` directory contains reusable components:

### Environment Configurations
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep Modules
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 কাস্টমাইজেশন গাইড

### আপনার ব্যবহারের জন্য উদাহরণ অভিযোজন করা

1. **প্রয়োজনীয়তা পর্যালোচনা করুন**
   - Check Azure service requirements
   - Verify subscription limits
   - Understand cost implications

2. **কনফিগারেশন পরিবর্তন করুন**
   - Update `azure.yaml` service definitions
   - Customize Bicep templates
   - Adjust environment variables

3. **পর্যাপ্তভাবে পরীক্ষা করুন**
   - Deploy to development environment first
   - Validate functionality
   - Test scaling and performance

4. **সিকিউরিটি রিভিউ**
   - Review access controls
   - Implement secrets management
   - Enable monitoring and alerting

## 📊 তুলনা ম্যাট্রিক্স

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

## 🎓 শেখার পথ

### সাজেস্টেড অগ্রগতি

1. **Start with Simple Web App**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **Try Static Website**
   - Explore different hosting options
   - Learn about CDN integration
   - Understand DNS configuration

3. **Move to Container App**
   - Learn containerization basics
   - Understand scaling concepts
   - Practice with Docker

4. **Add Database Integration**
   - Learn database provisioning
   - Understand connection strings
   - Practice secrets management

5. **Explore Serverless**
   - Understand event-driven architecture
   - Learn about triggers and bindings
   - Practice with APIs

6. **Build Microservices**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 সঠিক উদাহরণ খুঁজে পাওয়া

### প্রযুক্তি স্ট্যাক অনুযায়ী
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

### আর্কিটেকচার প্যাটার্ন অনুযায়ী
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### জটিলতা স্তর অনুযায়ী
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 অতিরিক্ত সম্পদ

### ডকুমেন্টেশন লিংক
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### কমিউনিটি উদাহরণ
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [টুডো অ্যাপ (Node.js এবং PostgreSQL)](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React ওয়েব অ্যাপ (C# API)](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps জব](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions (Java)](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### সেরা অনুশীলন
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 উদাহরণ জমা দিন

কোনো কার্যকর উদাহরণ ভাগ করতে চান? আমরা অবদানকে স্বাগত জানাই!

### জমা দেওয়ার নির্দেশিকা
1. স্থাপিত ডিরেক্টরি স্ট্রাকচার অনুসরণ করুন
2. বিস্তৃত README.md অন্তর্ভুক্ত করুন
3. কনফিগারেশন ফাইলগুলোতে মন্তব্য যোগ করুন
4. জমা দেওয়ার আগে সম্পূর্ণরূপে পরীক্ষা করুন
5. খরচ অনুমান এবং পূর্বশর্ত যুক্ত করুন

### উদাহরণ টেমপ্লেট কাঠামো
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

**Pro Tip**: আপনার টেকনোলজি স্ট্যাককে মেলে এমন সবচেয়ে সাধারণ উদাহরণ দিয়ে শুরু করুন, তারপর ধীরে ধীরে আরও জটিল পরিস্থিতিতে এগিয়ে যান। প্রতিটি উদাহরণ পূর্ববর্তীগুলোর ধারণার উপর ভিত্তি করে তৈরি!

## 🚀 শুরু করতে প্রস্তুত?

### আপনার শেখার পথ

1. **সম্পূর্ণ নবাগত?** → [Flask API](../../../examples/container-app/simple-flask-api) দিয়ে শুরু করুন (⭐, 20 মিনিট)
2. **AZD সম্পর্কে প্রাথমিক জ্ঞান আছে?** → [Microservices](../../../examples/container-app/microservices) চেষ্টা করুন (⭐⭐⭐⭐, 60 মিনিট)
3. **AI অ্যাপ তৈরি করছেন?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) দিয়ে শুরু করুন (⭐⭐, 35 মিনিট) অথবা [Retail Multi-Agent](retail-scenario.md) অন্বেষণ করুন (⭐⭐⭐⭐, 2+ ঘন্টা)
4. **নির্দিষ্ট টেক স্ট্যাক দরকার?** → উপরের [সঠিক উদাহরণ খোঁজা](../../../examples) সেকশনটি ব্যবহার করুন

### পরবর্তী ধাপ

- ✅ উপরে থাকা [Prerequisites](../../../examples) পর্যালোচনা করুন
- ✅ আপনার দক্ষতার স্তরের সঙ্গে মেলে এমন একটি উদাহরণ নির্বাচন করুন (দেখুন [জটিলতা লেজেন্ড](../../../examples))
- ✅ ডেপ্লয় করার আগে উদাহরণটির README মনোযোগ দিয়ে পড়ুন
- ✅ পরীক্ষার পরে `azd down` চালানোর জন্য একটি রিমাইন্ডার সেট করুন
- ✅ আপনার অভিজ্ঞতা GitHub Issues বা Discussions-এর মাধ্যমে শেয়ার করুন

### সাহায্য প্রয়োজন?

- 📖 [FAQ](../resources/faq.md) - সাধারণ প্রশ্নের উত্তর
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - ডেপ্লয়মেন্ট সমস্যা সমাধান করুন
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - কমিউনিটির কাছে প্রশ্ন করুন
- 📚 [Study Guide](../resources/study-guide.md) - আপনার শেখা দৃঢ় করুন

---

**নেভিগেশন**
- **📚 কোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 অধ্যয়ন উপকরণ**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 রিসোর্স**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*সর্বশেষ হালনাগাদ: নভেম্বর 2025 | [সমস্যা রিপোর্ট করুন](https://github.com/microsoft/AZD-for-beginners/issues) | [উদাহরণ যোগ করুন](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**দায়-অস্বীকার**:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি; তবুও অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল ভাষায় থাকা নথিটিকেই প্রামাণিক উৎস হিসেবে গণ্য করা উচিত। জরুরি বা গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ গ্রহণ করা সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট যেকোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
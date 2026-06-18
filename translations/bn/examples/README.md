# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 কোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 অধ্যায় মানচিত্র**: উদাহরণগুলি শেখার জটিলতার দ্বারা সংগঠিত
- **🚀 লোকাল উদাহরণ**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 বহির্মুখী AI উদাহরণ**: Azure Samples রিপোজিটরিগুলির লিঙ্কসমূহ

> **📍 গুরুত্বপূর্ণ: লোকাল বনাম বহির্মুখী উদাহরণ**  
> এই রিপোজিটরিতে রয়েছে **4 টি সম্পূর্ণ লোকাল উদাহরণ** পূর্ণ বাস্তবায়ন সহ:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 ডিপ্লয়মেন্ট চ্যাট ইন্টারফেসসহ)  
> - **Container Apps** (সরল Flask API + মাইক্রোসার্ভিসেস)  
> - **Database App** (ওয়েব + SQL ডাটাবেস)  
> - **Retail Multi-Agent** (এন্টারপ্রাইজ AI সলিউশন)  
>  
> অতিরিক্ত উদাহরণগুলো হল Azure-Samples রিপোজিটরির **বহির্মুখী রেফারেন্স** যেগুলো আপনি ক্লোন করতে পারেন।

## পরিচিতি

এই ডিরেক্টরি আপনাকে Azure Developer CLI হাতে-কলমে অনুশীলনের মাধ্যমে শেখার জন্য ব্যবহারিক উদাহরণ এবং রেফারেন্স প্রদান করে। Retail Multi-Agent সিনারিওটি একটি সম্পূর্ণ, প্রোডাকশন-রেডি বাস্তবায়ন যে এটি রিপোজিটরিতে অন্তর্ভুক্ত। অতিরিক্ত উদাহরণগুলো বিভিন্ন AZD প্যাটার্ন প্রদর্শন করে এমন অফিসিয়াল Azure Samples নির্দেশ করে।

### জটিলতা রেটিং লেজেন্ড

- ⭐ **শুরুতেই** - মৌলিক ধারণা, একক সার্ভিস, 15-30 মিনিট
- ⭐⭐ **মধ্যবর্তী** - একাধিক সার্ভিস, ডাটাবেস ইন্টিগ্রেশন, 30-60 মিনিট
- ⭐⭐⭐ **উন্নত** - জটিল আর্কিটেকচার, AI ইন্টিগ্রেশন, 1-2 ঘন্টা
- ⭐⭐⭐⭐ **বিশেষজ্ঞ** - প্রোডাকশন-রেডি, এন্টারপ্রাইজ প্যাটার্ন, 2+ ঘন্টা

## 🎯 এই রিপোজিটরিতে আসলে কি আছে

### ✅ লোকাল বাস্তবায়ন (ব্যবহারের জন্য প্রস্তুত)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**এই রিপোজিটরিতে সম্পূর্ণ gpt-4.1 ডিপ্লয়মেন্ট ও চ্যাট ইন্টারফেস অন্তর্ভুক্ত**

- **অবস্থান:** `examples/azure-openai-chat/`
- **জটিলতা:** ⭐⭐ (মধ্যবর্তী)
- **কি আছে:**
  - সম্পন্ন Microsoft Foundry Models ডিপ্লয়মেন্ট (gpt-4.1)
  - পাইথন কমান্ড-লাইন চ্যাট ইন্টারফেস
  - সুরক্ষিত API কী-এর জন্য Key Vault ইন্টিগ্রেশন
  - Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেট
  - টোকেন ব্যবহার ও খরচ ট্র্যাকিং
  - রেট লিমিটিং এবং এরর হ্যান্ডলিং

**দ্রুত শুরু:**
```bash
# উদাহরণে যান
cd examples/azure-openai-chat

# সবকিছু স্থাপন করুন
azd up

# নির্ভরশীলতাগুলি ইনস্টল করে চ্যাট শুরু করুন
pip install -r src/requirements.txt
python src/chat.py
```

**প্রযুক্তি:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**এই রিপোজিটরিতে বিস্তৃত কন্টেইনার ডিপ্লয়মেন্ট উদাহরণ অন্তর্ভুক্ত**

- **অবস্থান:** `examples/container-app/`
- **জটিলতা:** ⭐-⭐⭐⭐⭐ (শুরুতেই থেকে উন্নত)
- **কি আছে:**
  - [মাস্টার গাইড](container-app/README.md) - কন্টেইনার ডিপ্লয়মেন্টগুলির সম্পূর্ণ ওভারভিউ
  - [সরল Flask API](../../../examples/container-app/simple-flask-api) - মৌলিক REST API উদাহরণ
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../../examples/container-app/microservices) - প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট
  - দ্রুত শুরু, প্রোডাকশন, এবং উন্নত প্যাটার্ন
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

**প্রযুক্তি:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**এই রিপোজিটরিতে সম্পূর্ণ প্রোডাকশন-রেডি বাস্তবায়ন অন্তর্ভুক্ত**

- **অবস্থান:** `examples/retail-multiagent-arm-template/`
- **জটিলতা:** ⭐⭐⭐⭐ (উন্নত)
- **কি আছে:**
  - সম্পূর্ণ ARM ডিপ্লয়মেন্ট টেমপ্লেট
  - মাল্টি-এজেন্ট আর্কিটেকচার (কাস্টমার + ইনভেন্টরি)
  - Microsoft Foundry Models ইন্টিগ্রেশন
  - RAG সহ AI সার্চ
  - ব্যাপক মনিটরিং
  - এক-ক্লিক ডিপ্লয়মেন্ট স্ক্রিপ্ট

**দ্রুত শুরু:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**প্রযুক্তি:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 বহির্মুখী Azure Samples (ব্যবহারের জন্য ক্লোন করুন)

নিচের উদাহরণগুলো অফিসিয়াল Azure-Samples রিপোজিটরিগুলোতে রক্ষণাবেক্ষণ করা হয়। বিভিন্ন AZD প্যাটার্ন অন্বেষণ করতে এগুলো ক্লোন করুন:

### সরল অ্যাপ্লিকেশনসমূহ (অধ্যায় 1-2)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | সার্ভিসসমূহ |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | মাল্টি-সার্ভিস, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**ব্যবহার করার উপায়:**
```bash
# যেকোনো উদাহরণ ক্লোন করুন
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ডিপ্লয় করুন
azd up
```

### AI অ্যাপ্লিকেশন উদাহরণসমূহ (অধ্যায় 2, 5, 8)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | ফোকাস |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 ডিপ্লয়মেন্ট |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | মৌলিক AI চ্যাট |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | এজেন্ট ফ্রেমওয়ার্ক |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG প্যাটার্ন |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | এন্টারপ্রাইজ AI |

### ডাটাবেস ও উন্নত প্যাটার্ন (অধ্যায় 3-8)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | ফোকাস |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ডাটাবেস ইন্টিগ্রেশন |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL সার্ভারলেস |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | মাল্টি-সার্ভিস |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## শেখার লক্ষ্যসমূহ

এই উদাহরণগুলো অনুসরণ করে আপনি:
- বাস্তবসম্মত অ্যাপ্লিকেশন সিনারিও দিয়ে Azure Developer CLI ওয়ার্কফ্লো অনুশীলন করবেন
- বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং তাদের azd বাস্তবায়ন বুঝতে পারবেন
- বিভিন্ন Azure সার্ভিসের জন্য ইনফ্রাস্ট্রাকচার এজ কোড প্যাটার্নে দক্ষতা অর্জন করবেন
- কনফিগারেশন ম্যানেজমেন্ট এবং পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট কৌশল প্রয়োগ করবেন
- বাস্তব পরিপ্রেক্ষিতে মনিটরিং, সিকিউরিটি, এবং স্কেলিং প্যাটার্ন বাস্তবায়ন করবেন
- বাস্তব ডিপ্লয়মেন্ট সমস্যাগুলি ট্রাবলশুটিং এবং ডিবাগ করার অভিজ্ঞতা অর্জন করবেন

## শেখার ফলাফলসমূহ

এই উদাহরণসমূহ সম্পন্ন করার পর আপনি সক্ষম হবেন:
- Azure Developer CLI ব্যবহার করে বিভিন্ন ধরনের অ্যাপ্লিকেশন আত্মবিশ্বাসের সাথে ডিপ্লয় করতে
- প্রদত্ত টেমপ্লেটগুলোকে আপনার নিজস্ব অ্যাপ্লিকেশন প্রয়োজন অনুযায়ী অভিযোজিত করতে
- Bicep ব্যবহার করে কাস্টম ইনফ্রাস্ট্রাকচার প্যাটার্ন ডিজাইন ও বাস্তবায়ন করতে
- সঠিক ডিপেন্ডেন্সি সহ জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন কনফিগার করতে
- বাস্তব পরিস্থিতিতে সিকিউরিটি, মনিটরিং, এবং পারফরম্যান্স সেরা অনুশীলনগুলি প্রয়োগ করতে
- বাস্তব অভিজ্ঞতার ভিত্তিতে ডিপ্লয়মেন্ট ট্রাবলশুট এবং অপ্টিমাইজ করাতে

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

> **💡 AZD-এ নতুন?** উদাহরণ #1 (Flask API) দিয়ে শুরু করুন - এটি প্রায় ~20 মিনিট সময় লাগে এবং মূল ধারণা শেখায়।

### শুরু করার জন্য
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (লোকাল) ⭐  
   একটি সরল REST API ডিপ্লয় করুন scale-to-zero সহ  
   **সময়:** 20-25 মিনিট | **খরচ:** $0-5/মাস  
   **আপনি যা শিখবেন:** মৌলিক azd ওয়ার্কফ্লো, কন্টেইনারাইজেশন, হেলথ প্রোবস  
   **প্রত্যাশিত ফলাফল:** মনিটরিং সহ "Hello, World!" রিটার্ন করা একটি কার্যকর API এন্ডপয়েন্ট

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB সহ একটি Node.js Express ওয়েব অ্যাপ ডিপ্লয় করুন  
   **সময়:** 25-35 মিনিট | **খরচ:** $10-30/মাস  
   **আপনি যা শিখবেন:** ডাটাবেস ইন্টিগ্রেশন, পরিবেশ ভেরিয়েবল, কানেকশন স্ট্রিং  
   **প্রত্যাশিত ফলাফল:** ক্রিয়েট/রিড/আপডেট/ডিলেট ফিচারসহ একটি Todo তালিকা অ্যাপ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps দিয়ে একটি React স্ট্যাটিক ওয়েবসাইট হোস্ট করুন  
   **সময়:** 20-30 মিনিট | **খরচ:** $0-10/মাস  
   **আপনি যা শিখবেন:** স্ট্যাটিক হোস্টিং, সার্ভারলেস ফাংশন, CDN ডিপ্লয়মেন্ট  
   **প্রত্যাশিত ফলাফল:** API ব্যাকএন্ডসহ React UI, স্বয়ংক্রিয় SSL, গ্লোবাল CDN

### মধ্যম ধাপের ব্যবহারকারীদের জন্য
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (লোকাল) ⭐⭐  
   চ্যাট ইন্টারফেস ও সুরক্ষিত API কী ব্যবস্থাপনা সহ gpt-4.1 ডিপ্লয় করুন  
   **সময়:** 35-45 মিনিট | **খরচ:** $50-200/মাস  
   **আপনি যা শিখবেন:** Microsoft Foundry Models ডিপ্লয়মেন্ট, Key Vault ইন্টিগ্রেশন, টোকেন ট্র্যাকিং  
   **প্রত্যাশিত ফলাফল:** gpt-4.1 এবং খরচ মনিটরিং সহ কার্যকর চ্যাট অ্যাপ

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (লোকাল) ⭐⭐⭐⭐  
   প্রোডাকশন-রেডি মাল্টি-সার্ভিস আর্কিটেকচার  
   **সময়:** 45-60 মিনিট | **খরচ:** $50-150/মাস  
   **আপনি যা শিখবেন:** সার্ভিস কমিউনিকেশন, মেসেজ কিউইং, ডিস্ট্রিবিউটেড ট্রেসিং  
   **প্রত্যাশিত ফলাফল:** 2-সার্ভিস সিস্টেম (API Gateway + Product Service) মনিটরিং সহ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API এবং Azure SQL Database সহ ওয়েব অ্যাপ্লিকেশন  
   **সময়:** 30-45 মিনিট | **খরচ:** $20-80/মাস  
   **আপনি যা শিখবেন:** Entity Framework, ডাটাবেস মাইগ্রেশন, কানেকশন সিকিউরিটি  
   **প্রত্যাশিত ফলাফল:** Azure SQL ব্যাকএন্ডসহ C# API, স্বয়ংক্রিয় স্কিমা ডিপ্লয়মেন্ট

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ট্রিগার এবং Cosmos DB সহ Python Azure Functions  
   **সময়:** 30-40 মিনিট | **খরচ:** $10-40/মাস  
   **আপনি যা শিখবেন:** ইভেন্ট-ড্রিভেন আর্কিটেকচার, সার্ভারলেস স্কেলিং, NoSQL ইন্টিগ্রেশন  
   **প্রত্যাশিত ফলাফল:** Cosmos DB স্টোরেজ সহ HTTP রিকোয়েস্টে প্রতিক্রিয়া জানানো একটি ফাংশন অ্যাপ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps এবং API গেটওয়ের সাথে মাল্টি-সার্ভিস Java অ্যাপ্লিকেশন  
   **সময়:** 60-90 মিনিট | **খরচ:** $80-200/মাস  
   **আপনি যা শিখবেন:** Spring Boot ডিপ্লয়মেন্ট, সার্ভিস মেশ, লোড ব্যালান্সিং  
   **প্রত্যাশিত ফলাফল:** সার্ভিস ডিসকভারি এবং রাউটিংসহ মাল্টি-সার্ভিস Java সিস্টেম

### Microsoft Foundry টেমপ্লেটসমূহ

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   চ্যাট ইন্টারফেস সহ সম্পূর্ণ gpt-4.1 ডিপ্লয়মেন্ট  
   **সময়:** 35-45 মিনিট | **খরচ:** $50-200/মাস  
   **প্রত্যাশিত ফলাফল:** টোকেন ট্র্যাকিং এবং খরচ মনিটরিংসহ কার্যকর চ্যাট অ্যাপ

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG আর্কিটেকচারের সাথে বুদ্ধিমান চ্যাট অ্যাপ্লিকেশন  
   **সময়:** 60-90 মিনিট | **খরচ:** $100-300/মাস  
   **প্রত্যাশিত ফলাফল:** ডকুমেন্ট সার্চ এবং উদ্ধৃতিসহ RAG-চালিত চ্যাট ইন্টারফেস

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI সার্ভিস ব্যবহার করে ডকুমেন্ট বিশ্লেষণ  
   **সময়:** 40-60 মিনিট | **খরচ:** $20-80/মাস  
   **প্রত্যাশিত ফলাফল:** আপলোডকৃত ডকুমেন্ট থেকে টেক্সট, টেবিল, এবং এন্টিটি এক্সট্র্যাকশন করার API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning সহ MLOps ওয়ার্কফ্লো  
   **সময়:** 2-3 ঘন্টা | **খরচ:** $150-500/মাস  
   **প্রত্যাশিত ফলাফল:** ট্রেনিং, ডিপ্লয়মেন্ট এবং মনিটরিং সহ স্বয়ংক্রিয় ML পাইপলাইন

### বাস্তব-জগতের সিনারিওসমূহ

#### **Retail Multi-Agent Solution** 🆕
**[সম্পূর্ণ বাস্তবায়ন নির্দেশিকা](./retail-scenario.md)**

একটি বিস্তৃত, প্রোডাকশন-রেডি মাল্টি-এজেন্ট কাস্টমার সাপোর্ট সলিউশন যা AZD দিয়ে এন্টারপ্রাইজ-গ্রেড AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট প্রদর্শন করে। এই সিনারিওটি প্রদান করে:

- **সম্পূর্ণ আর্কিটেকচার**: বিশেষায়িত কাস্টমার সার্ভিস এবং ইনভেন্টরি ম্যানেজমেন্ট এজেন্টসহ মাল্টি-এজেন্ট সিস্টেম
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 ব্যবহার নির্দেশিকা

### পূর্বশর্তসমূহ

কোনো উদাহরণ চালানোর আগে:
- ✅ Azure সাবস্ক্রিপশন যা Owner বা Contributor অ্যাক্সেস সহ
- ✅ Azure Developer CLI ইনস্টল করা আছে ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop চালু আছে (কন্টেইনার উদাহরণের জন্য)
- ✅ উপযুক্ত Azure কোটা আছে (উদাহরণ-নির্দিষ্ট চাহিদা পরীক্ষা করুন)

> **💰 খরচ সতর্কতা:** সব উদাহরণ বাস্তব Azure রিসোর্স সৃষ্টি করে যেগুলি চার্জ প্রযোজ্য। খরচের আনুমানিক বিবরণ জন্য পৃথক README ফাইলগুলো দেখুন। চলমান খরচ এড়াতে কাজ শেষে `azd down` চালানো স্মরণ করুন।

### লোকালভাবে উদাহরণ চালানো

1. **উদাহরণ ক্লোন বা কপি করুন**
   ```bash
   # ইচ্ছিত উদাহরণে যান
   cd examples/simple-web-app
   ```

2. **AZD পরিবেশ আরম্ভ করুন**
   ```bash
   # বিদ্যমান টেমপ্লেট দিয়ে আরম্ভ করুন
   azd init
   
   # অথবা নতুন পরিবেশ তৈরি করুন
   azd env new my-environment
   ```

3. **পরিবেশ কনফিগার করুন**
   ```bash
   # প্রয়োজনীয় ভেরিয়েবলগুলো সেট করুন
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ডিপ্লয় করুন**
   ```bash
   # ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন স্থাপন করুন
   azd up
   ```

5. **ডিপ্লয়মেন্ট যাচাই করুন**
   ```bash
   # সার্ভিস এন্ডপয়েন্টগুলো পান
   azd env get-values
   
   # এন্ডপয়েন্ট পরীক্ষা করুন (উদাহরণ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **প্রত্যাশিত সফল সূচকসমূহ:**
   - ✅ `azd up` ত্রুটি ছাড়াই সম্পন্ন হয়
   - ✅ সার্ভিস এন্ডপয়েন্ট HTTP 200 রিটার্ন করে
   - ✅ Azure Portal-এ "Running" স্ট্যাটাস দেখায়
   - ✅ Application Insights টেলিমেট্রি গ্রহণ করছে

> **⚠️ সমস্যা কি?** ডিপ্লয়মেন্ট ট্রাবলশুটিং-এর জন্য দেখুন [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md)

### উদাহরণ অভিযোজন

প্রতি উদাহরণে অন্তর্ভুক্ত থাকে:
- **README.md** - বিস্তারিত সেটআপ ও কাস্টমাইজেশন নির্দেশনা
- **azure.yaml** - মন্তব্যসহ AZD কনফিগারেশন
- **infra/** - প্যারামিটার ব্যাখ্যার সঙ্গে Bicep টেম্পলেট
- **src/** - নমুনা অ্যাপ্লিকেশন কোড
- **scripts/** - সাধারণ কাজের জন্য সহায়ক স্ক্রিপ্ট

## 🎯 শেখার উদ্দেশ্য

### উদাহরণ ক্যাটাগরি

#### **মৌলিক ডিপ্লয়মেন্ট**
- একক সার্ভিস অ্যাপ্লিকেশন
- সরল ইনফ্রাসট্রাকচার প্যাটার্ন
- মৌলিক কনফিগারেশন ম্যানেজমেন্ট
- খরচ-সাশ্রয়ী ডেভেলপমেন্ট সেটআপ

#### **উন্নত পরিস্থিতি**
- মাল্টি-সার্ভিস আর্কিটেকচার
- জটিল নেটওয়ার্কিং কনফিগারেশন
- ডাটাবেস ইন্টিগ্রেশন প্যাটার্ন
- সিকিউরিটি ও কমপ্লায়েন্স ইমপ্লিমেন্টেশন

#### **প্রোডাকশন-রেডি প্যাটার্ন**
- হাই অ্যাভেইলেবিলিটি কনফিগারেশন
- মনিটরিং ও অবজারভেবিলিটি
- CI/CD ইন্টিগ্রেশন
- ডিজাস্টার রিকভারী সেটআপ

## 📖 উদাহরণ বিবরণ

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Beginner  
**Concepts**: মৌলিক ডিপ্লয়মেন্ট, REST API, NoSQL ডাটাবেস ইন্টিগ্রেশন

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Beginner  
**Concepts**: স্ট্যাটিক হোস্টিং, সার্ভারলেস ব্যাকএন্ড, আধুনিক ওয়েব ডেভেলপমেন্ট

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Beginner  
**Concepts**: কন্টেইনারাইজেশন, REST API, scale-to-zero, হেলথ probes, মনিটরিং  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Advanced  
**Concepts**: মাল্টি-সার্ভিস আর্কিটেকচার, সার্ভিস কমিউনিকেশন, মেসেজ কিউইং, ডিস্ট্রিবিউটেড ট্রেসিং  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Intermediate  
**Concepts**: Entity Framework, ডাটাবেস কানেকশন, ওয়েব API ডেভেলপমেন্ট

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Intermediate  
**Concepts**: ইভেন্ট-ড্রিভেন আর্কিটেকচার, সার্ভারলেস কম্পিউটিং, ফুল-স্ট্যাক ডেভেলপমেন্ট

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Intermediate  
**Concepts**: মাইক্রোসার্ভিসেস কমিউনিকেশন, ডিস্ট্রিবিউটেড সিস্টেম, এন্টারপ্রাইজ প্যাটার্ন

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: Intermediate  
**Concepts**: RAG আর্কিটেকচার, ভেক্টর সার্চ, LLM ইন্টিগ্রেশন

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Intermediate  
**Concepts**: ডকুমেন্ট বিশ্লেষণ, OCR, ডাটা এক্সট্রাকশন

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Advanced  
**Concepts**: মডেল ট্রেনিং, ডিপ্লয়মেন্ট পাইপলাইন, মনিটরিং

## 🛠 কনফিগারেশন উদাহরণ

`configurations/` ডিরেক্টরিটি পুনঃব্যবহারযোগ্য কম্পোনেন্টসমূহ ধারণ করে:

### পরিবেশ কনফিগারেশন
- ডেভেলপমেন্ট পরিবেশ সেটিংস
- স্টেজিং পরিবেশ কনফিগারেশন
- প্রোডাকশন-রেডি কনফিগারেশন
- মাল্টি-রিজিওন ডিপ্লয়মেন্ট সেটআপ

### Bicep মডিউলসমূহ
- পুনঃব্যবহারযোগ্য ইনফ্রাসট্রাকচার কম্পোনেন্ট
- সাধারণ রিসোর্স প্যাটার্ন
- সিকিউরিটি-হার্ডেনড টেমপ্লেট
- খরচ-অপ্টিমাইজড কনফিগারেশন

### সহায়ক স্ক্রিপ্ট
- পরিবেশ সেটআপ অটোমেশন
- ডাটাবেস মাইগ্রেশন স্ক্রিপ্ট
- ডিপ্লয়মেন্ট ভ্যালিডেশন টুলস
- খরচ মনিটরিং উপযোগিতা

## 🔧 কাস্টমাইজেশন গাইড

### আপনার ব্যবহারের জন্য উদাহরণ অভিযোজিত করা

1. **পূর্বশর্তসমূহ পর্যালোচনা করুন**
   - Azure সার্ভিসের প্রয়োজনীয়তা পরীক্ষা করুন
   - সাবস্ক্রিপশনের সীমা যাচাই করুন
   - খরচের প্রভাব বুঝুন

2. **কনফিগারেশন পরিবর্তন করুন**
   - `azure.yaml` সার্ভিস ডেফিনিশন আপডেট করুন
   - Bicep টেম্পলেট কাস্টমাইজ করুন
   - পরিবেশ ভ্যারিয়েবল সমন্বয় করুন

3. **পরীক্ষা সম্পূর্ণভাবে করুন**
   - প্রথমে ডেভেলপমেন্ট পরিবেশে ডিপ্লয় করুন
   - কার্যকারিতা যাচাই করুন
   - স্কেলিং ও পারফরম্যান্স পরীক্ষা করুন

4. **সিকিউরিটি রিভিউ**
   - অ্যাক্সেস কন্ট্রোল পর্যালোচনা করুন
   - সিক্রেটস ম্যানেজমেন্ট বাস্তবায়ন করুন
   - মনিটরিং ও এলার্টিং সক্ষম করুন

## 📊 তুলনা ম্যাট্রিক্স

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

## 🎓 শেখার পথ

### সুপারিশকৃত অগ্রগতি

1. **সরল ওয়েব অ্যাপ দিয়ে শুরু করুন**
   - মৌলিক AZD ধারণা শেখা
   - ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝুন
   - পরিবেশ ম্যানেজমেন্ট অনুশীলন করুন

2. **স্ট্যাটিক ওয়েবসাইট চেষ্টা করুন**
   - বিভিন্ন হোস্টিং অপশন পরীক্ষা করুন
   - CDN ইন্টিগ্রেশন সম্পর্কে জানুন
   - DNS কনফিগারেশন বুঝুন

3. **কন্টেইনার অ্যাপে যান**
   - কন্টেইনারাইজেশনের মৌলিক বিষয়গুলো শেখুন
   - স্কেলিং ধারণা বুঝুন
   - Docker নিয়ে অনুশীলন করুন

4. **ডাটাবেস ইন্টিগ্রেশন যোগ করুন**
   - ডাটাবেস প্রোভিশনিং শেখুন
   - কানেকশন স্ট্রিং বোঝুন
   - সিক্রেটস ম্যানেজমেন্ট অনুশীলন করুন

5. **সার্ভারলেস অন্বেষণ করুন**
   - ইভেন্ট-ড্রিভেন আর্কিটেকচার বুঝুন
   - ট্রিগার ও বাইন্ডিং সম্পর্কে জানুন
   - APIগুলো নিয়ে অনুশীলন করুন

6. **মাইক্রোসার্ভিসেস তৈরি করুন**
   - সার্ভিস কমিউনিকেশন শেখুন
   - ডিস্ট্রিবিউটেড সিস্টেম বুঝুন
   - জটিল ডিপ্লয়মেন্ট অনুশীলন করুন

## 🔍 সঠিক উদাহরণ খুঁজে পাওয়া

### প্রযুক্তি স্ট্যাক অনুযায়ী
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

### আর্কিটেকচার প্যাটার্ন অনুযায়ী
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### জটিলতার স্তর অনুযায়ী
- **Beginner**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Local)](../../../examples/container-app/microservices) (মেসেজ কুইং সহ মাল্টি-সার্ভিস), **Retail Multi-Agent Solution** (ARM টেম্পলেট ডিপ্লয়মেন্ট সহ সম্পূর্ণ মাল্টি-এজেন্ট সিস্টেম)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API সহ React ওয়েব অ্যাপ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps জব](https://github.com/Azure-Samples/container-apps-jobs)
- [Java সহ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### সেরা অনুশীলন
- [Azure ওয়েল-আর্কিটেক্টেড ফ্রেমওয়ার্ক](https://learn.microsoft.com/en-us/azure/well-architected/)
- [ক্লাউড অ্যাডপশন ফ্রেমওয়ার্ক](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 উদাহরণ জমা দিন

কোনো উপকারী উদাহরণ শেয়ার করতে চান? আমরা অবদানকে স্বাগত জানাই!

### জমা দেওয়ার নির্দেশিকা
1. প্রতিষ্ঠিত ডিরেক্টরি কাঠামো অনুসরণ করুন
2. সম্পূর্ণ README.md যোগ করুন
3. কনফিগারেশন ফাইলগুলিতে মন্তব্য যোগ করুন
4. জমা করার আগে সম্পূর্ণরূপে পরীক্ষা করুন
5. খরচের অনুমান এবং প্রয়োজনীয়তাগুলি অন্তর্ভুক্ত করুন

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

**প্রো টিপ**: আপনার প্রযুক্তি স্ট্যাকের সাথে মিলবে এমন সবচেয়ে সহজ উদাহরণ দিয়ে শুরু করুন, তারপর ধীরে ধীরে আরও জটিল পরিস্থিতিতে যান। প্রতিটি উদাহরণ পূর্ববর্তীগুলোর ধারণার ওপর ভিত্তি করে গড়ে ওঠে!

## 🚀 শুরু করতে প্রস্তুত?

### আপনার শেখার পথ

1. **সম্পূর্ণ নবীন?** → শুরু করুন [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 মিনিট)
2. **AZD-এর উপর মৌলিক জ্ঞান আছে?** → চেষ্টা করুন [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 মিনিট)
3. **AI অ্যাপ তৈরি করছেন?** → শুরু করুন [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 মিনিট) অথবা এক্সপ্লোর করুন [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ঘন্টা)
4. **নির্দিষ্ট টেক স্ট্যাক দরকার?** → উপরের [Finding the Right Example](#-finding-the-right-example) বিভাগটি ব্যবহার করুন

### পরবর্তী ধাপ

- ✅ উপরে থাকা [প্রয়োজনীয়তা](#পূর্বশর্তসমূহ) পর্যালোচনা করুন
- ✅ আপনার দক্ষতার স্তরের সাথে মিলবে এমন একটি উদাহরণ নির্বাচন করুন (দেখুন [জটিলতা লেজেন্ড](#জটিলতা-রেটিং-লেজেন্ড))
- ✅ মোতায়েনের আগে উদাহরণটির README ভালোভাবে পড়ুন
- ✅ পরীক্ষা করার পরে `azd down` চালানোর জন্য রিমাইন্ডার সেট করুন
- ✅ GitHub Issues বা Discussions-এর মাধ্যমে আপনার অভিজ্ঞতা শেয়ার করুন

### সাহায্য প্রয়োজন?

- 📖 [প্রশ্নোত্তর (FAQ)](../resources/faq.md) - সাধারণ প্রশ্নের উত্তর
- 🐛 [সমস্যা সমাধান নির্দেশিকা](../docs/chapter-07-troubleshooting/common-issues.md) - মোতায়েনের সমস্যা সমাধান করুন
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - কমিউনিটির কাছে প্রশ্ন করুন
- 📚 [অধ্যয়ন গাইড](../resources/study-guide.md) - আপনার শেখাকে মজবুত করুন

---

**নেভিগেশন**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../README.md)
- **📖 পাঠ্য সামগ্রী**: [অধ্যয়ন গাইড](../resources/study-guide.md) | [চিট শিট](../resources/cheat-sheet.md) | [পরিভাষা](../resources/glossary.md)
- **🔧 রিসোর্স**: [প্রশ্নোত্তর (FAQ)](../resources/faq.md) | [সমস্যা সমাধান](../docs/chapter-07-troubleshooting/common-issues.md)

---

*সর্বশেষ আপডেট: নভেম্বর ২০২৫ | [সমস্যা রিপোর্ট করুন](https://github.com/microsoft/AZD-for-beginners/issues) | [উদাহরণ জমা দিন](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
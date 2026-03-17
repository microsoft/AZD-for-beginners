# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: উদাহরণগুলি শেখার জটিলতার দ্বারা সংগঠিত
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Azure Samples রিপোজিটরি-তে লিংকসমূহ

> **📍 IMPORTANT: Local vs External Examples**  
> এই রিপোজিটরিতে রয়েছে **4টি সম্পূর্ণ লোকাল উদাহরণ** পূর্ণ বাস্তবায়ন সহ:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment সহ চ্যাট ইন্টারফেস)  
> - **Container Apps** (Simple Flask API + মাইক্রোসার্ভিস)  
> - **Database App** (ওয়েব + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI সলিউশন)  
>  
> অতিরিক্ত উদাহরণগুলি হলো **বাহ্যিক রেফারেন্স** Azure-Samples রিপোজিটরিগুলোর যেগুলো আপনি ক্লোন করতে পারেন।

## Introduction

এই ডিরেক্টরিটি প্রয়োগগত উদাহরণ এবং রেফারেন্স সরবরাহ করে যাতে আপনি হাতেকলমে অনুশীলনের মাধ্যমে Azure Developer CLI শিখতে পারেন। Retail Multi-Agent সিনারিওটি একটি সম্পূর্ণ, প্রোডাকশন-রেডি বাস্তবায়ন যা এই রিপোজিটরিতে অন্তর্ভুক্ত। অতিরিক্ত উদাহরণগুলি অফিসিয়াল Azure Samples নির্দেশ করে যা বিভিন্ন AZD প্যাটার্নগুলো প্রদর্শন করে।

### Complexity Rating Legend

- ⭐ **Beginner** - মৌলিক ধারণা, একক সার্ভিস, 15-30 মিনিট
- ⭐⭐ **Intermediate** - একাধিক সার্ভিস, ডাটাবেস ইন্টিগ্রেশন, 30-60 মিনিট
- ⭐⭐⭐ **Advanced** - জটিল আর্কিটেকচার, AI ইন্টিগ্রেশন, 1-2 ঘণ্টা
- ⭐⭐⭐⭐ **Expert** - প্রোডাকশন-রেডি, এন্টারপ্রাইজ প্যাটার্ন, 2+ ঘণ্টা

## 🎯 What's Actually in This Repository

### ✅ Local Implementation (Ready to Use)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**এই রিপোজিটরিতে সম্পূর্ণ gpt-4.1 deployment সহ চ্যাট ইন্টারফেস অন্তর্ভুক্ত**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **What's Included:**
  - সম্পূর্ণ Microsoft Foundry Models deployment (gpt-4.1)
  - Python কমান্ড-লাইন চ্যাট ইন্টারফেস
  - Key Vault ইন্টিগ্রেশন নিরাপদ API কী এর জন্য
  - Bicep ইনফ্রাস্ট্রাকচার টেমপ্লেট
  - Token ব্যবহার এবং খরচ ট্র্যাকিং
  - রেট লিমিটিং এবং এরর হ্যান্ডলিং

**Quick Start:**
```bash
# উদাহরণে যান
cd examples/azure-openai-chat

# সবকিছু ডিপ্লয় করুন
azd up

# নির্ভরশীলতাগুলো ইনস্টল করুন এবং চ্যাট শুরু করুন
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**এই রিপোজিটরিতে সমগ্র কনটেইনার ডিপ্লয়মেন্ট উদাহরণ অন্তর্ভুক্ত**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Beginner to Advanced)
- **What's Included:**
  - [Master Guide](container-app/README.md) - কনটেইনার ডিপ্লয়মেন্টের সম্পূর্ণ ওভারভিউ
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - মৌলিক REST API উদাহরণ
  - [Microservices Architecture](../../../examples/container-app/microservices) - প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট
  - Quick Start, Production, এবং Advanced প্যাটার্ন
  - মনিটরিং, সিকিউরিটি, এবং খরচ অপ্টিমাইজেশন

**Quick Start:**
```bash
# মাস্টার গাইড দেখুন
cd examples/container-app

# একটি সাধারণ Flask API স্থাপন করুন
cd simple-flask-api
azd up

# মাইক্রোসার্ভিসের উদাহরণ স্থাপন করুন
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**এই রিপোজিটরিতে সম্পূর্ণ প্রোডাকশন-রেডি বাস্তবায়ন অন্তর্ভুক্ত**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Advanced)
- **What's Included:**
  - সম্পূর্ণ ARM ডিপ্লয়মেন্ট টেমপ্লেট
  - মাল্টি-এজেন্ট আর্কিটেকচার (Customer + Inventory)
  - Microsoft Foundry Models ইন্টিগ্রেশন
  - AI Search সহ RAG
  - বিস্তৃত মনিটরিং
  - এক-ক্লিক ডিপ্লয়মেন্ট স্ক্রিপ্ট

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

নিচের উদাহরণগুলো অফিসিয়াল Azure-Samples রিপোজিটরিতে রক্ষণাবেক্ষণ করা হয়। বিভিন্ন AZD প্যাটার্ন অন্বেষণ করতে এগুলো ক্লোন করুন:

### Simple Applications (Chapters 1-2)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | সার্ভিসেস |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [স্থানীয়: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [স্থানীয়: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# যেকোনো উদাহরণ ক্লোন করুন
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# প্রয়োগ করুন
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | ফোকাস |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [স্থানীয়: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | মৌলিক AI চ্যাট |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | এজেন্ট ফ্রেমওয়ার্ক |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG প্যাটার্ন |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | এন্টারপ্রাইজ AI |

### Database & Advanced Patterns (Chapters 3-8)

| টেমপ্লেট | রিপোজিটরি | জটিলতা | ফোকাস |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ডাটাবেস ইন্টিগ্রেশন |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | মাল্টি-সার্ভিস |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

এই উদাহরণগুলোর মাধ্যমে কাজ করে আপনি:
- বাস্তবগত অ্যাপ্লিকেশন সিনারিও দিয়ে Azure Developer CLI ওয়ার্কফ্লো অনুশীলন করবেন
- বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং তাদের azd বাস্তবায়ন বুঝবেন
- বিভিন্ন Azure সার্ভিসের জন্য Infrastructure as Code প্যাটার্নে দক্ষতা অর্জন করবেন
- কনফিগারেশন ম্যানেজমেন্ট এবং পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট কৌশল প্রয়োগ করবেন
- বাস্তব প্রেক্ষাপটে মনিটরিং, সিকিউরিটি, এবং স্কেলিং প্যাটার্ন বাস্তবায়ন করবেন
- বাস্তব ডিপ্লয়মেন্ট সিনারিওতে ট্রাবলশুটিং এবং ডিবাগিং-এ অভিজ্ঞতা অর্জন করবেন

## Learning Outcomes

এই উদাহরণগুলি সম্পন্ন করার পরে আপনি সক্ষম হবেন:
- Azure Developer CLI ব্যবহার করে বিভিন্ন ধরনের অ্যাপ্লিকেশন আত্মবিশ্বাসের সঙ্গে ডিপ্লয় করতে
- প্রদত্ত টেমপ্লেটগুলো আপনার নিজস্ব অ্যাপ্লিকেশন চাহিদা অনুযায়ী মানানসই করতে
- Bicep ব্যবহার করে কাস্টম ইনফ্রাস্ট্রাকচার প্যাটার্ন ডিজাইন এবং বাস্তবায়ন করতে
- সঠিক ডিপেন্ডেন্সি সহ জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন কনফিগার করতে
- বাস্তব পরিস্থিতিতে সিকিউরিটি, মনিটরিং, এবং পারফরম্যান্স সেরা অনুশীলন প্রয়োগ করতে
- বাস্তব অভিজ্ঞতার ভিত্তিতে ডিপ্লয়মেন্ট ট্রাবলশুট এবং অপ্টিমাইজ করতে

## Directory Structure

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

## Quick Start Examples

> **💡 New to AZD?** উদাহরণ #1 (Flask API) দিয়ে শুরু করুন - এটি ~20 মিনিট সময় লাগে এবং মূল ধারণা শেখায়।

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (স্থানীয়) ⭐  
   একটি সহজ REST API ডিপ্লয় করুন scale-to-zero সহ  
   **সময়:** 20-25 মিনিট | **খরচ:** $0-5/মাস  
   **আপনি কি শিখবেন:** মৌলিক azd ওয়ার্কফ্লো, কনটেইনারাইজেশন, হেলথ প্রোবস  
   **প্রত্যাশিত ফলাফল:** মনিটরিং সহ "Hello, World!" ফেরত দেয় এমন কাজ করা API এন্ডপয়েন্ট

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB সহ একটি Node.js Express ওয়েব অ্যাপ ডিপ্লয় করুন  
   **সময়:** 25-35 মিনিট | **খরচ:** $10-30/মাস  
   **আপনি কি শিখবেন:** ডাটাবেস ইন্টিগ্রেশন, এনভায়রনমেন্ট ভ্যারিয়েবল, কানেকশন স্ট্রিং  
   **প্রত্যাশিত ফলাফল:** তৈরি/পড়া/আপডেট/মুছা কার্যকারিতা সহ Todo লিস্ট অ্যাপ

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps দিয়ে একটি React স্ট্যাটিক ওয়েবসাইট হোস্ট করুন  
   **সময়:** 20-30 মিনিট | **খরচ:** $0-10/মাস  
   **আপনি কি শিখবেন:** স্ট্যাটিক হোস্টিং, সার্ভারলেস ফাংশন, CDN ডিপ্লয়মেন্ট  
   **প্রত্যাশিত ফলাফল:** API ব্যাকএন্ড সহ React UI, স্বয়ংক্রিয় SSL, গ্লোবাল CDN

### For Intermediate Users
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (স্থানীয়) ⭐⭐  
   চ্যাট ইন্টারফেস এবং নিরাপদ API কী ব্যবস্থাপনা সহ gpt-4.1 ডিপ্লয় করুন  
   **সময়:** 35-45 মিনিট | **খরচ:** $50-200/মাস  
   **আপনি কি শিখবেন:** Microsoft Foundry Models ডিপ্লয়মেন্ট, Key Vault ইন্টিগ্রেশন, টোকেন ট্র্যাকিং  
   **প্রত্যাশিত ফলাফল:** gpt-4.1 এবং খরচ মনিটরিং সহ কাজ করা চ্যাট অ্যাপ্লিকেশন

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (স্থানীয়) ⭐⭐⭐⭐  
   প্রোডাকশন-রেডি মাল্টি-সার্ভিস আর্কিটেকচার  
   **সময়:** 45-60 মিনিট | **খরচ:** $50-150/মাস  
   **আপনি কি শিখবেন:** সার্ভিস কমিউনিকেশন, মেসেজ কিউইং, ডিস্ট্রিবিউটেড ট্রেসিং  
   **প্রত্যাশিত ফলাফল:** মনিটরিং সহ 2-সার্ভিস সিস্টেম (API Gateway + Product Service)

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API এবং Azure SQL Database সহ ওয়েব অ্যাপ্লিকেশন  
   **সময়:** 30-45 মিনিট | **খরচ:** $20-80/মাস  
   **আপনি কি শিখবেন:** Entity Framework, ডাটাবেস মাইগ্রেশন, কানেকশন সিকিউরিটি  
   **প্রত্যাশিত ফলাফল:** Azure SQL ব্যাকএন্ড সহ C# API, অটোমেটেড স্কিমা ডিপ্লয়মেন্ট

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP ট্রিগার এবং Cosmos DB সহ Python Azure Functions  
   **সময়:** 30-40 মিনিট | **খরচ:** $10-40/মাস  
   **আপনি কি শিখবেন:** ইভেন্ট-ভিত্তিক আর্কিটেকচার, সার্ভারলেস স্কেলিং, NoSQL ইন্টিগ্রেশন  
   **প্রত্যাশিত ফলাফল:** HTTP অনুরোধের উত্তর দেয় এমন এবং Cosmos DB স্টোরেজ ব্যবহৃত ফাংশন অ্যাপ

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps এবং API গেটওয়ে সহ মাল্টি-সার্ভিস Java অ্যাপ্লিকেশন  
   **সময়:** 60-90 মিনিট | **খরচ:** $80-200/মাস  
   **আপনি কি শিখবেন:** Spring Boot ডিপ্লয়মেন্ট, সার্ভিস মেশ, লোড ব্যালান্সিং  
   **প্রত্যাশিত ফলাফল:** সার্ভিস ডিসকভারি এবং রাউটিং সহ মাল্টি-সার্ভিস Java সিস্টেম

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   চ্যাট ইন্টারফেস সহ সম্পূর্ণ gpt-4.1 ডিপ্লয়মেন্ট  
   **সময়:** 35-45 মিনিট | **খরচ:** $50-200/মাস  
   **প্রত্যাশিত ফলাফল:** টোকেন ট্র্যাকিং এবং খরচ মনিটরিং সহ কাজ করা চ্যাট অ্যাপ্লিকেশন

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG আর্কিটেকচারের সাথে বুদ্ধিমান চ্যাট অ্যাপ্লিকেশন  
   **সময়:** 60-90 মিনিট | **খরচ:** $100-300/মাস  
   **প্রত্যাশিত ফলাফল:** ডকুমেন্ট সার্চ এবং উদ্ধৃতি সহ RAG-চালিত চ্যাট ইন্টারফেস

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI সার্ভিস ব্যবহার করে ডকুমেন্ট বিশ্লেষণ  
   **সময়:** 40-60 মিনিট | **খরচ:** $20-80/মাস  
   **প্রত্যাশিত ফলাফল:** আপলোড করা ডকুমেন্ট থেকে টেক্সট, টেবিল, এবং এন্টিটি বের করে আনে এমন API

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning সহ MLOps ওয়ার্কফ্লো  
   **সময়:** 2-3 ঘন্টা | **খরচ:** $150-500/মাস  
   **প্রত্যাশিত ফলাফল:** ট্রেনিং, ডিপ্লয়মেন্ট, এবং মনিটরিং সহ স্বয়ংক্রিয় ML পাইপলাইন

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

একটি ব্যাপক, প্রোডাকশন-রেডি মাল্টি-এজেন্ট কাস্টমার সাপোর্ট সলিউশন যা AZD দিয়ে এন্টারপ্রাইজ-গ্রেড AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট প্রদর্শন করে। এই সিনারিও প্রদান করে:
- **Complete Architecture**: বিশেষায়িত গ্রাহক পরিষেবা এবং ইনভেন্টরি পরিচালনা এজেন্টসহ মাল্টি-এজেন্ট সিস্টেম
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: এক-ক্লিক ডিপ্লয়মেন্ট বিভিন্ন কনফিগারেশন মোড (Minimal/Standard/Premium)
- **Advanced Features**: রেড-টিমিং নিরাপত্তা যাচাইকরণ, এজেন্ট মূল্যায়ন ফ্রেমওয়ার্ক, খরচ অপ্টিমাইজেশন, এবং সমস্যার সমাধান গাইড
- **Real Business Context**: রিটেইলার গ্রাহক সাপোর্ট ব্যবহার-কেস ফাইল আপলোড, সার্চ ইন্টিগ্রেশন, এবং ডাইনামিক স্কেলিং সহ

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (উন্নত - এন্টারপ্রাইজ প্রোডাকশন-রেডি)

**Perfect for**: এআই ডেভেলপার, সলিউশন আর্কিটেক্ট, এবং প্রোডাকশনে মাল্টি-এজেন্ট সিস্টেম নির্মাণকারী টিমগুলো

**Quick Start**: সংযুক্ত ARM টেমপ্লেট ব্যবহার করে `./deploy.sh -g myResourceGroup` দিয়ে সম্পূর্ণ সমাধানটি ৩০ মিনিটের কম সময়ে ডেপ্লয় করুন

## 📋 ব্যবহার নির্দেশাবলী

### প্রয়োজনীয়তা

Before running any example:
- ✅ Azure সাবস্ক্রিপশন যার Owner বা Contributor অ্যাক্সেস আছে
- ✅ Azure Developer CLI ইনস্টল করা আছে ([ইনস্টলেশন গাইড](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop চলছে (কনটেইনার উদাহরণগুলোর জন্য)
- ✅ প্রযোজ্য Azure কোটা (নির্দিষ্ট উদাহরণ-ভিত্তিক প্রয়োজনীয়তা চেক করুন)

> **💰 খরচ সতর্কীকরণ:** সমস্ত উদাহরণ বাস্তব Azure রিসোর্স তৈরি করে যেগুলো চার্জ ধার্য করে। খরচের অনুমান দেখতে পৃথক README ফাইলগুলো দেখুন। কাজ শেষ হলে চলমান খরচ এড়াতে `azd down` চালাতে ভুলবেন না।

### উদাহরণগুলো লোকালভাবে চালানো

1. **উদাহরণ ক্লোন বা কপি করুন**
   ```bash
   # পছন্দসই উদাহরণে যান
   cd examples/simple-web-app
   ```

2. **AZD পরিবেশ ইনিশিয়ালাইজ করুন**
   ```bash
   # বিদ্যমান টেমপ্লেট দিয়ে শুরু করুন
   azd init
   
   # অথবা নতুন পরিবেশ তৈরি করুন
   azd env new my-environment
   ```

3. **পরিবেশ কনফিগার করুন**
   ```bash
   # প্রয়োজনীয় ভেরিয়েবলগুলি সেট করুন
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ডেপ্লয় করুন**
   ```bash
   # ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন স্থাপন করুন
   azd up
   ```

5. **ডিপ্লয়মেন্ট যাচাই করুন**
   ```bash
   # সার্ভিসের এন্ডপয়েন্টগুলো পান
   azd env get-values
   
   # এন্ডপয়েন্টটি পরীক্ষা করুন (উদাহরণ)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **প্রত্যাশিত সাফল্য সূচকসমূহ:**
   - ✅ `azd up` কোন ত্রুটি ছাড়াই সম্পন্ন হয়
   - ✅ সার্ভিস এন্ডপয়েন্ট HTTP 200 ফেরত দেয়
   - ✅ Azure Portal shows "Running" status
   - ✅ Application Insights টেলিমেট্রি গ্রহণ করছে

> **⚠️ সমস্যা আছে?** ডিপ্লয়মেন্ট সমস্যা সমাধানের জন্য [সাধারণ সমস্যা](../docs/chapter-07-troubleshooting/common-issues.md) দেখুন

### উদাহরণগুলো মানিয়ে নেওয়া

প্রতিটি উদাহরণ অন্তর্ভুক্ত করে:
- **README.md** - বিস্তারিত সেটআপ এবং কাস্টমাইজেশন নির্দেশাবলি
- **azure.yaml** - মন্তব্যসহ AZD কনফিগারেশন
- **infra/** - প্যারামিটার ব্যাখ্যা সহ Bicep টেমপ্লেট
- **src/** - নমুনা অ্যাপ্লিকেশন কোড
- **scripts/** - সাধারণ কাজগুলোর জন্য সহায়ক স্ক্রিপ্ট

## 🎯 শেখার উদ্দেশ্য

### উদাহরণের শ্রেণীবিভাগ

#### **Basic Deployments**
- একক-সার্ভিস অ্যাপ্লিকেশন
- সহজ অবকাঠামো প্যাটার্ন
- বেসিক কনফিগারেশন ম্যানেজমেন্ট
- খরচ-সচেতন ডেভেলপমেন্ট সেটআপ

#### **Advanced Scenarios**
- মাল্টি-সার্ভিস আর্কিটেকচার
- জটিল নেটওয়ার্কিং কনফিগারেশন
- ডাটাবেস ইন্টিগ্রেশন প্যাটার্ন
- নিরাপত্তা ও সম্মতি বাস্তবায়ন

#### **Production-Ready Patterns**
- উচ্চ উপলব্ধতা কনফিগারেশন
- মনিটরিং ও অবজার্ভেবিলিটি
- CI/CD ইন্টিগ্রেশন
- ডিজাস্টার রিকভারি সেটআপ

## 📖 উদাহরণ বিবরণ

### Simple Web App - Node.js Express
**প্রযুক্তি**: Node.js, Express, MongoDB, Container Apps  
**জটিলতা**: প্রারম্ভিক  
**ধারণাগুলি**: বেসিক ডিপ্লয়মেন্ট, REST API, NoSQL ডাটাবেস ইন্টিগ্রেশন

### Static Website - React SPA
**প্রযুক্তি**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**জটিলতা**: প্রারম্ভিক  
**ধারণাগুলি**: স্ট্যাটিক হোস্টিং, সার্ভারলেস ব্যাকএন্ড, আধুনিক ওয়েব ডেভেলপমেন্ট

### Container App - Python Flask
**প্রযুক্তি**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**জটিলতা**: প্রারম্ভিক  
**ধারণাগুলি**: কনটেইনারাইজেশন, REST API, স্কেল-টু-জিরো, হেলথ প্রোবস, মনিটরিং  
**অবস্থান**: [লোকাল উদাহরণ](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**প্রযুক্তি**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**জটিলতা**: উন্নত  
**ধারণাগুলি**: মাল্টি-সার্ভিস আর্কিটেকচার, সার্ভিস যোগাযোগ, মেসেজ কিউইং, বিতরণকৃত ট্রেসিং  
**অবস্থান**: [লোকাল উদাহরণ](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**প্রযুক্তি**: C# ASP.NET Core, Azure SQL Database, App Service  
**জটিলতা**: মধ্যম  
**ধারণাগুলি**: Entity Framework, ডাটাবেস সংযোগ, ওয়েব API ডেভেলপমেন্ট

### Serverless Function - Python Azure Functions
**প্রযুক্তি**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**জটিলতা**: মধ্যম  
**ধারণাগুলি**: ইভেন্ট-চালিত আর্কিটেকচার, সার্ভারলেস কম্পিউটিং, ফুল-স্ট্যাক ডেভেলপমেন্ট

### Microservices - Java Spring Boot
**প্রযুক্তি**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**জটিলতা**: মধ্যম  
**ধারণাগুলি**: মাইক্রোসার্ভিস যোগাযোগ, বিতরণকৃত সিস্টেম, এন্টারপ্রাইজ প্যাটার্ন

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**প্রযুক্তি**: Microsoft Foundry Models, Cognitive Search, App Service  
**জটিলতা**: মধ্যম  
**ধারণাগুলি**: RAG আর্কিটেকচার, ভেক্টর সার্চ, LLM ইন্টিগ্রেশন

#### AI Document Processing
**প্রযুক্তি**: Azure AI Document Intelligence, Storage, Functions  
**জটিলতা**: মধ্যম  
**ধারণাগুলি**: ডকুমেন্ট বিশ্লেষণ, OCR, ডেটা এক্সট্র্যাকশন

#### Machine Learning Pipeline
**প্রযুক্তি**: Azure ML, MLOps, Container Registry  
**জটিলতা**: উন্নত  
**ধারণাগুলি**: মডেল ট্রেনিং, ডিপ্লয়মেন্ট পাইপলাইন, মনিটরিং

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
- নিরাপত্তা-কঠোর টেমপ্লেট
- Cost-optimized configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 কাস্টমাইজেশন গাইড

### আপনার ব্যবহারের ক্ষেত্রে উদাহরণগুলো মানিয়ে নেওয়া

1. **পূর্বশর্ত পর্যালোচনা করুন**
   - Azure সার্ভিসের প্রয়োজনীয়তাগুলো পরীক্ষা করুন
   - সাবস্ক্রিপশন সীমা যাচাই করুন
   - খরচ প্রভাবগুলো বুঝুন

2. **কনফিগারেশন পরিবর্তন করুন**
   - Update `azure.yaml` service definitions
   - Bicep টেমপ্লেট কাস্টমাইজ করুন
   - পরিবেশ ভ্যারিয়েবল সমন্বয় করুন

3. **টেস্ট সম্পূর্ণভাবে করুন**
   - প্রথমে ডেভেলপমেন্ট পরিবেশে ডিপ্লয় করুন
   - কার্যকারিতা যাচাই করুন
   - স্কেলিং এবং পারফরম্যান্স পরীক্ষা করুন

4. **নিরাপত্তা পর্যালোচনা**
   - অ্যাক্সেস কন্ট্রোল পর্যালোচনা করুন
   - সিক্রেটস ম্যানেজমেন্ট বাস্তবায়ন করুন
   - মনিটরিং ও অ্যালার্টিং সক্ষম করুন

## 📊 তুলনা ম্যাট্রিক্স

| উদাহরণ | সার্ভিস | ডাটাবেস | অথেন্টিকেশন | মনিটরিং | জটিলতা |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (লোকাল) | 2 | ❌ | Key Vault | পূর্ণ | ⭐⭐ |
| **Python Flask API** (লোকাল) | 1 | ❌ | বেসিক | পূর্ণ | ⭐ |
| **Microservices** (লোকাল) | 5+ | ✅ | এন্টারপ্রাইজ | উন্নত | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | বেসিক | বেসিক | ⭐ |
| React SPA + Functions | 3 | ✅ | বেসিক | পূর্ণ | ⭐ |
| Python Flask Container | 2 | ❌ | বেসিক | পূর্ণ | ⭐ |
| C# Web API + SQL | 2 | ✅ | পূর্ণ | পূর্ণ | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | পূর্ণ | পূর্ণ | ⭐⭐ |
| Java Microservices | 5+ | ✅ | পূর্ণ | পূর্ণ | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | পূর্ণ | পূর্ণ | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | বেসিক | পূর্ণ | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | পূর্ণ | পূর্ণ | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (লোকাল) | **8+** | **✅** | **এন্টারপ্রাইজ** | **উন্নত** | **⭐⭐⭐⭐** |

## 🎓 শেখার পথ

### সুপারিশকৃত অগ্রগতি

1. **সহজ ওয়েব অ্যাপ দিয়ে শুরু করুন**
   - বেসিক AZD ধারণা শিখুন
   - ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝুন
   - পরিবেশ ব্যবস্থাপনায় অনুশীলন করুন

2. **স্ট্যাটিক ওয়েবসাইট চেষ্টা করুন**
   - বিভিন্ন হোস্টিং অপশন অন্বেষণ করুন
   - CDN ইন্টিগ্রেশন সম্পর্কে জানুন
   - DNS কনফিগারেশন বুঝুন

3. **কনটেইনার অ্যাপে যান**
   - কনটেইনারাইজেশনের বুনিয়াদি শিখুন
   - স্কেলিং ধারণাগুলো বুঝুন
   - Docker দিয়ে অনুশীলন করুন

4. **ডাটাবেস ইন্টিগ্রেশন যোগ করুন**
   - ডাটাবেস প্রদান শিখুন
   - কানেকশন স্ট্রিংগুলো বুঝুন
   - সিক্রেটস ম্যানেজমেন্ট অনুশীলন করুন

5. **সার্ভারলেস অন্বেষণ করুন**
   - ইভেন্ট-চালিত আর্কিটেকচার বুঝুন
   - ট্রিগার ও বাইন্ডিং সম্পর্কে জানুন
   - APIs দিয়ে অনুশীলন করুন

6. **মাইক্রোসার্ভিস গঠন করুন**
   - সার্ভিস যোগাযোগ শিখুন
   - বিতরণকৃত সিস্টেম বুঝুন
   - জটিল ডিপ্লয়মেন্ট অনুশীলন করুন

## 🔍 উপযুক্ত উদাহরণ খুঁজে বের করা

### টেকনোলজি স্ট্যাক অনুযায়ী
- **Container Apps**: [Python Flask API (লোকাল)](../../../examples/container-app/simple-flask-api), [Microservices (লোকাল)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (লোকাল)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (লোকাল)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (লোকাল)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (লোকাল)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (লোকাল)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (লোকাল)](../../../examples/container-app/simple-flask-api), [Microservices (লোকাল)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (লোকাল)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (লোকাল)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (লোকাল)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (লোকাল)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### আর্কিটেকচার প্যাটার্ন অনুযায়ী
- **Simple REST API**: [Python Flask API (লোকাল)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (লোকাল)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (লোকাল)](../../../examples/container-app/simple-flask-api), [Microservices (লোকাল)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (লোকাল)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (লোকাল)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### জটিলতার স্তর অনুযায়ী
- **Beginner**: [Python Flask API (লোকাল)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (লোকাল)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (লোকাল)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Complete multi-agent system with ARM template deployment)

## 📚 অতিরিক্ত সম্পদ

### ডকুমেন্টেশন লিঙ্ক
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### কমিউনিটি উদাহরণসমূহ
- [Azure নমুনা AZD টেমপ্লেট](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry টেমপ্লেট](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI গ্যালারি](https://azure.github.io/awesome-azd/)
- [C# এবং Azure SQL সহ Todo অ্যাপ](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python এবং MongoDB সহ Todo অ্যাপ](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js এবং PostgreSQL সহ Todo অ্যাপ](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API সহ React ওয়েব অ্যাপ](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps জব](https://github.com/Azure-Samples/container-apps-jobs)
- [Java সহ Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### সেরা অনুশীলন
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 উদাহরণ অবদান

শেয়ার করার জন্য কোন উপযোগী উদাহরণ আছে? আমরা অবদানকে স্বাগত জানাই!

### জমা দেওয়ার নির্দেশিকা
1. স্থাপিত ডিরেক্টরি কাঠামো অনুসরণ করুন
2. সম্পূর্ণ README.md অন্তর্ভুক্ত করুন
3. কনফিগারেশন ফাইলগুলিতে মন্তব্য যোগ করুন
4. জমা দিতে আগে পরিপূর্ণভাবে পরীক্ষা করুন
5. খরচের অনুমান এবং পূর্বশর্তসমূহ অন্তর্ভুক্ত করুন

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

**প্রো টিপ**: আপনার প্রযুক্তি স্ট্যাকের সাথে মিল আছে এমন সবচেয়ে সহজ উদাহরণ দিয়ে শুরু করুন, তারপর ধীরে ধীরে আরও জটিল পরিস্থিতির দিকে এগুন। প্রতিটি উদাহরণ পূর্বের উদাহরণগুলোর ধারণার উপর ভিত্তি করে তৈরি!

## 🚀 শুরু করতে প্রস্তুত?

### আপনার শেখার পথ

1. **সম্পূর্ণ নবাগত?** → [Flask API](../../../examples/container-app/simple-flask-api) দিয়ে শুরু করুন (⭐, 20 মিনিট)
2. **AZD সম্পর্কে মৌলিক জ্ঞান আছে?** → [Microservices](../../../examples/container-app/microservices) চেষ্টা করুন (⭐⭐⭐⭐, 60 মিনিট)
3. **এআই অ্যাপ তৈরি করছেন?** → [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) দিয়ে শুরু করুন (⭐⭐, 35 মিনিট) অথবা [Retail Multi-Agent](retail-scenario.md) অন্বেষণ করুন (⭐⭐⭐⭐, 2+ ঘন্টা)
4. **নির্দিষ্ট টেক স্ট্যাক দরকার?** → উপরের [ঠিক উদাহরণ খুঁজে পাওয়া](../../../examples) বিভাগটি ব্যবহার করুন

### পরবর্তী পদক্ষেপ

- ✅ উপরে থাকা [প্রয়োজনীয়তা](../../../examples) পর্যালোচনা করুন
- ✅ আপনার দক্ষতার স্তরের সাথে মিল আছে এমন একটি উদাহরণ নির্বাচন করুন (দেখুন [জটিলতা রেটিং লেজেন্ড](../../../examples))
- ✅ ডিপ্লয় করার আগে উদাহরণের README সতর্কতার সাথে পড়ুন
- ✅ পরীক্ষা করার পরে `azd down` চালানোর জন্য একটি রিমাইন্ডার সেট করুন
- ✅ GitHub Issues বা Discussions এর মাধ্যমে আপনার অভিজ্ঞতা শেয়ার করুন

### সাহায্য দরকার?

- 📖 [FAQ](../resources/faq.md) - সাধারণ প্রশ্নের উত্তর
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - ডিপ্লয়মেন্ট সমস্যা সমাধান করুন
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - কমিউনিটিতে প্রশ্ন করুন
- 📚 [Study Guide](../resources/study-guide.md) - আপনার শেখা শক্তিশালী করুন

---

**নেভিগেশন**
- **📚 কোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 অধ্যয়ন উপকরণ**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 উপকরণ**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*সর্বশেষ আপডেট: নভেম্বর 2025 | [সমস্যা রিপোর্ট করুন](https://github.com/microsoft/AZD-for-beginners/issues) | [উদাহরণ পাঠান](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co‑op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা সঠিকতার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। নথিটির মূল ভাষায় থাকা সংস্করণটিকেই প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদই সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে যে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
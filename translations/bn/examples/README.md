<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T19:28:30+00:00",
  "source_file": "examples/README.md",
  "language_code": "bn"
}
-->
# উদাহরণসমূহ - ব্যবহারিক AZD টেমপ্লেট এবং কনফিগারেশন

**উদাহরণ থেকে শেখা - অধ্যায় অনুযায়ী সংগঠিত**
- **📚 কোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 অধ্যায় ম্যাপিং**: শেখার জটিলতার ভিত্তিতে উদাহরণসমূহ সংগঠিত
- **🚀 সহজে শুরু করুন**: [অধ্যায় ১ উদাহরণসমূহ](../../../examples)
- **🤖 AI উদাহরণসমূহ**: [অধ্যায় ২ এবং ৫ AI সমাধান](../../../examples)

## ভূমিকা

এই ডিরেক্টরিতে ব্যবহারিক উদাহরণ, টেমপ্লেট এবং বাস্তব জীবনের পরিস্থিতি রয়েছে যা আপনাকে Azure Developer CLI হাতে-কলমে অনুশীলনের মাধ্যমে শিখতে সাহায্য করবে। প্রতিটি উদাহরণ সম্পূর্ণ কার্যকর কোড, অবকাঠামো টেমপ্লেট এবং বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং ডিপ্লয়মেন্ট প্যাটার্নের জন্য বিস্তারিত নির্দেশনা প্রদান করে।

## শেখার লক্ষ্য

এই উদাহরণগুলো অনুসরণ করে আপনি:
- বাস্তব অ্যাপ্লিকেশন পরিস্থিতিতে Azure Developer CLI ওয়ার্কফ্লো অনুশীলন করবেন
- বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং তাদের azd বাস্তবায়ন বুঝবেন
- বিভিন্ন Azure পরিষেবার জন্য Infrastructure as Code প্যাটার্ন আয়ত্ত করবেন
- কনফিগারেশন ম্যানেজমেন্ট এবং পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট কৌশল প্রয়োগ করবেন
- ব্যবহারিক প্রেক্ষাপটে মনিটরিং, নিরাপত্তা এবং স্কেলিং প্যাটার্ন বাস্তবায়ন করবেন
- বাস্তব ডিপ্লয়মেন্ট পরিস্থিতি নিয়ে সমস্যা সমাধান এবং ডিবাগিংয়ের অভিজ্ঞতা অর্জন করবেন

## শেখার ফলাফল

এই উদাহরণগুলো সম্পন্ন করার পর আপনি:
- আত্মবিশ্বাসের সাথে Azure Developer CLI ব্যবহার করে বিভিন্ন অ্যাপ্লিকেশন টাইপ ডিপ্লয় করতে পারবেন
- প্রদত্ত টেমপ্লেটগুলো আপনার নিজস্ব অ্যাপ্লিকেশন প্রয়োজন অনুযায়ী মানিয়ে নিতে পারবেন
- Bicep ব্যবহার করে কাস্টম অবকাঠামো প্যাটার্ন ডিজাইন এবং বাস্তবায়ন করতে পারবেন
- সঠিক নির্ভরতার সাথে জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন কনফিগার করতে পারবেন
- বাস্তব পরিস্থিতিতে নিরাপত্তা, মনিটরিং এবং পারফরম্যান্সের সেরা অনুশীলন প্রয়োগ করতে পারবেন
- ব্যবহারিক অভিজ্ঞতার ভিত্তিতে ডিপ্লয়মেন্ট সমস্যা সমাধান এবং অপ্টিমাইজ করতে পারবেন

## ডিরেক্টরি কাঠামো

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

### নবাগতদের জন্য
1. **[সাধারণ ওয়েব অ্যাপ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - MongoDB সহ একটি Node.js Express ওয়েব অ্যাপ্লিকেশন ডিপ্লয় করুন
2. **[স্ট্যাটিক ওয়েবসাইট - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Azure Static Web Apps ব্যবহার করে একটি React স্ট্যাটিক ওয়েবসাইট হোস্ট করুন
3. **[কন্টেইনার অ্যাপ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - একটি কন্টেইনারাইজড Python Flask অ্যাপ্লিকেশন ডিপ্লয় করুন

### মধ্যম স্তরের ব্যবহারকারীদের জন্য
4. **[ডাটাবেস অ্যাপ - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - C# API এবং Azure SQL ডাটাবেস সহ একটি ওয়েব অ্যাপ্লিকেশন
5. **[সার্ভারলেস ফাংশন - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - HTTP ট্রিগার এবং Cosmos DB সহ Python Azure Functions
6. **[মাইক্রোসার্ভিস - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Container Apps এবং API গেটওয়ে সহ একটি মাল্টি-সার্ভিস Java অ্যাপ্লিকেশন

### Azure AI Foundry টেমপ্লেট

1. **[Azure OpenAI চ্যাট অ্যাপ](https://github.com/Azure-Samples/azure-search-openai-demo)** - Azure OpenAI সহ একটি বুদ্ধিমান চ্যাট অ্যাপ্লিকেশন
2. **[AI ডকুমেন্ট প্রসেসিং](https://github.com/Azure-Samples/azure-ai-document-processing)** - Azure AI পরিষেবাগুলি ব্যবহার করে ডকুমেন্ট বিশ্লেষণ
3. **[মেশিন লার্নিং পাইপলাইন](https://github.com/Azure-Samples/mlops-v2)** - Azure Machine Learning সহ MLOps ওয়ার্কফ্লো

### বাস্তব জীবনের পরিস্থিতি

#### **রিটেইল মাল্টি-এজেন্ট সমাধান** 🆕
**[সম্পূর্ণ বাস্তবায়ন গাইড](./retail-scenario.md)**

একটি ব্যাপক, প্রোডাকশন-রেডি মাল্টি-এজেন্ট কাস্টমার সাপোর্ট সমাধান যা AZD ব্যবহার করে এন্টারপ্রাইজ-গ্রেড AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট প্রদর্শন করে। এই পরিস্থিতি প্রদান করে:

- **সম্পূর্ণ আর্কিটেকচার**: বিশেষায়িত কাস্টমার সার্ভিস এবং ইনভেন্টরি ম্যানেজমেন্ট এজেন্ট সহ মাল্টি-এজেন্ট সিস্টেম
- **প্রোডাকশন অবকাঠামো**: মাল্টি-রিজিওন Azure OpenAI ডিপ্লয়মেন্ট, AI সার্চ, Container Apps এবং ব্যাপক মনিটরিং
- **রেডি-টু-ডিপ্লয় ARM টেমপ্লেট**: এক-ক্লিক ডিপ্লয়মেন্ট বিভিন্ন কনফিগারেশন মোডে (Minimal/Standard/Premium)
- **উন্নত বৈশিষ্ট্য**: রেড টিমিং নিরাপত্তা যাচাইকরণ, এজেন্ট মূল্যায়ন ফ্রেমওয়ার্ক, খরচ অপ্টিমাইজেশন এবং সমস্যা সমাধানের গাইড
- **বাস্তব ব্যবসায়িক প্রেক্ষাপট**: ফাইল আপলোড, সার্চ ইন্টিগ্রেশন এবং ডায়নামিক স্কেলিং সহ রিটেইলার কাস্টমার সাপোর্ট ব্যবহার কেস

**প্রযুক্তি**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**জটিলতা**: ⭐⭐⭐⭐ (উন্নত - এন্টারপ্রাইজ প্রোডাকশন রেডি)

**উপযুক্ত**: AI ডেভেলপার, সলিউশন আর্কিটেক্ট এবং প্রোডাকশন মাল্টি-এজেন্ট সিস্টেম তৈরি করা দল

**দ্রুত শুরু**: `./deploy.sh -g myResourceGroup` ব্যবহার করে অন্তর্ভুক্ত ARM টেমপ্লেটের মাধ্যমে সম্পূর্ণ সমাধান ৩০ মিনিটের মধ্যে ডিপ্লয় করুন

## 📋 ব্যবহার নির্দেশিকা

### স্থানীয়ভাবে উদাহরণ চালানো

1. **উদাহরণ ক্লোন বা কপি করুন**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD পরিবেশ ইনিশিয়ালাইজ করুন**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **পরিবেশ কনফিগার করুন**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **ডিপ্লয় করুন**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### উদাহরণ মানিয়ে নেওয়া

প্রতিটি উদাহরণ অন্তর্ভুক্ত করে:
- **README.md** - বিস্তারিত সেটআপ এবং কাস্টমাইজেশন নির্দেশনা
- **azure.yaml** - মন্তব্য সহ AZD কনফিগারেশন
- **infra/** - প্যারামিটার ব্যাখ্যা সহ Bicep টেমপ্লেট
- **src/** - নমুনা অ্যাপ্লিকেশন কোড
- **scripts/** - সাধারণ কাজের জন্য সহায়ক স্ক্রিপ্ট

## 🎯 শেখার উদ্দেশ্য

### উদাহরণ বিভাগসমূহ

#### **মৌলিক ডিপ্লয়মেন্ট**
- একক-সার্ভিস অ্যাপ্লিকেশন
- সাধারণ অবকাঠামো প্যাটার্ন
- মৌলিক কনফিগারেশন ম্যানেজমেন্ট
- খরচ-সাশ্রয়ী ডেভেলপমেন্ট সেটআপ

#### **উন্নত পরিস্থিতি**
- মাল্টি-সার্ভিস আর্কিটেকচার
- জটিল নেটওয়ার্কিং কনফিগারেশন
- ডাটাবেস ইন্টিগ্রেশন প্যাটার্ন
- নিরাপত্তা এবং কমপ্লায়েন্স বাস্তবায়ন

#### **প্রোডাকশন-রেডি প্যাটার্ন**
- উচ্চ প্রাপ্যতা কনফিগারেশন
- মনিটরিং এবং পর্যবেক্ষণযোগ্যতা
- CI/CD ইন্টিগ্রেশন
- দুর্যোগ পুনরুদ্ধার সেটআপ

## 📖 উদাহরণ বিবরণ

### সাধারণ ওয়েব অ্যাপ - Node.js Express
**প্রযুক্তি**: Node.js, Express, MongoDB, Container Apps  
**জটিলতা**: নবাগত  
**ধারণা**: মৌলিক ডিপ্লয়মেন্ট, REST API, NoSQL ডাটাবেস ইন্টিগ্রেশন

### স্ট্যাটিক ওয়েবসাইট - React SPA
**প্রযুক্তি**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**জটিলতা**: নবাগত  
**ধারণা**: স্ট্যাটিক হোস্টিং, সার্ভারলেস ব্যাকএন্ড, আধুনিক ওয়েব ডেভেলপমেন্ট

### কন্টেইনার অ্যাপ - Python Flask
**প্রযুক্তি**: Python Flask, Docker, Container Apps, Container Registry  
**জটিলতা**: নবাগত  
**ধারণা**: কন্টেইনারাইজেশন, মাইক্রোসার্ভিস আর্কিটেকচার, API ডেভেলপমেন্ট

### ডাটাবেস অ্যাপ - C# with Azure SQL
**প্রযুক্তি**: C# ASP.NET Core, Azure SQL Database, App Service  
**জটিলতা**: মধ্যম  
**ধারণা**: Entity Framework, ডাটাবেস সংযোগ, ওয়েব API ডেভেলপমেন্ট

### সার্ভারলেস ফাংশন - Python Azure Functions
**প্রযুক্তি**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**জটিলতা**: মধ্যম  
**ধারণা**: ইভেন্ট-চালিত আর্কিটেকচার, সার্ভারলেস কম্পিউটিং, ফুল-স্ট্যাক ডেভেলপমেন্ট

### মাইক্রোসার্ভিস - Java Spring Boot
**প্রযুক্তি**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**জটিলতা**: মধ্যম  
**ধারণা**: সার্ভিস যোগাযোগ, বিতরণকৃত সিস্টেম, এন্টারপ্রাইজ প্যাটার্ন

### Azure AI Foundry উদাহরণসমূহ

#### Azure OpenAI চ্যাট অ্যাপ
**প্রযুক্তি**: Azure OpenAI, Cognitive Search, App Service  
**জটিলতা**: মধ্যম  
**ধারণা**: RAG আর্কিটেকচার, ভেক্টর সার্চ, LLM ইন্টিগ্রেশন

#### AI ডকুমেন্ট প্রসেসিং
**প্রযুক্তি**: Azure AI Document Intelligence, Storage, Functions  
**জটিলতা**: মধ্যম  
**ধারণা**: ডকুমেন্ট বিশ্লেষণ, OCR, ডেটা এক্সট্রাকশন

#### মেশিন লার্নিং পাইপলাইন
**প্রযুক্তি**: Azure ML, MLOps, Container Registry  
**জটিলতা**: উন্নত  
**ধারণা**: মডেল ট্রেনিং, ডিপ্লয়মেন্ট পাইপলাইন, মনিটরিং

## 🛠 কনফিগারেশন উদাহরণসমূহ

`configurations/` ডিরেক্টরি পুনর্ব্যবহারযোগ্য উপাদানসমূহ অন্তর্ভুক্ত করে:

### পরিবেশ কনফিগারেশন
- ডেভেলপমেন্ট পরিবেশ সেটিংস
- স্টেজিং পরিবেশ কনফিগারেশন
- প্রোডাকশন-রেডি কনফিগারেশন
- মাল্টি-রিজিওন ডিপ্লয়মেন্ট সেটআপ

### Bicep মডিউল
- পুনর্ব্যবহারযোগ্য অবকাঠামো উপাদান
- সাধারণ রিসোর্স প্যাটার্ন
- নিরাপত্তা-শক্তিশালী টেমপ্লেট
- খরচ-অপ্টিমাইজড কনফিগারেশন

### সহায়ক স্ক্রিপ্ট
- পরিবেশ সেটআপ অটোমেশন
- ডাটাবেস মাইগ্রেশন স্ক্রিপ্ট
- ডিপ্লয়মেন্ট যাচাইকরণ টুল
- খরচ মনিটরিং ইউটিলিটি

## 🔧 কাস্টমাইজেশন গাইড

### আপনার ব্যবহারের জন্য উদাহরণ মানিয়ে নেওয়া

1. **প্রয়োজনীয়তা পর্যালোচনা করুন**
   - Azure পরিষেবা প্রয়োজনীয়তা পরীক্ষা করুন
   - সাবস্ক্রিপশন সীমা যাচাই করুন
   - খরচের প্রভাব বুঝুন

2. **কনফিগারেশন পরিবর্তন করুন**
   - `azure.yaml` সার্ভিস সংজ্ঞা আপডেট করুন
   - Bicep টেমপ্লেট কাস্টমাইজ করুন
   - পরিবেশ ভেরিয়েবল সামঞ্জস্য করুন

3. **ভালোভাবে পরীক্ষা করুন**
   - প্রথমে ডেভেলপমেন্ট পরিবেশে ডিপ্লয় করুন
   - কার্যকারিতা যাচাই করুন
   - স্কেলিং এবং পারফরম্যান্স পরীক্ষা করুন

4. **নিরাপত্তা পর্যালোচনা করুন**
   - অ্যাক্সেস নিয়ন্ত্রণ পর্যালোচনা করুন
   - সিক্রেট ম্যানেজমেন্ট বাস্তবায়ন করুন
   - মনিটরিং এবং অ্যালার্টিং সক্ষম করুন

## 📊 তুলনামূলক ম্যাট্রিক্স

| উদাহরণ | সার্ভিস | ডাটাবেস | অথ | মনিটরিং | জটিলতা |
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
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 শেখার পথ

### প্রস্তাবিত অগ্রগতি

1. **সাধারণ ওয়েব অ্যাপ দিয়ে শুরু করুন**
   - মৌলিক AZD ধারণা শিখুন
   - ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝুন
   - পরিবেশ ব্যবস্থাপনা অনুশীলন করুন

2. **স্ট্যাটিক ওয়েবসাইট চেষ্টা করুন**
   - বিভিন্ন হোস্টিং অপশন অন্বেষণ করুন
   - CDN ইন্টিগ্রেশন শিখুন
   - DNS কনফিগারেশন বুঝুন

3. **কন্টেইনার অ্যাপে যান**
   - কন্টেইনারাইজেশনের মৌলিক বিষয় শিখুন
   - স্কেলিং ধারণা বুঝুন
   - Docker নিয়ে অনুশীলন করুন

4. **ডাটাবেস ইন্টিগ্রেশন যোগ করুন**
   - ডাটাবেস প্রভিশনিং শিখুন
   - সংযোগ স্ট্রিং বুঝুন
   - সিক্রেট ম্যানেজমেন্ট অনুশীলন করুন

5. **সার্ভারলেস অন্বেষণ করুন**
   - ইভেন্ট-চালিত আর্কিটেকচার বুঝুন
   - ট্রিগার এবং বাইন্ডিং সম্পর্কে শিখুন
   - API নিয়ে অনুশীলন করুন

6. **মাইক্রোসার্ভিস তৈরি করুন**
   - সার্ভিস যোগাযোগ শিখুন
   - বিতরণকৃত সিস্টেম বুঝুন
   - জটিল ডিপ্লয়মেন্ট অনুশীলন করুন

## 🔍 সঠিক উদাহরণ খুঁজে পাওয়া

### প্রযুক্তি স্ট্যাক অনুযায়ী
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **Enterprise Production**: **Retail Multi-Agent Solution**

### আর্কিটেকচার প্যাটার্ন অনুযায়ী
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**

- [C# এবং Azure SQL দিয়ে Todo App](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python এবং MongoDB দিয়ে Todo App](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js এবং PostgreSQL দিয়ে Todo App](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App এবং C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Java দিয়ে Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### সেরা অনুশীলন
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 উদাহরণে অবদান রাখুন

কোনো উপকারী উদাহরণ শেয়ার করতে চান? আমরা অবদানকে স্বাগত জানাই!

### জমা দেওয়ার নির্দেশিকা
1. নির্ধারিত ডিরেক্টরি কাঠামো অনুসরণ করুন
2. বিস্তারিত README.md অন্তর্ভুক্ত করুন
3. কনফিগারেশন ফাইলগুলোতে মন্তব্য যোগ করুন
4. জমা দেওয়ার আগে ভালোভাবে পরীক্ষা করুন
5. খরচের হিসাব এবং পূর্বশর্ত অন্তর্ভুক্ত করুন

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

**প্রো টিপ**: আপনার প্রযুক্তি স্ট্যাকের সাথে মিলে যায় এমন সবচেয়ে সহজ উদাহরণ দিয়ে শুরু করুন, তারপর ধীরে ধীরে আরও জটিল পরিস্থিতিতে এগিয়ে যান। প্রতিটি উদাহরণ আগের উদাহানের ধারণাগুলোর উপর ভিত্তি করে তৈরি হয়!

**পরবর্তী পদক্ষেপ**: 
- আপনার দক্ষতার স্তরের সাথে মিলে যায় এমন একটি উদাহরণ নির্বাচন করুন
- উদাহরণের README-তে দেওয়া সেটআপ নির্দেশিকা অনুসরণ করুন
- কাস্টমাইজেশন নিয়ে পরীক্ষা করুন
- আপনার শেখা বিষয়গুলো কমিউনিটির সাথে শেয়ার করুন

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [স্টাডি গাইড](../resources/study-guide.md)
- **ফিরে যান**: [মূল README](../README.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
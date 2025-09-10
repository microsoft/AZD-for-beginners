<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:08:22+00:00",
  "source_file": "examples/README.md",
  "language_code": "bn"
}
-->
# উদাহরণসমূহ - ব্যবহারিক AZD টেমপ্লেট এবং কনফিগারেশন

## ভূমিকা

এই ডিরেক্টরিতে ব্যবহারিক উদাহরণ, টেমপ্লেট এবং বাস্তব জীবনের পরিস্থিতি অন্তর্ভুক্ত রয়েছে যা আপনাকে হাতে-কলমে অনুশীলনের মাধ্যমে Azure Developer CLI শিখতে সাহায্য করবে। প্রতিটি উদাহরণে সম্পূর্ণ কার্যকর কোড, অবকাঠামো টেমপ্লেট এবং বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার ও ডিপ্লয়মেন্ট প্যাটার্নের জন্য বিস্তারিত নির্দেশনা রয়েছে।

## শেখার লক্ষ্য

এই উদাহরণগুলো অনুশীলন করে আপনি:
- বাস্তবসম্মত অ্যাপ্লিকেশন পরিস্থিতিতে Azure Developer CLI ওয়ার্কফ্লো অনুশীলন করবেন
- বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং তাদের azd বাস্তবায়ন বুঝতে পারবেন
- বিভিন্ন Azure পরিষেবার জন্য Infrastructure as Code প্যাটার্ন আয়ত্ত করবেন
- কনফিগারেশন ম্যানেজমেন্ট এবং পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট কৌশল প্রয়োগ করবেন
- ব্যবহারিক প্রেক্ষাপটে মনিটরিং, নিরাপত্তা এবং স্কেলিং প্যাটার্ন বাস্তবায়ন করবেন
- বাস্তব ডিপ্লয়মেন্ট পরিস্থিতি থেকে সমস্যা সমাধান এবং ডিবাগিংয়ের অভিজ্ঞতা অর্জন করবেন

## শেখার ফলাফল

এই উদাহরণগুলো সম্পন্ন করার পর আপনি:
- আত্মবিশ্বাসের সাথে Azure Developer CLI ব্যবহার করে বিভিন্ন অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন
- প্রদত্ত টেমপ্লেটগুলো আপনার নিজস্ব অ্যাপ্লিকেশন প্রয়োজন অনুযায়ী মানিয়ে নিতে পারবেন
- Bicep ব্যবহার করে কাস্টম অবকাঠামো প্যাটার্ন ডিজাইন এবং বাস্তবায়ন করতে পারবেন
- সঠিক নির্ভরশীলতাসহ জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন কনফিগার করতে পারবেন
- বাস্তব পরিস্থিতিতে নিরাপত্তা, মনিটরিং এবং পারফরম্যান্সের সেরা অনুশীলন প্রয়োগ করতে পারবেন
- ব্যবহারিক অভিজ্ঞতার ভিত্তিতে ডিপ্লয়মেন্ট সমস্যা সমাধান এবং অপ্টিমাইজ করতে পারবেন

## ডিরেক্টরি কাঠামো

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

## দ্রুত শুরু উদাহরণ

### নতুনদের জন্য
1. **[Simple Web App](../../../examples/simple-web-app)** - একটি সাধারণ Node.js ওয়েব অ্যাপ্লিকেশন ডিপ্লয় করুন  
2. **[Static Website](../../../examples/static-website)** - Azure Storage-এ একটি স্ট্যাটিক ওয়েবসাইট হোস্ট করুন  
3. **[Container App](../../../examples/container-app)** - একটি কন্টেইনারাইজড অ্যাপ্লিকেশন ডিপ্লয় করুন  

### মধ্যবর্তী ব্যবহারকারীদের জন্য
4. **[Database App](../../../examples/database-app)** - PostgreSQL ডাটাবেস সহ একটি ওয়েব অ্যাপ্লিকেশন  
5. **[Serverless Function](../../../examples/serverless-function)** - HTTP ট্রিগার সহ Azure Functions  
6. **[Microservices](../../../examples/microservices)** - API গেটওয়ে সহ একটি মাল্টি-সার্ভিস অ্যাপ্লিকেশন  

## 📋 ব্যবহারের নির্দেশনা

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
- **azure.yaml** - মন্তব্যসহ AZD কনফিগারেশন
- **infra/** - প্যারামিটার ব্যাখ্যাসহ Bicep টেমপ্লেট
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
- নিরাপত্তা এবং সম্মতি বাস্তবায়ন

#### **প্রোডাকশন-রেডি প্যাটার্ন**
- উচ্চ প্রাপ্যতা কনফিগারেশন
- মনিটরিং এবং পর্যবেক্ষণ
- CI/CD ইন্টিগ্রেশন
- দুর্যোগ পুনরুদ্ধার সেটআপ

## 📖 উদাহরণ বর্ণনা

### Simple Web App
**প্রযুক্তি**: Node.js, App Service, Application Insights  
**জটিলতা**: নতুন  
**ধারণা**: মৌলিক ডিপ্লয়মেন্ট, পরিবেশ ভেরিয়েবল, স্বাস্থ্য পরীক্ষা  

### Static Website
**প্রযুক্তি**: HTML/CSS/JS, Storage Account, CDN  
**জটিলতা**: নতুন  
**ধারণা**: স্ট্যাটিক হোস্টিং, CDN ইন্টিগ্রেশন, কাস্টম ডোমেইন  

### Container App
**প্রযুক্তি**: Docker, Container Apps, Container Registry  
**জটিলতা**: মধ্যবর্তী  
**ধারণা**: কন্টেইনারাইজেশন, স্কেলিং, ইনগ্রেস কনফিগারেশন  

### Database App
**প্রযুক্তি**: Python Flask, PostgreSQL, App Service  
**জটিলতা**: মধ্যবর্তী  
**ধারণা**: ডাটাবেস সংযোগ, সিক্রেট ম্যানেজমেন্ট, মাইগ্রেশন  

### Serverless Function
**প্রযুক্তি**: Azure Functions, Cosmos DB, API Management  
**জটিলতা**: মধ্যবর্তী  
**ধারণা**: ইভেন্ট-চালিত আর্কিটেকচার, বাইন্ডিংস, API ম্যানেজমেন্ট  

### Microservices
**প্রযুক্তি**: একাধিক সার্ভিস, Service Bus, API Gateway  
**জটিলতা**: উন্নত  
**ধারণা**: সার্ভিস কমিউনিকেশন, মেসেজ কুইয়িং, লোড ব্যালেন্সিং  

## 🛠 কনফিগারেশন উদাহরণ

`configurations/` ডিরেক্টরিতে পুনঃব্যবহারযোগ্য উপাদান রয়েছে:

### পরিবেশ কনফিগারেশন
- ডেভেলপমেন্ট পরিবেশ সেটিংস
- স্টেজিং পরিবেশ কনফিগারেশন
- প্রোডাকশন-রেডি কনফিগারেশন
- মাল্টি-রিজিয়ন ডিপ্লয়মেন্ট সেটআপ

### Bicep মডিউল
- পুনঃব্যবহারযোগ্য অবকাঠামো উপাদান
- সাধারণ রিসোর্স প্যাটার্ন
- নিরাপত্তা-শক্তিশালী টেমপ্লেট
- খরচ-সাশ্রয়ী কনফিগারেশন

### সহায়ক স্ক্রিপ্ট
- পরিবেশ সেটআপ অটোমেশন
- ডাটাবেস মাইগ্রেশন স্ক্রিপ্ট
- ডিপ্লয়মেন্ট যাচাইকরণ টুল
- খরচ পর্যবেক্ষণ ইউটিলিটি

## 🔧 কাস্টমাইজেশন গাইড

### আপনার প্রয়োজন অনুযায়ী উদাহরণ মানিয়ে নেওয়া

1. **প্রয়োজনীয়তা পর্যালোচনা করুন**
   - Azure পরিষেবার প্রয়োজনীয়তা পরীক্ষা করুন
   - সাবস্ক্রিপশন সীমা যাচাই করুন
   - খরচের প্রভাব বুঝুন

2. **কনফিগারেশন পরিবর্তন করুন**
   - `azure.yaml` সার্ভিস ডেফিনিশন আপডেট করুন
   - Bicep টেমপ্লেট কাস্টমাইজ করুন
   - পরিবেশ ভেরিয়েবল সামঞ্জস্য করুন

3. **ভালোভাবে পরীক্ষা করুন**
   - প্রথমে ডেভেলপমেন্ট পরিবেশে ডিপ্লয় করুন
   - কার্যকারিতা যাচাই করুন
   - স্কেলিং এবং পারফরম্যান্স পরীক্ষা করুন

4. **নিরাপত্তা পর্যালোচনা করুন**
   - অ্যাক্সেস কন্ট্রোল পর্যালোচনা করুন
   - সিক্রেট ম্যানেজমেন্ট বাস্তবায়ন করুন
   - মনিটরিং এবং অ্যালার্টিং সক্রিয় করুন

## 📊 তুলনামূলক ম্যাট্রিক্স

| উদাহরণ | সার্ভিস | ডাটাবেস | অথ | মনিটরিং | জটিলতা |
|--------|---------|----------|-----|----------|---------|
| Simple Web App | 1 | ❌ | Basic | Basic | ⭐ |
| Static Website | 1 | ❌ | ❌ | Basic | ⭐ |
| Container App | 1 | ❌ | Basic | Full | ⭐⭐ |
| Database App | 2 | ✅ | Full | Full | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 শেখার পথ

### প্রস্তাবিত অগ্রগতি

1. **Simple Web App দিয়ে শুরু করুন**
   - মৌলিক AZD ধারণা শিখুন
   - ডিপ্লয়মেন্ট ওয়ার্কফ্লো বুঝুন
   - পরিবেশ ব্যবস্থাপনা অনুশীলন করুন

2. **Static Website চেষ্টা করুন**
   - বিভিন্ন হোস্টিং অপশন অন্বেষণ করুন
   - CDN ইন্টিগ্রেশন শিখুন
   - DNS কনফিগারেশন বুঝুন

3. **Container App-এ যান**
   - কন্টেইনারাইজেশনের মৌলিক বিষয় শিখুন
   - স্কেলিং ধারণা বুঝুন
   - Docker নিয়ে অনুশীলন করুন

4. **ডাটাবেস ইন্টিগ্রেশন যোগ করুন**
   - ডাটাবেস প্রভিশনিং শিখুন
   - কানেকশন স্ট্রিং বুঝুন
   - সিক্রেট ম্যানেজমেন্ট অনুশীলন করুন

5. **Serverless অন্বেষণ করুন**
   - ইভেন্ট-চালিত আর্কিটেকচার বুঝুন
   - ট্রিগার এবং বাইন্ডিংস শিখুন
   - API নিয়ে অনুশীলন করুন

6. **Microservices তৈরি করুন**
   - সার্ভিস কমিউনিকেশন শিখুন
   - ডিস্ট্রিবিউটেড সিস্টেম বুঝুন
   - জটিল ডিপ্লয়মেন্ট অনুশীলন করুন

## 🔍 সঠিক উদাহরণ খুঁজে পাওয়া

### প্রযুক্তি স্ট্যাক অনুযায়ী
- **Node.js**: Simple Web App, Microservices  
- **Python**: Database App, Serverless Function  
- **Static Sites**: Static Website  
- **Containers**: Container App, Microservices  
- **Databases**: Database App, Serverless Function  

### আর্কিটেকচার প্যাটার্ন অনুযায়ী
- **Monolithic**: Simple Web App, Database App  
- **Static**: Static Website  
- **Microservices**: Microservices উদাহরণ  
- **Serverless**: Serverless Function  
- **Hybrid**: Container App  

### জটিলতার স্তর অনুযায়ী
- **নতুন**: Simple Web App, Static Website  
- **মধ্যবর্তী**: Container App, Database App, Serverless Function  
- **উন্নত**: Microservices  

## 📚 অতিরিক্ত সম্পদ

### ডকুমেন্টেশন লিঙ্ক
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### কমিউনিটি উদাহরণ
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  

### সেরা অনুশীলন
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 উদাহরণ জমা দেওয়া

কোনো উপকারী উদাহরণ শেয়ার করতে চান? আমরা অবদানকে স্বাগত জানাই!

### জমা দেওয়ার নির্দেশিকা
1. প্রতিষ্ঠিত ডিরেক্টরি কাঠামো অনুসরণ করুন  
2. বিস্তারিত README.md অন্তর্ভুক্ত করুন  
3. কনফিগারেশন ফাইলগুলোতে মন্তব্য যোগ করুন  
4. জমা দেওয়ার আগে ভালোভাবে পরীক্ষা করুন  
5. খরচের অনুমান এবং প্রয়োজনীয়তা অন্তর্ভুক্ত করুন  

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

**প্রো টিপ**: আপনার প্রযুক্তি স্ট্যাকের সাথে মিলে যায় এমন সবচেয়ে সহজ উদাহরণ দিয়ে শুরু করুন, তারপর ধীরে ধীরে আরও জটিল পরিস্থিতিতে যান। প্রতিটি উদাহরণ পূর্ববর্তী উদাহরণের ধারণার উপর ভিত্তি করে তৈরি।  

**পরবর্তী পদক্ষেপ**:  
- আপনার দক্ষতার স্তরের সাথে মিলে যায় এমন একটি উদাহরণ নির্বাচন করুন  
- উদাহরণের README-তে দেওয়া সেটআপ নির্দেশনা অনুসরণ করুন  
- কাস্টমাইজেশন নিয়ে পরীক্ষা করুন  
- আপনার শেখার অভিজ্ঞতা কমিউনিটির সাথে শেয়ার করুন  

---

**নেভিগেশন**  
- **পূর্ববর্তী পাঠ**: [স্টাডি গাইড](../resources/study-guide.md)  
- **ফিরে যান**: [প্রধান README](../README.md)  

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিক অনুবাদ প্রদানের চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
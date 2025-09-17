<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T19:14:42+00:00",
  "source_file": "README.md",
  "language_code": "bn"
}
-->
# AZD নবাগতদের জন্য: একটি গঠিত শিক্ষার যাত্রা

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.bn.png) 

## এই কোর্স শুরু করার জন্য

আপনার AZD শেখার যাত্রা শুরু করতে নিচের ধাপগুলো অনুসরণ করুন:

1. **রিপোজিটরি ফর্ক করুন**: ক্লিক করুন [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **রিপোজিটরি ক্লোন করুন**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **কমিউনিটিতে যোগ দিন**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) থেকে বিশেষজ্ঞদের সহায়তা পান
4. **আপনার শেখার পথ নির্বাচন করুন**: নিচের অধ্যায়গুলো থেকে আপনার অভিজ্ঞতার স্তর অনুযায়ী অধ্যায় বেছে নিন

### বহু-ভাষার সমর্থন

#### স্বয়ংক্রিয় অনুবাদ (সবসময় আপডেট থাকে)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](./README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## কোর্সের সংক্ষিপ্ত বিবরণ

Azure Developer CLI (azd) শিখুন গঠিত অধ্যায়গুলোর মাধ্যমে যা ধাপে ধাপে শেখার জন্য ডিজাইন করা হয়েছে। **বিশেষভাবে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টে Azure AI Foundry ইন্টিগ্রেশনের উপর জোর দেওয়া হয়েছে।**

### কেন এই কোর্স আধুনিক ডেভেলপারদের জন্য গুরুত্বপূর্ণ

Azure AI Foundry Discord কমিউনিটির তথ্য অনুযায়ী, **৪৫% ডেভেলপার AZD ব্যবহার করতে চান AI ওয়ার্কলোডের জন্য**, কিন্তু তারা নিম্নলিখিত চ্যালেঞ্জগুলোর সম্মুখীন হন:
- জটিল মাল্টি-সার্ভিস AI আর্কিটেকচার
- প্রোডাকশন AI ডিপ্লয়মেন্টের সেরা পদ্ধতি  
- Azure AI সার্ভিস ইন্টিগ্রেশন এবং কনফিগারেশন
- AI ওয়ার্কলোডের জন্য খরচ অপ্টিমাইজেশন
- AI-নির্দিষ্ট ডিপ্লয়মেন্ট সমস্যার সমাধান

### শেখার লক্ষ্যসমূহ

এই গঠিত কোর্স সম্পন্ন করার মাধ্যমে আপনি:
- **AZD এর মৌলিক বিষয়গুলো শিখবেন**: মূল ধারণা, ইনস্টলেশন এবং কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডিপ্লয় করবেন**: AZD ব্যবহার করে Azure AI Foundry সার্ভিসের সাথে
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড প্রয়োগ করবেন**: Bicep টেমপ্লেট ব্যবহার করে Azure রিসোর্স ম্যানেজ করবেন
- **ডিপ্লয়মেন্ট সমস্যা সমাধান করবেন**: সাধারণ সমস্যাগুলো সমাধান এবং ডিবাগ করবেন
- **প্রোডাকশনের জন্য অপ্টিমাইজ করবেন**: সিকিউরিটি, স্কেলিং, মনিটরিং এবং খরচ ব্যবস্থাপনা
- **মাল্টি-এজেন্ট সলিউশন তৈরি করবেন**: জটিল AI আর্কিটেকচার ডিপ্লয় করবেন

## 📚 শেখার অধ্যায়সমূহ

*আপনার অভিজ্ঞতার স্তর এবং লক্ষ্য অনুযায়ী শেখার পথ নির্বাচন করুন*

### 🚀 অধ্যায় ১: ভিত্তি ও দ্রুত শুরু
**প্রয়োজনীয়তা**: Azure সাবস্ক্রিপশন, বেসিক কমান্ড লাইন জ্ঞান  
**সময়কাল**: ৩০-৪৫ মিনিট  
**জটিলতা**: ⭐

#### আপনি যা শিখবেন
- Azure Developer CLI এর মৌলিক বিষয়গুলো বোঝা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- প্রথম সফল ডিপ্লয়মেন্ট

#### শেখার উপকরণ
- **🎯 এখানে শুরু করুন**: [Azure Developer CLI কী?](../..)
- **📖 তত্ত্ব**: [AZD Basics](docs/getting-started/azd-basics.md) - মূল ধারণা এবং পরিভাষা
- **⚙️ সেটআপ**: [ইনস্টলেশন ও সেটআপ](docs/getting-started/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট গাইড
- **🛠️ হাতে-কলমে কাজ**: [আপনার প্রথম প্রকল্প](docs/getting-started/first-project.md) - ধাপে ধাপে টিউটোরিয়াল
- **📋 দ্রুত রেফারেন্স**: [কমান্ড চিট শিট](resources/cheat-sheet.md)

#### ব্যবহারিক অনুশীলন
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 অধ্যায়ের ফলাফল**: AZD ব্যবহার করে একটি সাধারণ ওয়েব অ্যাপ্লিকেশন সফলভাবে Azure-এ ডিপ্লয় করুন

---

### 🤖 অধ্যায় ২: AI-প্রথম ডেভেলপমেন্ট (AI ডেভেলপারদের জন্য সুপারিশকৃত)
**প্রয়োজনীয়তা**: অধ্যায় ১ সম্পন্ন  
**সময়কাল**: ১-২ ঘণ্টা  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- AZD এর সাথে Azure AI Foundry ইন্টিগ্রেশন
- AI-চালিত অ্যাপ্লিকেশন ডিপ্লয় করা
- AI সার্ভিস কনফিগারেশন বোঝা

#### শেখার উপকরণ
- **🎯 এখানে শুরু করুন**: [Azure AI Foundry ইন্টিগ্রেশন](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 প্যাটার্ন**: [AI মডেল ডিপ্লয়মেন্ট](docs/ai-foundry/ai-model-deployment.md) - AI মডেল ডিপ্লয় এবং ম্যানেজ করা
- **🛠️ ওয়ার্কশপ**: [AI ওয়ার্কশপ ল্যাব](docs/ai-foundry/ai-workshop-lab.md) - আপনার AI সলিউশনগুলো AZD-রেডি করুন
- **📋 টেমপ্লেট**: [Azure AI Foundry টেমপ্লেট](../..)

#### ব্যবহারিক অনুশীলন
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 অধ্যায়ের ফলাফল**: RAG ক্ষমতা সহ একটি AI-চালিত চ্যাট অ্যাপ্লিকেশন ডিপ্লয় এবং কনফিগার করুন

---

### ⚙️ অধ্যায় ৩: কনফিগারেশন ও অথেন্টিকেশন
**প্রয়োজনীয়তা**: অধ্যায় ১ সম্পন্ন  
**সময়কাল**: ৪৫-৬০ মিনিট  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- পরিবেশ কনফিগারেশন এবং ব্যবস্থাপনা
- অথেন্টিকেশন এবং সিকিউরিটির সেরা পদ্ধতি
- রিসোর্স নামকরণ এবং সংগঠন

#### শেখার উপকরণ
- **📖 কনফিগারেশন**: [কনফিগারেশন গাইড](docs/getting-started/configuration.md) - পরিবেশ সেটআপ
- **🔐 সিকিউরিটি**: অথেন্টিকেশন প্যাটার্ন এবং ম্যানেজড আইডেন্টিটি
- **📝 উদাহরণ**: [ডাটাবেস অ্যাপ উদাহরণ](../../examples/database-app) - কনফিগারেশন প্যাটার্ন

#### ব্যবহারিক অনুশীলন
- একাধিক পরিবেশ (ডেভ, স্টেজিং, প্রোড) কনফিগার করুন
- ম্যানেজড আইডেন্টিটি অথেন্টিকেশন সেটআপ করুন
- পরিবেশ-নির্দিষ্ট কনফিগারেশন প্রয়োগ করুন

**💡 অধ্যায়ের ফলাফল**: সঠিক অথেন্টিকেশন এবং সিকিউরিটি সহ একাধিক পরিবেশ পরিচালনা করুন

---

### 🏗️ অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট
**প্রয়োজনীয়তা**: অধ্যায় ১-৩ সম্পন্ন  
**সময়কাল**: ১-১.৫ ঘণ্টা  
**জটিলতা**: ⭐⭐⭐

#### আপনি যা শিখবেন
- উন্নত ডিপ্লয়মেন্ট প্যাটার্ন
- Bicep ব্যবহার করে ইনফ্রাস্ট্রাকচার অ্যাজ কোড
- রিসোর্স প্রোভিশনিং কৌশল

#### শেখার উপকরণ
- **📖 ডিপ্লয়মেন্ট**: [ডিপ্লয়মেন্ট গাইড](docs/deployment/deployment-guide.md) - সম্পূর্ণ ওয়ার্কফ্লো
- **🏗️ প্রোভিশনিং**: [রিসোর্স প্রোভিশনিং](docs/deployment/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 উদাহরণ**: [কন্টেইনার অ্যাপ উদাহরণ](../../examples/container-app) - কন্টেইনারাইজড ডিপ্লয়মেন্ট

#### ব্যবহারিক অনুশীলন
- কাস্টম Bicep টেমপ্লেট তৈরি করুন
- মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন
- ব্লু-গ্রিন ডিপ্লয়মেন্ট কৌশল প্রয়োগ করুন

**💡 অধ্যায়ের ফলাফল**: কাস্টম ইনফ্রাস্ট্রাকচার টেমপ্লেট ব্যবহার করে জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন

---

### 🎯 অধ্যায় ৫: মাল্টি-এজেন্ট AI সলিউশন (উন্নত)
**প্রয়োজনীয়তা**: অধ্যায় ১-২ সম্পন্ন  
**সময়কাল**: ২-৩ ঘণ্টা  
**জটিলতা**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্ন
- এজেন্ট অর্কেস্ট্রেশন এবং সমন্বয়
- প্রোডাকশন-রেডি AI ডিপ্লয়মেন্ট

#### শেখার উপকরণ
- **🤖 ফিচারড প্রজেক্ট**: [রিটেইল মাল্টি-এজেন্ট সলিউশন](examples/retail-scenario.md) - সম্পূর্ণ ইমপ্লিমেন্টেশন
- **🛠️ ARM টেমপ্লেট**: [ARM টেমপ্লেট প্যাকেজ](../../examples/retail-multiagent-arm-template) - এক-ক্লিক ডিপ্লয়মেন্ট
- **📖 আর্কিটেকচার**: মাল্টি-এজেন্ট সমন্বয় প্যাটার্ন

#### ব্যবহারিক অনুশীলন
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 অধ্যায়ের ফলাফল**: কাস্টমার এবং ইনভেন্টরি এজেন্ট সহ একটি প্রোডাকশন-রেডি মাল্টি-এজেন্ট AI সলিউশন ডিপ্লয় এবং পরিচালনা করুন

---

### 🔍 অধ্যায় ৬: প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন ও পরিকল্পনা
**প্রয়োজনীয়তা**: অধ্যায় ৪ সম্পন্ন  
**সময়কাল**: ১ ঘণ্টা  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- ক্যাপাসিটি পরিকল্পনা এবং রিসোর্স ভ্যালিডেশন
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট চেক এবং অটোমেশন

#### শেখার উপকরণ
- **📊 পরিকল্পনা**: [ক্যাপাসিটি পরিকল্পনা](docs/pre-deployment/capacity-planning.md) - রিসোর্স ভ্যালিডেশন
- **💰 নির্বাচন**: [SKU নির্বাচন](docs/pre-deployment/sku-selection.md) - খরচ-সাশ্রয়ী পছন্দ
- **✅ ভ্যালিডেশন**: [প্রি-ফ্লাইট চেক](docs/pre-deployment/preflight-checks.md) - অটোমেটেড স্ক্রিপ্ট

#### ব্যবহারিক অনুশীলন
- ক্যাপাসিটি ভ্যালিডেশন স্ক্রিপ্ট চালান
- খরচ অপ্টিমাইজেশনের জন্য SKU নির্বাচন করুন
- অটোমেটেড প্রি-ডিপ্লয়মেন্ট চেক প্রয়োগ করুন

**💡 অধ্যায়ের ফলাফল**: ডিপ্লয়মেন্টের আগে ভ্যালিডেট এবং অপ্টিমাইজ করুন

---

### 🚨 অধ্যায় ৭: সমস্যা সমাধান ও ডিবাগিং
**প্রয়োজনীয়তা**: যেকোনো ডিপ্লয়মেন্ট অধ্যায় সম্পন্ন  
**সময়কাল**: ১-১.৫ ঘণ্টা  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- পদ্ধতিগত ডিবাগিং পদ্ধতি
- সাধারণ সমস্যা এবং সমাধান
- AI-নির্দিষ্ট সমস্যা সমাধান

#### শেখার উপকরণ
- **🔧 সাধারণ সমস্যা**: [সাধারণ সমস্যা](docs/troubleshooting/common-issues.md) - FAQ এবং সমাধান
- **🕵️ ডিবাগিং**: [ডিবাগিং গাইড](docs/troubleshooting/debugging.md) - ধাপে ধাপে কৌশল
- **🤖 AI সমস্যা**: [AI-নির্দিষ্ট সমস্যা সমাধান](docs/troubleshooting/ai-troubleshooting.md) - AI সার্ভিস সমস্যা

#### ব্যবহারিক অনুশীলন
- ডিপ্লয়মেন্ট ব্যর্থতার কারণ নির্ণয় করুন
- অথেন্টিকেশন সমস্যা সমাধান করুন
- AI সার্ভিস সংযোগ সমস্যা ডিবাগ করুন

**💡 অধ্যায়ের ফলাফল**: সাধারণ ডিপ্লয়মেন্ট সমস্যাগুলো স্বাধীনভাবে নির্ণয় এবং সমাধান করুন

---

### 🏢 অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন
**প্রয়োজনীয়তা**: অধ্যায় ১-৪ সম্পন্ন  
**সময়কাল**: ২-৩ ঘণ্টা  
**জটিলতা**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- প্রোডাকশন ডিপ্লয়মেন্ট কৌশল
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন
- মনিটরিং এবং খরচ অপ্টিমাইজেশন

#### শেখার উপকরণ
- **🏭 প্রোডাকশন**: [প্রোডাকশন AI সেরা পদ্ধতি](docs/ai-foundry/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্ন
- **📝 উদাহরণ**: [মাইক্রোসার্ভিস উদাহরণ](../../examples/microservices) - জটিল আর্কিটেকচার
- **📊 পর্যবেক্ষণ**: অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

#### ব্যবহারিক অনুশীলন
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন বাস্তবায়ন করুন
- বিস্তৃত পর্যবেক্ষণ সেট আপ করুন
- সঠিক শাসন সহ প্রোডাকশনে ডিপ্লয় করুন

**💡 অধ্যায়ের ফলাফল**: সম্পূর্ণ প্রোডাকশন সক্ষমতা সহ এন্টারপ্রাইজ-প্রস্তুত অ্যাপ্লিকেশন ডিপ্লয় করুন

---

## 📖 Azure Developer CLI কী?

Azure Developer CLI (azd) একটি ডেভেলপার-কেন্দ্রিক কমান্ড-লাইন ইন্টারফেস যা Azure-এ অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করার প্রক্রিয়াকে ত্বরান্বিত করে। এটি প্রদান করে:

- **টেমপ্লেট-ভিত্তিক ডিপ্লয়মেন্ট** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নের জন্য প্রি-বিল্ট টেমপ্লেট ব্যবহার করুন
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড** - Bicep বা Terraform ব্যবহার করে Azure রিসোর্স পরিচালনা করুন  
- **ইন্টিগ্রেটেড ওয়ার্কফ্লো** - অ্যাপ্লিকেশন প্রভিশন, ডিপ্লয় এবং পর্যবেক্ষণ নির্বিঘ্নে করুন
- **ডেভেলপার-বন্ধুত্বপূর্ণ** - ডেভেলপার উৎপাদনশীলতা এবং অভিজ্ঞতার জন্য অপ্টিমাইজড

### **AZD + Azure AI Foundry: AI ডিপ্লয়মেন্টের জন্য আদর্শ**

**AI সমাধানের জন্য AZD কেন?** AZD AI ডেভেলপারদের মুখোমুখি হওয়া শীর্ষ চ্যালেঞ্জগুলির সমাধান করে:

- **AI-প্রস্তুত টেমপ্লেট** - Azure OpenAI, Cognitive Services এবং ML ওয়ার্কলোডের জন্য প্রি-কনফিগারড টেমপ্লেট
- **নিরাপদ AI ডিপ্লয়মেন্ট** - AI পরিষেবা, API কী এবং মডেল এন্ডপয়েন্টের জন্য বিল্ট-ইন সিকিউরিটি প্যাটার্ন  
- **প্রোডাকশন AI প্যাটার্ন** - স্কেলযোগ্য, খরচ-কার্যকর AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য সেরা অনুশীলন
- **এন্ড-টু-এন্ড AI ওয়ার্কফ্লো** - মডেল ডেভেলপমেন্ট থেকে প্রোডাকশন ডিপ্লয়মেন্ট পর্যন্ত সঠিক পর্যবেক্ষণ সহ
- **খরচ অপ্টিমাইজেশন** - AI ওয়ার্কলোডের জন্য স্মার্ট রিসোর্স বরাদ্দ এবং স্কেলিং কৌশল
- **Azure AI Foundry ইন্টিগ্রেশন** - AI Foundry মডেল ক্যাটালগ এবং এন্ডপয়েন্টের সাথে নির্বিঘ্ন সংযোগ

---

## 🎯 টেমপ্লেট এবং উদাহরণ লাইব্রেরি

### বৈশিষ্ট্যযুক্ত: Azure AI Foundry টেমপ্লেট
**AI অ্যাপ্লিকেশন ডিপ্লয় করতে এখানে শুরু করুন!**

| টেমপ্লেট | অধ্যায় | জটিলতা | পরিষেবা |
|----------|---------|------------|----------|
| [**AI চ্যাট দিয়ে শুরু করুন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ২ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI এজেন্ট দিয়ে শুরু করুন**](https://github.com/Azure-Samples/get-started-with-ai-agents) | অধ্যায় ২ | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**মাল্টি-এজেন্ট ওয়ার্কফ্লো অটোমেশন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৫ | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**আপনার ডেটা থেকে ডকুমেন্ট তৈরি করুন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৪ | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**ক্লায়েন্ট মিটিং উন্নত করুন এজেন্ট দিয়ে**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৫ | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**আপনার কোড আধুনিকায়ন করুন এজেন্ট দিয়ে**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৫ | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**আপনার কথোপকথন এজেন্ট তৈরি করুন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৪ | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**কথোপকথন ডেটা থেকে অন্তর্দৃষ্টি আনলক করুন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৮ | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**মাল্টি-মোডাল কন্টেন্ট প্রসেসিং**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ৮ | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### বৈশিষ্ট্যযুক্ত: সম্পূর্ণ শেখার দৃশ্যপট
**প্রোডাকশন-প্রস্তুত অ্যাপ্লিকেশন টেমপ্লেট শেখার অধ্যায়ের সাথে মিলিত**

| টেমপ্লেট | শেখার অধ্যায় | জটিলতা | মূল শেখা |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় ২ | ⭐ | মৌলিক AI ডিপ্লয়মেন্ট প্যাটার্ন |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় ২ | ⭐⭐ | RAG বাস্তবায়ন Azure AI Search সহ |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | অধ্যায় ৪ | ⭐⭐ | ডকুমেন্ট ইন্টেলিজেন্স ইন্টিগ্রেশন |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় ৫ | ⭐⭐⭐ | এজেন্ট ফ্রেমওয়ার্ক এবং ফাংশন কলিং |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় ৮ | ⭐⭐⭐ | এন্টারপ্রাইজ AI অর্কেস্ট্রেশন |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | অধ্যায় ৫ | ⭐⭐⭐⭐ | মাল্টি-এজেন্ট আর্কিটেকচার কাস্টমার এবং ইনভেন্টরি এজেন্ট সহ |

### উদাহরণ অনুযায়ী শেখা

#### সাধারণ অ্যাপ্লিকেশন (অধ্যায় ১-২)
- [Simple Web App](../../examples/simple-web-app) - মৌলিক ডিপ্লয়মেন্ট প্যাটার্ন
- [Static Website](../../examples/static-site) - স্ট্যাটিক কন্টেন্ট ডিপ্লয়মেন্ট
- [Basic API](../../examples/basic-api) - REST API ডিপ্লয়মেন্ট

#### ডাটাবেস ইন্টিগ্রেশন (অধ্যায় ৩-৪)  
- [Database App](../../examples/database-app) - ডাটাবেস সংযোগ প্যাটার্ন
- [Data Processing](../../examples/data-processing) - ETL ওয়ার্কফ্লো ডিপ্লয়মেন্ট

#### উন্নত প্যাটার্ন (অধ্যায় ৪-৮)
- [Container Apps](../../examples/container-app) - কন্টেইনারাইজড ডিপ্লয়মেন্ট
- [Microservices](../../examples/microservices) - মাল্টি-সার্ভিস আর্কিটেকচার  
- [Enterprise Solutions](../../examples/enterprise) - প্রোডাকশন-প্রস্তুত প্যাটার্ন

### বাহ্যিক টেমপ্লেট সংগ্রহ
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - অফিসিয়াল মাইক্রোসফট নমুনা
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - কমিউনিটি-অবদানকৃত টেমপ্লেট
- [**Examples Directory**](examples/README.md) - বিস্তারিত ব্যাখ্যা সহ স্থানীয় শেখার উদাহরণ

---

## 📚 শেখার সম্পদ এবং রেফারেন্স

### দ্রুত রেফারেন্স
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - অধ্যায় অনুযায়ী প্রয়োজনীয় azd কমান্ড
- [**Glossary**](resources/glossary.md) - Azure এবং azd পরিভাষা  
- [**FAQ**](resources/faq.md) - সাধারণ প্রশ্ন অধ্যায় অনুযায়ী সংগঠিত
- [**Study Guide**](resources/study-guide.md) - বিস্তৃত অনুশীলন অনুশীলন

### হাতে-কলমে কর্মশালা
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - আপনার AI সমাধানগুলি AZD-ডিপ্লয়যোগ্য করুন
- [**AZD For Beginners Workshop**](workshop/README.md) - সম্পূর্ণ হাতে-কলমে কর্মশালা উপকরণ

### বাহ্যিক শেখার সম্পদ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 কোর্স সম্পন্ন এবং সার্টিফিকেশন

### অগ্রগতি ট্র্যাকিং
প্রতিটি অধ্যায়ের মাধ্যমে আপনার শেখার অগ্রগতি ট্র্যাক করুন:

- [ ] **অধ্যায় ১**: ভিত্তি এবং দ্রুত শুরু ✅
- [ ] **অধ্যায় ২**: AI-প্রথম উন্নয়ন ✅  
- [ ] **অধ্যায় ৩**: কনফিগারেশন এবং প্রমাণীকরণ ✅
- [ ] **অধ্যায় ৪**: ইনফ্রাস্ট্রাকচার অ্যাজ কোড এবং ডিপ্লয়মেন্ট ✅
- [ ] **অধ্যায় ৫**: মাল্টি-এজেন্ট AI সমাধান ✅
- [ ] **অধ্যায় ৬**: প্রি-ডিপ্লয়মেন্ট যাচাইকরণ এবং পরিকল্পনা ✅
- [ ] **অধ্যায় ৭**: সমস্যা সমাধান এবং ডিবাগিং ✅
- [ ] **অধ্যায় ৮**: প্রোডাকশন এবং এন্টারপ্রাইজ প্যাটার্ন ✅

### শেখার যাচাইকরণ
প্রতিটি অধ্যায় সম্পন্ন করার পরে, আপনার জ্ঞান যাচাই করুন:
1. **ব্যবহারিক অনুশীলন**: অধ্যায়ের হাতে-কলমে ডিপ্লয়মেন্ট সম্পন্ন করুন
2. **জ্ঞান পরীক্ষা**: আপনার অধ্যায়ের FAQ বিভাগ পর্যালোচনা করুন
3. **কমিউনিটি আলোচনা**: Azure Discord-এ আপনার অভিজ্ঞতা শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরবর্তী জটিলতার স্তরে যান

### কোর্স সম্পন্ন করার সুবিধা
সমস্ত অধ্যায় সম্পন্ন করার পরে, আপনি পাবেন:
- **প্রোডাকশন অভিজ্ঞতা**: Azure-এ বাস্তব AI অ্যাপ্লিকেশন ডিপ্লয় করেছেন
- **পেশাদার দক্ষতা**: এন্টারপ্রাইজ-প্রস্তুত ডিপ্লয়মেন্ট সক্ষমতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার অগ্রগতি**: চাহিদাপূর্ণ AZD এবং AI ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি এবং সহায়তা

### সাহায্য এবং সহায়তা পান
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট করুন এবং বৈশিষ্ট্য অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)
- **শেখার প্রশ্ন**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-নির্দিষ্ট সাহায্য**: AZD + AI Foundry আলোচনার জন্য [#Azure চ্যানেলে যোগ দিন](https://discord.gg/microsoft-azure)
- **ডকুমেন্টেশন**: [অফিসিয়াল Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**#Azure চ্যানেলের সাম্প্রতিক জরিপ ফলাফল:**
- **৪৫%** ডেভেলপাররা AI ওয়ার্কলোডের জন্য AZD ব্যবহার করতে চান
- **শীর্ষ চ্যালেঞ্জ**: মাল্টি-সার্ভিস ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ম্যানেজমেন্ট, প্রোডাকশন প্রস্তুতি  
- **সবচেয়ে অনুরোধকৃত**: AI-নির্দিষ্ট টেমপ্লেট, সমস্যা সমাধানের গাইড, সেরা অনুশীলন

**আমাদের কমিউনিটিতে যোগ দিন:**
- আপনার AZD + AI অভিজ্ঞতা শেয়ার করুন এবং সাহায্য পান
- নতুন AI টেমপ্লেটের প্রাথমিক প্রিভিউ অ্যাক্সেস করুন
- AI ডিপ্লয়মেন্ট সেরা অনুশীলনে অবদান রাখুন
- ভবিষ্যতের AI + AZD বৈশিষ্ট্য উন্নয়নে প্রভাব ফেলুন

### কোর্সে অবদান রাখা
আমরা অবদানকে স্বাগত জানাই! বিস্তারিত জানার জন্য আমাদের [Contributing Guide](CONTRIBUTING.md) পড়ুন:
- **কন্টেন্ট উন্নতি**: বিদ্যমান অধ্যায় এবং উদাহরণ উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব-জীবনের দৃশ্যপট এবং টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহু-ভাষা সমর্থন বজায় রাখতে সাহায্য করুন
- **বাগ রিপোর্ট**: সঠিকতা এবং স্পষ্টতা উন্নত করুন
- **কমিউনিটি স্ট্যান্ডার্ড**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি নির্দেশিকা অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্পটি MIT লাইসেন্সের অধীনে লাইসেন্সকৃত - বিস্তারিত জানার জন্য [LICENSE](../../LICENSE) ফাইল দেখুন।

### সম্পর্কিত Microsoft শেখার সম্পদ

আমাদের দল অন্যান্য বিস্তৃত শেখার কোর্স তৈরি করে:

- [**NEW** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ কোর্স নেভিগেশন

**🚀 শেখা শুরু করতে প্রস্তুত?**

**শুরুর জন্য**: [অধ্যায় ১: ভিত্তি এবং দ্রুত শুরু](../..)  
**AI ডেভেলপারদের জন্য**: [অধ্যায় ২: AI-প্রথম উন্নয়ন](../..)
**অভিজ্ঞ ডেভেলপারগণ**: [অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ](../..) থেকে শুরু করুন

**পরবর্তী পদক্ষেপ**: [অধ্যায় ১ - AZD বেসিকস শুরু করুন](docs/getting-started/azd-basics.md) →

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
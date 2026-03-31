# AZD নবীনদের জন্য: একটি কাঠামোবদ্ধ শেখার যাত্রা

![AZD-শুরুকারীদের](../../translated_images/bn/azdbeginners.5527441dd9f74068.webp) 

[![GitHub পর্যবেক্ষক](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub তারকা](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure ডিসকর্ড](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry ডিসকর্ড](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### স্বয়ংক্রিয় অনুবাদ (সবসময় হালনাগাদ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[আরবি](../ar/README.md) | [বাংলা](./README.md) | [বুলগেরিয়ান](../bg/README.md) | [বর্মিজ (মায়ানমার)](../my/README.md) | [চীনা (সরলীকৃত)](../zh-CN/README.md) | [চীনা (প্রচলিত, হংকং)](../zh-HK/README.md) | [চীনা (প্রচলিত, ম্যাকাও)](../zh-MO/README.md) | [চীনা (প্রচলিত, তাইওয়ান)](../zh-TW/README.md) | [ক্রোয়েশিয়ান](../hr/README.md) | [চেক](../cs/README.md) | [ড্যানিশ](../da/README.md) | [ডাচ](../nl/README.md) | [এস্তোনীয়](../et/README.md) | [ফিনিশ](../fi/README.md) | [ফরাসি](../fr/README.md) | [জার্মান](../de/README.md) | [গ্রিক](../el/README.md) | [হিব্রু](../he/README.md) | [হিন্দি](../hi/README.md) | [হাঙ্গেরিয়ান](../hu/README.md) | [ইন্দোনেশীয়](../id/README.md) | [ইতালিয়ান](../it/README.md) | [জাপানি](../ja/README.md) | [কন্নড়](../kn/README.md) | [কোরিয়ান](../ko/README.md) | [লিথুয়ানিয়ান](../lt/README.md) | [মালয়](../ms/README.md) | [মালায়ালম](../ml/README.md) | [মরাঠি](../mr/README.md) | [নেপালি](../ne/README.md) | [নাইজেরিয়ান পিজিন](../pcm/README.md) | [নরওয়েজিয়ান](../no/README.md) | [পার্সি (ফার্সি)](../fa/README.md) | [পোলিশ](../pl/README.md) | [পোর্টুগীজ (ব্রাজিল)](../pt-BR/README.md) | [পোর্টুগীজ (পর্তুগাল)](../pt-PT/README.md) | [পাঞ্জাবি (গুরমুখী)](../pa/README.md) | [রোমানিয়ান](../ro/README.md) | [রাশিয়ান](../ru/README.md) | [সার্বিয়ান (সিরিলিক)](../sr/README.md) | [স্লোভ্যাক](../sk/README.md) | [স্লোভেনীয়](../sl/README.md) | [স্প্যানিশ](../es/README.md) | [সাওহিলি](../sw/README.md) | [সুইডিশ](../sv/README.md) | [তাগালগ (ফিলিপিনো)](../tl/README.md) | [তামিল](../ta/README.md) | [তেলুগু](../te/README.md) | [থাই](../th/README.md) | [তুর্কি](../tr/README.md) | [ইউক্রেনীয়](../uk/README.md) | [উর্দু](../ur/README.md) | [ভিয়েতনামী](../vi/README.md)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রিপোজিটরি-তে ৫০+ ভাষার অনুবাদ আছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বৃদ্ধি করে। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> এটি আপনাকে দ্রুত ডাউনলোডে কোর্স সম্পন্ন করার জন্য সবকিছু দেবে।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 আজ azd-এ কী নতুন

Azure Developer CLI এখন ঐতিহ্যবাহী ওয়েব অ্যাপ ও API-র বাইরে বেড়ে গেছে। আজ, azd হচ্ছে একক টুল যা Azure-এ যে কোনো অ্যাপ্লিকেশন ডিপ্লয় করতে ব্যবহার করা যায়—এতে AI-চালিত অ্যাপ্লিকেশন এবং ইন্টেলিজেন্ট এজেন্টও অন্তর্ভুক্ত।

এটার অর্থ আপনার জন্য কী:

- **AI এজেন্ট এখন প্রথম-শ্রেণির azd ওয়ার্কলোড।** আপনি একই `azd init` → `azd up` ওয়ার্কফ্লো ব্যবহার করে AI এজেন্ট প্রকল্প আরম্ভ, ডিপ্লয় এবং পরিচালনা করতে পারবেন।
- **Microsoft Foundry ইন্টিগ্রেশন** টেমপ্লেট ইকোসিস্টেমে মডেল ডিপ্লয়মেন্ট, এজেন্ট হোস্টিং, এবং AI সার্ভিস কনফিগারেশন সরাসরি নিয়ে আসে।
- **কোর ওয়ার্কফ্লো পরিবর্তন হয়নি।** আপনি যদি একটি টুডো অ্যাপ, একটি মাইক্রোসার্ভিস, অথবা একটি মাল্টি-এজেন্ট AI সমাধান ডিপ্লয় করছিলেন, কমান্ডগুলো একই থাকবে।

আপনি যদি আগে থেকে azd ব্যবহার করে থাকেন, AI সাপোর্ট একটি স্বাভাবিক সম্প্রসারণ—একটি আলাদা টুল বা উন্নত ট্র্যাক নয়। যদি আপনি নতুন শুরু করেন, আপনি একটি ওয়ার্কফ্লো শিখবেন যা সবকিছুর জন্য কাজ করে।

---

## 🚀 Azure Developer CLI (azd) কি?

**Azure Developer CLI (azd)** হলো ডেভেলপার-বান্ধব কমান্ড-লাইন টুল যা Azure-এ অ্যাপ্লিকেশন ডিপ্লয় করা সহজ করে তোলে। অনেকগুলো Azure রিসোর্স ম্যানুয়ালি তৈরি ও সংযুক্ত করার বদলে, আপনি একটি কমান্ডে পুরো অ্যাপ্লিকেশনগুলি ডিপ্লয় করতে পারেন।

### `azd up`এর জাদু

```bash
# এই একক কমান্ডটি সব কিছু করে:
# ✅ সমস্ত Azure রিসোর্স তৈরি করে
# ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
# ✅ আপনার অ্যাপ্লিকেশন কোড তৈরি করে
# ✅ Azure এ ডিপ্লয় করে
# ✅ আপনাকে একটি কাজের URL দেয়
azd up
```

**এটুকুই!** Azure Portal-এ ক্লিক করার দরকার নেই, কোনো জটিল ARM টেমপ্লেট আগে শিখতে হবে না, কোনো ম্যানুয়াল কনফিগারেশন নেই — শুধু কাজ করা অ্যাপগুলি Azure-এ।

---

## ❓ Azure Developer CLI বনাম Azure CLI: পার্থক্য কি?

এটাই নবীনদের সবচেয়ে সাধারণ প্রশ্ন। সহজ উত্তর এখানে:

| বৈশিষ্ট্য | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **উদ্দেশ্য** | একক Azure রিসোর্স পরিচালনা করা | সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয় করা |
| **দৃষ্টিভঙ্গি** | ইনফ্রাস্ট্রাকচার-কেন্দ্রিক | অ্যাপ্লিকেশন-কেন্দ্রিক |
| **উদাহরণ** | `az webapp create --name myapp...` | `azd up` |
| **শিখনের বাঁক** | Azure সার্ভিস সম্পর্কে জানতে হবে | শুধুমাত্র আপনার অ্যাপ জানলেই হবে |
| **সেরা জন্য** | DevOps, ইনফ্রাস্ট্রাকচার | ডেভেলপার, প্রোটোটাইপিং |

### সহজ উপমা

- **Azure CLI** এমনটি, যেন আপনার কাছে বাড়ি তৈরির সব সরঞ্জাম আছে — হাতুড়ি, করাত, পেরেক। আপনি যেকোনো কিছু তৈরি করতে পারবেন, তবে আপনাকে নির্মাণ জানতে হবে।
- **Azure Developer CLI** এমনটি, যেন আপনি একজন কন্ট্রাক্টর নিযুক্ত করেছেন — আপনি যা চান তা বর্ণনা করেন, এবং তারা নির্মাণের কাজ সামলে নেয়।

### কখন কোনটি ব্যবহার করবেন

| পরিস্থিতি | এটি ব্যবহার করুন |
|----------|----------|
| "আমি দ্রুত আমার ওয়েব অ্যাপ ডিপ্লয় করতে চাই" | `azd up` |
| "আমি শুধু একটি স্টোরেজ অ্যাকাউন্ট তৈরি করতে চাই" | `az storage account create` |
| "আমি একটি পূর্ণাঙ্গ AI অ্যাপ্লিকেশন তৈরি করছি" | `azd init --template azure-search-openai-demo` |
| "আমি একটি নির্দিষ্ট Azure রিসোর্স ডিবাগ করতে চাই" | `az resource show` |
| "আমি মিনিটের মধ্যে প্রোডাকশন-রেডি ডিপ্লয়মেন্ট চাই" | `azd up --environment production` |

### তারা একসঙ্গে কাজ করে!

AZD আড়ালের দিকে Azure CLI ব্যবহার করে। আপনি দুটোকেই ব্যবহার করতে পারেন:
```bash
# AZD দিয়ে আপনার অ্যাপ ডিপ্লয় করুন
azd up

# তারপর Azure CLI দিয়ে নির্দিষ্ট রিসোর্সগুলি সূক্ষ্মসাজান করুন
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-এ টেমপ্লেটগুলি খুঁজুন

শূন্য থেকে শুরু করবেন না! **Awesome AZD** হলো কমিউনিটি সংগ্রহ যেখানে রেডি-টু-ডিপ্লয় টেমপ্লেট রয়েছে:

| রিসোর্স | বর্ণনা |
|----------|-------------|
| 🔗 [**Awesome AZD গ্যালারি**](https://azure.github.io/awesome-azd/) | এক-ক্লিকে ডিপ্লয় করার জন্য 200+ টেমপ্লেট ব্রাউজ করুন |
| 🔗 [**একটি টেমপ্লেট জমা দিন**](https://github.com/Azure/awesome-azd/issues) | আপনার নিজস্ব টেমপ্লেট কমিউনিটিতে অবদান রাখুন |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | সোর্সকে স্টার করুন এবং অন্বেষণ করুন |

### Awesome AZD থেকে জনপ্রিয় AI টেমপ্লেট

```bash
# মাইক্রোসফট ফাউন্ড্রি মডেল এবং AI সার্চ সহ RAG চ্যাট
azd init --template azure-search-openai-demo

# দ্রুত AI চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart

# ফাউন্ড্রি এজেন্টদের সঙ্গে AI এজেন্টস
azd init --template get-started-with-ai-agents
```

---

## 🎯 ৩ ধাপে শুরু করা

### ধাপ ১: AZD ইনস্টল করুন (২ মিনিট)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ধাপ ২: Azure-এ লগইন করুন

```bash
azd auth login
```

### ধাপ ৩: আপনার প্রথম অ্যাপ ডিপ্লয় করুন

```bash
# একটি টেমপ্লেট থেকে আরম্ভ করুন
azd init --template todo-nodejs-mongo

# আজুরে মোতায়েন করুন (সবকিছু তৈরি করে!)
azd up
```

**🎉 এটুকুই!** আপনার অ্যাপ এখন Azure-এ লাইভ।

### পরিষ্কার করুন (ভুলবেন না!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 কিভাবে এই কোর্সটি ব্যবহার করবেন

এই কোর্সটি **প্রগতিশীল শিক্ষার** জন্য ডিজাইন করা হয়েছে - যেখানে আপনি স্বাচ্ছন্দ্যবোধ করেন সেখান থেকে শুরু করুন এবং ধাপে ধাপে উপরে উঠুন:

| আপনার অভিজ্ঞতা | এখান থেকে শুরু করুন |
|-----------------|------------|
| **Azure-এ সম্পূর্ণ নতুন** | [অধ্যায় ১: ভিত্তি](#-chapter-1-foundation--quick-start) |
| **Azure জানেন, AZD নতুন** | [অধ্যায় ১: ভিত্তি](#-chapter-1-foundation--quick-start) |
| **AI অ্যাপ ডিপ্লয় করতে চান** | [অধ্যায় ২: AI-প্রথম উন্নয়ন](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **হ্যান্ডস-অন অনুশীলন চান** | [🎓 ইন্টারেক্টিভ ওয়ার্কশপ](workshop/README.md) - ৩-৪ ঘণ্টার নির্দেশিত ল্যাব |
| **প্রোডাকশন প্যাটার্নস দরকার** | [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ](#-chapter-8-production--enterprise-patterns) |

### দ্রুত সেটআপ

1. **এই রিপোজিটরি ফর্ক করুন**: [![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ক্লোন করুন**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **সহায়তা নিন**: [Azure Discord কমিউনিটি](https://discord.com/invite/ByRwuEEgH4)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রিপোজিটরি-তে ৫০+ ভাষার অনুবাদ আছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বৃদ্ধি করে। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> এটি আপনাকে দ্রুত ডাউনলোডে কোর্স সম্পন্ন করার জন্য সবকিছু দেবে।


## কোর্স ওভারভিউ

স্ট্রাকচার্ড অধ্যায়গুলোর মাধ্যমে Azure Developer CLI (azd) আয়ত্ত করুন যা প্রগতিশীল শিক্ষার জন্য ডিজাইন করা। **Microsoft Foundry ইন্টিগ্রেশনের সাথে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টে বিশেষ ফোকাস।**

### আধুনিক ডেভেলপারদের জন্য এই কোর্স কেন অপরিহার্য

Microsoft Foundry Discord কমিউনিটি অন্তর্দৃষ্টির উপর ভিত্তি করে, **৪৫% ডেভেলপার AZD-কে AI ওয়ার্কলোডের জন্য ব্যবহার করতে চান** কিন্তু নিম্নলিখিত চ্যালেঞ্জগুলোর সম্মুখীন হন:
- জটিল বহু-সার্ভিস AI আর্কিটেকচার
- প্রোডাকশন AI ডিপ্লয়মেন্ট বেস্ট প্র্যাকটিস  
- Azure AI সার্ভিস ইন্টিগ্রেশন এবং কনফিগারেশন
- AI ওয়ার্কলোডের জন্য খরচ অপ্টিমাইজেশন
- AI-নির্দিষ্ট ডিপ্লয়মেন্ট সমস্যাগুলি ট্রাবলশুট করা

### শেখার লক্ষ্য

এই স্ট্রাকচারড কোর্সটি সম্পন্ন করার মাধ্যমে আপনি:
- **AZD মৌলিক বিষয়ে দক্ষতা অর্জন করবেন**: কোর ধারণা, ইনস্টলেশন, এবং কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডিপ্লয় করবেন**: Microsoft Foundry সার্ভিসগুলোর সাথে AZD ব্যবহার করুন
- **Infrastructure as Code বাস্তবায়ন করবেন**: Bicep টেমপ্লেট দিয়ে Azure রিসোর্স পরিচালনা করুন
- **ডিপ্লয়মেন্ট ট্রাবলশুট করবেন**: সাধারণ সমস্যা সমাধান এবং ডিবাগিং
- **প্রোডাকশনের জন্য অপ্টিমাইজ করবেন**: সিকিউরিটি, স্কেলিং, মনিটরিং, এবং খরচ ব্যবস্থাপনা
- **মাল্টি-এজেন্ট সমাধান তৈরি করবেন**: জটিল AI আর্কিটেকচার ডিপ্লয় করুন

## 🗺️ কোর্স মানচিত্র: অধ্যায় অনুযায়ী দ্রুত নেভিগেশন

প্রতিটি অধ্যায়ের জন্য একটি ডেডিকেটেড README রয়েছে যাতে শেখার উদ্দেশ্য, দ্রুত শুরু নির্দেশ, এবং অনুশীলন আছে:

| অধ্যায় | বিষয় | পাঠ | সময়কাল | জটিলতা |
|---------|-------|---------|----------|------------|
| **[অধ্যায় ১: ভিত্তি](docs/chapter-01-foundation/README.md)** | শুরু করা | [AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) &#124; [ইনস্টলেশন](docs/chapter-01-foundation/installation.md) &#124; [প্রথম প্রকল্প](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[চ্যাপ্টার 2: এআই উন্নয়ন](docs/chapter-02-ai-development/README.md)** | এআই-প্রাথমিক অ্যাপস | [Foundry একত্রীকরণ](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [এআই এজেন্টস](docs/chapter-02-ai-development/agents.md) &#124; [মডেল স্থাপন](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ওয়ার্কশপ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[চ্যাপ্টার 3: কনফিগারেশন](docs/chapter-03-configuration/README.md)** | অথ্‌ ও সিকিউরিটি | [কনফিগারেশন](docs/chapter-03-configuration/configuration.md) &#124; [অথ্‌ ও সিকিউরিটি](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[চ্যাপ্টার 4: ইনফ্রাস্ট্রাকচার](docs/chapter-04-infrastructure/README.md)** | IaC & ডিপ্লয়মেন্ট | [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [প্রোভিশনিং](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[চ্যাপ্টার 5: মাল্টি-এজেন্ট](docs/chapter-05-multi-agent/README.md)** | এআই এজেন্ট সলিউশনস | [রিটেইল সিনারিও](examples/retail-scenario.md) &#124; [সমন্বয় প্যাটার্নস](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[চ্যাপ্টার 6: প্রি-ডিপ্লয়মেন্ট](docs/chapter-06-pre-deployment/README.md)** | পরিকল্পনা ও যাচাইকরণ | [প্রিফ্লাইট চেকস](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ক্যাপাসিটি প্ল্যানিং](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU নির্বাচন](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [অ্যাপ ইনসাইটস](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[চ্যাপ্টার 7: ট্রাবলশুটিং](docs/chapter-07-troubleshooting/README.md)** | ডিবাগ ও ফিক্স | [কমন ইস্যুজ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md) &#124; [এআই ইস্যুজ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[চ্যাপ্টার 8: প্রোডাকশন](docs/chapter-08-production/README.md)** | এন্টারপ্রাইজ প্যাটার্নস | [প্রোডাকশন প্র্যাকটিসেস](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 ওয়ার্কশপ](workshop/README.md)** | হ্যান্ডস-অন ল্যাব | [পরিচিতি](workshop/docs/instructions/0-Introduction.md) &#124; [নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ভ্যালিডেশন](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [উপাদান বিশ্লেষণ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [ইনফ্রাস্ট্রাকচার অপসারণ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [সমাপ্তি](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**মোট কোর্স সময়কাল:** ~10-14 hours | **স্কিল উন্নতি:** শুরুকারী → প্রোডাকশন-রেডি

---

## 📚 শেখার অধ্যায়

*আপনার অভিজ্ঞতা স্তর ও লক্ষ্য অনুযায়ী শেখার পথ নির্বাচন করুন*

### 🚀 অধ্যায় 1: ভিত্তি ও দ্রুত শুরু
**প্রয়োজনীয়তা**: Azure সাবস্ক্রিপশন, বেসিক কমান্ড লাইন জ্ঞান  
**সময়কাল**: 30-45 মিনিট  
**জটিলতা**: ⭐

#### আপনি যা শিখবেন
- Azure Developer CLI-এর মৌলিক ধারণা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- আপনার প্রথম সফল ডিপ্লয়মেন্ট

#### শেখার রিসোর্স
- **🎯 শুরু করুন এখানে**: [Azure Developer CLI কি?](#what-is-azure-developer-cli)
- **📖 তত্ত্ব**: [AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) - মূল ধারণাগুলো ও টার্মিনোলজি
- **⚙️ সেটআপ**: [ইনস্টলেশন ও সেটআপ](docs/chapter-01-foundation/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট নির্দেশিকা
- **🛠️ হ্যান্ডস-অন**: [আপনার প্রথম প্রজেক্ট](docs/chapter-01-foundation/first-project.md) - ধাপে ধাপে টিউটোরিয়াল
- **📋 দ্রুত রেফারেন্স**: [কমান্ড চিট শীট](resources/cheat-sheet.md)

#### প্রায়োগিক অনুশীলন
```bash
# দ্রুত ইনস্টলেশন যাচাই
azd version

# আপনার প্রথম অ্যাপ্লিকেশন মোতায়েন করুন
azd init --template todo-nodejs-mongo
azd up
```

**💡 অধ্যায়ের ফলাফল**: AZD ব্যবহার করে Azure-এ একটি সহজ ওয়েব অ্যাপ সফলভাবে ডিপ্লয় করা

**✅ সাফল্য যাচাইকরণ:**
```bash
# অধ্যায় ১ সম্পন্ন করার পর, আপনি সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্পটি আরম্ভ করে
azd up                  # Azure-এ স্থাপন করে
azd show                # চলমান অ্যাপের URL প্রদর্শন করে
# অ্যাপ্লিকেশন ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 সময় বিনিয়োগ:** 30-45 মিনিট  
**📈 পরবর্তী দক্ষতা স্তর:** স্বাধীনভাবে বেসিক অ্যাপ্লিকেশন ডিপ্লয় করতে সক্ষম
**📈 পরবর্তী দক্ষতা স্তর:** স্বাধীনভাবে বেসিক অ্যাপ্লিকেশন ডিপ্লয় করতে সক্ষম

---

### 🤖 অধ্যায় 2: এআই-প্রথম ডেভেলপমেন্ট (এআই ডেভেলপারদের জন্য সুপারিশকৃত)
**প্রয়োজনীয়তা**: অধ্যায় 1 সম্পন্ন করা  
**সময়কাল**: 1-2 ঘন্টা  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- AZD-এর সাথে Microsoft Foundry একত্রীকরণ
- এআই-চালিত অ্যাপ্লিকেশন ডিপ্লয় করা
- এআই সার্ভিস কনফিগারেশনগুলি বোঝা

#### শেখার রিসোর্স
- **🎯 শুরু করুন এখানে**: [Microsoft Foundry একত্রীকরণ](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 এআই এজেন্টস**: [এআই এজেন্টস গাইড](docs/chapter-02-ai-development/agents.md) - AZD দিয়ে বুদ্ধিমান এজেন্ট ডিপ্লয় করুন
- **📖 প্যাটার্নস**: [এআই মডেল স্থাপন](docs/chapter-02-ai-development/ai-model-deployment.md) - এআই মডেল ডিপ্লয় ও ব্যবস্থাপনা
- **🛠️ ওয়ার্কশপ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার এআই সলিউশনগুলো AZD-র জন্য প্রস্তুত করুন
- **🎥 ইন্টারঅ্যাকটিভ গাইড**: [ওয়ার্কশপ মেটারিয়ালস](workshop/README.md) - MkDocs * DevContainer পরিবেশে ব্রাউজার-ভিত্তিক শেখা
- **📋 টেমপ্লেটস**: [Microsoft Foundry টেমপ্লেটস](#গভীর-অনুধাবন-azd-সক্ষমতা)
- **📝 উদাহরণ**: [AZD ডিপ্লয়মেন্ট উদাহরণসমূহ](examples/README.md)

#### প্রায়োগিক অনুশীলন
```bash
# আপনার প্রথম এআই অ্যাপ্লিকেশন ডিপ্লয় করুন
azd init --template azure-search-openai-demo
azd up

# অতিরিক্ত এআই টেমপ্লেট চেষ্টা করুন
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 অধ্যায়ের ফলাফল**: RAG ক্ষমতাসম্পন্ন একটি এআই-চালিত চ্যাট অ্যাপ ডিপ্লয় ও কনফিগার করা

**✅ সাফল্য যাচাইকরণ:**
```bash
# চ্যাপ্টার ২-এর পরে আপনি সক্ষম হওয়া উচিত:
azd init --template azure-search-openai-demo
azd up
# AI চ্যাট ইন্টারফেস পরীক্ষা করা
# প্রশ্ন জিজ্ঞেস করা এবং উৎসসহ AI-চালিত উত্তর পাওয়া
# সার্চ ইন্টিগ্রেশন কাজ করে কিনা যাচাই করা
azd monitor  # Application Insights-এ টেলিমেট্রি প্রদর্শিত হচ্ছে কিনা পরীক্ষা করা
azd down --force --purge
```

**📊 সময় বিনিয়োগ:** 1-2 ঘন্টা  
**📈 পরবর্তী দক্ষতা স্তর:** প্রোডাকশন-রেডি এআই অ্যাপ্লিকেশন ডিপ্লয় ও কনফিগার করতে সক্ষম  
**💰 খরচ সচেতনতা:** ডেভে $80-150/মাস অনুমান, প্রোডাকশনে $300-3500/মাস পর্যন্ত হতে পারে

#### 💰 এআই ডিপ্লয়মেন্টের খরচ বিবেচনা

**ডেভেলপমেন্ট পরিবেশ (অনুমানিত $80-150/মাস):**
- Microsoft Foundry মডেলস (Pay-as-you-go): $0-50/মাস (টোকেন ব্যবহারের উপর নির্ভর করে)
- AI Search (বেসিক টিয়ার): $75/মাস
- Container Apps (Consumption): $0-20/মাস
- Storage (স্ট্যান্ডার্ড): $1-5/মাস

**প্রোডাকশন পরিবেশ (অনুমানিত $300-3,500+/মাস):**
- Microsoft Foundry মডেলস (PTU ধারাবাহিক পারফরম্যান্সের জন্য): $3,000+/মাস অথবা উচ্চ ভলিউম হলে Pay-as-go
- AI Search (স্ট্যান্ডার্ড টিয়ার): $250/মাস
- Container Apps (Dedicated): $50-100/মাস
- Application Insights: $5-50/মাস
- Storage (প্রিমিয়াম): $10-50/মাস

**💡 খরচ অপ্টিমাইজেশন টিপস:**
- শেখার জন্য Microsoft Foundry মডেলগুলোর **ফ্রি টিয়ার** ব্যবহার করুন (Azure OpenAI 50,000 টোকেন/মাস অন্তর্ভুক্ত)
- সক্রিয়ভাবে ডেভেলপ না করলে রিসোর্স আড়াল (deallocate) করতে `azd down` চালান
- প্রাথমিকভাবে কনজাম্পশন-ভিত্তিক বিলিং ব্যবহার করুন, কেবল প্রোডাকশনের জন্য PTU-তে আপগ্রেড করুন
- ডিপ্লয়মেন্টের আগে খরচ অনুমান করতে `azd provision --preview` ব্যবহার করুন
- অটো-স্কেল সক্ষম করুন: কেবল বাস্তব ব্যবহার অনুযায়ী অর্থ প্রদান করুন

**খরচ মনিটরিং:**
```bash
# আনুমানিক মাসিক খরচ যাচাই করুন
azd provision --preview

# Azure পোর্টালে বাস্তব খরচ পর্যবেক্ষণ করুন
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ অধ্যায় 3: কনফিগারেশন ও অথেনটিকেশন
**প্রয়োজনীয়তা**: অধ্যায় 1 সম্পন্ন করা  
**সময়কাল**: 45-60 মিনিট  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- এনভায়রনমেন্ট কনফিগারেশন ও পরিচালনা
- অথেনটিকেশন ও সিকিউরিটি সেরা অনুশীলন
- রিসোর্স নামকরণ ও সংগঠন

#### শেখার রিসোর্স
- **📖 কনফিগারেশন**: [কনফিগারেশন গাইড](docs/chapter-03-configuration/configuration.md) - এনভায়রনমেন্ট সেটআপ
- **🔐 সিকিউরিটি**: [অথেনটিকেশন প্যাটার্নস ও ম্যানেজড আইডেন্টিটি](docs/chapter-03-configuration/authsecurity.md) - অথেনটিকেশন প্যাটার্নস
- **📝 উদাহরণসমূহ**: [ডাটাবেস অ্যাপ উদাহরণ](examples/database-app/README.md) - AZD ডাটাবেস উদাহরণসমূহ

#### প্রায়োগিক অনুশীলন
- একাধিক এনভায়রনমেন্ট কনফিগার করুন (dev, staging, prod)
- ম্যানেজড আইডেন্টিটি অথেনটিকেশন সেট আপ করুন
- এনভায়রনমেন্ট-নির্দিষ্ট কনফিগারেশন কার্যকর করুন

**💡 অধ্যায়ের ফলাফল**: সঠিক অথেনটিকেশন ও সিকিউরিটি সহ বহু পরিবেশ পরিচালনা করতে সক্ষম

---

### 🏗️ অধ্যায় 4: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট
**প্রয়োজনীয়তা**: অধ্যায় 1-3 সম্পন্ন  
**সময়কাল**: 1-1.5 ঘন্টা  
**জটিলতা**: ⭐⭐⭐

#### আপনি যা শিখবেন
- অ্যাডভান্সড ডিপ্লয়মেন্ট প্যাটার্নস
- Bicep ব্যবহার করে ইনফ্রাস্ট্রাকচার অ্যাজ কোড
- রিসোর্স প্রোভিশনিং কৌশলসমূহ

#### শেখার রিসোর্স
- **📖 ডিপ্লয়মেন্ট**: [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ ওয়ার্কফ্লো
- **🏗️ প্রোভিশনিং**: [রিসোর্স প্রোভিশনিং](docs/chapter-04-infrastructure/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 উদাহরণ**: [Container App উদাহরণ](../../examples/container-app) - কন্টেইনারাইজড ডিপ্লয়মেন্টস

#### প্রায়োগিক অনুশীলন
- কাস্টম Bicep টেমপ্লেট তৈরি করুন
- মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন
- ব্লু-গ্রীন ডিপ্লয়মেন্ট স্ট্র্যাটেজি কার্যকর করুন

**💡 অধ্যায়ের ফলাফল**: কাস্টম ইনফ্রাস্ট্রাকচার টেমপ্লেট ব্যবহার করে জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করা

---

### 🎯 অধ্যায় 5: মাল্টি-এজেন্ট এআই সলিউশনস (অ্যাডভান্সড)
**প্রয়োজনীয়তা**: অধ্যায় 1-2 সম্পন্ন  
**সময়কাল**: 2-3 ঘন্টা  
**জটিলতা**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্নস
- এজেন্ট অর্কেস্ট্রেশন ও সমন্বয়
- প্রোডাকশন-রেডি এআই ডিপ্লয়মেন্ট

#### শেখার রিসোর্স
- **🤖 ফিচার্ড প্রজেক্ট**: [রিটেইল মাল্টি-এজেন্ট সলিউশন](examples/retail-scenario.md) - সম্পূর্ণ ইমপ্লিমেন্টেশন
- **🛠️ ARM টেমপ্লেটস**: [ARM টেমপ্লেট প্যাকেজ](../../examples/retail-multiagent-arm-template) - এক-ক্লিক ডিপ্লয়মেন্ট
- **📖 আর্কিটেকচার**: [মাল্টি-এজেন্ট সমন্বয় প্যাটার্নস](docs/chapter-06-pre-deployment/coordination-patterns.md) - প্যাটার্নস

#### প্রায়োগিক অনুশীলন
```bash
# সম্পূর্ণ খুচরা বহু-এজেন্ট সমাধান স্থাপন করুন
cd examples/retail-multiagent-arm-template
./deploy.sh

# এজেন্ট কনফিগারেশনগুলি অন্বেষণ করুন
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 অধ্যায়ের ফলাফল**: Customer ও Inventory এজেন্টসহ একটি প্রোডাকশন-রেডি মাল্টি-এজেন্ট এআই সলিউশন ডিপ্লয় ও পরিচালনা করা

---

### 🔍 অধ্যায় 6: প্রি-ডিপ্লয়মেন্ট যাচাইকরণ ও পরিকল্পনা
**প্রয়োজনীয়তা**: অধ্যায় 4 সম্পন্ন  
**সময়কাল**: 1 ঘন্টা  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- ক্যাপাসিটি প্ল্যানিং ও রিসোর্স যাচাইকরণ
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট চেকস ও অটোমেশন

#### শেখার রিসোর্স
- **📊 পরিকল্পনা**: [ক্যাপাসিটি প্ল্যানিং](docs/chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স যাচাইকরণ
- **💰 নির্বাচন**: [SKU নির্বাচন](docs/chapter-06-pre-deployment/sku-selection.md) - কস্ট-এফেক্টিভ পছন্দসমূহ
- **✅ যাচাইকরণ**: [প্রি-ফ্লাইট চেকস](docs/chapter-06-pre-deployment/preflight-checks.md) - অটোমেটেড স্ক্রিপ্টস

#### প্রায়োগিক অনুশীলন
- ক্যাপাসিটি যাচাইকরণ স্ক্রিপ্ট চালান
- কস্টের জন্য SKU নির্বাচন অপ্টিমাইজ করুন
- অটোমেটেড প্রি-ডিপ্লয়মেন্ট চেকস কার্যকর করুন

**💡 অধ্যায়ের ফলাফল**: ডিপ্লয়মেন্ট বাস্তবায়নের আগে যাচাই ও অপ্টিমাইজেশন সম্পন্ন করা

---

### 🚨 অধ্যায় 7: ট্রাবলশুটিং ও ডিবাগিং
**প্রয়োজনীয়তা**: যেকোনো ডিপ্লয়মেন্ট অধ্যায় সম্পন্ন থাকলে পর্যাপ্ত  
**সময়কাল**: 1-1.5 ঘন্টা  
**জটিলতা**: ⭐⭐

#### আপনি যা শিখবেন
- পদ্ধতিগত ডিবাগিং পদ্ধতি
- সাধারণ সমস্যা ও সমাধান
- এআই-নির্দিষ্ট ট্রাবলশুটিং

#### শেখার রিসোর্স
- **🔧 সাধারণ সমস্যা**: [কমন ইস্যুজ](docs/chapter-07-troubleshooting/common-issues.md) - FAQ ও সমাধানসমূহ
- **🕵️ ডিবাগিং**: [ডিবাগিং গাইড](docs/chapter-07-troubleshooting/debugging.md) - ধাপে ধাপে স্ট্র্যাটেজিস
- **🤖 এআই ইস্যুজ**: [এআই-নির্দিষ্ট ট্রাবলশুটিং](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - এআই সার্ভিস সমস্যা সমাধান

#### প্রায়োগিক অনুশীলন
- ডিপ্লয়মেন্ট ফেইলিয়ার ডায়াগনোজ করুন
- অথেনটিকেশন ইস্যুজ সমাধান করুন
- এআই সার্ভিস কানেক্টিভিটি ডিবাগ করুন

**💡 অধ্যায়ের ফলাফল**: স্বতন্ত্রভাবে সাধারণ ডিপ্লয়মেন্ট সমস্যা নির্ণয় ও সমাধান করতে সক্ষম

---

### 🏢 অধ্যায় 8: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস
**প্রয়োজনীয়তা**: অধ্যায় 1-4 সম্পন্ন  
**সময়কাল**: 2-3 ঘন্টা  
**জটিলতা**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- প্রোডাকশন ডিপ্লয়মেন্ট স্ট্র্যাটেজিস
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নস
- মনিটরিং ও খরচ অপ্টিমাইজেশন
- **🏭 উৎপাদন**: [উৎপাদন AI সেরা অনুশীলন](docs/chapter-08-production/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্নসমূহ
- **📝 উদাহরণসমূহ**: [মাইক্রোসার্ভিস উদাহরণ](../../examples/microservices) - জটিল আর্কিটেকচার
- **📊 মনিটরিং**: [Application Insights ইন্টিগ্রেশন](docs/chapter-06-pre-deployment/application-insights.md) - মনিটরিং

#### প্রায়োগিক অনুশীলন
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নসমূহ বাস্তবায়ন করুন
- ব্যাপক মনিটরিং স্থাপন করুন
- উপযুক্ত গভর্ন্যান্স সহ প্রোডাকশনে স্থাপন করুন

**💡 অধ্যায়ের ফলাফল**: পূর্ণ প্রোডাকশন ক্ষমতাসম্পন্ন এন্টারপ্রাইজ-রেডি অ্যাপ্লিকেশন স্থাপন করুন

---

## 🎓 কর্মশালা ওভারভিউ: বাস্তব-কেন্দ্রিক শেখার অভিজ্ঞতা

> **⚠️ কর্মশালার অবস্থা: সক্রিয় উন্নয়ন**  
> কর্মশালার উপকরণ বর্তমানে উন্নয়ন ও পরিমার্জনার অধীনে আছে। কোর মডিউলগুলি কার্যকর হলেও কিছু উন্নত অংশ অসম্পূর্ণ। আমরা সক্রিয়ভাবে সব সামগ্রী সম্পন্ন করার কাজ করে যাচ্ছি। [উন্নয়ন ট্র্যাক করুন →](workshop/README.md)

### ইন্টারেক্টিভ কর্মশালা উপকরণ
**ব্রাউজার-ভিত্তিক টুলস এবং নির্দেশিত অনুশীলনের মাধ্যমে ব্যাপক বাস্তব-ভিত্তিক শেখা**

আমাদের কর্মশালা উপকরণগুলো অধ্যায়ভিত্তিক পাঠ্যক্রমের পরিপূরক হিসেবে একটি গঠিত, ইন্টারেক্টিভ শেখার অভিজ্ঞতা প্রদান করে। কর্মশালাটি স্ব-গতিত শেখা এবং প্রশিক্ষক-নেতৃত্বাধীন সেশন—উভয়ের জন্যই ডিজাইন করা হয়েছে।

#### 🛠️ কর্মশালার বৈশিষ্ট্যসমূহ
- **ব্রাউজার-ভিত্তিক ইন্টারফেস**: সার্চ, কপি, এবং থিম বৈশিষ্ট্যসহ সম্পূর্ণ MkDocs-চালিত কর্মশালা
- **GitHub Codespaces ইন্টিগ্রেশন**: এক-ক্লিক ডেভেলপমেন্ট এনভায়রনমেন্ট সেটআপ
- **গঠনগত শেখার পথ**: 8-মডিউল নির্দেশিত অনুশীলন (মোট 3-4 ঘন্টা)
- **প্রগতিশীল পদ্ধতি**: প্রবর্তন → নির্বাচন → যাচাই → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → অপসারণ → সমাপনী
- **ইন্টারেক্টিভ DevContainer পরিবেশ**: পূর্ব-কনফিগার করা টুলস এবং নির্ভরশীলতাসমূহ

#### 📚 কর্মশালা মডিউল কাঠামো
The workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 মিনিট |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 মিনিট |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 মিনিট |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 মিনিট |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 মিনিট |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 মিনিট |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 মিনিট |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 মিনিট |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 কর্মশালা শুরু করুন
```bash
# বিকল্প ১: GitHub Codespaces (প্রস্তাবিত)
# রিপোজিটরিতে "Code" → "Create codespace on main" ক্লিক করুন

# বিকল্প ২: লোকাল ডেভেলপমেন্ট
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md-এ থাকা সেটআপ নির্দেশনা অনুসরণ করুন
```

#### 🎯 কর্মশালা শেখার ফলাফল
By completing the workshop, participants will:
- **প্রোডাকশন AI অ্যাপ্লিকেশন স্থাপন করুন**: Microsoft Foundry সার্ভিসসহ AZD ব্যবহার করুন
- **মাল্টি-এজেন্ট আর্কিটেকচার আয়ত্ত করুন**: সমন্বিত AI এজেন্ট সমাধান বাস্তবায়ন করুন
- **নিরাপত্তা সেরা অনুশীলন বাস্তবায়ন করুন**: প্রমাণীকরণ এবং অ্যাক্সেস কন্ট্রোল কনফিগার করুন
- **স্কেলে অপটিমাইজ করুন**: খরচ-কার্যকর এবং কর্মক্ষম ডেপ্লয়মেন্ট ডিজাইন করুন
- **ডেপ্লয়মেন্ট সমস্যা সমাধান করুন**: সাধারণ সমস্যাগুলি স্বাধীনভাবে সমাধান করুন

#### 📖 কর্মশালা সম্পদ
- **🎥 ইন্টারেক্টিভ গাইড**: [কর্মশালা উপকরণ](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখার পরিবেশ
- **📋 মডিউল-বাই-মডিউল নির্দেশাবলী**:
  - [0. প্রবর্তন](workshop/docs/instructions/0-Introduction.md) - কর্মশালার ওভারভিউ এবং উদ্দেশ্য
  - [1. নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) - AI টেমপ্লেট খুঁজুন এবং নির্বাচন করুন
  - [2. যাচাই](workshop/docs/instructions/2-Validate-AI-Template.md) - টেমপ্লেট ডেপ্লয় এবং যাচাই করুন
  - [3. বিশ্লেষণ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - টেমপ্লেট আর্কিটেকচার অন্বেষণ করুন
  - [4. কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` আয়ত্ত করুন
  - [5. কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) - আপনার পরিস্থিতির জন্য কাস্টমাইজ করুন
  - [6. অপসারণ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - রিসোর্সগুলি ক্লিন আপ করুন
  - [7. সমাপনী](workshop/docs/instructions/7-Wrap-up.md) - পর্যালোচনা এবং পরবর্তী পদক্ষেপ
- **🛠️ AI কর্মশালা ল্যাব**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-ফোকাসড অনুশীলন
- **💡 দ্রুত শুরু**: [কর্মশালা সেটআপ গাইড](workshop/README.md#quick-start) - পরিবেশ কনফিগারেশন

**উপযুক্ত**: কর্পোরেট প্রশিক্ষণ, বিশ্ববিদ্যালয় কোর্স, স্ব-গতিত শেখা, এবং ডেভেলপার বুটক্যাম্পগুলোর জন্য।

---

## 📖 গভীর অনুধাবন: AZD সক্ষমতা

মৌলিক বিষয়গুলির বাইরে, AZD প্রোডাকশন ডেপ্লয়মেন্টের জন্য শক্তিশালী ফিচার সরবরাহ করে:

- **টেমপ্লেট-ভিত্তিক ডেপ্লয়মেন্ট** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নের জন্য প্রি-বিল্ট টেমপ্লেট ব্যবহার করুন
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড** - Manage Azure resources using Bicep or Terraform  
- **ইন্টিগ্রেটেড ওয়ার্কফ্লো** - Seamlessly provision, deploy, and monitor applications
- **ডেভেলপার-ফ্রেন্ডলি** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: AI ডেপ্লয়মেন্টের জন্য আদর্শ**

**কেন AI সমাধানের জন্য AZD?** AZD AI ডেভেলপারদের মুখোমুখি প্রধান চ্যালেঞ্জগুলো সমাধান করে:

- **AI-রেডি টেমপ্লেট** - Microsoft Foundry Models, Cognitive Services, এবং ML ওয়ার্কলোডের জন্য পূর্ব-কনফিগারকৃত টেমপ্লেট
- **নিরাপদ AI ডেপ্লয়মেন্ট** - AI সার্ভিস, API কী, এবং মডেল এন্ডপয়েন্টগুলোর জন্য বিল্ট-ইন সিকিউরিটি প্যাটার্ন
- **প্রোডাকশন AI প্যাটার্ন** - স্কেলেবল, খরচ-কার্যকর AI অ্যাপ্লিকেশন ডেপ্লয়মেন্টের সেরা অনুশীলনসমূহ
- **এন্ড-টু-এন্ড AI ওয়ার্কফ্লো** - মডেল ডেভেলপমেন্ট থেকে প্রোডাকশনে ডেপ্লয়মেন্ট পর্যন্ত যথাযথ মনিটরিংসহ
- **খরচ অপ্টিমাইজেশন** - AI ওয়ার্কলোডের জন্য স্মার্ট রিসোর্স বরাদ্দ এবং স্কেলিং কৌশল
- **Microsoft Foundry ইন্টিগ্রেশন** - Microsoft Foundry মডেল ক্যাটালগ এবং এন্ডপয়েন্টের সাথে নির্বিঘ্ন সংযোগ

---

## 🎯 টেমপ্লেট ও উদাহরণ গ্রন্থাগার

### বৈশিষ্ট্যযুক্ত: Microsoft Foundry টেমপ্লেটসমূহ
**এখান থেকেই শুরু করুন যদি আপনি AI অ্যাপ্লিকেশন ডেপ্লয় করতে যাচ্ছেন!**

> **নোট:** এই টেমপ্লেটগুলি বিভিন্ন AI প্যাটার্ন প্রদর্শন করে। কিছু হচ্ছে বাহ্যিক Azure Samples, অন্যগুলো লোকাল বাস্তবায়ন।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**AI চ্যাট দিয়ে শুরু করুন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**AI এজেন্ট দিয়ে শুরু করুন**](https://github.com/Azure-Samples/get-started-with-ai-agents) | অধ্যায় 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | অধ্যায় 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **লোকাল** |

### বৈশিষ্ট্যযুক্ত: সম্পূর্ণ শেখার দৃশ্যাবলী
**শিক্ষার অধ্যায়গুলোর সাথে ম্যাপ করা প্রোডাকশন-রেডি অ্যাপ্লিকেশন টেমপ্লেটসমূহ**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | অধ্যায় 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | অধ্যায় 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### উদাহরণের ধরন অনুযায়ী শেখা

> **📌 লোকাল বনাম বাহ্যিক উদাহরণ:**  
> **লোকাল উদাহরণসমূহ** (এই রিপোতে) = অবিলম্বে ব্যবহারযোগ্য  
> **বাহ্যিক উদাহরণসমূহ** (Azure Samples) = লিঙ্ক করা রিপোজিটরি থেকে ক্লোন করুন

#### লোকাল উদাহরণসমূহ (প্রস্তুত ব্যবহার করার জন্য)
- [**রিটেইল মাল্টি-এজেন্ট সমাধান**](examples/retail-scenario.md) - ARM টেমপ্লেটসহ পূর্ণ প্রোডাকশন-রেডি বাস্তবায়ন
  - মাল্টি-এজেন্ট আর্কিটেকচার (Customer + Inventory agents)
  - ব্যাপক মনিটরিং এবং মূল্যায়ন
  - ARM টেমপ্লেটের মাধ্যমে এক-ক্লিক ডেপ্লয়মেন্ট

#### লোকাল উদাহরণ - কনটেইনার অ্যাপ্লিকেশন (অধ্যায় 2-5)
**এই রিপোজিটরিতে কনটেইনার ডেপ্লয়মেন্টের বিস্তৃত উদাহরণসমূহ:**
- [**কনটেইনার অ্যাপ উদাহরণসমূহ**](examples/container-app/README.md) - কনটেইনারাইজড ডেপ্লয়মেন্টের সম্পূর্ণ গাইড
  - [সহজ Flask API](../../examples/container-app/simple-flask-api) - স্কেল-টু-জিরো সহ বেসিক REST API
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../examples/container-app/microservices) - প্রোডাকশন-রেডি বহু-সার্ভিস ডেপ্লয়মেন্ট
  - কুইক স্টার্ট, প্রোডাকশন, এবং অ্যাডভান্সড ডেপ্লয়মেন্ট প্যাটার্ন
  - মনিটরিং, নিরাপত্তা, এবং খরচ অপ্টিমাইজেশন নির্দেশনা

#### বাহ্যিক উদাহরণ - সরল অ্যাপ্লিকেশন (অধ্যায় 1-2)
**শুরু করার জন্য এই Azure Samples রিপোজিটরিগুলি ক্লোন করুন:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - বেসিক ডেপ্লয়মেন্ট প্যাটার্ন
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - স্ট্যাটিক কনটেন্ট ডেপ্লয়মেন্ট
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ডেপ্লয়মেন্ট

#### বাহ্যিক উদাহরণ - ডেটাবেস ইন্টিগ্রেশন (অধ্যায় 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ডেটাবেস কানেক্টিভিটি প্যাটার্ন
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - সার্ভারলেস ডাটা ওয়ার্কফ্লো

#### বাহ্যিক উদাহরণ - উন্নত প্যাটার্ন (অধ্যায় 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - বহু-সার্ভিস আর্কিটেকচার
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ব্যাকগ্রাউন্ড প্রসেসিং  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - প্রোডাকশন-রেডি ML প্যাটার্ন

### বাহ্যিক টেমপ্লেট সংগ্রহ
- [**অফিশিয়াল AZD টেমপ্লেট গ্যালারী**](https://azure.github.io/awesome-azd/) - অফিসিয়াল এবং কমিউনিটি টেমপ্লেটগুলোর সংকলন
- [**Azure Developer CLI টেমপ্লেট**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn টেমপ্লেট ডকুমেন্টেশন
- [**উদাহরণ ডিরেক্টরি**](examples/README.md) - বিস্তারিত ব্যাখ্যাসহ লোকাল শেখার উদাহরণসমূহ

---

## 📚 শেখার সম্পদ ও রেফারেন্স

### ত্বরित রেফারেন্সসমূহ
- [**কমান্ড চিট শীট**](resources/cheat-sheet.md) - অধ্যায় অনুযায়ী সাজানো গুরুত্বপূর্ণ azd কমান্ডসমূহ
- [**পরিভাষা**](resources/glossary.md) - Azure এবং azd পরিভাষা  
- [**FAQ**](resources/faq.md) - শেখার অধ্যায় অনুযায়ী সাজানো সাধারণ প্রশ্নাবলি
- [**অধ্যয়ন গাইড**](resources/study-guide.md) - বিস্তৃত অনুশীলন কার্যক্রম

### বাস্তব-অনুশীলন কর্মশালা
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলো AZD-ডেপ্লয়েবল করুন (2-3 ঘন্টা)
- [**ইন্টারেক্টিভ কর্মশালা**](workshop/README.md) - MkDocs এবং GitHub Codespaces সহ 8-মডিউল নির্দেশিত অনুশীলন
  - অনুসরণ করে: প্রবর্তন → নির্বাচন → যাচাই → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → অপসারণ → সমাপনী

### বাহ্যিক শেখার সম্পদ
- [Azure ডেভেলপার CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure স্থাপত্য কেন্দ্র](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure মূল্য নির্ণয় ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)
- [Azure অবস্থা](https://status.azure.com/)

### আপনার সম্পাদক জন্য AI এজেন্ট দক্ষতাসমূহ
- [**skills.sh-এ Microsoft Azure দক্ষতা**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, ডিপ্লয়মেন্ট, ডায়াগনস্টিকস, খরচ অপ্টিমাইজেশন, এবং আরও জন্য 37টি খোলা এজেন্ট দক্ষতা। এগুলো GitHub Copilot, Cursor, Claude Code, বা যে কোনো সমর্থিত এজেন্টে ইনস্টল করুন:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 দ্রুত সমস্যা সমাধান গাইড

**নতুনদের মুখোমুখি সাধারণ সমস্যা এবং তাৎক্ষণিক সমাধানসমূহ:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# প্রথমে AZD ইনস্টল করুন
# উইন্ডোজ (পাওয়ারশেল):
winget install microsoft.azd

# ম্যাকওএস:
brew tap azure/azd && brew install azd

# লিনাক্স:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ইনস্টলেশন যাচাই করুন
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# উপলব্ধ সাবস্ক্রিপশনগুলি তালিকা করুন
az account list --output table

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription "<subscription-id-or-name>"

# AZD পরিবেশের জন্য সেট করুন
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# যাচাই করুন
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# অন্য কোনো Azure অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION "westus2"
azd up

# অথবা ডেভেলপমেন্টে ছোট SKUs ব্যবহার করুন
# infra/main.parameters.json সম্পাদনা করুন:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# বিকল্প ১: পরিষ্কার করে পুনরায় চেষ্টা করুন
azd down --force --purge
azd up

# বিকল্প ২: কেবল অবকাঠামো ঠিক করুন
azd provision

# বিকল্প ৩: বিস্তারিত অবস্থা পরীক্ষা করুন
azd show

# বিকল্প ৪: Azure Monitor-এ লগ পরীক্ষা করুন
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# পুনরায় প্রমাণীকরণ
az logout
az login

azd auth logout
azd auth login

# প্রমাণীকরণ যাচাই করুন
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD অনন্য নাম তৈরি করে, কিন্তু যদি সংঘর্ষ হয়:
azd down --force --purge

# তারপর নতুন পরিবেশে আবার চেষ্টা করুন
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**সাধারণ অপেক্ষার সময়:**
- সহজ ওয়েব অ্যাপ: 5-10 মিনিট
- ডাটাবেস সহ অ্যাপ: 10-15 মিনিট
- AI অ্যাপ্লিকেশন: 15-25 মিনিট (OpenAI provisioning ধীর)

```bash
# অগ্রগতি পরীক্ষা করুন
azd show

# যদি >30 মিনিটের বেশি আটকে থাকলে, Azure পোর্টাল পরীক্ষা করুন:
azd monitor
# ব্যর্থ ডিপ্লয়মেন্ট খুঁজুন
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# আপনার Azure ভূমিকা পরীক্ষা করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# আপনার কাছে অন্তত "Contributor" ভূমিকা থাকা প্রয়োজন
# আপনার Azure অ্যাডমিনকে অনুমতি দিতে বলুন:
# - Contributor (রিসোর্সগুলোর জন্য)
# - User Access Administrator (ভূমিকা বরাদ্দের জন্য)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# সব সার্ভিস এন্ডপয়েন্ট দেখান
azd show

# অথবা Azure পোর্টাল খুলুন
azd monitor

# নির্দিষ্ট সার্ভিস পরীক্ষা করুন
azd env get-values
# *_URL ভ্যারিয়েবলগুলো খুঁজুন
```
</details>

### 📚 সম্পূর্ণ ত্রুটি সমাধান সম্পদ

- **সাধারণ সমস্যাগুলোর নির্দেশিকা:** [বিস্তারিত সমাধান](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-নির্দিষ্ট সমস্যা:** [AI সমস্যা সমাধান](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ডিবাগিং গাইড:** [ধাপে ধাপে ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md)
- **সাহায্য নিন:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 কোর্স সম্পন্নকরণ ও সার্টিফিকেশন

### অগ্রগতি ট্র্যাকিং
প্রতিটি অধ্যায়ের মাধ্যমে আপনার শেখার অগ্রগতি ট্র্যাক করুন:

- [ ] **Chapter 1**: ভিত্তি & দ্রুত শুরু ✅
- [ ] **Chapter 2**: AI-প্রধান উন্নয়ন ✅  
- [ ] **Chapter 3**: কনফিগারেশন & প্রমাণীকরণ ✅
- [ ] **Chapter 4**: ইনফ্রাস্ট্রাকচার অ্যাজ কোড & ডিপ্লয়মেন্ট ✅
- [ ] **Chapter 5**: মাল্টি-এজেন্ট AI সমাধান ✅
- [ ] **Chapter 6**: প্রি-ডিপ্লয়মেন্ট যাচাই & পরিকল্পনা ✅
- [ ] **Chapter 7**: ত্রুটি সমাধান & ডিবাগিং ✅
- [ ] **Chapter 8**: প্রোডাকশন & এন্টারপ্রাইজ প্যাটার্ন ✅

### শেখার যাচাই
প্রতিটি অধ্যায় শেষ করার পর আপনার জ্ঞান যাচাই করুন:
1. **প্রায়োগিক অনুশীলন**: অধ্যায়ের হ্যান্ডস-অন ডিপ্লয়মেন্ট সম্পন্ন করুন
2. **জ্ঞান যাচাই**: আপনার অধ্যায়ের FAQ সেকশন পর্যালোচনা করুন
3. **কমিউনিটি আলোচনা**: আপনার অভিজ্ঞতা Azure Discord-এ শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরবর্তী জটিলতা স্তরে যান

### কোর্স সম্পন্নকরণের উপকারিতা
সবগুলো অধ্যায় সম্পন্ন করার পর, আপনার কাছে থাকবে:
- **প্রোডাকশন অভিজ্ঞতা**: বাস্তব AI অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করা
- **পেশাদার দক্ষতা**: এন্টারপ্রাইজ-রেডি ডিপ্লয়মেন্ট ক্ষমতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার উন্নতি**: চাহিদাসম্পন্ন AZD এবং AI ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি ও সমর্থন

### সাহায্য ও সমর্থন পান
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট করুন এবং ফিচার অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)
- **শিখন সংক্রান্ত প্রশ্নসমূহ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) এবং [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-নির্দিষ্ট সহায়তা**: যোগ দিন [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ডকুমেন্টেশন**: [আধিকারিক Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**সাম্প্রতিক জরিপ ফলাফল #Azure চ্যানেল থেকে:**
- **45%** ডেভেলপাররা AZD কে AI ওয়ার্কলোডের জন্য ব্যবহার করতে চান
- **শীর্ষ চ্যালেঞ্জগুলো**: মাল্টি-সার্ভিস ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ম্যানেজমেন্ট, প্রোডাকশন রেডিনেস  
- **সর্বাধিক অনুরোধকৃত**: AI-নির্দিষ্ট টেমপ্লেট, ত্রুটি সমাধান গাইড, সেরা অনুশীলনসমূহ

**আমাদের কমিউনিটিতে যোগ দিলে আপনি পারবেন:**
- আপনার AZD + AI অভিজ্ঞতা শেয়ার করে সাহায্য পেতে
- নতুন AI টেমপ্লেটের দ্রুত প্রিভিউ দেখতে পাওয়া
- AI ডিপ্লয়মেন্ট সেরা অনুশীলনে অবদান রাখা
- ভবিষ্যতের AI + AZD ফিচার ডেভেলপমেন্টে প্রভাব ফেলা

### কোর্সে অবদান রাখা
আমরা অবদানকে স্বাগত জানাই! বিস্তারিত জানতে আমাদের [Contributing Guide](CONTRIBUTING.md) পড়ুন:
- **বিষয়বস্তু উন্নতি**: বিদ্যমান অধ্যায় ও উদাহরণ উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব-বিশ্বের পরিস্থিতি এবং টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহু-ভাষা সহায়তা বজায় রাখতে সাহায্য করুন
- **বাগ রিপোর্ট**: সঠিকতা ও স্পষ্টতা উন্নত করুন
- **কমিউনিটি মানদণ্ড**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি নির্দেশিকা অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্পটি MIT লাইসেন্স অনুযায়ী লাইসেন্সভুক্ত - বিস্তারিত জানতে [LICENSE](../../LICENSE) ফাইলটি দেখুন।

### সম্পর্কিত Microsoft লার্নিং রিসোর্স

আমাদের টিম অন্যান্য বিস্তৃত লার্নিং কোর্সও তৈরি করে:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![শুরুর জন্য LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![শুরুর জন্য LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![শুরুর জন্য LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![শুরুর জন্য AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য AI Agents](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![শুরুর জন্য জেনারেটিভ AI](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![জেনারেটিভ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![জেনারেটিভ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![জেনারেটিভ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### কোর লার্নিং
[![শুরুর জন্য ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য ডাটা সায়েন্স](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য সাইবারসিকিউরিটি](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![শুরুর জন্য ওয়েব ডেভেলপমেন্ট](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুর জন্য XR ডেভেলপমেন্ট](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### কপাইলট সিরিজ
[![AI জোড়া প্রোগ্রামিং-এর জন্য Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET-এর জন্য Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot অ্যাডভেঞ্চার](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ কোর্স নেভিগেশন

**🚀 শেখা শুরু করতে প্রস্তুত?**

**নতুনরা**: শুরু করুন [অধ্যায় 1: ভিত্তি ও দ্রুত শুরু](#-chapter-1-foundation--quick-start)  
**AI ডেভেলপাররা**: পৌঁছান [অধ্যায় 2: AI-প্রথম উন্নয়ন](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**অভিজ্ঞ ডেভেলপাররা**: শুরু করুন [অধ্যায় 3: কনফিগারেশন ও প্রমাণীকরণ](#️-chapter-3-configuration--authentication)

**পরবর্তী পদক্ষেপ**: [অধ্যায় 1 শুরু করুন - AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকরণ**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসম্ভব নির্ভুলতার চেষ্টা করি, অনুগ্রহ করে অবগত থাকুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসম্পূর্ণতা থাকতে পারে। মূল নথিটি তার প্রাকৃতিক ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ পরামর্শযোগ্য। এই অনুবাদের ব্যবহারের ফলে সৃষ্ট কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
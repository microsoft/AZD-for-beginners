# AZD শিক্ষানবীষদের জন্য: একটি গঠনমূলক শেখার যাত্রা

![AZD-শিক্ষানবীষদের জন্য](../../translated_images/bn/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ওয়াচারস](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub স্টারস](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure ডিসকর্ড](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry ডিসকর্ড](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### স্বয়ংক্রিয় অনুবাদ (সবসময় আপ-টু-ডেট)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[আরবি](../ar/README.md) | [বাংলা](./README.md) | [বুলগেরিয়ান](../bg/README.md) | [বার্মিজ (মায়ানমার)](../my/README.md) | [চীনা (সরলীকৃত)](../zh-CN/README.md) | [চীনা (প্রচলিত, হংকং)](../zh-HK/README.md) | [চীনা (প্রচলিত, ম্যাকাও)](../zh-MO/README.md) | [চীনা (প্রচলিত, তাইওয়ান)](../zh-TW/README.md) | [ক্রোয়েশিয়ান](../hr/README.md) | [চেক](../cs/README.md) | [ড্যানিশ](../da/README.md) | [ডাচ](../nl/README.md) | [এস্তোনীয়](../et/README.md) | [ফিনিশ](../fi/README.md) | [ফরাসি](../fr/README.md) | [জার্মান](../de/README.md) | [গ্রীক](../el/README.md) | [হিব্রু](../he/README.md) | [হিন্দি](../hi/README.md) | [হাঙ্গেরিয়ান](../hu/README.md) | [ইন্দোনেশিয়ান](../id/README.md) | [ইতালিয়ান](../it/README.md) | [জাপানি](../ja/README.md) | [কন্নড়](../kn/README.md) | [কোরিয়ান](../ko/README.md) | [লিথুয়ানিয়ান](../lt/README.md) | [মলয়](../ms/README.md) | [মলয়ালাম](../ml/README.md) | [মারাঠি](../mr/README.md) | [নেপালি](../ne/README.md) | [নাইজেরিয়ান পিজিন](../pcm/README.md) | [নরওয়েজীয়ান](../no/README.md) | [ফার্সি (পার্সিয়ান)](../fa/README.md) | [পোলিশ](../pl/README.md) | [পর্তুগিজ (ব্রাজিল)](../pt-BR/README.md) | [পর্তুগিজ (পর্তুগাল)](../pt-PT/README.md) | [পাঞ্জাবি (গুরুমুখী)](../pa/README.md) | [রোমানিয়ান](../ro/README.md) | [রুশ](../ru/README.md) | [সার্বীয় (সিরিলিক)](../sr/README.md) | [স্লোভাক](../sk/README.md) | [স্লোভেনীয়](../sl/README.md) | [স্প্যানিশ](../es/README.md) | [সোয়াহিলি](../sw/README.md) | [সুইডিশ](../sv/README.md) | [টাগালোগ (ফিলিপিনো)](../tl/README.md) | [তামিল](../ta/README.md) | [তেলুগু](../te/README.md) | [থাই](../th/README.md) | [তুর্কিশ](../tr/README.md) | [ইউক্রেইনীয়](../uk/README.md) | [উর্দু](../ur/README.md) | [ভিয়েতনামী](../vi/README.md)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রিপোজিটরিতে 50+ ভাষার অনুবাদ অন্তর্ভুক্ত রয়েছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
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
> এটি আপনাকে কোর্স সম্পন্ন করতে দ্রুততর ডাউনলোডের সাথে প্রয়োজনীয় সবকিছু দেবে।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) কী?

**Azure Developer CLI (azd)** হল একটি ডেভেলপার-উপযোগী কমান্ড-লাইন টুল যা Azure-এ অ্যাপ্লিকেশন ডিপ্লয় করা সহজ করে। ডজনখানেক Azure রিসোর্স ম্যানুয়ালি তৈরি ও সংযোগ করার বদলে, আপনি একটি একক কমান্ডে পুরো অ্যাপ্লিকেশন ডিপ্লয় করতে পারেন।

### `azd up` এর যাদু

```bash
# এই একক কমান্ড সব কিছু করে:
# ✅ সমস্ত আজুর সম্পদ তৈরি করে
# ✅ নেটওয়ার্কিং এবং নিরাপত্তা কনফিগার করে
# ✅ আপনার অ্যাপ্লিকেশন কোড তৈরি করে
# ✅ আজুরে ডেপ্লয় করে
# ✅ আপনাকে একটি কার্যকর URL প্রদান করে
azd up
```

**এইটাই শেষ!** Azure পোর্টালে ক্লিক করার দরকার নেই, জটিল ARM টেমপ্লেট প্রথমে শেখার দরকার নেই, ম্যানুয়াল কনফিগারেশনের ঝামেলা নেই — কেবল Azure-এ কাজ করা অ্যাপ্লিকেশন।

---

## ❓ Azure Developer CLI বনাম Azure CLI: পার্থক্য কী?

এটি শিক্ষানবীষদের সবচেয়ে সাধারণ প্রশ্ন। সহজ উত্তরটি এখানে:

| বৈশিষ্ট্য | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **উদ্দেশ্য** | একক Azure রিসোর্সগুলো পরিচালনা করা | সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয় করা |
| **মনোভাব** | ইনফ্রাস্ট্রাকচার-কেন্দ্রিক | অ্যাপ্লিকেশন-কেন্দ্রিক |
| **উদাহরণ** | `az webapp create --name myapp...` | `azd up` |
| **শিখার বাঁক** | Azure সেবাগুলি জানতে হবে | শুধু আপনার অ্যাপ জানলেই হবে |
| **কার জন্য উপযুক্ত** | DevOps, ইনফ্রাস্ট্রাকচার | ডেভেলপার, প্রোটোটাইপিং |

### সরল উপমা

- **Azure CLI** এমন যেন আপনার কাছে বাড়ি বানানোর সব সরঞ্জাম আছে — হাতুড়ি, করাত, পিন। আপনি যেকোন কিছু বানাতে পারেন, তবে কনস্ট্রাকশন জানা থাকতে হবে।
- **Azure Developer CLI** এমন যেন আপনি কন্ট্রাক্টর নিয়োগ করেছেন — আপনি যা চান তা বর্ণনা করেন, আর তারা নির্মাণের সকল কাজ করে দেয়।

### কখন কোনটি ব্যবহার করবেন

| পরিস্থিতি | এটি ব্যবহার করুন |
|----------|----------|
| "আমি আমার ওয়েব অ্যাপ দ্রুত ডিপ্লয় করতে চাই" | `azd up` |
| "আমাকে শুধুমাত্র একটি স্টোরেজ অ্যাকাউন্ট তৈরি করতে হবে" | `az storage account create` |
| "আমি একটি পূর্ণ AI অ্যাপ তৈরি করছি" | `azd init --template azure-search-openai-demo` |
| "আমাকে একটি নির্দিষ্ট Azure রিসোর্স ডিবাগ করতে হবে" | `az resource show` |
| "আমি মিনিটে প্রোডাকশন-রেডি ডিপ্লয় চাই" | `azd up --environment production` |

### এগুলো একসাথে কাজ করে!

AZD পটভূমিতে Azure CLI ব্যবহার করে। আপনি দুটোই ব্যবহার করতে পারেন:
```bash
# আপনার অ্যাপটি AZD দ্বারা মোতায়েন করুন
azd up

# তারপর Azure CLI দিয়ে নির্দিষ্ট রিসোর্সগুলি সূক্ষ্মভাবে সেট করুন
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-এ টেমপ্লেটগুলি খুঁজুন

শূন্য থেকে শুরু করবেন না! **Awesome AZD** হলো কমিউনিটির প্রস্তুত-ডিপ্লয় টেমপ্লেটগুলোর সংগ্রহ:

| রিসোর্স | বর্ণনা |
|----------|-------------|
| 🔗 [**Awesome AZD গ্যালারি**](https://azure.github.io/awesome-azd/) | এক-ক্লিকে ডিপ্লয় করার জন্য 200+ টেমপ্লেট ব্রাউজ করুন |
| 🔗 [**একটি টেমপ্লেট জমা দিন**](https://github.com/Azure/awesome-azd/issues) | আপনার নিজস্ব টেমপ্লেট কমিউনিটিতে যোগ করুন |
| 🔗 [**GitHub রিপোজিটরি**](https://github.com/Azure/awesome-azd) | স্টার দিন এবং সোর্স অন্বেষণ করুন |

### Awesome AZD থেকে জনপ্রিয় AI টেমপ্লেটসমূহ

```bash
# আজুর ওপেনএআই + এআই সার্চ সহ RAG চ্যাট
azd init --template azure-search-openai-demo

# দ্রুত এআই চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart

# ফাউন্ড্রি এজেন্টদের সাথে এআই এজেন্টস
azd init --template get-started-with-ai-agents
```

---

## 🎯 ৩ ধাপে শুরু করুন

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

# আজুরে ডিপ্লয় করুন (সবকিছু তৈরি করে!)
azd up
```

**🎉 এইটাই শেষ!** আপনার অ্যাপ এখন Azure-এ লাইভ।

### পরিষ্কার করা (ভুলবেন না!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 এই কোর্সটি কিভাবে ব্যবহার করবেন

এই কোর্সটি **ধাপে ধাপে শেখার** জন্য ডিজাইন করা হয়েছে — যেখানে আপনি আরামদায়ক বোধ করেন সেখানে শুরু করুন এবং ধীরে ধীরে এগিয়ে যান:

| আপনার অভিজ্ঞতা | এখানে শুরু করুন |
|-----------------|------------|
| **Azure-এ সম্পূর্ণ নতুন** | [অধ্যায় ১: ভিত্তি](../..) |
| **Azure জানেন, AZD নতুন** | [অধ্যায় ১: ভিত্তি](../..) |
| **AI অ্যাপ ডিপ্লয় করতে চান** | [অধ্যায় ২: AI উন্নয়ন](../..) |
| **হাতেকলমে অনুশীলন চান** | [🎓 ইন্টারঅ্যাকটিভ কর্মশালা](workshop/README.md) - ৩-৪ ঘন্টার গাইডেড ল্যাব |
| **প্রোডাকশন প্যাটার্ন দরকার** | [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ](../..) |

### দ্রুত সেটআপ

1. **এই রিপোজিটরি Fork করুন**: [![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ক্লোন করুন**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **সহায়তা পান**: [Azure Discord কমিউনিটি](https://discord.com/invite/ByRwuEEgH4)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রিপোজিটরিতে 50+ ভাষার অনুবাদ অন্তর্ভুক্ত রয়েছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> এটি আপনাকে কোর্স সম্পন্ন করতে দ্রুততর ডাউনলোডের সাথে প্রয়োজনীয় সবকিছু দেবে।


## কোর্স সারসংক্ষেপ

কোর্সটি গঠিত অধ্যায়গুলোর মাধ্যমে Azure Developer CLI (azd) আয়ত্ত করাতে ডিজাইন করা হয়েছে, যা ধাপে ধাপে শেখার উপযোগী। **Microsoft Foundry একত্রীকরণের সাথে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট-এ বিশেষ ফোকাস।**

### কেন আধুনিক ডেভেলপারদের জন্য এই কোর্সটি জরুরি

Microsoft Foundry Discord কমিউনিটির অন্তর্দৃষ্টির ভিত্তিতে, **ডেভেলপারদের 45% AZD ব্যবহার করে AI ওয়ার্কলোড চালাতে চান** তবে তারা নিম্নলিখিত চ্যালেঞ্জগুলোর সম্মুখীন হন:
- জটিল মাল্টি-সার্ভিস AI আর্কিটেকচার
- প্রোডাকশন AI ডিপ্লয়মেন্ট সেরা অনুশীলন  
- Azure AI সেবা একীভূতকরণ ও কনফিগারেশন
- AI ওয়ার্কলোডের জন্য খরচ অনুকূলকরণ
- AI-নির্দিষ্ট ডিপ্লয়মেন্ট সমস্যা ট্রাবলশুটিং

### শেখার লক্ষ্যসমূহ

এই গঠিত কোর্স সম্পন্ন করে আপনি:
- **AZD মৌলিক জ্ঞান আয়ত্ত করবেন**: মূল ধারণা, ইনস্টলেশন, এবং কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডিপ্লয় করবেন**: Microsoft Foundry সার্ভিসগুলির সাথে AZD ব্যবহার করে
- **Infrastructure as Code বাস্তবায়ন করবেন**: Bicep টেমপ্লেট দিয়ে Azure রিসোর্স পরিচালনা করবেন
- **ডিপ্লয়মেন্ট ট্রাবলশুট করবেন**: সাধারণ সমস্যা সমাধান ও ডিবাগ করবেন
- **প্রোডাকশনের জন্য অপ্টিমাইজ করবেন**: সিকিউরিটি, স্কেলিং, মনিটরিং, এবং খরচ ব্যবস্থাপনা
- **মাল্টি-এজেন্ট সলিউশন নির্মাণ করবেন**: জটিল AI আর্কিটেকচার ডিপ্লয় করবেন

## 🗺️ কোর্স ম্যাপ: অধ্যায় অনুযায়ী দ্রুত নেভিগেশন

প্রতিটি অধ্যায়ের নিজস্ব README আছে যেখানে শেখার উদ্দেশ্য, দ্রুত শুরু, এবং অনুশীলন রয়েছে:

| অধ্যায় | বিষয় | পাঠসমূহ | সময়কাল | কঠিনতা |
|---------|-------|---------|----------|------------|
| **[অধ্যায় ১: ভিত্তি](docs/chapter-01-foundation/README.md)** | শুরু করা | [AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) &#124; [ইনস্টলেশন](docs/chapter-01-foundation/installation.md) &#124; [প্রথম প্রকল্প](docs/chapter-01-foundation/first-project.md) | 30-45 মিনিট | ⭐ |
| **[অধ্যায় ২: AI উন্নয়ন](docs/chapter-02-ai-development/README.md)** | AI-প্রথম অ্যাপ | [Foundry ইন্টিগ্রেশন](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI এজেন্ট](docs/chapter-02-ai-development/agents.md) &#124; [মডেল ডিপ্লয়মেন্ট](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ওয়ার্কশপ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ঘন্টা | ⭐⭐ |
| **[অধ্যায় ৩: কনফিগারেশন](docs/chapter-03-configuration/README.md)** | অথ ও নিরাপত্তা | [কনফিগারেশন](docs/chapter-03-configuration/configuration.md) &#124; [অথেন্টিকেশন ও নিরাপত্তা](docs/chapter-03-configuration/authsecurity.md) | 45-60 মিনিট | ⭐⭐ |
| **[অধ্যায় ৪: অবকাঠামো](docs/chapter-04-infrastructure/README.md)** | IaC ও ডিপ্লয়মেন্ট | [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [প্রোভিশনিং](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ঘন্টা | ⭐⭐⭐ |
| **[অধ্যায় ৫: মাল্টি-এজেন্ট](docs/chapter-05-multi-agent/README.md)** | এআই এজেন্ট সমাধান | [রিটেইল সিনারিও](examples/retail-scenario.md) &#124; [সমন্বয় প্যাটার্ন](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ঘন্টা | ⭐⭐⭐⭐ |
| **[অধ্যায় ৬: প্রি-ডিপ্লয়মেন্ট](docs/chapter-06-pre-deployment/README.md)** | পরিকল্পনা ও যাচাইকরণ | [প্রি-ফ্লাইট চেক](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ক্ষমতা পরিকল্পনা](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU নির্বাচন](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [অ্যাপ ইনসাইটস](docs/chapter-06-pre-deployment/application-insights.md) | 1 ঘন্টা | ⭐⭐ |
| **[অধ্যায় ৭: ট্রাবলশুটিং](docs/chapter-07-troubleshooting/README.md)** | ডিবাগ ও সমাধান | [সাধারণ সমস্যা](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md) &#124; [এআই সমস্যা](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ঘন্টা | ⭐⭐ |
| **[অধ্যায় ৮: প্রোডাকশন](docs/chapter-08-production/README.md)** | এন্টারপ্রাইজ প্যাটার্ন | [প্রোডাকশন অনুশীলন](docs/chapter-08-production/production-ai-practices.md) | 2-3 ঘন্টা | ⭐⭐⭐⭐ |
| **[🎓 ওয়ার্কশপ](workshop/README.md)** | হ্যান্ডস-অন ল্যাব | [ভূমিকা](workshop/docs/instructions/0-Introduction.md) &#124; [নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [যাচাইকরণ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [ডিকনস্ট্রাকশন](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [টিয়ারডাউন](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [সমাপ্তি](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ঘন্টা | ⭐⭐ |

**মোট কোর্স সময়কাল:** ~10-14 ঘন্টা | **দক্ষতার উন্নয়ন:** প্রারম্ভিক → উৎপাদন-সজ্জিত

---

## 📚 শেখার অধ্যায়সমূহ

*অভিজ্ঞতা স্তর ও লক্ষ্য অনুযায়ী আপনার শেখার পথ নির্বাচন করুন*

### 🚀 অধ্যায় ১: ভিত্তি ও দ্রুত শুরু
**প্রয়োজনীয়তা**: Azure সাবস্ক্রিপশন, বেসিক কমান্ড লাইন জ্ঞান  
**সময়কাল**: 30-45 মিনিট  
**কঠিনতা**: ⭐

#### আপনি যা শিখবেন
- Azure Developer CLI এর মৌলিক ধারণা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- আপনার প্রথম সফল ডিপ্লয়মেন্ট

#### শেখার সম্পদ
- **🎯 এখান থেকে শুরু করুন**: [Azure Developer CLI কি?](../..)
- **📖 তত্ত্ব**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - মূল ধারণা এবং শব্দাবলি
- **⚙️ সেটআপ**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট গাইড
- **🛠️ হ্যান্ডস-অন**: [Your First Project](docs/chapter-01-foundation/first-project.md) - ধাপে ধাপে টিউটোরিয়াল
- **📋 দ্রুত রেফারেন্স**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### ব্যবহারিক অনুশীলন
```bash
# দ্রুত ইনস্টলেশন পরীক্ষা
azd version

# আপনার প্রথম অ্যাপ্লিকেশন স্থাপন করুন
azd init --template todo-nodejs-mongo
azd up
```

**💡 অধ্যায় ফলাফল**: AZD ব্যবহার করে একটি সহজ ওয়েব অ্যাপ্লিকেশন Azure-এ সফলভাবে ডিপ্লয় করুন

**✅ সফলতা যাচাই:**
```bash
# অধ্যায় ১ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্প ইনিশিয়ালাইজ করে
azd up                  # Azure-এ ডিপ্লয় করে
azd show                # চলমান অ্যাপের URL প্রদর্শন করে
# অ্যাপ্লিকেশন ব্রাউজারে খোলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 সময় বিনিয়োগ:** 30-45 মিনিট  
**📈 এই পরবর্তী স্তর দক্ষতা:** মৌলিক অ্যাপ্লিকেশনগুলো স্বাধীনভাবে ডিপ্লয় করতে পারবেন

**✅ সফলতা যাচাই:**
```bash
# অধ্যায় ১ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্পটি আরম্ভ করে
azd up                  # Azure-এ মোতায়েন করে
azd show                # চলমান অ্যাপের URL দেখায়
# অ্যাপ্লিকেশন ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 সময় বিনিয়োগ:** 30-45 মিনিট  
**📈 এই পরবর্তী স্তর দক্ষতা:** মৌলিক অ্যাপ্লিকেশনগুলো স্বাধীনভাবে ডিপ্লয় করতে পারবেন

---

### 🤖 অধ্যায় ২: এআই-ফার্স্ট ডেভেলপমেন্ট (এআই ডেভেলপারদের জন্য সুপারিশকৃত)
**প্রয়োজনীয়তা**: অধ্যায় ১ সম্পন্ন  
**সময়কাল**: 1-2 ঘন্টা  
**কঠিনতা**: ⭐⭐

#### আপনি যা শিখবেন
- AZD সহ Microsoft Foundry ইন্টিগ্রেশন
- এআই-চালিত অ্যাপ্লিকেশন ডিপ্লয় করা
- এআই সার্ভিস কনফিগারেশন বোঝা

#### শেখার সম্পদ
- **🎯 এখান থেকে শুরু করুন**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 এআই এজেন্ট**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD দিয়ে ইন্টেলিজেন্ট এজেন্ট মোতায়েন করুন
- **📖 প্যাটার্ন**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - এআই মডেল ডিপ্লয় ও পরিচালনা
- **🛠️ ওয়ার্কশপ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার এআই সমাধানগুলো AZD-র জন্য প্রস্তুত করুন
- **🎥 ইন্টারেক্টিভ গাইড**: [Workshop Materials](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখা MkDocs * DevContainer Environment
- **📋 টেমপ্লেট**: [Microsoft Foundry Templates](../..)
- **📝 উদাহরণ**: [AZD Deployment Examples](examples/README.md)

#### ব্যবহারিক অনুশীলন
```bash
# আপনার প্রথম এআই অ্যাপ্লিকেশন ডিপ্লয় করুন
azd init --template azure-search-openai-demo
azd up

# অতিরিক্ত এআই টেমপ্লেটগুলি চেষ্টা করে দেখুন
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 অধ্যায় ফলাফল**: RAG সক্ষমতা সহ একটি এআই-চালিত চ্যাট অ্যাপ্লিকেশন ডিপ্লয় ও কনফিগার করুন

**✅ সফলতা যাচাই:**
```bash
# চ্যাপ্টার ২ পড়ার পরে, আপনি নিম্নলিখিত কাজগুলো করতে সক্ষম হওয়া উচিত:
azd init --template azure-search-openai-demo
azd up
# এআই চ্যাট ইন্টারফেস পরীক্ষা করুন
# প্রশ্ন করুন এবং উৎসসহ এআই-চালিত উত্তর পান
# যাচাই করুন যে সার্চ ইন্টিগ্রেশন কাজ করছে কি না
azd monitor  # Application Insights-এ টেলিমেট্রি দেখাচ্ছে কি না যাচাই করুন
azd down --force --purge
```

**📊 সময় বিনিয়োগ:** 1-2 ঘন্টা  
**📈 এই পরবর্তী স্তর দক্ষতা:** প্রোডাকশন-রেডি এআই অ্যাপ্লিকেশন ডিপ্লয় ও কনফিগার করতে পারবেন  
**💰 খরচ সচেতনতা:** $80-150/মাস ডেভ খরচ বোঝা, $300-3500/মাস প্রোডাকশন খরচ বোঝা

#### 💰 এআই ডিপ্লয়মেন্টের খরচ বিবেচনা

**ডেভেলপমেন্ট পরিবেশ (আনুমানিক $80-150/মাস):**
- Azure OpenAI (Pay-as-you-go): $0-50/মাস (টোকেন ব্যবহার অনুসারে)
- AI Search (Basic tier): $75/মাস
- Container Apps (Consumption): $0-20/মাস
- Storage (Standard): $1-5/মাস

**প্রোডাকশন পরিবেশ (আনুমানিক $300-3,500+/মাস):**
- Azure OpenAI (PTU for consistent performance): $3,000+/মাস OR Pay-as-go with high volume
- AI Search (Standard tier): $250/মাস
- Container Apps (Dedicated): $50-100/মাস
- Application Insights: $5-50/মাস
- Storage (Premium): $10-50/মাস

**💡 খরচ অপ্টিমাইজেশন টিপস:**
- শেখার জন্য **ফ্রি টিয়ার** Azure OpenAI ব্যবহার করুন (প্রতি মাসে 50,000 টোকেন অন্তর্ভুক্ত)
- সক্রিয়ভাবে ডেভেলপ না করলে রিসোর্সগুলো ডিলোকেট করতে `azd down` চালান
- শুরুতে consumption-based বিলিং ব্যবহার করুন, প্রোডাকশনের জন্য শুধু PTU-তে আপগ্রেড করুন
- ডিপ্লয়মেন্টের আগে খরচ অনুমান করতে `azd provision --preview` চালান
- অটো-স্কেলিং সক্ষম করুন: কেবল প্রকৃত ব্যবহারের জন্যই পেমেন্ট করুন

**খরচ মনিটরিং:**
```bash
# আনুমানিক মাসিক খরচ পরীক্ষা করুন
azd provision --preview

# Azure পোর্টালে প্রকৃত খরচ পর্যবেক্ষণ করুন
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ অধ্যায় ৩: কনফিগারেশন ও অথেনটিকেশন
**প্রয়োজনীয়তা**: অধ্যায় ১ সম্পন্ন  
**সময়কাল**: 45-60 মিনিট  
**কঠিনতা**: ⭐⭐

#### আপনি যা শিখবেন
- এনভায়রনমেন্ট কনফিগারেশন এবং ম্যানেজমেন্ট
- অথেনটিকেশন এবং নিরাপত্তার সেরা অনুশীলন
- রিসোর্স নামকরণ এবং সংগঠন

#### শেখার সম্পদ
- **📖 কনফিগারেশন**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - এনভায়রনমেন্ট সেটআপ
- **🔐 নিরাপত্তা**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - অথেনটিকেশন প্যাটার্ন
- **📝 উদাহরণ**: [Database App Example](examples/database-app/README.md) - AZD ডাটাবেস উদাহরণ

#### ব্যবহারিক অনুশীলন
- একাধিক এনভায়রনমেন্ট কনফিগার করা (dev, staging, prod)
- managed identity অথেনটিকেশন সেটআপ করা
- এনভায়রনমেন্ট-নির্দিষ্ট কনফিগারেশন বাস্তবায়ন করা

**💡 অধ্যায় ফলাফল**: উপযুক্ত অথেনটিকেশন ও নিরাপত্তা সহ একাধিক এনভায়রনমেন্ট পরিচালনা করুন

---

### 🏗️ অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট
**প্রয়োজনীয়তা**: অধ্যায় ১-৩ সম্পন্ন  
**সময়কাল**: 1-1.5 ঘন্টা  
**কঠিনতা**: ⭐⭐⭐

#### আপনি যা শিখবেন
- উন্নত ডিপ্লয়মেন্ট প্যাটার্ন
- Bicep দিয়ে Infrastructure as Code
- রিসোর্স প্রোভিশনিং কৌশল

#### শেখার সম্পদ
- **📖 ডিপ্লয়মেন্ট**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ ওয়ার্কফ্লো
- **🏗️ প্রোভিশনিং**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 উদাহরণ**: [Container App Example](../../examples/container-app) - কন্টেইনারাইজড ডিপ্লয়মেন্ট

#### ব্যবহারিক অনুশীলন
- কাস্টম Bicep টেমপ্লেট তৈরি করা
- মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করা
- ব্লু-গ্রীন ডিপ্লয়মেন্ট কৌশল বাস্তবায়ন করা

**💡 অধ্যায় ফলাফল**: কাস্টম ইনফ্রাস্ট্রাকচার টেমপ্লেট ব্যবহার করে জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন

---

### 🎯 অধ্যায় ৫: মাল্টি-এজেন্ট এআই সমাধান (উন্নত)
**প্রয়োজনীয়তা**: অধ্যায় ১-২ সম্পন্ন  
**সময়কাল**: 2-3 ঘন্টা  
**কঠিনতা**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্ন
- এজেন্ট অর্কেস্ট্রেশন ও সমন্বয়
- প্রোডাকশন-রেডি এআই ডিপ্লয়মেন্ট

#### শেখার সম্পদ
- **🤖 ফিচারড প্রজেক্ট**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - সম্পূর্ণ ইমপ্লিমেন্টেশন
- **🛠️ ARM টেমপ্লেট**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - এক-ক্লিক ডিপ্লয়মেন্ট
- **📖 স্থাপত্য**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - প্যাটার্নসমূহ

#### ব্যবহারিক অনুশীলন
```bash
# পূর্ণাঙ্গ খুচরা বহু-এজেন্ট সমাধান মোতায়েন করুন
cd examples/retail-multiagent-arm-template
./deploy.sh

# এজেন্ট কনফিগারেশনগুলো অন্বেষণ করুন
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 অধ্যায় ফলাফল**: কাস্টমার এবং ইনভেন্টরি এজেন্টসহ একটি প্রোডাকশন-রেডি মাল্টি-এজেন্ট এআই সমাধান ডিপ্লয় এবং পরিচালনা করুন

---

### 🔍 অধ্যায় ৬: প্রি-ডিপ্লয়মেন্ট যাচাইকরণ ও পরিকল্পনা
**প্রয়োজনীয়তা**: অধ্যায় ৪ সম্পন্ন  
**সময়কাল**: 1 ঘন্টা  
**কঠিনতা**: ⭐⭐

#### আপনি যা শিখবেন
- ক্ষমতা পরিকল্পনা এবং রিসোর্স যাচাইকরণ
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট চেক এবং অটোমেশন

#### শেখার সম্পদ
- **📊 পরিকল্পনা**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স যাচাইকরণ
- **💰 নির্বাচন**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - খরচ-কার্যকর পছন্দ
- **✅ যাচাইকরণ**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - স্বয়ংক্রিয় স্ক্রিপ্ট

#### ব্যবহারিক অনুশীলন
- ক্ষমতা যাচাই স্ক্রিপ্ট চালান
- খরচের জন্য SKU নির্বাচন অপ্টিমাইজ করুন
- অটোমেটেড প্রি-ডিপ্লয়মেন্ট চেক বাস্তবায়ন করুন

**💡 অধ্যায় ফলাফল**: বাস্তবায়নের আগে ডিপ্লয়মেন্টগুলো যাচাই এবং অপ্টিমাইজ করুন

---

### 🚨 অধ্যায় ৭: ট্রাবলশুটিং ও ডিবাগিং
**প্রয়োজনীয়তা**: যে কোনো ডিপ্লয়মেন্ট অধ্যায় সম্পন্ন  
**সময়কাল**: 1-1.5 ঘন্টা  
**কঠিনতা**: ⭐⭐

#### আপনি যা শিখবেন
- সিস্টেম্যাটিক ডিবাগিং অ্যাপ্রোচ
- সাধারণ সমস্যা ও সমাধান
- এআই-নির্দিষ্ট ট্রাবলশুটিং

#### শেখার সম্পদ
- **🔧 সাধারণ সমস্যা**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ ও সমাধান
- **🕵️ ডিবাগিং**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ধাপে ধাপে কৌশল
- **🤖 এআই সমস্যা**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - এআই সার্ভিস সমস্যাগুলি

#### ব্যবহারিক অনুশীলন
- ডিপ্লয়মেন্ট ব্যর্থতা নির্ণয় করা
- অথেনটিকেশন সমস্যা সমাধান করা
- এআই সার্ভিস সংযোগ সমস্যা ডিবাগ করা

**💡 অধ্যায় ফলাফল**: সাধারণ ডিপ্লয়মেন্ট সমস্যা স্বাধীনভাবে নির্ণয় ও সমাধান করতে পারবেন

---

### 🏢 অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন
**প্রয়োজনীয়তা**: অধ্যায় ১-৪ সম্পন্ন  
**সময়কাল**: 2-3 ঘন্টা  
**কঠিনতা**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- প্রোডাকশন ডিপ্লয়মেন্ট কৌশল
- এন্টারপ্রাইজ নিরাপত্তা প্যাটার্ন
- মনিটরিং ও খরচ অপ্টিমাইজেশন

#### শেখার সম্পদ
- **🏭 প্রোডাকশন**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্ন
- **📝 উদাহরণ**: [Microservices Example](../../examples/microservices) - জটিল আর্কিটেকচার
- **📊 মনিটরিং**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - মনিটরিং

#### ব্যবহারিক অনুশীলন
- এন্টারপ্রাইজ নিরাপত্তা প্যাটার্ন বাস্তবায়ন করুন
- ব্যাপক মনিটরিং সেটআপ করুন
- উপযুক্ত গভর্নেন্স সহ প্রোডাকশনে ডিপ্লয় করুন

**💡 অধ্যায় ফলাফল**: পূর্ণ প্রোডাকশন ক্ষমতাসহ এন্টারপ্রাইজ-রেডি অ্যাপ্লিকেশন ডিপ্লয় করুন

---

## 🎓 ওয়ার্কশপ ওভারভিউ: হ্যান্ডস-অন শেখার অভিজ্ঞতা

> **⚠️ ওয়ার্কশপ অবস্থা: সক্রিয় উন্নয়ন**
> ওয়ার্কশপ উপকরণ বর্তমানে তৈরি ও পরিশোধনের পর্যায়ে রয়েছে। মূল মডিউলগুলি কার্যকর, তবে কিছু উন্নত বিভাগ অসম্পূর্ণ। আমরা সক্রিয়ভাবে সমস্ত বিষয়বস্তুকে সম্পূর্ণ করার জন্য কাজ করছি। [অগ্রগতি ট্র্যাক করুন →](workshop/README.md)

### Interactive Workshop Materials
**ব্রাউজার-ভিত্তিক টুল এবং গাইডেড অনুশীলনের মাধ্যমে সংগঠিত হ্যান্ডস-অন লার্নিং**

আমাদের ওয়ার্কশপ উপকরণগুলি অধ্যায়ভিত্তিক পাঠ্যক্রমের পরিপূরক হিসেবে একটি কাঠামোবদ্ধ, ইন্টারেক্টিভ লার্নিং অভিজ্ঞতা প্রদান করে। ওয়ার্কশপটি স্ব-মুখী শেখার এবং প্রশিক্ষক-নেতৃত্বাধীন সেশন উভয়ের জন্য ডিজাইন করা হয়েছে।

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
ওয়ার্কশপটি একটি **৮-মডিউল ক্রমবর্ধমান পদ্ধতি** অনুসরণ করে যা আপনাকে আবিষ্কার থেকে ডিপ্লয়মেন্ট মাস্টারিতে নিয়ে যায়:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# বিকল্প ১: GitHub Codespaces (প্রস্তাবিত)
# রিপোজিটরিতে "Code" → "Create codespace on main" এ ক্লিক করুন

# বিকল্প ২: স্থানীয় ডেভেলপমেন্ট
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md এ সেটআপ নির্দেশাবলী অনুসরণ করুন
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop overview and objectives
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Deep Dive: AZD Capabilities

প্রাথমিক বিষয়গুলির বাইরে, AZD প্রোডাকশন ডিপ্লয়মেন্টের জন্য শক্তিশালী বৈশিষ্ট্য সরবরাহ করে:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD addresses the top challenges AI developers face:

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you're deploying AI applications!**

> **Note:** These templates demonstrate various AI patterns. Some are external Azure Samples, others are local implementations.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates mapped to learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (in this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples in this repository:**
- [**Container App Examples**](examples/container-app/README.md) - Complete guide to containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API with scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**Clone these Azure Samples repositories to get started:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectivity patterns
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML patterns

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Make your AI solutions AZD-deployable (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-module guided exercises with MkDocs and GitHub Codespaces
  - Follows: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Quick Troubleshooting Guide

**Common issues beginners face and immediate solutions:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# প্রথমে AZD ইনস্টল করুন
# উইন্ডোজ (PowerShell):
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
# উপলব্ধ সাবস্ক্রিপশন তালিকা করুন
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
<summary><strong>❌ "InsufficientQuota" বা "Quota exceeded"</strong></summary>

```bash
# ভিন্ন Azure অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION "westus2"
azd up

# অথবা ডেভেলপমেন্টে ছোটতর SKUs ব্যবহার করুন
# infra/main.parameters.json সম্পাদনা করুন:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" অর্ধপথে ব্যর্থ হয়</strong></summary>

```bash
# বিকল্প 1: পরিষ্কার করুন এবং পুনরায় চেষ্টা করুন
azd down --force --purge
azd up

# বিকল্প 2: শুধু অবকাঠামো ঠিক করুন
azd provision

# বিকল্প 3: বিস্তারিত অবস্থা পরীক্ষা করুন
azd show

# বিকল্প 4: Azure Monitor-এ লগগুলো পরীক্ষা করুন
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" বা "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" বা নামের দ্বন্দ্ব</strong></summary>

```bash
# AZD অনন্য নাম তৈরি করে, তবে সংঘর্ষ ঘটলে:
azd down --force --purge

# তারপর নতুন পরিবেশে পুনরায় চেষ্টা করুন
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Template deployment taking too long"</strong></summary>

**সাধারণ অপেক্ষার সময়:**
- সহজ ওয়েব অ্যাপ: 5-10 মিনিট
- ডাটাবেসযুক্ত অ্যাপ: 10-15 মিনিট
- AI অ্যাপ্লিকেশন: 15-25 মিনিট (OpenAI প্রোভিশনিং ধীর)

```bash
# অগ্রগতি পরীক্ষা করুন
azd show

# ৩০ মিনিটের বেশি আটকে থাকলে, Azure পোর্টাল পরীক্ষা করুন:
azd monitor
# ব্যর্থ ডেপ্লয়মেন্ট খুঁজুন
```
</details>

<details>
<summary><strong>❌ "Permission denied" বা "Forbidden"</strong></summary>

```bash
# আপনার Azure ভূমিকা পরীক্ষা করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# আপনার কাছে অন্তত "Contributor" ভূমিকা থাকা প্রয়োজন
# আপনার Azure অ্যাডমিনকে নিম্নলিখিত দিতে বলুন:
# - Contributor (রিসোর্সের জন্য)
# - User Access Administrator (ভূমিকা বরাদ্দের জন্য)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# সমস্ত সার্ভিস এন্ডপয়েন্ট দেখান
azd show

# অথবা Azure পোর্টাল খুলুন
azd monitor

# নির্দিষ্ট সার্ভিস পরীক্ষা করুন
azd env get-values
# *_URL ভেরিয়েবলগুলো খুঁজুন
```
</details>

### 📚 সম্পূর্ণ ট্রাবলশুটিং রিসোর্স

- **সাধারণ সমস্যা গাইড:** [বিস্তারিত সমাধান](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-নির্দিষ্ট সমস্যা:** [AI ট্রাবলশুটিং](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ডিবাগিং গাইড:** [ধাপে ধাপে ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md)
- **সহায়তা নিন:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 কোর্স সমাপ্তি ও সার্টিফিকেশন

### অগ্রগতি ট্র্যাকিং
প্রতিটি অধ্যায় ধরে আপনার শিক্ষার অগ্রগতি ট্র্যাক করুন:

- [ ] **অধ্যায় 1**: ভিত্তি ও দ্রুত শুরু ✅
- [ ] **অধ্যায় 2**: AI-প্রধান উন্নয়ন ✅  
- [ ] **অধ্যায় 3**: কনফিগারেশন ও প্রমাণীকরণ ✅
- [ ] **অধ্যায় 4**: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট ✅
- [ ] **অধ্যায় 5**: মাল্টি-এজেন্ট AI সমাধান ✅
- [ ] **অধ্যায় 6**: পূর্ব-ডিপ্লয়মেন্ট ভ্যালিডেশন ও পরিকল্পনা ✅
- [ ] **অধ্যায় 7**: ট্রাবলশুটিং ও ডিবাগিং ✅
- [ ] **অধ্যায় 8**: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন ✅

### শেখার যাচাই
প্রতিটি অধ্যায় শেষ করার পরে, আপনার জ্ঞান যাচাই করুনঃ
1. **ব্যবহারিক অনুশীলন**: অধ্যায়ের হ্যান্ডস-অন ডিপ্লয়মেন্ট সম্পন্ন করুন
2. **জ্ঞান যাচাইকরণ**: আপনার অধ্যায়ের FAQ বিভাগ পর্যালোচনা করুন
3. **কমিউনিটি আলোচনা**: Azure Discord-এ আপনার অভিজ্ঞতা শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরবর্তী জটিলতা স্তরে যান

### কোর্স সমাপ্তির সুবিধাসমূহ
সমস্ত অধ্যায় সম্পন্ন করার পর, আপনার থাকবে:
- **প্রোডাকশন অভিজ্ঞতা**: বাস্তব AI অ্যাপ্লিকেশনগুলো Azure-এ ডিপ্লয় করা
- **পেশাদার দক্ষতা**: এন্টারপ্রাইজ-রেডি ডিপ্লয়মেন্ট ক্ষমতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার উন্নয়ন**: চাহিদাসম্পন্ন AZD এবং AI ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি ও সাপোর্ট

### সহায়তা ও সাপোর্ট পান
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট করুন এবং ফিচার অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)
- **শেখার প্রশ্ন**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-নির্দিষ্ট সহায়তা**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ডকুমেন্টেশন**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**#Azure চ্যানেল থেকে সাম্প্রতিক জরিপ ফলাফল:**
- **45%** ডেভেলপার AI ওয়ার্কলোডের জন্য AZD ব্যবহার করতে চান
- **শীর্ষ চ্যালেঞ্জসমূহ**: মাল্টি-সার্ভিস ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ম্যানেজমেন্ট, প্রোডাকশন প্রস্তুততা  
- **সবচেয়ে অনুরোধকৃত**: AI-নির্দিষ্ট টেমপ্লেট, ট্রাবলশুটিং গাইড, সেরা অনুশীলনসমূহ

**আমাদের কমিউনিটিতে যোগ দিন যাতে আপনি:**
- আপনার AZD + AI অভিজ্ঞতা শেয়ার করুন এবং সহায়তা পান
- নতুন AI টেমপ্লেটগুলোর প্রাথমিক প্রিভিউ অ্যাক্সেস পান
- AI ডিপ্লয়মেন্টের সেরা অনুশীলনে অবদান রাখুন
- ভবিষ্যতের AI + AZD ফিচার ডেভেলপমেন্টে প্রভাব ফেলুন

### কোর্সে অবদান রাখা
আমরা অবদানকে স্বাগত জানাই! বিস্তারিত জানতে [Contributing Guide](CONTRIBUTING.md) পড়ুন:
- **বিষয়বস্তুর উন্নতি**: বিদ্যমান অধ্যায় এবং উদাহরণ উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব-জগতের দৃশ্যপট এবং টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহু-ভাষা সমর্থন বজায় রাখতে সাহায্য করুন
- **বাগ রিপোর্ট**: যথার্থতা এবং স্পষ্টতা উন্নত করুন
- **কমিউনিটি স্ট্যান্ডার্ড**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি নির্দেশিকা অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্পটি MIT লাইসেন্সের অধীনে লাইসেন্সপ্রাপ্ত - বিস্তারিত জানতে [LICENSE](../../LICENSE) ফাইল দেখুন।

### সম্পর্কিত Microsoft লার্নিং রিসোর্স

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ কোর্স নেভিগেশন

**🚀 শিখতে শুরু করতে প্রস্তুত?**

**নতুনদের**: শুরু করুন [অধ্যায় 1: ভিত্তি ও দ্রুত সূচনা](../..)  
**AI ডেভেলপাররা**: যান [অধ্যায় 2: AI-প্রথম উন্নয়ন](../..)  
**অভিজ্ঞ ডেভেলপাররা**: শুরু করুন [অধ্যায় 3: কনফিগারেশন ও প্রমাণীকরণ](../..)

**পরবর্তী পদক্ষেপ**: [অধ্যায় 1 শুরু করুন - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকারোক্তি:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত করা হয়েছে। আমরা যথাসম্ভব নির্ভুলতার চেষ্টা করি, তবে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার মূল ভাষায়ই কর্তৃত্বপ্রাপ্ত উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
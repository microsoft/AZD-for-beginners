# AZD For Beginners: একটি কাঠামোবদ্ধ শেখার যাত্রা

![AZD নবীনদের জন্য](../../translated_images/bn/azdbeginners.5527441dd9f74068.webp) 

[![GitHub পর্যবেক্ষক](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub স্টার](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### স্বয়ংক্রিয় অনুবাদ (সর্বদা আপ-টু-ডেট)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[আরবি](../ar/README.md) | [বাংলা](./README.md) | [বুলগেরিয়ান](../bg/README.md) | [বার্মিজ (মায়ানমার)](../my/README.md) | [চীনা (সরলীকৃত)](../zh-CN/README.md) | [চীনা (প্রথাগত, হংকং)](../zh-HK/README.md) | [চীনা (প্রথাগত, ম্যাকাও)](../zh-MO/README.md) | [চীনা (প্রথাগত, তাইওয়ান)](../zh-TW/README.md) | [ক্রোয়েশিয়ান](../hr/README.md) | [চেক](../cs/README.md) | [ড্যানিশ](../da/README.md) | [ডাচ](../nl/README.md) | [এস্তোনীয়](../et/README.md) | [ফিনিশ](../fi/README.md) | [ফরাসি](../fr/README.md) | [জার্মান](../de/README.md) | [গ্রিক](../el/README.md) | [হিবরু](../he/README.md) | [হিন্দি](../hi/README.md) | [হাঙ্গেরিয়ান](../hu/README.md) | [ইন্দোনেশীয়](../id/README.md) | [ইতালিয়ান](../it/README.md) | [জাপানি](../ja/README.md) | [কন্নড়](../kn/README.md) | [কোরিয়ান](../ko/README.md) | [লিথুয়ানীয়](../lt/README.md) | [মালয়](../ms/README.md) | [মালায়ালম](../ml/README.md) | [মারাঠি](../mr/README.md) | [নেপালি](../ne/README.md) | [নাইজেরিয়ান পিজিন](../pcm/README.md) | [নরওয়েজীয়](../no/README.md) | [পার্সি (ফার্সি)](../fa/README.md) | [পোলিশ](../pl/README.md) | [পর্তুগিজ (ব্রাজিল)](../pt-BR/README.md) | [পর্তুগিজ (পর্তুগাল)](../pt-PT/README.md) | [পাঞ্জাবি (গুরুমুখি)](../pa/README.md) | [রোমানিয়ান](../ro/README.md) | [রুশ](../ru/README.md) | [সার্বীয় (সিরিলিক)](../sr/README.md) | [স্লোভাক](../sk/README.md) | [স্লোভেনীয়](../sl/README.md) | [স্প্যানিশ](../es/README.md) | [স্বাহিলি](../sw/README.md) | [সুইডিশ](../sv/README.md) | [তাগালোগ (ফিলিপিনো)](../tl/README.md) | [তামিল](../ta/README.md) | [তেলুগু](../te/README.md) | [থাই](../th/README.md) | [তুর্কি](../tr/README.md) | [ইউক্রেনীয়](../uk/README.md) | [উর্দু](../ur/README.md) | [ভিয়েতনামী](../vi/README.md)

> **লোকালি ক্লোন করতে চান?**
>
> এই রেপোজিটরিতে 50+ ভাষার অনুবাদ রয়েছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
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
> This gives you everything you need to complete the course with a much faster download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 আজ azd-এ কী নতুন

Azure Developer CLI ঐতিহ্যগত ওয়েব অ্যাপ এবং API-র বাইরে বাড়িয়ে এসেছে। আজ, azd হল Azure-এ যেকোনো অ্যাপ্লিকেশন ডেপ্লয় করার একক টুল — এআই-চালিত অ্যাপ্লিকেশন এবং বুদ্ধিমান এজেন্টসহ।

এর অর্থ আপনার জন্য কী:

- **AI এজেন্টগুলো এখন azd-এর প্রথম-শ্রেণীর ওয়ার্কলোড।** আপনি একই `azd init` → `azd up` কর্মপ্রবাহ ব্যবহার করে AI এজেন্ট প্রকল্পগুলি ইনিশিয়ালাইজ, ডেপ্লয় এবং পরিচালনা করতে পারবেন।
- **Microsoft Foundry ইন্টিগ্রেশন** মডেল ডেপ্লয়মেন্ট, এজেন্ট হোস্টিং, এবং AI সার্ভিস কনফিগারেশন সরাসরি azd টেমপ্লেট ইকোসিস্টেমে নিয়ে আসে।
- **কোর কর্মপ্রবাহ অপরিবর্তিত আছে।** আপনি যদি একটি টুডো অ্যাপ, একটি মাইক্রোসার্ভিস, বা একটি মাল্টি-এজেন্ট AI সলিউশন ডেপ্লয় করেন, কমান্ডগুলো একই রকম।

আপনি যদি আগে azd ব্যবহার করে থাকেন, AI সমর্থন একটি স্বাভাবিক সম্প্রসারণ — আলাদা টুল বা একটি উন্নত ট্র্যাক নয়। যদি আপনি নতুন শুরু করেন, আপনি একটি কর্মপ্রবাহ শিখবেন যা সবকিছুর জন্য কাজ করে।

---

## 🚀 Azure Developer CLI (azd) কী?

**Azure Developer CLI (azd)** একটি ডেভেলপার-বন্ধুত্বপূর্ণ কমান্ড-লাইন টুল যা Azure-এ অ্যাপ্লিকেশন ডেপ্লয় করা সহজ করে তোলে। বহু Azure রিসোর্স ম্যানুয়ালি তৈরি ও সংযোগ করার বদলে, আপনি একক কমান্ডে পুরো অ্যাপ্লিকেশন ডেপ্লয় করতে পারবেন।

### `azd up` এর ম্যাজিক

```bash
# এই একক কমান্ড সব কিছু করে:
# ✅ সমস্ত Azure সম্পদ তৈরি করে
# ✅ নেটওয়ার্কিং এবং সুরক্ষা কনফিগার করে
# ✅ আপনার অ্যাপ্লিকেশন কোড তৈরি করে
# ✅ Azure তে ডিপ্লয় করে
# ✅ আপনাকে একটি কাজ করা URL দেয়
azd up
```

**এটাই!** Azure পোর্টালে ক্লিক করার দরকার নেই, কোনো জটিল ARM টেমপ্লেট প্রথমে শেখার দরকার নেই, কোনো ম্যানুয়াল কনফিগারেশন নেই — কেবল Azure-এ কাজ করা অ্যাপ্লিকেশনগুলো।

---

## ❓ Azure Developer CLI বনাম Azure CLI: পার্থক্যটা কী?

এটি নতুনদের সবচেয়ে সাধারণ প্রশ্ন। সহজ উত্তর নিচে:

| বৈশিষ্ট্য | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **উদ্দেশ্য** | একক Azure রিসোর্স পরিচালনা করা | সম্পূর্ণ অ্যাপ্লিকেশন ডেপ্লয় করা |
| **মনোভাব** | ইনফ্রাস্ট্রাকচার-কেন্দ্রিক | অ্যাপ্লিকেশন-কেন্দ্রিক |
| **উদাহরণ** | `az webapp create --name myapp...` | `azd up` |
| **শিখনের বাঁক** | Azure সার্ভিসগুলো জানা আবশ্যক | শুধু আপনার অ্যাপ জানা লাগবে |
| **উপযোগী** | DevOps, ইনফ্রাসট্রাকচার | ডেভেলপার, প্রোটোটাইপিং |

### সহজ তুলনা

- **Azure CLI** এমনভাবে সমস্ত সরঞ্জাম দেওয়ার মতো — হাতুড়ি, করাত, পেরেক। আপনি যেকোনো কিছুই বানাতে পারবেন, কিন্তু কনস্ট্রাকশন জানতে হবে।
- **Azure Developer CLI** এমনভাবে একজন কন্ট্রাক্টর নিয়োগ করার মতো — আপনি যা চান তা বর্ণনা করবেন, এবং তারা নির্মাণের কাজ করবে।

### কখন কোনটি ব্যবহার করবেন

| দৃশ্যাবলী | এইটি ব্যবহার করুন |
|----------|----------|
| "আমি দ্রুত আমার ওয়েব অ্যাপ ডেপ্লয় করতে চাই" | `azd up` |
| "আমাকে শুধু একটি স্টোরেজ অ্যাকাউন্ট তৈরি করতে হবে" | `az storage account create` |
| "আমি একটি পূর্ণ AI অ্যাপ্লিকেশন নির্মাণ করছি" | `azd init --template azure-search-openai-demo` |
| "আমাকে একটি নির্দিষ্ট Azure রিসোর্স ডিবাগ করতে হবে" | `az resource show` |
| "আমি মিনিটের মধ্যে প্রোডাকশন-রেডি ডেপ্লয় চাই" | `azd up --environment production` |

### তারা একসাথে কাজ করে!

AZD আন্ডার দ্য হুডে Azure CLI ব্যবহার করে। আপনি উভয় ব্যবহার করতে পারবেন:
```bash
# AZD দিয়ে আপনার অ্যাপ মোতায়েন করুন
azd up

# তারপর Azure CLI দিয়ে নির্দিষ্ট রিসোর্সগুলি সূক্ষ্ম-সেট করুন
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-এ টেমপ্লেট খুঁজুন

শূন্য থেকে শুরু করবেন না! **Awesome AZD** হল কমিউনিটির রেডি-টু-ডেপ্লয় টেমপ্লেট সংগ্রহ:

| রিসোর্স | বর্ণনা |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | এক-ক্লিকে ডেপ্লয়যোগ্য 200+ টেমপ্লেট ব্রাউজ করুন |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | আপনার নিজস্ব টেমপ্লেট কমিউনিটিতে আপলোড করুন |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | সোর্স স্টার করুন এবং এক্সপ্লোর করুন |

### Awesome AZD থেকে জনপ্রিয় AI টেমপ্লেট

```bash
# মাইক্রোসফ্ট ফাউন্ড্রি মডেল + এআই সার্চ সহ RAG চ্যাট
azd init --template azure-search-openai-demo

# দ্রুত এআই চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart

# ফাউন্ড্রি এজেন্ট সহ এআই এজেন্টস
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ধাপে শুরু করা

### ধাপ 1: AZD ইনস্টল করুন (2 মিনিট)

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

### ধাপ 2: Azure-এ লগইন করুন

```bash
azd auth login
```

### ধাপ 3: আপনার প্রথম অ্যাপ ডেপ্লয় করুন

```bash
# একটি টেমপ্লেট থেকে আরম্ভ করুন
azd init --template todo-nodejs-mongo

# Azure-এ মোতায়েন করুন (সবকিছু তৈরি করে!)
azd up
```

**🎉 এটাই!** আপনার অ্যাপ এখন Azure-এ লাইভ।

### পরিস্কার করা (ভুলবেন না!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 এই কোর্সটি কীভাবে ব্যবহার করবেন

এই কোর্সটি **ধাপে ধাপে শেখার** জন্য ডিজাইন করা হয়েছে — আপনি যেখানে স্বাচ্ছন্দ্যবোধ করেন সেখান থেকেই শুরু করে উপরে উঠে আসবেন:

| আপনার অভিজ্ঞতা | এখান থেকে শুরু করুন |
|-----------------|------------|
| **Azure-এ একদম নতুন** | [Chapter 1: Foundation](../..) |
| **Azure জানেন, AZD নতুন** | [Chapter 1: Foundation](../..) |
| **AI অ্যাপ ডেপ্লয় করতে চান** | [Chapter 2: AI-First Development](../..) |
| **হাতে কলমে অনুশীলন চান** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 ঘন্টার গাইডেড ল্যাব |
| **প্রোডাকশন প্যাটার্ন চাই** | [Chapter 8: Production & Enterprise](../..) |

### দ্রুত সেটআপ

1. **এই রেপোজিটরি ফর্ক করুন**: [![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ক্লোন করুন**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **সাহায্য নিন**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **লোকালি ক্লোন করতে চান?**
>
> এই রেপোজিটরিতে 50+ ভাষার অনুবাদ রয়েছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> This gives you everything you need to complete the course with a much faster download.


## কোর্স ওভারভিউ

সংরচিত অধ্যায়গুলোর মাধ্যমে Azure Developer CLI (azd) মাস্টার করুন, যা প্রগতিশীল শেখার জন্য ডিজাইন করা হয়েছে। **Microsoft Foundry ইন্টিগ্রেশন সহ AI অ্যাপ্লিকেশন ডেপ্লয়মেন্টে বিশেষ জোর।**

### কেন এই কোর্স আধুনিক ডেভেলপারদের জন্য অপরিহার্য

Microsoft Foundry Discord কমিউনিটির অন্তর্দৃষ্টির উপর ভিত্তি করে, **45% ডেভেলপার চান AZD ব্যবহার করে AI ওয়ার্কলোড** কিন্তু নিচের চ্যালেঞ্জগুলোর সম্মুখীন হন:
- জটিল মাল্টি-সার্ভিস AI আর্কিটেকচার
- প্রোডাকশনে AI ডেপ্লয়মেন্টের সেরা অনুশীলন  
- Azure AI সার্ভিস ইন্টিগ্রেশন এবং কনফিগারেশন
- AI ওয়ার্কলোডের জন্য খরচ অপ্টিমাইজেশন
- AI-নির্দিষ্ট ডেপ্লয়মেন্ট সমস্যার ট্রাবলশুটিং

### শেখার উদ্দেশ্য

এই কাঠামোবদ্ধ কোর্স সম্পন্ন করে আপনি:
- **AZD মৌলিকতে দক্ষতা অর্জন করবেন**: কোর ধারণা, ইনস্টলেশন, এবং কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডেপ্লয় করবেন**: AZD ব্যবহার করে Microsoft Foundry সার্ভিস ব্যবহার
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড বাস্তবায়ন করবেন**: Bicep টেমপ্লেট দিয়ে Azure রিসোর্স ম্যানেজ করা
- **ডেপ্লয়মেন্ট সমস্যা ডিবাগ করবেন**: সাধারণ সমস্যাগুলো সমাধান ও ডিবাগ করা
- **প্রোডাকশনের জন্য অপ্টিমাইজ করবেন**: সিকিউরিটি, স্কেলিং, মনিটরিং, এবং খরচ ব্যবস্থাপনা
- **মাল্টি-এজেন্ট সলিউশন নির্মাণ করবেন**: জটিল AI আর্কিটেকচার ডেপ্লয় করা

## 🗺️ কোর্স ম্যাপ: অধ্যায় অনুযায়ী দ্রুত নেভিগেশন

প্রতিটি অধ্যায়ের জন্য একটি নির্দিষ্ট README রয়েছে যার মধ্যে শেখার উদ্দেশ্য, দ্রুত শুরু গাইড, এবং অনুশীলন আছে:

| অধ্যায় | বিষয় | পাঠ | সময়কাল | জটিলতা |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | শুরু করা | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 মিনিট | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ঘণ্টা | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 মিনিট | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ঘণ্টা | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ঘণ্টা | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ঘন্টা | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ঘণ্টা | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 ঘণ্টা | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ঘণ্টা | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Learning Chapters

*আপনার অভিজ্ঞতা স্তর এবং লক্ষ্য অনুসারে শেখার পথ নির্বাচন করুন*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### What You'll Learn
- Azure Developer CLI এর মূল ধারণা বোঝা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- আপনার প্রথম সফল ডেপ্লয়মেন্ট

#### Learning Resources
- **🎯 Start Here**: [What is Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - মূল ধারণা এবং পরিভাষা
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট নির্দেশিকা
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - ধাপে ধাপে টিউটোরিয়াল
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# দ্রুত ইনস্টলেশন পরীক্ষা
azd version

# আপনার প্রথম অ্যাপ্লিকেশন ডিপ্লয় করুন
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: AZD ব্যবহার করে Azure তে একটি সহজ ওয়েব অ্যাপ সফলভাবে ডেপ্লয় করুন

**✅ Success Validation:**
```bash
# অধ্যায় ১ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্প আরম্ভ করে
azd up                  # Azure-এ ডিপ্লয় করে
azd show                # চলমান অ্যাপের URL দেখায়
# অ্যাপ্লিকেশন ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 Time Investment:** 30-45 মিনিট  
**📈 Skill Level After:** মৌলিক অ্যাপ্লিকেশন স্বতন্ত্রভাবে ডেপ্লয় করতে পারবে
**📈 Skill Level After:** মৌলিক অ্যাপ্লিকেশন স্বতন্ত্রভাবে ডেপ্লয় করতে পারবে

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 completed  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- AZD এর সাথে Microsoft Foundry ইন্টিগ্রেশন
- AI-চালিত অ্যাপ্লিকেশন ডেপ্লয় করা
- AI সার্ভিস কনফিগারেশন বোঝা

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD দিয়ে বুদ্ধিমান এজেন্ট ডেপ্লয় করুন
- **📖 Patterns**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - AI মডেল ডেপ্লয় এবং পরিচালনা
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলো AZD-র জন্য প্রস্তুত করুন
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer Environment সহ ব্রাউজার-ভিত্তিক শেখা
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# আপনার প্রথম এআই অ্যাপ্লিকেশন মোতায়েন করুন
azd init --template azure-search-openai-demo
azd up

# অতিরিক্ত এআই টেমপ্লেটগুলো ব্যবহার করে দেখুন
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: RAG ক্ষমতাসম্পন্ন একটি AI-চালিত চ্যাট অ্যাপ্লিকেশন ডেপ্লয় এবং কনফিগার করুন

**✅ Success Validation:**
```bash
# অধ্যায় ২-এর পরে, আপনি নিম্নলিখিত কাজগুলো করতে সক্ষম হবেন:
azd init --template azure-search-openai-demo
azd up
# AI চ্যাট ইন্টারফেস পরীক্ষা করুন
# প্রশ্ন করুন এবং সূত্রসহ AI-চালিত উত্তর পান
# সার্চ ইন্টিগ্রেশন কাজ করে কিনা যাচাই করুন
azd monitor  # Application Insights টেলিমেট্রি দেখায় কিনা যাচাই করুন
azd down --force --purge
```

**📊 Time Investment:** 1-2 ঘণ্টা  
**📈 Skill Level After:** প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডেপ্লয় এবং কনফিগার করতে পারবে  
**💰 Cost Awareness:** $80-150/মাস ডেভ খরচ, $300-3500/মাস প্রোডাকশন খরচ সম্পর্কে অবগত থাকুন

#### 💰 Cost Considerations for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/মাস (টোকেন ব্যবহারের উপর ভিত্তি করে)
- AI Search (Basic tier): $75/মাস
- Container Apps (Consumption): $0-20/মাস
- Storage (Standard): $1-5/মাস

**Production Environment (Estimated $300-3,500+/month):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/মাস OR উচ্চ ভলিউমে Pay-as-go
- AI Search (Standard tier): $250/মাস
- Container Apps (Dedicated): $50-100/মাস
- Application Insights: $5-50/মাস
- Storage (Premium): $10-50/মাস

**💡 Cost Optimization Tips:**
- শেখার জন্য Microsoft Foundry Models এর **Free Tier** ব্যবহার করুন (Azure OpenAI 50,000 tokens/মাস অন্তর্ভুক্ত)
- সক্রিয়ভাবে ডেভেলপ না করার সময় রিসোর্স ডিয়ালোকেট করতে `azd down` চালান
- প্রাথমিকভাবে consumption-ভিত্তিক বিলিং ব্যবহার করুন, প্রোডাকশনের জন্য কেবল PTU-তে আপগ্রেড করুন
- ডেপ্লয়মেন্টের আগে খরচ অনুমান করতে `azd provision --preview` ব্যবহার করুন
- অটো-স্কেলিং সক্রিয় করুন: শুধুমাত্র বাস্তব ব্যবহার অনুযায়ী পেমেন্ট করুন

**Cost Monitoring:**
```bash
# আনুমানিক মাসিক খরচ পরীক্ষা করুন
azd provision --preview

# Azure পোর্টালে প্রকৃত খরচ পর্যবেক্ষণ করুন
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: Chapter 1 completed  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### What You'll Learn
- এনভায়রনমেন্ট কনফিগারেশন এবং ব্যবস্থাপনা
- অথেন্টিকেশন এবং সিকিউরিটি সেরা অনুশীলন
- রিসোর্স নেমিং এবং সংগঠন

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - এনভায়রনমেন্ট সেটআপ
- **🔐 Security**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - অথেন্টিকেশন প্যাটার্ন
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD ডাটাবেস উদাহরণ

#### Practical Exercises
- একাধিক এনভায়রনমেন্ট কনফিগার করুন (dev, staging, prod)
- managed identity অথেন্টিকেশন সেট আপ করুন
- এনভায়রনমেন্ট-নির্দিষ্ট কনফিগারেশন বাস্তবায়ন করুন

**💡 Chapter Outcome**: সঠিক অথেন্টিকেশন এবং সিকিউরিটির সাথে একাধিক এনভায়রনমেন্ট পরিচালনা করুন

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- উন্নত ডেপ্লয়মেন্ট প্যাটার্ন
- Bicep দিয়ে Infrastructure as Code
- রিসোর্স প্রোভিশনিং কৌশল

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ ওয়ার্কফ্লো
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 Examples**: [Container App Example](../../examples/container-app) - কনটেইনারাইজড ডেপ্লয়মেন্ট

#### Practical Exercises
- কাস্টম Bicep টেমপ্লেট তৈরি করুন
- মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডেপ্লয় করুন
- blue-green ডেপ্লয়মেন্ট কৌশল বাস্তবায়ন করুন

**💡 Chapter Outcome**: কাস্টম ইনফ্রাসট্রাকচার টেমপ্লেট ব্যবহার করে জটিল মাল্টি-সার্ভিস অ্যাপ্লিকেশন ডেপ্লয় করুন

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্ন
- এজেন্ট অর্কেস্ট্রেশন এবং সমন্বয়
- প্রোডাকশন-রেডি AI ডেপ্লয়মেন্ট

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - সম্পূর্ণ ইমপ্লিমেন্টেশন
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - এক-ক্লিক ডেপ্লয়মেন্ট
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - প্যাটার্নসমূহ

#### Practical Exercises
```bash
# সম্পূর্ণ খুচরা বহু-এজেন্ট সমাধান স্থাপন করুন
cd examples/retail-multiagent-arm-template
./deploy.sh

# এজেন্ট কনফিগারেশনগুলো অন্বেষণ করুন
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Customer এবং Inventory এজেন্টসহ একটি প্রোডাকশন-রেডি মাল্টি-এজেন্ট AI সলিউশন ডেপ্লয় এবং পরিচালনা করুন

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- ক্যাপাসিটি প্ল্যানিং এবং রিসোর্স ভ্যালিডেশন
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট চেক এবং অটোমেশন

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স ভ্যালিডেশন
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - খরচ-সচেতন পছন্দ
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - অটোমেটেড স্ক্রিপ্ট

#### Practical Exercises
- ক্যাপাসিটি ভ্যালিডেশন স্ক্রিপ্ট চালান
- খরচের জন্য SKU নির্বাচন অপ্টিমাইজ করুন
- অটোমেটেড প্রি-ডেপ্লয়মেন্ট চেক বাস্তবায়ন করুন

**💡 Chapter Outcome**: কার্যকর বাস্তবায়নের আগে ডেপ্লয়মেন্টগুলো ভ্যালিডেট এবং অপ্টিমাইজ করুন

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- সিস্টেম্যাটিক ডিবাগিং পদ্ধতি
- সাধারণ সমস্যা এবং সমাধান
- AI-নির্দিষ্ট ট্রাবলশুটিং

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ এবং সমাধান
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ধাপে ধাপে কৌশল
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI সার্ভিস সমস্যা

#### Practical Exercises
- ডেপ্লয়মেন্ট ফেইলিওর নির্ণয় করুন
- অথেন্টিকেশন সমস্যা সমাধান করুন
- AI সার্ভিস সংযোগের ডিবাগিং করুন

**💡 Chapter Outcome**: সাধারণ ডেপ্লয়মেন্ট সমস্যা স্বাধীনভাবে নির্ণয় এবং সমাধান করতে পারবেন

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- প্রোডাকশন ডেপ্লয়মেন্ট কৌশল
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন
- মনিটরিং এবং খরচ অপ্টিমাইজেশন
- **🏭 প্রোডাকশন**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্নসমূহ
- **📝 উদাহরণসমূহ**: [Microservices Example](../../examples/microservices) - জটিল আর্কিটেকচারসমূহ
- **📊 মনিটরিং**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - মনিটরিং

#### ব্যবহারিক অনুশীলন
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন বাস্তবায়ন করুন
- ব্যাপক মনিটরিং সেটআপ করুন
- উপযুক্ত গভর্ন্যান্স সহ প্রোডাকশনে ডিপ্লয় করুন

**💡 অধ্যায়ের ফলাফল**: সম্পূর্ণ প্রোডাকশন সক্ষমতা সহ এন্টারপ্রাইজ-রেডি অ্যাপ্লিকেশন ডিপ্লয় করুন

---

## 🎓 ওয়ার্কশপের সারসংক্ষেপ: হাতে-কলমে শেখার অভিজ্ঞতা

> **⚠️ ওয়ার্কশপ অবস্থা: সক্রিয় উন্নয়ন**  
> ওয়ার্কশপ উপকরণগুলো বর্তমানে তৈরি ও পরিমার্জিত হচ্ছে। কোর মডিউলগুলো কার্যকর আছে, কিন্তু কিছু উন্নত অংশ অসম্পূর্ণ রয়েছে। আমরা সক্রিয়ভাবে সব বিষয়বস্তু সম্পূর্ণ করার জন্য কাজ করছি। [অগ্রগতি ট্র্যাক করুন →](workshop/README.md)

### ইন্টারঅ্যাকটিভ ওয়ার্কশপ উপকরণ
**ব্রাউজার-ভিত্তিক টুল এবং নির্দেশিত অনুশীলনের মাধ্যমে ব্যাপক হাতে-কলমে শেখা**

আমাদের ওয়ার্কশপ উপকরণগুলি একটি কাঠামোবদ্ধ, ইন্টারঅ্যাকটিভ শেখার অভিজ্ঞতা প্রদান করে যা উপরোক্ত অধ্যায়ভিত্তিক পাঠ্যক্রমকে সম্পূরক করে। ওয়ার্কশপটি স্ব-গতি শিক্ষার পাশাপাশি প্রশিক্ষক-নেতৃত্বাধীন সেশনের জন্য ডিজাইন করা হয়েছে।

#### 🛠️ ওয়ার্কশপ বৈশিষ্ট্যসমূহ
- **ব্রাউজার-ভিত্তিক ইন্টারফেস**: সার্চ, কপি, এবং থিম ফিচারের সাথে সম্পূর্ণ MkDocs-চালিত ওয়ার্কশপ
- **GitHub Codespaces ইন্টিগ্রেশন**: এক-ক্লিকে ডেভেলপমেন্ট পরিবেশ সেটআপ
- **গঠনমূলক শেখার পথ**: ৮-মডিউল নির্দেশিত অনুশীলন (মোট ৩-৪ ঘন্টা)
- **প্রগতিশীল পদ্ধতি**: পরিচয় → নির্বাচন → যাচাইকরণ → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → টিয়ারডাউন → সমাপ্তি
- **ইন্টারঅ্যাকটিভ DevContainer এনভায়রনমেন্ট**: পূর্ব-কনফিগার্ড টুল এবং নির্ভরতাসমূহ

#### 📚 ওয়ার্কশপ মডিউল কাঠামো
ওয়ার্কশপটি একটি **৮-মডিউল প্রগতিশীল পদ্ধতি** অনুসরণ করে যা আপনাকে আবিষ্কার থেকে ডিপ্লয়মেন্ট দক্ষতায় নিয়ে যায়:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | ওয়ার্কশপ ওভারভিউ | শেখার উদ্দেশ্য, পূর্বশর্ত, এবং ওয়ার্কশপ কাঠামো বোঝুন | 15 মিনিট |
| **1. Selection** | টেমপ্লেট আবিষ্কার | AZD টেমপ্লেট অন্বেষণ করুন এবং আপনার পরিস্থিতির জন্য সঠিক AI টেমপ্লেট নির্বাচন করুন | 20 মিনিট |
| **2. Validation** | Deploy & Verify | টেমপ্লেটটি `azd up` ব্যবহার করে ডিপ্লয় করুন এবং অবকাঠামো সঠিকভাবে কাজ করছে কি না যাচাই করুন | 30 মিনিট |
| **3. Deconstruction** | কাঠামো বোঝা | GitHub Copilot ব্যবহার করে টেমপ্লেট আর্কিটেকচার, Bicep ফাইল, এবং কোড সংগঠন অন্বেষণ করুন | 30 মিনিট |
| **4. Configuration** | azure.yaml গভীর বিশ্লেষণ | `azure.yaml` কনফিগারেশন, lifecycle hooks, এবং environment variables দক্ষভাবে জানুন | 30 মিনিট |
| **5. Customization** | আপনার মতো করে সাজান | AI Search, ট্রেসিং, ইভ্যালুয়েশন সক্ষম করুন এবং আপনার পরিস্থিতির জন্য কাস্টমাইজ করুন | 45 মিনিট |
| **6. Teardown** | পরিষ্কার করা | `azd down --purge` ব্যবহার করে নিরাপদে রিসোর্সসমূহ ডিপ্রভিশন করুন | 15 মিনিট |
| **7. Wrap-up** | পরবর্তী পদক্ষেপ | অর্জিত বিষয়বস্তু, মূল ধারণা পর্যালোচনা করুন এবং শেখার যাত্রা চালিয়ে যান | 15 মিনিট |

**ওয়ার্কশপ প্রবাহ:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ওয়ার্কশপ শুরু করা
```bash
# বিকল্প ১: GitHub Codespaces (প্রস্তাবিত)
# রিপোজিটরিতে "Code" → "Create codespace on main"-এ ক্লিক করুন

# বিকল্প ২: স্থানীয় ডেভেলপমেন্ট
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md-এ সেটআপ নির্দেশাবলী অনুসরণ করুন
```

#### 🎯 ওয়ার্কশপ শেখার ফলাফল
ওয়ার্কশপ সম্পন্ন করলে অংশগ্রহণকারীরা:
- **প্রোডাকশন AI অ্যাপ্লিকেশন ডিপ্লয় করুন**: Microsoft Foundry সার্ভিসগুলোর সাথে AZD ব্যবহার করুন
- **বহু-এজেন্ট আর্কিটেকচারে দক্ষতা অর্জন করুন**: সমন্বিত AI এজেন্ট সমাধান বাস্তবায়ন করুন
- **সুরক্ষার সেরা অনুশীলন বাস্তবায়ন করুন**: অথেনটিকেশন এবং অ্যাক্সেস কন্ট্রোল কনফিগার করুন
- **স্কেলের জন্য অপ্টিমাইজ করুন**: খরচ-কার্যকর ও কার্যক্ষম ডেপ্লয়মেন্ট ডিজাইন করুন
- **ডিপ্লয়মেন্টসমূহ ডিবাগ করুন**: সাধারণ সমস্যাগুলো স্বতন্ত্রভাবে সমাধান করুন

#### 📖 ওয়ার্কশপ সম্পদ
- **🎥 ইন্টারঅ্যাকটিভ গাইড**: [Workshop Materials](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখার পরিবেশ
- **📋 মডিউল-বাই-মডিউল নির্দেশাবলী**:
  - [0. পরিচিতি](workshop/docs/instructions/0-Introduction.md) - ওয়ার্কশপ ওভারভিউ ও উদ্দেশ্য
  - [1. নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) - AI টেমপ্লেট খুঁজে বের করুন ও নির্বাচন করুন
  - [2. যাচাইকরণ](workshop/docs/instructions/2-Validate-AI-Template.md) - টেমপ্লেট ডিপ্লয় ও যাচাই করুন
  - [3. বিশ্লেষণ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - টেমপ্লেট আর্কিটেকচার অন্বেষণ করুন
  - [4. কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` দক্ষতা অর্জন করুন
  - [5. কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) - আপনার পরিস্থিতির জন্য কাস্টমাইজ করুন
  - [6. টিয়ারডাউন](workshop/docs/instructions/6-Teardown-Infrastructure.md) - রিসোর্সসমূহ পরিষ্কার করুন
  - [7. সমাপ্তি](workshop/docs/instructions/7-Wrap-up.md) - রিভিউ এবং পরবর্তী পদক্ষেপ
- **🛠️ AI ওয়ার্কশপ ল্যাব**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-কেন্দ্রিক অনুশীলনসমূহ
- **💡 কুইক স্টার্ট**: [Workshop Setup Guide](workshop/README.md#quick-start) - পরিবেশ কনফিগারেশন

**উপযুক্ত:** কর্পোরেট প্রশিক্ষণ, বিশ্ববিদ্যালয় কোর্স, স্ব-গতি শেখা, এবং ডেভেলপার বুটক্যাম্প।

---

## 📖 গভীর বিশ্লেষণ: AZD সক্ষমতা

মূল বিষয়গুলোর বাইরে, AZD প্রোডাকশন ডিপ্লয়মেন্টের জন্য শক্তিশালী ফিচার সরবরাহ করে:

- **টেমপ্লেট-ভিত্তিক ডেপ্লয়মেন্ট** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নগুলোর জন্য প্রি-বিল্ট টেমপ্লেট ব্যবহার করুন
- **কোড হিসেবে অবকাঠামো** - Bicep বা Terraform ব্যবহার করে Azure রিসোর্স পরিচালনা করুন  
- **ইন্টিগ্রেটেড ওয়ার্কফ্লো** - নির্বিঘ্নে প্রভিশন, ডিপ্লয়, এবং অ্যাপ্লিকেশন মনিটর করুন
- **ডেভেলপার-বন্ধুভাবাপন্ন** - ডেভেলপারের উৎপাদনশীলতা ও অভিজ্ঞতার জন্য অপ্টিমাইজড

### **AZD + Microsoft Foundry: AI ডিপ্লয়মেন্টের জন্য উপযুক্ত**

**কেন AZD AI সমাধানের জন্য?** AZD AI ডেভেলপারদের যে প্রধান চ্যালেঞ্জগুলো রয়েছে সেগুলো মোকাবিলা করে:

- **AI-রেডি টেমপ্লেট** - Microsoft Foundry Models, Cognitive Services, এবং ML ওয়ার্কলোডের জন্য পূর্ব-কনফিগার্ড টেমপ্লেট
- **নিরাপদ AI ডেপ্লয়মেন্ট** - AI সার্ভিস, API কী, এবং মডেল এন্ডপয়েন্টের জন্য বিল্ট-ইন সিকিউরিটি প্যাটার্নসমূহ  
- **প্রোডাকশন AI প্যাটার্ন** - স্কেলযোগ্য, খরচ-কার্যকর AI অ্যাপ্লিকেশন ডেপ্লয়মেন্টের সেরা অনুশীলনসমূহ
- **এন্ড-টু-এন্ড AI ওয়ার্কফ্লো** - মডেল ডেভেলপমেন্ট থেকে প্রোডাকশন ডিপ্লয়মেন্ট পর্যন্ত উপযুক্ত মনিটরিং সহ
- **খরচ অপ্টিমাইজেশন** - AI ওয়ার্কলোডের জন্য স্মার্ট রিসোর্স বরাদ্দ এবং স্কেলিং কৌশলসমূহ
- **Microsoft Foundry ইন্টিগ্রেশন** - Microsoft Foundry মডেল ক্যাটালগ এবং এন্ডপয়েন্টগুলোর সাথে নির্বিঘ্ন কানেকশন

---

## 🎯 টেমপ্লেট ও উদাহরণ লাইব্রেরি

### হাইলাইট: Microsoft Foundry টেমপ্লেট
**আপনি যদি AI অ্যাপ্লিকেশন ডিপ্লয় করছেন তাহলে এখান থেকে শুরু করুন!**

> **নোট:** এই টেমপ্লেটগুলো বিভিন্ন AI প্যাটার্ন প্রদর্শন করে। কিছু বাহ্যিক Azure Samples, অন্যগুলো লোকাল ইমপ্লিমেন্টেশন।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | বহিরাগত |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | অধ্যায় 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| বহিরাগত |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | বহিরাগত |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | বহিরাগত |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | বহিরাগত |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | বহিরাগত |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | অধ্যায় 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **স্থানীয়** |

### হাইলাইট: সম্পূর্ণ শেখার সিনারিওগুলি
**শেখার অধ্যায়গুলোর সাথে মানানসই প্রোডাকশন-রেডি অ্যাপ্লিকেশন টেমপ্লেটগুলি**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় 2 | ⭐ | মৌলিক AI ডেপ্লয়মেন্ট প্যাটার্নসমূহ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় 2 | ⭐⭐ | Azure AI Search দিয়ে RAG বাস্তবায়ন |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | অধ্যায় 4 | ⭐⭐ | Document Intelligence ইন্টিগ্রেশন |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় 5 | ⭐⭐⭐ | এজেন্ট ফ্রেমওয়ার্ক এবং ফাংশন কলিং |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় 8 | ⭐⭐⭐ | এন্টারপ্রাইজ AI অর্কেস্ট্রেশন |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | অধ্যায় 5 | ⭐⭐⭐⭐ | কাস্টমার এবং ইনভেন্টরি এজেন্টসহ মাল্টি-এজেন্ট আর্কিটেকচার |

### উদাহরণ ধরনভিত্তিক শেখা

> **📌 লোকাল বনাম বহিরাগত উদাহরণ:**  
> **লোকাল উদাহরণ** (এই রেপোতে) = তৎক্ষণাৎ ব্যবহারযোগ্য  
> **বহিরাগত উদাহরণ** (Azure Samples) = লিঙ্ককৃত রেপোজিটরি থেকে ক্লোন করুন

#### লোকাল উদাহরণ (তৎক্ষণাৎ ব্যবহারযোগ্য)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM টেমপ্লেটসহ সম্পূর্ণ প্রোডাকশন-রেডি ইমপ্লিমেন্টেশন
  - মাল্টি-এজেন্ট আর্কিটেকচার (কাস্টমার + ইনভেন্টরি এজেন্ট)
  - ব্যাপক মনিটরিং ও মূল্যায়ন
  - ARM টেমপ্লেটের মাধ্যমে এক-ক্লিক ডেপ্লয়মেন্ট

#### লোকাল উদাহরণ - কনটেইনার অ্যাপ্লিকেশন (অধ্যায় 2-5)
**এই রেপোজিটরিতে ব্যাপক কনটেইনার ডেপ্লয়মেন্ট উদাহরণসমূহ:**
- [**Container App Examples**](examples/container-app/README.md) - কনটেইনারাইজড ডেপ্লয়মেন্টের সম্পূর্ণ গাইড
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - স্কেল-টু-জিরো সমেত মৌলিক REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডেপ্লয়মেন্ট
  - কুইক স্টার্ট, প্রোডাকশন, এবং উন্নত ডেপ্লয়মেন্ট প্যাটার্ন
  - মনিটরিং, সিকিউরিটি, এবং খরচ অপ্টিমাইজেশন নির্দেশনা

#### বহিরাগত উদাহরণ - সহজ অ্যাপ্লিকেশন (অধ্যায় 1-2)
**শুরু করার জন্য এই Azure Samples রেপোজিটরিগুলো ক্লোন করুন:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - মৌলিক ডেপ্লয়মেন্ট প্যাটার্ন
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - স্ট্যাটিক কনটেন্ট ডেপ্লয়মেন্ট
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ডেপ্লয়মেন্ট

#### বহিরাগত উদাহরণ - ডাটাবেস ইন্টিগ্রেশন (অধ্যায় 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ডাটাবেস কানেক্টিভিটি প্যাটার্ন
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - সার্ভারলেস ডেটা ওয়ার্কফ্লো

#### বহিরাগত উদাহরণ - উন্নত প্যাটার্ন (অধ্যায় 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - মাল্টি-সার্ভিস আর্কিটেকচার
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ব্যাকগ্রাউন্ড প্রসেসিং  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - প্রোডাকশন-রেডি ML প্যাটার্ন

### বাহ্যিক টেমপ্লেট সংগ্রহ
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - অফিসিয়াল ও কমিউনিটি টেমপ্লেটের কিউরেটেড সংগ্রহ
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn টেমপ্লেট ডকুমেন্টেশন
- [**Examples Directory**](examples/README.md) - লোকাল শেখার উদাহরণসমূহ বিশদ ব্যাখ্যার সাথে

---

## 📚 শেখার সম্পদ ও রেফারেন্স

### দ্রুত রেফারেন্স
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - অধ্যায় অনুসারে সংগঠিত গুরুত্বপূর্ণ azd কমান্ডসমূহ
- [**Glossary**](resources/glossary.md) - Azure এবং azd টার্মিনোলজি  
- [**FAQ**](resources/faq.md) - শেখার অধ্যায় অনুযায়ী সংগঠিত সাধারণ প্রশ্নসমূহ
- [**Study Guide**](resources/study-guide.md) - বিস্তৃত অনুশীলন কার্যক্রম

### হাতে-কলমে কর্মশালা
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলোকে AZD-ডিপ্লয়েবল করুন (২-৩ ঘন্টা)
- [**Interactive Workshop**](workshop/README.md) - MkDocs এবং GitHub Codespaces সহ ৮-মডিউল নির্দেশিত অনুশীলন
  - অনুসরণ করে: পরিচয় → নির্বাচন → যাচাইকরণ → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → টিয়ারডাউন → সমাপ্তি

### বহিরাগত শেখার সম্পদ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure আর্কিটেকচার সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure মূল্য নির্ধারণ ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)
- [Azure স্ট্যাটাস](https://status.azure.com/)

### আপনার এডিটারের জন্য AI এজেন্ট দক্ষতা
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, ডিপ্লয়মেন্ট, ডায়াগনস্টিকস, খরচ অপ্টিমাইজেশন, এবং আরও বিভিন্ন ক্ষেত্রে 37টি খোলা এজেন্ট দক্ষতা। এগুলো GitHub Copilot, Cursor, Claude Code, বা যেকোনো সমর্থিত এজেন্টে ইনস্টল করুন:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 দ্রুত ট্রাবলশুটিং গাইড

**নতুনদের সাধারণ সমস্যাসমূহ এবং তাৎক্ষণিক সমাধান:**

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
# উপলব্ধ সাবস্ক্রিপশনগুলো দেখান
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
# ভিন্ন Azure অঞ্চল ব্যবহার করে দেখুন
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
# বিকল্প 1: পরিষ্কার করে পুনরায় চেষ্টা করুন
azd down --force --purge
azd up

# বিকল্প 2: শুধু অবকাঠামো ঠিক করুন
azd provision

# বিকল্প 3: বিস্তারিত স্থিতি যাচাই করুন
azd show

# বিকল্প 4: Azure Monitor-এ লগ পরীক্ষা করুন
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# পুনরায় প্রমাণীকরণ করুন
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
# AZD অনন্য নাম তৈরি করে, কিন্তু সংঘর্ষ হলে:
azd down --force --purge

# তাহলে নতুন পরিবেশে পুনরায় চেষ্টা করুন
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ টেমপ্লেট ডিপ্লয়মেন্ট বেশি সময় নিচ্ছে</strong></summary>

**স্বাভাবিক অপেক্ষার সময়:**
- সরল ওয়েব অ্যাপ: 5-10 minutes
- ডাটাবেসসহ অ্যাপ: 10-15 minutes
- AI অ্যাপ্লিকেশন: 15-25 minutes (OpenAI প্রোভিশনিং ধীর)

```bash
# অগ্রগতি পরীক্ষা করুন
azd show

# যদি 30 মিনিটের বেশি আটকে থাকেন, Azure পোর্টাল পরীক্ষা করুন:
azd monitor
# ব্যর্থ ডিপ্লয়মেন্টগুলো খুঁজে দেখুন
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# আপনার Azure ভূমিকা পরীক্ষা করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# আপনার অন্তত "Contributor" ভূমিকা থাকতে হবে
# আপনার Azure অ্যাডমিনকে অনুরোধ করুন নিম্নলিখিত প্রদান করতে:
# - Contributor (রিসোর্সের জন্য)
# - User Access Administrator (ভূমিকা বরাদ্দের জন্য)
```
</details>

<details>
<summary><strong>❌ ডিপ্লয় করা অ্যাপ্লিকেশনের URL খুঁজে পাচ্ছি না</strong></summary>

```bash
# সমস্ত সার্ভিস এন্ডপয়েন্ট দেখান
azd show

# অথবা Azure পোর্টাল খুলুন
azd monitor

# নির্দিষ্ট সার্ভিস পরীক্ষা করুন
azd env get-values
# *_URL ভ্যারিয়েবলগুলি খুঁজুন
```
</details>

### 📚 সম্পূর্ণ ট্রাবলশুটিং রিসোর্স

- **সাধারণ সমস্যা গাইড:** [বিস্তারিত সমাধান](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-সংক্রান্ত সমস্যাসমূহ:** [AI ট্রাবলশুটিং](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ডিবাগিং গাইড:** [ধাপে ধাপে ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md)
- **সহায়তা নিন:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 কোর্স সমাপ্তি ও সার্টিফিকেশন

### অগ্রগতির ট্র্যাকিং
প্রতিটি অধ্যায়ে আপনার শেখার অগ্রগতি ট্র্যাক করুন:

- [ ] **অধ্যায় 1**: ভিত্তি ও দ্রুত শুরু ✅
- [ ] **অধ্যায় 2**: AI-প্রথম ডেভেলপমেন্ট ✅  
- [ ] **অধ্যায় 3**: কনফিগারেশন ও অথেনটিকেশন ✅
- [ ] **অধ্যায় 4**: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট ✅
- [ ] **অধ্যায় 5**: মাল্টি-এজেন্ট AI সমাধান ✅
- [ ] **অধ্যায় 6**: প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন ও পরিকল্পনা ✅
- [ ] **অধ্যায় 7**: ট্রাবলশুটিং ও ডিবাগিং ✅
- [ ] **অধ্যায় 8**: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস ✅

### শেখার যাচাই
প্রতিটি অধ্যায় সম্পন্ন করার পরে, আপনার জ্ঞান যাচাই করুন:
1. **প্রায়োগিক অনুশীলন**: অধ্যায়ের হ্যান্ডস-অন ডিপ্লয়মেন্ট সম্পন্ন করুন
2. **জ্ঞান যাচাই**: আপনার অধ্যায়ের FAQ অংশ পর্যালোচনা করুন
3. **কমিউনিটি আলোচনা**: Azure Discord-এ আপনার অভিজ্ঞতা শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরের জটিলতার স্তরে যান

### কোর্স সমাপ্তির সুবিধাসমূহ
সমস্ত অধ্যায় সমাপ্ত করলে, আপনার কাছে থাকবে:
- **প্রোডাকশন অভিজ্ঞতা**: বাস্তব AI অ্যাপ্লিকেশনগুলো Azure-এ ডিপ্লয় করা
- **পেশাদার দক্ষতা**: এন্টারপ্রাইজ-উপযোগী ডিপ্লয়মেন্ট দক্ষতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার উন্নয়ন**: চাহিদাসম্পন্ন AZD এবং AI ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি ও সাপোর্ট

### সহায়তা ও সাপোর্ট পান
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট করুন এবং ফিচার অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)
- **শিক্ষণ সংক্রান্ত প্রশ্ন**: [Microsoft Azure Discord কমিউনিটি](https://discord.gg/microsoft-azure) এবং [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-সংক্রান্ত সহায়তা**: যোগ দিন the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ডকুমেন্টেশন**: [অফিশিয়াল Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**#Azure চ্যানেল থেকে সাম্প্রতিক ভোটের ফলাফল:**
- **45%** ডেভেলপার AZD কে AI ওয়ার্কলোডের জন্য ব্যবহার করতে চান
- **শীর্ষ চ্যালেঞ্জসমূহ**: মাল্টি-সার্ভিস ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ম্যানেজমেন্ট, প্রোডাকশন-রেডিনেস  
- **সর্বাধিক চাওয়া**: AI-সংক্রান্ত টেমপ্লেট, ট্রাবলশুটিং গাইড, সেরা অনুশীলনসমূহ

**কমিউনিটিতে যোগ দিন যাতে:**
- আপনার AZD + AI অভিজ্ঞতা শেয়ার করুন এবং সহায়তা পান
- নতুন AI টেমপ্লেটের প্রারম্ভিক প্রিভিউ অ্যাক্সেস করুন
- AI ডিপ্লয়মেন্ট সেরা অনুশীলনে অবদান রাখুন
- ভবিষ্যতের AI + AZD ফিচার উন্নয়নের ওপর প্রভাব ফেলুন

### কোর্সে অবদান রাখা
আমরা অবদানকে স্বাগত জানাই! বিস্তারিত জানতে অনুগ্রহ করে আমাদের [Contributing Guide](CONTRIBUTING.md) পড়ুন:
- **কন্টেন্ট উন্নতি**: বিদ্যমান অধ্যায় ও উদাহরণগুলিকে উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব জগতের দৃশ্য ও টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহু-ভাষা সমর্থন বজায় রাখতে সাহায্য করুন
- **বাগ রিপোর্ট**: নির্ভুলতা ও স্পষ্টতা বাড়ান
- **কমিউনিটি মানদণ্ড**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি নির্দেশিকা অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্পটি MIT লাইসেন্সের অধীনে লাইসেন্সকৃত - বিস্তারিত জানতে [LICENSE](../../LICENSE) ফাইলটি দেখুন।

### সম্পর্কিত Microsoft লার্নিং রিসোর্স

আমাদের টিম অন্যান্য বিস্তৃত লার্নিং কোর্সগুলো তৈরি করে:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j - শুরুকারীদের জন্য](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js - শুরুকারীদের জন্য](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain - শুরুকারীদের জন্য](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD - শুরুকারীদের জন্য](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI - শুরুকারীদের জন্য](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP - শুরুকারীদের জন্য](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents - শুরুকারীদের জন্য](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI - শুরুকারীদের জন্য](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML - শুরুকারীদের জন্য](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science - শুরুকারীদের জন্য](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI - শুরুকারীদের জন্য](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity - শুরুকারীদের জন্য](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev - শুরুকারীদের জন্য](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT - শুরুকারীদের জন্য](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development - শুরুকারীদের জন্য](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![AI যুগল প্রোগ্রামিংয়ের জন্য Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET-এর জন্য Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot অ্যাডভেঞ্চার](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ কোর্স নেভিগেশন

**🚀 শেখা শুরু করতে প্রস্তুত?**

**নবীনরা**: শুরু করুন [অধ্যায় ১: ভিত্তি ও দ্রুত শুরু](../..)  
**AI ডেভেলপাররা**: সরাসরি যান [অধ্যায় ২: AI-প্রথম উন্নয়ন](../..)  
**অভিজ্ঞ ডেভেলপাররা**: শুরু করুন [অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ](../..)

**পরবর্তী ধাপ**: [অধ্যায় ১ শুরু করুন - AZD মৌলিক বিষয়সমূহ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতার জন্য যথাসাধ্য চেষ্টা করি, অনুগ্রহ করে লক্ষ্য করুন যে স্বয়ংক্রিয় অনুবাদে ভুল বা অসঙ্গতি থাকতে পারে। মূল নথিটিকে তার উৎস ভাষায়ই কর্তৃপক্ষ/নির্ভরযোগ্য উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট যেকোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# নবীনদের জন্য AZD: একটি কাঠামোবদ্ধ শেখার যাত্রা

![AZD-নবীনদের জন্য](../../translated_images/bn/azdbeginners.5527441dd9f74068.webp) 

[![GitHub পর্যবেক্ষক](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub তারকা](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure ডিসকর্ড](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry ডিসকর্ড](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### স্বয়ংক্রিয় অনুবাদ (সর্বদা হালনাগাদ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[আরবি](../ar/README.md) | [বাংলা](./README.md) | [বুলগেরীয়](../bg/README.md) | [বর্মা (মায়ানমার)](../my/README.md) | [চীনা (সরলীকৃত)](../zh-CN/README.md) | [চীনা (প্রচলিত, হংকং)](../zh-HK/README.md) | [চীনা (প্রচলিত, ম্যাকাও)](../zh-MO/README.md) | [চীনা (প্রচলিত, তাইওয়ান)](../zh-TW/README.md) | [ক্রোয়েশিয়ান](../hr/README.md) | [চেক](../cs/README.md) | [ড্যানিশ](../da/README.md) | [ডাচ](../nl/README.md) | [এস্তোনীয়](../et/README.md) | [ফিনিশ](../fi/README.md) | [ফরাসি](../fr/README.md) | [জার্মান](../de/README.md) | [গ্রীক](../el/README.md) | [হিব্রু](../he/README.md) | [হিন্দি](../hi/README.md) | [হাঙ্গেরীয়](../hu/README.md) | [ইন্দোনেশীয়](../id/README.md) | [ইতালীয়](../it/README.md) | [জাপানি](../ja/README.md) | [কন্নড়](../kn/README.md) | [কোরিয়ান](../ko/README.md) | [লিথুয়ানিয়ান](../lt/README.md) | [মালয়](../ms/README.md) | [মালায়লাম](../ml/README.md) | [মরাঠি](../mr/README.md) | [নেপালি](../ne/README.md) | [নাইজেরিয়ান পিজিন](../pcm/README.md) | [নরওয়েজিয়ান](../no/README.md) | [ফার্সি (পার্সি)](../fa/README.md) | [পোলিশ](../pl/README.md) | [পোর্টুগিজ (ব্রাজিল)](../pt-BR/README.md) | [পোর্টুগিজ (পর্তুগাল)](../pt-PT/README.md) | [পাঞ্জাবি (গুরমুখি)](../pa/README.md) | [রোমানিয়ান](../ro/README.md) | [রুশ](../ru/README.md) | [সার্বিয়ান (সিরিলিক)](../sr/README.md) | [স্লোভাক](../sk/README.md) | [স্লোভেনীয়](../sl/README.md) | [স্প্যানিশ](../es/README.md) | [সোয়াহিলি](../sw/README.md) | [সুইডিশ](../sv/README.md) | [তাগালগ (ফিলিপিনো)](../tl/README.md) | [তামিল](../ta/README.md) | [তেলুগু](../te/README.md) | [থাই](../th/README.md) | [তুর্কি](../tr/README.md) | [ইউক্রেনীয়](../uk/README.md) | [উর্দু](../ur/README.md) | [ভিয়েতনামী](../vi/README.md)

> **লোকালভাবে ক্লোন করতে পছন্দ করেন?**

> এই রিপোজিটরির মধ্যে ৫০+ ভাষার অনুবাদ অন্তর্ভুক্ত আছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> এটি আপনাকে কোর্স সম্পন্ন করার জন্য প্রয়োজনীয় সবকিছু দেয়, তবে ডাউনলোড অনেক দ্রুত হয়।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) কী?

**Azure Developer CLI (azd)** একটি ডেভেলপার-বান্ধব কমান্ড-লাইন টুল যা Azure-এ অ্যাপ্লিকেশন ডিপ্লয় করা সহজ করে তোলে। ডজনখানেক Azure রিসোর্স ম্যানুয়ালি তৈরি ও সংযুক্ত করার বদলে, আপনি একক কমান্ডেই সমগ্র অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন।

### `azd up` এর ম্যাজিক

```bash
# এই একক কমান্ডটি সবকিছু করে:
# ✅ সমস্ত Azure রিসোর্স তৈরি করে
# ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
# ✅ আপনার অ্যাপ্লিকেশন কোড নির্মাণ করে
# ✅ Azure এ ডিপ্লয় করে
# ✅ আপনাকে একটি কার্যকর URL দেয়
azd up
```

**এটাই!** Azure পোর্টালে ক্লিক করতে হবে না, কোনো জটিল ARM টেমপ্লেট আগে শেখার প্রয়োজন নেই, কোনো ম্যানুয়াল কনফিগারেশন নেই — কেবল কাজ করে এমন অ্যাপ্লিকেশনগুলো Azure-এ পাবেন।

---

## ❓ Azure Developer CLI বনাম Azure CLI: পার্থক্য কী?

এটি নবীনদের কাছে সবচেয়ে সাধারণ প্রশ্ন। এখানে সহজ উত্তরটি রয়েছে:

| বৈশিষ্ট্য | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **উদ্দেশ্য** | স্বতন্ত্র Azure রিসোর্স পরিচালনা করুন | সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয় করুন |
| **মনোভাব** | ইনফ্রাস্ট্রাকচার-কেন্দ্রিক | অ্যাপ্লিকেশন-কেন্দ্রিক |
| **উদাহরণ** | `az webapp create --name myapp...` | `azd up` |
| **শেখার বাঁক** | Azure সার্ভিসগুলো জানতে হবে | শুধু আপনার অ্যাপটি জানলেই হবে |
| **সর্বোত্তম জন্য** | DevOps, ইনফ্রাস্ট্রাকচার | ডেভেলপার, প্রোটোটাইপিং |

### সরল সরূপক

- **Azure CLI** এমন, যাদের কাছে বাড়ি বানানোর সব সরঞ্জাম আছে — হাতুড়ি, করাত, পেরেক। আপনি কিছুই বানাতে পারবেন, কিন্তু আপনাকে নির্মাণ জানতে হবে।
- **Azure Developer CLI** এমন, যেন আপনি একজন ঠিকাদার নিয়োগ দিয়েছেন — আপনি যা চান তা বর্ণনা করবেন, আর তারা নির্মাণের দায় নেবে।

### কখন কোনটি ব্যবহার করবেন

| পরিস্থিতি | ব্যবহার করুন |
|----------|----------|
| "আমি আমার ওয়েব অ্যাপ দ্রুত ডিপ্লয় করতে চাই" | `azd up` |
| "আমাকে শুধু একটি স্টোরেজ অ্যাকাউন্ট তৈরি করতে হবে" | `az storage account create` |
| "আমি একটি পূর্ণাঙ্গ AI অ্যাপ বানাচ্ছি" | `azd init --template azure-search-openai-demo` |
| "আমাকে একটি নির্দিষ্ট Azure রিসোর্স ডিবাগ করতে হবে" | `az resource show` |
| "আমি কয়েক মিনিটেই প্রোডাকশন-রেডি ডিপ্লয় চাই" | `azd up --environment production` |

### তারা একসাথে কাজ করে!

AZD আভ্যন্তরীণভাবে Azure CLI ব্যবহার করে। আপনি উভয়ই ব্যবহার করতে পারেন:
```bash
# আপনার অ্যাপটি AZD দিয়ে ডিপ্লয় করুন
azd up

# এরপরে Azure CLI দিয়ে নির্দিষ্ট রিসোর্সগুলি ফাইন-টিউন করুন
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-এ টেম্পলেট খুঁজুন

শূন্য থেকে শুরু করবেন না! **Awesome AZD** হলো কমিউনিটির রেডি-টু-ডিপ্লয় টেমপ্লেটগুলোর সংগ্রহ:

| রিসোর্স | বর্ণনা |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ২০০+ টেমপ্লেট এক-ক্লিকে ডিপ্লয় করে ব্রাউজ করুন |
| 🔗 [**একটি টেমপ্লেট জমা দিন**](https://github.com/Azure/awesome-azd/issues) | কমিউনিটিতে আপনার টেমপ্লেট জমা দিন |
| 🔗 [**GitHub রিপোজিটরি**](https://github.com/Azure/awesome-azd) | স্টার দিন এবং সোর্স এক্সপ্লোর করুন |

### Awesome AZD থেকে জনপ্রিয় AI টেমপ্লেট

```bash
# Azure OpenAI + AI অনুসন্ধানে RAG চ্যাট
azd init --template azure-search-openai-demo

# দ্রুত AI চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart

# Foundry Agents সহ AI এজেন্টগুলি
azd init --template get-started-with-ai-agents
```

---

## 🎯 ৩ ধাপে শুরু করুন

### ধাপ ১: AZD ইনস্টল করুন (২ মিনিট)

Windows:
```powershell
winget install microsoft.azd
```

macOS:
```bash
brew tap azure/azd && brew install azd
```

Linux:
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

# Azure-এ স্থাপন করুন (সবকিছু তৈরি করে!)
azd up
```

**🎉 এটাই!** আপনার অ্যাপ এখন Azure-এ লাইভ।

### ক্লিন আপ (ভুলবেন না!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 এই কোর্স কিভাবে ব্যবহার করবেন

এই কোর্সটি **ধাপে ধাপে শেখার জন্য** ডিজাইন করা হয়েছে — যেখানে আপনি আরাম বোধ করেন সেখান থেকেই শুরু করুন এবং ধীরে ধীরে এগুুন:

| আপনার অভিজ্ঞতা | এখান থেকেই শুরু করুন |
|-----------------|------------|
| **Azure-এ সম্পূর্ণ নতুন** | [চ্যাপ্টার 1: ভিত্তি](../..) |
| **Azure জানেন, AZD-এ নতুন** | [চ্যাপ্টার 1: ভিত্তি](../..) |
| **AI অ্যাপ ডিপ্লয় করতে চান** | [চ্যাপ্টার 2: AI-প্রধান অ্যাপ](../..) |
| **হাতেকলমে অনুশীলন চান** | [🎓 ইন্টারঅ্যাকটিভ ওয়ার্কশপ](workshop/README.md) - ৩-৪ ঘন্টার গাইডেড ল্যাব |
| **প্রোডাকশন প্যাটার্ন দরকার** | [চ্যাপ্টার 8: উৎপাদন ও এন্টারপ্রাইজ](../..) |

### দ্রুত সেটআপ

1. **এই রিপোজিটরিটি ফর্ক করুন**: [![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ক্লোন করুন**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **সাহায্য পান**: [Azure ডিসকর্ড কমিউনিটি](https://discord.com/invite/ByRwuEEgH4)

> **লোকালভাবে ক্লোন করতে পছন্দ করেন?**

> এই রিপোজিটরির মধ্যে ৫০+ ভাষার অনুবাদ অন্তর্ভুক্ত আছে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> এটি আপনাকে কোর্স সম্পন্ন করার জন্য প্রয়োজনীয় সবকিছু দেয়, তবে ডাউনলোড অনেক দ্রুত হয়。


## কোর্স ওভারভিউ

গঠনমূলক অধ্যায়গুলোর মাধ্যমে Azure Developer CLI (azd) আয়ত্ত করুন যা ধাপে ধাপে শেখার জন্য ডিজাইন করা। **Microsoft Foundry ইন্টিগ্রেশনের সাথে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টে বিশেষ গুরুত্ব।**

### কেন আধুনিক ডেভেলপারদের জন্য এই কোর্সটি অপরিহার্য

Microsoft Foundry ডিসকর্ড কমিউনিটির অন্তর্দৃষ্টির উপর ভিত্তি করে, **৪৫% ডেভেলপার AZD ব্যবহার করে AI ওয়ার্কলোড চালাতে চান** কিন্তু নিম্নলিখিত চ্যালেঞ্জগুলোর সম্মুখীন হন:
- জটিল মাল্টি-সার্ভিস AI আর্কিটেকচার
- প্রোডাকশন AI ডিপ্লয়মেন্টের সেরা অনুশীলন  
- Azure AI সার্ভিস ইন্টিগ্রেশন এবং কনফিগারেশন
- AI ওয়ার্কলোডের খরচ অপ্টিমাইজেশন
- AI-নির্দিষ্ট ডিপ্লয়মেন্ট সমস্যা সমাধান

### শেখার উদ্দেশ্যসমূহ

এই সংগঠিত কোর্স সম্পন্ন করার মাধ্যমে আপনি পারবেন:
- **AZD মৌলিক আয়ত্ত করুন**: মূল ধারণা, ইনস্টলেশন ও কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডিপ্লয় করুন**: AZD ব্যবহার করে Microsoft Foundry সার্ভিসগুলোর সাথে
- **Infrastructure as Code বাস্তবায়ন করুন**: Bicep টেমপ্লেট দিয়ে Azure রিসোর্স পরিচালনা
- **ডিপ্লয়মেন্ট ট্রাবলশুট করুন**: সাধারণ সমস্যা সমাধান ও ডিবাগিং
- **প্রোডাকশনের জন্য অপ্টিমাইজ করুন**: সিকিউরিটি, স্কেলিং, মনিটরিং ও খরচ ব্যবস্থাপনা
- **মাল্টি-এজেন্ট সলিউশন নির্মাণ করুন**: জটিল AI আর্কিটেকচার ডিপ্লয় করুন

## 🗺️ কোর্স মানচিত্র: অধ্যায় অনুযায়ী দ্রুত নেভিগেশন

প্রতিটি অধ্যায়ে একটি নিবেদিত README আছে যেখানে শেখার উদ্দেশ্য, দ্রুত শুরু, এবং অনুশীলন রয়েছে:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD মৌলিক](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [প্রথম প্রজেক্ট](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-প্রধান অ্যাপ | [Foundry একীকরণ](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI এজেন্ট](docs/chapter-02-ai-development/agents.md) &#124; [মডেল ডিপ্লয়মেন্ট](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ওয়ার্কশপ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [কনফিগারেশন](docs/chapter-03-configuration/configuration.md) &#124; [অথেনটিকেশন এবং নিরাপত্তা](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [প্রোভিশনিং](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | এআই এজেন্ট সমাধান | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ঘন্টা | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | পরিকল্পনা ও ভ্যালিডেশন | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ঘন্টা | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | ডিবাগ ও ফিক্স | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ঘন্টা | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | এন্টারপ্রাইজ প্যাটার্ন | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 ঘন্টা | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | হ্যান্ডস-অন ল্যাব | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ঘন্টা | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Learning Chapters

*আপনার অভিজ্ঞতা স্তর ও লক্ষ্য অনুযায়ী শেখার পথ নির্বাচন করুন*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### What You'll Learn
- Azure Developer CLI এর বুনিয়াদি ধারণা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- আপনার প্রথম সফল ডিপ্লয়মেন্ট

#### Learning Resources
- **🎯 Start Here**: [Azure Developer CLI কী?](../..)
- **📖 Theory**: [AZD মৌলিক বিষয়](docs/chapter-01-foundation/azd-basics.md) - মূল ধারণা এবং টার্মিনোলজি
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট গাইড
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - ধাপে ধাপে টিউটোরিয়াল
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# দ্রুত ইনস্টলেশন পরীক্ষা
azd version

# আপনার প্রথম অ্যাপ্লিকেশন মোতায়েন করুন
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: AZD ব্যবহার করে Azure এ একটি সাধারণ ওয়েব অ্যাপ সফলভাবে ডিপ্লয় করা

**✅ Success Validation:**
```bash
# অধ্যায় ১ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্পটি প্রাথমিককরণ করে
azd up                  # Azure-এ স্থাপন করে
azd show                # চলমান অ্যাপের URL প্রদর্শন করে
# অ্যাপ্লিকেশন ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** নিজে থেকে বেসিক অ্যাপগুলো ডিপ্লয় করতে পারবে

**✅ Success Validation:**
```bash
# অধ্যায় ১ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্প শুরু করে
azd up                  # Azure-এ স্থাপন করে
azd show                # চলমান অ্যাপের URL দেখায়
# অ্যাপ্লিকেশন ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** নিজে থেকে বেসিক অ্যাপগুলো ডিপ্লয় করতে পারবে

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 completed  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Microsoft Foundry এর সাথে AZD ইন্টিগ্রেশন
- AI-চালিত অ্যাপ্লিকেশন ডিপ্লয় করা
- AI সার্ভিস কনফিগারেশন বোঝা

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD দিয়ে ইন্টেলিজেন্ট এজেন্ট ডিপ্লয় করুন
- **📖 Patterns**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - AI মডেল ডিপ্লয় ও ম্যানেজ করুন
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলো AZD-র জন্য প্রস্তুত করুন
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer Environment সহ ব্রাউজার-ভিত্তিক শেখা
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# আপনার প্রথম এআই অ্যাপ্লিকেশন ডিপ্লয় করুন
azd init --template azure-search-openai-demo
azd up

# অন্য এআই টেমপ্লেটগুলোও চেষ্টা করুন
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: RAG ক্ষমতা সহ একটি AI-চালিত চ্যাট অ্যাপ ডিপ্লয় ও কনফিগার করা

**✅ Success Validation:**
```bash
# অধ্যায় ২-এর পরে, আপনি সক্ষম হবেন:
azd init --template azure-search-openai-demo
azd up
# এআই চ্যাট ইন্টারফেস পরীক্ষা করুন
# প্রশ্ন জিজ্ঞাসা করুন এবং উৎসসহ এআই-চালিত উত্তর পান
# অনুসন্ধান ইন্টিগ্রেশন কাজ করছে কি যাচাই করুন
azd monitor  # Application Insights টেলিমেট্রি দেখাচ্ছে কি পরীক্ষা করুন
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় ও কনফিগার করতে পারবে  
**💰 Cost Awareness:** ডেভ পরিবেশে $80-150/মাস, প্রোডাকশনে $300-3500/মাস ব্যয়ের ধারণা

#### 💰 Cost Considerations for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Azure OpenAI (Pay-as-you-go): $0-50/month (টোকেন ব্যবহারের উপর নির্ভর করে)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Azure OpenAI (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Cost Optimization Tips:**
- শেখার জন্য **Free Tier** Azure OpenAI ব্যবহার করুন (প্রতি মাসে 50,000 টোকেন অন্তর্ভুক্ত)
- সক্রিয়ভাবে ডেভেলপ না করলে রিসোর্স ডিলোকেট করতে `azd down` চালান
- শুরুতে consumption-based বিলিং ব্যবহার করুন, প্রোডাকশনের জন্য কেবল PTU-তে আপগ্রেড করুন
- ডিপ্লয়মেন্টের আগে খরচ অনুমান করতে `azd provision --preview` চালান
- অটো-স্কেলিং সক্ষম করুন: কেবল বাস্তব ব্যবহারের জন্য পেমেন্ট করুন

**Cost Monitoring:**
```bash
# অনুমানিক মাসিক খরচ যাচাই করুন
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
- এনভায়রনমেন্ট কনফিগারেশন ও ম্যানেজমেন্ট
- অথেনটিকেশন ও নিরাপত্তার সেরা অনুশীলন
- রিসোর্স নামকরণ এবং সংগঠন

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - এনভায়রনমেন্ট সেটআপ
- **🔐 Security**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - অথেনটিকেশন প্যাটার্নসমূহ
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD ডাটাবেস উদাহরণসমূহ

#### Practical Exercises
- একাধিক এনভায়রনমেন্ট কনফিগার করুন (dev, staging, prod)
- managed identity অথেনটিকেশন সেটআপ করুন
- এনভায়রনমেন্ট-নির্দিষ্ট কনফিগারেশন বাস্তবায়ন করুন

**💡 Chapter Outcome**: সঠিক অথেনটিকেশন ও নিরাপত্তা সহ একাধিক এনভায়রনমেন্ট ম্যানেজ করতে পারা

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- অ্যাডভান্সড ডিপ্লয়মেন্ট প্যাটার্নসমূহ
- Bicep দিয়ে Infrastructure as Code
- রিসোর্স প্রোভিশনিং কৌশল

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ ওয়ার্কফ্লো
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 Examples**: [Container App Example](../../examples/container-app) - কনটেইনারাইজড ডিপ্লয়মেন্ট

#### Practical Exercises
- কাস্টম Bicep টেমপ্লেট তৈরি করুন
- বহু-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন
- ব্লু-গ্রীন ডিপ্লয়মেন্ট কৌশল বাস্তবায়ন করুন

**💡 Chapter Outcome**: কাস্টম ইনফ্রাসট্রাকচার টেমপ্লেট ব্যবহার করে জটিল বহু-সার্ভিস অ্যাপ ডিপ্লয় করতে সক্ষম হওয়া

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্নসমূহ
- এজেন্ট অর্কেস্ট্রেশন ও সমন্বয়
- প্রোডাকশন-রেডি AI ডিপ্লয়মেন্ট

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - সম্পূর্ণ ইমপ্লিমেন্টেশন
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - এক-ক্লিক ডিপ্লয়মেন্ট
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - প্যাটার্নসমূহ

#### Practical Exercises
```bash
# সম্পূর্ণ খুচরা মাল্টি-এজেন্ট সমাধান স্থাপন করুন
cd examples/retail-multiagent-arm-template
./deploy.sh

# এজেন্ট কনফিগারেশনগুলি অন্বেষণ করুন
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Customer এবং Inventory এজেন্টসহ একটি প্রোডাকশন-রেডি মাল্টি-এজেন্ট AI সমাধান ডিপ্লয় ও ম্যানেজ করা

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- ক্যাপাসিটি প্ল্যানিং ও রিসোর্স ভ্যালিডেশন
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট চেক ও অটোমেশন

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স ভ্যালিডেশন
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - খরচ-কার্যকর চয়েস
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - অটোমেটেড স্ক্রিপ্টসমূহ

#### Practical Exercises
- ক্যাপাসিটি ভ্যালিডেশন স্ক্রিপ্ট চালান
- ব্যয়ের জন্য SKU নির্বাচন অপ্টিমাইজ করুন
- অটোমেটেড প্রি-ডিপ্লয়মেন্ট চেক বাস্তবায়ন করুন

**💡 Chapter Outcome**: এক্সিকিউশনের আগে ডিপ্লয়মেন্ট ভ্যালিডেট ও অপ্টিমাইজ করা

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- সিস্টেম্যাটিক ডিবাগিং পদ্ধতি
- সাধারণ সমস্যা ও সমাধান
- AI-নির্দিষ্ট ট্রাবলশুটিং

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ ও সমাধান
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ধাপে ধাপে কৌশল
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI সার্ভিস সমস্যা

#### Practical Exercises
- ডিপ্লয়মেন্ট ফেইলির নির্ণয় করুন
- অথেনটিকেশন সমস্যা সমাধান করুন
- AI সার্ভিস কানেক্টিভিটি ডিবাগ করুন

**💡 Chapter Outcome**: সাধারণ ডিপ্লয়মেন্ট সমস্যা স্বাধীনভাবে নির্ণয় ও সমাধান করতে সক্ষম হওয়া

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- প্রোডাকশন ডিপ্লয়মেন্ট কৌশল
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নসমূহ
- মনিটরিং ও খরচ অপ্টিমাইজেশন

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্ন
- **📝 Examples**: [Microservices Example](../../examples/microservices) - জটিল আর্কিটেকচার
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - মনিটরিং

#### Practical Exercises
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন বাস্তবায়ন করুন
- ব্যাপক মনিটরিং সেটআপ করুন
- সঠিক গভর্ন্যান্স সহ প্রোডাকশনে ডিপ্লয় করুন

**💡 Chapter Outcome**: পূর্ণ প্রোডাকশন সক্ষমতা সহ এন্টারপ্রাইজ-রেডি অ্যাপ্লিকেশন ডিপ্লয় করা

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> ওয়ার্কশপ সামগ্রী বর্তমানে উন্নয়ন ও পরিশোধনের ধাপে রয়েছে। কোর মডিউলগুলো কার্যকর, কিন্তু কিছু উন্নত সেকশন অসম্পূর্ণ রয়েছে। আমরা সক্রিয়ভাবে সব কন্টেন্ট সম্পন্ন করার দিকে কাজ করছি। [প্রগতি ট্র্যাক করুন →](workshop/README.md)

### Interactive Workshop Materials
**ব্রাউজার-ভিত্তিক টুল ও গাইডেড এক্সারসাইজ সহ ব্যাপক হ্যান্ডস-অন শেখার অভিজ্ঞতা**
আমাদের কর্মশালা উপকরণগুলি একটি কাঠামোবদ্ধ, ইন্টারেক্টিভ শেখার অভিজ্ঞতা প্রদান করে যা উপরের অধ্যায়-ভিত্তিক পাঠ্যক্রমকে সম্পূরক করে। কর্মশালাটি স্ব-গতিতে শেখা এবং ইনস্ট্রাক্টর-নেতৃত্বাধীন সেশনের জন্য ডিজাইন করা হয়েছে।

#### 🛠️ ওয়ার্কশপ বৈশিষ্ট্য
- **ব্রাউজার-ভিত্তিক ইন্টারফেস**: সার্চ, কপি, এবং থিম বৈশিষ্ট্য সহ MkDocs-চালিত সম্পূর্ণ ওয়ার্কশপ
- **GitHub Codespaces ইন্টিগ্রেশন**: এক-ক্লিকে ডেভেলপমেন্ট পরিবেশ সেটআপ
- **গঠিত শেখার পথ**: ৮-মডিউল নির্দেশিত অনুশীলন (মোট ৩-৪ ঘণ্টা)
- **প্রগতিশীল পদ্ধতি**: পরিচিতি → নির্বাচন → যাচাই → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → পরিষ্কারীকরণ → সমাপনী
- **ইন্টারেক্টিভ DevContainer পরিবেশ**: পূর্ব-কনফিগার করা টুলস এবং নির্ভরশীলতা

#### 📚 ওয়ার্কশপ মডিউল কাঠামো
ওয়ার্কশপটি একটি **৮-মডিউল প্রগতিশীল পদ্ধতি** অনুসরণ করে যা আপনাকে আবিষ্কার থেকে ডিপ্লয়মেন্ট দক্ষতা পর্যন্ত নিয়ে যায়:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. পরিচিতি** | ওয়ার্কশপ সারাংশ | শেখার উদ্দেশ্য, পূর্বশর্ত, এবং ওয়ার্কশপের কাঠামো বোঝা | 15 মিনিট |
| **1. নির্বাচন** | টেমপ্লেট আবিষ্কার | AZD টেমপ্লেটগুলো অন্বেষণ করুন এবং আপনার দৃশ্যে সঠিক AI টেমপ্লেট নির্বাচন করুন | 20 মিনিট |
| **2. যাচাই** | ডিপ্লয় ও যাচাই | টেমপ্লেটটি `azd up` দিয়ে ডিপ্লয় করুন এবং ইনফ্রাস্ট্রাকচার কাজ করছে কিনা যাচাই করুন | 30 মিনিট |
| **3. বিশ্লেষণ** | কাঠামো বোঝা | GitHub Copilot ব্যবহার করে টেমপ্লেট আর্কিটেকচার, Bicep ফাইল, এবং কোড সংগঠন অন্বেষণ করুন | 30 মিনিট |
| **4. কনফিগারেশন** | azure.yaml গভীর অন্বেষণ | `azure.yaml` কনফিগারেশন, লাইফসাইকেল হুক, এবং এনভায়রনমেন্ট ভেরিয়েবলগুলো আয়ত্ত করুন | 30 মিনিট |
| **5. কাস্টমাইজেশন** | আপনার মত করে তৈরী করুন | AI Search, ট্রেসিং, ইভ্যালুয়েশন সক্ষম করুন এবং আপনার দৃশ্যের জন্য কাস্টমাইজ করুন | 45 মিনিট |
| **6. পরিষ্কারীকরণ** | সম্পদ পরিস্কার | `azd down --purge` দিয়ে নিরাপদভাবে রিসোর্সগুলো অপসারণ করুন | 15 মিনিট |
| **7. সমাপনী** | পরবর্তী ধাপ | অর্জিত জিনিসগুলো, মূল ধারণাসমূহ পর্যালোচনা করুন এবং আপনার শেখার যাত্রা চালিয়ে যান | 15 মিনিট |

**ওয়ার্কশপ ফ্লো:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ওয়ার্কশপ শুরু করার উপায়
```bash
# বিকল্প 1: GitHub Codespaces (প্রস্তাবিত)
# রিপোজিটরিতে "Code" → "Create codespace on main" এ ক্লিক করুন

# বিকল্প 2: লোকাল ডেভেলপমেন্ট
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md-এ থাকা সেটআপ নির্দেশনা অনুসরণ করুন
```

#### 🎯 ওয়ার্কশপ শেখার ফলাফল
কর্মশালা সম্পন্ন করার মাধ্যমে অংশগ্রহণকারীরা:
- **প্রোডাকশন AI অ্যাপ্লিকেশন ডিপ্লয় করবেন**: Microsoft Foundry পরিষেবাসহ AZD ব্যবহার করে
- **মাল্টি-এজেন্ট আর্কিটেকচার আয়ত্ত করবেন**: সমন্বিত AI এজেন্ট সমাধান বাস্তবায়ন করবেন
- **সিকিউরিটি শ্রেষ্ঠ অনুশীলন প্রয়োগ করবেন**: প্রমাণীকরণ এবং অ্যাক্সেস নিয়ন্ত্রণ কনফিগার করবেন
- **স্কেলিং-এর জন্য অপ্টিমাইজ করবেন**: খরচ-সচেতন, কর্মক্ষম ডিপ্লয়মেন্ট ডিজাইন করবেন
- **ডিপ্লয়মেন্টসমূহ ট্রাবলশুট করবেন**: সাধারণ সমস্যাগুলো স্বাধীনভাবে সমাধান করতে পারবেন

#### 📖 ওয়ার্কশপ রিসোর্স
- **🎥 ইন্টারেক্টিভ গাইড**: [কর্মশালা উপকরণ](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখার পরিবেশ
- **📋 মডিউল-বাই-মডিউল নির্দেশনা**:
  - [0. পরিচিতি](workshop/docs/instructions/0-Introduction.md) - ওয়ার্কশপ ওভারভিউ এবং উদ্দেশ্য
  - [1. নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) - AI টেমপ্লেট খোঁজা এবং নির্বাচন
  - [2. যাচাই](workshop/docs/instructions/2-Validate-AI-Template.md) - টেমপ্লেট ডিপ্লয় এবং যাচাই
  - [3. বিশ্লেষণ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - টেমপ্লেট আর্কিটেকচার অন্বেষণ
  - [4. কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml আয়ত্ত করা
  - [5. কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) - আপনার দৃশ্যের জন্য কাস্টমাইজ করা
  - [6. পরিষ্কারীকরণ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - রিসোর্সগুলো পরিষ্কার করা
  - [7. সমাপনী](workshop/docs/instructions/7-Wrap-up.md) - পর্যালোচনা এবং পরবর্তী ধাপ
- **🛠️ AI ওয়ার্কশপ ল্যাব**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-কেন্দ্রিক অনুশীলন
- **💡 দ্রুত শুরু করুন**: [কর্মশালা সেটআপ গাইড](workshop/README.md#quick-start) - পরিবেশ কনফিগারেশন

**উপযুক্ত জন্য**: কর্পোরেট প্রশিক্ষণ, বিশ্ববিদ্যালয় কোর্স, স্ব-গতিতে শেখা, এবং ডেভেলপার বুটক্যাম্প।

---

## 📖 গভীর অন্বেষণ: AZD ক্ষমতা

বেসিক ছাড়াও, AZD প্রোডাকশন ডিপ্লয়মেন্টের জন্য শক্তিশালী বৈশিষ্ট্য প্রদান করে:

- **টেমপ্লেট-ভিত্তিক ডিপ্লয়মেন্ট** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নের জন্য প্রি-বিল্ড টেমপ্লেট ব্যবহার করুন
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড** - Bicep বা Terraform ব্যবহার করে Azure রিসোর্স পরিচালনা করুন  
- **ইন্টিগ্রেটেড ওয়ার্কফ্লো** - নির্বিঘ্নভাবে প্রোভিশন, ডিপ্লয়, এবং মনিটরিং করুন
- **ডেভেলপার-হিতৈষী** - ডেভেলপার প্রোডাক্টিভিটি এবং অভিজ্ঞতার জন্য অপ্টিমাইজড

### **AZD + Microsoft Foundry: AI ডিপ্লয়মেন্টের জন্য উপযুক্ত**

**কেন AZD AI সমাধানের জন্য?** AZD AI ডেভেলপারদের মুখোমুখি প্রধান চ্যালেঞ্জগুলো মোকাবিলা করে:

- **AI-র জন্য প্রস্তুত টেমপ্লেট** - Azure OpenAI, Cognitive Services, এবং ML ওয়ার্কলোডের জন্য পূর্ব-কনফিগার করা টেমপ্লেট
- **নিরাপদ AI ডিপ্লয়মেন্ট** - AI সার্ভিস, API কী, এবং মডেল এন্ডপয়েন্টের জন্য বিল্ট-ইন সিকিউরিটি প্যাটার্ন  
- **প্রোডাকশন AI প্যাটার্ন** - স্কেলেবল, খরচ-সচেতন AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য সেরা অনুশীলন
- **এন্ড-টু-এন্ড AI ওয়ার্কফ্লো** - মডেল ডেভেলপমেন্ট থেকে প্রোডাকশন ডিপ্লয়মেন্ট পর্যন্ত সঠিক মনিটরিং সহ
- **খরচ অপ্টিমাইজেশন** - AI ওয়ার্কলোডের জন্য স্মার্ট রিসোর্স বরাদ্দ এবং স্কেলিং কৌশল
- **Microsoft Foundry ইন্টিগ্রেশন** - Microsoft Foundry মডেল ক্যাটালগ এবং এন্ডপয়েন্টের সাথে নির্বিঘ্ন সংযোগ

---

## 🎯 টেমপ্লেট ও উদাহরণ লাইব্রেরি

### বৈশিষ্ট্যযুক্ত: Microsoft Foundry টেমপ্লেট
**AI অ্যাপ্লিকেশন ডিপ্লয় করলে এখানে শুরু করুন!**

> **নোট:** এই টেমপ্লেটগুলো বিভিন্ন AI প্যাটার্ন প্রদর্শন করে। কিছু হলো বহিঃস্থ Azure Samples, অন্যগুলো স্থানীয় ইমপ্লিমেন্টেশন।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | বহিঃস্থ |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | অধ্যায় 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| বহিঃস্থ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | বহিঃস্থ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | বহিঃস্থ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | বহিঃস্থ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | বহিঃস্থ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | অধ্যায় 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **স্থানীয়** |

### বৈশিষ্ট্যযুক্ত: সম্পূর্ণ লার্নিং সীনারিওসমূহ
**লার্নিং অধ্যায়ের সাথে আপ-টু-প্রোডাকশন-রেডি অ্যাপ্লিকেশন টেমপ্লেটগুলো মানচিত্রিত করা আছে**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | বেসিক AI ডিপ্লয়মেন্ট প্যাটার্ন |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Search দ্বারা RAG বাস্তবায়ন |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | ডকুমেন্ট ইন্টেলিজেন্স ইন্টিগ্রেশন |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | এজেন্ট ফ্রেমওয়ার্ক এবং ফাংশন কলিং |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | এন্টারপ্রাইজ AI অর্কেস্ট্রেশন |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | কাস্টমার এবং ইনভেন্টরি এজেন্টসহ মাল্টি-এজেন্ট আর্কিটেকচার |

### উদাহরণের ধরন অনুযায়ী শেখা

> **📌 স্থানীয় বনাম বহিঃস্থ উদাহরণ:**  
> **স্থানীয় উদাহরণ** (এই রেপোতে) = ব্যবহার করার জন্য প্রস্তুত  
> **বহিঃস্থ উদাহরণ** (Azure Samples) = লিঙ্ককৃত রেপোজিটরিগুলো থেকে ক্লোন করুন

#### স্থানীয় উদাহরণ (ব্যবহারের জন্য প্রস্তুত)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM টেমপ্লেটসহ সম্পূর্ণ প্রোডাকশন-রেডি ইমপ্লিমেন্টেশন
  - মাল্টি-এজেন্ট আর্কিটেকচার (কাস্টমার + ইনভেন্টরি এজেন্ট)
  - বিস্তৃত মনিটরিং এবং মূল্যায়ন
  - ARM টেমপ্লেটের মাধ্যমে এক-ক্লিক ডিপ্লয়মেন্ট

#### স্থানীয় উদাহরণ - কনটেইনার অ্যাপ্লিকেশন (অধ্যায়গুলো ২-৫)
**এই রেপোতে ব্যাপক কনটেইনার ডিপ্লয়মেন্ট উদাহরণগুলো:**
- [**Container App Examples**](examples/container-app/README.md) - কনটেইনারাইজড ডিপ্লয়মেন্টের পূর্ণ গাইড
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - স্কেল-টু-জিরো সহ বেসিক REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট
  - দ্রুত শুরু, প্রোডাকশন, এবং অ্যাডভান্সড ডিপ্লয়মেন্ট প্যাটার্ন
  - মনিটরিং, নিরাপত্তা, এবং খরচ অপ্টিমাইজেশনের নির্দেশিকা

#### বহিঃস্থ উদাহরণ - সরল অ্যাপ্লিকেশন (অধ্যায় ১-২)
**এই Azure Samples রেপোজিটরিগুলো ক্লোন করে শুরু করুন:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - বেসিক ডিপ্লয়মেন্ট প্যাটার্ন
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - স্ট্যাটিক কনটেন্ট ডিপ্লয়মেন্ট
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ডিপ্লয়মেন্ট

#### বহিঃস্থ উদাহরণ - ডাটাবেস ইন্টিগ্রেশন (অধ্যায় ৩-৪)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ডাটাবেস কানেকটিভিটি প্যাটার্ন
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - সার্ভারলেস ডাটা ওয়ার্কফ্লো

#### বহিঃস্থ উদাহরণ - উন্নত প্যাটার্ন (অধ্যায় ৪-৮)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - মাল্টি-সার্ভিস আর্কিটেকচার
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ব্যাকগ্রাউন্ড প্রসেসিং  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - প্রোডাকশন-রেডি ML প্যাটার্ন

### বহিঃস্থ টেমপ্লেট সংগ্রহ
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - অফিসিয়াল এবং কমিউনিটি টেমপ্লেটের কিউরেটেড সংগ্রহ
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn টেমপ্লেট ডকুমেন্টেশন
- [**Examples Directory**](examples/README.md) - স্থানীয় লার্নিং উদাহরণগুলো বিস্তারিত ব্যাখ্যাসহ

---

## 📚 শেখার রিসোর্স ও রেফারেন্স

### দ্রুত রেফারেন্স
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - অধ্যায় অনুযায়ী সংগঠিত অপরিহার্য azd কমান্ডসমূহ
- [**Glossary**](resources/glossary.md) - Azure এবং azd টার্মিনোলজি  
- [**FAQ**](resources/faq.md) - শেখার অধ্যায় অনুযায়ী সংগঠিত সাধারণ প্রশ্নোত্তর
- [**Study Guide**](resources/study-guide.md) - বিস্তৃত অনুশীলনী

### হ্যান্ডস-অন কর্মশালা
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলোকে AZD-ডিপ্লয়েবল করুন (২-৩ ঘন্টা)
- [**Interactive Workshop**](workshop/README.md) - MkDocs এবং GitHub Codespaces সহ ৮-মডিউল নির্দেশিত অনুশীলন
  - অনুসরণ করে: পরিচিতি → নির্বাচন → যাচাই → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → পরিষ্কারীকরণ → সমাপনী

### বহিঃস্থ শেখার রিসোর্স
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 দ্রুত সমাধান নির্দেশিকা

**শিখনশীলদের মুখোমুখি সাধারণ সমস্যা এবং তাৎক্ষণিক সমাধান:**

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
# উপলব্ধ সাবস্ক্রিপশন তালিকাভুক্ত করুন
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
# বিভিন্ন Azure অঞ্চল চেষ্টা করুন
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

# বিকল্প 2: কেবল অবকাঠামো ঠিক করুন
azd provision

# বিকল্প 3: বিস্তারিত অবস্থা পরীক্ষা করুন
azd show

# বিকল্প 4: Azure Monitor-এ লগ পরীক্ষা করুন
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "প্রমাণীকরণ ব্যর্থ" বা "টোকেনের মেয়াদ শেষ"</strong></summary>

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
<summary><strong>❌ "রিসোর্স ইতিমধ্যেই বিদ্যমান" বা নামকরণ সংঘর্ষ</strong></summary>

```bash
# AZD অনন্য নাম তৈরি করে, কিন্তু সংঘাত হলে:
azd down --force --purge

# তাহলে নতুন পরিবেশ ব্যবহার করে পুনরায় চেষ্টা করুন
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ টেমপ্লেট ডিপ্লয়মেন্ট অনেক সময় নিচ্ছে</strong></summary>

**সাধারণ অপেক্ষার সময়:**
- সাধারণ ওয়েব অ্যাপ: 5-10 মিনিট
- ডাটাবেস সহ অ্যাপ: 10-15 মিনিট
- এআই অ্যাপ্লিকেশন: 15-25 মিনিট (OpenAI-এর প্রোভিশনিং ধীর)

```bash
# অগ্রগতি পরীক্ষা করুন
azd show

# যদি ৩০ মিনিটের বেশি আটকে থাকেন, Azure পোর্টাল পরীক্ষা করুন:
azd monitor
# ব্যর্থ ডিপ্লয়মেন্টগুলি খুঁজুন
```
</details>

<details>
<summary><strong>❌ "Permission denied" বা "Forbidden"</strong></summary>

```bash
# আপনার Azure রোল পরীক্ষা করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# আপনাকে কমপক্ষে "Contributor" রোল প্রয়োজন
# আপনার Azure অ্যাডমিনকে নিম্নলিখিতগুলো দিতে বলুন:
# - Contributor (রিসোর্সগুলোর জন্য)
# - User Access Administrator (রোল অ্যাসাইনমেন্টের জন্য)
```
</details>

<details>
<summary><strong>❌ ডিপ্লয় করা অ্যাপ্লিকেশনের URL খুঁজে পাওয়া যাচ্ছে না</strong></summary>

```bash
# সমস্ত সার্ভিস এন্ডপয়েন্ট দেখান
azd show

# অথবা Azure পোর্টাল খুলুন
azd monitor

# নির্দিষ্ট সার্ভিস পরীক্ষা করুন
azd env get-values
# *_URL ভেরিয়েবলগুলি খুঁজুন
```
</details>

### 📚 পূর্ণ সমস্যা সমাধান সংস্থান

- **সাধারণ সমস্যা নির্দেশিকা:** [বিস্তারিত সমাধান](docs/chapter-07-troubleshooting/common-issues.md)
- **এআই-সম্পর্কিত সমস্যা:** [এআই সমস্যা সমাধান](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ডিবাগিং নির্দেশিকা:** [ধাপে ধাপে ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md)
- **সহায়তা পান:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 কোর্স সমাপ্তি ও সার্টিফিকেশন

### অগ্রগতি ট্র্যাকিং
প্রতিটি অধ্যায়ে আপনার শেখার অগ্রগতি ট্র্যাক করুন:

- [ ] **অধ্যায় 1**: ভিত্তি ও দ্রুত শুরু ✅
- [ ] **অধ্যায় 2**: এআই-প্রথম উন্নয়ন ✅  
- [ ] **অধ্যায় 3**: কনফিগারেশন ও প্রমাণীকরণ ✅
- [ ] **অধ্যায় 4**: কোড হিসেবে অবকাঠামো ও ডিপ্লয়মেন্ট ✅
- [ ] **অধ্যায় 5**: বহু-এজেন্ট এআই সমাধান ✅
- [ ] **অধ্যায় 6**: ডিপ্লয়মেন্ট পূর্ববর্তী যাচাই ও পরিকল্পনা ✅
- [ ] **অধ্যায় 7**: সমস্যা সমাধান ও ডিবাগিং ✅
- [ ] **অধ্যায় 8**: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন ✅

### শেখার যাচাই
প্রতিটি অধ্যায় সম্পন্ন করার পরে, আপনার জ্ঞান যাচাই করুন:
1. **প্রায়োগিক অনুশীলন**: অধ্যায়ের হাতে-কলমে ডিপ্লয়মেন্ট সম্পন্ন করুন
2. **জ্ঞান যাচাই**: আপনার অধ্যায়ের FAQ অংশটি পর্যালোচনা করুন
3. **কমিউনিটি আলোচনা**: Azure Discord-এ আপনার অভিজ্ঞতা শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরবর্তী জটিলতার স্তরে যান

### কোর্স সমাপ্তির সুবিধা
সমস্ত অধ্যায় সম্পন্ন করার পর, আপনার থাকবে:
- **প্রোডাকশন অভিজ্ঞতা**: Azure-এ বাস্তব এআই অ্যাপ্লিকেশন ডিপ্লয় করা
- **পেশাদার দক্ষতা**: এন্টারপ্রাইজ-উপযোগী ডিপ্লয়মেন্ট দক্ষতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার উন্নতি**: চাহিদাসম্পন্ন AZD এবং এআই ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি ও সহায়তা

### সহায়তা ও সমর্থন
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট করুন এবং ফিচার অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)
- **শিক্ষা সংক্রান্ত প্রশ্ন**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) এবং [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **এআই-সংক্রান্ত সহায়তা**: যোগ দিন [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ডকুমেন্টেশন**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**সম্প্রতি পোলের ফলাফল #Azure চ্যানেল থেকে:**
- **45%** ডেভেলপাররা AZD ব্যবহার করতে চান এআই ওয়ার্কলোডের জন্য
- **প্রধান চ্যালেঞ্জসমূহ**: বহু-সেবা ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ব্যবস্থাপনা, প্রোডাকশন প্রস্তুতি  
- **সবচেয়ে অনুরোধকৃত**: এআই-বিশেষ টেমপ্লেট, সমস্যা সমাধান গাইড, সেরা অনুশীলন

**আমাদের কমিউনিটিতে যোগ দিয়ে:**
- আপনার AZD + এআই অভিজ্ঞতা শেয়ার করুন এবং সহায়তা নিন
- নতুন এআই টেমপ্লেটগুলোর প্রাথমিক প্রিভিউ অ্যাক্সেস করুন
- এআই ডিপ্লয়মেন্ট সেরা অনুশীলনে অবদান রাখুন
- ভবিষ্যতের AI + AZD ফিচার ডেভেলপমেন্টে প্রভাব ফেলুন

### কোর্সে অবদান রাখা
আমরা অবদান স্বাগত জানাই! বিস্তারিত জানতে আমাদের [Contributing Guide](CONTRIBUTING.md) পড়ুন:
- **বিষয়বস্তুর উন্নতি**: বিদ্যমান অধ্যায় ও উদাহরণ উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব বিশ্বের পরিস্থিতি ও টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহুভাষা সমর্থন বজায় রাখতে সাহায্য করুন
- **বাগ রিপোর্ট**: যথার্থতা ও স্পষ্টতা বাড়ান
- **কমিউনিটি মানদণ্ড**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি নির্দেশিকা অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্পটি MIT লাইসেন্সের আওতায় লাইসেন্সকৃত - বিস্তারিত জানতে [LICENSE](../../LICENSE) ফাইলটি দেখুন।

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

**🚀 শেখা শুরু করতে প্রস্তুত?**

**শুরুকারীরা**: শুরু করুন [অধ্যায় 1: ভিত্তি ও দ্রুত শুরু](../..)
**এআই ডেভেলপাররা**: এখানে যান [অধ্যায় ২: এআই-প্রথম উন্নয়ন](../..)  
**অভিজ্ঞ ডেভেলপাররা**: শুরু করুন [অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ](../..)

**পরবর্তী ধাপ**: [শুরু করুন অধ্যায় ১ - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি; তবুও অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষার নথিটিকেই আধিকারিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ করা উত্তম। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট যেকোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
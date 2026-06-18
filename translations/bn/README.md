# AZD নবীনদের জন্য: একটি কাঠামোবদ্ধ শেখার যাত্রা

![AZD-নবীনদের](../../translated_images/bn/azdbeginners.5527441dd9f74068.webp) 

[![GitHub পর্যবেক্ষক](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub তারকা](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure ডিসকোর্ড](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry ডিসকোর্ড](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### স্বয়ংক্রিয় অনুবাদ (সর্বদা হালনাগাদ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[আরবি](../ar/README.md) | [বাংলা](./README.md) | [বুলগেরিয়ান](../bg/README.md) | [বার্মিজ (মায়ানমার)](../my/README.md) | [চীনা (সরলীকৃত)](../zh-CN/README.md) | [চীনা (প্রচলিত, হংকং)](../zh-HK/README.md) | [চীনা (প্রচলিত, মাকাও)](../zh-MO/README.md) | [চীনা (প্রচলিত, তাইওয়ান)](../zh-TW/README.md) | [ক্রোয়েশিয়ান](../hr/README.md) | [চেক](../cs/README.md) | [ড্যানিশ](../da/README.md) | [ডাচ](../nl/README.md) | [এস্তোনিয়ান](../et/README.md) | [ফিনিশ](../fi/README.md) | [ফরাসি](../fr/README.md) | [জার্মান](../de/README.md) | [গ্রিক](../el/README.md) | [হিব্রু](../he/README.md) | [হিন্দি](../hi/README.md) | [হাঙ্গেরীয়](../hu/README.md) | [ইন্দোনেশিয়ান](../id/README.md) | [ইতালিয়ান](../it/README.md) | [জাপানি](../ja/README.md) | [কন্নড়](../kn/README.md) | [খ্মের](../km/README.md) | [কোরিয়ান](../ko/README.md) | [লিথুয়ানিয়ান](../lt/README.md) | [মালয়](../ms/README.md) | [মালয়ালম](../ml/README.md) | [মারাঠি](../mr/README.md) | [নেপালি](../ne/README.md) | [নাইজেরিয়ান পিডজিন](../pcm/README.md) | [নরওয়েজিয়ান](../no/README.md) | [ফার্সি (ফার্সি)](../fa/README.md) | [পোলিশ](../pl/README.md) | [পোর্তুগিজ (ব্রাজিল)](../pt-BR/README.md) | [পোর্তুগিজ (পর্তুগাল)](../pt-PT/README.md) | [পাঞ্জাবি (গুরুমুখি)](../pa/README.md) | [রোমানিয়ান](../ro/README.md) | [রাশিয়ান](../ru/README.md) | [সার্বীয় (সিরিলিক)](../sr/README.md) | [স্লোভাক](../sk/README.md) | [স্লোভেনিয়ান](../sl/README.md) | [স্প্যানিশ](../es/README.md) | [সোয়াহিলি](../sw/README.md) | [সুইডিশ](../sv/README.md) | [ট্যাগালগ (ফিলিপিনো)](../tl/README.md) | [তামিল](../ta/README.md) | [তেলুগু](../te/README.md) | [থাই](../th/README.md) | [তুর্কি](../tr/README.md) | [ইউক্রেনীয়](../uk/README.md) | [উর্দু](../ur/README.md) | [ভিয়েতনামী](../vi/README.md)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রেপোজিটরিটি ৫০+ ভাষার অনুবাদ অন্তর্ভুক্ত করে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
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
> এটি আপনাকে দ্রুত ডাউনলোডের মাধ্যমে কোর্সটি সম্পন্ন করার জন্য প্রয়োজনীয় সবকিছু দেবে।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 আজ azd-এ কী নতুন

> 📌 এই কোর্সটি যাচাই করা হয়েছে **`azd 1.25.6`** (জুন ২০২৬) দ্বারা। আপনার বিল্ড যাচাই করতে `azd version` চালান, এবং সর্বশেষ পেতে `azd upgrade` চালান।

Azure Developer CLI ঐতিহ্যগত ওয়েব অ্যাপ ও API ছাড়িয়ে গেছে। আজ azd হল Azure-এ যে কোনো অ্যাপ্লিকেশন মোতায়েন করার একক টুল — AI-চালিত অ্যাপ ও বুদ্ধিমান এজেন্ট সহ।

এটার মানে আপনার জন্য নিম্নরূপ:

- **AI এজেন্ট এখন প্রথম-শ্রেনীর azd ওয়ার্কলোড।** আপনি একই `azd init` → `azd up` ওয়ার্কফ্লো ব্যবহার করে AI এজেন্ট প্রকল্প ইনিশিয়ালাইজ, ডিপ্লয় এবং পরিচালনা করতে পারবেন।
- **CLI থেকে একটি সম্পূর্ণ এজেন্ট লাইফসাইকেল।** `azure.ai.agents` এক্সটেনশন এখন পুরো যাত্রা কভার করে—`azd ai agent init` স্ক্যাফোল্ড করতে, `azd ai agent invoke` টেস্ট করতে (প্রতিক্রিয়ার সময় আউটপুট সহ), `azd ai agent eval generate` এবং `azd ai agent optimize` মান নির্ণয় ও উন্নত করতে, এবং `azd ai agent delete` পরিষ্কার করতে।
- **আরও AI বিল্ডিং ব্লক।** নতুন প্রিভিউ এক্সটেনশন—`azure.ai.skills` এবং `azure.ai.connections`—আপনাকে পুনঃব্যবহারযোগ্য এজেন্ট দক্ষতা এবং Foundry কানেকশন সরাসরি azd দিয়ে পরিচালনা করতে দেয়।
- **Microsoft Foundry ইন্টিগ্রেশন** মডেল ডিপ্লয়মেন্ট, এজেন্ট হোস্টিং, এবং AI সার্ভিস কনফিগারেশন সরাসরি azd টেমপ্লেট ইকোসিস্টেমে নিয়ে আসে।
- **দৈনন্দিন বেসিকগুলো আরও মসৃণ।** সাম্প্রতিক রিলিজগুলো `azd init` কে idempotent (পুনরায় চালানো নিরাপদ) করেছে, `azd auth login` স্বয়ংক্রিয়ভাবে পুরনো টোকেনগুলো সাফ করতে সক্ষম করেছে, এবং একটি বন্ধুত্বপূর্ণ `azd tool` প্রথম-চলমান সেটআপ প্রম্পট যোগ করেছে।
- **কোর ওয়ার্কফ্লো পরিবর্তিত হয়নি।** আপনি একটি টুডো অ্যাপ, একটি মাইক্রোসার্ভিস, বা একটি মাল্টি-এজেন্ট AI সমাধান ডিপ্লয় করুন—কমান্ডগুলো একই।

> **Aspire ব্যবহারকারীদের জন্য নোট:** Microsoft এখন পণ্যটিকে সহজভাবে **Aspire** (পূর্বে ".NET Aspire") হিসেবে উল্লেখ করে। azd-এর Aspire সমর্থন অপরিবর্তিত—শুধুমাত্র নামই আপডেট করা হয়েছে।

আপনি যদি আগেই azd ব্যবহার করে থাকেন, AI সমর্থন একটি প্রাকৃতিক সম্প্রসারণ—ভিন্ন কোনো টুল বা উন্নত ট্র্যাক নয়। যদি আপনি নতুনভাবে শুরু করছেন, আপনি একটি ওয়ার্কফ্লো শিখবেন যা সব কিছুর জন্য কাজ করে।

---

## 🚀 Azure Developer CLI (azd) কী?

**Azure Developer CLI (azd)** হল একটি ডেভেলপার-বন্ধুত্বপূর্ণ কমান্ড-লাইন টুল যা Azure-এ অ্যাপ্লিকেশন ডিপ্লয় করা সহজ করে। ম্যানুয়ালি ডজনখানেক Azure রিসোর্স তৈরি ও সংযুক্ত করার পরিবর্তে, আপনি একক কমান্ডে পুরো অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন।

### `azd up` এর জাদু

```bash
# এই একক কমান্ড সবকিছু করে:
# ✅ সমস্ত Azure রিসোর্স তৈরি করে
# ✅ নেটওয়ার্কিং এবং নিরাপত্তা কনফিগার করে
# ✅ আপনার অ্যাপ্লিকেশন কোড তৈরি করে
# ✅ Azure-এ ডিপ্লয় করে
# ✅ আপনাকে একটি কাজ করা URL দেয়
azd up
```

**এটাই!** কোন Azure পোর্টালে ক্লিক করা লাগবে না, কোন জটিল ARM টেমপ্লেট আগে শেখার দরকার নেই, কোন ম্যানুয়াল কনফিগারেশন নেই - শুধু Azure-এ কাজ করা অ্যাপ্লিকেশন।

---

## ❓ Azure Developer CLI বনাম Azure CLI: পার্থক্য কী?

এটাই নবীনদের সাধারণত করা সবচেয়ে সাধারণ প্রশ্ন। এখানে সহজ উত্তর:

| বৈশিষ্ট্য | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **উদ্দেশ্য** | ব্যক্তিগত Azure রিসোর্স পরিচালনা করা | সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয় করা |
| **মনোভাব** | অবকাঠামো-কেন্দ্রিক | অ্যাপ্লিকেশন-কেন্দ্রিক |
| **উদাহরণ** | `az webapp create --name myapp...` | `azd up` |
| **শিখার বক্ররেখা** | Azure সার্ভিসগুলো জানতে হবে | শুধু আপনার অ্যাপ জানলেই হবে |
| **উপযুক্ত** | DevOps, অবকাঠামো | ডেভেলপার, প্রোটোটাইপিং |

### সহজ উপমা

- **Azure CLI** হল একটি বাড়ি বানাতে প্রয়োজনীয় সব সরঞ্জাম থাকা - হাতুড়ি, করাত, পেরেক। আপনি যেকোনো কিছু তৈরি করতে পারেন, কিন্তু আপনাকে নির্মাণ জানা লাগবে।
- **Azure Developer CLI** হল একজন কন্ট্রাক্টরকে নিয়োগ করার মতো - আপনি যা চান সেটা বর্ণনা করুন, তারা নির্মাণ সামলাবে।

### কখন কোনটি ব্যবহার করবেন

| পরিস্থিতি | এটি ব্যবহার করুন |
|----------|----------|
| "আমি দ্রুত আমার ওয়েব অ্যাপ ডিপ্লয় করতে চাই" | `azd up` |
| "আমাকে শুধু একটি স্টোরেজ অ্যাকাউন্ট তৈরি করতে হবে" | `az storage account create` |
| "আমি একটি পূর্ণাঙ্গ AI অ্যাপ বানাচ্ছি" | `azd init --template azure-search-openai-demo` |
| "আমাকে একটি নির্দিষ্ট Azure রিসোর্স ডিবাগ করতে হবে" | `az resource show` |
| "আমি মিনিটের মধ্যে প্রোডাকশন-রেডি ডিপ্লয়মেন্ট চাই" | `azd up --environment production` |

### এগুলো একসাথে কাজ করে!

AZD নীচে Azure CLI ব্যবহার করে। আপনি দুটোই ব্যবহার করতে পারেন:
```bash
# আপনার অ্যাপ AZD দিয়ে মোতায়েন করুন
azd up

# তারপর Azure CLI দিয়ে নির্দিষ্ট সম্পদগুলি সূক্ষ্ম সমন্বয় করুন
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-এ টেমপ্লেট খুঁজুন

শূন্য থেকে শুরু করবেন না! **Awesome AZD** হলো প্রস্তুত-ডেপ্লয় টেমপ্লেটগুলোর কমিউনিটি সংগ্রহ:

| রিসোর্স | বিবরণ |
|----------|-------------|
| 🔗 [**Awesome AZD গ্যালারি**](https://azure.github.io/awesome-azd/) | এক-ক্লিকে ডেপ্লয় সহ ২০০+ টেমপ্লেট ব্রাউজ করুন |
| 🔗 [**টেমপ্লেট জমা করুন**](https://github.com/Azure/awesome-azd/issues) | কমিউনিটিতে আপনার নিজস্ব টেমপ্লেট অবদান করুন |
| 🔗 [**GitHub রেপোজিটরি**](https://github.com/Azure/awesome-azd) | স্টার দিন এবং সোর্স এক্সপ্লোর করুন |

### Awesome AZD থেকে জনপ্রিয় AI টেমপ্লেট

```bash
# মাইক্রোসফট ফাউন্ড্রি মডেল + AI অনুসন্ধানের সাথে RAG চ্যাট
azd init --template azure-search-openai-demo

# দ্রুত AI চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart

# ফাউন্ড্রি এজেন্টদের সাথে AI এজেন্টস
azd init --template get-started-with-ai-agents
```

---

## 🎯 ৩ ধাপে শুরু করা

শুরু করার আগে, নিশ্চিত করুন আপনার মেশিনটি আপনি ডিপ্লয় করতে চান সেই টেমপ্লেটের জন্য প্রস্তুত:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If any required check fails, fix that first and then continue with the quick start.

### ধাপ ১: AZD ইন্সটল করুন (২ মিনিট)

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

### ধাপ ২: AZD-এর জন্য প্রমাণীকরণ

```bash
# ঐচ্ছিক যদি আপনি এই কোর্সে সরাসরি Azure CLI কমান্ড ব্যবহার করার পরিকল্পনা করেন
az login

# AZD ওয়ার্কফ্লোগুলির জন্য আবশ্যক
azd auth login
```

If you are not sure which one you need, follow the full setup flow in [ইনস্টলেশন ও সেটআপ](docs/chapter-01-foundation/installation.md#authentication-setup).

### ধাপ ৩: আপনার প্রথম অ্যাপ ডিপ্লয় করুন

```bash
# একটি টেমপ্লেট থেকে আরম্ভ করুন
azd init --template todo-nodejs-mongo

# Azure-এ মোতায়েন করুন (সবকিছু তৈরি করে!)
azd up
```

**🎉 এটুকুই!** আপনার অ্যাপ এখন Azure-এ লাইভ।

### ক্লিন আপ (ভুলবেন না!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 এই কোর্সটি কীভাবে ব্যবহার করবেন

এই কোর্সটি **ক্রমবর্ধমান শেখার** জন্য ডিজাইন করা হয়েছে - যেখানে আপনি স্বাচ্ছন্দ্যবোধ করেন সেখানে শুরু করুন এবং ধাপে ধাপে এগিয়ে যান:

| আপনার অভিজ্ঞতা | এখানে শুরু করুন |
|-----------------|------------|
| **Azure-এ একেবারে নতুন** | [চ্যাপ্টার 1: ফাউন্ডেশন](#-chapter-1-foundation--quick-start) |
| **Azure জানি, AZD-এ নতুন** | [চ্যাপ্টার 1: ফাউন্ডেশন](#-chapter-1-foundation--quick-start) |
| **AI অ্যাপ ডিপ্লয় করতে চান** | [চ্যাপ্টার 2: AI-প্রথম উন্নয়ন](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **হাতেকলমে অনুশীলন চান** | [🎓 ইন্টারঅ্যাকটিভ কর্মশালা](workshop/README.md) - 3-4 ঘন্টা গাইডেড ল্যাব |
| **প্রোডাকশন প্যাটার্ন দরকার** | [চ্যাপ্টার 8: প্রোডাকশন ও এন্টারপ্রাইজ](#-chapter-8-production--enterprise-patterns) |

### দ্রুত সেটআপ

1. **এই রেপোজিটরি ফর্ক করুন**: [![GitHub ফর্ক](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ক্লোন করুন**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **সহায়তা নিন**: [Azure Discord কমিউনিটি](https://discord.com/invite/ByRwuEEgH4)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রেপোজিটরিটি ৫০+ ভাষার অনুবাদ অন্তর্ভুক্ত করে যা ডাউনলোড সাইজ উল্লেখযোগ্যভাবে বাড়ায়। অনুবাদ ছাড়া ক্লোন করতে sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> এটি আপনাকে দ্রুত ডাউনলোডের মাধ্যমে কোর্সটি সম্পন্ন করার জন্য প্রয়োজনীয় সবকিছু দেবে।


## কোর্স ওভারভিউ

ক্রমবর্ধমান শেখার জন্য ডিজাইন করা কাঠামোবদ্ধ অধ্যায়ের মাধ্যমে Azure Developer CLI (azd) আয়ত্ত করুন। **বিশেষ জোর দেওয়া হচ্ছে Microsoft Foundry ইন্টিগ্রেশনের মাধ্যমে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টে।**
### কেন এই কোর্স আধুনিক ডেভেলপারদের জন্য অপরিহার্য

Microsoft Foundry Discord কমিউনিটি অন্তর্দৃষ্টির ভিত্তিতে, **45% ডেভেলপার AI ওয়ার্কলোডের জন্য AZD ব্যবহার করতে চান** কিন্তু নিম্নলিখিত চ্যালেঞ্জগুলোর সম্মুখীন হন:
- জটিল বহু-সার্ভিস AI স্থাপত্য
- প্রোডাকশন AI ডিপ্লয়মেন্ট সম্পর্কিত সেরা অনুশীলনসমূহ  
- Azure AI সার্ভিস ইন্টিগ্রেশন এবং কনফিগারেশন
- AI ওয়ার্কলোডের জন্য খরচ অপ্টিমাইজেশন
- AI-নির্দিষ্ট ডিপ্লয়মেন্ট সমস্যার ট্রাবলশুটিং

### শেখার উদ্দেশ্য

এই কাঠামোবদ্ধ কোর্স সম্পন্ন করে, আপনি:
- **AZD মৌলিক বিষয়াদি আয়ত্ত করুন**: মূল ধারণা, ইনস্টলেশন, এবং কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডিপ্লয় করুন**: Microsoft Foundry সার্ভিসগুলোর সাথে AZD ব্যবহার করুন
- **Infrastructure as Code প্রয়োগ করুন**: Bicep টেমপ্লেট ব্যবহার করে Azure রিসোর্স পরিচালনা করুন
- **ডিপ্লয়মেন্ট ট্রাবলশুট করুন**: সাধারণ সমস্যা সমাধান এবং ডিবাগ সমস্যা
- **প্রোডাকশনের জন্য অপ্টিমাইজ করুন**: নিরাপত্তা, স্কেলিং, মনিটরিং, এবং খরচ ব্যবস্থাপনা
- **মাল্টি-এজেন্ট সলিউশন তৈরি করুন**: জটিল AI স্থাপত্য ডিপ্লয় করুন

## শুরু করার আগে: অ্যাকাউন্ট, অ্যাক্সেস, এবং অনুমানসমূহ

আপনি অধ্যায় 1 শুরু করার আগে, নিশ্চিত করুন যে নিম্নলিখিত বিষয়গুলো প্রস্তুত আছে। এই গাইডের পরে দেয়া ইনস্টলেশন ধাপগুলো এই বেসিকগুলো ইতোমধ্যে সম্পন্ন হয়েছে ধরে নেয়।

- **একটি Azure সাবস্ক্রিপশন**: আপনি কাজের সাবস্ক্রিপশন বা আপনার নিজের অ্যাকাউন্টের বিদ্যমান সাবস্ক্রিপশন ব্যবহার করতে পারেন, অথবা শুরু করতে একটি [ফ্রি ট্রায়াল](https://aka.ms/azurefreetrial) তৈরি করুন।
- **Azure রিসোর্স তৈরি করার অনুমতি**: বেশিরভাগ অনুশীলনের জন্য, আপনার লক্ষ্য সাবস্ক্রিপশন বা রিসোর্স গ্রুপে কমপক্ষে **Contributor** অ্যাক্সেস থাকা উচিত। কিছু অধ্যায়ে ধরা হতে পারে যে আপনি রিসোর্স গ্রুপ, managed identities, এবং RBAC অ্যাসাইনমেন্ট তৈরি করতে পারেন।
- [**একটি GitHub অ্যাকাউন্ট**](https://github.com): ওয়ার্কশপের জন্য রিপোজিটরি ফর্ক করা, নিজের পরিবর্তন ট্র্যাক করা, এবং GitHub Codespaces ব্যবহার করা উপযোগী।
- **টেমপ্লেট রানটাইম পূর্বশর্তসমূহ**: কিছু টেমপ্লেটের জন্য লোকাল টুলগুলো যেমন Node.js, Python, Java, বা Docker প্রয়োজন। শুরু করার আগে setup validator চালান যাতে আপনি দ্রুত মিসিং টুলগুলো ধরতে পারেন।
- **মৌলিক টার্মিনাল পরিচিতি**: আপনাকে বিশেষজ্ঞ হতে হবে না, তবে আপনাকে `git clone`, `azd auth login`, এবং `azd up` এর মতো কমান্ড চালাতে স্বাচ্ছন্দ্য হওয়া উচিত।

> **এন্টারপ্রাইজ সাবস্ক্রিপশনে কাজ করছেন?**
> যদি আপনার Azure পরিবেশ একজন অ্যাডমিনিস্ট্রেটর দ্বারা পরিচালিত হয়, আগে থেকেই নিশ্চিত করুন যে আপনি যে সাবস্ক্রিপশন বা রিসোর্স গ্রুপ ব্যবহার করার পরিকল্পনা করছেন সেখানে রিসোর্স ডিপ্লয় করতে পারবেন। না পারলে, শুরু করার আগে একটি স্যান্ডবক্স সাবস্ক্রিপশন বা Contributor অ্যাক্সেসের জন্য অনুরোধ করুন।

> **Azure-এ নতুন?**
> নিজের Azure ট্রায়াল বা pay-as-you-go সাবস্ক্রিপশন https://aka.ms/azurefreetrial থেকে শুরু করুন যাতে আপনি অনুশীলনগুলো শুরু থেকে শেষ পর্যন্ত টেন্যান্ট-স্তরের অনুমোদনের জন্য অপেক্ষা না করে সম্পন্ন করতে পারেন।

## 🗺️ কোর্স ম্যাপ: অধ্যায় অনুযায়ী দ্রুত ন্যাভিগেশন

প্রতিটি অধ্যায়ের জন্য একটি নির্দিষ্ট README আছে যাতে শেখার উদ্দেশ্য, দ্রুত শুরু, এবং অনুশীলন রয়েছে:

| অধ্যায় | বিষয় | পাঠ/পাঠসমূহ | সময়কাল | জটিলতা |
|---------|-------|---------|----------|------------|
| **[অধ্যায় 1: ফাউন্ডেশন](docs/chapter-01-foundation/README.md)** | শুরু করা | [AZD বেসিক্স](docs/chapter-01-foundation/azd-basics.md) &#124; [ইনস্টলেশন](docs/chapter-01-foundation/installation.md) &#124; [প্রথম প্রকল্প](docs/chapter-01-foundation/first-project.md) | 30-45 মিনিট | ⭐ |
| **[অধ্যায় 2: AI ডেভেলপমেন্ট](docs/chapter-02-ai-development/README.md)** | AI-প্রথম অ্যাপস | [Foundry ইন্টিগ্রেশন](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI এজেন্ট](docs/chapter-02-ai-development/agents.md) &#124; [AI মডেল ডিপ্লয়মেন্ট](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ওয়ার্কশপ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ঘন্টা | ⭐⭐ |
| **[অধ্যায় 3: কনফিগারেশন](docs/chapter-03-configuration/README.md)** | অথেন্টিকেশন ও সিকিউরিটি | [কনফিগারেশন](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 মিনিট | ⭐⭐ |
| **[অধ্যায় 4: ইনফ্রাস্ট্রাকচার](docs/chapter-04-infrastructure/README.md)** | IaC ও ডিপ্লয়মেন্ট | [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [প্রোভিশনিং](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ঘন্টা | ⭐⭐⭐ |
| **[অধ্যায় 5: মাল্টি-এজেন্ট](docs/chapter-05-multi-agent/README.md)** | AI এজেন্ট সলিউশন | [রিটেইল সিনারিও](examples/retail-scenario.md) &#124; [সমন্বয় প্যাটার্নস](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ঘন্টা | ⭐⭐⭐⭐ |
| **[অধ্যায় 6: প্রি-ডিপ্লয়মেন্ট](docs/chapter-06-pre-deployment/README.md)** | পরিকল্পনা ও ভ্যালিডেশন | [প্রিফ্লাইট চেকস](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ক্যাপাসিটি প্ল্যানিং](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU সিলেকশন](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [অ্যাপ ইনসাইটস](docs/chapter-06-pre-deployment/application-insights.md) | 1 ঘন্টা | ⭐⭐ |
| **[অধ্যায় 7: ট্রাবলশুটিং](docs/chapter-07-troubleshooting/README.md)** | ডিবাগ ও ফিক্স | [সাধারণ সমস্যা](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI সমস্যা](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ঘন্টা | ⭐⭐ |
| **[অধ্যায় 8: প্রোডাকশন](docs/chapter-08-production/README.md)** | এন্টারপ্রাইজ প্যাটার্নস | [প্রোডাকশন অনুশীলন](docs/chapter-08-production/production-ai-practices.md) | 2-3 ঘন্টা | ⭐⭐⭐⭐ |
| **[🎓 ওয়ার্কশপ](workshop/README.md)** | প্রায়োগিক ল্যাব | [ভূমিকা](workshop/docs/instructions/0-Introduction.md) &#124; [নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ভ্যালিডেশন](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [ডিকনস্ট্রাকশন](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [টিয়ারডাউন](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [সমাপ্তি](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ঘন্টা | ⭐⭐ |

**মোট কোর্স সময়কাল:** ~10-14 ঘন্টা | **দক্ষতা উন্নয়ন:** শিক্ষানবিস → প্রোডাকশন-রেডি

---

## 📚 শেখার অধ্যায়সমূহ

*অভিজ্ঞতা স্তর এবং লক্ষ্য অনুযায়ী আপনার শেখার পথ নির্বাচন করুন*

### 🚀 অধ্যায় 1: ফাউন্ডেশন ও দ্রুত শুরু
**পূর্বশর্তসমূহ**: Azure সাবস্ক্রিপশন, মৌলিক কমান্ড লাইন জ্ঞান  
**সময়কাল**: 30-45 মিনিট  
**জটিলতা**: ⭐

#### আপনি কী শিখবেন
- Azure Developer CLI-এর মৌলিক বিষয়াবলী বোঝা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- আপনার প্রথম সফল ডিপ্লয়মেন্ট

#### শেখার সম্পদ
- **🎯 এখানে শুরু করুন**: [Azure Developer CLI কী?](#what-is-azure-developer-cli)
- **📖 তত্ত্ব**: [AZD বেসিক্স](docs/chapter-01-foundation/azd-basics.md) - মূল ধারণা এবং পরিভাষা
- **⚙️ সেটআপ**: [ইনস্টলেশন ও সেটআপ](docs/chapter-01-foundation/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট গাইড
- **🛠️ হ্যান্ডস-অন**: [আপনার প্রথম প্রকল্প](docs/chapter-01-foundation/first-project.md) - ধাপে ধাপে টিউটোরিয়াল
- **📋 দ্রুত রেফারেন্স**: [কমান্ড চিট শীট](resources/cheat-sheet.md)

#### ব্যবহারিক অনুশীলন
```bash
# দ্রুত ইনস্টলেশন পরীক্ষা
azd version

# আপনার প্রথম অ্যাপ্লিকেশন মোতায়েন করুন
azd init --template todo-nodejs-mongo
azd up
```

**💡 অধ্যায়ের ফলাফল**: AZD ব্যবহার করে একটি সহজ ওয়েব অ্যাপ্লিকেশন Azure-এ সফলভাবে ডিপ্লয় করা

**✅ সাফল্য যাচাইকরণ:**
```bash
# অধ্যায় ১ শেষ করার পরে, আপনি করতে সক্ষম হবেন:
azd version              # ইনস্টল করা সংস্করণ দেখায়
azd init --template todo-nodejs-mongo  # প্রকল্পটি প্রাথমিকীকরণ করে
azd up                  # Azure-এ স্থাপন করে
azd show                # চলমান অ্যাপের URL দেখায়
# অ্যাপ্লিকেশনটি ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # রিসোর্সগুলো পরিষ্কার করে
```

**📊 সময় বিনিয়োগ:** 30-45 মিনিট  
**📈 পরে দক্ষতা স্তর:** আপনি স্বাধীনভাবে বেসিক অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন
**📈 পরে দক্ষতা স্তর:** আপনি স্বাধীনভাবে বেসিক অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন

---

### 🤖 অধ্যায় 2: AI-ফার্স্ট ডেভেলপমেন্ট (AI ডেভেলপারদের জন্য সুপারিশকৃত)
**পূর্বশর্তসমূহ**: অধ্যায় 1 সম্পন্ন  
**সময়কাল**: 1-2 ঘন্টা  
**জটিলতা**: ⭐⭐

#### আপনি কী শিখবেন
- Microsoft Foundry-এর সাথে AZD ইন্টিগ্রেশন
- AI-চালিত অ্যাপ্লিকেশন ডিপ্লয় করা
- AI সার্ভিস কনফিগারেশনগুলো বোঝা

#### শেখার সম্পদ
- **🎯 এখানে শুরু করুন**: [Microsoft Foundry ইন্টিগ্রেশন](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI এজেন্টস**: [AI এজেন্ট গাইড](docs/chapter-02-ai-development/agents.md) - AZD দিয়ে বুদ্ধিমান এজেন্ট ডিপ্লয় করুন
- **📖 প্যাটার্নস**: [AI মডেল ডিপ্লয়মেন্ট](docs/chapter-02-ai-development/ai-model-deployment.md) - AI মডেল ডিপ্লয় এবং ম্যানেজ করুন
- **🛠️ ওয়ার্কশপ**: [AI ওয়ার্কশপ ল্যাব](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সলিউশনগুলো AZD-র জন্য রেডি করুন
- **🎥 ইন্টারেক্টিভ গাইড**: [ওয়ার্কশপ ম্যাটেরিয়ালস](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখা MkDocs * DevContainer Environment
- **📋 টেমপ্লেটস**: [Microsoft Foundry টেমপ্লেটস](#কর্মশালা-সম্পদ)
- **📝 উদাহরণসমূহ**: [AZD ডিপ্লয়মেন্ট উদাহরণ](examples/README.md)

#### ব্যবহারিক অনুশীলন
```bash
# আপনার প্রথম AI অ্যাপ্লিকেশন মোতায়েন করুন
azd init --template azure-search-openai-demo
azd up

# অতিরিক্ত AI টেমপ্লেটগুলো চেষ্টা করে দেখুন
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 অধ্যায়ের ফলাফল**: RAG সক্ষমতাসম্পন্ন একটি AI-চালিত চ্যাট অ্যাপ্লিকেশন ডিপ্লয় এবং কনফিগার করুন

**✅ সাফল্য যাচাইকরণ:**
```bash
# অধ্যায় ২ পড়ার পরে, আপনি সক্ষম হবেন:
azd init --template azure-search-openai-demo
azd up
# AI চ্যাট ইন্টারফেস পরীক্ষা করা
# প্রশ্ন করা এবং উৎসসহ AI-চালিত উত্তর পাওয়া
# সার্চ ইন্টিগ্রেশন কাজ করছে কিনা যাচাই করা
azd monitor  # Application Insights টেলিমেট্রি প্রদর্শন করে কিনা পরীক্ষা করা
azd down --force --purge
```

**📊 সময় বিনিয়োগ:** 1-2 ঘন্টা  
**📈 পরে দক্ষতা স্তর:** প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় এবং কনফিগার করতে পারবেন  
**💰 খরচ সচেতনতা:** ডেভেলপমেন্ট খরচ প্রায় $80-150/মাস, প্রোডাকশন খরচ $300-3500/মাস বোঝা

#### 💰 AI ডিপ্লয়মেন্টের জন্য খরচ বিবেচনা

**ডেভেলপমেন্ট পরিবেশ (অনুমানিত $80-150/মাস):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/মাস (token ব্যবহারের উপর নির্ভর করে)
- AI Search (Basic টিয়ার): $75/মাস
- Container Apps (Consumption): $0-20/মাস
- Storage (Standard): $1-5/মাস

**প্রোডাকশন পরিবেশ (অনুমানিত $300-3,500+/মাস):**
- Microsoft Foundry Models (নিয়মিত পারফরমেন্সের জন্য PTU): $3,000+/মাস OR Pay-as-go with high volume
- AI Search (Standard টিয়ার): $250/মাস
- Container Apps (Dedicated): $50-100/মাস
- Application Insights: $5-50/মাস
- Storage (Premium): $10-50/মাস

**💡 খরচ অপ্টিমাইজেশন টিপস:**
- শেখার জন্য **Free Tier** Microsoft Foundry Models ব্যবহার করুন (Azure OpenAI 50,000 tokens/মাস অন্তর্ভুক্ত)
- অ্যাক্টিভভাবে ডেভেলপ না করার সময় রিসোর্স ডিলোকেট করার জন্য `azd down` চালান
- consumption-based বিলিং দিয়ে শুরু করুন, শুধুমাত্র প্রোডাকশনের জন্য PTU-তে আপগ্রেড করুন
- ডিপ্লয়মেন্টের আগে খরচ অনুমান করার জন্য `azd provision --preview` ব্যবহার করুন
- অটো-স্কেলিং চালু করুন: কেবলমাত্র প্রকৃত ব্যবহারের জন্য অর্থ প্রদান করুন

খরচ মনিটরিং:
```bash
# আনুমানিক মাসিক খরচ পরীক্ষা করুন
azd provision --preview

# Azure পোর্টালে বাস্তব খরচ পর্যবেক্ষণ করুন
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ অধ্যায় 3: কনফিগারেশন ও অথেন্টিকেশন
**পূর্বশর্তসমূহ**: অধ্যায় 1 সম্পন্ন  
**সময়কাল**: 45-60 মিনিট  
**জটিলতা**: ⭐⭐

#### আপনি কী শিখবেন
- পরিবেশ কনফিগারেশন এবং ব্যবস্থাপনা
- অথেন্টিকেশন এবং সিকিউরিটি সেরা অনুশীলনসমূহ
- রিসোর্স নামকরণ এবং সংগঠন

#### শেখার সম্পদ
- **📖 কনফিগারেশন**: [কনফিগারেশন গাইড](docs/chapter-03-configuration/configuration.md) - পরিবেশ সেটআপ
- **🔐 সিকিউরিটি**: [অথেন্টিকেশন প্যাটার্নস ও managed identity](docs/chapter-03-configuration/authsecurity.md) - অথেন্টিকেশন প্যাটার্নস
- **📝 উদাহরণসমূহ**: [ডাটাবেস অ্যাপ উদাহরণ](examples/database-app/README.md) - AZD ডাটাবেস উদাহরণসমূহ

#### ব্যবহারিক অনুশীলন
- একাধিক পরিবেশ কনফিগার করুন (dev, staging, prod)
- managed identity অথেন্টিকেশন সেট আপ করুন
- পরিবেশ-নির্দিষ্ট কনফিগারেশন বাস্তবায়ন করুন

**💡 অধ্যায়ের ফলাফল**: সঠিক অথেন্টিকেশন এবং সিকিউরিটির সাথে একাধিক পরিবেশ পরিচালনা করুন

---

### 🏗️ অধ্যায় 4: Infrastructure as Code ও ডিপ্লয়মেন্ট
**পূর্বশর্তসমূহ**: অধ্যায় 1-3 সম্পন্ন  
**সময়কাল**: 1-1.5 ঘন্টা  
**জটিলতা**: ⭐⭐⭐

#### আপনি কী শিখবেন
- উন্নত ডিপ্লয়মেন্ট প্যাটার্নস
- Bicep ব্যবহার করে Infrastructure as Code
- রিসোর্স প্রোভিশনিং কৌশল

#### শেখার সম্পদ
- **📖 ডিপ্লয়মেন্ট**: [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ ওয়ার্কফ্লো
- **🏗️ প্রোভিশনিং**: [প্রোভিশনিং রিসোর্স](docs/chapter-04-infrastructure/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 উদাহরণসমূহ**: [কন্টেইনার অ্যাপ উদাহরণ](../../examples/container-app) - কন্টেইনারাইজড ডিপ্লয়মেন্ট

#### ব্যবহারিক অনুশীলন
- কাস্টম Bicep টেমপ্লেট তৈরি করুন
- বহু-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন
- ব্লু-গ্রিন ডিপ্লয়মেন্ট কৌশল বাস্তবায়ন করুন

**💡 অধ্যায়ের ফলাফল**: কাস্টম ইনফ্রাস্ট্রাকচার টেমপ্লেট ব্যবহার করে জটিল বহু-সার্ভিস অ্যাপ্লিকেশন ডিপ্লয় করুন
### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**পূর্বশর্ত**: Chapters 1-2 সম্পন্ন  
**সময়কাল**: 2-3 ঘন্টা  
**কঠিনতা**: ⭐⭐⭐⭐

#### আপনি কী শিখবেন
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্নসমূহ
- এজেন্ট অর্কেস্ট্রেশন এবং সমন্বয়
- প্রোডাকশন-রেডি AI ডিপ্লয়মেন্ট

#### শেখার সম্পদ
- **🤖 ফিচারড প্রজেক্ট**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - সম্পূর্ণ বাস্তবায়ন
- **🛠️ ARM টেমপ্লেটস**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - এক-ক্লিক ডিপ্লয়মেন্ট
- **📖 আর্কিটেকচার**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - প্যাটার্নসমূহ

#### ব্যবহারিক অনুশীলন
```bash
# সম্পূর্ণ খুচরা মাল্টি-এজেন্ট সমাধান স্থাপন করুন
cd examples/retail-multiagent-arm-template
./deploy.sh

# এজেন্ট কনফিগারেশনগুলি অন্বেষণ করুন
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 চ্যাপ্টার ফলাফল**: Customer এবং Inventory এজেন্টসমূহ সহ প্রোডাকশন-রেডি মাল্টি-এজেন্ট AI সলিউশন ডিপ্লয় এবং পরিচালনা করুন

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**পূর্বশর্ত**: Chapter 4 সম্পন্ন  
**সময়কাল**: 1 ঘন্টা  
**কঠিনতা**: ⭐⭐

#### আপনি কী শিখবেন
- ক্যাপাসিটি প্ল্যানিং এবং রিসোর্স যাচাই
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট চেক এবং অটোমেশন

#### শেখার সম্পদ
- **📊 পরিকল্পনা**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স যাচাই
- **💰 নির্বাচন**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - খরচ-কার্যকর পছন্দসমূহ
- **✅ যাচাই**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - অটোমেটেড স্ক্রিপ্টসমূহ

#### ব্যবহারিক অনুশীলন
- ক্যাপাসিটি যাচাই স্ক্রিপ্ট চালান
- খরচের জন্য SKU নির্বাচন অপ্টিমাইজ করুন
- অটোমেটেড প্রি-ডিপ্লয়মেন্ট চেক বাস্তবায়ন করুন

**💡 চ্যাপ্টার ফলাফল**: কার্যকরীভাবে ডিপ্লয়মেন্টগুলিকে সম্পাদনের আগে যাচাই এবং অপ্টিমাইজ করুন

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**পূর্বশর্ত**: যে কোনো ডিপ্লয়মেন্ট চ্যাপ্টার সম্পন্ন  
**সময়কাল**: 1-1.5 ঘন্টা  
**কঠিনতা**: ⭐⭐

#### আপনি কী শিখবেন
- সিস্টেম্যাটিক ডিজাবাগিং পদ্ধতি
- সাধারণ সমস্যা ও সমাধানসমূহ
- AI-নির্দিষ্ট ট্রবলশুটিং

#### শেখার সম্পদ
- **🔧 সাধারণ সমস্যা**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ এবং সমাধান
- **🕵️ ডিবাগিং**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ধাপে ধাপে কৌশলসমূহ
- **🤖 AI সমস্যা**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI সার্ভিস সম্পর্কিত সমস্যাসমূহ

#### ব্যবহারিক অনুশীলন
- ডিপ্লয়মেন্ট ব্যর্থতার কারণ নির্ণয় করুন
- অথেন্টিকেশন সমস্যা সমাধান করুন
- AI সার্ভিস কানেক্টিভিটি ডিবাগ করুন

**💡 চ্যাপ্টার ফলাফল**: স্বাধীনভাবে সাধারণ ডিপ্লয়মেন্ট সমস্যা নির্ণয় ও সমাধান করুন

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**পূর্বশর্ত**: Chapters 1-4 সম্পন্ন  
**সময়কাল**: 2-3 ঘন্টা  
**কঠিনতা**: ⭐⭐⭐⭐

#### আপনি কী শিখবেন
- প্রোডাকশন ডিপ্লয়মেন্ট কৌশল
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নসমূহ
- মনিটরিং এবং খরচ অপ্টিমাইজেশন

#### শেখার সম্পদ
- **🏭 প্রোডাকশন**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্নসমূহ
- **📝 উদাহরণসমূহ**: [Microservices Example](../../examples/microservices) - জটিল আর্কিটেকচার
- **📊 মনিটরিং**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - মনিটরিং

#### ব্যবহারিক অনুশীলন
- এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নসমূহ বাস্তবায়ন করুন
- ব্যাপক মনিটরিং সেট আপ করুন
- উপযুক্ত গভর্নেন্স সহ প্রোডাকশনে ডিপ্লয় করুন

**💡 চ্যাপ্টার ফলাফল**: পূর্ণ প্রোডাকশন সক্ষমতার সাথে এন্টারপ্রাইজ-রেডি অ্যাপ্লিকেশন ডিপ্লয় করুন

---

## 🎓 কর্মশালা ওভারভিউ: হ্যান্ডস-অন লার্নিং অভিজ্ঞতা

> **⚠️ WORKSHOP STATUS: Active Development**  
> কর্মশালা উপকরণ বর্তমানে বিকাশ ও পরিশোধনাধীন। মূল মডিউলগুলি কার্যকরী, কিন্তু কিছু উন্নত সেকশন অসম্পূর্ণ। আমরা সক্রিয়ভাবে সমস্ত কন্টেন্ট সম্পন্ন করার উপর কাজ করছি। [Track progress →](workshop/README.md)

### ইন্টারেক্টিভ কর্মশালা উপকরণ
**ব্রাউজার-ভিত্তিক টুল এবং গাইডেড অনুশীলনের মাধ্যমে সমগ্রায়িত হ্যান্ডস-অন শেখার অভিজ্ঞতা**

আমাদের কর্মশালা উপকরণ অধ্যায়ভিত্তিক পাঠ্যক্রমকে সম্পূরক করে একটি কাঠামোবদ্ধ, ইন্টারেক্টিভ শেখার অভিজ্ঞতা প্রদান করে। কর্মশালাটি স্ব-মরণশীল শেখার এবং ইন্সট্রাকটর-নেতৃত্বাধীন সেশন উভয়ের জন্য ডিজাইন করা হয়েছে।

#### 🛠️ কর্মশালা বৈশিষ্ট্যসমূহ
- **ব্রাউজার-ভিত্তিক ইন্টারফেস**: সার্চ, কপি, এবং থিম বৈশিষ্ট্যসহ সম্পূর্ণ MkDocs-চালিত কর্মশালা
- **GitHub Codespaces ইন্টিগ্রেশন**: এক-ক্লিক ডেভেলপমেন্ট এনভায়রনমেন্ট সেটআপ
- **গঠনমূলক শেখার পথ**: 8-মডিউল গাইডেড অনুশীলন (মোট 3-4 ঘন্টা)
- **প্রগ্রেসিভ পদ্ধতি**: পরিচিতি → নির্বাচন → যাচাই → ডিকনস্ট্রাকশন → কনফিগারেশন → কাস্টমাইজেশন → টিয়ারডাউন → সমাপনী
- **ইন্টারেক্টিভ DevContainer এনভায়রনমেন্ট**: প্রি-কনফিগার্ড টুল এবং ডিপেন্ডেন্সি

#### 📚 কর্মশালা মডিউল স্ট্রাকচার
কর্মশালা একটি **8-মডিউল প্রগ্রেসিভ মেথডোলজি** অনুসরণ করে যা আপনাকে আবিষ্কার থেকে ডিপ্লয়মেন্ট দক্ষতায় নিয়ে যায়:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | শেখার উদ্দেশ্য, পূর্বশর্ত এবং কর্মশালার কাঠামো বোঝা | 15 min |
| **1. Selection** | Template Discovery | AZD টেমপ্লেট অন্বেষণ করুন এবং আপনার সিনারিওর জন্য সঠিক AI টেমপ্লেট নির্বাচন করুন | 20 min |
| **2. Validation** | Deploy & Verify | `azd up` দিয়ে টেমপ্লেট ডিপ্লয় করুন এবং অবকাঠামো কাজ করছে কিনা যাচাই করুন | 30 min |
| **3. Deconstruction** | Understand Structure | টেমপ্লেট আর্কিটেকচার, Bicep ফাইল, এবং কোড অর্গানাইজেশন অন্বেষণ করতে GitHub Copilot ব্যবহার করুন | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | `azure.yaml` কনফিগারেশন, লাইফসাইকল হুক, এবং এনভায়রনমেন্ট ভ্যারিয়েবল সম্বন্ধে দক্ষতা অর্জন করুন | 30 min |
| **5. Customization** | Make It Yours | AI Search, ট্রেসিং, মূল্যায়ন সক্ষম করুন এবং আপনার সিনারিওর জন্য কাস্টমাইজ করুন | 45 min |
| **6. Teardown** | Clean Up | `azd down --purge` দিয়ে নিরাপদভাবে রিসোর্স ডিপ্রোভিশন করুন | 15 min |
| **7. Wrap-up** | Next Steps | অর্জিত বিষয়বস্তু, মূল ধারণা পর্যালোচনা করুন এবং আপনার শেখার যাত্রা চালিয়ে যান | 15 min |

**কর্মশালা প্রবাহ:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 কর্মশালা শুরু করা
```bash
# বিকল্প 1: GitHub Codespaces (প্রস্তাবিত)
# রিপোজিটরিতে "Code" → "Create codespace on main" এ ক্লিক করুন

# বিকল্প 2: স্থানীয় ডেভেলপমেন্ট
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md-এ সেটআপ নির্দেশিকা অনুসরণ করুন
```

#### 🎯 কর্মশালা শেখার ফলাফল
কর্মশালা সম্পন্ন করে, অংশগ্রহণকারীরা পারবেন:
- **প্রোডাকশন AI অ্যাপ্লিকেশন ডিপ্লয়**: Microsoft Foundry সার্ভিসসমূহ ব্যবহার করে AZD ব্যবহার করুন
- **মাল্টি-এজেন্ট আর্কিটেকচার আয়ত্ত করুন**: সমন্বিত AI এজেন্ট সলিউশন বাস্তবায়ন করুন
- **সিকিউরিটি সেরা অনুশীলন প্রয়োগ করুন**: অথেন্টিকেশন এবং অ্যাক্সেস কন্ট্রোল কনফিগার করুন
- **স্কেলিংয়ের জন্য অপ্টিমাইজ করুন**: খরচ-কার্যকর, পারফরম্যান্ট ডিপ্লয়মেন্ট ডিজাইন করুন
- **ডিপ্লয়মেন্ট ট্রবলশুট করুন**: সাধারণ সমস্যা স্বাধীনভাবে সমাধান করুন

#### 📖 কর্মশালা সম্পদ
- **🎥 ইন্টারেক্টিভ গাইড**: [Workshop Materials](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখার পরিবেশ
- **📋 মডিউল-বাই-মডিউল নির্দেশিকা**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - কর্মশালা ওভারভিউ এবং উদ্দেশ্য
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI টেমপ্লেট খুঁজে বাছাই করুন
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - টেমপ্লেট ডিপ্লয় এবং যাচাই করুন
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - টেমপ্লেট আর্কিটেকচার অন্বেষণ করুন
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml আয়ত্ত করুন
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - আপনার সিনারিওর জন্য কাস্টমাইজ করুন
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - রিসোর্স মোছা
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - পর্যালোচনা এবং পরবর্তী পদক্ষেপ
- **🛠️ AI ওয়ার্কশপ ল্যাব**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-কেন্দ্রিক অনুশীলন
- **💡 দ্রুত সূচনা**: [Workshop Setup Guide](workshop/README.md#quick-start) - এনভায়রনমেন্ট কনফিগারেশন

**উপযুক্ত জন্য**: কর্পোরেট ট্রেনিং, বিশ্ববিদ্যালয় কোর্স, স্ব-গতি শেখা, এবং ডেভেলপার বুটক্যাম্প।

---

## 📖 ডীপ ডাইভ: AZD সক্ষমতা

বেসিক পয়েন্টগুলির বাইরে, AZD প্রোডাকশন ডিপ্লয়মেন্টের জন্য শক্তিশালী বৈশিষ্ট্য প্রদান করে:

- **টেমপ্লেট-ভিত্তিক ডিপ্লয়মেন্ট** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নগুলির জন্য প্রি-বিল্ট টেমপ্লেট ব্যবহার করুন
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড** - Bicep বা Terraform ব্যবহার করে Azure রিসোর্স ম্যানেজ করুন  
- **ইন্টিগ্রেটেড ওয়ার্কফ্লো** - অ্যাপ্লিকেশন প্রোভিশন, ডিপ্লয় এবং মনিটরিং নির্বিঘ্নে করুন
- **ডেভেলপার-বন্ধু** - ডেভেলপার প্রোডাকটিভিটি এবং অভিজ্ঞতার জন্য অপ্টিমাইজড

### **AZD + Microsoft Foundry: AI ডিপ্লয়মেন্টের জন্য উপযুক্ত**

**কেন AI সলিউশনের জন্য AZD?** AZD AI ডেভেলপাররা যে শীর্ষ সমস্যা সম্মুখীন হন সেগুলোকে সমাধান করে:

- **AI-রেডি টেমপ্লেটস** - Microsoft Foundry Models, Azure AI Services, এবং ML ওয়ার্কলোডের জন্য প্রি-কনফিগার্ড টেমপ্লেট
- **সিকিউর AI ডিপ্লয়মেন্ট** - AI সার্ভিস, API কী, এবং মডেল এন্ডপয়েন্টগুলোর জন্য বিল্ট-ইন সিকিউরিটি প্যাটার্ন  
- **প্রোডাকশন AI প্যাটার্নস** - স্কেলেবল, খরচ-কার্যকর AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টের সেরা অনুশীলন
- **এন্ড-টু-এন্ড AI ওয়ার্কফ্লো** - মডেল ডেভেলপমেন্ট থেকে প্রোডাকশন ডিপ্লয়মেন্ট এবং উপযুক্ত মনিটরিং পর্যন্ত
- **খরচ অপ্টিমাইজেশন** - AI ওয়ার্কলোডের জন্য স্মার্ট রিসোর্স বরাদ্দ এবং স্কেলিং কৌশল
- **Microsoft Foundry ইন্টিগ্রেশন** - Microsoft Foundry মডেল ক্যাটালগ এবং এন্ডপয়েন্টের সাথে নির্বিঘ্ন সংযোগ

---

## 🎯 টেমপ্লেটস ও উদাহরণ লাইব্রেরি

### ফিচারড: Microsoft Foundry টেমপ্লেটস
**AI অ্যাপ্লিকেশনগুলো আপনি যদি ডিপ্লয় করেন তবে এখান থেকেই শুরু করুন!**

> **Note:** এই টেমপ্লেটগুলো বিভিন্ন AI প্যাটার্ন প্রদর্শন করে। কিছু হলো external Azure Samples, কিছু লোকাল বাস্তবায়ন।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### ফিচারড: সম্পূর্ণ লার্নিং সিনারিওসমূহ
**প্রোডাকশন-রেডি অ্যাপ্লিকেশন টেমপ্লেটসমূহ যা লার্নিং চ্যাপ্টারগুলোর সাথে ম্যাপ করা হয়েছে**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### উদাহরণের ধরন অনুসারে শেখা

> **📌 লোকাল বনাম এক্সটারনাল উদাহরণ:**  
> **Local Examples** (এই রেপোজিটরিতে) = অবিলম্বে ব্যবহারের জন্য প্রস্তুত  
> **External Examples** (Azure Samples) = লিঙ্ককৃত রেপোজিটরি থেকে ক্লোন করুন

#### লোকাল উদাহরণসমূহ (ব্যবহারের জন্য প্রস্তুত)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM টেমপ্লেটসহ সম্পূর্ণ প্রোডাকশন-রেডি বাস্তবায়ন
  - মাল্টি-এজেন্ট আর্কিটেকচার (Customer + Inventory এজেন্ট)
  - বিস্তৃত মনিটরিং এবং মূল্যায়ন
  - ARM টেমপ্লেট মাধ্যমে এক-ক্লিক ডিপ্লয়মেন্ট

#### লোকাল উদাহরণসমূহ - কনটেইনার অ্যাপ্লিকেশনসমূহ (Chapters 2-5)
**এই রেপোজিটরিতে বিস্তৃত কনটেইনার ডিপ্লয়মেন্ট উদাহরণসমূহ:**
- [**কন্টেইনার অ্যাপ উদাহরণসমূহ**](examples/container-app/README.md) - কন্টেইনারাইজড ডিপ্লয়মেন্টের সম্পূর্ণ গাইড
  - [সহজ Flask API](../../examples/container-app/simple-flask-api) - মৌলিক REST API স্কেল-টু-জিরো সহ
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../examples/container-app/microservices) - প্রোডাকশন-রেডি বহু-সার্ভিস ডিপ্লয়মেন্ট
  - দ্রুত শুরু, প্রোডাকশন, এবং উন্নত ডিপ্লয়মেন্ট প্যাটার্ন
  - মনিটরিং, সিকিউরিটি, এবং খরচ অপ্টিমাইজেশন নির্দেশনা

#### বাহ্যিক উদাহরণ - সহজ অ্যাপ্লিকেশন (অধ্যায় 1-2)
**শুরু করতে নিচের Azure Samples রিপোজিটরি ক্লোন করুন:**
- [সহজ ওয়েব অ্যাপ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - বেসিক ডিপ্লয়মেন্ট প্যাটার্ন
- [স্ট্যাটিক ওয়েবসাইট - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - স্ট্যাটিক কনটেন্ট ডিপ্লয়মেন্ট
- [কন্টেইনার অ্যাপ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ডিপ্লয়মেন্ট

#### বাহ্যিক উদাহরণ - ডাটাবেস ইন্টিগ্রেশন (অধ্যায় 3-4)  
- [ডাটাবেস অ্যাপ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ডাটাবেস সংযোগ প্যাটার্ন
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - সার্ভারলেস ডেটা ওয়ার্কফ্লো

#### বাহ্যিক উদাহরণ - উন্নত প্যাটার্ন (অধ্যায় 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - বহু-সার্ভিস আর্কিটেকচার
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ব্যাকগ্রাউন্ড প্রসেসিং  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - প্রোডাকশন-রেডি ML প্যাটার্ন

### বাহ্যিক টেমপ্লেট সংগ্রহসমূহ
- [**অফিশিয়াল AZD টেমপ্লেট গ্যালারি**](https://azure.github.io/awesome-azd/) - অফিসিয়াল এবং কমিউনিটি টেমপ্লেটগুলোর নির্বাচিত সংগ্রহ
- [**Azure Developer CLI টেমপ্লেটসমূহ**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn টেমপ্লেট ডকুমেন্টেশন
- [**উদাহরণ ডিরেক্টরি**](examples/README.md) - স্থানীয় শেখার উদাহরণসমূহ বিস্তারিত ব্যাখ্যার সাথে

---

## 📚 শেখার সম্পদ ও রেফারেন্স

### দ্রুত রেফারেন্স
- [**কমান্ড চিটশিট**](resources/cheat-sheet.md) - অধ্যায় অনুযায়ী সংগঠিত প্রয়োজনীয় azd কমান্ডসমূহ
- [**শব্দকোষ**](resources/glossary.md) - Azure এবং azd পরিভাষা  
- [**প্রায়শই জিজ্ঞাসিত প্রশ্ন**](resources/faq.md) - শেখার অধ্যায় অনুযায়ী সংগঠিত সাধারণ প্রশ্নাবলি
- [**স্টাডি গাইড**](resources/study-guide.md) - বিস্তৃত অনুশীলনী

### প্রায়োগিক ওয়ার্কশপসমূহ
- [**AI ওয়ার্কশপ ল্যাব**](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলোকে AZD-ডিপ্লয়েবল করুন (2-3 ঘন্টা)
- [**ইন্টার‌্যাকটিভ ওয়ার্কশপ**](workshop/README.md) - MkDocs এবং GitHub Codespaces সহ 8-মডিউল নির্দেশিত অনুশীলনসমূহ
  - অনুসরণ করে: পরিচিতি → নির্বাচন → যাচাই → বিশ্লেষণ → কনফিগারেশন → কাস্টমাইজেশন → উপসারণ → সারসংক্ষেপ

### বাহ্যিক শিখন সম্পদ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure আর্কিটেকচর সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure মূল্য নির্ধারণ ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)
- [Azure স্ট্যাটাস](https://status.azure.com/)

### আপনার এডিটরের জন্য AI এজেন্ট দক্ষতাসমূহ
- [**skills.sh-এ Microsoft Azure দক্ষতাসমূহ**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, ডিপ্লয়মেন্ট, ডায়গনসটিক্স, খরচ অপ্টিমাইজেশন এবং আরও ৩৭টি ওপেন এজেন্ট স্কিল। এগুলো GitHub Copilot, Cursor, Claude Code, অথবা যেকোনো সমর্থিত এজেন্টে ইন্সটল করুন:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 দ্রুত সমস্যা সমাধান নির্দেশিকা

**নতুনদের সাধারণ সমস্যাগুলো এবং তাৎক্ষণিক সমাধান:**

<details>
<summary><strong>❌ "azd: কমান্ড পাওয়া যায়নি"</strong></summary>

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
<summary><strong>❌ "কোন সাবস্ক্রিপশন পাওয়া যায়নি" বা "সাবস্ক্রিপশন সেট করা নেই"</strong></summary>

```bash
# উপলব্ধ সাবস্ক্রিপশনগুলো তালিকাভুক্ত করুন
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
<summary><strong>❌ "InsufficientQuota" বা "কোটা অতিক্রম"</strong></summary>

```bash
# ভিন্ন Azure অঞ্চল চেষ্টা করুন
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
<summary><strong>❌ "azd up" মাঝপথে ব্যর্থ হচ্ছে</strong></summary>

```bash
# বিকল্প 1: পরিষ্কার করে পুনরায় চেষ্টা করুন
azd down --force --purge
azd up

# বিকল্প 2: শুধুমাত্র অবকাঠামো ঠিক করুন
azd provision

# বিকল্প 3: বিস্তারিত অবস্থা পরীক্ষা করুন
azd show

# বিকল্প 4: Azure Monitor-এ লগগুলি পরীক্ষা করুন
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "প্রমাণীকরণ ব্যর্থ" বা "টোকেন মেয়াদ উত্তীর্ণ"</strong></summary>

```bash
# AZD-এর জন্য পুনরায় প্রমাণীকরণ
azd auth logout
azd auth login

# ঐচ্ছিক: যদি আপনি az কমান্ড চালাচ্ছেন, তাহলে Azure CLI-টিও রিফ্রেশ করুন
az logout
az login

# প্রমাণীকরণ যাচাই করুন
az account show
```
</details>

<details>
<summary><strong>❌ "রিসোর্স ইতিমধ্যে রয়েছে" বা নামকরণ সংঘাত</strong></summary>

```bash
# AZD অনন্য নাম তৈরি করে, কিন্তু যদি সংঘর্ষ ঘটে:
azd down --force --purge

# তাহলে নতুন পরিবেশ নিয়ে পুনরায় চেষ্টা করুন
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ টেমপ্লেট ডিপ্লয়মেন্ট বেশিদিন সময় নিচ্ছে</strong></summary>

**সাধারণ অপেক্ষার সময়:**
- সহজ ওয়েব অ্যাপ: 5-10 মিনিট
- ডাটাবেস সহ অ্যাপ: 10-15 মিনিট
- AI অ্যাপ্লিকেশন: 15-25 মিনিট (OpenAI প্রোভিশনিং ধীর)

```bash
# অগ্রগতি পরীক্ষা করুন
azd show

# যদি ৩০ মিনিটের বেশি আটকে থাকেন, Azure পোর্টালটি পরীক্ষা করুন:
azd monitor --overview
# ব্যর্থ ডিপ্লয়মেন্টগুলি খুঁজুন
```
</details>

<details>
<summary><strong>❌ "অনুমতি অস্বীকৃত" বা "নিষিদ্ধ"</strong></summary>

```bash
# আপনার Azure ভূমিকা পরীক্ষা করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# আপনাকে অন্ততপক্ষে "Contributor" ভূমিকা থাকা প্রয়োজন
# আপনার Azure অ্যাডমিনকে অনুরোধ করুন নিচেরগুলো প্রদান করতে:
# - Contributor (রিসোর্সের জন্য)
# - User Access Administrator (ভূমিকা বরাদ্দের জন্য)
```
</details>

<details>
<summary><strong>❌ ডিপ্লয় করা অ্যাপ্লিকেশন URL খুঁজে পাওয়া যায় না</strong></summary>

```bash
# সব সার্ভিস এন্ডপয়েন্ট দেখান
azd show

# অথবা Azure পোর্টাল খুলুন
azd monitor

# নির্দিষ্ট সার্ভিস পরীক্ষা করুন
azd env get-values
# *_URL ভ্যারিয়েবলগুলি খুজুন
```
</details>

### 📚 পূর্ণ সমস্যা সমাধান সংস্থানসমূহ

- **সাধারণ সমস্যা গাইড:** [বিস্তারিত সমাধান](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-নির্দিষ্ট সমস্যা:** [AI সমস্যা সমাধান](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ডিবাগিং গাইড:** [ধাপে ধাপে ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md)
- **সহায়তা নিন:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 কোর্স সমাপন ও সার্টিফিকেশন

### অগ্রগতি ট্র্যাকিং
প্রতি অধ্যায়ে আপনার শেখার অগ্রগতি ট্র্যাক করুন:

- [ ] **অধ্যায় ১**: ভিত্তি ও দ্রুত শুরু ✅
- [ ] **অধ্যায় ২**: AI-প্রথম ডেভেলপমেন্ট ✅  
- [ ] **অধ্যায় ৩**: কনফিগারেশন ও প্রমাণীকরণ ✅
- [ ] **অধ্যায় ৪**: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট ✅
- [ ] **অধ্যায় ৫**: মাল্টি-এজেন্ট AI সমাধান ✅
- [ ] **অধ্যায় ৬**: প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন ও পরিকল্পনা ✅
- [ ] **অধ্যায় ৭**: ট্রাবলশুটিং ও ডিবাগিং ✅
- [ ] **অধ্যায় ৮**: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন ✅

### শেখার যাচাইকরণ
প্রতিটি অধ্যায় শেষ করার পরে, আপনার জ্ঞান যাচাই করুন নিম্নোক্তভাবে:
1. **প্রায়োগিক অনুশীলন**: অধ্যায়ের হ্যান্ডস-অন ডিপ্লয়মেন্ট সম্পন্ন করুন
2. **জ্ঞান পরীক্ষা**: আপনার অধ্যায়ের FAQ অংশ পর্যালোচনা করুন
3. **কমিউনিটি আলোচনায় অংশগ্রহণ**: Azure Discord-এ আপনার অভিজ্ঞতা শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরবর্তী জটিলতা স্তরে এগিয়ে যান

### কোর্স সমাপ্তির সুবিধাসমূহ
সবগুলো অধ্যায় সম্পন্ন করার পর, আপনার হবে:
- **প্রোডাকশন অভিজ্ঞতা**: প্রকৃত AI অ্যাপ্লিকেশনগুলো Azure-এ ডিপ্লয় করা
- **পেশাদার দক্ষতা**: এন্টারপ্রাইজ-রেডি ডিপ্লয়মেন্ট দক্ষতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার উন্নতি**: চাহিদাযুক্ত AZD ও AI ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি ও সহায়তা

### সহায়তা ও সাপোর্ট পান
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট করুন এবং ফিচার অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)
- **শিক্ষণ সংক্রান্ত প্রশ্ন**: [Microsoft Azure Discord কমিউনিটি](https://discord.gg/microsoft-azure) এবং [![Microsoft Foundry ডিসকর্ড](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-নির্দিষ্ট সহায়তা**: যোগ দিন [![Microsoft Foundry ডিসকর্ড](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ডকুমেন্টেশন**: [অফিশিয়াল Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**#Azure চ্যানেল থেকে সাম্প্রতিক পোল ফলাফল:**
- **45%** ডেভেলপার AZD ব্যবহার করতে চান AI ওয়ার্কলোডের জন্য
- **শীর্ষ চ্যালেঞ্জসমূহ**: বহু-সার্ভিস ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ম্যানেজমেন্ট, প্রোডাকশন রেডিনেস  
- **সবচেয়ে অনুরোধকৃত**: AI-নির্দিষ্ট টেমপ্লেট, ট্রাবলশুটিং গাইড, সেরা অনুশীলনসমূহ

**আমাদের কমিউনিটিতে যোগ দিন যাতে আপনি:**
- আপনার AZD + AI অভিজ্ঞতা শেয়ার করুন এবং সহায়তা পান
- নতুন AI টেমপ্লেটের প্রাথমিক প্রিভিউ অ্যাক্সেস করুন
- AI ডিপ্লয়মেন্ট সেরা অনুশীলনে অবদান রাখুন
- ভবিষ্যতের AI + AZD ফিচার ডেভেলপমেন্টকে প্রভাবিত করুন

### কোর্সে অবদান রাখা
আমরা অবদানকে স্বাগত জানাই! বিস্তারিত জানার জন্য আমাদের [Contributing Guide](CONTRIBUTING.md) পড়ুন:
- **কন্টেন্ট উন্নতি**: বিদ্যমান অধ্যায় এবং উদাহরণ উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব-জীবনের পরিস্থিতি এবং টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহু-ভাষা সমর্থন রক্ষা করার কাজে সাহায্য করুন
- **বাগ রিপোর্ট**: সঠিকতা ও স্পষ্টতা উন্নত করুন
- **কমিউনিটি স্ট্যান্ডার্ড**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি নির্দেশিকা অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্পটি MIT লাইসেন্সের অধীনে লাইসেন্সকৃত - বিস্তারিত জানতে [LICENSE](../../LICENSE) ফাইল দেখুন।

### সম্পর্কিত Microsoft শেখার সম্পদ

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j শুরুদের জন্য](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js শুরুদের জন্য](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain শুরুদের জন্য](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD শুরুদের জন্য](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI শুরুদের জন্য](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP শুরুদের জন্য](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents শুরুদের জন্য](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI শুরুদের জন্য](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET) শুরুদের জন্য](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) শুরুদের জন্য](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![জেনারেটিভ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### মূল শেখা
[![শুরুদের জন্য ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুদের জন্য ডেটা সায়েন্স](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুদের জন্য AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুদের জন্য সাইবারসিকিউরিটি](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![শুরুদের জন্য ওয়েব ডেভেলপমেন্ট](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুদের জন্য IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![শুরুদের জন্য XR ডেভেলপমেন্ট](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot সিরিজ
[![AI-পেয়ার্ড প্রোগ্রামিংয়ের জন্য Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET-এর জন্য Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot অ্যাডভেঞ্চার](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ কোর্স নেভিগেশন

**🚀 শিখতে শুরু করতে প্রস্তুত?**

**শুরুকারীরা**: এখানে থেকে শুরু করুন [অধ্যায় ১: ভিত্তি ও দ্রুত সূচনা](#-chapter-1-foundation--quick-start)  
**AI ডেভেলপাররা**: সরাসরি যান [অধ্যায় ২: AI-প্রথম উন্নয়ন](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**অভিজ্ঞ ডেভেলপাররা**: শুরু করুন [অধ্যায় ৩: কনফিগারেশন ও প্রমাণীকরণ](#️-chapter-3-configuration--authentication)

**পরবর্তী ধাপ**: [শুরু করুন অধ্যায় ১ - AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
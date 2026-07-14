# AZD শুরু করার জন্য: একটি কাঠামোবদ্ধ শেখার পথ

![AZD-for-beginners](../../translated_images/bn/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### স্বয়ংক্রিয় অনুবাদ (সর্বদা আপ-টু-ডেট)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](./README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **স্থানীয়ভাবে ক্লোন করতে চান?**
>
> এই রিপোজিটরিতে ৫০+ ভাষার অনুবাদ অন্তর্ভুক্ত রয়েছে, যা ডাউনলোডের আকার উল্লেখযোগ্যভাবে বৃদ্ধি করে। অনুবাদ ছাড়া ক্লোন করতে, sparse checkout ব্যবহার করুন:
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
> এটি আপনাকে কোর্স সম্পূর্ণ করার জন্য যা কিছু দরকার, তা অনেক দ্রুত ডাউনলোডের মাধ্যমে দেয়।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 আজ azd তে কী নতুন

> 📌 এই কোর্সটি **`azd 1.27.1`** (জুলাই 2026) এর বিরুদ্ধে যাচাই করা হয়েছে। `azd version` চালিয়ে আপনার বিল্ড পরীক্ষা করুন এবং সর্বশেষ পেতে `azd upgrade` চালান।

Azure Developer CLI আর শুধু ঐতিহ্যবাহী ওয়েব অ্যাপ এবং API এর জন্য নয়। আজকের দিনে, azd হলো একক সরঞ্জাম যেকোনো অ্যাপ্লিকেশন Azure-এ মোতায়েনের জন্য—এআই-চালিত অ্যাপ্লিকেশন এবং বুদ্ধিমান এজেন্টসহ।

এর মানে আপনার জন্য কী:

- **এআই এজেন্ট এখন প্রথম সুনামের azd কর্মভার।** আপনি `azd init` → `azd up` ওয়ার্কফ্লো ব্যবহার করে এআই এজেন্ট প্রকল্পগুলি শুরু, মোতায়েন এবং পরিচালনা করতে পারবেন।
- **CLI থেকে একটি পূর্ণ এজেন্ট লাইফসাইকেল।** `azure.ai.agents` এক্সটেনশন এখন পুরো যাত্রা কাভার করে—`azd ai agent init` দিয়ে স্ক্যাফোল্ড, `azd ai agent invoke` দিয়ে পরীক্ষা (টাইমিং সহ রিপন্স), `azd ai agent eval generate` এবং `azd ai agent optimize` দিয়ে গুণমান পরিমাপ ও উন্নয়ন, এবং `azd ai agent delete` দিয়ে পরিষ্কার।
- **আরও এআই বিল্ডিং ব্লক।** নতুন প্রিভিউ এক্সটেনশন—`azure.ai.skills` এবং `azure.ai.connections`—আপনাকে পুনঃব্যবহারযোগ্য এজেন্ট স্কিল এবং Foundry সংযোগ সরাসরি azd দিয়ে পরিচালনা করতে দেয়।
- **Microsoft Foundry ইন্টিগ্রেশন** azd টেমপ্লেট ইকোসিস্টেমে মডেল মোতায়েন, এজেন্ট হোস্টিং এবং এআই সার্ভিস কনফিগারেশন নিয়ে আসে।
- **দৈনন্দিন মৌলিক কাজগুলো আরও মসৃণ।** সাম্প্রতিক সংস্করণগুলিতে `azd init` আইডেমপোটেন্ট (পুনরায় চালানো নিরাপদ), `azd auth login` স্বয়ংক্রিয়ভাবে স্টেইল টোকেন পরিষ্কার করে এবং বন্ধুত্বপূর্ণ `azd tool` প্রথমবারের সেটআপ প্রম্পট যোগ করেছে।
- **মূল ওয়ার্কফ্লো পরিবর্তিত হয়নি।** আপনি একটি টুডো অ্যাপ, মাইক্রোসার্ভিস অথবা মাল্টি-এজেন্ট এআই সমাধান মোতায়েন করুন, কমান্ড গুলো একই।

> **Aspire ব্যবহারকারীদের জন্য নোট:** মাইক্রোসফট এখন পণ্যটিকে শুধু **Aspire** (পূর্বে ".NET Aspire") নামে উল্লেখ করে। azd এর Aspire সমর্থন অপরিবর্তিত—শুধু নাম আপডেট হয়েছে।

আপনি আগেও azd ব্যবহার করে থাকলে, এআই সমর্থন একটি স্বাভাবিক সম্প্রসারণ—একটি আলাদা সরঞ্জাম নয় বা উন্নত ট্র্যাক নয়। আপনি নতুন হলে, আপনি একটি ওয়ার্কফ্লো শিখবেন যা সবকিছুর জন্য কাজ করে।

---

## 🚀 Azure Developer CLI (azd) কী?

**Azure Developer CLI (azd)** হলো একটি ডেভেলপার-সFriendly command line tool যা Azure-এ অ্যাপ্লিকেশন মোতায়েনকে সহজ করে তোলে। অনেকটি Azure রিসোর্স ম্যানুয়ালি তৈরি ও সংযোগ করার পরিবর্তে, আপনি একটি কমান্ডে পুরো অ্যাপ্লিকেশন মোতায়েন করতে পারেন।

### `azd up` এর জাদু

```bash
# এই একক কমান্ড সবকিছু করে:
# ✅ সমস্ত Azure রিসোর্স তৈরি করে
# ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
# ✅ আপনার অ্যাপ্লিকেশন কোড তৈরি করে
# ✅ Azure-এ ডিপ্লয় করে
# ✅ আপনাকে একটি কার্যকর URL দেয়
azd up
```

**এইটুকুই!** কোন Azure Portal এ ক্লিক করার দরকার নেই, না কোন জটিল ARM টেমপ্লেট শেখার দরকার, না কোন ম্যানুয়াল কনফিগারেশন - শুধু Azure-এ কাজ করা অ্যাপ্লিকেশন।

---

## ❓ Azure Developer CLI ও Azure CLI: পার্থক্য কী?

এটা শুরু করাদের সবচেয়ে বেশি জিজ্ঞাসিত প্রশ্ন। সহজ উত্তর এখানে:

| বৈশিষ্ট্য | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **লক্ষ্য** | আলাদা Azure রিসোর্স ম্যানেজ | সম্পূর্ণ অ্যাপ মোতায়েন |
| **দৃষ্টিভঙ্গি** | অবকাঠামো-কেন্দ্রিক | অ্যাপ্লিকেশন-কেন্দ্রিক |
| **উদাহরণ** | `az webapp create --name myapp...` | `azd up` |
| **শেখার মাত্রা** | Azure সেবাগুলো জানা দরকার | শুধু আপনার অ্যাপ জানা দরকার |
| **সেরা ব্যবহার** | DevOps, অবকাঠামো | ডেভেলপার, প্রোটোটাইপিং |

### সহজ উপমা

- **Azure CLI** হলো বাড়ি তৈরির সব সরঞ্জাম থাকা - হাতুড়ি, করো, পেরেক। আপনি কিছুই তৈরি করতে পারেন, তবে নির্মাণ সম্পর্কিত জ্ঞান লাগবে।
- **Azure Developer CLI** হলো ঠিকাদার নিয়োগের মতো - আপনি যা চান বর্ণনা করেন, তাঁরা তৈরির কাজ সামলে নেন।

### কখন কোনটি ব্যবহার করবেন

| পরিস্থিতি | এটি ব্যবহার করুন |
|----------|----------|
| "আমি দ্রুত আমার ওয়েব অ্যাপ মোতায়েন করতে চাই" | `azd up` |
| "আমি শুধু একটি স্টোরেজ অ্যাকাউন্ট তৈরি করতে চাই" | `az storage account create` |
| "আমি একটি সম্পূর্ণ এআই অ্যাপ্লিকেশন তৈরি করছি" | `azd init --template azure-search-openai-demo` |
| "আমি একটি নির্দিষ্ট Azure রিসোর্স ডিবাগ করতে চাই" | `az resource show` |
| "আমি মিনিটের মধ্যে প্রোডাকশন-রেডি ডিপ্লয়মেন্ট চাই" | `azd up --environment production` |

### তারা একসাথে কাজ করে!

AZD আড়াল থেকে Azure CLI ব্যবহার করে। আপনি দুইটিই ব্যবহার করতে পারেন:
```bash
# আপনার অ্যাপটি AZD দিয়ে স্থাপন করুন
azd up

# তারপর Azure CLI দিয়ে নির্দিষ্ট রিসোর্সগুলি সূক্ষ্ম সমন্বয় করুন
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-তে টেমপ্লেট খুঁজুন

শূন্য থেকে শুরু করবেন না! **Awesome AZD** হলো সম্প্রদায়ের সংগ্রহ যেখানে প্রস্তুত মোতায়েনযোগ্য টেমপ্লেট আছে:

| রিসোর্স | বর্ণনা |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ২০০+ টেমপ্লেট এক-ক্লিক মোতায়েনের জন্য ব্রাউজ করুন |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | আপনার নিজস্ব টেমপ্লেট সম্প্রদায়ে যোগ করুন |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | স্টার দিন এবং সোর্স এক্সপ্লোর করুন |

### Awesome AZD থেকে জনপ্রিয় এআই টেমপ্লেট

```bash
# মাইক্রোসফট ফাউন্ড্রি মডেলস + AI সার্চ সহ RAG চ্যাট
azd init --template azure-search-openai-demo

# দ্রুত AI চ্যাট অ্যাপ্লিকেশন
azd init --template openai-chat-app-quickstart

# ফাউন্ড্রি এজেন্টস সহ AI এজেন্টস
azd init --template get-started-with-ai-agents
```

---

## 🎯 ৩ ধাপে শুরু করুন

শুরু করার আগে, নিশ্চিত করুন যে আপনার মেশিন মোতায়েন করতে চান টেমপ্লেটের জন্য প্রস্তুত:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

যদি কোন প্রয়োজনীয় চেক ব্যর্থ হয়, আগে সেটি ঠিক করুন তারপর দ্রুত শুরু করুন।

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

### ধাপ ২: AZD এর জন্য প্রমাণীকরণ করুন

```bash
# যদি আপনি এই কোর্সে সরাসরি Azure CLI কমান্ড ব্যবহার করার পরিকল্পনা করেন তবে এটি ঐচ্ছিক
az login

# AZD ওয়ার্কফ্লো গুলোর জন্য প্রয়োজনীয়
azd auth login
```

যদি নিশ্চিত না হন কোনটি দরকার, তাহলে [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) এ সম্পূর্ণ সেটআপ ফ্লো অনুসরণ করুন।

### ধাপ ৩: প্রথম অ্যাপ মোতায়েন করুন

```bash
# একটি টেমপ্লেট থেকে আরম্ভ করুন
azd init --template todo-nodejs-mongo

# .Azure এ ডিপ্লয় করুন (সবকিছু তৈরি করে!)
azd up
```

**🎉 হয়ে গেল!** আপনার অ্যাপ এখন Azure-এ লাইভ।

### পরিষ্কার করুন (ভুলবেন না!)

```bash
# পরীক্ষা শেষ হলে সমস্ত সম্পদ সরান
azd down --force --purge
```

---

## 📚 এই কোর্স কীভাবে ব্যবহার করবেন

এই কোর্সটি **প্রগতিশীল শেখার** জন্য ডিজাইন করা হয়েছে - যেখানে আরামদায়ক সেখানে শুরু করুন এবং উপরে উঠুন:

| আপনার অভিজ্ঞতা | এখানে শুরু করুন |
|-----------------|------------|
| **Azure তে নতুন** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure জানেন, AZD নতুন** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **এআই অ্যাপ মোতায়েন করতে চান** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **বাস্তব অভ্যাস চাই** | [🎓 Interactive Workshop](workshop/README.md) - ৩-৪ ঘণ্টার নির্দেশিত ল্যাব |
| **প্রোডাকশন প্যাটার্ন দরকার** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### দ্রুত সেটআপ

১. **এই রিপোজিটরি Fork করুন**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
২. **Clone করুন**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
৩. **সহায়তা নিন**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **স্থানীয়ভাবে ক্লোন করতে চান?**

> এই রিপোজিটরিতে ৫০+ ভাষার অনুবাদ অন্তর্ভুক্ত রয়েছে, যা ডাউনলোডের আকার উল্লেখযোগ্যভাবে বৃদ্ধি করে। অনুবাদ ছাড়া ক্লোন করতে, sparse checkout ব্যবহার করুন:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> এটি আপনাকে কোর্স সম্পূর্ণ করার জন্য যা কিছু দরকার, তা অনেক দ্রুত ডাউনলোডের মাধ্যমে দেয়।


## কোর্সের সারাংশ

ক্রমবর্ধমান অধ্যায়ের মাধ্যমে Azure Developer CLI (azd) আয়ত্ত করুন। **মাইক্রোসফট ফাউন্ড্রি ইন্টিগ্রেশনের মাধ্যমে এআই অ্যাপ মোতায়েনের উপর বিশেষ মনোযোগ।**


### কেন এই কোর্সটি আধুনিক ডেভেলপারদের জন্য অত্যাবশ্যক

Microsoft Foundry Discord কমিউনিটির অন্তর্দৃষ্টির ভিত্তিতে, **45% ডেভেলপার AZD ব্যবহার করতে চান AI ওয়ার্কলোডের জন্য** কিন্তু নিম্নলিখিত সমস্যার সম্মুখীন হন:
- জটিল বহুসেবা AI আর্কিটেকচার
- প্রোডাকশন AI ডিপ্লয়মেন্টের সেরা পদ্ধতি  
- Azure AI সেবা ইন্টিগ্রেশন এবং কনফিগারেশন
- AI ওয়ার্কলোডের জন্য খরচ অপ্টিমাইজেশন
- AI-নির্দিষ্ট ডিপ্লয়মেন্ট সমস্যাগুলো সমাধান করা

### শেখার উদ্দেশ্য

এই গঠনমূলক কোর্স সম্পন্ন করার মাধ্যমে আপনি:
- **AZD এর মৌলিক বিষয়গুলি শিখবেন**: মূল ধারণা, ইনস্টলেশন, এবং কনফিগারেশন
- **AI অ্যাপ্লিকেশন ডিপ্লয় করবেন**: Microsoft Foundry সার্ভিসের সাথে AZD ব্যবহার করে
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড প্রয়োগ করবেন**: Azure রিসোর্সগুলো Bicep টেমপ্লেট দিয়ে পরিচালনা করুন
- **ডিপ্লয়মেন্ট সমস্যা সমাধান করবেন**: সাধারণ সমস্যা সমাধান এবং ডিবাগিং
- **প্রোডাকশনের জন্য অপ্টিমাইজ করবেন**: সিকিউরিটি, স্কেলিং, মনিটরিং এবং খরচ ব্যবস্থাপনা
- **বহু-এজেন্ট সমাধান তৈরী করবেন**: জটিল AI আর্কিটেকচার ডিপ্লয় করুন

## শুরু করার আগে: অ্যাকাউন্ট, অ্যাক্সেস, এবং অনুমানসমূহ

চ্যাপ্টার 1 শুরু করার আগে, নিশ্চিত করুন আপনার কাছে নিম্নলিখিত বিষয়গুলি রয়েছে। এই গাইডের ইনস্টলেশন ধাপগুলি ধরে নেয় যে এই বুনিয়াদি বিষয়গুলো ইতিমধ্যে প্রস্তুত।

- **একটি Azure সাবস্ক্রিপশন**: আপনি কাজ বা নিজের অ্যাকাউন্ট থেকে বিদ্যমান সাবস্ক্রিপশন ব্যবহার করতে পারেন, অথবা শুরু করার জন্য একটি [ফ্রি ট্রায়াল](https://aka.ms/azurefreetrial) তৈরি করুন।
- **Azure রিসোর্স তৈরি করার অনুমতি**: অধিকাংশ অনুশীলনের জন্য, আপনার টার্গেট সাবস্ক্রিপশন বা রিসোর্স গ্রুপে কমপক্ষে **Contributor** এক্সেস থাকা উচিত। কিছু চ্যাপ্টার ধরে নিতে পারে যে আপনি রিসোর্স গ্রুপ, ম্যানেজড আইডেন্টিটি, এবং RBAC অ্যাসাইনমেন্ট তৈরি করতে পারবেন।
- [**একটি GitHub অ্যাকাউন্ট**](https://github.com): রিপোজিটরি ফর্ক করা, নিজস্ব পরিবর্তন ট্র্যাক করা, এবং ওয়ার্কশপের জন্য GitHub Codespaces ব্যবহারের জন্য এটি দরকার।
- **টেমপ্লেট রানটাইম প্রয়োজনীয়তা**: কিছু টেমপ্লেটের জন্য স্থানীয় টুল যেমন Node.js, Python, Java, বা Docker প্রয়োজন। শুরু করার আগে সেটআপ ভ্যালিডেটর চালান যাতে আগেই মিসিং টুল শনাক্ত হয়।
- **মৌলিক টার্মিনাল পরিচিতি**: আপনি বিশেষজ্ঞ হতে হবে না, তবে `git clone`, `azd auth login`, এবং `azd up` মত কমান্ড চালাতে আরামদায়ক হওয়া উচিত।

> **এন্টারপ্রাইজ সাবস্ক্রিপশন ব্যবহার করছেন?**
> যদি আপনার Azure পরিবেশ কোনো প্রশাসকের দ্বারা পরিচালিত হয়, তাহলে আগেই নিশ্চিত করুন আপনি যে সাবস্ক্রিপশন বা রিসোর্স গ্রুপ ব্যবহার করতে চান সেখানে রিসোর্স ডিপ্লয় করতে পারবেন কিনা। না হলে শুরু করার আগে স্যান্ডবক্স সাবস্ক্রিপশন বা Contributor এক্সেস চাইতে পারেন।

> **Azure এ নতুন?**
> নিজের Azure ট্রায়াল বা pay-as-you-go সাবস্ক্রিপশন দিয়ে শুরু করুন https://aka.ms/azurefreetrial যাতে টেন্যান্ট-লেভেল অনুমোদনের অপেক্ষা না করে অনুশীলনগুলো সম্পূর্ণ করতে পারেন।

## 🗺️ কোর্স ম্যাপ: চ্যাপ্টার অনুযায়ী দ্রুত নেভিগেশন

প্রতিটি চ্যাপ্টারের জন্য একটি নিবেদিত README রয়েছে যেখানে শেখার উদ্দেশ্য, দ্রুত শুরু, এবং অনুশীলন সমূহ রয়েছে:

| চ্যাপ্টার | বিষয় | পাঠ | সময়কাল | জটিলতা |
|---------|-------|---------|----------|------------|
| **[চ্যাপ্টার ১: ফাউন্ডেশন](docs/chapter-01-foundation/README.md)** | শুরু করা | [AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) &#124; [ইনস্টলেশন](docs/chapter-01-foundation/installation.md) &#124; [প্রথম প্রকল্প](docs/chapter-01-foundation/first-project.md) | ৩০-৪৫ মিনিট | ⭐ |
| **[চ্যাপ্টার ২: AI ডেভেলপমেন্ট](docs/chapter-02-ai-development/README.md)** | AI-প্রথম অ্যাপস | [Foundry ইন্টিগ্রেশন](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI এজেন্টস](docs/chapter-02-ai-development/agents.md) &#124; [মডেল ডিপ্লয়মেন্ট](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ওয়ার্কশপ](docs/chapter-02-ai-development/ai-workshop-lab.md) | ১-২ ঘন্টা | ⭐⭐ |
| **[চ্যাপ্টার ৩: কনফিগারেশন](docs/chapter-03-configuration/README.md)** | অথ & সিকিউরিটি | [কনফিগারেশন](docs/chapter-03-configuration/configuration.md) &#124; [অথ & সিকিউরিটি](docs/chapter-03-configuration/authsecurity.md) | ৪৫-৬০ মিনিট | ⭐⭐ |
| **[চ্যাপ্টার ৪: ইনফ্রাস্ট্রাকচার](docs/chapter-04-infrastructure/README.md)** | IaC & ডিপ্লয়মেন্ট | [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [প্রোভিজনিং](docs/chapter-04-infrastructure/provisioning.md) | ১-১.৫ ঘন্টা | ⭐⭐⭐ |
| **[চ্যাপ্টার ৫: বহু-এজেন্ট](docs/chapter-05-multi-agent/README.md)** | AI এজেন্ট সমাধান | [রিটেল সিনারিও](examples/retail-scenario.md) &#124; [কোঅর্ডিনেশন প্যাটার্নস](docs/chapter-06-pre-deployment/coordination-patterns.md) | ২-৩ ঘন্টা | ⭐⭐⭐⭐ |
| **[চ্যাপ্টার ৬: প্রি-ডিপ্লয়মেন্ট](docs/chapter-06-pre-deployment/README.md)** | পরিকল্পনা ও যাচাই | [প্রিফ্লাইট চেকস](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ক্যাপাসিটি প্ল্যানিং](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU নির্বাচন](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [অ্যাপ ইনসাইটস](docs/chapter-06-pre-deployment/application-insights.md) | ১ ঘন্টা | ⭐⭐ |
| **[চ্যাপ্টার ৭: সমস্যা সমাধান](docs/chapter-07-troubleshooting/README.md)** | ডিবাগ & মেরামত | [সাধারণ সমস্যা](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI সমস্যা](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | ১-১.৫ ঘন্টা | ⭐⭐ |
| **[চ্যাপ্টার ৮: প্রোডাকশন](docs/chapter-08-production/README.md)** | এন্টারপ্রাইজ প্যাটার্নস | [প্রোডাকশন প্র্যাকটিসেস](docs/chapter-08-production/production-ai-practices.md) | ২-৩ ঘন্টা | ⭐⭐⭐⭐ |
| **[🎓 ওয়ার্কশপ](workshop/README.md)** | হাতে কলমের ল্যাব | [পরিচয়](workshop/docs/instructions/0-Introduction.md) &#124; [নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [যাচাই](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [অবসংরচনা](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [পতন](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [সমাপন](workshop/docs/instructions/7-Wrap-up.md) | ৩-৪ ঘন্টা | ⭐⭐ |

**মোট কোর্স সময়কাল:** ~১০-১৪ ঘন্টা | **দক্ষতার অগ্রগতি:** শুরু থেকে প্রোডাকশন-রেডি

---

## 📚 শেখার চ্যাপ্টারসমূহ

*অভিজ্ঞতা ও লক্ষ্য অনুযায়ী আপনার শেখার পথ নির্বাচন করুন*

### 🚀 চ্যাপ্টার ১: ফাউন্ডেশন ও দ্রুত শুরু
**প্রয়োজনীয়তা**: Azure সাবস্ক্রিপশন, মৌলিক কমান্ড লাইন জ্ঞান  
**সময়কাল**: ৩০-৪৫ মিনিট  
**জটিলতা**: ⭐

#### আপনি কি শিখবেন
- Azure Developer CLI এর মৌলিক বিষয়গুলি বোঝা
- আপনার প্ল্যাটফর্মে AZD ইনস্টল করা
- আপনার প্রথম সফল ডিপ্লয়মেন্ট

#### শেখার সম্পদ
- **🎯 এখানে শুরু করুন**: [Azure Developer CLI কি?](#what-is-azure-developer-cli)
- **📖 তত্ত্ব**: [AZD বেসিকস](docs/chapter-01-foundation/azd-basics.md) - মূল ধারণা ও পরিভাষা
- **⚙️ সেটআপ**: [ইনস্টলেশন ও সেটআপ](docs/chapter-01-foundation/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট গাইড
- **🛠️ হাতে কলমে**: [আপনার প্রথম প্রকল্প](docs/chapter-01-foundation/first-project.md) - ধাপে ধাপে টিওরিয়াল
- **📋 দ্রুত রেফারেন্স**: [কমান্ড চিট শীট](resources/cheat-sheet.md)

#### ব্যবহারিক অনুশীলন
```bash
# দ্রুত ইনস্টলেশন পরীক্ষা
azd version

# আপনার প্রথম অ্যাপ্লিকেশন ডিপ্লয় করুন
azd init --template todo-nodejs-mongo
azd up
```

**💡 চ্যাপ্টার ফলাফল**: AZD ব্যবহার করে Azure-এ একটি সহজ ওয়েব অ্যাপ সফলভাবে ডিপ্লয় করুন

**✅ সফলতা যাচাই:**
```bash
# অধ্যায় ১ সম্পন্ন করার পরে, আপনাকে সক্ষম হতে হবে:
azd version              # ইনস্টল করা সংস্করণ প্রদর্শন করে
azd init --template todo-nodejs-mongo  # প্রকল্প শুরু করে
azd up                  # আজুরে মোতায়েন করে
azd show                # চলমান অ্যাপ্লিকেশনের URL প্রদর্শন করে
# অ্যাপ্লিকেশন ব্রাউজারে খুলে এবং কাজ করে
azd down --force --purge  # সম্পদগুলো পরিষ্কার করে
```

**📊 সময় বিনিয়োগ:** ৩০-৪৫ মিনিট  
**📈 শেখার পর দক্ষতা:** স্বাধীনভাবে মৌলিক অ্যাপ্লিকেশন ডিপ্লয় করতে সক্ষম
**📈 শেখার পর দক্ষতা:** স্বাধীনভাবে মৌলিক অ্যাপ্লিকেশন ডিপ্লয় করতে সক্ষম

---

### 🤖 চ্যাপ্টার ২: AI-প্রথম ডেভেলপমেন্ট (AI ডেভেলপারদের জন্য সুপারিশ)
**প্রয়োজনীয়তা**: চ্যাপ্টার ১ সম্পন্ন  
**সময়কাল**: ১-২ ঘণ্টা  
**জটিলতা**: ⭐⭐

#### আপনি কি শিখবেন
- Microsoft Foundry এর সাথে AZD ইন্টিগ্রেশন
- AI চালিত অ্যাপ্লিকেশন ডিপ্লয়মেন্ট
- AI সেবা কনফিগারেশন বোঝা

#### শেখার সম্পদ
- **🎯 এখানে শুরু করুন**: [Microsoft Foundry ইন্টিগ্রেশন](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI এজেন্টস**: [AI এজেন্টস গাইড](docs/chapter-02-ai-development/agents.md) - AZD দিয়ে বুদ্ধিমান এজেন্ট প্রয়োগ করুন
- **📖 প্যাটার্নস**: [AI মডেল ডিপ্লয়মেন্ট](docs/chapter-02-ai-development/ai-model-deployment.md) - AI মডেল ডিপ্লয় এবং পরিচালনা করুন
- **🛠️ ওয়ার্কশপ**: [AI ওয়ার্কশপ ল্যাব](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI সমাধানগুলোকে AZD-রেডি করুন
- **🎥 ইন্টারঅ্যাকটিভ গাইড**: [ওয়ার্কশপ ম্যাটেরিয়াল](workshop/README.md) - MkDocs * DevContainer এনভায়রনমেন্টে ব্রাউজার ভিত্তিক শেখা
- **📋 টেমপ্লেটসমূহ**: [Microsoft Foundry টেমপ্লেটসমূহ](#কর্মশালা-উপকরণ)
- **📝 উদাহরণসমূহ**: [AZD ডিপ্লয়মেন্ট উদাহরণ](examples/README.md)

#### ব্যবহারিক অনুশীলন
```bash
# আপনার প্রথম AI অ্যাপ্লিকেশন স্থাপন করুন
azd init --template azure-search-openai-demo
azd up

# অতিরিক্ত AI টেমপ্লেটগুলি চেষ্টা করুন
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 চ্যাপ্টার ফলাফল**: RAG সক্ষমতা সহ AI চালিত চ্যাট অ্যাপ্লিকেশন ডিপ্লয় এবং কনফিগার করুন

**✅ সফলতা যাচাই:**
```bash
# অধ্যায় ২-এর পরে, আপনি সক্ষম হওয়া উচিত:
azd init --template azure-search-openai-demo
azd up
# এআই চ্যাট ইন্টারফেস পরীক্ষা করুন
# প্রশ্ন করুন এবং উৎস সহ এআই-চালিত উত্তর পান
# নিশ্চিত করুন যে অনুসন্ধান ইন্টিগ্রেশন কাজ করে
azd monitor  # চেক করুন অ্যাপ্লিকেশন ইনসাইটস টেলিমেট্রি প্রদর্শন করে
azd down --force --purge
```

**📊 সময় বিনিয়োগ:** ১-২ ঘণ্টা  
**📈 শেখার পর দক্ষতা:** প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় এবং কনফিগার করতে সক্ষম  
**💰 খরচ সচেতনতা:** $৮০-১৫০/মাস ডেভেলপমেন্ট খরচ, $৩০০-৩৫০০/মাস প্রোডাকশন খরচ বোঝা

#### 💰 AI ডিপ্লয়মেন্টের খরচ বিবেচনা

**ডেভেলপমেন্ট এনভায়রনমেন্ট (আনুমানিক $৮০-১৫০/মাস):**
- Microsoft Foundry মডেলস (পে-অ্যাজ-ইউ-গো): $০-৫০/মাস (টোকেন ব্যবহারের উপর ভিত্তি করে)
- AI সার্চ (বেসিক টিয়ার): $৭৫/মাস
- কন্টেইনার অ্যাপস (কনজাম্পশন): $০-২০/মাস
- স্টোরেজ (স্ট্যান্ডার্ড): $১-৫/মাস

**প্রোডাকশন এনভায়রনমেন্ট (আনুমানিক $৩০০-৩,৫০০+/মাস):**
- Microsoft Foundry মডেলস (PTU ধারাবাহিক পারফরম্যান্সের জন্য): $৩,০০০+/মাস অথবা বেশি ভলিউম সহ পে-অ্যাজ-ইউ-গো
- AI সার্চ (স্ট্যান্ডার্ড টিয়ার): $২৫০/মাস
- কন্টেইনার অ্যাপস (ডেডিকেটেড): $৫০-১০০/মাস
- অ্যাপ্লিকেশন ইনসাইটস: $৫-৫০/মাস
- স্টোরেজ (প্রিমিয়াম): $১০-৫০/মাস

**💡 খরচ অপ্টিমাইজেশনের টিপস:**
- শেখার জন্য **ফ্রি টিয়ার** Microsoft Foundry মডেল ব্যবহার করুন (Azure OpenAI ৫০,০০০ টোকেন/মাস অন্তর্ভুক্ত)
- সক্রিয়ভাবে ডেভেলপ না করলে `azd down` চালিয়ে রিসোর্সগুলো ডিএলোকেট করুন
- কনজাম্পশন-ভিত্তিক বিলিং দিয়ে শুরু করুন, শুধুমাত্র প্রোডাকশনের জন্য PTU-তে আপগ্রেড করুন
- ডিপ্লয়মেন্টের আগে খরচ আন্দাজ করার জন্য `azd provision --preview` চালান
- অটো-স্কেলিং সক্ষম করুন: শুধু প্রকৃত ব্যবহার অনুযায়ী অর্থ প্রদান করুন

**খরচ মনিটরিং:**
```bash
# আনুমানিক মাসিক খরচ পরীক্ষা করুন
azd provision --preview

# আজুর পোর্টালে প্রকৃত খরচ পর্যবেক্ষণ করুন
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ চ্যাপ্টার ৩: কনফিগারেশন ও অথেন্টিকেশন
**প্রয়োজনীয়তা**: চ্যাপ্টার ১ সম্পন্ন  
**সময়কাল**: ৪৫-৬০ মিনিট  
**জটিলতা**: ⭐⭐

#### আপনি কি শিখবেন
- এনভায়রনমেন্ট কনফিগারেশন ও পরিচালনা
- অথেন্টিকেশন ও সিকিউরিটির সেরা পদ্ধতি
- রিসোর্স নামকরণ ও সংগঠন

#### শেখার সম্পদ
- **📖 কনফিগারেশন**: [কনফিগারেশন গাইড](docs/chapter-03-configuration/configuration.md) - এনভায়রনমেন্ট সেটআপ
- **🔐 সিকিউরিটি**: [অথেন্টিকেশন প্যাটার্ন এবং ম্যানেজড আইডেন্টিটি](docs/chapter-03-configuration/authsecurity.md) - অথেন্টিকেশন প্যাটার্ন
- **📝 উদাহরণসমূহ**: [ডাটাবেস অ্যাপ উদাহরণ](examples/database-app/README.md) - AZD ডাটাবেস উদাহরণ

#### ব্যবহারিক অনুশীলন
- একাধিক এনভায়রনমেন্ট কনফিগার করা (ডেভ, স্টেজিং, প্রোড)
- ম্যানেজড আইডেন্টিটি অথেন্টিকেশন সেটআপ করা
- এনভায়রনমেন্ট-নির্দিষ্ট কনফিগারেশন প্রয়োগ করা

**💡 চ্যাপ্টার ফলাফল**: সঠিক অথেন্টিকেশন এবং সিকিউরিটি সহ একাধিক এনভায়রনমেন্ট পরিচালনা করুন

---

### 🏗️ চ্যাপ্টার ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড ও ডিপ্লয়মেন্ট
**প্রয়োজনীয়তা**: চ্যাপ্টার ১-৩ সম্পন্ন  
**সময়কাল**: ১-১.৫ ঘন্টা  
**জটিলতা**: ⭐⭐⭐

#### আপনি কি শিখবেন
- উন্নত ডিপ্লয়মেন্ট প্যাটার্ন
- Bicep দিয়ে ইনফ্রাস্ট্রাকচার অ্যাজ কোড
- রিসোর্স প্রোভিজনিং কৌশলসমূহ

#### শেখার সম্পদ
- **📖 ডিপ্লয়মেন্ট**: [ডিপ্লয়মেন্ট গাইড](docs/chapter-04-infrastructure/deployment-guide.md) - পূর্ণাঙ্গ ওয়ার্কফ্লো
- **🏗️ প্রোভিজনিং**: [রিসোর্স প্রোভিজনিং](docs/chapter-04-infrastructure/provisioning.md) - Azure রিসোর্স ম্যানেজমেন্ট
- **📝 উদাহরণসমূহ**: [কন্টেইনার অ্যাপ উদাহরণ](../../examples/container-app) - কন্টেইনারাইজড ডিপ্লয়মেন্ট

#### ব্যবহারিক অনুশীলন
- কাস্টম Bicep টেমপ্লেট তৈরি করা
- বহুসেবা অ্যাপ্লিকেশন ডিপ্লয় করা
- ব্লু-গ্রিন ডিপ্লয়মেন্ট স্ট্র্যাটেজি প্রয়োগ করা

**💡 চ্যাপ্টার ফলাফল**: কাস্টম ইনফ্রাস্ট্রাকচার টেমপ্লেট ব্যবহার করে জটিল বহুসেবা অ্যাপ্লিকেশন ডিপ্লয় করুন

---


### 🎯 অধ্যায় ৫: মাল্টি-এজেন্ট AI সমাধান (উন্নত)
**প্রয়োজনীয়তা**: অধ্যায় ১-২ সম্পন্ন হয়েছে  
**সময়কাল**: ২-৩ ঘন্টা  
**কঠিনত্ব**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- মাল্টি-এজেন্ট আর্কিটেকচার প্যাটার্ন
- এজেন্ট অর্কেস্ট্রেশন এবং সমন্বয়
- উৎপাদন-সিদ্ধ AI মোতায়েন

#### শেখার উপকরণ
- **🤖 বৈশিষ্ট্যযুক্ত প্রকল্প**: [রিটেল মাল্টি-এজেন্ট সমাধান](examples/retail-scenario.md) - সম্পূর্ণ বাস্তবায়ন
- **🛠️ ARM টেম্পলেটস**: [ARM টেম্পলেট প্যাকেজ](../../examples/retail-multiagent-arm-template) - এক-ক্লিক মোতায়েন
- **📖 আর্কিটেকচার**: [মাল্টি-এজেন্ট সমন্বয় প্যাটার্নস](docs/chapter-06-pre-deployment/coordination-patterns.md) - প্যাটার্নস

#### ব্যবহারিক অনুশীলন
```bash
# সম্পূর্ণ রিটেইল মাল্টি-এজেন্ট সলিউশন মোতায়েন করুন
cd examples/retail-multiagent-arm-template
./deploy.sh

# এজেন্ট কনফিগারেশনগুলি অন্বেষণ করুন
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 অধ্যায়ের ফলাফল**: কাস্টমার এবং ইনভেন্টরি এজেন্টসহ একটি উৎপাদন-সিদ্ধ মাল্টি-এজেন্ট AI সমাধান মোতায়েন এবং পরিচালনা করুন

---

### 🔍 অধ্যায় ৬: প্রি-মোতায়েন যাচাই ও পরিকল্পনা
**প্রয়োজনীয়তা**: অধ্যায় ৪ সম্পন্ন হয়েছে  
**সময়কাল**: ১ ঘণ্টা  
**কঠিনত্ব**: ⭐⭐

#### আপনি যা শিখবেন
- ক্ষমতা পরিকল্পনা ও সম্পদ যাচাই
- SKU নির্বাচন কৌশল
- প্রি-ফ্লাইট পরীক্ষা ও অটোমেশন

#### শেখার উপকরণ
- **📊 পরিকল্পনা**: [ক্ষমতা পরিকল্পনা](docs/chapter-06-pre-deployment/capacity-planning.md) - সম্পদ যাচাই
- **💰 নির্বাচন**: [SKU নির্বাচন](docs/chapter-06-pre-deployment/sku-selection.md) - ব্যয়-দক্ষ পছন্দ
- **✅ যাচাই**: [প্রি-ফ্লাইট পরীক্ষা](docs/chapter-06-pre-deployment/preflight-checks.md) - স্বয়ংক্রিয় স্ক্রিপ্টসমূহ

#### ব্যবহারিক অনুশীলন
- ক্ষমতা যাচাই স্ক্রিপ্ট চালান
- ব্যয়ের জন্য SKU নির্বাচনের অপ্টিমাইজ করুন
- অটোমেটেড প্রি-মোতায়েন পরীক্ষা প্রয়োগ করুন

**💡 অধ্যায়ের ফলাফল**: কার্যাবলীর আগে মোতায়েন যাচাই ও অপ্টিমাইজ করুন

---

### 🚨 অধ্যায় ৭: সমস্যাসমাধান ও ডিবাগিং
**প্রয়োজনীয়তা**: যেকোনো মোতায়েন অধ্যায় সম্পন্ন হয়েছে  
**সময়কাল**: ১-১.৫ ঘণ্টা  
**কঠিনত্ব**: ⭐⭐

#### আপনি যা শিখবেন
- নিয়মিত ডিবাগিং পদ্ধতি
- সাধারণ সমস্যা ও সমাধান
- AI-সংক্রান্ত সমস্যাসমাধান

#### শেখার উপকরণ
- **🔧 সাধারণ সমস্যা**: [সাধারণ সমস্যা](docs/chapter-07-troubleshooting/common-issues.md) - প্রশ্নউত্তর ও সমাধান
- **🕵️ ডিবাগিং**: [ডিবাগিং গাইড](docs/chapter-07-troubleshooting/debugging.md) - ধাপে ধাপে কৌশল
- **🤖 AI সমস্যা**: [AI-স্পেসিফিক Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI সার্ভিস সমস্যা

#### ব্যবহারিক অনুশীলন
- মোতায়েন ব্যর্থতার নির্ণয় করুন
- প্রমাণীকরণ সমস্যা সমাধান করুন
- AI সার্ভিস সংযোগ সমস্যা ডিবাগ করুন

**💡 অধ্যায়ের ফলাফল**: স্বতন্ত্রভাবে সাধারণ মোতায়েন সমস্যার নির্ণয় ও সমাধান করুন

---

### 🏢 অধ্যায় ৮: উৎপাদন ও এন্টারপ্রাইজ প্যাটার্নস
**প্রয়োজনীয়তা**: অধ্যায় ১-৪ সম্পন্ন হয়েছে  
**সময়কাল**: ২-৩ ঘণ্টা  
**কঠিনত্ব**: ⭐⭐⭐⭐

#### আপনি যা শিখবেন
- উৎপাদন মোতায়েন কৌশল
- এন্টারপ্রাইজ নিরাপত্তা প্যাটার্ন
- মনিটরিং ও ব্যয় অপ্টিমাইজেশন

#### শেখার উপকরণ
- **🏭 উৎপাদন**: [উৎপাদন AI সেরা অনুশীলন](docs/chapter-08-production/production-ai-practices.md) - এন্টারপ্রাইজ প্যাটার্নস
- **📝 উদাহরণসমূহ**: [মাইক্রোসার্ভিসেস উদাহরণ](../../examples/microservices) - জটিল আর্কিটেকচার
- **📊 মনিটরিং**: [অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন](docs/chapter-06-pre-deployment/application-insights.md) - মনিটরিং

#### ব্যবহারিক অনুশীলন
- এন্টারপ্রাইজ নিরাপত্তা প্যাটার্ন প্রয়োগ করুন
- ব্যাপক মনিটরিং সেট আপ করুন
- সঠিক শাসনব্যবস্থাসহ উৎপাদনে মোতায়েন করুন

**💡 অধ্যায়ের ফলাফল**: সম্পূর্ণ উৎপাদন কার্যক্ষমতা সহ এন্টারপ্রাইজ-উপযোগী অ্যাপ্লিকেশন মোতায়েন করুন

---

## 🎓 কর্মশালা সংক্ষিপ্ত বিবরণ: হাতে কলমে শেখার অভিজ্ঞতা

> **⚠️ কর্মশালা অবস্থা: সক্রিয় উন্নয়ন**  
> কর্মশালা উপকরণগুলি বর্তমানে উন্নয়ন ও পরিমার্জনের পর্যায়ে রয়েছে। মূল মডিউলগুলি কার্যকর, তবে কিছু উন্নত অংশ অসম্পূর্ণ। আমরা সক্রিয়ভাবে সমস্ত বিষয়বস্তু সম্পন্ন করার কাজ করছি। [অগ্রগতি ট্র্যাক করুন →](workshop/README.md)

### ইন্টারেক্টিভ কর্মশালা উপকরণ
**ব্রাউজার-ভিত্তিক টুলস ও নির্দেশিত অনুশীলন সহ ব্যাপক হাতে কলমে শেখার অভিজ্ঞতা**

আমাদের কর্মশালা উপকরণগুলো একটি কাঠামোবদ্ধ, ইন্টারেক্টিভ শেখার অভিজ্ঞতা প্রদান করে যা উপরের অধ্যায়ভিত্তিক পাঠক্রমকে পরিপূরক করে। কর্মশালাটি স্ব-গতি শেখার পাশাপাশি প্রশিক্ষক-নেতৃত্বাধীন সেশনের জন্য ডিজাইন করা হয়েছে।

#### 🛠️ কর্মশালার বৈশিষ্ট্যসমূহ
- **ব্রাউজার-ভিত্তিক ইন্টারফেস**: সম্পূর্ণ MkDocs-চালিত কর্মশালা যা অনুসন্ধান, কপি এবং থিম ফিচারসহ
- **GitHub Codespaces ইন্টিগ্রেশন**: এক-ক্লিক ডেভেলপমেন্ট পরিবেশ সেটআপ
- **কাঠামোবদ্ধ শেখার পথ**: ৮-মডিউল নির্দেশিত অনুশীলন (মোট ৩-৪ ঘণ্টা)
- **ক্রমবর্ধমান পদ্ধতি**: পরিচিতি → নির্বাচন → যাচাই → ভাঙচুর → কনফিগারেশন → কাস্টমাইজেশন → টিয়ারডাউন → সমাপ্তি
- **ইন্টারেক্টিভ DevContainer পরিবেশ**: পূর্বকনফিগার করা টুলস এবং নির্ভরশীলতা

#### 📚 কর্মশালা মডিউল কাঠামো
কর্মশালাটি একটি **৮-মডিউল ক্রমবর্ধমান পদ্ধতি** অনুসরণ করে যা আপনাকে আবিষ্কার থেকে মোতায়েন দক্ষতায় নিয়ে যায়:

| মডিউল | বিষয় | আপনি যা করবেন | সময়কাল |
|--------|-------|----------------|----------|
| **০. পরিচিতি** | কর্মশালা সংক্ষিপ্ত বিবরণ | শেখার উদ্দেশ্য, প্রয়োজনীয়তা ও কর্মশালা কাঠামো বোঝা | ১৫ মিনিট |
| **১. নির্বাচন** | টেম্পলেট আবিষ্কার | AZD টেম্পলেট সমূহ সন্ধান ও আপনার দৃশ্যে সঠিক AI টেম্পলেট নির্বাচন | ২০ মিনিট |
| **২. যাচাই** | মোতায়েন ও যাচাই | `azd up` দ্বারা টেম্পলেট মোতায়েন এবং অবকাঠামোর কাজ যাচাই | ৩০ মিনিট |
| **৩. ভাঙচুর** | কাঠামো বোঝা | GitHub Copilot ব্যবহার করে টেম্পলেট আর্কিটেকচার, Bicep ফাইল এবং কোড সংগঠন অনুসন্ধান | ৩০ মিনিট |
| **৪. কনফিগারেশন** | azure.yaml গভীর বিশ্লেষণ | `azure.yaml` কনফিগারেশন, lifecycle hooks এবং পরিবেশ পরিবর্তনশীল শেখা | ৩০ মিনিট |
| **৫. কাস্টমাইজেশন** | আপনার জন্য সাজিয়ে নিন | AI অনুসন্ধান সক্ষম করা, ট্রেসিং, মূল্যায়ন এবং আপনার দৃশ্যের উপযোগী কাস্টমাইজেশন | ৪৫ মিনিট |
| **৬. টিয়ারডাউন** | পরিষ্কার করুন | `azd down --purge` দিয়ে সম্পদ নিরাপদে অপসারণ | ১৫ মিনিট |
| **৭. সমাপ্তি** | পরবর্তী ধাপ | অর্জনসমূহ পর্যালোচনা, প্রধান ধারণা, এবং শেখার যাত্রা চালিয়ে যাওয়া | ১৫ মিনিট |

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
# অপশন ১: গিটহাব কোডস্পেস (প্রস্তাবিত)
# রেপোজিটরিতে "কোড" → "মেইনে কোডস্পেস তৈরি করুন" ক্লিক করুন

# অপশন ২: লোকাল ডেভেলপমেন্ট
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md এ সেটআপ নির্দেশনাগুলি অনুসরণ করুন
```

#### 🎯 কর্মশালা শেখার ফলাফল
কর্মশালা সম্পন্ন করার মাধ্যমে, অংশগ্রহণকারীরা:
- **উৎপাদন AI অ্যাপ্লিকেশন মোতায়েন করুন**: Microsoft Foundry সার্ভিসেসের সাথে AZD ব্যবহার
- **মাল্টি-এজেন্ট আর্কিটেকচার মাস্টারি করুন**: সমন্বিত AI এজেন্ট সমাধান বাস্তবায়ন
- **নিরাপত্তার সেরা অনুশীলন প্রয়োগ করুন**: প্রমাণীকরণ এবং অ্যাক্সেস নিয়ন্ত্রণ কনফিগার করুন
- **স্কেলের জন্য অপ্টিমাইজ করুন**: ব্যয়-দক্ষ, পারফরম্যান্ট মোতায়েন ডিজাইন
- **মোতায়েন সমস্যাসমাধান করুন**: সাধারণ সমস্যা স্বতন্ত্রভাবে সমাধান করুন

#### 📖 কর্মশালা উপকরণ
- **🎥 ইন্টারেক্টিভ গাইড**: [কর্মশালা উপকরণ](workshop/README.md) - ব্রাউজার-ভিত্তিক শেখার পরিবেশ
- **📋 মডিউল অনুসারে নির্দেশনা**:
  - [০. পরিচিতি](workshop/docs/instructions/0-Introduction.md) - কর্মশালা সংক্ষিপ্ত বিবরণ ও লক্ষ্য
  - [১. নির্বাচন](workshop/docs/instructions/1-Select-AI-Template.md) - AI টেম্পলেট অনুসন্ধান ও নির্বাচন
  - [২. যাচাই](workshop/docs/instructions/2-Validate-AI-Template.md) - টেম্পলেট মোতায়েন ও যাচাই
  - [৩. ভাঙচুর](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - টেম্পলেট আর্কিটেকচার অনুসন্ধান
  - [৪. কনফিগারেশন](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml মাস্টার করা
  - [৫. কাস্টমাইজেশন](workshop/docs/instructions/5-Customize-AI-Template.md) - আপনার দৃশ্যে কাস্টমাইজেশন
  - [৬. টিয়ারডাউন](workshop/docs/instructions/6-Teardown-Infrastructure.md) - সম্পদ পরিষ্কার করা
  - [৭. সমাপ্তি](workshop/docs/instructions/7-Wrap-up.md) - পর্যালোচনা ও পরবর্তী ধাপ
- **🛠️ AI কর্মশালা ল্যাব**: [AI কর্মশালা ল্যাব](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-কেন্দ্রিক অনুশীলন
- **💡 দ্রুত শুরু**: [কর্মশালা সেটআপ গাইড](workshop/README.md#quick-start) - পরিবেশ কনফিগারেশন

**সর্বোত্তম**: কর্পোরেট প্রশিক্ষণ, বিশ্ববিদ্যালয় কোর্স, স্ব-গতি শেখা, এবং ডেভেলপার বুটক্যাম্পের জন্য।

---

## 📖 গভীর অন্তর্দৃষ্টি: AZD ক্ষমতা

মৌলিক ধারণার বাইরে, AZD উৎপাদন মোতায়েনের জন্য শক্তিশালী বৈশিষ্ট্য প্রদান করে:

- **টেম্পলেট-ভিত্তিক মোতায়েন** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নের জন্য পূর্বনির্মিত টেম্পলেট ব্যবহার করুন
- **ইনফ্রাস্ট্রাকচার অ্যাজ কোড** - Bicep অথবা Terraform দিয়ে Azure সম্পদ পরিচালনা  
- **সমন্বিত কর্মপ্রবাহ** - নির্বিঘ্নে অ্যাপ্লিকেশন প্রোভিশন, মোতায়েন, এবং মনিটরিং
- **ডেভেলপার-বান্ধব** - ডেভেলপার উৎপাদনশীলতা ও অভিজ্ঞতার জন্য অপ্টিমাইজড

### **AZD + Microsoft Foundry: AI মোতায়েনের জন্য উপযুক্ত**

**কেন AZD AI সমাধানের জন্য?** AZD AI ডেভেলপারদের মুখোমুখি হওয়া প্রধান চ্যালেঞ্জগুলি সমাধান করে:

- **AI-সিদ্ধ টেম্পলেটস** - Microsoft Foundry মডেল, Azure AI সার্ভিস, এবং ML ওয়ার্কলোডের জন্য পূর্বকনফিগার টেম্পলেট
- **নিরাপদ AI মোতায়েন** - AI সার্ভিস, API কী, এবং মডেল এন্ডপয়েন্টের জন্য নির্মিত নিরাপত্তা প্যাটার্ন  
- **উৎপাদন AI প্যাটার্নস** - স্কেলযোগ্য, ব্যয়-দক্ষ AI অ্যাপ্লিকেশন মোতায়েনের সেরা অনুশীলন
- **এন্ড-টু-এন্ড AI কর্মপ্রবাহ** - মডেল উন্নয়ন থেকে উৎপাদন মোতায়েন পর্যন্ত যথাযথ মনিটরিংসহ
- **ব্যয় অপ্টিমাইজেশন** - AI ওয়ার্কলোডের জন্য বুদ্ধিমান সম্পদ বরাদ্দ এবং স্কেলিং কৌশল
- **Microsoft Foundry ইন্টিগ্রেশন** - Microsoft Foundry মডেল ক্যাটালগ এবং এন্ডপয়েন্টের সাথে নির্বিঘ্ন সংযোগ

---

## 🎯 টেম্পলেটস এবং উদাহরণ লাইব্রেরি

### বৈশিষ্ট্যযুক্ত: Microsoft Foundry টেম্পলেট
**এখান থেকে শুরু করুন যদি আপনি AI অ্যাপ্লিকেশন মোতায়েন করছেন!**

> **নোট:** এই টেম্পলেটগুলি বিভিন্ন AI প্যাটার্ন প্রদর্শন করে। কিছু বাহ্যিক Azure নমুনা, অন্যান্য স্থানীয় বাস্তবায়ন।

| টেম্পলেট | অধ্যায় | কঠিনত্ব | সার্ভিসসমূহ | ধরন |
|----------|---------|------------|----------|------|
| [**AI চ্যাট শুরু করুন**](https://github.com/Azure-Samples/get-started-with-ai-chat) | অধ্যায় ২ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | বাহ্যিক |
| [**AI এজেন্ট শুরু করুন**](https://github.com/Azure-Samples/get-started-with-ai-agents) | অধ্যায় ২ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| বাহ্যিক |
| [**Azure Search + OpenAI ডেমো**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় ২ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | বাহ্যিক |
| [**OpenAI চ্যাট অ্যাপ দ্রুত শুরু**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় ২ | ⭐ | AzureOpenAI + Container Apps + Application Insights | বাহ্যিক |
| [**এজেন্ট OpenAI পাইথন Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় ৫ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | বাহ্যিক |
| [**Contoso চ্যাট RAG**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় ৮ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | বাহ্যিক |
| [**রিটেল মাল্টি-এজেন্ট সমাধান**](examples/retail-scenario.md) | অধ্যায় ৫ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **স্থানীয়** |

### বৈশিষ্ট্যযুক্ত: সম্পূর্ণ শেখার দৃশ্যাবলী
**উৎপাদন-সিদ্ধ অ্যাপ্লিকেশন টেম্পলেট যা শেখার অধ্যায়গুলির সাথে ম্যাপ করা হয়েছে**

| টেম্পলেট | শেখার অধ্যায় | কঠিনত্ব | প্রধান শেখার বিষয় |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | অধ্যায় ২ | ⭐ | মৌলিক AI মোতায়েন প্যাটার্ন |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | অধ্যায় ২ | ⭐⭐ | Azure AI Search সহ RAG বাস্তবায়ন |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | অধ্যায় ৪ | ⭐⭐ | ডকুমেন্ট ইন্টেলিজেন্স ইন্টিগ্রেশন |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | অধ্যায় ৫ | ⭐⭐⭐ | এজেন্ট ফ্রেমওয়ার্ক এবং ফাংশন কলিং |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | অধ্যায় ৮ | ⭐⭐⭐ | এন্টারপ্রাইজ AI অর্কেস্ট্রেশন |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | অধ্যায় ৫ | ⭐⭐⭐⭐ | কাস্টমার এবং ইনভেন্টরি এজেন্টসহ মাল্টি-এজেন্ট আর্কিটেকচার |

### উদাহরণ ধরনের মাধ্যমে শেখা

> **📌 স্থানীয় বনাম বাহ্যিক উদাহরণ:**  
> **স্থানীয় উদাহরণসমূহ** (এই রিপোজিটরিতে) = তৎক্ষণাৎ ব্যবহারের জন্য প্রস্তুত  
> **বাহ্যিক উদাহরণসমূহ** (Azure নমুনা) = সংযুক্ত রিপোজিটরি থেকে ক্লোন করুন

#### স্থানীয় উদাহরণসমূহ (ব্যবহারের জন্য প্রস্তুত)
- [**রিটেল মাল্টি-এজেন্ট সমাধান**](examples/retail-scenario.md) - ARM টেম্পলেট সহ সম্পূর্ণ উৎপাদন-সিদ্ধ বাস্তবায়ন
  - মাল্টি-এজেন্ট আর্কিটেকচার (কাস্টমার + ইনভেন্টরি এজেন্ট)
  - ব্যাপক মনিটরিং ও মূল্যায়ন
  - ARM টেম্পলেটের মাধ্যমে এক-ক্লিক মোতায়েন

#### স্থানীয় উদাহরণসমূহ - কন্টেইনার অ্যাপ্লিকেশনসমূহ (অধ্যায় ২-৫)
**এই রিপোজিটরিতে ব্যাপক কন্টেইনার মোতায়েন উদাহরণসমূহ:**

- [**কন্টেইনার অ্যাপ উদাহরণসমূহ**](examples/container-app/README.md) - কন্টেইনার ভিত্তিক ডিপ্লয়মেন্টের সম্পূর্ণ গাইড
  - [সাধারণ Flask API](../../examples/container-app/simple-flask-api) - স্কেল-টু-জিরোর সাথে মৌলিক REST API
  - [মাইক্রোসার্ভিস আর্কিটেকচার](../../examples/container-app/microservices) - প্রোডাকশন-রেডি মাল্টি-সার্ভিস ডিপ্লয়মেন্ট
  - দ্রুত শুরু, প্রোডাকশন, এবং উন্নত ডিপ্লয়মেন্ট প্যাটার্নসমূহ
  - মনিটরিং, সিকিউরিটি, এবং খরচ অপ্টিমাইজেশনের নির্দেশিকা

#### বাহ্যিক উদাহরণ - সাধারণ অ্যাপ্লিকেশনসমূহ (অধ্যায় ১-২)
**শুরু করতে এই Azure Samples রিপোজিটরিগুলি ক্লোন করুন:**
- [সহজ ওয়েব অ্যাপ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - মৌলিক ডিপ্লয়মেন্ট প্যাটার্ন
- [স্ট্যাটিক ওয়েবসাইট - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - স্ট্যাটিক কন্টেন্ট ডিপ্লয়মেন্ট
- [কন্টেইনার অ্যাপ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ডিপ্লয়মেন্ট

#### বাহ্যিক উদাহরণ - ডাটাবেস ইন্টিগ্রেশন (অধ্যায় ৩-৪)  
- [ডাটাবেস অ্যাপ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ডাটাবেস সংযোগ প্যাটার্নসমূহ
- [ফাংশন + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - সার্ভারলেস ডেটা ওয়ার্কফ্লো

#### বাহ্যিক উদাহরণ - উন্নত প্যাটার্নসমূহ (অধ্যায় ৪-৮)
- [জাভা মাইক্রোসার্ভিসেস](https://github.com/Azure-Samples/java-microservices-aca-lab) - মাল্টি-সার্ভিস আর্কিটেকচার
- [কন্টেইনার অ্যাপ জবস](https://github.com/Azure-Samples/container-apps-jobs) - ব্যাকগ্রাউন্ড প্রসেসিং  
- [এন্টারপ্রাইজ ML পাইপলাইন](https://github.com/Azure-Samples/mlops-v2) - প্রোডাকশন-রেডি মেশিন লার্নিং প্যাটার্ন

### বাহ্যিক টেমপ্লেট সংগ্রহসমূহ
- [**অফিসিয়াল AZD টেমপ্লেট গ্যালারি**](https://azure.github.io/awesome-azd/) - অফিসিয়াল এবং কমিউনিটি টেমপ্লেটের নির্বাচিত সংগ্রহ
- [**Azure Developer CLI টেমপ্লেটসমূহ**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn টেমপ্লেট ডকুমেন্টেশন
- [**উদাহরণ ডিরেক্টরি**](examples/README.md) - বিস্তারিত ব্যাখ্যার সাথে স্থানীয় শিক্ষণ উদাহরণসমূহ

---

## 📚 শিক্ষণ সম্পদ ও রেফারেন্সসমূহ

### দ্রুত রেফারেন্সসমূহ
- [**কমান্ড চিট শিট**](resources/cheat-sheet.md) - অধ্যায় অনুযায়ী সাজানো প্রয়োজনীয় azd কমান্ডসমূহ
- [**শর্তাবলী**](resources/glossary.md) - Azure এবং azd টার্মিনোলজি  
- [**সাধারণ প্রশ্নাবলি**](resources/faq.md) - শিক্ষণ অধ্যায় অনুযায়ী সাধারণ প্রশ্নসমূহ
- [**স্টাডি গাইড**](resources/study-guide.md) - ব্যাপক অনুশীলন কার্যক্রম

### হ্যান্ডস-অন কর্মশালা
- [**AI ওয়ার্কশপ ল্যাব**](docs/chapter-02-ai-development/ai-workshop-lab.md) - আপনার AI সমাধানগুলো AZD-ডিপ্লয়েবল করুন (২-৩ ঘন্টা)
- [**ইন্টারেক্টিভ ওয়ার্কশপ**](workshop/README.md) - MkDocs এবং GitHub Codespaces সহ ৮-মডিউল গাইডেড অনুশীলন
  - অনুসরণ করে: পরিচিতি → নির্বাচন → যাচাইকরণ → ভাঙন → কনফিগারেশন → কাস্টমাইজেশন → বন্ধকরণ → সারসংক্ষেপ

### বাহ্যিক শিক্ষণ সম্পদসমূহ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure আর্কিটেকচার কেন্দ্র](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure মূল্য নিরূপণ ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)
- [Azure স্ট্যাটাস](https://status.azure.com/)

### আপনার সম্পাদক জন্য AI এজেন্ট দক্ষতাসমূহ
- [**skills.sh তে Microsoft Azure দক্ষতাসমূহ**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, ডিপ্লয়মেন্ট, ডায়গনস্টিক, খরচ অপ্টিমাইজেশন এবং আরও অনেকের জন্য ৩৭টি ওপেন এজেন্ট দক্ষতা। এগুলো GitHub Copilot, Cursor, Claude Code বা যেকোনো সমর্থিত এজেন্টে ইনস্টল করুন:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 দ্রুত সমস্যাসমাধান গাইড

**শিক্ষানবীশদের সাধারণ সমস্যাগুলো এবং তাৎক্ষণিক সমাধান:**

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
<summary><strong>❌ "কোন সাবস্ক্রিপশন পাওয়া যায়নি" বা "সাবস্ক্রিপশন সেট করা হয়নি"</strong></summary>

```bash
# উপলভ্য সাবস্ক্রিপশনগুলি তালিকা করুন
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
<summary><strong>❌ "azd up" আংশিকভাবে ব্যর্থ</strong></summary>

```bash
# অপশন ১: পরিষ্কার করুন এবং পুনরায় চেষ্টা করুন
azd down --force --purge
azd up

# অপশন ২: শুধু অবকাঠামো ঠিক করুন
azd provision

# অপশন ৩: বিস্তারিত স্থিতি যাচাই করুন
azd show

# অপশন ৪: আজুর মনিটরে লগ পরীক্ষা করুন
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "প্রমাণীকরণ ব্যর্থ" বা "টোকেন মেয়াদ উত্তীর্ণ"</strong></summary>

```bash
# AZD এর জন্য পুনরায় প্রমাণীকরণ করুন
azd auth logout
azd auth login

# ঐচ্ছিক: যদি আপনি az কমান্ডগুলি চালাচ্ছেন তবে Azure CLI তাও রিফ্রেশ করুন
az logout
az login

# প্রমাণীকরণ যাচাই করুন
az account show
```
</details>

<details>
<summary><strong>❌ "রিসোর্স ইতোমধ্যে বিদ্যমান" বা নাম সংঘর্ষ</strong></summary>

```bash
# AZD অনন্য নাম তৈরি করে, কিন্তু যদি সংঘাত ঘটে:
azd down --force --purge

# তাহলে নতুন পরিবেশ নিয়ে পুনরায় চেষ্টা করুন
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ টেমপ্লেট ডিপ্লয়মেন্টে বেশি সময় লাগছে</strong></summary>

**সাধারণ অপেক্ষার সময়:**
- সহজ ওয়েব অ্যাপ: ৫-১০ মিনিট
- ডাটাবেসসহ অ্যাপ: ১০-১৫ মিনিট
- AI অ্যাপ্লিকেশনসমূহ: ১৫-২৫ মিনিট (OpenAI পারিষেবা ধীর)

```bash
# অগ্রগতি পরীক্ষা করুন
azd show

# যদি >৩০ মিনিট আটকে থাকেন, Azure পোর্টাল পরীক্ষা করুন:
azd monitor --overview
# ব্যর্থ ডিপ্লয়মেন্টগুলি খুঁজুন
```
</details>

<details>
<summary><strong>❌ "অনুমতি অস্বীকৃত" বা "নিষিদ্ধ"</strong></summary>

```bash
# আপনার Azure ভূমিকা চেক করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# আপনার কমপক্ষে "Contributor" ভূমিকা থাকা দরকার
# আপনার Azure প্রশাসককে অনুরোধ করুন প্রদান করার জন্য:
# - Contributor (সম্পদের জন্য)
# - User Access Administrator (ভূমিকা বরাদ্দের জন্য)
```
</details>

<details>
<summary><strong>❌ ডিপ্লয়েড অ্যাপ্লিকেশনের URL পাওয়া যাচ্ছে না</strong></summary>

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

### 📚 পূর্ণ সমস্যাসমাধান সম্পদ

- **সাধারণ সমস্যাগুলোর গাইড:** [বিস্তারিত সমাধানসমূহ](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-নির্দিষ্ট সমস্যা:** [AI সমস্যা সমাধান](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ডিবাগিং গাইড:** [ধাপ-ধাপে ডিবাগিং](docs/chapter-07-troubleshooting/debugging.md)
- **সাহায্য নিন:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 কোর্স সম্পন্ন ও সার্টিফিকেশন

### অগ্রগতির ট্র্যাকিং
প্রতিটি অধ্যায়ের মাধ্যমে আপনার শিক্ষার অগ্রগতি ট্র্যাক করুন:

- [ ] **অধ্যায় ১**: ভিত্তি ও দ্রুত শুরু ✅
- [ ] **অধ্যায় ২**: AI-প্রথম উন্নয়ন ✅  
- [ ] **অধ্যায় ৩**: কনফিগারেশন ও প্রমাণীকরণ ✅
- [ ] **অধ্যায় ৪**: কোড হিসেবে অবকাঠামো ও ডিপ্লয়মেন্ট ✅
- [ ] **অধ্যায় ৫**: মাল্টি-এজেন্ট AI সমাধান ✅
- [ ] **অধ্যায় ৬**: প্রি-ডিপ্লয়মেন্ট যাচাইকরণ ও পরিকল্পনা ✅
- [ ] **অধ্যায় ৭**: সমস্যাসমাধান ও ডিবাগিং ✅
- [ ] **অধ্যায় ৮**: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন ✅

### শিক্ষার যাচাইকরণ
প্রতিটি অধ্যায় শেষ করার পর, আপনার জ্ঞান যাচাই করুন:
1. **ব্যবহারিক অনুশীলন**: অধ্যায়ের হ্যান্ডস-অন ডিপ্লয়মেন্ট শেষ করুন
2. **জ্ঞান পরিক্ষা**: আপনার অধ্যায়ের FAQ অংশটি পুনরায় দেখুন
3. **কমিউনিটি আলোচনা**: Azure Discord-এ আপনার অভিজ্ঞতা শেয়ার করুন
4. **পরবর্তী অধ্যায়**: পরবর্তী জটিলতা স্তরে যান

### কোর্স সম্পূর্ণ করার সুবিধাসমূহ
সমস্ত অধ্যায় সম্পূর্ণ করার পরে, আপনার কাছে থাকবে:
- **প্রোডাকশন অভিজ্ঞতা**: Azure-এ বাস্তব AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট
- **পেশাগত দক্ষতা**: এন্টারপ্রাইজ-রেডি ডিপ্লয়মেন্ট ক্ষমতা  
- **কমিউনিটি স্বীকৃতি**: Azure ডেভেলপার কমিউনিটির সক্রিয় সদস্য
- **ক্যারিয়ার উন্নয়ন**: চাহিদাসম্পন্ন AZD এবং AI ডিপ্লয়মেন্ট দক্ষতা

---

## 🤝 কমিউনিটি ও সমর্থন

### সাহায্য ও সমর্থন পান
- **প্রযুক্তিগত সমস্যা**: [বাগ রিপোর্ট ও ফিচার অনুরোধ](https://github.com/microsoft/azd-for-beginners/issues)
- **শিক্ষণ প্রশ্ন**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) এবং [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-নির্দিষ্ট সহায়তা**: যোগ দিন [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ডকুমেন্টেশন**: [অফিসিয়াল Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord থেকে কমিউনিটি অন্তর্দৃষ্টি

**#Azure চ্যানেল থেকে সাম্প্রতিক পোল ফলাফল:**
- **৪৫%** ডেভেলপার AI ওয়ার্কলোডের জন্য AZD ব্যবহার করতে চায়
- **প্রধান চ্যালেঞ্জসমূহ**: মাল্টি-সার্ভিস ডিপ্লয়মেন্ট, ক্রেডেনশিয়াল ম্যানেজমেন্ট, প্রোডাকশন প্রস্তুতি  
- **সবচেয়ে চাওয়া হয়েছে**: AI-নির্দিষ্ট টেমপ্লেট, সমস্যাসমাধান গাইড, সেরা অনুশীলনসমূহ

**আমাদের কমিউনিটিতে যোগ দিন:**
- আপনার AZD + AI অভিজ্ঞতা শেয়ার করুন এবং সাহায্য নিন
- নতুন AI টেমপ্লেটের আগাম Preview অ্যাক্সেস পান
- AI ডিপ্লয়মেন্ট সেরা অনুশীলনে অবদান রাখুন
- ভবিষ্যতের AI + AZD ফিচার উন্নয়নে প্রভাব ফেলুন

### কোর্সে অবদান রাখা
আমরা অবদানের প্রতি স্বাগত জানাই! দয়া করে আমাদের [অবদান গাইড](CONTRIBUTING.md) পড়ুন বিস্তারিত জন্য:
- **কন্টেন্ট উন্নতি**: বিদ্যমান অধ্যায় এবং উদাহরণ উন্নত করুন
- **নতুন উদাহরণ**: বাস্তব-জীবনের দৃশ্য এবং টেমপ্লেট যোগ করুন  
- **অনুবাদ**: বহু-ভাষা সমর্থন বজায় রাখতে সাহায্য করুন
- **বাগ রিপোর্ট**: সঠিকতা এবং স্পষ্টতা বৃদ্ধি করুন
- **কমিউনিটি নীতিমালা**: আমাদের অন্তর্ভুক্তিমূলক কমিউনিটি গাইডলাইন অনুসরণ করুন

---

## 📄 কোর্স তথ্য

### লাইসেন্স
এই প্রকল্প MIT লাইসেন্সের অধীনে লাইসেন্সপ্রাপ্ত - বিস্তারিত জন্য [LICENSE](../../LICENSE) ফাইল দেখুন।

### সম্পর্কিত Microsoft শিক্ষণ সম্পদসমূহ

আমাদের দল অন্যান্য ব্যাপক শিক্ষণ কোর্স তৈরি করে:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j শিক্ষানবীশদের জন্য](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js শিক্ষানবীশদের জন্য](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain শিক্ষানবীশদের জন্য](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / এজেন্টসমূহ
[![AZD শিক্ষানবীশদের জন্য](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI শিক্ষানবীশদের জন্য](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP শিক্ষানবীশদের জন্য](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI এজেন্ট শিক্ষানবীশদের জন্য](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### জেনেরেটিভ AI সিরিজ
[![জেনেরেটিভ AI শিক্ষানবীশদের জন্য](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![জেনেরেটিভ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![জেনেরেটিভ AI (জাভা)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### মূল শেখা
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### কোপাইলট সিরিজ
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ কোর্স নেভিগেশন

**🚀 শেখা শুরু করতে প্রস্তুত?**

**শুরুয়াতারা**: শুরু করুন [অধ্যায় 1: ভিত্তি ও দ্রুত শুরু](#-chapter-1-foundation--quick-start)  
**এআই ডেভেলপাররা**: যান [অধ্যায় 2: এআই-প্রথম উন্নয়ন](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**অভিজ্ঞ ডেভেলপাররা**: শুরু করুন [অধ্যায় 3: কনফিগারেশন ও প্রমাণীকরণ](#️-chapter-3-configuration--authentication)

**পরবর্তী ধাপ**: [অধ্যায় 1 শুরু - AZD এর মৌলিক বিষয়](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
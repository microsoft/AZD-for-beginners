# আপনার প্রথম প্রকল্প - হ্যান্ডস-অন টিউটোরিয়াল

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: Chapter 1 - Foundation & Quick Start
- **⬅️ পূর্বের**: [Installation & Setup](installation.md)
- **➡️ পরের**: [Configuration](configuration.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

আপনার প্রথম Azure Developer CLI প্রকল্পে স্বাগতম! এই বিস্তৃত হ্যান্ডস-অন টিউটোরিয়ালটি azd ব্যবহার করে Azure-এ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনার সম্পূর্ণ নির্দেশ প্রদান করে। আপনি একটি বাস্তব todo অ্যাপ্লিকেশন নিয়ে কাজ করবেন যা একটি React ফ্রন্টএন্ড, Node.js API ব্যাকএন্ড এবং MongoDB ডাটাবেস অন্তর্ভুক্ত করে।

## শেখার লক্ষ্য

এই টিউটোরিয়ালটি সম্পন্ন করার মাধ্যমে আপনি:
- টেমপ্লেট ব্যবহার করে azd প্রকল্প আরম্ভকরণ ওয়ার্কফ্লো আয়ত্ত করবেন
- Azure Developer CLI প্রকল্পের স্ট্রাকচার এবং কনফিগারেশন ফাইলগুলো বোঝা হবে
- ইনফ্রাস্ট্রাকচার প্রোভিশনিংসহ সম্পূর্ণ অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করতে সক্ষম হবেন
- অ্যাপ্লিকেশন আপডেট এবং পুনরায় ডিপ্লয় কৌশল প্রয়োগ করতে পারবেন
- ডেভেলপমেন্ট এবং স্টেজিংয়ের জন্য একাধিক পরিবেশ পরিচালনা করতে পারবেন
- রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনা অনুশীলন প্রয়োগ করবেন

## শেখার ফলাফল

সম্পন্ন করার পর, আপনি সক্ষম হবেন:
- টেমপ্লেট থেকে স্বাধীনভাবে azd প্রকল্প আরম্ভ ও কনফিগার করা
- azd প্রকল্পের স্ট্রাকচার কার্যকরভাবে নেভিগেট ও সংশোধন করা
- একক কমান্ড ব্যবহার করে Azure-এ ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করা
- সাধারণ ডিপ্লয়মেন্ট সমস্যা এবং প্রমাণীকরণ সমস্যা ট্রাবলশুট করা
- বিভিন্ন ডিপ্লয়মেন্ট স্টেজের জন্য একাধিক Azure পরিবেশ পরিচালনা করা
- অ্যাপ্লিকেশন আপডেটের জন্য কন্টিনিউয়াস ডিপ্লয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন করা

## শুরু করা যাক

### প্রয়োজনীয়তার চেকলিস্ট
- ✅ Azure Developer CLI ইনস্টল করা হয়েছে ([Installation Guide](installation.md))
- ✅ `azd auth login` দিয়ে AZD প্রমাণীকরণ সম্পন্ন
- ✅ Git আপনার সিস্টেমে ইনস্টল করা আছে
- ✅ Node.js 16+ (এই টিউটোরিয়ালের জন্য)
- ✅ Visual Studio Code (প্রস্তাবিত)

আরও এগনোর আগে, রিপোজিটরি রুট থেকে সেটআপ ভ্যালিডেটর চালান:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### আপনার সেটআপ যাচাই করুন
```bash
# azd ইনস্টলেশন পরীক্ষা করুন
azd version

# AZD প্রমাণীকরণ পরীক্ষা করুন
azd auth login --check-status
```

### ঐচ্ছিক Azure CLI প্রমাণীকরণ যাচাই করুন

```bash
az account show
```

### Node.js সংস্করণ পরীক্ষা করুন
```bash
node --version
```

## ধাপ 1: টেমপ্লেট নির্বাচন ও আরম্ভ করা

চলুন একটি জনপ্রিয় todo অ্যাপ্লিকেশন টেমপ্লেট দিয়ে শুরু করি যা একটি React ফ্রন্টএন্ড এবং Node.js API ব্যাকএন্ড অন্তর্ভুক্ত করে।

```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টুডো অ্যাপ টেমপ্লেট আরম্ভ করুন
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# প্রম্পটগুলো অনুসরণ করুন:
# - একটি পরিবেশের নাম লিখুন: "dev"
# - একটি সাবস্ক্রিপশন নির্বাচন করুন (যদি আপনার একাধিক থাকে)
# - একটি অঞ্চল নির্বাচন করুন: "East US 2" (অথবা আপনার পছন্দের অঞ্চল)
```

### এখন কী ঘটল?
- টেমপ্লেট কোড আপনার লোকাল ডিরেক্টরিতে ডাউনলোড করা হয়েছে
- সার্ভিস সংজ্ঞাসহ একটি `azure.yaml` ফাইল তৈরি করা হয়েছে
- `infra/` ডিরেক্টরিতে ইনফ্রাস্ট্রাকচার কোড সেট আপ করা হয়েছে
- একটি পরিবেশ কনফিগারেশন তৈরি করা হয়েছে

## ধাপ 2: প্রকল্প কাঠামো অন্বেষণ করুন

চলুন দেখি azd আমাদের জন্য কী তৈরি করেছে:

```bash
# প্রকল্পের কাঠামো দেখুন
tree /f   # উইন্ডোজ
# বা
find . -type f | head -20   # ম্যাকওএস/লিনাক্স
```

আপনি দেখতে পাবেন:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### বোঝার জন্য প্রধান ফাইলগুলো

**azure.yaml** - আপনার azd প্রকল্পের মূল:
```bash
# প্রকল্পের কনফিগারেশন দেখুন
cat azure.yaml
```

**infra/main.bicep** - ইনফ্রাস্ট্রাকচার সংজ্ঞা:
```bash
# অবকাঠামো কোড দেখুন
head -30 infra/main.bicep
```

## ধাপ 3: আপনার প্রকল্প কাস্টমাইজ করুন (ঐচ্ছিক)

ডিপ্লয় করার আগে, আপনি অ্যাপ্লিকেশনটি কাস্টমাইজ করতে পারেন:

### ফ্রন্টএন্ড পরিবর্তন করুন
```bash
# React অ্যাপের কম্পোনেন্ট খুলুন
code src/web/src/App.tsx
```

একটি সহজ পরিবর্তন করুন:
```typescript
// শিরোনামটি খুঁজে তা পরিবর্তন করুন
<h1>My Awesome Todo App</h1>
```

### পরিবেশ ভেরিয়েবল কনফিগার করুন
```bash
# কাস্টম পরিবেশ ভেরিয়েবল সেট করুন
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# সমস্ত পরিবেশ ভেরিয়েবল দেখুন
azd env get-values
```

## ধাপ 4: Azure-এ ডিপ্লয় করুন

এখন উত্তেজনাপূর্ণ অংশ - সবকিছু Azure-এ ডিপ্লয় করুন!

```bash
# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন স্থাপন করুন
azd up

# এই কমান্ডটি করবে:
# 1. Azure রিসোর্স প্রস্তুত করবে (App Service, Cosmos DB ইত্যাদি)
# 2. আপনার অ্যাপ্লিকেশন বিল্ড করবে
# 3. প্রস্তুতকৃত রিসোর্সে ডিপ্লয় করবে
# 4. অ্যাপ্লিকেশনের URL প্রদর্শন করবে
```

### ডিপ্লয়মেন্টের সময় কী ঘটছে?

`azd up` কমান্ড এই ধাপগুলো সম্পাদন করে:
1. **Provision** (`azd provision`) - Azure রিসোর্স তৈরি করে
2. **Package** - আপনার অ্যাপ্লিকেশন কোড বিল্ড করে
3. **Deploy** (`azd deploy`) - কোডকে Azure রিসোর্সে ডিপ্লয় করে

### প্রত্যাশিত আউটপুট
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ধাপ 5: আপনার অ্যাপ্লিকেশন পরীক্ষা করুন

### আপনার অ্যাপ্লিকেশন অ্যাক্সেস করুন
ডিপ্লয়মেন্ট আউটপুটে প্রদত্ত URL-এ ক্লিক করুন, অথবা যে কোনো সময় তা নিন:
```bash
# অ্যাপ্লিকেশনের এন্ডপয়েন্টগুলি পান
azd show

# আপনার ব্রাউজারে অ্যাপ্লিকেশনটি খুলুন
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo অ্যাপ পরীক্ষা করুন
1. **একটি টুডো আইটেম যোগ করুন** - "টুডো যোগ করুন" ক্লিক করে একটি কাজ প্রবেশ করান
2. **সম্পূর্ণ হিসাবে চিহ্নিত করুন** - সম্পন্ন হওয়া আইটেমগুলো চিহ্নিত করুন
3. **আইটেম মুছুন** - আর প্রয়োজন 없는 টুডো মুছুন

### আপনার অ্যাপ্লিকেশন মনিটর করুন
```bash
# আপনার রিসোর্সগুলোর জন্য Azure পোর্টাল খুলুন
azd monitor

# অ্যাপ্লিকেশন লগ দেখুন
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

### ✅ আপনার ডিপ্লয়মেন্ট যাচাই করুন

আগে এগোনোর আগে, নিম্নলিখিত দ্রুত চেকলিস্টটি চালান যাতে নিশ্চিত হওয়া যায় সবকিছু ঠিকমতো কাজ করছে—শুধু "deploy succeeded" বলা মানে নয় যে "অ্যাপ কাজ করছে":

```bash
# 1. নিশ্চিত করুন যে এন্ডপয়েন্টটি বিদ্যমান এবং অভিগম্য
azd show

# 2. এন্ডপয়েন্টটি স্মোক-টেস্ট করুন (HTTP 200 প্রত্যাশা করে)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. যদি আপনার অ্যাপ একটি হেলথ এন্ডপয়েন্ট প্রকাশ করে, তাহলে সেটি পরীক্ষা করুন
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**ডিপ্লয়মেন্ট যাচাই করা হয় যখন:**
- ✅ `azd show` একটি পৌঁছানো যোগ্য endpoint URL তালিকাভুক্ত করে
- ✅ URL আপনার ব্রাউজারে ত্রুটি ছাড়া খুলে
- ✅ মূল ফিচারগুলো কাজ করে (যোগ/সম্পন্ন/মুছুন একটি টুডো)
- ✅ `azd monitor --logs` অনুরোধগুলো দেখায় এবং অপ্রত্যাশিত ত্রুটি নেই

যদি কোনো চেক ব্যর্থ হয়, [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md)-এ যান।

## ধাপ 6: পরিবর্তন করুন এবং পুনরায় ডিপ্লয় করুন

চলুন একটি পরিবর্তন করি এবং দেখতি কেমন সহজে আপডেট করা যায়:

### API পরিবর্তন করুন
```bash
# API কোড সম্পাদনা করুন
code src/api/src/routes/lists.js
```

একটি কাস্টম রেসপন্স হেডার যোগ করুন:
```javascript
// রুট হ্যান্ডলার খুঁজে বের করুন এবং যোগ করুন:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### শুধু কোড পরিবর্তনগুলো ডিপ্লয় করুন
```bash
# শুধুমাত্র অ্যাপ্লিকেশন কোড স্থাপন করুন (ইনফ্রাস্ট্রাকচার বাদ দিন)
azd deploy

# ইনফ্রাস্ট্রাকচার ইতিমধ্যেই আছে বলে এটি 'azd up' থেকে অনেক দ্রুত।
```

## ধাপ 7: একাধিক পরিবেশ পরিচালনা করুন

প্রোডাকশনের আগে পরিবর্তন পরীক্ষা করার জন্য একটি স্টেজিং পরিবেশ তৈরি করুন:

```bash
# একটি নতুন স্টেজিং পরিবেশ তৈরি করুন
azd env new staging

# স্টেজিং-এ ডিপ্লয় করুন
azd up

# ডেভ পরিবেশে ফিরে যান
azd env select dev

# সমস্ত পরিবেশ তালিকা করুন
azd env list
```

### পরিবেশ তুলনা
```bash
# ডেভেলপমেন্ট পরিবেশ দেখুন
azd env select dev
azd show

# স্টেজিং পরিবেশ দেখুন
azd env select staging
azd show
```

## ধাপ 8: রিসোর্সগুলো পরিষ্কার করুন

পরীক্ষা-নিরীক্ষা শেষ হলে, চলমান চার্জ এড়াতে রিসোর্সগুলো পরিষ্কার করুন:

```bash
# বর্তমান পরিবেশের জন্য সব Azure রিসোর্স মুছে ফেলুন
azd down

# নিশ্চিতকরণ ছাড়া জোরপূর্বক মুছে ফেলুন এবং সফট-ডিলিট হওয়া রিসোর্সগুলো চূড়ান্তভাবে অপসারণ করুন
azd down --force --purge

# নির্দিষ্ট পরিবেশ মুছে ফেলুন
azd env select staging
azd down --force --purge
```

## ক্লাসিক অ্যাপ বনাম AI-চালিত অ্যাপ: একই ওয়ার্কফ্লো

আপনি এখনো একটি প্রচলিত ওয়েব অ্যাপ ডিপ্লয় করেছেন। কিন্তু যদি আপনি একটি AI-চালিত অ্যাপ ডিপ্লয় করতে চান — ধরুন, Microsoft Foundry Models-এ ব্যাকড করা একটি চ্যাট অ্যাপ?

সুখবর: **ওয়ার্কফ্লো একরকম।**

| ধাপ | ক্লাসিক টুডো অ্যাপ | AI চ্যাট অ্যাপ |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

পৃথক কেবলই আপনি কোন **টেমপ্লেট** থেকে শুরু করছেন। একটি AI টেমপ্লেট অতিরিক্ত ইনফ্রাস্ট্রাকচার অন্তর্ভুক্ত করে (যেমন একটি Microsoft Foundry Models রিসোর্স বা একটি AI Search ইনডেক্স), কিন্তু azd এগুলো সব আপনার জন্য হ্যান্ডল করে। আপনাকে নতুন কমান্ড শিখতে হবে না, ভিন্ন টুল গ্রহণ করতে হবে না, বা ডিপ্লয়মেন্ট সম্পর্কে আপনার ধারণা বদলাতে হবে না।

এটাই azd-এর মূল নীতি: **one workflow, any workload.** এই টিউটোরিয়ালে আপনি যেসব দক্ষতা অনুশীলন করেছেন—আরম্ভ করা, ডিপ্লয় করা, মনিটর করা, পুনরায় ডিপ্লয় করা, এবং ক্লিনআপ—এসব দক্ষতা AI অ্যাপ্লিকেশন এবং এজেন্টদের ক্ষেত্রেও সমানভাবে প্রযোজ্য।

---

## আপনি যা শিখেছেন

অভিনন্দন! আপনি সফলভাবে:
- ✅ একটি টেমপ্লেট থেকে azd প্রকল্প আরম্ভ করেছেন
- ✅ প্রকল্প স্ট্রাকচার এবং প্রধান ফাইলগুলো অন্বেষণ করেছেন
- ✅ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করেছেন
- ✅ কোড পরিবর্তন করে পুনরায় ডিপ্লয় করেছেন
- ✅ একাধিক পরিবেশ পরিচালনা করেছেন
- ✅ রিসোর্সগুলো পরিষ্কার করেছেন

## 🎯 দক্ষতা যাচাই অনুশীলন

### অনুশীলন 1: একটি ভিন্ন টেমপ্লেট ডিপ্লয় করুন (১৫ মিনিট)
**লক্ষ্য**: azd init এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লো আয়ত্ত প্রদর্শন করা

```bash
# Python + MongoDB স্ট্যাক চেষ্টা করুন
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ডেপ্লয়মেন্ট যাচাই করুন
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] অ্যাপ্লিকেশন ত্রুটি ছাড়া ডিপ্লয় হয়
- [ ] ব্রাউজারে অ্যাপ্লিকেশন URL অ্যাক্সেস করা যায়
- [ ] অ্যাপ্লিকেশন সঠিকভাবে কাজ করে (টুডো যোগ/মুছা)
- [ ] সমস্ত রিসোর্স সফলভাবে ক্লিনআপ হয়েছে

### অনুশীলন 2: কনফিগারেশন কাস্টমাইজ করুন (২০ মিনিট)
**লক্ষ্য**: পরিবেশ ভেরিয়েবল কনফিগারেশন অনুশীলন করা

```bash
cd my-first-azd-app

# কাস্টম পরিবেশ তৈরি করুন
azd env new custom-config

# কাস্টম ভেরিয়েবল সেট করুন
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ভেরিয়েবল যাচাই করুন
azd env get-values | grep APP_TITLE

# কাস্টম কনফিগ দিয়ে ডিপ্লয় করুন
azd up
```

**সফলতার মানদণ্ড:**
- [ ] কাস্টম পরিবেশ সফলভাবে তৈরি হয়েছে
- [ ] পরিবেশ ভেরিয়েবল সেট ও পুনরুদ্ধারযোগ্য
- [ ] কাস্টম কনফিগারেশন সহ অ্যাপ্লিকেশন ডিপ্লয় হয়
- [ ] ডিপ্লয় করা অ্যাপ্লিকেশনে কাস্টম সেটিং যাচাই করা যায়

### অনুশীলন 3: মাল্টি-এনভায়রনমেন্ট ওয়ার্কফ্লো (২৫ মিনিট)
**লক্ষ্য**: পরিবেশ পরিচালনা এবং ডিপ্লয়মেন্ট কৌশল আয়ত্ত করা

```bash
# ডেভেলপমেন্ট পরিবেশ তৈরি করুন
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ডেভেলপমেন্ট পরিবেশের URL নোট করুন
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# স্টেজিং পরিবেশ তৈরি করুন
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# স্টেজিং পরিবেশের URL নোট করুন
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# পরিবেশগুলো তুলনা করুন
azd env list

# উভয় পরিবেশ পরীক্ষা করুন
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# উভয় পরিবেশ পরিষ্কার করুন
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] দুইটি পরিবেশ ভিন্ন কনফিগারেশনে তৈরি হয়েছে
- [ ] উভয় পরিবেশ সফলভাবে ডিপ্লয় হয়েছে
- [ ] `azd env select` ব্যবহার করে পরিবেশগুলোর মধ্যে সুইচ করা যায়
- [ ] পরিবেশ ভেরিয়েবলগুলো পরিবেশগুলোর মধ্যে ভিন্ন
- [ ] উভয় পরিবেশ সফলভাবে ক্লিনআপ করা হয়েছে

## 📊 আপনার অগ্রগতি

**ব্যয়কৃত সময়**: ~60-90 মিনিট  
**অর্জিত দক্ষতা**:
- ✅ টেমপ্লেট ভিত্তিক প্রকল্প আরম্ভকরণ
- ✅ Azure রিসোর্স প্রোভিশনিং
- ✅ অ্যাপ্লিকেশন ডিপ্লয়মেন্ট ওয়ার্কফ্লো
- ✅ পরিবেশ পরিচালনা
- ✅ কনফিগারেশন ম্যানেজমেন্ট
- ✅ রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনা

**পরবর্তী স্তর**: আপনি [Configuration Guide](configuration.md)-এ যাওয়ার জন্য প্রস্তুত যাতে উচ্চতর কনফিগারেশন প্যাটার্ন শেখা যায়!

## সাধারণ সমস্যা সমাধান

### প্রমাণীকরণ ত্রুটি
```bash
# Azure-এ পুনরায় প্রমাণীকরণ করুন
az login

# সাবস্ক্রিপশনের অ্যাক্সেস যাচাই করুন
az account show
```

### ডিপ্লয়মেন্ট ব্যর্থতা
```bash
# ডিবাগ লগিং সক্রিয় করুন
export AZD_DEBUG=true
azd up --debug

# Azure-এ অ্যাপ্লিকেশন লগ দেখুন
azd monitor --logs

# Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### রিসোর্স নাম দ্বন্দ্ব
```bash
# একটি অনন্য পরিবেশের নাম ব্যবহার করুন
azd env new dev-$(whoami)-$(date +%s)
```

### পোর্ট/নেটওয়ার্ক সমস্যা
```bash
# পোর্টগুলি উপলব্ধ কিনা পরীক্ষা করুন
netstat -an | grep :3000
netstat -an | grep :3100
```

## পরবর্তী ধাপ

আপনি আপনার প্রথম প্রকল্প সম্পন্ন করার পর এখন এই উন্নত বিষয়গুলো অন্বেষণ করুন:

### 1. ইনফ্রাস্ট্রাকচার কাস্টমাইজ করুন
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD সেটআপ করুন
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ CI/CD ওয়ার্কফ্লো
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - পাইলাইন কনফিগারেশন

### 3. প্রোডাকশন বেস্ট প্র্যাকটিস
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - সিকিউরিটি, পারফর্মান্স, এবং মনিটরিং

### 4. আরও টেমপ্লেট অন্বেষণ করুন
```bash
# বিভাগ অনুযায়ী টেমপ্লেট ব্রাউজ করুন
azd template list --filter web
azd template list --filter api
azd template list --filter database

# বিভিন্ন প্রযুক্তি স্ট্যাক ব্যবহার করে দেখুন
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## অতিরিক্ত সম্পদ

### শেখার উপকরণ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### কমিউনিটি ও সমর্থন
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### টেমপ্লেট ও উদাহরণ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**অভিনন্দন আপনার প্রথম azd প্রকল্প সম্পন্ন করার জন্য!** আপনি এখন আত্মবিশ্বাসের সাথে Azure-এ চমৎকার অ্যাপ্লিকেশন তৈরি ও ডিপ্লয় করার জন্য প্রস্তুত।

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: Chapter 1 - Foundation & Quick Start
- **⬅️ পূর্বের**: [Installation & Setup](installation.md)
- **➡️ পরের**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
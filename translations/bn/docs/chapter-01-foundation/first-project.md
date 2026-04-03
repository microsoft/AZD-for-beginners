# আপনার প্রথম প্রকল্প - হাতেকলমে টিউটোরিয়াল

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ১ - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ পরবর্তী**: [কনফিগারেশন](configuration.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ২: AI-ফার্স্ট ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

আপনার প্রথম Azure Developer CLI প্রকল্পে স্বাগতম! এটি একটি ব্যাপক হাতেকলমে টিউটোরিয়াল যা azd ব্যবহার করে Azure-এ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনার সম্পূর্ণ প্রক্রিয়া শেখায়। আপনি একটি বাস্তব টুডো অ্যাপ্লিকেশন নিয়ে কাজ করবেন যার মধ্যে একটি React ফ্রন্টএন্ড, Node.js API ব্যাকএন্ড, এবং MongoDB ডাটাবেস অন্তর্ভুক্ত আছে।

## শিখন লক্ষ্য

এই টিউটোরিয়াল সম্পন্ন করে আপনি:
- টেমপ্লেট ব্যবহার করে azd প্রকল্প সূচনা কর্মপ্রবাহে পারদর্শী হবেন
- Azure Developer CLI প্রকল্পের কাঠামো এবং কনফিগারেশন ফাইল বুঝতে পারবেন
- অবকাঠামো পাশাপাশি সম্পূর্ণ অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করতে সক্ষম হবেন
- অ্যাপ্লিকেশন আপডেট এবং পুনঃডিপ্লয়মেন্ট কৌশল বাস্তবায়ন করবেন
- ডেভেলপমেন্ট এবং স্টেজিংয়ের জন্য একাধিক পরিবেশ পরিচালনা করবেন
- রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনা অনুশীলন করবেন

## শেখার ফলাফল

সম্পন্ন করার পর আপনি সক্ষম হবেন:
- স্বাধীনভাবে টেমপ্লেট থেকে azd প্রকল্প ইনিশিয়ালাইজ এবং কনফিগার করতে
- কার্যকরভাবে azd প্রকল্প কাঠামো নেভিগেট এবং পরিবর্তন করতে
- একক কমান্ডে Azure-এ ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করতে
- সাধারণ ডিপ্লয়মেন্ট ত্রুটি এবং প্রমাণীকরণ সমস্যা সমাধান করতে
- বিভিন্ন ডিপ্লয়মেন্ট পর্যায়ের জন্য একাধিক Azure পরিবেশ পরিচালনা করতে
- অ্যাপ্লিকেশন আপডেটের জন্য অব্যাহত ডিপ্লয়মেন্ট কর্মপ্রবাহ বাস্তবায়ন করতে

## শুরু করা যাক

### পূর্বশর্ত চেকলিস্ট
- ✅ Azure Developer CLI ইনস্টল করা আছে ([ইনস্টলেশন গাইড](installation.md))
- ✅ `azd auth login` দিয়ে AZD প্রমাণীকরণ সম্পন্ন
- ✅ আপনার সিস্টেমে Git ইনস্টল করা আছে
- ✅ Node.js ১৬+ (এই টিউটোরিয়ালের জন্য)
- ✅ Visual Studio Code (সুপারিশকৃত)

আগে চালিয়ে যাওয়ার আগে, রিপোজিটরি রুট থেকে সেটআপ ভ্যালিডেটর চালান:

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

## ধাপ ১: একটি টেমপ্লেট বাছাই ও ইনিশিয়ালাইজ করুন

চলুন জনপ্রিয় একটি টুডো অ্যাপ্লিকেশন টেমপ্লেট দিয়ে শুরু করি, যা একটি React ফ্রন্টএন্ড এবং Node.js API ব্যাকএন্ড অন্তর্ভুক্ত।

```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টুডো অ্যাপ টেমপ্লেট ইনিশিয়ালাইজ করুন
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# নির্দেশনাগুলি অনুসরণ করুন:
# - একটি এনভায়রনমেন্ট নাম লিখুন: "dev"
# - একটি সাবস্ক্রিপশন চয়ন করুন (যদি আপনার একাধিক থাকে)
# - একটি অঞ্চল চয়ন করুন: "East US 2" (অথবা আপনার পছন্দের অঞ্চল)
```

### কি ঘটল?
- টেমপ্লেট কোড আপনার লোকাল ডিরেক্টরিতে ডাউনলোড হয়েছে
- সার্ভিস ডিফিনিশনসহ `azure.yaml` ফাইল তৈরি হয়েছে
- `infra/` ডিরেক্টরিতে অবকাঠামো কোড সেট আপ হয়েছে
- একটি পরিবেশ কনফিগারেশন তৈরি হয়েছে

## ধাপ ২: প্রকল্পের কাঠামো অন্বেষণ করুন

চলুন দেখি azd আমাদের জন্য কী তৈরি করেছে:

```bash
# প্রকল্পের কাঠামো দেখুন
tree /f   # উইন্ডোজ
# অথবা
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

### বোঝার জন্য গুরুত্বপূর্ণ ফাইলসমূহ

**azure.yaml** - আপনার azd প্রকল্পের হৃদয়:
```bash
# প্রকল্প কনফিগারেশন দেখুন
cat azure.yaml
```

**infra/main.bicep** - অবকাঠামো সংজ্ঞা:
```bash
# অবকাঠামো কোড দেখুন
head -30 infra/main.bicep
```

## ধাপ ৩: আপনার প্রকল্প কাস্টমাইজ করুন (ঐচ্ছিক)

ডিপ্লয় করার আগে, আপনি অ্যাপ্লিকেশন কাস্টমাইজ করতে পারেন:

### ফ্রন্টএন্ড পরিবর্তন করুন
```bash
# React অ্যাপ কম্পোনেন্টটি খুলুন
code src/web/src/App.tsx
```

সহজ একটি পরিবর্তন করুন:
```typescript
// শিরোনামটি খুঁজুন এবং এটি পরিবর্তন করুন
<h1>My Awesome Todo App</h1>
```

### পরিবেশ ভ্যারিয়েবল কনফিগার করুন
```bash
# কাস্টম পরিবেশ ভেরিয়েবল সেট করুন
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# সমস্ত পরিবেশ ভেরিয়েবল দেখুন
azd env get-values
```

## ধাপ ৪: Azure-এ ডিপ্লয় করুন

এখন উত্তেজনাপূর্ণ অংশে আসুন - সবকিছু Azure-এ ডিপ্লয় করুন!

```bash
# অবকাঠামো এবং অ্যাপ্লিকেশন মোতায়েন করুন
azd up

# এই কমান্ডটি করবে:
# 1. আজুর রিসোর্স (অ্যাপ সার্ভিস, কসমস ডিবি, ইত্যাদি) প্রদান করবে
# 2. আপনার অ্যাপ্লিকেশন নির্মাণ করবে
# 3. প্রোভিশন করা রিসোর্সে মোতায়েন করবে
# 4. অ্যাপ্লিকেশনের URL প্রদর্শন করবে
```

### ডিপ্লয়মেন্ট চলাকালীন কি ঘটছে?

`azd up` কমান্ড এই ধাপগুলো সম্পাদন করে:
1. **Provision** (`azd provision`) - Azure রিসোর্স তৈরি করে
2. **Package** - আপনার অ্যাপ্লিকেশন কোড বিল্ড করে
3. **Deploy** (`azd deploy`) - কোড Azure রিসোর্সে ডিপ্লয় করে

### প্রত্যাশিত আউটপুট
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ধাপ ৫: আপনার অ্যাপ্লিকেশন পরীক্ষা করুন

### আপনার অ্যাপ্লিকেশনে প্রবেশ করুন
ডিপ্লয়মেন্ট আউটপুটে প্রদত্ত URL-এ ক্লিক করুন, অথবা যেকোন সময় এটি পান:
```bash
# অ্যাপ্লিকেশন এন্ডপয়েন্টগুলি পান
azd show

# আপনার ব্রাউজারে অ্যাপ্লিকেশনটি খুলুন
azd show --output json | jq -r '.services.web.endpoint'
```

### টুডো অ্যাপ্লিকেশন পরীক্ষা করুন
1. **একটি টুডো আইটেম যোগ করুন** - "Add Todo" ক্লিক করে একটি কাজ প্রবেশ করুন
2. **সম্পূর্ণ হিসাবে চিহ্নিত করুন** - শেষ হওয়া আইটেমগুলো চেক করুন
3. **আইটেম মুছুন** - আর দরকার নেই এমন টুডো মুছে ফেলুন

### আপনার অ্যাপ্লিকেশন মনিটর করুন
```bash
# আপনার সম্পদগুলির জন্য Azure পোর্টাল খুলুন
azd monitor

# অ্যাপ্লিকেশন লগগুলি দেখুন
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

## ধাপ ৬: পরিবর্তন করুন এবং পুনঃডিপ্লয় করুন

চলুন একটি পরিবর্তন করি এবং দেখি আপডেট কত সহজ:

### API সংশোধন করুন
```bash
# এপিআই কোড সম্পাদনা করুন
code src/api/src/routes/lists.js
```

একটি কাস্টম রেসপন্স হেডার যোগ করুন:
```javascript
// একটি রুট হ্যান্ডলার খুঁজুন এবং যোগ করুন:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### শুধুমাত্র কোড পরিবর্তনগুলি ডিপ্লয় করুন
```bash
# কেবলমাত্র অ্যাপ্লিকেশন কোড মোতায়েন করুন (অবকাঠামো বাদ দিন)
azd deploy

# এটি 'azd up' থেকে অনেক দ্রুত কারণ অবকাঠামো ইতিমধ্যেই বিদ্যমান রয়েছে
```

## ধাপ ৭: একাধিক পরিবেশ পরিচালনা করুন

প্রোডাকশন পূর্বে পরিবর্তন পরীক্ষা করার জন্য একটি স্টেজিং পরিবেশ তৈরি করুন:

```bash
# একটি নতুন স্টেজিং পরিবেশ তৈরি করুন
azd env new staging

# স্টেজিং এ ডিপ্লয় করুন
azd up

# ডিভ পরিবেশে ফিরে যান
azd env select dev

# সমস্ত পরিবেশের তালিকা দেখান
azd env list
```

### পরিবেশ তুলনা করুন
```bash
# ডেভেলপমেন্ট পরিবেশ দেখুন
azd env select dev
azd show

# স্টেজিং পরিবেশ দেখুন
azd env select staging
azd show
```

## ধাপ ৮: রিসোর্স পরিষ্কার করুন

আপনি যখন পরীক্ষার কাজ শেষ করবেন, অবাঞ্ছিত চার্জ এড়াতে পরিষ্কার করুন:

```bash
# বর্তমান পরিবেশের জন্য সমস্ত Azure রিসোর্স মুছে ফেলুন
azd down

# নিশ্চিতকরণের ব্যতীত জোরপূর্বক মুছে ফেলুন এবং সফট-ডিলিট করা রিসোর্সগুলি পরিস্কার করুন
azd down --force --purge

# নির্দিষ্ট পরিবেশ মুছে ফেলুন
azd env select staging
azd down --force --purge
```

## ক্লাসিক অ্যাপ বনাম AI-সক্ষম অ্যাপ: একই কর্মপ্রবাহ

আপনি সম্প্রতি একটি ঐতিহ্যবাহী ওয়েব অ্যাপ্লিকেশন ডিপ্লয় করেছেন। কিন্তু যদি আপনি একটি AI চালিত অ্যাপ্লিকেশন, যেমন Microsoft Foundry মডেল সমর্থিত চ্যাট অ্যাপ ডিপ্লয় করতে চান?

ভাল খবর: **কর্মপ্রবাহ একই।**

| ধাপ | ক্লাসিক টুডো অ্যাপ | AI চ্যাট অ্যাপ |
|------|-----------------|-------------|
| ইনিশিয়ালাইজ | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| প্রমাণীকরণ | `azd auth login` | `azd auth login` |
| ডিপ্লয় | `azd up` | `azd up` |
| মনিটর | `azd monitor` | `azd monitor` |
| পরিষ্কার | `azd down --force --purge` | `azd down --force --purge` |

এখানে একমাত্র পার্থক্য হল আপনি কোন **টেমপ্লেট** থেকে শুরু করছেন। একটি AI টেমপ্লেটে অতিরিক্ত অবকাঠামো (যেমন Microsoft Foundry মডেল রিসোর্স অথবা AI সার্চ ইনডেক্স) থাকে, কিন্তু azd সব কিছু আপনার জন্য পরিচালনা করে। আপনাকে নতুন কমান্ড শেখার দরকার নেই, ভিন্ন টুল গ্রহণ করতে হবে না, বা ডিপ্লয়মেন্টের উপরে আপনার ভাবনা পরিবর্তন করতে হবে না।

azd এর মূল নীতি হল: **একটি কর্মপ্রবাহ, যেকোনও কাজ।** এই টিউটোরিয়ালে আপনি যে দক্ষতাগুলো অনুশীলন করেছেন—ইনিশিয়ালাইজ, ডিপ্লয়, মনিটর, পুনঃডিপ্লয়, এবং পরিষ্কার—সেগুলো AI অ্যাপ্লিকেশন ও এজেন্টের জন্যও সমানভাবে প্রযোজ্য।

---

## আপনি কী শিখেছেন

অভিনন্দন! আপনি সফলভাবে:
- ✅ একটি টেমপ্লেট থেকে azd প্রকল্প ইনিশিয়ালাইজ করেছেন
- ✅ প্রকল্প কাঠামো এবং গুরুত্বপূর্ণ ফাইল ব্রাউজ করেছেন
- ✅ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করেছেন
- ✅ কোড পরিবর্তন করেছেন এবং পুনঃডিপ্লয় করেছেন
- ✅ একাধিক পরিবেশ পরিচালনা করেছেন
- ✅ রিসোর্স ক্লিনআপ করেছেন

## 🎯 দক্ষতা যাচাই অনুশীলনসমূহ

### অনুশীলন ১: অন্য টেমপ্লেট ডিপ্লয় করুন (১৫ মিনিট)
**লক্ষ্য**: azd init এবং ডিপ্লয়মেন্ট কর্মপ্রবাহে দক্ষতা প্রদর্শন

```bash
# চেষ্টা করুন Python + MongoDB স্ট্যাক
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ডিপ্লয়মেন্ট যাচাই করুন
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# পরিষ্কার করুন
azd down --force --purge
```

**সাফল্যের মানদণ্ড:**
- [ ] অ্যাপ্লিকেশন কোনো ত্রুটিবিহীন ডিপ্লয় হয়েছে
- [ ] ব্রাউজারে অ্যাপ্লিকেশনের URL-এ প্রবেশ করতে পারা যাচ্ছে
- [ ] অ্যাপ্লিকেশন সঠিকভাবে কাজ করছে (টুডো যোগ/মুছে)
- [ ] সমস্ত রিসোর্স সফলভাবে পরিষ্কার হয়েছে

### অনুশীলন ২: কনফিগারেশন কাস্টমাইজ করুন (২০ মিনিট)
**লক্ষ্য**: পরিবেশ ভ্যারিয়েবল কনফিগারেশন অনুশীলন

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

# কাস্টম কনফিগ সহ ডিপ্লয় করুন
azd up
```

**সাফল্যের মানদণ্ড:**
- [ ] কাস্টম পরিবেশ সফলভাবে তৈরি হয়েছে
- [ ] পরিবেশ ভ্যারিয়েবল সেট এবং ফেরত পাওয়া যাচ্ছে
- [ ] কাস্টম কনফিগারেশন সহ অ্যাপ্লিকেশন ডিপ্লয় হয়েছে
- [ ] ডিপ্লয় করা অ্যাপে কাস্টম সেটিং যাচাই করতে পারা যাচ্ছে

### অনুশীলন ৩: বহু-পরিবেশ কর্মপ্রবাহ (২৫ মিনিট)
**লক্ষ্য**: পরিবেশ ব্যবস্থাপনা এবং ডিপ্লয়মেন্ট কৌশলে পারদর্শী হওয়া

```bash
# ডেভ পরিবেশ তৈরি করুন
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ডেভ URL নোট করুন
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# স্টেজিং পরিবেশ তৈরি করুন
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# স্টেজিং URL নোট করুন
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# পরিবেশগুলি তুলনা করুন
azd env list

# উভয় পরিবেশ পরীক্ষা করুন
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# উভয় পরিষ্কার করুন
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**সাফল্যের মানদণ্ড:**
- [ ] দুইটি পরিবেশ বিভিন্ন কনফিগারেশনের সাথে তৈরি হয়েছে
- [ ] উভয় পরিবেশ সফলভাবে ডিপ্লয় হয়েছে
- [ ] `azd env select` ব্যবহার করে পরিবেশ পরিবর্তন করা যায়
- [ ] পরিবেশ ভ্যারিয়েবল পরিবেশ অনুযায়ী পার্থক্য করে
- [ ] উভয় পরিবেশ সফলভাবে পরিষ্কার হয়েছে

## 📊 আপনার অগ্রগতি

**মোট সময় বিনিয়োগ**: ~৬০-৯০ মিনিট  
**অর্জিত দক্ষতা**:
- ✅ টেমপ্লেটভিত্তিক প্রকল্প ইনিশিয়ালাইজেশন
- ✅ Azure রিসোর্স প্রোভিশনিং
- ✅ অ্যাপ্লিকেশন ডিপ্লয়মেন্ট কর্মপ্রবাহ
- ✅ পরিবেশ ব্যবস্থাপনা
- ✅ কনফিগারেশন ম্যানেজমেন্ট
- ✅ রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনা

**পরবর্তী স্তর**: উন্নত কনফিগারেশন প্যাটার্ন শেখার জন্য [কনফিগারেশন গাইড](configuration.md) প্রস্তুত!

## সাধারণ সমস্যা সমাধান

### প্রমাণীকরণ ত্রুটি
```bash
# Azure এর সাথে পুনরায় প্রমাণীকরণ করুন
az login

# সাবস্ক্রিপশন অ্যাক্সেস যাচাই করুন
az account show
```

### ডিপ্লয়মেন্ট ব্যর্থতা
```bash
# ডিবাগ লগিং সক্রিয় করুন
export AZD_DEBUG=true
azd up --debug

# Azure-এ অ্যাপ্লিকেশন লগ দেখুন
azd monitor --logs

# কন্টেইনার অ্যাপ্সের জন্য, Azure CLI ব্যবহার করুন:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### রিসোর্স নামের সংঘাত
```bash
# একটি অনন্য পরিবেশের নাম ব্যবহার করুন
azd env new dev-$(whoami)-$(date +%s)
```

### পোর্ট/নেটওয়ার্ক সমস্যা
```bash
# পরীক্ষা করুন পোর্টগুলি উপলব্ধ কিনা
netstat -an | grep :3000
netstat -an | grep :3100
```

## পরবর্তী ধাপ

এখন আপনি আপনার প্রথম প্রকল্প সম্পন্ন করেছেন, এই উন্নত বিষয়গুলি অন্বেষণ করুন:

### ১. অবকাঠামো কাস্টমাইজ করুন
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ডাটাবেস, স্টোরেজ এবং অন্যান্য সার্ভিস যোগ করা](../chapter-04-infrastructure/provisioning.md#adding-services)

### ২. CI/CD সেটআপ করুন
- [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ CI/CD কর্মপ্রবাহ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - পাইপলাইন কনফিগারেশন

### ৩. প্রোডাকশন সেরা অনুশীলনসমূহ
- [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md) - নিরাপত্তা, কর্মদক্ষতা, এবং মনিটরিং

### ৪. আরো টেমপ্লেট অন্বেষণ করুন
```bash
# শ্রেণী অনুসারে টেমপ্লেট ব্রাউজ করুন
azd template list --filter web
azd template list --filter api
azd template list --filter database

# বিভিন্ন প্রযুক্তি স্ট্যাক চেষ্টা করুন
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## অতিরিক্ত সম্পদ

### শেখার উপকরণ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure আর্কিটেকচার সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ওয়েল-আর্কিটেকটেড ফ্রেমওয়ার্ক](https://learn.microsoft.com/en-us/azure/well-architected/)

### সম্প্রদায় ও সহায়তা
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### টেমপ্লেট এবং উদাহরণ
- [অফিশিয়াল টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [কমিউনিটি টেমপ্লেটস](https://github.com/Azure-Samples/azd-templates)
- [এন্টারপ্রাইজ প্যাটার্নস](https://github.com/Azure/azure-dev/tree/main/templates)

---

**আপনার প্রথম azd প্রকল্প সম্পন্ন করার জন্য অভিনন্দন!** এখন আপনি আত্মবিশ্বাসের সাথে Azure-এ চমৎকার অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করতে প্রস্তুত।

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ১ - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ পরবর্তী**: [কনফিগারেশন](configuration.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ২: AI-ফার্স্ট ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **পরবর্তী পাঠ**: [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**স্পষ্টিকরণ**:  
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতার চেষ্টা করি, স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। আসল নথি তার নিজ ভাষায়ই প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদের ব্যবহারে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়িত্ববোধ করি না।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
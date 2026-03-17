# আপনার প্রথম প্রজেক্ট - হাতে কলমে টিউটোরিয়াল

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবাগতদের জন্য](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্বের**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ পরবর্তী**: [কনফিগারেশন](configuration.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার 2: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

আপনার প্রথম Azure Developer CLI প্রজেক্টে স্বাগতম! এই ব্যাপক হাতে-কলমে টিউটোরিয়ালটি azd ব্যবহার করে Azure-এ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনার সম্পূর্ণ ওয়াকথ্রু প্রদান করে। আপনি একটি বাস্তব todo অ্যাপ্লিকেশন নিয়ে কাজ করবেন যাতে একটি React ফ্রন্টএন্ড, Node.js API ব্যাকএন্ড, এবং MongoDB ডাটাবেস অন্তর্ভুক্ত রয়েছে।

## শেখার লক্ষ্যসমূহ

এই টিউটোরিয়াল সম্পন্ন করে আপনি:
- টেমপ্লেট ব্যবহার করে azd প্রজেক্ট ইনিশিয়ালাইজেশন ওয়ার্কফ্লো আয়ত্ত করবেন
- Azure Developer CLI প্রজেক্ট স্ট্রাকচার এবং কনফিগারেশন ফাইলগুলো বুঝবেন
- ইনফ্রাস্ট্রাকচার প্রোভিশনিং সহ Azure-এ পূর্ণ অ্যাপ্লিকেশন ডিপ্লয় সম্পাদন করবেন
- অ্যাপ্লিকেশন আপডেট এবং পুনঃডিপ্লয়ের কৌশল বাস্তবায়ন করবেন
- ডেভেলপমেন্ট ও স্টেজিং-এর জন্য একাধিক এনভায়রনমেন্ট ম্যানেজ করবেন
- রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনার অনুশীলন প্রয়োগ করবেন

## শেখার ফলাফল

সমাপ্তির পর, আপনি সক্ষম হবেন:
- স্বতন্ত্রভাবে টেমপ্লেট থেকে azd প্রজেক্ট ইনিশিয়ালাইজ ও কনফিগার করবেন
- কার্যকরভাবে azd প্রজেক্ট স্ট্রাকচার নেভিগেট ও পরিবর্তন করবেন
- একক কমান্ড দিয়ে Azure-এ ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করবেন
- সাধারণ ডিপ্লয়মেন্ট ইস্যু এবং অথেনটিকেশন সমস্যাগুলি ট্রাবলশুট করবেন
- বিভিন্ন ডিপ্লয়মেন্ট স্টেজের জন্য একাধিক Azure এনভায়রনমেন্ট ম্যানেজ করবেন
- অ্যাপ্লিকেশন আপডেটের জন্য কন্টিনিউয়াস ডিপ্লয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন করবেন

## শুরু করা যাক

### প্রয়োজনীয়তার চেকলিস্ট
- ✅ Azure Developer CLI ইনস্টল করা আছে ([Installation Guide](installation.md))
- ✅ Azure CLI ইনস্টল এবং অথেন্টিকেট করা আছে
- ✅ আপনার সিস্টেমে Git ইনস্টল করা আছে
- ✅ Node.js 16+ (এই টিউটোরিয়ালের জন্য)
- ✅ Visual Studio Code (পারামর্শকৃত)

### আপনার সেটআপ যাচাই করুন
```bash
# azd ইনস্টলেশন পরীক্ষা করুন
azd version
```
### Azure অথেন্টিকেশন যাচাই করুন

```bash
az account show
```

### Node.js সংস্করণ পরীক্ষা করুন
```bash
node --version
```

## ধাপ 1: একটি টেমপ্লেট নির্বাচন এবং ইনিশিয়ালাইজ করুন

চলুন একটি জনপ্রিয় todo অ্যাপ্লিকেশন টেমপ্লেট দিয়ে শুরু করা যাক যাতে একটি React ফ্রন্টএন্ড এবং Node.js API ব্যাকএন্ড রয়েছে।

```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টুডো অ্যাপ টেমপ্লেট ইনিশিয়ালাইজ করুন
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# প্রম্পটগুলো অনুসরণ করুন:
# - একটি পরিবেশের নাম লিখুন: "dev"
# - একটি সাবস্ক্রিপশন নির্বাচন করুন (যদি আপনার একাধিক থাকে)
# - একটি অঞ্চল নির্বাচন করুন: "East US 2" (অথবা আপনার পছন্দের অঞ্চল)
```

### কী ঘটলো এখন?
- টেমপ্লেট কোড আপনার লোকাল ডিরেক্টরিতে ডাউনলোড করা হয়েছে
- সার্ভিস ডেফিনিশন সহ একটি `azure.yaml` ফাইল তৈরি করা হয়েছে
- `infra/` ডিরেক্টরিতে ইনফ্রাস্ট্রাকচার কোড সেটআপ করা হয়েছে
- একটি এনভায়রনমেন্ট কনফিগারেশন তৈরি করা হয়েছে

## ধাপ 2: প্রজেক্ট স্ট্রাকচার অন্বেষণ করুন

চলুন দেখে নিই azd আমাদের জন্য কী তৈরি করেছে:

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

### বুঝতে গুরুত্বপূর্ণ ফাইলসমূহ

**azure.yaml** - আপনার azd প্রজেক্টের মূল:
```bash
# প্রকল্পের কনফিগারেশন দেখুন
cat azure.yaml
```

**infra/main.bicep** - ইনফ্রাস্ট্রাকচার ডেফিনিশন:
```bash
# ইনফ্রাস্ট্রাকচারের কোড দেখুন
head -30 infra/main.bicep
```

## ধাপ 3: আপনার প্রজেক্ট কাস্টমাইজ করুন (ঐচ্ছিক)

ডিপ্লয় করার আগে, আপনি অ্যাপ্লিকেশন কাস্টমাইজ করতে পারেন:

### ফ্রন্টএন্ড পরিবর্তন করুন
```bash
# React অ্যাপ কম্পোনেন্ট খুলুন
code src/web/src/App.tsx
```

একটি সহজ পরিবর্তন করুন:
```typescript
// শিরোনামটি খুঁজে বের করুন এবং তা পরিবর্তন করুন
<h1>My Awesome Todo App</h1>
```

### এনভায়রনমেন্ট ভেরিয়েবল কনফিগার করুন
```bash
# কাস্টম পরিবেশ ভেরিয়েবল সেট করুন
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# সমস্ত পরিবেশ ভেরিয়েবল দেখুন
azd env get-values
```

## ধাপ 4: Azure-এ ডিপ্লয় করুন

এখন উত্তেজনাপূর্ণ অংশ — সবকিছু Azure-এ ডিপ্লয় করুন!

```bash
# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন ডিপ্লয় করুন
azd up

# এই কমান্ডটি নিম্নলিখিত কাজগুলো করবে:
# 1. Azure রিসোর্স (App Service, Cosmos DB ইত্যাদি) প্রস্তুত করবে
# 2. আপনার অ্যাপ্লিকেশন নির্মাণ করবে
# 3. প্রস্তুতকৃত রিসোর্সে অ্যাপ্লিকেশন স্থাপন করবে
# 4. অ্যাপ্লিকেশনের URL প্রদর্শন করবে
```

### ডিপ্লয়ের সময় কী হচ্ছে?

`azd up` কমান্ড এই ধাপগুলো সম্পাদন করে:
1. **Provision** (`azd provision`) - Azure রিসোর্সগুলো তৈরি করে
2. **Package** - আপনার অ্যাপ্লিকেশন কোড বিল্ড করে
3. **Deploy** (`azd deploy`) - কোডটিকে Azure রিসোর্সে ডিপ্লয় করে

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

### আপনার অ্যাপ্লিকেশনে প্রবেশ করুন
ডিপ্লয়ের আউটপুটে প্রদানকৃত URL-এ ক্লিক করুন, অথবা যেকোনো সময় এটি পান:
```bash
# অ্যাপ্লিকেশনের এন্ডপয়েন্টগুলো পান
azd show

# আপনার ব্রাউজারে অ্যাপ্লিকেশনটি খুলুন
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo অ্যাপ পরীক্ষা করুন
1. **একটি todo আইটেম যোগ করুন** - "Add Todo" ক্লিক করে একটি টাস্ক লিখুন
2. **সম্পূর্ণ হিসেবে চিহ্নিত করুন** - সম্পন্ন আইটেমগুলো চেক করুন
3. **আইটেম মুছুন** - আর প্রয়োজন নেই এমন todos মুছে ফেলুন

### আপনার অ্যাপ মনিটর করুন
```bash
# আপনার রিসোর্সগুলির জন্য Azure পোর্টাল খুলুন
azd monitor

# অ্যাপ্লিকেশনের লগ দেখুন
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

## ধাপ 6: পরিবর্তন করুন এবং পুনঃডিপ্লয় করুন

চলুন কিছু পরিবর্তন করি এবং দেখি আপডেট করা কত সহজ:

### API পরিবর্তন করুন
```bash
# API কোড সম্পাদনা করুন
code src/api/src/routes/lists.js
```

একটি কাস্টম রেসপন্স হেডার যোগ করুন:
```javascript
// একটি রুট হ্যান্ডলার খুঁজে বের করুন এবং যোগ করুন:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### কেবল কোড পরিবর্তনগুলো ডিপ্লয় করুন
```bash
# শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয় করুন (ইনফ্রাস্ট্রাকচার বাদ দিন)
azd deploy

# ইনফ্রাস্ট্রাকচার ইতিমধ্যেই বিদ্যমান থাকায় এটি 'azd up'-এর তুলনায় অনেক দ্রুত
```

## ধাপ 7: একাধিক এনভায়রনমেন্ট ম্যানেজ করুন

প্রোডাকশনের আগে পরিবর্তন পরীক্ষা করার জন্য একটি স্টেজিং এনভায়রনমেন্ট তৈরি করুন:

```bash
# একটি নতুন স্টেজিং পরিবেশ তৈরি করুন
azd env new staging

# স্টেজিং-এ ডিপ্লয় করুন
azd up

# dev পরিবেশে ফিরে যান
azd env select dev

# সমস্ত পরিবেশ তালিকাভুক্ত করুন
azd env list
```

### এনভায়রনমেন্ট তুলনা
```bash
# ডেভেলপমেন্ট পরিবেশ দেখুন
azd env select dev
azd show

# স্টেজিং পরিবেশ দেখুন
azd env select staging
azd show
```

## ধাপ 8: রিসোর্স ক্লিন আপ করুন

যখন আপনি পরীক্ষা শেষ করেছেন, চলতি খরচ এড়াতে ক্লিনআপ করুন:

```bash
# বর্তমান পরিবেশের সকল Azure রিসোর্স মুছে ফেলুন
azd down

# নিশ্চিতকরণ ছাড়াই জোরপূর্বক মুছে ফেলুন এবং সফট-ডিলিট করা রিসোর্সগুলো স্থায়ীভাবে মুছে ফেলুন
azd down --force --purge

# নির্দিষ্ট পরিবেশ মুছে ফেলুন
azd env select staging
azd down --force --purge
```

## ক্লাসিক অ্যাপ বনাম AI-চালিত অ্যাপ: একই ওয়ার্কফ্লো

আপনি মাত্র একটি প্রথাগত ওয়েব অ্যাপ ডিপ্লয় করেছেন। কিন্তু যদি আপনি একটি AI-চালিত অ্যাপ ডিপ্লয় করতে চান—উদাহরণস্বরূপ Microsoft Foundry Models দ্বারা ব্যাকড করা একটি চ্যাট অ্যাপ—তাহলে কী হবে?

ভাল খবর: **ওয়ার্কফ্লো একইই।**

| Step | ক্লাসিক টুডো অ্যাপ | AI চ্যাট অ্যাপ |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

একমাত্র পার্থক্য হল আপনি কোন **টেমপ্লেট** থেকে শুরু করছেন। একটি AI টেমপ্লেটে অতিরিক্ত ইনফ্রাস্ট্রাকচার থাকে (যেমন একটি Microsoft Foundry Models রিসোর্স বা একটি AI Search ইন্ডেক্স), কিন্তু azd আপনাকে তার সবকিছু পরিচালনা করে দেয়। আপনাকে নতুন কমান্ড শিখতে হবে না, ভিন্ন টুল গ্রহণ করতে হবে না, বা ডিপ্লয়ের সম্পর্কে ভেবে পরিবর্তন করতে হবে না।

এটাই azd-এর মূল নীতি: **একটি ওয়ার্কফ্লো, যে কোনো ওয়ার্কলোড।** এই টিউটোরিয়ালে আপনি যে দক্ষতাগুলো অনুশীলন করেছেন—ইনিশিয়ালাইজ করা, ডিপ্লয় করা, মনিটর করা, পুনঃডিপ্লয় করা, এবং ক্লিনআপ করা—সেগুলো AI অ্যাপ্লিকেশন এবং এজেন্টগুলোর ক্ষেত্রেও সমানভাবে প্রযোজ্য।

---

## আপনি কী শিখেছেন

অভিনন্দন! আপনি সফলভাবে:
- ✅ একটি টেমপ্লেট থেকে azd প্রজেক্ট ইনিশিয়ালাইজ করেছেন
- ✅ প্রজেক্ট স্ট্রাকচার এবং গুরুত্বপূর্ণ ফাইলসমূহ অন্বেষণ করেছেন
- ✅ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করেছেন
- ✅ কোড পরিবর্তন করেছেন এবং পুনঃডিপ্লয় করেছেন
- ✅ একাধিক এনভায়রনমেন্ট ম্যানেজ করেছেন
- ✅ রিসোর্স ক্লিনআপ করেছেন

## 🎯 দক্ষতা যাচাই অনুশীলনসমূহ

### অনুশীলন 1: ভিন্ন টেমপ্লেট ডিপ্লয় করুন (১৫ মিনিট)
**লক্ষ্য**: azd init এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লোতে দক্ষতা প্রদর্শন করা

```bash
# Python + MongoDB স্ট্যাক চেষ্টা করুন
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ডিপ্লয়মেন্ট যাচাই করুন
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] অ্যাপ্লিকেশন ত্রুটিহীনভাবে ডিপ্লয় হচ্ছে
- [ ] ব্রাউজারে অ্যাপ্লিকেশন URL অ্যাক্সেস করা যায়
- [ ] অ্যাপ্লিকেশন সঠিকভাবে কাজ করে (যোগ/অপসারণ todo)
- [ ] সফলভাবে সব রিসোর্স ক্লিন করা হয়েছে

### অনুশীলন 2: কনফিগারেশন কাস্টমাইজ করুন (২০ মিনিট)
**লক্ষ্য**: এনভায়রনমেন্ট ভেরিয়েবল কনফিগারেশনের অনুশীলন

```bash
cd my-first-azd-app

# কাস্টম পরিবেশ তৈরি করুন
azd env new custom-config

# কাস্টম ভ্যারিয়েবল সেট করুন
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ভ্যারিয়েবল যাচাই করুন
azd env get-values | grep APP_TITLE

# কাস্টম কনফিগারেশনের সাথে ডিপ্লয় করুন
azd up
```

**সফলতার মানদণ্ড:**
- [ ] কাস্টম এনভায়রনমেন্ট সফলভাবে তৈরি হয়েছে
- [ ] এনভায়রনমেন্ট ভেরিয়েবল সেট এবং রিট্রিভ করা যাচ্ছে
- [ ] কাস্টম কনফিগারেশন সহ অ্যাপ্লিকেশন ডিপ্লয় হয়েছে
- [ ] ডিপ্লয় করা অ্যাপে কাস্টম সেটিংস যাচাই করা যায়

### অনুশীলন 3: বহু-এনভায়রনমেন্ট ওয়ার্কফ্লো (২৫ মিনিট)
**লক্ষ্য**: এনভায়রনমেন্ট ম্যানেজমেন্ট এবং ডিপ্লয়মেন্ট কৌশলে দক্ষতা অর্জন করা

```bash
# ডেভেলপমেন্ট পরিবেশ তৈরি করুন
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ডেভেলপমেন্ট URL নোট করুন
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
- [ ] বিভিন্ন কনফিগারেশনসহ দুটি এনভায়রনমেন্ট তৈরি করা হয়েছে
- [ ] উভয় এনভায়রনমেন্ট সফলভাবে ডিপ্লয় হয়েছে
- [ ] `azd env select` ব্যবহার করে এনভায়রনমেন্টগুলো মধ্যে স্যুইচ করা যায়
- [ ] এনভায়রনমেন্ট ভেরিয়েবলগুলো এনভায়রনমেন্টগুলোর মধ্যে আলাদা
- [ ] উভয় এনভায়রনমেন্ট সফলভাবে ক্লিনআপ করা হয়েছে

## 📊 আপনার অগ্রগতি

**খরচ করা সময়**: ~60-90 মিনিট  
**অর্জিত দক্ষতা**:
- ✅ টেমপ্লেট-ভিত্তিক প্রজেক্ট ইনিশিয়ালাইজেশন
- ✅ Azure রিসোর্স প্রোভিশনিং
- ✅ অ্যাপ্লিকেশন ডিপ্লয়মেন্ট ওয়ার্কফ্লো
- ✅ এনভায়রনমেন্ট ম্যানেজমেন্ট
- ✅ কনফিগারেশন ম্যানেজমেন্ট
- ✅ রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনা

**পরবর্তী ধাপ**: আপনি [কনফিগারেশন গাইড](configuration.md) দেখার জন্য প্রস্তুত যাতে উন্নত কনফিগারেশন প্যাটার্ন শিখতে পারেন!

## সাধারণ সমস্যা সমাধান

### অথেন্টিকেশন ত্রুটি
```bash
# Azure-এ পুনরায় প্রমাণীকরণ করুন
az login

# সাবস্ক্রিপশন অ্যাক্সেস যাচাই করুন
az account show
```

### ডিপ্লয়মেন্ট ব্যর্থতা
```bash
# ডিবাগ লগিং সক্ষম করুন
export AZD_DEBUG=true
azd up --debug

# Azure-এ অ্যাপ্লিকেশন লগ দেখুন
azd monitor --logs

# Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### রিসোর্স নাম সংঘাত
```bash
# একটি অনন্য পরিবেশের নাম ব্যবহার করুন
azd env new dev-$(whoami)-$(date +%s)
```

### পোর্ট/নেটওয়ার্ক সমস্যা
```bash
# পোর্টগুলো উপলব্ধ আছে কি না পরীক্ষা করুন
netstat -an | grep :3000
netstat -an | grep :3100
```

## পরবর্তী পদক্ষেপ

এখন যখন আপনি আপনার প্রথম প্রজেক্ট সম্পন্ন করেছেন, এই উন্নত বিষয়গুলো অন্বেষণ করুন:

### 1. ইনফ্রাস্ট্রাকচার কাস্টমাইজ করুন
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ডাটাবেস, স্টোরেজ, এবং অন্যান্য সার্ভিস যুক্ত করা](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD সেটআপ করুন
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ CI/CD ওয়ার্কফ্লো
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - পাইপলাইন কনফিগারেশন

### 3. প্রোডাকশন সেরা অনুশীলন
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - সিকিউরিটি, পারফর্ম্যান্স, এবং মনিটরিং

### 4. আরও টেমপ্লেট অন্বেষণ করুন
```bash
# বিভাগ অনুযায়ী টেমপ্লেট ব্রাউজ করুন
azd template list --filter web
azd template list --filter api
azd template list --filter database

# বিভিন্ন প্রযুক্তি স্ট্যাক পরীক্ষা করে দেখুন
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## অতিরিক্ত রিসোর্স

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

**অভিনন্দন আপনার প্রথম azd প্রজেক্ট সম্পন্ন করার জন্য!** এখন আপনি আত্মবিশ্বাসের সাথে Azure-এ চমৎকার অ্যাপ্লিকেশন তৈরি ও ডিপ্লয় করার জন্য প্রস্তুত।

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবাগতদের জন্য](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্বের**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ পরবর্তী**: [কনফিগারেশন](configuration.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার 2: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **পরবর্তী লেসন**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়মুক্তি:
এই দলিলটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতার চেষ্টা করি, তবুও অনুগ্রহ করে সচেতন থাকুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা দলিলটিকেই প্রামাণ্য উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ অনুশংসিত। এই অনুবাদের ব্যবহারের ফলে উদ্ভূত কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নয়।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
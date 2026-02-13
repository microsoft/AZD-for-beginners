# আপনার প্রথম প্রকল্প - হাতে-কলমে টিউটোরিয়াল

**চ্যাপ্টার নেভিগেশন:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: চ্যাপ্টার 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ Previous**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ Next**: [কনফিগারেশন](configuration.md)
- **🚀 Next Chapter**: [চ্যাপ্টার 2: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

আপনার প্রথম Azure Developer CLI প্রকল্পে স্বাগতম! এই বিস্তৃত হাতে-কলমে টিউটোরিয়ালটি azd ব্যবহার করে Azure-তে একটি ফুল-স্ট্যাক অ্যাপ তৈরি, ডেপলয় এবং পরিচালনা করার সম্পূর্ণ ওয়াকথ্রু প্রদান করে। আপনি একটি বাস্তব todo অ্যাপ নিয়ে কাজ করবেন যার মধ্যে রয়েছে একটি React ফ্রন্টএন্ড, Node.js API ব্যাকএন্ড, এবং MongoDB ডাটাবেস।

## শেখার লক্ষ্য

এই টিউটোরিয়ালটি সম্পন্ন করে আপনি:
- টেমপ্লেট ব্যবহার করে azd প্রকল্প আরম্ভ করার ওয়ার্কফ্লোয়ে নিপুণ হবেন
- Azure Developer CLI প্রকল্পের কাঠামো এবং কনফিগারেশন ফাইলগুলো বুঝতে সক্ষম হবেন
- ইনফ্রাস্ট্রাকচার প্রদান সহ সম্পূর্ণ অ্যাপ্লিকেশনকে Azure-এ ডেপলয় করতে পারবেন
- অ্যাপ্লিকেশন আপডেট এবং পুনঃডেপলয় কৌশল বাস্তবায়ন করতে পারবেন
- ডেভেলপমেন্ট ও স্টেজিংয়ের জন্য একাধিক পরিবেশ পরিচালনা করতে পারবেন
- রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনা অনুশীলন প্রয়োগ করতে পারবেন

## শেখার ফলাফল

সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- টেমপ্লেট থেকে স্বাধীনভাবে azd প্রকল্প আরম্ভ এবং কনফিগার করতে
- azd প্রকল্পের কাঠামো কার্যকরভাবে নেভিগেট ও পরিবর্তন করতে
- একক কমান্ডে Azure-এ ফুল-স্ট্যাক অ্যাপ্লিকেশন ডেপলয় করতে
- সাধারণ ডেপলয়মেন্ট সমস্যা এবং 인증 সমস্যাগুলো ট্রাবলশুট করতে
- বিভিন্ন ডেপলয়মেন্ট স্টেজের জন্য একাধিক Azure পরিবেশ পরিচালনা করতে
- অ্যাপ আপডেটের জন্য কন্টিনিউয়াস ডেপলয়মেন্ট ওয়ার্কফ্লো বাস্তবায়ন করতে

## শুরু করা যাক

### পূর্বশর্ত চেকলিস্ট
- ✅ Azure Developer CLI ইনস্টল করা আছে ([ইনস্টলেশন গাইড](installation.md))
- ✅ Azure CLI ইনস্টল ও প্রমাণীকৃত
- ✅ আপনার সিস্টেমে Git ইনস্টল করা আছে
- ✅ Node.js 16+ (এই টিউটোরিয়ালের জন্য)
- ✅ Visual Studio Code (প্রস্তাবিত)

### আপনার সেটআপ যাচাই করুন
```bash
# azd ইনস্টলেশন পরীক্ষা করুন
azd version
```
### Azure প্রমাণীকরণ যাচাই করুন

```bash
az account show
```

### Node.js সংস্করণ যাচাই করুন
```bash
node --version
```

## ধাপ 1: একটি টেমপ্লেট নির্বাচন এবং আরম্ভ করা

চলুন একটি জনপ্রিয় todo অ্যাপ টেমপ্লেট দিয়ে শুরু করা যাক যেটাতে একটি React ফ্রন্টএন্ড এবং Node.js API ব্যাকএন্ড রয়েছে।

```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টুডু অ্যাপ টেমপ্লেট শুরু করুন
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# প্রম্পটগুলো অনুসরণ করুন:
# - একটি পরিবেশের নাম লিখুন: "dev"
# - একটি সাবস্ক্রিপশন নির্বাচন করুন (যদি আপনার একাধিক থাকে)
# - একটি অঞ্চল নির্বাচন করুন: "East US 2" (অথবা আপনার পছন্দের অঞ্চল)
```

### এখন কি হলো?
- টেমপ্লেট কোড আপনার লোকাল ডিরেক্টরিতে ডাউনলোড করা হয়েছে
- সার্ভিস সংজ্ঞাসহ একটি `azure.yaml` ফাইল তৈরি করা হয়েছে
- `infra/` ডিরেক্টরিতে ইনফ্রাস্ট্রাকচার কোড সেটআপ করা হয়েছে
- একটি পরিবেশ কনফিগারেশন তৈরি করা হয়েছে

## ধাপ 2: প্রকল্প কাঠামো অন্বেষণ করুন

চলুন দেখ দেখি azd আমাদের জন্য কী তৈরি করেছে:

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

### বোঝার জন্য মূল ফাইলগুলো

**azure.yaml** - আপনার azd প্রকল্পের হৃদয়:
```bash
# প্রকল্পের কনফিগারেশন দেখুন
cat azure.yaml
```

**infra/main.bicep** - ইনফ্রাস্ট্রাকচার সংজ্ঞা:
```bash
# ইনফ্রাস্ট্রাকচার কোড দেখুন
head -30 infra/main.bicep
```

## ধাপ 3: আপনার প্রকল্প কাস্টমাইজ করুন (ঐচ্ছিক)

ডেপলয় করার আগে, আপনি অ্যাপ্লিকেশনটি কাস্টমাইজ করতে পারেন:

### ফ্রন্টএন্ড পরিবর্তন করুন
```bash
# React অ্যাপ কম্পোনেন্ট খুলুন
code src/web/src/App.tsx
```

একটি সাধারণ পরিবর্তন করুন:
```typescript
// শিরোনামটি খুঁজে বের করুন এবং এটি পরিবর্তন করুন
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

## ধাপ 4: Azure-এ ডেপলয় করুন

এখন উত্তেজনাপূর্ণ অংশ - সবকিছু Azure-এ ডেপলয় করুন!

```bash
# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন মোতায়েন করুন
azd up

# এই কমান্ডটি করবে:
# 1. Azure রিসোর্স প্রোভিশন করবে (App Service, Cosmos DB, ইত্যাদি)
# 2. আপনার অ্যাপ্লিকেশন বিল্ড করবে
# 3. প্রোভিশন করা রিসোর্সে মোতায়েন করবে
# 4. অ্যাপ্লিকেশন URL প্রদর্শন করবে
```

### ডেপলয়মেন্ট চলাকালীন কি হচ্ছে?

`azd up` কমান্ড এই ধাপগুলো সম্পাদন করে:
1. **Provision** (`azd provision`) - Azure রিসোর্স তৈরি করে
2. **Package** - আপনার অ্যাপ্লিকেশন কোড বিল্ড করে
3. **Deploy** (`azd deploy`) - কোডকে Azure রিসোর্সে ডেপলয় করে

### প্রত্যাশিত আউটপুট
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ধাপ 5: আপনার অ্যাপ্লিকেশন টেস্ট করুন

### আপনার অ্যাপ্লিকেশন অ্যাক্সেস করুন
ডেপলয়মেন্ট আউটপুটে প্রদত্ত URL-এ ক্লিক করুন, বা এটি যেকোনো সময় পান:
```bash
# অ্যাপ্লিকেশনের এন্ডপয়েন্টগুলো পান
azd show

# আপনার ব্রাউজারে অ্যাপ্লিকেশনটি খুলুন
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo অ্যাপ টেস্ট করুন
1. **একটি todo আইটেম যোগ করুন** - "Add Todo" ক্লিক করে একটি কাজ টাইপ করুন
2. **সম্পন্ন হিসেবে চিহ্নিত করুন** - সম্পন্ন আইটেমগুলো চেক করুন
3. **আইটেম মোছা** - আর দরকার 없는 todos মুছে ফেলুন

### আপনার অ্যাপ মনিটর করুন
```bash
# আপনার রিসোর্সগুলোর জন্য Azure পোর্টাল খুলুন
azd monitor

# অ্যাপ্লিকেশন লগ দেখুন
azd monitor --logs

# লাইভ মেট্রিক্স দেখুন
azd monitor --live
```

## ধাপ 6: পরিবর্তন করুন এবং পুনঃডেপলয় করুন

চলুন একটি পরিবর্তন করি এবং দেখাই আপডেট করা কত সহজ:

### API পরিবর্তন করুন
```bash
# API কোড সম্পাদনা করুন
code src/api/src/routes/lists.js
```

একটি কাস্টম রেসপন্স হেডার যোগ করুন:
```javascript
// রুট হ্যান্ডলারটি খুঁজে বের করুন এবং যোগ করুন:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### শুধু কোড পরিবর্তনগুলো ডেপলয় করুন
```bash
# শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয় করুন (অবকাঠামো বাদ দিন)
azd deploy

# অবকাঠামো ইতিমধ্যেই বিদ্যমান থাকার কারণে এটি 'azd up' থেকে অনেক দ্রুত
```

## ধাপ 7: একাধিক পরিবেশ পরিচালনা করুন

প্রোডাকশনের আগে পরিবর্তনগুলো টেস্ট করতে একটি স্টেজিং পরিবেশ তৈরি করুন:

```bash
# নতুন স্টেজিং পরিবেশ তৈরি করুন
azd env new staging

# স্টেজিং-এ স্থাপন করুন
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

## ধাপ 8: রিসোর্স পরিষ্কার করুন

আপনি যখন পরীক্ষা শেষ করবেন, চলমান চার্জ এড়াতে পরিষ্কার করুন:

```bash
# বর্তমান পরিবেশের সব Azure রিসোর্স মুছুন
azd down

# নিশ্চিতকরণ ছাড়াই জোরপূর্বক মুছুন এবং সফট-ডিলিট করা রিসোর্সগুলি স্থায়ীভাবে অপসারণ করুন
azd down --force --purge

# নির্দিষ্ট পরিবেশ মুছুন
azd env select staging
azd down --force --purge
```

## আপনি কি শিখেছেন

অভিনন্দন! আপনি সফলভাবে:
- ✅ একটি টেমপ্লেট থেকে azd প্রকল্প আরম্ভ করেছেন
- ✅ প্রকল্প কাঠামো এবং মূল ফাইলগুলো অন্বেষণ করেছেন
- ✅ Azure-এ একটি ফুল-স্ট্যাক অ্যাপ্লিকেশন ডেপলয় করেছেন
- ✅ কোড পরিবর্তন করে পুনঃডেপলয় করেছেন
- ✅ একাধিক পরিবেশ পরিচালনা করেছেন
- ✅ রিসোর্সগুলো পরিষ্কার করেছেন

## 🎯 দক্ষতা যাচাই অনুশীলনসমূহ

### অনুশীলন 1: একটি ভিন্ন টেমপ্লেট ডেপলয় করুন (১৫ মিনিট)
**লক্ষ্য**: azd init এবং ডেপলয়মেন্ট ওয়ার্কফ্লোতে দক্ষতা প্রদর্শন করা

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

**সাফল্যের মানদণ্ড:**
- [ ] অ্যাপ্লিকেশন ত্রুটি ছাড়াই ডেপলয় হয়
- [ ] ব্রাউজারে অ্যাপ্লিকেশন URL অ্যাক্সেস করা যায়
- [ ] অ্যাপ্লিকেশন সঠিকভাবে কাজ করে (todo যোগ/মুছা)
- [ ] সমস্ত রিসোর্স সফলভাবে পরিষ্কার করা হয়েছে

### অনুশীলন 2: কনফিগারেশন কাস্টমাইজ করুন (২০ মিনিট)
**লক্ষ্য**: পরিবেশ ভেরিয়েবল কনফিগারেশন অনুশীলন

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

# কাস্টম কনফিগারেশন দিয়ে মোতায়েন করুন
azd up
```

**সাফল্যের মানদণ্ড:**
- [ ] কাস্টম পরিবেশ সফলভাবে তৈরি করা হয়েছে
- [ ] পরিবেশ ভেরিয়েবল সেট করা হয়েছে এবং পুনরুদ্ধারযোগ্য
- [ ] কাস্টম কনফিগারেশনসহ অ্যাপ্লিকেশন ডেপলয় হয়
- [ ] ডেপলয় করা অ্যাপে কাস্টম সেটিংগুলো যাচাই করা যায়

### অনুশীলন 3: একাধিক পরিবেশ ওয়ার্কফ্লো (২৫ মিনিট)
**লক্ষ্য**: পরিবেশ ব্যবস্থাপনা এবং ডেপলয়মেন্ট কৌশলে দক্ষতা অর্জন

```bash
# ডেভ পরিবেশ তৈরি করুন
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ডেভের ইউআরএল নোট করুন
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# স্টেজিং পরিবেশ তৈরি করুন
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# স্টেজিংয়ের ইউআরএল নোট করুন
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

**সাফল্যের মানদণ্ড:**
- [ ] দুইটি পরিবেশ ভিন্ন কনফিগারেশনসহ তৈরি হয়েছে
- [ ] উভয় পরিবেশ সফলভাবে ডেপলয় করা হয়েছে
- [ ] `azd env select` ব্যবহার করে পরিবেশগুলোর মধ্যে স্যুইচ করা যায়
- [ ] পরিবেশ ভেরিয়েবলগুলো পরিবেশদের মধ্যে ভিন্ন
- [ ] উভয় পরিবেশ সফলভাবে পরিষ্কার করা হয়েছে

## 📊 আপনার অগ্রগতি

**ব্যয়লাম্বিত সময়**: প্রায় ৬০-৯০ মিনিট  
**অর্জিত দক্ষতা**:
- ✅ টেমপ্লেট-आধারিত প্রজেক্ট আরম্ভ
- ✅ Azure রিসোর্স প্রদান
- ✅ অ্যাপ্লিকেশন ডেপলয়মেন্ট ওয়ার্কফ্লো
- ✅ পরিবেশ ব্যবস্থাপনা
- ✅ কনফিগারেশন ব্যবস্থাপনা
- ✅ রিসোর্স ক্লিনআপ ও খরচ ব্যবস্থাপনা

**পরবর্তী ধাপ**: আপনি [কনফিগারেশন গাইড](configuration.md) পড়ে উন্নত কনফিগারেশন প্যাটার্ন শিখতে প্রস্তুত!

## সাধারণ সমস্যার সমাধান

### প্রমাণীকরণ ত্রুটি
```bash
# Azure-এ পুনরায় প্রমাণীকরণ করুন
az login

# সাবস্ক্রিপশন অ্যাক্সেস যাচাই করুন
az account show
```

### ডেপলয়মেন্ট ব্যর্থতা
```bash
# ডিবাগ লগিং সক্ষম করুন
export AZD_DEBUG=true
azd up --debug

# Azure-এ অ্যাপ্লিকেশন লগ দেখুন
azd monitor --logs

# Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### রিসোর্স নাম সংঘর্ষ
```bash
# একটি অনন্য পরিবেশের নাম ব্যবহার করুন
azd env new dev-$(whoami)-$(date +%s)
```

### পোর্ট/নেটওয়ার্ক সমস্যা
```bash
# পোর্টগুলি উপলব্ধ আছে কি না পরীক্ষা করুন
netstat -an | grep :3000
netstat -an | grep :3100
```

## পরবর্তী ধাপ

এখন যখন আপনি আপনার প্রথম প্রকল্প সম্পন্ন করেছেন, এই উন্নত বিষয়গুলো অন্বেষণ করুন:

### 1. ইনফ্রাস্ট্রাকচার কাস্টমাইজ করুন
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD সেটআপ করুন
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ CI/CD ওয়ার্কফ্লো
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - পাইপলাইন কনফিগারেশন

### 3. প্রোডাকশন শ্রেষ্ঠ অনুশীলন
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - সিকিউরিটি, পারফরম্যান্স, এবং মনিটরিং

### 4. আরও টেমপ্লেট অন্বেষণ করুন
```bash
# বিভাগ অনুযায়ী টেমপ্লেট ব্রাউজ করুন
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
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### কমিউনিটি ও সাপোর্ট
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### টেমপ্লেট ও উদাহরণ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**অভিনন্দন আপনার প্রথম azd প্রকল্প সম্পন্ন করার জন্য!** আপনি এখন আত্মবিশ্বাসের সাথে Azure-এ দুর্দান্ত অ্যাপ বিল্ড ও ডেপলয় করতে প্রস্তুত।

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: চ্যাপ্টার 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ Previous**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ Next**: [কনফিগারেশন](configuration.md)
- **🚀 Next Chapter**: [চ্যাপ্টার 2: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি এআই অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা নির্ভুলতার দিকে যত্নশীল হলেও অনুগ্রহ করে জানবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল ভাষায় থাকা নথিকেই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ পরামর্শযোগ্য। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
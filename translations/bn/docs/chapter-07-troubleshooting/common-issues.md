# সাধারণ সমস্যা এবং সমাধান

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD নবীনদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 7 - ত্রুটিনির্ণয় ও ডিবাগিং
- **⬅️ পূর্ববর্তী অধ্যায়**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ পরবর্তী**: [ডিবাগিং গাইড](debugging.md)
- **🚀 পরবর্তী অধ্যায়**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## পরিচিতি

এই বিস্তৃত ত্রুটিনির্ণয় গাইডটি Azure Developer CLI ব্যবহারের সময় সবচেয়ে সাধারণভাবে দেখাসম্পূর্ণ সমস্যা নিয়ে আলোচনা করে। প্রমাণীকরণ, ডেপ্লয়মেন্ট, অবকাঠামো প্রোভিশনিং, এবং অ্যাপ্লিকেশন কনফিগারেশনের সাধারণ সমস্যা নির্ণয়, মাত্রা পরীক্ষা, এবং সমাধান করতে শিখুন। প্রতিটি সমস্যার জন্য বিস্তারিত লক্ষণ, মূল কারণ, এবং ধাপে ধাপে সমাধান প্রক্রিয়া অন্তর্ভুক্ত করা হয়েছে।

## শেখার লক্ষ্যসমূহ

এই গাইড সম্পন্ন করে আপনি:
- Azure Developer CLI সমস্যাগুলির জন্য নির্ণায়ক কৌশলগুলো মাস্টার করবেন
- সাধারণ প্রমাণীকরণ ও অনুমতি সম্পর্কিত সমস্যা এবং তাদের সমাধান বুঝতে পারবেন
- ডেপ্লয়মেন্ট ব্যর্থতা, অবকাঠামো প্রোভিশনিং ত্রুটি, এবং কনফিগারেশন সমস্যাগুলি সমাধান করতে পারবেন
- সক্রিয় মনিটরিং এবং ডিবাগিং কৌশল প্রয়োগ করতে পারবেন
- জটিল সমস্যার জন্য সিস্টেম্যাটিক ত্রুটিনির্ণয়ের পদ্ধতি প্রয়োগ করতে পারবেন
- ভবিষ্যতের সমস্যা প্রতিরোধে সঠিক লগিং ও মনিটরিং কনফিগার করতে পারবেন

## শেখার ফলাফল

শেষ হলে, আপনি সক্ষম হবেন:
- বিল্ট-ইন ডায়াগনস্টিক টুল ব্যবহার করে Azure Developer CLI সমস্যা নির্ণয় করতে
- প্রমাণীকরণ, সাবস্ক্রিপশন, এবং অনুমতি-সংক্রান্ত সমস্যা স্বাধীনভাবে সমাধান করতে
- ডেপ্লয়মেন্ট ব্যর্থতা এবং অবকাঠামো প্রোভিশনিং ত্রুটি কার্যকরভাবে ট্রাবলশুট করতে
- অ্যাপ্লিকেশন কনফিগারেশন সমস্যা এবং পরিবেশ-নির্দিষ্ট সমস্যাগুলি ডিবাগ করতে
- সম্ভাব্য সমস্যাগুলো প্রাক-চিহ্নিত করার জন্য মনিটরিং ও অ্যালার্টিং কার্যকর করা
- লগিং, ডিবাগিং, এবং সমস্যা সমাধান ওয়ার্কফ্লোর জন্য সেরা অনুশীলন প্রয়োগ করা

## দ্রুত ডায়াগনস্টিক

নির্দিষ্ট সমস্যাগুলিতে ডুব দেওয়ার আগে, ডায়াগনস্টিক তথ্য সংগ্রহ করতে নিম্নলিখিত কমান্ডগুলো চালান:

```bash
# azd সংস্করণ এবং স্বাস্থ্য পরীক্ষা করুন
azd version
azd config list

# Azure প্রমাণীকরণ যাচাই করুন
az account show
az account list

# বর্তমান পরিবেশ পরীক্ষা করুন
azd env show
azd env get-values

# ডিবাগ লগিং সক্ষম করুন
export AZD_DEBUG=true
azd <command> --debug
```

## প্রমাণীকরণ সমস্যা

### সমস্যা: "Failed to get access token"
**লক্ষণসমূহ:**
- `azd up` প্রমাণীকরণ ত্রুটি নিয়ে ব্যর্থ হয়
- কমান্ডগুলো "unauthorized" বা "access denied" ফেরত দেয়

**সমাধান:**
```bash
# 1. Azure CLI দিয়ে পুনরায় প্রমাণীকরণ করুন
az login
az account show

# 2. ক্যাশে থাকা শংসাপত্র মুছুন
az account clear
az login

# 3. ডিভাইস কোড ফ্লো ব্যবহার করুন (হেডলেস সিস্টেমগুলির জন্য)
az login --use-device-code

# 4. নির্দিষ্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### সমস্যা: "Insufficient privileges" ডেপ্লয়মেন্টের সময়
**লক্ষণসমূহ:**
- অনুমতি ত্রুটির কারণে ডেপ্লয়মেন্ট ব্যর্থ হয়
- কিছু Azure রিসোর্স তৈরি করা যায় না

**সমাধান:**
```bash
# 1. আপনার Azure রোল অ্যাসাইনমেন্টগুলো যাচাই করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. নিশ্চিত করুন যে আপনার প্রয়োজনীয় রোলগুলি আছে
# - Contributor (রিসোর্স তৈরি করার জন্য)
# - User Access Administrator (রোল অ্যাইনমেন্টের জন্য)

# 3. সঠিক অনুমতির জন্য আপনার Azure অ্যাডমিনিস্ট্রেটরের সাথে যোগাযোগ করুন
```

### সমস্যা: মাল্টি-টেনেন্ট প্রমাণীকরণ সমস্যা
**সমাধান:**
```bash
# 1. নির্দিষ্ট টেন্যান্ট দিয়ে লগইন করুন
az login --tenant "your-tenant-id"

# 2. কনফিগারেশনে টেন্যান্ট সেট করুন
azd config set auth.tenantId "your-tenant-id"

# 3. টেন্যান্ট পরিবর্তন করলে টেন্যান্ট ক্যাশ পরিষ্কার করুন
az account clear
```

## 🏗️ অবকাঠামো প্রোভিশনিং ত্রুটি

### সমস্যা: Resource name conflicts
**লক্ষণসমূহ:**
- "The resource name already exists" ত্রুটি
- রিসোর্স তৈরি করার সময় ডেপ্লয়মেন্ট ব্যর্থ হয়

**সমাধান:**
```bash
# 1. টোকেন সহ অনন্য রিসোর্স নাম ব্যবহার করুন
# আপনার Bicep টেমপ্লেটে:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. পরিবেশের নাম পরিবর্তন করুন
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. বিদ্যমান রিসোর্সগুলো পরিষ্কার করুন
azd down --force --purge
```

### সমস্যা: Location/Region not available
**লক্ষণসমূহ:**
- "The location 'xyz' is not available for resource type"
- নির্দিষ্ট SKUs নির্বাচিত অঞ্চলে পাওয়া যায় না

**সমাধান:**
```bash
# 1. রিসোর্স টাইপগুলির জন্য উপলব্ধ অবস্থানগুলো পরীক্ষা করুন
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. সাধারণভাবে উপলব্ধ অঞ্চলগুলো ব্যবহার করুন
azd config set defaults.location eastus2
# অথবা
azd env set AZURE_LOCATION eastus2

# 3. অঞ্চল অনুযায়ী সেবার উপলব্ধতা পরীক্ষা করুন
# পরিদর্শন করুন: https://azure.microsoft.com/global-infrastructure/services/
```

### সমস্যা: Quota exceeded errors
**লক্ষণসমূহ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**সমাধান:**
```bash
# 1. বর্তমান কোটা ব্যবহার পরীক্ষা করুন
az vm list-usage --location eastus2 -o table

# 2. Azure পোর্টালের মাধ্যমে কোটা বৃদ্ধির অনুরোধ করুন
# যান: সাবস্ক্রিপশনসমূহ > ব্যবহার + কোটা

# 3. ডেভেলপমেন্টে ছোট SKUs ব্যবহার করুন
# main.parameters.json-এ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. অব্যবহৃত রিসোর্সগুলি পরিষ্কার করুন
az resource list --query "[?contains(name, 'unused')]" -o table
```

### সমস্যা: Bicep template errors
**লক্ষণসমূহ:**
- টেমপ্লেট ভ্যালিডেশন ব্যর্থতা
- Bicep ফাইলগুলিতে সিনট্যাক্স ত্রুটি

**সমাধান:**
```bash
# 1. Bicep সিনট্যাক্স যাচাই করুন
az bicep build --file infra/main.bicep

# 2. Bicep লিন্টার ব্যবহার করুন
az bicep lint --file infra/main.bicep

# 3. প্যারামিটার ফাইলের সিনট্যাক্স যাচাই করুন
cat infra/main.parameters.json | jq '.'

# 4. ডিপ্লয়মেন্ট পরিবর্তনগুলি প্রাকদর্শন করুন
azd provision --preview
```

## 🚀 ডেপ্লয়মেন্ট ব্যর্থতা

### সমস্যা: Build failures
**লক্ষণসমূহ:**
- ডেপ্লয়মেন্টের সময় অ্যাপ্লিকেশন বিল্ড হতে ব্যর্থ হয়
- প্যাকেজ ইনস্টলেশন ত্রুটি

**সমাধান:**
```bash
# 1. ডিবাগ ফ্লাগ সহ বিল্ড আউটপুট যাচাই করুন
azd deploy --service web --debug

# 2. ডিপ্লয়কৃত সার্ভিসের অবস্থা দেখুন
azd show

# 3. স্থানীয়ভাবে বিল্ড পরীক্ষা করুন
cd src/web
npm install
npm run build

# 3. Node.js/Python সংস্করণের সামঞ্জস্য যাচাই করুন
node --version  # azure.yaml সেটিংসের সাথে মিলতে হবে
python --version

# 4. বিল্ড ক্যাশ পরিষ্কার করুন
rm -rf node_modules package-lock.json
npm install

# 5. কনটেইনার ব্যবহার করলে Dockerfile যাচাই করুন
docker build -t test-image .
docker run --rm test-image
```

### সমস্যা: Container deployment failures
**লক্ষণসমূহ:**
- কন্টেইনার অ্যাপগুলি শুরু হতে ব্যর্থ হয়
- ইমেজ পুল ত্রুটি

**সমাধান:**
```bash
# 1. স্থানীয়ভাবে Docker বিল্ড পরীক্ষা করুন
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ব্যবহার করে কনটেইনার লগ পরীক্ষা করুন
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ব্যবহার করে অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
azd monitor --logs

# 3. কনটেইনার রেজিস্ট্রির অ্যাক্সেস যাচাই করুন
az acr login --name myregistry

# 4. কনটেইনার অ্যাপ কনফিগারেশন পরীক্ষা করুন
az containerapp show --name my-app --resource-group my-rg
```

### সমস্যা: Database connection failures
**লক্ষণসমূহ:**
- অ্যাপ্লিকেশন ডাটাবেসে সংযোগ করতে পারে না
- সংযোগ টাইমআউট ত্রুটি

**সমাধান:**
```bash
# 1. ডাটাবেস ফায়ারওয়াল নিয়মগুলি পরীক্ষা করুন
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. অ্যাপ্লিকেশন থেকে সংযোগ পরীক্ষা করুন
# অস্থায়ীভাবে আপনার অ্যাপে যোগ করুন:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. সংযোগ স্ট্রিং-এর বিন্যাস যাচাই করুন
azd env get-values | grep DATABASE

# 4. ডাটাবেস সার্ভারের অবস্থা পরীক্ষা করুন
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 কনফিগারেশন সমস্যা

### সমস্যা: Environment variables not working
**লক্ষণসমূহ:**
- অ্যাপ কনফিগারেশন ভ্যালুগুলো পড়তে পারে না
- পরিবেশ ভেরিয়েবলগুলো খালি দেখা যায়

**সমাধান:**
```bash
# 1. পরিবেশ ভেরিয়েবলগুলি ঠিকমতো সেট হয়েছে কি না যাচাই করুন
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml-এ ভেরিয়েবল নামগুলি পরীক্ষা করুন
cat azure.yaml | grep -A 5 env:

# 3. অ্যাপ্লিকেশন পুনরায় চালু করুন
azd deploy --service web

# 4. অ্যাপ সার্ভিস কনফিগারেশন পরীক্ষা করুন
az webapp config appsettings list --name myapp --resource-group myrg
```

### সমস্যা: SSL/TLS certificate problems
**লক্ষণসমূহ:**
- HTTPS কাজ করছে না
- সার্টিফিকেট ভ্যালিডেশন ত্রুটি

**সমাধান:**
```bash
# 1. SSL সার্টিফিকেটের অবস্থা পরীক্ষা করুন
az webapp config ssl list --resource-group myrg

# 2. কেবল HTTPS সক্ষম করুন
az webapp update --name myapp --resource-group myrg --https-only true

# 3. কাস্টম ডোমেন যোগ করুন (প্রয়োজনে)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### সমস্যা: CORS configuration problems
**লক্ষণসমূহ:**
- ফ্রন্টএন্ড API কল করতে পারছে না
- Cross-origin অনুরোধ ব্লক হচ্ছে

**সমাধান:**
```bash
# 1. App Service-এর জন্য CORS কনফিগার করুন
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS পরিচালনা করার জন্য API আপডেট করুন
# Express.js-এ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. সঠিক URL-গুলোতে চলছে কিনা পরীক্ষা করুন
azd show
```

## 🌍 পরিবেশ পরিচালনা সমস্যা

### সমস্যা: Environment switching problems
**লক্ষণসমূহ:**
- ভুল পরিবেশ ব্যবহার হচ্ছে
- কনফিগারেশন সঠিকভাবে সুইচ হচ্ছে না

**সমাধান:**
```bash
# 1. সমস্ত পরিবেশ তালিকাভুক্ত করুন
azd env list

# 2. স্পষ্টভাবে পরিবেশ নির্বাচন করুন
azd env select production

# 3. বর্তমান পরিবেশ যাচাই করুন
azd env show

# 4. ক্ষতিগ্রস্ত হলে নতুন পরিবেশ তৈরি করুন
azd env new production-new
azd env select production-new
```

### সমস্যা: Environment corruption
**লক্ষণসমূহ:**
- পরিবেশ অকার্যকর অবস্থা দেখায়
- রিসোর্সগুলি কনফিগারেশনের সাথে মেলে না

**সমাধান:**
```bash
# 1. পরিবেশের অবস্থা রিফ্রেশ করুন
azd env refresh

# 2. পরিবেশের কনফিগারেশন রিসেট করুন
azd env new production-reset
# প্রয়োজনীয় পরিবেশ ভ্যারিয়েবলগুলো কপি করুন
azd env set DATABASE_URL "your-value"

# 3. বিদ্যমান রিসোর্সগুলো ইম্পোর্ট করুন (যদি সম্ভব)
# ম্যানুয়ালি .azure/production/config.json ফাইলটি রিসোর্স আইডিগুলো নিয়ে আপডেট করুন
```

## 🔍 কর্মক্ষমতা সমস্যা

### সমস্যা: Slow deployment times
**লক্ষণসমূহ:**
- ডেপ্লয়মেন্টগুলো অনেক সময় নিচ্ছে
- ডেপ্লয়মেন্টের সময় টাইমআউট হচ্ছে

**সমাধান:**
```bash
# 1. দ্রুত পুনরাবৃত্তির জন্য নির্দিষ্ট সার্ভিসগুলো ডিপ্লয় করুন
azd deploy --service web
azd deploy --service api

# 2. ইনফ্রাস্ট্রাকচার অপরিবর্তিত থাকলে শুধুমাত্র কোড ডিপ্লয় করুন
azd deploy  # azd up-এর চেয়ে দ্রুত

# 3. বিল্ড প্রক্রিয়া অপ্টিমাইজ করুন
# package.json-এ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. রিসোর্সের অবস্থান পরীক্ষা করুন (একই রিজিয়ন ব্যবহার করুন)
azd config set defaults.location eastus2
```

### সমস্যা: Application performance problems
**লক্ষণসমূহ:**
- উত্তরদানের সময় ধীর
- উচ্চ রিসোর্স ব্যবহার

**সমাধান:**
```bash
# 1. রিসোর্স বাড়ান
# main.parameters.json-এ SKU আপডেট করুন:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights পর্যবেক্ষণ সক্ষম করুন
azd monitor --overview

# 3. Azure-এ অ্যাপ্লিকেশন লগ পরীক্ষা করুন
az webapp log tail --name myapp --resource-group myrg
# অথবা Container Apps-এর জন্য:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ক্যাশিং বাস্তবায়ন করুন
# আপনার অবকাঠামোতে Redis ক্যাশ যোগ করুন
```

## 🛠️ ত্রুটিনির্ণয় টুল ও কমান্ডসমূহ

### ডিবাগ কমান্ডসমূহ
```bash
# ব্যাপক ডিবাগিং
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd সংস্করণ পরীক্ষা করুন
azd version

# বর্তমান কনফিগারেশন দেখুন
azd config list

# সংযোগ পরীক্ষা করুন
curl -v https://myapp.azurewebsites.net/health
```

### লগ বিশ্লেষণ
```bash
# Azure CLI-এর মাধ্যমে অ্যাপ্লিকেশন লগ
az webapp log tail --name myapp --resource-group myrg

# azd দিয়ে অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
azd monitor --logs
azd monitor --live

# Azure রিসোর্স লগ
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# কন্টেইনার লগ (Container Apps-এর জন্য)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### রিসোর্স তদন্ত
```bash
# সমস্ত রিসোর্স তালিকাভুক্ত করুন
az resource list --resource-group myrg -o table

# রিসোর্সের অবস্থা পরীক্ষা করুন
az webapp show --name myapp --resource-group myrg --query state

# নেটওয়ার্ক ডায়াগনস্টিকস
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 অতিরিক্ত সাহায্য নেওয়া

### কখন এস্কেলেট করবেন
- সমস্ত সমাধান চেষ্টা করার পরও প্রমাণীকরণ সমস্যা বজায় থাকলে
- Azure সেবাগুলির সাথে অবকাঠামো সমস্যা থাকলে
- বিলিং বা সাবস্ক্রিপশন-সম্পর্কিত বিষয়াদি
- সিকিউরিটি উদ্বেগ বা INCIDENT থাকলে

### সাপোর্ট চ্যানেলসমূহ
```bash
# 1. Azure Service Health পরীক্ষা করুন
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. একটি Azure সাপোর্ট টিকিট তৈরি করুন
# যান: https://portal.azure.com -> সহায়তা + সমর্থন

# 3. সম্প্রদায় সংস্থান
# - Stack Overflow: azure-developer-cli ট্যাগ
# - GitHub ইস্যুস: https://github.com/Azure/azure-dev/issues
# - Microsoft প্রশ্নোত্তর: https://learn.microsoft.com/en-us/answers/
```

### সংগ্রহ করার তথ্য
সাপোর্টে যোগাযোগ করার আগে, সংগ্রহ করুন:
- `azd version` আউটপুট
- `azd config list` আউটপুট
- `azd show` আউটপুট (বর্তমান ডেপ্লয়মেন্ট স্ট্যাটাস)
- ত্রুটি বার্তাগুলি (পূর্ণ টেক্সট)
- সমস্যা পুনরুত্পাদন করার ধাপসমূহ
- পরিবেশের বিবরণ (`azd env show`)
- সমস্যাটি কখন শুরু হয়েছিল তার টাইমলাইন

### লগ সংগ্রহ স্ক্রিপ্ট
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 সমস্যা প্রতিরোধ

### প্রি-ডেপ্লয়মেন্ট চেকলিস্ট
```bash
# 1. প্রমাণীকরণ যাচাই করুন
az account show

# 2. কোটা এবং সীমাগুলি পরীক্ষা করুন
az vm list-usage --location eastus2

# 3. টেমপ্লেট যাচাই করুন
az bicep build --file infra/main.bicep

# 4. প্রথমে লোকালভাবে পরীক্ষা করুন
npm run build
npm run test

# 5. ড্রাই-রান ডিপ্লয়মেন্ট ব্যবহার করুন
azd provision --preview
```

### মনিটরিং সেটআপ
```bash
# Application Insights সক্রিয় করুন
# main.bicep-এ যোগ করুন:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# সতর্কতা সেট আপ করুন
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### নিয়মিত রক্ষণাবেক্ষণ
```bash
# সাপ্তাহিক স্বাস্থ্য পরীক্ষা
./scripts/health-check.sh

# মাসিক খরচ পর্যালোচনা
az consumption usage list --billing-period-name 202401

# ত্রৈমাসিক নিরাপত্তা পর্যালোচনা
az security assessment list --resource-group myrg
```

## সম্পর্কিত সম্পদ

- [ডিবাগিং গাইড](debugging.md) - উন্নত ডিবাগিং কৌশল
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - অবকাঠামো ট্রাবলশুটিং
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স পরিকল্পনা নির্দেশিকা
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - সার্ভিস স্তর সুপারিশ

---

**টিপ**: এই গাইডটি বুকমার্ক করে রাখুন এবং সমস্যা হলেবারবার এখানে رجوع করুন। বেশিরভাগ সমস্যাই পূর্বে দেখা গেছে এবং তাদের প্রতিষ্ঠিত সমাধান আছে!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **পরবর্তী পাঠ**: [ডিবাগিং গাইড](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:

এই নথিটি এআই অনুবাদ পরিষেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত করা হয়েছে। আমরা সঠিকতার চেষ্টা করি, তবুও স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল নথিটিকে তার নিজ ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারে কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
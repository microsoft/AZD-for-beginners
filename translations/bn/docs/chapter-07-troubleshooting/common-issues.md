# সাধারণ সমস্যা এবং সমাধান

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - ট্রাবলশুটিং ও ডিবাগিং
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৬: প্রি-ফ্লাইট চেকস](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ পরবর্তী**: [ডিবাগিং গাইড](debugging.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)

## ভূমিকা

এই বিস্তৃত ট্রাবলশুটিং গাইডটি Azure Developer CLI ব্যবহারের সময় সবচেয়ে সাধারণত মুখোমুখি হওয়া সমস্যাগুলি কভার করে। প্রমাণীকরণ, ডিপ্লয়মেন্ট, অবকাঠামো প্রোভিশনিং এবং অ্যাপ্লিকেশন কনফিগারেশনের সাথে সাধারণ সমস্যা নির্ণয়, সমাধান এবং সংশোধন শিখুন। প্রতিটি সমস্যায় বিস্তারিত উপসর্গ, মূল কারণ এবং ধাপে ধাপে সমাধান পদ্ধতি অন্তর্ভুক্ত রয়েছে।

## শেখার লক্ষ্য

এই গাইড শেষ করার মাধ্যমে আপনি:
- Azure Developer CLI সমস্যাগুলির জন্য নির্ণয় প্রযুক্তিতে পারদর্শী হয়ে উঠবেন
- সাধারণ প্রমাণীকরণ ও অনুমতি সমস্যাগুলি এবং তাদের সমাধান বুঝতে পারবেন
- ডিপ্লয়মেন্ট ব্যর্থতা, অবকাঠামো প্রোভিশনিং ত্রুটি এবং কনফিগারেশন সমস্যা সমাধান করতে সক্ষম হবেন
- প্রোঅ্যাকটিভ মনিটরিং এবং ডিবাগিং কৌশল প্রয়োগ করতে পারবেন
- জটিল সমস্যার জন্য পদ্ধতিগত ট্রাবলশুটিং মেথডোলজি বাস্তবায়ন করবেন
- ভবিষ্যতের সমস্যা প্রতিরোধে সঠিক লগিং ও মনিটরিং কনফিগার করবেন

## শেখার ফলাফল

পূর্ণ করার পরে, আপনি সক্ষম হবেন:
- বিল্ট-ইন ডায়াগনস্টিক টুল ব্যবহার করে Azure Developer CLI সমস্যাগুলির নির্ণয় করতে
- প্রমাণীকরণ, সাবস্ক্রিপশন, এবং অনুমতি সম্পর্কিত সমস্যাগুলি স্বতন্ত্রভাবে সমাধান করতে
- ডিপ্লয়মেন্ট ব্যর্থতা এবং অবকাঠামো প্রোভিশনিং ত্রুটিগুলি কার্যকরভাবে ট্রাবলশুট করতে
- অ্যাপ্লিকেশন কনফিগারেশন সমস্যা এবং পরিবেশ-নির্দিষ্ট সমস্যাগুলির ডিবাগিং করতে
- সম্ভাব্য সমস্যাগুলি প্রোঅ্যাকটিভভাবে শনাক্ত করার জন্য মনিটরিং এবং অ্যালার্টিং প্রয়োগ করতে
- লগিং, ডিবাগিং এবং সমস্যা সমাধান কর্মপ্রবাহের জন্য সেরা অনুশীলনগুলি প্রয়োগ করতে

## দ্রুত নির্ণয়

নির্দিষ্ট সমস্যাগুলিতে প্রবেশ করার আগে, ডায়াগনস্টিক তথ্য সংগ্রহ করতে এই কমান্ডগুলি চালান:

```bash
# azd সংস্করণ এবং স্বাস্থ্য পরীক্ষা করুন
azd version
azd config show

# Azure প্রমাণীকরণ যাচাই করুন
az account show
az account list

# বর্তমান পরিবেশ পরীক্ষা করুন
azd env list
azd env get-values

# ডিবাগ লগিং সক্ষম করুন
export AZD_DEBUG=true
azd <command> --debug
```

## প্রমাণীকরণ সমস্যা

### সমস্যা: "অ্যাক্সেস টোকেন পাওয়া যায়নি"
**উপসর্গ:**
- `azd up` প্রমাণীকরণ ত্রুটির কারণে ব্যর্থ হয়
- কমান্ডগুলি "অননুমোদিত" বা "অ্যাক্সেস বিয়ুক্ত" বার্তা দেয়

**সমাধান:**
```bash
# 1. Azure CLI দিয়ে পুনরায় প্রমাণীকরণ করুন
az login
az account show

# 2. সংরক্ষণকৃত অনুমোদন তথ্য মুছুন
az account clear
az login

# 3. ডিভাইস কোড ফ্লো ব্যবহার করুন (হেডলেস সিস্টেমের জন্য)
az login --use-device-code

# 4. স্পষ্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### সমস্যা: ডিপ্লয়মেন্টের সময় "অপ্রতুল বিশেষাধিকার"
**উপসর্গ:**
- অনুমতি ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ হয়
- কিছু Azure রিসোর্স তৈরি করতে পারে না

**সমাধান:**
```bash
# 1. আপনার Azure ভূমিকা নিয়োগগুলি পরীক্ষা করুন
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. নিশ্চিত করুন যে আপনার প্রয়োজনীয় ভূমিকা রয়েছে
# - কন্ট্রিবিউটর (সম্পদ তৈরির জন্য)
# - ইউজার অ্যাকসেস অ্যাডমিনিস্ট্রেটর (ভূমিকা নিয়োগের জন্য)

# 3. সঠিক অনুমতির জন্য আপনার Azure প্রশাসকের সাথে যোগাযোগ করুন
```

### সমস্যা: মাল্টি-টেন্যান্ট প্রমাণীকরণ সমস্যা
**সমাধান:**
```bash
# 1. নির্দিষ্ট টেন্যান্ট দিয়ে লগইন করুন
az login --tenant "your-tenant-id"

# 2. কনফিগারেশনে টেন্যান্ট সেট করুন
azd config set auth.tenantId "your-tenant-id"

# 3. টেন্যান্ট পরিবর্তন করলে টেন্যান্ট ক্যাশ পরিষ্কার করুন
az account clear
```

## 🏗️ অবকাঠামো প্রোভিশনিং ত্রুটি

### সমস্যা: রিসোর্স নামের সংঘাত
**উপসর্গ:**
- "রিসোর্স নাম ইতিমধ্যে রয়েছে" ত্রুটি
- রিসোর্স তৈরি করার সময় ডিপ্লয়মেন্ট ব্যর্থ

**সমাধান:**
```bash
# ১. টোকেন সহ অনন্য রিসোর্স নাম ব্যবহার করুন
# আপনার বiceps টেমপ্লেটে:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# ২. পরিবেশের নাম পরিবর্তন করুন
azd env new my-app-dev-$(whoami)-$(date +%s)

# ৩. বিদ্যমান রিসোর্সগুলি পরিষ্কৃত করুন
azd down --force --purge
```

### সমস্যা: লোকেশন/রেজিয়ন উপলব্ধ নয়
**উপসর্গ:**
- "রিসোর্স প্রকার জন্য 'xyz' লোকেশন উপলব্ধ নয়"
- নির্বাচিত অঞ্চলে কিছু SKU উপলব্ধ নয়

**সমাধান:**
```bash
# 1. রিসোর্স টাইপের জন্য উপলব্ধ অবস্থানগুলি চেক করুন
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. সাধারণত উপলব্ধ অঞ্চলে ব্যবহার করুন
azd config set defaults.location eastus2
# অথবা
azd env set AZURE_LOCATION eastus2

# 3. অঞ্চলের দ্বারা সেবার প্রাপ্যতা চেক করুন
# পরিদর্শন করুন: https://azure.microsoft.com/global-infrastructure/services/
```

### সমস্যা: কোটার সীমা ছাড়ানো ত্রুটি
**উপসর্গ:**
- "রিসোর্স প্রকারের জন্য কোটা ছাড়ানো হয়েছে"
- "রিসোর্সের সর্বোচ্চ সংখ্যা পৌঁছানো হয়েছে"

**সমাধান:**
```bash
# ১. বর্তমান কোটা ব্যবহার পরীক্ষা করুন
az vm list-usage --location eastus2 -o table

# ২. Azure পোর্টালের মাধ্যমে কোটা বৃদ্ধি অনুরোধ করুন
# যান: Subscriptions > Usage + quotas

# ৩. উন্নয়নের জন্য ছোট SKUs ব্যবহার করুন
# main.parameters.json এ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# ৪. ব্যবহার না করা রিসোর্স গুলো পরিষ্কার করুন
az resource list --query "[?contains(name, 'unused')]" -o table
```

### সমস্যা: বাইসপ টেমপ্লেট ত্রুটি
**উপসর্গ:**
- টেমপ্লেট যাচাইকরণ ব্যর্থ
- বাইসপ ফাইলের সিনট্যাক্স ত্রুটি

**সমাধান:**
```bash
# 1. Bicep সিনট্যাক্স যাচাই করুন
az bicep build --file infra/main.bicep

# 2. Bicep লিন্টার ব্যবহার করুন
az bicep lint --file infra/main.bicep

# 3. প্যারামিটার ফাইলের সিনট্যাক্স চেক করুন
cat infra/main.parameters.json | jq '.'

# 4. ডিপ্লয়মেন্ট পরিবর্তনগুলি প্রিভিউ করুন
azd provision --preview
```

## 🚀 ডিপ্লয়মেন্ট ব্যর্থতা

### সমস্যা: বিল্ড ব্যর্থতা
**উপসর্গ:**
- ডিপ্লয়মেন্টের সময় অ্যাপ্লিকেশন বিল্ড ব্যর্থ হয়
- প্যাকেজ ইনস্টলেশন ত্রুটি

**সমাধান:**
```bash
# 1. ডিবাগ ফ্ল্যাগ দিয়ে বিল্ড আউটপুট পরীক্ষা করুন
azd deploy --service web --debug

# 2. মোতায়েনকৃত সার্ভিসের অবস্থা দেখুন
azd show

# 3. লোকালি বিল্ড পরীক্ষা করুন
cd src/web
npm install
npm run build

# 3. Node.js/Python সংস্করণ সামঞ্জস্য পরীক্ষা করুন
node --version  # azure.yaml সেটিংসের সাথে মিল থাকা উচিত
python --version

# 4. বিল্ড ক্যাশ মুছুন
rm -rf node_modules package-lock.json
npm install

# 5. কনটেইনার ব্যবহার করলে Dockerfile পরীক্ষা করুন
docker build -t test-image .
docker run --rm test-image
```

### সমস্যা: কন্টেইনার ডিপ্লয়মেন্ট ব্যর্থতা
**উপসর্গ:**
- কন্টেইনার অ্যাপ শুরু করতে ব্যর্থ
- ইমেজ পুল ত্রুটি

**সমাধান:**
```bash
# 1. লোকালি Docker বিল্ড পরীক্ষা করুন
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ব্যবহার করে কন্টেইনার লগ পরীক্ষা করুন
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd মাধ্যমে অ্যাপ্লিকেশন মনিটর করুন
azd monitor --logs

# 3. কন্টেইনার রেজিস্ট্রি অ্যাক্সেস নিশ্চিত করুন
az acr login --name myregistry

# 4. কন্টেইনার অ্যাপ কনফিগারেশন পরীক্ষা করুন
az containerapp show --name my-app --resource-group my-rg
```

### সমস্যা: ডাটাবেস সংযোগ ব্যর্থতা
**উপসর্গ:**
- অ্যাপ্লিকেশন ডাটাবেসে সংযোগ করতে পারে না
- সংযোগ টাইমআউট ত্রুটি

**সমাধান:**
```bash
# ১। ডাটাবেস ফায়ারওয়াল নিয়ম পরীক্ষা করুন
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# ২। অ্যাপ্লিকেশন থেকে সংযোগ পরীক্ষা করুন
# সাময়িকভাবে আপনার অ্যাপে যোগ করুন:
curl -v telnet://mydb.postgres.database.azure.com:5432

# ৩। সংযোগ স্ট্রিংয়ের ফর্ম্যাট যাচাই করুন
azd env get-values | grep DATABASE

# ৪। ডাটাবেস সার্ভারের অবস্থা পরীক্ষা করুন
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 কনফিগারেশন সমস্যা

### সমস্যা: পরিবেশ ভেরিয়েবল কাজ করছে না
**উপসর্গ:**
- অ্যাপ কনফিগারেশন মান পড়তে পারে না
- পরিবেশ ভেরিয়েবল ফাঁকা দেখা যায়

**সমাধান:**
```bash
# 1. পরিবেশ ভেরিয়েবলগুলি সেট করা হয়েছে কিনা যাচাই করুন
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml এ ভেরিয়েবল নামগুলি পরীক্ষা করুন
cat azure.yaml | grep -A 5 env:

# 3. অ্যাপ্লিকেশন পুনরায় চালু করুন
azd deploy --service web

# 4. অ্যাপ সেবা কনফিগারেশন পরীক্ষা করুন
az webapp config appsettings list --name myapp --resource-group myrg
```

### সমস্যা: SSL/TLS সার্টিফিকেট সমস্যা
**উপসর্গ:**
- HTTPS কাজ করছে না
- সার্টিফিকেট যাচাইকরণ ত্রুটি

**সমাধান:**
```bash
# ১. SSL সার্টিফিকেটের অবস্থা পরীক্ষা করুন
az webapp config ssl list --resource-group myrg

# ২. শুধুমাত্র HTTPS সক্রিয় করুন
az webapp update --name myapp --resource-group myrg --https-only true

# ৩. কাস্টম ডোমেইন যোগ করুন (প্রয়োজন হলে)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### সমস্যা: CORS কনফিগারেশন সমস্যা
**উপসর্গ:**
- ফ্রন্টএন্ড API কল করতে পারে না
- ক্রস-অরিজিন অনুরোধ ব্লক হয়েছে

**সমাধান:**
```bash
# ১. অ্যাপ সার্ভিসের জন্য CORS কনফিগার করুন
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# ২. CORS পরিচালনার জন্য API আপডেট করুন
# Express.js-এ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# ৩. সঠিক URL-এ চলছে কিনা পরীক্ষা করুন
azd show
```

## 🌍 পরিবেশ ব্যবস্থাপনা সমস্যা

### সমস্যা: পরিবেশ সুইচিং সমস্যা
**উপসর্গ:**
- ভুল পরিবেশ ব্যবহার হচ্ছে
- কনফিগারেশন সঠিকভাবে স্যুইচ হচ্ছে না

**সমাধান:**
```bash
# 1. সমস্ত পরিবেশ তালিকা করুন
azd env list

# 2. স্পষ্টভাবে পরিবেশ নির্বাচন করুন
azd env select production

# 3. বর্তমান পরিবেশ যাচাই করুন
azd env list

# 4. যদি পরিবেশ ক্ষতিগ্রস্ত হয় তবে নতুন পরিবেশ তৈরি করুন
azd env new production-new
azd env select production-new
```

### সমস্যা: পরিবেশ দূষণ
**উপসর্গ:**
- পরিবেশ অবৈধ অবস্থা দেখাচ্ছে
- রিসোর্সগুলি কনফিগারেশনের সাথে মেলেনা

**সমাধান:**
```bash
# 1. পরিবেশের অবস্থা রিফ্রেশ করুন
azd env refresh

# 2. পরিবেশের কনফিগারেশন রিসেট করুন
azd env new production-reset
# প্রয়োজনীয় পরিবেশ ভেরিয়েবল কপি করুন
azd env set DATABASE_URL "your-value"

# 3. বিদ্যমান সম্পদ আমদানি করুন (যদি সম্ভব হয়)
# .azure/production/config.json ম্যানুয়ালি রিসোর্স আইডি দিয়ে আপডেট করুন
```

## 🔍 কর্মক্ষমতা সমস্যা

### সমস্যা: ধীর ডিপ্লয়মেন্ট সময়
**উপসর্গ:**
- ডিপ্লয়মেন্ট খুব সময় নিচ্ছে
- ডিপ্লয়মেন্টের সময় টাইমআউট

**সমাধান:**
```bash
# 1. দ্রুত পুনরাবৃত্তির জন্য নির্দিষ্ট পরিষেবাগুলি মোতায়েন করুন
azd deploy --service web
azd deploy --service api

# 2. অবকাঠামো অপরিবর্তিত থাকলে শুধুমাত্র কোড মোতায়েন করুন
azd deploy  # azd up থেকে দ্রুত

# 3. বিল্ড প্রক্রিয়া অপ্টিমাইজ করুন
# package.json এ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. সম্পদ অবস্থান চেক করুন (একই অঞ্চলে ব্যবহার করুন)
azd config set defaults.location eastus2
```

### সমস্যা: অ্যাপ্লিকেশন কর্মক্ষমতা সমস্যা
**উপসর্গ:**
- ধীর প্রতিক্রিয়া সময়
- উচ্চ রিসোর্স ব্যবহার

**সমাধান:**
```bash
# ১। সম্পদ বৃদ্ধি করুন
# main.parameters.json এ SKU আপডেট করুন:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# ২। অ্যাপ্লিকেশন ইনসাইটস মনিটরিং সক্ষম করুন
azd monitor --overview

# ৩। Azure-এ অ্যাপ্লিকেশন লগ পরীক্ষা করুন
az webapp log tail --name myapp --resource-group myrg
# অথবা কন্টেইনার অ্যাপস-এর জন্য:
az containerapp logs show --name myapp --resource-group myrg --follow

# ৪। ক্যাশিং প্রয়োগ করুন
# আপনার অবকাঠামোতে Redis ক্যাশ যোগ করুন
```

## 🛠️ ট্রাবলশুটিং টুলস এবং কমান্ড

### ডিবাগ কমান্ডসমূহ
```bash
# ব্যাপক ডিবাগিং
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd সংস্করণ পরীক্ষা করুন
azd version

# বর্তমান কনফিগারেশন দেখুন
azd config show

# সংযোগ পরীক্ষা করুন
curl -v https://myapp.azurewebsites.net/health
```

### লগ বিশ্লেষণ
```bash
# Azure CLI এর মাধ্যমে অ্যাপ্লিকেশন লগগুলি
az webapp log tail --name myapp --resource-group myrg

# azd দিয়ে অ্যাপ্লিকেশন মনিটর করুন
azd monitor --logs
azd monitor --live

# Azure রিসোর্স লগগুলি
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# কন্টেইনার লগগুলি (কন্টেইনার অ্যাপস-এর জন্য)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### রিসোর্স তদন্ত
```bash
# সব রিসোর্স তালিকা করুন
az resource list --resource-group myrg -o table

# রিসোর্সের পরিস্থিতি পরীক্ষা করুন
az webapp show --name myapp --resource-group myrg --query state

# নেটওয়ার্ক ডায়াগনস্টিক্স
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 অতিরিক্ত সাহায্য নেওয়া

### কখন আগ্রহী হওয়া উচিত
- সমস্ত সমাধান চেষ্টা করার পরও প্রমাণীকরণ সমস্যা স্থায়ী থাকে
- Azure পরিষেবার অবকাঠামো সমস্যা
- বিলিং বা সাবস্ক্রিপশন সম্পর্কিত সমস্যা
- নিরাপত্তা উদ্বেগ বা ঘটনা

### সাপোর্ট চ্যানেলসমূহ
```bash
# 1. আজুর সার্ভিস হেল্থ চেক করুন
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. আজুর সাপোর্ট টিকেট তৈরি করুন
# যান: https://portal.azure.com -> সাহায্য + সাপোর্ট

# 3. কমিউনিটি রিসোর্সসমূহ
# - স্ট্যাক ওভারফ্লো: azure-developer-cli ট্যাগ
# - গিটহাব ইস্যুসমূহ: https://github.com/Azure/azure-dev/issues
# - মাইক্রোসফট প্রশ্নোত্তর: https://learn.microsoft.com/en-us/answers/
```

### সংগ্রহ করার তথ্য
সাপোর্টে যোগাযোগ করার পূর্বে, সংগ্রহ করুন:
- `azd version` আউটপুট
- `azd config show` আউটপুট
- `azd show` আউটপুট (বর্তমান ডিপ্লয়মেন্টের অবস্থা)
- ত্রুটি বার্তা (পুরো লেখা)
- সমস্যাটি পুনরাবৃত্তির জন্য ধাপসমূহ
- পরিবেশের বিবরণ (`azd env get-values`)
- সমস্যাটি শুরু হওয়ার টাইমলাইন

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 সমস্যা প্রতিরোধ

### প্রি-ডিপ্লয়মেন্ট চেকলিস্ট
```bash
# 1. প্রমাণীকরণ যাচাই করুন
az account show

# 2. কোটা এবং সীমা চেক করুন
az vm list-usage --location eastus2

# 3. টেমপ্লেট যাচাই করুন
az bicep build --file infra/main.bicep

# 4. প্রথমে লোকালি পরীক্ষা করুন
npm run build
npm run test

# 5. ড্রাই-রান ডিপ্লয়মেন্ট ব্যবহার করুন
azd provision --preview
```

### মনিটরিং সেটআপ
```bash
# অ্যাপ্লিকেশন ইনসাইটস সক্ষম করুন
# main.bicep এ যোগ করুন:
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

## সম্পর্কিত সম্পদসমূহ

- [ডিবাগিং গাইড](debugging.md) - উন্নত ডিবাগিং প্রযুক্তি
- [প্রোভিশনিং রিসোর্স](../chapter-04-infrastructure/provisioning.md) - অবকাঠামো ট্রাবলশুটিং
- [ক্ষমতা পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স পরিকল্পনা দিকনির্দেশনা
- [SKU নির্বাচন](../chapter-06-pre-deployment/sku-selection.md) - সার্ভিস টিয়ার সুপারিশ

---

**টিপ**: এই গাইডটি বুকমার্ক করে রাখুন এবং যখনই সমস্যা সম্মুখীন হন তখন এটি দেখুন। বেশিরভাগ সমস্যা পূর্বে দেখা হয়েছে এবং প্রতিষ্ঠিত সমাধান রয়েছে!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [প্রোভিশনিং রিসোর্স](../chapter-04-infrastructure/provisioning.md)
- **পরবর্তী পাঠ**: [ডিবাগিং গাইড](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**বিয়োজ্ঞপ্তি**:  
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা সঠিকতার প্রতি যত্নশীল হলেও, স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসত্যতা থাকতে পারে। মূল নথিটি তার আদি ভাষায়ই কর্তৃপক্ষের সর্বোচ্চ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ করা উত্তম। এই অনুবাদের ব্যবহারে সৃষ্ট কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নয়।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
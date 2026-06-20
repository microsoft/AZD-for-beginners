# কমান্ড চিটশিট - প্রয়োজনীয় AZD কমান্ডসমূহ

**সব অধ্যায়ের দ্রুত রেফারেন্স**
- **📚 পাঠ্যকোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 দ্রুত শুরু**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI কমান্ড**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 উন্নত**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ভূমিকা

এই ব্যাপক চিটশিটটি শ্রেণিভিত্তিকভাবে সংগঠিত এবং ব্যবহারিক উদাহরণসহ সবচেয়ে সাধারণভাবে ব্যবহৃত Azure Developer CLI কমান্ডগুলির দ্রুত রেফারেন্স প্রদান করে। azd প্রকল্পগুলোর সঙ্গে উন্নয়ন, ত্রুটিমুক্তকরণ এবং দৈনন্দিন অপারেশন চলাকালীন দ্রুত খোঁজার জন্য এটি উপযুক্ত।

## শেখার লক্ষ্য

এই চিটশিটটি ব্যবহার করে আপনি:
- প্রয়োজনীয় Azure Developer CLI কমান্ড এবং সিনট্যাক্সের তাৎক্ষণিক অ্যাক্সেস পাবেন
- কার্যকরী শ্রেণীবিভাগ এবং ব্যবহার কেস অনুযায়ী কমান্ডগুলোর সংগঠন বুঝতে পারবেন
- সাধারণ উন্নয়ন এবং ডিপ্লয়মেন্ট সিনারিওর জন্য ব্যবহারিক উদাহরণ রেফার করতে পারবেন
- দ্রুত সমস্যা সমাধানের জন্য ত্রুটিমুক্তকরণ কমান্ড অ্যাক্সেস করতে পারবেন
- উন্নত কনফিগারেশন এবং কাস্টমাইজেশন অপশন দক্ষতার সাথে খুঁজে পাবেন
- পরিবেশ ব্যবস্থাপনা এবং মাল্টি-এনভায়রনমেন্ট ওয়ার্কফ্লো কমান্ডগুলো খুঁজে পাবেন

## শেখার ফলাফল

নিয়মিত এই চিটশিট রেফারেন্স করলে, আপনি সক্ষম হবেন:
- সম্পূর্ণ ডকুমেন্টেশন না দেখে আত্মবিশ্বাসের সঙ্গে azd কমান্ডগুলি কার্যকরভাবে চালাতে
- উপযুক্ত ডায়াগনস্টিক কমান্ড ব্যবহার করে দ্রুত সাধারণ সমস্যা সমাধান করতে
- একাধিক পরিবেশ এবং ডিপ্লয়মেন্ট সিনারিও দক্ষতার সঙ্গে পরিচালনা করতে
- প্রয়োজন অনুযায়ী উন্নত azd বৈশিষ্ট্য এবং কনফিগারেশন অপশন প্রয়োগ করতে
- পদ্ধতিগত কমান্ড ক্রমিক ব্যবহার করে ডিপ্লয়মেন্ট সমস্যা ডিবাগ করতে
- azd শর্টকাট এবং অপশনগুলোর কার্যকর ব্যবহার করে ওয়ার্কফ্লো অপটিমাইজ করতে

## শুরু করার কমান্ডসমূহ

### প্রমাণীকরণ
```bash
# AZD-এর মাধ্যমে Azure-এ লগইন করুন
azd auth login

# Azure CLI-তে লগইন করুন (AZD এটি অন্তর্নিহিতভাবে ব্যবহার করে)
az login

# বর্তমান অ্যাকাউন্ট পরীক্ষা করুন
az account show

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD থেকে লগআউট করুন
azd auth logout

# Azure CLI থেকে লগআউট করুন
az logout
```

### প্রকল্প ইনিশিয়ালাইজেশন
```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টেমপ্লেট থেকে ইনিশিয়ালাইজ করুন
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# বর্তমান ডিরেক্টরিতে ইনিশিয়ালাইজ করুন
azd init .

# কাস্টম নাম দিয়ে ইনিশিয়ালাইজ করুন
azd init --template todo-nodejs-mongo my-awesome-app
```

## মূল ডিপ্লয়মেন্ট কমান্ডসমূহ

### সম্পূর্ণ ডিপ্লয়মেন্ট ওয়ার্কফ্লো
```bash
# সবকিছু ডিপ্লয় করুন (প্রোভিশন + ডিপ্লয়)
azd up

# নিশ্চিতকরণ প্রম্পট নিষ্ক্রিয় করে ডিপ্লয় করুন
azd up --confirm-with-no-prompt

# নির্দিষ্ট পরিবেশে ডিপ্লয় করুন
azd up --environment production

# কাস্টম প্যারামিটার দিয়ে ডিপ্লয় করুন
azd up --parameter location=westus2
```

### শুধুমাত্র অবকাঠামো
```bash
# Azure রিসোর্স তৈরি করা
azd provision

# 🧪 ইনফ্রাস্ট্রাকচারের পরিবর্তনের প্রাকদর্শন
azd provision --preview
# কোন রিসোর্স তৈরি/পরিবর্তিত/মুছে ফেলা হবে তার একটি ড্রাই-রান ভিউ দেখায়
# 'terraform plan' বা 'bicep what-if' এর মতো - চালানোর জন্য নিরাপদ, কোনো পরিবর্তন প্রয়োগ করা হয় না
```

### শুধুমাত্র অ্যাপ্লিকেশন
```bash
# অ্যাপ্লিকেশন কোড ডিপ্লয় করুন
azd deploy

# নির্দিষ্ট সার্ভিস ডিপ্লয় করুন
azd deploy --service web
azd deploy --service api

# সমস্ত সার্ভিস ডিপ্লয় করুন
azd deploy --all
```

### বিল্ড এবং প্যাকেজ
```bash
# অ্যাপ্লিকেশনের নির্ভরতাগুলি পুনরুদ্ধার (ডাউনলোড) করুন
azd restore

# একটি নির্দিষ্ট সার্ভিস পুনরুদ্ধার করুন
azd restore --service api

# ডিপ্লয় করা ছাড়া একটি ডিপ্লয়যোগ্য আর্টিফ্যাক্ট তৈরি করুন
azd package

# একটি নির্দিষ্ট সার্ভিস তৈরি করুন
azd package --service api
```

> **`azd restore`** আপনার অ্যাপের ডিপেনডেন্সি (npm, pip, NuGet, Maven ইত্যাদি) ডাউনলোড করে। এটি `azd package` এবং `azd deploy` চলাকালীন স্বয়ংক্রিয়ভাবে চলে, তাই আপনি এটি বিরলভাবে সরাসরি কল করবেন—CI ক্যাশ গরম করার জন্য বা পরে অফলাইনে কাজ করার উদ্দেশ্যে পূর্বে ডিপেনডেন্সি প্রিফেচ করতে এটি ম্যানুয়ালি চালান।

> **`azd package`** ডিপ্লয়যোগ্য আর্টিফ্যাক্ট (একটি কনটেইনার ইমেজ বা জিপ) তৈরি করে **কিন্তু** এটি Azure-এ পুশ করে না। একটি বিল্ড সফল হয়েছে তা যাচাই করতে, আউটপুট নিরীক্ষণ করতে বা আলাদা কোনো প্রসেস পরে ডিপ্লয় করার জন্য আর্টিফ্যাক্ট তৈরি করতে একে আলাদাভাবে ব্যবহার করুন। `azd deploy` স্বয়ংক্রিয়ভাবে প্যাকেজ করে, তাই আপনি শুধুমাত্র তখনই `azd package` ব্যবহার করবেন যখন আপনি আর্টিফ্যাক্টটি ডিপ্লয় না করে ঠিক রাখতে চান।


## 🌍 পরিবেশ ব্যবস্থাপনা

### পরিবেশ অপারেশনসমূহ
```bash
# সমস্ত পরিবেশ দেখান
azd env list

# নতুন পরিবেশ তৈরি করুন
azd env new development
azd env new staging --location westus2

# পরিবেশ নির্বাচন করুন
azd env select production

# উপলব্ধ পরিবেশগুলো দেখান
azd env list

# পরিবেশের অবস্থা হালনাগাদ করুন
azd env refresh
```

### পরিবেশ ভেরিয়েবলসমূহ
```bash
# পরিবেশ চলক সেট করুন
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# পরিবেশ চলক পান
azd env get API_KEY

# সমস্ত পরিবেশ চলক তালিকা করুন
azd env get-values

# পরিবেশ চলক মুছে ফেলুন
azd env unset DEBUG
```

## ⚙️ কনফিগারেশন কমান্ডসমূহ

### গ্লোবাল কনফিগারেশন
```bash
# সমস্ত কনফিগারেশন তালিকা করুন
azd config show

# গ্লোবাল ডিফল্ট সেট করুন
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# কনফিগারেশন অপসারণ করুন
azd config unset defaults.location

# সমস্ত কনফিগারেশন রিসেট করুন
azd config reset
```

### প্রকল্প কনফিগারেশন
```bash
# azure.yaml যাচাই করুন
azd config validate

# প্রকল্পের তথ্য দেখান
azd show

# সেবা এন্ডপয়েন্টগুলি পান
azd show --output json
```

## 📊 মনিটরিং এবং ডায়াগনস্টিক্স

### মনিটরিং ড্যাশবোর্ড
```bash
# Azure পোর্টালের মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor

# Application Insights লাইভ মেট্রিক্স খুলুন
azd monitor --live

# Application Insights লগস ব্লেড খুলুন
azd monitor --logs

# Application Insights ওভারভিউ খুলুন
azd monitor --overview
```

### কনটেইনার লগ দেখা
```bash
# Azure CLI-এর মাধ্যমে লগ দেখুন (Container Apps-এর জন্য)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# রিয়েল-টাইমে লগ অনুসরণ করুন
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal থেকে লগ দেখুন
azd monitor --logs
```

### লগ অ্যানালিটিক্স কুয়েরি
```bash
# Azure পোর্টালের মাধ্যমে লগ অ্যানালিটিক্স অ্যাক্সেস করুন
azd monitor --logs

# Azure CLI ব্যবহার করে লগ কুয়েরি করুন
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ রক্ষণাবেক্ষণ কমান্ডসমূহ

### পরিচ্ছন্নতা
```bash
# সমস্ত Azure রিসোর্স মুছুন
azd down

# নিশ্চিতকরণ ছাড়াই জোরপূর্বক মুছুন
azd down --force

# সফট-ডিলিট করা রিসোর্সগুলো স্থায়ীভাবে মুছে ফেলুন
azd down --purge

# সম্পূর্ণ পরিষ্কার
azd down --force --purge
```

### আপডেটগুলো
```bash
# azd আপডেট আছে কি না পরীক্ষা করুন
azd version

# বর্তমান সংস্করণ পান
azd version

# বর্তমান কনফিগারেশন দেখুন
azd config show
```

## 🔧 উন্নত কমান্ডসমূহ

### পাইপলাইন এবং CI/CD
```bash
# GitHub Actions কনফিগার করুন
azd pipeline config

# Azure DevOps কনফিগার করুন
azd pipeline config --provider azdo

# পাইপলাইনের কনফিগারেশন দেখান
azd pipeline show
```

### অবকাঠামো ব্যবস্থাপনা
```bash
# ইনফ্রাস্ট্রাকচার টেমপ্লেট তৈরি করুন
azd infra generate

# 🧪 ইনফ্রাস্ট্রাকচার প্রিভিউ ও পরিকল্পনা
azd provision --preview
# ডেপ্লয় না করেই ইনফ্রাস্ট্রাকচার প্রোভিশনিং অনুকরণ করে
# Bicep/Terraform টেমপ্লেট বিশ্লেষণ করে এবং প্রদর্শন করে:
# - যোগ করা হবে এমন রিসোর্সসমূহ (সবুজ +)
# - পরিবর্তন করা হবে এমন রিসোর্সসমূহ (হলুদ ~)
# - মুছে ফেলা হবে এমন রিসোর্সসমূহ (লাল -)
# চলানোর জন্য নিরাপদ - Azure পরিবেশে কোনো বাস্তব পরিবর্তন করা হবে না

# azure.yaml থেকে ইনফ্রাস্ট্রাকচার সংশ্লেষণ করুন
azd infra synth
```

### প্রকল্প তথ্য
```bash
# প্রকল্পের অবস্থা এবং এন্ডপয়েন্টগুলো দেখান
azd show

# প্রকল্পের বিস্তারিত তথ্য JSON আকারে দেখান
azd show --output json

# সার্ভিসের এন্ডপয়েন্টগুলো পান
azd show --output json | jq '.services'
```

## 🤖 AI ও এক্সটেনশন কমান্ডসমূহ

### AZD এক্সটেনশনসমূহ
```bash
# উপলব্ধ সমস্ত এক্সটেনশন তালিকাভুক্ত করুন (এআই সহ)
azd extension list

# Foundry agents এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# এজেন্ট দক্ষতা এক্সটেনশন ইনস্টল করুন (প্রিভিউ)
azd extension install azure.ai.skills

# Foundry connections এক্সটেনশন ইনস্টল করুন (প্রিভিউ)
azd extension install azure.ai.connections

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# ইনস্টল করা সমস্ত এক্সটেনশন আপগ্রেড করুন
azd extension upgrade --all
```

### AI এজেন্ট কমান্ডসমূহ
```bash
# একটি ম্যানিফেস্ট থেকে একটি এজেন্ট প্রকল্প শুরু করুন
azd ai agent init -m <manifest-path-or-uri>

# একটি নির্দিষ্ট Foundry প্রকল্পকে লক্ষ্য করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# এজেন্টের সোর্স ডিরেক্টরি নির্দিষ্ট করুন
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# একটি হোস্টিং লক্ষ্য নির্বাচন করুন
azd ai agent init -m agent-manifest.yaml --host containerapp

# একটি ডিপ্লয় করা এজেন্ট পরীক্ষা করুন (ল্যাটেন্সি ও প্রথম বাইট আসার সময় দেখায়)
azd ai agent invoke

# লাইভ এন্ডপয়েন্ট কনফিগারেশন দেখান
azd ai agent endpoint show

# একটি মূল্যায়ন ডেটাসেট তৈরি করুন, তারপর এজেন্ট অপ্টিমাইজ করুন
azd ai agent eval generate
azd ai agent optimize

# একটি কোড-ভিত্তিক হোস্টেড এজেন্টের ডিপ্লয় করা সোর্স কোড ডাউনলোড করুন
azd ai agent code download

# একটি হোস্টেড এজেন্ট এবং তার সব ভার্সন মুছুন (--force সক্রিয় সেশন শেষ করে)
azd ai agent delete --force
```

### MCP সার্ভার (আলফা)
```bash
# আপনার প্রকল্পের জন্য MCP সার্ভার শুরু করুন
azd mcp start

# MCP অপারেশনের জন্য টুল সম্মতি পরিচালনা করুন
azd copilot consent list
```

### অবকাঠামো জেনারেশন
```bash
# আপনার প্রকল্প সংজ্ঞা থেকে IaC ফাইল তৈরি করুন
azd infra generate

# azure.yaml থেকে অবকাঠামো তৈরি করুন
azd infra synth
```

---

## 🎯 দ্রুত ওয়ার্কফ্লোসমূহ

### ডেভেলপমেন্ট ওয়ার্কফ্লো
```bash
# নতুন প্রকল্প শুরু করুন
azd init --template todo-nodejs-mongo
cd my-project

# উন্নয়ন পরিবেশে স্থাপন করুন
azd env new dev
azd up

# পরিবর্তন করুন এবং পুনরায় স্থাপন করুন
azd deploy

# নিরীক্ষণ ড্যাশবোর্ড খুলুন
azd monitor --live
```

### মাল্টি-এনভায়রনমেন্ট ওয়ার্কফ্লো
```bash
# পরিবেশ সেট আপ করুন
azd env new dev
azd env new staging  
azd env new production

# ডেভে মোতায়েন করুন
azd env select dev
azd up

# পরীক্ষা করুন এবং স্টেজিং-এ উন্নীত করুন
azd env select staging
azd up

# প্রোডাকশনে মোতায়েন করুন
azd env select production
azd up
```

### সমস্যা সমাধান ওয়ার্কফ্লো
```bash
# ডিবাগ মোড সক্রিয় করুন
export AZD_DEBUG=true

# ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
azd show

# কনফিগারেশন যাচাই করুন
azd config show

# লগ দেখতে মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor --logs

# রিসোর্সের অবস্থা পরীক্ষা করুন
azd show --output json
```

## 🔍 ডিবাগিং কমান্ডসমূহ

### ডিবাগ তথ্য
```bash
# ডিবাগ আউটপুট চালু করুন
export AZD_DEBUG=true
azd <command> --debug

# পরিষ্কার আউটপুটের জন্য টেলিমেট্রি নিষ্ক্রিয় করুন
export AZD_DISABLE_TELEMETRY=true

# বর্তমান কনফিগারেশন পরীক্ষা করুন
azd config show

# প্রমাণীকরণ অবস্থা পরীক্ষা করুন
az account show
```

### টেমপ্লেট ডিবাগিং
```bash
# উপলব্ধ টেমপ্লেটগুলোর বিস্তারিত তালিকা
azd template list --output json

# টেমপ্লেটের তথ্য দেখান
azd template show <template-name>

# init চালানোর আগে টেমপ্লেট যাচাই করুন
azd template validate <template-name>
```

## 📁 ফাইল এবং ডিরেক্টরি কমান্ডসমূহ

### প্রকল্প কাঠামো
```bash
# বর্তমান ডিরেক্টরি কাঠামো দেখান
tree /f  # উইন্ডোজ
find . -type f  # লিনাক্স/ম্যাকওএস

# azd প্রকল্পের রুটে যান
cd $(azd root)

# azd কনফিগারেশন ডিরেক্টরি দেখান
echo $AZD_CONFIG_DIR  # সাধারণত ~/.azd
```

## 🎨 আউটপুট ফরম্যাটিং

### JSON আউটপুট
```bash
# স্ক্রিপ্টিংয়ের জন্য JSON আউটপুট পান
azd show --output json
azd env list --output json
azd config show --output json

# jq দিয়ে পার্স করুন
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### টেবিল আউটপুট
```bash
# টেবিল হিসেবে বিন্যাস করুন
azd env list --output table

# ডিপ্লয়কৃত পরিষেবাগুলি দেখুন
azd show --output json | jq '.services | keys'
```

## 🔧 সাধারণ কমান্ড কম্বিনেশনসমূহ

### হেলথ চেক স্ক্রিপ্ট
```bash
#!/bin/bash
# দ্রুত স্বাস্থ্য পরীক্ষা
azd show
azd env get-values
azd monitor --logs
```

### ডিপ্লয়মেন্ট ভ্যালিডেশন
```bash
#!/bin/bash
# ডিপ্লয়মেন্টের পূর্বে যাচাইকরণ
azd show
azd provision --preview  # ডিপ্লয় করার আগে পরিবর্তনগুলো পূর্বদর্শন করুন
az account show
```

### এনভায়রনমেন্ট তুলনা
```bash
#!/bin/bash
# পরিবেশগুলো তুলনা করুন
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### রিসোর্স ক্লিনআপ স্ক্রিপ্ট
```bash
#!/bin/bash
# পুরনো পরিবেশগুলো পরিষ্কার করুন
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 পরিবেশ ভেরিয়েবলসমূহ

### সাধারণ পরিবেশ ভেরিয়েবল
```bash
# Azure কনফিগারেশন
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD কনফিগারেশন
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# অ্যাপ্লিকেশন কনফিগারেশন
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 আপদকালীন কমান্ডসমূহ

### দ্রুত সমাধান
```bash
# প্রমাণীকরণ রিসেট করুন
az account clear
az login

# পরিবেশ জোরপূর্বক রিফ্রেশ করুন
azd env refresh

# সমস্ত সার্ভিস পুনরায় ডিপ্লয় করুন
azd deploy

# ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
azd show --output json
```

### পুনরুদ্ধার কমান্ডসমূহ
```bash
# ব্যর্থ ডিপ্লয়মেন্ট থেকে পুনরুদ্ধার - পরিষ্কার করে পুনরায় ডিপ্লয়
azd down --force --purge
azd up

# শুধুমাত্র অবকাঠামো পুনরায় প্রোভিশন
azd provision

# শুধুমাত্র অ্যাপ্লিকেশন পুনরায় ডিপ্লয়
azd deploy
```

## 💡 প্রো টিপস

### দ্রুত ওয়ার্কফ্লোর জন্য আলিয়াসসমূহ
```bash
# আপনার .bashrc বা .zshrc-এ যোগ করুন
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ফাংশন শর্টকাট
```bash
# দ্রুত পরিবেশ পরিবর্তন
azd-env() {
    azd env select $1 && azd show
}

# পর্যবেক্ষণের সাথে দ্রুত স্থাপন
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# পরিবেশের অবস্থা
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 সহায়তা এবং ডকুমেন্টেশন

### সহায়তা পাওয়া
```bash
# সাধারণ সহায়তা
azd --help
azd help

# কমান্ড-নির্দিষ্ট সহায়তা
azd up --help
azd env --help
azd config --help

# সংস্করণ এবং বিল্ড তথ্য দেখান
azd version
azd version --output json
```

### ডকুমেন্টেশন লিঙ্কসমূহ
```bash
# ব্রাউজারে ডকুমেন্টেশন খুলুন
azd docs

# টেমপ্লেটের ডকুমেন্টেশন দেখান
azd template show <template-name> --docs
```

---

**টিপ**: এই চিটশিটটি বুকমার্ক করুন এবং প্রয়োজনীয় কমান্ড দ্রুত খুঁজে পেতে `Ctrl+F` ব্যবহার করুন!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **পরবর্তী পাঠ**: [Glossary](glossary.md)

---

> **💡 চান আপনার এডিটরে Azure কমান্ড সহায়তা?** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ইনস্টল করুন `npx skills add microsoft/github-copilot-for-azure` দিয়ে — AI, Foundry, deployment, diagnostics, এবং আরও অনেককিছুর জন্য 37টি স্কিল।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# কমান্ড চিট শিট - প্রয়োজনীয় AZD কমান্ড

**সব অধ্যায়ের জন্য দ্রুত রেফারেন্স**
- **📚 কোর্স হোম**: [AZD নবাগতদের জন্য](../README.md)
- **📖 দ্রুত শুরু**: [অধ্যায় ১: ভিত্তি ও দ্রুত শুরু](../README.md#-chapter-1-foundation--quick-start)
- **🤖 এআই কমান্ড**: [অধ্যায় ২: এআই-প্রথম ডেভেলপমেন্ট](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 উন্নত**: [অধ্যায় ৪: ইনফ্রাস্ট্রাকচার অ্যাজ কোড](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ভূমিকা

এই বিস্তৃত চিট শিটটি সবচেয়ে সাধারণভাবে ব্যবহৃত Azure Developer CLI কমান্ডগুলোর জন্য দ্রুত রেফারেন্স প্রদান করে, বিভাগভিত্তিক ও বাস্তব উদাহরণসহ সংগঠিত। azd প্রকল্পে ডেভেলপমেন্ট, সমস্যাসমাধান, এবং দৈনন্দিন অপারেশনের সময় দ্রুত খোঁজার জন্য উপযুক্ত।

## শেখার লক্ষ্য

By using this cheat sheet, you will:
- প্রয়োজনীয় Azure Developer CLI কমান্ড এবং সিনট্যাক্সে তৎক্ষণাত অ্যাক্সেস পাবেন
- কার্যগত বিভাগ ও ব্যবহারের কেস অনুযায়ী কমান্ডের সংগঠন বোঝতে পারবেন
- সাধারণ ডেভেলপমেন্ট এবং ডেপ্লয়মেন্ট পরিস্থিতির জন্য ব্যবহারিক উদাহরণ রেফারেন্স করতে পারবেন
- দ্রুত সমস্যা সমাধানের জন্য ট্রবলশ্যুটিং কমান্ড অ্যাক্সেস করতে পারবেন
- উন্নত কনফিগারেশন এবং কাস্টমাইজেশন অপশন কার্যকরভাবে খুঁজে পেতে পারবেন
- পরিবেশ ব্যবস্থাপনা এবং একাধিক পরিবেশের ওয়ার্কফ্লো সম্পর্কিত কমান্ডগুলো সন্ধান করতে সক্ষম হবেন

## শেখার ফলাফল

With regular reference to this cheat sheet, you will be able to:
- পূর্ণ ডকুমেন্টেশন দেখার দরকার ছাড়াই azd কমান্ড আত্মবিশ্বাসের সাথে চালাতে পারবেন
- উপযুক্ত ডায়াগনস্টিক কমান্ড ব্যবহার করে দ্রুত সাধারণ সমস্যার সমাধান করতে পারবেন
- একাধিক পরিবেশ এবং ডেপ্লয়মেন্ট পরিস্থিতি কার্যকরভাবে পরিচালনা করতে সক্ষম হবেন
- প্রয়োজন অনুযায়ী উন্নত azd বৈশিষ্ট্য এবং কনফিগারেশন অপশন প্রয়োগ করতে পারবেন
- সিস্টেম্যাটিক কমান্ড সিকোয়েন্স ব্যবহার করে ডেপ্লয়মেন্ট সমস্যাগুলো ট্রবলশুট করতে পারবেন
- azd শর্টকাট এবং অপশনগুলো কার্যকরভাবে ব্যবহার করে ওয়ার্কফ্লো অপ্টিমাইজ করতে পারবেন

## শুরু করার কমান্ডসমূহ

### প্রমাণীকরণ
```bash
# AZD ব্যবহার করে Azure-এ লগইন
azd auth login

# Azure CLI-তে লগইন (AZD এটি অন্তর্নিহিতভাবে ব্যবহার করে)
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

### প্রকল্প আরম্ভ
```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টেমপ্লেট থেকে শুরু করুন
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# বর্তমান ডিরেক্টরিতে শুরু করুন
azd init .

# কাস্টম নাম দিয়ে শুরু করুন
azd init --template todo-nodejs-mongo my-awesome-app
```

## মূল ডেপ্লয়মেন্ট কমান্ডসমূহ

### সম্পূর্ণ ডেপ্লয়মেন্ট ওয়ার্কফ্লো
```bash
# সবকিছু ডিপ্লয় করুন (প্রোভিশন + ডিপ্লয়)
azd up

# নিশ্চিতকরণ প্রম্পটগুলো নিষ্ক্রিয় করে ডিপ্লয় করুন
azd up --confirm-with-no-prompt

# নির্দিষ্ট পরিবেশে ডিপ্লয় করুন
azd up --environment production

# কাস্টম প্যারামিটার ব্যবহার করে ডিপ্লয় করুন
azd up --parameter location=westus2
```

### শুধুমাত্র অবকাঠামো
```bash
# Azure রিসোর্স প্রোভিশন করুন
azd provision

# 🧪 অবকাঠামো পরিবর্তনের পূর্বরূপ
azd provision --preview
# কোন রিসোর্স তৈরি/পরিবর্তিত/মুছে ফেলা হবে তার একটি ড্রাই-রান ভিউ দেখায়
# 'terraform plan' বা 'bicep what-if' এর অনুরূপ - চালাতে নিরাপদ, কোনো পরিবর্তন প্রয়োগ করা হয় না
```

### শুধুমাত্র অ্যাপ্লিকেশন
```bash
# অ্যাপ্লিকেশন কোড মোতায়েন করা
azd deploy

# নির্দিষ্ট সার্ভিস মোতায়েন করা
azd deploy --service web
azd deploy --service api

# সমস্ত সার্ভিস মোতায়েন করা
azd deploy --all
```

### বিল্ড এবং প্যাকেজ
```bash
# অ্যাপ্লিকেশন তৈরি করুন
azd package

# নির্দিষ্ট সার্ভিস তৈরি করুন
azd package --service api
```

## 🌍 পরিবেশ ব্যবস্থাপনা

### পরিবেশ অপারেশন
```bash
# সমস্ত পরিবেশ তালিকা করুন
azd env list

# নতুন পরিবেশ তৈরি করুন
azd env new development
azd env new staging --location westus2

# পরিবেশ নির্বাচন করুন
azd env select production

# বর্তমান পরিবেশ দেখান
azd env show

# পরিবেশের অবস্থা হালনাগাদ করুন
azd env refresh
```

### পরিবেশ ভেরিয়েবলসমূহ
```bash
# পরিবেশ ভেরিয়েবল সেট করুন
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# পরিবেশ ভেরিয়েবল পান
azd env get API_KEY

# সমস্ত পরিবেশ ভেরিয়েবল তালিকা করুন
azd env get-values

# পরিবেশ ভেরিয়েবল মুছুন
azd env unset DEBUG
```

## ⚙️ কনফিগারেশন কমান্ডসমূহ

### গ্লোবাল কনফিগারেশন
```bash
# সমস্ত কনফিগারেশন তালিকা করুন
azd config list

# গ্লোবাল ডিফল্ট সেট করুন
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# কনফিগারেশন সরান
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

# সার্ভিস এন্ডপয়েন্টগুলি পান
azd show --output json
```

## 📊 মনিটরিং এবং ডায়াগনস্টিকস

### মনিটরিং ড্যাশবোর্ড
```bash
# Azure পোর্টাল মনিটরিং ড্যাশবোর্ড খুলুন
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
# Azure CLI দিয়ে লগ দেখুন (Container Apps-এর জন্য)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# রিয়েল-টাইমে লগ অনুসরণ করুন
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal থেকে লগ দেখুন
azd monitor --logs
```

### লগ অ্যানালিটিক্স কোয়েরি
```bash
# Azure Portal-এর মাধ্যমে Log Analytics অ্যাক্সেস করুন
azd monitor --logs

# Azure CLI ব্যবহার করে লগগুলি অনুসন্ধান করুন
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ রক্ষণাবেক্ষণ কমান্ডসমূহ

### সাফাই
```bash
# সব Azure রিসোর্স মুছে ফেলুন
azd down

# নিশ্চিতকরণ ছাড়াই জোরপূর্বক মুছে ফেলুন
azd down --force

# সফট-ডিলিট করা রিসোর্সগুলো স্থায়ীভাবে নির্মূল করুন
azd down --purge

# সম্পূর্ণ পরিষ্করণ
azd down --force --purge
```

### আপডেটস
```bash
# azd আপডেট পরীক্ষা করুন
azd version

# বর্তমান সংস্করণ পান
azd version

# বর্তমান কনফিগারেশন দেখুন
azd config list
```

## 🔧 উন্নত কমান্ডসমূহ

### পাইপলাইন এবং CI/CD
```bash
# GitHub Actions কনফিগার করুন
azd pipeline config

# Azure DevOps কনফিগার করুন
azd pipeline config --provider azdo

# পাইপলাইন কনফিগারেশন দেখান
azd pipeline show
```

### অবকাঠামো ব্যবস্থাপনা
```bash
# ইনফ্রাসট্রাকচার টেমপ্লেট তৈরি করুন
azd infra generate

# 🧪 ইনফ্রাসট্রাকচার প্রিভিউ ও পরিকল্পনা
azd provision --preview
# ডিপ্লয় করা ছাড়াই ইনফ্রাসট্রাকচার প্রোভিশনিং অনুকরণ করে
# Bicep/Terraform টেমপ্লেটগুলো বিশ্লেষণ করে এবং প্রদর্শন করে:
# - যোগ করা হবে এমন রিসোর্সসমূহ (সবুজ +)
# - পরিবর্তিত হবে এমন রিসোর্সসমূহ (হলুদ ~)
# - মুছে ফেলা হবে এমন রিসোর্সসমূহ (লাল -)
# নিরাপদভাবে চালানো যায় - Azure পরিবেশে কোনো বাস্তব পরিবর্তন করা হবে না

# azure.yaml থেকে ইনফ্রাসট্রাকচার সংশ্লেষণ করুন
azd infra synth
```

### প্রকল্প তথ্য
```bash
# প্রকল্পের অবস্থা এবং এন্ডপয়েন্ট দেখান
azd show

# প্রকল্পের বিস্তারিত তথ্য JSON হিসেবে দেখান
azd show --output json

# সার্ভিসের এন্ডপয়েন্টগুলো পান
azd show --output json | jq '.services'
```

## 🎯 দ্রুত ওয়ার্কফ্লোসমূহ

### ডেভেলপমেন্ট ওয়ার্কফ্লো
```bash
# নতুন প্রকল্প শুরু করুন
azd init --template todo-nodejs-mongo
cd my-project

# ডেভেলপমেন্টে ডেপ্লয় করুন
azd env new dev
azd up

# পরিবর্তন করুন এবং পুনরায় ডেপ্লয় করুন
azd deploy

# মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor --live
```

### মাল্টি-এনভায়রনমেন্ট ওয়ার্কফ্লো
```bash
# পরিবেশগুলো সেট আপ করুন
azd env new dev
azd env new staging  
azd env new production

# ডেভ-এ ডেপ্লয় করুন
azd env select dev
azd up

# পরীক্ষা করে স্টেজিং-এ উন্নীত করুন
azd env select staging
azd up

# প্রোডাকশনে ডেপ্লয় করুন
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
azd config list

# লগের জন্য মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor --logs

# রিসোর্সের অবস্থা পরীক্ষা করুন
azd show --output json
```

## 🔍 ডিবাগিং কমান্ডসমূহ

### ডিবাগ তথ্য
```bash
# ডিবাগ আউটপুট সক্রিয় করুন
export AZD_DEBUG=true
azd <command> --debug

# পরিষ্কার আউটপুটের জন্য টেলিমেট্রি নিষ্ক্রিয় করুন
export AZD_DISABLE_TELEMETRY=true

# বর্তমান কনফিগারেশন পরীক্ষা করুন
azd config list

# প্রমাণীকরণ অবস্থা পরীক্ষা করুন
az account show
```

### টেমপ্লেট ডিবাগিং
```bash
# উপলব্ধ টেমপ্লেটগুলো বিস্তারিতসহ তালিকাভুক্ত করুন
azd template list --output json

# টেমপ্লেটের তথ্য দেখান
azd template show <template-name>

# init এর আগে টেমপ্লেট যাচাই করুন
azd template validate <template-name>
```

## 📁 ফাইল ও ডিরেক্টরি কমান্ডসমূহ

### প্রকল্প কাঠামো
```bash
# বর্তমান ডিরেক্টরি কাঠামো দেখান
tree /f  # উইন্ডোজ
find . -type f  # লিনাক্স/ম্যাকওএস

# azd প্রকল্পের মূল ডিরেক্টরিতে যান
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
azd config list --output json

# jq দিয়ে পার্স করুন
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### টেবিল আউটপুট
```bash
# টেবিল হিসেবে বিন্যাস করুন
azd env list --output table

# ডিপ্লয় করা সার্ভিসগুলো দেখুন
azd show --output json | jq '.services | keys'
```

## 🔧 সাধারণ কমান্ড কম্বিনেশনসমূহ

### হেলথ চেক স্ক্রিপ্ট
```bash
#!/bin/bash
# দ্রুত স্বাস্থ্য পরীক্ষা
azd show
azd env show
azd monitor --logs
```

### ডেপ্লয়মেন্ট ভ্যালিডেশন
```bash
#!/bin/bash
# ডিপ্লয়মেন্টের আগে যাচাই
azd show
azd provision --preview  # ডিপ্লয় করার আগে পরিবর্তনগুলোর পূর্বরূপ দেখুন
az account show
```

### পরিবেশ তুলনা
```bash
#!/bin/bash
# পরিবেশগুলিকে তুলনা করুন
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### রিসোর্স ক্লিনআপ স্ক্রিপ্ট
```bash
#!/bin/bash
# পুরানো পরিবেশগুলো পরিষ্কার করুন
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 পরিবেশ ভেরিয়েবলসমূহ

### সাধারণ পরিবেশ ভেরিয়েবলসমূহ
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

## 🚨 জরুরি কমান্ডসমূহ

### দ্রুত সমাধান
```bash
# প্রমাণীকরণ পুনরায় সেট করুন
az account clear
az login

# পরিবেশ জোর করে রিফ্রেশ করুন
azd env refresh

# সমস্ত সেবা পুনরায় ডিপ্লয় করুন
azd deploy

# ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
azd show --output json
```

### পুনরুদ্ধার কমান্ডসমূহ
```bash
# ব্যর্থ ডিপ্লয়মেন্ট থেকে পুনরুদ্ধার - পরিষ্কার করে পুনরায় ডিপ্লয় করা
azd down --force --purge
azd up

# শুধুমাত্র অবকাঠামো পুনরায় প্রদান
azd provision

# শুধুমাত্র অ্যাপ্লিকেশন পুনরায় ডিপ্লয় করা
azd deploy
```

## 💡 পেশাদার টিপস

### দ্রুত ওয়ার্কফ্লোর জন্য আলিয়াস
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

# মনিটরিং সহ দ্রুত ডিপ্লয়মেন্ট
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# পরিবেশের অবস্থা
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 সহায়তা ও ডকুমেন্টেশন

### সহায়তা নেওয়া
```bash
# সাধারণ সাহায্য
azd --help
azd help

# কমান্ড-নির্দিষ্ট সাহায্য
azd up --help
azd env --help
azd config --help

# সংস্করণ ও বিল্ড তথ্য দেখান
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

**টিপ**: এই চিট শিটটি বুকমার্ক করুন এবং যে কমান্ডগুলো আপনাকে লাগবে দ্রুত খুঁজে পেতে `Ctrl+F` ব্যবহার করুন!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [প্রিফ্লাইট চেকস](../docs/pre-deployment/preflight-checks.md)
- **পরবর্তী পাঠ**: [শব্দকোষ](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকারোক্তি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতা নিশ্চিত করার চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল ভাষায় থাকা মূল নথিটাকেই প্রামাণিক উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ পরামর্শযোগ্য। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
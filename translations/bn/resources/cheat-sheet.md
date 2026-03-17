# Command Cheat Sheet - গুরুত্বপূর্ণ AZD কমান্ডসমূহ

**সব অধ্যায়ের জন্য দ্রুত রেফারেন্স**
- **📚 Course Home**: [AZD শুরুকারীদের জন্য](../README.md)
- **📖 Quick Start**: [অধ্যায় ১: ভিত্তি ও দ্রুত শুরু](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [অধ্যায় ২: AI-প্রথম উন্নয়ন](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [অধ্যায় ৪: কোড হিসেবে অবকাঠামো](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ভূমিকা

এই বিস্তৃত চিটশিটটি সবচেয়ে সাধারণভাবে ব্যবহৃত Azure Developer CLI কমান্ডগুলোর দ্রুত রেফারেন্স প্রদান করে, বিভাগ অনুযায়ী বাস্তব উদাহরণ সহ সংগৃহীত। azd প্রকল্পগুলোর সাথে বিকাশ, সমস্যা সমাধান, এবং দৈনন্দিন অপারেশনের সময় দ্রুত খোঁজ করার জন্য এটি উপযুক্ত।

## শেখার লক্ষ্য

এই চিটশিট ব্যবহার করে, আপনি:
- গুরুত্বপূর্ণ Azure Developer CLI কমান্ড এবং সিনট্যাক্স দ্রুত অ্যাক্সেস করতে পারবেন
- কার্যকরী ক্যাটাগরি এবং ব্যবহারের ক্ষেত্রে অনুযায়ী কমান্ড সংগঠিত থাকে বোঝা যাবে
- সাধারণ উন্নয়ন ও ডিপ্লয়মেন্ট দৃশ্যের জন্য ব্যবহারিক উদাহরণ রেফারেন্স পাবেন
- দ্রুত সমস্যার সমাধানের জন্য ট্রাবলশুটিং কমান্ডগুলোতে অ্যাক্সেস পাবেন
- উন্নত কনফিগারেশন এবং কাস্টমাইজেশন অপশনগুলো দক্ষভাবে খুঁজে পাবেন
- পরিবেশ ব্যবস্থাপনা এবং বহু-পরিবেশ কর্মপ্রবাহ কমান্ডগুলো সনাক্ত করতে পারবেন

## শেখার ফলাফল

নিয়মিত এই চিটশিট রেফারেন্স করলে, আপনি সক্ষম হবেন:
- পূর্ণ ডকুমেন্টেশন ছাড়াই আত্মবিশ্বাসের সাথে azd কমান্ড চালানো
- উপযুক্ত ডায়াগনস্টিক কমান্ড ব্যবহার করে সাধারণ সমস্যা দ্রুত সমাধান করা
- বহু পরিবেশ এবং ডিপ্লয়মেন্ট দৃশ্য দক্ষতার সাথে পরিচালনা করা
- প্রয়োজনমত উন্নত azd বৈশিষ্ট্য এবং কনফিগারেশন অপশন প্রয়োগ করা
- সিস্টেম্যাটিক কমান্ড সিকোয়েন্স ব্যবহার করে ডিপ্লয়মেন্ট সমস্যা ট্রাবলশুট করা
- azd শর্টকাট এবং অপশনগুলোর কার্যকর ব্যবহারের মাধ্যমে ওয়ার্কফ্লো অপ্টিমাইজ করা

## শুরু করার কমান্ডসমূহ

### প্রমাণীকরণ
```bash
# AZD এর মাধ্যমে Azure-এ লগইন
azd auth login

# Azure CLI-এ লগইন (AZD পেছনে এটি ব্যবহার করে)
az login

# বর্তমান অ্যাকাউন্ট পরীক্ষা করুন
az account show

# ডিফল্ট সাবস্ক্রিপশন সেট করুন
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD থেকে লগআউট
azd auth logout

# Azure CLI থেকে লগআউট
az logout
```

### প্রকল্প আরম্ভ
```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টেমপ্লেট থেকে শুরু করুন
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# বর্তমান ডিরেক্টরিতে ইনিশিয়ালাইজ করুন
azd init .

# কাস্টম নাম দিয়ে ইনিশিয়ালাইজ করুন
azd init --template todo-nodejs-mongo my-awesome-app
```

## মূল ডিপ্লয়মেন্ট কমান্ডসমূহ

### সম্পূর্ণ ডিপ্লয়মেন্ট কর্মপ্রবাহ
```bash
# সবকিছু ডেপ্লয় করুন (প্রোভিশন + ডেপ্লয়)
azd up

# নিশ্চিতকরণ প্রম্পট বন্ধ করে ডেপ্লয় করুন
azd up --confirm-with-no-prompt

# নির্দিষ্ট পরিবেশে ডেপ্লয় করুন
azd up --environment production

# কাস্টম প্যারামিটার ব্যবহার করে ডেপ্লয় করুন
azd up --parameter location=westus2
```

### শুধুমাত্র অবকাঠামো
```bash
# Azure রিসোর্স তৈরি করুন
azd provision

# 🧪 অবকাঠামো পরিবর্তনের প্রাকদর্শন
azd provision --preview
# কোন সংস্থান তৈরি/পরিবর্তিত/মুছে ফেলা হবে তা একটি ড্রাই-রানের ভিউ হিসেবে দেখায়
# 'terraform plan' বা 'bicep what-if' এর মতো — চালানো নিরাপদ, কোনো পরিবর্তন প্রয়োগ করা হবে না
```

### শুধুমাত্র অ্যাপ্লিকেশন
```bash
# অ্যাপ্লিকেশন কোড ডিপলয় করুন
azd deploy

# নির্দিষ্ট সেবা ডিপলয় করুন
azd deploy --service web
azd deploy --service api

# সমস্ত সেবা ডিপলয় করুন
azd deploy --all
```

### বিল্ড এবং প্যাকেজ
```bash
# অ্যাপ্লিকেশন তৈরি করুন
azd package

# নির্দিষ্ট সেবা তৈরি করুন
azd package --service api
```

## 🌍 পরিবেশ ব্যবস্থাপনা

### পরিবেশ অপারেশনস
```bash
# সমস্ত পরিবেশ তালিকাভুক্ত করুন
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

### পরিবেশ ভ্যারিয়েবলস
```bash
# পরিবেশ ভেরিয়েবল সেট করুন
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# পরিবেশ ভেরিয়েবল পান
azd env get API_KEY

# সমস্ত পরিবেশ ভেরিয়েবল তালিকা করুন
azd env get-values

# পরিবেশ ভেরিয়েবল মুছে ফেলুন
azd env unset DEBUG
```

## ⚙️ কনফিগারেশন কমান্ডসমূহ

### বৈশ্বিক কনফিগারেশন
```bash
# সমস্ত কনফিগারেশন তালিকাভুক্ত করুন
azd config list

# গ্লোবাল ডিফল্ট নির্ধারণ করুন
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# কনফিগারেশন অপসারণ করুন
azd config unset defaults.location

# সমস্ত কনফিগারেশন পুনরায় সেট করুন
azd config reset
```

### প্রকল্প কনফিগারেশন
```bash
# azure.yaml যাচাই করুন
azd config validate

# প্রকল্পের তথ্য দেখান
azd show

# সার্ভিসের এন্ডপয়েন্টগুলো পান
azd show --output json
```

## 📊 মনিটরিং এবং ডায়াগনস্টিকস

### মনিটরিং ড্যাশবোর্ড
```bash
# Azure পোর্টালের মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor

# Application Insights-এর লাইভ মেট্রিক্স খুলুন
azd monitor --live

# Application Insights-এর লগস ব্লেড খুলুন
azd monitor --logs

# Application Insights-এর ওভারভিউ খুলুন
azd monitor --overview
```

### কন্টেইনার লগ দেখা
```bash
# Azure CLI-এর মাধ্যমে লগ দেখুন (Container Apps-এর জন্য)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# রিয়েল-টাইমে লগ অনুসরণ করুন
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal থেকে লগ দেখুন
azd monitor --logs
```

### লগ অ্যানালিটিক্স কোয়েরি
```bash
# Azure পোর্টালের মাধ্যমে লগ অ্যানালিটিক্সে প্রবেশ করুন
azd monitor --logs

# Azure CLI ব্যবহার করে লগ কোয়েরি করুন
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ রক্ষণাবেক্ষণ কমান্ডসমূহ

### পরিষ্কার
```bash
# সমস্ত Azure রিসোর্স সরান
azd down

# নিশ্চিতকরণ ছাড়া জোরপূর্বক মুছে ফেলুন
azd down --force

# সফট-ডিলিটেড রিসোর্সগুলো স্থায়ীভাবে মুছে ফেলুন
azd down --purge

# সম্পূর্ণ পরিষ্কার
azd down --force --purge
```

### হালনাগাদ
```bash
# azd আপডেট আছে কিনা পরীক্ষা করুন
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
# ইনফ্রাস্ট্রাকচার টেমপ্লেট তৈরি করুন
azd infra generate

# 🧪 ইনফ্রাস্ট্রাকচার পূর্বদর্শন ও পরিকল্পনা
azd provision --preview
# ডেপ্লয় না করে ইনফ্রাস্ট্রাকচার প্রোভিশনিং অনুকরণ করে
# Bicep/Terraform টেমপ্লেট বিশ্লেষণ করে এবং দেখায়:
# - যোগ করা হবে এমন রিসোর্স (সবুজ +)
# - পরিবর্তন করা হবে এমন রিসোর্স (হলুদ ~)
# - মুছে ফেলা হবে এমন রিসোর্স (লাল -)
# রান করা নিরাপদ - Azure পরিবেশে কোনো বাস্তব পরিবর্তন করা হয় না

# azure.yaml থেকে ইনফ্রাস্ট্রাকচার তৈরি করুন
azd infra synth
```

### প্রকল্প তথ্য
```bash
# প্রকল্পের অবস্থা এবং এন্ডপয়েন্ট দেখান
azd show

# প্রকল্পের বিস্তারিত তথ্য JSON আকারে দেখান
azd show --output json

# সার্ভিসের এন্ডপয়েন্টগুলো পান
azd show --output json | jq '.services'
```

## 🤖 AI ও এক্সটেনশন্স কমান্ডসমূহ

### AZD এক্সটেনশন্স
```bash
# উপলব্ধ সব এক্সটেনশন তালিকাভুক্ত করুন (এআই সহ)
azd extension list

# Foundry agents এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# ইনস্টল করা সব এক্সটেনশন আপগ্রেড করুন
azd extension upgrade --all
```

### AI এজেন্ট কমান্ডসমূহ
```bash
# ম্যানিফেস্ট থেকে একটি এজেন্ট প্রকল্প আরম্ভ করুন
azd ai agent init -m <manifest-path-or-uri>

# নির্দিষ্ট Foundry প্রকল্প লক্ষ্য করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# এজেন্টের সোর্স ডিরেক্টরি নির্দিষ্ট করুন
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# একটি হোস্টিং লক্ষ্য নির্বাচন করুন
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP সার্ভার (আলফা)
```bash
# আপনার প্রকল্পের জন্য MCP সার্ভার চালু করুন
azd mcp start

# MCP অপারেশনের জন্য টুলের সম্মতি পরিচালনা করুন
azd mcp consent
```

### অবকাঠামো জেনারেশন
```bash
# আপনার প্রকল্প সংজ্ঞা থেকে IaC ফাইল তৈরি করুন
azd infra generate

# azure.yaml থেকে অবকাঠামো সংশ্লেষণ করুন
azd infra synth
```

---

## 🎯 দ্রুত ওয়ার্কফ্লো

### উন্নয়ন ওয়ার্কফ্লো
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

### বহু-পরিবেশ ওয়ার্কফ্লো
```bash
# পরিবেশগুলো সেট আপ করুন
azd env new dev
azd env new staging  
azd env new production

# উন্নয়ন পরিবেশে স্থাপন করুন
azd env select dev
azd up

# পরীক্ষা করে স্টেজিং-এ উন্নীত করুন
azd env select staging
azd up

# প্রোডাকশন পরিবেশে স্থাপন করুন
azd env select production
azd up
```

### সমস্যা সমাধান ওয়ার্কফ্লো
```bash
# ডিবাগ মোড সক্ষম করুন
export AZD_DEBUG=true

# ডেপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
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

# প্রমাণীকরণের অবস্থা পরীক্ষা করুন
az account show
```

### টেমপ্লেট ডিবাগিং
```bash
# বিস্তারিতসহ উপলব্ধ টেমপ্লেটগুলি তালিকাভুক্ত করুন
azd template list --output json

# টেমপ্লেটের তথ্য দেখান
azd template show <template-name>

# init করার আগে টেমপ্লেট যাচাই করুন
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
# স্ক্রিপ্টিং-এর জন্য JSON আউটপুট নিন
azd show --output json
azd env list --output json
azd config list --output json

# jq দিয়ে বিশ্লেষণ করুন
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### টেবিল আউটপুট
```bash
# টেবিল আকারে ফরম্যাট করুন
azd env list --output table

# ডিপ্লয় করা পরিষেবাগুলি দেখুন
azd show --output json | jq '.services | keys'
```

## 🔧 সাধারণ কমান্ড সংমিশ্রণ

### হেল্থ চেক স্ক্রিপ্ট
```bash
#!/bin/bash
# দ্রুত স্বাস্থ্য পরীক্ষা
azd show
azd env show
azd monitor --logs
```

### ডিপ্লয়মেন্ট যাচাই
```bash
#!/bin/bash
# ডেপ্লয়মেন্টের পূর্বে যাচাইকরণ
azd show
azd provision --preview  # ডেপ্লয় করার আগে পরিবর্তনসমূহের প্রাকদর্শন
az account show
```

### পরিবেশ তুলনা
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

## 📝 পরিবেশ ভ্যারিয়েবলস

### সাধারণ পরিবেশ ভ্যারিয়েবলসমূহ
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
# প্রমাণীকরণ রিসেট করুন
az account clear
az login

# পরিবেশ জোরপূর্বক হালনাগাদ করুন
azd env refresh

# সমস্ত সার্ভিস পুনরায় স্থাপন করুন
azd deploy

# ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
azd show --output json
```

### পুনরুদ্ধার কমান্ডসমূহ
```bash
# বিফল ডিপ্লয়মেন্ট থেকে পুনরুদ্ধার - পরিষ্কার করে পুনরায় ডিপ্লয়
azd down --force --purge
azd up

# শুধুমাত্র অবকাঠামো পুনরায় প্রোভিশন
azd provision

# শুধুমাত্র অ্যাপ্লিকেশন পুনরায় ডিপ্লয়
azd deploy
```

## 💡 পেশাদার টিপস

### দ্রুত কর্মপ্রবাহের জন্য আলিয়াস
```bash
# আপনার .bashrc বা .zshrc-এ যোগ করুন
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ফাংশন শর্টকাটস
```bash
# দ্রুত পরিবেশ পরিবর্তন
azd-env() {
    azd env select $1 && azd show
}

# নিরীক্ষণের সাথে দ্রুত ডেপ্লয়মেন্ট
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

## 📖 সাহায্য এবং ডকুমেন্টেশন

### সাহায্য নেওয়া
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

# টেমপ্লেট ডকুমেন্টেশন দেখান
azd template show <template-name> --docs
```

---

**টিপ**: এই চিটশিটটি বুকমার্ক করুন এবং দ্রুত আপনার প্রয়োজনীয় কমান্ড খুঁজতে `Ctrl+F` ব্যবহার করুন!

---

**নেভিগেশন**
- **Previous Lesson**: [প্রিফ্লাইট চেকস](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [শব্দকোষ](glossary.md)

---

> **💡 আপনার এডিটরে Azure কমান্ড সহায়তা চান?** ইনস্টল করুন [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) `npx skills add microsoft/github-copilot-for-azure` দিয়ে — AI, Foundry, ডিপ্লয়মেন্ট, ডায়াগনস্টিকস এবং আরও অনেক কিছুর জন্য 37টি স্কিল।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ডিসক্লেইমার:
এই দলিলটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত করা হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, তবে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল দলিলটি তার নিজ ভাষায় প্রামাণিক উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারের ফলে সংঘটিত কোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
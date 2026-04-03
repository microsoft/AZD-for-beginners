# কমান্ড চিট শিট - অত্যাবশ্যক AZD কমান্ডস

**সমস্ত অধ্যায়ের দ্রুত রেফারেন্স**
- **📚 কোর্স হোম**: [AZD For Beginners](../README.md)
- **📖 দ্রুত শুরু**: [অধ্যায় ১: ফাউন্ডেশন ও দ্রুত শুরু](../README.md#-chapter-1-foundation--quick-start)
- **🤖 এআই কমান্ডস**: [অধ্যায় ২: এআই-প্রথম ডেভেলপমেন্ট](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 উন্নত**: [অধ্যায় ৪: কোড হিসেবে অবকাঠামো](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## পরিচিতি

এই বিস্তৃত চিট শিটটি সবচেয়ে সাধারণভাবে ব্যবহৃত Azure Developer CLI কমান্ডগুলি দ্রুত রেফারেন্সের জন্য প্রদান করে, কাজ অনুযায়ী বিভাগভুক্ত ও ব্যবহারিক উদাহরণের সাথে সংগৃহীত। azd প্রকল্পের ডেভেলপমেন্ট, সমস্যার সমাধান ও দৈনন্দিন অপারেশনের সময়ে দ্রুত নজরদারির জন্য আদর্শ।

## শিক্ষণ লক্ষ্য

এই চিট শিট ব্যবহার করে আপনি:
- অত্যাবশ্যক Azure Developer CLI কমান্ড ও সিনট্যাক্স তৎক্ষণাৎ অ্যাক্সেস করতে পারবেন
- কার্যকর বিভাগের মাধ্যমে কমান্ড সংগঠন বোঝা যাবে
- সাধারণ ডেভেলপমেন্ট ও ডিপ্লয়মেন্ট পরিস্থিতির জন্য ব্যবহারিক উদাহরণ রেফারেন্স করতে পারবেন
- দ্রুত সমস্যা সমাধানের জন্য ডায়াগনস্টিক কমান্ড অ্যাক্সেস করতে পারবেন
- উন্নত কনফিগারেশন ও কাস্টমাইজেশন বিকল্প সুষ্ঠুভাবে খুঁজে পাবেন
- পরিবেশ ব্যবস্থাপনা ও বহুমাত্রিক পরিবেশ ওয়ার্কফ্লো কমান্ডস পেতে সক্ষম হবেন

## শিক্ষণ ফলাফল

নিয়মিত এই চিট শিট রেফারেন্স করার মাধ্যমে আপনি সক্ষম হবেন:
- পূর্ণ ডকুমেন্টেশন ছাড়াই আত্মবিশ্বাসের সাথে azd কমান্ডস চালাতে
- উপযুক্ত ডায়াগনস্টিক কমান্ড ব্যবহার করে সাধারণ সমস্যা দ্রুত সমাধান করতে
- একাধিক পরিবেশ ও ডিপ্লয়মেন্ট পরিস্থিতি দক্ষতার সাথে পরিচালনা করতে
- প্রয়োজনে উন্নত azd ফিচার ও কনফিগারেশন বিকল্প প্রয়োগ করতে
- পদ্ধতিগত কমান্ড সিকোয়েন্স ব্যবহার করে ডিপ্লয়মেন্ট সমস্যা সমাধান করতে
- azd শর্টকাট ও বিকল্পের কার্যকর ব্যবহারে ওয়ার্কফ্লো অপটিমাইজ করতে

## শুরু করার কমান্ডস

### প্রমাণীকরণ
```bash
# AZD এর মাধ্যমে Azure এ লগইন করুন
azd auth login

# Azure CLI এ লগইন করুন (AZD এর অন্তর্গত এইটি ব্যবহার করে)
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

### প্রকল্প সূচনা
```bash
# উপলব্ধ টেমপ্লেট ব্রাউজ করুন
azd template list

# টেমপ্লেট থেকে শুরু করুন
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# বর্তমান ডিরেক্টরিতে শুরু করুন
azd init .

# কাস্টম নাম সহ শুরু করুন
azd init --template todo-nodejs-mongo my-awesome-app
```

## মূল ডিপ্লয়মেন্ট কমান্ডস

### সম্পূর্ণ ডিপ্লয়মেন্ট ওয়ার্কফ্লো
```bash
# সবকিছু স্থাপন করুন (প্রভিশন + ডিপ্লয়)
azd up

# নিশ্চিতকরণ প্রম্পটগুলি নিষ্ক্রিয় করে ডিপ্লয় করুন
azd up --confirm-with-no-prompt

# নির্দিষ্ট পরিবেশে ডিপ্লয় করুন
azd up --environment production

# কাস্টম প্যারামিটার সহ ডিপ্লয় করুন
azd up --parameter location=westus2
```

### শুধুমাত্র অবকাঠামো
```bash
# Azure সম্পদ সরবরাহ করুন
azd provision

# 🧪 অবকাঠামো পরিবর্তনের পূর্বরূপ দেখুন
azd provision --preview
# প্রদর্শন করে কোন কোন সম্পদ তৈরি/পরিবর্তিত/মুছে ফেলা হবে তার একটি ড্রাই-রান ভিউ
# 'terraform plan' বা 'bicep what-if' এর মত - চালাতে নিরাপদ, কোনো পরিবর্তন প্রয়োগ হয় না
```

### শুধুমাত্র অ্যাপ্লিকেশন
```bash
# অ্যাপ্লিকেশন কোড স্থাপন করুন
azd deploy

# নির্দিষ্ট সেবা স্থাপন করুন
azd deploy --service web
azd deploy --service api

# সমস্ত সেবা স্থাপন করুন
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

### পরিবেশ ক্রিয়াকলাপ
```bash
# সমস্ত পরিবেশের তালিকা করুন
azd env list

# নতুন পরিবেশ তৈরি করুন
azd env new development
azd env new staging --location westus2

# পরিবেশ নির্বাচন করুন
azd env select production

# উপলব্ধ পরিবেশগুলি দেখান
azd env list

# পরিবেশের অবস্থা রিফ্রেশ করুন
azd env refresh
```

### পরিবেশ ভেরিয়েবলস
```bash
# পরিবেশ ভেরিয়েবল সেট করুন
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# পরিবেশ ভেরিয়েবল গ্রহণ করুন
azd env get API_KEY

# সমস্ত পরিবেশ ভেরিয়েবল তালিকাভুক্ত করুন
azd env get-values

# পরিবেশ ভেরিয়েবল অপসারণ করুন
azd env unset DEBUG
```

## ⚙️ কনফিগারেশন কমান্ডস

### গ্লোবাল কনফিগারেশন
```bash
# সমস্ত কনফিগারেশন তালিকাভুক্ত করুন
azd config show

# গ্লোবাল ডিফল্ট সেট করুন
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# কনফিগারেশন মুছে দিন
azd config unset defaults.location

# সমস্ত কনফিগারেশন রিসেট করুন
azd config reset
```

### প্রকল্প কনফিগারেশন
```bash
# azure.yaml যাচাই করুন
azd config validate

# প্রকল্পের তথ্য প্রদর্শন করুন
azd show

# সেবার এন্ডপয়েন্টগুলি পান
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

### কন্টেইনার লগ দেখছি
```bash
# Azure CLI এর মাধ্যমে লগগুলি দেখুন (কন্টেইনার অ্যাপস এর জন্য)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# লগগুলি রিয়েল-টাইমে অনুসরণ করুন
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure পোর্টাল থেকে লগগুলি দেখুন
azd monitor --logs
```

### লগ অ্যানালিটিক্স কুয়েরি
```bash
# Azure পোর্টালের মাধ্যমে লগ বিশ্লেষণ অ্যাক্সেস করুন
azd monitor --logs

# Azure CLI ব্যবহার করে লগ প্রশ্ন করুন
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ রক্ষণাবেক্ষণ কমান্ডস

### ক্লিনআপ
```bash
# সমস্ত Azure রিসোর্স মুছে ফেলুন
azd down

# নিশ্চিতকরণের without জোরপূর্বক মুছুন
azd down --force

# সফট-ডিলিটেড রিসোর্সগুলি পরিস্কার করুন
azd down --purge

# সম্পূর্ণ পরিষ্কারকরণ
azd down --force --purge
```

### আপডেটস
```bash
# azd আপডেটের জন্য পরীক্ষা করুন
azd version

# বর্তমান সংস্করণ পান
azd version

# বর্তমান কনফিগারেশন দেখুন
azd config show
```

## 🔧 উন্নত কমান্ডস

### পাইপলাইন এবং CI/CD
```bash
# গিটহাব অ্যাকশনস কনফিগার করুন
azd pipeline config

# অ্যাজিউর ডেভঅপস কনফিগার করুন
azd pipeline config --provider azdo

# পাইপলাইনের কনফিগারেশন দেখান
azd pipeline show
```

### অবকাঠামো ব্যবস্থাপনা
```bash
# অবকাঠামো টেমপ্লেট তৈরি করুন
azd infra generate

# 🧪 অবকাঠামো প্রিভিউ এবং পরিকল্পনা
azd provision --preview
# মোতায়েন ছাড়া অবকাঠামো প্রোভিশনিং অনুকরণ করে
# Bicep/Terraform টেমপ্লেট বিশ্লেষণ করে এবং দেখায়:
# - যোগ করার জন্য রিসোর্স (সবুজ +)
# - সংশোধনের জন্য রিসোর্স (হলুদ ~)
# - মুছে ফেলার জন্য রিসোর্স (লাল -)
# চালানোর জন্য নিরাপদ - Azure পরিবেশে কোনো বাস্তব পরিবর্তন তৈরি হয়নি

# azure.yaml থেকে অবকাঠামো সংশ্লেষণ করুন
azd infra synth
```

### প্রকল্প তথ্য
```bash
# প্রকল্পের অবস্থা এবং এন্ডপয়েন্ট দেখান
azd show

# JSON হিসাবে বিস্তারিত প্রকল্প তথ্য দেখান
azd show --output json

# সার্ভিস এন্ডপয়েন্টগুলি পান
azd show --output json | jq '.services'
```

## 🤖 এআই ও এক্সটেনশন্স কমান্ডস

### AZD এক্সটেনশন্স
```bash
# সমস্ত উপলব্ধ এক্সটেনশান তালিকা করুন (এআই সহ)
azd extension list

# ফাউন্ড্রি এজেন্টস এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# সমস্ত ইনস্টলকৃত এক্সটেনশন আপগ্রেড করুন
azd extension upgrade --all
```

### AI এজেন্ট কমান্ডস
```bash
# একটি ম্যানিফেস্ট থেকে একটি এজেন্ট প্রকল্প শুরু করুন
azd ai agent init -m <manifest-path-or-uri>

# একটি নির্দিষ্ট ফাউন্ড্রি প্রকল্পের লক্ষ্য নির্ধারণ করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# এজেন্ট সোর্স ডিরেক্টরি নির্দিষ্ট করুন
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# একটি হোস্টিং লক্ষ্য নির্বাচন করুন
azd ai agent init -m agent-manifest.yaml --host containerapp
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

# azure.yaml থেকে অবকাঠামো সংশ্লেষণ করুন
azd infra synth
```

---

## 🎯 দ্রুত ওয়ার্কফ্লো

### ডেভেলপমেন্ট ওয়ার্কফ্লো
```bash
# নতুন প্রকল্প শুরু করুন
azd init --template todo-nodejs-mongo
cd my-project

# উন্নয়নে স্থাপন করুন
azd env new dev
azd up

# পরিবর্তন করুন এবং পুনরায় স্থাপন করুন
azd deploy

# মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor --live
```

### বহুমাত্রিক পরিবেশ ওয়ার্কফ্লো
```bash
# পরিবেশ সেট আপ করুন
azd env new dev
azd env new staging  
azd env new production

# ডেভেলপমেন্টে স্থাপন করুন
azd env select dev
azd up

# পরীক্ষা করুন এবং স্টেজিংয়ে উন্নীত করুন
azd env select staging
azd up

# প্রোডাকশনে স্থাপন করুন
azd env select production
azd up
```

### সমস্যা সমাধান ওয়ার্কফ্লো
```bash
# ডিবাগ মোড সক্রিয় করুন
export AZD_DEBUG=true

# ডিপ্লয়মেন্ট অবস্থা যাচাই করুন
azd show

# কনফিগারেশন যাচাই করুন
azd config show

# লগের জন্য মনিটরিং ড্যাশবোর্ড খুলুন
azd monitor --logs

# রিসোর্সের অবস্থা যাচাই করুন
azd show --output json
```

## 🔍 ডিবাগিং কমান্ডস

### ডিবাগ তথ্য
```bash
# ডিবাগ আউটপুট সক্ষম করুন
export AZD_DEBUG=true
azd <command> --debug

# পরিষ্কার আউটপুটের জন্য টেলিমেট্রি অক্ষম করুন
export AZD_DISABLE_TELEMETRY=true

# বর্তমান কনফিগারেশন পরীক্ষা করুন
azd config show

# প্রমাণীকরণ অবস্থা পরীক্ষা করুন
az account show
```

### টেমপ্লেট ডিবাগিং
```bash
# উপলব্ধ টেমপ্লেটগুলি বিবরণ সহ তালিকাভুক্ত করুন
azd template list --output json

# টেমপ্লেট তথ্য দেখান
azd template show <template-name>

# ইনিশিয়ালাইজ করার আগে টেমপ্লেট যাচাই করুন
azd template validate <template-name>
```

## 📁 ফাইল এবং ডিরেক্টরি কমান্ডস

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
azd config show --output json

# jq দিয়ে পার্স করুন
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### টেবিল আউটপুট
```bash
# টেবিল হিসাবে ফরম্যাট করুন
azd env list --output table

# মোতায়েনকৃত পরিষেবাগুলি দেখুন
azd show --output json | jq '.services | keys'
```

## 🔧 সাধারণ কমান্ড কম্বিনেশনস

### স্বাস্থ্য পরীক্ষা স্ক্রিপ্ট
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
# প্রাক-প্রয়োগ যাচাই
azd show
azd provision --preview  # প্রয়োগের আগে পরিবর্তনগুলি প্রিভিউ করুন
az account show
```

### পরিবেশ তুলনা
```bash
#!/bin/bash
# পরিবেশের তুলনা করুন
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### রিসোর্স ক্লিনআপ স্ক্রিপ্ট
```bash
#!/bin/bash
# পুরোনো পরিবেশ পরিষ্কার করুন
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 পরিবেশ ভেরিয়েবলস

### সাধারণ পরিবেশ ভেরিয়েবলস
```bash
# এজুর কনফিগারেশন
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

## 🚨 জরুরি কমান্ডস

### দ্রুত সমাধান
```bash
# প্রমাণীকরণ রিসেট করুন
az account clear
az login

# পরিবেশ জোরপূর্বক রিফ্রেশ করুন
azd env refresh

# সমস্ত সেবা পুনরায় ডিপ্লয় করুন
azd deploy

# ডিপ্লয়মেন্ট স্থিতি পরীক্ষা করুন
azd show --output json
```

### পুনরুদ্ধার কমান্ডস
```bash
# ব্যর্থ স্থাপনা থেকে পুনরুদ্ধার করুন - পরিষ্কার করুন এবং পুনরায় স্থাপন করুন
azd down --force --purge
azd up

# শুধুমাত্র অবকাঠামো পুনরায় প্রোভিশন করুন
azd provision

# শুধুমাত্র অ্যাপ্লিকেশন পুনরায় স্থাপন করুন
azd deploy
```

## 💡 প্রো টিপস

### দ্রুত ওয়ার্কফ্লোর জন্য অ্যালিয়াস
```bash
# আপনার .bashrc বা .zshrc ফাইলে যোগ করুন
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

# পর্যবেক্ষণের সাথে দ্রুত মোতায়েন
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

## 📖 সাহায্য ও ডকুমেন্টেশন

### সাহায্য পাওয়া
```bash
# সাধারণ সাহায্য
azd --help
azd help

# কমান্ড নির্দিষ্ট সাহায্য
azd up --help
azd env --help
azd config --help

# সংস্করণ এবং বিল্ড তথ্য প্রদর্শন করুন
azd version
azd version --output json
```

### ডকুমেন্টেশন লিঙ্কস
```bash
# ব্রাউজারে ডকুমেন্টেশন খুলুন
azd docs

# টেমপ্লেট ডকুমেন্টেশন দেখান
azd template show <template-name> --docs
```

---

**টিপ**: এই চিট শিটটি বুকমার্ক করুন এবং প্রয়োজনীয় কমান্ড দ্রুত খুঁজে পেতে `Ctrl+F` ব্যবহার করুন!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **পরবর্তী পাঠ**: [Glossary](glossary.md)

---

> **💡 আপনার এডিটরে Azure কমান্ড সাহায্য চান?** ইনস্টল করুন [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) সঙ্গে `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, ডিপ্লয়মেন্ট, ডায়াগনস্টিকস এবং আরও ৩৭টি দক্ষতা।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই ডকুমেন্টটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে স্বীকার করুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল নথিটি তার নিজস্ব ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদের ব্যবহারে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
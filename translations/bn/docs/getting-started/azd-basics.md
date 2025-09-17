<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T19:23:56+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "bn"
}
-->
# AZD বেসিকস - Azure Developer CLI সম্পর্কে ধারণা

# AZD বেসিকস - মূল ধারণা এবং ভিত্তি

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ১ - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [কোর্স ওভারভিউ](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ পরবর্তী**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ২: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## ভূমিকা

এই পাঠে Azure Developer CLI (azd) পরিচিত করা হয়েছে, যা একটি শক্তিশালী কমান্ড-লাইন টুল যা স্থানীয় ডেভেলপমেন্ট থেকে Azure-এ ডিপ্লয়মেন্ট পর্যন্ত আপনার যাত্রাকে ত্বরান্বিত করে। আপনি মূল ধারণাগুলি, প্রধান বৈশিষ্ট্যগুলি শিখবেন এবং বুঝবেন কীভাবে azd ক্লাউড-নেটিভ অ্যাপ্লিকেশন ডিপ্লয়মেন্টকে সহজ করে তোলে।

## শেখার লক্ষ্য

এই পাঠ শেষে, আপনি:
- Azure Developer CLI কী এবং এর প্রধান উদ্দেশ্য বুঝতে পারবেন
- টেমপ্লেট, এনভায়রনমেন্ট এবং সার্ভিসের মূল ধারণাগুলি শিখবেন
- টেমপ্লেট-চালিত ডেভেলপমেন্ট এবং Infrastructure as Code-এর মূল বৈশিষ্ট্যগুলি অন্বেষণ করবেন
- azd প্রজেক্টের গঠন এবং ওয়ার্কফ্লো বুঝতে পারবেন
- আপনার ডেভেলপমেন্ট এনভায়রনমেন্টের জন্য azd ইনস্টল এবং কনফিগার করতে প্রস্তুত হবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি:
- আধুনিক ক্লাউড ডেভেলপমেন্ট ওয়ার্কফ্লোতে azd-এর ভূমিকা ব্যাখ্যা করতে পারবেন
- azd প্রজেক্টের গঠনের উপাদানগুলি সনাক্ত করতে পারবেন
- টেমপ্লেট, এনভায়রনমেন্ট এবং সার্ভিস কীভাবে একসাথে কাজ করে তা বর্ণনা করতে পারবেন
- azd-এর মাধ্যমে Infrastructure as Code-এর সুবিধাগুলি বুঝতে পারবেন
- বিভিন্ন azd কমান্ড এবং তাদের উদ্দেশ্য চিনতে পারবেন

## Azure Developer CLI (azd) কী?

Azure Developer CLI (azd) একটি কমান্ড-লাইন টুল যা স্থানীয় ডেভেলপমেন্ট থেকে Azure-এ ডিপ্লয়মেন্ট পর্যন্ত আপনার যাত্রাকে ত্বরান্বিত করতে ডিজাইন করা হয়েছে। এটি Azure-এ ক্লাউড-নেটিভ অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনা করার প্রক্রিয়াকে সহজ করে তোলে।

## মূল ধারণা

### টেমপ্লেট
টেমপ্লেটগুলি azd-এর ভিত্তি। এগুলিতে অন্তর্ভুক্ত থাকে:
- **অ্যাপ্লিকেশন কোড** - আপনার সোর্স কোড এবং ডিপেনডেন্সি
- **ইনফ্রাস্ট্রাকচার ডেফিনিশন** - Bicep বা Terraform-এ সংজ্ঞায়িত Azure রিসোর্স
- **কনফিগারেশন ফাইল** - সেটিংস এবং এনভায়রনমেন্ট ভেরিয়েবল
- **ডিপ্লয়মেন্ট স্ক্রিপ্ট** - স্বয়ংক্রিয় ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### এনভায়রনমেন্ট
এনভায়রনমেন্টগুলি বিভিন্ন ডিপ্লয়মেন্ট টার্গেটকে উপস্থাপন করে:
- **ডেভেলপমেন্ট** - টেস্টিং এবং ডেভেলপমেন্টের জন্য
- **স্টেজিং** - প্রি-প্রোডাকশন এনভায়রনমেন্ট
- **প্রোডাকশন** - লাইভ প্রোডাকশন এনভায়রনমেন্ট

প্রতিটি এনভায়রনমেন্টের নিজস্ব:
- Azure রিসোর্স গ্রুপ
- কনফিগারেশন সেটিংস
- ডিপ্লয়মেন্ট স্টেট থাকে

### সার্ভিস
সার্ভিসগুলি আপনার অ্যাপ্লিকেশনের বিল্ডিং ব্লক:
- **ফ্রন্টএন্ড** - ওয়েব অ্যাপ্লিকেশন, SPAs
- **ব্যাকএন্ড** - API, মাইক্রোসার্ভিস
- **ডাটাবেস** - ডেটা স্টোরেজ সলিউশন
- **স্টোরেজ** - ফাইল এবং ব্লব স্টোরেজ

## প্রধান বৈশিষ্ট্য

### ১. টেমপ্লেট-চালিত ডেভেলপমেন্ট
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### ২. Infrastructure as Code
- **Bicep** - Azure-এর ডোমেইন-স্পেসিফিক ল্যাঙ্গুয়েজ
- **Terraform** - মাল্টি-ক্লাউড ইনফ্রাস্ট্রাকচার টুল
- **ARM টেমপ্লেট** - Azure Resource Manager টেমপ্লেট

### ৩. ইন্টিগ্রেটেড ওয়ার্কফ্লো
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### ৪. এনভায়রনমেন্ট ম্যানেজমেন্ট
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 প্রজেক্ট গঠন

একটি সাধারণ azd প্রজেক্ট গঠন:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 কনফিগারেশন ফাইল

### azure.yaml
প্রধান প্রজেক্ট কনফিগারেশন ফাইল:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
এনভায়রনমেন্ট-স্পেসিফিক কনফিগারেশন:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 সাধারণ ওয়ার্কফ্লো

### একটি নতুন প্রজেক্ট শুরু করা
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### ডেভেলপমেন্ট সাইকেল
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## `azd down --force --purge` বুঝতে

`azd down --force --purge` কমান্ডটি একটি শক্তিশালী উপায় যা সম্পূর্ণভাবে আপনার azd এনভায়রনমেন্ট এবং সংশ্লিষ্ট সমস্ত রিসোর্সকে সরিয়ে দেয়। এখানে প্রতিটি ফ্ল্যাগের কাজের বিশ্লেষণ:
```
--force
```
- কনফার্মেশন প্রম্পটগুলি এড়িয়ে যায়।
- অটোমেশন বা স্ক্রিপ্টিংয়ের জন্য উপযোগী যেখানে ম্যানুয়াল ইনপুট সম্ভব নয়।
- CLI কোনো অসঙ্গতি সনাক্ত করলেও টিয়ারডাউন বাধাহীনভাবে সম্পন্ন হয়।

```
--purge
```
**সমস্ত সংশ্লিষ্ট মেটাডেটা** মুছে দেয়, যার মধ্যে রয়েছে:
- এনভায়রনমেন্ট স্টেট
- স্থানীয় `.azure` ফোল্ডার
- ক্যাশড ডিপ্লয়মেন্ট তথ্য
- পূর্ববর্তী ডিপ্লয়মেন্টের "মেমরি" মুছে দেয়, যা মিসম্যাচড রিসোর্স গ্রুপ বা পুরনো রেজিস্ট্রি রেফারেন্সের মতো সমস্যার কারণ হতে পারে।

### কেন উভয় ব্যবহার করবেন?
যখন `azd up`-এ লেগে থাকা স্টেট বা আংশিক ডিপ্লয়মেন্টের কারণে আপনি সমস্যায় পড়েন, এই কম্বো একটি **পরিষ্কার স্লেট** নিশ্চিত করে।

এটি বিশেষভাবে সহায়ক যখন Azure পোর্টালে ম্যানুয়াল রিসোর্স মুছে ফেলা হয় বা টেমপ্লেট, এনভায়রনমেন্ট বা রিসোর্স গ্রুপ নামকরণ কনভেনশন পরিবর্তন করা হয়।

### একাধিক এনভায়রনমেন্ট পরিচালনা করা
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 নেভিগেশন কমান্ড

### ডিসকভারি
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### প্রজেক্ট ম্যানেজমেন্ট
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### মনিটরিং
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## সেরা অনুশীলন

### ১. অর্থবহ নাম ব্যবহার করুন
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### ২. টেমপ্লেট ব্যবহার করুন
- বিদ্যমান টেমপ্লেট দিয়ে শুরু করুন
- আপনার প্রয়োজন অনুযায়ী কাস্টমাইজ করুন
- আপনার সংস্থার জন্য পুনর্ব্যবহারযোগ্য টেমপ্লেট তৈরি করুন

### ৩. এনভায়রনমেন্ট আইসোলেশন
- ডেভ/স্টেজিং/প্রোড-এর জন্য আলাদা এনভায়রনমেন্ট ব্যবহার করুন
- স্থানীয় মেশিন থেকে সরাসরি প্রোডাকশনে ডিপ্লয় করবেন না
- প্রোডাকশন ডিপ্লয়মেন্টের জন্য CI/CD পাইপলাইন ব্যবহার করুন

### ৪. কনফিগারেশন ম্যানেজমেন্ট
- সংবেদনশীল ডেটার জন্য এনভায়রনমেন্ট ভেরিয়েবল ব্যবহার করুন
- কনফিগারেশন ভার্সন কন্ট্রোলে রাখুন
- এনভায়রনমেন্ট-স্পেসিফিক সেটিংস ডকুমেন্ট করুন

## শেখার অগ্রগতি

### বিগিনার (সপ্তাহ ১-২)
1. azd ইনস্টল করুন এবং প্রমাণীকরণ করুন
2. একটি সাধারণ টেমপ্লেট ডিপ্লয় করুন
3. প্রজেক্ট গঠন বুঝুন
4. মৌলিক কমান্ড শিখুন (up, down, deploy)

### ইন্টারমিডিয়েট (সপ্তাহ ৩-৪)
1. টেমপ্লেট কাস্টমাইজ করুন
2. একাধিক এনভায়রনমেন্ট পরিচালনা করুন
3. ইনফ্রাস্ট্রাকচার কোড বুঝুন
4. CI/CD পাইপলাইন সেট আপ করুন

### অ্যাডভান্সড (সপ্তাহ ৫+)
1. কাস্টম টেমপ্লেট তৈরি করুন
2. উন্নত ইনফ্রাস্ট্রাকচার প্যাটার্ন
3. মাল্টি-রিজিয়ন ডিপ্লয়মেন্ট
4. এন্টারপ্রাইজ-গ্রেড কনফিগারেশন

## পরবর্তী পদক্ষেপ

**📖 অধ্যায় ১ শেখা চালিয়ে যান:**
- [ইনস্টলেশন ও সেটআপ](installation.md) - azd ইনস্টল এবং কনফিগার করুন
- [আপনার প্রথম প্রজেক্ট](first-project.md) - হাতে-কলমে টিউটোরিয়াল সম্পন্ন করুন
- [কনফিগারেশন গাইড](configuration.md) - উন্নত কনফিগারেশন অপশন

**🎯 পরবর্তী অধ্যায়ের জন্য প্রস্তুত?**
- [অধ্যায় ২: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md) - AI অ্যাপ্লিকেশন তৈরি শুরু করুন

## অতিরিক্ত সম্পদ

- [Azure Developer CLI ওভারভিউ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [কমিউনিটি স্যাম্পল](https://github.com/Azure-Samples)

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ১ - ভিত্তি ও দ্রুত শুরু  
- **⬅️ পূর্ববর্তী**: [কোর্স ওভারভিউ](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ পরবর্তী**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ২: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিক অনুবাদ প্রদানের চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
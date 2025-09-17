<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T19:45:16+00:00",
  "source_file": "workshop/README.md",
  "language_code": "bn"
}
-->
# AZD for AI Developers Workshop

**পূর্ববর্তী:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **পরবর্তী:** [Workshop Lab Modules](../../../workshop)

Azure Developer CLI (AZD) ব্যবহার করে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট শেখার জন্য হাতে-কলমে এই কর্মশালায় আপনাকে স্বাগতম। এই কর্মশালা আপনাকে AZD এর বেসিক থেকে শুরু করে প্রোডাকশন-রেডি AI সমাধান ডিপ্লয় করার দক্ষতা অর্জনে সহায়তা করবে।

## কর্মশালার সংক্ষিপ্ত বিবরণ

**সময়কাল:** ২-৩ ঘণ্টা  
**স্তর:** প্রাথমিক থেকে মধ্যম  
**প্রয়োজনীয়তা:** Azure, কমান্ড লাইন টুল এবং AI ধারণার মৌলিক জ্ঞান

### আপনি যা শিখবেন

- **AZD এর মূল বিষয়**: AZD দিয়ে Infrastructure as Code বোঝা
- 🤖 **AI সার্ভিস ইন্টিগ্রেশন**: Azure OpenAI, AI Search এবং অন্যান্য AI সার্ভিস ডিপ্লয় করা
- **কন্টেইনার ডিপ্লয়মেন্ট**: AI অ্যাপ্লিকেশনের জন্য Azure Container Apps ব্যবহার করা
- **নিরাপত্তার সেরা পদ্ধতি**: Managed Identity এবং নিরাপদ কনফিগারেশন বাস্তবায়ন
- **মনিটরিং এবং পর্যবেক্ষণ**: AI ওয়ার্কলোডের জন্য Application Insights সেটআপ করা
- **প্রোডাকশন প্যাটার্ন**: এন্টারপ্রাইজ-রেডি ডিপ্লয়মেন্ট কৌশল

## কর্মশালার কাঠামো

### মডিউল ১: AZD এর ভিত্তি (৩০ মিনিট)
- AZD ইনস্টল এবং কনফিগার করা
- AZD প্রজেক্ট স্ট্রাকচার বোঝা
- আপনার প্রথম AZD ডিপ্লয়মেন্ট
- **ল্যাব**: একটি সাধারণ ওয়েব অ্যাপ্লিকেশন ডিপ্লয় করা

### মডিউল ২: Azure OpenAI ইন্টিগ্রেশন (৪৫ মিনিট)
- Azure OpenAI রিসোর্স সেটআপ করা
- মডেল ডিপ্লয়মেন্ট কৌশল
- API অ্যাক্সেস এবং অথেনটিকেশন কনফিগার করা
- **ল্যাব**: GPT-4 দিয়ে একটি চ্যাট অ্যাপ্লিকেশন ডিপ্লয় করা

### মডিউল ৩: RAG অ্যাপ্লিকেশন (৪৫ মিনিট)
- Azure AI Search ইন্টিগ্রেশন
- Azure Document Intelligence দিয়ে ডকুমেন্ট প্রসেসিং
- ভেক্টর এমবেডিং এবং সেমান্টিক সার্চ
- **ল্যাব**: একটি ডকুমেন্ট Q&A সিস্টেম তৈরি করা

### মডিউল ৪: প্রোডাকশন ডিপ্লয়মেন্ট (৩০ মিনিট)
- Container Apps কনফিগার করা
- স্কেলিং এবং পারফরম্যান্স অপ্টিমাইজেশন
- মনিটরিং এবং লগিং
- **ল্যাব**: পর্যবেক্ষণ সহ প্রোডাকশনে ডিপ্লয় করা

### মডিউল ৫: উন্নত প্যাটার্ন (১৫ মিনিট)
- মাল্টি-এনভায়রনমেন্ট ডিপ্লয়মেন্ট
- CI/CD ইন্টিগ্রেশন
- খরচ অপ্টিমাইজেশন কৌশল
- **সারসংক্ষেপ**: প্রোডাকশন রেডিনেস চেকলিস্ট

## প্রয়োজনীয়তা

### প্রয়োজনীয় টুল

এই টুলগুলো কর্মশালার আগে ইনস্টল করুন:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure অ্যাকাউন্ট সেটআপ

1. **Azure সাবস্ক্রিপশন**: [ফ্রি সাইন আপ করুন](https://azure.microsoft.com/free/)  
2. **Azure OpenAI অ্যাক্সেস**: [অ্যাক্সেসের জন্য অনুরোধ করুন](https://aka.ms/oai/access)  
3. **প্রয়োজনীয় অনুমতি**:  
   - সাবস্ক্রিপশন বা রিসোর্স গ্রুপে Contributor ভূমিকা  
   - User Access Administrator (RBAC অ্যাসাইনমেন্টের জন্য)

### প্রয়োজনীয়তা যাচাই করুন

আপনার সেটআপ যাচাই করতে এই স্ক্রিপ্টটি চালান:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## কর্মশালার উপকরণ

### ল্যাব অনুশীলন

প্রতিটি মডিউলে স্টার্টার কোড এবং ধাপে ধাপে নির্দেশনা সহ হাতে-কলমে ল্যাব রয়েছে:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - আপনার প্রথম AZD ডিপ্লয়মেন্ট  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI দিয়ে চ্যাট অ্যাপ্লিকেশন  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search সহ RAG অ্যাপ্লিকেশন  
- **[lab-4-production/](../../../workshop/lab-4-production)** - প্রোডাকশন ডিপ্লয়মেন্ট প্যাটার্ন  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - উন্নত ডিপ্লয়মেন্ট পরিস্থিতি  

### রেফারেন্স উপকরণ

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - বিস্তৃত ইন্টিগ্রেশন প্যাটার্ন  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - মডেল ডিপ্লয়মেন্টের সেরা পদ্ধতি  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - এন্টারপ্রাইজ ডিপ্লয়মেন্ট প্যাটার্ন  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - সাধারণ সমস্যা এবং সমাধান  

### নমুনা টেমপ্লেট

সাধারণ AI পরিস্থিতির জন্য দ্রুত-শুরু টেমপ্লেট:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## শুরু করা

### অপশন ১: GitHub Codespaces (প্রস্তাবিত)

কর্মশালা শুরু করার দ্রুততম উপায়:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### অপশন ২: লোকাল ডেভেলপমেন্ট

1. **কর্মশালার রিপোজিটরি ক্লোন করুন:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure-এ লগইন করুন:**  
```bash
az login
azd auth login
```

3. **ল্যাব ১ দিয়ে শুরু করুন:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### অপশন ৩: প্রশিক্ষক-নেতৃত্বাধীন কর্মশালা

যদি আপনি প্রশিক্ষক-নেতৃত্বাধীন সেশনে অংশগ্রহণ করেন:

- 🎥 **কর্মশালার রেকর্ডিং**: [অন-ডিমান্ড উপলব্ধ](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord কমিউনিটি**: [লাইভ সাপোর্টের জন্য যোগ দিন](https://aka.ms/foundry/discord)  
- **কর্মশালার প্রতিক্রিয়া**: [আপনার অভিজ্ঞতা শেয়ার করুন](https://aka.ms/azd-workshop-feedback)  

## কর্মশালার সময়সূচি

### স্ব-নিয়ন্ত্রিত শেখা (৩ ঘণ্টা)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### প্রশিক্ষক-নেতৃত্বাধীন সেশন (২.৫ ঘণ্টা)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## সফলতার মানদণ্ড

কর্মশালার শেষে আপনি সক্ষম হবেন:

✅ **AI অ্যাপ্লিকেশন ডিপ্লয়** করতে AZD টেমপ্লেট ব্যবহার করে  
✅ **Azure OpenAI কনফিগার** করতে সঠিক নিরাপত্তা সহ  
✅ **RAG অ্যাপ্লিকেশন তৈরি** করতে Azure AI Search ইন্টিগ্রেশন দিয়ে  
✅ **প্রোডাকশন প্যাটার্ন বাস্তবায়ন** করতে এন্টারপ্রাইজ AI ওয়ার্কলোডের জন্য  
✅ **AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট মনিটর এবং সমস্যা সমাধান** করতে  
✅ **AI ওয়ার্কলোডের জন্য খরচ অপ্টিমাইজেশন কৌশল প্রয়োগ** করতে  

## কমিউনিটি এবং সাপোর্ট

### কর্মশালার সময়

- 🙋 **প্রশ্ন**: কর্মশালার চ্যাট ব্যবহার করুন বা হাত তুলুন  
- 🐛 **সমস্যা**: [ট্রাবলশুটিং গাইড](../docs/troubleshooting/ai-troubleshooting.md) দেখুন  
- **টিপস**: অন্যান্য অংশগ্রহণকারীদের সাথে আবিষ্কার শেয়ার করুন  

### কর্মশালার পরে

- 💬 **Discord**: [Azure AI Foundry কমিউনিটি](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [টেমপ্লেট সমস্যার রিপোর্ট করুন](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **প্রতিক্রিয়া**: [কর্মশালার মূল্যায়ন ফর্ম](https://aka.ms/azd-workshop-feedback)  

## পরবর্তী পদক্ষেপ

### শেখা চালিয়ে যান

1. **উন্নত পরিস্থিতি**: [মাল্টি-রিজিয়ন ডিপ্লয়মেন্ট](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) অন্বেষণ করুন  
2. **CI/CD ইন্টিগ্রেশন**: [GitHub Actions ওয়ার্কফ্লো](../docs/deployment/github-actions.md) সেটআপ করুন  
3. **কাস্টম টেমপ্লেট**: [AZD টেমপ্লেট তৈরি করুন](../docs/getting-started/custom-templates.md)  

### আপনার প্রকল্পে প্রয়োগ করুন

1. **মূল্যায়ন**: আমাদের [রেডিনেস চেকলিস্ট](./production-readiness-checklist.md) ব্যবহার করুন  
2. **টেমপ্লেট**: আমাদের [AI-নির্দিষ্ট টেমপ্লেট](../../../workshop/templates) দিয়ে শুরু করুন  
3. **সাপোর্ট**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) এ যোগ দিন  

### আপনার সফলতা শেয়ার করুন

- ⭐ **রিপোজিটরি স্টার দিন** যদি এই কর্মশালা আপনাকে সাহায্য করে  
- 🐦 **সোশ্যাল মিডিয়ায় শেয়ার করুন** #AzureDeveloperCLI #AzureAI দিয়ে  
- 📝 **ব্লগ পোস্ট লিখুন** আপনার AI ডিপ্লয়মেন্ট যাত্রা সম্পর্কে  

---

## কর্মশালার প্রতিক্রিয়া

আপনার প্রতিক্রিয়া আমাদের কর্মশালার অভিজ্ঞতা উন্নত করতে সাহায্য করে:

| দিক | রেটিং (১-৫) | মন্তব্য |
|-----|-------------|---------|
| বিষয়বস্তুর গুণমান | ⭐⭐⭐⭐⭐ | |
| হাতে-কলমে ল্যাব | ⭐⭐⭐⭐⭐ | |
| ডকুমেন্টেশন | ⭐⭐⭐⭐⭐ | |
| কঠিনতার স্তর | ⭐⭐⭐⭐⭐ | |
| সামগ্রিক অভিজ্ঞতা | ⭐⭐⭐⭐⭐ | |

**প্রতিক্রিয়া জমা দিন**: [কর্মশালার মূল্যায়ন ফর্ম](https://aka.ms/azd-workshop-feedback)

---

**পূর্ববর্তী:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **পরবর্তী:** শুরু করুন [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**AZD দিয়ে AI অ্যাপ্লিকেশন তৈরি করতে প্রস্তুত?**

[Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
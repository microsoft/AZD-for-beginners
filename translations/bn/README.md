<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T09:54:40+00:00",
  "source_file": "README.md",
  "language_code": "bn"
}
-->
# শিক্ষার্থীদের জন্য AZD

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.bn.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

এই রিসোর্সগুলো ব্যবহার শুরু করতে নিচের ধাপগুলো অনুসরণ করুন:  
1. **রিপোজিটরি ফর্ক করুন**: ক্লিক করুন [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **রিপোজিটরি ক্লোন করুন**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Azure Discord কমিউনিটিতে যোগ দিন এবং বিশেষজ্ঞ ও অন্যান্য ডেভেলপারদের সাথে পরিচিত হন**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 বহু-ভাষা সমর্থন

#### GitHub Action এর মাধ্যমে সমর্থিত (স্বয়ংক্রিয় এবং সর্বদা আপডেটেড)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](./README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**যদি আপনি অতিরিক্ত ভাষার অনুবাদ চান, সমর্থিত ভাষার তালিকা [এখানে](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## পরিচিতি

Azure Developer CLI (azd)-এর জন্য এই বিস্তৃত গাইডে আপনাকে স্বাগতম। এই রিপোজিটরি শিক্ষার্থী থেকে শুরু করে পেশাদার ডেভেলপারদের জন্য ডিজাইন করা হয়েছে, যাতে তারা Azure Developer CLI শিখতে এবং দক্ষতার সাথে ক্লাউড ডিপ্লয়মেন্ট পরিচালনা করতে পারে। এই কাঠামোবদ্ধ শিক্ষার রিসোর্সটি আপনাকে Azure ক্লাউড ডিপ্লয়মেন্টে হাতে-কলমে অভিজ্ঞতা, সাধারণ সমস্যার সমাধান এবং সফল AZD টেমপ্লেট ডিপ্লয়মেন্টের জন্য সেরা পদ্ধতি বাস্তবায়নে সহায়তা করবে।  

## শেখার লক্ষ্য

এই রিপোজিটরির মাধ্যমে কাজ করে আপনি:  
- Azure Developer CLI-এর মৌলিক বিষয় এবং মূল ধারণাগুলো আয়ত্ত করবেন  
- Infrastructure as Code ব্যবহার করে Azure রিসোর্স ডিপ্লয় এবং প্রভিশন করতে শিখবেন  
- সাধারণ AZD ডিপ্লয়মেন্ট সমস্যাগুলোর সমাধান করার দক্ষতা অর্জন করবেন  
- প্রি-ডিপ্লয়মেন্ট যাচাইকরণ এবং ক্ষমতা পরিকল্পনা বুঝবেন  
- নিরাপত্তা সেরা পদ্ধতি এবং খরচ অপ্টিমাইজেশন কৌশল বাস্তবায়ন করবেন  
- Azure-এ প্রোডাকশন-রেডি অ্যাপ্লিকেশন ডিপ্লয় করার আত্মবিশ্বাস তৈরি করবেন  

## শেখার ফলাফল

এই কোর্স সম্পন্ন করার পর আপনি:  
- সফলভাবে Azure Developer CLI ইনস্টল, কনফিগার এবং ব্যবহার করতে পারবেন  
- AZD টেমপ্লেট ব্যবহার করে অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করতে পারবেন  
- অথেন্টিকেশন, ইনফ্রাস্ট্রাকচার এবং ডিপ্লয়মেন্ট সমস্যাগুলো সমাধান করতে পারবেন  
- প্রি-ডিপ্লয়মেন্ট চেক সম্পাদন করতে পারবেন, যার মধ্যে ক্ষমতা পরিকল্পনা এবং SKU নির্বাচন অন্তর্ভুক্ত  
- মনিটরিং, নিরাপত্তা এবং খরচ ব্যবস্থাপনার সেরা পদ্ধতি বাস্তবায়ন করতে পারবেন  
- AZD ওয়ার্কফ্লোগুলো CI/CD পাইপলাইনে সংযুক্ত করতে পারবেন  

## বিষয়সূচি

- [Azure Developer CLI কী?](../..)  
- [দ্রুত শুরু](../..)  
- [ডকুমেন্টেশন](../..)  
- [উদাহরণ এবং টেমপ্লেট](../..)  
- [রিসোর্স](../..)  
- [অবদান](../..)  

## Azure Developer CLI কী?

Azure Developer CLI (azd) হলো একটি ডেভেলপার-কেন্দ্রিক কমান্ড-লাইন ইন্টারফেস, যা Azure-এ অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করার প্রক্রিয়াকে দ্রুততর করে। এটি প্রদান করে:  

- **টেমপ্লেট-ভিত্তিক ডিপ্লয়মেন্ট** - সাধারণ অ্যাপ্লিকেশন প্যাটার্নের জন্য প্রি-বিল্ট টেমপ্লেট ব্যবহার করুন  
- **Infrastructure as Code** - Bicep বা Terraform ব্যবহার করে Azure রিসোর্স পরিচালনা করুন  
- **ইন্টিগ্রেটেড ওয়ার্কফ্লো** - অ্যাপ্লিকেশন প্রভিশন, ডিপ্লয় এবং মনিটর করুন  
- **ডেভেলপার-বান্ধব** - ডেভেলপারদের উৎপাদনশীলতা এবং অভিজ্ঞতার জন্য অপ্টিমাইজড  

## দ্রুত শুরু

### প্রয়োজনীয়তা  
- Azure সাবস্ক্রিপশন  
- Azure CLI ইনস্টল করা  
- Git (টেমপ্লেট ক্লোন করার জন্য)  

### ইনস্টলেশন  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### আপনার প্রথম ডিপ্লয়মেন্ট  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## ডকুমেন্টেশন

### শুরু করা  
- [**AZD বেসিকস**](docs/getting-started/azd-basics.md) - মূল ধারণা এবং পরিভাষা  
- [**ইনস্টলেশন এবং সেটআপ**](docs/getting-started/installation.md) - প্ল্যাটফর্ম-নির্দিষ্ট ইনস্টলেশন গাইড  
- [**কনফিগারেশন**](docs/getting-started/configuration.md) - পরিবেশ সেটআপ এবং অথেন্টিকেশন  
- [**আপনার প্রথম প্রকল্প**](docs/getting-started/first-project.md) - ধাপে ধাপে টিউটোরিয়াল  

### ডিপ্লয়মেন্ট এবং প্রভিশনিং  
- [**ডিপ্লয়মেন্ট গাইড**](docs/deployment/deployment-guide.md) - সম্পূর্ণ ডিপ্লয়মেন্ট ওয়ার্কফ্লো  
- [**রিসোর্স প্রভিশনিং**](docs/deployment/provisioning.md) - Azure রিসোর্স ব্যবস্থাপনা  

### প্রি-ডিপ্লয়মেন্ট চেক  
- [**ক্ষমতা পরিকল্পনা**](docs/pre-deployment/capacity-planning.md) - Azure রিসোর্স ক্ষমতা যাচাইকরণ  
- [**SKU নির্বাচন**](docs/pre-deployment/sku-selection.md) - সঠিক Azure SKU নির্বাচন  
- [**প্রি-ফ্লাইট চেক**](docs/pre-deployment/preflight-checks.md) - স্বয়ংক্রিয় যাচাইকরণ স্ক্রিপ্ট  

### সমস্যা সমাধান  
- [**সাধারণ সমস্যা**](docs/troubleshooting/common-issues.md) - প্রায়শই সম্মুখীন হওয়া সমস্যাগুলো এবং সমাধান  
- [**ডিবাগিং গাইড**](docs/troubleshooting/debugging.md) - ধাপে ধাপে ডিবাগিং কৌশল  

## উদাহরণ এবং টেমপ্লেট  
- [**উদাহরণ**](examples/README.md) - বাস্তব উদাহরণ, টেমপ্লেট এবং বাস্তব জীবনের পরিস্থিতি, যা আপনাকে হাতে-কলমে অনুশীলনের মাধ্যমে Azure Developer CLI শিখতে সহায়তা করবে। প্রতিটি উদাহরণ সম্পূর্ণ কাজের কোড, ইনফ্রাস্ট্রাকচার টেমপ্লেট এবং বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং ডিপ্লয়মেন্ট প্যাটার্নের জন্য বিস্তারিত নির্দেশনা প্রদান করে।  

### হাতে-কলমে ল্যাব/ওয়ার্কশপ  
- [**শিক্ষার্থীদের জন্য AZD**](workshop/README.md) - এই ওয়ার্কশপটি AI এজেন্ট AZD টেমপ্লেট দিয়ে শুরু করার উপর ফোকাস করবে এবং AZD ব্যবহার করে Azure AI পরিষেবাগুলোর ডিপ্লয়মেন্টের জন্য সেরা পদ্ধতি প্রদান করবে  

## রিসোর্স

### দ্রুত রেফারেন্স  
- [**কমান্ড চিট শিট**](resources/cheat-sheet.md) - গুরুত্বপূর্ণ azd কমান্ড  
- [**গ্লসারি**](resources/glossary.md) - Azure এবং azd পরিভাষা  
- [**FAQ**](resources/faq.md) - প্রায়শই জিজ্ঞাসিত প্রশ্নাবলী  
- [**স্টাডি গাইড**](resources/study-guide.md) - বিস্তৃত শেখার লক্ষ্য এবং অনুশীলন  

### বাহ্যিক রিসোর্স  
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure আর্কিটেকচার সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure প্রাইসিং ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)  
- [Azure স্ট্যাটাস](https://status.azure.com/)  

## শেখার পথ

### শিক্ষার্থী এবং শিক্ষানবিসদের জন্য  
1. [AZD বেসিকস](docs/getting-started/azd-basics.md) দিয়ে শুরু করুন  
2. [ইনস্টলেশন গাইড](docs/getting-started/installation.md) অনুসরণ করুন  
3. [আপনার প্রথম প্রকল্প](docs/getting-started/first-project.md) সম্পন্ন করুন  
4. [সাধারণ ওয়েব অ্যাপ উদাহরণ](../../examples/simple-web-app) দিয়ে অনুশীলন করুন  

### ডেভেলপারদের জন্য  
1. [কনফিগারেশন গাইড](docs/getting-started/configuration.md) পর্যালোচনা করুন  
2. [ডিপ্লয়মেন্ট গাইড](docs/deployment/deployment-guide.md) অধ্যয়ন করুন  
3. [ডাটাবেস অ্যাপ উদাহরণ](../../examples/database-app) নিয়ে কাজ করুন  
4. [কন্টেইনার অ্যাপ উদাহরণ](../../examples/container-app) অন্বেষণ করুন  

### ডেভঅপস ইঞ্জিনিয়ারদের জন্য  
1. [রিসোর্স প্রভিশনিং](docs/deployment/provisioning.md) আয়ত্ত করুন  
2. [প্রি-ফ্লাইট চেক](docs/pre-deployment/preflight-checks.md) বাস্তবায়ন করুন  
3. [ক্ষমতা পরিকল্পনা](docs/pre-deployment/capacity-planning.md) অনুশীলন করুন  
4. উন্নত [মাইক্রোসার্ভিস উদাহরণ](../../examples/microservices) নিয়ে কাজ করুন  

## অবদান

আমরা অবদানকে স্বাগত জানাই! বিস্তারিত জানতে আমাদের [অবদান গাইড](CONTRIBUTING.md) পড়ুন:  
- কীভাবে সমস্যা এবং ফিচার অনুরোধ জমা দিতে হয়  
- কোড অবদানের নির্দেশিকা  
- ডকুমেন্টেশন উন্নতি  
- কমিউনিটি স্ট্যান্ডার্ড  

## সহায়তা

- **সমস্যা**: [বাগ রিপোর্ট করুন এবং ফিচার অনুরোধ করুন](https://github.com/microsoft/azd-for-beginners/issues)  
- **আলোচনা**: [Microsoft Azure Discord কমিউনিটি Q&A এবং আলোচনা](https://discord.gg/microsoft-azure)  
- **ইমেইল**: ব্যক্তিগত অনুসন্ধানের জন্য  
- **Microsoft Learn**: [Azure Developer CLI-এর অফিসিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## লাইসেন্স

এই প্রকল্পটি MIT লাইসেন্সের অধীনে লাইসেন্সকৃত - বিস্তারিত জানতে [LICENSE](../../LICENSE) ফাইলটি দেখুন।  

## 🎒 অন্যান্য কোর্স

আমাদের টিম অন্যান্য কোর্সও তৈরি করে! দেখুন:  

- [**নতুন** মডেল কনটেক্সট প্রোটোকল (MCP) শিক্ষার্থীদের জন্য](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [শিক্ষার্থীদের জন্য AI এজেন্ট](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [ডটনেট ব্যবহার করে শিক্ষার্থীদের জন্য জেনারেটিভ AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [শিক্ষার্থীদের জন্য জেনারেটিভ AI](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [জাভা ব্যবহার করে শিক্ষার্থীদের জন্য জেনারেটিভ AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [শিক্ষার্থীদের জন্য মেশিন লার্নিং](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [শিক্ষার্থীদের জন্য ডেটা সায়েন্স](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [শিক্ষার্থীদের জন্য AI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [শিক্ষার্থীদের জন্য সাইবারসিকিউরিটি](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [শিক্ষার্থীদের জন্য ওয়েব ডেভেলপমেন্ট](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT শিক্ষার্থীদের জন্য](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [শিক্ষার্থীদের জন্য XR ডেভেলপমেন্ট](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI পেয়ারড প্রোগ্রামিংয়ের জন্য GitHub Copilot আয়ত্ত করা](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET ডেভেলপারদের জন্য GitHub Copilot আয়ত্ত করা](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [আপনার নিজস্ব Copilot অ্যাডভেঞ্চার নির্বাচন করুন](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**নেভিগেশন**
- **পরবর্তী পাঠ**: [AZD বেসিকস](docs/getting-started/azd-basics.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
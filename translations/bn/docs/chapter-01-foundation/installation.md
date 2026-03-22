# ইনস্টলেশন ও সেটআপ গাইড

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [AZD বেসিকস](azd-basics.md)
- **➡️ পরবর্তী**: [আপনার প্রথম প্রকল্প](first-project.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 2: AI-ফার্স্ট ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

এই বিস্তৃত গাইডটি আপনার সিস্টেমে Azure Developer CLI (azd) ইনস্টল এবং কনফিগার করার ধাপগুলো দেখাবে। আপনি বিভিন্ন অপারেটিং সিস্টেমের জন্য একাধিক ইনস্টলেশন পদ্ধতি, প্রমাণীকরণ সেটআপ, এবং Azure ডিপ্লয়মেন্টের জন্য আপনার ডেভেলপমেন্ট পরিবেশকে প্রথমিক কনফিগারেশন কিভাবে করতে হয় তা শিখবেন।

## শেখার লক্ষ্য

এই পাঠের শেষে আপনি:
- আপনার অপারেটিং সিস্টেমে Azure Developer CLI সফলভাবে ইনস্টল করতে পারবেন
- একাধিক পদ্ধতি ব্যবহার করে Azure-এ প্রমাণীকরণ কনফিগার করতে পারবেন
- প্রয়োজনীয় পূর্বশর্তগুলি দিয়ে আপনার ডেভেলপমেন্ট পরিবেশ সেটআপ করতে পারবেন
- বিভিন্ন ইনস্টলেশন অপশন ও কখন কোনটি ব্যবহার করবেন তা বোঝতে পারবেন
- সাধারণ ইনস্টলেশন ও সেটআপ সমস্যাগুলি সমাধান করতে পারবেন

## শেখার ফলাফল

এই পাঠটি সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- আপনার প্ল্যাটফর্মের উপযোগী পদ্ধতি ব্যবহার করে azd ইনস্টল করতে
- azd auth login ব্যবহার করে Azure-এ প্রমাণীকরণ করতে
- আপনার ইনস্টলেশন যাচাই এবং মৌলিক azd কমান্ডগুলি টেস্ট করতে
- অপ্টিমাল azd ব্যবহার জন্য আপনার ডেভেলপমেন্ট পরিবেশ কনফিগার করতে
- সাধারণ ইনস্টলেশন সমস্যা স্বতন্ত্রভাবে সমাধান করতে

এই গাইডটি আপনার অপারেটিং সিস্টেম বা ডেভেলপমেন্ট পরিবেশ যাই হোক না কেন আপনার সিস্টেমে Azure Developer CLI ইনস্টল এবং কনফিগার করতে সহায়তা করবে।

## পূর্বশর্ত

azd ইনস্টল করার আগে, নিশ্চিত করুন আপনার কাছে আছে:
- **Azure subscription** - [একটি ফ্রি অ্যাকাউন্ট তৈরি করুন](https://azure.microsoft.com/free/)
- **Azure CLI** - প্রমাণীকরণ এবং রিসোর্স ব্যবস্থাপনার জন্য
- **Git** - টেমপ্লেট ক্লোন এবং ভার্সন কন্ট্রোলের জন্য
- **Docker** (ঐচ্ছিক) - কন্টেইনারাইজড অ্যাপ্লিকেশনগুলোর জন্য

## ইনস্টলেশন পদ্ধতি

### Windows

#### বিকল্প 1: PowerShell (প্রস্তাবিত)
```powershell
# অ্যাডমিনিস্ট্রেটর হিসেবে বা উচ্চতর বিশেষাধিকার নিয়ে চালান
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### বিকল্প 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### বিকল্প 3: Chocolatey
```cmd
choco install azd
```

#### বিকল্প 4: ম্যানুয়াল ইনস্টলেশন
1. GitHub থেকে সর্বশেষ রিলিজ ডাউনলোড করুন: [GitHub](https://github.com/Azure/azure-dev/releases)
2. এটি `C:\Program Files\azd\` এ এক্সট্র্যাক্ট করুন
3. PATH পরিবেশ ভেরিয়েবলে যোগ করুন

### macOS

#### বিকল্প 1: Homebrew (প্রস্তাবিত)
```bash
brew tap azure/azd
brew install azd
```

#### বিকল্প 2: ইনস্টল স্ক্রিপ্ট
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### বিকল্প 3: ম্যানুয়াল ইনস্টলেশন
```bash
# ডাউনলোড এবং ইনস্টল করুন
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### বিকল্প 1: ইনস্টল স্ক্রিপ্ট (প্রস্তাবিত)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### বিকল্প 2: প্যাকেজ ম্যানেজারস

**Ubuntu/Debian:**
```bash
# Microsoft প্যাকেজ রিপোজিটরি যোগ করুন
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ইনস্টল করুন
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft প্যাকেজ রিপোজিটরি যোগ করুন
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces-এ পূর্ব-ইনস্টল করা থাকে। শুধু একটি কোডস্পেস তৈরি করুন এবং সঙ্গে সঙ্গেই azd ব্যবহার শুরু করুন।

### Docker

```bash
# কনটেইনারে azd চালান
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# সহজ ব্যবহারের জন্য একটি অ্যালিয়াস তৈরি করুন
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ইনস্টলেশন যাচাই

ইনস্টলেশনের পরে, azd সঠিকভাবে কাজ করছে কিনা যাচাই করুন:

```bash
# সংস্করণ পরীক্ষা করুন
azd version

# সহায়তা দেখুন
azd --help

# উপলব্ধ টেমপ্লেটগুলির তালিকা
azd template list
```

প্রত্যাশিত আউটপুট:
```
azd version 1.x.x (commit xxxxxx)
```

**নোট**: বাস্তব সংস্করণ নম্বর পরিবর্তিত হতে পারে। সর্বশেষ সংস্করণের জন্য দেখুন [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ ইনস্টলেশন সফলতার চেকলিস্ট:**
- [ ] `azd version` ত্রুটি ছাড়াই সংস্করণ নম্বর দেখায়
- [ ] `azd --help` কমান্ড ডকুমেন্টেশন প্রদর্শন করে
- [ ] `azd template list` উপলব্ধ টেমপ্লেটগুলি দেখায়
- [ ] `az account show` আপনার Azure subscription প্রদর্শন করে
- [ ] আপনি একটি টেস্ট ডিরেক্টরি তৈরি করে `azd init` সফলভাবে চালাতে পারেন

**যদি সব চেক পাস করে, আপনি [আপনার প্রথম প্রকল্প](first-project.md)-এ এগোতে প্রস্তুত!**

## প্রমাণীকরণ সেটআপ

### Azure CLI প্রমাণীকরণ (প্রস্তাবিত)
```bash
# যদি ইতিমধ্যেই ইনস্টল করা না থাকে তবে Azure CLI ইনস্টল করুন
# উইন্ডোজ: winget install Microsoft.AzureCLI
# ম্যাকওএস: brew install azure-cli
# লিনাক্স: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure-এ লগইন করুন
az login

# প্রমাণীকরণ যাচাই করুন
az account show
```

### ডিভাইস কোড প্রমাণীকরণ
যদি আপনি হেডলেস সিস্টেমে থাকেন বা ব্রাউজার সম্পর্কিত সমস্যা থাকে:
```bash
az login --use-device-code
```

### সার্ভিস প্রিন্সিপাল (CI/CD)
স্বয়ংক্রিয় পরিবেশের জন্য:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## কনফিগারেশন

### গ্লোবাল কনফিগারেশন
```bash
# ডিফল্ট সাবস্ক্রিপশন সেট করুন
azd config set defaults.subscription <subscription-id>

# ডিফল্ট অবস্থান সেট করুন
azd config set defaults.location eastus2

# সমস্ত কনফিগারেশন দেখুন
azd config list
```

### পরিবেশ ভেরিয়েবল
আপনার শেল প্রোফাইলে যোগ করুন (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure কনফিগারেশন
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd কনফিগারেশন
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ডিবাগ লগিং সক্ষম করুন
```

## IDE ইন্টিগ্রেশন

### Visual Studio Code
Azure Developer CLI এক্সটেনশন ইনস্টল করুন:
1. VS Code খুলুন
2. এক্সটেনশনে যান (Ctrl+Shift+X)
3. "Azure Developer CLI" সার্চ করুন
4. এক্সটেনশন ইনস্টল করুন

ফিচারসমূহ:
- azure.yaml এর জন্য IntelliSense
- একীভূত টার্মিনাল কমান্ড
- টেমপ্লেট ব্রাউজিং
- ডিপ্লয়মেন্ট মনিটরিং

### GitHub Codespaces
একটি `.devcontainer/devcontainer.json` তৈরি করুন:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Azure প্লাগইন ইনস্টল করুন
2. Azure ক্রেডেনশিয়াল কনফিগার করুন
3. azd কমান্ডগুলির জন্য একীভূত টার্মিনাল ব্যবহার করুন

## 🐛 ইনস্টলেশন সমস্যার সমাধান

### সাধারণ সমস্যা

#### Permission Denied (Windows)
```powershell
# PowerShell-কে প্রশাসক হিসেবে চালান
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH সমস্যা
হাতে করে azd আপনার PATH-এ যোগ করুন:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### নেটওয়ার্ক/প্রক্সি সমস্যা
```bash
# প্রক্সি কনফিগার করুন
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL যাচাই বাদ দিন (উৎপাদন পরিবেশে এটি সুপারিশ করা হয় না)
azd config set http.insecure true
```

#### সংস্করণ বিরোধ
```bash
# পুরানো ইনস্টলেশনগুলি মুছে ফেলুন
# উইন্ডোজ: winget uninstall Microsoft.Azd
# ম্যাকওএস: brew uninstall azd
# লিনাক্স: sudo apt remove azd

# কনফিগারেশন পরিষ্কার করুন
rm -rf ~/.azd
```

### আরও সাহায্য নেওয়া
```bash
# ডিবাগ লগিং সক্রিয় করুন
export AZD_DEBUG=true
azd <command> --debug

# বর্তমান কনফিগারেশন দেখুন
azd config list

# বর্তমান ডিপ্লয়মেন্টের অবস্থা দেখুন
azd show
```

## azd আপডেট করা

### স্বয়ংক্রিয় আপডেট
azd আপডেট উপলব্ধ হলে আপনাকে জানাবে:
```bash
azd version --check-for-updates
```

### ম্যানুয়াল আপডেট

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 প্রায়শই জিজ্ঞাসা করা প্রশ্ন

<details>
<summary><strong>azd এবং az CLI-এর মধ্যে পার্থক্য কী?</strong></summary>

**Azure CLI (az)**: ব্যক্তিগত Azure রিসোর্সগুলি পরিচালনার জন্য নিম্ন-স্তরের টুল
- `az webapp create`, `az storage account create`
- একবারে একটি রিসোর্স
- ইনফ্রাসট্রাকচার ব্যবস্থাপনার উপর ফোকাস

**Azure Developer CLI (azd)**: সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য উচ্চ-স্তরের টুল
- `azd up` সম্পূর্ণ অ্যাপ এবং সমস্ত রিসোর্স ডিপ্লয় করে
- টেমপ্লেট-ভিত্তিক ওয়ার্কফ্লো
- ডেভেলপার উৎপাদনশীলতার দিকে ফোকাস

**আপনাকে উভয়ই দরকার**: azd প্রমাণীকরণের জন্য az CLI ব্যবহার করে
</details>

<details>
<summary><strong>আমি কি বিদ্যমান Azure রিসোর্সগুলির সাথে azd ব্যবহার করতে পারি?</strong></summary>

হ্যাঁ! আপনি করতে পারেন:
1. বিদ্যমান রিসোর্সগুলি azd এনভায়রনমেন্টে ইম্পোর্ট করতে
2. আপনার Bicep টেমপ্লেটে বিদ্যমান রিসোর্স রেফারেন্স করতে
3. বিদ্যমান ইনফ্রাস্ট্রাকচারের পাশে azd ব্যবহার করে নতুন ডিপ্লয়মেন্ট করতে

বিস্তারিত জন্য দেখুন [Configuration Guide](configuration.md)।
</details>

<details>
<summary><strong>azd কি Azure Government বা Azure China-এ কাজ করে?</strong></summary>

হ্যাঁ, ক্লাউড কনফিগার করুন:
```bash
# অ্যাজিউর সরকারি
az cloud set --name AzureUSGovernment
az login

# অ্যাজিউর চীন
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>আমি কি CI/CD পাইপলাইনে azd ব্যবহার করতে পারি?</strong></summary>

অবশ্যই! azd স্বয়ংক্রিয়তার জন্য ডিজাইন করা হয়েছে:
- GitHub Actions ইন্টিগ্রেশন
- Azure DevOps সাপোর্ট
- সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
- নন-ইন্টারঅ্যাকটিভ মোড

CI/CD প্যাটার্নের জন্য দেখুন [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd ব্যবহার করার খরচ কত?</strong></summary>

azd নিজেই **সম্পূর্ণ বিনামূল্যে** এবং ওপেন-সোর্স। আপনি কেবল নিম্নলিখিতগুলোর জন্য অর্থ প্রদান করবেন:
- আপনি যে Azure রিসোর্সগুলি ডিপ্লয় করেন সেগুলি
- Azure খরচ (compute, storage ইত্যাদি)

ডিপ্লয়মেন্টের আগে খরচ অনুমান করতে `azd provision --preview` ব্যবহার করুন।
</details>

## পরবর্তী ধাপ

1. **প্রমাণীকরণ সম্পূর্ণ করুন**: নিশ্চিত করুন আপনি আপনার Azure subscription-এ অ্যাক্সেস করতে পারেন
2. **আপনার প্রথম ডিপ্লয়মেন্ট চেষ্টা করুন**: অনুসরণ করুন [First Project Guide](first-project.md)
3. **টেমপ্লেটগুলো অন্বেষণ করুন**: `azd template list` দিয়ে উপলব্ধ টেমপ্লেট ব্রাউজ করুন
4. **আপনার IDE কনফিগার করুন**: আপনার ডেভেলপমেন্ট পরিবেশ সেটআপ করুন

## সহায়তা

যদি আপনি সমস্যার সম্মুখীন হন:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - আপনার এডিটরে সরাসরি Azure কমান্ড নির্দেশনা পান `npx skills add microsoft/github-copilot-for-azure` ব্যবহার করে

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [AZD বেসিকস](azd-basics.md) 
- **➡️ পরবর্তী**: [আপনার প্রথম প্রকল্প](first-project.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 2: AI-ফার্স্ট ডেভেলপমেন্ট](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ইনস্টলেশন সম্পূর্ণ!** শুরু করতে [Your First Project](first-project.md)-এ যান এবং azd দিয়ে বিল্ড শুরু করুন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকার:
এই নথিটি এআই অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতার চেষ্টা করি, অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হবে। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে যে কোনো ভুল বোঝাবুঝি বা ভ্রান্তির জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
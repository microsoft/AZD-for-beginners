# ইনস্টলেশন ও সেটআপ গাইড

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: অধ্যায় 1 - ভিত্তি ও তৎক্ষণাৎ শুরু
- **⬅️ পূর্বের**: [AZD Basics](azd-basics.md)
- **➡️ পরের**: [Your First Project](first-project.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ভূমিকা

এই বিস্তৃত গাইডটি আপনার সিস্টেমে Azure Developer CLI (azd) ইনস্টল ও কনফিগার করার ধাপগুলো ব্যাখ্যা করবে। আপনি বিভিন্ন অপারেটিং সিস্টেমের জন্য একাধিক ইনস্টলেশন পদ্ধতি, প্রমাণীকরণ সেটআপ, এবং আপনার ডেভেলপমেন্ট পরিবেশকে Azure ডিপ্লয়মেন্টের জন্য প্রস্তুত করার প্রাথমিক কনফিগারেশন জানবেন।

## শেখার লক্ষ্য

এই পাঠ শেষ করার পরে, আপনি:
- আপনার অপারেটিং সিস্টেমে সফলভাবে Azure Developer CLI ইনস্টল করতে পারবেন
- একাধিক পদ্ধতি ব্যবহার করে Azure-এ প্রমাণীকরণ কনফিগার করতে পারবেন
- প্রয়োজনীয় পূর্বশর্তগুলি ব্যবহার করে আপনার ডেভেলপমেন্ট পরিবেশ সেটআপ করতে পারবেন
- বিভিন্ন ইনস্টলেশন অপশনসমূহ এবং কখন কোনটি ব্যবহার করবেন তা বুঝতে পারবেন
- সাধারণ ইনস্টলেশন ও সেটআপ সমস্যা সমাধান করতে পারবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- আপনার প্ল্যাটফর্মের উপযুক্ত পদ্ধতি ব্যবহার করে azd ইনস্টল করতে
- azd auth login ব্যবহার করে Azure-এ প্রমাণীকরণ করতে
- আপনার ইনস্টলেশন যাচাই ও মৌলিক azd কমান্ডগুলি টেস্ট করতে
- azd ব্যবহারের জন্য আপনার ডেভেলপমেন্ট পরিবেশ কনফিগার করতে
- সাধারণ ইনস্টলেশন সমস্যাগুলো স্বাধীনভাবে সমাধান করতে

এই গাইডটি আপনার অপারেটিং সিস্টেম বা ডেভেলপমেন্ট পরিবেশ যাই হোক না কেন, Azure Developer CLI ইনস্টল ও কনফিগার করতে সহায়তা করবে।

## পূর্বশর্ত

azd ইনস্টল করার আগে নিশ্চিত করুন আপনার কাছে আছে:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - প্রমাণীকরণ এবং রিসোর্স ম্যানেজমেন্টের জন্য
- **Git** - টেমপ্লেট ক্লোনিং ও সংস্করণ নিয়ন্ত্রণের জন্য
- **Docker** (ঐচ্ছিক) - কনটেইনারাইজড অ্যাপ্লিকেশনগুলির জন্য

## ইনস্টলেশন পদ্ধতি

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# অ্যাডমিনিস্ট্রেটর হিসেবে বা উচ্চতর অনুমতিসহ চালান
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# ডাউনলোড এবং ইনস্টল করুন
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft প্যাকেজ রেপোজিটরি যোগ করুন
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ইনস্টল করুন
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# মাইক্রোসফট প্যাকেজ রিপোজিটরি যোগ করুন
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces-এ পূর্ব-ইনস্টল করা থাকে। কেবল একটি codespace তৈরি করুন এবং সঙ্গে সঙ্গে azd ব্যবহার শুরু করুন।

### Docker

```bash
# azd একটি কনটেইনারে চালান
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# সহজ ব্যবহারের জন্য একটি অ্যালিয়াস তৈরি করুন
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ইনস্টলেশন যাচাই করুন

ইনস্টলেশনের পরে, নিশ্চিত করুন azd সঠিকভাবে কাজ করছে:

```bash
# সংস্করণ পরীক্ষা করুন
azd version

# সহায়তা দেখুন
azd --help

# উপলব্ধ টেমপ্লেটগুলি তালিকাভুক্ত করুন
azd template list
```

প্রত্যাশিত আউটপুট:
```
azd version 1.x.x (commit xxxxxx)
```

**দ্রষ্টব্য**: প্রকৃত সংস্করণের নম্বর পরিবর্তিত হবে। সর্বশেষ সংস্করণের জন্য চেক করুন [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ ইনস্টলেশন সফলতার চেকলিস্ট:**
- [ ] `azd version` ত্রুটি ছাড়া সংস্করণ নম্বর দেখায়
- [ ] `azd --help` কমান্ড ডকুমেন্টেশন দেখায়
- [ ] `azd template list` উপলব্ধ টেমপ্লেটগুলো দেখায়
- [ ] `az account show` আপনার Azure সাবস্ক্রিপশন দেখায়
- [ ] আপনি একটি টেস্ট ডিরেক্টরি তৈরি করে `azd init` সফলভাবে চালাতে পারেন

**যদি সব চেক পাশ হয়, আপনি প্রস্তুত [Your First Project](first-project.md) এ এগিয়ে যেতে!**

## প্রমাণীকরণ সেটআপ

### Azure CLI Authentication (Recommended)
```bash
# যদি এখনও ইনস্টল করা না থাকে তবে Azure CLI ইন্সটল করুন
# উইন্ডোজ: winget install Microsoft.AzureCLI
# ম্যাকওএস: brew install azure-cli
# লিনাক্স: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure-এ লগইন করুন
az login

# প্রমাণীকরণ যাচাই করুন
az account show
```

### Device Code Authentication
আপনি যদি হেডলেস সিস্টেমে থাকেন বা ব্রাউজার সমস্যায় পড়েন:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
স্বয়ংক্রিয় পরিবেশগুলির জন্য:
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

### এনভায়রনমেন্ট ভেরিয়েবলস
আপনার শেল প্রোফাইলে যোগ করুন (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure কনফিগারেশন
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd কনফিগারেশন
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ডিবাগ লগিং সক্ষম করুন
```

## আইডিই ইন্টিগ্রেশন

### Visual Studio Code
Azure Developer CLI এক্সটেনশন ইনস্টল করুন:
1. VS Code খুলুন
2. Extensions (Ctrl+Shift+X) এ যান
3. "Azure Developer CLI" সার্চ করুন
4. এক্সটেনশনটি ইনস্টল করুন

ফিচারসমূহ:
- azure.yaml এর জন্য IntelliSense
- ইন্টিগ্রেটেড টার্মিনাল কমান্ডসমূহ
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
3. azd কমান্ডগুলির জন্য ইন্টিগ্রেটেড টার্মিনাল ব্যবহার করুন

## 🐛 ইনস্টলেশন ট্রাবলশুটিং

### সাধারণ সমস্যা

#### Permission Denied (Windows)
```powershell
# PowerShell-কে প্রশাসক হিসেবে চালান
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH সমস্যা
হাতে-হাতে azd আপনার PATH-এ যোগ করুন:

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

# SSL যাচাইকরণ এড়িয়ে যান (প্রোডাকশনে এটি সুপারিশ করা হয় না)
azd config set http.insecure true
```

#### সংস্করণ সংঘাত
```bash
# পুরানো ইনস্টলেশন অপসারণ করুন
# উইন্ডোজ: winget uninstall Microsoft.Azd
# ম্যাকওএস: brew uninstall azd
# লিনাক্স: sudo apt remove azd

# কনফিগারেশন পরিষ্কার করুন
rm -rf ~/.azd
```

### আরও সহায়তা নেয়া
```bash
# ডিবাগ লগিং সক্ষম করুন
export AZD_DEBUG=true
azd <command> --debug

# বর্তমান কনফিগারেশন দেখুন
azd config list

# বর্তমান ডিপ্লয়মেন্ট অবস্থা দেখুন
azd show
```

## azd আপডেট করা

### স্বয়ংক্রিয় আপডেট
azd আপডেট উপলব্ধ হলে আপনাকে নোটিফাই করবে:
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

## 💡 প্রায়শই জিজ্ঞাসিত প্রশ্নাবলী

<details>
<summary><strong>azd এবং az CLI-র মধ্যে পার্থক্য কী?</strong></summary>

**Azure CLI (az)**: পৃথক Azure রিসোর্স পরিচালনার জন্য নিম্ন-স্তরের টুল
- `az webapp create`, `az storage account create`
- এক সময়ে এক রিসোর্স
- অবকাঠামো পরিচালনার উপর দৃষ্টি

**Azure Developer CLI (azd)**: সম্পূরক অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য উচ্চ-স্তরের টুল
- `azd up` পুরো অ্যাপ এবং সকল রিসোর্স ডিপ্লয় করে
- টেমপ্লেট-ভিত্তিক ওয়ার্কফ্লো
- ডেভেলপার উৎপাদনশীলতার উপর ফোকাস

**আপনার উভয়টারই প্রয়োজন**: azd প্রমাণীকরণের জন্য az CLI ব্যবহার করে
</details>

<details>
<summary><strong>আমি কি বিদ্যমান Azure রিসোর্সের সাথে azd ব্যবহার করতে পারি?</strong></summary>

হ্যাঁ! আপনি করতে পারেন:
1. বিদ্যমান রিসোর্সগুলোকে azd environments-এ ইমপোর্ট করুন
2. আপনার Bicep টেমপ্লেটে বিদ্যমান রিসোর্স রেফার করুন
3. বিদ্যমান অবকাঠামোর পাশাপাশি নতুন ডিপ্লয়মেন্টের জন্য azd ব্যবহার করুন

বিস্তারিত জানতে দেখুন [Configuration Guide](configuration.md)।
</details>

<details>
<summary><strong>azd কি Azure Government বা Azure China-এ কাজ করে?</strong></summary>

হ্যাঁ, ক্লাউড কনফিগার করুন:
```bash
# আজুর সরকার
az cloud set --name AzureUSGovernment
az login

# আজুর চীন
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>আমি কি CI/CD পাইপলাইনে azd ব্যবহার করতে পারি?</strong></summary>

অবশ্যই! azd অটোমেশন জন্য ডিজাইন করা হয়েছে:
- GitHub Actions ইন্টিগ্রেশন
- Azure DevOps সাপোর্ট
- সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
- নন-ইন্টারেক্টিভ মোড

CI/CD প্যাটার্নগুলোর জন্য দেখুন [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd ব্যবহার করার খরচ কত?</strong></summary>

azd নিজে **সম্পূর্ণভাবে বিনামূল্যে** এবং ওপেন-সোর্স। আপনি কেবলমাত্র যা জন্য টাকা দেবেন:
- আপনি যেসব Azure রিসোর্স ডিপ্লয় করবেন সেগুলো
- Azure খরচ (compute, storage ইত্যাদি)

ডিপ্লয়মেন্টের আগে খরচ অনুমান করতে ব্যবহার করুন `azd provision --preview`।
</details>

## পরবর্তী ধাপ

1. **প্রমাণীকরণ সম্পন্ন করুন**: নিশ্চিত করুন আপনি আপনার Azure সাবস্ক্রিপশনে অ্যাক্সেস করতে পারেন
2. **আপনার প্রথম ডিপ্লয়মেন্ট চেষ্টা করুন**: অনুসরণ করুন [First Project Guide](first-project.md)
3. **টেমপ্লেট অন্বেষণ করুন**: `azd template list` দিয়ে উপলব্ধ টেমপ্লেট ব্রাউজ করুন
4. **আপনার আইডিই কনফিগার করুন**: আপনার ডেভেলপমেন্ট পরিবেশ সেটআপ করুন

## সাপোর্ট

আপনি যদি সমস্যার সম্মুখীন হন:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: অধ্যায় 1 - ভিত্তি ও তৎক্ষণাৎ শুরু
- **⬅️ পূর্বের**: [AZD Basics](azd-basics.md) 
- **➡️ পরের**: [Your First Project](first-project.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ইনস্টলেশন সম্পন্ন!** শুরু করতে [Your First Project](first-project.md) এ যান এবং azd দিয়ে নির্মাণ শুরু করুন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই ডকুমেন্টটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসাধ্য নির্ভুলতা নিশ্চিত করার চেষ্টা করি, তবুও স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অদৃশ্যতা থাকতে পারে। মূল নথিটি তার নিজ ভাষায় প্রামাণ্য উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ পরামর্শ করা হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুলবোঝা বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
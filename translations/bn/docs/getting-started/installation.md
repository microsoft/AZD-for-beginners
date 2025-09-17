<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T18:49:05+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "bn"
}
-->
# ইনস্টলেশন ও সেটআপ গাইড

**পূর্ববর্তী:** [প্রধান ডকুমেন্টেশন](../../README.md) | **পরবর্তী:** [AZD বেসিকস](azd-basics.md)

## ভূমিকা

এই বিস্তারিত গাইডটি আপনাকে আপনার সিস্টেমে Azure Developer CLI (azd) ইনস্টল এবং কনফিগার করার প্রক্রিয়ার মধ্য দিয়ে নিয়ে যাবে। আপনি বিভিন্ন অপারেটিং সিস্টেমের জন্য একাধিক ইনস্টলেশন পদ্ধতি, প্রমাণীকরণ সেটআপ এবং প্রাথমিক কনফিগারেশন শিখবেন যা Azure ডিপ্লয়মেন্টের জন্য আপনার ডেভেলপমেন্ট পরিবেশ প্রস্তুত করবে।

## শেখার লক্ষ্য

এই পাঠ শেষে, আপনি:
- আপনার অপারেটিং সিস্টেমে সফলভাবে Azure Developer CLI ইনস্টল করতে পারবেন
- বিভিন্ন পদ্ধতি ব্যবহার করে Azure-এর সাথে প্রমাণীকরণ কনফিগার করতে পারবেন
- প্রয়োজনীয় পূর্বশর্ত সহ আপনার ডেভেলপমেন্ট পরিবেশ সেটআপ করতে পারবেন
- বিভিন্ন ইনস্টলেশন বিকল্প এবং কখন কোনটি ব্যবহার করবেন তা বুঝতে পারবেন
- সাধারণ ইনস্টলেশন এবং সেটআপ সমস্যাগুলি সমাধান করতে পারবেন

## শেখার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি:
- আপনার প্ল্যাটফর্মের জন্য উপযুক্ত পদ্ধতি ব্যবহার করে azd ইনস্টল করতে পারবেন
- azd auth login ব্যবহার করে Azure-এর সাথে প্রমাণীকরণ করতে পারবেন
- আপনার ইনস্টলেশন যাচাই করতে এবং মৌলিক azd কমান্ড পরীক্ষা করতে পারবেন
- azd ব্যবহারের জন্য আপনার ডেভেলপমেন্ট পরিবেশ কনফিগার করতে পারবেন
- সাধারণ ইনস্টলেশন সমস্যাগুলি স্বাধীনভাবে সমাধান করতে পারবেন

এই গাইডটি আপনাকে আপনার অপারেটিং সিস্টেম বা ডেভেলপমেন্ট পরিবেশ নির্বিশেষে আপনার সিস্টেমে Azure Developer CLI ইনস্টল এবং কনফিগার করতে সাহায্য করবে।

## পূর্বশর্ত

azd ইনস্টল করার আগে নিশ্চিত করুন যে আপনার কাছে রয়েছে:
- **Azure সাবস্ক্রিপশন** - [একটি বিনামূল্যের অ্যাকাউন্ট তৈরি করুন](https://azure.microsoft.com/free/)
- **Azure CLI** - প্রমাণীকরণ এবং রিসোর্স ম্যানেজমেন্টের জন্য
- **Git** - টেমপ্লেট ক্লোনিং এবং ভার্সন কন্ট্রোলের জন্য
- **Docker** (ঐচ্ছিক) - কন্টেইনারাইজড অ্যাপ্লিকেশনের জন্য

## ইনস্টলেশন পদ্ধতি

### উইন্ডোজ

#### বিকল্প ১: PowerShell (প্রস্তাবিত)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### বিকল্প ২: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### বিকল্প ৩: Chocolatey
```cmd
choco install azd
```

#### বিকল্প ৪: ম্যানুয়াল ইনস্টলেশন
1. [GitHub](https://github.com/Azure/azure-dev/releases) থেকে সর্বশেষ রিলিজ ডাউনলোড করুন
2. `C:\Program Files\azd\`-এ এক্সট্র্যাক্ট করুন
3. PATH পরিবেশ ভেরিয়েবলে যোগ করুন

### macOS

#### বিকল্প ১: Homebrew (প্রস্তাবিত)
```bash
brew tap azure/azd
brew install azd
```

#### বিকল্প ২: ইনস্টল স্ক্রিপ্ট
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### বিকল্প ৩: ম্যানুয়াল ইনস্টলেশন
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### লিনাক্স

#### বিকল্প ১: ইনস্টল স্ক্রিপ্ট (প্রস্তাবিত)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### বিকল্প ২: প্যাকেজ ম্যানেজার

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces-এ প্রি-ইনস্টল করা থাকে। একটি কোডস্পেস তৈরি করুন এবং azd ব্যবহার শুরু করুন।

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ইনস্টলেশন যাচাই

ইনস্টলেশনের পরে, নিশ্চিত করুন azd সঠিকভাবে কাজ করছে:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

প্রত্যাশিত আউটপুট:
```
azd version 1.5.0 (commit abc123)
```

## প্রমাণীকরণ সেটআপ

### Azure CLI প্রমাণীকরণ (প্রস্তাবিত)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### ডিভাইস কোড প্রমাণীকরণ
যদি আপনি একটি হেডলেস সিস্টেমে থাকেন বা ব্রাউজার সমস্যায় পড়েন:
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
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### পরিবেশ ভেরিয়েবল
আপনার শেল প্রোফাইলে যোগ করুন (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE ইন্টিগ্রেশন

### Visual Studio Code
Azure Developer CLI এক্সটেনশন ইনস্টল করুন:
1. VS Code খুলুন
2. Extensions-এ যান (Ctrl+Shift+X)
3. "Azure Developer CLI" অনুসন্ধান করুন
4. এক্সটেনশনটি ইনস্টল করুন

বৈশিষ্ট্যসমূহ:
- azure.yaml-এর জন্য IntelliSense
- ইন্টিগ্রেটেড টার্মিনাল কমান্ড
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
3. azd কমান্ডের জন্য ইন্টিগ্রেটেড টার্মিনাল ব্যবহার করুন

## 🐛 ইনস্টলেশন সমস্যা সমাধান

### সাধারণ সমস্যা

#### অনুমতি অস্বীকৃত (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH সমস্যা
azd-কে আপনার PATH-এ ম্যানুয়ালি যোগ করুন:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### ভার্সন দ্বন্দ্ব
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### আরও সাহায্য পাওয়া
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd আপডেট করা

### স্বয়ংক্রিয় আপডেট
azd আপনাকে আপডেট উপলব্ধ হলে জানাবে:
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

## পরবর্তী ধাপ

1. **প্রমাণীকরণ সম্পন্ন করুন**: নিশ্চিত করুন যে আপনি আপনার Azure সাবস্ক্রিপশনে অ্যাক্সেস করতে পারেন
2. **আপনার প্রথম ডিপ্লয়মেন্ট চেষ্টা করুন**: [প্রথম প্রকল্প গাইড](first-project.md) অনুসরণ করুন
3. **টেমপ্লেট অন্বেষণ করুন**: `azd template list` ব্যবহার করে উপলব্ধ টেমপ্লেট ব্রাউজ করুন
4. **আপনার IDE কনফিগার করুন**: আপনার ডেভেলপমেন্ট পরিবেশ সেটআপ করুন

## সহায়তা

যদি আপনি সমস্যার সম্মুখীন হন:
- [অফিশিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [সমস্যা রিপোর্ট করুন](https://github.com/Azure/azure-dev/issues)
- [কমিউনিটি আলোচনা](https://github.com/Azure/azure-dev/discussions)
- [Azure সহায়তা](https://azure.microsoft.com/support/)

---

**পূর্ববর্তী:** [প্রধান ডকুমেন্টেশন](../../README.md) | **পরবর্তী:** [AZD বেসিকস](azd-basics.md)

**ইনস্টলেশন সম্পন্ন!** [আপনার প্রথম প্রকল্প](first-project.md)-এ এগিয়ে যান এবং azd দিয়ে কাজ শুরু করুন।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিক অনুবাদ প্রদানের চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
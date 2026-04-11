# ইনস্টলেশন এবং সেটআপ গাইড

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ১ - ভিত্তি এবং দ্রুত শুরু
- **⬅️ আগের**: [AZD বেসিকস](azd-basics.md)
- **➡️ পরের**: [আপনার প্রথম প্রকল্প](first-project.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার ২: এআই-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

এই বিস্তৃত গাইডটি আপনাকে Azure Developer CLI (azd) আপনার সিস্টেমে ইনস্টল এবং কনফিগার করতে সাহায্য করবে। আপনি বিভিন্ন অপারেটিং সিস্টেমের জন্য একাধিক ইনস্টলেশন পদ্ধতি, প্রমাণীকরণ সেটআপ, এবং Azure ডিপ্লয়মেন্টের জন্য আপনার উন্নয়ন পরিবেশ প্রস্তুত করার প্রাথমিক কনফিগারেশন শিখবেন।

## শিক্ষার লক্ষ্য

এই পাঠের শেষে, আপনি পারবেন:
- আপনার অপারেটিং সিস্টেমে সফলভাবে Azure Developer CLI ইনস্টল করতে
- একাধিক পদ্ধতি ব্যবহার করে Azure এর সাথে প্রমাণীকরণ কনফিগার করতে
- আপনার উন্নয়ন পরিবেশ প্রয়োজনীয় শর্তাদি দিয়ে সেটআপ করতে
- বিভিন্ন ইনস্টলেশন অপশন এবং কখন কোনটি ব্যবহার করবেন তা বুঝতে
- সাধারণ ইনস্টলেশন এবং সেটআপ সমস্যা সমাধান করতে

## শিক্ষার ফলাফল

এই পাঠ সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- আপনার প্ল্যাটফর্মের জন্য উপযুক্ত পদ্ধতিতে azd ইনস্টল করতে
- azd auth login ব্যবহার করে Azure এর সাথে প্রমাণীকরণ করতে
- আপনার ইনস্টলেশন যাচাই করতে এবং মৌলিক azd কমান্ড পরীক্ষা করতে
- azd সঠিক ব্যবহারের জন্য আপনার উন্নয়ন পরিবেশ কনফিগার করতে
- সাধারণ ইনস্টলেশন সমস্যা স্বাধীনভাবে সমাধান করতে

এই গাইডটি আপনাকে Azure Developer CLI আপনার সিস্টেমে ইনস্টল এবং কনফিগার করতে সাহায্য করবে, আপনার অপারেটিং সিস্টেম বা উন্নয়ন পরিবেশ যাই হোক না কেন।

## পূর্বশর্ত

azd ইনস্টল করার আগে নিশ্চিত করুন আপনার কাছে আছে:
- **Azure সাবস্ক্রিপশন** - [একটি ফ্রি অ্যাকাউন্ট তৈরি করুন](https://azure.microsoft.com/free/)
- **Azure CLI** - প্রমাণীকরণ এবং রিসোর্স ম্যানেজমেন্টের জন্য
- **Git** - টেমপ্লেট ক্লোন এবং ভার্সন কন্ট্রোলের জন্য
- **Docker** (ঐচ্ছিক) - কনটেইনারাইজড অ্যাপ্লিকেশনগুলির জন্য

## ইনস্টলেশন পদ্ধতি

### উইন্ডোজ

#### অপশন ১: উইন্ডোজ প্যাকেজ ম্যানেজার (প্রস্তাবিত)
```cmd
winget install microsoft.azd
```

#### অপশন ২: পাওয়ারশেল ইনস্টল স্ক্রিপ্ট
```powershell
# উইঙ্গেট অনুপলব্ধ থাকলে কার্যকর
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### অপশন ৩: চকোলেটি
```cmd
choco install azd
```

#### অপশন ৪: ম্যানুয়াল ইনস্টলেশন
1. [GitHub](https://github.com/Azure/azure-dev/releases) থেকে সর্বশেষ রিলিজ ডাউনলোড করুন
2. `C:\Program Files\azd\` এ এক্সট্র্যাক্ট করুন
3. PATH পরিবেশ ভেরিয়েবলে যোগ করুন

### ম্যাকওএস

#### অপশন ১: হোমব্রু (প্রস্তাবিত)
```bash
brew tap azure/azd
brew install azd
```

#### অপশন ২: ইনস্টল স্ক্রিপ্ট
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### অপশন ৩: ম্যানুয়াল ইনস্টলেশন
```bash
# ডাউনলোড এবং ইনস্টল করুন
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### লিনাক্স

#### অপশন ১: ইনস্টল স্ক্রিপ্ট (প্রস্তাবিত)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### অপশন ২: প্যাকেজ ম্যানেজার

**রিলিজ অ্যাসেট থেকে ম্যানুয়াল ইনস্টলেশন:**
```bash
# আপনার লিনাক্স আর্কিটেকচারের জন্য সর্বশেষ আর্কাইভটি থেকে ডাউনলোড করুন:
# https://github.com/Azure/azure-dev/releases
# তারপর এটি এক্সট্র্যাক্ট করুন এবং azd বাইনারিটি আপনার PATH-এ যোগ করুন।
```

### গিটহাব কোডস্পেসেস

কিছু কোডস্পেসেস এবং ডেভ কন্টেইনার পরিবেশ ইতিমধ্যেই `azd` অন্তর্ভুক্ত করে, তবে অনুমান করার বদলে যাচাই করা উচিত:

```bash
azd version
```

যদি `azd` অনুপস্থিত থাকে, তাহলে পরিবেশের জন্য স্ট্যান্ডার্ড স্ক্রিপ্ট ব্যবহার করে এটি ইনস্টল করুন।

### ডকার

```bash
# একটি কনটেইনারে azd চালান
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# সহজ ব্যবহারের জন্য একটি ছদ্মনাম তৈরি করুন
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ইনস্টলেশন যাচাই করুন

ইনস্টলেশনের পরে, azd সঠিকভাবে কাজ করছে কিনা যাচাই করুন:

```bash
# সংস্করণ পরীক্ষা করুন
azd version

# সাহায্য দেখুন
azd --help

# উপলব্ধ টেমপ্লেটগুলি তালিকা করুন
azd template list
```

প্রত্যাশিত আউটপুট:
```
azd version 1.x.x (commit xxxxxx)
```

**নোট**: প্রকৃত ভার্সন নম্বর ভিন্ন হবে। সর্বশেষ সংস্করণের জন্য [Azure Developer CLI রিলিজ](https://github.com/Azure/azure-dev/releases) দেখুন।

**✅ ইনস্টলেশন সফলতার চেকলিস্ট:**
- [ ] `azd version` ত্রুটি ছাড়াই সংস্করণ নম্বর দেখায়
- [ ] `azd --help` কমান্ড ডকুমেন্টেশন প্রদর্শন করে
- [ ] `azd template list` উপলব্ধ টেমপ্লেট দেখায়
- [ ] আপনি একটি টেস্ট ডিরেক্টরি তৈরি করতে পারেন এবং সফলভাবে `azd init` চালাতে পারেন

**যদি সমস্ত চেক সফল হয়, তাহলে আপনি [আপনার প্রথম প্রকল্প](first-project.md) এ এগিয়ে যেতে প্রস্তুত!**

## প্রমাণীকরণ সেটআপ

### প্রস্তাবিত новичক সেটআপ

AZD-প্রথম কর্মপ্রবাহের জন্য, `azd auth login` দিয়ে সাইন ইন করুন।

```bash
# azd up এর মতো AZD কমান্ডের জন্য প্রয়োজন
azd auth login

# AZD প্রমাণীকরণ স্থিতি যাচাই করুন
azd auth login --check-status
```

কোর্স চলাকালীন যখন আপনি নিজে `az` কমান্ড চালানোর পরিকল্পনা করেন তখনই Azure CLI সাইন-ইন ব্যবহার করুন।

### Azure CLI প্রমাণীকরণ (ঐচ্ছিক)
```bash
# যদি ইতিমধ্যে ইনস্টল না করা থাকে তাহলে Azure CLI ইনস্টল করুন
# উইন্ডোজ: winget install Microsoft.AzureCLI
# ম্যাকওএস: brew install azure-cli
# লিনাক্স: আপনার বিতরণের জন্য Azure CLI ইনস্টল ডকুমেন্টেশন দেখুন

# Azure এ লগইন করুন
az login

# প্রমাণীকরণ যাচাই করুন
az account show
```

### কোন সাইন-ইন ফ্লো ব্যবহার করবেন?

- যদি আপনি বিগিনার AZD পাথ অনুসরণ করেন এবং প্রধানত `azd` কমান্ড চালান, তবে `azd auth login` ব্যবহার করুন।
- যখন আপনি Azure CLI কমান্ড যেমন `az account show` বা সরাসরি রিসোর্স পরীক্ষা করতে চান তখন `az login` ও ব্যবহার করুন।
- যদি কোনো এক্সারসাইজে `azd` এবং `az` উভয় কমান্ড থাকে, তাহলে দুটো সাইন-ইন কমান্ড শুরুতেই একবার চালান।

### ডিভাইস কোড প্রমাণীকরণ
যদি আপনি হেডলেস সিস্টেমে থাকেন বা ব্রাউজার সমস্যা থাকে:
```bash
azd auth login --use-device-code
```

### সার্ভিস প্রিন্সিপাল (CI/CD)
স্বয়ংক্রিয় পরিবেশের জন্য:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### আপনার সম্পূর্ণ সেটআপ যাচাই করুন

যদি আপনি চ্যাপ্টার ১ শুরু করার আগে দ্রুত পরীক্ষামূলক প্রস্তুতি চান:

**উইন্ডোজ:**
```powershell
.\validate-setup.ps1
```

**ম্যাকওএস / লিনাক্স:**
```bash
bash ./validate-setup.sh
```

## কনফিগারেশন

### গ্লোবাল কনফিগারেশন
```bash
# ডিফল্ট সাবস্ক্রিপশন সেট করুন
azd config set defaults.subscription <subscription-id>

# ডিফল্ট অবস্থান সেট করুন
azd config set defaults.location eastus2

# সমস্ত কনফিগারেশন দেখুন
azd config show
```

### পরিবেশ ভেরিয়েবল
আপনার শেল প্রোফাইলে (`.bashrc`, `.zshrc`, `.profile`) যোগ করুন:
```bash
# আজুর কনফিগারেশন
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd কনফিগারেশন
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # ডিবাগ লগিং সক্ষম করুন
```

## আইডিই ইন্টিগ্রেশন

### ভিজ্যুয়াল স্টুডিও কোড
Azure Developer CLI এক্সটেনশন ইনস্টল করুন:
1. VS Code খুলুন
2. এক্সটেনশনে যান (Ctrl+Shift+X)
3. "Azure Developer CLI" খুঁজুন
4. এক্সটেনশন ইনস্টল করুন

বৈশিষ্ট্য:
- azure.yaml এর জন্য IntelliSense
- ইন্টিগ্রেটেড টার্মিনাল কমান্ড
- টেমপ্লেট ব্রাউজিং
- ডিপ্লয়মেন্ট মনিটরিং

### গিটহাব কোডস্পেসেস
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
2. Azure ক্রেডেনশিয়ালস কনফিগার করুন
3. ইন্টিগ্রেটেড টার্মিনাল থেকে azd কমান্ড ব্যবহার করুন

## 🐛 ইনস্টলেশন সমস্যা সমাধান

### সাধারণ সমস্যা

#### অনুমতি অস্বীকৃত (উইন্ডোজ)
```powershell
# PowerShell অ্যাডমিনিস্ট্রেটর হিসেবে চালান
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH সমস্যা
হাত দিয়ে azd আপনার PATH এ যোগ করুন:

**উইন্ডোজ:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**ম্যাকওএস/লিনাক্স:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### নেটওয়ার্ক/প্রক্সি সমস্যা
```bash
# প্রক্সি কনফিগার করুন
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL যাচাইকরণ এড়িয়ে যান (প্রোডাকশনের জন্য সুপারিশ করা হয় না)
azd config set http.insecure true
```

#### সংস্করণ সংঘাত
```bash
# পুরানো ইনস্টলেশন সরান
# উইন্ডোজ: winget uninstall microsoft.azd
# ম্যাকওএস: brew uninstall azd
# লিনাক্স: পুনঃইনস্টলেশনের আগে পূর্ববর্তী azd বাইনারি বা সিমলিঙ্ক সরান

# কনফিগারেশন পরিষ্কার করুন
rm -rf ~/.azd
```

### আরও সাহায্য পাওয়া
```bash
# ডিবাগ লগিং সক্ষম করুন
export AZD_DEBUG=true
azd <command> --debug

# বর্তমান কনফিগারেশন দেখুন
azd config show

# বর্তমান ডিপ্লয়মেন্টের অবস্থা দেখুন
azd show
```

## azd আপডেট করা

### আপডেট চেক
azd তখনই সতর্ক করে যখন একটি নতুন রিলিজ পাওয়া যায়, এবং আপনি আপনার বর্তমান বিল্ড নিশ্চিত করতে পারেন:
```bash
azd version
```

### ম্যানুয়াল আপডেট

**উইন্ডোজ (winget):**
```cmd
winget upgrade microsoft.azd
```

**ম্যাকওএস (হোমব্রু):**
```bash
brew upgrade azd
```

**লিনাক্স:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 প্রায়শই জিজ্ঞাস্য

<details>
<summary><strong>azd এবং az CLI এর মধ্যে পার্থক্য কী?</strong></summary>

**Azure CLI (az)**: পৃথক Azure রিসোর্স পরিচালনার জন্য নিচ-স্তরের টুল
- `az webapp create`, `az storage account create`
- এক সময়ে এক রিসোর্স
- অবকাঠামো ব্যবস্থাপনা কেন্দ্রিক

**Azure Developer CLI (azd)**: সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয়মেন্টের জন্য উচ্চ-স্তরের টুল
- `azd up` সম্পূর্ণ অ্যাপ এবং সমস্ত রিসোর্স ডিপ্লয় করে
- টেমপ্লেট-ভিত্তিক কর্মপ্রবাহ
- ডেভেলপার উৎপাদনত্মকতা ফোকাস

**আপনার উভয়ের প্রয়োজন**: azd প্রমাণীকরণের জন্য az CLI ব্যবহার করে
</details>

<details>
<summary><strong>আমি কি বিদ্যমান Azure রিসোর্সের সাথে azd ব্যবহার করতে পারি?</strong></summary>

হ্যাঁ! আপনি পারেন:
1. বিদ্যমান রিসোর্স azd পরিবেশে ইমপোর্ট করতে
2. আপনার Bicep টেমপ্লেটে বিদ্যমান রিসোর্স রেফারেন্স করতে
3. বিদ্যমান অবকাঠামোর পাশে নতুন ডিপ্লয়মেন্টের জন্য azd ব্যবহার করতে

বিস্তারিত জানতে দেখুন [কনফিগারেশন গাইড](configuration.md)।
</details>

<details>
<summary><strong>azd কি Azure Government বা Azure China এর সাথে কাজ করে?</strong></summary>

হ্যাঁ, ক্লাউড কনফিগার করুন:
```bash
# আজুর গভর্নমেন্ট
az cloud set --name AzureUSGovernment
az login

# আজুর চীন
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>আমি কি CI/CD পাইপলাইনে azd ব্যবহার করতে পারি?</strong></summary>

অবশ্যই! azd স্বয়ংক্রিয়তার জন্য ডিজাইন করা হয়েছে:
- গিটহাব অ্যাকশনের ইন্টিগ্রেশন
- Azure DevOps সমর্থন
- সার্ভিস প্রিন্সিপাল প্রমাণীকরণ
- নন-ইন্টারেক্টিভ মোড

CI/CD প্যাটার্নের জন্য দেখুন [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd ব্যবহারের খরচ কত?</strong></summary>

azd নিজেই **সম্পূর্ণ ফ্রি** এবং ওপেন-সোর্স। আপনি শুধু যা পরিশোধ করবেন:
- আপনি যে Azure রিসোর্স ডিপ্লয় করবেন
- Azure ব্যবহার খরচ (কম্পিউট, স্টোরেজ, ইত্যাদি)

ডিপ্লয়মেন্টের আগে খরচ মূল্যায়নের জন্য `azd provision --preview` ব্যবহার করুন।
</details>

## পরবর্তী ধাপ

1. **প্রমাণীকরণ সম্পন্ন করুন**: নিশ্চিত করুন আপনি আপনার Azure সাবস্ক্রিপশনে প্রবেশ করতে পারেন
2. **আপনার প্রথম ডিপ্লয়মেন্ট চেষ্টা করুন**: [প্রথম প্রকল্প গাইড](first-project.md) অনুসরণ করুন
3. **টেমপ্লেট ব্রাউজ করুন**: উপলব্ধ টেমপ্লেট দেখুন `azd template list` ব্যবহার করে
4. **আপনার আইডিই কনফিগার করুন**: উন্নয়ন পরিবেশ সেটআপ করুন

## সহায়তা

যদি সমস্যার সম্মুখীন হন:
- [সরকারি ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [সমস্যার প্রতিবেদন](https://github.com/Azure/azure-dev/issues)
- [কমিউনিটি আলোচনা](https://github.com/Azure/azure-dev/discussions)
- [Azure সহায়তা](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` দিয়ে সরাসরি আপনার এডিটরে Azure কমান্ড নির্দেশনা পান

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ১ - ভিত্তি এবং দ্রুত শুরু
- **⬅️ আগের**: [AZD বেসিকস](azd-basics.md) 
- **➡️ পরের**: [আপনার প্রথম প্রকল্প](first-project.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার ২: এআই-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ইনস্টলেশন সম্পূর্ণ হয়েছে!** azd দিয়ে নির্মাণ শুরু করতে [আপনার প্রথম প্রকল্প](first-project.md) এ যান।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই ডকুমেন্টটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূলিত হয়েছে। যদিও আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, দয়া করে সচেতন থাকুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। প্রকৃত ডকুমেন্টটি তার নিজস্ব ভাষায়ই বিদ্যমান হওয়ায় সেটিকে প্রাধান্যপূর্ণ উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদারমানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
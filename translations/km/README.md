# AZD សម្រាប់អ្នកចាប់ផ្តើម៖ ធ្វើដំណើរសិក្សាមានរចនាសម្ព័ន្ធ

![AZD-for-beginners](../../translated_images/km/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ការប្រែសម្រួលដោយស្វ័យប្រវត្តិ (តែងតែទាន់សម័យ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](./README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ចូលចិត្តចម្លងក្នុងកុំព្យូទ័រផ្ទាល់ខ្លួន?**
>
> មានការប្រែសម្រួលជាភាសា ៥០+ នៅក្នុងឃ្លាំងនេះដែលធ្វើឲ្យទំហំនៃការទាញយកកាន់តែធំ។ ដើម្បីចម្លងដោយគ្មានការប្រែសម្រួល សូមប្រើ sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> វានឹងផ្តល់ឲ្យអ្នកនូវអ្វីគ្រប់យ៉ាងដែលត្រូវការដើម្បីបញ្ចប់វគ្គនេះដោយមានការទាញយកដែលរហ័សជាង។
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 មានអ្វីថ្មីនៅក្នុង azd ថ្ងៃនេះ

> 📌 វគ្គសិក្សានេះត្រូវបានផ្ទៀងផ្ទាត់ប្រឆាំងនឹង **`azd 1.27.1`** (ខែកក្កដា ២០២៦)។ ដំណើរការ `azd version` ដើម្បីពិនិត្យការសាងសង់របស់អ្នក ហើយ `azd upgrade` ដើម្បីទទួលបានថ្មីៗ។

Azure Developer CLI បានធំឡើងពីកម្មវិធីបណ្ដាញ និង API ប្រពៃណី។ ថ្ងៃនេះ, azd គឺជាឧបករណ៍តែមួយសម្រាប់ដាក់ពាក្យប្រើប្រាស់ **គ្រប់ប្រភេទ** ទៅ Azure រួមទាំងកម្មវិធី AI និងភ្នាក់ងារដែលមានប្រាជ្ញា។

នេះជាអ្វីដែលមានន័យសម្រាប់អ្នក៖

- **ភ្នាក់ងារ AI គឺជាការងារដ៏សំខាន់សម្រាប់ azd។** អ្នកអាចចាប់ផ្តើម ដាក់ពាក្យប្រើ និងគ្រប់គ្រងគម្រោងភ្នាក់ងារ AI ដោយប្រើដំណើរការ `azd init` → `azd up` ដែលអ្នកបានស្គាល់រួច។
- **ដំណើរការ agent lifecycle សរុបពី CLI។** បន្ថែម `azure.ai.agents` ឥឡូវនេះគ្របដណ្តប់ដំណើរការទាំងមូល—`azd ai agent init` ដើម្បីបង្កើតគម្រោង, `azd ai agent invoke` ដើម្បីសាកល្បង (ជាមួយលទ្ធផលចំណាយពេល), `azd ai agent eval generate` និង `azd ai agent optimize` ដើម្បីវាស់វែង និងបង្កើនគុណភាព, ហើយ `azd ai agent delete` ដើម្បីសម្អាត។
- **ប្លុកកសាង AI បន្ថែមទៀត។** បន្ថែមពិនិត្យមើលជាមុនថ្មី—`azure.ai.skills` និង `azure.ai.connections`—អនុញ្ញាតឲ្យគ្រប់គ្រងជំនាញភ្នាក់ងារច្រើនដងបាន និងការតភ្ជាប់ភោគភាគ Foundry តាមរយៈ azd ផ្ទាល់។
- **ការភ្ជាប់ Microsoft Foundry** ផ្ដល់ឲ្យមានការដាក់ម៉ូដែល, រៀបចំភ្ញាក់ភ្នាក់ងារ, និងកំណត់សេវាកម្ម AI លើតំបន់សំទូលមួយនៅក្នុងប្រព័ន្ធទំព័រ azd។
- **មូលដ្ឋានប្រចាំថ្ងៃរលូន។** ការចេញផ្សាយថ្មីៗបានធ្វើឲ្យ `azd init` មានលក្ខណៈ idempotent (មានសុវត្ថិភាពក្នុងការប្រតិបត្តិឡើងវិញ), ធ្វើឲ្យ `azd auth login` លុបស្លាកសញ្ញាចាស់ដោយស្វ័យប្រវត្តិ, ហើយបន្ថែមសេចក្តីណែនាំផ្តាំដំណើរការដំបូង `azd tool` ដែលមិត្តភាព។
- **ដំណើរការជាគន្លងមូលដ្ឋានមិនមានការផ្លាស់ប្តូរ។** មិនថាអ្នកកំពុងដាក់ពាក្យកម្មវិធី todo, សេវាកម្មតូច, ឬដំណោះស្រាយ AI ពហុភ្នាក់ងារ កម្មវិធីបញ្ជារបស់អ្នកត្រូវដដែល។

> **សម្គាល់សម្រាប់អ្នកប្រើ Aspire:** Microsoft ឥឡូវនេះហៅផលិតផលនេះគ្រាន់តែជា **Aspire** (ពីមុន ".NET Aspire")។ ការគាំទ្រ Aspire របស់ azd មិនបានផ្លាស់ប្តូរទេ — មានតែឈ្មោះតែងតែបានបន្ត។

ប្រសិនបើអ្នកបានប្រើ azd មុននេះ ការគាំទ្រពី AI គឺជាការពង្រីកធម្មជាតិ — មិនមែនជាឧបករណ៍ផ្សេងឬអ្នកតាមដានកម្រិតខ្ពស់ទេ។ ប្រសិនបើអ្នកចាប់ផ្តើមថ្មី អ្នកនឹងរៀនដំណើរការតែមួយដែលដំណើរការសម្រាប់គ្រប់យ៉ាង។

---

## 🚀 ​អ្វីទៅជា Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** គឺជាឧបករណ៍បញ្ជារាបស្មើរសម្រាប់អ្នកអភិវឌ្ឍន៍ដែលធ្វើឲ្យការដាក់ពាក្យកម្មវិធីទៅ Azure មានភាពសាមញ្ញ។ ជំនួសការបង្កើត និងភ្ជាប់ធនធាន Azure ច្រើនៗដោយដៃ អ្នកអាចដាក់ពាក្យកម្មវិធីគ្រប់យ៉ាងជាមួយពាក្យបញ្ជាเดียว។

### មហ្យោគទេសន៍របស់ `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**ហើយនេះហើយ!** គ្មានការចុចនៅលើ Azure Portal ទេ, គ្មានតែជំលាញ ARM ស្មុគស្មាញសម្រាប់រៀនជាលើកដំបូងទេ, គ្មានការកំណត់ដៃ - មានតែកម្មវិធីដំណើរការនៅលើ Azure។

---

## ❓ Azure Developer CLI ប្រៀបធៀបនឹង Azure CLI: ភាពខុសគ្នាជាអ្វី?

នេះជាសំណួរដែលអ្នកចាប់ផ្តើមសួរខ្លាំងបំផុត។ នេះជាចម្លើយសាមញ្ញ៖

| លក្ខណៈ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **គោលបំណង** | គ្រប់គ្រងធនធាន Azure មួយៗ | ដាក់ពាក្យកម្មវិធីពេញលេញ |
| **គំនិត** | ផ្ដោតលើហេដ្ឋារចនាសម្ព័ន្ធ | ផ្ដោតលើកម្មវិធី |
| **ឧទាហរណ៍** | `az webapp create --name myapp...` | `azd up` |
| **ការរៀន** | ត្រូវបានដឹងសេវាកម្ម Azure | ត្រូវជ្រាបកម្មវិធីរបស់អ្នក |
| **សម្រស់សម្រាប់** | DevOps, ហេដ្ឋារចនាសម្ព័ន្ធ | អ្នកអភិវឌ្ឍន៍, បែបបទគំរូ |

### ឧទាហរណ៍សាមញ្ញ

- **Azure CLI** គឺដូចជាការប្រើឧបករណ៍គ្រប់យ៉ាងដើម្បីសាងសង់ផ្ទះ មេឃ្មុំ, កន្ទុង, ក្រចក។ អ្នកអាចសាងសង់អ្វីមួយបានទាំងអស់ ប៉ុន្តែត្រូវចេះសំណង់។
- **Azure Developer CLI** គឺដូចជាការជួលជាងសំណង់ មនុស្សជាងសំណង់អោយអ្នកបរិច្ឆេទតើអ្នកចង់អ្វី ហើយគាត់នឹងចាត់ចែងការសាងសង់។

### ពេលដែលត្រូវប្រើមួយៗ

| សេណារីយ៉ូ | ប្រើរបស់នេះ |
|----------|----------|
| "ខ្ញុំចង់ដាក់ពាក្យកម្មវិធីបណ្ដាញរបស់ខ្ញុំយ៉ាងរហ័ស" | `azd up` |
| "ខ្ញុំត្រូវបង្កើតគណនីផ្ទុកតែគណនីមួយ" | `az storage account create` |
| "ខ្ញុំកំពុងសាងសង់កម្មវិធី AI ពេញលេញ" | `azd init --template azure-search-openai-demo` |
| "ខ្ញុំត្រូវដោះស្រាយបញ្ហារបស់ធនធាន Azure មួយជាក់លាក់" | `az resource show` |
| "ខ្ញុំចង់ដាក់ពាក្យផលិតកម្មក្នុងរយៈពេលជាក់លាក់" | `azd up --environment production` |

### ពួកគេចូលកិច្ចការជាមួយគ្នា!

AZD ប្រើ Azure CLI នៅក្រោមស្រទាប។ អ្នកអាចប្រើទាំងពីរ៖
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 រកមគ្គុទេសក៍នៅក្នុង Awesome AZD

កុំចាប់ផ្ដើមពីគ្មានអ្វីទេ! **Awesome AZD** គឺជាការប្រមូលផ្តុំតំបន់សហគមន៍នៃមគ្គុទេសក៍ដែលរួចរាល់សម្រាប់ដាក់ពាក្យ។

| ធនធាន | ពណ៌នា |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | រុះរើមគ្គុទេសក៏ ២០០+ ជាមួយការដាក់ពាក្យមួយចុច |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | ចូលរួមដាក់មគ្គុទេសក៏ផ្ទាល់របស់អ្នកទៅសហគមន៍ |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ផ្ដាច់ផ្ដាច់ និងស្វែងរកប្រភពកូដ |

### មគ្គុទេសក៏ AI ពេញនិយមពី Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 ចាប់ផ្ដើមក្នុង ៣ជំហាន

មុនចាប់ផ្តើម សូមប្រាកដថា ម៉ាស៊ីនរបស់អ្នកមានត្រៀមសម្រាប់មគ្គុទេសក៏ដែលអ្នកចង់ដាក់ពាក្យ:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ប្រសិនបើមានការត្រួតពិនិត្យធាតុមួយណាខ្វះ ខេត្តផ្ដើមជួសជុលនោះហើយបន្តជាមួយការចាប់ផ្ដើមលឿន។

### ជំហាន ១៖ បង្កើត AZD (2 នាទី)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ជំហាន ២៖ អះអាងសិទ្ធិសម្រាប់ AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

ប្រសិនបើអ្នកមិនប្រាកដថាតើត្រូវការ哪យ៉ាង សូមបន្តដំណើរការដំឡើងពេញលេញនៅក្នុង [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup)។

### ជំហាន ៣៖ ដាក់ពាក្យកម្មវិធីដំបូងរបស់អ្នក

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 ហេហេហេ!** កម្មវិធីរបស់អ្នកឥឡូវនេះមាននៅលើ Azure។

### សម្អាត (កុំភ្លេច!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 របៀបប្រើវគ្គសិក្សានេះ

វគ្គសិក្សានេះរចនាឡើងសម្រាប់ **ការសិក្សាប្រធានបទជាដំណាក់កាល** - ចាប់ផ្ដើមនៅកន្លែងដែលអ្នកមានអារម្មណ៍ស្អាតនិងបន្តឡើងខ្ពស់៖

| បទពិសោធន៍របស់អ្នក | ចាប់ផ្ដើមនៅទីនេះ |
|-----------------|------------|
| **ថ្មីទេនៅលើ Azure** | [ជំពូក ១៖ មូលដ្ឋាន](#-chapter-1-foundation--quick-start) |
| **ស្គាល់ Azure ប៉ុន្តែមិនស្គាល់ AZD** | [ជំពូក ១៖ មូលដ្ឋាន](#-chapter-1-foundation--quick-start) |
| **ចង់ដាក់ពាក្យកម្មវិធី AI** | [ជំពូក ២៖ អភិវឌ្ឍន៍ AI ជាដំបូង](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ចង់អនុវត្តប្រាជ្ញាផ្ទាល់** | [🎓 សិក្ខាសាលាផ្ទាល់](workshop/README.md) - ពេលវេលាគ្រប់គ្រង 3-4 ម៉ោង |
| **ត្រូវការគំរូផលិតកម្ម** | [ជំពូក ៨៖ ផលិតកម្ម និងសហគ្រាស](#-chapter-8-production--enterprise-patterns) |

### ការតម្លើងលឿន

1. **Fork ឃ្លាំងនេះ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ចម្លងវា**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ទទួលបានជំនួយ**: [សហគមន៍ Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **ចូលចិត្តចម្លងក្នុងកុំព្យូទ័រផ្ទាល់ខ្លួន?**

> មានការប្រែសម្រួលជាភាសា ៥០+ នៅក្នុងឃ្លាំងនេះដែលធ្វើឲ្យទំហំនៃការទាញយកកាន់តែធំ។ ដើម្បីចម្លងដោយគ្មានការប្រែសម្រួល សូមប្រើ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> វានឹងផ្តល់ឲ្យអ្នកនូវអ្វីគ្រប់យ៉ាងដែលត្រូវការដើម្បីបញ្ចប់វគ្គនេះដោយមានការទាញយកដែលរហ័សជាង។


## សង្ខេបវគ្គសិក្សា

ជាន់ខ្ពស់ Azure Developer CLI (azd) តាមរយៈជំពូកដែលរៀបចំសម្រាប់ការសិក្សាប្រធានបទជាដំណាក់កាល។ **ផ្តោតចម្បងលើការដាក់ពាក្យកម្មវិធី AI ជាមួយការភ្ជាប់ Microsoft Foundry។**

### ហេតុអ្វីវគ្គសិក្សានេះសំខាន់សម្រាប់អ្នកអភិវឌ្ឍសម័យថ្មី

នៅលើមូលដ្ឋាននៃដំណឹងសហគមន៍ Microsoft Foundry Discord, **៤៥% នៃអ្នកអភិវឌ្ឍចង់ប្រើ AZD សម្រាប់ការងារ AI** ប៉ុន្តែប្រឈមមុខនឹងបញ្ហា៖
- ស្ថាបត្យកម្ម AI សេវាកម្មជាច្រើនស្មុគស្មាញ
- អនុវត្តគន្លងផលិតកម្ម AI ល្អបំផុត  
- ការភ្ជាប់ និងកំណត់រចនាសម្ព័ន្ធសេវាកម្ម AI Azure
- ការប្រមូលផ្តុំថ្លៃដើមសម្រាប់ការងារ AI
- ដោះបញ្ហាក្នុងការដាក់ពាក្យ AI ជាក់លាក់

### គោលបំណងសិក្សា

ដោយបញ្ចប់វគ្គសិក្សាមានរចនាសម្ព័ន្ធនេះ អ្នកនឹង:
- **គ្រប់គ្រងមូលដ្ឋាន AZD**៖ គំនិតមូលដ្ឋាន ការដំឡើង និងកំណត់រចនាសម្ព័ន្ធ
- **ដាក់ពាក្យកម្មវិធី AI**៖ ប្រើ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **អនុវត្តស្ថាបត្យកម្មជាប្រភេទកូដ**៖ គ្រប់គ្រងធនធាន Azure ជាមួយនឹងគំរូ Bicep
- **ដោះស្រាយបញ្ហាក្នុងការដាក់បញ្ចូល**៖ ដោះស្រាយបញ្ហាទូទៅ និងបញ្ហាជាសំខាន់ៗ
- **បង្កើនប្រសិទ្ធភាពសម្រាប់រូបមន្តផលិត**៖ សុវត្ថិភាព ការពង្រីក អ្នកត្រួតពិនិត្យ និងការគ្រប់គ្រងថ្លៃដើម
- **សង់ដំណោះស្រាយជាច្រើនភ្នាក់ងារ**៖ ដាក់បញ្ចូលអាគារបញ្ញាសិប្បនិម្មិតស្មុគស្មាញ

## មុនចាប់ផ្តើម៖ គណនី ការចូលដំណើរការ និងការសន្មត់

មុនពេលចាប់ផ្តើមជំពូកទី ១ សូមធានាថាអ្នកមានអ្វីខ្លះខាងក្រោមរួចហើយ។ ជំហានដំឡើងនៅក្រោយមាគ៌ានេះសន្មត់ថាអ្នកបានដោះស្រាយធាតុគ្រឹះទាំងនេះរួច។

- **ការជាវ Azure មួយ**៖ អ្នកអាចប្រើការជាវដែលមានរួចតាមការងារឬគណនីផ្ទាល់ខ្លួន រឺបង្កើត [ការជាវសាកល្បងឥតគិតថ្លៃ](https://aka.ms/azurefreetrial) ដើម្បីចាប់ផ្តើម។
- **សិទ្ធិបង្កើតធនធាន Azure**៖ សម្រាប់កិច្ចការច្រើន អ្នកគួរតែមានការចូលដំណើរការដោយអ្នកចូលរួម ​(Contributor) ទាបបំផុតលើការជាវឬក្រុមធនធានគោលដៅ។ ជំពូកខ្លះក៏សន្មត់ថាអ្នកអាចបង្កើតក្រុមធនធាន អត្តសញ្ញាណគ្រប់គ្រង និងការ​ចាត់តាំង RBAC។
- [**គណនី GitHub**](https://github.com)៖ នេះមានប្រយោជន៍សម្រាប់ធ្វើការ fork រ៉ែស្តូរ ការតាមដានការផ្លាស់ប្ដូរផ្ទាល់ខ្លួន និងប្រើ GitHub Codespaces សម្រាប់វគ្គហាត់ប្រាណ។
- **ទម្រង់អំឡុងពេលរត់កម្មវិធី**៖ គំរូខ្លះត្រូវការឧបករណ៍ក្នុងតំបន់ដូចជា Node.js, Python, Java ឬ Docker។ រត់កម្មវិធីបញ្ជាក់មុនចាប់ផ្តើម ដូច្នេះអ្នកអាចចាប់បានឧបករណ៍ដែលខ្វះពីមុន។
- **ស្គាល់មូលដ្ឋានផ្ទាំងបញ្ជា**៖ អ្នកមិនចាំបាច់ជាអ្នកជំនាញទេ ប៉ុន្តែអ្នកគួរតែមានការស្រួលចិត្តក្នុងការប្រើបញ្ជារដូចជា `git clone`, `azd auth login`, និង `azd up`។

> **កំពុងធ្វើការនៅក្នុងការជាវស្ថាប័ន?**
> ប្រសិនបើបរិបទ Azure របស់អ្នកកំពុងត្រូវគ្រប់គ្រងដោយអ្នកគ្រប់គ្រង សូមបញ្ជាក់ពីមុនថាអ្នកអាចដាក់បញ្ចូលធនធានក្នុងការជាវឬក្រុមធនធានដែលអ្នកមានបំណងប្រើបាន។ ប្រសិនបើមិនមែនសូមស្នើសុំការជាវ sandbox ឬការចូលដំណើរការជាអ្នកចូលរួមមុនចាប់ផ្តើម។

> **ថ្មីចំពោះ Azure?**
> ចាប់ផ្តើមជាមួយការជាវសាកល្បងរបស់អ្នកឬការជាវបង់ប្រាក់-ចំពោះ-ការប្រើប្រាស់​របស់អ្នក នៅhttps://aka.ms/azurefreetrial ដើម្បីអាចបញ្ចប់កិច្ចការពេញលេញដោយមិនចាំបាច់រង់ចាំការអនុម័តពីកម្រិតជួល។

## 🗺️ ផែនទីវគ្គសិក្សា៖ ទៅមើលដោយរហ័សតាមជំពូក

ប្រភេទជំពូកនីមួយៗមាន README ផ្ទាល់ខ្លួនជាមួយគោលបំណងសិក្សា ចាប់ផ្តើមឆាប់ និងការអនុវត្ត៖

| ជំពូក | หัวข้อ | บทเรียน | เวลาที่ใช้ | ระดับความยาก |
|---------|-------|---------|----------|------------|
| **[ជំពូក 1៖ មូលដ្ឋាន](docs/chapter-01-foundation/README.md)** | ការចាប់ផ្តើម | [មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [ការដំឡើង](docs/chapter-01-foundation/installation.md) &#124; [គម្រោងដំបូង](docs/chapter-01-foundation/first-project.md) | ៣០-៤៥ នាទី | ⭐ |
| **[ជំពូក 2៖ ការអភិវឌ្ឍ AI](docs/chapter-02-ai-development/README.md)** | កម្មវិធី AI-First | [បញ្ចូល Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [ភ្នាក់ងារ AI](docs/chapter-02-ai-development/agents.md) &#124; [ការដាក់បញ្ចូលម៉ូដែល](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [វគ្គហាត់ប្រាណ](docs/chapter-02-ai-development/ai-workshop-lab.md) | ១-២ ម៉ោង | ⭐⭐ |
| **[ជំពូក 3៖ ការ​កំណត់​រចនាសម្ព័ន្ធ](docs/chapter-03-configuration/README.md)** | អត្តសញ្ញាណ & សន្តិសុខ | [ការកំណត់រចនាសម្ព័ន្ធ](docs/chapter-03-configuration/configuration.md) &#124; [អត្តសញ្ញាណ & សន្តិសុខ](docs/chapter-03-configuration/authsecurity.md) | ៤៥-៦០ នាទី | ⭐⭐ |
| **[ជំពូក 4៖ ស្ថាបត្យកម្ម](docs/chapter-04-infrastructure/README.md)** | IaC & ការដាក់តាំង | [មាគ៌ាការដាក់តាំង](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [ការផ្គត់ផ្គង់](docs/chapter-04-infrastructure/provisioning.md) | ១-១.៥ ម៉ោង | ⭐⭐⭐ |
| **[ជំពូក 5៖ អ្នក​តំណាង​ច្រើន](docs/chapter-05-multi-agent/README.md)** | ដំណោះស្រាយ AI Agent | [សេណារីយ៉ូលក់រាយ](examples/retail-scenario.md) &#124; [លំនាំការសម្របសម្រួល](docs/chapter-06-pre-deployment/coordination-patterns.md) | ២-៣ ម៉ោង | ⭐⭐⭐⭐ |
| **[ជំពូក 6៖ មុនការដាក់តាំង](docs/chapter-06-pre-deployment/README.md)** | ការរៀបចំនិងការត្រួតពិនិត្យ | [ការត្រួតពិនិត្យមុនហោះហើរ](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ការរៀបចំសមត្ថភាព](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [ការជ្រើសរើស SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ការវិភាគកម្មវិធី](docs/chapter-06-pre-deployment/application-insights.md) | ១ ម៉ោង | ⭐⭐ |
| **[ជំពូក 7៖ ដោះស្រាយបញ្ហា](docs/chapter-07-troubleshooting/README.md)** | ដោះស្រាយកំហុស & ផ្លាស់ប្តូរ | [បញ្ហាទូទៅ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ការស្វែងរកកំហុស](docs/chapter-07-troubleshooting/debugging.md) &#124; [បញ្ហា AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | ១-១.៥ ម៉ោង | ⭐⭐ |
| **[ជំពូក 8៖ ផលិតកម្ម](docs/chapter-08-production/README.md)** | លំនាំសហគ្រាស | [ការអនុវត្តផលិតកម្ម](docs/chapter-08-production/production-ai-practices.md) | ២-៣ ម៉ោង | ⭐⭐⭐⭐ |
| **[🎓 សិក្ខាសាលា](workshop/README.md)** | មន្ទីរពិសោធន៍អនុវត្ត | [ការណែនាំ](workshop/docs/instructions/0-Introduction.md) &#124; [ការជ្រើសរើស](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ការត្រួតពិនិត្យ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [ការបំបែក](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [ការកំណត់រចនាសម្ព័ន្ធ](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [ការផ្លាស់ប្តូរ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [ការចូលចិត្តបិទ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [ការសម្អាតចុងក្រោយ](workshop/docs/instructions/7-Wrap-up.md) | ៣-៤ ម៉ោង | ⭐⭐ |

**រយៈពេលសិក្សាសរុប៖** ~១០-១៤ ម៉ោង | **ការរីកចម្រើនជំនាញ៖** ចាប់ផ្ដើម → ត្រៀមខ្លួនសម្រាប់ផលិតកម្ម

---

## 📚 ជំពូករៀន

*ជ្រើសរើសផ្លូវរៀនរបស់អ្នកដោយផ្អែកលើកំរិតបទពិសោធន៍និងគោលដៅ*

### 🚀 ជំពូក 1៖ មូលដ្ឋាន & ចាប់ផ្ដើមរហ័ស
**លក្ខខណ្ឌមុន**៖ ការជាវ Azure, ចំណេះដឹងបូកបញ្ចូលបញ្ជារលេខមូលដ្ឋាន  
**រយៈពេល**៖ ៣០-៤៥ នាទី  
**ស្មុគស្មាញ**៖ ⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការយល់ដឹងពីមូលដ្ឋាន Azure Developer CLI
- ការដំឡើង AZD លើវេទិការបស់អ្នក
- ការដាក់តាំងជោគជ័យដំបូងរបស់អ្នក

#### ប្រភពរៀន
- **🎯 ចាប់ផ្ដើមនៅទីនេះ**៖ [Azure Developer CLI គឺអ្វី?](#what-is-azure-developer-cli)
- **📖 ទ្រឹស្តី**៖ [មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) - គំនិតមុខងារ និងពាក្យសម្គាល់
- **⚙️ ការតំឡើង**៖ [ការដំឡើង & ការកំណត់](docs/chapter-01-foundation/installation.md) - មគ្គុទេសក៍វេទិកាពិសេស
- **🛠️ អនុវត្ត**៖ [គម្រោងដំបូងរបស់អ្នក](docs/chapter-01-foundation/first-project.md) - មគ្គុទេសបន្ទាត់
- **📋 ឯកសារយោងរហ័ស**៖ [សៀវភៅបញ្ជា](resources/cheat-sheet.md)

#### ថ្នាក់ហាត់ផ្ទាល់
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 លទ្ធផលជំពូក**៖ ដាក់តាំងកម្មវិធីបណ្តាញសាមញ្ញដោយជោគជ័យទៅ Azure ដោយប្រើ AZD

**✅ ការបញ្ជាក់ជោគជ័យ៖**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 ផលិតផលកំណត់ពេលវេលា:** ៣០-៤៥ នាទី  
**📈 កំរិតជំនាញបន្ទាប់ពីរៀន:** អាចដាក់តាំងកម្មវិធីសាមញ្ញបានដោយឯករាជ្យ
**📈 កំរិតជំនាញបន្ទាប់ពីរៀន:** អាចដាក់តាំងកម្មវិធីសាមញ្ញបានដោយឯករាជ្យ

---

### 🤖 ជំពូក 2៖ ការអភិវឌ្ឍ AI ជាមុន (ផ្ដល់សំណើរសម្រាប់អ្នកអភិវឌ្ឍ AI)
**លក្ខខណ្ឌមុន**៖ ជំពូក 1 បានបញ្ចប់  
**រយៈពេល**៖ ១-២ ម៉ោង  
**ស្មុគស្មាញ**៖ ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- បញ្ចូល Microsoft Foundry ជាមួយ AZD
- ដាក់តាំងកម្មវិធីរបស់ AI
- យល់ដឹងពីការកំណត់សេវាកម្ម AI

#### ប្រភពរៀន
- **🎯 ចាប់ផ្ដើមនៅទីនេះ**៖ [ការបញ្ចូល Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 អ្នកតំណាង AI**៖ [មគ្គុទេសក៍អ្នកតំណាង AI](docs/chapter-02-ai-development/agents.md) - ដាក់តាំងអ្នកតំណាងបញ្ញាសាមញ្ញជាមួយ AZD
- **📖 លំនាំកំណត់**៖ [ការដាក់តាំងម៉ូដែល AI](docs/chapter-02-ai-development/ai-model-deployment.md) - ដាក់តាំងនិងគ្រប់គ្រងម៉ូដែល AI
- **🛠️ មន្ទីរពិសោធន៍**៖ [មន្ទីរពិសោធន៍ AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - បង្កើតដំណោះស្រាយ AI របស់អ្នកឲ្យប្រើ AZD បាន
- **🎥 មគ្គុទេសការបន្តចលនា**៖ [សម្ភារៈសិក្សា](workshop/README.md) - រៀនតាមកម្មវិធី MkDocs * បរិយាកាស DevContainer
- **📋 ទម្រង់**៖ [ទម្រង់ Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 ឧទាហរណ៍**៖ [ឧទាហរណ៍ការដាក់តាំង AZD](examples/README.md)

#### ថ្នាក់ហាត់ផ្ទាល់
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 លទ្ធផលជំពូក**៖ ដាក់តាំងនិងកំណត់កម្មវិធីជជែកដែលមានបច្ចេកវិទ្យា AI និងមានសមត្ថភាព RAG

**✅ ការបញ្ជាក់ជោគជ័យ៖**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 ផលិតផលកំណត់ពេលវេលា:** ១-២ ម៉ោង  
**📈 កំរិតជំនាញបន្ទាប់ពីរៀន:** អាចដាក់តាំងនិងកំណត់កម្មវិធី AI ដែលត្រៀមសម្រាប់ផលិតកម្មបាន  
**💰 ចំណេះដឹងថ្លៃដើម:** យល់ពីថ្លៃអភិវឌ្ឍ $៨០-១៥០/ខែ, ថ្លៃផលិតកម្ម $៣០០-៣៥០០/ខែ

#### 💰 ពិនិត្យលើថ្លៃសម្រាប់ការដាក់តាំង AI

**បរិយាកាសអភិវឌ្ឍ (ប៉ាន់ស្មាន $៨០-១៥០/ខែ):**
- ម៉ូដែល Microsoft Foundry (បង់ប្រាក់តាមប្រើប្រាស់): $0-50/ខែ (ផ្អែកលើការប្រើប្រាស់តុកែន)
- ស្វែងរក AI (កំរិតមូលដ្ឋាន): $៧៥/ខែ
- កម្មវិធី Container (ការប្រើប្រាស់): $0-20/ខែ
- ការផ្ទុកទិន្នន័យ (ស្តង់ដារ): $១-៥/ខែ

**បរិយាកាសផលិតកម្ម (ប៉ាន់ស្មាន $៣០០-៣,៥០០+/ខែ):**
- ម៉ូដែល Microsoft Foundry (PTU សម្រាប់ប្រសិទ្ធភាពថេរ): $៣,០០០+/ខែ ឬ បង់ប្រាក់តាមប្រើប្រាស់ជាមួយបរិមាណខ្ពស់
- ស្វែងរក AI (កំរិតស្តង់ដារ): $២៥០/ខែ
- កម្មវិធី Container (ឧទ្ទរន): $៥០-១០០/ខែ
- ការវិភាគកម្មវិធី: $៥-៥០/ខែ
- ការផ្ទុកទិន្នន័យ (ប្រូមីយ៉ម): $១០-៥០/ខែ

**💡 យុទ្ធសាស្ត្រកាត់បន្ថយថ្លៃ​ការចំណាយ៖**
- ប្រើ **កំរិតឥតគិតថ្លៃ** ម៉ូដែល Microsoft Foundry សម្រាប់ការរៀន (Azure OpenAI ៥០,០០០ តុកែន/ខែបញ្ចូលរួច)
- រៀបចំ `azd down` ដើម្បីដោះលែងធនធាននៅពេលមិនកំពុងអភិវឌ្ឍចលនា
- ចាប់ផ្ដើមជាមួយប្រព័ន្ធចំណាយបង់តាមការប្រើប្រាស់ បន្ទាប់មកបំលែងទៅ PTU សម្រាប់ផលិតកម្មតែប៉ុណ្ណោះ
- ប្រើ `azd provision --preview` ដើម្បីប៉ាន់ស្មានថ្លៃមុនការដាក់តាំង
- បើកមុខងារតម្លើងដោយស្វ័យប្រវត្តិ: បង់តែការប្រើប្រាស់ពិតប្រាកដ

**ការតាមដានថ្លៃចំណាយ:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ ជំពូក 3៖ ការកំណត់រចនាសម្ព័ន្ធ & ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
**លក្ខខណ្ឌមុន**៖ ជំពូក 1 បានបញ្ចប់  
**រយៈពេល**៖ ៤៥-៦០ នាទី  
**ស្មុគស្មាញ**៖ ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការកំណត់សីតិវិធីនិងការគ្រប់គ្រងបរិស្ថាន
- ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណនិងការអនុវត្តសន្តិសុខល្អបំផុត
- ការដាក់ឈ្មោះធនធាននិងការរៀបចំ

#### ប្រភពរៀន
- **📖 ការកំណត់រចនាសម្ព័ន្ធ**៖ [មគ្គុទេសក៍ការកំណត់រចនាសម្ព័ន្ធ](docs/chapter-03-configuration/configuration.md) - ការតំឡើងបរិស្ថាន
- **🔐 សន្តិសុខ**៖ [លំនាំការផ្ទៀងផ្ទាត់អត្តសញ្ញាណនិងអត្តសញ្ញាណគ្រប់គ្រង](docs/chapter-03-configuration/authsecurity.md) - លំនាំផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
- **📝 ឧទាហរណ៍**៖ [ឧទាហរណ៍កម្មវិធីទិន្នន័យ](examples/database-app/README.md) - ឧទាហរណ៍ទិន្នន័យ AZD

#### ថ្នាក់ហាត់ផ្ទាល់
- កំណត់បរិស្ថានច្រើន (dev, staging, prod)
- កំណត់ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណគ្រប់គ្រង
- អនុវត្តកំណត់រចនាសម្ព័ន្ធជាក់លាក់សម្រាប់បរិស្ថាន

**💡 លទ្ធផលជំពូក**៖ គ្រប់គ្រងបរិស្ថានច្រើនដោយមានការផ្ទៀងផ្ទាត់អត្តសញ្ញាណនិងសន្តិសុខត្រឹមត្រូវ

---

### 🏗️ ជំពូក 4៖ ស្ថាបត្យកម្មជាគូដ & ការដាក់តាំង
**លក្ខខណ្ឌមុន**៖ ជំពូក 1-3 បានបញ្ចប់  
**រយៈពេល**៖ ១-១.៥ ម៉ោង  
**ស្មុគស្មាញ**៖ ⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- លំនាំការដាក់តាំងកម្រិតខ្ពស់
- ស្ថាបត្យកម្មជា​កូដជាមួយ Bicep
- យុទ្ធសាស្ត្រផ្គត់ផ្គង់ធនធាន

#### ប្រភពរៀន
- **📖 ការដាក់តាំង**៖ [មគ្គុទេសការដាក់តាំង](docs/chapter-04-infrastructure/deployment-guide.md) - សៀវភៅពេញលេញ
- **🏗️ ការផ្គត់ផ្គង់**៖ [ការផ្គត់ផ្គង់ធនធាន](docs/chapter-04-infrastructure/provisioning.md) - ការគ្រប់គ្រងធនធាន Azure
- **📝 ឧទាហរណ៍**៖ [ឧទាហរណ៍កម្មវិធី Container](../../examples/container-app) - ដាក់តាំងផ្នែកចលករប្រភេទ Container

#### ថ្នាក់ហាត់ផ្ទាល់
- បង្កើតទម្រង់ Bicep ផ្ទាល់ខ្លួន
- ដាក់តាំងកម្មវិធីមូលហេតុច្រើន
- យុទ្ធសាស្ត្រដាក់តាំងពណ៌ខៀវ-បៃតង

**💡 លទ្ធផលជំពូក**៖ ដាក់តាំងកម្មវិធីមូលហេតុច្រើនស្មុគស្មាញដោយប្រើទម្រង់ស្ថាបត្យកម្មផ្ទាល់ខ្លួន

---

### 🎯 ជំពូក 5៖ ដំណោះស្រាយ AI អ្នក​តំណាង​ច្រើន (កម្រិតខ្ពស់)
**លក្ខខណ្ឌមុន**៖ ជំពូក 1-2 បានបញ្ចប់  
**រយៈពេល**៖ ២-៣ ម៉ោង  
**ស្មុគស្មាញ**៖ ⭐⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- លំនាំស្ថាបត្យកម្មអ្នកតំណាងច្រើន
- ការប្រតិបត្ដិការអ្នកតំណាងនិងការសម្របសម្រួល
- ការដាក់តាំង AI សម្រាប់ផលិតកម្ម

#### ប្រភពរៀន
- **🤖 គម្រោងពិសេស**៖ [ដំណោះស្រាយអ្នកតំណាងច្រើនលក់រាយ](examples/retail-scenario.md) - ការអនុវត្តពេញលេញ
- **🛠️ ទម្រង់ ARM**៖ [កញ្ចប់ទម្រង់ ARM](../../examples/retail-multiagent-arm-template) - ដាក់តាំងមួយចុច
- **📖 ស្ថាបត្យកម្ម**៖ [លំនាំសម្របសម្រួលអ្នកតំណាងច្រើន](docs/chapter-06-pre-deployment/coordination-patterns.md) - លំនាំ

#### ថ្នាក់ហាត់ផ្ទាល់
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 លទ្ធផលជំពូក**៖ ដាក់តាំងនិងគ្រប់គ្រងដំណោះស្រាយ AI អ្នកតំណាងច្រើនសម្រាប់ផលិតកម្មជាមួយអ្នកភ្ញៀវនិងអ្នកផ្គត់ផ្គង់ឃ្លាំង

---

### 🔍 ជំពូក 6៖ ការត្រួតពិនិត្យមុនការដាក់តាំង & ការរៀបចំផែនការ
**លក្ខខណ្ឌមុន**៖ ជំពូក 4 បានបញ្ចប់  
**រយៈពេល**៖ ១ ម៉ោង  
**ស្មុគស្មាញ**៖ ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការរៀបចំសមត្ថភាពនិងការត្រួតពិនិត្យធនធាន
- យុទ្ធសាស្ត្រជ្រើសរើស SKU
- ការត្រួតពិនិត្យមុនហោះហើរនិងស្វ័យប្រវត្តិកម្ម

#### ប្រភពរៀន
- **📊 ការធ្វើផែនការ**: [ការធ្វើផែនការឧបករណ៍](docs/chapter-06-pre-deployment/capacity-planning.md) - ការផ្ទៀងផ្ទាត់ធនធាន
- **💰 ការជ្រើសរើស**: [ការជ្រើសរើស SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ជម្រើសដែលមានតម្លៃសមរម្យ
- **✅ ការផ្ទៀងផ្ទាត់**: [ការត្រួតពិនិត្យមុនបិទហោះ](docs/chapter-06-pre-deployment/preflight-checks.md) - ស្គ្រីបអូតូម៉ាទិត្យ

#### លំហាត់ផ្នែកជាក់ស្ដែង
- ប្រតិបត្តិស្គ្រីបផ្ទៀងផ្ទាត់សមត្ថភាព
- បង្កើនប្រសិទ្ធភាពជ្រើសរើស SKU ដើម្បីកាត់បន្ថយឈ្នួល
- អនុវត្តន៍ការត្រួតពិនិត្យមុនការដាក់ឲ្យដំណើរការ​ស្វ័យប្រវត្តិ

**💡 លទ្ធផលជាបឋម**: ផ្ទៀងផ្ទាត់និងបង្កើនប្រសិទ្ធភាពការដាក់ឲ្យដំណើរការមុនពេលអនុវត្ត

---

### 🚨 មូទស្សន៍ទី 7៖ ការដោះស្រាយបញ្ហា និងបំបាត់កំហុស
**លក្ខខណ្ឌមុន**: បានបញ្ចប់មូទស្សន៍ណាមួយនៃការដាក់ឲ្យដំណើរការ  
**រយៈពេល**: 1-1.5 ម៉ោង  
**កម្រិតស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- វិធីសាស្រ្តបំបាត់កំហុសតាមប្រព័ន្ធ
- បញ្ហារួម និងដំណោះស្រាយ
- ការដោះស្រាយបញ្ហាពិសេស AI

#### ឯកសាររៀនប្រាជ្ញា
- **🔧 បញ្ហារួម**: [បញ្ហារួម](docs/chapter-07-troubleshooting/common-issues.md) - សំណួរញឹកញាប់ និងដំណោះស្រាយ
- **🕵️ ការបំបាត់កំហុស**: [មគ្គុទេសក៍បំបាត់កំហុស](docs/chapter-07-troubleshooting/debugging.md) - វិធីសាស្រ្តជាថ្នាក់
- **🤖 បញ្ហា AI**: [ការដោះស្រាយបញ្ហាពិសេស AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - បញ្ហាសេវាកម្ម AI

#### លំហាត់ផ្នែកជាក់ស្ដែង
- វិភាគបញ្ហាជាប់ពាក់ព័ន្ធនឹងការដាក់ឲ្យដំណើរការ
- ដោះស្រាយបញ្ហាសម្គាល់និយម
- បំបាត់កំហុសការតភ្ជាប់សេវាកម្ម AI

**💡 លទ្ធផលជាបឋម**: អាចវិភាគនិងដោះស្រាយបញ្ហាដាក់ឲ្យដំណើរការដោយឯករាជ្យ

---

### 🏢 មូទស្សន៍ទី 8៖ លំនាំផលិតកម្ម និងសហគ្រាស
**លក្ខខណ្ឌមុន**: បានបញ្ចប់មូទស្សន៍ 1-4  
**រយៈពេល**: 2-3 ម៉ោង  
**កម្រិតស្មុគស្មាញ**: ⭐⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- វិធីសាស្រ្តដាក់ឲ្យដំណើរការផលិតកម្ម
- លំនាំសន្តិសុខសហគ្រាស
- ការត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាពថ្លៃថោក

#### ឯកសាររៀនប្រាជ្ញា
- **🏭 ផលិតកម្ម**: [អនុវត្តការល្អបំផុត AI ផលិតកម្ម](docs/chapter-08-production/production-ai-practices.md) - លំនាំសហគ្រាស
- **📝 ឧទាហរណ៍**: [ឧទាហរណ៍ Microservices](../../examples/microservices) - សំណង់សម្បូរបែប
- **📊 ការត្រួតពិនិត្យ**: [ការចូលរួម Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ការត្រួតពិនិត្យ

#### លំហាត់ផ្នែកជាក់ស្ដែង
- អនុវត្តលំនាសន្តិសុខសហគ្រាស
- កំណត់ការត្រួតពិនិត្យទូលំទូលាយ
- ដាក់ឲ្យដំណើរការផលិតកម្មជាមួយការគ្រប់គ្រងជាក់លាក់

**💡 លទ្ធផលជាបឋម**: ដាក់ឲ្យដំណើរការកម្មវិធីសហគ្រាសជាស្រេចជាមួយសមត្ថភាពផលិតកម្មពេញលេញ

---

## 🎓 សង្ខេបមហោស្រពវិជ្ជាសាស្រ្ត៖ បទពិសោធន៍រៀនដោយដៃ

> **⚠️ ស្ថានភាពមហោស្រព៖ កំពុងអភិវឌ្ឍ**  
> សម្ភារៈមហោស្រពកំពុងត្រូវបានអភិវឌ្ឍន៍និងធ្វើអោយប្រសើរឡើង។ ម៉ូឌុលមូលដ្ឋានមានសមត្ថភាព តែក្រោមផ្នែកកម្រិតខ្ពស់មួយចំនួននៅមិនបិទបញ្ចប់ទាំងស្រុង។ យើងកំពុងធ្វើការជាបន្តបន្ទាប់ដើម្បីបញ្ចប់មាតិកាធំទូលាយ។ [តាមដានជំហាន →](workshop/README.md)

### ឯកសារមហោស្រពអន្តរាយ
**ការរៀនដៃគូរដោយមានឧបករណ៍អនឡាញនិងលំហាត់ណែនាំ**

សម្ភារៈមហោស្រពរបស់យើងផ្តល់បទពិសោធន៍រៀនមានរចនាសម្ព័ន្ធ និងអន្តរាយ ដែលបំពេញទៅនឹងមុខវិជ្ជាដែលមាននៅលើ។ មហោស្រពត្រូវបានរចនាឡើងសម្រាប់ការរៀនដោយខ្លួនឯង និងម៉ោងរៀនជាមួយគ្រូបង្រៀន។

#### 🛠️ លក្ខណៈពិសេសមហោស្រព
- **ចំណុចប្រទាក់លើកម្មវិធីរុករក**: មហោស្រពបំពេញដោយ MkDocs មានសមត្ថភាពស្វែងរក, ចម្លង និងមុខងារស្រាយផ្លាក
- **ការតភ្ជាប់ GitHub Codespaces**: ការកំណត់បរិយាកាសអភិវឌ្ឍតែមួយចុច
- **ផ្លូវរៀនដែលមានរចនាសម្ព័ន្ធ**: 8 ម៉ូឌុលលំហាត់ណែនាំ (3-4 ម៉ោងសរុប)
- **វិធីសាស្ត្រលំដាប់ជំហាន**: ចំណុចផ្តើម → ជ្រើសរើស → ផ្ទៀងផ្ទាត់ → ពណ៌នារចនាសម្ព័ន្ធ → កំណត់រចនាសម្ព័ន្ធ → ប្ដូរតាមតំរូវការ → ដោះស្រាយ → សេចក្តីសង្ខេប
- **បរិយាកាសអភិវឌ្ឍ DevContainer អន្តរាយ**: ឧបករណ៍និងការពឹងផ្អែកបានតំឡើងរួចជាបន្តបន្ទាប់

#### 📚 រចនាសម្ព័ន្ធម៉ូឌុលមហោស្រព
មហោស្រពធ្វើតាម **វិធីសាស្ត្រលំដាប់ 8 ម៉ូឌុល** ដែលផ្តល់អ្នកពីការស្វែងរកដល់ជំនាញការដាក់ឲ្យដំណើរការ៖

| ម៉ូឌុល | ប្រធានបទ | អ្វីដែលអ្នកនឹងធ្វើ | រយៈពេល |
|--------|-------|----------------|----------|
| **0. ចំណាត់ទុក** | សង្ខេបមហោស្រព | ពន្យល់គោលដៅរៀន, លក្ខខណ្ឌមុន និងរចនាសម្ព័ន្ធមហោស្រព | 15 នាទី |
| **1. ជ្រើសរើស** | ស្វែងរកគំរូ | ស្វែងរកគំរូ AZD និងជ្រើសរើសគំរូ AI ដែលសមរម្យសម្រាប់ស្ថានការ | 20 នាទី |
| **2. ផ្ទៀងផ្ទាត់** | ដាក់ឲ្យដំណើរការ & ផ្ទៀងផ្ទាត់ | ដាក់ឲ្យដំណើរការគំរូជាមួយ `azd up` និងផ្ទៀងផ្ទាត់កម្មវិធី | 30 នាទី |
| **3. ពណ៌នារចនាសម្ព័ន្ធ** | យល់ដឹងពីរចនាសម្ព័ន្ធ | ប្រើ GitHub Copilot សម្រាប់ស្វែងយល់អំពីប្លង់គំរូ, ឯកសារ Bicep និងការរៀបចំកូដ | 30 នាទី |
| **4. កំណត់រចនាសម្ព័ន្ធ** | ស្វែងយល់លំអិត azure.yaml | ជំនាញក្នុងការកំណត់រចនាសម្ព័ន្ធ `azure.yaml`, lifecycle hooks និងអថេរបរិស្ថាន | 30 នាទី |
| **5. ប្ដូរតាមតំរូវការ** | បង្កើតម៉ូឌែលផ្ទាល់ខ្លួន | បើកអត្រា AI Search, ការតាមដាន, ការវាយតម្លៃ និងប្ដូរក្នុងស្ថានការណ៍របស់អ្នក | 45 នាទី |
| **6. ដោះស្រាយ** | សម្អាត | ដោះស្រាយធនធានដោយសុវត្ថិភាពជាមួយ `azd down --purge` | 15 នាទី |
| **7. សេចក្តីសង្ខេប** | ជំហានបន្ទាប់ | ពិនិត្យមើលសមិទ្ធផល, យល់ដឹងគោលនយោបាយ និងបន្តពង្រឹងការរៀន | 15 នាទី |

**ដំណើរការមហោស្រព:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ការចាប់ផ្តើមជាមួយមហោស្រព
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 លទ្ធផលរៀនពីមហោស្រព
បន្ទាប់ពីបញ្ចប់មហោស្រព ភាគីចូលរួមនឹងអាច៖
- **ដាក់ឲ្យដំណើរការ​កម្មវិធី AI ផលិតកម្ម**: ប្រើ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **ជំនាញស្ថាបត្យកម្ម Multi-Agent**: អនុវត្តសេវាកម្ម AI agent ចលនាប្រកបដោយសហការ
- **អនុវត្តន៍អចលនាទ្រព្យសន្តិសុខដ៏ល្អបំផុត**: កំណត់សម្គាល់និងការត្រួតពិនិត្យចូលប្រើ
- **បង្កើនប្រសិទ្ធភាពដើម្បីវាស់វែង**: រចនាលំនាំដាក់ឲ្យដំណើរការដែលមានចំណាយទីពេញនិយម
- **ដោះស្រាយបញ្ហាការដាក់ឲ្យដំណើរការ**: ដោះស្រាយបញ្ហាទូទៅដោយឯករាជ្យ

#### 📖 ឯកសារមហោស្រព
- **🎥 មគ្គុទេសក៍អន្តរាយ**: [សម្ភារៈមហោស្រព](workshop/README.md) - បរិយាកាសរៀនលើកម្មវិធីរុករក
- **📋 សេចក្តីណែនាំតាមម៉ូឌុល**:
  - [0. ចំណាត់ទុក](workshop/docs/instructions/0-Introduction.md) - សង្ខេបមហោស្រព និងគោលដៅ
  - [1. ជ្រើសរើស](workshop/docs/instructions/1-Select-AI-Template.md) - ស្វែងរកនិងជ្រើសរើសគំរូ AI
  - [2. ផ្ទៀងផ្ទាត់](workshop/docs/instructions/2-Validate-AI-Template.md) - ដាក់ឲ្យដំណើរការនិងផ្ទៀងផ្ទាត់គំរូ
  - [3. ពណ៌នារចនាសម្ព័ន្ធ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ស្វែងយល់អំពីសំណង់គំរូ
  - [4. កំណត់រចនាសម្ព័ន្ធ](workshop/docs/instructions/4-Configure-AI-Template.md) - ជំនាញក្នុង azure.yaml
  - [5. ប្ដូរតាមតំរូវការ](workshop/docs/instructions/5-Customize-AI-Template.md) - ប្ដូរតាមស្ថានការណ៍របស់អ្នក
  - [6. ដោះស្រាយ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - សម្អាតធនធាន
  - [7. សេចក្តីសង្ខេប](workshop/docs/instructions/7-Wrap-up.md) - ពិនិត្យមើលនិងជំហានបន្ទាប់
- **🛠️ លំហាត់មហោស្រព AI**: [ហ្វ្រើម AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - លំហាត់ផ្តោតលើ AI
- **💡 ចាប់ផ្តើមរហ័ស**: [មគ្គុទេសក៍ការតំឡើងមហោស្រព](workshop/README.md#quick-start) - ការកំណត់បរិយាកាស

**សមស្របសម្រាប់**: ការបណ្តុះបណ្តាលស្ថាប័ន, មុខវិជ្ជា សាកលវិទ្យាល័យ, ការរៀនដោយខ្លួនឯង និងមហោស្រពអ្នកអភិវឌ្ឍន៍។

---

## 📖 ជ្រៅជាងនេះ: សមត្ថភាព AZD

លើសពីមូលដ្ឋាន AZD ផ្តល់ជូនមុខងារដ៏មានអាថ៌កំបាំងសម្រាប់ការដាក់ឲ្យដំណើរការផលិតកម្ម៖

- **ការដាក់ឲ្យដំណើរការដោយគំរូ** - ប្រើគំរូដែលបានបង្កើតរួចសម្រាប់លំនាំកម្មវិធីទូទៅ
- **ហេដ្ឋារចនាសម្ព័ន្ធជាកូដ** - គ្រប់គ្រងធនធាន Azure ដោយប្រើ Bicep ឬ Terraform  
- **ចរន្តការងាររួមបញ្ចូល** - បង្កើត, ដាក់ឲ្យដំណើរការ និងត្រួតពិនិត្យកម្មវិធីដោយជាប់លាប់
- **សម្រួលសម្រាប់អ្នកអភិវឌ្ឍន៍** - បង្កើនផលិតភាពនិងបទពិសោធអ្នកអភិវឌ្ឍន៍

### **AZD + Microsoft Foundry: សមស្របសម្រាប់ការដាក់ឲ្យដំណើរការ AI**

**ហេតុអ្វី AZD សម្រាប់ដំណោះស្រាយ AI?** AZD ដោះស្រាយបញ្ហាដ៏សំខាន់ដែលអ្នកអភិវឌ្ឍ AI កំពុងប្រឈមមុខ៖

- **គំរូ AI ស្រៀមរួច** - គំរូបានកំណត់រចនាសម្ព័ន្ធសម្រាប់ម៉ូឌែល Microsoft Foundry, សេវាកម្ម AI Azure, និងការបន្ទាន់ ML
- **ការដាក់ឲ្យដំណើរការសេវាកម្ម AI មានសុវត្ថិភាព** - លំនាំសន្តិសុខសម្រាប់សេវាកម្ម AI, គន្លង API និងមន្ទីរម៉ូឌែល  
- **លំនាំ AI ផលិតកម្ម** - វិធីសាស្ត្រល្អបំផុតសម្រាប់ការដាក់ឲ្យដំណើរការកម្មវិធី AI ផលិតកម្មដែលអាចវាស់វែងនិងថោក
- **ចរន្តការងារដេញដោល AI ពេញលេញ** - ពីការអភិវឌ្ឍម៉ូឌែលដល់ការដាក់ឲ្យដំណើរការផលិតកម្មជាមួយការត្រួតពិនិត្យត្រឹមត្រូវ
- **បង្កើនប្រសិទ្ធភាពថ្លៃ** - ការចែកចាយធនធានឆ្លាតវៃ និងយុទ្ធសាស្រ្តស្កាលសម្រាប់បន្ទាន់ AI
- **ការតភ្ជាប់ Microsoft Foundry** - ភ្ជាប់ជាមួយប្រភេទម៉ូឌែល Microsoft Foundry និងមន្ទីរ

---

## 🎯 បណ្ណាល័យ​គំរូ និងឧទាហរណ៍

### ពិសេស៖ គំរូ Microsoft Foundry
**ចាប់ផ្តើមនៅទីនេះ ប្រសិនបើអ្នកកំពុងដាក់ឲ្យដំណើរការកម្មវិធី AI!**

> **សម្គាល់:** គំរូទាំងនេះបង្ហាញលំនាំ AI ផ្សេងៗ។ មួយចំនួនជាគំរូ Azure របស់ខាងក្រៅ ខណៈដែលអ្នកដទៃជាការអនុវត្តក្នុងតំបន់។

| គំរូ | មូទស្សន៍ | កម្រិតស្មុគស្មាញ | សេវាកម្ម | ប្រភេទ |
|----------|---------|------------|----------|------|
| [**ចាប់ផ្តើមជាមួយ AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | មូទស្សន៍ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ខាងក្រៅ |
| [**ចាប់ផ្តើមជាមួយ AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | មូទស្សន៍ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ខាងក្រៅ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | មូទស្សន៍ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ខាងក្រៅ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | មូទស្សន៍ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ខាងក្រៅ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | មូទស្សន៍ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ខាងក្រៅ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | មូទស្សន៍ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ខាងក្រៅ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | មូទស្សន៍ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ក្នុងតំបន់** |

### ពិសេស៖ ស្ថានភាពរៀនទាំងស្រុង
**គំរូកម្មវិធីសម្រាប់ផលិតកម្មត្រូវបានផ្គូរផ្គងទៅនឹងមូទស្សន៍រៀន**

| គំរូ | មូទស្សន៍រៀន | កម្រិតស្មុគស្មាញ | ការរៀនសំខាន់ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | មូទស្សន៍ 2 | ⭐ | លំនាំដាក់ឲ្យដំណើរការ AI មូលដ្ឋាន |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | មូទស្សន៍ 2 | ⭐⭐ | ការអនុវត្ត RAG ជាមួយ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | មូទស្សន៍ 4 | ⭐⭐ | ការបញ្ចូលចំណេះដឹងលើឯកសារ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | មូទស្សន៍ 5 | ⭐⭐⭐ | ស៊ុមភ្នាក់ងារ និងហៅមុខងារ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | មូទស្សន៍ 8 | ⭐⭐⭐ | ការសម្របសម្រួល AI សហគ្រាស |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | មូទស្សន៍ 5 | ⭐⭐⭐⭐ | ស្ថាបត្យកម្ម multi-agent ជាមួយភ្នាក់ងារអតិថិជន និងគ្រប់គ្រងស្តុក |

### រៀនតាមប្រភេទឧទាហរណ៍

> **📌 ឧទាហរណ៍ក្នុងតំបន់ និងខាងក្រៅ៖**  
> **ឧទាហរណ៍ក្នុងតំបន់** (នៅក្នុង repository នេះ) = ស្រាប់ត្រៀមប្រើភ្លាមៗ  
> **ឧទាហរណ៍ខាងក្រៅ** (Azure Samples) = Clone ពី repository ដែលតភ្ជាប់

#### ឧទាហរណ៍ក្នុងតំបន់ (ស្រាប់ត្រៀមប្រើ)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ការអនុវត្តស្រេចនៅក្នុងផលិតកម្មជាមួយគំរូ ARM សរុប
  - ស្ថាបត្យកម្ម multi-agent (ភ្នាក់ងារអតិថិជន + គ្រប់គ្រងស្តុក)
  - ការត្រួតពិនិត្យ និងការវាយតម្លៃទូលំទូលាយ
  - ដាក់ឲ្យដំណើរការតែមួយចុចតាមគំរូ ARM

#### ឧទាហរណ៍ក្នុងតំបន់ - កម្មវិធី Container (មូទស្សន៍ 2-5)
**ឧទាហរណ៍ដាក់កម្មវិធី container ដំណើរការពេញលេញនៅក្នុង repository នេះ៖**
- [**ឧទាហរណ៍កម្មវិធី Container**](examples/container-app/README.md) - មគ្គុទេសក៍ពេញលេញសម្រាប់ការដាក់កម្មវិធី container
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API មូលដ្ឋានជាមួយកម្រិតដល់សូន្យ
  - [Microservices Architecture](../../examples/container-app/microservices) - ដាក់ឲ្យដំណើរការម៉ូលទីសេវាបុស្តិ៍ផលិតកម្ម
  - ការចាប់ផ្តើមរហ័ស, ផលិតកម្ម, និងលំនាំកម្រិតខ្ពស់
  - ការត្រួតពិនិត្យ, សន្តិសុខ, និងការបង្កើនប្រសិទ្ធភាពថ្លៃថោក

#### ឧទាហរណ៍ខាងក្រៅ - កម្មវិធីមូលដ្ឋាន (មូទស្សន៍ 1-2)
**Clone repository Azure Samples ទាំងនេះដើម្បីចាប់ផ្តើម៖**
- [កម្មវិធីគេហទំព័រងាយៗ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - លំនាំដាក់ឲ្យដំណើរការមូលដ្ឋាន
- [គេហទំព័រស្ទាតិក - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - ការដាក់មាតិការស្ទាតិក
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - ការដាក់ API REST

#### ឧទាហរណ៍ខាងក្រៅ - ការតភ្ជាប់មូលដ្ឋានទិន្នន័យ (មូទស្សន៍ 3-4)  
- [កម្មវិធីមូលដ្ឋានទិន្នន័យ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - លំនាំការតភ្ជាប់មូលដ្ឋានទិន្នន័យ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - ចរន្តទិន្នន័យ serverless

#### ឧទាហរណ៍ខាងក្រៅ - លំនាំកម្រិតខ្ពស់ (មូទស្សន៍ 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - ស្ថាបត្យកម្មម៉ូលទីសេវា
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ការប្រតិបត្តិការផ្ទៃក្រោយ  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - លំនាំ ML ស្រេចនឹងផលិតកម្ម

### ការប្រមូលផ្តុំនិងគំរូខាងក្រៅ
- [**ហាលផន្លើ AZD ផ្លូវការតំឡើងគំរូ**](https://azure.github.io/awesome-azd/) - ការប្រមួលគំរូផ្លូវការនិងសហគមន៍
- [**គំរូ Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - ឯកសារមគ្គុទេសក៍ Microsoft Learn
- [**ថតឯកសារឧទាហរណ៍**](examples/README.md) - ឧទាហរណ៍នៅក្នុងតំបន់ជាមួយការពន្យល់លម្អិត

---

## 📚 ឯកសាររៀនប្រាជ្ញា & យោង

### ការរបាយការណ៍យោងរហ័ស
- [**សៀវភៅបញ្ជា Command Cheat Sheet**](resources/cheat-sheet.md) - ជំរុញឧបករណ៍ azd យ៉ាងសំខាន់តាមជំពូក
- [**ពាក្យសម្គាល់ Glossary**](resources/glossary.md) - ពាក្យសម្ងាត់ Azure និង azd  
- [**សំណួរញឹកញាប់ FAQ**](resources/faq.md) - សំណួរជាច្រើនត្រូវបានរៀបចំដោយជំពូកសិក្សា
- [**មគ្គុទេសក៍សិក្សា Study Guide**](resources/study-guide.md) - លំហាត់បញ្ហាផ្តល់នូវការអនុវត្តដ៏ទូលំទូលាយ

### កិច្ចសិក្សាដៃគូ Hands-On Workshops
- [**មន្ទីរអេឡិចត្រូនិច AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - បង្កើតដំណោះស្រាយ AI របស់អ្នកអោយអាចផ្ទុកបានដោយ AZD (2-3 ម៉ោង)
- [**វគ្គបណ្តុះបណ្តាលផ្ទាល់ Interactive Workshop**](workshop/README.md) - លំហាត់ណែនាំ 8 ម៉ូឌុល ជាមួយ MkDocs និង GitHub Codespaces
  - តាមរយៈ៖ ការណែនាំ → ការជ្រើសរើស → ការផ្ទៀងផ្ទាត់ → ការបំបែក → ការកំណត់រចនាសម្ព័ន្ធ → ការប្ដូរតាមតម្រូវការ → ការបញ្ឈប់ → បិទវគ្គ

### ប្រភពរៀនក្រៅធម្មតា External Learning Resources
- [ឯកសារពី Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [កម្មវិធីគណនាឥណទាន Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [ស្ថានភាព Azure Status](https://status.azure.com/)

### ជំនាញភ្នាក់ងារ AI សម្រាប់កម្មវិធីកែសម្រួលរបស់អ្នក
- [**ជំនាញ Microsoft Azure នៅលើ skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ជំនាញភ្នាក់ងារបើកចំហ ៣៧ សម្រាប់ Azure AI, Foundry, ការផ្ទុក, ការវិភាគ, ការអូបផ្គត់ផ្គង់ដោយប្រសិទ្ធភាព និង ម្ចាស់ដំណោះស្រាយផ្សេងទៀត។ ផ្ទុកពួកខ្លួនក្នុង GitHub Copilot, Cursor, Claude Code ឬភ្នាក់ងារ​ដែលគាំទ្រ៖
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 មគ្គុទេសក៍ដោះស្រាយបញ្ហារហ័ស

**បញ្ហាទូទៅដែលអ្នកចាប់ផ្តើមជួប និងដំណោះស្រាយភ្លាមៗ៖**

<details>
<summary><strong>❌ "azd: មិនអាចរកឃើញ command"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "មិនបានរកឃើញការជាវ" ឬ "មិនបានកំណត់ការជាវ"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ឬ "Quota លើសកំណត់"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" បរាជ័យកន្លងមកពាក់កណ្តាល</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" ឬ "ស្នាមស្វក់បានផុតកំណត់"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "ធនធានមានរួចហើយ" ឬ បញ្ហាឈ្មោះស្រដៀងគ្នា</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ការផ្ទុកតម្រងនៃគំរូ Template deployment យូរពេក</strong></summary>

**ពេលរង់ចាំធម្មតា៖**
- កម្មវិធីវែបសាមញ្ញ៖ ៥-១០ នាទី
- កម្មវិធីដែលមានមូលដ្ឋានទិន្នន័យ៖ ១០-១៥ នាទី
- ពាក្យបញ្ជូល AI៖ ១៥-២៥ នាទី (OpenAI provisioning យឺត)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "មិនបានអនុញ្ញាត" ឬ "ហាមឃាត់"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ មិនអាចរក URL កម្មវិធីដែលបានផ្ទុកបាន</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 ប្រភពកំណត់បញ្ហាផ្ទាល់

- **មគ្គុទេសក៍បញ្ហាទូទៅ៖** [ដំណោះស្រាយលម្អិត](docs/chapter-07-troubleshooting/common-issues.md)
- **បញ្ហាផ្ទាល់ពាក់ព័ន្ធ AI៖** [ការកំណត់បញ្ហា AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **មគ្គុទេសក៍ Debugging៖** [ការស្វែងរកបញ្ហាដោយជំហាន](docs/chapter-07-troubleshooting/debugging.md)
- **ទទួលជំនួយ៖** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 ការបញ្ចប់វគ្គសិក្សា និងវិញ្ញាបនបត្រ

### ការតាមដានដំណើរការសិក្សា
តាមដានចំណាត់ថ្នាក់សិក្សារបស់អ្នកតាមជំពូកនីមួយៗ៖

- [ ] **ជំពូក១**: ថ្នាក់ដំបូង និងចាប់ផ្តើមបានយ៉ាងរហ័ស ✅
- [ ] **ជំពូក២**: ការអភិវឌ្ឍ AI ជាចម្បង ✅  
- [ ] **ជំពូក៣**: ការកំណត់រចនាសម្ព័ន្ធ និងការផ្ទៀងផ្ទាត់ ✅
- [ ] **ជំពូក៤**: ការគ្រប់គ្រងជាគូដ និងការផ្ទុក ✅
- [ ] **ជំពូក៥**: ដំណោះស្រាយ AI គណនាភ្នាក់ងារ ច្រើន ✅
- [ ] **ជំពូក៦**: ការផ្ទៀងផ្ទាត់ និងផែនការមុនការផ្ទុក ✅
- [ ] **ជំពូក៧**: ការកំណត់បញ្ហា និងការដោះស្រាយ ✅
- [ ] **ជំពូក៨**: រចនាបថផលិតកម្ម និងសហគ្រាស ✅

### ការត្រួតពិនិត្យការរៀន
បន្ទាប់ពីបញ្ចប់ជំពូកនីមួយៗ ត្រួតពិនិត្យចំណេះដឹងរបស់អ្នកដោយ៖
1. **លំហាត់អនុវត្ត**: បញ្ចប់ការផ្ទុកដៃគូរបស់ជំពូក
2. **ការត្រួតពិនិត្យចំណេះដឹង**: ពិនិត្យផ្នែកសំណួរញឹកញាប់របស់ជំពូកអ្នក
3. **ការពិភាក្សាសហគមន៍**: ចែករំលែកបទពិសោធន៍តាម Discord នៃ Azure
4. **ជំពូកបន្ទាប់**: ធ្វើដំណើរទៅកាន់ជំាបថខ្ពស់បន្ទាប់

### អត្ថប្រយោជន៍បញ្ចប់វគ្គសិក្សា
បន្ទាប់ពីបញ្ចប់ជំពូកទាំងអស់ អ្នកនឹងមាន៖
- **បទពិសោធផលិតកម្ម**: បង្ហោះកម្មវិធី AI ពិតទៅ Azure បាន
- **ជំនាញវិជ្ជាជីវៈ**: សមត្ថភាពផ្ទុកត្រឹមត្រូវសម្រាប់សហគ្រាស  
- **ការទទួលស្គាល់សហគមន៍**: ជាសមាជិកសកម្មនៃសហគមន៍អ្នកអភិវឌ្ឍន៍ Azure
- **ការលូតលាស់អាជីព**: ជំនាញ AZD និង AI ដែលត្រូវការខ្ពស់

---

## 🤝 សហគមន៍ និងការគាំទ្រ

### ទទួលជំនួយ និងគាំទ្រ
- **បញ្ហាបច្ចេកទេស**: [រាយការណ៍កំហុស និងសំណើរជម្រុញ](https://github.com/microsoft/azd-for-beginners/issues)
- **សំណួររៀន**: [សហគមន៍ Microsoft Azure Discord](https://discord.gg/microsoft-azure) និង [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ជំនួយ AI ផ្ទាល់ខ្លួន**: ចូលរួម [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ឯកសារ**: [ឯកសារ Azure Developer CLI ផ្លូវការណ៍](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ចំណេះដឹងសហគមន៍ពី Microsoft Foundry Discord

**លទ្ធផលការបោះឆ្នោតចុងក្រោយពីប៉ុស #Azure Channel:**
- **៤៥%** នៃអ្នកអភិវឌ្ឍចង់ប្រើ AZD សម្រាប់ការងារតាម AI
- **បញ្ហាសំខាន់ៗ**៖ ការផ្ទុកម៉ាស៊ីនសេវាកម្មច្រើន, ការគ្រប់គ្រងព័ត៌មានសម្ងាត់, ស្ថានភាពការផលិត  
- **អ្វីដែលបានស្នើសុំច្រើនជាងគេ**៖ គំរូសម្រាប់ AI, មគ្គុទេសក៍ដោះស្រាយបញ្ហា, វិធីសាស្ត្រល្អបំផុត

**ចូលរួមសហគមន៍របស់យើងដើម្បី៖**
- ចែករំលែកបទពិសោធន៍ AZD + AI និងទទួលជំនួយ
- ទទួលបានមើលជាមុននូវគំរូ AI ថ្មីៗ
- ធ្វើការរួមចំណែកក្នុងវិធីសាស្ត្រល្អបំផុតសម្រាប់ការផ្ទុក AI
- មានឥទ្ធិពលលើការអភិវឌ្ឍមុខងារ AI + AZD នៅពេលអនាគត

### ការរួមចំណែកក្នុងវគ្គសិក្សា
យើងសូមចូលរួមចំណែក! សូមអាន [មគ្គុទេសក៍ការរួមចំណែក](CONTRIBUTING.md) សម្រាប់ព័ត៌មានលម្អិតអំពី៖
- **ការកែលម្អមាតិកា**: បង្កើនជំពូក និងឧទាហរណ៍ដែលមានស្រាប់
- **ឧទាហរណ៍ថ្មីៗ**: បន្ថែមស្ថានភាពពិតប្រាកដ និងគំរូ  
- **ការបកប្រែ**: ជួយថែទាំការគាំទ្រភាសាច្រើន
- **រាយការណ៍កំហុស**: បង្កើនភាពត្រឹមត្រូវ និងច្បាប់ផ្សេងៗ
- **មាតិកាសហគមន៍**: បន្សល់ដំណើរការនូវមាតិកាសហគមន៍រួមចំណែក

---

## 📄 ព័ត៌មានវគ្គសិក្សា

### អាជ្ញាបណ្ណ
គម្រោងនេះផ្ដល់អាជ្ញាបណ្ណក្រោមអាជ្ញាបណ្ណ MIT - មើលឯកសារ [LICENSE](../../LICENSE) សម្រាប់ពត៌មានលម្អិត។

### ប្រភពរៀន Microsoft ទាក់ទង

ក្រុមរបស់យើងបង្កើតវគ្គសិក្សាផ្សេងទៀតសម្រាប់រៀនទូលំទូលាយ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / រង្វង់ / MCP / ភ្នាក់ងារ
[![AZD សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ស៊េរី Generative AI
[![Generative AI សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### ការរៀនស្នូល Core Learning
[![ML សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![វិទ្យាសាស្ត្រទិន្នន័យ សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![ការអភិវឌ្ឍវែបសម្រាប់អ្នកដំបូង](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![ការអភិវឌ្ឍ XR សម្រាប់អ្នកដំបូង](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ស៊េរី Copilot
[![Copilot សម្រាប់ការសរសេរកម្មវិធីរួម AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot សម្រាប់ C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ដំណើរការវគ្គសិក្សា

**🚀 ត្រៀមខ្លួនចាប់ផ្តើមរៀន?**

**អ្នកដំបូង**៖ ចាប់ផ្តើមជាមួយ [ជំពូក ១: មូលដ្ឋាន និង ចាប់ផ្តើមយ៉ាងរហ័ស](#-chapter-1-foundation--quick-start)  
**អ្នកអភិវឌ្ឍ AI**៖ ធ្វើដំណើរទៅ [ជំពូក ២: អភិវឌ្ឍ AI ជាចម្បង](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**អ្នកអភិវឌ្ឍមានបទពេញន័យ**៖ ចាប់ផ្តើមជាមួយ [ជំពូក ៣: ការកំណត់រចនាសម្ព័ន្ធ និង ការផ្ទៀងផ្ទាត់](#️-chapter-3-configuration--authentication)

**ជំហ៊ានបន្ទាប់**: [ចាប់ផ្តើមជំពូក ១ - មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
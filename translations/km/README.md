# AZD សម្រាប់អ្នកចាប់ផ្តើម៖ មុខងារបណ្តុះបណ្តាលដែលរៀបរយ

![AZD-for-beginners](../../translated_images/km/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ការប្រែសម្រួលស្វ័យប្រវត្តិ (មានការអាប់ដេតជារៀងរាល់ពេល)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](./README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ចូលចិត្តកាក្លូននៅក្នុងម៉ាស៊ីនរបស់អ្នកមែនទេ?**
>
> ទីតាំងផ្ទុកនេះមានការប្រែជាភាសាច្រើនជាង ៥០ ដែលធ្វើឱ្យទំហំទាញយកធំហាយ។ ប្រសិនបើចង់កាក្លូនដោយគ្មានការប្រែ មានបច្ចេកទេស `sparse checkout`:
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
> វានាំឱ្យអ្នកមានអ្វីគ្រប់យ៉ាងដែលត្រូវការដើម្បីបញ្ចប់មុខងារជាមួយនឹងការទាញយករហ័សជាងមុន។
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 មានអ្វីថ្មីនៅក្នុង azd ថ្ងៃនេះ

> 📌 មុខងារនេះបានផ្ទៀងផ្ទាត់ជាមួយ **`azd 1.27.1`** (ខែកក្កដា ២០២៦)។ រត់ `azd version` ដើម្បីពិនិត្យកំណែរបស់អ្នក ហើយ `azd upgrade` ដើម្បីបានកំណែថ្មី។

Azure Developer CLI បានរីកចម្រើនក្លាយជាមធ្យោបាយតែមួយសម្រាប់ដាក់បង្ហោះកម្មវិធី **មួយចំនួនណាមួយ** ទៅ Azure រួមមានកម្មវិធីដែលដំណើរការដោយ AI និងភ្នាក់ងារលក្ខណៈឆ្លាតវៃ។

នេះជាសេចក្តីអ្វីដែលមានន័យសម្រាប់អ្នក៖

- **ភ្នាក់ងារ AI ពេញមួយជំនួសការងារដែលជាទំព័រដែលមានតម្លៃ** អ្នកអាចចាប់ផ្តើម ដាក់បង្ហោះ និងគ្រប់គ្រងគម្រោងភ្នាក់ងារ AI ដោយប្រើដំណើរការដូចគ្នា `azd init` → `azd up` ដែលអ្នកបានស្គាល់។
- **ជីវិតចាប់ពីដំណើរការ AI ពេញលេញពី CLI** ផ្នែកបន្ថែម `azure.ai.agents` ឥឡូវគ្របដណ្តប់ដំណើរការជុំវិញ—`azd ai agent init` សម្រាប់បង្កើតព្រលឹង, `azd ai agent invoke` សម្រាប់សាកល្បង (ជាមួយនឹងលទ្ធផលវ៉ាយម៉ោងឆ្លើយតប), `azd ai agent eval generate` និង `azd ai agent optimize` សម្រាប់វាស់វែង និងបង្កើនគុណភាព, និង `azd ai agent delete` សម្រាប់សម្អាត។
- **ប្លុកកសាង AI បន្ថែម** ផ្នែកបន្ថែមពិនិត្យមួយចំនួនថ្មី `azure.ai.skills` និង `azure.ai.connections` អនុញ្ញាតឱ្យអ្នកគ្រប់គ្រងជំនាញភ្នាក់ងារដែលអាចប្រើឡើងវិញ និងការតភ្ជាប់ Foundry តាមរយៈ azd ទៅដោយផ្ទាល់។
- **ការរួមបញ្ចូល Microsoft Foundry** ផ្ទាល់នាំមកនូវការដាក់បង្ហោះម៉ូដែល, ការប្រគល់ភ្ញៀវភ្នាក់ងារ និងការកំណត់សេវាកម្ម AI ទៅក្នុងបរិស្ថានតំរូវការរចនារបស់ azd។
- **មុខងាររូបមូលដ្ឋានហាន់យ៉ាងរលូន** កំណែចេញថ្មីៗបានធ្វើឱ្យ `azd init` មានលក្ខណៈ idempotent (អាចរត់ឡើងវិញដោយសុវត្ថិភាព), បានធ្វើឱ្យ `azd auth login` សម្លឹងសំ token ចាស់ៗដោយស្វ័យប្រវត្តិ, ហើយបានបន្ថែមការផ្តល់ដំណើរការដំបូងរបស់ `azd tool` ដោយភាពទាក់ទាញ។
- **ដំណើរការស្នូលមិនបានផ្លាស់ប្តូរ** តើអ្នកកំពុងដាក់បង្ហោះកម្មវិធី todo, ម៉ាយក្រោសវីស ឬដំណោះស្រាយ AI មនុស្សជាច្រើន ភាពបញ្ជា commands គឺដូចគ្នា។

> **ចំណាំសម្រាប់អ្នកប្រើ Aspire:** Microsoft ឥលូវយោងផលិតផលយ៉ាងសាមញ្ញថា **Aspire** (មុននេះ ".NET Aspire")។ ការគាំទ្រ Aspire របស់ azd មិនបានផ្លាស់ប្តូរ ប៉ុន្តែនៅតែមួយគត់គឺប្ដូរឈ្មោះ។

ប្រសិនបើអ្នកបានប្រើ azd មុននេះ ការគាំទ្រ AI គឺជាការពង្រីកធម្មជាតិ មិនមែនជាឧបករណ៍ផ្សេងឬផ្លូវកំណត់ដំណើរលំអិត។ បើអ្នកចាប់ផ្តើមថ្មី អ្នកនឹងរៀនលំហាត់ការងារតែមួយដែលដំណើរការសម្រាប់គ្រប់យ៉ាង។

---

## 🚀 តើ Azure Developer CLI (azd) ជាអ្វី?

**Azure Developer CLI (azd)** គឺជាឧបករណ៍បញ្ជាទូលំទូលាយសម្រាប់អ្នកអភិវឌ្ឍ ដែលធ្វើឱ្យការដាក់បង្ហោះកម្មវិធីទៅ Azure ក្លាយស្រួល។ ជំនួសការបង្កើតជា​ដៃហិង្សា និងភ្ជាប់ធនធាន Azure ជាច្រើន អ្នកអាចដាក់បង្ហោះកម្មវិធីទាំងមូលដោយបញ្ជា commands ពីរបៀបតែមួយ។

### ជំនួយសមិទ្ធផល `azd up`

```bash
# ពាក្យបញ្ជា​តែមួយ​នេះ​ធ្វើ​ឲ្យ​ទាំងអស់៖
# ✅ បង្កើតធនធាន Azure ទាំងអស់
# ✅ កំណត់បណ្ដាញ និងសុវត្ថិភាព
# ✅ បង្កើតកូដកម្មវិធីរបស់អ្នក
# ✅ ផ្ញើទៅ Azure
# ✅ ផ្តល់ URL ដែលអាចប្រើប្រាស់បានឲ្យអ្នក
azd up
```

**វាហើយ!** គ្មានការជ្រើសរើសនៅក្នុង Azure Portal, គ្មានតម្រូវការស្វែងរៀនតំរូវការលម្អិត ARM ជារបស់ដំបូង, គ្មានការកំណត់ដោយដៃ—គ្រាន់តែកម្មវិធីដំណើរការលើ Azure។

---

## ❓ Azure Developer CLI និង Azure CLI: ខុសគ្នាយ៉ាងដូចម្ដេច?

នេះជាសំណួរញឹកញាប់បំផុតដែលអ្នកចាប់ផ្តើមសួរ។ ខាងក្រោមជាចម្លើយសាមញ្ញ៖

| លក្ខណៈ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **គោលបំណង** | គ្រប់គ្រងធនធាន Azure ផ្ទាល់ | ដាក់បង្ហោះកម្មវិធីពេញលេញ |
| **គំនិត** | ផ្តោតលើហេដ្ឋារចនាសម្ព័ន្ធ | ផ្តោតលើកម្មវិធី |
| **ឧទាហរណ៍** | `az webapp create --name myapp...` | `azd up` |
| **ការ​រៀន** | ត្រូវមានចំណេះដឹងសេវាកម្ម Azure | ត្រឹមតែយល់ពីកម្មវិធីអ្នក |
| **សមស្របសម្រាប់** | DevOps, ហេដ្ឋារចនាសម្ព័ន្ធ | អ្នកអភិវឌ្ឍ, បង្កើតគំរូ |

### ការប្រៀបធៀបទ្រង់ត្រាច្រើន

- **Azure CLI** គឺដូចជាមានឧបករណ៍គ្រប់យ៉ាងសម្រាប់សាងសង់ផ្ទះ—កូនក្រវៀន, ចម្ដូល, បាំងក្រចក។ អ្នកអាចសាងសង់អ្វីក៏បាន ប៉ុន្តែអ្នកត្រូវដឹងពីសំណង់។
- **Azure Developer CLI** គឺដូចជាចុះកិច្ចសន្យាជាមួយអ្នកកសាង—អ្នកពិពណ៌នាអ្វីដែលអ្នកចង់បាន ហើយពួកគេនឹងធ្វើសំណង់។

### ពេលណាដើម្បីប្រើមួយទាំងពីរ

| ទីតាំង | ប្រើនេះ |
|----------|----------|
| "ខ្ញុំចង់ដាក់បង្ហោះកម្មវិធីវែបរបស់ខ្ញុំឆាប់ៗ" | `azd up` |
| "ខ្ញុំត្រូវការបង្កើតគណនីផ្ទុកតែចំណង់" | `az storage account create` |
| "ខ្ញុំកំពុងបង្កើតកម្មវិធី AI ពេញលេញ" | `azd init --template azure-search-openai-demo` |
| "ខ្ញុំត្រូវការស៊ើបអង្កេតធនធាន Azure មួយដាច់ដោយឡែក" | `az resource show` |
| "ខ្ញុំចង់ដាក់បង្ហោះសម្រាប់ផលិតផលក្នុងរយៈពេលប៉ុន្មាននាទី" | `azd up --environment production` |

### ពួកវាផ្លាស់ប្ដូរជាមួយគ្នា!

AZD ប្រើ Azure CLI នៅខាងក្រោម។ អ្នកអាចប្រើទាំងពីរបាន:
```bash
# អាចផ្ងាក់កម្មវិធីរបស់អ្នកជាមួយ AZD
azd up

# បន្ទាប់មកកែសម្រួលធនធានជាក់លាក់ជាមួយ Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ស្វែងរកតំរូវការក្នុង Awesome AZD

កុំចាប់ផ្តើមពីសូន្យ! **Awesome AZD** គឺជាការប្រមូលផ្តុំគំរូដែលរួចរាល់សម្រាប់ដាក់បង្ហោះ៖

| ធនធាន | ការពិពណ៌នា |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | រុករក ២០០+ គំរូជាមួយការដាក់បង្ហោះក្នុងក្លិនក្លាប់លើក |
| 🔗 [**ស្នើសុំគំរូ**](https://github.com/Azure/awesome-azd/issues) | ចែករំលែកគំរូរបស់អ្នកទៅសហគមន៍ |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ផ្ដល់ពន្លឺ និងស្វែងយល់ពីប្រភព |

### គំរូ AI ជាប្រជាប្រិយពី Awesome AZD

```bash
# ជជែក RAG ជាមួយម៉ូដែល Microsoft Foundry + ស្វែងរក AI
azd init --template azure-search-openai-demo

# កម្មវិធីជជែក AI លឿន
azd init --template openai-chat-app-quickstart

# តំណាង AI ជាមួយតំណាង Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 ចាប់ផ្តើមក្នុង ៣ជំហាន

មុនអ្នកចាប់ផ្តើម ប្រាកដថាម៉ាស៊ីនរបស់អ្នកទាន់សម័យសម្រាប់គំរូដែលអ្នកចង់ដាក់បង្ហោះ៖

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ប្រសិនបើត្រួតពិនិត្យដែលត្រូវការមួយណាមិនជាប់ ប្រសាស្ត្រទៅកែសំរួលមុន ហើយបន្តទៅការចាប់ផ្តើមលឿន។

### ជំហាន ១៖ តម្លើង AZD (២ នាទី)

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

### ជំហាន ២៖ ផ្ដល់សិទ្ធិសម្រាប់ AZD

```bash
# ជាជម្រើសបើអ្នករៀបចំប្រើប្រាស់ពាក្យបញ្ជា Azure CLI ត្រង់ក្នុងវគ្គសិក្សានេះ
az login

# ត្រូវការសម្រាប់ដំណើរការងារ AZD
azd auth login
```

ប្រសិនបើអ្នកមិនប្រាកដថាត្រូវការអ្វី សូមធ្វើតាមដំណើរការកំណត់ពេញលេញនៅក្នុង [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup)។

### ជំហាន ៣៖ ដាក់បង្ហោះកម្មវិធីដំបូងរបស់អ្នក

```bash
# ចាប់ផ្តើមពីរចនាទម្រង់
azd init --template todo-nodejs-mongo

# ផ្ញើទៅ Azure (បង្កើតអ្វីៗគ្រប់យ៉ាង!)
azd up
```

**🎉 វាជាការសម្រេច!** កម្មវិធីរបស់អ្នកឥឡូវនេះមានជីវិតនៅលើ Azure។

### សម្អាត (កុំភ្លេច!)

```bash
# លុបធនធានទាំងអស់ឲ្យបានសំឡាញ់ពេលសាកល្បងរួច
azd down --force --purge
```

---

## 📚 របៀបប្រើមុខងារនេះ

មុខងារនេះបានរចនាសម្រាប់ **ការសិក្សាបន្តបន្ទាប់** - ចាប់ផ្តើមពីកន្លែងដែលអ្នកមានភាពងាយស្រួល ហើយធ្វើការឡើងវិញ៖

| បទពិសោធរបស់អ្នក | ចាប់ផ្តើមពីទីនេះ |
|-----------------|------------|
| **ថ្មីចំពោះ Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **ដឹងពី Azure ប៉ុន្តែមិនដឹងអំពី AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **ចង់ដាក់បង្ហោះកម្មវិធី AI** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ចង់អនុវត្តដៃ** | [🎓 វៀតឆ្លងបញ្ចូល](workshop/README.md) - មន្ទីរពិសោធន៍បង្រៀន ៣-៤ ម៉ោង |
| **ត្រូវការគំរូផលិតផល** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### ការដំឡើងលឿន

1. **Fork ទីតាំងផ្ទុកនេះ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone វា**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ទទួលបានជំនួយ**: [សហគមន៍ Discord របស់ Azure](https://discord.com/invite/ByRwuEEgH4)

> **ចូលចិត្តកាក្លូននៅក្នុងម៉ាស៊ីនរបស់អ្នកមែនទេ?**

> ទីតាំងផ្ទុកនេះមានការប្រែជាភាសាច្រើនជាង ៥០ ដែលធ្វើឱ្យទំហំទាញយកធំហាយ។ ប្រសិនបើចង់កាក្លូនដោយគ្មានការប្រែ មានបច្ចេកទេស `sparse checkout`:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> វានាំឱ្យអ្នកមានអ្វីគ្រប់យ៉ាងដែលត្រូវការដើម្បីបញ្ចប់មុខងារជាមួយនឹងការទាញយករហ័សជាងមុន។


## មេរៀនទូទៅ

ទទួលជំនាញ Azure Developer CLI (azd) តាមរយៈជំពូកដែលរៀបចំសម្រាប់ការសិក្សាបន្តបន្ទាប់។ **ផ្តោតលើការដាក់បង្ហោះកម្មវិធី AI ជាពិសេសជាមួយការរួមបញ្ចូល Microsoft Foundry។**


### មូលហេតុដែលវគ្គនេះមានសារៈសំខាន់សម្រាប់អ្នកអភិវឌ្ឍន៍សម័យទំនើប

ផ្អែកលើការយល់ដឹងពីសហគមន៍ Microsoft Foundry Discord, **45% នៃអ្នកអភិវឌ្ឍន៍ចង់ប្រើ AZD សម្រាប់បន្ទុក AI** ប៉ុន្តែជួបប្រទៈនឹងបញ្ហា៖
- ស្ថាបត្យកម្ម AI ជាបណ្តុំច្រើនសេវាកម្មដ៏ស្មុគស្មាញ
- អនុវត្តការដាក់ឲ្យដំណើរការ AI នៅផលិតកម្មដោយវិធីល្អបំផុត  
- ការរួមបញ្ចូលនិងកំណត់រចនាសេវាកម្ម Azure AI
- ការប្រមូលផ្តុំនូវពិន្ទុថ្លៃសម្រាប់បន្ទុក AI
- ដោះស្រាយបញ្ហាក្នុងការដាក់ AI ដំណើរការដែលជាក់លាក់

### គោលបំណងម៉ាស្សូ

ដោយបញ្ចប់វគ្គបណ្តាលដែលមានរចនាសម្ព័ន្ធនេះ អ្នកនឹងអាច:
- **ទទួលបានសមត្ថភាព AZD មូលដ្ឋាន**: គំនិតមូលដ្ឋាន, ការតំឡើង និង ការកំណត់រចនា
- **ដាក់ពាក្យកម្ម AI**: ប្រើ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **អនុវត្តបណ្តាញជាគោលការណ៍ IaC**: គ្រប់គ្រងធនធាន Azure ជាមួយទំព័រគំរូ Bicep
- **ដោះស្រាយបញ្ហាក្នុងការដាក់ឲ្យដំណើរការ**: ដោះស្រាយបញ្ហាជាធម្មតា និងធ្វើដៃរក
- **បង្កើនប្រសិទ្ធភាពសម្រាប់ផលិតកម្ម**: សុវត្ថិភាព, ការបង្កើនទំហំ, ការតាមដាន និង ការគ្រប់គ្រងថ្លៃសេវា
- **សង់ដំណោះស្រាយច្រើនភ្នាក់ងារ**: ដាក់បញ្ញាស្ថាបត្យកម្ម AI ស្មុគស្មាញ

## មុននឹងអ្នកចាប់ផ្តើម៖ គណនី, ចូលដំណើរការ និងការសន្មត់

មុននឹងអ្នកចាប់ផ្តើមជំពូកទី១ សូមប្រាកដថាអ្នកមានវត្ថុបំណងដូចខាងក្រោម។ ជំហានតំឡើងនៅក្រោយសៀវភៅណែនាំនេះបានសន្មតថាមូលដ្ឋានទាំងនេះត្រូវបានគ្រប់គ្រងរួចរាល់។

- **ការជាវ Azure**: អ្នកអាចប្រើការជាវដែលមានរួចពីការងារ ឬគណនីផ្ទាល់ខ្លួន ឬបង្កើត [សាកល្បងដោយឥតគិតថ្លៃ](https://aka.ms/azurefreetrial) ដើម្បីចាប់ផ្តើម។
- **សិទ្ធិបង្កើតធនធាន Azure**: សម្រាប់លំហាត់ភាគច្រើន អ្នកគួរតែមានសិទ្ធិ **Contributor** នៅលើការជាវ ឬ ក្រុមធនធានគោលដៅ។ ជំពូកខ្លះអាចសន្មតថាអ្នកអាចបង្កើតក្រុមធនធាន managed identities និងការចាត់តាំង RBAC បានផងដែរ។
- [**គណនី GitHub**](https://github.com): នេះមានប្រយោជន៍សម្រាប់បង្កើតសាខា(repo fork), តាមដានការផ្លាស់ប្តូររបស់អ្នក និងប្រើប្រាស់ GitHub Codespaces សម្រាប់សិក្ខាសាលា។
- **លក្ខខណ្ឌមុនប្រតិបត្តិការ Template**: គំរូខ្លះត្រូវការឧបករណ៍ក្នុងទីតាំងដូចជា Node.js, Python, Java, ឬ Docker។ ប្រតិបត្តិការត្រួតពិនិត្យដំណើរការមុនចាប់ផ្តើម ដើម្បីចាប់ផ្តើមឧបករណ៍ខ្វះឆាប់។
- **ការយល់ដឹងផ្ទាល់នៃ terminal**: អ្នកមិនចាំបាច់ជាអ្នកជំនាញ ភាគច្រើនទេ ប៉ុន្តែគួរតែស្រួលចាប់ផ្តើមការបញ្ជា​ដូចជា `git clone`, `azd auth login`, និង `azd up`។

> **កំពុងធ្វើការនៅក្នុងការជាវសហគ្រាស?**
> បើបរិយាកាស Azure របស់អ្នកត្រូវបានគ្រប់គ្រងដោយអ្នកគ្រប់គ្រង សូមបញ្ជាក់ជាមុនថាអ្នកអាចដាក់ធនធាននៅក្នុងការជាវ ឬ ក្រុមធនធានដែលអ្នកមានបំណងប្រើ។ បើមិនដូច្នោះ សូមស្នើសុំការជាវ sandbox ឬសិទ្ធិ Contributor មុនចាប់ផ្តើម។

> **ថ្មីចំពោះ Azure?**
> ចាប់ផ្តើមជាមួយសាកល្បង azure របស់អ្នកផ្ទាល់ ឬជាវទូទៅជា pay-as-you-go នៅ https://aka.ms/azurefreetrial ដើម្បីអនុវត្តលំហាត់ពីដើមដល់ចុងដោយមិនរង់ចាំការអនុញ្ញាតលើបណ្ដំពេទ្យ tenant។

## 🗺️ ផែនទីវគ្គសិក្សា៖ នាវីហ្គេស្យុងរហ័សតាមជំពូក

ជំពូ​កនីមួយៗមាន README ជាពិសេសជាមួយគោលដៅសិក្សា ចាប់ផ្តើមរហ័ស និងលំហាត់:

| ជំពូក | ពិពណ៌នា | មេរៀន | រយៈពេល | ភាពស្មុគស្មាញ |
|---------|-------|---------|----------|------------|
| **[ជំពូក ១៖ មូលដ្ឋាន](docs/chapter-01-foundation/README.md)** | ចាប់ផ្តើម | [AZD មូលដ្ឋាន](docs/chapter-01-foundation/azd-basics.md) &#124; [ការតំឡើង](docs/chapter-01-foundation/installation.md) &#124; [គម្រោងដំបូង](docs/chapter-01-foundation/first-project.md) | 30-45 នាទី | ⭐ |
| **[ជំពូក ២៖ ការអភិវឌ្ឍ AI](docs/chapter-02-ai-development/README.md)** | កម្មវិធី AI-First | [ការរួមបញ្ចូល Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [ភ្នាក់ងារ AI](docs/chapter-02-ai-development/agents.md) &#124; [ការដាក់ម៉ូដែល](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [មណ្ឌលសិក្សា](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ម៉ោង | ⭐⭐ |
| **[ជំពូក ៣៖ ការកំណត់រចនា](docs/chapter-03-configuration/README.md)** | ការផ្ទៀងផ្ទាត់ និងសុវត្ថិភាព | [ការកំណត់រចនា](docs/chapter-03-configuration/configuration.md) &#124; [ការផ្ទៀងផ្ទាត់ និងសុវត្ថិភាព](docs/chapter-03-configuration/authsecurity.md) | 45-60 នាទី | ⭐⭐ |
| **[ជំពូក ៤៖ សេវាគ្រឹះ](docs/chapter-04-infrastructure/README.md)** | IaC និងការដាក់ឲ្យដំណើរការ | [មគ្គុទេពការដាក់](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [ការផ្គត់ផ្គង់](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ម៉ោង | ⭐⭐⭐ |
| **[ជំពូក ៥៖ ភ្នាក់ងារច្រើន](docs/chapter-05-multi-agent/README.md)** | ដំណោះស្រាយភ្នាក់ងារ AI | [របៀបលក់រាយ](examples/retail-scenario.md) &#124; [លំនាំសម្របសម្រួល](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ម៉ោង | ⭐⭐⭐⭐ |
| **[ជំពូក ៦៖ មុនការដាក់](docs/chapter-06-pre-deployment/README.md)** | ការធ្វើផែនការ និងត្រួតពិនិត្យ | [ពិនិត្យមុនកម្រិត](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ផែនការមានសមត្ថភាពទទួល](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [ជ្រើសរើស SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ម៉ោង | ⭐⭐ |
| **[ជំពូក ៧៖ ដោះស្រាយបញ្ហា](docs/chapter-07-troubleshooting/README.md)** | ពិនិត្យ និងដោះស្រាយ | [បញ្ហាសកល](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ការពិនិត្យ](docs/chapter-07-troubleshooting/debugging.md) &#124; [បញ្ហា AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ម៉ោង | ⭐⭐ |
| **[ជំពូក ៨៖ ផលិតកម្ម](docs/chapter-08-production/README.md)** | លំនាំរបស់សហគ្រាស | [អនុវត្តផលិតកម្ម](docs/chapter-08-production/production-ai-practices.md) | 2-3 ម៉ោង | ⭐⭐⭐⭐ |
| **[🎓 មណ្ឌលសិក្សា](workshop/README.md)** | ផ្ទះមួយដៃ | [ជំនាញបង្ហាញ](workshop/docs/instructions/0-Introduction.md) &#124; [ជ្រើសរើស](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ត្រួតពិនិត្យ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [បំបែក](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [កំណត់រចនា](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [ផ្ទាល់ខ្លួន](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [បារ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [បញ្ចប់](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ម៉ោង | ⭐⭐ |

**រយៈពេលសរុបវគ្គសិក្សា:** ~10-14 ម៉ោង | **ជំហានសមត្ថភាព:** ដំបូង → រួចរាល់ផលិតកម្ម

---

## 📚 ជំពូកសិក្សា

*ជ្រើសរើសផ្លូវសិក្សារបស់អ្នកដោយផ្អែកលើកម្រិតបទពិសោធន៍ និងគោលដៅ*

### 🚀 ជំពូក ១៖ មូលដ្ឋាន និងចាប់ផ្តើមរហ័ស
**លក្ខខណ្ឌមុន**: ការជាវ Azure, ចំណេះដឹងបញ្ជាធ្វើការ
**រយៈពេល**: 30-45 នាទី
**ភាពស្មុគស្មាញ**: ⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការយល់ដឹងមូលដ្ឋានអំពី Azure Developer CLI
- ការតំឡើង AZD លើប្លាតហ្វន
- ការដាក់ដំណើរការតំបន់ជោគជ័យដំបូងរបស់អ្នក

#### ឯកសារសិក្សា
- **🎯 ចាប់ផ្តើមនៅទីនេះ**: [Azure Developer CLI គឺអ្វី?](#what-is-azure-developer-cli)
- **📖 ទ្រឹស្តី**: [AZD មូលដ្ឋាន](docs/chapter-01-foundation/azd-basics.md) - គំនិតមូលដ្ឋាន និងពាក្យសំដី
- **⚙️ ការតំឡើង**: [ការតំឡើង និង ការតំរូវការ](docs/chapter-01-foundation/installation.md) - មគ្គុទេសក៍ផ្លាតហ្វមដែលផ្តល់ជូន
- **🛠️ ប្រតិបត្តិការដៃ**: [គម្រោងដំបូងរបស់អ្នក](docs/chapter-01-foundation/first-project.md) - មេរៀនជំហានជំហាន
- **📋 ឯកសារយោងរហ័ស**: [តារាងពាក្យបញ្ជា](resources/cheat-sheet.md)

#### លំហាត់អនុវត្ត
```bash
# ការត្រួតពិនិត្យការដំឡើងលឿន
azd version

# បង្ហោះកម្មវិធីដំបូងរបស់អ្នក
azd init --template todo-nodejs-mongo
azd up
```

**💡 លទ្ធផលជំពូក**: ដាក់កម្មវិធី вэបញ្ញាសាមញ្ញសមត្ថភាពទៅ Azure ដោយប្រើ AZD បានជោគជ័យ

**✅ ការត្រួតពិនិត្យជោគជ័យ៖**
```bash
# បន្ទាប់ពីបញ្ចប់ជំពូកទី ១ អ្នកគួរតែអាចធ្វើបាន:
azd version              # បង្ហាញកំណែដែលបានដំឡើង
azd init --template todo-nodejs-mongo  # ចាប់ផ្ដើមគម្រោង
azd up                  # បញ្ជូនទៅ Azure
azd show                # បង្ហាញ URL កម្មវិធីដែលកំពុងដំណើរការ
# កម្មវិធីបើកនៅក្នុងកម្មវិធីរុករក និងដំណើរការ
azd down --force --purge  # សម្អាតធនធាន
```

**📊 រយៈពេលវិនិយោគ:** 30-45 នាទី  
**📈 កម្រិតជំនាញបន្ទាប់:** អាចដាក់កម្មវិធីមូលដ្ឋានដោយឯករាជ្យ
**📈 កម្រិតជំនាញបន្ទាប់:** អាចដាក់កម្មវិធីមូលដ្ឋានដោយឯករាជ្យ

---

### 🤖 ជំពូក ២៖ ការអភិវឌ្ឍ AI ជាដំបូង (ផ្តល់ការផ្ដល់អនុសាសន៍សម្រាប់អ្នកអភិវឌ្ឍ AI)
**លក្ខខណ្ឌមុន**: បានបញ្ចប់ជំពូក ១  
**រយៈពេល**: 1-2 ម៉ោង  
**ភាពស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការរួមបញ្ចូល Microsoft Foundry ជាមួយ AZD
- ការដាក់កម្មវិធីដែលផ្តល់ដោយ AI
- ការយល់ដឹងអំពីការកំណត់សេវាកម្ម AI

#### ឯកសារសិក្សា
- **🎯 ចាប់ផ្តើមនៅទីនេះ**: [ការរួមបញ្ចូល Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 ភ្នាក់ងារ AI**: [មគ្គុទេសក៍ភ្នាក់ងារ AI](docs/chapter-02-ai-development/agents.md) - ដាក់ភ្នាក់ងារឆ្លាតវៃជាមួយ AZD
- **📖 លំនាំ**: [ការដាក់ AI ម៉ូដែល](docs/chapter-02-ai-development/ai-model-deployment.md) - ដាក់ និងគ្រប់គ្រងម៉ូដែល AI
- **🛠️ មណ្ឌលសិក្សា**: [មណ្ឌលសិក្សា AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ធ្វើឱ្យដំណោះស្រាយ AI របស់អ្នក សមត្ថភាព AZD
- **🎥 មគ្គុទេសក៍អន្តរកម្ម**: [សម្ភារៈមណ្ឌលសិក្សា](workshop/README.md) - ការសិក្សាតាមកម្មវិធី MkDocs * បរិយាកាស DevContainer
- **📋 គំរូ**: [គំរូ Microsoft Foundry](#ប្រភពវគ្គសិក្សា)
- **📝 ឧទាហរណ៍**: [ឧទាហរណ៍ការដាក់ AZD](examples/README.md)

#### លំហាត់អនុវត្ត
```bash
# ផ្ទុកកម្មវិធី AI ដំបូងរបស់អ្នក
azd init --template azure-search-openai-demo
azd up

# ព្យាយាមទម្រង់ AI បន្ថែមទៀត
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 លទ្ធផលជំពូក**: ដាក់ និងកំណត់កម្មវិធីសន្ទនាដែលមាន AI ជាមួយសមត្ថភាព RAG

**✅ ការត្រួតពិនិត្យជោគជ័យ៖**
```bash
# បន្ទាប់ពីជំពូកទី 2 អ្នកគួរតែអាចធ្វើបាន៖
azd init --template azure-search-openai-demo
azd up
# សាកល្បងមុខងារ​ជជែកប៉ុន្មាន AI
# សួរបញ្ហា ហើយទទួលបានចម្លើយដែលបានគ្រប់គ្រងដោយ AI មានប្រភព
# បញ្ជាក់ថាការរួមបញ្ចូលការស្វែងរកដំណើរការ
azd monitor  # ពិនិត្យមើល Application Insights បង្ហាញព័ត៌មានតាមដាន
azd down --force --purge
```

**📊 រយៈពេលវិនិយោគ:** 1-2 ម៉ោង  
**📈 កម្រិតជំនាញបន្ទាប់:** អាចដាក់និងកំណត់កម្មវិធី AI សម្រាប់ផលិតកម្មបាន  
**💰 ការយល់ដឹងថ្លៃសេវា:** យល់ដឹងថ្លៃអភិវឌ្ឍ $80-150/ខែ, ថ្លៃផលិតកម្ម $300-3500/ខែ

#### 💰 ការពិចារណាថ្លៃសម្រាប់ការដាក់ AI

**បរិយាកាសអភិវឌ្ឍ (វាយតម្លៃ $80-150/ខែ):**
- ម៉ូដែល Microsoft Foundry (Debit-as-you-go): $0-50/ខែ (ផ្អែកលើការប្រើប្រាស់ token)
- ស្វែងរក AI (កម្រិតមូលដ្ឋាន): $75/ខែ
- កម្មវិធី Container (ការទទួលបាន): $0-20/ខែ
- ការផ្ទុក (ស្តង់ដារ): $1-5/ខែ

**បរិយាកាសផលិតកម្ម (វាយតម្លៃ $300-3,500+/ខែ):**
- ម៉ូដែល Microsoft Foundry (PTU សម្រាប់កម្រិតការសម្តែងជាមានសុវត្ថិភាព): $3,000+/ខែ ឬ Pay-as-go ជាមួយបរិមាណខ្ពស់
- ស្វែងរក AI (កម្រិតស្តង់ដារ): $250/ខែ
- កម្មវិធី Container (ឯកតាប្រើប្រាស់): $50-100/ខែ
- Application Insights: $5-50/ខែ
- ការផ្ទុក (លំនាំល្អបំផុត): $10-50/ខែ

**💡 ទូទាត់ថ្លៃសេវាឲ្យមានប្រសិទ្ធភាព:**
- ប្រើ **កម្រិតឥតគិតថ្លៃ** ម៉ូដែល Microsoft Foundry សម្រាប់ការសិក្សា (Azure OpenAI 50,000 token/ខែ)
- បើក `azd down` ដើម្បីផ្អាកធនធានពេលដែលមិនកំពុងអភិវឌ្ឍដោយសកម្ម
- ចាប់ផ្តើមជាមួយការគិតថ្លៃមូលដ្ឋាន ពេលប៉ុណ្ណោះ ដែលទទួលយក PTU សម្រាប់ផលិតកម្មប៉ុណ្ណោះ
- ប្រើ `azd provision --preview` ដើម្បីប៉ាន់ប្រមាណថ្លៃសេវាមុនការដាក់
- បើក auto-scaling: ទូទាត់ថ្លៃត្រឹមតែការប្រើប្រាស់ពិតប្រាកដ

**ការតាមដានថ្លៃសេវា:**
```bash
# ត្រួតពិនិត្យការចំណាយប្រចាំខែដែលគណនាថា
azd provision --preview

# ត្រួតពិនិត្យការចំណាយពិតនៅក្នុងរបរភ័ណ Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ ជំពូក ៣៖ ការកំណត់រចនា និងការផ្ទៀងផ្ទាត់
**លក្ខខណ្ឌមុន**: បានបញ្ចប់ជំពូក ១  
**រយៈពេល**: 45-60 នាទី  
**ភាពស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការកំណត់បរិយាកាស និងការគ្រប់គ្រង
- ការផ្ទៀងផ្ទាត់ និងវិធីល្អបំផុតសម្រាប់សុវត្ថិភាព
- ការកំណត់ឈ្មោះធនធាន និងការរៀបចំ

#### ឯកសារសិក្សា
- **📖 ការកំណត់រចនា**: [មគ្គុទេសក៍កំណត់រចនា](docs/chapter-03-configuration/configuration.md) - ការតំឡើងបរិយាកាស
- **🔐 សុវត្ថិភាព**: [លំនាំផ្ទៀងផ្ទាត់ និង managed identity](docs/chapter-03-configuration/authsecurity.md) - លំនាំផ្ទៀងផ្ទាត់
- **📝 ឧទាហរណ៍**: [ឧទាហរណ៍កម្មវិធី Database](examples/database-app/README.md) - ឧទាហរណ៍ AZD ទិន្នន័យ

#### លំហាត់អនុវត្ត
- កំណត់បរិយាកាសជាច្រើន (បង្កើត dev, staging, prod)
- តំឡើង managed identity សម្រាប់ផ្ទៀងផ្ទាត់
- អនុវត្តកំណត់រចនាពិសេសសម្រាប់បរិយាកាស

**💡 លទ្ធផលជំពូក**: គ្រប់គ្រងបរិយាកាសជាច្រើនជាមួយការផ្ទៀងផ្ទាត់ និងសុវត្ថិភាពត្រឹមត្រូវ

---

### 🏗️ ជំពូក ៤៖ សេវាគ្រឹះជាគោលការណ៍ IaC និងការដាក់ឲ្យដំណើរការ
**លក្ខខណ្ឌមុន**: បានបញ្ចប់ជំពូក 1-3  
**រយៈពេល**: 1-1.5 ម៉ោង  
**ភាពស្មុគស្មាញ**: ⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- លំនាំដាក់ពាក្យដំណើរការអ្នកជំនាញ
- សេវាគ្រឹះជាគោលការណ៍ IaC ជាមួយ Bicep
- វិធីសាស្ត្រផ្គត់ផ្គង់ធនធាន

#### ឯកសារ​សិក្សា
- **📖 ការដាក់ដំណើរការ**: [មគ្គុទេសក៍ដាក់](docs/chapter-04-infrastructure/deployment-guide.md) - ជ្រាតជ្រែងកម្មវិធីពេញលេញ
- **🏗️ ការផ្គត់ផ្គង់**: [ការផ្គត់ផ្គង់ធនធាន](docs/chapter-04-infrastructure/provisioning.md) - ការគ្រប់គ្រងធនធាន Azure
- **📝 ឧទាហរណ៍**: [Container App ឧទាហរណ៍](../../examples/container-app) - ការដាក់គម្រោង container

#### លំហាត់អនុវត្ត
- បង្កើតគំរូ Bicep ផ្ទាល់ខ្លួន
- ដាក់កម្មវិធីភាគច្រើនសេវា
- អនុវត្តយុទ្ធសាស្ត្រដាក់ពីបួនដំណាក់កាលប្លុង-បៃតង

**💡 លទ្ធផលជំពូក**: ដាក់កម្មវិធីសេវាច្រើនស្មុគស្មាញដោយប្រើគំរូសេវាគ្រឹះផ្ទាល់ខ្លួន

---


### 🎯 បទទី 5៖ ដំណោះស្រាយ អេ.អាយ បន្ទាន់ពហុភាគី (កម្រិតខ្ពស់)
**លក្ខខ័ណ្ឌជាមូលដ្ឋាន**៖ ចប់ការសិក្សាបទ 1-2  
**រយៈពេល**៖ ២-៣ ម៉ោង  
**ភាពស្មុគស្មាញ**៖ ⭐⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- រចនាសម្ព័ន្ធបន្ទាន់ពហុភាគី
- ការតំឡើងពហុភាគី និងការសម្របសម្រួល
- ការដាក់បញ្ចូលអេ.អាយ ក្នុងលក្ខណៈផលិតកម្ម

#### ប្រភពការរៀន
- **🤖 គម្រោងល្បី**៖ [ដំណោះស្រាយពហុភាគីលក់រាយ](examples/retail-scenario.md) - ការអនុវត្តន៍ពេញលេញ
- **🛠️ គំរូ ARM**៖ [កញ្ចប់គំរូ ARM](../../examples/retail-multiagent-arm-template) - ដំណើរការដាក់បញ្ចូលតែមួយចុច
- **📖 រចនាសម្ព័ន្ធ**៖ [រចនាសម្ព័ន្ធសម្របសម្រួលពហុភាគី](docs/chapter-06-pre-deployment/coordination-patterns.md) - គំរូរចនាសម្ព័ន្ធ

#### សហគ្រាសអនុវត្ត
```bash
# តម្លើងដំណោះស្រាយភ្នាក់ងារច្រើនពេញលេញសម្រាប់លក់រាយ
cd examples/retail-multiagent-arm-template
./deploy.sh

# ស្រាវជ្រាវការកំណត់រចនាសម្ព័ន្ធភ្នាក់ងារ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 លទ្ធផលបន្ទាប់ពីសិក្សា**៖ ដាក់ទុកដំណើរការនិងគ្រប់គ្រងដំណោះស្រាយអេ.អាយ ពហុភាគី ដែលមានភាគីអតិថិជន និងភាគីបញ្ជីទំនិញ

---

### 🔍 បទទី 6៖ ការត្រួតពិនិត្យនិងផែនការមុនដាក់បញ្ចូល
**លក្ខខ័ណ្ឌជាមូលដ្ឋាន**៖ បទទី 4 បានបញ្ចប់  
**រយៈពេល**៖ 1 ម៉ោង  
**ភាពស្មុគស្មាញ**៖ ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការធ្វើផែនការសមត្ថភាព និងការត្រួតពិនិត្យធនធាន
- យុទ្ធសាស្រ្ដជ្រើសរើស SKU
- ការត្រួតពិនិត្យមុនដាក់បញ្ចូល និងស្វ័យប្រវត្តិ

#### ប្រភពការរៀន
- **📊 ផែនការ**៖ [ផែនការសមត្ថភាព](docs/chapter-06-pre-deployment/capacity-planning.md) - ការត្រួតពិនិត្យធនធាន
- **💰 ជ្រើសរើស**៖ [ជ្រើសរើស SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ជម្រើសដែលសមរម្យក្នុងចំណាយ
- **✅ ការត្រួតពិនិត្យ**៖ [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - ស្គ្រីបស្វ័យប្រវត្តិ

#### សហគ្រាសអនុវត្ត
- ប្រតិបត្តិការ​ស្គ្រីបត្រួតពិនិត្យសមត្ថភាព
- ធ្វើអោយជ្រើសរើស SKU មានប្រសិទ្ធភាពក្នុងចំណាយ
- អនុវត្តការត្រួតពិនិត្យមុនដាក់បញ្ចូលដោយស្វ័យប្រវត្តិ

**💡 លទ្ធផលបន្ទាប់ពីសិក្សា**៖ ត្រួតពិនិត្យ និងធ្វើឲ្យប្រសើរជាងមុននូវការដាក់បញ្ចូលមុនការអនុវត្ត

---

### 🚨 បទទី 7៖ ការដោះស្រាយបញ្ហា និងវាយតម្លៃកូដបំលែង
**លក្ខខ័ណ្ឌជាមូលដ្ឋាន**៖ បានបញ្ចប់បទណាមួយនៃការដាក់បញ្ចូល  
**រយៈពេល**៖ ១ - ១.៥ ម៉ោង  
**ភាពស្មុគស្មាញ**៖ ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- វិធីសាស្រ្តវាយតម្លៃកូដបំលែងយ៉ាងប្រពៃណី
- បញ្ហាទូទៅ និងការដោះស្រាយ
- ការដោះស្រាយបញ្ហាចំពោះអេ.អាយជាក់លាក់

#### ប្រភពការរៀន
- **🔧 បញ្ហាទូទៅ**៖ [បញ្ហាទូទៅ](docs/chapter-07-troubleshooting/common-issues.md) - សំណួរដែលសួរញឹកញាប់ និងវិធីដោះស្រាយ
- **🕵️ ការវាយតម្លៃកូដបំលែង**៖ [មគ្គុទេសក៍វាយតម្លៃកូដបំលែង](docs/chapter-07-troubleshooting/debugging.md) - វិធីសាស្រ្តជំហានក្រោយជំហាន
- **🤖 បញ្ហាអេ.អាយ**៖ [ការដោះស្រាយបញ្ហាអេ.អាយ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - បញ្ហាសេវាកម្មអេ.អាយ

#### សហគ្រាសអនុវត្ត
- វាយតម្លៃបរាជ័យក្នុងការដាក់បញ្ចូល
- ដោះស្រាយបញ្ហាសក្ដានុពល
- វាយតម្លៃការតភ្ជាប់សេវាកម្មអេ.អាយ

**💡 លទ្ធផលបន្ទាប់ពីសិក្សា**៖ វាយតម្លៃ និងដោះស្រាយបញ្ហាទូទៅដោយឯករាជ្យ

---

### 🏢 បទទី 8៖ រចនាសម្ព័ន្ធផលិតកម្ម និងសហគ្រាស
**លក្ខខ័ណ្ឌជាមូលដ្ឋាន**៖ ចប់ការសិក្សាបទ 1-4  
**រយៈពេល**៖ ២-៣ ម៉ោង  
**ភាពស្មុគស្មាញ**៖ ⭐⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- យុទ្ធសាស្រ្តដាក់បញ្ចូលក្នុងលក្ខខណៈផលិតកម្ម
- រចនាសម្ព័ន្ធសន្តិសុខសហគ្រាស
- ការត្រួតពិនិត្យ និងការបង្កើនប្រសិទ្ធភាពចំណាយ

#### ប្រភពការរៀន
- **🏭 ផលិតកម្ម**៖ [អនុវត្តអេ.អាយលើផលិតកម្ម](docs/chapter-08-production/production-ai-practices.md) - រចនាសម្ព័ន្ធសហគ្រាស
- **📝 ឧទាហរណ៍**៖ [ឧទាហរណ៍ម៉ៃក្រូសេវាកម្ម](../../examples/microservices) - រចនាសម្ព័ន្ធស្មុគស្មាញ
- **📊 ការត្រួតពិនិត្យ**៖ [ការរួមបញ្ចូលកម្មវិធី Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - ការត្រួតពិនិត្យ

#### សហគ្រាសអនុវត្ត
- អនុវត្តរចនាសម្ព័ន្ធសន្តិសុខសហគ្រាស
- បង្កើតប្រព័ន្ធត្រួតពិនិត្យយ៉ាងទូលំទូលាយ
- ដាក់បញ្ចូលក្នុងផលិតកម្មដោយមានអាជ្ញាប័ណ្ណគ្រប់គ្រង

**💡 លទ្ធផលបន្ទាប់ពីសិក្សា**៖ ដាក់បញ្ចូលកម្មវិធីសហគ្រាសមានសមត្ថភាពផលិតកម្មពេញលេញ

---

## 🎓 សង្ខេបសិក្សា៖ បទពិសោធន៏វគ្គសិក្សាដោយដៃ

> **⚠️ ស្ថានភាពវគ្គសិក្សាៈ កំពុងអភិវឌ្ឍ**  
> សម្ភារៈវគ្គសិក្សាកំពុងត្រូវបានអភិវឌ្ឍន៍ និងកែលម្អ។ ម៉ូឌុលគំរូមានសមត្ថភាព ប្រសើរពីមុន ប៉ុន្តែកំរិតខ្ពស់មួយចំនួនមិនទាន់បញ្ចប់។ យើងកំពុងដំណើរការជាបន្តបន្ទាប់ដើម្បីបញ្ចប់មាតិកាទាំងអស់។ [តាមដានភាពរីកចម្រើន →](workshop/README.md)

### សម្ភារៈវគ្គសិក្សាអន្តរជាតិ
**ការសិក្សាដោយដៃពេញលេញជាមួយឧបករណ៍ប្រើប្រាស់នៅលើកម្មវិធីរុករក និងសហគ្រាសបង្ហាត់បង្ហាញ**

សម្ភារៈវគ្គសិក្សារបស់យើងផ្តល់នូវបទពិសោធន៍សិក្សាដោយផ្អែកលើរចនាសម្ព័ន្ធ ដែលបន្ថែមលើគណនីនៅក្នុងបទពិសោធន៍នីមួយៗខាងលើ។ វគ្គសិក្សាត្រូវបានរចនាឡើងសម្រាប់ការសិក្សាផ្ទាល់ខ្លួន និងវគ្គសិក្សាតាមការណែនាំដោយគ្រូបង្វឹក។

#### 🛠️ លក្ខណៈពិសេសវគ្គសិក្សា
- **ផ្ទាំងប្រើប្រាស់បែបកម្មវិធីរុករក**៖ វគ្គសិក្សាត្រូវបានគ្រប់គ្រងដោយ MkDocs មានមុខងារស្វែងរក ចម្លង នឹងរចនាបែបអេតស្ក្រីន
- **ការរួមបញ្ចូល GitHub Codespaces**៖ ការតំឡើងបរិយាកាសអភិវឌ្ឍតែមួយចុច
- **ផ្លូវសិក្សាប្រព្រឹត្ត**៖ វគ្គ 8 ម៉ូឌុល ជាដំណើរការត្រឹមត្រូវ (រយៈពេល 3-4 ម៉ោងសរុប)
- **វិធីសាស្រ្តប្រើប្រាស់ជាកម្រិត**៖ សាកល្បង → ជ្រើសរើស → ត្រួតពិនិត្យ → បំបែក → កំណត់បរិយាកាស → ប្តូរតាមបំណង → លុបចោល → បិទវគ្គ
- **បរិយាកាស DevContainer មានអន្តរកម្ម**៖ ឧបករណ៍ និងមូលដ្ឋានត្រូវបានកំណត់ជាមុន

#### 📚 រចនាសម្ព័ន្ធម៉ូឌុលវគ្គសិក្សា
វគ្គសិក្សាមានវិធីសាស្រ្ត 8 មួយកម្រិត ដែលនាំអ្នកពីការតស៊ូរបួស ដល់ជំនាញក្នុងការដាក់បញ្ចូល៖

| ម៉ូឌុល | ប្រធានបទ | អ្វីដែលអ្នកនឹងធ្វើ | រយៈពេល |
|--------|-------|----------------|----------|
| **0. អធិប្បាយ** | សង្ខេបវគ្គសិក្សា | យល់ដឹងអំពីគោលបំណង ស្ថានភាពជាមូលដ្ឋាន និងរចនាសម្ព័ន្ធវគ្គ | 15 នាទី |
| **1. ជ្រើសរើស** | ស្វែងរកគំរូ | ស្វែងរកគំរូ AZD និងជ្រើសរើសគំរូ AI សមរម្យសម្រាប់ស្ថានភាពរបស់អ្នក | 20 នាទី |
| **2. ត្រួតពិនិត្យ** | ដាក់បញ្ចូល និងផ្ទៀងផ្ទាត់ | ដាក់បញ្ចូលគំរូជាមួយ `azd up` និងផ្ទៀងផ្ទាត់ថាគ្រប់គ្រងស្ថាបត្យកម្មដំណើរការ | 30 នាទី |
| **3. តម្រៀបឡើងវិញ** | យល់ដឹងរចនាសម្ព័ន្ធ | ប្រើ GitHub Copilot ស្វែងរករចនាសម្ព័ន្ធគំរូ Bicep និងរៀបចំកូដ | 30 នាទី |
| **4. កំណត់បរិយាកាស** | ស្វែងយល់ពី azure.yaml | ជំនាញកំណត់តម្លៃ `azure.yaml` វិសាលភាពជីវិត និងអថេរបរិយាកាស | 30 នាទី |
| **5. ប្តូរតាមបំណង** | បង្កើតវាឲ្យជារបស់អ្នក | បើក AI Search, ការតាមដាន, ការវាយតម្លៃ និងប្តូរតាមស្ថានភាពរបស់អ្នក | 45 នាទី |
| **6. លុបចោល** | សម្អាត | លុបធនធានដោយសុវត្ថិភាពជាមួយ `azd down --purge` | 15 នាទី |
| **7. បិទវគ្គ** | ជំហានបន្ទាប់ | ពិនិត្យឡើងវិញពីសមិទ្ធផល គំនិតសំខាន់ និងបន្តសិក្សារបស់អ្នក | 15 នាទី |

**លំដាប់វគ្គសិក្សា:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ចាប់ផ្តើមជាមួយវគ្គសិក្សា
```bash
# ជម្រើសទី ១: GitHub Codespaces (ផ្តល់អនុសាសន៍)
# ចុច "Code" → "Create codespace on main" នៅក្នុងឃ្លាំងរបស់អ្នក

# ជម្រើសទី ២: ការអភិវឌ្ឍនៅក្នុងម៉ាស៊ីនបង្ហាញផ្ទាល់
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# អនុវត្តតាមការណែនាំដំឡើងនៅក្នុង workshop/README.md
```

#### 🎯 លទ្ធផលសិក្សាទីបន្ទាប់បន្ទាន់
ដោយបញ្ចប់វគ្គសិក្សា អ្នកចូលរួមនឹង៖
- **ដាក់បញ្ចូលកម្មវិធីអេ.អាយ ផលិតកម្ម**៖ ប្រើ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **យល់ដឹងរចនាសម្ព័ន្ធពហុភាគី**៖ អនុវត្តដំណោះស្រាយភាគីអេ.អាយមានការសម្របសម្រួល
- **អនុវត្តការ​សន្តិសុខ​ល្អ​បំផុត**៖ កំណត់ម៉ាស៊ីនចុះបញ្ជី និងការគ្រប់គ្រងការចូលប្រើ
- **បង្កើតប្រសិទ្ធភាពសម្រាប់វិមាត្រ**៖ រចនាដាក់បញ្ចូលដែលមានប្រសិទ្ធភាពក្នុងការចំណាយ និងដំណើរការ
- **ដោះស្រាយបញ្ហាការដាក់បញ្ចូល**៖ ដោះស្រាយបញ្ហាទូទៅដោយឯករាជ្យ

#### 📖 ប្រភពវគ្គសិក្សា
- **🎥 មគ្គុទេសក៍អន្តរកម្ម**៖ [សម្ភារៈវគ្គសិក្សា](workshop/README.md) - បរិយាកាសសិក្សាជើង
- **📋 សេចក្តីណែនាំម៉ូឌុលតាមម៉ូឌុល**:
  - [0. អធិប្បាយ](workshop/docs/instructions/0-Introduction.md) - សង្ខេប និងគោលបំណងវគ្គសិក្សា
  - [1. ជ្រើសរើស](workshop/docs/instructions/1-Select-AI-Template.md) - ស្វែងរក និងជ្រើសរើសគំរូ AI
  - [2. ត្រួតពិនិត្យ](workshop/docs/instructions/2-Validate-AI-Template.md) - ដាក់បញ្ចូល និងផ្ទៀងផ្ទាត់គំរូ
  - [3. តម្រៀបឡើងវិញ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ស្វែងរករចនាសម្ព័ន្ធគំរូ
  - [4. កំណត់បរិយាកាស](workshop/docs/instructions/4-Configure-AI-Template.md) - ជាក់លាក់ទៅក្រោម azure.yaml
  - [5. ប្តូរតាមបំណង](workshop/docs/instructions/5-Customize-AI-Template.md) - ប្តូរតាមស្ថានភាពរបស់អ្នក
  - [6. លុបចោល](workshop/docs/instructions/6-Teardown-Infrastructure.md) - សម្អាតធនធាន
  - [7. បិទវគ្គ](workshop/docs/instructions/7-Wrap-up.md) - ពិនិត្យឡើងវិញ និងជំហានបន្ទាប់
- **🛠️ បន្ទប់សិក្សាអេ.អាយ**៖ [បន្ទប់សិក្សាអេ.អាយ](docs/chapter-02-ai-development/ai-workshop-lab.md) - សហគ្រាសអនុវត្តជាក់លាក់
- **💡 ចាប់ផ្តើមយ៉ាងរហ័ស**៖ [មគ្គុទេសក៍ការតំឡើងវគ្គសិក្សា](workshop/README.md#quick-start) - កំណត់បរិយាកាស

**សមរម្យសម្រាប់**៖ ការបណ្តុះបណ្តាលសង្គម ការសិក្សាសាកលវិទ្យាល័យ ការសិក្សាផ្ទាល់ខ្លួន និងកម្មវិធីបណ្តុះបណ្តាលអ្នកអភិវឌ្ឍន៍។

---

## 📖 រំលឹកលម្អិត៖ សមត្ថភាព AZD

នៅលើមូលដ្ឋានមូលដ្ឋាន AZD ផ្តល់នូវមុខងារសមត្ថភាពខ្លាំងសម្រាប់ការដាក់បញ្ចូលផលិតកម្ម៖

- **ការដាក់បញ្ចូលប្រើគំរូ** - ប្រើគំរូដែលបានរៀបចំជាមុនសម្រាប់រចនាសម្ព័ន្ធកម្មវិធីទូទៅ
- **ស្ថាបត្យកម្មជាកូដ** - គ្រប់គ្រងធនធាន Azure ដោយប្រើ Bicep ឬ Terraform  
- **លំហូរការងារត្រូវបានបង្កប់គ្នា** - ផ្តល់នូវការកំណត់ ប្រើ ការត្រួតពិនិត្យកម្មវិធីដោយរលូន
- **សម្រួលសម្រាប់អ្នកអភិវឌ្ឍន៍** - កំណត់សមត្ថភាពសម្រាប់ផលិតភាព និងបទពិសោធន៍របស់អ្នកអភិវឌ្ឍន៍

### **AZD + Microsoft Foundry: សមល្អសម្រាប់ការដាក់បញ្ចូលអេ.អាយ**

**ហេតុអ្វី AZD សម្រាប់ដំណោះស្រាយអេ.អាយ?** AZD ដោះស្រាយបញ្ហាសំខាន់ៗដែលអ្នកអភិវឌ្ឍន៍អេ.អាយប្រឈមមុខ៖

- **គំរូរួមបញ្ចូលអេ.អាយ** - គំរូកំណត់ជាមុនសម្រាប់ម៉ូដែល Microsoft Foundry, សេវាកម្ម Azure AI និងការងារ ML
- **ការការពារគ្រប់គ្រងសេវាកម្មអេ.អាយ** - រចនាសម្ព័ន្ធសន្តិសុខបង្កប់សម្រាប់សេវាកម្មអេ.អាយ សោ API និងច្រកម៉ូដែល  
- **រចនាសម្ព័ន្ធអេ.អាយផលិតកម្ម** - អនុវត្តជាតម្លៃល្អបំផុតសម្រាប់ការដាក់បញ្ចូលកម្មវិធីអេ.អាយអាចធំកប់ និងសមរម្យនេះ
- **លំហូរការងារអេ.អាយពីការចេញផ្សាយដល់ផលិតកម្ម** - ពីការអភិវឌ្ឍម៉ូដែល ដល់ការដាក់បញ្ចូលផលិតកម្មដែលមានការត្រួតពិនិត្យក្រៀមក្រំ
- **បច្ចេកវិទ្យាបង្កើនប្រសិទ្ធភាពចំណាយ** - ការចាត់ចែងធនធានឆ្លាតវៃ និងយុទ្ធសាស្រ្តពង្រីកសមត្ថភាពសម្រាប់ការងារ AI
- **ការរួមបញ្ចូល Microsoft Foundry** - ភ្ជាប់ដោយរលូនទៅកាន់កាតាឡុកម៉ូដែល និងច្រក Microsoft Foundry

---

## 🎯 បណ្ណាល័យគំរូ & ឧទាហរណ៍

### គំរូល្បី៖ គំរូ Microsoft Foundry
**ចាប់ផ្តើមនៅទីនេះ ប្រសិនបើអ្នកកំពុងដាក់បញ្ចូលកម្មវិធីអេ.អាយ!**

> **សម្គាល់:** គំរូទាំងនេះបង្ហាញពីរចនាសម្ព័ន្ធអេ.អាយផ្សេងៗ។ ខ្លះគឺជាគំរូ Azure Samples ខាងក្រៅ ខ្លះទៀតជាការអនុវត្តក្នុងតំបន់។

| គំរូ | បទ | ភាពស្មុគស្មាញ | សេវាកម្ម | ប្រភេទ |
|----------|---------|------------|----------|------|
| [**ចាប់ផ្តើមជាមួយការសន្ទនា AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | បទ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ខាងក្រៅ |
| [**ចាប់ផ្តើមជាមួយភាគី AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | បទ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ខាងក្រៅ |
| [**ការបង្ហាញ Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | បទ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ខាងក្រៅ |
| [**ការចាប់ផ្តើមប្រើប្រាស់កម្មវិធីសន្ទនា OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | បទ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ខាងក្រៅ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | បទ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ខាងក្រៅ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | បទ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ខាងក្រៅ |
| [**ដំណោះស្រាយពហុភាគីលក់រាយ**](examples/retail-scenario.md) | បទ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ក្នុងតំបន់** |

### គំរូល្បី៖ ស្ថានភាពការសិក្សាពេញលេញ
**គំរូកម្មវិធីផលិតកម្មដែលផ្គូផ្គងទៅនឹងបទសិក្សា**

| គំរូ | បទសិក្សា | ភាពស្មុគស្មាញ | គោលបំណងសិក្សា |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | បទ 2 | ⭐ | រចនាសម្ព័ន្ធដាក់បញ្ចូលអេ.អាយមូលដ្ឋាន |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | បទ 2 | ⭐⭐ | ការអនុវត្ត RAG ជាមួយ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | បទ 4 | ⭐⭐ | ការរួមបញ្ចូលបញ្ញាប្រព័ន្ធឯកសារ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | បទ 5 | ⭐⭐⭐ | គ្រឹះសម្ព័ន្ធភាគី និងការហៅមុខងារ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | បទ 8 | ⭐⭐⭐ | ការសម្របសម្រួលអេ.អាយសហគ្រាស |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | បទ 5 | ⭐⭐⭐⭐ | រចនាសម្ព័ន្ធពហុភាគីជាមួយភាគីអតិថិជន និងភាគីបញ្ជីទំនិញ |

### រៀនតាមប្រភេទឧទាហរណ៍

> **📌 ឧទាហរណ៍ក្នុងតំបន់ និងខាងក្រៅ:**  
> **ឧទាហរណ៍ក្នុងតំបន់** (នៅក្នុង repo នេះ) = រៀបចំឲ្យប្រើបានភ្លាមៗ  
> **ឧទាហរណ៍ខាងក្រៅ** (Azure Samples) = យកពី repository តំណភ្ជាប់

#### ឧទាហរណ៍ក្នុងតំបន់ (រួចរាល់សម្រាប់ប្រើ)
- [**ដំណោះស្រាយពហុភាគីលក់រាយ**](examples/retail-scenario.md) - ការអនុវត្តពេញលេញសម្រាប់ផលិតកម្ម ជាមួយគំរូ ARM
  - រចនាសម្ព័ន្ធពហុភាគី (ភាគីអតិថិជន + ភាគីបញ្ជីទំនិញ)
  - ការត្រួតពិនិត្យ និងវាយតម្លៃរួម
  - ដាក់បញ្ចូលតែមួយចុចតាមរយៈគំរូ ARM

#### ឧទាហរណ៍ក្នុងតំបន់ - កម្មវិធីកុងតឺន័រ (បទ 2-5)
**ឧទាហរណ៍ដាក់បញ្ចូលកុងតឺន័រ ដែលមានលក្ខណៈពេញលេញនៅក្នុង repository នេះ៖**

- [**ឧទាហរណ៍កម្មវិធី Container App**](examples/container-app/README.md) - មគ្គុទេសក៍ពេញលេញសម្រាប់ការចែកចាយជាតុងខាងក្នុង
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API មូលដ្ឋានជាមួយការតម្រង់ទៅសូន្យ
  - [Microservices Architecture](../../examples/container-app/microservices) - ការចែកចាយពហុសេវាកម្មដែលធ្វើការផលិតបាន
  - លំដាប់ដំណើរការបឋម ការផលិត និងការចែកចាយកម្រិតខ្ពស់
  - ការត្រួតពិនិត្យ អនុវត្តផ្នែកសុវត្ថិភាព និងការប្រើប្រាស់ធនធានឱ្យមានប្រសិទ្ធិភាព

#### ឧទាហរណ៍ខាងក្រៅ - កម្មវិធីសាមញ្ញ (ជំពូក ១-២)
**ចម្លងផ្ទាំងទិន្នន័យ Azure Samples ទាំងនេះដើម្បីចាប់ផ្តើម៖**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - លំនាំចេញកម្មវិធីសាមញ្ញ
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - ការចែកចាយខ្លឹមសារដោយស្ថិតិ
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - ការចែកចាយ REST API

#### ឧទាហរណ៍ខាងក្រៅ - បញ្ចូលមូលដ្ឋានទិន្នន័យ (ជំពូក ៣-៤)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - លំនាំភ្ជាប់មូលដ្ឋានទិន្នន័យ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - ការចាក់បញ្ចូលទិន្នន័យដោយគ្មានម៉ាស៊ីនបម្រើ

#### ឧទាហរណ៍ខាងក្រៅ - លំនាំកម្រិតខ្ពស់ (ជំពូក ៤-៨)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - ស្ថាបត្យកម្មពហុសេវាកម្ម
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ការចាក់បញ្ចូលនៅផ្នែកខាងក្រោយ  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - លំនាំ ML ដែលអាចប្រើប្រាស់បាននៅផលិតកម្ម

### សូមទាញយកគំរូខាងក្រៅ
- [**ផ្ទាំង AZD Template ផ្លូវការនិងសហគមន៍**](https://azure.github.io/awesome-azd/) - សម្រង់គំរូផ្លូវការនិងសហគមន៍ដែលបានជ្រើសរើស
- [**គំរូ Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - ឯកសារកម្រងគំរូ Microsoft Learn
- [**ថតឧទាហរណ៍**](examples/README.md) - ឧទាហរណ៍ជំនាញក្នុងតំបន់ជាមួយការពន្យល់លម្អិត

---

## 📚 អ្នករៀនប្រភព និងយោង

### យោងរហ័ស
- [**សន្លឹកបញ្ជាការបញ្ជា**](resources/cheat-sheet.md) - ពាក្យបញ្ជា azd សំខាន់ៗតម្រៀបជាតិចំពោះជំពូក
- [**វចនានុក្រម**](resources/glossary.md) - ពាក្យបច្ចេកទេស Azure និង azd  
- [**សំណួរញឹកញាប់**](resources/faq.md) - សំណួរដែលសាកសមតាមជំពូក
- [**មគ្គុទេសក៍សិក្សា**](resources/study-guide.md) - ការប្រកួតប្រាណយ៉ាងទូលំទូលាយ

### សិក្សាផ្ទាល់ខ្លួន
- [**មហោស្រព AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - បង្កើតដំណោះស្រាយ AI មានសមត្ថភាពចែកចាយដោយ AZD (២-៣ ម៉ោង)
- [**វគ្គសិក្សា អន្តរកម្ម**](workshop/README.md) - អនុវត្តន៍ជាមួយ ៨ មើឌុល ដោយ MkDocs និង GitHub Codespaces
  - មើលពី៖ ការបើក → ជ្រើសរើស → ផ្ទៀងផ្ទាត់ → បំបែក → កំណត់រចនាសម្ព័ន្ធ → ការប្តូរតាមការ → បិទ → បញ្ចប់

### ប្រភពរៀននៅខាងក្រៅ
- [ឯកសារសម្រាប់ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [មជ្ឈមណ្ឌលស្ថាបត្យកម្ម Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [មគ្គុទេសក៍តម្លៃ Azure](https://azure.microsoft.com/pricing/calculator/)
- [ស្ថានភាព Azure](https://status.azure.com/)

### ជំនាញភ្នាក់ងារ AI សម្រាប់កម្មវិធីកែសម្រួលរបស់អ្នក
- [**ជំនាញ Microsoft Azure នៅ skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ជំនាញភ្នាក់ងារបើក ៣៧ សម្រាប់ Azure AI, Foundry, ការចែកចាយ, ការវិភាគ, ការប្រើប្រាស់ថ្លៃ និងផ្សេងទៀត។ ដំឡើងពួកវាក្នុង GitHub Copilot, Cursor, Claude Code ឬភ្នាក់ងារដទៃដែលគាំទ្រ៖
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 មគ្គុទេសក៍ដោះស្រាយបញ្ហារហ័ស

**បញ្ហាទូទៅដែលអ្នកចាប់ផ្តើមប្រឈមមុខ និងដំណោះស្រាយរហ័ស៖**

<details>
<summary><strong>❌ "azd: មិនអាចរកបានពាក្យបញ្ជា"</strong></summary>

```bash
# តំឡើង AZD ជាមុនសិន
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ពិនិត្យមើលការតំឡើង
azd version
```
</details>

<details>
<summary><strong>❌ "មិនមានការជាវ" ឬ "មិនបានកំណត់ការជាវ"</strong></summary>

```bash
# បញ្ជីជាវដែលមានស្រាប់
az account list --output table

# កំណត់ជាវលំនាំដើម
az account set --subscription "<subscription-id-or-name>"

# កំណត់សម្រាប់បរិយាកាស AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ពិនិត្យឡើងវិញ
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ឬ "Quota លើសកំណត់"</strong></summary>

```bash
# ព្យាយាមតំបន់ Azure ផ្សេង
azd env set AZURE_LOCATION "westus2"
azd up

# ឬប្រើ SKU តូចជាងក្នុងការអភិវឌ្ឍន៍
# កែសម្រួល infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" បរាជ័យកន្លះផ្លូវ</strong></summary>

```bash
# ជម្រើស 1: សម្អាត និងព្យាយាមម្ដងទៀត
azd down --force --purge
azd up

# ជម្រើស 2: កែសម្រួលគ្រោងសំណង់តែប៉ុណ្ណោះ
azd provision

# ជម្រើស 3: ពិនិត្យស្ថានភាពលម្អិត
azd show

# ជម្រើស 4: ពិនិត្យកំណត់ហេតុក្នុង Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" ឬ "Token ផុតកំណត់"</strong></summary>

```bash
# សរសេរថ្មីសម្រាប់ AZD
azd auth logout
azd auth login

# ជាជម្រើស៖ បន្ទាន់សម័យ Azure CLI ផងប្រសិនបើអ្នកកំពុងរត់ពាក្យបញ្ជា az
az logout
az login

# ពិនិត្យការផ្ទៀងផ្ទាត់ភាពសុពលភាព
az account show
```
</details>

<details>
<summary><strong>❌ "ធនធានមានរួចហើយ" ឬ បញ្ហាឈ្មោះទំរង់</strong></summary>

```bash
# AZD បង្កើតឈ្មោះពិសេស ប៉ុន្តែបើមានបញ្ហាប្រឈម៖
azd down --force --purge

# រួចព្យាយាមម្តងទៀតជាមួយបរិយាកាសថ្មី
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ការចែកចាយគំរូយឺតពេក</strong></summary>

**ពេលរង់ចាំធម្មតា៖**
- កម្មវិធីវេបសាយសាមញ្ញ៖ ៥-១០ នាទី
- កម្មវិធីមានមូលដ្ឋានទិន្នន័យ៖ ១០-១៥ នាទី
- កម្មវិធី AI៖ ១៥-២៥ នាទី (OpenAI provisioning យឺត)

```bash
# ត្រួតពិនិត្យភាពដំណើរការ
azd show

# ប្រសិនបើចាក់សំណាក់ជាង ៣០ នាទី សូមត្រួតពិនិត្យក្រុមហ៊ុន Azure Portal:
azd monitor --overview
# ស្វែងរកការតម្លើងដែលបរាជ័យ
```
</details>

<details>
<summary><strong>❌ "Permission denied" ឬ "ហាមឃាត់"</strong></summary>

```bash
# ពិនិត្យមើលតួនាទី Azure របស់អ្នក
az role assignment list --assignee $(az account show --query user.name -o tsv)

# អ្នកត្រូវការតួនាទី "Contributor" យ៉ាងហោចណាស់
# សូមស្នើអោយអ្នកគ្រប់គ្រង Azure របស់អ្នកផ្តល់សិទ្ធិ៖
# - Contributor (សម្រាប់ធនធាន)
# - ច្រកចូលអ្នកគ្រប់គ្រងអ្នកប្រើ (សម្រាប់ការចាត់តួនាទី)
```
</details>

<details>
<summary><strong>❌ មិនអាចរកឃើញ URL កម្មវិធីដែលបានចែកចាយ</strong></summary>

```bash
# បង្ហាញច្រកសេវាកម្មទាំងអស់
azd show

# ឬបើកព្រួត Azure
azd monitor

# ពិនិត្យសេវាកម្មជាក់លាក់
azd env get-values
# ស្វែងរកអថេរ *_URL
```
</details>

### 📚 ឯកសារពេញលាប់រក្សាបញ្ហា

- **មគ្គុទេសក៍បញ្ហាធម្មតា:** [ដំណោះស្រាយលម្អិត](docs/chapter-07-troubleshooting/common-issues.md)
- **បញ្ហា AI ជាក់លាក់:** [ដោះស្រាយបញ្ហា AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **មគ្គុទេសក៍ Debugging:** [ការ Debugging ជាដំណាក់កាល](docs/chapter-07-troubleshooting/debugging.md)
- **ទទួលជំនួយ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 ការបញ្ចប់វគ្គ និងវិញ្ញាបនបត្រ

### ការតាមដានការរីកចម្រើន
តាមដានការសិក្សារបស់អ្នកតាមជំពូក៖

- [ ] **ជំពូក ១**៖ មូលដ្ឋាន និងចាប់ផ្តើមរហ័ស ✅
- [ ] **ជំពូក ២**៖ អភិវឌ្ឍន៍ AI ជាដំបូង ✅  
- [ ] **ជំពូក ៣**៖ ការកំណត់រចនាសម្ព័ន្ធ និងការផ្ទៀងផ្ទាត់ ✅
- [ ] **ជំពូក ៤**៖ អគ្គិសនីជាកូដ និងការចែកចាយ ✅
- [ ] **ជំពូក ៥**៖ ដំណោះស្រាយ AI អ្នកជំនួយចម្រុះ ✅
- [ ] **ជំពូក ៦**៖ ការផ្ទៀងផ្ទាត់ និងផែនការក្រោយការចែកចាយ ✅
- [ ] **ជំពូក ៧**៖ ដោះស្រាយបញ្ហា និង Debugging ✅
- [ ] **ជំពូក ៨**៖ លំនាំផលិតកម្ម និងអង្គភាព ✅

### ការពិនិត្យការរៀន
បន្ទាប់ពីបញ្ចប់រៀងរាល់ជំពូក សូមត្រួតពិនិត្យចំណេះដឹងរបស់អ្នកដោយ៖
1. **លំហាត់អនុវត្តន៍**៖ បញ្ចប់ការចែកចាយដៃក្នុងជំពូក
2. **ការត្រួតពិនិត្យចំណេះ**៖ ពិនិត្យផ្នែកសំណួរញឹកញាប់សម្រាប់ជំពូករបស់អ្នក
3. **ការពិភាក្សាសហគមន៍**៖ ចែករំលែកបទពិសោធន៍របស់អ្នកនៅ Azure Discord
4. **ជំពូកបន្ទាប់**៖ បន្តទៅកម្រិតកំរិតស្មុគស្មាញបន្ទាប់

### អត្ថប្រយោជន៍ការបញ្ចប់វគ្គ
បន្ទាប់ពីបញ្ចប់រាល់ជំពូក អ្នកនឹងមាន៖
- **បទពិសោធន៍ផលិតកម្ម**៖ កម្មវិធី AI ពិតប្រាកដដែលបានចែកចាយនៅ Azure
- **ជំនាញវិជ្ជាជីវៈ**៖ សមត្ថភាពចែកចាយត្រូវបានរួមបញ្ចូល
- **ការទទួលស្គាល់ពីសហគមន៍**៖ ជាសមាជិកសកម្មនៃសហគមន៍អ្នកអភិវឌ្ឍន៍ Azure
- **ការរីកចម្រើនអាជីព**៖ ជំនាញ AZD និង AI ដដែលត្រូវការជាសាធារណៈ

---

## 🤝 សហគមន៍ និងជំនួយ

### ទទួលបានជំនួយ និងគាំទ្រ
- **បញ្ហាបច្ចេកទេស**៖ [រាយការណ៍កំហុស និងស្នើសុំមុខងារ](https://github.com/microsoft/azd-for-beginners/issues)
- **សំណួររៀន**៖ [សហគមន៍ Discord Microsoft Azure](https://discord.gg/microsoft-azure) និង [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ជំនួយ AI ជាក់លាក់**៖ ចូលរួម [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ឯកសារ**៖ [ឯកសារផ្លូវការរបស់ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ហត្ថពលកម្មសហគមន៍ពី Microsoft Foundry Discord

**លទ្ធផលការបោះឆ្នោតថ្មីៗពីប៉ុស #Azure Channel:**
- **៤៥%** នៃអ្នកអភិវឌ្ឍន៍ចង់ប្រើ AZD សម្រាប់ការងារ AI
- **បញ្ហាធំៗ**៖ ការចែកចាយពហុសេវាកម្ម, ការគ្រប់គ្រងសញ្ញាប័ត្រ, ចំនួនដំណើរការផលិត  
- **សំណើរច្រើន**៖ គំរូជាក់លាក់សម្រាប់ AI, មគ្គុទេសក៍ដោះស្រាយបញ្ហា, វិធីសាស្ត្រល្អៗ

**ចូលរួមសហគមន៍របស់យើងដើម្បីៈ**
- ចែករំលែកបទពិសោធន៍ AZD + AI របស់អ្នក និងទទួលបានជំនួយ
- ទទួលបានមួលរងការពិនិត្យជាមុននៃគំរូ AI ថ្មីៗ
- មានចំណូលចិត្តចូលរួមគ្រប់គ្រងវិធីសាស្ត្រចែកចាយ AI
- មានឥទ្ធិពលលើការអភិវឌ្ឍមុខងារ AI + AZD នៅអនាគត

### ចូលរួមក្នុងការរួមចំណែកវគ្គសិក្សា
យើងសូមស្វាគមន៍ការរួមចំណែក! សូមអាន [មគ្គុទេសក៍ចូលរួម](CONTRIBUTING.md) សម្រាប់ព័ត៌មានលម្អិតពី៖
- **ការកែលម្អមាតិកា**៖ បង្រ្កាបជំពូកនិងឧទាហរណ៍មានស្រាប់
- **ឧទាហរណ៍ថ្មីៗ**៖ បន្ថែមសំរាប់ស្ថានការណ៍ពិតប្រាកដនិងគំរូ  
- **បកប្រែ**៖ ជួយថែរក្សាការគាំទ្រភាសាច្រើន
- **រាយការណ៍កំហុស**៖ កែលម្អភាពត្រឹមត្រូវ និងច្បាស់លាស់
- **វិធីសាស្ត្រ សហគមន៍**៖ អនុវត្តតាមវិធានសហគមន៍រួម

---

## 📄 ព័ត៌មានវគ្គសិក្សា

### លិខិតអាជ្ញាប័ណ្ណ
គម្រោងនេះមានអាជ្ញាប័ណ្ណ MIT - សូមមើលឯកសារ [LICENSE](../../LICENSE) សម្រាប់ព័ត៌មានលម្អិត។

### សម្រង់ Microsoft Learning ទាក់ទង

ក្រុមរបស់យើងបង្កើតវគ្គសិក្សាផ្តល់ការពង្រីកទេសភាពហើយ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ជួរដេក Generative AI
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### ការសិក្សាគ្រឹះ
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ស៊េរី Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ការរុករកវគ្គសិក្សា

**🚀 ត្រៀមខ្លួនរៀនហើយឬនៅ?**

**អ្នកចាប់ផ្ដើម**: ចាប់ផ្ដើមជាមួយ [ជំពូក 1៖ មូលដ្ឋាន និង ចាប់ផ្ដើមរហ័ស](#-chapter-1-foundation--quick-start)  
**អ្នកអភិវឌ្ឍ AI**: ទល់​ទៅ [ជំពូក 2៖ អភិវឌ្ឍន៍មុខងារ AI ជាមុន](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**អ្នកអភិវឌ្ឍមានបទពិសោធន៍**: ចាប់ផ្ដើមជាមួយ [ជំពូក 3៖ ការកំណត់រចនាសម្ព័ន្ធ & ការផ្ទៀងផ្ទាត់](#️-chapter-3-configuration--authentication)

**ជំហានបន្ទាប់**: [ចាប់ផ្ដើមជំពូក 1 - មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
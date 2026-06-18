# AZD សម្រាប់អ្នកចាប់ផ្តើម៖ ដំណើរការសិក្សាតាមរចនាសម្ព័ន្ធ

![AZD សម្រាប់អ្នកចាប់ផ្តើម](../../translated_images/km/azdbeginners.5527441dd9f74068.webp) 

[![អ្នកតាមដាន GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![ចម្លែក GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![ផ្កាយ GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord របស់ Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord របស់ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ការបកប្រែដោយស្វ័យប្រវត្តិ (តែងតែទាន់សម័យ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[អារ៉ាប៊ី](../ar/README.md) | [បង់ក្លា](../bn/README.md) | [ប៊ុល្ហារីយ៉ា](../bg/README.md) | [ភាសាបឺម៉ា (មីយ៉ាន់ម៉ា)](../my/README.md) | [ចិន (ទម្រង់សាមញ្ញ)](../zh-CN/README.md) | [ចិន (ប្រពៃណី, ហុងកុង)](../zh-HK/README.md) | [ចិន (ប្រពៃណី, ម៉ាកាស៊ី)](../zh-MO/README.md) | [ចិន (ប្រពៃណី, តៃវ៉ាន់)](../zh-TW/README.md) | [ក្រូអាត](../hr/README.md) | [ឈេក](../cs/README.md) | [ដាណمار्क](../da/README.md) | [ហូឡង់](../nl/README.md) | [អេស្តូនី](../et/README.md) | [ហ្វាំងឡង់](../fi/README.md) | [បារាំង](../fr/README.md) | [អាឡឺម៉ង់](../de/README.md) | [ក្រិក](../el/README.md) | [ហេប្រ៊ូ](../he/README.md) | [ហិណ្ឌី](../hi/README.md) | [ហុងគារី](../hu/README.md) | [ឥណ្ឌូណេស៊ី](../id/README.md) | [អ៊ីតាលី](../it/README.md) | [ជប៉ុន](../ja/README.md) | [កណាណដា](../kn/README.md) | [ខ្មែរ](./README.md) | [កូរ៉េ](../ko/README.md) | [លីទុយអានី](../lt/README.md) | [ម៉ាឡេ](../ms/README.md) | [ម៉ាឡាឡាំ](../ml/README.md) | [ម៉ារាថី](../mr/README.md) | [នេពាល](../ne/README.md) | [ភីជិន (នាយ៉េរីយ៉ា)](../pcm/README.md) | [ន័រវែស](../no/README.md) | [ភាសាហ្វាស៊ី (ភារ៉្ស៊ី)](../fa/README.md) | [ប៉ូឡូញ](../pl/README.md) | [ព័រទុយហ្គាល់ (ប្រេស៊ីល)](../pt-BR/README.md) | [ព័រទុយហ្គាល់ (ព័រទុយហ្គាល់)](../pt-PT/README.md) | [ភាសាព៊ុនជាបី (Gurmukhi)](../pa/README.md) | [រូម៉ានី](../ro/README.md) | [រុស្ស៊ី](../ru/README.md) | [ស៊ែបៀន (ស៊ីរីលិក)](../sr/README.md) | [ស្លូវ៉ាក់](../sk/README.md) | [ស្លូវេនី](../sl/README.md) | [ស្ប៉ាញ](../es/README.md) | [ស្វាហ៊ីលី](../sw/README.md) | [ស៊្វីដិន](../sv/README.md) | [តាហ្គាឡុក (ហ្វីលីពីន)](../tl/README.md) | [តាមិល](../ta/README.md) | [ទេឡេគូ](../te/README.md) | [ថៃ](../th/README.md) | [តួរគី](../tr/README.md) | [អ៊ុយក្រែន](../uk/README.md) | [យូរឌូ](../ur/README.md) | [វៀតណាម](../vi/README.md)

> **ចូលចិត្តចម្លងកូដក្នុងកុំព្យូទ័ររបស់អ្នក?**
>
> ឃ្លាំងកូដនេះមានការបកប្រែជាភាសា 50+ ដែលធ្វើឱ្យទំហំការទាញយកត្រូវបានពង្រីកយ៉ាងខ្លាំង។ ដើម្បី clone ដោយគ្មានការបកប្រែ សូមប្រើ sparse checkout:
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
> វានឹងផ្តល់អ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវការដើម្បីបញ្ចប់មេរៀននេះជាមួយការទាញយកដែលលឿនជាង។

<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 មានអ្វីថ្មីនៅក្នុង azd ថ្ងៃនេះ

> 📌 មេរៀននេះត្រូវបានផ្ទៀងផ្ទាត់ជាមួយ **`azd 1.25.6`** (មិថុនា 2026)។ ប្រតិបត្តិ `azd version` ដើម្បីពិនិត្យកំណែរបស់អ្នក ហើយ `azd upgrade` ដើម្បីទទួលបានកំណែថ្មីបំផុត។

Azure Developer CLI បានពង្រីកលើសពីកម្មវិធីវេបសាយ និង API ទីផ្សារ។ នៅថ្ងៃនេះ azd ជាឧបករណ៍តែមួយសម្រាប់បង្ហោះកម្មវិធីណាមួយទៅ Azure — រួមទាំងកម្មវិធីដែលមានថាមពល AI និងភ្នាក់ងារប្រាជ្ញា។

នេះជាអ្វីដែលមានន័យសម្រាប់អ្នក៖

- **ភ្នាក់ងារជាថ្នាក់ដំបូងក្នុង azd workloads។** អ្នកអាចចាប់ផ្ដើម បង្ហោះ និងគ្រប់គ្រងគម្រោងភ្នាក់ងារ AI ដោយប្រើ workflow ផ្ទេរដូចគ្នា `azd init` → `azd up` ដែលអ្នកបានស្គាល់រួច។
- **ជីវិតលifecycle ភ្នាក់ងារពេញលេញពី CLI។** ពង្រឹងផ្នែក `azure.ai.agents` ឥឡូវនេះគ្របដណ្តប់ដំណើរការទាំងមូល — `azd ai agent init` សម្រាប់ scaffold, `azd ai agent invoke` សម្រាប់សាកល្បង (ជាមួយលទ្ធផលពេលវេលាស្នាមចេញ), `azd ai agent eval generate` និង `azd ai agent optimize` សម្រាប់វាស់ និងបង្កើនគុណភាព, និង `azd ai agent delete` សម្រាប់សម្អាត។
- **ប្លុកសាងសង់ AI ច្រើនទៀត។** កម្មវិធីបន្ថែម-preview ថ្មីៗ — `azure.ai.skills` និង `azure.ai.connections` — អនុញ្ញាតឱ្យអ្នកគ្រប់គ្រងជំនាញភ្នាក់ងារដែលអាច reused និងការតភ្ជាប់ Foundry ដោយផ្ទាល់ជាមួយ azd។
- **ការរួមបញ្ចូល Microsoft Foundry** ទាញយកការបង្ហោះម៉ូដែល ការផ្តល់សេវាផ្ទុកភ្នាក់ងារ និងការកំណត់សេវា AI ចូលទៅក្នុងប្រព័ន្ធពុម្ពទំរង់ azd។
- **ការងារប្រចាំថ្ងៃរលូនជាងមុន។** បញ្ចេញថ្មីៗធ្វើឱ្យ `azd init` មានលក្ខណៈ idempotent (សុវត្ថិភាពក្នុងការរត់ម្ដងទៀត), ធ្វើឱ្យ `azd auth login` សម្អាត token បុរាណដោយស្វ័យប្រវត្តិ, និងបន្ថែមពេលដំណើរការដំបូងរបស់ `azd tool` ដែលលើកទឹកចិត្តអ្នក។
- **workflow មូលដ្ឋានមិនបានផ្លាស់ប្តូរ។** មិនថាអ្នកកំពុងបង្ហោះកម្មវិធី todo, សេវាម៉ាយក្រូ, ឬដំណោះស្រាយ AI ជាច្រើនភ្នាក់ងារ ការបញ្ជារនៅតែដូចគ្នា។

> **កំណត់សម្គាល់សម្រាប់អ្នកប្រើ Aspire:** Microsoft ឥឡូវនេះយោងឈ្មោះផលិតផលថា **Aspire** (ដែល​កន្លងមក​ឈ្មោះ​ជា ".NET Aspire")។ ការគាំទ្រ Aspire របស់ azd មិនបានផ្លាស់ប្តូរ—គ្រាន់តែឈ្មោះត្រូវបានប្តូរ។

បើអ្នកបានប្រើ azd មុននេះ រួមគ្នាជំនួយ AI គឺជាការពង្រឹងធម្មជាតិ—មិនមែនជា​ឧបករណ៍ដាច់ផ្សេង ឬបណ្តាញវគ្គជំនាញខ្ពស់ទេ។ បើអ្នកចាប់ផ្តើមពីសុទិដ្ឋិនិយម អ្នកនឹងរៀន workflow តែមួយដែលធ្វើការសម្រាប់អ្វីគ្រប់យ៉ាង។

---

## 🚀 តើ Azure Developer CLI (azd) ជាអ្វី?

**Azure Developer CLI (azd)** គឺជាឧបករណ៍បន្ទាត់បញ្ជាដែលមិត្តភាពសម្រាប់អ្នកអភិវឌ្ឍន៍ ដែលធ្វើឱ្យវាងាយស្រួលក្នុងការបង្ហោះកម្មវិធីទៅ Azure។ ជំនួសការបង្កើត និងភ្ជាប់ធនធាន Azure ជាច្រើនដោយដៃ អ្នកអាចបង្ហោះកម្មវិធីទាំងមូលដោយបញ្ជា​ដង​តែមួយ។

### ភាពអស្ចារ្យនៃ `azd up`

```bash
# ពាក្យបញ្ជាដូចនេះបញ្ចប់រឿងទាំងអស់:
# ✅ បង្កើតធនធាន Azure ទាំងអស់
# ✅ កំណត់បណ្ដាញ និងសុវត្ថិភាព
# ✅ សាងសង់កូដកម្មវិធីរបស់អ្នក
# ✅ តំឡើងទៅ Azure
# ✅ ផ្តល់ URL ដែលអាចប្រើបានដោយសកម្ម
azd up
```

**ប៉ុណ្ណោះហើយ!** គ្មានការចុចក្នុង Azure Portal, គ្មាន templates ARM ដែលស្មុគស្មាញដែលត្រូវរៀនមុន, គ្មានការកំណត់ដោយដៃ - គ្រាន់តែកម្មវិធីដំណើរការលើ Azure។

---

## ❓ Azure Developer CLI និង Azure CLI: ផ្សេងគ្នាយ៉ាងដូចម្តេច?

នេះជាសំណួរដែលអ្នកចាប់ផ្តើមសួរញឹកញាប់បំផុត។ នេះជាចម្លើយសាមញ្ញ៖

| មុខងារ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **គោលបំណង** | គ្រប់គ្រងធនធាន Azure តែមួយៗ | បង្ហោះកម្មវិធីទាំងមូល |
| **គំនិត** | គោលបំណងផ្នែករចនាសម្ព័ន្ធ (Infrastructure-focused) | ផ្ដោតលើកម្មវិធី (Application-focused) |
| **ឧទាហរណ៍** | `az webapp create --name myapp...` | `azd up` |
| **ការរៀន** | ត្រូវអះអាងចំណេះដឹងអំពីសេវាកម្ម Azure | គ្រាន់តែស្គាល់កម្មវិធីរបស់អ្នក |
| **ល្អសម្រាប់** | DevOps, រចនាសម្ព័ន្ធ | អ្នកអភិវឌ្ឍន៍, ការបង្កើតគំរូលឿន |

### ការប្រៀបធៀបសាមញ្ញ

- **Azure CLI** គឺដូចជាការមានឧបករណ៍ទាំងអស់សម្រាប់សាងសង់ផ្ទះ - ឆ្នូត ដែក កាំមេ, ដាច់។ អ្នកអាចសាងសង់អ្វីគ្រប់យ៉ាងបាន ប៉ុន្តែអ្នកត្រូវចេះការសាងសង់។
- **Azure Developer CLI** គឺដូចជាការជួលអ្នកកសាង - អ្នកពិពណ៌នាអ្វីដែលអ្នកចង់បាន ហើយពួកគេចាត់ទុកការសំណង់ទាំងអស់។

### ពេលណាគួរប្រើនីមួយៗ

| ស្ថានភាព | ប្រើនេះ |
|----------|----------|
| "ខ្ញុំចង់បង្គុំនិងបង្ហោះកម្មវិធីវេបរបស់ខ្ញុំឡើងយ៉ាងលឿន" | `azd up` |
| "ខ្ញុំត្រូវបង្កើតគណនីផ្ទុកទិន្នន័យតែម្ដង" | `az storage account create` |
| "ខ្ញុំកំពុងសាងសង់កម្មវិធី AI ពេញលេញ" | `azd init --template azure-search-openai-demo` |
| "ខ្ញុំត្រូវ debug ធនធាន Azure ជាក់លាក់" | `az resource show` |
| "ខ្ញុំចង់បានការបង្ហោះសមរម្យសម្រាប់ផលិតកម្មក្នុងមិនាទី" | `azd up --environment production` |

### ពួកវាធ្វើការជាមួយគ្នា!

AZD ប្រើ Azure CLI ខាងក្រោម។ អ្នកអាចប្រើទាំងពីរ:
```bash
# ដាក់ពាណិជ្ជកម្មកម្មវិធីរបស់អ្នកជាមួយ AZD
azd up

# បន្ទាប់មកកំណត់ធាតុពិសេសជាមួយ Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ស្វែងរកគំរូនៅក្នុង Awesome AZD

កុំចាប់ផ្តើមពីស្ដាតч! **Awesome AZD** គឺជាការប្រមូលផ្តុំសហគមន៍នៃគំរូដែលរួចរាល់សម្រាប់បង្ហោះ៖

| ធនធាន | ពណ៌នា |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ស្វែងរកគំរូចំនួន 200+ និងបង្ហោះដោយចុចមួយលើក |
| 🔗 [**ដាក់ស្នើគំរូ**](https://github.com/Azure/awesome-azd/issues) | ធ្វើការរួមចំណែកគំរូរបស់អ្នកទៅកាន់សហគមន៍ |
| 🔗 [**គណនី GitHub**](https://github.com/Azure/awesome-azd) | ផ្កាយ និងស្វែងរកកូដដើម |

### គំរូ AI ឆាប់ពេញនិយមពី Awesome AZD

```bash
# ជជែក RAG ជាមួយម៉ូដែល Microsoft Foundry + ស្វែងរក AI
azd init --template azure-search-openai-demo

# កម្មវិធីជជែក AI លឿន
azd init --template openai-chat-app-quickstart

# អ្នកប្រតិបត្តិ AI ជាមួយ Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 ចាប់ផ្តើមក្នុង 3 ជំហាន

មុននឹងអ្នកចាប់ផ្តើម សូមប្រាកដថា ម៉ាស៊ីនរបស់អ្នកបានស្រៀវសម្រាប់គំរូដែលអ្នកចង់បង្ហោះ៖

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ប្រសិនបើការត្រួតពិនិត្យណាមួយបរាជ័យ សូមកំណត់ត្រូវនោះជាមុន ហើយបន្តទៅកាន់ quick start។

### ជំហានទី 1: តំឡើង AZD (2 នាទី)

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

### ជំហានទី 2: Authenticate សម្រាប់ AZD

```bash
# ជាជម្រើសបើអ្នកមានផែនការប្រើប្រាស់ពាក្យបញ្ជា Azure CLI ដោយផ្ទាល់ក្នុងវគ្គសិក្សានេះ
az login

# ត្រូវការសម្រាប់សកម្មភាព AZD
azd auth login
```

ប្រសិនបើអ្នកមិនប្រាកដថាអ្វីដែលអ្នកត្រូវការ សូមអនុវត្តចរន្តការតំឡើងពេញលេញនៅក្នុង [ការដំឡើង និងការកំណត់](docs/chapter-01-foundation/installation.md#authentication-setup)។

### ជំហានទី 3: បង្ហោះកម្មវិធីដំបូងរបស់អ្នក

```bash
# ចាប់ផ្តើមពីគំរូមួយ
azd init --template todo-nodejs-mongo

# ដាក់បញ្ចូលទៅ Azure (បង្កើតអ្វីគ្រប់យ៉ាង!)
azd up
```

**🎉 រួចហើយ!** កម្មវិធីរបស់អ្នកឥឡូវមាននៅលើ Azure។

### សម្អាត (កុំភ្លេច!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 របៀបប្រើមេរៀននេះ

មេរៀននេះត្រូវបានរចនាឡើងសម្រាប់ការសិក្សាដោយដំណាក់កាល - ចាប់ពីកម្រិតដែលអ្នកមានសុវត្ថិភាព ហើយធ្វើដំណើរឡើង៖

| ប្រវត្តិរូបអ្នក | ចាប់ផ្តើមនៅទីនេះ |
|-----------------|------------|
| **ថ្មីមួយទាំងស្រុងចំពោះ Azure** | [ជំពូក 1: មូលដ្ឋាន](#-chapter-1-foundation--quick-start) |
| **ស្គាល់ Azure ប៉ុន្តែមិនស្គាល់ AZD** | [ជំពូក 1: មូលដ្ឋាន](#-chapter-1-foundation--quick-start) |
| **ចង់បង្ហោះកម្មវិធី AI** | [ជំពូក 2: អភិវឌ្ឍន៍ផ្តើមពី AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ចង់មានការអនុវត្តដោយដៃ** | [🎓 ក្លាសបណ្ដុះបណ្ដាលអន្តរកម្ម](workshop/README.md) - ការពិសោធន៍ដឹកនាំ 3-4 ម៉ោង |
| **ត្រូវការទម្រង់ផលិតកម្ម** | [ជំពូក 8: ផលិតកម្ម និង ឧស្សាហកម្ម](#-chapter-8-production--enterprise-patterns) |

### ការកំណត់រហ័ស

1. **Fork ឃ្លាំងកូដនេះ**: [![ចម្លែក GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone វា**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ស្វែងយល់ជំនួយ**: [សហគមន៍ Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **ចូលចិត្តចម្លងកូដក្នុងកុំព្យូទ័ររបស់អ្នក?**
>
> ឃ្លាំងកូដនេះមានការបកប្រែជាភាសា 50+ ដែលធ្វើឱ្យទំហំការទាញយកត្រូវបានពង្រីកយ៉ាងខ្លាំង។ ដើម្បី clone ដោយគ្មានការបកប្រែ សូមប្រើ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> វានឹងផ្តល់អ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវការដើម្បីបញ្ចប់មេរៀននេះជាមួយការទាញយកដែលលឿនជាង។

## សេចក្តីសង្ខេបនៃមេរៀន

យល់ដឹង Azure Developer CLI (azd) តាមរយៈជំពូកដែលបានរៀបចំសម្រាប់ការសិក្សាដោយដំណាក់កាល។ **ផ្ដោតសំខាន់លើការបង្ហោះកម្មវិធី AI ជាមួយនឹងការរួមបញ្ចូល Microsoft Foundry។**
### ហេតុអ្វីបានជា វគ្គនេះមានសារៈសំខាន់សម្រាប់អ្នកអភិវឌ្ឍសម័យទំនើប

ដោយផ្អែកលើការយល់ដឹងពីសហគមន៍ Microsoft Foundry Discord, **45% នៃអ្នកអភិវឌ្ឍចង់ប្រើ AZD សម្រាប់បំណែកកិច្ចការ AI** ប៉ុន្តែប្រឈមមុខនឹងបញ្ហា៖
- ស្ថាបត្យកម្ម AI ច្រើនសេវាកម្មពីស្មុគស្មាញ
- វិធីសាស្ត្រល្អបំផុតសម្រាប់ដាក់បញ្ចូល AI ទៅផលិតកម្ម  
- ការបញ្ចូល និង ការកំណត់កុងហ្វីហ្គូរតារ Azure AI service
- ផលបូកបង្កើនការប្រាក់សម្រាប់បំណែកកិច្ចការ AI
- រៀបចំបញ្ហាចែកចាយពាក់ព័ន្ធនឹងការដាក់បញ្ចូល AI

### គោលបំណងការសិក្សា

ដោយបញ្ចប់វគ្គមានរចនាសម្ព័ន្ធនេះ អ្នកនឹងអាច៖
- **អាចជំនាញមូលដ្ឋាន AZD**: គន្លឹះស្នូល, ការ​ដំឡើង, និង ការកំណត់កុងហ្វីហ្គូរ
- **ដាក់បញ្ចូលកម្មវិធី AI**: ប្រើ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **អនុវត្ត បរិឆ្ឆាញជា កូដ (Infrastructure as Code)**: គ្រប់គ្រងធនធាន Azure ជាមួយពាក្យប័ណ្ណ Bicep
- **ដោះស្រាយបញ្ហាក្នុងការដាក់បញ្ចូល**: ជួសជុលបញ្ហាទូទៅ និង ដែកប៊កកំហុស
- **អុ៉បទីម៉ាទម្រាប់ផលិតកម្ម**: សុវត្ថិភាព, ការពង្រីក, ការត្រួតពិនិត្យ, និង ការគ្រប់គ្រងគិតថ្លៃ
- **សាងសង់ដំណោះស្រាយ Multi-Agent**: ដាក់បញ្ចូលស្ថាបត្យកម្ម AI ស្មុគស្មាញ

## មុននឹងអ្នកចាប់ផ្តើម៖ គណនី, ការចូលដំណើរការ, និង អនុស្សាវរីយ៍

មុនពេលអ្នកចាប់ផ្តើមជំពូក 1 សូមប្រាកដថាអ្នកមានអ្វីខ្លះដូចខាងក្រោម។ ជំហានដំឡើងនៅពេលក្រោយក្នុងមាគ៌ានេះ សន្មតថាធាតុនិម្មិតទាំងនេះបានត្រូវបានរៀបចំរួចហើយ។

- **បណ្ណសភាគ Azure**: អ្នកអាចប្រើបណ្ណសភាគដែលមានស្រាប់ពីការងារ ឬគណនីផ្ទាល់ខ្លួន រឺបង្កើត [free trial](https://aka.ms/azurefreetrial) ដើម្បីចាប់ផ្តើម។
- **សិទ្ធិបង្កើតធនធាន Azure**: សម្រាប់ហាត់ប្រាណភាគច្រើន អ្នកគួរតែមានសិទ្ធិយ៉ាងហោចណាស់ **Contributor** លើបណ្ណសភាគឬក្រុមធនធានដែលត្រូវផ្តោត។ ជំពូកខ្លះអាចសន្មតថាអ្នកអាចបង្កើតក្រុមធនធាន, managed identities, និង ការបែងចែក RBAC បានផងដែរ។
- [**គណនី GitHub**](https://github.com): វាមានប្រយោជន៍សម្រាប់ fork រ៉េបូ, តាមដានការផ្លាស់ប្តូរផ្ទាល់ខ្លួនរបស់អ្នក, និង ប្រើ GitHub Codespaces សម្រាប់សិក្ខាសាលា។
- **មុខងាររត់ពេល Template ត្រូវការ**: Template ជាក់លាក់ខ្លះត្រូវការឧបករណ៍ក្នុងម៉ាស៊ីនដូចជា Node.js, Python, Java, ឬ Docker។ រត់កម្មវិធីត្រួតពិនិត្យការតំឡើងមុនពេលចាប់ផ្តើម ដើម្បីចាប់ចំណុចឧបករណ៍ខ្វះឆាប់ៗ។
- **ស្គាល់ប៉ុន្មានពាក្យនៃ terminal**: អ្នកមិនចាំបាច់ជាអ្នកជំនាញទេ ប៉ុន្តែគួរតែរួចរាល់ក្នុងការរត់កមង់ដូចជា `git clone`, `azd auth login`, និង `azd up`។

> **កំពុងធ្វើការនៅក្នុងបណ្ណសភាគសហគ្រាស?**
> ប្រសិនបើបរិបទ Azure របស់អ្នកត្រូវបានគ្រប់គ្រងដោយអ្នកគ្រប់គ្រង សូមបញ្ជាក់មុនពេលថាអ្នកអាចដាក់ធនធានក្នុងបណ្ណសភាគឬក្រុមធនធានដែលអ្នកគ្រោងប្រើ។ ប្រសិនបើមិនអាចសូមស្នើសុំបណ្ណសភាគ sandbox ឬសិទ្ធិ Contributor មុនចាប់ផ្តើម។

> **ថ្មីចំពេលចំពោះ Azure?**
> ចាប់ផ្តើមជាមួយសាកល្បង Azure ឬ subscription pay-as-you-go ផ្ទាល់ខ្លួននៅ https://aka.ms/azurefreetrial ដើម្បីអោយអ្នកអាចបញ្ចប់លំហាត់ពីដើមដល់ចប់ដោយគ្មានការរង់ចាំការអនុម័តកម្រិត tenant ។

## 🗺️ ផែនទីវគ្គសិក្សា៖ នាវាវាយឆាប់តាមជំពូក

ជំពូកនីមួយៗមាន README ផ្ទាល់ខ្លួនដែលមានគោលបំណងការសិក្សា, Quick Starts, និងលំហាត់៖

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: មូលដ្ឋាន](docs/chapter-01-foundation/README.md)** | ការចាប់ផ្តើម | [មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [ការដំឡើង](docs/chapter-01-foundation/installation.md) &#124; [គម្រោងដំបូង](docs/chapter-01-foundation/first-project.md) | 30-45 នាទី | ⭐ |
| **[Ch 2: អភិវឌ្ឍន៍ AI](docs/chapter-02-ai-development/README.md)** | កម្មវិធីផ្តោតលើ AI | [ការរួមបញ្ចូល Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [ភ្នាក់ងារជា AI](docs/chapter-02-ai-development/agents.md) &#124; [ការដាក់ម៉ូដែល](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [សិក្ខាសាលា](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ម៉ោង | ⭐⭐ |
| **[Ch 3: ការកំណត់កុងហ្វីហ្គូរ](docs/chapter-03-configuration/README.md)** | ការផ្ទៀងផ្ទាត់ និង សុវត្ថិភាព | [ការកំណត់កុងហ្វីហ្គូរ](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 នាទី | ⭐⭐ |
| **[Ch 4: រចនាសម្ព័ន្ធ](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [មគ្គុទេសក៍ដាក់បញ្ចូល](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ម៉ោង | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | ដំណោះស្រាយភ្នាក់ងារ AI | [ស្ថានភាពលក់រាយ](examples/retail-scenario.md) &#124; [លំនាំសមមុខប្រតិបត្តិការ](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ម៉ោង | ⭐⭐⭐⭐ |
| **[Ch 6: មុនការដាក់បញ្ចូល](docs/chapter-06-pre-deployment/README.md)** | ការរៀបចំ និង ត្រួតពិនិត្យ | [ត្រួតពិនិត្យមុនហោះ](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [គម្រោងសមត្ថភាព](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [ជ្រើសរើស SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ម៉ោង | ⭐⭐ |
| **[Ch 7: រៀបចំសំណួរ](docs/chapter-07-troubleshooting/README.md)** | ដោះស្រាយ & កែតម្រូវ | [បញ្ហាទូទៅ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ដាក់ដែកប៊ក](docs/chapter-07-troubleshooting/debugging.md) &#124; [បញ្ហា AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ម៉ោង | ⭐⭐ |
| **[Ch 8: ផលិតកម្ម](docs/chapter-08-production/README.md)** | លំនាំសម្រាប់សហគ្រាស | [អនុវត្តប្រព័ន្ធផលិតកម្ម AI](docs/chapter-08-production/production-ai-practices.md) | 2-3 ម៉ោង | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | លំហាត់​ដោយដៃ | [សេចក្តីផ្តើម](workshop/docs/instructions/0-Introduction.md) &#124; [ជ្រើសរើស](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ត្រួតពិនិត្យ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [បំបែក](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [កំណត់កុងហ្វីហ្គូរ](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [ប្ដូរតម្រូវការ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [រំលាយ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [ស្មាធិ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ម៉ោង | ⭐⭐ |

**រយៈពេលសរុបនៃវគ្គសិក្សា:** ~10-14 ម៉ោង | **ការ​កើន​ដំណាក់កាលជំនាញ:** កម្រិតដំបូង → ទទួលបានសមត្ថភាពទៅផលិតកម្ម

---

## 📚 ជំពូកសិក្សា

*ជ្រើសផ្លូវសិក្សារបស់អ្នកដោយផ្អែកលើកម្រិតបទពិសោធន៍ និងគោលដៅ*

### 🚀 ជំពូក 1: មូលដ្ឋាន និង ចាប់ផ្តើមរហ័ស
**លក្ខខណ្ឌជាមុន**: subscription Azure, ចំណេះដឹងមូលដ្ឋាននៃបន្ទាត់ពាក្យបញ្ជា  
**រយៈពេល**: 30-45នាទី  
**កំរិតភាពស្មុគស្មាញ**: ⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការយល់ដឹងអំពីមូលដ្ឋាន Azure Developer CLI
- ការដំឡើង AZD លើវេទិការបស់អ្នក
- ការដាក់បញ្ចូលជាលើកដំបូងបានជោគជ័យ

#### ប្រភពសិក្សា
- **🎯 ចាប់ផ្តើមទីនេះ**: [Azure Developer CLI ជាអ្វី?](#what-is-azure-developer-cli)
- **📖 ទ្រឹស្តី**: [មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) - គល់គំនិតស្នូល និង ពាក្យដឹង
- **⚙️ ការតំឡើង**: [ការដំឡើង និង ការកំណត់](docs/chapter-01-foundation/installation.md) - មគ្គុទេសក៍លើវេទិកាតាក់តែង
- **🛠️ လက်​អនុវត្ត**: [គម្រោងដំបូងរបស់អ្នក](docs/chapter-01-foundation/first-project.md) - មគ្គុទេសក៍ជំហាន​ដល់ជំហាន
- **📋 ឯកសារយោងឆ្អឹងរហ័ស**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### លំហាត់អនុវត្ត
```bash
# ពិនិត្យការដំឡើងយ៉ាងឆាប់រហ័ស
azd version

# ដាក់ឱ្យដំណើរការ កម្មវិធីដំបូងរបស់អ្នក
azd init --template todo-nodejs-mongo
azd up
```

**💡 លទ្ធផលជំពូក**: ដាក់បញ្ចូលកម្មវិធីវែបសាមញ្ញមួយទៅ Azure បានដោយជោគជ័យ ដោយប្រើ AZD

**✅ ការផ្ទៀងផ្ទាត់ជោគជ័យ:**
```bash
# បន្ទាប់ពីបញ្ចប់ ជំពូក 1 អ្នកគួរតែអាច:
azd version              # បង្ហាញកំណែដែលបានដំឡើង
azd init --template todo-nodejs-mongo  # ចាប់ផ្តើមគម្រោង
azd up                  # ដាក់ចេញទៅ Azure
azd show                # បង្ហាញ URL របស់កម្មវិធីដែលកំពុងដំណើរការ
# កម្មវិធីបើកនៅក្នុងកម្មវិធីរុករក ហើយដំណើរការ
azd down --force --purge  # សម្អាតធនធាន
```

**📊 វេលាដែលត្រូវចំណាយ:** 30-45 នាទី  
**📈 កម្រិតជំនាញបន្ទាប់ពីនេះ:** អាចដាក់បញ្ចូលកម្មវិធីមូលដ្ឋានបានដោយឯករាជ្យ  
**📈 កម្រិតជំនាញបន្ទាប់ពីនេះ:** អាចដាក់បញ្ចូលកម្មវិធីមូលដ្ឋានបានដោយឯករាជ្យ

---

### 🤖 ជំពូក 2: ការអភិវឌ្ឍន៍ផ្តោតលើ AI (ផ្តល់អនុសាសន៍សម្រាប់អ្នកអភិវឌ្ឍ AI)
**លក្ខខណ្ឌជាមុន**: ជំពូក 1 បានបញ្ចប់  
**រយៈពេល**: 1-2 ម៉ោង  
**កំរិតភាពស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការរួមបញ្ចូល Microsoft Foundry ជាមួយ AZD
- ដាក់បញ្ចូលកម្មវិធីដែលប្រើថាមពល AI
- ការយល់ដឹងអំពីការកំណត់កុងហ្វីហ្គូរបស់សេវាកម្ម AI

#### ប្រភពសិក្សា
- **🎯 ចាប់ផ្តើមទីនេះ**: [ការរួមបញ្ចូល Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 ភ្នាក់ងារ AI**: [មគ្គុទេសក៍ភ្នាក់ងារ AI](docs/chapter-02-ai-development/agents.md) - ដាក់ភ្នាក់ងារដែលមានបញ្ញាជាមួយ AZD
- **📖 លំនាំ**: [ការដាក់ម៉ូដែល AI](docs/chapter-02-ai-development/ai-model-deployment.md) - ដាក់ និង គ្រប់គ្រងម៉ូដែល AI
- **🛠️ សិក្ខាសាលា**: [មាតិកាសិក្ខាសាលា AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ធ្វើឱ្យដំណោះស្រាយ AI របស់អ្នកសមរម្យជាមួយ AZD
- **🎥 មគ្គុទេសក៍អន្ដរកម្ម**: [សម្ភារៈសិក្ខាសាលា](workshop/README.md) - ការសិក្សាតាមកម្មវិធីរុករកជាមួយ MkDocs * DevContainer Environment
- **📋 គំរូ**: [ទំព័រគំរូ Microsoft Foundry](#ធនធានវគ្គហ្វឹកហាត់)
- **📝 ឧទាហរណ៍**: [ឧទាហរណ៍ដាក់បញ្ចូល AZD](examples/README.md)

#### លំហាត់អនុវត្ត
```bash
# ដាក់ប្រើកម្មវិធី AI ដំបូងរបស់អ្នក
azd init --template azure-search-openai-demo
azd up

# សាកល្បងទំរង់ AI បន្ថែម
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 លទ្ធផលជំពូក**: ដាក់បញ្ចូល និង កំណត់កុងហ្វីហ្គូរនូវកម្មវិធីជជែកដែលប្រើអំណាន AI ជាមួយសមត្ថភាព RAG

**✅ ការផ្ទៀងផ្ទាត់ជោគជ័យ:**
```bash
# បន្ទាប់ពីជំពូកទី ២ អ្នកគួរតែអាច:
azd init --template azure-search-openai-demo
azd up
# សាកល្បងចំណុចប្រទាក់ជជែកដោយបញ្ញាសិប្បនិម្មិត
# សួរសំណួរ និងទទួលបានចម្លើយដែលបញ្ញាសិប្បនិម្មិតផ្តល់ជាមួយប្រភព
# ផ្ទៀងផ្ទាត់ថាការរួមបញ្ចូលការស្វែងរកដំណើរការបាន
azd monitor  # ពិនិត្យថា Application Insights បង្ហាញទិន្នន័យតេលីម៉ែត្រី
azd down --force --purge
```

**📊 វេលាដែលត្រូវចំណាយ:** 1-2 ម៉ោង  
**📈 កម្រិតជំនាញបន្ទាប់ពីនេះ:** អាចដាក់ និងកំណត់កុងហ្វីហ្គូរកម្មវិធី AI ដែលរួចរួមសម្រាប់ផលិតកម្មបាន  
**💰 ការយកចិត្តទុកដាក់ចំណាយ:** យល់ពីចំណាយ $80-150/ខែ សម្រាប់បរិយាកាសអភិវឌ្ឍ និង $300-3500/ខែ សម្រាប់ផលិតកម្ម

#### 💰 ការពិចារណាផ្នែកចំណាយសម្រាប់ការដាក់បញ្ចូល AI

**បរិយាកាសអភិវឌ្ឍ (ប្រហាក់ប្រហែល $80-150/ខែ):**
- Microsoft Foundry Models (បង់តាមការប្រើប្រាស់): $0-50/ខែ (ផ្អែកលើការប្រើ token)
- AI Search (កម្រិត Basic): $75/ខែ
- Container Apps (Consumption): $0-20/ខែ
- Storage (Standard): $1-5/ខែ

**បរិយាកាសផលិតកម្ម (ប្រហាក់ប្រហែល $300-3,500+/ខែ):**
- Microsoft Foundry Models (PTU សម្រាប់សមត្ថភាពនិយមថេរ): $3,000+/ខែ ឬ បង់តាមការប្រើប្រាស់នៅកម្រិតខ្ពស់
- AI Search (កម្រិត Standard): $250/ខែ
- Container Apps (Dedicated): $50-100/ខែ
- Application Insights: $5-50/ខែ
- Storage (Premium): $10-50/ខែ

**💡 គន្លឹះបន្ថែមសម្រាប់អុ៉បទីម៉ៃចំណាយ:**
- ប្រើ **Free Tier** របស់ Microsoft Foundry Models សម្រាប់ការសិក្សា (Azure OpenAI 50,000 tokens/ខែ រួមបញ្ចូល)
- រត់ `azd down` ដើម្បីដកធនធានចេញពេលមិនកំពុងអភិវឌ្ឍ
- ចាប់ផ្តើមជាមួយវិធីសាស្ត្របង់តាមអនុវត្ត (consumption-based billing), ធ្វើបច្ចុប្បន្នភាពទៅ PTU តែសម្រាប់ផលិតកម្ម
- ប្រើ `azd provision --preview` ដើម្បីចាក់សម្គាល់ថ្លៃកម្រិតមុននឹងដាក់បញ្ចូល
- បើក auto-scaling: បង់តែនៅលើការប្រើប្រាស់ពិតប្រាកដ

**ការតាមដានចំណាយ:**
```bash
# ពិនិត្យការចំណាយសន្មត់ប្រចាំខែ
azd provision --preview

# តាមដានចំណាយពិតប្រាកដនៅក្នុង Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ ជំពូក 3: ការកំណត់កុងហ្វីហ្គូរ & ការផ្ទៀងផ្ទាត់
**លក្ខខណ្ឌជាមុន**: ជំពូក 1 បានបញ្ចប់  
**រយៈពេល**: 45-60 នាទី  
**កំរិតភាពស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ការកំណត់បរិយាកាសនិងការគ្រប់គ្រង
- លំនាំផ្ទៀងផ្ទាត់ និង សុវត្ថិភាព
- ការកំណត់ឈ្មោះធនធាន និង ការរៀបចំ

#### ប្រភពសិក្សា
- **📖 ការកំណត់កុងហ្វីហ្គូរ**: [មគ្គុទេសក៍កំណត់កុងហ្វីហ្គូរ](docs/chapter-03-configuration/configuration.md) - ការតំឡើងបរិយាកាស
- **🔐 សុវត្ថិភាព**: [លំនាំផ្ទៀងផ្ទាត់ និង managed identity](docs/chapter-03-configuration/authsecurity.md) - លំនាំផ្ទៀងផ្ទាត់
- **📝 ឧទាហរណ៍**: [ឧទាហរណ៍កម្មវិធីមូលដ្ឋានទិន្នន័យ](examples/database-app/README.md) - ឧទាហរណ៍ AZD Database

#### លំហាត់អនុវត្ត
- កំណត់បរិយាកាសច្រើន (dev, staging, prod)
- បង្កើត managed identity សម្រាប់ផ្ទៀងផ្ទាត់
- អនុវត្តកុងហ្វីហ្គូរពិសេសសម្រាប់បរិយាកាសនិរន្ត

**💡 លទ្ធផលជំពូក**: គ្រប់គ្រងបរិយាកាសច្រើនជាមួយផ្ទៀងផ្ទាត់ និងសុវត្ថិភាពត្រឹមត្រូវ

---

### 🏗️ ជំពូក 4: Infrastructure as Code & ការដាក់បញ្ចូល
**លក្ខខណ្ឌជាមុន**: ជំពូក 1-3 បានបញ្ចប់  
**រយៈពេល**: 1-1.5 ម៉ោង  
**កំរិតភាពស្មុគស្មាញ**: ⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- លំនាំដាក់បញ្ចូលកម្រិតខ្ពស់
- Infrastructure as Code ជាមួយ Bicep
- វិធីសាស្ត្របង្ហួតធនធាន

#### ប្រភពសិក្សា
- **📖 ការដាក់បញ្ចូល**: [មគ្គុទេសក៍ដាក់បញ្ចូល](docs/chapter-04-infrastructure/deployment-guide.md) - ដំណើរការ​ពេញលេញ
- **🏗️ ការផ្គូផ្គង**: [ការផ្គូផ្គងធនធាន](docs/chapter-04-infrastructure/provisioning.md) - ការគ្រប់គ្រងធនធាន Azure
- **📝 ឧទាហរណ៍**: [ឧទាហរណ៍ Container App](../../examples/container-app) - ការដាក់បញ្ចូលជាតុងទីណ័រម៉ៃស៍

#### លំហាត់អនុវត្ត
- បង្កើតគំរូ Bicep ផ្ទាល់ខ្លួន
- ដាក់បញ្ចូលកម្មវិធីច្រើនសេវាកម្ម
- អនុវត្តយុទ្ធសាស្ត្រ blue-green deployment

**💡 លទ្ធផលជំពូក**: ដាក់បញ្ចូលកម្មវិធីច្រើនសេវាកម្មស្មុគស្មាញដោយប្រើគំរូហេដ្ឋារចនាសម្ព័ន្ធផ្ទាល់ខ្លួន
### 🎯 ជំពូក 5: ដំណោះស្រាយ AI ពហុភ្នាក់ងារ (កម្រិតខ្ពស់)
**Prerequisites**: ជំពូក 1-2 បានបញ្ចប់  
**Duration**: 2-3 ម៉ោង  
**ភាពស្មុគស្មាញ**: ⭐⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- លំនាំស្ថាបត្យកម្មសម្រាប់ភ្នាក់ងារពហុ
- ការរៀបចំនិងសម្របសម្រួលភ្នាក់ងារ
- ការដាក់ប្រើ AI សម្រាប់ផលិតកម្ម

#### ធនធានសម្រាប់រៀន
- **🤖 គម្រោងពិសេស**: [ដំណោះស្រាយពហុភ្នាក់ងារសម្រាប់លក់រាយ](examples/retail-scenario.md) - ការអនុវត្តពេញលេញ
- **🛠️ គំរូ ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ដាក់ប្រើដោយចុចមួយដង
- **📖 ស្ថាបត្យកម្ម**: [លំនាំសម្របសម្រួលសម្រាប់ភ្នាក់ងារពហុ](docs/chapter-06-pre-deployment/coordination-patterns.md) - លំនាំ

#### លំហាត់អនុវត្ត
```bash
# ដាក់ឲ្យដំណើរការ​ដំណោះស្រាយភ្នាក់ងារច្រើន​សម្រាប់ពាណិជ្ជកម្មលក់រាយ​យ៉ាងពេញលេញ
cd examples/retail-multiagent-arm-template
./deploy.sh

# ស្វែងយល់ពីការកំណត់រចនាសម្ព័ន្ធរបស់ភ្នាក់ងារ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 លទ្ធផលរបស់ជំពូក**: ដាក់ប្រើ និងគ្រប់គ្រងដំណោះស្រាយ AI ពហុភ្នាក់ងារដែលមានសមត្ថភាពសម្រាប់ផលិតកម្ម ជាមួយភ្នាក់ងារ Customer និង Inventory

---

### 🔍 ជំពូក 6: ការត្រួតពិនិត្យ និងផែនការមុនការដាក់បញ្ចូល
**Prerequisites**: ជំពូក 4 បានបញ្ចប់  
**Duration**: 1 ម៉ោង  
**ភាពស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- ផែនការសមត្ថភាព និងការត្រួតពិនិត្យធនធាន
- យុទ្ធសាស្ត្រជ្រើសរើស SKU
- ការត្រួតពិនិត្យមុនដំណើរការ និងស្វ័យប្រវត្តិការ

#### ធនធានសម្រាប់រៀន
- **📊 ការធ្វើផែនការ**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - ការត្រួតពិនិត្យធនធាន
- **💰 ជ្រើសរើស**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - ជម្រើសដែលមានប្រសិទ្ធភាពក្នុងចំណាយ
- **✅ ការត្រួតពិនិត្យ**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - ការសរសេរស្គ្រីបស្វ័យប្រវត្តិ

#### លំហាត់អនុវត្ត
- ដំណើរការស្គ្រីបសម្រាប់ត្រួតពិនិត្យសមត្ថភាព
- បង្កើនប្រសិទ្ធភាពជ្រើសរើស SKU សម្រាប់កាត់បន្ថយចំណាយ
- អនុវត្តការត្រួតពិនិត្យមុនដាក់បញ្ចូលដោយស្វ័យប្រវត្តិ

**💡 លទ្ធផលរបស់ជំពូក**: បញ្ជាក់ និងបង្កើនប្រសិទ្ធភាពការដាក់បញ្ចូល មុនការប្រតិបត្តិ

---

### 🚨 ជំពូក 7: ការតាមដាន និងដោះស្រាយកំហុស
**Prerequisites**: ជំពូកណាមួយដែលពាក់ព័ន្ធនឹងការដាក់បញ្ចូលបានបញ្ចប់  
**Duration**: 1-1.5 ម៉ោង  
**ភាពស្មុគស្មាញ**: ⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- វិធីសាស្រ្តដោះស្រាយកំហុសយ៉ាងប្រព័ន្ធ
- បញ្ហាទូទៅ និងដំណោះស្រាយ
- ការដោះស្រាយបញ្ហាក្នុងវិស័យ AI ជាពិសេស

#### ធនធានសម្រាប់រៀន
- **🔧 បញ្ហាទូទៅ**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - សំណួរ​ញឹកញាប់ និងដំណោះស្រាយ
- **🕵️ ការដោះស្រាយកំហុស**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - យុទ្ធសាស្ត្រជំហានៗ
- **🤖 បញ្ហា AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - បញ្ហាសេវាកម្ម AI

#### លំហាត់អនុវត្ត
- វិភាគករណីបរាជ័យក្នុងការដាក់បញ្ចូល
- ដោះស្រាយបញ្ហាសម្គាល់អត្តសញ្ញាណ
- វិភាគកំហុសក្នុងការតភ្ជាប់សេវាកម្ម AI

**💡 លទ្ធផលរបស់ជំពូក**: វិភាគ និងដោះស្រាយបញ្ហាទូទៅក្នុងការដាក់បញ្ចូលដោយឯករាជ្យ

---

### 🏢 ជំពូក 8: លំនាំសម្រាប់ផលិតកម្ម និងសហគ្រាស
**Prerequisites**: ជំពូក 1-4 បានបញ្ចប់  
**Duration**: 2-3 ម៉ោង  
**ភាពស្មុគស្មាញ**: ⭐⭐⭐⭐

#### អ្វីដែលអ្នកនឹងរៀន
- យុទ្ធសាស្រ្តដាក់ប្រើសម្រាប់ផលិតកម្ម
- លំនាំសន្តិសុខសម្រាប់សហគ្រាស
- ការត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាពខាងតម្លៃ

#### ធនធានសម្រាប់រៀន
- **🏭 ផលិតកម្ម**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - លំនាំសម្រាប់សហគ្រាស
- **📝 ឧទាហរណ៍**: [Microservices Example](../../examples/microservices) - ស្ថាបត្យកម្មស្មុគស្មាញ
- **📊 ការត្រួតពិនិត្យ**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - ការត្រួតពិនិត្យ

#### លំហាត់អនុវត្ត
- អនុវត្តលំនាំសន្តិសុខសម្រាប់សហគ្រាស
- តម្លើងការត្រួតពិនិត្យជាសរុប
- ដាក់ប្រើទៅក្នុងផលិតកម្មជាមួយនឹងការគ្រប់គ្រងត្រឹមត្រូវ

**💡 លទ្ធផលរបស់ជំពូក**: ដាក់ប្រើកម្មវិធីដែលត្រៀមសម្រាប់សហគ្រាស ជាមួយនឹងសមត្ថភាពផលិតកម្មពេញលេញ

---

## 🎓 សង្ខេបវគ្គហ្វឹកហាត់: បទពិសោធន៍រៀនដោយអនុវត្ត

> **⚠️ ស្ថានភាពវគ្គហ្វឹកហាត់: កំពុងអភិវឌ្ឍន៍**  
> សម្ភារៈវគ្គបច្ចុប្បន្នកំពុងត្រូវបានអភិវឌ្ឍនិងបង្រៀន។ ម៉ូឌុលសំខាន់ៗមានសកម្មភាព តែក៏មានផ្នែកខ្ពស់ខ្លះនៅតែមិនទាន់បញ្ចប់។ យើងកំពុងធ្វើការ​ដើម្បីបំពេញមាតិកាទាំងអស់។ [តាមដានដំណើរការ →](workshop/README.md)

### សម្ភារៈវគ្គសិក្សាអន្ដរកម្ម
**បទពិសោធន៍រៀនដោយអនុវត្តពេញលេញជាមួយឧបករណ៍នៅលើកម្មវិធីរុករក និងលំហាត់ដឹកនាំ**

សម្ភារៈវគ្គរបស់យើងផ្តល់បទពិសោធន៍រៀនដែលមានរចនាសម្ព័ន្ធ និងអន្ដរកម្ម ដែលបំបែកនឹងកម្មវិធីសិក្សាតាមជំពូកខាងលើ។ វគ្គនេះត្រូវបានរចនាឡើងសម្រាប់ការរៀនដោយឯករាជ្យ និងសម្រាប់របីមេគ្រូដឹកនាំទាំងពីរ។

#### 🛠️ លក្ខណៈពិសេសនៃវគ្គហ្វឹកហាត់
- **ចំណុចប្រទាក់ដែលដំណើរការក្នុងកម្មវិធីរុករក**: វគ្គហ្វឹកហាត់ពេញលេញដែលដំណើរការ​ដោយ MkDocs មានមុខងារ​ស្វែងរក ចម្លង និងប្រធានបទ
- **ការរួមបញ្ចូល GitHub Codespaces**: ការកំណត់បរិយាកាសអភិវឌ្ឍដោយចុចមួយ
- **ផ្លូវការរៀនមានរចនាសម្ព័ន្ធ**: លំហាត់ដឹកនាំ 8 ម៉ូឌុល (រយៈពេលសរុប 3-4 ម៉ោង)
- **វិធីសាស្ត្រក្រោមលំដាប់**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **បរិយាកាស DevContainer អន្ដរកម្ម**: ឧបករណ៍ និងអាស្រ័យកម្មដែលកំណត់រួច

#### 📚 រចនាសម្ព័ន្ធម៉ូឌុលវគ្គហ្វឹកហាត់
វគ្គហ្វឹកហាត់នេះអនុវត្តវិធីសាស្ត្រលំដាប់លើក **8 ម៉ូឌុល** ដែលនាំអ្នកពីការស្វែងរកទៅដល់ជំនាញក្នុងការដាក់ប្រើ៖

| ម៉ូឌុល | ប្រធានបទ | អ្វីដែលអ្នកនឹងធ្វើ | រយៈពេល |
|--------|-------|----------------|----------|
| **0. Introduction** | សង្ខេបវគ្គហ្វឹកហាត់ | យល់ពីគោលដៅការរៀន, លក្ខខណ្ឌមុន, និងរចនាសម្ព័ន្ធវគ្គ | 15 នាទី |
| **1. Selection** | Template Discovery | ស្វែងយល់អំពីគំរូ AZD និងជ្រើសរើសគំរូ AI សមស្របសម្រាប់ស្ថានភាពរបស់អ្នក | 20 នាទី |
| **2. Validation** | Deploy & Verify | ដាក់កម្រងគំរូដោយប្រើ `azd up` ហើយផ្ទៀងផ្ទាត់ថា រចនាសម្ព័ន្ធធ្វើការ | 30 នាទី |
| **3. Deconstruction** | Understand Structure | ប្រើ GitHub Copilot ដើម្បីស្វែងយល់រចនាសម្ព័ន្ធគំរូ, ឯកសារ Bicep, និងការរៀបចំកូដ | 30 នាទី |
| **4. Configuration** | azure.yaml Deep Dive | ជំនាញលើ `azure.yaml` ការកំណត់រចនាសម្ព័ន្ធ, lifecycle hooks, និងអថេរបរិបទបរិយាកាស | 30 នាទី |
| **5. Customization** | Make It Yours | បើក AI Search, ការតាមដាន, ការវាយតម្លៃ និងប្តូរតាមស្ថានភាពរបស់អ្នក | 45 នាទី |
| **6. Teardown** | Clean Up | ដកធនធានឲ្យមានសុវត្ថិភាពដោយប្រើ `azd down --purge` | 15 នាទី |
| **7. Wrap-up** | Next Steps | ពិនិត្យការសម្រេចបាន, គំនិតសំខាន់ៗ, និងបន្តដំណើររៀនរបស់អ្នក | 15 នាទី |

**ដំណើរការវគ្គ**:
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ការចាប់ផ្តើមជាមួយវគ្គហ្វឹកហាត់
```bash
# ជម្រើសទី 1: GitHub Codespaces (បានណែនាំ)
# ចុច "Code" → "Create codespace on main" នៅក្នុងឃ្លាំងកូដ

# ជម្រើសទី 2: ការអភិវឌ្ឍនៅលើកុំព្យូទ័រផ្ទាល់
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ធ្វើតាមសេចក្តីណែនាំការតំឡើងនៅក្នុង workshop/README.md
```

#### 🎯 លទ្ធផលការរៀនពីវគ្គ
ដោយបញ្ចប់វគ្គនេះ អ្នកចូលរួមនឹងអាច៖
- **ដាក់ប្រើកម្មវិធី AI សម្រាប់ផលិតកម្ម**: ប្រើ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **មានជំនាញស្ថាបត្យកម្មភ្នាក់ងារពហុ**: អនុវត្តដំណោះស្រាយភ្នាក់ងារ AI ដែលមានការសម្របសម្រួល
- **អនុវត្តវិធានសន្តិសុខល្អបំផុត**: កំណត់ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ និងការគ្រប់គ្រងការចូលប្រើ
- **បង្កើនប្រសិទ្ធភាពសម្រាប់ការពង្រីក**: រចនាការដាក់ប្រើដែលមានថ្លៃចំណាយសមរម្យ និងមានការសម្របខ្លួនល្អ
- **ដោះស្រាយបញ្ហាក្នុងការដាក់បញ្ចូល**: ដោះស្រាយបញ្ហាទូទៅដោយឯករាជ្យ

#### 📖 ធនធានវគ្គហ្វឹកហាត់
- **🎥 មគ្គុទ្ទេសក៍អន្ដរកម្ម**: [Workshop Materials](workshop/README.md) - បរិយាកាសរៀននៅលើកម្មវិធីរុករក
- **📋 មេរៀនតាមម៉ូឌុលមួយៗ**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - សង្ខេបវគ្គហ្វឹកហាត់ និងគោលដៅ
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - ស្វែងរកនិងជ្រើសរើសគំរូ AI
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - ដាក់ប្រើ និងផ្ទៀងផ្ទាត់គំរូ
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ស្វែងយល់រចនាសម្ព័ន្ធគំរូ
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - ជំនាញលើ azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - ប្តូរតាមស្ថានភាពរបស់អ្នក
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - សម្អាតធនធាន
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - ពិនិត្យឡើងវិញ និងជំហានបន្ទាប់
- **🛠️ មន្ទីរពិសោធន៍វគ្គ AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - លំហាត់ផ្តោតលើ AI
- **💡 ចាប់ផ្តើមយ៉ាងរហ័ស**: [Workshop Setup Guide](workshop/README.md#quick-start) - ការកំណត់បរិយាកាស

ស័ក្តិសមសម្រាប់: ការបណ្តុះបណ្តាលសម្រាប់សហគ្រាស, វគ្គសិក្សាសាកលវិទ្យាល័យ, ការរៀនដោយឯករាជ្យ, និង bootcamps សម្រាប់អ្នកអភិវឌ្ឍន៍។

---

## 📖 ជ្រៅបន្តិច: សមត្ថភាព AZD

លើសពីមូលដ្ឋាន AZD ផ្តល់មុខងារដែលមានអំណាចសម្រាប់ការដាក់ប្រើក្នុងផលិតកម្ម៖

- **ការដាក់ប្រើដោយ​គំរូ** - ប្រើគំរូដែលបានបង្កើតរួចសម្រាប់លំនាំកម្មវិធីទូទៅ
- **រចនាសម្ព័ន្ធជា​កូដ** - គ្រប់គ្រងធនធាន Azure ដោយប្រើ Bicep ឬ Terraform  
- **ដំណើរការភ្ជាប់សមាសភាព** - ផ្តល់ទ្រព្យសកម្ម, ដាក់ប្រើ និងត្រួតពិនិត្យកម្មវិធីដោយរលូន
- **មិត្តរម្យសម្រាប់អ្នកអភិវឌ្ឍន៍** - ត្រូវបានអុីតមីសម្រាប់ផលិតភាពនិងបទពិសោធន៍របស់អ្នកអភិវឌ្ឍន៍

### **AZD + Microsoft Foundry: សាកសមសម្រាប់ការដាក់ប្រើ AI**

**ហេតុអ្វីបានជា AZD សម្រាប់ដំណោះស្រាយ AI?** AZD ទប់ស្កាត់បញ្ហាគន្លងកំពូលដែលអ្នកអភិវឌ្ឍន៍ AI ប្រឈមៈ

- **គំរូរួចរាល់សម្រាប់ AI** - គំរូបានកំណត់រួចសម្រាប់ម៉ូដែល Microsoft Foundry, សេវាកម្ម Azure AI, និងបន្ទុកការងារ ML
- **ការដាក់ប្រើ AI មានសុវត្ថិភាព** - លំនាំសន្តិសុខដែលស្ម័គ្រចិត្តសម្រាប់សេវាកម្ម AI, ក្តារលេខ API និងចំណុចចុងម៉ូដែល  
- **លំនាំ AI សម្រាប់ផលិតកម្ម** - អនុវត្តល្អបំផុតសម្រាប់ការដាក់ប្រើកម្មវិធី AI ដែលអាចពង្រីកបាន និងមានប្រសិទ្ធភាពថ្លៃ
- **ដំណើរការពេញលេញរបស់ AI** - ពីការអភិវឌ្ឍម៉ូដែលដល់ការដាក់ប្រើក្នុងផលិតកម្មជាមួយការត្រួតពិនិត្យសមរម្យ
- **បង្កើនប្រសិទ្ធភាពចំណាយ** - ការចែកចាយធនធានឆ្លាតវៃ និងយុទ្ធសាស្ត្រការពង្រីកសម្រាប់បន្ទុកកិច្ចការ AI
- **ការរួមបញ្ចូល Microsoft Foundry** - ការតភ្ជាប់រលូនទៅកាន់សៀវភៅម៉ូដែល Microsoft Foundry និងចំណុចចប់

---

## 🎯 ទម្រង់ និងបណ្ណាល័យឧទាហរណ៍

### ពិសេស៖ គំរូ Microsoft Foundry
**ចាប់ផ្តើមនៅទីនេះ ប្រសិនបើអ្នកកំពុងដាក់ប្រើកម្មវិធី AI!**

> **កំណត់ចំណាំ:** គំរូទាំងនេះបង្ហាញពីលំនាំ AI ផ្សេងៗ។ មានខ្លះជាឧទាហរណ៍ Azure ខាងក្រៅ ខ្លះជាការអនុវត្តក្នុងស្រុក

| គំរូ | ជំពូក | ភាពស្មុគស្មាញ | សេវាកម្ម | ប្រភេទ |
|----------|---------|------------|----------|------|
| [**ចាប់ផ្តើមជាមួយការជជែក AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ជំពូក 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ខាងក្រៅ |
| [**ចាប់ផ្តើមជាមួយភ្នាក់ងារ AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | ជំពូក 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ខាងក្រៅ |
| [**Azure Search + OpenAI ដែមូ**](https://github.com/Azure-Samples/azure-search-openai-demo) | ជំពូក 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ខាងក្រៅ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ជំពូក 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ខាងក្រៅ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | ជំពូក 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ខាងក្រៅ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | ជំពូក 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ខាងក្រៅ |
| [**ដំណោះស្រាយពហុភ្នាក់ងារសម្រាប់លក់រាយ**](examples/retail-scenario.md) | ជំពូក 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ក្នុងស្រុក** |

### ពិសេស៖ សេណារីយោរៀនពេញលេញ
**គំរូកម្មវិធីបំពាក់សម្រាប់ផលិតកម្ម ដែលផ្គូផ្គងទៅនឹងជំពូករៀន**

| គំរូ | ជំពូកសម្រាប់រៀន | ភាពស្មុគស្មាញ | ការរៀនសំខាន់ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ជំពូក 2 | ⭐ | លំនាំដាក់ប្រើ AI មូលដ្ឋាន |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | ជំពូក 2 | ⭐⭐ | ការអនុវត្ត RAG ជាមួយ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | ជំពូក 4 | ⭐⭐ | ការរួមបញ្ចូល Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | ជំពូក 5 | ⭐⭐⭐ | ស៊ុមភ្នាក់ងារ និងការហៅមុខងារ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | ជំពូក 8 | ⭐⭐⭐ | ការរៀបចារតួលេខ AI សម្រាប់សហគ្រាស |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | ជំពូក 5 | ⭐⭐⭐⭐ | ស្ថាបត្យកម្មពហុភ្នាក់ងារជាមួយភ្នាក់ងារ Customer និង Inventory |

### រៀនតាមរបៀបឧទាហរណ៍

> **📌 ឧទាហរណ៍ក្នុងស្រុក និងខាងក្រៅ:**  
> **ឧទាហរណ៍ក្នុងស្រុក** (នៅក្នុង repo នេះ) = ត្រៀមប្រើភ្លាមៗ  
> **ឧទាហរណ៍ខាងក្រៅ** (Azure Samples) = ចម្លងពីរេពូដែលខ្ពស់ជាប់តំណភ្ជាប់

#### ឧទាហរណ៍ក្នុងស្រុក (ត្រៀមប្រើ)
- [**ដំណោះស្រាយពហុភ្នាក់ងារសម្រាប់លក់រាយ**](examples/retail-scenario.md) - ការអនុវត្តពេញលេញសម្រាប់ផលិតកម្មជាមួយគំរូ ARM
  - ស្ថាបត្យកម្មពហុភ្នាក់ងារ (ភ្នាក់ងារ Customer + Inventory)
  - ការត្រួតពិនិត្យ និងវាយតម្លៃយ៉ាងទូលំទូលាយ
  - ដាក់ប្រើដោយចុចមួយលើតាមគំរូ ARM

#### ឧទាហរណ៍ក្នុងស្រុក - កម្មវិធីកុងតឺនឺរ (ជំពូក 2-5)
- [**ឧទាហរណ៍ Container App**](examples/container-app/README.md) - មាគ៌ាពេញលេញសម្រាប់ការដាក់បង្ហាញដោយប្រើ container
  - [API Flask សាមញ្ញ](../../examples/container-app/simple-flask-api) - API REST មូលដ្ឋាន ដែលមានសមត្ថភាព scale-to-zero
  - [រចនាសម្ព័ន្ធ Microservices](../../examples/container-app/microservices) - ការដាក់បង្ហាញច្រើនសេវាកម្មដែលត្រៀមសម្រាប់ផលិតកម្ម
  - លំនាំចាប់ផ្តើមរហ័ស, លំនាំសម្រាប់ផលិតកម្ម និង លំនាំកម្រិតខ្ពស់
  - ការណែនាំអំពីការត្រួតពិនិត្យ, សុវត្ថិភាព និង ការណែនាំសម្រាប់បង្កើនប្រសិទ្ធភាពចំណាយ

#### ឧទាហរណ៍ខាងក្រៅ - កម្មវិធីសាមញ្ញ (ជំពូក 1-2)
**ចម្លងការផ្ទុកព័ត៌មាន Azure Samples ទាំងនេះដើម្បីចាប់ផ្តើម:**
- [កម្មវិធីតាមវេបសាមញ្ញ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - លំនាំដាក់បង្ហាញមូលដ្ឋាន
- [គេហទំព័រឈរមួយ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - ការដាក់បង្ហាញមាតិកាឈរមួយ
- [កម្មវិធី Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - ការដាក់បង្ហាញ REST API

#### ឧទាហរណ៍ខាងក្រៅ - ការរួមបញ្ចូលមូលដ្ឋានទិន្នន័យ (ជំពូក 3-4)  
- [កម្មវិធីមូលដ្ឋានទិន្នន័យ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - លំនាំការតភ្ជាប់មូលដ្ឋានទិន្នន័យ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - ចរន្តការងារទិន្នន័យ Serverless

#### ឧទាហរណ៍ខាងក្រៅ - លំនាំកម្រិតខ្ពស់ (ជំពូក 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - រចនាសម្ព័ន្ធច្រើនសេវា
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ដំណើរការផ្នែកផ្ទៃក្រោយ  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - លំនាំ ML ត្រៀមសម្រាប់ផលិតកម្ម

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - ចំណតគំរូដែលបានរើសសម្រាប់ផ្លូវការ និង សហគមន៍
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - ឯកសារគំរូ Microsoft Learn
- [**Examples Directory**](examples/README.md) - ឧទាហរណ៍សម្រាប់រៀននៅក្នុងទិសដៅផ្ទាល់ជាមួយការពណ៌នាដែលលម្អិត

---

## 📚 ធនធានសិក្សា និង យោង

### យោងរហ័ស
- [**សន្លឹកពាក្យបញ្ជា**](resources/cheat-sheet.md) - ពាក្យបញ្ជា azd សំខាន់ដែលបានរៀបចំតាមជំពូក
- [**វចនានុក្រម**](resources/glossary.md) - ពាក្យនិយម Azure និង azd  
- [**FAQ**](resources/faq.md) - សំណួរញឹកញាប់ដែលបានរៀបចំតាមជំពូកសិក្សា
- [**មគ្គុទេសក៍សិក្សា**](resources/study-guide.md) - លំហាត់អនុវត្តគ្រប់លំដាប់

### សិក្ខាសាលាអនុវត្ត
- [**សិក្ខាសាលា AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ធ្វើឱ្យដំណោះស្រាយ AI របស់អ្នកអាចដាក់បង្ហាញដោយ AZD (2-3 ម៉ោង)
- [**សិក្ខាសាលាអន្តរកម្ម**](workshop/README.md) - លំហាត់មេឌុល 8 មានការណែនាំជាមួយ MkDocs និង GitHub Codespaces
  - ដូចខាងក្រោម: ការណែនាំ → ជ្រើសរើស → ផ្ទៀងផ្ទាត់ → បំបែក → ការកំណត់ → ការប្ដូរតាមបំណង → ការបិទ → សេចក្តីសង្ខេប

### ធនធានសិក្សាខាងក្រៅ
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### ជំនាញភ្នាក់ងារ AI សម្រាប់កម្មវិធីកែសម្រួលរបស់អ្នក
- [**ជំនាញ Microsoft Azure នៅលើ skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - មានជំនាញភ្នាក់ងារបើកចំហ 37 សម្រាប់ Azure AI, Foundry, ការ​ដាក់បង្ហាញ, វិភាគកំហុស, ការកែលម្អចំណាយ និងផ្សេងៗទៀត។ ដំឡើងពួកវានៅក្នុង GitHub Copilot, Cursor, Claude Code, ឬភ្នាក់ងារណាមួយដែលគាំទ្រ:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 សៀវភៅជំនួយរហ័ស

**បញ្ហាធម្មតាដែលអ្នកចាប់ផ្តើមជួប និងដំណោះស្រាយភ្លាមៗ៖**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# តំឡើង AZD ជាមុន
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ផ្ទៀងផ្ទាត់ការតំឡើង
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# បញ្ជីការជាវដែលអាចប្រើបាន
az account list --output table

# កំណត់ជាវលំនាំដើម
az account set --subscription "<subscription-id-or-name>"

# កំណត់សម្រាប់បរិយាកាស AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ផ្ទៀងផ្ទាត់
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# សាកល្បងតំបន់ Azure ផ្សេង
azd env set AZURE_LOCATION "westus2"
azd up

# ឬប្រើ SKU តូចជាងនៅក្នុងការអភិវឌ្ឍន៍
# កែសម្រួល infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# ជម្រើស 1: សម្អាត ហើយព្យាយាមម្ដងទៀត
azd down --force --purge
azd up

# ជម្រើស 2: គ្រាន់តែជួសជុលហេដ្ឋារចនាសម្ព័ន្ធ
azd provision

# ជម្រើស 3: ពិនិត្យស្ថានភាពលម្អិត
azd show

# ជម្រើស 4: ពិនិត្យកំណត់ហេតុនៅក្នុង Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# ធ្វើការផ្ទៀងផ្ទាត់ឡើងវិញសម្រាប់ AZD
azd auth logout
azd auth login

# ជម្រើស៖ ធ្វើបច្ចុប្បន្នភាព Azure CLI ផង ប្រសិនបើអ្នកកំពុងរត់ពាក្យបញ្ជា az
az logout
az login

# ត្រួតពិនិត្យការផ្ទៀងផ្ទាត់
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD បង្កើតឈ្មោះដែលមានតែមួយ ប៉ុន្តែប្រសិនបើមានជម្លោះ:
azd down --force --purge

# បន្ទាប់មកព្យាយាមម្តងទៀតជាមួយបរិស្ថានថ្មី
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**ពេលរង់ចាំធម្មតា:**
- កម្មវិធីវែបសាមញ្ញ: 5-10 នាទី
- កម្មវិធីជាមួយមូលដ្ឋានទិន្នន័យ: 10-15 នាទី
- កម្មវិធី AI: 15-25 នាទី (ការផ្គត់ផ្គង់ OpenAI យឺត)

```bash
# ពិនិត្យ​ការរីកចម្រើន
azd show

# បើឈប់ស្ទាក់លើ 30 នាទី សូមពិនិត្យ Azure Portal:
azd monitor --overview
# ស្វែងរកការតម្លើងដែលបរាជ័យ
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# ពិនិត្យតួនាទី Azure របស់អ្នក
az role assignment list --assignee $(az account show --query user.name -o tsv)

# អ្នកត្រូវការតួនាទី "Contributor" យ៉ាងហោចណាស់
# សូមស្នើឲ្យអ្នកគ្រប់គ្រង Azure របស់អ្នកផ្ដល់:
# - Contributor (សម្រាប់ធនធាន)
# - User Access Administrator (សម្រាប់ការបែងចែកតួនាទី)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# បង្ហាញចំណុចផ្តល់សេវាទាំងអស់
azd show

# ឬបើក Azure Portal
azd monitor

# ពិនិត្យសេវាជាក់លាក់
azd env get-values
# ស្វែងរកអថេរ *_URL
```
</details>

### 📚 ធនធានជម្រះបញ្ហា ពេញលេញ

- **មគ្គុទេសក៍បញ្ហាធម្មតា:** [ដំណោះស្រាយលំអិត](docs/chapter-07-troubleshooting/common-issues.md)
- **បញ្ហាពាក់ព័ន្ធ AI:** [ការជម្រះបញ្ហា AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **មគ្គុទេសក៍ដឹងកំហុស:** [ដោះស្រាយជំហាន-ទៅ-ជំហាន](docs/chapter-07-troubleshooting/debugging.md)
- **ទទួលបានជំនួយ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 ការបញ្ចប់មុខវិជ្ជា និង វិញ្ញាបនបត្រ

### ការតាមដានរីកចម្រើន
តាមដានការរីកចម្រើនសិក្សារបស់អ្នកតាមជំពូកជាក់លាក់៖

- [ ] **ជំពូក 1**: មូលដ្ឋាន និង ចាប់ផ្តើមរហ័ស ✅
- [ ] **ជំពូក 2**: អភិវឌ្ឍន៍ផ្តល់អាទិភាពដល់ AI ✅  
- [ ] **ជំពូក 3**: ការកំណត់ និង ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ ✅
- [ ] **ជំពូក 4**: រចនាសម្ព័ន្ធជា Code និង ការ​ដាក់បង្ហាញ ✅
- [ ] **ជំពូក 5**: ដំណោះស្រាយ AI ច្រើនភ្នាក់ងារ ✅
- [ ] **ជំពូក 6**: ការផ្ទៀងផ្ទាត់ និង ការធ្វើផែនការមុនការដាក់បង្ហាញ ✅
- [ ] **ជំពូក 7**: ការជម្រះបញ្ហា និង ការដោះកំហុស ✅
- [ ] **ជំពូក 8**: លំនាំផលិតកម្ម និង សហគ្រាស ✅

### ការផ្ទៀងផ្ទាត់ការសិក្សា
បន្ទាប់ពីបញ្ចប់ជំពូកនីមួយៗ សូមផ្ទៀងផ្ទាត់ចំណេះដឹងរបស់អ្នក ដោយ៖
1. **លំហាត់អនុវត្ត:** បញ្ចប់ការដាក់បង្ហាញអនុវត្តន៍នៃជំពូក
2. **ពិនិត្យចំណេះដឹង:** ពិនិត្យផ្នែក FAQ សម្រាប់ជំពូករបស់អ្នក
3. **ពិភាក្សាសហគមន៍:** ចែករំលែកបទពិសោធន៍របស់អ្នកនៅក្នុង Azure Discord
4. **ជំពូកបន្ទាប់:** ទៅកាន់កម្រិតស្មុគស្មាញបន្ទាប់

### អត្ថប្រយោជន៍ពេលបញ្ចប់មុខវិជ្ជា
បន្ទាប់ពីបញ្ចប់ជំពូកទាំងអស់ អ្នកនឹងមាន:
- **បទពិសោធន៍ផលិតកម្ម:** ដាក់បញ្ចូលកម្មវិធី AI ជាជាក់ស្តែងទៅ Azure
- **ជំនាញមុខវិជ្ជាជីវៈ:** សមត្ថភាពដាក់បង្ហាញសម្រាប់សហគ្រាស  
- **ការទទួលស្គាល់ពីសហគមន៍:** ជាសមាជិកសកម្មនៃសហគមន៍អ្នកអភិវឌ្ឍ Azure
- **ការរីកចម្រើនមុខជំនាញ:** ជំនាញ AZD និង ការដាក់បង្ហាញ AI ដែលត្រូវការខ្លាំង

---

## 🤝 សហគមន៍ និង ជំនួយ

### ទទួលជំនួយ និង គាំទ្រ
- **បញ្ហាបច្ចេកទេស:** [រាយការណ៍កំហុស និងស្នើសុំមុខងារ](https://github.com/microsoft/azd-for-beginners/issues)
- **សំណួរសិក្សា:** [សហគមន៍ Microsoft Azure Discord](https://discord.gg/microsoft-azure) និង [![Discord របស់ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ជំនួយពាក់ព័ន្ធ AI:** ចូលរួម [![Discord របស់ Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ឯកសារ:** [ឯកសារផ្លូវការអំពី Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ដំណល់សហគមន៍ពី Microsoft Foundry Discord

**លទ្ធផលការស្ទង់មតិថ្មីៗ ពីប៉ុស្ដិ៍ #Azure:**
- **45%** នៃអ្នកអភិវឌ្ឍចង់ប្រើ AZD សម្រាប់បន្ទុកការងារ AI
- **វិបត្តិចម្បង:** ការដាក់បង្ហាញច្រើនសេវា, ការគ្រប់គ្រងព័ត៌មានសញ្ញា, ភាពត្រៀមសម្រាប់ផលិតកម្ម  
- **អ្វីដែលបានស្នើសុំច្រើនបំផុត:** គំរូពិសេសសម្រាប់ AI, មគ្គុទេសក៍ជម្រះបញ្ហា, គោលការណ៍ល្អបំផុត

**ចូលរួមសហគមន៍របស់យើងដើម្បី៖**
- ចែករំលែកបទពិសោធន៍ AZD + AI របស់អ្នក និងទទួលបានជំនួយ
- ចូលដល់ការមើលជាមុននៃគំរូ AI ថ្មីៗ
- ចូលរួមអភិវឌ្ឍន៍គោលការណ៍ល្អបំផុតសម្រាប់ការដាក់បង្ហាញ AI
- មានឥទ្ធិពលលើការអភិវឌ្ឍមុខងារ AI + AZD អនាគត

### ការរួមចំណែកក្នុងមុខវិជ្ជា
យើងសូមស្វាគមន៍ការរួមចំណែក! សូមអាន [មគ្គុទេសក៍ការរួមចំណែក](CONTRIBUTING.md) សម្រាប់ព័ត៌មានលម្អិតអំពី:
- **ការកែលម្អមាតិកា:** បន្ថែមសមត្ថភាពនៅក្នុងជំពូក និង ឧទាហរណ៍ដែលមាន
- **ឧទាហរណ៍ថ្មី:** បន្ថែមស្ថានភាពពិត និង គំរូ  
- **បកប្រែ:** ជួយរក្សាភាសាច្រើន
- **រាយការណ៍កំហុស:** ជួយកែលម្អភាពត្រឹមត្រូវ និង ភាពច្បាស់លាស់
- **ស្តង់ដារសហគមន៍:** អនុវត្តតាមបទបញ្ជាសហគមន៍រួម

---

## 📄 ព័ត៌មានមុខវិជ្ជា

### អាជ្ញាប័ណ្ណ
គម្រោងនេះមានអាជ្ញាប័ណ្ណក្រោម MIT License - មើលឯកសារ [LICENSE](../../LICENSE) សម្រាប់ព័ត៌មានលម្អិត។

### ធនធានសិក្សាផ្សេងទៀតដែលទាក់ទងនឹង Microsoft

ក្រុមរបស់យើងបង្កើតមុខវិជ្ជាសិក្សាផ្សេងទៀតដែលពេញលេញ៖

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![ភ្នាក់ងារ AI សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![AI បង្កើត (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### ការសិក្សាមូលដ្ឋាន
[![ML សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![វិទ្យាទិន្នន័យសម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![សន្តិសុខស៊ីប៊ែរ សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![អភិវឌ្ឍន៍វែបសម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![ការអភិវឌ្ឍ XR សម្រាប់អ្នកចាប់ផ្តើម](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ជួរប្រធាន Copilot
[![Copilot សម្រាប់ការសរសេរកូដជាគូជាមួយ AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot សម្រាប់ C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![ការផ្សងព្រេង Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ការរុករកវគ្គសិក្សា

**🚀 តើអ្នកត្រៀមចាប់ផ្តើមរៀនរួចហើយ?**

**សម្រាប់អ្នកចាប់ផ្តើម**: ចាប់ផ្តើមជាមួយ [ជំពូក 1: មូលដ្ឋាន និងចាប់ផ្តើមរហ័ស](#-chapter-1-foundation--quick-start)  
**សម្រាប់អ្នកអភិវឌ្ឍន៍ AI**: ទៅកាន់ [ជំពូក 2: ការអភិវឌ្ឍដែលផ្តល់អាទិភាពដល់ AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**សម្រាប់អ្នកអភិវឌ្ឍមានបទពិសោធន៍**: ចាប់ផ្តើមជាមួយ [ជំពូក 3: ការកំណត់រចនា និងការផ្ទៀងផ្ទាត់](#️-chapter-3-configuration--authentication)

**ជំហានបន្ទាប់**: [ចាប់ផ្តើមជំពូក 1 - មូលដ្ឋាន AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
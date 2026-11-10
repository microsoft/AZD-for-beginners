# ស εργαστήριο AI: ការបង្កើតដំណោះស្រាយ AI របស់អ្នកឲ្យអាចបញ្ចូលបានជាមួយ AZD

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គបណ្តុះបណ្តាល**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍន៍ AI ជាល្បី
- **⬅️ មុននេះ**: [ការដាក់បញ្ចូលម៉ូដែល AI](ai-model-deployment.md)
- **➡️ បន្ទាប់**: [អប្បបរមានៃការអនុវត្ត AI](../chapter-08-production/production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

## សង្ខេបវគ្គបណ្តុះបណ្តាល

ក្នុងមន្ទីរពិសោធន៍ដៃនេះ អ្នកអភិវឌ្ឍន៍នឹងនាំឲ្យដំណើរការដកស្រង់គំរូ AI មានរួចហើយ និងដាក់បញ្ចូលវា តាមរយៈ Azure Developer CLI (AZD)។ អ្នកនឹងរៀនពីគំរូសំខាន់ៗសម្រាប់ការដាក់បញ្ចូល AI នៅក្នុងផលិតកម្មដោយប្រើសេវា Microsoft Foundry។

> **ការត្រួតពិនិត្យការចេញផ្សាយ (2026-11-04):** ការណែនាំពាក្យបញ្ជា AZD និងឈ្មោះការកំណត់រចនាសម្ព័ន្ធគំរូ ត្រូវបានពិនិត្យឡើងវិញជាមួយការចេញផ្សាយ `azd` `1.37.2` និងការកំណត់រចនាសម្ព័ន្ធបច្ចុប្បន្ននៃគំរូបានភ្ជាប់។ នេះគឺជាការត្រួតពិនិត្យឯកសារ មិនមែនជាការបញ្ជាក់ការដាក់បញ្ចូលបន្តដោយផ្ទាល់ទេ។ មន្ទីរពិសោធន៍ RAG មិនត្រូវការបន្ថែមAgent; សម្រាប់ការវាយតម្លៃAgent ប្រើបន្ថែម `azure.ai.evaluations` និង [លំនាំការវាយតម្លៃបច្ចុប្បន្ន](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) មិនមែនបញ្ជាពិនិត្យAgentបុរាណទេ។

**រយៈពេល៖** 2-3 ម៉ោង  
**កម្រិត៖** មធ្យម  
**លក្ខខណ្ឌជាមូលដ្ឋាន៖** ដឹងពី Azure មូលដ្ឋាន និងស្គាល់គំនិត AI/ML

## 🎓 គោលបំណងកំណែនៃការសិក្សា

នៅចុងវគ្គនេះ អ្នកនឹងអាច៖
- ✅ ស្វែងយល់ពីគំរូ AZD AI មានរួចហើយ និងរៀបចំផែនការបម្រើកម្មវិធីរបស់អ្នក
- ✅ កំណត់សេវា Microsoft Foundry ជាមួយ AZD
- ✅ អនុវត្តការគ្រប់គ្រងសម្ងាត់ប្រព័ន្ធសម្រាប់សេវា AI
- ✅ ដាក់បញ្ចូលកម្មវិធីយោង AI ជាមួយការត្រួតពិនិត្យ
- ✅ ដោះស្រាយបញ្ហាទូទៅរបស់ការដាក់បញ្ចូល AI

## លក្ខខណ្ឌជាមូលដ្ឋាន

### ឧបករណ៍ត្រូវការជ្រើសរើស
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ត្រូវបានដំឡើង
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ត្រូវបានដំឡើង
- [Git](https://git-scm.com/) ត្រូវបានដំឡើង
- កម្មវិធីកែសម្រួលកូដ (ផ្ដល់អនុសាសន៍ប្រើ VS Code)

ប្លុកបញ្ជាពាក្យបញ្ជាទាំងនេះប្រើរចនាសម្ព័ន្ធ Bash (រួមទាំងបន្តបន្ទាត់ និង `grep`)។ នៅលើ Windows ប្រើ Git Bash/WSL ឬបកប្រែទៅ PowerShell។ ក៏ដូចជាដំឡើងភាសា គ្រឿងធ្វើប៉ាក ក៏ដូចជាឧបករណ៍ container ដែលបានរាយនាមនៅ [ការរៀបចំបរិបទមូលដ្ឋានរបស់គំរូ](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment)។

### ចំណូលរាជធានី Azure
- ចុះឈ្មោះ Azure ដែលមានសិទ្ធិបង្កើតធនធាន និងចាត់តួនាទី (ប្រភេទ Contributor ម្នាក់មិនអាចបង្កើតតួនាទី RBAC បានទេ; គួរប្រើអ្នកគ្រប់គ្រងតួនាទីឬអនុវត្តសមមាត្រតាមគំរូ)
- មានសិទ្ធិប្រើសេវា Microsoft Foundry Models (ឬអាចស្នើសុំបាន)
- មានសិទ្ធិបង្កើតក្រុមធនធាន

### ជំនាញដែលត្រូវមាន
- មានការយល់ដឹងមូលដ្ឋានអំពីសេវា Azure
- ស្គាល់ command-line interface
- មានគំនិតបុព្វបទ AI/ML (API, ម៉ូដែល, prompts)

## ការរៀបចំក្នុងមន្ទីរ

### ជំហាន 1៖ ការរៀបចំបរិបទ

1. **ត្រួតពិនិត្យការដំឡើងឧបករណ៍:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

ប្រសិនបើអ្នកធ្វើការនៅលើ tenants ច្រើនឬការចុះបញ្ជីរបស់អ្នកមិនត្រូវបានរកឃើញដោយស្វ័យប្រវត្តិ អ្នកត្រូវសាកល្បងម្ដងទៀតជាមួយ `azd auth login --tenant-id <tenant-id>`។

2. **ថតចម្លងរ៉េបូបមន្ទីរពិសោធន៍:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## មេរៀន 1៖ ការយល់ដឹងពីរចនាសម្ព័ន្ធ AZD សម្រាប់កម្មវិធី AI

### រាងរចនាសម្ព័ន្ធគំរូ AI AZD

ស្វែងយល់ពីឯកសារសំខាន់ក្នុងគំរូ AZD ដែលមាន AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

គំរូដែលយកចេញអាចផ្លាស់ប្ដូរបាន; `.azure/` មានប្រតិកម្មបន្ទាប់ពីការចាប់ផ្តើមបរិបទ មិនមែនក្នុងថ្ងៃ clone ថ្មីនោះទេ។ សូមពិនិត្យមើលការចាប់ផ្តើមពិតប្រាកដមុនពេលបង្កើតថតដែលខ្វះ ដោយដូចគ្នាទៅនឹងគំរូនេះ។

### **លំហាត់មន្ទីរ 1.1: ស្វែងរកការកំណត់រចនាសម្ព័ន្ធ**

1. **ពិនិត្យឯកសារ azure.yaml:**
```bash
cat azure.yaml
```

**អ្វីដែលត្រូវចាប់អារម្មណ៍៖**
- ការកំណត់សេវាសម្រាប់ផ្នែក AI
- ការបំពាក់អថេរបរិបទបរិយាកាស
- ការកំណត់បង្ហោះម៉ាស៊ីន

2. **ពិនិត្យព័ត៌មានសំណង់ main.bicep:**
```bash
cat infra/main.bicep
```

**គំរូ AI សំខាន់ៗដែលត្រូវស្វែងរក៖**
- ការផ្ដល់សេវា Microsoft Foundry Models
- ការរួមបញ្ចូល Azure AI Search
- ការគ្រប់គ្រងក្តារសម្ងាត់
- ការកំណត់សុវត្ថិភាពបណ្តាញ

### **ចំណុចពិភាក្សា៖ ហេតុអ្វីគំរូទាំងនេះសំខាន់សម្រាប់ AI**

- **ការគាំទ្រសេវា**: កម្មវិធី AI ជាច្រើនត្រូវការសេវាដែលសម្របសម្រួលគ្នាច្រើន
- **សុវត្ថិភាព**: ចាត់ការអោយមានសុវត្ថិភាពកូនសោ API និងចំនុចចូល
- **ការរីកចម្រើន**: ទំនួលខុសត្រូវការរីកហើយការតម្រូវយ៉ាងពិសេសសម្រាប់ AI
- **ការគ្រប់គ្រងថ្លៃដើម**: សេវា AI អាចមានថ្លៃខ្ពស់បើមិនកំណត់បានត្រឹមត្រូវ

## មេរៀន 2៖ ដាក់បញ្ចូលកម្មវិធី AI នៅដំណាក់កាលដំបូងរបស់អ្នក

### ជំហាន 2.1៖ ចាប់ផ្តើមបរិបទ

1. **បង្កើតបរិបទ AZD ថ្មី:**
```bash
azd env new myai-workshop
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រត្រូវការ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### ជំហាន 2.2៖ ដាក់បញ្ចូលសំណង់ស្ថាបត្យកម្ម និងកម្មវិធី

1. **ដាក់បញ្ចូលដោយប្រើ AZD:**
```bash
azd up
```

**អ្វីកើតឡើងនៅពេល `azd up`:**
- ✅ ផ្ដល់សេវា Microsoft Foundry Models
- ✅ បង្កើតសេវា Azure AI Search
- ✅ ចាប់ផ្តើម Azure Container Apps សម្រាប់ផ្នែកខាងក្រោយ និងផ្នែកកម្រិតក្រោយបង្ហាញ (គំរូលំនាំបច្ចុប្បន្ន)
- ✅ កំណត់បណ្តាញ និងសុវត្ថិភាព
- ✅ ដាក់បញ្ចូលកូដកម្មវិធី
- ✅ កំណត់ការត្រួតពិនិត្យ និងកំណត់ហេតុ

2. **ត្រួតពិនិត្យដំណើរការដាក់បញ្ចូល** និងកត់សម្គាល់ធនធានដែលកំពុងបានបង្កើត។

### ជំហាន 2.3៖ ធ្វើការត្រួតពិនិត្យការដាក់បញ្ចូលរបស់អ្នក

1. **ពិនិត្យធនធានដែលបានដាក់បញ្ចូល:**
```bash
azd show
```

2. **បើកកម្មវិធីដែលបានដាក់បញ្ចូល:**
```bash
azd show
```

បើកចំណុចចូលបណ្ដាញដែលបង្ហាញនៅលើលទ្ធផល `azd show`។

3. **សាកល្បងមុខងារ AI:**
   - ធ្វើដំណើរកម្មទៅកម្មវិធីបណ្ដាញ
   - សាកល្បងសំណួរគំរូ
   - បញ្ជាក់ថាចម្លើយAIដំណើរការបានល្អ

### **លំហាត់មន្ទីរ 2.1: សមាហរណកម្មទូទៅ**

**ស្ថានการณ์**៖ ការដាក់បញ្ចូលរបស់អ្នកបានជោគជ័យ ប៉ុន្តែ AI មិនឆ្លើយតប។

**បញ្ហាទូទៅដែលត្រូវពិនិត្យ:**
1. **ការផ្ទៀងផ្ទាត់គោលសញ្ញា**៖ ពិនិត្យ managed identity និងការចាត់តួនាទី; ត្រឹមត្រូវពិនិត្យAPI key ប្រសិនបើអ្នកបានបើក authentication ដោយកូនសោ
2. **ភាពអាចប្រើម៉ូដែល**៖ ពិនិត្យតំបន់របស់អ្នកគាំទ្រម៉ូដែល ឬទេ
3. **ការតភ្ជាប់បណ្តាញ**៖ ប្រាកដថាសេវាអាចទំនាក់ទំនងគ្នាបាន
4. **សិទ្ធិ RBAC**៖ ពិនិត្យថាកម្មវិធីអាចចូលដំណើរការ OpenAI បាន

**ពាក្យបញ្ជាដោះស្រាយបញ្ហា:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## មេរៀន 3៖ ការប្តូរតាមតម្រូវការសម្រាប់កម្មវិធី AI របស់អ្នក

### ជំហាន 3.1៖ ផ្លាស់ប្តូរការកំណត់រចនាសម្ព័ន្ធ AI

1. **ធ្វើបច្ចុប្បន្នភាពម៉ូដែល OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **បន្ថែមសេវា AI ផ្សេងៗទៀត:**

កែសម្រួល `infra/main.bicep` ដើម្បីបន្ថែម Document Intelligence:

ខាងក្រោមជាធាតុបង្ហាញមួយ មិនមែនគំរូពេញលេញទេ។ គំរូអាចបានផ្ដល់សេវាកម្មដំណើរការឯកសាររួចហើយ៖ សូមពិនិត្យស្ថាបត្យកម្មបច្ចុប្បន្នមុនបន្ថែមធនធានមិនទាន់មាន។ ការបន្ថែមផ្ទាល់ត្រូវការច្រកចេញ, အោយយស្យ, និងការកំណត់កម្មវិធី។

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### ជំហាន 3.2៖ ការកំណត់រចនាសម្ព័ន្ធពិសេសសម្រាប់បរិបទ

**អនុស្សាវរីយ៍ល្អបំផុត**៖ កំណត់រចនាសម្ព័ន្ធផ្សេងគ្នាសម្រាប់ការអភិវឌ្ឍន៍ និងផលិតកម្ម។

1. **បង្កើតបរិបទផលិតកម្ម:**
```bash
azd env new myai-production
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រពិសេសសម្រាប់ផលិតកម្ម:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

ឈ្មោះទាំងនេះមកពី [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) របស់គំរូ។ `azd env set` រក្សាទុកតម្លៃ មិនបណ្តាលអោយអថេរណាមួយមានប្រសិទ្ធិភាពទេ៖ គំរូត្រូវប្រើវា។ សូមពិនិត្យមើល [មគ្គុទេសក៍បំបែកបណ្តាញ](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) មុនពេលបិទចូលសាធារណៈ ហើយប្រើ `azd up` ដើម្បីអនុវត្តការផ្លាស់ប្តូរស្ថាបត្យកម្ម។ OpenAI SKU `S0` តែម្នាក់ឯងមិនកំណត់មធ្យមទិន្នផលម៉ូដែលទេ; ប្រភេទនិងសមត្ថភាពនៃការដាក់បញ្ចូលម៉ូដែលក៏មានសារៈសំខាន់ផងដែរ។

### **លំហាត់មន្ទីរ 3.1: បញ្ហាកាត់បន្ថយថ្លៃដើម**

**បញ្ហា:** កំណត់រចនាសម្ព័ន្ធក្រុមគំរូសម្រាប់កាត់បន្ថយថ្លៃដើមនៅក្នុងការអភិវឌ្ឍន៍។

**ភារកិច្ច:**
1. ជ្រើសបរិបទវគ្គបណ្តុះបណ្តាលដែលអាចលុបចោលបាន: `azd env select myai-workshop`។
2. កត់ត្រាសេវា Search SKU និងសមត្ថភាពម៉ូដែលបច្ចុប្បន្នពី `infra/main.parameters.json` និងបរិបទបានជ្រើសរើស។
3. ប្រើបញ្ចូលដែលគាំទ្រខាងក្រោម បន្ទាប់ពីបញ្ជាក់តម្រូវម៉ូដែល/តំបន់:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. ពិនិត្យ Search SKU និងសមត្ថភាពដាក់បញ្ចូលនៅក្នុងផតថល ហើយគណនាការប្រៀបធៀបជាមួយគណនាថ្លៃ។ កុំរំពឹងថាបានទិន្នន័យវិក័យប័ត្រប្រែប្រួលភ្លាមៗ។

**លក្ខខណ្ឌជោគជ័យ:** Search ប្រើ Basic, ការដាក់បញ្ចូល chat មានសមត្ថភាពចាំបាច់ និងកម្មវិធីនៅតែឆ្លើយសំណួរគំរូ។ សមត្ថភាព `10` គឺជាការចែកចាយការកំណត់កម្រិត ចូរប្រយ័ត្នមិនមែនជាថ្លៃបញ្ចុះតម្លៃតូកិន។ ការផ្លាស់ប្តូរទ្រង់ទ្រាយ Search អាចមានកំណត់ឬតម្រូវឲ្យបង្កើតឡើងវិញ; កុំសាកល្បងលើធនធានផលិតកម្ម។ F0 ជាសេវាពិសេសហើយមិនមែន SKU ម៉ូដែល Azure OpenAI ទេ។

## មេរៀន 4៖ សុវត្ថិភាព និងការអនុវត្តល្អបំផុតនៅផលិតកម្ម

### ជំហាន 4.1៖ ការគ្រប់គ្រងសញ្ញាបត្រដោយសុវត្ថិភាព

**បញ្ហាបច្ចុប្បន្ន:** កម្មវិធី AI ច្រើនបញ្ចូល API key រឺរក្សាទុកមិនសុវត្ថិភាព។

**ដំណោះស្រាយ AZD:** ភាពសម្គាល់គ្រប់គ្រង + ការតភ្ជាប់ Key Vault។

1. **ពិនិត្យការកំណត់សុវត្ថិភាពក្នុងគំរូរបស់អ្នក:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **ផ្ទៀងផ្ទាត់ Managed Identity ដំណើរការ:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### ជំហាន 4.2៖ សុវត្ថិភាពបណ្តាញ

1. **បើកការចុះភ្ជាប់ចុងបញ្ចប់ឯកជន** ប្រើការកំណត់បណ្តាញគាំទ្ររបស់គំរូ (បើមិនទាន់កំណត់)។

សម្រាប់គំរូរបស់អ្នកផ្ទាល់ វាកែងបង្ហាញនៃការតភ្ជាប់ចុងបញ្ចប់ OpenAI។ វាត្រូវការបញ្ចូល VNet, ការកំណត់ DNS ឯកជន និងការតភ្ជាប់កម្មវិធី ផងដែរ; កុំបញ្ចូលតែមួយដោយមិនផ្លាស់ប្តូរចូលក្នុងគំរូដែលមានម៉ូឌុលចុងបញ្ចប់ឯកជនរួចហើយ៖
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### ជំហាន 4.3៖ ការត្រួតពិនិត្យ និងការមើលឃើញ

1. **កំណត់ Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **បើកការរួមបញ្ចូល Application Insights របស់គំរូ:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

ឧបករណ៍ឆ្លងកាត់របស់គំរូបញ្ចេញទិន្នន័យ telemetry; ការកំណត់ arbitray `OPENAI_MONITOR_ENABLED` មិនបើកអត្រាណ៍ AI តាមស្តង់ដារ។ សូមពិនិត្យស្គាល់ហេតុប្រតិកម្មម៉ូដែល ល្បឿន បរាជ័យ និងការប្រើតូកិន ហើយជៀសវាងកត់ត្រា prompt ឬចម្លើយសម្ងាត់។

### **លំហាត់មន្ទីរ 4.1: ការត្រួតពិនិត្យសុវត្ថិភាព**

**ភារកិច្ច:** ពិនិត្យការដាក់បញ្ចូលរបស់អ្នកចំពោះអនុវត្តល្អបំផុតសុវត្ថិភាព។

**បញ្ជីត្រួតពិនិត្យ:**
- [ ] គ្មានសម្ងាត់ត្រូវបានដាក់កូដឬការកំណត់
- [ ] ប្រើ Managed Identity សម្រាប់ការផ្ទៀងផ្ទាត់សេវាកម្ម
- [ ] Key Vault រក្សាទុកការកំណត់សំងាត់
- [ ] បណ្តាញមានការកំណត់ឲ្យត្រឹមត្រូវ
- [ ] ការត្រួតពិនិត្យ និងកំណត់ហេតុបានបើក

## មេរៀន 5៖ ការបម្លែងកម្មវិធី AI របស់អ្នក

### ជំហាន 5.1៖ មេរាយការ៉ាថ៍ប៉ារ៉ាម៉ែត្រ

**មុនបម្លែងកម្មវិធីរបស់អ្នក**, ឆ្លើយសំណួរទាំងនេះ៖

1. **រចនាសម្ព័ន្ធកម្មវិធី:**
   - កម្មវិធីរបស់អ្នកប្រើសេវា AI អ្វីខ្លះ?
   - តើវាត្រូវការធនធានគណនាចំណុចណា?
   - តើវាត្រូវការទិន្នន័យមូលដ្ឋានឬទេ?
   - តើអ្វីខ្លះជាលក្ខខណ្ឌចាំបាច់ក្នុងសេវាដែលវាហាក់បង់ក្នុង?

2. **តម្រូវការសុវត្ថិភាព៖**
   - តើទិន្នន័យសំងាត់ណាអ្នកចាត់ការរបស់កម្មវិធី?
   - តើអ្នកមានតម្រូវការទៀងទាត់ត្រឹមត្រូវអ្វីក្នុងការអនុវត្ត?
   - តើអ្នកត្រូវការបណ្តាញឯកជនឬទេ?

3. **តម្រូវការកំណត់អតិថិជនបន្ថែម:**
   - តើបន្ទុកដែលអ្នករំពឹងទុកជាអ្វី?
   - តើអ្នកត្រូវការកំណត់អតិថិជនដោយស្វ័យប្រវត្តិឬទេ?
   - តើមានតម្រូវការតំបន់តំបន់ណាដែលត្រូវគិត?

### ជំហាន 5.2៖ បង្កើតគំរូ AZD របស់អ្នក

**អនុវត្តតាមគំរូនេះដើម្បីបម្លែងកម្មវិធីរបស់អ្នក៖**

**គ្រប់ផ្នែក scaffolding ប៉ុណ្ណោះ៖** ផ្នែកនេះមិនផ្ដល់ជូនកូដAPI/កម្មវិធីបណ្ដាញ, រោងចក្រសំណង់ម៉ាស៊ីន, ការដាក់បញ្ចូលម៉ូដែល សម្គាល់តួនាទី/RBAC, ឬ `main.parameters.json` ដែលបានបញ្ចប់។ Bicep សម្រាប់ក្រុមធនធានបង្ហាញរចនាសម្ព័ន្ធម៉ូឌុល; ចំណុចចូល AZD ជាទូទៅត្រូវបង្កើតក្រុមធនធាន និងហៅវានៅក្នុងលំនាំនោះ។ កុំរំពឹងថា `azd up` នឹងដាក់បញ្ចូលកម្មវិធីពេញលេញ បន្ទាប់ពីចម្លងតែមុខងារនេះទេ។ សម្រាប់មូលដ្ឋានដំណើរការ ចូរបន្តប្រើគំរូ RAG ពីមេរៀន 1។

1. **បង្កើតរចនាសម្ព័ន្ធមូលដ្ឋាន:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **បង្កើត azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **បង្កើតគំរូសំណង់ស្ថាបត្យកម្ម:**

**infra/main.bicep** - គំរូសំខាន់:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - ម៉ូឌុល OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **លំហាត់មន្ទីរ 5.1: ការបង្កើតគំរូការតស៊ូ**

**បញ្ហា៖** បង្កើតគំរូ AZD សម្រាប់កម្មវិធី AI ដំណើរការឯកសារ។

**តម្រូវការ៖**
- Microsoft Foundry Models សម្រាប់វិភាគប្រធានបទ
- Document Intelligence សម្រាប់ OCR
- Storage Account សម្រាប់ការចុះឯកសារ
- Function App សម្រាប់ចលនា logic
- កម្មវិធីបណ្ដាញសម្រាប់ចំណុចប្រើប្រាស់

**ពិន្ទុបន្ថែម៖**
- បន្ថែមការចាប់ផ្តើមករណីកំហុសត្រឹមត្រូវ
- រួមបញ្ចូលការគណនាតម្លៃ
- រៀបចំផ្ទាំងត្រួតពិនិត្យការត្រួតពិនិត្យ

## មេរៀន 6៖ ដោះស្រាយបញ្ហាទូទៅ

### បញ្ហាទូទៅរបស់ការដាក់បញ្ចូល

#### បញ្ហា 1: បរិមាណបម្រើសេវា OpenAI លើសកំណត់
**រោគសញ្ញា:** ការដាក់បញ្ចូលបរាជ័យដោយកំហុសបរិមាណ
**ដំណោះស្រាយ:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### បញ្ហា 2: ម៉ូដែលមិនមានក្នុងតំបន់
**រោគសញ្ញា:** ចម្លើយ AI បរាជ័យ ឬកំហុសការដាក់បញ្ចូលម៉ូដែល
**ដំណោះស្រាយ:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### បញ្ហា 3: បញ្ហាសិទ្ធិ
**រោគសញ្ញា:** កំហុស 403 បារាំងពេលហៅសេវា AI
**ដំណោះស្រាយ:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### បញ្ហាទំនើប

#### បញ្ហា 4: ចម្លើយ AI យឺត
**ជំហានស៊ើបអង្កេត:**
1. ពិនិត្យ Application Insights សម្រាប់មាតិកាអនុវត្ត
2. ពិនិត្យមើលមាតិកាសេវា OpenAI ក្នុងផតថល Azure
3. ផ្ទៀងផ្ទាត់ការតភ្ជាប់បណ្តាញ និងល្បឿនយឺត

**ដំណោះស្រាយ:**
- អនុវត្តការស្កេនសម្រាប់សំណួរតម្លើងខ្ពស់
- ប្រើម៉ូដែល OpenAI ដែលសមរម្យសម្រាប់ករណីប្រើប្រាស់របស់អ្នក
- ពង្រីកចំលងកម្មវិធីតែបន្ទាប់ពីពិនិត្យកម្រិត RPM/TPM ម៉ូដែល; ការដាក់បញ្ចូល Azure OpenAI មិនបង្ហាញការកំណត់ "read replica" រចនាសម្ព័ន្ធទូទៅ

### **លំហាត់មន្ទីរ 6.1: ការចាប់ផ្ដើមដោះស្រាយបញ្ហា**

**ស្ថានការណ៍:** ការដាក់បញ្ចូលរបស់អ្នកបានជោគជ័យ ប៉ុន្តែកម្មវិធីបញ្ជូនកំហុស 500។

**ភារកិច្ចដោះស្រាយបញ្ហា:**
1. ពិនិត្យកំណត់ហេតុកម្មវិធី
2. ផ្ទៀងផ្ទាត់ការតភ្ជាប់សេវា
3. សាកល្បងការផ្ទៀងផ្ទាត់
4. ពិនិត្យការកំណត់រចនា

**ឧបករណ៍ដែលត្រូវប្រើ:**
- `azd show` សម្រាប់ទិដ្ឋភាពទូទៅនៃការចុះផ្សាយ
- វេបសាយ Azure សម្រាប់កំណត់ហេតុសេវាកម្មលម្អិត
- Application Insights សម្រាប់ព័ត៌មានបញ្ជាក់កម្មវិធី

## ម៉ូឌុលទី 7: ការត្រួតពិនិត្យ និងការបង្កើតប្រសិទ្ធភាព

### ជំហាន 7.1: បង្កើតការត្រួតពិនិត្យទូទៅ

1. **បង្កើតផ្ទាំងគ្រប់គ្រងផ្ទាល់ខ្លួន៖**

ចូលទៅវេបសាយ Azure បង្កើតផ្ទាំងគ្រប់គ្រងជាមួយ៖
- ចំនួនសំណើ OpenAI និងពេលពន្យារពេល
- អត្រាចំហោចកម្មវិធី
- ការប្រើប្រាស់ធនធាន
- ការតាមដានថ្លៃដើម

2. **ដំឡើងការជូនដំណឹង៖**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

ធ្វើការត្រួតពិនិត្យថាផ្នែកផ្សំផ្ញើព័ត៌មានបញ្ជាក់សំណើ និងបន្ថែមក្រុមសកម្មភាព ប្រសិនបើតម្រូវការជូនដំណឹង។ មាត្រដ្ឋានគឺជាចំនួន មិនមែនភាគរយភាពបរាជ័យទេ; សញ្ញាបញ្ជូនត្រូវការជំហានសួរដោយសមស្រប និងដេណូមីណេទ័រ។

### ជំហាន 7.2: ការបង្កើតប្រសិទ្ធភាពថ្លៃដើម

1. **វិភាគថ្លៃដើមបច្ចុប្បន្ន៖**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

ជំនួសកន្លែងដាក់កាលបរិច្ឆេទ។ ការគាំទ្រ API ប្រើប្រាស់ឡើងចន្លោះតាមកិច្ចសន្យា; ប្រើគ្រប់គ្រងថ្លៃដើមនៅក្នុងវេបសាយ ប្រសិនបើពត៌មានមិនមាន។ ថ្លៃដើមមានការពន្យាពេល មិនមែនការប្រលងពេលវេលាពេញមួយទេ។

2. **អនុវត្តការគ្រប់គ្រងថ្លៃដើម៖**
- ដំឡើងការជូនដំណឹងថវិកា
- ប្រើគោលនយោបាយអូតូស្កែល
- អនុវត្តការផ្ទុកក្នុំសំណើ
- ត្រួតពិនិត្យការប្រើសញ្ញាសម្រាប់ OpenAI

### **មហិច្ឆតាការណ៍ 7.1: ការបង្កើតប្រសិទ្ធភាពសមត្ថភាព**

**ភារកិច្ច**: បង្កើតប្រសិទ្ធភាពកម្មវិធី AI របស់អ្នកទាំងសមត្ថភាព និងថ្លៃដើម។

**មាត្រដ្ឋានដែលត្រូវកែលម្អ:**
- កាត់បន្ថយពេលចម្លើយមធ្យមចុះ ២០%
- កាត់បន្ថយថ្លៃដើមប្រចាំខែចុះ ១៥%
- កំណត់ SLO មានភាពចំណាយ ៩៩.៩% និងបង្ហាញបង្អួចវាស់វែង (មហិច្ឆតាប្រលងខ្សែខ្លីមិនអាចបង្ហាញការផ្តល់សេវាបានខែច្បាស់)

**យុទ្ធសាស្រ្តដែលត្រូវសាកល្បង:**
- អនុវត្តផ្ទុកសំណើចម្លើយ
- បង្កើតប្រសិទ្ធភាពសំណើសម្រាប់ការប្រើប្រាស់សញ្ញា
- ប្រើ SKU គណនាសមរម្យ
- ដំឡើងអូតូស្កែលត្រឹមត្រូវ

## ការប្រលងចុងក្រោយ៖ ការអនុវត្តពីដើមដល់ចប់

### សេណារីយ៉ូការប្រលង

នេះគឺជាការប្រលងស្ថាបត្យកម្ម/រចនាបណ្តោះអាសន្នមួយ អ្វីដែលមិនមែនជាការប្រលងរត់បានឬវិញ្ញាបនបត្រផលិតកម្ម។ សូមស្នើសុំបង្កើត chatbot សេវាកម្មអតិថិជនដោយប្រើ AI ហើយសរសេរឯកសារចំលើយដែលត្រូវការអនុវត្តបន្ថែម និងភស្តុតាង៖

**សម្បត្តិការងារសកម្មភាព៖**
- មុខងារផ្ទាំងវេបសម្រាប់ការប្រាស្រ័យអតិថិជន
- ការតភ្ជាប់ជាមួយ Microsoft Foundry Models សម្រាប់ចម្លើយ
- សមត្ថភាពស្វែងរកឯកសារប្រើប្រាស់ Azure AI Search
- ការតភ្ជាប់ជាមួយមូលដ្ឋានទិន្នន័យអតិថិជនស្រាប់
- គាំទ្រភាសាច្រើន

**សម្បត្តិការងារមិនសកម្មភាព៖**
- គ្រប់គ្រងអ្នកប្រើប្រាស់ ១០០០ នាក់ប្រើប្រាស់ក្នុងពេលតែមួយ
- SLA មានភាពចំណាយ ៩៩.៩%
- ត្រូវសំភារៈ SOC 2
- ថ្លៃមិនលើស $៥០០/ខែ
- ចុះផ្សាយទៅបរិយាកាសច្រើន (អភិវឌ្ឍន៍, ស្ថាបនាជាក់លាក់, ផលិតកម្ម)

ទាំងនេះជាលក្ខខណ្ឌរបស់អ្នកមានភាគីចូលរួមបង្ហាញមិនមែនជាលទ្ធផលធ្វើបានជាបន្ទាប់គ្នា។ សូមកំណត់អត្រាសំណើ ទំហំសំណើ/ចម្លើយ និងរយៈពេលសម្ងាត់ មុនពេលប៉ាន់ប្រមាណថ្លៃដើម; ១០០០ នាក់ប្រើប្រាស់ក្នុងពេលតែមួយមិនបានបង្កើត និងមិនបញ្ជាក់ថថ្លៃដើម $៥០០ អាចសម្រួលបានទេ។ SOC 2 គឺជាលទ្ធផលពិនិត្យអង្គភាព មិនមែនជាជម្រើសចុចបើកដោយពណ៌ AZD ទេ។ សូមកំណត់ការជួញដូរ និងបដិសេធលក្ខខណ្ឌមិនអាចធ្វើទៅបានជាមួយភស្តុតាង។

### ជំហានអនុវត្ត

1. **រចនាស្ថាបត្យកម្ម**
2. **បង្កើតព្រឹត្តិការណ៍ AZD**
3. **អនុវត្តវិធានសុវត្ថិភាព**
4. **ដំឡើងការត្រួតពិនិត្យ និងការជូនដំណឹង**
5. **បង្កើតខ្សែដំណើរការចុះផ្សាយ**
6. **សរសេរឯកសារដំណោះស្រាយ**

### ក្រមបរិច្ឆេទវាយតម្លៃ

- ✅ **មុខងារ**: តើសមត្ថភាពដែលបានអនុវត្តបង្ហាញ និងភាពខ្វះខាតនៅសល់ច្បាស់លាស់?
- ✅ **សុវត្ថិភាព**: តើអនុវត្តអព្យាក្រឹតិ៍មាតិកល្អបំផុត?
- ✅ **ការវែងខ្ជិល**: តើវាអាចដោះស្រាយទំងន់បានទេ?
- ✅ **ការរក្សាទុកបានងាយ**: តើកូដនិងហេដ្ឋារចនាសម្ព័ន្ធរៀបចំបានល្អឬ?
- ✅ **ថ្លៃដើម**: តើវាចៀសវាងការចំណាយលើថវិកា?

## អនុគ្រឿងបន្ថែម

### ឯកសាររបស់ Microsoft
- [ឯកសារ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ឯកសារសេវាកម្ម Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [ឯកសាររបស់ Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### គំរូរបស់ Microsoft
- [កម្មវិធីជជែក Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [ការចាប់ផ្តើមកម្មវិធីជជែក OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### បរិយាកាសសហគមន៍
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [គំរូ AZD អស្ចារ្យ](https://azure.github.io/awesome-azd/)

## 🎓 ចំណុចពិនិត្យការសម្រេច

អបអរសាទរ! អ្នកបានបញ្ចប់មហិច្ឆតាការងារ AI Workshop។ ឥឡូវនេះអ្នកគួរតែអាច៖

- ✅ ពន្យល់ពីវិធីបត់បែនកម្មវិធី AI ដែលមានទៅកាន់ប្លង់ AZD
- ✅ ចុះផ្សាយ និងសាកល្បងកម្មវិធីយោង AI
- ✅ អនុវត្តអព្យាក្រឹតិ៍សុវត្ថិភាពល្អបំផុតសម្រាប់ការងារ AI
- ✅ ត្រួតពិនិត្យ និងបង្កើតប្រសិទ្ធភាពកម្មវិធី AI
- ✅ ដោះស្រាយបញ្ហាចុះផ្សាយសាមញ្ញៗ

**សម្អាត៖** ប្រតិបត្តិ `azd env list` ជ្រើសរើសបរិយាកាសដែលអាចលុបបានក្នុងមហិច្ឆតានេះ (`myai-workshop`, ហើយបើបានចុះផ្សាយ `myai-production`/`myai-quota-test`) ហើយប្រតិបត្តិ `azd down` ក្នុងរៀងរាល់មួយ។ ពិនិត្យផែនការលុប បាត់បង់ការកំណត់ក្នុងតែបរិយាកាសមិនបានលុបធនធាន Azure។ ប្រយ័ត្នកុំប្រើ `--purge` លុបធនធានទន់ដែលមិនអាចយកមកវិញបាន លុះត្រាតែអ្នកយល់ច្បាស់។

### ជំហានបន្ទាប់
1. ដាក់បែបបទទាំងនេះទៅក្នុងគម្រោង AI របស់អ្នក
2. ឧបត្ថម្ភគំរូមកសហគមន៍វិញ
3. ចូលរួមក្រុម Microsoft Foundry Discord សម្រាប់ការគាំទ្របន្ត
4. ស្ទង់អំពីប្រធានបទជាក់លាក់ដូចជាការចុះផ្សាយច្រើនតំបន់

---

**មតិផ្សព្វផ្សាយមហិច្ឆតា**: ជួយយើងកែលម្អមហិច្ឆតានេះដោយចែករំលែកបទពិសោធន៍របស់អ្នកនៅក្នុង [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure)។

---

**ការរុករកជារួមរៀងរាល់ជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកថ្មី](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍន៍ AI ជាដំបូង
- **⬅️ មុននេះ**: [ការចុះផ្សាយម៉ូដែល AI](ai-model-deployment.md)
- **➡️ បន្ទាប់**: [ការអនុវត្តសុវត្ថិភាពល្អបំផុតក្នុងផលិតកម្ម AI](../chapter-08-production/production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយ?** ចូលរួមសហគមន៍របស់យើងសម្រាប់ការគាំទ្រ និងការពិភាក្សាអំពី AZD និងការចុះផ្សាយ AI។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
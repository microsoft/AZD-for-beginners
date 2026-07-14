# ការបង្កើតមហាផ្ទះ AI: ធ្វើឲ្យដំណោះស្រាយ AI របស់អ្នកអាចប្រើ AZD-Deployable

**ការរុករកជាប់៖**
- **📚 ទំព័រផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI ជាដំបូង
- **⬅️ មុន**: [ការដាក់បង្ហោះម៉ូដែល AI](ai-model-deployment.md)
- **➡️ បន្ទាប់**: [អនុវត្តិល្អ AI ផលិតកម្ម](production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

## ទិដ្ឋភាពស្ដីពីមហាសិក្សា

មហាសិក្សានេះនាំអ្នកអភិវឌ្ឍឆ្ពោះទៅរកដំណើរការទូទាត់មួយដែលយកគំរូ AI ដែលមានស្រាប់ និងដាក់បង្ហោះវា ដោយប្រើ Azure Developer CLI (AZD)។ អ្នកនឹងរៀនពីលំនាំសំខាន់ៗសម្រាប់ការដាក់បង្ហោះ AI ផលិតកម្ម ដោយប្រើសេវាកម្ម Microsoft Foundry។

> **សេចក្តីផ្ទៀងផ្ទាត់ (2026-07-13):** មហាសិក្សានេះត្រូវបានពិនិត្យជាមួយ `azd` `1.27.1`។ ប្រសិនបើការតំឡើងក្នុងតំបន់របស់អ្នកចាស់ជាងនេះ សូមធ្វើបច្ចុប្បន្នភាព AZD មុនចាប់ផ្តើម ដើម្បីឲ្យការផ្ទៀងផ្ទាត់សិទិ្ធ ចំណុចគំរូ និងដំណើរការដាក់បង្ហោះត្រូវគ្នានឹងជំហានខាងក្រោម។

**រយៈពេល៖** 2-3 ម៉ោង  
**កម្រិត៖** មធ្យម  
**លក្ខខណ្ឌមុន៖** ចំណេះដឹងមូលដ្ឋាន Azure, ស្គាល់គំនិត AI/ML

## 🎓 វិស័យសិក្សា

នៅចុងបញ្ចប់នៃមហាសិក្សានេះ អ្នកអាច៖
- ✅ បម្លែងកម្មវិធី AI ដែលមានស្រាប់ឲ្យប្រើគំរូ AZD
- ✅ កំណត់សេវាកម្ម Microsoft Foundry ជាមួយ AZD
- ✅ អនុវត្តការគ្រប់គ្រង​ការ​សុវត្ថិភាព​រ៉ែ​សម្រាប់សេវា AI
- ✅ ដាក់បង្ហោះកម្មវិធី AI សម្រាប់ផលិតកម្មជាប្រព័ន្ធ​មើលថែ
- ✅ ដោះស្រាយបញ្ហាប្រឈមក្នុងការដាក់បង្ហោះ AI ជាធម្មតា

## លក្ខខណ្ឌមុន

### ឧបករណ៍ត្រូវការ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ត្រូវបានតំឡើង
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ត្រូវបានតំឡើង
- [Git](https://git-scm.com/) ត្រូវបានតំឡើង
- កម្មវិធីកែសម្រួលកូដ (ផ្នែកណែនាំ VS Code)

### ប្រភព Azure
- មូលនិធិ Azure ដោយមានសិទិ្ធរួមចំណែក
- ការចូលប្រើសេវាកម្ម Microsoft Foundry Models (ឬសង្ឃឹមបានសិទិ្ធចូល)
- សិទិ្ធបង្កើតក្រុមធនធាន

### ចំណេះដឹងមុន
- យល់ដឹងមូលដ្ឋានពីសេវាកម្ម Azure
- ស្គាល់ការប្រើប្រាស់ Command-line
- គំនិតមូលដ្ឋាននៃ AI/ML (API, ម៉ូដែល, បង្ហាញឲ្យរំលឹក)

## ការតំឡើងមហាសិក្សា

### ជំហាន 1: ត្រៀមតំបន់បរិយាកាស

1. **ផ្ទៀងផ្ទាត់ការតំឡើងឧបករណ៍:**
```bash
# ពិនិត្យការដំឡើង AZD
azd version

# ពិនិត្យ Azure CLI
az --version

# ចូលទៅកាន់ Azure សម្រាប់នីតិវិធី AZD
azd auth login

# ចូលទៅកាន់ Azure CLI តែបើអ្នកមានផែនការប្រើបញ្ជា az ក្នុងកំឡុងពេលវាយតម្លៃ
az login
```

ប្រសិនបើអ្នកធ្វើការ ក្នុងចំណោម tenants ច្រើន ឬមិនរកឃើញ subscription ដោយស្វ័យប្រវត្តិ ចាំបាច់សាកល្បងម្តងទៀតជាមួយ `azd auth login --tenant-id <tenant-id>។

2. **ស្កេន kho lưu trữ វគ្គសិក្សា:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## មេរៀន 1: យល់ដឹងអំពីរចនាសម្ព័ន្ធ AZD សម្រាប់កម្មវិធី AI

### រចនាសម្ព័ន្ធមូលដ្ឋានរបស់គំរូ AI AZD

សិក្សាឯកសារសំខាន់ៗក្នុងគំរូ AZD សម្រាប់ AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **លំហ.exercise 1.1: សិក្សារចនាសម្ព័ន្ធ**

1. **ពិនិត្យ​ឯកសារ azure.yaml:**
```bash
cat azure.yaml
```

**អ្វីដែលត្រូវស្វែងរក៖**
- ការបញ្ជាក់សេវាកម្មសម្រាប់ធាតុ AI
- ការប្រែប្រួលបរិយាកាស
- ការកំណត់ម៉ាស៊ីនបម្រើ

2. **ពិនិត្យរចនាសម្ព័ន្ធ main.bicep ៖**
```bash
cat infra/main.bicep
```

**លំនាំ AI សំខាន់ដែលត្រូវរកឃើញ:**
- ការផ្គត់ផ្គង់សេវាកម្ម Microsoft Foundry Models
- ការរួមបញ្ចូល Azure AI Search
- ការគ្រប់គ្រងកូនសោដោយសុវត្ថិភាព
- ការកំណត់សុវត្ថិភាពបណ្ដាញ

### **ចំណុចពិភាក្សា៖** ហេតុអ្វីលំនាំទាំងនេះមានសារៈសំខាន់សម្រាប់ AI

- **អាស្រ័យភាពសេវា**: កម្មវិធី AI ច្រើនត្រូវការសេវាកម្មជាច្រើនសហគ្នា
- **សុវត្ថិភាព**: កូនសោ API និងចំណុចចូលត្រូវគ្រប់គ្រងយ៉ាងសុវត្ថិភាព
- **ការវាស់វែង**: បំណែកផ្ទុក AI មានតម្រូវការវាស់វែងឯកសារ
- **ការគ្រប់គ្រងថ្លៃដើម**: សេវា AI អាចមានថ្លៃច្រើន ប្រសិនបើមិនត្រូវបានកំណត់ត្រឹមត្រូវ

## មេរៀន 2: ដាក់បង្ហោះកម្មវិធី AI ដំបូងរបស់អ្នក

### ជំហាន 2.1: ចាប់ផ្តើមបរិយាកាស

1. **បង្កើតបរិយាកាស AZD ថ្មី:**
```bash
azd env new myai-workshop
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រដែលត្រូវការ:**
```bash
# កំណត់តំបន់ Azure ដែលអ្នកចូលចិត្ត
azd env set AZURE_LOCATION eastus

# ជាជម្រក: កំណត់ម៉ូដែល OpenAI ជាក់លាក់
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ជំហាន 2.2: ដាក់បង្ហោះហេដ្ឋារចនាសម្ព័ន្ធ និងកម្មវិធី

1. **ដាក់បង្ហោះជាមួយ AZD:**
```bash
azd up
```

**អ្វីដែលកើតឡើងនៅពេល `azd up`:**
- ✅ បង្កើតសេវាកម្ម Microsoft Foundry Models
- ✅ បង្កើតសេវាកម្ម Azure AI Search
- ✅ កំណត់ App Service សម្រាប់កម្មវិធីវេប
- ✅ កំណត់បណ្តាញ និងសុវត្ថិភាព
- ✅ ដាក់បង្ហោះកូដកម្មវិធី
- ✅ បង្កើតការត្រួតពិនិត្យ និងកំណត់ហេតុ

2. **ត្រួតពិនិត្យដំណើរការដាក់បង្ហោះ** ហើយកត់សម្គាល់ធនធានដែលត្រូវបានបង្កើត។

### ជំហាន 2.3: ផ្ទៀងផ្ទាត់ការដាក់បង្ហោះរបស់អ្នក

1. **ពិនិត្យធនធានដែលបានដាក់បង្ហោះ:**
```bash
azd show
```

2. **បើកកម្មវិធីដែលបានដាក់បង្ហោះ:**
```bash
azd show
```

បើកចំណុចចូលវេបដែលបង្ហាញនៅលើលទ្ធផល `azd show`។

3. **សាកល្បងមុខងារ AI:**
   - ចូលទៅកាន់កម្មវិធីវេប
   - ព្យាយាមសំណួរឧទាហរណ៍
   - ផ្ទៀងផ្ទាត់ឆ្លើយតប AI

### **លំហ.exercise 2.1: សម្រួលបញ្ហាទូទៅ**

**ស្ថានភាព**: ការដាក់បង្ហោះរបស់អ្នកបានជោគជ័យ ប៉ុន្តែ AI មិនឆ្លើយតប។

**បញ្ហាទូទៅដែលត្រូវពិនិត្យ៖**
1. **កូនសោ API OpenAI**៖ ផ្ទៀងផ្ទាត់ថាត្រូវបានកំណត់ត្រឹមត្រូវ
2. **ស្ថិតិម៉ូដែល**៖ ពិនិត្យថាថ្នាក់តំបន់របស់អ្នកគាំទ្រម៉ូដែល
3. **ការតភ្ជាប់បណ្ដាញ**៖ ដើម្បីធានាសេវាកម្មអាចទំនាក់ទំនងបាន
4. **សិទិ្ធ RBAC**៖ ផ្ទៀងផ្ទាត់កម្មវិធីអាចចូលប្រើ OpenAI បាន

**ពាក្យបញ្ជាការសំរាប់ដោះស្រាយបញ្ហា៖**
```bash
# ពិនិត្យអថេរបរិស្ថាន
azd env get-values

# មើលកំណត់ហេតុការចេញផ្សាយ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ពិនិត្យស្ថានភាពចេញផ្សាយ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## មេរៀន 3: ប្ដូរកម្មវិធី AI សម្រាប់តម្រូវការរបស់អ្នក

### ជំហាន 3.1: កែសម្រួលការកំណត់ AI

1. **បច្ចុប្បន្នភាពម៉ូដែល OpenAI:**
```bash
# ប្តូរទៅម៉ូដែលផ្សេងទៀត (បើមាននៅក្នុងតំបន់របស់អ្នក)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# បញ្ចូនឡើងវិញជាមួយការកំណត់រចនាសម្ព័ន្ធថ្មី
azd deploy
```

2. **បន្ថែមសេវាកម្ម AI ផ្សេងទៀត:**

កែសម្រួល `infra/main.bicep` ដើម្បីបន្ថែម Document Intelligence:

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

### ជំហាន 3.2: ការកំណត់តំបន់បរិយាកាសជាក់លាក់

**អនុវត្តិល្អបំផុត**: ការកំណត់ខុសគ្នារបស់ការអភិវឌ្ឍនៅថ្ងៃរក្សាទុក និងផលិតកម្ម។

1. **បង្កើតបរិយាកាសផលិតកម្ម:**
```bash
azd env new myai-production
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រពិសេសផលិតកម្ម:**
```bash
# ផលិតកម្មប្រើប្រាស់ SKU ខ្ពស់ជាទូទៅ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# បើកការពារផ្នែកសន្តិសុខបន្ថែម
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **លំហ.exercise 3.1: ការសម្រួលថ្លៃដើម**

**បញ្ហា**: កំណត់គំរូសម្រាប់ការអភិវឌ្ឍឲ្យមានថ្លៃដើមសមរម្យ។

**ភារកិច្ច:**
1. កំណត់ SKU ដែលអាចកំណត់ជាតំបន់ឥតគិតថ្លៃ/មូលដ្ឋាន
2. កំណត់អថេរបរិយាកាសសម្រាប់ថ្លៃដើមតិចបំផុត
3. ដាក់បង្ហោះ និងប្រៀបធៀបថ្លៃដើមជាមួយការកំណត់ផលិតកម្ម

**ជំនួយដោះស្រាយ:**
- ប្រើ F0 (អត្រាឥតគិតថ្លៃ) សម្រាប់សេវា Azure AI នៅពេលអាចធ្វើបាន
- ប្រើមូលដ្ឋានសម្រាប់ Search Service ក្នុងការអភិវឌ្ឍ
- ពិចារណាប្រើផែនការបរិភោគសម្រាប់ Functions

## មេរៀន 4: សុវត្ថិភាព និងអនុវត្តិល្អផលិតកម្ម

### ជំហាន 4.1: ការគ្រប់គ្រង​សញ្ញាប័ត្រ​មានសុវត្ថិភាព

**បញ្ហាបច្ចុប្បន្ន**: កម្មវិធី AI ច្រើនពុំបង្កើតកូនសោ API ឬប្រើការផ្ទុកមិនសុវត្ថិភាព។

**ដំណោះស្រាយ AZD**: ការរួមបញ្ចូលអត្តសញ្ញាណគ្រប់គ្រង + Key Vault។

1. **ពិនិត្យការកំណត់សុវត្ថិភាពក្នុងគំរូរបស់អ្នក:**
```bash
# ស្វែងរកការកំណត់ Key Vault និង Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **ផ្ទៀងផ្ទាត់អត្តសញ្ញាណគ្រប់គ្រងដំណើរការ:**
```bash
# ពិនិត្យមើលថាតើកម្មវិធីវេបមានការកំណត់អត្តសញ្ញាណត្រឹមត្រូវឬទេ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ជំហាន 4.2: សុវត្ថិភាពបណ្តាញ

1. **បើកចំណុចចូលឯកជន** (ប្រសិនបើមិនបានកំណត់រួច):

បន្ថែមទៅក្នុងគំរូប៊ិចរបស់អ្នក:
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

### ជំហាន 4.3: ការត្រួតពិនិត្យ និងច្បាប់ការគ្រប់គ្រង

1. **កំណត់ Application Insights:**
```bash
# Application Insights គួរតែត្រូវបានកំណត់តម្លៃដោយស្វ័យប្រវត្តិ
# ពិនិត្យការកំណត់តម្លៃ៖
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **បង្កើតការត្រួតពិនិត្យ​ពិសេសសម្រាប់ AI:**

បន្ថែមពិសោធន៍បន្ថែមសម្រាប់ប្រតិបត្តិការណ៍ AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **លំហ.exercise 4.1: សោម្រង់សុវត្ថិភាព**

**ភារកិច្ច**: ពិនិត្យការដាក់បង្ហោះរបស់អ្នកសម្រាប់អនុវត្តិល្អសុវត្ថិភាព។

**បញ្ជីត្រួតពិនិត្យ:**
- [ ] គ្មានសម្ងាត់ផលិតក្នុងកូដឬការកំណត់រចនាសម្ព័ន្ធ
- [ ] ប្រើអត្តសញ្ញាណគ្រប់គ្រងសម្រាប់ការផ្ទៀងផ្ទាត់សេវាទៅសេវា
- [ ] Key Vault រក្សាទុកការកំណត់សំងាត់
- [ ] ការចូលបណ្តាញត្រូវបានកំណត់យ៉ាងត្រឹមត្រូវ
- [ ] ការត្រួតពិនិត្យ និងកំណត់ហេតុបានបើក

## មេរៀន 5: បម្លែងកម្មវិធី AI របស់អ្នកផ្ទាល់

### ជំហាន 5.1: ប័ណ្ណបច្ចេកទេសវាយតម្លៃ

**មុនបម្លែងកម្មវិធីរបស់អ្នក**, អ្នកត្រូវឆ្លើយសំណួរទាំងនេះ៖

1. **រចនាសម្ព័ន្ធកម្មវិធី:**
   - តើកម្មវិធីរបស់អ្នកប្រើសេវា AI អ្វីខ្លះ?
   - តើតំរូវធនធានគណនា អ្វីខ្លះ?
   - តើត្រូវការទិន្នន័យមូលដ្ឋានទេ?
   - តើមានអាស្រ័យភាពសេវាកម្មដូចម្តេច?

2. **តម្រូវការសុវត្ថិភាព:**
   - តើទិន្នន័យសំងាត់អ្វីដែលកម្មវិធីអ្នកដំណើរការទេ?
   - តើមានតម្រូវការប្រកបដោយការគោរពច្បាប់អ្វីខ្លះ?
   - តើត្រូវការបណ្តាញឯកជនទេ?

3. **តម្រូវការវាស់វែង:**
   - តើបន្ទុកដែលរំពឹងទុកមានប៉ុន្មាន?
   - តើត្រូវការវាស់វែងស្វ័យប្រវត្តិទេ?
   - តើមានតម្រូវការតំបន់ទេ?

### ជំហាន 5.2: បង្កើតគំរូ AZD របស់អ្នក

**ចូលរួមតាមលំនាំនេះដើម្បីបម្លែងកម្មវិធីរបស់អ្នក:**

1. **បង្កើតរចនាសម្ព័ន្ធមូលដ្ឋាន:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# ចាប់ផ្តើមប៉ាតឺន AZD
azd init --template minimal
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

3. **បង្កើតគំរូហេដ្ឋារចនាសម្ព័ន្ធ:**

**infra/main.bicep** - គំរូមេ៖
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

**infra/modules/openai.bicep** - ម៉ូឌុល OpenAI៖
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **លំហ.exercise 5.1: ការប្រឈមបង្កើតគំរូ**

**បញ្ហា**: បង្កើតគំរូ AZD សម្រាប់កម្មវិធី AI ដំណើរការឯកសារ។

**តម្រូវការជាក់លាក់:**
- Microsoft Foundry Models សម្រាប់វិភាគមាតិកា
- Document Intelligence សម្រាប់ OCR
- Storage Account សម្រាប់ផ្ទុកឯកសារ
- Function App សម្រាប់ដំណើរការទ្រឹស្តី
- កម្មវិធីវេបសម្រាប់ផ្ទាំងអ្នកប្រើ

**ពិន្ទុថែម:**
- បន្ថែមការគ្រប់គ្រងកំហុសត្រឹមត្រូវ
- រួមបញ្ចូលការវាយតម្លៃថ្លៃដើម
- កំណត់ផ្ទាំងត្រួតពិនិត្យ

## មេរៀន 6: ដោះស្រាយបញ្ហាទូទៅ

### បញ្ហាប្រឈមសំខាន់ក្នុងការដាក់បង្ហោះ

#### បញ្ហា 1: បរិមាណសេវា OpenAI លើសដែនកំណត់
**រាងរ៉ាម:** ការដាក់បង្ហោះបរាជ័យដោយកំហុសបរិមាណ
**ដំណោះស្រាយ:**
```bash
# ពិនិត្យមើល​ឥណ្ឌ្រិយភាព​បច្ចុប្បន្ន
az cognitiveservices usage list --location eastus

# ស្នើសុំបន្ថែម​ឥណ្ឌ្រិយភាព ឬ​សាកល្បងតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up
```

#### បញ្ហា 2: ម៉ូដែលមិនមាននៅតំបន់
**រាងរ៉ាម:** AI មិនឆ្លើយសំណួរឬកំហុសនៅពេលដាក់បង្ហោះម៉ូដែល
**ដំណោះស្រាយ:**
```bash
# ពិនិត្យមើលភាពមានស្រាប់នៃម៉ូដែលតាមតំបន់
az cognitiveservices model list --location eastus

# អាប់ដេតទៅម៉ូដែលដែលមានស្រាប់
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### បញ្ហា 3: បញ្ហាសិទិ្ធ
**រាងរ៉ាម:** កំហុស 403 Forbidden នៅពេលហៅសេវា AI
**ដំណោះស្រាយ:**
```bash
# ពិនិត្យការផ្តល់តួនាទី
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# បន្ថែមតួនាទីដែលខ្វះ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### បញ្ហាផលិតភាព

#### បញ្ហា 4: ឆ្លើយតប AI យឺត
**ជំហានស្ទង់មតិ:**
1. ពិនិត្យ Application Insights សម្រាប់មេត្រគុណផលិតភាព
2. ពិនិត្យមេត្រគុណសេវាកម្ម OpenAI ក្នុង Azure portal
3. ផ្ទៀងផ្ទាត់ការតភ្ជាប់បណ្ដាញ និងបដិសណ្ឋារកិច្ច

**ដំណោះស្រាយ:**
- អនុវត្តកន្លែងរក្សាទុកសំណួរញឹកញាប់
- ប្រើម៉ូដែល OpenAI ដែលសមស្របសម្រាប់ករណីរបស់អ្នក
- ពិចារណាផ្ទៀតថតប្រសិនបើបន្ទុកខ្ពស់

### **លំហ.exercise 6.1: ប្រឈមដោះស្រាយបញ្ហា**

**ស្ថានភាព**: ការដាក់បង្ហោះរបស់អ្នកជោគជ័យ ប៉ុន្តែកម្មវិធីបង្ហាញកំហុស 500។

**ភារកិច្ចសំរាប់ដោះស្រាយបញ្ហា:**
1. ពិនិត្យកំណត់ហេតុកម្មវិធី
2. ផ្ទៀងផ្ទាត់ការតភ្ជាប់សេវា
3. សាកល្បងការផ្ទៀងផ្ទាត់
4. ពិនិត្យរចនាសម្ព័ន្ធ

**ឧបករណ៍ប្រើប្រាស់:**
- `azd show` សម្រាប់មើលទិដ្ឋភាពដាក់បង្ហោះ
- Azure portal សម្រាប់កំណត់ហេតុសេវា​លម្អិត
- Application Insights សម្រាប់ឯកសារតេលីមេត្រីកម្មវិធី

## មេរៀន 7: ការត្រួតពិនិត្យ និង ការបង្កើនប្រសិទ្ធភាព

### ជំហាន 7.1: កំណត់ការត្រួតពិនិត្យពេញលេញ

1. **បង្កើតផ្ទាំងត្រួតពិនិត្យផ្ទាល់ខ្លួន:**

ចូលទៅកាន់ប៉តុមហិារដ្ឋ Azure ហើយបង្កើតផ្ទាំងត្រួតពិនិត្យដោយមាន៖
- ចំនួនសំណើ OpenAI និងបដិសណ្ឋារកិច្ច
- អត្រាកំហុសកម្មវិធី
- ការប្រើប្រាស់ធនធាន
- ការតាមដានថ្លៃដើម

2. **កំណត់ការជូនដំណឹង:**
```bash
# សំរាប់រោទិ៍កម្រិតបញ្ហាខ្ពស់
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ជំហាន 7.2: ការសម្រួលថ្លៃដើម

1. **វិភាគថ្លៃដើមបច្ចុប្បន្ន:**
```bash
# ប្រើ Azure CLI ដើម្បីទទួលបានទិន្នន័យចំណាយ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **អនុវត្តការគ្រប់គ្រងថ្លៃដើម:**
- កំណត់ការជូនដំណឹងថវិកា
- ប្រើគោលនយោបាយការវាស់វែងស្វ័យប្រវត្តិ
- អនុវត្តកន្លែងរក្សាសំណើ
- ត្រួតពិនិត្យការប្រើប្រាស់តូកិនសម្រាប់ OpenAI

### **លំហ.exercise 7.1: ការបង្កើនប្រសិទ្ធភាព**

**ភារកិច្ច**: សម្រួលកម្មវិធី AI របស់អ្នកសម្រាប់ប្រសិទ្ធភាពនិងថ្លៃដើម។

**មេត្រគុណដែលត្រូវបង្កើន:**
- កាត់បន្ថយពេលឆ្លើយតបមធ្យម 20%
- កាត់បន្ថយថ្លៃដើមប្រចាំខែ 15%
- រក្សាជារយៈពេល uptime 99.9%

**យុទ្ធសាស្ត្រដែលគួរព្យាយាម:**
- អនុវត្តកន្លែងរក្សាសំណើឆ្លើយតប
- សម្រួលបំរែបំរួលសម្រាប់ប្រើប្រាស់តូកិនមានប្រសិទ្ធភាព
- ប្រើ SKU គណនាដែលសមស្រប
- បង្កើត autoscale ត្រឹមត្រូវ

## ការប្រឈមចុងក្រោយ: អនុវត្តពីដើមដល់ចប់

### ស្ថានភាពប្រឈម

អ្នកត្រូវតែបង្កើត chatbot សម្រាប់សេវាកម្មអតិថិជនដែលបើកធ្វើការ AI សម្រាប់ផលិតកម្មដោយមានតម្រូវការទាំងនេះ៖

**តម្រូវការសកម្មៈ**
- ផ្ទាំងវេបសម្រាប់ទំនាក់ទំនងអតិថិជន
- រួមបញ្ចូលសេវាកម្ម Microsoft Foundry Models សម្រាប់ចម្លើយ
- សមត្ថភាពស្វែងរកឯកសារដោយប្រើ Azure AI Search
- រួមបញ្ចូលជាមួយទិន្នន័យអតិថិជនរួចមក
- គាំទ្រភាសាច្រើន

**តម្រូវការមិនសកម្មៈ**
- កាន់តម្រឹមអ្នកប្រើប្រាស់ចំនួន 1000
- សេវាកម្ម uptime 99.9%
- សម្ព័ន្ធភាព SOC 2
- ថ្លៃក្រោម $500/ខែ
- ដាក់បង្ហោះក្នុងបរិយាកាសច្រើន (អភិវឌ្ឍ, staging, ផលិតកម្ម)

### ជំហានអនុវត្ត

1. **រចនាសម្ព័ន្ធ**
2. **បង្កើតគំរូ AZD**
3. **អនុវត្តវិធានសុវត្ថិភាព**
4. **កំណត់ការត្រួតពិនិត្យ និងការជូនដំណឹង**
5. **បង្កើតបណ្តាញដាក់បង្ហោះ**
6. **ចុះបញ្ជីដំណោះស្រាយ**

### ការវាយតម្លៃ

- ✅ **មុខងារ**: តើគោរពតម្រូវការទាំងអស់ទេ?
- ✅ **សុវត្ថិភាព**: តើអនុវត្តិល្អត្រូវបានអនុវត្តទេ?
- ✅ **ភាពធន់នឹងបន្ទុក**: តើអាចទប់ទល់បាននឹងបន្ទុកទេ?
- ✅ **ភាពងាយស្រួលថែទាំ**: តើកូដ និងហេដ្ឋារចនាសម្ព័ន្ធមានរបៀបល្អទេ?
- ✅ **ថ្លៃដើម**: តើនៅក្នុងថវិកានោះទេ?

## អ្នកគ្រប់គ្រងឯកសារ​បន្ថែម

### ឯកសាររបស់ Microsoft
- [ឯកសារ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ឯកសារ សេវា Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [ឯកសារ Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### គំរូឧទាហរណ៍
- [កម្មវិធីសន្ទនារបស់ Microsoft Foundry Models Chat](https://github.com/Azure-Samples/azure-search-openai-demo)
- [កម្មវិធីសន្ទនារបស់ OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ធនធានសហគមន៍
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 វិញ្ញាបនបត្របញ្ចប់វិស្ស័យ

សូមអបអរសាទរ! អ្នកបានបញ្ចប់មន្ទីរកម្មវិធី AI Workshop រៀបចំរួចរាល់។ ឥឡូវអ្នកគួរតែអាច:

- ✅ បម្លែងកម្មវិធី AI ដែលមានស្រាប់ទៅជាគំរូ AZD
- ✅ ចាក់​បញ្ចូលកម្មវិធី AI ដែលមានស្រាប់សម្រាប់ផលិតកម្ម
- ✅ អនុវត្តច្បាប់សុវត្ថិភាពល្អបំផុតសម្រាប់បដិសន្ធាន AI
- ✅ ត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាពកម្មវិធី AI
- ✅ ដោះស្រាយបញ្ហាទូទៅរបស់ការចាក់បញ្ចូល

### ជំហានបន្ទាប់
1. អនុវត្តគំរូទាំងនេះទៅក្នុងគម្រោង AI របស់អ្នក
2. ចូលរួមរួមចំណែកគំរូទៅសហគមន៍វិញ
3. ចូលរួម Microsoft Foundry Discord សម្រាប់ការគាំទ្របន្ត
4. ស្វែងយល់មុខវិជ្ជาขั้นខ្ពស់ដូចជា ការចាក់បញ្ចូលច្រើនតំបន់

---

**មតិយោបល់សិក្ខាសាលា**: ជួយយើងធ្វើឱ្យសិក្ខាសាលានេះប្រសើរឡើងដោយចែករំលែកបទពិសោធន៍របស់អ្នកនៅក្នុង [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure)។

---

**ការរុករកជំពូក:**
- **📚 ទំព័រដើមវគ្គ**: [AZD For Beginners](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI ជាលើកដំបូង
- **⬅️ មុននេះ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ បន្ទាប់**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយទេ?** ចូលរួមសហគមន៍របស់យើងសម្រាប់ការគាំទ្រនិងការពិភាក្សាអំពី AZD និងការចាក់បញ្ចូល AI។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
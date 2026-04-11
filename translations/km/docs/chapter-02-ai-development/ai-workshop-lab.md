# ប εργαστήριο AI: ធ្វើឲ្យដំណោះស្រាយ AI របស់អ្នកអាចប្រើប្រាស់ AZD បាន

**ចេញវិចារណ:**
- **📚 ផ្ទះវគ្គសិក្សា**៖ [AZD សម្រាប់អ្នកថ្មី](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 2 - ការអភិវឌ្ឍន៍ AI ជាប្រភេទដំបូង
- **⬅️ មុននេះ**៖ [ការតម្លើងម៉ូដែល AI](ai-model-deployment.md)
- **➡️ បន្ទាប់**៖ [អនុប្រតិបត្តិការល្អបំផុតនៃ AI ក្នុងការផលិត](production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**៖ [ជំពូក 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

## ទិដ្ឋភាពមួយទូទៅនៃការប្រឡង

មន្ទីរពិសោធន៍ដ៏ទាញដែលនេះចាំបាច់ណែនាំអ្នកអភិវឌ្ឍន៍តាមដំណើរការដើម្បីយកទម្រង់ AI ដែលមានស្រេចទៅតម្លើងដោយប្រើ Azure Developer CLI (AZD)។ អ្នកនឹងរៀនរបៀបបែបផែនសំខាន់ៗសម្រាប់ការតម្លើង AI ក្នុងការផលិត ដោយប្រើសេវាកម្ម Microsoft Foundry។

> **សម្គាល់ត្រួតពិនិត្យ (២០២៦-០៣-២៥):** វគ្គសិក្សានេះត្រូវបានពិនិត្យប្រឆាំងនឹង `azd` `1.23.12`។ ប្រសិនបើការតម្លើងក្នុងម៉ាស៊ីនរបស់អ្នកចាស់ជាងនេះ សូមពិនិត្យឲ្យបានទាន់សម័យ AZD មុនចាប់ផ្តើម ដើម្បីឲ្យការផ្តល់សិទ្ធិ ទម្រង់ និងដំណើរការទាញជាមួយទៅនឹងជំហានខាងក្រោម។ 

**រយៈពេល៖** 2-3 ម៉ោង  
**កម្រិត៖** មធ្យម  
**លក្ខខណ្ឌមុន៖** បទពិសោធន៍ Azure មូលដ្ឋាន, យល់ដឹងអំពីមាតិកា AI/ML

## 🎓 គោលបំណងរៀន

នៅចុងវគ្គនេះ អ្នកនឹងអាច:
- ✅ បម្លែងកម្មវិធី AI ដែលមានស្រេចទៅប្រើទម្រង់ AZD
- ✅ កំណត់សេវាកម្ម Microsoft Foundry ជាមួយ AZD
- ✅ អនុវត្តការគ្រប់គ្រងសេចក្តីអះអាងយ៉ាងសុវត្ថិភាពសម្រាប់សេវាកម្ម AI
- ✅ តម្លើងកម្មវិធី AI ដែលមានស្រេចសម្រាប់ផលិតកម្មដោយមានការត្រួតពិនិត្យ
- ✅ ដោះស្រាយបញ្ហាទូទៅក្នុងការតម្លើង AI

## លក្ខខណ្ឌមុន

### ឧបករណ៍ចាំបាច់
- បានដំឡើង [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- បានដំឡើង [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- បានដំឡើង [Git](https://git-scm.com/)
- ជម្រើសកូដ (ផ្នែក VS Code ផ្តល់អនុសាសន៍)

### ប្រភព Azure
- មានកិច្ចសន្យា Azure និងសិទិ្ធជាអ្នករួមចំណែក
- មានសិទិ្ធចូលប្រើសេវាកម្ម Microsoft Foundry Models (ឬអាចស្នើសុំសិទិ្ធ)
- ដែលមានសិទិ្ធបង្កើត Resource Group

### ចំណេះដឹងមូលដ្ឋាន
- យល់ដឹងពីសេវាកម្ម Azure
- ចេះប្រើបញ្ជាពាក្យបញ្ជា Command Line
- យល់ដឹងពីមាតិកា AI/ML (API, ម៉ូដែល, ព្រួយណែនាំ)

## ការត្រៀមវេទិកា

### ជំហាន 1៖ ការប្រមូលបរិស្ថាន

1. **ផ្ទៀងផ្ទាត់ការដំឡើងឧបករណ៍៖**
```bash
# ពិនិត្យការ​រំលាក់ AZD
azd version

# ពិនិត្យ Azure CLI
az --version

# ចូលទៅកាន់ Azure សម្រាប់ដំណើរការ AZD
azd auth login

# ចូលទៅ Azure CLI តែបើអ្នកមានផែនការប្រើបញ្ជា az នៅពេលវាយតម្រៀបបញ្ហា
az login
```

ប្រសិនបើអ្នកប្រើប្រាស់កន្លែងកាន់ត្រូវច្រើន ហើយការជាវរបស់អ្នកមិនត្រូវបានរកឃើញដោយស្វ័យប្រវត្តិ សូមព្យាយាមម្តងទៀតជាមួយ `azd auth login --tenant-id <tenant-id>`។

2. **ចម្លងឃ្លាំងកម្មវិធីរោងចក្រ៖**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ម៉ូឌុល 1៖ យល់ដឹងអំពីរចនាសម្ព័ន្ធ AZD សម្រាប់កម្មវិធី AI

### រចនាសម្ព័ន្ធ នៃទម្រង់ AZD សម្រាប់ AI

ស្វែងយល់អំពីឯកសារសំខាន់ៗក្នុងទម្រង់ AZD ដែលមានភាពសមរម្យសម្រាប់ AI៖

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **មេរៀន 1.1: ស្វែងយល់អំពីការបង្កើតកំណត់រចនា**

1. **ពិចារណាឯកសារ azure.yaml៖**
```bash
cat azure.yaml
```

**អ្វីដែលត្រូវមើល៖**
- ការកំណត់សេវាកម្មសម្រាប់បន្ទះ AI
- ការផ្គូផ្គងអថេរបរិស្ថាន
- ការកំណត់អ្នកផ្ដល់សេវា

2. **ពិនិត្យមើលសំណុំបែបបទ main.bicep របស់រោងចក្រសំណង់៖**
```bash
cat infra/main.bicep
```

**លំនាំ AI សំខាន់ៗ ដែលត្រូវបញ្ជាក់៖**
- ការប្រើសេវាជួញដូរ Microsoft Foundry Models
- ការបញ្ចូល Cognitive Search
- ការគ្រប់គ្រងកូនសោយ៉ាងសុវត្ថិភាព
- ការកំណត់សុវត្ថិភាពបណ្តាញ

### **ចំណុចចរចា:** ហេតុអ្វីបានជា លំនាំទាំងនេះមានសារៈសំខាន់សម្រាប់ AI

- **ការពឹងផ្អែកលើសេវាកម្ម**៖ កម្មវិធី AI ជាទូទៅតម្រូវឲ្យមានសេវាកម្មជាច្រើនគ្នាជាមួយគ្នា
- **សុវត្ថិភាព**៖ កូនសោ API និងចំណុចចូលត្រូវបានគ្រប់គ្រងយ៉ាងមានសុវត្ថិភាព
- **ការពង្រោងទំហំ**៖ ការងាររបស់ AI មានតម្រូវការពង្រីកបញ្ចាក់នាពេលខាងមុខ
- **ការគ្រប់គ្រងថ្លៃដើម**៖ សេវាកម្ម AI អាចមានថ្លៃខ្ពស់ប្រសិនបើមិនបានកំណត់ត្រឹមត្រូវ

## ម៉ូឌុល 2៖ តម្លើងកម្មវិធី AI ដំបូងរបស់អ្នក

### ជំហាន 2.1៖ បង្កើតបរិស្ថាន

1. **បង្កើតបរិស្ថាន AZD ថ្មី៖**
```bash
azd env new myai-workshop
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រចាំបាច់៖**
```bash
# កំណត់តំបន់ Azure ដែលអ្នកចូលចិត្ត
azd env set AZURE_LOCATION eastus

# ជាជម្រើស: កំណត់ម៉ូដែល OpenAI ជាក់លាក់
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ជំហាន 2.2៖ តម្លើងទ្រព្យសម្បត្តិ និងកម្មវិធី

1. **តម្លើងជាមួយ AZD៖**
```bash
azd up
```

**អ្វីដែលកើតឡើងនៅពេល `azd up`:**
- ✅ បង្កើតសេវាកម្ម Microsoft Foundry Models
- ✅ បង្កើតសេវាកម្ម Cognitive Search
- ✅ បង្កើត App Service សម្រាប់កម្មវិធីតាមវេប
- ✅ កំណត់បណ្តាញ និងសុវត្ថិភាព
- ✅ តម្លើងកូដកម្មវិធី
- ✅ តំរូវការត្រួតពិនិត្យ និងកំណត់របាយការណ៌

2. **តាមដានដំណើរការតម្លើង** ហើយកត់សម្គាល់ទ្រព្យសម្បត្តិដែលត្រូវបានបង្កើត។

### ជំហាន 2.3៖ ពិនិត្យសុពលភាពនៃការតម្លើង

1. **ពិនិត្យទ្រព្យសម្បត្តិដែលបានតម្លើង៖**
```bash
azd show
```

2. **បើកកម្មវិធីដែលបានដាក់៖**
```bash
azd show
```

បើកចំណុចចូលវេបដែលបង្ហាញនៅក្នុងលទ្ធផល `azd show`។

3. **សាកល្បងមុខងារ AI៖**
   - ទៅកាន់កម្មវិធីតាមវេប
   - សាកសួរគំរូ
   - ពិនិត្យម្តងទៀតថាAI នៅក្នុងរបៀបដំណើរការបាន

### **មេរៀន 2.1: បទអនុវត្តសម្រេចជំរើស**

**ស្ថានភាព**៖ ការតម្លើងរបស់អ្នកជោគជ័យ ប៉ុន្តែ AI មិនបានឆ្លើយតប។

**បញ្ហាទូទៅដែលត្រូវពិនិត្យ៖**
1. **កូនសោ API OpenAI**៖ ពិនិត្យឲ្យបានថាគេបានកំណត់ត្រឹមត្រូវ
2. **ភាពអាចប្រើម៉ូដែល**៖ ពិនិត្យទិដ្ឋភាពថាតើតំបន់អ្នកនៅគាំទ្រម៉ូដែលទេ
3. **ការតភ្ជាប់បណ្តាញ**៖ ធានាថាសេវាកម្មអាចទំនាក់ទំនងគ្នាបាន
4. **សិទិទ្ធិ RBAC**៖ ពិនិត្យថាកម្មវិធីអាចចូលប្រើ OpenAI

**ពាក្យបញ្ជាលំបាកត្រៀម៖**
```bash
# ពិនិត្យអថេរបរិយាកាស
azd env get-values

# មើលកំណត់ហេតុដាក់ឲ្យដំណើរការ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ពិនិត្យស្ថានភាពដាក់ឲ្យដំណើរការ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ម៉ូឌុល 3៖ ប្ដូរប្តូរអភិវឌ្ឍកម្មវិធី AI សម្រាប់តម្រូវការ

### ជំហាន 3.1៖ កែប្រែកំណត់រចនាសម្ព័ន្ធ AI

1. **បន្ទាន់សម័យម៉ូដែល OpenAI៖**
```bash
# ប្តូរទៅម៉ូឌែលផ្សេងទៀត (បើមាននៅតំបន់របស់អ្នក)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# បញ្ចូនឡើងវិញជាមួយការតំឡើងថ្មី
azd deploy
```

2. **បន្ថែមសេវាកម្ម AI ផ្សេងទៀត៖**

កែប្រែក្នុង `infra/main.bicep` ដើម្បីបន្ថែម Document Intelligence៖

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

### ជំហាន 3.2៖ ការកំណត់បរិស្ថានជាក់លាក់

**អនុវត្តល្អបំផុត**៖ ការកំណត់ចម្រុះរវាងការអភិវឌ្ឍន៍ និង ផលិតកម្ម។

1. **បង្កើតបរិស្ថានផលិតកម្ម៖**
```bash
azd env new myai-production
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រផលិតកម្ម៖**
```bash
# ផលិតកម្មទូទៅប្រើ SKU ខ្ពស់ជាង
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# បើកការពារបន្ថែមបន្ថយសន្តិសុខ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **មេរៀន 3.1: ការបង្កើតចំណាយអតិបរមា**

**បញ្ហា**៖ កំណត់ទម្រង់ដើម្បីអភិវឌ្ឍដោយមានថ្លៃតិចបំផុត។

**កិច្ចការជាក្រុម៖**
1. កំណត់ SKUs ដែលអាចប្រើ tier សេវាឥតឈ្នួល/មូលដ្ឋាន
2. កំណត់អថេរបរិស្ថានសម្រាប់ថ្លៃអប្បបរមា
3. តម្លើង និងប្រៀបធៀបថ្លៃជាមួយការកំណត់ផលិតកម្ម

**យោបល់ដំណោះស្រាយ៖**
- ប្រើ tier F0 (ឥតគិតថ្លៃ) សម្រាប់សេវាកម្ម Cognitive ប្រសិនបើអាច
- ប្រើ tier មូលដ្ឋានសម្រាប់សេវាកម្ម Search ក្នុងការអភិវឌ្ឍ
- ពិចារណាការប្រើផែនការប្រើប្រាស់សម្រាប់ Functions

## ម៉ូឌុល 4៖ សុវត្ថិភាព និង អនុប្រតិបត្តិការល្អបំផុតក្នុងផលិតកម្ម

### ជំហាន 4.1៖ ការគ្រប់គ្រងសញ្ញាប័ត្រយ៉ាងសុវត្ថិភាព

**បញ្ហាបច្ចុប្បន្ន**៖ កម្មវិធី AI ច្រើនផ្ទុកកូនសោ API ផ្ទាល់ ឬប្រើផ្ទុកនៅកន្លែងមិនសុវត្ថិភាព។

**ដំណោះស្រាយ AZD**៖ ការអត្តសញ្ញាណគ្រប់គ្រង + ការរួមបញ្ចូល Key Vault។

1. **ពិនិត្យមើលការកំណត់សុវត្ថិភាពក្នុងទម្រង់របស់អ្នក៖**
```bash
# ស្វែងរកការកំណត់ Key Vault និង Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **ពិនិត្យបញ្ជាក់ថាអត្តសញ្ញាណគ្រប់គ្រងដំណើរការ៖**
```bash
# ពិនិត្យមើលថាតើកម្មវិធីវេបមានការកំណត់អត្តសញ្ញាណត្រឹមត្រូវឬអត់
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ជំហាន 4.2៖ សុវត្ថិភាពបណ្តាញ

1. **បើកចំណុចចូលឯកជន** (ប្រសិនបើមិនបានកំណត់៖)

បន្ថែមទៅក្នុងទម្រង់ bicep របស់អ្នក៖
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

### ជំហាន 4.3៖ ការត្រួតពិនិត្យ និងសក្ខីកម្ម

1. **កំណត់ Application Insights៖**
```bash
# គួរតែដាក់កំណត់ Application Insights ដោយស្វ័យប្រវត្តិ
# សូមពិនិត្យការកំណត់:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **ដំឡើងការត្រួតពិនិត្យចំពោះ AIជាក់ស្តែង៖**

បន្ថែមមាត្រដ្ឋានបុគ្គលសម្រាប់ប្រតិបត្តិការណ៍ AI៖
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

### **មេរៀន 4.1: ស្វែងរកការពិនិត្យសុវត្ថិភាព**

**កិច្ចការជាក្រុម៖** ពិនិត្យមើលការតម្លើងរបស់អ្នកសម្រាប់អនុប្រតិបត្តិការល្អសុវត្ថិភាព។

**បញ្ជីត្រួតពិនិត្យ៖**
- [ ] គ្មានសម្ងាត់ផ្ទុកជាប្រភេទរឹងក្នុងកូដឬការកំណត់
- [ ] ប្រើអត្តសញ្ញាណគ្រប់គ្រងសម្រាប់ការផ្ទៀងផ្ទាត់ពីសេវាកម្មទៅសេវាកម្ម
- [ ] ការផ្ទុក Key Vault រួមបញ្ចូលការកំណត់សំខាន់ៗ
- [ ] ចូលដំណើរការបណ្តាញត្រូវបានដាក់កំណត់ត្រឹមត្រូវ
- [ ] មានការត្រួតពិនិត្យ និងកំណត់កំណត់ហេតុ

## ម៉ូឌុល 5៖ បម្លែងកម្មវិធី AI របស់អ្នកឯង

### ជំហាន 5.1៖ សន្លឹកប៉ាន់ប្រមាណ

**មុនពេលបម្លែងកម្មវិធីរបស់អ្នក**, ចម្លើយសំណួរទាំងនេះ៖

1. **ស្ថាបត្យកម្មកម្មវិធី៖**
   - តើកម្មវិធីរបស់អ្នកប្រើសេវាកម្ម AI អ្វីខ្លះ?
   - តើវាត្រូវការបច្ចេកទេសគណនាណាមួយ?
   - តើវាត្រូវការទិន្នន័យសម្រាប់ផ្ទុកឬទេ?
   - តើកំពង់កមានអ្វីទាក់ទងគ្នារវាងសេវាកម្ម?

2. **តម្រូវការរបស់សុវត្ថិភាព៖**
   - តើកម្មវិធីរបស់អ្នកមានទិន្នន័យរឹងណាមួយទេ?
   - តើអ្នកត្រូវការអនុវត្តន៍ការតាមដានគោលការណ៍ណាមួយ?
   - តើអ្នកត្រូវការបណ្តាញឯកជន?

3. **តម្រូវការពង្រីក៖**
   - តើដំណើរការរំពឹងទុកជាមួយផ្ទុកប៉ុន្មាន?
   - តើប្រើការពង្រីកដោយស្វ័យប្រវត្តិទេ?
   - តើមានតម្រូវការចម្រុះតំបន់?

### ជំហាន 5.2៖ បង្កើតទម្រង់ AZD របស់អ្នក

**អនុវត្តតាមលំនាំនេះដើម្បីបម្លែងកម្មវិធីរបស់អ្នក៖**

1. **បង្កើតរចនាសម្ព័ន្ធមូលដ្ឋាន៖**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# ចាប់ផ្ដើមកម្លាំងម៉ាស៊ីន AZD
azd init --template minimal
```

2. **បង្កើត azure.yaml៖**
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

3. **បង្កើតទម្រង់រោងចក្រដំឡើង៖**

**infra/main.bicep** - ទម្រង់សំខាន់៖
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

### **មេរៀន 5.1: ប្រកួតប្រជែងបង្កើតទម្រង់**

**បញ្ហា**៖ បង្កើតទម្រង់ AZD សម្រាប់កម្មវិធី AI ដំណើរការឯកសារ។

**តម្រូវការ៖**
- Microsoft Foundry Models សម្រាប់វិភាគមាតិកា
- Document Intelligence សម្រាប់OCR
- គណនីផ្ទុកសម្រាប់ការផ្ទុកឯកសារ
- Function App សម្រាប់កំណត់ចំណុចដំណើរការ
- គេហទំព័រមានចំណុចប្រជុំអ្នកប្រើ

**ពិន្ទុរង្វាន់:**
- បន្ថែមការដោះស្រាយកំហុសឲ្យត្រឹមត្រូវ
- រួមបញ្ចូលការប៉ាន់ប្រមាណថ្លៃដើម
- កំណត់ផ្ទាំងត្រួតពិនិត្យ

## ម៉ូឌុល 6៖ ដោះស្រាយបញ្ហាទូទៅ

### បញ្ហាទូទៅក្នុងការតម្លើង

#### បញ្ហា 1: កម្រិតសេវាកម្ម OpenAI ធ្លាក់ចុះ  
**រោគសញ្ញា:** ការតម្លើងបរាជ័យដោយសារកម្រិត  
**ដំណោះស្រាយ៖**
```bash
# ពិនិត្យមើលគណនីកំណត់បច្ចុប្បន្ន
az cognitiveservices usage list --location eastus

# ស្នើសុំបន្ថែមគណនីកំណត់ ឬសាកល្បងតំបន់ផ្សេង
azd env set AZURE_LOCATION westus2
azd up
```

#### បញ្ហា 2: ម៉ូដែលមិនមាននៅតំបន់  
**រោគសញ្ញា:** ការឆ្លើយតប AI បរាជ័យឬកំហុសពេលតម្លើងម៉ូដែល  
**ដំណោះស្រាយ៖**
```bash
# ពិនិត្យអំពីភាពមាននៅនៃម៉ូដែលតាមតំបន់
az cognitiveservices model list --location eastus

# អាប់ដេទទៅម៉ូដែលដែលមានស្រាប់
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### បញ្ហា 3: បញ្ហាសិទ្ធិ  
**រោគសញ្ញា:** កំហុស 403 Forbidden ពេលហៅសេវាកម្ម AI  
**ដំណោះស្រាយ៖**
```bash
# ពិនិត្យការចាត់តាំងតួនាទី
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# បន្ថែមតួនាទីដែលខ្វះ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### បញ្ហាប្រសិទ្ធភាព

#### បញ្ហា 4: ការឆ្លើយតប AI យឺត  
**ជំហានស្រាវជ្រាវ៖**
1. ពិនិត្យ Application Insights សម្រាប់មាត្រដ្ឋានប្រសិទ្ធភាព
2. ពិនិត្យមាត្រដ្ឋានសេវាកម្ម OpenAI ក្នុងខ្សែរភាព Azure
3. ពិនិត្យកម្រិតតភ្ជាប់បណ្តាញ និងការពន្យារពេល

**ដំណោះស្រាយ៖**
- អនុវត្តចាប់ផ្តើមប្រើកាបូបតំលៃសម្រាប់សំណួរទូទៅ
- ប្រើម៉ូដែល OpenAI សមរម្យសម្រាប់ករណីប្រើប្រាស់របស់អ្នក
- ពិចារណាការប្រើ read replicas សម្រាប់សកម្មភាពទម្ងន់ខ្ពស់

### **មេរៀន 6.1: ប្រកួតប្រជែងដោះស្រាយបញ្ហា**

**ស្ថានភាព**៖ ការតម្លើងបានជោគជ័យ ប៉ុន្តែកម្មវិធីបង្វិលកំហុស 500។

**កិច្ចការដោះស្រាយកំហុស៖**
1. ពិនិត្យកំណត់ហេតុកម្មវិធី
2. ពិនិត្យការតភ្ជាប់សេវាកម្ម
3. សាកល្បងការផ្ទៀងផ្ទាត់
4. ពិនិត្យការកំណត់រចនា

**ឧបករណ៍ប្រើប្រាស់៖**
- `azd show` សម្រាប់ការ មើលទាំងមូលនៃការតម្លើង
- Azure portal សម្រាប់កំណត់ហេតុសេវាផ្ទាល់ខ្លួន
- Application Insights សម្រាប់ព័ត៍មានបញ្ជ្រាបកម្មវិធី

## ម៉ូឌុល 7៖ ត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាព

### ជំហាន 7.1៖ ផ្សារភ្ជាប់ដោយមានផ្ទាំងត្រួតពិនិត្យទូលំទូលាយ

1. **បង្កើតផ្ទាំងត្រួតពិនិត្យបុគ្គលិក៖**

ទៅកាន់ Azure portal ហើយបង្កើតផ្ទាំងត្រួតពិនិត្យសម្រាប់៖
- ចំនួនសំណើ OpenAI និងពេលវេលាចំរូង
- អត្រាកំហុសកម្មវិធី
- ការប្រើធនធាន
- ការតាមដានថ្លៃ

2. **កំណត់អាលើត៖**
```bash
# ការជូនដំណឹងសម្រាប់អត្រាកំហុសខ្ពស់
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ជំហាន 7.2៖ ការកែលម្អថ្លៃដើម

1. **វិភាគថ្លៃបច្ចុប្បន្ន៖**
```bash
# ប្រើ Azure CLI ដើម្បីទទួលបានទិន្នន័យគិតថ្លៃ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **អនុវត្តការត្រួតពិនិត្យថ្លៃ៖**
- កំណត់អាលើតថវិកា
- ប្រើគោលនយោបាយអូតូបង្កើន/កាត់បន្ថយ
- អនុវត្តការចាប់ផ្តើមថាមពលសំណើ
- ត្រួតពិនិត្យនូវការប្រើប្រាស់សញ្ញាកូដសំរាប់ OpenAI

### **មេរៀន 7.1: ការបង្កើនប្រសិទ្ធភាព**

**កិច្ចការ**៖ បង្កើតប្រសិទ្ធភាពកម្មវិធី AI របស់អ្នកទាំងប្រសិទ្ធភាព និងថ្លៃតិច។

**មាត្រដ្ឋានត្រូវកែលម្អ៖**
- បន្ថយពេលឆ្លើយតបមធ្យមចុះ ២០%
- បន្ថយថ្លៃប្រចាំខែចុះ ១៥%
- រក្សាពេលដំណើរការបាន ៩៩.៩%

**យុទ្ធសាស្ត្រត្រូវសាកល្បង៖**
- អនុវត្តចាប់ផ្តើមប្រើកាបូបតំលៃសម្រាប់ចម្លើយ
- បង្កើតពន្លឿនការណែនាំសម្រាប់ប្រសិទ្ធភាពសញ្ញាកូដ
- ប្រើ SKUs គណនាដែលសមរម្យ
- កំណត់ការត្រួតពិនិត្យអូតូបង្កើន / កាត់បន្ថយបានត្រឹមត្រូវ

## បញ្ហាចុងក្រោយ៖ អនុវត្តទាំងមូលពីដើមដល់ចប់

### ស្ថានភាពបញ្ហា

អ្នកត្រូវបានផ្ដល់មុខងារបង្កើត chatbot ផ្តល់សេវាកម្មអតិថិជនដោយ AI សម្រាប់ផលិតកម្ម ដែលមានតម្រូវការដូចតទៅ៖

**តម្រូវការប្រតិបត្តិការ៖**
- ចំណុចប្រជុំវេបសម្រាប់អន្តរកម្មអតិថិជន
- បញ្ចូល Microsoft Foundry Models សម្រាប់ចម្លើយ
- សមត្ថភាពស្វែងរកឯកសារដោយប្រើ Cognitive Search
- បញ្ចូលទិន្នន័យអតិថិជនមានស្រេច
- គាំទ្រ ភាសាច្រើន

**តម្រូវការមិនប្រតិបត្តិ៖**
- អាចគ្រប់គ្រងអ្នកប្រើប្រាស់ ១០០០ នាក់នៅពេលតែមួយ
- ទុកសិទ្ធិ uptime ៩៩.៩%
- ធានាសុវត្ថិភាព SOC 2
- ថ្លៃកន្លែងក្រោម ៥០០ ដុល្លារក្នុងមួយខែ
- តម្លើងទៅបរិស្ថានច្រើន (អភិវឌ្ឍ, staging, ផលិតកម្ម)

### ជំហានអនុវត្តន៍

1. រៀបចំស្ថាបត្យកម្ម
2. បង្កើតទម្រង់ AZD
3. អនុវត្តវិធានសុវត្ថិភាព
4. កំណត់ការត្រួតពិនិត្យ និងអាលើត
5. បង្កើតបណ្ដាញដំណើរការតម្លើង
6. រៀបចំឯកសារសម្រាប់ដំណោះស្រាយ

### វិធានវាយតម្លៃ

- ✅ **មុខងារ**៖ តើយល់ព្រមតាមតម្រូវការទាំងអស់ឬទេ?
- ✅ **សុវត្ថិភាព**៖ តើបានអនុវត្តល្អហើយឬទេ?
- ✅ **ការពង្រីក**៖ អាចគ្រប់គ្រងបន្ទុកបានទេ?
- ✅ **ការថែទាំ**៖ កូដ និង រោងចក្រត្រូវបានរៀបរយល្អឬទេ?
- ✅ **ថ្លៃ**៖ គឺនៅក្នុងថវិកាតម្រូវឬអត់?

## ប្រភពបន្ថែម

### ឯកសាររបស់ Microsoft
- [ឯកសារ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ឯកសារ Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [ឯកសារ Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### ទម្រង់គំរូលំអិត
- [កម្មវិធី Chat ម៉ូដែល Microsoft Foundry](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ធនធានសហគមន៍
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 វិញ្ញាបនបត្រស្រេចចប់

អបអរសាទរ! អ្នកបានសំរេចបញ្ចប់មន្ទីរការងារបច្ចេកវិទ្យាផ្នែក AI។ ឥឡូវនេះអ្នកគួរតែអាច៖

- ✅ បម្លែងកម្មវិធី AI ដែលមានរួចទៅជាគំរូ AZD
- ✅ ផ្សព្វផ្សាយកម្មវិធី AI ដែលមានត្រៀមទ្រាន់សម្រាប់ផលិតកម្ម
- ✅ អនុវត្តអនុស្សរណៈសុវត្ថិភាពល្អបំផុតសម្រាប់ការប្រើប្រាស់ AI
- ✅ តាមដាន និងបង្កើនប្រសិទ្ធភាពកម្មវិធី AI
- ✅ ជួសជុលបញ្ហាទូទៅក្នុងការដាក់ឲ្យដំណើរការ

### ជំហានបន្ទាប់
1. អនុវត្តលំនាំទាំងនេះទៅលើគម្រោង AI របស់អ្នកផ្ទាល់
2. ឧបត្ថម្ភគំរូទាំងនេះត្រឡប់ទៅកាន់សហគមន៍
3. ចូលរួម Microsoft Foundry Discord សម្រាប់ការគាំទ្រតាមបន្ត
4. ស្វែងយល់ប្រធានបទកម្រិតខ្ពស់ដូចជាការដំណើរការចែកចាយច្រើនតំបន់

---

**មតិយោបល់របស់មន្ទីរការងារ**៖ ជួយយើងបង្កើនគុណភាពមន្ទីរការងារនេះដោយចែករំលែកបទពិសោធន៍របស់អ្នកនៅក្នុងបន្ទប់ជជែក [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure)។

---

**ការផ្លាស់ទីជាប់ចិត្តក្នុងជំពូក:**
- **📚 ទំព័រដើមវគ្គសិក្សា**៖ [AZD សម្រាប់អ្នកដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 2 - ការអភិវឌ្ឍន៍របស់ AI ជាមុន
- **⬅️ មុន**៖ [ការដាក់ម៉ូដែល AI ចូលប្រើ](ai-model-deployment.md)
- **➡️ បន្ទាប់**៖ [អនុស្សរណៈល្អបំផុតសម្រាប់ AI ផលិតកម្ម](production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**៖ [ជំពូក 3៖ ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយ?** ចូលរួមសហគមន៍របស់យើងសម្រាប់ការគាំទ្រនិងការពិភាក្សាពី AZD និងការដាក់ AI ដំណើរការ។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖
ឯកសារនេះបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលដែលយើងខិតខំឲ្យមានភាពត្រឹមត្រូវ សូមយល់ព្រមថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬការមិនក្រិតត្រឹមត្រូវ។ ឯកសារដើមក្នុងភាសាមូលដ្ឋានរបស់វាគួរត្រូវបានកត់សម្គាល់ថាជាភស្តុតាងផ្លូវការជាចម្បង។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឲ្យមានការបកប្រែដោយមនុស្សជំនាញវិជ្ជាជីវៈ។ យើងមិនខិតខំក្នុងការទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកប្រែខុសដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
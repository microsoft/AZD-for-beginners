# មន្ទីរពិសោធន៍​អនុវត្ត AI: ធ្វើឲ្យដំណោះស្រាយ AI របស់អ្នកអាចដាក់បញ្ចេញដោយ AZD

**ការរុករកជំពូក:**
- **📚 ទំព័រដើមនៃវគ្គ​**: [AZD For Beginners](../../README.md)
- **📖 ជំពូក​បច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍន៍ផ្អែកលើ AI
- **⬅️ មុននេះ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ បន្ទាប់**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## សេចក្តីសង្ខេបសិក្ខាកម្ម

មន្ទីរពិសោធន៍អនុវត្តនេះណែនាំអ្នកអភិវឌ្ឍន៍ពីដំណើរការ​យកគំរូ AI មានស្រាប់ និងដាក់ចេញដោយប្រើ Azure Developer CLI (AZD)។ អ្នកនឹងរៀនលំនាំសំខាន់ៗសម្រាប់ការដាក់ផ្សាយ AI នៅលើបរិស្ថានផលិតកម្មដោយប្រើសេវាកម្ម Microsoft Foundry។

> **សម្គាល់ផ្ទៀងផ្ទាត់ (2026-03-25):** មន្ទីរពិសោធន៍នេះបានពិនិត្យប្រៀបធៀបជាមួយ `azd` `1.23.12`។ ប្រសិនបើការតំឡើងក្នុងលំនៅរបស់អ្នកចាស់ជាងនេះ សូមបន្តបន្ទាន់ AZD មុនចាប់ផ្តើម ដើម្បីឲ្យការផ្ទៀងផ្ទាត់ (auth), គំរូ (template), និងដំណើរការដាក់ចេញ (deployment workflow) ត្រូវគ្នានឹងជំហានខាងក្រោម។

**រយៈពេល:** 2-3 ម៉ោង  
**កម្រិត:** មធ្យម  
**លក្ខខណ្ឌមុនពេលចូលរៀន:** ចំណេះដឹងមូលដ្ឋានអំពី Azure, ស្គាល់ពីគំនិត AI/ML

## 🎓 គោលដៅការរៀន

នៅចប់វគ្គសិក្សានេះ អ្នកអាច:
- ✅ បម្លែងកម្មវិធី AI មានស្រាប់ឲ្យប្រើគំរូ AZD
- ✅ កំណត់សេវាកម្ម Microsoft Foundry ជាមួយ AZD
- ✅ អនុវត្តការគ្រប់គ្រងព័ត៌មានសម្ងាត់យ៉ាងសុវត្ថិភាពសម្រាប់សេវាកម្ម AI
- ✅ ដាក់ចេញកម្មវិធី AI រួចសម្រាប់ផលិតកម្មជាមួយការតាមដាន
- ✅ ដោះស្រាយបញ្ហាទូទៅក្នុងការដាក់ចេញ AI

## លក្ខខណ្ឌមុន

### ឧបករណ៍ដែលត្រូវការ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) បានដំឡើង
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) បានដំឡើង
- [Git](https://git-scm.com/) បានដំឡើង
- កម្មវិធីកែសម្រួលកូដ (ណែនាំឲ្យប្រើ VS Code)

### របបធនធាន Azure
- ការ​ចុះឈ្មោះ Azure (subscription) ដែលមានសិទ្ធិ contributor
- ការចូលប្រើសេវាកម្ម Microsoft Foundry Models (ឬអាចស្នើសុំចូលប្រើបាន)
- សិទ្ធិបង្កើត resource group

### ចំណេះដឹងមុន
- យល់ដឹងមូលដ្ឋានអំពីសេវាកម្ម Azure
- ស្គាល់ចំពោះ បន្ទាត់បញ្ជា (command-line interfaces)
- គំនិតមូលដ្ឋាន AI/ML (APIs, models, prompts)

## ការតម្លើងមន្ទីរពិសោធន៍

### ជំហាន 1: រៀបចំបរិយាកាស

1. **ផ្ទៀងផ្ទាត់ការដំឡើងឧបករណ៍:**
```bash
# ពិនិត្យការដំឡើង AZD
azd version

# ពិនិត្យ Azure CLI
az --version

# ចូលទៅកាន់ Azure សម្រាប់ដំណើរការ AZD
azd auth login

# ចូលទៅកាន់ Azure CLI តែបើអ្នកមានផែនការរត់ពាក្យបញ្ជា az ក្នុងពេលធ្វើតេស្ត
az login
```

ប្រសិនបើអ្នកធ្វើការក្រៅតំបន់ tenants ច្រើន ឬការជាវ (subscription) របស់អ្នកមិនត្រូវបានរកឃើញដោយស្វ័យប្រវត្តិ សូមព្យាយាមម្ដងទៀតជាមួយ `azd auth login --tenant-id <tenant-id>`។

2. **ធ្វើការ clone repository នៃមន្ទីរពិសោធន៍:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ម៉ូឌុល 1: យល់អំពីរចនាសម្ព័ន្ធ AZD សម្រាប់កម្មវិធី AI

### រចនាសម្ព័ន្ធលម្អិតនៃគំរូ AZD សម្រាប់ AI

ស្វែងយល់ពីឯកសារសំខាន់ៗក្នុងគំរូ AZD ដែលត្រៀមសម្រាប់ AI៖

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

### **លំហាត់មន្ទីរពិសោធន៍ 1.1: ស្វែងយល់ពីការកំណត់**

1. **ពិនិត្យមើលឯកសារ azure.yaml:**
```bash
cat azure.yaml
```

**អ្វីដែលត្រូវសង្កេត:**
- ការកំណត់សេវាកម្មសម្រាប់គ្រឿងផ្សំ AI
- ការផ្គូផ្គងអថេរ​បរិយាកាស (environment variables)
- ការកំណត់ host

2. **ពិនិត្យមើល​រចនាសម្ព័ន្ធ main.bicep:**
```bash
cat infra/main.bicep
```

**លំនាំសំខាន់ៗសម្រាប់ AI ដែលត្រូវរកឃើញ:**
- ការផ្គត់ផ្គង់សេវា Microsoft Foundry Models
- ការលៃតម្រូវជាមួយ Azure AI Search
- ការគ្រប់គ្រងកូនសោ/keys យ៉ាងសុវត្ថិភាព
- ការកំណត់សុវត្ថិភាពបណ្តាញ

### **ចំណុចពិភាក្សា:** ហេតុអ្វីលំនាំទាំងនេះមានសារៈសំខាន់សម្រាប់ AI

- **ការពឹងផ្អែកលើសេវាកម្ម**: កម្មវិធី AI ជាញឹកញាប់ត្រូវការសេវាកម្មច្រើនដែលត្រូវសម្របសម្រួល
- **សុវត្ថិភាព**: ប៊ុកសារ API និង endpoints ត្រូវការការគ្រប់គ្រងយ៉ាងសុវត្ថិភាព
- **ភាពអាចពង្រីក**: បន្ទុកការងារ AI មានតម្រូវការពង្រីកជាពិសេស
- **ការគ្រប់គ្រងថ្លៃដើម**: សេវាកម្ម AI អាចមានចំណាយខ្ពស់ ប្រសិនបើមិនបានកំណត់ត្រឹមត្រូវ

## ម៉ូឌុល 2: ដាក់ចេញកម្មវិធី AI ដំបូងរបស់អ្នក

### ជំហាន 2.1: ចាប់ផ្តើមបរិយាកាស

1. **បង្កើតបរិយាកាស AZD ថ្មី:**
```bash
azd env new myai-workshop
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រដែលត្រូវការ:**
```bash
# កំណត់តំបន់ Azure ដែលអ្នកចូលចិត្ត
azd env set AZURE_LOCATION eastus

# ជាជម្រើស: កំណត់ម៉ូឌែល OpenAI ជាក់លាក់
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ជំហាន 2.2: ដាក់ចេញរចនាសម្ព័ន្ធ និងកម្មវិធី

1. **ដាក់ចេញដោយ AZD:**
```bash
azd up
```

**អ្វីកើតឡើងក្នុងពេល `azd up`:**
- ✅ ផ្គត់ផ្គង់សេវា Microsoft Foundry Models
- ✅ បង្កើតសេវា Azure AI Search
- ✅ រៀបចំ App Service សម្រាប់កម្មវិធីវេប
- ✅ កំណត់បណ្តាញ និងសុវត្ថិភាព
- ✅ ដាក់កូដកម្មវិធី
- ✅ រៀបចំការតាមដាន និងកំណត់ហេតុ

2. **តាមដានការរីកចម្រើននៃការដាក់ចេញ** និងកត់សម្គាល់ធនធានដែលកំពុងត្រូវបានបង្កើត។

### ជំហាន 2.3: ប្រកាសផ្ទៀងផ្ទាត់ការដាក់ចេញរបស់អ្នក

1. **ពិនិត្យធនធានដែលបានដាក់ចេញ:**
```bash
azd show
```

2. **បើកកម្មវិធីដែលបានដាក់ចេញ:**
```bash
azd show
```

បើក endpoint វេបដែលបង្ហាញក្នុងលទ្ធផល `azd show`។

3. **សាកល្បងមុខងារ AI:**
   - ចូលទៅកម្មវិធីវេប
   - ព្យាយាមសំណួរឧទាហរណ៍
   - ផ្ទៀងផ្ទាត់ថា AI ឆ្លើយតបបានត្រឹមត្រូវ

### **លំហាត់មន្ទីរពិសោធន៍ 2.1: អនុវត្តការដោះស្រាយបញ្ហា**

**សេណារីយ៉ូ**: ការដាក់ចេញរបស់អ្នកបានជោគជ័យ ប៉ុន្តែ AI មិនឆ្លើយតប។

**បញ្ហាទូទៅដែលត្រូវត្រួតពិនិត្យ៖**
1. **កូនសោ API OpenAI**: ពិនិត្យថាត្រូវបានកំណត់យ៉ាងត្រឹមត្រូវ
2. **ភាពអាចប្រើបាននៃម៉ូដែល**: ពិនិត្យថាតំបន់របស់អ្នកគាំទ្រម៉ូដែលនោះឬទេ
3. **ការតភ្ជាប់បណ្តាញ**: ប្រាកដថាសេវាកម្មអាចទំនាក់ទំនងគ្នា
4. **សិទ្ធិ RBAC**: ពិនិត្យថាកម្មវិធីអាចចូលប្រើ OpenAI

**ពាក្យបញ្ជាសម្រាប់ដោះស្រាយបញ្ហា:**
```bash
# ពិនិត្យអថេរបរិស្ថាន
azd env get-values

# មើលកំណត់ហេតុនៃការដាក់ឡើង
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ពិនិត្យស្ថានភាពការដាក់ឡើងរបស់ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ម៉ូឌុល 3: ប្តូរតម្រូវកម្មវិធី AI ឲ្យសមរម្យតាមតម្រូវការ

### ជំហាន 3.1: ផ្លាស់ប្តូរការកំណត់ AI

1. **បន្ទាន់សម័យម៉ូដែល OpenAI:**
```bash
# ប្ដូរទៅម៉ូដែលផ្សេង (ប្រសិនបើមាននៅក្នុងតំបន់របស់អ្នក)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ដាក់ចេញឡើងវិញជាមួយការកំណត់រចនាសម្ព័ន្ធថ្មី
azd deploy
```

2. **បន្ថែមសេវាកម្ម AI បន្ថែម:**

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

### ជំហាន 3.2: ការកំណត់លំដាប់សម្រាប់បរិយាកាសនីមួយៗ

**អនុវត្តល្អបំផុត**: ការកំណត់ខុសៗគ្នារវាង development និង production។

1. **បង្កើតបរិយាកាសផលិតកម្ម:**
```bash
azd env new myai-production
```

2. **កំណត់ប៉ារ៉ាម៉ែត្រពិសេសសម្រាប់ផលិតកម្ម:**
```bash
# ផលិតកម្មភាគច្រើនប្រើ SKU កម្រិតខ្ពស់
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# បើកមុខងារសន្តិសុខបន្ថែម
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **លំហាត់មន្ទីរពិសោធន៍ 3.1: បង្កើនប្រសិទ្ធភាពថ្លៃ**

**បញ្ហា**: កំណត់គំរូឲ្យសមសម្រាប់ការអភិវឌ្ឍដែលមានថ្លៃទាប។

**ភារកិច្ច:**
1. ស្វែងរក SKU ដែលអាចដាក់នៅ tier មិនគិតថ្លៃ/មូលដ្ឋាន
2. កំណត់ environment variables សម្រាប់ថ្លៃអប្បបរមា
3. ដាក់ចេញ ហើយប្រៀបធៀបទឹកប្រាក់ទៅជាមួយការកំណត់សម្រាប់ផលិតកម្ម

**ស្នើនិទេសដំណោះស្រាយ:**
- ប្រើ F0 (free) tier សម្រាប់ Azure AI Services នៅពេលអាចធ្វើបាន
- ប្រើ Basic tier សម្រាប់ Search Service ក្នុងការអភិវឌ្ឍ
- ពិចារណាការប្រើ Consumption plan សម្រាប់ Functions

## ម៉ូឌុល 4: សុវត្ថិភាព និងអនុវត្តល្អសម្រាប់ផលិតកម្ម

### ជំហាន 4.1: ការគ្រប់​គ្រង​ព័ត៌មាន​សម្ងាត់​យ៉ាង​សុវត្ថិភាព

**បញ្ហាបច្ចុប្បន្ន**: កម្មវិធី AI ច្រើនកូដ API keys ដោយផ្ទុកនៅក្នុងកូដ ឬប្រើការផ្ទុកដែលមិនសុវត្ថិភាព។

**ដំណោះស្រាយ AZD**: ការរួមបញ្ចូល Managed Identity + Key Vault។

1. **ពិនិត្យកំណត់សុវត្ថិភាពក្នុងគំរូរបស់អ្នក:**
```bash
# ស្វែងរកការកំណត់រចនាសម្ព័ន្ធ Key Vault និង Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **ផ្ទៀងផ្ទាត់ថា Managed Identity កំពុងដំណើរការ:**
```bash
# ពិនិត្យថាកម្មវិធីបណ្ដាញមានការកំណត់អត្តសញ្ញាណដែលត្រឹមត្រូវ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ជំហាន 4.2: សុវត្ថិភាពបណ្តាញ

1. **បើក private endpoints** (ប្រសិនបើមិនទាន់បានកំណត់):

បន្ថែមទៅក្នុងគំរូ bicep របស់អ្នក:
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

### ជំហាន 4.3: ការតាមដាន និងការមើលឃើញ

1. **កំណត់ Application Insights:**
```bash
# Application Insights គួរត្រូវបានកំណត់រចនាសម្ព័ន្ធដោយស្វ័យប្រវត្តិ
# សូមពិនិត្យការកំណត់រចនាសម្ព័ន្ធ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **រៀបចំការតាមដានពិសេសសម្រាប់ AI:**

បន្ថែម metrics ផ្ទាល់ខ្លួនសម្រាប់ប្រតិបត្តិការ AI:
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

### **លំហាត់មន្ទីរពិសោធន៍ 4.1: ការត្រួតពិនិត្យសុវត្ថិភាព**

**ភារកិច្ច**: ពិនិត្យការដាក់ចេញរបស់អ្នកសម្រាប់អនុវត្តន៍សុវត្ថិភាពល្អបំផុត។

**បញ្ជីត្រួតពិនិត្យ:**
- [ ] មិនមានសម្ងាត់ដែលបានកូដជាប់នៅក្នុងកូដ ឬការកំណត់
- [ ] Managed Identity ត្រូវបានប្រើសម្រាប់ការផ្ទៀងផ្ទាត់ពីសេវាមួយទៅសេវាផ្សេង
- [ ] Key Vault ផ្ទុកការកំណត់ដែលមានទិន្នន័យសំងាត់
- [ ] ការចូលប្រើបណ្តាញត្រូវបានដាក់កំណត់យ៉ាងត្រឹមត្រូវ
- [ ] មានការបើកប្រើការតាមដាន និងកំណត់ហេតុ

## ម៉ូឌុល 5: បម្លែងកម្មវិធី AI របស់អ្នកឯង

### ជំហាន 5.1: វិចារណសន្លឹកប៉ាន់ស្មាន

**មុនពេលបម្លែងកម្មវិធីរបស់អ្នក**, សូមឆ្លើយសំណួរទាំងនេះ៖

1. **ស្ថាបត្យកម្មកម្មវិធី (Application Architecture):**
   - តើកម្មវិធីរបស់អ្នកប្រើសេវាកម្ម AI អ្វីខ្លះ?
   - តើវាត្រូវការរបបកុំព្យូទ័រអ្វីខ្លះ?
   - តើវាត្រូវការមូលដ្ឋានទិន្នន័យទេ?
   - តើមានការពឹងផ្អែកអ្វីៗរវាងសេវាកម្មទាំងនោះ?

2. **តម្រូវការសុវត្ថិភាព:**
   - តើកម្មវិធីរបស់អ្នកដោះសារទិន្នន័យដែលមានឯកជនភាពឬសំងាត់អ្វីខ្លះ?
   - តើមានតម្រូវការអនុក្រឹត្យភាព (compliance) អ្វីខ្លះ?
   - តើអ្នកត្រូវការបណ្តាញឯកជនទេ?

3. **តម្រូវការការពង្រីក (Scaling Requirements):**
   - ផ្ទុកការរំពឹងទុករបស់អ្នកជាអ្វី?
   - តើអ្នកត្រូវការការផ្ទុកដោយស្វ័យប្រវត្តិ (auto-scaling) ទេ?
   - តើមានតម្រូវការផ្នែកតំបន់ទេ?

### ជំហាន 5.2: បង្កើតគំរូ AZD របស់អ្នក

**អនុវត្តតាមលំនាំនេះដើម្បីបម្លែងកម្មវិធីរបស់អ្នក:**

1. **បង្កើតរចនាសម្ព័ន្ធមូលដ្ឋាន:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# ចាប់ផ្តើមគំរូ AZD
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

3. **បង្កើតគំរូរចនាសម្ព័ន្ធ (infrastructure templates):**

**infra/main.bicep** - គំរូមូលដ្ឋាន:
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **លំហាត់មន្ទីរពិសោធន៍ 5.1: បញ្ហាបង្កើតគំរូ**

**បញ្ហា**: បង្កើតគំរូ AZD សម្រាប់កម្មវិធី AI ដំណើរការឯកសារ

**តម្រូវការ:**
- Microsoft Foundry Models សម្រាប់វិភាគមាតិកា
- Document Intelligence សម្រាប់ OCR
- Storage Account សម្រាប់ផ្ទុកឯកសារដែលបានផ្ទុកឡើង
- Function App សម្រាប់ logic ដំណើរការ
- Web app សម្រាប់ចំណុចប្រើប្រាស់

**ពិន្ទុបូណៀរ:**
- បន្ថែមការគ្រប់គ្រងកំហុសយ៉ាងត្រឹមត្រូវ
- រួមបញ្ចូលការប៉ាន់ស្មានថ្លៃដើម
- រៀបចំផ្ទាំងតាមដាន

## ម៉ូឌុល 6: ដោះស្រាយបញ្ហារួមទូទៅ

### បញ្ហាទូទៅពេលដាក់ចេញ

#### បញ្ហា 1: Quota សេវាកម្ម OpenAI លើសកំណត់
**រោគសញ្ញា:** ការដាក់ចេញបរាជ័យដោយកំហុស quota  
**ដំណោះស្រាយ:**
```bash
# ពិនិត្យ​កូតា​បច្ចុប្បន្ន
az cognitiveservices usage list --location eastus

# ស្នើសុំ​បន្ថែម​កូតា ឬ​ព្យាយាម​តំបន់​ផ្សេង
azd env set AZURE_LOCATION westus2
azd up
```

#### បញ្ហា 2: ម៉ូដែលមិនមាននៅតំបន់
**រោគសញ្ញា:** ការឆ្លើយតប AI បរាជ័យ ឬកំហុសពេលដាក់ម៉ូដែល  
**ដំណោះស្រាយ:**
```bash
# ពិនិត្យភាពអាចប្រើបានរបស់ម៉ូឌែលតាមតំបន់
az cognitiveservices model list --location eastus

# ធ្វើបច្ចុប្បន្នភាពទៅម៉ូឌែលដែលអាចប្រើបាន
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### បញ្ហា 3: បញ្ហាសិទ្ធិ
**រោគសញ្ញា:** កំហុស 403 Forbidden ពេលហៅសេវាកម្ម AI  
**ដំណោះស្រាយ:**
```bash
# ពិនិត្យការបែងចែកតួនាទី
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# បន្ថែមតួនាទីដែលខ្វះ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### បញ្ហាសមត្ថភាព

#### បញ្ហា 4: ការឆ្លើយតប AI យឺត
**ជំហានស៊ើបអង្កេត:**
1. ពិនិត្យ Application Insights សម្រាប់ metrics សមត្ថភាព
2. ពិនិត្យ metrics នៃសេវា OpenAI នៅក្នុង Azure portal
3. ផ្ទៀងផ្ទាត់ការតភ្ជាប់បណ្តាញ និង latency

**ដំណោះស្រាយ:**
- អនុវត្តការឃេកចង (caching) សម្រាប់សំណួរដែលកើតឡើងញឹកញាប់
- ប្រើម៉ូដែល OpenAI ដែលសមសម្រាប់ករណីប្រើប្រាស់របស់អ្នក
- ពិចារណារបៀបប្រើ read replicas សម្រាប់សេណារីយ៉ូដែលមានទម្ងន់ខ្ពស់

### **លំហាត់មន្ទីរពិសោធន៍ 6.1: បញ្ហាប្រកួតដោះស្រាយកំហុស**

**សេណារីយ៉ូ**: ការដាក់ចេញរបស់អ្នកបានជោគជ័យ ប៉ុន្តែកម្មវិធីបញ្ជូនកំហុស 500។

**ភារកិច្ចសម្រាប់ដោះស្រាយកំហុស:**
1. ពិនិត្យកំណត់ហេតុកម្មវិធី
2. ផ្ទៀងផ្ទាត់ការតភ្ជាប់សេវាកម្ម
3. សាកល្បងការផ្ទៀងផ្ទាត់
4. ពិនិត្យការកំណត់

**ឧបករណ៍ដែលត្រូវប្រើ:**
- `azd show` សម្រាប់ទិដ្ឋភាពទូទៅនៃការដាក់ចេញ
- Azure portal សម្រាប់កំណត់ហេតុសេវាកម្មលម្អិត
- Application Insights សម្រាប់ telemetry នៃកម្មវិធី

## ម៉ូឌុល 7: ការតាមដាន និងអុបទីម៉ៃសិន

### ជំហាន 7.1: រៀបចំការតាមដានទូលំទូលាយ

1. **បង្កើតផ្ទាំងតាមដានផ្ទាល់ខ្លួន:**

ចូលទៅកាន់ Azure portal និងបង្កើត dashboard ដែលមាន៖
- រាប់សំណើ OpenAI និង latency
- អត្រាកំហុសកម្មវិធី
- ការប្រើប្រាស់ធនធាន
- តាមដានថ្លៃដើម

2. **រៀបចំការ​ព្រមាន (alerts):**
```bash
# ការជូនដំណឹងអំពីអត្រាកំហុសខ្ពោះ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ជំហាន 7.2: បង្កើនប្រសិទ្ធភាពថ្លៃ

1. **វិភាគថ្លៃបច្ចុប្បន្ន:**
```bash
# ប្រើ Azure CLI ដើម្បីទទួលបានទិន្នន័យចំណាយ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **អនុវត្តវិធានការគ្រប់គ្រងថ្លៃ:**
- រៀបចំការព្រមានថវិកា
- ប្រើគោលនយោបាយ autoscaling
- អនុវត្តការឃេកចងសំណើ
- តាមដានការប្រើប្រាស់ token សម្រាប់ OpenAI

### **លំហាត់មន្ទីរពិសោធន៍ 7.1: បង្កើនប្រសិទ្ធភាពការ​ប្រតិបត្តិការ**

**ភារកិច្ច**: ធ្វើឲ្យកម្មវិធី AI របស់អ្នកមានប្រសិទ្ធភាពល្អក្នុងទាំងការសមត្ថភាព និងថ្លៃចំណាយ។

**វិមាត្រដែលត្រូវបង្កើនប្រសិទ្ធភាព:**
- កាត់បន្ថយពេលឆ្លើយឆ្លងមធ្យមចុះ 20%
- កាត់បន្ថយថ្លៃប្រចាំខែចុះ 15%
- រក្សាភាព uptime 99.9%

**យុទ្ធសាស្ត្រ​ដែលត្រូវសាកល្បង:**
- អនុវត្តការឃេកចងចម្លើយ
- ធ្វើឲ្យ prompts មានប្រសិទ្ធភាពចំពោះ token
- ប្រើ SKU កុំព្យូតដែលសមស្រប
- រៀបចំ autoscaling ឲ្យបានត្រឹមត្រូវ

## ប្រកួតចុងក្រោយ: អនុវត្តពីដើមដល់ចប់

### សេណារីយ៉ូវបញ្ហា

អ្នកទទួលបេសកកម្មក្នុងការបង្កើត chatbot សេវាអតិថិជនដែលបំលែងដោយ AI និងរួចរាល់សម្រាប់ផលិតកម្ម ជាមួយតម្រូវការទាំងនេះ៖

**តម្រូវការមុខងារ:**
- ចំណុចប្រើប្រាស់វេបសម្រាប់អន្តរកម្មជាមួយអតិថិជន
- ការរួមបញ្ចូលជាមួយ Microsoft Foundry Models សម្រាប់ការឆ្លើយតប
- សមត្ថភាពស្វែងរកឯកសារដោយប្រើ Azure AI Search
- រួមបញ្ចូលជាមួយមូលដ្ឋានទិន្នន័យអតិថិជនមានស្រាប់
- គាំទ្រច្រើនភាសា

**តម្រូវការមិនមែនមុខងារ:**
- អាចទទួលអ្នកប្រើ 1000 នាក់ក្នុងពេលតែមួយ
- SLA uptime 99.9%
- អនុក្រឹត្យភាព SOC 2
- ថ្លៃក្រោម $500/ខែ
- ដាក់បញ្ចេញទៅបរិយាកាសច្រើន (dev, staging, prod)

### ជំហានអនុវត្ត

1. រចនាស្ថាបត្យកម្ម
2. បង្កើតគំរូ AZD
3. អនុវត្តវិធានការសុវត្ថិភាព
4. រៀបចំការតាមដាន និងការព្រមាន
5. បង្កើត deployment pipelines
6. រៀបចំឯកសារសម្រាប់ដំណោះស្រាយ

### គោលការណ៍វាយតម្លៃ

- ✅ **មុខងារ**: តើវាប្រកបដោយតម្រូវការទាំងអស់ឬទេ?
- ✅ **សុវត្ថិភាព**: តើមានអនុវត្តន៍អនុវត្តល្អៗឬទេ?
- ✅ **ភាពអាចពង្រីក**: តើវាអាចគ្រប់គ្រងបន្ទុកបានឬទេ?
- ✅ **ភាពងាយស្រួលក្នុងការថែទាំ**: តើកូដនិងរចនាសម្ព័ន្ធត្រូវបានធ្វើអោយមានរបៀបល្អឬទេ?
- ✅ **ថ្លៃ**: តើវានៅក្នុងថវិកាបានឬទេ?

## ប្រភពអនុបន្ថែម

### ឯកសារ Microsoft
- [ឯកសារ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ឯកសារ សេវាកម្ម Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [ឯកសារ Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### គំរូសាកល្បង
- [កម្មវិធី Chat របស់ Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [ឧទាហរណ៍ OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ជនបទធនធានសហគមន៍
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 វិញ្ញាបនបត្រសម្រេចការ

សូមអបអរសាទរ! អ្នកបានបញ្ចប់ AI Workshop Lab។ ឥឡូវនេះ អ្នកគួរតែអាច៖

- ✅ បម្លែងកម្មវិធី AI មានស្រាប់ទៅជាពុម្ព AZD
- ✅ ដាក់បញ្ចេញកម្មវិធី AI ដែលត្រៀមសម្រាប់ផលិតកម្ម
- ✅ អនុវត្តវិធានការសុវត្ថិភាពល្អបំផុតសម្រាប់បន្ទុកការងារ AI
- ✅ ត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាពនៃកម្មវិធី AI
- ✅ ដោះស្រាយបញ្ហាទូទៅនៅពេលដាក់បញ្ចេញ

### ជំហានបន្ទាប់
1. អនុវត្តលំនាំទាំងនេះទៅក្នុងគម្រោង AI របស់អ្នក
2. ចូលរួមចែកចាយពុម្ពទៅសហគមន៍
3. ចូលរួម Microsoft Foundry Discord សម្រាប់ការគាំទ្របន្ត
4. ស្វែងយល់អំពីប្រធានបទកម្រិតខ្ពស់ ដូចជា ការដាក់បញ្ចេញនៅច្រើនតំបន់

---

**មតិយោបល់សិក្ខាសាលា**: ជួយពួកយើងកែលម្អសិក្ខាសាលានេះដោយចែករំលែកបទពិសោធន៍របស់អ្នកនៅក្នុង [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**ការរុករកជំពូក:**
- **📚 ទំព័រដើមវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 2 - អភិវឌ្ឍន៍ផ្អែកលើ AI
- **⬅️ មុន**: [ការដាក់ប្រើម៉ូដែល AI](ai-model-deployment.md)
- **➡️ បន្ទាប់**: [អនុវត្តិល្អបំផុតសម្រាប់ AI ក្នុងផលិតកម្ម](production-ai-practices.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូកទី 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

ត្រូវការ ជំនួយ? ចូលរួមសហគមន៍របស់យើងសម្រាប់ការគាំទ្រនិងការពិភាក្សាអំពី AZD និងការដាក់បញ្ចេញ AI។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
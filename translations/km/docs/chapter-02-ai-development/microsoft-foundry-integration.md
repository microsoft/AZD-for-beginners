# ការរួមបញ្ចូល Microsoft Foundry ជាមួយ AZD

**ការនាវាតាមជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកថ្មី](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI ជាដំបូង
- **⬅️ ជំពូកមុន**: [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [ភ្នាក់ងារបញ្ញាសិប្បនិម្មិត](agents.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

## ទិដ្ឋភាពទូទៅ

សៀវភៅណែនាំនេះបង្ហាញពីរបៀបបញ្ចូលសេវាកម្ម Microsoft Foundry ជាមួយ Azure Developer CLI (AZD) សម្រាប់ការដាក់ពាក្យ AI បានយ៉ាងងាយស្រួល។ Microsoft Foundry ផ្តល់ជាស្រ្តីតក្រុមពេញលេញសម្រាប់ការបង្រៀន បង្ហោះ និងគ្រប់គ្រងកម្មវិធី AI ខណៈដែល AZD ធ្វើឲ្យដំណើរការស្ថាបត្យកម្ម និងដាក់ពាក្យមានភាពសាមញ្ញ។

## Microsoft Foundry ជាអ្វី?

Microsoft Foundry គឺជាវេទិកាអភិវឌ្ឍ AI រួមទាំងមូលរបស់ Microsoft ដែលមាន៖

- **បណ្ណាល័យម៉ូដែល**: ចូលប្រើម៉ូដែល AI ប្រកបដោយបច្ចេកវិទ្យាថ្មីៗ
- **Prompt Flow**: អ្នករចនារូបភាពសម្រាប់លំហូរការងារបញ្ញាសិប្បនិម្មិត
- **Microsoft Foundry Portal**: បរិយាកាសអភិវឌ្ឍបញ្ញាសិប្បនិម្មិតរួមបញ្ចូល
- **ជម្រើសដាក់ពាក្យ**: ជម្រើសច្រើនសម្រាប់ភ្ជាប់ និងបណ្ដុះបណ្ដាល
- **សុវត្ថិភាព និងសន្តិសុខ**: លក្ខណៈការពារបញ្ញាសិប្បនិម្មិតមានភារកិច្ច

## AZD + Microsoft Foundry: ល្អជាងព្រមគ្នា

| លក្ខណៈពិសេស | Microsoft Foundry | អត្ថប្រយោជន៍ការរួមបញ្ចូល AZD |
|---------|-----------------|------------------------|
| **ការដាក់ពាក្យម៉ូដែល** | ការដាក់ពាក្យតាម portal ដោយដៃ | ការដាក់ពាក្យស្វ័យប្រវត្តិ និងអាចធ្វើឡើងឡើងវិញបាន |
| **ស្ថាបត្យកម្ម** | ការកំណត់គម្រោង និងធនធាន | ចាប់ផ្តើមពី `azure.yaml`; បញ្ចេញ Bicep ឬ Terraform នៅពេលចាំបាច់ |
| **ការគ្រប់គ្រងបរិយាកាស** | ការផ្តោតលើបរិយាកាសតែមួយ | បរិយាកាសច្រើន (dev/staging/prod) |
| **ការរួមបញ្ចូល CI/CD** | សេវាកម្មដាក់ពាក្យ និងវាយតម្លៃ | ប្រើប្រាស់ឡើងវិញការកំណត់រចនាសម្ព័ន្ធនៅ GitHub Actions ឬ Azure DevOps |
| **ការគ្រប់គ្រងការចំណាយ** | ការត្រួតពិនិត្យមូលដ្ឋាន | ការបង្កើតប្រសិទ្ធភាពអ្នកចំណាយតាមបរិយាកាសជាក់លាក់ |

## លក្ខខណ្ឌខាងមុន

- ការជាវ Azure មានសិទ្ធិសមរម្យ
- Azure Developer CLI 1.37.0 ឬចុងក្រោយសម្រាប់ចរន្តកម្ម Foundry GA
- ចូលប្រើសេវាកម្ម Microsoft Foundry Models
- មានចំណេះដឹងមូលដ្ឋានអំពី Microsoft Foundry

> **បន្ទាប់ GA របស់ Foundry (2026-11-09):** កញ្ចប់ `microsoft.foundry` បានដល់កំណែ 1.0 និងទទួលបានការចេញផ្សាយទូទៅនៅ [ថ្ងៃ 5 វិច្ន័ 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/)។ ដំណើរការខាងក្រោមយោងតាមការប្រកាសនិង Microsoft Learn quickstart តំណត់។ នេះគឺជា ការត្រួតពិនិត្យឯកសារ មិនមែនការផ្ទៀងផ្ទាត់ដាក់ពាក្យក្នុងពេលជាក់លាក់ទេ។ លក្ខណៈជម្រើសមុនពេលបង្ហាញនិងការប្រើប្រាស់សំបុត្រផ្សេងៗមានស្ថានភាពផ្សេងៗ។

**លទ្ធផលការសិក្សា៖** តំឡើងកញ្ចប់ GA, ពិនិត្យ `azure.yaml` របស់ភ្នាក់ងារ, ប្រៀបធៀបចម្លើយក្នុងតំបន់ និងបានដាក់ពាក្យ, និងពន្យល់អំពីការវាយតម្លៃ CI/CD និងដែនកំណត់ការសម្អាត។ សម្រាប់ការដាក់ពាក្យភ្នាក់ងារដោយជំហាន, ទៅកាន់ [hosted-agent walkthrough](#hosted-agent-walkthrough-ga)។ ផ្នែកធនធានខាងក្រោមគ្របដណ្តប់លំនាំបញ្ចូលផ្សេងទៀត។

## គំរូរួមបញ្ចូលស្នូល

**ដែនកំណត់នៃឧទាហរណ៍៖** Bicep ខាងក្រោមមានអង្គធាតុធនធានគំរូ ប៉ុន្តែគ្មានទម្រង់ពេញលេញសម្រាប់ដាក់ពាក្យ។ ទម្រង់រួមបញ្ចូលគួរតែបានកំណត់ឈ្មោះ `location`, ធនធានយោង, អត្តសញ្ញាណ, ផល បញ្ចាំង, និងដាក់បង្ហោះកម្មវិធី។ ប្រើគំរូតំណភ្ជាប់សម្រាប់ចំណុចចាប់ផ្តើមដំណើរការ។ ឧទាហរណ៍ Bash តម្រូវអោយធ្វើការផ្ទៀងផ្ទាត់ Azure CLI ខុសពី `azd auth login`។

### គំរូ 1: រួមបញ្ចូលម៉ូដែល Microsoft Foundry

**ករណីប្រើប្រាស់**: ដាក់ពាក្យកម្មវិធីអេកដៃជាមួយម៉ូដែល Azure OpenAI នៅក្នុង Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**ស្ថាបត្យកម្ម (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

អ្នកហៅត្រូវមានអត្តសញ្ញាណគ្រប់គ្រងភ្ជាប់ និង `Cognitive Services OpenAI User` នៅជម្រៅគណនី; ការបិទកូនសោមិនផ្ដល់សិទ្ធិចូល។ ពិនិត្យរើសតំបន់/ម៉ូដែល/SKU និងក្រោមកំណត់ពីមុនដាក់ពាក្យ។

### គំរូ 2: រួមបញ្ចូលស្វែងរក AI + RAG

**ករណីប្រើប្រាស់**: ដាក់ពាក្យកម្មវិធីបង្កើតតាមការស្វែងរកបន្ថែម (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

មិនមានធនធាន ARM `Microsoft.Search/searchServices/dataConnections` សម្រាប់ការរួមបញ្ចូលនេះ។ កំណត់តារាងស្វែងរក, ប្រភពទិន្នន័យ, indexer/skillset ឬ vectorizer តាម API ផ្នែកទិន្នន័យស្វែងរកដែលគាំទ្រ។ ប្រសិនបើ Search ហៅម៉ូដែល embedding, បើកអត្តសញ្ញាណគ្រប់គ្រង, ផ្ដល់តួនាទីម៉ូដែលសមស្រប និងកំណត់ជំនាញ embedding/vectorizer របស់វា។ មើល [integrated vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization)។

### គំរូ 3: រួមបញ្ចូល Document Intelligence

**ករណីប្រើប្រាស់**: ដំណើរការទិន្នន័យឯកសារ និងវិភាគ

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 គំរូការកំណត់រចនាសម្ព័ន្ធ

### ការកំណត់អថេរបរិយាកាស

លើសពីការកំណត់ AZD ដែលមានឯកសារ ដូចជា `AZURE_LOCATION`, ទាំងនេះគឺជាឈ្មោះបញ្ចូល **ទម្រង់ផ្ទាល់ខ្លួន**។ វាមិនមានផលប៉ះពាល់ទេ លើកលែងតែទម្រង់កម្មវិធី/ពហុបរិយាកាសប្រើប្រាស់ពួកវាតាមប៉ារ៉ាម៉ែត្រ និងផែនទីបរិយាកាស។ សម្រាប់ `azure-search-openai-demo` ប្រើអាក្សរ​ឈ្មោះពិត ដូចជា `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` និង `AZURE_SEARCH_SERVICE_SKU` ជំនួស។ សមត្ថភាពម៉ូដែល​មិនមែន SKU គណនី។

**ការកំណត់ផលិតកម្ម៖**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ការកំណត់អភិវឌ្ឍន៍៖**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### ការកំណត់សុវត្ថិភាពជាមួយ Key Vault

ជម្រើសប្រើ Entra ID ជាមួយការផ្ទៀងផ្ទាត់កូនសោក្នុងតំបន់បិទ។ ខាងក្រោមគឺជាជម្រើស **ការផ្ទៀងផ្ទាត់កូនសោចាស់** សម្រាប់កម្មវិធីដែលតម្រូវការកូនសោ៖ វាតម្រូវឲ្យមានគណនីមានការតភ្ជាប់អត្តសញ្ញាណកម្មវិធីទៅម៉ាស៊ីនផ្ទាល់ និងការចូលរួម Key Vault ធ្វើការបាន។ មិនចងកូនសោឲ្យ`disableLocalAuth: true` រំពឹងថា ការហៅដោយកូនសោនឹងដំណើរការបាន។

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## លំហូរដាក់ពាក្យ

### ពន្លឺផ្សេងៗ AZD សម្រាប់ Foundry

សម្រាប់ចរន្ត GA តំឡើងកញ្ចប់ `microsoft.foundry` ជំនួសការប្រមូលពន្លឺស្នូលតែម្ដង៖

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

កញ្ចប់នេះដំឡើងភ្នាក់ងារ, ការតភ្ជាប់, អ្នកពិនិត្យ, គម្រោង, របៀបសកម្មភាព, ជំនាញ, និង ឧបករណ៍។ វាមិនបន្ថែមក្រុមបញ្ជាណាមួយ `microsoft.foundry` ទេ។ ការវាយតម្លៃ, ថ្មីទិន្នន័យ, ការតំរូវចំណាត់ថ្នាក់, និងម៉ូដែលផ្ទាល់ខ្លួនត្រូវដំឡើងផ្សេងៗនៅពេលចាំបាច់។ មើល [ការតំឡើងអភិវឌ្ឍន៍](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions)។

### ការដឹកនាំ Hosted-Agent (GA)

**ភ្នាក់ងារផ្ទាល់ខ្លួន** ប្រតិបត្តិកម្មកូដភ្នាក់ងាររបស់អ្នកលើកុំព្យូទ័រដែលគ្រប់គ្រងដោយ Foundry។ ការបំពាននេះប្រើគំរូ API Responses Python Agent Framework ពី upstream ពុំមែន SDK ភ្នាក់ងារ Service កូនឯកសារជំពូកផ្សេងទេ។

#### 1. រៀបចំ និងចាប់ផ្តើម

ប្រើថតទទេនៅក្រៅព្រឹត្តិការណ៍វគ្គសិក្សានេះ។ តំឡើង Python 3.13 ឬខាងលើ និង [uv release](https://docs.astral.sh/uv/getting-started/installation/) ចុងក្រោយ។ ការតំឡើង uv ផ្ទាល់ខ្លួនអាចប្រើ `uv self update`។ ពិនិត្យ [សិទ្ធិ Hosted-Agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), ការចូលប្រើម៉ូដែល, និងគណនីនៅក្នុងតំបន់មុនផ្គត់ផ្គង់។ មធ្យោបាយ Azure និងការហៅម៉ូដែលក្នុងតំបន់បណ្ដាលការចំណាយ។

បញ្ចប់ `azd auth login` និងការតំឡើងកញ្ចប់ខាងលើ។ កូដគំរូមូលដ្ឋានប្រើ `DefaultAzureCredential`; ប្រសិនបើប្រើការផ្ទៀងផ្ទាត់ Azure CLI ចុះឈ្មោះជាមួយ `az login` ដូចគណនីនិងតេនង់ AZD។ AZD ការចុះឈ្មោះមិនមែន Azure CLI ការចុះឈ្មោះទេ។

ប្រតិបត្តិការបញ្ជា​មួយបន្ទាត់នេះក្នុង Bash ឬ PowerShell៖

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

ជ្រើសគម្រោង Foundry ថ្មីឬមានរួច និងការជាវ និងតំបន់ចង់បាន។ ដើម្បីប្រើឡើងវិញការដាក់ពាក្យម៉ូដែល សូមបន្ថែម `--model-deployment <existing-deployment-name>` ក្នុងបណ្ដាញចាប់ផ្តើម **មុនបញ្ជាជាដើម**, ហើយជ្រើសគម្រោងដែលមានរួច។ ស្នាក់នៅថតដែលមាន `azure.yaml` អ្នកបានបង្កើតសម្រាប់បញ្ជា​សល់។

#### 2. ពិនិត្យន័យនៃការដាក់ពាក្យ

បើក `azure.yaml` ហើយស្វែងរកការកំណត់ទាំងនេះនៅក្នុង [គំរូ upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml)៖

| ការកំណត់ | ត្រូវពិនិត្យអ្វី |
|---------|---------------|
| `host: azure.ai.project` និង `deployments` | គម្រោង Foundry និងឈ្មោះម៉ូដែល គន្លង កំណែ ការដាក់ពាក្យ SKU និងសមត្ថភាព |
| `host: azure.ai.agent` និង `project` | ភ្នាក់ងារផ្ទាល់ និងថតដែលផ្ទុក code |
| `codeConfiguration` | បរិយាកាស Python និងចំណុចចូល; គំរូពិនិត្យប្រើ `python_3_13` និង `main.py` |
| `uses` | ពឹងផ្អែកលើសេវាគម្រោង Foundry |
| `container.resources` | ភាគហ៊ុន CPU និងមេមូរី បើទោះជាកូដសាងសង់ឆ្ងាយ |
| `env` | ផែនទីដាក់ពាក្យម៉ូដែល និង `PYTHONNOUSERSITE: "1"` ដើម្បីបិទការផ្ទុកកញ្ចប់អ្នកប្រើ |
| `infra.provider` | `microsoft.foundry` ដែលបង្កើតស្ថាបត្យកម្មតម្រូវការ |

ប្រាកដថាបានបញ្ជូន `azure.yaml` និងកូដភ្នាក់ងារតាមមធ្យោបាយផ្ទាល់ខ្លួន។ មិនត្រូវការស្ថាបត្យកម្មសរសេរដោយដៃសម្រាប់ចាប់ផ្តើមទេ; ប្រសិនបើត្រូវការឯកសារផ្គត់ផ្គង់ដែលអាចកែបាន អនុវត្ត [បញ្ចេញស្ថាបត្យកម្ម](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) សម្រាប់ Bicep ឬ Terraform ហើយបន្តប្រើ `azd provision`។ មិនត្រូវបញ្ជូនបណ្ណ្យាគណនេយ្យឬស្ថានភាពបរិយាកាស `.azure/`។

#### 3. ផ្គត់ផ្គង់ និងសាកល្បងក្នុងតំបន់

```bash
azd provision
azd ai agent run
```

ការផ្គត់ផ្គង់អាចបង្កើតការដាក់ពាក្យម៉ូដែលខ្វះក្នុងគម្រោងដែលបានប្រើឡើងវិញ។ ពិនិត្យមើល prompt ម៉ូដែល និងជ្រើសប្រភេទដាក់ពាក្យស្ថិតឆាប់ប្រើដូចជា Global Standard ឬ Data Zone Standard; ការគាំទ្រនិងកំរិតកំណត់អាចខុសគ្នាទៅតាមតំបន់។

រត់ក្នុងតំបន់រៀបចំវត្ថុគាំទ្រ និងបើក **Agent Inspector** ដែលអនុញ្ញាតឲ្យពិនិត្យការស្នើ, ចម្លើយ និងសកម្មភាពឧបករណ៍/ម៉ូដែល។ រក្សារត់វានិងបើក terminal ទីពីរនៅក្នុងថតគម្រោងដដែល៖

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**ពន្លឺបញ្ហា៖** ប្រាកដថាអ្នកទទួលបានចម្លើយសមរម្យ និងអាចពិនិត្យសកម្មភាពក្នុងតំបន់បាន។ ការប្រតិបត្តិតំបន់នៅតែហៅម៉ូដែល Azure របស់អ្នក; វាមិនមែនជាការសាកល្បងក្រៅបណ្ដាញឬឥតគិតថ្លៃទេ។ ប្រើ prompt ក្លោង និងជៀសវាងការបង្ហាញព័ត៌មានសម្ងាត់ក្នុង output នៃ inspector។

#### 4. ដាក់ពាក្យ និងប្រៀបធៀប

បញ្ឈប់ការរត់ក្នុងតំបន់ដោយចុច Ctrl+C ពេលបញ្ចប់។ មុនហៅពីចម្ងាយ សូមកំណត់រចនាសម្ព័ន្ធ ឬផ្ទៀងផ្ទាត់ [ការតភ្ជាប់ Application Insights និងសិទ្ធិអានត្រា](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing)។

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

នៅម៉ូដដាក់ពាក្យកូដ AZD ផ្ទុកប្រភពសម្រាប់កំណត់ Foundry ពីចម្ងាយ; អ្នកមិនចាំបាច់សាងសង់ container នៅក្នុងតំបន់សម្រាប់ផ្លូវនេះ។ លទ្ធផលដាក់ពាក្យផ្ដល់តំណភ្ជាប់កន្លែងលេង និងចំណុចចូល API។ ពិនិត្យចម្លើយពីភ្នាក់ងារដាក់ពាក្យ និងត្រា cloud; ព្រឹត្តិការណ៍ inspector ក្នុងតំបន់មិនអាចបញ្ជាក់ថាការត្រួតពិនិត្យ cloud ដំណើរការបាន។

សម្រាប់ការផ្លាស់ប្តូរបន្ត, ពិនិត្យជំរើសរចនាសម្ព័ន្ធ hosted-agent ដោយ `azd deploy --preview`។ ផ្ទុកតំណភ្ជាប់ log ជាមួយ `azd ai agent monitor --follow` ឬអalyzes ផ្នែកតំឡើង និងសិទ្ធិកាន់តាម `azd ai agent doctor`។ ការបង្ហាញក្ដីព្រាងមិនមែនជាការពិនិត្យស្ថាបត្យកម្ម ឬសន្តិសុខពេញលេញទេ។

#### 5. បន្ថែមការត្រួតពិនិត្យគុណភាពអាចធ្វើឡើងឡើងវិញ

តំឡើងការវាយតម្លៃដែលចេញផ្សាយដោយឡែក បន្ទាប់បង្កើតវត្ថុសាកល្បងសំណុំទឹកប្រាក់៖

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

សរសេរពិពណ៌នាអំពីអត្តចរិតភ្នាក់ងារនិងជ្រើស **Dataset និង evaluator**, បន្ទាប់ជ្រើស **Turn**។ ពិនិត្យនិងកែសម្រួលករណីនិងគន្លងចាត់ថ្នាក់ដែលបង្កើតរួច, រួមមានករណីសំនួរដែលមិនគាំទ្រ មុនធ្វើការកំណត់វាយតម្លៃ៖

```bash
azd ai eval init --name quality
```

ជ្រើស dataset និង rubric បានពិនិត្យហើយ និងបញ្ជាក់ការដាក់ពាក្យម៉ូដែល juez។ ពិនិត្យ `evals/azure.eval.yaml` និងយោងសេវាកម្មវាយតម្លៃក្នុង `azure.yaml`, បន្ទាប់ចុះបញ្ជីវត្ថុ និងអនុវត្ត៖

```bash
azd up
azd ai eval run start --eval quality
```

ពិនិត្យពិន្ទុ និងករណីបរាជ័យឬករណីដែលមានកំហុស; ការវាយតម្លៃបានបញ្ចប់មិនមែនជាការជូនគុណភាពដោយស្វ័យប្រវត្តិទេ។ ការបង្កើត និងពិនិត្យពិន្ទុក៏បណ្តាលឲ្យមានការចំណាយម៉ូដែលផងដែរ។ បញ្ជូនការកំណត់រចនាសម្ព័ន្ធដែលមិនមែនសម្ងាត់, dataset និង rubric ដើម្បីឲ្យក្រុមការងារប្រៀបធៀបការផ្លាស់ប្តូរ។ `azd ai agent optimize` អាចប្រើការវាយតម្លៃសមរម្យជាមូលដ្ឋានមួយ, ប៉ុន្តែពិនិត្យបេក្ខភាពមុនដាក់ពាក្យជាក់លាក់។ មើល [ជ្រកគុណភាព និងការផ្លាស់ទី](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) សម្រាប់គម្រោងចាស់និង CI។

#### 6. ប្រើឡើងវិញលំហូរសម្រាប់ CI/CD

បន្ទាប់ពី `azd up` ជោគជ័យ, រត់ `azd pipeline config` ហើយពិនិត្យមើល GitHub Actions ឬ Azure DevOps workflow ដែលបានបង្កើត។ តំឡើង `microsoft.foundry` លើ runner, បូក `azure.ai.evaluations` ប្រសិនបើបើកវាយតម្លៃ។ រក្សាទុកកំណត់បរិយាកាស checkout, sign-in និងកំណត់បរិយាកាស; ការតំឡើងតែម្ដងមិនផ្ដល់សិទ្ធិ Pipeline ទេ។

ប្រើបរិយាកាស AZD បំបែកលម្អិតក្នុងនីតិបរិវេណនីត្ឋិ, ផ្ដល់អត្តសញ្ញាណ Pipeline សិទ្ធិធនធាន និង Foundry តាមតម្រូវការ, ហើយរក្សាគណនេយ្យក្នុងសម្ងាត់ Pipeline ឬប្រើអត្តសញ្ញាណអង្គការ។ បញ្ជូនវត្ថុវាយតម្លៃហើយផ្ទៀងផ្ទាត់អត្តសញ្ញាណអាចចូលប្រើ dataset/evaluator យោង។ មើល [គំរូ pipeline វគ្គសិក្សា](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) និង [មាតិកាពាក់ព័ន្ធ Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli)។

#### 7. សម្អាតយ៉ាងមានហេតុផល

សម្រាប់ **គម្រោងថ្មីបានបង្កើតដោយបរិយាកាសនេះ**, ពិនិត្យធនធានដែលបង្ហាញដោយ `azd down` មុនពេលបញ្ជាក់: វាផ្តល់ការលុបក្រុមធនធាន និងអ្វីៗទាំងអស់នៅក្នុងវា។

សម្រាប់ **គំរោងដែលបានប្រើបញ្ជាបន្ត**, `azd down` ធ្វើឲ្យគំរោង, អ្នកភូតផ្តល់, និងធនធានផ្សេងទៀតនៅតាមកន្លែង។ ហូបធនធានដែលមិនចង់បានដែលអ្នកមានតែប៉ុណ្ណោះដោយប្រើ [ការណែនាំសំរាប់ការសម្អាតឆាប់ៗ](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); មិនត្រូវលុបក្រុមធនធានចែករំលែកសម្រាប់សម្អាតលំហាត់មួយទេ។

**ការត្រួតពិនិត្យការសម្រឹត្ដ:** ប្រាប់ថាម៉េចបណ្តាលការកំណត់ ចាត់វិធានការអាកប្បកិច្ចក្នុងតំបន់ និងពពក, បង្ហាញការឆ្លើយតបក្នុងតំបន់ និងដែលបានដាក់ជាមួយ, ពិនិត្យលទ្ធផលការវាយតម្លៃ, ហើយកំណត់ថាតើធនធានណាខ្លះនៅសល់បន្ទាប់ពីសម្អាត។

### ជាជម្រើស: ត្រៀមផ្ទាំងជាមួយជំនាញ Microsoft Foundry

តម្លើង [ជំនាញ Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) សម្រាប់ម្ចាស់ភូតផ្តល់កូដរបស់អ្នក, បន្ទាប់មកបើកថតទទេមួយផ្សេងទៀត។ សូមវាឱ្យត្រៀមផ្ទាំងគំរូ API Python Agent Framework Responses សំនុំបែបជាលក្ខណ: រៀបចំក្នុងរបៀបដាក់បញ្ចូនកូដ, ពន្យល់ `azure.yaml` ដែលបង្កើតឡើង, ហើយផ្ដល់យោបល់អំពីការជាវ, តំបន់, គំរោង, និងការដាក់បញ្ចូនម៉ូឌែល។ តម្រូវការអនុម័ត **មុនពេលបង្កើតធនធាន Azure**, ស្នើការធ្វើតេស្តក្នុងតំបន់, ហើយឈប់មុនដំបូង។ ពិនិត្យលទ្ធផលរបស់វា ហើយបន្តជំហានដាក់បញ្ចូនខាងលើតែមួយពេលដែលត្រៀមចិត្តរួច។

សម្រាប់គម្រោងដែលមានស្រាប់, `--template`/`-t` ជំនួសពាក្យសម្ព័ន្ធដែលត្រូវបានចោលហើយ `--manifest`/`-m`; ការផ្លាស់ប្តូរឈ្មោះប៉ារ៉ាម៉ែត្រមិនបង្កើតការផ្លាស់ប្តូរដល់មេនីហ្វេសទីមុនៗឬការកំណត់ភ្នាក់ងារចំណុចជាក់លាក់ទេ។ មើល [យោង AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init)។

### ការបញ្ចូនពាក្យបញ្ជាឯកតា

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### ការបញ្ចូនមើលទៅបរិយាកាសជាក់លាក់

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ការត្រួតពិនិត្យ និងការអាចមើលឃើញ

### ការរួមបញ្ចូល Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

នេះបង្កើតធនធាន Insights មួយ ដោយមិនមែនជា​ឧបករណ៍វាស់វែងទេ។ ពេលដែលកម្មវិធីរបស់អ្នកបញ្ចេញចន្លោះ model-call span, រត់សំណួរដែលមានលក្ខណ:វិភាគនេះនៅក្នុង Application Insights Logs (កែតម្រូវថ្ន/filter ដើម្បីឲ្យត្រូវនឹងឈ្មោះ span ពិតប្រាកដ​របស់អ្នក)៖

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### ការត្រួតពិនិត្យថ្លៃដើម

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

ប្រើអ្នកទទួលពិតប្រាកដ និង ត្រួតពិនិត្យអាជ្ញាប័ណ្ណ billing-scope។ កំណត់ថវិកាជូនពិនិត្យ; វាមិនមែនជាកំណត់កំណត់ការចំណាយទេ។

## 🔐 លំហាត់ល្អបំផុតសុវត្ថិភាព

### ការកំណត់ Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### សុវត្ថិភាពបណ្ដាញ

ផ្នែក endpoint នេះត្រូវការបន្ថែម private DNS zone/group, តំណភ្ជាប់ VNet, ការតភ្ជាប់ VNet សម្រាប់កម្មវិធី និងគោលនយោបាយ public-access ដ៏ច្បាស់លាស់។ ការបង្កើត private endpoint ម្នាក់ឯងមិនបិទការចូលលើសាធារណៈទេ។

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## ការបង្កើតប្រសិទ្ធភាព

### វិធីសាស្ត្រការកាលកម្ម

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium កំពុងនៅលើ [ផ្លូវចាកចេញ](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); ការប្រើ Azure Managed Redis សម្រាប់ការបញ្ចូនថ្មី និងអនុវត្តន៍គំរូ/ការផ្ទៀងផ្ទាត់បច្ចុប្បន្នរបស់វា។ កំណត់ពាក្យបម្លែង AI តាមជាលក្ខណៈអាជ្ញាប័ណ្ណ ម៉ូឌែល/សេចក្តីណែនាំ និងកំណែទិន្នន័យ ជាមួយការផុតកំណត់; មិនចែករំលែកចម្លើយឯកជនដោយប្រើខ្លួនសំណួរតែមួយទេ។

### ការកំណត់ Auto-scaling

**ធនធានផ្នែកចំណែក:** សម្រួលការកំណត់ scale/ingress ទាំងនេះទៅជា Container App ទាំងមូល ដែលមានបរិយាកាសគ្រប់គ្រង រូបភាព container និងកំណត់ដែនធនធាន។ ជំនាន់ច្រើនមិនបង្កើនកម្រិតម៉ូឌែលទេ។

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## ការដោះស្រាយបញ្ហាទូទៅ

### បញ្ហា 1: លើសកម្រិត quota OpenAI

**រោគសញ្ញា:**
- ការបញ្ចូនបរាជ័យដោយមានកំហុស quota
- កំហុស 429 នៅក្នុងកំណត់ហេតុកម្មវិធី

**ដំណោះស្រាយ:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

អថេរចំនុះខាងលើមានអនុភាពត្រឹមតែសម្រាប់គំរូផ្ទាល់ខ្លួនដែលភ្ជាប់សម្រាប់ប្រើប្រាស់វា។ សម្រាប់គំរូ RAG, ប្រើ `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`។ កុំផ្លាស់ប្តូរ `AZURE_LOCATION` ដើម្បីផ្លាស់ទីធនធានមានស្រាប់; បង្កើតបរិមាណថ្មីសម្រាប់តំបន់ថ្មី និងផែនការផ្លាស់ប្តូរ/សំអាត។

### បញ្ហា 2: បរាជ័យក្នុងការផ្ទៀងផ្ទាត់

**រោគសញ្ញា:**
- កំហុស 401/403 ពេលហៅសេវាកម្ម AI
- សារ "Access denied"

**ដំណោះស្រាយ:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### បញ្ហា 3: បញ្ហាក្នុងការបញ្ចូនម៉ូឌែល

**រោគសញ្ញា:**
- ម៉ូឌែលមិនមានក្នុងការបញ្ចូន
- កំណែម៉ូឌែលជាក់លាក់បរាជ័យ

**ដំណោះស្រាយ:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## គំរូគំរូ

ទាំងនេះជាជម្រើសមួយ មិនមែនជាពាក្យបញ្ជាដែលសម្របសម្រួលតាមលំដាប់។ ចាប់ផ្តើមរាល់មួយនៅក្នុងថតទិន្នន័យទំនេរផ្សេងគ្នា។ កន្លែងដាក់ `.` បង្ហាញថាការចាប់ផ្តើមនៅក្នុងថតបច្ចុប្បន្នរបស់អ្នក; ប្រសិនបើគ្មាន វា AZD អាចបង្កើតថត conchild ដោយមានឈ្មោះគំរូដោយមិនផ្លាស់ប្តូរទីតាំង shell ជួយការងារ។

### កម្មវិធី RAG Chat (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ការពិពណ៌នា**: កម្មវិធី RAG chat ឧទាហរណ៍សម្រាប់សំណួរពីឯកសាររបស់អ្នក ជាមួយបណ្ដាញស្វែងរក Azure AI។ ពិនិត្យគំរូបច្ចុប្បន្នម៉ូឌែលគាំទ្រ, លក្ខណៈជ្រើសរើស, មគ្គុទេសក៍ថ្លៃដើម និងការរៀបចំសម្រាប់ផលិតកម្មមុនការប្រើប្រាស់; ការបញ្ចូនគំរូមិនមានន័យថាកម្មវិធីរួចរាល់សម្រាប់ផលិតកម្មទេ។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### កម្មវិធី RAG Chat (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ការពិពណ៌នា**: ទំរង់ .NET/C# ស្រដៀងទៅនឹងគំរូ RAG chat Python។ បង្កើតជាមួយ ASP.NET Core Minimal API និង Blazor WebAssembly តំបន់មុខខាងមុខ។ រួមបញ្ចូលការជជែកសំលេង, GPT-4o-mini vision គាំទ្រ និងអ្នកប្រើ .NET MAUI Blazor Hybrid desktop/mobile ។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### កម្មវិធី RAG Chat (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ការពិពណ៌នា**: ជាបំណែក Java នៃគំរូ RAG chat ប្រើ Langchain4J សម្រាប់ការគ្រប់គ្រង AI។ គាំទ្រស្ថាបត្យកម្ម microservice type event-driven, វិធីសាស្ត្រស្វែងរកច្រើនប្រភេទ (អត្ថបទ, vector, hybrid), បញ្ចូលឯកសារជាមួយ Azure Document Intelligence, និងការបញ្ចូនលើ Azure Container Apps ឬ Azure Kubernetes Service។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### កម្មវិធី Enterprise Retail Copilot ជាមួយ Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**សេវាកម្ម**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ការពិពណ៌នា**: តួនាទីខាងលក់រាយរួមបញ្ចូល RAG copilot ប្រើ Microsoft Foundry និង Prompty។ ជា chatbot រៀបចំដោយ Contoso Outdoor ដែលផ្ដល់ចម្លើយជាស្តង់ដារពីបញ្ជីផលិតផល និងទិន្នន័យបញ្ជាទិញអតិថិជន។ បង្ហាញដំណើរការ GenAIOps ពេញលេញ — ប្រើ Prompty សម្រាប់សាកល្បង, វាយតម្លៃជាមួយអ្នកវាយតម្លៃជំនួយ AI និងបញ្ចូនតាម AZD ទៅ Container Apps។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template contoso-chat .
azd up
```

### កម្មវិធី Multi-Agent សម្រាប់ការច្នៃប្រឌិត

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**សេវាកម្ម**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ការពិពណ៌នា**: គំរូ multi-agent បង្ហាញការគ្រប់គ្រងភ្នាក់ងារជាមួយ Prompty។ ប្រើភ្នាក់ងារស្រាវជ្រាវ (Bing Grounding នៅក្នុង Azure AI Agent Service), ភ្នាក់ងារផលិតផល (Azure AI Search), ភ្នាក់ងារចងក្រង និងភ្នាក់ងារកែប្រែ ដើម្បីផលិតអត្ថបទស្រាវជ្រាវល្អ។ រួមបញ្ចូល CI/CD ជាមួយការវាយតម្លៃក្នុង GitHub Actions។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### RAG Chat Serverless (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**សេវាកម្ម**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB សម្រាប់ NoSQL + LangChain.js

**ការពិពណ៌នា**: chatbot RAG ដោយមិនមានម៉ាស៊ីនបម្រើ (serverless) ទាំងមូល ប្រើ LangChain.js ជាមួយ Azure Functions សម្រាប់ API និង Azure Static Web Apps សម្រាប់ផ្ទះបាយ។ ប្រើ Azure Cosmos DB ជារក្សាទុក vector និងទិន្នន័យប្រវត្តិ chat។ គាំទ្រការអភិវឌ្ឍនៅក្នុងស្រុកជាមួយ Ollama សម្រាប់ការតេស្តដោយឥតគិតថ្លៃ។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat ជាមួយ Data Solution Accelerator របស់អ្នក

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**សេវាកម្ម**: Microsoft Foundry + Azure Container Apps (វេប/API/ingestion) + Azure AI Search ជាមួយ Cosmos DB, ឬ PostgreSQL ជាមួយ pgvector

**ការពិពណ៌នា**: ជំរើសឆាតផ្អែកលើឯកសារជាមួយការដកប្រាក់យោង។ គំរូបច្ចុប្បន្នមបញ្ចេញ React frontend, FastAPI backend, ហើយ Functions ingestion worker លើ Container Apps; ជម្រើស orchestrator មាន Agent Framework និង LangGraph។ ជម្រើសទិន្នន័យនិងការស្វែងរកត្រូវបានជ្រើសនៅពេលបញ្ចូន។ វាជាចំណុចចាប់ផ្តើម មិនមែនជាប្រព័ន្ធផលិតកម្មត្រៀមរួចទាំងស្រុងទេ; កុំគិតថា App Service, Semantic Kernel ឬ Prompt Flow កំណែចាស់ សម្គាល់ជាគំរូលំនាំដើមបច្ចុប្បន្ន។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### ភ្នាក់ងារ AI ដំណើរកម្សាន្ត — ការគ្រប់គ្រង Multi-Agent MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**សេវាកម្ម**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ការពិពណ៌នា**: កម្មវិធីឧទាហរណ៍សម្រាប់ការគ្រប់គ្រង multi-agent AI ប្រើប្រាស់បីស៊េរី (LangChain.js, LlamaIndex.TS, និង Microsoft Agent Framework)។ មានម៉ាស៊ីនមេ MCP (Model Context Protocol) ដោយបញ្ចូលជាសេវា serverless នៅ Azure Container Apps ជាមួយ OpenTelemetry ត្រួតពិនិត្យ។

**ចាប់ផ្តើមលឿន**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **រុករកគំរូបន្ថែម**: ចូលទៅកាន់ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) សម្រាប់គំរូដែលមានទំនិញនៅក្នុងភាសានិងសេណារីយ៉ូផ្សេងៗ។ គំរូរាងតំណភ្ជាប់រាល់មួយគឺជាកម្មវិធីរក្សាទុកខាងក្រៅ មិនមែនជាគំរូក្នុងមូលដ្ឋានដែលផ្តល់ដោយមេរៀននេះទេ; សូមពិនិត្យតម្រូវការបច្ចុប្បន្ន និងមគ្គុទេសក៍ផលិតកម្មមុនការបញ្ចូន។

## ជំហានបន្ទាប់

1. **សាកល្បងគំរូទាំងនេះ**: ចាប់ផ្តើមជាមួយគំរូដែលមានរួចដែលត្រូវនឹងករណីប្រើប្រាស់របស់អ្នក
2. **ប្តូរតាមតម្រូវការ**: កែប្រែហេដ្ឋារចនាសម្ព័ន្ធ និងកូដកម្មវិធី
3. **បន្ថែមការត្រួតពិនិត្យ**: អនុវត្តន៍ការអាចមើលឃើញពេញលេញ
4. **លេងល្បែងថ្លៃដើម**: បន្ថែមសម្រួលកំណត់សម្រាប់ថវិការបស់អ្នក
5. **សន្តិសុខការបញ្ចូន**: អនុវត្តន៍គំរូសន្តិសុខសម្រាប់ស្ថាប័នធំ
6. **បង្កើនទំហំសម្រាប់ផលិតកម្ម**: បន្ថែមមុខងារពហុតំបន់និងភាពមានស្រាប់ខ្ពស់

## 🎯 លំហាត់ដៃ

### លំហាត់ 1: បញ្ចូនកម្មវិធី Microsoft Foundry Models Chat (៣០ នាទី)
**គោលបំណង**: បញ្ចូន និងតេស្តកម្មវិធី AI chat ឧទាហរណ៍

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] បញ្ចូនបានដោយគ្មានកំហុស quota
- [ ] អាចចូលមុខងារ chat តាមរយៈកម្មវិធីរ៉ោតភើស័រ
- [ ] អាចសួរសំណួរ និងទទួលបានចម្លើយដោយ AI អនុវត្ត
- [ ] Application Insights បង្ហាញទិន្នន័យវាស់វែង
- [ ] បានសំអាតធនធានដោយជោគជ័យ

**ថ្លៃដើម:** ពិនិត្យមុខមើលមគ្គុទេសក៍ថ្លៃដើមបច្ចុប្បន្ននៃគំរូ និង SKU ដែលជ្រើសរើសមុនការបញ្ចូន។ ការចំណាយបន្តរហូតរហូតដើរឡើងដល់ការលុបធនធាន; គ្មានការវាយតម្លៃ ៣០ នាទីថេរសម្រាប់រាល់កំណត់ត្រាទាំងអស់ទេ។

### លំហាត់ 2: កំណត់ការបញ្ចូនម៉ូឌែលជាច្រើន (៤៥ នាទី)
**គោលបំណង**: បញ្ចូនម៉ូឌែល AI ច្រើនជាមួយកំណត់ត្រាផ្សេងៗ

**ចំណុចចាប់ផ្តើម:** គណនី Azure OpenAI មានស្រាប់ និងម៉ូឌុល resource-group AZD ដែលអាចហៅឯកសារនេះបាន។ បង្កើត `infra/ai-models.bicep` ជាមួយមាតិកាដូចខាងក្រោមដោយប្រើកម្មវិធីកែសម្រួលរបស់អ្នក។ វាមិនបានបញ្ចូនដោយស្វ័យប្រវត្តិទេ ដោយសារវាជាមួយ `infra/`។

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

ពីម៉ូឌុលដែលមានបរិមាណ resource-group ជាម្ចាស់គណនី នាំម៉ូឌុលភ្ជាប់មួយ (កែឈ្មោះសញ្ញាចំពោះគណនីរបស់អ្នក):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

កុំប្រកាសការដាក់ឲ្យដំណើរការដូចគ្នានៅក្នុងទាំងពីរម៉ូឌុល។ ប្រសិនបើចំណុចចូល AZD មានកម្រិតជាសប្ដាហ៍សប្ដាហ៍ សូមហៅពីម៉ូឌុលកូនដែលមានកម្រិតជាក្រុមធនធាន និងកែផ្លូវសម្ព័ន្ធទាក់ទង។ សូមបង្កើតម៉ូឌុលដូច្នេះជាមួយ `az bicep build --file <path-to-containing-module>` ហើយបន្ទាប់មក៖

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**លក្ខខណ្ឌជោគជ័យ៖**
- [ ] មានការដាក់ម៉ូដែលច្រើនដោយជោគជ័យ
- [ ] ការកំណត់សមត្ថភាពខុសគ្នាត្រូវបានអនុវត្ត
- [ ] ម៉ូឌែលអាចចូលប្រើបានតាមរយៈ API
- [ ] អាចហៅម៉ូឌែលទាំងពីរពីកម្មវិធី

### លំហាត់ 3៖ អនុវត្តន៍ការត្រួតពិនិត្យថ្លៃ (20 នាទី)
**គោលដៅ**៖ បង្កើតការជូនដំណឹងថវិកា និងការតាមដានថ្លៃ

**ចំណុចចាប់ផ្តើម៖** គំរូថវិកាខាងលើ និងម៉ូឌុលហេដ្ឋារចនាសម្ព័ន្ធដែលមានកម្រិតជាក្រុមធនធាន។ បន្ថែមទ្រព្យសម្បត្តិនេះដោយប្រើកម្មវិធីកែសម្រួលរបស់អ្នក; ផ្ញើ `budgetStartDate` ពីការច្រកប៉ារ៉ាម៉ែត្ររបស់អ្នក (កុំប្រាក់បញ្ជីប៉ារ៉ាម៉ែត្ររបស់អ្នកថ្ងៃឲ្យមានពីរ)។ ជំនួសអ្នកទទួល និងបញ្ជាក់ទំនងថាអ្នកមានការចុះបញ្ជីសិទ្ធិក្នុងការសរសេរថវិកា។

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

ព្យាករណ៍៖ ចម្លើយមាន `amount: 200` ទាំងពីរ កម្រិតសម្ពាធ និងអ្នកទទួលរបស់អ្នក។ សូមពិនិត្យ Cost Management ក្នុងវេបសាយសម្រាប់ការចំណាយពិតប្រាកដ; ព័ត៌មានថ្លៃត្រូវបានពន្យាពេល និងការជូនដំណឹងមិនចាំបាច់ត្រូវចេញឡើងនៅពេលលំហាត់ខ្លី។

**លក្ខខណ្ឌជោគជ័យ៖**
- [ ] ការជូនដំណឹងថវិកាត្រូវបានបង្កើតនៅ Azure
- [ ] ការជូនដំណឹងតាមអីមែលត្រូវបានកំណត់
- [ ] អាចមើលឃើញទិន្នន័យថ្លៃក្នុង Azure Portal
- [ ] កម្រិតថវិកាត្រូវបានកំណត់ឲ្យសមរម្យ

## 💡 សំណួរញឹកញាប់

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីកាត់បន្ថយការចំណាយម៉ូឌែល Microsoft Foundry ក្នុងដំណើរការអភិវឌ្ឍ?</strong></summary>

1. **ពិនិត្យតម្លៃ**៖ គ្មានការផ្តល់ឥតគិតថ្លៃជាតិចំនួន 50,000 token ក្នុងមួយខែសម្រាប់ម៉ូឌែល Azure OpenAI ទេ
2. **កំណត់សមត្ថភាពត្រឹមត្រូវ**៖ សមត្ថភាព `10` ទូទៅមានតម្លៃ 10,000 TPM សម្រាប់ម៉ូឌែលអត្ថបទស្តង់ដារ ទេមិនមែន 10 TPM ទេ។ ការកាត់បន្ថយកម្រិតនេះមិនកាត់បន្ថយតម្លៃជា per-token ទេ
3. **ប្រើ azd down**៖ លុបធនធានដែលអាចដោះសោបាននៅពេលមិនកំពុងអភិវឌ្ឍ (នេះមិនមែនការដកឈ្មោះ)
4. **ផ្ទុកចម្លើយក្នុងកាស**៖ អនុវត្ត Redis cache សម្រាប់សំណួរស្ទិតៗ
5. **ប្រើ Prompt Engineering**៖ កាត់បន្ថយការប្រើ token ជាមួយ prompt ប្រូហ្វេសិនណែល

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>តើមានភាពខុសគ្នាអ្វីខ្លះរវាង Microsoft Foundry Models និង OpenAI API?</strong></summary>

**Microsoft Foundry Models**៖
- សុវត្ថិភាព និងការអនុវត្តន៍តាមតម្រូវការ​អង្គការ
- សមាសធាតុនៅបណ្ដាញឯកជន
- ការធានាសេវាកម្ម SLA
- ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណដោយគ្រប់គ្រង
- ជម្រើសកម្រិតកំណត់ខ្ពស់មានអាចប្រើបាន

**OpenAI API**៖ ជាអ្នកផ្គត់ផ្គង់/ API ផ្សេងទៀតដែលមានម៉ូឌែលផ្ដល់សេវាផ្សេងៗ តម្លៃ ការផ្ទៀងផ្ទាត់ និងជម្រើសភ្ជាប់អង្គការផ្សេងៗ។ សូមប្រៀបធៀបការផ្ដល់សេវាបច្ចុប្បន្នជាជម្រើស មិនមែនគិតថាគឺមានតែបណ្តាញសាធារណៈ ឬដឹកនាំម៉ូឌែលពីមុននោះទេ។

ជ្រើសរើសដោយផ្អែកលើតម្រូវការរបស់អង្គការរបស់អ្នក; ឧទាហរណ៍អត្តសញ្ញាណគ្រប់គ្រង និងមានតំណភ្ជាប់ឯកជនក្នុង Azure មានសក្តានុពលក្នុងសេវាកម្មគ្រប់គ្រងខាងលើ ដែលមិនមែនគ្រប់ម៉ូឌែល/អ្នកផ្គត់ផ្គង់ក្នុងកាតាឡុក Foundry ទេ។
</details>

<details>
<summary><strong>តើខ្ញុំគួរតែដោះស្រាយកំហុស Microsoft Foundry Models quota exceeded ដូចម្តេច?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើទិន្នន័យផ្ទាល់ខ្លួនជាមួយ Microsoft Foundry Models បានទេ?</strong></summary>

បាទ! ប្រើ **Azure AI Search** សម្រាប់ RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

ចូលមើលគំរូ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)។
</details>

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីសុវត្ថិភាពចុងបញ្ចប់ម៉ូដែល AI?</strong></summary>

**ការអនុវត្តដែលល្អបំផុត**:
1. ប្រើ Managed Identity (មិនប្រើកូនសោ API)
2. បើក Private Endpoints
3. កំណត់ក្រុមសុវត្ថិភាពបណ្ដាញ
4. អនុវត្តកំណត់អត្រា
5. ប្រើ Azure Key Vault សម្រាប់សម្ងាត់

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## សហគមន៍ និង គាំទ្រ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [បញ្ហា និង ការពិភាក្សា](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ឯកសារផ្លូវការជាផ្លូវការ](https://learn.microsoft.com/azure/ai-studio/)
- **ជំនាញ Agent**: [ជំនាញ Microsoft Foundry នៅលើ skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ដំឡើងជំនាញ Azure + Foundry agent នៅក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកជាមួយ `npx skills add microsoft/github-copilot-for-azure`

---

**ការត្រួតពិនិត្យជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI-First
- **⬅️ ជំពូកមុន**: [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [AI Agents](agents.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយទេ?** ចូលរួមពិភាក្សាសហគមន៍របស់យើងឬបើកបញ្ហានៅក្នុងឃ្លាំង។ សហគមន៍ Azure AI + AZD ស្ថិតនៅទីនេះដើម្បីជួយអ្នកឱ្យជោគជ័យ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# គំរោងដំបូងរបស់អ្នក - មគ្គុទេសក៍អនុវត្តន៍ដោយដៃ

**ការស្វែងរកជាមេស្សា៖**
- **📚 ទំព័រដើមនៃវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 វគ្គបច្ចុប្បន្ន**: វគ្គទី ១ - មូលដ្ឋាន និងការចាប់ផ្ដើមរហ័ស
- **⬅️ មុននេះ**: [ការតំឡើង និងការកំណត់រចនា](installation.md)
- **➡️ បន្ទាប់**: [យកកម្មវិធីរបស់អ្នកមកប្រើ](bring-your-own-app.md)
- **🚀 វគ្គបន្ទាប់**: [វគ្គទី ២៖ ការអភិវឌ្ឍ AI ជាជម្រើសដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ណែនាំ

សូមស្វាគមន៍ចំពោះគំរោង Azure Developer CLI ដំបូងរបស់អ្នក! អ្នកនឹងដាក់បង្ហោះកម្មវិធី todo ដែលមានមុខងារមុខម៉ាស៊ីន React, API Node.js និង Azure Cosmos DB។ គំរូនៅតែរក្សានាមប្រវត្តិ `todo-nodejs-mongo`; ស្ថាបត្យកម្មបច្ចុប្បន្នប្រើ Cosmos DB សម្រាប់ NoSQL ដូច្នេះសូមពិនិត្យ README និង `infra/` ដែលបានទាញចុះ មិនត្រូវប៉ាន់ស្មាន API ឌីភាគទិន្នន័យពីឈ្មោះទេ។

> បានពិនិត្យប្រកបដោយភាពត្រឹមត្រូវតាម `azd 1.37.2` និងគំរូសារពាណិជ្ជកម្មក្នុងខែវិច្ឆិកា ២០២៦។ ឧទាហរណ៍ខាងក្រោមប្រើ Bash; ការដកចេញ JSON ក៏ត្រូវការផងដែរ `jq`។ ការដាក់បង្ហោះ Azure មានការបង់ប្រាក់ ហើយមិនបានបំពេញក្នុងការពិនិត្យនេះឡើយ។

## គោលបំណងរៀន

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹងអាច:
- បMaster workflow ការចាប់ផ្ដើមគំរោង azd ដោយប្រើគំរូ
- យល់ដឹងពីរចនាសម្ព័ន្ធគំរោង Azure Developer CLI និងឯកសារកំណត់​ប្រែប្រួល
- បំពេញការដាក់បង្ហោះកម្មវិធីពេញលេញទៅ Azure ជាមួយនឹងការបំប៉នស្ថាបត្យកម្ម
- អនុវត្តន៍វិធីសាស្ត្រកែប្រែ និងដាក់បង្ហោះឡើងវិញកម្មវិធី
- គ្រប់គ្រងបរិយាកាសច្រើនសម្រាប់ការអភិវឌ្ឍន៍ និងការវាយតម្លៃ
- អនុវត្តន៍ការប្រើប្រាស់ធនធានបរិសុទិងការគ្រប់គ្រងថ្លៃដើម

## លទ្ធផលការសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច:
- ចាប់ផ្ដើមនិងកំណត់តម្លើងគំរោង azd ពីគំរូដោយឯករាជ្យ
- រុករកនិងកែប្រែរចនាសម្ព័ន្ធគំរោង azd បានយ៉ាងមានប្រសិទ្ធភាព
- ដាក់បង្ហោះកម្មវិធី Full-stack ទៅ Azure ដោយប្រើពាក្យបញ្ជាមួយ
- ដោះស្រាយបញ្ហាការដាក់បង្ហោះទូទៅ និងបញ្ហាផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
- គ្រប់គ្រងបរិយាកាស Azure ច្រើនសម្រាប់វគ្គដាក់បង្ហោះផ្សេងគ្នា
- អនុវត្តន៍ workflow ដាក់បង្ហោះតំណរភ្ជាប់សម្រាប់ការអាប់ដេតកម្មវិធី

## ចាប់ផ្ដើម

### បញ្ជីពិនិត្យតម្រូវការ
- ✅ បានដំឡើង Azure Developer CLI ([មគ្គុទេសក៍តំឡើង](installation.md))
- ✅ បានផ្ទៀងផ្ទាត់ AZD ជាមួយ `azd auth login`
- ✅ Git បានដំឡើងលើប្រព័ន្ធរបស់អ្នក
- ✅ Node.js 22 LTS (ឬជំនាន់ដែលគាំទ្រដែលត្រូវការដោយគំរូទាញចុះ)
- ✅ Visual Studio Code (ផ្តល់អនុសាសន៍)

មុនអនុវត្ត បើកកម្មវិធីត្រួតពិនិត្យពី root របស់ repository៖

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ផ្ទៀងផ្ទាត់ការតំឡើងរបស់អ្នក
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ផ្ទៀងផ្ទាត់ការផ្ទៀងផ្ទាត់បន្ថែម Azure CLI

```bash
az account show
```

### ពិនិត្យមើលជំនាន់ Node.js
```bash
node --version
```

## ជំហានទី ១៖ ជ្រើសរើសនិងចាប់ផ្ដើមគំរូ

ចាប់ផ្ដើមជាមួយគំរូកម្មវិធី todo ដែលពេញន្តិយមមួយ ដែលមានមុខងារមុខម៉ាស៊ីន React និង API Node.js ខាងក្រោយ។

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### តើបានកើតអ្វីឡើង?
- បានទាញយកកូដគំរូទៅថតក្នុងម៉ាស៊ីនរបស់អ្នក
- បង្កើតឯកសារ `azure.yaml` ដែលមានការកំណត់សេវា
- បានកំណត់កូដស្ថាបត្យកម្មក្នុងថត `infra/`
- បង្កើតការកំណត់បរិយាកាស

## ជំហានទី ២៖ ស្វែងរករចនាសម្ព័ន្ធគំរោង

រង់ចាំមើលអ្វីដែល azd បានបង្កើតសម្រាប់យើង៖

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

អ្នកគួរមើលឃើញ៖
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ឯកសារសំខាន់ៗដែលត្រូវយល់

**azure.yaml** - ដួងចិត្តនៃគំរោង azd របស់អ្នក៖
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - ការកំណត់ស្ថាបត្យកម្ម៖
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ជំហានទី ៣៖ ប្ដូរការងាររបស់អ្នក (មិនបាច់ធ្វើ)

មុនការដាក់បង្ហោះ អ្នកអាចប្ដូរយកការតំឡើងកម្មវិធី។

### កែប្រែផ្នែកមុខម៉ាស៊ីន
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ចម្លងការផ្លាស់ប្តូរងាយៗមួយ៖
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### កំណត់អថេរបរិយាកាស
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

តម្លៃប្ដូរពីរ​នេះបង្ហាញអំពីការផ្ទុកត្រឹមតែផ្ទាល់ខ្លួនតែប៉ុណ្ណោះ។ គំរូដើមមិនប្រើ `WEBSITE_TITLE` ឬ `API_VERSION` ដូច្នេះមិនផ្លាស់ប្ដូរកម្មវិធីទេ។ ការកែប្រែដើមមានប្រភពខាងលើផ្លាស់ប្ដូរតួចំណងជើងដែលបង្ហាញ។

## ជំហានទី ៤៖ ដាក់បង្ហោះទៅ Azure

ឥឡូវនេះសម្រាប់ផ្នែកគួរឲ្យរំភើប - ដាក់បង្ហោះសារពេញលេញទៅ Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### តើកើតអ្វីខ្លះក្នុងដំណើរការដាក់បង្ហោះ?

Workflow នេះដាក់ស្ថាបត្យកម្ម និងដាក់ទំនិញ/ដាក់កូដ។ ការចាត់កាលវិភាគអាចកែលម្អតាម `workflows.up` នៅក្នុង `azure.yaml`; គំរូនេះបញ្ជាក់ provision មុនរួច deploy ។ កុំទុកចិត្តលើលំដាប់ universal សម្រាប់គំរូគ្រប់ប្រភេទ។

### លទ្ធផលដែលរំពឹងទុក
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ជំហានទី ៥៖ សាកល្បងកម្មវិធីរបស់អ្នក

### ចូលប្រើកម្មវិធីរបស់អ្នក
ចុច URL ដែលបានផ្តល់នៅលើលទ្ធផលដាក់បង្ហោះ ឬទទួលយកវានៅពេលណាមួយ៖
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### សាកល្បងកម្មវិធី Todo
1. **បន្ថែមការងារផ្សេងទៀត** - ចុច "Add Todo" ហើយបញ្ចូលភារកិច្ច
2. **សម្គាល់ថាបានបញ្ចប់** - ផ្ទៀងផ្ទាត់មុខងារបញ្ចប់
3. **លុបទិន្នន័យ** - ដកចេញការងារដែលមិនចាំបាច់

### តាមដានកម្មវិធីរបស់អ្នក
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ ផ្ទៀងផ្ទាត់ការដាក់បង្ហោះរបស់អ្នក

មុនបន្ត ត្រួតពិនិត្យបញ្ជីនេះឆាប់ៗ ដើម្បីបញ្ជាក់ថាគ្រប់យ៉ាងដំណើរការល្អ - កុំសន្មតថា "ដាក់បង្ហោះជោគជ័យ" មានន័យថា "កម្មវិធីដំណើរការ" ទេ។

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**ដាក់បង្ហោះត្រូវបានផ្ទៀងផ្ទាត់នៅពេល:**
- ✅ `azd show` បង្ហាញ URL endpoint ដែលអាចចូលដំណើរការ
- ✅ URL បើកក្នុងកម្មវិធីរុករករបស់អ្នកដោយគ្មានកំហុស
- ✅ មុខងារសំខាន់ៗធ្វើការ (បន្ថែម/បញ្ចប់/លុប Todo)
- ✅ `azd monitor --logs` បង្ហាញសំណើរសុំមកដល់ដោយគ្មានកំហុសដែលមិនរំពឹងទុក

ប្រសិនបើការត្រួតពិនិត្យណាមួយបរាជ័យ ចូលទៅកាន់ [វគ្គទី ៧ៈ ដោះស្រាយបញ្ហា](../chapter-07-troubleshooting/README.md)។

## ជំហានទី ៦៖ ប្ដូរនិងដាក់បង្ហោះឡើងវិញ

យើងចាប់ផ្ដើមប្ដូរមួយ ហើយមើលថាតើវាងាយដូចម្តេចក្នុងការអាប់ដេត៖

### កែប្រែ API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

បន្ថែមក្បាលប្រតិទិនប្ដូរតបស្វ័យប្រវត្តិ៖
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ដាក់បង្ហោះតែការផ្លាស់ប្ដូរកូដប៉ុណ្ណោះ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ជំហានទី ៧៖ គ្រប់គ្រងបរិយាកាសច្រើន

បង្កើតបរិយាកាស staging ដើម្បីសាកល្បងការផ្លាស់ប្ដូរមុនពេលបញ្ចេញផលិតកម្ម៖

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### ប្រៀបធៀបបរិយាកាស
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ជំហានទី ៨៖ សម្អាតធនធាន

ពេលអ្នកបានសាកល្បងរួច សម្អាតដើម្បីចៀសវាងការចំណាយបន្តទៀត៖

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## កម្មវិធីបុរាណនឹងកម្មវិធី AI: Workflow តែមួយគត់

អ្នកបានដាក់បង្ហោះកម្មវិធីបណ្ដាញបុរាណមួយ។ តែក្នុងករណីអ្នកចង់ដាក់បង្ហោះកម្មវិធី AI ដូចជា កម្មវិធីជជែកដែលយកឧបករណ៍ Microsoft Foundry Models?

ដំណឹងល្អ: **workflow គឺដូចគ្នាឲ្យបានតែមួយ។**

| ជំហាន | កម្មវិធី Todo បុរាណ | កម្មវិធីជជែក AI |
|------|-----------------|-------------|
| ចាប់ផ្ដើម (ថតទទេ) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| ផ្ទៀងផ្ទាត់អត្តសញ្ញាណ | `azd auth login` | `azd auth login` |
| ដាក់បង្ហោះ | `azd up` | `azd up` |
| តាមដាន | `azd monitor` | `azd monitor` |
| សម្អាត | `azd down --force --purge` | `azd down --force --purge` |

ការបញ្ជាររសជាតិជីវិតគឺដូចគ្នា ប៉ុន្តែតម្រូវការមានភាពខុសគ្នា។ គំរូ AI អាចត្រូវការចូលដំណើរការម៉ូដែល, កំណត់ quota តំបន់, ការបញ្ចូលទិន្នន័យ និងការកំណត់បន្ថែមផ្សេងទៀត។ សូមអាន README របស់វាមុនការដាក់បង្ហោះ; `azd up` មិនអាចផ្តល់សិទ្ធិឬ quota ដែលខ្វះខាតបានទេ។

នេះគឺជាគោលការណ៍សំខាន់នៃ azd៖ **workflow មួយ សម្រាប់បញ្ចូលការងារណាមួយ។** ជំនាញដែលអ្នកបានហាត់ក្នុងមគ្គុទេសក៍នេះ - ចាប់ផ្ដើម, ដាក់បង្ហោះ, តាមដាន, ដាក់ឡើងវិញ និងសម្អាត - អាចអនុវត្តបានសម្រាប់កម្មវិធី AI និងប្រតិបត្ដិការ។

---

## អ្វីដែលអ្នកបានរៀន

សូមអបអរសាទរ! អ្នកបានដោយជោគជ័យក្នុងការជូនដំណឹង៖
- ✅ ចាប់ផ្ដើមគំរោង azd ពីគំរូមួយ
- ✅ ស្វែងរករចនាសម្ព័ន្ធគំរោង និងឯកសារសំខាន់ៗ
- ✅ ដាក់បង្ហោះកម្មវិធី Full-stack ទៅ Azure
- ✅ កែប្រែកូដ និងដាក់បង្ហោះឡើងវិញ
- ✅ គ្រប់គ្រងបរិយាកាសច្រើន
- ✅ សម្អាតធនធាន

## 🎯 ការប្រឡងបញ្ញាបច្ចេកទេសបញ្ជាក់ជំនាញ

### លំហាត់ ១៖ ដាក់បង្ហោះគំរូផ្សេង (១៥ នាទី)
**គោលបំណង**៖ បង្ហាញជំនាញ azd init និង workflow ដាក់បង្ហោះ

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**លទ្ធផលសម្រេចបាន៖**
- [ ] កម្មវិធីដាក់បង្ហោះដោយគ្មានកំហុស
- [ ] អាចចូលប្រើ URL កម្មវិធីក្នុងកម្មវិធីរុករក
- [ ] កម្មវិធីធ្វើការ​ត្រឹមត្រូវ (បន្ថែម/ដក Todo)
- [ ] សម្អាតធនធានដោយជោគជ័យ

### លំហាត់ ២៖ ប្ដូរកំណត់ការកំណត់ (២០ នាទី)
**គោលបំណង**៖ ផ្ទៀងផ្ទាត់ការផ្ទុកតម្លៃបរិយាកាសតែក្នុងមូលដ្ឋាន ជៀសវាងវាជា configuration លើ runtime

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**លទ្ធផលសម្រេចបាន៖**
- [ ] បរិយាកាសប្ដូរបានបង្កើតបានជោគជ័យ
- [ ] អថេរបរិយាកាសត្រូវបានកំណត់និងអាចយកបាន
- [ ] `azd env get-value APP_TITLE` បោះពុម្ព `My Custom Todo App`
- [ ] អាចពន្យល់ហេតុផលដែលតម្លៃទាំងនេះមិនផ្លាស់ប្ដូរកម្មវិធីដើមទេលឿនប្រសិនបើកូដ/ស្ថាបត្យកម្មមិនប្រើ

### លំហាត់ ៣៖ Workflow បរិយាកាសច្រើន (២៥ នាទី)
**គោលបំណង**៖ ជំនាញគ្រប់គ្រងបរិយាកាស និងវិធីសាស្រ្តដាក់បង្ហោះ

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**លទ្ធផលសម្រេចបាន៖**
- [ ] បរិយាកាសពីរបានបង្កើតជាមួយការកំណត់ផ្សេងគ្នា
- [ ] បរិយាកាសទាំងពីរត្រូវបានដាក់បង្ហោះជោគជ័យ
- [ ] អាចប្តូរពីបរិយាកាសមួយ ទៅមួយផ្សេងដោយប្រើ `azd env select`
- [ ] អថេរបរិយាកាសខុសគ្នារវាងបរិយាកាសផ្សេងៗ
- [ ] សម្អាតបរិយាកាសទាំងពីរដោយជោគជ័យ

## 📊 ការរីកចម្រើនរបស់អ្នក

**ម៉ោងដែលបានចំណាយ**: ~៦០-៩០ នាទី  
**ជំនាញដែលបានទទួល**:
- ✅ ការចាប់ផ្ដើមគំរោងពីគំរូ
- ✅ ការបំប៉នធនធាន Azure
- ✅ Workflow ដាក់បង្ហោះកម្មវិធី
- ✅ ការគ្រប់គ្រងបរិយាកាស
- ✅ ការគ្រប់គ្រងកំណត់​ទុក
- ✅ ការសម្អាតធនធាន និងការគ្រប់គ្រងថ្លៃដើម

**ជំហានបន្ទាប់**: អ្នកព្រាង្រោយសម្រាប់ [មគ្គុទេសក៍កំណត់ប្រែប្រួល](../chapter-03-configuration/configuration.md) ដើម្បីរៀនល្បើមកំណត់ប្រែប្រួលខ្ពស់!

## ដោះស្រាយបញ្ហាទូទៅ

### កំហុសផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### ករណីបរាជ័យដាក់បង្ហោះ
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ទ្រព្យសម្បត្តិបញ្ហាឈ្មោះដូចគ្នា
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### បញ្ហាពីផត/បណ្ដាញ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## ជំហានបន្ទាប់

ឥឡូវនេះអ្នកបានបញ្ចប់គំរោងដំបូងរបស់អ្នក សូមរុករកប្រធានបទខ្ពស់ៗទាំងនេះ៖

### ១. ប្ដូរស្ថាបត្យកម្ម
- [ស្ថាបត្យកម្មជា Code](../chapter-04-infrastructure/provisioning.md)
- [បន្ថែមស្ថាបត្យកម្មមូលដ្ឋានទិន្នន័យ](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### ២. កំណត់ CI/CD
- [មគ្គុទេសក៍ដាក់បង្ហោះ](../chapter-04-infrastructure/deployment-guide.md) - Workflow CI/CD ពេញលេញ
- [ឯកសារប្រើប្រាស់ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - ការកំណត់បណ្ដាញបញ្ជា

### ៣. គោលការណ៍ល្អក្នុងផលិតកម្ម
- [មគ្គុទេសក៍ដាក់បង្ហោះ](../chapter-04-infrastructure/deployment-guide.md) - សុវត្ថិភាព, ការសម្តែង និងការតាមដាន

### ៤. រុករកគំរូបន្ថែម
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## ធនធានបន្ថែម

### សម្ភារៈសិក្សា
- [ឯកសារប្រើប្រាស់ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [មជ្ឈមណ្ឌលស្ថាបត្យកម្ម Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [គ្រប់គ្រងម៉ាស៊ីន Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### សហគមន៍ និងគាំទ្រ
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [សហគមន៍អ្នកអភិវឌ្ឍ Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### គំរូ និង ឧទាហរណ៍
- [វិចិត្រសាលគំរូផ្លូវការជាផ្លូវការ](https://azure.github.io/awesome-azd/)
- [ការរួមចំណែកគំរូសហគមន៍](https://github.com/Azure/awesome-azd)
- [ប្រភពគំរូ Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**អបអរសាទរជាមួយការបញ្ចប់គំរោង azd ដំបូងរបស់អ្នក!** ឥឡូវនេះអ្នកមានភាពត្រៀមខ្លួនក្នុងការសាងសង់និងដាក់បង្ហោះកម្មវិធីអស្ចារ្យនៅលើ Azure ដោយមានទំនុកចិត្ត។

---

**ការស្វែងរកជាមេស្សា៖**
- **📚 ទំព័រដើមនៃវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 វគ្គបច្ចុប្បន្ន**: វគ្គទី ១ - មូលដ្ឋាន និងការចាប់ផ្ដើមរហ័ស
- **⬅️ មុននេះ**: [ការតំឡើង និងការកំណត់រចនា](installation.md)
- **➡️ បន្ទាប់**: [យកកម្មវិធីរបស់អ្នកមកប្រើ](bring-your-own-app.md)
- **🚀 វគ្គបន្ទាប់**: [វគ្គទី ២៖ ការអភិវឌ្ឍ AI ជាជម្រើសដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
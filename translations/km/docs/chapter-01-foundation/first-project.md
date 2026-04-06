# គម្រោងដំបូងរបស់អ្នក - មេរៀនដៃបង្ហាញ

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 1 - គ្រឹះបច្ចេកទេស និងចាប់ផ្ដើមយ៉ាងរហ័ស
- **⬅️ មុន**: [ការតំឡើង និង ការតំរូវការ](installation.md)
- **➡️ បន្ទាប់**: [ការកំណត់រចនាសម្ព័ន្ធ](configuration.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូកទី 2: ការអភិវឌ្ឍ AI ជាដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ការណែនាំ

សូមស្វាគមន៍មកកាន់គម្រោង Azure Developer CLI ដំបូងរបស់អ្នក! មេរៀននេះដែលមានការប្រតិបត្តិពេញលេញផ្តល់នូវការដើរតាមដានជំហានច្បាស់លាស់សម្រាប់ការបង្កើត ការដាក់ពាក្យ និងការគ្រប់គ្រងកម្មវិធីផ្ទាល់ខ្លួនគ្មានខ្សែ លើ Azure ដោយប្រើ azd។ អ្នកនឹងធ្វើការជាមួយកម្មវិធី todo ពិតដែលរួមបញ្ចូល React មុខខាងមុខ, Node.js API ខាងក្រោយ និងមូលដ្ឋានទិន្នន័យ MongoDB។

## គោលដៅការសិក្សា

ដោយបញ្ចប់មេរៀននេះ អ្នកនឹង៖
- អាចចេះរបៀបចាប់ផ្ដើមគម្រោង azd ដោយប្រើគំរូ
- យល់ដឹងពីរចនាសម្ព័ន្ធគម្រោង Azure Developer CLI និងឯកសារកំណត់រចនាសម្ព័ន្ធ
- អនុវត្តការដាក់ពាក្យពេញលេញទៅ Azure ជាមួយការផ្តល់សេវាឧបទដ្ឋាន
- អនុវត្តយុទ្ធសាស្រ្តធ្វើបច្ចុប្បន្នភាពកម្មវិធី និងការដាក់ឡើងវិញ
- គ្រប់គ្រងបរិបទច្រើនសម្រាប់ការអភិវឌ្ឍន៍ និងការកំណត់ជាស្ថានភាពសាកល្បង
- អនុវត្តការសម្អាតធនធាន និងការគ្រប់គ្រងចំណាយ

## លទ្ធផលសិក្សា

បរិច្ចេកទេសបន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- ចាប់ផ្ដើម និងកំណត់រចនាសម្ព័ន្ធគម្រោង azd ពីគំរូដោយឯករាជ្យ
- រុករក និងកែប្រែរចនាសម្ព័ន្ធគម្រោង azd បានយ៉ាងមានប្រសិទ្ធិភាព
- ដាក់ពាក្យកម្មវិធីផ្ទាល់ខ្លួនគ្មានខ្សែទៅ Azure ដោយប្រើពាក្យបញ្ជាเดียว
- ដោះស្រាយបញ្ហាការដាក់ពាក្យជាញឹកញាប់ និងបញ្ហាអត្តសញ្ញាណ
- គ្រប់គ្រងបរិបទ Azure ជាច្រើនសម្រាប់ជំហានដាក់ពាក្យផ្សេងៗ
- អនុវត្តដំណើរការការដាក់ពាក្យជាប់លាប់សម្រាប់ការអាប់ដេតកម្មវិធី

## ការចាប់ផ្ដើម

### បញ្ជីត្រួតពិនិត្យបម្រើការជាមុន
- ✅ បានតំឡើង Azure Developer CLI ([មគ្គុទេសក៍តំឡើង](installation.md))
- ✅ បានបញ្ចប់ការផ្ទៀងផ្ទាត់ AZD ជាមួយ `azd auth login`
- ✅ បានតំឡើង Git នៅលើប្រព័ន្ធរបស់អ្នក
- ✅ Node.js 16+ (សម្រាប់មេរៀននេះ)
- ✅ Visual Studio Code (ផ្តល់អនុសាសន៍)

មុនត្រូវបន្ត សូមបើកកម្មវិធីបញ្ច្រួលការតំរូវការពីគ្រឹះដើមឃ្លាំងទិន្នន័យ៖

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ផ្ទៀងផ្ទាត់ការតំរូវការរបស់អ្នក
```bash
# ពិនិត្យការដំឡើង azd
azd version

# ពិនិត្យការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ AZD
azd auth login --check-status
```

### ផ្ទៀងផ្ទាត់ការផ្ទៀងផ្ទាត់ Azure CLI ជាជម្រើស

```bash
az account show
```

### ពិនិត្យរឿងកំណែ Node.js
```bash
node --version
```

## ជំហាន 1៖ ជ្រើសរើស និង ចាប់ផ្ដើមគំរូមួយ

ចាប់ផ្ដើមជាមួយគំរូកម្មវិធី todo ទៅរីករាយ ដែលរួមបញ្ចូល React មុខខាងមុខ និង Node.js API ខាងក្រោយ។

```bash
# រុករកគំរូដែលមាន
azd template list

# ចាប់ផ្តើមគំរូកម្មវិធី todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# អនុវត្តតាមការណែនាំ៖
# - បញ្ចូលឈ្មោះបរិយាកាស៖ "dev"
# - ជ្រើសរើសការជាវ (បើអ្នកមានច្រើន)
# - ជ្រើសរើសតំបន់៖ "East US 2" (ឬតំបន់ដែលអ្នកចូលចិត្ត)
```

### តើមានអ្វីកើតឡើង?
- បានទាញយកកូដគំរូទៅកាន់ថតទិន្នន័យតំបន់ស្រុករបស់អ្នក
- បង្កើតឯកសារ `azure.yaml` ដែលមានការបញ្ជាក់សេវាកម្ម
- តំឡើងកូដឧបករណ៍នៅក្នុងថត `infra/`
- បង្កើតកំណត់បរិបទបរិយាកាស

## ជំហាន 2៖ រុករករចនាសម្ព័ន្ធគម្រោង

មកមើលថាតើ azd បានបង្កើតអ្វីសម្រាប់យើង៖

```bash
# មើលរចនាសម្ព័ន្ធគម្រោង
tree /f   # វីនដូឌ
# ឬ
find . -type f | head -20   # macOS/Linux
```

អ្នកគួរតែឃើញ៖
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ឯកសារសំខាន់ៗដែលត្រូវយល់

**azure.yaml** - បេះដូងគម្រោង azd របស់អ្នក៖
```bash
# មើលការកំណត់រចនាសម្ព័ន្ធគម្រោង
cat azure.yaml
```

**infra/main.bicep** - ការបញ្ជាក់អហ្គួរឋានភាគ៖
```bash
# មើលកូដរចនាសម្ព័ន្ធ
head -30 infra/main.bicep
```

## ជំហាន 3៖ ផ្លាស់ប្តូរកម្មវិធីរបស់អ្នក (ជាជម្រើស)

មុនដាក់ពាក្យ អ្នកអាចផ្លាស់ប្តូរកម្មវិធីបាន៖

### កែប្រែមុខខាងមុខ
```bash
# បើកធាតុកម្មវិធី React
code src/web/src/App.tsx
```

ធ្វើការផ្លាស់ប្តូរងាយៗ៖
```typescript
// ស្វែងរកចំណងជើងហើយផ្លាស់ប្តូរវា
<h1>My Awesome Todo App</h1>
```

### កំណត់បរិបរិច្ឆេទបរិយាកាស
```bash
# កំណត់អថេរស្រោចស្រពបត់បែន
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# មើលអថេរស្រោចស្រពទាំងអស់
azd env get-values
```

## ជំហាន 4៖ ដាក់ពាក្យទៅ Azure

ឥឡូវសម្រាប់ផ្នែករំភើប - ដាក់ចូលគ្រប់អ្វីទៅ Azure!

```bash
# ដាក់ចេញហ្វើដ្ឋាន និងកម្មវិធី
azd up

# ពាក្យបញ្ជានេះនឹង:
# 1. រៀបចំធនធាន Azure (App Service, Cosmos DB, ល)
# 2. សង់កម្មវិធីរបស់អ្នក
# 3. ដាក់ចេញទៅធនធានដែលបានរៀបចំ
# 4. បង្ហាញ URL នៃកម្មវិធី
```

### តើអ្វីកំពុងកើតឡើងពេលដាក់ពាក្យ?

ពាក្យបញ្ជា `azd up` អនុវត្តជំហានខាងក្រោម៖
1. **Provision** (`azd provision`) - បង្កើតធនធាន Azure
2. **Package** - សំណុំកូដកម្មវិធីរបស់អ្នក
3. **Deploy** (`azd deploy`) - ដាក់កូដទៅធនធាន Azure

### លទ្ធផលដែលរំពឹងទុក
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ជំហាន 5៖ សាកល្បងកម្មវិធីរបស់អ្នក

### ចូលដំណើរការកម្មវិធីរបស់អ្នក
ចុចលើ URL ដែលផ្តល់ជូននៅលើលទ្ធផលដាក់ពាក្យ ឬទទួលបានវាពេលណាក៏បាន៖
```bash
# ទទួលបានចំណុចចូលកម្មវិធី
azd show

# បើកកម្មវិធីនៅក្នុងកម្មវិធីរុករករបស់អ្នក
azd show --output json | jq -r '.services.web.endpoint'
```

### សាកល្បងកម្មវិធី Todo
1. **បន្ថែមអំណោយចុះបញ្ជី** - ចុច "បន្ថែម Todo" ហើយបញ្ចូលភារកិច្ច
2. **សម្គាល់ថាជា​ការសម្រេច** - ពិនិត្យបញ្ចូលអំណោយចុះបញ្ជីដែលបានធ្វើរួច
3. **លុបអំណោយ** - ដកអំណោយ​ចុះបញ្ជីដែលអ្នកមិនចាំបាច់

### ត្រួតពិនិត្យកម្មវិធីរបស់អ្នក
```bash
# បើកទ្វារ Azure សម្រាប់ធនធានរបស់អ្នក
azd monitor

# មើលកំណត់ហេតុកម្មវិធី
azd monitor --logs

# មើលពិន្ទុរស់រវើក
azd monitor --live
```

## ជំហាន 6៖ ធ្វើបម្រែបម្រួល និងដាក់ឡើងវិញ

មកធ្វើការផ្លាស់ប្តូរមួយ ហើយមើលថាយ៉ាងងាយស្រួលក្នុងការអាប់ដេត៖

### កែប្រែ API
```bash
# កែសម្រួលកូដ API
code src/api/src/routes/lists.js
```

បន្ថែមក្បាលការឆ្លើយតបផ្ទាល់ខ្លួន៖
```javascript
// រកអ្នកកាន់តំណរប្រតិបត្តិ និងបន្ថែមៈ
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ដាក់ពាក្យតែបម្រែបម្រួលកូដប៉ុណ្ណោះ
```bash
# បញ្ចូនកូដកម្មវិធីតែប៉ុណ្ណោះ(រំលងហេដ្ឋារចនាសម្ព័ន្ធ)
azd deploy

# នេះលឿនជាង'azd up' ពោលគឺហេដ្ធារចនាសម្ព័ន្ធមានរួចហើយ
```

## ជំហាន 7៖ គ្រប់គ្រងបរិបទច្រើន

បង្កើតបរិបទសាកល្បងសម្រាប់សាកល្បងបម្រែបម្រួលមុនវេចខ្ចប់ផលិតកម្ម៖

```bash
# បង្កើតបរិវេណ staging ថ្មី
azd env new staging

# ដាក់ប្រើនៅ staging
azd up

# ប្តូរត្រលប់ទៅបរិវេណ dev
azd env select dev

# បញ្ជីបរិវេណទាំងអស់
azd env list
```

### ផ្ទៀងផ្ទាត់បរិបទ
```bash
# មើលបរិយាកាសអភិវឌ្ឍន៍
azd env select dev
azd show

# មើលបរិយាកាសចេញផ្សាយបណ្ដោះអាសន្ន
azd env select staging
azd show
```

## ជំហាន 8៖ សម្អាតធនធាន

ពេលអ្នកបានបញ្ចប់ការសាកល្បង សូមសម្អាតដើម្បីចៀសវាងការចំណាយបន្ត៖

```bash
# លុបធនធាន Azure ទាំងអស់សម្រាប់បរិយាកាសបច្ចុប្បន្ន
azd down

# យកចេញដោយបង្ខំដោយគ្មានការអះអាង និងលុបធនធានដែលបានលុបបណ្តោះអាសន្ន
azd down --force --purge

# លុបបរិយាកាសជាក់លាក់
azd env select staging
azd down --force --purge
```

## កម្មវិធីបែបសាំនិងកម្មវិធី AI៖ ដំណើរការដូចគ្នា

អ្នកទើបតែបានដាក់ពាក្យកម្មវិធីវេបសំរាប់ប្រពៃណីមួយ។ តែនៅពេលដែលអ្នកចង់ដាក់ពាក្យកម្មវិធីដែលគាំទ្រដោយ AI ដូចជា កម្មវិធីផ្ទាល់ខ្លួនជជែកដែលគាំទ្រដោយ Microsoft Foundry Models តើធ្វើដូចម្តេច?

សំណាងល្អ៖ **ដំណើរការនោះដូចគ្នា។**

| ជំហាន | កម្មវិធី Todo ជាប្រពៃណី | កម្មវិធី AI Chat |
|------|-----------------|-------------|
| ចាប់ផ្ដើម | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| ផ្ទៀងផ្ទាត់ | `azd auth login` | `azd auth login` |
| ដាក់ពាក្យ | `azd up` | `azd up` |
| ត្រួតពិនិត្យ | `azd monitor` | `azd monitor` |
| សម្អាត | `azd down --force --purge` | `azd down --force --purge` |

ភាពខុសគ្នាតែមួយគត់គឺ **គំរូ** ដែលអ្នកចាប់ផ្ដើម។ គំរូ AI រួមបញ្ចូលឧបករណ៍បន្ថែម (ដូចជា Microsoft Foundry Models ឬ AI Search index) ប៉ុន្តែ azd គ្រប់គ្រងសរុបសម្រាប់អ្នក។ អ្នកមិនចាំបាច់រៀនពាក្យបញ្ជាថ្មី ទទួលយកឧបករណ៍ផ្សេងទៀត ឬផ្លាស់ប្តូរវិធីសាស្រ្តគិតពីការដាក់ពាក្យទេ។

នេះគឺជាគោលការណ៍ចម្បងរបស់ azd៖ **ដំណើរការតែមួយ សម្រាប់កិច្ចការ​ជាច្រើន។** ជំនាញដែលអ្នកអនុវត្តក្នុងមេរៀននេះ - ចាប់ផ្ដើម, ដាក់ពាក្យ, ត្រួតពិនិត្យ, ដាក់ឡើងវិញ, និងសម្អាត - អាចអនុវត្តទៅលើកម្មវិធី AI និងភ្នាក់ងារដូចគ្នា។

---

## អ្វីដែលអ្នកបានរៀន

អបអរសាទរ! អ្នកបានជោគជ័យក្នុងការបញ្ចប់៖
- ✅ ចាប់ផ្ដើមគម្រោង azd ពីគំរូមួយ
- ✅ រុករករចនាសម្ព័ន្ធគម្រោង និងឯកសារសំខាន់ៗ
- ✅ ដាក់ពាក្យកម្មវិធីផ្ទាល់ខ្លួនគ្មានខ្សែទៅ Azure
- ✅ ប្រែបម្រួលកូដ និងដាក់ឡើងវិញ
- ✅ គ្រប់គ្រងបរិបទច្រើន
- ✅ សម្អាតធនធាន

## 🎯 លំហែរបញ្ជាក់ជំនាញ

### លំហែរទី 1៖ ដាក់ពាក្យគំរូផ្សេង (១៥ នាទី)
**គោលដៅ**: បង្ហាញជំនាញចាប់ផ្ដើម azd init និងដំណើរការដាក់ពាក្យ

```bash
# សាកល្បងស្ទាក់ Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# បញ្ជាក់ការចាក់ផ្សាយ
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# សំអាត
azd down --force --purge
```

**លទ្ធផលជោគជ័យ៖**
- [ ] កម្មវិធីដាក់ពាក្យដោយគ្មានកំហុស
- [ ] អាចចូលកម្មវិធីតាម URL នៅក្នុងកម្មវិធីរុករក
- [ ] កម្មវិធីដំណើរការបានត្រឹមត្រូវ (បន្ថែម/លុប todo)
- [ ] បានសម្អាតធនធានទាំងអស់ដោយជោគជ័យ

### លំហែរ ទី 2៖ ប្ដូរកំណត់រចនាសម្ព័ន្ធ (២០ នាទី)
**គោលដៅ**: អនុវត្តការកំណត់បរិព័ន្ធបរិយាកាស

```bash
cd my-first-azd-app

# បង្កើតបរិយាកាសផ្ទាល់ខ្លួន
azd env new custom-config

# កំណត់អថេរផ្ទាល់ខ្លួន
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ពិនិត្យអថេរ
azd env get-values | grep APP_TITLE

# អភិវឌ្ឍជាមួយការកំណត់ផ្ទាល់ខ្លួន
azd up
```

**លទ្ធផលជោគជ័យ៖**
- [ ] បរិមាណបរិបទផ្ទាល់ខ្លួនបានបង្កើតដោយជោគជ័យ
- [ ] ការកំណត់បរិព័ន្ធអាចបានយកឡើងវិញ
- [ ] កម្មវិធីដាក់ពាក្យដោយកំណត់រចនាសម្ព័ន្ធផ្ទាល់ខ្លួន
- [ ] អាចផ្ទៀងផ្ទាត់ការកំណត់ផ្ទាល់ខ្លួនក្នុងកម្មវិធីដាក់ពាក្យ

### លំហែរ ទី 3៖ ដំណើរការបរិព័ន្ធច្រើន (២៥ នាទី)
**គោលដៅ**: ជំនាញគ្រប់គ្រងបរិព័ន្ធ និងយុទ្ធសាស្រ្តដាក់ពាក្យ

```bash
# បង្កើត​បរិយាកាស​អភិវឌ្ឍន៍
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# ចំណាំ URL អភិវឌ្ឍន៍
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# បង្កើត​បរិយាកាស​ស្ទេជ៊ីង
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# ចំណាំ URL ស្ទេជ៊ីង
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# ប្រៀបធៀប​បរិយាកាស​ទាំងពីរ
azd env list

# សាកល្បង​បរិយាកាស​ទាំងពីរ
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# សម្អាត​ពីរ​ទាំងអស់
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**លទ្ធផលជោគជ័យ៖**
- [ ] បរិមាណពីរបរិបទបង្កើតជាមួយកំណត់រចនាសម្ព័ន្ធផ្សេងគ្នា
- [ ] បរិទាំងពីរក្នុងការដាក់ពាក្យដោយជោគជ័យ
- [ ] អាចប្ដូររវាងបរិទាំងពីរដោយប្រើ `azd env select`
- [ ] បរិយាកាសបរិវេណខុសគ្នារវាងបរិទាំងពីរ
- [ ] បានសម្អាតបរិទាំងពីរដោយជោគជ័យ

## 📊 ចំណុចកំណត់លំដាប់របស់អ្នក

**ពេលវេលាដែលបានដាក់បញ្ចូល**: ~60-90 នាទី  
**ជំនាញដែលបានទទួល**៖
- ✅ ចាប់ផ្ដើមគម្រោងពីគំរូ
- ✅ ផ្តល់ធនធាន Azure
- ✅ ដំណើរការដាក់ពាក្យកម្មវិធី
- ✅ គ្រប់គ្រងបរិបទ
- ✅ កំណត់រចនាសម្ព័ន្ធ
- ✅ សម្អាតធនធាន និងគ្រប់គ្រងចំណាយ

**កម្រិតបន្ទាប់**: អ្នកមានស្រេចសម្រាប់ [មគ្គុទេសក៍កំណត់រចនាសម្ព័ន្ធ](configuration.md) ដើម្បីរៀនរៀបការគ្រប់គ្រងកំណត់រចនាសម្ព័ន្ធកម្រិតខ្ពស់!

## ដោះស្រាយបញ្ហាធម្មតា

### បញ្ហាអត្តសញ្ញាណ
```bash
# បញ្ជាក់ម្ដងទៀតជាមួយ Azure
az login

# ផ្ទៀងផ្ទាត់ការចូលប្រើការជាវ
az account show
```

### បញ្ហាការដាក់ពាក្យបរាជ័យ
```bash
# អនុញ្ញាតការចុះបញ្ជីកម្រិតងាយស្រួល
export AZD_DEBUG=true
azd up --debug

# មើលកំណត់ហេតុកម្មវិធីនៅក្នុង Azure
azd monitor --logs

# សម្រាប់កម្មវិធី Container Apps, ប្រើ Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ជម្លោះឈ្មោះធនធាន
```bash
# ប្រើឈ្មោះបរិយាកាសមួយដែលមានតែមួយគត់
azd env new dev-$(whoami)-$(date +%s)
```

### បញ្ហាសួរភាគ/បណ្តាញ
```bash
# ពិនិត្យមើលថាតើព័រតមានអាចប្រើបាន។
netstat -an | grep :3000
netstat -an | grep :3100
```

## ជំហានបន្ទាប់

ឥឡូវនេះដែលអ្នកបានបញ្ចប់គម្រោងដំបូងរបស់អ្នក សូមរុករកប្រធានបទកម្រិតខ្ពស់ទាំងនេះ៖

### ១. ផ្លាស់ប្តូរអាហ្គួរឋានភាគ
- [អាហ្គួរឋានជាកូដ](../chapter-04-infrastructure/provisioning.md)
- [បន្ថែមមូលដ្ឋានទិន្នន័យ, ឃ្លាំងទិន្នន័យ និងសេវាកម្មផ្សេងៗ](../chapter-04-infrastructure/provisioning.md#adding-services)

### ២. តំឡើង CI/CD
- [មគ្គុទេសក៍ដាក់ពាក្យ](../chapter-04-infrastructure/deployment-guide.md) - ដំណើរការ CI/CD ពេញលេញ
- [ឯកសាររបស់ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - កំណត់រចនាសម្ព័ន្ធ Pipeline

### ៣. លក្ខណៈបំរើល្អបំផុតសម្រាប់ផលិតកម្ម
- [មគ្គុទេសក៍ដាក់ពាក្យ](../chapter-04-infrastructure/deployment-guide.md) - សុវត្ថិភាព, ការសម្របសម្រួល និងត្រួតពិនិត្យ

### ៤. រុករកគំរូបន្ថែម
```bash
# រុករកផមេនអ្នកតាមប្រភេទ
azd template list --filter web
azd template list --filter api
azd template list --filter database

# សាកល្បងបច្ចេកវិទ្យាផ្សេងៗ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ប្រភពបន្ថែម

### សម្ភារៈរៀន
- [ឯកសាររបស់ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [មជ្ឈមណ្ឌលរចនាសម្ព័ន្ធ Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [ស៊ុមនៃរចនាសម្ព័ន្ធល្អភាព Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### សហគមន៍ និងការគាំទ្រ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [សហគម Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### គំរូ និង ឧទាហរណ៍
- [ហាងគំរូផ្លូវការណ៍](https://azure.github.io/awesome-azd/)
- [គំរូសហគមន៍](https://github.com/Azure-Samples/azd-templates)
- [គំរូស្ទីលធំ](https://github.com/Azure/azure-dev/tree/main/templates)

---

**អបអរសាទរដែលបានបញ្ចប់គម្រោង azd ដំបូងរបស់អ្នក!** ឥឡូវអ្នកមានភាពជឿជាក់ក្នុងការរចនា និងដាក់ពាក្យកម្មវិធីល្អៗលើ Azure។

---

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 1 - គ្រឹះបច្ចេកទេស និងចាប់ផ្ដើមយ៉ាងរហ័ស
- **⬅️ មុន**: [ការតំឡើង និង ការតំរូវការ](installation.md)
- **➡️ បន្ទាប់**: [ការកំណត់រចនាសម្ព័ន្ធ](configuration.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូកទី 2: ការអភិវឌ្ឍ AI ជាដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **មេរៀនបន្ទាប់**: [មគ្គុទេសក៍ដាក់ពាក្យ](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលដែលយើងខំប្រឹងប្រែងឲ្យបានភាពត្រឹមត្រូវ សូមចងចាំថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមក្នុងភាសារបស់វាគួរត្រូវបានគេចាត់ទុកថាជា​ប្រភព​ដំណឹង​ដ៏អាថ៌កំបាំង។ សម្រាប់ព័ត៌មានសំខាន់ៗ ផ្តល់អនុសាសន៍ឲ្យប្រើការបកប្រែដោយមនុស្សវិជ្ជាជីវៈ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកប្រែខុសពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
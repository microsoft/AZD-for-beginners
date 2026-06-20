# សន្លឹកសម្គាល់បញ្ជា - ពាក្យបញ្ជា AZD ចាំបាច់

**យោងយ៉ាងរហ័សសម្រាប់គ្រប់ជំពូក**
- **📚 ទំព័រដើមវគ្គ**: [AZD For Beginners](../README.md)
- **📖 ចាប់ផ្តើមឆាប់**: [ជំពូក 1: មូលដ្ឋាន & ចាប់ផ្តើមឆាប់](../README.md#-chapter-1-foundation--quick-start)
- **🤖 ពាក្យបញ្ជា AI**: [ជំពូក 2: ការអភិវឌ្ឍន៍ផ្តល់អាទិភាពដល់ AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 កម្រិតខ្ពស់**: [ជំពូក 4: ហេដ្ឋារចនាសម្ព័ន្ធជាកូដ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ការណែនាំ

សន្លឹកសម្គាល់ទូលំទូលាយនេះផ្តល់យោងយ៉ាងរហ័សសម្រាប់ពាក្យបញ្ជា Azure Developer CLI ដែលប្រើប្រាស់ញឹកញាប់បំផុត ដាក់ចងក្រងតាមប្រភេទជាមួយឧទាហរណ៍ជាក់ស្តែង។ វាគ្មានភាពលំបាកសម្រាប់រកមើលយ៉ាងរហ័សនៅពេលអភិវឌ្ឍនា ការដោះស្រាយបញ្ហា និងប្រតិបត្តិការប្រចាំថ្ងៃជាមួយគម្រោង azd។

## គោលដៅការរៀន

ដោយប្រើសន្លឹកសម្គាល់នេះ អ្នកនឹង:
- មានចង្កោះបង្ហាញភ្លាមៗចំពោះពាក្យបញ្ជា Azure Developer CLI និងស៊ីនតាក់ស៊ី
- យល់ដឹងពីការរៀបចំពាក្យបញ្ជាតាមប្រភេទនិងករណីប្រើប្រាស់
- យោងឧទាហរណ៍ជាក់ស្តែងសម្រាប់ស្ថានការណ៏អភិវឌ្ឍន៍ និងការដាក់ពង្រីក
- ចូលដល់ពាក្យបញ្ជាសម្រាប់ដោះស្រាយបញ្ហាប្រសិនបើមាន
- រកមើលជម្រើសកំណត់តម្លៃ និងប្តូរដែលមានកម្រិតខ្ពស់យ៉ាងមានប្រសិទ្ធភាព
- ស្វែងរកពាក្យបញ្ជាកំណត់បរិស្ថាន និងចរន្តការងារជាច្រើនបរិស្ថាន

## លទ្ធផលនៃការរៀន

ដោយយោងសន្លឹកសម្គាល់នេះជាញឹកញាប់ អ្នកនឹងអាច:
- ប្រតិបត្តិពាក្យបញ្ជា azd ដោយទំនុកចិត្តដោយមិនចាំបាច់យោងឯកសារពេញលេញ
- ដោះស្រាយបញ្ហាជាញឹកញាប់បានរហ័សដោយប្រើពាក្យបញ្ជាវិភាគសមស្រប
- គ្រប់គ្រងបរិស្ថានច្រើន និងស្ថានការណ៍ដាក់ពង្រីកបានយ៉ាងមានប្រសិទ្ធភាព
- អនុវត្តមុខងារ azd ជម្រៅ និងជម្រើសកំណត់តម្លៃពេលត្រូវការ
- ដោះស្រាយបញ្ហាការ​ដាក់ពង្រីកដោយប្រើលំដាប់ពាក្យបញ្ជាផ្លូវការ
- សម្រួលកិច្ចការ តាមរយៈការប្រើប្រាស់កាត់បន្ថយ និងជម្រើស azd ដោយមានប្រសិទ្ធភាព

## ពាក្យបញ្ជាដើម្បីចាប់ផ្ដើម

### Authentication
```bash
# ចូលទៅកាន់ Azure តាមរយៈ AZD
azd auth login

# ចូលទៅកាន់ Azure CLI (AZD ប្រើវាខាងក្រោម)
az login

# ពិនិត្យគណនីបច្ចុប្បន្ន
az account show

# កំណត់ការជាវលំនាំដើម
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# ចាកចេញពី AZD
azd auth logout

# ចាកចេញពី Azure CLI
az logout
```

### Project Initialization
```bash
# រុករកគំរូដែលអាចប្រើបាន
azd template list

# ចាប់ផ្តើមពីគំរូ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ចាប់ផ្តើមនៅក្នុងថតបច្ចុប្បន្ន
azd init .

# ចាប់ផ្តើមដោយឈ្មោះផ្ទាល់ខ្លួន
azd init --template todo-nodejs-mongo my-awesome-app
```

## ពាក្យបញ្ជាផ្នែកស្នូល​សម្រាប់​ការ​ដាក់​បញ្ចូន

### Complete Deployment Workflow
```bash
# ដាក់ឲ្យដំណើរការ​ទាំងអស់ (ផ្គត់ផ្គង់ + ចេញផ្សាយ)
azd up

# ដាក់ឲ្យដំណើរការ​ដោយបិទសំណើបញ្ជាក់
azd up --confirm-with-no-prompt

# ដាក់ឲ្យដំណើរការ​ទៅ​បរិស្ថាន​ជាក់លាក់
azd up --environment production

# ដាក់ឲ្យដំណើរការ​ជាមួយ​ប៉ារ៉ាម៉ែត្រ​ផ្ទាល់ខ្លួន
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# ផ្តល់ធនធាន Azure
azd provision

# 🧪 មើលជាមុននូវការផ្លាស់ប្តូរហេដ្ឋារចនាសម្ព័ន្ធ
azd provision --preview
# បង្ហាញទិដ្ឋភាព 'dry-run' នៃធនធានដែលនឹងត្រូវបានបង្កើត/កែប្រែ/លុប
# ដូចជា 'terraform plan' ឬ 'bicep what-if' - អាចរត់បានដោយសុវត្ថិភាព, មិនមានការផ្លាស់ប្តូរត្រូវបានអនុវត្ត
```

### Application Only
```bash
# ដាក់ចេញកូដកម្មវិធី
azd deploy

# ដាក់ចេញសេវាកម្មជាក់លាក់
azd deploy --service web
azd deploy --service api

# ដាក់ចេញសេវាកម្មទាំងអស់
azd deploy --all
```

### Build and Package
```bash
# ស្តារ (ទាញយក) បណ្ណាល័យ និងឯកសារដែលកម្មវិធីអាស្រ័យលើ
azd restore

# ស្តារ សេវាកម្មជាក់លាក់
azd restore --service api

# បង្កើតផលិតផលដែលអាចដាក់ប្រើបាន ដោយមិនដាក់ប្រើ
azd package

# កសាងសេវាកម្មជាក់លាក់
azd package --service api
```

> **`azd restore`** ទាញយកការពឹងផ្អែករបស់កម្មវិធីរបស់អ្នក (npm, pip, NuGet, Maven, ល។)។ វារត់ដោយស្វ័យប្រវត្តិកាលពេល `azd package` និង `azd deploy` ដូច្នេះអ្នកធ្លាប់មិនចាំបាច់ហៅវាត្រង់ៗទេ — រត់វាដោយដៃដើម្បីទាញមុន (ឧ. ដើម្បីកម្តៅ cache CI ឬដើម្បីដំណើរការលើកក្រោយក្នុងលក្ខខណ្ឌអនឡាញលែងត្រូវបានភ្ជាប់)។

> **`azd package`** សង់ឯកសារដែលអាចដាក់ដំណើរការ (រូបភាព container ឬ zip) **ដោយមិន** បញ្ចេញវាទៅ Azure។ ប្រើវាដោយឡែកដើម្បីផ្ទៀងផ្ទាត់ការសាងសង់ថាអាចជោគជ័យ បានពិនិត្យលទ្ធផល ឬបង្កើតឯកសារដែលដំណើរការផ្សេងទៀតនឹងដាក់ឲ្យក្រោយ។ `azd deploy` បណ្តុំជាបណ្ដោះអាសន្នដូច្នេះអ្នកត្រូវការតែ `azd package` ពេលដែលអ្នកចង់បានឯកសារដោយមិនចាំបាច់ដាក់បញ្ចូន។

## 🌍 ការគ្រប់គ្រងបរិស្ថាន

### Environment Operations
```bash
# បញ្ជីបរិយាកាសទាំងអស់
azd env list

# បង្កើតបរិយាកាសថ្មី
azd env new development
azd env new staging --location westus2

# ជ្រើសបរិយាកាស
azd env select production

# បង្ហាញបរិយាកាសដែលអាចប្រើបាន
azd env list

# បន្ទាន់សម័យស្ថានភាពបរិយាកាស
azd env refresh
```

### Environment Variables
```bash
# កំណត់អថេរបរិស្ថាន
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# យកអថេរបរិស្ថាន
azd env get API_KEY

# បញ្ជីអថេរបរិស្ថានទាំងអស់
azd env get-values

# លុបអថេរបរិស្ថាន
azd env unset DEBUG
```

## ⚙️ ពាក្យបញ្ជាកំណត់តម្លៃ

### Global Configuration
```bash
# បញ្ជីការកំណត់ទាំងអស់
azd config show

# កំណត់លំនាំដើមសកល
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# លុបការកំណត់
azd config unset defaults.location

# កំណត់ឡើងវិញការកំណត់ទាំងអស់
azd config reset
```

### Project Configuration
```bash
# ផ្ទៀងផ្ទាត់ azure.yaml
azd config validate

# បង្ហាញព័ត៌មានគម្រោង
azd show

# ទទួលចំណុចចូលចេញនៃសេវា
azd show --output json
```

## 📊 ការត្រួតពិនិត្យ និងវិភាគ

### Monitoring Dashboard
```bash
# បើកផ្ទាំងតាមដាន (dashboard) នៅក្នុង Azure Portal
azd monitor

# បើកមេត្រិកផ្ទាល់ (live metrics) របស់ Application Insights
azd monitor --live

# បើកផ្ទាំងកំណត់ហេតុ (logs) នៃ Application Insights
azd monitor --logs

# បើកទិដ្ឋភាពទូទៅ (overview) នៃ Application Insights
azd monitor --overview
```

### Viewing Container Logs
```bash
# មើលកំណត់ហេតុតាមរយៈ Azure CLI (សម្រាប់ Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# តាមដានកំណត់ហេតុក្នុងពេលពិត
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# មើលកំណត់ហេតុពី Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# ចូលប្រើ Log Analytics តាមរយៈ Azure Portal
azd monitor --logs

# ស្វែងរកកំណត់ហេតុដោយប្រើ Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ពាក្យបញ្ជាថែទាំ

### Cleanup
```bash
# លុបធនធាន Azure ទាំងអស់
azd down

# បង្ខំលុបដោយគ្មានការបញ្ជាក់
azd down --force

# លុបចោលធនធានដែលបានលុបទន់
azd down --purge

# សម្អាតដោយពេញលេញ
azd down --force --purge
```

### Updates
```bash
# ពិនិត្យមើលការអាប់ដេត azd
azd version

# ទទួលបានកំណែបច្ចុប្បន្ន
azd version

# មើលការកំណត់បច្ចុប្បន្ន
azd config show
```

## 🔧 ពាក្យបញ្ជាខ្ពស់ជាង

### Pipeline and CI/CD
```bash
# កំណត់រចនាសម្ព័ន្ធ GitHub Actions
azd pipeline config

# កំណត់រចនាសម្ព័ន្ធ Azure DevOps
azd pipeline config --provider azdo

# បង្ហាញការកំណត់រចនាសម្ព័ន្ធ pipeline
azd pipeline show
```

### Infrastructure Management
```bash
# បង្កើតគំរូហេដ្ឋារចនាសម្ព័ន្ធ
azd infra generate

# 🧪 ការមើលមុន និងការធ្វើផែនការហេដ្ឋារចនាសម្ព័ន្ធ
azd provision --preview
# សម្រមោលការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធដោយមិនដាក់ចេញ
# វិភាគគំរូ Bicep/Terraform ហើយបង្ហាញ៖
# - ធនធានដែលនឹងត្រូវបន្ថែម (បៃតង +)
# - ធនធានដែលនឹងត្រូវកែប្រែ (លឿង ~)
# - ធនធានដែលនឹងត្រូវលុប (ក្រហម -)
# រត់ដោយសុវត្ថិភាព - មិនធ្វើការផ្លាស់ប្តូរណាមួយជាក់ស្តែងលើបរិយាកាស Azure

# បង្កើតរចនាសម្ព័ន្ធពី azure.yaml
azd infra synth
```

### Project Information
```bash
# បង្ហាញស្ថានភាពគម្រោង និងចំណុចបញ្ចប់
azd show

# បង្ហាញព័ត៌មានលម្អិតនៃគម្រោងជា JSON
azd show --output json

# ទាញយកចំណុចបញ្ចប់សេវា
azd show --output json | jq '.services'
```

## 🤖 ពាក្យបញ្ជា AI និងផ្នែកបន្ថែម

### AZD Extensions
```bash
# បញ្ជីផ្នែកបន្ថែមដែលមានទាំងអស់ (រួមទាំង AI)
azd extension list

# តំឡើងផ្នែកបន្ថែមភ្នាក់ងារ Foundry
azd extension install azure.ai.agents

# តំឡើងផ្នែកបន្ថែមសមត្ថភាពភ្នាក់ងារ (សាកល្បង)
azd extension install azure.ai.skills

# តំឡើងផ្នែកបន្ថែមការតភ្ជាប់ Foundry (សាកល្បង)
azd extension install azure.ai.connections

# តំឡើងផ្នែកបន្ថែមសម្រាប់ការតម្រូវលំអិត
azd extension install azure.ai.finetune

# តំឡើងផ្នែកបន្ថែមម៉ូឌែលផ្ទាល់ខ្លួន
azd extension install azure.ai.models

# ធ្វើឲ្យទាន់សម័យផ្នែកបន្ថែមដែលបានតំឡើងទាំងអស់
azd extension upgrade --all
```

### AI Agent Commands
```bash
# ចាប់ផ្ដើមគម្រោងភ្នាក់ងារពីឯកសារ manifest
azd ai agent init -m <manifest-path-or-uri>

# គោលដៅទៅកាន់គម្រោង Foundry ជាក់លាក់
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# បញ្ជាក់ថតប្រភពរបស់ភ្នាក់ងារ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ជ្រើសគោលដៅសម្រាប់បង្ហោះ
azd ai agent init -m agent-manifest.yaml --host containerapp

# សាកល្បងភ្នាក់ងារដែលបានបង្ហោះ (បង្ហាញពេលយឺត និងពេលដល់បៃដំបូង)
azd ai agent invoke

# បង្ហាញការកំណត់ចំណុចបញ្ចប់ផ្សាយផ្ទាល់
azd ai agent endpoint show

# បង្កើតសំណុំទិន្នន័យសម្រាប់វាយតម្លៃ ហើយបន្ទាប់មកបង្កើនប្រសិទ្ធភាពភ្នាក់ងារ
azd ai agent eval generate
azd ai agent optimize

# ទាញយកប្រភពដែលបានបង្ហោះ​របស់ភ្នាក់ងារផ្ទុកដែលផ្អែកលើកូដ
azd ai agent code download

# លុបភ្នាក់ងារផ្ទុក និងកំណែទាំងអស់របស់វា (--force បញ្ចប់សម័យសកម្ម)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# ចាប់ផ្តើមម៉ាស៊ីនមេ MCP សម្រាប់គម្រោងរបស់អ្នក
azd mcp start

# គ្រប់គ្រងការយល់ព្រមនៃឧបករណ៍សម្រាប់ប្រតិបត្តិការរបស់ MCP
azd copilot consent list
```

### Infrastructure Generation
```bash
# បង្កើតឯកសារ IaC ពីការបញ្ជាក់នៃគម្រោងរបស់អ្នក
azd infra generate

# បង្កើតហេដ្ឋារចនាសម្ព័ន្ធពី azure.yaml
azd infra synth
```

---

## 🎯 ជំនុំការងារយ៉ាងរហ័ស

### Development Workflow
```bash
# ចាប់ផ្តើមគម្រោងថ្មី
azd init --template todo-nodejs-mongo
cd my-project

# ដាក់ចេញទៅបរិយាកាសអភិវឌ្ឍន៍
azd env new dev
azd up

# ធ្វើការផ្លាស់ប្តូរ និងដាក់ចេញឡើងវិញ
azd deploy

# បើកផ្ទាំងតាមដាន
azd monitor --live
```

### Multi-Environment Workflow
```bash
# រៀបចំបរិស្ថាន
azd env new dev
azd env new staging  
azd env new production

# ដាក់ប្រតិបត្តិទៅបរិស្ថានអភិវឌ្ឍន៍
azd env select dev
azd up

# សាកល្បង និងលើកទៅបរិស្ថានស្តេជីង
azd env select staging
azd up

# ដាក់ប្រតិបត្តិទៅបរិស្ថានផលិតកម្ម
azd env select production
azd up
```

### Troubleshooting Workflow
```bash
# បើកម៉ូដឌីប៊ក់
export AZD_DEBUG=true

# ពិនិត្យស្ថានភាពការដាក់ឲ្យដំណើការ
azd show

# ផ្ទៀងផ្ទាត់ការកំណត់
azd config show

# បើកផ្ទាំងតាមដានសម្រាប់កំណត់ហេតុ
azd monitor --logs

# ពិនិត្យស្ថានភាពធនធាន
azd show --output json
```

## 🔍 ពាក្យបញ្ជាធ្វើដើម្បីធ្វើដំណើរការវាយតម្លៃ

### Debug Information
```bash
# បើកការបញ្ចេញព័ត៌មានដើម្បីរកកំហុស
export AZD_DEBUG=true
azd <command> --debug

# បិទទេលេមែត្រីសម្រាប់លទ្ធផលដែលស្អាត
export AZD_DISABLE_TELEMETRY=true

# ពិនិត្យការកំណត់បច្ចុប្បន្ន
azd config show

# ពិនិត្យស្ថានភាពការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
az account show
```

### Template Debugging
```bash
# បញ្ជីគម្របដែលមានជាមួយព័ត៌មានលម្អិត
azd template list --output json

# បង្ហាញព័ត៌មានពីគំរូ
azd template show <template-name>

# ផ្ទៀងផ្ទាត់គំរូមុនពេលចាប់ផ្តើម
azd template validate <template-name>
```

## 📁 ពាក្យបញ្ជាឯកសារ និងថត

### Project Structure
```bash
# បង្ហាញរចនាសម្ព័ន្ធថតបច្ចុប្បន្ន
tree /f  # វីនដូស
find . -type f  # លីនុច/ម៉ាក់អូអេស

# ទៅកាន់ឫសគម្រោង azd
cd $(azd root)

# បង្ហាញថតកំណត់របស់ azd
echo $AZD_CONFIG_DIR  # ជាទូទៅ ~/.azd
```

## 🎨 ការបង្ហាញលទ្ធផល

### JSON Output
```bash
# ទទួលលទ្ធផល JSON សម្រាប់ការស្គ្រីប
azd show --output json
azd env list --output json
azd config show --output json

# វិភាគដោយ jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# រៀបចំជាតារាង
azd env list --output table

# មើលសេវាកម្មដែលបានដាក់ចេញ
azd show --output json | jq '.services | keys'
```

## 🔧 ការចម្រុះពាក្យបញ្ជាដែលប្រើញឹកញាប់

### Health Check Script
```bash
#!/bin/bash
# ការត្រួតពិនិត្យសុខភាពយ៉ាងរហ័ស
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# ការផ្ទៀងផ្ទាត់មុនការដាក់ចេញ
azd show
azd provision --preview  # មើលជាមុននូវការផ្លាស់ប្តូរមុនពេលដាក់ចេញ
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# ប្រៀបធៀបបរិយាកាស
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# សម្អាតបរិយាកាសចាស់ៗ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 តម្លៃបរិស្ថាន

### Common Environment Variables
```bash
# ការកំណត់រចនាសម្ព័ន្ធ Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# ការកំណត់រចនាសម្ព័ន្ធ AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ការកំណត់រចនាសម្ព័ន្ធកម្មវិធី
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ពាក្យបញ្ជាបន្ទាន់

### Quick Fixes
```bash
# កំណត់ការផ្ទៀងផ្ទាត់ឡើងវិញ
az account clear
az login

# បង្ខំផ្ទុកបរិស្ថានម្តងទៀត
azd env refresh

# ដាក់ប្រើឡើងវិញសេវាកម្មទាំងអស់
azd deploy

# ពិនិត្យស្ថានភាពនៃការដាក់ប្រើ
azd show --output json
```

### Recovery Commands
```bash
# ស្ដារឡើងវិញពីការដាក់ចេញដែលបរាជ័យ - សម្អាត ហើយដាក់ចេញឡើងវិញ
azd down --force --purge
azd up

# ផ្គត់ផ្គង់រចនាសម្ព័ន្ធឡើងវិញតែប៉ុណ្ណោះ
azd provision

# ដាក់ចេញកម្មវិធីឡើងវិញតែប៉ុណ្ណោះ
azd deploy
```

## 💡 ក្បួនជំនាញ

### Aliases for Faster Workflow
```bash
# បន្ថែមទៅក្នុង .bashrc ឬ .zshrc របស់អ្នក
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# ប្ដូរបរិយាកាសយ៉ាងលឿន
azd-env() {
    azd env select $1 && azd show
}

# ការដាក់ចេញឆាប់រហ័សជាមួយការត្រួតពិនិត្យ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ស្ថានភាពបរិយាកាស
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ជំនួយ និងឯកសារ

### Getting Help
```bash
# ជំនួយទូទៅ
azd --help
azd help

# ជំនួយសម្រាប់ពាក្យបញ្ជាជាក់លាក់
azd up --help
azd env --help
azd config --help

# បង្ហាញកំណែ និងព័ត៌មានការបង្កើត
azd version
azd version --output json
```

### Documentation Links
```bash
# បើកឯកសារណែនាំក្នុងកម្មវិធីរុករក
azd docs

# បង្ហាញឯកសារណែនាំសម្រាប់គំរូ
azd template show <template-name> --docs
```

---

**យោបល់**: ចំណាំទំព័រនេះនៅក្នុងប៊ុកម៉ាករបស់អ្នក ហើយប្រើ `Ctrl+F` ដើម្បីស្វែងរកពាក្យបញ្ជាដែលអ្នកត្រូវការ​យ៉ាងរហ័ស!

---

**ការរុករក**
- **មេរៀនមុន**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **មេរៀនបន្ទាប់**: [Glossary](glossary.md)

---

> **💡 ចង់បានជំនួយពាក្យបញ្ជា Azure ក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកទេ?** ដំឡើង [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ជាមួយ `npx skills add microsoft/github-copilot-for-azure` — 37 skills សម្រាប់ AI, Foundry, ការដាក់ចេញ, វិភាគកំហុស, និងផ្សេងៗទៀត។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
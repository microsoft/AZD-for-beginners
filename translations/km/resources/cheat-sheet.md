# ផ្ទាំងសង្ខេប​ពាក្យបញ្ជា - ពាក្យបញ្ជា AZD សំខាន់

**ឯកសារយោងរហ័សសម្រាប់រាល់ជំពូក**
- **📚 ផ្ទះដើមវគ្គរៀន**: [AZD For Beginners](../README.md)
- **📖 ចាប់ផ្តើមរហ័ស**: [ជំពូក 1: មូលដ្ឋាន និង ចាប់ផ្តើមរហ័ស](../README.md#-chapter-1-foundation--quick-start)
- **🤖 ពាក្យបញ្ជា AI**: [ជំពូក 2: ការអភិវឌ្ឍន៍ផ្តើមដោយ AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 លំដាប់ខ្ពស់**: [ជំពូក 4: រចនាសម្ព័ន្ធជា​កូដ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ការណែនាំ

សន្លឹកជំនួយនេះផ្តល់ឯកសារយោងរហ័សសម្រាប់ពាក្យបញ្ជា Azure Developer CLI ដែលប្រើប្រាស់ញឹកញាប់បំផុត ចម្រៀងតាមប្រភេទជាមួយឧទាហរណ៍ដែលអាចអនុវត្តបាន។ ទន់សម្រាប់ស្វែងរកលឿនក្នុងពេលអភិវឌ្ឍ ការរកកំហុស និងប្រតិបត្តិការប្រចាំថ្ងៃជាមួយគម្រោង azd។

## គោលដៅការសិក្សា

ដោយប្រើសន្លឹកជំនួយនេះ អ្នកនឹង៖
- មានចូលប្រើភ្លាមភ្លៅដល់ពាក្យបញ្ជា និងវាគមន៍ Azure Developer CLI ដែលចាំបាច់
- យល់ពីការរៀបចំពាក្យបញ្ជាតាមប្រភេទមុខងារ និងករណីប្រើប្រាស់
- យោងឧទាហរណ៍អនុវត្តបានសម្រាប់ស្ថានភាពអភិវឌ្ឍន៍ និងការចែកចាយទូទៅ
- ចូលប្រើពាក្យបញ្ជាសម្រាប់ដោះស្រាយបញ្ហារ និងដោះសោបញ្ហារហ័ស
- ស្វែងរកជម្រើសកំណត់កំរិតខ្ពស់ និងការប្ដូរតាមតម្រូវការយ៉ាងមានប្រសិទ្ធភាព
- ស្វែងរកពាក្យបញ្ជាសម្រាប់គ្រប់គ្រងបរិយាកាស និងលំហូរប្រតិបត្តិការច្រើនបរិយាកាស

## លទ្ធផលការសិក្សា

ដោយយោងសន្លឹកជំនួយនេះជាប្រចាំ អ្នកនឹងអាច៖
- អនុវត្តពាក្យបញ្ជា azd ដោយទំនុកចិត្តដោយមិនចាំបាច់យោងឯកសារពេញលេញ
- ដោះស្រាយបញ្ហាទូទៅឲ្យរហ័សដោយប្រើពាក្យបញ្ជាវិភាគដែលសមស្រប
- គ្រប់គ្រងបរិយាកាស និងសេណារីយោចែកចាយច្រើនបានយ៉ាងមានប្រសិទ្ធភាព
- អនុវត្តលក្ខណៈពិសេសកម្រិតខ្ពស់ និងជម្រើសកំណត់រចនាដែលត្រូវការ
- ដោះស្រាយបញ្ហាក្នុងការចែកចាយដោយប្រើលំដាប់ពាក្យបញ្ជាដោយប្រព័ន្ធ
- បង្កើនប្រសិទ្ធភាពសន្ទស្សន៍ការងារដោយប្រើផ្លូវកាត់ និងជម្រើសរបស់ azd ដោយមានប្រសិទ្ធភាព

## ពាក្យបញ្ជាសម្រាប់ការចាប់ផ្ដើម

### ការផ្ទៀងផ្ទាត់ខ្លួន
```bash
# ចូលទៅកាន់ Azure តាមរយៈ AZD
azd auth login

# ចូលទៅកាន់ Azure CLI (AZD ប្រើវា​នៅខាងក្រោយ)
az login

# ពិនិត្យ​គណនី​បច្ចុប្បន្ន
az account show

# កំណត់ការជាវលំនាំដើម
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# ចុះចេញពី AZD
azd auth logout

# ចុះចេញពី Azure CLI
az logout
```

### ការចាប់ផ្ដើមគម្រោង
```bash
# រុករកពុម្ពដែលមានស្រាប់
azd template list

# ចាប់ផ្តើមពីពុម្ពស្រាប់
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ចាប់ផ្តើមក្នុងថតបច្ចុប្បន្ន
azd init .

# ចាប់ផ្តើមដោយឈ្មោះផ្ទាល់ខ្លួន
azd init --template todo-nodejs-mongo my-awesome-app
```

## ពាក្យបញ្ជាចម្បងសម្រាប់ការចែកចាយ

### លំហូរប្រតិបត្តិការចែកចាយពេញលេញ
```bash
# ដាក់ឲ្យដំណើរការទាំងអស់ (ផ្ដល់ធនធាន + ដាក់ប្រើ)
azd up

# ដាក់ប្រើដោយបិទការស្នើសុំបញ្ជាក់
azd up --confirm-with-no-prompt

# ដាក់ប្រើទៅបរិយាកាសជាក់លាក់
azd up --environment production

# ដាក់ប្រើដោយប៉ារ៉ាមែត្រផ្ទាល់ខ្លួន
azd up --parameter location=westus2
```

### សម្រាប់រចនាសម្ព័ន្ធតែប៉ុណ្ណោះ
```bash
# ផ្គត់ផ្គង់ធនធាន Azure
azd provision

# 🧪 ពិនិត្យមើលការផ្លាស់ប្តូររចនាសម្ព័ន្ធ
azd provision --preview
# បង្ហាញទិដ្ឋភាពមើលមុន (dry-run) នូវធនធានដែលនឹងត្រូវបានបង្កើត/កែប្រែ/លុប
# ស្រដៀងនឹង 'terraform plan' ឬ 'bicep what-if' - អាចរត់បានយ៉ាងសុវត្ថិភាព ហើយមិនមានការផ្លាស់ប្តូរណាដែលត្រូវបានអនុវត្ត
```

### សម្រាប់កម្មវិធីតែប៉ុណ្ណោះ
```bash
# ដាក់ចេញកូដកម្មវិធី
azd deploy

# ដាក់ចេញសេវាកម្មជាក់លាក់
azd deploy --service web
azd deploy --service api

# ដាក់ចេញសេវាកម្មទាំងអស់
azd deploy --all
```

### កសាង និងដាក់កញ្ចប់
```bash
# បង្កើតកម្មវិធី
azd package

# បង្កើតសេវាកម្មជាក់លាក់
azd package --service api
```

## 🌍 ការគ្រប់គ្រងបរិយាកាស

### ប្រតិបត្ដិការបរិយាកាស
```bash
# បញ្ជីបរិយាកាសទាំងអស់
azd env list

# បង្កើតបរិយាកាសថ្មី
azd env new development
azd env new staging --location westus2

# ជ្រើសរើសបរិយាកាស
azd env select production

# បង្ហាញបរិយាកាសដែលមាន
azd env list

# ធ្វើបច្ចុប្បន្នភាពស្ថានភាពបរិយាកាស
azd env refresh
```

### អថេរបរិយាកាស
```bash
# កំណត់អថេរបរិយាកាស
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ទាញយកអថេរបរិយាកាស
azd env get API_KEY

# បញ្ជីអថេរបរិយាកាសទាំងអស់
azd env get-values

# លុបអថេរបរិយាកាស
azd env unset DEBUG
```

## ⚙️ ពាក្យបញ្ជាកំណត់

### ការកំណត់សកល
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

### ការកំណត់គម្រោង
```bash
# ផ្ទៀងផ្ទាត់ azure.yaml
azd config validate

# បង្ហាញព័ត៌មានគម្រោង
azd show

# ទាញយកចំណុចបញ្ចប់សេវា
azd show --output json
```

## 📊 ការត្រួតពិនិត្យ និងវិភាគ

### ផ្ទាំងត្រួតពិនិត្យ
```bash
# បើកផ្ទាំងគ្រប់គ្រងការតាមដានរបស់ Azure portal
azd monitor

# បើកស្ថិតិផ្ទាល់ (Live Metrics) របស់ Application Insights
azd monitor --live

# បើកផ្ទាំងកំណត់ហេតុ (Logs) របស់ Application Insights
azd monitor --logs

# បើកទិដ្ឋភាពទូទៅ (Overview) របស់ Application Insights
azd monitor --overview
```

### មើលកំណត់ហេតុកុងតឺន័រ
```bash
# មើលកំណត់ហេតុតាម Azure CLI (សម្រាប់ Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# តាមដានកំណត់ហេតុក្នុងពេលពិត
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# មើលកំណត់ហេតុពី Azure Portal
azd monitor --logs
```

### សំណួរ Log Analytics
```bash
# ចូលប្រើវិភាគកំណត់ហេតុតាមរយៈផ្ទាំងគ្រប់គ្រង Azure
azd monitor --logs

# ស្វែងរកកំណត់ហេតុដោយប្រើ Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ពាក្យបញ្ជាសម្រាប់ថែទាំ

### សម្អាត
```bash
# លុបធនធាន Azure ទាំងអស់
azd down

# បង្ខំលុបដោយគ្មានការបញ្ជាក់
azd down --force

# លុបចោលធនធានដែលបានលុបបែបទន់
azd down --purge

# សម្អាតទាំងស្រុង
azd down --force --purge
```

### ការអាប់ដេត
```bash
# ពិនិត្យមើលការអាប់ដេតសម្រាប់ azd
azd version

# ទទួលបានកំណែបច្ចុប្បន្ន
azd version

# មើលការកំណត់បច្ចុប្បន្ន
azd config show
```

## 🔧 ពាក្យបញ្ជា​កម្រិតខ្ពស់

### បំពង់ និង CI/CD
```bash
# កំណត់រចនាសម្ព័ន្ធ GitHub Actions
azd pipeline config

# កំណត់រចនាសម្ព័ន្ធ Azure DevOps
azd pipeline config --provider azdo

# បង្ហាញការកំណត់រចនាសម្ព័ន្ធ pipeline
azd pipeline show
```

### ការគ្រប់គ្រងរចនាសម្ព័ន្ធ
```bash
# បង្កើតគំរូរចនាសម្ព័ន្ធ
azd infra generate

# 🧪 មើលមុន និងផែនការ រចនាសម្ព័ន្ធ
azd provision --preview
# សាកល្បងការផ្គត់ផ្គង់រចនាសម្ព័ន្ធដោយមិនដាក់អនុវត្ត
# វិភាគគំរូ Bicep/Terraform ហើយបង្ហាញ:
# - ធនធានដែលនឹងត្រូវបន្ថែម (បៃតង +)
# - ធនធានដែលនឹងត្រូវកែប្រែ (លឿង ~)
# - ធនធានដែលនឹងត្រូវលុប (ក្រហម -)
# រត់បានដោយសុវត្ថិភាព - មិនមានការផ្លាស់ប្តូរពិតណាមួយទៅលើបរិយាកាស Azure

# បង្កើតរចនាសម្ព័ន្ធពី azure.yaml
azd infra synth
```

### ព័ត៌មានគម្រោង
```bash
# បង្ហាញស្ថានភាពគម្រោង និងចំណុចបញ្ចប់
azd show

# បង្ហាញព័ត៌មានលម្អិតអំពីគម្រោងជា JSON
azd show --output json

# ទទួលបានចំណុចបញ្ចប់របស់សេវា
azd show --output json | jq '.services'
```

## 🤖 ពាក្យបញ្ជា AI និងផ្នែកបន្ថែម

### ផ្នែកបន្ថែម AZD
```bash
# បញ្ជីផ្នែកបន្ថែមទាំងអស់ដែលមាន (រួមទាំង AI)
azd extension list

# ដំឡើងផ្នែកបន្ថែម Foundry agents
azd extension install azure.ai.agents

# ដំឡើងផ្នែកបន្ថែមសម្រាប់ fine-tuning
azd extension install azure.ai.finetune

# ដំឡើងផ្នែកបន្ថែមម៉ូឌែលផ្ទាល់ខ្លួន
azd extension install azure.ai.models

# ធ្វើឱ្យទាន់សម័យផ្នែកបន្ថែមទាំងអស់ដែលបានដំឡើង
azd extension upgrade --all
```

### ពាក្យបញ្ជាភ្នាក់ងារ AI
```bash
# ចាប់ផ្តើមគម្រោងភ្នាក់ងារពីឯកសារ manifest
azd ai agent init -m <manifest-path-or-uri>

# ផ្ដោតទៅលើគម្រោង Foundry ជាក់លាក់
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# បញ្ជាក់ថតប្រភពនៃភ្នាក់ងារ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ជ្រើសគោលដៅសម្រាប់ម៉ាស៊ីនបម្រើ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### ម៉ាស៊ីនមេ MCP (Alpha)
```bash
# ចាប់ផ្តើមម៉ាស៊ីនមេ MCP សម្រាប់គម្រោងរបស់អ្នក
azd mcp start

# គ្រប់គ្រងការយល់ព្រមនៃឧបករណ៍សម្រាប់ប្រតិបត្តិការរបស់ MCP
azd copilot consent list
```

### ការបង្កើតរចនាសម្ព័ន្ធ
```bash
# បង្កើតឯកសារ IaC ពីការកំណត់គម្រោងរបស់អ្នក
azd infra generate

# បង្កើតហេដ្ឋារចនាសម្ព័ន្ធពី azure.yaml
azd infra synth
```

---

## 🎯 សន្ទស្សន៍ប្រតិបត្តិការយ៉ាងរហ័ស

### សន្ទស្សន៍អភិវឌ្ឍន៍
```bash
# ចាប់ផ្ដើមគម្រោងថ្មី
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

### សន្ទស្សន៍ប្រតិបត្តិការ​ច្រើនបរិយាកាស
```bash
# រៀបចំបរិយាកាស
azd env new dev
azd env new staging  
azd env new production

# ដាក់ចេញ ទៅ បរិយាកាស​អភិវឌ្ឍន៍
azd env select dev
azd up

# ធ្វើតេស្ត និង ផ្ទេរទៅ បរិយាកាស​សាកល្បង
azd env select staging
azd up

# ដាក់ចេញ ទៅ បរិយាកាសផលិត
azd env select production
azd up
```

### សន្ទស្សន៍ដោះស្រាយបញ្ហារ
```bash
# បើកម៉ូដពិនិត្យកំហុស
export AZD_DEBUG=true

# ពិនិត្យស្ថានភាពការដាក់ចេញ
azd show

# ផ្ទៀងផ្ទាត់ការកំណត់
azd config show

# បើកផ្ទាំងតាមដានសម្រាប់កំណត់ហេតុ
azd monitor --logs

# ពិនិត្យស្ថានភាពធនធាន
azd show --output json
```

## 🔍 ពាក្យបញ្ជាដាក់ពិនិត្យកំហុស

### ព័ត៌មានដាក់ពិនិត្យកំហុស
```bash
# បើកការបង្ហាញព័ត៌មាន debug
export AZD_DEBUG=true
azd <command> --debug

# បិទ telemetry សម្រាប់លទ្ធផលដែលស្អាត
export AZD_DISABLE_TELEMETRY=true

# ពិនិត្យការកំណត់បច្ចុប្បន្ន
azd config show

# ពិនិត្យស្ថានភាពការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
az account show
```

### ដាក់ពិនិត្យកំហុសទំព័រគំរូ
```bash
# បញ្ជីគំរូដែលមានជាមួយព័ត៌មានលម្អិត
azd template list --output json

# បង្ហាញព័ត៌មានរបស់គំរូ
azd template show <template-name>

# ផ្ទៀងផ្ទាត់គំរូមុននឹងចាប់ផ្តើម
azd template validate <template-name>
```

## 📁 ពាក្យបញ្ជាឯកសារ និងថតឯកសារ

### រចនាសម្ព័ន្ធគម្រោង
```bash
# បង្ហាញរចនាសម្ព័ន្ធថតបច្ចុប្បន្ន
tree /f  # វីនដូ
find . -type f  # លីនុច/ម៉ាកអូអេស

# ចូលទៅកាន់ថតដើមនៃគម្រោង azd
cd $(azd root)

# បង្ហាញថតកំណត់រចនាសម្ព័ន្ធរបស់ azd
echo $AZD_CONFIG_DIR  # ធម្មតា ~/.azd
```

## 🎨 ការរៀបចំលទ្ធផល

### លទ្ធផល JSON
```bash
# ទទួលលទ្ធផលជា JSON សម្រាប់ស្គ្រីប
azd show --output json
azd env list --output json
azd config show --output json

# វិភាគដោយ jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### លទ្ធផលតារាង
```bash
# ទ្រង់ទ្រាយជា​តារាង
azd env list --output table

# មើលសេវាកម្មដែលបានដាក់ប្រើ
azd show --output json | jq '.services | keys'
```

## 🔧 ការរួមបញ្ចូលពាក្យបញ្ជាទូទៅ

### ស្គ្រីបពិនិត្យសុខភាព
```bash
#!/bin/bash
# ពិនិត្យសុខភាពយ៉ាងរហ័ស
azd show
azd env get-values
azd monitor --logs
```

### ការផ្ទៀងផ្ទាត់ការចែកចាយ
```bash
#!/bin/bash
# ការផ្ទៀងផ្ទាត់មុនការដាក់ប្រើ
azd show
azd provision --preview  # ពិនិត្យមើលការផ្លាស់ប្តូរមុនពេលដាក់ប្រើ
az account show
```

### ការប្រៀបធៀបបរិយាកាស
```bash
#!/bin/bash
# ប្រៀបធៀបបរិយាកាស
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ស្គ្រីបសម្អាតធនធាន
```bash
#!/bin/bash
# សម្អាតបរិយាកាសចាស់ៗ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 អថេរបរិយាកាស

### អថេរបរិយាកាសទូទៅ
```bash
# ការកំណត់ Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# ការកំណត់ AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ការកំណត់កម្មវិធី
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ពាក្យបញ្ជាករណីបន្ទាន់

### ដំណោះស្រាយរហ័ស
```bash
# កំណត់ឡើងវិញការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
az account clear
az login

# បង្ខំបច្ចុប្បន្នភាពបរិស្ថាន
azd env refresh

# ដាក់ឲ្យដំណើរការឡើងវិញសេវាកម្មទាំងអស់
azd deploy

# ពិនិត្យស្ថានភាពការដាក់ចេញ
azd show --output json
```

### ពាក្យបញ្ជាសម្រាប់ស្ដារឡើងវិញ
```bash
# ស្ដារឡើងវិញពីការដាក់ឱ្យដំណើរការដែលបរាជ័យ - សម្អាត និងដាក់ឡើងវិញ
azd down --force --purge
azd up

# ផ្តល់ហេដ្ឋារចនាសម្ព័ន្ធឡើងវិញតែប៉ុណ្ណោះ
azd provision

# ដាក់កម្មវិធីឡើងវិញតែប៉ុណ្ណោះ
azd deploy
```

## 💡 គន្លឹះជំនាញ

### ឈ្មោះជំនួសសម្រាប់សកម្មភាពរហ័ស
```bash
# បន្ថែមទៅក្នុង .bashrc ឬ .zshrc របស់អ្នក
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ផ្លូវកាត់មុខងារ
```bash
# ការប្តូរបរិយាកាសយ៉ាងរហ័ស
azd-env() {
    azd env select $1 && azd show
}

# ការចេញផ្សាយយ៉ាងរហ័សជាមួយការតាមដាន
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

### របៀបទទួលជំនួយ
```bash
# ជំនួយទូទៅ
azd --help
azd help

# ជំនួយជាក់លាក់សម្រាប់ពាក្យបញ្ជា
azd up --help
azd env --help
azd config --help

# បង្ហាញព័ត៌មានកំណែ និងព័ត៌មានសាងសង់
azd version
azd version --output json
```

### តំណភ្ជាប់ឯកសារ
```bash
# បើកឯកសារណែនាំនៅក្នុងកម្មវិធីរុករក
azd docs

# បង្ហាញឯកសារណែនាំទម្រង់
azd template show <template-name> --docs
```

---

**គន្លឹះ**: ទុកសម្គាល់ទំព័រនេះ ហើយប្រើ `Ctrl+F` ដើម្បីស្វែងរកពាក្យបញ្ជាដែលអ្នកត្រូវការ​ដោយរហ័ស!

---

**Navigation**
- **មេរៀនមុន**: [ការពិនិត្យមុនការចេញផ្សាយ](../docs/pre-deployment/preflight-checks.md)
- **មេរៀនបន្ទាប់**: [ពាក្យពន្យល់](glossary.md)

---

> **💡 ចង់មានជំនួយពាក្យបញ្ជា Azure នៅក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកទេ?** ដំឡើង [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ជាមួយ `npx skills add microsoft/github-copilot-for-azure` — មានជំនាញ 37 សម្រាប់ AI, Foundry, ការចែកចាយ, វិភាគកំហុស, និងផ្សេងៗ។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការមិនទទួលខុសត្រូវ**:
ឯកសារនេះបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator). ខណៈពេលយើងព្យាយាមឱ្យបានត្រឹមត្រូវ សូមយកចិត្តទុកដាក់ថាការបកប្រែដោយស្វ័យប្រវត្តិក៏អាចមានកំហុស ឬមិនពិតប្រាកដ។ ឯកសារដើមនៅក្នុងភាសាដើមគួរត្រូវបានចាត់ទុកជាប្រភពផ្លូវការ។ សម្រាប់ព័ត៌មានដែលមានសារៈសំខាន់ អាចនឹងត្រូវការបកប្រែដោយអ្នកជំនាញមនុស្សវិជ្ជាជីវៈ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសណាមួយដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
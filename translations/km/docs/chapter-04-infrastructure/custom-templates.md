# ការបង្កើតគំរូ azd របស់អ្នកផ្ទាល់

**ការរុករកជំពូក៖**
- **📚 ផេកមេរៀន**៖ [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក ៤ - ស្ថាបត្យកម្មជា code និងការបញ្ចូល
- **⬅️ មុននេះ**៖ [មគ្គុទេសក៍ចែកចាយ](deployment-guide.md)
- **🚀 ជំពូកបន្ទាប់**៖ [ជំពូក ៥៖ ដំណោះស្រាយច្រើនភ្នាក់ងារ](../chapter-05-multi-agent/README.md)

> បានផ្ទៀងផ្ទាត់ជាមួយ `azd 1.27.1` នៅខែកក្កដា ឆ្នាំ ២០២៦។

## ការណែនាំ

រហូតមកដល់ពេលនេះ អ្នកបាន *ប្រើ* គំរូជាមួយ `azd init --template <name>` រួចហើយ។ ប៉ុន្តែពេលដែលអ្នកមានរចនាសម្ព័ន្ធគម្រោងដែលក្រុមរបស់អ្នកចូលចិត្ត — ឧ. Container App ជាមួយ Cosmos DB និងការបញ្ចេញតាមតម្រូវ — អ្នកនឹងចង់បំលែងវាទៅជាគំរូដែលអាចប្រើម្ដងទៀតរបស់អ្នកเอง។ គំរូគឺគ្រាន់តែជាកំណត់ហេតុ Git ដែលមានរចនាសម្ព័ន្ធដែល azd អាចអានបាន។ មេរៀននេះបង្ហាញអ្នកពីរបៀបបង្កើតវាពីដើម，សាកល្បងវា， ហើយ (ជាការជ្រើសរើស) បោះពុម្ភផ្សាយវាទៅកាន់វិចិត្រសាលសហគមន៍។

## គោលបំណងការសិក្សា

នៅចុងបញ្ចប់មេរៀននេះ អ្នកនឹងអាច៖
- យល់ដឹងអំពីអ្វីដែលធ្វើឲ្យថតមួយគឺជា "គំរូ azd"
- ស្គាល់ឯកសារ និងរចនាសម្ព័ន្ធថតដែលត្រូវការ
- បន្ថែម `azure.yaml` និង `infra/` ដែលមនុស្សផ្សេងអាចប្រើឡើងវិញ
- សាកល្បងគំរូរបស់អ្នកនៅក្នុងកន្លែងមូលដ្ឋានមុនចែករំលែក
- បោះពុម្ភវានិង (ជាជម្រើស) ដាក់ស្នើវាទៅ Awesome AZD

## លទ្ធផលការសិក្សា

បន្ទាប់ពីបញ្ចប់មេរៀននេះ អ្នកនឹងអាច៖
- បង្កើតឃ្លាំងគំរូថ្មីមួយ
- ប្លង់ប្រាក់ឧបករណ៍ដោយប្រើប៉ារ៉ាម៉ែត្រដើម្បីអោយវាដំណើរការនៅក្នុងការជាវណាមួយ
- ផ្ទៀងផ្ទាត់គំរូជាមួយ `azd init` និង `azd up`
- បន្ថែមទិន្នន័យ metadata ដែលវិចិត្រសាលសហគមន៍ត្រូវការ

---

## តើគំរូគឺជាអ្វី ពិតប្រាកដ?

គំរូ azd គឺ **ឃ្លាំង Git មួយ** ដែលមានយ៉ាងតិច៖

| ឯកសារ / ថត | គោលបំណង | ត្រូវការឬទេ? |
|---------------|---------|-----------|
| `azure.yaml` | ពណ៌នាអំពីសេវាកម្ម，ម៉ាស៊ីនផ្ទុក， និងអ្នកផ្គត់ផ្គង់ស្ថាបត្យកម្ម | ✅ ចាំបាច់ |
| `infra/` | Bicep，Terraform，ឬ Pulumi ដែលរៀបចំធនធាន | ✅ ចាំបាច់ |
| `src/` (ឬកូដរបស់អ្នក) | កូដកម្មវិធីដែល azd ផ្ទុក | ✅ ចាំបាច់ |
| `README.md` | របៀបប្រើគំរូ | ✅ បានណែនាំយ៉ាងខ្លាំង |
| `.azdo/` ឬ `.github/` | ការកំណត់បណ្ដាញ CI/CD | ជាជម្រើស |
| `.devcontainer/` | បរិយាកាសអភិវឌ្ឍដែលអាចធ្វើស្រេច | ជាជម្រើស |
| `azure.yaml` `metadata` | ព័ត៌មានវិចិត្រសាល និង telemetry | ជាជម្រើស (ត្រូវការ សម្រាប់បោះពុម្ភ) |

មិនមានអ្វីពិសេសទេ៖ ពេលអ្នកដំណើរការ `azd init --template you/your-repo`，azd នឹងចម្លង repo ហើយអាន `azure.yaml`។

---

## ជំហាន ១៖ បង្កើតឃ្លាំង

បង្កើតរចនាសម្ព័ន្ធថតដោយដៃ ឬចាប់ផ្ដើមពីគំរូតិចតួចហើយកែសម្រួលវា：

```bash
mkdir my-azd-template && cd my-azd-template
git init

# បង្កើតប្រព័ន្ធតម្រងស្តង់ដារ
mkdir -p src infra
```

រចនាសម្ព័ន្ធបញ្ចប់ទូទៅមើលទៅដូចជា：

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## ជំហាន ២៖ សរសេរ `azure.yaml`

នេះគឺជាចិត្តស្រឡាយនៃគំរូ។ វាប្រាប់ azd អំពីអ្វីដែលត្រូវបញ្ចូល និងរបៀបធ្វើ：

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> តារាង `metadata.template` គឺជាអ្វីដែល telemetry វិចិត្រសាលប្រើសម្រាប់រាប់ការប្រើប្រាស់។ ប្រើបណ្ដាប្រព័ន្ធ `name@version`។

---

## ជំហាន ៣៖ ប្លង់ប្រាក់ឧបករណ៍

ច្បាប់សំខាន់បំផុតសម្រាប់គំរូដែលអាចប្រើឡើងវិញ៖ **មិនគួរចាក់ឈ្មោះកញ្ចប់ណាមួយ， តំបន់ ឬ តម្លៃពិសេសគ្រប់ដាច់។** ប្រើប៉ារ៉ាម៉ែត្រ និងគំរូធនធាន token ដើម្បីឲ្យគំរូដំណើរការបាននៅក្នុងការជាវរបស់គ្នា។

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

ពីរអ្វីដែលធ្វើឲ្យគំរូនេះសមរម្យ：

1. **ស្លាក `azd-env-name`** — azd ប្រើវាដើម្បីតាមដាន និងសម្អាតធនធានក្នុងបរិដ្ឋានមួយៗ។
2. **ធនធាន token `uniqueString(...)`** — បង្កើតសំឡេងបន្ថែមមួយដែលមានតម្លៃថេរ និងអាចធ្វើឡើងជាសកល ដូច្នេះឈ្មោះមិនប៉ះទង្គិច។

ផ្តល់ឯកសារប៉ារ៉ាម៉ែត្រដែលស្របតាមតម្លៃដែល azd ចាក់បញ្ចូលពីបរិដ្ឋាន៖

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd ជំនួស `${AZURE_ENV_NAME}` និង `${AZURE_LOCATION}` ពីបរិដ្ឋានបច្ចុប្បន្នដោយស្វ័យប្រវតិ្ត។

---

## ជំហាន ៤៖ សាកល្បងគំរូរបស់អ្នកនៅក្នុងកន្លែងមូលដ្ឋាន

មុនចែករំលែក，បញ្ជាក់ថាគំរូដំណើរការពីស្ថានភាពស្អាត។

**សាកល្បងពីថតក្នុងស្រុក** (មិនចាំបាច់ push ទៅ Git)៖

```bash
# ពីថតទទេ ចាប់ផ្តើមដោយប្រើផ្លូវទំព័រ​សំណុំបែបបទក្នុងតំបន់របស់អ្នក
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# រៀបចំ + ដាក់ប្រើពីចប់ដល់ចប់
azd auth login
azd up
```

**បន្ទាប់សាកល្បងការបញ្ឈប់** — គំរូល្អបំផុតត្រូវតែសម្អាតបានពេញលេញ៖

```bash
azd down --force --purge
```

ប្រសិនបើ `azd down` ទុកធនធាននៅសល់，អ្នកប្រហែលជាមិនបានដាក់ស្លាក `azd-env-name` លើធនធានអ្វីមួយទេ។

> **កន្លែងផ្តល់អនុសាសន៍:** វាយ `azd provision --preview` ជាមុន។ វាធ្វើការពិនិត្យអ្វីមួយ និងបង្ហាញកំហុសគំរូមុនពេលធនធានត្រូវបានបង្កើត។

---

## ជំហាន ៥៖ បោះពុម្ភគំរូ

បញ្ចូលឃ្លាំងទៅ GitHub (សាធារណៈ ប្រសិនបើអ្នកចង់ឲ្យអ្នកដទៃប្រើ)៖

```bash
gh repo create my-azd-template --public --source=. --push
```

ឥឡូវនេះ មនុស្សណាក៏អាចប្រើបាន៖

```bash
azd init --template your-github-username/my-azd-template
```

---

## ជំហាន ៦ (ជាជម្រើស)៖ ដាក់ស្នើទៅ Awesome AZD

[វិចិត្រសាល Awesome AZD](https://azure.github.io/awesome-azd/) បង្ហាញគំរូសហគមន៍។ ដើម្បីត្រូវបានបញ្ចូលក្នុងបញ្ជី អ្នកគួរតែមាន៖

- ✅ `README.md` ច្បាស់លាស់ជាមួយទាមទារមុន，គំនូសស្ថាបត្យកម្ម និងកំណត់តម្លៃថ្លៃដើម
- ✅ `azure.yaml` សកម្មជាមួយ `metadata.template`
- ✅ ស្ថាបត្យកម្មដែលរៀបចំបានស្អាតនៅក្នុងការជាវថ្មី
- ✅ ឯកសារ `LICENSE`
- ✅ (បានណែនាំ) `.devcontainer/` សម្រាប់ Codespaces តែមួយចុច

ដាក់ស្នើដោយបើក pull request ដែលបន្ថែមគំរូរបស់អ្នកក្នុងឯកសារទិន្នន័យនៅវិចិត្រសាលនេះ，អនុវត្តតាមមគ្គុទេសក៍ការរួមចំណែកនៅ [Awesome AZD repository](https://github.com/Azure/awesome-azd)។

---

## ប្រឈមមុខបញ្ហាទូទៅ

| បញ្ហា | ការ​ដោះស្រាយ |
|---------|-----|
| ឈ្មោះធនធានដែលបានចាក់បញ្ចូលដោយដៃ | ប្រើ token `uniqueString()` សម្រាប់ធនធាន |
| `azd down` ទុកធនធាននៅសល់ | ឧ្យថាកម្មវិធីទាំងអស់ (ឬក្រុមធនធាន) មានស្លាក `azd-env-name` |
| គំរូដំណើរការសម្រាប់អ្នក ប៉ុន្តែបរាជ័យសម្រាប់អ្នកដទៃ | លុប ID ការជាវ，ID សំណល់ និងការសន្មត់តំបន់ |
| លទ្ធផលមិនភ្ជាប់ទៅកម្មវិធី | បញ្ជូន `SERVICE_<NAME>_ENDPOINT_URL` និងផលប៉ះពាល់ `AZURE_*` ផ្សេងៗ |
| ការដាក់ស្នើន៍វិចិត្រសាលត្រូវបានបដិសេធ | បន្ថែម `README.md`，`LICENSE`， និង `metadata.template` |

---

## សង្ខេប

- គំរូគឺគ្រាន់តែជា repo Git មួយដែលមាន `azure.yaml`，`infra/` និងកូដរបស់អ្នក។
- ប្លង់ប្រាក់គ្រប់យ៉ាង — ឈ្មោះ，តំបន់ និង ID ដើម្បីវាអាចដំណើរការណាមួយ។
- តែងតែដាក់ស្លាកធនធានជាមួយ `azd-env-name` ដើម្បីឲ្យ `azd down` ធ្វើការងារបាន។
- សាកល្បងក្នុងស្រុកជាមួយ `azd init --template <local-path>` មុនពេលបោះពុម្ភ។
- បន្ថែម metadata និង README ដើម្បីដាក់ស្នើទៅ Awesome AZD។

---

## 🔗 សារជាដំណាក់កាល

| ទិស | រ स्रोत |
|-----------|----------|
| **មុននេះ** | [មគ្គុទេសក៍ចែកចាយ](deployment-guide.md) |
| **ផេកមេរៀន** | [ជំពូក ៤៖ ស្ថាបត្យកម្មជា code](README.md) |
| **ជំពូកបន្ទាប់** | [ជំពូក ៥៖ ដំណោះស្រាយច្រើនភ្នាក់ងារ](../chapter-05-multi-agent/README.md) |

## 📖 ឯកសារដែលទាក់ទង

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [ឯកសារគំរូ azd ផ្លូវការជាមួយ](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
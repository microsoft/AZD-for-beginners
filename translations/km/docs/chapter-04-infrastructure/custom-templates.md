# ការរចនាគំរូ azd របស់អ្នកឯង

**ការយោងជាប់បន្តៈ**
- **📚 ទំព័រដើមវគ្គសិក្សា**៖ [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ថ្នាក់បច្ចុប្បន្ន**៖ ថ្នាក់ទី ៤ - ស្ថាបត្យកម្មជាកូដ និង ការចាក់ផ្សាយ
- **⬅️ មុននេះ**៖ [មគ្គុទេសក៍ចាក់ផ្សាយ](deployment-guide.md)
- **🚀 ថ្នាក់បន្ទាប់**៖ [ថ្នាក់ទី ៥៖ ដំណោះស្រាយភ្នាក់ងារច្រើន](../chapter-05-multi-agent/README.md)

> បានពិនិត្យឡើងវិញទល់នឹង `azd 1.37.2` (ខែវិច្ឆិកា ឆ្នាំ ២០២៦)។ នេះគឺជាការដើរឆ្លងលោកអ្នកជាមួយឯកសារផ្នែកមួយ **មិនមែនមាតិកាទូទៅទាំងមូលទេ**: អ្នកត្រូវផ្ដល់កូដកម្មវិធី និង `modules/web.bicep` ជាមួយបរិវេណវាសនា, ឯកសារចុះបញ្ជី, កម្មវិធី Container App និងលទ្ធផល មុនការចេញបញ្ចេញ។ ការផ្ដល់ Azure ត្រូវបានមិនបានអនុវត្តក្នុងការពិនិត្យនេះ។

## ការណែនាំ

រហូតដល់ពេលនេះ អ្នកបាន *ប្រើប្រាស់* មាតិកាជាមួយ `azd init --template <name>`។ ប៉ុន្តែពេលដែលអ្នកមានរចនាសម្ព័ន្ធគម្រោងដែលក្រុមរបស់អ្នកចូលចិត្ត—ដូចជា Container App ជាមួយ Cosmos DB និងការត្រួតពិនិត្យត្រឹមត្រូវ—អ្នកនឹងចង់បម្លែងវាទៅជាមាតិកាដែលអាចប្រើប្រាស់ឡើងវិញរបស់អ្នកផ្ទាល់។ មាតិកា គ្រាន់តែជាគេហទំព័រ Git ដែលមានរចនាសម្ព័ន្ធទ្រង់ទ្រាយ ដែល azd យល់ដឹងពីរបៀបអាន។ មេរៀននេះបង្ហាញអ្នកពីរបៀបបង្កើតមួយចាប់ពីចំនុចសូន្យ, សាកល្បងវា និង (ជាជម្រើស) ផ្សព្វផ្សាយវា ទៅឱ្យបណ្ណាល័យសហគមន៍។

## គោលបំណងសិក្សា

នៅចុងបញ្ចប់មេរៀននេះ អ្នកនឹងអាច៖
- កាន់ដឹងថាអ្វីដែលបង្កើតថតមួយជាមាតិកា "azd template" អ្វីខ្លះ
- ដឹងពីឯកសារដែលត្រូវការនិងរចនាសម្ព័ន្ធថត
- បន្ថែម `azure.yaml` និង `infra/` ដែលមនុស្សផ្សេងអាចប្រើឡើងវិញបាន
- សាកល្បងមាតិការបស់អ្នកនៅលើកុំព្យូទ័រផ្ទាល់ មុនចែករំលែកវា
- ផ្សព្វផ្សាយវានិង (ជាជម្រើស)ដាក់ស្នើវាទៅឱ្យ Awesome AZD

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់មេរៀននេះ អ្នកនឹងអាច៖
- បង្កើតឃ្លាំងមាតិកាថ្មីមួយ
- ប៉ារ៉ាម៉ែត្រចំរូងបរិស្ថានដើម្បីវាត្រូវបានប្រើប្រាស់បានក្នុងជំនួយណាមួយ
- ផ្ទៀងផ្ទាត់មាតិកាដោយប្រើ `azd init` និង `azd up`
- បន្ថែមទិន្នន័យដែលបណ្ណាល័យសហគមន៍ត្រូវការ

---

## មាតិកាគឺជាអ្វីនៅពិត?

មាតិកា azd គឺ **ឃ្លាំង Git** ដែលមានយ៉ាងតិច:

| ឯកសារ / ថត | គោលបំណង | ត្រូវការឬ? |
|---------------|---------|-----------|
| `azure.yaml` | ពណ៌នាសេវាកម្ម, ម៉ាស៊ីនផ្ទុក និងអ្នកផ្គត់ផ្គង់បរិវេណ | ✅ បាទ/ចា៎ |
| `infra/` | ការកំណត់ Bicep ឬ Terraform សម្រាប់ផ្ដល់ | ត្រូវការ​សម្រាប់ឧទាហរណ៍ IaC ជាក់លាក់នេះ; គម្រោងដែលបង្កើតបរិវេណគឺអាចមិនមានវា |
| `src/` (ឬកូដរបស់អ្នក) | កូដកម្មវិធីដែល azd បញ្ចេញ | ត្រូវការ​សម្រាប់សេវាកម្មដែលផ្អែកលើប្រភពកូដ; មាតិកមួយចំនួនមិនមានកូដកម្មវិធីទេ |
| `README.md` | របៀបប្រើប្រាស់មាតិកា | ✅ ផ្ដល់អនុសាសន៍ខ្លាំង |
| `.azdo/` ឬ `.github/` | ការកំណត់ប៉ុស្តិ៍ CI/CD | ជាជម្រើស |
| `.devcontainer/` | បរិវេណអភិវឌ្ឍដែលអាចធ្វើឡើងម្ដងទៀត | ជាជម្រើស |
| `azure.yaml` `metadata` | ព័ត៌មានអំពីអត្តសញ្ញាណ/ទំនាក់ទំនងមាតិកា | ផ្ដល់អនុសាសន៍; ការផ្សព្វផ្សាយឃ្លាំង Git មិនទាមទារវា |

មិនមានអ្វីវេទមន្តនៅទីនេះទេ៖ ពេលអ្នករត់ `azd init --template you/your-repo`, azd នឹងចម្លងឃ្លាំងហើយអាន `azure.yaml`។

---

## ជំហានទី ១៖ បង្កើតឃ្លាំង

បង្កើតរចនាសម្ព័ន្ធថតដោយដៃ ឬចាប់ផ្តើមពីមាតិកាខ្សែផ្តើម ហើយកែសម្រួលវា៖

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

រចនាសម្ព័ន្ធដែលបានបញ្ចប់ទូទៅមានរូបរាងដូចខាងក្រោម៖

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

## ជំហានទី ២៖ សរសេរ `azure.yaml`

នេះគឺជា​បេះដូង​របស់​មាតិកា​។ វាប្រាប់ azd អំពីអ្វី​នឹងធ្វើបញ្ចេញ និងរបៀបធ្វើ៖

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> វាល `metadata.template` គឺជាអ្វីដែលបណ្ណាល័យធ្វើការត្រួតពិនិត្យដើម្បីរាប់ចំនួនប្រើប្រាស់។ ប្រើការតាមស្តង់ដារ `name@version`។

---

## ជំហានទី ៣៖ ប៉ារ៉ាម៉ែត្រ បរិវេណ

ការគោរពច្បាប់សំខាន់បំផុតសម្រាប់មតិកា *អាចប្រើឡើងវិញ*៖ **មិនត្រូវកូដឈ្មោះ ផ្ទៃដី ឬតម្លៃពិសេសបញ្ជាក់តាមជំនួយណាមួយ។  ** ប្រើប៉ារ៉ាម៉ែត្រ និងលំនាំសំលេងធនធាន ដូច្នេះមាតិកាដូចគ្នានឹងដំណើរការបាននៅក្នុងជំនួយមនុស្សណាក៏ដោយ។

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

រឿងពីរចំនួនទាំងនេះធ្វើឱ្យវាមិនបង្ករលំបាកសម្រាប់មាតិកា៖

1. **ស្លាក `azd-env-name`** — azd ប្រើវាទៅតាមការតាមដាន និងសម្អាតធនធានក្នុងបរិវេណនីមួយៗ។
2. **ស្លាកសម្គាល់ធនធាន `uniqueString(...)`** — ផលិតអក្សរសំហឹម hash ទន់ខ្សោយដើម្បីកាត់បន្ថយការប៉ះទង្គិច; វាមិនមែនជាការធានាបាននូវភាពតែម្នាក់ឯងយ៉ាងសកលទេ។

`modules/web.bicep` ដែលខ្វះ ពាក់ព័ន្ធត្រូវទទួលយក `name`, `location` និង `tags`, ផ្ដល់បរិវេណ/ឯកសារចុះបញ្ជី Container Apps និងកម្មវិធី, ស្លាកកម្មវិធីជាមួយ `azd-service-name: web`, និងនាំចេញ `uri`។ វាក៏ត្រូវបង្ហាញមូលដ្ឋាននៃតម្លៃឯកសារចុះបញ្ជីដែលត្រូវការ ដោយរបៀបបង្កើត/ចេញបញ្ចេញដែលបានជ្រើសរើស (ឧទាហរណ៍ `AZURE_CONTAINER_REGISTRY_ENDPOINT` ពីម៉ូឌុលមូលដ្ឋាន)។ លទ្ធផលមួយសម្រាប់ចេញចោល មិនភ្ជាប់ទំនាក់ទំនងសេវាកម្ម ការកំណត់កម្មវិធី ឬការផ្ទៀងផ្ទាត់ឯកសារចុះបញ្ជីឡើយ។

ផ្ដល់ឯកសារពាណិជ្ជកម្មសមរម្យមួយ ដែលអានតម្លៃដែល azd បញ្ចូលពីបរិវេណ:

រក្សាទុកដូចជា `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd ជំនួស `${AZURE_ENV_NAME}` និង `${AZURE_LOCATION}` ពីបរិវេណបច្ចុប្បន្នដោយស្វ័យប្រវត្តិ។

---

## ជំហានទី ៤៖ សាកល្បងមាតិការបស់អ្នកនៅលើកុំព្យូទ័រផ្ទាល់

មុនចែករំលែក បង្ហាញថាមាតិកាគឺដំណើរការពីសភាពស្អាត។

**សាកល្បងពីថតក្នុង** (មិនត្រូវ Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**បន្ទាប់មក សាកល្បងការដោះលែង** — មាតិកាល្អគឺសម្អាតត្រឹមត្រូវពេញលេញ៖

```bash
azd down --force --purge
```

ប្រសិនបើ `azd down` បោះបង់ធនធាននៅក្រោយ ជាវិនិច្ឆ័យការរកឃើញបរិវេណ/ក្រុមធនធាន, ធនធានខាងក្រៅ/រួមផែនការ,សិទ្ធិ, ខ្នងសោ និងការពារ purge ។ `--purge` មិនលុបស្ថានភាព `.azure/` នៅលើកុំព្យូទ័រផ្ទាល់ទេ។

> **ជំនួយ:** បន្ទាប់ពីផ្ដល់ឯកសារដែលខ្វះទាំងអស់ រត់ការបញ្ជា `azd provision --preview` ជាលើកដំបូង។ ពិនិត្យមើលរោងចក្រមុនពេលពិនិត្យមើល ព្រោះវាអាចប្រតិបត្តិការប៉ះពាល់ផ្សេងៗបាន។ ការពិនិត្យមើល មិនមែនជាការវាយតម្លៃតំលៃ ឬការធានាថាការផ្ដល់នឹងជោគជ័យឡើយ។

---

## ជំហានទី ៥៖ ផ្សព្វផ្សាយមាតិកា

បើកឃ្លាំងទៅ GitHub (សាធារណៈ ប្រសិនបើអ្នកចង់ឲ្យអ្នកផ្សេងប្រើប្រាស់វា):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

ឥឡូវនេះគ្រប់គ្នាអាចប្រើបាន៖

```bash
azd init --template your-github-username/my-azd-template .
```

---

## ជំហានទី ៦ (ជាជម្រើស)៖ ដាក់ស្នើទៅ Awesome AZD

បណ្ណាល័យ [Awesome AZD gallery](https://azure.github.io/awesome-azd/) រួមបញ្ចូលមាតិកាសហគមន៍។ ដើម្បីអោយបញ្ជី ឃ្លាំងរបស់អ្នកគួរតែលមាន៖

- ✅ បញ្ជី `README.md` ច្បាស់លាស់ មានលក្ខខណ្ឌជំនួស, គំនូសអាគារនិងកំណត់តម្លៃ
- ✅ `azure.yaml` កំពុងដំណើរការជាមួយ `metadata.template`
- ✅ បរិវេណដែលផ្ដល់បានយ៉ាងស្អាតក្នុងជំនួយថ្មី
- ✅ ឯកសារ `LICENSE`
- ✅ (ផ្ដល់អនុសាសន៍) `.devcontainer/` សម្រាប់ Codespaces ចុចមួយ

ដាក់ស្នើដោយបើក pull request ដែលបន្ថែមមាតិការបស់អ្នកទៅឯកសារទិន្នន័យនៃបណ្ណាល័យដោយស្ថិតក្រោមណែនាំរបស់ [ឃ្លាំង Awesome AZD](https://github.com/Azure/awesome-azd)។

---

## កំហុសធម្មតា

| កំហុស | ជួសជុល |
|---------|-----|
| ឈ្មោះធនធានកូដរឹត | ប្រើស្លាកសម្គាល់ធនធាន `uniqueString()` |
| `azd down` បោះបង់ធនធាន | ស្លាកធនធាននីមួយៗ (ឬក្រុមធនធាន) ជាមួយ `azd-env-name` |
| មាតិកាធ្វើបានល្អសម្រាប់អ្នក ប៉ុន្តែបរាជ័យសម្រាប់អ្នកដទៃ | លុប ID ជំនួយ អត្តសញ្ញាណអ្នកជួល និងការសន្និដ្ឋានផ្នែកតំបន់ |
| លទ្ធផលមិនភ្ជាប់ទៅកម្មវិធី | ផ្គូរផ្គង `azd-service-name` / `resourceName` សម្រាប់ការបញ្ចេញ ហើយផ្គូរផ្គងលទ្ធផលទៅការកំណត់កម្មវិធីយ៉ាងច្បាស់លាស់ |
| ការដាក់ស្នើបណ្ណាល័យបដិសេធ | បន្ថែម `README.md`, `LICENSE` និង `metadata.template` |

---

## សង្ខេប

- មាតិកាគ្រាន់តែល Thành Git repository ដែលមាន `azure.yaml`, `infra/`, និងកូដរបស់អ្នក។
- ប៉ារ៉ាម៉ែត្រទាំងអស់- ឈ្មោះ, តំបន់ និង ID- ដើម្បីវាសង្កត់នៅគ្រប់ទីកន្លែង។
- ស្លាកធនធានជានិច្ចជាមួយ `azd-env-name` ដូច្នេះ `azd down` បំពេញភារកិច្ច។
- សាកល្បងនៅក្នុងមុខខាងកុំព្យូទ័រជាមួយ `azd init --template <local-path>` មុនផ្សព្វផ្សាយ។
- បន្ថែមទិន្នន័យ និង README ដើម្បីដាក់ស្នើទៅ Awesome AZD។

---

## 🔗 ចរចានៅលើផ្លូវ

| ទិស | ធនធាន |
|-----------|----------|
| **មុននេះ** | [គ្រប់គ្រងការចេញបញ្ចេញ](deployment-guide.md) |
| **ទំព័រដើមជំពូក** | [ជំពូក ៤: ស្ថាបត្យកម្មជាទូទៅ](README.md) |
| **ជំពូកបន្ទាប់** | [ជំពូក ៥: ដំណោះស្រាយភ្នាក់ងារច្រើន](../chapter-05-multi-agent/README.md) |

## 📖 ធនធានដែលទាក់ទង

- [ការផ្ដល់បរិវេណធនធាន](provisioning.md)
- [បណ្ណាល័យ Awesome AZD](https://azure.github.io/awesome-azd/)
- [ឯកសារមាតិកា azd ផ្លូវការជាភាសាអង់គ្លេស](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
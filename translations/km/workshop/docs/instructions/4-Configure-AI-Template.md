# 4. កំណត់រចនាសម្ព័ន្ធមួយគំរូ

!!! tip "នៅចុងបញ្ចប់នៃមូឌុលនេះ អ្នកនឹងអាចធ្វើបាន"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. ចាប់ផ្តើមជាមួយគំរូពិតប្រាកដ

បើក [`azure.yaml` នៅក្នុង Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) នៅក្នុងឃ្លាំងដែលអ្នកបានចាប់ផ្តើម។ គំរូផ្តាច់មុខអាចផ្លាស់ប្តូរដោយឡែកពីវគ្គបណ្តុះបណ្តាលនេះ។ **វិចារណយោបល់** ខាងក្រោមត្រូវបានពិនិត្យនៅថ្ងៃទី ៤ ខែវិច្ឆិកា ឆ្នាំ ២០២៦; វាមិនមែនជាការជំនួសឯកសារពេញលេញទេ៖

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` កំណត់គម្រោង AZD; `metadata.template` កត់ត្រាភាពជាផ្សេងគ្នារបស់គំរូ។
- `requiredVersions.azd` គឺជាចំនួនទាបបំផុតរបស់គំរូ មិនមែនជាការផ្ដល់អនុសាសន៍ឲ្យនៅលើ CLI ចាស់។ ប្រើការចេញផ្សាយ AZD ដែលមានការគាំទ្របច្ចុប្បន្ន។
- `services` កំណត់គោលដៅផ្សព្វផ្សាយកម្មវិធី។ គំរូនេះផ្សព្វផ្សាយ Python API និងផ្នែកមុខមួយជា សេវាកម្ម Container Apps មួយ។
- `project` មានទំនាក់ទំនងទៅកាន់ `azure.yaml`។
- `remoteBuild` ស្នើសុំការបង្កើតកុងតឺន័រពីចម្ងាយ។ អត្តសញ្ញាណរបស់អ្នកត្រូវតែមានសិទិ្ធ Azure ត្រូវការ។

ឯកសារ Bicep របស់គំរូនៅក្រោម `infra/` មិនមែនតែបញ្ជី `services` ទេ ក៏ប្រកាសធនធានដូចជា Microsoft Foundry, ការផ្សព្វផ្សាយម៉ូដែល, អត្រាទុក និង AI Search ជាជម្រើស។

## ២. យល់ដឹងអំពី lifecycle hooks

សូមពិនិត្យផ្នែក `hooks` និងស្គ្រីប​ដែលបានយោងមុនពេលដំណើរការគំរូ។ កំណែដែលបានពិនិត្យមាន៖

| Hook |គោលបំណង | អនុវត្តន៍សំខាន់ |
|------|---------|--------------------|
| `preup` | ផ្ទៀងផ្ទាត់បញ្ចូលបរិស្ថានគំរូ មុនចាប់ផ្តើមសកម្មភាព `up` | ស្គ្រីបរាងដែកเฉพาะប្លាតហ្វមអាចបញ្ឈប់សកម្មភាពនៅពេលបរាជ័យ |
| `postdeploy` | ប្រតិបត្ដិការការតំឡើងជាក់លាក់របស់គំរូបន្ទាប់ពីផ្សព្វផ្សាយកម្មវិធី | សូមពិនិត្យ `continueOnError` និងលទ្ធផលស្គ្រីប; ការផ្សព្វផ្សាយដោយជោគជ័យមិនបញ្ជាក់ថាការតំឡើងទាំងអស់បានជោគជ័យទេ |

ជំនាន់នេះមិន​មាន **hook** `postprovision` / `write_env` ចាស់ៗ​ដែលបានបង្ហាញ​នៅក្នុងសម្ភារៈវគ្គបណ្តុះបណ្តាល​មុនទេ។ កុំចម្លងយោង hook ទៅកាន់ស្គ្រីបដែលមិនមានទៀតឡើយ។

កូនសោ hook ជ្រើសរើសព្រឹត្តិការណ៍វិធីជីវិត; `posix` និង `windows` ជ្រើសរើសការអនុវត្តវេទិកា។ `shell`, `run`, `interactive`, និង `continueOnError` គ្រប់គ្រងការប្រតិបត្តិ។ ទាំងនេះជាស្គ្រីបទៅនឹងការប្រតិបត្តិដោយមានការអនុញ្ញាតរបស់អ្នក ដូច្នេះសូមពិនិត្យមើលពួកវាដូចជាកូដកម្មវិធីមួយ។

មើលឯកសារ [AZD hooks documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) សម្រាប់វិធីជីវិតពេញលេញ។

## 3. តាមដានការបញ្ចូលបរិស្ថានទៅក្នុងហេដ្ឋារចនាសម្ព័ន្ធ

ចាប់ផ្តើមបញ្ជាលេខនេះពីឃ្លាំងគំរូដែលបានចាប់ផ្តើមរួច៖

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

ពិនិត្យ `infra/main.parameters.json` ដើម្បីមើលថាតើអថេរបរិស្ថានណាខ្លះដែលគំរូប្រើប្រាស់ពិតប្រាកដ។ ការកំណត់ឈ្មោះដោយសំណើចដោយ `azd env set` មិនបានផ្លាស់ប្ដូរធនធាន Azure ដោយស្វ័យប្រវត្តិទេ។

ការកំណត់លំនាំដើមបានពិនិត្យរួចរួមមាន៖

| បញ្ចូល | លំនាំដើម / អ្នកប្រើប្រាស់ |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; អង្គភាពកំណត់សិទ្ធិអាស្រ័យលើម៉ូដែល និងប្រភេទការដាក់ចេញ |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; កុំបើកប្រើ លុះត្រាតែការដោះស្រាយទិន្នន័យត្រូវបានពិនិត្យឡើយ |

ឯកសារទាំងនេះជាបញ្ចូលជាក់លាក់សម្រាប់គំរូ មិនមែនការកំណត់ AZD ជាសកលទេ។ សូមពិនិត្យមើល [ឯកសារគាំទ្រម៉ូដែល និងតំបន់](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) និងកាលង់ការជាវរបស់អ្នកមុនជ្រើសរើសម៉ូដែល, SKU, សមត្ថភាព ឬទីតាំង។ កុំបកស្រាយការឯកភាពសមត្ថភាពទាំងអស់ថា ១,០០០ សញ្ញា​ក្នុងមួយនាទី។

ដើម្បីជ្រើសរើសម៉ូដែលសន្ទនាផ្សេងទៀត សូមធ្វើបច្ចុប្បន្នភាព **នាម, កំណែ, ទ្រង់ទ្រាយ, SKU, និងសមត្ថភាពរួមគ្នា** ដែលអាចប្រើបានរបស់វា ដោយអនុវត្តតាម [មគ្គុទេសក៍ប្តូរតាមគំរូ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md)។ ការផ្លាស់ប្តូរតែឈ្មោះអាចធ្វើអោយកំណែឬប្រភេទការដាក់ចេញមិនសមរម្យ។

## ៤. រោងចក្រ៖ បើកការស្វែងរក និងការតាមដានជាជម្រើស

!!! warning "ការកំណត់ទាំងនេះអាចបន្ថែមធនធានដែលត្រូវគិតប្រាក់"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

ការផ្លាស់ប្តូរក្រោមមូលដ្ឋានត្រូវការការផ្គត់ផ្គង់; `azd deploy` ផ្ទាល់គ្រាន់តែដាក់បង្ហោះសេវាកម្មកម្មវិធីប៉ុណ្ណោះ។ សម្រាប់ការសង្ខេបវិញក្នុងការស្វែងរក និងជម្រើសធ្វើការយកព័ត៌មានដែលគាំទ្រ សូមអនុវត្តតាម [មគ្គុទេសក៍ AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md)។ សម្រាប់ការត្រួតពិនិត្យសូមអនុវត្តតាម [មគ្គុទេសក៍កំណត់មើល](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md)។

កុំបើកការកាមរការស្តុកមាតិកាពី prompt/response នៅលើទិន្នន័យអតិថិជនពិត ដោយគ្មានការយល់ព្រម តាមការគ្រប់គ្រងការចូលដំណើរការ, នយោបាយរក្សាទុក និងការលុបចោលដែលត្រូវការជាក់លាក់។

## ៥. ធនធានមានស្រាប់ និង CI/CD

ដើម្បីប្រើប្រាស់គម្រោង Foundry ម្តងទៀត សូមអនុវត្តតាម [សេចក្ដីណែនាំធនធានមានស្រាប់](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) របស់គំរូ។ ការកំណត់ `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` ប្រែផ្លូវដាក់ចេញ; ក្នុងករណីនោះ គំរូមិនបង្កើត Application Insights ឬ AI Search សម្រាប់អ្នកឡើយ។ សូមផ្ទៀងផ្ទាត់អាស្រ័យភាព ការបែងចែកតួនាទី និងការដាក់ចេញម៉ូដែលជាការប្រកាសច្បាស់។

ផ្នែក `pipeline.variables` គ្រប់គ្រងតម្លៃដែលផ្តល់ចូលទៅក្នុងបន្ទាត់បង្រួមដែលបានបង្កើត; វាមិនមែនឃ្លាំងសម្ងាត់និងមិនបង្កើតធនធាន Azure ឡើយ។ ត្រូវពេញចិត្តអត្តសញ្ញាណគ្រប់គ្រងក្នុងកម្មវិធី និង OIDC សម្រាប់ CI/CD ។ ឯកសារបរិយាកាស AZD ជាផ្ទឹមអត្ថបទធម្មតា ហើយមិនគួរត្រូវបានបញ្ជូល។

AZD គាំទ្រការនាំចូលឯកសារ dotenv ដែលបានរៀបចំទុកជាក់លាក់នៅមូលដ្ឋាន៖

```bash
azd env set --file .env
```

ពិនិត្យមើលឯកសារនោះមុននាំចូល ហើយកុំបោះពុម្ភឯកសារតំបន់បរិយាកាសដែលមានសម្ងាត់នៅក្នុងធនាគារចែករំលែកឬកំណត់ត្រា CI។

## ៦. ស្មារតីភាពរបស់អ្នក

- សេវាកម្ម `azure.yaml` ណាមួយដែលដាក់ចេញកម្មវិធី?
- ប៉ារ៉ាម៉ែត្រ អាគុយចិចចេញក្នុងផ្នែកអាគុយចិចណាមួយដែលអ្នកបានផ្លាស់ប្តូរតម្លៃ?
- ការផ្លាស់ប្តូរអ្វីខ្លះដែលត្រូវការការផ្គត់ផ្គង់ ជាងតែការដាក់ចេញ?
- តំបន់ និងការជាវដែលបានជ្រើសគាំទ្រម៉ូដែល និងគោត?
- តួអង្គហាងស្រេចទាំងអស់ ហើយអ្នកអាចផ្ទៀងផ្ទាត់សកម្មភាពកម្មវិធីដែលបានដាក់ចេញ?

បន្តទៅ [ផ្លាស់ប្តូរគំរូ](5-Customize-AI-Template.md)។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
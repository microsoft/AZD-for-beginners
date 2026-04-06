# 4. កំណត់គំរូ

!!! tip "ចប់មូឌុលនេះ អ្នកនឹងអាច"

    - [ ] យល់ពីគោលបំណងនៃ `azure.yaml`
    - [ ] យល់ពីរចនាសម្ព័ន្ធនៃ `azure.yaml`
    - [ ] យល់ពីតម្លៃនៃ `hooks` រង្វង់ជីវិត azd
    - [ ] **Lab 4:** ស្វែងរក និងកែប្រែអថេរសម្រាប់បរិស្ថាន

---

!!! prompt "ឯកសារ `azure.yaml` ធ្វើអ្វី? សូមប្រើ codefence ហើយពន្យល់តាមបន្ទាត់"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. គោលបំណង និងមុខងារ

ឯកសារ `azure.yaml` នេះបម្រើជា **ផែនការដាក់បញ្ចូល (deployment blueprint)** សម្រាប់កម្មវិធីភ្នាក់ងារយ៉ាង AI ដែល:

1. **ផ្ទៀងផ្ទាត់បរិស្ថាន** មុនការដាក់បញ្ចូល
2. **ផ្គត់ផ្គង់សេវា Azure AI** (AI Hub, AI Project, Search, ល។)
3. **ដាក់បញ្ចូលកម្មវិធី Python** ទៅកាន់ Azure Container Apps
4. **កំណត់ម៉ូឌែល AI** សម្រាប់ទាំងបែបជជែក និង embedding
5. **រៀបចំការត្រួតពិនិត្យ និងតាមដាន** សម្រាប់កម្មវិធី AI
6. **គាំទ្រ​ទាំង​គម្រោង Azure AI ថ្មី និងដែលមានរួច**

ឯកសារនេះអនុញ្ញាតឱ្យមានការ **ដាក់បញ្ចូលដោយពាក្យបញ្ជាតែមួយ** (`azd up`) សម្រាប់ដំណោះស្រាយភ្នាក់ងារយ៉ាង AI ពេញលេញ ជាមួយការផ្ទៀងផ្ទាត់ ផ្គត់ផ្គង់ និងកំណត់រចនាសម្ព័ន្ធបន្ទាប់ពីដាក់បញ្ចូលយ៉ាងត្រឹមត្រូវ។

??? info "បើកដើម្បីមើល: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. បំបែកឯកសារ

យើងនឹងឆែកឯកសារនេះមុខងារ​ដោយ​ដំណាក់កាល ដើម្បីយល់ពីអ្វីដែលវាធ្វើ និងហេតុផល។

### 2.1 **ក្បាល និងស្គីម៉ា (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **បន្ទាត់ 1**: ផ្តល់ការផ្ទៀងផ្ទាត់ស្គីម៉ាសម្រាប់ YAML language server សម្រាប់ការគាំទ្រ IDE និង IntelliSense

### 2.2 ព័ត៌មានមេតាផ្ទាល់គម្រោង (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **បន្ទាត់ 5**: កំណត់ឈ្មោះគម្រោងដែលប្រើដោយ Azure Developer CLI
- **បន្ទាត់ 6-7**: បញ្ជាក់ថាវា​គឺផ្អែកលើគំរូ ជំនាន់ 1.0.2
- **បន្ទាត់ 8-9**: ទាមទារថាត្រូវមាន Azure Developer CLI ជំនាន់ 1.14.0 ឬខ្ពស់ជាងនេះ

### 2.3 hooks សម្រាប់ដាក់បញ្ចូល (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **បន្ទាត់ 11-20**: **Pre-deployment hook** - ដំណើរការមុន `azd up`

      - លើ Unix/Linux: ធ្វើឱ្យស្គ្រីបផ្ទៀងផ្ទាត់អាចដំណើរការ និងរត់វា
      - លើ Windows: រត់ស្គ្រីប PowerShell សម្រាប់ផ្ទៀងផ្ទាត់
      - ទាំងពីរមានរបៀបអន្តរកម្ម ហើយនឹងបញ្ឈប់ការដាក់បញ្ចូល ប្រសិនបើពួកវាបរាជ័យ

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **បន្ទាត់ 21-30**: **Post-provision hook** - ដំណើរការបន្ទាប់ពីធនធាន Azure ត្រូវបានបង្កើត

  - អនុវត្តស្គ្រីបសរសេរ​អថេរសម្រាប់បរិស្ថាន
  - បន្តការដាក់បញ្ចូល ទោះបីស្គ្រីបទទួលបរាជ័យក៏ដោយ (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **បន្ទាត់ 31-40**: **Post-deploy hook** - ដំណើរការបន្ទាប់ពីដាក់បញ្ចូលកម្មវិធី

  - អនុវត្តស្គ្រីបចាក់សំរួលចុងក្រោយ
  - បន្តទោះបីស្គ្រីបបរាជ័យក៏ដោយ

### 2.4 កំណត់រចនាសម្ព័ន្ធសេវា (41-48)

This configures the application service you are deploying.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **បន្ទាត់ 42**: កំណត់សេវាមួយឈ្មោះ "api_and_frontend"
- **បន្ទាត់ 43**: បង្ហាញទៅកាន់ថត `./src` សម្រាប់កូដប្រភព
- **បន្ទាត់ 44**: បញ្ជាក់ថា Python ជាភាសាកម្មវិធី
- **បន្ទាត់ 45**: ប្រើ Azure Container Apps ជាវេទិកាអ្នកបម្រើ
- **បន្ទាត់ 46-48**: កំណត់រចនាសម្ព័ន្ធ Docker

      - ប្រើ "api_and_frontend" ជាឈ្មោះរូបភាព
      - សាងសង់រូបភាព Docker ឆ្ងាយនៅលើ Azure (មិននៅក្នុងកុំព្យូទ័រមូលដ្ឋាន)

### 2.5 អថេរសម្រាប់ Pipeline (49-76)

These are variables to help you run `azd` in CI/CD pipelines for automation

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

ផ្នែកនេះកំណត់អថេរសម្រាប់បរិស្ថានដែលប្រើ **ក្នុងអំឡុងពេលដាក់បញ្ចូល**, ដាក់តម្រៀបដោយប្រភេទៈ

- **ឈ្មោះធនធាន Azure (បន្ទាត់ 51-60)**:
      - ឈ្មោះធនធានសេវាកម្ម Azure សំខាន់ៗ ឧទាហរណ៍ Resource Group, AI Hub, AI Project, ល។

- **ស្លាកមុខងារ (Feature Flags) (បន្ទាត់ 61-63)**:
      - អថេរបែប boolean ដើម្បីបើក/បិទសេវាកម្ម Azure ជាក់លាក់

- **ការកំណត់រចនាសម្ព័ន្ធភ្នាក់ងារ AI (បន្ទាត់ 64-71)**:
      - ការកំណត់សម្រាប់ភ្នាក់ងារសំខាន់រួមទាំងឈ្មោះ, ID, កំណត់ដាក់បញ្ចូល, ព័ត៌មានម៉ូឌែល

- **ការកំណត់រចនាសម្ព័ន្ធ embedding AI (បន្ទាត់ 72-79)**:
      - ការកំណត់សម្រាប់ម៉ូឌែល embedding ដែលប្រើសម្រាប់ការស្វែងរកវ៉ិចទ័រ

- **ស្វែងរក និងត្រួតពិនិត្យ (បន្ទាត់ 80-84)**:
      - ឈ្មោះសន្ទស្សន៍ស្វែងរក, អត្តសញ្ញាណធនធានដែលមានរួច, និងការកំណត់សម្រាប់ត្រួតពិនិត្យ/តាមដាន

---

## 3. ស្គាល់អថេរសម្រាប់បរិស្ថាន
អថេរបរិស្ថានខាងក្រោមគ្រប់គ្រងការកំណត់រចនាសម្ព័ន្ធ និងអាកប្បកិរិយារៃការដាក់បញ្ចូលរបស់អ្នក ដែលត្រូវបានរៀបចំតាមគោលបំណងសំខាន់របស់ពួកវា។ អថេរច្រើនមានតម្លៃលំនាំដែលសមសម្រាប់ការប្រើ ប៉ុន្តែអ្នកអាចប្ដូរឲ្យសមទៅតាមតម្រូវការរបស់អ្នក ឬធនធាន Azure ដែលមានរួច។

### 3.1 អថេរត្រូវការ 

```bash title="" linenums="0"
# ការកំណត់មូលដ្ឋាន Azure
AZURE_ENV_NAME                    # ឈ្មោះបរិយាកាស (គេប្រើសម្រាប់ការកំណត់ឈ្មោះធនធាន)
AZURE_LOCATION                    # តំបន់បង្ហោះ
AZURE_SUBSCRIPTION_ID             # ការជាវគោលដៅ
AZURE_RESOURCE_GROUP              # ឈ្មោះក្រុមធនធាន
AZURE_PRINCIPAL_ID                # អត្តសញ្ញាណអ្នកប្រើសម្រាប់ RBAC

# ឈ្មោះធនធាន (បង្កើតដោយស្វ័យប្រវត្តិ ប្រសិនបើមិនបានបញ្ជាក់)
AZURE_AIHUB_NAME                  # ឈ្មោះហាប់ Microsoft Foundry
AZURE_AIPROJECT_NAME              # ឈ្មោះគម្រោង AI
AZURE_AISERVICES_NAME             # ឈ្មោះគណនីសេវាកម្ម AI
AZURE_STORAGE_ACCOUNT_NAME        # ឈ្មោះគណនីផ្ទុក
AZURE_CONTAINER_REGISTRY_NAME     # ឈ្មោះចុះបញ្ជីកុងតឺន័រ
AZURE_KEYVAULT_NAME               # ឈ្មោះឃ្លាំងកូនសោ (ប្រសិនបើប្រើ)
```

### 3.2 ការកំណត់ម៉ូឌែល 
```bash title="" linenums="0"
# ការកំណត់ម៉ូឌែលសម្រាប់ការជជែក
AZURE_AI_AGENT_MODEL_NAME         # លំនាំដើម: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # លំនាំដើម: OpenAI (ឬ Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # លំនាំដើម: ថ្មីបំផុតដែលអាចប្រើបាន
AZURE_AI_AGENT_DEPLOYMENT_NAME    # ឈ្មោះការដាក់ចេញសម្រាប់ម៉ូឌែលជជែក
AZURE_AI_AGENT_DEPLOYMENT_SKU     # លំនាំដើម: ស្តង់ដារ
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # លំនាំដើម: 80 (ពាន់ TPM)

# ការកំណត់ម៉ូឌែលអ៊ីមបេឌឌីង
AZURE_AI_EMBED_MODEL_NAME         # លំនាំដើម: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # លំនាំដើម: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # លំនាំដើម: ថ្មីបំផុតដែលអាចប្រើបាន
AZURE_AI_EMBED_DEPLOYMENT_NAME    # ឈ្មោះការដាក់ចេញសម្រាប់អ៊ីមបេឌឌីង
AZURE_AI_EMBED_DEPLOYMENT_SKU     # លំនាំដើម: ស្តង់ដារ
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # លំនាំដើម: 50 (ពាន់ TPM)

# ការកំណត់ភ្នាក់ងារ
AZURE_AI_AGENT_NAME               # ឈ្មោះបង្ហាញរបស់ភ្នាក់ងារ
AZURE_EXISTING_AGENT_ID           # ប្រើភ្នាក់ងារដែលមានរួច (ជាជម្រើស)
```

### 3.3 បិទ/បើកមុខងារ
```bash title="" linenums="0"
# សេវាជម្រើស
USE_APPLICATION_INSIGHTS         # លំនាំដើម: ពិត
USE_AZURE_AI_SEARCH_SERVICE      # លំនាំដើម: មិនពិត
USE_CONTAINER_REGISTRY           # លំនាំដើម: ពិត

# ការត្រួតពិនិត្យ និងការតាមដាន
ENABLE_AZURE_MONITOR_TRACING     # លំនាំដើម: មិនពិត
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # លំនាំដើម: មិនពិត

# ការកំណត់ស្វែងរក
AZURE_AI_SEARCH_INDEX_NAME       # ឈ្មោះសន្ទស្សន៍ស្វែងរក
AZURE_SEARCH_SERVICE_NAME        # ឈ្មោះសេវាស្វែងរក
```

### 3.4 ការកំណត់គម្រោង AI 
```bash title="" linenums="0"
# ប្រើធនធានដែលមានស្រាប់
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # អត្តសញ្ញាណធនធានពេញលេញនៃគម្រោង AI ដែលមានស្រាប់
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL ចុងផ្លូវនៃគម្រោងដែលមានស្រាប់
```

### 3.5 ពិនិត្យអថេររបស់អ្នក

ប្រើ Azure Developer CLI ដើម្បីមើល និងគ្រប់គ្រងអថេរសម្រាប់បរិស្ថានរបស់អ្នក:

```bash title="" linenums="0"
# បង្ហាញអថេរបរិយាកាសទាំងអស់សម្រាប់បរិយាកាសបច្ចុប្បន្ន
azd env get-values

# យកអថេរបរិយាកាសជាក់លាក់
azd env get-value AZURE_ENV_NAME

# កំណត់អថេរបរិយាកាសមួយ
azd env set AZURE_LOCATION eastus

# កំណត់អថេរច្រើនពីឯកសារ .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែដោយ AI [Co-op Translator](https://github.com/Azure/co-op-translator). ទោះយើងខិតខំសម្រាប់ភាពត្រឹមត្រូវ សូមយល់ថាការបកប្រែស្វ័យប្រវត្តិក៏អាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមនៅក្នុងភាសាដើមគួរត្រូវបានចាត់ទុកថាជាប្រភពដែលមានអាជ្ញាធរ។ សម្រាប់ព័ត៌មានសំខាន់ យើងសូមណែនាំឲ្យប្រើការបកប្រែដោយអ្នកជំនាញមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសណាមួយដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
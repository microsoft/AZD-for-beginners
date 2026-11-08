# កំណត់ហេតុការផ្លាស់ប្តូរ - AZD សម្រាប់អ្នកចាប់ផ្តើម

## ដំណើរណែនាំ

កំណត់ហេតុការផ្លាស់ប្តូរនេះបានកត់ត្រាទាំងអស់នៃការផ្លាស់ប្តូរដែលគួរឱ្យចាប់អារម្មណ៍ ការអាប់ដេត និងការកែលម្អទៅកាន់Repository AZD សម្រាប់អ្នកចាប់ផ្តើម។ យើងអនុវត្តតាមគោលការណ៍ semantic versioning ហើយរក្សាទុកកំណត់ហេតុនេះដើម្បីជួយអ្នកប្រើប្រាស់យល់ពីអ្វីដែលបានផ្លាស់ប្តូររវាងកំណែ។ 

## គោលបំណងការរៀន

តាមការត្រួតពិនិត្យកំណត់ហេតុនេះ អ្នកនឹង៖
- រក្សាទុកព័ត៌មានអំពីលក្ខណៈពិសេសថ្មី និងការបន្ថែមមាតិកា
- យល់ដឹងអំពីការកែលម្អដែលបានធ្វើលើឯកសារដែលមានរួច
- តាមដានការជួសជុលកំហុស និងការត្រួតពិនិត្យដើម្បីធានាថាត្រឹមត្រូវ
- តាមដានការវិវត្តនៃសម្ភារៈរៀនតាមពេលវេលា

## លទ្ធផលការរៀន

បន្ទាប់ពីពិនិត្យមើលកំណត់ហេតុការផ្លាស់ប្តូរ អ្នកនឹងអាច：
- កំណត់មាតិកានិងធនធានថ្មីដែលមានសម្រាប់ការរៀន
- យល់ដឹងពីផ្នែកណាដែលត្រូវបានអាប់ដេតឬកែលម្អ
- គ្រោងផែនការរៀនរបស់អ្នកដោយផ្អែកលើសម្ភារៈថ្មីចុងក្រោយ
- ឆ្លើយតបនិងផ្តល់យោបល់សម្រាប់ការកែលម្អនៅរូបថ្ងៃខាងមុខ

## ប្រវត្តិកំណែ

### [v3.24.0]- ២០២៦-១១-០៤

#### បានកែលម្អ
- ជួសជុលការរុករកវគ្គអង់គ្លេស ផ្លូវទំព័រផ្លាស់ទី ចំណុចចុចខ្វះ និងយោងខាងក្រៅមិនប្រើប្រាស់រួចមួយរួមមានតំណភ្ជាប់វគ្គទី ២ ទៅមគ្គុទេសក៍ AI ផលិតកម្ម។
- ពិនិត្យវិញការណែនាំបច្ចុប្បន្នទៅនឹង AZD 1.37.2, agents 1.0.0-beta.23 និងការវាយតម្លៃ 1.0.0-beta.2។ បានកត់ត្រាពីវីថ្វ័រ `azd ai eval` ដាច់ដោយឡែក និងការផ្លាស់ទីការកំណត់ប្រសើរឡើង។
- កែលម្អទង់យោង CLI ដែលមិនគាំទ្រ វិសាលភាពសមត្ថភាពផ្ទៀងផ្ទាត់, ការណែនាំបរិយាកាស/សម្ងាត់ plaintext, ការអាប់ដេតរំពងម្រោង, ការកំណត់ម៉ូដែល និងឧទាហរណ៍ស្តារឡើងវិញដែលបំផ្លាញ។
- ទើបចាប់ផ្តើមសិក្ខាសាលា ជាមួយនឹងគំរូ AI Agents បច្ចុប្បន្ន រួមមាន hooks ជាក់ស្តែង, ជំហានកំណត់ការចូល, ការវាយតម្លៃតេស្ត, ទីតាំងចូល red-teaming, និងការត្រួតពិនិត្យអំពី observability។
- កែប្រែអះអាងអនុវត្តន៍គំរូ និងជួសជុលបញ្ហាអំឡុងពេលអនុវត្តពាក់ព័ន្ធអនុវត្តន៍/រំពង/កំណត់។ សម្ភារៈរចនាសម្ព័ន្ធលក់រាយត្រូវបានបង្ហាញច្បាស់ពីកម្មវិធីដំណើរការស្របពេញលេញ។
- ដំណើរការ Matrix ភាសា CodeQL, ជ្រើស Node.js 24 ដែលគាំទ្រសម្រាប់ dev container ហើយធ្វើឲ្យអ្នកត្រួតពិនិត្យការតម្លើងរាយការណ៍បញ្ជាកំណែបរាជ័យ។

#### បន្ថែម
- ឧបករណ៍ចូលមើលតំណភ្ជាប់/និមិត្តសញ្ញាអនឡាញ(offline) ជាភាសាអង់គ្លេសតែម្ដង, ការធ្វើតេស្តបង្វិលក្រោយ, និងវីថ្វ័រការដ្ឋានឯកសារដែលក៏កសាងសិក្ខាសាលានៅល režីមតឹងតែង។ មិនរួមបញ្ចូលការបកប្រែផលិត និងរូបភាពបានបកប្រែ។

#### វាលការត្រួតពិនិត្យ
- ការត្រួតពិនិត្យប្រភព, សន្ទស្សន៍ស៊ីនធាក់ទិច, ការកំណត់, អាកប្បកិរិយាល្បះ, និងការត្រួតពិនិត្យតំណភ្ជាប់បណ្តាញ មិនបង្កើតភាពអាចដាក់ចូលផ្ទាល់លើ Azure, កម្មវិធី quota, RBAC, ប្រើបានម៉ូដែលតំបន់, ការគិតពន្ធ, គោលការណ៍សុវត្ថិភាព ឬភាពរួចរលីតក្នុងផលិតកម្មឡើយ។
- របាយការណ៍ចាស់ខាងក្រោមគឺជាថតសំគាល់ប្រវត្តិសាស្ត្រ មិនមែនជាពាក្យបញ្ជាឬការណែនាំចេញផ្សាយបច្ចុប្បន្នឡើយ។

### [v3.23.0] - ២០២៦-០៧-១៣

#### AZD 1.27.1 Refresh: ការអាប់ដេតកំណែថ្មី
**កំណែនេះបានធ្វើប្រតិបត្តិការវិញសិក្ខាសាលាជាមួយ `azd` `1.27.1` (កក្កដា ២០២៦, កំណែមានស្ថិរភាពចុងក្រោយ) និងផ្នែកបន្ថែមភ្នាក់ងារដំណើរការពីមុន `azure.ai.agents` `1.0.0-beta.5`, ធ្វើឲ្យបាណ័រចុងក្រោយ "validated against" មានភាពទាន់សម័យបន្ទាប់ពីការចេញផ្សាយ 1.26.0, 1.27.0 និង 1.27.1។**

#### បានផ្លាស់ប្តូរ
- **✅ អាប់ដេតរង្វង់វាយតម្លៃ** ពី `azd 1.25.6` (មិថុនា ២០២៦) ទៅ `azd 1.27.1` (កក្កដា ២០២៦) នៅរ៉ូត README, ឯកសារ README គ្រប់វគ្គ, វគ្គ ១ dev-container (រួមទាំងគំរូកំណែចាក់), វគ្គ ៤ តង់ប្លេតដាក់ផ្ទាល់ខ្លួន, វគ្គ ៥ មេឌ្យូលភ្នាក់ងារ និងឯកសារសិក្ខាសាលា
- **🤖 ម៉ោងកំណត់វគ្គ ២ ត្រូវបានធ្វើឱ្យទាន់សម័យ** ពី `azd 1.23.12` (មីនា ២០២៦) ទៅ `azd 1.27.1` នៅ `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` និង `microsoft-foundry-integration.md`; កាលបរិច្ឆេទចំណាំសុពលភាពបានកែធ្វើជាថ្ងៃទី ២០២៦-០៧-១៣
- **🧩 កំពស់ផ្នែកបន្ថែមភ្នាក់ងារ AI** ពី `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ទៅកំណែ `1.0.0-beta.5` បច្ចុប្បន្ននៅវគ្គ ២ README និង `agents.md`
- **🧪 ឧទាហរណ៍ត្រួតពិនិត្យសិក្ខាសាលា** (`azd version` បញ្ចេញ) បានធ្វើឲ្យទាន់សម័យជា `1.27.1`

#### កំណត់សំគាល់ពីការចេញផ្សាយ azd (1.26.0 → 1.27.1)
- **1.26.0 (២០២៦-០៦-២៤):** គាំទ្រការចាប់ផ្តើម Azure Functions លើFlex Consumption, `azd config sub-filter` ការស្វែងរកការជាវប្រើប្រាស់តាមមូលដ្ឋាន per-tenant, បណ្ដុំបន្ថែមតែមួយដែលអាចដំណើរការបានដោយខ្លួនឯង (`azd x pack --bundle`), និង `azd tool install azure-skills`
- **1.27.0 (២០២៦-០៦-៣០):** គំរោង/ភ្នាក់ងារម៉ូឌែល Azure AI Foundry ដំណើរការតាម `azure.yaml` (មិនប្រើ Bicep/Terraform នៅដំណើរការ), គាំទ្រការចេញផ្សាយ container សម្រាប់ App Service (`host: appservice` + `language: docker`), បញ្ជាផ្ទាល់ `-s/--source` សម្រាប់ `azd extension` និង `azd tool uninstall`
- **1.27.1 (២០២៦-០៧-០៩):** ខ្សែ `--no-dependencies` សម្រាប់ `azd extension install`, ម៉ូដែលដែលមិនគាំទ្របានដកចេញពីការជូនដំណឹងក្នុងបញ្ជី/quota ដោយជាការស្វ័យប្រវត្តិ និងការកែលម្អកំហុសជាច្រើន

#### ឯកសារត្រូវបានអាប់ដេត
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - ២០២៦-០៦-១៦

#### ជំហានបន្លំសម្រាប់អ្នកចាប់ផ្តើម #2: ការបង្កើតគំរូ, dev containers, Pulumi, Azure DevOps, service principals, និងផ្សេងទៀត
**កំណែនេះបិទចន្លោះកម្រិតមធ្យមដែលនៅសល់តាមការវិភាគ azd-coverage: របៀបបង្កើតនិងផ្សព្វផ្សាយគំរូផ្ទាល់ខ្លួន, បរិយាកាស dev-container/Codespaces ដែលអាចធ្វើឡើងម្ដងទៀត, អ្នកផ្គត់ផ្គង់ឧស្សាហកម្ម Pulumi, ដំណើរការគ្រប់គ្រងសមត្ថភាព Azure DevOps CI/CD, ការផ្ទៀងផ្ទាត់ service-principal, ការណែនាំការជ្រើសរើសម៉ាស៊ីន (AKS/Spring Apps), ការពន្យល់ `azd restore`/`azd package`, ការគ្រប់គ្រងកំហុស hook, និងការប្រតិបត្តិការជាក្រុម/បរិយាកាសរាប់ចែក។**

#### បន្ថែម
- **🧱 មេរៀនជំពូកថ្មី 4** `docs/chapter-04-infrastructure/custom-templates.md` — ការសរសេរគំរូ azd របស់អ្នកឯង៖ រចនាសម្ព័ន្ធដែលត្រូវការ (`azure.yaml`, `infra/`, `src/`), វាល `metadata.template`, ការផ្ទុកប៉ារ៉ាម៉ែត្ររចនាសម្ព័ន្ធជាមួយនឹងស្លាកធនធាន `uniqueString()` និង `azd-env-name`, ការធ្វើតេស្តក្នុងស្រុកជាមួយ `azd init --template <local-path>`, ការបោះពុម្ពផ្សាយទៅ GitHub, និងការដាក់បញ្ចូនទៅក្នុងផ្ដល់រោងចក្រអស្កែម AZD
- **📦 មេរៀនជំពូកថ្មី 1** `docs/chapter-01-foundation/dev-containers.md` — បរិយាកាស azd ដែលអាចផលិតឡើងវិញបានជាមួយ Dev Containers និង GitHub Codespaces៖ ឧបករណ៍តិចតួច `.devcontainer/devcontainer.json` ប្រើលក្ខណៈពិសេសផ្លូវការរបស់ `ghcr.io/azure/azure-dev/azd`, លក្ខណៈពិសេសសម្រាប់ភាសា, `docker-in-docker` សម្រាប់ម៉ាស៊ីនបម្រើ container, និង `azd auth login --use-device-code` សម្រាប់ការចូលឆ្ងាយ
- **🧩 Pulumi ជាមួយ azd** ផ្នែកនៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, រៀបចំថត Pulumi, ស្ដាក់ដែលត្រូវផ្គូផ្គងនឹងបរិយាកាស azd, លទ្ធផល/ការដាក់ស្លាកដែលត្រូវការ, និងរៀបចំដដែល `azd up` / `azd down`
- **🎯 ណែនាំជ្រើសរើសម៉ាស៊ីនបម្រើ** នៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — ការប្រៀបធៀបទាំងសម្រួលសម្រាប់អ្នកចាប់ផ្តើមរវាង `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, និង `springapp`, ជាមួយនឹងការណែនាំពីពេលណាត្រូវជ្រើស AKS ឬ Azure Spring Apps
- **🛠️ ជំហានចូលរួម Azure DevOps CI/CD** នៅក្នុង `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, ការតភ្ជាប់សេវាកម្មជាមួយនឹងភាពសាមញ្ញ Workload identity federation (OIDC), ផលិតផល `azure-dev.yml`, និងការកំណត់ក្រុមវ៉ារីប៊ែល
- **🔑 Service Principals (បង្ហាញទី 4)** ត្រូវបានបន្ថែមទៅ `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ការចូលប្រើដោយគ្មានអន្តរកម្ម `azd auth login` ជាមួយថាសអតិថិជនទ្រព្យសម្បត្តិប្រាក់កម្ចី ស្របតាមអត្តសញ្ញាណ​ដំណើរការរួម / OIDC, ពេលណាត្រូវប្រើ, និងការផ្ទុកសម្ងាត់យ៉ាងសុវត្ថិភាព
- **🪝 ការដោះស្រាយកំហុស Hook** ផ្នែករងនៅក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — កូដចេញនិង `set -e`, `continueOnError`, ការធ្វើតេស្ត hook ដាច់ដោយឡែកជាមួយ `azd hooks run`, អង្គ្គប្រព័ន្ធដំណើរការ OS ផ្ទាល់ខ្លួន, និង `--debug`
- **👥 ក្រុម / បរិយាកាសដែលចែករំលែក** ផ្នែកនៅក្នុង `docs/chapter-03-configuration/configuration.md` — អ្វីដែលរស់នៅក្នុង `.azure/`, អ្វី​ដែល​ត្រូវ​បាន gitignore, បរិយាកាសជាមួយអ្នកអwickា​ន៏និ​ចិត្ត, `azd env list`/`select`, និងការផ្តល់តម្លៃបរិយាកាសនៅក្នុង CI/CD
- **🧰 `azd restore` និងពន្យារពណ៌នាពង្រីក `azd package`** នៅក្នុង `resources/cheat-sheet.md` — ការស្ដារឡើងវិញប្រភពទិន្នន័យនិងសាងសង់ឯកសារដែលអាចផ្សព្វផ្សាយបានដោយគ្មានការផ្សាយ

#### បានផ្លាស់ប្ដូរ
- **🧭 តារាងមេរៀនជំពូក 4** បានធ្វើឱ្យទាន់សម័យរួមបញ្ចូលមេរៀនថ្មី "ការសរសេរគំរូរបស់អ្នកឯង" (មេរៀនទី 3)
- **🧭 តារាងមេរៀនជំពូក 1** បានធ្វើឱ្យទាន់សម័យរួមបញ្ចូលមេរៀនថ្មី "Dev Containers និង Codespaces" (មេរៀនទី 5); ជើងទង្កិចទិសដៅភ្ជាប់រវាង `bring-your-own-app.md` និង `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### ចន្លោះសម្រាប់អ្នកចាប់ផ្តើម: មេរៀនប្រដាប់ដៃមេឆែកភាគីច្រើន "នាំយកកម្មវិធីរបស់អ្នកឯង," Terraform និងជំហានចូលរួម CI/CD
**កំណែនេះបិទចន្លោះធំៗសំរាប់មគ្គុទេសក៍អ្នកចាប់ផ្តើមដោយបន្ថែមមេរៀនដៃច្រើនពីរថ្មីមួយ (ជំហានដំណើរការភាគីច្រើនអាចផ្សព្វផ្សាយ និងបន្ថែម azd ទៅកម្មវិធីដែលមានរួច), ការណែនាំខ្សែភ្ជាប់ hook សម្រាប់អ្នកថ្មី, ផ្នែក Terraform ជាមួយ azd, ជំហានដំណើរការ GitHub Actions อย่างលំអិត, អ្នកពន្យល់អំពីកំណែបន្ថែមមើលមុនថ្មី, និងបញ្ជីត្រួតពិនិត្យផ្ទៀងផ្ទាត់ការផ្សព្វផ្សាយយ៉ាងច្បាស់។**

#### ត្រូវបានបន្ថែម
- **🤝 មេរៀនជំពូក 5 ថ្មី** `docs/chapter-05-multi-agent/multi-agent-basics.md` — ជំហានដៃពេញលេញ អាចផ្សព្វផ្សាយ​បានពីភាគីពីរ (អ្នករៀបចំ + អ្នកជំនាញ) ប្រើគំរូពិត (`contoso-creative-writer`), គ្រប់គ្រងពេលណាត្រូវប្រើ multi-agent, ការងារប្រព័ន្ធ `azd up`, ការយល់ដឹងធនធានដែលបានបង្ហោះ, ការតាមដានតាមអ្នកចែកចាយ, ការផ្ទាល់ចិត្ត, និងការសំអាត
- **📦 មេរៀនជំពូក 1 ថ្មី** `docs/chapter-01-foundation/bring-your-own-app.md` — របៀបបន្ថែម azd ទៅគម្រោងដែលមានរួចជាមួយ `azd init` ("ប្រើកូដក្នុងថតបច្ចុប្បន្ន"), ការយល់ដឹងពី `azure.yaml` និង `infra/`, `azd infra generate`, ការស្វែងរកម៉ាស៊ីនបម្រើ, និងការបង្ហោះជាមួយ `azd up`
- **🌐 Terraform ជាមួយ azd** ផ្នែកត្រូវបានបន្ថែមទៅ `docs/chapter-04-infrastructure/provisioning.md` — កំណត់រចនាសម្ព័ន្ធ `infra.provider: terraform`, រៀបចំថត `.tf`, លទ្ធផល `AZURE_*` គឺត្រូវការ និងការដាក់ស្លាក `azd-env-name`, និងរៀបចំដដែល `azd up` / `azd down` (បិទចន្លោះដែលពាក្យគាំទ្របានចោលប៉ុន្តែតែបង្ហាញ Bicep ពេញលេញ)
- **⚙️ ដំណើរការយ៉ាងជំហ៊ាន GitHub Actions** ក្នុង `docs/chapter-08-production/production-ai-practices.md` — ពី GitHub repo ទៅការដាក់ចេញដោយស្វ័យប្រវត្តិ: `azd pipeline config`, OIDC federated credentials (គ្មានសម្ងាត់រក្សាទុក), `azure-dev.yml` បានបង្កើត, និងការណែនាំ secrets-vs-variables
- **🪝 ពិពណ៌នាអ្នកចាប់ផ្តើម "ថ្មីចំពោះ hooks?"** ក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — hook ជាអ្វី, តារាងជំហាន hook, hook ទស្នាក់ទីមួយតិចតួច, និងការរត់ hooks ដោយដៃជាមួយ `azd hooks run`
- **✅ បញ្ជីពិនិត្យ "ធ្វើតេស្តការដាក់ចេញរបស់អ្នក"** បន្ថែមទៅជំហ៊ាន 5 នៃ `docs/chapter-01-foundation/first-project.md` — ការតេស្តឥតគិតថ្លៃ, ការត្រួតពិនិត្យ health-endpoint, និងលក្ខណៈជោគជ័យច្បាស់លាស់
- **🧩 ពន្យល់អំពីការពង្រីកមុនថ្មីៗ** `azure.ai.skills` និង `azure.ai.connections` (អ្វីដែលពួកវា និងពេលណាមួយដែលគួរចូលរួមប្រើ) ក្នុង `docs/chapter-08-production/production-ai-practices.md`

#### បានផ្លាស់ប្តូរ
- **🧭 តារាងមេរៀនជំពូក 5** ពិនិត្យឡើងវិញ៖ `multi-agent-basics.md` ឥឡូវនេះគឺជាមេរៀនទី 1 (មេរៀនមួយតែហ្នឹងដែលមានការអនុវត្តពេញលេញ), ជាមួយនឹងការស្លាកធ្វើបច្ចុប្បន្នដែលមេរៀនទី 2 ស្ថិតនៅជំពូក 6 និងសេណារីយ៉ូ Retail គឺជាគំនូសស្ថាបត្យកម្មមួយ មិនមែនជាតម្រូវការ​មួយពាក្យបញ្ជា
- **🧭 តារាងមេរៀនជំពូក 1** រាប់បញ្ចូលមេរៀន "យកកម្មវិធីរបស់អ្នកមក" ថ្មី (មេរៀនទី 4)
- **🔗 ជើងទំព័រប្រមុខងារ** បានផ្សព្វផ្សាយ: `first-project.md` ឥឡូវភ្ជាប់ទៅ `bring-your-own-app.md`

#### បានកែ
- **🧱 បិទចន្លោះ Terraform "បានទាមទារពីមុនប៉ុន្តែមិនដាក់បង្ហាញ"** — មុខវិជ្ជាពីមុនបានរាប់អានគាំទ្រដល់ Terraform ប៉ុន្តែមិនបង្ហាញវា
- **🔀 កែរលីងឆ្លរឆ្លើយជំពូក 5 មិនត្រឹមត្រូវ** ដែលបង្ហាញថាមានការអនុវត្ត multi-agent ពេញលេញ ខណៈដែលវាជាគំនូសស្ថាបត្យកម្មតែប៉ុណ្ណោះ

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(ថ្មី)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(ថ្មី)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 បានធ្វើបច្ចុប្បន្នភាព, ពាក្យបញ្ជា អរុបទៅដល់ជីវិត Agent ពេញលេញ និង Aspire Rebrand
**កំណែនេះបានធ្វើការត្រួតពិនិត្យឡើងវិញនូវវគ្គប្រឡងជាមួយ `azd` `1.25.6` (ខែមិថុនា 2026) និងការដំណើរការបន្ថែម `azure.ai.agents` `0.1.40-preview`, ពង្រីកការណែនាំ AI ចេញពី "បង្កើត agent" ទៅកាន់ជីវិត Agent ពេញលេញ (សាកល្បង → វាយតម្លៃ → អុបទីម៉ាយ → ស្ទើរ → លុប), បង្ហាញការពិនិត្យមើលពាក្យបន្ថែមថ្មី `azure.ai.skills` និង `azure.ai.connections` និងកំណត់សំគាល់អំពីការផ្លាស់ប្តូរឈ្មោះផលិតផល ".NET Aspire" ទៅជា "Aspire"។**

#### បានបន្ថែម
- **🔁 ការគ្របដណ្ដប់ជីវិត Agent ពេញលេញ** សម្រាប់អ្នកដំបូងហើយ និងវិស្វករបច្ចេកវិទ្យា AI ក្នុងឯកសារទាំងអស់៖
  - `docs/chapter-01-foundation/azd-basics.md` — តារាងជីវិត (បង្កើត → សាកល្បង → វាស់ → អុបទីម៉ាយ → ស្ទើរ → សម្អាត) បានបន្ថែមក្នុងផ្នែក Extensions និង AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — ផ្នែកថ្មី "ការគ្រប់គ្រងជីវិត Agent" គ្របដណ្តប់ `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
  - `resources/cheat-sheet.md` — ពាក្យបញ្ជា AI Agent បានពង្រីកជាមួយ `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
- **🧩 ឯកសារពីនូវពាក្យបន្ថែមថ្មី** ឯកសារ ៖ `azure.ai.skills` (ជំនាញ agent អាចប្រើឡើងវិញ) និង `azure.ai.connections` (ការតភ្ជាប់ Foundry) បានបន្ថែមទៅក្នុងតារាង extensions និង cheat sheet
- **⏱️ ការណែនាំពេលវេលាលើការឆ្លើយតប** — ឧទាហរណ៍ `azd ai agent invoke` ឥឡូវនេះបញ្ជាក់ខ្លួនបង្ហាញពេលវេលាសរុបនិងពេលវេលាទៅកាន់ Byte ផ្តើម
- **📌 ប្រ៊ាញបើនសម្រាប់កំណែ** នៅ README មកពីផ្ទាល់ដំបូង ដែលបង្រៀនអ្នករៀនទៅកាន់ `azd version` និង `azd upgrade`

#### បានផ្លាស់ប្តូរ
- **✅ ឯកសារត្រួតពិនិត្យបានធ្វើបច្ចុប្បន្នភាព** ពី `azd 1.23.12` (មីនា 2026) ទៅ `azd 1.25.6` (មិថុនា 2026) នៅក្នុង README អាល់រាល់ជំពូក និងឯកសារ rejoindre
- **🤖 កំណត់សម្គាល់ពាក្យបន្ថែមជំពូក 2** បានធ្វើបច្ចុប្បន្នភាព ពី `azure.ai.agents` `0.1.18-preview` ទៅ `0.1.40-preview`
- **🧪 ឧទាហរណ៍បញ្ចាក់រកកំហុសសិក្ខាសាលា** (`azd version` output) បានធ្វើបច្ចុប្បន្នភាពទៅ `1.25.6`
- **🧭 README "What's New in azd Today"** បានធ្វើបច្ចុប្បន្នភាពសម្រាប់បង្កើតជីវិត agent ពេញលេញ ពាក្យបន្ថែម AI ថ្មី និងការកែប្រែគុណភាពរស់ (`azd init` idempotency, `azd auth login` ការកម្ចាត់ token ប្រែមិន ប្រើ, `azd tool` ការណែនាំដំបូងដំណើរការ)
- **📖 agents.md ជំពូក 2 (ជម្រើស 4)** ឥឡូវនេះបង្រៀនអ្នករៀនឱ្យប្រើពាក្យបញ្ជាជីវិតក្រោយការដាក់បញ្ចូលជំនួយមិនបញ្ឈប់នៅ `azd up`

#### បានដោះស្រាយ
- **🏷️ ការដាក់ឈ្មោះផលិតផល** — បានបន្ថែមកំណត់សម្គាល់ Aspire rebrand (".NET Aspire" ឥឡូវគ្រាន់តែជា "Aspire"); azd គាំទ្រលើ Aspire មិនបានបម្លែងឡើយ
- **🔎 ការត្រួតពិនិត្យបញ្ចេញផ្សាយផ្តល់ជាស្រេច** ត្រូវបានបញ្ជាក់នៅលើ Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) និង `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### ការបញ្ជាក់សម្រាប់អ្នកដំបូង, ការត្រួតពិនិត្យការតំឡើង និងការសម្អាតពាក្យបញ្ជាថ្មី AZD
**កំណែនេះបន្តការស្ទង់មតិ validation AZD 1.23 ដោយផ្តោតសំខាន់លើឯកសារអ្នកដំបូង: វាបញ្ជាក់ការណែនាំតម្កល់ AZD ជាចម្បង, បន្ថែមស្គ្រីប validation ការតំឡើងក្នុងតំបន់, ពិនិត្យពាក្យបញ្ជារសម្រាប់ CLI AZD នៅក្នុងរូបមន្ត, ហើយលុបផ្តាច់ការអ្នកណាដែលបង្កើតពីអង់គ្លេសដែលអតីតមក។**

#### បានបន្ថែម
- **🧪 ស្គ្រីប validation ការតំឡើងសម្រាប់អ្នកដំបូង** ជាមួយ `validate-setup.ps1` និង `validate-setup.sh` ដើម្បីឱ្យអ្នករៀនអាចបញ្ជាក់ឧបករណ៍ចាំបាច់ មុនចាប់ផ្តើម ជំពូក 1
- **✅ ជំហាន validation ការតំឡើងជាមុន** នៅ README ដើម និង README ជំពូក 1 ដើម្បីចាប់ស្វែងរក prerequisites ខ្វះមុន `azd up`

#### បានផ្លាស់ប្តូរ
- **🔐 ការណែនាំ authentiction សម្រាប់អ្នកដំបូង** ឥឡូវនេះដំណើរការតែមួយប្រើ `azd auth login` ជាមធ្យោបាយសំខាន់សម្រាប់ workflow AZD, ដោយ `az login` ត្រូវបានហៅជា optional លុះត្រាថាមានការប្រើប្រាស់ពាក្យបញ្ជា Azure CLI ដោយផ្ទាល់
- **📚 វិលរក្សារនៅជំពូក 1** ឥឡូវនេះបង្ហាញអ្នករៀនឱ្យ validate ការតំឡើងក្នុងតំបន់ មុនការតំឡើង ការផ្ទៀងផ្ទាត់ទិន្នន័យ និង ជំហានដាក់បញ្ចូលដំណើរការ ដំបូង
- **🛠️ សារព័ត៌មាន Validator** ឥឡូវនេះបែងចែកច្បាស់រវាងតម្រូវការលក់ឈប់ និងការព្រមាន Azure CLI ជាជម្រើស សម្រាប់ផ្លូវ AZD ដែលមានតែអ្នកដំបូង
- **📖 កំណត់រចនាសម្ព័ន្ធ, ការដោះស្រាយបញ្ហា និងឯកសារឧទាហរណ៍** ឥឡូវនេះបំបែកច្បាស់រវាង authentication AZD ដែលចាំបាច់ និងការចូលសុទ្ធ Azure CLI ជាជម្រើស ដែលពីមុនទើបតែបង្ហាញគ្នាដោយគ្មានបរិបទ

#### បានដោះស្រាយ
- **📋 ការអាប់ដេតពាក្យបញ្ជាជាភាសាអង់គ្លេសនៅលើប្រភពអតីត** ទៅជាបែបរបស់ AZD បច្ចុប្បន្ន រួមមាន `azd config show` នៅ cheat sheet និង `azd monitor --overview` នៅកន្លែងដែលមានការណែនាំទស្សនាវិជ្ជាគ្រប់គ្រង Azure Portal
- **🧭 ការអះអាងរបស់អ្នកដំបូងនៅជំពូក 1** បានទន់ខ្សោយខ្លះ ដើម្បីចៀសវាងការជំរុញជាថ្មីថាបានធានាថាគ្មានកំហុស ឬ undo កើតឡើងលើគមHoʻសារទាំងអស់ និងធនធាន Azure ទាំងអស់
- **🔎 ការត្រួតពិនិត្យ CLI រស់** បានបញ្ជាក់ពីការគាំទ្របច្ចុប្បន្នសម្រាប់ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, និង `azd down --force --purge`

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 Validation, ការពង្រីកបរិយាកាសសិក្ខាសាលា និងបច្ចុប្បន្នភាពម៉ូឌែល AI
**កំណែនេះអនុវត្តស្ទង់មតិការត្រួតពិនិត្យឯកសារជាមួយ `azd` `1.23.12`, អាប់ដេតឧទាហរណ៍ពាក្យបញ្ជាពុំទាន់ទាន់សម័យ AZD, បច្ចុប្បន្នភាពការណែនាំម៉ូឌែល AI ទៅកាន់លំនាំដើមបច្ចុប្បន្ន និងពង្រីកការណែនាំសិក្ខាសាលាចេញពី GitHub Codespaces ទៅគាំទ្រទៅ container អភិវឌ្ឍស៊ីក្រំ និង clone ក្នុងតំបន់ផងដែរ។**

#### បានបន្ថែម
- **✅ កំណត់សម្គាល់ validation នៅជំពូកស្នូល និងឯកសារ join** ដើម្បីបង្ហាញលក្ខណៈ AZD baseline បានស្វែងរកសម្រាប់អ្នករៀនប្រើ CLI build ថ្មី ឬចាស់
- **⏱️ ការណែនាំពេលពន្យារដំណើរការ** សម្រាប់ការដាក់បញ្ចូលកម្មវិធី AI រយៈពេលវែង ដោយប្រើ `azd deploy --timeout 1800`
- **🔎 ជំហានពិនិត្យ extension** ជាមួយ `azd extension show azure.ai.agents` នៅឯកសារផ្លូវ AI workflow
- **🌐 ការណែនាំបរិយាកាសសិក្ខាសាលាប្រកបដោយទូលំទូលាយ** គ្របដណ្ដប់ GitHub Codespaces, container អភិវឌ្ឍ និង local clone ជាមួយ MkDocs

#### បានផ្លាស់ប្តូរ
- **📚 README ជំពូកដំបូង** ឥឡូវនេះសម្គាល់វាយតម្លៃតាម `azd 1.23.12` នៅជំពូកមូលដ្ឋាន, ការកំណត់រចនាសម្ព័ន្ធ, អាគារ, អ្នកច្រើន-agent, មុនដាក់, ដោះស្រាយបញ្ហា និងផ្នែកផលិតកម្ម
- **🛠️ ការអាប់ដេតពាក្យបញ្ជា AZD** ទៅជារូបមន្តបច្ចុប្បន្ន នៅក្នុងឯកសារៈ
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ឬ `azd env get-value(s)` អាស្រ័យលើបរិបទ
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` នៅកន្លែងមានការណែនាំ Application Insights
- **🧪 ឧទាហរណ៍ provision preview** បានធ្វើឱ្យសាមញ្ញទៅជាការប្រើប្រាស់បានសព្វថ្ងៃដូចជា `azd provision --preview` និង `azd provision --preview -e production`
- **🧭 លំហាត់បណ្ដុះបណ្ដាល** បានធ្វើបច្ចុប្បន្នភាពឲ្យអ្នករៀនអាចបញ្ចប់ការធ្វើលំហាត់នៅ Codespaces, container អភិវឌ ឬ local clone ភ្លាមៗ បើសិនជាមិនមែន Codespaces តែប៉ុណ្ណោះ
- **🔐 ការណែនាំ authentiction** ឥឡូវនេះចូលចិត្តប្រើ `azd auth login` សម្រាប់ workflow AZD, ជាជំរើស `az login` នៅពេលប្រើពាក្យបញ្ជា Azure CLI ដោយផ្ទាល់

#### បានដោះស្រាយ
- **🪟 ពាក្យបញ្ជាតំឡើង Windows** បានធ្វើអោយធម្មតាទៅកែសម្អាត`winget` ថ្ងៃបច្ចុប្បន្ន ក្នុងមគ្គុទ្ទេសក៍តំឡើង
- **🐧 ការណែនាំតំឡើង Linux** ត្រូវបានកែដើម្បីចៀសវាងការណែនាំគ្រប់គ្រងកញ្ចប់ distro-ចំរូងថ្លៃ `azd` ដែលមិនគាំទ្រ ហើយបញ្ចូនទៅការផ្សាយ asset នៅពេលសមរម្យ
- **📦 ឧទាហរណ៍ម៉ូឌែល AI** បានបច្ចុប្បន្នភាពពីលំនាំដើមចាស់ៗដូចជា `gpt-35-turbo` និង `text-embedding-ada-002` ទៅឧទាហរណ៍បច្ចុប្បន្នដូចជា `gpt-4.1-mini`, `gpt-4.1` និង `text-embedding-3-large`
- **📋 កូដតំណាងសម្រាប់ដាក់បញ្ចូល និងអភិវឌ្ឍ** ត្រូវបានកែសំរួលឲ្យប្រើបរិស្ថាននិងពាក្យបញ្ជាចុងក្រោយ ក្នុងកំណត់ហេតុ ស្គ្រីប និងផ្នែកដោះស្រាយបញ្ហា
- **⚙️ ការណែនាំ GitHub Actions** បានធ្វើបច្ចុប្បន្នភាព ពី `Azure/setup-azd@v1.0.0` ទៅ `Azure/setup-azd@v2`
- **🤖 ការណែនាំលើក MCP/Copilot consent** បានធ្វើបច្ចុប្បន្នភាព ពី `azd mcp consent` ទៅ `azd copilot consent list`

#### បានកែលម្អ
- **🧠 ការណែនាំជំពូក AI** ឥឡូវនេះពន្យល់ល្អជាងមុនអំពីជំលោះ preview-sensitive `azd ai`, ការចូលគណនី tenant-specific, ការប្រើប្រាស់ extension បច្ចុប្បន្ន, និង ការណែនាំដាក់ម៉ូឌែលថ្មីៗ
- **🧪 ការណែនាំសិក្ខាសាលា** ឥឡូវនេះប្រើឧទាហរណ៍កំណែថ្មីផងនិងភាសារអំណត់បរិយាកាសអោយច្បាស់សម្រាប់ដាក់ឡាប
- **📈 ឯកសារ ផលិតកម្ម និង ដោះស្រាយបញ្ហា** ឥឡូវនេះ លំដាប់បានល្អជាងមុនជាមួយការត្រួតពិនិត្យបច្ចុប្បន្ន, fallback model និងឧទាហរណ៍ថ្លៃ

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### ពាក្យបញ្ជា CLI AI AZD, ការត្រួតពិនិត្យមាតិកា និងការពង្រីកគំរូ
**កំណែនេះបានបន្ថែមការគ្របដណ្តប់ពាក្យបញ្ជា `azd ai`, `azd extension`, និង `azd mcp` មួយចំនួននៅក្នុងជំពូក AI ទាំងអស់, ជួសជុលតំណភ្ជាប់ខូច និងកូដចាស់ក្នុង agents.md, ផ្លាស់ប្ដូរ cheat sheet ហើយកែលម្អផ្នែក Example Templates ជាមួយការពិនិត្យអត្ថន័យ និងគំរូ AZD Azure AI ថ្មីៗ។**

#### បានបន្ថែម
- **🤖 គ្របដណ្តប់ CLI AI AZD** នៅក្នុង 7 ឯកសារ (មិនមែននៅតែជំពូក 8 តែម្ដង):
  - `docs/chapter-01-foundation/azd-basics.md` — ផ្នែកថ្មី "Extensions និង AI Commands" ណែនាំ `azd extension`, `azd ai agent init`, និង `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ជម្រើស 4: `azd ai agent init` ជាមួយតារាងប្រៀបធៀប (template ទល់នឹង manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ផ្នែក "AZD Extensions សម្រាប់ Foundry" និង "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start បង្ហាញពីផ្លូវការដាក់បញ្ចូលទាំងពីរ template និង manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ផ្នែក Deploy រួមបញ្ចូលជម្រើស `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ផ្នែក "AZD AI Extension Commands សម្រាប់ Diagnostics"
  - `resources/cheat-sheet.md` — ផ្នែកថ្មី "AI & Extensions Commands" មាន `azd extension`, `azd ai agent init`, `azd mcp`, និង `azd infra generate`
- **📦 គំរូ AZD AI ថ្មីៗ** នៅក្នុង `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — ការសន្ទនា RAG ដោយ .NET ជាមួយ Blazor WebAssembly, Semantic Kernel, និងគាំទ្រសំឡេង chat
  - **azure-search-openai-demo-java** — ការសន្ទនា RAG ជាមួយ Java ដោយប្រើ Langchain4J មានជម្រើសដាក់ ACA/AKS
  - **contoso-creative-writer** — កម្មវិធីសរសេរច្នៃប្រឌិត agent គាប់ច្រើន តាមរយៈ Azure AI Agent Service, Bing Grounding, និង Prompty
  - **serverless-chat-langchainjs** — RAG Serverless ដោយប្រើ Azure Functions + LangChain.js + Cosmos DB មានការគាំទ្រក្នុងការអភិវឌ្ឍ Ollama ក្នុងតំបន់
  - **chat-with-your-data-solution-accelerator** — ម៉ូទ័រសម្រាប់ល្បឿន RAG សម្រាប់សហគ្រាសជាមួយវេបសាយគ្រប់គ្រង, រួមបញ្ចូលជាមួយ Teams, និងជម្រើស PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — អនុគ្រោះ MCP ជាច្រើនជាមួយកម្មវិធីតំណាងយោងដែលមានម៉ាស៊ីនមេក្នុង .NET, Python, Java, និង TypeScript
  - **azd-ai-starter** — គំរូចាប់ផ្តើមដែលមានរាងកាយ Azure AI ទាបបំផុត
  - **🔗 តំណភ្ជាប់ផ្តល់ភាពអស្ចារ្យ AZD AI Gallery** — ឯកសារយោងទៅកាន់ [បណ្ណាល័យ awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (គំរូ ៨០+)

#### បានកែល
- **🔗 navigation agents.md**: តំណពីមុន/បន្ទាប់ឥឡូវត្រូវគ្នានឹងលំដាប់មេរៀនជាប់សៀវភៅភាគ ២ (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 តំណខូច​ក្នុង agents.md**: `production-ai-practices.md` ត្រូវបានកែតម្លៃជាបណ្ដោះអាសន្នទៅ `../chapter-08-production/production-ai-practices.md` (មានរហូតដល់ ៣ ដង)
- **📦 កូដ agents.md ដែលមិនប្រើប្រាស់**: ប្ដូរ `opencensus` ជា `azure-monitor-opentelemetry` បូកផ្សំជាមួយ OpenTelemetry SDK
- **🐛 API មិនត្រឹមត្រូវក្នុង agents.md**: ផ្លាស់ទី `max_tokens` ពី `create_agent()` ទៅ `create_run()` ដែលជាថ្នាក់ `max_completion_tokens`
- **🔢 ការរាប់ Token ក្នុង agents.md**: ប្ដូរ​ការ​គណនាឱ្យ​មាន​ច្បាស់លាស់ជាងការប៉ាន់ប្រមាណ `len//4` ជា `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: កែសេវាកម្មពី "Cognitive Search + App Service" ទៅ "Azure AI Search + Azure Container Apps" (ម៉ាស៊ីនម៉ៅបម្លែងបញ្ជា​លើកក្រោយ ខែតុលា ២០២៤)
- **contoso-chat**: កែសម្រួលការពិពណ៌នាឱ្យយោងទៅ Azure AI Foundry + Prompty, ឲ្យត្រូវគ្នានឹងចំណងជើង និងបច្ចេកវិទ្យាផ្លូវការរបស់ repo

#### បានលុប
- **ai-document-processing**: លុបតំណគំរូដែលមិនអាចប្រើបាន (repo មិនអាចចូលប្រើជាសាធារណៈសម្រាប់ AZD)

#### បានធ្វើឲ្យប្រសើរ
- **📝 ការហាត់ប្រាណ​នៅក្នុង agents.md**: ហាត់ប្រាណទី 1 បង្ហាញលទ្ធផលដែលរំពឹងទុក និងជំហាន `azd monitor`; ហាត់ប្រាណទី 2 រួមបញ្ចូលកូដចុះបញ្ជី `FunctionTool` ពេញលេញ; ហាត់ប្រាណទី 3 ប្ដូរប្រដៅមិនច្បាស់អារម្មណ៍ជាការបញ្ជា `prepdocs.py` ជាក់ស្តែង
- **📚 ឯកសារយោងក្នុង agents.md**: កែប្រែតំណឯកសារដើម្បីផ្លាស់ប្តូរទៅឯកសារបច្ចុប្បន្នអំពី Azure AI Agent Service និងបណ្តើរ​ង់​ចាប់ផ្តើម​យ៉ាង​ងាយ
- **📋 តារាងជំហានបន្ទាប់​ក្នុង agents.md**: បន្ថែមតំណ AI Workshop Lab សម្រាប់គ្របដណ្តប់ជាសាច់រឿងពេញលេញ

#### ឯកសារបានធ្វើបច្ចុប្បន្នភាព
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### ការកែលម្អការរុករកមេរៀន
**កំណែនេះបានធ្វើឲ្យកាន់តែប្រសើរ README.md ក្នុងការរុករកជំពូកជាមួយទ្រង់ទ្រាយតារាងកាន់តែប្រសើរ។**

#### បានផ្លាស់ប្តូរ
- **តារាងផែនទីវគ្គ**: កែលម្អដោយមានតំណភ្ជាប់ឥតវាំងវរ, ប៉ាន់ប្រមាណរយៈពេល និងការវាយតម្លៃសំខាន់
- **ការលុបផ្ទុកថត**: លុបថតចាស់ៗមិនចាំបាច់ (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **ការត្រួតពិនិត្យតំណភ្ជាប់**: ពិនិត្យតំណទាំង 21+ ក្នុងតារាងផែនទីវគ្គឲ្យត្រឹមត្រូវ

### [v3.16.0] - 2026-02-05

#### ការអាប់ដើតឈ្មោះផលិតផល
**កំណែនេះធ្វើឲ្យឈ្មោះផលិតផលត្រូវតែទាន់សម័យនឹងម៉ាក Microsoft ។**

#### បានផ្លាស់ប្តូរ
- **Microsoft Foundry → Microsoft Foundry**: ការយោងទាំងអស់បានធ្វើឲ្យទាន់សម័យនៅក្នុងឯកសារមិនត្រូវបកប្រែ
- **Azure AI Agent Service → Foundry Agents**: ឈ្មោះសេវាកម្មបានប្ដូរដើម្បីបង្ហាញម៉ាកថ្មី

#### ឯកសារបានធ្វើបច្ចុប្បន្នភាព
- `README.md` - ទំព័រចុះចាប់វគ្គចម្បង
- `changelog.md` - ប្រវត្តិការផ្លាស់ប្តូរ
- `course-outline.md` - រចនាសម្ព័ន្ធវគ្គ
- `docs/chapter-02-ai-development/agents.md` - មន្រ្តី AI
- `examples/README.md` - ឯកសារឧទាហរណ៍
- `workshop/README.md` - ទំព័រចុះចាប់វគ្គហ្គេរ
- `workshop/docs/index.md` - ឯកសារជូនម៉ោងហ្គេរ
- `workshop/docs/instructions/*.md` - ឯកសារណែនាំហ្គេរ

---

### [v3.15.0] - 2026-02-05

#### ការរៀបចំបណ្ណាល័យ យោងទៅតាមជំពូក៖ ឈ្មោះថតដោយជំពូក
**កំណែនេះរៀបចំឯកសារបណ្ណាល័យទៅក្នុងថតរបស់ជំពូកដើម្បីធ្វើឲ្យការរុករកកាន់តែច្បាស់លាស់។**

#### ការប្ដូរឈ្មោះថត
ថតចាស់ៗត្រូវបានប្ដូរជាថតគិតលេខជំពូក៖
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- เพิ่มថតថ្មី ៖ `docs/chapter-05-multi-agent/`

#### ការផ្ទេរកូដឯកសារ
| ឯកសារ | ចេញពី | ទៅកាន់ |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| ឯកសារទាំងអស់របស់ pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| ឯកសារទាំងអស់របស់ troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### បានបន្ថែម
- **📚 ឯកសារ README ជំពូក**: បង្កើត README.md ក្នុងថតជំពូកនីមួយៗជាមួយ៖
  - គោលបំណងសិក្សានិងរយៈពេល
  - តារាងមេរៀនជាមួយការពិពណ៌នា
  - អធិប្បាយលឿនឆាប់
  - ការរុករកទៅជំពូកផ្សេងៗ

#### បានផ្លាស់ប្តូរ
- **🔗 កែតំណបណ្ដាញផ្ទៃក្នុងទាំងអស់**: ប្ដូរ ៧៨+ ថ្នល់នៅក្នុងឯកសារគ្រប់របស់ឯកសារសិក្សា
- **🗺️ README.md កំពូលវគ្គ**: កែតម្រូវផែនទីវគ្គជាមួយរចនាសម្ព័ន្ធជំពូកថ្មី
- **📝 examples/README.md**: ចេញពីការយោងផ្ទៃក្នុងទៅឯកសារ​ថត​ជំពូក

#### បានលុប
- រចនាសម្ព័ន្ធថតចាស់ៗ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ការរៀបចំបណ្ណាល័យ៖ ការរុករកជំពូក
**កំណែនេះបានបន្ថែមឯកសារ README រុករកជំពូក (បន្ទាប់ពីមកបានជំនួសដោយ v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### ដំណើរការមន្រ្ដី AI ថ្មី
**កំណែនេះបន្ថែមមន្រ្ដីដែលមានមគ្គុទេសក៍សម្រួលសម្រាប់ការចេញផ្សាយ AI agents ជាមួយ Azure Developer CLI។**

#### បានបន្ថែម
- **🤖 docs/microsoft-foundry/agents.md**: មគ្គុទេសក៍ពេញលេញគ្រប់គ្រង៖
  - មន្រ្តី AI ជាអ្វី និងច្បាប់បញ្ចាក់ពី chatbot
  - គំរូ agents ផ្តើមលឿន ៣ គំរូ (Foundry Agents, Prompty, RAG)
  - គំនូសស្ថាបត្យកម្មមន្រ្តី (មន្រ្តីតែម្នាក់, RAG, multi-agent)
  - ការកំណត់ការក្លាយជា & ការប្ដូរតម្លៃឧបករណ៍
  - ការត្រួតពិនិត្យ និងតាមដានវិសាលភាព
  - ការពិចារណាលើការចំណាយ និងការបង្កើនប្រសិទ្ធភាព
  - សេណារីយ៉ូក្បាលការលំបាកទូទៅ
  - ការហាត់ប្រាណដៃ ៣ ដែលមានលក្ខណ្ឌជោគជ័យ

#### រចនាសម្ព័ន្ធមាតិកា
- **ការណែនាំ**: មូលដ្ឋានមន្រ្តីសម្រាប់អ្នកចាប់ផ្តើម
- **ចាប់ផ្តើមឡើងយ៉ាងរហ័ស**: ចេញផ្សាយមន្រ្តីជាមួយ `azd init --template get-started-with-ai-agents`
- **គំរូស្ថាបត្យកម្ម**: គំនូសពណ៌នាអំពីគំរូមន្រ្តី
- **ការកំណត់បរិស្ថាន**: ការកំណត់ឧបករណ៍ និងអថេរបរិស្ថាន
- **ការត្រួតពិនិត្យ**: រួមបញ្ចូល Application Insights
- **ការហាត់ប្រាណ**: ការសិក្សាដោយដៃណាមួយជាបន្តបន្ទាប់ (២០-៤៥ នាទីមួយ)

---

### [v3.12.0] - 2026-02-05

#### DevContainer បច្ចុប្បន្នភាពបរិស្ថាន
**កំណែនេះអាប់ដែតផ្នែកកំណត់រចនាសម្ព័ន្ធ DevContainer ជាមួយឧបករណ៍ទំនើប និងការកំណត់លំនាំដើមកាន់តែប្រសើរ សម្រាប់បទពិសោធន៍រៀន AZD។**

#### បានផ្លាស់ប្តូរ
- **🐳 រូបភាពមូលដ្ឋាន**: បានប្ដូរពី `python:3.12-bullseye` ទៅ `python:3.12-bookworm` (Debian stable ថ្មីបំផុត)
- **📛 ឈ្មោះ Container**: ឈ្មោះចេញពី "Python 3" ទៅ "AZD for Beginners" សម្រាប់ភាពច្បាស់

#### បានបន្ថែម
- **🔧 លក្ខណៈ Dev Container ថ្មី**:
  - `azure-cli` ជាមួយការគាំទ្រជាមួយ Bicep
  - `node:20` (កំណែ LTS សម្រាប់គំរូ AZD)
  - `github-cli` សម្រាប់ការគ្រប់គ្រងគំរូ
  - `docker-in-docker` សម្រាប់ការចេញផ្សាយ container app

- **🔌 ការបើកច្រកចេញច្រកចូល**: បណ្ដាប្រភេទច្រកដែលត្រូវបានកំណត់ជាមុនសម្រាប់ការរីកចម្រើនទូទៅ៖
  - 8000 (ការមើលមុន MkDocs)
  - 3000 (កម្មវិធីបណ្ដាញ)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 ផ្នែកបន្ថែម VS Code ថ្មី**:
  - `ms-python.vscode-pylance` - IntelliSense Python កាន់តែប្រសើរ
  - `ms-azuretools.vscode-azurefunctions` - គាំទ្រ Azure Functions
  - `ms-azuretools.vscode-docker` - គាំទ្រ Docker
  - `ms-azuretools.vscode-bicep` - គាំទ្រភាសា Bicep
  - `ms-azure-devtools.azure-resource-groups` - គ្រប់គ្រងធនធាន Azure
  - `yzhang.markdown-all-in-one` - កែសម្រួល Markdown
  - `DavidAnson.vscode-markdownlint` - ពិនិត្យ Markdown
  - `bierner.markdown-mermaid` - គាំទ្រ diagram Mermaid
  - `redhat.vscode-yaml` - គាំទ្រ YAML (សម្រាប់ azure.yaml)
  - `eamodio.gitlens` - មើលភាព Git
  - `mhutchie.git-graph` - ប្រវត្តិ Git

- **⚙️ ការកំណត់ VS Code**: បន្ថែមការកំណត់លំនាំដើមសម្រាប់ Python interpreter, ប្រើការរៀបចំលំអិចនាដោយស្វ័យប្រវត្តិ និងការកាត់បណ្តោយទំហំទំនេរ

- **📦 កែទម្រង់ requirements-dev.txt**:
  - បន្ថែមបណ្ណាល័យ MkDocs minify plugin
  - បន្ថែម pre-commit សម្រាប់គុណភាពកូដ
  - បន្ថែម package Azure SDK (azure-identity, azure-mgmt-resource)

#### បានកែ
- **ពាក្យបញ្ជាចុងក្រោយបន្ទាប់បង្កើត**: ឥឡូវនេះធ្វើការត្រួតពិនិត្យ AZD និង Azure CLI ទៅការដំឡើងនៅពេល container ចាប់ផ្តើម

---

### [v3.11.0] - 2026-02-05

#### ការប្ដូរពីរ README សម្រាប់អ្នកចាប់ផ្តើម
**កំណែនេះធ្វើឲ្យ README.md មានភាពងាយស្រួលសម្រាប់អ្នកចាប់ផ្តើមជាងមុន ហើយបន្ថែមធនធានដ៏សំខាន់សម្រាប់អ្នកអភិវឌ្ឍ AI។**

#### បានបន្ថែម
- **🆚 ការប្រៀបធៀបទៅ Azure CLI និង AZD**: ពន្យល់ច្បាស់ពីពេលឱ្យប្រើឧបករណ៍ទាំងពីរ ជាមួយឧទាហរណ៍អនុវត្តន៍
- **🌟 តំណ AZD អស្ចារ្យ**: តំណផ្ទាល់ទៅកាន់បណ្ណាល័យគំរូសហគមន៍ និងធនធានរួមចំណែក:
  - [បណ្ណាល័យ ជំរុញ AZD ស្អាត](https://azure.github.io/awesome-azd/) - គំរូ ២០០+ រៀបចំបានរួច
  - [ដាក់បញ្ជូនគំរូ](https://github.com/Azure/awesome-azd/issues) - រួមចំណែកសហគមន៍
- **🎯 មគ្គុទេសក៍ចាប់ផ្តើមរហ័ស**: ផ្នែកចាប់ផ្តើម ៣ ជំហានសាមញ្ញ (ដំឡើង → ចូល → ចេញផ្សាយ)
- **📊 តារាង​រុករកផ្អែកលើបទពិសោធន៍**: ទិសដៅច្បាស់លាស់ពីកន្លែងចាប់ផ្តើមលើស្ទួនបទពិសោធន៍អ្នកអភិវឌ្ឍ

#### បានផ្លាស់ប្តូរ
- **រចនាសម្ព័ន្ធ README**: រៀបចំឡើងវិញសម្រាប់ការបង្ហាញព័ត៌មានតម្រូវបានបង្ហាញជាចំនុចសំខាន់ៗជាមុន
- **ផ្នែកណែនាំ**: បានសរសេរឡើងវិញ ដើម្បីពន្យល់ "អាថ៌កំបាំងរបស់ `azd up`" សម្រាប់អ្នកចាប់ផ្តើមថ្មី
- **លុបបញ្ចាក់មាតិកាដូចគ្នា**: លុបផ្នែក troubleshooting ដែលជាចម្លងចេញពីគ្នា
- **ពាក្យបញ្ជា troubleshooting**: កែសម្រួលបញ្ជាក់ `azd logs` ដើម្បីប្រើ `azd monitor --logs` ដែលត្រឹមត្រូវ

#### បានកែ
- **🔐 ពាក្យបញ្ជាចុះបញ្ជីការផ្ទៀងផ្ទាត់**: បន្ថែម `azd auth login` និង `azd auth logout` ទៅ cheat-sheet.md
- **ការបញ្ជាដែលមិនត្រឹមត្រូវ**: លុបរាល់ `azd logs` ដែលនៅសល់ពីផ្នែក README troubleshooting

#### សំគាល់
- **វិសាលភាព**: ការផ្លាស់ប្តូរនេះបានអនុវត្តនៅ README.md កំពូល និង resources/cheat-sheet.md
- **អ្នកទទួលបានគោលដៅ**: ការកែលម្អសំដៅសម្រាប់អ្នកអភិវឌ្ឍដែលថ្មីសម្រាប់ AZD

---

### [v3.10.0] - 2026-02-05

#### ការផ្លាស់ប្តូរពាក្យបញ្ជា Azure Developer CLI
**កំណែនេះកែសម្រួលពាក្យបញ្ជា AZD ដែលមិនមានក្នុងឯកសារជាច្រើន ដើម្បីធានាថាគំរូពាក្យបញ្ជាទាំងអស់ប្រើរូបមន្តត្រឹមត្រូវរបស់ Azure Developer CLI ។**

#### បានកែ
- **🔧 ការលុបពាក្យបញ្ជា AZD ដែលមិនមាន**: សង្កេត និងកែតម្រូវពាក្យបញ្ជាមិនត្រឹមត្រូវ៖
  - `azd logs` (មិនមាន) → កែជាការបង្កើតជំនួសដោយ `azd monitor --logs` ឬជាជម្រើស Azure CLI
  - ការបំបែកពាក្យបញ្ជា `azd service` (មិនមាន) → កែជាដោយ `azd show` និង Azure CLI
  - `azd infra import/export/validate` (មិនមាន) → លុប ឬប្ដូរជាជម្រើសត្រឹមត្រូវ
  - បង់ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (មិនមាន) → លុបចេញ
  - បង់ `azd provision --what-if/--rollback` (មិនមាន) → កែប្រែក្នុងការប្រើ `--preview`
  - `azd config validate` (មិនមាន) → កែជាថ្មីជាមួយ `azd config list`
  - `azd info`, `azd history`, `azd metrics` (មិនមាន) → លុបចេញ

- **📚 ឯកសារត្រូវបានកែប្រែជាមួយការកែពាក្យបញ្ជា**:
  - `resources/cheat-sheet.md`: ការកែសំរួលធំលើការយោងពាក្យបញ្ជា
  - `docs/deployment/deployment-guide.md`: កែសម្រួលវិធានការបង្វែននិងផ្សព្វផ្សាយ
  - `docs/troubleshooting/debugging.md`: កែសម្រួលផ្នែកវិភាគកំណត់ហេតុ
  - `docs/troubleshooting/common-issues.md`: កែសម្រួលពាក្យបញ្ជា troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: កែសម្រួលផ្នែក AZD debugging
  - `docs/getting-started/azd-basics.md`: ការបញ្ជារត្រួតពិនិត្យបានកែប្រែត្រឹមត្រូវ
  - `docs/getting-started/first-project.md`: ឧទាហរណ៍ត្រួតពិនិត្យ និងការ​ដោះស្រាយ​បញ្ហាបាន​បច្ចុប្បន្នភាព
  - `docs/getting-started/installation.md`: ឧទាហរណ៍ជំនួយ និងកំណែបានកែប្រែត្រឹមត្រូវ
  - `docs/pre-deployment/application-insights.md`: ការបញ្ជាមើលកំណត់ហេតុបានកែប្រែត្រឹមត្រូវ
  - `docs/pre-deployment/coordination-patterns.md`: ការបញ្ជារចាប់ផ្តើម​ដោះស្រាយ​បញ្ហា​អ្នកតំណាង​បានជួសជុលសមរម្យ

- **📝 កំណែបានយោងបច្ចុប្បន្ន**: 
  - `docs/getting-started/installation.md`: ប្រែក្លាយកំណែ `1.5.0` ដែលបានថែមទាំងកូដទៅកំណែទូលំទូលាយ `1.x.x` ជាមួយតំណភ្ជាប់ទៅកាន់ការចេញផ្សាយ

#### បានប្តូរ
- **យុទ្ធសាស្ត្រត្រឡប់ក្រោយ**: បានបច្ចុប្បន្នភាពឯកសារដើម្បីប្រើការត្រឡប់ក្រោយ​មូលដ្ឋាន​លើ Git (AZD មិនមានការត្រឡប់ក្រោយ​ដើមៗ)
- **មើលកំណត់ហេតុ**: បានប្តូរឯកសារ​យោង `azd logs` ជា `azd monitor --logs`, `azd monitor --live` និងការបញ្ជារ Azure CLI
- **ផ្នែកការសម្តែង**: បានយកប៊្លាក​ផ្ទះប៊ុកផ្សារភ្ជាប់/បង្ហាញប្រាក់បញ្ចាំដែលមិនមានចេញ ហើយផ្តល់ជម្រើសត្រឹមត្រូវ

#### ព័ត៌មានបច្ចេកទេស
- **បញ្ជា AZD ត្រឹមត្រូវ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **ក្រមសញ្ញា azd monitor ត្រឹមត្រូវ**: `--live`, `--logs`, `--overview`
- **លក្ខណៈបានយកចេញ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### កំណត់ចំណាំ
- **ការ​ផ្ទៀងផ្ទាត់**: ការបញ្ជាត្រូវបានផ្ទៀងផ្ទាត់ប្រឆាំងនឹង Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### ការបញ្ចប់កម្មវិធីបណ្ដុះបណ្ដាល និងការកែលម្អគុណភាពឯកសារ
**កំណែក្នុងកំណែនេះបានបញ្ចប់ម៉ូឌុលបណ្តុះបណ្តាលអន្តរកម្ម គ្រប់គ្រងតំណភ្ជាប់ឯកសារខូច និងកែលម្អគុណភាពមាតិកា​សម្រាប់អ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD។**

#### បានបន្ថែម
- **📝 CONTRIBUTING.md**: ឯកសារណែនាំការរួមចំណែកថ្មី មាន៖
  - សេចក្តីណែនាំច្បាស់លាស់សម្រាប់រាយការណ៍បញ្ហានិងបញ្ចូនការផ្លាស់ប្តូរ
  - ស្តង់ដារឯកសារសម្រាប់មាតិកាថ្មី
  - ណែនាំគំរូកូដនិងបែបបទសារបញ្ជូន commit
  - ព័ត៌មានចូលរួមសហគមន៍

#### បានបញ្ចប់
- **🎯 ម៉ូឌុលបណ្ដុះបណ្ដាល ៧ (រៀបចំចប់)**: បញ្ចប់ពេញលេញម៉ូឌុល រៀបចំដំណើរការជាមួយ៖
  - សង្ខេបលម្អិតនៃភាពជោគជ័យការបណ្តុះបណ្តាល
  - ផ្នែកគន្លឹះសំខាន់ បច្ចេកទេស AZD, គំរូ និង Microsoft Foundry
  - ណែនាំការបន្តការសិក្សា
  - លំហាត់បច្ចេកទេសជាមួយកម្រិតភាពលំបាក
  - តំណភ្ជាប់មតិយោបល់និងការគាំទ្រសហគមន៍

- **📚 ម៉ូឌុលបណ្ដុះបណ្ដាល ៣ (បំបែក)**: បានបច្ចុប្បន្នភាពគោលបំណងការសិក្សាជាមួយ៖
  - ដំណើរការបើកប្រើ GitHub Copilot ជាមួយម៉ាស៊ីន MCP
  - ការយល់ដឹងស្តីពីរចនាសម្ព័ន្ធថតគំរូ AZD
  - ព្យាយាមរៀបចំ Infrastructure-as-code (Bicep)
  - ជំហានថ្នាក់ចេញបង្រៀនដៃអោយដំណើរការ

- **🔧 ម៉ូឌុលបណ្ដុះបណ្ដាល ៦ (រំលាយ)**: បានបញ្ចប់ជាមួយ៖
  - គោលបំណងសម្អាតធនធាន និងគ្រប់គ្រងចំណាយ
  - ប្រើប្រាស់ `azd down` សម្រាប់ការបញ្ចេញធនធានយ៉ាងសុវត្ថិភាព
  - ណែនាំវិធីសាស្ត្រឆែកស្រាយសេវាកម្ម cognitive ដែលបានលុបដោយទន់
  - លំហាត់ជំនាញបន្ថែមសម្រាប់ GitHub Copilot និង Azure Portal

#### បានជួសជុល
- **🔗 ដំណើរការកែតម្រូវតំណភ្ជាប់ខូច**: ជួសជុលលក្ខណៈខូច 15+ នៅក្នុងឯកសារខាងក្នុង៖
  - `docs/ai-foundry/ai-model-deployment.md`: ជួសជុលផ្លូវទៅ microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: កែប្រែផ្លូវទៅ ai-model-deployment.md និង production-ai-practices.md
  - `docs/getting-started/first-project.md`: ប្តូរឯកសារ cicd-integration.md ដែលមិនមានជាមួយ deployment-guide.md
  - `examples/retail-scenario.md`: ជួសជុលផ្លូវ FAQ និងសៀវភៅដោះស្រាយបញ្ហា
  - `examples/container-app/microservices/README.md`: កែផ្លូវទំព័រផ្ទះវិទ្យាសាលានិងdeployment guide
  - `resources/faq.md` និង `resources/glossary.md`: បច្ចុប្បន្នភាពយោងជំពូក AI
  - `course-outline.md`: ជួសជុលផ្លូវមគ្គុទេសក៍ និងការបណ្តុះបណ្តាល AI

- **📅 បទបង្ហាញស្ថានភាពសិក្ខាសាលា**: បច្ចុប្បន្នភាពពី "កំពុងសាងសង់" ទៅស្ថានភាពសិក្ខាសាលាសកម្មមួយប្រចាំខែ កុម្ភៈ 2026

- **🔗 នាវីហ្គេសិនសិក្ខាសាលា**: ជួសជុលតំណភ្ជាប់អ្នកបើកផ្លូវដែលខូចនៅក្នុង README.md ដែលបញ្ជូនទៅថត lab-1-azd-basics ដែលមិនមាន

#### ប្តូរ
- **ការនាំเสนอสិក្ខាសាលា**: យកការព្រមាន "កំពុងសាងសង់" ចេញ ហើយសិក្ខាសាលានេះបានបញ្ចប់ហើយត្រៀមប្រើប្រាស់
- **ភាពស្មើរតុល្យនាវីហ្គេសិន**: ធានាថា​ម៉ូឌុល​សិក្ខាសាលា​គ្រប់មួយមាននាវីហ្គេសិន​ភ្ជាប់គ្នាត្រឹមត្រូវ
- **គន្លងការសិក្សា**: បច្ចុប្បន្នភាពយោងជំពូកទាំងមូលទៅផ្លូវ microsoft-foundry ត្រឹមត្រូវ

#### បានផ្ទៀងផ្ទាត់
- ✅ ឯកសារ markdown សម្រង់ភាសាអង់គ្លេសទាំងអស់មានតំណខាងក្នុងត្រឹមត្រូវ
- ✅ ម៉ូឌុលសិក្ខាសាលា 0-7 បានបញ្ចប់ជាមួយគោលបំណងការសិក្សា
- ✅ នាវីហ្គេសិនរវាងជំពូកនិងម៉ូឌុលដំណើរការល្អ
- ✅ មាតិកាសម្របសម្រួលសម្រាប់អ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD
- ✅ ភាសាបង្រៀនសមរម្យសម្រាប់អ្នកចាប់ផ្តើមបានរក្សាទុកក្រោមទម្រង់
- ✅ CONTRIBUTING.md ផ្តល់ការណែនាំច្បាស់លាស់សម្រាប់អ្នករួមចំណែកសហគមន៍

#### ការអនុវត្តបច្ចេកទេស
- **ការផ្ទៀងផ្ទាត់តំណភ្ជាប់**: Script PowerShell ស្វ័យប្រវត្តិបានផ្ទៀងផ្ទាត់តំណភ្ជាប់ .md ទាំងអស់
- **ស្ទង់មតិយោបល់មាតិកា**: ពិនិត្យដោយដៃ​សម្រាប់ភាពបញ្ចប់និងសមរម្យភាពសម្រាប់អ្នកចាប់ផ្តើម
- **ប្រព័ន្ធនាវីហ្គេសិន**: ការទាក់ទងនាវីហ្គេសិនជំពូកនិងម៉ូឌុលត្រូវបានអនុវត្តជាប់គ្នា

#### កំណត់ចំណាំ
- **វិស័យ**: ការផ្លាស់ប្តូរបានអនុវត្តលើឯកសារអង់គ្លេសតែប៉ុណ្ណោះ
- **ការបកប្រែ**: មិនបានបន្ទាន់សម័យថតប្រែភាសានៅក្នុងកំណែនេះ (ការបកប្រែស្វ័យប្រវត្តិ​នឹងសម័យក្រោយ)
- **រយះពេលសិក្សា**: កម្មវិធីបណ្ដុះបណ្ដាលពេញលេញឥឡូវផ្តល់ជូនពេលវេលាសិក្សាដៃ 3-4 ម៉ោង

---

### [v3.8.0] - 2025-11-19

#### ឯកសាររីកចម្រើនខ្ពស់៖ ត្រួតពិនិត្យ សុវត្ថិភាព និងគំទួលអ្នកតំណាងច្រើន
**កំណែនេះបន្ថែមមេរៀនថ្នាក់ A ពេញលេញ អំពីការរួមបញ្ចូល Application Insights, គំទួលសុវត្ថិភាព និងសម្របសម្រួលឧបករណ៍ច្រើនសម្រាប់ការដាក់ចេញផលិតកម្ម។**

#### បានបន្ថែម
- **📊 មេរៀនរួមបញ្ចូល Application Insights**: នៅក្នុង `docs/pre-deployment/application-insights.md`:
  - ការដាក់ចេញផ្តោតលើ AZD ជាមួយការផ្គត់ផ្គង់ស្វ័យប្រវត្តិ
  - គំរូ Bicep ពេញលេញសម្រាប់ Application Insights + Log Analytics
  - កម្មវិធី Python ដំណើរការជាមួយ telemetry ទំនើប (ជាង ១,២០០ ជួរ)
  - រចនាបទត្រួតពិនិត្យ AI/LLM (តាមដានកំប៉ុង/ការចំណាយ Microsoft Foundry Models)
  - គំនូសភាព Mermaid 6 គំនូស (ស្ថាបត្យកម្ម, តាមដានចែកចាយ, ឆ្លងកាត់ telemetry)
  - លំហាត់ដៃ 3 (ការជូនដំណឹង, ផ្ទាំងគ្រប់គ្រង, ត្រួតពិនិត្យ AI)
  - ឧទាហរណ៍សំណួរកុستو និងយុទ្ធសាស្ត្របង្កើនប្រសិទ្ធភាពចំណាយ
  - បញ្ចេញលទ្ធផលតាមពេលវេលាពិត និងដោះស្រាយបញ្ហាផ្ទាល់
  - ពេលសិក្សា ៤០-៥០ នាទី ជាមួយគំរូដំណើរការផលិតកម្ម

- **🔐 មេរៀនគំទួលសុវត្ថិភាព និងការផ្ទៀងផ្ទាត់**: នៅក្នុង `docs/getting-started/authsecurity.md`:
  - គំទួលស្វែងរក 3 (ខ្សែការតភ្ជាប់, Key Vault, managed identity)
  - គំរូហួសគម្លាត Bicep ដើម្បីដាក់ចេញនូវសុវត្ថិភាព
  - កូដកម្មវិធី Node.js រួមបញ្ចូល Azure SDK
  - លំហាត់ពេញលេញ 3 (បើក managed identity, user-assigned identity, ស្ដារតែល Key Vault)
  - គន្លឹះអនុវត្តសុវត្ថិភាព និងការកំណត់ RBAC
  - មគ្គុទេសក៍ដោះស្រាយបញ្ហា និងវិភាគចំណាយ
  - គំរូការផ្ទៀងផ្ទាត់មិនប្រើពាក្យសម្ងាត់សម្រាប់ផលិតកម្ម

- **🤖 មេរៀនគំទួលសម្របសម្រួលអ្នកតំណាងច្រើន**: នៅក្នុង `docs/pre-deployment/coordination-patterns.md`:
  - គំទួលសម្របសម្រួល 5 (តម្រៀប, 병렬, រៀបកម្រា, បណ្ដាប្រតិបត្ដិការព្រឹត្តិការណ៍, សន្ទនាមតិយោង)
  - ការអនុវត្តសេវាកម្មអូខេស្ត្រា (Python/Flask ជាង ១,៥០០ ជួរ)
  - ការអនុវត្តអ្នកតំណាងជាក់លាក់ 3 (ស្រាវជ្រាវ, អ្នកសរសេរ, អ្នកកែប្រែ)
  - រួមបញ្ចូល Service Bus សម្រាប់ច្រកសាររងចាំ
  - គ្រប់គ្រងស្ថានភាព Cosmos DB សម្រាប់ប្រព័ន្ធចែកចាយ
  - គំនូសភាព Mermaid 6 សម្រាប់បង្ហាញប្រតិបត្តិការអ្នកតំណាង
  - លំហាត់កម្រិតខ្ពស់ 3 (ការគ្រប់គ្រងពេលវេលា, លិចវិលការព្យាយាម, ផ្នែកត្រួតពិនិត្យចរាចរណ៍)
  - ការបំបែកចំណាយ ($240-565/ខែ) ជាមួយយុទ្ធសាស្ត្របង្កើនប្រសិទ្ធភាព
  - រួមបញ្ចូល Application Insights សម្រាប់ត្រួតពិនិត្យ

#### បានបង្កើនសមត្ថភាព
- **ជំពូកមុនការដាក់ចេញ**: ឥឡូវនេះរួមបញ្ចូលគំទួលត្រួតពិនិត្យនិងសម្របសម្រួលពេញលេញ
- **ជំពូកចាប់ផ្តើម**: បានបង្កើនជាមួយគំទួលសុវត្ថិភាពអាជីពវិជ្ជាជីវៈ
- **ភាពត្រៀមប្រកបដោយផលិតកម្ម**: គ្រប់គ្រងពេញលេញពីសុវត្ថិភាពដល់ការត្រួតពិនិត្យ
- **សេចក្ដីសង្ខេបវគ្គសិក្សា**: បច្ចុប្បន្នភាពឯកសារសម្រាប់មេរៀនថ្មីនៅជំពូក 3 និង 6

#### ប្តូរ
- **ជំហានការសិក្សា**: បញ្ចូលល្អប្រសើរជាងមុនរវាងសុវត្ថិភាព និងការត្រួតពិនិត្យទាំងវគ្គសិក្សា
- **គុណភាពឯកសារ**: ស្តង់ដារថ្នាក់ A ធៀបនឹង ៩៥-៩៧% ទំនើបគ្រប់មេរៀនថ្មី
- **គំរូសម្រាប់ផលិតកម្ម**: គ្រប់គ្រងពេញលេញពីដំបូងដល់ចុងសម្រាប់ការដាក់ចេញអាជីវកម្ម

#### ចំណេញ
- **បទពិសោធន៍អ្នកអភិវឌ្ឍន៍**: ផ្លូវច្បាស់ពីការអភិវឌ្ឍទៅការត្រួតពិនិត្យផលិតកម្ម
- **ស្តង់ដារ​សុវត្ថិភាព**: គំទួលដ៏ជំនាញសម្រាប់ការផ្ទៀងផ្ទាត់និងគ្រប់គ្រងសម្ងាត់
- **ការត្រួតពិនិត្យ**: រួមបញ្ចូល Application Insights ជាមួយ AZD ពេញលេញ
- **បន្ទុក AI**: ត្រួតពិនិត្យជាក់លាក់សម្រាប់ Microsoft Foundry Models និងប្រព័ន្ធអ្នកតំណាងច្រើន

#### បានផ្ទៀងផ្ទាត់
- ✅ មេរៀនទាំងអស់រួមបញ្ចូលកូដដំណើរការពេញលេញ (មិនមែនកូដផ្នែកតូច)
- ✅ គំនូសភាព Mermaid សម្រាប់ការសិក្សាភាពជាដើម (ចំនួន ១៩ ក្នុង ៣ មេរៀន)
- ✅ លំហាត់ដៃជាមួយជំហានផ្ទៀងផ្ទាត់ (ចំនួន ៩)
- ✅ គំរូ Bicep ធ្វើការដាក់ចេញជាពេញលេញតាម `azd up`
- ✅ វិភាគចំណាយ និងយុទ្ធសាស្ត្របង្កើនប្រសិទ្ធភាព
- ✅ មគ្គុទេសក៍ដោះស្រាយបញ្ហា និងការអនុវត្តល្អបំផុត
- ✅ ចំណុចពិនិត្យចំណេះដឹងជាមួយបញ្ជា​ផ្ទៀងផ្ទាត់

#### លទ្ធផលពិន្ទុឯកសារ
- **docs/pre-deployment/application-insights.md**: - មគ្គុទេសក៍ត្រួតពិនិត្យពេញលេញ
- **docs/getting-started/authsecurity.md**: - គំរូសុទិដ្ឋិនិយមសុវត្ថិភាពជំនាញ
- **docs/pre-deployment/coordination-patterns.md**: - ស្ថាបត្យកម្មអ្នកតំណាងច្រើនជាក់លាក់
- **មាតិកាថ្មីសរុប**: - ស្តង់ដារគុណភាពខ្ពស់ស្ថាពរ

#### ការអនុវត្តបច្ចេកទេស
- **Application Insights**: Log Analytics + telemetry ផ្ទាល់ខ្លួន + តាមដានចែកចាយ
- **ការផ្ទៀងផ្ទាត់**: Managed Identity + Key Vault + រចនាសម្ព័ន្ធ RBAC
- **អ្នកតំណាងច្រើន**: Service Bus + Cosmos DB + Container Apps + អូខេស្ត្រា
- **ការត្រួតពិនិត្យ**: បញ្ជី live metrics + សំណួរ kusto + ការជូនដំណឹង + ផ្ទាំងគ្រប់គ្រង
- **គ្រប់គ្រងចំណាយ**: វិធីសាស្រ្តគំរូ, គោលការណ៍រក្សាទុក, ការគ្រប់គ្រងថវិកា

### [v3.7.0] - 2025-11-19

#### ការកែលម្អគុណភាពឯកសារ និងឧទាហរណ៍ Microsoft Foundry Models ថ្មី
**កំណែនេះជួយបង្កើនគុណភាពឯកសារសរុប និងបន្ថែមឧទាហរណ៍ដាក់ចេញ Microsoft Foundry Models សព្វវិធីជាមួយចំណុចចម្រៀង gpt-4.1 chat ឯករាជ្យ។**

#### បានបន្ថែម
- **🤖 ឧទាហរណ៍សន្ទនារបស់ Microsoft Foundry Models**: ដាក់ចេញ gpt-4.1 ពេញលេញ ជាដំណើរការនៅក្នុង `examples/azure-openai-chat/`:
  - ស្ថាបត្យកម្មសម្ព័ន្ធ Microsoft Foundry Models ពេញលេញ (ដាក់ចេញម៉ូដែល gpt-4.1)
  - ចំណុចចម្រៀង Python ជាមួយប្រវត្តិសន្ទនា
  - រួមបញ្ចូល Key Vault ស្តុក API key សុវត្ថិភាព
  - តាមដានការប្រើ Token និងការប៉ាន់ប្រមាណចំណាយ
  - ការកំណត់កំរិតចុច និងដោះស្រាយកំហុស
  - README ពេញលេញជាមួយមគ្គុទេសក៍ដាក់ចេញ ៣៥-៤៥ នាទី
  - ឯកសារផលិត ១១ (គំរូ Bicep, កម្មវិធី Python, ការកំណត់រចនា)
- **📚 លំហាត់ឯកសារ**: បន្ថែមលំហាត់ដៃក្នុងមគ្គុទេសក៍កំណត់រចនា:
  - លំហាត់ ១: ការកំណត់ environment ពហុ (១៥ នាទី)
  - លំហាត់ ២: បទប្បញ្ញត្តិគ្រប់គ្រងសម្ងាត់ (១០ នាទី)
  - គោលការណ៍ជោគជ័យច្បាស់លាស់ និងជំហានផ្ទៀងផ្ទាត់
- **✅ ផ្ទៀងផ្ទាត់ការដាក់ចេញ**: បន្ថែមផ្នែកផ្ទៀងផ្ទាត់ក្នុងមគ្គុទេសក៍ដាក់ចេញ:
  - វិធានការត្រួតពិនិត្យសុខភាព
  - បញ្ជីគោលការណ៍ជោគជ័យ
  - លទ្ធផលរំពឹងទុកសម្រាប់បញ្ជា​ទាំងអស់ក្នុងការដាក់ចេញ
  - មគ្គុទេសក៏ជួយដោះស្រាយបញ្ហាឆាប់រហ័ស

#### បានលើកកម្ពស់
- **examples/README.md**: បច្ចុប្បន្នភាពទៅគុណភាពថ្នាក់ A (93%):
  - បន្ថែម azure-openai-chat ទៅគ្រប់ផ្នែកដែលពាក់ពន្ធ័
  - បណ្ដើរ​រាប់​គំរូក្នុង​តំបន់​ធ្វើការ​ពី 3 ទៅ 4
  - បន្ថែមទៅតារាងឧទាហរណ៍ AI Application
  - បញ្ចូលទៅក្នុង Quick Start សម្រាប់អ្នកប្រើប្រាស់កម្រិតមធ្យម
  - បន្ថែមក្នុងផ្នែក Microsoft Foundry Templates
  - បច្ចុប្បន្នភាពតារាងផ្ទៀបធៀប និងផ្នែកស្វែងរកបច្ចេកវិទ្យា
- **គុណភាពឯកសារ**: ធ្វើអោយបង្កើត B+ (87%) → A- (92%) នៅក្នុងថតឯកសារ:
  - បន្ថែមលទ្ធផលរំពឹងទុកក្នុងឧទាហរណ៍បញ្ជាសំខាន់ៗ
  - រួមបញ្ចូលជំហានផ្ទៀងផ្ទាត់សម្រាប់បម្លែងការកំណត់រចនា
  - បង្កើនការសិក្សាដៃជាមួយលំហាត់អនុវត្តបានប្រាកដ

#### ប្តូរ
- **ជំហានការសិក្សា**: បញ្ចូលគំរូ AI ល្អប្រសើរជាងមុនសម្រាប់អ្នករៀនកម្រិតមធ្យម
- **រចនាសម្ព័ន្ធឯកសារ**: លំហាត់អ្នកអាចអនុវត្តបានជាមួយលទ្ធផលច្បាស់លាស់
- **ដំណើរការផ្ទៀងផ្ទាត់**: បន្ថែមគោលការណ៍ជោគជ័យច្បាស់លាស់ទៅលទ្ធភាពហាត់ប្រាជ្ញាចម្បងៗ

#### បានលើកកម្ពស់
- **បទពិសោធន៍អ្នកអភិវឌ្ឍ**: ការដាក់ចេញ Microsoft Foundry Models ឥឡូវនេះចំណាយ ៣៥-៤៥ នាទី (ប្រៀបធៀបទៅ ៦០-៩០ នាទីសម្រាប់ជម្រើសស្មុគស្មាញ)
- **ភាពច្បាស់លាស់ចំណាយ**: ប៉ាន់ប្រមាណចំណាយច្បាស់ ($៥០-២០០/ខែ) សម្រាប់ឧទាហរណ៍ Microsoft Foundry Models
- **ផ្លូវការសិក្សា**: អ្នកអភិវឌ្ឍ AI មានចំណុចចូលច្បាស់ជាមួយ azure-openai-chat
- **ស្តង់ដារឯកសារ**: លទ្ធផលរំពឹងទុក និងជំហានផ្ទៀងផ្ទាត់បានរក្សាទុកឲ្យរឹងមាំ

#### គឺបានផ្ទៀងផ្ទាត់
- ✅ ឧទាហរណ៍ Microsoft Foundry Models ដំណើរការបំពេញដោយ `azd up`
- ✅ ឯកសារអនុវត្ត ១១ ឯកសារទាំងអស់ត្រឹមត្រូវផ្នែកវេយ្យាករណ៍
- ✅ សេចក្តីណែនាំ README ផ្គូផ្គងជាមួយបទពិសោធន៍ដាក់ចេញពិតប្រាកដ
- ✅ តំណភ្ជាប់ឯកសារបានបច្ចុប្បន្នភាពនៅ ៨+ ទីតាំង
- ✅ សន្ទស្សន៍ឧទាហរណ៍បង្ហាញឧទាហរណ៍ក្នុងតំបន់ ៤
- ✅ គ្មានតំណភ្ជាប់ក្រៅស្ទួនក្នុងតារាង
- ✅ ការយោងនាវីហ្គេសិនទាំងអស់ត្រឹមត្រូវ

#### ការអនុវត្តបច្ចេកទេស
- **ស្ថាបត្យកម្ម Microsoft Foundry Models**: gpt-4.1 + Key Vault + គំរូ Container Apps
- **សុវត្ថិភាព**: managed Identity រួចរាល់, គ្រប់គ្រងសម្ងាត់នៅក្នុង Key Vault
- **ការត្រួតពិនិត្យ**: រួមបញ្ចូល Application Insights
- **គ្រប់គ្រងចំណាយ**: ការតាមដាន Token និងបង្កើនប្រសិទ្ធភាពការប្រើប្រាស់
- **ដាក់ចេញ**: បញ្ជា `azd up` តែមួយសម្រាប់ការតំឡើងពេញលេញ

### [v3.6.0] - 2025-11-19

#### ការបច្ចុប្បន្នភាពធំ: ឧទាហរណ៍ដាក់ចេញ Container App
**កំណែនេះបង្ហាញឧទាហរណ៍ដាក់ចេញកម្មវិធី container ពេញលេញ សំរាប់ផលិតកម្មប្រើ Azure Developer CLI (AZD) ជាមួយឯកសារពេញលេញ និងការរួមបញ្ចូលក្នុងផ្លូវការសិក្សា។**

#### បានបន្ថែម
- **🚀 ឧទាហរណ៍ Container App**: ឧទាហរណ៍ក្នុងតំបន់ថ្មីនៅក្នុង `examples/container-app/`:
  - [មគ្គុទេសក៍សំខាន់](examples/container-app/README.md): សង្ខេបពេញលេញអំពីការដាក់បញ្ចូលដោយប្រើមុខងារ container, ចាប់ផ្តើមយ៉ាងឆាប់រហ័ស, ផលិតកម្ម និងលំនាំកម្រិតខ្ពស់
  - [API Flask សាមញ្ញ](../../examples/container-app/simple-flask-api): REST API សមហួរ​សម្រាប់អ្នកចាប់ផ្តើម​ជាមួយ​មុខងារ scale-to-zero, វិភាគ​សុខភាព, ការត្រួតពិនិត្យ និងដោះស្រាយបញ្ហា
  - [រចនាសម្ព័ន្ធ Microservices](../../examples/container-app/microservices): ការដាក់បញ្ចូល multi-service សមត្ថភាពផលិតកម្ម (API Gateway, Product, Order, User, Notification), សារ asynchronous, Service Bus, Cosmos DB, Azure SQL, ការតាមដានចែកចាយ, blue-green/canary deployment
- **អនុប្រើល្អបំផុត**: សុវត្ថិភាព, ការត្រួតពិនិត្យ, ការបង្កើនប្រសិទ្ធភាពថ្លៃថ្នូរ និងមគ្គុទេសក៍ CI/CD សម្រាប់បន្សំ container
- **គំរូកូដ**: `azure.yaml` ពេញលេញ, តារាង Bicep និងការអនុវត្តសេវាកម្មជាភាសាច្រើន (Python, Node.js, C#, Go)
- **ការតេស្ត និងដោះស្រាយបញ្ហា**: សំណួរតេស្តចុង끝, បញ្ជាគ្រប់គ្រងត្រួតពិនិត្យ និងមគ្គុទេសក៍ដោះស្រាយបញ្ហា

#### បានផ្លាស់ប្តូរ
- **README.md**: បានធ្វើបច្ចុប្បន្នភាពដើម្បីបង្ហាញនិងភ្ជាប់គំរូ container app ថ្មីៗក្រោម "Local Examples - Container Applications"
- **examples/README.md**: បានធ្វើបច្ចុប្បន្នភាពដើម្បីផ្តោតលើគំរូ container app, បន្ថែមអថេរទម្លាប់ប្រៀបធៀប និងធ្វើបច្ចុប្បន្នភាពយោងបច្ចេកវិទ្យា/រចនាសម្ព័ន្ធ
- **Course Outline & Study Guide**: បានធ្វើបច្ចុប្បន្នភាពក្នុងការតំណាងគំរូ container app ថ្មី និងលំនាំដាក់បញ្ចូលនៅជំពូកដែលពាក់ព័ន្ធ

#### បានផ្ទៀងផ្ទាត់
- ✅ គំរូថ្មីទាំងអស់អាចដាក់បញ្ចូលបានដោយ `azd up` និងអនុវត្តន៍តាមអនុវត្តល្អបំផុត
- ✅ តំណភ្ជាប់ឯកសារផ្សេងៗត្រូវបានធ្វើបច្ចុប្បន្នភាព
- ✅ គំរូបានគ្របដណ្តប់ពីស្ថានភាពអ្នកចាប់ផ្តើម ដល់លំនាំកម្រិតខ្ពស់ រួមទាំង microservices ផលិតកម្ម

#### កំណត់សម្គាល់
- **វិសាលភាព**: ឯកសារជាភាសាអង់គ្លេស និងគំរូប៉ុណ្ណោះ
- **ជំហានបន្ទាប់**: ពង្រីកជាមួយលំនាំ container កម្រិតខ្ពស់បន្ថែម និងអូតូម៉ាទ័រ CI/CD នៅក្នុងការចេញផ្សាយនៅអនាគត

### [v3.5.0] - 2025-11-19

#### ការប្ដូរឈ្មោះផលិតផល៖ Microsoft Foundry
**កំណែកំណត់នេះអនុវត្តការប្ដូរឈ្មោះផលិតផលពេញលេញពី "Microsoft Foundry" ទៅ "Microsoft Foundry" ទៅទាំងឯកសារអង់គ្លេសទាំងអស់ ដើម្បីបង្ហាញពីការប្ដូរតាមផ្លូវផ្លូវការរបស់ Microsoft។**

#### បានផ្លាស់ប្តូរ
- **🔄 ការផ្លាស់ប្ដូរឈ្មោះផលិតផល**: ការប្ដូរឈ្មោះពេញលេញពី "Microsoft Foundry" ទៅ "Microsoft Foundry"
  - បានធ្វើបច្ចុប្បន្នភាពតំរូវទាំងអស់ក្នុងឯកសារអង់គ្លេសនៅក្នុងប៉ុណ្ណោររក្សា `docs/`
  - បានប្ដូរឈ្មោះថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - បានប្ដូរឈ្មោះឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - សរុប: បានធ្វើបច្ចុប្បន្នភាព 23 ឯកសារគ្រប់គ្រងមាតិភាពនៅក្នុងឯកសារតំបន់ 7

- **📁 ការផ្លាស់ប្ដូររចនាសម្ព័ន្ធថត**:
  - បានប្ដូរឈ្មោះ `docs/ai-foundry/` ទៅ `docs/microsoft-foundry/`
  - បានធ្វើបច្ចុប្បន្នភាពគ្រប់តំណភ្ជាប់ឆ្លងទៅដោយមានរចនា​ថតថ្មី
  - តំណភ្ជាប់ទេសចរណ៍បានផ្ទៀងផ្ទាត់ទាំងអស់

- **📄 ការប្ដូរឈ្មោះឯកសារ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - តំណភ្ជាប់ខាងក្នុងទាំងអស់បានធ្វើបច្ចុប្បន្នភាព​ដើម្បីយោងឈ្មោះឯកសារថ្មី

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- **ឯកសារជំពូក** (7ឯកសារ):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ផ្លាស់ប្ដូរតំណភ្ជាប់ទេសចរណ៍ 3
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ផ្លាស់ប្ដូរឈ្មោះផលិតផល 4
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - កំពុងប្រើ Microsoft Foundry រួច (ពីការធ្វើបច្ចុប្បន្នភាពមុន)
  - `docs/microsoft-foundry/production-ai-practices.md` - ផ្លាស់ប្ដូរយោង 3 (សង្ខេប, មតិ​សហគមន៍, ឯកសារ)
  - `docs/getting-started/azd-basics.md` - ផ្លាស់ប្ដូរតំណភ្ជាប់ឆ្លង 4
  - `docs/getting-started/first-project.md` - ផ្លាស់ប្ដូរតំណភ្ជាប់ទេសចរណ៍ជំពូក 2
  - `docs/getting-started/installation.md` - ផ្លាស់ប្ដូរតំណភ្ជាប់ជំពូកបន្ទាប់ 2
  - `docs/troubleshooting/ai-troubleshooting.md` - ផ្លាស់ប្ដូរយោង 3 (ទេសចរណ៍, សហគមន៍ Discord)
  - `docs/troubleshooting/common-issues.md` - ផ្លាស់ប្ដូរតំណភ្ជាប់ទេសចរណ៍ 1
  - `docs/troubleshooting/debugging.md` - ផ្លាស់ប្ដូរតំណភ្ជាប់ទេសចរណ៍ 1

- **ឯកសាររចនាសម្ព័ន្ធវគ្គសិក្សា** (2ឯកសារ):
  - `README.md` - ផ្លាស់ប្ដូរយោង 17 (សង្ខេបវគ្គសិក្សា, ចំណងជើងជំពូក, ផ្នែកតំរូវ, មតិកម្ពុជា)
  - `course-outline.md` - ផ្លាស់ប្ដូរយោង 14 (សង្ខេប, គោលបំណងរៀន, ឯកសារជំពូក)

#### បានផ្ទៀងផ្ទាត់
- ✅ គ្មានយោងមាត្មភ្ជាប់ថត "ai-foundry" នៅក្នុងឯកសារអង់គ្លេសហើយ
- ✅ គ្មានយោងឈ្មោះផលិតផល "Microsoft Foundry" នៅក្នុងឯកសារអង់គ្លេសហើយ
- ✅ តំណភ្ជាប់ទេសចរណ៍ទាំងអស់ប្រតិបត្តិការជាមួយរចនា​ថត​ថ្មី
- ✅ ការប្ដូរឈ្មោះឯកសារ និងថតបានបញ្ចប់ដោយជោគជ័យ
- ✅ តំណភ្ជាប់ឆ្លងជាមួយជំពូកបានធ្វើបច្ចុប្បន្នភាព

#### កំណត់សម្គាល់
- **វិសាលភាព**: ការផ្លាស់ប្ដូរនេះអនុវត្តតែជាឯកសារអង់គ្លេសនៅក្នុងថត `docs/` ប៉ុណ្ណោះ
- **ការប្រែក្លាយ**: ថតប្រែភាសា (`translations/`) មិនទាន់បានធ្វើបច្ចុប្បន្នភាពនៅកំណែកំណត់នេះ
- **វគ្គបណ្តុះបណ្តាល**: សំភារៈវគ្គបណ្តុះបណ្តាល (`workshop/`) មិនទាន់បានធ្វើបច្ចុប្បន្នភាព
- **គំរូ**: ឯកសារគំរូនៅតែមានយោងឈ្មោះចាស់ (នឹងដោះស្រាយនៅក្នុងកំណែកំណត់ក្រោយ)
- **តំណភ្ជាប់ខាងក្រៅ**: តំណភ្ជាប់រូបរាង និងគណនី GitHub គ្មានការផ្លាស់ប្ដូរទេ

#### មគ្គុទេសក៍ផ្លាស់ប្ដូរសម្រាប់អ្នករួមចំណែក
ប្រសិនបើអ្នកមានសាខាតំបន់ឬឯកសារយោងទៅរចនាសម្ព័ន្ធចាស់:
1. ធ្វើបច្ចុប្បន្នភាពយោងថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ធ្វើបច្ចុប្បន្នភាពយោងឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ផ្លាស់ប្ដូរឈ្មោះផលិតផល: "Microsoft Foundry" → "Microsoft Foundry"
4. ផ្ទៀងផ្ទាត់តំណភ្ជាប់ឯកសារខាងក្នុងទាំងអស់នៅតែដំណើរការ

---

### [v3.4.0] - 2025-10-24

#### ការពិនិត្យមើល និងការផ្ទៀងផ្ទាត់រចនាសម្ព័ន្ធ
**កំណែនេះណែតពីការគាំទ្រពេញលេញសម្រាប់មុខងារពិនិត្យមើល infrastructure ថ្មីរបស់ Azure Developer CLI និងពង្រឹងបទពិសោធន៍អ្នកប្រើវគ្គបណ្តុះបណ្តាល។**

#### បានបន្ថែម
- **🧪 ឯកសារមុខងារ azd provision --preview**: គ្របដណ្តប់ពេញលេញលើមុខងារពិនិត្យមើល infrastructure ថ្មី
  - ឯកសារបញ្ជាសម្ងាត់និងឧទាហរណ៍ប្រើប្រាស់ក្នុង cheat sheet
  - ដំណើរការផ្តល់ការបង្រួបបង្រួមក្នុងមគ្គុទេសក៍ provision មានករណីប្រើ និងអត្ថប្រយោជន៍
  - ការត្រួតពិនិត្យមុនពេលដាក់បញ្ចូលសម្រាប់ការផ្ទៀងផ្ទាត់ល្អប្រសើរ
  - ថ្មីក្នុងមគ្គុទេសក៍ចាប់ផ្តើមជាមួយអនុវត្តន៍ដាក់បញ្ចូលដោយផ្តល់សុវត្ថិភាពជាមុន
- **🚧 បថបេសកកម្មស្ថានភាពវគ្គបណ្តុះបណ្តាល**: បថបេសកកម្ម HTML កម្រិតវិជ្ជាជីវៈបង្ហាញស្ថានភាពអភិវឌ្ឍន៍វគ្គបណ្តុះបណ្តាល
  - រចនាទ្រនិច gradient ជាមួយសញ្ញាសង់សឹងសង់សាងសម្រាប់ទំនាក់ទំនងច្បាស់លាស់ទៅអ្នកប្រើ
  - ម៉ោងកំណត់ពេលបច្ចុប្បន្នភាពចុងក្រោយសម្រាប់ភាពត្រង់តែ
  - រចនាបទប្រើប្រាស់ឆ្លាតប្លែតសម្រាប់ឧបករណ៍គ្រប់ប្រភេទ

#### បានធ្វើអោយប្រសើរ
- **សុវត្ថិភាពរចនាសម្ព័ន្ធ**: ម៉ូឌុលពិនិត្យមើលត្រូវបានបញ្ចូលនៅទូទាំងឯកសារដាក់បញ្ចូល
- **ការផ្ទៀងផ្ទាត់មុនដាក់បញ្ចូល**: បច្ចេកទេសស្ព្រូវស្វ័យប្រវត្តិគ្រប់គ្រងការពិនិត្យមើល infrastructure
- **ការប្រតិបត្តិការអ្នកអភិវឌ្ឍន៍**: បញ្ជាលំដាប់លេខបច្ចុប្បន្នភាពរួមបញ្ចូលមុខងារពិនិត្យមើលជាអនុវត្តល្អបំផុត
- **បទពិសោធន៍វគ្គបណ្តុះបណ្តាល**: កំណត់ការរំពឹងទុកច្បាស់លាស់សម្រាប់អ្នកប្រើអំពីស្ថានភាពអភិវឌ្ឍន៍មាតិភាព

#### បានផ្លាស់ប្តូរ
- **អនុវត្តល្អបំផុតក្នុងការដាក់បញ្ចូល**: វិធីសាស្រ្ត preview-first បានផ្តល់អនុសាសន៍សមរម្យ
- **ដំណើរការឯកសារ**: បានផ្លាស់ប្តូរតំណភ្ជាប់ត្រង់មុននៃការពិនិត្យមើល infrastructure របស់ហ្វ្លូទ្វារបង្រៀន
- **ការបង្ហាញវគ្គបណ្តុះបណ្តាល**: ការចែកចាយស្ថានភាពវិជ្ជាជីវៈជាមួយពេលវេលាអភិវឌ្ឍន៍ច្បាស់លាស់

#### បានធ្វើអោយប្រសើរ
- **វិធីសាស្រ្តសុវត្ថិភាពជាមុន**: ការផ្លាស់ប្តូររចនាសម្ព័ន្ធអាចបញ្ចាក់ទៅចុះមុនពេលដាក់បញ្ចូល
- **ការសហការទៅក្រុម**: លទ្ធផល preview អាចចែករំលែកសម្រាប់ពិនិត្យ និងអនុម័ត
- **ការយល់ដឹងទាំងថ្លៃថ្នូរ**: ការយល់ដឹងល្អជាងមុនអំពីថ្លៃថ្នូរ​ឧបករណ៍មុនពេល provision
- **ការកាត់បន្ថយហានិភ័យ**: ការកាត់បន្ថយការបរាជ័យដាក់បញ្ចូលតាមរយៈការផ្ទៀងផ្ទាត់មុន

#### ការអនុវត្តបច្ចេកទេស
- **ការបញ្ចូលឯកសារជាច្រើន**: មុខងារពិនិត្យមើលត្រូវបានឯកសារជា៤ឯកសារសំខាន់ៗ
- **គំរូបញ្ជា**: វិធីសាស្រ្តសន្ទស្សន៍តែមួយ និងឧទាហរណ៍ទាំងអស់ក្នុងឯកសារ
- **ការចូលរួមតាមអនុវត្តល្អ**: មុខងារពិនិត្យមើលត្រូវបានបញ្ចូលក្នុងរបៀប validate និង script
- **សញ្ញាផ្ទាល់**: សញ្ញាថ្មី NEW ងាយស្រួលរកឃើញ

#### វគ្គបណ្តុះបណ្តាលរចនាសម្ព័ន្ធ
- **ការចែកចាយស្ថានភាព**: បថបេសកកម្ម HTML វិជ្ជាជីវៈជាមួយរចនាស្ទីល gradient
- **បទពិសោធន៍អ្នកប្រើ**: ការបង្ហាញស្ថានភាពអភិវឌ្ឍន៍ច្បាស់លាស់ដើម្បីចៀសវាងការជ្រុលជ្រុល
- **ការបង្ហាញវិជ្ជាជីវៈ**: រក្សាកេរ្តិ៍ឈ្មោះ repository ខណៈពេលកំណត់ចំណាំ
- **ភាពត្រង់តែរបស់ពេលវេលា**: ម៉ោងកំណត់ថ្ងៃទី 2025 ខែតុលាល่าสุดទាន់ពេល

### [v3.3.0] - 2025-09-24

#### សម្ភារៈវគ្គបណ្តុះបណ្តាលមានការពង្រឹង និងបទពិសោធន៍រៀននឹងអន្តរកម្ម
**កំណែនេះណែតពីការបន្ថែមសម្ភារៈវគ្គបណ្តុះបណ្តាលជាមួយមាគ៌ាអ្នកប្រើប្រាស់តាមbrowser និងផ្លូវរៀនដំណើរការតាមលំដាប់។

#### បានបន្ថែម
- **🎥 មគ្គុទេសក៍វគ្គបណ្តុះបណ្តាលអន្តរកម្ម**: បទពិសោធន៍វគ្គបណ្តុះបណ្តាលតាម browser ជាមួយមុខងារពិនិត្យមើល MkDocs
- **📝 សេចក្ដីណែនាំវគ្គបណ្តុះបណ្តាលតាមដំណាក់កាល**: ផ្លូវរៀន 7 ជំហានពីការស្វែងរកទៅការប្តូរតាមតម្រូវការ
  - 0-សេចក្ដីណែនាំ: សង្ខេបវគ្គបណ្តុះបណ្តាល និងការតំឡើង
  - 1-ជ្រើសរើសពុម្ពតំណ AI: ការស្វែងរកពុម្ព និងវិធីជ្រើសតំណ
  - 2-ផ្ទៀងផ្ទាត់ពុម្ព AI: វិធីដាក់បញ្ចូល និងផ្ទៀងផ្ទាត់
  - 3-ពិនិត្យពុម្ព AI: ការយល់ដឹងឯកត្តសម្ព័ន្ធរចនា
  - 4-កំណត់បំពាក់ពុម្ព AI: ការកំណត់តម្លៃ និងប្ដូរតាមតម្រូវការ
  - 5-ប្ដូរតាមតម្រូវការពុម្ព AI: ការប្ដូរតាមកម្រិតខ្ពស់ និងការបោសសម្អាត
  - 6-សម្អាតរចនាសម្ព័ន្ធ: ការសម្អាត និងគ្រប់គ្រងធនធាន
  - 7-ចប់វគ្គ: សេចក្ដីសង្ខេប និងជំហានបន្ទាប់
- **🛠️ សម្ភារៈធ្វើការវគ្គបណ្តុះបណ្តាល**: ការកំណត់ MkDocs ជាមួយ theme Material សម្រាប់បទពិសោធន៍រៀនល្អប្រសើរ
- **🎯 ផ្លូវរៀនប្រើប្រាស់ដៃ**: វិធីសាស្រ្ត 3 ជំហាន (ស្វែងរក → ដាក់បញ្ចូល → ប្ដូរតាមតម្រូវការ)
- **📱 ជំរុញ GitHub Codespaces**: ការតំឡើងបរិយាកាសអភិវឌ្ឍន៍ដោយរលូន

#### បានពង្រឹង
- **មន្ទីរពិសោធន៍ AI**: ពង្រីកជាមួយបទពិសោធន៍រៀនមានរចនាសម្ព័ន្ធ 2-3 ម៉ោង
- **ឯកសារវគ្គបណ្តុះបណ្តាល**: ការបង្ហាញវិជ្ជាជីវៈមានរួមទាំងទេសចរណ៍ និងគំនូរ
- **ជំហានរៀន**: ការណែនាំជាបន្តបន្ទាប់ច្បាស់ពីការជ្រើសរើសពុម្ពដល់ការដាក់បញ្ចូលផលិតកម្ម
- **បទពិសោធន៍អ្នកអភិវឌ្ឍ**: ដំណើរការបែបការងាររួមបញ្ចូលឧបករណ៍ជំនួយ

#### បានធ្វើអោយប្រសើរ
- **ការចូលរួមសម្រួល**: មុខងារតាម browser ជាមួយការស្វែងរក លុបចម្លង និងផ្លាស់ប្ដូរមុខងារ theme
- **ការរៀនដោយឯកជន**: រចនាសម្ព័ន្ធវគ្គបណ្តុះបណ្តាលអាចបត់បែនតាមល្បឿនរៀនលឿន ឬយឺត
- **ការអនុវត្តជាក់ស្ដែង**: ករណីដាក់បញ្ចូលពុម្ព AI ដំណើរការពិតប្រាកដ
- **ការរួមចំណែកសហគមន៍**: ជំហានរួមបញ្ចូល Discord សម្រាប់គាំទ្រវគ្គបណ្តុះបណ្តាល និងកិច្ចការសហការណ៍

#### លក្ខណៈវគ្គបណ្តុះបណ្តាល
- **ការស្វែងរករួមបញ្ចូល**: ស្វែងរកពាក្យគន្លឹះ និងមេរៀនយ៉ាងងាយស្រួល
- **ចម្លងប្លុកកូដ**: មុខងារចម្លងពេលហៅបានសម្រាប់គំរូកូដទាំងអស់
- **ប្ដូរមុខងារ theme**: គាំទ្រទស្សនវិស័យងងឹត/ពន្លឺសម្រាប់ចំណូលចិត្តខុសគ្នា
- **ទ្រព្យសកម្មជាមានភ្លាម**: រូបច្បាប់ និងគំនូរច្បាស់សម្រាប់ការយល់ដឹងល្អ
- **ការរួមបញ្ចូលជំនួយ**: ចូលដំណើរការ Discord ដោយផ្ទាល់សម្រាប់គាំទ្រសហគមន៍

### [v3.2.0] - 2025-09-17

#### ការបម្លែងរចនាសម្ព័ន្ធទេសចរណ៍ និងប្រព័ន្ធរៀនលើមូលដ្ឋានជំពូក
**កំណែនេះណែតពីការបង្កើតរចនាសម្ព័ន្ធរៀនជំពូកពហុមុខងារជាមួយទេសចរណ៍រឹងមាំនៅទាំងមូល repository។**

#### បានបន្ថែម
- **📚 ប្រព័ន្ធរៀនលើមូលដ្ឋានជំពូក**: រៀបចំវគ្គសិក្សាមកជា 8 ជំពូករៀនជាតម្លៃឡើង
  - ជំពូក 1: មូលដ្ឋាន និងចាប់ផ្តើមយ៉ាងឆាប់រហ័ស (⭐ - 30-45 នាទី)
  - ជំពូក 2: ការអភិវឌ្ឍរូបភាព AI ជាដំបូង (⭐⭐ - 1-2 ម៉ោង)
  - ជំពូក 3: ការកំណត់តម្លៃ និងការផ្ទៀងផ្ទាត់ (⭐⭐ - 45-60 នាទី)
  - ជំពូក 4: រចនាសម្ព័ន្ធជាគំរូកូដ និងការដាក់បញ្ចូល (⭐⭐⭐ - 1-1.5 ម៉ោង)
  - ជំពូក 5: ដំណោះស្រាយ AI ជាជាអ្នកតំណាងច្រើន (⭐⭐⭐⭐ - 2-3 ម៉ោង)
  - ជំពូក 6: ការផ្ទៀងផ្ទាត់មុនដាក់បញ្ចូល និងផែនការ (⭐⭐ - 1 ម៉ោង)
  - ជំពូក 7: ដោះស្រាយបញ្ហា និងគ្រប់គ្រងកំហុស (⭐⭐ - 1-1.5 ម៉ោង)
  - ជំពូក 8: លំនាំផលិតកម្ម និងសហគ្រាស (⭐⭐⭐⭐ - 2-3 ម៉ោង)
- **📚 ប្រព័ន្ធទេសចរណ៍រៀនពេញលេញ**: ចំណងជើងទេសចរណ៍ និងជើងទំព័រដូចគ្នាទៅគ្នាទាំងអស់ឯកសារ
- **🎯 ការតាមដានផលប័ត្រ**: បញ្ចីតារាងបញ្ចប់វគ្គសិក្សា និងប្រព័ន្ធផ្ទៀងផ្ទាត់ការរៀន
- **🗺️ ការណែនាំផ្លូវរៀន**: ចំណុចចូលច្បាស់លាស់សម្រាប់កម្រិតបទពិសោធន៍ និងគោលបំណងខុសគ្នា
- **🔗 ទេសចរណ៍ប្រើប្រាស់តំណភ្ជាប់ឆ្លង**: ជំពូកដែលពាក់ព័ន្ធ និងលក្ខខណ្ឌមុនច្បាស់លាស់

#### បានពង្រឹង
- **រចនាសម្ព័ន្ធ README**: បម្លែងទៅជាវេទិការរៀនដែលមានរចនា​ជំពូកជាសហគ្រិន
- **ទេសចរណ៍ឯកសារ**: ទំព័រនីមួយៗមានបទបញ្ជាបច្ចុប្បន្នភាព និងការណែនាំជំពូក
- **ការរៀបចំទម្រង់**: គំរូ និងពុម្ពគេត្រូវបានដាក់ទៅជំពូករៀនសមស្រប
- **ការចូលរួមធនធាន**: សន្លឹក cheat sheet, សំណួរញែក, និងមគ្គុទេសក៍សិក្សាត្រូវបានភ្ជាប់ទៅជំពូកដែលពាក់ព័ន្ធ
- **ការរួមបញ្ចូលវគ្គបណ្តុះបណ្តាល**: មន្ទីរពិសោធន៍ជាដៃដែលភ្ជាប់ទៅគោលបំណងរៀនជាច្រើនជំពូក

#### បានផ្លាស់ប្តូរ
- **ជំហានរៀន**: បានផ្លាស់ពីឯកសារតាមបណ្ដោយទៅការរៀនជំពូកដែលបត់បែនបាន
- **ទីតាំងកំណត់តម្លៃ**: មានការផ្លាស់ទីការណែនាំកំណត់តម្លៃទៅជំពូក 3 ដើម្បីមានលំនាំរៀនល្អប្រសើរ
- **ការរួមបញ្ចូលមាតិភាព AI**: ការរួមបញ្ចូលល្អប្រសើរនៃមាតិភាព AI ទូទាំងផ្លូវរៀន
- **មាតិភាពផលិតកម្ម**: លំនាំកម្រិតខ្ពស់ត្រូវបានបញ្ចូលខ្លុសក្នុងជំពូក 8 សម្រាប់អ្នករៀនសហគ្រាស

#### បានធ្វើអោយប្រសើរ
- **បទពិសោធន៍អ្នកប្រើ**: បន្ទាត់សេវាត្រួតពិនិត្យច្បាស់ និងសញ្ញាការជំពូក
- **ភាពចូលដល់ងាយស្រួល**: វិធីសាស្រ្តទេសចរណ៍តែមួយសំរាប់បង្រៀនល្អ
- **ការបង្ហាញវិជ្ជាជីវៈ**: រចនាសម្ព័ន្ធវគ្គសិក្សាគ្រឹះស្ថានសមរម្យសម្រាប់វគ្គបណ្តុះបណ្តាលសិក្សា និងក្រុមហ៊ុន
- **ការសម្រួលប្រសិទ្ធភាព**: កាត់បន្ថយពេលវេលាចាប់ផ្តើមរកមាតិភាពត្រឹមត្រូវតាមរចនា​ល្អប្រសើរ

#### ការអនុវត្តបច្ចេកទេស
- **ចំណងជើងទេសចរណ៍**: កំណត់ជំពូកទេសចរណ៍ស្តង់ដារនៅលើឯកសារពហុ 40+
- **បន្ទាត់ទេសចរណ៍ជើងទំព័រ**: ការណែនាំលំដាប់ការបន្តរៀន និងការសម្រេចកម្រិតជំពូកស្ទង់យ៉ាងគ្រប់គ្រាន់
- **ការតំណភ្ជាប់ឆ្លង**: ប្រព័ន្ធតំណភ្ជាប់ក្នុងយ៉ាងទូលំទូលាយភ្ជាប់គំនិតដែលពាក់ព័ន្ធ
- **ការរៀបចំជំពូក**: អ្នកសរសេរពុម្ព និងគំរូដាក់ស្របគ្នានឹងគោលបំណងរៀន

#### ការពង្រឹងមគ្គុទេសក៍សិក្សា
- **📚 គោលបំណងរៀនពេញលេញ**: ការរៀបចំមគ្គុទេសក៍សិក្សាឡើងវិញឲ្យត្រូវនឹងប្រព័ន្ធជំពូក 8
- **🎯 ការវាយតំលៃជំពូក**: ជំពូកនិមួយៗរួមបញ្ចូលគោលបំណងរៀនជាក់លាក់ និងលំហាត់ជាក់ស្ដែង
- **📋 ការតាមដានជំហាន**: កាលវិភាគរៀនប្រចាំសប្តាហ៍ជាមួយលទ្ធផលវាស់ស្ទង់ និងបញ្ជីត្រួតពិនិត្យ
- **❓ សំណួរ វាយតំលៃ**: សំណួរផ្ទៀងផ្ទាត់ចំណេះដឹងសម្រាប់ជំពូកនិមួយៗជាមួយលទ្ធផលវិជ្ជាជីវៈ
- **🛠️ លំហាត់ជាក់ស្ដែង**: សកម្មភាពដៃជាប់ជាមួយករណីដាក់បញ្ចូលពិតប្រាកដ និងដោះស្រាយបញ្ហា
- **📊 ការរីកចម្រើនជំនាញ**: ច្បាស់លាស់ពីមូលដ្ឋានដល់លំនាំសហគ្រាសក្នុងការអភិវឌ្ឍមុខរបរ
- **🎓 ស៊េរីវិញ្ញាបនបត្រ**: លទ្ធផលអភិវឌ្ឍវិជ្ជាជីវៈ និងប្រព័ន្ធទទួលស្គាល់សហគមន៍
- **⏱️ ការគ្រប់គ្រងពេលវេលា**: ផែនការរៀន 10 សប្តាហ៍ដែលមានការផ្ទៀងផ្ទាត់គន្លងមុខ

### [v3.1.0] - 2025-09-17

#### ដំណោះស្រាយ Multi-Agent AI បានពង្រីក
**កំណែនេះធ្វើការកែលម្អដំណោះស្រាយលក់រាយMulti-Agent ជាមួយការកំណត់ឈ្មោះ agents ល្អប្រសើរជាងមុន និងឯកសារដែលបានបង្កើតឡើងវិញ។**

#### បានផ្លាស់ប្តូរ
- **ពាក្យជាមួយភ្នាក់ងារច្រើន**: បានប្តូរ "ភ្នាក់ងារកូរ៉ា" ជា "ភ្នាក់ងារអតិថិជន" ក្នុងដំណោះស្រាយភ្នាក់ងារច្រើនលក់រាយសម្រាប់ការយល់ដឹងច្បាស់លាស់
- **រចនាសម្ព័ន្ធភ្នាក់ងារ**: បានធ្វើបច្ចុប្បន្នភាពឯកសារ ទំរង់ ARM និងឧទាហរណ៍កូដទាំងអស់ដោយប្រើឈ្មោះ "ភ្នាក់ងារអតិថិជន" ដែលសមរម្យ
- **ឧទាហរណ៍កំណត់រចនាសម្ព័ន្ធ**: បានធ្វើឱ្យទំនើបនូវលំនាំកំណត់រចនាសម្ព័ន្ធភ្នាក់ងារជាមួយនឹងការប្រើប្រាស់ឈ្មោះថ្មី
- **ការត្រូវគ្នានៃឯកសារ**: បានធ្វើឱ្យប្រាកដថា ឯកសារទាំងអស់ប្រើឈ្មោះភ្នាក់ងារដែលមានបែបបទវិជ្ជាជីវៈ និងពណ៌នាថា

#### កែលម្អ
- **កញ្ចប់ទំរង់ ARM**: បានបច្ចុប្បន្នភាព retail-multiagent-arm-template ជាមួយឈ្មោះភ្នាក់ងារអតិថិជន
- **គំនូរស្ថាបត្យកម្ម**: បានធ្វើបច្ចុប្បន្នភាពគំនូរ Mermaid ជាមួយឈ្មោះភ្នាក់ងារថ្មី
- **ឧទាហរណ៍កូដ**: ថ្នាក់ Python និងឧទាហរណ៍អនុវត្តកំពុងប្រើឈ្មោះ CustomerAgent
- **អថេរបរិដ្ឋាន**: បានបច្ចុប្បន្នភាពស្ក្រ៊ីបចាត់ចែងទាំងអស់ដោយប្រើ convention CUSTOMER_AGENT_NAME

#### កែលម្អបន្ថែម
- **បទពិសោធន៍អ្នកអភិវឌ្ឍន៍**: ប្រាប់តួនាទី និងទំនួលខុសត្រូវភ្នាក់ងារឲ្យច្បាស់ក្នុងឯកសារ
- **ភាពរួមតំរូវផលិត**: ធ្វើឱ្យសមរម្យជាងមុនជាមួយ convention ឈ្មោះក្រុមហ៊ុន
- **សម្ភារៈណែនាំការសិក្សា**: ឈ្មោះភ្នាក់ងារ បែបងាយយល់សម្រាប់គោលបំណងការសិក្សា
- **ភាពងាយស្រួលប្រើទំរង់**: ធ្វើឱ្យយល់ភ្លាមៗពីមុខងារនិងលំនាំចាត់ចែងភ្នាក់ងារ

#### ព័ត៌មានបច្ចេកទេស
- បានធ្វើបច្ចុប្បន្នភាពគំនូរស្ថាបត្យកម្ម Mermaid ជាមួយយោងទៅ CustomerAgent
- បានប្ដូរឈ្មោះថ្នាក់ CoraAgent ទៅជា CustomerAgent ក្នុងឧទាហរណ៍ Python
- បានកែប្រែការកំណត់រចនាសម្ព័ន្ធ JSON ទំរង់ ARM ដើម្បីប្រើប្រភេទភ្នាក់ងារ "customer"
- បានធ្វើបច្ចុប្បន្នភាពអថេរបរិដ្ឋានពី CORA_AGENT_* ទៅ CUSTOMER_AGENT_*
- បានបច្ចុប្បន្នភាពពាក្យបញ្ជាចាត់ចែង និងការកំណត់រចនាសម្ព័ន្ធcontainers ទាំងអស់

### [v3.0.0] - 2025-09-12

#### ការផ្លាស់ប្តូរធំៗ - ផ្តោតលើអ្នកអភិវឌ្ឍ AI និងការរួមបញ្ចូល Microsoft Foundry
**ជំនាន់នេះបម្លែងធ្វើឲ្យឃ្លាំងកូដក្លាយជា ឧបករណ៍រៀន AI សកម្មដែលរួមបញ្ចូល Microsoft Foundry ដោយសាំង**

#### បានបន្ថែម
- **🤖 ផ្លូវការរៀន AI ជាដើម**: រៀបចំឡើងវិញពេញលេញតាមការសំរេចចិត្តអ្នកអភិវឌ្ឍន៍ និងវិស្វករ AI
- **មគ្គុទ្ទភណ្ឌរួមបញ្ចូល Microsoft Foundry**: ឯកសារពេញលេញសម្រាប់ភ្ជាប់ AZD ជាមួយសេវា Microsoft Foundry
- **លំនាំចែកចាយម៉ូដែល AI**: មគ្គុទ្ទភណ្ឌពិពណ៌នាអំពីការជ្រើសរើសម៉ូដែល កំណត់រចនាសម្ព័ន្ធ និងយុទ្ធសាស្ត្រផលិត
- **ម្រងសិក្សាសិក្សា AI**: ព្រឹត្តិការណ៍ផ្ទាល់ខ្លួនរយៈពេល 2-3 ម៉ោងសម្រាប់បម្លែងកម្មវិធី AI ទៅជាវិធីសាស្ត្រដាក់បញ្ចូល AZD
- **ជំហានល្អបំផុត AI ផលិតកម្ម**: លំនាំសម្រាប់ជំរុញ យកចិត្តទុកដាក់ និងសន្តិសុខសម្រាប់បន្ទុក AI សម្រាប់សហគ្រាស
- **មគ្គុទ្ទភណ្ឌដោះស្រាយបញ្ហារួម AI**: ការដោះស្រាយបញ្ហាពេញលេញសម្រាប់ម៉ូដែល Microsoft Foundry, សេវាកម្ម Cognitive, និងបញ្ហាផ្តល់ AI
- **កន្សោមទំរង់ AI**: ការប្រមូលផ្តុំទំរង់ Microsoft Foundry ជាមួយការវាយតម្លៃភាពស្មុគស្មាញ
- **សម្ភារៈវគ្គសិក្សា**: រៀបចំរចនាសម្ព័ន្ធវគ្គសិក្សាសកម្មជាមួយមន្ទីរពហុកាលបុរេប្រព័ន្ធ និងសម្ភារៈយោង

#### កែលម្អ
- **រចនាសម្ព័ន្ធ README**: ផ្តោតលើអ្នកអភិវឌ្ឍ AI ជាមួយទិន្នន័យចំណង់ចំណូលចិត្តសហគមន៍ 45% ពី Discord Microsoft Foundry
- **ផ្លូវការរៀន**: ធ្វើដំណើរអភិវឌ្ឍ AI ផ្ទាល់ នៅជាមួយផ្លូវការលំនាំបុរេបុណ្យសម្រាប់សិស្សនិងវិស្វករ DevOps
- **ការផ្ដល់អនុសាសន៍ទំរង់**: ទំរង់ AI ពិសេស រួមមាន azure-search-openai-demo, contoso-chat, និង openai-chat-app-quickstart
- **ការរួមបញ្ចូលសហគមន៍**: ការគាំទ្ររបស់ Discord ទាំងស្រុងជាមួយបន្ទប់និងការពិភាក្សា AI ជាក់លាក់

#### ផ្នែកសន្តិសុខ និងភាពរួមតំរូវផលិត
- **លំនាំអត្តសញ្ញាណគ្រប់គ្រង**: កំណត់សុវត្ថិភាព និងអត្តសញ្ញាណ AI ជាក់លាក់
- **ការកែលម្អថ្លៃដើម**: តាមដានការប្រើប្រាស់ token និងគ្រប់គ្រងថវិកាសម្រាប់បន្ទុក AI
- **ការចេញផ្សាយច្រើនតំបន់**: យុទ្ធសាស្រ្តសម្រាប់ការចេញផ្សាយកម្មវិធី AI ជាសកល
- **ត្រួតពិនិត្យសមត្ថភាព**: ចំណុចគិត AI ជាក់លាក់ និងការរួមបញ្ចូល Application Insights

#### គុណភាពឯកសារ
- **រចនាសម្ព័ន្ធវគ្គរៀនបន្តបន្ទាប់**: សម្រួលដោយហេតុផល ពីអ្នកចាប់ផ្តើម ដល់លំនាំ AI កម្រិតខ្ពស់
- **URL បានផ្ទៀងផ្ទាត់**: តំណភ្ជាប់ខាងក្រៅទាំងអស់ត្រូវបានផ្ទៀងផ្ទាត់ និងអាចចូលដំណើរការ
- **យោងពេញលេញ**: តំណភ្ជាប់ក្នុងឯកសារទាំងអស់បានផ្ទៀងផ្ទាត់ និងប្រតិបត្តិបាន
- **រួចរាល់សម្រាប់ផលិតកម្ម**: លំនាំចែកចាយសម្រាប់សហគ្រាសជាមួយឧទាហរណ៍ពិត

### [v2.0.0] - 2025-09-09

#### ការផ្លាស់ប្តូរធំៗ - ការរៀបចំឃ្លាំងកូដឡើងវិញ និងកែលម្អវិជ្ជាជីវៈ
**ជំនាន់នេះតំណាងឱ្យការផ្លាស់ប្តូរយ៉ាងសំខាន់នៃរចនាសម្ព័ន្ធឃ្លាំងកូដ និងការតំណាងមាតិកា។**

#### បានបន្ថែម
- **ស៊េរីសិក្សាដ៏មានរចនាសម្ព័ន្ធខ្ពស់**: ទំព័រឯកសារទាំងអស់បានរួមបញ្ចូលជំពូកបើកមុខ គោលបំណងសិក្សា និងលទ្ធផលសិក្សា
- **ប្រព័ន្ធមេនុយ**: បន្ថែមតំណប្រាកដ/បន្ទាប់ជាការណែនាំលំដាប់រៀនកាត់ឯកសារទាំងអស់
- **មគ្គុទ្ទភណ្ឌសិក្សា**: study-guide.md ពេញលេញ ជាមួយគោលដៅសិក្សា លំហាត់បណ្តុះបណ្តាល និងសម្ភារៈប៉ាន់ស្មាន
- **ការនាំមុខវិជ្ជាជីវៈ**: ដកហូតរូបតំណាងអេមូជិគ្រប់គ្រងសម្រាប់ភាពឆ្លាតវៃ និងរូបរាងវិជ្ជាជីវៈ
- **រចនាសម្ព័ន្ធមាតិកាបន្ថែម**: កែលម្អការរៀបចំនិងលំហាត់សិក្សា

#### បានប្ដូរ
- **ទ្រង់ទ្រាយឯកសារ**: មានវាយតម្លៃឯកសារទាំងអស់ជាមួយរចនាសម្ព័ន្ធផ្តោតលើការសិក្សា
- **លំហាត់រៀងលំដាប់**: អនុវត្តន៍ដំណើរការយុទ្ធសាស្ត្រលំដាប់តាមផ្លូវការសម្រាប់មាតិកាសិក្សាទាំងអស់
- **ការបង្ហាញមាតិកា**: ដកហូតធាតុអរិភាពសម្រាប់ទ្រង់ទ្រាយច្បាស់លាស់ និងវិជ្ជាជីវៈ
- **រចនាសម្ព័ន្ធតំណភ្ជាប់**: បច្ចុប្បន្នភាពតំណភ្ជាប់ក្នុងឯកសារទាំងអស់ដើម្បីគាំទ្រការស្វែងរកថ្មី

#### កែលម្អបន្ថែម
- **ភាពងាយប្រើ**: ដកហូតការពឹងផ្អែកលើអេមូជិសម្រាប់ការគាំទ្រប្រព័ន្ធអានអេក្រង់បានល្អប្រសើរ
- **រូបរាងវិជ្ជាជីវៈ**: បង្ហាញរូបរាងវគ្គសិក្សាបែបសាកល្បងសម្រាប់ការសិក្សាសហគ្រាស
- **បទពិសោធន៍ការរៀន**: វិធីសាស្ត្ររៀបចំបន្តបន្ទាប់ មានគោលដៅ និងលទ្ធផលច្បាស់លាស់សម្រាប់មេរៀននីមួយៗ
- **ការរៀបចំបែបមាតិកា**: បណ្តុះបណ្តាលដោយប្រើហេតុផល និងភ្ជាប់គ្នានៃមុខវិជ្ជាទាក់ទង

### [v1.0.0] - 2025-09-09

#### ការចេញផ្សាយដំបូង - ឃ្លាំងកូដរៀន AZD ពេញលេញ

#### បានបន្ថែម
- **រចនាសម្ព័ន្ធឯកសារជាផ្នែកមួយ**
  - ស៊េរីមគ្គុទ្ទភណ្ឌបើកផ្សាយចាប់ផ្តើមពេញលេញ
  - ឯកសារផ្ដល់ព័ត៌មានចេញផ្សាយ និងបញ្ជូន
  - សាមញ្ញជួយដោះស្រាយបញ្ហានិងមគ្គុទ្ទភណ្ឌដំណោះស្រាយកំហុស
  - សម្ភារៈផ្ទៀងផ្ទាត់ជាមុនសម្រាប់ការចេញផ្សាយ

- **ម៉ូឌុលចាប់ផ្តើមប្រើ**
  - AZD មូលដ្ឋាន: គំនិត និងពាក្យបញ្ជាចម្បង
  - មគ្គុទ្ទភណ្ឌដំឡើង: សេចក្តីណែនាំដំឡើងតាមវេទិកា
  - មគ្គុទ្ទភណ្ឌកំណត់រចនាសម្ព័ន្ធ: ការកំណត់បរិដ្ឋាន និងអត្តសញ្ញាណភាព
  - មេរៀនគម្រោងដំបូង: ហាត់ដំណើរការជាក់លាក់ជាដំណាក់កាល

- **ម៉ូឌុលចេញផ្សាយ និងបញ្ជូន**
  - មគ្គុទ្ទភណ្ឌចេញផ្សាយ: ឯកសារការងារពេញលេញ
  - មគ្គុទ្ទភណ្ឌបញ្ជូន: រចនាសម្ព័ន្ធ Infrastructure as Code ជាមួយ Bicep
  - វិធានការល្អបំផុតសម្រាប់ការចេញផ្សាយផលិតកម្ម
  - លំនាំស្ថាបត្យកម្មសេវាចម្រុះ

- **ម៉ូឌុលផ្ទៀងផ្ទាត់មុនចេញផ្សាយ**
  - ការធ្វើផែនការថាមពល: ផ្ទៀងផ្ទាត់ធនធាន Azure
  - ការជ្រើសរើស SKU: សេចក្ដីណែនាំសេវាផ្នែកលម្អិត
  - ការត្រួតពិនិត្យមុនហោះហើរ: ស្ក្រ៊ីបផ្ទៀងផ្ទាត់ស្វ័យប្រវត្តិ (PowerShell និង Bash)
  - ឧបករណ៍វាយតម្លៃថ្លៃដើម និងផែនការថវិកា

- **ម៉ូឌុលដោះស្រាយបញ្ហា**
  - បញ្ហាទូទៅ: បញ្ហានិងដំណោះស្រាយដែលជួបប្រទៈជាញឹកញាប់
  - មគ្គុទ្ទភណ្ឌដោះស្រាយកំហុស: វិធីវែងការដោះស្រាយបញ្ហា
  - បច្ចេកទេស និងឧបករណ៍វាយតម្លៃខ្ពស់
  - ត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាព

- **ធនធាន និងយោង**
  - បញ្ជីពាក្យបញ្ជា: ឯកសារយោងលឿនសម្រាប់បញ្ជា
  - ពាណិជ្ជកម្ម: ពាក្យ និងការបំភ្លឺសេចក្ដីពិពណ៌នា
  - FAQ: ចម្លើយលម្អិតដោយផ្អែកលើសំណួរជាញឹកញាប់
  - តំណភ្ជាប់ធនធានខាងក្រៅ និងការចូលរួមសហគមន៍

- **ឧទាហរណ៍ និងទំរង់**
  - ឧទាហរណ៍កម្មវិធីវេបសាយសាមញ្ញ
  - ទំរង់ចេញផ្សាយគេហទំព័រមិនផ្លាស់ប្ដូរ
  - កំណត់រចនាសម្ព័ន្ធកម្មវិធី containers
  - លំនាំឌីតាបេសរ
  - ឧទាហរណ៍ស្ថាបត្យកម្មសេវាកម្មតូចៗ
  - អនុវត្តមុខងារឥតបម្រុង

#### គុណសម្បត្តិ
- **គាំទ្រពហុវេទិកា**: សេចក្ដីណែនាំដំឡើង និងកំណត់រចនាសម្ព័ន្ធសម្រាប់ Windows, macOS និង Linux
- **កំរិតជំនាញច្រើន**: មាតិកាអនុវត្តសម្រាប់សិស្ស ដល់អ្នកអភិវឌ្ឍន៍វិជ្ជាជីវៈ
- **ផ្នែកអនុវត្តពហុវិជ្ជាជីវៈ**: ឧទាហរណ៍អនុវត្ត និងស្ថានការណ៍ពិត
- **កម្មវិធីគ្រប់គ្រាន់**: ពីគំនិតមូលដ្ឋាន ទៅលំនាំកម្រិតចុងក្រោយសម្រាប់សហគ្រាស
- **ផ្នែកប្រយោជន៍សន្តិសុខជាមុន**: អនុវត្តលំនាំសន្តិសុខទាំងស្រុង
- **ការត្រួតពិនិត្យថ្លៃដើម**: មគ្គុទ្ទភណ្ឌសម្រាប់ចំណាយឥតសម្តៅនិងការគ្រប់គ្រងធនធាន

#### គុណភាពឯកសារ
- **ឧទាហរណ៍កូដលម្អិត**: ឧទាហរណ៍កូដអនុវត្តន៍ បានតេស
- **ការណែនាំជាដំណាក់កាល**: ការណែនាំច្បាស់លាស់ និងអាចអនុវត្តបាន
- **ការដោះស្រាយកំហុសពេញលេញ**: ចំណុចបញ្ហាទូទៅបានដោះស្រាយ
- **ការរួមបញ្ចូលលំនាំល្អបំផុត**: ស្តង់ដារឧស្សាហកម្ម និងការណែនាំ
- **ការចូលរួមជំនាន់ថ្មី**: ត្រូវបានបច្ចុប្បន្នភាពជាមួយសេវាកម្ម Azure និងលក្ខណៈពិសេស azd ថ្មីៗ

## សេចក្តីផែនការកែលម្អថ្ងៃខាងមុខ

### ជំនាន់ 3.1.0 (ផែនការ)
#### ការពង្រីកវេទិកា AI
- **គាំទ្រម៉ូដែលច្រើន**: លំនាំរួមបញ្ចូលសម្រាប់ Hugging Face, Azure Machine Learning, និងម៉ូដែលផ្ទាល់ខ្លួន
- **ស៊េរីផ្នែកភ្នាក់ងារ AI**: ទំរង់សម្រាប់ LangChain, Semantic Kernel, និង AutoGen
- **លំនាំ RAG កម្រិតខ្ពស់**: ជម្រើសមូលដ្ឋានទិន្នន័យវ៉ិចទ័រលើស Azure AI Search (Pinecone, Weaviate, ល
- **ការត្រួតពិនិត្យ AI**: ការត្រួតពិនិត្យលម្អិតសម្រាប់ប្រសិទ្ធភាពម៉ូដែល ការប្រើប្រាស់ token និងគុណភាពការឆ្លើយតប

#### បទពិសោធន៍អ្នកអភិវឌ្ឍ
- **ផ្នែកបន្ថែមជំនួយ VS Code**: បញ្ចូល AZD + Microsoft Foundry
- **រួមបញ្ចូល GitHub Copilot**: ជំនួយ AI សម្រាប់បង្កើតទំរង់ AZD
- **វគ្គសិក្សាផ្ទាល់ខ្លួន**: លំហាត់កូដជាខ្លួនឯងមានការសុម្ភាសន៍ស្វ័យប្រវត្តិសម្រាប់ស្ថានការណ៍ AI
- **មាតិកាវីដេអូ**: វីដេអូមគ្គុទ្ទផ្តល់ជំនួយសម្រាប់អ្នករៀនមើលផ្តោតលើការចែកចាយ AI

### ជំនាន់ 4.0.0 (ផែនការ)
#### លំនាំ AI សហគ្រាស
- **រចនាសម្ព័ន្ធគ្រប់គ្រង**: ការគ្រប់គ្រងម៉ូដែល AI, ការអនុលោម និងការត្រួតពិនិត្យ
- **AI ច្រើនអតិថិជន**: លំនាំសម្រាប់បម្រើអតិថិជនជាច្រើនជាមួយសេវា AI ផ្ដាច់មុខ
- **ការចែកចាយ Edge AI**: រួមបញ្ចូលជាមួយ Azure IoT Edge និងកុងតឺន័រ
- **Cloud ចម្រុះ Hybrid AI**: លំនាំចែកចាយ AI ពហុខ្លោដ និងចម្រុះ

#### លក្ខណៈកម្រិតខ្ពស់
- **ស្វ័យប្រវត្តិផ្លូវលំនាំ AI**: រួមបញ្ចូល MLOps ជាមួយបណ្តារលំនាំ Azure Machine Learning
- **សន្តិសុខកម្រិតខ្ពស់**: លំនាំ Zero-trust, ចំណុចបញ្ចប់ឯកជន និងការពារ​បដិសេធជំនួស
- **ការបង្កើនប្រសិទ្ធភាព**: ការត្រឹមត្រូវ និងល្បឿនលឿនសម្រាប់កម្មវិធី AI មានថាមពលខ្ពស់
- **ការចែកចាយជាសកល**: ការប្រេីបមាតិកានិង cache នៅខាងផ្ចប់សម្រាប់កម្មវិធី AI

### ជំនាន់ 3.0.0 (ផែនការ) - ត្រូវបានជំនួសដោយចេញផ្សាយបច្ចុប្បន្ន
#### ការបន្ថែមដាក់បញ្ចូល - ឥឡូវបានអនុវត្តក្នុង v3.0.0
- ✅ **មាតិកាផ្តោតលើ AI**: រួមបញ្ចូល Microsoft Foundry ដោយពេញលេញ (បញ្ចប់)
- ✅ **វគ្គសិក្សាផ្ទាល់ខ្លួន**: មន្ទីរពហុកាល AI (បញ្ចប់)
- ✅ **ម៉ូឌុលសន្តិសុខកម្រិតខ្ពស់**: លំនាំសន្តិសុខ AI (បញ្ចប់)
- ✅ **ការបង្កើនប្រសិទ្ធភាព**: វិធានការចំណាយ AI (បញ្ចប់)

### ជំនាន់ 2.1.0 (ផែនការ) - រង់ចាំអនុវត្តក្នុង v3.0.0 ផ្នែកខ្លះៗ
#### កែលម្អតូចៗ - មានផ្នែកខ្លះបានបញ្ចប់ក្នុងចេញផ្សាយបច្ចុប្បន្ន
- ✅ **ឧទាហរណ៍បន្ថែម**: ស្ថានការណ៍ចាក់បញ្ចូល AI (បញ្ចប់)
- ✅ **FAQ ពង្រីក**: សំណួរនិងដោះស្រាយ AI (បញ្ចប់)
- **ការរួមបញ្ចូលឧបករណ៍**: មគ្គុទ្ទភណ្ឌIDE និងកម្មវិធីកែសម្រួល
- ✅ **ការពង្រីកការត្រួតពិនិត្យ**: លំនាំក្នុងការត្រួតពិនិត្យ AI និងប្រតិបត្តិការជូនដំណឹង (បញ្ចប់)

#### ផែនការនៅមុខ
- **ឯកសារភាសាយ៉ាងងាយស្រួលសម្រាប់ទូរស័ព្ទ**: រចនាប័ទ្មបំពេញការសិក្សាទូរស័ព្ទ
- **ការចូលប្រើដោយមិនត្រូវការបណ្ដាញ**: កញ្ចប់ឯកសារចុះទាំងអស់
- **ការរួមបញ្ចូល IDE បន្ថែម**: វារី VS Code សម្រាប់ AZD + លំហាត់ AI
- **ផ្ទាំងត្រូវបានគ្រប់គ្រងដោយសហគមន៍**: គណនេយ្យវាយតម្លៃ និងការចូលរួម

## ការរួមចំណែកដល់ Changelog

### របាយការណ៍ការផ្លាស់ប្តូរ
នៅពេលរួមចំណែកទៅឃ្លាំងកូដនេះ សូមប្រាកដថា បញ្ចូលការផ្លាស់ប្តូរដូចជា៖

1. **លេខជំនាន់**: តាមវិធីសាស្ត្រ semantic versioning (ធំ.តូច.បPatch)
2. **កាលបរិច្ឆេទ**: ថ្ងៃចេញផ្សាយឬថ្ងៃកែប្រែទ្រង់ទ្រាយ YYYY-MM-DD
3. **ប្រភេទ**: បានបន្ថែម, ប្ដូរ, បដិសេធ, ដកចេញ, ជួសជុល, សន្តិសុខ
4. **ពិពណ៌នាច្បាស់លាស់**: ពណ៌នាអំពីអ្វីបានផ្លាស់ប្តូរ
5. **ការវាយតម្លៃផលប៉ះពាល់**: ឥទ្ធិពលទៅអ្នកប្រើប្រាស់បច្ចុប្បន្ន

### ប្រភេទនៃការផ្លាស់ប្តូរ

#### បានបន្ថែម
- មុខងារថ្មីៗ ឯកសារថ្មី ឬសមត្ថភាពថ្មី
- ឧទាហរណ៍ ឬទំរង់ថ្មី រឺធនធានសិក្សាថ្មី
- ឧបករណ៍ scripts ឬឧបត្ថម្ភបន្ថែម

#### ប្ដូរ
- ការផ្លាស់ប្តូរដល់មុខងារ ឬឯកសារតែមួយដែលមានរួច
- ធ្វើបច្ចុប្បន្នភាពដើម្បីធ្វើឱ្យច្បាស់ឬត្រឹមត្រូវល្អប្រសើរ
- រៀបចំមាតិកាឡើងវិញ ឬអង្គការមាតិកា

#### បដិសេធ
- មុខងារឬវិធីសាស្ត្រដែលត្រូវបានលប់ចេញ
- ផ្នែកឯកសារដែលផ្ដាច់ចេញ
- វិធានការដែលមានជម្រើសល្អប្រសើរជាងនេះ

#### ដកចេញ
- មុខងារ ឯកសារ ឬឧទាហរណ៍ដែលមិនពាក់ព័ន្ធ ឬឥតប្រយោជន៍ទៀត
- ព័ត៌មានចាស់ ឬវិធានការបានផ្ដាច់ចេញ
- មាតិកាដែលមិនចាំបាច់ឬរួមបញ្ចូលគ្នា

#### ជួសជុល
- ការកែប្រែកំហុសក្នុងឯកសារ ឬកូដ
- ដោះស្រាយបញ្ហាមួយចំនួនបានរាយការណ៍
- កែលម្អភាពត្រឹមត្រូវ ឬមុខងារ

#### សន្តិសុខ
- ការកែលម្អនិងជួសជុលម៉ូដសន្តិសុខ
- បច្ចុប្បន្នភាពល្អបំផុត នៅវិស័យសន្តិសុខ
- ដោះស្រាយចំងល់សន្តិសុខ

### មគ្គុទ្ទភណ្ឌ Semantic Versioning

#### ជំនាន់ធំ (X.0.0)
- ការផ្លាស់ប្តូរបំបែកដែលត្រូវការអ្នកប្រើបញ្ចូលដំណើរការ
- ការរៀបចំឡើងវិញយ៉ាងសំខាន់នៃមាតិកា ឬអង្គការ
- ការផ្លាស់ប្តូរដែលបំលែងវិធីសាស្ត្របឋមឬវិធីសាស្ត្រ

#### ជំនាន់តូច (X.Y.0)
- មុខងារថ្មី ឬបន្ថែមមាតិកា
- កែលម្អដែលរក្សាភាពត្រូវគ្នាត្រឡប់ក្រោយ
- ឧទាហរណ៍ ឧបករណ៍ ឬធនធានបន្ថែម

#### ជំនាន់បញ្ឆត (X.Y.Z)
- ការជួសជុលកំហុស និងកែលម្អ
- កែលម្អតូចៗ
- ការបកស្រាយ និងកែលម្អតូចៗ

## មតិយោបល់ និងសំណើរពីសហគមន៍

យើងលើកទឹកចិត្តជាសកម្មនូវមតិយោបល់សហគមន៍ដើម្បីកែលម្អឯកសាររៀននេះ៖

### របៀបផ្តល់មតិយោបល់
- **បញ្ហាក្នុង GitHub**: រាយការណ៍បញ្ហា ឬផ្តល់យោបល់បន្ថែម (បញ្ហាពាក់ព័ន្ធ AI សូមស្វាគមន៍)
- **ការពិភាក្សាលើ Discord**: ចែករំលែកគំនិត និងរួមចំនែកជាមួយសហគមន៍ Microsoft Foundry
- **Pull Requests**: រួមចំណែកការកែលម្អផ្ទាល់លើមាតិកា ជាពិសេសទំរង់ និងមគ្គុទ្ទភណ្ឌ AI
- **Discord Microsoft Foundry**: បង្ហាញភាពចូលរួមក្នុងបន្ទប់ #Azure សម្រាប់ AZD + AI
- **វេទិកាសហគមន៍**: ចូលរួមពិភាក្សាកាន់តែទូលំទូលាយនៃអ្នកអភិវឌ្ឍ Azure

### ប្រភេទមតិយោបល់
- **ភាពត្រឹមត្រូវមាតិកា AI**: ការកែលម្អពីការរួមបញ្ចូលសេវា និងដំណោះស្រាយ AI
- **បទពិសោធន៍សិក្សា**: សំណូមពរដើម្បីកែលម្អលំហាត់រៀនអ្នកអភិវឌ្ឍ AI
- **គ្មានមាតិកា AI**: សំណើរការទំរង់ AI បន្ថែម លំនាំ ឬឧទាហរណ៍
- **ភាពងាយប្រើ**: កែលម្អសម្រាប់តម្រូវការអប់រំនានា
- **ការរួមបញ្ចូលឧបករណ៍ AI**: សំណើរដើម្បីលើកកម្ពស់ដំណើរការអភិវឌ្ឍ AI
- **លំនាំ AI ផលិតកម្ម**: សំណើរការលំនាំចែកចាយ AI សហគ្រាស

### ការប្តេជ្ញាចិត្តឆ្លើយតប
- **ការឆ្លើយតបបញ្ហា**: នៅក្នុងរយៈពេល 48 ម៉ោងបន្ទាប់ពីចូលរួម
- **សំណើរ​មុខងារ**: វាយតម្លៃក្នុងតម្លៃមួយសប្ដាហ៍
- **រួមចំណែកសហគមន៍**: ពិនិត្យក្នុងរយៈពេលមួយសប្ដាហ៍
- **បញ្ហាសន្តិសុខ**: អាទិភាពភ្លាមៗ និងឆ្លើយតបយ៉ាងរហ័ស

## កាលវិភាគថែទាំ

### ការអាប់ដេតធម្មតា
- **ការត្រួតពិនិត្យប្រចាំខែ**: ភាពត្រឹមត្រូវមាតិកានិងផ្ទៀងផ្ទាត់តំណភ្ជាប់
- **ការអាប់ដេតត្រីមាស**: ការបន្ថែមមាតិកា និងកែលម្អធំៗ
- **ការត្រួតពិនិត្យបន្លិចប្រចាំប្រាំមាស**: ការរៀបចំឡើងវិញ និងកែលម្អជាតម្រុយ
- **ចេញផ្សាយប្រចាំឆ្នាំ**: ជំនាន់ធំនិងកែលម្អសំខាន់ៗ

### ការត្រួតពិនិត្យ និងធានាគុណភាព
- **ការធ្វើតេស្តដោយស្វ័យប្រវត្តិ**: ការត្រួតពិនិត្យលទ្ធផលនៃគំរូកូដនិងតំណភ្ជាប់ជាប្រចាំ
- **ការរួមបញ្ចូលមតិយោបល់ពីសហគមន៍**: ការរួមបញ្ចូលយោបល់អ្នកប្រើប្រាស់ជាប្រចាំ
- **ការអាប់ដេតបច្ចេកវិទ្យា**: សម្របសម្រួលជាមួយសេវាកម្ម Azure និងការចេញផ្សាយ azd ថ្មីៗ
- **ការត្រួតពិនិត្យការចូលប្រើបាន**: ការពិនិត្យឡើងវិញជាប្រចាំសម្រាប់គោលការណ៍រចនាដែលរួមបញ្ចូលគ្នា

## នយោបាយគាំទ្រព版本

### ការគាំទ្រព版本បច្ចុប្បន្ន
- **កំណែធំចុងក្រោយ**: គាំទ្រពេញលេញជាមួយការអាប់ដេតទៀងទាត់
- **កំណែធំមុន**: ការអាប់ដេតសុវត្ថិភាពនិងជួសជុលសំខាន់ៗរយៈពេល ១២ ខែ
- **កំណែចាស់ៗ**: គាំទ្រដោយសហគមន៍តែប៉ុណ្ណោះ មិនមានការអាប់ដេតផ្លូវការនោះទេ

### ណែនាំការផ្លាស់ប្តូរ
នៅពេលដែលកំណែធំត្រូវបានចេញផ្សាយ យើងផ្តល់ជូន៖
- **មគ្គុទ្ទេសក៍ផ្លាស់ប្តូរ**: ណែនាំជំហានដោយជំហានសម្រាប់ការផ្លាស់ប្តូរ
- **កំណត់សម្គាល់សមភាព**: ព័ត៌មានលម្អិតអំពីការផ្លាស់ប្តូរដែលបែកបាក់
- **ការគាំទ្រឧបករណ៍**: ស្គ្រីបឬឧបករណ៍ជួយសម្រាប់ការផ្លាស់ប្តូរ
- **ការគាំទ្រពីសហគមន៍**: វេទិកាពិសេសសម្រាប់សំណួរផ្នែកផ្លាស់ប្តូរ

---

**ការរុករក**
- **មេរៀនមុន**: [មគ្គុទ្ទេសក៍សិក្សា](resources/study-guide.md)
- **មេរៀនបន្ទាប់**: ត្រឡប់ទៅ [README មុខ](README.md)

**តាមដានព័ត៌មានថ្មីៗ**: តាមដានឃ្លាំងនេះសម្រាប់ការជូនដំណឹងអំពីការចេញផ្សាយថ្មីៗ និងការអាប់ដេតសំខាន់ៗទៅលើសម្ភារៈរៀន។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
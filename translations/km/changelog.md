# បញ្ចីបម្លែង - AZD សម្រាប់អ្នកចាប់ផ្តើម

## ការណែនាំ

បញ្ចីបម្លែងនេះកត់ត្រាបំលែងទាំងអស់ដែលគេចំណាំបាន ការអាប់ដេត និងការកែលម្អទៅនឹងឃ្លៀង AZD សម្រាប់អ្នកចាប់ផ្តើម។ យើងអនុវត្តតាមគោលការណ៍សៀមង់ទិកនិងរក្សាទុកកំណត់ត្រានេះដើម្បីជួយឲ្យអ្នកប្រើប្រាស់យល់ថាអ្វីដែលបានផ្លាស់ប្តូរនៅចន្លោះកំណែ។

## គោលបំណងរៀន

តាមការពិនិត្យមើលបញ្ជីបម្លែងនេះ អ្នកនឹងអាច៖
- ទទួលបានព័ត៌មានថ្មីៗអំពីមុខងារ និងការបន្ថែមមាតិកាថ្មី
- យល់ដឹងពីការកែលម្អដែលបានបញ្ចូលទៅក្នុងឯកសារដែលមានស្រាប់
- តាមដានការជួសជុលកំហុស និងកំណត់ត្រឹមត្រូវដើម្បីធានាអក្សរសំគាល់ភាពត្រឹមត្រូវ
- ធ្វើតាមការវិវឌ្ឍន៍នៃសម្ភារៈសិក្សាតាមអំឡុងពេល

## លទ្ធផលនៃការរៀន

បន្ទាប់ពីពិនិត្យមើលបញ្ជីបម្លែង អ្នកនឹងអាច៖
- ស្គាល់មាតិកា និងធនធានថ្មីៗដែលមានសម្រាប់ការរៀន
- យល់ដឹងថាផ្នែកណាដែលបានបច្ចុប្បន្នភាពឬកែប្រែ
- រៀបចំផ្លូវការរៀនរបស់អ្នកដោយផ្អែកលើសម្ភារៈទំនើបបំផុត
- អាចចូលរួមផ្តល់មតិ និងយោបល់សម្រាប់ការកែលម្អនៅក្នុងអនាគត

## ប្រវត្តិកំណែ

### [v3.25.0] - 2026-11-09

#### ផ្នែកបន្ថែម Microsoft Foundry 1.0 ឥឡូវមានជាសាធារណៈ

កញ្ចប់ `microsoft.foundry` 1.0 គឺ **មាននៅជិតផ្ទាល់ និងមានជាសាធារណៈ**, ដូចបានប្រកាសនៅថ្ងៃទី [5 ខែវិច្ឆិកា ឆ្នាំ 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/)។ មេរៀននេះឥឡូវបង្រៀនពីកម្មវិធីដំណើរការដែលបានបញ្ចេញជាផ្លូវការលេខ GA មិនមែនជាការបញ្ចេញដែលនឹងមកដល់ទៀតទេ។ ចាប់ផ្ដើមជាមួយ AZD **1.37.0 ឬក្រោយពីនេះ** និង `azd ext install microsoft.foundry` ។

#### មាននៅក្នុងកំណែថ្នាក់សិក្សានេះ
- គន្លឹះជាភាសាអង់គ្លេសប្រើកញ្ចប់ GA ជាផ្លូវការដំឡើងលំនាំដើម និងពន្យល់ពីបណ្ដាបន្ថែមចម្បងប្រាំពីរដែលមានកំណែឯករាជ្យ។
- [ដំណើរកាត់ host-agent](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) គ្របដណ្តប់លើ API ការឆ្លើយតប Python Agent Framework ប្រភពដើម uv បច្ចុប្បន្ន Python 3.13+ ការជ្រើសរើសគម្រោងថ្មី/ដែលមានស្រាប់ ការប្រើម្ដងទៀតនៃម៉ូដែល និងការត្រួតពិនិត្យ `azure.yaml`។
- ដំណើរការពីក្នុងទៅ cloud គ្របដណ្តប់លើការប្រឡង Agent Inspector ចំណាយម៉ូដែល Azure-backed ការសង់កូដពីចម្ងាយ ការហៅពេលប្រើ ពត៌មានបន្ទាប់បន្សំ លិខិតកាន់តំណែង និងរាយការណ៍កំហុស។
- គន្លឹះវាយតំលៃបំបែកពីររួមមានការបង្កើត និងពិនិត្យមើលទិន្នន័យ/រូបមន្ត ការកំណត់វាយតំលៃដែលមានឈ្មោះ ការចុះបញ្ជីទ្រព្យសម្បត្តិ និងពិនិត្យលទ្ធផល។ សេចក្តីណែនាំវាយតំលៃរៀបចំ/កែលំហែជាពីមុននៅតែផ្ដល់ជាប្រវត្តិសម្រាប់ការផ្លាស់ប្តូរ មិនមែនជាមូលដ្ឋានបញ្ចេញរបស់កំណែបច្ចុប្បន្នទេ។
- គន្លឹះ Foundry CI/CD រួមមានការដំឡើងកម្មវិធីផ្នែករត់ ការដាក់ពាក្យបញ្ជូនដែលមានសញ្ញាប័ណ្ណ វាសនីយកម្មវាយតំលៃ/ចូលដំណើរការ និងច្រកគុណភាពដែលបញ្ជាក់ទៅតាមវា។
- គន្លឹះការរក្សាដំណើរការបំបែកបានប្រកួតប្រជែងគម្រោង Foundry ដែលបានបង្កើតថ្មី និងបានប្រើម្ដងទៀត។ សិក្ខាសាលានេះភ្ជាប់ទៅនឹងលំហាត់ GA ផ្សេងទៀត ដោយមិនប្ដូរប្រភេទតេស្តរបស់គំរូ។
- រុក្ខ pauកំណត់ផ្លូវដំណើរការ ការសិក្សាគោលបំណង ការតំឡើងលក្ខណៈជាមូលដ្ឋាន សៀវភៅជំនួយ សំណួរញឹកញាប់ និងមគ្គុទេសក៍សិក្សា បង្ហាញភាពទៅនឹងដំណើរការប្រកាស GA។ ការបកប្រែដែលបង្កើតដោយប្រព័ន្ធមិនត្រូវបានកែសម្រួលដោយដៃ។

#### វិសាលភាពពិនិត្យ
- ផ្អែកលើការប្រកាស GA គន្លឹះ Microsoft Learn ដែលភ្ជាប់ និងការកំណត់គំរូប្រភពដើម។ មិនបានអនុវត្ត Azure ដាក់ពាក្យបញ្ជូនផ្ទាល់ មិនបានប្រើម៉ូដែល ឬវាយតំលៃផ្ទាល់។
- កញ្ចប់ GA មិនមានន័យថា GA សម្រាប់មុខងារជ្រើសរើសទាំងអស់ ផ្នែកបន្ថែមឯករាជ្យ ឬ SDK នោះទេ ហើយមិនផ្តល់លិខិតអះអាងសម្រាប់គំរូប្រោះផលិតកម្មទេ។

### [v3.24.0]- 2026-11-04

#### បានជួសជុល
- រៀបចំពិចារណាផ្លូវដំណើរការប្រភេទអង់គ្លេស អាសយដ្ឋានបម្លែងទំព័រ កំណត់ត្រាខ្វះខាតចំណុច និងការបញ្ជាក់ក្រៅប្រព័ន្ធចាស់ៗ រួមទាំងតំណជាតាប្រភេទទី២ទៅមគ្គុទេសក៍បញ្ញាសិប្បនិម្មិត។
- ពិនិត្យការណែនាំបច្ចុប្បន្នប្រឆាំងនឹង AZD 1.37.2 ក្រុមភ្នាក់ងារ 1.0.0-beta.23 និងវាយតំលៃ 1.0.0-beta.2។ កត់ត្រាការវាយតំលៃ `azd ai eval` ផ្លូវការផ្សេង និងការផ្លាស់ទីកំណត់ត្រាការកែលម្អ។
- កែប្រែវិញ្ញាសា CLI មិនគាំទ្រ ព្រំដែនផ្ទៀងផ្ទាត់ ចំណាំបរិស្ថានចម្លង/សម្ងាត់ ការធ្វើបច្ចុប្បន្នភាពហេដ្ឋារចនាសម្ព័ន្ធ ការកំណត់ម៉ូដែល និងឧទាហរណ៍ស្ដារឡើងវិញបំផ្លាញ។
- បាំងទីសិក្សារបស់សិក្ខាសាលាប្រឆាំងនឹងគំរូ AI Agents បច្ចុប្បន្ន រួមមានកំណត់ភ្ជាប់វត្ថុចម្លង ចូលបញ្ចូលកំណត់ការ វាយតំលៃ ការចូលរួម red-team និងការដាក់តម្លើងមើលឃើញ។
- សម្រួលការតែងកំហុសអនុវត្តន៍គំរូ និងជួសជុលបញ្ហាកម្មវិធី/ហេដ្ឋារចនាសម្ព័ន្ធ/ការកំណត់។ សម្ភារៈរចនាសម្ព័ន្ធលក់រាយត្រូវបានកំណត់ច្បាស់ថាពីរផាស៊ីកម្មការអនុវត្តដែលបញ្ចប់រួច។
- ស្ដារឡើងដោយវិភាគភាសា CodeQL ដាក់ Node.js 24 ជាភាសាគាំទ្រ សម្រាប់តំបន់ dev container និងធ្វើឲ្យកម្មវិធីវែងវាប់មើលសំណួរជាកំណែបរាំងធ្វើការដាក់ពាក្យបញ្ជាទេ។

#### បានបន្ថែម
- កម្មវិធីត្រួតពិនិត្យតំណភ្ជាប់ក្រៅបណ្ដាញ/ភ្ជាប់ក្រឡាច់ភាសាអង់គ្លេស, តេស្តរេហ្សេហ្គ្រេសស្យុង, និងដំណើរការបញ្ជាក់ឯកសារដែលក៏សាងសង់សិក្ខាសាលានៅមុខទទេស្ថិតិ។ ការបកប្រែដែលបង្កើតដោយប្រព័ន្ធ និងរូបភាពបកប្រែមិនរួមបញ្ចូល។

#### វិសាលភាពផ្ទៀងផ្ទាត់
- ទិន្នន័យប្រភព សyntax ការកំណត់ចំណុច អាកប្បកិរិយាតំបន់ និងការត្រួតពិនិត្យតំណបណ្ដាញ មិនបញ្ជាក់ថាអាចដាក់ពាក្យបញ្ជូន Azure ផ្ទាល់បាន ឬមានគណនី RBAC, accessibility ម៉ូដែលតាមតំបន់, វិក្កយបត្រ សុវត្ថិភាព ឬភាពរួចរាល់សម្រាប់ផលិតកម្ម។
- កំណត់ត្រាចាស់ៗខាងក្រោមគឺជាបញ្ចីប្រវត្តិ មិនមែនជាបញ្ជារណ៍បញ្ជា ឬការបញ្ចេញកំណែបច្ចុប្បន្នទេ។

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 កែលម្អ៖ កំណត់មូលដ្ឋានជាក់លាក់នៃកំណែ
**កំណែនេះធ្វើការត្រួតពិនិត្យមេរៀនប្រឆាំងនឹង `azd` `1.27.1` (កក្កដា 2026 កំណែកំណត់មានស្ថិរភាពថ្មីបំផុត) និងផ្នែកបន្ថែម AI agent អ្នកសាកល្បង `azure.ai.agents` `1.0.0-beta.5` ដើម្បីធានាអោយស្លាក "validated against" ទាំងអស់មានភាពទាន់សម័យបន្ទាប់ពីការបញ្ចេញ 1.26.0, 1.27.0, និង 1.27.1 ។**

#### ផ្លាស់ប្ដូរ
- **✅ ផ្ទៃពិនិត្យត្រូវបានធ្វើឲ្យទាន់សម័យ** ពី `azd 1.25.6` (មិថុនា 2026) ដល់ `azd 1.27.1` (កក្កដា 2026) នៅក្នុង README មេ សៀវភៅចំណាត់ថ្នាក់ទាំងអស់ មេរៀន dev-container ផ្នែកទី១ (រួមទាំងឧទាហរណ៍កំណែបិទ) មេរៀន custom-templates ផ្នែកទី៤ មេរៀន multi-agent ផ្នែកទី៥ និងឯកសារសិក្ខាសាលា
- **🤖 ផ្ទៃបច្ចុប្បន្នភាពផ្នែកទី២** ពី `azd 1.23.12` (មិនា 2026) ទៅ `azd 1.27.1` នៅ `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, និង `microsoft-foundry-integration.md`; កាលបរិច្ឆេទសំគាល់ពិនិត្យត្រូវបានធ្វើឲ្យទាន់សម័យទៅ 2026-07-13
- **🧩 ផ្នែកបន្ថែម AI agent បានធ្វើបច្ចុប្បន្នភាព** ពី `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ទៅកំណែកំណត់សព្វថ្ងៃ `1.0.0-beta.5` នៅក្នុង README ផ្នែកទី២ និង `agents.md`
- **🧪 ឧទាហរណ៍ពិនិត្យសិក្ខាសាលា** (`azd version` ផលិត) ត្រូវបានធ្វើបច្ចុប្បន្នភាពទៅ `1.27.1`

#### សម្គាល់អំពីកំណែ azd ដែលពាក់ព័ន្ធ (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** គាំទ្រជាភាសា Go សម្រាប់ Azure Functions លើ Flex Consumption, `azd config sub-filter` ផ្ទាំងពិនិត្យការជាវតាមអ្នកជាវ តូចតក្នុង bundling ផ្នែកបន្ថែមឯករាជ្យ (`azd x pack --bundle`), និង `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** ម៉ូដែលគម្រោង/ភ្នាក់ងារ Azure AI Foundry ត្រូវបានគ្រប់គ្រងដោយផ្ទាល់ក្នុង `azure.yaml` (ការចាប់ផ្ដើមគ្មាន Bicep ឬ Terraform), ការគាំទ្រការដាក់ពាក្យបញ្ជូន container សម្រាប់ App Service (`host: appservice` + `language: docker`), ផ្លូវចូលដោយផ្ទាល់ `-s/--source` សម្រាប់បញ្ជារ `azd extension`, និង `azd tool uninstall`
- **1.27.1 (2026-07-09):** ប៊្លាក `--no-dependencies` សម្រាប់ `azd extension install`, ម៉ូដែលចាស់ៗដែលបដិសេធពីការបង្ហាញក្នុងសារជូនដំណឹង catalog/quota ត្រូវបានលុបចេញដោយលំនាំដើម, និងការកែសម្រួលបញ្ហាផ្សេងទៀតជាច្រើន

#### ឯកសារដែលបានអាប់ដេត
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

### [v3.22.0] - 2026-06-16

#### ព្រមទាំងបន្លាស់បង់សម្រាប់អ្នកចាប់ផ្ដើម #2: ការបង្កើតរាងតម្លើងទំរង់, កុងតឺន័រ Dev, Pulumi, Azure DevOps, អ្នកបង្កើតសេវាកម្ម, និងព័ត៌មានបន្ថែម
**ភាពនេះបិទចំហរអន្តរជាតិនៅតែលេចឡើងដោយការវិភាគ azd-coverage៖ របៀបបង្កើតនិងបោះពុម្ពផ្សាយរាងតម្លើងរបស់អ្នក, បរិបទ dev-container/Codespaces ដែលអាចបង្កឡើងវិញបាន, អ្នកផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ Pulumi, វិធីសាស្ត្រប្រសិទ្ធភាព Azure DevOps CI/CD, ការផ្ទៀងផ្ទាត់អ្នកបង្កើតសេវាកម្ម, វិធីជ្រើសរើសរូបមន្តមេផ្តល់ (AKS/Spring Apps), ពន្យល់ `azd restore`/`azd package`, ការដោះស្រាយកំហុស hook, និងអនុវត្តន៍ក្រុម/បរិយាកាសបានចែករំលែក។**

#### បានអង្គផ្សំ
- **🧱 មុខវិជ្ជាថ្មីជាទំព័រ 4** `docs/chapter-04-infrastructure/custom-templates.md` — ការបង្កើតរាងតម្លើង azd របស់អ្នក: រចនាសម្ព័ន្ធចាំបាច់ (`azure.yaml`, `infra/`, `src/`), វាល `metadata.template`, ការបង្កើតប៉ារ៉ាម៉ែត្រតាមរយៈ token វិភាគ `uniqueString()` និងស្លាក `azd-env-name`, ការធ្វើតេស្តក្នុងសញ្ជាតិជាមួយ `azd init --template <local-path>`, ការចេញផ្សាយទៅ GitHub, និងការដាក់ស្នើទៅកាន់ ឃ្លាំង Awesome AZD
- **📦 មុខវិជ្ជាថ្មីជាទំព័រ 1** `docs/chapter-01-foundation/dev-containers.md` — បរិយាកាស azd ដែលអាចបង្កឡើងវិញបានជាមួយ Dev Containers និង GitHub Codespaces: ពណ៌មានតំបន់ `.devcontainer/devcontainer.json` ដោយប្រើលក្ខណៈពិសេសផ្លូវការរបស់ `ghcr.io/azure/azure-dev/azd`, លក្ខណៈពិសេសដោយភាសា, `docker-in-docker` សម្រាប់ម៉ាស៊ីនផ្ទុក container, និង `azd auth login --use-device-code` សម្រាប់ការចូលប្រើពីចម្ងាយ
- **🧩 Pulumi ជាមួយ azd** ផ្នែកក្នុង `docs/chapter-04-infrastructure/provisioning.md` — វិធីសាស្ត្រ `infra.provider: pulumi`, ទំព័រតំរៀបPulumi, តំណភ្ជាប់ stacks ទៅបរិយាកាស azd, លទ្ធផល/ស្លាកតម្រូវការ, និងដំណើរការ `azd up` / `azd down` ដូចគ្នា
- **🎯 ការណែនាំជ្រើសរើសម៉ាស៊ីនផ្ទុក** ក្នុង `docs/chapter-04-infrastructure/provisioning.md` — ការប្រៀបធៀបងាយស្រួលសម្រាប់អ្នកចាប់ផ្ដើមរវាង `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, និង `springapp`, ជាមួយនឹងការណែនាំនៅពេលជ្រើសរើស AKS ឬ Azure Spring Apps
- **🛠️ វិធីសាស្ត្រ Azure DevOps CI/CD** ក្នុង `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, ការតភ្ជាប់សេវាកម្មជាមួយ federation អត្តសញ្ញាណ (OIDC), ថ្មី `azure-dev.yml` ដូចបានបង្កើត, និងការដំឡើងក្រុមប្រើប្រាស់អថេរ
- **🔑 អ្នកបង្កើតសេវាកម្ម (គំរូ 4)** ត្រូវបានបន្ថែមទៅ `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, អ្នកប្រើប្រាស់មិនចូលរួម `azd auth login` ជាមួយសម្ងាត់អតិថិជនប្រឆាំងនឹងសញ្ញាប័ណ្ណ federated/OIDC, ពេលណាគួរប្រើ, និងការផ្ទុកសម្ងាត់ដោយសុវត្ថិភាព
- **🪝 ការដោះស្រាយកំហុស hook** ផ្នែករងក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — កូដចេញ និង `set -e`, `continueOnError`, ការធ្វើតេស្ត hook ដាច់ដោយឡែកជាមួយ `azd hooks run`, shell ភាសា OS បន្ទាប់, និង `--debug`
- **👥 ក្រុម / បរិយាកាសបានចែករំលែក** ផ្នែកក្នុង `docs/chapter-03-configuration/configuration.md` — អ្វីដែលស្ថិតក្នុង `.azure/`, អ្វីដែលត្រូវ gitignore, បរិយាកាសពេលអ្នកអភិវឌ្ឍន៍នីមួយ, `azd env list`/`select`, និងការផ្គត់ផ្គង់តម្លៃបរិយាកាសក្នុង CI/CD
- **🧰 `azd restore` និងពន្យល់បន្ថែម `azd package`** ក្នុង `resources/cheat-sheet.md` — ការស្ដារឡើងវិញអាសយដ្ឋាន និងការបង្កើតគ្រឿងសង្ហារឹមដែលអាចដាក់ប្រាក់បានដោយមិនចាំបាច់ដេញថ configuration

#### បានផ្លាស់ប្ដូរ
- **🧭 តារាងមុខវិជ្ជាក្បាលទំព័រ 4** ត្រូវបានធ្វើអាប់ដេតដើម្បីរួមបញ្ចូលមុខវិជ្ជា "ការបង្កើតរាងតម្លើងរបស់អ្នក" ថ្មី (មុខវិជ្ជា 3)
- **🧭 តារាងមុខវិជ្ជាក្បាលទំព័រ 1** ត្រូវបានធ្វើអាប់ដេតដើម្បីរួមបញ្ចូលមុខវិជ្ជា "Dev Containers & Codespaces" ថ្មី (មុខវិជ្ជា 5); ផ្នែកចុះក្រោមនាវីកាលភាពតភ្ជាប់រវាង `bring-your-own-app.md` និង `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### ព្រមទាំងបន្លាស់បង់សម្រាប់អ្នកចាប់ផ្ដើម: មុខវិជ្ជាប្រើប្រាស់ Multi-Agent ដោយដៃ, "នាំយកកម្មវិធីរបស់អ្នក," Terraform, និងវិធីសាស្ត្រ CI/CD
**ភាពនេះបិទចំហរធំបំផុតសម្រាប់មគ្គុទេសក៍អ្នកចាប់ផ្ដើមពេញលេញដោយបន្ថែមមុខវិជ្ជាថ្មីពីរដោយដៃ (វិធីសាស្ត្រប្រើប្រាស់ multi-agent ដែលអាចដាក់ប្រាក់បាន និងបន្ថែម azd ទៅកម្មវិធីមានស្រាប់), ការណែនាំ hook ដែលងាយស្រួលសម្រាប់អ្នកចាប់ផ្ដើម, ផ្នែក Terraform ជាមួយ azd, វិធីសាស្ត្រលំដាប់ជំហាន GitHub Actions, ពន្យល់អំពីជម្រើសបន្ថែមសាកល្បងថ្មី, និងបញ្ជីពិនិត្យបញ្ជាក់ការដាក់បញ្ចូលយ៉ាងច្បាស់។**

#### បានអង្គផ្សំ
- **🤝 មុខវិជ្ជាថ្មីជាទំព័រ 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — វិធីសាស្ត្រដោយដៃទាំងស្រុងដែលអាចដាក់ប្រាក់បានសម្រាប់ភ្នាក់ងារពីរនាក់ (orchestrator + specialists) ប្រើរាងតម្លើងពិតប្រាកដ (`contoso-creative-writer`), គ្របដណ្តប់ពេលដែលគួរប្រើ multi-agent, វិធីសាស្ត្រ `azd up`, ការយល់ដឹងអំពីធនធានដែលបានដាក់ប្រាក់, ការតាមដានជាប់រវាងភ្នាក់ងារ, ការប្តូរតាមតម្រូវការ, និងការសម្អាត
- **📦 មុខវិជ្ជាថ្មីជាទំព័រ 1** `docs/chapter-01-foundation/bring-your-own-app.md` — របៀបបន្ថែម azd ទៅគម្រោងមានស្រាប់ជាមួយ `azd init` ("ប្រើកូដក្នុងថតបច្ចុប្បន្ន"), ការយល់ដឹងអំពី `azure.yaml` និង `infra/`, `azd infra generate`, ការស្គាល់ម៉ាស៊ីនផ្ទុក, និងការដាក់ប្រាក់ជាមួយ `azd up`
- **🌐 Terraform ជាមួយ azd** ផ្នែកបន្ថែមទៅ `docs/chapter-04-infrastructure/provisioning.md` — ការកំណត់រចនាសម្ព័ន្ធ `infra.provider: terraform`, ទំព័រតំរៀប `.tf`, លទ្ធផលតម្រូវការនិងស្លាកតម្រូវការនៅ `AZURE_*` និង `azd-env-name`, និងដំណើរការ `azd up` / `azd down` ដូចគ្នា (បិទចំហរទីដែលគាំទ្រថា Terraform តែមានការបង្ហាញតែ Bicep តែប៉ុណ្ណោះ)
- **⚙️ ដំណើរការជាប់លាប់ GitHub Actions ដោយជំហាន** នៅក្នុង `docs/chapter-08-production/production-ai-practices.md` — ពី GitHub រ៉េបូឃ إلى ការដំណើរការដោយស្វ័យប្រវត្តិ: `azd pipeline config`, សក្ខីកម្ម OIDC សហភាព (គ្មានការផ្ទុកសម្ងាត់), `azure-dev.yml` ដែលបានបង្កើត, និងមគ្គុទេសក៍អំពីសម្ងាត់ប្រឆាំងនឹងអថេរភាព
- **🪝 មូលដ្ឋាន "ថ្មីចំពោះ hooks?" បង្ហាញទូទៅ** ក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — hook ជាអ្វី, តារាងដំណាក់កាល hook, hook ដំបូងតិចតួច, និងរត់ hooks ដោយដៃជាមួយ `azd hooks run`
- **✅ បញ្ជីត្រួតពិនិត្យ "ផ្ទៀងផ្ទាត់ការដាក់ចេញរបស់អ្នក"** ដែលបានបន្ថែមទៅជំហ៊ានទី 5 នៃ `docs/chapter-01-foundation/first-project.md` — សម្រង់តេស្ត, ពិនិត្យមើល health-endpoint, និងលក្ខខណ្ឌជោគជ័យច្បាស់លាស់
- **🧩 អ្នកពន្យល់សម្រាប់ការពង្រីកមើលជាមុនថ្មីៗ** `azure.ai.skills` និង `azure.ai.connections` (វាជាអ្វី និងពេលណាចាំបាច់ប្រើ) នៅក្នុង `docs/chapter-08-production/production-ai-practices.md`

#### ផ្លាស់ប្តូរ
- **🧭 តារាងមេរៀនជំពូកទី 5** បានកែតម្រូវ: `multi-agent-basics.md` ឥឡូវនេះជាមេរៀន 1 (មេរៀនដែលអនុវត្តដោយដៃពេញលេញតែម្ដង), ដោយមានស្លាកត្រឹមត្រូវថា មេរៀន 2 មាននៅក្នុងជំពូក 6 និងស្ថានการณ์ Retailគឺជាគម្រោងសំណង់ សូមកុំចាត់ជាគំរូបញ្ជា Command តែមួយ
- **🧭 តារាងមេរៀនជំពូកទី1** ឥឡូវបានបញ្ចូលមេរៀនថ្មី "នាំយកកម្មវិធីផ្ទាល់ខ្លួន" (មេរៀន 4)
- **🔗 ផ្នែកជើងចុចរុករក** បានធ្វើបច្ចុប្បន្នភាព: `first-project.md` ឥឡូវតភ្ជាប់ទៅមុខឆ្ពោះ `bring-your-own-app.md`

#### ជួសជុលរួច
- **🧱 បិទចន្លោះ "បានអះអាងប៉ុន្តែមិនមាន" របស់ Terraform** — មុខវិជ្ជាបណ្ដុះបណ្ដាលបានយោងទៅ Terraform ដូចមិនបានបង្ហាញវាពិតប្រាកដ
- **🔀 កែប្រែការតភ្ជាប់ជំពូក 5 ដែលបង្កការជ្រុលច្របូកច្របល់** ពីភាពយ៉ាងមិនត្រឹមត្រូវថាមានការអនុវត្តជាអ្នកគ្រប់គ្រង agents ពេញលេញ នៅពេលដែលវាជាគម្រោងសំណង់តែប៉ុណ្ណោះ

#### ឯកសារដែលបានបន្ទាន់សម័យ
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

#### AZD 1.25.6 Refresh, ពាក្យបញ្ជាជីវិតពេញលេញរបស់ Agent & Aspire ការប្តូរឈ្មោះ
**កំណែនេះធ្វើការត្រួតពិនិត្យវិញលើមុខវិជ្ជាក្នុង `azd` `1.25.6` (មិថុនា 2026) និង `azure.ai.agents` `0.1.40-preview` ការពង្រីក, ពង្រីកការណែនាំ AI ពី "គូសโครง agent" ទៅជាជីវចក្រពេញលេញរបស់ agent (សាកល្បង → វាយតម្លៃ → បង្កើត → និន្នាការ → លុបចោល), បង្ហាញការពង្រីកមើលជាមុនថ្មី `azure.ai.skills` និង `azure.ai.connections`, និងចំណាំការប្តូរឈ្មោះផលិតផល ".NET Aspire" ឲ្យជា "Aspire".**

#### បន្ថែម
- **🔁 ការគ្រប់គ្រងជីវចក្រពេញលេញរបស់ agent** សម្រាប់អ្នកចាប់ផ្តើម និងវិស្វករ AI ទាំងមូលឆ្លងកាត់ឯកសារ:
  - `docs/chapter-01-foundation/azd-basics.md` — តារាងជីវចក្រ (គូស → សាកល្បង → វាស់ → កែលម្អ → និន្នាការ → សម្អាត) បានបន្ថែមទៅផ្នែក Extensions និង AI Command
  - `docs/chapter-08-production/production-ai-practices.md` — ផ្នែកថ្មី "ការគ្រប់គ្រងជីវចក្រ agent" រៀបរាប់អំពី `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
  - `resources/cheat-sheet.md` — ពាក្យបញ្ជា AI Agent បានពង្រីកជាមួយ `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
- **🧩 ការពង្រីកមើលជាមុនថ្មី** បានចុះបញ្ជី: `azure.ai.skills` (ជំនាញអាចប្រើបន្តរ agent) និង `azure.ai.connections` (ការតភ្ជាប់ Foundry) បានបន្ថែមទៅតារាងនិងសន្លឹកជំនួយ។
- **⏱️ ការណែនាំពេលវេលាឆ្លើយតប** — ឧទាហរណ៍ `azd ai agent invoke` ឥឡូវបង្ហាញរួចដោយព прин្ទការពន្យាពេលសរុប និងពេលឈានដល់បៃទីមុន
- **📌 បដាកាសកំណែ** នៅ README មូលដ្ឋាន បង្ហាញអ្នករៀនទៅ `azd version` និង `azd upgrade`

#### ផ្លាស់ប្តូរ
- **✅ បន្ទាត់មូលដ្ឋានផ្ទៀងផ្ទាត់បានអាប់ដេត** ពី `azd 1.23.12` (មីនា 2026) ទៅ `azd 1.25.6` (មិថុនា 2026) នៅគ្រប់ README ជំពូក និងឯកសារកម្មវិធីពិគ្រោះ
- **🤖 សេចក្តីសម្គាល់ការពង្រីកជំពូក 2** បានបន្ទាន់សម័យពី `azure.ai.agents` `0.1.18-preview` ទៅ `0.1.40-preview`
- **🧪 ឧទាហរណ៍ផ្ទៀងផ្ទាត់មន្ទីរ** (`azd version` output) បានបន្ទាន់សម័យទៅ `1.25.6`
- **🧭 README "មានអ្វីថ្មីក្នុង azd ថ្ងៃនេះ"** បានធ្វើបច្ចុប្បន្នភាពបង្ហាញជីវចក្រ agent ពេញលេញ, ការពង្រីក AI ថ្មីៗ, និងការជួសជុលគុណភាពជីវិតថ្មីៗ (`azd init` idempotency, `azd auth login` ការលាងសម្អាត stale-token, `azd tool` ការបង្ហាញដំណើរការដំបូង)
- **📖 កំហុសជំពូក 2 agents.md (ជម្រើស 4)** ឥឡូវបញ្ជូនអ្នករៀនទៅពាក្យបញ្ជាជីវចក្រ បន្ទាប់ពីដាក់ចេញ មិនចាំបាច់ឈប់នៅ `azd up`

#### ជួសជុលរួច
- **🏷️ ឈ្មោះផលិតផល** — បានបន្ថែមចំណាំការប្តូរឈ្មោះ Aspire (".NET Aspire" ឥឡូវគឺ "Aspire" តែមួយ); ការគាំទ្ររបស់ azd Aspire មិនបានផ្លាស់ប្តូរ
- **🔎 ផ្ទៀងផ្ទាត់ការចេញផ្សាយបន្តផ្ទាល់** បានបញ្ជាក់តាម Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) និង `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### ឯកសារដែលបានបន្ទាន់សម័យ
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

#### ការបញ្ជាក់អ្នកចាប់ផ្តើម, ការផ្ទៀងផ្ទាត់ការតំឡើង និងការសម្អាតពាក្យបញ្ជា AZD ចុងក្រោយ
**កំណែនេះបន្តការស្វែងយល់ត្រួតពិនិត្យ AZD 1.23 ជាមួយការបញ្ជាក់ឯកសារដែលផ្តោតលើអ្នកចាប់ផ្តើម: វាបញ្ជាក់អំពីការណែនាំសម្រាប់ការផ្ទៀងផ្ទាត់ AZD ជាលើកដំបូង, បន្ថែម script ផ្ទៀងផ្ទាត់ការតំឡើងក្នុងតំបន់មូលដ្ឋាន, ផ្ទៀងផ្ទាត់ពាក្យបញ្ជាសំខាន់ៗជាមួយ CLI AZD តាមផ្ទាល់, ហើយយកយោងពាក្យបញ្ជាភាសាអង់គ្លេសចាស់ចុងក្រោយចេញពី changelog។**

#### បានបន្ថែម
- **🧪 script ផ្ទៀងផ្ទាត់ការតំឡើងសម្រាប់អ្នកចាប់ផ្តើម** ជាមួយ `validate-setup.ps1` និង `validate-setup.sh` ដើម្បីអ្នករៀនអាចពិនិត្យឧបករណ៍ដែលតម្រូវមុនចាប់ផ្តើមជំពូក 1
- **✅ ជំហានផ្ទៀងផ្ទាត់ការតំឡើងជាមុន** ក្នុង README មូលដ្ឋាន និង README ជំពូក 1 ដើម្បីចាប់ផ្តើមកំហុសពីគ្រុបតម្រូវការមិនបានបំពេញមុន `azd up`

#### ផ្លាស់ប្តូរ
- **🔐 ការណែនាំអត្តសញ្ញាណអ្នកចាប់ផ្តើម** ឥឡូវគោរពភាពសំខាន់ឲ្យ `azd auth login` ជាប្រភេទបេីកផ្លូវសំខាន់សម្រាប់ចរន្តការងារ AZD, ជាមួយនឹង `az login` ត្រូវបានគេរាយការណ៍ជាជម្រើស លើករណីដែលមានការប្រើពាក្យបញ្ជា Azure CLI តែម្តង
- **📚 ផ្ទៀងផ្ទាត់ដំណើរការចូលរួមជំពូក 1** ឥឡូវបញ្ជូនអ្នករៀនទៅផ្ទៀងផ្ទាត់ការតំឡើងនៅក្នុងតំបន់មូលដ្ឋាន មុនការតំឡើង, អត្តសញ្ញាណ និងជំហានដាក់ចេញដំបូង
- **🛠️ សារពី Validator** ឥឡូវបំបែកយ៉ាងច្បាស់រវាងតម្រូវការញឹកញាប់និងការជូនដំណឹងគ្មានបញ្ហារបស់ Azure CLI សម្រាប់ផ្លូវអ្នកចាប់ផ្តើមដែលប្រើ AZD តែម្តង
- **📖 ការកំណត់រចនាសម្ព័ន្ធ, ការដោះស្រាយបញ្ហា និងឯកសារគំរូ** ឥឡូវច្បាស់ថាលក្ខណៈតម្រូវអត្តសញ្ញាណ AZD ជាចាំបាច់ និងការចូលប្រើ Azure CLI ជាជម្រើស នៅពេលទាំងពីរត្រូវបានបង្ហាញមុននេះដោយគ្មានបរិបទ

#### ជួសជុលរួច
- **📋 យោងពាក្យបញ្ជាភាសាអង់គ្លេសនៅសល់** បំរែបំរួលទៅទម្រង់ AZD បច្ចុប្បន្ន រួមទាំង `azd config show` នៅសន្លឹកជំនួយ និង `azd monitor --overview` នៅចំពោះមុខការណែនាំពិគ្រោះ Azure Portal
- **🧭 ការអះអាងសម្រាប់អ្នកចាប់ផ្តើមនៅជំពូក 1** បានធ្វើឲ្យទន់ញឹម ដើម្បីជៀសវាងការធ្វើការសន្យាថា មានកំហុសសូន្យឬការបិទត្រឡប់នៅលើគំរូនិងធនធាន Azure ទាំងអស់
- **🔎 ផ្ទៀងផ្ទាត់ CLI បន្តផ្ទាល់** បានបញ្ជាក់ថាគាំទ្របច្ចុប្បន្នសម្រាប់ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, និង `azd down --force --purge`

#### ឯកសារដែលបានបន្ទាន់សម័យ
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

#### ការផ្ទៀងផ្ទាត់ AZD 1.23.12, ការពង្រីកបរិស្ថានមន្ទីរ និងការប្តូរទ្រទ្រង់ម៉ូដែល AI
**កំណែនេះអនុវត្តការត្រួតពិនិត្យឯកសារតាម `azd` `1.23.12`, អាប់ដេតឧទាហរណ៍ពាក្យបញ្ជា AZD ចាស់ៗ, បង្កើតទ្រទ្រង់ម៉ូដែល AI ទំនើបនាពេលបច្ចុប្បន្ន, និងពង្រីកការណែនាំមន្ទីរពហុព័ត៌មាន ពី GitHub Codespaces ទៅគាំទ្រកុងទ៉េន័រអភិវឌ្ឍន៍ និងក្លូននៅក្នុងតំបន់មូលដ្ឋានផងដែរ។**

#### បន្ថែម
- **✅ កំណត់ចំណាំផ្ទៀងផ្ទាត់នៅជំពូកមូលដ្ឋាន និងឯកសារមន្ទីរ** ដើម្បីធ្វើឲ្យមានភាពច្បាស់លាស់ពីគម្រប AZD ដែលបានសាកល្បងសម្រាប់អ្នករៀនដែលប្រើ CLI ថ្មី ឬចាស់
- **⏱️ ការណែនាំពេលវេលាដាក់ចេញ** សម្រាប់ដាក់ចេញកម្មវិធី AI រយៈពេលវែងដោយប្រើ `azd deploy --timeout 1800`
- **🔎 ជំហានពិនិត្យការពង្រីក** ជាមួយ `azd extension show azure.ai.agents` ក្នុងឯកសារផ្ទាល់ការងារ AI
- **🌐 ការណែនាំបរិស្ថានមន្ទីរពហុព័ត៌មាន** រួមបញ្ចូល GitHub Codespaces, dev containers, និង local clones ជាមួយ MkDocs

#### ផ្លាស់ប្តូរ
- **📚 README បើកជំពូក** ឥឡូវបញ្ជាក់យ៉ាងត្រឹមត្រូវពីការផ្ទៀងផ្ទាត់ប្រឆាំង `azd 1.23.12` តាមគ្រប់ផ្នែកមូលដ្ឋាន, ការកំណត់រចនាសម្ព័ន្ធ, អគ្គិសនី, សហគ្រិន agents, មុនដាក់ចេញ, ការដោះស្រាយបញ្ហា និងផលិតកម្ម
- **🛠️ យោងពាក្យបញ្ជា AZD** បានកែទៅទម្រង់បច្ចុប្បន្ននៅគ្រប់ឯកសារ:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ឬ `azd env get-value(s)` អាស្រ័យលើបរិបទ
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` នៅពេលដែលមានការពន្យល់អំពី Application Insights
- **🧪 ឧទាហរណ៍ផ្តល់ជូនមើលជាមុន** បានសម្រួលឲ្យប្រើបានត្រឹមត្រូវបច្ចុប្បន្នដូចជា `azd provision --preview` និង `azd provision --preview -e production`
- **🧭 ដំណើរការមន្ទីរ** បានបច្ចុប្បន្នភាពឲ្យអ្នករៀនអាចបញ្ចប់ការសិក្សានៅ Codespaces, dev container ឬ local clone ជំនួសការនិយាយថា រត់នៅ Codespaces តែម្ដង
- **🔐 ការណែនាំអត្តសញ្ញាណ** ឥឡូវចូលចិត្ត `azd auth login` សម្រាប់ចរន្តការងារ AZD, ជាមួយ `az login` ជាជម្រើសនៅពេលប្រើពាក្យបញ្ជា Azure CLI

#### ជួសជុលរួច
- **🪟 ពាក្យបញ្ជាការតំឡើង Windows** បានធ្វើឲ្យទម្រង់កញ្ចប់ `winget` នៅក្នុងមេរៀនតំឡើងស្មើនឹងបច្ចុប្បន្ន
- **🐧 មេរៀនដំឡើង Linux** បានកែប្រែដើម្បីជៀសវាងការណែនាំគ្រប់គ្រងកញ្ចប់ distro-specificដែលមិនគាំទ្រ `azd` ហើយផ្តោតទៅលើរូបសម្បត្តិចេញផ្សាយនៅពេលដែលសមរម្យ
- **📦 ឧទាហរណ៍ម៉ូដែល AI** បានត្រៀមឡើងវិញពីលក្ខណៈលំនាំដើមចាស់ៗដូចជា `gpt-35-turbo` និង `text-embedding-ada-002` ទៅឧទាហរណ៍បច្ចុប្បន្នដូចជា `gpt-4.1-mini`, `gpt-4.1`, និង `text-embedding-3-large`
- **📋 កូដតំណាងការចែកចាយ និងវាយតម្លៃ** បានកែប្រែដើម្បីប្រើបញ្ជារបរិស្ថានបច្ចុប្បន្ន និងពាក្យបញ្ជាស្ថានភាពក្នុងចំណោមកំណត់ហេតុ,script, និងជំហានជួសជុល
- **⚙️ ការណែនាំ GitHub Actions** បានធ្វើបច្ចុប្បន្នភាពពី `Azure/setup-azd@v1.0.0` ទៅ `Azure/setup-azd@v2`
- **🤖 ការណែនាំអំពីការយល់ព្រម MCP/Copilot** បានធ្វើបច្ចុប្បន្នភាពពី `azd mcp consent` ទៅ `azd copilot consent list`

#### បានកែលម្អ
- **🧠 ការណែនាំជំពូក AI** ឥឡូវពន្យល់លម្អិតអំពីអកប្បកិរិយា preview-sensitive `azd ai`, ការចូលប្រើប្រាស់ជនជាតិជាក់លាក់, ការប្រើប្រាស់ផ្នែកបន្ថែមបច្ចុប្បន្ន, និងការណែនាំកំណត់ម៉ូដែលកែប្រែថ្មី
- **🧪 មេរៀនមូលដ្ឋានការងារ** ឥឡូវប្រើឧទាហរណ៍កំណែដែលមានភាពអនុវត្តជាក់ស្តែងជាងមុន និងភាសាអំពីការតំឡើងបរិស្ថានដែលច្បាស់លាស់សម្រាប់មន្ទីរពិសោធន៍ហត្ថគ្រប់
- **📈 ឯកសារផលិតកម្ម និងជួសជុលបញ្ហា** ឥឡូវសម្រួលល្អជាមួយការត្រួតពិនិត្យបច្ចុប្បន្ន, ម៉ូដែលជំនួស, និងឧទាហរណ៍ថ្នាក់ថ្លៃដើម

#### ឯកសារដែលត្រូវបានធ្វើបច្ចុប្បន្នភាព
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

#### ពាក្យបញ្ជា AZD AI CLI, ការផ្ទៀងផ្ទាត់ខ្លឹមសារ & ការពង្រីកគំរូ
**ជំនាន់នេះបានបន្ថែមការគ្រប់គ្រងពាក្យបញ្ជា `azd ai`, `azd extension` និង `azd mcp` ក្នុងចំណែកទាំងអស់ដែលទាក់ទងនឹង AI, កែតម្រូវតំណភ្ជាប់ខូច និងកូដចាស់នៅក្នុង agents.md, បន្ទាន់សម័យសន្លឹកជំនួយ, និងធ្វើអោយផ្នែកគំរូឧទាហរណ៍មានការកែលម្អជាមួយការពិពណ៌នាដែលបានផ្ទៀងផ្ទាត់ និងគំរូ Azure AI AZD ថ្មី។**

#### បានបន្ថែម
- **🤖 ការគ្រប់គ្រង AZD AI CLI** នៅក្នុងឯកសារ 7 ដុំ (មុនគេលេខ 8 តែប៉ុណ្ណោះ):
  - `docs/chapter-01-foundation/azd-basics.md` — ផ្នែក "បន្ថែមនិងពាក្យបញ្ជា AI" ថ្មីណែនាំពី `azd extension`, `azd ai agent init` និង `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ជម្រើសទី 4: `azd ai agent init` ជាមួយតារាងប្រៀបធៀប (វិធីសាស្រ្តសំពាធទម្រង់ និងវិធីសាស្រ្ត manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ផ្នែករង "AZD Extensions សម្រាប់ Foundry" និង "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — ចាប់ផ្តើមលឿនបង្ហាញផ្លូវការដាក់ទណ្ឌកម្មទាំងតម្រងទម្រង់ និងវិធីសាស្រ្ត manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ផ្នែកដាក់ទណ្ឌកម្មបញ្ចូលជម្រើស `azd ai agent init` បានឥឡូវនេះ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ផ្នែករង "ពាក្យបញ្ជាបន្ថែម AZD AI សម្រាប់ Diagnostics"
  - `resources/cheat-sheet.md` — ផ្នែក "ពាក្យបញ្ជា AI & បន្ថែម" ថ្មី មាន `azd extension`, `azd ai agent init`, `azd mcp` និង `azd infra generate`
- **📦 គំរូ AZD AI ឧទាហរណ៍ថ្មី** នៅក្នុង `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — ការជជែក .NET RAG ជាមួយ Blazor WebAssembly, Semantic Kernel និងគាំទ្រជជែកសំឡេង
  - **azure-search-openai-demo-java** — ការជជែក Java RAG ប្រើ Langchain4J ជាមួយជម្រើសដាក់ទណ្ឌកម្ម ACA/AKS
  - **contoso-creative-writer** — កម្មវិធីសរសេរប្រាជ្ញាជាមួយភ្នាក់ងារ​ច្រើនប្រើ Azure AI Agent Service, Bing Grounding និង Prompty
  - **serverless-chat-langchainjs** — RAG មិនមានម៉ាស៊ីនចាស់ប្រើ Azure Functions + LangChain.js + Cosmos DB ជាមួយគាំទ្រអភិវឌ្ឍន៍ Ollama នៅក្នុងតំបន់
  - **chat-with-your-data-solution-accelerator** — ជំរើសលឿន RAG សម្រាប់ស្ថាប័នជាមួយច្រករដ្ឋបាល, ភ្ជាប់ Teams និងជម្រើស PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — កម្មវិធីយោងរៀបចំ MCP ជាមួយម៉ាស៊ីនបម្រើក្នុង .NET, Python, Java និង TypeScript
  - **azd-ai-starter** — គំរូចាប់ផ្តើម Bicep រចនាសម្ព័ន Azure AI តូចតាច
  - **🔗 លីងផតថលបង្ហាញ AZD AI អស្ចារ្យ** — ឯកសារយោងទៅ [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (គំរូ 80+)

#### បានកែតម្រូវ
- **🔗 នាវីការី agents.md**: តំណមុន/បន្ទាប់ឥឡូវសម្របសម្រួលជាមួយលំដាប់មេរៀន README របស់ជំពូក 2 (ការយោង Microsoft Foundry → Agents → AI Model Deployment)
- **🔗 តំណ agents.md ខូច**: `production-ai-practices.md` ត្រូវបានកែតម្រូវទៅ `../chapter-08-production/production-ai-practices.md` (3 ដង)
- **📦 កូដ agents.md ចាស់**: ជំនួស `opencensus` ជាមួយ `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API មិនត្រឹមត្រូវ agents.md**: ផ្លាស់ប្តូរ `max_tokens` ពី `create_agent()` ទៅ `create_run()` ជា `max_completion_tokens`
- **🔢 agents.md ចំនួន token**: ជំនួសការប៉ាន់ស្មានប្រហែល `len//4` ជា `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: កែប្រែសេវាកម្មពី "Cognitive Search + App Service" ទៅ "Azure AI Search + Azure Container Apps" (ម៉ាស៊ីនម៉ាស៊ីនប្រែផ្លាស់ទី ខែតុលា 2024)
- **contoso-chat**: បន្តបណ្ដូរពិពណ៌នាឲ្យសមរម្យទៅ Azure AI Foundry + Prompty ស្របទៅនាមចំណងជើង និងបច្ចេកទេសរបស់ repo

#### បានដកចេញ
- **ai-document-processing**: ដកតំណភ្ជាប់គំរូមិនប្រើស្ថិតិ (repo មិនអាចចូលប្រើជាសាធារណៈជាគំរូ AZD)

#### បានធ្វើឲ្យប្រសើរឡើង
- **📝 ហាត់ប្រាណ agents.md**: ហាត់ប្រាណទី 1 បង្ហាញលទ្ធផលដែលរំពឹងទុក និងជំហាន `azd monitor`; ហាត់ប្រាណទី 2 រួមបញ្ចូលកូដចុះបញ្ជី `FunctionTool` ពេញលេញ; ហាត់ប្រាណទី 3 ជំនួសការណែនាំមិនច្បាស់ ជាមួយពាក្យបញ្ជា `prepdocs.py` ជាក់លាក់
- **📚 ឯកសារយោង agents.md**: បន្ទាន់សម័យតំណភ្ជាប់ឯកសារទៅឯកសារ Azure AI Agent Service ថ្មីនិង quickstart
- **📋 តារាងជំហានបន្ទាប់ agents.md**: បន្ថែមតំណ AI Workshop Lab សម្រាប់គ្រប់គ្រងជំពូក

#### ឯកសារបានបន្ទាន់សម័យ
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### ការកែលម្អការស្វែងរកមេរៀន
**ជំនាន់នេះបានបង្កើនមុខងារនាវីការសៀវភៅ README.md ដោយការចង្អុលតារាងទម្រង់ប្រសើរជាងមុន។**

#### បានផ្លាស់ប្តូរ
- **តារាងផែនទីវគ្គសិក្សា**: កែលម្អដោយមានតំណភ្ជាប់ផ្ទាល់ទៅមេរៀន រយៈពេលគិតប្រហែល និងការវាយតម្លៃភាពស្មុគស្មាញ
- **ការសម្អាតថត**: ដកថតចាស់ៗមិនចាំបាច់ចេញ (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **បញ្ជាក់តំណភ្ជាប់**: ពិនិត្យតំណភ្ជាប់ក្នុងតារាងផែនទីវគ្គសិក្សា 21+ បានទាំងអស់

### [v3.16.0] - 2026-02-05

#### បន្ទាន់សម័យឈ្មោះផលិតផល
**ជំនាន់នេះបន្ទាន់សម័យការយោងទៅនាមម៉ាក Microsoft ថ្មី។**

#### បានផ្លាស់ប្តូរ
- **Microsoft Foundry → Microsoft Foundry**: បច្ចុប្បន្នភាពគ្រប់ការយោងឯកសារមិនមែនបកប្រែទាំងអស់
- **Azure AI Agent Service → Foundry Agents**: បហ្សើរឈ្មោះសេវាកម្មបន្ថែមតាមម៉ាកថ្មី

#### ឯកសារបានបន្ទាន់សម័យ
- `README.md` - មេរៀនទំព័រចុះចត
- `changelog.md` - ប្រវត្តិជំនាន់
- `course-outline.md` - រចនាសម្ព័ន្ធវគ្គសិក្សា
- `docs/chapter-02-ai-development/agents.md` - មគ្គុទេសក៍ភ្នាក់ងារ AI
- `examples/README.md` - ឯកសារគំរូ
- `workshop/README.md` - ទំព័រចុះចតសិក្ខាសាលា
- `workshop/docs/index.md` - ដារេអនសិក្ខាសាលា
- `workshop/docs/instructions/*.md` - ឯកសារណែនាំសិក្ខាសាលាទាំងអស់

---

### [v3.15.0] - 2026-02-05

#### ការរៀបចំថ្មីសរុបឃ្លាំងទិន្នន័យ៖ ឈ្មោះថតដោយជំពូក
**ជំនាន់នេះរៀបចំបែបបទឯកសារឲ្យប្រើថតដោយជំពូកដើម្បីធ្វើឲ្យសំងាត់ស្វែងរកបានច្បាស់លាស់។**

#### ប្ដូរឈ្មោះថត
ថតចាស់ៗត្រូវបានជំនួសដោយថតលេខជំពូក:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- បានបន្ថែមថ្មី: `docs/chapter-05-multi-agent/`

#### ការផ្លាស់ទីឯកសារ
| ឯកសារ | ពី | ទៅ |
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
| ឯកសារពីមុនទាំងអស់ | pre-deployment/ | chapter-06-pre-deployment/ |
| ឯកសារដោះស្រាយបញ្ហាទាំងអស់ | troubleshooting/ | chapter-07-troubleshooting/ |

#### បានបន្ថែម
- **📚 ឯកសារ README តាមជំពូក**: បង្កើត README.md នៅក្នុងថតជំពូកនីមួយៗ មាន៖
  - គោលបំណងបង្រៀន និងរយៈពេល
  - តារាងមេរៀនជាមួយការពិពណ៌នា
  - ពាក្យបញ្ជាចាប់ផ្តើមរហ័ស
  - វិធីសាស្រ្តស្វែងរកទៅជំពូកផ្សេងទៀត

#### បានផ្លាស់ប្តូរ
- **🔗 កែប្រែបណ្តា៉តំណភ្ជាប់ក្នុង**: 78+ ផ្លូវត្រូវបានបន្ទាន់សម័យក្នុងឯកសារទាំងអស់
- **🗺️ README.md សំខាន់**: បន្ទាន់សម័យផែនទីវគ្គសិក្សាជាមួយរចនាសម្ព័ន្ធជំពូកថ្មី
- **📝 examples/README.md**: បន្ទាន់សម័យការយោងគ្នាទៅថតជំពូក

#### បានដកចេញ
- រចនាសម្ព័ន្ធថតចាស់ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ការរៀបចំឃ្លាំងទិន្នន័យ៖ ការនាវីរក្នុងជំពូក
**ជំនាន់នេះបានបន្ថែមហ្វាយល README នាវីរក្នុងជំពូក (បង្រួមជាមួយ v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### មគ្គុទេសក៍ភ្នាក់ងារ AI ថ្មី
**ជំនាន់នេះបន្ថែមមគ្គុទេសក៍ពេញលេញសម្រាប់ដាក់ទណ្ឌកម្មភ្នាក់ងារ AI ជាមួយ Azure Developer CLI។**

#### បានបន្ថែម
- **🤖 docs/microsoft-foundry/agents.md**: មគ្គុទេសក៍ពេញលេញជាងនេះ:
  - ភ្នាក់ងារ AI ជាអ្វី និងកង្វះខាតពី chatbot
  - គំរូភ្នាក់ងារចាប់ផ្តើមរហ័ស 3 គំរូ (Foundry Agents, Prompty, RAG)
  - គំនិតស្ថាបត្យកម្មភ្នាក់ងារ (ភ្នាក់ងារតែមួយ, RAG, ភ្នាក់ងារច្រើន)
  - ការកំណត់រចនាសម្ព័ន្ធឧបករណ៍ និងប្តូរតាមបំណង
  - ការតាមដាន និងការវាស់វែងគុណភាព
  - ការពិចារណាតម្លៃ និងការបង្កើនប្រសិទ្ធភាព
  - ស្ថានភាពបញ្ហាធម្មតានៅក្នុងដំណើរការ
  - អនុវត្តអោយជាដៃគូ 3 មានលទ្ធផលជោគជ័យ

#### រចនាសម្ព័ន្ធមាតិកា
- **ការណែនាំ**: គំនិតភ្នាក់ងារសម្រាប់អ្នកចាប់ផ្តើម
- **ចាប់ផ្តើមរហ័ស**: ដាក់ទណ្ឌកម្មភ្នាក់ងារជាមួយ `azd init --template get-started-with-ai-agents`
- **គំនិតស្ថាបត្យកម្ម**: រូបភាពអាគារភ្នាក់ងារ
- **ការកំណត់រចនាសម្ព័ន្ធ**: ការតំឡើងឧបករណ៍ និងអថេរបរិស្ថាន
- **ការតាមដាន**: ភ្ជាប់ Application Insights
- **ហាត់បណ្តុះបណ្តាល**: អប់រំតាមដំណាក់កាលលើកដំបូង(20-45 នាទីនិមួយៗ)

---

### [v3.12.0] - 2026-02-05

#### បន្ទាន់សម័យបរិយាកាស DevContainer
**ជំនាន់នេះបន្ទាន់សម័យការកំណត់ DevContainer ជាមួយឧបករណ៍ទំនើប និងលំនាំល្អសម្រាប់បទពិសោធន៍រៀន AZD។**

#### បានផ្លាស់ប្តូរ
- **🐳 រូបភាពមូលដ្ឋាន**: បន្ទាន់សម័យពី `python:3.12-bullseye` ទៅ `python:3.12-bookworm` (Debian stable ថ្មីបំផុត)
- **📛 ឈ្មោះ Container**: ប្ដូរពី "Python 3" ទៅ "AZD for Beginners" សម្រាប់ច្បាស់លាស់

#### បានបន្ថែម
- **🔧 លក្ខណៈថ្មី Dev Container**:
  - `azure-cli` ជាមួយការគាំទ្រប៊ិចកើតមាន
  - `node:20` (ជំនាន់ LTS សម្រាប់គំរូ AZD)
  - `github-cli` សម្រាប់គ្រប់គ្រងគំរូ
  - `docker-in-docker` សម្រាប់ដាក់ទណ្ឌកម្ម container app

- **🔌 បើកផ្លូវទ្វារតភ្ជាប់**: កំពុងត្រូវបានកំណត់រួចសម្រាប់ការអភិវឌ្ឍទូទៅ:
  - 8000 (ការមើលសេចក្ដីរាយការណ៍ MkDocs)
  - 3000 (កម្មវិធីវេប)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 បន្ថែមផ្នែកបន្ថែម VS Code ថ្មីៗ**:
  - `ms-python.vscode-pylance` - ការបង្កើន Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - គាំទ្របង្កើត Azure Functions
  - `ms-azuretools.vscode-docker` - គាំទ្រ Docker
  - `ms-azuretools.vscode-bicep` - គាំទ្រភាសាប៊ិច
  - `ms-azure-devtools.azure-resource-groups` - គ្រប់គ្រងធនធាន Azure
  - `yzhang.markdown-all-in-one` - ការកែតម្រូវ Markdown
  - `DavidAnson.vscode-markdownlint` - ការត្រួតពិនិត្យ Markdown linting
  - `bierner.markdown-mermaid` - គាំទ្ររូបតាង Mermaid
  - `redhat.vscode-yaml` - គាំទ្រ YAML (សម្រាប់ azure.yaml)
  - `eamodio.gitlens` - ការមើលឃើញពី Git
  - `mhutchie.git-graph` - ប្រវត្តិ Git

- **⚙️ ការកំណត់ VS Code**: បន្ថែមការកំណត់លំនាំដើមសម្រាប់ Python interpreter, បំលែងពេលរក្សាទុក និងកាត់សន្លះជួរលំនឹង

- **📦 បើកឡើង requirements-dev.txt ជំនាន់ថ្មី**:
  - បន្ថែមកម្មវិធីបន្ថែមបង្ហាញមុខ MkDocs minify
  - បន្ថែម pre-commit សម្រាប់គុណភាពកូដ
  - បន្ថែមកញ្ចប់ Azure SDK (azure-identity, azure-mgmt-resource)

#### បានកែតម្រូវ
- **ពាក្យបញ្ជា Post-Create**: ឥឡូវត្រួតពិនិត្យការតំឡើង AZD និង Azure CLI ពេល container ចាប់ផ្តើម

---

### [v3.11.0] - 2026-02-05

#### ការធ្វើឲ្យ README សមរម្យសម្រាប់អ្នកចាប់ផ្តើម
**ជំនាន់នេះយ៉ាងច្បាស់បានធ្វើឲ្យ README.md អាចប្រើបានសម្រាប់អ្នកចាប់ផ្តើម និងបន្ថែមឯកសារចាំបាច់សម្រាប់អ្នកអភិវឌ្ឍ AI។**

#### បានបន្ថែម
- **🆚 ការប្រៀបធៀប Azure CLI និង AZD**: បកស្រាយច្បាស់លាស់មុនប្រើឧបករណ៍ណាមួយជាមួយឧទាហរណ៍អនុវត្ត
- **🌟 លីង AZD អស្ចារ្យ**: តំណផ្ទាល់ទៅបណ្ណាល័យគំរូសហគមន៍ និងធនធានរួមចំណែក:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - គំរូមានស្រាប់ 200+
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - រួមចំណែកសហគមន៍
- **🎯 មគ្គុទេសក៍ចាប់ផ្តើមរហ័ស**: ផ្នែកចាប់ផ្តើម៣ជំហានសាមញ្ញ (តំឡើង → ចូល → ដាក់ទណ្ឌកម្ម)
- **📊 តារាងបង្ហាញបទពិសោធន៍សម្រាប់ផ្លូវដើម**: ដែនដែងច្បាស់លាស់ថាតើគួរចាប់ផ្តើមពីឯណា ពេញទៅតាមបទពិសោធន៍អ្នកអភិវឌ្ឍ

#### បានផ្លាស់ប្តូរ
- **រចនាសម្ព័ន្ធ README**: រៀបចំឡើងវិញសម្រាប់បង្ហាញព័ត៌មានយ៉ាងមុតបូក - ព័ត៌មានសំខាន់ជាពាណិជ្ជកម្មជាមុន
- **ផ្នែកណែនាំ**: សរសេរឡើងវិញសម្រាប់ពន្យល់ "ជំនឿពិសេសរបស់ `azd up`" សម្រាប់អ្នកចាប់ផ្តើមទាំងស្រុង
- **បានដកមាតិកាដូចគ្នា**: សង្ស័យផ្នែកដោះស្រាយបញ្ហាដូចគ្នា
- **ពាក្យបញ្ជាជួយដោះស្រាយបញ្ហា**: បានកែប្រែការបញ្ចាក់ពី `azd logs` ដើម្បីប្រើប្រាស់ `azd monitor --logs` ដែលត្រឹមត្រូវ

#### បានកែប្រែ
- **🔐 ពាក្យបញ្ជាសំរាប់ចូលប្រើប្រាស់**: បានបន្ថែម `azd auth login` និង `azd auth logout` ទៅក្នុង cheat-sheet.md
- **ការបញ្ចាក់ពាក្យបញ្ជាដែលមិនត្រឹមត្រូវ**: បានយក `azd logs` ដែលនៅសល់ចេញពីផ្នែកដោះស្រាយបញ្ហារ README

#### ចំណាំ
- **វិសាលភាព**: ការផ្លាស់ប្តូរត្រូវបានអនុវត្តទៅ README.md ចម្បង និង resources/cheat-sheet.md
- **អ្នកគោលដៅ**: ការកែលម្អដែលផ្តោតទៅលើអ្នកអភិវឌ្ឍថ្មីៗដែលប្រើ AZD

---

### [v3.10.0] - 2026-02-05

#### ការបន្ថែមភាពត្រឹមត្រូវនៃពាក្យបញ្ជា Azure Developer CLI
**ជំនាន់នេះបានកែបញ្ជាភាពមិនមានពីពាក្យបញ្ជា AZD នៅក្នុងឯកសារទាំងមូល ដើម្បីធានាថាគំរូកូដទាំងអស់ប្រើសុពលភាពនៃសេចក្តីបញ្ជា Azure Developer CLI។**

#### បានកែប្រែ
- **🔧 ពាក្យបញ្ជា AZD ដែលមិនមានបានយកចេញ**: ស្ទង់មើល និងកែប្រែពាក្យបញ្ជាដែលមិនត្រឹមត្រូវយ៉ាងទូលំទូលាយ៖
  - `azd logs` (មិនមាន) → បានជំនួសជាមួយ `azd monitor --logs` ឬជម្រើស Azure CLI
  - ពាក្យបញ្ជាឈានដល់ `azd service` (មិនមាន) → បានជំនួសជាមួយ `azd show` និង Azure CLI
  - `azd infra import/export/validate` (មិនមាន) → បានយកចេញ ឬបានជំនួសជាមួយជម្រើសត្រឹមត្រូវ
  - អថេរ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (មិនមាន) → បានយកចេញ
  - អថេរ `azd provision --what-if/--rollback` (មិនមាន) → ត្រូវបានធ្វើអាប់ដេតប្រើប្រាស់ `--preview`
  - `azd config validate` (មិនមាន) → បានជំនួសជាមួយ `azd config list`
  - `azd info`, `azd history`, `azd metrics` (មិនមាន) → បានយកចេញ

- **📚 ឯកសារដែលបានធ្វើអាប់ដេតនូវការកែប្រែពាក្យបញ្ជា**:
  - `resources/cheat-sheet.md`: ការប្ដូរយ៉ាងធំទូលាយនៃអត្ថបទសេចក្តីបញ្ជា
  - `docs/deployment/deployment-guide.md`: ការប្រែកស្នាមនិងយុទ្ធសាស្ត្រដាក់ចេញបានកែប្រែ
  - `docs/troubleshooting/debugging.md`: កែប្រែកំណត់តារាងរាយការណ៍
  - `docs/troubleshooting/common-issues.md`: ធ្វើពាក្យបញ្ជាជួយដោះស្រាយបញ្ហា
  - `docs/troubleshooting/ai-troubleshooting.md`: កែការសំនួរកំលាំង AZD
  - `docs/getting-started/azd-basics.md`: កែបញ្ជាការត្រួតពិនិត្យ
  - `docs/getting-started/first-project.md`: ធ្វើប្រើប្រាស់គំរូត្រួតពិនិត្យ និងកែការសំនួរចេញ
  - `docs/getting-started/installation.md`: កែការជំនួយ និងគំរូកំណែ
  - `docs/pre-deployment/application-insights.md`: កែប្រែការមើលកំណត់ត្រា
  - `docs/pre-deployment/coordination-patterns.md`: កែប្រែការសម្អាតភ្នាក់ងារជំហាន

- **📝 បានធ្វើការកែប្រែយោងទៅនឹងជំនាន់**:
  - `docs/getting-started/installation.md`: ប្តូរជំនាន់កំណត់ជា `1.5.0` ទៅជាម៉ូដធម្មតា `1.x.x` ជាមួយតំណភ្ជាប់ទៅកាន់របស់កំណត់ចេញ

#### បានផ្លាស់ប្ដូរ
- **យុទ្ធសាស្ត្រវិលត្រឡប់**: ធ្វើឯកសារដើម្បីប្រើប្រាស់វិលត្រឡប់ដោយ Git (AZD មិនមានវិលត្រឡប់មូលដ្ឋាន)
- **មើលកំណត់ត្រា**: ជំនួសការបញ្ចាក់ `azd logs` ជាមួយ `azd monitor --logs`, `azd monitor --live` និងពាក្យបញ្ជា Azure CLI
- **ផ្នែកសមត្ថភាព**: អថេរដាក់ចេញគ្មានសុពលភាពត្រូវបានយកចេញ និងផ្តល់ជម្រើសត្រឹមត្រូវ

#### ព័ត៌មានបច្ចេកទេស
- **ពាក្យបញ្ជា AZD ត្រឹមត្រូវ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **អថេរជាមួយ azd monitor ត្រឹមត្រូវ**: `--live`, `--logs`, `--overview`
- **លុបចោលមុខងារ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### ចំណាំ
- **ការត្រួតពិនិត្យ**: ពាក្យបញ្ជាត្រូវបានផ្ទៀងផ្ទាត់ជាមួយ Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### បញ្ចប់វគ្គសិក្សានឹងកែលម្អគុណភាពឯកសារ
**ជំនាន់នេះបញ្ចប់វគ្គសិក្សាដែលអាចអន្តរកម្មបាន ជួសជុលតំណភ្ជាប់ឯកសារដែលខូច ហើយកែលម្អគុណភាពមាតិកាសម្រាប់អ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD។**

#### បានបន្ថែម
- **📝 CONTRIBUTING.md**: ឯកសារណែនាំការរួមចំណែកថ្មីដែលមាន៖
  - សេចក្តីណែនាំច្បាស់សម្រាប់រាយការណ៍បញ្ហានិងផ្តល់កំណែប្រែ
  - ស្តង់ដារឯកសារសម្រាប់មាតិកាថ្មី
  - លក្ខណៈគំរូកូដនិងប្រព័ន្ធសារដេប៊ីត
  - ព័ត៌មានទាក់ទងនឹងសហគមន៍

#### បានបញ្ចប់
- **🎯 វគ្គសិក្សា 7 (បញ្ចប់)**: បញ្ចប់ពេញលេញវគ្គសិក្សាបញ្ចប់ជាមួយៈ
  - សេចក្តីសង្ខេបពេញលេញនៃក្តីសម្រេចក្នុងវគ្គ
  - ផ្នែកគន្លងសេសស្យុងដែលរៀនបានគ្របដណ្តប់ AZD, មាគ័រគំរូ, និង Microsoft Foundry
  - ការណែនាំបន្តក្នុងវិថីការសិក្សា
  - សម្តែងវិញ្ញាសារវគ្គសិក្សាជាមួយជំនាញកម្រិតក្រាស់ក្រែង
  - តំណភ្ជាប់មតិ និងគាំទ្រសហគមន៍

- **📚 វគ្គសិក្សា 3 (បំបែក)**: ធ្វើអាប់ដេតគោលបំណងរៀនជាមួយៈ
  - GitHub Copilot ជាមួយ MCP servers មុខងារត្រូវបានបើក
  - ការយល់ដឹងរចនាសម្ព័ន្ធថត AZD template
  - លំនាំរៀបចំ infrastructure-as-code (Bicep)
  - សេចក្តីណែនាំមន្ទីរបណ្ដុះបណ្ដាល

- **🔧 វគ្គសិក្សា 6 (បិទ)**: បញ្ចប់ជាមួយៈ
  - គោលបំណងសម្អាតធនធាន និងគ្រប់គ្រងការចំណាយ
  - ការប្រើប្រាស់ `azd down` សម្រាប់ការបញ្ចប់សុវត្ថិភាពនៃរចនាសម្ព័ន្ធ
  - ការណែនាំស្តារសេវាកម្មប្រើប្រាស់វិធី soft deleted cognitive services
  - ការស្ទង់យ៉ាងល្អបន្ថែមសម្រាប់ GitHub Copilot និង Azure Portal

#### បានកែប្រែ
- **🔗 ជួសជុលតំណខូច**: ដោះស្រាយតំណភ្ជាប់ឯកសារខូចជាង 15 តំណ៖
  - `docs/ai-foundry/ai-model-deployment.md`: កែលម្អផ្លូវទៅ microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: កែផ្លូវ ai-model-deployment.md និង production-ai-practices.md
  - `docs/getting-started/first-project.md`: ជំនួស cicd-integration.md មិនមានជាមួយ deployment-guide.md
  - `examples/retail-scenario.md`: កែលម្អផ្លូវ FAQ និងចំណាំដោះស្រាយបញ្ហា
  - `examples/container-app/microservices/README.md`: កែផ្លូវមេរៀន និង deployment guide
  - `resources/faq.md` និង `resources/glossary.md`: ធ្វើអាប់ដេតយោងមុខវិជ្ជា AI
  - `course-outline.md`: កែលម្អឯកសារណែនាំគ្រូ និង AI workshop lab

- **📅 ស្ថានភាពបដាណនវគ្គសិក្សា**: ធ្វើអាប់ដេតពី "កំពុងសាងសង់" ជាស្ថានភាពវគ្គសិក្សារត់បានដោយសុវត្ថិភាពជាមួយកាលបរិច្ឆេទ ខែកុម្ភៈ 2026

- **🔗 នាវីហ្គេស្យុងវគ្គសិក្សា**: ជួសជុលតំណផ្លូវខូចក្នុង README.md របស់វគ្គសិក្សា ដែលបង្ហាញទៅថត lab-1-azd-basics មិនមាន

#### បានផ្លាស់ប្ដូរ
- **ការបង្ហាញវគ្គសិក្សា**: លុបការព្រមាន "កំពុងសាងសង់" វគ្គសិក្សាចប់ ហើយត្រៀមប្រើប្រាស់បាន
- **ភាពរលូននៃការណាវីហ្គេស្យុង**: ធានាថាវគ្គសិក្សាអាចដំណើរការ​ណាវីហ្គេស្យុងបានល្អរវាងវគ្គនីមួយៗ
- **យោងផ្លូវរៀន**: ធ្វើអាប់ដេតយោងចំណងជើងមុខវិជ្ជា microsoft-foundry ដោយមានផ្លូវត្រឹមត្រូវ

#### បានផ្ទៀងផ្ទាត់
- ✅ ឯកសារ markdown ថាតែម្ដងភាសាអង់គ្លេសមានតំណភ្ជាប់ក្នុងត្រឹមត្រូវ
- ✅ វគ្គសិក្សា 0-7 បានបញ្ចប់ជាមួយគោលបំណងរៀន
- ✅ ដំណើរការណាវីហ្គេស្យុងរវាងចំណងជើងនិងវគ្គរត់បានត្រឹមត្រូវ
- ✅ មាតិកាត្រូវតំណាងសម្រាប់អ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD
- ✅ គេហទំព័ររបស់ភាសាមុខងាររៀបចំសមរម្យសម្រាប់អ្នកចាប់ផ្តើម
- ✅ CONTRIBUTING.md ផ្តល់ណែនាំច្បាស់សម្រាប់អ្នករួមចំណែកសហគមន៍

#### ការអនុវត្តបច្ចេកទេស
- **ការផ្ទៀងផ្ទាត់តំណ**: ស្គ្រីប PowerShell ដោយស្វ័យប្រវត្តិបានផ្ទៀងផ្ទាត់គ្រប់ .md តំណភ្ជាប់ក្នុងឯកសារ
- **ថតស្ទង់មើលមាតិច**: ការត្រួតផ្ទៀងដោយដៃលើភាពពេញលេញខ្លឹមសារវគ្គសិក្សា និងសមត្ថភាពសម្រាប់អ្នកចាប់ផ្តើម
- **ប្រព័ន្ធណាវីហ្គេស្យុង**: លំនាំរវាងចំណងជើងនិងវគ្គបានអនុវត្តយ៉ាងរលូន

#### ចំណាំ
- **វិសាលភាព**: ការផ្លាស់ប្ដូរត្រូវបានអនុវត្តទៅឯកសារភាសាអង់គ្លេសតែប៉ុណ្ណោះ
- **ការប្រែប្រាស**: ថតបកប្រែគ្មានការផ្លាស់ប្ដូរនៅក្នុងជំនាន់នេះ (ការប្រែប្រាស់ដោយស្វ័យប្រវត្តិ​នឹងផ្ទៀងផ្ទាត់ក្រោយ)
- **រយៈពេលវគ្គសិក្សា**: វគ្គសិក្សាពេញលេញឥឡូវនេះផ្តល់ការសិក្សាប្រហែល 3-4 ម៉ោងមានការអនុវត្តដោយដៃ

---

### [v3.8.0] - 2025-11-19

#### ឯកសារជាក់លាក់៖ ការត្រួតពិនិត្យ សុវត្ថិភាព និងគំរូភេរវកម្មច្រើនភ្នាក់ងារ
**ជំនាន់នេះបន្ថែមមេរៀនជាកម្រិត A ពេញលេញអំពីការបញ្ចូល Application Insights, គំរូសុវត្ថិភាព និងការសម្របសម្រួលវេទិកាភ្នាក់ងារច្រើនសម្រាប់ដាក់ចេញផលិតកម្ម។**

#### បានបន្ថែម
- **📊 មេរៀនបញ្ចូល Application Insights**: នៅក្នុង `docs/pre-deployment/application-insights.md`:
  - ការដាក់ចេញផ្តោត AZD ជាមួយការផ្តល់សេវា​បញ្ញើបុកខ្លួន
  - គំរូ Bicep ពេញលេញសម្រាប់ Application Insights និង Log Analytics
  - កម្មវិធី Python ដែលសកម្មជាមួយ telemetry ផ្ទាល់ខ្លួន (ជួរ 1,200+)
  - គំរូត្រួតពិនិត្យ AI/LLM (Microsoft Foundry Models តាមដាន token/ការចំណាយ)
  - គំនូស Mermaid 6 សន្លឹក (សំណង់, tracing ចែកចាយ, ដំណើរការ telemetry)
  - ហាត់ដាំដៃ 3 មុខ (ការជូនដំណឹង, dashboard, ការត្រួតពិនិត្យ AI)
  - ឧទាហរណ៍សំណួរ Kusto និងយុទ្ធសាស្ដ្រប្រគល់ថ្លៃឲ្យតិច
  - ស្ទ្រីមមេត្រិចបន្តផ្ទាល់ និងការសម្អាតបញ្ហាពេលពិត
  - ពេលសិក្សា 40-50 នាទីជាមួយគំរូផលិតកម្ម

- **🔐 មេរៀនសុវត្ថិភាព និងការចូលប្រើ**: នៅក្នុង `docs/getting-started/authsecurity.md`:
  - គំរូចូលប្រើ 3 ប្រភេទ (ខ្សែការតភ្ជាប់, Key Vault, managed identity)
  - គំរូស្ថាបត្យកម្ម Bicep ពេញលេញសម្រាប់ដាក់ចេញដែលមានសុវត្ថិភាព
  - កូដកម្មវិធី Node.js ជាមួយការបញ្ចូល Azure SDK
  - ហាត់ដាំដៃ 3 សំណុំ (បើក managed identity, user-assigned identity, បដិសេធ Key Vault)
  - អនុវត្តសុវត្ថិភាពល្អប្រសើរ និងការកំណត់ RBAC
  - មគ្គុទេសក៍ដោះស្រាយបញ្ហា និងវិភាគថ្លៃឈ្នួល
  - គំរូចូលប្រើដោយគ្មានពាក្យសម្ងាត់សម្រាប់ផលិតកម្ម

- **🤖 មេរៀនគំរូសម្របសម្រួលភ្នាក់ងារច្រើន**: នៅក្នុង `docs/pre-deployment/coordination-patterns.md`:
  - គំរូសម្របសម្រួល 5 ប្រភេទ (ជាតារ, 병렬, hierarchical, បណ្តាលព្រឹត្តិការណ៍, សន្ទស្សន៍មតិ)
  - ការអនុវត្តសេវាអនុវត្តឈ្មោះ orchestrator ពេញលេញ (Python/Flask, 1,500+ ជួរ)
  - ការអនុវត្តភ្នាក់ងារពិសេស 3 (Research, Writer, Editor)
  - បញ្ចូលនូវ Service Bus សម្រាប់ការតម្រង់សារជា​មួួយ
  - ការគ្រប់គ្រងស្ថានភាព Cosmos DB សម្រាប់ប្រព័ន្ធចែកចាយ
  - គំនូស Mermaid 6 ចង្អុលបង្ហាញអន្តរកម្មភ្នាក់ងារ
  - ហាត់ដាំដៃ 3 ចំណាត់ថ្នាក់ខ្ពស់ (ដោះស្រាយដាច់ពេល, ដាក់តំណរវិញ, ការបិទសៀគ្វី)
  - ការបំបែកថ្លៃជិត $240-565 ក្នុងមួយខែ ជាមួយយុទ្ធសាស្ត្រប្រគល់តម្លៃ
  - ការបញ្ចូល Application Insights សម្រាប់ត្រួតពិនិត្យ

#### បានបង្កើន
- **ជំពូកមុនដាក់ចេញ**: ឥឡូវនេះរួមបញ្ចូលគំរូត្រួតពិនិត្យ និងសម្របសម្រួលពេញលេញ
- **ជំពូកចាប់ផ្តើម**: បានបង្កើនគំរូសុវត្ថិភាពមុខវិជ្ជាជីព
- **ភាពសិក្សាផលិតកម្ម**: គ្របដណ្តប់ពេញលេញពីសុវត្ថិភាពដល់ការពិនិត្យ
- **រចនាសម្ព័ន្ធវគ្គសិក្សា**: បានធ្វើអាប់ដេតយោងទៅមេរៀនថ្មីក្នុងជំពូក 3 និង 6

####បានផ្លាស់ប្ដូរ
- **ការរីកចម្រើនការសិក្សា**: រួមបញ្ចូលសុវត្ថិភាព និងការត្រួតពិនិត្យល្អជាងមុនពេញវគ្គសិក្សា
- **គុណភាពឯកសារ**: ស្តង់ដារជាប្រភេទ A-grade (95-97%) ប្រសើរឡើងនៅក្នុងមេរៀនថ្មី
- **គំរូផលិតកម្ម**: គ្របដណ្តប់ពីដើមដល់ចប់សម្រាប់ដាក់ចេញនៅក្រុមហ៊ុន

#### បានកែលម្អ
- **បទពិសោធន៍អ្នកអភិវឌ្ឍ**: ផ្លូវច្បាស់ពីការអភិវឌ្ឍទៅការត្រួតពិនិត្យផលិតកម្ម
- **ស្តង់ដារសុវត្ថិភាព**: គំរូជាពិសេសសម្រាប់ការចូលប្រើ និងគ្រប់គ្រងសម្ងាត់
- **ការត្រួតពិនិត្យ**: ការបញ្ចូល Application Insights ពេញលេញជាមួយ AZD
- **បន្ទុក AI**: ត្រួតពិនិត្យពិសេសសម្រាប់ Microsoft Foundry Models និងប្រព័ន្ធភ្នាក់ងារច្រើន

#### បានផ្ទៀងផ្ទាត់
- ✅ មេរៀនទាំងអស់រួមបញ្ចូលកូដសកម្មពេញលេញ (មិនមែន snippets)
- ✅ គំនូស Mermaid សម្រាប់ការរៀន​ដាក់តម្កល់ (19 នាទីជាមុននៅក្នុង 3 មេរៀន)
- ✅ ហាត់ដាំដៃជាមួយជំហានផ្ទៀងផ្ទាត់ (9 សំណុំ)
- ✅ គំរូ Bicep សម្រាប់ដាក់ចេញដោយ `azd up` បានត្រៀមស្រាប់
- ✅ វិភាគថ្លៃឈ្នួល និងយុទ្ធសាស្ត្រប្រគល់តម្លៃ
- ✅មគ្គុទេសក៍ដោះស្រាយបញ្ហា និងអនុវត្តបច្ចេកទេសល្អៗ
- ✅ ចំណុចពិនិត្យចំណេះដឹងជាមួយពាក្យបញ្ជាត្រួតពិនិត្យ

#### លទ្ធផលផ្នែកការវាយតម្លៃឯកសារ
- **docs/pre-deployment/application-insights.md**: - មគ្គុទេសក៍ត្រួតពិនិត្យទូលំទូលាយ
- **docs/getting-started/authsecurity.md**: - គំរូសុវត្ថិភាពជាជំនាញរបស់អ្នកជំនាញ
- **docs/pre-deployment/coordination-patterns.md**: - ស្ថាបត្យកម្មឃ្លាំងភ្នាក់ងារច្រើនកម្រិតខ្ពស់
- **មាតិកាថ្មីទាំងមូល**: - ស្តង់ដារខ្ពស់ជាប់គ្នា

#### ការអនុវត្តបច្ចេកទេស
- **Application Insights**: Log Analytics + telemetry ផ្ទាល់ខ្លួន + tracing ចែកចាយ
- **Authentication**: Managed Identity + Key Vault + គំរូ RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ការរៀបចំ
- **ការត្រួតពិនិត្យ**: ម៉េត្រិចផ្ទាល់ + សំណួរ Kusto + អាស្រ័យការ + dashboard
- **គ្រប់គ្រងថ្លៃឈ្នួល**: យុទ្ធសាស្ត្រប្រើវាយតម្លៃ, គោលនយោបាយរក្សាទុក, គ្រប់គ្រងថវិការ

### [v3.7.0] - 2025-11-19

#### កែលម្អគុណភាពឯកសារនិងឧទាហរណ៍ Microsoft Foundry Models ថ្មី
**ជំនាន់នេះធ្វើការកែលម្អគុណភាពឯកសារក្នុងឃ្លាំង ហើយបន្ថែមឧទាហរណ៍ដាក់ចេញ Microsoft Foundry Models ពេញលេញជាមួយចំណុចទំនាក់ទំនង gpt-4.1។**

#### បានបន្ថែម
- **🤖 ឧទាហរណ៍ជជែក Microsoft Foundry Models**: ដាក់ចេញជាមួយ gpt-4.1 ស្រេចនៅក្នុង `examples/azure-openai-chat/`:
  - រចនាសម្ព័ន្ធ Microsoft Foundry Models ពេញលេញ (ដាក់ចេញម៉ូដែល gpt-4.1)
  - ម៉ាស៊ីនជជែក Python ជា Command-line ជាមួយប្រវត្តិជជែក
  - ការបញ្ចូល Key Vault សម្រាប់ផ្ទុក API key យ៉ាងសុវត្ថិភាព
  - ការតាមដានប្រើប្រាស់ token និងការប៉ាន់ស្មានថ្លៃ
  - ការត្រួតពិនិត្យកំរិតអតិបរមា និងការព្យួរខុស
  - README ពិស្តារជាមួយមគ្គុទេសក៍ដាក់ចេញក្នុងរយៈពេល 35-45 នាទី
  - ឯកសារផលិតកម្ម 11 ឯកសារ (គំរូ Bicep, កម្មវិធី Python, ការកំណត់រចនាសម្ព័ន្ធ)
- **📚 ហាត់ស្រាវជ្រាវឯកសារ**: បន្ថែមវគ្គហាត់ដោយដៃទៅក្នុងមគ្គុទេសក៍កំណត់រចនាសម្ព័ន្ធ:
  - ហាត់ 1: កំណត់រចនាសម្ព័ន្ធបណ្ដាអង្គភាព (15 នាទី)
  - ហាត់ 2: ហាត់គ្រប់គ្រងសម្ងាត់ (10 នាទី)
  - យុទ្ធសាស្ត្រជោគជ័យច្បាស់ និងជំហានផ្ទៀងផ្ទាត់
- **✅ ផ្នែកផ្ទៀងផ្ទាត់ការដាក់ចេញ**: បន្ថែម ផ្នែកផ្ទៀងផ្ទាត់ទៅក្នុងការណែនាំដាក់ចេញ:
  - របៀបពិនិត្យសុខភាព
  - បញ្ជីត្រួតពិនិត្យសំរាប់ភាពជោគជ័យ
  - ផលដែលរំពឹងទុកសម្រាប់ពាក្យបញ្ជាដាក់ចេញទាំងអស់
  - គោលការណ៍ពីរបៀបដោះស្រាយបញ្ហាប្រាប់ឆាប់

#### បានបង្កើន
- **examples/README.md**: ធ្វើអាប់ដេតទៅគុណភាព A-grade (93%):
  - បន្ថែម azure-openai-chat ទៅគ្រប់ផ្នែកដែលពាក់ព័ន្ធ
  - កែប្រែចំនួនឧទាហរណ៍តំបន់ទឹកដីពី 3 ទៅ 4
  - បន្ថែមទៅក្នុងតារាង AI Application Examples
  - រួមបញ្ចូលក្នុង Quick Start សម្រាប់អ្នកប្រើប្រាស់កម្រិតមធ្យម
  - បន្ថែមទៅក្នុងផ្នែក Microsoft Foundry Templates
  - ធ្វើអាប់ដេតម៉ាទ្រីសប្រៀបធៀប និងផ្នែកស្វែងរកបច្ចេកវិទ្យា
- **គុណភាពឯកសារ**: ធ្វើឱ្យប្រសើរឡើងពី B+ (87%) → A- (92%) តាមថតឯកសារទាំងមូល៖
  - បន្ថែមលទ្ធផលដែលរំពឹងទុកទៅកាន់ខ្លឹមសារបញ្ជាការសំខាន់ៗ
  - រួមបញ្ចូលជំហានផ្ទៀងផ្ទាត់សម្រាប់ការផ្លាស់ប្តូរកំណត់ត្រា
  - ពង្រឹងការរៀនដោយប្រើដៃជាមួយនឹងលំហាត់បច្ចេកទេស

#### ផ្លាស់ប្តូរ
- **ការរីកចម្រើនការសិក្សា**: សមាសភាពល្អប្រសើរជាងមុននៃឧទាហរណ៍ AI សម្រាប់អ្នករៀននៅកំរិតមធ្យម
- **រចនាសម្ព័ន្ធឯកសារ**: លំហាត់ដែលអាចអនុវត្តបានជាច្រើនជាមួយលទ្ធផលច្បាស់លាស់
- **ដំណើរការផ្ទៀងផ្ទាត់**: បញ្ចូលលក្ខខណ្ឌជោគជ័យយ៉ាងច្បាស់នៅក្នុងដំណើរការសំខាន់ៗ

#### ធ្វើឱ្យប្រសើរឡើង
- **បទពិសោធន៍អ្នកអភិវឌ្ឍន៍**: ការ​ដំឡើងក្រុមម៉ូដែល Microsoft Foundry ឥឡូវនេះចំណាយពេល 35-45 នាទី (ប្រៀបធៀបនឹង 60-90 នាទី សម្រាប់ជម្រើសស្មុគស្មាញ)
- **ភាពច្បាស់លាស់ថ្លៃការ**: ការប៉ាន់ស្មានថ្លៃប្រាក់ច្បាស់ ($50-200/ខែ) ដើម្បីយកឧទាហរណ៍ម៉ូដែល Microsoft Foundry
- **ផ្លូវរៀន**: អភិវឌ្ឍន៍ AI មានចំណុចចូលច្បាស់ជាមួយ azure-openai-chat
- **ស្តង់ដារឯកសារ**: លទ្ធផលដែលរំពឹងទុក និងជំហានផ្ទៀងផ្ទាត់មានភាពជាលក្ខណៈស្ទាត់ចិត្ត

#### បានផ្ទៀងផ្ទាត់
- ✅ ឧទាហរណ៍ Microsoft Foundry Models អាចប្រើបានពេញលេញជាមួយ `azd up`
- ✅ ឯកសារអនុវត្ត 11 ទិន្នន័យទាំងអស់ត្រឹមត្រូវ
- ✅ សេចក្តីណែនាំ README នឹងបទពិសោធការតំឡើងពិតប្រាកដគ្នា
- ✅ តំណខ្សែឯកសារត្រូវបានអាប់ដេតនៅកន្លែងច្រើនជាង 8 ទីតាំង
- ✅ ដូច្នេះ បញ្ជីឧទាហរណ៍បង្ហាញខ្លះច្បាស់លាស់ 4 ឧទាហរណ៍ក្នុងតំបន់
- ✅ មិនមានតំណខាងក្រៅម្តេចឡើងវិញនៅក្នុងតារាង
- ✅ តំណណាវីហ្គេសិនទាំងអស់ត្រឹមត្រូវ

#### អនុវត្តបច្ចេកទេស
- **ស្ថាបត្យកម្ម Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps លំនាំ
- **សន្តិសុខ**: បច្ចេកទេស Managed Identity ស្រេចរៀបចំ, សម្ងាត់នៅក្នុង Key Vault
- **ការត្រួតពិនិត្យ**: រួមបញ្ចូល Application Insights
- **គ្រប់គ្រងថ្លៃថ្នូរ**: តាមដាន Token និងអភិវឌ្ឍកម្មប្រើប្រាស់
- **ការដំឡើង**: បញ្ជាការ `azd up` តែមួយសម្រាប់ការតំឡើងពេញលេញ

### [v3.6.0] - 2025-11-19

#### ការអាប់ដេតធំ: ឧទាហរណ៍ដំឡើង Container App
**មករបស់នេះបង្ហាញពីឧទាហរណ៍ដំឡើងកម្មវិធី container ដែលមានស្រាប់ក្នុងផលិតកម្មដោយប្រើ Azure Developer CLI (AZD), មានឯកសារពេញលេញ និងត្រូវរួមបញ្ចូលទៅក្នុងផ្លូវការសិក្សា។**

#### បន្ថែម
- **🚀 ឧទាហរណ៍ Container App**: ឧទាហរណ៍ថ្មីក្នុង `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): ការពិពណ៌នាពេញលេញពីការដំឡើង container, ចាប់ផ្តើមលឿន, ផលិតកម្ម និងលំនាំខ្ពស់
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API សាមញ្ញសម្រាប់អ្នកចាប់ផ្តើម មានការកំណត់ស្កែលឡើងទៅសូន្យ, ការត្រួតពិនិត្យសុខភាព, ការត្រួតត្រា និងការជួសជុលកម្មវិធី
  - [Microservices Architecture](../../examples/container-app/microservices): ដំឡើង multiservices រួចទៅផលិតកម្ម (API Gateway, ផលិតផល, ការបញ្ជាទិញ, អ្នកប្រើ, ការជូនដំណឹង), ការបញ្ជូនសារ async, Service Bus, Cosmos DB, Azure SQL, tracing ចែកចាយ, blue-green/canary deployment
- **អនុវត្តល្អបំផុត**: សន្តិសុខ, ការត្រួតត្រា, ការអភិវឌ្ឍថ្លៃ, និងដំណឹង CI/CD សម្រាប់បន្ទុក container
- **គំរូកូដ**: ពេញលេញ `azure.yaml`, ទំព័រទម្រង់ Bicep, និងកូដសេវាមួយច្រើនភាសា (Python, Node.js, C#, Go)
- **ការធ្វើតេស្ត និងការជួសជុល**: ស្នាដៃតេស្តតួចម្លង, បញ្ជាការត្រួតពិនិត្យ និងជំនួយលំអង្ស

#### ផ្លាស់ប្តូរ
- **README.md**: បានបន្ថែមអត្ថបទ និងតំណភ្ជាប់ឧទាហរណ៍ container app ថ្មីនៅក្រោម "Local Examples - Container Applications"
- **examples/README.md**: បន្ថែមសេចក្តីបង្ហាញអំពី container app, បន្ថែមគន្លងតារាងប្រៀបធៀប និងអាប់ដេតយោងបច្ចេកវិទ្យា/ស្ថាបត្យកម្ម
- **ទ្រង់ទ្រាយវគ្គសិក្សា & សៀវភៅរៀន**: បានបន្ថែមឧទាហរណ៍ container app និងលំនាំដំឡើងនៅជំពូកពាក់ព័ន្ធ

#### បានផ្ទៀងផ្ទាត់
- ✅ ឧទាហរណ៍ថ្មីទាំងអស់អាចដំឡើងដោយ `azd up` និងអនុវត្តល្អបំផុត
- ✅ តំណឯកសារក្រាស់ស៊ាងនិងរុករកបានអាប់ដេត
- ✅ ឧទាហរណ៍គ្របដណ្តប់ពីអ្នកចាប់ផ្តើមទៅនៃលក្ខណៈខ្ពស់ រួមមានម៉ិចរោស្វីសផលិតកម្ម

#### ចំណាំ
- **វិសាលភាព**: ឯកសារជាភាសាអង់គ្លេស និងឧទាហរណ៍តែប៉ុណ្ណោះ
- **ជំហានបន្ទាប់**: ពង្រីកជាមួយលំនាំ container ស្មុគស្មាញបន្ថែម និងស្វ័យប្រវត្តិកម្ម CI/CD ក្នុងការចេញផ្សាយក្រោយ

### [v3.5.0] - 2025-11-19

#### ការផ្លាស់ប្តូរឈ្មោះផលិតផល: Microsoft Foundry
**ម៉ាកនេះអនុវត្តការផ្លាស់ប្តូរឈ្មោះផលិតផលយ៉ាងទូលំទូលាយពី "Microsoft Foundry" ទៅ "Microsoft Foundry" ក្នុងឯកសារអង់គ្លេសទាំងអស់ ដែលសម្តែងការផ្លាស់ប្តូរផ្លូវការរបស់ Microsoft។**

#### ផ្លាស់ប្តូរ
- **🔄 ការផ្លាស់ប្តូរឈ្មោះផលិតផល**: ផ្លាស់ប្តូរឈ្មោះពេញលេញពី "Microsoft Foundry" ទៅ "Microsoft Foundry"
  - បានអាប់ដេតយោងទាំងអស់នៅក្នុងថតវិញ្ញាសា `docs/`
  - ប្ដូរឈ្មោះថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ប្ដូរឈ្មោះឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - សរុបៈ បានអាប់ដេតយោងខ្លឹមសារចំនួន 23 ក្នុងឯកសារ 7 ផ្សេងគ្នា

- **📁 ការផ្លាស់ប្តូររចនាសម្ព័ន្ធថត**:
  - `docs/ai-foundry/` បានប្ដូរឈ្មោះទៅ `docs/microsoft-foundry/`
  - តំណភ្ជាប់ឆ្លងកាត់ទាំងអស់បានអាប់ដេតឲ្យសមរម្យ
  - តំណនាវីហ្គេសិនបានផ្ទៀងផ្ទាត់ត្រឹមត្រូវទូទាំងឯកសារ

- **📄 ការប្ដូរឈ្មោះឯកសារ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - តំណខាងក្នុងទាំងអស់បានអាប់ដេតឲ្យយោងបន្ថែមទៅឈ្មោះឯកសារថ្មី

#### ឯកសារដែលបានអាប់ដេត
- **ឯកសារជំពូក** (7 ឯកសារ):
  - `docs/microsoft-foundry/ai-model-deployment.md` - អាប់ដេតតំណនាវីហ្គេសិន 3 ខ្ទង់
  - `docs/microsoft-foundry/ai-workshop-lab.md` - អាប់ដេតយោងឈ្មោះផលិតផល 4 ខ្ទង់
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ប្រើប្រាស់ Microsoft Foundry រួច (ពីការអាប់ដេតមុន)
  - `docs/microsoft-foundry/production-ai-practices.md` - អាប់ដេត 3 យោង (ទិដ្ឋភាពទូទៅ, មតិយោបល់សហគមន៍, ឯកសារ)
  - `docs/getting-started/azd-basics.md` - អាប់ដេត 4 តំណត្រូវឆ្លងកាត់
  - `docs/getting-started/first-project.md` - អាប់ដេត 2 តំណនាវីហ្គេសិនជំពូក
  - `docs/getting-started/installation.md` - អាប់ដេត 2 តំណជំពូកបន្ទាប់
  - `docs/troubleshooting/ai-troubleshooting.md` - អាប់ដេត 3 យោង (នាវីហ្គេសិន, សហគមន៍ Discord)
  - `docs/troubleshooting/common-issues.md` - អាប់ដេតតំណនាវីហ្គេសិន 1
  - `docs/troubleshooting/debugging.md` - អាប់ដេតតំណនាវីហ្គេសិន 1

- **ឯកសាររចនាសម្ព័ន្ធវគ្គសិក្សា** (2 ឯកសារ):
  - `README.md` - អាប់ដេត 17 យោង (ទិដ្ឋភាពវគ្គសិក្សា, ចំណងជើងជំពូក, ផ្នែកគំរូ, ដឹងពីសហគមន៍)
  - `course-outline.md` - អាប់ដេត 14 យោង (ទិដ្ឋភាពទូទៅ, គោលបំណងសិក្សា, ឯកសារជំពូក)

#### បានផ្ទៀងផ្ទាត់
- ✅ គ្មានយោងផ្លូវថត "ai-foundry" នៅឯកសារ​អង់គ្លេស
- ✅ គ្មានយោងឈ្មោះផលិតផល "Microsoft Foundry" នៅឯកសារ​អង់គ្លេស
- ✅ តំណនាវីហ្គេសិនទាំងអស់ដំណើរការល្អជាមួយរចនាសម្ព័ន្ធថតថ្មី
- ✅ ការប្ដូរឈ្មោះឯកសារ និងថតបានជោគជ័យ
- ✅ ផ្ទៃបញ្ចូលតំណភ្ជាប់រវាងជំពូកត្រូវបានធ្វើបច្ចុប្បន្នភាព

#### ចំណាំ
- **វិសាលភាព**: ការផ្លាស់ប្តូរនេះអនុវត្តនៅក្នុងឯកសារអង់គ្លេស នៅថត `docs/` តែប៉ុណ្ណោះ
- **ការប្រែប្រែភាសា**: ថតប្រែប្រែភាសា (`translations/`) មិនបានអាប់ដេតក្នុងកំណែនេះ
- **សិក្សាពិគ្រោះយោបល់**: ឯកសារសិក្សា (`workshop/`) មិនបានអាប់ដេតក្នុងកំណែនេះ
- **ឧទាហរណ៍**: ឯកសារ ឧទាហរណ៍ អាចនៅតែយោងឈ្មោះចាស់ (នឹងដំណើរការជំនួសក្រោយ)
- **តំណខាងក្រៅ**: URL ខាងក្រៅ និងធនធាន GitHub មិនបានប្ដូរទេ

#### គន្លឹះផ្លូវចេញសម្រាប់អ្នកចូលរួម
ប្រសិនបើអ្នកមានសាខា​ផ្ទាល់ខ្លួន ឬឯកសារយោងទៅលើរចនាសម្ព័ន្ធចាស់:
1. អាប់ដេតយោងថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. អាប់ដេតយោងឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ជំនួសឈ្មោះផលិតផល: "Microsoft Foundry" → "Microsoft Foundry"
4. ផ្ទៀងផ្ទាត់តំណឯកសារខាងក្នុងទាំងអស់នៅតែដំណើរការ

---

### [v3.4.0] - 2025-10-24

#### ការពិនិត្យមើល និងកែលម្អបរិក្ខារជា Preview
**កំណែនេះបន្ថែមការគាំទ្រយ៉ាងទូលំទូលាយចំពោះមុខងារថ្មី preview នៃ Azure Developer CLI និងពង្រឹងបទពិពណ៌នាបទពិសោធន៍កម្មវិធីសិក្សា។**

#### បន្ថែម
- **🧪 ឯកសារមុខងារ azd provision --preview**: ពិពណ៌នាលម្អិតពីមុខងារបរិក្ខារថ្មី
  - ជំរុញបញ្ជា និងខ្លឹមសារឧទាហរណ៍ក្នុង cheat sheet
  - រួមបញ្ចូលជាមួយមគ្គុទ្ទភាគនៃមគ្គុទ្ទភាគ provision យ៉ាងលំអិតជាមួយករណីប្រើ និងអត្ថប្រយោជន៍
  - រួមបញ្ចូលការត្រួតពិនិត្យមុនបិទបញ្ចូលសម្រាប់សុវត្ថិភាព
  - ការអាប់ដេតមគ្គុទ្ទភាគផ្តើមនូវវិធីសាស្រ្តដំឡើងដែលមានសុវត្ថិភាពជាលើកដំបូង
- **🚧 បដិទ័ងស្ថានភាពការងារ**: បដិទ័ង HTML វិជ្ជាជីវៈ បង្ហាញស្ថានភាពការអភិវឌ្ឍន៍កម្មវិធីសិក្សា
  - រចនាប័ទ្ម Gradient មានសញ្ញាសាងសង់សម្រាប់ការជូនដំណឹងអ្នកប្រើប្រាស់យ៉ាងច្បាស់
  - ពេលវេលាអាប់ដេតចុងក្រោយសម្រាប់ភាពច្បាស់លាស់
  - រចនាប័ទ្មឆ្លាតវៃសម្រាប់ឧបករណ៍ទាំងអស់

#### ពង្រឹង
- **សុវត្ថិភាពបរិក្ខារ**: រួមបញ្ចូលមុខងារ preview ទាំងមូលក្នុងឯកសារដំឡើង
- **ការផ្ទៀងផ្ទាត់មុនដំឡើង**: ស្គ្រីបស្វ័យប្រវត្តិបានបញ្ចូលការធ្វើតេស្ត preview
- **ដំណើរការអភិវឌ្ឍន៍**: បញ្ជារតួកូលបានអាប់ដេតរួមបញ្ចូលការពិពណ៌នា preview ជាលំនាំល្អបំផុត
- **បទពិសោធន៍កម្មវិធីសិក្សា**: រំពឹងទុកច្បាស់សម្រាប់អ្នកប្រើអំពីស្ថានភាពការអភិវឌ្ឍន៍

#### ផ្លាស់ប្តូរ
- **លំនាំដំឡើងល្អបំផុត**: ដំណើរការលំនាំ preview ជាលំនាំដែលផ្តល់អនុសាសន៍
- **រលភាសារឯកសារ**: ការផ្ទៀងផ្ទាត់រចនាសម្ព័ន្ធបានផ្លាស់ទីមុនឆមាសរៀន
- **ការនិយាយបង្ហាញកម្មវិធីគ្រប់គ្រង**: បដិទ័ងស្ថានភាពវិជ្ជាជីវៈ ជាមួយប៉ារ៉ាម៉ែត្រឯកសារការអភិវឌ្ឍន៍ច្បាស់លាស់

#### ធ្វើឲ្យប្រសើរឡើង
- **វិធីសាស្ត្រសុវត្ថិភាពជាលើកដំបូង**: ការផ្លាស់ប្តូរបរិក្ខារអាចត្រូវបានផ្ទៀងផ្ទាត់មុនការដំឡើង
- **កិច្ចសហការជាក្រុម**: លទ្ធផល preview អាចចែករំលែកសម្រាប់ការពិនិត្យ និងអនុម័ត
- **ការយល់ដឹងថ្លៃថ្នូរ**: យល់ដឹងកាន់តែល្អអំពីថ្លៃធនធានមុនពេលដំឡើង
- **ការបន្សាបគ្រោះថ្នាក់**: ការធ្វើតេស្តមុនបង្កើតការបើកប្រាក់ខូចខាតត្រូវបានបញ្ចុះ

#### អនុវត្តបច្ចេកទេស
- **ការភ្ជាប់ឯកសារច្រើន**: មុខងារ preview សរសេរពិពណ៌នាក្នុងឯកសារមូលដ្ឋាន 4
- **លំនាំបញ្ជា**: សមាសភាពកូដ និងឧទាហរណ៍មានសុពលភាពលើឯកសារទាំងមូល
- **ការរួមបញ្ចូលលំនាំល្អបំផុត**: preview រួមបញ្ចូលក្នុងដំណើរការបញ្ចាក់ និងស្គ្រីប
- **សញ្ញាថ្មីមើលឃើញដោយភ្លាម**: សញ្ញាបង្ហាញពីមុខងារថ្មី

#### បរិក្ខារកម្មវិធីសិក្សា
- **ការនិយាយអំពីស្ថានភាព**: បដិទ័ង HTML វិជ្ជាជីវៈជាមួយរចនាប័ទ្ម gradient
- **បទពិសោធន៍អ្នកប្រើ**: ស្ថានភាពអភិវឌ្ឍន៍ច្បាស់សម្រាប់ការព្យាបាលការភាន់ច្រឡំ
- **ការបង្ហាញវិជ្ជាជីវៈ**: រក្សាសមត្ថិភាពRepository ខណៈពេលដាក់កំណត់ទំនេញ
- **ភាពច្បាស់លាស់នៅពេលវេលា**: ពេលវេលាដែលបានអាប់ដេតចុងក្រោយខែទី 10 ឆ្នាំ 2025 សម្រាប់ការទទួលខុសត្រូវ

### [v3.3.0] - 2025-09-24

#### ពង្រឹងឯកសារកម្មវិធីសិក្សា និងបទពិសោធន៍រៀនអន្តរកម្ម
**កំណែនេះបន្ថែមឯកសារកម្មវិធីសិក្សាយ៉ាងទូលំទូលាយជាមួយមគ្គុទ្ទភាគរៀនតាមកម្មវិធីរុករក និងផ្លូវការសិក្សាមានរចនាសម្ព័ន្ធ។**

#### បន្ថែម
- **🎥 មគ្គុទ្ទភាគកម្មវិធីសិក្សាអន្តរកម្ម**: បទពិសោធកម្មវិធីសិក្សាដោយប្រើមុខងារ preview MkDocs ក្នុងកម្មវិធីរុករក
- **📝 សេចក្តីណែនាំរៀនលំដាប់ជំហាន**: ផ្លូវការសិក្សាដំឡើងមាន 7 ជំហានពីការរកឃើញទៅការប្តូរតាមតម្រូវការ
  - 0-Introduction៖ ការណែនាំកម្មវិធីសិក្សា និងការតំឡើង
  - 1-Select-AI-Template៖ ដំណើរការស្វែងរក និងជ្រើសរើសគំរូ
  - 2-Validate-AI-Template៖ ដំណើរការដំឡើង និងផ្ទៀងផ្ទាត់
  - 3-Deconstruct-AI-Template៖ ការយល់ដឹងពីស្ថាបត្យកម្មគំរូ
  - 4-Configure-AI-Template៖ ការកំណត់ និងប្តូរតាមតម្រូវការ
  - 5-Customize-AI-Template៖ ការប្ដូរខ្ពស់ និងកំណែច្រើន
  - 6-Teardown-Infrastructure៖ ការសម្អាត និងគ្រប់គ្រងធនធាន
  - 7-Wrap-up៖ សរុប និងជំហានបន្ទាប់
- **🛠️ ឧបករណ៍កម្មវិធីសិក្សា**: ការកំណត់ MkDocs ជាមួយธีម Material សម្រាប់បទពិសោធន៍រៀនល្អប្រសើរ
- **🎯 ផ្លូវការរៀនស្មើស្មាញ**: វិធីសាស្ត្រចំនួន 3 ជំហាន (រកឃើញ → ដំឡើង → ប្ដូរតាមតម្រូវការ)
- **📱 បញ្ចូលជាមួយ GitHub Codespaces**: ការតំឡើងបរិយាកាសអភិវឌ្ឍន៍រលូន

#### ពង្រឹង
- **មន្ទីរពហុសម័យ AI**: ពង្រីកជាមួយបទពិសោធន៍រៀនលំដាប់ 2-3 ម៉ោង
- **ឯកសារកម្មវិធីសិក្សា**: ការបង្ហាញជាវិជ្ជាជីវៈជាមួយការរុករក និងគំនូសផ្សេងៗ
- **ការរីកចម្រើនការសិក្សា**: ការណែនាំជញ្ជាំងទៅជំហានច្បាស់ពីការជ្រើសរើសគំរូដល់ដំណើរការផលិតកម្ម
- **បទពិសោធន៍អ្នកអភិវឌ្ឍន៍**: រួមបញ្ចូលឧបករណ៍សម្រាប់ដំណើរការអភិវឌ្ឍន៍រលូន

#### ធ្វើឲ្យប្រសើរឡើង
- **ភាពងាយចូលដំណើរការ**: ផ្ទាំងកម្មវិធីរុករកមានសោបូម្រាឃោសន៍, ការចម្លង, និងប្ដូរថ្មីពណ៌
- **ការរៀនដោយស្វ័យប្រវត្តិ**: រចនាសម្ព័ន្ធកម្មវិធីមានភាពបត់បែនសម្រាប់ល្បឿនរៀនខុសគ្នា
- **ការអនុវត្តជាក់ស្តែង**: ស្ថានការណ៍ដំឡើងគំរូ AI ក្នុងជីវិតពិត
- **ការបញ្ចូលសហគមន៍**: រួមបញ្ចូល Discord សម្រាប់គាំទ្រកម្មវិធីសិក្សា និងការសហការជាក្រុម

#### លក្ខណៈពិសេសកម្មវិធីសិក្សា
- **គម្រោងស្វែងរកក្នុងកម្មវិធី**: រកឃើញប្រើពាក្យគន្លឹះ និងមេរៀនបានលឿន
- **ចម្លងប្លុកកូដ**: សមត្ថភាពចម្លងដោយចុចលើកូដគ្រប់ឧទាហរណ៍
- **ប្ដូរពណ៌ម្ខាង**: គាំទ្រមោងខ្មៅ/ពន្លឺទាំងឡាយសម្រាប់ចំណង់ចំណូលចិត្ត
- **ទ្រព្យសម្បត្តិគូរជាក់ស្តែង**: រូបថតអេក្រង់ និងរូបភាពសម្រាប់ការយល់ដឹងល្អប្រសើរ
- **ការបញ្ចូលជំនួយ**: ចូលទៅ Discord ផ្ទាល់សម្រាប់គាំទ្រសហគមន៍

### [v3.2.0] - 2025-09-17

#### ការកែសម្រួលរចនាសម្ព័ន្ធការរុករកនិងប្រព័ន្ធរៀនផ្អែកជំពូក
**កំណែនេះបង្ហាញរចនាសម្ព័ន្ធរៀនតាមជំពូកប្រសើរឡើង និងការរុករកបានល្អនៅក្នុងគ្រប់ Repository។**

#### បន្ថែម
- **📚 ប្រព័ន្ធរៀនផ្អែកជំពូក**: បានរៀបចំវគ្គសិក្សាទាំងមូលជាជំពូករៀនតទៅគ្នា 8 ជំពូក
  - ជំពូក 1: មូលដ្ឋាន & ចាប់ផ្តើមលឿន (⭐ - ៣០-៤៥ នាទី)
  - ជំពូក 2: អភិវឌ្ឍន៍ AI ជាដំបូង (⭐⭐ - ១-២ ម៉ោង)
  - ជំពូក 3: កំណត់ & ភស្តុតាង (⭐⭐ - ៤៥-៦០ នាទី)
  - ជំពូក 4: បរិក្ខារជា Code & ដំឡើង (⭐⭐⭐ - ១-១.៥ ម៉ោង)
  - ជំពូក 5: ដំណោះស្រាយជាអ្នកបម្រើពហុ (⭐⭐⭐⭐ - ២-៣ ម៉ោង)
  - ជំពូក 6: ការផ្ទៀងផ្ទាត់ និងគម្រោងមុនដំឡើង (⭐⭐ - ១ ម៉ោង)
  - ជំពូក 7: រកកំហុស និងដោះស្រាយបញ្ហា (⭐⭐ - ១-១.៥ ម៉ោង)
  - ជំពូក 8: លំនាំផលិតកម្ម & មុខងារអង្គការធំ (⭐⭐⭐⭐ - ២-៣ ម៉ោង)
- **📚 ប្រព័ន្ធរុករកទូលំទូលាយ**: ក្បាល និងថ្នេររុករកស្ថិតនៅជានិច្ចនៅក្នុងឯកសារទាំងអស់
- **🎯 ការតាមដានការរីកចម្រើន**: បញ្ជីពិនិត្យបញ្ចប់វគ្គសិក្សា និងប្រព័ន្ធផ្ទៀងផ្ទាត់កម្រិតសិក្សា
- **🗺️ ផ្លូវការរៀនច្បាស់លាស់**: ចំណុចចូលច្បាស់សម្រាប់កម្រិតបទពិសោធន៍និងគោលដៅផ្សេងៗ
- **🔗 រុករកដោយបញ្ជាក់ចំណុចយោង**: ជំពូកពាក់ព័ន្ធ និងលក្ខខណ្ឌមុនគ្នាច្បាស់លាស់

#### ពង្រឹង
- **រចនាសម្ព័ន្ធ README**: បម្លែងទៅជាវេទិកាសិក្សារៀបចំបានល្អដោយផ្អែកលើជំពូក
- **រុករកឯកសារ**: មុខរបរនៅជំពូក ថ្ងៃនេះមានមាតិកាជំពូក និងការណែនាំការរីកចម្រើន
- **រៀបចំគំរូ**: ឧទាហរណ៍ និងគំរូត្រូវបានផ្គូរផ្គងទៅជំពូកសិក្សាដែលសមរម្យ
- **ការរួមបញ្ចូលធនធាន**: សន្លឹកសង្ខេប, សំនួរញឹកញាប់, សៀវភៅរៀនភ្ជាប់ទៅជំពូកដែលពាក់ព័ន្ធ
- **ការរួមបញ្ចូលកម្មវិធីសិក្សា**: មណ្ឌលហាត់ចុងដៃបានផ្គូរផ្គងទៅគោលបំណងរៀនជំពូកជាច្រើន

#### ផ្លាស់ប្តូរ
- **វឌ្ឍនភាពក្នុងការសិក្សា**: បានផ្លាស់ប្តូរពីឯកសារស្រឡាយទៅការសិក្សាតាមជំពូកដែលអាចបត់បែនបាន
- **ទីតាំងកំណត់រចនា**: បានដាក់មគ្គុទេសក៍កំណត់រចនាឡើងជាជំពូកទី 3 ដើម្បីធ្វើឲ្យការសិក្សា​ងាយស្រួលជាងមុន
- **ការចងក្រងខ្លឹមសារបច្ចេកវិទ្យាបញ្ញាសិប្បនិម្មិត**: បន្តការចងក្រងខ្លឹមសារបច្ចេកវិទ្យាបញ្ញាសិប្បនិម្មិតបានប្រសើរជាទូទៅក្នុងដំណើរការសិក្សា
- **ខ្លឹមសារផលិតកម្ម**: របៀបកែប្រែខ្ពស់បានប្រមូលផ្តុំក្នុងជំពូកទី 8 សម្រាប់អ្នកសិក្សានៅតំបន់សហគ្រាស

#### បានកែលម្អ
- **បទពិសោធន៍អ្នកប្រើ**: ទំរង់ការរុករកដែលច្បាស់លាស់ និងសំគាល់ការពន្លឿនជំពូក
- **ការចូលប្រើបាន**: គោលការណ៍រុករកដែលមានភាពសរុបសម្រាប់ឲ្យងាយស្រួលក្នុងការសំរេចថ្នាក់ទៅមុខ
- **ការបង្ហាញវិជ្ជាជីវៈ**: រចនាសម្ព័ន្ធវគ្គសិក្សាប្រភេទសាកលវិទ្យាល័យ សមស្របសម្រាប់ការបណ្តុះបណ្តាលសកលវិជ្ជាជីវៈ និងសហគ្រាស
- **ប្រសិទ្ធភាពក្នុងការសិក្សា**: កាត់បន្ថយពេលវេលាសម្រាប់រកឃើញខ្លឹមសារដែលពាក់ព័ន្ធតាមរយៈអង្គការដែលបានកែលម្អ

#### ការអនុវត្តបច្ចេកទេស
- **ចំណងជើងរុករក**: ស្តង់ដារជំពូកនៃការរុករកឯកសារជាង 40 ឯកសារ
- **រុករកផ្នែកខាងក្រោម**: គោលការណ៍នៃការពន្លឿន និងសំគាល់ការសម្រេចជំពូកដែលគោរពតាមនីតិវិធី
- **ការចងភ្ជាប់ឆ្លងកាត់**: ការចងភ្ជាប់ក្នុងប្រព័ន្ធដែលទូទៅភ្ជាប់មតិសំខាន់ៗ
- **ការបែងចែកជំពូក**: គំរូ និងឧទាហរណ៍ដែលភ្ជាប់នឹងគោលបំណងសិក្សាប្រកបដោយច្បាស់លាស់

#### ការកែលម្អមគ្គុទេសក៍សិក្សា
- **📚 គោលបំណងសិក្សាគ្រប់មុខ**: បានរៀបចំបន្ទុកមគ្គុទេសក៍សិក្សាថ្មីឲ្យសមស្របនឹងប្រព័ន្ធ 8 ជំពូក
- **🎯 ការវាយតម្លៃតាមជំពូក**: រៀបចំមុខងារវាយតម្លៃនិងលំហាត់អនុវត្តសម្រាប់ជំពូកនីមួយៗ
- **📋 ការតាមដានវឌ្ឍនភាព**: កាលវិភាគសិក្សាប្រចាំសប្តាហ៍ ដែលមានលទ្ធផលវាស់វែង និងបញ្ជីត្រួតពិនិត្យសម្រេចការងារ
- **❓ សំណួរវាយតម្លៃ**: សំណួរបញ្ញាញ៉ាតទៅលើជំពូកនីមួយៗជាមួយលទ្ធផលវិជ្ជាជីវៈ
- **🛠️ លំហាត់អនុវត្តជាក់ស្តែង**: សកម្មភាពដែលមានការអនុវត្តដោយដៃជាមួយគម្រោងបញ្ចូលពិត និងការដោះស្រាយបញ្ហា
- **📊 ការវិវឌ្ឍជំនាញ**: ការរីកចម្រើនច្បាស់លាស់ចាប់ពីគ្រប់គំនិតដើមទៅរចនាបទផែនការអាជីវកម្ម ដើម្បីអភិវឌ្ឍអាជីព
- **🎓 រចនាសម្ព័ន្ធវិញ្ញាបនបត្រ**: លទ្ធផលអភិវឌ្ឍវិជ្ជាជីវៈ និងប្រព័ន្ធការស្នាក់នៅក្នុងសហគមន៍
- **⏱️ ការគ្រប់គ្រងកាលវិភាគ**: ផែនការសិក្សា 10 សប្តាហ៍ដែលមានការត្រួតពិនិត្យចំណុចសំខាន់ៗ

### [v3.1.0] - 2025-09-17

#### ដំណោះស្រាយ AI មូលដ្ឋាន Multi-Agent បានកែលម្អ
**កំណែនេះបានកែលម្អដំណោះស្រាយនៃមូលដ្ឋានតំណាងច្រើន ដោយមានការផ្លាស់ប្តូរឈ្មោះតំណាងឲ្យប្រសើរជាងមុន និងការបំពេញឯកសារដែលបានបង្កើតឡើងល្អប្រសើរឡើង។**

#### បានផ្លាស់ប្តូរ
- **ពាក្យសម្គាល់ Multi-Agent**: បានប្តូរឈ្មោះ "Cora agent" ទៅជា "Customer agent" ទាំងមូលក្នុងដំណោះស្រាយ multi-agent ផ្លូវលក់ ដើម្បីឲ្យយល់បានច្បាស់លាស់
- **រចនាសម្ព័ន្ធតំណាង**: បានធ្វើបច្ចុប្បន្នភាពឯកសារ ទំព័រ ARM និងឧទាហរណ៍កូដទាំងអស់ ដើម្បីប្រើឈ្មោះ "Customer agent" ដដែល
- **ឧទាហរណ៍កំណត់រចនា**: បានបច្ចុប្បន្នភាពគំរូនៅក្នុងការកំណត់រចនារបស់តំណាងជាមួយនឹងការប្រើប្រាស់ឈ្មោះថ្មី
- **ភាពសរុបឯកសារ**: បានធ្វើឲ្យឆ្លើយតបទាំងអស់ប្រើឈ្មោះតំណាងដែលឈ្មោះវិជ្ជាជីវៈនិងលម្អិត

#### បានកែលម្អ
- **កញ្ចប់តំណាង ARM Template**: បានធ្វើបច្ចុប្បន្នភាព retail-multiagent-arm-template ដោយយោងទៅ Customer agent
- **រូបភាពរចនាសម្ព័ន្ធ**: បានបំពេញជាមួយរូបភាព Mermaid ដែលមានការកែប្រែឈ្មោះតំណាង
- **ឧទាហរណ៍កូដ**: ថ្នាក់ Python និងឧទាហរណ៍អនុវត្តបានប្រើឈ្មោះ CustomerAgent
- **បរិយាកាសអថេរ**: បានធ្វើបច្ចុប្បន្នភាពឯកសារស្គ្រីប deployment ទាំងអស់ឲ្យប្រើ CUSTOMER_AGENT_NAME

#### បានកែលម្អ
- **បទពិសោធន៍អ្នកអភិវឌ្ឍន៍**: តួនាទីនិងភារកិច្ចតំណាងដែលច្បាស់លាស់នៅក្នុងឯកសារ
- **ការប្រើប្រាស់ក្នុងផលិតកម្ម**: តម្រូវឲ្យសម្របសម្រួលជាមួយឈ្មោះនៅតំបន់សហគ្រាសបានល្អប្រសើរ
- **សម្ភារៈសិក្សា**: ឈ្មោះតំណាងងាយស្រួលសម្រាប់គោលបំណងអប់រំ
- **ភាពងាយស្រួលក្នុងការប្រើប្រាស់គំរូ**: ងាយស្រួលយល់ពីមុខងារ និងទំរង់ deployment តំណាង

#### ព័ត៌មានបច្ចេកទេស
- បានធ្វើបច្ចុប្បន្នភាពរូបភាពរចនាសម្ព័ន្ធ Mermaid ជាមួយយោងទៅ CustomerAgent
- បានប្តូរឈ្មោះថ្នាក់ CoraAgent ទៅជា CustomerAgent នៅក្នុងឧទាហរណ៍ Python
- បានកែប្រែ JSON កំណត់រចនាអំពី ARM template ដើម្បីប្រើប្រភេទតំណាង "customer"
- បានធ្វើបច្ចុប្បន្នភាពអថេរបរិយាកាសពី CORA_AGENT_* ទៅ CUSTOMER_AGENT_*
- បានធ្វើបច្ចុប្បន្នភាពការបញ្ជារដំណើរការ deployment និងការកំណត់ container ទាំងអស់

### [v3.0.0] - 2025-09-12

#### ការផ្លាស់ប្តូរចម្បង - ផ្ដោតលើអ្នកអភិវឌ្ឍបញ្ញាសិប្បនិម្មិត និងការរួមបញ្ចូល Microsoft Foundry
**កំណែនេះបានបម្លែង repository ទៅជា​ធនធានសិក្សា​ចង្អុលបញ្ញាសិប្បនិម្មិតជាចម្បង ដែលរួមបញ្ចូល Microsoft Foundry។

#### បានបន្ថែម
- **🤖 ផ្លូវសិក្សាបញ្ញាសិប្បនិម្មិតជាលើកដំបូង**: រៀបចំឡើងវិញទាំងមូលដោយផ្ដោតទៅលើអ្នកអភិវឌ្ឍន៍ និងវិស្វករ AI
- **មគ្គុទេសក៍រួមបញ្ចូល Microsoft Foundry**: ឯកសារពេញលេញសម្រាប់ភ្ជាប់ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **លំនាំដ៏ល្អសម្រាប់ការតម្លើង AI ម៉ូដែល**: មគ្គុទេសក៍លម្អិតសម្រាប់ការជ្រើសរើស ម៉ូដែល ការកំណត់រចនា និងយុទ្ធសាស្ត្រផលិតកម្ម
- **មន្ទីរប្រឡងផ្តល់បទពិសោធន៍ AI**: សិក្ខាសាលាអនុវត្ត 2-3 ម៉ោងសម្រាប់បម្លែងកម្មវិធី AI ទៅជាដំណោះស្រាយ AZD-deployable
- **ការប្រកបដោយភាពល្អបំផុតជាមួយ AI ផលិតកម្ម**: លំនាំសម្រាប់សហគ្រាសរួមមានការផ្គត់ផ្គង់ វិភាគ និងសុវត្ថិភាពលើបន្ទុក AI
- **មគ្គុទេសក៍ដោះស្រាយបញ្ហាផ្ទាល់ខ្លួន AI**: ការដោះស្រាយបញ្ហាគ្រប់ដំណាក់កាលសម្រាប់ Microsoft Foundry Models, Cognitive Services និងបញ្ហាក្នុងការតម្លើង AI
- **បណ្ណាល័យគំរូ AI**: បណ្ណាល័យគំរូ Microsoft Foundry ដែលមានការវាយតម្លៃភាពស្មុគស្មាញ
- **សម្ភារៈសិក្ខាសាលា**: រចនាសម្ព័ន្ធសិក្ខាសាលាពេញលេញជាមួយមន្ទីរប្រឡងអនុវត្ត និងឯកសារយោង

#### បានកែលម្អ
- **រចនាសម្ព័ន្ធ README**: ផ្ដោតទៅលើអ្នកអភិវឌ្ឍ AI ជាមួយទិន្នន័យការចាប់អារម្មណ៍សហគមន៍ 45% ពី Microsoft Foundry Discord
- **ផ្លូវសិក្សា**: ការធ្វើដំណើរអ្នកអភិវឌ្ឍ AI ជាមួយផ្លូវបុរាណសម្រាប់សិស្ស និងវិស្វករ DevOps
- **ការផ្ដល់អនុសាសន៍គំរូ**: គំរូ AI ដែលមានលក្ខណៈពិសេសរួមមាន azure-search-openai-demo, contoso-chat និង openai-chat-app-quickstart
- **ការរួមបញ្ចូលសហគមន៍**: ការគាំទ្រ Discord សហគមន៍បានបកស្រាយជាក់លាក់ជាមួយបន្ទប់ AI និងការពិភាក្សា

#### គោលបំណងសុវត្ថិភាព និងផលិតកម្ម
- **លំនាំ Managed Identity**: ការផ្ទៀងផ្ទាត់ និងការកំណត់សុវត្ថិភាពជាលក្ខណៈ AI
- **ការបង្កើនប្រសិទ្ធភាពថ្លៃដើម**: ការតាមដានការប្រើប្រាស់ Token និងការគ្រប់គ្រងថវិការ
- **ការតម្លើងច្រើនតំបន់**: យុទ្ធសាស្ត្រសម្រាប់ការតម្លើងកម្មវិធី AI ជាសកល
- **ការត្រួតពិនិត្យសមត្ថភាព**: ជម្រះមាត្រដ្ឋាន AI និងការរួមបញ្ចូល Application Insights

#### គុណភាពឯកសារ
- **រចនាសម្ព័ន្ធវគ្គបណ្ដុះបណ្ដាលតាមបន្ទាត់**: ការលូតលាស់តាមលំដាប់ចាប់ពីអ្នកដំបូងដល់លំនាំផលិតកម្ម AI ខ្ពស់
- **URL ដែលបានផ្ទៀងផ្ទាត់**: តំណភ្ជាប់បណ្តាញខាងក្រៅបានផ្ទៀងផ្ទាត់ និងអាចចូលប្រើបាន
- **កំណត់​ឯកសារយោង​ពេញលេញ**: តំណភ្ជាប់ឯកសារពិសេសមុខឆែកសាកល្បងនិងមានមុខងារ
- **រួចរាល់សម្រាប់ផលិតកម្ម**: លំនាំផលិតកម្មសហគ្រាសមានឧទាហរណ៍ក្នុងពិភពពិត

### [v2.0.0] - 2025-09-09

#### ការផ្លាស់ប្តូរចម្បង - ការរៀបចំឡើងវិញ Repository និងការកែលម្អវិជ្ជាជីវៈ
**កំណែនេះតំណាងឲ្យការបង្កើតឡើងវិញយ៉ាងសំខាន់នៃរចនាសម្ព័ន្ធ repository និងការនាំយកខ្លឹមសារបង្ហាញ។**

#### បានបន្ថែម
- **រចនាសម្ព័ន្ធបណ្តុះបណ្តាលដែលមានរចនា**: ទំព័រឯកសារទាំងអស់ឥឡូវនេះមានចំណងជើងណែនាំ គោលបំណងសិក្សា និងលទ្ធផលសិក្សា
- **ប្រព័ន្ធរុករក**: បានបន្ថែមតំណ Previous/Next ក្នុងមុខវិជ្ជាទាំងអស់សម្រាប់ការនាំមុខសិក្សាតាមដាន
- **មគ្គុទេសក៍សិក្សា**: study-guide.md ទូលំទូលាយជាមួយគោលបំណងសិក្សា លំហាត់ និងសម្ភារៈវាយតម្លៃ
- **ការបង្ហាញវិជ្ជាជីវៈ**: បានដករូបតំណាងអ៊ីមូជិចទាំងអស់សម្រាប់កែលម្អការចូលប្រើនិងរូបរាងវិជ្ជាជីវៈ
- **ការរៀបចំខ្លឹមសារ​បានកែលម្អ**: ការរៀបចំ និងទេកម្មរបស់សម្ភារៈសិក្សា​បានប្រសើរឡើង

#### បានផ្លាស់ប្តូរ
- **ទ្រង់ទ្រាយឯកសារ**: ស្តង់ដាបម្រុងបានឯកសារទាំងអស់ជាមួយរចនាដែលផ្ដោតទៅលើការសិក្សា
- **លំហាត់រុករក**: បានអនុវត្តចលនាដោយឡែកយ៉ាងត្រង់តាមទំនៀមទំលាប់ក្នុងសម្ភារៈសិក្សា
- **ការបង្ហាញខ្លឹមសារ**: បានដកលំហាត់ពុម្ពអក្សរចាស់ៗជំនួសដោយទ្រង់ទ្រាយវិជ្ជាជីវៈស្រលះៗ
- **រចនាសម្ព័ន្ធតំណភ្ជាប់**: បានធ្វើបច្ចុប្បន្នភាពសម្រាប់តំណភ្ជាប់ខាងក្នុងទាំងអស់ដើម្បីគាំទ្រប្រព័ន្ធរុករកថ្មី

#### បានកែលម្អ
- **ការចូលប្រើបាន**: បានដកចេញការស្របព័ន្ធអ៊ីមូជិចសម្រាប់ការទំនាក់ទំនងជាមួយកម្មវិធីអានអេក្រង់
- **រូបរាងវិជ្ជាជីវៈ**: ការបង្ហាញវិជ្ជាជីវៈបែបសាកលវិទ្យាល័យដែលសមស្របសម្រាប់ការសិក្សាសហគ្រាស
- **បទពិសោធន៍សិក្សា**: វិធីសាស្ត្រដែលមានរចនាសម្ព័ន្ធជាមួយគោលបំណង និងលទ្ធផលច្បាស់សម្រាប់មុខវិជ្ជានីមួយៗ
- **ការរៀបចំខ្លឹមសារ**: ដំណើររលូននិងទំនាក់ទំនងលើគំនិតដែលពាក់ព័ន្ធគ្នា

### [v1.0.0] - 2025-09-09

#### ការចេញផ្សាយដំបូង - បណ្ដុំឯកសារសិក្សា AZD ពេញលេញ

#### បានបន្ថែម
- **រចនាសម្ព័ន្ធឯកសារជាគោលដៅ**
  - ស៊េរីមគ្គុទេសក៍ដំណើរការចាប់ផ្តើមពេញលេញ
  - ឯកសារផ្តល់អំពីការតម្លើង និង provisioning ពេញលេញ
  - ត្រៀមបច្ចេកទេសដោះស្រាយបញ្ហារួម និងមគ្គុទេសក៍ debugging
  - ឧបករណ៍ និងនីតិវិធីសម្រាប់បញ្ចូលមុនការផ្គត់ផ្គង់

- **ម៉ូឌុលចាប់ផ្តើម**
  - AZD មូលដ្ឋាន៖ គំនិតនិងពាក្យសំខាន់
  - មគ្គុទេសក៍ដំឡើង៖ ណែនាំការដំឡើងសម្រាប់វេទិកាផ្សេងៗ
  - មគ្គុទេសក៍កំណត់រចនា៖ ការតំឡើងបរិយាកាស និងការផ្ទៀងផ្ទាត់
  - មេរៀនគម្រោងដំបូង៖ ការសិក្សាអនុវត្តតាមជំហាន

- **ម៉ូឌុល deployment និង provisioning**
  - មគ្គុទេសក៍ deployment៖ ឯកសារប្រតិបត្តិការពេញលេញ
  - មគ្គុទេសក៍ provisioning៖ អគារដោយកូដជាមួយ Bicep
  - លំនាំល្អបំផុតសម្រាប់ deployment ផលិតកម្ម
  - លំនាំរចនាសម្ព័ន្ធមួយចំនួនសម្រាប់ multi-service

- **ម៉ូឌុលប្រតិបត្តិការមុនការផ្គត់ផ្គង់**
  - ការធ្វើផែនការថាមពល៖ បញ្ចាញឲ្យមានធនធាន Azure ត្រឹមត្រូវ
  - ជ្រើសរើស SKU៖ ការណែនាំលំអិតសម្រាប់កម្រិតសេវា
  - ការត្រួតពិនិត្យមុនបច្ចុប្បន្នភាព៖ ស្គ្រីបង្វាស់ស្វ័យប្រវត្ត (PowerShell និង Bash)
  - ឧបករណ៍ប៉ាន់ស្ដង់ថ្លៃ និងគ្រប់គ្រងថវិកា

- **ម៉ូឌុលដោះស្រាយបញ្ហា**
  - បញ្ហាទូទៅ៖ បញ្ហាដោយបញ្ញត្តិ និងដំណោះស្រាយ
  - មគ្គុទេសក៍ debugging៖ របៀបដោះស្រាយបញ្ហាដោយមានរបៀបការណ៍
  - បច្ចេកទេសវាយតម្លៃខ្ពស់ និងឧបករណ៍បន្តបន្ទាប់
  - ការត្រួតពិនិត្យ និងបង្កើនសមត្ថភាព

- **ធនធាន និង យោង**
  - សៀវភៅបញ្ជារបញ្ជា៖ ឯកសារយោងរហ័សសម្រាប់ពាក្យបញ្ជាសំខាន់ៗ
  - វចនានុក្រម៖ ពាក្យនិងអាក្រក់ពេញលេញ
  - សំណួរញឹកញាប់៖ ចម្លើយដល់សំណួរពេញនិយម
  - តំណភ្ជាប់ធនធានខាងក្រៅ និងការតភ្ជាប់សហគមន៍

- **ឧទាហរណ៍ និង គំរូ**
  - ឧទាហរណ៍កម្មវិធីវេបសាយសាមញ្ញ
  - គំរូដំណើរការវេបសាយសំរឹទ្ធិ
  - ការកំណត់កម្មវិធី Container
  - លំនាំបញ្ចូលទិន្នន័យ
  - ឧទាហរណ៍រចនាសម្ព័ន្ធ Microservices
  - ការអនុវត្ត Serverless function

#### លក្ខណៈពិសេស
- **គាំទ្រផ្លូវច្រើនវេទិកា**: មគ្គុទេសក៍ដំឡើង និងកំណត់រចនាសម្រាប់ Windows, macOS និង Linux
- **កម្រិតជំនាញច្រើន**: ខ្លឹមសារសម្រាប់សិស្សរៀន រហូតដល់អ្នកអភិវឌ្ឍវិជ្ជាជីវៈ
- **ផ្ដោតលើការអនុវត្ត**: ឧទាហរណ៍ដៃ និងគំរូរឿងពិភពពិត
- **ការសំរេចបរិមាណវិជ្ជាជីវៈ**: ចាប់ពីគំនិតមូលដ្ឋានរហូតដល់លំនាំសហគ្រាសខ្ពស់
- **វិធីសាស្ត្រសុវត្ថិភាពជាលើកដំបូង**: ប្រតិបត្តិការល្អបំផុតចូលតទៅក្នុងសៀវភៅជារៀងរាល់គ្រឿង
- **ការបង្កើនប្រសិទ្ធភាពថ្លៃដើម**: ការណែនាំសម្រាប់ការតម្លើងអោយមានប្រសិទ្ធភាពថ្លៃដើម និងគ្រប់គ្រងធនធាន

#### គុណភាពឯកសារ
- **ឧទាហរណ៍កូដលម្អិត**: ឧទាហរណ៍កូដអនុវត្តជាក់ស្តែងមានការប្រតិបត្តិ
- **ណែនាំជាកថាខណ្ឌ**: មគ្គុទេសក៍ច្បាស់ លំអិត និងអាចអនុវត្តបាន
- **ការដោះស្រាយកំហុសលម្អិត**: ដោះស្រាយបញ្ហានានា
- **បញ្ចូលគ្នានៃលក្ខណៈល្អបំផុត**: ស្តង់ដារឧស្សាហកម្ម និងការណែនាំ
- **ឆាប់ទាន់សម័យ**: ឯកសារអាប់ដេតជាមួយសេវាកម្ម Azure ថ្មីៗ និងលក្ខណៈ azd

## ការកែលម្អនាពេលអនាគតដែលមានផែនការ

### កំណែ 3.1.0 (ផែនការ)
#### ការតម្លើងវេទិកា AI
- **គាំទ្រម៉ូដែលច្រើន**: លំនាំសម្របសម្រួលសម្រាប់ Hugging Face, Azure Machine Learning និងម៉ូដែលផ្ទាល់ខ្លួន
- **ស៊ុម AI របស់តំណាង**: គំរូសម្រាប់ LangChain, Semantic Kernel និងការតម្លើង AutoGen
- **លំនាំ RAG ខ្ពស់**: ជម្រើសមូលដ្ឋានទិន្នន័យវ៉ិចទ័រពិសេសក្រៅពី Azure AI Search (Pinecone, Weaviate, ល។)
- **ការត្រួតពិនិត្យ AI**: ការត្រួតពិនិត្យប្រសិទ្ធភាពម៉ូដែល ការប្រើប្រាស់តួខ្នាត និងគុណភាពឆ្លើយតបបានកែលម្អ

#### បទពិសោធន៍អ្នកអភិវឌ្ឍន៍
- **ផ្នែកបន្ថែម VS Code**: បទពិសោធន៍អភិវឌ្ឍន៍ AZD + Microsoft Foundry រួមបញ្ចូល
- **ការរួមបញ្ចូល GitHub Copilot**: ការបង្កើតគំរូ AZD ជាជំនួយ AI
- **មេរៀនអន្តរកម្ម**: លំហាត់កូដដោយដៃជាមួយការត្រួតពិនិត្យដោយស្វ័យប្រវត្តិតាមសញ្ញាសម្រាប់ស្ថានការណ៍ AI
- **ខ្លឹមសារវីដេអូ**: មេរៀនវីដេអូបន្ថែមសម្រាប់អ្នករៀនតាមរយៈទស្សនា ផ្ដោតទៅលើការតម្លើង AI

### កំណែ 4.0.0 (ផែនការ)
#### លំនាំ AI សម្រាប់សហគ្រាស
- **រចនាសម្ព័ន្ធគ្រប់គ្រង**: គ្រប់គ្រងម៉ូដែល AI, ការអនុវត្តន៍តាមផ្លូវច្បាប់ និងវិញ្ញាបនបត្រ
- **AI ចិញ្ចឹមភ្ញៀវជាច្រើន**: លំនាំសម្រាប់បម្រើអតិថិជនជាច្រើនជាមួយសេវាកម្ម AI ផ្នែកផ្ទង់ដាច់
- **AI Edge Deployment**: ការរួមបញ្ចូលជាមួយ Azure IoT Edge និងកុងតឺន័រ
- **Cloud ចម្រុះ AI**: លំនាំការតម្លើងចម្រុះ និង multi-cloud សម្រាប់បន្ទុក AI

#### លក្ខណៈខ្ពស់
- **អូទូម៉ាសិន AI Pipeline**: ការចងបណ្ដាញ MLOps ជាមួយ Azure Machine Learning pipelines
- **សុវត្ថិភាពខ្ពស់**: លំនាំ zero-trust, ចំណុចផ្ទាល់ខ្លួន និងការការពារ​គំរោងមានភាពស្មុគស្មាញ
- **ការបង្កើនសមត្ថភាព**: ការកែប្រែ និងបង្កើនដំណើរការអនុវត្តខ្ពស់សម្រាប់កម្មវិធី AI មាន throughput ខ្ពស់
- **ការចែកចាយសកល**: លំនាំផ្ញើខ្លឹមសារនិង edge caching សម្រាប់កម្មវិធី AI

### កំណែ 3.0.0 (ផែនការ) - បានផ្លាស់ទីដោយកំណែបច្ចុប្បន្ន
#### ការបន្ថែមបានស្នើ - បានអនុវត្តក្នុង v3.0.0
- ✅ **ខ្លឹមសារផ្នែក AI**: ការរួមបញ្ចូល Microsoft Foundry លម្អិត (បានបញ្ចប់)
- ✅ **មេរៀនអន្តរកម្ម**: សិក្ខាសាលាអនុវត្តន៍ AI (បានបញ្ចប់)
- ✅ **ម៉ូឌុលសុវត្ថិភាពខ្ពស់**: លំនាំសុវត្ថិភាព AI ជាក់លាក់ (បានបញ្ចប់)
- ✅ **ការបង្កើនសមត្ថភាព**: វិស័យបន្ថែមសម្រាប់ការធ្វើ tuning ផន AI (បានបញ្ចប់)

### កំណែ 2.1.0 (ផែនការ) - អនុវត្តបន្តិចក្នុង v3.0.0
#### ការកែលម្អតូចៗ - ខ្លះបានបញ្ចប់ក្នុងកំណែបច្ចុប្បន្ន
- ✅ **ឧទាហរណ៍បន្ថែម**: ស្ថានការណ៍ផ្តោតលើតម្លើង AI (បានបញ្ចប់)
- ✅ **ជំរើស FAQ បន្ថែម**: សំណួរពិសេស AI និងការដោះស្រាយ (បានបញ្ចប់)
- **ការរួមបញ្ចូលឧបករណ៍**: ផ្លូវសម្រាប់ IDE និងកម្មវិធីកែសម្រួលបានធ្វើកែលម្អ
- ✅ **ការពង្រីកតាមដាន**: លំនាំត្រួតពិនិត្យនិងការប្រជាពេលវេលា AI (បានបញ្ចប់)

#### នៅតែមានផែនការសម្រាប់ការចេញផ្សាយអនាគត
- **ឯកសារផ្តោតលើទូរស័ព្ទ**: រចនាលំរូងឆ្លាតវៃសម្រាប់ការសិក្សាតាមទូរស័ព្ទ
- **ការចូលប្រើក្រៅបណ្តាញ**: កញ្ចប់ឯកសារជាបន្ទុកទាញយកបាន
- **ការរួមបញ្ចូល IDE បានកែលម្អ**: ផ្នែកបន្ថែម VS Code សម្រាប់ AZD + ផ្លូវការងារ AI
- **ផ្ទាំងគ្រប់គ្រងសហគមន៍**: ស្ថិតិជាក់ស្តែងរបស់សហគមន៍ និងការតាមដានការរួមចំណែក

## ដាក់ចូលរួមក្នុង Changelog

### រាយការណ៍ការផ្លាស់ប្តូរ
នៅពេលដាក់ចូលរួមក្នុង repository នេះ សូមប្រាកដថាប្រវត្តិសារ changelog មានអ្វីខាងក្រោម៖

1. **លេខកំណែ**: តាមសេចក្តីកំណត់ semantic versioning (major.minor.patch)
2. **កាលបរិច្ឆេទ**: កាលបរិច្ឆេទផ្សាយ ឬធ្វើបច្ចុប្បន្នភាពក្នុងទ្រង់ទ្រាយ YYYY-MM-DD
3. **ចំណាត់ថ្នាក់**: បានបន្ថែម, បានផ្លាស់ប្តូរ, បានដកចេញ, បានជួសជុល, សុវត្ថិភាព
4. **ការពិពណ៌នាច្បាស់លាស់**: ការពិពណ៌នាសង្ខេបអំពីអ្វីបានផ្លាស់ប្តូរ
5. **ការវាយតម្លៃឥទ្ឋិពល**: ប៉ុនប៉ងធ្វើអោយដឹងពីរបៀបដែលការផ្លាស់ប្តូរប៉ះពាល់អ្នកប្រើប្រាស់ដែលមានរួច

### ចំណាត់ថ្នាក់ការផ្លាស់ប្តូរ

#### បានបន្ថែម
- លក្ខណៈពិសេសថ្មី ភាគនៃឯកសារ ឬសមត្ថភាព
- ឧទាហរណ៍ថ្មី គំរូ ឬធនធានសិក្សា
- ឧបករណ៍ ស្គ្រីប ឬប្រព័ន្ធជំនួយបន្ថែម

#### បានផ្លាស់ប្តូរ
- ការកែប្រែការប្រើប្រាស់ ឬឯកសារដែលមានរួច
- ការអាប់ដេតសម្រាប់ធ្វើឲ្យច្បាស់លាស់ ឬត្រឹមត្រូវ
- ការរៀបចំឡើងវិញនៃខ្លឹមសារ ឬគ្រប់គ្រង

#### ប្រើប្រាស់មិនបានទៀត
- សមត្ថភាព ឬវិធីសាស្ត្រដែលត្រូវបានដកចេញ
- ផ្នែកឯកសារដែលរៀបចំដើម្បីដកចេញ
- វិធីសាស្ត្រដែលមានជម្រើសល្អជាងនេះ

#### បានដកចេញ
- លក្ខណៈពិសេស ឯកសារ ឬឧទាហរណ៍ដែលមិនមានសារសំខាន់ទៀត
- ព័ត៌មានចាស់ ឬការចាប់ព្យួរដាក់សម្រាប់វិធីសាស្ត្រដដែលមិនប្រើបានទៀត
- ខ្លឹមសារដែលផ្គុំរួមឬបញ្ចូលវិញ

#### បានជួសជុល
- ការកែសម្រួលកំហុស​នៅក្នុងឯកសារ ឬកូដ
- ដំណោះស្រាយបញ្ហាបានរាយការណ៍
- ការកែលម្អលក្ខណៈត្រឹមត្រូវ ឬមុខងារ

#### សុវត្ថិភាព
- ការកែលម្អ ឬជួសជុលផ្នែកសុវត្ថិភាព
- ការអាប់ដេតលក្ខណៈសុវត្ថិភាពល្អបំផុត
- ដំណោះស្រាយចំពោះរស្មីសន្តិសុខ

### មគ្គុទេសក៍ Semantic Versioning

#### កំណែចម្បង (X.0.0)
- ការផ្លាស់ប្តូរដែលបំបែកដែលត្រូវការការប្រតិបត្តិការរបស់អ្នកប្រើ
- ការរៀបចំឡើងវិញយ៉ាងសំខាន់នៃមាតិកា ឬការរៀបចំ
- ការផ្លាស់ប្តូរដែលប្តូរជារឿយៗនៃវិធីសាស្រ្តឬវិធីសាស្រ្ត

#### ជំនាន់តូច (X.Y.0)
- លក្ខណៈពិសេសថ្មី ឬការបន្ថែមមាតិកា
- ការកែលម្អដែលរក្សាការចុះថយក្រោយ
- ឧទាហរណ៍បន្ថែម ឧបករណ៍ ឬធនធាន

#### ជំនាន់វគ្គតូច (X.Y.Z)
- ការជួសជុលបញ្ហា និងកែប្រែ
- ការកែលម្អតិចតួចចំពោះមាតិកាបច្ចុប្បន្ន
- ការបញ្ជាក់ និងការកែលម្អតូចៗ

## មតិយោបល់ និងការផ្តល់ដំបូន្មានពីសហគមន៍

យើងលើកទឹកចិត្តយ៉ាងខ្លាំងចំពោះមតិយោបល់ពីសហគមន៍ដើម្បីកែលម្អធនធានការសិក្សានេះ៖

### របៀបផ្តល់មតិយោបល់
- **បញ្ហារ GitHub**: រាយការណ៍បញ្ហា ឬផ្តល់យោបល់កែលម្អ (បញ្ហាពិសេស AI ត្រូវបានស្វាគមន៍)
- **ការពិភាក្សារបស់ Discord**: ចែករំលែកគំនិត និងចូលរួមជាមួយសហគមន៍ Microsoft Foundry
- **តំណរ Pull Requests**: ឧបត្ថម្ភការកែលម្អដោយផ្ទាល់ទៅមាតិកា ជាពិសេសទំព័ររចនានិងមគ្គុទេសក៍ AI
- **Microsoft Foundry Discord**: ចូលរួមនៅក្នុងបន្ទះ #Azure សម្រាប់ការពិភាក្សា AZD + AI
- **ការពិភាក្សាសហគមន៍**: ចូលរួមក្នុងការពិភាក្សាអ្នកអភិវឌ្ឍន៍ Azure ទូលំទូលាយ

### ប្រភេទមតិយោបល់
- **ភាពត្រឹមត្រូវមាតិកា AI**: ការកែប្រែទាក់ទងនឹងការរួមបញ្ចូលសេវាកម្ម AI និងព័ត៌មានដំឡើង
- **បទពិសោធន៍ការសិក្សា**: ការផ្តល់យោបល់សម្រាប់លំហរសិក្សាអភិវឌ្ឍន៍ AI ដែលកាន់តែប្រសើរ
- **ការខ្វះខាតមាតិកា AI**: សំណើសម្រាប់វគ្គរចនា ម៉ូដែល ឬឧទាហរណ៍បន្ថែម
- **ភាពងាយស្រួលចូលដំណើរការ**: ការកែលម្អសម្រាប់តម្រូវការសិក្សាពណ៌នាផ្សេងៗ
- **ការរួមបញ្ចូលឧបករណ៍ AI**: ការផ្តល់យោបល់សម្រាប់របៀបគ្រប់គ្រងការអភិវឌ្ឍ AI ល្អប្រសើរជាងមុន
- **ម៉ូដែលផលិត AI**: សំណើសម្រាប់ម៉ូដែលដំឡើង AI សម្រាប់អាជីវកម្ម

### ការប្តេជ្ញារ្ដែលឆ្លើយតប
- **ការឆ្លើយតបបញ្ហា**: នៅរយៈពេល ៤៨ ម៉ោងសម្រាប់បញ្ហារបាយការណ៍
- **សំណើលក្ខណៈពិសេស**: ការវាយតម្លៃក្នុងរយៈពេលមួយសប្តាហ៍
- **ការរួមចំណែកសហគមន៍**: ពិនិត្យក្នុងរយៈពេលមួយសប្តាហ៍
- **បញ្ហាសុវត្ថិភាព**: សារៈសំខាន់ភ្លាមៗជាមួយនិងការឆ្លើយតបរហ័ស

## កាលវិភាគថែរក្សា

### បច្ចុប្បន្នអាប់ដេតទៀងទាត់
- **ការត្រួតពិនិត្យប្រចាំខែ**: ភាពត្រឹមត្រូវមាតិកា និងការត្រួតពិនិត្យតំណភ្ជាប់
- **ការអាប់ដេតត្រីមាស**: ការបន្ថែម និងកែលម្អមាតិកាសំខាន់
- **ការត្រួតពិនិត្យឆមាស**: ការរៀបចំឡើងវិញ និងការកែលម្អទូលំទូលាយ
- **ការចេញផ្សាយប្រចាំឆ្នាំ**: ការអាប់ដេតជំនាន់ធំជាមួយការកែលម្អមានន័យសំខាន់

### ការត្រួតពិនិត្យ និងធានាគុណភាព
- **ការសាកល្បងស្វ័យប្រវត្តិកម្ម**: ការត្រួតពិនិត្យទៀងទាត់នៃឧទាហរណ៍កូដ និងតំណភ្ជាប់
- **ការរួមបញ្ចូលមតិយោបល់សហគមន៍**: ការរួមបញ្ចូលយោបល់អ្នកប្រើរៀងរាល់ពេល
- **ការអាប់ដេតបច្ចេកវិទ្យា**: យោងតាមសេវាកម្ម Azure ថ្មីៗ និងការចេញផ្សាយ azd
- **ការត្រួតពិនិត្យភាពងាយស្រួលចូលដំណើរការ**: ការត្រួតពិនិត្យសម្រាប់គោលការណ៍រចនាបថរួមបញ្ចូល

## គោលការណ៍គាំទ្រជំនាន់

### ការគាំទ្រជំនាន់បច្ចុប្បន្ន
- **ជំនាន់ធំបុងចុងក្រោយ**: គាំទ្រពេញលេញជាមួយការអាប់ដេតទៀងទាត់
- **ជំនាន់ធំមុន**: ការអាប់ដេតសុវត្ថិភាព និងការជួសជុលសំខាន់រយៈពេល ១២ ខែ
- **ជំនាន់ចាស់**: គាំទ្រសហគមន៍តែប៉ុណ្ណោះ មិនមានការអាប់ដេតផ្លូវការឡើយ

### មគ្គុទេសក៍ការផ្លាស់ប្តូរ
នៅពេលជំនាន់ធំត្រូវបានចេញផ្សាយ យើងផ្តល់:
- **មគ្គុទេសក៍ផ្លាស់ប្តូរ**: សេចក្តីណែនាំជំហានលំដាប់ជំហាន
- **កំណត់ហេតុភាពស្របគ្នា**: ព័ត៌មានអំពីការផ្លាស់ប្តូរដែលបំបែក
- **គាំទ្រឧបករណ៍**: ស្គ្រីប ឬឧបករណ៍ជំនួយសម្រាប់ការផ្លាស់ប្តូរ
- **គាំទ្រសហគមន៍**: វេទិកាសំរាប់សំណួរផ្លាស់ប្តូរ

---

**ការរុករក**
- **មេរៀនមុន**: [មគ្គុទ្ឋានសិក្សា](resources/study-guide.md)
- **មេរៀនបន្ទាប់**: ត្រឡប់ទៅ [README និយម](README.md)

**រក្សាទុកភាពទាន់សម័យ**: តាមដានឃ្លាំងនេះសម្រាប់ព័ត៌មានអំពីការចេញផ្សាយថ្មី និងការអាប់ដេតសំខាន់ទាក់ទងសម្ភារៈសិក្សា។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
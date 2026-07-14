# កំណែបញ្ជី - AZD សម្រាប់អ្នកចាប់ផ្តើម

## ការណែនាំ

កំណែបញ្ជីនេះរៀបរាប់ពីការផ្លាស់ប្តូរដ៏សំខាន់ៗ ទាន់សម័យ និងការកែលម្អទៅកាន់ឃ្លាំង AZD សម្រាប់អ្នកចាប់ផ្តើម។ យើងអនុវត្តគោលការណ៍ semantic versioning ហើយថែរក្សាកំណែបញ្ជីនេះដើម្បីជួយអ្នកប្រើប្រាស់យល់ពីអ្វីដែលបានផ្លាស់ប្តូរវាងកំណែ។

## គោលបំណងរៀន

ដោយការពិនិត្យមើលកំណែបញ្ជីនេះ អ្នកនឹងៈ
- រក្សារជ្រាបពីលក្ខណៈពិសេសថ្មីៗ និងការបន្ថែមមាតិកា
- យល់ដឹងពីការកែលម្អដែលបានធ្វើទៅលើឯកសារបច្ចុប្បន្ន
- តាមដានការជួសជុលកំហុស និងកែសម្រួលដើម្បីធានារបៀបត្រឹមត្រូវ
- តាមដានការវិវឌ្ឍន៍សម្ភារៈសិក្សាពេលវេលាដំណើរការ

## លទ្ធផលរៀន

បន្ទាប់ពីពិនិត្យមើលកំណែបញ្ជី អ្នកនឹងអាច៖
- សម្គាល់មាតិកា និងធនធានថ្មីៗសម្រាប់ការសិក្សា
- យល់ដឹងថាផ្នែកណាដែលបានធ្វើបច្ចុប្បន្នភាព ឬកែលម្អ
- រៀបចំផ្លូវការសិក្សារបស់អ្នកផ្អែកលើសម្ភារៈទំនើបបំផុត
- ឯកទេសមតិយោបល់ និងយោបល់សម្រាប់ការកែលម្អអនាគត

## ប្រវត្តិការផ្លាស់ប្តូរ

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: ការអាប់ដេតកំណែទាន់ពេលវេលា
**កំណែនេះធ្វើការផ្ទៀងផ្ទាត់វគ្គបណ្ដុះបណ្ដាលជាមួយ `azd` `1.27.1` (ខែកក្កដា 2026, កំណែមានស្ថិរភាពចុងក្រោយ) និងកម្មវិធីបន្ថែមAI ជំពូកសាកល្បង `azure.ai.agents` `1.0.0-beta.5` ដើម្បីធ្វើឲ្យបដាណ "validated against" ទាំងអស់ទាន់សម័យឡើងក្រោយចេញផ្សាយកំណែ 1.26.0, 1.27.0 និង 1.27.1។**

#### ការផ្លាស់ប្តូរ
- **✅ ការផ្លាស់ប្តូរជាគោលការណ៍ផ្ទៀងផ្ទាត់** ពី `azd 1.25.6` (មិថុនា 2026) ទៅ `azd 1.27.1` (ខែកក្កដា 2026) សម្រាប់ README.yml រៀងរហូតដល់ README ជំពូកទាំងអស់ គ្រូវគ្គ dev-container ជំពូក ១ (រួមទាំងឧទាហរណ៍កំណែចុងក្រោយ), មេរៀន custom-templates ជំពូក ៤, មេរៀន multi-agent ជំពូក ៥ និងឯកសារកម្មវិធីមុខងារ  
- **🤖 កំណែចុងក្រោយ baseline ជំពូក ២ ត្រូវបានធ្វើឲ្យទាន់សម័យ** ពី `azd 1.23.12` (មិនារី 2026) ទៅ `azd 1.27.1` នៅក្នុង `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` និង `microsoft-foundry-integration.md`; ពង្រីកកំណត់សម្គាល់បញ្ជាក់ថ្ងៃ ២០២៦-០៧-១៣
- **🧩 ការបន្ថែមកម្មវិធីបន្ថែមAI** ពី `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ទៅកំណែ​បច្ចុប្បន្ន `1.0.0-beta.5` ក្នុង README ជំពូក ២ និង `agents.md`
- **🧪 ឧទាហរណ៍ផ្ទៀងផ្ទាត់វគ្គបណ្ដុះបណ្ដាល** ពិនិត្យលទ្ធផល `azd version` ត្រូវបានធ្វើឲ្យទាន់សម័យទៅ `1.27.1`

#### កំណត់សម្គាល់លើការចេញផ្សាយ azd ដ៏ពាក់ព័ន្ធ (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** គាំទ្រការប្រើប្រាស់ Azure Functions លើ Flex Consumption, `azd config sub-filter` សម្រាប់បញ្ចូលច្រាស់ផ្នែកជាវ, កញ្ចប់បន្ថែមដែលមានផ្ទាល់ខ្លួន (`azd x pack --bundle`), និង `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** គំរូគម្រោង Azure AI Foundry/ភ្នាក់ងារតាមផ្លូវដោយផ្ទាល់ក្នុង `azure.yaml` (គ្មាន Bicep/Terraform ក្នុងដំណើរការ init), គាំទ្រការដាក់កុងតឺន័រ សម្រាប់ App Service (`host: appservice` + `language: docker`), បញ្ជា `-s/--source` សម្រាប់ពាក្យបញ្ជា `azd extension`, និង `azd tool uninstall`
- **1.27.1 (2026-07-09):** បន្ថែមប៉ារ៉ាម៉ែត្រ `--no-dependencies` សម្រាប់ `azd extension install`, ការច្រានចោលគំរូដែលមិនប្រើបានសម្រាប់បញ្ជីកាតាឡុក/កំណត់រង្វាន់ពហុចំនួនមួយដោយលំនាំដើម, និងជួសជុលកំហុសជាច្រើន

#### ឯកសារដែលបានបណ្តុះបណ្តាល
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

#### ការបញ្ចូលចន្លោះមួយសម្រាប់អ្នកចាប់ផ្តើម#2: ការសរសេរគំរូ, Dev Containers, Pulumi, Azure DevOps, បណ្តាញសេវាកម្ម និង ផ្សេងៗទៀត
**កំណែនេះបិទចន្លោះសំខាន់ៗនៅចន្លោះកម្រិតមធ្យមដែលបានរកឃើញដោយវិភាគ azd-coverage៖ របៀបប្រើប្រាស់ និងបោះផ្សាយគំរូផ្ទាល់ខ្លួន, បរិយាកាស dev-container/Codespaces ដែលអាចធ្វើឡើងឡើងវិញបាន, អ្នកផ្គត់ផ្គង់សម្ភារៈ Pulumi, ការបង្ហាញ CI/CD Azure DevOps, ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ service-principal, ដំណើរការ​សម្រាប់ជ្រើសរើសម៉ាស៊ីនបម្រើ (AKS/Spring Apps), ពិពណ៌នាអំពី `azd restore`/`azd package`, ការគ្រប់គ្រងកំហុស hook និងអនុវត្តន៍ក្រុម/បរិយាកាសចែករំលែក។**

#### បានបន្ថែម
- **🧱 មេរៀនថ្មីជំពូក ៤** `docs/chapter-04-infrastructure/custom-templates.md` — ការសរសេរ គំរូ AZD ផ្ទាល់ខ្លួន៖ រចនាសម្ព័ន្ធខ្លឹមសារ (`azure.yaml`, `infra/`, `src/`), វាល `metadata.template`, ការបញ្ចូលប៉ារាម៉ែត្រសម្រាប់ធនធាន៖ token `uniqueString()` និង tag `azd-env-name`, ការធ្វើតេស្តក្នុងមូលដ្ឋានជាមួយ `azd init --template <local-path>`, ការបោះផ្សាយទៅ GitHub, និងដាក់ស្នើទៅកាន់បណ្ណាល័យ Awesome AZD
- **📦 មេរៀនថ្មីជំពូក ១** `docs/chapter-01-foundation/dev-containers.md` — បរិយាកាស AZD អាចធ្វើឡើងឡើងវិញជាមួយ Dev Containers និង GitHub Codespaces: `.devcontainer/devcontainer.json` តូចៗ ដែលប្រើមុខងារ `ghcr.io/azure/azure-dev/azd` ផ្លូវការដោយផ្ទាល់, មុខងារភាសាជាក់លាក់, `docker-in-docker` សម្រាប់ម៉ាស៊ីនបម្រើ container និង `azd auth login --use-device-code` សម្រាប់ចុះឈ្មោះពីចម្ងាយ
- **🧩 Pulumi ជាមួយ AZD** ផ្នែកនៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, រចនាសម្ព័ន្ធថត Pulumi, stacks ដែលត្រូវដាក់សមត្ថភាពទៅបរិយាកាស AZD, តម្រូវឲ្យមាន output/tagging និងចរន្តដំណើរការ `azd up` / `azd down` ដដែលគ្នា
- **🎯 ការណែនាំសម្រាប់ជ្រើសរើសម៉ាស៊ីនបម្រើ** នៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — ការប្រៀបធៀបដែលងាយស្រួលសម្រាប់អ្នកចាប់ផ្តើមរវាង `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, និង `springapp` ជាមួយការណែនាំអំពីពេលណាដែលគួរជ្រើសផ្នែក AKS ឬ Azure Spring Apps
- **🛠️ ការដំណើរការ Azure DevOps CI/CD** នៅក្នុង `docs/chapter-08-production/production-ai-practices.md` — ពាក្យបញ្ជា `azd pipeline config --provider azdo`, ភ្ជាប់សេវាកម្មជាមួយធនធាន workload identity federation (OIDC), ឯកសារ `azure-dev.yml` ដែលបានបង្កើត, និងការកំណត់ variable-group
- **🔑 Service Principals (លំនាំ ៤)** បានបន្ថែមទៅ `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ការចុះឈ្មោះ `azd auth login` មិនមានអន្តរកម្មជាមួយ client secret ឬព័ត៍មាន federated/OIDC, ពេលណាដែលគួរប្រើ និងរបៀបរក្សាទុកគោលបំណងយ៉ាងសុវត្ថិភាព
- **🪝 ការគ្រប់គ្រងកំហុស hook** នៅក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes និង `set -e`, `continueOnError`, ការធ្វើតេស្ត hook ដោយឡែកជាមួយ `azd hooks run`, shell មួយចំនួនជាក់លាក់សម្រាប់ OS, និង `--debug`
- **👥 ក្រុមវិស័យ / បរិយាកាសចែករំលែក** ផ្នែកនៅក្នុង `docs/chapter-03-configuration/configuration.md` — អ្វីដែលស្ថិតនៅ `.azure/`, អ្វីដែលត្រូវ gitignore, បរិយាកាសសម្រាប់អ្នកអភិវឌ្ឍន៍រៀងៗខ្លួន, ការជ្រើសរើសបរិយាកាស `azd env list`/`select` និងការផ្តល់តម្លៃបរិយាកាស នៅក្នុង CI/CD
- **🧰 យោងពន្យល់ `azd restore` និងពន្យល់បន្ថែម `azd package`** នៅក្នុង `resources/cheat-sheet.md` — ការស្ដារឡើងវិញផ្នែកភាពទំនាក់ទំនង ហើយកសាងឯកសារដើម្បីដាក់បង្ហាញដោយមិនបង្ហាញនៅលើ

#### បានផ្លាស់ប្តូរ
- **🧭 បន្ទាត់កាលវិភាគមេរៀនជំពូក ៤** បានធ្វើឲ្យទាន់សម័យ ដើម្បីបញ្ចូលមេរៀនថ្មី "សរសេរគំរូផ្ទាល់ខ្លួន" (មេរៀន ៣)
- **🧭 បន្ទាត់កាលវិភាគមេរៀនជំពូក ១** បានធ្វើឲ្យទាន់សម័យ ដើម្បីបញ្ចូលមេរៀន "Dev Containers & Codespaces" ថ្មី (មេរៀន ៥); បំប៉ោងដំណាក់កាលចរន្តរវាង `bring-your-own-app.md` និង `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### ការបញ្ចូលចន្លោះមួយសម្រាប់អ្នកចាប់ផ្តើម: មេរៀន Multi-Agent ដំណើរការយ៉ាងខ្លាំង, "យកកម្មវិធីផ្ទាល់ខ្លួន", Terraform និងការបង្ហាញ CI/CD
**កំណែនេះបិទចន្លោះធំបំផុតសម្រាប់មគ្គុទេសក៍សម្រាប់អ្នកចាប់ផ្តើមដោយបន្ថែមមេរៀនពីរដែលអាចអនុវត្តបានដោយដៃ (ដំណើរប្រើ multi-agent នឹងការបន្ថែម azd ទៅក្នុងកម្មវិធីមានរួច), ការណែនាំ hook សម្រាប់អ្នកចាប់ផ្តើម, ផ្នែក Terraform ជាមួយ azd, ដំណើរការ pipeline GitHub Actions ជាដំណាក់កាល, ពិពណ៌នាអំពីកម្មវិធីបន្ថែមជំពូកសាកល្បងថ្មីៗ, និងបញ្ជីពិនិត្យការបញ្ជូនដំណើរការដោយច្បាស់លាស់។**

#### បានបន្ថែម
- **🤝 មេរៀនថ្មីជំពូក ៥** `docs/chapter-05-multi-agent/multi-agent-basics.md` — ដំណើរការជាក់ស្តែង និងអាចដាក់ចេញបាន រួមមានភ្នាក់ងារចំនួនពីរ (orchestrator + specialists) ប្រើគំរូពិតប្រាកដ `contoso-creative-writer`, ពិពណ៌នា ការប្រើប្រាស់ multi-agent, ចរន្តកម្មវិធី `azd up`, យល់ដឹងពីធនធានបានដាក់ចេញ, ការតាមដានរវាងភ្នាក់ងារ, ការប្តូរតាមតម្រូវការ និងការសំអាត
- **📦 មេរៀនថ្មីជំពូក ១** `docs/chapter-01-foundation/bring-your-own-app.md` — របៀបបន្ថែម azd ទៅគម្រោងមានរួចជាមួយ `azd init` ("ប្រើកូដនៅថតបច្ចុប្បន្ន"), បញ្ច្រាស់ `azure.yaml` និង `infra/`, `azd infra generate`, ការរកឃើញម៉ាស៊ីនបម្រើ និងការដាក់ចេញជាមួយ `azd up`
- **🌐 ផ្នែក Terraform ជាមួយ azd** នៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — ការកំណត់ `infra.provider: terraform`, រចនាសម្ព័ន្ធថត `.tf`, output `AZURE_*` និង tag `azd-env-name` ត្រូវបានទាមទារ, ចរន្តដំណើរការ `azd up` / `azd down` ដដែល (បិទចន្លោះសម្រាប់ Terraform ដែលខ្លះបានប្រាប់ប៉ុន្តែត្រឹមបង្ហាញ Bicep ប៉ុណ្ណោះ)
- **⚙️ សកម្មភាព GitHub Actions ដំណាក់កាលដោយដំណាក់កាល** នៅក្នុង `docs/chapter-08-production/production-ai-practices.md` — ពី repo GitHub ទៅការដាក់ចេញដោយស្វ័យប្រវត្តិ: `azd pipeline config`, ព័ត៍មាន OIDC federated (គ្មានសំងាត់រក្សាទុក), ឯកសារ `azure-dev.yml` ដែលបានបង្កើត និងការណែនាំសេរ៉ាត-vs-អថេរ
- **🪝 ការណែនាំ "ថ្មីចំពោះ hook?" សម្រាប់អ្នកចាប់ផ្តើម** នៅក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — hook ជាអ្វី, តារាងជំហាន hook, hook ស្រាលបំផុតដំបូង និងរត់ hook ដោយដៃជាមួយ `azd hooks run`
- **✅ បញ្ជីពិនិត្យ "ផ្ទៀងផ្ទាត់ការដាក់ចេញរបស់អ្នក"** បានបន្ថែមទៅ ជំហាន​ទី ៥ នៅក្នុង `docs/chapter-01-foundation/first-project.md` — ពិនិត្យថ្នាំ មានទីតាំងសុខភាព និងលក្ខខណ្ឌជោគជ័យជាក់ស្តែង
- **🧩 ពិពណ៌នាអំពីកម្មវិធីបន្ថែមថ្មីៗ** `azure.ai.skills` និង `azure.ai.connections` (អ្វីដែលវា និងពេលណាចាំបាច់ប្រើ) នៅ `docs/chapter-08-production/production-ai-practices.md`

#### បានផ្លាស់ប្តូរ
- **🧭 តារាងមេរៀនជំពូក ៥** បានកែប្រែ: `multi-agent-basics.md` ឥឡូវនេះជាមេរៀន ១ (មេរៀនដែលអាចអនុវត្តបានដោយដៃតែម្ដង), ដោយមានស្លាកថា មេរៀន ២ ស្ថិតនៅជំពូក ៦ ហើយសេណារីយោ Retail គឺផែនការស្ថាបត្យកម្ម មិនមែនគំរូពាក្យបញ្ជាឡើយ
- **🧭 តារាងមេរៀនជំពូក ១** មានមេរៀនថ្មី "យកកម្មវិធីផ្ទាល់ខ្លួន" (មេរៀន ៤)
- **🔗 កំណត់រយៈផ្លូវចរន្ត** បានធ្វើឲ្យទាន់សម័យ: `first-project.md` ឥឡូវនេះភ្ជាប់ទៅមុខពី `bring-your-own-app.md`

#### បានជួសជុល
- **🧱 បិទចន្លោះ Terraform "បានឲ្យសង្ឃឹមប៉ុន្តែមិនមាន"** — វគ្គបណ្ដុះបណ្ដាលមុនគឺបានគូទ្រង់ទ្រាយគាំទ្រ Terraform ប៉ុន្តែមិនបង្ហាញវា
- **🔀 កែប្រែមាតិកាអោយបានត្រឹមត្រូវក្នុងតំណភ្ជាប់ជំពូក ៥** ដែលបានបង្ហាញថាមាន Multi-Agent ខណៈជាក់ស្តែងគឺមានគំរូស្ថាបត្យកម្មតែប៉ុណ្ណោះ

#### ឯកសារដែលបានបន្តបន្ទាប់
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

#### AZD 1.25.6 Refresh, ពាក្យបញ្ជារសម្រាប់ជីវិតនៃភ្នាក់ងារ និងការបំលែងជាឈ្មោះ Aspire

**កំណែកំណែនេះបញ្ជាក់ឡើងវិញអំពីវគ្គសិក្សាជាមួយ `azd` `1.25.6` (ខែមិថុនា ២០២៦) និងផ្នែកបន្ថែម `azure.ai.agents` `0.1.40-preview` ដ៏ថ្មីនេះ ពង្រីកការណែនាំ AI ពី "បង្កើតភ្នាក់ងារ" ទៅដល់ជីវិតវិធីសាស្ត្ររបស់ភ្នាក់ងារពេញលេញ (សាកល្បង → វាយតម្លៃ → បង្កើនប្រសិទ្ធភាព → ពិនិត្យ → លុបចោល) បង្ហាញផ្នែកបន្ថែមថ្មីៗ `azure.ai.skills` និង `azure.ai.connections` និងផ្តល់កំណត់សម្គាល់អំពីការប្ដូរឈ្មោះផលិតផល ".NET Aspire" ទៅជា "Aspire"។**

#### បន្ថែម
- **🔁 ការដាក់គ្រប់គ្រងជីវិតវិធីសាស្ត្រភ្នាក់ងារពេញលេញ** សម្រាប់អ្នកថ្មី និងវិស្វករប្រើប្រាស់ AI តាមឯកសារ:
  - `docs/chapter-01-foundation/azd-basics.md` — តារាងជីវិតវិធីសាស្ត្រ (បង្កើត → សាកល្បង → វាស់ → ធ្វើប្រសើរ → ពិនិត្យ → សំអាត) ត្រូវបានបន្ថែមទៅផ្នែកផ្នែកបន្ថែម និងពាក្យបញ្ជា AI
  - `docs/chapter-08-production/production-ai-practices.md` — ផ្នែកថ្មី "ការគ្រប់គ្រងជីវិតវិធីសាស្ត្រភ្នាក់ងារ" ដែលគ្របដណ្តប់ `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
  - `resources/cheat-sheet.md` — ពង្រីកពាក្យបញ្ជា AI Agent ជាមួយ `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
- **🧩 ផ្នែកបន្ថែមផ្ទៃមុខថ្មី** ដែលបានឯកសារជាវិចិត្រការណ៍: `azure.ai.skills` (ជំនាញភ្នាក់ងារដែលអាចប្រើឡើងវិញ) និង `azure.ai.connections` (ការតភ្ជាប់ Foundry) ត្រូវបានបន្ថែមក្នុងតារាងផ្នែកបន្ថែម និងបញ្ជីល្បី
- **⏱️ ការណែនាំពេលឆ្លើយតប** - ឧទាហរណ៍ `azd ai agent invoke` ឥឡូវនេះបញ្ជាក់ថាវាបង្ហាញពេលពេញលេញ និងពេលដើមសម្រាប់បៃថ៍ដំបូង
- **📌 បដាក្រុមហ៊ុនកំណែ** នៅឯកសារ README ម្ខាងដើម ផ្ដល់មនុស្សរៀនពី `azd version` និង `azd upgrade`

#### ប្ដូរ
- **✅ មូលដ្ឋានផ្ទៀងផ្ទាត់បានធ្វើបច្ចុប្បន្នភាព** ពី `azd 1.23.12` (មីនា ២០២៦) ទៅ `azd 1.25.6` (មិថុនា ២០២៦) នៅក្នុងរៀបរាប់រាល់គន្លងនិងឯកសារកិច្ចសិក្សា
- **🤖 កំណត់សម្គាល់ផ្នែកបន្ថែមវគ្គ 2** បានធ្វើបច្ចុប្បន្នភាពពី `azure.ai.agents` `0.1.18-preview` ទៅ `0.1.40-preview`
- **🧪 ឧទាហរណ៍ផ្ទៀងផ្ទាត់ការងារ (បញ្ជូន `azd version`)** ធ្វើបច្ចុប្បន្នភាពជាមូលដ្ឋានទៅ `1.25.6`
- **🧭 បញ្ជី README "មានអ្វីថ្មីនៅ azd ថ្ងៃនេះ"** បានធ្វើបច្ចុប្បន្នភាពបង្ហាញអំពីជីវិតវិធីសាស្ត្រភ្នាក់ងារពេញលេញ ផ្នែកបន្ថែម AI ថ្មី និងការកែលម្អគុណភាពជីវិតថ្មីៗ (`azd init` idempotency, `azd auth login` ការលុប stale-token, `azd tool` ការជូនដំណឹងរត់ដំបូង)
- **📖 agents.md វគ្គ 2 (ជម្រើសលេខ 4)** ឥឡូវនេះបង្ហាញអ្នករៀនចូលកាន់ពាក្យបញ្ជាជីវិតវិធីសាស្ត្របន្ទាប់បន្ទាប់ពីការបង្ហោះ មិនឈប់នៅ `azd up` ទេ

#### ដោះស្រាយ
- **🏷️ ការកំណត់ឈ្មោះផលិតផល** — បន្ថែមកំណត់សម្គាល់ការប្ដូរឈ្មោះ Aspire (".NET Aspire" ឥឡូវនេះគ្រាន់តែជា "Aspire"); ការគាំទ្ររបស់ azd សម្រាប់ Aspire មិនផ្លាស់ប្តូរទេ
- **🔎 ការផ្ទៀងផ្ទាត់ការចេញផ្សាយផ្ទាល់** បានបញ្ជាក់ពី Azure Developer CLI release feed: CLI រឹងមាំ `1.25.6` (2026-06-12) និង `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### ការបកស្រាយដល់អ្នកថ្មី, ផ្ទៀងផ្ទាត់ការតំឡើង និងសំអាតពាក្យបញ្ជា AZD ចុងក្រោយ
**កំណែនេះបន្តសកម្មភាពផ្ទៀងផ្ទាត់ AZD 1.23 ជាមួយការបញ្ចូលឯកសារផ្តោតលើអ្នកចូលរួមថ្មី៖ វាបកស្រាយជាក់លាក់ការណែនាំអំពីការផ្ទៀងផ្ទាត់ AZD ជាដំបូង បន្ថែមស្គ្រីបផ្ទៀងផ្ទាត់ការតំឡើងក្នុងស្រុក បញ្ជាក់ពាក្យបញ្ជាសំខាន់ៗជាមួយ AZD CLI ផ្ទាល់ និងលុបចោលអត្ថបទបញ្ជាជាភាសាអង់គ្លេសដែលចាស់នៅក្រៅ changelog។**

#### បន្ថែម
- **🧪 ស្គ្រីបផ្ទៀងផ្ទាត់ការតំឡើងសម្រាប់អ្នកថ្មី** ជាមួយ `validate-setup.ps1` និង `validate-setup.sh` ដើម្បីឲ្យអ្នករៀនអាចបញ្ជាក់ឧបករណ៍ដែលត្រូវការមុនចាប់ផ្តើមវគ្គ ១
- **✅ ជំហានផ្ទៀងផ្ទាត់ការតំឡើងមុន​ចូល** នៅឯកសារ README ម្ខាងដើម និង README ឈ្មោះវគ្គ ១ ដើម្បីកាន់តែចាប់ករណីឧបករណ៍ខ្វះមុនពេល `azd up` រត់

#### ប្ដូរ
- **🔐 ការណែនាំអំពីការផ្ទៀងផ្ទាត់សម្រាប់អ្នកថ្មី** ឥឡូវនេះទទួលស្គាល់មុខងារ `azd auth login` ជាផ្នែកមូលដ្ឋានសម្រាប់លំនាំការងារ AZD ជាប់គ្នា ជាមួយ `az login` ដែលត្រូវបានស្គាល់ថាជាជម្រើសបើត្រូវប្រើបញ្ជាកម្ម Azure CLI យ៉ាងត្រង់ៗ
- **📚 ដំណើរការចូលរួមវគ្គ ១** ឥឡូវនេះណែនាំអ្នករៀនឲ្យផ្ទៀងផ្ទាត់ការតំឡើងក្នុងស្រុកមុនការដំឡើង ការផ្ទៀងផ្ទាត់ និងជំហានបង្ហោះដំបូង
- **🛠️ សារសម្រាប់កម្មវិធីផ្ទៀងផ្ទាត់** ឥឡូវនេះបំបែកយ៉ាងច្បាស់ពីការទាមទារទាំងអស់នៅមុខ ក្រោយពីសារព្រមានបម្រុង Azure CLI ដែលជាជម្រើសសម្រាប់ផ្លូវ AZD ផ្ទាល់
- **📖 ឯកសារការបង្កើតកំណត់ត្រា ការដោះស្រាយបញ្ហា និងឧទាហរណ៍** ពីព្រោះមានការបែងចែកច្បាស់លាស់រវាងការផ្ទៀងផ្ទាត់ AZD ត្រូវការនិងការចូលប្រើ Azure CLI ជាជម្រើសដែលពីមុនមិនបានបញ្ចាក់ប្រកបដោយបរិបទអ្វី

#### ដោះស្រាយ
- **📋 ឯកសារចុងក្រោយដែលមានឯកសារ command បច្ចុប្បន្នភាព** បានធ្វើបច្ចុប្បន្នភាពទៅទ្រង់ទ្រាយ AZD ចាំបាច់បច្ចុប្បន្ន រួមទាំង `azd config show` នៅក្នុង cheat sheet និង `azd monitor --overview` ដែលមានចំណុចណែនាំ Application Insights
- **🧭 ការអះអាងអ្នកថ្មីនៅវគ្គ ១** ត្រូវបានទន់ភ្លោះ ការប្រកាសខ្ពស់អំពីការ error zero ឬ rollback ដោយធានាគ្មានខកខានលើគំរូនិងធនធាន Azure ទាំងអស់
- **🔎 ការផ្ទៀងផ្ទាត់ CLI ផ្ទាល់** បានបញ្ជាក់ការគាំទ្របច្ចុប្បន្នសម្រាប់ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, និង `azd down --force --purge`

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

#### ផ្ទៀងផ្ទាត់ AZD 1.23.12 ពង្រីកបរិយាកាសកិច្ចសិក្សា និងបច្ចុប្បន្នភាពគំរូ AI
**កំណែនេះធ្វើការផ្ទៀងផ្ទាត់ឯកសារជាមួយ `azd` `1.23.12`, គណនាគំរូពាក្យបញ្ជាជាតិចាស់, ធ្វើបច្ចុប្បន្នភាពដល់ការណែនាំគំរូ AI ទៅកាន់លំនាំដើមបច្ចុប្បន្ន និងពង្រីកការណែនាំបន្ទប់បណ្តុះបណ្តាលពី GitHub Codespaces ទៅកាន់ dev containers និង local clones ផងដែរ។**

#### បន្ថែម
- **✅ កំណត់សម្គាល់ផ្ទៀងផ្ទាត់ក្នុងវគ្គសិក្សា និងឯកសារកិច្ចសិក្សា** ដើម្បីបញ្ជាក់មូលដ្ឋានការតែងតាំង AZD ដែលបានសាកល្បងសម្រាប់អ្នករៀនប្រើប្រាស់ CLI កំណែថ្មី ឬចាស់
- **⏱️ ការណែនាំពេលវេលាចាប់ផ្តើមបង្ហោះ** សម្រាប់កម្មវិធី AI រយៈវេលាយូរដំណើរការ `azd deploy --timeout 1800`
- **🔎 ជំហានពិនិត្យផ្នែកបន្ថែម** ជាមួយ `azd extension show azure.ai.agents` នៅក្នុងឯកសារការប្រើប្រាស់ AI
- **🌐 ការណែនាំបរិយាកាសកិច្ចសិក្សាលំដាប់ធំ** គ្របដណ្តប់ GitHub Codespaces, dev containers, និង local clones ជាមួយ MkDocs

#### ប្ដូរ
- **📚 README ផ្ដើមវគ្គ** ឥឡូវមានកំណត់សម្គាល់ផ្ទៀងផ្ទាត់ `azd 1.23.12` ដល់វគ្គមូលដ្ឋាន ការកំណត់ត្រា បរិស្ថាន ការរាយការណ៍កំហុស និងផ្នែកផលិតកម្ម
- **🛠️ ការអាប់ដេតពាក្យបញ្ជា AZD** ទៅកំណែបច្ចុប្បន្ននៅក្នុងឯកសារទាំងអស់:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ឬ `azd env get-value(s)` បញ្ជាក់តាមបរិបទ
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` នៅពេលមានគោលបំណងបង្ហាញ Application Insights
- **🧪 ឧទាហរណ៍ provision preview** បានធ្វើឲ្យសាមញ្ញជាមួយការប្រើប្រាស់ទ្រង់ទ្រាយសម័យថ្មីដូចជា `azd provision --preview` និង `azd provision --preview -e production`
- **🧭 ដំណើរការកិច្ចសិក្សា** បានធ្វើឲ្យអ្នករៀនអាចបញ្ចប់ការបណ្តុះបណ្តាលនៅ Codespaces, dev container ឬ local clone ជំនួស Codespaces តែម្ដង
- **🔐 ការណែនាំការផ្ទៀងផ្ទាត់** ឥឡូវនេះសំខាន់សម្រាប់ចូលប្រើ `azd auth login` សម្រាប់លំនាំកម្មវិធី AZD ប៉ុន្តែ `az login` ទទួលស្គាល់ជាជម្រើសបើមានការប្រើប្រាស់ Azure CLI ដោយផ្ទាល់

#### ដោះស្រាយ
- **🪟 ការលំនាំដំឡើង Windows** បានធ្វើអោយស្រួលដោយដាក់ឈ្មោះកញ្ចប់ `winget` ឲ្យត្រឹមត្រូវក្នុងមគ្គុទេសក៍ដំឡើង
- **🐧 ការណែនាំដំឡើង Linux** កែប្រែដើម្បីជៀសវាងការប្រើប្រាស់ `azd` package manager ដែលមិនគាំទ្ររបស់ distro ជាក់លាក់ និងដាក់ជំនួសដោយបង្ហាញអំពី release asset ត្រឹមត្រូវ
- **📦 ឧទាហរណ៍គំរូ AI** បានធ្វើបច្ចុប្បន្នភាពពីលំដាប់ដើមចាស់ៗដូចជា `gpt-35-turbo` និង `text-embedding-ada-002` ទៅឧទាហរណ៍ថ្មីដូចជា `gpt-4.1-mini`, `gpt-4.1` និង `text-embedding-3-large`
- **📋 វាគ្មិនការបង្ហោះនិងការវិភាគបញ្ហា** បានកែតម្រូវឲ្យប្រើប្រាស់ពាក្យបញ្ជាបរិស្ថានបច្ចុប្បន្ន និងស្ថានភាពក្នុងកំណត់ហេតុនិងស្ព្រាក់ធុង
- **⚙️ ការណែនាំ GitHub Actions** បានធ្វើបច្ចុប្បន្នភាពពី `Azure/setup-azd@v1.0.0` ទៅ `Azure/setup-azd@v2`
- **🤖 ការណែនាំ MCP/Copilot consent** បានធ្វើបច្ចុប្បន្នភាពពី `azd mcp consent` ទៅ `azd copilot consent list`

#### កែលម្អ
- **🧠 ការណែនាំវគ្គ AI** ឥឡូវនេះពន្យល់លម្អិតអំពីរបៀបប្រើប្រាស់ `azd ai` ដែលមានតែបរិបទ preview, ការចូលប្រើ tenant ជាក់លាក់, ការប្រើប្រាស់ផ្នែកបន្ថែមបច្ចុប្បន្ន និងសំណើរសម្រាប់ការបង្ហោះគំរូថ្មីៗ
- **🧪 ការណែនាំកិច្ចសិក្សា** ឥឡូវនេះប្រើឧទាហរណ៍កំណែថ្មីស្រស់ និងភាសាការតំឡើងបរិយាកាសដ៏ច្បាស់ស្រួលសម្រាប់កិច្ចសិក្សា
- **📈 ឯកសារផលិតកម្មនិងដោះស្រាយបញ្ហា** ឥឡូវស្របគ្នាជាងមុនជាមួយការត្រួតពិនិត្យបច្ចុប្បន្ន, គំរូ fallback, និងឧទាហរណ៍ថ្នាក់ថ្លៃដើមប្រាក់កំណត់

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

#### ពាក្យបញ្ជា AZD AI CLI, ផ្ទៀងផ្ទាត់មាតិកា និងពង្រីកគំរូ
**កំណែនេះបន្ថែមការគ្រប់គ្រងពាក្យបញ្ជា `azd ai`, `azd extension`, និង `azd mcp` ក្នុងរាល់វគ្គទាក់ទង AI ទាំងអស់, ជួសជុលតំណភ្ជាប់ខូច និងកូដចាស់នៅក្នុង agents.md, ធ្វើបច្ចុប្បន្នភាព cheat sheet, និងកែសម្រួលផ្នែកគំរូឧទាហរណ៍ដោយមានការបញ្ជាក់ពីការពិពណ៌នាថ្មីៗ និងគំរូ Azure AI AZD ថ្មីៗ។**

#### បន្ថែម
- **🤖 ការគ្រប់គ្រង AZD AI CLI** នៅក្នុងឯកសារ 7 ឯកសារ (ពីមុនគ្រាន់តែមាននៅវគ្គ ៨ តែប៉ុណ្ណោះ):
  - `docs/chapter-01-foundation/azd-basics.md` — ផ្នែកថ្មី "ផ្នែកបន្ថែម និងពាក្យបញ្ជា AI" ដែលណែនាំ `azd extension`, `azd ai agent init`, និង `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ជម្រើស 4៖ `azd ai agent init` ជាមួយតារាងប្រៀបធៀប (គំរូ ទល់នឹង មើល)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ផ្នែក "AZD Extensions សម្រាប់ Foundry" និង "ការបង្ហោះដោយភ្នាក់ងារជាដំបូង"

  - `docs/chapter-05-multi-agent/README.md` — ចាប់ផ្តើមយ៉ាងរហ័សបង្ហាញផ្លូវការដាក់បង្ហាញទាំងពីរដោយផ្អែកលើពុម្ពទម្រង់ និង manifests
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ផ្នែកដាក់បង្ហាញឥឡូវនេះរួមបញ្ចូលជម្រើស `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ផ្នែកតូច "ពាក្យបញ្ជា AZD AI Extension សម្រាប់ការធ្វើរោគវិនិច្ឆ័យ"
  - `resources/cheat-sheet.md` — ផ្នែកថ្មី "ពាក្យបញ្ជា AI និង Extensions" រួមមាន `azd extension`, `azd ai agent init`, `azd mcp`, និង `azd infra generate`
- **📦 តំរូវ AZD AI ឧទាហរណ៍ថ្មីៗ** ក្នុង `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — ការជជែក RAG .NET ជាមួយ Blazor WebAssembly, Semantic Kernel, និងការគាំទ្រជជែកដោយសំឡេង
  - **azure-search-openai-demo-java** — ការជជែក RAG ជា Java ដោយប្រើ Langchain4J មានជម្រើសដាក់បង្ហាញ ACA/AKS
  - **contoso-creative-writer** — កម្មវិធីសរសេរច្នៃប្រឌិតមហាសេដ្ឋីភ្នាក់ងារច្រើនប្រើ Azure AI Agent Service, Bing Grounding និង Prompty
  - **serverless-chat-langchainjs** — RAG គ្មានម៉ាស៊ីនបម្រើដោយប្រើ Azure Functions + LangChain.js + Cosmos DB ជាមួយការគាំទ្រអភិវឌ្ឍន៍ Ollama បណ្ដោយកន្លែង
  - **chat-with-your-data-solution-accelerator** — ប្រព័ន្ធបន្ទាន់ RAG សម្រាប់អាជីវកម្មជាមួយផតថលគ្រប់គ្រង, សមាសភាព Teams និងជម្រើស PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — កម្មវិធីឧទាហរណ៍ចងក្រង MCP ភ្នាក់ងារច្រើនជាមួយម៉ាស៊ីនបម្រើក្នុង .NET, Python, Java, និង TypeScript
  - **azd-ai-starter** — ពុម្ពសំណុំបង្រៀនបន្ទាប់ Azure AI ដ៏តិចតួច Bicep
  - **🔗 តំណ AZD AI Gallery អស្ចារ្យ** — ឯកសារយោងទៅកាន់ [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (ពុម្ពទម្រង់ជាង 80)

#### បង្ហាញថាបានជួសជុល
- **🔗 agents.md នាវីហ្គេရှិន**: តំណមុន/បន្ទាប់ឥឡូវនេះសមរម្យតាមលំដាប់មេរៀននៅក្នុង Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md តំណខូច**: `production-ai-practices.md` ត្រូវបានកែប្រែទៅជា `../chapter-08-production/production-ai-practices.md` (មាន 3 កន្លែង)
- **📦 agents.md កូដដែលមិនប្រើទៀត**: ជំនួស `opencensus` ជាមួយ `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md API មិនត្រឹមត្រូវ**: ប្តូរ `max_tokens` ពី `create_agent()` ទៅ `create_run()` ជា `max_completion_tokens`
- **🔢 agents.md ការរាប់ token**: ជំនួសការប៉ាន់ស្មានដំបូង `len//4` ជាមួយ `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: កែសម្រួលសេវាកម្មពី "Cognitive Search + App Service" ទៅ "Azure AI Search + Azure Container Apps" (ម៉ាស៊ីនបម្រើលំនាំដើមផ្លាស់ប្តូរបន្ទាប់ពី ខែតុលាឆ្នាំ 2024)
- **contoso-chat**: បកស្រាយថ្មីដោយយោងទៅ Azure AI Foundry + Prompty ដែលសមរម្យនឹងចំណងជើង និងបច្ចេកវិទ្យានៅក្នុង repo

#### បានដកចេញ
- **ai-document-processing**: ឯកសារពុម្ព​ដែលមិនដំណើរការត្រូវបានដកចេញ (repo មិនអាចចូលបានសាធារណៈជាពុម្ព AZD)

#### ត្រូវបានធ្វើឱ្យប្រសើរឡើង
- **📝 agents.md លំហាត់**: លំហាត់ 1 បង្ហាញលទ្ធផលព្យាករណ៍ និងជំហាន `azd monitor`; លំហាត់ 2 រួមបញ្ចូលកូដចុះបញ្ជី `FunctionTool` ពេញលេញ; លំហាត់ 3 ជំនួសការណែនាំរញាប់រហ័សជាមួយពាក្យបញ្ជា `prepdocs.py` យ៉ាងច្បាស់លាស់
- **📚 agents.md ឯកសារ**: ផ្លាស់ប្តូរតំណភ្ជាប់ឯកសារទៅឯកសារ Azure AI Agent Service និង quickstart នៅបច្ចុប្បន្ន
- **📋 agents.md តារាងជំហានបន្ទាប់**: បញ្ចូលតំណកម្មវិធី AI Workshop សម្រាប់គ្រប់គ្រងមេរៀនពេញលេញ

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### ការកែលម្អនាវីហ្គេស្យុងមេរៀន
**កំណែនេះធ្វើឱ្យ README.md ជាប្រសើរឡើងសម្រាប់ការរុករកនៅក្នុងមេរៀនជាមួយតារាងទម្រង់កែលម្អ។**

#### ផ្លាស់ប្តូរ
- **តារាងផែនที่មេរៀន**: ត្រូវបានបន្ថែមតំណភ្ជាប់ទៅមេរៀនផ្ទាល់, ការប៉ាន់ប្រមាណរយៈពេល និងការវាយតម្លៃវិញ្ញារណសម្បទា
- **សំអាតថតរឹង**: ដកថតចាស់ៗដែលមិនចាំបាច់ចេញ (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **ផ្ទៀងផ្ទាត់តំណភ្ជាប់**: ផ្ទៀងផ្ទាត់តំណភ្ជាប់ក្នុងតារាងផែនទីមេរៀនចំនួន 21+ ទាំងអស់

### [v3.16.0] - 2026-02-05

#### ការអាប់ដេតឈ្មោះផលិតផល
**កំណែនេះធ្វើការអាប់ដេតយោងផលិតផលទៅម៉ាក Microsoft ឥឡូវនេះ។**

#### ផ្លាស់ប្តូរ
- **Microsoft Foundry → Microsoft Foundry**: ឯកសារទាំងអស់បានអាប់ដេតនៅក្នុងឯកសារមិនបំលែងភាសា
- **Azure AI Agent Service → Foundry Agents**: ឈ្មោះសេវាកម្មបានអាប់ដេតក្នុងការបង្ហាញម៉ាកឥឡូវនេះ

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `README.md` - ទំព័រចុះចតមេរៀនសំខាន់
- `changelog.md` - ប្រវត្តិការផ្លាស់ប្តូរ
- `course-outline.md` - រចនាសម្ព័ន្ធមេរៀន
- `docs/chapter-02-ai-development/agents.md` - សៀវភៅណែនាំភ្នាក់ងារ AI
- `examples/README.md` - សៀវភៅឧទាហរណ៍
- `workshop/README.md` - ទំព័រចុះចតវគ្គបណ្តុះបណ្តាល
- `workshop/docs/index.md` - ប្រវត្តិវគ្គបណ្តុះបណ្តាល
- `workshop/docs/instructions/*.md` - ឯកសារណែនាំវគ្គបណ្តុះបណ្តាលទាំងអស់

---

### [v3.15.0] - 2026-02-05

#### ការរៀបចំឯកសារលេខធំជាមួយថតជាប់ឈ្មោះជាប់មេរៀន
**កំណែនេះរៀបចំឯកសារព័ត៌មានទៅថតមេរៀនជាក់លាក់សម្រាប់ការរុករកងាយស្រួលឡើង។**

#### ការផ្លាស់ប្តូរឈ្មោះថត
ថតចាស់ៗ ត្រូវបានជំនួសជាថតគោលលេខមេរៀនៈ
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- បានបន្ថែមថ្មី៖ `docs/chapter-05-multi-agent/`

#### ការបញ្ជូនឯកសារ
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
| ឯកសារទាំងអស់ថត pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| ឯកសារទាំងអស់ថត troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### បន្ថែម
- **📚 ឯកសារ README តាមមេរៀន**: បង្កើត README.md នៅក្នុងថតមេរៀននីមួយៗមាន:
  - គោលបំណងសិក្សា និងរយៈពេល
  - តារាងមេរៀនជាមួយការពណ៌នា
  - ពាក្យបញ្ជាចាប់ផ្តើមយ៉ាងរហ័ស
  - ឧបាយកលទៅមេរៀនផ្សេងទៀត

#### ផ្លាស់ប្តូរ
- **🔗 អាប់ដេតតំណភ្ជាប់ផ្ទៃក្នុងទាំងអស់**: ផ្លូវជាង 78 ត្រូវបានអាប់ដេតនៅក្នុងឯកសារទាំងអស់
- **🗺️ README.md សំខាន់**: ផ្លាស់ប្តូរផែនទីមេរៀនជាមួយរចនាសម្ព័ន្ធថ្មី
- **📝 examples/README.md**: អាប់ដេតកំណត់ត្រារួមទៅថតជាប់មេរៀន

#### ដកចេញ
- រចនាសម្ព័ន្ធថតចាស់ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ការរៀបចំឯកសារ: នាវីហ្គេស្យុងមេរៀន
**កំណែនេះបានបន្ថែមឯកសារ README នារបៀបទស្សនាវដ្តី (ត្រូវបានជំនួសដោយ v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### សៀវភៅណែនាំភ្នាក់ងារ AI ថ្មី
**កំណែនេះបន្ថែមសៀវភៅណែនាំពេញលេញសម្រាប់ដាក់បង្ហាញភ្នាក់ងារប្រើ Azure Developer CLI។**

#### បន្ថែម
- **🤖 docs/microsoft-foundry/agents.md**: មគ្គុទេសក៍ពេញលេញបង្ហាញពី:
  - ភ្នាក់ងារ AI ជាអ្វី និងភាពខុសគ្នារវាងពួកគេនិង chatbot
  - ពុម្ពចាប់ផ្តើមរហ័សបី (Foundry Agents, Prompty, RAG)
  - លំនាំរចនាសម្ព័ន្ធភ្នាក់ងារ (ភ្នាក់ងារតែមួយ, RAG, ភ្នាក់ងារច្រើន)
  - ការកំណត់ឧបករណ៍ និងកែប្រែ
  - ការត្រួតពិនិត្យ និងតាមដានមេត្រិក
  - ការពិចារណាហិរញ្ញវត្ថុ និងការបង្កើនប្រសិទ្ធភាព
  - ករណីបញ្ហាទូទៅ
  - លំហាត់ទាំងបីមានលទ្ធផលជោគជ័យអ្នកទទួល

#### រចនាសម្ព័ន្ធមាតិកា
- **បទបញ្ចូល**: យល់ដឹងអំពីភ្នាក់ងារសម្រាប់អ្នកចាប់ផ្តើម
- **ចាប់ផ្តើមយ៉ាងរហ័ស**: ដាក់បង្ហាញភ្នាក់ងារ ដោយប្រើ `azd init --template get-started-with-ai-agents`
- **លំនាំរចនាសម្ព័ន្ធ**: គំនូរ បង្ហាញលំនាំភ្នាក់ងារ
- **ការកំណត់**: ការកំណត់ឧបករណ៍ និងបរិដ្ឋានអង្គការណ៍
- **ការត្រួតពិនិត្យ**: ការបញ្ចូល Application Insights
- **លំហាត់**: ការសិក្សាសម្រួលដល់ (20-45 នាទីនីមួយៗ)

---

### [v3.12.0] - 2026-02-05

#### ការអាប់ដេតបរិដ្ឋាន DevContainer
**កំណែនេះធ្វើឱ្យកំណត់ DevContainer មានឧបករណ៍ទំនើប និងការកំណត់លំនាំល្អសម្រាប់បទពិសោធន៍រៀន AZD។**

#### ផ្លាស់ប្តូរ
- **🐳 រូបភាពមូលដ្ឋាន**: ផ្លាស់ពី `python:3.12-bullseye` ទៅ `python:3.12-bookworm` (Debian លំនាំដើមថ្មី)
- **📛 ឈ្មោះកុងតឺន័រ**: ផ្លាស់ពី "Python 3" ទៅ "AZD សម្រាប់អ្នកចាប់ផ្តើម" សម្រាប់ច្បាស់លាស់

#### បន្ថែម
- **🔧 លក្ខណៈពិសេស Dev Container ថ្មី**:
  - `azure-cli` ជាមួយការគាំទ្រប្រព័ន្ធ Bicep
  - `node:20` (កំណែ LTS សម្រាប់ពុម្ព AZD)
  - `github-cli` សម្រាប់គ្រប់គ្រងពុម្ព
  - `docker-in-docker` សម្រាប់ដាក់បង្ហាញកម្មវិធី container

- **🔌 ការបញ្ជូនច្រកផត**: ការកំណត់មុនរួចសម្រាប់ច្រកនាវិកម្មទូទៅ៖
  - 8000 (ពិនិត្យមើល MkDocs)
  - 3000 (កម្មវិធីវែប)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 ផ្នែកបន្ថែម VS Code ថ្មី**:
  - `ms-python.vscode-pylance` - អត្ថប្រយោជន៍ Python IntelliSense ប្រសើរឡើង
  - `ms-azuretools.vscode-azurefunctions` - គាំទ្រ Azure Functions
  - `ms-azuretools.vscode-docker` - គាំទ្រ Docker
  - `ms-azuretools.vscode-bicep` - គាំទ្រភាសា Bicep
  - `ms-azure-devtools.azure-resource-groups` - គ្រប់គ្រងធនធាន Azure
  - `yzhang.markdown-all-in-one` - ការកែសម្រួល Markdown
  - `DavidAnson.vscode-markdownlint` - ការត្រួតពិនិត្យ Markdown
  - `bierner.markdown-mermaid` - គាំទ្រគំនូរជាមួយ Mermaid
  - `redhat.vscode-yaml` - គាំទ្រភាសា YAML (សម្រាប់ azure.yaml)
  - `eamodio.gitlens` - បង្ហាញ Git
  - `mhutchie.git-graph` - ប្រវត្តិ Git

- **⚙️ ការកំណត់ VS Code**: បន្ថែមការកំណត់លំនាំដើមសម្រាប់ Python interpreter, ទ្រង់ទ្រាយពេលរក្សាទុក និងដកសំលឹកចន្លោះ

- **📦 អាប់ដេត requirements-dev.txt**:
  - បន្ថែម plugin MkDocs minify
  - បន្ថែម pre-commit សម្រាប់គុណភាពកូដ
  - បន្ថែមកញ្ចប់ Azure SDK (azure-identity, azure-mgmt-resource)

#### បង្ហាញថាបានជួសជុល
- **ពាក្យបញ្ជាប់បន្ទាប់បង្កើត**: ឥឡូវនេះផ្ទៀងផ្ទាត់ការដំឡើង AZD និង Azure CLI ពេលចាប់ផ្តើម container

---

### [v3.11.0] - 2026-02-05

#### ការបំលែង README ចាប់ផ្តើមរងជាមួយភាពងាយស្រួល
**កំណែនេះធ្វើឱ្យREADME.md មើលទៅងាយស្រួលសម្រាប់អ្នកចាប់ផ្តើម ហើយបន្ថែមធនធានសំខាន់សម្រាប់អ្នកអភិវឌ្ឍន៍ AI។**

#### បន្ថែម
- **🆚 ការប្រៀបធៀប Azure CLI និង AZD**: ពន្យល់ច្បាស់ពីពេលណាប្រើឧបករណ៍នីមួយៗជាមួយឧទាហរណ៍ប្រើប្រាស់ពិតប្រាកដ
- **🌟 តំណអស្ចារ្យ AZD**: តំណទៅសាលាគំរូសហគមន៍ និងធនធានរួមចំណែក:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - ពុម្ពទម្រង់ 200+ ដែលមានស្រាប់សម្រាប់ដាក់បង្ហាញ
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - ការរួមចំណែកសហគមន៍
- **🎯 មគ្គុទេសក៍ចាប់ផ្តើមយ៉ាងរហ័ស**: ផ្នែកចាប់ផ្តើម 3 ជំហានសាមញ្ញ (ដំឡើង → ចូលប្រើ → ដាក់បង្ហាញ)
- **📊 តារាងផ្លូវការណែនាំដោយបទពិសោធន៍**: ដឹកនាំយ៉ាងច្បាស់ថាត្រូវចាប់ផ្តើមពីកន្លែងណាតាមបទពិសោធន៍អ្នកអភិវឌ្ឍ

#### ផ្លាស់ប្តូរ
- **រចនាសម្ព័ន្ធ README**: រៀបចំឡើងវិញសម្រាប់កំរិតកន្លែងព៌ត៍មានគន្លងដំបូង
- **ផ្នែកបញ្ជូល**: សរសេរឡើងវិញពន្យល់ "អាថ៌កំបាំងនៃ `azd up`" សម្រាប់អ្នកចាប់ផ្តើមពេញលេញ
- **ដកចេញមាតិកាថតតែមួយគត់**: លុបផ្នែករោគវិនិច្ឆ័យថតដែលមិនចាំបាច់
- **ពាក្យបញ្ជា Troubleshooting**: កែសម្រួលយោង `azd logs` ជា `azd monitor --logs` ត្រឹមត្រូវ

#### បង្ហាញថាបានជួសជុល

- **🔐 ពាក្យបញ្ជាផ្នែកសម្គាល់អត្តសញ្ញាណ**: បន្ថែម `azd auth login` និង `azd auth logout` ទៅ cheat-sheet.md
- **ឈ្មោះពាក្យបញ្ជាមិនត្រឹមត្រូវ**: លុបចោល `azd logs` ដែលនៅសល់ពីផ្នែកដោះស្រាយបញ្ហាក្នុង README

#### កំណត់ចំណាំ
- **លំហ**: ការផ្លាស់ប្តូរក្នុង README.md ផ្នែកសំខាន់ និង resources/cheat-sheet.md
- **ប្រភពនៃអ្នកស្ដាប់**: ការកែលម្អដែលផ្តោតសំខាន់សម្រាប់អ្នកអភិវឌ្ឍថ្មីចំពោះ AZD

---

### [v3.10.0] - 2026-02-05

#### ការអាប់ដេតភាពត្រឹមត្រូវនៃពាក្យបញ្ជា Azure Developer CLI
**កំណែនេះបានកែសម្រួលពាក្យបញ្ជា AZD ដែលមិនមាននៅក្នុងឯកសារ ដើម្បីធ្វើឲ្យឧទាហរណ៍កូដទាំងអស់ប្រើតាមវង់ត្រឹមត្រូវនៃ Azure Developer CLI។**

#### បានដោះស្រាយ
- **🔧 លុបពាក្យបញ្ជា AZD មិនមាន**: ស្ទង់មុខនិងកែប្រែពាក្យបញ្ជាមិនត្រឹមត្រូវឲ្យត្រឹមត្រូវសូមបញ្ជាក់:
  - `azd logs` (មិនមានទេ) → ជំនួសជាមួយ `azd monitor --logs` ឬជម្រើស Azure CLI
  - ពាក្យបញ្ជា `azd service` ខ្ជប់ (មិនមាន) → ជំនួស `azd show` និង Azure CLI
  - `azd infra import/export/validate` (មិនមាន) → លុប ឬជំនួសជាមួយជម្រើសត្រឹមត្រូវ
  - ថង់ `azd deploy --rollback/--incremental/--parallel/--detect-changes` (មិនមាន) → លុប
  - ថង់ `azd provision --what-if/--rollback` (មិនមាន) → បន្ថែមប្រើ `--preview`
  - `azd config validate` (មិនមាន) → ជំនួសជាមួយ `azd config list`
  - `azd info`, `azd history`, `azd metrics` (មិនមាន) → លុបចោល

- **📚 ការកែប្រែឯកសារជាមួយពាក្យបញ្ជា**:
  - `resources/cheat-sheet.md`: កែប្រែយ៉ាងធំហើយដោយយោងអំពីពាក្យបញ្ជា
  - `docs/deployment/deployment-guide.md`: កែរប្រែវិធីសាស្រ្ត rollback និង deploy
  - `docs/troubleshooting/debugging.md`: កែរប្រែកា​រវិភាគកំណត់ហេតុ
  - `docs/troubleshooting/common-issues.md`: បច្ចុប្បន្នភាពពាក្យបញ្ជាដោះស្រាយបញ្ហា
  - `docs/troubleshooting/ai-troubleshooting.md`: កែរប្រែកំណត់ហេតុ AZD
  - `docs/getting-started/azd-basics.md`: កែរប្រែពាក្យបញ្ជាអធ្យាស្រ័យ
  - `docs/getting-started/first-project.md`: បច្ចុប្បន្នភាពឧទាហរណ៍អធ្យាស្រ័យ និងកំណត់ហេតុ
  - `docs/getting-started/installation.md`: កែរប្រែជំនួយ និងឧទាហរណ៍កំណែ
  - `docs/pre-deployment/application-insights.md`: កែរប្រែពាក្យបញ្ជារមើលកំណត់ហេតុ
  - `docs/pre-deployment/coordination-patterns.md`: កែរប្រែជំនួយកំណត់ហេតុ

- **📝 កំណត់ឯកសារកំណែវើសិន**:
  - `docs/getting-started/installation.md`: ផ្លាស់ប្តូរពាក្យបញ្ជា hardcoded `1.5.0` ទៅជារូបមន្តទូទៅ `1.x.x` មានតំណទៅកាន់ការចេញផ្សាយ

#### ការផ្លាស់ប្តូរ
- **យុទ្ធសាស្ត្រ Rollback**: អាប់ដេតឯកសារឲ្យប្រើ rollback ជាមួយ Git (AZD មិនមាន rollback ដើម)
- **ការមើលកំណត់ហេតុ**: ជំនួស `azd logs` ជាមួយ `azd monitor --logs`, `azd monitor --live` និងពាក្យបញ្ជា Azure CLI
- **ផ្នែកដំណើរការ**: លុបថង់ deploy ជាប្រភេទ parallel/incremental ដោយប្រើជម្រើសត្រឹមត្រូវ

#### ព័ត៌មានបច្ចេកទេស
- **ពាក្យបញ្ជា AZD ត្រឹមត្រូវ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **ថង់ azd monitor ត្រឹមត្រូវ**: `--live`, `--logs`, `--overview`
- **លុបចោលលក្ខណៈពិសេស**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### កំណត់ចំណាំ
- **ការ​ផ្ទៀង​ផ្ទាត់**: ពាក្យបញ្ជាត្រូវបានផ្ទៀងផ្ទាត់ជាមួយ Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### ការសម្រេចការងារហ្វឹកហ្វឺន និងការកែលម្អគុណភាពឯកសារ
**កំណែនេះបញ្ចប់មេODULE ការហ្វឹកហ្វឺនប្រតិបត្តិការចំនួនពេញលេញ ជួសជុលតំណភ្ជាប់ឯកសារដែលខូចទាំងអស់ និងបង្កើនគុណភាពមាតិកាសម្រាប់អ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD។**

#### បានបន្ថែម
- **📝 CONTRIBUTING.md**: ឯកសារប្រកាសកាលបរិច្ឆេទការរួមចំណែកថ្មីជាមួយ:
  - សេចក្តីណែនាំច្បាស់លាស់សម្រាប់រាយការណ៍បញ្ហា និងដាក់សំណើការផ្លាស់ប្តូរ
  - ស្តង់ដារឯកសារសម្រាប់មាតិកាថ្មី
  - មគ្គុទ្ទេសក៍ឧទាហរណ៍កូដ និងក្បាលសារជួសជុលកូដ
  - ព័ត៌មានអំពីការចូលរួមសហគមន៍

#### បានបញ្ចប់
- **🎯 មេODULE ហ្វឹកហ្វឺន 7 (សេចក្តីសង្ខេប)**: បញ្ចប់សម្រាប់មេODULE wrap-up ជាមួយ:
  - សង្ខេបជ្រាលជ្រៅអំពីសមិទ្ធផលហ្វឹកហ្វឺន
  - ផ្នែកគំនិតសំខាន់ៗគ្រប់គ្រង AZD, គំរូ និង Microsoft Foundry
  - ការផ្តល់អនុសាសន៍សម្រាប់ដំណើរការរៀនបន្ត
  - ហាត់ប្រាណបញ្ហាការប្រកួតជាមួយការវាយតម្លៃកម្រិតកម្លាំងសមត្ថភាព
  - ទំនាក់ទំនងមតិយោបល់សហគមន៍ និងតំណភ្ជាប់ជំនួយ

- **📚 មេODULE ហ្វឹកហ្វឺន 3 (បំបែក)**: ធ្វើបច្ចុប្បន្នភាពគោលបំណងការសិក្សាជាមួយ:
  - ការដំណើរការ GitHub Copilot ជាមួយម៉ាស៊ីនមេ MCP
  - យល់ដឹងពីរចនាសម្ព័ន្ធថត AZD template
  - គំរូរចនាបថ Infrastructure-as-code (Bicep)
  - សេចក្តីណែនាំក្នុងមន្ទីរពិសោធន៍

- **🔧 មេODULE ហ្វឹកហ្វឺន 6 (ដោះសោជាមួយ)**: បញ្ចប់ជាមួយ:
  - គោលដៅសម្អាតធនធាន និងគ្រប់គ្រងថ្លៃកម្រៃ
  - ការប្រើ `azd down` សម្រាប់ដោះសោដំណើរការមូលដ្ឋានទន់ភ្លន់
  - ផ្លូវដោះសោវិធីសាស្រ្តសេវាកម្ម cognitive services ទន់ភ្លន់
  - ការស្វែងយល់បន្ថែមសម្រាប់ GitHub Copilot និង Azure Portal

#### បានដោះស្រាយ
- **🔗 ជួសជុលតំណខូច**: ដោះស្រាយតំណឯកសារខូចច្រើនជាង ១៥ ដូចជា:
  - `docs/ai-foundry/ai-model-deployment.md`: ជួសជុលផ្លូវទៅ microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: កែផ្លូវ ai-model-deployment.md និង production-ai-practices.md
  - `docs/getting-started/first-project.md`: ជំនួស cicd-integration.md មិនមានជាមួយ deployment-guide.md
  - `examples/retail-scenario.md`: ជួសជុលផ្លូវ FAQ និងដំណើរការដោះស្រាយបញ្ហា
  - `examples/container-app/microservices/README.md`: បញ្ចប់ផ្លូវម៉ាស្សារតំបន់ និង deployment guide
  - `resources/faq.md` និង `resources/glossary.md`: បច្ចុប្បន្នភាពយោងជំពូក AI
  - `course-outline.md`: ជួសជុលមគ្គុទ្ទេសក៍គ្រូបង្រៀន និងយោងពិសោធន៍ AI

- **📅 ស្លាកស្ថានភាពហ្វឹកហ្វឺន**: បច្ចុប្បន្នភាពពី "កំពុងសាងសង់" ទៅស្ថានភាពហ្វឹកហ្វឺនសកម្មមានកាលបរិច្ឆេទ កុម្ភៈ ២០២៦

- **🔗 នាវីហ្គេសិនហ្វឹកហ្វឺន**: ជួសជុលតំណគ្មានខួបនៅក្នុង README.md ហ្វឹកហ្វឺន យោងទៅថត lab-1-azd-basics ដែលមិនមាន

#### ការផ្លាស់ប្តូរ
- **ការបង្ហាញហ្វឹកហ្វឺន**: លុបសេចក្តីរំលឹក "កំពុងសាងសង់" ហ្វឹកហ្វឺនបានបញ្ចប់ហើយរួចរាល់សម្រាប់ប្រើប្រាស់
- **ភាពស្របគ្នានាវីហ្គេសិន**: ធានាថាមេODULE ហ្វឹកហ្វឺនទាំងអស់មាននាវីហ្គេសិនត្រឹមត្រូវចំពោះគ្នា
- **ការយោងផ្លូវរៀន**: បច្ចុប្បន្នភាពយោងជំពូកទៅ microsoft-foundry paths ដែលត្រឹមត្រូវ

#### បានផ្ទៀងផ្ទាត់
- ✅ ឯកសារដែលជាភាសាអង់គ្លេសទាំងអស់មានតំណខាងក្នុងត្រឹមត្រូវ
- ✅ មេODULE ហ្វឹកហ្វឺន 0-7 បានបញ្ចប់ជាមួយគោលបំណងសិក្សា
- ✅ នាវីហ្គេសិនរវាងជំពូក និងមេODULE ប្រតិបត្តិការត្រឹមត្រូវ
- ✅ មាតិកាដើម្បីអ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD
- ✅ ភាសាដែលសមរម្យសម្រាប់អ្នកចាប់ផ្តើម និងរចនាសម្ព័ន្ធបានរក្សាទុក
- ✅ CONTRIBUTING.md ផ្តល់ការណែនាំច្បាស់លាស់សម្រាប់អ្នកចូលរួមសហគមន៍

#### អនុវត្តបច្ចេកទេស
- **ផ្ទៀងផ្ទាត់តំណ**: ស្គ្រីប PowerShell ដំណើរការអូតូម៉ាទិកបានផ្ទៀងផ្ទាត់តំណខាងក្នុង .md ទាំងអស់
- **ត្រួតពិនិត្យមាតិការ**: ពិនិត្យជាមានដៃពីភាពទាំងស្រុងនៃមេODULE ហ្វឹកហ្វឺន និងសមរម្យសម្រាប់អ្នកចាប់ផ្តើម
- **ប្រព័ន្ធនាវីហ្គេសិន**: ការប្រើប្រាស់គំរូនាវីហ្គេសិនជាមួយជំពូក និងមេODULE

#### កំណត់ចំណាំ
- **លំហ**: ប្តូរត្រឹមតែឯកសារភាសាអង់គ្លេសតែប៉ុណ្ណោះ
- **ការប្រែសម្រួលភាសា**: ថតប្រែភាសាមិនបានបន្ថែមក្នុងកំណែនេះ (ការប្រែសម្រួលស្វ័យប្រវត្តិ​នឹងត្រូវសមកាលបច្ចុប្បន្ននៅពេលក្រោយ)
- **រយៈពេលហ្វឹកហ្វឺន**: ហ្វឹកហ្វឺនបានបញ្ចប់ឥឡូវនេះផ្តល់ 3-4 ម៉ោងរយៈពេលរៀនជាផ្ទាល់

---

### [v3.8.0] - 2025-11-19

#### ឯកសារពីរវាងជាន់ខ្ពស់: ការត្រួតពិនិត្យ, សុវត្ថិភាព និងគំរូ Multi-Agent
**កំណែនេះបន្ថែមមេរៀនថ្នាក់ A ទូលំទូលាយអំពីការអន្តេវេសន៍ Application Insights, គំរូសុវត្ថិភាព ការសហការជាមួយភ្នាក់ងារច្រើនសម្រាប់ការដាក់បញ្ចូលផលិតកម្ម។**

#### បានបន្ថែម
- **📊 មេរៀន Application Insights Integration**: នៅ `docs/pre-deployment/application-insights.md`:
  - ការដាក់បញ្ចូលផ្តោតលើ AZD ជាមួយការផ្ដល់ធនធានស្វ័យប្រវត្តិ
  - គំរូ Bicep ពេញលេញសម្រាប់ Application Insights និង Log Analytics
  - កម្មវិធី Python ប្រតិបត្តិការ ជាមួយទិន្នន័យ Monitoring ផ្ទាល់ខ្លួន (ជួរបន្ទាត់ ១២០០+)
  - គំរូមើលតាម AI/LLM (Microsoft Foundry Models តាម dtoken និងថ្លៃ)
  - គំនូរជង/ទំព័រ Mermaid ៦ រូប (សំណង់, តាមអត្រា, បញ្ចូលទិន្នន័យ)
  - ថ្មីដៃការជំនួសបញ្ហា ៣ (ការជូនដំណឹង, តារាងគំរូ, ការត្រួតពិនិត្យ AI)
  - ឧទាហរណ៍ស្ទង់Kusto និងយុទ្ធសាស្ត្រកែលម្អថ្លៃ
  - ស្ទ្រីមផ្ទាល់ metrics និងត្រួតពិនិត្យកំហុសពេលវេលាពេញលេញ
  - រយៈពេលរៀន ៤០-៥០ នាទីជាមួយគំរូរៀបចំរួច

- **🔐 មេរៀនសុវត្ថិភាព និង Authentication**: នៅ `docs/getting-started/authsecurity.md`:
  - គំរូសម្គាល់អត្តសញ្ញាណ ៣ រូប (connection strings, Key Vault, managed identity)
  - គំរូឯកសារសង្គ្រោះរចនាសម្ព័ន្ធ Bicep សម្រាប់ការដាក់បញ្ចូលសុវត្ថិភាព
  - កូដកម្មវិធី Node.js ជាមួយ Azure SDK
  - ហាត់ប្រាណពេញលេញ ៣ (បើក managed identity, user-assigned identity, Key Vault ការផ្លាស់ប្ដូរ)
  - សម្រួលល្អបំផុត និង ការគ្រប់គ្រង RBAC
  - មគ្គុទ្ទេសក៍ដោះស្រាយបញ្ហា និងការវិភាគថ្លៃ
  - គំរូសម្គាល់អត្តសញ្ញាណគ្មានពាក្យសម្ងាត់ ទាន់សម័យសម្រាប់ផលិតកម្ម

- **🤖 មេរៀនគំរូសហការភ្នាក់ងារច្រើន**: នៅ `docs/pre-deployment/coordination-patterns.md`:
  - គំរូសហការចំនួន ៥ (លំដាប់, សមាបាត, រចនាសម្ព័ន្ធ, ព្រឹត្តិការណ៍​ធ្វើចលនា, ឯកភាព)
  - ការអនុវត្តសេវាអគ្គិសនីទាំងមូល (Python/Flask, ១៥០០ ជួរបន្ទាត់)
  - អនុវត្តភ្នាក់ងារពិសេស ៣ (ស្រាវជ្រាវ, អ្នកសរសេរ, អ្នកកែសម្រួល)
  - ការរួមបញ្ចូល Service Bus សម្រាប់សាររង់ចាំ
  - ការគ្រប់គ្រងស្ថានភាព Cosmos DB សម្រាប់ប្រព័ន្ធចែកចាយ
  - ៦ គំនូរជង Mermaid បង្ហាញពីអន្តរកម្មភ្នាក់ងារ
  - ហាត់ប្រាណកម្រិតខ្ពស់ ៣ (គ្រប់គ្រងពេលវេលា, វិធីសាស្រ្ត retry, ការបិទសាជាថ្នាក់)
  - ការវាយតម្លៃថ្លៃ ($240-565/ខែ) ជាមួយយុទ្ធសាស្ត្រកែលម្អ
  - ការបញ្ចូល Application Insights សម្រាប់ត្រួតពិនិត្យ

#### បានពង្រឹង
- **ជំពូក់ មុនដាក់បញ្ចូល**: ពេញលេញជាមួយមេរៀន និងគំរូសហការ
- **ជំពូក់ Getting Started**: ពង្រឹងជាមួយគំរូសម្រេចសុវត្ថិភាពវិជ្ជាជីវៈ
- **ភាពរួចរាល់ផលិតកម្ម**: គ្រប់គ្រងទាំងសុវត្ថិភាព និងអាចត្រួតពិនិត្យបានពេញលេញ
- **ផែនការសិក្សា**: បច្ចុប្បន្នភាពយោងទៅមេរៀនថ្មីនៅជំពូក ៣ និង ៦

#### ការផ្លាស់ប្តូរ
- **ដំណើរការរៀន**: ប្រសិនបើកែលម្អការស្នើសុំនៃសុវត្ថិភាព និងការត្រួតពិនិត្យជាចំនួន
- **គុណភាពឯកសារ**: ស្ដង់ដារ A លំដាប់ត្រឹមត្រូវ ៩៥-៩៧% ក្នុងមេរៀនថ្មី
- **គំរូផលិតកម្ម**: គ្រប់គ្រងពេញលេញចាប់ពីដំណាក់កាលដល់ផលិតកម្ម

#### បានបង្កើន
- **បទពិសោធន៍អភិវឌ្ឍន៍**: ផ្លូវច្បាស់ចន្លោះអភិវឌ្ឍន៍ទៅកាន់ត្រួតពិនិត្យផលិតកម្ម
- **ស្ដង់ដារសុវត្ថិភាព**: គំរូវិជ្ជាជីវៈសម្រាប់សម្គាល់អត្តសញ្ញាណ និងគ្រប់គ្រងសម្ងាត់
- **ការត្រួតពិនិត្យ**: បញ្ចូល Application Insights ទាំងស្រុងជាមួយ AZD
- **បន្ទុក AI**: រចនាសម្ព័ន្ធត្រួតពិនិត្យពិសេសសម្រាប់ Microsoft Foundry Models និងប្រព័ន្ធភ្នាក់ងារច្រើន

#### បានផ្ទៀងផ្ទាត់
- ✅ មេរៀនទាំងអស់មានកូដធ្វើការពេញលេញ (មិនមែនជាលំនិតតែឧទាហរណ៍)
- ✅ គំនូរជង Mermaid សម្រាប់ការសិក្សាមានរូបភាព (១៩ រូបក្នុង ៣ មេរៀន)
- ✅ ហាត់កាយដោយដៃ ជាមួយជំហានផ្ទៀងផ្ទាត់ (៩ ទ្រង់ទ្រាយ)
- ✅ គំរូ Bicep ទាំងពេញលេញអាចដាក់តាម `azd up`
- ✅ ការវិភាគថ្លៃ និងយុទ្ធសាស្ត្រកែលម្អ
- ✅ មគ្គុទ្ទេសក៍ដោះស្រាយបញ្ហា និងការអនុវត្តល្អបំផុត
- ✅ ចំណុចបញ្ជាក់ចំណេះដឹងជាមួយពាក្យបញ្ជាផ្ទៀងផ្ទាត់

#### លទ្ធផលវាយតម្លៃឯកសារ
- **docs/pre-deployment/application-insights.md**: - មគ្គុទ្ទេសក៍ត្រួតពិនិត្យពេញលេញ
- **docs/getting-started/authsecurity.md**: - គំរូសុវត្ថិភាពវិជ្ជាជីវៈ
- **docs/pre-deployment/coordination-patterns.md**: - រចនាសម្ព័ន្ធ multi-agent ជាន់ខ្ពស់
- **មាតិកាថ្មីសរុប**: - ស្តង់ដារគុណភាពខ្ពស់ជាបន្តបន្ទាប់

#### អនុវត្តបច្ចេកទេស
- **Application Insights**: Log Analytics + telemetry ផ្ទាល់ខ្លួន + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ការរៀបចំ
- **ត្រួតពិនិត្យ**: ទិន្នន័យផ្ទាល់ + ស្ទង់Kusto + ការជូនដំណឹង + តារាងបង្ហាញ
- **គ្រប់គ្រងថ្លៃ**: គោលការណ៍ sampling, តំណោល, និងការគ្រប់គ្រងថវិកា

### [v3.7.0] - 2025-11-19

#### ការកែលម្អគុណភាពឯកសារ និងឧទាហរណ៍ Microsoft Foundry Models ថ្មី
**កំណែនេះបានបង្កើនគុណភាពឯកសារពេញទុកក្នុង repo និងបន្ថែមឧទាហរណ៍របៀបដាក់ Microsoft Foundry Models ពេញលេញជាមួយនឹងចំណុចចរចាជាមួយ gpt-4.1 chat interface។**

#### បានបន្ថែម
- **🤖 ឧទាហរណ៍ Microsoft Foundry Models Chat**: ដំណើរការជាមួយ gpt-4.1 ក្នុង `examples/azure-openai-chat/`:
  - រចនាសម្ព័ន្ធ Microsoft Foundry Models ពេញលេញ (ដាក់ gpt-4.1)
  - ច្រកកំណត់បញ្ជាពីចំណុច Python command-line chat
  - រួមបញ្ចូល Key Vault សម្រាប់ផ្ទុក API key សុវត្ថិភាព
  - តាម dtoken និងការវាយតម្លៃថ្លៃ
  - ការគ្រប់គ្រងលឿន និងដោះស្រាយកំហុស
  - README សង្ខេបមានមេរៀនដាក់បញ្ចូល ៣៥-៤៥ នាទី
  - ឯកសារពេញលេញ ១១ ទំព័រ (ក្រ្វមវើក Bicep, កម្មវិធី Python, រចនាសម្ព័ន្ធ)
- **📚 លំហាត់ឯកសារ**: បន្ថែមហាត់ដៃប្រើប្រាស់ទៅមេរៀនរចនាសម្ព័ន្ធ:
  - លំហាត់ ១: រចនាសម្ព័ន្ធបរិយាកាសច្រើន (១៥ នាទី)
  - លំហាត់ ២: ហាត់គ្រប់គ្រងសម្ងាត់ (១០ នាទី)
  - លក្ខខណ្ឌជោគជ័យច្បាស់លាស់ និងជំហានផ្ទៀងផ្ទាត់
- **✅ ផ្នែកផ្ទៀងផ្ទាត់ការដាក់បញ្ចូល**: បន្ថែមផ្នែកផ្ទៀងផ្ទាត់ទៅមេរៀនដាក់បញ្ចូល:
  - សំណុំបែបបទពិនិត្យសុខភាព
  - បញ្ជីលក្ខខណ្ឌជោគជ័យ
  - លទ្ធផលដែលរំពឹងទុកសម្រាប់ពាក្យបញ្ជាដាក់បញ្ចូលទាំងអស់
  - ការណែនាំបញ្ហាហ្វាស់លឿន

#### បានពង្រឹង
- **examples/README.md**: បន្ថែមឲ្យមានគុណភាព A (៩៣%):
  - បន្ថែម azure-openai-chat ទៅផ្នែកទាំងអស់ដែលពាក់ព័ន្ធ
  - ប្រែប្រាស់គំរូក្នុងតំបន់ផ្ទាល់ពី ៣ ទៅ ៤
  - បន្ថែមទៅតារាងឧទាហរណ៍ AI Application
  - បញ្ចូលទៅក្នុង Quick Start សម្រាប់អ្នកប្រើប្រាស់ចន្លោះ
  - បន្ថែមទៅផ្នែក Microsoft Foundry Templates
  - បច្ចុប្បន្នភាពតារាងប្រៀបធៀប និងផ្នែកស្វែងរកបច្ចេកវិទ្យា
- **គុណភាពឯកសារ**: បង្កើនពី B+ (៨៧%) → A- (៩២%) ក្នុងថត docs

  - បន្ថែមលទ្ធផលដែលរំពឹងទុកទៅឧទាហរណ៍ពាក្យបញ្ជាដ៏សំខាន់
  - រាប់បញ្ចូលជំហានផ្ទៀងផ្ទាត់សម្រាប់ការផ្លាស់ប្តូរការកំណត់រចនា
  - បង្កើនការសិក្សាដោយដៃជាមួយលំហាត់ដំណើរការពិតប្រាកដ

#### បានផ្លាស់ប្តូរ
- **ជំហានរៀន**: ដំណាក់កាលAIល្អប្រសើរជាងមុនសម្រាប់អ្នករៀនចំណុចមធ្យម
- **រចនាសម្ព័ន្ធឯកសារ**: លំហាត់អនុវត្តដែលអាចអនុវត្តបានជាច្រើនជាមួយលទ្ធផលច្បាស់លាស់
- **ដំណើរការផ្ទៀងផ្ទាត់**: ការបន្ថែមលក្ខខណ្ឌជោគជ័យច្បាស់ក្នុងការងារសំខាន់ៗ

#### បានរីកចម្រើន
- **បទពិសោធអ្នកអwickovoltaត**: ការតម្លើង Microsoft Foundry Models ឥឡូវនេះចំណាយរយៈពេល 35-45 នាទី​ (ប្រៀបធៀបនឹង 60-90 នាទីសម្រាប់ជម្រើសស្មុគស្មាញ)
- **ភាពច្បាស់លាស់ក្នុងថ្លៃដើម**: ប៉ាហ្សែលថ្លៃដើមច្បាស់លាស់ ($50-200/ខែ) សម្រាប់ឧទាហរណ៍ Microsoft Foundry Models
- **ផ្លូវរៀន**: អ្នកអwickovolta AI មានចំណុចចូលច្បាស់ជាមួយ azure-openai-chat
- **ស្តង់ដារឯកសារ**: លទ្ធផលដែលរំពឹងទុកនិងជំហានផ្ទៀងផ្ទាត់មានភាពស្របគ្នា

#### បានបញ្ជាក់
- ✅ ឧទាហរណ៍ Microsoft Foundry Models ប្រើការបានពេញលេញជាមួយ `azd up`
- ✅ ឯកសារអនុវត្ត 11 ឯកសារទាំងអស់ត្រឹមត្រូវពីរករណីស៊ុមភាសា
- ✅ សេចក្តីណែនាំ README ស្របទៅនឹងបទពិសោធន៍ចាក់តំឡើងពិត
- ✅ តំណភ្ជាប់ឯកសារត្រូវបានធ្វើបច្ចុប្បន្នភាពជាច្រើនកន្លែងជាង 8
- ✅ ឧទាហរណ៍បញ្ជីបង្ហាញយ៉ាងត្រឹមត្រូវ 4 ឧទាហរណ៍ក្នុងតំបន់
- ✅ គ្មានតំណភ្ជាប់ខណៈក្រៅបន្ទាប់បន្សំក្នុងតារាងទេ
- ✅ សេចក្តីយោងរុំទាំងអស់ត្រឹមត្រូវ

#### ការអនុវត្តបច្ចេកទេស
- **រចនាសម្ព័ន្ធ Microsoft Foundry Models**: gpt-4.1 + Key Vault + គំរូ Container Apps
- **សុវត្ថិភាព**: ប្រើ Managed Identity និងសម្ងាត់ក្នុង Key Vault
- **ការត្រួតពិនិត្យ**: លំនឹង Application Insights
- **ការគ្រប់គ្រងថ្លៃដើម**: តាមដាននិងបង្កើនប្រសិទ្ធភាពការប្រើប្រាស់ Token
- **ការចាក់តំឡើង**: ពាក្យបញ្ជា `azd up` តែមួយសម្រាប់ការកំណត់រចនាសម្ព័ន្ធពេញលេញ

### [v3.6.0] - 2025-11-19

#### បទបង្ហាញសំខាន់ៈ ឧទាហរណ៍ការចាក់តំឡើងកម្មវិធី Container App
**កំណែនេះណែនាំឧទាហរណ៍ការចាក់តំឡើងកម្មវិធី container ដែលមានសមត្ថភាពក្នុងផលិតកម្មដោយប្រើ Azure Developer CLI (AZD) រួមមានឯកសារប្រកួតប្រជែង និងការតភ្ជាប់ទៅផ្លូវរៀន។**

#### បានបន្ថែម
- **🚀 ឧទាហរណ៍ Container App**: ឧទាហរណ៍ក្នុងតំបន់ថ្មីក្នុង `examples/container-app/`:
  - [មគ្គុទ្ទេសក៍សំខាន់](examples/container-app/README.md): ទិដ្ឋភាពទូលំទូលាយនៃការចាក់តំឡើង container,ចាប់ផ្តើមរហ័ស, ផលិតកម្ម និងគំរូកម្រិតខ្ពស់
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST សមរម្យសម្រាប់អ្នកចាប់ផ្តើម មានសមត្ថភាព scale-to-zero, ជម្រះសុខភាព, ត្រួតពិនិត្យ និងដោះស្រាយរាស្ត្រ
  - [រចនាសម្ព័ន្ធ Microservices](../../examples/container-app/microservices): ការចាក់តំឡើងពហុសេវាកម្មផលិតកម្ម (API Gateway, ផលិតផល, ការបញ្ជាទិញ, អ្នកប្រើ, ការជូនដំណឹង), ភាពអSymfony សារ, Service Bus, Cosmos DB, Azure SQL, distributed tracing, ការចាក់តំឡើងបែប blue-green/canary
- **អនុវត្តការវិជ្ជាជីវៈល្អ**: សុវត្ថិភាព, ត្រួតពិនិត្យ, ការបង្កើនប្រសិទ្ធភាពថ្លៃដើម និងការណែនាំ CI/CD សម្រាប់ការងារបច្ចេកវិទ្យា container
- **ឧទាហរណ៍កូដ**: `azure.yaml`, គំរូ Bicep ពេញលេញ និងអនុវត្តសេវាកម្មភាសាច្រើន (Python, Node.js, C#, Go)
- **សាកល្បង & ដោះស្រាយបញ្ហា**: សេណារីយ៉ូសាកល្បងពីដើមដល់ចប់, ពាក្យបញ្ជាត្រួតពិនិត្យ និងការណែនាំដោះស្រាយបញ្ហា

#### បានផ្លាស់ប្តូរ
- **README.md**: ធ្វើបច្ចុប្បន្នភាពដើម្បីបង្ហាញនិងភ្ជាប់ឧទាហរណ៍ container app ថ្មីក្រោម "ឧទាហរណ៍ក្នុងតំបន់ - កម្មវិធី container"
- **examples/README.md**: ធ្វើបច្ចុប្បន្នភាពដើម្បីបញ្ជាក់ឧទាហរណ៍ container app, បន្ថែមចំណាត់ថ្នាក់ផ្ទៀងផ្ទាត់ និងធ្វើបច្ចុប្បន្នភាពយោងបច្ចេកវិទ្យា/រចនាសម្ព័ន្ធ
- **សេចក្តីព្រាងវគ្គសិក្សា & មគ្គុទេសក៍សិក្សា**: ធ្វើបច្ចុប្បន្នភាពដើម្បីយោងឧទាហរណ៍ container app ថ្មី និងគំរូការចាក់តំឡើងក្នុងជំពូកពាក់ព័ន្ធ

#### បានបញ្ជាក់
- ✅ ឧទាហរណ៍ទាំងអស់ថ្មីអាចចាក់តំឡើងបានជាមួយ `azd up` និងតាមផ្សព្វផ្សាយល្អ
- ✅ តំណភ្ជាប់ឯកសារនិងចរន្តនិទស្សន៍បានធ្វើបច្ចុប្បន្នភាព
- ✅ ឧទាហរណ៍គ្រប់គ្រាន់ចាប់ពីអ្នកចាប់ផ្តើមរហូតដល់កម្រិតខ្ពស់ រួមមានមីក្រូសេវាកម្មផលិតកម្ម

#### ការពិភាក្សា
- **វិសាលភាព**: ឯកសារ និងឧទាហរណ៍ជាភាសាអង់គ្លេសតែប៉ុណ្ណោះ
- **ជំហានបន្ទាប់**: ចងក្រងបន្ថែមនូវគំរូ container ជាន់ខ្ពស់ និង CI/CD ស្វ័យប្រវត្តិ នៅក្នុងកំណែខាងមុខ

### [v3.5.0] - 2025-11-19

#### ការផ្លាស់ប្តូរឈ្មោះផលិតផល: Microsoft Foundry
**កំណែនេះអនុវត្តការផ្លាស់ប្តូរឈ្មោះផលិតផលយ៉ាងទូលំទូលាយពី "Microsoft Foundry" ទៅ "Microsoft Foundry" ក្នុងឯកសារជាភាសាអង់គ្លេសទាំងអស់ ខណៈដែលបង្ហាញពីការផ្លាស់ប្តូរដោយផ្លូវការរបស់ Microsoft។**

#### បានផ្លាស់ប្តូរ
- **🔄 ការអាប់ដេតឈ្មោះផលិតផល**: ប្ដូរឈ្មោះទាំងមូលពី "Microsoft Foundry" ទៅ "Microsoft Foundry"
  - អាប់ដេតយោងទាំងអស់ក្នុងឯកសារជាភាសាអង់គ្លេសក្នុងថត `docs/`
  - ផ្លាស់ប្តូរឈ្មោះថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ផ្លាស់ប្តូរឈ្មោះឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - ចំនួនសរុប: 23 ឯកសារយោងផ្លាស់ប្តូរនៅក្នុងឯកសារទាំង 7

- **📁 ការផ្លាស់ប្តូររចនាសម្ព័ន្ធថត**:
  - `docs/ai-foundry/` ឈ្មោះបានប្ដូរទៅជា `docs/microsoft-foundry/`
  - យោងទាំងអស់ត្រូវបានអាប់ដេតដើម្បីផ្ទៀងផ្ទាត់រចនាសម្ព័ន្ធថតថ្មី
  - តំណការរុករកត្រូវបានផ្ទៀងផ្ទាត់នៅក្នុងឯកសារទាំងអស់

- **📄 ការផ្លាស់ប្ដូរឈ្មោះឯកសារ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - យោងខាងក្នុងទាំងអស់ត្រូវបានអាប់ដេតឲ្យយោងឈ្មោះឯកសារថ្មី

#### ឯកសារអាប់ដេត
- **ឯកសារជំពូក** (7 ឯកសារ):
  - `docs/microsoft-foundry/ai-model-deployment.md` - អាប់ដេត 3 តំណចរន្តនិទស្សន៍
  - `docs/microsoft-foundry/ai-workshop-lab.md` - អាប់ដេត 4 យោងទៅឈ្មោះផលិតផល
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - រួចហើយប្រើ Microsoft Foundry (ពីការអាប់ដេតមុន)
  - `docs/microsoft-foundry/production-ai-practices.md` - អាប់ដេត 3 យោង (ទិដ្ឋភាពទូលំទូលាយ, មតិយោបល់សហគមន៍, ឯកសារ)
  - `docs/getting-started/azd-basics.md` - អាប់ដេត 4 តំណចរន្តនិទស្សន៍
  - `docs/getting-started/first-project.md` - អាប់ដេត 2 តំណចរន្តជំពូក
  - `docs/getting-started/installation.md` - អាប់ដេត 2 តំណជំពូកបន្ទាប់
  - `docs/troubleshooting/ai-troubleshooting.md` - អាប់ដេត 3 យោង (ចរន្តនិទស្សន៍, សហគមន៍ Discord)
  - `docs/troubleshooting/common-issues.md` - អាប់ដេត 1 តំណចរន្ត
  - `docs/troubleshooting/debugging.md` - អាប់ដេត 1 តំណចរន្ត

- **ឯកសាររចនាសម្ព័ន្ធវគ្គសិក្សា** (2 ឯកសារ):
  - `README.md` - អាប់ដេត 17 យោង (ទិដ្ឋភាពវគ្គសិក្សា, ចំណងជើងជំពូក, ផ្នែកគំរូ, ចំណេះដឹងសហគមន៍)
  - `course-outline.md` - អាប់ដេត 14 យោង (ទិដ្ឋភាពទូទៅ, គោលដៅរៀន, ឯកសារជាមួយជំពូក)

#### បានបញ្ជាក់
- ✅ គ្មានសេវាកម្មផ្លូវថត "ai-foundry" នៅក្នុងឯកសារជាភាសាអង់គ្លេសទេ
- ✅ គ្មានយោងឈ្មោះផលិតផល "Microsoft Foundry" នៅក្នុងឯកសារជាភាសាអង់គ្លេសទេ
- ✅ តំណចរន្តទាំងអស់ដំណើរការដូចគ្នាជាមួយរចនាសម្ព័ន្ធថតថ្មី
- ✅ ការផ្លាស់ប្តូរឈ្មោះឯកសារ និងថតបានបញ្ចប់ដោយជោគជ័យ
- ✅ តំណចរន្តឯកសាររវាងជំពូកបានធ្វើបច្ចុប្បន្នភាព

#### ការពិភាក្សា
- **វិសាលភាព**: ការផ្លាស់ប្តូរលើឯកសារជាភាសាអង់គ្លេសនៅក្នុងថត `docs/` តែប៉ុណ្ណោះ
- **ការប្រែសម្រួល**: ថតប្រែសម្រួល (`translations/`) មិនបានអាប់ដេតនាពេលនេះ
- **ការ​រៀបចំ​សិក្ខាសាលា**: សម្ភារៈសិក្ខាសាលា (`workshop/`) មិនបានបញ្ចូលការផ្លាស់ប្តូរនេះ
- **ឧទាហរណ៍**: ឯកសារឧទាហរណ៍អាចនៅមានយោងឈ្មោះចាស់ (នឹងដោះស្រายในកំណែខាងមុខ)
- **តំណភ្ជាប់ខាងក្រៅ**: តំណURLក្រៅ និងការយោងទៅ GitHub មិនបានផ្លាស់ប្តូរ

#### មគ្គុទេសក៍អភិវឌ្ឍនសម្រាប់អ្នកចូលរួម
ប្រសិនបើអ្នកមានសាខាតំបន់ឬឯកសារយោងទៅរចនាសម្ព័ន្ធចាស់:
1. អាប់ដេតយោងថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. អាប់ដេតឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ផ្លាស់ប្តូរឈ្មោះផលិតផល: "Microsoft Foundry" → "Microsoft Foundry"
4. ផ្ទៀងផ្ទាត់តំណឯកសារផ្ទៃក្នុងទាំងអស់នៅតែដំណើរការ

---

### [v3.4.0] - 2025-10-24

#### ការពិនិត្យមើលហើយបង្កើននូវការចាក់តំឡើងបរិក្ខារជាសាធារណៈ
**កំណែនេះណែនាំការគាំទ្រពេញលេញសម្រាប់មុខងារ Azure Developer CLI ថ្មីនិងបង្កើនបទពិសោធអ្នកប្រើក្នុងសិក្ខាសាលា។**

#### បានបន្ថែម
- **🧪 លិខិតសម្គាល់មុខងារ azd provision --preview**: ការលាយបញ្ចូលលម្អិតក្នុងមុខងារ infrastructure preview ថ្មី
  - សេចក្តីយោងពាក្យបញ្ជា និងឧទាហរណ៍ប្រើប្រាស់ក្នុង cheat sheet
  - បញ្ជាក់លម្អិតធានានៅក្នុងមគ្គុទេសក៍ provisioning ជាមួយករណីប្រើនិងអត្ថប្រយោជន៍
  - លាយបញ្ចូល pre-flight check សម្រាប់ការផ្ទៀងផ្ទាត់ការចាក់តំឡើងជាមួយសុវត្ថិភាព
  - ផ្លាស់ប្តូរមគ្គុទេសក៍ចាប់ផ្តើមរួមជាមួយបច្ចេកទេសចាក់តំឡើងដែលដាក់សុវត្ថិភាពជាដំបូង
- **🚧 បាណ័ស្ថានភាពសិក្ខាសាលា**: បាណ័ HTML មុខវិជ្ជាជីវៈបង្ហាញស្ថានភាពការអភិវឌ្ឍន៍សិក្ខាសាលា
  - រចនាផលចម្លាក់ gradient ជាមួយសញ្ញាស្ថិតិសំណង់សម្រាប់ការប្រាស្រ័យអ្នកប្រើច្បាស់លាស់
  - ទ្រង់ទ្រាយពេលបន្ទាន់បំផុតសម្រាប់ភាពត្រងត្រង់
  - រចនាម៉ូដការឆ្លើយតបស្មាតហ្វូនសម្រាប់ឧបករណ៍គ្រប់ប្រភេទ

#### បានបង្កើន
- **សុវត្ថិភាពបរិក្ខារ**: រួមបញ្ចូលមុខងារ preview ក្នុងឯកសារចាក់តំឡើងទាំងមូល
- **ការផ្ទៀងផ្ទាត់មុនចាក់តំឡើង**: ស្គ្រីបអូតូម៉ាទិចរួមបញ្ចូលបញ្ជីសាកល្បង infrastructure preview
- **ចរន្តការងារអwickovolta**: បន្ថែមលំដាប់បញ្ជាថ្មី រួមជាមួយ preview ជាប្រសិទ្ធិភាពកំពូល
- **បទពិសោធអ្នកសិក្សា**: កំណត់ចំណាំច្បាស់លាស់ចំពោះអ្នកប្រើអំពីស្ថានភាពការអភិវឌ្ឍន៍មាតិកា

#### បានផ្លាស់ប្តូរ
- **អនុវត្តការចាក់តំឡើងល្អបំផុត**: លំដាប់ការងារដែលប្រើ preview ជាប្រសិទ្ធិភាពបានអនុញ្ញាតឥឡូវនេះ
- **លំហែរការឯកសារ**: ការផ្ទៀងផ្ទាត់បរិក្ខារត្រូវបានធ្វើឲ្យជំនួចដំបូងនៅក្នុងដំណើរការរៀន
- **វេទិកាសិក្ខាសាលា**: ការប្រាស្រ័យស្ថានភាពជាមួយការរចនាវិជ្ជាជីវៈឲ្យមានកាលវិភាគអភិវឌ្ឍន៍ច្បាស់លាស់

#### បានរីកចម្រើន
- **វិធីសាស្រ្តដំបូងផ្តោតសុវត្ថិភាព**: អាចផ្ទៀងផ្ទាត់ការផ្លាស់ប្តូរបរិក្ខារមុនចាក់តំឡើង
- **សហការក្រុម**: លទ្ធផល preview អាចចែករំលែកសម្រាប់ពិនិត្យនិងអនុម័ត
- **ការយល់ដឹងថ្លៃដើម**: ការយល់ដឹងល្អជាងមុនអំពីថ្លៃវាសនានៃធនធានមុនចាក់តំឡើង
- **ការពារហានិភ័យ**: ការកាត់បន្ថយការបរាជ័យចាក់តំឡើងដោយការផ្ទៀងផ្ទាត់ពីមុន

#### អនុវត្តបច្ចេកទេស
- **ការរួមបញ្ចូលឯកសារច្រើន**: ការបង្ហាញមុខងារ preview ក្នុង 4 ឯកសារសំខាន់
- **គំរូពាក្យបញ្ជា**: សំភារៈត្រួតត្រា និងឧទាហរណ៍ជាប់ទាំងអស់ក្នុងឯកសារ
- **ការរួមបញ្ចូលល្អបំផុត**: preview រួមបញ្ចូលក្នុងដំណើរការផ្ទៀងផ្ទាត់ និងស្គ្រីប
- **សញ្ញាផ្ដល់ដឹងវិស្វកម្ម**: សញ្ញាថ្មី CLEAR សម្រាប់អត្តសញ្ញាណមុខងារ

#### ស្ថាបត្យកម្មសិក្ខាសាលា
- **ការប្រាស្រ័យស្ថានភាព**: បាណ័ HTML មុខវិជ្ជាជីវៈជាមួយរចនាឡីឡុកខ្សែដេរប្លាស្ទិច
- **បទពិសោធអ្នកប្រើ**: ស្ថានភាពការអភិវឌ្ឍន៍ច្បាស់លាស់សម្រាប់ការពន្យល់
- **ការបង្ហាញវិជ្ជាជីវៈ**: រក្សាមានភាពទ្រង់ទ្រាយឯកសារបណ្តាញហើយកំណត់អ្វីដែលរំពឹងទុក
- **ភាពត្រងត្រង់ពេលវេលា**: ពេលវេលាអាប់ដេតចុងក្រោយ ខែតុលា 2025 សម្រាប់ការទទួលខុសត្រូវ

### [v3.3.0] - 2025-09-24

#### ការកែលំអសម្ភារៈសិក្ខាសាលា និងបទពិសោធរៀនមានអន្តរកម្ម
**កំណែនេះណែនាំសម្ភារៈសិក្ខាសាលាចម្រុះជាមួយមគ្គុទេសក៍អន្តរកម្មលើកម្មវិធីរុករក និងផ្លូវរៀនស្មើស្មាញ។**

#### បានបន្ថែម
- **🎥 មគ្គុទេសក៍សិក្ខាសាលាអន្តរកម្ម**: បទពិសោធសិក្ខាសាលាលើកម្មវិធីរុករកជាមួយសមត្ថភាពpreview MkDocs
- **📝 សេចក្ដីណែនាំរចនាសម្ព័ន្ធសិក្ខាសាលា**: ផ្លូវរៀន 7 ជំហាន ដំណើរស្រាវជ្រាវរហូតដល់ការប្តូរតំរូវការ
  - 0-បើកមុខមាត់: ទិដ្ឋភាពទូទៅនិងការកំណត់ត្រា
  - 1-ជ្រើសរើសគំរូ AI: ដំណើរការស្វែងរកនិងជ្រើសរើសគំរូ
  - 2-ផ្ទៀងផ្ទាត់គំរូ AI: ប្រព័ន្ធចាក់តំឡើងនិងផ្ទៀងផ្ទាត់
  - 3-ដោះសោគំរូ AI: ការយល់ដឹងអំពីរចនាសម្ព័ន្ធគំរូ
  - 4-កំណត់រចនាសម្ព័ន្ធគំរូ AI: ការកំណត់រចនាសម្ព័ន្ធនិងការប្តូរតំរូវការ
  - 5-ប្តូរតំរូវការគំរូ AI: ការកែប្រែឧទាហរណ៍ និងការបន្ត
  - 6-លុបបរិក្ខារ: ការសម្អាតនិងការគ្រប់គ្រងធនធាន
  - 7-បូកសរុប: សង្ខេប និងជំហានបន្ទាប់
- **🛠️ ឧបករណ៍សិក្ខាសាលា**: ការកំណត់ MkDocs ជាមួយកម្មវិធី Material សម្រាប់បទពិសោធសិក្សាបានល្អប្រសើរ
- **🎯 ផ្លូវរៀនដោយដៃ**: វិធីសាស្រ្ត 3 ជំហាន (ស្រាវជ្រាវ → ចាក់តំឡើង → ការប្តូរតំរូវការ)
- **📱 ការរួមបញ្ចូល GitHub Codespaces**: ការកំណត់បរិយាកាសអwickovoltaបានរលូន

#### បានបង្កើន
- **មិនចេះខ្ជិលសិក្ខាសាលា AI**: បន្ថែមជាមួយបទពិសោធសិក្សារចនាសម្ព័ន្ធ 2-3 ម៉ោងពេញលេញ
- **ឯកសារសិក្ខាសាលា**: បង្ហាញវិជ្ជាជីវៈជាមួយការរុករកនិងឧបករណ៍ហត្ថបង្ហាញ
- **ជំហានរៀន**: បង្ហាញជំហានច្បាស់ចាប់ពីជម្រើសគំរូរហូតដល់ការចាក់តំឡើងផលិតកម្ម
- **បទពិសោធអ្នកអwickovolta**: រួមបញ្ចូលឧបករណ៍សម្រាប់លំហាត់ការងារអwickovoltaលៃតម្រូវបានងាយ

#### បានរីកចម្រើន
- **មិនមានជំងឺចូលប្រើ**: មុខងារបើកលើកម្មវិធីរុករកជាមួយស្វែងរក, ចម្លងកូដ, និងបម្លែងកម្មវិធី
- **រៀនដោយខ្លួនឯង**: រចនាសម្ព័ន្ធសិក្សាសមរម្យសម្រាប់ល្បឿនរៀនប្លែកៗគ្នា
- **ការអនុវត្តពិត**: ភាពក្នុងការចាក់តំឡើងគំរូ AI ក្នុងពិភពពិតប្រាកដ
- **ការរួមបញ្ចូលសហគមន៍**: រួមបញ្ចូល Discord សម្រាប់គាំទ្រ និងសហការនៅក្នុងសិក្ខាសាលា

#### លក្ខណៈសិក្ខាសាលា
- **ការស្វែងរកនៅក្នុងកថាខណ្ឌ**: រកឃើញពាក្យគន្លឹះ និងមេរៀនបានយ៉ាងរហ័ស
- **ចម្លងប្លុកកូដ**: ជំនួយចម្លងផ្នែកកូដដោយជំនួយកណ្តាលកណ្តាល
- **ប្តូរម៉ូដកម្មវិធី**: គាំទ្រមូដខ្មៅ/ស្រាលសម្រាប់ចំណង់ចំណូលចិត្តខុសៗគ្នា
- **ទ្រព្យសម្បត្តិវិចិត្រសាស្រ្ត**: រូបថតអេក្រង់ និងតារាងសម្រាប់ការយល់ដឹងកាន់តែច្បាស់
- **ការរួមបញ្ចូលជំនួយ**: ការចូលដំណើរការ Discord ត្រង់សម្រាប់គាំទ្រសហគមន៍

### [v3.2.0] - 2025-09-17

#### ការកែប្រែដំបូងលំដាប់នៃការរុករក និងប្រព័ន្ធរៀនដោយជំពូក
**កំណែនេះណែនាំរចនាសម្ព័ន្ធរៀនផ្ដោតលើជំពូកដែលមានការរុករកល្អប្រសើរជុំវិញព្រះវិហារនេះទាំងមូល។**

#### បានបន្ថែម
- **📚 ប្រព័ន្ធរៀនដោយជំពូក**: រៀបចំវគ្គសិក្សាទាំងមូលជាជំពូករៀន 8 ជំហានកើន
  - ជំពូក 1: មូលដ្ឋាន និងចាប់ផ្តើមរហ័ស (⭐ - 30-45 នាទី)
  - ជំពូក 2: ការអwickovolta AI ជាដំបូង (⭐⭐ - 1-2 ម៉ោង)
  - ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ និងការផ្ទៀងផ្ទាត់ (⭐⭐ - 45-60 នាទី)
  - ជំពូក 4: Infrastructure ជា Code និងការចាក់តំឡើង (⭐⭐⭐ - 1-1.5 ម៉ោង)
  - ជំពូក 5: ដំណោះស្រាយឯកតាភាគច្រើន AI (⭐⭐⭐⭐ - 2-3 ម៉ោង)
  - ជំពូក 6: ការផ្ទៀងផ្ទាត់ និងការធ្វើផែនការមុនចាក់តំឡើង (⭐⭐ - 1 ម៉ោង)
  - ជំពូក 7: ដោះស្រាយបញ្ហា និងដេបកូដ (⭐⭐ - 1-1.5 ម៉ោង)
  - ជំពូក 8: គំរូផលិតកម្ម និងសហគ្រាស (⭐⭐⭐⭐ - 2-3 ម៉ោង)
- **📚 ប្រព័ន្ធរុករកទូលំទូលាយ**: ក្បាលហើយជើងផ្នែករុករកសម្របសម្រួលនៅឯកសារទាំងមូល
- **🎯 ការតាមដានវគ្គសិក្សា**: បញ្ជីត្រួតពិនិត្យការបញ្ចប់វគ្គ និងប្រព័ន្ធផ្ទៀងផ្ទាត់ការសិក្សា
- **🗺️ ការណែនាំផ្លូវរៀន**: ចំណុចចូលច្បាស់សម្រាប់កម្រិតបទពិសោធន៏និងគោលដៅខុសគ្នា
- **🔗 តំណរោទ៍រវាងជំពូក**: ជំពូកពាក់ព័ន្ធ និងលក្ខណៈមុននិយាយគ្នាអោយជាប់ជាមួយ

#### បានបង្កើន
- **រចនាសម្ព័ន្ធ README**: បំលែងជាវេទិកាសិក្សារចនាសម្ព័ន្ធជំពូក
- **រុករកឯកសារ**: មុខទំព័រទាំងអស់មានបរិបទជំពូកនិងការណែនាំផ្លូវរៀន
- **ការរៀបចំគំរូ**: ឧទាហរណ៍និងគំរូបានចែកចំណាត់ថ្នាក់ទៅជំពូករៀនត្រឹមត្រូវ

- **ការរួមបញ្ចូលធនធាន**: សន្លឹកគន្លឹះ សំណួរញឹកញាប់ និងមើលផែនការសិក្សា​ដែល​ទាក់ទង​ជាប់​នឹងជំពូក​ដែល​គឺ​សមរម្យ
- **ការរួមបញ្ចូលមន្ទីរការងារ**: បន្ទប់ពហុလက်អនុវត្តដែលបានផែនទីទៅការបង្រៀនគោលដៅជំពូកច្រើន

#### កែប្រែនៅលើ
- **ការរីកចម្រើនក្នុងការសិក្សា**: ផ្លាស់ប្តូរពីឯកសារដោយស្របទៅការសិក្សាបែបជំពូកមានភាពថ្មោងថ្មាញ់
- **ទីតាំងការកំណត់រចនាសម្ព័ន្ធ**: ផ្លាស់ប្ដូរជាមគ្គុទេសក៍ការកំណត់រចនាសម្ព័ន្ធជាជំពូកទី 3 ដើម្បីមានចរន្តការសិក្សាល្អប្រសើរ
- **ការរួមបញ្ចូលមាតិកា AI**: ការរួមបញ្ចូលមាតិកាដែលជាក់លាក់AIល្អប្រសើរនៅក្នុងដំណើរទាំងមូលនៃការសិក្សា
- **មាតិកាការផលិត**: លំនាំកំពូលដែលបញ្ចូលគ្នានៅជំពូក 8 សម្រាប់អ្នកសិក្សាជំនាញសហគ្រាស

#### ប្រសើរឡើង
- **បទពិសោធន៍អ្នកប្រើ**: មុខងាររុករកបរិបទយត្រាសង្ខេប និងបញ្ជាក់អំពីការរីកចម្រើនជំពូក
- **ការចូលរួមគ្រប់គ្នា**: លំនាំរុករកមានភាពជាប់លាប់សម្រាប់ការកាត់បន្ថយការទៅមកវគ្គសិក្សា
- **ការតាំងបង្ហាញអាជីព**: រចនាសម្ព័ន្ធវគ្គសិក្សាបែបសាកលវិទ្យាល័យសមរម្យសម្រាប់ការបណ្ដុះបណ្ដាលវិជ្ជាជីវៈ និងសាជីវកម្ម
- **ប្រសិទ្ធភាពក្នុងការសិក្សា**: ការកាត់បន្ថយពេលវេលាស្វែងរកមាតិកាដែលពាក់ព័ន្ធក្រោមការរៀបចំឡើងប្រសើរ

#### ការអនុវត្តបច្ចេកទេស
- **ក្បាលមុខរុករក**: ស្ដង់ដារលំនាំរុករកជំពូកនៅក្នុងឯកសារច្រើនជាង 40
- **ប៊ូតុងបញ្ជា​នៅផ្នែកខាងក្រោម**: មគ្គុទេសក៍វឌ្ឍនភាពមានភាពច្បាស់លាស់ និងបទបញ្ជាជំពូកបញ្ចប់
- **ការរុករកតាមតំណភ្ជាប់រួមចំណែក**: ប្រព័ន្ធតំណភ្ជាប់ក្នុងទំហំសម្បទា ការតភ្ជាប់កំណត់ក្នុងការសំគាល់គំរូដែលទាក់ទងគ្នា
- **ការតម្រៀបជំពូក**: គំរូ និងឧទាហរណ៍ដែលច្បាស់លាស់តភ្ជាប់ជាមួយគោលបំណងសិក្សា

#### ការកែលម្អមុខសិក្សា
- **📚 គោលបំណងសិក្សា​ពេញលេញ**: រៀបចំមុខសិក្សាថ្មីឱ្យស្របជាមួយប្រព័ន្ធជំពូក 8 ជំពូក
- **🎯 ការវាយតម្លៃដោយផ្អែកលើជំពូក**: ម្នាក់ក្នុងមួយជំពូកមានគោលបំណងសិក្សារួមជាមួយលំហាត់បណ្តុះបណ្តាលប្រតិបត្តិ
- **📋 ការតាមដានវឌ្ឍនភាព**: កាលវិភាគសិក្សារៀងរាល់សប្តាហ៍ជាមួយលទ្ធផលអាចវាស់វែងបាន និងបញ្ជីផ្ទៀងផ្ទាត់ការបញ្ចប់
- **❓ សំណួរវាយតម្លៃ**: សំណួរបញ្ជាក់ទៅលើចំណេះដឹងសម្រាប់ម្នាក់ក្នុងមួយជំពូកជាមួយលទ្ធផលអាជីព
- **🛠️ លំហាត់ប្រតិបត្តិ**: សកម្មភាពប្រើប្រាស់ដោយដៃជាមួយសេណារីយ៉ូមុខងារ deployment ពិតប្រាកដ និងការដោះស្រាយបញ្ហា
- **📊 ការរីកចម្រើនជំនាញ**: ការរីកចម្រើនច្បាស់លាស់ចាប់ពីគំនិតមូលដ្ឋានទៅលំនាំសហគ្រាសជាមួយការយកចិត្តទុកដាក់អំពីកិច្ចការអភិវឌ្ឍអាជីព
- **🎓 ស៊េរីវិញ្ញាបនបត្រ**: លទ្ធផលអភិវឌ្ឍវិជ្ជាជីវៈ និងប្រព័ន្ធស្គាល់តម្លៃសហគមន៍
- **⏱️ ការគ្រប់គ្រងពេលវេលា**: ផែនការសិក្សា 10 សប្តាហ៍ដែលរៀបចំរួចជាមួយការផ្ទៀងផ្ទាត់កំណត់វគ្គ

### [v3.1.0] - 2025-09-17

#### ការកែលម្អដំណោះស្រាយ AI ម៉ុលទីអេហ្សិន
**កំណែកំណែនេះផ្តល់ការកែលម្អដំណោះស្រាយម៉ុលទីអេហ្សិនលក់រាយជាមួយការដាក់ឈ្មោះអេហ្សិនល្អប្រសើរ និងឯកសារកែលម្អបន្ថែម។**

#### កែប្រែ
- **ពាក្យសម្ដីអេហ្សិនមូលទីអេហ្សិន**: ប្ដូរ "Cora agent" ជា "Customer agent" នៅទូទាំងដំណោះស្រាយម៉ុលទីអេហ្សិនលក់រាយសម្រាប់ការយល់ដឹងច្បាស់
- **សំណង់អេហ្សិន**: បច្ចុប្បន្នភាពឯកសារទាំងអស់ គំរូ ARM និងឧទាហរណ៍កូដប្រើបញ្ឈ្មោះ "Customer agent" ជាមួយកម្រិតភាពជាប់លាប់
- **ឧទាហរណ៍កំណត់រចនាសម្ព័ន្ធ**: វិធីកំណត់រចនាសម្ព័ន្ធអេហ្សិនទំនើបដោយមានការកែឈ្មោះឡើងវិញ
- **ភាពជាប់លាប់ឯកសារ**: ប្រាកដថាការរួមបញ្ចូលទាំងអស់ប្រើឈ្មោះអេហ្សិនដែលមានការពិពណ៌នាផ្លូវការជាជារឿយ

#### កែលម្អ
- **កញ្ចប់គំរូ ARM**: បច្ចុប្បន្នភាព retail-multiagent-arm-template ជាមួយការយោង customer agent
- **គំនូសសំណង់**: គំនូស Mermaid បានបំលែងជាមួយឈ្មោះអេហ្សិនបានកែប
- **ឧទាហរណ៍កូដ**: ថ្នាក់ Python និងឧទាហរណ៍អនុវត្តបានកែជាឈ្មោះ CustomerAgent
- **អថេរបរិស្ថាន**: បច្ចុប្បន្នភាពស្គ្រីបdeployment ទាំងអស់ប្រើ CUSTOMER_AGENT_NAME

#### ប្រសើរឡើង
- **បទពិសោធន៍អ្នករចនា**: តំណែង និងភារកិច្ចអេហ្សិនបកចេញបានច្បាស់លាស់ក្នុងឯកសារ
- **ភាពរួមបញ្ចូលជាមួយផលិតកម្ម**: សម្របសម្រួលល្អជាមួយកម្រិតឈ្មោះសហគ្រាស
- **សម្ភារៈសិក្សា**: ប្ដូរឈ្មោះអេហ្សិនឲ្យមានភាពងាយស្រួលក្នុងការបង្រៀន
- **ការប្រើប្រាស់គំរូ**: ងាយស្រួលយល់ពីមុខងារ និងលំនាំ deployment របស់អេហ្សិន

#### ព័ត៌មានបច្ចេកទេស
- បានកែប្រែគំនូសសំណង់ Mermaid ជាមួយការយោង CustomerAgent
- ប្ដូរឈ្មោះថ្នាក់ CoraAgent ជា CustomerAgent នៅក្នុងឧទាហរណ៍ Python
- កែប្រែការកំណត់ JSON របស់គំរូ ARM ដើម្បីប្រើប្រភេទអេហ្សិន "customer"
- បច្ចុប្បន្នភាពអថេរបរិស្ថានពី CORA_AGENT_* ទៅ CUSTOMER_AGENT_*
- បំលែងបញ្ជាការដែលបញ្ចូន និងការកំណត់ container ទាំងអស់

### [v3.0.0] - 2025-09-12

#### ការផ្លាស់ប្ដូរធំ - ផ្តោតលើអ្នកអភិវឌ្ឍ AI និងការរួមបញ្ចូល Microsoft Foundry
**កំណែនេះបម្លែងឃ្លាំងទិន្នន័យទៅជាធនធានសិក្សាជាក់លាក់ AI ពេញលេញ ដែលរួមបញ្ចូល Microsoft Foundry។**

#### បន្ថែម
- **🤖 ផ្លូវការសិក្សាដំបូង AI**: រៀបចំសម្ដែងថ្មីយ៉ាងសំខាន់លើអ្នកអភិវឌ្ឍ និងវិស្វករអាជីព AI
- **មគ្គុទេសក៍រួមបញ្ចូល Microsoft Foundry**: ឯកសារពេញលេញសម្រាប់ភ្ជាប់ AZD ជាមួយបម្រើ Microsoft Foundry
- **លំនាំប្រតិបត្តិដំណើរការម៉ូឌែល AI**: មគ្គុទេសក៍លម្អិតគ្របដណ្តប់ការជ្រើសរើសម៉ូឌែល ការកំណត់រចនា និងយុទ្ធសាស្ត្របណ្តោះអាសន្នក្នុងផលិតកម្ម
- **មន្ទីរកម្មវិធី AI**: វគ្គហ្វឹកហាត់ដៃ 2-3 ម៉ោងសម្រាប់បម្លែងកម្មវិធី AI ទៅដំណោះស្រាយទាន់ AZD
- **អនុវត្តន៍ល្អក្នុងផលិតកម្ម AI**: លំនាំផ្តល់សមត្ថភាពកម្រិតសហគ្រាសក្នុងការលូតលាស់ ត្រួតពិនិត្យ និងការពារតំណាង AI
- **មគ្គុទេសក៍ដោះស្រាយបញ្ហាដែលជាក់លាក់ AI**: ការដោះស្រាយបញ្ហាទាំងមូលសម្រាប់ម៉ូឌែល Microsoft Foundry សេវាកម្ម Cognitive និងបញ្ហាក្នុងការចេញផ្សាយ AI
- **រាយការណ៍គំរូ AI**: ការប្រមូលសម្រាប់ Microsoft Foundry ដែលមានកម្រិតស្មុគស្មាញ
- **សម្ភារៈមន្ទីរបណ្តុះបណ្តាល**: រចនាសម្ព័ន្ធមន្ទីរបណ្តុះបណ្តាលពេញលេញជាមួយមន្ទីរពហុហត្ថ

#### កែលម្អ
- **រចនាសម្ព័ន្ធ README**: ផ្តោតលើអ្នកអភិវឌ្ឍ AI ជាមួយទិន្នន័យចំណាប់អារម្មណ៍សហគមន៍ 45% ពី Discord Microsoft Foundry
- **ផ្លូវការសិក្សា**: ផ្លូវការអភិវឌ្ឍ AI ជាមួយផ្លូវខុសប្លែកសម្រាប់សិស្ស និងវិស្វករនៅ DevOps
- **អនុសាសន៍គំរូ**: គំរូ AI បង្ហាញ រួមមាន azure-search-openai-demo, contoso-chat, និង openai-chat-app-quickstart
- **ការរួមបញ្ចូលសហគមន៍**: ការគាំទ្រសហគមន៍ Discord បានកែលម្អជាមួយបន្ទប់និងការពិភាក្សាជាក់លាក់លើ AI

#### ផ្នែកសន្តិសុខ និងផលិតកម្ម
- **លំនាំអត្តសញ្ញាណរក្សាទុក**: ការផ្ទៀងផ្ទាត់ និងការកំណត់សន្តិសុខ AI ជាក់លាក់
- **បង្កើតការចំណាយមានប្រសិទ្ធភាព**: តាមដានការប្រើប្រាស់តូកើន និងការគ្រប់គ្រងថវិកាដល់លំនាំ AI
- **ការចេញផ្សាយភូមិសាស្រ្តច្រើនតំបន់**: យុទ្ធសាស្ត្រសម្រាប់ការ deployment កម្មវិធី AI នៅជុំវិញពិភពលោក
- **ត្រួតពិនិត្យប្រសិទ្ធភាព**: ម៉ាស៊ីនមាត្រចំណេញ AI និងការរួមបញ្ចូល Application Insights

#### គុណភាពឯកសារ
- **រចនាសម្ព័ន្ធវគ្គសិក្សាជាកំណត់**: ការរីកចម្រើនមានយុត្តិធម៌ពីដំបូងរហូតដល់លំនាំ deployment AI កម្រិតខ្ពស់
- **URL បានផ្ទៀងផ្ទាត់**: តំណឃ្លាំងក្រៅទាំងអស់ត្រូវបានបញ្ជាក់ និងអាចចូលដំណើរការ
- **យោងសម្រាប់ឯកសារបញ្ចូល**: តំណឯកសារផ្ទៃក្នុងទាំងអស់បានបញ្ជាក់ និងអាចប្រើបាន
- **រួចរាល់សម្រាប់ផលិតកម្ម**: លំនាំ deployment សហគ្រាសជាមួយឧទាហរណ៍ពិតប្រាកដ

### [v2.0.0] - 2025-09-09

#### ការផ្លាស់ប្ដូរធំ - ការរៀបចំឃ្លាំង និងការកែលម្អជំនាញអាជីព
**កំណែនេះបង្ហាញពីការកែឯកសារពិសេសនៃរចនាសម្ព័ន្ធឃ្លាំង និងការតាំងបង្ហាញមាតិកា។**

#### បន្ថែម
- **ស៊ុមការសិក្សាបទដ្ឋាន**: ទំព័រឯកសារ​ទាំងអស់មានផ្នែកផ្តើមគោលបំណងសិក្សា និងលទ្ធផលសិក្សារ
- **ប្រព័ន្ធរុករក**: បន្ថែមតំណមុខវិជ្ជា មុន/បន្ទាប់ នៅទូទាំងឯកសារសម្រាប់ការរីកចម្រើនវគ្គសិក្សាដោយមានមគ្គុទេសក៍
- **មើលផែនការសិក្សា**: study-guide.md ពេញលេញមានគោលបំណងសិក្សា លំហាត់និងសម្ភារៈវាយតម្លៃ
- **តាំងបង្ហាញប្រកបដោយជំនាញ**: លុបចេញរូបតំណាងអេម៉ូជិសម្រាប់ភាពងាយស្រួល និងរូបរាងជំនាញ
- **រចនាសម្ព័ន្ធមាតិការិយាល័យកាន់តែប្រសើរ**: ការរៀបចំ និងចរន្តភ្លាមៗនៃសម្ភារៈសិក្សា

#### ប្រែប្រួល
- **ទ្រង់ទ្រាយឯកសារ**: ស្ដង់ដារពេញលេញនៃឯកសារទាំងអស់ជាមួយរចនាសម្ព័ន្ធសំខាន់សម្រាប់ការសិក្សា
- **ចរន្តរុករក**: អនុវត្តចរន្តយុត្តិប្រយោជន៍ជារឿយៗក្នុងសម្ភារៈសិក្សាទាំងអស់
- **ការតាំងបង្ហាញមាតិកា**: លុបចេញធាតុគំនូរចាក់ទៅការតាំងបង្ហាញមានភាពច្បាស់លាស់ និងជំនាញ
- **រចនាសម្ព័ន្ធតំណ**: បច្ចុប្បន្នភាពតំណភ្ជាប់ក្នុងសៀវភៅឯកសារដើម្បីគាំទ្រប្រព័ន្ធរុករកថ្មី

#### ប្រសើរឡើង
- **ការចូលរួមគ្រប់គ្នា**: លុបចេញការជាប់ស្វ័យប្រវត្តិសម្រាប់ការ compatible នឹងកម្មវិធីអានអេក្រង់
- **រូបរាងជំនាញ**: ការតាំងបង្ហាញបែបសិក្សាវិទ្យាសាស្ត្រ សមរម្យសម្រាប់ការសិក្សាសហគ្រាស
- **បទពិសោធន៍រៀន**: វិធីសាស្រ្តរៀនមានរចនាសម្ព័ន្ធណែនាំគោលបំណង និងលទ្ធផលសម្រាប់មុខវិជ្ជាទាំងអស់
- **ការរៀបចំមាតិកា**: ចរន្តល្អប្រសើរនិងការតភ្ជាប់រវាងប្រធានបទដែលទាក់ទងគ្នា

### [v1.0.0] - 2025-09-09

#### ចេញផ្សាយដំបូង - ឃ្លាំងរៀន AZD ពេញលេញ

#### បន្ថែម
- **រចនាសម្ព័ន្ធឯកសារដាស់នាំទិសប្រណិត**
  - ស៊េរីមេរៀនផ្ដើមពីគន្លឹះទាំងអស់
  - ឯកសារពីការចេញផ្សាយ និងការផ្ដល់សេវាផ្អែកលើការតំឡើង
  - ឯកសារដោះស្រាយបញ្ហា និងមគ្គុទេសក៍វាយតម្លៃ
  - ការត្រួតពិនិត្យមុនចេញផ្សាយ

- **ផ្នែកការចាប់ផ្ដើម**
  - គន្លឹះ AZD៖ គំនិត និងពាក្យបញ្ជាក់សំខាន់ៗ
  - មគ្គុទេសក៍តំឡើង៖ លទ្ធកម្មនៃវេទិកាតាមក្រុមហ៊ុន
  - មគ្គុទេសក៍កំណត់រចនាសម្ព័ន្ធ៖ ការរៀបចំបរិស្ថាន និងការផ្ទៀងផ្ទាត់
  - មេរៀនគម្រោងដំបូង៖ ជំហានដៃលើជំហាន

- **ផ្នែក deployment និង provisioning**
  - មគ្គុទេសក៍ deployment៖ ការប្រឹងប្រែងដំណើរការពេញលេញ
  - មគ្គុទេសក៍ provisioning៖ អគ្គិសនីជា Code ជាមួយ Bicep
  - លំនាំអោយប្រើបានល្អបំផុតសម្រាប់ deployment ផលិតកម្ម
  - លំនាំសំណង់សេវាសហគ្រិនពហុ

- **ផ្នែកពិនិត្យមុនចេញផ្សាយ**
  - ការធ្វើផែនការថាមពល៖ ការត្រួតពិនិត្យប្រើប្រាស់ធនធាន Azure
  - ការជ្រើសរើស SKU៖ មគ្គុទេសក៍ជាប្រវត្តិសាស្ត្រ
  - ការត្រួតពិនិត្យមុនហោះ៖ វេចខ្ចប់សេវាអូតូម៉ាទិក (PowerShell និង Bash)
  - ការប៉ាន់ស្មានថ្លៃ និងផែនការថវិកា

- **ផ្នែកដោះស្រាយបញ្ហា**
  - បញ្ហាទូទៅ៖ បញ្ហាទាក់ទងមក និងដោះស្រាយ
  - មគ្គុទេសក៍វាយតម្លៃ៖ វិធីសាស្រ្តដោះស្រាយបញ្ហា សម្រួលជាប្រព័ន្ធ
  - បច្ចេកទេសវាយតម្លៃលំដាប់ខ្ពស់ និងឧបករណ៍
  - ការត្រួតពិនិត្យ និងបង្កើនប្រសិទ្ធភាព

- **ធនធាន និងយោង**
  - សន្លឹកបញ្ជាការបញ្ជាក់៖ ផ្ទាល់ខ្លួនសម្រាប់បញ្ជាការសំខាន់ៗ
  - ពាក្យបញ្ជាក់៖ ការកំណត់វចនានុវត្តិ និងអក្សរលំអិត
  - សំណួរញឹកញាប់៖ ចម្លើយលម្អិតសម្រាប់សំណួរញឹកញាប់
  - តំណភ្ជាប់ធនធានក្រៅ និងការតភ្ជាប់ជាសហគមន៍

- **ឧទាហរណ៍ និងគំរូ**
  - ឧទាហរណ៍កម្មវិធីវែបសាមញ្ញ
  - គំរូការដាក់សៀវភៅវែបស្ថិរភាព
  - ការកំណត់កម្មវិធី Container
  - លំនាំបញ្ចូលមូលដ្ឋានទិន្នន័យ
  - ឧទាហរណ៍រចនាសម្ព័ន្ធ Microservices
  - អនុវត្តន៍មុខងារ Serverless

#### លក្ខណៈពិសេស
- **គាំទ្រប្រព័ន្ធច្រើនវេទិកា**: មគ្គុទេសក៍តំឡើង និងកំណត់សម្រាប់ Windows, macOS និង Linux
- **កម្រិតជំនាញច្រើន**: មាតិកាដាក់បំផុតសម្រាប់សិស្សសម្រាប់វិស្វករ និងអ្នកអភិវឌ្ឍជំនាញអាជីព
- **ផ្តោតនឹងការអនុវត្ត**: ឧទាហរណ៍ដៃលើ និងសេណារីយ៉ូពិតប្រាកដ
- **គំរូគ្រប់គ្រាន់**: ចាប់ពីគំនិតមូលដ្ឋានទៅលំនាំសហគ្រាសកម្រិតខ្ពស់
- **ផ្តោតលើសន្តិសុខ**: ការអនុវត្តល្អបំផុតសន្តិសុខត្រូវបានបញ្ចូលនៅក្នុងទាំងមូល
- **ការបង្កើតថវិកាមានប្រសិទ្ធភាព**: ជំនួយដល់ការចំណាយយ៉ាងម៉ត់ចត់ក្នុងការចេញផ្សាយ និងគ្រប់គ្រងធនធាន

#### គុណភាពឯកសារ
- **ឧទាហរណ៍កូដលម្អិត**: លំនាំកូដយល់ប្រាកដ ដែលបានសាកល្បង
- **ការណែនាំជាជំហាន**: មគ្គុទេសក៍ច្បាស់ សំរាប់អនុវត្តបានលឿន
- **ការដោះស្រាយកំហុសយ៉ាងទូលំទូលាយ**: ការដោះស្រាយបញ្ហាទូទៅ
- **ការរួមបញ្ចូលលំនាំល្អបំផុត**: ស្តង់ដារឧស្សាហកម្ម និងអនុសាសន៍
- **ភាពប៉ុនប៉ងជាមួយកំណែ**: ទាន់សម័យជាមួយសេវាកម្ម Azure និងមុខងារ azd ចុងក្រោយ

## ការកែលម្អដែលគ្រោងនាពេលអនាគត

### កំណែ 3.1.0 (គ្រោង)
#### ការពង្រីកវេទិកា AI
- **គាំទ្រម៉ូឌែលច្រើន**: លំនាំរួមបញ្ចូលសម្រាប់ Hugging Face, Azure Machine Learning និងម៉ូឌែលផ្ទាល់ខ្លួន
- **រចនាសម្ព័ន្ធអ្នកអេហ្សិន AI**: គំរូសម្រាប់ LangChain, Semantic Kernel និងការចេញផ្សាយ AutoGen
- **លំនាំ RAG​កម្រិតខ្ពស់**: ជម្រើសមូលដ្ឋានទិន្នន័យសម្រាប់វ៉ិចទ័រ លើសពី Azure AI Search (Pinecone, Weaviate, លទៀត)
- **ការត្រួតពិនិត្យ AI**: ការត្រួតពិនិត្យកម្រិតខ្ពស់ឡើងសម្រាប់មុខងារ ម៉ូឌែល ប្រើប្រាស់តូកើន និងគុណភាពចម្លើយ

#### បទពិសោធន៍អ្នកអភិវឌ្ឍ
- **ផ្នែកបន្ថែម VS Code**: បទពិសោធន៍អភិវឌ្ឍ AZD + Microsoft Foundry រួមបញ្ចូល
- **ការរួមបញ្ចូល GitHub Copilot**: ការបង្កើតគំរូ AZD ជួយដោយ AI
- **មេរៀនអន្តរកម្ម**: លំហាត់កូដដៃលើជាមួយការផ្ទៀងផ្ទាត់អូតូម៉ាទិកសម្រាប់សេណារីយ៉ូ AI
- **មាតិកាវីដេអូ**: មេរៀនវីដេអូបន្ថែមសម្រាប់អ្នករៀនគ្រប់លក្ខណៈដែលផ្តោតលើការចេញផ្សាយ AI

### កំណែ 4.0.0 (គ្រោង)
#### លំនាំសហគ្រាស AI
- **រចនាសម្ព័ន្ធរដ្ឋបាល**: រដ្ឋបាលម៉ូឌែល AI ការអនុវត្តផ្គាប់បញ្ញត្តិ និងការត្រួតពិនិត្យ audit trails
- **AI មាន់ហ្សាជាអ្នកជួលជាច្រើន**: លំនាំសម្រាប់បម្រើអតិថិជនច្រើនជាមួយសេវាកម្ម AI ដែលបុកផ្សេងគ្នា
- **AI Edge Deployment**: បញ្ចូលដោយ Azure IoT Edge និងវេទិកាកុងតឺន័រ
- **AI Cloud រំភើបចំពោះរំពូល**: លំនាំ deployment មូលដ្ឋាន cloud ពហុ និងភាគល្អិតសម្រាប់ AI workloads

#### លក្ខណៈពិសេសខ្ពស់
- **ស្វ័យប្រវត្តបណ្ដាញ AI**: ការរួមបញ្ចូល MLOps ជាមួយបណ្ដាញ Azure Machine Learning
- **សន្តិសុខខ្ពស់**: លំនាំ trust-zero, ចំណុចចូលឯកជន និងការពារគ្រោះថ្នាក់កម្រិតខ្ពស់
- **បង្កើនប្រសិទ្ធភាព**: ការតម្រង់ទិស និងកម្រិតចំពោះកម្មវិធី AI throughput ខ្ពស់
- **ចែកចាយជាសកល**: លំនាំផ្សាយមាតិកា និងរក្សាទុក data edge សម្រាប់កម្មវិធី AI

### កំណែ 3.0.0 (គ្រោង) - ត្រូវបានជំនួសដោយការចេញផ្សាយបច្ចុប្បន្ន
#### ការបន្ថែមបានផ្ដល់ - បានអនុវត្តនៅ v3.0.0
- ✅ **មាតិកាផ្តោត AI**: ការរួមបញ្ចូល Microsoft Foundry ពេញលេញ (បានបញ្ចប់)
- ✅ **មេរៀនអន្តរកម្ម**: មន្ទីរបណ្តុះបណ្តាល AI ដៃលើ (បានបញ្ចប់)
- ✅ **ផ្នែកសន្តិសុខខ្ពស់**: លំនាំសន្តិសុខជាក់លាក់ AI (បានបញ្ចប់)
- ✅ **បង្កើតប្រសិទ្ធភាព**: លំនាំថែទាំ AI workload (បានបញ្ចប់)

### កំណែ 2.1.0 (គ្រោង) - បានអនុវត្តផ្នែកខ្លះនៅ v3.0.0
#### ការកែលម្អតូចៗ - មានការសម្រេចចិត្តខ្លះនៅការចេញផ្សាយបច្ចុប្បន្ន
- ✅ **ឧទាហរណ៍បន្ថែម**: សេណារីយ៉ូ deployment ផ្តោត AI (បានបញ្ចប់)
- ✅ **FAQ ពេញលេញ**: សំណួរផ្តោត AI និងដោះស្រាយបញ្ហា (បានបញ្ចប់)
- **ការរួមបញ្ចូលឧបករណ៍**: មគ្គុទេសក៍រួមបញ្ចូល IDE និងកម្មវិធីកែសម្រួល
- ✅ **ការពង្រីកការត្រួតពិនិត្យ**: លំនាំត្រួតពិនិត្យ និងជូនដំណឹង AI (បានបញ្ចប់)

#### នៅតែគ្រោងសម្រាប់ការចេញផ្សាយក្នុងអនាគត
- **ឯកសារសម្របសម្រួលសម្រាប់ទូរស័ព្ទចល័ត**: រចនាបទប្រតិបត្តិករក្រោមទូរស័ព្ទចល័ត
- **ការចូលដំណើរការពេលអត់អ៊ីនធឺណិត**: កញ្ចប់ឯកសារអាចទាញយកបាន
- **ការរួមបញ្ចូល IDE បានកែលម្អ**: ផ្នែកបន្ថែម VS Code សម្រាប់ AZD + ប្រតិបត្តិការណ៍ AI
- **ផ្ទាំងសហគមន៍**: មាត្រដ្ឋានសហគមន៍ពេលវេលារៀងរាល់ថ្ងៃ និងការតាមដានការរួមចំណែក

## ការរួមចំណែកដល់ Changelog

### រាយការណ៍ការផ្លាស់ប្ដូរ
នៅពេលរួមចំណែកទៅឃ្លាំងនេះ សូមធានាថាផ្នែក changelog រួមមាន:

1. **លេខកំណែ**: អនុវត្តតាម semantic versioning (major.minor.patch)
2. **កាលបរិច្ឆេទ**: កាលបរិច្ឆេទចេញផ្សាយ ឬកែប្រែទ្រង់ទ្រាយ YYYY-MM-DD
3. **ប្រភេទ**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **ការពិពណ៌នាច្បាស់លាស់**: ការពណ៌នាសង្ខេបនៃអ្វីដែលបានផ្លាស់ប្ដូរ
5. **ការវាយតម្លៃផលប៉ះពាល់**: របៀបដែលការផ្លាស់ប្ដូរប៉ះពាល់ដល់អ្នកប្រើប្រាស់មានស្រាប់

### ប្រភេទការផ្លាស់ប្ដូរ

#### បន្ថែម
- លក្ខណៈពិសេសថ្មី ផ្នែកឯកសារ ឬសមត្ថភាព
- ឧទាហរណ៍ថ្មី គំរូ ឬធនធានសិក្សា
- ឧបករណ៍ បណ្ដុំបញ្ជា ឬកម្មវិធីជំនួយបន្ថែម

#### កែប្រែ
- ការផ្លាស់ប្ដូរលើមុខងារឬឯកសារដែលមានស្រាប់
- ការអាប់ដេតដើម្បីធ្វើឲ្យច្បាស់លាស់ ឬត្រឹមត្រូវ
- ការរៀបចំឡើងវិញមាតិកា ឬការរៀបចំ

#### ដកចេញ
- លក្ខណៈពិសេស ឬវិធីសាស្ត្រដែលត្រូវបានដកចេញ
- ផ្នែកឯកសារដែលគ្រោងដកចេញ
- វិធីសាស្ត្រដែលមានជម្រើសប្រសើរជាង

#### លុបចោល
- លក្ខណៈពិសេស ឯកសារ ឬឧទាហរណ៍ដែលមិនមានសារៈប្រយោជន៍បន្តទៀត
- ព័ត៌មានចាស់ ឬវិធីសាស្ត្រដែលត្រូវបានដកចេញ
- មាតិកាដដែលឬបញ្ចូលគ្នា

#### ជំរុញ
- ការកែតម្រូវកំហុសនៅក្នុងឯកសារ ឬកូដ
- ការដោះស្រាយបញ្ហាដែលបានរាយការណ៍
- ការកែលម្អត្រឹមត្រូវ ឬមុខងារ


#### សន្តិសុខ
- ការកែលម្អ ឬជំនួសបញ្ហាផ្នែកសន្តិសុខ
- បច្ចុប្បន្នភាពល្អបំផុតលើការអនុវត្តន៍សន្តិសុខ
- ការដោះស្រាយចំពោះចំណុចងាយរងគ្រោះផ្នែកសន្តិសុខ

### ជំនួយសម្រាប់ Semantic Versioning

#### កំណែធំ (X.0.0)
- ការផ្លាស់ប្តូរដែលបាក់ហើយតម្រូវឱ្យអ្នកប្រើប្រាស់អនុវត្ត
- ការរៀបចំឡើងវិញយ៉ាងសំខាន់នៃមាតិកា ឬការរៀបចំបង្កើត
- ការផ្លាស់ប្តូរដែលបម្លែងវិធីសាស្រ្តមូលដ្ឋានឬវិធីសាស្រ្តបញ្ញាសិប្បនិម្មិត

#### កំណែស្រាល (X.Y.0)
- លក្ខណៈពិសេស ឬការបន្ថែមមាតិកាថ្មី
- ការកែលម្អដែលថែរក្សាការចម្រុះត្រឡប់ក្រោយ
- ឧទាហរណ៍ ឧបករណ៍ ឬធនធានបន្ថែម

#### កំណែបញ្ចេញកំណត់ត្រា (X.Y.Z)
- ការកែលម្អកំហុស និងការត្រួតពិនិត្យ
- ការកែលម្អតិចតួចលើមាតិកាដែលមាន
- ការបញ្ជាក់ និងកែលម្អតូចៗ

## មតិយោបល់ និងសំណើរពីសហគមន៍

យើងលើកទឹកចិត្តយ៉ាងខ្លាំងចំពោះមតិយោបល់ពីសហគមន៍ដើម្បីបង្កើនគុណភាពធនធាននេះ៖

### របៀបផ្តល់មតិយោបល់
- **GitHub Issues**: រាយការណ៍បញ្ហា ឬសម្លឹងរកការកែលម្អ (បញ្ហារបស់ AI សូមចូលរួមបាន)
- **Discord Discussions**: ចែករំលែកគំនិត និងចូលរួមជាមួយសហគមន៍ Microsoft Foundry
- **Pull Requests**: ឯកភាពកែលម្អផ្ទាល់លើមាតិកា ជាពិសេសលើព្រីតទမ် និងសៀវភៅណែនាំ AI
- **Microsoft Foundry Discord**: ចូលរួមក្នុងឆានែល #Azure សម្រាប់ការពិភាក្សា AZD + AI
- **Community Forums**: ចូលរួមក្នុងការពិភាក្សាអភិវឌ្ឍន៍ Azure ទូលំទូលាយ

### ប្រភេទមតិយោបល់
- **ភាពត្រឹមត្រូវនៃមាតិកា AI**: ការកែលម្អព័ត៌មានរួមបញ្ចូលសេវាកម្ម AI និងការដាក់ឲ្យប្រើ
- **បទពិសោធន៍សិក្សា**: សំណើសម្រាប់ជំនួយលើដំណើរការសិក្សាអភិវឌ្ឍន៍ AI
- **មាតិកា AI ដែលបាត់បង់**: សំណើសម្រាប់ព្រីតទမ် AI តាមប្រៀប ឬឧទាហរណ៍បន្ថែម
- **សមរម្យភាព**: ការកែលម្អសម្រាប់តម្រូវការសិក្សាតិចខ្លួននានា
- **ការរួមបញ្ចូលឧបករណ៍ AI**: សំណើសម្រាប់ការរួមបញ្ចូលការអភិវឌ្ឍន៍ AI កាន់តែប្រសើរ
- **គំរូ AI ផលិតកម្ម**: សំណើសម្រាប់លំនាំការដាក់ប្រេកង់ AI ក្នុងក្រុមហ៊ុន

### ការប្តេជ្ញាចិត្តក្នុងការឆ្លើយតប
- **ការឆ្លើយតបបញ្ហា**: នៅក្នុងរយៈពេល ៤៨ ម៉ោងសម្រាប់បញ្ហារបាយការណ៍
- **សំណើរសមត្ថភាព**: ការវាយតំលៃនៅក្នុងរយៈពេលមួយសប្តាហ៍
- **ការរួមចំណែកពីសហគមន៍**: ការពិនិត្យនៅក្នុងរយៈពេលមួយសប្តាហ៍
- **បញ្ហាសន្តិសុខ**: អាទិភាពភ្លាម ដោយមានការឆ្លើយតបឆាប់រហ័ស

## កាលវិភាគថែទាំ

### បច្ចុប្បន្នភាពទៀងទាត់
- **ការត្រួតពិនិត្យប្រចាំខែ**: ភាពត្រឹមត្រូវនៃមាតិកា និងការត្រួតពិនិត្យតំណភ្ជាប់
- **បច្ចុប្បន្នភាពប្រចាំត្រីមាស**: ការបន្ថែមនិងការកែលម្អមាតិការធំៗ
- **ការត្រួតពិនិត្យប្រចាំពាក់កណ្ដាលឆ្នាំ**: ការរៀបចំឡើងវិញយ៉ាងទូលំទូលាយ និងការកែលម្អ
- **ការចេញផ្សាយប្រចាំឆ្នាំ**: កំណែធំជាមួយការកែលម្អសំខាន់ៗ

### ការត្រួតពិនិត្យ និងធានា គុណភាព
- **ការសាកល្បងស្វ័យប្រវត្តិ**: ការត្រួតពិនិត្យឧទាហរណ៍កូដ និងតំណភ្ជាប់ជាទៀងទាត់
- **ការរួមបញ្ចូលមតិយោបល់ពីសហគមន៍**: ការបញ្ចូលយោបល់អ្នកប្រើជាទៀងទាត់
- **បច្ចុប្បន្នភាពបច្ចេកវិទ្យា**: យោងទៅតាមសេវា Azure ថ្មីៗ និងការចេញផ្សាយ azd
- **ការត្រួតពិនិត្យសមរម្យភាព**: ការត្រួតពិនិត្យដើម្បីមានរចនាសម្ព័ន្ធរួមបញ្ចូលបាន

## គោលនយោបាយគាំទ្រកំណែ

### ការគាំទ្រកំណែបច្ចុប្បន្ន
- **កំណែធថ្មីបំផុត**: គាំទ្រដោយពេញលេញ ជាមួយបច្ចុប្បន្នភាពទៀងទាត់
- **កំណែធំមុននេះ**: បច្ចុប្បន្នភាពសន្តិសុខ និងការជំនួសសំខាន់ៗរយៈពេល ១២ ខែ
- **កំណែចាស់**: គាំទ្រពីសហគមន៍តែប៉ុណ្ណោះ មិនមានបច្ចុប្បន្នភាពផ្លូវការឡើយ

### ជំនួយផ្លូវការប្រែប្រួល
ពេលដែលកំណែធំចេញផ្សាយ យើងផ្តល់៖
- **មគ្គុទេសក៍ផ្លាស់ប្ដូរ**: សេចក្ដីណែនាំជាជំហ៊ានៗសម្រាប់ផ្លាស់ប្ដូរ
- **សម្គាល់ការចំរាស់**: ព័ត៌មានអំពីការផ្លាស់ប្ដូរដែលបាក់បែក
- **ការគាំទ្រឧបករណ៍**: ស្គ្រីប ឬឧបករណ៍ជំនួយសម្រាប់ការផ្លាស់ប្ដូរ
- **គាំទ្រសហគមន៍**: វេទិកាផ្តល់សម្រាប់សំណួរផ្លាស់ប្ដូរ

---

**ការស្វែងរក**
- **មេរៀនមុន**: [Study Guide](resources/study-guide.md)
- **មេរៀនបន្ទាប់**: ត្រឡប់ទៅ [Main README](README.md)

**រីករាយជាមួយការអាប់ដេត**: តាមដានឃ្លាំងនេះសម្រាប់ការជូនដំណឹងអំពីការបញ្ចេញថ្មី និងបច្ចុប្បន្នភាពសំខាន់ៗលើសម្ភារៈរៀន។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
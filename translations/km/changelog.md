# កំណត់ផ្លាស់ប្តូរ - AZD សម្រាប់អ្នកចាប់ផ្ដើម

## ការណែនាំ

កំណត់ផ្លាស់ប្តូរនេះចុះបញ្ជីការផ្លាស់ប្តូរ អាប់ដេត និងការកែលម្អសំខាន់ៗទាំងអស់ចំពោះឃុំបណ្ណ AZD សម្រាប់អ្នកចាប់ផ្ដើម។ យើងអនុវត្តគោលការណ៍កំណែដោយមានន័យ (semantic versioning) និងថែរក្សាបញ្ជីនេះដើម្បីជួយអ្នកប្រើប្រាស់យល់ពីអ្វីដែលបានផ្លាស់ប្តូររវាងកំណែៗ។

## គោលបំណងអប់រំ

ដោយពិនិត្យមើលកំណត់ផ្លាស់ប្តូរនេះ អ្នកនឹង:
- រក្សាបានព័ត៌មានពីមុខងារថ្មី និងការបន្ថែមមាតិកា
- យល់ពីការកែលម្អដែលបានធ្វើទៅលើឯកសារមានស្រាប់
- តាមដានការជួសជុលកំហុស និងការកែតម្រូវដើម្បីធានាការត្រឹមត្រូវ
- តាមដានការវិវឌ្ឍន៍នៃសម្ភារៈការសិក្សាផ្សេងៗឆ្លងកន្លែងពេលវេលា

## លទ្ធផលការសិក្សា

បន្ទាប់ពីពិនិត្យមើលចំណុចក្នុងកំណត់ផ្លាស់ប្តូរ អ្នកនឹងអាច:
- សម្គាល់មាតិកា និងធនធានថ្មីៗដែលមានសម្រាប់ការសិក្សា
- យល់ថាផ្នែកណាដែលត្រូវបានអាប់ដេត ឬបានកែលម្អ
- រៀបចំផែនការសិក្សារបស់អ្នកដោយផ្អែកលើសម្ភារៈដែលទាន់សម័យបំផុត
- ចូលរួមផ្តល់មតិយោបល់ និងយោបល់សម្រាប់ការកែលម្អអនាគត

## ប្រវត្តិកំណែ

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**កំណែនេះបិទរាល់ចន្លោះកម្រិតមធ្យមដែលនៅសល់ដែលបានរកឃើញដោយការវិភាគ azd-coverage៖ របៀបទ្រង់ទ្រាយការនិពន្ធ និងបោះពុម្ពផ្សាយតំបន់ពុម្ពរបស់អ្នកเอง, បរិយាកាស dev-container/Codespaces ที่អាចធ្វើឡើងឡើងវិញបាន, ផ្តល់កំណត់ដោយ Pulumi, ការដើរតាម Azure DevOps CI/CD, អត្តសញ្ញាណ service-principal, ការណែនាំបម្រើទឹកដី (AKS/Spring Apps), ការពន្យល់អំពី `azd restore`/`azd package`, ការដោះស្រាយកំហុស hook, និងបទប្បញ្ញត្តិពាក់ព័ន្ធក្រុម/បរិយាកាសចែករំលែក។**

#### Added
- **🧱 មេរៀនជំពូក 4 ថ្មី** `docs/chapter-04-infrastructure/custom-templates.md` — និពន្ធទំរង់ azd ផ្ទាល់របស់អ្នក: រចនាសម្ព័ន្ធដែលត្រូវការ (`azure.yaml`, `infra/`, `src/`), វាល `metadata.template`, ការបម្លែងប៉ារ៉ាម៉ែត្រ infrastructure ដោយប្រើ token វធ resource `uniqueString()` និង tag `azd-env-name`, សាកល្បងក្នុងកុំព្យូទ័រពីរម៉ោងជាមួយ `azd init --template <local-path>`, បោះពុម្ពផ្សាយទៅ GitHub, និងដាក់ស្នើទៅក្រឡាពីរ Awesome AZD
- **📦 មេរៀនជំពូក 1 ថ្មី** `docs/chapter-01-foundation/dev-containers.md` — បរិយាកាស azd ដែលអាចធ្វើឡើងឡើងវិញដោយប្រើ Dev Containers និង GitHub Codespaces: `.devcontainer/devcontainer.json` ប минимальный ដែលប្រើមុខងារ​ផ្លូវការ `ghcr.io/azure/azure-dev/azd`, មុខងារ​ក្នុងភាសាផ្សេងៗ, `docker-in-docker` សម្រាប់ម៉ាស៊ីនដំណើរការ container, និង `azd auth login --use-device-code` សម្រាប់ចុះឈ្មោះពីចម្ងាយ
- **🧩 Pulumi with azd** ផ្នែកនៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, លក្ខខណ្ឌថតថ្ម Pulumi, stacks ដែលផែនទីទៅតាមបរិយាកាស azd, outputs/tagging ដែលត្រូវការ, និង workflow `azd up` / `azd down` ដដែល
- **🎯 ការណែនាំសម្រាប់ជ្រើសរើស host** នៅក្នុង `docs/chapter-04-infrastructure/provisioning.md` — ការ​ពិភាក្សាដល់អ្នកចាប់ផ្ដើម ដោយប្រៀបធៀប `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, និង `springapp`, ជាមួយនឹងការណែនាំពេលណានឹងជ្រើស AKS ឬ Azure Spring Apps
- **🛠️ ការដើរតាម Azure DevOps CI/CD** នៅក្នុង `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection ជាមួយ workload identity federation (OIDC), `azure-dev.yml` ដែលបានបង្កើត, និងការកំណត់ variable-group
- **🔑 Service Principals (Pattern 4)** ត្រូវបានបន្ថែមទៅ `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` ដោយមិនបញ្ចូលអន្តរកម្មជាមួយ client secret ទល់នឹង credential federated/OIDC, ពេលណានឹងប្រើ, និងវិធីរក្សាទុកពាក្យសម្ងាត់យ៉ាងសុវត្ថិភាព
- **🪝 ការដោះស្រាយកំហុស hook** subsection នៅក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes និង `set -e`, `continueOnError`, សាកល្បង hooks ផ្ទាល់ដោយ `azd hooks run`, shells ដែលពិសេសសម្រាប់ប្រព័ន្ធប្រតិបត្តិការ, និង `--debug`
- **👥 ក្រុម / បរិយាកាសចែករំលែក** ផ្នែកនៅក្នុង `docs/chapter-03-configuration/configuration.md` — អ្វីដែលនៅក្នុង `.azure/`, ត្រូវ gitignore អ្វី, បរិយាកាសនៃអ្នកអភិវឌ្ឍន៍ជាក់លាក់, `azd env list`/`select`, និងការផ្តល់តម្លៃបរិយាកាសក្នុង CI/CD
- **🧰 ការពន្យល់អំពី `azd restore` និង `azd package` ដែលបានពង្រីក** នៅក្នុង `resources/cheat-sheet.md` — ការដំណើរការវិញ dependencies និងការកសាងឯកសារដែលអាចdeploy ដោយគ្មានការដាក់ពាក្យព្រឹត្តិការណ៍

#### Changed
- **🧭 តារាងមេរៀនជំពូក 4** ត្រូវបានអាប់ដេតដើម្បីរួមបញ្ចូលមេរៀនថ្មី "Authoring Your Own Template" (មេរៀន 3)
- **🧭 តារាងមេរៀនជំពូក 1** ត្រូវបានអាប់ដេតដើម្បីរួមបញ្ចូលមេរៀនថ្មី "Dev Containers & Codespaces" (មេរៀន 5); footer នាវីហ្គេសិនភ្ជាប់រវាង `bring-your-own-app.md` និង `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**កំណែនេះបិទចន្លោះធំបំផុតសម្រាប់មាគ៌ាសម្រាប់អ្នកចាប់ផ្ដើមដោយបន្ថែមពីរមេរៀនហត្ថករ (multi-agent ដែលអាច deploy បាន និងការបន្ថែម azd ទៅក្នុងកម្មវិធីមាន s) ការណែនាំ hooks សម្រាប់អ្នកចាប់ផ្ដើម, ផ្នែក Terraform ជាមួយ azd, ផ្លូវដំណើរការជំហានទៅ GitHub Actions pipeline, ការពន្យល់ពីពង្រីក preview ថ្មីៗ, និងបញ្ជីត្រួតពិនិត្យសម្រាប់បញ្ចៀសការដាក់ពាក្យ។**

#### Added
- **🤝 មេរៀនជំពូក 5 ថ្មី** `docs/chapter-05-multi-agent/multi-agent-basics.md` — មេរៀនជាការអនុវត្តពេញលេញដែលអាច deploy បានពីរប្រភេទ agent (orchestrator + specialists) ប្រើ template លំនាំពិត `contoso-creative-writer`, គ្របដណ្តប់ពីពេលណាដើម្បីប្រើ multi-agent, workflow `azd up`, យល់ពីធនធានដែលបាន deploy, ការតាមដានចម្រុះចម្ងាយរវាង agent, ការប្តូរ និងការសម្អាត
- **📦 មេរៀនជំពូក 1 ថ្មី** `docs/chapter-01-foundation/bring-your-own-app.md` — របៀបបន្ថែម azd ទៅក្នុងគម្រោងមានស្រាប់ជាមួយ `azd init` ("use code in the current directory"), យល់អំពី `azure.yaml` និង `infra/`, `azd infra generate`, ការរក host ដោយស្វ័យប្រវត្តិ, និងការដាក់ដោយ `azd up`
- **🌐 Terraform ជាមួយ azd** ផ្នែកបានបន្ថែមទៅ `docs/chapter-04-infrastructure/provisioning.md` — កំណត់ `infra.provider: terraform`, រចនាសម្ព័ន្ធថត `.tf`, outputs `AZURE_*` ដែលត្រូវការ និង tagging `azd-env-name`, និង workflow `azd up` / `azd down` ដដែល (បិទចន្លោះដែលច្រើនលើសន្មត់ថាគាំទ្រ Terraform ប៉ុន្តែបានបង្ហាញតែ Bicep)
- **⚙️ ជំហានជាជំហាន GitHub Actions walkthrough** នៅក្នុង `docs/chapter-08-production/production-ai-practices.md` — ពី repo GitHub ទៅការដាក់ដោយស្វ័យប្រវត្តិ: `azd pipeline config`, អត្តសញ្ញាណ federated OIDC (គ្មានលេខសម្ងាត់ទុកឱ្យ), `azure-dev.yml` ដែលបានបង្កើត, និងការណែនាំ secret ទល់ variable
- **🪝 ការណែនាំ "ថ្មីចំពោះ hooks?" សម្រាប់អ្នកចាប់ផ្ដើម** នៅក្នុង `docs/chapter-04-infrastructure/deployment-guide.md` — hook ជាអ្វី, តារាងដំណាក់កាល hook, hook ដំបូងតិចតួច, និងរបៀបរត់ hooks ដោយដៃជាមួយ `azd hooks run`
- **✅ បញ្ជី "Verify Your Deployment"** ត្រូវបានបន្ថែមទៅជំហាន 5 នៃ `docs/chapter-01-foundation/first-project.md` — សាកល្បង smoke test, ពិនិត្យ health-endpoint, និងលក្ខណៈជោគជ័យដែលបានកំណត់យ៉ាងច្បាស់
- **🧩 ពន្យល់អំពីពង្រីក preview ថ្មីៗ** `azure.ai.skills` និង `azure.ai.connections` (អ្វីដែលពួកវា និងពេលណាគួរតែប្រើ) នៅក្នុង `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 តារាងមេរៀនជំពូក 5** ត្រូវបានកែតម្រឹម៖ `multi-agent-basics.md` ក្លាយជា មេរៀន 1 ទៅហើយ (មេរៀនតែមួយដែលជាការអនុវត្តពេញលេញ), ដោយបញ្ចាក់យ៉ាងสัตย์ថា មេរៀន 2 ស្ថិតនៅក្នុងជំពូក 6 និងសេណារីយោ Retail គឺជាគម្រោងស្ថាបត្យកម្មមិនមែនជា template មួយ-ពាក្យ
- **🧭 តារាងមេរៀនជំពូក 1** ឥឡូវរួមបញ្ចូលមេរៀនថ្មី "Bring Your Own App" (មេរៀន 4)
- **🔗 Footer នាវីហ្គេសិន** បានអាប់ដេត: `first-project.md` ឥឡូវភ្ជាប់ទៅ `bring-your-own-app.md`

#### Fixed
- **🧱 បិទចន្លោះ "បានឲ្យប៉ុន្តែមិនមាន" សម្រាប់ Terraform** — មុខវិជ្ជាលំនៅមុនបានយោងទៅការគាំទ្រ Terraform ប៉ុន្តែមិនបានបង្ហាញវា
- **🔀 កែតម្រឹមតំណភ្ជាប់ឆ្លើយឡើងជំពូក 5** ដែលបានបង្កើតការយល់ច្រឡំថាការអនុវត្ត multi-agent ពេញលេញមាន ពេលដែលមានតែផែនការស្ថាបត្យកម្មប៉ុណ្ណោះ

#### Files Updated
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**កំណែនេះបានធ្វើការផ្ទៀងផ្ទាត់វគ្គសិក្សាម្តងទៀតជាមួយ `azd` `1.25.6` (មិថុនា 2026) និងពង្រីក `azure.ai.agents` `0.1.40-preview` extension, បន្ថែមការណែនាំ AI ពី "scaffold an agent" ទៅដល់ជីវវិទ្យាអាជីវកម្ម agent ពេញលេញ (test → evaluate → optimize → inspect → delete), លេចធ្លោពង្រីក preview ថ្មី `azure.ai.skills` និង `azure.ai.connections`, និងកត់សម្គាល់ពី rebrand ".NET Aspire" → "Aspire"។**

#### Added
- **🔁 ការអធិប្បាយជីវវដ្ដ agent ពេញលេញ** សម្រាប់អ្នកចាប់ផ្ដើម និងវិស្វករអំពី AI ទូទាំងឯកសារ:
  - `docs/chapter-01-foundation/azd-basics.md` — តារាងជីវវដ្ដ (scaffold → test → measure → improve → inspect → clean up) បានបន្ថែមទៅផ្នែក Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — ផ្នែកថ្មី "Managing the Agent Lifecycle" គ្របដណ្តប់ `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
  - `resources/cheat-sheet.md` — ពង្រីកអំពី AI Agent Commands ជាមួយ `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, និង `delete --force`
- **🧩 ពង្រីក preview extensions ថ្មី** បានចុះបញ្ជី៖ `azure.ai.skills` (ជំនាញ agent ដែលអាចប្រើឡើងវិញ) និង `azure.ai.connections` (Foundry connections) បានបន្ថែមទៅតារាង extensions និង cheat sheet
- **⏱️ ការណែនាំពាក់ព័ន្ធពេលចម្លើយ** — ឧទាហរណ៍ `azd ai agent invoke` ឥឡូវបញ្ជាក់ថាវាមានការបោះពុម្ព latency សរុប និង time-to-first-byte
- **📌 ប័ណ្ណកំណែ** នៅ README រោម ដែលបង្ហាញអ្នករៀនទៅកាន់ `azd version` និង `azd upgrade`

#### Changed
- **✅ មូលដ្ឋានត្រួតពិនិត្យបានអាប់ដេត** ពី `azd 1.23.12` (មីនា 2026) ទៅ `azd 1.25.6` (មិថុនា 2026) ក្នុង README នៃជំពូកទាំងអស់ និងឯកសារ workshop
- **🤖 កំណត់សម្គាល់ extension ជំពូក 2** បានប្រែពី `azure.ai.agents` `0.1.18-preview` ទៅ `0.1.40-preview`
- **🧪 ឧទាហរណ៍ត្រួតពិនិត្យ workshop** (`azd version` output) បានអាប់ដេតទៅ `1.25.6`
- **🧭 README "What's New in azd Today"** បានបន្ថែមព័ត៌មានថ្មីៗអំពីជីវវដ្ដ agent ពេញលេញ, preview AI extensions, និងការកែលម្អគុណភាពជាច្រើន (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** ឥឡូវបង្ហាញអ្នករៀនទៅកាន់ពាក្យបញ្ជាជីវវដ្ដក្រោយ deploy ជាយូរមិនឲ្យធ្វើត្រឹម `azd up` តែប៉ុណ្ណោះ

#### Fixed
- **🏷️ ឈ្មោះផលិតផល** — បានបន្ថែមកំណត់សម្គាល់ rebrand Aspire (".NET Aspire" ឥឡូវគឺ "Aspire" ប៉ុណ្ណោះ); ការគាំទ្រ Aspire របស់ azd មិនមានការផ្លាស់ប្ដូរឡើយ
- **🔎 ការផ្ទៀងផ្ទាត់ចេញផ្សាយរស់** បានធ្វើយល់ព្រមតាម feed ចេញផ្សាយ Azure Developer CLI: stable CLI `1.25.6` (2026-06-12) និង `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Files Updated
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
#### ការបញ្ជាក់សម្រាប់ការណែនាំអ្នកចាប់ផ្តើម, ការផ្ទៀងផ្ទាត់ការតំឡើង និងការសម្អាតពាក្យបញ្ជ AZD ចុងក្រោយ
**កំណែនេះ តែgteបន្តពីការត្រួតពិនិត្យ AZD 1.23 ដោយផ្តល់ការពន្យល់ឱ្យច្បាស់ពីការផ្ដល់អាទិភាពការផ្ទៀងផ្ទាត់កំណត់សិទ្ធិដោយប្រើ AZD ជាមុន, បន្ថែមស្គ្រីបសម្រាប់ផ្ទៀងផ្ទាត់ការតំឡើងក្នុងម៉ាស៊ីនមូលដ្ឋាន, ផ្ទៀងផ្ទាត់ពាក្យបញ្ជាសំខាន់ៗជាមួយ AZD CLI តាមអនឡាញ, និងយកចេញយោងពាក្យបញ្ជាភាសាអង់គ្លេសចុងក្រោយដែលចាស់ឆ្ងាយនៅខាងក្រៅ changelog។**

#### Added
- **🧪 ស្គ្រីបផ្ទៀងផ្ទាត់ការតំឡើងសម្រាប់អ្នកចាប់ផ្តើម** ជាមួយ `validate-setup.ps1` និង `validate-setup.sh` ដើម្បីឱ្យអ្នករៀនអាចបញ្ជាក់ឧបករណ៍ដែលត្រូវការប្រមាណមុនចាប់ផ្តើមជាផ្នែកទី 1
- **✅ ជំហានផ្ទៀងផ្ទាត់ការតំឡើងនៅខាងមុខ** នៅក្នុង README រុក្ខហណ្ណនិង README ផ្នែកទី 1 ដើម្បីឱ្យអ្វីដែលខ្វះលក្ខខណ្ឌត្រូវបានចាប់បានមុន `azd up`

#### Changed
- **🔐 ការណែនាំអំពីការផ្ទៀងផ្ទាត់សុសន្ធិសម្រាប់អ្នកចាប់ផ្តើម** ឥឡូវនេះ ធ្វើឱ្យ `azd auth login` ត្រូវបានគេលើកទឹកចិត្តជាទំរង់សំខាន់សម្រាប់ផ្លូវការងារ AZD ហើយ `az login` ត្រូវបានរាប់ថាជាជម្រើសលើកលែងតែប្រើពាក្យបញ្ជ Azure CLI ដោយផ្ទាល់
- **📚 ស្ទ្រីមការណែនាំផ្នែកទី 1** ឥឡូវនេះ ណែនាំឱ្យអ្នករៀនផ្ទៀងផ្ទាត់ការតំឡើងសុទ្ទិធមុនការតំឡើង ការផ្ទៀងផាត់សិទ្ធិ និងជំហានដំណើរការដំបូង
- **🛠️ សារ Validator** ឥឡូវនេះ បំបែកយ៉ាងច្បាស់ចន្លោះលក្ខខណ្ឌរារាំង និងការព្រមាន Azure CLI ជាជម្រើសសម្រាប់ផ្លូវ AZD មួយដែលផ្តោតលើអ្នកចាប់ផ្តើម
- **📖 ឯកសារការកំណត់ខាងលើ, ការដោះស្រាយបញ្ហា, និងឧទាហរណ៍** ឥឡូវនេះ បែងចែកច្បាស់រវាងការផ្ទៀងផ្ទាត់សិទ្ធិ AZD ដែលចាំបាច់ និងការចុះឈ្មោះ Azure CLI ជាជម្រើស នៅពេលដែលពីរបានបង្ហាញដោយគ្មានបរិបទពីមុន

#### Fixed
- **📋 យោងពាក្យបញ្ជាភាសាអង់គ្លេសដែលនៅសល់** ត្រូវបានអាប់ដេតទៅទម្រង់ AZD ទាន់សម័យ រួមមាន `azd config show` នៅក្នុង cheat sheet និង `azd monitor --overview` ដែលត្រូវគោលបំណងផ្តល់ការយល់ឃើញពី Azure Portal
- **🧭 សេចក្តីប្រកាសសម្រាប់អ្នកចាប់ផ្តើមនៅផ្នែកទី 1** បានសម្រួលឱ្យទាបដើម្បីចៀសវាងការអះអាងពេកអំពីការធានាថា​គ្មានកំហុសឬអាច rollback បានសម្រាប់គម្រប់ទាំងមូលនៃទំរង់ និងធនធាន Azure ទាំងអស់
- **🔎 ការផ្ទៀងផ្ទាត់ CLI តាមអនឡាញ** បានបញ្ជាក់ថាគាំទ្របច្ចុប្បន្នសម្រាប់ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, និង `azd down --force --purge`

#### Files Updated
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

#### ការផ្ទៀងផ្ទាត់ AZD 1.23.12, ការពង្រីកបរិយាកាសសិក្សាផ្ទាល់ និងការសម្រួលបំណួររបស់ម៉ូដែល AI
**កំណែនេះ ធ្វើការត្រួតពិនិត្យឯកសារទាំងមូលប្រឆាំងនឹង `azd` `1.23.12`, បន្ទាន់សម័យឧទាហរណ៍ពាក្យបញ្ជា AZD ដែលចាស់, បន្ថែមការណែនាំម៉ូដែល AI ទៅទៅលំនាំដើមបច្ចុប្បន្ន, ហើយពង្រីកនីតិវិធីសិក្សាឲ្យគាំទ្រ GitHub Codespaces បន្ថែម dev containers និងក្លូនក្នុងស្រុក។**

#### Added
- **✅ កំណត់សម្គាល់ការផ្ទៀងផ្ទាត់នៅអំពីខែ​បឋម និងឯកសារ​ហាត់ការមូលដ្ឋាន** ដើម្បីធានាថាមូលបរិមាណ AZD ដែលត្រូវបានតេស្តមានភាពច្បាស់សម្រាប់អ្នករៀនដែលប្រើរចនាសម្ព័ន្ធ CLI ថ្មីឬចាស់
- **⏱️ ការណែនាំអំពីពេលកំណត់សម្រាប់ការដាក់បង្ហាញ** សម្រាប់ការដាក់បង្ហាញកម្មវិធី AI ដែលរយៈពេលយូរ ដោយប្រើ `azd deploy --timeout 1800`
- **🔎 ជំហានពិនិត្យបន្ថែមសម្រាប់ផ្នែក extension** ជាមួយ `azd extension show azure.ai.agents` ក្នុងឯកសារការងារ AI
- **🌐 ការណែនាំបរិយាកាសសិក្សាវាលទូលំទូលាយ** គ្របដណ្តប់ GitHub Codespaces, dev containers, និងក្លូនក្នុងស្រុកជាមួយ MkDocs

#### Changed
- **📚 README អំពីបញ្ចូលជាផ្នែកដំបូង** ឥឡូវនេះ សម្គាល់ការផ្ទៀងផ្ទាត់ប្រឆាំង `azd 1.23.12` នៅក្នុងផ្នែកមូលដ្ឋាន ការកំណត់ខ្លឹមសារ ស្ថាប័ន ម៉ុលទី-អេជិន និងផ្នែកផ្សេងៗ
- **🛠️ យោងពាក្យបញ្ជា AZD** ត្រូវបានអាប់ដេតទៅទម្រង់បច្ចុប្បន្ននៅក្នុងឯកសារ:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ឬ `azd env get-value(s)` អាស្រ័យលើបរិបទ
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` នៅពេលដែលមានបំណងផ្តល់ទិដ្ឋភាពទូទៅ Application Insights
- **🧪 ឧទាហរណ៍ provision preview** ត្រូវបានសម្រួលទៅការប្រើប្រាស់ដែលគាំទ្របច្ចុប្បន្ន ដូចជា `azd provision --preview` និង `azd provision --preview -e production`
- **🧭 ផ្លូវការបង្រៀនសិក្សា** បានប្ដូរឱ្យអោយអ្នករៀនអាចបញ្ចប់ប្រតិបត្តិការបង្រៀននៅ Codespaces, dev container, ឬក្លូនក្នុងស្រុក មិនចាំបាច់តែ Codespaces តែម្ដងទេ
- **🔐 ការណែនាំសុស័ទិ្ឋ** ឥឡូវនេះ លើកទឹកចិត្ត `azd auth login` សម្រាប់ផ្លូវការងារ AZD ជាចម្បង មាន `az login` ជាជម្រើសនៅពេលប្រើពាក្យបញ្ជា Azure CLI ដោយផ្ទាល់

#### Fixed
- **🪟 ពាក្យបញ្ជាតំឡើង Windows** បានធ្វើឱ្យផ្គូផ្គងទៅនឹងការប្រើករណីអក្សរ `winget` នៅក្នុងមគ្គុទេសក៍តំឡើង
- **🐧 ការណែនាំដល់ Linux** ត្រូវបានកែតម្រូវ ដើម្បីជៀសវាងនីតិវិធីមិនគាំទ្រពី distro ផ្សេងៗសម្រាប់ package manager `azd` ហើយបញ្ជូនទៅកាន់ release assets ប្រសិនបើចាំបាច់
- **📦 ឧទាហរណ៍ម៉ូដែល AI** បានបន្ទាន់សម័យពីលំនាំចាស់ដូចជា `gpt-35-turbo` និង `text-embedding-ada-002` ទៅឧទាហរណ៍បច្ចុប្បន្នដូចជា `gpt-4.1-mini`, `gpt-4.1`, និង `text-embedding-3-large`
- **📋 កូដស្នូបសម្រាប់ដាក់បង្ហាញ និងវាយតម្លៃ** បានកែតម្រូវឱ្យប្រើពាក្យបញ្ជា environment និង status បច្ចុប្បន្នក្នុងកំណត់ហេតុនិងស្គ្រីប
- **⚙️ ការណែនាំ GitHub Actions** បានបន្ទាន់សម័យពី `Azure/setup-azd@v1.0.0` ទៅ `Azure/setup-azd@v2`
- **🤖 ការណែនាំ MCP/Copilot consent** បានផ្លាស់ពី `azd mcp consent` ទៅ `azd copilot consent list`

#### Improved
- **🧠 ការណែនាំផ្នែក AI** ឥឡូវនេះ ពន្យល់បានល្អជាងមុនអំពីឥរិយាបថ `azd ai` ដែលនៅក្នុងជំហាន preview, ការ​ចុះ​ឈ្មោះតាម tenant, ការ​ប្រើ extension បច្ចុប្បន្ន, និងការណែនាំក្នុងការដាក់ម៉ូដែល
- **🧪 វិធីសាស្រ្តហាត់សិក្សា** ឥឡូវនេះ ប្រើឧទាហរណ៍កំណែដែលមានភាពស្ថិតស្ថេរ និងភាសារយៈពេលសំរាប់ករណីដៃគូសម្រាប់ហត្ថកម្ម
- **📈 ឯកសារផលិតកម្ម និងដោះស្រាយបញ្ហា** ឥឡូវនេះ សម្របសម្រួលជាមួយការតាមដាន បម្រុងចុកម៉ូដែល និងឧទាហរណ៍កម្រិតថ្លៃដើម

#### Files Updated
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

#### ពាក្យបញ្ជា AZD AI CLI, ការផ្ទៀងផ្ទាត់ខ្លឹមសារ និងការពង្រីកទំរង់ទំព័រ
**កំណែនេះ បានបន្ថែមការគ្របដណ្តប់ `azd ai`, `azd extension`, និង `azd mcp` លើឯកសារទាំងអស់ដែលទាក់ទងនឹង AI, ជួសជុលតំណភ្ជាប់ខូច និងកូដដែលលែងប្រើ, ពង្រឹង cheat sheet, និងរូបមន្ត Example Templates ជាមួយការពិពណ៌នាដែលបានផ្ទៀងផ្ទាត់ និងទំរង់ AZD Azure AI ថ្មីៗ។**

#### Added
- **🤖 ការគ្របដណ្តប់ AZD AI CLI** នៅក្នុង 7 ឯកសារ (មុននេះមានតែក្នុង ផ្នែកទី 8 ទេ):
  - `docs/chapter-01-foundation/azd-basics.md` — ផ្នែក "Extensions and AI Commands" ថ្មី ដែលណែនាំ `azd extension`, `azd ai agent init`, និង `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ជម្រើសទី 4: `azd ai agent init` ជាមួយតារាងប្រៀបធៀប (ទំរង់ template ប្រឆាំង manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — ដំណាក់កាល "AZD Extensions for Foundry" និង "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ថែមទាំងបង្ហាញផ្លូវដំណើរការ deployment ទាំងពីរជាមូលដ្ឋាន template និង manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ផ្នែក Deploy ឥឡូវនេះ រួមបញ្ចូលជម្រើស `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ផ្នែក "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — ផ្នែក "AI & Extensions Commands" ថ្មី ដែលមាន `azd extension`, `azd ai agent init`, `azd mcp`, និង `azd infra generate`
- **📦 ឧទាហរណ៍ AZD AI ថ្មីៗ** នៅក្នុង `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — បក្សចរចារប្រើ .NET RAG ជាមួយ Blazor WebAssembly, Semantic Kernel, និងការគាំទ្រអារម្មណ៍សម្លេង
  - **azure-search-openai-demo-java** — ចរចារ Java RAG ប្រើ Langchain4J ជាមួយជម្រើស ACA/AKS សម្រាប់ដាក់បង្ហាញ
  - **contoso-creative-writer** — កម្មវិធីសរសេរច្រើនភ្នាក់ងារសម្រាប់ការសរសេរច្នៃប្រឌិតប្រើ Azure AI Agent Service, Bing Grounding, និង Prompty
  - **serverless-chat-langchainjs** — RAG មិនមានស៊ើវើរ (serverless) បង្ហាញដោយ Azure Functions + LangChain.js + Cosmos DB ជាមួយការគាំទ្រ Ollama សម្រាប់ dev ក្នុងស្រុក
  - **chat-with-your-data-solution-accelerator** — ល្បឿនរហ័ស RAG សម្រាប់អង្គភាពធំ មានផ្ទាំងគ្រប់គ្រង admin, ថ្នាក់ក្រុម Teams, និងជម្រើស PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — កម្មវិធីយោង MCP បើកចMultiple-agent ជាមួយសេវាកម្មនៅ .NET, Python, Java, និង TypeScript
  - **azd-ai-starter** — សូម្បីសន្លឹក Bicep ចាប់ផ្តើមសម្រាប់មូលដ្ឋានAzure AI
  - **🔗 Awesome AZD AI Gallery link** — យោងទៅកាន់ [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 នាវីហ្គេស៊ីយ៉ុង agents.md**: តំណ Previous/Next ឥឡូវនេះ ត្រូវគ្នានឹងលំដាប់មេរៀន README លើ ផ្នែក 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 តំណខូចក្នុង agents.md**: `production-ai-practices.md` បានកែតទៅ `../chapter-08-production/production-ai-practices.md` (3 កន្លែង)
- **📦 កូដដែលចាស់ក្នុង agents.md**: បានជំនួស `opencensus` ជាមួយ `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API មិនត្រឹមត្រូវក្នុង agents.md**: បានប្តូរឳ្យផ្ទេរ `max_tokens` ពី `create_agent()` ទៅ `create_run()` ជា `max_completion_tokens`
- **🔢 ការ​គណនា token ក្នុង agents.md**: បានប្ដូរជំនាន់គណនា លាប粗 approximations `len//4` ទៅ `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: បានកែសេវាកម្មពី "Cognitive Search + App Service" ទៅ "Azure AI Search + Azure Container Apps" (ម៉ាស៊ីន хost លំនាំដើមបានប្ដូរនៅខែតុលា 2024)
- **contoso-chat**: បានបន្ទាន់សម័យការពិពណ៌នាឱ្យសមនឹង Azure AI Foundry + Prompty ដែលផ្គូផ្គងនឹងចំណងជើង និងស្ទាក់បច្ចេកទេសរបស់ repo

#### Removed
- **ai-document-processing**: លុបយោងទៅកាន់ទំរង់ដែលមិនដំណើរការ (repo មិនបើកសាធារណៈជាអ្នកផ្គត់ផ្គង់ AZD template)

#### Improved
- **📝 ការហាត់ក្នុង agents.md**: វិហារ 1 ឥឡូវបង្ហាញលទ្ធផលដែលរំពឹងទាន និងជំហាន `azd monitor`; វិហារ 2 រួមបញ្ចូលកូដការចុះឈ្មោះ `FunctionTool` ពេញលេញ; វិហារ 3 បានប្ដូរជាមុខងារប្រកបដោយប្រយោជន៍ជាមួយបញ្ជាកម្ម `prepdocs.py` ដែលច្បាស់លាស់
- **📚 ប្រភពនៅ agents.md**: បានបន្ទាន់សម័យតំណឯកសារ​ទៅឯកសារដ៏ទាន់សម័យរបស់ Azure AI Agent Service និង quickstart
- **📋 តារាង Next Steps នៅ agents.md**: បានបន្ថែមតំណ AI Workshop Lab សម្រាប់គម្រប់ការបណ្ដុះបណ្ដាលផ្នែកទាំងមូល

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Course Navigation Enhancement
**កំណែនេះបង្កើនភាពល្អប្រសើរ​ក្នុងការរុករកជំពូក README.md ដោយមានទ្រង់ទ្រាយតារាងដែលបានបង្រួមប្រសើរឡើង។**

#### ផ្លាស់ប្ដូរ
- **Course Map Table**: បានបង្រួមប្រសើរទៅជាមួយតំណភ្ជាប់ថ្នាក់នៅផ្ទាល់ ទំហំនៃរយៈពេលដែលបានអាប់ពេញ និងការវាយតម្លៃភាពស្មុគស្មាញ
- **Folder Cleanup**: លុបថតចាស់ដែលច្រើនซ้ำ (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: បានផ្ទៀងផ្ទាត់តំណភ្ជាប់ក្នុងសំណុំ Course Map ទាំងអស់ 21+ យ៉ាងត្រឹមត្រូវ

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**កំណែនេះបានធ្វើបច្ចុប្បន្នភាពយោងផលិតផលទៅតាមម៉ាក Microsoft បច្ចុប្បន្ន។**

#### ផ្លាស់ប្ដូរ
- **Microsoft Foundry → Microsoft Foundry**: យោងទាំងអស់ត្រូវបានបច្ចុប្បន្នភាពនៅសូព័ណ្ណឯកសារមិនមែនសម្រាប់ការបកប្រែ
- **Azure AI Agent Service → Foundry Agents**: ឈ្មោះសេវាកម្មត្រូវបានធ្វើបច្ចុប្បន្នភាពដើម្បីផ្ទៀងផ្ទាត់ម៉ាកបច្ចុប្បន្ន

#### ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាព
- `README.md` - ទំព័រចាប់ផ្តើមសម្រាប់វគ្គសិក្សា
- `changelog.md` - ប្រវត្តិការប្រែប្រួលកំណែ
- `course-outline.md` - រចនាសម្ព័ន្ធវគ្គសិក្សា
- `docs/chapter-02-ai-development/agents.md` - មគ្គុទេសក៍អំពី AI agents
- `examples/README.md` - ឯកសារដាក់ឧទាហរណ៍
- `workshop/README.md` - ទំព័រសិក្សាកម្មវិធីសិក្សា (workshop)
- `workshop/docs/index.md` - ព័ត៌មានសូម្បីសាជីភាព workshop
- `workshop/docs/instructions/*.md` - គ្រប់ឯកសារណែនាំ​ workshop

---

### [v3.15.0] - 2026-02-05

#### ការ​ប្ដូររចនាសម្ព័ន្ធ仓រRepository យ៉ាងធំ៖ ឈ្មោះថតតាមជំពូក
**កំណែនេះបានរៀបចំឯកសារជាថតជំពូកដែលមានឈ្មោះច្បាស់សម្រាប់ការរុករកប្រសើរឡើង។**

#### ការ​ប្ដូរឈ្មោះថត
ថតចាស់ៗត្រូវបានជំនួសដោយថតដែលមានលេខជំពូក៖
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### ដំណើរការ​ផ្ទេរឯកសារ
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### បានបន្ថែម
- **📚 ផ្ទាំង README បច្ចេកទេសសម្រាប់ជំពូក**: បានបង្កើត README.md នៅក្នុងថតជំពូកនីមួយៗ ដែលមាន៖
  - គោលបំណងនៃការសិក្សា និងរយៈពេល
  - តារាងមេរៀនជាមួយការពិពណ៌នា
  - ពាក្យបញ្ជាចាប់ផ្តើមឆាប់ៗ
  - ការរុករកទៅកាន់ជំពូកផ្សេងៗ

#### ផ្លាស់ប្ដូរ
- **🔗 បានបច្ចុប្បន្នភាពតំណភ្ជាប់ផ្ទុកក្នុងស្រុកទាំងអស់**: បានបច្ចុប្បន្នភាពផ្លូវ 78+ នៅក្នុងឯកសារទាំងអស់
- **🗺️ README.md ដើម**: បានបច្ចុប្បន្នភាព Course Map ជាមួយរចនាសម្ព័ន្ធជំពូកថ្មី
- **📝 examples/README.md**: បានបច្ចុប្បន្នភាពការចុះសម្គាល់ឆ្ពោះទៅថតជំពូក

#### បានលុប
- រចនាសម្ព័ន្ធថតចាស់ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ការ​ប្ដូររចនាសម្ព័ន្ធ仓រRepository៖ រុករកជំពូក
**កំណែនេះបានបន្ថែមឯកសារ README នាវីហ្គេសិនរបស់ជំពូក (បានជំរុញដោយ v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### មគ្គុទេសក៍ AI Agents ថ្មី
**កំណែនេះបានបន្ថែមមគ្គុទេសក៍ពេញលេញសម្រាប់ការបញ្ចូល AI agents ជាមួយ Azure Developer CLI។**

#### បានបន្ថែម
- **🤖 docs/microsoft-foundry/agents.md**: មគ្គុទេសក៍ពេញលេញដែលគ្របដណ្តប់៖
  - Agents AI ជាអ្វី និងវាផ្សេងពី chatbots យ៉ាងដូចម្តេច
  - គំរូ agent ចាប់ផ្តើមរហ័សបីយ៉ាង (Foundry Agents, Prompty, RAG)
  - គំរូស្ថាបត្យកម្ម agent (single agent, RAG, multi-agent)
  - ការកំណត់Tool និងការប្ដូរតម្រូវការ
  - ការត្រួតពិនិត្យនិងតាមដានម៉េត្រីក
  - ការពិចារណាភាគចំណាយ និងការបង្កើនប្រសិទ្ធភាព
  - សេណារីយ៉ូ troubleshooting ទូទៅ
  - ការបង្រៀនអនុវត្តសំរាប់ដៃបីដែលមានលក្ខខណ្ឌជោគជ័យ

#### រចនាសម្ព័ន្ធមាតិកា
- **ការណែនាំ**: មេរៀនមូលដ្ឋានអំពីមាតិកា agent សម្រាប់អ្នកឈានដល់ចាប់ផ្តើម
- **Quick Start**: ដាក់បង្ហាញ agents ជាមួយ `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: រោងចក្រពិស្សេននៃគំរូ agent ជាច្រើន
- **Configuration**: ការកំណត់ឧបករណ៍ និងអថេរបរិស្ថាន
- **Monitoring**: ស៊ីហ្វូលកម្មវិធី Application Insights
- **Exercises**: មេរៀនអនុវត្តជាបន្តៗ (20-45 នាទីមួយ)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**កំណែនេះបានបច្ចុប្បន្នភាពការកំណត់ឧបករណ៍ development container ជាមួយឧបករណ៍ទំនើប និងចំណុចលំនាំល្អសម្រាប់បទពិសោធន៍ AZD។**

#### ផ្លាស់ប្ដូរ
- **🐳 Base Image**: បានបញ្ចូលពី `python:3.12-bullseye` ទៅ `python:3.12-bookworm` (Debian stable ចុងក្រោយ)
- **📛 Container Name**: បានប្ដូរឈ្មោះពី "Python 3" ទៅ "AZD for Beginners" ដើម្បីភាពច្បាស់លាស់

#### បានបន្ថែម
- **🔧 លក្ខណៈពិសេស Dev Container ថ្មី**:
  - `azure-cli` ជាមួយការគាំទ្រ Bicep បានបើកសកម្ម
  - `node:20` (LTS សម្រាប់ទំព័រ AZD)
  - `github-cli` សម្រាប់ការគ្រប់គ្រងទម្រង់
  - `docker-in-docker` សម្រាប់ការដាក់ដំណើរការ container app

- **🔌 Port Forwarding**: កំណត់ព្រិលលើកំពូលសម្រាប់អភិវឌ្ឍកម្មទូទៅ:
  - 8000 (ការមើលមុន MkDocs)
  - 3000 (គេហទំព័រ Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 ជាភាពបន្ថែម VS Code Extensions**:
  - `ms-python.vscode-pylance` - IntelliSense Python បានកែលម្អ
  - `ms-azuretools.vscode-azurefunctions` - ការគាំទ្រ Azure Functions
  - `ms-azuretools.vscode-docker` - ការគាំទ្រទៅ Docker
  - `ms-azuretools.vscode-bicep` - ការគាំទ្រភាសា Bicep
  - `ms-azure-devtools.azure-resource-groups` - ការគ្រប់គ្រងធនធាន Azure
  - `yzhang.markdown-all-in-one` - ការកែ markdown
  - `DavidAnson.vscode-markdownlint` - ការត្រួតពិនិត្យលក្ខណៈ markdown
  - `bierner.markdown-mermaid` - ការគាំទ្ររូបភាព Mermaid
  - `redhat.vscode-yaml` - ការគាំទ្រឯកសារ YAML (សម្រាប់ azure.yaml)
  - `eamodio.gitlens` - ការមើលឃើញ Git
  - `mhutchie.git-graph` - ប្រវត្តិ Git

- **⚙️ ការកំណត់ VS Code**: បានបន្ថែមការកំណត់លំនាំដើមសម្រាប់ interpreter Python, ការformatពេលរក្សាទុក, និងការលុបចោល whitespace

- **📦 Updated requirements-dev.txt**:
  - បានបន្ថែមផ្លugins MkDocs minify
  - បានបន្ថែម pre-commit សម្រាប់គុណភាពកូដ
  - បានបន្ថែមកញ្ចប់ Azure SDK (azure-identity, azure-mgmt-resource)

#### បានកែប្រែ
- **Post-Create Command**: ឥឡូវពិនិត្យការតំឡើង AZD និង Azure CLI នៅពេល container ចាប់ផ្តើម

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**កំណែនេះបានធ្វើឱ្យ README.md ងាយស្រួលសម្រាប់អ្នកចាប់ផ្ដើមយ៉ាងខ្លាំង និងបានបន្ថែមធនធានសំខាន់សម្រាប់អ្នកអភិវឌ្ឍ AI។**

#### បានបន្ថែម
- **🆚 Azure CLI vs AZD Comparison**: ការពិពណ៌នាច្បាស់ពីពេលណាត្រូវប្រើឧបករណ៍នីមួយៗជាមួយឧទាហរណ៍អនុវត្ត
- **🌟 Awesome AZD Links**: តំណភ្ជាប់ផ្ទាល់ទៅកាន់សាលក់ទម្រង់សហគមន៍ និងធនធានចូលរួម:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ទម្រង់ដែលអាចដាក់ដំណើរការបានភ្លាម
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - ដាក់ស្នើទម្រង់ទៅសហគមន៍
- **🎯 Quick Start Guide**: មេរៀនចាប់ផ្ដើមសាមញ្ញ 3 ជំហាន (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: គោលដៅច្បាស់លាស់ពីកន្លែងត្រូវចាប់ផ្ដើមដោយផ្អែកលើបទពិសោធន៍អ្នកអភិវឌ្ឍ

#### ផ្លាស់ប្ដូរ
- **រចនាសម្ព័ន្ធ README**: រៀបចំឡើងវិញសម្រាប់ការបង្ហាញពត៌មានជាដំណាក់កាល - ព័ត៌មានសំខាន់មុនទាំងអស់
- **ផ្នែកណែនាំ**: បានសរសេរឡើងវិញដើម្បីពន្យល់ "ចរិតអស្ចារ្យនៃ `azd up`" សម្រាប់អ្នកចាប់ផ្ដើមពេញលេញ
- **បានលុបមាតិកាដែលធ្លាប់កើតឡើងស្ទើរជាចម្លង**: បានដកចេញផ្នែក troubleshooting ដែលចម្លងកើតឡើង
- **ពាក្យបញ្ជា Troubleshooting**: បានកែ `azd logs` ឲ្យប្រើ `azd monitor --logs` ដែលត្រឹមត្រូវ

#### បានកែប្រែ
- **🔐 ការបញ្ជាអធិប្បាយអំពី authentication**: បានបន្ថែម `azd auth login` និង `azd auth logout` ទៅក្នុង cheat-sheet.md
- **យោងពាក្យបញ្ជាដែលមិនត្រឹមត្រូវ**: បានដក `azd logs` ដែលនៅសល់ពីផ្នែក troubleshooting របស់ README

#### កំណត់ចំណាំ
- **វិសាលភាព**: ការផ្លាស់ប្តូរត្រូវបានអនុវត្តទៅ README.md និង resources/cheat-sheet.md
- **ប្រភេទអ្នកដែលជាเป้าหมาย**: ការកែលម្អមានទិសដៅជាក់លាក់ទៅលើអ្នកអភិវឌ្ឍថ្មីៗចំពោះ AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**កំណែនេះបានកែឲ្យពាក្យបញ្ជារ AZD ដែលមិនមានក្នុងឧបករណ៍ទាំងឡាយព្រមទាំងធានាអោយគំរូកូដទាំងអស់ប្រើស័យវាក្សខល AZD ដែលត្រឹមត្រូវ។**

#### បានកែប្រែ
- **🔧 បានដកពាក្យបញ្ជារ AZD ដែលមិនមាន**: បានធ្វើការត្រួតពិនិត្យ និងកែប្រែពាក្យបញ្ជាដែលមិនត្រឹមត្រូវទាំងមូល:
  - `azd logs` (មិនមាន) → បានជំនួសដោយ `azd monitor --logs` ឬជម្រើស Azure CLI
  - `azd service` សាប់កមង់ (មិនមាន) → បានជំនួសដោយ `azd show` និង Azure CLI
  - `azd infra import/export/validate` (មិនមាន) → បានដកឬជំនួសដោយជម្រើសត្រឹមត្រូវ
  - តង់ប៊្លាអ្នកដាក់បញ្ជា `azd deploy --rollback/--incremental/--parallel/--detect-changes` (មិនមាន) → បានដកចេញ
  - `azd provision --what-if/--rollback` (មិនមាន) → បានបន្ទាន់សម័យទៅប្រើ `--preview`
  - `azd config validate` (មិនមាន) → បានជំនួសដោយ `azd config list`
  - `azd info`, `azd history`, `azd metrics` (មិនមាន) → បានដកចេញ

- **📚 ឯកសារដែលបានធ្វើបច្ចុប្បន្នភាពដោយការកែប្រែពាក្យបញ្ជា**:
  - `resources/cheat-sheet.md`: ការផ្លាស់ប្ដូរធំបំផុតនៃយោងពាក្យបញ្ជា
  - `docs/deployment/deployment-guide.md`: បានកែប្រែយុទ្ធសាស្ត្របញ្ឆោតនិងការដាក់ពាក្យបញ្ជា
  - `docs/troubleshooting/debugging.md`: បានកែប្រែផ្នែកវិភាគលាក
  - `docs/troubleshooting/common-issues.md`: បានបន្ថែមពាក្យបញ្ជា troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: បានកែប្រែផ្នែក debugging AZD
  - `docs/getting-started/azd-basics.md`: បានកែប្រែពាក្យបញ្ជារត្រួតពិនិត្យ
  - `docs/getting-started/first-project.md`: បានបច្ចុប្បន្នភាពឧទាហរណ៍ត្រួតពិនិត្យនិង debugging
  - `docs/getting-started/installation.md`: បានកែប្រែឧទាហរណ៍ជំនួយ និង version
  - `docs/pre-deployment/application-insights.md`: បានកែប្រែពាក្យបញ្ជាមើលកំណត់ហេតុ
  - `docs/pre-deployment/coordination-patterns.md`: បានកែប្រែពាក្យបញ្ជាសម្រាប់ debugging agent

- **📝 បានបញ្ជាក់កំណែបច្ចុប្បន្ន**: 
  - `docs/getting-started/installation.md`: បានប្តូរពាក្យអក្សរ `1.5.0` ទៅ `1.x.x` ជាមួយតំណទៅ releases

#### ផ្លាស់ប្ដូរ
- **យុទ្ធសាស្ត្របញ្ឆលូត់**: បានបច្ចុប្បន្នភាពឯកសារឲ្យប្រើការបញ្ឆតចុះក្រោយដោយផ្អែកលើ Git (AZD មិនមាន rollback ដើម)
- **ការមើលកំណត់ហេតុ**: បានជំនួស `azd logs` ដោយ `azd monitor --logs`, `azd monitor --live`, និងពាក្យបញ្ជា Azure CLI
- **ផ្នែកប្រសិទ្ធភាព**: បានដកចេញប៊្លាអ៊ឺដែលមិនមានសុពលភាពសម្រាប់ deployment ជាស្វ័យប្រវត្តិ/parallel/incremental និងផ្គត់ផ្គង់ជម្រើសត្រឹមត្រូវ

#### ព័ត៌មានបច្ចេកទេស
- **ពាក្យបញ្ជា AZD ដែលត្រឹមត្រូវ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **ប៊្លាអ៊ឺដែលត្រឹមត្រូវសម្រាប់ azd monitor**: `--live`, `--logs`, `--overview`
- **លក្ខណៈដែលបានដកចេញ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### កំណត់ចំណាំ
- **ការផ្ទៀងផ្ទាត់**: ពាក្យបញ្ជាត្រូវបានផ្ទៀងផ្ទាត់ជាមួយ Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**កំណែនេះបានបញ្ចប់ម៉ូឌុល workshop អន្តរកម្ម ស្ដ្រីងតំណភ្ជាប់ឯកសារដែលខូច និងបង្កើនគុណភាពមាតិកាសម្រាប់អ្នកអភិវឌ្ឍ AI ប្រើ Microsoft AZD។**

#### បានបន្ថែម
- **📝 CONTRIBUTING.md**: ឯកសារស្ដីពីការរួមចំណែកថ្មីដែលមាន:
  - សេចក្តីណែនាំច្បាស់សម្រាប់រាយការណ៍បញ្ហា និងស្នើការផ្លាស់ប្ដូរ
  - មាតិកាមានស្តង់ដារ​សម្រាប់មាតិកាថ្មី
  - គោលការណ៍ឧទាហរណ៍កូដ និងប្រព័ន្ធឈ្មោះសារប្តូរតំបន់វគ្គកំណត់កំណត់កំណត់
  - ព័ត៌មានការចូលរួមសហគមន៍

#### បានបញ្ចប់
- **🎯 Workshop Module 7 (Wrap-up)**: បានបញ្ចប់ផ្នែក Wrap-up យ៉ាងពេញលេញ រួមមាន:
  - សេចក្តីសង្ខេបទាំងអស់នៃអ្វីដែលបានសម្រេចក្នុង workshop
  - ផ្នែកគន្លឹះនៃមូលដ្ឋានដែលបានឆ្លងកាត់ ដែលគ្របដណ្តប់ AZD, គ្រោងពុម្ព (templates), និង Microsoft Foundry
  - ការណែនាំពីរបៀបបន្តដំណើរការរៀន
  - សមោងចូលលំហាត់បំពេញកិច្ចការរបស់ workshop ជាមួយការវាយតម្លៃកម្រិតទៃៗ
  - តំណរភ្ជាប់សម្រាប់មតិយោបល់ និងសំរាមគាំទ្រសហគមន៍

- **📚 Workshop Module 3 (Deconstruct)**: ធ្វើបច្ចុប្បន្នភាពគោលដៅការរៀន រួមមាន:
  - ការណែនាំការបើកប្រើ GitHub Copilot ជាមួយម៉ាស៊ីនមើល MCP
  - ការយល់ដឹងអំពីរចនាសម្ព័ន្ធថត AZD template
  - គំរូរៀបចំ Infrastructure-as-code (Bicep)
  - សេចក្ដីណែនាំលំហាត់ដោះស្រាយដោយដៃ

- **🔧 Workshop Module 6 (Teardown)**: បានបញ្ចប់ រួមមាន:
  - គោលដៅសម្រាប់លុបធនធាន និងគ្រប់គ្រងការចំណាយ
  - ការប្រើប្រាស់ `azd down` សម្រាប់ដោះលែងហេតុបច្ចេកទេសយ៉ាងសុវត្ថិភាព
  - ការណែនាំស្តូរវិញសេវាកម្ម cognitive services ដែលបានលុបបច្ចុប្បន្ន (soft-deleted) 
  - សំណើរ bonus សម្រាប់រកស៊ី GitHub Copilot និង Azure Portal

#### បានជួសជុល
- **🔗 Broken Link Fixes**: ដោះស្រាយតំណខូចក្នុងឯកសារឯកសារ ដើមច្រើនជាង 15ឯកសារ:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: ដាក់បច្ចុប្បន្នភាពពី "Under Construction" ទៅស្ថានភាព workshop សកម្ម ជាមួយកាលបរិច្ឆេទ February 2026

- **🔗 Workshop Navigation**: ជួសជុលតំណរដ្ឋបញ្ជានៅក្នុង workshop README.md ដែលបានយោងទៅកាន់ថត lab-1-azd-basics ដែលមិនមាន

#### បានផ្លាស់ប្តូរ
- **Workshop Presentation**: លុបសញ្ញាព្រមាន "under construction" ចេញ, workshop ឥឡូវនេះបានបញ្ចប់ និងអាចប្រើបាន
- **Navigation Consistency**: ទប់ទល់ឲ្យម៉ូឌុលទាំងអស់នៃ workshop មានការស្វែងរកគ្នាដោយស្រេច
- **Learning Path References**: ធ្វើបច្ចុប្បន្នភាពការយោងជាចញ្ចាំងជាបណ្ណ chapter ដើម្បីប្រើ microsoft-foundry path ដែលត្រឹមត្រូវ

#### បានផ្ទៀងផ្ទាត់
- ✅ ឯកសារ Markdown ភាសាអង់គ្លេសទាំងអស់មានតំណនៅក្នុងគ្រប់ទីកន្លែងដែលត្រឹមត្រូវ
- ✅ ម៉ូឌុល workshop 0-7 ទាំងអស់បានបញ្ចប់ជាមួយគោលដៅការរៀន
- ✅ ការស្វែងរករវាងជំពូក និងម៉ូឌុលដំណើរការ​បាន​ត្រឹមត្រូវ
- ✅ មាតិកាដែលសមសម្រាប់អ្នកអភិវឌ្ឍ AI ដែលប្រើ Microsoft AZD
- ✅ ភាសា និងរចនាសម្ព័ន្ធសFriendly សម្រាប់អ្នកចាប់ផ្ដើមត្រូវបានរក្សា
- ✅ CONTRIBUTING.md ផ្តល់ការណែនាំច្បាស់សម្រាប់អ្នកចូលរួមសហគមន៍

#### អនុវត្តបច្ចេកទេស
- **Link Validation**: ស្ព្រីបស្ពរ PowerShell ស្វ័យប្រវត្តិបានផ្ទៀងផ្ទាត់តំណ .md ទាំងអស់
- **Content Audit**: ការត្រួតពិនិត្យដោយដៃអំពីការបញ្ចប់ workshop និងសមត្ថភាពសម្រាប់អ្នកចាប់ផ្ដើម
- **Navigation System**: បានអនុវត្តលំនាំស្វែងរកជំពូក និងម៉ូឌុលយ៉ាងស្ថេរភាព

#### កំណត់ចំណាំ
- **Scope**: ការផ្លាស់ប្តូរត្រូវបានអនុវត្តនៅក្នុងឯកសារភាសាអង់គ្លេសតែប៉ុណ្ណោះ
- **Translations**: ឯកសារបកប្រែ មិនទាន់បានធ្វើបច្ចុប្បន្នភាពនៅក្នុងកំណែនេះ (ការបកប្រែស្វ័យប្រវត្តិនឹងសម្រុកបន្ទាប់)
- **Workshop Duration**: វគ្គសិក្សាទាំងមូលឥឡូវនេះផ្តល់ជូនម៉ោងរៀនអនុវត្តដោយដៃ 3-4 ម៉ោង

---

### [v3.8.0] - 2025-11-19

#### ឯកសារកម្រិតខ្ពស់៖ ការតាមដាន សុវត្ថិភាព និងគំរូ Multi-Agent
**កំណែនេះបន្ថែម មេរៀនលំដាប់ A ដែលពិពណ៌នាច្បាស់អំពីការរួមបញ្ចូល Application Insights, គំរូសុវត្ថិភាព authenticate និង ការសម្របសម្រួល multi-agent សម្រាប់ការដាក់កម្រិតផលិតកម្ម។**

#### បន្ថែម
- **📊 មេរៀនការរួមបញ្ចូល Application Insights**: នៅក្នុង `docs/pre-deployment/application-insights.md`:
  - ការដាក់ពង្រាយជាមួយ AZD ដែលមានការផ្ដល់សម្ភារៈដោយស្វ័យប្រវត្តិ
  - គ្រោង Bicep ពេញលេញសម្រាប់ Application Insights + Log Analytics
  - កម្មវិធី Python ធ្វើការ​ជាមួយ telemetry ផ្ទាល់ខ្លួន (លើស 1,200 ជួរ)
  - គំរូតាមដាន AI/LLM (ការតាមដាន token/ការចំណាយ Microsoft Foundry Models)
  - 6 រូបត្រាតសម្រាប់ Mermaid (ស្ថាបត្យកម្ម, distributed tracing, ថ្នាក់ចរន្ត telemetry)
  - 3 លំហាត់អនុវត្ត (alerts, dashboards, AI monitoring)
  - ឧទាហរណ៍សំណួរ Kusto និងយុទ្ធសាស្រ្តអុបទីម៉ាយសម្រាប់ការចំណាយ
  - ទិន្នន័យ metrics ត្រួតពិនិត្យផ្ទាល់ និងការដោះស្រាយពេលពិត
  - ពេលរៀនប្រហែល 40-50 នាទី ជាមួយគំរូដែលអាចប្រើបានក្នុងផលិតកម្ម

- **🔐 មេរៀនគំរូ Authentication & Security**: នៅក្នុង `docs/getting-started/authsecurity.md`:
  - 3 គំរូ authentication (connection strings, Key Vault, managed identity)
  - គ្រោងយោបល់ Bicep ពេញលេញសម្រាប់ការដាក់ពង្រាយយ៉ាងសុវត្ថិភាព
  - កូដកម្មវិធី Node.js ជាឧទាហរណ៍ជាមួយការរួមបញ្ចូល Azure SDK
  - 3 លំហាត់ពេញលេញ (បើកប្រើ managed identity, user-assigned identity, ការប្ដូរគ្រាប់ Key Vault)
  - អនុវត្តធម្មតាសុវត្ថិភាព និងការកំណត់ RBAC
  - មេរៀនដោះស្រាយបញ្ហា និងវិភាគថ្លៃ
  - គំរូ passwordless authentication សម្រាប់ផលិតកម្ម

- **🤖 មេរៀនគំរូ Multi-Agent Coordination Patterns**: នៅក្នុង `docs/pre-deployment/coordination-patterns.md`:
  - 5 គំរូសម្របសម្រួល (sequential, parallel, hierarchical, event-driven, consensus)
  - អនុវត្តសេវាកម្ម orchestrator ពេញលេញ (Python/Flask, លើស 1,500 ជួរ)
  - 3 អនុវត្តកម្ម agent ជាពិសេស (Research, Writer, Editor)
  - ការរួមបញ្ចូល Service Bus សម្រាប់ queuing សារ
  - ការគ្រប់គ្រង state ជាមួយ Cosmos DB សម្រាប់ប្រព័ន្ធចែកចាយ
  - 6 រូបត្រាត Mermaid បង្ហាញអន្តរកម្ម agent
  - 3 លំហាត់កម្រិតខ្ពស់ (handling timeout, retry logic, circuit breaker)
  - ការបំបែកថ្លៃ ($240-565/month) ជាមួយយុទ្ធសាស្រ្តបង្ហត់ថ្លៃ
  - ការរួមបញ្ចូល Application Insights សម្រាប់ការតាមដាន

#### បានភ្ជាប់ខ្លាំង
- **ជំពូក Pre-deployment**: ឥឡូវនេះរួមបញ្ចូលការតាមដាន និងគំរូសម្របសម្រួលយ៉ាងទូលំទូលាយ
- **ជំពូក Getting Started**: ផ្តល់សមត្ថភាពខ្ពស់ជាមួយគំរូ authentication សហជីវកម្ម
- **ភាពជាស្រេចសម្រាប់ផលិតកម្ម**: គ្របដណ្តប់ពេញលេញចាប់ពីសុវត្ថិភាពដល់ observability
- **Course Outline**: បានធ្វើបច្ចុប្បន្នភាពដើម្បីយោងទៅមេរៀនថ្មីនៅជំពូក 3 និង 6

#### បានផ្លាស់ប្តូរ
- **Learning Progression**: បញ្ចូលសុវត្ថិភាព និងការតាមដានយ៉ាងល្អឡើងជាទូទៅក្នុងវគ្គ
- **Documentation Quality**: ស្តង់ដារ A-grade ទាំងស្រុង (95-97%) នៅលើមេរៀនថ្មីទាំងអស់
- **Production Patterns**: គ្របដណ្តប់តួអត្ថបទពីការចាប់ផ្ដើមដល់ចុងបញ្ចប់សម្រាប់ការដាក់កម្រិតសហគ្រាស

#### បានពង្រឹង
- **Developer Experience**: ផ្លូវច្បាស់ពីការរីកចម្រើនដល់ការតាមដានក្នុងផលិតកម្ម
- **Security Standards**: គំរូអាជីពសម្រាប់ authentication និងការគ្រប់គ្រងសម្ងាត់
- **Observability**: ការរួមបញ្ចូល Application Insights ជាមួយ AZD ពេញលេញ
- **AI Workloads**: ការតាមដានពិសេសសម្រាប់ Microsoft Foundry Models និងប្រព័ន្ធ multi-agent

#### បានផ្ទៀងផ្ទាត់
- ✅ មេរៀនទាំងអស់មានកូដធ្វើការពេញលេញ (មិនមែន snippet)  
- ✅ រូបត្រាត Mermaid សម្រាប់ការសិក្សាជាដើម (សរុប 19 នៅក្នុង 3 មេរៀន)  
- ✅ លំហាត់អនុវត្តដោយដៃជាមួយជំហានផ្ទៀងផ្ទាត់ (សរុប 9)  
- ✅ គ្រោង Bicep សម្រាប់ផលិតកម្ម ដែលអាចដាក់បានជាមួយ `azd up`  
- ✅ វិភាគថ្លៃ និងយុទ្ធសាស្រ្តអុបទីម៉ាយ  
- ✅ មេរៀនដោះស្រាយបញ្ហា និងលក្ខណៈសម្រាប់ការអនុវត្តល្អបំផុត  
- ✅ ចំណុចត្រួតពិនិត្យចំណេះដឹងជាមួយអប្បបរមាកម្មវិធីត្រួតពិនិត្យ

#### លទ្ធផលការវាយតម្លៃឯកសារ
- **docs/pre-deployment/application-insights.md**: - មគ្គុទេសក៍តាមដានពេញលេញ
- **docs/getting-started/authsecurity.md**: - គំរូសុវត្ថិភាពស្ទាត់ជំនាញ
- **docs/pre-deployment/coordination-patterns.md**: - ស្ថាបត្យកម្ម multi-agent កម្រិតខ្ពស់
- **មាតិកាថ្មីទាំងមូល**: - ស្តង់ដារអត្ថភាពខ្ពស់ឥតខ្ចោះ

#### អនុវត្តបច្ចេកទេស
- **Application Insights**: Log Analytics + telemetry ផ្ទាល់ខ្លួន + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### ការកែលម្អគុណភាពឯកសារ និងឧទាហរណ៍ Microsoft Foundry Models ថ្មី
**កំណែនេះបង្កើនគុណភាពឯកសារស្នូលនៅទូទាំងឃ្លាំងទិន្នន័យ និងបន្ថែមឧទាហរណ៍ការដាក់ Microsoft Foundry Models ពេញលេញ ជាមួយចំណុចបន្ទាត់ chat gpt-4.1។**

#### បន្ថែម
- **🤖 ឧទាហរណ៍ Microsoft Foundry Models Chat**: ការដាក់ gpt-4.1 ពេញលេញជាមួយអនុវត្តការងារនៅក្នុង `examples/azure-openai-chat/`:
  - វិសទ្ដភាព Microsoft Foundry Models infrastructure ពេញលេញ (deployment gpt-4.1 model)
  - ចំណុចចរន្ត chat Python command-line ជាមួយប្រវត្តិសន្ទនា
  - ការរួមបញ្ចូល Key Vault សម្រាប់រក្សាគ្រាប់ API សុវត្ថិភាព
  - ការតាមដានការប្រើ token និងការវាយតម្លៃថ្លៃ
  - ការគ្រប់គ្រងម៉ាស៊ីនហាម (rate limiting) និងការដោះស្រាយកំហុស
  - README ដាក់អនុវត្តពេញលេញជ្រើសរើស 35-45 នាទី
  - 11 ឯកសារបណ្តូលដែលអាចប្រើបានក្នុងផលិតកម្ម (Bicep templates, Python app, ការកំណត់រៀបចំ)
- **📚 លំហាត់ឯកសារ**: បន្ថែមលំហាត់អនុវត្តទៅកាន់មេរៀនកំណត់រចនាសម្ព័ន្ធ:
  - លំហាត់ 1: ការកំណត់ចម្រង់ច្រើនបរិយាកាស (15 នាទី)
  - លំហាត់ 2: លំហាត់គ្រប់គ្រងសម្ងាត់ (10 នាទី)
  - ក្រមសេចក្ដីជោគជ័យ និងជំហានផ្ទៀងផ្ទាត់ច្បាស់លាស់
- **✅ ការផ្ទៀងផ្ទាត់ការដាក់ពង្រាយ**: បន្ថែមផ្នែកផ្ទៀងផ្ទាត់ទៅគន្លងការដាក់:
  - ដំណើរការត្រួតពិនិត្យសុខភាព
  - បញ្ជីគោលដៅជោគជ័យ
  - លទ្ធផលដែលរំពឹងទុកសម្រាប់ពាក្យបញ្ជាដាក់ពង្រាយទាំងអស់
  - សេចក្តីយកចិត្តទុកដាក់ក្នុងការដោះស្រាយបញ្ហា

#### បានពង្រឹង
- **examples/README.md**: បានធ្វើឲ្យមានគុណភាព A-grade (93%):
  - បន្ថែម azure-openai-chat ទៅកាន់ផ្នែកទាក់ទងទាំងអស់
  - ធ្វើបច្ចុប្បន្នភាពចំនួនឧទាហរណ៍នៅក្នុងកន្លែងស្រុកពី 3 ទៅ 4
  - បន្ថែមក្នុងតារាង AI Application Examples
  - ផ្ដល់ការរួមបញ្ចូលទៅ Quick Startសម្រាប់អ្នកមានជំនាញមធ្យម
  - បន្ថែមទៅ Microsoft Foundry Templates ផ្នែក
  - ធ្វើបច្ចុប្បន្នភាពតារាងប្រៀបធៀប និងផ្នែកស្វែងរកបច្ចេកវិទ្យា
- **គុណភាពឯកសារ**: កែលម្អពី B+ (87%) → A- (92%) នៅក្នុងថត docs:
  - បន្ថែមលទ្ធផលរំពឹងទុកទៅឧទាហរណ៍ពាក្យបញ្ជាសំខាន់
  - រួមបញ្ចូលជំហានផ្ទៀងផ្ទាត់សម្រាប់ការផ្លាស់ប្តូរកំណត់រចនាសម្ព័ន្ធ
  - លើកកម្ពស់ការរៀនដោយផ្តល់លំហាត់អនុវត្តរួម

#### បានផ្លាស់ប្តូរ
- **Learning Progression**: បញ្ចូលឧទាហរណ៍ AI សម្រាប់អ្នករៀនជាន់មធ្យមយ៉ាងប្រសើរ
- **Documentation Structure**: លំហាត់ប្រយោជន៍ច្រើនជាជាក់លាក់ជាមួយលទ្ធផលច្បាស់
- **Verification Process**: បន្ថែមក្រមគោលការណ៍ជោគជ័យច្បាស់នៅក្នុងកិច្ចចលនា សំខាន់ៗ

#### បានពង្រឹង
- **Developer Experience**: ការដាក់ Microsoft Foundry Models ឥឡូវនេះចំណាយពេល 35-45 នាទី (ប្រៀបធៀប 60-90 នាទី សម្រាប់ជម្រើសចម្រុះស្មុគស្មាញ)
- **Cost Transparency**: ការរំពឹងថ្លៃច្បាស់ ($50-200/month) សម្រាប់ឧទាហរណ៍ Microsoft Foundry Models
- **Learning Path**: អភិវឌ្ឍក AI មានចំណុចចូលច្បាស់ជាមួយ azure-openai-chat
- **Documentation Standards**: លទ្ធផលរំពឹងទុក និងជំហានផ្ទៀងផ្ទាត់មានសុទិដ្ឋិនិយម

#### បានផ្ទៀងផ្ទាត់
- ✅ ឧទាហរណ៍ Microsoft Foundry Models ប្រតិបត្តិការ​បានពេញលេញជាមួយ `azd up`
- ✅ ឯកសារ 11 រូបត្រូវបានសរសេរយ៉ាងត្រឹមត្រូវទៅថ្នាក់សីនតាកូដ
- ✅ សេចក្តីណែនាំ README ទាក់ទៅនឹងបទពិសោធន៍ការដាក់ពង្រាយពិត
- ✅ តំណឯកសារបានផ្លាស់ប្តូរនៅច្រើនជាង 8 ទីតាំង
- ✅ សឺជាឧទាហរណ៍បញ្ជីយោងបញ្ចេញ 4 ឧទាហរណ៍ក្នុងតារាង
- ✅ មិនមានតំណភ្ជាប់ខណៈក្រៅចម្លងក្នុងតារាង
- ✅ ការយោងស្វែងរកទាំងអស់បានត្រឹមត្រូវ

#### អនុវត្តបច្ចេកទេស
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### ការអាប់ដេតធំ៖ ឧទាហរណ៍ការដាក់ Container App
**កំណែនេះបញ្ចូលឧទាហរណ៍ការដាក់កម្មវិធី container ដែលអាចប្រើបានក្នុងផលិតកម្ម ជាមួយ Azure Developer CLI (AZD), មានឯកសារពេញលេញ និងរួមបញ្ចូលទៅក្នុងផ្លូវរៀន។**

#### បន្ថែម
- **🚀 ឧទាហរណ៍ Container App**: ឧទាហរណ៍ក្នុងស្រុកថ្មីនៅ `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): ទិដ្ឋភាពទូទៅនៃការដាក់កម្មវិធី container, quick start, ការដាក់ក្នុងផលិតកម្ម និងគំរូដ៏ចម្រូងចម្រាស
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API សម្រាប់អ្នកចាប់ផ្ដើម ជាមួយ scale-to-zero, health probes, monitoring, និងការដោះស្រាយបញ្ហា
  - [Microservices Architecture](../../examples/container-app/microservices): ការដាក់ប្រើ multi-service សម្រាប់ផលិតកម្ម (API Gateway, Product, Order, User, Notification), messaging អស៊ីនខрон, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **អនុវត្តល្អបំផុត**: សុវត្ថិភាព, តាមដាន, រៀបចំថ្លៃ និងណែនាំ CI/CD សម្រាប់ការបំពេញដោយ container
- **ឧទាហរណ៍កូដ**: `azure.yaml`, Bicep templates, និងអនុវត្តសេវាកម្មជាភាសាយ៉ាងច្រើន (Python, Node.js, C#, Go)
- **ពិនិត្យ & ដោះស្រាយបញ្ហា**: ទីតាំងសាកល-ដល់សាកលិក, ពាក្យបញ្ជាតាមដាន, និងការណែនាំដោះស្រាយបញ្ហា

#### បានផ្លាស់ប្តូរ
- **README.md**: បានធ្វើឲ្យពិពណ៌នានិងភ្ជាប់ឧទាហរណ៍ container app ថ្មី នៅក្រោម "Local Examples - Container Applications"
- **examples/README.md**: ធ្វើឲ្យเด่นឧទាហរណ៍ container app, បន្ថែមធាតុ comparison matrix, និងធ្វើបច្ចុប្បន្នភាពយោងបច្ចេកវិទ្យា/ស្ថាបត្យកម្ម
- **Course Outline & Study Guide**: ធ្វើបច្ចុប្បន្នភាពដើម្បីយោងឧទាហរណ៍ container app ថ្មី និងគំរូដាក់ពង្រាយក្នុងជំពូកដែលទាក់ទង

#### បានផ្ទៀងផ្ទាត់
- ✅ ឧទាហរណ៍ថ្មីទាំងអស់អាចដាក់បានជាមួយ `azd up` និងអនុវត្តល្អបំផុត
- ✅ តំណឯកសារ និងស្វែងរកបានធ្វើបច្ចុប្បន្នភាព
- ✅ ឧទាហរណ៍គ្របដណ្តប់ពីចាប់ផ្ដើមដល់ជាន់ខ្ពស់ រួមមាន microservices សម្រាប់ផលិតកម្ម

#### កំណត់ចំណាំ
- **Scope**: តែឯកសារភាសាអង់គ្លេស និងឧទាហរណ៍តែម្តង
- **Next Steps**: ពង្រីកជាមួយគំរូ container មានកម្រិតខ្ពស់បន្ថែម និងស្វ័យប្រវត្តិ CI/CD នៅកំណែបន្ទាប់

### [v3.5.0] - 2025-11-19

#### ការផ្លាស់ប្ដូរដោយផលិតផល៖ Microsoft Foundry
**កំណែនេះអនុវត្តការផ្លាស់ប្ដូរឈ្មោះផលិតផលទូលំទូលាយពី "Microsoft Foundry" ទៅ "Microsoft Foundry" នៅទូទាំងឯកសារភាសាអង់គ្លេស ដើម្បីឆ្លើយតបនឹងការកែឈ្មោះផ្លូវការ។**

#### បានផ្លាស់ប្តូរ
- **🔄 ការអាប់ដេតឈ្មោះផលិតផល**: ការផ្លាស់ប្តូរពេញលេញពី "Microsoft Foundry" ទៅ "Microsoft Foundry"
  - ធ្វើបច្ចុប្បន្នភាពការយោងទាំងអស់ក្នុងឯកសារភាសាអង់គ្លេសនៅថត `docs/` 
  - លើឈ្មោះថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - បានប្ដូរឈ្មោះឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - សរុប៖ បានអាប់ដេត 23 យោងមាតិកា នៅលើ 7 ឯកសារ

- **📁 ការផ្លាស់ប្តូររចនាសម្ព័ន្ធថត**:
  - `docs/ai-foundry/` បានប្ដូរឈ្មោះទៅជា `docs/microsoft-foundry/`
  - បានអាប់ដេតយោងឆ្លងទាំងអស់ ដើម្បីឆ្លើយតបទៅនឹងរចនាសម្ព័ន្ធថតថ្មី
  - បានផ្ទៀងផ្ទាត់តំណររុករកនៅទូទាំងឯកសារ

- **📄 ការប្ដូរឈ្មោះ​ឯកសារ**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - បានអាប់ដេតតំណខាងក្នុងទាំងអស់ ដើម្បីយោងឈ្មោះឯកសារថ្មី

#### Updated Files
- **ឯកសារជំពូក** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - បានអាប់ដេតតំណររុករក 3 ទីតាំង
  - `docs/microsoft-foundry/ai-workshop-lab.md` - បានអាប់ដេតយោងឈ្មោះផលិតផល 4 ទីតាំង
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - កំពុងប្រើ Microsoft Foundry រួចហើយ (ពីការអាប់ដេតមុន)
  - `docs/microsoft-foundry/production-ai-practices.md` - បានអាប់ដេតយោង 3 ទីតាំង (សង្ខេប, មតិយោបល់សហគមន៍, ឯកសារ)
  - `docs/getting-started/azd-basics.md` - បានអាប់ដេតតំណរឆ្លង 4 ទីតាំង
  - `docs/getting-started/first-project.md` - បានអាប់ដេតតំណររុករកជំពូក 2 ទីតាំង
  - `docs/getting-started/installation.md` - បានអាប់ដេតតំណរជំពូកបន្ទាប់ 2 ទីតាំង
  - `docs/troubleshooting/ai-troubleshooting.md` - បានអាប់ដេតយោង 3 ទីតាំង (រុករក, សហគមន៍ Discord)
  - `docs/troubleshooting/common-issues.md` - បានអាប់ដេតតំណររុករក 1 ទីតាំង
  - `docs/troubleshooting/debugging.md` - បានអាប់ដេតតំណររុករក 1 ទីតាំង

- **ឯកសាររចនាសម្ព័ន្ធវគ្គ** (2 files):
  - `README.md` - បានអាប់ដេតយោង 17 ទីតាំង (សង្ខេបវគ្គ, ចំណងជើងជំពូក, ផ្នែកឧបករណ៍ទម្រង់, មតិពីសហគមន៍)
  - `course-outline.md` - បានអាប់ដេតយោង 14 ទីតាំង (សង្ខេប, គោលដៅការសិក្សា, ធនធានជំពូក)

#### ត្រូវបានផ្ទៀងផ្ទាត់
- ✅ មិនមានអាសយដ្ឋានថត "ai-foundry" សល់នៅក្នុងឯកសារ​អង់គ្លេសទេ
- ✅ មិនមានយោងឈ្មោះផលិតផល "Microsoft Foundry" សល់នៅក្នុងឯកសារ​អង់គ្លេសទេ
- ✅ តំណររុករកទាំងអស់ដំណើរការបានជាមួយរចនាសម្ព័ន្ធថតថ្មី
- ✅ ការប្ដូរឈ្មោះឯកសារ និងថតបានសម្រេចដោយជោគជ័យ
- ✅ ការយោងឆ្លងរវាងជំពូកត្រូវបានផ្ទៀងផ្ទាត់

#### កំណត់ចំណាំ
- **វិសាលភាព**: ការផ្លាស់ប្តូរត្រូវបានអនុវត្តលើឯកសារភាសា​អង់គ្លេសក្នុងថត `docs/` ប៉ុណ្ណោះ
- **ការប្រែសម្រួល**: ថតប្រែសម្រួល (`translations/`) មិនបានអាប់ដេតក្នុងកំណែនេះ
- **សិក្ខាសាលា**: សម្ភារៈសិក្ខាសាលា (`workshop/`) មិនបានអាប់ដេតក្នុងកំណែនេះ
- **ឧទាហរណ៍**: ឯកសារឧទាហរណ៍ប្រហែលជានៅតែយោងឈ្មោះចាស់ (នឹងត្រូវដោះស្រាយនៅក្នុងអាប់ដេតអនាគត)
- **តំណភ្ជាប់ក្រៅ**: អាសយដ្ឋាន URL ខាងក្រៅ និងយោងទៅកាន់រក្សាទុក GitHub មានស្ថានភាពដដែល

#### មគ្គុទេសក៍អំពីការផ្ទេរអ្នកចូលរួម
ប្រសិនបើអ្នកមានសាខាផ្ទាល់ក្នុងកុំព្យូទ័រឬឯកសារដែលយោងទៅរចនាសម្ព័ន្ធចាស់៖
1. ធ្វើអាប់ដេតយោងថត: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ធ្វើអាប់ដេតយោងឯកសារ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ជំនួសឈ្មោះផលិតផល: "Microsoft Foundry" → "Microsoft Foundry"
4. ផ្ទៀងផ្ទាត់ថាតំណរខាងក្នុងឯកសារទាំងអស់នៅតែដំណើរការ

---

### [v3.4.0] - 2025-10-24

#### បន្ថែមការកម្រិតពិនិត្យមុនហេដ្ឋារចនាសម្ព័ន្ធ និងការផ្សារភ្ជាប់ការផ្ទៀងផ្ទាត់
**កំណែនេះបញ្ចូលការគាំទ្រយ៉ាងទូលំទូលាយសម្រាប់មុខងារមើលជាមុន (preview) ថ្មីរបស់ Azure Developer CLI និងសម្រួលបទពិសោធន៍អ្នកប្រើសិក្ខាសាលា។**

#### Added
- **🧪 azd provision --preview Feature Documentation**: រាយការណ៍លម្អិតអំពីសមត្ថភាពមើលជាមុនរបស់ហេដ្ឋារចនាសម្ព័ន្ធ
  - យោងពាក្យបញ្ជា និងឧទាហរណ៍ការប្រើប្រាស់នៅក្នុង cheat sheet
  - ការរួមបញ្ចូលលម្អិតក្នុងមគ្គុទេសក៍Provisioning ជាមួយករណីប្រើប្រាស់ និងអត្ថប្រយោជន៍
  - ការរួមបញ្ចូលការឆែកមុនការបញ្ជូន (pre-flight check) សម្រាប់ការផ្ទៀងផ្ទាត់ការបញ្ជូនបានសុវត្ថិភាពជាងមុន
  - ការអាប់ដេតមគ្គុទេសក៍ចាប់ផ្តើម ដោយផ្តល់អនុស្សរណៈអំពីការមើលសុវត្ថិភាពមុនបញ្ជូន
- **🚧 Workshop Status Banner**: បដាការណ៍ HTML នៃរបាយការណ៍ស្ថានភាពសិក្ខាសាលាដែលមានលក្ខណៈទំន professionelle
  - រចនាគន្លងពណ៌ gradient ជាមួយសញ្ញាស្ថាបនាដើម្បីទាក់ទាញការយល់ដឹង
  - បញ្ចាក់ពេលកំណែចុងក្រោយដើម្បីបង្កើនថ្លៃថ្នូរ
  - ការរចនាត្រូវបានឆ្លើយតបទៅទំហំអេក្រង់ទាំងអស់

#### Enhanced
- **សុវត្ថិភាពហេដ្ឋារ**: មុខងារមើលជាមុនត្រូវបានរួមបញ្ចូលទូទាំងឯកសារអំពីការបញ្ចូន
- **ការផ្ទៀងផ្ទាត់មុនការដាក់ចេញ**: ស្គ្រីបបានបន្ថែមតេស្តមើលជាមុនសម្រាប់ការផ្ទៀងផ្ទាត់សុវត្ថិភាព
- **ដំណើរការអ្នកអភិវឌ្ឍ**: លំដាប់ពាក្យបញ្ជាអាប់ដេត ដើម្បីរួមបញ្ចូលការមើលជាមុនជាប្រឹក្សា
- **បទពិសោធន៍សិក្ខាសាលា**: កំណត់ទំនឹងច្បាស់សម្រាប់អ្នកប្រើអំពីស្ថានភាពការអភិវឌ្ឍន៍មាតិកា

#### Changed
- **អនុវត្តិប្រព័ន្ធជំនាន់ខ្លួននៃការចេញផ្សាយ**: ការប្រតិបត្តិការមើលជាមុនត្រូវបានណែនាំជាវិធានការល្អបំផុត
- **លំនាំឯកសារ**: ការផ្ទៀងផ្ទាត់ហេដ្ឋារ​ត្រូវបានផ្លាស់ទីមកកាន់ដំណាក់កាលដំបូងក្នុងដំណើរការសិក្សា
- **ការពិព័រណ៍សិក្ខាសាលា**: ការទំនាក់ទំនងស្ថានភាពដែលមានភាពប្រកបដោយវិជ្ជាជីវៈ និងមានពេលវេលាអភិវឌ្ឍត្រឹមត្រូវ

#### Improved
- **វិធីសាស្ត្រសុវត្ថិភាពជាមុន**: អាចផ្ទៀងផ្ទាត់ការផ្លាស់ប្តូរហេដ្ឋារចនាសម្ព័ន្ធមុនពេលបញ្ចូនចេញ
- **ការសហកិច្ចក្រុម**: លទ្ធផលមើលជាមុនអាចចែករំលែកសម្រាប់ការពិនិត្យ និងអនុម័ត
- **ការយល់ដឹងពីចំណាយ**: មានការយល់ដឹងល្អជាងមុនអំពីចំណាយធនធានមុនការផ្គត់ផ្គង់
- **ការបន្ថយហានិភ័យ**: ការបញ្ចៀសបរាជ័យការផ្ទុកដោយការផ្ទៀងផ្ទាត់ជាមុន

#### Technical Implementation
- **ការរួមបញ្ចូលក្នុងឯកសារច្រើន**: មុខងារមើលជាមុនត្រូវបានឯកសារជា​ទូទាំង 4 ឯកសារ​សំខាន់
- **លំនាំពាក្យបញ្ជា**: វិនិយោគន៍សមត្ថភាពនិងឧទាហរណ៍ក្នុងស្ទីលដូចគ្នាទៅឯកសារទាំងអស់
- **ការរួមបញ្ចូលអនុស្សរណៈលំដាប់ល្អ**: ការមើលជាមុនត្រូវបានដាក់ក្នុងដំណើរការផ្ទៀងផ្ទាត់ និងស្គ្រីប
- **សញ្ញាផ្ទាស់មើល**: ការកំណត់សម្គាល់ថ្មីៗ ដើម្បីអោយងាយស្វែងរក

#### Workshop Infrastructure
- **ការប្រាស្រ័យទាក់ទងស្ថានភាព**: បដាការណ៍ HTML ដែលមានស្តាយចលករ gradient
- **បទពិសោធន៍អ្នកប្រើ**: ការបង្ហាញស្ថានភាពអភិវឌ្ឍបញ្ឈប់ការភាន់ច្រឡំ
- **ការបង្ហាញវិជ្ជាជីវៈ**: រក្សាភាពទំនុកចិត្តក្នុងរ៉េភូ និងកំណត់ចម្បងកំណត់ទុករំពឹង
- **ភាពច្បាស់លាស់លើកំណត់ពេលវេលា**: កំណត់ពេលអាប់ដេតចុងក្រោយខែមកតុលា 2025 សម្រាប់ការទទួលខុសត្រូវ

### [v3.3.0] - 2025-09-24

#### សម្ភារៈសិក្ខាសាលាដែលបានពង្រីក និងបទពិសោធន៍អប់រំអន្តរកម្ម
**កំណែនេះបញ្ចូលសម្ភារៈសិក្ខាសាលាដ៏ទូលំទូលាយជាមួយមគ្គុទេសក៍អន្តរកម្មក្នុងកម្មវិធីរុក្ខសាលាប្រែទម្រង់និងផ្លូវការសិក្សាដែលមានរចនាបទ។**

#### Added
- **🎥 Interactive Workshop Guide**: បទពិសោធន៍សិក្ខាសាលា​នៅលើម៉ាកដឿក (browser-based) ជាមួយសមត្ថភាព Preview របស់ MkDocs
- **📝 Structured Workshop Instructions**: ដំណើរការរៀបចំសិក្ខាសាលា 7 ជំហាន ពីការស្វែងរកទៅការប្ដូរតាមតម្រូវការ
  - 0-Introduction: សង្ខេបសិក្ខាសាលា និងការរៀបចំដំណើរការ
  - 1-Select-AI-Template: ការស្វែងរកនិងជ្រើសរើសទម្រង់
  - 2-Validate-AI-Template: กระบวนការដាក់ចេញ និងបញ្ចាក់ការផ្ទៀងផ្ទាត់
  - 3-Deconstruct-AI-Template: យល់ដឹងអំពីស្ថាបត្យកម្មទម្រង់
  - 4-Configure-AI-Template: ការកំណត់ និងប្ដូរតាមតម្រូវការ
  - 5-Customize-AI-Template: ការកែសម្រួលដើម្បីឱ្យមានលក្ខណៈខ្ពស់ និងការធ្វើឡើងវិញ
  - 6-Teardown-Infrastructure: ការសម្អាត និងការគ្រប់គ្រងធនធាន
  - 7-Wrap-up: សេចក្ដីសង្ខេប និងជំហានបន្ទាប់
- **🛠️ Workshop Tooling**: ការកំណត់ MkDocs ជាមួយធម៌ Material សម្រាប់បទពិសោធន៍អប់រំដែលល្អប្រសើរ
- **🎯 Hands-On Learning Path**: វិធីសាស្ត្រ 3 ជំហាន (ការស្វែងរក → ការដាក់ចេញ → ការប្ដូរតាមតម្រូវការ)
- **📱 GitHub Codespaces Integration**: ការតភ្ជាប់បរិយាកាសអភិវឌ្ឍន៍ដោយរលូន

#### Enhanced
- **AI Workshop Lab**: ពង្រីកជាមួយបទពិសោធន៍រៀបចំ 2-3 ម៉ោង
- **Workshop Documentation**: ការបង្ហាញវិជ្ជាជីវៈដោយមានចរន្តនិងជំនួយផ្នែកទស្សនៈ
- **Learning Progression**: ដឹកនាំជាកម្រិតពីការជ្រើសរើសទម្រង់បញ្ចូលទៅកាន់ការដាក់ចេញក្នុងផលិតកម្ម
- **Developer Experience**: ឧបករណ៍រួមបញ្ចូលសម្រាប់ដំណើរការអភិវឌ្ឍតាយធ្ងន់

#### Improved
- **Accessibility**: មុខងារ Browser-based មានសមត្ថភាពស្វែងរក, ចម្លង និងប្ដូរធម៌
- **Self-Paced Learning**: រចនាសម្ព័ន្ធសិក្សាដែលអនុវត្តទៅតាមចលនា​របស់អ្នករៀន
- **Practical Application**: ស្ថានการณ์ការដាក់ចេញទម្រង់ AI នៅក្នុងពិភពពិត
- **Community Integration**: ការតភ្ជាប់ Discord សម្រាប់គាំទ្រ និងសហការ

#### Workshop Features
- **Built-in Search**: ការស្វែងរកលឿនតាមពាក្យគន្លឹះ និងមេរៀន
- **Copy Code Blocks**: មុខងារ hover-to-copy សម្រាប់ឧទាហរណ៍កូដទាំងអស់
- **Theme Toggle**: គាំទ្ររបៀបអ៊ិច/អំបិល (dark/light mode)
- **Visual Assets**: រូបថតអេក្រង់ និងខ្លឹមសារ​ចម្លងសម្រាប់ការយល់ដឹងល្អប្រសើរ
- **Help Integration**: ចូលដំណើរការទៅ Discord ព្រមទាំងទទួលបានការគាំទ្រក្នុងសហគមន៍

### [v3.2.0] - 2025-09-17

#### ការកែប្រែធំខ្លាំងលើរចនាសម្ព័ន្ធនាវីហ្គេសិន និងប្រព័ន្ធសិក្សាផ្តល់ជំពូក
**កំណែនេះបញ្ចូលរចនាសម្ព័ន្ធសិក្សាជាម្ចាស់ជំពូកយ៉ាងទូលំទូលាយ ដោយបង្កើនការរុករកក្នុងរ៉េភូទាំងមូល។**

#### Added
- **📚 ប្រព័ន្ធសិក្សាមកពីជំពូក**: រៀបចំវគ្គឲ្យមាន 8 ជំពូកដើម្បីរៀនជាដំណក់
  - ជំពូក 1: មូលដ្ឋាន និងចាប់ផ្តើមយ៉ាងឆាប់រហ័ស (⭐ - 30-45 នាទី)
  - ជំពូក 2: ការអភិវឌ្ឍ AI-First (⭐⭐ - 1-2 ម៉ោង)
  - ជំពូក 3: ការកំណត់ & ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ (⭐⭐ - 45-60 នាទី)
  - ជំពូក 4: ហេដ្ឋារចនាសម្ព័ន្ធជារកូដ & ការដាក់ចេញ (⭐⭐⭐ - 1-1.5 ម៉ោង)
  - ជំពូក 5: ដំណោះស្រាយ Multi-Agent AI (⭐⭐⭐⭐ - 2-3 ម៉ោង)
  - ជំពូក 6: ការផ្ទៀងផ្ទាត់មុនការដាក់ចេញ & ការរៀបចំផែនការ (⭐⭐ - 1 ម៉ោង)
  - ជំពូក 7: ការដោះស្រាយបញ្ហា & ការបំបែកកំហុស (⭐⭐ - 1-1.5 ម៉ោង)
  - ជំពូក 8: លំនាំផលិតកម្ម & សហគ្រាស (⭐⭐⭐⭐ - 2-3 ម៉ោង)
- **📚 ប្រព័ន្ធរុករកទូលំទូលាយ**: ថ្លែងការណ៍នាវីហ្គេសិនម៉ាស៊ីនដូចគ្នានៅទូទាំងឯកសារ
- **🎯 ការតាមដានច прогресс**: បញ្ជីពិនិត្យការសម្រេចវគ្គ និងប្រព័ន្ធផ្ទៀងផ្ទាត់ការសិក្សា
- **🗺️ គន្លងផ្លូវសិក្សា**: ចំណុចចូលដែលច្បាស់សម្រាប់កម្រិតបទពិសោធន៍ និងគោលដៅផ្សេងៗ
- **🔗 ការយោងឆ្លង**: ជំពូកដែលទាក់ទង និងលក្ខណៈចាំបាច់ត្រូវបានភ្ជាប់យ៉ាងច្បាស់

#### Enhanced
- **រចនាសម្ព័ន្ធ README**: ក្លាយទៅជា ឆន្ទៈសិក្សា​ដែលមានរចនាសម្ព័ន្ធជំពូក
- **ការរុករកឯកសារ**: រាល់ទំព័រឥឡូវមានបរិបទជំពូក និងណែនាំលំដាប់សិក្សា
- **ការតម្រៀបទំព័រទម្រង់**: ឧទាហរណ៍ និងទំព័រទម្រង់ត្រូវបានផ្ទៀងផ្ទាត់ទៅជំពូកឲ្យសមរម្យ
- **ការរួមបញ្ចូលធនធាន**: Cheat sheets, FAQ និងមគ្គុទេសក៍សិក្សាត្រូវបានភ្ជាប់ទៅជំពូកដែលពាក់ព័ន្ធ
- **ការរួមបញ្ចូលសិក្ខាសាលា**: មាគន៍ងការងារប្រកបដោយដៃគូដែលត្រូវបានផ្គូផ្គងទៅច្រើនជំពូក

#### Changed
- **ដំណើរការរៀន**: ផ្លាស់ពីឯកសារតាមបណ្តាញទៅប្រព័ន្ធសិក្សាជាផ្ទៃមុខជំពូក
- **ទីតាំងការកំណត់**: មគ្គុទេសក៍កំណត់ត្រូវបានប្ដូរទៅជំពូក 3 ដើម្បីមានលំដាប់សិក្សាល្អប្រសើរ
- **ការរួមបញ្ចូលមាតិកា AI**: រៀបចំមាតិកា AI ដោយសុទ្ធសាធនៅក្នុងដំណើរការសិក្សា
- **មាតិកាផលិតកម្ម**: លំនាំខ្ពស់ត្រូវបានបញ្ចុះនៅជំពូក 8 សម្រាប់អ្នករៀនកម្រិតសហគ្រាស

#### Improved
- **បទពិសោធន៍អ្នកប្រើ**: breadcrumb ងការរុករក និងបង្ហាញលំដាប់ជំពូកច្បាស់
- **ភាពចូលដល់**: លំនាំនាវីហ្គេសិនឯកសារមានភាពថេរល្អសម្រាប់ងាយប្រើ
- **ការបង្ហាញវិជ្ជាជីវៈ**: រចនាសម្ព័ន្ធវគ្គដែលសមស្របសម្រាប់ការបណ្តុះបណ្តាលសាកលវិទ្យាល័យ និងក្រុមហ៊ុន
- **ប្រសិទ្ធភាពក្នុងការសិក្សា**: កាត់បន្ថយពេលស្វែងរកមាតិកាដែលពាក់ព័ន្ធតាមរចនាសម្ព័ន្ធល្អប្រសើរ

#### Technical Implementation
- **Header នាវីហ្គេសិន**: មូលដ្ឋាននាវីហ្គេសិនជំពូកស្តង់ដារនៅលើឯកសារជាង 40+
- **Footer នាវីហ្គេសិន**: ការណែនាំលំដាប់ និងសន្ទស្សន៍ការសម្រេចជំពូកជាស្ថាបត្យកម្ម
- **Cross-Linking**: ប្រព័ន្ធភ្ជាប់ក្នុងយ៉ាងទូលំទូលាយភ្ជាប់មេរុក្សាដែលទាក់ទងគ្នា
- **Chapter Mapping**: ឧទាហរណ៍ និងទម្រង់បានផ្គូផ្គងទៅគោលដៅសិក្សាយ៉ាងច្បាស់

#### Study Guide Enhancement
- **📚 គោលដៅការសិក្សាយ៉ាងទូលំទូលាយ**: មគ្គុទេសក៍សិក្សាត្រូវបានរៀបចំឡើងឲ្យស្របនឹងប្រព័ន្ធ 8 ជំពូក
- **🎯 ការប៉ិនប្រមាណដោយជំពូក**: រាល់ជំពូកមានគោលដៅការសិក្សាសម្បូរនិងលំហាត់អនុវត្ត
- **📋 ការតាមដានដំណើរការ**: កាលវិភាគសប្តាហ៍ ដោយមានលទ្ធផលដែលអាចវាស់បាន និងបញ្ជីពិនិត្យដែលត្រូវបញ្ចប់
- **❓ คำถามប្រលង**: សំនួរផ្ទៀងផ្ទាត់ចំណេះដឹងសម្រាប់រាល់ជំពូក ដែលផ្ដល់នូវលទ្ធផលវិជ្ជាជីវៈ
- **🛠️ លំហាត់អនុវត្ត**: សកម្មភាពដៃអនុវត្តជាមួយស្ថានភាពការដាក់ចេញពិត និងការដោះស្រាយបញ្ហា
- **📊 ការវិវឌ្ឍជំនាញ**: ការកើនឡើងច្បាស់ពីមូលដ្ឋានទៅលំនាំសហគ្រាស ដើម្បីជួយអភិវឌ្ឍអាជីព
- **🎓 ស៊ុមផ្នែកវិញ្ញាបនបត្រ**: លទ្ធផលអភិវឌ្ឍវិជ្ជាជីវៈ និងការទទួលស្គាល់ពីសហគមន៍
- **⏱️ គ្រប់គ្រងពេលវេលា**: គម្រោងសិក្សាចំនួន 10 សប្តាហ៍ដែលមានកំណត់ពេល និងបញ្ជាក់កំណត់ត្រា

### [v3.1.0] - 2025-09-17

#### ការកែលម្អដល់ដំណោះស្រាយ Multi-Agent AI
**កំណែនេះបង្កើនប្រសិទ្ធភាពដល់ដំណោះស្រាយរាយបោះហួស multi-agent ជាមួយការកំណត់ឈ្មោះភាគីបានកាន់តែច្បាស់និងឯកសារដែលបានពង្រឹង។**

#### Changed
- **ពាក្យបច្ចេកទេស Multi-Agent**: បានជំនួស "Cora agent" ជាមួយ "Customer agent" ទាំងអស់ក្នុងដំណោះស្រាយរាយបោះហួស retail ដើម្បីឲ្យយល់បានច្បាស់
- **ស្ថាបត្យកម្មភាគី**: បានអាប់ដេតឯកសារទាំងអស់, តម្រង ARM, និងឧទាហរណ៍កូដ ដើម្បីប្រើឈ្មោះ "Customer agent" ដូចគ្នា
- **ឧទាហរណ៍កំណត់រចនាសម្ព័ន្ធ**: ទម្លាប់កំណត់រចនាសម្ព័ន្ធភាគីទំនើបដោយប្រើបទបញ្ជាឈ្មោះថ្មី
- **ភាពឆោតឯកសារត្រឹមត្រូវ**: បានធានាថា​យោងទាំងអស់ប្រើឈ្មោះភាគីដែលពណ៌នាដោយវិជ្ជាជីវៈ

#### Enhanced
- **កញ្ចប់ ARM Template**: បានអាប់ដេត retail-multiagent-arm-template ដោយយោង到 Customer agent
- **រូបតារាងស្ថាបត្យកម្ម**: បានស្រង់រូបភាព Mermaid ជាមួយឈ្មោះភាគីដែលបានធ្វើបច្ចុប្បន្នភាព
- **ឧទាហរណ៍កូដ**: ថ្នាក់ Python និងឧទាហរណ៍អនុវត្តឥឡូវប្រើ CustomerAgent ឈ្មោះ
- **អថេរស្ថានបរិយាកាស**: បានអាប់ដេត script deployment ទាំងអស់ ដើម្បីប្រើ CUSTOMER_AGENT_NAME

#### Improved
- **បទពិសោធន៍អ្នកអភិវឌ្ឍ**: វេរ៉ូឡារជាប្រភេទភាគី និងកាតព្វកិច្ចត្រូវបានពន្យល់ច្បាស់នៅក្នុងឯកសារ
- **ភាពរួមបញ្ចូលក្នុងផលិតកម្ម**: ឈ្មោះស៊ុមភាពមានលំនៅជាមួយស្តង់ដារសហគ្រាស
- **សម្ភារៈសិក្សា**: ឈ្មោះភាគីដែលយល់បានសាមញ្ញសម្រាប់គោលបំណងសិក្សា
- **ភាពងាយស្រួលប្រើធម៌**: ងាយស្រួលយល់ពីមុខងារភាគី និងលំនាំការដាក់ចេញ

#### Technical Details
- បានអាប់ដេតផ្ទាំងផែនទី Mermaid ជាមួយយោង CustomerAgent
- បានជំនួសឈ្មោះថ្នាក់ CoraAgent ជាជំនួស CustomerAgent ក្នុងឧទាហរណ៍ Python
- បានកែប្រែការកំណត់ JSON ARM template ដើម្បីប្រើប្រភេទភាគី "customer"
- បានប្តូរអថេរបរិស្ថានពី CORA_AGENT_* ទៅ CUSTOMER_AGENT_*
- បានបញ្ចុះបង្ហាញបញ្ជាការដាក់ចេញ និងកំណត់កុងតឺន័រ

### [v3.0.0] - 2025-09-12

#### ការផ្លាស់ប្តូរធំ - ការយកចិត្តទុកដាក់ផ្នែកអ្នកអភិវឌ្ឍ AI និងការរួមបញ្ចូល Microsoft Foundry
**កំណែនេះបម្លែងរ៉េភូឲ្យក្លាយជាវត្ថុអប់រំបែប AI ដ៏ទូលំទូលាយ ជាមួយមគ្គុទេសក៍រួមសម្រាប់ Microsoft Foundry។**

#### Added
- **🤖 ផ្លូវសិក្សា AI-First**: ការរៀបអាប់ដេតពេញលេញដែលផ្តោតលើអ្នកអភិវឌ្ឍន៍ និងវិស្វករ AI
- **Microsoft Foundry Integration Guide**: ឯកសារលម្អិតសម្រាប់ភ្ជាប់ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **AI Model Deployment Patterns**: មគ្គុទេសក៍លម្អិតអំពីការជ្រើសរើសម៉ូដែល, ការកំណត់, និងយុទ្ធសាស្ត្រដាក់ចេញក្នុងផលិតកម្ម
- **AI Workshop Lab**: វគ្គបណ្តុះបណ្តាល​អនុវត្ត 2-3 ម៉ោង សម្រាប់បម្លែងកម្មវិធី AI ទៅជា​ដំណោះស្រាយដែលអាចបង្ហោះដោយ AZD
- **Production AI Best Practices**: លំនាំវិជ្ជាជីវៈសម្រាប់រំខាន, តាមដាន និងសន្តិសុខលើកម្មវិធី AI ក្នុងបរិបទផលិតកម្ម
- **AI-Specific Troubleshooting Guide**: មគ្គុទេសក៍ដោះស្រាយបញ្ហាដូចជា Microsoft Foundry Models, Cognitive Services និង​បញ្ហាការបញ្ចូន AI ផ្សេងៗ
- **AI Template Gallery**: ការរើសសួតគំរូ Microsoft Foundry ដែលមានការវាយតម្លៃកម្រិតស្មុគស្មាញ
- **Workshop Materials**: រចនាសម្ព័ន្ធវគ្គបណ្តុះបណ្តាលទាំងមូលជាមួយនឹងម_lab_អនុវត្ត និងឯកសារយោង

#### កែលម្អ
- **README Structure**: ផ្តោតលើអ្នកអភិវឌ្ឍ AI ដោយមានទិន្នន័យចំណាប់អារម្មណ៍សហគមន៍ 45% ពី Microsoft Foundry Discord
- **Learning Paths**: ផ្លូវការសិក្សាដើម្បីអ្នកអភិវឌ្ឍ AI ជាបន្តផ្តល់គ្នាជាមួយផ្លូវចំណាត់ថ្នាក់បែបប្រពៃណីសម្រាប់និស្សិត និងវិស្វករ DevOps
- **Template Recommendations**: គំរូ AI ដែលបានណែនាំ រួមមាន azure-search-openai-demo, contoso-chat, និង openai-chat-app-quickstart
- **Community Integration**: ការគាំទ្រសហគមន៍ Discord បានបង្កើន ជាមួយបន្ទប់កាន់តែផ្តោតលើ AI និងការពិភាក្សា

#### Security & Production Focus
- **Managed Identity Patterns**: លំនាំសុវត្ថិភាព និងសម្គាល់អត្តសញ្ញាណជាពិសេសសម្រាប់ AI
- **Cost Optimization**: តាមដានការប្រើប្រាស់ token និងការគ្រប់គ្រងថវិកាសម្រាប់ភារកិច្ច AI
- **Multi-Region Deployment**:យុទ្ធសាស្រ្តសម្រាប់ការបង្ហោះកម្មវិធី AI ទៅតំបន់ពហុ
- **Performance Monitoring**: មាត្រដ្ឋានផ្តោតលើ AI និងការរួមបញ្ចូល Application Insights

#### Documentation Quality
- **Linear Course Structure**: ជម្រះតាមលំដាប់ពីអ្នកចាប់ផ្តើមទៅកម្រិតខ្ពស់សម្រាប់លំនាំការបញ្ចូន AI
- **Validated URLs**: តំណរ repository ខាងក្រៅទាំងអស់ត្រូវបានផ្ទៀងផ្ទាត់ និងអាចចូលដំណើរការ
- **Complete Reference**: តំណនៃឯកសារផ្ទៃក្នុងទាំងអស់ត្រូវបានផ្ទៀងផ្ទាត់ និងមានប្រសិទ្ធភាព
- **Production Ready**: លំនាំចែកចាយសម្រាប់សហគ្រាសជាមួយឧទាហរណ៍ពិតប្រាកដ

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**កំណែនេះបង្ហាញការកែសម្រួលយ៉ាងសំខាន់លើរចនាសម្ព័ន្ធ repository និងរបៀបបង្ហាញមាតិកា។**

#### Added
- **Structured Learning Framework**: ទំព័រ​ឯកសារទាំងអស់ឥឡូវមានជាផ្នែក Introduction, Learning Goals, និង Learning Outcomes
- **Navigation System**: បានបន្ថែមតំណ Previous/Next សម្រាប់មេរៀនទាំងអស់សម្រាប់ការណែនាំផ្លូវសិក្សា
- **Study Guide**: study-guide.md ពេញលេញ ជាមួយគោលដៅការសិក្សា លំហាត់អនុវត្ត និងសម្ភារៈការប៉ាន់ប្រមាណ
- **Professional Presentation**: ដកហូតរូបមន្តអេមូជីទាំងអស់ ដើម្បីបង្កើនភាពអាចចូលដល់ និងរូបរាងវិជ្ជាជីវៈ
- **Enhanced Content Structure**: ការរៀបចំ និងលំហាត់នៃសម្ភារៈសិក្សាត្រូវបានកែលម្អ

#### Changed
- **Documentation Format**: ទ្រង់ទ្រាយឯកសារ ទាំងអស់ត្រូវបានស្តង់ដារ ជាមួយរចនាសម្ព័ន្ធផ្តោតលើការសិក្សា
- **Navigation Flow**: អនុវត្តលំដាប់យុទ្ធសាស្ត្រយ៉ាងមានតុល្យភាពតាមរយៈសម្ភារៈសិក្សាទាំងអស់
- **Content Presentation**: ដកធាតុតុបតែងចេញ ដើម្បីប្រើរចនាបទដ៏ច្បាស់ និងវិជ្ជាជីវៈ
- **Link Structure**: ពិនិត្យអាប់ដេតតំណផ្ទៃក្នុងទាំងអស់ដើម្បីគាំទ្ររបៀបស៊ែរនាវីហ្គេសិនថ្មី

#### Improved
- **Accessibility**: ដកការ​ពឹងផ្អែកលើអេមូជ៊ី ដើម្បីឱ្យសាកសមសម្រាប់កម្មវិធីអានសម្លេង
- **Professional Appearance**: រូបរាងស្អាតស្អំម៉ាស៊ីនសិក្សាសាកសមសម្រាប់សហគ្រាស
- **Learning Experience**: វិធីសាស្ត្ររៀបចំមានលំដាប់ ដែលមានគោលដៅ និងលទ្ធផលច្បាស់សម្រាប់មេរៀនរាល់មួយ
- **Content Organization**: លំហូរយុទ្ធសាស្ត្រនិងចំណាត់ថ្នាក់ប្រសើរជាងមុនក្នុងការយោងមាតិកា

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - ស៊េរីមគ្គុទេសក៍ getting-started ទាំងពេញ
  - ឯកសារបំពេញអំពីការបញ្ចូន និងការផ្គត់ផ្គង់ដ៏ពេញលេញ
  - ឯកសារដោះស្រាយបញ្ហា និងមគ្គុទេសក៍ដោះស្រាយកំហុសលម្អិត
  - ឧបករណ៍ និងនីតិវិធីផ្ទាល់ខ្លួនសម្រាប់ការផ្ទៀងផ្ទាត់មុនបញ្ចូន

- **Getting Started Module**
  - AZD Basics: យល់ដឹងគ្រឹះ និងពាក្យបច្ចេកទេស
  - Installation Guide: សេចក្តីណែនាំការតំឡើងជាក់លាក់តាមវេទិកា
  - Configuration Guide: ការកំណត់បរិវេណ និងការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
  - First Project Tutorial: មេរៀនដាក់ទៅក្នុងគម្រោងដំបូងជាមួយជំហានដល់ជំហាន

- **Deployment and Provisioning Module**
  - Deployment Guide: ឯកសារដំណើរការជាប់គ្នាចំពោះការបង្ហោះ
  - Provisioning Guide: គោលការណ៍ Infrastructure as Code ជាមួយ Bicep
  - នីតិវិធីអនុវត្តល្អសម្រាប់ការបង្ហោះក្នុងផលិតកម្ម
  - លំនាំស្ថាបត្យកម្មពហុសេវាកម្ម

- **Pre-deployment Validation Module**
  - Capacity Planning: ផ្ទៀងផ្ទាត់ភាពអាចមានធនធាន Azure
  - SKU Selection: ការណែនាំលម្អិតអំពីជើងថ្នាក់សេវាកម្ម
  - Pre-flight Checks: ស្គ្រីបផ្ទៀងផ្ទាត់អូតូម៉ាទិក (PowerShell និង Bash)
  - ឧបករណ៍ស្ទីមថ្លើមសម្រាប់ការចាត់បញ្ចូលថ្លៃដើម និងផែនការថវិកា

- **Troubleshooting Module**
  - Common Issues: បញ្ហា​ដែលជួបជាញឹកញាប់ និងដំណោះស្រាយ
  - Debugging Guide: វិធីសាស្ត្រដោះស្រាយដោយប្រែប្រួលប្រព័ន្ធ
  - បច្ចេកទេស និងឧបករណ៍វិភាគជាន់ខ្ពស់
  - ការត្រួតពិនិត្យ និងបង្កើនមទាស់បញ្ញើកម្រិតប្រតិបត្តិ

- **Resources and References**
  - Command Cheat Sheet: ឯកសារយោងលឿនសម្រាប់ពាក្យបញ្ជាសំខាន់ៗ
  - Glossary: បញ្ជីពាក្យនិងព្រមានអក្សរ
  - FAQ: ចម្លើយលម្អិតចំពោះសំណួរញឹកញាប់
  - តំណធនធានខាងក្រៅ និងតំណភ្ជាប់សហគមន៍

- **Examples and Templates**
  - ឧទាហរណ៍កម្មវិធីវេបសាយសាមញ្ញ
  - គំរូការបង្ហោះវេបស្ថិតិស្ថិតិ
  - ការកំណត់កម្មវិធី컨เทន័រ
  - លំនាំការភ្ជាប់មូលដ្ឋានទិន្នន័យ
  - ឧទាហរណ៍ស្ថាបត្យកម្ម Microservices
  - ការអនុវត្តសំណុំមុខងារ serverless

#### Features
- **Multi-Platform Support**: លំអៀងការតំឡើង និងការកំណត់សម្រាប់ Windows, macOS, និង Linux
- **Multiple Skill Levels**: មាតិកាត្រូវបានរចនាសម្រាប់ពីនិស្សិតរហូតដល់អ្នកអភិវឌ្ឍផ្នែកវិជ្ជាជីវៈ
- **Practical Focus**: ឧទាហរណ៍អនុវត្ត និងស្ថានការណ៍ពិតប្រាកដ
- **Comprehensive Coverage**: ពីគំនិតគ្រឹះទៅលំនាំកម្រិតខ្ពស់សម្រាប់សហគ្រាស
- **Security-First Approach**: ការអនុវត្តល្អៗផ្នែកសន្តិសុខបញ្ចូលនៅក្នុងមាតិកា
- **Cost Optimization**: ការណែនាំសម្រាប់ការបង្ហោះប្រកបដោយប្រសិទ្ធភាពថវិកា និងការគ្រប់គ្រងធនធាន

#### Documentation Quality
- **Detailed Code Examples**: លក្ខណៈកូដអនុវត្តដែលបានសាកល្បង
- **Step-by-Step Instructions**: ណែនាំច្បាស់ ជាការអាចអនុវត្តបាន
- **Comprehensive Error Handling**: ដោះស្រាយកំហុសក្នុងករណីជួបបញ្ហាទូទៅ
- **Best Practices Integration**: ស្តង់ដារពិភពឧស្សាហកម្ម និងការណែនាំ
- **Version Compatibility**: ធ្វើឱ្យទាន់សម័យជាមួយសេវាកម្ម Azure និងលក្ខណៈ azd ពីចុងក្រោយ

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: លំនាំបញ្ចូលសម្រាប់ Hugging Face, Azure Machine Learning, និងម៉ូដែលប្ដូរផ្ទាល់ខ្លួន
- **AI Agent Frameworks**: គំរូសម្រាប់ LangChain, Semantic Kernel, និង AutoGen
- **Advanced RAG Patterns**: មាឌទិន្នន័យវ៉េកទ័រច្រើនជាង Azure AI Search (Pinecone, Weaviate, ល.ទ.)
- **AI Observability**: ការតាមដានលម្អិតសម្រាប់ប្រសិទ្ធភាពម៉ូដែល, ការប្រើប្រាស់ token, និងគុណភាពការឆ្លើយតប

#### Developer Experience
- **VS Code Extension**: បទពិសោធន៍អភិវឌ្ឍន៍ AZD + Microsoft Foundry រួមបញ្ចូលនៅក្នុង VS Code
- **GitHub Copilot Integration**: ជំនួយ AI សម្រាប់បង្កើតគំរូ AZD
- **Interactive Tutorials**: លំហាត់កូដអនុវត្តជាមួយការផ្ទៀងផ្ទាត់អូតូម៉ាទិកសម្រាប់សេណារីយ៉ូ AI
- **Video Content**: វីដេអូបង្ហាញជួយសម្រាប់អ្នករៀនមើលដែលផ្តោតលើការបង្ហោះ AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: អធិប្បាយលើគោលការណ៍គ្រប់គ្រងម៉ូដែល AI, គោលការណ៍គោលនិងតាមដាន
- **Multi-Tenant AI**: លំនាំសម្រាប់បម្រើអតិថិជនច្រើនដោយសេវាកម្ម AI បានបំបែកដោយឯកសារ
- **Edge AI Deployment**: ផ្សាភ្ជាប់ជាមួយ Azure IoT Edge និង container instances
- **Hybrid Cloud AI**: លំនាំបង្ហោះពហុពពក និងម៉ូដែលគម្រប់ពពកផ្សំសម្រាប់ភារកិច្ច AI

#### Advanced Features
- **AI Pipeline Automation**: MLOps រួមបញ្ចូលជាមួយ Azure Machine Learning pipelines
- **Advanced Security**: លំនាំ zero-trust, private endpoints, និងការការពារឧ​បសគ្គភាពជាន់ខ្ពស់
- **Performance Optimization**: ការគ្រប់គ្រង និងបន្ទាន់សម្រួលសម្រាប់កម្មវិធី AI មានចរន្តខ្ពស់
- **Global Distribution**: លំនាំចែកចាយមាតិកា និង edge caching សម្រាប់កម្មវិធី AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: ការរួមបញ្ចូល Microsoft Foundry ដោយទូលំទូលាយ (បានបញ្ចប់)
- ✅ **Interactive Tutorials**: វគ្គបណ្ដុះបណ្ដាល AI អនុវត្ត (បានបញ្ចប់)
- ✅ **Advanced Security Module**: លំនាំសុវត្ថិភាពជាក់លាក់សម្រាប់ AI (បានបញ្ចប់)
- ✅ **Performance Optimization**: នីតិវិធីកែទម្រង់សម្រាប់ភារកិច្ច AI (បានបញ្ចប់)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: សេណារីយ៉ូមើលដូចជាការបង្ហោះដែលផ្តោតលើ AI (បានបញ្ចប់)
- ✅ **Extended FAQ**: សំណួរជាក់លាក់អំពី AI និងដោះស្រាយ (បានបញ្ចប់)
- **Tool Integration**: មគ្គុទេសក៍កាន់តែឈានមុខសម្រាប់ IDE និង editor
- ✅ **Monitoring Expansion**: ការត្រួតពិនិត្យ និងព្រមានផ្តោតលើ AI (បានបញ្ចប់)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: រចនាបទឆាប់សមន់សម្រាប់ការសិក្សាតាមស្មាតហ្វូន
- **Offline Access**: កញ្ចប់ឯកសារអាចទាញយកបាន
- **Enhanced IDE Integration**: ផ្នែកបន្ថែម VS Code សម្រាប់ AZD + ប្រព័ន្ធការងារ AI
- **Community Dashboard**: មាត្រដ្ឋានសហគមន៍ពេលពិត និងការតាមដានការរួមចំណែក

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- លក្ខណៈថ្មី មុខងារ ឬផ្នែកឯកសារ
- ឧទាហរណ៍ ថ្មើរជើងគំរូ ឬធនធានសិក្សាថ្មី
- ឧបករណ៍ ស្គ្រីប ឬយុទ្ធសាស្ត្របន្ថែម

#### Changed
- ការកែប្រែលើយ៉ាងមុខងារ ឬឯកសារ​ដែលមាន
- ការអាប់ដេតដើម្បីធ្វើឱ្យច្បាស់ ឬត្រឹមត្រូវល្អขึ้น
- ការរៀបចំឡើងវិញនៃមាតិកា ឬរចនាសម្ព័ន្ធ

#### Deprecated
- លក្ខណៈ ឬវិធីសាស្ត្រដែលកំពុងត្រូវបានបដិសេធ
- ផ្នែកឯកសារដែលមានផែនការដកចេញ
- វិធីសាស្ត្រដែលមានជម្រើសល្អប្រសើរជាងនេះ

#### Removed
- លក្ខណៈ ឯកសារ ឬឧទាហរណ៍ដែលមិនដែលពាក់ព័ន្ធទៀត
- ព័ត៌មានចាស់ ឬវិធីសាស្ត្រដែលបានដកចេញ
- ការស្ទាក់ស្ទើរក្នុងសំណុំឯកសារដែលបានសម្រួល

#### Fixed
- ការកែសម្រួលកំហុសក្នុងឯកសារ ឬកូដ
- ការ​ដោះស្រាយបញ្ហាដែលបានរាយការណ៍
- ការ​កែលម្អភាពត្រឹមត្រូវ និងមុខងារ

#### Security
- ការ​ដោះស្រាយ ឬកែលម្អផ្នែកសន្តិសុខ
- អាប់ដេតលើការអនុវត្តល្អសម្រាប់សន្តិសុខ
- ការ​ដោះស្រាយចំពោះចន្លោះសុវត្ថិភាព

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- ការផ្លាស់ប្តូរដែលបែកចេញ និងទាមទារការគ្រប់គ្រងពីអ្នកប្រើ
- ការរៀបចំឡើងវិញយ៉ាងសំខាន់នៃមាតិកា ឬរចនាសម្ព័ន្ធ
- ការ​ផ្លាស់ប្តូរដែលបំលែងវិធីសាស្ត្រឬវិធីសាស្ត្រពិភពទាំងមូល

#### Minor Version (X.Y.0)
- លក្ខណៈថ្មី ឬការបន្ថែមមាតិកា
- ការកែលម្អដែលរក្សាការទទួលខុសត្រូវពីខាងក្រោយ
- ឧទាហរណ៍ ឧបករណ៍ ឬធនធានបន្ថែម

#### Patch Version (X.Y.Z)
- ការកែលម្អកុំខុស និងការកែសម្រួលតូចៗ
- ការ​បន្ថែមតិចតួចទៅលើមាតិកាដែលមាន
- ការពន្យល់ និងកែលម្អតូចៗ

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: រាយការណ៍បញ្ហា ឬណែនាំកែលម្អ (សំណើសុំដែលផ្តោតលើ AI សូមស្វាគមន៍)
- **Discord Discussions**: ចែករំលែកគំនិត និងចូលរួមជាមួយសហគមន៍ Microsoft Foundry
- **Pull Requests**: ធ្វើចូលរួមកែលម្អឯកសារ ដោយជាពិសេសគំរូ និងមគ្គុទេសក៍ AI
- **Microsoft Foundry Discord**: ចូលរួមនៅក្នុងបន្ទប់ #Azure សម្រាប់ពិភាក្សាអំពី AZD + AI
- **Community Forums**: ចូលរួមក្នុងការពិភាក្សាទូលំទូលាយរបស់អ្នកអភិវឌ្ឍ Azure

### Feedback Categories
- **AI Content Accuracy**: ការកែលម្អឬកែតម្រូវពត៌មានអំពីការរួមបញ្ចូលសេវាកម្ម AI និងការបង្ហោះ
- **Learning Experience**: ការណែនាំសម្រាប់លំហាត់សិក្សាអ្នកអភិវឌ្ឍ AI
- **Missing AI Content**: សំណើសុំគំរូ ឬលំនាំ AI បន្ថែម
- **Accessibility**: ការកែលម្អសម្រាប់តម្រូវការរៀនចម្រុះ
- **AI Tool Integration**: ការណែនាំសម្រាប់បញ្ចូលឧបករណ៍ AI ទៅក្នុងសំណុំការងារ
- **Production AI Patterns**: សំណើសុំលំនាំបង្ហោះ AI សម្រាប់សហគ្រាស

### Response Commitment
- **Issue Response**: ខ្លឹមសារ​នឹងឆ្លើយក្នុងរយៈពេល 48 ម៉ោងសម្រាប់បញ្ហារកបាន
- **Feature Requests**: សិក្សាក្នុងមួយសប្តាហ៍
- **Community Contributions**: ពិនិត្យក្នុងមួយសប្តាហ៍
- **Security Issues**: ជាអាទិភាពទាន់ចិត្ត និងឆ្លើយតបឆាប់រហ័ស

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: ការត្រួតពិនិត្យភាពត្រឹមត្រូវនិងការផ្ទៀងផ្ទាត់តំណរ
- **Quarterly Updates**: ការបន្ថែមមាតិកាយ៉ាងសំខាន់ និងកែលម្អ
- **Semi-Annual Reviews**: ការរៀបចំឡើងវិញ និងការកែលម្អទូលំទូលាយ
- **Annual Releases**: ការចេញផ្សាយកំណែធំៗជាមួយការកែលម្អសំខាន់ៗ

### Monitoring and Quality Assurance
- **Automated Testing**: ការផ្ទៀងផ្ទាត់កូដ និងតំណរ​ជា​ញឹកញាប់
- **Community Feedback Integration**: រួមបញ្ចូលយោបល់អ្នកប្រើជាប្រចាំ
- **Technology Updates**: ធ្វើឱ្យសន្ដិសុខជាមួយសេវាកម្ម Azure និងការចេញផ្សាយ azd ថ្មីៗ
- **Accessibility Audits**: ការពិនិត្យស្តង់ដាររចនាសុវត្ថិភាពសម្រាប់ភាពរួមបញ្ចូល

## Version Support Policy

### Current Version Support
- **Latest Major Version**: ទទួលបានការគាំទ្រក بالكاملជាមួយការអាប់ដេតជាប្រចាំ
- **Previous Major Version**: អាប់ដេតសុវត្ថិភាព និងកែលម្អសំខាន់សម្រាប់ 12 ខែ
- **Legacy Versions**: គាំទ្រដោយសហគមន៍តែប៉ុណ្ណោះ មិនមានការអាប់ដេតផ្លូវការ

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: ដំណើរការកាត់បន្ថយជាការដឹកនាំជាដំណាក់កាល
- **Compatibility Notes**: ព័ត៌មានអំពីការបែកបាក់ដែលអាចមាន
- **Tool Support**: ស្គ្រីប ឬឧបករណ៍ជួយក្នុងការផ្លាស់ប្តូរ
- **Community Support**: វេទិកាពិសេសសម្រាប់សំណួរផ្លាស់ប្តូរ

---

**Navigation**
- **Previous Lesson**: [មគ្គុទេសក៍ការសិក្សា](resources/study-guide.md)
- **Next Lesson**: បញ្ជូនត្រឡប់ទៅ [README ដើម](README.md)

**Stay Updated**: តាមដាន repository នេះសម្រាប់ការជូនដំណឹងអំពីកំណែថ្មី និងការអាប់ដេតសំខាន់ទៅវិញទៅមកលើសម្ភារៈសិក្ស។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
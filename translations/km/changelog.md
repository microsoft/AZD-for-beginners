# បញ្ជីផ្លាស់ប្តូរ - AZD សម្រាប់អ្នកចាប់ផ្តើម

## ការណែនាំ

បញ្ជីផ្លាស់ប្តូរនេះចុះបញ្ជីពីការផ្លាស់ប្តូរ សម្រួល និងការកែលម្អ​ដែលគួរឱ្យចាប់អង្គទាំងអស់ទៅកាន់រ៉ෙបូស៊ីតોરી AZD For Beginners។ យើងអនុវត្តគោលការណ៍ versioning គួរសម និងថែរក្សាឯកសារនេះដើម្បីជួយអ្នកប្រើប្រាស់យល់ពីអ្វីដែលបានផ្លាស់ប្តូររវាងកំណែទាំងឡាយ។

## គោលដៅការសិក្សា

ដោយពិនិត្យបញ្ជីផ្លាស់ប្តូរនេះ អ្នកនឹងអាច៖
- ទទួលបានព័ត៌មានអំពីលក្ខណៈពិសេសថ្មីៗ និងការបន្ថែមខ្លឹមសារ
- យល់ដឹងអំពីការកែលម្អដែលបានធ្វើទៅលើឯកសារ​ដែលមានរួច
- តាមដានការ​បញ្ចុះកំហុស និងការកែលម្អដើម្បីធានាការត្រឹមត្រូវ
- ធ្វើអោយដំណើរការលទ្ធផលសិក្សាធ្វើឡើងក្នុងរយៈពេល

## លទ្ធផលការសិក្សា

បន្ទាប់ពីពិនិត្យចូលទៅក្នុងបញ្ជីផ្លាស់ប្តូរ អ្នកនឹងអាច៖
- សម្គាល់ខ្លឹមសារថ្មីៗ និងធនធានដែលមានសម្រាប់ការសិក្សា
- យល់ថាផ្នែកណាដែលបានបច្ចុប្បន្នភាព ឬបានកែលម្អ
- ដាស់ផ្លូវការសិក្សារបស់អ្នកមើលទៅលើឯកសារថ្មីបំផុត
- ផ្តល់មតិយោបល់ និងاقتراحសម្រាប់ការកែលម្អនៅអនាគត

## ប្រវត្តិ​កំណែ

### [v3.19.1] - 2026-03-27

#### ការបញ្ជាក់សម្រាប់ការចុះបណ្តុះបណ្តាលអ្នកចាប់ផ្តើម, ចុះត្រួតពិនិត្យការតំឡើង និងការសម្អាតបញ្ជា AZD ចុងក្រោយ
**កំណែ​នេះបន្តការត្រួតពិនិត្យ AZD 1.23 ដើម្បីអនុវត្តលើឯកសារដែលផ្តោតលើអ្នកចាប់ផ្តើម៖ វាបញ្ជាក់ការណែនាំអំពីការផ្ទៀងផ្ទាត់ការផ្ទៀងផ្ទាត់身份 AZD ជាដំបូង, បន្ថែមស្គ្រីបសម្រាប់ត្រួតពិនិត្យការតំឡើងក្នុងហាងរាល់កាន់ទី, ផ្ទៀងផ្ទាត់បញ្ជាទំាងសំខាន់ទាំងអស់ប្រឆាំងនឹង CLI AZD ជាជីវិត, និងលុបទៅឲ្យចេញពីកំណត់បញ្ជា​វិភាគ​ភាសា​អង់គ្លេសដែលមិនចាំបាច់នៅខាងក្រៅបញ្ជីផ្លាស់ប្តូរ។**

#### Added
- **🧪 ស្គ្រីបត្រួតពិនិត្យការតំឡើងសម្រាប់អ្នកចាប់ផ្តើម** ជាមួយ `validate-setup.ps1` និង `validate-setup.sh` ដូច្នេះអ្នករៀនអាចបញ្ជាក់ឧបករណ៍ដែលត្រូវបានទាមទារមុនពេលចាប់ផ្តើមជាមួយជំពូក 1
- **✅ ជំហានត្រួតពិនិត្យការតំឡើងជាមុន** នៅក្នុង README មូលដ្ឋាន និង README ជំពូក 1 ដូច្នេះភាពខ្វះខាត prerequisites ត្រូវបានចាប់បានមុន `azd up`

#### Changed
- **🔐 ការ​នាំមុខ​អ្នកចាប់ផ្តើម​ក្នុងការផ្ទៀងផ្ទាត់身份** ឥឡូវនេះព្យាបាល `azd auth login` ជាផ្លូវចម្បងសម្រាប់លំហ AZD, ជាមួយ `az login` បានរាយនាមជា optional លុះត្រាតែរាល់ពេលសម្រាប់ពាក្យបញ្ជា Azure CLI ត្រូវបានប្រើដោយផ្ទាល់
- **📚 លំហចូលរួមជំពូក 1** ឥឡូវបង្ហាញអ្នករៀនឱ្យត្រួតពិនិត្យការតំឡើងក្នុងលក្ខណៈស្កេនមុនការតំឡើង, ការផ្ទៀងផ្ទាត់身份, និងជំហានដាក់ផ្សាយដំបូង
- **🛠️ សារ Validator** ឥឡូវនេះបំបែកយ៉ាងច្បាស់ពីតម្រូវការចាប់ផ្តើម (blocking requirements) ពីការព្រមាន Azure CLI ជាជម្រើសសម្រាប់ផ្លូវ AZD តែម្ដង
- **📖 ការ​កំណត់រចនា, ការបញ្ហា​ដោះស្រាយ, និងឯកសារឧទាហរណ៍** ឥឡូវនេះបំបែកច្បាស់ពីការផ្ទៀងផ្ទាត់身份 AZD ដែលចាំបាច់ និងការចូលប្រើ Azure CLI ដែលជាជម្រើសនៅពេលដែលទាំងពីរមុននេះត្រូវបានបង្ហាញដោយគ្មានបរិបទ

#### Fixed
- **📋 ការបញ្ជូនបញ្ជា​ដែលនៅខាងក្រោយប្រភពភាសាអង់គ្លេស** បានបច្ចុប្បន្នភាពទៅទម្រង់ AZD បច្ចុប្បន្ន រួមទាំង `azd config show` ក្នុង cheat sheet និង `azd monitor --overview` នៅពេលមានបំណងណែនាំការមើលទិដ្ឋភាព Azure Portal
- **🧭 ការនិយាយពីអ្នកចាប់ផ្តើមក្នុងជំពូក 1** បានធ្វើឲ្យទន់ឡើង ដើម្បីជៀសមិនឲ្យមានការសន្មតថាការធានា​ពីកំហុសសូន្យ ឬសកម្មភាព rollback ដែលធានាថាធ្វើបានគ្រប់បានលើគម្រប់ទំព័រ និងធនធាន Azure ទាំងអស់
- **🔎 ការផ្ទៀងផ្ទាត់ CLI ជាសកម្ម** បានបញ្ជាក់ការគាំទ្របច្ចុប្បន្នសម្រាប់ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, and `azd down --force --purge`

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

#### ការត្រួតពិនិត្យ AZD 1.23.12, ការពង្រីកបរិយាកាសធ្វើការសិក្សា និងការបច្ចុប្បន្នភាពម៉ូដែល AI
**កំណែ​នេះបង្កើតការត្រួតពិនិត្យឯកសារប្រឆាំងនឹង `azd` `1.23.12`, បច្ចុប្បន្នភាពឧទាហរណ៍បញ្ជា AZD ដែលចាស់, បច្ចុប្បន្នភាពការណែនាំម៉ូដែល AI ទៅកាន់លំនាំដើមបច្ចុប្បន្ន, និងពង្រីកការណែនាំវើកសុីលទៅឱ្យគាំទ្រដល់ dev containers និងកូពីក្នុងเครื่องផ្ទាល់ លើសពី GitHub Codespaces ប៉ុណ្ណោះ។**

#### Added
- **✅ កំណត់ចំណាំការផ្ទៀងផ្ទាត់នៅខាងក្នុងជំពូកស្នាដៃនិងឯកសារ workshop** ដើម្បីធ្វើឲ្យស្តង់ដារ AZD ដែលបានសាកល្បងមានភាពបញ្ជាក់សម្រាប់អ្នករៀនដែលប្រើគ្រឿងបន្លាស់ CLI ថ្មី ឬចាស់
- **⏱️ ការណែនាំពេលវេលាចប់សម្រាប់ការដាក់ផ្សាយ** សម្រាប់ការដាក់ផ្សាយកម្មវិធី AI ដែលរយៈពេលយូរ ដោយប្រើ `azd deploy --timeout 1800`
- **🔎 ជំហានពិនិត្យបន្ថែមសម្រាប់ extension** ជាមួយ `azd extension show azure.ai.agents` ក្នុងឯកសារការ​បំពេញ​ប្រតិបត្តិការ AI
- **🌐 ការ​នាំមុខបរិយាកាស workshop ដែលទូលំទូលាយជាងមុន** គ្របដណ្តប់ GitHub Codespaces, dev containers, និងការតម្លើងលើเครื่องផ្ទាល់ជាមួយ MkDocs

#### Changed
- **📚 README ការណែនាំជំពូក** ឥឡូវនេះចែងថាបានត្រួតពិនិត្យប្រឆាំងនឹង `azd 1.23.12` ទៅទាំងជំពូក foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, និង production
- **🛠️ ឯកសារយោងបញ្ជា AZD** បានបច្ចុប្បន្នភាពទៅទម្រង់បច្ចុប្បន្ននៅក្នុងឯកសារ:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ឬ `azd env get-value(s)` អាស្រ័យលើបរិបទ
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` នៅពេលមានបំណងការមើលទិដ្ឋភាព Application Insights
- **🧪 ឧទាហរណ៍ preview provision** បានខ្លីស្រួលទៅប្រើការនេះដែលគាំទ្រ ដូចជា `azd provision --preview` និង `azd provision --preview -e production`
- **🧭 លំហ workshop** បានធ្វើឲ្យអាចបញ្ចប់ពហុកម្រិតក្នុង Codespaces, dev container, ឬកន្លែងចម្លងលើเครื่องផ្ទាល់បាន មិនទាន់ប៉ុន្មានថា Codespaces ទេ
- **🔐 ការណែនាំអំពីការផ្ទៀងផ្ទាត់身份** ឥឡូវនេះចូលចិត្ត `azd auth login` សម្រាប់លំហ AZD, ជាមួយ `az login` ត្រូវបានដាក់ជា optional នៅពេលដែលពាក្យបញ្ជា Azure CLI ត្រូវបានប្រើដោយផ្ទាល់

#### Fixed
- **🪟 បញ្ជា install Windows** បានធម្មតាទៅនឹង casing package `winget` បច្ចុប្បន្នក្នុងមគ្គុទេសក៍ installation
- **🐧 ការណែនាំ install Linux** បានកែឲ្យគ្មានការណែនាំ package manager គួរមិនគាំទ្រពិសេសសម្រាប់ distro និងផ្តល់យោងទៅកាន់ release assets នៅពេលសមស្រប
- **📦 ឧទាហរណ៍ម៉ូដែល AI** បានបច្ចុប្បន្នភាពពីលំនាំចាស់ដូចជា `gpt-35-turbo` និង `text-embedding-ada-002` ទៅលំនាំបច្ចុប្បន្ន ដូចជា `gpt-4.1-mini`, `gpt-4.1`, និង `text-embedding-3-large`
- **📋 ដុំស្គ្រីបដាក់ផ្សាយ និងរាយការណ៍ផ្គត់ផ្គង់ព័ត៍មាន** បានកែឲ្យប្រើពាក្យបញ្ជា environment និង status បច្ចុប្បន្នក្នុង logs, scripts, និងជំហានដោះស្រាយបញ្ហា
- **⚙️ ការ​នាំមុខ GitHub Actions** បានបច្ចុប្បន្នភាពពី `Azure/setup-azd@v1.0.0` ទៅ `Azure/setup-azd@v2`
- **🤖 ការណែនាំសុំសិទ្ធិ MCP/Copilot** បានបច្ចុប្បន្នភាពពី `azd mcp consent` ទៅ `azd copilot consent list`

#### Improved
- **🧠 ការ​នាំមុខជំពូក AI** ឥឡូវនេះពន្យល់បានល្អជាងមុនពីអាកប្បកិរិយា `azd ai` ដែលនៅក្នុង preview, ការចូលក្នុង tenant ជាក់លាក់, ការប្រើប្រាស់ extension បច្ចុប្បន្ន, និងការណែនាំការដាក់ម៉ូដែលដែលបានធ្វើបច្ចុប្បន្នភាព
- **🧪 ទម្រង់ workshop** ឥឡូវប្រើឧទាហរណ៍កំណែដែលមានភាពជាក់ស្តែង និងភាសាការតំឡើងបរិយាកាសដែលច្បាស់សម្រាប់មេរៀនដៃក្នុង
- **📈 ឯកសារផលិតកម្ម និងការដោះស្រាយបញ្ហា** ឥឡូវស្របគ្នាបន្ថែមជាមួយមធ្យោបាយមើលទិន្នន័យ, ម៉ូដែល fallback, និងឧទាហរណ៍ថ្នាក់នៃចំណាយ

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

#### ពាក្យបញ្ជា AZD AI CLI, ការផ្ទៀងផ្ទាត់ខ្លឹមសារ និងការពង្រីកទំព័រគំរូ
**កំណែ​នេះបានបន្ថែមការក្រឡេក `azd ai`, `azd extension`, និង `azd mcp` ទៅក្នុងជំពូកទាក់ទងនឹង AI ទាំងអស់, កែសម្រួលតំណរខូច និងកូដដែលលងខ្សោយក្នុង agents.md, បច្ចុប្បន្នភាព cheat sheet, និងធ្វើសម្រួលផ្នែក Example Templates ជាមួយការពិពណ៌នាដែលបានផ្ទៀងផ្ទាត់ និងទំព័រគំរូ AZD Azure AI ថ្មី។**

#### Added
- **🤖 ការជាប់គ្របដណ្តប់ AZD AI CLI** ក្នុង 7 ឯកសារ (មុននេះមាននៅក្នុងជំពូក 8 តែប៉ុណ្ណោះ):
  - `docs/chapter-01-foundation/azd-basics.md` — ផ្នែកថ្មី "Extensions and AI Commands" ណែនាំ `azd extension`, `azd ai agent init`, និង `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — ជម្រើសទី 4: `azd ai agent init` ជាមួយតុប្រៀបធៀប (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — កញ្ចប់ "AZD Extensions for Foundry" និង "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ឥឡូវបង្ហាញផ្លូវការដាក់ផ្សាយទាំងពីរ ពី template និង manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — បន្ទប់ Deploy ឥឡូវមានជម្រើស `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — ផ្នែក "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — ផ្នែកថ្មី "AI & Extensions Commands" មាន `azd extension`, `azd ai agent init`, `azd mcp`, និង `azd infra generate`
- **📦 ទំព័រគំរូ AZD AI ថ្មីៗ** នៅក្នុង `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — การสนทนา RAG .NET ជាមួយ Blazor WebAssembly, Semantic Kernel, និងគាំទ្រការជជែកដោយសម្លេង
  - **azure-search-openai-demo-java** — การสนทนา RAG ជាមួយ Java ប្រើ Langchain4J មិនទាន់មានការ部署 ACA/AKS ជាជម្រើស
  - **contoso-creative-writer** — កម្មវិធីសរសេរច្នៃប្រឌិតច្រើនភ្នាក់ងារ (multi-agent) ប្រើ Azure AI Agent Service, Bing Grounding, និង Prompty
  - **serverless-chat-langchainjs** — RAG serverless ប្រើ Azure Functions + LangChain.js + Cosmos DB មានការគាំទ្រការរីកចម្រើន Ollama សម្រាប់ dev ផ្ទាល់
  - **chat-with-your-data-solution-accelerator** — ឧបករណ៍ជួយលឿន RAG សម្រាប់សហគ្រាស មានផតថលគ្រប់គ្រង admin, ឯកភាព Teams, និងជម្រើស PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — គំរូយោងការគ្រប់គ្រង MCP មេរៀនច្រើនភ្នាក់ងារ ដោយមានម៉ាស៊ីនបម្រើនៅ .NET, Python, Java, និង TypeScript
  - **azd-ai-starter** — ទំព័រគំរូចាប់ផ្តើម Bicep រចនាសម្ព័ន្ធ Azure AI សាមញ្ញ
  - **🔗 Awesome AZD AI Gallery link** — ដំណាក់បណ្ដាញទៅកាន់ [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 ការនាវិហ្សែន agents.md**: តំណ Previous/Next ឥឡូវត្រូវគ្នានឹងលំដាប់មេរៀន README ជំពូក 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 តំណខូចក្នុង agents.md**: `production-ai-practices.md` ត្រូវបានកែជា `../chapter-08-production/production-ai-practices.md` (3 ករណី)
- **📦 កូដDeprecated ក្នុង agents.md**: ជំនួស `opencensus` ជាមួយ `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API ខកខានក្នុង agents.md**: ផ្លាស់ទី `max_tokens` ពី `create_agent()` ទៅ `create_run()` ជា `max_completion_tokens`
- **🔢 ការ​រាប់ token 在 agents.md**: ជំនួសការវាយតម្លៃប្រហែល `len//4` ជាមួយ `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: កែសម្រួលសេវាកម្មពី "Cognitive Search + App Service" ទៅ "Azure AI Search + Azure Container Apps" (ម៉ាស៊ីនហៅដើមបានផ្លាស់នៅតុលា 2024)
- **contoso-chat**: បច្ចុប្បន្នភាពពិពណ៌នាឱ្យយោងទៅកាន់ Azure AI Foundry + Prompty ដើម្បីផ្គូផ្គងនឹង​ចំណងជើង repo និងសំបុកបច្ចេកវិទ្យាជាក់ស្តែង

#### Removed
- **ai-document-processing**: លុបចេញការយោងទំព័រគំរូដែលមិនដំណើរការ (repo មិនអាចចូលបានសាធារណៈក្នុងលក្ខខណ្ឌ AZD template)

#### Improved
- **📝 agents.md exercises**: លំហាត់ទី 1 ឥឡូវបង្ហាញលទ្ធផលដែលរំពឹងទុក និងជំហាន `azd monitor`; លំហាត់ទី 2 រួមបញ្ចូលកូដចុះបញ្ជី `FunctionTool` ពេញលេញ; លំហាត់ទី 3 បានប្រែការណែនាំស្រួលចិត្តឲ្យទៅជាពាក្យបញ្ជា `prepdocs.py` ដែលច្បាស់លាស់ជាក់លាក់
- **📚 agents.md resources**: បានធ្វើបច្ចុប្បន្នភាពតំណរឯកសារទៅឯកសារ Azure AI Agent Service ទាន់ពេល និង quickstart
- **📋 agents.md Next Steps table**: បានបន្ថែមតំណ AI Workshop Lab សម្រាប់ការកំណត់ផ្នែកមេរៀនទាំងមូល

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
**កំណែនេះធ្វើឲ្យការរុករកជំពូកនៅ README.md មានភាពប្រសើរឡើងដោយរចនាតារាងល្អប្រសើរជាងមុន។**

#### Changed
- **Course Map Table**: បានធ្វើឲ្យប្រសើរជាមួយតំណភ្ជាប់មេរៀន​វិញ​ផ្ទាល់, ពេលវេលាអាចប្រហែល, និងការវាយប្រមាណភាពស្មុគស្មាញ
- **Folder Cleanup**: បានយកថតចាស់ដែលធ្វើអោយកើតភាពច្របល់ចេញ (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: បានបញ្ជាក់តំណខាងក្នុងទាំង 21+ នៅក្នុងតារាង Course Map

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**កំណែនេះធ្វើបច្ចុប្បន្នភាពណែនាំផលិតផលទៅឈ្មោះបច្ចុប្បន្នរបស់ Microsoft។**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: បានធ្វើបច្ចុប្បន្នភាពយោងទាំងអស់នៅឯកសារមិនមែនសម្រាប់បកប្រែ
- **Azure AI Agent Service → Foundry Agents**: បានប្ដូរឈ្មោះសេវាកម្មដើម្បីប្រាប់ពីម៉ាកដែលកំពុងប្រើ

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**កំណែនេះរៀបចំឯកសារជាថតដែលមានលេខជំពូកដើម្បីឲ្យមានការរុករកច្បាស់លាស់។**

#### Folder Renames
ថតចាស់បានប្តូរទៅថតដែលមានលេខជំពូក ៖
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| File | From | To |
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

#### Added
- **📚 Chapter README files**: បានបង្កើត README.md ក្នុងប្រអប់ជំពូកនីមួយៗ ដែលមាន៖
  - គោលដៅការរៀន និងរយៈពេល
  - តារាងមេរៀនជាមួយការពិពណ៌នា
  - ពាក្យបញ្ជាថ្មីសម្រាប់ចាប់ផ្ដើម
  - នាវាច្រកទៅជំពូកផ្សេងទៀត

#### Changed
- **🔗 Updated all internal links**: បានធ្វើបច្ចុប្បន្នភាព 78+ ផ្លូវក្នុងឯកសារ
- **🗺️ Main README.md**: បានធ្វើបច្ចុប្បន្នភាព Course Map ជាមួយរចនាសម្ព័ន្ធជំពូកថ្មី
- **📝 examples/README.md**: បានធ្វើបច្ចុប្បន្នភាពយោងឯកសារទៅថតជំពូក

#### Removed
- រចនាសម្ព័ន្ធថតចាស់ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**កំណែនេះបានបន្ថែមឯកសារ README សម្រាប់ការរុករកជំពូក (បន្ទាប់ពី v3.15.0 បានជំនួស)។**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**កំណែនេះបានបន្ថែមមេរៀនណែនាំពេញលេញសម្រាប់ចេញផ្សាយ AI agents ជាមួយ Azure Developer CLI។**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: មេរៀនពេញលេញដែលគ្របដណ្តប់៖
  - អ្វីទៅជា AI agents និងភាពខុសគ្នារវាងពួកវាជាមួយ chatbots
  - គំរូកាតាសម្រាប់រហ័សចាប់ផ្ដើមបីប្រភេទ (Foundry Agents, Prompty, RAG)
  - លំនាំស្ថាបត្យកម្ម agent (agent តែមួយ, RAG, multi-agent)
  - ការកំណត់តំហុយនិងការប្ដូរតាមតម្រូវការនៃ Tool
  - ការ តាមដាន និងម៉េទ្រីក
  - ការពិចារណាតម្លៃ និងការជៀសវាងការចំណាយ
  - ករណីជួបវិបត្តិដែលឃើញញឹកញាប់
  - លំហាត់អនុវត្តពីរ/បីជំហានមានលក្ខខណ្ឌជោគជ័យ

#### Content Structure
- **Introduction**: គំនិតអំពី agent សម្រាប់អ្នកចាប់ផ្ដើម
- **Quick Start**: ចេញផ្សាយ agents ជាមួយ `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: រូបភាពសម្រាប់លំនាំ agent
- **Configuration**: ការកំណត់ Tool និងអថេរបរិស្ថាន
- **Monitoring**: ការរួមបញ្ចូល Application Insights
- **Exercises**: ការរៀនអនុវត្តជាច្រេីន (20-45 នាទីក្នុងមួយលំហាត់)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**កំណែនេះធ្វើបច្ចុប្បន្នភាពកំណត់ Dev Container ជាមួយឧបករណ៍សម័យថ្មី និងលំនាំលំនឹកល្អសម្រាប់បទពិសោធន៍ AZD។**

#### Changed
- **🐳 Base Image**: បានប្ដូរពី `python:3.12-bullseye` ទៅ `python:3.12-bookworm` (Debian stable ថ្មីជាង)
- **📛 Container Name**: បានប្ដូរឈ្មោះពី "Python 3" ទៅ "AZD for Beginners" សម្រាប់ភាពច្បាស់លាស់

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` ជាមួយការគាំទ្រ Bicep បានបើកបាំង
  - `node:20` (LTS សម្រាប់ AZD templates)
  - `github-cli` សម្រាប់ការគ្រប់គ្រង template
  - `docker-in-docker` សម្រាប់ការចេញផ្សាយ container app

- **🔌 Port Forwarding**: បានកំណត់ច្រកទូទាត់សម្រាប់ការអភិវឌ្ឍដូចជា:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ VS Code Settings**: បានបន្ថែមការកំណត់លំនាំសម្រាប់ Python interpreter, format on save, និង trimming whitespace

- **📦 Updated requirements-dev.txt**:
  - បានបន្ថែម MkDocs minify plugin
  - បានបន្ថែម pre-commit សម្រាប់គុណភាពកូដ
  - បានបន្ថែមកញ្ចប់ Azure SDK (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: ឥឡូវបានត្រួតពិនិត្យ AZD និង Azure CLI នៅពេល container ចាប់ផ្ដើម

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**កំណែនេះធ្វើឲ្យ README.md មើលចំពោះអ្នកចាប់ផ្ដើមបានងាយស្រួលជាងមុន និងបន្ថែមធនធានសំខាន់ៗសម្រាប់អ្នកអភិវឌ្ឍន៍ AI។**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: ពិពណ៌នាច្បាស់ពីពេលណាដើម្បីប្រើឧបករណ៍ណាមួយជាមួយឧទាហរណ៍អនុវត្ត
- **🌟 Awesome AZD Links**: តំណផ្ទាល់ទៅកាន់រាយនាម template សហគមន៍ និងធនធានចូលរួម:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: ផ្នែកចាប់ផ្ដើមសាមញ្ញ 3 ជំហាន (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: ផ្តល់នូវមាគ៌ាថាត្រូវចាប់ផ្ដើមពីណាដោយផ្អែកលើបទពិសោធន៍អ្នកអភិវឌ្ឍ

#### Changed
- **README Structure**: បានរៀបចំឡើងវិញសម្រាប់ការបង្ហាញតាមដំណាក់កាល - ព័ត៌មានសំខាន់ៗនៅខ្លួនដំបូង
- **Introduction Section**: បានសរសេរឡើងវិញដើម្បីពន្យល់ "The Magic of `azd up`" សម្រាប់អ្នកចាប់ផ្ដើមបាត់បង់
- **Removed Duplicate Content**: បានដកផ្នែក troubleshooting ដែលធ្វើម្តងទៀតចេញ
- **Troubleshooting Commands**: បានកែ `azd logs` ឲ្យប្រើ `azd monitor --logs` ត្រឹមត្រូវ

#### Fixed
- **🔐 Authentication Commands**: បានបន្ថែម `azd auth login` និង `azd auth logout` ទៅក្នុង cheat-sheet.md
- **Invalid Command References**: បានដក `azd logs` នៅក្នុងផ្នែក troubleshooting របស់ README

#### Notes
- **Scope**: ការផ្លាស់ប្ដូរត្រូវបានអនុវត្តលើ README.md ។ និង resources/cheat-sheet.md
- **Target Audience**: ការកែលម្អនេះមានគោលដៅសម្រាប់អ្នកអភិវឌ្ឍថ្មីចាប់ផ្ដើមជាមួយ AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**កំណែនេះបានកែសម្រួលពាក្យបញ្ជា AZD ដែលមិនមាននៅក្នុងឯកសារទាំងមូល ដើម្បីធានាថាឧទាហរណ៍កូដទាំងអស់ប្រើស៊ីនថាក់ត្រឹមត្រូវ។**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: បានអនុវត្តផ្ទុកពិនិត្យ និងកែប្រែពាក្យបញ្ជាដែលមិនមាន៖
  - `azd logs` (មិនមាន) → ប្ដូរជា `azd monitor --logs` ឬជាជម្រើស Azure CLI
  - `azd service` subcommands (មិនមាន) → ប្ដូរជា `azd show` និង Azure CLI
  - `azd infra import/export/validate` (មិនមាន) → បានដកឬប្ដូរជាជម្រើសត្រឹមត្រូវ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (មិនមាន) → បានដកចេញ
  - `azd provision --what-if/--rollback` flags (មិនមាន) → បានប្ដូរជា `--preview`
  - `azd config validate` (មិនមាន) → ប្ដូរជា `azd config list`
  - `azd info`, `azd history`, `azd metrics` (មិនមាន) → បានដកចេញ

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: ការកែប្រែធំបំផុតនៃសេចក្តីយោងពាក្យបញ្ជា
  - `docs/deployment/deployment-guide.md`: កែប្រែយុទ្ធសាស្ត្រការកំណត់វិលត្រឡប់
  - `docs/troubleshooting/debugging.md`: កែសម្រួលផ្នែកវិភាគកំណត់ហេតុ
  - `docs/troubleshooting/common-issues.md`: បច្ចុប្បន្នភាពពាក្យបញ្ជា troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: កែសម្រួលផ្នែក debugging AZD
  - `docs/getting-started/azd-basics.md`: កែសម្រួលពាក្យបញ្ជារការតាមដាន
  - `docs/getting-started/first-project.md`: បច្ចុប្បន្នភាពឧទាហរណ៍ការតាមដាន និង debugging
  - `docs/getting-started/installation.md`: កែសម្រួល help និង version ឧទាហរណ៍
  - `docs/pre-deployment/application-insights.md`: កែសម្រួលពាក្យបញ្ជាមើលកំណត់ហេតុ
  - `docs/pre-deployment/coordination-patterns.md`: កែសម្រួលពាក្យបញ្ជាកែតម្រូវ agent

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: បានប្ដូរពាក្យកំណត់ជំនាន់ចេញពី `1.5.0` ទៅ `1.x.x` ជាមួយតំណទៅ releases

#### Changed
- **Rollback Strategies**: បានបច្ចុប្បន្នភាពឯកសារ​ឲ្យប្រើវិធីវិលត្រឡប់ដោយផ្អែកលើ Git (AZD មិនមាន rollback ដើម)
- **Log Viewing**: បានប្ដូរ `azd logs` ទៅ `azd monitor --logs`, `azd monitor --live`, និងពាក្យបញ្ជា Azure CLI
- **Performance Section**: បានដកផ្ទាំងទាក់ទងនឹង flag ការចេញផ្សាយដដែល/បញ្ជាក់បន្ត/ទ្រង់ទ្រាយ សូមផ្ដល់ជាជម្រើសត្រឹមត្រូវ

#### Technical Details
- **ពាក្យបញ្ជ AZD ត្រឹមត្រូវ**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **ទង់ azd monitor ដែលត្រឹមត្រូវ**: `--live`, `--logs`, `--overview`
- **មុខងារ​ដែលបានយកចេញ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### កំណត់ចំណាំ
- **ការផ្ទៀងផ្ទាត់**: Commands validated against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### ការសម្រេចកម្មវិធីសិក្សាស្ថិតក្នុងសាលា និងបច្ចុប្បន្នភាពគុណភាពឯកសារ
**កំណែនេះបញ្ចប់ម៉ូឌុលវគ្គសិក្សាផ្ទាល់អន្តរកម្មទាំងអស់, ជួសជុលសំណុំនិងតំណភ្ជាប់ឯកសារដែលខូចទាំងអស់, និងបង្កើនគុណភាពមាតិការទូទៅសម្រាប់អ្នកអភិវឌ្ឍ AI ដែលប្រើ Microsoft AZD។**

#### បានបន្ថែម
- **📝 CONTRIBUTING.md**: ឯកសារណែនាំការរួមចំណែកថ្មីដែលមាន:
  - សេចក្ដីណែនាំច្បាស់សម្រាប់រាយការណ៍បញ្ហា និងស្នើរសុំការផ្លាស់ប្តូរ
  - ស្តង់ដារឯកសារសម្រាប់មាតិការថ្មី
  - មនោសញ្ចេតនាឧទាហរណ៍កូដ និងប្រពៃណីសម្រាប់សារ commit
  - ព័ត៌មានអំពីការចូលរួមសហគមន៍

#### បានបញ្ចប់
- **🎯 Workshop Module 7 (Wrap-up)**: ម៉ូឌុល wrap-up បានបញ្ចប់ពេញលេញដែលមាន:
  - សេចក្តីសង្ខេបទូលំទូលាយពីសមិទ្ធផលនៃវគ្គសិក្សា
  - ផ្នែកមេគំនិតសំខាន់ៗដែលបានយល់ដឹង គ្របដណ្តប់ AZD, ទ្រង់ទ្រាយតម្រៀប, និង Microsoft Foundry
  - ការណែនាំសម្រាប់បន្តដំណើរការរៀន
  - ឆ្នោតប្រធានបទសម្រាប់លំហាត់វគ្គសិក្សានៅលក្ខណៈបញ្ហារីកឌិតជាមួយកម្រិតភាពពិបាក
  - តំណភ្ជាប់មតិយោបល់សហគមន៍ និងការគាំទ្រ

- **📚 Workshop Module 3 (Deconstruct)**: ធ្វើបច្ចុប្បន្នភាពគោលបំណងការរៀនដែលមាន:
  - ណែនាំការបើក GitHub Copilot ជាមួយម៉ាស៊ីន MCP
  - ការយល់ដឹងអំពីរចនាសម្ព័ន្ធថត AZD template
  - លំនាំអង្គការអនុគម្រោង Infrastructure-as-code (Bicep)
  - សេចក្ដីណែនាំលើបច្ច pratique បានដៃ

- **🔧 Workshop Module 6 (Teardown)**: បានបញ្ចប់ដែលមាន:
  - គោលដៅលើការសម្អាតធនធាន និងការគ្រប់គ្រងចំណាយ
  - ការប្រើប្រាស់ `azd down` សម្រាប់ការដកធនធានយ៉ាងសុវត្ថិភាព
  - ណែនាំស្ដារវិញសេវាកម្ម cognitive services ដែលបាន soft-deleted
  - លំហាត់បន្ថែមសម្រាប់រកឃើញ GitHub Copilot និង Azure Portal

#### កែសំរួល
- **🔗 ការជួសជុលតំណខូច**: ដោះស្រាយតំណក្នុងឯកសារផ្ទុកក្នុងប្រព័ន្ធដែលខូចច្រើនជាង 15 តំណ:
  - `docs/ai-foundry/ai-model-deployment.md`: កែផ្លូវទៅ microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: ធ្វើការកែ ai-model-deployment.md និង production-ai-practices.md ដើម្បីឲ្យត្រឹមត្រូវ
  - `docs/getting-started/first-project.md`: ជំនួស cicd-integration.md ដែលមិនមានដោយ deployment-guide.md
  - `examples/retail-scenario.md`: កែផ្លូវ FAQ និងផែនការជួយដោះស្រាយបញ្ហា
  - `examples/container-app/microservices/README.md`: សម្រួលផ្លូវទៅ course home និង deployment guide
  - `resources/faq.md` និង `resources/glossary.md`: ធ្វើបច្ចុប្បន្នភាពយោងជាផ្នែក AI
  - `course-outline.md`: កែផ្លូវ instructor guide និងយោងទៅ AI workshop lab

- **📅 បដិមាស្ថាប័នស្ថានភាពវគ្គសិក្សា**: បច្ចុប្បន្នភាពពី "Under Construction" ទៅស្ថានភាពវគ្គសិក្សាដែលសកម្មជាមួយកាលបរិច្ឆេទ ខែកុម្ភៈ 2026

- **🔗 ទីបញ្ជាវគ្គសិក្សា**: ជួសជុលតំណរNavigator ក្នុង README.md នៃវគ្គសិក្សាដែលគោលដៅទៅកាន់ថត lab-1-azd-basics ដែលមិនទាន់មាន

#### ផ្លាស់ប្តូរ
- **ការបង្ហាញវគ្គសិក្សា**: ដកស្លាក "under construction" ដោយឥឡូវនេះវគ្គសិក្សា បានបញ្ចប់ និងម៉ោងស្រាប់សម្រាប់ប្រើ
- **ភាពឆ្មាស់ម៉ានក្នុងការរុករក**: ធានាថាម៉ូឌុលវគ្គសិក្សាទាំងអស់មានការបញ្ជាន់វិញអន្តរក្លាយសមស្រប
- **យោងផ្លូវការរីករាលដាល**: ធ្វើបច្ចុប្បន្នភាពយោងជាផ្នែកមេរៀនទៅម៉ាស៊ីន microsoft-foundry ត្រឹមត្រូវ

#### បានផ្ទៀងផ្ទាត់
- ✅ ឯកសារ markdown ភាសាអង់គ្លេសទាំងអស់មានតំណក្នុងសុពលភាព
- ✅ ម៉ូឌុលវគ្គសិក្សា 0-7 បានបញ្ចប់ជាមួយគោលបំណងការរៀន
- ✅ ការរុករករវាងជំពូក និងម៉ូឌុលដំណើរការបានយ៉ាងត្រឹមត្រូវ
- ✅ មាតិកាសមស្របសម្រាប់អ្នកអភិវឌ្ឍ AI ដែលប្រើ Microsoft AZD
- ✅ ភាសា និងរចនាសម្ព័ន្ធសមស្របសម្រាប់អ្នកចាប់ផ្តើម
- ✅ CONTRIBUTING.md ផ្តល់នូវការណែនាំច្បាស់សម្រាប់អ្នករួមចំណែកសហគមន៍

#### ការ​អនុវត្តិ​បច្ចេកទេស
- **ការផ្ទៀងផ្ទាត់តំណ**: Script PowerShell អូតូម៉ាទិកបានផ្ទៀងផ្ទាត់ទំនាក់ទំនង .md ទាំងអស់
- **ត្រួតពិនិត្យមាតិការបស់ទំព័រ**: ពិនិត្យដោយដៃអំពីភាពពេញលេញនៃវគ្គសិក្សា និងសមស្របសម្រាប់អ្នកចាប់ផ្តើម
- **ប្រព័ន្ធរុករក**: ប្រព័ន្ធរុករកជំពូក និងម៉ូឌុលមានលំនាំសមរម្យ

#### កំណត់ចំណាំ
- **វិសាលភាព**: ការផ្លាស់ប្តូរត្រូវបានអនុវត្តលើឯកសារផ្ទាល់ភាសាអង់គ្លេសតែប៉ុណ្ណោះ
- **ការបកប្រែ**: ថតបកប្រែ មិនបានធ្វើបច្ចុប្បន្នភាពក្នុងកំណែនេះ (ការបកប្រែដោយស្វ័យប្រវត្តិនឹងសមកាលនៅក្រោយ)
- **រយៈពេលវគ្គសិក្សា**: វគ្គសិក្សាដែលបានបញ្ចប់ឥឡូវនេះផ្តល់ការរៀនជាការអនុវត្តប្រហែល 3-4 ម៉ោង

---

### [v3.8.0] - 2025-11-19

#### ឯកសាររីកចម្រើនខ្ពស់: ការតាមដាន, សុវត្ថិភាព, និងលំនាំ Multi-Agent
**កំណែនេះបន្ថែមមេរៀនថ្នាក់ A ដ៏ទូលំទូលាយអំពីការរួមបញ្ចូល Application Insights, លំនាំអត្តសញ្ញាណ និងការធ្វើសមស្រប Multi-Agent សម្រាប់ការដាក់ឡើងផលិតកម្ម។**

#### បានបន្ថែម
- **📊 មេរៀនការបញ្ចូល Application Insights**: ក្នុង `docs/pre-deployment/application-insights.md`:
  - ការដាក់ AZD ដែលផ្តោតលើការដាក់ឲ្យដំណើរការ និង provision ដោយស្វ័យកាល
  - គំរូ Bicep ពេញលេញសម្រាប់ Application Insights + Log Analytics
  - កម្មវិធី Python ធ្វើការ​បានជាមួយ telemetry ផ្ទាល់ខ្លួន (លើស 1,200 បន្ទាត់)
  - លំនាំតាមដាន AI/LLM (ការតាមដាន token/cost សម្រាប់ Microsoft Foundry Models)
  - 6 រូបភាព Mermaid (ស្ថាបត្យកម្ម, distributed tracing, ដំណើរការ telemetry)
  - 3 លំហាត់ផ្ទាល់ (ការជូនដំណឹង, ផ្ទាំងតារាងតាមដាន, ការតាមដាន AI)
  - ឧទាហរណ៍ query Kusto និងយុទ្ធសាស្ត្រកាត់បន្ថយចំណាយ
  - លំហែដំណឹង metrics រស់ និងការត្រួតពិនិត្យពេលវេលាពិត
  - ពេលរៀនប្រហែល 40-50 នាទីជាមួយលំនាំដែលអាចប្រើនៅផលិតកម្ម

- **🔐 មេរៀនលំនាំសុវត្ថិភាព និង authentication**: ក្នុង `docs/getting-started/authsecurity.md`:
  - 3 លំនាំ authentication (connection strings, Key Vault, managed identity)
  - គំរូ Bicep ពេញលេញសម្រាប់ដាក់ឲ្យដំណើរការដោយសុវត្ថិភាព
  - កូដ Node.js រួមបញ្ចូល Azure SDK
  - 3 លំហាត់ពេញលេញ (ដំណើរការ managed identity, user-assigned identity, Key Vault rotation)
  - បែបបទអនុវត្តល្អសម្រាប់សុវត្ថិភាព និងកំណត់ RBAC
  - មគ្គុទេសក៍ដោះស្រាយបញ្ហា និងវិភាគចំណាយ
  - លំនាំ authentication គ្រាន់តែប្រើពុំចាំបាច់ពាក្យសម្ងាត់សម្រាប់ផលិតកម្ម

- **🤖 មេរៀនលំនាំសមាសធាតុ Multi-Agent**: ក្នុង `docs/pre-deployment/coordination-patterns.md`:
  - 5 លំនាំសមាសធាតុ (លំដាប់, 병렬, ហៀងភាគ, បណ្ដាញព្រឹត្តិការណ៍, ស្មើភាពអនុញ្ញាត)
  - ចំណាត់ធ្វើសេវាអេសគត៍រូប (orchestrator) ពេញលេញ (Python/Flask, លើស 1,500 បន្ទាត់)
  - 3 ការអនុវត្ត agent ជាក់លាក់ (Research, Writer, Editor)
  - ការរួមបញ្ចូល Service Bus សម្រាប់ដាក់សារ queueing
  - Cosmos DB សម្រាប់គ្រប់គ្រងស្ថានភាពប្រព័ន្ធចែកចាយ
  - 6 រូបភាព Mermaid បង្ហាញអន្តរកម្មរវាង agents
  - 3 លំហាត់ជាន់ខ្ពស់ (ការគ្រប់គ្រង timeout, លីចសម្រាប់ retry, circuit breaker)
  - ការវិភាគចំណាយ ($240-565/month) និងយុទ្ធសាស្ត្របន្ថយចំណាយ
  - ការរួមបញ្ចូល Application Insights សម្រាប់តាមដាន

#### បានខ្ពស់ជាងមុន
- **ជំពូក Pre-deployment**: ឥឡូវនេះរួមបញ្ចូលការតាមដាន និងលំនាំសមាសធាតុ coordination ដែលទូលំទូលាយ
- **ជំពូក Getting Started**: ពង្រឹងជាមួយលំនាំ authentication ជាមុខវិជ្ជាជីវៈ
- **ភាពរួចរាល់សម្រាប់ផលិតកម្ម**: ឆែកគ្រប់ផ្នែកពីសុវត្ថិភាពដល់ observability ពេញលេញ
- **Course Outline**: ធ្វើបច្ចុប្បន្នភាពយោងទៅមេរៀនថ្មីនៅជំពូក 3 និង 6

#### ផ្លាស់ប្តូរ
- **លំដាប់ការសិក្សា**: ការរួមបញ្ចូលសុវត្ថិភាព និងការតាមដានកាន់តែប្រសើរ
- **គុណភាពឯកសារ**: ស្តង់ដារ A-grade សម្រាប់មេរៀនថ្មី (95-97%)
- **លំនាំផលិតកម្ម**: គ្របដណ្តប់ពីដើមដល់ចុងសម្រាប់ការដាក់ឡើងសម្រាប់សំណុំធំ

#### បានកែលម្អ
- **បទពិសោធន៍អ្នកអភិវឌ្ឍ**: ឯកសារ​បង្ហាញផ្លូវច្បាស់ពីការអភិវឌ្ឍទៅការតាមដាននៅផលិតកម្ម
- **ស្តង់ដារសុវត្ថិភាព**: លំនាំជាវិជ្ជាជីវៈសម្រាប់ authentication និងការគ្រប់គ្រង secrets
- **Observability**: ការចិញ្ចឹម Application Insights ពេញលេញជាមួយ AZD
- **លំហាត់ AI**: ការតាមដានពិសេសសម្រាប់ Microsoft Foundry Models និងស្ថាបត្យកម្ម multi-agent

#### បានផ្ទៀងផ្ទាត់
- ✅ មេរៀនទាំងអស់មានកូដធ្វើការ​ពេញលេញ (មិនមែនស្និបញ្ញស្ស៍)
- ✅ រូបត្រីវិបក Mermaid សម្រាប់ការរៀនដាច់ខាត (សរុប 19 ក្នុង 3 មេរៀន)
- ✅ លំហាត់ផ្ទាល់ជាមួយជ្រាបទិសផ្ទៀងផ្ទាត់ (សរុប 9)
- ✅ គំរូ Bicep សម្រាប់ផលិតកម្មដែលអាចdeploy តាម `azd up`
- ✅ វិភាគចំណាយ និងយុទ្ធសាស្ត្រកាត់បន្ថយ
- ✅ មគ្គុទេសក៍ដោះស្រាយបញ្ហា និងអនុវត្តល្អ
- ✅ ចំណុចផ្ទៀងផ្ទាត់ជំនាញជាមួយពាក្យបញ្ជាផ្ទៀងផ្ទាត់

#### លទ្ធផលការវាយតម្លៃឯកសារ
- **docs/pre-deployment/application-insights.md**: - មគ្គុទេសក៍តាមដានទូលំទូលាយ
- **docs/getting-started/authsecurity.md**: - លំនាំសុវត្ថិភាពជាវិជ្ជាជីវៈ
- **docs/pre-deployment/coordination-patterns.md**: - ស្ថាបត្យកម្ម multi-agent កម្រិតខ្ពស់
- **មាតិកាថ្មីសរុប**: - ស្តង់ដាគុណភាពខ្ពស់ដូចគ្នា

#### ការ​អនុវត្តិ​បច្ចេកទេស
- **Application Insights**: Log Analytics + telemetry ផ្ទាល់ខ្លួន + distributed tracing
- **Authentication**: Managed Identity + Key Vault + លំនាំ RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: លំហែ metrics រស់ + query Kusto + alerts + dashboards
- **គ្រប់គ្រងចំណាយ**: យុទ្ធសាស្ត្រ sampling, retention policies, គ្រប់គ្រងថវិកា

### [v3.7.0] - 2025-11-19

#### ការកែលម្អគុណភាពឯកសារ និងឧទាហរណ៍ Microsoft Foundry Models ថ្មី
**កំណែនេះធ្វើឲ្យគុណភាពឯកសារសរុបកាន់តែប្រសើរ និងបន្ថែមឧទាហរណ៍ Microsoft Foundry Models ពេញលេញសម្រាប់ការដាក់ gpt-4.1 chat interface។**

#### បានបន្ថែម
- **🤖 ឧទាហរណ៍ Microsoft Foundry Models Chat**: ការដាក់ gpt-4.1 ពេញលេញជាមួយអនុវត្តដែលដំណើរការបាននៅ `examples/azure-openai-chat/`:
  - សេវាស្ថាបត្យកម្ម Microsoft Foundry Models ពេញលេញ (ការដាក់ម៉ូឌុល gpt-4.1)
  - ពីntface chat command-line Python ជាមួយប្រវត្តិសន្ទនា
  - ការរួមបញ្ចូល Key Vault សម្រាប់ផ្ទុក API key យ៉ាងសុវត្ថិភាព
  - តាមដានការប្រើ token និងវិភាគចំណាយ
  - ការគ្រប់គ្រងអតិបរិមាប្រើបន្ទុក និងការបំបែកកំហុស
  - README ពេញលេញជាមួយមគ្គុទេសក៍ដាក់ឡើងប្រហែល 35-45 នាទី
  - 11 ហេតុផលឯកសារបំពាក់សម្រាប់ផលិតកម្ម (Bicep templates, Python app, ការកំណត់)
- **📚 លំហាត់ឯកសារ**: បន្ថែមលំហាត់អនុវត្តទៅកាន់មាគ៌ាការកំណត់:
  - លំហាត់ 1: ការកំណត់បរិយាកាសច្រើន (15 នាទី)
  - លំហាត់ 2: អនុវត្តការគ្រប់គ្រងសន្សំព័ត៌មាន (10 នាទី)
  - ការកំណត់លក្ខខណ្ឌជោគជ័យ និងជំហានផ្ទៀងផ្ទាត់ច្បាស់លាស់
- **✅ ការផ្ទៀងផ្ទាត់ការដាក់ឡើង**: បន្ថែមផ្នែកផ្ទៀងផ្ទាត់ទៅគណនីដាក់ឡើង:
  - ស្តង់ដារ health check
  - បញ្ចីលក្ខណៈជោគជ័យ
  - លទ្ធផលដែលថតរំពឹងទុកសម្រាប់ពាក្យបញ្ជាដាក់ឡើងទាំងអស់
  - ការយោងដោះស្រាយបញ្ហា

#### បានខ្ពស់ជាងមុន
- **examples/README.md**: ធ្វើបច្ចុប្បន្នភាពទៅកាន់គុណភាព A (93%):
  - បន្ថែម azure-openai-chat ទៅកាន់ផ្នែកទាក់ទងទាំងអស់
  - កែបរិមាណឧទាហរណ៍ក្នុងស្រុកពី 3 ទៅ 4
  - បញ្ចូលក្នុងតារាង AI Application Examples
  - រួមបញ្ចូលក្នុង Quick Start សម្រាប់អ្នកប្រើកម្រិតមធ្យម
  - បន្ថែមទៅ Microsoft Foundry Templates section
  - កែសម្រួល Comparison Matrix និងផ្នែកស្វែងរកបច្ចេកវិជ្ជា
- **គុណភាពឯកសារ**: ពង្រឹងពី B+ (87%) → A- (92%) នៅក្នុងថត docs:
  - បន្ថែមលទ្ធផលដែលរំពឹងទុកសម្រាប់ពាក្យបញ្ជាសំខាន់ៗ
  - បញ្ចូលជំហានផ្ទៀងផ្ទាត់សម្រាប់ការផ្លាស់ប្តូរកំណត់
  - ពង្រឹងការរៀនដោយអនុវត្តជាក់ស្តែង

#### ផ្លាស់ប្តូរ
- **លំដាប់ការរៀន**: ការរួមបញ្ចូលឧទាហរណ៍ AI សម្រាប់អ្នករៀនកម្រិតមធ្យមឲ្យល្អជាងមុន
- **រចនាសម្ព័ន្ធឯកសារ**: លំហាត់ច្បាស់ៗជាមួយលទ្ធផលដែលអាចសម្រេចបាន
- **ដំណើរការ​ផ្ទៀងផ្ទាត់**: ការកំណត់លក្ខខណ្ឌជោគជ័យផ្ទាល់ខ្លួនបានបន្ថែមក្នុងចំណោមប្រតិបត្តិការ

#### បានកែលម្អ
- **បទពិសោធន៍អ្នកអភិវឌ្ឍ**: ការដាក់ Microsoft Foundry Models ឥឡូវនេះចំណាយ 35-45 នាទី (បន្សល់ពី 60-90 នាទីសម្រាប់ជម្រើសស្មុគស្មាញ)
- **ភាពត្រឹមត្រូវក្នុងចំណាយ**: វាយតម្លៃចំណាយច្បាស់ ($50-200/month) សម្រាប់ឧទាហរណ៍ Microsoft Foundry Models
- **ផ្លូវការសិក្សា**: អ្នកអភិវឌ្ឍ AI មានចំណុចចាប់ផ្តើមច្បាស់ជាមួយ azure-openai-chat
- **ស្តង់ដារឯកសារ**: លទ្ធផលដែលរំពឹងទុក និងជំហានផ្ទៀងផ្ទាត់មានទៀងទាត់

#### បានផ្ទៀងផ្ទាត់
- ✅ ឧទាហរណ៍ Microsoft Foundry Models ដំណើរការបានពេញលេញជាមួយ `azd up`
- ✅ គ្រប់ 11 ឯកសារអនុវត្តមានសញ្ញាសមីទ្យាសាស្ត្រត្រឹមត្រូវ
- ✅ ចម្លើយ README ត្រូវនឹងបទពិសោធន៍ដាក់ឡើងពិត
- ✅ តំណឯកសារ បានធ្វើបច្ចុប្បន្នភាពគ្រប់ 8+ ទីតាំង
- ✅ លេខរាយនាមឧទាហរណ៍បង្ហាញ 4 ឧទាហរណ៍ក្នុងស្រុក
- ✅ មិនមានតំណទ្រនាប់ក្រៅខ្ពស់ក្នុងតារាង
- ✅ តំណរ Navigator ទាំងអស់ត្រឹមត្រូវ

#### ការ​អនុវត្តិ​បច្ចេកទេស
- **ស្ថាបត្យកម្ម Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps pattern
- **សុវត្ថិភាព**: Managed Identity មានស្រាប់, secrets នៅ Key Vault
- **តាមដាន**: ការរួមបញ្ចូល Application Insights
- **គ្រប់គ្រងចំណាយ**: តាមដាន token និងអុបទីម៉ាស់ការប្រើប្រាស់
- **ដាក់ឡើង**: ពាក្យបញ្ជា `azd up` តែមួយសម្រាប់ការតំឡើងពេញលេញ

### [v3.6.0] - 2025-11-19

#### កំណែធំ: ឧទាហរណ៍ការដាក់ឡើង Container App
**កំណែនេះណែនាំឧទាហរណ៍ការដាក់ឡើងកម្មវិធី container ច្រើនប្រើប្រាស់សម្រាប់ផលិតកម្ម ដែលរួមបញ្ចូលឯកសារពេញលេញ និងការរួមបញ្ចូលទៅក្នុងផ្លូវការរៀន។**

#### បានបន្ថែម
- **🚀 ឧទាហរណ៍ Container App**: ឧទាហរណ៍ក្នុងស្រុកថ្មីនៅ `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): ទិដ្ឋភាពទូលំទូលាយនៃការដាក់ឡើង containerized, quick start, ផលិតកម្ម និងលំនាំខ្ពស់
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API សាមញ្ញសមរម្យសម្រាប់អ្នកចាប់ផ្តើម ជាមួយ scale-to-zero, health probes, តាមដាន និងដោះស្រាយបញ្ហា
  - [Microservices Architecture](../../examples/container-app/microservices): ការដាក់ឡើងជាច្រើនសេវាកម្មសាកសមសម្រាប់ផលិតកម្ម (API Gateway, Product, Order, User, Notification), messaging អាស៊ីនក, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **អនុNearestធ្វើល្អបំផុត**: សុវត្ថិភាព, តាមដាន, ការកាត់បន្ថយចំណាយ, និងការណែនាំ CI/CD សម្រាប់បញ្ចុក container
- **ឧទាហរណ៍កូដ**: `azure.yaml` ពេញលេញ, គំរូ Bicep, និងអនុវត្តសេវាកម្មភាសាច្រើន (Python, Node.js, C#, Go)
- **ការធ្វើតេស្ត និងដោះស្រាយបញ្ហា**: សេនារីយ៍តេស្តពីចុងដល់ចុង, ពាក្យបញ្ជាតាមដាន, មគ្គុទេសក៍ដោះស្រាយបញ្ហា

#### ផ្លាស់ប្តូរ
- **README.md**: បានធ្វើបច្ចុប្បន្នភាពដើម្បីបង្ហាញនិងភ្ជាប់នូវឧទាហរណ៍កម្មវិធី​កុងតឺន័រ​ថ្មីៗទាំងនៅក្រោម "Local Examples - Container Applications"
- **examples/README.md**: បានធ្វើបច្ចុប្បន្នភាពដើម្បីពោលពាណនាឧទាហរណ៍កម្មវិធី​កុងតឺន័រ បន្ថែមធាតុក្នុងម៉ាត្រិចប្រៀបធៀប និងផ្លាស់ប្តូរការយោងបច្ចេកវិទ្យា/សາស្ត្រាប្រព័ន្ធ
- **Course Outline & Study Guide**: បានធ្វើបច្ចុប្បន្នភាពឲ្យយោងទៅឧទាហរណ៍កម្មវិធី​កុងតឺន័រ​ថ្មីៗ និងគំរូការដាក់ឲ្យដំណើរការនៅក្នុងជំពូកដែលពាក់ព័ន្ធ

#### Validated
- ✅ គ្រប់ឧទាហរណ៍ថ្មីអាចដាក់ឲ្យដំណើរការបានជាមួយ `azd up` ហើយអនុវត្តតាមលទ្ធិភាពល្អបំផុត
- ✅ តំណភ្ជាប់ឯកសារ និងការរុករកឯកសារ បានធ្វើបច្ចុប្បន្នភាព
- ✅ ឧទាហរណ៍គ្របដណ្តប់ពីអ្នកដើមទៅជំនាញខ្ពស់ រួមទាំងម៉ៃក្រូសេវាកម្មក្នុងបរិបទផលិតកម្ម

#### Notes
- **Scope**: ឯកសារ និងឧទាហរណ៍ជាភាសា​អង់គ្លេស​តែប៉ុណ្ណោះ
- **Next Steps**: ពង្រីកជាមួយគំរូកុងតែឺន័រ​ចុងក្រោយបន្ថែម និងអូតូម៉ាស៊ីស CI/CD នៅក្នុងកំណែបន្ទាប់

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**កំណែនេះអនុវត្តការផ្លាស់ប្តូរឈ្មោះផលិតផលយ៉ាងទូលំទូលាយពី "Microsoft Foundry" ទៅ "Microsoft Foundry" ក្នុងឯកសារជាភាសាអង់គ្លេសទាំងមូល ដើម្បីផ្ទៀងផ្ទាត់ភាពផ្លូវការរបស់ការកែប្រែម៉ាករបស់ Microsoft។**

#### Changed
- **🔄 Product Name Update**: ការផ្លាស់ប្តូរឈ្មោះទូលំទូលាយពី "Microsoft Foundry" ទៅ "Microsoft Foundry"
  - បានធ្វើបច្ចុប្បន្នភាពគ្រប់ការដូចយោងក្នុងឯកសារភាសាអង់គ្លេសនៅក្នុងថត `docs/`
  - ឈ្មោះថតបានប្តូរ: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ឈ្មោះ​ឯកសារ​បានប្តូរ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - សរុប: បានធ្វើបច្ចុប្បន្នភាពយោងមាតិកា 23 កន្លែងនៅក្នុងឯកសារដ៏ទៃទៀត 7 ឯកសារ

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` បានប្តូរឈ្មោះទៅ `docs/microsoft-foundry/`
  - គ្រប់ការដែលយោងជាអន្តរក្លោងបានធ្វើបច្ចុប្បន្នភាពដើម្បីបង្ហាញរចនាសម្ព័ន្ធថតថ្មី
  - តំណរុករកត្រូវបានផ្ទៀងផ្ទាត់ក្នុងឯកសារ​ទាំងមូល

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - គ្រប់តំណខាងក្នុងឯកសារ​បានធ្វើបច្ចុប្បន្នភាពឲ្យយោងឈ្មោះឯកសារថ្មី

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - បានធ្វើបច្ចុប្បន្នភាពតំណរុករកនាវីហ្គេសិន 3 កន្លែង
  - `docs/microsoft-foundry/ai-workshop-lab.md` - បានប្ដូរពាក្យយោងផលិតផល 4 កន្លែង
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - បានប្រើ Microsoft Foundry រួចហើយ (ពីការធ្វើបច្ចុប្បន្នភាពមុន)
  - `docs/microsoft-foundry/production-ai-practices.md` - បានធ្វើបច្ចុប្បន្នភាពយោង 3 កន្លែង (សង្ខេប, មតិយោបល់សហគមន៍, ឯកសារ)
  - `docs/getting-started/azd-basics.md` - បានធ្វើបច្ចុប្បន្នភាពតំណឆ្លង 4 កន្លែង
  - `docs/getting-started/first-project.md` - បានធ្វើបច្ចុប្បន្នភាពតំណនាវីហ្គេសិនជំពូក 2 កន្លែង
  - `docs/getting-started/installation.md` - បានធ្វើបច្ចុប្បន្នភាពតំណជំពូកបន្ទាប់ 2 កន្លែង
  - `docs/troubleshooting/ai-troubleshooting.md` - បានធ្វើបច្ចុប្បន្នភាពយោង 3 កន្លែង (នាវីហ្គេសិន, Discord community)
  - `docs/troubleshooting/common-issues.md` - បានធ្វើបច្ចុប្បន្នភាពតំណនាវីហ្គេសិន 1 កន្លែង
  - `docs/troubleshooting/debugging.md` - បានធ្វើបច្ចុប្បន្នភាពតំណនាវីហ្គេសិន 1 កន្លែង

- **Course Structure Files** (2 files):
  - `README.md` - បានធ្វើបច្ចុប្បន្នភាពយោង 17 កន្លែង (ទិដ្ឋភាពមេរៀន, ចំណងជើងជំពូក, ផ្នែកទំព័រស្ទង់ តេមផ្លេត, មតិយោបល់សហគមន៍)
  - `course-outline.md` - បានធ្វើបច្ចុប្បន្នភាពយោង 14 កន្លែង (ទិដ្ឋភាពទូទៅ, គោលបំណងការសិក្សា, ប្រភពជំពូក)

#### Validated
- ✅ គ្មានការយោងនៅសល់ទៅផ្លូវថត "ai-foundry" ក្នុងឯកសារ​ភាសាអង់គ្លេសទេ
- ✅ គ្មានការយោងឈ្មោះផលិតផល "Microsoft Foundry" នៅសល់ក្នុងឯកសារ​ភាសាអង់គ្លេសទេ
- ✅ តំណរុករកទាំងអស់ដំណើរការបានជាមួយរចនាសម្ព័ន្ធថតថ្មី
- ✅ ការប្ដូរឈ្មោះឯកសារ និងថត បានបញ្ចប់ដោយជោគជ័យ
- ✅ ការយោងអន្តរក្លោងរវាងជំពូកបានផ្ទៀងផ្ទាត់

#### Notes
- **Scope**: ការផ្លាស់ប្តូរត្រូវបានអនុវត្តលើឯកសារ​ភាសាអង់គ្លេសក្នុងថត `docs/` តែប៉ុណ្ណោះ
- **Translations**: ថតបកប្រែ (`translations/`) មិនត្រូវបានធ្វើបច្ចុប្បន្នភាពនៅក្នុងកំណែនេះ
- **Workshop**: សម្ភារៈសិក្ខាសាលា (`workshop/`) មិនត្រូវបានធ្វើបច្ចុប្បន្នភាពនៅក្នុងកំណែនេះ
- **Examples**: ឯកសារឧទាហរណ៍អាចជំពាក់នឹងឈ្មោះចាស់នៅឡើយ (នឹងត្រូវតែដោះស្រាយនៅក្នុងកំណែបន្ទាប់)
- **External Links**: URL ខាងក្រៅ និងការយោង GitHub ទាន់សម័យនៅដដែល

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**កំណែនេះបញ្ចូលការគាំទ្រពិសេសសម្រាប់មុខងារ Azure Developer CLI preview ថ្មី និងបង្កើនបទពិសោធន៍អ្នកប្រើសម្រាប់សិក្ខាសាលា។**

#### Added
- **🧪 azd provision --preview Feature Documentation**: ការពិពណ៌នាដែលគ្របដណ្តប់លម្អិតពីសមត្ថភាព infrastructure preview ថ្មី
  - ឯកសារយោងបញ្ជា និងឧទាហរណ៍ប្រើប្រាស់នៅក្នុង cheat sheet
  - ការបញ្ចូលលម្អិតនៅក្នុងមគ្គុទេសក៍ provisioning ជាមួយករណីប្រើ និងអត្ថប្រយោជន៍
  - ការបញ្ចូលត្រួតពិនិត្យមុនទម្រង់ (pre-flight check) សម្រាប់ការផ្ទៀងផ្ទាត់ការដាក់ឧបករណ៍ឲ្យមានសុវត្ថិភាពច្រើនขึ้น
  - ការធ្វើបច្ចុប្បន្នភាពក្នុងមគ្គុទេសក៍ចាប់ផ្ដើមជាមួយការអនុវត្តចំណាំសុវត្ថិភាពជាចម្បង
- **🚧 Workshop Status Banner**: ប័ណ្ណ HTML វាយប្រហារមុខងារផ្នែកស្ថានភាពសិក្ខាសាលាដែលមានស្ដង់ដារ​ជាជំនាញវិជ្ជាជីវៈ
  - ផ្ដល់រចនាបថក្រាឌីអង់ជាមួយនិមិត្តសញ្ញាការសាងសื่อសម្រាប់ការប្រាប់ដល់អ្នកប្រើយ៉ាងច្បាស់
  - បង្ហាញពេលវេលា last updated សម្រាប់ភាពទាន់តាម
  - រចនាឆ្លួងទូរស័ព្ទសម្រាប់ប្រភេទឧបករណ៍ទាំងអស់

#### Enhanced
- **Infrastructure Safety**: មុខងារ preview បានបញ្ចូលនៅជុំវិញឯកសារដាក់ឧបករណ៍ទាំងមូល
- **Pre-deployment Validation**: ស្គ្រីបអូតូម៉ាទដែលមានឥឡូវនេះរួមបញ្ចូលការធ្វើតេស្ត preview នៃអាគារដ្ឋាន
- **Developer Workflow**: លំដាប់បញ្ជាត្រូវបានធ្វើបច្ចុប្បន្នភាព ដើម្បីរួមបញ្ចូល preview ជា លទ្ធិប្រកបដោយល្អបំផុត
- **Workshop Experience**: ការរំពឹងទុកច្បាស់សម្រាប់អ្នកប្រើអំពីស្ថានភាពការអភិវឌ្ឍន៍មាតិកា

#### Changed
- **Deployment Best Practices**: ដំណើរការពិនិត្យមុន (preview-first) ពេលនេះក្លាយជាវិធីសាស្រ្តបានណែនាំ
- **Documentation Flow**: ការផ្ទៀងផ្ទាត់អាគារដ្ឋាន ត្រូវបានបញ្ជូនឲ្យនៅមុនជំហានក្នុងដំណើររៀន
- **Workshop Presentation**: ការទំនាក់ទំនងស្ថានភាពវិជ្ជាជីវៈជាមួយពេលវេលាអភិវឌ្ឍន៍ច្បាស់លាស់

#### Improved
- **Safety-First Approach**: ការផ្លាស់ប្តូរអាគារដ្ឋានឥឡូវអាចត្រូវបានផ្ទៀងផ្ទាត់មុនការដាក់ឧបករណ៍
- **Team Collaboration**: លទ្ធផល preview អាចចែករំលែកសម្រាប់ពិនិត្យ និងអនុម័ត
- **Cost Awareness**: ការយល់ដឹងល្អប្រសើរពីថ្លៃធនធានមុនការផ្តល់ធនធាន
- **Risk Mitigation**: ការកាត់បន្ថយភាពបរាជ័យក្នុងការដាក់ឧបករណ៍ដោយការផ្ទៀងផ្ទាត់ជាមុន

#### Technical Implementation
- **Multi-document Integration**: មុខងារ preview ត្រូវបានរាយការណ៍នៅក្នុងឯកសារសំខាន់ 4 ថយ
- **Command Patterns**: វិធីសាស្រ្តសញ្ញាសមាស និងឧទាហរណ៍មានភាពឆបគ្នាទូទាំងឯកសារ
- **Best Practice Integration**: Preview ត្រូវបានរួមបញ្ចូលក្នុងវគ្គធ្វើតេស្ត និងស្គ្រីប
- **Visual Indicators**: សញ្ញាថ្មីៗសម្រាប់វិសាលភាពងាយស្រួលស្គាល់

#### Workshop Infrastructure
- **Status Communication**: ប័ណ្ណ HTML វាយប្រហារ​ជាមួយរចនាបថក្រាឌីអង់
- **User Experience**: ស្ថានភាពអភិវឌ្ឍន៍ច្បាស់នឹងជួយកាត់បន្ថយការភាន់ច្រឡំ
- **Professional Presentation**: រក្សាកេរ្តិ៍ឈ្មោះឃ្លាំងកូដខណៈពេលសម្គាល់ការរំពឹងទុក
- **Timeline Transparency**: ពេលវេលា last updated ខែតុលា 2025 សម្រាប់ការទទួលខុសត្រូវ

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**កំណែនេះបញ្ចូលសម្ភារៈសិក្ខាសាលាដែលទូលំទូលាយជាមួយមគ្គុទេសក៍អន្តរកម្មក្នុងកម្មវិធី រួមទាំងផ្លូវការរៀនដែលបានរៀបចំយ៉ាងរឹងមាំ។**

#### Added
- **🎥 Interactive Workshop Guide**: បទពិសោធន៍សិក្ខាសាលាផ្សារភ្ជាប់កំណត់មួយក្នុងកម្មវិធីរកមើល MkDocs
- **📝 Structured Workshop Instructions**: មគ្គុទេសក៍រៀនដែលរៀបចំក្នុង 7 ជំហាន ចាប់ពីការរកឃើញដល់ការផ្លាស់ប្តូរ
  - 0-Introduction: សេចក្តីសង្ខេបសិក្ខាសាលា និងការតំឡើង
  - 1-Select-AI-Template: ដំណើរការរកឃើញ និងជ្រើសរើសទំព័រខ្នាត
  - 2-Validate-AI-Template: ការដាក់ឲ្យដំណើរការ និងដាក់តេស្តសុពលភាព
  - 3-Deconstruct-AI-Template: ការយល់ដឹងអំពីស្ថាបត្យកម្មទំព័រខ្នាត
  - 4-Configure-AI-Template: ការកំណត់រចនាដើម្បីប្ដូរ និងប្តូរចំណុច
  - 5-Customize-AI-Template: ការកែប្រែអភិបាលនិងភាពស៊ាំខ្ពស់
  - 6-Teardown-Infrastructure: ការសម្អាត និងការគ្រប់គ្រងធនធាន
  - 7-Wrap-up: សេចក្តីសរុប និងជំហានបន្ទាប់
- **🛠️ Workshop Tooling**: ការកំណត់ MkDocs ជាមួយថេម Material សម្រាប់បទពិសោធន៍រៀនការកែលម្អ
- **🎯 Hands-On Learning Path**: វិធីសាស្រ្ត 3 ជំហាន (ការរកឃើញ → ការដាក់ឲ្យដំណើរការ → ការប្ដូរ)
- **📱 GitHub Codespaces Integration**: ការតំឡើងបរិយាកាសអភិវឌ្ឍន៍ដោយរលូន

#### Enhanced
- **AI Workshop Lab**: ពង្រីកជាមួយបទពិសោធន៍រៀនរយៈពេល 2-3 ម៉ោង និងរបៀបរៀបចំពេញលេញ
- **Workshop Documentation**: ការបង្ហាញជាផ្ទាល់ខាងវិជ្ជាជីវៈជាមួយនាវីហ្គេសិន និងគំនូរ
- **Learning Progression**: មគ្គុទេសក៍ជំហានដោយជំហានច្បាស់ពីការជ្រើសទំព័រខ្នាតទៅដល់ការដាក់ឲ្យដំណើរការ​ក្នុងផលិតកម្ម
- **Developer Experience**: ឧបករណ៍បញ្ចូលសម្រាប់ដំណើរការអភិវឌ្ឍយ៉ាងរលូន

#### Improved
- **Accessibility**: មុខងារផ្ទាំងប្រាក់ក្នុងកម្មវិធីជាមួយស្វែងរក, ផ្ទុកចម្លង និងប្ដូរមុខងារ theme
- **Self-Paced Learning**: រចនាសម្ព័ន្ធសិក្ខាសាលាដែលអនុញ្ញាតឲ្យរៀនតាមល្មមនានា
- **Practical Application**: ករណីអនុវត្តនៅក្នុងពិផ្សារ​សម្រាប់ការដាក់ទំព័រខ្នាត AI ជាការពិត
- **Community Integration**: ការអភិវឌ្ឍន៍ក្រុមហ៊ុន Discord សម្រាប់គាំទ្រនិងសហការគ្នា

#### Workshop Features
- **Built-in Search**: រកឃើញពាក្យគន្លឹះ និងមេរៀនយ៉াভাবឆាប់រហ័ស
- **Copy Code Blocks**: មុខងារ hover-to-copy សម្រាប់ឧទាហរណ៍កូដទាំងអស់
- **Theme Toggle**: គាំទ្ររបៀបអ័ព្ទងងឹត/ភ្លឺសម្រាប់ចំណូលចិត្តផ្សេងៗ
- **Visual Assets**: រូបថតនិងសៀវភៅរាងរាងសម្រាប់ការយល់ដឹងល្អប្រសើរ
- **Help Integration**: ចូលអង្គភាព Discord ពីផ្ទាល់សម្រាប់ការគាំទ្រសហគមន៍

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**កំណែនេះបញ្ចូលរចនាសម្ព័ន្ធរៀបចំវគ្គរៀនដោយជំពូកយ៉ាងទូលំទូលាយ ដោយបង្កើនការរុករកឯកសារនៅទូទាំងឃ្លាំងកូដ។**

#### Added
- **📚 Chapter-Based Learning System**: បំបែកវគ្គសិក្សាទាំងមូលទៅជាឈ្មួញរៀន 8 ជំពូក ដោយមានលំដាប់ល្អ
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: ប្រព័ន្ធនាវីហ្គេសិនទូលំទូលាយនិងមានស្តង់ដារតាមទំព័រទាំងមូល
- **🎯 Progress Tracking**: បញ្ជីត្រួតពិនិត្យចប់វគ្គនិងប្រព័ន្ធផ្ទៀងផ្ទាត់ការសិក្សា
- **🗺️ Learning Path Guidance**: ចំណុចចូលច្បាស់សម្រាប់កម្រិតជំនាញនិងគោលដៅខុសៗគ្នា
- **🔗 Cross-Reference Navigation**: ជំពូកដែលពាក់ព័ន្ធ និងលក្ខណៈតម្រូវការត្រូវបានភ្ជាប់យ៉ាងច្បាស់

#### Enhanced
- **README Structure**: បានបម្លែងទៅជាវេទិកាវិទ្យាសាស្រ្តដែលរៀបចំជាជំពូក
- **Documentation Navigation**: រាល់ទំព័រឥឡូវនេះមាន context ជំពូក និងការណែនាំលំដាប់
- **Template Organization**: ឧទាហរណ៍ និងទំព័រខ្នាតបានផ្គូផ្គងទៅជំពូកដែលសមរម្យ
- **Resource Integration**: cheat sheets, FAQs, និងមគ្គុទេសក៍សិក្សាត្រូវបានភ្ជាប់ទៅជំពូកដែលពាក់ព័ន្ធ
- **Workshop Integration**: សេវាកម្មហាត់ការដៃបានផ្គូផ្គងទៅលទ្ធផលរាប់ជំពូក

#### Changed
- **Learning Progression**: បានផ្លាស់ពីឯកសាររឿយៗទៅជាបណ្តាញរៀនដែលបត់បែន
- **Configuration Placement**: សៀវភៅបញ្ជាក់ការកំណត់ត្រូវបានដាក់នៅជំពូក 3 ដើម្បីធ្វើឲ្យស្គរឡើងនូវចរចារ
- **AI Content Integration**: ការចូលបញ្ចូលមាតិកា AI កាន់តែប្រសើរពេញទូទាំងដំណើរការ
- **Production Content**: គំរូដែលមានកម្រិតខ្ពស់បានបង្រួមនៅជំពូក 8 សម្រាប់អ្នករៀនកម្រិតសហគ្រាស

#### Improved
- **User Experience**: breadcrumbs នាវីហ្គេសិន និងសញ្ញាការរីកចម្រើនជំពូកច្បាស់ឡើង
- **Accessibility**: លំនាំនាវីហ្គេសិនប្រកបដោយការស្រួលសម្រាប់ការរុករកវគ្គ
- **Professional Presentation**: ការរៀបចំបែបសាកលវិទ្យាល័យសាកសមសម្រាប់ការបណ្តុះបណ្តាលសាជីវកម្មនិងសាកលវិទ្យាល័យ
- **Learning Efficiency**: កាត់បន្ថយពេលវេលាក្នុងការស្វែងរកមាតិកាដែលពាក់ព័ន្ធតាមរយៈការរៀបចំដែលល្អប្រសើរ

#### Technical Implementation
- **Navigation Headers**: នាវីហ្គេសិនជំពូកបានវាយឲ្យស្ដង់ដារទៅលើឯកសារ 40+ ទំព័រ
- **Footer Navigation**: មគ្គុទេសក៍វដ្តចុះជាបណ្តាញនិងសញ្ញាចប់ជំពូកក្រោមទំព័រ
- **Cross-Linking**: ប្រព័ន្ធការភ្ជាប់យោងក្នុងទំព័រដ៏ទូលំទូលាយភ្ជាប់មុខងារពាក់ព័ន្ធ
- **Chapter Mapping**: ឧទាហរណ៍ និងទំព័រខ្នាតត្រូវបានភ្ជាប់យ៉ាងច្បាស់ទៅគោលបំណងការសិក្សា

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: ធ្វើសម្រួលមគ្គុទេសក៍សិក្សាដើម្បីសមស្របជាមួយប្រព័ន្ធ 8 ជំពូក
- **🎯 Chapter-Based Assessment**: រៀបចំគោលបំណងសិក្សានិងលំហាត់អនុវត្តសម្រាប់រៀងរាល់ជំពូក
- **📋 Progress Tracking**: កាផ្គត់ផ្គង់កាលវិភាគរៀនប្រចាំសប្ដាហ៍ជាមួយលទ្ធផល可វាស់បាននិងបញ្ជីត្រួតពិនិត្យការសម្រេច
- **❓ Assessment Questions**: សំណួរផ្ទៀងផ្ទាត់ចំណេះដឹងសម្រាប់រាល់ជំពូកដែលមានលទ្ធផលវិជ្ជាជីវៈ
- **🛠️ Practical Exercises**: សកម្មភាពអនុវត្តន៍ជាក់ស្តែងជាមួយករណីដាក់ឧបករណ៍ពិត និងវិធីដោះស្រាយបញ្ហា
- **📊 Skill Progression**: ការវាយស្ដីពីការរីកចម្រើនពីមូលដ្ឋានទៅម៉ូឌែលសហគ្រាស ជាមួយផែនការកើតមានការរីកចម្រើនសម្គាល់ជំនាញ
- **🎓 Certification Framework**: លទ្ធភាពអភិវឌ្ឍវិជ្ជាជីវៈ និងការទទួលស្គាល់ពីសហគមន៍
- **⏱️ Timeline Management**: ផែនការរៀបចំ 10 សប្ដាហ៍ដែលមានដំណាក់កាល និងការផ្ទៀងផ្ទាត់មើលលទ្ធផល

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**កំណែនេះធ្វើឲ្យដំណោះស្រាយ multi-agent ទាំងអស់ប្រសើរឡើងសម្រាប់វិស័យលក់រាយ ដោយមានការប្រែឈ្មោះនៃភ្នាក់ងារ និងឯកសារបង្ហាញលំអិតជាន់ខ្ពស់។**

#### Changed
- **Multi-Agent Terminology**: បានជំនួស "Cora agent" ជា "Customer agent" ក្នុងសំណុំដំណោះស្រាយ multi-agent ផ្នែកលក់រាយ ដើម្បីឲ្យយល់បានច្បាស់ជាងមុន
- **Agent Architecture**: បានធ្វើបច្ចុប្បន្នភាពឯកសារ ទំព័រ ARM និងឧទាហរណ៍កូដទាំងអស់ ដើម្បីប្រើឈ្មោះ "Customer agent" មួយដែលមានភាពសមរម្យ
- **Configuration Examples**: បានទំនើបបែបបទកំណត់រចនាភ្នាក់ងារជាមួយការប្រើឈ្មោះថ្មី
- **Documentation Consistency**: ប្រាកដថាគ្រប់យោងបានប្រើឈ្មោះភ្នាក់ងារដែលមានទំលាប់វិជ្ជាជីវៈ និងពិពណ៌នាបានច្បាស់

#### Enhanced
- **ARM Template Package**: បានអាប់ដេត retail-multiagent-arm-template ជាមួយយោងទៅកាន់ Customer agent
- **Architecture Diagrams**: បានបង្កើនភាពទាន់សម័យគំនូរស្ថាបត្យកម្ម Mermaid ជាមួយការកំណត់ឈ្មោះ agent ថ្មី
- **Code Examples**: ថ្នាក់ Python និងឧទាហរណ៍ការអនុវត្តឥឡូវពាក់ព័ន្ធនឹងការកំណត់ឈ្មោះ CustomerAgent
- **Environment Variables**: បានធ្វើបច្ចុប្បន្នភាពស្គ្រីប deployment ទាំងអស់ឲ្យប្រើ​គំរូ CUSTOMER_AGENT_NAME

#### Improved
- **Developer Experience**: ជាក់លាក់ស្វែងយល់អំពីតួនាទី និងបំណងរបស់ agent ក្នុងឯកសារ
- **Production Readiness**: តម្រូវការ​សមហេខ្យល់ល្អជាមួយ​ពាក្យ​ឈ្មោះ​សហគ្រាស
- **Learning Materials**: ការកំណត់ឈ្មោះ agent ធ្វើអោយងាយស្រួលសម្រាប់សិក្សា
- **Template Usability**: ការយល់ដឹងកាន់តែងាយស្រួលអំពីមុខងារ agent និងលំនាំ deployment

#### Technical Details
- បានធ្វើបច្ចុប្បន្នភាពគំនូរស្ថាបត្យកម្ម Mermaid ជាមួយយោង到 CustomerAgent
- បានជំនួសឈ្មោះថ្នាក់ CoraAgent ជាមួយ CustomerAgent ក្នុងឧទាហរណ៍ Python
- បានកែប្រែការកំណត់konfiguration JSON នៅក្នុង ARM template ដើម្បីប្រើប្រភេទ agent "customer"
- បានធ្វើបច្ចុប្បន្នភាព environment variables ពី CORA_AGENT_* ទៅ CUSTOMER_AGENT_* ទ្រង់ទ្រាយ
- បានធ្វើសម្រួលកំណត់បញ្ជា deployment និងការកំណត់ container ទាំងអស់

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**កំណែនេះបម្លែងឃ្លាំងកូដទៅជាធនធានសិក្សាផ្តោតលើ AI ដ៏ទូលំទូលាយ ជាមួយការរួមបញ្ចូល Microsoft Foundry។**

#### Added
- **🤖 AI-First Learning Path**: ការរៀបចំឡើងវិញពេញលេញដែលផ្តោតសំខាន់លើអ្នកអភិវឌ្ឍន៍ AI និងវិស្វករ
- **Microsoft Foundry Integration Guide**: ឯកសារបង្ហាញលម្អិតសម្រាប់ភ្ជាប់ AZD ជាមួយសេវាកម្ម Microsoft Foundry
- **AI Model Deployment Patterns**: មគ្គុទេសក៍លម្អិតចcovers ជម្រើសម៉ូឌែល ការកំណត់ និងយុទ្ធសាស្ត្រដាក់បញ្ចូលក្នុងផលិតកម្ម
- **AI Workshop Lab**: កាស្តីហ្វង់កិច្ចប្រតិបត្តិ 2-3 ម៉ោង សម្រាប់បម្លែងកម្មវិធី AI ជាដំណោះស្រាយដែលអាច deploy ដោយ AZD
- **Production AI Best Practices**: លំនាំរួមសម្រាប់កម្រិតសហគ្រាសសម្រាប់ការលាស់សារា ការត្រួតពិនិត្យ និងសុវត្ថិភាពរបស់ AI workloads
- **AI-Specific Troubleshooting Guide**: មគ្គុទេសក៍ដោះស្រាយបញ្ហាដ៏ពេញលេញសម្រាប់ Microsoft Foundry Models, Cognitive Services, និងបញ្ហាក្នុងការដាក់ប្រើ AI
- **AI Template Gallery**: សមាសធាតុឧទាហរណ៍ Microsoft Foundry ដែលបានលើកតម្កើងជាមួយការវាយតម្លៃកម្រិតស្មុគស្មាញ
- **Workshop Materials**: រចនាសម្ព័ន្ធសិក្សាសម្រាប់សិក្ខាសាលាសម្បូរជាមួយមេរៀនហើយឯកសារយោង

#### Enhanced
- **README Structure**: ផ្តោតលើអ្នកអភិវឌ្ឍន៍ AI ជាមួយទិន្នន័យចំណាប់អារម្មណ៍សហគមន៍ 45% ពី Microsoft Foundry Discord
- **Learning Paths**: ផ្លូវសិក្សាផ្តាច់មុខសម្រាប់អ្នកអភិវឌ្ឍ AI នៅក្បែរផ្លូវធម្មតាសម្រាប់និស្សិត និងវិស្វករវិភាគ DevOps
- **Template Recommendations**: ការផ្ដល់អនុសាសន៍ទំព័រទំព័រលម្អិតរួមមាន azure-search-openai-demo, contoso-chat, និង openai-chat-app-quickstart
- **Community Integration**: ការគាំទ្រក្នុង Discord បានពង្រឹងដោយបន្ថែមប្ដូររាងបន្ទាត់សម្រាប់ AI និងការពិភាក្សា

#### Security & Production Focus
- **Managed Identity Patterns**: ការផ្លាស់ប្តូរជាក់លាក់សម្រាប់ការផ្ទៀងផ្ទាត់ និងការ​កំណត់សុវត្ថិភាពដ៏ពាក់ព័ន្ធ AI
- **Cost Optimization**: ការ​តាមដានការប្រើ Token និងការត្រួតពិនិត្យថវិកាសម្រាប់ workloads AI
- **Multi-Region Deployment**: យុទ្ធសាស្ត្រសម្រាប់ការដាក់ AI នៅតំបន់ច្រើនជាសកល
- **Performance Monitoring**: មាត្រដ្ឋានទាក់ទង AI និងការរួមបញ្ចូល Application Insights

#### Documentation Quality
- **Linear Course Structure**: ជំហានតាមរយៈពីមូលដ្ឋានដល់ការដាក់បញ្ចូល AI លើកដំបូងដល់កម្រិតខ្ពស់
- **Validated URLs**: លីងภายนอกទាំងអស់ត្រូវបានផ្ទៀងផ្ទាត់ និងអាចចូលបាន
- **Complete Reference**: លីងឯកសារជាច្រៃក្នុងទាំងអស់បានផ្ទៀងផ្ទាត់ និងប្រតិបត្តិការ​បាន
- **Production Ready**: លំនាំដាក់ក្នុងផលិតកម្មសម្រាប់ករណីពិតប្រាកដ

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**កំណែនេះបង្ហាញពីការផ្លាស់ប្តូរយ៉ាងសំខាន់លើរចនាសម្ព័ន្ធ repository និងរបៀបបង្ហាញមាតិការជាជំនាញ។**

#### Added
- **Structured Learning Framework**: មាតិកា១ទំព័រអ៊ីក្រិចឥឡូវមានផ្នែក Introduction, Learning Goals, និង Learning Outcomes
- **Navigation System**: បន្ថែមតំណ Previous/Next សម្រាប់មេរៀនទាំងអស់សម្រាប់ការណែនាំការរៀន
- **Study Guide**: study-guide.md ពេញលេញជាមួយគោលដៅសិក្សា លំហាត់អនុវត្ត និងសម្ភារៈការវាយតម្លៃ
- **Professional Presentation**: យកអញ្ញើញរូបមន្ត emoji ទាំងអស់ចេញសម្រាប់ភាពចូលដំណើរការល្អប្រសើរ និងរូបភាពជំនាញ
- **Enhanced Content Structure**: ការរៀបចំ និងលំហូរសម្រាប់សម្ភារៈសិក្សាត្រូវបានធ្វើឲ្យប្រសើរ

#### Changed
- **Documentation Format**: ធ្វើស្តង់ដារ​ឯកសារទាំងអស់ជាស្ថាបត្យកម្មផ្តោតលើការរៀនស្មុគស្មាញ
- **Navigation Flow**: អនុវត្តជំហានលូតលាស់យល់ល្អតាមមាតិកា
- **Content Presentation**: យកធាតុតុបតែងចេញ ដើម្បីមានពិពណ៌នាច្បាស់ និងបច្ចេកទេស
- **Link Structure**: បានធ្វើបច្ចុប្បន្នភាពលីងក្នុងសាលីទាំងអស់ដើម្បីគាំទ្រត្រីតំណប្រព័ន្ធនាវីហ្គេសិនថ្មី

#### Improved
- **Accessibility**: យកការពឹងផ្អែកលើ emoji ចេញសម្រាប់ភាពឆ្លើយតបទៅកាន់ screen reader ល្អប្រសើរ
- **Professional Appearance**: រូបមន្តស្អាត និងស្ដង់ដារសាកសមសម្រាប់ការសិក្សាសហគ្រាស
- **Learning Experience**: វិធីសាស្ត្ររៀនដែលមានសរីរាង្គជាមួយគោលដៅ និងលទ្ធផលច្បាស់លាស់សម្រាប់មេរៀននីមួយៗ
- **Content Organization**: ខ្សែស្រឡាយត្រឹមត្រូវ និងការតភ្ជាប់ច្បាស់រវាងប្រធានបទដែលទាក់ទង

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - ស៊េរីមគ្គុទេសក៍ getting-started ទាំងស្រុង
  - ឯកសារដាក់បង្ហាញនិងវិធីសាស្ត្រដាក់ក្នុងផលិតកម្ម
  - ឯកសារដោះស្រាយបញ្ហាលម្អិត និងមគ្គុទេសក៍ដាក់ស្ដង់
  - ឧបករណ៍ និងនីតិវិធីផ្ទៀងផ្ទាត់មុនដាក់

- **Getting Started Module**
  - AZD Basics: គំនិតមូលដ្ឋាន និងពាក្យទាក់ទង
  - Installation Guide: សេចក្តីណែនាំការតំឡើងលើវេទិកាប្រភេទផ្សេងៗ
  - Configuration Guide: ការរៀបចំបរិយាកាស និងការផ្ទៀងផ្ទាត់
  - First Project Tutorial: មេរៀនដៃខ្នើយជាលំដាប់ជំហាន

- **Deployment and Provisioning Module**
  - Deployment Guide: ឯកសារកាលវិធីសរសេរផ្ទាល់ workflow ពេញលេញ
  - Provisioning Guide: Infrastructure as Code ជាមួយ Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: ការផ្ទៀងផ្ទាត់ភាពអាចប្រើបាននៃធនធាន Azure
  - SKU Selection: លម្អិតនៃជម្រើសសេវាកម្រិត
  - Pre-flight Checks: ស្គ្រីបផ្ទៀងផ្ទាត់អំពីមុនប្រតិបត្តិការ (PowerShell និង Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: បញ្ហាទូទៅដែលប្រហែលជាជួបប្រទៈ និងដំណោះស្រាយ
  - Debugging Guide: វិធីសាស្ត្រដោះស្រាយបញ្ហាដោយមានលំដាប់
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: ឯកសារយោងឆាប់សម្រាប់ពាក្យបញ្ជាចាំបាច់
  - Glossary: ពាក្យនិងកំណត់ន័យពេញលេញ
  - FAQ: ចម្លើយលម្អិតសម្រាប់សំណួរញឹកញាប់
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: ការណែនាំក្នុងការតំឡើង និងកំណត់សម្រាប់ Windows, macOS, និង Linux
- **Multiple Skill Levels**: មាតិការរចនាសម្រាប់ជួរកម្រិតជំនាញចាប់ពីនិស្សិតដល់អ្នកអភិវឌ្ឍវិជ្ជាជីវៈ
- **Practical Focus**: ឧទាហរណ៍អនុវត្ត និងសន្ទស្សន៍ករណីពិត
- **Comprehensive Coverage**: ពីគ្រឹះមូលដ្ឋានដល់លំនាំសហគ្រាសកម្រិតខ្ពស់
- **Security-First Approach**: លំនាំសុវត្ថិភាពបានបញ្ចូលជាសមាសភាគទូទៅ
- **Cost Optimization**: ការណែនាំសម្រាប់ដាក់បញ្ចូលដែលសន្សំសំចៃថវិកា និងការគ្រប់គ្រងធនធាន

#### Documentation Quality
- **Detailed Code Examples**: ឧទាហរណ៍កូដណែនាំដែលបានសាកល្បង និងអនុវត្ត
- **Step-by-Step Instructions**: មគ្គុទេសក៍ច្បាស់ និងអាចអនុវត្តបាន
- **Comprehensive Error Handling**: ការដោះស្រាយបញ្ហានានាទៅក្នុងឯកសារ
- **Best Practices Integration**: ស្តង់ដារ និងអនុសាសន៍ឧស្សាហកម្ម
- **Version Compatibility**: ត្រូវតែទាន់សម័យជាមួយសេវាកម្ម Azure ដើម និងមុខងារ azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: ក្បួនរួមប្រតិបត្តិការសម្រាប់ Hugging Face, Azure Machine Learning, និងម៉ូឌែលផ្ទាល់ខ្លួន
- **AI Agent Frameworks**: គំរូសម្រាប់ LangChain, Semantic Kernel, និង AutoGen deployments
- **Advanced RAG Patterns**: ជម្រើសមូលដ្ឋានទិន្នន័យវ៉ិចទ័រច្រើនទៀតក្រៅពី Azure AI Search (Pinecone, Weaviate, និងដូចជា)
- **AI Observability**: ការត្រួតពិនិត្យកាន់តែខ្លាំងសម្រាប់កម្រិតប្រសិទ្ធភាពម៉ូឌែល ការប្រើ token និងគុណភាពចម្លើយ

#### Developer Experience
- **VS Code Extension**: បទពិសោធន៍អភិវឌ្ឍន៍រួម AZD + Microsoft Foundry
- **GitHub Copilot Integration**: ជំនួយ AI សម្រាប់ការបង្កើត template AZD
- **Interactive Tutorials**: លំហាត់កូដអនឡាញមានការផ្ទៀងផ្ទាត់ជាអត្ដរាគមន៍សម្រាប់គ្រោងករណី AI
- **Video Content**: មេរៀនវីដេអូបន្ថែមសម្រាប់អ្នកសិក្សាដែលចូលចិត្តមើល ដាក់ផ្តោតលើការដាក់ប្រើ AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: គំនិតគ្រប់គ្រងម៉ូឌែល AI, គោលការណ៍បំពេញតាមច្បាប់, និងតាមរកការអញ្ជើញ
- **Multi-Tenant AI**: លំនាំសម្រាប់ផ្តល់សេវាកម្មទាន់មួយច្រើនអតិថិជនដោយដាច់ផ្តាច់
- **Edge AI Deployment**: ការរួមបញ្ចូលជាមួយ Azure IoT Edge និង container instances
- **Hybrid Cloud AI**: លំនាំដាក់ពហុពពក និងហ៊ីប៊ីដសម្រាប់ workloads AI

#### Advanced Features
- **AI Pipeline Automation**: ការរួមបញ្ចូល MLOps ជាមួយ Azure Machine Learning pipelines
- **Advanced Security**: លំនាំ zero-trust, private endpoints, និងការការពារគំរូធ្ងន់
- **Performance Optimization**: ការតម្រង់តាមលំដាប់ និងយុទ្ធសាស្ត្រកំណត់ទំហំសម្រាប់កម្មវិធី AI ដែលមាន throughput ខ្ពស់
- **Global Distribution**: លំនាំចែកចាយមាតិកា និង caching នៅវគ្គ edge សម្រាប់កម្មវិធី AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: ការរួមបញ្ចូល Microsoft Foundry ជាផ្នែកពេញលេញ (Completed)
- ✅ **Interactive Tutorials**: សិក្ខាសាលា AI hands-on lab (Completed)
- ✅ **Advanced Security Module**: លំនាំសុវត្ថិភាពពាក់ព័ន្ធ AI (Completed)
- ✅ **Performance Optimization**: វិធីសាស្ត្រកំណត់ tune workloads AI (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: សេណារីយ៉ូលដ្ឋានដាក់ប្រើ AI (Completed)
- ✅ **Extended FAQ**: សំណួរញឹកញាប់ពាក់ព័ន្ធ AI និងការដោះស្រាយ (Completed)
- **Tool Integration**: លំហ NASIDE IDE និងការរួមបញ្ចូល editor កាន់តែខុសគ្នា
- ✅ **Monitoring Expansion**: ការត្រួតពិនិត្យ និងការជូនដំណឹងពាក់ព័ន្ធ AI (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: រចនាបទឆ្លើយឆ្លងសម្រាប់ការសិក្សាផ្ទាល់ទូរស័ព្ទ
- **Offline Access**: កញ្ចប់ឯកសារដែលអាចទាញយកបាន
- **Enhanced IDE Integration**: វេចខ្ចប់ VS Code សម្រាប់ AZD + វិថីការងារ AI
- **Community Dashboard**: គ្រប់គ្រងមាតិកាសហគមន៍ពេលវេលាពិត និងតាមដានការរួមចំណែក

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: ទម្រង់តាម semantic versioning (major.minor.patch)
2. **Date**: កាលបរិច្ឆេទចេញឬ​ធ្វើបច្ចុប្បន្នភាពក្នុងទម្រង់ YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: ពណ៌នាខ្លី សចំពោះអ្វីដែលបានផ្លាស់ប្តូរ
5. **Impact Assessment**: វាប៉ះពាល់ដល់អ្នកប្រើប្រាស់ដែលមានស្រាប់យ៉ាងដូចម្តេច

### Change Categories

#### Added
- ប្រសិទ្ធភាពថ្មីៗ ផ្នែកឯកសារ ឬសមត្ថភាពថ្មី
- ឧទាហរណ៍ ថ្នាក់ឧទាហរណ៍ ឬធនធានសិក្សាថ្មី
- ឧបករណ៍ ស្គ្រីប ឬអង្គធាតុជួយ

#### Changed
- ការកែប្រែទៅលើមុខងារឬឯកសារដែលមានស្រាប់
- បច្ចុប្បន្នភាពដើម្បីបង្កើនភាពច្បាស់លាស់ ឬភាពត្រឹមត្រូវ
- ការរៀបចំកំណត់ផ្ទុក ឬអង្គភាពមាតិការឡើងវិញ

#### Deprecated
- លក្ខណៈ ឬវិធីសាស្ត្រដែលកំពុងត្រៀមលុបចោល
- ផ្នែកឯកសារដែលបានសង្ស័យនឹងលុបចេញ
- វិធីសាស្ត្រដែលមានជម្រើសល្អប្រសើរជាងនេះ

#### Removed
- លក្ខណៈ ឯកសារ ឬឧទាហរណ៍ដែលមិនទាក់ទងទៀត
- ព័ត៌មានចាស់ ឬវិធីសាស្ត្រដែលបានបានលុបចេញ
- មាតិកាដែលស្ទើរតែក្នុងសហគ្រាស

#### Fixed
- ការកែបញ្ហា នៅក្នុងឯកសារ ឬកូដ
- ដោះស្រាយបញ្ហាដែលបានរាយការណ៍
- ការកែលម្អភាពត្រឹមត្រូវ ឬមុខងារ

#### Security
- ការកែលម្អឬជួសជុលទាក់ទងសុវត្ថិភាព
- បច្ចុប្បន្នភាពនៃអនុសាសន៍សុវត្ថិភាព
- ដោះស្រាយរបួសសុវត្ថិភាព

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- ការផ្លាស់ប្តូរលំបាកដែលទាមទារឱ្យអ្នកប្រើចាត់ចែង
- ការរៀបចំឡើងវិញយ៉ាងសំខាន់នៃមាតិកា ឬរចនាសម្ព័ន្ធ
- ការផ្លាស់ប្តូរដែលបំលែងវិធីសាស្ត្រមូលដ្ឋាន

#### Minor Version (X.Y.0)
- មុខងារថ្មី ឬការបន្ថែមមាតិកា
- ការកែលម្អដែលរក្សា backward compatibility
- ឧទាហរណ៍ ឧបករណ៍ ឬធនធានបន្ថែម

#### Patch Version (X.Y.Z)
- ការកែបកុង និងកំណត់ខុសត្រូវ
- ការកែលម្អតិចតួចទៅលើមាតិកាដែលមានស្រាប់
- ការបញ្ជាក់ និងការកែលម្អតូចៗ

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: រាយការណ៍បញ្ហា ឬណែនាំការកែលម្អ (សំណួរពាក់ព័ន្ធ AI ស្វាគមន៌)
- **Discord Discussions**: ចែករំលែកគំនិត និងចូលរួមជាមួយសហគមន៍ Microsoft Foundry
- **Pull Requests**: ឧបត្ថម្ភការកែលម្អโดยផ្ទាល់ទៅមាតិកា ជាទិស especially AI templates និងមគ្គុទេសក៍
- **Microsoft Foundry Discord**: ចូលរួមនៅក្នុងឆានែល #Azure សម្រាប់ការពិភាក្សា AZD + AI
- **Community Forums**: ចូលរួមក្នុងការពិភាក្សាអ្នកអភិវឌ្ឍ Azure ទូលំទូលាយ

### Feedback Categories
- **AI Content Accuracy**: ការសង្ស័យឬកែតម្រូវលើការរួមបញ្ចូលសេវាកម្ម AI និងការដាក់ប្រើ
- **Learning Experience**: សំណើសម្រាប់ផ្លាស់ប្តូរផ្លូវស្វែងយល់សម្រាប់អ្នកអភិវឌ្ឍ AI
- **Missing AI Content**: សំណើសម្រាប់ឧទាហរណ៍ template ឬលំនាំបន្ថែមពាក់ព័ន្ធ AI
- **Accessibility**: ការកែលម្អសម្រាប់តម្រូវការសិក្សាផ្សេងៗ
- **AI Tool Integration**: ជំនួយសម្រាប់ការរួមបញ្ចូល workflow អភិវឌ្ឍ AI
- **Production AI Patterns**: សំណើសម្រាប់លំនាំដាក់ក្នុងផលិតកម្ម AI សម្រាប់សហគ្រាស

### Response Commitment
- **Issue Response**: រាយការតបចាប់ក្នុងរយៈ 48 ម៉ោងសម្រាប់បញ្ហាដែលបានរាយការណ៍
- **Feature Requests**: វាយតម្រូវក្នុងរយៈមួយសប្តាហ៍
- **Community Contributions**: ពិនិត្យក្នុងរយៈមួយសប្តាហ៍
- **Security Issues**: ជាការប្រញាប់ទាន់ចិត្តមានអាទិភាពបន្ទាន់

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: ការផ្ទៀងផ្ទាត់ភាពត្រឹមត្រូវនៃមាតិកា និងលីង
- **Quarterly Updates**: ការបន្ថែមមាតិកាចម្បង និងកែលម្អ
- **Semi-Annual Reviews**: ការរៀបចំឡើងវិញ និងកែលម្អយ៉ាងទូលំទូលាយ
- **Annual Releases**: ការចេញកំណែធំជាមួយការកែលម្អសំខាន់ៗ

### Monitoring and Quality Assurance
- **Automated Testing**: ការផ្ទៀងផ្ទាត់ជាស្វយ័តលើឧទាហរណ៍កូដ និងលីង
- **Community Feedback Integration**: បញ្ចូលយោបល់អ្នកប្រើជាប្រចាំ
- **Technology Updates**: តម្រូវភាពឲ្យសមស្របជាមួយសេវាកម្ម Azure និងកំណែ azd ថ្មីៗ
- **Accessibility Audits**: ការត្រួតពិនិត្យជាប្រចាំសម្រាប់គោលនីយោបាយរចនាបទរួម

## Version Support Policy
- **កំណែធំថ្មីបំផុត**: គាំទ្រពេញល/full 지원ជាមួយនឹងការអាប់ដេតទៀងទាត់
- **កំណែធំមុន**: ការអាប់ដេតសុវត្ថិភាព និងការជួសជុលសំខាន់ៗ រយៈពេល 12 ខែ
- **កំណែចាស់ៗ**: គាំទ្រដោយសហគមន៍តែប៉ុណ្ណោះ មិនមានអាប់ដេតផ្លូវការទេ

### ការណែនាំសម្រាប់ការផ្លាស់ទី
ពេលដែលមានការចេញផ្សាយកំណែធំ យើងផ្ដល់:
- **មគ្គុទេសក៍ផ្លាស់ទី**: សេចក្តីណែនាំជំហានៗសម្រាប់ការផ្លាស់ទី
- **កំណត់សម្គាល់ភាពសមរម្យ**: ព័ត៌មានលម្អិតអំពីការផ្លាស់ប្ដូរដែលបំបែកភាពសមស្រប
- **គាំទ្រឧបករណ៍**: ស្គ្រីប ឬ ឧបករណ៍ជំនួយសម្រាប់ជួយក្នុងការផ្លាស់ទី
- **គាំទ្រដោយសហគមន៍**: វេទិកាផ្តាច់មុខសម្រាប់សំណួរពាក់ព័ន្ធនឹងការផ្លាស់ទី

---

**ការរុករក**
- **មេរៀនមុន**: [មគ្គុទេសក៍សិក្សា](resources/study-guide.md)
- **មេរៀនបន្ទាប់**: ត្រឡប់ទៅ [README ចម្បង](README.md)

**នៅឲ្យទាន់ព័ត៌មាន**: តាមដានឃ្លាំងកូដនេះសម្រាប់ការជូនដំណឹងអំពីការចេញផ្សាយថ្មីៗ និងការអាប់ដេតសំខាន់ៗចំពោះសម្ភារៈការសិក្សា។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការមិនទទួលខុសត្រូវ**:
ឯកសារនេះបានបកប្រែដោយប្រើសេវាបកប្រែដោយ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះបីយើងខិតខំស្វែងរកភាពត្រឹមត្រូវក៏ដោយ សូមចំណាំថា ការបកប្រែដោយស្វ័យប្រវត្តិនេះអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមនៅក្នុងភាសាម្ចាស់គួរត្រូវបានយកជាប្រភពដែលមានសុពលភាព។ សម្រាប់ព័ត៌មានដែលមានសារៈសំខាន់ យើងណែនាំឱ្យប្រើការបកប្រែដោយអ្នកជំនាញមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសណាមួយដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
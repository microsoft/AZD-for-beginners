# చేంజ్‌లాగ్ - AZD For Beginners

## పరిచయం

ఈ చేంజ్‌లాగ్ AZD For Beginners రిపోజిటరీలో జరిగిన అన్ని ప్రధాన మార్పులు, నవీకరణలు మరియు మెరుగుదలలను డాక్యుమెంట్ చేస్తుంది. మేము సేమాంటిక్ వెర్షనింగ్ సిద్ధాంతాలను అనుసరిస్తూ వేరియంట్ల మధ్య ఏమి మారిందో ఉపయోగకర్తలు అర్ధం చేసుకోవడానికి ఈ లాగ్‌ను నిర్వహిస్తాము.

## అభ్యసన లక్ష్యాలు

ఈ చేంజ్‌లాగ్‌ను సమీక్షించడం ద్వారా మీరు:
- కొత్త ఫీచర్లు మరియు కంటెంట్ జోడింపుల గురించి అప్డేట్లను తెలుసుకోవచ్చు
- ఉన్న డాక్యూమెంటేషన్‌లో చేసిన మెరుగుదలలను అర్ధం చేసుకోవచ్చు
- ఖచ్చితత్వాన్ని నిర్ధారించడానికి బగ్ ఫిక్సులు మరియు సవరణలను ట్రాక్ చేయండి
- శిక్షణ సామగ్రి కాలక్రమంగా ఎలా అభివృద్ధి చెందిందను అనుసరించండి

## అభ్యసన ఫలితాలు

చేంజ్‌లాగ్ ఎంట్రీలను సమీక్షించిన తర్వాత, మీరు చేయగలిగే పనులు:
- అభ్యసనానికి అందుబాటులో ఉన్న కొత్త కంటెంట్ మరియు వనరులను గుర్తించగలుగుతారు
- ఏ సెక్షన్లు నవీకరించబడ్డాయో లేదా మెరుగుపరచబడ్డాయో అర్థం చేసుకోవచ్చు
- 가장 తాజా సామగ్రి ఆధారంగా మీ అభ్యసన మార్గాన్ని యోచించవచ్చు
- భవిష్యత్ మెరుగుదలల కోసం అభిప్రాయాలు మరియు సూచనలు ఇవ్వగలుగుతారు

## వెర్షన్ ఇతిహాసం

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**ఈ వెర్షన్ మొత్తం AI-సంబంధిత చాప్టర్లలో `azd ai`, `azd extension`, మరియు `azd mcp` కమాండ్ కవరేజ్‌ను చేర్చుతుంది, agents.md లో బ్రోకెన్ లింకులు మరియు డిప్రికేటెడ్ కోడ్‌ను సరిచేస్తుంది, చీట్ షీట్‌ను అప్డేట్ చేస్తుంది, మరియు Example Templates సెక్షన్‌ను ధృవీకరించిన వివరణలతో మరియు కొత్త Azure AI AZD టెంప్లేట్లతో పునఃనిర్మించుతుంది.**

#### జోడించబడింది
- **🤖 AZD AI CLI కవరేజ్** 7 ఫైళ్లలో విస్తరించబడింది (మునుపటి స్థితిలో ఇది רק Chapter 8లో ఉండేది):
  - `docs/chapter-01-foundation/azd-basics.md` — కొత్త "Extensions and AI Commands" సెక్షన్, ఇందులో `azd extension`, `azd ai agent init`, మరియు `azd mcp` పరిచయం
  - `docs/chapter-02-ai-development/agents.md` — ఎంపిక 4: `azd ai agent init` తో టెంప్లేట్ vs మ్యానిఫెస్ట్ దృక్కోణాల జోడింపు పట్టిక
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" మరియు "Agent-First Deployment" ఉపసెక్షన్లు
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ఇప్పుడు టెంప్లేట్ మరియు మ్యానిఫెస్ట్-ఆధారిత డిప్లాయ్‌మెంట్ మార్గాలను చూపిస్తుంది
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy సెక్షన్ ఇప్పుడే `azd ai agent init` ఎంపికను కలిగి ఉంది
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" ఉపసెక్షన్
  - `resources/cheat-sheet.md` — కొత్త "AI & Extensions Commands" సెక్షన్ లో `azd extension`, `azd ai agent init`, `azd mcp`, మరియు `azd infra generate`
- **📦 కొత్త AZD AI ఉదాహరణ టెంప్లేట్లు** `microsoft-foundry-integration.md` లో:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, మరియు voice chat మద్దతుతో .NET RAG చాట్
  - **azure-search-openai-demo-java** — Langchain4J ఉపయోగించే Java RAG చాట్, ACA/AKS డిప్లాయ్‌మెంట్ ఎంపికలతో
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, మరియు Prompty ఉపయోగించే బహు-ఏజెంట్ క్రియేటివ్ రైటింగ్ యాప్
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ఉపయోగించే సర్వర్‌లెస్ RAG, Ollama లో స్థానిక డెవ్ మద్దతుతో
  - **chat-with-your-data-solution-accelerator** — అడ్మిన్ పోర్టల్, Teams ఇంటిగ్రేషన్, మరియు PostgreSQL/Cosmos DB ఎంపికలతో ఎంటర్ప్రైజ్ RAG ఆకసలరేటర్
  - **azure-ai-travel-agents** — servers .NET, Python, Java, మరియు TypeScript లో ఉన్న మల్టీ-ఏజెంట్ MCP ఆర్కెస్ట్రేషన్ రిఫరెన్స్ యాప్
  - **azd-ai-starter** — కనిష్ట Azure AI ఇన్‌ఫ్రాస్ట్రక్చర్ Bicep స్టార్టర్ టెంప్లేట్
  - **🔗 Awesome AZD AI Gallery link** — రిఫరెన్స్ కోసం [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### సరిచేయబడింది
- **🔗 agents.md నావిగేషన్**: Previous/Next లింకులు ఇప్పుడు Chapter 2 README పాఠ్య క్రమానికి అనుగుణంగా సరిచేయబడ్డాయి (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md బ్రోకెన్ లింకులు**: `production-ai-practices.md` ను `../chapter-08-production/production-ai-practices.md` గా సవరించబడింది (3 చోట్ల)
- **📦 agents.md డిప్రికేటెడ్ కోడ్**: `opencensus` ను `azure-monitor-opentelemetry` + OpenTelemetry SDK తో మార్చేశారు
- **🐛 agents.md చెల్లని API**: `max_tokens` ను `create_agent()` నుండి `create_run()` లో `max_completion_tokens`గా మార్చారు
- **🔢 agents.md టోకెన్ లెక్కలు**: ముడి `len//4` అంచనాను `tiktoken.encoding_for_model()` తో మార్చారు
- **azure-search-openai-demo**: సేవలను "Cognitive Search + App Service" నుండి "Azure AI Search + Azure Container Apps" గా సరిచేశారు (డిఫాల్ట్ హోస్ట్ మార్చబడింది Oct 2024)
- **contoso-chat**: వివరణను Azure AI Foundry + Promptyని సూచించేలా అప్డేట్ చేశారు, రిపో యొక్క వాస్తవ శీర్షిక మరియు టెక్ స్టాక్‌కు అనుగుణంగా

#### తొలగించబడింది
- **ai-document-processing**: పనికిరాని టెంప్లేట్ రిఫరెన్స్ తొలగించబడింది (రిపో AZD టెంప్లేట్ గా పబ్లిక్ గా అందుబాటులో లేదు)

#### మెరుగుపరచబడింది
- **📝 agents.md వ్యాయామాలు**: Exercise 1 ఇప్పుడు ఆశించిన అవుట్‌పుట్ మరియు `azd monitor` స్టెప్ చూపిస్తుంది; Exercise 2లో పూర్తి `FunctionTool` రిజిస్ట్రేషన్ కోడ్ ఉంది; Exercise 3లో అస్పష్ట మార్గదర్శకాన్ని స్పష్టం చేయడానికి `prepdocs.py` కమాండ్లు జోడించబడ్డాయి
- **📚 agents.md వనరులు**: డాక్యుమెంటేషన్ లింకులను ప్రస్తుత Azure AI Agent Service డాక్స్ మరియు క్విక్స్టార్ట్‌కు నవీకరించారు
- **📋 agents.md Next Steps పట్టిక**: పూర్తి చాప్టర్ కవరేజ్ కోసం AI Workshop Lab లింకు జోడించారు

#### నవీకరించబడిన ఫైళ్లు
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### కోర్సు నావిగేషన్ మెరుగుదల
**ఈ వెర్షన్ README.md చాప్టర్ నావిగేషన్‌ను మెరుగుపరచి ఒక విస్తృతమైన పట్టిక ఫార్మాట్ జోడించింది.**

#### మార్చబడింది
- **కోర్సు మ్యాప్ పట్టిక**: డైరక్ట్ పాఠ్య లింకులు, వ్యవధి అంచనాలు, మరియు సంక్లిష్టత రేటింగ్లతో మెరుగుపరచబడింది
- **ఫోల్డర్ క్లీన్అప్**: పునరావృత పాత ఫోల్డర్లను తొలగించారు (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **లింక్ ధృవీకరణ**: Course Map పట్టికలోని 21+ అంతర్గత లింకులు అన్ని ధృవీకరించబడ్డాయి

### [v3.16.0] - 2026-02-05

#### ఉత్పత్తి పేరుల నవీకరణలు
**ఈ వెర్షన్ ప్రొడక్ట్ సూచనలను ప్రస్తుత Microsoft బ్రాండింగ్‌కు అనుగుణంగా నవీకరిస్తుంది.**

#### మార్చబడింది
- **Microsoft Foundry → Microsoft Foundry**: అనువాదం కాని ఫైళ్లను 제외 చేసి అన్ని సూచనలను అప్డేట్ చేశారు
- **Azure AI Agent Service → Foundry Agents**: సర్వీస్ పేరు ప్రస్తుత బ్రాండింగ్‌ను ప్రతిబింబించేలా అప్డేట్ చేయబడింది

#### నవీకరించబడిన ఫైళ్లు
- `README.md` - ప్రధాన కోర్సు ల్యాండింగ్ పేజీ
- `changelog.md` - వెర్షన్ ఇతిహాసం
- `course-outline.md` - కోర్సు నిర్మాణం
- `docs/chapter-02-ai-development/agents.md` - AI ఏజెంట్స్ గైడ్
- `examples/README.md` - ఉదాహరణల డాక్యుమెంటేషన్
- `workshop/README.md` - వర్క్‌షాప్ ల్యాండింగ్ పేజీ
- `workshop/docs/index.md` - వర్క్‌షాప్ సూచిక
- `workshop/docs/instructions/*.md` - అన్ని వర్క్‌షాప్ సూచనా ఫైళ్లు

---

### [v3.15.0] - 2026-02-05

#### ప్రధాన రిపోజిటరీ పునఃరూపకల్పన: ఛాప్టర్-ఆధారిత ఫోల్డర్ పేర్లు
**ఈ వెర్షన్ డాక్యుమెంటేషన్‌ను స్పష్టమైన నావిగేషన్ కోసం ప్రత్యేక ఛాప్టర్ ఫోల్డర్లలో తిరగరచింది.**

#### ఫోల్డర్ పేర్ల మార్పులు
పాత ఫోల్డర్లు ఛాప్టర్-నంబర్ ఫోల్డర్లతో మార్చబడ్డాయి:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- కొత్తగా జోడించబడినది: `docs/chapter-05-multi-agent/`

#### ఫైల్ మైగ్రేషన్లు
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

#### జోడించబడింది
- **📚 ఛాప్టర్ README ఫైళ్లు**: ప్రతి ఛాప్టర్ ఫోల్డర్లో README.md సృష్టించబడింది, ఇందులో:
  - అభ్యసన లక్ష్యాలు మరియు వ్యవధి
  - వివరణలతో పాఠ్య పట్టిక
  - త్వరిత ప్రారంభ కమాండ్లు
  - ఇతర ఛాప్టర్‌లకు నావిగేషన్

#### మార్చబడింది
- **🔗 అన్ని అంతర్గత లింకులు అప్డేట్ చేయబడ్డాయి**: 78+ పాత మార్గాలు అన్ని డాక్యుమెంట్ ఫైళ్లలో నవీకరించబడ్డాయి
- **🗺️ ప్రధాన README.md**: కొత్త ఛాప్టర్ నిర్మాణంతో Course Map అప్డేట్ చేయబడింది
- **📝 examples/README.md**: ఛాప్టర్ ఫోల్డర్లకు సంబంధించిన క్రాస్-రెఫరెన్సులను నవీకరించారు

#### తొలగించబడింది
- పాత ఫోల్డర్ నిర్మాణం (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### రిపోజిటరీ పునఃరూపకల్పన: ఛాప్టర్ నావిగేషన్
**ఈ వెర్షన్ ఛాప్టర్ నావిగేషన్ README ఫైళ్లను జోడించింది (v3.15.0 ద్వారా అధిగమించబడింది).**

---

### [v3.13.0] - 2026-02-05

#### కొత్త AI ఏజెంట్స్ గైడ్
**ఈ వెర్షన్ Azure Developer CLIతో AI ఏజెంట్స్‌ను డిప్లాయ్ చేయటానికి సమగ్ర గైడ్‌ని జోడిస్తుంది.**

#### జోడించబడింది
- **🤖 docs/microsoft-foundry/agents.md**: పూర్తిగా కవర చేస్తుంది:
  - AI ఏజెంట్స్ అంటే ఏమిటి మరియు అవి చాట్బాట్స్ నుంచి ఎలా భిన్నంగా ఉంటాయో
  - మూడు క్విక్-స్టార్ట్ ఏజెంట్ టెంప్లేట్లు (Foundry Agents, Prompty, RAG)
  - ఏజెంట్ ఆర్కిటెక్చర్ నమూనాలు (సింగిల్ ఏజెంట్, RAG, మల్టీ-ఏజెంట్)
  - టూల్ కాన్ఫిగరేషన్ మరియు అనుకరణ
  - మానిటరింగ్ మరియు మెట్రిక్స్ ట్రాకింగ్
  - ఖర్చు పరంగా గమనికలు మరియు ఆప్టిమైజేషన్
  - సాధారణ ట్రబుల్షూటింగ్ సన్నివేశాలు
  - విజయం ప్రమాణాలతో మూడు హ్యాండ్స్-ఆన్ వ్యాయామాలు

#### కంటెంట్ నిర్మాణం
- **పరిచయం**: మొదటిదశ అభ్యసకుల కోసం ఏజెంట్ కాన్సెప్ట్‌లు
- **క్విక్ స్టార్టు**: `azd init --template get-started-with-ai-agents` తో ఏజెంట్స్‌ను డిప్లాయ్ చేయడం
- **ఆర్కిటెక్చర్ నమూనాలు**: ఏజెంట్ నమూనాల యొక్క విజువల్ డయాగ్రామ్లు
- **కాన్ఫిగరేషన్**: టూల్ సెటప్ మరియు ఎన్విరాన్‌మెంట్ వేరియబుల్స్
- **మానిటరింగ్**: Application Insights ఇంటిగ్రేషన్
- **వ್ಯಾಸాయామాలు**: దశలవారీగా హ్యాండ్స్-ఆన్ మార్గదర్శకాలు (ప్రతిఒక్కటి 20-45 నిమిషాలు)

---

### [v3.12.0] - 2026-02-05

#### DevContainer పరిసరాల నవీకరణ
**ఈ వెర్షన్ AZD అభ్యసన అనుభవానికి ఆధునిక టూల్స్ మరియు మెరుగైన డిఫాల్ట్స్‌తో డెవలప్‌మెంట్ కంటెయినర్ కాన్ఫిగరేషన్‌ను నవీకరిస్తుంది.**

#### మార్చబడింది
- **🐳 బేస్ ఇమేజ్**: `python:3.12-bullseye` నుండి `python:3.12-bookworm` (తాజాగా Debian స్థిరత్వం)గా నవీకరించబడింది
- **📛 కంటెయినర్ పేరు**: స్పష్టత కోసం "Python 3" నుండి "AZD for Beginners" గా పేరు మార్చబడింది

#### జోడించబడింది
- **🔧 New Dev Container Features**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Pre-configured ports for common development:
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

- **⚙️ VS Code Settings**: Added default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Added MkDocs minify plugin
  - Added pre-commit for code quality
  - Added Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now verifies AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**ఈ వెర్షన్ README.md ను ప్రారంభకులకు మరింత చేరువగా మార్చి, AI డెవలపర్ల కోసం ప్రధానమైన వనరులను జోడిస్తుంది.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: ప్రతి టూల్ ఎప్పుడు ఉపయోగించాలో సాధ్యవంతమైన ఉదాహరణలతో స్పష్టమైన వివరణ
- **🌟 Awesome AZD Links**: సాముదాయ టెంప్లెట్ గ్యాలరీ మరియు కాంట్రిబ్యూషన్ వనరులకు నేర లింకులు:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ డిప్లాయ్ కోసం సిద్ధమైన టెంప్లేట్లు
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - కమ్యూనిటీ కాంట్రిబ్యూషన్
- **🎯 Quick Start Guide**: సులభీకృత 3-దశల ప్రారంభ విభాగం (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: డెవలపర్ అనుభవాన్ని ఆధారంగా ఎక్కడ మొదలు పెట్టాలో స్పష్టమైన మార్గదర్శకత

#### Changed
- **README Structure**: దశల వారీ బయటపెంపు కోసం పునఃసంఘటనం - ముఖ్య సమాచారం ముందుగా
- **Introduction Section**: పూర్తిగా ప్రారంభకులకు "The Magic of `azd up`" ని వివరించేందుకు పునఃరచన చేయబడింది
- **Removed Duplicate Content**: పునరావృత ట్రబుల్‌షూటింగ్ విభాగాన్ని తొలగించారు
- **Troubleshooting Commands**: `azd logs` సూచనను సరైన `azd monitor --logs` గా సరిదిద్దారు

#### Fixed
- **🔐 Authentication Commands**: cheat-sheet.mdలో `azd auth login` మరియు `azd auth logout` జతచేయబడ్డాయి
- **Invalid Command References**: README ట్రబుల్‌షూటింగ్ విభాగం నుండి మిగిలిన `azd logs` ను తొలగించారు

#### Notes
- **Scope**: మార్పులు ప్రధాన README.md మరియు resources/cheat-sheet.md కి వర్తించబడ్డాయి
- **Target Audience**: మార్పులు ప్రత్యేకంగా AZD కొత్తగా ఉపయోగించే డెవలపర్లకు లక్ష్యంగా ఉన్నాయి

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**ఈ వెర్షన్ డాక్యుమెంటేషన్ వంతంతట్లో ఉనికిలో లేని AZD కమాండ్లను సరిచేసి, అన్ని కోడ్ ఉదాహరణలు చెల్లుబాటు అయ్యే Azure Developer CLI సింటాక్స్ ను ఉపయోగించేటట్లు నిర్ధారిస్తుంది.**

#### Fixed
- **🔧 ఉనికిలో లేని AZD కమాండ్లు తొలగించబడ్డాయి**: చెల్లని కమాండ్లకు సమగ్ర ఆడిట్ మరియు సవరణలు:
  - `azd logs` (ఉనికిలో లేదు) → స్థానంలో `azd monitor --logs` లేదా Azure CLI ప్రత్యామ్నాయాలు
  - `azd service` subcommands (ఉనికిలో లేవు) → స్థానంలో `azd show` మరియు Azure CLI
  - `azd infra import/export/validate` (ఉనికిలో లేవు) → తొలగించబడింది లేదా చెల్లుబాటు అయ్యే ప్రత్యామ్నాయాలతో మార్చబడింది
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (ఉనికిలో లేవు) → తొలగించబడ్డాయి
  - `azd provision --what-if/--rollback` flags (ఉనికిలో లేవు) → `--preview` ఉపయోగించడానికి నవీకరించబడింది
  - `azd config validate` (ఉనికిలో లేదు) → `azd config list` తో ప్రత్యామ్నాయంగా మార్చబడింది
  - `azd info`, `azd history`, `azd metrics` (ఉనికిలో లేవు) → తొలగించబడ్డాయి

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: కమాండ్ సూచికలో పూర్తి పునఃరచన చేయబడింది
  - `docs/deployment/deployment-guide.md`: రోల్బ్యాక్ మరియు డిప్లాయ్‌మెంట్ వ్యూహాలను సరిచేశారు
  - `docs/troubleshooting/debugging.md`: లాగ్ విశ్లేషణ విభాగాలను సరిచేశారు
  - `docs/troubleshooting/common-issues.md`: ట్రబుల్‌షూటింగ్ కమాండ్లను నవీకరించారు
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD డీబగ్గింగ్ సెక్షన్ సరి చేయబడింది
  - `docs/getting-started/azd-basics.md`: మానిటరింగ్ కమాండ్లను సరిచేశారు
  - `docs/getting-started/first-project.md`: మానిటరింగ్ మరియు డీబగ్గింగ్ ఉదాహరణలను నవీకరించారు
  - `docs/getting-started/installation.md`: హెల్ప్ మరియు వెర్షన్ ఉదాహరణలను సరిచేశారు
  - `docs/pre-deployment/application-insights.md`: లాగ్ వీక్షణ కమాండ్లను సరిచేశారు
  - `docs/pre-deployment/coordination-patterns.md`: ఏజెంట్ డీబగ్గింగ్ కమాండ్లను సరిచేశారు

#### Changed
- **Rollback Strategies**: డాక్యుమెంటేషన్‌లో Git-ఆధారిత రోల్బ్యాక్ ఉపయోగించే విధానం నవీకరించబడింది (AZDకి స్థానిక రోల్బ్యాక్ లేదు)
- **Log Viewing**: `azd logs` సూచనలను `azd monitor --logs`, `azd monitor --live`, మరియు Azure CLI కమాండ్లతో మార్చారు
- **Performance Section**: ఉనికిలో లేని parallel/incremental deployment ఫ్లాగ్‌లను తొలగించి చెల్లుబాటు అయ్యే ప్రత్యామ్నాయాలను అందించారు

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: కమాండ్లు Azure Developer CLI v1.23.x ఆధారంగా ధృవీకరించబడ్డాయి

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**ఈ వెర్షన్ ఇంటరాక్టివ్ వర్క్‌షాప్ మాడ్యూల్స్‌ను పూర్తి చేస్తుంది, అన్ని బ్రోకెన్ డాక్యుమెంటేషన్ లింకులను సరిచేస్తుంది, మరియు Microsoft AZD ఉపయోగించే AI డెవలపర్ల కోసం మొత్తం కంటెంట్ నాణ్యతను మెరుగుపరుస్తుంది.**

#### Added
- **📝 CONTRIBUTING.md**: కొత్త కాంట్రిబ్యూషన్ మార్గదర్శక డాక్యుమెంట్ తో:
  - సమస్యలు నివేదించడానికి మరియు మార్పులకు ప్రతిపాదనలు చేయడానికి స్పష్టమైన సూచనలు
  - కొత్త కంటెంట్ కోసం డాక్యుమెంటేషన్ ప్రమాణాలు
  - కోడ్ ఉదాహరణల మార్గదర్శకాలు మరియు కమిట్ సందేశాల విధానాలు
  - కమ్యూనిటీ ఎంగేజ్‌మెంట్ సమాచారం

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: wrap-up మాడ్యూల్ పూర్తి చేయబడింది, ఇందులో:
  - వర్క్‌షాప్ సఫల్యాలను సమగ్రంగా సారాంశం
  - AZD, టెంప్లేట్స్, మరియు Microsoft Foundry గురించి మాస్టరీ చేసిన కీలక భావనల విభాగం
  - అభ్యసన ప్రవాహాన్ని కొనసాగించాలని సూచనలు
  - వర్క్‌షాప్ ఛాలెంజ్ వ్యాయామాలు కష్టం రేటింగ్‌లతో
  - కమ్యూనిటీ స్పందన మరియు సహాయ లింకులు

- **📚 Workshop Module 3 (Deconstruct)**: లెర్నింగ్ లక్ష్యాలను నవీకరించడం:
  - GitHub Copilot తో MCP సర్వర్లు యాక్టివేట్ చేయడానికి గైడ్
  - AZD టెంప్లేట్ ఫోల్డర్ స్ట్రక్చర్ అవగాహన
  - ఇన్‌ఫ్రాస్ట్రక్చర్-ఎజ్-కోడ్ (Bicep) సంస్థాపనా నమూనాలు
  - హ్యాండ్స్-ఆన్ల్యాబ్ సూచనలు

- **🔧 Workshop Module 6 (Teardown)**: పూర్తి చేయబడింది:
  - వనరుల క్లీనప్ మరియు ఖర్చు నిర్వహణ లక్ష్యాలు
  - సురక్షిత ఇన్‌ఫ్రాస్ట్రక్చర్ డిప్రొవిజనింగ్ కోసం `azd down` ఉపయోగం
  - సాఫ్ట్-డిలీట్ అయిన cognitive services రికవరీ గైడ్
  - GitHub Copilot మరియు Azure Portal కోసం బోనస్ ఎక్స్‌ప్లోరేషన్ ప్రమ్ప్ట్స్

#### Fixed
- **🔗 Broken Link Fixes**: 15+ బ్రోకెన్ అంతర్గత డాక్యుమెంటేషన్ లింకులను పరిష్కరించారు:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md కి మార్గాలను సరిచేశారు
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md మరియు production-ai-practices.md మార్గాలను సరిచేశారు
  - `docs/getting-started/first-project.md`: ఉనికిలో లేని cicd-integration.md ను deployment-guide.md తో మార్చారు
  - `examples/retail-scenario.md`: FAQ మరియు ట్రబుల్‌షూటింగ్ గైడ్ మార్గాలను సరిచేశారు
  - `examples/container-app/microservices/README.md`: కోర్స్ హోమ్ మరియు డిప్లాయ్‌మెంట్ గైడ్ మార్గాలను సరిచేశాయి
  - `resources/faq.md` మరియు `resources/glossary.md`: AI అధ్యాయ సూచనలను నవీకరించబడ్డాయి
  - `course-outline.md`: ఇన్‌స్ట్రక్టర్ గైడ్ మరియు AI వర్క్‌షాప్ ల్యాబ్ సూచనలను సరిచేశాయి

- **📅 Workshop Status Banner**: "Under Construction" నుండి క్రియాశీల వర్క్‌షాప్ స్థితికి 2026 ఫిబ్రవరి తేదీతో నవీకరించారు

- **🔗 Workshop Navigation**: workshop README.md లోని బ్రోకెన్ నావిగేషన్ లింకులను సరిచేశారు, అవి lab-1-azd-basics ఫోల్డర్‌ను సూచించడం రద్దు చేసి సరైన లింకులకి మార్చబడ్డాయి

#### Changed
- **Workshop Presentation**: "under construction" హెచ్చరికను తీసివేసి, వర్క్‌షాప్ ఇప్పుడు పూర్తి మరియు ఉపయోగానికి సిద్ధంగా ఉంది
- **Navigation Consistency**: అన్ని వర్క్‌షాప్ మాడ్యూల్స్‌కు సరైన ఇంటర్-మాడ్యూల్ నావిగేషన్ నిర్ధారించబడింది
- **Learning Path References**: అధ్యాయ క్రాస్-రెఫరెన్సెస్ microsoft-foundry మార్గాలకి సరిచేయబడ్డాయి

#### Validated
- ✅ అన్ని ఆంగ్ల markdown ఫైళ్లలో చెల్లుబాటు అయ్యే అంతర్గత లింకులు ఉన్నాయి
- ✅ వర్క్‌షాప్ మాడ్యూల్స్ 0-7 వరకు పూర్తి చేయబడ్డాయి మరియు లెర్నింగ్ లక్ష్యాలతో ఉన్నాయి
- ✅ అధ్యాయాల మరియు మాడ్యూల్స్ వెనుక నావిగేషన్ సరిగ్గా పనిచేస్తుంది
- ✅ కంటెంట్ Microsoft AZD ఉపయోగించే AI డెవలపర్లకు అనుకూలంగా ఉంది
- ✅ ప్రారంభకులకు అనుకూల భాష మరియు నిర్మాణం కొనసాగుతోంది
- ✅ CONTRIBUTING.md కమ్యునిటీ కాంట్రిబ్యూటర్లకు స్పష్టమైన మార్గదర్శకత అందిస్తుంది

#### Technical Implementation
- **Link Validation**: అన్ని .md అంతర్గత లింకులను ఆటోమెటెడ్ PowerShell స్క్రిప్ట్ ద్వారా ధృవీకరించారు
- **Content Audit**: వర్క్‌షాప్ పూర్తి మరియు ప్రారంభకులకు అనుకూలత కోసం మాన్యవల్ సమీక్ష నిర్వహించబడింది
- **Navigation System**: స్థిరమైన అధ్యాయ మరియు మాడ్యూల్ నావిగేషన్ నమూనాలు అమలు చేయబడ్డాయి

#### Notes
- **Scope**: మార్పులు ఆంగ్ల డాక్యుమెంటేషన్‌కు మాత్రమే వర్తిస్తాయి
- **Translations**: ఈ వెర్షన్‌లో అనువాద ఫొల్డర్లు నవీకరించబడలేదు (ఆటోమేటిక్ అనువాదం తర్వాత సింక్ అవుతుంది)
- **Workshop Duration**: పూర్తి వర్క్‌షాప్ ఇప్పుడు 3-4 గంటల హ్యాండ్స్-ఆన్ అభ్యాసాన్ని అందిస్తుంది

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**ఈ వెర్షన్ Application Insights ఇంటిగ్రేషన్, ఆథెంటికేషన్ నమూనాలు, మరియు ప్రొడక్షన్ డిప్లాయ్‌మెంట్స్ కోసం బహుళ-ఏజెంట్ సమన్వయం పై సమగ్ర A-గ్రేడ్ పాఠాలను జోడిస్తుంది.**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-కేంద్రీకృత డిప్లాయ్‌మెంట్ తో స్వయంచాలక ప్రొవిజనింగ్
  - Application Insights + Log Analytics కోసం పూర్తి Bicep టెంప్లేట్లు
  - కన్స్యూమర్ Python అప్లికేషన్‌లు ప్రత్యేక టెలిమెట్రీతో (1,200+ పంక్తులు)
  - AI/LLM మానిటరింగ్ నమూనాలు (Microsoft Foundry Models టోకెన్/ఖర్చు ట్రాకింగ్)
  - 6 Mermaid డయగ్రామ్స్ (ఆర్కిటెక్చర్, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్, టెలిమెట్రీ ఫ్లో)
  - 3 హ్యాండ్స్-ఆన్ వ్యాయామాలు (అలెర్ట్స్, డ్యాష్‌బోర్డ్లు, AI మానిటరింగ్)
  - Kusto క్వెరీ ఉదాహరణలు మరియు ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలు
  - లైవ్ మెట్రిక్స్ స్ట్రీమింగ్ మరియు రియల్-టైమ్ డీబగ్గింగ్
  - 40-50 నిమిషాల అభ్యాస సమయం తో ప్రొడక్షన్-రె디 ఉద్దేశ్య నమూనాలు

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 ఆథెంటికేషన్ నమూనాలు (కనెక్షన్ స్ట్రింగ్స్, Key Vault, మేనేజ్డ్ ఐడెంటిటీ)
  - సురక్షిత డిప్లాయ్‌మెంట్‌ల కోసం పూర్తి Bicep ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు
  - Node.js అప్లికేషన్ కోడ్ తో Azure SDK ఇంటిగ్రేషన్
  - 3 పూర్తి వ్యాయామాలు (managed identity ఎనేబుల్ చేయడం, user-assigned identity, Key Vault రొటేషన్)
  - సెక్యూరిటీ ఉత్తమ పద్ధతులు మరియు RBAC కాన్ఫిగరేషన్లు
  - ట్రబుల్‌షూటింగ్ గైడ్ మరియు ఖర్చు విశ్లేషణ
  - ప్రొడక్షన్-రెడీ పాస్వర్డ్‌లెస్ ఆథెంటికేషన్ నమూనాలు

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 సమన్వయ నమూనాలు (సీరియల్, పారాలల్, הירర్చికల్, ఈవెంట్-డ్రైవెన్, కన్సెన్సస్)
  - పూర్తి ఆర్కెస్ట్రేటర్ సర్వీస్ అమలుకు ఉదాహరణ (Python/Flask, 1,500+ పంక్తులు)
  - 3 ప్రత్యేక ఏజెంట్ అమలులు (Research, Writer, Editor)
  - మెసేజ్ క్యూ కోసం Service Bus ఇంటిగ్రేషన్
  - డిస్ట్రిబ్యూటెడ్ సిస్టమ్ స్టేట్ మేనేజ్మెంట్కోసం Cosmos DB
  - ఏజెంట్ ఇంటరాక్షన్లను చూపించే 6 Mermaid డయగ్రామ్స్
  - 3 అడ్వాన్స్డ్ వ్యాయామాలు (timeout హ్యాండ్లింగ్, retry లాజిక్, సర్క్యూట్ బ్రేకర్)
  - ఖర్చు విభజన ($240-565/month) మరియు ఆప్టిమైజేషన్ వ్యూహాలు
  - మానిటరింగ్ కోసం Application Insights ఇంటిగ్రేషన్

#### Enhanced
- **Pre-deployment Chapter**: ఇప్పుడు సమగ్ర మానిటరింగ్ మరియు సమన్వయ నమూనాలు ఉన్నాయి
- **Getting Started Chapter**: ప్రొఫెషనల్ ఆథెంటికేషన్ నమూనాలతో మెరుగ్గా సమన్వయింపబడింది
- **Production Readiness**: సెక్యూరిటీ నుంచి ఆబ్జర్వబిలిటీ వరకూ పూర్తి కవర్ చేయబడినది
- **Course Outline**: చాప్టర్ 3 మరియు 6 లోని కొత్త పాఠాలను సూచించడానికి నవీకరించబడింది

#### Changed
- **Learning Progression**: కోర్సులో సెక్యూరిటీ మరియు మానిటరింగ్ యొక్క బెటర్ ఇంటగ్రేషన్
- **Documentation Quality**: కొత్త పాఠాలలో స్థిరమైన A-గ్రేడ్ ప్రమాణాలు (95-97%)
- **Production Patterns**: ఎంటర్ప్రైజ్ డిప్లాయ్‌మెంట్స్ కోసం పూర్తి end-to-end కవరేజు

#### Improved
- **Developer Experience**: అభివృద్ధి నుండి ఉత్పత్తి పర్యవేక్షణ దాకా స్పష్టమైన మార్గం
- **Security Standards**: ప్రామాణీకరణ మరియు రహస్యాల నిర్వహణకు వృత్తిమాత్మక నమూనాలు
- **Observability**: AZDతో పూర్తి Application Insights సమగ్రీకరణ
- **AI Workloads**: Microsoft Foundry Models మరియు బహుళ-ఏజెంట్ వ్యవస్థల కోసం ప్రత్యేక పర్యవేక్షణ

#### Validated
- ✅ అన్ని పాఠాలు పూర్తి పని చేసే కోడ్‌ను (స్నిపెట్లను కాదు) కలిగి ఉన్నాయి
- ✅ దృష్టాంత కోసం Mermaid చిత్రరేఖలు (మొత్తం 19, 3 పాఠాల్లో)
- ✅ నిజమైన పరీక్ష స్టెప్పులతో హ్యాండ్స్-ఆన్ వ్యాయామాలు (మొత్తం 9)
- ✅ ఉత్పత్తి-సిద్ధ Bicep టెంప్లేట్లు `azd up` ద్వారా డిప్లాయ్ చేయదగినవి
- ✅ ఖర్చు విశ్లేషణ మరియు ఆప్టిమైజేషన్ వ్యూహాలు
- ✅ సమస్య పరిష్కరణ గైడ్‌లు మరియు ఉత్తమ ఆచరణలు
- ✅ నిర్ధారణ కమాండ్లతో జ్ఞాన నిర్ధారణ పరీక్షలు

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - సమగ్రమైన పర్యవేక్షణ మార్గదర్శకం
- **docs/getting-started/authsecurity.md**: - వృత్తిమాత్మక భద్రతా నమూనాలు
- **docs/pre-deployment/coordination-patterns.md**: - అధునాతన బహుళ-ఏజెంట్ ఆర్కిటెక్చర్లు
- **Overall New Content**: - స్థిరమైన ఉన్నత నాణ్యత ప్రమాణాలు

#### Technical Implementation
- **Application Insights**: Log Analytics + అనుకూల టెలిమేట్రీ + విస్తృత ట్రేసింగ్
- **Authentication**: Managed Identity + Key Vault + RBAC నమూనాలు
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ఆర్కెస్ట్రేషన్
- **Monitoring**: లైవ్ మెట్రిక్స్ + Kusto ప్రశ్నలు + అలెర్ట్స్ + డాష్‌బోర్డ్లు
- **Cost Management**: శాంప్లింగ్ వ్యూహాలు, రిటెన్షన్ పాలసీలు, బడ్జెట్ నియంత్రణలు

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**This version enhances documentation quality across the repository and adds a complete Microsoft Foundry Models deployment example with gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - చర్చ చరిత్రతో Python కమాండ్-లైన్ చాట్ ఇంటర్ఫేస్
  - సురక్షిత API కీ నిల్వ కోసం Key Vault సమగ్రీకరణ
  - టోకెన్ వినియోగం ట్రాకింగ్ మరియు ఖర్చు అంచనా
  - రేట్ లిమిటింగ్ మరియు లోపాల హ్యాండ్లింగ్
  - 35-45 నిమిషాల డిప్లాయ్‌మెంట్ గైడ్ తో సమగ్ర README
  - 11 ఉత్పత్తి-సిద్ధ ఫైళ్ళు (Bicep టెంప్లేట్లు, Python యాప్, కాన్ఫిగరేషన్)
- **📚 Documentation Exercises**: configuration గైడ్‌లో హ్యాండ్స్-ఆన్ ప్రాక్టీస్ వ్యాయామాలు జోడించబడ్డాయి:
  - Exercise 1: బహు-పర్యావరణ కాన్ఫిగరేషన్ (15 నిమిషాలు)
  - Exercise 2: రహస్యాల నిర్వహణ సాధన (10 నిమిషాలు)
  - స్పష్టమైన విజయ నియమాలు మరియు నిర్ధారణ దశలు
- **✅ Deployment Verification**: డిప్లాయ్‌మెంట్ గైడ్‌కు నిర్ధారణ విభాగం జోడించబడింది:
  - ఆరోగ్య తనిఖీ కార్యకలాపాలు
  - విజయ నియమాల చెక్‌లిస్ట్
  - అన్ని డిప్లాయ్‌మెంట్ కమాండ్ల కోసం అంచనా ఆవుట్పుట్లు
  - త్వరిత సమస్య పరిష్కరణ సూచిక

#### Enhanced
- **examples/README.md**: A-గ్రేడ్ నాణ్యత (93%) కి నవీకరించబడింది:
  - azure-openai-chatను అన్ని సంబంధిత విభాగాలలో జోడించబడింది
  - స్థానిక ఉదాహరణల సంఖ్యను 3 నుండి 4 కు నవీకరించబడింది
  - AI అప్లికేషన్ ఉదాహరణల పట్టికలో జోడించబడింది
  - మద్యంతర వినియోగదారుల కోసం Quick Start లోకి సమీకరించబడింది
  - Microsoft Foundry టెంప్లేట్లు విభాగంలో చేర్చబడింది
  - సరిపోలిక మ్యాట్రిక్స్ మరియు టెక్నాలజీ కనుగొనటాల విభాగాలు నవీకరించబడ్డాయి
- **Documentation Quality**: B+ (87%) → A- (92%) కు మెరుగుపరచబడింది docs ఫోల్డర్ అంతటా:
  - కీలక కమాండ్ ఉదాహరణలకు అంచనా అవుట్‌పుట్‌లు జోడించబడ్డాయి
  - కాన్ఫిగరేషన్ మార్పుల కోసం నిర్ధారణ దశలు చేర్చబడ్డాయి
  - ప్రాక్టికల్ వ్యాయామాలతో హ్యాండ్స్-ఆన్ లెర్నింగ్ పెంపు

#### Changed
- **Learning Progression**: మద్యంతర అభ్యాసకులకు AI ఉదాహరణల బెటర్ ఇంటిగ్రేషన్
- **Documentation Structure**: స్పష్టమైన ఫలితాలతో మరిన్ని కార్యాచరణాత్మక వ్యాయామాలు
- **Verification Process**: కీలక వర్క్ఫ్లోలకు స్పష్టమైన విజయ నియమాలు జోడించబడ్డాయి

#### Improved
- **Developer Experience**: Microsoft Foundry Models డిప్లాయ్‌మెంట్ ఇప్పుడు 35-45 నిమిషాలలో పూర్తవుతుంది (సంక్లిష్ట ప్రత్యామ్నాయాల సందర్భంలో 60-90 నిమిషాల కంటే)
- **Cost Transparency**: Microsoft Foundry Models ఉదాహరణకు స్పష్టమైన ఖర్చు అంచనాలు ($50-200/month)
- **Learning Path**: AI డెవలపర్లు azure-openai-chat తో స్పష్టమైన ప్రవేశ బిందువు పొందారు
- **Documentation Standards**: స్థిరమైన అంచనా అవుట్‌పుట్‌లు మరియు నిర్ధారణ దశలు

#### Validated
- ✅ Microsoft Foundry Models ఉదాహరణ `azd up` తో పూర్తి కార్యనిర్వహణలో ఉంది
- ✅ అన్ని 11 అమలు ఫైళ్లు వాక్యరుచికరంగా సరైనవి
- ✅ README సూచనలు వాస్తవ డిప్లాయ్‌మెంట్ అనుభవానికి సరిపోతున్నవి
- ✅ డాక్యుమెంటేషన్ లింకులు 8+ స్థానాలలో నవీకరించబడ్డాయి
- ✅ ఉదాహరణల సూచికలో 4 స్థానిక ఉదాహరణల స్థితి సరిగా ఉంది
- ✅ పట్టికలలో ఏ డూప్లికేట్ బాహ్య లింకులు లేవు
- ✅ అన్ని నావిగేషన్ సూచనలు సరిగా ఉన్నాయి

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps నమూనా
- **Security**: Managed Identity సిద్ధంగా ఉంది, రహస్యాలు Key Vaultలో
- **Monitoring**: Application Insights సమగ్రీకరణ
- **Cost Management**: టోకెన్ ట్రాకింగ్ మరియు వినియోగ ఆప్టిమైజేషన్
- **Deployment**: పూర్తి సెటప్‌కు ఒకే `azd up` కమాండ్

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**This version introduces comprehensive, production-ready container application deployment examples using Azure Developer CLI (AZD), with full documentation and integration into the learning path.**

#### Added
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [మాస్టర్ గైడ్](examples/container-app/README.md): కంటెయినరీకృత డిప్లాయ్‌మెంట్ల పూర్తి అవలోకనం, త్వరిత ప్రారంభం, ఉత్పత్తి మరియు అధునాతన నమూనాలు
  - [Simple Flask API](../../examples/container-app/simple-flask-api): ప్రారంభకులకు అనుకూలమైన REST API, scale-to-zero, హెల్త్ ప్రోబ్స్, పర్యవేక్షణ, మరియు ట్రబుల్షూటింగ్ తో
  - [Microservices Architecture](../../examples/container-app/microservices): ఉత్పత్తి-సిద్ధ బహు-సర్వీస్ డిప్లాయ్‌మెంట్ (API గేట్‌వే, Product, Order, User, Notification), అసింక్ మెసేజింగ్, Service Bus, Cosmos DB, Azure SQL, విస్తృత ట్రేసింగ్, బ్లూ-గ్రీన్/కెనరీ డిప్లాయ్‌మెంట్లు
- **Best Practices**: కంటెయినర్-ఆధారిత వర్క్‌లోడ్స్ కోసం భద్రత, పర్యవేక్షణ, ఖర్చు ఆప్టిమైజేషన్, మరియు CI/CD మార్గదర్శకాలు
- **Code Samples**: పూర్తి `azure.yaml`, Bicep టెంప్లేట్లు, మరియు బహు-భాష సేవా అమలు (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: ఎండ్-టూ-ఎండ్ పరీక్షా పరిస్థితులు, పర్యవేక్షణ కమాండ్లు, సమస్య పరిష్కరణ మార్గదర్శకాలు

#### Changed
- **README.md**: "Local Examples - Container Applications" కింద కొత్త container app ఉదాహరణలను ప్రదర్శించడానికి మరియు లింక్ చేయడానికి నవీకరించబడింది
- **examples/README.md**: container app ఉదాహరణలను హైలైట్ చేయడానికి, సరిపోలిక మ్యాట్రిక్స్ ఎంట్రీలు జోడించడానికి, మరియు టెక్నాలజీ/ఆర్కిటెక్చర్ సూచనలను నవీకరించబడింది
- **Course Outline & Study Guide**: సంబంధిత అధ్యాయాల్లో కొత్త container app ఉదాహరణలు మరియు డిప్లాయ్‌మెంట్ నమూనాలకు సూచనలు జోడించబడినవి

#### Validated
- ✅ అన్ని కొత్త ఉదాహరణలు `azd up` తో డిప్లాయ్ చేయదగినవి మరియు ఉత్తమ ఆచరణలను అనుసరిస్తాయి
- ✅ డాక్యుమెంటేషన్ క్రాస్-లింక్లు మరియు నావిగేషన్ నవీకరించబడ్డాయి
- ✅ ఉదాహరణలు ప్రాథమిక స్థాయి నుంచి అధునాతన సన్నివేశాల వరకు కవరుచేస్తాయి, ఉత్పత్తి మైక్రోసర్వీసుల సహా

#### Notes
- **Scope**: ఇంగ్లీష్ డాక్యుమెంటేషన్ మరియు ఉదాహరణలపై మాత్రమే
- **Next Steps**: భవిష్య అప్‌డేట్లలో అదనపు అధునాతన కంటెయినర్ నమూనాలు మరియు CI/CD ఆటోమేషన్‌ను విస్తరించడం

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implements a comprehensive product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - అన్ని సూచనలను `docs/` ఫోల్డర్‌లో అప్డేట్ చేయబడినవి
  - ఫోల్డర్ పేరు మార్చబడింది: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ఫైల్ పేరు మార్చబడింది: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - మొత్తం: 7 డాక్యుమెంట్ ఫైళ్లలో 23 కంటెంట్ సూచనలు నవీకరించబడ్డాయి

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` పేరు మార్చి `docs/microsoft-foundry/` చేయబడింది
  - కొత్త ఫోల్డర్ నిర్మాణానికి అనుగుణంగా అన్ని క్రాస్-రెఫరెన్సులు నవీకరించబడ్డాయి
  - నావిగేషన్ లింకులు ధృవీకరించబడ్డాయి

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - అన్ని అంతర్గత లింకులు కొత్త ఫైల్నేమ్‌ను సూచించడానికి నవీకరించబడ్డాయి

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 నావిగేషన్ లింక్ నవీకరణలు
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ప్రొడక్ట్ నేమ్ సూచనల నవీకరణలు
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ఇప్పటికే Microsoft Foundry ఉపయోగంలో ఉంది (మునుపటి నవీకరణల నుండి)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 సూచనలు నవీకరించారు (అవలోకనం, కమ్యూనిటీ ఫీడ్బ్యాక్, డాక్యుమెంటేషన్)
  - `docs/getting-started/azd-basics.md` - 4 క్రాస్-రెఫరెన్స్ లింక్లు నవీకరించబడ్డాయి
  - `docs/getting-started/first-project.md` - 2 అధ్యాయ నావిగేషన్ లింక్లు నవీకరించబడ్డాయి
  - `docs/getting-started/installation.md` - 2 తదుపరి అధ్యాయ లింక్లు నవీకరించబడ్డాయి
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 సూచనలు నవీకరించబడ్డాయి (నావిగేషన్, Discord కమ్యూనిటీ)
  - `docs/troubleshooting/common-issues.md` - 1 నావిగేషన్ లింక్ నవీకరణ
  - `docs/troubleshooting/debugging.md` - 1 నావిగేషన్ లింక్ నవీకరణ

- **Course Structure Files** (2 files):
  - `README.md` - 17 సూచనలు నవీకరించబడ్డాయి (కోర్స్ అవలోకనం, అధ్యాయ టైటిల్స్, టెంప్లేట్స్ విభాగం, కమ్యూనిటీ దృష్టికోణాలు)
  - `course-outline.md` - 14 సూచనలు నవీకరించబడ్డాయి (ఆవలోకనం, అభ్యాస లక్ష్యాలు, అధ్యాయ వనరులు)

#### Validated
- ✅ English docs లో "ai-foundry" ఫోల్‌డర్ పాథ్ సూచనలు ఉండవు
- ✅ English docs లో "Microsoft Foundry" ఉత్పత్తి నామ సూచనలు ఉండవు
- ✅ కొత్త ఫోల్డర్ నిర్మాణంతో అన్ని నావిగేషన్ లింకులు సక్రమంగా పనిచేస్తున్నాయి
- ✅ ఫైల్ మరియు ఫోల్డర్ పేర్ల మార్పులు విజయవంతంగా పూర్తయినవి
- ✅ అధ్యాయాల మధ్య క్రాస్-రెఫరెన్సులు ధృవీకరించబడ్డాయి

#### Notes
- **Scope**: మార్పులు `docs/` ఫోల్డర్‌లోని ఇంగ్లీష్ డాక్యుమెంటేషన్‌కు మాత్రమే వర్తిస్తాయి
- **Translations**: Translation ఫోల్డర్‌లు (`translations/`) ఈ సంస్కరణలో నవీకరించబడలేదు
- **Workshop**: వర్క్‌షాప్ సామగ్రి (`workshop/`) ఈ సంస్కరణలో నవీకరించబడలేదు
- **Examples**: ఉదాహరణ ఫైళ్ళలో ఇప్పటికీ పాత నామ సూచనలు ఉండొచ్చు (భవిష్య అప్‌డేట్‌లో పరిష్కరించబడుతుంది)

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: కొత్త ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రివ్యూ సామర్ధ్యానికి సమగ్ర కవర్ష్
  - చిట్కా షీట్‌లో కమాండ్ రిఫరెన్స్ మరియు వినియోగ ఉదాహరణలు
  - ప్రొవిజనింగ్ గైడ్‌లో ఉపయోగకర్లు, ప్రయోజనాలు మరియు వినియోగ సందర్భాలతో వివరమైన సమగ్రీకరణ
  - సేఫర్ డిప్లాయ్‌మెంట్ నిర్ధారణకు ప్రీ-ఫ్లైట్ తనిఖీ సమగ్రీకరణ
  - సేఫ్టీ-ఫస్ట్ డిప్లాయ్‌మెంట్ ప్రాక్టీసులతో ప్రారంభ మార్గదర్శకంలో నవీకరణలు
- **🚧 Workshop Status Banner**: వర్క్‌షాప్ అభివృద్ధి స్థితిని సూచించే ప్రొఫెషనల్ HTML బ్యానర్
  - క్లియర్ కమ్యూనికేషన్ కోసం గ్రాడియెంట్ డిజైన్లు మరియు కన్‌స్ట్రక్షన్ సూచికలు
  - పారదర్శకత్వానికి చివరి నవీకరణ టైమ్‌స్టాంప్
  - అన్ని డివైస్ రకాల కోసం మొబైల్-రిస్పాన్సివ్ డిజైన్

#### Enhanced
- **Infrastructure Safety**: ప్రివ్యూ ఫంక్షనాలిటీ డిప్లాయ్‌మెంట్ డాక్యుమెంటేషన్ అంతటా సమగ్రీకరించబడింది
- **Pre-deployment Validation**: ఆటోమెటెడ్ స్క్రిప్టులు ఇప్పుడు ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రివ్యూ పరీక్షలను కూడా కలిగి ఉన్నాయి
- **Developer Workflow**: ఉత్తమ ఆచరణగా ప్రివ్యూ చేర్చిన కమాండ్ పరామర్శలు నవీకరించబడ్డాయి
- **Workshop Experience**: ఉపయోగకర్తలకు కంటెంట్ అభివృద్ధి స్థితి గురించి స్పష్టమైన అంచనాలు సెట్ చేయబడ్డాయి

#### Changed
- **Deployment Best Practices**: ప్రివ్యూ-ఫస్ట్ వర్క్‌ఫ్లోను సిఫార్సు చేయబడిన విధానంగా మార్చారు
- **Documentation Flow**: ఇన్‌ఫ్రాస్టర్‌వాలిడేషన్‌ను లెర్నింగ్ ప్రక్రియలో ముందస్తుగా మోపబడింది
- **Workshop Presentation**: ప్రొఫెషనల్ స్థితి సమాచారంతో స్పష్టమైన అభివృద్ధి కాలరేఖ

#### Improved
- **Safety-First Approach**: ఇన్‌ఫ్రా మార్పులు డిప్లాయ్‌మెంట్‌కు ముందు ధృవీకరించదగినవి
- **Team Collaboration**: ప్రివ్యూ ఫలితాలను సమీక్ష మరియు ఆమోదానికి పంచుకోవచ్చు
- **Cost Awareness**: ప్రొవిజనింగ్ ముందు వనరు ఖర్చులపై మెరుగు అవగాహన
- **Risk Mitigation**: ముందస్తు ధృవీకరణ ద్వారా డిప్లాయ్‌మెంట్ వైఫల్యాలు తగ్గాయి

#### Technical Implementation
- **Multi-document Integration**: ప్రివ్యూ ఫీచర్ 4 కీలక ఫైల్స్ అంతటా డాక్యుమెంటు చేయబడింది
- **Command Patterns**: డాక్యుమెంటేషన్ అంతటా స్థిరమైన సింటాక్స్ మరియు ఉదాహరణలు
- **Best Practice Integration**: ప్రివ్యూ ధృవీకరణ వర్క్ఫ్లోలు మరియు స్క్రిప్టుల్లో చేర్చబడింది
- **Visual Indicators**: కొత్త ఫీచర్ కనుగొనదగినత కోసం స్పష్టమైన NEW గుర్తింపులు

#### Workshop Infrastructure
- **Status Communication**: గ్రాడియెంట్ స్టైలింగ్ కలిగిన ప్రొఫెషనల్ HTML బ్యానర్
- **User Experience**: అభివృద్ధి స్థితి స్పష్టంగా తెలియజేసి గందరగోళాన్ని నివారిస్తుంది
- **Professional Presentation**: రిపాజిటరీ విశ్వసనీయత్వాన్ని కొనసాగిస్తూ అంచనాలు సెట్ చేయబడతాయి
- **Timeline Transparency**: బాధ్యత నింపుదల కోసం October 2025 చివరి నవీకరణ టైమ్‌స్టాంప్

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 ఇంటరాక్టివ్ వర్క్‌షాప్ గైడ్**: MkDocs ప్రీవ్యూసకేమీ లక్షణంతో బ్రౌజర్-ఆధారిత వర్క్‌షాప్ అనుభవం
- **📝 నిర్మాణబద్ధమైన వర్క్‌షాప్ సూచనలు**: కనుగొనడం నుంచి అనుకూలీకరణ వరకూ 7-జుగల మార్గదర్శక పాఠ్యమం
  - 0-Introduction: వర్క్‌షాప్ అవలోకనం మరియు సెటప్
  - 1-Select-AI-Template: టెంప్లేట్ కనుగొనడం మరియు ఎంపిక ప్రక్రియ
  - 2-Validate-AI-Template: డిప్లాయ్‌మెంట్ మరియు ధృవీకరణ చర్యలు
  - 3-Deconstruct-AI-Template: టెంప్లేట్ ఆర్కిటెక్చర్‌ను అర్థం చేసుకోవడం
  - 4-Configure-AI-Template: కాన్ఫిగరేషన్ మరియు అనుకూలీకరణ
  - 5-Customize-AI-Template: ఆధునిక సవరణలు మరియు పునరావృతాలు
  - 6-Teardown-Infrastructure: క్లీనప్ మరియు వనరుల నిర్వహణ
  - 7-Wrap-up: సంక్షేపం మరియు తదుపరి దశలు
- **🛠️ వర్క్‌షాప్ టూలింగ్**: మెరుగైన నేర్చుకునే అనుభవానికి Material థీమ్‌తో MkDocs కాన్ఫిగరేషన్
- **🎯 హ్యాండ్స్-ఆన్ లర్నింగ్ పాత్**: 3-దశల విధానశిలి (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces అనుసంధానం**: స్లీక్స్ డెవలప్‌మెంట్ పర్యావరణ సెటప్

#### Enhanced
- **AI Workshop Lab**: విస్తరించిన 2-3 గంటల నిర్మాణబద్ధమైన నేర్చుకునే అనుభవంతో పొడిచినది
- **Workshop Documentation**: నావిగేషన్ మరియు విజువల్ సహాయాలతో ప్రొఫెషనల్ ప్రదర్శన
- **Learning Progression**: టెంప్లేట్ ఎంపిక నుంచి ఉత్పత్తి డిప్లాయ్‌మెంట్ వరకు స్పష్టమైన దశలవారీ మార్గదర్శకత్వం
- **Developer Experience**: సుసంప్రేక్షిత అభివృద్ధి వర్క్‌ఫ్లోల కోసం ఒకీకృత టూలింగ్

#### Improved
- **Accessibility**: శోధన, కాపీ ఫంక్షనాలిటీ, మరియు థీమ్ టోగుల్‌తో బ్రౌజర్-ఆధారిత ఇంటర్ఫేస్
- **Self-Paced Learning**: వేరువేరు నేర్చుకునే వేగాలను అనుకూలపరచుకునే తారక వర్క్‌షాప్ నిర్మాణం
- **Practical Application**: વિશ્વస్తమైన AI టెంప్లేట్ డిప్లాయ్‌మెంట్ సన్నివేశాలు
- **Community Integration**: వర్క్‌షాప్ మద్దతు మరియు సహకారానికి Discord అనుసంధానం

#### Workshop Features
- **Built-in Search**: తక్షణ కీవర్డ్ మరియు పాఠ్యం కనుగొనడం
- **Copy Code Blocks**: అన్ని కోడ్ ఉదాహరణల కోసం హోవర్-టు-కాపీ ఫంక్షనాలిటీ
- **Theme Toggle**: వివిధ అనుకూలతలకు డార్క్/లైట్ మోడ్ మద్దతు
- **Visual Assets**: మెరుగైన అర్ధం కోసం స్క్రీన్‌షాట్లు మరియు డయాగ్రామ్లు
- **Help Integration**: కమyunిటీ మద్దతుకు నేరుగా Discord యాక్సెస్

### [v3.2.0] - 2025-09-17

#### పెద్ద స్థాయి నావిగేషన్ పునఃరూపరచన మరియు అధ్యాయ-ఆధారిత అధ్యయన వ్యవస్థ
**ఈ సంస్కరణ పూర్తి రిపోజిటరీలో మెరుగైన నావిగేషన్‌తో ఒక సమగ్ర అధ్యాయ-ఆధారిత అధ్యయన నిర్మాణాన్ని పరిచయం చేస్తుంది.**

#### Added
- **📚 అధ్యాయ-ఆధారిత అధ్యయన వ్యవస్థ**: కోర్సును 8 ప్రగతి లక్ష్యాలతో కూడిన అధ్యాయాలుగా పునఃరూపరచింది
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 సమగ్ర నావిగేషన్ వ్యవస్థ**: మొత్తం డాక్యుమెంటేషన్ అంతటా సపరించాలని నావిగేషన్ హెడ్డర్‌లు మరియు ఫుటర్‌లు సమగ్రంగా ఉన్నాయి
- **🎯 ప్రోగ్రెస్ ట్రాకింగ్**: కోర్స్ పూర్తి చెక్లిస్ట్ మరియు నేర్చుకున్నదానిని ధృవీకరించడానికి వ్యవస్థ
- **🗺️ లర్నింగ్ పాత్ గైడెన్స్**: వివిధ అనుభవ స్థాయిలు మరియు లక్ష్యాలకు స్పష్టమైన ప్రవేశ బిందువులు
- **🔗 క్రాస్-రిఫరెన్స్ నావిగేషన్**: సంబంధిత అధ్యాయాలు మరియు ముందు అవసరాలు స్పష్టంగా లింక్ చేయబడ్డాయి

#### Enhanced
- **README Structure**: READMEని అధ్యాయ-ఆధారిత రూపంలో స్ట్రక్చర్డ్ లర్నింగ్ ప్లాట్‌ఫార్మ్‌గా మార్చింది
- **Documentation Navigation**: ప్రతి పేజీ ఇప్పుడు అధ్యాయ సందర్భం మరియు ప్రగతి మార్గదర్శకత్వాన్ని కలిగి ఉంటుంది
- **Template Organization**: ఉదాహరణలు మరియు టెంప్లేట్లు మూల్యంగా సరి అయ్యే అధ్యాయాలకు మ్యాప్ చేయబడ్డాయి
- **Resource Integration**: చీట్ షీట్‌లు, ఫ్రిక్యువెంట్లీ ఆskెడ్ ప్రశ్నలు, మరియు స్టడీ గైడ్‌లు సంబంధించిన అధ్యాయాలకు అనుసంధానించబడ్డాయి
- **Workshop Integration**: హ్యాండ్స్-ఆన్ ల్యాబ్‌లు బహుళ అధ్యాయ లక్ష్యాలకు మ్యాప్ చేయబడ్డాయి

#### Changed
- **Learning Progression**: సీరియల్ డాక్యుమెంటేషన్ నుంచి అనుకూల అధ్యాయ-ఆధారిత అధ్యయనానికి మార్పు
- **Configuration Placement**: మెరుగైన లెర్నింగ్ ఫ్లో కోసం కాన్ఫిగరేషన్ గైడ్‌ను Chapter 3 గా పునఃస్థాపిస్తూ మార్చినది
- **AI Content Integration**: నేర్చుకోవడంతో సంబంధిత AI-విశేష విషయాల మెరుగైన ఇంటిగ్రేషన్
- **Production Content**: ఎంటర్ప్రైజ్ లెర్నర్ల కోసం Chapter 8లో అధునాతన నమూనాలు కేంద్రీకృతం చేయబడ్డాయి

#### Improved
- **User Experience**: స్పష్టమైన నావిగేషన్ బ్రెడ్‌క్రంబ్స్ మరియు అధ్యాయ ప్రగతి సంకేతకాలు
- **Accessibility**: కోర్స్ సులభంగా సదా తిరుగుదల కోసం స్థిరమైన నావిగేషన్ నమూనాలు
- **Professional Presentation**: అకడమిక్-శైలి కోర్స్ నిర్మాణం విద్యాసంస్థల మరియు కార్పొరేట్ శిక్షణకు అనుకూలం
- **Learning Efficiency**: మెరుగైన ఒర్గనైజేషన్ ద్వారా సంబంధిత కంటెంట్ కనుగొనడానికి సమయం తగ్గింది

#### Technical Implementation
- **Navigation Headers**: 40+ డాక్యుమెంటేషన్ ఫైళ్ళు మొత్తంగా స్టాండర్డైజ్డ్ చాప్టర్ నావిగేషన్
- **Footer Navigation**: స్థిరమైన ప్రగతి మార్గదర్శకత్వం మరియు అధ్యాయ పూర్తి సూచికలు
- **Cross-Linking**: సంబంధిత భావనలను ఒకరితో ఒకటి కనెక్ట్ చేసే సమగ్ర అంతర్గత లింకింగ్ సిస్టమ్
- **Chapter Mapping**: టెంప్లేట్లు మరియు ఉదాహరణలు స్పష్టంగా లర్నింగ్ లక్ష్యాలకు అసోషియేట్ చేయబడ్డాయి

#### Study Guide Enhancement
- **📚 సమగ్ర లర్నింగ్ లక్ష్యాలు**: స్టడీ గైడ్‌ను 8-అధ్యాయ వ్యవస్థతో సరిపోయేలా పునఃవిభజించబడింది
- **🎯 అధ్యాయ-ఆధారిత మూల్యాంకన**: ప్రతి అధ్యాయం నిర్దిష్ట లర్నింగ్ లక్ష్యాలు మరియు عملی వ్యాయామాలను కలిగి ఉంటుంది
- **📋 ప్రోగ్రెస్ ట్రాకింగ్**: కొలవదగిన ఫలితాలు మరియు పూర్తి చేయు చెక్లిస్ట్‌లతో వారాంత లెర్నింగ్ షెడ్యూల్
- **❓ మూల్యాంకన ప్రశ్నలు**: ప్రతి అధ్యాయానికి జ్ఞాన ధృవీకరణ ప్రశ్నలు మరియు ప్రొఫెషనల్ అవుట్కమ్స్
- **🛠️ ప్రాక్టికల్ ఎక్సర్సైజ్‌లు**: వాస్తవ డిప్లాయ్‌మెంట్ సన్నివేశాలు మరియు ట్రబుల్షూటింగ్‌తో హ్యాండ్స్-ఆన్ కార్యకలాపాలు
- **📊 స్కిల్ ప్రోగ్రెస్‌షన్**: ప్రాథమిక భావనల నుండీ ఎంటర్ప్రైజ్ నమూనాల వరకు స్పష్టమైన పురోగతి మరియు కెరీర్ అభివృద్ధి ఫోకస్
- **🎓 సర్టిఫికేషన్ ఫ్రేమ్‌వర్క్**: ప్రొఫెషనల్ డెవలప్‌మెంట్ అవుట్కమ్స్ మరియు కమ్యూనిటీ గుర్తింపు వ్యవస్థ
- **⏱️ టైమ్లైన్ మేనేజ్‌మెంట్**: మైల్‌స్టోన్స్ ధృవీకరణతో నిర్మిత 10-వారాల లర్నింగ్ ప్లాన్

### [v3.1.0] - 2025-09-17

#### మెరుగుదల పొందిన మల్టీ-ఏజెంట్ AI పరిష్కారాలు
**ఈ సంస్కరణ రిటైల్ మల్టీ-ఏజెంట్ పరిష్కారంలో ఏజెంట్ నామకరణను మెరుగుపరచి డాక్యుమెంటేషన్‌ను విస్తరించింది.**

#### Changed
- **Multi-Agent Terminology**: రిటైల్ మల్టీ-ఏజెంట్ పరిష్కారంలో స్పష్టమైన అర్ధం కోసం "Cora agent"ని "Customer agent"తో అన్ని చోట్ల మార్చారు
- **Agent Architecture**: అన్ని డాక్యుమెంటేషన్, ARM టెంప్లేట్లు, మరియు కోడ్ ఉదాహరణల్లో "Customer agent" నామకరణను యూనిఫార్మ్గా ఉపయోగించగా నవీకరించినవి
- **Configuration Examples**: ఆధునీకృత నామకరణతో ఏజెంట్ కాన్ఫిగరేషన్ నమూనాలను అప్‌డేట్ చేయబడింది
- **Documentation Consistency**: అన్ని రిఫరెన్సులు ప్రొఫెషనల్ మరియు వివరణాత్మక ఏజెంట్ పేర్లను ఉపయోగించడానికి నిర్ధారించబడ్డాయి

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template అనువర్తనాన్ని Customer agent సూచనలతో అప్డేట్ చేసింది
- **Architecture Diagrams**: నవీకరించిన ఏజెంట్ నామకరణతో Mermaid డయాగ్రామ్‌లను రిఫ్రెష్ చేయబడింది
- **Code Examples**: Python క్లాసులు మరియు అమలుకు సంబంధించిన ఉదాహరణలు ఇప్పుడు CustomerAgent నామకరణను ఉపయోగిస్తాయి
- **Environment Variables**: అన్ని డిప్లాయ్‌మెంట్ స్క్రిప్టుల్లో CUSTOMER_AGENT_NAME శైలి వేరియబుల్‌లను అప్డేట్ చేశారు

#### Improved
- **Developer Experience**: డాక్యుమెంటేషన్‌లో ఏజెంట్ పాత్రలు మరియు బాధ్యతలు స్పష్టతగా పొందాయి
- **Production Readiness**: ఎంటర్ప్రైజ్ నామకరణతో మెరుగైన సరిచూడు
- **Learning Materials**: విద్యా ఉద్దేశ్యాల కోసం సరళమైన ఏజెంట్ నామకరణ
- **Template Usability**: ఏజెంట్ పనులు మరియు డిప్లాయ్‌‌మెంట్ నమూనాలను సులభంగా అర్థం చేసుకోవచ్చు

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### ప్రధాన మార్పులు - AI డెవలపర్ ఫోకస్ మరియు Microsoft Foundry ఇంటిగ్రేషన్
**ఈ సంస్కరణ రిపోజిటరీని Microsoft Foundry ఇంటిగ్రేషన్‌తో కూడిన సమగ్ర AI-ఫోకస్ చేయబడిన లర్నింగ్ రిసోర్సుగా మారుస్తుంది.**

#### Added
- **🤖 AI-First Learning Path**: AI డెవలపర్లు మరియు ఇంజినీర్లను ప్రాధాన్యం ఇచ్చే పూర్తి పునఃఅరచన
- **Microsoft Foundry Integration Guide**: AZDని Microsoft Foundry సేవలతో కనెక్ట్ చేయడానికి సమగ్ర డాక్యుమెంటేషన్
- **AI Model Deployment Patterns**: మోడల్ ఎంపిక, కాన్ఫిగరేషన్, మరియు ఉత్పత్తి డిప్లాయ్‌మెంట్ వ్యూహాలను కవర్ చేసే సమగ్ర గైడ్
- **AI Workshop Lab**: AI అప్లికేషన్లను AZD-డిప్లాయ్ చేయదగిన పరిష్కారాలుగా మార్చడానికి 2-3 గంటల హ్యాండ్స్-ఆన్ వర్క్‌షాప్
- **Production AI Best Practices**: స్కేలింగ్, మోనిటరింగ్, మరియు AI వర్క్‌లోడ్లకు భద్రతపరచే ఎంటర్ప్రైజ్-తరహా నమూనాలు
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, మరియు AI డిప్లాయ్‌మెంట్ సమస్యల కోసం సమగ్ర ట్రబుల్షూటింగ్
- **AI Template Gallery**: Microsoft Foundry టెంప్లేట్ల ఫీచర్డ్ సేకరణ మరియు క్లిష్టత రేటింగ్లు
- **Workshop Materials**: హ్యాండ్స్-ఆన్ ల్యాబ్స్ మరియు సన్నిహిత పదార్థాలతో పూర్తి వర్క్‌షాప్ నిర్మాణం

#### Enhanced
- **README Structure**: AI-డెవలపర్-ఫోకస్‌తో READMEను మార్చబడింది, Microsoft Foundry Discord నుంచి 45% కమ్యూనిటీ ఆసక్తి డేటాతో
- **Learning Paths**: విద్యార్థుల మరియు DevOps ఇంజినీర్ల కోసం సాంప్రదాయ పథాలతో పాటు ఎగ్జిక్యూటివ్ AI డెవలపర్ల కోసం ప్రత్యేక ప్రయాణం
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, మరియు openai-chat-app-quickstart వంటి ఫ్రీచర్డ్ AI టెంప్లేట్లు
- **Community Integration**: AI-స్పెసిఫిక్ ఛానల్స్ మరియు చర్చలతో మెరుగైన Discord కమ్యూనిటీ మద్దతు

#### Security & Production Focus
- **Managed Identity Patterns**: AI-స్పెసిఫిక్ ఆథెంటికేషన్ మరియు భద్రత కాన్ఫిగరేషన్లు
- **Cost Optimization**: టోకెన్ వినియోగం ట్రాకింగ్ మరియు AI వనరుల కోసం బడ్జెట్ నియంత్రణలు
- **Multi-Region Deployment**: గ్లోబల్ AI అప్లికేషన్ డిప్లాయ్‌మెంట్ వ్యూహాలు
- **Performance Monitoring**: AI-స్పెసిఫిక్ మెట్రిక్స్ మరియు Application Insights ఇంటిగ్రేషన్

#### Documentation Quality
- **Linear Course Structure**: ప్రారంభం నుంచి అధునాతన AI డిప్లాయ్‌మెంట్ నమూనాల వరకు తార్కిక పథక్రము
- **Validated URLs**: అన్ని బాహ్య రిపోజిటరీ లింక్‌లు ధృవీకరించబడ్డవి మరియు యాక్సెస్ చేయదగినవి
- **Complete Reference**: అన్ని అంతర్గత డాక్యుమెంట్ లింక్‌లు ధృవీకరించబడి కార్యాచరణలో ఉన్నాయి
- **Production Ready**: వాస్తవ ప్రపంచ ఉదాహరణలతో ఎంటర్ప్రైజ్ డిప్లాయ్‌మెంట్ నమూనాలు

### [v2.0.0] - 2025-09-09

#### ప్రధాన మార్పులు - రిపోజిటరీ పునఃరూపరచన మరియు ప్రొఫెషనల్ మెరుగుదల
**ఈ సంస్కరణ రిపోజిటరీ నిర్మాణం మరియు కంటెంట్ ప్రెజెంటేషన్‌లో శ్రద్ధయుతమైన ఒప్పందం ప్రతిబింబిస్తుంది.**

#### Added
- **Structured Learning Framework**: అన్ని డాక్యుమెంటేషన్ పేజీలు ఇప్పుడు చొరవ, లర్నింగ్ గోల్స్, మరియు లర్నింగ్ అవుట్‌కమ్స్ విభాగాలను కలిగి ఉన్నాయి
- **Navigation System**: మార్గదర్శక లర్డ్‌కు Previous/Next పాఠం లింక్‌లు అన్ని డాక్యుమెంటేషన్‌లో జోడించబడ్డాయి
- **Study Guide**: లర్నింగ్ లక్ష్యాలు, ప్రాక్టీస్ వ్యాయామాలు, మరియు మూల్యాంకన పదార్థాలతో సమగ్ర study-guide.md
- **Professional Presentation**: మెరుగైన యాక్సెసిబిలిటీ మరియు ప్రొఫెషనల్ రూపం కోసం అన్ని ఇమోజి ఐకాన్లను తీసివేశాం
- **Enhanced Content Structure**: నేర్చుకునే పదార్థాల యొక్క మెరుగైన ఆర్గనైజేషన్ మరియు ప్రవాహం

#### Changed
- **Documentation Format**: ఒకసారిగా consistent లర్నింగ్-ఫోకస్డ్ నిర్మాణంతో అన్ని డాక్యుమెంటేషన్ స్థాండర్డైజ్ చేయబడ్డాయి
- **Navigation Flow**: అన్ని లర్నింగ్ పదార్థాల ద్వారా తార్కిక ప్రగతి అమలు చేయబడింది
- **Content Presentation**: శోభాయమాన మూలకాలను తీసివేసి స్పష్టమైన, ప్రొఫెషనల్ ఫార్మాటింగ్‌కు ప్రాధాన్యం
- **Link Structure**: కొత్త నావిగేషన్ సిస్టమ్‌కు లోపల లింక్‌లను మద్దతు చేయడానికి నవీకరించినవి

#### Improved
- **Accessibility**: స్క్రీన్ రీడర్ కంపాటిబిలిటీ కోసం ఇమోజి ఆధారితుల్ని తీసివేస్తూ మెరుగైన యాక్సెసిబిలిటీ
- **Professional Appearance**: ఎంటర్ప్రైజ్-మెటుకు అనుకూలమైన శుభ్రమైన, అకడమిక్-శైలి ప్రదర్శన
- **Learning Experience**: ప్రతీ పాఠానికి స్పష్టమైన లక్ష్యాలు మరియు అవుట్‌కమ్స్‌తో నిర్మాణబద్ధమైన అభ్యాసం
- **Content Organization**: సంబంధిత అంశాల మధ్య మెరుగైన తార్కిక ప్రవాహం మరియు కనెక్షన్

### [v1.0.0] - 2025-09-09

#### ప్రారంభ విడుదల - సమగ్ర AZD లర్నింగ్ రిపోజిటరీ

#### Added
- **Core Documentation Structure**
  - పూర్తి getting-started గైడ్ సిరీస్
  - సమగ్ర డిప్లాయ్‌మెంట్ మరియు ప్రొవిజనింగ్ డాక్యుమెంటేషన్
  - వివరణాత్మక ట్రబుల్షూటింగ్ వనరులు మరియు డీబగింగ్ గైడ్‌లు
  - ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ టూల్స్ మరియు ప్రక్రియలు

- **Getting Started Module**
  - AZD బేసిక్స్: కోర్ కాన్సెప్ట్‌లు మరియు పదజాలం
  - ఇన్స్టాలేషన్ గైడ్: ప్లాట్‌ఫారమ్-నిర్దిష్ట సెటప్ సూచనలు
  - కాన్ఫిగరేషన్ గైడ్: పరిసర సెటప్ మరియు ఆథెంటికేషన్
  - ఫస్ట్ ప్రాజెక్ట్ ట్యుటోరియల్: దశలవారీ హ్యాండ్స్-ఆన్ లెర్నింగ్

- **Deployment and Provisioning Module**
  - డిప్లాయ్‌మెంట్ గైడ్: పూర్తి వర్క్‌ఫ్లో డాక్యుమెంటేషన్
  - ప్రొవిజనింగ్ గైడ్: Bicep తో Infrastructure as Code
  - ఉత్పత్తి డిప్లాయ్‌మెంట్ కోసం ఉత్తమ ఆచారాలు
  - బహుళ-సేవా ఆర్కిటెక్చర్ నమూనాలు

- **Pre-deployment Validation Module**
  - కెపాసిటీ ప్లానింగ్: Azure వనరు లభ్యత ధృవీకరణ
  - SKU ఎంపిక: సమగ్ర సర్వీస్ టియర్ మార్గనిర్దేశకాలు
  - ప్రీ-ఫ్లైట్ చెక్స్: ఆటోమేటెడ్ ధృవీకరణ స్క్రిప్ట్‌లు (PowerShell మరియు Bash)
  - ఖర్చు అంచనా మరియు బడ్జెట్ ప్లానింగ్ టూల్స్

- **Troubleshooting Module**
  - కామన్ ఇష్యూస్: తరచుగా ఎదురయ్యే సమస్యలు మరియు పరిష్కారాలు
  - డీబగింగ్ గైడ్: వ్యవస్థబద్ధమైన ట్రబుల్షూటింగ్ విధానాలు
  - అధునాతన డయాగ్నోస్టిక్ టెక్నిక్స్ మరియు టూల్స్
  - పనితీరు మోనిటరింగ్ మరియు ఆప్టిమైజేషన్

- **Resources and References**
  - కమాండ్ చీట్ షీట్: ముఖ్యమైన కమాండ్లకు క్విక్ రిలిఫ్
  - గ్లోస్సరీ: పర్యాప్తమైన టర్మినాలజీ మరియు సంక్షిప్త నిర్వచనాలు
  - FAQ: సాధారణ ప్రశ్నలకు వివరమైన సమాధానాలు
  - బాహ్య వనరు లింక్స్ మరియు కమ్యూనిటీ కనెక్షన్లు

- **Examples and Templates**
  - సింపుల్ వెబ్ అప్లికేషన్ ఉదాహరణ
  - స్టాటిక్ వెబ్‌సైట్ డిప్లాయ్‌మెంట్ టెంప్లేట్
  - కంటెయినర్ అప్లికేషన్ కాన్ఫిగరేషన్
  - డేటాబేస్ ఇంటిగ్రేషన్ నమూనాలు
  - మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ ఉదాహరణలు
  - సర్వర్‌లెస్ ఫంక్షన్ అమలులు

#### Features
- **Multi-Platform Support**: Windows, macOS, మరియు Linux కోసం ఇన్స్టాలేషన్ మరియు కాన్ఫిగరేషన్ గైడ్‌లు
- **Multiple Skill Levels**: విద్యార్థుల నుంచి ప్రొఫెషనల్ డెవలపర్ల వరకూ రూపొందించిన కంటెంట్
- **Practical Focus**: హ్యాండ్స్-ఆన్ ఉదాహరణలు మరియు వాస్తవ ప్రపంచ సన్నివేశాలు
- **Comprehensive Coverage**: ప్రాథమిక భావనల నుంచి అధునాతన ఎంటర్ప్రైజ్ నమూనాల వరకు
- **Security-First Approach**: భద్రతకు సంబంధించిన ఉత్తమ ఆచారాలు మొత్తం విషయంలో అనుసరించబడినవి
- **Cost Optimization**: ఖర్చు-ప్రభావవంతమైన డిప్లాయ్‌మెంట్స్ మరియు వనరు నిర్వహణ కోసం మార్గదర్శకత్వం

#### Documentation Quality
- **Detailed Code Examples**: ప్రయోగాత్మక, పరీక్షించిన కోడ్ నమూనాలు
- **Step-by-Step Instructions**: స్పష్టమైన, కార్యాచరణీయ మార్గదర్శకత్వం
- **Comprehensive Error Handling**: సాధారణ సమస్యల కోసం ట్రబుల్షూటింగ్
- **Best Practices Integration**: ఇండస్ట్రీ స్టాండర్డ్స్ మరియు సిఫార్సులు
- **Version Compatibility**: తాజా Azure సేవలు మరియు azd ఫీచర్లతో అప్డేట్ చేసినవి

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **మల్టి-మోడల్ మద్దతు**: Hugging Face, Azure Machine Learning, మరియు కస్టమ్ మోడళ్ల కోసం ఇంటిగ్రేషన్ నమూనాలు
- **AI ఏజంట్ ఫ్రేమ్‌వర్క్లు**: LangChain, Semantic Kernel, మరియు AutoGen అమర్పుల కోసం టెంప్లేట్లు
- **అడ్వాన్స్డ్ RAG నమూనాలు**: Azure AI Searchకి మించి వెక్టర్ డేటాబేస్ ఎంపికలు (Pinecone, Weaviate, మొదలైనవి)
- **AI ఆబ్జర్వబిలిటీ**: మోడల్ పనితీరు, టోకన్ వినియోగం, మరియు ప్రతిస్పందన నాణ్యత కోసం మెరుగైన మానిటరింగ్

#### డెవలపర్ అనుభవం
- **VS Code ఎక్స్‌టెన్షన్**: సమగ్ర AZD + Microsoft Foundry అభివృద్ధి అనుభవం
- **GitHub Copilot ఇంటిగ్రేషన్**: AI-సహాయంతో AZD టెంప్లేట్ జనరేషన్
- **ఇంటరాక్టివ్ ట్యూటోరియల్స్**: AI పరిస్ధితుల కోసం ఆటోమేటెడ్ నిర్ధారణతో హ్యాండ్స్-ఆన్ కోడింగ్ వ్యాయామాలు
- **వీడియో కంటెంట్**: దృష్టి ఆధారిత అభ్యసకుల కోసం AI డిప్లాయ్‌మెంట్‌లపై సహాయక వీడియో ట్యూటోరియల్స్

### Version 4.0.0 (ప్రణాళిక)
#### ఎంటర్ప్రైజ్ AI నమూనాలు
- **గవర్నెన్స్ ఫ్రేమ్‌వర్క్**: AI మోడల్ గవర్నెన్స్, కంప్లయన్సు, మరియు ఆడిట్ ట్రైల్స్
- **మల్టీ-టెనెంట్ AI**: వేరుగా ఉన్న AI సర్వీసులతో బహుళ కస్టమర్లకు సేవలు అందించే నమూనాలు
- **ఎడ్జ్ AI డిప్లాయ్‌మెంట్**: Azure IoT Edge మరియు కంటైనర్ ఇన్‌స్టాన్సులతో ఇంటిగ్రేషన్
- **హైబ్రిడ్ క్లౌడ్ AI**: AI వర్క్‌లోడ్ల కోసం మల్టి-క్లౌడ్ మరియు హైబ్రిడ్ డిప్లాయ్‌మెంట్ నమూనాలు

#### అధునాతన ఫీచర్లు
- **AI పైప్‌లైన్ ఆటోమేషన్**: Azure Machine Learning పైప్‌లైన్లతో MLOps ఇంటిగ్రేషన్
- **అధునాతన భద్రత**: జీరో-ట్రస్ట్ నమూనాలు, ప్రైవేట్ ఎండ్పాయింట్లు, మరియు అధునాతన థ్రెట్ పరిరక్షణ
- **పర్ఫార్మెన్స్ ఆప్టిమైజేషన్**: అధిక-థ్రూపుట్ AI అప్లికేషన్ల కోసం అధునాతన ట్యూనింగ్ మరియు స్కేలింగ్ వ్యూహాలు
- **గ్లోబల్ పంపిణీ**: AI అప్లికేషన్ల కోసం కంటెంట్ డెలివరీ మరియు ఎడ్జ్ క్యాషింగ్ నమూనాలు

### Version 3.0.0 (ప్రణాళిక) - ప్రస్తుత విడుదల ద్వారా భర్తీ చేయబడింది
#### ప్రతిపాదిత జోడింపులు - ఇప్పుడు v3.0.0 లో అమలు చేయబడినవి
- ✅ **AI-కేంద్రీకృత కంటెంట్**: సమగ్ర Microsoft Foundry ఇంటిగ్రేషన్ (పూర్తయింది)
- ✅ **ఇంటరాక్టివ్ ట్యూటోరియల్స్**: హ్యాండ్స్-ఆన్ AI వర్క్‌షాప్ ల్యాబ్ (పూర్తయింది)
- ✅ **అధునాతన భద్రత మాడ్యూల్**: AI-నిర్దేశిత భద్రతా నమూనాలు (పూర్తయింది)
- ✅ **పర్ఫార్మెన్స్ ఆప్టిమైజేషన్**: AI వర్క్‌లోడ్ ట్యూనింగ్ వ్యూహాలు (పూర్తయింది)

### Version 2.1.0 (ప్రణాళిక) - భాగంగా v3.0.0 లో అమలు చేయబడింది
#### చిన్న మెరుగుదలలు - కొన్నిటి ప్రస్తుత రిలీజ్‌లో పూర్తయినవి
- ✅ **అదనపు ఉదాహరణలు**: AI-కేంద్రీకృత డిప్లాయ్‌మెంట్ సన్నివేశాలు (పూర్తయింది)
- ✅ **విస్తృత FAQ**: AI-నిర్దేశిత ప్రశ్నలు మరియు ట్రబుల్‌షూటింగ్ (పూర్తయింది)
- **టూల్ ఇంటిగ్రేషన్**: మెరుగుపరచిన IDE మరియు ఎడిటర్ ఇంటిగ్రేషన్ గైడ్స్
- ✅ **మానిటరింగ్ విస్తరణ**: AI-నిర్దేశిత మానిటరింగ్ మరియు అలర్టింగ్ నమూనాలు (పూర్తయింది)

#### ఇంకా భవిష్యత్ విడుదల కోసం ప్రణాళికలో ఉన్నాయి
- **మొబైల్-ఫ్రెండ్లీ డాక్యుమెంటేషన్**: మొబైల్ నేర్చుకోడానికి రెస్పాన్సివ్ డిజైన్
- **ఆఫ్‌లైన్ యాక్సెస్**: డౌన్లోడబుల్ డాక్యుమెంటేషన్ ప్యాకేజీలు
- **మెరుగైన IDE ఇంటిగ్రేషన్**: AZD + AI వర్క్‌ఫ్లోస్ కోసం VS Code ఎక్స్‌టెన్షన్
- **కమ్యూనిటీ డ్యాష్‌బోర్డ్**: రియల్-టైమ్ కమ్యూనిటీ మెట్రిక్స్ మరియు కోన్స్ట్రిబ్యూషన్ ట్రాకింగ్

## చేంజ్‌లాగ్‌కు కంట్రిబ్యూట్ చేయడం

### మార్పులను నివేదించడం
ఈ రిపాజిటరీకు కాంట్రిబ్యూట్ చేస్తుంటే, దయచేసి చేంజ్‌లాగ్ ఎంట్రీలలో ఈ అంశాలు ఉండేలా నిర్ధారించండి:

1. **వర్షన్ నంబర్**: సెమాంటిక్ వెర్షనింగ్ (major.minor.patch) అనుసరించాలి
2. **తేదీ**: విడుదల లేదా నవీకరణ తేదీ YYYY-MM-DD ఫార్మాట్‌లో
3. **వర్గం**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **స్పష్టమైన వివరణ**: మార్పు ఏమిటో సంక్షిప్త వివరణ
5. **ప్రభావ అంచనా**: మార్పులు ప్రస్తుత వినియోగదారులపై ఎలా ప్రభావితం చేస్తాయో

### మార్పుల వర్గాలు

#### జోడించబడింది
- కొత్త ఫీచర్లు, డాక్యుమెంటేషన్ విభాగాలు, లేదా సామర్థ్యాలు
- కొత్త ఉదాహరణలు, టెంప్లేట్లు, లేదా అభ్యాస వనరులు
- అదనపు టూల్స్, స్క్రిప్ట్స్, లేదా యుటిలిటీస్

#### మార్చబడింది
- ఉన్న ఫంక్షనాలిటీ లేదా డాక్యుమెంటేషన్‌లో మార్పులు
- స్పష్టత లేదా ఖచ్చితత్వం పెంచడానికి నవీకరణలు
- కంటెంట్ లేదా సంస్థాపనలో పునర్నిర్మాణం

#### డిప్రికేటెడ్
- దశనీయంగా తొలగించబడుతున్న ఫీచర్లు లేదా విధానాలు
- తొలగింపుకు షెడ్యూల్ చేయబడిన డాక్యుమెంటేషన్ విభాగాలు
- అవసరమయ్యే ఉత్తమ ప్రత్యామ్నాయాలు ఉన్న పద్ధతులు

#### తొలగించబడ్డవి
- ఇప్పుడికాని ఫీచర్లు, డాక్యుమెంటేషన్ లేదా ఉదాహరణలు
- పాత సమాచారం లేదా డిప్రికేటెడ్ విధానాలు
- అదనపు లేదా సమగ్రత లేకపోయే కంటెంట్

#### పరిష్కరించబడింది
- డాక్యుమెంటేషన్ లేదా కోడ్‌లో పొరపాట్ల సవరణలు
- నివేదించబడిన సమస్యల లేదా బగ్స్ పరిష్కారం
- ఖచ్చితత్వం లేదా ఫంక్షనాలిటీపై మెరుగుదలలు

#### భద్రత
- భద్రత సంబంధిత మెరుగుదలలు లేదా ఫిక్సులు
- భద్రతా ఉత్తమ ప్రాక్టీసులకు సంబంధించి నవీకరణలు
- భద్రతా ప్రమాదాలను పరిష్కరించిన సంస్కరణలు

### సెమాంటిక్ వెర్షనింగ్ మార్గదర్శకాలు

#### మెజర్ వెర్షన్ (X.0.0)
- వినియోగదారు చర్య అవసరం చేసే బ్రేకింగ్ మార్పులు
- కంటెంట్ లేదా సంస్థాపనలో ప్రధాన పునర్వ్యవస్థీకరణ
- మూల పద్ధతి లేదా విధానాన్ని మార్చే మార్పులు

#### మైనర్ వెర్షన్ (X.Y.0)
- కొత్త ఫీచర్లు లేదా కంటెంట్ జోడింపులు
- బ్యాక్‌వార్డ్ కంపేటిబిలిటీని కాపాడుతూ ఉన్న అభివృద్ధులు
- అదనపు ఉదాహరణలు, టూల్స్, లేదా వనరులు

#### ప్యాచ్ వెర్షన్ (X.Y.Z)
- బగ్ ఫిక్స్‌లు మరియు సవరణలు
- ఉన్న కంటెంట్‌కు చిన్న మెరుగుదలలు
- స్పష్టతలు మరియు చిన్న అభివృద్ధులు

## కమ్యూనిటీ ఫీడ్‌బ్యాక్ మరియు సూచనలు

ఈ లర్నింగ్ రిసోర్స్‌ను మెరుగుపరచడానికి మేము కమ్యూనిటీ ఫీడ్‌బ్యాక్‌ను ప్రోత్సహిస్తాము:

### ఫీడ్‌బ్యాక్ ఎలా ఇవ్వాలి
- **GitHub Issues**: సమస్యలను నివేదించండి లేదా మెరుగుదలలు ప్రతిపాదించండి (AI-సంబంధిత ఇష్యూలు స్వాగతం)
- **Discord Discussions**: ఆలోచనలు పంచుకొని Microsoft Foundry కమ్యూనిటీతో చర్చించండి
- **Pull Requests**: ముఖ్యంగా AI టెంప్లేట్లు మరియు గైడ్స్‌కు నేరుగా మెరుగుదలలుగా కాంట్రిబ్యూట్ చేయండి
- **Microsoft Foundry Discord**: AZD + AI చర్చల కోసం #Azure ఛానెల్లో పాల్గొనండి
- **Community Forums**: విస్తృత Azure డెవలపర్ చర్చల్లో పాల్గొనండి

### ఫీడ్‌బ్యాక్ విభాగాలు
- **AI కంటెంట్ ఖచ్చితత్వం**: AI సర్వీస్ ఇంటిగ్రేషన్ మరియు డిప్లాయ్‌మెంట్ సమాచారంలో సవరణలు
- **లెర్నింగ్ అనుభవం**: AI డెవలపర్ అభ్యాస ప్రవాహాన్ని మెరుగుపరచే సూచనలు
- **లోపం ఉన్న AI కంటెంట్**: అదనపు AI టెంప్లేట్లు, నమూనాలు లేదా ఉదాహరణల కోసం అభ్యర్థనలు
- **అక్సెసిబిలిటీ**: విభిన్న అభ్యాస అవసరాలకు అనుగుణంగా మెరుగుదలలు
- **AI టూల్ ఇంటిగ్రేషన్**: మెరుగైన AI అభివృద్ధి వర్క్‌ఫ్లో ఇంటిగ్రేషన్ కోసం సూచనలు
- **ప్రొడక్షన్ AI నమూనాలు**: ఎంటర్ప్రైజ్ AI డిప్లాయ్‌మెంట్ నమూనాల అభ్యర్థనలు

### ప్రతిస్పందన బాధ్యత
- **ఇష్యూ ప్రతిస్పందన**: నివేదించబడిన సమస్యలకు 48 గంటలలోపే
- **ఫీచర్ అభ్యర్థనలు**: ఒక వారంలోలో మూల్యాంకనం
- **కమ్యూనిటీ సహకారాలు**: ఒక వారంలో సమీక్ష
- **భద్రతా సమస్యలు**: తక్షణ ప్రాధాన్యం మరియు వేగవంతమైన ప్రతిస్పందన

## నిర్వహణ షెడ్యూల్

### నియమిత నవీకరణలు
- **మాసిక సమీక్షలు**: కంటెంట్ ఖచ్చితత్వం మరియు లింక్ ధృవీకరణ
- **త్రైమాసిక నవీకరణలు**: ప్రధాన కంటెంట్ జోడింపులు మరియు మెరుగుదలలు
- **అర్ధ-వార్షిక సమీక్షలు**: సమగ్ర పునర్వ్యవస్థీకరణ మరియు అభివృద్ధి
- **వార్షిక రిలీజ్‌లు**: ముఖ్యమైన మెరుగుదలలతో మెజర్ వెర్షన్ నవీకరణలు

### మానిటరింగ్ మరియు క్వాలిటీ ఆశ్యూరెన్స్
- **ఆటోమేటెడ్ టెస్టింగ్**: కోడ్ ఉదాహరణలు మరియు లింక్‌ల నియమిత ధృవీకరణ
- **కమ్యూనిటీ ఫీడ్‌బ్యాక్ ఇంటిగ్రేషన్**: వినియోగదారు సూచనలను నియమితంగా చేర్చడం
- **టెక్నాలజీ నవీకరణలు**: తాజా Azure సర్వీసులు మరియు azd రిలీజ్‌లతో సర్దుబాటు
- **అక్సెసిబిలిటీ ఆడిట్స్**: инк్లూసివ్ డిజైన్ సిద్ధాంతాల కోసం నియమిత సమీక్ష

## వెర్షన్ మద్దతు విధానం

### ప్రస్తుత వెర్షన్ మద్దతు
- **ఇటీవల మెజర్ వెర్షన్**: నియమిత నవీకరణలతో పూర్తి మద్దతు
- **మునుపటి మెజర్ వెర్షన్**: 12 నెలల పాటు భద్రతా నవీకరణలు మరియు కీలక ఫిక్సులు
- **లెగేసీ వెర్షన్లు**: కేవలం కమ్యూనిటీ మద్దతు, ఎలాంటి అధికారిక నవీకరణలు లేవు

### మైగ్రేషన్ మార్గదర్శకాలు
మెజర్ వెర్షన్లు రిలీజ్ చేసినప్పుడు, మేము అందిస్తాము:
- **మైగ్రేషన్ గైడ్‌లు**: దశలవారీ మార్పుల సూచనలు
- **కంపాటిబిలిటీ నోట్స్**: బ్రేకింగ్ మార్పుల గురించి వివరాలు
- **టూల్ మద్దతు**: మైగ్రేషన్ సహాయానికి స్క్రిప్ట్స్ లేదా యుటిలిటీస్
- **కమ్యూనిటీ మద్దతు**: మైగ్రేషన్ ప్రశ్నల కోసం ప్రత్యేక ఫోరమ్స్

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [స్టడీ గైడ్](resources/study-guide.md)
- **తరువాతి పాఠం**: తిరిగి వెళ్ళి [ప్రధాన README](README.md)

**అప్డేట్‌లను గమనించండి**: కొత్త రిలీజ్‌లు మరియు లర్నింగ్ మెటీరియల్స్‌కు సంబంధించిన ముఖ్యమైన నవీకరణల గురించి నోటిఫికేషన్ల కోసం ఈ రిపాజిటరీని వాచ్ చేయండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ డాక్యుమెంట్ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వాన్ని లక్ష్యంగా పెట్టుకున్నప్పటికి, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా అవినీతులు ఉండే అవకాశం ఉందని దయచేసి గమనించండి. స్థానిక భాషలోని అసలు డాక్యుమెంట్‌ను అధికారిక స్రోతంగా పరిగణించలసినది. అత్యవసర లేదా కీలకమైన సమాచారం కోసం, వృత్తిపరమైన మానవ అనువాదాన్ని సూచించబడుతుంది. ఈ అనువాదం ఉపయోగించడంవల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
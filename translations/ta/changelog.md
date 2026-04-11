# மாற்றுப் பதிவேடு - AZD தொடக்கத்தவர்களுக்கு

## அறிமுகம்

இந்த மாற்றுப் பதிவேடு AZD For Beginners ரெப்போசிடோரியில் உள்ள அனைத்து குறிப்பிடத்தக்க மாற்றங்கள், புதுப்பிப்புகள் மற்றும் மேம்பாடுகளை பதிவு செய்கிறது. நாங்கள் சொற்பொருள் பதிப்பு நிர்ணயதத்துவத்தை (semantic versioning) பின்பற்றுகிறோம் மற்றும் பதிப்புகளுக்கிடையிலான மாற்றங்களை பயனர்கள் புரிந்துகொள்ள உதவ இந்த பதிவை பராமரிக்கின்றோம்.

## கற்றல் இலக்குகள்

இந்த மாற்றுப் பதிவின் மூலம் நீங்கள்:
- புதிய அம்சங்கள் மற்றும் உள்ளடக்கத் தொகுதிகள் குறித்து அறிவிக்கப்படுவீர்கள்
- உள்ள दस्तावेजங்களின் மேம்பாடுகளை புரிந்துகொள்ளவீர்கள்
- துல்லியத்தன்மையை உறுதி செய்ய பக்கப்பிழை திருத்தங்கள் மற்றும் சரிசெய்தல்களை தடவியாகக் கண்காணிப்பீர்கள்
- கற்றல் الموادகளின் காலம் அதிகரிப்பை தொடர்வீர்கள்

## கற்றல் முடிவுகள்

மாற்றுப் பதிவுகளை ஆராய்ந்த பிறகு, நீங்கள் செய்யக்கூடியவைகள்:
- கற்றலுக்கான புதிய உள்ளடக்கங்கள் மற்றும் வளங்களை அடையாளம் காணவே முடியும்
- எந்த பிரிவுகள் புதுப்பிக்கப்பட்டவோ அல்லது மேம்படுத்தப்பட்டவோ என்பதை புரிந்துகொள்ள முடியும்
- தற்போதைய உள்ளடக்கத்தின் அடிப்படையில் உங்கள் கற்றல் பாதையை திட்டமிட முடியும்
- எதிர்கால மேம்பாடுகளுக்கான கருத்துக்களையும் பரிந்துரைகளையும் வழங்கச் செய்யலாம்

## பதிப்பு வரலாறு

### [v3.19.1] - 2026-03-27

#### தொடக்கத்தவர்களின் ஆன்‌போர்டிங் தெளிவுபடுத்தல், அமைப்பு சரிபார்ப்பு & இறுதி AZD கட்டளைக் குழப்ப நீக்கம்
**இந்த பதிப்பு AZD 1.23 சரிபார்ப்பு பரிசோதனைக்குப் பிறகு தொடக்கக்குழுவுக்கான கையெழுத்து நிரூபணப் பாச்ஸை தொடர்கிறது: இது AZD-முதலில் அங்கீகாரம் வழிகாட்டுதலை தெளிவுப்படுத்துகிறது, உள்ளூரு அமைப்பு சரிபார்ப்பு ஸ்கிரிப்டுகளை சேர்க்கிறது, முக்கியக் கட்டளைகளை நேரடி AZD CLI மீது சோதனை செய்கிறது, மற்றும் changelog தவிர முந்தைய பழைய ஆங்கில மூலக் கட்டளைக் குறிப்புகளைக் கடைசியாக அகற்றுகிறது.**

#### Added
- **🧪 தொடக்க பயனர் அமைப்பு சரிபார்ப்பு ஸ்கிரிப்டுகள்** `validate-setup.ps1` மற்றும் `validate-setup.sh` உடன், பயில்வோருக்கு அத்தியாவசிய கருவிகள் சரிபார்க்கப்படுகிறதா என்பதை Chapter 1 தொடங்குவதற்கு முன் உறுதி செய்யும் வகையில்
- **✅ முன்னணியில் அமைப்பு சரிபார்ப்புப் படிகள்** ரூட் README மற்றும் Chapter 1 README இல் சேர்க்கப்பட்டன, ஆகவே `azd up` முன் குறைவான முன்-தேவைகள் பிடிக்கப்படுகின்றன

#### Changed
- **🔐 தொடக்க அங்கீகாரம் வழிகாட்டுதல்** இப்போது தொடர்ச்சியாக `azd auth login` ஐ AZD பணியுறவுகளுக்கு முதன்மையான பாதையாக扱ிறது, `az login` விருப்பமானதாக மட்டும் குறிப்பிடப்பட்டுள்ளது (நேரடியாக Azure CLI கட்டளைகள் பயன்படுத்தப்படவில்லை என்றால்)
- **📚 Chapter 1 ஆன்‌போர்டிங் வழங்கு** இப்போது பயில்வோருக்கு நிறுவலுக்கு முன் உள்ளூர்மையான அமைப்பை சரிபார்க்க வழி காட்டுகிறது, அங்கீகாரம் மற்றும் முதல் பிரசுரப் படிகள் இடையே
- **🛠️ சரிபார்ப்பாளர் செய்திமடல்** இப்போது AZD-மாதிரியான தொடக்க பாதைக்கு கட்டுப்படுத்தும் தேவைகள் மற்றும் விருப்பமான Azure CLI எச்சரிக்கைகளை தெளிவாக பிரிக்கிறது
- **📖 கட்டமைப்பு, நிவாரணம் மற்றும் உதாரணக் கோவைகள்** இப்போது தேவையான AZD அங்கீகாரம் மற்றும் விருப்பமான Azure CLI சைன்-இன் இடையே வேறுபாடுகளை முன்பை விட தெளிவாகக் காட்டுகின்றன

#### Fixed
- **📋 மீதமுள்ள ஆங்கில மூலக் கட்டளை குறிப்புகள்** தற்போதைய AZD வடிவங்களுக்கு புதுப்பிக்கப்பட்டது, அதில் cheat sheet இல் `azd config show` மற்றும் Azure Portal காட்சி வழிகாட்டுதலுக்காக முன்முயற்சியில் இருந்த `azd monitor --overview` அடக்கம்
- **🧭 Chapter 1 இல் தொடக்கக் கோரிக்கைகள்** அனைத்து மாதிரிகளிலும் மற்றும் Azure வளங்களில் பணிவிழக்காத அல்லது திரும்பும் செயல்பாடு இனிமேல் உறுதி செய்வதாகப் படிப்பினைகளை மிகைப்படுத்தாமல் மෘதுவாக்கப்பட்டது
- **🔎 நேரடி CLI சரிபார்ப்பு** தற்போது ஆதரவு உறுதிசெய்தது: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, மற்றும் `azd down --force --purge`

#### புதுப்பிக்கப்பட்ட கோப்புகள்
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

#### AZD 1.23.12 சரிபார்ப்பு, வகுப்பகச் சூழல் விரிவாக்கம் & AI மாதிரி புதுப்பிப்பு
**இந்த பதிப்பு `azd` `1.23.12` ஐ எதிர்கொண்டு ஒரு ஆவண சரிபார்ப்பு பரிமாற்றத்தை மேற்கொள்கிறது, பழைய AZD கட்டளை உதாரணங்களை புதுப்பிக்கிறது, AI மாதிரி வழிகாட்டுதல்களை தற்போதைய இயல்புகளுக்கு புதுப்பிக்கிறது, மற்றும் காராண்டவல் வழிகாட்டுதல்களை GitHub Codespaces மட்டுமில்லை என மற்ற dev container மற்றும் உள்ளூர் கிளோன்களையும் ஆதரிக்க하도록 விரிவாக்குகிறது.**

#### Added
- **✅ முக்கிய அத்தியாயங்கள் மற்றும் வகுப்பகக் கோவைகளில் சரிபார்ப்பு குறிப்புகள்** பயில்வோருக்கு பயன்படுத்தப்படும் AZD அடிப்படைக் கட்டளைநிரலின் சோதிக்கப்பட்ட பதிப்பை தெளிவுபடுத்த
- **⏱️ நீண்டகால AI செயலிகள் பிரசுரத்திற்கான நேர எல்லை வழிகாட்டுதல்** `azd deploy --timeout 1800` போன்றவை பயன்படுத்தக் கூடியவை
- **🔎 நீட்சிப் பரிசோதனை படிகள்** AI வேலைநடத்தல் ஆவணங்களில் `azd extension show azure.ai.agents` உடன்
- **🌐 விரிவான வகுப்பக சூழல் வழிகாட்டுதல்** GitHub Codespaces, dev containers, மற்றும் MkDocs உடன் உள்ளூர் கிளோன்களைப் பற்றியும் கொள்கின்றது

#### Changed
- **📚 அத்தியாய அறிமுக README-கள்** இப்போது அடிப்படை, கட்டமைப்பு, கட்டமைப்பு, பல-ஏஜெண்ட், முன்-பிரசுரம், நிவாரணம் மற்றும் உற்பத்தி பிரிவுகளில் `azd 1.23.12` உடன் சரிபார்க்கப்பட்டது என ஒரே கோரமாகக் குறிப்பிட்டுள்ளன
- **🛠️ AZD கட்டளை குறிப்புகள்** ஆவணங்களில் தற்போதைய வடிவங்களுக்கு புதுப்பிக்கப்பட்டன:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` அல்லது `azd env get-value(s)` சூழல்படி
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights காட்சி நோக்கில் `azd monitor --overview`
- **🧪 Provision preview உதாரணங்கள்** தற்போது ஆதரிக்கப்பட்ட பயன்பாட்டுக்கு எளிமையாக்கப்பட்டன, உதாரணமாக `azd provision --preview` மற்றும் `azd provision --preview -e production`
- **🧭 வகுப்பக ஓட்டம்** இப்போது பயில்வோர் Codespaces, devcontainer அல்லது உள்ளூர் கிளோனில் பயிற்சிகள் முழுமையாக்க முடியும் என்று புதுப்பிக்கப்பட்டது
- **🔐 அங்கீகாரம் வழிகாட்டுதல்** AZD பணியுறவுகளுக்கு `azd auth login` ஐ முன்னுரிமை கொடுக்கின்றது, Azure CLI கட்டளைகள் நேரடியாக பயன்படுத்தப்படும்பொழுது மட்டும் `az login` விருப்பமாக குறிப்பிடப்பட்டுள்ளது

#### Fixed
- **🪟 Windows நிறுவல் கட்டளைகள்** installation வழிகாட்டியில் `winget` package எழுத்து வழக்கு தற்போது சரிசெய்யப்பட்டது
- **🐧 Linux நிறுவல் வழிகாட்டுதல்** distro-சார்பான ஆதரிக்கப்படாத `azd` package manager வழிமுறைகளை தவிர்க்கச் சரிபார்க்கப்பட்டது; அதற்கு பதிலாக release assets குக்குள் மெய்நிகர் வழிகாட்டப்பட்டது
- **📦 AI மாதிரி உதாரணங்கள்** பழைய இயல்புகள் `gpt-35-turbo` மற்றும் `text-embedding-ada-002` ஆகியவற்றிலிருந்து தற்போதைய உதாரணங்களுக்கு புதுப்பிக்கப்பட்டன, உதாரணமாக `gpt-4.1-mini`, `gpt-4.1`, மற்றும் `text-embedding-3-large`
- **📋 பிரசுரம் மற்றும் டயக்னோஸ்டிக்ஸ் துண்டுகள்** தற்போது பதிவு, ஸ்கிரிப்ட் மற்றும் நிவாரண படிகளில் சரியான சுற்றுச்சூழல் மற்றும் நிலை கட்டளைகளைப் பயன்படுத்த திருத்தப்பட்டன
- **⚙️ GitHub Actions வழிகாட்டுதல்** `Azure/setup-azd@v1.0.0` இல் இருந்து `Azure/setup-azd@v2` ஆக புதுப்பிக்கப்பட்டது
- **🤖 MCP/Copilot இணக்கத்துறை வழிகாட்டுதல்** `azd mcp consent` இல் இருந்து `azd copilot consent list` ஆக புதுப்பிக்கப்பட்டது

#### மேம்படுத்தப்பட்டது
- **🧠 AI அத்தியாய வழிகாட்டுதல்** இப்போது preview-உடைய `azd ai` நடத்தைகள், டெனன்ட்-சார்ந்த உள்நுழைவு, தற்போதைய நீட்சிகள் பயன்பாடு மற்றும் புதுப்பிக்கப்பட்ட மாதிரி பிரசுர பரிந்துரைகளை சிறப்பாக விளக்குகிறது
- **🧪 வகுப்பக வழிமுறைகள்** தற்போது உரையாடலுக்கு அதிகமான பதிப்புகளும் தெளிவான சூழல் அமைப்பு மொழியுடனும் பயன்படுத்தப்படுகின்றன
- **📈 உற்பத்தி மற்றும் நிவாரண ஆவணங்கள்** தற்போதைய மானிட்டரிங், மாற்றுப் மாதிரி மற்றும் கட்டண-அடுக்கு உதாரணங்களுடன் சிறப்பாக பொருந்துகின்றன

#### புதுப்பிக்கப்பட்ட கோப்புகள்
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

#### AZD AI CLI கட்டளைகள், உள்ளடக்க சரிபார்ப்பு & சையான்துகள் விரிவு
**இந்த பதிப்பு `azd ai`, `azd extension`, மற்றும் `azd mcp` கட்டளைகளிற்கான கவரேஜைப் அனைத்து AI-சார்ந்த அத்தியாயங்களிலும் சேர்க்கிறது, agents.md இல் உடைய உடைந்த இணைப்புகளை மற்றும் காலாவதியான கோடை சரிசெய்கிறது, cheat sheet இனை புதுப்பிக்கிறது மற்றும் உதாரண Templets பிரிவை செல்லுபடியாக்கப்பட்ட விளக்கங்கள் மற்றும் புதிய Azure AI AZD templets உடன் முழுமையாக மாற்றுகிறது.**

#### Added
- **🤖 AZD AI CLI கவரேஜ்** 7 கோப்புகளில் (முந்தையது yalnız Chapter 8 இல் இருந்தது):
  - `docs/chapter-01-foundation/azd-basics.md` — புதிய "Extensions and AI Commands" பிரிவு `azd extension`, `azd ai agent init`, மற்றும் `azd mcp` ஐ அறிமுகப்படுத்துகிறது
  - `docs/chapter-02-ai-development/agents.md` — விருப்பு 4: `azd ai agent init` வாரியத்தில் template vs manifest அணுகுமுறை ஒப்பீட்டு அட்டவணை
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" மற்றும் "Agent-First Deployment" உபப்பிரிவுகள்
  - `docs/chapter-05-multi-agent/README.md` — Quick Start இப்போது both template மற்றும் manifest-அடிப்படையிலான பிரசுர பாதைகளை காட்டுகிறது
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy பிரிவு இப்போது `azd ai agent init` விருப்பத்தையும் அடக்குகிறது
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" உபப்பிரிவு
  - `resources/cheat-sheet.md` — புதிய "AI & Extensions Commands" பிரிவு `azd extension`, `azd ai agent init`, `azd mcp`, மற்றும் `azd infra generate` உடன்
- **📦 புதிய AZD AI உதாரண templets** `microsoft-foundry-integration.md` இல்:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel மற்றும் voice chat ஆதரவு கொண்ட .NET RAG உரையாடல்
  - **azure-search-openai-demo-java** — Langchain4J பயன்படுத்தி Java RAG உரையாடல் ACA/AKS பிரசுர விருப்பங்களுடன்
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, மற்றும் Prompty போன்றவை பயன்படுத்தும் பல-ஏஜெண்ட் படைப்புத் எழுத்து செயலி
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB மூலம் serverless RAG உடன் Ollama உள்ளூர் உருவாக்க ஆதரவு
  - **chat-with-your-data-solution-accelerator** — நிர்வாக பட்டியல், Teams ஒருங்கிணைப்பு மற்றும் PostgreSQL/Cosmos DB விருப்பங்களுடன் உள்ள எண்டர்பிரைஸ் RAG accelerator
  - **azure-ai-travel-agents** — .NET, Python, Java, மற்றும் TypeScript மென்பொருள் சேவைகளுடன் பல-ஏஜெண்ட் MCP ஒருங்கிணைப்பு காட்டும் மேற்பார்வை பயன்பாடு
  - **azd-ai-starter** — குறைந்தபட்ச Azure AI கட்டமைப்பு Bicep தொடக்க templett
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI கேலரி](https://azure.github.io/awesome-azd/?tags=ai) (80+ templets) குக்கான குறிப்பு

#### Fixed
- **🔗 agents.md வழிசெலுத்தல்**: Previous/Next இணைப்புகள் இப்போது Chapter 2 README பாட வரிசைக்கு (Microsoft Foundry Integration → Agents → AI Model Deployment) பொருந்துகின்றன
- **🔗 agents.md உடைந்த இணைப்புகள்**: `production-ai-practices.md` திருத்தப்பட்டது `../chapter-08-production/production-ai-practices.md` ஆக (3 இடங்களில்)
- **📦 agents.md காலாவதியான கோடை**: `opencensus` ஐ `azure-monitor-opentelemetry` + OpenTelemetry SDK ஆக மாற்றப்பட்டது
- **🐛 agents.md தவறான API**: `max_tokens` ஐ `create_agent()` இருந்து `create_run()` இற்கு `max_completion_tokens` ஆக நகர்த்தப்பட்டது
- **🔢 agents.md டோக்கன் எண்ணிக்கை**: அண்மையில் பயன்படுத்தப்பட்ட rough `len//4` கணிப்பை `tiktoken.encoding_for_model()` க்கு மாற்றியது
- **azure-search-openai-demo**: சேவைகள் விவரத்தை "Cognitive Search + App Service" இலிருந்து "Azure AI Search + Azure Container Apps" ஆக சரிசெய்தது (இயல்புநிலை ஹோஸ்ட் அக்டோபர் 2024 இல் পরিবর্তித்தது)
- **contoso-chat**: விளக்கம் Azure AI Foundry + Prompty ஐ குறிக்க하도록 புதுப்பிக்கப்பட்டது, repo இன் மெய்நிகர் தலைப்பு மற்றும் தொழில்நுட்பத் தொகுப்பிற்கு பொருந்தும் வகையில்

#### Removed
- **ai-document-processing**: செயல்படாத template குறிப்பை அகற்றப்பட்டது (repo பொதுவாக அணுகமுடியாததால் AZD templett ஆக கிடைக்கவில்லை)

#### மேம்படுத்தப்பட்டது
- **📝 agents.md பயிற்சிகள்**: பயிற்சி 1 இப்போது எதிர்பார்க்கப்படும் வெளியீடு மற்றும் `azd monitor` படியை காட்டுகிறது; பயிற்சி 2 முழு `FunctionTool` பதிவு குறியீட்டை உள்ளடக்கியது; பயிற்சி 3 துல்லியமற்ற வழிகாட்டலை துல்லியமான `prepdocs.py` கட்டளைகளால் மாற்றுகிறது
- **📚 agents.md வளங்கள்**: தற்போதைய Azure AI Agent Service ஆவணங்கள் மற்றும் quickstart களுக்கான ஆவண இணைப்புகளை புதுப்பித்தது
- **📋 agents.md அடுத்த படிகள் அட்டவணை**: அத்தியாயத்தை முழுமையாக உள்ளடக்கிய AI Workshop Lab இணைப்பை சேர்த்தது

#### மேம்படுத்தப்பட்ட கோப்புகள்
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### பாடநெறி வழிச் செல்லல் மேம்பாடு
**இந்த பதிப்பு README.md அத்தியாய வழிச் செல்லலை மேம்படுத்திய புதிய அட்டவணை வடிவத்துடன் வழங்குகிறது.**

#### மாற்றங்கள்
- **பாடநெறி வரைபட அட்டவணை**: நேரடி பாட இணைப்புகள், கால அளவீட்டு மதிப்பீடுகள் மற்றும் சிக்கல்திறன் மதிப்பீடுகளுடன் மேம்படுத்தப்பட்டது
- **கோப்பு அடைவு சுத்திகரிப்பு**: தேவையற்ற பழைய கோப்புறைங்கள் நீக்கப்பட்டன (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **இணைப்பு சரிபார்த்தல்**: Course Map அட்டவணையில் உள்ள 21+ உள் இணைப்புகள் அனைத்தும் சரிபார்க்கப்பட்டன

### [v3.16.0] - 2026-02-05

#### தயாரிப்பு பெயர் புதுப்பிப்புகள்
**இந்த பதிப்பு தயாரிப்பு குறிப்புகளை தற்போதைய Microsoft பிராண்டிங்கிற்கு பொருத்தமாக புதுப்பிக்கிறது.**

#### மாற்றம்
- **Microsoft Foundry → Microsoft Foundry**: அனைத்து குறிப்புகளும் மொழிபெயர்ப்பு அல்லாத கோப்புகளில் புதுப்பிக்கப்பட்டன
- **Azure AI Agent Service → Foundry Agents**: சேவை பெயர் தற்போதைய பிராண்டிங்கைப் பிரதிபலிக்க புதுப்பிக்கப்பட்டது

#### மேம்படுத்தப்பட்ட கோப்புகள்
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

#### களஞ்சியத்தின் முக்கிய மறுசீரமைப்பு: அத்தியாய அடிப்படையிலான கோப்புறை பெயர்கள்
**இந்த பதிப்பு ஆவணங்களை தெளிவான வழிசெலுத்தலுக்காக அத்தியாய அடிப்படையிலான அடைவுகளாக மறுசீரமைப்பதில் உள்ளது.**

#### கோப்பு அடைவு பெயர் மாற்றங்கள்
பழைய கோப்புறைகள் அத்தியாய-எண் அடைவு கோப்புறைகளால் மாற்றப்பட்டுள்ளன:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- புதியதாகச் சேர்க்கப்பட்டது: `docs/chapter-05-multi-agent/`

#### கோப்பு இடமாற்றங்கள்
| கோப்பு | மூலம் | இலக்கு |
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

#### சேர்த்தவை
- **📚 அத்தியாய README கோப்புகள்**: ஒவ்வொரு அத்தியாயக் கோப்புறையிலும் README.md உருவாக்கப்பட்டது, இதில்:
  - கற்றலின் நோக்கங்கள் மற்றும் கால அளவீட்டுகள்
  - விளக்கங்களுடன் கூடிய பாட அட்டவணை
  - விரைவு துவக்க கட்டளைகள்
  - பிற அத்தியாயங்களுக்கு வழிசெலுத்தல்

#### மாற்றங்கள்
- **🔗 அனைத்து உள் இணைப்புகளும் புதுப்பிக்கப்பட்டன**: 78+ பாதைகள் அனைத்து ஆவண கோப்புகளிலும் புதுப்பிக்கப்பட்டன
- **🗺️ Main README.md**: புதிய அத்தியாய அமைப்புடன் Course Map புதுப்பிக்கப்பட்டது
- **📝 examples/README.md**: அத்தியாய கோப்புறைகளுக்கு கிராஸ்-ரெஃபரன்சுகளை புதுப்பித்தது

#### அகற்றப்பட்டது
- பழைய கோப்பு அமைப்பு (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### களஞ்சிய மறுசீரமைப்பு: அத்தியாய வழிச் செல்லல்
**இந்த பதிப்பு அத்தியாய வழிச் செல்ல README கோப்புகளை சேர்த்தது (v3.15.0 மூலம் மாற்றப்பட்டது).**

---

### [v3.13.0] - 2026-02-05

#### புதிய AI ஏஜென்ட் வழிகாட்டி
**இந்த பதிப்பு Azure Developer CLI உடன் AI ஏஜென்ட்களை எந்தபடி வெளியிடுவது என்பதற்கான விரிவான வழிகாட்டியை சேர்க்கிறது.**

#### சேர்த்தவை
- **🤖 docs/microsoft-foundry/agents.md**: பூரண வழிகாட்டி, இதில் சேர்க்கப்பட்டுள்ளது:
  - AI ஏஜென்ட்கள் என்ன மற்றும் அவை சாட்பாட์களிலிருந்து எவ்வாறு வேறுபடுகின்றன
  - மூன்று விரைவு தொடக்க ஏஜென்ட் மாதிரிகள் (Foundry Agents, Prompty, RAG)
  - ஏஜென்ட் கட்டமைப்பு முறைமைகள் (ஒற்றை ஏஜென்ட், RAG, பல-ஏஜென்ட்)
  - கருவி உள்ளமைவு மற்றும் தனிப்பயன் அமைவு
  - கண்காணிப்பு மற்றும் அளவுகோல் பின்தொடர்தல்
  - செலவுக் கருதல்கள் மற்றும் செயல்திறன் மேம்பாடு
  - பொதுவான பிழை தீர்வு சூழ்நிலைகள்
  - வெற்றி அளவீடுகளுடன் மூன்று கைமுறை பயிற்சிகள்

#### உள்ளடக்க அமைப்பு
- **அறிமுகம்**: தொடக்கத்திற்கான ஏஜென்ட் கருத்தாக்கங்கள்
- **துரித தொடக்கம்**: `azd init --template get-started-with-ai-agents` கொண்டு ஏஜென்ட்களை வெளியிடுதல்
- **கட்டமைப்பு முறைமைகள்**: ஏஜென்ட் முறைமைகளின் காட்சி வரைபடங்கள்
- **உள்ளமைவு**: கருவி அமைப்பு மற்றும் சுற்றுச்சூழல் மாறிலிகள்
- **கண்காணிப்பு**: Application Insights ஒருங்கிணைப்பு
- **பயிற்சிகள்**: முன்னேறும் கைமுறை கற்பித்தல் (ஒவ்வொன்றும் 20-45 நிமிடங்கள்)

---

### [v3.12.0] - 2026-02-05

#### DevContainer சூழல் புதுப்பிப்பு
**இந்த பதிப்பு AZD கற்கும் அனுபவத்திற்கு நவீன கருவிகள் மற்றும் சிறந்த இயல்புநிலை அமைப்புகளுடன் development container கட்டமைப்பை புதுப்பிக்கிறது.**

#### மாற்றம்
- **🐳 அடிப்படை படம்**: `python:3.12-bullseye` இருந்து `python:3.12-bookworm` (சமீபத்திய Debian நிலையான) இற்கு மேம்படுத்தப்பட்டது
- **📛 கன்டெய்னர் பெயர்**: தெளிவிற்காக "Python 3" இருந்து "AZD for Beginners" என்று பெயர்ச்செய்யப்பட்டது

#### சேர்க்கப்பட்டது
- **🔧 புதிய Dev Container அம்சங்கள்**:
  - `azure-cli` உடன் Bicep ஆதரவு இயக்கப்படுகிறது
  - `node:20` (AZD மாதிரிகள் க்கான LTS பதிப்பு)
  - `github-cli` மாதிரி மேலாண்மைக்காக
  - `docker-in-docker` கன்டெய்னர் அப்ளிக்கேஷன் வெளியீடுகளுக்காக

- **🔌 போர்ட் ஃபார்வார்டிங்**: பொதுவான மேம்பாட்டு பயன்பாடுகளுக்கான முன்னமைவு போர்ட்கள்:
  - 8000 (MkDocs முன்னோட்டம்)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 புதிய VS Code நீடிப்புகள்**:
  - `ms-python.vscode-pylance` - மேம்பட்ட Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ஆதரவு
  - `ms-azuretools.vscode-docker` - Docker ஆதரவு
  - `ms-azuretools.vscode-bicep` - Bicep மொழி ஆதரவு
  - `ms-azure-devtools.azure-resource-groups` - Azure வள மேலாண்மை
  - `yzhang.markdown-all-in-one` - Markdown தொகுப்பாக்கம்
  - `DavidAnson.vscode-markdownlint` - Markdown லின்டிங்
  - `bierner.markdown-mermaid` - Mermaid வரைபட ஆதரவு
  - `redhat.vscode-yaml` - YAML ஆதரவு (azure.yaml க்காக)
  - `eamodio.gitlens` - Git காட்சிப்படுத்தல்
  - `mhutchie.git-graph` - Git வரலாறு

- **⚙️ VS Code அமைப்புகள்**: Python interpreter, format on save, மற்றும் whitespace trimming க்கான இயல்புநிலை அமைப்புகள் சேர்க்கப்பட்டன

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify plugin சேர்க்கப்பட்டது
  - code quality க்காக pre-commit சேர்க்கப்பட்டது
  - Azure SDK பேக்கேஜ்கள் சேர்க்கப்பட்டன (azure-identity, azure-mgmt-resource)

#### சரி செய்யப்பட்டது
- **Post-Create Command**: கன்டெய்னர் துவக்கத்தில் AZD மற்றும் Azure CLI நிறுவல்களை now சரிபார்க்கும்

---

### [v3.11.0] - 2026-02-05

#### ஆரம்ப நிலை பயனாளர்களுக்கான README மறுசீரமைப்பு
**இந்த பதிப்பு README.md ஐ ஆரம்ப நிலை பயனாளர்களுக்காக மிகவும் அணுகக்கூடியதாக மாற்றுகிறது மற்றும் AI டெவலப்பர்களுக்கு தேவையான ஆதாரங்களை சேர்க்கிறது.**

#### சேர்த்தவை
- **🆚 Azure CLI vs AZD ஒப்பீடு**: ஒவ்வொரு கருவியையும் எப்போது பயன்படுத்துவது என்பதற்கான தெளிவான விளக்கம் உடன் நடைமுறை எடுத்துக்காட்டுகள்
- **🌟 Awesome AZD இணைப்புகள்**: சமூக மாதிரி காட்சியகத்திற்கும் பங்களிப்பு ஆதாரங்களுக்கும் நேரடி இணைப்புகள்:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 விரைவு துவக்க வழிகாட்டி**: எளிமையாக்கப்பட்ட 3 படி தொடக்கம் பகுதி (Install → Login → Deploy)
- **📊 அனுபவ அடிப்படையிலான வழிச் செல்ல அட்டவணை**: டெவலப்பர் அனுபவத்தின் அடிப்படையில் எங்கிருந்து தொடங்குவது குறித்து தெளிவான வழிகாட்டி

#### மாற்றம்
- **README அமைப்பு**: முன்னுரிமை தெரிவு அல்லது progressive disclosure அடிப்படையில் மறுசீரமைப்பு - முக்கிய தகவல்கள் முதலில்
- **அறிமுக பிரிவு**: `azd up` இன் மாயாஜாலத்தை முழு ஆரம்ப நிலை பயனாளர்களுக்காக விளக்கும் வகையில் மறுலேখনம்
- **重複 உள்ளடக்கம் நீக்கம்**: 重複 troubleshooting பகுதியை நீக்கியது
- **பிழை தீர்வு கட்டளைகள்**: `azd logs` குறிப்பு தவறாக இருந்ததை சரிசெய்து `azd monitor --logs` க்கு மாற்றியது

#### சரி செய்யப்பட்டது
- **🔐 அங்கீகாரக் கட்டளைகள்**: `azd auth login` மற்றும் `azd auth logout` cheat-sheet.md க்கு சேர்க்கப்பட்டன
- **தவறான கட்டளை குறிப்புகள்**: README troubleshooting பகுதியிலிருந்து மீதமுள்ள `azd logs` குறிப்பு நீக்கப்பட்டது

#### குறிப்பு
- **பரவலாக்கம்**: மாற்றங்கள் main README.md மற்றும் resources/cheat-sheet.md க்கு பொருந்தும்
- **இலக்கு வாசகர்**: மாற்றங்கள் குறிப்பாக AZD இல் புதியவர்களுக்காக வடிவமைக்கப்பட்டவை

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI கட்டளை துல்லியத்தன்மை புதுப்பிப்பு
**இந்த பதிப்பு ஆவணங்களில் காணப்படும் இல்லாத AZD கட்டளைகளை சீரமைத்து அனைத்து குறியீட்டு எடுத்துக்காட்டுகளும் செல்லுபடியாகும் Azure Developer CLI சார்ந்த உருண்டு ஆகுமாறு சரி செய்துள்ளது.**

#### சரி செய்யப்பட்டது
- **🔧 இல்லாத AZD கட்டளைகள் நீக்கப்பட்டன/புதுப்பிக்கப்பட்டன**: விரிவான ஆய்வு மற்றும் தவறான கட்டளைகளின் மாற்றங்கள்:
  - `azd logs` (இல்லாதது) → `azd monitor --logs` அல்லது Azure CLI மாற்றுமுறை களை பயன்படுத்துகிறது
  - `azd service` துணைக்கட்டளைகள் (இல்லாதவை) → `azd show` மற்றும் Azure CLI க்கு மாற்றப்பட்டது
  - `azd infra import/export/validate` (இல்லாதவை) → நீக்கப்பட்டது அல்லது செல்லுபடியாகும் மாற்றுகளுடன் மாற்றப்பட்டது
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` கொண்ட கொடியொன்றுகள் (இல்லாதவை) → நீக்கப்பட்டன
  - `azd provision --what-if/--rollback` கொடியொன்றுகள் (இல்லாதவை) → `--preview` பயன்படுத்துமாறு புதுப்பிக்கப்பட்டது
  - `azd config validate` (இல்லாதது) → `azd config list` க்கு மாற்றம்
  - `azd info`, `azd history`, `azd metrics` (இல்லாதவை) → நீக்கப்பட்டன

- **📚 கட்டளை திருத்தங்களுடன் கோப்புகள் புதுப்பிக்கப்பட்டன**:
  - `resources/cheat-sheet.md`: கட்டளை குறிப்பீட்டின் பெரும் மறுசீரமைப்பு
  - `docs/deployment/deployment-guide.md`: ரோல்பேக் மற்றும் deployment 전략ங்கள் சீரமைக்கப்பட்டன
  - `docs/troubleshooting/debugging.md`: பதிவு பகுப்பாய்வு பகுதிகள் சரி செய்யப்பட்டது
  - `docs/troubleshooting/common-issues.md`: பிழை தீர்வு கட்டளைகள் aggiorn
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD டிபக்கிங் பகுதி சரி செய்யப்பட்டது
  - `docs/getting-started/azd-basics.md`: கண்காணிப்பு கட்டளைகள் திருத்தப்பட்டன
  - `docs/getting-started/first-project.md`: கண்காணிப்பு மற்றும் டிபக்கிங் எடுத்துக்காட்டுகள் புதுப்பிக்கப்பட்டன
  - `docs/getting-started/installation.md`: உதவி மற்றும் பதிப்பு எடுத்துக்காட்டுகள் சரிசெய்யப்பட்டன
  - `docs/pre-deployment/application-insights.md`: பதிவு பார்வை கட்டளைகள் சரி செய்யப்பட்டது
  - `docs/pre-deployment/coordination-patterns.md`: ஏஜென்ட் டிபக்கிங் கட்டளைகள் சரி செய்யப்பட்டது

- **📝 பதிப்பு குறிப்புகள் புதுப்பிக்கப்பட்டன**:
  - `docs/getting-started/installation.md`: ஹார்ட்கோடட் `1.5.0` பதிப்பை பொதுவான `1.x.x` ஆக மாற்றி, வெளியீடுகள் இணைப்பைக் கொடுத்தது

#### மாற்றம்
- **ரோல்பேக் रणनीதிகள்**: AZD இல் native rollback இல்லாதது காரணமாக Git அடிப்படையில் ரோல்பேக் பயன்பாடு குறித்து ஆவணங்கள் புதுப்பிக்கப்பட்டன
- **பதிவு பார்வை**: `azd logs` குறிப்பு `azd monitor --logs`, `azd monitor --live`, மற்றும் Azure CLI கட்டளைகளால் மாற்றப்பட்டது
- **செயல்திறன் பிரிவு**: அசல்-இல்லாத இணைப்புகள் மற்றும் இணைத் தொலைப்புகளை நீக்கி செல்லுபடியாகும் மாற்றுகள் கொடுக்கப்பட்டன

#### தொழில்நுட்ப விவரங்கள்
- **சரியான AZD கட்டளைகள்**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **சரியான azd monitor கொடிகள்**: `--live`, `--logs`, `--overview`
- **அகற்றப்பட்ட அம்சங்கள்**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### குறிப்புகள்
- **சரிபார்ப்பு**: கட்டளைகள் Azure Developer CLI v1.23.x கொண்டு சரிபார்க்கப்பட்டவை

---

### [v3.9.0] - 2026-02-05

#### பயிற்சி முடிவு மற்றும் ஆவணத் தரம் புதுப்பிப்பு
**இந்த பதிப்பு இடைமுகப்படுத்தப்பட்ட பயிற்சி தொகுதிகளை முடித்து, உடைந்த அனைத்து ஆவண இணைப்புகளையும் சரிசெய்து, Microsoft AZD பயன்படுத்தும் AI டெவலப்பர்களுக்கான உள்ளடக்க தரத்தை மேம்படுத்துகிறது.**

#### சேர்க்கப்பட்டவை
- **📝 CONTRIBUTING.md**: புதிய பங்களிப்பு வழிகாட்டி ஆவணம், இதில்:
  - பிரச்சனைகள் அறிக்கை செய்யவும் மாற்றங்களை பரிந்துரைக்கவும் தெளிவான அறிவுறுத்தல்கள்
  - புதிய உள்ளடக்கங்களுக்கு ஆவணத் தரநிலைகள்
  - கோடு எடுத்துக்காட்டு வழிகாட்டுதல்கள் மற்றும் commit செய்தி நடைமுறைகள்
  - சமுதாய ஈடுபாடு தொடர்பான தகவல்

#### முடிக்கப்பட்டவை
- **🎯 Workshop Module 7 (Wrap-up)**: முழுமையாக முடிக்கப்பட்ட முடிவுரை தொகுதி, இதில்:
  - பயிற்சி சாதனைகளின் விரிவான சுருக்கம்
  - AZD, டெம்ப்ளேட்கள், மற்றும் Microsoft Foundry க்கான முக்கிய கருத்துக்களை உள்ளடக்கிய பகுதி
  - கற்றல் பயணத்தை தொடர்கூடிய பரிந்துரைகள்
  - கஷ்ட நிலைகள் கொண்ட பயிற்சி சவால் பயிற்சிகள்
  - சமுதாய பின்னூட்டம் மற்றும் ஆதரவு இணைப்புகள்

- **📚 Workshop Module 3 (Deconstruct)**: கற்றல் நோக்கங்கள் புதுப்பிக்கப்பட்டவை, இதில்:
  - GitHub Copilot மற்றும் MCP சேவையகங்களை இயக்குவதற்கான வழிகாட்டுதல்
  - AZD டெம்ப்ளேட் கோப்புறை அமைப்பு புரிதல்
  - Infrastructure-as-code (Bicep) ஒழுங்கமைப்பு முறைபாடுகள்
  - கையால் செய்யும் லேப் வழிமுறைகள்

- **🔧 Workshop Module 6 (Teardown)**: கீழ்க்கண்டவையுடன் முடிக்கப்பட்டது:
  - வள சுத்தி மற்றும் செலவுக் கையாளுதல் நோக்கங்கள்
  - `azd down` மூலம் பாதுகாப்பான உட்கட்டமைப்பு அகற்ற kullanım
  - மென்மையாக (soft-deleted) அழிக்கப்பட்ட cognitive சேவைகள் மீட்புக்கான வழிகாட்டுதல்
  - GitHub Copilot மற்றும் Azure Portal க்கான கூடுதல் ஆராய்ச்சி தூண்டுகோல்கள்

#### சரி செய்யப்பட்டவை
- **🔗 உடைந்த இணைப்புகள் திருத்தம்**: 15+ உடைந்த உட்புற ஆவண இணைப்புகள் தீர்க்கப்பட்டன:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md க்கான பாதைகள் சரிசெய்யப்பட்டன
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md மற்றும் production-ai-practices.md பாதைகள் திருத்தப்பட்டன
  - `docs/getting-started/first-project.md`: இல்லை என்ற cicd-integration.md கோப்பை deployment-guide.md கொண்டு மாற்றப்பட்டது
  - `examples/retail-scenario.md`: FAQ மற்றும் troubleshooting வழிகாட்டி பாதைகள் சரிசெய்யப்பட்டன
  - `examples/container-app/microservices/README.md`: கcours e முகப்பு மற்றும் deployment guide பாதைகள் திருத்தப்பட்டன
  - `resources/faq.md` மற்றும் `resources/glossary.md`: AI அத்தியாய குறிப்புகள் புதுப்பிக்கப்பட்டன
  - `course-outline.md`: இன்ஸ்ட்ரக்டர் வழிகாட்டி மற்றும் AI பயிற்சி லேப் குறிப்புகள் சரி செய்யப்பட்டன

- **📅 Workshop Status Banner**: "Under Construction" இருந்து செயலில் உள்ள பயிற்சி நிலைக்காக 2026 பிப்ரவரி தேதி உடன் புதுப்பிக்கப்பட்டது

- **🔗 Workshop Navigation**: பயிற்சி README.md இல் lab-1-azd-basics என்ற இல்லாவிட்ட கோப்பகத்துக்கான உடைந்த வழிசெலுத்தல் இணைப்புகளை சரி செய்யப்பட்டன

#### மாற்றப்பட்டவை
- **Workshop Presentation**: "under construction" எச்சரிப்பை அகற்றி, பயிற்சி இப்போது முழுமையாகவும் பயன்படுத்த தயாராக உள்ளது
- **Navigation Consistency**: அனைத்து பயிற்சி தொகுதிகளுக்கும் சரியான இடை-தொகுதி வழிசெலுத்தல் உறுதி செய்யப்பட்டது
- **Learning Path References**: chapter இடையே microsoft-foundry பாதைகளுக்கு சரியான குறிப்பு புதுப்பிக்கப்பட்டது

#### சரிபார்க்கப்பட்டது
- ✅ அனைத்து ஆங்கில Markdown கோப்புகளிலும் செல்லுபடியான உட்புற இணைப்புகள் உள்ளன
- ✅ பயிற்சி தொகுதிகள் 0-7 கள் கற்றல் நோக்கங்களுடன் முழுமையாக உள்ளன
- ✅ அத்தியாயங்கள் மற்றும் தொகுதிகளுக்கிடையிலான வழிசெலுத்தல் சரியாக செயல்படுகிறது
- ✅ உள்ளடக்கம் Microsoft AZD பயன்படுத்தும் AI டெவலப்பர்களுக்கு பொருத்தமாக உள்ளது
- ✅ ஆரம்பநிலை பயனாளர்களுக்கு ஏற்ற மொழி மற்றும் அமைப்பு முழுவதுமாக பராமரிக்கப்பட்டது
- ✅ CONTRIBUTING.md சமுதாய பங்களிப்பு செய்பவர்களுக்கு தெளிவான வழிகாட்டலை வழங்குகிறது

#### தொழில்நுட்ப அமலாக்கம்
- **இணைப்பு சரிபார்ப்பு**: தானியங்கி PowerShell ஸ்கிரிப்ட் அனைத்து .md உட்புற இணைப்புகளையும் சரிபார்த்தது
- **உள்ளடக்க ஆடிட்**: பயிற்சி முழுமை மற்றும் ஆரம்பநிலை பொருத்தத்திற்கான கைமுறை பரிசீலனை
- **வழிசெலுத்தல் சிஸ்டம்**: ஒரே மாதிரியான அத்தியாய மற்றும் தொகுதி வழிசெலுத்தல் முறைபாடுகள் பயன்படுத்தப்பட்டன

#### குறிப்புகள்
- **வரம்பு**: மாற்றங்கள் ஆங்கில ஆவணங்களுக்கு மட்டுமே பொருந்தும்
- **Translations**: மொழிபெயர்ப்பு கோப்புறைகள் இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை (தானியங்கி மொழிபெயர்ப்பு பிறகு ஒத்திசைவு செய்யப்படும்)
- **Workshop Duration**: முழுமையான பயிற்சி இப்போது 3-4 மணிநேர கையால் செய்யும் கற்றலை வழங்குகிறது

---

### [v3.8.0] - 2025-11-19

#### மேம்படுத்தப்பட்ட ஆவணங்கள்: கண்காணிப்பு, பாதுகாப்பு மற்றும் பல-ஏஜென்ட் முறைபாடுகள்
**இந்த பதிப்பு Application Insights ஒருங்கிணைவு, அங்கீகாரம் முறைபாடுகள் மற்றும் உற்பத்தி ஒப்படைப்புகளுக்கான பல-ஏஜென்ட் ஒருங்கிணைவு பற்றி முழுமையான A-தர பாடங்களைச் சேர்க்கிறது.**

#### சேர்க்கப்பட்டவை
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-மையமாக்கப்பட்ட ஒப்படைப்பு மற்றும் தானியங்கி வழங்கலை கொண்ட அமைப்பு
  - Application Insights + Log Analytics க்கான முழுமையான Bicep டெம்ப்ளேட்கள்
  - தனிப்பயன் டெலிமெட்ரீ உடன் செயல்படும் Python பயன்பாடுகள் (1,200+ வரிசைகள்)
  - AI/LLM கண்காணிப்பு முறைபாடுகள் (Microsoft Foundry Models token/செலவு கண்காணிப்பு)
  - 6 Mermaid வரைபடங்கள் (வடிவமைப்பு, விநியோகப்பட்ட தடம், டெலிமெட்ரீ ஓட்டம்)
  - 3 கையால் செய்யும் பயிற்சிகள் (எச்சரிக்கைகள், டாஷ்போர்ட்கள், AI கண்காணிப்பு)
  - Kusto கேள்வி எடுத்துக்காட்டுகள் மற்றும் செலவு மேம்படுத்தல் ռազմநீதிகள்
  - நேரடி அளவுரு ஸ்ட்ரீமிங் மற்றும் நேரடி டீபக்கிங்
  - உற்பத்தி-தயார் முறைபாடுகளுடன் 40-50 நிமிடம் கற்றல் நேரம்

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 அங்கீகார முறைபாடுகள் (connection strings, Key Vault, managed identity)
  - பாதுகாப்பான ஒப்படைப்பு க்கான முழுமையான Bicep அடிக்கடி டெம்ப்ளேட்கள்
  - Azure SDK இணைவு கொண்ட Node.js செயலி கோடு
  - 3 முழுமையான பயிற்சிகள் (managed identity இயக்கு, user-assigned identity, Key Vault ரొட்டேஷன்)
  - பாதுகாப்பு சிறந்த நடைமுறைகள் மற்றும் RBAC கட்டமைப்புகள்
  - பிரச்சனை தீர்க்கும் வழிகாட்டி மற்றும் செலவு பகுப்பாய்வு
  - உற்பத்தி-தயார் கடவுச்சொல்லில்லா அங்கீகாரம் முறைபாடுகள்

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 ஒருங்கிணைவு முறைபாடுகள் (தொடர், சமமுறை, வரிசையியல், நிகழ்வு-நிர்ணய, ஒருமித்த முடிவு)
  - முழுமையான ஒ ர்கஸ்ட்ரேட்டர் சேவை அமலாக்கம் (Python/Flask, 1,500+ வரிசைகள்)
  - 3 சிறப்பு ஏஜெண்ட் அமலாக்கங்கள் (ஆராய்ச்சி, எழுத்தாளர், திருத்துநர்)
  - சन्दேச வரிசைப்படுத்தலுக்கான Service Bus இணைவு
  - விநியோகப்பட்ட அமைப்புகளுக்கான Cosmos DB நிலை மேலாண்மை
  - ஏஜெண்ட் தொடர்புகளை காட்டும் 6 Mermaid வரைபடங்கள்
  - 3 முன்னேற்றமான பயிற்சிகள் (timeout கையாளுதல், மறுஉத்தரவாதக் கொள்ளுறுதி, circuit breaker)
  - செலவு உடைவு ($240-565/மாதம்) மற்றும் ஆப்டிமைசேஷன் திட்டங்கள்
  - கண்காணிப்பிற்கு Application Insights ஒருங்கிணைவு

#### மேம்படுத்தப்பட்டது
- **Pre-deployment Chapter**: இப்போது விரிவான கண்காணிப்பு மற்றும் ஒருங்கிணைவு முறைபாடுகள் சேர்த்து உள்ளடக்கப்பட்டுள்ளது
- **Getting Started Chapter**: தொழில்முறை அங்கீகாரம் முறைபாடுகளுடன் மேம்படுத்தப்பட்டது
- **Production Readiness**: பாதுகாப்பு முதல் கண்காணிப்புவரை முழுமையான கவர்ச்சி
- **Course Outline**: அத்தியாயங்கள் 3 மற்றும் 6 இல் புதிய பாடங்களை தொடர்புபடுத்த புதுப்பிக்கப்பட்டது

#### மாற்றப்பட்டவை
- **Learning Progression**: படிக்கப்படும் பாதையில் பாதுகாப்பு மற்றும் கண்காணிப்பின் சிறந்த ஒருங்கிணைவு
- **Documentation Quality**: புதிய பாடங்களில் ஒரே மாதிரியான A-தர தரநிலைகள் (95-97%)
- **Production Patterns**: நிறுவனம் மட்டுமே பயன்படும் தேர்ச்சியான ஒப்படைப்பு முறைகளுக்கான முழுமையான தொடக்கம்-முடிவு கவர்ச்சி

#### மேம்பட்டவை
- **Developer Experience**: டெவலப்மெண்ட் முதல் உற்பத்தி கண்காணிப்புவரை தெளிவான பாதை
- **Security Standards**: அங்கீகாரம் மற்றும் ரகசியங்கள் மேலாண்மைக்கான தொழில்முறை முறைபாடுகள்
- **Observability**: AZD உடன் முழுமையான Application Insights இணைவு
- **AI Workloads**: Microsoft Foundry Models மற்றும் பல-ஏஜென்ட் அமைப்புகளுக்கான சிறப்பு கண்காணிப்பு

#### சரிபார்க்கப்பட்டது
- ✅ அனைத்து பாடங்களும் முழுமையான வேலை செய்யக்கூடிய கோடை (கோடு துணுக்குகள் அல்ல) உடன் உள்ளன
- ✅ காட்சி பயிற்றுக் வரைபடங்கள் (Mermaid) கற்றலுக்காய் உள்ளன (மொத்தம் 19)
- ✅ கையால் செய்யும் பயிற்சிகள் சோதனை படிக்கைகள் உடன் (மொத்தம் 9)
- ✅ `azd up` மூலம் орналுத்தக்கூடிய உற்பத்தி-தயார் Bicep டெம்ப்ளேட்கள்
- ✅ செலவு பகுப்பாய்வு மற்றும் ஆப்டிமைசேஷன் திட்டங்கள்
- ✅ பிரச்சனை தீர்க்கும் வழிகாட்டிகள் மற்றும் சிறந்த நடைமுறைகள்
- ✅ தகுதியானச் சோதனை புள்ளிகள் மற்றும் சரிபார்ப்பு கட்டளைகள்

#### ஆவண மதிப்பீட்டு முடிவுகள்
- **docs/pre-deployment/application-insights.md**: - விரிவான கண்காணிப்பு வழிகாட்டி
- **docs/getting-started/authsecurity.md**: - தொழில்முறை பாதுகாப்பு முறைபாடுகள்
- **docs/pre-deployment/coordination-patterns.md**: - மேம்பட்ட பல-ஏஜென்ட் கட்டமைப்புகள்
- **மொத்த புதிய உள்ளடக்கம்**: - ஒரே மாதிரியான உயர் தரச் தரநிலைகள்

#### தொழில்நுட்ப அமலாக்கம்
- **Application Insights**: Log Analytics + தனிப்பயன் டெலிமெட்ரீ + விநியோகப்பட்ட தடம்
- **Authentication**: Managed Identity + Key Vault + RBAC முறைபாடுகள்
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ஒர்கஸ்ட்ரேஷன்
- **Monitoring**: நேரடி அளவுருக்கள் + Kusto கேள்விகள் + எச்சரிக்கைகள் + டாஷ்போர்ட்கள்
- **Cost Management**: சாம்பிளிங் திட்டங்கள், ரெடின்ஷன் கொள்கைகள், பட்ஜெட் கட்டுப்பாடுகள்

### [v3.7.0] - 2025-11-19

#### ஆவணத் தரம் மேம்பாடு மற்றும் புதிய Microsoft Foundry Models உதாரணம்
**இந்த பதிப்பு ரெப்போ முழுவதிலும் ஆவணத் தரத்தை உயர்த்தி, gpt-4.1 அரட்டை இடைமுகத்துடன் ஒரு முழு Microsoft Foundry Models орналுத்தும் உதாரணத்தை சேர்க்கிறது.**

#### சேர்க்கப்பட்டவை
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` இல் முழுமையான gpt-4.1 орналுத்தல் மற்றும் செயற்பாட்டுடன்:
  - Microsoft Foundry Models அடிப்படை (gpt-4.1 மாடல் орналுத்தல்)
  - உரையாடல் வரலாற்றுடன் Python கமாண்டு-லைன் அரட்டை இடைமுகம்
  - பாதுகாப்பாக API விசைகளை சேமிக்க Key Vault இணைவு
  - டோக்கன் பயன்பாடு கண்காணிப்பு மற்றும் செலவு மதிப்பீடு
  - வரம்பு கட்டுப்பாடு மற்றும் பிழை கையாளுதல்
  - 35-45 நிமிடம் орналுத்தும் வழிகாட்டியுடன் விரிவான README
  - 11 உற்பத்தி-தயார் கோப்புகள் (Bicep டெம்ப்ளேட்கள், Python செயலி, கட்டமைப்பு)

- **📚 Documentation Exercises**: கட்டமைப்பு வழிகாட்டியில் கையால் செய்யக்கூடிய பயிற்சிகள் சேர்க்கப்பட்டன:
  - பயிற்சி 1: பல-சுற்றுச்சூழல் கட்டமைப்பு (15 நிமிடம்)
  - பயிற்சி 2: ரகசிய மேலாண்மை பயிற்சி (10 நிமிடம்)
  - தெளிவான வெற்றி критерியங்கள் மற்றும் சரிபார்ப்பு படிகள்

- **✅ Deployment Verification**: தளவமைப்பு வழிகாட்டியில் சரிபார்ப்பு பகுதி சேர்க்கப்பட்டது:
  - ஹெல்த் சரிபார்்ப்பு செயல்முறைகள்
  - வெற்றிக் க критியங்கள் அட்டவணை
  - அனைத்து ஒப்படைப்பு கட்டளைகளுக்கான எதிர்பார்க்கப்படும் வெளியீடுகள்
  - விரைவு பிரச்சனைத் தீர்க்கும் குறிப்புகள்

#### மேம்படுத்தப்பட்டது
- **examples/README.md**: A-தர தரத்திற்கு புதுப்பிக்கப்பட்டது (93%):
  - azure-openai-chat ஐ அனைத்து தொடர்புடைய பகுதிகளிலும் சேர்க்கப்பட்டது
  - உள்ளூர் எடுத்துக்காட்டு எண்ணிக்கை 3 லிருந்து 4 ஆக புதுப்பிக்கப்பட்டது
  - AI பயன்பாட்டு உதாரண அட்டவணையில் சேர்க்கப்பட்டது
  - Intermediate உபயோக சந்திக்கக்கூடிய விரைவுப் பிராரம்பத்தில் ஒருங்கிணைப்பு
  - Microsoft Foundry டெம்ப்ளேட்கள் பகுதிச்சேர்க்கை
  - ஒப்பீட்டு அட்டவணை மற்றும் தொழில்நுட்ப கண்டுபிடிப்பு பகுதிகள் புதுப்பிக்கப்பட்டன

- **ஆவணத் தரம்**: B+ (87%) → A- (92%) என்ற நிலைக்கு மேம்பாடு docs அடைவு முழுவதிலும்:
  - முக்கிய கட்டளை எடுத்துக்காட்டுகளுக்கு எதிர்பார்க்கப்படும் வெளியீடுகள் சேர்க்கப்பட்டன
  - அமைப்பு மாற்றங்களுக்கு சரிபார்ப்பு படிகள் இணைக்கப்பட்டன
  - விளக்கமான கையால் செய்யும் பயிற்சிகள் மூலம் கற்றல் மேம்பாடு

#### மாற்றப்பட்டவை
- **Learning Progression**: இடைநிலை கற்றுதலுக்கு AI உதாரணங்களை நல்லமுறையில் ஒருங்கிணைத்தல்
- **Documentation Structure**: தெளிவான முடிவுகளுடன் செயல்திறன் உயர்த்தப்பட்ட பயிற்சி நடவடிக்கைகள்
- **Verification Process**: முக்கிய வேலைசெயல்களில் தெளிவான வெற்றி критерியங்கள் சேர்த்தல்

#### மேம்பட்டவை
- **Developer Experience**: Microsoft Foundry Models орналுத்துதல் இப்போது 35-45 நிமிடம் (சிக்கலான மாற்று வழிகளுக்கு 60-90 நிமிடம் பதிலாக)
- **Cost Transparency**: Microsoft Foundry Models உதாரணத்திற்கான தெளிவான செலவு மதிப்பீடு ($50-200/மாதம்)
- **Learning Path**: azure-openai-chat மூலம் AI டெவலப்பர்களுக்கு தெளிவான தொடக்க பொது வழி
- **Documentation Standards**: முக்கிய பண்பாட்டுத் தகவல்களுக்கு எதிர்பார்க்கப்படும் வெளியீடுகள் மற்றும் சரிபார்ப்பு படிகள்

#### சரிபார்க்கப்பட்டது
- ✅ Microsoft Foundry Models உதாரணம் `azd up` மூலம் முழுமையாக செயல்படுகிறது
- ✅ அனைத்து 11 அமலாக்க கோப்புகளும் syntax-wise சரியானவை
- ✅ README அடுதல்கள் உண்மையான ஒப்படைப்பு அனுபவத்திற்கு பொருந்தும்
- ✅ ஆவண இணைப்புகள் 8+ இடங்களில் புதுப்பிக்கப்பட்டன
- ✅ எடுத்துக்காட்டு குறியீடு உள்ளூர் எடுத்துக்காட்டு எண்ணிக்கையை 4 ஆக சரிபார்க்கிறது
- ✅ அட்டவணைகளில் எந்தவொரு வெளிநாட்டு இணைப்புகளின் நகல்களும் இல்லை
- ✅ அனைத்து வழிசெலுத்தல் குறிப்புகளும் சரியானவை

#### தொழில்நுட்ப அமலாக்கம்
- **Microsoft Foundry Models கட்டமைப்பு**: gpt-4.1 + Key Vault + Container Apps மாதிரி
- **பாதுகாப்பு**: Managed Identity தயாராகவும், ரகசியங்கள் Key Vault இல்
- **கண்காணிப்பு**: Application Insights ஒருங்கிணைவு
- **செலவு மேலாண்மை**: டோக்கன் கண்காணிப்பு மற்றும் பயன்பாடு மேம்படுத்தல்
- **ஒப்படைப்பு**: ஒரே `azd up` கட்டளையால் முழு அமைப்பு

### [v3.6.0] - 2025-11-19

#### முக்கிய புதுப்பிப்பு: Container App ஒப்படைப்பு உதாரணங்கள்
**இந்த பதிப்பு Azure Developer CLI (AZD) பயன்படுத்தி உள்ளூர், உற்பத்தி-தயார் container பயன்பாடு ஒப்படைப்பு உதாரணங்களை அறிமுகப்படுத்துகிறது, முழுமையான ஆவணமும் கற்றல் பாதையில் ஒருங்கிணைப்பு உடன்.**

#### சேர்க்கப்பட்டவை
- **🚀 Container App Examples**: புதிய உள்ளூர் எடுத்துக்காட்டுகள் `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): container செய்யப்பட்ட ஒப்படைப்புகளுக்கான முழுமையான அட்டவணை, விரைவு தொடக்கம், உற்பத்தி மற்றும் மேம்பட்ட முறைபாடுகள்
  - [Simple Flask API](../../examples/container-app/simple-flask-api): ஆரம்பநிலை பயனர்களுக்கான REST API உடன் scale-to-zero, ஹெல்த் ப்ரோப்ஸ், கண்காணிப்பு மற்றும் பிரச்சனை தீர்ப்பு
  - [Microservices Architecture](../../examples/container-app/microservices): உற்பத்தி-தயார் பல்சேவை ஒப்படைப்பு (API Gateway, Product, Order, User, Notification), அசிங்க் மெசேஜிங், Service Bus, Cosmos DB, Azure SQL, விநியோகப்பட்ட தடம், blue-green/canary ஒப்படைப்பு
- **சிறந்த நடைமுறைகள்**: பாதுகாப்பு, கண்காணிப்பு, செலவு மேம்படுத்தல், மற்றும் CI/CD வழிகாட்டுதல் container வேலைமேல்களுக்காக
- **கோடு எடுத்துக்காட்டுகள்**: முழுமையான `azure.yaml`, Bicep டெம்ப்ளேட்கள், மற்றும் பல மொழி சேவை அமலாக்கங்கள் (Python, Node.js, C#, Go)
- **சோதனை & பிரச்சனை தீர்ப்பு**: தொடக்க-முடிவு சோதனை நிலை, கண்காணிப்பு கட்டளைகள், பிரச்சனை தீர்க்கும் வழிகாட்டிகள்

#### மாற்றப்பட்டவை
- **README.md**: "Local Examples - Container Applications" என்பதில் புதிய container செயலி உதாரணங்களை இணைக்கவும், காட்டவும் புதுப்பிக்கப்பட்டது
- **examples/README.md**: container செயலி உதாரணங்களை சிறப்பிக்கவும், ஒப்பிட்டல் மாட்ரிக்ஸ் பகுதியை சேர்க்கவும் மற்றும் தொழில்நுட்ப/கட்டமைப்பு குறிப்பு புதுப்பிக்கப்பட்டது
- **Course Outline & Study Guide**: தொடர்புடைய அத்தியாயங்களில் புதிய container செயலி உதாரணங்கள் மற்றும் இடமாற்று மாதிரிகள் குறித்த குறிப்பிடுதல்களுக்கு புதுப்பிக்கப்பட்டது

#### Validated
- ✅ அனைத்து புதிய உதாரணங்களும் `azd up` மூலம் பதிவேற்றக்கூடியவை மற்றும் சிறந்த நடைமுறைகளை பின்பற்றுகின்றன
- ✅ தகவல்தள இணைப்புகள் மற்றும் வழிசெலுத்தல் புதுப்பிக்கப்பட்டது
- ✅ உதாரணங்கள் ஆரம்பநிலை முதல் மேம்பட்ட நிலை வரை, உற்பத்தி மைக்ரோசர்வீசுகளை உள்ளடக்கியதாக உள்ளன

#### Notes
- **Scope**: ஆங்கில ஆவணங்கள் மற்றும் உதாரணங்கள் மட்டுமே
- **Next Steps**: எதிர்கால வெளியீடுகளில் மேலதிக மேம்பட்ட container மாதிரிகள் மற்றும் CI/CD தானியங்க தொடர் செய்யல்களை விரிவாக்குதல்

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**இந்த பதிப்பில் ஆங்கில ஆவணங்கள் முழுவதிலும் "Microsoft Foundry" என்ற தயாரிப்பு பெயரில் பரந்த அளவிலான மாற்றம் செயல்படுத்தப்பட்டுள்ளது, இது Microsoft இன் அதிகாரப்பூர்வ மறுபெயர்ப்பை பிரதிபலிக்கின்றது.**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" என்ற தயாரிப்பு பெயரில் முழுமையான மறுபெயர்ப்பு
  - `docs/` கோப்புறை உள்ள ஆங்கில ஆவணங்களில் அனைத்து குறிப்புகளும் புதுப்பிக்கப்பட்டன
  - கோப்புறை மறுபெயர்ப்பு: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - கோப்பு மறுபெயர்ப்பு: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - மொத்தம்: 7 ஆவண கோப்புகளில் 23 உள்ளடக்க குறிப்புகள் புதுப்பிக்கப்பட்டன

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` என்பதை `docs/microsoft-foundry/` என மறுபெயர்த்தது
  - புதிய கோப்புறை கட்டமைப்பை பிரதிபலிக்க அனைத்து குறுக்குபரிச.reference கள் புதுப்பிக்கப்பட்டன
  - அனைத்து ஆவணங்களில் வழிசெலுத்தல் இணைப்புகள் சரிபார்க்கப்பட்டன

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - புதிய கோப்பு பெயரைக் குறிக்கும் அனைத்து உள்ளக இணைப்புகளும் புதுப்பிக்கப்பட்டன

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 வழிசெலுத்தல் இணைப்பு புதுப்பிப்புகள்
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 தயாரிப்பு பெயர் குறிப்பிடல்களுக்கு புதுப்பிப்புகள்
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ஏற்கனவே Microsoft Foundry பயன்படுத்தப்பட்டு உள்ளது (முன்னைய புதுப்பிப்புகளிலிருந்து)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 குறிப்புகள் புதுப்பிக்கப்பட்டன (முழுமை, சமூக பின்னூட்டம், ஆவணங்கள்)
  - `docs/getting-started/azd-basics.md` - 4 குறுக்குபரிச.reference இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/getting-started/first-project.md` - 2 அத்தியாய வழிசெலுத்தல் இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/getting-started/installation.md` - 2 அடுத்த அத்தியாய இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 குறிப்புகள் புதுப்பிக்கப்பட்டன (வழிசெலுத்தல், Discord சமூகம்)
  - `docs/troubleshooting/common-issues.md` - 1 வழிசெலுத்தல் இணைப்பு புதுப்பிக்கப்பட்டது
  - `docs/troubleshooting/debugging.md` - 1 வழிசெலுத்தல் இணைப்பு புதுப்பிக்கப்பட்டது

- **Course Structure Files** (2 files):
  - `README.md` - 17 குறிப்புகள் புதுப்பிக்கப்பட்டன (கோഴ்ஸ் கண்ணோட்டம், அத்தியாய தலைப்புகள், வார்ப்புருக்கள் பகுதி, சமூக洞察ங்கள்)
  - `course-outline.md` - 14 குறிப்புகள் புதுப்பிக்கப்பட்டன (கண்ணோட்டம், கற்றல்திறன் நோக்குகள், அத்தியாய வளங்கள்)

#### Validated
- ✅ ஆங்கில ஆவணங்களில் "ai-foundry" கோப்புறை பாதை குறிப்புகள் எதுவும் மீதமில்லை
- ✅ ஆங்கில ஆவணங்களில் "Microsoft Foundry" தயாரிப்பு பெயரின் மீதமுள்ள குறிப்புகளும் இல்லை
- ✅ புதிய கோப்புறை கட்டமைப்புடன் அனைத்து வழிசெலுத்தல் இணைப்புகளும் வேலை செய்கின்றன
- ✅ கோப்பு மற்றும் கோப்புறை மறுபெயர்ப்புகள் வெற்றிகரமாக முடிக்கப்பட்டன
- ✅ அத்தியாயங்களுக்கிடையேயான குறுக்குபரிச.reference கள் சரிபார்க்கப்பட்டன

#### Notes
- **Scope**: மாற்றங்கள் `docs/` கோப்புறையிலுள்ள ஆங்கில ஆவணங்களுக்கு மட்டுமே பொருப்படுகிறது
- **Translations**: மொழிபெயர்ப்பு கோப்புறைகள் (`translations/`) இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை
- **Workshop**: பணியகமானப் பொருட்கள் (`workshop/`) இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை
- **Examples**: உதாரணக் கோப்புகள் இன்னும் பழைய பெயர்த் குறிப்புகளை கொண்டிருக்கலாம் (இதை எதிர்காலப் புதுப்பிப்பில் கையாளப்படும்)
- **External Links**: வெளிப்புற URL கள் மற்றும் GitHub நிரல்仓库 குறிப்புகள் மாற்றமின்றி உள்ளன

#### Migration Guide for Contributors
உங்களிடம் உள்ள உள்ளூர் கிளைகளுக்கு அல்லது பழைய கட்டமைப்பைக் குறிக்கும் ஆவணங்களுக்கு:
1. கோப்புறை குறிப்புகளை புதுப்பிக்கவும்: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. கோப்பு குறிப்புகளை புதுப்பிக்கவும்: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. தயாரிப்பு பெயரை மாற்றவும்: "Microsoft Foundry" → "Microsoft Foundry"
4. அனைத்து உள்ளக ஆவண இணைப்புகளும் இன்னும் வேலை செய்கிறதா என சரிபார்க்கவும்

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**இந்த பதிப்பு புதிய Azure Developer CLI முன்னோட்ட (preview) அம்சத்திற்கு முழுமையான ஆதரவு மற்றும் பணிமொழி பயனர் அனுபவத்தை மேம்படுத்துகிறது.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: புதிய பரிசோதனை முன்னோட்ட வசதியின் விரிவான விளக்கம்
  - உட்பட கட்டளை குறிப்புகள் மற்றும் உதாரண பயன்பாடுகள் சீட்-ஷீட்டில்
  - பயன்பாட்டு வழிகாட்டியலில் சிக்கலற்ற ஒருங்கிணைப்பு, பயன்பாடுகள் மற்றும் பயன்கள்
  - பாதுகாப்பான பதிவேற்ற சரிபார்ப்புக்கான முன்-பயிற்சி சோதனை ஒருங்கிணைப்பு
  - பாதுகாப்பு-முதலான பராமரிப்புகளுடன் தொடக்கக் கையேடு புதுப்பிப்புகள்
- **🚧 Workshop Status Banner**: பணிமொழி வளர்ச்சி நிலையை குறிக்கும் தொழில்முறை HTML பேனர்
  - தொடக்கக் குறிக்கோள்களுடன் கூடிய கிரேடியன்ட் வடிவமைப்பு தெளிவான பயனர் தகவலுக்காக
  - தெளிவுரைக்கும் கடைசித் தேர்வு தேதி தகுதிசெய்தல்
  - அனைத்து சாதனங்களுக்கும் பொருந்தும் மொபைல்-பதில் வடிவமைப்பு

#### Enhanced
- **Infrastructure Safety**: முன்னோட்ட செயல்பாட்டை முழு பதிவேற்ற ஆவணங்களில் ஒருங்கிணைத்தல்
- **Pre-deployment Validation**: தானியங்கி ஸ்கிரிப்ட்கள் இப்போது கட்டமைப்பு முன்னோட்ட சோதனையை உட்படுத்துகின்றன
- **Developer Workflow**: முன்னோட்டத்தை சிறந்த நடைமுறை எனக் கொண்ட கட்டளை வரிசைகள் புதுப்பிக்கப்பட்டன
- **Workshop Experience**: உள்ளடக்க வளர்ச்சி நிலைக்கு பயனாளர்களுக்கு தெளிவான எதிர்பார்ப்புகள் அமைக்கப்பட்டன

#### Changed
- **Deployment Best Practices**: முன்னோட்ட-முதலில் பணிமுறை தற்போது பரிந்துரைக்கப்படும் அணுகுமுறை
- **Documentation Flow**: கட்டமைப்பு சரிபார்ப்பு கற்றல் அமைப்பில் முன்னதாக மாற்றப்பட்டது
- **Workshop Presentation**: தெளிவான வளர்ச்சி காலவரிசையுடன் தொழில்முறை நிலை தொடர்பு

#### Improved
- **Safety-First Approach**: கட்டமைப்பு மாற்றங்களைப் பதிவேற்றுவதற்கு முன் சரிபார்க்கலாம்
- **Team Collaboration**: முன்னோட்ட முடிவுகள் விமர்சனத்திற்கும் ஒப்புதலுக்கு பகிரப்படலாம்
- **Cost Awareness**: வழங்கல் முன் வளக் கட்டணங்கள் பற்றிய சிறந்த புரிதல்
- **Risk Mitigation**: முன் சரிபார்ப்பின் மூலம் பதிவேற்ற தோல்விகள் குறைவடையும்

#### Technical Implementation
- **Multi-document Integration**: முன்னோட்ட அம்சம் 4 முக்கிய கோப்புகளில் ஆவணப்படுத்தப்பட்டது
- **Command Patterns**: ஆவணமெளியில் ஒரே மாதிரியான வரிச்சேவை மற்றும் உதாரணங்கள்
- **Best Practice Integration**: சரிபார்த்தல் வேலைப்பாடுகளில் முன்னோட்டம் இணைக்கப்பட்டது
- **Visual Indicators**: கண்டறிவுக்காக தெளிவான NEW அம்ச குறிகள்

#### Workshop Infrastructure
- **Status Communication**: கிரேடியன்ட் ஸ்டைலிங் கொண்ட தொழில்முறை HTML பேனர்
- **User Experience**: தெளிவான வளர்ச்சி நிலை பயனாளர்களில் குழப்பத்தைத் தடுக்கும்
- **Professional Presentation**: எதிர்பார்ப்புகளை அமைத்துக் கொண்ட Repository நம்பகத்தன்மையை பராமரிக்கிறது
- **Timeline Transparency**: பொறுப்பு வெளிப்படுத்த October 2025 என்ற கடைசித் தேதிசெய்தல்

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**இந்த பதிப்பு உலாவியில் இயங்கும் இடைமுக வழிகாட்டிகள் மற்றும் கட்டமைக்கப்பட்ட கற்றல் பாதைகளுடன் முழுமையான வேலைநிறுவனைப் பொருட்களை அறிமுகப்படுத்துகிறது.**

#### Added
- **🎥 Interactive Workshop Guide**: MkDocs முன்னோட்ட திறனுடன் உலாவி அடிப்படையிலான பணிமனை அனுபவம்
- **📝 Structured Workshop Instructions**: கண்டுபிடிப்பிலிருந்து தனிப்பயனாக்கம் வரை 7 படி வழிகாட்டப்பட்டது
  - 0-Introduction: பணிமடை கண்ணோட்டம் மற்றும் அமைப்பு
  - 1-Select-AI-Template: வார்ப்புரு கண்டறிதல் மற்றும் தேர்வு செயல்முறை
  - 2-Validate-AI-Template: பதிவேற்றம் மற்றும் சரிபார்ப்பு செயல்முறை
  - 3-Deconstruct-AI-Template: வார்ப்புரு கட்டமைப்பைப் புரிந்துகொள்ளுதல்
  - 4-Configure-AI-Template: உள்ளமைவு மற்றும் தனிப்பயனாக்கம்
  - 5-Customize-AI-Template: மேம்பட்ட மாற்றங்கள் மற்றும் தொகுப்புகள்
  - 6-Teardown-Infrastructure: சுத்தம் செய்தல் மற்றும் வள மேலாண்மை
  - 7-Wrap-up: சுருக்கம் மற்றும் அடுத்த படிகள்
- **🛠️ Workshop Tooling**: மேம்படுத்தப்பட்ட கற்றல் அனுபவத்திற்கான Material தீம் உடன் MkDocs அமைப்பு
- **🎯 Hands-On Learning Path**: 3 படி முறை (கண்டறிதல் → பதிவேற்றம் → தனிப்பயனாக்கம்)
- **📱 GitHub Codespaces Integration**: குறுக்கீடு இல்லாத வளர்ச்சி சூழலமைப்பு அமைப்பு

#### Enhanced
- **AI Workshop Lab**: 2-3 மணி நேர கட்டமைக்கப்பட்ட கற்றல் அனுபவத்துடன் விரிவாக்கப்பட்டது
- **Workshop Documentation**: வழிசெலுத்தல் மற்றும் காட்சியியல் உதவிகளுடன் தொழில்முறை முறையில் வழங்கப்பட்டது
- **Learning Progression**: வார்ப்புரு தேர்வு முதல் உற்பத்தி பதிவேற்றம் வரை தெளிவான படி-படி வழிகாட்டல்
- **Developer Experience**: ஒருங்கிணைக்கப்பட்ட கருவிகள் மூலம் மென்மையான வளர்ச்சி வேலைநிரல்கள்

#### Improved
- **Accessibility**: தேடல், நகலெடுக்குதல் செயல்பு மற்றும் தீம் மாற்றத்துடன் உலாவி அடிப்படையிலான இடைமுகம்
- **Self-Paced Learning**: வெவ்வேறு கற்றல் வேகங்களுக்கு ஏற்ப அமைக்கக்கூடிய தானாக கற்றல் அமைப்பு
- **Practical Application**: உண்மையான உலக AI வார்ப்புரு பதிவேற்றக் காலாம்சங்களுடன் பயிற்சி நடத்திய பாடங்கள்
- **Community Integration**: பணிமடை ஆதரவு மற்றும் ஒத்துழைப்பு కోసం Discord இணைப்பு

#### Workshop Features
- **Built-in Search**: உள்ளடக்க வார்த்தை மற்றும் பாட கண்டுபிடிப்புக்கு விரைவான தேடல்
- **Copy Code Blocks**: அனைத்து குறியீட்டு உதாரணங்களுக்கும் ஹோவர்-இல் நகலெடுக்கும் செயல்பாடு
- **Theme Toggle**: வெள்ளை/இறம் தீம் மாற்றத்திற்கு ஆதரவு
- **Visual Assets**: மேம்பட்ட புரிதலுக்கான ஸ்கிரீன்ஷாட்கள் மற்றும் வடிவமைப்புக்கள்
- **Help Integration**: சமுதாய ஆதரக்காக நேரடி Discord அணுகல்

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**இந்த பதிப்பு முழ repository என்பதையும் மறுசீரமைத்து எட்டுஅத்தியாய முன்னேற்ற கற்றல் கட்டமைப்புடன் கூடிய விரிவான வழிசெலுத்தலை அறிமுகப்படுத்துகிறது.**

#### Added
- **📚 Chapter-Based Learning System**: முழு பாடத்திட்டத்தை 8 முன்னேறி கற்றல் அத்தியாயங்களாக மறுசீரமைத்தது
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: அனைத்து ஆவணங்களிலும் ஒரே மாதிரியாக வழிசெலுத்தல் தலைப்புகள் மற்றும் காலடி பகுதிகள்
- **🎯 Progress Tracking**: பாடநெறி முடிப்புக் சரிபார்ப்பு பட்டியல் மற்றும் கற்றல் சரிபார்க்கும் அமைப்பு
- **🗺️ Learning Path Guidance**: வேறுபட்ட அனுபவ மட்டங்களுக்கு மற்றும் இலக்குகளுக்கான தெளிவான நுழைவாயில்
- **🔗 Cross-Reference Navigation**: தொடர்புடைய அத்தியாயங்கள் மற்றும் முன்னோக்கிகளுக்கு தெளிவான இணைப்புகள்

#### Enhanced
- **README Structure**: அத்தியாய அடிப்படையிலான அமைப்புடன் கட்டமைக்கப்பட்ட கற்றல் மாற்றமாக மாறியுள்ளது
- **Documentation Navigation**: இப்போது ஒவ்வொரு பக்கத்திலும் அத்தியாயக் குறிப்பும் முன்னேற்ற வழிகாட்டலும் இடம்பெறும்
- **Template Organization**: உதாரணங்கள் மற்றும் வார்ப்புருக்கள் பொருத்தமான கற்றல் அத்தியாயங்களுடன் பொருத்தப்பட்டன
- **Resource Integration**: சீட்-ஷீடுகள், அடிக்கடி கேட்கப்படும் கேள்விகள் மற்றும் படிப்புக் கையேடுகள் தொடர்புடைய அத்தியாயங்களுக்கு இணைக்கப்பட்டன
- **Workshop Integration**: கைமுறை ஆய்வகங்கள் பல அத்தியாய கற்றல் குறிக்கோள்களுக்கு மையமாக பொறுத்தப்பட்டன

#### Changed
- **Learning Progression**: வரிசைப்படுத்தப்பட்ட ஆவணத்திலிருந்து நெகிழ்வான அத்தியாய அடிப்படையிலான கற்றலுக்கு மாற்றம்
- **Configuration Placement**: சிறந்த கற்றல் ஓட்டத்திற்கு Configuration கையேடு Chapter 3 ஆக மாற்றம்
- **AI Content Integration**: கற்றல் பயணத்தின் முழுவதும் AI-சப்ளிக்கன்கள் சிறப்பாக ஒருங்கிணைக்கப்பட்டன
- **Production Content**: முன்னணி தொழிற்சாலை மாதிரிகள் Chapter 8 இல் ஒன்றிணைக்கப்பட்டன

#### Improved
- **User Experience**: தெளிவான வழிசெலுத்தல் breadcrumbs மற்றும் அத்தியாய முன்னேற்றக்குறிப்புகள்
- **Accessibility**: எளிதில் பயணம் செய்யக் கூடிய ஒரே மாதிரிப் பக்க அமைப்புகள்
- **Professional Presentation**: கல்வி மற்றும் நிறுவன பயிற்சி பொருத்தமான பல்கலைக்கழக முறைப்பாடு வடிவமைப்பு
- **Learning Efficiency**: மேம்பட்ட அமைப்பின் மூலம் சம்பந்தப்பட்ட உள்ளடக்கத்தை தேடுவதில் குறைந்த நேரம்

#### Technical Implementation
- **Navigation Headers**: 40+ ஆவண கோப்புகளில் நிலைத்த அத்தியாய வழிசெலுத்தல் தலைப்புகள்
- **Footer Navigation**: முன்னேற்ற வழிகாட்டலும் அத்தியாய முடிக்கும் குறியீடுகள்
- **Cross-Linking**: தொடர்புடைய கருத்துக்களை இணைக்கும் பரந்த உள்ளக இணைப்பு அமைப்பு
- **Chapter Mapping**: வார்ப்புருக்கள் மற்றும் உதாரணங்கள் கற்றல் நோக்கங்களுடன் தெளிவாக பொருத்தப்பட்டன

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8 அத்தியாய அமைப்புடன் ஒத்துப்போகும் படி படிப்புக் கையேடு மறுசீரமைக்கப்பட்டது
- **🎯 Chapter-Based Assessment**: ஒவ்வொரு அத்தியாயத்திலும் குறிப்பிட்ட கற்றல் நோக்கங்கள் மற்றும் நடைமுறை பயிற்சிகள் உள்ளன
- **📋 Progress Tracking**: அளவும் முடிவுக் கணக்கீட்டுடன் வாராந்திர கற்றல் அட்டவணை
- **❓ Assessment Questions**: ஒவ்வொரு அத்தியாயத்திற்கும் அறிவு சரிபார்ப்பு கேள்விகள் மற்றும் தொழில்முறை முடிவுகள்
- **🛠️ Practical Exercises**: உண்மையான பதிவேற்ற சூழ்நிலைகளுடன் கைமுறை செயல்பாடுகள் மற்றும் சிக்கல் நீக்க பயிற்சிகள்
- **📊 Skill Progression**: அடிப்படை தத்துவங்களிலிருந்து நிறுவன மாதிரிகளுக்கு தெளிவான முன்னேற்றம் மற்றும் தொழில்முறை வளர்ச்சி கவனம்
- **🎓 Certification Framework**: தொழில் வளர்ச்சிக்கான முடிவுகள் மற்றும் சமூக ஒப்புதல் அமைப்பு
- **⏱️ Timeline Management**: மைல்கல்லறை சரிபார்ப்பு உடன் அமைந்திருக்கும் 10-வாரத்துக்கான கட்டமைக்கப்பட்ட திட்டம்

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**இந்த பதிப்பு மொத்தமாக பல்-ஏஜன்ட் சில்லறை தீர்வை மேம்படுத்தி, ஏஜன்ட் பெயரிடல் மற்றும் ஆவணங்களுக்கு நிறுத்தமான மேம்பாடுகளை கொண்டுள்ளது.**

#### Changed
- **Multi-Agent Terminology**: retail multi-agent தீர்வில் "Cora agent" என்பதை தெளிவான புரிதலுக்காக "Customer agent" என மாற்றியது
- **Agent Architecture**: "Customer agent" என்ற பெயரிடலுடன் அனைத்து ஆவணங்கள், ARM வார்ப்புருக்கள் மற்றும் குறியீட்டு உதாரணங்கள் புதுப்பிக்கப்பட்டன
- **Configuration Examples**: புதுப்பிக்கப்பட்ட பெயரிடல் வழிமுறைகளுடன் அழகுபடுத்தப்பட்ட ஏஜன்ட் கட்டமைப்பு எடுத்துக்காட்டு
- **Documentation Consistency**: எல்லா குறிப்புகளிலும் தொழில்முறை மற்றும் விளக்கமான ஏஜன்ட் பெயர்கள் பயன்பாட்டில் உறுதிசெய்து வைக்கப்பட்டது

#### Enhanced
- **ARM டெம்ப்ளேட் பாக்கேஜ்**: retail-multiagent-arm-template இல் Customer agent குறிக்கோள்களுடன் புதுப்பிக்கப்பட்டது
- **Architecture Diagrams**: புதுப்பிக்கப்பட்ட agent பெயரிடலுடன் Mermaid வரைபடங்கள் புதுப்பிக்கப்பட்டன
- **Code Examples**: Python வகுப்புகள் மற்றும் அமலாக்க உதாரணங்கள் இப்போது CustomerAgent பெயரிடலைப் பயன்படுத்துகின்றன
- **Environment Variables**: அனைத்து டெபிளாய்மென்ட் ஸ்கிரிப்ட்களும் CUSTOMER_AGENT_NAME கான்வென்ஷன்களைப் பயன்படுத்துவதற்காக புதுப்பிக்கப்பட்டன

#### மேம்பட்டவை
- **Developer Experience**: ஆவணத்தில் ஏஜென்ட் பாத்திரங்கள் மற்றும் பொறுப்புகள் தெளிவாகக் குறிப்பிடப்பட்டுள்ளன
- **Production Readiness**: நிறுவன பெயரிடும் வழிமுறைகளுடன் சிறந்த ஒழுங்கமைப்பு
- **Learning Materials**: கல்வித் தேவைகளுக்காக இன்னும் தெளிவான ஏஜென்ட் பெயரிடல்
- **Template Usability**: ஏஜென்ட் செயல்பாடுகள் மற்றும் டெபிளாய்மென்ட் மாதிரிகளை புரிந்துகொள்ள எளிதாக்கப்பட்டது

#### தொழில்நுட்ப விவரங்கள்
- CustomerAgent குறிக்கோள்களுடன் Mermaid கட்டமைப்பு வரைபடங்கள் புதுப்பிக்கப்பட்டன
- Python உதாரணங்களில் CoraAgent வகுப்பு பெயர்களை CustomerAgent ஆக மாற்றியது
- ARM template JSON கட்டமைப்புகளை "customer" agent வகையைப் பயன்படுத்த하도록 மாற்றியது
- சுற்றுச் சூழல் மாறில்களை CORA_AGENT_* இருந்து CUSTOMER_AGENT_* மாதிரிகளுக்கு புதுப்பித்தது
- அனைத்து டெபிளாய்மென்ட் கட்டளைகளும் மற்றும் கன்டெய்னர் கட்டமைப்புகளும் புதுப்பிக்கப்பட்டன

### [v3.0.0] - 2025-09-12

#### முக்கிய மாற்றங்கள் - AI டெவலப்பர் மையம் மற்றும் Microsoft Foundry ஒருங்கிணைப்பு
**இந்த பதிப்பு Microsoft Foundry ஒருங்கிணைப்புடன் கூடிய விரிவான AI-மையமான கற்றல் வளமாக ரெப்பொசிடரியை மாற்றுகிறது.**

#### சேர்க்கப்பட்டது
- **🤖 AI-First Learning Path**: AI டெவலப்பர்களையும் இன்ஜினியர்களையும் முன்னுரிமை விடுக்கும் முறையில் முழுமையான மறுசீரமைப்பு
- **Microsoft Foundry Integration Guide**: AZD ஐ Microsoft Foundry சேவைகளுடன் இணைப்பதற்கான விரிவான ஆவணங்கள்
- **AI Model Deployment Patterns**: மாடல் தேர்வு, கட்டமைப்பு மற்றும் உற்பத்தி டெபிளாய்மென்ட் யுக்திகளை உள்ளடக்கிய விரிவான கையேடு
- **AI Workshop Lab**: AI செயலிகளை AZD-டெபிளாய்அபிள் தீர்வு ஆக மாற்றுவதற்கான 2-3 மணி நேர கைமுறை பணியகம்
- **Production AI Best Practices**: AI வேலைப்பளுக்களை அளவிடுதல், கண்காணித்தல் மற்றும் பாதுகாப்பு செய்வதற்கான நிறுவனம்-தயார் மாதிரிகள்
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services மற்றும் AI டெபிளாய்மென்ட் பிரச்சினைகளுக்கான முழுமையான ட்ரபிள்ஷூட்டிங் வழிகாட்டி
- **AI Template Gallery**: சிக்கல் ரேட்டிங்குகளுடன் Microsoft Foundry டெம்ப்ளேடுகளின் சிறப்பு சேகரிப்பு
- **Workshop Materials**: கைமுறை பணியகங்கள் மற்றும் குறிப்பு பொருட்களுடன் முழுமையான பணியக அமைப்பு

#### மேம்படுத்தப்பட்டது
- **README Structure**: Microsoft Foundry Discord இல் இருந்து 45% சமூக ஆர்வத் தரவு கொண்ட AI-டெவலப்பர் மையமான அமைப்பு
- **Learning Paths**: மாணவர்கள் மற்றும் DevOps இன்ஜினியர்களுக்கான பாரம்பரிய பாதைகளுடன் இணைந்த தனிப்பயன் AI டெவலப்பர் பயணம்
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, மற்றும் openai-chat-app-quickstart உட்பட சிறப்பு AI டெம்ப்ளேடுகள்
- **Community Integration**: AI-ப்ரயோகத்திற்கான சேனல்கள் மற்றும் விவாதங்களுடன் மேம்படுத்தப்பட்ட Discord சமூக ஆதரவு

#### பாதுகாப்பு & உற்பத்தி கவனம்
- **Managed Identity Patterns**: AI-சார்ந்த அங்கீகாரம் மற்றும் பாதுகாப்பு கட்டமைப்புகள்
- **Cost Optimization**: AI பணித் தொடக்கங்களுக்கு டோக்கன் பயன்பாடு கண்காணிப்பு மற்றும் பட்ஜெட் கட்டுப்பாடுகள்
- **Multi-Region Deployment**: உலகளாவிய AI பயன்பாட்டிற்கான டெபிளாய்மென்ட் யுக்திகள்
- **Performance Monitoring**: AI-சார்ந்த அளவுருக்கள் மற்றும் Application Insights ஒருங்கிணைப்பு

#### ஆவண தரம்
- **Linear Course Structure**: தொடக்கம் முதல் மேம்பட்ட AI டெபிளாய்மென்ட் மாதிரிகள் வரை தர்க்கபூர்வமான முன்னேற்றம்
- **Validated URLs**: அனைத்து வெளிப்புற ரெப்பொசிட்டரி இணைப்புகளும் சரிபார்க்கப்பட்டு அணுகக்கூடியவையாக உள்ளன
- **Complete Reference**: அனைத்து உள்ளக ஆவண இணைப்புகளும் சரிபார்க்கப்பட்டு செயல்படும்
- **Production Ready**: உண்மை உலக உதாரணங்களுடன் நிறுவனத்திற்குத் தயார் டெபிளாய்மென்ட் மாதிரிகள்

### [v2.0.0] - 2025-09-09

#### முக்கிய மாற்றங்கள் - ரெப்பொசிடரி மறுசீரமைப்பு மற்றும் தொழில் முன்னேற்றம்
**இந்த பதிப்பு ரெப்பொசிடரியின் அமைப்பு மற்றும் உள்ளடக்க கொள்கைகளை மிகுந்த அளவில் மறுசீரமைக்கிறது.**

#### சேர்க்கப்பட்டது
- **Structured Learning Framework**: அனைத்து ஆவணப் பக்கங்களும் தற்போது அறிமுகம், கற்றல் இலக்குகள் மற்றும் கற்றலின் முடிவுகள் பிரிவுகளை கொண்டுள்ளது
- **Navigation System**: அனைத்து ஆவணங்களிலும் முன்னைய/அடுத்த பாட இணைப்புகள் சேர்க்கப்பட்டன
- **Study Guide**: study-guide.md உடன் கற்றல் இலக்குகள், பயிற்சி பயிற்சிகள் மற்றும் மதிப்பீட்டு பொருட்கள் கொண்ட விரிவான study guide
- **Professional Presentation**: மேம்பட்ட அணுகல்திறனிற்காக அனைத்து எமோஜி ஐகான்களும் அகற்றப்பட்டன
- **Enhanced Content Structure**: கற்றல் பொருட்களின் சிறந்த ஏற்பாடு மற்றும் ஓட்டம்

#### மாற்றங்கள்
- **Documentation Format**: கற்றல்நோக்கில் ஒருங்கிணைந்த ஒழுங்கில் அனைத்து ஆவணங்களும் ஸ்டாண்டர்ட்டாக அமைக்கப்பட்டன
- **Navigation Flow**: அனைத்து கற்றல் பொருட்களில் தர்க்கமான முன்னேற்றம் செயல்படுத்தப்பட்டது
- **Content Presentation**: தெளிவான, தொழில்முறை வடிவமைப்புக்காக அலங்காரப் பொருட்கள் அகற்றப்பட்டன
- **Link Structure**: புதிய வழிச் சூழலுக்கு ஆதரவாக அனைத்து உள்ளக இணைப்புகளும் புதுப்பிக்கப்பட்டன

#### மேம்படுத்தப்பட்டது
- **Accessibility**: சிறிய திரை வாசகர் இணக்கத்திறன் மேம்படுத்த எமோஜி சார்பான சார்புகள் நீக்கப்பட்டன
- **Professional Appearance**: நிறுவனக் கல்வி ஸ்டைலில் சுத்தமான தோற்றம்
- **Learning Experience**: ஒவ்வொரு பாடத்திற்குமான தெளிவான இலக்குகள் மற்றும் முடிவுகள் கொண்ட கட்டமைப்பு
- **Content Organization**: தொடர்புடைய தலைப்புகளுக்கிடம் சிறந்த தர்க்க இணைப்பு

### [v1.0.0] - 2025-09-09

#### ஆரம்ப வெளியீடு - முழுமையான AZD கற்றல் ரெப்பொசிடரி

#### சேர்க்கப்பட்டது
- **Core Documentation Structure**
  - முழுமையான getting-started கையேடு தொடர்
  - முழுமையான டெபிளாய்மென்ட் மற்றும் வழங்கல் ஆவணங்கள்
  - விவரமான டிரபிள்ஷூட்டிங் வளங்கள் மற்றும் டீபக் வழிகாட்டிகள்
  - முன்-டெபிளாய்மென்ட் சோதனை கருவிகள் மற்றும் செயல்முறை

- **Getting Started Module**
  - AZD அடிப்படை: முக்கிய கருத்துக்கள் மற்றும் 용어 정의
  - நிறுவல் கையேடு: தள ஓஎஸ்-பிலாக்கப்பட்ட அமைப்பு அறிவுறுத்தல்கள்
  - கட்டமைப்பு கையேடு: சுற்றுச்சூழல் அமைப்பு மற்றும் அங்கீகாரம்
  - முதல்โปรเจக்ட் பயிற்சி: படிப்படியான கைமுறை கற்றல்

- **Deployment and Provisioning Module**
  - டெபிளாய்மென்ட் கையேடு: முழுமையான வேலை ஓட்டக் கையேடு
  - Provisioning கையேடு: Bicep உடன் Infrastructure as Code
  - உற்பத்தி டெபிளாய்மென்ட் சிறந்த நடைமுறைகள்
  - பன்மாவட்ட சேவை கட்டமைப்பு மாதிரிகள்

- **Pre-deployment Validation Module**
  - திறன் திட்டமிடல்: Azure வளங்களின் கிடைக்ககைச் சரிபார்ப்பு
  - SKU தேர்வு: சேவைக் குழுவின்த் தரம் வழிகாட்டி
  - முன்-பறக்கும் சோதனைகள்: 자동화 செய்யப்பட்ட சரிபார்ப்பு ஸ்கிரிப்டுகள் (PowerShell and Bash)
  - செலவு மதிப்பீடு மற்றும் பட்ஜெட் திட்டமிடல் கருவிகள்

- **Troubleshooting Module**
  - பொதுவான சிக்கல்கள்: அடிக்கடி எதிர்கொள்ளப்படும் பிரச்சினைகள் மற்றும் தீர்வுகள்
  - டீபக் வழிகாட்டி: ஒழுங்கமைக்கப்பட்ட டிரபிள்ஷூட்டிங் முறைகள்
  - மேம்பட்ட ஆய்வு நுட்பங்கள் மற்றும் கருவிகள்
  - செயல்திறன் கண்காணிப்பு மற்றும் இழுவைபடுத்தல்

- **Resources and References**
  - கட்டளை சீட்: முக்கிய கட்டளைகளுக்கான விரைவு குறிப்பு
  - சொற்பொருள் அகராதி: முழுமையான 용어 மற்றும் சுருக்கவினை வரையறைகள்
  - FAQ: பொதுவாக கேட்கப்படும் கேள்விகளுக்கான விரிவான பதில்கள்
  - வெளிப்புற வள இணைப்புகள் மற்றும் சமூக தொடர்புகள்

- **Examples and Templates**
  - எளிய வலை பயன்பாட்டு உதாரணம்
  - ஸ்டாடிக் இணையத்தளம் டெபிளாய்மென்ட் டெம்ப்ளேட்
  - கன்டெய்னர் பயன்பாட்டு கட்டமைப்பு
  - தரவுத்தள ஒருங்கிணைப்பு மாதிரிகள்
  - மைக்ரோசெர்விஸ்கள் கட்டமைப்பு உதாரணங்கள்
  - சர்வர் லெஸ் செயல்பாடு செயலாக்கங்கள்

#### அம்சங்கள்
- **Multi-Platform Support**: Windows, macOS, மற்றும் Linux க்கான நிறுவல் மற்றும் கட்டமைப்பு கையேடுகள்
- **Multiple Skill Levels**: மாணவர்களிலிருந்து தொழில்முறை டெவலப்பர்களுக்கு உட்பட்டு வடிவமைக்கப்பட்டது
- **Practical Focus**: கைமுறை உதாரணங்கள் மற்றும் உண்மையான உலக நிலைப்புற பிரதிகள்
- **Comprehensive Coverage**: அடிப்படை கருத்துப் பகிர்விலிருந்து மேம்பட்ட நிறுவன மாதிரிகள் வரை
- **Security-First Approach**: பாதுகாப்பு சிறந்த நடைமுறைகள் முழுவதுமாக ஒருங்கிணைக்கப்பட்டவை
- **Cost Optimization**: செலவு-திறன் வாய்ந்த டெபிளாய்மென்ட்ஸ் மற்றும் வள மேலாண்மைக்கான வழிகாட்டுதல்

#### ஆவண தரம்
- **Detailed Code Examples**: நடைமுறை, சோதிக்கப்பட்ட கோட் மாதிரிகள்
- **Step-by-Step Instructions**: தெளிவான, செயல்படுத்தக்கூடிய வழிகாட்டுதல்கள்
- **Comprehensive Error Handling**: பொதுவான சிக்கல்களுக்கு டிரபிள்ஷூட்டிங்
- **Best Practices Integration**: தொழில் தரநிலைகள் மற்றும் பரிந்துரைகள்
- **Version Compatibility**: சமீபத்திய Azure சேவைகள் மற்றும் azd அம்சங்களுடன் மேம்படுத்தப்பட்டது

## எதிர்கால மேம்பாடுகள் திட்டம்

### பதிப்பு 3.1.0 (திட்டமிடப்பட்டது)
#### AI தள விரிவாக்கம்
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, மற்றும் தனிப்பயன் மாடல்களின் ஒருங்கிணைப்பு மாதிரிகள்
- **AI Agent Frameworks**: LangChain, Semantic Kernel, மற்றும் AutoGen டெப்ளாய்மென்களுக்கு டெம்ப்ளேடுகள்
- **Advanced RAG Patterns**: Azure AI Search ஐத் தாண்டி வேக்டர் தரவுத்தள விருப்பங்கள் (Pinecone, Weaviate, மற்றும் பிற)
- **AI Observability**: மாடலின் செயல்திறன், டோக்கன் பயன்பாடு, மற்றும் பதிலின் தரத்திற்கான விரிவான கண்காணிப்பு

#### டெவலப்பர் அனுபவம்
- **VS Code Extension**: AZD + Microsoft Foundry ஒருங்கிணைந்த முன்னேற்றக் கனவு
- **GitHub Copilot Integration**: AI உதவியுடன் AZD டெம்ப்ளேட் உருவாக்கம்
- **Interactive Tutorials**: AI நிலைகளுக்கான தானியங்கி சரிபார்ப்புடன் கைமுறை குறியீட்டு பயிற்சிகள்
- **Video Content**: பார்வை கற்றலுக்கான ஆதார வீடியோ பாடங்கள் AI டெபிளாய்மெண்ட்ஸ் மீது

### பதிப்பு 4.0.0 (திட்டமிடப்பட்டது)
#### நிறுவன AI மாதிரிகள்
- **Governance Framework**: AI மாடல் நிர்வாகம், соответствии மற்றும் ஆடிட் டிரெயில்கள்
- **Multi-Tenant AI**: தனித்துவமான AI சேவைகள் மூலம் பல வாடிக்கையாளர்களுக்கு சேவை செய்யும் மாதிரிகள்
- **Edge AI Deployment**: Azure IoT Edge மற்றும் கன்டெய்னர் இன்ஸ்டன்சுகளுடன் ஒருங்கிணைப்பு
- **Hybrid Cloud AI**: AI வேலைப்பளுக்கான பன்முக & ஹைப்ரிட் டெபிளாய்மென்ட் மாதிரிகள்

#### மேம்பட்ட அம்சங்கள்
- **AI Pipeline Automation**: Azure Machine Learning முறைமைகளுடன் MLOps ஒருங்கிணைப்பு
- **Advanced Security**: சீரற்ற நம்பிக்கைக் கொள்கைகள், தனியார் endpoints மற்றும் மேம்பட்ட மிரட்டல் பாதுகாப்பு
- **Performance Optimization**: உயர்-தரவு AI பயன்பாடுகளுக்கு மேம்பட்ட ட்யூனிங் மற்றும் அளவு உயர்த்துதல் யுக்திகள்
- **Global Distribution**: AI பயன்பாடுகளுக்கான உள்ளடக்க விநியோகம் மற்றும் எட்ஜ் கேச்சிங் மாதிரிகள்

### பதிப்பு 3.0.0 (திட்டமிடப்பட்டது) - தற்போதைய வெளியீட்டால் முந்தியது
#### பரிந்துரைக்கப்பட்ட சேர்ப்புகள் - இப்போது v3.0.0 இல் நடைமுறைப்படுத்தப்பட்டது
- ✅ **AI-Focused Content**: Microsoft Foundry ஒருங்கிணைப்புடன் விரிவான உள்ளடக்கம் (Completed)
- ✅ **Interactive Tutorials**: கைமுறை AI பணியக ஆய்வு (Completed)
- ✅ **Advanced Security Module**: AI-சார்ந்த பாதுகாப்பு மாதிரிகள் (Completed)
- ✅ **Performance Optimization**: AI வேலைப்பளுக்கான ட்யூனிங் யுக்திகள் (Completed)

### பதிப்பு 2.1.0 (திட்டமிடப்பட்டது) - பகுதி v3.0.0 இல் நடைமுறைபடுத்தப்பட்டது
#### சிறிய மேம்பாடுகள் - தற்போதைய பதிப்பில் சில நிறைவேறியன
- ✅ **Additional Examples**: AI-மையமான டெபிளாய்மென்ட் сценарии (Completed)
- ✅ **Extended FAQ**: AI-சார்ந்த கேள்விகள் மற்றும் ட்ரபிள்ஷூட்டிங் (Completed)
- **Tool Integration**: மேம்பட்ட IDE மற்றும் எடிட்டர் ஒருங்கிணைப்பு கையேடுகள்
- ✅ **Monitoring Expansion**: AI-சார்ந்த கண்காணிப்பு மற்றும் அலர்டிங் மாதிரிகள் (Completed)

#### இன்னும் எதிர்பார்க்கப்படுகின்றவை எதிர்கால வெளியீட்டிற்கு
- **Mobile-Friendly Documentation**: மொபைல் கற்றலுக்கான பதில் வடிவமைப்பு
- **Offline Access**: பதிவிறக்கம் செய்யக்கூடிய ஆவண தொகுப்புகள்
- **Enhanced IDE Integration**: AZD + AI வேலைநடைப்புகளுக்கான VS Code விரிவீடு
- **Community Dashboard**: நேரடி சமூக அளவீடுகள் மற்றும் பங்களிப்பு கண்காணிப்பு

## Changelog இல் பங்களிக்க

### மாற்றங்களை 보고 செய்தல்
இந்த ரெப்பொசிடரிக்கு பங்களிக்கும்போது, தயவுசெய்து changelog பதிவுகள் கீழ்காணும் விவரங்களை அடையவேண்டும்:

1. **Version Number**: semantic versioning (major.minor.patch) படி
2. **Date**: வெளியீடு அல்லது புதுப்பிப்பு தேதி YYYY-MM-DD வடிவில்
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: என்ன மாற்றமாவது என்பது சுருக்கமாக விளக்கம்
5. **Impact Assessment**: மாற்றங்கள் தற்போதைய பயனாளர்களை எப்படி பாதிக்கின்றன

### Change Categories

#### Added
- புதிய அம்சங்கள், ஆவண பிரிவுகள் அல்லது திறன்கள்
- புதிய உதாரணங்கள், டெம்ப்ளேடுகள் அல்லது கற்றல் வளங்கள்
- கூடுதல் கருவிகள், ஸ்கிரிப்டுகள் அல்லது பயன்பாடுகள்

#### Changed
- உள்ள ஏற்கனவே உள்ள செயல்பாடுகளின் அல்லது ஆவணங்களின் திருத்தங்கள்
- தெளிவு அல்லது சரியான தன்மையை மேம்படுத்தும் புதுப்பிப்புகள்
- உள்ளடக்கத்தின் மறுசீரமைப்பு அல்லது அமைப்பில் மாற்றங்கள்

#### Deprecated
- படிப்படியாக நீக்கப்படும் அம்சங்கள் அல்லது அணுகுமுறைகள்
- நீக்கத்திற்குள் உள்ள ஆவண பிரிவுகள்
- நல்ல மாற்று முறைகள் உள்ள முறைமைகள்

#### Removed
- இனி பொருந்தாத அம்சங்கள், ஆவணங்கள் அல்லது உதாரணங்கள்
- பழைய தகவல்கள் அல்லது பயன்படுத்தப்படாத அணுகுமுறைகள்
- மீள்பயன்படுத்தம் சாத்தியமற்ற அல்லது ஒருங்கிணைக்கப்பட்ட உள்ளடக்கம்

#### Fixed
- ஆவணங்கள் அல்லது கோடுகளில் ஏற்பட்ட மெல்லிசைகளை சரிசெய்தல்
- அட்டைப்பட்ட பிரச்சினைகள் அல்லது புகார்கள் தீர்வு
- துல்லியத் தன்மையை அல்லது செயல்திறனை மேம்படுத்துதல்

#### Security
- பாதுகாப்பு தொடர்பான மேம்பாடுகள் அல்லது திருத்தங்கள்
- பாதுகாப்பு சிறந்த நடைமுறைகளுக்கு புதுப்பித்தல்கள்
- பாதுகாப்பு_OS குழப்பங்கள் தீர்வு

### Semantic Versioning வழிகாட்டுதல்

#### Major Version (X.0.0)
- பயனர் நடவடிக்கையை கோருவதைத் தேவைப்படுத்தும் உடைத்தல் மாற்றங்கள்
- உள்ளடக்கத்தின் அல்லது அமைப்பின் குறிப்பிடத்தக்க மறுசீரமைப்பு
- அடிப்படையான அணுகுமுறையைக் மாற்றும் மாற்றங்கள்

#### Minor Version (X.Y.0)
- புதிய அம்சங்கள் அல்லது உள்ளடக்க சேர்ப்புகள்
- முந்தைய பயன்பாட்டுடன் பின்னோக்குவரிசையாக இணங்குகின்ற மேம்பாடுகள்
- கூடுதல் உதாரணங்கள், கருவிகள் அல்லது வளங்கள்

#### Patch Version (X.Y.Z)
- பிழை சீரமைப்புகள் மற்றும் திருத்தங்கள்
- உள்ளடக்கத்தில் சிறிய மேம்பாடுகள்
- தெளிவுபடுத்தல்கள் மற்றும் சிறு திருத்தங்கள்

## சமூக கருத்து மற்றும் பரிந்துரைகள்

இந்த கற்றல் வளத்தை மேம்படுத்த சமூக கருத்துக்களை ஊக்குவிக்கிறோம்:

### கருத்து அளிப்பது எப்படி
- **GitHub Issues**: பிரச்சினைகளை அறிக்கை செய்க அல்லது மேம்பாடுகள் பரிந்துரைக்கவும் (AI-சார்ந்த பிரச்சினைகள் வரவேற்பு)
- **Discord Discussions**: கருத்துகளை பகிரவும் மற்றும் Microsoft Foundry சமூகத்துடன் தொடர்பு கொள்ளவும்
- **Pull Requests**: உடனடி உள்ளடக்க மேம்பாடுகளுக்கு பங்களிக்கவும், குறிப்பாக AI டெம்ப்ளேடுகள் மற்றும் வழிகாட்டிகளில்
- **Microsoft Foundry Discord**: AZD + AI விவாதங்களுக்கு #Azure சேனலில் பங்கேற்கவும்
- **Community Forums**: பரந்த Azure டெவலப்பர் விவாதங்களில் பங்கேற்கவும்

### கருத்து வகைகள்
- **AI Content Accuracy**: AI சேவை ஒருங்கிணைப்பு மற்றும் டெபிளாய்மென்ட் தகவல்களுக்கான திருத்தங்கள்
- **Learning Experience**: AI டெவலப்பர் கற்றல் ஏற்பாட்டை மேம்படுத்தப்பட வேண்டிய பரிந்துரைகள்
- **Missing AI Content**: கூடுதல் AI டெம்ப்ளேடுகள், மாதிரிகள் அல்லது உதாரணங்களுக்கான கோரிக்கைகள்
- **Accessibility**: பல்வேறு கற்றல் தேவைகளுக்கான மேம்பாடுகள்
- **AI Tool Integration**: சிறந்த AI டெவல்மெண்ட் வேலைநிலையின் ஒருங்கிணைப்பு பரிந்துரைகள்
- **Production AI Patterns**: நிறுவன நிலை AI டெபிளாய்மென்ட் மாதிரிகள் கோரிக்கைகள்

### பதில் இழுத்துக் கொள்வது
- **Issue Response**: அறிக்கைகளை 48 மணிநேரத்திற்கு உள்ளில் பதிலளிப்பு
- **Feature Requests**: ஒரு வாரத்தில் மதிப்பீடு
- **Community Contributions**: ஒரு வாரத்தில் மதிப்பீடு
- **Security Issues**: உடனடியான முன்னுரிமை மற்றும் விரைவான பதில்

## பராமரிப்பு அட்டவணை

### நிச்சயமான புதுப்பிப்புகள்
- **Monthly Reviews**: உள்ளடக்கத் துல்லியம் மற்றும் இணைப்புகள் சரிபார்ப்பு
- **Quarterly Updates**: பெரிய உள்ளடக்க சேர்ப்புகள் மற்றும் மேம்பாடுகள்
- **Semi-Annual Reviews**: முழுமையான மறுசீரமைப்பு மற்றும் மேம்பாட்டு வேலைகள்
- **Annual Releases**: குறிப்பிடத்தக்க மேம்பாடுகளுடன் வருடாந்திர வெளியீடுகள்

### கண்காணிப்பு மற்றும் தரக் கட்டுப்பாடு
- **Automated Testing**: கோட் உதாரணங்கள் மற்றும் இணைப்புகளை அடிக்கடி சரிபார்க்கும்
- **Community Feedback Integration**: பயனர் பரிந்துரைகளை முறையேச் சேர்த்தல்
- **Technology Updates**: சமீபத்திய Azure சேவைகள் மற்றும் azd வெளியீடுகளோடு ஒத்திசைவு
- **Accessibility Audits**: உட்புகுத்த வரைசெய்தி வடிவமைப்பு நெறிமுறைகளுக்கான நிலையான பரிசோதனை

## பதிப்பு ஆதரவு கொள்கை

### தற்போதைய பதிப்பு ஆதரவு
- **சமீபத்திய முக்கிய பதிப்பு**: முழு ஆதரவு மற்றும் நேயமிக்க புதுப்பிப்புகள்
- **முன்னைய முக்கிய பதிப்பு**: 12 மாதங்களுக்கு பாதுகாப்பு புதுப்பிப்புகள் மற்றும் முக்கிய திருத்தங்கள்
- **பழைய பதிப்புகள்**: சமூக ஆதரவு மட்டும், எந்தவித உத்தியோகபூர்வ புதுப்பிப்புகளும் இல்லை

### குடியேற்ற வழிகாட்டி
பெரிய பதிப்புகள் வெளியிடப்படும்போது, நாங்கள் வழங்குகிறோம்:
- **குடியேற்றக் கையேடுகள்**: படிநிலை வாரியான மாற்ற வழிமுறைகள்
- **இணக்கத் குறிப்புகள்**: உடைக்கும் மாற்றங்கள் பற்றிய விவரங்கள்
- **கருவி ஆதரவு**: குடியேற்றத்திற்கு உதவும் ஸ்கிரிப்டுகள் அல்லது பயன்பாட்டு கருவிகள்
- **சமூக ஆதரவு**: குடியேற்றக் கேள்விகளுக்கான சிறப்பு மன்றங்கள்

---

**வழிசெலுத்தல்**
- **முன்னைய பாடம்**: [பயிற்சி கையேடு](resources/study-guide.md)
- **அடுத்த பாடம்**: திரும்ப [முதன்மை README](README.md)

**புதிய தகவல்களைப் பெறுங்கள்**: புதிய வெளியீடுகள் மற்றும் கற்றல் வளங்களுக்கான முக்கியமான புதுப்பிப்புகள் பற்றிய அறிவிப்புகளுக்காக இந்த சேமிப்பகத்தை கண்காணிக்கவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**பொறுப்பு மறுப்பு**:
இந்த ஆவணம் செயற்கை நுண்ணறிவு மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாம் துல்லியத்திற்காக முயலினாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள அசல் ஆவணம் அதிகாரப்பூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பாளர் மூலம் மொழிபெயர்ப்பு செய்யப்பட வேண்டும் என்று பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்க மாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
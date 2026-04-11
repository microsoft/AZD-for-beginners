# చేంజ్‌లాగ్ - AZD ప్రారంభికులకు

## పరిచయం

ఈ చేంజ్‌లాగ్ AZD ప్రారంభికులకు రిపోజిటరీలోని అన్ని ముఖ్యమైన మార్పులు, నవీకరణలు మరియు మెరుగుదలలను డాక్యుమెంట్ చేస్తుంది. మేము సేమాంటిక్ వెర్షనింగ్ సిద్దాంతాలను అనుసరిస్తాము మరియు వేర్వేర్షన్ల మధ్య ఏమి మారిందో వినియోగదారులు అర్థం చేసుకోవడానికి ఈ లాగ్‌ను నిర్వహిస్తాము.

## నేర్చుకునే లక్ష్యాలు

By reviewing this changelog, you will:
- కొత్త ఫీచర్లు మరియు కంటెంట్ చేరికల గురించి అప్డేట్‌గా ఉండండి
- ఉన్న డాక్యుమెంటేషన్‌లో చేసిన మెరుగుదలలను అర్థం చేసుకోండి
- ఖచ్చితత్వాన్ని నిర్ధారించడానికి బగ్ ఫిక్స్‌లు మరియు సవరణలను ట్రాక్ చేయండి
- సమయానుసారం విద్యా పదార్థాల అభివృద్ది ని అనుసరించండి

## అధ్యయన ఫలితాలు

చేంజ్‌లాగ్ ఎంట్రీలను సమీక్షించిన తర్వాత, మీరు చేయగలరు:
- నేర్చుకునే కోసం అందుబాటులో ఉన్న కొత్త కంటెంట్ మరియు వనరులను గుర్తించండి
- ఏ విభాగాలు నవీకరించబడ్డాయో లేదా మెరుగుపరచబడ్డాయో అర్థం చేసుకోండి
- తాజా సామగ్రి ఆధారంగా మీ అభ్యాస మార్గాన్ని ప్లాన్ చేయండి
- భవిష్యత్తు మెరుగుదలల కోసం అభిప్రాయం మరియు సూచనలు అందించండి

## వెర్షన్ చరిత్ర

### [v3.19.1] - 2026-03-27

#### ప్రారంభికుల ఆన్‌బోర్డింగ్ స్పష్టీకరణ, సెటప్ ధృవీకరణ మరియు చివరి AZD కమాండ్ క్లీన్అప్
**ఈ వెర్షన్ AZD 1.23 ధృవీకరణ స్వీప్‌ను అనుసరిస్తూ ప్రారంభికులపై కేంద్రీకృత డాక్యుమెంటేషన్ పాస్‌ను అందిస్తుంది: ఇది AZD-ముందుగా ఆథెంటికేషన్ మార్గదర్శకాన్ని స్పష్టం చేస్తుంది, స్థానీయ సెటప్ ధృవీకరణ స్క్రిప్టులను జోడిస్తుంది, కీలక కమాండ్లను ప్రత్యక్ష AZD CLI మీద నిర్ధారిస్తుంది, మరియు చేంజ్‌లాగ్ తప్ప మరే చోటలనుండి కూడా చివరి పాత ఆంగ్ల-మూల కమాండ్ సూచనలను తొలగిస్తుంది.**

#### చేర్చబడింది
- **🧪 ప్రారంభికుల సెటప్ ధృవీకరణ స్క్రిప్టులు** `validate-setup.ps1` మరియు `validate-setup.sh` తో, తద్వారా అభ్యసనకర్తలు అధ్యాయం 1 ప్రారంభించడానికి ముందుగా అవసరమైన టూల్స్‌ను నిర్ధారించుకోవచ్చు
- **✅ ముందస్తు సెటప్ ధృవీకరణ దశలు** రూట్ README మరియు అధ్యాయం 1 README లో చేర్చబడ్డాయి, తద్వారా `azd up` చేపట్టే ముందు మిస్ అయిన ప్రీరిక్విజిట్లు పట్టుకోబడతాయి

#### మార్చబడింది
- **🔐 ప్రారంభికుల ఆథెంటికేషన్ మార్గదర్శకం** ఇప్పుడు స్థిరంగా `azd auth login`ని AZD వర్క్‌ఫ్లోలకు ప్రాథమిక మార్గంగా扱ిస్తుంది, మరియు `az login`ని ప్రత్యక్షంగా Azure CLI కమాండ్లు ఉపయోగించవలసిన సందర్భాలలో మాత్రమే ఐచ్ఛికంగా సూచిస్తుంది
- **📚 అధ్యాయం 1 ఆన్‌బోర్డింగ్ ప్రవాహం** ఇప్పుడు అభ్యసనకర్తలు ఇన్‌స్టాలేషన్, ఆథెంటికేషన్ మరియు మొదటి డిప్లాయ్‌మెంట్ చర్యల ముందు తమ స్థానిక సెటప్‌ను ధృవీకరించమని సూచిస్తుంది
- **🛠️ వెరిఫయర్ సందేశాలు** ఇప్పుడు AZD-కే పరిమితమైన ప్రారంభిక మార్గానికి బ్లాకింగ్ అవసరాలను మరియు ఐచ్ఛిక Azure CLI హెచ్చరికలను స్పష్టంగా వేరుచేస్తాయి
- **📖 కాన్ఫిగరేషన్, ట్రబుల్షూటింగ్, మరియు ఉదాహరణ డాక్స్** ఇప్పుడు అవసరమైన AZD ఆథెంటికేషన్ మరియు ఐచ్ఛిక Azure CLI సైన్-ఇన్ మధ్య తేడాను వివరిస్తాయి, గతంలో రెండింటినీ సందర్భం లేకుండా సమర్పించేవి

#### సరిచేయబడింది
- **📋 మిగిలిన ఆంగ్ల-మూల కమాండ్ సూచనలు** ప్రస్తుత AZD రూపాలకు నవీకరించబడ్డాయి, ఉదాహరణకు చీట్ షీట్‌లో `azd config show` మరియు Azure పోర్టల్ అవలోకన సూచన అవసరమైన చోట `azd monitor --overview`
- **🧭 అధ్యాయం 1లో ప్రారంభకుల హామీలు** అన్ని టెంప్లేట్లలో మరియు Azure వనరులపై గ్యారంటీ చేయబడిన శూన్య-లోపాలు లేదా రోల్‌బ్యాక్ ప్రవర్తన ఆశాదాయకంగా హామీ ఇవ్వకుండా మృదువుగా మార్చబడ్డాయి
- **🔎 లైవ్ CLI ధృవీకరణ** క్రింది కమాండ్లపై ప్రస్తుత మద్దతును నిర్ధారించింది: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, మరియు `azd down --force --purge`

#### ఫైళ్లు నవీకరించబడ్డాయి
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

#### AZD 1.23.12 ధృవీకరణ, వర్క్‌షాప్ పరిసర విస్తరణ & AI మోడల్ రిఫ్రెష్
**ఈ వెర్షన్ డాక్యుమెంటేషన్‌ను `azd` `1.23.12` ఆధారంగా ధృవీకరిస్తుంది, పాతవైన AZD కమాండ్ ఉదాహరణలను నవీకరిస్తుంది, AI మోడల్ మార్గదర్శకాలను ప్రస్తుత డిఫాల్ట్‌లకు రిఫ్రెష్ చేస్తుంది, మరియు వర్క్‌షాప్ సూచనలను GitHub Codespaces‌కి మాత్రమే కాకుండా dev containers మరియు స్థానిక క్లోన్లకు కూడా మద్దతు ఇవ్వడానికి విస్తరిస్తుంది.**

#### చేర్చబడింది
- **✅ కోర్ అధ్యాయాలు మరియు వర్క్‌షాప్ డాక్స్ అంతటా ధృవీకరణ నోట్స్** తద్వారా కొత్త లేదా పాత CLI బిల్డ్స్ ఉపయోగించే అభ్యసకులకు పరీక్షించిన AZD బేస్‌లైన్‌ను స్పష్టం చేయబడుతుంది
- **⏱️ డిప్లాయ్‌మెంట్ టైమ్‌ఔట్ మార్గదర్శకం** దీర్ఘకాలం నడిచే AI అప్లికేషన్ డిప్లాయ్‌మెంట్స్ కోసం `azd deploy --timeout 1800` వినియోగ సూచనతో
- **🔎 ఎక్స్‌టెన్షన్ పరిశీలన దశలు** AI వర్క్‌ఫ్లో డాక్స్‌లో `azd extension show azure.ai.agents`తో
- **🌐 విస్తృత వర్క్‌షాప్ వాతావరణ మార్గదర్శకాలు** MkDocs ఉపయోగించి GitHub Codespaces, dev containers మరియు స్థానిక క్లోన్స్‌ను కవరింగ్ చేస్తాయి

#### మార్చబడింది
- **📚 చాప్టర్ ప్రారంభ READMEలు** ఇప్పుడు ఫౌండేషన్, కాన్ఫిగరేషన్, ఇన్ఫ్రాస్ట్రక్చర్, మల్టీ-ఏజెంట్, ప్రీ-డిప్లాయ్‌మెంట్, ట్రబుల్షూటింగ్ మరియు ప్రొడక్షన్ విభాగాలన్నిట్లో `azd 1.23.12`తో ధృవీకరణ ఉందని నిరంతరంగా సూచిస్తాయి
- **🛠️ AZD కమాండ్ సూచనలు** డాక్యూమెంటేషన్ అంతటా ప్రస్తుత రూపాలకు నవీకరించబడ్డాయి:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` లేదా `azd env get-value(s)` సందర్భం ఆధారంగా
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` (Application Insights అవలోకనం ఉద్దేశించినప్పుడు)
- **🧪 ప్రొవిజన్ ప్రివ్యూ ఉదాహరణలు** ప్రస్తుత మద్దతు ఉన్న ఉపయోగాలకు సరళీకృతమయ్యాయి, ఉదాహరణకు `azd provision --preview` మరియు `azd provision --preview -e production`
- **🧭 వర్క్‌షాప్ ప్రవాహం** నవీకరించబడింది — నేర్చుకునేవారు Labs ను Codespaces, dev container లేదా స్థానిక క్లోన్‌లో పూర్తిచేయగలిగేలా మార్పులు చేయబడ్డాయి, Codespaces-కే పరిమితం చేయకుండా
- **🔐 ఆథెంటికేషన్ మార్గదర్శకాలు** ఇప్పుడు AZD వర్క్‌ఫ్లోలకు `azd auth login`ని ప్రాధాన్యంగా సూచిస్తాయి,‌, మరియు `az login`ను Azure CLI కమాండ్లు ప్రత్యక్షంగా ఉపయోగించే సందర్భాల్లో ఐచ్ఛికంగా ఉంచాయి

#### పరిష్కరించబడింది
- **🪟 Windows ఇన్‌స్టాల్ కమాండ్లు** ఇన్‌స్టలేషన్ గైడ్లో ప్రస్తుత `winget` ప్యాకేజీ కేసింగ్‌కు అనుగుణంగా సమానీకరించబడ్డాయి
- **🐧 Linux ఇన్‌స్టాల్ మార్గదర్శకం** అసమర్థత కలిగించే డిస్ట్రో-నిర్దిష్ట `azd` ప్యాకేజ్ మేనేజర్ సూచనలను నివారించి అవసరమైన చోట రిలీజ్ అసెట్స్‌ను సూచించేలా సరి చేయబడింది
- **📦 AI మోడల్ ఉదాహరణలు** పాత డిఫాల్ట్లు `gpt-35-turbo` మరియు `text-embedding-ada-002` మాదిరి నుండి ప్రస్తుత ఉదాహరణలకు అప్‌డేట్ చేయబడ్డాయి: `gpt-4.1-mini`, `gpt-4.1`, మరియు `text-embedding-3-large`
- **📋 డిప్లాయ్‌మెంట్ మరియు డయాగ్నొస్టిక్స్ స్నిపెట్స్** లాగ్స్, స్క్రిప్ట్‌లు మరియు ట్రబుల్షూటింగ్ దశలలో ప్రస్తుత ఎన్విరాన్‌మెంట్ మరియు స్థితి కమాండ్లను ఉపయోగించడం కోసం సరిచేయబడ్డాయి
- **⚙️ GitHub Actions మార్గదర్శకాలు** `Azure/setup-azd@v1.0.0` నుండి `Azure/setup-azd@v2` కి నవీకరించబడ్డాయి
- **🤖 MCP/Copilot సంతృప్తి సూచనలు** `azd mcp consent` నుండి `azd copilot consent list` కి నవీకరించబడ్డాయి

#### మెరుగుపరచబడింది
- **🧠 AI అధ్యాయం మార్గదర్శకాలు** ఇప్పుడు ప్రివ్యూ-సున్నిత `azd ai` ప్రవర్తన, టెనెంట్-నిర్ధారిత లాగిన్, ప్రస్తుత ఎక్స్‌టెన్షన్ వినియోగం మరియు నవీకరించిన మోడల్ డిప్లాయ్‌మెంట్ సిఫార్సుల వివరాలను మెరుగ్గా వివరిస్తాయి
- **🧪 వర్క్‌షాప్ సూచనలు** ఇప్పుడు హ్యాండ్-ఆన్ ల్యాబ్స్ కోసం రియలిస్టిక్ వెర్షన్ ఉదాహరణలు మరియు క్లియర్ ఎన్‌విరాన్‌మెంట్ సెటప్ భాషను ఉపయోగిస్తాయి
- **📈 ప్రొడక్షన్ మరియు ట్రబుల్షూటింగ్ డాక్స్** ప్రస్తుత మానిటరింగ్, ఫాల్బ్యాక్ మోడల్ మరియు ఖర్చు-తిరగుబడి ఉదాహరణలకు మెరుగ్గా అనుకూలంగా చేశారు

#### ఫైళ్లు నవీకరించబడ్డాయి
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

#### AZD AI CLI కమాండ్లు, కంటెంట్ ధృవీకరణ & టెంప్లేట్ విస్తరణ
**ఈ వెర్షన్ అన్ని AI-సంబంధిత అధ్యాయాలలో `azd ai`, `azd extension`, మరియు `azd mcp` కమాండ్ కవరేజ్ను జోడిస్తది, agents.md లో బ్రోకన్ లింకులను మరియు డిప్రికేటెడ్ కోడ్‌ను సరి చేస్తుంది, చీట్ షీట్‌ను నవీకరిస్తుంది, మరియు Example Templates విభాగాన్ని నిశ్చిత వివరణలతో మరియు కొత్త Azure AI AZD టెంప్లేట్‌లతో పునఃరూపుమారుస్తుంది.**

#### చేర్చబడింది
- **🤖 AZD AI CLI కవరేజ్** 7 ఫైళ్ళలో (ముందు ఇది కేవలం చాప్టర్ 8లోనే ఉంది):
  - `docs/chapter-01-foundation/azd-basics.md` — కొత్త "ఎక్స్‌టెన్షన్స్ మరియు AI కమాండ్లు" విభాగం, ఇది `azd extension`, `azd ai agent init`, మరియు `azd mcp` ను పరిచయం చేస్తుంది
  - `docs/chapter-02-ai-development/agents.md` — ఎంపిక 4: `azd ai agent init` సరిపోల్చే పట్టికతో (టెంప్లేట్ vs మానిఫెస్ట్ పద్ధతి)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry కోసం AZD ఎక్స్‌టెన్షన్స్" మరియు "ఏజెంట్-ఫస్ట్ డిప్లాయ్‌మెంట్" ఉపవిభాగాలు
  - `docs/chapter-05-multi-agent/README.md` — క్విక్ స్టార్ట్ ఇప్పుడు టెంప్లేట్ మరియు మానిఫెస్ట్ ఆధారిత డిప్లాయ్‌మెంట్ మార్గాలను చూపిస్తుంది
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy విభాగంలో ఇప్పుడు `azd ai agent init` ఎంపికను కూడా కలిగి ఉంది
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "డయాగ్నొస్టిక్స్ కోసం AZD AI ఎక్స్‌టెన్షన్ కమాండ్లు" ఉపవిభాగం
  - `resources/cheat-sheet.md` — కొత్త "AI & ఎక్స్‌టెన్షన్స్ కమాండ్లు" విభాగం `azd extension`, `azd ai agent init`, `azd mcp`, మరియు `azd infra generate` తో
- **📦 కొత్త AZD AI ఉదాహరణ టెంప్లేట్స్** `microsoft-foundry-integration.md` లో:
  - **azure-search-openai-demo-csharp** — .NET RAG చాట్ Blazor WebAssembly, Semantic Kernel, మరియు వాయిస్ చాట్ మద్దతుతో
  - **azure-search-openai-demo-java** — Langchain4J ఉపయోగించి Java RAG చాట్, ACA/AKS డిప్లాయ్‌మెంట్ ఎంపికలతో
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, మరియు Prompty ఉపయోగించి మల్టీ-ఏజెంట్ క్రియేటివ్ రైటింగ్ ఆప్
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ఉపయోగించి సర్వర్‌లెస్ RAG, Ollama స్థానిక డెవ్ మద్దతుతో
  - **chat-with-your-data-solution-accelerator** — అడ్మిన్ పోర్టల్, Teams సమఈకరణ మరియు PostgreSQL/Cosmos DB ఎంపికలతో ఎంటర్ప్రైజ్ RAG యాక్సలరేటర్
  - **azure-ai-travel-agents** — .NET, Python, Java, మరియు TypeScript లో సర్వర్లు ఉన్న మల్టీ-ఏజెంట్ MCP ఆర్కెస్ట్రేషన్ రెఫరెన్స్ యాప్
  - **azd-ai-starter** — షార్ట్ Azure AI ఇన్ఫ్రాస్ట్రక్చర్ Bicep స్టార్టర్ టెంప్లేట్
  - **🔗 Awesome AZD AI గ్యాలరీ లింక్** — సూచనకు [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ టెంప్లేట్లు)

#### పరిష్కరించబడింది
- **🔗 agents.md నావిగేషన్**: మునుపటి/తదుపరి లింకులు ఇప్పుడు Chapter 2 README పాఠ్య క్రమానికి సరిపోతున్నవి (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md బ్రోకెన్ లింకులు**: `production-ai-practices.md` ను `../chapter-08-production/production-ai-practices.md` గా సరిచేశారు (3 సందర్భాలు)
- **📦 agents.md డిప్రికేటెడ్ కోడ్**: `opencensus` ను `azure-monitor-opentelemetry` + OpenTelemetry SDK తో మార్చారు
- **🐛 agents.md అమాయక API**: `max_tokens` ను `create_agent()` నుండి `create_run()` కు `max_completion_tokens`గా తరలించబడ్డింది
- **🔢 agents.md టోకెన్ లెక్కింపు**: అంచనా `len//4` స్థానంలో `tiktoken.encoding_for_model()` ఉపయోగించేలా మార్చబడింది
- **azure-search-openai-demo**: సేవలను "Cognitive Search + App Service" నుండి "Azure AI Search + Azure Container Apps" గా సరిచేశారు (డిఫాల్ట్ హోస్ట్ ఆక్ట్ 2024 లో మార్చబడింది)
- **contoso-chat**: వివరణను Azure AI Foundry + Prompty ను సూచించేలా నవీకరించారు, ఇది రిపో_actual శీర్షిక మరియు టెక్ స్టాక్‌కు సరిపోతుంది

#### తొలగించబడింది
- **ai-document-processing**: ప్రాథమికంగా పనిచేయని టెంప్లేట్ సూచనను తొలగించారు (రిపో AZD టెంప్లేట్‌గా బహిరంగంగా 접근ించాల్సింది కాదు)

#### మెరుగుపరచబడింది
- **📝 agents.md exercises**: అభ్యాసం 1 ఇప్పుడు అవసరమైన అవుట్‌పుట్ మరియు `azd monitor` దశను చూపిస్తుంది; అభ్యాసం 2లో పూర్తి `FunctionTool` రిజిస్ట్రేషన్ కోడ్ చేర్చబడింది; అభ్యాసం 3లో అస్పష్ట మార్గదర్శకత్వాన్ని నిర్దిష్ట `prepdocs.py` కమాండ్లతో మార్చబడింది
- **📚 agents.md resources**: డాక్యుమెంటేషన్ లింకులు ప్రస్తుత Azure AI Agent Service డాక్స్ మరియు క్విక్‌స్టార్ట్‌కు నవీకరించబడ్డాయి
- **📋 agents.md Next Steps table**: పూర్తి అధ్యాయ కవరేజీ కోసం AI Workshop Lab లింక్ జత చేయబడింది

#### నవీకరించిన ఫైళ్లు
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
**ఈ సంస్కరణ README.md అధ్యాయ నావిగేషన్‌ను మెరుగుపరుస్తుంది, మెరుగైన పట్టిక ఫార్మాట్‌తో.**

#### Changed
- **Course Map Table**: నేరుగా పాఠ లింకులు, వ్యవధి అంచనాలు, మరియు క్లిష్టత రేటింగ్‌లతో మెరుగుపరుచబడింది
- **Folder Cleanup**: అవసరంలేని పాత ఫోల్డర్లను (deployment/, getting-started/, pre-deployment/, troubleshooting/) తీసివేయబడింది
- **Link Validation**: కోర్సు మ్యాప్ పట్టికలోని 21+ అంతర్గత లింక్‌లు అన్ని ధృవీకరించబడ్డాయి

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**ఈ సంస్కరణ ప్రొడక్ట్ సూచనలను ప్రస్తుత Microsoft బ్రాండింగ్‌కు నవీకరిస్తుంది.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: అనువాదేతర ఫైళ్లలో అన్ని సూచనలు నవీకరించబడ్డాయి
- **Azure AI Agent Service → Foundry Agents**: ప్రస్తుత బ్రాండింగ్‌ను ప్రతిబింబించడానికి సర్వీస్ పేరు నవీకరించబడింది

#### Files Updated
- `README.md` - ప్రధాన కోర్సు ల్యాండింగ్ పేజీ
- `changelog.md` - వెర్షన్ చరిత్ర
- `course-outline.md` - కోర్సు నిర్మాణం
- `docs/chapter-02-ai-development/agents.md` - AI ఏజెంట్స్ గైడ్
- `examples/README.md` - ఉదాహరణల డాక్యুমెంటేషన్
- `workshop/README.md` - వర్క్‌షాప్ ల్యాండింగ్ పేజీ
- `workshop/docs/index.md` - వర్క్‌షాప్ సూచిక
- `workshop/docs/instructions/*.md` - అన్ని వర్క్‌షాప్ సూచన ఫైళ్లు

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**ఈ సంస్కరణ డాక్యుమెంటేషన్‌ను స్పష్టమైన నావిగేషన్ కోసం ప్రత్యేక అధ్యాయ ఫోల్డర్లలో పునఃసంరచిస్తుంది.**

#### Folder Renames
పాత ఫోల్డర్లు అధ్యాయం-సంఖ్య ఫోల్డర్లతో మార్పిడి చేయబడ్డాయి:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| ఫైల్ | నుండి | కు |
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
- **📚 Chapter README files**: ప్రతి अध्यాయ ఫోల్డర్‌లో README.md సృష్టించబడ్డాయి, వాటిలో:
  - లెర్నింగ్ లక్ష్యాలు మరియు వ్యవధి
  - వర్ణనలతో పాఠాల పట్టిక
  - త్వరిత ప్రారంభ కమాండ్లు
  - ఇతర అధ్యాయాలకు నావిగేషన్

#### Changed
- **🔗 Updated all internal links**: 78+ మార్గాలు అన్ని డాక్యుమెంటేషన్ ఫైళ్లలో నవీకరించబడ్డాయి
- **🗺️ Main README.md**: కొత్త అధ్యాయ నిర్మాణంతో కోర్సు మ్యాప్ నవీకరించబడింది
- **📝 examples/README.md**: అధ్యాయ ఫోల్డర్లకు క్రాస్-రెఫరెన్స్‌లు నవీకరించబడ్డాయి

#### Removed
- పాత ఫోల్డర్ నిర్మాణం (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**ఈ సంస్కరణ అధ్యాయ నావిగేషన్ README ఫైல்கள் జోడించింది (v3.15.0 ద్వారా సుపర్‌సీడెడ్).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**ఈ సంస్కరణ Azure Developer CLI తో AI ఏజెంట్స్‌ను దిగుమతి చేయడానికి సమగ్ర మార్గదర్శకాన్ని జోడిస్తుంది.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: పూర్తి మార్గదర్శకం, ఇందులో:
  - ఏం AI ఏజెంట్స్ మరియు అవి చాట్‌బాట్స్ నుండి ఎలా వేరుగా ఉంటాయి
  - మూడు త్వరిత ప్రారంభ ఏజెంట్ టెంప్లేట్లు (Foundry Agents, Prompty, RAG)
  - ఏజెంట్ ఆర్కిటెక్చర్ నమూనాలు (single agent, RAG, multi-agent)
  - టూల్ కాన్ఫిగరేషన్ మరియు అనుకూలీకరణ
  - మానిటరింగ్ మరియు మెట్రిక్స్ ట్రాకింగ్
  - ఖర్చు అంశాలు మరియు ఆప్టిమైజేషన్
  - సాధారణ ట్రబుల్‌షూటింగ్ పరిస్థితులు
  - విజయ ప్రమాణాలతో మూడు హ్యాండ్స్-ఆన్ అభ్యాసాలు

#### Content Structure
- **Introduction**: ప్రారంభకులకు ఏజెంట్ భావనలు
- **Quick Start**: ఏజెంట్లను `azd init --template get-started-with-ai-agents` ఉపయోగించి డిప్లాయ్ చేయండి
- **Architecture Patterns**: ఏజెంట్ నమూనాల యొక్క విజువల్ డయాగ్రామ్స్
- **Configuration**: టూల్ సెటప్ మరియు ఎన్విరాన్మెంట్ వేరియబుల్స్
- **Monitoring**: Application Insights అనుసంధానం
- **Exercises**: ప్రగతిశీల హ్యాండ్స్-ఆన్ అభ్యాసాలు (ప్రతి ఒక్కటి 20-45 నిమిషాలు)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**ఈ సంస్కరణ డెవలప్‌మెంట్ కంటెయినర్ కాన్ఫిగరేషన్‌ను ఆధునిక టూల్స్ మరియు మెరుగైన డిఫాల్ట్స్‌తో AZD లెర్నింగ్ అనుభవానికి నవీకరిస్తోంది.**

#### Changed
- **🐳 Base Image**: ఆధార చిత్రాన్ని `python:3.12-bullseye` నుండి `python:3.12-bookworm` (తాజా Debian స్థిరం) కు నవీకరించబడింది
- **📛 Container Name**: స్పష్టత కోసం "Python 3" నుండి "AZD for Beginners" గా పేరు మార్చబడింది

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: సాధారణ అభివృద్ధి కోసం ముందుగా కాన్ఫిగర్ చేసిన పోర్టులు:
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

- **⚙️ VS Code Settings**: Python ఇంటర్‌ప్రెటర్, ఫార్మాట్ ఆన్ సేవ్, మరియు వైట్‌స్పేస్ ట్రిమ్మింగ్ కోసం డిఫాల్ట్ సెట్టింగ్స్ జోడించబడ్డాయి

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify ప్లగిన్ జోడించబడింది
  - కోడ్ నాణ్యత కోసం pre-commit జోడించబడింది
  - Azure SDK ప్యాకేజీలు జోడించబడ్డాయి (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: ఇప్పుడు కంటెయినర్ ప్రారంభంలో AZD మరియు Azure CLI ఇన్‌స్టలేషన్‌ను నిర్ధారిస్తుంది

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**ఈ సంస్కరణ README.md‌ను ప్రారంభికుల‌కు మరింత సులభంగా ఉండేలా గణనీయంగా మెరుగుపరుస్తుంది మరియు AI డెవలపర్స్ కోసం అవసరమైన వనరులను జోడిస్తుంది.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: ప్రతి టూల్‌ను ఎప్పుడు ఉపయోగించాలో స్పష్టమైన వివరణ ఉదాహరణలతో
- **🌟 Awesome AZD Links**: కమ్యూనిటీ టెంప్లేట్ గ్యాలరీకి మరియు సహకార వనరులకు నేరుగా లింకులు:
  - [ఆసక్తికరమైన AZD గ్యాలరీ](https://azure.github.io/awesome-azd/) - 200+ అమర్చడానికి సిద్ధమైన టెంప్లేట్లు
  - [టెంప్లేట్ సమర్పించండి](https://github.com/Azure/awesome-azd/issues) - కమ్యూనిటీ సహకారం
- **🎯 Quick Start Guide**: సరళీకృత 3-స్టెప్ గెట్ స్టార్ట్ సెక్షన్ (ఇన్‌స్టాల్ → లాగిన్ → డిప్లాయ్)
- **📊 Experience-Based Navigation Table**: డెవలపర్ అనుభవం ఆధారంగా ఎక్కడ మొదలుపెట్టాలో స్పష్టమైన మార్గదర్శకం

#### Changed
- **README Structure**: ప్రోగ్రెసివ్ డిస్క్లోజర్ కోసం పునఃసంఘటించబడింది - కీలక సమాచారం ముందుగా
- **Introduction Section**: "The Magic of `azd up`" ను పూర్తిగా కొత్తవిధంగా వివరించడానికి పునఃరాయించబడింది
- **Removed Duplicate Content**: కనిపించిన డూప్లికేట్ ట్రబుల్‌షూటింగ్ సెక్షన్ తొలగింపబడింది
- **Troubleshooting Commands**: `azd logs` సూచనను సరైన `azd monitor --logs` కు సవరించారు

#### Fixed
- **🔐 Authentication Commands**: `azd auth login` మరియు `azd auth logout` ను cheat-sheet.mdలో జోడించారు
- **Invalid Command References**: README ట్రబుల్‌షూటింగ్ సెక్షన్ నుంచి మిగిలివున్న `azd logs` సూచనలను తీసివేశారు

#### Notes
- **Scope**: మార్పులు మెయిన్ README.md మరియు resources/cheat-sheet.md పై వర్తించాయి
- **Target Audience**: మార్పులు విశేషంగా AZD కొత్తవారిని దృష్టిలో పెట్టుకొని చేయబడ్డాయి

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**ఈ సంస్కరణ డాక్యుమెంటేషన్‌లోని లేనివి అయిన AZD కమాండ్లను సరిచేసి అన్ని కోడ్ ఉదాహరణలు సరైన Azure Developer CLI సింటాక్స్‌ను ఉపయోగించేలా చేస్తుంది.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: అవాస్తవ AZD కమాండ్లకు సమగ్ర ఆడిట్ మరియు సవరణ చేయబడ్డాయి:
  - `azd logs` (అదృశ్యమైనది) → `azd monitor --logs` లేదా Azure CLI ప్రత్యామ్నాయాలతో మార్చబడింది
  - `azd service` ఉపకమాండ్లు (లేవు) → `azd show` మరియు Azure CLI తో మార్చబడింది
  - `azd infra import/export/validate` (లేవు) → తీసివేయబడింది లేదా సరైన ప్రత్యామ్నాయాలతో మార్చబడింది
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ఫ్లాగ్లు (లేవు) → తీసివేయబడ్డాయి
  - `azd provision --what-if/--rollback` ఫ్లాగ్లు (లేవు) → `--preview` ఉపయోగించేలా నవీకరించబడ్డాయి
  - `azd config validate` (లేవు) → `azd config list` తో మార్చబడింది
  - `azd info`, `azd history`, `azd metrics` (లేవు) → తీసివేయబడ్డాయి

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: కమాండ్ రిఫరెన్స్‌లో పెద్ద మార్పు
  - `docs/deployment/deployment-guide.md`: రోల్‌బ్యాక్ మరియు డిప్లాయ్‌మెంట్ వ్యూహాలు సరి చేసి మార్పు
  - `docs/troubleshooting/debugging.md`: లాగ్ విశ్లేషణ సెక్షన్లు సరి చేయబడ్డాయి
  - `docs/troubleshooting/common-issues.md`: ట్రబుల్‌షూటింగ్ కమాండ్లు నవీకరించబడ్డాయి
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD డీబగ్గింగ్ సెక్షన్ సరి చేయబడ్డింది
  - `docs/getting-started/azd-basics.md`: మానిటరింగ్ కమాండ్లు సరి చేయబడ్డాయి
  - `docs/getting-started/first-project.md`: మానిటరింగ్ మరియు డీబగ్గింగ్ ఉదాహరణలు నవీకరించబడ్డాయి
  - `docs/getting-started/installation.md`: హెల్ప్ మరియు వెర్షన్ ఉదాహరణలు సరిచేయబడ్డాయి
  - `docs/pre-deployment/application-insights.md`: లాగ్ చూపించే కమాండ్లు సరిచేయబడ్డాయి
  - `docs/pre-deployment/coordination-patterns.md`: ఏజెంట్ డీబగ్గింగ్ కమాండ్లు సరి చేయబడ్డాయి

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: హార్డ్‌కోడ్డెడ్ `1.5.0` వెర్షన్‌ను సాధారణ `1.x.x` గా మార్చి రిలీజ్‌లకు లింక్ జోడించబడింది

#### Changed
- **Rollback Strategies**: AZD కు స్థానిక రోల్‌బ్యాక్ లభ్యం కనుక గిట్ ఆధారిత రోల్‌బ్యాక్ ను ఉపయోగించేలా డాక్యుమెంటేషన్ నవీకరించబడింది
- **Log Viewing**: `azd logs` సూచనలను `azd monitor --logs`, `azd monitor --live`, మరియు Azure CLI కమాండ్లతో మార్చబడింది
- **Performance Section**: లేని ప్యారలల్/ఇన్క్రిమెంటల్ డిప్లాయ్‌మెంట్ ఫ్లాగ్‌లను తీసివేసి వినియోగార్ధ సరైన ప్రత్యామ్నాయాలు అందించబడ్డాయి

#### Technical Details
- **చెల్లుబాటు అయ్యే AZD కమాండ్లు**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **చెల్లుబాటు అయ్యే azd monitor ఫ్లాగ్‌లు**: `--live`, `--logs`, `--overview`
- **తొలగించిన ఫీచర్లు**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### గమనికలు
- **పరిశీలన**: కమాండ్లు Azure Developer CLI v1.23.x న ఆధారంగా ధృవీకరించబడ్డాయి

---

### [v3.9.0] - 2026-02-05

#### వర్క్‌షాప్ పూర్తి చేయడం మరియు డాక్యుమెంటేషన్ నాణ్యత నవీకరణ
**ఈ వెర్షన్ ఇంటరాక్టివ్ వర్క్‌షాప్ మాడ్యూల్స్‌ను పూర్తి చేస్తుంది, అన్ని విరిగిన డాక్యుమెంట్ లింకులను సరిచేస్తుంది, మరియు Microsoft AZD వినియోగించే AI డెవలపర్ల కోసం మొత్తం కంటెంట్ నాణ్యతను మెరుగుపరుస్తుంది.**

#### చేర్చబడినవి
- **📝 CONTRIBUTING.md**: CONTRIBUTING.md కొత్త కాంట్రిబ్యూషన్ మార్గదర్శకాల డాక్యుమెంట్‌తో:
  - సమస్యలు నివేదించడం మరియు మార్పులను ప్రతిపాదించడం కోసం స్పష్టమైన సూచనలు
  - కొత్త కంటెంట్ కోసం డాక్యుమెంటేషన్ ప్రమాణాలు
  - కోడ్ ఉదాహరణల మార్గదర్శకాలు మరియు కమిట్ మెసేజ్ సంప్రదాయాలు
  - కమ్యూనిటీ పాల్గొనడం సంబంధించిన సమాచారం

#### పూర్తయినవి
- **🎯 వర్క్‌షాప్ మాడ్యూల్ 7 (సారాంశం)**: పూర్తిగా పూర్తి చేసిన సారాంశ మాడ్యూల్ తో:
  - వర్క్‌షాప్ విజయాల సమగ్ర సారాంశం
  - AZD, టెంప్లేట్లు, మరియు Microsoft Foundry గురించి కీలక కాన్సెప్ట్స్ విభాగం
  - నేర్చుకునే ప్రయాణాన్ని కొనసాగించే సిఫార్సులు
  - సమస్య నైపుణ్యాల వారితో వర్క్‌షాప్ ఛాలెంజ్ వ్యాయామాలు
  - కమ్యూనిటీ ప్రతిస్పందన మరియు సపోర్ట్ లింకులు

- **📚 వర్క్‌షాప్ మాడ్యూల్ 3 (విభజన)**: నవీకరించిన అభ్యసన లక్ష్యాలతో:
  - GitHub Copilot మరియు MCP సర్వర్లను సక్రియంచేసే మార్గదర్శకాలు
  - AZD టెంప్లేట్ ఫోల్డర్ నిర్మాణం అవగాహన
  - Infrastructure-as-code (Bicep) నిర్వహణ నమూనాలు
  - హ్యాండ్స్-ఆన్ ల్యాబ్ సూచనలు

- **🔧 వర్క్‌షాప్ మాడ్యూల్ 6 (తీయడం)**: పూర్తయింది ఇది:
  - వనరుల క్లీనప్ మరియు ఖర్చు నిర్వాహణ లక్ష్యాలు
  - భద్రంగా ఇన్‌ఫ్రాస్ట్రక్చర్ డీప్రొవిజనింగ్ కోసం `azd down` వాడకం
  - సాఫ్ట్-డిలీట్ చేసిన cognitive సేవల పునరుద్ధరణ మార్గదర్శకము
  - GitHub Copilot మరియు Azure పోర్టల్ కోసం బోనస్ అన్వేషణ ప్రశ్నలు

#### సరిచేసినవి
- **🔗 బ్రోకెన్ లింక్‌ల ఫిక్సులు**: 15+ విరిగిన లోపల డాక్యుమెంటేషన్ లింకులను పరిష్కరించబడింది:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md కు మార్గాలను సరిచేశారు
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md మరియు production-ai-practices.md మార్గాలను సరిచేశారు
  - `docs/getting-started/first-project.md`: లేదు అయిన cicd-integration.md ని deployment-guide.md తో మార్చారు
  - `examples/retail-scenario.md`: FAQ మరియు ట్రబుల్‌షూటింగ్ గైడ్ మార్గాలను సరిచేశారు
  - `examples/container-app/microservices/README.md`: కోర్సు హోమ్ మరియు డిప్లాయ్‌మెంట్ గైడ్ మార్గాలను సరిచేశారు
  - `resources/faq.md` మరియు `resources/glossary.md`: AI అధ్యాయం సూచనలను నవీకరించారు
  - `course-outline.md`: ఇన్స్ట్రక్టర్ గైడ్ మరియు AI వర్క్‌షాప్ ల్యాబ్ సూచనలను సరిచేశారు

- **📅 వర్క్‌షాప్ స్థితి బ్యానర్**: "Under Construction" నుండి ఫిబ్రవరి 2026 తేదీతో యాక్టివ్ వర్క్‌షాప్ స్థితికి నవీకరించబడింది

- **🔗 వర్క్‌షాప్ నావిగేషన్**: workshop README.mdలోని బ్రోకెన్ నావిగేషన్ లింకులు lab-1-azd-basics ఫోల్డర్ లేమికి సూచించే సమస్యను సరిచేశారు

#### మార్చబడింది
- **వర్క్‌షాప్ ప్రదర్శన**: "under construction" హెచ్చరికను తీసివేశారు, వర్క్‌షాప్ ఇప్పుడు పూర్తి అయింది మరియు ఉపయోగానికి సిద్ధంగా ఉంది
- **నావిగేషన్ సారూప్యము**: అన్ని వర్క్‌షాప్ మాడ్యూల్స్‌కు సరైన అంతర్మాడ్యూల్ నావిగేషన్ నిర్ధారించింది
- **లెర్నింగ్ పాథ్ సూచనలు**: microsoft-foundry మార్గాలను ఉపయోగించుకోవడానికి అధ్యాయ అనువర్తన క్రాస్-రెఫరెన్సులను నవీకరించారు

#### ధృవీకరణలు
- ✅ అన్ని ఆంగ్ల మార్క్డౌన్ ఫైళ్లలో సరైన అంతర్గత లింకులు ఉన్నాయి
- ✅ వర్క్‌షాప్ మాడ్యూల్స్ 0-7 అభ్యసన లక్ష్యాలతో పూర్తి చేయబడ్డాయి
- ✅ అధ్యాయాల మరియు మాడ్యూల్స్ మధ్య నావిగేషన్ సక్రమంగా పనిచేస్తుంది
- ✅ కంటెంట్ Microsoft AZD ఉపయోగించే AI డెవలపర్ల కోసం అనుకూలంగా ఉంది
- ✅ ప్రారంభ స్థాయి ఉపయోగకర్తలకు అనుకూలమైన భాషా మరియు నిర్మాణం కొనసాగించి ఉంచబడింది
- ✅ CONTRIBUTING.md కమ్యూనిటీ కాంట్రిబ్యూటర్లకు స్పష్టమైన మార్గదర్శకాలను అందిస్తుంది

#### సాంకేతిక అమలు
- **లింక్ ధృవీకరణ**: ఆటోమేటెడ్ PowerShell స్క్రిప్ట్ అన్ని .md అంతర్గత లింకులను ధృవీకరించింది
- **కంటెంట్ ఆడిట్**: వర్క్‌షాప్ సంపూర్ణత మరియు ప్రారంభోపయోగకుడు అనుకూలతకు మాన్యువల్ సమీక్ష
- **నావిగేషన్ సిస్టమ్**: స్థిరమైన అధ్యాయ మరియు మాడ్యూల్ నావిగేషన్ నమూనాలను వర్తింపజేశారు

#### గమనికలు
- **పరిధి**: మార్పులు కేవలం ఆంగ్ల డాక్యుమెంటేషన్‌కు వర్తించాయి
- **అనువాదాలు**: ఈ వెర్షన్‌లో అనువాద ఫోల్డర్లు నవీకరించబడలేదు (ఆటోమేటెడ్ అనువాదం পরে సమకరించబడుతుంది)
- **వర్క్‌షాప్ వ్యవధి**: పూర్తి వర్క్‌షాప్ ఇప్పుడు 3-4 గంటల హ్యాండ్స్-ఆన్ అభ్యాసాన్ని అందిస్తుంది

---

### [v3.8.0] - 2025-11-19

#### అధునాతన డాక్యుమెంటేషన్: మానిటరింగ్, సెక్యూరిటీ, మరియు మల్టీ-ఏజెంట్ నమూనాలు
**ఈ వెర్షన్ Application Insights ఇంటిగ్రేషన్, ప్రమాణీకరణ నమూనాలు మరియు ప్రొడక్షన్ డిప్లాయ్‌మెంట్‌ల కోసం బహుళ-ఏజెంట్ సమన్వయం పై పూర్తి స్థాయి A-గ్రేడ్ పాఠ్యాంశాలను జోడిస్తుంది.**

#### చేర్చబడినవి
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md`లో:
  - ఆటోమాటిక్ ప్రావిజనింగ్‌తో AZD-కేంద్రీకృత డిప్లాయ్‌మెంట్
  - Application Insights + Log Analytics కోసం పూర్తి Bicep టెంప్లేట్లు
  - కస్టమ్ టెలిమెట్రీతో పనిచేసే Python అప్లికేషన్లు (1,200+ లైన్స్)
  - AI/LLM మానిటరింగ్ నమూనాలు (Microsoft Foundry Models టోకెన్/ఖరాయి ట్రాకింగ్)
  - 6 Mermaid డయాగ్రామ్‌లు (ఆర్కిటెక్చర్, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్, టెలిమెట్రీ ఫ్లో)
  - 3 హ్యాండ్స్-ఆన్ వ్యాయామాలు (అలర్ట్స్, డాష్బోర్డ్స్, AI మానిటరింగ్)
  - Kusto క్వెరీ ఉదాహరణలు మరియు ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలు
  - లైవ్ మెట్రిక్స్ స్ట్రీమింగ్ మరియు రియల్-టైమ్ డీబగ్గింగ్
  - ఉత్పత్తి-సిద్ధ నమూనులతో 40-50 నిమిషాల నేర్చుకునే సమయం

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md`లో:
  - 3 ప్రమాణీకరణ నమూనాలు (connection strings, Key Vault, managed identity)
  - సురక్షిత డిప్లాయ్‌మెంట్‌ల కోసం పూర్తి Bicep ఇన్‌ఫ్రాస్ట్రంత్రెక్చర్ టెంప్లేట్లు
  - Azure SDK ఇంటిగ్రేషన్‌తో Node.js అప్లికేషన్ కోడ్
  - 3 పూర్తి వ్యాయామాలు (managed identity ప్రారంభించడం, user-assigned identity, Key Vault రొటేషన్)
  - భద్రత ఉత్తమ ఆచరణలు మరియు RBAC కాన్ఫిగరేషన్లు
  - ట్రబుల్‌షూటింగ్ గైడ్ మరియు ఖర్చు విశ్లేషణ
  - ప్రొడక్షన్-సిద్ధ్ పాస్వర్డ్‌లెస్ ప్రమాణీకరణ నమూనాలు

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md`లో:
  - 5 సమన్వయ నమూనాలు (క్రమం వారీగా, సమాంతర, హైరార్కికల్, ఈవెంట్-డ్రివెన్, కన్సెన్సస్)
  - పూర్తి ఆర్కెస్ట్రేటర్ సర్వీస్ అమలు (Python/Flask, 1,500+ లైన్స్)
  - 3 ప్రత్యేక ఏజెంట్ అమలులు (Research, Writer, Editor)
  - మెసేజ్ క్యూయింగ్ కోసం Service Bus ఇంటిగ్రేషన్
  - డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్ కోసం Cosmos DB స్థితి నిర్వహణ
  - ఏజెంట్ పరస్పర చర్యలను చూపించే 6 Mermaid డయాగ్రామ్‌లు
  - 3 అధునాతన వ్యాయామాలు (timeout హాండ్లింగ్, retry లాజిక్, circuit breaker)
  - ఖర్చు బ్రేక్‌డౌన్ ($240-565/నెల) మరియు ఆప్టిమైజేషన్ వ్యూహాలు
  - మానిటరింగ్ కోసం Application Insights ఇంటిగ్రేషన్

#### మెరుగుపరచబడింది
- **Pre-deployment అధ్యాయము**: ఇప్పుడు విస్తృతమైన మానిటరింగ్ మరియు సమన్వయ నమూనాలు చేర్చబడ్డాయి
- **Getting Started అధ్యాయము**: ప్రొఫెషనల్ ప్రమాణీకరణ నమూనాలతో మెరుగు చేయబడింది
- **Production Readiness**: సెక్యూరిటీ నుంచి ఆబ్జర్వబిలిటీ వరకు సంపూర్ణ కవర్‌యాజ్
- **Course Outline**: అధ్యాయాలు 3 మరియు 6 లోని కొత్త పాఠ్యాంశాలను సూచించడానికి నవీకరించబడింది

#### మార్చబడింది
- **అభ్యసన పురోగతి**: కోర్సు అంతర్భాగంగా భద్రత మరియు మానిటరింగ్ అంతర్గతంగా మెరుగ్గా సమన్వయం చేయబడింది
- **డాక్యుమెంటేషన్ నాణ్యత**: కొత్త పాఠ్యాంశాలలో స్థిరమైన A-గ్రేడ్ ప్రమాణాలు (95-97%)
- **ప్రొడక్షన్ నమూనాలు**: ఎంటర్‌ప్రైజ్ డిప్లాయ్‌మెంట్స్ కోసం పూర్తి end-to-end కవర్‌యాజ్

#### మెరుగుపడింది
- **డెవలపర్ అనుభవం**: డెవలప్‌మెంట్ నుండి ప్రొడక్షన్ మానిటరింగ్ వరకు స్పష్టమైన మార్గం
- **భద్రత ప్రమాణాలు**: ప్రమాణీకరణ మరియు సీక్రెట్స్ నిర్వహణలో ప్రొఫెషనల్ నమూనాలు
- **ఆబ్జర్వబిలిటీ**: AZD తో పూర్తి Application Insights ఇంటిగ్రేషన్
- **AI వర్క్‌లోడ్స్**: Microsoft Foundry Models మరియు మల్టీ-ఏజెంట్ సిస్టమ్స్ కోసం ప్రత్యేక మానిటరింగ్

#### ధృవీకరణలు
- ✅ అన్ని పాఠ్యాంశాలూ పూర్తి పనిచేసే కోడ్ (స్నిపెట్లు కాకుండా) ఉన్నాయి
- ✅ విజువల్ అభ్యసన కోసం Mermaid డయాగ్రామ్‌లు (మొత్తం 19 across 3 lessons)
- ✅ హ్యాండ్స్-ఆన్ వ్యాయామాలు ధృవీకరణ దశలతో (మొత్తం 9)
- ✅ `azd up` ద్వారా డిప్లాయ్ చేయగల ప్రొడక్షన్-సిద్ధ Bicep టెంప్లేట్లు
- ✅ ఖర్చు విశ్లేషణ మరియు ఆప్టిమైజేషన్ వ్యూహాలు
- ✅ ట్రబుల్‌షూటింగ్ గైడ్స్ మరియు ఉత్తమ ఆచరణలు
- ✅ జ్ఞాన చెక్పాయింట్లు ధృవీకరణ కమాండ్లతో

#### డాక్యుమెంటేషన్ గ్రేడింగ్ ఫలితాలు
- **docs/pre-deployment/application-insights.md**: - సమగ్ర మానిటరింగ్ గైడ్
- **docs/getting-started/authsecurity.md**: - ప్రొఫెషనల్ భద్రత నమూనాలు
- **docs/pre-deployment/coordination-patterns.md**: - అధునాతన మల్టీ-ఏజెంట్ ఆర్కిటెక్చర్స్
- **కొత్త కంటెంట్ మొత్తం**: - స్థిరమైన ఉన్నత నాణ్యత ప్రమాణాలు

#### సాంకేతిక అమలు
- **Application Insights**: Log Analytics + కస్టమ్ టెలిమెట్రీ + డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్
- **Authentication**: Managed Identity + Key Vault + RBAC నమూనాలు
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ఆర్కెస్ట్రేషన్
- **Monitoring**: లైవ్ మెట్రిక్స్ + Kusto క్వెరీస్ + అలర్ట్స్ + డాష్బోర్డ్స్
- **Cost Management**: శాంప్లింగ్ వ్యూహాలు, రిటెన్షన్ పాలసీలు, బ‌డ్జెట్ నియంత్రణలు

### [v3.7.0] - 2025-11-19

#### డాక్యుమెంటేషన్ నాణ్యత మెరుగుదలలు మరియు కొత్త Microsoft Foundry Models ఉదాహరణ
**ఈ వెర్షన్ రిపోజిటరీలోని డాక్యుమెంటేషన్ నాణ్యతను పెంచి Microsoft Foundry Models యొక్క పూర్తి డిప్లాయ్‌మెంట్ ఉదాహరణను gpt-4.1 చాట్ ఇంటర్‌ఫేస్‌తో జోడిస్తుంది.**

#### చేర్చబడినవి
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/`లో పూర్తి gpt-4.1 డిప్లాయ్‌మెంట్ మరియు పనిచేసే అమలు:
  - Microsoft Foundry Models ఇన్‌ఫ్రాస్ట్రక్చర్ పూర్తి (gpt-4.1 మోడల్ డిప్లాయ్‌మెంట్)
  - సంభాషణ చరిత్రతో Python కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్
  - సురక్షిత API కీ నిల్వ కోసం Key Vault ఇంటిగ్రేషన్
  - టోకెన్ వినియోగ ట్రాకింగ్ మరియు ఖర్చు అంచనా
  - రేట్ లిమిటింగ్ మరియు లోపాల నిర్వహణ
  - 35-45 నిమిషాల డిప్లాయ్‌మెంట్ గైడ్‌తో సమగ్ర README
  - 11 ప్రొడక్షన్-సిద్ధైన ఫైళ్ళు (Bicep టెంప్లేట్లు, Python యాప్, కాన్ఫిగరేషన్)
- **📚 డాక్యుమెంటేషన్ వ్యాయామాలు**: కాన్ఫిగరేషన్ గైడ్‌కు హ్యాండ్స్-ఆన్ అభ్యాసాలు జోడించబడ్డాయి:
  - వ్యాయామం 1: బహు-పరిస్థితుల కాన్ఫిగరేషన్ (15 నిమిషాలు)
  - వ్యాయామం 2: సీక్రెట్ నిర్వహణ అభ్యాసం (10 నిమిషాలు)
  - స్పష్టం చేసిన విజయ критерియాలు మరియు ధృవీకరణ దశలు
- **✅ డిప్లాయ్‌మెంట్ ధృవీకరణ**: డిప్లాయ్‌మెంట్ గైడ్‌కు ధృవీకరణ విభాగం జోడించబడింది:
  - ఆరోగ్య పరీక్షా విధానాలు
  - విజయం కోసం చెక్సాక్షెట్
  - అన్ని డిప్లాయ్‌మెంట్ కమాండ్లకు కోసం నిర్దిష్ట అవుట్పుట్‌లు
  - ట్రబుల్‌షూటింగ్ తక్షణ సూచిబొట్టు

#### మెరుగుపరచబడింది
- **examples/README.md**: A-గ్రేడ్ నాణ్యతకు నవీకరించబడింది (93%):
  - azure-openai-chat అన్ని సంబంధిత విభాగాలకు జోడించబడింది
  - స్థానిక ఉదాహరణల సంఖ్య 3 నుండి 4 కి అప్‌డేట్ చేయబడింది
  - AI అప్లికేషన్ ఉదాహరణల పట్టికలో చేర్చబడింది
  - ఇంటర్మీడియెట్ వినియోగకర్తల కోసం క్విక్ స్టార్ట్‌లో సమగ్రంగా చేర్చబడింది
  - Microsoft Foundry టెంప్లేట్స్ విభాగంలో చేర్చబడింది
  - కంపెరిసన్ మ్యాట్రిక్స్ మరియు టెక్నాలజీ కనుగొనటానికి విభాగాలు నవీకరించబడ్డాయి
- **డాక్యుమెంటేషన్ నాణ్యత**: B+ (87%) → A- (92%) గా మెరుగైంది:
  - ముఖ్య కమాండ్ ఉదాహరణలకు ఆశించిన అవుట్పుట్‌లు జోడించబడ్డాయి
  - కాన్ఫిగరేషన్ మార్పుల కోసం ధృవీకరణ దశలు చేర్చబడ్డాయి
  - ప్రాక్టికల్ వ్యాయామాలతో హ్యాండ్స్-ఆన్ నేర్చుకునే విధానం మెరుగు చేయబడింది

#### మార్చబడింది
- **అభ్యసన పురోగతి**: ఇంటర్మీడియట్ లెవల్ అభ్యసకుల కోసం AI ఉదాహరణల మంచి సమన్వయం
- **డాక్యుమెంటేషన్ నిర్మాణం**: స్పష్టమైన ఫలితాలతో మరింత అమలు చేయదగిన వ్యాయామాలు
- **ధృవీకరణ ప్రక్రియ**: కీలక వర్క్‌ఫ్లోలకు స్పష్టమైన విజయ ప్రమాణాలు జోడించబడ్డాయి

#### మెరుగుపడింది
- **డెవలపర్ అనుభవం**: Microsoft Foundry Models డిప్లాయ్‌మెంట్ ఇప్పుడు 35-45 నిమిషాల్లో పూర్తి అవుతుంది (స్పష్టమైన ప్రత్యామ్నాయాల 60-90 నిమిషాలతో పోల్చితే)
- **ఖర్చు పారదర్శకత**: Microsoft Foundry Models ఉదాహరణ కోసం స్పష్టం ఖర్చు అంచనాలు ($50-200/నెల)
- **లెర్నింగ్ పాత్**: AI డెవలపర్లకు azure-openai-chat తో స్పష్టమైన ఎంట్రీ పాయింట్
- **డాక్యుమెంటేషన్ ప్రమాణాలు**: నిర్దిష్ట ఆశించిన అవుట్పుట్‌లు మరియు ధృవీకరణ దశలు స్థిరంగా ఉన్నాయి

#### ధృవీకరణలు
- ✅ Microsoft Foundry Models ఉదాహరణ `azd up` తో పూర్తిగా పనిచేస్తుంది
- ✅ అన్ని 11 అమలు ఫైళ్ల సింటాక్స్ సరిగ్గా ఉన్నాయి
- ✅ README సూచనలు వాస్తవ డిప్లాయ్‌మెంట్ అనుభవానికి సరిపోతున్నాయి
- ✅ డాక్యుమెంటేషన్ లింకులు 8+ స్థానాల్లో నవీకరించబడ్డాయి
- ✅ ఉదాహరణల సూచిక స్థానిక 4 ఉదాహరణలను ఖచ్చితంగా ప్రతిబింబిస్తోంది
- ✅ పట్టికలలో తిరిగి తిరిగి వచ్చిన బాహ్య లింకులు లేవు
- ✅ అన్ని నావిగేషన్ సూచనలు సక్రమంగా ఉన్నాయి

#### సాంకేతిక అమలు
- **Microsoft Foundry Models ఆర్కిటెక్చర్**: gpt-4.1 + Key Vault + Container Apps నమూనా
- **భద్రత**: Managed Identity సిద్ధంగా, రహస్యాలు Key Vault లో
- **మానిటరింగ్**: Application Insights ఇంటిగ్రేషన్
- **ఖర్చు నిర్వహణ**: టోకెన్ ట్రాకింగ్ మరియు వినియోగ ఆప్టిమైజేషన్
- **డిప్లాయ్‌మెంట్**: సంపూర్ణ సెటప్ కోసం ఒక్కటి `azd up` కమాండ్

### [v3.6.0] - 2025-11-19

#### ప్రధాన నవీకరణ: Container App డిప్లాయ్‌మెంట్ ఉదాహరణలు
**ఈ వెర్షన్ Azure Developer CLI (AZD) ఉపయోగించి పూర్తి, ప్రొడక్షన్-సిద్ధ కంటైనర్ అప్లికేషన్ డిప్లాయ్‌మెంట్ ఉదాహరణలను పరిచయం చేస్తుంది, పూర్తి డాక్యుమెంటేషన్ మరియు లెర్నింగ్ పాత్ ఇంటిగ్రేషన్‌తో.**

#### చేర్చబడినవి
- **🚀 Container App Examples**: కొత్త స్థానిక ఉదాహరణలు `examples/container-app/`లో:
  - [Master Guide](examples/container-app/README.md): కంటైనర్ డిప్లాయ్‌మెంట్ల పూర్తి అవలోకనం, క్విక్ స్టార్ట్, ప్రొడక్షన్ మరియు అధునాతన నమూనాలు
  - [Simple Flask API](../../examples/container-app/simple-flask-api): స్కేల్డ్-టు-జీరో, హెల్త్ ప్రోబ్స్, మానిటరింగ్ మరియు ట్రబుల్‌షూటింగ్ తో ప్రారంభోపయోగ REST API
  - [Microservices Architecture](../../examples/container-app/microservices): ప్రొడక్షన్-సిద్ధ బహు-సర్వీస్ డిప్లాయ్‌మెంట్ (API గేట్‌వే, Product, Order, User, Notification), అసంక్రానస్ మెసేజింగ్, Service Bus, Cosmos DB, Azure SQL, డిస్ట్రిబ్యూటెడ్ ట్రейсింగ్, బ్లూ-గ్రీన్/కేనరీ డిప్లాయ్‌మెంట్
- **ఉత్తమ ఆచరణలు**: కంటైనర్ వర్క్‌లోడ్స్ కోసం భద్రత, మానిటరింగ్, ఖర్చు ఆప్టిమైజేషన్ మరియు CI/CD మార్గదర్శకాలు
- **కోడ్ నమూనాలు**: పూర్తి `azure.yaml`, Bicep టెంప్లేట్లు, మరియు బహుభాషా సర్వీస్ అమలు (Python, Node.js, C#, Go)
- **టెస్టింగ్ & ట్రబుల్‌షూటింగ్**: end-to-end టెస్ట్ సన్నివేశాలు, మానిటరింగ్ కమాండ్లు, ట్రబుల్‌షూటింగ్ మార్గదర్శకాలు

#### Changed
- **README.md**: "Local Examples - Container Applications" కింద కొత్త container app ఉదాహరణలను ప్రదర్శించడానికి మరియు లింక్ చేయడానికి నవీకరించబడింది
- **examples/README.md**: container app ఉదాహరణలను హైలైట్ చేయడానికి, సరిపోలింపు మ్యాట్రిక్స్ ఎంట్రీలు జోడించడానికి, మరియు టెక్నాలజీ/ఆర్కిటెక్చర్ సూచనలను నవీకరించడానికి సవరించబడింది
- **Course Outline & Study Guide**: సంబంధిత అధ్యాయాలలో కొత్త container app ఉదాహరణలు మరియు డిప్లాయ్‌మెంట్ నమూనాలను సూచించడానికి నవీకరించబడింది

#### Validated
- ✅ అన్ని కొత్త ఉదాహరణలు `azd up` తో డిప్లాయ్ చేయగలవు మరియు ఉత్తమ ప్రాక్టీసుల్ని అనుసరిస్తాయి
- ✅ డాక్యుమెంటేషన్ క్రాస్-లింకులు మరియు నావిగేషన్ నవీకరించబడ్డాయి
- ✅ ఉదాహరణలు ప్రారంభకుడు నుండి అడ్వాన్స్డ్ పరిస్థితుల వరకు, ఉత్పత్తి మైక్రోసర్వీసులను కూడా కలిగి ఉంటాయి

#### Notes
- **Scope**: ఇంగ్లీష్ డాక్యుమెంటేషన్ మరియు ఉదాహరణలు మాత్రమే
- **Next Steps**: భవిష్యత్ రిలీజ్‌లలో అదనపు అడ్వాన్స్డ్ కంటెయినర్ నమూనాలు మరియు CI/CD ఆటోమేషన్‌ను విస్తరించాలి

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implements a comprehensive product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" నుండి "Microsoft Foundry" వరకు పూర్తి rebranding
  - అన్ని ఇంగ్లీష్ డాక్యుమెంటేషన్‌లో `docs/` ఫోల్డర్లోని సూచనలను నవీకరించింది
  - ఫోల్డర్ పేరు మార్చబడింది: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ఫైల్ పేరు మార్చబడింది: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - మొత్తం: 7 డాక్యుమెంటేషన్ ఫైళ్ళలో 23 కంటెంట్ సూచనల్ని నవీకరించబడినవి

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` పేరు మార్చి `docs/microsoft-foundry/` అయ్యింది
  - కొత్త ఫోల్డర్ స్ట్రక్చర్‌ను ప్రతిబింబించడానికి అన్ని క్రాస్-రెఫరెన్స్‌లు నవీకరించబడ్డాయి
  - అన్ని డాక్యుమెంటేషన్‌లో నావిగేషన్ లింకులు సరైనదిగా ధృవీకరించబడ్డాయి

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - అన్ని అంతర్గత లింకులు కొత్త ఫైల్ నామానికి సూచించడానికి నవీకరించబడ్డాయి

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 నావిగేషన్ లింక్ నవీకరణలు
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ప్రోడక్ట్ పేరు సూచనల్ని నవీకరించబడింది
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ఇప్పటికే Microsoft Foundry ఉపయోగిస్తోంది (గత నవీకరణల నుండి)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 సూచనల్ని నవీకరించబడింది (అవలోకనం, కమ్యూనిటీ ఫీడ్‌బ్యాక్, డాక్యుమెంటేషన్)
  - `docs/getting-started/azd-basics.md` - 4 క్రాస్-రెఫరెన్స్ లింక్ నవీకరణలు
  - `docs/getting-started/first-project.md` - 2 అధ్యాయం నావిగేషన్ లింక్ నవీకరణలు
  - `docs/getting-started/installation.md` - 2 తదుపరి అధ్యాయం లింక్ నవీకరణలు
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 సూచనల్ని నవీకరించబడింది (నావిగేషన్, Discord కమ్యూనిటీ)
  - `docs/troubleshooting/common-issues.md` - 1 నావిగేషన్ లింక్ నవీకరణ
  - `docs/troubleshooting/debugging.md` - 1 నావిగేషన్ లింక్ నవీకరణ

- **Course Structure Files** (2 files):
  - `README.md` - 17 సూచనల్ని నవీకరించింది (కోర్సు అవలోకనం, అధ్యాయ శీర్షికలు, టెంప్లేట్స్ సెక్షన్, కమ్యూనిటీ ఇన్సైట్స్)
  - `course-outline.md` - 14 సూచనల్ని నవీకరించింది (అవలోకనం, అధ్యయన లక్ష్యాలు, అధ్యాయం వనరులు)

#### Validated
- ✅ English docs లో ఎక్కడా "ai-foundry" ఫోల్డర్ పాత్ సూచనలు మిగలవు కాదు
- ✅ English docs లో "Microsoft Foundry" ప్రోడక్ట్ పేరుకు సంబంధించిన మిగిలిన సూచనలు లేవు
- ✅ కొత్త ఫోల్డర్ స్ట్రక్చర్‌తో అన్ని నావిగేషన్ లింకులు పనిలో ఉన్నాయి
- ✅ ఫైల్ మరియు ఫోల్డర్ పేర్ల మార్పులు విజయవంతంగా పూర్తయ్యాయి
- ✅ అధ్యాయాల మధ్య క్రాస్-రెఫరెన్సులు ధృవీకరించబడ్డాయి

#### Notes
- **Scope**: మార్పులు `docs/` ఫోల్డర్లోని ఇంగ్లీష్ డాక్యుమెంటేషన్‌కి మాత్రమే వర్తిస్తాయి
- **Translations**: అనువాద ఫోల్డర్లు (`translations/`) ఈ వెర్షన్‌లో అప్డేట్ కాలేదు
- **Workshop**: వర్క్‌షాప్ మెటీరియల్స్ (`workshop/`) ఈ వెర్షన్‌లో అప్డేట్ కాలేదు
- **Examples**: ఉదాహరణ ఫైళ్ళలో ఇంకా లెగసీ నామకరణ సూచనలు ఉండవచ్చు (భవిష్యత్తులో పరిష్కరించబడును)
- **External Links**: బాహ్య URLలు మరియు GitHub రిపోజిటరీ సూచనలు అపరివర్తಿತంగా ఉన్నాయి

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
- **🧪 azd provision --preview Feature Documentation**: కొత్త ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ సామర్థ్యం గురించి సమగ్ర కవరేజ్
  - కమాండ్ రిఫరెన్స్ మరియు చిట్కా షీట్‌లో ఉపయోగ ఉదాహరణలు
  - ప్రావిజనింగ్ గైడ్‌లో ఉష్టయోగాలు మరియు లాభాలతో వివరణాత్మక ఇంటిగ్రేషన్
  - సురక్షిత డిప్లాయ్‌మెంట్ పర్వతానికి ముందస్తు-పరీక్ష (Pre-flight) సమగ్రత
  - సేఫ్టీ-ఫస్ట్ డిప్లాయ్‌మెంట్ ప్రాక్టీసులతో గెట్‌స్టార్ట్ గైడ్ నవీకరణలు
- **🚧 Workshop Status Banner**: వర్క్‌షాప్ అభివృద్ధి స్థితిని సూచించే ప్రొఫెషనల్ HTML బానర్
  - స్పష్టమైన వినియోగదారుల కమ్యూనికేషన్ కోసం గ్రేడియంట్ డిజైన్ మరియు కన్‌స్ట్రక్షన్ సూచనలతో
  - పారదర్శకత కోసం చివరిసారి అప్‌డేట్ తేదీ సూచన
  - అన్ని డివైస్ రకాల కోసం మొబైల్-రిస్పాంసివ్ డిజైన్

#### Enhanced
- **Infrastructure Safety**: ప్రివ్యూ ఫంక్షనాలిటీని డిప్లాయ్‌మెంట్ డాక్యుమెంటేషన్ అంతటా చేర్చారు
- **Pre-deployment Validation**: ఆటోమేటెడ్ స్క్రిప్ట్స్‌లో ఇప్పుడు ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ టెస్టింగ్ చేర్చబడింది
- **Developer Workflow**: ఉత్తమ ప్రాక్టీస్‌గా ప్రివ్యూ ని చేర్చేలా కమాండ్ సీక్వెన్సులు నవీకరించబడ్డాయి
- **Workshop Experience**: కంటెంట్ అభివృద్ధి స్థితి గురించి వినియోగదారులకు స్పష్టమైన ఆశాజనక నిర్ణయాలు పెట్టబడ్డాయి

#### Changed
- **Deployment Best Practices**: ప్రివ్యూ-ఫస్ట్ వర్క్‌ఫ్లోను సిఫార్సు చేసే విధంగా మార్చారు
- **Documentation Flow**: ఇన్ఫ్రాస్ట్రక్చర్ వాలిడేషన్‌ను అారంభ అధ్యయనలో ముందుకు తరలించారు
- **Workshop Presentation**: అభివృద్ధి టైమ్‌లైన్‌తో ప్రొఫెషనల్ స్థితి కమ్యూనికేషన్ ఆమోదించబడింది

#### Improved
- **Safety-First Approach**: డిప్లాయ్‌మెంట్‌కు ముందు ఇన్ఫ్రా మార్పులను ధృవీకరించగలవు
- **Team Collaboration**: ప్రివ్యూ ఫలితాలను సమీక్ష మరియు ఆమోదానికి పంచుకోవచ్చు
- **Cost Awareness**: ప్రావిజనింగ్‌కు ముందుగా రిసోర్స్ ఖర్చుల గురించి మెరుగైన అవగాహన
- **Risk Mitigation**: ముందస్తు వాలిడేషన్ ద్వారా డిప్లాయ్‌మెంట్ వైఫల్యాలు తగ్గించబడతాయి

#### Technical Implementation
- **Multi-document Integration**: ప్రివ్యూ ఫీచర్ 4 కీలక ఫైళ్లలో డాక్యుమెంట్ చేయబడింది
- **Command Patterns**: డాక్యుమెంటేషన్ అంతటా స్థిరమైన సింటాక్స్ మరియు ఉదాహరణలు
- **Best Practice Integration**: వాలిడేషన్ వర్క్‌ఫ్లోలలో ప్రివ్యూ చేర్చబడింది
- **Visual Indicators**: కొత్త ఫీచర్ కనుగొనడానికి స్పష్టమైన NEW మార్కింగ్‌లు

#### Workshop Infrastructure
- **Status Communication**: గ్రేడియంట్ స్టైలింగ్ ఉన్న ప్రొఫెషనల్ HTML బానర్
- **User Experience**: స్పష్టమైన అభివృద్ధి స్థితి వినియోగదారుల్లో గందరగోళాన్ని నివారిస్తుంది
- **Professional Presentation**: సూచనలను సెట్ చేసి రెపోసిటరీ విశ్వసనీయతను అందిస్తుంది
- **Timeline Transparency**: నిర్దిష్ట బాధ్యత కోసం October 2025 చివరిసారి అప్‌డేట్ టైమ్‌స్టాంప్

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: MkDocs ప్రీవ్యూ సామర్థ్యంతో బ్రౌజర్-ఆధారిత వర్క్‌షాప్ అనుభవం
- **📝 Structured Workshop Instructions**: అన్వేషణ నుండి కస్టమైజేషన్ దాకా 7-స్టెప్ గైడెడ్ లెర్నింగ్ పాథ్
  - 0-Introduction: వర్క్‌షాప్ అవలోకనం మరియు సెట్ అప్
  - 1-Select-AI-Template: టెంప్లేట్ అన్వేషణ మరియు ఎంపిక ప్రక్రియ
  - 2-Validate-AI-Template: డిప్లాయ్‌మెంట్ మరియు ధృవీకరణ విధానాలు
  - 3-Deconstruct-AI-Template: టెంప్లేట్ ఆర్కిటెక్చర్‌ను అర్ధం చేసుకోవడం
  - 4-Configure-AI-Template: కాన్ఫిగరేషన్ మరియు అనుకూలీకరణ
  - 5-Customize-AI-Template: అధునాతన మార్పులు మరియు పునరావృతాలు
  - 6-Teardown-Infrastructure: క్లీనప్ మరియు రిసోర్స్ మేనేజ్‌మెంట్
  - 7-Wrap-up: సమీక్ష మరియు తదుపరి చర్యలు
- **🛠️ Workshop Tooling**: మెటీరియల్ థీమ్‌తో MkDocs కాన్ఫిగరేషన్ ఉత్తమ అభ్యాసాలకు
- **🎯 Hands-On Learning Path**: 3-స్టెప్ విధానశాస్త్రం (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: సీజలెస్ డెవలప్‌మెంట్ ఎన్విరాన్‌మెంట్ సెట్ అప్తో సమగ్ర ఇన్టిగ్రేషన్

#### Enhanced
- **AI Workshop Lab**: 2-3 గంటల సమగ్ర స్ట్రక్చర్డ్ లెర్నింగ్ అనుభవంతో విస్తరించబడింది
- **Workshop Documentation**: నావిగేషన్ మరియు విజువల్ సహాయకాలతో ప్రొఫెషనల్ ప్రదర్శన
- **Learning Progression**: టెంప్లేట్ ఎంపిక నుండి ఉత్పత్తి డిప్లాయ్‌మెంట్ వరకు స్పష్టమైన స్టెప్-బై-స్టెప్ మార్గదర్శకత్వం
- **Developer Experience**: స్ట్రీమ్లైన్ చేయబడిన డెవ్ వర్క్‌ఫ్లోల కోసం ఇంటిగ్రేటెడ్ టూలింగ్

#### Improved
- **Accessibility**: శోధన, కాపి ఫంక్షనాలిటీ, మరియు థీమ్ టోగుల్ ఉన్న బ్రౌజర్ ఆధారిత ఇంటర్ఫేస్
- **Self-Paced Learning**: వివిధ నేర్చుకునే వేగాలకు అనుకూలంగా ఫ్లెక్సిబుల్ వర్క్‌షాప్ నిర్మాణం
- **Practical Application**: వాస్తవ ప్రపంచ AI టెంప్లేట్ డిప్లాయ్‌మెంట్ పరిస్థితులు
- **Community Integration**: వర్క్‌షాప్ మద్దతు మరియు సహకారానికి Discord ఇంటిగ్రేషన్

#### Workshop Features
- **Built-in Search**: వేగవంతమైన కీవర్డ్ మరియు పాఠ్యశాల కనుగొనటానికి శోధన
- **Copy Code Blocks**: అన్ని కోడ్ ఉదాహరణల కోసం హోవర్-టు-కాపీ ఫంక్షనాలిటీ
- **Theme Toggle**: వివిధ ఇష్టాలకు డార్క్/లైట్ మోడ్ సపోర్ట్
- **Visual Assets**: మెరుగైన అర్ధం కోసం స్క్రీన్‌షాట్లు మరియు డయాగ్రామ్లు
- **Help Integration**: కమ్యూనిటీ మద్దతు కోసం నేరుగా Discord యాక్సెస్

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: మొత్తం కోర్సును 8 ప్రోగ్రెసివ్ లెర్నింగ్ అధ్యాయాల్లో పునఃరూపకల్పన
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: అన్ని డాక్యుమెంటేషన్ పేజీలలో ఒకసారైన నావిగేషన్ హెడర్లు మరియు ఫుటర్లు
- **🎯 Progress Tracking**: కోర్సు కంప్లీషన్ చెక్లిస్ట్ మరియు లెర్నింగ్ వెరిఫికేషన్ సిస్టమ్
- **🗺️ Learning Path Guidance**: వివిధ అనుభవ స్థాయిలు మరియు లక్ష్యాలకు స్పష్టమైన ఎంట్రీ పాయింట్లు
- **🔗 Cross-Reference Navigation**: సంబంధిత అధ్యాయాలు మరియు ప్రీరెక్విసిట్‌లను స్పష్టంగా లింక్ చేయబడింది

#### Enhanced
- **README Structure**: READMEని అధ్యాయాల ప్రకారమైన నిర్మాణంతో ఒక స్ట్రక్చర్డ్ లెర్నింగ్ ప్లాట్‌ఫార్మ్‌గా మారుస్తుంది
- **Documentation Navigation**: ప్రతి పేజీలో ఇప్పుడు అధ్యాయ కాంటెక్స్ట్ మరియు ప్రోగ్రెషన్ మార్గదర్శకత్వం ఉంటుంది
- **Template Organization**: ఉదాహరణలు మరియు టెంప్లేట్స్ సరైన అధ్యాయాలకు మ్యాప్ చేయబడ్డాయి
- **Resource Integration**: చీట్ షీట్లు, FAQs, స్టడీ గైడ్స్ సంబంధించిన అధ్యాయాలకు కనెక్ట్ చేయబడ్డాయి
- **Workshop Integration**: హ్యాండ్స్-ఆన్ ల్యాబ్స్ అనేక అధ్యాయల లెర్నింగ్ లక్ష్యాలకు మ్యాప్ చేయబడ్డాయి

#### Changed
- **Learning Progression**: లీనియర్ డాక్యుమెంటేషన్ నుండి ఫ్లెక్సిబుల్ అధ్యాయ ఆధారిత లెర్నింగ్‌కి మార్పు
- **Configuration Placement**: మెరుగైన లెర్నింగ్ ఫ్లో కోసం కాన్ఫిగరేషన్ గైడ్‌ను Chapter 3 గా ప్రతిష్టించబడింది
- **AI Content Integration**: లెర్నింగ్ ప్యాథ్ అంతటా AI-స్పెసిఫిక్ కంటెంట్ బెటర్ ఇంటిగ్రేట్ చేయబడింది
- **Production Content**: అడ్వాన్స్డ్ నమూనాలను ఎంటర్ప్రైజ్ విద్యార్థులకు Chapter 8 లో ఏకీకృతం చేయబడింది

#### Improved
- **User Experience**: స్పష్టమైన నావిగేషన్ బ్రెడ్‌క్రంబ్స్ మరియు అధ్యాయ ప్రోగ్రెషన్ సూచికలు
- **Accessibility**: కోర్స్ దాటవేయుటకు సులభతరమైన ఒకసారైన నావిగేషన్ నమూనాలు
- **Professional Presentation**: అకడేమిక్ మరియు కార్పొరేట్ శిక్షణకు అనుకూలమైన యూనివర్సిటీ-స్టైల్ కోర్స్ నిర్మాణం
- **Learning Efficiency**: మెరుగైన సంయోజనంతో సంబంధిత కంటెంట్ కనుగొనడానికి సమయం తగ్గింది

#### Technical Implementation
- **Navigation Headers**: 40+ డాక్యుమెంటేషన్ ఫైళ్లలో స్టాండర్డైజ్డ్ ఛాప్టర్ నావిగేషన్
- **Footer Navigation**: స్థిరమైన ప్రోగ్రెషన్ మార్గదర్శకత్వం మరియు అధ్యాయ కంప్లీషన్ సూచికలు
- **Cross-Linking**: సంబంధిత కాన్సెప్ట్స్‌కి క‌నెక్ట్ చేసే సమగ్ర అంతర్గత లింకింగ్ సిస్టమ్
- **Chapter Mapping**: టెంప్లేట్స్ మరియు ఉదాహరణలు స్పష్టంగా లెర్నింగ్ లక్ష్యాలతో సంకల్పితమయ్యాయి

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: స్టడీ గైడ్‌ను 8-అధ్యాయ సిస్టమ్‌కు సరిపడుగా పునఃరూపకల్పన
- **🎯 Chapter-Based Assessment**: ప్రతి అధ్యాయానికి నిర్దిష్ట లెర్నింగ్ లక్ష్యాలు మరియు ప్రాక్టికల్ వ్యాయామాలు
- **📋 Progress Tracking**: కొంతమయిన అవుట్‌కమ్స్ మరియు కంప్లీషన్ చెక్లిస్ట్‍తో వారానికి సరిపోయే అధ్యయన షెడ్యూల్
- **❓ Assessment Questions**: ప్రతి అధ్యాయానికి నోలెడ్జ్ వెరిఫికేషన్ ప్రశ్నలు ప్రొఫెషనల్ అవుట్‌కమ్స్‌తో
- **🛠️ Practical Exercises**: నిజ జీవిత డిప్లాయ్‌మెంట్ సన్నివేశాలతో హ్యాండ్స్-ఆన్ కార్యకలాపాలు
- **📊 Skill Progression**: ప్రాథమిక కాన్సెప్ట్స్ నుంచి ఎంటర్ప్రైజ్ నమూనాల వరకు స్పష్టమైన అభివృద్ధి మార్గం
- **🎓 Certification Framework**: ప్రొఫెషనల్ డెవలప్‌మెంట్ అవుట్‌కమ్స్ మరియు కమ్యూనిటీ గుర్తింపు సిస్టమ్
- **⏱️ Timeline Management**: మైల్స్‌టోన్ వెరిఫికేషన్‌తో 10-వారాల నిర్మిత పాఠ్య ప్రణాళిక

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: retail multi-agent సొల్యూషన్‌లో స్పష్టత కోసం "Cora agent"ను "Customer agent" గా మార్చింది
- **Agent Architecture**: అన్ని డాక్యుమెంటేషన్, ARM టెంప్లేట్స్, మరియు కోడ్ ఉదాహరణలను సుస్థిర "Customer agent" నామకరణను ఉపయోగించ하도록 నవీకరించింది
- **Configuration Examples**: అప్‌డేటెడ్ నామకరణతో ఆధునిక agent కాన్ఫిగరేషన్ నమూనాలు
- **Documentation Consistency**: అన్ని సూచనలులో ప్రొఫెషనల్, వివరాత్మక agent పేర్లను వినియోగించటం నిర్ధారించబడింది

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template ను Customer ఏజెంట్ సూచనలతో అప్డేట్ చేయబడింది
- **Architecture Diagrams**: నవీకరించిన ఏజెంట్ నామకరణతో Mermaid డయాగ్రామ్‌లు తాజాకరించబడ్డాయి
- **Code Examples**: Python తరగతులు మరియు అమలు ఉదాహరణలు ఇప్పుడు CustomerAgent నామకరణను ఉపయోగిస్తాయి
- **Environment Variables**: అన్ని డిప్లాయ్‌మెంట్ స్క్రిప్ట్‌లను CUSTOMER_AGENT_NAME నియమనిబంధనలను ఉపయోగ하도록 నవీకరించారు

#### Improved
- **Developer Experience**: డాక్యుమెంటేషన్‌లో ఏజెంట్ పాత్రలు మరియు బాధ్యతలపై స్పష్టమైన వివరణ
- **Production Readiness**: సంస్థాత్మక నామకరణ పరంపరలతో మెరుగైన సారూప్యం
- **Learning Materials**: విద్యార్థుల కోసం మరింత సహజమైన ఏజెంట్ నామకరణ
- **Template Usability**: ఏజెంట్ పనులు మరియు డిప్లాయ్‌మెంట్ నమూనాల సులభమైన అవగాహన

#### Technical Details
- CustomerAgent సూచనలతో Mermaid ఆర్కిటెక్చర్ డయాగ్రామ్‌లు నవీకరించారు
- Python ఉదాహరణల్లో CoraAgent తరగతి నామాలను CustomerAgent తో మార్చారు
- ARM టెంప్లేట్ JSON కాన్ఫిగరేషన్లను "customer" ఏజెంట్ టైప్ ఉపయోగించేందుకు మార్చారు
- పర్యావరణ చరాలను CORA_AGENT_* నుంచి CUSTOMER_AGENT_* నమూనాలుగా నవీకరించారు
- అన్ని డిప్లాయ్‌మెంట్ ఆదేశాలు మరియు కంటెయినర్ కాన్ఫిగరేషన్లు తాజాకరించబడ్డాయి

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**ఈ వర్షన్ రిపోజిటరీని Microsoft Foundry సమగ్రతతో సమగ్ర AI-కేంద్రీకృత అభ్యాస వనరుగా మార్చుతుంది.**

#### Added
- **🤖 AI-First Learning Path**: AI డెవలపర్లు మరియు ఇంజినీర్లకు ప్రాధాన్యం ఇవ్వగా పూర్తి పునఃసంరచన
- **Microsoft Foundry Integration Guide**: AZD ను Microsoft Foundry సర్వీసులతో కనెక్ట్ చేయడానికి సమగ్ర డాక్యుమెంటేషన్
- **AI Model Deployment Patterns**: మోడల్ ఎంపిక, కాన్ఫిగరేషన్ మరియు ఉత్పత్తి డిప్లాయ్‌మెంట్ వ్యూహాలను కవర్ చేసే వివరమైన గైడ్
- **AI Workshop Lab**: AI అప్లికేషన్లను AZD-డిప్లాయ్ చేయదగిన పరిష్కారాలుగా మార్చడానికి 2-3 గంటల హ్యాండ్స్-ఆన్ వర్క్షాప్
- **Production AI Best Practices**: స్కేలింగ్, మానిటరింగ్ మరియు AI వర్క్లోడ్స్‌ను సురక్షితం చేయడానికి ఎంటర్ప్రైజ్-రెడీ నమూనాలు
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services మరియు AI డిప్లాయ్‌మెంట్ సమస్యల కోసం సమగ్ర ట్రబుల్‌షూటింగ్
- **AI Template Gallery**: కాంప్లెక్సిటీ రేటింగ్‌లతో Microsoft Foundry టెంప్లేట్‌ల ఫీచర్డ్ సేకరణ
- **Workshop Materials**: హ్యాండ్స్-ఆన్ ల్యాబ్‌లు మరియు రిఫరెన్స్ మెటీరియల్స్‌తో పూర్తి వర్క్షాప్ స్ట్రక్చర్

#### Enhanced
- **README Structure**: AI-డెవలపర్ పై ఫోకస్ చేయబడింది, Microsoft Foundry Discord నుంచి 45% కమ్యూనిటీ ఆసక్తి డేటాతో
- **Learning Paths**: విద్యార్థులు మరియు DevOps ఇంజినీర్ల కోసం సాంప్రదాయ మార్గాల వెంట ప్రత్యేక AI డెవలపర్ పాఠ్యప్రవాహం
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, మరియు openai-chat-app-quickstart వంటి ఫీచర్డ్ AI టెంప్లేట్‌లు
- **Community Integration**: AI-సంబంధిత ఛానెల్‌లు మరియు చర్చలతో Discord కమ్యూనిటీ సపోర్ట్ మెరుగుపరచబడింది

#### Security & Production Focus
- **Managed Identity Patterns**: AI-నిర్దిష్ట authentication మరియు భద్రతా కాన్ఫిగరేషన్లు
- **Cost Optimization**: టోకెన్ వినియోగ ట్రాకింగ్ మరియు AI వర్క్లోడ్స్ కోసం బడ్జెట్ నియంత్రణలు
- **Multi-Region Deployment**: గ్లోబల్ AI అప్లికేషన్ డిప్లాయ్‌మెంట్శ్ వ్యూహాలు
- **Performance Monitoring**: AI-నిర్దిష్ట మెట్రిక్స్ మరియు Application Insights ఇంటిగ్రేషన్

#### Documentation Quality
- **Linear Course Structure**: మొదటి దశ నుండి ఆధునిక AI డిప్లాయ్‌మెంట్ నమూనాల వరకు తర్కబద్ధమైన ప్రగతి
- **Validated URLs**: అన్ని బాహ్య రిపాజిటరీ లింక్లు ధృవీకరించబడ్డవి మరియు యాక్సెస్ చేయదగినవి
- **Complete Reference**: అన్ని అంతర్గత డాక్యుమెంటేషన్ లింక్లు ధృవీకరించబడ్డవి మరియు పనితీరు సామర్థ్యవంతం
- **Production Ready**: వాస్తవ ప్రపంచ ఉదాహరణలతో ఎంటర్ప్రైజ్ డిప్లాయ్‌మెంట్ నమూనాలు

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**ఈ వర్షన్ రిపాజిటరీ నిర్మాణం మరియు కంటెంట్ ప్రదర్శనలో గణనీయమైన పునఃసంస్కరణను సూచిస్తుంది.**

#### Added
- **Structured Learning Framework**: ఇప్పుడు అన్ని డాక్యుమెంటేషన్ పేజీలలో పరిచయం, అభ్యాస లక్ష్యాలు మరియు అభ్యాస ఫలితాల విభాగాలు ఉన్నాయి
- **Navigation System**: మార్గనిర్దేశక అభ్యాస ప్రగతికి అన్ని డాక్యుమెంటేషన్‌లో Previous/Next పాఠ లింకులు జోడించబడ్డాయి
- **Study Guide**: లెర్నింగ్ లక్ష్యాలు, అభ్యాస వ్యాయామాలు మరియు అంచనా మెటీరియల్స్‌తో సమగ్ర study-guide.md
- **Professional Presentation**: మెరుగైన యాక్సెసిబిలిటీ మరియు ప్రొఫెషనల్ రూపానికి అన్ని ఎమోజీ చిహ్నాలు తొలగించబడ్డాయి
- **Enhanced Content Structure**: అభ్యాస పదార్థాల యొక్క సదస్సు మరియు ప్రవాహం మెరుగుపరచబడింది

#### Changed
- **Documentation Format**: ఒకసారిగా అభ్యాస-కేంద్రీకృత నిర్మాణంతో అన్ని డాక్యుమెంటేషన్‌ను స్టాండర్డైజ్ చేయబడింది
- **Navigation Flow**: అన్ని అభ్యాస పదార్థాల ద్వారా లాజికల్ ప్రోగ్రెషన్ అమలు చేయబడింది
- **Content Presentation**: క్లియర్, ప్రొఫెషనల్ ఫార్మాటింగ్‌కు ప్రాధాన్యత ఇస్తూ అలంకారాత్మక అంశాలు తొలగించబడ్డాయి
- **Link Structure**: కొత్త నావిగేషన్ సిస్టమ్‌కు మద్దతుగా అన్ని అంతర్గత లింక్స్ నవీకరించబడ్డాయి

#### Improved
- **Accessibility**: స్క్రీన్ రీడర్ అనుకూలత కోసం ఎమోజీ ఆధారిత అంశాలు తొలగించబడ్డాయి
- **Professional Appearance**: ఎంటర్ప్రైజ్ అభ్యాసానికి అనువైన శుభ్రమైన, అకాడెమిక్ శైలి ప్రదర్శన
- **Learning Experience**: ప్రతి పాఠానికి స్పష్టమైన లక్ష్యాలు మరియు ఫలితాలతో నిర్మించబడిన నిర్మిత దృష్టికోణం
- **Content Organization**: సంబంధిత విషయాల మధ్య మెరుగైన తర్జన మరియు కనెక్షన్

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - సంపూర్ణ ప్రారంభ గైడ్ సిరీస్
  - విస్తృత డిప్లాయ్‌మెంట్ మరియు ప్రావిజనింగ్ డాక్యుమెంటేషన్
  - వివరణాత్మక ట్రబుల్‌షూటింగ్ వనరులు మరియు డీబగ్గింగ్ గైడ్‌లు
  - డిప్లాయ్‌మెంట్‌కు ముందు వాలిడేషన్ టూల్స్ మరియు ప్రక్రియలు

- **Getting Started Module**
  - AZD మౌలికాంశాలు: మూల భావనలు మరియు పదజాలం
  - Installation Guide: ప్లాట్‌ఫారమ్-నిర్దిష్ట సెటప్ సూచనలు
  - Configuration Guide: పర్యావరణ సెటప్ మరియు ప్రామాణికరణ
  - First Project Tutorial: దశల వారీ హ్యాండ్స్-ఆన్ అభ్యాసం

- **Deployment and Provisioning Module**
  - Deployment Guide: సంపూర్ణ వర్క్‌ఫ్లో డాక్యుమెంటేషన్
  - Provisioning Guide: Bicep తో Infrastructure as Code
  - ఉత్పత్తి డిప్లాయ్‌మెంట్‌లకు ఉత్తమ అభ్యాసాలు
  - బహు-సేవా ఆర్కిటెక్చర్ నమూనాలు

- **Pre-deployment Validation Module**
  - క్యాపాసిటీ ప్లానింగ్: Azure వనరుల అందుబాటును ధృవీకరించటం
  - SKU Selection: సేవ టియర్ కోసం సమగ్ర మార్గదర్శకత
  - Pre-flight Checks: ఆటోమేటెడ్ వాలిడేషన్ స్క్రిప్ట్‌లు (PowerShell మరియు Bash)
  - ఖర్చుల అంచనా మరియు బడ్జెట్ ప్లానింగ్ టూల్స్

- **Troubleshooting Module**
  - సాధారణ సమస్యలు: తరచుగా ఎదురయ్యే సమస్యలు మరియు పరిష్కారాలు
  - Debugging Guide: వ్యవస్థాత్మక ట్రబుల్‌షూటింగ్ పద్ధతులు
  - అభివృద్ధి చెందిన నిర్ధారణ సాంకేతికాలు మరియు టూల్స్
  - పనితీరు మానిటరింగ్ మరియు ఆప్టిమైజేషన్

- **Resources and References**
  - Command Cheat Sheet: కీలక కమాండ్లకు త్వరిత సూచిక
  - Glossary: పదజాలం మరియు సంక్షిప్తపద నిర్వచనాల సమగ్ర జాబితా
  - FAQ: సాధారణ ప్రశ్నలకు వివరమైన సమాధానాలు
  - బాహ్య వనరు లింకులు మరియు కమ్యూనిటీ కనెక్షన్లు

- **Examples and Templates**
  - సింపుల్ వెబ్ అప్లికేషన్ ఉదాహరణ
  - స్టాటిక్ వెబ్‌సైట్ డిప్లాయ్‌మెంట్ టెంప్లేట్
  - కంటెయినర్ అప్లికేషన్ కాన్ఫిగరేషన్
  - డేటాబేస్ ఇంటిగ్రేషన్ నమూనాలు
  - మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ ఉదాహరణలు
  - సెర్వర్‌లెస్ ఫంక్షన్ అమల్స్

#### Features
- **Multi-Platform Support**: Windows, macOS, మరియు Linux కోసం ఇన్స్టలేషన్ మరియు కాన్ఫిగరేషన్ గైడ్‌లు
- **Multiple Skill Levels**: విద్యార్థుల నుంచి ప్రొఫెషనల్ డెవలపర్ల వరకు డిజైన్ చేసిన కంటెంట్
- **Practical Focus**: హ్యాండ్స్-ఆన్ ఉదాహరణలు మరియు వాస్తవ ప్రపంచ సన్నివేశాలు
- **Comprehensive Coverage**: మూల భావనల నుండి అధునాతన ఎంటర్ప్రైజ్ నమూనాల వరకు సమగ్ర కవర్
- **Security-First Approach**: భద్రత ఉత్తమ ఆచారాలు మొత్తం ఇంటిగ్రేటెడ్
- **Cost Optimization**: ఖర్చు-ఫ్రెండ్లీ డిప్లాయ్‌మెంట్‌లు మరియు వనరుల నిర్వహణ కోసం మార్గదర్శకత

#### Documentation Quality
- **Detailed Code Examples**: ప్రయోగాత్మక, పరీక్షించబడిన కోడ్ నమూనాలు
- **Step-by-Step Instructions**: స్పష్టమైన, అమలుకు తగిన మార్గదర్శకాలు
- **Comprehensive Error Handling**: సాధారణ సమస్యల కోసం ట్రబుల్‌షూటింగ్
- **Best Practices Integration**: పరిశ్రమ ప్రమాణాలు మరియు సిఫార్సుల విన్యాసం
- **Version Compatibility**: తాజా Azure సర్వీసులు మరియు azd ఫీచర్లతో అనుకూలంగా ఉంటుంది

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, మరియు కస్టమ్ మోడల్స్ కోసం ఇంటిగ్రేషన్ నమూనాలు
- **AI Agent Frameworks**: LangChain, Semantic Kernel, మరియు AutoGen డిప్లాయ్‌మెంట్‌ల కోసం టెంప్లేట్లు
- **Advanced RAG Patterns**: Azure AI Search కి తప్పుగా వెక్టర్ డేటాబేస్ ఎంపికలు (Pinecone, Weaviate, మొదలైనవి)
- **AI Observability**: మోడల్ పనితీరు, టోకెన్ వినియోగం, మరియు స్పందన నాణ్యత కోసం మెరుగైన మానిటరింగ్

#### Developer Experience
- **VS Code Extension**: ఏకీకృత AZD + Microsoft Foundry డెవలప్‌మెంట్ అనుభవం
- **GitHub Copilot Integration**: AI-సహాయంతో AZD టెంప్లేట్ జనరేషన్
- **Interactive Tutorials**: AI సన్నివేశాల కోసం ఆటోమెటెడ్ వాలిడేషన్‌తో హ్యాండ్స్-ఆన్ కోడింగ్ వ్యాయామాలు
- **Video Content**: విజువల్ అభ్యాసకుల కోసం AI డిప్లాయ్‌మెంట్స్‌పై సహాయక వీడియో ట్యుటోరియల్స్

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI మోడల్ గవర్నెన్స్, కంప్లయన్స్ మరియు ఆడిట్ ట్రెయిల్స్
- **Multi-Tenant AI**: వేరుగా ఉన్న AI సేవలతో బహుళ కస్టమర్‌లకు సేవలందించే నమూనాలు
- **Edge AI Deployment**: Azure IoT Edge మరియు కంటెయినర్ ఇన్‌స్టాన్స్‌లతో ఇంటిగ్రేషన్
- **Hybrid Cloud AI**: AI వర్క్లోడ్స్ కోసం మల్టీ-క్లౌడ్ మరియు హైబ్రిడ్ డిప్లాయ్‌మెంట్ నమూనాలు

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning పైప్‌లైన్లతో MLOps ఇంటిగ్రేషన్
- **Advanced Security**: జీరో-ట్రెస్ట్ నమూనాలు, ప్రైవేట్ ఎండ్‌పాయింట్లు, మరియు అధునాతన హెచుక్షమ రక్షణ
- **Performance Optimization**: హై-త్రూపుట్ AI అప్లికేషన్ల కోసం అధునాతన ట్యూనింగ్ మరియు స్కేలింగ్ వ్యూహాలు
- **Global Distribution**: AI అప్లికేషన్ల కోసం కంటెంట్ డెలివరీ మరియు ఎడ్జ్ క్యాచింగ్ నమూనాలు

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Microsoft Foundry సమగ్రతతో సమగ్ర AI-కేంద్రీకృత కంటెంట్ (సంపూర్ణమైంది)
- ✅ **Interactive Tutorials**: హ్యాండ్స్-ఆన్ AI వర్క్షాప్ ల్యాబ్ (సంపూర్ణమైంది)
- ✅ **Advanced Security Module**: AI-నిర్దిష్ట సెక్యూరిటీ నమూనాలు (సంపూర్ణమైంది)
- ✅ **Performance Optimization**: AI వర్క్లోడ్ ట్యూనింగ్ వ్యూహాలు (సంపూర్ణమైంది)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-లక్ష్యిత డిప్లాయ్‌మెంట్ సన్నివేశాలు (సంపూర్ణమైంది)
- ✅ **Extended FAQ**: AI-నిర్దిష్ట ప్రశ్నలు మరియు ట్రబుల్‌షూటింగ్ (సంపూర్ణమైంది)
- **Tool Integration**: మెరుగుపరచిన IDE మరియు ఎడిటర్ ఇంటిగ్రేషన్ గైడ్‌లు
- ✅ **Monitoring Expansion**: AI-నిర్దిష్ట మానిటరింగ్ మరియు అలర్టింగ్ నమూనాలు (సంపూర్ణమైంది)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: మొబైల్ అభ్యాసానికి అనుకూల రిస్పాన్సివ్ డిజైన్
- **Offline Access**: డౌన్లోడబుల్ డాక్యుమెంటేషన్ ప్యాకేజీలు
- **Enhanced IDE Integration**: AZD + AI వర్క్‌ఫ్లోల కోసం VS Code ఎక్స్టెన్షన్
- **Community Dashboard**: రియల్-టైమ్ కమ్యూనిటీ మెట్రిక్స్ మరియు అవకాస ట్రాకింగ్

## Contributing to the Changelog

### Reporting Changes
ఈ రిపాజిటరీలో తోడ్పడేటప్పుడు, దయచేసి చేంజ్‌లాగ్ ఎంట్రీలు ఈ క్రింది విషయాలను కలిగివుండేలా నిర్ధారించండి:

1. **Version Number**: సెమాంటిక్ వెర్షనింగ్ (major.minor.patch) అనుసరించండి
2. **Date**: విడుదల లేదా అప్డేట్ తేదీ YYYY-MM-DD ఫార్మాట్‌లో
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: ఏమి మారిందో సంక్షిప్త వివరణ
5. **Impact Assessment**: మార్పులు ఉన్న వినియోగదారులపై ఎలా ప్రభావితం చేస్తాయో

### Change Categories

#### Added
- కొత్త ఫీచర్లు, డాక్యుమెంటేషన్ విభాగాలు, లేదా సామర్థ్యాలు
- కొత్త ఉదాహరణలు, టెంప్లేట్లు, లేదా అభ్యాస వనరులు
- అదనపు టూల్స్, స్క్రిప్ట్‌లు, లేదా యుటిలిటీస్

#### Changed
- ఉన్న ఫంక్షనాలిటీ లేదా డాక్యుమెంటేషన్‌లో చేసిన మార్పులు
- స్పష్టత లేదా ఖచ్చితత్వం పెంపు కోసం అప్డేట్స్
- కంటెంట్ లేదా సంస్థాపనలో పునఃసంరచన

#### Deprecated
- దశలవారీగా తొలగించబడుతున్న ఫీచర్లు లేదా 접근ాలు
- తొలగించడానికి షెడ్యూల్ చేయబడిన డాక్యుమెంటేషన్ విభాగాలు
- మెరుగైన ప్రత్యామ్నాయాలు ఉన్న పద్ధతులు

#### Removed
- ఇకపై సంబంధం లేని ఫీచర్లు, డాక్యుమెంటేషన్ లేదా ఉదాహరణలు
- పాత సమాచారాలు లేదా డిప్రికేటెడ్ పద్ధతులు
- పునరావృత లేదా ఏకీకృత కంటెంట్

#### Fixed
- డాక్యుమెంటేషన్ లేదా కోడ్‌లో పొరపాట్ల సవరణలు
- నివేదించబడిన సమస్యలు లేదా ఇష్యూల పరిష్కారం
- ఖచ్చితత్వం లేదా ఫంక్షనాలిటీకి సంబంధించి మార్పులు

#### Security
- భద్రత సంబంధిత మెరుగుదలలు లేదా ఫిక్స్‌లు
- భద్రత ఉత్తమ అభ్యాసాలపై అప్డేట్లు
- భద్రతా లోపాల పరిష్కారాలు

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- వినియోగదారుని చర్య అవసరమైన బ్రేకింగ్ మార్పులు
- కంటెంట్ లేదా సంస్థాపనలో గణనీయమైన పునఃసంరచన
- మూల దృష్టికోణం లేదా పద్ధతిని మార్చే మార్పులు

#### Minor Version (X.Y.0)
- కొత్త ఫీచర్లు లేదా కంటెంట్ జోడింపులు
- బ్యాక్‌వర్డ్ కంపాటిబిలిటీని నిలుపుకునే మెరుగుదలలు
- అదనపు ఉదాహరణలు, టూల్స్, లేదా వనరులు

#### Patch Version (X.Y.Z)
- బగ్ ఫిక్స్‌లు మరియు సవరణలు
- ఉన్న కంటెంట్‌కు చిన్న మెరుగుదలలు
- స్పష్టతకరణలు మరియు సూక్ష్మ అభివృద్ధులు

## Community Feedback and Suggestions

ఈ అభ్యాస వనరును మెరుగుపరచడానికి మేము కమ్యూనిటీ ఫీడ్బ్యాక్‌ను సక్రియంగా ప్రోత్సహిస్తాము:

### How to Provide Feedback
- **GitHub Issues**: సమస్యలను నివేదించండి లేదా మెరుగుదలలను సూచించండి (AI-నిర్దిష్ట ఇష్యూలు స్వాగతం)
- **Discord Discussions**: ఆలోచనలు పంచుకోండి మరియు Microsoft Foundry కమ్యూనిటీతో పాల్గొనండి
- **Pull Requests**: కంటెంట్‌లో ప్రత్యక్ష మెరుగుదలలను ఇవ్వండి, ప్రత్యేకంగా AI టెంప్లేట్లు మరియు గైడ్‌లు
- **Microsoft Foundry Discord**: AZD + AI చర్చల కోసం #Azure ఛానెల్‌లో పాల్గొనండి
- **Community Forums**: విస్తృత Azure డెవలపర్ చర్చల్లో భాగస్వామ్యం జరపండి

### Feedback Categories
- **AI Content Accuracy**: AI సేవల ఇంటిగ్రేషన్ మరియు డిప్లాయ్‌మెంట్ సమాచారంలో సవరణలు
- **Learning Experience**: మెరుగైన AI డెవలపర్ అభ్యాస ప్రవాహానికి సూచనలు
- **Missing AI Content**: అదనపు AI టెంప్లేట్లు, నమూనాలు లేదా ఉదాహరణలు కోరుకోవడం
- **Accessibility**: విభిన్న అభ్యాస అవసరాలకు అనుగుణంగా మెరుగుదలలు
- **AI Tool Integration**: మెరుగైన AI డెవలప్‌మెంట్ వర్క్‌ఫ్లో ఇంటిగ్రేషన్ కోసం సూచనలు
- **Production AI Patterns**: ఎంటర్ప్రైజ్ AI డిప్లాయ్‌మెంట్ నమూనాల అభ్యర్థనలు

### Response Commitment
- **Issue Response**: నివేదించబడిన సమస్యలకు 48 గంటల లోపల స్పందన
- **Feature Requests**: ఒక వారంలో లోపు మూల్యాంకనం
- **Community Contributions**: ఒక వారంలో లోపు సమీక్ష
- **Security Issues**: తక్షణ ప్రాధాన్యతతో వేగవంతమైన స్పందన

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: కంటెంట్ ఖచ్చితత్వం మరియు లింక్ ధృవీకరణ
- **Quarterly Updates**: ప్రధాన కంటెంట్ జోడింపులు మరియు మెరుగుదలలు
- **Semi-Annual Reviews**: సమగ్ర పునఃసంరచన మరియు అభివృద్ధి
- **Annual Releases**: ముఖ్య వర్షన్ అప్డేట్స్ మరియు గణనీయమైన మెరుగుదలలు

### Monitoring and Quality Assurance
- **Automated Testing**: కోడ్ ఉదాహరణలు మరియు లింక్‌ల యొక్క నియమిత ధృవీకరణ
- **Community Feedback Integration**: వినియోగదారుల సూచనలను రెగ్యులర్‌గా స్వీకరించి అమలు చేయడం
- **Technology Updates**: తాజా Azure సర్వీసులు మరియు azd విడుదలలతో అనుకూలత
- **Accessibility Audits**: సమగ్ర డిజైన్ సిద్ధాంతాల కోసం నియమిత సమీక్ష

## Version Support Policy

### Current Version Support
- **తాజా ప్రధాన సంస్కరణ**: నిబంధిత నవీకరణలతో పూర్తి మద్దతు
- **మునుపటి ప్రధాన సంస్కరణ**: 12 నెలల పాటు భద్రతా నవీకరణలు మరియు కీలక సవరణలు
- **పాత సంస్కరణలు**: కేవలం కమ్యూనిటీ మద్దతు మాత్రమే, అధికారిక నవీకరణలు లేకుంటే

### మైగ్రేషన్ మార్గదర్శకాలు
ప్రధాన సంస్కరణలు విడుదలైనప్పుడు, మేము అందిస్తాము:
- **మైగ్రేషన్ మార్గదర్శకాలు**: దశలవారీ మార్పు సూచనలు
- **అనుకూలత గమనికలు**: బ్రేకింగ్ మార్పుల గురించి వివరాలు
- **సాధన మద్దతు**: మార్పిడికి సహాయపడే స్క్రిప్ట్‌లు లేదా ఉపకరణాలు
- **కమ్యూనిటీ మద్దతు**: మార్పుల సంబంధిత ప్రశ్నల కోసం ప్రత్యేక ఫోరమ్లు

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [అధ్యయన గైడ్](resources/study-guide.md)
- **తర్వాతి పాఠం**: తిరిగి వెళ్ళండి [ప్రధాన README](README.md)

**తాజాగా ఉండండి**: కొత్త విడుదలల గురించి నోటిఫికేషన్లు మరియు నేర్చుకునే సామగ్రిపై ముఖ్యమైన నవీకరణల కోసం ఈ రిపోజిటరీని గమనించండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండవచ్చని దయచేసి గమనించండి. దీనికి సంబంధించిన అసలైన డాక్యుమెంట్‌ను దాని స్థానిక భాషలో ఉన్న వర్షన్‌ను అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, నిపుణులైన మానవ అనువాదాన్ని సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడే ఏవైనా అపార్థాలు లేదా దుర్వ్యాఖ్యతల కొరకు మేము బాధ్యులు కాదని తెలియజేస్తున్నాం.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
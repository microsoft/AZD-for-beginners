# परिवर्तन-इतिहास - AZD For Beginners

## परिचय

यो परिवर्तन-इतिहास AZD For Beginners रिपोजिटरीमा भएका सबै उल्लेखनीय परिवर्तनहरू, अपडेटहरू, र सुधारहरूलाई दस्तावेज गर्दछ। हामी सेम्यान्टिक भर्सनिङ सिद्धान्तहरू पछ्याउँछौं र प्रयोगकर्ताहरूले भर्सनहरू बीच के परिवर्तन भएको बुझ्न मद्दत गर्ने उद्देश्यले यो लग राख्छौं।

## सिकाइ लक्ष्यहरू

यस परिवर्तन-इतिहासलाई समीक्षा गरेर, तपाईं:
- नयाँ सुविधाहरू र सामग्री थपहरूबारे जानकारीमा रहन सक्नुहुनेछ
- विद्यमान दस्तावेजमा भएका सुधारहरू बुझ्न सक्नुहुनेछ
- त्रुटि सुधारहरू र शुद्धताका लागि गरिएको संशोधनहरू ट्रयाक गर्न सक्नुहुनेछ
- समयसँगै सिकाइ सामग्रीको विकासलाई पछ्याउन सक्नुहुनेछ

## सिकाइ परिणामहरू

परिवर्तन-इतिहासका प्रविष्टिहरू समीक्षा गरेपछि, तपाईं सक्षम हुनु हुनेछ:
- सिक्न उपलब्ध नयाँ सामग्री र स्रोतहरू पहिचान गर्न
- कुन खण्डहरू अद्यावधिक वा सुधार गरिएका छन् बुझ्न
- सबैभन्दा हालैका सामग्रीको आधारमा आफ्नो सिकाइ मार्ग योजना बनाउन
- भविष्यको सुधारका लागि प्रतिक्रिया र सुझाव योगदान दिन

## संस्करण इतिहास

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**यस भर्सनले सबै AI सम्बन्धित अध्यायहरूमा `azd ai`, `azd extension`, र `azd mcp` आदेशहरूको कभर थप्छ, agents.md मा भएका भाँचिएका लिङ्कहरू र अवरुद्ध कोड सच्याउँछ, चीट शीट अपडेट गर्छ, र Example Templates भागलाई मान्य गरिएको विवरण र नयाँ Azure AI AZD टेम्पलेटहरू सहित पूर्णरूपमा पुनर्रा्चना गर्दछ।**

#### थपियो
- **🤖 AZD AI CLI कभर** 7 फाइलहरूमा (पहिले केवल अध्याय 8 मा मात्र):
  - `docs/chapter-01-foundation/azd-basics.md` — नयाँ "Extensions and AI Commands" भाग जसले `azd extension`, `azd ai agent init`, र `azd mcp` परिचय गराउँछ
  - `docs/chapter-02-ai-development/agents.md` — विकल्प 4: `azd ai agent init` सँग तुलना तालिका (टेम्पलेट बनाम म्यानिफेस्ट दृष्टिकोण)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" र "Agent-First Deployment" उपखण्डहरू
  - `docs/chapter-05-multi-agent/README.md` — Quick Start अब दुवै टेम्पलेट र म्यानिफेस्ट-आधारित डिप्लोइमेन्ट पथ देखाउँछ
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy खण्ड अब `azd ai agent init` विकल्प समावेश गर्दछ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" उपखण्ड
  - `resources/cheat-sheet.md` — नयाँ "AI & Extensions Commands" खण्ड `azd extension`, `azd ai agent init`, `azd mcp`, र `azd infra generate` सहित
- **📦 नयाँ AZD AI उदाहरण टेम्पलेटहरू** `microsoft-foundry-integration.md` मा:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, र भ्वाइस च्याट समर्थन सहित .NET RAG च्याट
  - **azure-search-openai-demo-java** — Langchain4J प्रयोग गर्दै Java RAG च्याट जसमा ACA/AKS डिप्लोइमेन्ट विकल्पहरू
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, र Prompty प्रयोग गरेर बहु-एजेन्ट क्रिएटिभ लेखन एप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB प्रयोग गरी Serverless RAG, Ollama स्थानीय विकास समर्थनसहित
  - **chat-with-your-data-solution-accelerator** — एडमिन पोर्टल, Teams एकीकरण, र PostgreSQL/Cosmos DB विकल्पहरू सहित एंटरप्राइज RAG एक्सेलेरेटर
  - **azure-ai-travel-agents** — .NET, Python, Java, र TypeScript मा सर्भरहरू सहित बहु-एजेन्ट MCP ओरकेस्ट्रेसन रेफरेन्स एप
  - **azd-ai-starter** — न्यूनतम Azure AI पूर्वाधार Bicep स्टार्ट टेम्पलेट
  - **🔗 Awesome AZD AI Gallery link** — सन्दर्भका लागि [आश्चर्यजनक AZD AI ग्यालरी](https://azure.github.io/awesome-azd/?tags=ai) (80+ टेम्पलेटहरू)

#### सुधार गरिएको
- **🔗 agents.md नेभिगेसन**: Previous/Next लिङ्कहरू अब Chapter 2 README पाठक्रम क्रमसँग मेल खान्छन् (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md भाँचिएका लिङ्कहरू**: `production-ai-practices.md` लाई `../chapter-08-production/production-ai-practices.md` मा सच्याइयो (3 ठाउँमा)
- **📦 agents.md अवरुद्ध कोड**: `opencensus` लाई `azure-monitor-opentelemetry` + OpenTelemetry SDK ले प्रतिस्थापन गरियो
- **🐛 agents.md अमान्य API**: `max_tokens` लाई `create_agent()` बाट `create_run()` मा `max_completion_tokens` रूपमा सारियो
- **🔢 agents.md टोकन गणना**: अनौपचारिक `len//4` अनुमानलाई `tiktoken.encoding_for_model()` ले प्रतिस्थापन गरियो
- **azure-search-openai-demo**: सेवाहरू "Cognitive Search + App Service" बाट "Azure AI Search + Azure Container Apps" मा सच्याइयो (डिफल्ट होस्ट अक्टोबर 2024 मा परिवर्तन भयो)
- **contoso-chat**: विवरण अद्यावधिक गरियो ताकि Azure AI Foundry + Prompty सन्दर्भ गरियो, जसले रिपोको वास्तविक शीर्षक र टेक स्ट्याकलाई मिलाउँछ

#### हटाइयो
- **ai-document-processing**: गैर-कार्यशील टेम्पलेट सन्दर्भ हटाइयो (रिपो AZD टेम्पलेटको रूपमा सार्वजनिक पहुँचयोग्य छैन)

#### सुधारहरू
- **📝 agents.md अभ्यासहरू**: Exercise 1 अब अपेक्षित उत्पादन र `azd monitor` चरण देखाउँछ; Exercise 2 मा पूर्ण `FunctionTool` दर्ता कोड समावेश गरिएको छ; Exercise 3 मा अस्पष्ट निर्देशनलाई ठोस `prepdocs.py` कमाण्डहरूसँग प्रतिस्थापन गरियो
- **📚 agents.md स्रोतहरू**: दस्तावेजी लिङ्कहरू हालको Azure AI Agent Service दस्तावेज र क्विकस्टार्टमा अपडेट गरियो
- **📋 agents.md Next Steps तालिका**: पूरै अध्याय कभरका लागि AI Workshop Lab लिङ्क थपियो

#### अपडेट गरिएका फाइलहरू
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### पाठ्यक्रम नेभिगेसन सुधार
**यस भर्सनले README.md अध्याय नेभिगेसनलाई एक संवर्धित तालिका ढाँचासँग सुधार गर्छ।**

#### परिवर्तन गरियो
- **पाठ्यक्रम नक्सा तालिका**: सिधा पाठ लिङ्कहरू, अवधि अनुमानहरू, र जटिलता रेटिङ सहित संवर्धित
- **फोल्डर सफाइ**: दोहोरिएका पुराना फोल्डरहरू हटाइयो (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **लिङ्क प्रमाणिकरण**: Course Map तालिकामा भएका 21+ इन्टरनल लिङ्कहरू जाँच गरिएका

### [v3.16.0] - 2026-02-05

#### उत्पादन नाम अपडेटहरू
**यस भर्सनले उत्पादन सन्दर्भहरू वर्तमान Microsoft ब्रान्डिङ अनुरूप अपडेट गर्छ।**

#### परिवर्तन गरियो
- **Microsoft Foundry → Microsoft Foundry**: सबै सन्दर्भहरू नन-ट्रान्सलेट फाइलहरूमा अपडेट गरियो
- **Azure AI Agent Service → Foundry Agents**: सेवा नाम हालको ब्रान्डिङलाई प्रतिबिम्बित गर्न अपडेट गरियो

#### अपडेट गरिएका फाइलहरू
- `README.md` - मुख्य पाठ्यक्रम ल्यान्डिङ पृष्ठ
- `changelog.md` - संस्करण इतिहास
- `course-outline.md` - पाठ्यक्रम संरचना
- `docs/chapter-02-ai-development/agents.md` - AI एजेन्ट गाइड
- `examples/README.md` - उदाहरण दस्तावेजीकरण
- `workshop/README.md` - workshop ल्यान्डिङ पृष्ठ
- `workshop/docs/index.md` - workshop इंडेक्स
- `workshop/docs/instructions/*.md` - सबै workshop निर्देशिका फाइलहरू

---

### [v3.15.0] - 2026-02-05

#### प्रमुख रिपोजिटरी पुनर्संरचना: अध्याय-आधारित फोल्डर नामहरू
**यस भर्सनले डकुमेन्टेशनलाई स्पष्ट नेभिगेसनका लागि समर्पित अध्याय फोल्डरहरूमा पुनर्संरचना गर्छ।**

#### फोल्डर नाम परिवर्तनहरू
पुराना फोल्डरहरू अध्याय-नम्बर गरिएको फोल्डरहरूले प्रतिस्थापित गरिएका छन्:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- नयाँ थपियो: `docs/chapter-05-multi-agent/`

#### फाइल स्थानान्तरणहरू
| फाइल | बाट | मा |
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

#### थपियो
- **📚 अध्याय README फाइलहरू**: प्रत्येक अध्याय फोल्डरमा README.md सिर्जना गरियो जसमा:
  - सिकाइ उद्देश्यहरू र अवधि
  - पाठ तालिका र वर्णनहरू
  - क्विक स्टार्ट आदेशहरू
  - अन्य अध्यायहरूसँग नेभिगेसन

#### परिवर्तन गरियो
- **🔗 सबै इन्टरनल लिङ्कहरू अपडेट गरियो**: सबै दस्तावेजी फाइलहरूमा 78+ पथहरू अपडेट गरियो
- **🗺️ मुख्य README.md**: नयाँ अध्याय संरचनासहित Course Map अपडेट गरियो
- **📝 examples/README.md**: अध्याय फोल्डरहरूसँग क्रस-रेफरेन्स अपडेट गरियो

#### हटाइयो
- पुरानो फोल्डर संरचना (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रिपोजिटरी पुनर्संरचना: अध्याय नेभिगेसन
**यस भर्सनले अध्याय नेभिगेसन README फाइलहरू थप्यो (v3.15.0 द्वारा प्रतिस्थापित)।**

---

### [v3.13.0] - 2026-02-05

#### नयाँ AI Agents मार्गदर्शन
**यस भर्सनले Azure Developer CLI प्रयोग गरेर AI एजेन्टहरू डिप्लोइ गर्ने समग्र मार्गदर्शन थप्छ।**

#### थपियो
- **🤖 docs/microsoft-foundry/agents.md**: पूर्ण गाइड जसले समेट्छ:
  - AI एजेन्टहरू के हुन् र तिनीहरू च्याटबोटहरूबाट कसरी फरक छन्
  - तीन क्विक-स्टार्ट एजेन्ट टेम्पलेटहरू (Foundry Agents, Prompty, RAG)
  - एजेन्ट आर्किटेक्चर ढाँचाहरू (एकल एजेन्ट, RAG, बहु-एजेन्ट)
  - उपकरण कन्फिगरेसन र अनुकूलन
  - मनिटरिङ र मेट्रिक्स ट्र्याकिङ
  - लागत विचारहरू र अनुकूलन
  - सामान्य ट्रबलशूटिङ परिदृश्यहरू
  - सफलताका मापदण्डहरूसहित तीन व्यावहारिक अभ्यासहरू

#### सामग्री संरचना
- **परिचय**: शुरुवातकर्ताका लागि एजेन्ट अवधारणाहरू
- **क्विक स्टार्ट**: `azd init --template get-started-with-ai-agents` प्रयोग गरेर एजेन्टहरू डिप्लोइ गर्नुहोस्
- **आर्किटेक्चर ढाँचाहरू**: एजेन्ट ढाँचाहरूका भिजुअल डायग्रामहरू
- **कन्फिगरेसन**: उपकरण सेटअप र वातावरण चरहरू
- **मनिटरिङ**: Application Insights इंटिग्रेसन
- **अभ्यासहरू**: प्रगतिशील व्यावहारिक सिकाइ (हरेक 20-45 मिनेट)

---

### [v3.12.0] - 2026-02-05

#### DevContainer वातावरण अपडेट
**यस भर्सनले AZD सिकाइ अनुभवका लागि विकास कन्टेनर कन्फिगरेसनलाई आधुनिक उपकरणहरू र राम्रो पूर्वनिर्धारित मानहरूसँग अपडेट गर्छ।**

#### परिवर्तन गरियो
- **🐳 बेस इमेज**: `python:3.12-bullseye` बाट `python:3.12-bookworm` (नवीनतम Debian स्थिर) मा अपडेट गरियो
- **📛 कन्टेनर नाम**: स्पष्टताका लागि "Python 3" बाट "AZD for Beginners" मा पुनर्नामकरण गरियो

#### थपियो
- **🔧 नयाँ Dev Container सुविधाहरू**:
  - `azure-cli` Bicep समर्थन सक्षम सहित
  - `node:20` (AZD टेम्पलेटहरूको लागि LTS संस्करण)
  - `github-cli` टेम्पलेट व्यवस्थापनको लागि
  - `docker-in-docker` कन्टेनर एप तैनाथीकरणको लागि

- **🔌 पोर्ट फर्वार्डिङ**: सामान्य विकासका लागि पूर्व-कन्फिगर गरिएका पोर्टहरू:
  - 8000 (MkDocs पूर्वावलोकन)
  - 3000 (वेब एपहरू)
  - 5000 (Python Flask)
  - 8080 (API हरू)

- **🧩 नयाँ VS Code विस्तारहरू**:
  - `ms-python.vscode-pylance` - सुधारिएको Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure स्रोत व्यवस्थापन
  - `yzhang.markdown-all-in-one` - Markdown सम्पादन
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid डायग्राम समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml का लागि)
  - `eamodio.gitlens` - Git दृश्यकरण
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिङहरू**: Python इन्टरप्रेटर, save मा फर्म्याट गर्ने, र whitespace ट्रिमिङका लागि पूर्वनिर्धारित सेटिङहरू थपियो

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify प्लगइन थपियो
  - कोड गुणस्तरका लागि pre-commit थपियो
  - Azure SDK प्याकेजहरू थपियो (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: अब कन्टेनर सुरु हुँदा AZD र Azure CLI इन्स्टलेशन प्रमाणित गर्दछ

---

### [v3.11.0] - 2026-02-05

#### beginner-friendly README पुनरावृत्ति
**यस संस्करणले README.md लाई सुरु गर्न इच्छुकहरूका लागि धेरै बढी पहुँचयोग्य बनाउँछ र AI विकासकर्ताहरूका लागि आवश्यक स्रोतहरू थप्छ।**

#### Added
- **🆚 Azure CLI vs AZD तुलना**: कुन उपकरण कहिल्यै प्रयोग गर्ने भन्ने स्पष्ट व्याख्या र व्यावहारिक उदाहरणहरू
- **🌟 Awesome AZD Links**: समुदाय टेम्पलेट ग्यालरी र योगदान स्रोतहरूका प्रत्यक्ष लिङ्कहरू:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तयार-हुने तैनाथीकरण टेम्पलेटहरू
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 छिटो सुरु गाइड**: सरलीकृत 3-चरणको सुरु गर्ने सेक्सन (Install → Login → Deploy)
- **📊 अनुभव-आधारित नेभिगेसन तालिका**: विकासकर्ताको अनुभव अनुसार कहाँबाट सुरु गर्ने भन्ने स्पष्ट मार्गदर्शन

#### Changed
- **README संरचना**: प्रोग्रेसिभ डिस्क्लोजरका लागि पुन: संगठन - प्रमुख जानकारी पहिले
- **परिचय सेक्सन**: पूर्ण शुरु गर्नेहरूको लागि " `azd up` को जादू " व्याख्या गर्न पुनर्लेखन गरियो
- **प्रतिलिपि सामग्री हटाइयो**: दोहोरिएको ट्रबलशुटिङ सेक्सन हटाइयो
- **त्रुटि निवारण कमाण्डहरू**: वैध प्रयोग गर्न `azd logs` सन्दर्भलाई `azd monitor --logs` मा सही गरियो

#### Fixed
- **🔐 प्रमाणीकरण कमाण्डहरू**: cheat-sheet.md मा `azd auth login` र `azd auth logout` थपियो
- **अवैध कमाण्ड सन्दर्भहरू**: README ट्रबलशुटिङ सेक्सनबाट बाँकी `azd logs` हटाइयो

#### Notes
- **स्कोप**: परिवर्तनहरू मुख्य README.md र resources/cheat-sheet.md मा लागू गरिएका छन्
- **लक्षित श्रोता**: सुधारहरू विशेष गरी AZD मा नयाँ विकासकर्ताहरू लक्षित गरीएका हुन्

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI कमाण्ड शुद्धता अपडेट
**यस संस्करणले कागजातभरि अवस्थित नभएका AZD कमाण्डहरू सही गर्दछ, जसले सबै कोड उदाहरणहरू वैध Azure Developer CLI सिन्ट्याक्स प्रयोग गर्छ सुनिश्चित गर्छ।**

#### Fixed
- **🔧 अवस्थित नभएका AZD कमाण्डहरू हटाइयो**: अवैध कमाण्डहरूको व्यापक अडिट र सुधार:
  - `azd logs` (अस्तित्वमा छैन) → `azd monitor --logs` वा Azure CLI विकल्पहरूमा परिवर्तन
  - `azd service` उप-आदेशहरू (अस्तित्वमा छैनन्) → `azd show` र Azure CLI सँग प्रतिस्थापित
  - `azd infra import/export/validate` (अस्तित्वमा छैन) → हटाइयो वा वैध विकल्पहरूमा प्रतिस्थापित
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` फ्ल्यागहरू (अस्तित्वमा छैनन्) → हटाइयो
  - `azd provision --what-if/--rollback` फ्ल्यागहरू (अस्तित्वमा छैनन्) → `--preview` प्रयोग गर्ने गरी अद्यावधिक गरियो
  - `azd config validate` (अस्तित्वमा छैन) → `azd config list` सँग प्रतिस्थापित
  - `azd info`, `azd history`, `azd metrics` (अस्तित्वमा छैनन्) → हटाइयो

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: कमाण्ड सन्दर्भको ठूलो पुनर्रचना
  - `docs/deployment/deployment-guide.md`: रोलब्याक र तैनाथीकरण रणनीतिहरू सुधारियो
  - `docs/troubleshooting/debugging.md`: लग विश्लेषण सेक्सनहरू सही गरियो
  - `docs/troubleshooting/common-issues.md`: ट्रबलशुटिङ कमाण्डहरू अद्यावधिक गरियो
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिङ सेक्सन सही गरियो
  - `docs/getting-started/azd-basics.md`: मोनिटरिङ कमाण्डहरू सुधारियो
  - `docs/getting-started/first-project.md`: मोनिटरिङ र डिबगिङ उदाहरणहरू अद्यावधिक गरियो
  - `docs/getting-started/installation.md`: मद्दत र संस्करण उदाहरणहरू सुधारियो
  - `docs/pre-deployment/application-insights.md`: लग हेर्ने कमाण्डहरू सही गरियो
  - `docs/pre-deployment/coordination-patterns.md`: एजेन्ट डिबगिङ कमाण्डहरू सुधारियो

#### Changed
- **Rollback रणनीतिहरू**: दस्तावेजीकरणलाई Git-आधारित रोलब्याक प्रयोग गर्न अद्यावधिक गरिएको (AZD मा नेटिभ रोलब्याक छैन)
- **लग हेर्नु**: `azd logs` सन्दर्भहरूलाई `azd monitor --logs`, `azd monitor --live`, र Azure CLI कमाण्डहरूसँग प्रतिस्थापित गरियो
- **प्रदर्शन सेक्सन**: अवस्थित नभएका parallel/incremental तैनाथीकरण फ्ल्यागहरू हटाइयो, वैध विकल्पहरू प्रदान गरियो

#### Technical Details
- **वैध AZD कमाण्डहरू**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor फ्ल्यागहरू**: `--live`, `--logs`, `--overview`
- **हटाइएका सुविधाहरू**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **प्रमाणीकरण**: कमाण्डहरू Azure Developer CLI v1.23.x विरुद्ध मान्य गरियो

---

### [v3.9.0] - 2026-02-05

#### कार्यशाला पूरा गरियो र दस्तावेज गुणस्तर अद्यावधिक
**यस संस्करणले अन्तरक्रियात्मक कार्यशाला मोड्युलहरू पूरा गर्दछ, सबै बिग्रिएका दस्तावेज लिङ्कहरू ठीक गर्दछ, र Microsoft AZD प्रयोग गर्ने AI विकासकर्ताहरूका लागि समग्र सामग्री गुणस्तर सुधार्छ।**

#### Added
- **📝 CONTRIBUTING.md**: नयाँ योगदान मार्गदर्शन दस्तावेज जसमा:
  - समस्याहरू रिपोर्ट गर्ने र परिवर्तन प्रस्ताव गर्ने स्पष्ट निर्देशहरू
  - नयाँ सामग्रीका लागि दस्तावेजीकरण मापदण्डहरू
  - कोड उदाहरण निर्देशिका र कमिट मेसेज सम्मेलनहरू
  - समुदाय संलग्नता जानकारी

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: पूर्ण रूपमा समाप्त गरिएको wrap-up मोड्युल जसमा:
  - कार्यशालाका उपलब्धिहरूको समग्र सारांश
  - मास्टर गरिएका मुख्य अवधारणाहरू (AZD, टेम्पलेटहरू, Microsoft Foundry समावेश)
  - सिकाइ यात्रा जारी राख्न सिफारिसहरू
  - कार्यशाला चुनौती अभ्यासहरू र कठिनाइ रेटिङहरू
  - समुदाय प्रतिक्रिया र समर्थन लिङ्कहरू

- **📚 Workshop Module 3 (Deconstruct)**: सिकाइ उद्देश्यहरू अद्यावधिक गरियो जसमा:
  - GitHub Copilot सँग MCP सर्भरहरू सक्रिय गर्ने मार्गदर्शन
  - AZD टेम्पलेट फोल्डर संरचना समझाउने
  - Infrastructure-as-code (Bicep) संगठन ढाँचा
  - ह्यान्ड्स-अन ल्याब निर्देशनहरू

- **🔧 Workshop Module 6 (Teardown)**: पूरा गरियो जसमा:
  - स्रोतहरू सफा गर्ने र लागत व्यवस्थापन उद्देश्यहरू
  - सुरक्षित पूर्वाधार डिप्रोभिजनका लागि `azd down` प्रयोग
  - सफ्ट-डिलेट गरिएका cognitive services पुनर्प्राप्ति मार्गदर्शन
  - GitHub Copilot र Azure Portal को लागि बोनस अन्वेषण प्रम्प्टहरू

#### Fixed
- **🔗 बिग्रिएका लिङ्कहरू ठीक गरियो**: 15+ भन्दा बढी भित्रका दस्तावेज लिङ्कहरू ठीक गरियो:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md तर्फका पथहरू ठीक गरियो
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md र production-ai-practices.md पथहरू सही गरियो
  - `docs/getting-started/first-project.md`: अवस्थित नभएको cicd-integration.md लाई deployment-guide.md सँग प्रतिस्थापित गरियो
  - `examples/retail-scenario.md`: FAQ र ट्रबलशुटिङ गाइड पथहरू ठीक गरियो
  - `examples/container-app/microservices/README.md`: कोर्स होम र तैनाथीकरण गाइड पथहरू सही गरियो
  - `resources/faq.md` र `resources/glossary.md`: AI अध्याय सन्दर्भहरू अद्यावधिक गरियो
  - `course-outline.md`: प्रशिक्षक गाइड र AI कार्यशाला ल्याब सन्दर्भहरू ठीक गरियो

- **📅 कार्यशाला स्थिति ब्यानर**: "Under Construction" बाट सक्रिय कार्यशाला स्थितिमा फेब्रुअरी 2026 मितिसहित अद्यावधिक गरियो

- **🔗 कार्यशाला नेभिगेसन**: workshop README.md मा lab-1-azd-basics फोल्डर不存在 तर्फ उन्मुख बिग्रिएका नेभिगेसन लिङ्कहरू ठीक गरियो

#### Changed
- **कार्यशाला प्रस्तुति**: "under construction" चेतावनी हटाइयो, कार्यशाला अब पूरा र प्रयोगका लागि तयार छ
- **नेभिगेसन एकरूपता**: सुनिश्चित गरियो कि सबै कार्यशाला मोड्युलहरूले उचित अन्तर-मोड्युल नेभिगेसन छ
- **सीखाइ मार्ग सन्दर्भहरू**: अध्याय क्रस-सन्दर्भहरू सही microsoft-foundry पथहरू प्रयोग गर्न अद्यावधिक गरियो

#### Validated
- ✅ सबै English markdown फाइलहरूमा वैध आन्तरिक लिङ्कहरू छन्
- ✅ कार्यशाला मोड्युलहरू 0-7 सम्म सिकाइ उद्देश्यहरूसहित पूरा छन्
- ✅ अध्यायहरू र मोड्युलहरूबीच नेभिगेसन सही ढंगले काम गर्छ
- ✅ सामग्री Microsoft AZD प्रयोग गर्ने AI विकासकर्ताहरूका लागि उपयुक्त छ
- ✅ सुरु गर्नेहरूका लागि भाषा र संरचना सरल राखिएको छ
- ✅ CONTRIBUTING.md ले समुदाय योगदानकर्ताहरूका लागि स्पष्ट मार्गदर्शन दिन्छ

#### Technical Implementation
- **लिङ्क प्रमाणीकरण**: स्वत: PowerShell स्क्रिप्टले सबै .md आन्तरिक लिङ्कहरू प्रमाणित गर्‍यो
- **सामग्री अडिट**: कार्यशालाको पूर्णता र सुरुमा उपयुक्तता मनुअल रूपमा समीक्षा गरियो
- **नेभिगेसन प्रणाली**: अध्याय र मोड्युल नेभिगेसन ढाँचाहरूमा सुसंगतता लागू गरियो

#### Notes
- **स्कोप**: परिवर्तनहरू केवल English दस्तावेजीकरणमा लागू गरियो
- **अनुवादहरू**: यस संस्करणमा अनुवाद फोल्डरहरू अद्यावधिक भएनन् (स्वचालित अनुवाद पछि सिंक हुनेछ)
- **कार्यशाला अवधि**: पूरा कार्यशालाले अब 3-4 घण्टाको ह्यान्ड्स-ऑन सिकाइ प्रदान गर्दछ

---

### [v3.8.0] - 2025-11-19

#### उन्नत दस्तावेजीकरण: मोनिटरिङ, सुरक्षा, र बहु-एजेन्ट ढाँचाहरू
**यस संस्करणले Application Insights एकीकरण, प्रमाणीकरण ढाँचाहरू, र उत्पादन तैनाथीकरणका लागि बहु-एजेन्ट समन्वयमा व्यापक A-ग्रेड पाठहरू थप्छ।**

#### Added
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md` मा:
  - AZD-केंद्रित तैनाथीकरण स्वचालित पूर्वाधिकारसहित
  - Application Insights + Log Analytics का लागि पूर्ण Bicep टेम्पलेटहरू
  - कस्टम टेलिमेट्री सहित कार्यरत Python एप्लिकेसनहरू (1,200+ लाइन)
  - AI/LLM मोनिटरिङ ढाँचाहरू (Microsoft Foundry Models टोकन/लागत ट्र्याकिङ)
  - 6 वटा Mermaid डायग्रामहरू (आर्किटेक्चर, वितरण गरिएको ट्रेसिङ, टेलिमेट्री फ्लो)
  - 3 ह्यान्ड्स-ऑन अभ्यासहरू (अलर्टहरू, ड्यासबोर्डहरू, AI मोनिटरिङ)
  - Kusto क्वेरी उदाहरणहरू र लागत अनुकूलन रणनीतिहरू
  - लाइभ मेट्रिक्स स्ट्रिमिङ र वास्तविक-समय डिबगिङ
  - 40-50 मिनेट सिकाइ समय र उत्पादन-तयार ढाँचाहरू

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md` मा:
  - 3 प्रमाणीकरण ढाँचाहरू (connection strings, Key Vault, managed identity)
  - सुरक्षित तैनाथीकरणका लागि पूर्ण Bicep पूर्वाधार टेम्पलेटहरू
  - Node.js एप्लिकेसन कोड Azure SDK एकीकरणसँग
  - 3 पूर्ण अभ्यासहरू (managed identity सक्षम गर्ने, user-assigned identity, Key Vault rotation)
  - सुरक्षा सर्वोत्तम अभ्यासहरू र RBAC कन्फिगरेसनहरू
  - ट्रबलशुटिङ गाइड र लागत विश्लेषण
  - उत्पादन-तयार पासवर्डलेस प्रमाणीकरण ढाँचाहरू

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md` मा:
  - 5 समन्वय ढाँचाहरू (क्रमिक, समवर्ती, पदानुक्रम, घटना-चालित, कन्सेन्सस)
  - पूर्ण ओर्केस्ट्रेटर सेवा कार्यान्वयन (Python/Flask, 1,500+ लाइन)
  - 3 विशेषज्ञ एजेन्ट कार्यान्वयनहरू (Research, Writer, Editor)
  - मेसेज क्यूइङका लागि Service Bus एकीकरण
  - वितरण प्रणालीहरूको लागि Cosmos DB राज्य व्यवस्थापन
  - एजेन्ट अन्तरक्रियाहरू देखाउने 6 Mermaid डायग्रामहरू
  - 3 एडभान्स अभ्यासहरू (timeout ह्यान्डलिङ, retry लॉजिक, circuit breaker)
  - लागत विवरण ($240-565/महिना) र अनुकूलन रणनीतिहरू
  - मोनिटरिङका लागि Application Insights एकीकरण

#### Enhanced
- **प्रि-डेप्लोइमेन्ट अध्याय**: अब व्यापक मोनिटरिङ र समन्वय ढाँचाहरू समावेश
- **Getting Started अध्याय**: व्यावसायिक प्रमाणीकरण ढाँचाहरूले बढाइएको
- **उत्पादन तत्परता**: सुरक्षा देखि अव्जर्वबिलिटी सम्म पूर्ण कभरज
- **कोर्स आउटलाइन**: अध्याय 3 र 6 मा नयाँ पाठहरू सन्दर्भ गर्ने गरी अद्यावधिक

#### Changed
- **सिकाइ प्रगति**: सुरक्षा र मोनिटरिङलाई कोर्सभरि राम्रोसँग एकीकृत गरियो
- **दस्तावेज गुणस्तर**: नयाँ पाठहरूमा सुसंगत A-ग्रेड मापदण्डहरू (95-97%) लागू गरियो
- **उत्पादन ढाँचाहरू**: उद्यम तैनाथीकरणका लागि अन्त्य-देखि-अन्त्य कभरज पूरा

#### Improved
- **Developer Experience**: विकास देखि उत्पादन मोनिटरिङसम्म स्पष्ट मार्ग
- **Security Standards**: प्रमाणीकरण र गोप्य व्यवस्थापनका लागि पेशेवर ढाँचा
- **Observability**: AZD सँग पूर्ण Application Insights एकीकरण
- **AI Workloads**: Microsoft Foundry Models र बहु-एजेन्ट प्रणालीहरूको लागि विशेश मोनिटरिङ

#### प्रमाणित
- ✅ सबै पाठहरूमा पूर्ण काम गर्ने कोड समावेश छ (खंडहरू होइन)
- ✅ दृश्य अध्ययनका लागि Mermaid रेखाचित्रहरू (कुल 19, 3 पाठहरूमा)
- ✅ प्रमाणिकरण चरणहरूसँग हात-बस्ने अभ्यासहरू (कुल 9)
- ✅ उत्पादन-तयार Bicep टेम्पलेटहरू जुन `azd up` मार्फत तैनाथ गर्न मिल्छ
- ✅ लागत विश्लेषण र अनुकूलन रणनीतिहरू
- ✅ समस्याहरू समाधान गर्ने गाइडहरू र उत्तम अभ्यासहरू
- ✅ सत्यापन आदेशहरूसहित ज्ञान जाँचबुँदा

#### दस्तावेज गुणस्तर नतिजा
- **docs/pre-deployment/application-insights.md**: - व्यापक मोनिटरिङ गाइड
- **docs/getting-started/authsecurity.md**: - पेशेवर सुरक्षा ढाँचाहरू
- **docs/pre-deployment/coordination-patterns.md**: - उन्नत बहु-एजेन्ट आर्किटेक्चरहरू
- **Overall New Content**: - निरन्तर उच्च-गुणस्तर मानकहरू

#### प्राविधिक कार्यान्वयन
- **Application Insights**: Log Analytics + कस्टम टेलीमेट्री + वितरित ट्रेसिङ
- **Authentication**: Managed Identity + Key Vault + RBAC ढाँचाहरू
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + अर्केस्ट्रेसन
- **Monitoring**: Live metrics + Kusto queries + alerts + ड्यासबोर्डहरू
- **Cost Management**: स्याम्पलिङ रणनीतिहरू, रिटेन्शन नीतिहरू, बजेट नियन्त्रणहरू

### [v3.7.0] - 2025-11-19

#### दस्तावेज गुणस्तर सुधार र नयाँ Microsoft Foundry Models उदाहरण
**यो संस्करणले भण्डारभरि दस्तावेज गुणस्तर सुधार गर्छ र gpt-4.1 च्याट इन्टरफेस सहित पूर्ण Microsoft Foundry Models तैनाथीकरण उदाहरण थप्छ।**

#### थपियो
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - पूर्ण Microsoft Foundry Models पूर्वाधार (gpt-4.1 मोडेल तैनाथीकरण)
  - संवाद इतिहास सहित Python कमाण्ड-लाइन च्याट इन्टरफेस
  - सुरक्षित API कुञ्जी भण्डारणका लागि Key Vault एकीकरण
  - टोकन प्रयोग ट्र्याकिङ र लागत अनुमान
  - रेट लिमिटिङ र त्रुटि ह्यान्डलिङ
  - विस्तृत README जसमा 35-45 मिनेटको तैनाथीकरण मार्गदर्शिका
  - 11 उत्पादन-तयार फाइलहरू (Bicep टेम्पलेटहरू, Python एप, कन्फिगरेसन)
- **📚 Documentation Exercises**: कन्फिगरेसन गाइडमा हात-बस्ने अभ्यासहरू थपियो:
  - अभ्यास 1: बहु-पर्यावरण कन्फिगरेसन (15 मिनेट)
  - अभ्यास 2: गोप्य व्यवस्थापन अभ्यास (10 मिनेट)
  - स्पष्ट सफलता मापदण्डहरू र प्रमाणिकरण चरणहरू
- **✅ Deployment Verification**: तैनाथीकरण गाइडमा प्रमाणीकरण खण्ड थपियो:
  - स्वास्थ्य जाँच प्रक्रिया
  - सफलता मापदण्ड चेकलिस्ट
  - सबै तैनाथीकरण आदेशहरूको अपेक्षित आउटपुटहरू
  - समस्या समाधान छिटो सन्दर्भ

#### सुधार गरिएको
- **examples/README.md**: Updated to A-grade quality (93%):
  - azure-openai-chat लाई सबै सम्बन्धित खण्डहरूमा थपियो
  - स्थानीय उदाहरण संख्या 3 बाट 4 मा अद्यावधिक गरियो
  - AI Application Examples तालिकामा थपियो
  - Intermediate Users का लागि Quick Start मा समाहित गरियो
  - Microsoft Foundry Templates खण्डमा थपियो
  - Comparison Matrix र प्रविधि सम्बन्धी खण्डहरू अद्यावधिक गरियो

#### दस्तावेज गुणस्तर
- docs फोल्डरमा गुणस्तर B+ (87%) → A- (92%) मा सुधार भयो:
  - महत्वपूर्ण आदेश उदाहरणहरूमा अपेक्षित आउटपुटहरू थपियो
  - कन्फिगरेसन परिवर्तनहरूको लागि प्रमाणिकरण चरणहरू समावेश गरियो
  - व्यावहारिक अभ्यासहरूसँग हात-बस्ने सिकाइ सुधार गरियो

#### परिवर्तनहरू
- **Learning Progression**: मध्यवर्ती सिक्नेहरूका लागि AI उदाहरणहरूको राम्रो एकीकरण
- **Documentation Structure**: स्पष्ट परिणामसहित अझ कार्यान्वयन योग्य अभ्यासहरू
- **Verification Process**: प्रमुख काम प्रक्रियाहरूमा स्पष्ट सफलता मापदण्ड थपियो

#### सुधारिएको
- **Developer Experience**: Microsoft Foundry Models तैनाथीकरण अब 35-45 मिनेट लाग्छ (जटिल विकल्पहरूको लागि 60-90 को साटो)
- **Cost Transparency**: Microsoft Foundry Models उदाहरणका लागि स्पष्ट लागत अनुमान ($50-200/महिना)
- **Learning Path**: AI विकासकर्ताहरूले azure-openai-chat सँग स्पष्ट प्रवेश बिन्दु पाउँछन्
- **Documentation Standards**: लगातार अपेक्षित आउटपुट र प्रमाणिकरण चरणहरू

#### प्रमाणित
- ✅ Microsoft Foundry Models उदाहरण `azd up` सँग पूर्ण रूपमा कार्यशील छ
- ✅ सबै 11 कार्यान्वयन फाइलहरू सिन्ट्याक्सिक रूपमा सही छन्
- ✅ README निर्देशनहरू वास्तविक तैनाथीकरण अनुभवसँग मेल खान्छ
- ✅ दस्तावेज लिंकहरू 8+ स्थानहरूमा अद्यावधिक गरिएका छन्
- ✅ Examples इन्डेक्सले 4 स्थानीय उदाहरणहरूलाई ठीकसँग प्रतिविम्बित गर्छ
- ✅ तालिकामा कुनै दोहोरिएको बाह्य लिंक छैन
- ✅ सबै नेभिगेसन सन्दर्भहरू सही छन्

#### प्राविधिक कार्यान्वयन
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps ढाँचा
- **Security**: Managed Identity तयार, गोप्यहरू Key Vault मा
- **Monitoring**: Application Insights एकीकरण
- **Cost Management**: टोकन ट्र्याकिङ र प्रयोग अनुकूलन
- **Deployment**: पूरा सेटअपका लागि एकल `azd up` आदेश

### [v3.6.0] - 2025-11-19

#### प्रमुख अपडेट: Container App तैनाथीकरण उदाहरणहरू
**यो संस्करणले Azure Developer CLI (AZD) प्रयोग गरी विस्तृत, उत्पादन-तयार कन्टेनर अनुप्रयोग तैनाथीकरण उदाहरणहरू प्रस्तुत गर्छ, पूर्ण दस्तावेज र सिकाइ मार्गमा एकीकरणसहित।**

#### थपियो
- **🚀 Container App Examples**: नयाँ स्थानीय उदाहरणहरू `examples/container-app/` मा:
  - [मुख्य मार्गदर्शक](examples/container-app/README.md): कन्टेनराइज्ड तैनाथीकरणहरूको पूर्ण अवलोकन, क्विक स्टार्ट, उत्पादन, र उन्नत ढाँचाहरू
  - [सरल Flask API](../../examples/container-app/simple-flask-api): स्केल-टु-जीरो, हेल्थ प्रोब्स, मोनिटरिङ, र समस्या समाधानसहित सुरु गर्न अनुकूल REST API
  - [माइक्रोसर्भिस आर्किटेक्चर](../../examples/container-app/microservices): उत्पादन-तयार बहु-सेवा तैनाथीकरण (API Gateway, Product, Order, User, Notification), असिंक्रोनस मेसेजिङ, Service Bus, Cosmos DB, Azure SQL, वितरित ट्रेसिङ, ब्लू-ग्रीन/क्यानरी तैनाथीकरण
- **Best Practices**: सुरक्षा, मोनिटरिङ, लागत अनुकूलन, र कन्टेनराइज्ड वर्कलोडहरूको लागि CI/CD मार्गदर्शन
- **Code Samples**: पूर्ण `azure.yaml`, Bicep टेम्पलेटहरू, र बहु-भाषी सेवा कार्यान्वयनहरू (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: एंड-टु-एंड परीक्षण परिदृश्यहरू, मोनिटरिङ आदेशहरू, समस्या समाधान मार्गदर्शन

#### परिवर्तनहरू
- **README.md**: नयाँ Container App उदाहरणहरू 'Local Examples - Container Applications' अन्तर्गत समावेश र लिंक गर्न अद्यावधिक गरियो
- **examples/README.md**: Container App उदाहरणहरूलाई हाइलाइट गर्न, तुलना म्याट्रिक्स लेखहरू थप्न, र प्रविधि/आर्किटेक्चर सन्दर्भहरू अद्यावधिक गर्न अपडेट गरिएको
- **Course Outline & Study Guide**: सम्बन्धित अध्यायहरूमा नयाँ Container App उदाहरणहरू र तैनाथीकरण ढाँचाहरू सन्दर्भ गर्ने गरी अद्यावधिक गरियो

#### प्रमाणित
- ✅ सबै नयाँ उदाहरणहरू `azd up` सँग तैनाथ गर्न मिल्ने गरी छन् र उत्तम अभ्यासहरू अनुसरण गर्छन्
- ✅ दस्तावेज क्रस-लिङ्कहरू र नेभिगेसन अद्यावधिक गरिएको छ
- ✅ उदाहरणहरूले आरम्भदेखि उन्नत परिदृश्यहरू सम्म समेट्छन्, उत्पादन माइक्रोसर्भिस समावेश गरेर

#### नोटहरू
- **Scope**: अंग्रेजी दस्तावेज र उदाहरणहरू मात्र
- **Next Steps**: भविष्यका रिलिजहरूमा थप उन्नत कन्टेनर ढाँचाहरू र CI/CD अटोमेसन विस्तार गर्ने

### [v3.5.0] - 2025-11-19

#### उत्पादन पुन: ब्रान्डिङ: Microsoft Foundry
**यो संस्करणले Microsoft को आधिकारिक पुनब्रान्डिङलाई प्रतिबिम्बित गर्दै English दस्तावेजहरूमा "Microsoft Foundry" बाट "Microsoft Foundry" मा व्यापक उत्पादन नाम परिवर्तन लागू गर्छ।**

#### परिवर्तनहरू
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Updated all references across English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### अद्यावधिक फाइलहरू
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेभिगेसन लिंक अपडेटहरू
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 उत्पादन नाम सन्दर्भहरू अपडेट गरियो
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पहिले देखि नै Microsoft Foundry प्रयोगमा (पछिल्ला अद्यावधिकहरूबाट)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 सन्दर्भ अपडेटहरू (ओभरभ्यू, समुदाय प्रतिक्रिया, दस्तावेज)
  - `docs/getting-started/azd-basics.md` - 4 क्रस-रेफरेन्स लिंक अपडेटहरू
  - `docs/getting-started/first-project.md` - 2 अध्याय नेभिगेसन लिंक अपडेटहरू
  - `docs/getting-started/installation.md` - 2 अर्को अध्याय लिंकहरू अद्यावधिक
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 सन्दर्भ अपडेटहरू (नेभिगेसन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - 1 नेभिगेसन लिंक अपडेट
  - `docs/troubleshooting/debugging.md` - 1 नेभिगेसन लिंक अपडेट

- **Course Structure Files** (2 files):
  - `README.md` - 17 सन्दर्भ अपडेट गरियो (कोर्स ओभरभ्यू, अध्याय शीर्षकहरू, टेम्प्लेट सेक्सन, समुदाय इनसाइट)
  - `course-outline.md` - 14 सन्दर्भ अपडेट गरियो (ओभरभ्यू, सिकाइ उद्देश्यहरू, अध्याय स्रोतहरू)

#### प्रमाणित
- ✅ अंग्रेजी दस्तावेजहरूमा बाँकी कुनै "ai-foundry" फोल्डर पथ सन्दर्भ छैन
- ✅ अंग्रेजी दस्तावेजहरूमा बाँकी कुनै "Microsoft Foundry" उत्पाद नाम सन्दर्भ छैन
- ✅ नयाँ फोल्डर संरचनासँग सबै नेभिगेसन लिङ्कहरू कार्यशील छन्
- ✅ फाइल र फोल्डर नाम परिवर्तन सफलतापूर्वक पूरा भयो
- ✅ अध्यायहरू बीचका क्रस-रेफरेन्सहरू प्रमाणित गरियो

#### नोटहरू
- **Scope**: परिवर्तनहरू `docs/` फोल्डरमा रहेका अंग्रेजी दस्तावेजहरूमा मात्र लागू गरियो
- **Translations**: Translation फोल्डरहरू (`translations/`) यस संस्करणमा अद्यावधिक गरिएका छैनन्
- **Workshop**: Workshop सामग्रीहरू (`workshop/`) यस संस्करणमा अद्यावधिक गरिएका छैनन्
- **Examples**: उदाहरण फाइलहरूले अझै पनि पुरानो नामकरण सन्दर्भ गर्न सक्छन् (भविष्यमा अद्यावधिक गरिनेछ)
- **External Links**: बाह्य URL हरू र GitHub रेपो सन्दर्भहरू अपरिवर्तित छन्

#### योगदानकर्ताहरूका लागि माइग्रेशन मार्गदर्शिका
यदि तपाईंसँग स्थानीय ब्रान्चहरू वा पुरानो संरचनालाई सन्दर्भ गर्ने दस्तावेजहरू छन्:
1. फोल्डर सन्दर्भहरू अद्यावधिक गर्नुहोस्: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फाइल सन्दर्भहरू अद्यावधिक गर्नुहोस्: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पादन नाम परिवर्तन गर्नुहोस्: "Microsoft Foundry" → "Microsoft Foundry"
4. सबै आन्तरिक दस्तावेज लिङ्कहरू अझै काम गर्छन् कि छैनन् भनी प्रमाणित गर्नुहोस्

---

### [v3.4.0] - 2025-10-24

#### पूर्वाधार पूर्वावलोकन र प्रमाणीकरण सुधारहरू
**यो संस्करणले नयाँ Azure Developer CLI प्रिभ्यु सुविधाको लागि व्यापक समर्थन प्रस्तुत गर्छ र कार्यशाला प्रयोगकर्ता अनुभव सुधार गर्छ।**

#### थपियो
- **🧪 azd provision --preview Feature Documentation**: नयाँ पूर्वाधार प्रिभ्यु क्षमताको व्यापक कभरिज
  - चिट शीटमा कमाण्ड संदर्भ र प्रयोग उदाहरणहरू
  - प्रोभिजनिङ गाइडमा उपयोग केसहरू र लाभसहित विस्तृत एकीकरण
  - सुरक्षित तैनाथीकरण प्रमाणीकरणको लागि प्रि-फ्लाइट चेक एकीकरण
  - सुरक्षा-प्रथम तैनाथीकरण अभ्यासहरूसँग गेटिङ स्टार्ट गाइड अद्यावधिक
- **🚧 Workshop Status Banner**: कार्यशाला विकास स्थितिलाई संकेत गर्ने व्यावसायिक HTML ब्यानर
  - स्पष्ट प्रयोगकर्ता सञ्चारका लागि निर्माण सूचकहरूसहित ग्रेडियन्ट डिजाइन
  - पारदर्शिताका लागि अन्तिम अद्यावधिक टाइमस्ट्याम्प
  - सबै उपकरण प्रकारका लागि मोबाइल-प्रतिक्रियाशील डिजाइन

#### सुधारिएको
- **Infrastructure Safety**: पूर्वावलोकन कार्यक्षमता तैनाथीकरण दस्तावेजहरूमा समावेश गरियो
- **Pre-deployment Validation**: स्वचालित स्क्रिप्टहरू अब पूर्वाधार प्रिभ्यु परीक्षण समावेश गर्छन्
- **Developer Workflow**: कमाण्ड अनुक्रमहरू प्रिभ्युलाई उत्तम अभ्यासका रूपमा समावेश गरी अद्यावधिक गरियो
- **Workshop Experience**: प्रयोगकर्ताहरूका लागि सामग्री विकास स्थितिको स्पष्ट अपेक्षा सेट गरियो

#### परिवर्तनहरू
- **Deployment Best Practices**: प्रिभ्यु-प्रथम कार्यप्रवाह अब सिफारिस गरिएको दृष्टिकोण
- **Documentation Flow**: सिकाइ प्रक्रियामा पूर्वाधार प्रमाणीकरणलाई पहिले सारियो
- **Workshop Presentation**: स्पष्ट विकास समयरेखा सहित व्यावसायिक स्थिति सञ्चार

#### सुधारिएको
- **Safety-First Approach**: पूर्वाधार परिवर्तनहरू तैनाथ गर्नु अघि प्रमाणीकरण गर्न सकिन्छ
- **Team Collaboration**: प्रिभ्यु नतिजाहरू समीक्षा र अनुमोदनका लागि साझा गर्न मिल्ने
- **Cost Awareness**: प्रोभिजनिङ अघि स्रोत लागतको राम्रो समझ
- **Risk Mitigation**: अग्रिम प्रमाणीकरणले तैनाथीकरण असफलता घटाउन मद्दत गर्दछ

#### प्राविधिक कार्यान्वयन
- **Multi-document Integration**: प्रिभ्यु सुविधा 4 प्रमुख फाइलहरूमा दस्तावेज गरिएको छ
- **Command Patterns**: सम्पूर्ण दस्तावेजमा सुसंगत सिन्ट्याक्स र उदाहरणहरू
- **Best Practice Integration**: प्रमाणीकरण वर्कफ्लो र स्क्रिप्टहरूमा प्रिभ्यु समावेश
- **Visual Indicators**: नयाँ सुविधाको लागि स्पष्ट NEW मार्किङहरू खोजयोग्यताको लागि

#### Workshop Infrastructure
- **Status Communication**: ग्रेडियन्ट शैलीको व्यावसायिक HTML ब्यानर
- **User Experience**: स्पष्ट विकास स्थिति प्रयोगकर्ताको भ्रम रोक्छ
- **Professional Presentation**: अपेक्षाहरू सेट गर्दै भण्डारको विश्वसनीयता कायम राख्छ
- **Timeline Transparency**: October 2025 अन्तिम अद्यावधिक टाइमस्ट्याम्प जवाफदेहिताका लागि

### [v3.3.0] - 2025-09-24

#### सुधारिएको कार्यशाला सामग्री र अन्तरक्रियात्मक सिकाइ अनुभव
**यो संस्करणले ब्राउजर-आधारित अन्तरक्रियात्मक मार्गदर्शकहरू र संरचित सिकाइ मार्गहरू सहित व्यापक कार्यशाला सामग्री प्रस्तुत गर्छ।**

#### थपियो
- **🎥 इन्टरएक्टिभ कार्यशाला मार्गदर्शक**: ब्राउजर-आधारित कार्यशाला अनुभव MkDocs पूर्वावलोकन क्षमता सहित
- **📝 संरचित कार्यशाला निर्देशनहरू**: पत्ता लगाउनदेखि अनुकूलनसम्मको 7-स्टेप मार्गदर्शन सिकाइ मार्ग
  - 0-Introduction: कार्यशाला अवलोकन र सेटअप
  - 1-Select-AI-Template: टेम्प्लेट पत्ता लगाउने र चयन गर्ने प्रक्रिया
  - 2-Validate-AI-Template: डिप्लोयमेन्ट र मान्यकरण प्रक्रिया
  - 3-Deconstruct-AI-Template: टेम्प्लेट आर्किटेक्चरको समझ
  - 4-Configure-AI-Template: कन्फिगरेसन र अनुकूलन
  - 5-Customize-AI-Template: उन्नत परिमार्जन र पुनरावृत्ति
  - 6-Teardown-Infrastructure: क्लिनअप र स्रोत व्यवस्थापन
  - 7-Wrap-up: सारांश र आगामी कदमहरू
- **🛠️ कार्यशाला उपकरण**: सुधारिएको सिकाइ अनुभवका लागि Material थिम सहित MkDocs कन्फिगरेसन
- **🎯 हात-देखि-हात सिकाइ मार्ग**: 3-स्टेप कार्यविधि (पत्ता लगाउने → डिप्लोयमेन्ट → अनुकूलन)
- **📱 GitHub Codespaces एकीकरण**: सहज विकास वातावरण सेटअप

#### सुधारिएको
- **AI Workshop Lab**: 2-3 घण्टा विस्तारित र समग्र संरचित सिकाइ अनुभवसहित विस्तार गरिएको
- **कार्यशाला डकुमेन्टेशन**: नेभिगेसन र भिजुअल सहायताहरु सहित व्यावसायिक प्रस्तुति
- **सिकाइ प्रगति**: टेम्प्लेट चयनदेखि उत्पादन डिप्लोयमेन्टसम्म स्पष्ट चरण-द्वारा-चरण मार्गदर्शन
- **डेभलपर अनुभव**: समेटिएका उपकरणहरूद्वारा सरल गरिएको विकास कार्यप्रवाह

#### सुधारिएको
- **पहुँचयोग्यता**: खोज, कपी कार्यक्षमता, र थिम टगल सहित ब्राउजर-आधारित इन्टरफेस
- **स्व-गतिको सिकाइ**: फरक सिक्ने गतिहरूलाई समेट्ने लचिलो कार्यशाला संरचना
- **व्यावहारिक प्रयोग**: वास्तविक-विश्व AI टेम्प्लेट डिप्लोयमेन्ट परिदृश्यहरू
- **समुदाय एकीकरण**: कार्यशाला सहयोग र समर्थनका लागि Discord एकीकरण

#### कार्यशाला सुविधाहरू
- **इन-निर्मित खोज**: छिटो कुञ्जीशब्द र पाठ सिकाइ खोज
- **कोड ब्लक कपी गर्नुहोस्**: सबै कोड उदाहरणहरूको लागि होभर-टु-कपी कार्यक्षमता
- **थिम टगल**: विभिन्न प्राथमिकताका लागि डार्क/लाइट मोड समर्थन
- **दृश्य सम्पत्ति**: विस्तृत बुझाइका लागि स्क्रीनशट र आरेखहरू
- **मद्दत एकीकरण**: समुदाय समर्थनका लागि प्रत्यक्ष Discord पहुँच

### [v3.2.0] - 2025-09-17

#### प्रमुख नेभिगेसन पुनर्संरचना र अध्याय-आधारित सिकाइ प्रणाली
**यो संस्करणले रिपोजिटरीभरि सुधारिएको नेभिगेसन र व्यापक अध्याय-आधारित सिकाइ संरचना प्रस्तुत गर्दछ।**

#### थपियो
- **📚 अध्याय-आधारित सिकाइ प्रणाली**: सम्पूर्ण कोर्सलाई 8 प्रगतिशील सिकाइ अध्यायमा पुनर्संरचित
  - Chapter 1: आधार र छिटो सुरु (⭐ - 30-45 मिनेट)
  - Chapter 2: AI-प्रथम विकास (⭐⭐ - 1-2 घण्टा)
  - Chapter 3: कन्फिगरेसन र प्रमाणीकरण (⭐⭐ - 45-60 मिनेट)
  - Chapter 4: Infrastructure as Code र डिप्लोयमेन्ट (⭐⭐⭐ - 1-1.5 घण्टा)
  - Chapter 5: बहु-एजेन्ट AI समाधानहरू (⭐⭐⭐⭐ - 2-3 घण्टा)
  - Chapter 6: पूर्व-डिप्लोयमेन्ट मान्यकरण र योजना (⭐⭐ - 1 घण्टा)
  - Chapter 7: समस्यासूत्रिकरण र डिबगिङ (⭐⭐ - 1-1.5 घण्टा)
  - Chapter 8: उत्पादन र एन्त्रप्राइज नमूनाहरू (⭐⭐⭐⭐ - 2-3 घण्टा)
- **📚 समग्र नेभिगेसन प्रणाली**: सबै डकुमेन्टेशनमा सुसंगत नेभिगेसन हेडर र फुटर
- **🎯 प्रगति ट्रयाकिङ**: कोर्स पूरा गर्ने चेकलिस्ट र सिकाइ प्रमाणीकरण प्रणाली
- **🗺️ सिकाइ मार्गदर्शन**: फरक अनुभव स्तर र लक्ष्यका लागि स्पष्ट प्रवेश बिन्दुहरू
- **🔗 क्रस-रेफरन्स नेभिगेसन**: सम्बन्धित अध्यायहरू र पूर्वापेक्षाहरू स्पष्ट रूपमा लिंक गरिएको

#### सुधारिएको
- **README संरचना**: अध्याय-आधारित संगठनसहित संरचित सिकाइ प्लेटफर्ममा परिवर्तन गरिएको
- **डकुमेन्टेशन नेभिगेसन**: प्रत्येक पृष्ठले अब अध्याय सन्दर्भ र प्रगति मार्गदर्शन समावेश गर्दछ
- **टेम्प्लेट संगठन**: उदाहरणहरू र टेम्प्लेटहरू उपयुक्त सिकाइ अध्यायहरूमा मैप गरिएको
- **स्रोत एकीकरण**: चीट शीटहरू, FAQ, र अध्ययन गाइडहरू सम्बन्धित अध्यायहरूसँग जोडिएका
- **कार्यशाला एकीकरण**: हात-देखि-हात प्रयोगशालाहरूले बहु-अध्याय सिकाइ उद्देश्यहरूसँग मेल खाने गरी म्याप गरिएको

#### परिवर्तन गरिएको
- **सिकाइ प्रगति**: रेखीय डकुमेन्टेशनबाट लचिलो अध्याय-आधारित सिकाइमा सारियो
- **कन्फिगरेसन स्थान**: राम्रो सिकाइ प्रवाहका लागि कन्फिगरेसन मार्गदर्शकलाई Chapter 3 मा सारियो
- **AI सामग्री एकीकरण**: सिकाइ यात्राभरि AI-विशेष सामग्रीमा राम्रो एकीकरण
- **उत्पादन सामग्री**: उन्नत नमूनाहरू एन्त्रप्राइज सिक्नेहरूको लागि Chapter 8 मा समेकित

#### सुधारिएको
- **प्रयोगकर्ता अनुभव**: स्पष्ट नेभिगेसन ब्रेडक्रम्ब्स र अध्याय प्रगति संकेतकहरू
- **पहुँचयोग्यता**: सजिलो कोर्स यात्रा लागि सुसंगत नेभिगेसन ढाँचाहरू
- **व्यावसायिक प्रस्तुति**: शैक्षिक र कर्पोरेट तालिमका लागि विश्वविद्यालय-शैलीको कोर्स संरचना
- **सिकाइ दक्षता**: सुधारिएको संगठनद्वारा सम्बन्धित सामग्री फेला पार्ने समय घटाइएको

#### प्राविधिक कार्यान्वयन
- **नेभिगेसन हेडरहरू**: 40+ डकुमेन्टेशन फाइलहरूमा मानकीकृत अध्याय नेभिगेसन
- **फुटर नेभिगेसन**: सुसंगत प्रगति मार्गदर्शन र अध्याय पूरा गर्ने संकेतकहरू
- **क्रस-लिङ्किङ**: सम्बन्धित अवधारणाहरू जडान गर्ने व्यापक आन्तरिक लिङ्किङ प्रणाली
- **अध्याय म्यापिङ**: टेम्प्लेटहरू र उदाहरणहरू सिकाइ उद्देश्यहरूसँग स्पष्ट रूपमा सम्बन्धित

#### अध्ययन मार्गदर्शक सुधार
- **📚 व्यापक सिकाइ उद्देश्यहरू**: 8-अध्याय प्रणालीसँग मेल खाने गरी अध्ययन मार्गदर्शक पुनर्संरचित
- **🎯 अध्याय-आधारित मूल्याङ्कन**: प्रत्येक अध्यायमा विशिष्ट सिकाइ उद्देश्यहरू र व्यावहारिक अभ्यासहरू समावेश
- **📋 प्रगति ट्रयाकिङ**: मापनयोग्य नतिजा र पूरा गर्ने चेकलिस्ट सहित साप्ताहिक सिकाइ तालिका
- **❓ मूल्याङ्कन प्रश्नहरू**: प्रत्येक अध्यायका लागि ज्ञान मान्यकरण प्रश्नहरू र व्यावसायिक नतिजाहरू
- **🛠️ व्यावहारिक अभ्यासहरू**: वास्तविक डिप्लोयमेन्ट परिदृश्य र समस्यासूत्रिकरणसहित हात-देखि-हात क्रियाकलापहरू
- **📊 कौशल प्रगति**: आधारभूत अवधारणाबाट एन्त्रप्राइज नमूनासम्म स्पष्ट उन्नति र करियर विकास केन्द्रित
- **🎓 प्रमाणपत्र ढाँचा**: व्यावसायिक विकास नतिजा र समुदाय मान्यता प्रणाली
- **⏱️ समयरेखा व्यवस्थापन**: माइलस्टोन मान्यकरण सहित संरचित 10-सप्ताह सिकाइ योजना

### [v3.1.0] - 2025-09-17

#### सुधारिएको बहु-एजेन्ट AI समाधानहरू
**यस संस्करणले रिटेल बहु-एजेन्ट समाधानलाई राम्रो एजेन्ट नामकरण र सुधारिएको डकुमेन्टेसनसहित सुधार गर्दछ।**

#### परिवर्तन गरिएको
- **बहु-एजेन्ट शब्दावली**: रिटेल बहु-एजेन्ट समाधानभरि स्पष्ट समझका लागि "Cora agent" लाई "Customer agent" ले प्रतिस्थापन गरिएको
- **एजेन्ट आर्किटेक्चर**: सबै डकुमेन्टेसन, ARM टेम्प्लेटहरू, र कोड उदाहरणहरूमा सुसंगत "Customer agent" नामकरण प्रयोग गर्न अपडेट गरिएको
- **कन्फिगरेसन उदाहरणहरू**: नामकरण कन्वेन्सनहरू अद्यावधिक गरी आधुनिक एजेन्ट कन्फिगरेसन ढाँचाहरू प्रयोग गरिएको
- **डकुमेन्टेसन सुसंगतता**: सबै सन्दर्भहरू व्यावसायिक, वर्णनात्मक एजेन्ट नामहरू प्रयोग गर्न सुनिश्चित गरिएको

#### सुधारिएको
- **ARM Template Package**: retail-multiagent-arm-template लाई Customer agent सन्दर्भहरूसहित अपडेट गरिएको
- **आर्किटेक्चर आरेखहरू**: अद्यावधिक एजेन्ट नामकरणसहित Mermaid आरेखहरू ताजा गरिएको
- **कोड उदाहरणहरू**: Python क्लास र कार्यान्वयन उदाहरणहरू अब CustomerAgent नाम प्रयोग गर्छन्
- **Environment Variables**: सबै डिप्लोयमेन्ट स्क्रिप्टहरू CUSTOMER_AGENT_NAME कन्भेन्सन प्रयोग गर्न अपडेट गरिएको

#### सुधारिएको
- **डेभलपर अनुभव**: डकुमेन्टेसनमा एजेन्टका स्पष्ट भूमिकाहरू र जिम्मेवारीहरू
- **उत्पादन तयारी**: एन्त्रप्राइज नामकरण कन्वेन्सनसँग राम्रो अनुकूलता
- **सिकाइ सामग्रीहरू**: शैक्षिक प्रयोजनका लागि थप सहज एजेन्ट नामकरण
- **टेम्प्लेट प्रयोगयोग्यता**: एजेन्ट कार्य र डिप्लोयमेन्ट ढाँचाहरूको सरल समझ

#### प्राविधिक विवरण
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### प्रमुख परिवर्तन - AI डेभलपर केन्द्रित र Microsoft Foundry एकीकरण
**यस संस्करणले रिपोजिटरीलाई Microsoft Foundry एकीकरणसहित एक समग्र AI-केंद्रित सिकाइ स्रोतमा रूपान्तरण गर्दछ।**

#### थपियो
- **🤖 AI-प्रथम सिकाइ मार्ग**: AI डेभलपर र इन्जिनियरहरूलाई प्राथमिकता दिने पूर्ण पुनर्गठन
- **Microsoft Foundry एकीकरण मार्गदर्शक**: AZD लाई Microsoft Foundry सेवाहरूमा जडान गर्ने विस्तृत डकुमेन्टेसन
- **AI मोडेल डिप्लोयमेन्ट ढाँचाहरू**: मोडेल चयन, कन्फिगरेसन, र उत्पादन डिप्लोयमेन्ट रणनीतिहरू समेट्ने विस्तृत मार्गदर्शक
- **AI Workshop Lab**: AI अनुप्रयोगहरूलाई AZD-डिप्लोय गर्न मिल्ने समाधानहरूमा रूपान्तरण गर्ने 2-3 घण्टे हात-देखि-हात कार्यशाला
- **उत्पादन AI उत्तम अभ्यासहरू**: स्केल, मोनिटरिङ, र AI वर्कलोड सुरक्षित गर्ने एन्त्रप्राइज-तयार ढाँचाहरू
- **AI-विशेष समस्यासूत्रिकरण मार्गदर्शक**: Microsoft Foundry Models, Cognitive Services, र AI डिप्लोयमेन्ट समस्याहरूको लागि व्यापक ट्रबलशूटिङ
- **AI टेम्प्लेट ग्यालरी**: जटिलता रेटिङसहित Microsoft Foundry टेम्प्लेटहरूको विशेष संग्रह
- **कार्यशाला सामग्रीहरू**: हात-देखि-हात प्रयोगशाला र संदर्भ सामाग्रीसहित पूर्ण कार्यशाला संरचना

#### सुधारिएको
- **README संरचना**: Microsoft Foundry Discord बाट 45% समुदाय रुचि विवरणसहित AI-डेभलपर केन्द्रित
- **सिकाइ पथहरू**: विद्यार्थी र DevOps इन्जिनियरहरूको लागि परम्परागत पथहरूसँगै समर्पित AI डेभलपर यात्रा
- **टेम्प्लेट सिफारिशहरू**: azure-search-openai-demo, contoso-chat, र openai-chat-app-quickstart सहित चयन गरिएका AI टेम्प्लेटहरू
- **समुदाय एकीकरण**: AI-विशेष च्यानल र छलफलहरू सहित सुधारिएको Discord समुदाय समर्थन

#### सुरक्षा र उत्पादन केन्द्रित
- **Managed Identity ढाँचाहरू**: AI-विशेष प्रमाणीकरण र सुरक्षा कन्फिगरेसनहरू
- **लागत अनुकूलन**: टोकन प्रयोग ट्रयाकिङ र AI वर्कलोडका लागि बजेट नियन्त्रण
- **बहु-क्षेत्र डिप्लोयमेन्ट**: ग्लोबल AI अनुप्रयोग डिप्लोयमेन्टका रणनीतिहरू
- **प्रदर्शन मोनिटरिङ**: AI-विशेष मेट्रिक्स र Application Insights एकीकरण

#### डकुमेन्टेशन गुणस्तर
- **रेखीय कोर्स संरचना**: सुरु देखि उन्नत AI डिप्लोयमेन्ट ढाँचासम्म तार्किक प्रगति
- **मान्य URL हरू**: सबै बाह्य रिपोजिटरी लिङ्कहरू जाँचिएका र पहुँचयोग्य
- **पूर्ण संदर्भ**: सबै आन्तरिक डकुमेन्टेसन लिङ्कहरू मान्य र कार्यशील
- **उत्पादन तयार**: वास्तविक-विश्व उदाहरणहरूसहित एन्त्रप्राइज डिप्लोयमेन्ट ढाँचाहरू

### [v2.0.0] - 2025-09-09

#### प्रमुख परिवर्तन - रिपोजिटरी पुनर्संरचना र व्यावसायिक सुधार
**यस संस्करणले रिपोजिटरी संरचना र सामग्री प्रस्तुतीकरणमा महत्वपूर्ण सुधार प्रस्तुत गर्दछ।**

#### थपियो
- **संरचित सिकाइ ढाँचा**: अब सबै डकुमेन्टेशन पृष्ठहरूमा Introduction, Learning Goals, र Learning Outcomes सेक्सनहरू समावेश
- **नेभिगेसन प्रणाली**: मार्गदर्शित सिकाइ प्रगतिको लागि सबै डकुमेन्टेसनमा Previous/Next पाठ लिङ्कहरू थपियो
- **अध्ययन गाइड**: सिकाइ उद्देश्यहरू, अभ्यास अभ्यासहरू, र मूल्याङ्कन सामग्रीहरूसहित comprehensive study-guide.md
- **व्यावसायिक प्रस्तुति**: सुधारिएको पहुँचयोग्यताका लागि सबै इमोजी आइकनहरू हटाइयो
- **सामग्री संरचना सुधार**: सिकाइ सामग्रीहरूको संगठन र प्रवाह सुधारियो

#### परिवर्तन गरिएको
- **डकुमेन्टेसन ढाँचा**: सबै डकुमेन्टेसनलाई सुसंगत सिकाइ-केन्द्रित संरचनामा मानकीकृत गरिएको
- **नेभिगेसन प्रवाह**: सबै सिकाइ सामग्रीहरूमा तार्किक प्रगति लागू गरिएको
- **सामग्री प्रस्तुतीकरण**: स्पष्ट, व्यावसायिक फर्म्याटमा सजावटी तत्वहरू हटाइयो
- **लिङ्क संरचना**: नयाँ नेभिगेसन प्रणाली समर्थन गर्न सबै आन्तरिक लिङ्कहरू अद्यावधिक गरियो

#### सुधारिएको
- **पहुँचयोग्यता**: स्क्रिन रिडर अनुकूलतालाई सुधार गर्न इमोजी निर्भरताहरू हटाइयो
- **व्यावसायिक उपस्थिति**: एन्त्रप्राइज सिकाइका लागि उपयुक्त क्लिन, शैक्षिक-शैली प्रस्तुति
- **सिकाइ अनुभव**: प्रत्येक पाठका लागि स्पष्ट उद्देश्य र नतिजासहित संरचित दृष्टिकोण
- **सामग्री संगठन**: सम्बन्धित विषयहरूबीच राम्रो तार्किक प्रवाह र कनेक्सन

### [v1.0.0] - 2025-09-09

#### प्रारम्भिक रिलिज - समग्र AZD सिकाइ रिपोजिटरी

#### थपियो
- **कोर डकुमेन्टेसन संरचना**
  - पूरा getting-started गाइड श्रृंखला
  - समग्र डिप्लोयमेन्ट र प्रोभिजनिङ डकुमेन्टेसन
  - विस्तृत ट्रबलशुटिङ स्रोत र डिबगिङ गाइडहरू
  - पूर्व-डिप्लोयमेन्ट मान्यकरण उपकरण र प्रक्रिया

- **Getting Started मोड्युल**
  - AZD मूलभूत: कोर अवधारणाहरू र शब्दावली
  - स्थापना मार्गदर्शक: प्लेटफर्म-विशिष्ट सेटअप निर्देशनहरू
  - कन्फिगरेसन गाइड: वातावरण सेटअप र प्रमाणीकरण
  - पहिलो प्रोजेक्ट ट्युटोरियल: चरण-द्वारा-चरण हात-देखि-हात सिकाइ

- **डिप्लोयमेन्ट र प्रोभिजनिङ मोड्युल**
  - डिप्लोयमेन्ट गाइड: पूर्ण कार्यप्रवाह डकुमेन्टेसन
  - प्रोभिजनिङ गाइड: Bicep सहित Infrastructure as Code
  - उत्पादन डिप्लोयमेन्टका लागि उत्तम अभ्यासहरू
  - बहु-सेवा आर्किटेक्चर ढाँचाहरू

- **पूर्व-डिप्लोयमेन्ट मान्यकरण मोड्युल**
  - क्षमता योजना: Azure स्रोत उपलब्धताको मान्यकरण
  - SKU चयन: सेवा तहहरूको समग्र मार्गदर्शन
  - पूर्व-उडान जाँचहरू: स्वचालित मान्यकरण स्क्रिप्टहरू (PowerShell र Bash)
  - लागत अनुमान र बजेट योजना उपकरणहरू

- **ट्रबलशुटिङ मोड्युल**
  - सामान्य समस्याहरू: बारम्बार आउँने समस्या र समाधानहरू
  - डिबगिङ गाइड: प्रणालीगत समस्यासूत्रिकरण विधिहरू
  - उन्नत डायग्नोस्टिक प्रविधिहरू र उपकरणहरू
  - प्रदर्शन मोनिटरिङ र अनुकूलन

- **स्रोतहरू र सन्दर्भहरू**
  - कमाण्ड चीट शीट: आवश्यक कमाण्डहरूको छिटो सन्दर्भ
  - शब्दावली: व्यापक शब्द र संक्षेप परिभाषाहरू
  - FAQ: सामान्य प्रश्नहरूको विस्तृत उत्तरहरू
  - बाह्य स्रोत लिङ्कहरू र समुदाय कनेक्शनहरू

- **उदाहरणहरू र टेम्प्लेटहरू**
  - सरल वेब एप्लिकेसन उदाहरण
  - स्ट्याटिक वेबसाइट डिप्लोयमेन्ट टेम्प्लेट
  - कन्टेनर एप्लिकेसन कन्फिगरेसन
  - डाटाबेस एकीकरण ढाँचाहरू
  - माइक्रोसर्भिस आर्किटेक्चर उदाहरणहरू
  - सर्वरलेस फन्कसन कार्यान्वयनहरू

#### सुविधाहरू
- **बहु-प्ल्याटफर्म समर्थन**: Windows, macOS, र Linux का लागि स्थापना र कन्फिगरेसन गाइडहरू
- **विभिन्न सीप स्तरहरू**: विद्यार्थीदेखि व्यावसायिक डेभलपरसम्मका लागि डिजाइन गरिएको सामग्री
- **व्यावहारिक केन्द्रित**: हात-देखि-हात उदाहरणहरू र वास्तविक-विश्व परिदृश्यहरू
- **समग्र कवरेज**: आधारभूत अवधारणाबाट उन्नत एन्त्रप्राइज ढाँचासम्म
- **सुरक्षा-प्रथम दृष्टिकोण**: सुरक्षा उत्तम अभ्यासहरू समग्र रूपमा समाहित
- **लागत अनुकूलन**: लागत-प्रभावकारी डिप्लोयमेन्ट र स्रोत व्यवस्थापनका लागि मार्गदर्शन

#### डकुमेन्टेशन गुणस्तर
- **विस्तृत कोड उदाहरणहरू**: व्यावहारिक, परीक्षण गरिएका कोड नमुनाहरू
- **चरण-द्वारा-चरण निर्देशनहरू**: स्पष्ट, कार्ययोग्य मार्गदर्शन
- **व्यापक त्रुटि ह्यान्डलिङ**: सामान्य समस्याहरूको लागि ट्रबलशुटिङ
- **उत्तम अभ्यास एकीकरण**: उद्योग मानक र सिफारिशहरू
- **संस्करण अनुकूलता**: नवीनतम Azure सेवाहरू र azd सुविधासँग अद्यावधिक

## भविष्यका योजनाबद्ध सुधारहरू

### Version 3.1.0 (Planned)
#### AI प्लेटफर्म विस्तार
- **बहु-मोडেল समर्थन**: Hugging Face, Azure Machine Learning, र कस्टम मोडेलहरूको लागि एकीकरण ढाँचाहरू
- **एआई एजेन्ट फ्रेमवर्कहरू**: LangChain, Semantic Kernel, र AutoGen तैनाथीकरणका लागि टेम्पलेटहरू
- **उन्नत RAG ढाँचाहरू**: Azure AI Search बाहेकका भेक्टर डाटाबेस विकल्पहरू (Pinecone, Weaviate, आदि)
- **एआई अनुगमन**: मोडेल प्रदर्शन, टोकन प्रयोग, र प्रतिक्रिया गुणस्तरको लागि विस्तारित अनुगमन

#### विकासकर्ता अनुभव
- **VS Code एक्सटेन्सन**: एकीकृत AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot एकीकरण**: AI-सहायता प्राप्त AZD टेम्पलेट जेनरेशन
- **इन्टरएक्टिभ ट्युटोरियलहरू**: AI परिदृश्यहरूको लागि स्वचालित मान्यतासहितका व्यावहारिक कोडिङ अभ्यासहरू
- **भिडियो सामग्री**: एआई तैनाथीकरणमा केन्द्रित दृश्य सिकाइकर्ताहरूका लागि पूरक भिडियो ट्युटोरियलहरू

### संस्करण 4.0.0 (योजनामा)
#### एंटरप्राइज एआई ढाँचाहरू
- **शासन फ्रेमवर्क**: एआई मोडेल शासन, अनुपालन, र अडिट ट्रेलहरू
- **बहु-टेनेन्ट एआई**: अलग्गिएका एआई सेवासँग बहु ग्राहकहरूलाई सेवा दिनका ढाँचाहरू
- **एज एआई तैनाथीकरण**: Azure IoT Edge र कन्टेनर इन्स्ट्यान्सहरूसँग एकीकरण
- **हाइब्रिड क्लाउड एआई**: एआई कार्यभारहरूका लागि मल्टि-क्लाउड र हाइब्रिड तैनाथीकरण ढाँचाहरू

#### उन्नत सुविधाहरू
- **एआई पाइपलाइन स्वचालन**: Azure Machine Learning पाइपलाइनहरूसँग MLOps एकीकरण
- **उन्नत सुरक्षा**: शून्य-विश्वास ढाँचाहरू, निजी एन्डपोइन्टहरू, र उन्नत खतराबाट संरक्षण
- **प्रदर्शन अनुकूलन**: उच्च-थ्रूपुट एआई अनुप्रयोगहरूका लागि उन्नत ट्यूनिङ र स्केलिङ रणनीतिहरू
- **वैश्विक वितरण**: एआई अनुप्रयोगहरूका लागि सामग्री वितरण र एज क्याचिङ ढाँचाहरू

### संस्करण 3.0.0 (योजनामा) - हालको रिलिजले प्रतिस्थापित
#### प्रस्तावित थपहरू - अहिले v3.0.0 मा लागू गरियो
- ✅ **एआई-केंद्रित सामग्री**: व्यापक Microsoft Foundry एकीकरण (सम्पन्न)
- ✅ **इन्टरएक्टिभ ट्युटोरियलहरू**: व्यावहारिक एआई कार्यशाला ल्याब (सम्पन्न)
- ✅ **उन्नत सुरक्षा मोड्युल**: एआई-विशेष सुरक्षा ढाँचाहरू (सम्पन्न)
- ✅ **प्रदर्शन अनुकूलन**: एआई कार्यभार ट्यूनिङ रणनीतिहरू (सम्पन्न)

### संस्करण 2.1.0 (योजनामा) - आंशिक रूपमा v3.0.0 मा लागू
#### सानातिना सुधारहरू - केही अहिलेको रिलिजमा पूरा
- ✅ **थप उदाहरणहरू**: एआई-केंद्रित तैनाथीकरण परिदृश्यहरू (सम्पन्न)
- ✅ **प्रविस्तृत FAQ**: एआई-विशेष प्रश्नहरू र समस्या समाधान (सम्पन्न)
- **टूल एकीकरण**: उन्नत IDE र एडिटर एकीकरण मार्गनिर्देशहरू
- ✅ **मनिटरिङ विस्तार**: एआई-विशेष मनिटरिङ र अलर्टिङ ढाँचाहरू (सम्पन्न)

#### अझै भविष्यको रिलिजका लागि योजनामा
- **मोबाइल-मैत्री दस्तावेज**: मोबाइल सिकाइका लागि रेस्पोन्सिभ डिजाइन
- **अफलाइन पहुँच**: डाउनलोड गर्न मिल्ने कागजात प्याकेजहरू
- **उन्नत IDE एकीकरण**: AZD + AI वर्कफ्लोहरूको लागि VS Code एक्सटेन्सन
- **समुदाय ड्यासबोर्ड**: वास्तविक-समय समुदाय मेट्रिक्स र योगदान ट्र्याकिङ

## चेंजलगमा योगदान

### परिवर्तन रिपोर्टिङ
जब तपाईं यस रिपोजिटरीमा योगदान गर्नुहुन्छ, कृपया सुनिश्चित गर्नुहोस् कि चेंजलग प्रविष्टिहरूमा समावेश छ:

1. **संस्करण संख्या**: सेम्यान्टिक संस्करण पालन गर्दै (major.minor.patch)
2. **मिति**: रिलिज वा अद्यावधिक मिति YYYY-MM-DD ढाँचामा
3. **श्रेणी**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **स्पष्ट वर्णन**: के परिवर्तन भयो भन्ने संक्षिप्त वर्णन
5. **प्रभाव मूल्याङ्कन**: परिवर्तनहरूले विद्यमान प्रयोगकर्ताहरूलाई कसरी असर गर्छ

### Change Categories

#### Added
- नयाँ सुविधाहरू, दस्तावेज खण्डहरू, वा क्षमता
- नयाँ उदाहरणहरू, टेम्पलेटहरू, वा सिकाइ स्रोतहरू
- अतिरिक्त उपकरणहरू, स्क्रिप्टहरू, वा युटिलिटीहरू

#### Changed
- विद्यमान कार्यक्षमता वा दस्तावेजमा परिवर्तनहरू
- स्पष्टता वा शुद्धता सुधार गर्ने अद्यावधिकहरू
- सामग्री वा संगठनको पुनर्संरचना

#### Deprecated
- हटाइँदै गरेको सुविधाहरू वा विधिहरू
- हटाउन तालिका गरिएको दस्तावेज खण्डहरू
- जसका लागि राम्रो वैकल्पिक विधिहरू छन्

#### Removed
- अब प्रासंगिक नभएका सुविधाहरू, दस्तावेजहरू, वा उदाहरणहरू
- पुराना जानकारी वा अवमूल्यन गरिएको विधिहरू
- दोहोरिएका वा समेकित सामग्री

#### Fixed
- दस्तावेज वा कोडका त्रुटिहरूको सुधार
- रिपोर्ट गरिएका समस्याहरूको समाधान
- शुद्धता वा कार्यक्षमतामा सुधारहरू

#### Security
- सुरक्षा-सम्बन्धी सुधारहरू वा फिक्सहरू
- सुरक्षा सर्वश्रेष्ठ अभ्यासहरूमा अद्यावधिकहरू
- सुरक्षा कमजोरीहरूको समाधान

### सेम्यान्टिक संस्करण दिशानिर्देश

#### मुख्य संस्करण (X.0.0)
- प्रयोगकर्ताको कार्य आवश्यक पर्ने ब्रेकिङ परिवर्तनहरू
- सामग्री वा संगठनको महत्वपूर्ण पुनर्संरचना
- आधारभूत दृष्टिकोण वा कार्यविधि परिवर्तन गर्ने परिवर्तनहरू

#### माइनर संस्करण (X.Y.0)
- नयाँ सुविधाहरू वा सामग्री थपहरू
- ब्याकवर्ड कम्प्याटिबिलिटी कायम राख्ने सुधारहरू
- अतिरिक्त उदाहरणहरू, उपकरणहरू, वा स्रोतहरू

#### प्याच संस्करण (X.Y.Z)
- बग फिक्सहरू र सुधारहरू
- विद्यमान सामग्रीमा साना सुधारहरू
- स्पष्टिकरणहरू र साना सुधारहरू

## समुदाय प्रतिक्रिया र सुझावहरू

हामी यस सिकाइ स्रोत सुधार गर्न समुदायको प्रतिक्रिया उत्साहपूर्वक स्वागत गर्छौं:

### प्रतिक्रिया कसरी दिनुहोस्
- **GitHub Issues**: समस्याहरू रिपोर्ट गर्नुहोस् वा सुधारका सुझावहरू दिनुहोस् (AI-विशेष मुद्दाहरू स्वागत छन्)
- **Discord Discussions**: विचारहरू साझा गर्नुहोस् र Microsoft Foundry समुदायसँग संलग्न हुनुहोस्
- **Pull Requests**: सामग्रीमा सिधा सुधारहरू योगदान गर्नुहोस्, विशेष गरी एआई टेम्पलेटहरू र मार्गदर्शकहरू
- **Microsoft Foundry Discord**: AZD + AI छलफलका लागि #Azure च्यानलमा सहभागी हुनुहोस्
- **Community Forums**: फराकिला Azure विकासकर्ता छलफलहरूमा भाग लिनुहोस्

### प्रतिक्रिया श्रेणीहरू
- **AI सामग्री शुद्धता**: एआई सेवा एकीकरण र तैनाथीकरण जानकारीमा सुधारहरू
- **सिकाइ अनुभव**: एआई विकासकर्ता सिकाइ प्रवाह सुधारका लागि सुझावहरू
- **अभावि एआई सामग्री**: थप एआई टेम्पलेटहरू, ढाँचाहरू, वा उदाहरणहरूको अनुरोध
- **पहुँचयोग्यता**: विविध सिकाइ आवश्यकताहरूका लागि सुधारहरू
- **एआई टूल एकीकरण**: राम्रो एआई विकास वर्कफ्लो एकीकरणका लागि सुझावहरू
- **प्रोडक्सन एआई ढाँचाहरू**: एंटरप्राइज एआई तैनाथीकरण ढाँचाका अनुरोधहरू

### प्रतिक्रिया प्रतिबद्धता
- **इश्यू जवाफ**: रिपोर्ट गरिएका समस्याहरूका लागि 48 घन्टाभित्र
- **फिचर अनुरोधहरू**: एक हप्ताभित्र मूल्याङ्कन
- **समुदाय योगदानहरू**: एक हप्ताभित्र समीक्षा
- **सुरक्षा मुद्दाहरू**: तात्कालिक प्राथमिकता र छिटो उत्तर

## मर्मत तालिका

### नियमित अद्यावधिकहरू
- **मासिक समीक्षा**: सामग्रीको शुद्धता र लिङ्क प्रमाणीकरण
- **त्रैमासिक अद्यावधिकहरू**: प्रमुख सामग्री थप र सुधारहरू
- **छ-महिने समीक्षा**: व्यापक पुनर्संरचना र सुधार
- **वार्षिक रिलिजहरू**: महत्वपूर्ण सुधारहरूसहित प्रमुख संस्करण अद्यावधिकहरू

### अनुगमन र गुणस्तर आश्वासन
- **स्वचालित परीक्षण**: कोड उदाहरणहरू र लिङ्कहरूको नियमित मान्यकरण
- **समुदाय प्रतिक्रिया एकीकरण**: प्रयोगकर्ताका सुझावहरूको नियमित समावेशीकरण
- **प्रविधि अद्यावधिकहरू**: नवीनतम Azure सेवा र azd रिलिजहरूसँग मिलाउने
- **पहुँचयोग्यता अडिटहरू**: समावेशी डिजाइन सिद्धान्तहरूको लागि नियमित समीक्षा

## संस्करण समर्थन नीति

### हालको संस्करण समर्थन
- **लेटेस्ट मेजर संस्करण**: नियमित अद्यावधिकसहित पूर्ण समर्थन
- **अघिल्लो मेजर संस्करण**: 12 महिनाका लागि सुरक्षा अद्यावधिक र महत्वपूर्ण फिक्सहरू
- **लेगेसी संस्करणहरू**: केवल समुदाय समर्थन, कुनै आधिकारिक अद्यावधिक छैन

### माइग्रेशन मार्गदर्शन
जब प्रमुख संस्करणहरू रिलिज हुन्छन्, हामी प्रदान गर्छौं:
- **माइग्रेशन गाइडहरू**: चरण-द्वारा-चरण संक्रमण निर्देशनहरू
- **कम्प्याटिबिलिटी नोटहरू**: ब्रेकिंग परिवर्तनहरूका बारेमा विवरण
- **टूल समर्थन**: माइग्रेशनमा सहयोग पुर्‍याउने स्क्रिप्टहरू वा युटिलिटीहरू
- **समुदाय समर्थन**: माइग्रेशन प्रश्नहरूको लागि समर्पित फोरमहरू

---

**नेभिगेशन**
- **अघिल्लो पाठ**: [अध्ययन मार्गदर्शिका](resources/study-guide.md)
- **अर्को पाठ**: [मुख्य README](README.md) मा फर्किनुहोस्

**अपडेटमा रहनुहोस्**: नयाँ रिलिज र सिकाइ सामग्रीमा महत्वपूर्ण अपडेटहरूको लागि यस रिपोजिटरीलाई अनुगमन गर्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकता तर्फ प्रयासरत भए पनि, कृपया जानकारि राख्नुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा नै आधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। हामी यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि दायित्ववान छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
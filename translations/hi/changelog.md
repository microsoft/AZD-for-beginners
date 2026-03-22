# चेंजलॉग - AZD शुरुआती के लिए

## परिचय

यह चेंजलॉग AZD For Beginners रिपॉजिटरी में सभी उल्लेखनीय परिवर्तन, अपडेट और सुधारों का दस्तावेज़ करता है। हम सैमान्टिक वर्शनिंग सिद्धांतों का पालन करते हैं और उपयोगकर्ताओं को यह समझने में मदद करने के लिए इस लॉग को बनाए रखते हैं कि संस्करणों के बीच क्या बदला है।

## सीखने के लक्ष्य

इस चेंजलॉग की समीक्षा करके, आप:
- नए फीचर और सामग्री जोड़ियों के बारे में सूचित रहेंगे
- मौजूद दस्तावेज़ीकरण में किए गए सुधारों को समझेंगे
- शुद्धता सुनिश्चित करने के लिए बग फिक्स और सुधारों को ट्रैक करेंगे
- समय के साथ सीखने सामग्री के विकास का पालन करेंगे

## सीखने के परिणाम

चेंजलॉग प्रविष्टियों की समीक्षा के बाद, आप सक्षम होंगे:
- सीखने के लिए उपलब्ध नई सामग्री और संसाधनों की पहचान करना
- समझना कि किन अनुभागों को अपडेट या बेहतर किया गया है
- नवीनतम सामग्री के आधार पर अपनी सीखने की योजना बनाना
- भविष्य के सुधारों के लिए प्रतिक्रिया और सुझाव देने में योगदान करना

## संस्करण इतिहास

### [v3.18.0] - 2026-03-16

#### AZD AI CLI कमांड, सामग्री सत्यापन और टेम्पलेट विस्तार
**यह संस्करण सभी AI-संबंधित अध्यायों में `azd ai`, `azd extension`, और `azd mcp` कमांड कवरेज जोड़ता है, agents.md में टूटे हुए लिंक और अप्रचलित कोड को ठीक करता है, चीट शीट को अपडेट करता है, और Example Templates अनुभाग का ओवरहाल करता है जिसमें सत्यापित विवरण और नए Azure AI AZD टेम्पलेट शामिल हैं।**

#### जोड़ा गया
- **🤖 AZD AI CLI कवरेज** 7 फाइलों में (पहले केवल अध्याय 8 में था):
  - `docs/chapter-01-foundation/azd-basics.md` — नया "Extensions and AI Commands" सेक्शन जो `azd extension`, `azd ai agent init`, और `azd mcp` को परिचित कराता है
  - `docs/chapter-02-ai-development/agents.md` — विकल्प 4: `azd ai agent init` तुलना तालिका के साथ (template बनाम manifest दृष्टिकोण)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" और "Agent-First Deployment" उपखंड
  - `docs/chapter-05-multi-agent/README.md` — Quick Start अब दोनों template और manifest-आधारित डिप्लॉयमेंट पथ दिखाता है
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy सेक्शन अब `azd ai agent init` विकल्प शामिल करता है
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" उपखंड
  - `resources/cheat-sheet.md` — नया "AI & Extensions Commands" सेक्शन जिसमें `azd extension`, `azd ai agent init`, `azd mcp`, और `azd infra generate` शामिल हैं
- **📦 नए AZD AI उदाहरण टेम्पलेट** `microsoft-foundry-integration.md` में:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, और वॉइस चैट सपोर्ट के साथ .NET RAG चैट
  - **azure-search-openai-demo-java** — Langchain4J का उपयोग करके Java RAG चैट, ACA/AKS डिप्लॉयमेंट विकल्पों के साथ
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, और Prompty का उपयोग करने वाला मल्टी-एजेंट क्रिएटिव राइटिंग ऐप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB के साथ Serverless RAG, Ollama स्थानीय विकास समर्थन के साथ
  - **chat-with-your-data-solution-accelerator** — एडमिन पोर्टल, Teams इंटीग्रेशन, और PostgreSQL/Cosmos DB विकल्पों के साथ एंटरप्राइज़ RAG एक्सेलेरेटर
  - **azure-ai-travel-agents** — .NET, Python, Java, और TypeScript में सर्वरों के साथ मल्टी-एजेंट MCP ऑर्केस्ट्रेशन संदर्भ ऐप
  - **azd-ai-starter** — न्यूनतम Azure AI इन्फ्रास्ट्रक्चर Bicep starter टेम्पलेट
  - **🔗 Awesome AZD AI Gallery लिंक** — संदर्भ [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ टेम्पलेट्स)

#### ठीक किया गया
- **🔗 agents.md नेविगेशन**: Previous/Next लिंक अब Chapter 2 README पाठ क्रम से मेल खाते हैं (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md टूटे हुए लिंक**: `production-ai-practices.md` को `../chapter-08-production/production-ai-practices.md` से ठीक किया गया (3 स्थान)
- **📦 agents.md अप्रचलित कोड**: `opencensus` को `azure-monitor-opentelemetry` + OpenTelemetry SDK से बदला गया
- **🐛 agents.md अमान्य API**: `max_tokens` को `create_agent()` से हटाकर `create_run()` में `max_completion_tokens` के रूप में स्थानांतरित किया गया
- **🔢 agents.md टोकन गणना**: मोटे `len//4` अनुमान को `tiktoken.encoding_for_model()` से बदल दिया गया
- **azure-search-openai-demo**: सेवाओं को "Cognitive Search + App Service" से बदलकर "Azure AI Search + Azure Container Apps" कर दिया गया (डिफ़ॉल्ट होस्ट अक्टूबर 2024 में बदला गया)
- **contoso-chat**: विवरण को Azure AI Foundry + Prompty का संदर्भ देने के लिए अपडेट किया गया, जो रिपॉजिटरी के वास्तविक शीर्षक और तकनीकी स्टैक से मेल खाता है

#### निकाला गया
- **ai-document-processing**: गैर-कार्यशील टेम्पलेट संदर्भ हटा दिया गया (रिपॉजिटरी सार्वजनिक रूप से AZD टेम्पलेट के रूप में सुलभ नहीं)

#### सुधारा गया
- **📝 agents.md अभ्यास**: अभ्यास 1 अब अपेक्षित आउटपुट और `azd monitor` चरण दिखाता है; अभ्यास 2 में पूर्ण `FunctionTool` रजिस्ट्रेशन कोड शामिल है; अभ्यास 3 ने अस्पष्ट निर्देशों की जगह ठोस `prepdocs.py` कमांड दिए हैं
- **📚 agents.md संसाधन**: दस्तावेज़ीकरण लिंक को वर्तमान Azure AI Agent Service डॉक और क्विकस्टार्ट से अपडेट किया गया
- **📋 agents.md Next Steps तालिका**: पूर्ण अध्याय कवरेज के लिए AI Workshop Lab लिंक जोड़ा गया

#### अपडेट की गई फाइलें
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### कोर्स नेविगेशन सुधार
**यह संस्करण README.md अध्याय नेविगेशन को बेहतर तालिका प्रारूप के साथ सुधारता है।**

#### बदला गया
- **Course Map Table**: सीधे लेसन लिंक, अवधि के अनुमान, और जटिलता रेटिंग के साथ सुधार किया गया
- **फ़ोल्डर क्लीनअप**: अतिरिक्त पुराने फ़ोल्डर्स हटाए गए (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **लिंक सत्यापन**: Course Map तालिका में सभी 21+ आंतरिक लिंक सत्यापित किए गए

### [v3.16.0] - 2026-02-05

#### उत्पाद नाम अपडेट
**यह संस्करण उत्पाद संदर्भों को वर्तमान Microsoft ब्रांडिंग के अनुरूप अपडेट करता है।**

#### बदला गया
- **Microsoft Foundry → Microsoft Foundry**: सभी संदर्भ गैर-अनुवाद फ़ाइलों में अपडेट किए गए
- **Azure AI Agent Service → Foundry Agents**: सेवा नाम को वर्तमान ब्रांडिंग को प्रतिबिंबित करने के लिए अपडेट किया गया

#### अपडेट की गई फाइलें
- `README.md` - मुख्य कोर्स लैंडिंग पेज
- `changelog.md` - संस्करण इतिहास
- `course-outline.md` - कोर्स संरचना
- `docs/chapter-02-ai-development/agents.md` - AI एजेंट गाइड
- `examples/README.md` - उदाहरण दस्तावेज़ीकरण
- `workshop/README.md` - वर्कशॉप लैंडिंग पेज
- `workshop/docs/index.md` - वर्कशॉप इंडेक्स
- `workshop/docs/instructions/*.md` - सभी वर्कशॉप निर्देश फ़ाइलें

---

### [v3.15.0] - 2026-02-05

#### प्रमुख रिपॉजिटरी पुनर्गठन: अध्याय-आधारित फ़ोल्डर नाम
**यह संस्करण स्पष्ट नेविगेशन के लिए दस्तावेज़ीकरण को समर्पित अध्याय फ़ोल्डरों में फिर से व्यवस्थित करता है।**

#### फ़ोल्डर नाम बदलें
पुराने फ़ोल्डरों को अध्याय-नंबर वाले फ़ोल्डरों से बदल दिया गया:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- नया जोड़ा गया: `docs/chapter-05-multi-agent/`

#### फ़ाइल माइग्रेशन
| फ़ाइल | से | को |
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

#### जोड़ा गया
- **📚 अध्याय README फाइलें**: प्रत्येक अध्याय फ़ोल्डर में README.md बनाया गया जिसमें:
  - सीखने के उद्देश्य और अवधि
  - विवरण के साथ लेसन तालिका
  - क्विक स्टार्ट कमांड
  - अन्य अध्यायों की ओर नेविगेशन

#### बदला गया
- **🔗 सभी आंतरिक लिंक अपडेट किए गए**: 78+ पथ सभी दस्तावेज़ फ़ाइलों में अपडेट किए गए
- **🗺️ मुख्य README.md**: Course Map को नए अध्याय संरचना के साथ अपडेट किया गया
- **📝 examples/README.md**: अध्याय फ़ोल्डरों के लिए क्रॉस-रेफरेंस अपडेट किए गए

#### निकाला गया
- पुरानी फ़ोल्डर संरचना हटाई गई (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रिपॉजिटरी पुनर्गठन: अध्याय नेविगेशन
**यह संस्करण अध्याय नेविगेशन README फ़ाइलें जोड़ता है (जिसे v3.15.0 ने अधिवृत कर दिया)।**

---

### [v3.13.0] - 2026-02-05

#### नया AI एजेंट गाइड
**यह संस्करण Azure Developer CLI के साथ AI एजेंट तैनात करने के लिए एक व्यापक गाइड जोड़ता है।**

#### जोड़ा गया
- **🤖 docs/microsoft-foundry/agents.md**: पूरा गाइड शामिल:
  - AI एजेंट क्या हैं और वे चैटबॉट्स से कैसे अलग हैं
  - तीन क्विक-स्टार्ट एजेंट टेम्पलेट्स (Foundry Agents, Prompty, RAG)
  - एजेंट आर्किटेक्चर पैटर्न (सिंगल एजेंट, RAG, मल्टी-एजेंट)
  - टूल कॉन्फ़िगरेशन और अनुकूलन
  - मॉनिटरिंग और मेट्रिक्स ट्रैकिंग
  - लागत विचार और अनुकूलन
  - सामान्य ट्रबलशूटिंग परिदृश्य
  - तीन हैंड्स-ऑन अभ्यास सफलता मानदंडों के साथ

#### सामग्री संरचना
- **परिचय**: शुरुआत के लिए एजेंट अवधारणाएँ
- **क्विक स्टार्ट**: `azd init --template get-started-with-ai-agents` के साथ एजेंट तैनात करें
- **आर्किटेक्चर पैटर्न**: एजेंट पैटर्न के विज़ुअल डायग्राम
- **कॉन्फ़िगरेशन**: टूल सेटअप और पर्यावरण वेरिएबल्स
- **मॉनिटरिंग**: Application Insights एकीकरण
- **व्यायाम**: प्रगतिशील हैंड्स-ऑन सीखना (प्रति अभ्यास 20-45 मिनट)

---

### [v3.12.0] - 2026-02-05

#### DevContainer पर्यावरण अपडेट
**यह संस्करण AZD सीखने के अनुभव के लिए आधुनिक टूल और बेहतर डिफ़ॉल्ट्स के साथ विकास कंटेनर कॉन्फ़िगरेशन को अपडेट करता है।**

#### बदला गया
- **🐳 बेस इमेज**: `python:3.12-bullseye` से अपडेट करके `python:3.12-bookworm` (नवीनतम Debian स्थिर) किया गया
- **📛 कंटेनर नाम**: स्पष्टता के लिए "Python 3" से "AZD for Beginners" में पुनर्नामित किया गया

#### जोड़ा गया
- **🔧 नए Dev Container फीचर**:
  - `azure-cli` जिसमें Bicep समर्थन सक्षम है
  - `node:20` (AZD टेम्पलेट्स के लिए LTS संस्करण)
  - `github-cli` टेम्पलेट प्रबंधन के लिए
  - `docker-in-docker` कंटेनर ऐप परिनियोजनों के लिए

- **🔌 पोर्ट फॉरवर्डिंग**: सामान्य विकास के लिए पूर्व-कॉन्फ़िगर किए गए पोर्ट:
  - 8000 (MkDocs पूर्वावलोकन)
  - 3000 (वेब ऐप्स)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 नए VS Code एक्सटेंशंस**:
  - `ms-python.vscode-pylance` - उन्नत Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure संसाधन प्रबंधन
  - `yzhang.markdown-all-in-one` - Markdown संपादन
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid डायग्राम समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml के लिए)
  - `eamodio.gitlens` - Git विज़ुअलाइज़ेशन
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिंग्स**: Python इंटरप्रेटर, सहेजने पर फ़ॉर्मैट और व्हाइटस्पेस ट्रिमिंग के लिए डिफ़ॉल्ट सेटिंग्स जोड़ी गईं

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify plugin जोड़ा गया
  - कोड गुणवत्ता के लिए pre-commit जोड़ा गया
  - Azure SDK पैकेज जोड़े गए (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: अब कंटेनर स्टार्ट पर AZD और Azure CLI इंस्टॉलेशन सत्यापित करता है

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**यह संस्करण README.md को शुरुआती उपयोगकर्ताओं के लिए अधिक सुलभ बनाने के लिए महत्वपूर्ण सुधार करता है और AI डेवलपर्स के लिए आवश्यक संसाधन जोड़ता है।**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: यह स्पष्ट करता है कि किस टूल का कब उपयोग करना है, व्यावहारिक उदाहरणों के साथ
- **🌟 Awesome AZD Links**: समुदाय टेम्पलेट गैलरी और योगदान संसाधनों के सीधे लिंक:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैनाती-के-लिए-तैयार टेम्पलेट्स
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - सामुदायिक योगदान
- **🎯 Quick Start Guide**: सरलीकृत 3-स्टेप गेटिंग स्टार्ट सेक्शन (Install → Login → Deploy)
- **📊 अनुभव-आधारित नेविगेशन तालिका**: डेवलपर के अनुभव के आधार पर कहाँ से शुरू करें इसकी स्पष्ट मार्गदर्शिका

#### Changed
- **README संरचना**: प्रोग्रेसिव डिस्क्लोज़र के लिए पुनर्गठित - मुख्य जानकारी पहले
- **परिचय अनुभाग**: पूर्ण शुरुआती के लिए "The Magic of `azd up`" को समझाने के लिए पुनर्लेखन किया गया
- **डुप्लिकेट सामग्री हटाई गई**: डुप्लिकेट ट्रबलशूटिंग सेक्शन हटाया गया
- **Troubleshooting Commands**: `azd logs` संदर्भ को वैध `azd monitor --logs` के साथ ठीक किया गया

#### Fixed
- **🔐 Authentication Commands**: cheat-sheet.md में `azd auth login` और `azd auth logout` जोड़े गए
- **Invalid Command References**: README ट्रबलशूटिंग सेक्शन से शेष `azd logs` हटाया गया

#### Notes
- **Scope**: परिवर्तन मुख्य README.md और resources/cheat-sheet.md पर लागू किए गए
- **Target Audience**: सुधार विशेष रूप से AZD में नए डेवलपर्स के लक्ष्य के लिए हैं

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**यह संस्करण दस्तावेज़ीकरण में मौजूद असत्य AZD कमांड्स को सही करता है, यह सुनिश्चित करते हुए कि सभी कोड उदाहरण वैध Azure Developer CLI सिंटैक्स का उपयोग करें।**

#### Fixed
- **🔧 मौजूद नहीं होने वाले AZD कमांड्स हटाए गए**: अवैध कमांड्स का व्यापक ऑडिट और सुधार:
  - `azd logs` (मौजूद नहीं) → `azd monitor --logs` या Azure CLI विकल्पों से बदला गया
  - `azd service` उप-कमान्ड्स (मौजूद नहीं) → `azd show` और Azure CLI से बदला गया
  - `azd infra import/export/validate` (मौजूद नहीं) → हटा दिया गया या वैध विकल्पों से बदला गया
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` फ़्लैग्स (मौजूद नहीं) → हटाए गए
  - `azd provision --what-if/--rollback` फ़्लैग्स (मौजूद नहीं) → `--preview` का उपयोग करने के लिए अपडेट किया गया
  - `azd config validate` (मौजूद नहीं) → `azd config list` से बदला गया
  - `azd info`, `azd history`, `azd metrics` (मौजूद नहीं) → हटाए गए

- **📚 कमांड सुधारों के साथ फ़ाइलें अपडेट की गईं**:
  - `resources/cheat-sheet.md`: कमांड संदर्भ का बड़ा ओवरहाल
  - `docs/deployment/deployment-guide.md`: रोलबैक और परिनियोजन रणनीतियों को ठीक किया गया
  - `docs/troubleshooting/debugging.md`: लॉग विश्लेषण अनुभाग ठीक किए गए
  - `docs/troubleshooting/common-issues.md`: ट्रबलशूटिंग कमांड अपडेट किए गए
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिंग सेक्शन ठीक किया गया
  - `docs/getting-started/azd-basics.md`: मॉनिटरिंग कमांड्स सही किए गए
  - `docs/getting-started/first-project.md`: मॉनिटरिंग और डिबगिंग उदाहरण अपडेट किए गए
  - `docs/getting-started/installation.md`: हेल्प और वर्शन उदाहरण ठीक किए गए
  - `docs/pre-deployment/application-insights.md`: लॉग व्यूइंग कमांड्स ठीक किए गए
  - `docs/pre-deployment/coordination-patterns.md`: एजेंट डिबगिंग कमांड्स ठीक किए गए

- **📝 वर्शन संदर्भ अपडेट किया गया**:
  - `docs/getting-started/installation.md`: हार्डकोडेड `1.5.0` वर्शन को सामान्य `1.x.x` में बदला गया और releases के लिंक के साथ

#### Changed
- **Rollback रणनीतियाँ**: दस्तावेज़ीकरण को Git-आधारित रोलबैक का उपयोग करने के लिए अपडेट किया गया (AZD में मूलभूत रोलबैक नहीं है)
- **लॉग देखना**: `azd logs` संदर्भों को `azd monitor --logs`, `azd monitor --live`, और Azure CLI कमांड्स से बदला गया
- **प्रदर्शन सेक्शन**: अस्तित्व में न होने वाले parallel/incremental परिनियोजन फ़्लैग्स हटाए गए, वैध विकल्प दिए गए

#### Technical Details
- **वैध AZD कमांड्स**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor फ़्लैग्स**: `--live`, `--logs`, `--overview`
- **हटाई गई विशेषताएँ**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **सत्यापन**: कमांड्स Azure Developer CLI v1.23.x के विरुद्ध सत्यापित किए गए

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**यह संस्करण इंटरएक्टिव वर्कशॉप मॉड्यूलों को पूरा करता है, सभी टूटे हुए दस्तावेज़ी लिंक ठीक करता है, और Microsoft AZD का उपयोग करने वाले AI डेवलपर्स के लिए समग्र सामग्री गुणवत्ता में सुधार करता है।**

#### Added
- **📝 CONTRIBUTING.md**: नया योगदान निर्देशों वाला दस्तावेज़ जिसमें:
  - मुद्दों की रिपोर्ट करने और परिवर्तन प्रस्तावित करने के स्पष्ट निर्देश
  - नई सामग्री के लिए दस्तावेज़ीकरण मानक
  - कोड उदाहरण मार्गदर्शिकाएँ और commit संदेश कन्वेंशन्स
  - समुदाय सहभागिता जानकारी

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: पूरा किया गया रैप-अप मॉड्यूल जिसमें:
  - वर्कशॉप उपलब्धियों का व्यापक सारांश
  - AZD, टेम्पलेट्स, और Microsoft Foundry को कवर करने वाला मुख्य अवधारणाएँ अनुभाग
  - सीखने की यात्रा जारी रखने के लिए सिफारिशें
  - कठिनाई रेटिंग के साथ वर्कशॉप चुनौती अभ्यास
  - समुदाय प्रतिक्रिया और समर्थन लिंक

- **📚 Workshop Module 3 (Deconstruct)**: सीखने के उद्देश्यों को अपडेट किया गया जिसमें:
  - GitHub Copilot with MCP servers सक्रिय करने के निर्देश
  - AZD टेम्पलेट फ़ोल्डर स्ट्रक्चर की समझ
  - Infrastructure-as-code (Bicep) संगठन पैटर्न
  - हैंड्स-ऑन लैब निर्देश

- **🔧 Workshop Module 6 (Teardown)**: पूरा किया गया जिसमें:
  - संसाधन क्लीनअप और लागत प्रबंधन उद्देश्य
  - सुरक्षित अवसंरचना डिप्रोविज़निंग के लिए `azd down` का उपयोग
  - सॉफ्ट-डिलीटेड cognitive services रिकवरी गाइड
  - GitHub Copilot और Azure Portal के लिए बोनस एक्सप्लोरेशन प्रॉम्प्ट्स

#### Fixed
- **🔗 टूटी लिंकें ठीक की गईं**: 15+ टूटे आंतरिक दस्तावेज़ी लिंक हल किए गए:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md के पाथ ठीक किए गए
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md और production-ai-practices.md पाथ सही किए गए
  - `docs/getting-started/first-project.md`: अवास्तविक cicd-integration.md को deployment-guide.md से बदल दिया गया
  - `examples/retail-scenario.md`: FAQ और ट्रबलशूटिंग गाइड पाथ ठीक किए गए
  - `examples/container-app/microservices/README.md`: कोर्स होम और परिनियोजन गाइड पाथ ठीक किए गए
  - `resources/faq.md` और `resources/glossary.md`: AI चैप्टर संदर्भ अपडेट किए गए
  - `course-outline.md`: instructor guide और AI वर्कशॉप लैब संदर्भ ठीक किए गए

- **📅 वर्कशॉप स्टेटस बैनर**: "Under Construction" से सक्रिय वर्कशॉप स्टेटस में अपडेट किया गया, फरवरी 2026 की तारीख के साथ

- **🔗 वर्कशॉप नेविगेशन**: workshop README.md में टूटे नेविगेशन लिंक जो non-existent lab-1-azd-basics फ़ोल्डर की ओर इशारा कर रहे थे, ठीक किए गए

#### Changed
- **वर्कशॉप प्रस्तुति**: "under construction" चेतावनी हटा दी गई, वर्कशॉप अब पूरा और उपयोग के लिए तैयार है
- **नेविगेशन सुसंगति**: सुनिश्चित किया गया कि सभी वर्कशॉप मॉड्यूलों में उचित इंटर-मॉड्यूल नेविगेशन हो
- **लर्निंग पाथ संदर्भ**: चैप्टर क्रॉस-रेफ़रेंसेस को सही microsoft-foundry पाथ का उपयोग करने के लिए अपडेट किया गया

#### Validated
- ✅ सभी अंग्रेज़ी markdown फ़ाइलों के आंतरिक लिंक वैध हैं
- ✅ वर्कशॉप मॉड्यूल 0-7 सीखने के उद्देश्यों के साथ पूर्ण हैं
- ✅ अध्यायों और मॉड्यूल्स के बीच नेविगेशन सही ढंग से काम करता है
- ✅ सामग्री Microsoft AZD उपयोग करने वाले AI डेवलपर्स के लिए उपयुक्त है
- ✅ प्रारंभिक उपयोगकर्ता के अनुकूल भाषा और संरचना पूरे दस्तावेज़ में बनाए रखी गई
- ✅ CONTRIBUTING.md समुदाय योगदानकर्ताओं के लिए स्पष्ट मार्गदर्शन प्रदान करता है

#### Technical Implementation
- **लिंक वैलिडेशन**: सभी .md आंतरिक लिंक की जांच के लिए ऑटोमेटेड PowerShell स्क्रिप्ट ने सत्यापन किया
- **सामग्री ऑडिट**: वर्कशॉप की पूर्णता और शुरुआती उपयुक्तता का मैनुअल समीकरण
- **नेविगेशन सिस्टम**: परिपक्व चैप्टर और मॉड्यूल नेविगेशन पैटर्न लागू किए गए

#### Notes
- **Scope**: परिवर्तन केवल अंग्रेज़ी दस्तावेज़ीकरण पर लागू किए गए
- **Translations**: इस संस्करण में ट्रांसलेशन फ़ोल्डर अपडेट नहीं किए गए (ऑटोमेटेड ट्रांसलेशन बाद में सिंक करेगा)
- **वर्कशॉप अवधि**: पूरा वर्कशॉप अब 3-4 घंटे का हैंड्स-ऑन लर्निंग प्रदान करता है

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**यह संस्करण Application Insights एकीकरण, प्रमाणीकरण पैटर्न, और प्रोडक्शन परिनियोजनों के लिए मल्टी-एजेंट समन्वय पर व्यापक A-ग्रेड पाठ जोड़ता है।**

#### Added
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md` में:
  - AZD-केंद्रित परिनियोजन स्वचालित प्रोविजनिंग के साथ
  - Application Insights + Log Analytics के लिए पूर्ण Bicep टेम्पलेट्स
  - कस्टम टेलीमेट्री के साथ कार्यशील Python एप्लिकेशन (1,200+ लाइनों)
  - AI/LLM मॉनिटरिंग पैटर्न (Microsoft Foundry Models टोकन/लागत ट्रैकिंग)
  - 6 Mermaid डायग्राम (आर्किटेक्चर, वितरित ट्रेसिंग, टेलीमेट्री फ्लो)
  - 3 हैंड्स-ऑन अभ्यास (अलर्ट्स, डैशबोर्ड, AI मॉनिटरिंग)
  - Kusto क्वेरी उदाहरण और लागत अनुकूलन रणनीतियाँ
  - लाइव मैट्रिक्स स्ट्रीमिंग और वास्तविक समय डिबगिंग
  - 40-50 मिनट सीखने का समय, प्रोडक्शन-रेडी पैटर्न्स के साथ

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md` में:
  - 3 प्रमाणीकरण पैटर्न (कनेक्शन स्ट्रिंग्स, Key Vault, managed identity)
  - सुरक्षित परिनियोजनों के लिए पूर्ण Bicep इंफ्रास्ट्रक्चर टेम्पलेट्स
  - Azure SDK एकीकरण के साथ Node.js एप्लिकेशन कोड
  - 3 पूर्ण अभ्यास (managed identity सक्षम करना, user-assigned identity, Key Vault रोटेशन)
  - सुरक्षा सर्वोत्तम प्रथाएँ और RBAC विन्यास
  - ट्रबलशूटिंग गाइड और लागत विश्लेषण
  - प्रोडक्शन-रेडी पासवर्डलेस प्रमाणीकरण पैटर्न

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md` में:
  - 5 समन्वय पैटर्न (sequential, parallel, hierarchical, event-driven, consensus)
  - पूर्ण ओरकेस्ट्रेटर सर्विस इम्प्लिमेंटेशन (Python/Flask, 1,500+ लाइनों)
  - 3 विशेष एजेंट इम्प्लिमेंटेशन (Research, Writer, Editor)
  - मैसेज क्यूइंग के लिए Service Bus एकीकरण
  - वितरित प्रणालियों के लिए Cosmos DB स्टेट प्रबंधन
  - एजेंट इंटरैक्शंस दिखाने वाले 6 Mermaid डायग्राम
  - 3 उन्नत अभ्यास (timeout हैंडलिंग, retry लॉजिक, circuit breaker)
  - लागत विभाजन ($240-565/month) और अनुकूलन रणनीतियाँ
  - मॉनिटरिंग के लिए Application Insights एकीकरण

#### Enhanced
- **Pre-deployment चैप्टर**: अब व्यापक मॉनिटरिंग और समन्वय पैटर्न शामिल हैं
- **Getting Started चैप्टर**: पेशेवर प्रमाणीकरण पैटर्न के साथ संवर्धित
- **प्रोडक्शन रेडीनेस**: सुरक्षा से लेकर अवज़र्वेबिलिटी तक पूर्ण कवरेज
- **कोर्स आउटलाइन्**: चैप्टर 3 और 6 में नए पाठों के संदर्भ के लिए अपडेट किया गया

#### Changed
- **लर्निंग प्रोग्रेशन**: पाठ्यक्रम भर में सुरक्षा और मॉनिटरिंग का बेहतर एकीकरण
- **दस्तावेज़ीकरण गुणवत्ता**: नए पाठों में सुसंगत A-ग्रेड मानक (95-97%)
- **प्रोडक्शन पैटर्न्स**: एंटरप्राइज़ परिनियोजनों के लिए पूर्ण एंड-टू-एंड कवरेज

#### Improved
- **Developer Experience**: विकास से प्रोडक्शन मॉनिटरिंग तक स्पष्ट मार्ग
- **Security Standards**: प्रमाणीकरण और सीक्रेट्स मैनेजमेंट के लिए पेशेवर पैटर्न
- **Observability**: AZD के साथ पूर्ण Application Insights एकीकरण
- **AI Workloads**: Microsoft Foundry Models और मल्टी-एजेंट सिस्टम के लिए विशेष मॉनिटरिंग

#### Validated
- ✅ सभी पाठों में संपूर्ण कार्यशील कोड शामिल (स्निपेट नहीं)
- ✅ दृश्यात्मक सीखने के लिए Mermaid diagrams (कुल 19, 3 पाठों में)
- ✅ वेरीफिकेशन चरणों के साथ हैंड्स-ऑन अभ्यास (कुल 9)
- ✅ प्रोडक्शन-रेडी Bicep टेम्पलेट्स जो `azd up` के जरिए डिप्लॉय करने योग्य हैं
- ✅ लागत विश्लेषण और अनुकूलन रणनीतियाँ
- ✅ ट्रबलशूटिंग गाइड और सर्वोत्तम प्रथाएँ
- ✅ वेरिफिकेशन कमांड्स के साथ नॉलेज चेकपॉइंट्स

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - व्यापक मॉनिटरिंग गाइड
- **docs/getting-started/authsecurity.md**: - पेशेवर सुरक्षा पैटर्न
- **docs/pre-deployment/coordination-patterns.md**: - उन्नत मल्टी-एजेंट आर्किटेक्चर
- **Overall New Content**: - लगातार उच्च-गुणवत्ता मानक

#### Technical Implementation
- **Application Insights**: Log Analytics + कस्टम टेलीमेट्री + डिस्ट्रीब्यूटेड ट्रेसिंग
- **Authentication**: Managed Identity + Key Vault + RBAC पैटर्न
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ऑर्केस्ट्रेशन
- **Monitoring**: लाइव मेट्रिक्स + Kusto क्वेरीज़ + अलर्ट्स + डैशबोर्ड
- **Cost Management**: सैम्पलिंग रणनीतियाँ, रिटेंशन नीतियाँ, बजट कण्ट्रोल

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**यह संस्करण रिपॉज़िटरी में दस्तावेज़ों की गुणवत्ता में सुधार करता है और gpt-4.1 चैट इंटरफ़ेस के साथ एक पूर्ण Microsoft Foundry Models डिप्लॉयमेंट उदाहरण जोड़ता है।**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` में कार्यशील gpt-4.1 डिप्लॉयमेंट के साथ पूरा उदाहरण:
  - Microsoft Foundry Models का पूरा इन्फ्रास्ट्रक्चर (gpt-4.1 मॉडल डिप्लॉयमेंट)
  - कन्वर्सेशन हिस्ट्री के साथ Python कमांड-लाइन चैट इंटरफ़ेस
  - सुरक्षित API कुंजी भंडारण के लिए Key Vault एकीकरण
  - टोकन उपयोग ट्रैकिंग और लागत अनुमान
  - रेट लिमिटिंग और एरर हैंडलिंग
  - 35-45 मिनट डिप्लॉयमेंट गाइड के साथ व्यापक README
  - 11 प्रोडक्शन-रेडी फाइलें (Bicep टेम्पलेट्स, Python ऐप, कॉन्फ़िगरेशन)
- **📚 Documentation Exercises**: कॉन्फ़िगरेशन गाइड में हैंड्स-ऑन अभ्यास जोड़े गए:
  - अभ्यास 1: मल्टी-एनवायरनमेंट कॉन्फ़िगरेशन (15 मिनट)
  - अभ्यास 2: सीक्रेट मैनेजमेंट अभ्यास (10 मिनट)
  - स्पष्ट सफलता मानदंड और वेरिफिकेशन स्टेप्स
- **✅ Deployment Verification**: डिप्लॉयमेंट गाइड में वेरिफिकेशन अनुभाग जोड़ा गया:
  - हेल्थ चेक प्रक्रियाएँ
  - सफलता मानदंड चेकलिस्ट
  - सभी डिप्लॉयमेंट कमांड्स के अपेक्षित आउटपुट
  - त्वरित ट्रबलशूटिंग संदर्भ

#### Enhanced
- **examples/README.md**: A-ग्रेड गुणवत्ता (93%) के लिए अपडेट किया गया:
  - azure-openai-chat को सभी संबंधित खंडों में जोड़ा गया
  - लोकल उदाहरणों की संख्या 3 से 4 में अपडेट की गई
  - AI Application Examples तालिका में जोड़ा गया
  - Intermediate Users के लिए Quick Start में एकीकृत किया गया
  - Microsoft Foundry Templates सेक्शन में जोड़ा गया
  - तुलना मैट्रिक्स और टेक्नोलॉजी खोज खंडों में अपडेट
- **Documentation Quality**: B+ (87%) → A- (92%) तक सुधरी हुई:
  - महत्वपूर्ण कमांड उदाहरणों में अपेक्षित आउटपुट जोड़े गए
  - कॉन्फ़िगरेशन परिवर्तनों के लिए वेरिफिकेशन स्टेप्स शामिल किए गए
  - व्यावहारिक अभ्यास के साथ हैंड्स-ऑन लर्निंग में सुधार

#### Changed
- **Learning Progression**: Intermediate learners के लिए AI उदाहरणों का बेहतर समेकन
- **Documentation Structure**: स्पष्ट परिणामों के साथ अधिक क्रियाशील अभ्यास
- **Verification Process**: प्रमुख वर्कफ़्लोज़ में स्पष्ट सफलता मानदंड जोड़े गए

#### Improved
- **Developer Experience**: Microsoft Foundry Models डिप्लॉयमेंट अब 35-45 मिनट लेता है (कठिन विकल्पों के 60-90 मिनट के बजाय)
- **Cost Transparency**: Microsoft Foundry Models उदाहरण के लिए स्पष्ट लागत अनुमान ($50-200/माह)
- **Learning Path**: AI डेवलपर्स के लिए azure-openai-chat के साथ स्पष्ट प्रवेश बिंदु
- **Documentation Standards**: एकसमान अपेक्षित आउटपुट और वेरिफिकेशन स्टेप्स

#### Validated
- ✅ Microsoft Foundry Models उदाहरण `azd up` के साथ पूरी तरह कार्यशील
- ✅ सभी 11 इम्प्लीमेंटेशन फाइलें सिंटैक्टिकली सही
- ✅ README निर्देश वास्तविक डिप्लॉयमेंट अनुभव से मेल खाते हैं
- ✅ डॉक्यूमेंटेशन लिंक 8+ स्थानों पर अपडेट किए गए
- ✅ उदाहरणों की सूची सही ढंग से 4 लोकल उदाहरण दिखाती है
- ✅ तालिकाओं में कोई डुप्लिकेट बाह्य लिंक नहीं
- ✅ सभी नेविगेशन संदर्भ सही

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps पैटर्न
- **Security**: Managed Identity तैयार, सीक्रेट्स Key Vault में
- **Monitoring**: Application Insights एकीकरण
- **Cost Management**: टोकन ट्रैकिंग और उपयोग अनुकूलन
- **Deployment**: पूर्ण सेटअप के लिए एकल `azd up` कमांड

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**यह संस्करण Azure Developer CLI (AZD) का उपयोग करके व्यापक, प्रोडक्शन-रेडी कंटेनर एप्लिकेशन डिप्लॉयमेंट उदाहरण पेश करता है, पूरी डॉक्यूमेंटेशन और लर्निंग पाथ के साथ।**

#### Added
- **🚀 Container App Examples**: `examples/container-app/` में नए लोकल उदाहरण:
  - [Master Guide](examples/container-app/README.md): कंटेनराइज़्ड डिप्लॉयमेंट्स का पूरा अवलोकन, क्विक स्टार्ट, प्रोडक्शन और उन्नत पैटर्न
  - [Simple Flask API](../../examples/container-app/simple-flask-api): स्केल-टू-ज़ीरो, हेल्थ प्रोब्स, मॉनिटरिंग और ट्रबलशूटिंग के साथ शुरुआती अनुकूल REST API
  - [Microservices Architecture](../../examples/container-app/microservices): प्रोडक्शन-रेडी मल्टी-सर्विस डिप्लॉयमेंट (API Gateway, Product, Order, User, Notification), एसिंक्रोनस मैसेजिंग, Service Bus, Cosmos DB, Azure SQL, डिस्ट्रीब्यूटेड ट्रेसिंग, ब्लू-ग्रीन/कैनेरी डिप्लॉयमेंट
- **Best Practices**: कंटेनराइज़्ड वर्कलोड्स के लिए सुरक्षा, मॉनिटरिंग, लागत अनुकूलन और CI/CD मार्गदर्शन
- **Code Samples**: पूर्ण `azure.yaml`, Bicep टेम्पलेट्स, और मल्टी-लैंग्वेज सर्विस इम्प्लीमेंटेशन (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: एंड-टू-एंड टेस्ट परिदृश्य, मॉनिटरिंग कमांड्स, ट्रबलशूटिंग मार्गदर्शन

#### Changed
- **README.md**: "Local Examples - Container Applications" के अंतर्गत नए कंटेनर ऐप उदाहरणों को फीचर और लिंक करने के लिए अपडेट किया गया
- **examples/README.md**: कंटेनर ऐप उदाहरणों को हाइलाइट करने, तुलना मैट्रिक्स एंट्रीज़ जोड़ने, और टेक्नोलॉजी/आर्किटेक्चर संदर्भ अपडेट करने के लिए संशोधित
- **Course Outline & Study Guide**: संबंधित अध्यायों में नए कंटेनर ऐप उदाहरणों और डिप्लॉयमेंट पैटर्न का संदर्भ जोड़कर अपडेट किया गया

#### Validated
- ✅ सभी नए उदाहरण `azd up` के साथ डिप्लॉय करने योग्य और सर्वोत्तम प्रथाओं का पालन करते हैं
- ✅ डॉक्यूमेंटेशन क्रॉस-लिंक्स और नेविगेशन अपडेट किए गए
- ✅ उदाहरण शुरुआती से उन्नत परिदृश्यों को कवर करते हैं, जिसमें प्रोडक्शन माइक्रोसर्विसेस शामिल हैं

#### Notes
- **Scope**: केवल English डॉक्यूमेंटेशन और उदाहरण
- **Next Steps**: भविष्य के रिलीज़ में अतिरिक्त उन्नत कंटेनर पैटर्न और CI/CD ऑटोमेशन के साथ विस्तार

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**यह संस्करण सभी English डॉक्यूमेंटेशन में "Microsoft Foundry" नाम परिवर्तन को लागू करता है, जो Microsoft के आधिकारिक रीब्रैंडिंग को दर्शाता है।**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" के रूप में पूरी रीब्रांडिंग
  - `docs/` फ़ोल्डर में English दस्तावेज़ों में सभी संदर्भ अपडेट किए गए
  - फ़ोल्डर का नाम बदला गया: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फ़ाइल का नाम बदला गया: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - कुल: 7 डॉक्यूमेंट फाइलों में 23 सामग्री संदर्भ अपडेट किए गए

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` का नाम बदल कर `docs/microsoft-foundry/` किया गया
  - नए फ़ोल्डर स्ट्रक्चर को दर्शाने के लिए सभी क्रॉस-रेफरेंसेज़ अपडेट किए गए
  - नेविगेशन लिंक्स पूरी डॉक्यूमेंटेशन में मान्य किए गए

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - नए फ़ाइल नाम को संदर्भित करने के लिए सभी आंतरिक लिंक अपडेट किए गए

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेविगेशन लिंक अपडेट
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 प्रोडक्ट नाम संदर्भ अपडेट
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पहले से Microsoft Foundry का उपयोग कर रहा था (पिछले अपडेट से)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 संदर्भ अपडेट (ओवरव्यू, कम्युनिटी फीडबैक, डॉक्यूमेंटेशन)
  - `docs/getting-started/azd-basics.md` - 4 क्रॉस-रेफरेंस लिंक अपडेट
  - `docs/getting-started/first-project.md` - 2 चैप्टर नेविगेशन लिंक अपडेट
  - `docs/getting-started/installation.md` - 2 अगले चैप्टर लिंक अपडेट
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 संदर्भ अपडेट (नेविगेशन, Discord कम्युनिटी)
  - `docs/troubleshooting/common-issues.md` - 1 नेविगेशन लिंक अपडेट
  - `docs/troubleshooting/debugging.md` - 1 नेविगेशन लिंक अपडेट

- **Course Structure Files** (2 files):
  - `README.md` - 17 संदर्भ अपडेट किए गए (कोर्स ओवरव्यू, चैप्टर शीर्षक, टेम्पलेट्स सेक्शन, कम्युनिटी इनसाइट्स)
  - `course-outline.md` - 14 संदर्भ अपडेट किए गए (ओवरव्यू, लर्निंग ऑब्जेक्टिव्स, चैप्टर रिसोर्सेज)

#### Validated
- ✅ English docs में कोई शेष "ai-foundry" फ़ोल्डर पाथ रेफरेंस नहीं है
- ✅ English docs में कोई शेष "Microsoft Foundry" प्रोडक्ट नाम संदर्भ नहीं हैं
- ✅ सभी नेविगेशन लिंक्स नए फ़ोल्डर स्ट्रक्चर के साथ कार्य कर रहे हैं
- ✅ फ़ाइल और फ़ोल्डर नाम बदलने की प्रक्रिया सफलतापूर्वक पूरी हुई
- ✅ अध्यायों के बीच क्रॉस-रेफरेंसेज़ मान्य किए गए

#### Notes
- **Scope**: परिवर्तन केवल `docs/` फ़ोल्डर में English डॉक्यूमेंटेशन पर लागू हुए
- **Translations**: इस संस्करण में Translation फ़ोल्डर्स (`translations/`) अपडेट नहीं हुए
- **Workshop**: Workshop सामग्री (`workshop/`) इस संस्करण में अपडेट नहीं हुई
- **Examples**: उदाहरण फाइलें अभी भी लेगसी नामकरण का संदर्भ दे सकती हैं (भविष्य के अपडेट में संबोधित किया जाएगा)
- **External Links**: बाहरी URL और GitHub रेपो संदर्भ अपरिवर्तित रहे

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**यह संस्करण नए Azure Developer CLI प्रीव्यू फीचर के लिए व्यापक समर्थन जोड़ता है और वर्कशॉप उपयोगकर्ता अनुभव को बेहतर बनाता है।**

#### Added
- **🧪 azd provision --preview Feature Documentation**: नए इन्फ्रास्ट्रक्चर प्रीव्यू क्षमता का व्यापक कवरेज
  - चीट शीट में कमांड रेफरेंस और उपयोग उदाहरण
  - प्राविज़निंग गाइड में उपयोग-मामले और लाभ के साथ विस्तृत एकीकरण
  - सुरक्षित डिप्लॉयमेंट वेरिफिकेशन के लिए प्री-फ्लाइट चेक एकीकरण
  - सेफ़्टी-फर्स्ट डिप्लॉयमेंट प्रथाओं के साथ गेटिंग स्टार्टेड गाइड अपडेट्स
- **🚧 Workshop Status Banner**: वर्कशॉप डेवलपमेंट स्थिति सूचित करने के लिए पेशेवर HTML बैनर
  - स्पष्ट उपयोगकर्ता संचार के लिए ग्रेडिएंट डिज़ाइन और कंस्ट्रक्शन संकेत
  - पारदर्शिता के लिए लेटेस्ट अपडेट टाइमस्टैम्प
  - सभी डिवाइस प्रकारों के लिए मोबाइल-रिस्पॉन्सिव डिज़ाइन

#### Enhanced
- **Infrastructure Safety**: प्रीव्यू फ़ंक्शनैलिटी को डिप्लॉयमेंट डॉक्यूमेंटेशन में एकीकृत किया गया
- **Pre-deployment Validation**: ऑटोमेटेड स्क्रिप्ट अब इन्फ्रास्ट्रक्चर प्रीव्यू टेस्टिंग शामिल करते हैं
- **Developer Workflow**: बेस्ट प्रैक्टिस के रूप में प्रीव्यू को शामिल करने के लिए कमांड अनुक्रम अपडेट किए गए
- **Workshop Experience**: उपयोगकर्ताओं के लिए सामग्री विकास स्थिति के बारे में स्पष्ट अपेक्षाएँ निर्धारित की गईं

#### Changed
- **Deployment Best Practices**: प्रीव्यू-फर्स्ट वर्कफ़्लो अब सिफारिश किया गया दृष्टिकोण
- **Documentation Flow**: लर्निंग प्रोसेस में इन्फ्रास्ट्रक्चर वेलिडेशन को पहले स्थान पर ले जाया गया
- **Workshop Presentation**: स्पष्ट विकास टाइमलाइन के साथ पेशेवर स्थिति संचार

#### Improved
- **Safety-First Approach**: अब डिप्लॉयमेंट से पहले इन्फ्रास्ट्रक्चर परिवर्तनों की वेलिडेशन की जा सकती है
- **Team Collaboration**: प्रीव्यू परिणाम समीक्षा और अनुमोदन के लिए साझा किए जा सकते हैं
- **Cost Awareness**: प्राविजनिंग से पहले संसाधन लागत की बेहतर समझ
- **Risk Mitigation**: अग्रिम वेरिफिकेशन के माध्यम से डिप्लॉयमेंट विफलताओं में कमी

#### Technical Implementation
- **Multi-document Integration**: प्रीव्यू फीचर 4 प्रमुख फाइलों में दस्तावेजीकृत
- **Command Patterns**: डॉक्यूमेंटेशन में संगत सिंटैक्स और उदाहरण
- **Best Practice Integration**: वेरिफिकेशन वर्कफ़्लोज़ और स्क्रिप्ट में प्रीव्यू शामिल
- **Visual Indicators**: खोजयोग्यता के लिए स्पष्ट NEW फीचर मार्किंग्स

#### Workshop Infrastructure
- **Status Communication**: ग्रेडिएंट स्टाइलिंग के साथ पेशेवर HTML बैनर
- **User Experience**: स्पष्ट विकास स्थिति भ्रम को रोकती है
- **Professional Presentation**: अपेक्षाएँ सेट करते हुए रिपॉज़िटरी की विश्वसनीयता बनाए रखती है
- **Timeline Transparency**: उत्तरदायित्व के लिए October 2025 लेटेस्ट अपडेट टाइमस्टैम्प

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**यह संस्करण ब्राउज़र-आधारित इंटरैक्टिव गाइड और संरचित लर्निंग पाथ के साथ व्यापक वर्कशॉप सामग्री प्रस्तुत करता है।**

#### Added
- **🎥 Interactive Workshop Guide**: ब्राउज़र-आधारित कार्यशाला अनुभव MkDocs पूर्वावलोकन क्षमता के साथ
- **📝 Structured Workshop Instructions**: खोज से अनुकूलन तक 7-स्टेप निर्देशित सीखने का मार्ग
  - 0-Introduction: कार्यशाला का अवलोकन और सेटअप
  - 1-Select-AI-Template: टेम्पलेट खोज और चयन प्रक्रिया
  - 2-Validate-AI-Template: तैनाती और सत्यापन प्रक्रिया
  - 3-Deconstruct-AI-Template: टेम्पलेट आर्किटेक्चर की समझ
  - 4-Configure-AI-Template: कॉन्फ़िगरेशन और अनुकूलन
  - 5-Customize-AI-Template: उन्नत संशोधन और पुनरावृत्तियाँ
  - 6-Teardown-Infrastructure: क्लीनअप और संसाधन प्रबंधन
  - 7-Wrap-up: सारांश और अगले कदम
- **🛠️ Workshop Tooling**: MkDocs कॉन्फ़िगरेशन Material थीम के साथ बेहतर लर्निंग अनुभव के लिए
- **🎯 Hands-On Learning Path**: 3-स्टेप कार्यप्रणाली (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: निर्बाध विकास वातावरण सेटअप

#### Enhanced
- **AI Workshop Lab**: विस्तारित 2-3 घंटे की संरचित सीखने की अनुभव के साथ
- **Workshop Documentation**: नेविगेशन और दृश्य सहायता के साथ पेशेवर प्रस्तुति
- **Learning Progression**: टेम्पलेट चयन से उत्पादन तैनाती तक स्पष्ट चरण-दर-चरण मार्गदर्शन
- **Developer Experience**: एकीकृत टूलिंग के साथ सुव्यवस्थित विकास वर्कफ़्लो

#### Improved
- **Accessibility**: खोज, कॉपी फ़ंक्शन और थीम टॉगल के साथ ब्राउज़र-आधारित इंटरफ़ेस
- **Self-Paced Learning**: विभिन्न सीखने की गति के अनुसार अनुकूल कार्यशाला संरचना
- **Practical Application**: वास्तविक दुनिया के AI टेम्पलेट तैनाती परिदृश्य
- **Community Integration**: कार्यशाला समर्थन और सहयोग के लिए Discord एकीकरण

#### Workshop Features
- **Built-in Search**: त्वरित कीवर्ड और पाठ्यक्रम खोज
- **Copy Code Blocks**: सभी कोड उदाहरणों के लिए होवर-टू-कॉपी कार्यक्षमता
- **Theme Toggle**: विभिन्न प्राथमिकताओं के लिए डार्क/लाइट मोड समर्थन
- **Visual Assets**: बेहतर समझ के लिए स्क्रीनशॉट और आरेख
- **Help Integration**: समुदाय समर्थन के लिए सीधे Discord पहुँच

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: संपूर्ण पाठ्यक्रम को 8 प्रगतिशील अध्यायों में पुनर्गठित किया गया
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: दस्तावेज़ीकरण में सुसंगत नेविगेशन हेडर और फुटर
- **🎯 Progress Tracking**: पाठ्यक्रम पूर्णता चेकलिस्ट और सीखने की सत्यापन प्रणाली
- **🗺️ Learning Path Guidance**: विभिन्न अनुभव स्तरों और लक्ष्यों के लिए स्पष्ट प्रवेश बिंदु
- **🔗 Cross-Reference Navigation**: संबंधित अध्याय और आवश्यकताएँ स्पष्ट रूप से लिंक की गईं

#### Enhanced
- **README Structure**: अध्याय-आधारित संगठन के साथ संरचित लर्निंग प्लेटफ़ॉर्म में रूपांतरित
- **Documentation Navigation**: अब हर पेज में अध्याय संदर्भ और प्रगति मार्गदर्शन शामिल है
- **Template Organization**: उदाहरण और टेम्पलेट उपयुक्त लर्निंग अध्यायों से जुड़े हुए
- **Resource Integration**: चीट शीट, FAQ और अध्ययन मार्गदर्शिकाएँ संबंधित अध्यायों से जुड़ी हुईं
- **Workshop Integration**: हैंड्स-ऑन लैब कई अध्याय के लर्निंग उद्देश्यों से मैप किए गए

#### Changed
- **Learning Progression**: रैखिक दस्तावेज़ीकरण से लचीले अध्याय-आधारित सीखने में स्थानांतरित
- **Configuration Placement**: बेहतर सीखने के प्रवाह के लिए कॉन्फ़िगरेशन गाइड को Chapter 3 में पुनर्स्थापित किया गया
- **AI Content Integration**: सीखने की यात्रा भर में AI-विशिष्ट सामग्री का बेहतर एकीकरण
- **Production Content**: एंटरप्राइज़ शिक्षार्थियों के लिए उन्नत पैटर्न Chapter 8 में समेकित

#### Improved
- **User Experience**: स्पष्ट नेविगेशन ब्रेडक्रम्ब्स और अध्याय प्रगति संकेतक
- **Accessibility**: कोर्स ट्रैवर्सल को आसान बनाने के लिए सुसंगत नेविगेशन पैटर्न
- **Professional Presentation**: अकादमिक शैली की पाठ्यक्रम संरचना जो शैक्षिक और कॉर्पोरेट प्रशिक्षण के लिए उपयुक्त है
- **Learning Efficiency**: बेहतर संगठन के माध्यम से संबंधित सामग्री को खोजने का समय घटा

#### Technical Implementation
- **Navigation Headers**: 40+ दस्तावेज़ फ़ाइलों में मानकीकृत अध्याय नेविगेशन
- **Footer Navigation**: सुसंगत प्रगति मार्गदर्शन और अध्याय पूर्णता संकेतक
- **Cross-Linking**: संबंधित अवधारणाओं को जोड़ने वाली व्यापक आंतरिक लिंकिंग प्रणाली
- **Chapter Mapping**: टेम्पलेट और उदाहरण स्पष्ट रूप से लर्निंग उद्देश्यों से संबंधित

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: 8-चैप्टर सिस्टम के साथ संरेखित अध्ययन गाइड का पुनर्संरचना
- **🎯 Chapter-Based Assessment**: प्रत्येक अध्याय में विशिष्ट सीखने के उद्देश्य और व्यावहारिक अभ्यास शामिल
- **📋 Progress Tracking**: मापन योग्य परिणामों और पूर्णता चेकलिस्ट के साथ साप्ताहिक सीखने की अनुसूची
- **❓ Assessment Questions**: प्रत्येक अध्याय के लिए ज्ञान सत्यापन प्रश्न पेशेवर परिणामों के साथ
- **🛠️ Practical Exercises**: वास्तविक तैनाती परिदृश्यों और समस्या निवारण के साथ हैंड्स-ऑन गतिविधियाँ
- **📊 Skill Progression**: बुनियादी अवधारणाओं से लेकर एंटरप्राइज़ पैटर्न तक करियर विकास फोकस के साथ स्पष्ट उन्नति
- **🎓 Certification Framework**: पेशेवर विकास परिणाम और समुदाय मान्यता प्रणाली
- **⏱️ Timeline Management**: माइलस्टोन सत्यापन के साथ संरचित 10-सप्ताह की लर्निंग योजना

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: रिटेल मल्टी-एजेंट सोल्यूशन में स्पष्ट समझ के लिए "Cora agent" को पूरे दस्तावेज़ीकरण में "Customer agent" से प्रतिस्थापित किया गया
- **Agent Architecture**: सभी दस्तावेज़, ARM टेम्पलेट और कोड उदाहरणों को सुसंगत "Customer agent" नामकरण के साथ अपडेट किया गया
- **Configuration Examples**: अपडेटेड नामकरण कन्वेंशनों के साथ आधुनिक एजेंट कॉन्फ़िगरेशन पैटर्न
- **Documentation Consistency**: सुनिश्चित किया गया कि सभी संदर्भ पेशेवर, वर्णनात्मक एजेंट नामों का उपयोग करें

#### Enhanced
- **ARM Template Package**: retail-multiagent-arm-template को Customer agent संदर्भों के साथ अपडेट किया गया
- **Architecture Diagrams**: अपडेटेड एजेंट नामकरण के साथ Mermaid आर्किटेक्चर डायग्राम रिफ्रेश किए गए
- **Code Examples**: Python classes और कार्यान्वयन उदाहरण अब CustomerAgent नामकरण का उपयोग करते हैं
- **Environment Variables**: सभी तैनाती स्क्रिप्ट्स को CUSTOMER_AGENT_NAME कन्वेंशन के साथ अपडेट किया गया

#### Improved
- **Developer Experience**: दस्तावेज़ीकरण में एजेंट भूमिकाएँ और जिम्मेदारियाँ अधिक स्पष्ट हुईं
- **Production Readiness**: एंटरप्राइज़ नामकरण कन्वेंशनों के साथ बेहतर संरेखण
- **Learning Materials**: शैक्षिक उद्देश्यों के लिए अधिक सहज एजेंट नामकरण
- **Template Usability**: एजेंट कार्यों और तैनाती पैटर्न की समझ सरल हुई

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: AI developers और इंजीनियरों को प्राथमिकता देते हुए पूर्ण पुनर्गठन
- **Microsoft Foundry Integration Guide**: AZD को Microsoft Foundry सेवाओं से जोड़ने के लिए व्यापक दस्तावेज़ीकरण
- **AI Model Deployment Patterns**: मॉडल चयन, कॉन्फ़िगरेशन और उत्पादन तैनाती रणनीतियों को कवर करने वाला विस्तृत गाइड
- **AI Workshop Lab**: AI अनुप्रयोगों को AZD-डिप्लॉयबल समाधान में बदलने के लिए 2-3 घंटे का हैंड्स-ऑन कार्यशाला
- **Production AI Best Practices**: AI वर्कलोड के स्केलिंग, मॉनिटरिंग और सुरक्षा के लिए एंटरप्राइज़-रेडी पैटर्न
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services और AI तैनाती मुद्दों के लिए व्यापक समस्या निवारण
- **AI Template Gallery**: जटिलता रेटिंग के साथ Microsoft Foundry टेम्पलेट का चयन
- **Workshop Materials**: हैंड्स-ऑन लैब और संदर्भ सामग्रियों के साथ पूर्ण कार्यशाला संरचना

#### Enhanced
- **README Structure**: AI-developer केंद्रित जिसमें Microsoft Foundry Discord से 45% समुदाय रुचि डेटा शामिल
- **Learning Paths**: छात्रों और DevOps इंजीनियरों के लिए पारंपरिक पथों के साथ समर्पित AI डेवलपर जर्नी
- **Template Recommendations**: शानदार AI टेम्पलेट जिनमें azure-search-openai-demo, contoso-chat, और openai-chat-app-quickstart शामिल हैं
- **Community Integration**: AI-विशिष्ट चैनलों और चर्चाओं के साथ विस्तारित Discord समुदाय समर्थन

#### Security & Production Focus
- **Managed Identity Patterns**: AI-विशिष्ट प्रमाणीकरण और सुरक्षा कॉन्फ़िग्रेशन
- **Cost Optimization**: टोकन उपयोग ट्रैकिंग और AI वर्कलोड के लिए बजट नियंत्रण
- **Multi-Region Deployment**: वैश्विक AI एप्लिकेशन तैनाती के लिए रणनीतियाँ
- **Performance Monitoring**: AI-विशिष्ट मेट्रिक्स और Application Insights एकीकरण

#### Documentation Quality
- **Linear Course Structure**: शुरुआती से उन्नत AI तैनाती पैटर्न तक तार्किक प्रगति
- **Validated URLs**: सभी बाहरी रिपॉज़िटरी लिंक सत्यापित और सुलभ
- **Complete Reference**: सभी आंतरिक दस्तावेज़ीकरण लिंक सत्यापित और कार्यशील
- **Production Ready**: वास्तविक दुनिया के उदाहरणों के साथ एंटरप्राइज़ तैनाती पैटर्न

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: सभी दस्तावेज़ पृष्ठ अब Introduction, Learning Goals, और Learning Outcomes अनुभागों को शामिल करते हैं
- **Navigation System**: मार्गदर्शित सीखने की प्रगति के लिए पूरे दस्तावेज़ में Previous/Next lesson लिंक जोड़े गए
- **Study Guide**: learning-guide.md के साथ व्यापक अध्ययन-गाइड जिसमें सीखने के उद्देश्य, अभ्यास और मूल्यांकन सामग्री
- **Professional Presentation**: बेहतर पहुँच और पेशेवर उपस्थिति के लिए सभी इमोजी आइकन हटाए गए
- **Enhanced Content Structure**: सीखने की सामग्री के संगठन और प्रवाह में सुधार

#### Changed
- **Documentation Format**: सभी दस्तावेज़ों को सुसंगत सीखने-केंद्रित संरचना के साथ मानकीकृत किया गया
- **Navigation Flow**: सभी सीखने की सामग्री के माध्यम से तार्किक प्रगति लागू की गई
- **Content Presentation**: स्पष्ट, पेशेवर स्वरूपण के पक्ष में सजावटी तत्व हटाए गए
- **Link Structure**: नई नेविगेशन सिस्टम का समर्थन करने के लिए सभी आंतरिक लिंक अपडेट किए गए

#### Improved
- **Accessibility**: बेहतर स्क्रीन रीडर संगतता के लिए इमोजी निर्भरताओं को हटाया गया
- **Professional Appearance**: एंटरप्राइज़ लर्निंग के लिए उपयुक्त साफ़, अकादमिक-शैली प्रस्तुति
- **Learning Experience**: प्रत्येक पाठ के लिए स्पष्ट उद्देश्य और परिणामों के साथ संरचित दृष्टिकोण
- **Content Organization**: संबंधित विषयों के बीच बेहतर तार्किक प्रवाह और कनेक्शन

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: मूल अवधारणाएँ और शब्दावली
  - Installation Guide: प्लेटफ़ॉर्म-विशिष्ट सेटअप निर्देश
  - Configuration Guide: पर्यावरण सेटअप और प्रमाणीकरण
  - First Project Tutorial: चरण दर चरण हैंड्स-ऑन सीखना

- **Deployment and Provisioning Module**
  - Deployment Guide: पूर्ण वर्कफ़्लो दस्तावेज़ीकरण
  - Provisioning Guide: Bicep के साथ Infrastructure as Code
  - Production तैनाती के लिए सर्वोत्तम अभ्यास
  - मल्टी-सर्विस आर्किटेक्चर पैटर्न

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure संसाधन उपलब्धता सत्यापन
  - SKU Selection: सर्विस टियर के लिए व्यापक मार्गदर्शन
  - Pre-flight Checks: स्वचालित सत्यापन स्क्रिप्ट्स (PowerShell और Bash)
  - लागत अनुमान और बजट योजना उपकरण

- **Troubleshooting Module**
  - Common Issues: अक्सर मिलने वाली समस्याएँ और समाधान
  - Debugging Guide: व्यवस्थित समस्या निवारण कार्यप्रणालियाँ
  - Advanced diagnostic techniques and tools
  - प्रदर्शन निगरानी और अनुकूलन

- **Resources and References**
  - Command Cheat Sheet: आवश्यक कमांड के लिए त्वरित संदर्भ
  - Glossary: व्यापक शब्दावली और संक्षेपाक्षर परिभाषाएँ
  - FAQ: सामान्य प्रश्नों के विस्तृत उत्तर
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Windows, macOS, और Linux के लिए इंस्टॉलेशन और कॉन्फ़िगरेशन गाइड
- **Multiple Skill Levels**: छात्रों से पेशेवर डेवलपर्स तक डिजाइन की गई सामग्री
- **Practical Focus**: हैंड्स-ऑन उदाहरण और वास्तविक दुनिया के परिदृश्य
- **Comprehensive Coverage**: मूल अवधारणाओं से लेकर उन्नत एंटरप्राइज़ पैटर्न तक
- **Security-First Approach**: सुरक्षा सर्वोत्तम प्रथाओं को एकीकृत किया गया
- **Cost Optimization**: लागत-कुशल तैनाती और संसाधन प्रबंधन के लिए मार्गदर्शन

#### Documentation Quality
- **Detailed Code Examples**: व्यावहारिक, परीक्षण किए गए कोड नमूने
- **Step-by-Step Instructions**: स्पष्ट, क्रियाशील निर्देश
- **Comprehensive Error Handling**: सामान्य मुद्दों के लिए समस्या निवारण
- **Best Practices Integration**: उद्योग मानक और सिफारिशें
- **Version Compatibility**: नवीनतम Azure सेवाओं और azd फीचर्स के साथ अपडेटेड

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **मल्टी-मॉडल समर्थन**: Hugging Face, Azure Machine Learning, और कस्टम मॉडल्स के लिए एकीकरण पैटर्न
- **AI एजेंट फ्रेमवर्क**: LangChain, Semantic Kernel, और AutoGen तैनातियों के लिए टेम्पलेट
- **उन्नत RAG पैटर्न**: Azure AI Search के अलावा वेक्टर डेटाबेस विकल्प (Pinecone, Weaviate, आदि)
- **AI प्रेक्षणीयता**: मॉडल प्रदर्शन, टोकन उपयोग, और प्रतिक्रिया गुणवत्ता के लिए उन्नत मॉनिटरिंग

#### डेवलपर अनुभव
- **VS Code एक्सटेंशन**: एकीकृत AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot एकीकरण**: AI-सहायित AZD टेम्पलेट उत्पत्ति
- **इंटरएक्टिव ट्यूटोरियल्स**: AI परिदृश्यों के लिए स्वचालित मान्यकरण के साथ हैंड्स-ऑन कोडिंग अभ्यास
- **वीडियो सामग्री**: दृश्य शिक्षार्थियों के लिए AI तैनाती पर केंद्रित पूरक वीडियो ट्यूटोरियल

### संस्करण 4.0.0 (योजनाबद्ध)
#### एंटरप्राइज AI पैटर्न
- **गवर्नेंस फ्रेमवर्क**: AI मॉडल गवर्नेंस, अनुपालन, और ऑडिट ट्रेल्स
- **मल्टी-टेनेंट AI**: अलग-थलग AI सेवाओं के साथ कई ग्राहकों को सेवा देने के पैटर्न
- **एज AI तैनाती**: Azure IoT Edge और कंटेनर इंस्टेंस के साथ एकीकरण
- **हाइब्रिड क्लाउड AI**: AI वर्कलोड के लिए मल्टी-क्लाउड और हाइब्रिड तैनाती पैटर्न

#### उन्नत सुविधाएँ
- **AI पाइपलाइन ऑटोमेशन**: Azure Machine Learning पाइपलाइनों के साथ MLOps एकीकरण
- **उन्नत सुरक्षा**: ज़ीरो-ट्रस्ट पैटर्न, प्राइवेट एंडपॉइंट्स, और उन्नत खतरा संरक्षण
- **प्रदर्शन अनुकूलन**: उच्च-थ्रूपुट AI अनुप्रयोगों के लिए उन्नत ट्यूनिंग और स्केलिंग रणनीतियाँ
- **वैश्विक वितरण**: AI अनुप्रयोगों के लिए कंटेंट डिलीवरी और एज कैशिंग पैटर्न

### संस्करण 3.0.0 (योजनाबद्ध) - वर्तमान रिलीज़ द्वारा प्रतिस्थापित
#### प्रस्तावित जोड़ - अब v3.0.0 में लागू
- ✅ **AI-केंद्रित सामग्री**: व्यापक Microsoft Foundry एकीकरण (पूर्ण)
- ✅ **इंटरएक्टिव ट्यूटोरियल्स**: हैंड्स-ऑन AI वर्कशॉप लैब (पूर्ण)
- ✅ **उन्नत सुरक्षा मॉड्यूल**: AI-विशिष्ट सुरक्षा पैटर्न (पूर्ण)
- ✅ **प्रदर्शन अनुकूलन**: AI वर्कलोड ट्यूनिंग रणनीतियाँ (पूर्ण)

### संस्करण 2.1.0 (योजनाबद्ध) - आंशिक रूप से v3.0.0 में लागू
#### छोटे सुधार - वर्तमान रिलीज़ में कुछ पूर्ण हुए
- ✅ **अतिरिक्त उदाहरण**: AI-केंद्रित तैनाती परिदृश्य (पूर्ण)
- ✅ **विस्तारित FAQ**: AI-विशिष्ट प्रश्न और समस्याओं का निवारण (पूर्ण)
- **टूल एकीकरण**: उन्नत IDE और एडिटर एकीकरण मार्गदर्शिकाएँ
- ✅ **मॉनिटरिंग विस्तार**: AI-विशिष्ट निगरानी और अलर्टिंग पैटर्न (पूर्ण)

#### अभी भी भविष्य रिलीज़ के लिए योजनाबद्ध
- **मोबाइल-फ्रेंडली डोक्यूमेंटेशन**: मोबाइल लर्निंग के लिए उत्तरदायी डिज़ाइन
- **ऑफलाइन एक्सेस**: डाउनलोड करने योग्य डोक्यूमेंटेशन पैकेज
- **बेहतर IDE एकीकरण**: AZD + AI वर्कफ़्लोज़ के लिए VS Code एक्सटेंशन
- **कम्युनिटी डैशबोर्ड**: रीयल-टाइम कम्युनिटी मेट्रिक्स और योगदान ट्रैकिंग

## चेंजलॉग में योगदान

### परिवर्तनों की रिपोर्टिंग
जब आप इस रिपॉजिटरी में योगदान कर रहे हों, कृपया सुनिश्चित करें कि चेंजलॉग प्रविष्टियाँ निम्नलिखित शामिल करें:

1. **संस्करण संख्या**: सेमांटिक वर्ज़निंग का पालन करते हुए (major.minor.patch)
2. **तिथि**: रिलीज़ या अपडेट की तिथि YYYY-MM-DD प्रारूप में
3. **श्रेणी**: जोड़ा गया, बदला गया, अप्रचलित, हटाया गया, ठीक किया गया, सुरक्षा
4. **स्पष्ट विवरण**: क्या बदला इसका संक्षिप्त विवरण
5. **प्रभाव मूल्यांकन**: परिवर्तन मौजूदा उपयोगकर्ताओं को कैसे प्रभावित करते हैं

### परिवर्तन श्रेणियाँ

#### जोड़ा गया
- नई सुविधाएँ, दस्तावेज़ अनुभाग, या क्षमताएँ
- नए उदाहरण, टेम्पलेट, या लर्निंग संसाधन
- अतिरिक्त टूल, स्क्रिप्ट, या यूटिलिटीज़

#### बदला गया
- मौजूदा कार्यक्षमता या दस्तावेज़ में संशोधन
- स्पष्टता या सटीकता में सुधार के लिए अपडेट
- सामग्री या संगठन का पुनर्संरचना

#### अप्रचलित
- ऐसी सुविधाएँ या दृष्टिकोण जिनको चरणबद्ध रूप से हटाया जा रहा है
- दस्तावेज़ अनुभाग जो हटाने के लिए निर्धारित हैं
- ऐसे तरीके जिनके बेहतर विकल्प हैं

#### हटाया गया
- ऐसी सुविधाएँ, दस्तावेज़, या उदाहरण जो अब प्रासंगिक नहीं हैं
- पुरानी जानकारी या अप्रचलित दृष्टिकोण
- अनावश्यक या समेकित सामग्री

#### ठीक किया गया
- दस्तावेज़ या कोड में त्रुटियों के सुधार
- रिपोर्ट की गई समस्याओं या मुद्दों का समाधान
- सटीकता या कार्यक्षमता में सुधार

#### सुरक्षा
- सुरक्षा-संबंधी सुधार या फिक्स
- सुरक्षा के बेहतरीन अभ्यासों के अपडेट
- सुरक्षा कमजोरियों का समाधान

### सेमेंटिक वर्जनिंग दिशानिर्देश

#### प्रमुख संस्करण (X.0.0)
- ब्रेकिंग परिवर्तन जो उपयोगकर्ता की कार्रवाई की आवश्यकता रखते हैं
- सामग्री या संगठन की महत्वपूर्ण पुनर्रचना
- परिवर्तन जो मौलिक दृष्टिकोण या कार्यप्रणाली को बदलते हैं

#### माइनर संस्करण (X.Y.0)
- नई सुविधाएँ या सामग्री के जोड़
- ऐसे सुधार जो पिछली अनुकूलता बनाए रखते हैं
- अतिरिक्त उदाहरण, टूल, या संसाधन

#### पैच संस्करण (X.Y.Z)
- बग फिक्स और सुधार
- मौजूदा सामग्री में मामूली सुधार
- स्पष्टीकरण और छोटे सुधार

## समुदाय प्रतिक्रिया और सुझाव

हम इस लर्निंग रिसोर्स को बेहतर बनाने के लिए समुदाय की प्रतिक्रिया को सक्रिय रूप से प्रोत्साहित करते हैं:

### प्रतिक्रिया कैसे दें
- **GitHub Issues**: समस्याओं की रिपोर्ट करें या सुधार का सुझाव दें (AI-विशिष्ट मुद्दे स्वागत योग्य हैं)
- **Discord Discussions**: विचार साझा करें और Microsoft Foundry समुदाय से जुड़ें
- **Pull Requests**: विशेषकर AI टेम्पलेट और मार्गदर्शिकाओं के लिए सामग्री में सीधे सुधार योगदान करें
- **Microsoft Foundry Discord**: AZD + AI चर्चाओं के लिए #Azure चैनल में भाग लें
- **Community Forums**: व्यापक Azure डेवलपर चर्चाओं में भाग लें

### प्रतिक्रिया श्रेणियाँ
- **AI सामग्री सटीकता**: AI सेवा एकीकरण और तैनाती जानकारी में सुधार
- **लर्निंग अनुभव**: AI डेवलपर सीखने की प्रवाह को बेहतर बनाने के सुझाव
- **अनुपस्थित AI सामग्री**: अतिरिक्त AI टेम्पलेट, पैटर्न, या उदाहरणों के अनुरोध
- **पहुंचनीयता**: विविध सीखने की आवश्यकताओं के लिए सुधार
- **AI टूल एकीकरण**: बेहतर AI डेवलपमेंट वर्कफ़्लो एकीकरण के सुझाव
- **प्रोडक्शन AI पैटर्न**: एंटरप्राइज़ AI तैनाती पैटर्न अनुरोध

### प्रतिक्रिया प्रतिबद्धता
- **Issue Response**: रिपोर्ट की गई समस्याओं के लिए 48 घंटों के अंदर
- **Feature Requests**: एक सप्ताह के भीतर मूल्यांकन
- **Community Contributions**: एक सप्ताह के भीतर समीक्षा
- **Security Issues**: तत्काल प्राथमिकता के साथ तेज़ उत्तर

## रखरखाव शेड्यूल

### नियमित अपडेट
- **मासिक समीक्षा**: सामग्री की सटीकता और लिंक सत्यापन
- **त्रैमासिक अपडेट**: प्रमुख सामग्री जोड़ और सुधार
- **अर्धवार्षिक समीक्षा**: व्यापक पुनर्संरचना और संवर्द्धन
- **वार्षिक रिलीज़**: महत्वपूर्ण सुधारों के साथ प्रमुख संस्करण अपडेट

### निगरानी और गुणवत्ता आश्वासन
- **स्वचालित परीक्षण**: कोड उदाहरणों और लिंक का नियमित सत्यापन
- **समुदाय प्रतिक्रिया समेकन**: उपयोगकर्ता सुझावों का नियमित समावेश
- **टेक्नोलॉजी अपडेट**: नवीनतम Azure सेवाओं और azd रिलीज़ के साथ संरेखण
- **पहुंचनीयता ऑडिट**: समावेशी डिजाइन सिद्धांतों के लिए नियमित समीक्षा

## संस्करण समर्थन नीति

### वर्तमान संस्करण समर्थन
- **नवीनतम मेजर संस्करण**: नियमित अपडेट के साथ पूर्ण समर्थन
- **पिछला मेजर संस्करण**: 12 महीनों के लिए सुरक्षा अपडेट और महत्वपूर्ण फिक्स
- **पुराने संस्करण**: केवल समुदाय समर्थन, आधिकारिक अपडेट नहीं

### माइग्रेशन मार्गदर्शन
जब मेजर संस्करण जारी होते हैं, हम प्रदान करते हैं:
- **माइग्रेशन गाइड**: चरण-दर-चरण संक्रमण निर्देश
- **कम्पैटिबिलिटी नोट्स**: ब्रेकिंग परिवर्तनों के बारे में विवरण
- **टूल समर्थन**: माइग्रेशन में सहायता के लिए स्क्रिप्ट या यूटिलिटीज़
- **समुदाय समर्थन**: माइग्रेशन प्रश्नों के लिए समर्पित फोरम

---

**नेविगेशन**
- **पिछला पाठ**: [अध्ययन गाइड](resources/study-guide.md)
- **अगला पाठ**: वापस लौटें [मुख्य README](README.md) पर

**अपडेट रहें**: नई रिलीज़ और सीखने की सामग्री में महत्वपूर्ण अपडेट्स के बारे में सूचनाओं के लिए इस रिपॉज़िटरी को वॉच करें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या असत्यताएँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
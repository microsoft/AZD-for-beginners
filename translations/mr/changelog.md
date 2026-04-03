# बदलांची नोंद - AZD For Beginners

## परिचय

ही बदलांची नोंद AZD For Beginners रीपॉझिटरीतील सर्व लक्षात घेण्याजोगे बदल, अद्यतने, आणि सुधारणा नोंदवते. आम्ही सेमान्टिक व्हर्जनिंग तत्त्वांचे पालन करतो आणि वापरकर्त्यांना आवृत्त्यांदरम्यान काय बदलले ते समजण्यासाठी हा लॉग राखतो.

## शिकण्याचे उद्दिष्ट

By reviewing this changelog, you will:
- नवीन वैशिष्ट्ये आणि सामग्रीच्या वाढीबद्दल माहिती मिळवा
- अस्तित्वातील दस्तऐवजांमध्ये केलेल्या सुधारणा समजून घ्या
- अचूकता सुनिश्चित करण्यासाठी बग फिक्स आणि दुरुस्तींचा मागोवा घ्या
- शिकण्याच्या सामग्रीचा काळानुसार विकासाचा मागोवा घ्या

## शिकण्याचे परिणाम

After reviewing changelog entries, you will be able to:
- उपलब्ध नवीन सामग्री आणि साधने ओळखा
- कोणत्या विभागांमध्ये अद्यतन किंवा सुधारणा झाली आहे ते समजून घ्या
- सध्याच्या सर्वाधिक अद्ययावत सामग्रीच्या आधारावर आपला शिक्षण मार्ग ठरवा
- भविष्यातील सुधारणा साठी अभिप्राय आणि सूचना द्या

## आवृत्ती इतिहास

### [v3.19.1] - 2026-03-27

#### नवीनांसाठी ऑनबोर्डिंग स्पष्टता, सेटअप सत्यापन आणि अंतिम AZD कमांड स्वच्छता
**ही आवृत्ती AZD 1.23 सत्यापन शिफ्टचे अनुसरण करते आणि नवशिक्यांसाठी लक्ष केंद्रित केलेल्या दस्तऐवजीकरणाच्या फेरवापराचा भाग आहे: याने AZD-प्रथम प्रमाणीकरण मार्गदर्शन स्पष्ट केले, स्थानिक सेटअप सत्यापन स्क्रिप्ट्स जोडल्या, महत्त्वाचे कमांड थेट AZD CLI विरुद्ध सत्यापित केले, आणि चेंजलॉग व्यतिरिक्त शिल्लक असलेल्या अप्रचलित इंग्रजी-स्त्रोत कमांड संदर्भ काढून टाकले.**

#### जोडलेले
- **🧪 नवीनांसाठी सेटअप सत्यापन स्क्रिप्ट्स** (`validate-setup.ps1` आणि `validate-setup.sh`) ज्यामुळे शिकणारे अध्याय 1 सुरू करण्यापूर्वी आवश्यक साधने पुष्टी करू शकतात
- **✅ आगाऊ सेटअप सत्यापन पायऱ्या** रूट README आणि Chapter 1 README मध्ये, जेणेकरून आवश्यक पूर्वअट गहाळ असल्यास `azd up` करण्यापूर्वी तो पकडला जाईल

#### बदललेले
- **🔐 नवीनांच्या प्रमाणीकरण मार्गदर्शन** आता सलगपणे `azd auth login` ला AZD वर्कफ्लो साठी प्राथमिक मार्ग म्हणून समजते, आणि `az login` हा ऐच्छिक असल्याचे नमूद केले आहे जोपर्यंत Azure CLI कमांड्स थेट वापरल्या जात नाहीत
- **📚 अध्याय 1 ऑनबोर्डिंग प्रवाह** आता शिकणाऱ्यांना स्थापना, प्रमाणीकरण आणि पहिल्या तैनातीच्या पायऱ्यांपूर्वी त्यांच्या स्थानिक सेटअपचे सत्यापन करण्यास निर्देशित करतो
- **🛠️ व्हॅलिडेटर संदेश** आता AZD-केवळ नवीन मार्गासाठी ब्लॉक करणाऱ्या आवश्यकता आणि ऐच्छिक Azure CLI चेतावण्या स्पष्टपणे वेगळ्या करतो
- **📖 कॉन्फिगरेशन, समस्या निवारण, आणि उदाहरण दस्तऐवज** आता आवश्यक AZD प्रमाणीकरण आणि ऐच्छिक Azure CLI साइन-इन यांमधील वेगळेपण दाखवतात, जिथे पूर्वी दोन्ही संदर्भ संदर्भाशिवाय सादर केले जात होते

#### दुरुस्त केले
- **📋 उर्वरित इंग्रजी-स्त्रोत कमांड संदर्भ** चालू AZD स्वरूपांमध्ये अद्यतनित केले गेले आहेत, ज्यात चिट शीटमधील `azd config show` आणि जिथे Azure Portal ओव्हरव्यू मार्गदर्शन उद्दिष्ट होते तिथले `azd monitor --overview` समाविष्ट आहे
- **🧭 अध्याय 1 मधील नवीनांसाठी दावे** सर्व टेम्पलेट्स आणि Azure संसाधनांवर शून्य-त्रुटी किंवा रोलबॅक वर्तनासाठी हमी देणारे अतिशयोक्ती टाळण्यासाठी सौम्य केले गेले आहेत
- **🔎 लाइव CLI सत्यापन** ने `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, आणि `azd down --force --purge` साठी चालू समर्थन पुष्टी केले

#### फाईल्स अद्यतनित केल्या
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

#### AZD 1.23.12 सत्यापन, कार्यशाळा वातावरणाचा विस्तार आणि AI मॉडेल रीफ्रेश
**ही आवृत्ती `azd` `1.23.12` विरुद्ध दस्तऐवजीकरण सत्यापन शेक करते, जुने AZD कमांड उदाहरणे अद्यतनित करते, AI मॉडेल मार्गदर्शन चालू डीफॉल्टनुसार रीफ्रेश करते, आणि कार्यशाळेच्या सूचनांना GitHub Codespaces पेक्षा पुढे वाढवून dev कंटेनर आणि स्थानिक क्लोनला सुद्धा समर्थन करते.**

#### जोडलेले
- **✅ मुख्य अध्यायांमध्ये आणि कार्यशाळा दस्तऐवजांमध्ये सत्यापन टिपणे** ज्यामुळे नवीन किंवा जुन्या CLI बिल्ड वापरणाऱ्या शिकणाऱ्यांसाठी चाचणीत असलेली AZD बेसलाईन स्पष्ट होते
- **⏱️ तैनाती टाइमआउट मार्गदर्शन** दीर्घकालीन AI अनुप्रयोग तैनातींसाठी वापरासाठी `azd deploy --timeout 1800`
- **🔎 एक्स्टेन्शन निरीक्षण पावले** AI वर्कफ्लो दस्तऐवजांमध्ये `azd extension show azure.ai.agents` सह
- **🌐 विस्तृत कार्यशाळा वातावरण मार्गदर्शन** GitHub Codespaces, dev कंटेनर, आणि स्थानिक क्लोनसह MkDocs कव्हर करते

#### बदललेले
- **📚 अध्याय परिचय README** आता पाया, कॉन्फिगरेशन, इन्फ्रास्ट्रक्चर, मल्टी-एजंट, प्री-डिप्लॉयमेंट, समस्या निवारण आणि प्रॉडक्शन विभागांमध्ये सतत `azd 1.23.12` विरुद्धचे सत्यापन नोंदवतात
- **🛠️ AZD कमांड संदर्भ** दस्तऐवजांमध्ये चालू स्वरूपात अद्यतनित केले गेले:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` किंवा `azd env get-value(s)` संदर्भानुसार
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` जिथे Application Insights ओव्हरव्यू उद्दिष्ट आहे
- **🧪 Provision preview उदाहरणे** सध्या समर्थित वापरासाठी सोप्या केल्या गेल्या जसे `azd provision --preview` आणि `azd provision --preview -e production`
- **🧭 कार्यशाळा प्रवाह** अद्यतनित केला गेला आहे ज्यामुळे शिकणारे Codespaces, dev कंटेनर किंवा स्थानिक क्लोनमध्ये प्रयोगशाळा पूर्ण करू शकतात आणि Codespaces-केवळ चालना गृहीत न धरता
- **🔐 प्रमाणीकरण मार्गदर्शन** आता AZD वर्कफ्लो साठी `azd auth login` प्राधान्याने सुचवते, तर `az login` हे ऐच्छिक म्हणून ठेवले आहे जेव्हा Azure CLI कमांड्स थेट वापरल्या जातात

#### दुरुस्त केले
- **🪟 Windows इंस्टॉलेशन कमांड** स्थापना मार्गदर्शिकेत चालू `winget` पॅकेज कॅसिंगनुसार सामान्यीकृत केले गेले
- **🐧 Linux इंस्टॉल मार्गदर्शन** अनसमर्थित डिस्ट्रो-विशिष्ट `azd` पॅकेज मॅनेजर सूचनांपासून टाळण्यासाठी दुरुस्त केले गेले आणि त्याऐवजी जिथे योग्य ते रिलीज अ‍ॅसेट्सकडे निर्देश केले आहे
- **📦 AI मॉडेल उदाहरणे** जुन्या डीफॉल्टसारखे `gpt-35-turbo` आणि `text-embedding-ada-002` पासून अद्ययावत करून सध्याच्या उदाहरणांपर्यंत ताजे केले गेले जसे `gpt-4.1-mini`, `gpt-4.1`, आणि `text-embedding-3-large`
- **📋 तैनाती आणि डायग्नोस्टिक्स स्निपेट्स** लॉग, स्क्रिप्ट्स आणि समस्या निवारण चरणांमध्ये चालू पर्यावरण आणि स्थिती कमांड वापरण्यासाठी दुरुस्त केले गेले
- **⚙️ GitHub Actions मार्गदर्शन** `Azure/setup-azd@v1.0.0` वरून `Azure/setup-azd@v2` मध्ये अद्यतनित केले गेले
- **🤖 MCP/Copilot संमती मार्गदर्शन** `azd mcp consent` वरून `azd copilot consent list` मध्ये अद्यतनित केले गेले

#### सुधारणा
- **🧠 AI अध्याय मार्गदर्शन** आता preview-संवेदी `azd ai` वर्तन, टेनंट-विशिष्ट लॉगिन, सध्याचे एक्स्टेन्शन वापर आणि अद्यतनित मॉडेल तैनातीच्या शिफारसी अधिक चांगल्या प्रकारे स्पष्ट करते
- **🧪 कार्यशाळा सूचना** आता हँड्स-ऑन प्रयोगशाळांसाठी अधिक वास्तववादी आवृत्ती उदाहरणे आणि स्पष्ट वातावरण सेटअप भाषा वापरतात
- **📈 प्रॉडक्शन आणि समस्या निवारण दस्तऐवज** आता चालू मॉनिटरिंग, फॉलबॅक मॉडेल, आणि खर्च-स्तर उदाहरणांशी चांगल्या प्रकारे सुसंगत आहेत

#### फाईल्स अद्यतनित केल्या
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

#### AZD AI CLI कमांड, सामग्री सत्यापन आणि टेम्पलेट विस्तार
**ही आवृत्ती सर्व AI-संबंधित अध्यायांमध्ये `azd ai`, `azd extension`, आणि `azd mcp` कमांड कव्हरेज जोडते, agents.md मधील तुटलेल्या दुव्यांना आणि अप्रचलित कोडला दुरुस्त करते, चिट शीट अद्यतनित करते, आणि Example Templates विभागाचे प्रमाणीकृत वर्णनांसह आणि नवीन Azure AI AZD टेम्पलेटसह पुनर्रचना करते.**

#### जोडलेले
- **🤖 AZD AI CLI कव्हरेज** 7 फाइलांमध्ये (पूर्वी फक्त Chapter 8 मध्ये):
  - `docs/chapter-01-foundation/azd-basics.md` — नवीन "एक्स्टेन्शन्स आणि AI कमांड्स" विभाग ज्यात `azd extension`, `azd ai agent init`, आणि `azd mcp` ओळखले आहेत
  - `docs/chapter-02-ai-development/agents.md` — पर्याय 4: `azd ai agent init` सह तुलना तक्ता (टेम्पलेट विरुद्ध मॅनिफेस्ट पद्धत)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry साठी AZD एक्स्टेन्शन्स" आणि "एजंट-प्रथम तैनाती" उपविभाग
  - `docs/chapter-05-multi-agent/README.md` — Quick Start आता टेम्पलेट आणि मॅनिफेस्ट-आधारित तैनाती मार्ग दोन्ही दाखवते
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy विभाग आता `azd ai agent init` पर्याय समाविष्ट करतो
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "डायग्नॉस्टिक्ससाठी AZD AI एक्स्टेन्शन कमांड" उपविभाग
  - `resources/cheat-sheet.md` — नवीन "AI & एक्स्टेन्शन्स कमांड" विभाग ज्यात `azd extension`, `azd ai agent init`, `azd mcp`, आणि `azd infra generate` आहेत
- **📦 नवीन AZD AI उदाहरण टेम्पलेट्स** `microsoft-foundry-integration.md` मध्ये:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, आणि व्हॉइस चॅट समर्थन असलेला .NET RAG चॅट
  - **azure-search-openai-demo-java** — Langchain4J वापरून Java RAG चॅट जे ACA/AKS तैनाती पर्यायांसह आहे
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, आणि Prompty वापरून बहु-एजंट क्रिएटिव्ह लेखन अ‍ॅप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB वापरून Serverless RAG, Ollama स्थानिक विकास समर्थनासह
  - **chat-with-your-data-solution-accelerator** — अ‍ॅडमिन पोर्टल, Teams समाकलन आणि PostgreSQL/Cosmos DB पर्यायांसह एंटरप्राइझ RAG अॅक्सेलरेटर
  - **azure-ai-travel-agents** — .NET, Python, Java, आणि TypeScript मध्ये सर्व्हरसह बहु-एजंट MCP ऑर्केस्ट्रेशन संदर्भ अ‍ॅप
  - **azd-ai-starter** — लघु Azure AI इन्फ्रास्ट्रक्चर Bicep स्टार्टर टेम्पलेट
  - **🔗 Awesome AZD AI Gallery link** — संदर्भ [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### दुरुस्त केले
- **🔗 agents.md नेव्हिगेशन**: Previous/Next दुवे आता Chapter 2 README च्या lesson क्रमाशी जुळतात (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md तुटलेले दुवे**: `production-ai-practices.md` हे `../chapter-08-production/production-ai-practices.md` (3 वेळा) असे दुरुस्त केले गेले
- **📦 agents.md मधील अप्रचलित कोड**: `opencensus` चे स्थान `azure-monitor-opentelemetry` + OpenTelemetry SDK ने घेतले
- **🐛 agents.md अवैध API**: `max_tokens` हे `create_agent()` कडून `create_run()` मध्ये `max_completion_tokens` म्हणून हलवले
- **🔢 agents.md टोकन मोजणी**: साधारण `len//4` अंदाज बदलून `tiktoken.encoding_for_model()` वापरला
- **azure-search-openai-demo**: सेवा "Cognitive Search + App Service" पासून "Azure AI Search + Azure Container Apps" असे दुरुस्त केले (डिफॉल्ट होस्ट ऑक्टोबर 2024 मध्ये बदलला)
- **contoso-chat**: वर्णन अद्यतनित केले गेले जे Azure AI Foundry + Prompty कडे संदर्भित करते, जे रेपोच्या वास्तविक शीर्षक आणि तंत्रज्ञान स्टॅकशी जुळते

#### काढून टाकले
- **ai-document-processing**: कार्यक्षम नसलेला टेम्पलेट संदर्भ काढून टाकला (रीपॉझिटरी AZD टेम्पलेट म्हणून सार्वजनिकपणे प्रवेशयोग्य नाही)

#### सुधारित
- **📝 agents.md व्यायाम**: व्यायाम 1 आता अपेक्षित आउटपुट आणि `azd monitor` पावलं दाखवते; व्यायाम 2 मध्ये पूर्ण `FunctionTool` नोंदणी कोड समाविष्ट आहे; व्यायाम 3 मध्ये अस्पष्ट मार्गदर्शनाऐवजी ठोस `prepdocs.py` कमांड्स दिल्या आहेत
- **📚 agents.md संसाधने**: दस्तऐवज दुवे अद्ययावत केले गेले आहेत — वर्तमान Azure AI Agent Service दस्तऐवज आणि क्विकस्टार्टकडे
- **📋 agents.md पुढील पावले टेबल**: संपूर्ण अध्याय कव्हरेजसाठी AI Workshop Lab दुवा जोडला

#### फाइल्स अद्यतनित
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### कोर्स नेव्हिगेशन सुधारणा
**या आवृत्तीत README.md मधील अध्याय नेव्हिगेशन सुधारित टेबल फॉर्मॅटसह सुधारणे केले आहे.**

#### बदलले
- **Course Map Table**: थेट लेसन दुवे, कालावधी अंदाज, आणि क्लिष्टता रेटिंगसह सुधारित
- **Folder Cleanup**: Removed redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Course Map टेबलमधील सर्व 21+ अंतर्गत दुवे सत्यापित केले

### [v3.16.0] - 2026-02-05

#### उत्पादन नाव अद्यतन
**या आवृत्तीत उत्पादन संदर्भ सध्याच्या Microsoft ब्रँडिंगनुसार अद्ययावत केले गेले आहेत.**

#### बदलले
- **Microsoft Foundry → Microsoft Foundry**: सर्व संदर्भ न-भाषांतरित फाइल्समध्ये अद्ययावत केले
- **Azure AI Agent Service → Foundry Agents**: सध्याच्या ब्रँडिंगनुसार सेवेनाव अद्ययावत केले गेले

#### फाइल्स अद्यतनित
- `README.md` - मुख्य कोर्स लँडिंग पृष्ठ
- `changelog.md` - आवृत्ती इतिहास
- `course-outline.md` - कोर्स संरचना
- `docs/chapter-02-ai-development/agents.md` - एआय एजंट गाइड
- `examples/README.md` - उदाहरणे दस्तऐवज
- `workshop/README.md` - वर्कशॉप लँडिंग पृष्ठ
- `workshop/docs/index.md` - वर्कशॉप निर्देशिका
- `workshop/docs/instructions/*.md` - सर्व वर्कशॉप निर्देश फाइल्स

---

### [v3.15.0] - 2026-02-05

#### मोठी रेपॉजिटरी पुनररचना: अध्याय-आधारित फोल्डर नावे
**या आवृत्तीत दस्तऐवजे क्लियर नेव्हिगेशनसाठी समर्पित अध्याय फोल्डरमध्ये पुन्हा संघटित केले गेले आहेत.**

#### फोल्डर नामांतर
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### फाइल स्थलांतरण
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

#### जोडले
- **📚 Chapter README files**: प्रत्येक अध्याय फोल्डरमध्ये README.md तयार केले गेले ज्यात:
  - शिक्षण उद्दिष्टे आणि कालावधी
  - वर्णनासह लेसन टेबल
  - क्विक स्टार्ट कमांड्स
  - इतर अध्यायांमध्ये नेव्हिगेशन

#### बदलले
- **🔗 अद्ययावत केलेली सर्व अंतर्गत दुव्ये**: 78+ पाथ्स सर्व दस्तऐवज फाइल्समध्ये अद्ययावत केले
- **🗺️ मुख्य README.md**: Course Map नव्या अध्याय संरचनेनुसार अद्ययावत केले
- **📝 examples/README.md**: अध्याय फोल्डर संदर्भ अद्ययावत केले

#### काढले
- जुन्या फोल्डर संरचना काढून टाकली (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रेपॉजिटरी पुनररचना: अध्याय नेव्हिगेशन
**या आवृत्तीत अध्याय नेव्हिगेशन README फाइल्स जोडल्या गेल्या (v3.15.0 ने नंतर स्थानांतरित केले).**

---

### [v3.13.0] - 2026-02-05

#### नवीन AI एजंट मार्गदर्शक
**या आवृत्तीत Azure Developer CLI सह AI एजंट तैनात करण्यासाठी एक सर्वसमावेशक मार्गदर्शक जोडला गेला आहे.**

#### जोडले
- **🤖 docs/microsoft-foundry/agents.md**: पूर्ण मार्गदर्शक जो खालीलांचा समावेश करतो:
  - AI एजंट काय आहेत आणि ते चॅटबॉट्सपासून कसे वेगळे आहेत
  - तीन क्विक-स्टार्ट एजंट टेम्पलेट्स (Foundry Agents, Prompty, RAG)
  - एजंट आर्किटेक्चर पॅटर्न्स (सिंगल एजंट, RAG, मल्टी-एजंट)
  - टूल कॉन्फिगरेशन आणि सानुकूलन
  - मॉनिटरिंग आणि मेट्रिक्स ट्रॅकिंग
  - खर्च विचार आणि ऑप्टिमायझेशन
  - सामान्य त्रुटी निवारण परिस्थिती
  - यश निकषांसहित तीन हाताळणी-आधारित व्यायाम

#### सामग्री संरचना
- **परिचय**: सुरुवातीसाठी एजंट संकल्पना
- **क्विक स्टार्ट**: `azd init --template get-started-with-ai-agents` वापरून एजंट तैनात करा
- **आर्किटेक्चर पॅटर्न्स**: एजंट पॅटर्नचे दृश्यात्मक आरेखन
- **कॉन्फिगरेशन**: टूल सेटअप आणि पर्यावरण बदल
- **मॉनिटरिंग**: Application Insights एकत्रीकरण
- **व्यायाम**: प्रगत हाताळणी-आधारित शिकवण (20-45 मिनिटे प्रति)

---

### [v3.12.0] - 2026-02-05

#### DevContainer पर्यावरण अद्यतन
**या आवृत्तीत विकास कंटेनर कॉन्फिगरेशन आधुनिक साधने आणि AZD शिकवणी अनुभवासाठी चांगले डीफॉल्ट्ससह अद्यतनित केले गेले आहे.**

#### बदलले
- **🐳 Base Image**: `python:3.12-bullseye` वरून `python:3.12-bookworm` (नवीनतम Debian स्थिर) येथे अद्यतनित
- **📛 कंटेनर नाव**: स्पष्टतेसाठी "Python 3" ऐवजी "AZD for Beginners" असे नाव बदलले

#### जोडले
- **🔧 नवीन Dev Container वैशिष्ट्ये**:
  - `azure-cli` सह Bicep समर्थन सक्षम
  - `node:20` (AZD टेम्पलेटसाठी LTS आवृत्ती)
  - `github-cli` टेम्पलेट व्यवस्थापनासाठी
  - `docker-in-docker` कंटेनर अॅप तैनातीसाठी

- **🔌 पोर्ट फॉरवर्डिंग**: सामान्य विकासासाठी पूर्व-कॉन्फिगर केलेले पोर्ट्स:
  - 8000 (MkDocs प्रीव्यू)
  - 3000 (वेब अॅप्स)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 नवीन VS Code विस्तार**:
  - `ms-python.vscode-pylance` - सुधारित Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure रिसोर्स व्यवस्थापन
  - `yzhang.markdown-all-in-one` - Markdown संपादन
  - `DavidAnson.vscode-markdownlint` - Markdown लिंटिंग
  - `bierner.markdown-mermaid` - Mermaid आरेखन समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml साठी)
  - `eamodio.gitlens` - Git दृश्यमानता
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिंग्ज**: Python इंटरप्रेटर, फॉर्मॅट ऑन सेव्ह, आणि व्हाइटस्पेस ट्रिमिंगसाठी डीफॉल्ट सेटिंग्ज जोडल्या

- **📦 requirements-dev.txt अद्यतनित**:
  - MkDocs minify प्लगिन जोडले
  - कोड गुणवत्ता साठी pre-commit जोडले
  - Azure SDK पॅकेजेस (azure-identity, azure-mgmt-resource) जोडले

#### दुरुस्ती
- **Post-Create Command**: कंटेनर सुरू होताच AZD आणि Azure CLI स्थापना तपासते

---

### [v3.11.0] - 2026-02-05

#### नवोदितांसाठी README पुनर्रचना
**या आवृत्तीत README.md लक्षणीयरीत्या सुधारण्यात आले आहे जे नवोदितांसाठी अधिक सुलभ बनवते आणि AI विकासकांसाठी आवश्यक संसाधने जोडते.**

#### जोडले
- **🆚 Azure CLI vs AZD तुलना**: प्रत्येक साधन कधी वापरावे याची स्पष्ट समज आणि व्यावहारिक उदाहरणे
- **🌟 Awesome AZD दुवे**: समुदाय टेम्पलेट गॅलरी आणि योगदान संसाधनांसाठी थेट दुवे:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैनात करण्यायोग्य टेम्पलेट्स
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 क्विक स्टार्ट गाइड**: 3-पायरी सोपी सुरूवात विभाग (इन्स्टॉल → लॉगिन → तैनात)
- **📊 अनुभव-आधारित नेव्हिगेशन टेबल**: विकसक अनुभवानुसार कुठून सुरुवात करावी याबाबत स्पष्ट मार्गदर्शन

#### बदलले
- **README संरचना**: माहिती क्रमाने आउटपुटसाठी पुनर्रचनेत केली — महत्वाची माहिती आधी
- **परिचय विभाग**: नवोदितांसाठी "The Magic of `azd up`" स्पष्ट करण्यासाठी पुन्हा लिहिले
- **नक्कल सामग्री काढली**: डुप्लिकेट त्रुटी निवारण विभाग काढला
- **त्रुटी निवारण कमांड्स**: `azd logs` संदर्भ दुरुस्त करून `azd monitor --logs` वापरले

#### दुरुस्ती
- **🔐 प्रमाणीकरण कमांड्स**: `azd auth login` आणि `azd auth logout` cheat-sheet.md मध्ये जोडले
- **अवैध कमांड संदर्भ**: README त्रुटी निवारण विभागातून उरलेले `azd logs` काढले

#### नोंदी
- **व्याप्ती**: बदल मुख्य README.md आणि resources/cheat-sheet.md वर लागू
- **लक्ष्य प्रेक्षक**: बदल AZD मध्ये नवीन असलेल्या विकासकांसाठी लक्षात ठेवून केले

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI कमांड अचूकता अद्यतन
**या आवृत्तीत दस्तऐवजांमधील अवैध AZD कमांड्स दुरुस्त केल्या गेल्या, ज्यामुळे सर्व कोड उदाहरणे वैध Azure Developer CLI सिंटॅक्स वापरतात.**

#### दुरुस्ती
- **🔧 अस्तित्वात नसलेले AZD कमांड्स काढले/दुरुस्त केले**: व्यापक ऑडिट आणि अवैध कमांड्सचे दुरुस्ती:
  - `azd logs` (अस्तित्वात नाही) → `azd monitor --logs` किंवा Azure CLI पर्यायांसह बदलला
  - `azd service` उप-कमांड्स (अस्तित्वात नाहीत) → `azd show` आणि Azure CLI सह बदलले
  - `azd infra import/export/validate` (अस्तित्वात नाही) → काढले किंवा वैध पर्यायांनी बदलले
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ध्वज (अस्तित्वात नाहीत) → काढले
  - `azd provision --what-if/--rollback` ध्वज (अस्तित्वात नाहीत) → `--preview` वापरण्यासाठी अद्यतनित केले
  - `azd config validate` (अस्तित्वात नाही) → `azd config list` ने बदलले
  - `azd info`, `azd history`, `azd metrics` (अस्तित्वात नाहीत) → काढले

- **📚 फाइल्स ज्या कमांड दुरुस्तींसह अद्यतनित केल्या**:
  - `resources/cheat-sheet.md`: कमांड संदर्भाचा मोठा रीविजन
  - `docs/deployment/deployment-guide.md`: रोलबॅक आणि डिप्लॉयमेंट धोरणे दुरुस्त केली
  - `docs/troubleshooting/debugging.md`: लॉग विश्लेषण विभाग दुरुस्त
  - `docs/troubleshooting/common-issues.md`: त्रुटी निवारण कमांड्स अद्यतनित
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिंग विभाग दुरुस्त
  - `docs/getting-started/azd-basics.md`: मॉनिटरिंग कमांड्स दुरुस्त
  - `docs/getting-started/first-project.md`: मॉनिटरिंग आणि डिबगिंग उदाहरणे अद्यतनित
  - `docs/getting-started/installation.md`: मदत आणि आवृत्ती उदाहरणे दुरुस्त
  - `docs/pre-deployment/application-insights.md`: लॉग दृश्य करण्याच्या कमांड्स दुरुस्त
  - `docs/pre-deployment/coordination-patterns.md`: एजंट डिबगिंग कमांड्स दुरुस्त

- **📝 आवृत्ती संदर्भ अद्यतनित**:
  - `docs/getting-started/installation.md`: हार्डकोडेड `1.5.0` आवृत्ती `1.x.x` सह बदलली आणि रिलीजेससाठी दुवा दिला

#### बदलले
- **Rollback धोरणे**: दस्तऐवज Git-आधारित रोलबॅक वापरण्यासाठी अद्ययावत — AZD मध्ये नेटिव्ह रोलबॅक नाही
- **लॉग दृश्य**: `azd logs` संदर्भ `azd monitor --logs`, `azd monitor --live`, आणि Azure CLI कमांड्सने बदलले
- **कामगिरी विभाग**: अस्तित्वात नसलेल्या parallel/incremental डिप्लॉयमेंट ध्वजांना काढले आणि वैध पर्याय सुचवले

#### तांत्रिक तपशील
- **वैध AZD आदेश**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor फ्लॅग**: `--live`, `--logs`, `--overview`
- **काढून टाकलेली वैशिष्ट्ये**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### नोंदी
- **पडताळणी**: आदेश Azure Developer CLI v1.23.x विरुद्ध पडताळले गेले

---

### [v3.9.0] - 2026-02-05

#### कार्यशाळा पूर्णत्व आणि दस्तऐवजीकरण गुणवत्ता अद्यतन
**ही आवृत्ती परस्पर संवादात्मक कार्यशाळा मॉड्यूल पूर्ण करते, सर्व तुटलेले दस्तऐवजीकरण दुवे दुरुस्त करते, आणि Microsoft AZD वापरणाऱ्या AI विकासकांसाठी एकूण सामग्रीची गुणवत्ता सुधारते.**

#### जोडले
- **📝 CONTRIBUTING.md**: नवीन योगदान मार्गदर्शक दस्तऐवज ज्यात:
  - समस्या नोंदवण्याच्या आणि बदल सुचवण्याच्या स्पष्ट सूचना
  - नवीन सामग्रीसाठी दस्तऐवजीकरण मानके
  - कोड उदाहरण मार्गदर्शक आणि कमिट संदेश परंपरा
  - समुदाय सहभागाबद्दल माहिती

#### पूर्ण झाले
- **🎯 कार्यशाळा मॉड्यूल 7 (Wrap-up)**: पूर्णपणे पूर्ण झालेले समारोप मॉड्यूल ज्यात:
  - कार्यशाळेतील उपलब्ध्यांचे व्यापक सारांश
  - AZD, templates, आणि Microsoft Foundry यांचा समावेश करणारा प्रमुख संकल्पना विभाग
  - शिकण्याच्या प्रवास पुढे कसा करावा याबाबत शिफारसी
  - अवघडीत्व रेटिंगसहित कार्यशाळा आव्हान व्यायाम
  - समुदाय अभिप्राय आणि समर्थन दुवे

- **📚 कार्यशाळा मॉड्यूल 3 (Deconstruct)**: अद्यतनित शिकण्याच्या उद्दिष्टांसह:
  - GitHub Copilot सह MCP सर्व्हर सक्रिय करण्याचे मार्गदर्शन
  - AZD template फोल्डर संरचना समज
  - Infrastructure-as-code (Bicep) संघटन पॅटर्न
  - प्रॅक्टिकल लॅब सूचना

- **🔧 कार्यशाळा मॉड्यूल 6 (Teardown)**: पूर्ण झाले ज्यात:
  - संसाधने साफ करणे आणि खर्च व्यवस्थापन उद्दिष्टे
  - सुरक्षित पायाभूत सुविधांचे डिप्रोविजन करण्यासाठी `azd down` वापर
  - सॉफ्ट-डिलिट केलेल्या Cognitive Services ची पुनर्प्राप्ती मार्गदर्शक
  - GitHub Copilot आणि Azure Portal साठी बोनस एक्सप्लोरेशन प्रॉम्प्ट्स

#### दुरुस्त केले
- **🔗 तुटलेले दुवे दुरुस्ती**: 15+ तुटलेले अंतर्गत दस्तऐवजीकरण दुवे सोडवले:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md कडेचे मार्ग दुरुस्त केले
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md आणि production-ai-practices.md कडेचे मार्ग दुरुस्त केले
  - `docs/getting-started/first-project.md`: अस्तित्त्वात नसलेल्या cicd-integration.md चे deployment-guide.md ने पुनर्स्थापन केले
  - `examples/retail-scenario.md`: FAQ आणि troubleshooting guide कडेचे मार्ग दुरुस्त केले
  - `examples/container-app/microservices/README.md`: कोर्स होम आणि deployment guide कडेचे मार्ग दुरुस्त केले
  - `resources/faq.md` आणि `resources/glossary.md`: AI प्रकरणे संदर्भ अद्यतनित केले
  - `course-outline.md`: instructor guide आणि AI कार्यशाळा लॅब संदर्भ दुरुस्त केले

- **📅 कार्यशाळा स्थिती बॅनर**: "Under Construction" पासून सक्रिय कार्यशाळा स्थितीवर फेब्रुवारी 2026 तारीखसह अद्यतनित केले

- **🔗 कार्यशाळा नेव्हिगेशन**: README.md मधील तुटलेले नेव्हिगेशन दुवे जे non-existent lab-1-azd-basics फोल्डरकडे निर्देश करत होते ते दुरुस्त केले

#### बदलले
- **कार्यशाळा सादरीकरण**: "under construction" चेतावणी काढून टाकली, कार्यशाळा आता पूर्ण झाली आहे आणि वापरासाठी तयार आहे
- **नेव्हिगेशन सुसंगतता**: सर्व कार्यशाळा मॉड्यूलमध्ये योग्य इंटर-मॉड्यूल नेव्हिगेशन आहे याची खात्री केली
- **शिकण्याच्या मार्ग संदर्भ**: अध्याय क्रॉस-रेफरन्स दुरुस्त केले आणि योग्य microsoft-foundry पाथ वापरले

#### पडताळले
- ✅ सर्व इंग्रजी Markdown फाइल्समध्ये वैध अंतर्गत दुवे आहेत
- ✅ कार्यशाळा मॉड्यूल 0-7 शिकण्याच्या उद्दिष्टांसह पूर्ण आहेत
- ✅ अध्याय आणि मॉड्यूल दरम्यान नेव्हिगेशन योग्यरित्या कार्य करते
- ✅ सामग्री Microsoft AZD वापरणाऱ्या AI विकासकांसाठी योग्य आहे
- ✅ सुरुवातीच्या वापरकर्त्यांसाठी सोपी भाषा आणि संरचना टिकवून ठेवली आहे
- ✅ CONTRIBUTING.md समुदाय योगदानकर्त्यांसाठी स्पष्ट मार्गदर्शन प्रदान करतो

#### तांत्रिक अंमलबजावणी
- **लिंक पडताळणी**: ऑटोमेटेड PowerShell स्क्रिप्टने सर्व .md अंतर्गत दुवे पडताळले
- **कंटेंट ऑडिट**: कार्यशाळेच्या पूर्णतेची आणि सुरुवातीच्या वापरकर्त्यासाठी योग्यतेची मॅन्युअल समीक्षा
- **नेव्हिगेशन सिस्टम**: सातत्यपूर्ण अध्याय व मॉड्यूल नेव्हिगेशन पॅटर्न लागू केले

#### नोंदी
- **व्याप्ती**: बदल फक्त इंग्रजी दस्तऐवजीकरणावर लागू केले गेले
- **अनुवाद**: या आवृत्तीमध्ये अनुवाद फोल्डर्स अद्यतनित केले गेले नाहीत (ऑटोमेटेड अनुवाद नंतर समक्रमित होईल)
- **कार्यशाळा कालावधी**: पूर्ण कार्यशाळा आता 3-4 तासांच्या प्रत्यक्ष प्रशिक्षण प्रदान करते

---

### [v3.8.0] - 2025-11-19

#### प्रगत दस्तऐवजीकरण: मॉनिटरिंग, सुरक्षा, आणि मल्टी-एजंट पॅटर्न
**ही आवृत्ती Application Insights एकत्रीकरण, प्रमाणन पॅटर्न, आणि उत्पादन तैनातींसाठी मल्टी-एजंट समन्वयावर व्यापक A-ग्रेड धडे जोडते.**

#### जोडले
- **📊 Application Insights एकत्रीकरण धडा**: `docs/pre-deployment/application-insights.md` मध्ये:
  - स्वयंचलित प्रोव्हिजनिंगसह AZD-केंद्रित तैनाती
  - Application Insights + Log Analytics साठी संपूर्ण Bicep टेम्पलेट्स
  - कस्टम टेलिमेट्रीसह कार्यान्वित Python अनुप्रयोग (1,200+ ओळी)
  - AI/LLM मॉनिटरिंग पॅटर्न (Microsoft Foundry Models टोकन/खर्च ट्रॅकिंग)
  - 6 Mermaid आरेख (आर्किटेक्चर, वितरीत ट्रेसिंग, टेलिमेट्री फ्लो)
  - 3 प्रॅक्टिकल व्यायाम (अलर्ट, डॅशबोर्ड, AI मॉनिटरिंग)
  - Kusto क्वेरी उदाहरणे आणि खर्च ऑप्टिमायझेशन रणनीती
  - लाइव्ह मेट्रिक्स स्ट्रीमिंग आणि रिअल-टाइम डिबगिंग
  - उत्पादन-तयार पॅटर्नसह 40-50 मिनिटांचा शिकण्याचा वेळ

- **🔐 प्रमाणन आणि सुरक्षा पॅटर्न धडा**: `docs/getting-started/authsecurity.md` मध्ये:
  - 3 प्रमाणन पॅटर्न (connection strings, Key Vault, managed identity)
  - सुरक्षित तैनातींसाठी संपूर्ण Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स
  - Azure SDK एकत्रीकरणासह Node.js अनुप्रयोग कोड
  - 3 संपूर्ण व्यायाम (managed identity सक्षम करणे, user-assigned identity, Key Vault रोटेशन)
  - सुरक्षा सर्वोत्तम पद्धती आणि RBAC कॉन्फिगरेशन
  - समस्यास निवारण मार्गदर्शक आणि खर्च विश्लेषण
  - उत्पादन-तयार पासवर्डलेस प्रमाणन पॅटर्न

- **🤖 मल्टी-एजंट समन्वय पॅटर्न धडा**: `docs/pre-deployment/coordination-patterns.md` मध्ये:
  - 5 समन्वय पॅटर्न (sequential, parallel, hierarchical, event-driven, consensus)
  - पूर्ण orchestrator सेवा अंमलबजावणी (Python/Flask, 1,500+ ओळी)
  - 3 विशेषीकृत एजंट अंमलबजावण्या (Research, Writer, Editor)
  - मेसेज क्यूइंगसाठी Service Bus एकत्रीकरण
  - वितरित सिस्टमसाठी Cosmos DB स्टेट व्यवस्थापन
  - एजंट संवाद दाखवणारी 6 Mermaid आरेख
  - 3 प्रगत व्यायाम (timeout हाताळणी, retry लॉजिक, circuit breaker)
  - ऑप्टिमायझेशन रणनीतींसह खर्च तपशील ($240-565/महिना)
  - मॉनिटरिंगसाठी Application Insights एकत्रीकरण

#### सुधारीत
- **Pre-deployment अध्याय**: आता व्यापक मॉनिटरिंग आणि समन्वय पॅटर्नचा समावेश
- **Getting Started अध्याय**: व्यावसायिक प्रमाणन पॅटर्नसह समृद्ध
- **उत्पादन तयारता**: सुरक्षा ते ऑब्झर्वेबिलिटीपर्यंत संपूर्ण कव्हरेज
- **कोर्स आऊटलाइन**: नवे धडे अध्याय 3 आणि 6 मध्ये संदर्भित केले

#### बदलले
- **शिकण्याची प्रगती**: सुरक्षा आणि मॉनिटरिंगचे चांगले समाकलन
- **दस्तऐवजीकरण गुणवत्ता**: नवीन धड्यांमध्ये सुसंगत A-ग्रेड मानके (95-97%)
- **उत्पादन पॅटर्न**: एंटरप्राइझ तैनातींसाठी पूर्ण एंड-टू-एंड कव्हरेज

#### सुधारले
- **विकसक अनुभव**: विकासापासून उत्पादन मॉनिटरिंगपर्यंत स्पष्ट मार्ग
- **सुरक्षा मानके**: प्रमाणन आणि गुप्त व्यवस्थापनासाठी व्यावसायिक पॅटर्न
- **ऑब्झर्वेबिलिटी**: AZD सह संपूर्ण Application Insights एकत्रीकरण
- **AI वर्कलोड्स**: Microsoft Foundry Models आणि मल्टी-एजंट सिस्टीमसाठी विशेष मॉनिटरिंग

#### पडताळले
- ✅ सर्व धडे संपूर्ण कार्यरत कोड समाविष्ट करतात (स्निपेट्स नाहीत)
- ✅ दृश्य शिक्षणासाठी Mermaid आरेख (एकूण 19, 3 धड्यांत)
- ✅ पडताळणी स्टेप्ससह प्रॅक्टिकल व्यायाम (एकूण 9)
- ✅ उत्पादन-तयार Bicep टेम्पलेट्स जे `azd up` द्वारे तैनात करता येतात
- ✅ खर्च विश्लेषण आणि ऑप्टिमायझेशन रणनीती
- ✅ समस्यास निवारण मार्गदर्शक आणि सर्वोत्तम पद्धती
- ✅ पडताळणी आदेशांसह ज्ञान तपासणी बिंदू

#### दस्तऐवजीकरण ग्रेडिंग निकाल
- **docs/pre-deployment/application-insights.md**: - व्यापक मॉनिटरिंग मार्गदर्शक
- **docs/getting-started/authsecurity.md**: - व्यावसायिक सुरक्षा पॅटर्न
- **docs/pre-deployment/coordination-patterns.md**: - प्रगत मल्टी-एजंट आर्किटेक्चर
- **Overall New Content**: - सुसंगत उच्च-गुणवत्तेची मानके

#### तांत्रिक अंमलबजावणी
- **Application Insights**: Log Analytics + कस्टम टेलिमेट्री + वितरीत ट्रेसिंग
- **प्रमाणन**: Managed Identity + Key Vault + RBAC पॅटर्न
- **मल्टी-एजंट**: Service Bus + Cosmos DB + Container Apps + ऑर्केस्ट्रेशन
- **मॉनिटरिंग**: लाइव्ह मेट्रिक्स + Kusto क्वेरी + अलर्ट + डॅशबोर्ड
- **खर्च व्यवस्थापन**: सॅम्पलिंग स्ट्रॅटेजीज, रिटेन्शन पॉलिसीज, बजेट कंट्रोल

### [v3.7.0] - 2025-11-19

#### दस्तऐवजीकरण गुणवत्ता सुधारणा आणि नवीन Microsoft Foundry Models उदाहरण
**ही आवृत्ती रेपॉजिटरीतील दस्तऐवजीकरण गुणवत्ता सुधारते आणि gpt-4.1 च्या चॅट इंटरफेससह Microsoft Foundry Models च्या पूर्ण डिप्लॉयमेंट उदाहरणाची भर घालते.**

#### जोडले
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` मध्ये पूर्ण gpt-4.1 तैनातीसहित कार्यान्वित उदाहरण:
  - पूर्ण Microsoft Foundry Models इन्फ्रास्ट्रक्चर (gpt-4.1 मॉडेल तैनाती)
  - संभाषण इतिहासासह Python कमांड-लाइन चॅट इंटरफेस
  - सुरक्षित API की स्टोरेजसाठी Key Vault एकत्रीकरण
  - टोकन वापर ट्रॅकिंग आणि खर्च अंदाज
  - रेट लिमिटिंग आणि त्रुटी हाताळणी
  - 35-45 मिनिटांच्या तैनाती मार्गदर्शकासह संपूर्ण README
  - 11 उत्पादन-तयार फायली (Bicep टेम्पलेट्स, Python अ‍ॅप, कॉन्फिगरेशन)
- **📚 दस्तऐवजीकरण व्यायाम**: कॉन्फिगरेशन मार्गदर्शकासाठी हाताळणी व्यायाम जोडले:
  - व्यायाम 1: मल्टि-एन्व्हायर्नमेंट कॉन्फिगरेशन (15 मिनिटे)
  - व्यायाम 2: गुप्त व्यवस्थापन सराव (10 मिनिटे)
  - स्पष्ट यश निकष आणि पडताळणी पावले
- **✅ तैनाती पडताळणी**: तैनाती मार्गदर्शकात पडताळणी विभाग जोडला:
  - हेल्थ चेक पद्धती
  - यश निकष चेकलिस्ट
  - सर्व तैनाती आदेशांसाठी अपेक्षित आउटपुट
  - समस्या निवारण त्वरित संदर्भ

#### सुधारीत
- **examples/README.md**: A-ग्रेड गुणवत्ता (93%) पर्यंत अद्यतनित:
  - azure-openai-chat सर्व संबंधित विभागांत समाविष्ट केले
  - स्थानिक उदाहरण संख्या 3 वरून 4 वर अद्यतनित केली
  - AI अनुप्रयोग उदाहरण सारणीत जोडले
  - मध्यमवर्गीय वापरकर्त्यांसाठी क्विक स्टार्टमध्ये समाकलित
  - Microsoft Foundry टेम्पलेट्स विभागात समाविष्ट
  - तुलना मॅट्रिक्स आणि तंत्रज्ञान शोध विभाग अद्यतनित
- **दस्तऐवजीकरण गुणवत्ता**: B+ (87%) → A- (92%) पर्यंत सुधारली:
  - महत्त्वाच्या आदेश उदाहरणांसाठी अपेक्षित आउटपुट जोडले
  - कॉन्फिगरेशन बदलांसाठी पडताळणी पावले समाविष्ट
  - व्यावहारिक व्यायामांसह प्रॅक्टिकल शिक्षण वाढवले

#### बदलले
- **शिकण्याची प्रगती**: मध्यमवर्गीय शिकणाऱ्यांसाठी AI उदाहरणांचे चांगले समाकलन
- **दस्तऐवजीकरण संरचना**: अधिक व्यवहार्य व्यायाम आणि स्पष्ट परिणाम
- **पडताळणी प्रक्रिया**: मुख्य वर्कफ्लोमध्ये स्पष्ट यश निकष जोडले

#### सुधारले
- **विकसक अनुभव**: Microsoft Foundry Models तैनाती आता 35-45 मिनिटे घेतात (कठीण पर्यायांच्या विरुद्ध 60-90 मिनिटांच्या तुलनेत)
- **खर्च पारदर्शकता**: Microsoft Foundry Models उदाहरणासाठी स्पष्ट खर्च अंदाज ($50-200/महिना)
- **शिकण्याचा मार्ग**: AI विकासकांसाठी azure-openai-chat ने स्पष्ट प्रवेश बिंदू प्रदान केले
- **दस्तऐवजीकरण मानके**: अपेक्षित आउटपुट आणि पडताळणी पावले सुसंगतपणे लागू

#### पडताळले
- ✅ Microsoft Foundry Models उदाहरण `azd up` सह पूर्ण कार्यरत
- ✅ सर्व 11 अंमलबजावणी फायली सिन्टॅक्सनमधून बरोबर
- ✅ README निर्देश वास्तविक तैनाती अनुभवाशी जुळतात
- ✅ 8+ स्थानिक स्थानांमध्ये दस्तऐवजीकरण दुवा अद्यतनित
- ✅ examples निर्देशिका अचूकपणे 4 स्थानिक उदाहरणे दर्शवते
- ✅ टेबलमध्ये कोणतेही पुनरावृत्ती बाह्य दुवे नाहीत
- ✅ सर्व नेव्हिगेशन संदर्भ बरोबर

#### तांत्रिक अंमलबजावणी
- **Microsoft Foundry Models आर्किटेक्चर**: gpt-4.1 + Key Vault + Container Apps पॅटर्न
- **सुरक्षा**: Managed Identity रेडी, Key Vault मध्ये गुप्त माहिती
- **मॉनिटरिंग**: Application Insights एकत्रीकरण
- **खर्च व्यवस्थापन**: टोकन ट्रॅकिंग आणि वापर ऑप्टिमायझेशन
- **तैनाती**: संपूर्ण सेटअपसाठी एक `azd up` आदेश

### [v3.6.0] - 2025-11-19

#### मोठे अद्यतन: Container App तैनाती उदाहरणे
**ही आवृत्ती Azure Developer CLI (AZD) वापरुन कंटेनर अॅप्लिकेशन तैनातीसाठी व्यापक, उत्पादन-तयार उदाहरणे सादर करते, पूर्ण दस्तऐवजीकरण आणि शिकण्याच्या मार्गात समाकलनासह.**

#### जोडले
- **🚀 Container App उदाहरणे**: नवीन स्थानिक उदाहरणे `examples/container-app/` मध्ये:
  - [Master Guide](examples/container-app/README.md): कंटेनरायझ्ड तैनातींचे संपूर्ण आढावा, क्विक स्टार्ट, उत्पादन आणि प्रगत पॅटर्न
  - [Simple Flask API](../../examples/container-app/simple-flask-api): सुरुवातीच्या वापरकर्त्यासाठी REST API ज्यात scale-to-zero, हेल्थ प्रोब्स, मॉनिटरिंग, आणि समस्या निवारण
  - [Microservices Architecture](../../examples/container-app/microservices): उत्पादन-तयार बहु-सेवा तैनाती (API Gateway, Product, Order, User, Notification), async मेसेजिंग, Service Bus, Cosmos DB, Azure SQL, वितरीत ट्रेसिंग, blue-green/canary तैनाती
- **सर्वोत्तम प्रॅक्टिसेस**: सुरक्षा, मॉनिटरिंग, खर्च ऑप्टिमायझेशन, आणि CI/CD मार्गदर्शन कंटेनर वर्कलोडसाठी
- **कोड सॅम्पल्स**: संपूर्ण `azure.yaml`, Bicep टेम्पलेट्स, आणि बहुभाषिक सेवा अंमलबजावण्या (Python, Node.js, C#, Go)
- **चाचणी व समस्या निवारण**: एंड-टू-एंड चाचणी परिदृश्ये, मॉनिटरिंग आदेश, समस्या निवारण मार्गदर्शक

#### बदलले
- **README.md**: नवीन कंटेनर अॅप उदाहरणे "Local Examples - Container Applications" अंतर्गत दाखवण्यासाठी आणि लिंक करण्यासाठी अद्यतनित
- **examples/README.md**: कंटेनर अॅप उदाहरणे हायलाइट करण्यासाठी, तुलना मॅट्रिक्स नोंदी जोडण्यासाठी, आणि तंत्रज्ञान/आर्किटेक्चर संदर्भ अद्यतनित करण्यासाठी अद्यतनित
- **Course Outline & Study Guide**: संबंधित प्रकरणांमध्ये नवीन कंटेनर अॅप उदाहरणे आणि तैनाती पॅटर्न संदर्भित करण्यासाठी अद्यतनित

#### सत्यापित
- ✅ सर्व नवीन उदाहरणे `azd up` वापरून तैनात करण्यायोग्य आहेत आणि सर्वोत्तम पद्धतींचे पालन करतात
- ✅ दस्तऐवज क्रॉस-लिंक आणि नेव्हिगेशन अद्यतनित केले गेले आहेत
- ✅ उदाहरणे प्रारंभिक ते प्रगत परिस्थिती समाविष्ट करतात, यामध्ये उत्पादन मायक्रोसर्व्हिसेस देखील आहेत

#### नोंदी
- **व्याप्ती**: फक्त इंग्रजी दस्तऐवज आणि उदाहरणे
- **पुढील पावले**: भविष्यातील प्रकाशनांमध्ये अतिरिक्त प्रगत कंटेनर पॅटर्न आणि CI/CD ऑटोमेशनचा विस्तार करा

### [v3.5.0] - 2025-11-19

#### उत्पादनाचे पुनर्ब्रँडिंग: Microsoft Foundry
**या आवृत्तीत सर्व इंग्रजी दस्तऐवजांमध्ये उत्पादनाचे नाव "Microsoft Foundry" पासून "Microsoft Foundry" पर्यंत व्यापकपणे बदल करण्याची अंमलबजावणी केली आहे, जी Microsoft च्या अधिकृत पुनर्ब्रँडिंगला प्रतिबिंबित करते.**

#### बदल
- **🔄 उत्पादन नाव अद्यतन**: "Microsoft Foundry" पासून "Microsoft Foundry" पर्यंत संपूर्ण पुनर्ब्रँडिंग
  - `docs/` फोल्डरमधील सर्व इंग्रजी दस्तऐवजांमधील संदर्भ अद्यतनित केले
  - फोल्डरचे नाव बदलले: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फाइलचे नाव बदलले: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - एकूण: 7 दस्तऐवज फाइल्समध्ये 23 सामग्री संदर्भ अद्यतनित

- **📁 फोल्डर संरचना बदल**:
  - `docs/ai-foundry/` चे नाव `docs/microsoft-foundry/` असे बदलले गेले
  - सर्व क्रॉस-रेफरन्सेस नवीन फोल्डर संरचनेनुसार अद्यतनित केले गेले
  - सर्व दस्तऐवजात नेव्हिगेशन दुवे सत्यापित केले गेले

- **📄 फाइल नावे बदलली**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सर्व अंतर्गत दुवे नवीन फाईल नावाकडे निर्देशित करण्यासाठी अद्यतनित केले गेले

#### अद्यतनित फाइल्स
- **अध्याय दस्तऐवजीकरण** (7 फायली):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेव्हिगेशन दुवा अद्यतने
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 उत्पादन नाव संदर्भ अद्यतने
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - आधीच Microsoft Foundry वापरत आहे (मागील अद्यतनांमधून)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 संदर्भ अद्यतने (आढावा, समुदाय अभिप्राय, दस्तऐवजीकरण)
  - `docs/getting-started/azd-basics.md` - 4 क्रॉस-रेफरन्स दुवा अद्यतने
  - `docs/getting-started/first-project.md` - 2 अध्याय नेव्हिगेशन दुवा अद्यतने
  - `docs/getting-started/installation.md` - 2 पुढील अध्याय दुवा अद्यतने
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 संदर्भ अद्यतने (नेव्हिगेशन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - 1 नेव्हिगेशन दुवा अद्यतन
  - `docs/troubleshooting/debugging.md` - 1 नेव्हिगेशन दुवा अद्यतन

- **कोर्स रचना फायली** (2 फायली):
  - `README.md` - 17 संदर्भ अद्यतन (कोर्स आढावा, अध्याय शीर्षके, टेम्पलेट्स विभाग, समुदाय अंतर्दृष्टी)
  - `course-outline.md` - 14 संदर्भ अद्यतन (आढावा, शिक्षण उद्दिष्टे, अध्याय संसाधने)

#### सत्यापित
- ✅ इंग्रजी दस्तऐवजांमध्ये उर्वरित "ai-foundry" फोल्डर पथ संदर्भ शून्य आहेत
- ✅ इंग्रजी दस्तऐवजांमध्ये "Microsoft Foundry" उत्पादन नावाचे शिल्लक संदर्भ शून्य आहेत
- ✅ सर्व नेव्हिगेशन दुवे नवीन फोल्डर संरचनेसह कार्यरत आहेत
- ✅ फाइल आणि फोल्डर नावे यशस्वीरित्या बदलण्यात आली आहेत
- ✅ प्रकरणांमधील क्रॉस-रेफरन्सेस सत्यापित केले

#### नोंदी
- **व्याप्ती**: बदल फक्त `docs/` फोल्डरमधील इंग्रजी दस्तऐवजांवर लागू केले गेले
- **अनुवाद**: `translations/` अनुवाद फोल्डर्स या आवृत्तीत अद्यतनित केले गेले नाहीत
- **कार्यशाळा**: `workshop/` कार्यशाळेची सामग्री या आवृत्तीत अद्यतनित केलेली नाही
- **उदाहरणे**: उदाहरण फाइल्स अद्याप वारसा नाव संदर्भित करू शकतात (भविष्यातील अद्यतनात यावर काम केले जाईल)
- **बाह्य दुवे**: बाह्य URL आणि GitHub रेपॉझिटरी संदर्भ अपरिवर्तित राहतील

#### योगदानकर्त्यांसाठी मायग्रेशन मार्गदर्शक
If you have local branches or documentation referencing the old structure:
1. फोल्डर संदर्भ अद्यतनित करा: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फाईल संदर्भ अद्यतनित करा: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पादन नाव बदला: "Microsoft Foundry" → "Microsoft Foundry"
4. सर्व अंतर्गत दस्तऐवज दुवे अजूनही कार्यरत आहेत याची पडताळणी करा

---

### [v3.4.0] - 2025-10-24

#### इन्फ्रास्ट्रक्चर प्रिव्ह्यू आणि सत्यापन सुधारणा
**या आवृत्तीत नवीन Azure Developer CLI प्रिव्ह्यू फिचरसाठी सर्वसमावेशक समर्थन समाविष्ट केले आहे आणि कार्यशाळेचा वापरकर्ता अनुभव सुधारला आहे.**

#### जोडले
- **🧪 azd provision --preview Feature Documentation**: नवीन इन्फ्रास्ट्रक्चर प्रिव्ह्यू क्षमतेचे सर्वसमावेशक कव्हरेज
  - चीट शीटमध्ये कमांड संदर्भ आणि वापर उदाहरणे
  - प्रोव्हिजनिंग मार्गदर्शिकेत वापरप्रकरणे आणि फायदे यांसह सविस्तर एकत्रीकरण
  - सुरक्षित तैनाती सत्यापनासाठी प्री-फ्लाइट चेक समाकलन
  - सुरक्षाप्रथम तैनाती पद्धतींसह गेटिंग स्टार्ट मार्गदर्शक अद्यतने
- **🚧 कार्यशाळा स्थिती बॅनर**: कार्यशाळा विकास स्थिती दर्शविणारे व्यावसायिक HTML बॅनर
  - स्पष्ट वापरकर्ता संवादासाठी ग्रेडियंट डिझाईन आणि बांधकाम निर्देशक
  - पारदर्शकतेसाठी शेवटचे अद्यतन टाईमस्टँप
  - सर्व डिव्हाइस प्रकारांसाठी मोबाइल-प्रतिक्रियाशील डिझाईन

#### सुधारित
- **इन्फ्रास्ट्रक्चर सुरक्षा**: प्रिव्ह्यू कार्यक्षमता तैनाती दस्तऐवजात सर्वत्र समाकलित
- **पूर्व-तैनाती पडताळणी**: स्वयंचलित स्क्रिप्टमध्ये आता इन्फ्रास्ट्रक्चर प्रिव्ह्यू चाचणी समाविष्ट
- **डेव्हलपर वर्कफ्लो**: सर्वोत्तम पद्धती म्हणून प्रिव्ह्यू समाविष्ट करणारे कमांड सिक्वन्स अद्यतनित
- **कार्यशाळा अनुभव**: वापरकर्त्यांसाठी सामग्री विकास स्थितीबद्दल स्पष्ट अपेक्षा

#### बदल
- **तैनाती सर्वोत्तम पद्धती**: प्रिव्ह्यू-प्रथम वर्कफ्लो आता शिफारस केलेला दृष्टिकोन
- **दस्तऐवजीकरण प्रवाह**: इन्फ्रास्ट्रक्चर सत्यापन शिक्षण प्रक्रियेतील आधी हलवले गेले
- **कार्यशाळा सादरीकरण**: विकास टाइमलाइनसह व्यावसायिक स्थिती संवाद

#### सुधारणा
- **सुरक्षाप्रथम दृष्टिकोन**: तैनातीपूर्वी इन्फ्रास्ट्रक्चर बदल आता पडताळणी करता येतात
- **टीम सहयोग**: पुनरावलोकन आणि मान्यतेसाठी प्रिव्ह्यू निकाल सामायिक केले जाऊ शकतात
- **खर्च जागरूकता**: प्रोव्हिजनिंगपूर्वी संसाधन खर्चांचे चांगले आकलन
- **जोखमी कमी करणे**: आगाऊ पडताळणीद्वारे तैनाती विफलता कमी

#### तांत्रिक अंमलबजावणी
- **मल्टी-डॉक्युमेंट एकत्रीकरण**: प्रिव्ह्यू फिचर 4 प्रमुख फाइल्समध्ये दस्तऐवजीकरण
- **कमांड पॅटर्न**: दस्तऐवजांमध्ये सातत्यपूर्ण सिंटॅक्स आणि उदाहरणे
- **सर्वोत्तम पद्धती समाकलन**: प्रिव्ह्यू सत्यापन वर्कफ्लो आणि स्क्रिप्टमध्ये समाविष्ट
- **दृष्य निर्देशक**: शोधण्यायोग्यतेसाठी स्पष्ट NEW फिचर मार्किंग

#### कार्यशाळा इन्फ्रास्ट्रक्चर
- **स्थिती संवाद**: ग्रेडियंट स्टाइलिंगसह व्यावसायिक HTML बॅनर
- **वापरकर्ता अनुभव**: स्पष्ट विकास स्थिती गोंधळ टाळते
- **व्यावसायिक सादरीकरण**: अपेक्षा सेट करताना रेपॉझिटरी विश्वसनीयता राखते
- **टाइमलाइन पारदर्शकता**: जबाबदारीसाठी ऑक्टोबर 2025 चा शेवटचा अद्यतन टाईमस्टँप

### [v3.3.0] - 2025-09-24

#### सुधारित कार्यशाळा साहित्य आणि परस्परसंवादी शिक्षण अनुभव
**या आवृत्तीत ब्राउझर-आधारित परस्परसंवादी मार्गदर्शने आणि संरचित शिक्षण मार्गांसह सर्वसमावेशक कार्यशाळा साहित्य सादर केले आहे.**

#### जोडले
- **🎥 परस्परसंवादी कार्यशाळा मार्गदर्शक**: MkDocs प्रिव्ह्यू क्षमतेसह ब्राउझर-आधारित कार्यशाळा अनुभव
- **📝 संरचित कार्यशाळा सूचना**: शोधापासून सानुकूलनापर्यंत 7-स्टेप मार्गदर्शित शिक्षण मार्ग
  - 0-Introduction: कार्यशाळा आढावा आणि सेटअप
  - 1-Select-AI-Template: टेम्पलेट शोध आणि निवड प्रक्रिया
  - 2-Validate-AI-Template: तैनाती आणि पडताळणी प्रक्रिया
  - 3-Deconstruct-AI-Template: टेम्पलेट आर्किटेक्चर समजून घेणे
  - 4-Configure-AI-Template: कॉन्फिगरेशन आणि सानुकूलन
  - 5-Customize-AI-Template: प्रगत सुधारणा आणि पुनरावृत्त्या
  - 6-Teardown-Infrastructure: क्लीनअप आणि संसाधन व्यवस्थापन
  - 7-Wrap-up: सारांश आणि पुढील पावले
- **🛠️ कार्यशाळा टूलिंग**: सुधारित शिकण्याच्या अनुभवासाठी Material थीमसह MkDocs कॉन्फिगरेशन
- **🎯 हँड्स-ऑन शिकण्याचा मार्ग**: 3-स्टेप पद्धत (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces एकत्रीकरण**: सुसंगत विकास वातावरण सेटअप

#### सुधारित
- **AI कार्यशाळा लॅब**: 2-3 तासांच्या संरचित शिकण्याच्या अनुभवाने विस्तारित
- **कार्यशाळा दस्तऐवजीकरण**: नेव्हिगेशन आणि दृष्य सहाय्यांसह व्यावसायिक सादरीकरण
- **शिक्षण प्रगती**: टेम्पलेट निवडपासून उत्पादन तैनातपर्यंत स्पष्ट स्टेप-बाय-स्टेप मार्गदर्शन
- **डेव्हलपर अनुभव**: सुसंगत विकास वर्कफ्लोसाठी एकत्रित टूलिंग

#### सुधारणा
- **पहुँचयोग्यता**: शोध, कॉपी कार्यक्षमता आणि थीम टॉगलसह ब्राउझर-आधारित इंटरफेस
- **स्वतःच्या गतीचे शिक्षण**: विविध शिकण्याच्या गतींसाठी लवचिक कार्यशाळा रचना
- **व्यावहारिक अनुप्रयोग**: वास्तविक जगातील AI टेम्पलेट तैनाती परिस्थिती
- **समुदाय समावेश**: कार्यशाळा समर्थन आणि सहयोगासाठी Discord समाकलन

#### कार्यशाळा वैशिष्ट्ये
- **बिल्ट-इन शोध**: जलद कीवर्ड आणि धडा शोध
- **कोड ब्लॉक्स कॉपी करा**: सर्व कोड उदाहरणांसाठी होव्हर-टू-कॉपी कार्यक्षमता
- **थीम टॉगल**: वेगवेगळ्या प्राधान्यांसाठी डार्क/लाइट मोड समर्थन
- **दृश्यक साधने**: सुधारित समजेसाठी स्क्रीनशॉट आणि आकृत्या
- **सहाय्य समाकलन**: समुदाय समर्थनासाठी थेट Discord ऍक्सेस

### [v3.2.0] - 2025-09-17

#### प्रमुख नेव्हिगेशन पुर्नरचना आणि अध्याय-आधारित शिक्षण प्रणाली
**या आवृत्तीत संपूर्ण रेपॉझिटरीमध्ये सुधारित नेव्हिगेशनसह  अध्याय-आधारित व्यापक शिक्षण रचना सादर केली आहे.**

#### जोडले
- **📚 अध्याय-आधारित शिक्षण प्रणाली**: संपूर्ण कोर्स 8 प्रगतीशील अध्यायांमध्ये पुर्नरचित
  - अध्याय 1: पाया & त्वरीत प्रारंभ (⭐ - 30-45 mins)
  - अध्याय 2: AI-First विकास (⭐⭐ - 1-2 hours)
  - अध्याय 3: कॉन्फिगरेशन & प्रमाणपत्र (⭐⭐ - 45-60 mins)
  - अध्याय 4: Infrastructure as Code & तैनाती (⭐⭐⭐ - 1-1.5 hours)
  - अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स (⭐⭐⭐⭐ - 2-3 hours)
  - अध्याय 6: पूर्व-तैनाती पडताळणी & नियोजन (⭐⭐ - 1 hour)
  - अध्याय 7: समस्या निराकरण & डीबगिंग (⭐⭐ - 1-1.5 hours)
  - अध्याय 8: उत्पादन & एंटरप्राइझ पॅटर्न (⭐⭐⭐⭐ - 2-3 hours)
- **📚 सर्वसमावेशक नेव्हिगेशन सिस्टम**: सर्व दस्तऐवजांमध्ये सुसंगत नेव्हिगेशन हेडर्स आणि फूटर्स
- **🎯 प्रगती ट्रॅकिंग**: कोर्स पूर्णता चेकलिस्ट आणि शिकण्याची पडताळणी प्रणाली
- **🗺️ शिक्षण मार्गदर्शन**: वेगवेगळ्या अनुभव पातळ्यांसाठी आणि उद्दिष्टांसाठी स्पष्ट प्रवेश बिंदू
- **🔗 क्रॉस-रेफरन्स नेव्हिगेशन**: संबंधित अध्याय आणि पूर्वअट स्पष्टपणे लिंक केलेले

#### सुधारित
- **README संरचना**: अध्याय-आधारित संघटनासह संरचित शिकण्याच्या प्लॅटफॉर्ममध्ये रूपांतरित
- **दस्तऐवजीकरण नेव्हिगेशन**: प्रत्येक पृष्ठ आता अध्याय संदर्भ आणि प्रगती मार्गदर्शन समाविष्ट करते
- **टेम्पलेट संघटन**: उदाहरणे आणि टेम्पलेट्स योग्य अध्यायांना मॅप केलेले
- **संसाधन समाकलन**: चीट शीट्स, FAQs आणि स्टडी गाइड संबंधित अध्यायांशी जोडलेले
- **कार्यशाळा समाकलन**: हँड्स-ऑन लॅब्स बहु-प्रकरणी शिकण्याच्या उद्दिष्टांशी मॅप केलेले

#### बदल
- **शिकण्याची प्रगती**: रेषीय दस्तऐवजीकरणापासून लवचिक अध्याय-आधारित शिक्षणाकडे बदल
- **कॉन्फिगरेशन स्थान**: उत्तम शिकण्याच्या प्रवाहासाठी कॉन्फिगरेशन मार्गदर्शक अध्याय 3 मध्ये हलवले
- **AI सामग्री समाकलन**: शिक्षण प्रवासात AI-विशिष्ट सामग्रीचे चांगले एकत्रीकरण
- **उत्पादन सामग्री**: एंटरप्राइझ शिकणाऱ्यांसाठी प्रगत पॅटर्न अध्याय 8 मध्ये एकत्रित

#### सुधारणा
- **वापरकर्ता अनुभव**: स्पष्ट नेव्हिगेशन ब्रेडक्रम्ब्स आणि अध्याय प्रगती निर्देशक
- **पहुँचयोग्यता**: सोप्या कोर्स ट्रॅवर्सलसाठी सुसंगत नेव्हिगेशन पॅटर्न
- **व्यावसायिक सादरीकरण**: शैक्षणिक आणि कॉर्पोरेट प्रशिक्षणासाठी विद्यापीठ-शैली कोर्स संरचना योग्य
- **शिकण्याची कार्यक्षमता**: सुधारित संघटनाद्वारे relevant सामग्री शोधण्याचा वेळ कमी

#### तांत्रिक अंमलबजावणी
- **नेव्हिगेशन हेडर्स**: 40+ दस्तऐवज फाइल्समध्ये मानकीकृत अध्याय नेव्हिगेशन
- **फूटेर नेव्हिगेशन**: सुसंगत प्रगती मार्गदर्शन आणि अध्याय पूर्णता निर्देशक
- **क्रॉस-लिंकिंग**: संबंधित संकल्पनांना जोडणारी सर्वसमावेशक अंतर्गत लिंक प्रणाली
- **अध्याय मॅपिंग**: टेम्पलेट्स आणि उदाहरणे शिकण्याच्या उद्दिष्टांशी स्पष्टपणे संलग्न

#### स्टडी गाइड सुधारणा
- **📚 सर्वसमावेशक शिक्षण उद्दिष्टे**: 8-अध्याय प्रणालीशी संरेखित करण्यासाठी स्टडी गाइड पुर्नरचित
- **🎯 अध्याय-आधारित मूल्यांकन**: प्रत्येक अध्यायात विशिष्ट शिकण्याचे उद्दिष्टे आणि व्यावहारिक व्यायाम समाविष्ट
- **📋 प्रगती ट्रॅकिंग**: मोजता येणारे परिणाम आणि पूर्णता चेकलिस्टसह साप्ताहिक शिकण्याचे वेळापत्रक
- **❓ मूल्यांकन प्रश्न**: व्यावसायिक परिणामांसाठी प्रत्येक अध्यायासाठी ज्ञान पडताळणी प्रश्न
- **🛠️ व्यावहारिक व्यायाम**: वास्तविक तैनाती परिस्थिती आणि समस्या निवारणासह हँड्स-ऑन क्रियाकलाप
- **📊 कौशल्य प्रगती**: मूलभूत संकल्पनांपासून एंटरप्राइझ पॅटर्नपर्यंत स्पष्ट प्रगती आणि करिअर विकास लक्ष
- **🎓 प्रमाणपत्र ढांचा**: व्यावसायिक विकास परिणाम आणि समुदाय मान्यता प्रणाली
- **⏱️ टाइमलाइन व्यवस्थापन**: मैलाचे मापदंडांसह संरचित 10-साप्ताहिक शिक्षण योजना

### [v3.1.0] - 2025-09-17

#### सुधारित मल्टी-एजंट AI सोल्यूशन्स
**या आवृत्तीत रिटेल मल्टी-एजंट सोल्यूशनमध्ये एजंट नावे सुधारली गेली आहेत आणि दस्तऐवजीकरण अधिक परिपूर्ण केले आहे.**

#### बदल
- **मल्टी-एजंट टर्मिनॉलॉजी**: रिटेल मल्टी-एजंट सोल्यूशनमध्ये "Cora agent" ची जागा "Customer agent" ने घेतली गेली आहे ज्यामुळे अधिक स्पष्ट समज मिळेल
- **एजंट आर्किटेक्चर**: सर्व दस्तऐवज, ARM टेम्पलेट्स, आणि कोड उदाहरणांमध्ये सुसंगत "Customer agent" नाव वापरण्यासाठी अद्यतनित केले
- **कॉन्फिगरेशन उदाहरणे**: अद्ययावत नामकरण पद्धतींसह एजंट कॉन्फिगरेशन पॅटर्न आधुनिक बनवले गेले
- **दस्तऐवजीकरण सुसंगतता**: सर्व संदर्भ व्यावसायिक, वर्णनात्मक एजंट नावांसाठी सुनिश्चित केले गेले

#### सुधारित
- **ARM Template Package**: retail-multiagent-arm-template अद्ययावत केले गेले आहे, Customer एजंट संदर्भांसह
- **Architecture Diagrams**: नवीन एजंट नामकरणासह Mermaid आरेख ताजे केले गेले
- **Code Examples**: Python क्लासेस आणि अंमलबजावणीच्या उदाहरणांनी आता CustomerAgent नामकरण वापरले आहे
- **Environment Variables**: सर्व डिप्लॉयमेंट स्क्रिप्ट्स CUSTOMER_AGENT_NAME परंपरांचा वापर करण्यासाठी अद्ययावत केलेले आहेत

#### Improved
- **Developer Experience**: दस्तऐवजात एजंटच्या भूमिकां आणि जबाबदाऱ्यांचा अधिक स्पष्ट उल्लेख
- **Production Readiness**: एंटरप्राइझ नामकरण परंपरांशी चांगले संरेखन
- **Learning Materials**: शैक्षणिक हेतूंसाठी अधिक समजू शकणारे एजंट नामकरण
- **Template Usability**: एजंट कार्ये आणि डिप्लॉयमेंट नमुन्यांचे समज सुलभ केले

#### Technical Details
- Mermaid आर्किटेक्चर आरेखन CustomerAgent संदर्भांसह अद्ययावत केले गेले
- Python उदाहरणांमध्ये CoraAgent क्लास नावे CustomerAgent ने बदलली
- ARM टेम्पलेट JSON कॉन्फिगरेशन्स "customer" एजंट प्रकार वापरण्यासाठी सुधारित केले
- वातावरणातील चल (environment variables) CORA_AGENT_* पासून CUSTOMER_AGENT_* पॅटर्नमध्ये अद्ययावत केले गेले
- सर्व डिप्लॉयमेंट आदेश आणि कंटेनर कॉन्फिगरेशन्स ताजे केले गेले

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**हा आवृत्ती Microsoft Foundry एकत्रीकरणासह रिपॉझिटरीला एक सर्वसमावेशक AI-केंद्रित शिकण्याचा स्त्रोत बनवते.**

#### Added
- **🤖 AI-First Learning Path**: AI-प्रथम शिकण्याचा मार्ग पूर्णपणे रचना बदलून प्राथमिकता दिली आहे
- **Microsoft Foundry Integration Guide**: AZD ला Microsoft Foundry सेवांसोबत कनेक्ट करण्यासाठी सर्वसमावेशक दस्तऐवजीकरण
- **AI Model Deployment Patterns**: मॉडेल निवड, कॉन्फिगरेशन आणि प्रॉडक्शन डिप्लॉयमेंट धोरणांसाठी सविस्तर मार्गदर्शक
- **AI Workshop Lab**: AI अनुप्रयोगांना AZD-डिप्लॉयबल सोल्यूशन्समध्ये रूपांतरित करण्यासाठी 2-3 तासांचे हस्तगत वर्कशॉप
- **Production AI Best Practices**: AI वर्कलोडचे स्केलिंग, मॉनिटरिंग आणि सुरक्षिततेसाठी एंटरप्राइझ-तैयार नमुने
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, आणि AI डिप्लॉयमेंट समस्यांसाठी सर्वसमावेशक समस्या निवारण
- **AI Template Gallery**: जटिलता रेटिंगसह Microsoft Foundry टेम्पलेट्सची वैशिष्ट्यीकृत संग्रह
- **Workshop Materials**: हस्तगत लॅब्स आणि संदर्भ साहित्यासह पूर्ण वर्कशॉप रचना

#### Enhanced
- **README Structure**: AI-विकसक-केंद्रित README, Microsoft Foundry Discord कडून 45% समुदायाच्या आवडीचा डेटा वापरून
- **Learning Paths**: विद्यार्थ्यांसाठी आणि DevOps अभियंत्यांसाठी पारंपारिक मार्गांसोबत समर्पित AI विकसक प्रवास
- **Template Recommendations**: वैशिष्ट्यीकृत AI टेम्पलेट्स ज्यात azure-search-openai-demo, contoso-chat, आणि openai-chat-app-quickstart समाविष्ट आहेत
- **Community Integration**: AI-विशिष्ट चॅनेल्स आणि चर्चांसह Discord समुदाय समर्थन वाढवले

#### Security & Production Focus
- **Managed Identity Patterns**: AI-विशिष्ट प्रमाणीकरण आणि सुरक्षा कॉन्फिगरेशन्स
- **Cost Optimization**: AI वर्कलोडसाठी टोकन वापर ट्रॅकिंग आणि बजेट नियंत्रण
- **Multi-Region Deployment**: जागतिक AI अनुप्रयोग डिप्लॉयमेंटसाठी धोरणे
- **Performance Monitoring**: AI-विशिष्ट मेट्रिक्स आणि Application Insights एकत्रीकरण

#### Documentation Quality
- **Linear Course Structure**: सुरवातीपासून प्रगत AI डिप्लॉयमेंट नमुन्यांपर्यंत तार्किक प्रगती
- **Validated URLs**: सर्व बाह्य रिपॉझिटरी लिंक तपासलेल्या आणि प्रवेशयोग्य
- **Complete Reference**: सर्व अंतर्गत दस्तऐवजीकरण लिंक वैध आणि कार्यरत
- **Production Ready**: वास्तविक उदाहरणांसह एंटरप्राइझ डिप्लॉयमेंट नमुने

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**ही आवृत्ती रिपॉझिटरी संरचना आणि सामग्री सादरीकरणाचे महत्त्वपूर्ण पुनर्रचना दर्शवते.**

#### Added
- **Structured Learning Framework**: सर्व दस्तऐवज पृष्ठांमध्ये आता परिचय, शिकण्याचे उद्दिष्टे, आणि शिकण्याचे परिणाम विभाग समाविष्ट आहेत
- **Navigation System**: मार्गदर्शित शिकण्याच्या प्रगतीसाठी सर्व दस्तऐवजीकरणात Previous/Next lesson दुवे जोडले
- **Study Guide**: study-guide.md सह शिकण्याच्या उद्दिष्टे, सराव व्यायाम, आणि मूल्यांकन साहित्य असलेले सर्वसमावेशक मार्गदर्शक
- **Professional Presentation**: प्रवेशयोग्यता आणि व्यावसायिक देखाव्यासाठी सर्व इमोजी चिन्हे काढली
- **Enhanced Content Structure**: शिकण्याच्या साहित्याचे संघटन आणि प्रवाह सुधारले

#### Changed
- **Documentation Format**: सर्व दस्तऐवजीकरण एकसारख्या शिकण्याकेंद्रित संरचनेने प्रमाणित केले
- **Navigation Flow**: सर्व शिकण्याच्या साहित्यांमध्ये तार्किक प्रगती राबवली
- **Content Presentation**: स्पष्ट, व्यावसायिक स्वरूपासाठी अलंकारिक घटक काढले
- **Link Structure**: नवीन नेव्हिगेशन सिस्टमसाठी सर्व अंतर्गत दुवे अद्ययावत केले

#### Improved
- **Accessibility**: स्क्रीन रीडरसाठी सुसंगततेसाठी इमोजी अवलंबित्व काढले
- **Professional Appearance**: एंटरप्राइझ शिक्षणासाठी योग्य, स्वच्छ अकादमिक-शैलीचे सादरीकरण
- **Learning Experience**: प्रत्येक धड्यासाठी स्पष्ट उद्दिष्टे आणि परिणामांसह संरचित दृष्टिकोन
- **Content Organization**: संबंधित विषयांमधील चांगला तार्किक प्रवाह आणि कनेक्शन

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - पूर्ण 'getting-started' मार्गदर्शक मालिका
  - सर्वसमावेशक डिप्लॉयमेंट आणि प्राव्हिजनिंग दस्तऐवजीकरण
  - तपशीलवार समस्या निवारण संसाधने आणि डिबगिंग मार्गदर्शक
  - पूर्व-डिप्लॉयमेंट सत्यापन साधने आणि प्रक्रियाएं

- **Getting Started Module**
  - AZD मूलभूत: मुख्य संकल्पना आणि शब्दसंग्रह
  - इन्स्टॉलेशन मार्गदर्शक: प्लॅटफॉर्म-विशिष्ट सेटअप सूचनाएँ
  - कॉन्फिगरेशन मार्गदर्शक: वातावरण सेटअप आणि प्रमाणीकरण
  - प्रथम प्रोजेक्ट ट्यूटोरियल: चरण-दर-चरण हस्तगत शिक्षण

- **Deployment and Provisioning Module**
  - डिप्लॉयमेंट मार्गदर्शक: संपूर्ण वर्कफ्लो दस्तऐवजीकरण
  - प्राव्हिजनिंग मार्गदर्शक: Bicep सह Infrastructure as Code
  - प्रॉडक्शन डिप्लॉयमेंटसाठी सर्वोत्तम पद्धती
  - मल्टि-सर्व्हिस आर्किटेक्चर नमुने

- **Pre-deployment Validation Module**
  - क्षमता नियोजन: Azure संसाधन उपलब्धता सत्यापन
  - SKU निवड: सर्वसमावेशक सेवा टियर मार्गदर्शन
  - प्रि-फ्लाइट तपासण्या: ऑटोमेटेड सत्यापन स्क्रिप्ट्स (PowerShell आणि Bash)
  - किंमत अंदाज आणि बजेट नियोजन साधने

- **Troubleshooting Module**
  - सामान्य समस्या: वारंवार आढळणाऱ्या समस्या आणि उपाय
  - डिबगिंग मार्गदर्शक: प्रणालीबद्ध समस्या निवारण पद्धती
  - प्रगत डायग्नोस्टिक तंत्र आणि साधने
  - प्रदर्शन मॉनिटरिंग आणि अनुकूलन

- **Resources and References**
  - कमांड चीट शीट: आवश्यक कमांडसाठी जलद संदर्भ
  - शब्दकोश: सर्वसमावेशक शब्दसंग्रह आणि संक्षेपार्थ परिभाषा
  - FAQ: सामान्य प्रश्नांची तपशीलवार उत्तरे
  - बाह्य संसाधन दुवे आणि समुदाय कनेक्शन

- **Examples and Templates**
  - साधे वेब अनुप्रयोगाचे उदाहरण
  - स्टॅटिक वेबसाइट डिप्लॉयमेंट टेम्पलेट
  - कंटेनर अनुप्रयोग कॉन्फिगरेशन
  - डेटाबेस इंटिग्रेशन नमुने
  - मायक्रोसर्व्हिसेस आर्किटेक्चर उदाहरणे
  - सर्व्हरलेस फंक्शन अंमलबजावणी

#### Features
- **Multi-Platform Support**: Windows, macOS, आणि Linux साठी इन्स्टॉलेशन आणि कॉन्फिगरेशन मार्गदर्शक
- **Multiple Skill Levels**: विद्यार्थी ते व्यावसायिक विकसक या सर्वांसाठी डिझाइन केलेली सामग्री
- **Practical Focus**: हस्तगत उदाहरणे आणि वास्तविक जगातील परिस्थिती
- **Comprehensive Coverage**: मूलभूत संकल्पनांपासून प्रगत एंटरप्राइझ नमुन्यांपर्यंत
- **Security-First Approach**: संपूर्णपणे समाविष्ट सुरक्षा सर्वोत्तम पद्धती
- **Cost Optimization**: खर्च-कुशल डिप्लॉयमेंट्स आणि संसाधन व्यवस्थापनासाठी मार्गदर्शन

#### Documentation Quality
- **Detailed Code Examples**: व्यावहारिक, चाचणी केलेले कोड नमुने
- **Step-by-Step Instructions**: स्पष्ट, कृतीक्षम मार्गदर्शन
- **Comprehensive Error Handling**: सामान्य समस्यांसाठी समस्या निवारण
- **Best Practices Integration**: उद्योग मानके आणि शिफारसी
- **Version Compatibility**: नवीनतम Azure सेवा आणि azd वैशिष्ट्यांनुसार अद्ययावत

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, आणि कस्टम मॉडेल्ससाठी एकत्रीकरण नमुने
- **AI Agent Frameworks**: LangChain, Semantic Kernel, आणि AutoGen डिप्लॉयमेंटसाठी टेम्पलेट्स
- **Advanced RAG Patterns**: Azure AI Search पेक्षा पुढे जाणाऱ्या व्हेक्टर डेटाबेस पर्याय (Pinecone, Weaviate इ.)
- **AI Observability**: मॉडेल परफॉर्मन्स, टोकन वापर, आणि प्रतिसाद गुणवत्तेसाठी विस्तारित मॉनिटरिंग

#### Developer Experience
- **VS Code Extension**: एकत्रित AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot Integration**: AI-समर्थित AZD टेम्पलेट निर्मितीसाठी सहायक
- **Interactive Tutorials**: AI परिस्थितींसाठी स्वयंचलित सत्यापनासह हस्तगत कोडिंग व्यायाम
- **Video Content**: AI डिप्लॉयमेंटवर केंद्रित दृक-श्राव्य शिक्षणासाठी पूरक व्हिडीओ ट्युटोरियल्स

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI मॉडेल गव्हर्नन्स, अनुपालन, आणि ऑडिट ट्रेल्स
- **Multi-Tenant AI**: आयसोलेटेड AI सेवांसह एकाधिक ग्राहकांना सेवा देण्याचे नमुने
- **Edge AI Deployment**: Azure IoT Edge आणि कंटेनर इन्स्टन्सेससोबत एकत्रीकरण
- **Hybrid Cloud AI**: AI वर्कलोडसाठी मल्टि-क्लाउड आणि हायब्रिड डिप्लॉयमेंट नमुने

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning pipelines सह MLOps एकत्रीकरण
- **Advanced Security**: शून्य-ट्रस्ट नमुने, प्रायव्हेट एन्डपॉइंट्स, आणि प्रगत धमकी संरक्षण
- **Performance Optimization**: उच्च-थ्रूपुट AI अनुप्रयोगांसाठी प्रगत ट्यूनिंग आणि स्केलिंग धोरणे
- **Global Distribution**: AI अनुप्रयोगांसाठी कंटेंट वितरण आणि एज कॅशिंग नमुने

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: मोबाइल शिक्षणासाठी प्रतिसादक्षम डिझाइन
- **Offline Access**: डाउनलोड करण्यायोग्य दस्तऐवजीकरण पॅकेजेस
- **Enhanced IDE Integration**: AZD + AI वर्कफ्लो साठी VS Code एक्सटेन्शन
- **Community Dashboard**: रिअल-टाइम समुदाय मेट्रिक्स आणि योगदान ट्रॅकिंग

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
- नवीन वैशिष्ट्ये, दस्तऐवजीकरण विभाग, किंवा क्षमता
- नवीन उदाहरणे, टेम्पलेट्स, किंवा शिकण्याचे संसाधने
- अतिरिक्त साधने, स्क्रिप्ट्स, किंवा उपयुक्त प्रोग्राम्स

#### Changed
- अस्तित्वात असलेल्या कार्यक्षमतेत किंवा दस्तऐवजीकरणात बदल
- स्पष्टता किंवा अचूकता सुधारण्यासाठी अद्ययावत
- सामग्रीचे किंवा संघटनेचे पुनर्रचना

#### Deprecated
- हळूहळू हटवण्याच्या प्रक्रियेत असलेली वैशिष्ट्ये किंवा पद्धती
- काढून टाकण्यासाठी नियोजित दस्तऐवजीकरण विभाग
- ज्यांना चांगले पर्याय उपलब्ध आहेत अशा पद्धती

#### Removed
- आता संबधित नसलेली वैशिष्ट्ये, दस्तऐवजीकरण, किंवा उदाहरणे
- जुनाट माहिती किंवा निष्क्रिय पद्धती
- अधिकार न दिलेली किंवा एकत्र केलेली सामग्री

#### Fixed
- दस्तऐवजीकरण किंवा कोडमधील त्रुटी दुरुस्ती
- रिपोर्ट केलेल्या समस्या किंवा अपयशांचे निराकरण
- अचूकता किंवा कार्यक्षमतेत सुधारणा

#### Security
- सुरक्षा-संबंधित सुधारणा किंवा दुरुस्त्या
- सुरक्षा सर्वोत्तम पद्धतींचे अद्ययावत
- सुरक्षा असुरक्षितता निराकरण

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- वापरकर्त्याच्या कारवाईची गरज असलेले ब्रेकिंग बदल
- सामग्री किंवा संघटनेचा महत्त्वपूर्ण पुनर्रचना
- मूलभूत दृष्टिकोन किंवा पद्धती बदलणारे बदल

#### Minor Version (X.Y.0)
- नवीन वैशिष्ट्ये किंवा सामग्री जोडणे
- मागील सुसंगतता कायम ठेवणारी सुधारणा
- अतिरिक्त उदाहरणे, साधने, किंवा संसाधने

#### Patch Version (X.Y.Z)
- बग फिक्सेस आणि दुरुस्त्या
- विद्यमान सामग्रीसाठी लहान सुधारणा
- स्पष्टीकरणे आणि सूक्ष्म सुधारणा

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: समस्या नोंदवा किंवा सुधारणा सुचवा (AI-विशिष्ट समस्या स्वागत आहे)
- **Discord Discussions**: कल्पना शेयर करा आणि Microsoft Foundry समुदायासोबत संवाद करा
- **Pull Requests**: सामग्री मध्ये थेट सुधारणा योगदान द्या, विशेषतः AI टेम्पलेट्स आणि मार्गदर्शकांसाठी
- **Microsoft Foundry Discord**: AZD + AI चर्चांसाठी #Azure चॅनेल मध्ये सहभाग घ्या
- **Community Forums**: व्यापक Azure विकसक चर्चेत भाग घ्या

### Feedback Categories
- **AI Content Accuracy**: AI सेवा एकत्रीकरण आणि डिप्लॉयमेंट माहितीतील दुरूस्त्या
- **Learning Experience**: AI विकसक शिकण्याच्या प्रवाहात सुधारणा सुचवा
- **Missing AI Content**: अतिरिक्त AI टेम्पलेट्स, पॅटर्न्स, किंवा उदाहरणांची मागणी
- **Accessibility**: विविध शिक्षण गरजांसाठी सुधारणा
- **AI Tool Integration**: AI विकास वर्कफ्लो इंटिग्रेशनसाठी सुधारणा सुचवा
- **Production AI Patterns**: एंटरप्राइझ AI डिप्लॉयमेंट पॅटर्न्ससाठी विनंत्या

### Response Commitment
- **Issue Response**: नोंदवलेल्या समस्यांसाठी 48 तासांत प्रतिसाद
- **Feature Requests**: एका आठवड्यात मूल्यमापन
- **Community Contributions**: एक आठवड्याच्या आत पुनरावलोकन
- **Security Issues**: तातडीने प्राधान्य असून त्वरीत प्रतिसाद

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: सामग्रीची अचूकता आणि दुव्यांची पडताळणी
- **Quarterly Updates**: महत्त्वपूर्ण सामग्री भर घालणे आणि सुधारणा
- **Semi-Annual Reviews**: सर्वसमावेशक पुनर्रचना आणि सुधारणा
- **Annual Releases**: महत्त्वपूर्ण सुधारणा असलेल्या प्रमुख वर्जन अपडेट्स

### Monitoring and Quality Assurance
- **Automated Testing**: कोड उदाहरणे आणि दुव्यांचे नियमित सत्यापन
- **Community Feedback Integration**: वापरकर्त्यांच्या सूचना नियमितपणे समाविष्ट करणे
- **Technology Updates**: नवीनतम Azure सेवा आणि azd रिलीजेसशी सुसंगतता राखणे
- **Accessibility Audits**: समावेशक डिझाइन तत्वांसाठी नियमित पुनरावलोकन

## Version Support Policy
- **Latest Major Version**: नियमित अद्यतनांसह पूर्ण समर्थन
- **Previous Major Version**: सुरक्षा अद्यतने आणि गंभीर दुरुस्त्या 12 महिन्यांसाठी
- **Legacy Versions**: फक्त समुदायाचे समर्थन, कोणतीही अधिकृत अद्यतने नाहीत

### स्थानांतरण मार्गदर्शन
When major versions are released, we provide:
- **Migration Guides**: पायरी-दर-पायरी संक्रमणाच्या सूचना
- **Compatibility Notes**: तुटणाऱ्या बदलांबद्दल तपशील
- **Tool Support**: स्थानांतरणास मदत करणाऱ्या स्क्रिप्ट किंवा उपयुक्त साधने
- **Community Support**: स्थानांतरण प्रश्नांसाठी समर्पित मंच

---

**नेव्हिगेशन**
- **Previous Lesson**: [अभ्यास मार्गदर्शक](resources/study-guide.md)
- **Next Lesson**: परत जा [मुख्य README](README.md)

**अद्ययावत रहा**: या रेपॉझिटरीवर लक्ष ठेवा जेणेकरून नवीन प्रकाशने आणि शिकण्याच्या सामग्रीतील महत्त्वाच्या अद्यतनांविषयी सूचना मिळतील.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरीही कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत प्राधिकृत स्रोत मानला पाहिजे. महत्वाच्या माहितीकरिता व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतींची किंवा चुकीच्या अर्थ लावण्याची आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 3. टेम्पलेटचे विघटन करा

!!! tip "या मॉड्यूलच्या शेवटी आपण हे करू शकाल"

    - [ ] Azure सहाय्यासाठी MCP सर्व्हरांसह GitHub Copilot सक्रिय करा
    - [ ] AZD टेम्पलेट फोल्डर संरचना आणि घटक समजून घ्या
    - [ ] इन्फ्रास्ट्रक्चर-एज़-कोड (Bicep) संस्था पॅटर्न शोधा
    - [ ] **Lab 3:** GitHub Copilot वापरून रेपॉझिटरी आर्किटेक्चर शोधा आणि समजून घ्या 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**परंतु आता, आपल्याला प्रोजेक्ट संरचना आणि कोडबेस समजून घ्यावी लागेल - आणि AZD टेम्पलेट सानुकूल करण्यास सक्षम असणे आवश्यक आहे - AZD बद्दल कोणतीही पूर्वअनुभव किंवा समज न ठेवता!**

---

## 1. GitHub Copilot सक्रिय करा

### 1.1 GitHub Copilot Chat इन्स्टॉल करा

It's time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, and it is often already available in Codespaces or dev container environments. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat तयार आहे**.

### 1.2. MCP सर्व्हर इन्स्टॉल करा

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

To activate these:

1. `.vscode/mcp.json` नावाची फाईल तयार करा जर ती अस्तित्वात नसेल तर
1. खालील कंटेंट त्या फाईलमध्ये कॉपी करा - आणि सर्व्हर सुरू करा!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "आपल्याला `npx` इन्स्टॉल नाही असा त्रुटी संदेश मिळू शकतो (दुरुस्ती साठी विस्तार करण्यासाठी क्लिक करा)"

      या त्रुटीचे निराकरण करण्यासाठी, `.devcontainer/devcontainer.json` फाईल उघडा आणि features विभागात खालील ओळ जोडा. नंतर कंटेनर पुन्हा तयार करा. आता आपल्याकडे `npx` इन्स्टॉल केलेले असावे.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat चाचणी करा

**प्रथम `azd auth login` वापरून VS Code कमांड लाइनमधून Azure सह प्रमाणीकरण करा. Azure CLI कमांड्स थेट चालवायच्या असल्यास फक्त `az login` देखील वापरा.**

आपण आता आपल्या Azure सदस्यत्व स्थितीची चौकशी करण्यास आणि तैनात केलेल्या संसाधनांबद्दल प्रश्न विचारण्यास सक्षम असाल. या प्रॉम्प्ट्स प्रयत्न करा:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

आपण Microsoft Docs MCP सर्व्हरवर आधारित Azure दस्तऐवजीकरणाबद्दल प्रश्नही विचारू शकता आणि त्याची निगडीत उत्तरे मिळवू शकता. या प्रॉम्प्ट्स प्रयत्न करा:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

किंवा आपण एखादे कार्य पूर्ण करण्यासाठी कोड स्निपेट देखील विचारू शकता. हा प्रॉम्प्ट प्रयत्न करा.

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` मोडमध्ये, हे आपल्याला कोड प्रदान करेल ज्याला आपण कॉपी-पेस्ट करून चालवू शकता. `Agent` मोडमध्ये, हे एक पाऊल पुढे जाऊन संबंधित संसाधने तयार करू शकते - सेटअप स्क्रिप्ट आणि दस्तऐवजीकरण समाविष्ट करून - जेणेकरून आपण ते कार्य पूर्ण करू शकता.

**आपण आता टेम्पलेट रेपॉझिटरी शोधण्यास सज्ज आहात**

---

## 2. आर्किटेक्चरचे विघटन

??? prompt "विचारा: docs/images/architecture.png मध्ये अनुप्रयोग आर्किटेक्चर एक परिच्छेदात स्पष्ट करा"

      हा अनुप्रयोग Azure वर आधारित AI-शक्तीने चालणारा चॅट अनुप्रयोग आहे जो आधुनिक एजंट-आधारित आर्किटेक्चर दर्शवितो. सोल्यूशनची केंद्रबिंदू म्हणजे Azure Container App जे मुख्य अनुप्रयोग कोड होस्ट करते, जो वापरकर्त्याचे इनपुट प्रक्रिया करते आणि AI एजंटद्वारे बुद्धिमान प्रतिसाद निर्माण करतो.
      
      आर्किटेक्चर Microsoft Foundry Project ला AI क्षमतांसाठी पाया म्हणून वापरते, आणि Azure AI Services शी कनेक्ट करते जे अंतर्गत भाषा मॉडेल्स (उदा. gpt-4.1-mini) आणि एजंट कार्यक्षमता प्रदान करतात. वापरकर्त्याचे संवाद React-आधारित फ्रंटएंडद्वारे FastAPI बॅकएंडकडे जातात जे AI एजंट सेवेशी संवाद साधून संदर्भात्मक प्रतिसाद तयार करते.
      
      प्रणालीमध्ये फाइल शोध किंवा Azure AI Search सेवा द्वारे ज्ञान पुनर्प्राप्ती क्षमता समाविष्ट आहे, ज्यामुळे एजंट अपलोड केलेल्या दस्तऐवजांमधून माहिती प्राप्त करून संदर्भ देऊ शकतो. ऑपरेशनल उत्कृष्टतेसाठी, आर्किटेक्चर ट्रेसिंग, लॉगिंग आणि कार्यक्षमता ऑप्टिमायझेशनसाठी Application Insights आणि Log Analytics Workspace द्वारे व्यापक मॉनिटरिंग समाविष्ट करते.
      
      Azure Storage अनुप्रयोग डेटा आणि फाइल अपलोडसाठी blob संग्रहण प्रदान करते, तर Managed Identity Azure संसाधनांमध्ये सुरक्षित प्रवेश सुनिश्चित करते ज्यात क्रेडेन्शियल साठवण्याची गरज नाही. संपूर्ण सोल्यूशन स्केलेबिलिटी आणि देखभालयोग्यतेसाठी डिझाइन केलेले आहे, कंटेनराइज्ड अनुप्रयोग मागणीनुसार आपोआप स्केल होतो आणि Azure च्या व्यवस्थापित सेवांच्या माध्यमातून अंतर्भूत सुरक्षा, मॉनिटरिंग आणि CI/CD क्षमताही प्रदान करतो.

![आर्किटेक्चर](../../../../../translated_images/mr/architecture.48d94861e6e6cdc0.webp)

---

## 3. रेपॉझिटरी रचना

!!! prompt "विचारा: टेम्पलेट फोल्डर रचना स्पष्ट करा. दृश्य अनुक्रमिक डायग्रामपासून सुरू करा."

??? info "उत्तर: दृश्य अनुक्रमिक डायग्राम"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 कॉन्फिगरेशन आणि सेटअप
      │   ├── azure.yaml                    # Azure Developer CLI कॉन्फिगरेशन
      │   ├── docker-compose.yaml           # स्थानिक विकास कंटेनर
      │   ├── pyproject.toml                # Python प्रोजेक्ट कॉन्फिगरेशन
      │   ├── requirements-dev.txt          # विकास अवलंबन
      │   └── .devcontainer/                # VS Code dev container सेटअप
      │
      ├── 🏗️ इन्फ्रास्ट्रक्चर (infra/)
      │   ├── main.bicep                    # मुख्य इन्फ्रास्ट्रक्चर टेम्पलेट
      │   ├── api.bicep                     # API-विशिष्ट रिसोर्सेस
      │   ├── main.parameters.json          # इन्फ्रास्ट्रक्चर पॅरामीटर्स
      │   └── core/                         # मॉड्यूलर इन्फ्रास्ट्रक्चर घटक
      │       ├── ai/                       # AI सेवा कॉन्फिगरेशन्स
      │       ├── host/                     # होस्टिंग इन्फ्रास्ट्रक्चर
      │       ├── monitor/                  # मॉनिटरिंग आणि लॉगिंग
      │       ├── search/                   # Azure AI Search सेटअप
      │       ├── security/                 # सुरक्षा आणि ओळख
      │       └── storage/                  # स्टोरेज अकाउंट कॉन्फिग्स
      │
      ├── 💻 अ‍ॅप्लिकेशन स्रोत (src/)
      │   ├── api/                          # बॅकएंड API
      │   │   ├── main.py                   # FastAPI अनुप्रयोग एन्ट्री
      │   │   ├── routes.py                 # API मार्ग परिभाषा
      │   │   ├── search_index_manager.py   # सर्च कार्यक्षमता
      │   │   ├── data/                     # API डेटा हँडलिंग
      │   │   ├── static/                   # स्थिर वेब साधने
      │   │   └── templates/                # HTML टेम्पलेट्स
      │   ├── frontend/                     # React/TypeScript फ्रंटएंड
      │   │   ├── package.json              # Node.js अवलंबन
      │   │   ├── vite.config.ts            # Vite बिल्ड कॉन्फिगरेशन
      │   │   └── src/                      # फ्रंटएंड स्रोत कोड
      │   ├── data/                         # नमुना डेटा फाईल्स
      │   │   └── embeddings.csv            # पूर्व-गणना केलेल्या एम्बेडिंग्स
      │   ├── files/                        # ज्ञान आधार फाईल्स
      │   │   ├── customer_info_*.json      # ग्राहक डेटा नमुने
      │   │   └── product_info_*.md         # उत्पादन दस्तऐवजीकरण
      │   ├── Dockerfile                    # कंटेनर कॉन्फिगरेशन
      │   └── requirements.txt              # Python अवलंबता
      │
      ├── 🔧 ऑटोमेशन आणि स्क्रिप्ट्स (scripts/)
      │   ├── postdeploy.sh/.ps1           # पोस्ट-डिप्लॉयमेंट सेटअप
      │   ├── setup_credential.sh/.ps1     # क्रेडेन्शियल कॉन्फिगरेशन
      │   ├── validate_env_vars.sh/.ps1    # पर्यावरण वैरिएबल तपासणी
      │   └── resolve_model_quota.sh/.ps1  # मॉडेल कोटा व्यवस्थापन
      │
      ├── 🧪 चाचणी आणि मूल्यांकन
      │   ├── tests/                        # युनिट आणि इंटीग्रेशन टेस्ट्स
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # एजंट मूल्यांकन फ्रेमवर्क
      │   │   ├── evaluate.py               # मूल्यांकन रनर
      │   │   ├── eval-queries.json         # चाचणी क्वेरीज
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # विकास प्लेग्राउंड
      │   │   ├── 1-quickstart.py           # सुरू करण्यासाठी उदाहरणे
      │   │   └── aad-interactive-chat.py   # प्रमाणीकरण उदाहरणे
      │   └── airedteaming/                 # AI सुरक्षा मूल्यांकन
      │       └── ai_redteaming.py          # रेड टीम चाचणी
      │
      ├── 📚 दस्तऐवजीकरण (docs/)
      │   ├── deployment.md                 # डिप्लॉयमेंट मार्गदर्शक
      │   ├── local_development.md          # स्थानिक सेटअप सूचना
      │   ├── troubleshooting.md            # सामान्य समस्या आणि दुरुस्त्या
      │   ├── azure_account_setup.md        # Azure पूर्वअटी
      │   └── images/                       # दस्तऐवजीकरण साधने
      │
      └── 📄 प्रोजेक्ट मेटाडेटा
         ├── README.md                     # प्रोजेक्ट ओव्हरव्यू
         ├── CODE_OF_CONDUCT.md           # समुदाय मार्गदर्शक
         ├── CONTRIBUTING.md              # योगदान मार्गदर्शक
         ├── LICENSE                      # परवाना अटी
         └── next-steps.md                # पोस्ट-डिप्लॉयमेंट मार्गदर्शन
      ```

### 3.1. मुख्य अ‍ॅप आर्किटेक्चर

This template follows a **full-stack web application** pattern with:

- **बॅकएंड**: Python FastAPI सह Azure AI समाकलन
- **फ्रंटएंड**: TypeScript/React आणि Vite बिल्ड सिस्टम
- **इन्फ्रास्ट्रक्चर**: क्लाउड रिसोर्सेससाठी Azure Bicep टेम्पलेट्स
- **कंटेनरीकरण**: सुसंगत डिप्लॉयमेंटसाठी Docker

### 3.2 इन्फ्रास्ट्रक्चर अ‍ॅस कोड (bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: सर्व Azure रिसोर्सेसचे समन्वय करतो
   - **`core/` modules**: विविध सेवांसाठी पुनर्वापरयोग्य घटक
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 अनुप्रयोग स्रोत (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-आधारित REST API
- Foundry Agents समाकलन
- ज्ञान पुनर्प्राप्तीसाठी सर्च इंडेक्स व्यवस्थापन
- फाइल अपलोड आणि प्रक्रियेसाठी क्षमता

**Frontend (`src/frontend/`)**:

- आधुनिक React/TypeScript SPA
- जलद विकास आणि ऑप्टिमाइज़ड बिल्डसाठी Vite
- एजंट संवादांसाठी चॅट इंटरफेस

**Knowledge Base (`src/files/`)**:

- नमुना ग्राहक आणि उत्पादन डेटा
- फाइल-आधारित ज्ञान पुनर्प्राप्तीचे प्रदर्शन
- JSON आणि Markdown स्वरूपातील उदाहरणे


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- क्रॉस-प्लॅटफॉर्म PowerShell आणि Bash स्क्रिप्ट्स
- पर्यावरण तपासणी आणि सेटअप
- पोस्ट-डिप्लॉयमेंट कॉन्फिगरेशन
- मॉडेल कोटा व्यवस्थापन

**Azure Developer CLI Integration**:

- `azure.yaml` कॉन्फिगरेशन `azd` वर्कफ्लो साठी
- स्वयंचलित प्रोव्हिजनिंग आणि डिप्लॉयमेंट
- पर्यावरण बदल व्यवस्थापन

### 3.5 चाचणी आणि गुणवत्ता आश्वासन

**Evaluation Framework (`evals/`)**:

- एजंट कार्यक्षमता मूल्यांकन
- क्वेरी-प्रतिसाद गुणवत्ता चाचणी
- स्वयंचलित मूल्यांकन पाइपलाईन

**AI Safety (`airedteaming/`)**:

- AI सुरक्षा साठी रेड टीम चाचणी
- सुरक्षा अशुभ शोधणं
- जबाबदार AI पद्धती

---

## 4. अभिनंदन 🏆

You successfully used GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] GitHub Copilot Azure साठी सक्रिय केले
- [X] अनुप्रयोग आर्किटेक्चर समजले
- [X] AZD टेम्पलेट संरचना एक्सप्लोर केली

हे आपल्याला या टेम्पलेटसाठीचे _infrastructure as code_ साधनांचे आकलन देते. पुढे, आपण AZD साठी कॉन्फिगरेशन फाईल पाहू.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हे दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केले गेले आहे. जरी आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. अत्यावश्यक माहितीसाठी, व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजांबद्दल किंवा चुकीच्या अर्थनिर्वचनांबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
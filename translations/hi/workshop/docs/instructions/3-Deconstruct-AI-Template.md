# 3. टेम्पलेट को विखंडित करें

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] GitHub Copilot को Azure सहायता के लिए MCP सर्वरों के साथ सक्रिय करें
    - [ ] AZD टेम्पलेट फ़ोल्डर संरचना और घटकों को समझें
    - [ ] इन्फ्रास्ट्रक्चर-एज़-कोड (Bicep) संगठन पैटर्न का अन्वेषण करें
    - [ ] **Lab 3:** GitHub Copilot का उपयोग कर रिपॉजिटरी आर्किटेक्चर का अन्वेषण और समझना

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**लेकिन अब, हमें प्रोजेक्ट संरचना और कोडबेस को समझने की आवश्यकता है - और AZD टेम्पलेट को किसी भी पूर्व अनुभव या AZD की समझ के बिना कस्टमाइज़ करने में सक्षम होना चाहिए!**

---

## 1. GitHub Copilot सक्रिय करें

### 1.1 GitHub Copilot Chat इंस्टॉल करें

It's time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

एक्सटेंशन मार्केटप्लेस से इंस्टॉल किया जा सकता है, लेकिन यह आपके Codespaces पर्यावरण में पहले से उपलब्ध होना चाहिए। _Copilot आइकन ड्रॉप-डाउन से `Open Chat` पर क्लिक करें - और `What can you do?` जैसे प्रॉम्प्ट टाइप करें_ - आपसे लॉग इन करने के लिए कहा जा सकता है। **GitHub Copilot Chat तैयार है**।

### 1.2. MCP सर्वर्स इंस्टॉल करें

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP सर्वर](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP सर्वर](../../../../../workshop/docs/instructions)

To activate these:

1. यदि मौजूद नहीं है तो `.vscode/mcp.json` नामक फ़ाइल बनाएं
1. नीचे दिए गए को उस फ़ाइल में कॉपी करें - और सर्वरों को शुरू करें!
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

??? warning "You may get an error that `npx` is not installed (click to expand for fix)"

      To fix,this open the `.devcontainer/devcontainer.json` file and add this line to the features section. Then rebuild the container. You should now have `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat का परीक्षण करें

**सबसे पहले `az login` का उपयोग करके VS Code कमांड लाइन से Azure के साथ प्रमाणीकरण करें।**

अब आप अपने Azure सब्सक्रिप्शन की स्थिति पूछताछ कर सकेंगे, और तैनात संसाधनों या कॉन्फ़िगरेशन के बारे में प्रश्न पूछ सकेंगे। इन प्रॉम्प्ट्स को आज़माएं:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

आप Azure डॉ큐मेंटेशन के बारे में प्रश्न भी पूछ सकते हैं और Microsoft Docs MCP सर्वर में आधारित उत्तर प्राप्त कर सकते हैं। इन प्रॉम्प्ट्स को आज़माएं:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

या आप किसी कार्य को पूरा करने के लिए कोड स्निपेट्स भी मांग सकते हैं। इस प्रॉम्प्ट को आज़माएं।

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` मोड में, यह ऐसा कोड प्रदान करेगा जिसे आप कॉपी-पेस्ट करके आज़मा सकते हैं। `Agent` मोड में, यह एक कदम आगे जाकर आपके लिए संबंधित संसाधनों को बना भी सकता है - जिसमें सेटअप स्क्रिप्ट और डॉ큐मेंटेशन शामिल हैं - ताकि आप उस कार्य का निष्पादन कर सकें।

**अब आप टेम्पलेट रिपॉजिटरी का अन्वेषण शुरू करने के लिए सुसज्जित हैं**

---

## 2. आर्किटेक्चर को विखंडित करें

??? prompt "ASK: Explain the application architecture in docs/images/architecture.png in 1 paragraph"

      यह एप्लिकेशन Azure पर निर्मित एक AI-संचालित चैट एप्लिकेशन है जो आधुनिक एजेंट-आधारित आर्किटेक्चर का प्रदर्शन करता है। समाधान का केंद्र एक Azure Container App है जो मुख्य अनुप्रयोग कोड की मेजबानी करता है, जो उपयोगकर्ता इनपुट को संसाधित करता है और एक AI एजेंट के माध्यम से बुद्धिमान प्रतिक्रियाएँ उत्पन्न करता है। 
      
      आर्किटेक्चर AI क्षमताओं के लिए Microsoft Foundry Project को आधार के रूप में उपयोग करता है, और Azure AI Services से जुड़ता है जो मौलिक भाषा मॉडलों (जैसे gpt-4.1-mini) और एजेंट कार्यक्षमता की आपूर्ति करते हैं। उपयोगकर्ता इंटरैक्शन React-आधारित फ्रंटएंड से FastAPI बैकएंड की ओर प्रवाहित होते हैं, जो प्रासंगिक प्रतिक्रियाएँ生成 करने के लिए AI एजेंट सेवा के साथ संचार करता है। 
      
      प्रणाली फ़ाइल खोज या Azure AI Search सेवा के माध्यम से ज्ञान पुनःप्राप्ति क्षमताओं को शामिल करती है, जिससे एजेंट अपलोड की गई दस्तावेज़ों से जानकारी तक पहुँच और उद्धरण कर सकता है। संचालन उत्कृष्टता के लिए, आर्किटेक्चर में ट्रेसिंग, लॉगिंग और प्रदर्शन अनुकूलन के लिए Application Insights और Log Analytics Workspace के माध्यम से व्यापक मॉनिटरिंग शामिल है। 
      
      Azure Storage एप्लिकेशन डेटा और फ़ाइल अपलोड के लिए ब्लॉब स्टोरेज प्रदान करता है, जबकि Managed Identity Azure संसाधनों के बीच सुरक्षित पहुँच सुनिश्चित करता है बिना क्रेडेंशियल स्टोर किए। पूरा समाधान स्केलेबिलिटी और अनुरक्षण के लिए डिज़ाइन किया गया है, जिसमें कंटेनरीकृत अनुप्रयोग मांग के आधार पर स्वचालित रूप से स्केल करता है और Azure के प्रबंधित सेवाओं के पारिस्थितिकी तंत्र के माध्यम से अंतर्निहित सुरक्षा, मॉनिटरिंग और CI/CD क्षमताएँ प्रदान करता है।

![आर्किटेक्चर](../../../../../translated_images/hi/architecture.48d94861e6e6cdc0.webp)

---

## 3. रिपॉजिटरी संरचना

!!! prompt "ASK: Explain the template folder structure. Start with a visual hierarchical diagram."

??? info "ANSWER: Visual Hierarchical Diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. मुख्य ऐप आर्किटेक्चर

यह टेम्पलेट निम्नलिखित के साथ एक **फुल-स्टैक वेब एप्लिकेशन** पैटर्न का पालन करता है:

- **Backend**: Azure AI इंटीग्रेशन के साथ Python FastAPI
- **Frontend**: Vite बिल्ड सिस्टम के साथ TypeScript/React
- **Infrastructure**: क्लाउड संसाधनों के लिए Azure Bicep टेम्पलेट्स
- **Containerization**: स्थिर तैनाती के लिए Docker

### 3.2 इन्फ्रा ऐज़ कोड (bicep)

इन्फ्रास्ट्रक्चर लेयर **Azure Bicep** टेम्पलेट्स का उपयोग करती है जो मॉड्यूलर तरीके से व्यवस्थित हैं:

   - **`main.bicep`**: सभी Azure संसाधनों का समन्वय करता है
   - **`core/` modules**: विभिन्न सेवाओं के लिए पुन: प्रयोज्य घटक
      - AI सेवाएँ (Microsoft Foundry Models, AI Search)
      - कंटेनर होस्टिंग (Azure Container Apps)
      - मॉनिटरिंग (Application Insights, Log Analytics)
      - सुरक्षा (Key Vault, Managed Identity)

### 3.3 एप्लिकेशन स्रोत (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-आधारित REST API
- Foundry Agents इंटीग्रेशन
- ज्ञान पुनःप्राप्ति के लिए सर्च इंडेक्स प्रबंधन
- फ़ाइल अपलोड और प्रोसेसिंग क्षमताएँ

**Frontend (`src/frontend/`)**:

- आधुनिक React/TypeScript SPA
- तेज़ विकास और अनुकूलित बिल्ड्स के लिए Vite
- एजेंट इंटरैक्शन के लिए चैट इंटरफ़ेस

**Knowledge Base (`src/files/`)**:

- नमूना ग्राहक और उत्पाद डेटा
- फ़ाइल-आधारित ज्ञान पुनःप्राप्ति का प्रदर्शन करता है
- JSON और Markdown फ़ॉर्मैट उदाहरण


### 3.4 DevOps और ऑटोमेशन

**Scripts (`scripts/`)**:

- क्रॉस-प्लेटफ़ॉर्म PowerShell और Bash स्क्रिप्ट्स
- एनवायरनमेंट सत्यापन और सेटअप
- पोस्ट-डिप्लॉयमेंट कॉन्फ़िगरेशन
- मॉडल कोटा प्रबंधन

**Azure Developer CLI Integration**:

- `azure.yaml` `azd` वर्कफ़्लो के लिए कॉन्फ़िगरेशन
- स्वचालित प्रोविजनिंग और तैनाती
- वातावरण चर प्रबंधन

### 3.5 परीक्षण और गुणवत्ता आश्वासन

**Evaluation Framework (`evals/`)**:

- एजेंट प्रदर्शन का मूल्यांकन
- क्वेरी-प्रतिक्रिया गुणवत्ता परीक्षण
- स्वचालित आकलन पाइपलाइन

**AI Safety (`airedteaming/`)**:

- AI सुरक्षा के लिए रेड टीम परीक्षण
- सुरक्षा भेद्यता स्कैनिंग
- जिम्मेदार AI प्रथाएँ

---

## 4. बधाई हो 🏆

आपने सफलतापूर्वक GitHub Copilot Chat को MCP सर्वरों के साथ उपयोग करके रिपॉजिटरी का अन्वेषण किया।

- [X] Azure के लिए GitHub Copilot सक्रिय किया गया
- [X] एप्लिकेशन आर्किटेक्चर को समझा
- [X] AZD टेम्पलेट संरचना का अन्वेषण किया

यह आपको इस टेम्पलेट के _infrastructure as code_ संपत्तियों का एक एहसास देता है। अगला, हम AZD के लिए कॉन्फ़िगरेशन फ़ाइल को देखेंगे।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम शुद्धता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ उसकी मूल भाषा में अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
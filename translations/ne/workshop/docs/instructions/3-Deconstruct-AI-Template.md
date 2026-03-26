# 3. टेम्पलेटलाई विघटन गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्म तपाईं सक्षम हुनुहुनेछ"

    - [ ] GitHub Copilot लाई Azure सहयोगका लागि MCP सर्भरहरूसँग सक्रिय गर्नुहोस्
    - [ ] AZD टेम्पलेटको फोल्डर संरचना र कम्पोनेन्टहरू बुझ्नुहोस्
    - [ ] इन्फ्रास्ट्रक्चर-एज-कोड (Bicep) संगठन पद्धतिहरू अन्वेषण गर्नुहोस्
    - [ ] **Lab 3:** GitHub Copilot प्रयोग गरी रिपोजिटरी आर्किटेक्चर अन्वेषण र बुझ्नुहोस्

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**तर अब, हामीले परियोजना संरचना र कोडबेस बुझ्न आवश्यक छ - र AZD टेम्पलेटलाई अनुकूलन गर्न सक्षम हुनुपर्छ - कुनै पूर्व अनुभव वा AZD को बुझाइ बिना!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

It's time to explore [Agent Mode सहित GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free योजना](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, but should already be available in your Codespaces environment. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat तयार छ**.

### 1.2. Install MCP Servers

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP सर्भर](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP सर्भर](../../../../../workshop/docs/instructions)

To activate these:

1. Create a file called `.vscode/mcp.json` if it does not exist
1. Copy the following into that file - and start the servers!
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

??? warning "तपाईंलाई `npx` इन्स्टल गरिएको छैन भन्ने त्रुटि आउन सक्छ (समाधानका लागि विस्तार गर्न क्लिक गर्नुहोस्)"

      To fix,this open the `.devcontainer/devcontainer.json` file and add this line to the features section. Then rebuild the container. You should now have `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**पहिले VS Code कमान्ड लाइनबाट Azure मा प्रमाणित गर्न `az login` प्रयोग गर्नुहोस्।**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**तपाईं अब टेम्पलेट रिपोजिटरी अन्वेषण सुरु गर्न तयार हुनुहुन्छ**

---

## 2. वास्तुकला विघटन गर्नुहोस्

??? prompt "ASK: docs/images/architecture.png मा अनुप्रयोगको वास्तुकला 1 अनुच्छेदमा व्याख्या गर्नुहोस्"

      यो अनुप्रयोग Azure मा बनाइएको AI-समर्थित च्याट अनुप्रयोग हो जसले आधुनिक एजेन्ट-आधारित वास्तुकलाको प्रदर्शन गर्दछ। समाधानको केन्द्रमा मुख्य अनुप्रयोग कोड होस्ट गर्ने Azure Container App हुन्छ, जुन प्रयोगकर्ताको इनपुट प्रक्रियाकरण गर्छ र AI एजेन्ट मार्फत बौद्धिक उत्तरहरू उत्पन्न गर्छ।
      
      वास्तुकलाले AI क्षमताहरूको आधारको रूपमा Microsoft Foundry Project लाई प्रयोग गर्छ र Azure AI Services सँग जडान हुन्छ जसले आधारभूत भाषा मोडेलहरू (जस्तै gpt-4.1-mini) र एजेन्ट कार्यक्षमता प्रदान गर्छ। प्रयोगकर्ताको अन्तरक्रियाहरू React-आधारित फ्रन्टएन्डबाट FastAPI ब्याकएन्डमा बग्छन्, जसले सन्दर्भगत उत्तरहरू उत्पन्न गर्न AI एजेन्ट सेवासँग संवाद गर्छ।
      
      प्रणालीले फाइल सर्च वा Azure AI Search सेवा मार्फत ज्ञान पुन:प्राप्ति क्षमताहरू समावेश गर्छ, जसले एजेन्टलाई अपलोड गरिएको कागजातहरूबाट जानकारी पहुँच र उद्धरण गर्न अनुमति दिन्छ। अपरेशनल उत्कृष्टताका लागि, वास्तुकलामा Application Insights र Log Analytics Workspace मार्फत व्यापक निगरानी समावेश छ ट्रेसिङ, लगिङ, र प्रदर्शन अनुकूलनको लागि।
      
      Azure Storage अनुप्रयोग डेटा र फाइल अपलोडका लागि ब्लब स्टोरेज प्रदान गर्छ, जबकि Managed Identity ले क्रेडेन्सियलहरू भण्डार नगरी Azure स्रोतहरूबीच सुरक्षित पहुँच सुनिश्चित गर्दछ। समग्र समाधान स्केलेबिलिटी र मैनटेनेबिलिटीका लागि डिजाइन गरिएको छ, जहाँ कन्टेनराइज्ड अनुप्रयोगले माग अनुसार स्वचालित रूपमा स्केल गर्छ र Azure को व्यवस्थापित सेवाहरू मार्फत बिल्ट-इन सुरक्षा, निगरानी, र CI/CD क्षमताहरू प्रदान गर्दछ।

![वास्तुकला](../../../../../translated_images/ne/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "ASK: टेम्पलेट फोल्डर संरचना व्याख्या गर्नुहोस्। दृश्यात्मक पदानुक्रमिक रेखाचित्रबाट सुरु गर्नुहोस्।"

??? info "ANSWER: दृश्यात्मक पदानुक्रमिक रेखाचित्र"

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

### 3.1. मुख्य एप्लिकेसन वास्तुकला

यो टेम्पलेटले **फुल-स्ट्याक वेब अनुप्रयोग** ढाँचालाई अनुसरण गर्दछ, जसमा:

- **Backend**: Python FastAPI र Azure AI एकीकरण
- **Frontend**: TypeScript/React र Vite बिल्ड सिस्टम
- **Infrastructure**: क्लाउड स्रोतहरूको लागि Azure Bicep टेम्पलेटहरू
- **Containerization**: निरन्तर डिप्लोयमेन्टका लागि Docker

### 3.2 इन्फ्रा एज़ कोड (Bicep)

इन्फ्रास्ट्रक्चर तहले मोड्युलर रूपमा व्यवस्थित **Azure Bicep** टेम्पलेटहरू प्रयोग गर्दछ:

   - **`main.bicep`**: सबै Azure स्रोतहरू समन्वय गर्छ
   - **`core/` modules**: विभिन्न सेवाहरूका लागि पुन:प्रयोगयोग्य कम्पोनेन्टहरू
      - AI सेवाहरू (Microsoft Foundry Models, AI Search)
      - कन्टेनर होस्टिङ (Azure Container Apps)
      - निगरानी (Application Insights, Log Analytics)
      - सुरक्षा (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-आधारित REST API
- Foundry Agents एकीकरण
- ज्ञान पुन:प्राप्तिका लागि Search index व्यवस्थापन
- फाइल अपलोड र प्रक्रिया गर्ने क्षमताहरू

**Frontend (`src/frontend/`)**:

- आधुनिक React/TypeScript SPA
- तीव्र विकास र अनुकूलन गरिएका बिल्डहरूको लागि Vite
- एजेन्ट अन्तरक्रियाका लागि च्याट इन्टरफेस

**Knowledge Base (`src/files/`)**:

- नमूना ग्राहक र उत्पादन डेटा
- फाइल-आधारित ज्ञान पुन:प्राप्ति प्रदर्शन गर्दछ
- JSON र Markdown ढाँचाका उदाहरणहरू


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- क्रस-प्लेटफर्म PowerShell र Bash स्क्रिप्टहरू
- वातावरण मान्यकरण र सेटअप
- पोस्ट-डिप्लोयमेन्ट कन्फिगरेसन
- मोडेल कोटा व्यवस्थापन

**Azure Developer CLI Integration**:

- `azure.yaml` विन्यास `azd` वर्कफ्लोहरूको लागि
- स्वचालित प्रोविजनिङ र डिप्लोयमेन्ट
- वातावरण भेरिएबल व्यवस्थापन

### 3.5 परीक्षण र गुणस्तर आश्वासन

**Evaluation Framework (`evals/`)**:

- एजेन्ट प्रदर्शन मूल्याङ्कन
- क्वेरी-उत्तर गुणस्तर परीक्षण
- स्वचालित मूल्याङ्कन पाइपलाइन

**AI Safety (`airedteaming/`)**:

- AI सुरक्षा लागि रेड टोली परीक्षण
- सुरक्षा कमजोरी स्क्यानिङ
- जिम्मेवार AI अभ्यासहरू

---

## 4. बधाई छ 🏆

तपाईंले सफलतापूर्वक GitHub Copilot Chat लाई MCP सर्भरहरूसँग प्रयोग गरेर रिपोजिटरी अन्वेषण गर्नुभयो।

- [X] GitHub Copilot लाई Azure का लागि सक्रिय गरियो
- [X] एप्लिकेसन वास्तुकला बुझियो
- [X] AZD टेम्पलेट संरचना अन्वेषण गरियो

यसले तपाईंलाई यस टेम्पलेटका लागि _infrastructure as code_ एसेटहरूको अनुभूति दिन्छ। अब, हामी AZD को कन्फिगरेसन फाइल हेर्नेछौं।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयत्न गर्छौं, तथापि कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा नै अधिकारिक स्रोत मान्नुपर्छ। महत्त्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलतफहमी वा भ्रामक व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
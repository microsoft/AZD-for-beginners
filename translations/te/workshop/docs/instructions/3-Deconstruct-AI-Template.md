# 3. టెంప్లేట్‌ను విచ్ఛేదించండి

!!! tip "ఈ మాడ్యూల్ ముగిసే వరకు మీరు చేయగలుగుతారు"

    - [ ] Azure సాయానికి MCP సర్వర్లతో GitHub Copilotను సక్రియం చేయండి
    - [ ] AZD టెంప్లేట్ ఫోల్డర్ నిర్మాణం మరియు భాగాలను అర్థం చేసుకోండి
    - [ ] Infrastructure-as-code (Bicep) నిర్వహణ నమూనాలను పరిశీలించండి
    - [ ] **ల్యాబ్ 3:** GitHub Copilot ఉపయోగించి రిపోసిటరీ ఆర్కిటెక్చర్‌ను అన్వేషించి అర్థం చేసుకోండి

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**కానీ ఇప్పుడు, మనకు ప్రాజెక్ట్ నిర్మాణం మరియు కోడ్‌బేస్‌ ను అర్థం చేసుకోవాలి - మరియు AZD టెంప్లేట్‌ను కస్టమైజ్ చేయగలిగే స్థాయిలో ఉండాలి - AZD గురించి ముందే అనుభవం లేకుండానే!**

---

## 1. GitHub Copilotను సక్రియం చేయండి

### 1.1 GitHub Copilot Chat ను ఇన్‌స్టాల్ చేయండి

It's time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, and it is often already available in Codespaces or dev container environments. _Click `Open Chat` from the Copilot icon drop-down - and type a prompt like `What can you do?`_ - you may be prompted to log in. **GitHub Copilot Chat సిద్ధంగా ఉంది**.

### 1.2. MCP సర్వర్లను ఇన్‌స్టాల్ చేయండి

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

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

??? warning "మీకు `npx` ఇన్‌స్టాల్ కాలేదన్న దోషం ఎదుర కావచ్చు (సరిచేసుకోవడానికి క్లిక్ చేయండి)"

      To fix,this open the `.devcontainer/devcontainer.json` file and add this line to the features section. Then rebuild the container. You should now have `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3. GitHub Copilot Chat ని పరీక్షించండి

**మొదట VS Code కమాండ్ లైన్ నుండి Azureతో authenticate చేయడానికి `azd auth login` ఉపయోగించండి. మీరు Azure CLI కమాండ్లు నేరుగా నడపాలనుకుంటే మాత్రమే `az login` కూడా వాడండి.**

You should now be able to query your Azure subscription status, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You can also ask questions about Azure documentation and get responses grounded in the Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you can ask for code snippets to complete a task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

In `Ask` mode, this will provide code that you can copy-paste and try out. In `Agent` mode, this might go a step further and create the relevant resources for you - including setup scripts and documentation - to help you execute that task.

**మీకు ఇప్పుడు టెంప్లేట్ రిపోసిటరీని అన్వేషించడానికి సన్నద్ధంగా ఉంటుంది**

---

## 2. ఆర్కిటెక్చర్‌ను విచ్ఛేదించండి

??? prompt "ASK: docs/images/architecture.png లోని అప్లికేషన్ ఆర్కిటెక్చర్‌ను 1 పేరాలో వివరించండి"

      This application is an AI-powered chat application built on Azure that demonstrates a modern agent-based architecture. The solution centers around an Azure Container App that hosts the main application code, which processes user input and generates intelligent responses through an AI agent. 
      
      The architecture leverages Microsoft Foundry Project as the foundation for AI capabilities, connecting to Azure AI Services that provide the underlying language models (such as gpt-4.1-mini) and agent functionality. User interactions flow through a React-based frontend to a FastAPI backend that communicates with the AI agent service for generating contextual responses. 
      
      The system incorporates knowledge retrieval capabilities through either file search or Azure AI Search service, allowing the agent to access and cite information from uploaded documents. For operational excellence, the architecture includes comprehensive monitoring through Application Insights and Log Analytics Workspace for tracing, logging, and performance optimization. 
      
      Azure Storage provides blob storage for application data and file uploads, while Managed Identity ensures secure access between Azure resources without storing credentials. The entire solution is designed for scalability and maintainability, with the containerized application automatically scaling based on demand while providing built-in security, monitoring, and CI/CD capabilities through Azure's managed services ecosystem.

![ఆర్కిటెక్చర్](../../../../../translated_images/te/architecture.48d94861e6e6cdc0.webp)

---

## 3. రిపోసిటరీ నిర్మాణం

!!! prompt "ASK: టెంప్లేట్ ఫోల్డర్ నిర్మాణాన్ని వివరించండి. ఒక దృశ్య హైరార్కికల్ డయాగ్రామ్‌తో ప్రారంభించండి."

??? info "ANSWER: Visual Hierarchical Diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI కాన్ఫిగరేషన్
      │   ├── docker-compose.yaml           # లోకల్ డెవలప్‌మెంట్ కంటెయినర్లు
      │   ├── pyproject.toml                # Python ప్రాజెక్ట్ కాన్ఫిగరేషన్
      │   ├── requirements-dev.txt          # డెవలప్‌మెంట్ డిపెండెన్సీలు
      │   └── .devcontainer/                # VS Code dev కంటెయినర్ సెటప్
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # ప్రధాన ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్
      │   ├── api.bicep                     # API-స్పెసిఫిక్ రిసోర్సెస్
      │   ├── main.parameters.json          # ఇన్‌ఫ్రాస్ట్రక్చర్ పారామీటర్లు
      │   └── core/                         # మాడ్యులర్ ఇన్‌ఫ్రాస్ట్రక్చర్ భాగాలు
      │       ├── ai/                       # AI సర్వీస్ కాన్ఫిగరేషన్లు
      │       ├── host/                     # హోస్టింగ్ ఇన్‌ఫ్రాస్ట్రక్చర్
      │       ├── monitor/                  # మానిటరింగ్ మరియు లాగింగ్
      │       ├── search/                   # Azure AI Search సెటప్
      │       ├── security/                 # సెక్యూరిటీ మరియు ఐడెంటిటీ
      │       └── storage/                  # స్టోరేజ్ అకౌంట్ కాన్ఫిగ్స్
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # బ్యాకెండ్ API
      │   │   ├── main.py                   # FastAPI అప్లికేషన్ ఎంట్రీ
      │   │   ├── routes.py                 # API రూట్ నిర్వచనలు
      │   │   ├── search_index_manager.py   # సెర్చ్ ఫంక్షనాలిటీ
      │   │   ├── data/                     # API డేటా హ్యాండ్లింగ్
      │   │   ├── static/                   # స్థిర వెబ్ ఆస్తులు
      │   │   └── templates/                # HTML టెంప్లేట్లు
      │   ├── frontend/                     # React/TypeScript ఫ్రంట్‌ఎండ్
      │   │   ├── package.json              # Node.js డిపెండెన్సీలు
      │   │   ├── vite.config.ts            # Vite బిల్డ్ కాన్ఫిగరేషన్
      │   │   └── src/                      # ఫ్రంట్‌ఎండ్ సోర్స్ కోడ్
      │   ├── data/                         # నమూనా డేటా ఫైళ్లు
      │   │   └── embeddings.csv            # ముందుగా గణించిన ఎంబెడ్డింగ్స్
      │   ├── files/                        # నాలెడ్జ్ బేస్ ఫైళ్ళు
      │   │   ├── customer_info_*.json      # కస్టమర్ డేటా నమూనాలు
      │   │   └── product_info_*.md         # ఉత్పత్తి డాక్యుమెంటేషన్
      │   ├── Dockerfile                    # కంటెయినర్ కాన్ఫిగరేషన్
      │   └── requirements.txt              # Python డిపెండెన్సీస్
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # పోస్ట్-డిప్లాయ్‌మెంట్ సెటప్
      │   ├── setup_credential.sh/.ps1     # క్రెడెన్షియల్ కాన్ఫిగరేషన్
      │   ├── validate_env_vars.sh/.ps1    # పర్యావరణ ధృవీకరణ
      │   └── resolve_model_quota.sh/.ps1  # మోడల్ కోటా నిర్వహణ
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # యూనిట్ మరియు ఇంటిగ్రేషన్ పరీక్షలు
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # ఏజెంట్ మూల్యాంకన ఫ్రేమ్వర్క్
      │   │   ├── evaluate.py               # మూల్యాంకన రన్నర్
      │   │   ├── eval-queries.json         # పరీక్ష క్వెరీలు
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # డెవలప్‌మెంట్ ప్లేగ్రౌండ్
      │   │   ├── 1-quickstart.py           # ప్రారంభించడానికి ఉదాహరణలు
      │   │   └── aad-interactive-chat.py   # ఆథెంటికేషన్ ఉదాహరణలు
      │   └── airedteaming/                 # AI సేఫ్టీ మూల్యాంకనం
      │       └── ai_redteaming.py          # రెడ్ టీమ్ టెస్టింగ్
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # డిప్లాయ్‌మెంట్ గైడ్
      │   ├── local_development.md          # లోకల్ సెటప్ సూచనలు
      │   ├── troubleshooting.md            # సాధారణ సమస్యలు & పరిష్కారాలు
      │   ├── azure_account_setup.md        # Azure ప్రీరిక్విజిట్స్
      │   └── images/                       # డాక్యుమెంటేషన్ ఆస్తులు
      │
      └── 📄 Project Metadata
         ├── README.md                     # ప్రాజెక్ట్ అవలోకనం
         ├── CODE_OF_CONDUCT.md           # కమ్యూనిటీ మార్గదర్శకాలు
         ├── CONTRIBUTING.md              # కాంట్రిబ్యూషన్ గైడ్
         ├── LICENSE                      # లైసెన్స్ నిబంధనలు
         └── next-steps.md                # పోస్ట్-డిప్లాయ్‌మెంట్ మార్గదర్శకత్వం
      ```

### 3.1. కోర్ యాప్ ఆర్కిటెక్చర్

This template follows a **full-stack web application** pattern with:

- **Backend**: Python FastAPI తో Azure AI ఇంటిగ్రేషన్
- **Frontend**: TypeScript/React మరియు Vite బిల్డ్ సిస్టమ్
- **Infrastructure**: క్లౌడ్ రిసోర్సుల కోసం Azure Bicep టెంప్లేట్స్
- **Containerization**: స్థిరమైన డిప్లాయ్‌మెంట్ కోసం Docker

### 3.2 ఇన్‌ఫ్రాస్ట్రక్చర్ ఎస్-కోడ్ (bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: అన్ని Azure రిసోర్సులను ఆర్కెస్ట్రేట్ చేస్తుంది
   - **`core/` modules**: వివిధ సర్వీసుల కోసం పునర్వినియోగపరచగల భాగాలు
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI ఆధారిత REST API
- Foundry Agents ఇంటిగ్రేషన్
- నాలెడ్జ్ రిట్రీవల్ కోసం సెర్చ్ ఇండెక్స్ నిర్వహణ
- ఫైల్ అప్లోడ్ మరియు ప్రాసెసింగ్ సామర్థ్యాలు

**Frontend (`src/frontend/`)**:

- ఆధునిక React/TypeScript SPA
- వేగవంతమైన డెవలప్‌మెంట్ మరియు ఆప్టిమైజ్డ్ బిల్డ్స్ కోసం Vite
- ఏజెంట్ ఇంటరాక్షన్ల కోసం చాట్ ఇంటర్‌ఫేస్

**Knowledge Base (`src/files/`)**:

- నమూనా కస్టమర్ మరియు ఉత్పత్తి డేటా
- ఫైల్-ఆధారిత నాలెడ్జ్ రిట్రీవల్‌ను చూపిస్తుంది
- JSON మరియు Markdown ఫార్మాట్ ఉదాహరణలు


### 3.4 డెవ్‌ఓప్స్ & ఆటోమేషన్

**Scripts (`scripts/`)**:

- క్రాస్-ప్లాట్‌ఫాం PowerShell మరియు Bash స్క్రిప్ట్స్
- పర్యావరణ ధృవీకరణ మరియు సెటప్
- పోస్ట్-డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్
- మోడల్ కోటా నిర్వహణ

**Azure Developer CLI Integration**:

- `azure.yaml` కన్ఫిగరేషన్ `azd` వర్క్‌ఫ్లోల కోసం
- ఆటోమేటెడ్ ప్రొవిజనింగ్ మరియు డిప్లాయ్‌మెంట్
- ఎన్‌వారన్మెంట్ వ్యారీబుళ్ల నిర్వహణ

### 3.5 టెస్టింగ్ & క్వాలిటీ అష్యూరెన్స్

**Evaluation Framework (`evals/`)**:

- ఏజెంట్ పనితీరు మూల్యాంకనం
- క్వరీ-ప్రత్యుత్తర నాణ్యత పరీక్షలు
- ఆటోమేటెడ్ అసెస్‌మెంట్ పైప్లైన్

**AI Safety (`airedteaming/`)**:

- AI సేఫ్టీ కోసం రెడ్ టీమ్ టెస్టింగ్
- సెక్యూరిటీ లోపాల స్కానింగ్
- బాధ్యతాయుత AI ప్రాక్టీసులు

---

## 4. అభినందనలు 🏆

You successfully used GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] Azure కోసం GitHub Copilot‌ను సక్రియం చేయించారు
- [X] అప్లికేషన్ ఆర్కిటెక్చర్‌ను అర్థం చేసుకున్నారు
- [X] AZD టెంప్లేట్ నిర్మాణాన్ని పరిశీలించారు

This gives you a sense of the _infrastructure as code_ assets for this template. Next, we'll look at the configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించారు. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా పొరపాట్లు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని సంస్కరణను అధికారిక మూలంగా పరిగణించాలి. ప్రముఖమైన లేదా కీలకమైన సమాచారానికి, వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాల కోసం మేము బాధ్యులు కాదని తెలియజేస్తున్నాము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
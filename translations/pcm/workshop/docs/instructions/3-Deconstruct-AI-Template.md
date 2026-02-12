# 3. Break down di Template

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Enable GitHub Copilot wit MCP servers for Azure help
    - [ ] Understand di AZD template folder structure an components
    - [ ] Explore how dem organize infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Use GitHub Copilot to explore an understand di repository architecture 

---


Wit AZD templates an di Azure Developer CLI (`azd`) we fit quickly jumpstart our AI development journey wit standardized repositories wey dey provide sample code, infrastructure an configuration files - as one ready-to-deploy _starter_ project.

**But now, we need to understand di project structure an codebase - an fit customize di AZD template - even if you never sabi AZD before!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

Na time to explore [GitHub Copilot wit Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we fit use natural language to describe our task for high level, an get help to run am. For dis lab, we go use di [Copilot Free plan](https://github.com/github-copilot/signup) wey get monthly limit for completions an chat interactions.

Di extension fit install from di marketplace, but e suppose don dey already for your Codespaces environment. _Click `Open Chat` from di Copilot icon drop-down - an type prompt like `What can you do?`_ - you fit get prompt to log in. **GitHub Copilot Chat don ready**.

### 1.2. Install MCP Servers

For Agent mode make e work well, e need access to correct tools wey go help am retrieve knowledge or do actions. Na here MCP servers fit help. We go configure di following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

To activate these:

1. Create file wey dem call `.vscode/mcp.json` if e never dey
1. Copy di following into dat file - an start di servers!
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

??? warning "You fit see error say `npx` never install (click to expand for fix)"

      To fix, open di `.devcontainer/devcontainer.json` file an add dis line to di features section. Then rebuild di container. You go don get `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**First use `az login` to authenticate with Azure from VS Code command line.**

You suppose fit now query your Azure subscription status, an ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You fit also ask questions about Azure documentation an get answers wey base for Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you fit ask for code snippets to finish one task. Try dis prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

For `Ask` mode, dis go give you code wey you fit copy-paste an try. For `Agent` mode, e fit go one step further an create di relevant resources for you - including setup scripts an documentation - to help you run dat task.

**You don ready to start to explore di template repository**

---

## 2. Break down di Architecture

??? prompt "ASK: Explain di application architecture in docs/images/architecture.png in 1 paragraph"

      Dis application na AI-powered chat application wey dey run for Azure wey dey show modern agent-based architecture. Di solution center around one Azure Container App wey dey host di main application code, wey dey process user input an generate intelligent responses through one AI agent. 
      
      Di architecture dey use Microsoft Foundry Project as di foundation for AI capabilities, an e connect to Azure AI Services wey dey provide di underlying language models (like GPT-4o-mini) an agent functionality. User interactions dey flow from React-based frontend go FastAPI backend wey dey communicate wit di AI agent service to generate contextual responses. 
      
      Di system get knowledge retrieval capabilities through file search or Azure AI Search service, wey allow di agent access an cite information from uploaded documents. For operational excellence, di architecture include monitoring through Application Insights an Log Analytics Workspace for tracing, logging, an performance optimization. 
      
      Azure Storage dey provide blob storage for application data an file uploads, while Managed Identity dey ensure secure access between Azure resources without storing credentials. Di whole solution design to scale an easy to maintain, wit di containerized application dey auto-scale based on demand an di managed Azure services dey provide built-in security, monitoring, an CI/CD capabilities.

![Di Architecture](../../../../../translated_images/pcm/architecture.48d94861e6e6cdc0.webp)

---

## 3. How di repository dey arranged

!!! prompt "ASK: Explain di template folder structure. Start wit one visual hierarchical diagram."

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

### 3.1. Core App Architecture

Dis template dey follow one **full-stack web application** pattern wit:

- **Backend**: Python FastAPI wit Azure AI integration
- **Frontend**: TypeScript/React wit Vite build system
- **Infrastructure**: Azure Bicep templates for cloud resources
- **Containerization**: Docker for consistent deployment

### 3.2 Infra As Code (bicep)

Di infrastructure layer dey use **Azure Bicep** templates wey dem organize modularly:

   - **`main.bicep`**: Na e dey orchestrate all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Azure OpenAI, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-based REST API
- Foundry Agents integration
- Search index management for knowledge retrieval
- File upload an processing capabilities

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite for fast development an optimized builds
- Chat interface for agent interactions

**Knowledge Base (`src/files/`)**:

- Sample customer an product data
- Show how file-based knowledge retrieval dey work
- JSON an Markdown examples


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell an Bash scripts
- Environment validation an setup
- Post-deployment configuration
- Model quota management

**Azure Developer CLI Integration**:

- `azure.yaml` configuration for `azd` workflows
- Automated provisioning an deployment
- Environment variable management

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- Agent performance evaluation
- Query-response quality testing
- Automated assessment pipeline

**AI Safety (`airedteaming/`)**:

- Red team testing for AI safety
- Security vulnerability scanning
- Responsible AI practices

---

## 4. Congratulations 🏆

You don successfully use GitHub Copilot Chat wit MCP servers, to explore di repository.

- [X] Enabled GitHub Copilot for Azure
- [X] Understood di Application Architecture
- [X] Explored di AZD template structure

Dis give you one idea of di _infrastructure as code_ assets for dis template. Next, we go look di configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis dokument don translate using AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, make you sabi say automatic translations fit get mistakes or no too accurate. Di original dokument for im own language na di official source wey you suppose rely on. If na important information, we recommend say professional human translator do di translation. We no go responsible for any misunderstanding or wrong interpretation wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 3. Break down di template

!!! tip "WEN DIS MODULE DON FINISH, YOU GO FIT"

    - [ ] Turn on GitHub Copilot wit MCP servers for Azure help
    - [ ] Understand di AZD template folder structure and components
    - [ ] Explore how infrastructure-as-code (Bicep) dey organized
    - [ ] **Lab 3:** Use GitHub Copilot make you explore an sabi di repository architecture 

---


Wit AZD templates and di Azure Developer CLI (`azd`) we fit quickly start our AI development journey wit standardized repositories wey dey provide sample code, infrastructure an configuration files - as one ready-to-deploy _starter_ project.

**But now, we need make we sabi di project structure an codebase - an fit customize di AZD template - even if we no get prior experience or sabi AZD!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

Na time to explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we fit use natural language to describe our task for high level, an get help to execute am. For dis lab, we go use the [Copilot Free plan](https://github.com/github-copilot/signup) wey get monthly limit for completions an chat interactions.

The extension fit install from di marketplace, an e dey often already available for Codespaces or dev container environments. _Click `Open Chat` from di Copilot icon drop-down - an type prompt wey be `What can you do?`_ - dem fit ask you to log in. **GitHub Copilot Chat don ready**.

### 1.2. Install MCP Servers

For Agent mode make e work well, e need access to the correct tools wey go help am bring knowledge or perform actions. Na here MCP servers fit help. We go configure di following servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

To activate these:

1. Create one file wey name `.vscode/mcp.json` if e no dey
1. Copy di following into that file - an start di servers!
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

??? warning "You fit see error say `npx` no install (click to expand for fix)"

      To fix,this open the `.devcontainer/devcontainer.json` file and add this line to the features section. Then rebuild the container. You should now have `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**First use `azd auth login` make you authenticate with Azure from the VS Code command line. Use `az login` too only if you plan to run Azure CLI commands directly.**

You suppose don fit query your Azure subscription status now, an ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You fit also ask questions about Azure documentation an get answers wey base for di Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you fit ask for code snippets to complete task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

For `Ask` mode, dis one go give code wey you fit copy-paste an try. For `Agent` mode, e fit do one step further an create di resources wey you need - including setup scripts an documentation - to help you run dat task.

**You don ready to start to explore di template repository**

---

## 2. Deconstruct Architecture

??? prompt "ASK: Make you explain di application architecture in docs/images/architecture.png for 1 paragraph"

      Dis application na AI-powered chat application wey build for Azure wey dey show modern agent-based architecture. Di solution center na one Azure Container App wey dey host di main application code, wey dey process user input an generate intelligent responses through AI agent.
      
      Di architecture dey use Microsoft Foundry Project as di foundation for AI capabilities, connect to Azure AI Services wey provide di underlying language models (like gpt-4.1-mini) an agent functionality. User interaction dey flow from React-based frontend go FastAPI backend wey dey communicate wit di AI agent service to generate contextual responses.
      
      Di system get knowledge retrieval capabilities through file search or Azure AI Search service, wey allow di agent access an cite information from uploaded documents. For operational excellence, di architecture include full monitoring through Application Insights an Log Analytics Workspace for tracing, logging, an performance optimization.
      
      Azure Storage dey provide blob storage for application data an file uploads, while Managed Identity dey ensure secure access between Azure resources without storing credentials. Di whole solution design make am scale an maintainable, wit di containerized application dey automatically scale based on demand while dey provide built-in security, monitoring, an CI/CD capabilities through Azure's managed services ecosystem.

![Architecture](../../../../../translated_images/pcm/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

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
- **Containerization**: Docker to make deployment consistent

### 3.2 Infra As Code (bicep)

Di infrastructure layer dey use **Azure Bicep** templates wey dem organize modularly:

   - **`main.bicep`**: E dey orchestrate all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Microsoft Foundry Models, AI Search)
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
- Shows how file-based knowledge retrieval dey work
- JSON an Markdown format examples


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

## 4. Congrats 🏆

You don successfully use GitHub Copilot Chat wit MCP servers to explore di repository.

- [X] Turn on GitHub Copilot for Azure
- [X] Sabi di Application Architecture
- [X] Explore di AZD template structure

Dis one don give you small idea of di _infrastructure as code_ assets wey dis template get. Next, we go look di configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis dokument don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg make you sabi say automated translations fit get mistakes or inaccuracies. Di original dokument for im native language suppose be di authoritative source. If na critical information, e better make professional human translator do am. We no dey liable for any misunderstandings or misinterpretations wey fit come from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
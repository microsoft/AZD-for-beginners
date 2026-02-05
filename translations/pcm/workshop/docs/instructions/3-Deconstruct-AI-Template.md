# 3. Deconstruct Template

!!! tip "BY THE END OF THIS MODULE YOU GO FIT DO"

    - [ ] Item
    - [ ] Item
    - [ ] Item
    - [ ] **Lab 3:** 

---


With AZD templates and Azure Developer CLI (`azd`), we fit quick quick start our AI development waka with standard repositories wey get sample code, infrastructure, and configuration files - as ready-to-deploy _starter_ project.

**But now, we need sabi the project structure and codebase - and fit customize the AZD template - even if we no get any experience or sabi AZD before!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

Make we explore [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we fit use natural language take describe wetin we wan do for high level, and e go help us execute am. For this lab, we go use the [Copilot Free plan](https://github.com/github-copilot/signup) wey get monthly limit for completions and chat interactions.

The extension fit install from marketplace, but e suppose don dey available for your Codespaces environment. _Click `Open Chat` from the Copilot icon drop-down - and type prompt like `What can you do?`_ - dem fit ask you to log in. **GitHub Copilot Chat don ready**.

### 1.2. Install MCP Servers

For Agent mode to work well, e need access to correct tools wey go help am retrieve knowledge or take action. Na here MCP servers go help. We go configure these servers:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

To activate dem:

1. Create file wey dem call `.vscode/mcp.json` if e no dey exist
1. Copy wetin dey below enter the file - and start the servers!
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

??? warning "You fit see error say `npx` no dey installed (click to expand for fix)"

      To fix am, open the `.devcontainer/devcontainer.json` file and add this line for the features section. Then rebuild the container. You suppose don get `npx` installed.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**First use `az login` to authenticate with Azure from VS Code command line.**

You suppose fit query your Azure subscription status now, and ask questions about deployed resources or configuration. Try these prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

You fit also ask questions about Azure documentation and get answers wey dey grounded for Microsoft Docs MCP server. Try these prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Or you fit ask for code snippets to complete task. Try this prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

For `Ask` mode, e go provide code wey you fit copy-paste and try. For `Agent` mode, e fit go one step further and create the resources wey you need - including setup scripts and documentation - to help you execute the task.

**You don ready to start explore the template repository**

---

## 2. Deconstruct Architecture

??? prompt "ASK: Explain the application architecture in docs/images/architecture.png in 1 paragraph"

      This application na AI-powered chat application wey dem build on top Azure wey dey show modern agent-based architecture. The solution dey center around Azure Container App wey dey host the main application code, wey dey process user input and dey generate intelligent responses through AI agent. 
      
      The architecture dey use Azure AI Foundry Project as foundation for AI capabilities, wey dey connect to Azure AI Services wey dey provide the language models (like GPT-4o-mini) and agent functionality. User interactions dey flow through React-based frontend enter FastAPI backend wey dey communicate with AI agent service to generate contextual responses. 
      
      The system dey include knowledge retrieval capabilities through file search or Azure AI Search service, wey dey allow the agent access and cite information from uploaded documents. For operational excellence, the architecture get complete monitoring through Application Insights and Log Analytics Workspace for tracing, logging, and performance optimization. 
      
      Azure Storage dey provide blob storage for application data and file uploads, while Managed Identity dey ensure secure access between Azure resources without storing credentials. The whole solution dey designed for scalability and maintainability, with the containerized application dey automatically scale based on demand while e dey provide built-in security, monitoring, and CI/CD capabilities through Azure's managed services ecosystem.

![Architecture](../../../../../translated_images/pcm/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

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

### 3.1. Core App Architecture

This template dey follow **full-stack web application** pattern with:

- **Backend**: Python FastAPI with Azure AI integration
- **Frontend**: TypeScript/React with Vite build system
- **Infrastructure**: Azure Bicep templates for cloud resources
- **Containerization**: Docker for consistent deployment

### 3.2 Infra As Code (bicep)

The infrastructure layer dey use **Azure Bicep** templates wey dem arrange modularly:

   - **`main.bicep`**: E dey orchestrate all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Azure OpenAI, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-based REST API
- Azure AI Agent service integration
- Search index management for knowledge retrieval
- File upload and processing capabilities

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite for fast development and optimized builds
- Chat interface for agent interactions

**Knowledge Base (`src/files/`)**:

- Sample customer and product data
- E dey show file-based knowledge retrieval
- JSON and Markdown format examples


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell and Bash scripts
- Environment validation and setup
- Post-deployment configuration
- Model quota management

**Azure Developer CLI Integration**:

- `azure.yaml` configuration for `azd` workflows
- Automated provisioning and deployment
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

You don successfully use GitHub Copilot Chat with MCP servers, to explore the repository.

- [X] Activate GitHub Copilot for Azure
- [X] Sabi the Application Architecture
- [X] Explore the AZD template structure

This one don give you idea of the _infrastructure as code_ assets for this template. Next, we go look the configuration file for AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI translet service [Co-op Translator](https://github.com/Azure/co-op-translator) do di translet. Even as we dey try make am correct, abeg sabi say machine translet fit get mistake or no dey accurate well. Di original dokyument wey dey for im native language na di main correct source. For important mata, e good make una use professional human translet. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because una use dis translet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
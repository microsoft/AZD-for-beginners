<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-25T02:30:37+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "my"
}
-->
# 3. Template ကိုခွဲခြမ်းစိတ်ဖြာခြင်း

!!! tip "ဤ module အဆုံးသတ်သည့်အခါ သင်လုပ်နိုင်မည်"

    - [ ] အချက်
    - [ ] အချက်
    - [ ] အချက်
    - [ ] **Lab 3:** 

---

AZD template နှင့် Azure Developer CLI (`azd`) ကို အသုံးပြု၍ AI ဖွံ့ဖြိုးတိုးတက်မှု ခရီးစဉ်ကို စတင်ရန် အဆင်ပြေသော repository များကို အလွယ်တကူ ရယူနိုင်သည်။ ၎င်းတွင် နမူနာ code, infrastructure နှင့် configuration ဖိုင်များ ပါဝင်ပြီး _starter_ project အနေဖြင့် deploy ပြုလုပ်ရန် အသင့်ဖြစ်သည်။

**သို့သော် အခုတော့ project structure နှင့် codebase ကို နားလည်ရန်လိုအပ်ပြီး AZD template ကို customize ပြုလုပ်နိုင်ရန် AZD အတွေ့အကြုံမရှိဘဲ လုပ်ဆောင်နိုင်ရမည်!**

---

## 1. GitHub Copilot ကို အလုပ်လုပ်စေပါ

### 1.1 GitHub Copilot Chat ကို Install လုပ်ပါ

[Agent Mode ဖြင့် GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ကို စမ်းသပ်ရန် အချိန်ရောက်ပါပြီ။ ယခု lab အတွက် [Copilot Free plan](https://github.com/github-copilot/signup) ကို အသုံးပြုမည်ဖြစ်ပြီး completions နှင့် chat interactions အတွက် လစဉ်ကန့်သတ်ချက်ရှိသည်။

extension ကို marketplace မှ install လုပ်နိုင်သော်လည်း Codespaces environment တွင် ရှိပြီးသားဖြစ်သင့်သည်။ _Copilot icon drop-down မှ `Open Chat` ကို click လုပ်ပြီး `What can you do?` ဆိုသော prompt ကို ရိုက်ထည့်ပါ_ - login ပြုလုပ်ရန် prompt ရနိုင်သည်။ **GitHub Copilot Chat အသင့်ဖြစ်ပါပြီ**။

### 1.2 MCP Servers ကို Install လုပ်ပါ

Agent mode ကို ထိရောက်စွာ အသုံးပြုရန် knowledge ရယူခြင်း သို့မဟုတ် လုပ်ဆောင်မှုများကို အကူအညီပေးနိုင်သော tools များ လိုအပ်သည်။ MCP servers သည် ဤအခါတွင် အကူအညီပေးနိုင်သည်။ အောက်ပါ servers များကို configure ပြုလုပ်မည်။

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

ဤ servers များကို activate ပြုလုပ်ရန်:

1. `.vscode/mcp.json` ဆိုသော ဖိုင်ကို မရှိသေးပါက ဖန်တီးပါ
1. အောက်ပါ code ကို ထည့်သွင်းပြီး servers များကို စတင်ပါ!
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

??? warning "`npx` install မရှိဟု error ရနိုင်သည် (fix ကို expand လုပ်ပါ)"

      ပြုပြင်ရန် `.devcontainer/devcontainer.json` ဖိုင်ကို ဖွင့်ပြီး features အပိုင်းတွင် အောက်ပါလိုင်းကို ထည့်ပါ။ container ကို ပြန်လည်တည်ဆောက်ပါ။ `npx` install ရရှိသင့်ပါပြီ။

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 GitHub Copilot Chat ကို စမ်းသပ်ပါ

**အရင်ဆုံး `az login` ကို အသုံးပြု၍ Azure နှင့် authenticate ပြုလုပ်ပါ။**

ယခု သင်၏ Azure subscription status ကို query ပြုလုပ်နိုင်ပြီး deploy ပြုလုပ်ထားသော resources သို့မဟုတ် configuration အကြောင်းကို မေးမြန်းနိုင်ပါပြီ။ အောက်ပါ prompt များကို စမ်းသပ်ပါ:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Azure documentation အကြောင်းကို မေးမြန်းပြီး Microsoft Docs MCP server မှ grounded response ရနိုင်ပါသည်။ အောက်ပါ prompt များကို စမ်းသပ်ပါ:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

သို့မဟုတ် တစ်စုံတစ်ခုလုပ်ဆောင်ရန် code snippets များကို မေးမြန်းနိုင်ပါသည်။ ဤ prompt ကို စမ်းသပ်ပါ။

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` mode တွင် code ကို copy-paste ပြုလုပ်ပြီး စမ်းသပ်နိုင်သည်။ `Agent` mode တွင် resources များကို ဖန်တီးပေးနိုင်ပြီး setup scripts နှင့် documentation များပါဝင်သည် - သင့်လုပ်ဆောင်မှုကို အကူအညီပေးရန်။

**Template repository ကို စတင်လေ့လာရန် သင့်အား အသင့်ဖြစ်စေပါပြီ**

---

## 2. Architecture ကို ခွဲခြမ်းစိတ်ဖြာပါ

??? prompt "ASK: docs/images/architecture.png တွင် application architecture ကို ၁ ပုဒ်ဖြင့် ရှင်းပြပါ"

      ဤ application သည် Azure ပေါ်တွင် တည်ဆောက်ထားသော AI-powered chat application ဖြစ်ပြီး modern agent-based architecture ကို ပြသသည်။ solution သည် user input ကို process ပြုလုပ်ပြီး AI agent မှ intelligent responses ထုတ်ပေးသော main application code ကို host လုပ်သည့် Azure Container App ကို အခြေခံထားသည်။

      Architecture သည် Azure AI Foundry Project ကို AI capabilities အတွက် အခြေခံအဖြစ် အသုံးပြုပြီး Azure AI Services နှင့် language models (ဥပမာ GPT-4o-mini) နှင့် agent functionality ကို ချိတ်ဆက်ထားသည်။ User interactions သည် React-based frontend မှ FastAPI backend သို့ စီးဆင်းပြီး AI agent service နှင့် ဆက်သွယ်ကာ contextual responses ထုတ်ပေးသည်။

      Knowledge retrieval capabilities ကို file search သို့မဟုတ် Azure AI Search service မှတဆင့် ပေးထားပြီး agent သည် uploaded documents မှ အချက်အလက်များကို ရယူပြီး citation ပြုလုပ်နိုင်သည်။ Operational excellence အတွက် Application Insights နှင့် Log Analytics Workspace ကို monitoring, logging, performance optimization အတွက် ထည့်သွင်းထားသည်။

      Azure Storage သည် application data နှင့် file uploads အတွက် blob storage ကို ပေးထားပြီး Managed Identity သည် credentials မသိမ်းဆည်းဘဲ Azure resources အကြား secure access ကို အာမခံသည်။ solution အားလုံးကို scalability နှင့် maintainability အတွက် design ပြုလုပ်ထားပြီး containerized application သည် demand အလိုက် auto-scaling ပြုလုပ်နိုင်ပြီး Azure managed services ecosystem မှ built-in security, monitoring, CI/CD capabilities များကို ပေးထားသည်။

![Architecture](../../../../../translated_images/my/architecture.48d94861e6e6cdc0.png)

---

## 3. Repository Structure

!!! prompt "ASK: Template folder structure ကို ရှင်းပြပါ။ Visual Hierarchical Diagram ဖြင့် စတင်ပါ။"

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

### 3.1 Core App Architecture

ဤ template သည် **full-stack web application** pattern ကို လိုက်နာထားပြီး:

- **Backend**: Python FastAPI နှင့် Azure AI integration
- **Frontend**: TypeScript/React နှင့် Vite build system
- **Infrastructure**: Azure Bicep templates ဖြင့် cloud resources
- **Containerization**: Docker ဖြင့် deployment consistency

### 3.2 Infra As Code (bicep)

Infrastructure layer သည် **Azure Bicep** templates ကို modular အနေဖြင့် အသုံးပြုထားသည်။

   - **`main.bicep`**: Azure resources အားလုံးကို orchestrate ပြုလုပ်သည်
   - **`core/` modules**: အမျိုးမျိုးသော services အတွက် reusable components
      - AI services (Azure OpenAI, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-based REST API
- Azure AI Agent service integration
- Search index management for knowledge retrieval
- File upload နှင့် processing capabilities

**Frontend (`src/frontend/`)**:

- Modern React/TypeScript SPA
- Vite ဖြင့် development နှင့် optimized builds
- Chat interface for agent interactions

**Knowledge Base (`src/files/`)**:

- Sample customer နှင့် product data
- File-based knowledge retrieval ကို ပြသသည်
- JSON နှင့် Markdown format examples

### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell နှင့် Bash scripts
- Environment validation နှင့် setup
- Post-deployment configuration
- Model quota management

**Azure Developer CLI Integration**:

- `azure.yaml` configuration for `azd` workflows
- Automated provisioning နှင့် deployment
- Environment variable management

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- Agent performance evaluation
- Query-response quality testing
- Automated assessment pipeline

**AI Safety (`airedteaming/`)**:

- AI safety အတွက် Red team testing
- Security vulnerability scanning
- Responsible AI practices

---

## 4. ဂုဏ်ယူပါတယ် 🏆

GitHub Copilot Chat ကို MCP servers နှင့် အသုံးပြု၍ repository ကို လေ့လာနိုင်ခဲ့ပါပြီ။

- [X] GitHub Copilot ကို Azure အတွက် activate ပြုလုပ်ခဲ့သည်
- [X] Application Architecture ကို နားလည်ခဲ့သည်
- [X] AZD template structure ကို လေ့လာခဲ့သည်

ဤအရာသည် template အတွက် _infrastructure as code_ assets အကြောင်းကို နားလည်စေသည်။ နောက်တစ်ဆင့်တွင် AZD configuration file ကို လေ့လာမည်။

---


# 3. တမ်းပလိတ်ကို ချုတ်ထုတ်ခြင်း

!!! tip "ဒီမော်ဂျူးအဆုံးတွင် သင် အောက်ပါ အရာများကို တတ်နိုင်လိမ့်မည်"

    - [ ] GitHub Copilot ကို Azure အကူအညီအတွက် MCP servers နှင့် ချိတ်ဆက်ခြင်း
    - [ ] AZD တမ်းပလိတ် ဖိုလ်ဒါ ဖွဲ့စည်းပုံနှင့် အပိုင်းအစများကို နားလည်ခြင်း
    - [ ] infrastructure-as-code (Bicep) အဖွဲ့အစည်း ပုံစံများကို စူးစမ်းလေ့လာခြင်း
    - [ ] **Lab 3:** GitHub Copilot ကို အသုံးပြုပြီး repository ရဲ့ ဗဟုသုတနှင့် ဖန်တီးပုံကို စူးစမ်းနားလည်ခြင်း 

---


AZD templates နှင့် Azure Developer CLI (`azd`) ဖြင့် နမူနာကုဒ်၊ အင်ဖရာစတာချာနှင့် ကွန်ဖစ်ဂျာဖိုင်များ ပါဝင်ပြီး deployment အဆင်သင့် _starter_ project အနေနဲ့ သီးသန့်ရှိသော standardized repositories များကို အသုံးပြုကာ AI ဖွံ့ဖြိုးရေး ခရီးစဉ်ကို အလျင်အမြန် စတင်နိုင်ပါသည်။

**သို့သော် ယခုအခါ ကျွန်ုပ်တို့သည် project ဖွဲ့စည်းပုံနှင့် codebase ကို နားလည်ရမည်၊ AZD တမ်းပလိတ်ကို မည်သို့ ကုတ်ပြင်ဆင်ပြီး အလျင်အမြန် ပြင်ဆင်နိုင်မည်ကို - AZD အကြောင်း အရင်မှ နားလည်မှုမရှိပေမယ့် - သိရှိနိုင်ရမည်။**

---

## 1. GitHub Copilot ကို ဖွင့်ပေးခြင်း

### 1.1 GitHub Copilot Chat ကို ထည့်သွင်းရန်

ယခုအခါ [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ကို စူးစမ်း ကြည့်ရန် အချိန်ဖြစ်ပါပြီ။ ယခုမှ ကျွန်တော်တို့သည် သဘာဝဘာသာစကားဖြင့် အလုပ်တာဝန်ကို မြင်ကွင်းကျယ်အဆင့်တွင် ဖော်ပြ၍ အကောင်အထည်ဖော်ရာတွင် ကူညီမှု ရယူနိုင်ပါသည်။ ဒီလက်မှတ်အတွက် [Copilot Free plan](https://github.com/github-copilot/signup) ကို အသုံးပြုမည်ဖြစ်ပြီး monthly ရရှိနိုင်သည့် completions နှင့် chat interactions ကန့်သတ်ချက်ရှိသည်။

extension ကို marketplace မှ တင်နိုင်သော်လည်း Codespaces ပတ်ဝန်းကျင်တွင် ရှိပြီးသား ဖြစ်နိုင်သည်။ _Copilot icon dropdown မှ `Open Chat` ကို နှိပ်ပြီး - `What can you do?` ကဲ့သို့ prompt တစ်ခု ထည့်ပါ_ - login မေးလာနိုင်သည်။ **GitHub Copilot Chat အသင့်ဖြစ်ပါပြီ**။

### 1.2. MCP Servers ထည့်သွင်းခြင်း

Agent mode သည် အသုံးပြုရန် မှန်ကန်သောကိရိယာများကို ချိတ်ဆက်၍ သိမွေ့မှု ရယူခြင်း သို့မဟုတ် လုပ်ဆောင်ချက်များ ဆောင်ရွက်ရန် လိုအပ်သည်။ အဓိကအားဖြင့် MCP servers များက အကူအညီဖြစ်စေပါသည်။ ကျွန်ုပ်တို့သည် အောက်ပါ servers များကို ချိန်ညှိသွင်းမည်။

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

ဤများကို ဖွင့်ရန်:

1. `.vscode/mcp.json` ဟူသော ဖိုင်ကို မရှိသေးလျှင် ဖန်တီးပါ
1. အောက်ပါအရာကို ထည့်ထားပြီး - servers များကို စတင်ပါ!
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

??? warning "သင် `npx` မထည့်သွင်းထားသည့် အမှားကို ကြုံရနိုင်သည် (ဖြေရှင်းနည်း ဖေါ်ပြရန်ဖွင့်ပါ)"

      ပြင်ဆင်ရန်၊ `.devcontainer/devcontainer.json` ဖိုင်ကို ဖွင့်ပြီး features အပိုင်းထဲသို့ အတန်းကို ထည့်ပေးပါ။ ထို့နောက် container ကို ပြန်လည် တည်ဆောက်ပါ။ ယခုမှ `npx` ထည့်သွင်းပြီး ဖြစ်နေပါမည်။

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. GitHub Copilot Chat ကို စမ်းသပ်ရန်

**ပထမဦးဆုံး VS Code command line မှ `az login` ကို အသုံးပြုပြီး Azure ဆီသို့ အတည်ပြု လော့ဂ်အင်လုပ်ပါ။**

ယခု သင်သည် သင်၏ Azure subscription အခြေနေကို မေးမြန်းနိုင်ပြီး deployed ရှိသော resources သို့မဟုတ် configuration အကြောင်း မေးမြန်းနိုင်ပြီ ဖြစ်ပါသည်။ အောက်ပါ prompt များကို စမ်းကြည့်ပါ:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Azure documentation အကြောင်းကိုလည်း မေးမြန်းပြီး Microsoft Docs MCP server အပေါ် အခြေခံထားသော ဖြေကြားချက်များကို ရနိုင်ပါသည်။ ဥပမာအနေဖြင့် အောက်ပါ prompt များကို စမ်းကြည့်ပါ:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

သို့မဟုတ် တာဝန်တစ်ခုကို ပြီးမြောက်အောင် ကုဒ်နမူနာများကို မေးမြန်းနိုင်သည်။ ဥပမာ prompt တစ်ခုမှာ -

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` mode တွင်၊ ဤသည်က ကုဒ်ကို ပေးပြီး ကိုပီပိတ်ပြီး စမ်းကြည့်နိုင်သော ဖော်ပြချက်ပေးမည်။ `Agent` mode တွင်တော့ အဲဒီထက် တစ်ဆင့်မြင့်ကာ သက်ဆိုင်ရာ resources များ (setup scripts နှင့် documentation အပါအဝင်) ကို ဖန်တီးပေးနိုင်ပါသည် - အဲဒီလုပ်ဆောင်ချက်ကို အကောင်အထည်ဖော်ရန် ကူညီပါလိမ့်မည်။

**ယခု သင်သည် template repository ကို စတင် စူးစမ်းနိုင်ရန် အဆင်သင့် ဖြစ်ပါပြီ**

---

## 2. အင်ဂျင်နီယာ ဖွဲ့စည်းပုံ ချုတ်ထုတ်ခြင်း

??? prompt "ASK: docs/images/architecture.png ထဲရှိ application architecture ကို အကြောင်းအရင် စာပိုဒ်တစ်ပိုဒ်ဖြင့် ရှင်းပြပါ"

      ဤ application သည် Azure ပေါ်တွင် တည်ဆောက်ထားသော AI-အားအခြေခံထားသည့် chat application ဖြစ်ပြီး လက်ရှိခေတ်တိုးတက်သော agent-based architecture ကို ဖော်ပြပါသည်။ ဖြေရှင်းချက်သည် အဓိကအားဖြင့် Azure Container App တစ်ခုမှ အဓိက application ကုဒ်ကို ယူဆောင်ထားပြီး၊ အသုံးပြုသူထံမှ အချက်အလက်များကို သက်ဆိုင်ရာ AI agent ဖြင့် ကိုင်တွယ်ကာ အသိပညာပြည့်ဝသော တုံ့ပြန်ချက်များ ဖန်တီးပေးပါသည်။
      
      architecture သည် Microsoft Foundry Project ကို AI စွမ်းဆောင်ရည်အတွက် အခြေခံအဖြစ် အသုံးပြုထားပြီး Azure AI Services (ဥပမာ gpt-4.1-mini ကဲ့သို့သော language models) နှင့် agent များဆိုင်ရာ လုပ်ဆောင်ချက်များသို့ ချိတ်ဆက်ထားပါသည်။ အသုံးပြုသူ အပြန်အလှန် ဆက်သွယ်မှုများသည် React-based frontend မှ FastAPI backend သို့ ဦးဆောင်ဆက်သွယ်ကာ AI agent service နှင့် ဆက်သွယ်၍ ပတ်သက်မှုရှိသော တုံ့ပြန်ချက်များကို ဖန်တီးစေပါသည်။
      
      စနစ်တွင် knowledge retrieval စွမ်းရည်ကို ဖိုင်ရှာဖွေခြင်း သို့မဟုတ် Azure AI Search service ဖြင့် ထောက်ပံ့ထားနိုင်ပြီး agent သည် တင်ထားသော စာရွက်စာတမ်းများမှ သတင်းအချက်အလက်များကို ရယူ၍ ကိုးကားနိုင်သည်။
      
      အစီအစဥ်ဆိုင်ရာ ထိရောက်မှုအတွက် Application Insights နှင့် Log Analytics Workspace မှတဆင့် tracing, logging သန့်ရှင်းရေးနှင့် performance တိုးတက်အောင်မြင်မှု စသည့် comprehensive monitoring များပါဝင်သည်။
      
      Azure Storage သည် application data နှင့် ဖိုင်တင်ဆက်မှုများအတွက် blob storage ကို ပေးပြီး Managed Identity က Azure resources များအကြား လုံခြုံစိတ်ချရသော access ကို သင့်လျော်စွာ ပံ့ပိုးပါသည်။ အစိတ်အပိုင်းများအားလုံးသည် scalability နှင့် maintainability ကို ရည်ရွယ်ပြီး containerized application သည် တောင်းဆိုမှုပေါ်မူတည်၍ အလိုအလျောက် scale လုပ်နိုင်ကာ Azure  Managed Services ecosystem မှ security၊ monitoring နှင့် CI/CD အစီအစဉ်များကို ပံ့ပိုးပေးပါသည်။

![ပုံစံဖွဲ့စည်းပုံ](../../../../../translated_images/my/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository ဖွဲ့စည်းပုံ

!!! prompt "ASK: template ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို ရှင်းပြပါ။ ဇယားပုံစံ hierarchical diagram နဲ့ စတင်ပါ။"

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

### 3.1. အဓိက App ဖွဲ့စည်းပုံ

ဤ template သည် **full-stack web application** ပုံစံကို လိုက်နာထားပြီး -

- **Backend**: Python FastAPI နှင့် Azure AI ပေါင်းစည်းမှု
- **Frontend**: TypeScript/React နှင့် Vite build system
- **Infrastructure**: cloud resources အတွက် Azure Bicep templates
- **Containerization**: တူညီသော deployment အတွက် Docker

### 3.2 Infra As Code (bicep)

အင်ဖရာစတာချာ အလွှာသည် **Azure Bicep** templates များကို modular အနေဖြင့် စီမံထားပါသည်။

   - **`main.bicep`**: Azure resources အားလုံးကို စီမံညှိနှိုင်းသည်
   - **`core/` modules**: ဝန်ဆောင်မှုအမျိုးအစားများအတွက် ပြန်လည်အသုံးပြုနိုင်သော component များ
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI အခြေပြု REST API
- Foundry Agents ပေါင်းစည်းမှု
- knowledge retrieval အတွက် Search index စီမံခန့်ခွဲမှု
- ဖိုင်တင်ခြင်းနှင့် မှတ်တမ်းများကို ကိုင်တွယ်ပေးနိုင်မှု

**Frontend (`src/frontend/`)**:

- မော်ဒါန် React/TypeScript SPA
- ဖျော်ဖြေရေးနှင့် optimized builds အတွက် Vite
- agent interaction များအတွက် chat interface

**Knowledge Base (`src/files/`)**:

- နမူနာ customer နှင့် product data များ
- file-based knowledge retrieval ကို ပြသထားသည်
- JSON နှင့် Markdown ဖော်မတ်အနေဖြင့် ဥပမာများ

### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell နှင့် Bash scripts
- ပတ်ဝန်းကျင် အဆင့်စစ်ဆေးမှုနှင့် setup
- post-deployment configuration
- Model quota စီမံခန့်ခွဲမှု

**Azure Developer CLI Integration**:

- `azure.yaml` configuration သည် `azd` workflows များအတွက်
- automated provisioning နှင့် deployment
- environment variable စီမံခန့်ခွဲမှု

### 3.5 စမ်းသပ်မှုနှင့် အရည်အသွေး အာမခံမှု

**Evaluation Framework (`evals/`)**:

- agent စွမ်းဆောင်ရည် အကဲဖြတ်ခြင်း
- query-response အရည်အသွေး စစ်ဆေးခြင်း
- automated assessment pipeline

**AI Safety (`airedteaming/`)**:

- AI အတွက် red team စမ်းသပ်ခြင်း
- security vulnerability စစ်ဆေးခြင်း
- တာဝန်ရှိသော AI လက်ရှိ့စဉ်များ

---

## 4. 축하합니다 🏆

သင်သည် GitHub Copilot Chat ကို MCP servers နှင့် အတူ အသုံးပြုကာ repository ကို စူးစမ်းနိုင်မြန်ပြီး ဖြစ်ပါသည်။

- [X] GitHub Copilot ကို Azure အတွက် ဖွင့်ပေးပြီးပါပြီ
- [X] Application Architecture ကို နားလည်ထားပါပြီ
- [X] AZD တမ်းပလိတ် ဖွဲ့စည်းပုံကို စူးစမ်းကြည့်ပြီး ဖြစ်ပါသည်

ဤသည်က ဒီ template အတွက် ရှိသည့် _infrastructure as code_ အမြစ်များကို သဘောပေါက်စေပါသည်။ ထို့နောက်၊ AZD အတွက် configuration ဖိုင်ကို ကြည့်မည်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ကန့်သတ်ချက်**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အား အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်ရေးအတွက် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် ရေးသားထားသည့် အတိုင်း အာဏာပိုင် အရင်းအမြစ်အဖြစ် ကိုးကားသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာသည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
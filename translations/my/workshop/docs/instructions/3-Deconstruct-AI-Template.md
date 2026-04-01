# 3. Template ကို ခွဲစိတ်လေ့လာခြင်း

!!! tip "ဤမော်ဂျူး၏ အဆုံးတွင် သင် အောက်ပါများကို ပြုလုပ်နိုင်ပါမည်"

    - [ ] GitHub Copilot ကို Azure အကူအညီအတွက် MCP servers ဖြင့် စတင်ဖွင့်နိုင်မည်
    - [ ] AZD template ဖိုလ်ဒါ ဖွဲ့စည်းပုံနှင့် ပါဝင်ပစ္စည်းများကို နားလည်နိုင်မည်
    - [ ] infrastructure-as-code (Bicep) အဖွဲ့အစည်းပုံစံများကို လေ့လာနိုင်မည်
    - [ ] **Lab 3:** GitHub Copilot ကို အသုံးပြု၍ repository တည်ဆောက်ပုံကို လေ့လာ နားလည်နိုင်မည် 

---


AZD templates နှင့် Azure Developer CLI (`azd`) များကို အသုံးပြု၍ ဗဟုသုတရှိပြီး အသုံးပြုနိုင်သော နမူနာကိုဒ်များ၊ အင်ဖရာစ्ट्रပ်ချာနှင့် ဆက်တင်ဖိုင်များပါဝင်သည့် စံပြ repository များကို အသုံးပြုပြီး AI ဖွံ့ဖြိုးရေးခရီးစဉ်ကို အလျင်အမြန် စတင်နိုင်ပါသည် - အသင့်တင်ရန် _starter_ ပရောဂျက် အဖြစ်။

**ယခုအချိန်တွင်တော့၊ ပရောဂျက် ဖွဲ့စည်းပုံနှင့် ကိုးဒ်ဘေ့စ်ကို နားလည်ရမည်ဖြစ်ပြီး - AZD အကြောင်း အကြိုအသိမရှိဘဲ AZD template ကို ကိုယ်တိုင် ထပ်မံ အပြင်ပြင် ပြုလုပ်နိုင်ရမည်!**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

ယခုအခါ [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ကို လေ့လာဖို့ အချိန်ရောက်ပြီ။ ယခုမှ စ၍ သဘာဝဘာသာစကားဖြင့် ကျွန်တော်တို့၏ အလုပ်ကို အမြင်အရာကိန်း ထားပြီး သင့်အတွက် အကောင်အထည်ဖော်ရာတွင် အကူအညီ ရယူနိုင်သည်။ ဤ lab အတွက် ကျွန်တော်တို့သည် လစဉ် အပြည့်ဖြင့် ပြီးမြောက်မှုများနှင့် chat အင်တာ‌ယက်ရှင်းများအတွက် ကန့်သတ်ချက်ရှိသော [Copilot Free plan](https://github.com/github-copilot/signup) ကို အသုံးပြုပါမည်။

Extension ကို marketplace မှ တပ်ဆင်နိုင်ပြီး Codespaces သို့မဟုတ် dev container ပတ်ဝန်းကျင်များတွင် ပုံမှန်အားဖြင့် ရနိုင်ပြီဖြစ်ပါတယ်။ _Copilot icon dropdown မှ `Open Chat` ကို နှိပ်ပြီး `What can you do?` ကဲ့သို့သော prompt တစ်ခု ရိုက်ထည့်ပါ_ - အကောင့်ဝင်ရန် ဖိတ်ခေါ်နိုင်သည်။ **GitHub Copilot Chat အသင့် ဖြစ်ပါပြီ**။

### 1.2. Install MCP Servers

Agent mode က ထိရောက်စွာ လုပ်ဆောင်ရန်အတွက် သိကောင်းစရာများ ရယူပေးခြင်း သို့မဟုတ် လုပ်ဆောင်မှုများ လက်တွေ့ ထမ်းဆောင်ပေးနိုင်မည့် သင်္ချာတူကိရိယာများသို့ ဝင်ရောက်အသုံးပြုခွင့် လိုအပ်합니다။ ဒီနေရာမှာ MCP servers များက အကူအညီ ပေးနိုင်ပါသည်။ ကျွန်တော်တို့ အောက်ပါ servers များကို ဖွဲ့စည်းမည်ဖြစ်သည်။

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

ဤအရာများကို ဖွင့်ရန်:

1. `.vscode/mcp.json` ဆိုသော ဖိုင်ကို လိုအပ်ပါက ဖန်တီးပါ
1. အောက်ပါ အကြောင်းအရာကို ထိုဖိုင်ထဲ ထည့်၍ 서버များကို စတင်ပါ!
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

??? warning "npx がインストールされていないというエラーが出ることがあります（修正手順を見るには展開してください）"

      ပြဿနာကို ဖြေရှင်းရန်၊ `.devcontainer/devcontainer.json` ဖိုင်ကို ဖွင့်ပြီး features အပိုင်းတွင် အောက်ပါလိုင်းကို ထည့်ပါ။ ထို့နောက် container ကို ပြန်လည်တည်ဆောက်ပါ။ ယခု `npx` ထည့်သွင်းပြီး အသုံးပြုနိုင်နေပါပြီ။

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**ပထမဦးဆုံး VS Code command line တွင် Azure အသုံးပြုစေရန် `azd auth login` ကို အသုံးပြုကာ authentication ပြုလုပ်ပါ။ Azure CLI commands များကို တိုက်ရိုက် မရိုက်ရန် ရည်ရွယ်ပါက `az login` ကိုလည်း အသုံးပြုနိုင်သည်။**

ယခု သင့် Azure subscription အခြေအနေကို မေးမြန်းနိုင်ပြီး deploy လုပ်ထားသော resources များ သို့မဟုတ် configuration အကြောင်း မေးမြန်းနိုင်ပါပြီ။ အောက်ပါ prompts များကို စမ်းကြည့်ပါ။

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Microsoft Docs MCP server တွင် အခြေခံထားသော တုံ့ပြန်ချက်များကို ပြန်လည်ရနိုင်ရန် Azure စာရွက်စာတမ်းများအကြောင်း မေးမြန်းနိုင်ပါသည်။ အောက်ပါ prompts များကို စမ်းကြည့်ပါ။

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

သို့မဟုတ် တစ်ခုခု အလုပ္တစ်ခု ပြီးမြောက်အောင် ကုဒ် အပိုင်းအစများကို မေးမြန်းနိုင်သည်။ ဤ prompt ကို စမ်းကြည့်ပါ။

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` mode တွင်၊ ဤသည်က မင်းကော်ပီကာတ်ထုတ်ယူပြီး ကူးယူ အသုံးပြုနိုင်သော ကုဒ်ပုံစံကို ပေးပါလိမ့်မယ်။ `Agent` mode တွင်တော့ ပိုများပြီး သပ်ရပ်စွာ လိုအပ်သော resources များကို ဖန်တီးပေးခြင်း၊ setup scripts နှင့် စာရွက်စာတမ်းများကို အပြင်လက်များ အပြည့်အဝ ဖြတ်တောက်ပေးနိုင်သည်။

**ယခု သင်သည် template repository ကို လေ့လာရန် ပြင်ဆင်ပြီးဖြစ်ပါသည်**

---

## 2. Architecture ကို ခွဲစိတ်လေ့လာခြင်း

??? prompt "ASK: docs/images/architecture.png ဖိုင်ထဲရှိ application architecture ကို ၁ပိုဒ်စာဖြင့် ရှင်းပြပါ"

      ဤ application သည် Azure ပေါ်တွင် တည်ဆောက်ထားသော AI အခြေခံ chat application ဖြစ်ပြီး ယာယီ agent-based architecture ကို ပြသသည်။ ဖြေရှင်းချက်လက်တွင် Azure Container App တစ်ခု၌ မူလ application code ကို ဟိုက်စတင်ထားပြီး အသုံးပြုသူ အဝင်ဒေတာကို ဆက်လက်လုပ်ဆောင်ကာ AI agent မှ တုံ့ပြန်မှုအသစ်များကို ထုတ်ပေးသည်။
      
      architecture သည် Microsoft Foundry Project ကို AI စွမ်းရည်အခြေခံအဖြစ် အသုံးပြုကာ Azure AI Services (ဥပမာ gpt-4.1-mini) နှင့် agent လုပ်ဆောင်မှုများကို ချိတ်ဆက်ထားသည်။ အသုံးပြုသူ အပြန်အလှန်များသည် React အခြေပြု frontend မှ FastAPI backend သို့ ဖြတ်သန်းကာ AI agent service နှင့် ဆက်သွယ်၍ ပတ်သက်သောတုံ့ပြန်ချက်များကို ထုတ်ပေးသည်။
      
      စနစ်တွင် ဖိုင်ရှာဖွေရေး သို့မဟုတ် Azure AI Search service ကဲ့သို့သော knowledge retrieval စွမ်းရည်များကို ထည့်သွင်းထား므로 agent သည် အပ်လုတ်လုပ်ထားသော စာရွက်စာတမ်းများမှ သတင်းအချက်အလက်ကို ရယူ၍ အညွှန်းပြနိုင်သည်။
      
      စီမံခန့်ခွဲမှုအတွက် Application Insights နှင့် Log Analytics Workspace မှလည်း ကြီးကြပ်မှု၊ မှတ်တမ်းတင်ခြင်းနှင့် စွမ်းဆောင်ချက် အကောင်းမြင့်အတွက် စုံလင်သော မျက်နှာသာများ ပါဝင်သည်။
      
      Azure Storage သည် application data နှင့် ဖိုင်များအတွက် blob storage ကို ပံ့ပိုးပေးပြီး Managed Identity သည် Azure resources များအကြား လုံခြုံစိတ်ချရသော 접근မရှိဘဲ အသုံးပြုခွင့် ပေးသည်။ ဆက်လက်ထုတ်လုပ်နိုင်စွမ်းနှင့် ထိန်းသိမ်းရလွယ်ကူမှုအတွက် ဒီဖြေရှင်းချက်ကို containerize လုပ်ထားပြီး သက်ဆိုင်ရာ demand အပေါ် မူတည်၍ အလိုမှီ တိုက်ရိုက် scale ပြုလုပ်နိုင်သည်ဟု သိရှိရပြီး Azure ၏ managed services ecosystem မှ security၊ monitoring နှင့် CI/CD အတွက် ထောက်ပံ့ထားသည်။

![Architecture](../../../../../translated_images/my/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository ဖိုင်ဖွဲ့စည်းပုံ

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

ဤ template သည် **full-stack web application** ပုံစံကို လိုက်နာထားပြီး အောက်ပါအရာများ ပါဝင်သည်။

- **Backend**: Python FastAPI နှင့် Azure AI ပေါင်းစည်းမှု
- **Frontend**: TypeScript/React (Vite build system)
- **Infrastructure**: cloud resources များအတွက် Azure Bicep templates
- **Containerization**: တူညီသော deployment အတွက် Docker

### 3.2 Infra As Code (bicep)

အင်ဖရာစထရွက်ခြင်း အလွှာသည် **Azure Bicep** templates များကို modular အမျိုးအစားဖြင့် စီစဉ်ထားသည်။

   - **`main.bicep`**: အားလုံးသော Azure resources များကို အစုလိုက်စီမံခန့်ခွဲသည်
   - **`core/` modules**: ဝန်ဆောင်မှုများအလိုက် ပြန်အသုံးပြုနိုင်သော component များ
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Application Source (`src/`)

**Backend API (`src/api/`)**:

- FastAPI အခြေပြု REST API
- Foundry Agents ပေါင်းစည်းမှု
- Knowledge retrieval အတွက် Search index စီမံခန့်ခွဲမှု
- ဖိုင်တင်ခြင်းနှင့် ဖိုင်ကို ကောက်ယူ ပြုလုပ်နိုင်မှုများ

**Frontend (`src/frontend/`)**:

- ခေတ်မီ React/TypeScript SPA
- ဖွံ့ဖြိုးရေးအတွက် မြန်မာနှုန်း Vite အသုံးပြုမှုနှင့် optimized builds
- agent interaction များအတွက် chat interface

**Knowledge Base (`src/files/`)**:

- နမူနာ customer နှင့် product ဒေတာများ
- ဖိုင်အခြေပြု knowledge retrieval ကို ပြသခြင်း
- JSON နှင့် Markdown ဖိုင် နမူနာများ


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell နှင့် Bash scripts များ
- ပတ်ဝန်းကျင်အပြောင်းအလဲ စစ်ဆေးခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- Post-deployment configuration
- မော်ဒယ် quota စီမံခန့်ခွဲမှု

**Azure Developer CLI Integration**:

- `azure.yaml` တွင် `azd` workflows အတွက် ဆက်တင်များ
- အလိုအလျောက် provisioning နှင့် deployment
- ပတ်ဝန်းကျင် အပြောင်းအလဲများကို ထိန်းချုပ်ခြင်း

### 3.5 Testing & Quality Assurance

**Evaluation Framework (`evals/`)**:

- Agent performance အကဲဖြတ်မှု
- Query-response အရည်အသွေး စမ်းသပ်မှု
- အလိုအလျောက် အကဲဖြတ် pipeline

**AI Safety (`airedteaming/`)**:

- AI လုံခြုံရေးအတွက် Red team စမ်းသပ်မှုများ
- လုံခြုံရေး အားနည်းချက် စစ်ဆေးမှု
- တာဝန်ရှိသော AI လေ့လာမှု များ

---

## 4. ဝမ်းမြောက်ပါတယ် 🏆

သင်သည် MCP servers နှင့်အတူ GitHub Copilot Chat ကို အသုံးပြုပြီး repository ကို လေ့လာနိုင်ခဲ့ပါသည်။

- [X] GitHub Copilot ကို Azure အတွက် ဖွင့်ခဲ့ပြီးဖြစ်သည်
- [X] Application Architecture ကို နားလည်ခဲ့သည်
- [X] AZD template ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို လေ့လာခဲ့သည်

ဤအချက်များက ဒီ template အတွက် _infrastructure as code_ အရင်းအမြစ်များကို သင် သိရှိနိုင်စေပါသည်။ နောက်တစ်ဆင့်တွင် AZD ၏ configuration ဖိုင်ကို ကြည့်ရှုမည်။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်မှု ဝန်ဆောင်မှုဖြစ်သော [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုကို အာရုံစိုက်ပါသေးသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုမရှိနိုင်သည့် အချက်များ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် တရားဝင် အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်သည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် ပရဖက်ရှင်နယ် လူ့ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် အမှားဖတ်ရှုမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
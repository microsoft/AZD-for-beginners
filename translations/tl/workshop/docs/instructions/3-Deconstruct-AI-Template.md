# 3. Suriin ang Template

!!! tip "PAGKATAPOS NG MODULONG ITO AY MAGAGAWA MO ANG MGA SUMUSUNOD"

    - [ ] I-activate ang GitHub Copilot gamit ang MCP servers para sa tulong sa Azure
    - [ ] Unawain ang istruktura ng folder ng template ng AZD at ang mga bahagi nito
    - [ ] Suriin ang mga pattern ng organisasyon ng infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Gamitin ang GitHub Copilot para tuklasin at unawain ang arkitektura ng repositoryo 

---


Sa mga AZD template at ang Azure Developer CLI (`azd`) maaari nating mabilis na simulan ang ating paglalakbay sa AI development gamit ang mga standardized na repositoryo na nagbibigay ng sample na code, infrastructure at mga configuration file - sa anyo ng isang handa-na-i-deploy na _panimulang_ proyekto.

**Ngayon, kailangan nating unawain ang istruktura ng proyekto at ang codebase - at maging kakayahang i-customize ang AZD template - kahit walang naunang karanasan o pag-unawa sa AZD!**

---

## 1. I-activate ang GitHub Copilot

### 1.1 I-install ang GitHub Copilot Chat

Panahon na para tuklasin ang [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Ngayon, maaari nating gamitin ang natural na wika upang ilarawan ang ating gawain sa mataas na antas, at makakuha ng tulong sa pagpapatupad. Para sa lab na ito, gagamitin natin ang [Copilot Free plan](https://github.com/github-copilot/signup) na may buwanang limitasyon para sa completions at chat interactions.

Ang extension ay maaaring i-install mula sa marketplace, ngunit dapat ay mayroon na ito sa iyong Codespaces environment. _I-click ang `Open Chat` mula sa Copilot icon drop-down - at mag-type ng prompt tulad ng `What can you do?`_ - maaaring hilingin sa iyo na mag-login. **Handa na ang GitHub Copilot Chat**.

### 1.2. I-install ang MCP Servers

Para maging epektibo ang Agent mode, kailangan nito ng access sa tamang mga tool upang makatulong sa pagkuha ng kaalaman o gumawa ng mga aksyon. Dito nakakatulong ang mga MCP servers. Ia-configure natin ang mga sumusunod na server:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Upang i-activate ang mga ito:

1. Gumawa ng file na pinangalanang `.vscode/mcp.json` kung wala pa ito
1. Kopyahin ang sumusunod sa file na iyon - at simulan ang mga server!
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

??? warning "Maaaring makakita ka ng error na hindi naka-install ang `npx` (i-click para palawakin at ayusin)"

      Upang ayusin ito, buksan ang file na `.devcontainer/devcontainer.json` at idagdag ang linyang ito sa features section. Pagkatapos, i-rebuild ang container. Dapat mayroon ka nang naka-install na `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Subukan ang GitHub Copilot Chat

**Una gamitin ang `az login` para mag-authenticate sa Azure mula sa VS Code command line.**

Dapat ngayon ay maaari mo nang i-query ang status ng iyong Azure subscription, at magtanong tungkol sa mga deployed na resources o configuration. Subukan ang mga prompt na ito:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Maaari ka ring magtanong tungkol sa dokumentasyon ng Azure at makakuha ng mga sagot na naka-base sa Microsoft Docs MCP server. Subukan ang mga prompt na ito:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

O maaari kang humingi ng mga code snippet upang kumpletuhin ang isang gawain. Subukan ang prompt na ito.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Sa `Ask` mode, magbibigay ito ng code na maaari mong kopyahin at subukan. Sa `Agent` mode, maaaring gawin nito ang isang hakbang pa at likhain ang mga kaugnay na resources para sa iyo - kasama ang setup scripts at dokumentasyon - upang tulungan kang isakatuparan ang gawain.

**Handa ka na ngayon upang simulan ang pagtuklas sa template repositoryo**

---

## 2. Suriin ang Arkitektura

??? prompt "HILING: Ipaliwanag ang arkitektura ng aplikasyon sa docs/images/architecture.png sa 1 talata"

      Ang aplikasyon na ito ay isang AI-powered chat application na itinayo sa Azure na nagpapakita ng modernong agent-based na arkitektura. Ang solusyon ay nakasentro sa isang Azure Container App na nagho-host ng pangunahing code ng aplikasyon, na nagpo-proseso ng input ng user at bumubuo ng matalinong mga tugon sa pamamagitan ng isang AI agent. 
      
      Pinapakinabangan ng arkitektura ang Microsoft Foundry Project bilang pundasyon para sa mga kakayahan ng AI, na kumokonekta sa Azure AI Services na nagbibigay ng mga underlying language models (tulad ng gpt-4.1-mini) at agent functionality. Dumadaloy ang interaksyon ng user mula sa isang React-based frontend papunta sa isang FastAPI backend na nakikipag-ugnayan sa AI agent service para bumuo ng mga contextual na tugon. 
      
      May kakayahan ang sistema na magsagawa ng knowledge retrieval sa pamamagitan ng file search o Azure AI Search service, na nagpapahintulot sa agent na ma-access at mag-cite ng impormasyon mula sa mga na-upload na dokumento. Para sa operational excellence, kasama sa arkitektura ang komprehensibong monitoring gamit ang Application Insights at Log Analytics Workspace para sa tracing, logging, at pag-optimize ng performance. 
      
      Ang Azure Storage ay nagbibigay ng blob storage para sa data ng aplikasyon at file uploads, habang tinitiyak ng Managed Identity ang secure na access sa pagitan ng mga Azure resources nang hindi nag-iimbak ng mga kredensyal. Dinisenyo ang buong solusyon para sa scalability at maintainability, na ang containerized na aplikasyon ay awtomatikong nag-scale base sa demand habang nagbibigay ng built-in na seguridad, monitoring, at CI/CD capabilities sa pamamagitan ng Azure's managed services ecosystem.

![Arkitektura](../../../../../translated_images/tl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Istruktura ng Repositoryo

!!! prompt "HILING: Ipaliwanag ang istruktura ng folder ng template. Magsimula sa isang biswal na hierarkikal na diagram."

??? info "SAGOT: Biswal na Hierarkikal na Diagram"

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

### 3.1. Pangunahing Arkitektura ng App

Sinasunod ng template na ito ang isang **full-stack web application** na pattern na may:

- **Backend**: Python FastAPI na may Azure AI integration
- **Frontend**: TypeScript/React na may Vite build system
- **Infrastructure**: Azure Bicep templates para sa cloud resources
- **Containerization**: Docker para sa consistent na deployment

### 3.2 Infra As Code (bicep)

Ang infrastructure layer ay gumagamit ng **Azure Bicep** templates na nakaayos nang modular:

   - **`main.bicep`**: Nag-orchestrate ng lahat ng Azure resources
   - **`core/` modules**: Reusable na mga component para sa iba't ibang serbisyo
      - AI services (Microsoft Foundry Models, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Pinagmulan ng Aplikasyon (`src/`)

**Backend API (`src/api/`)**:

- REST API na naka-base sa FastAPI
- Integrasyon sa Foundry Agents
- Management ng search index para sa knowledge retrieval
- Kakayahang mag-upload at mag-proseso ng mga file

**Frontend (`src/frontend/`)**:

- Modernong React/TypeScript SPA
- Vite para sa mabilis na development at optimized builds
- Chat interface para sa interaksyon sa agent

**Knowledge Base (`src/files/`)**:

- Mga sample na data ng customer at produkto
- Nagpapakita ng file-based na knowledge retrieval
- Mga halimbawa sa JSON at Markdown format


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- Cross-platform PowerShell at Bash scripts
- Pag-validate at pagsesetup ng environment
- Post-deployment na configuration
- Pamamahala ng model quota

**Integrasyon ng Azure Developer CLI**:

- `azure.yaml` configuration para sa `azd` workflows
- Awtomatikong provisioning at deployment
- Pamamahala ng environment variables

### 3.5 Pagsusulit at Pagtiyak ng Kalidad

**Evaluation Framework (`evals/`)**:

- Pagsusuri ng performance ng agent
- Pagsubok sa kalidad ng query-response
- Awtomatikong assessment pipeline

**AI Safety (`airedteaming/`)**:

- Red team testing para sa AI safety
- Pag-scan ng security vulnerabilities
- Responsible AI practices

---

## 4. Binabati Kita 🏆

Matagumpay mong nagamit ang GitHub Copilot Chat kasama ang MCP servers upang tuklasin ang repositoryo.

- [X] Na-activate ang GitHub Copilot para sa Azure
- [X] Naunawaan ang Arkitektura ng Aplikasyon
- [X] Naituklas ang istruktura ng AZD template

Ipinapakita nito sa iyo ang mga _infrastructure as code_ na mga asset para sa template na ito. Sunod, titingnan natin ang configuration file para sa AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring bilang may awtoridad. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
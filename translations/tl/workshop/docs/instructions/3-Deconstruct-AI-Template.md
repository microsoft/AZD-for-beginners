# 3. Pag-deconstruct ng Template

!!! tip "SA PAGTATAPOS NG MODYUL NA ITO MAAARI MONG"

    - [ ] I-activate ang GitHub Copilot gamit ang mga MCP server para sa tulong sa Azure
    - [ ] Maunawaan ang estruktura ng folder at mga bahagi ng AZD template
    - [ ] Siyasatin ang mga pattern ng organisasyon para sa infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Gamitin ang GitHub Copilot para siyasatin at maunawaan ang arkitektura ng repositoryo 

---


Sa mga AZD template at ang Azure Developer CLI (`azd`) maaari nating mabilis na simulan ang ating paglalakbay sa pag-develop ng AI gamit ang mga standardisadong repositoryo na nagbibigay ng sample code, imprastruktura at mga file ng konfigurasyon - sa anyo ng isang handa-na-i-deploy na _starter_ project.

**Ngunit ngayon, kailangan nating maunawaan ang istruktura ng proyekto at codebase - at maging kakayahang i-customize ang AZD template - kahit walang anumang paunang karanasan o pag-unawa sa AZD!**

---

## 1. I-activate ang GitHub Copilot

### 1.1 I-install ang GitHub Copilot Chat

Panahon na para tuklasin ang [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Ngayon, maaari nating gamitin ang natural na wika upang ilarawan ang ating gawain sa mataas na antas, at makakuha ng tulong sa pagpapatupad. Para sa lab na ito, gagamitin natin ang [Copilot Free plan](https://github.com/github-copilot/signup) na may buwanang limitasyon para sa completions at chat interactions.

Maaaring i-install ang extension mula sa marketplace, pero dapat ay mayroon na ito sa iyong Codespaces environment. _I-click ang `Open Chat` mula sa Copilot icon drop-down - at i-type ang prompt tulad ng `What can you do?`_ - maaaring hilingin sa iyo na mag-log in. **Handa na ang GitHub Copilot Chat**.

### 1.2. I-install ang MCP Servers

Para maging epektibo ang Agent mode, kailangan nito ng access sa tamang mga tool para tulungan itong kumuha ng kaalaman o gumawa ng mga aksyon. Dito makakatulong ang MCP servers. Iko-configure natin ang mga sumusunod na server:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Para i-activate ang mga ito:

1. Gumawa ng file na tinatawag `.vscode/mcp.json` kung hindi pa ito umiiral
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

??? warning "Maaaring lumabas ang error na `npx` ay hindi naka-install (i-click para palawakin at ayusin)"

      Upang ayusin ito, buksan ang file na `.devcontainer/devcontainer.json` at idagdag ang linyang ito sa seksyon ng features. Pagkatapos ay i-rebuild ang container. Dapat mayroon ka nang `npx` na naka-install.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3. Subukan ang GitHub Copilot Chat

**Gamitin muna ang `az login` para mag-authenticate sa Azure mula sa command line ng VS Code.**

Dapat maaari mo nang i-query ang status ng iyong Azure subscription, at magtanong tungkol sa mga naka-deploy na resources o konfigurasyon. Subukan ang mga sumusunod na prompt:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Maaari ka ring magtanong tungkol sa dokumentasyon ng Azure at makakuha ng mga tugon na nakabase sa Microsoft Docs MCP server. Subukan ang mga sumusunod na prompt:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

O maaari kang humiling ng mga code snippet upang kumpletuhin ang isang gawain. Subukan ang prompt na ito.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Sa `Ask` mode, magbibigay ito ng code na maaari mong kopyahin at subukan. Sa `Agent` mode, maaari itong magpatuloy pa at likhain ang mga kaugnay na resources para sa iyo - kasama ang mga setup script at dokumentasyon - upang tulungan kang isakatuparan ang gawain na iyon.

**Handa ka na ngayong magsimulang siyasatin ang repositoryo ng template**

---

## 2. I-deconstruct ang Arkitektura

??? prompt "TANONG: Ipaliwanag ang arkitektura ng aplikasyon sa docs/images/architecture.png sa 1 talata"

      Ang aplikasyon na ito ay isang AI-powered na chat application na binuo sa Azure na nagpapakita ng isang modernong agent-based na arkitektura. Ang solusyon ay nakasentro sa isang Azure Container App na nagho-host ng pangunahing code ng aplikasyon, na pinoproseso ang input ng user at bumubuo ng mga intelligent na tugon sa pamamagitan ng isang AI agent. 
      
      Ang arkitektura ay gumagamit ng Microsoft Foundry Project bilang pundasyon para sa mga kakayahan ng AI, na kumokonekta sa Azure AI Services na nagbibigay ng mga underlying language model (tulad ng GPT-4o-mini) at functionality ng agent. Ang mga interaksyon ng user ay dumadaloy mula sa isang React-based na frontend patungo sa isang FastAPI backend na nakikipag-ugnayan sa AI agent service para bumuo ng mga contextual na tugon. 
      
      Isinasama ng sistema ang mga kakayahan sa pagkuha ng kaalaman sa pamamagitan ng alinman sa file search o Azure AI Search service, na nagpapahintulot sa agent na ma-access at mag-cite ng impormasyon mula sa mga na-upload na dokumento. Para sa mahusay na operasyon, kasama sa arkitektura ang komprehensibong pagmo-monitor sa pamamagitan ng Application Insights at Log Analytics Workspace para sa tracing, logging, at pag-optimize ng performance. 
      
      Nagbibigay ang Azure Storage ng blob storage para sa data ng aplikasyon at pag-upload ng mga file, habang tinitiyak ng Managed Identity ang secure na access sa pagitan ng mga Azure resources nang hindi nag-iimbak ng mga kredensyal. Ang buong solusyon ay dinisenyo para sa scalability at maintainability, kung saan ang containerized na aplikasyon ay awtomatikong nag-scale batay sa demand habang nagbibigay ng built-in na seguridad, pagmo-monitor, at CI/CD na mga kakayahan sa pamamagitan ng managed services ecosystem ng Azure.

![Arkitektura](../../../../../translated_images/tl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Estruktura ng Repositoryo

!!! prompt "TANONG: Ipaliwanag ang istruktura ng folder ng template. Magsimula sa isang biswal na hierarkikal na diagram."

??? info "SAGOT: Biswal na Hierarkikal na Diagram"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurasyon at Pag-setup
      │   ├── azure.yaml                    # Konfigurasyon ng Azure Developer CLI
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Imprastruktura (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # Mga konfigurasyon ng serbisyo ng AI
      │       ├── host/                     # Hosting na imprastruktura
      │       ├── monitor/                  # Pagmo-monitor at pag-log
      │       ├── search/                   # Setup ng Azure AI Search
      │       ├── security/                 # Seguridad at identidad
      │       └── storage/                  # Mga konfigurasyon ng storage account
      │
      ├── 💻 Pinagmulan ng Aplikasyon (src/)
      │   ├── api/                          # API ng Backend
      │   │   ├── main.py                   # Entry ng aplikasyon ng FastAPI
      │   │   ├── routes.py                 # Mga definisyon ng ruta ng API
      │   │   ├── search_index_manager.py   # Pag-andar ng paghahanap
      │   │   ├── data/                     # Pagpaproseso ng data ng API
      │   │   ├── static/                   # Mga static na asset ng web
      │   │   └── templates/                # Mga template ng HTML
      │   ├── frontend/                     # Frontend na React/TypeScript
      │   │   ├── package.json              # Mga dependency ng Node.js
      │   │   ├── vite.config.ts            # Konfigurasyon ng build ng Vite
      │   │   └── src/                      # Pinagmulan ng source ng frontend
      │   ├── data/                         # Mga sample na file ng data
      │   │   └── embeddings.csv            # Paunang kalkuladong embeddings
      │   ├── files/                        # Mga file ng knowledge base
      │   │   ├── customer_info_*.json      # Mga sample ng data ng customer
      │   │   └── product_info_*.md         # Dokumentasyon ng produkto
      │   ├── Dockerfile                    # Konfigurasyon ng container
      │   └── requirements.txt              # Mga dependency ng Python
      │
      ├── 🔧 Awtomasyon at Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Setup pagkatapos ng deployment
      │   ├── setup_credential.sh/.ps1     # Konfigurasyon ng kredensyal
      │   ├── validate_env_vars.sh/.ps1    # Pag-validate ng mga environment variable
      │   └── resolve_model_quota.sh/.ps1  # Pamamahala ng quota ng modelo
      │
      ├── 🧪 Pagsubok at Ebalwasyon
      │   ├── tests/                        # Mga unit at integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework para sa ebalwasyon ng agent
      │   │   ├── evaluate.py               # Tagapagpatakbo ng ebalwasyon
      │   │   ├── eval-queries.json         # Mga query para sa pagsubok
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Playground para sa pag-develop
      │   │   ├── 1-quickstart.py           # Mga halimbawa para sa pagsisimula
      │   │   └── aad-interactive-chat.py   # Mga halimbawa ng authentication
      │   └── airedteaming/                 # Ebalwasyon ng kaligtasan ng AI
      │       └── ai_redteaming.py          # Pagsubok ng red team
      │
      ├── 📚 Dokumentasyon (docs/)
      │   ├── deployment.md                 # Gabay sa deployment
      │   ├── local_development.md          # Mga instruksiyon para sa lokal na setup
      │   ├── troubleshooting.md            # Mga karaniwang isyu at mga solusyon
      │   ├── azure_account_setup.md        # Mga kinakailangan para sa Azure
      │   └── images/                       # Mga asset ng dokumentasyon
      │
      └── 📄 Metadata ng Proyekto
         ├── README.md                     # Pangkalahatang-ideya ng proyekto
         ├── CODE_OF_CONDUCT.md           # Mga patakaran ng komunidad
         ├── CONTRIBUTING.md              # Gabay sa kontribusyon
         ├── LICENSE                      # Mga termino ng lisensya
         └── next-steps.md                # Patnubay pagkatapos ng deployment
      ```

### 3.1. Pangunahing Arkitektura ng App

Ang template na ito ay sumusunod sa pattern ng **full-stack na aplikasyong web** na may:

- **Backend**: Python FastAPI na may integrasyon sa Azure AI
- **Frontend**: TypeScript/React na may Vite build system
- **Imprastruktura**: Azure Bicep templates para sa mga cloud resources
- **Containerization**: Docker para sa pare-parehong deployment

### 3.2 Infra Bilang Code (bicep)

Ang layer ng imprastruktura ay gumagamit ng mga template ng **Azure Bicep** na inayos nang modular:

   - **`main.bicep`**: Pinamamahalaan ang lahat ng Azure resources
   - **`core/` modules**: Mga bahagi na magagamit muli para sa iba't ibang serbisyo
      - Serbisyo ng AI (Azure OpenAI, AI Search)
      - Hosting ng container (Azure Container Apps)
      - Pagmo-monitor (Application Insights, Log Analytics)
      - Seguridad (Key Vault, Managed Identity)

### 3.3 Pinagmulan ng Aplikasyon (`src/`)

**API ng Backend (`src/api/`):**

- REST API na batay sa FastAPI
- Integrasyon ng Foundry Agents
- Pamamahala ng search index para sa pagkuha ng kaalaman
- Mga kakayahan sa pag-upload at pagproseso ng mga file

**Frontend (`src/frontend/`):**

- Modernong React/TypeScript SPA
- Vite para sa mabilis na development at optimized na builds
- Chat interface para sa pakikipag-ugnayan sa agent

**Knowledge Base (`src/files/`):**

- Mga sample na data ng customer at produkto
- Nagpapakita ng pagkuha ng kaalaman batay sa mga file
- Mga halimbawa sa format na JSON at Markdown


### 3.4 DevOps at Awtomasyon

**Mga Script (`scripts/`):**

- Cross-platform na mga PowerShell at Bash script
- Pag-validate at setup ng environment
- Konfigurasyon pagkatapos ng deployment
- Pamamahala ng quota ng modelo

**Integrasyon ng Azure Developer CLI**:

- Konfigurasyon na `azure.yaml` para sa mga workflow ng `azd`
- Awtomatikong provisioning at deployment
- Pamamahala ng mga environment variable

### 3.5 Pagsusuri at Pagtiyak ng Kalidad

**Framework ng Ebalwasyon (`evals/`):**

- Pagsusuri ng performance ng agent
- Pagsusuri ng kalidad ng query-response
- Awtomatikong pipeline ng pagtatasa

**Kaligtasan ng AI (`airedteaming/`):**

- Red team testing para sa kaligtasan ng AI
- Pag-scan ng mga kahinaan sa seguridad
- Mga responsableng kasanayan sa AI

---

## 4. Pagbati 🏆

Matagumpay mong ginamit ang GitHub Copilot Chat kasama ang MCP servers upang siyasatin ang repositoryo.

- [X] Na-activate ang GitHub Copilot para sa Azure
- [X] Naunawaan ang Arkitektura ng Aplikasyon
- [X] Nasiyasat ang estruktura ng AZD template

Ito ay nagbibigay sa iyo ng ideya tungkol sa mga asset ng _imprastruktura bilang code_ para sa template na ito. Susunod, titingnan natin ang file ng konfigurasyon para sa AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin ng AI na Co‑op Translator (https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga error o kamalian. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
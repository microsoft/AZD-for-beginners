# 3. ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ವಿಭಜಿಸಿ

!!! tip "ಈ ಘಟಕದ ಅಂತ್ಯಕ್ಕೆ ನೀವು ಕೆಳಗಿನವುಗಳನ್ನು ಮಾಡಬಲ್ಲಿರಿ"

    - [ ] GitHub Copilot ಅನ್ನು Azure ನೆರವಿಗಾಗಿ MCP ಸರ್ವರ್‌ಗಳೊಂದಿಗೆ ಸಕ್ರಿಯಗೊಳಿಸಿ
    - [ ] AZD ಟೆಂಪ್ಲೇಟ್ ಫೋಲ್ಡರ್ ರಚನೆ ಮತ್ತು घटಕಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
    - [ ] Infrastructure-as-code (Bicep) ಸಂಘಟನೆ ಮಾದರಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    - [ ] **ಲ್ಯಾಬ್ 3:** GitHub Copilot ಅನ್ನು ಬಳಸಿ ರೆಪೊ ಆರ್ಕಿಟೆಕ್ಚರ್ ಅನ್ನು ಅನ್ವೇಷಿಸಿ ಮತ್ತು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ 

---


AZD ಟೆಂಪ್ಲೇಟ್‌ಗಳ ಮತ್ತು Azure Developer CLI (`azd`) ಬಳಸಿ, ನಾವು ಮಾದರಿ ಕೋಡ್, ಅಭ್ಯಾಸಗಳನ್ನು ಮತ್ತು ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ಒದಗಿಸುವ ಸಿದ್ಧ-ನಿರ್ವಹಣಾ _ಆರಂಭಿಕ_ ಪ್ರಾಜೆಕ್ಟ್ ರೂಪದಲ್ಲಿರುವ ಸ್ಟ್ಯಾಂಡರ್ಡ್ ರೆಪೊಗಳೊಂದಿಗೆ ನಮ್ಮ AI ಅಭಿವೃದ್ಧಿ ಪ್ರಯಾಣವನ್ನು ತ್ವರಿತಗೊಳಿಸಬಹುದು.

**ಆದರೆ ಈಗ, ನಾವು ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ ಮತ್ತು ಕೋಡ್ ಬೇಸ್ ಅನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬೇಕು - ಮತ್ತು AZD ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಯಾವುದೇ পূর্বಾನುಭವ ಅಥವಾ AZD ತಿಳಿವಳಿಕೆ ಇಲ್ಲದೆ ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದಾಗಿರಬೇಕು!**

---

## 1. GitHub Copilot ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ

### 1.1 GitHub Copilot Chat ಅನ್ನು ಸ್ಥಾಪಿಸಿ

ಈಗ [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ಅನ್ನು ಅನ್ವೇಷಿಸಲು ಸಮಯವಾಗಿದೆ. ಈಗ ನಾವು ಟಾಸ్క್ ಅನ್ನು ಮೇಲ್ನೋಟದಲ್ಲಿ ವಿವರಿಸಲು ಸಹಜ ಭಾಷೆಯನ್ನು ಬಳಸಬಹುದು ಮತ್ತು ಕಾರ್ಯಗತಗೊಳಿಸುವಿಕೆಯಲ್ಲಿ ಸಹಾಯವನ್ನು ಪಡೆಯಬಹುದು. ಈ ಲ್ಯಾಬ್‌ಗಾಗಿ, ನಾವು ತಿಂಗಳಾಕೆಂಪದ ಪೂರ್ಣಗೊಳನೆಗಳು ಮತ್ತು ಚಾಟ್ ಸಂವಾದಗಳ ಮಿತಿ ಹೊಂದಿರುವ [Copilot Free plan](https://github.com/github-copilot/signup) ಅನ್ನು ಬಳಸುತ್ತೇವೆ.

ವಿಸ್ತರಣೆವನ್ನು ಮಾರ್ಕೆಟ್ಪ್ಲೇಸ್‌ದಿಂದ ಇನ್ಸ್ಟಾಲ್ ಮಾಡಬಹುದಾಗಿದೆ, ಆದರೆ ಅದು ನಿಮ್ಮ Codespaces ಪರಿಸರದಲ್ಲಿ ಹಿಂದೆಯೇ ಲಭ್ಯವಿರಬಹುದು. _Copilot ಐಕಾನ್ ಡ್ರಾಪ್-ಡೌನ್‌ನಿಂದ `Open Chat` ಕ್ಲಿಕ್ ಮಾಡಿ - ಮತ್ತು `What can you do?` ಎಂಬಂತೆ ಪ್ರಾಂಪ್ಟ್ ಟೈಪ್ ಮಾಡಿ._ - ನಿಮಗೆ ಲಾಗಿನ್ ಮಾಡಲು ವಿನಂತಿಸಬಹುದು. **GitHub Copilot Chat ಸಿದ್ದವಾಗಿದೆ**.

### 1.2. MCP ಸರ್ವರ್‌ಗಳನ್ನು ಸ್ಥಾಪಿಸಿ

Agent ಮೋಡ್ ಪರಿಣಾಮಕಾರಿ ಆಗಲು, ಅದು ಜ್ಞಾನದynu ಪಡೆಯಲು ಅಥವಾ ಕ್ರಿಯೆಗಳನ್ನು ಕೈಗೊಳ್ಳಲು ಸರಿಯಾದ ಸಾಧನಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿರಬೇಕು. ಇದು MCP ಸರ್ವರ್‌ಗಳು ಸಹಾಯ ಮಾಡುವ ಸ್ಥಳ. ನಾವು ಕೆಳಗಿನ ಸರ್ವರ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತೇವೆ:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

ಇದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲು:

1. `.vscode/mcp.json` ಎಂಬ ಫೈಲ್ ಅನ್ನು ಸೃಷ್ಟಿಸಿ (ಅದಾಗದಿದ್ದರೆ)
1. ಆ ಫೈಲ್‌ಗೆ ಕೆಳಗಿನದು ನಕಲಿಸಿ - ಮತ್ತು ಸರ್ವರ್‌ಗಳನ್ನು ಪ್ರಾರಂಭಿಸಿ!
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

??? warning "ನಿಮಗೆ `npx` ಇನ್‌ಸ್ಟಾಲ್ ಆಗಿಲ್ಲವೆಂದಾದರೆ 오류 ಸಿಗಬಹುದು (ದೋಷ ನिवारಣೆಗೆ ವಿಸ್ತರಿಸಲು ಕ್ಲಿಕ್ ಮಾಡಿ)"

      ಇದನ್ನು ಸರಿಪಡಿಸಲು, `.devcontainer/devcontainer.json` ಫೈಲ್ ಅನ್ನು ತೆರೆಯಿರಿ ಮತ್ತು features ವಿಭಾಗಕ್ಕೆ ಈ ಲೈನ್ ಅನ್ನು ಸೇರಿಸಿ. ನಂತರ ಕಂಟೈನರ್ ಅನ್ನು ಪುನರ್‌ನirma ಮಾಡಿ. ಈಗ ನಿಮಗೆ `npx` ಇನ್‌ಸ್ಟಾಲ್ ಆಗಿರಬೇಕು.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3. GitHub Copilot Chat ಅನ್ನು ಪರೀಕ್ಷಿಸಿ

**ಮೊದಲು VS Code ಕಮಾಂಡ್ ಲೈನಿನಿಂದ Azure ಗೆ ಪ್ರಮಾಣೀಕರಿಸಲು `az login` ಬಳಸಿ.**

ಈಗ ನೀವು ನಿಮ್ಮ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಸ್ಥಿತಿಯನ್ನು ಪ್ರಶ್ನಿಸಿ, ನೇಮಕಗೊಳಿಸಿದ ಸಂಪನ್ಮೂಲಗಳು ಅಥವಾ ಸಂರಚನೆ ಬಗ್ಗೆ ಪ್ರಶ್ನೆಗಳನ್ನು ಕೇಳುವ ಸಾಮರ್ಥ್ಯ ಹೊಂದಿರಬೇಕು. ಈ ಪ್ರಾಂಪ್ಟ್ ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

ನೀವು Microsoft Docs MCP ಸರ್ವರ್ ಆಧಾರಿತ ಉತ್ತರಗಳನ್ನು ಪಡೆಯಲು Azure ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಬಗ್ಗೆ ಪ್ರಶ್ನೆಗಳನ್ನು ಕೇಳಬಹುದು. ಈ ಪ್ರಾಂಪ್ಟ್ ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

ಅಥವಾ ಕಾರ್ಯವನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ಕೋಡ್ ಸ్నಿಪೆಟ್‌ಗಳನ್ನು ಕೇಳಬಹುದು. ಈ ಪ್ರಾಂಪ್ಟ್ ಅನ್ನು ಪ್ರಯತ್ನಿಸಿ.

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` ಮೋಡ್‌ನಲ್ಲಿ, ಇದೊಂದು ಕೋಡ್ ಒದಗಿಸುತ್ತದೆ ಅಥವಾ ನೀವು ನಕಲಿಸಿ-ಅಂಟಿಸಿ ಪ್ರಯತ್ನಿಸಬಹುದು. `Agent` ಮೋಡ್‌ನಲ್ಲಿ, ಇದು ಒಂದು ಹಂತ ಮುಂದೆ ಹೋಗಿ ಸಂಬಂಧಿತ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಕೂಡ ಸೃಷ್ಟಿಸಬಹುದು - ಸ್ಥಾಪನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ಮತ್ತು ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಸೇರಿ - ನಿಮ್ಮ ಕೆಲಸವನ್ನು ಕೈಗೊಳ್ಳಲು ಸಹಾಯ ಮಾಡಲು.

**ನೀವು ಈಗ ಟೆಂಪ್ಲೇಟ್ ರೆಪೊವನ್ನು ಅನ್ವೇಷಿಸಲು ಸಜ್ಜಾಗಿದ್ದೀರಿ**

---

## 2. ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ವಿಭಜಿಸಿ

??? prompt "ASK: docs/images/architecture.png ಫೈಲ್‌ನಲ್ಲಿರುವ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು 1 ಪ್ಯಾರಾಗ್ರಾಫ್‌ನಲ್ಲಿ ವಿವರಿಸಿ"

      ಈ ಅಪ್ಲಿಕೇಶನ್ ಒಂದು Azure ಆಧಾರಿತ AI-ಚಾಲಿತ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಆಗಿದ್ದು, ಆಧುನಿಕ ಏಜೆಂಟ್-ಆಧಾರಿತ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ತೋರಿಸುತ್ತದೆ. ಪರಿಹಾರದ ಕೇಂದ್ರದಲ್ಲಿ ಮುಖ್ಯ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಹೋಸ್ಟ್ ಮಾಡುವ Azure Container App ಇದ್ದು, ಅದು ಬಳಕೆದಾರರ ಇನ್‌ಪುಟ್ ಅನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಿ AI ಏಜೆಂಟ್ ಮೂಲಕ ಬುದ್ಧಿವಂತಿಕೆಯ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ರಚಿಸುತ್ತದೆ. 
      
      ವಾಸ್ತುಶಿಲ್ಪವು AI ಸಾಮರ್ಥ್ಯಗಳಿಗಾಗಿ Microsoft Foundry Project ನನ್ನು ಆಧಾರವಾಗಿ ಬಳಸುತ್ತದೆ, ಮತ್ತು ಅಡಿಯಲ್ಲಿ ಭಾಷಾ ಮಾದರಿಗಳು (ಉದಾಹರಣೆಗೆ GPT-4o-mini) ಮತ್ತು ಏಜೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಒದಗಿಸುವ Azure AI ಸೇವೆಗಳಿಗೆ ಸಂಪರ್ಕ ಹೊಂದಿದೆ. ಬಳಕೆದಾರರ ಪರಸ್ಪರಕ್ರಿಯೆಗಳು React ಆಧಾರಿತ ಫ್ರಂಟ್‌ಎಂಡ್ ಮೂಲಕ Flow ಆಗಿ, AI ಏಜೆಂಟ್ ಸೇವೆಗೆ ಸಂವಹನ ನೀಡುವ FastAPI ಬ್ಯಾಕ್ಎಂಡ್‌ಗೆ ಹೋಗುತ್ತವೆ, ಮತ್ತು ಸಾಂದರ್ಭಿಕ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ರಚಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. 
      
      ವ್ಯವಸ್ಥೆ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳು ಅಪ್‌ಲೋಡ್ ಮಾಡಲಾದ ನಂತರ ಏಜೆಂಟ್‌ಗೆ ಮಾಹಿತಿ ಆಕ್ಸೆಸ್ ಮತ್ತು ಉಲ್ಲೇಖಿಸಲು ಫೈಲ್ ಶೋಧನೆ ಅಥವಾ Azure AI Search ಸೇವೆ ಮೂಲಕ ಜ್ಞಾನ ಪುನರ್‌ಪ್ರಾಪ್ತಿಯ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ಕಾರ್ಯಾಚರಣಾತ್ಮಕ գերತೆಯನ್ನು ನಿಭಾಯಿಸಲು, ವಾಸ್ತುಶಿಲ್ಪವು ಟ್ರೇಸಿಂಗ್, ಲಾಗಿಂಗ್ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆ ಪರಿಷ್ಕಾರಕ್ಕಾಗಿ Application Insights ಮತ್ತು Log Analytics Workspace ಮೂಲಕ ಸಂಪೂರ್ಣ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಒಳಗೊಂಡಿದೆ. 
      
      ಅಪ್ಲಿಕೇಶನ್ ಡೇಟಾ ಮತ್ತು ಫೈಲ್ ಅಪ್‌ಲೋಡ್‌ಗಳಿಗಾಗಿ Azure Storage ಬ್ಲಾಬ್‌ ಸ್ಟೋರೇಜ್ ಅನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮತ್ತು Managed Identity Azure ಸಂಪನ್ಮೂಲಗಳ ನಡುವೆ ರಹಸ್ಯಗಳನ್ನು ಸಂಗ್ರಹಿಸದೆ ಸುರಕ್ಷಿತ ಪ್ರವೇಶವನ್ನು ಖಚಿತಪಡಿಸುತ್ತದೆ.ರೂಪಾದ ಮೊದಲಾದ್ದರಿಂದ ಸಂಪೂರ್ಣ ಪರಿಹಾರ ವಿನ್ಯಾಸವು ಅಗತ್ಯವನ್ನು ಆಧರಿಸಿ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸ್ಕೇಲ್ ಆಗುವಂತೆಯೂ, ಬಿಲ್ಟ್-ಇನ್ ಸುರಕ್ಷತೆ, ಮಾನಿಟರಿಂಗ್ ಮತ್ತು CI/CD ಸಾಮರ್ಥ್ಯಗಳನ್ನು Azure ನ ನಿರ್ವಹಿತ ಸೇವೆಗಳ ಮೂಲಕ ಒದಗಿಸುವಂತೆ ರೂಪುಗೊಂಡಿದೆ.

![ವಾಸ್ತುಶಿಲ್ಪ](../../../../../translated_images/kn/architecture.48d94861e6e6cdc0.webp)

---

## 3. ರೆಪೊ ರಚನೆ

!!! prompt "ASK: ಟೆಂಪ್ಲೇಟು ಫೋಲ್ಡರ್ ರಚನೆಯನ್ನು ವಿವರಿಸಿ. ವಿಸ್ವಯ ದೃಶ್ಯ ಹೈಯರಾರ್ಕಿಕ ಡಯಾಗ್ರಾಮ್ನಿಂದ ಪ್ರಾರಂಭಿಸಿ."

??? info "ANSWER: ದೃಶ್ಯ ಹೈಯರಾರ್ಕಿಕ ಡಯಾಗ್ರಾಮ್"

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

### 3.1. ಕೋರ್ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪ

ಈ ಟೆಂಪ್ಲೇಟು ಒಂದು **ಫುಲ್-ಸ್ಟ್ಯಾಕ್ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್** ಮಾದರಿಯನ್ನು ಅನುಸರಿಸುತ್ತದೆ:

- **Backend**: Python FastAPI ಜೊತೆಗೆ Azure AI ಸಂಯೋಜನೆ
- **Frontend**: TypeScript/React ಜೊತೆಗೆ Vite ಬಿಲ್ಡ್ ಸಿಸ್ಟಮ್
- **Infrastructure**: ಕ್ಲೌಡ್ ಸಂಪನ್ಮೂಲಗಳಿಗೆ Azure Bicep ಟೆಂಪ್ಲೇಟ್ಸ್
- **Containerization**: ಸಾತತ್ಯದ ನಿಯೋಜನೆಗಾಗಿ Docker

### 3.2 Infra As Code (bicep)

ಅಧೋಮಟ್ಟದ ಆಧಾರವಾಗಿ ಮೂಲಸೌಕರ್ಯ ಲೇಯರ್ **Azure Bicep** ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಮಡ್ಯೂಲರ್ ರೀತಿಯಲ್ಲಿ ಸಂಘಟಿಸಿದೆ:

   - **`main.bicep`**: ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸಂಯೋಜಿಸುತ್ತದೆ
   - **`core/` ಮಡ್ಯೂಲುಗಳು**: ವಿವಿಧ ಸೇವೆಗಳಿಗಾಗಿ ಪುನರುಪಯೋಗಿಸಬಹುದಾದ ಘಟಕಗಳು
      - AI ಸೇವೆಗಳು (Azure OpenAI, AI Search)
      - ಕಂಟೇನರ್ ಹೋಸ್ಟಿಂಗ್ (Azure Container Apps)
      - ಮಾನಿಟರಿಂಗ್ (Application Insights, Log Analytics)
      - ಸುರಕ್ಷತೆ (Key Vault, Managed Identity)

### 3.3 ಅಪ್ಲಿಕೇಶನ್ ಮೂಲ (`src/`)

**Backend API (`src/api/`)**:

- FastAPI ಆಧಾರಿತ REST API
- Foundry Agents ಸಂಯೋಜನೆ
- ಜ್ಞಾನ ಪುನರ್‌ಪ್ರಾಪ್ತಿಗಾಗಿ ಶೋಧ ಸೂಚ್ಯಂಕ ನಿರ್ವಹಣೆ
- ಫೈಲ್ ಅಪ್‌ಲೋಡ್ ಮತ್ತು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸುವ ಸಾಮರ್ಥ್ಯಗಳು

**Frontend (`src/frontend/`)**:

- ಆಧುನಿಕ React/TypeScript SPA
- ವೇಗವಾಗಿ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿದ ಬಿಲ್ಡ್‌ಗಾಗಿ Vite
- ಏಜೆಂಟ್ ಪರಸ್ಪರಕ್ರಿಯೆಗಳಿಗೆ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್

**Knowledge Base (`src/files/`)**:

- ಮಾದರಿ ಗ್ರಾಹಕ ಮತ್ತು ಉತ್ಪನ್ನ ಡೇಟಾ
- ಫೈಲ್ ಆಧಾರಿತ ಜ್ಞಾನ ಪತ್ತೆದಾರಿ ತೋರಿಸುತ್ತದೆ
- JSON ಮತ್ತು Markdown ಫಾರ್ಮ್ಯಾಟ್ ಉದಾಹರಣೆಗಳು


### 3.4 DevOps & Automation

**Scripts (`scripts/`)**:

- ಕ್ರಾಸ್-ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ PowerShell ಮತ್ತು Bash ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- ಪರಿಸರ ಮಾನ್ಯತೆ ಮತ್ತು ಸೆಟ್‌ಅಪ್
- ಪೋಸ್ಟ್-ಡೆಪ್ಲಾಯ್ ಕಾನ್ಫಿಗರೇಶನ್
- ಮಾದರಿ ಕ್ವೋಟಾ ನಿರ್ವಹಣೆ

**Azure Developer CLI ಸಂಯೋಜನೆ**:

- `azure.yaml` ನಲ್ಲಿ `azd` ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ಕಾನ್ಫಿಗರೇಶನ್
- ಸ್ವಯಂಕ್ರಿಯ ಪ್ರೊವಿಷನಿಂಗ್ ಮತ್ತು ನಿಯೋಜನೆ
- ಪರಿಸರ ಚರ ವರ್ಗಗಳ ನಿರ್ವಹಣೆ

### 3.5 ಪರೀಕ್ಷೆ & ಗುಣಮಟ್ಟ ಖಾತರಿ

**ಮೌಲ್ಯಮಾಪನ ಫ್ರೇಮ್ವರ್ಕ್ (`evals/`)**:

- ಏಜೆಂಟ್ ಪ್ರದರ್ಶನ ಮೌಲ್ಯಮಾಪನ
- ಪ್ರಶ್ನೆ-ಪ್ರತಿಕ್ರಿಯೆ ಗುಣಮಟ್ಟ ಪರೀಕ್ಷೆ
- ಸ್ವಯಂಚಾಲಿತ ಅಸೆಸ್‌ಮೆಂಟ್ ಪೈಪ್‌ಲೈನ್

**AI ಭದ್ರತೆ (`airedteaming/`)**:

- AI ಭದ್ರತೆಗೆ ರೆಡ್ ಟೀಮ್ ಪರೀಕ್ಷೆಗಳು
- ಸುರಕ್ಷತಾ ದುರ್ಬಲತೆಯ ತಪಾಸಣೆ
- ಜವಾಬ್ದಾರಿತ AI ಅಭ್ಯಾಸಗಳು

---

## 4. ಅಭಿನಂದನೆಗಳು 🏆

ನೀವು GitHub Copilot Chat ಅನ್ನು MCP ಸರ್ವರ್‌ಗಳೊಂದಿಗೆ ಯಶಸ್ವಿಯಾಗಿ ಬಳಸಿಕೊಂಡು ರೆಪೊವನ್ನು ಅನ್ವೇಷಿಸಿದ್ದೀರಿ.

- [X] GitHub Copilot ಅನ್ನು Azure ಗೆ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ
- [X] ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡಿದ್ದೀರಿ
- [X] AZD ಟೆಂಪ್ಲೇಟ್ ರಚನೆಯನ್ನು ಅನ್ವೇಷಿಸಿದ್ದೀರಿ

ಇದು ಈ ಟೆಂಪ್ಲೇಟ್ಗಾಗಿ ಇರುವ _Infrastructure as Code_ ಸಂಪತ್ತಿನ ಕುರಿತಾಗಿ ನಿಮಗೆ ಒಂದು ಭಾವನೆ ನೀಡುತ್ತದೆ. ಮುಂದಿನದಾಗಿ, ನಾವು AZD ಕಾನ್ಫಿಗರೇಶನ್ ಫೈಲ್ ಅನ್ನು ನೋಡೋಣ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:
ಈ ದಾಖಲೆಯನ್ನು AI ಅನುವಾದ ಸೇವೆ Co-op Translator (https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಯನ್ನು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮರ್ಪಕತೆಗಳು ಇರಬಹುದೇ ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಾಖಲೆ ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾದ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೆಗಳು ಅಥವಾ ದೋಷವ್ಯಾಖ್ಯೆಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
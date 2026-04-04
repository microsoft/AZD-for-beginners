# 3. ਇੱਕ ਟੈਮਪਲੇਟ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] GitHub Copilot ਨੂੰ MCP ਸਰਵਰਾਂ ਨਾਲ Azure ਸਹਾਇਤਾ ਲਈ ਸਰਗਰਮ ਕਰੋ
    - [ ] AZD ਟੈਮਪਲੇਟ ਫੋਲਡਰ ਢਾਂਚਾ ਅਤੇ ਉੱਪਕਰਣਾਂ ਨੂੰ ਸਮਝੋ
    - [ ] Infrastructure-as-code (Bicep) ਦੇ ਸੰਗਠਨ ਮਾਡਲਾਂ ਦੀ ਖੋਜ ਕਰੋ
    - [ ] **Lab 3:** GitHub Copilot ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਰਿਪੋਜ਼ਟਰੀ ਦੀ ਆਰਕੀਟੈਕਚਰ ਖੋਜੋ ਅਤੇ ਸਮਝੋ

---


AZD ਟੈਮਪਲੇਟਾਂ ਅਤੇ Azure Developer CLI (`azd`) ਦੇ ਨਾਲ ਅਸੀਂ ਆਪਣੇ AI ਵਿਕਾਸ ਯਾਤਰਾ ਨੂੰ ਤੁਰੰਤ ਸ਼ੁਰੂ ਕਰ ਸਕਦੇ ਹਾਂ, ਸਰਲ ਅਤੇ ਮਾਪਦੇਰਾ ਰੀਪੋਜ਼ਟਰੀਆਂ ਦੇ ਰੂਪ ਵਿੱਚ ਜਿਹੜੀਆਂ ਨਮੂਨਾ ਕੋਡ, ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਅਤੇ ਸੰਰਚਨਾ ਫਾਇਲਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀਆਂ ਹਨ - ਇੱਕ ਤਿਆਰ-ਡਿਪਲੋਇ ਕਰਨ ਯੋਗ _starter_ ਪ੍ਰੋਜੇਕਟ ਦੇ ਰੂਪ ਵਿੱਚ।

**ਪਰ ਹੁਣ, ਸਾਨੂੰ ਪ੍ਰੋਜੇਕਟ ਦੀ ਬਣਤਰ ਅਤੇ ਕੋਡਬੇਸ ਨੂੰ ਸਮਝਣ ਦੀ ਲੋੜ ਹੈ - ਅਤੇ AZD ਟੈਮਪਲੇਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰਨ ਯੋਗ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ - ਬਿਨਾਂ ਕਿਸੇ ਪਹਿਲੇ ਤਜਰਬੇ ਜਾਂ AZD ਦੀ ਸਮਝ ਦੇ!**

---

## 1. GitHub Copilot ਨੂੰ ਸਰਗਰਮ ਕਰੋ

### 1.1 GitHub Copilot Chat ਇੰਸਟਾਲ ਕਰੋ

ਹੁਣ ਸਮਾਂ ਹੈ [Agent ਮੋਡ ਨਾਲ GitHub Copilot](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) ਨੂੰ ਖੰਗਾਲਣ ਦਾ। ਹੁਣ ਅਸੀਂ ਕੁਦਰਤੀ ਭਾਸ਼ਾ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਉੱਚ-ਸਤਰ 'ਤੇ ਆਪਣਾ ਕੰਮ ਵਰਣਨ ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਕਾਰਜਨਵਾਈ ਵਿੱਚ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹਾਂ। ਇਸ ਲੈਬ ਲਈ, ਅਸੀਂ [Copilot ਮੁਫ਼ਤ ਯੋਜਨਾ](https://github.com/github-copilot/signup) ਦੀ ਵਰਤੋਂ ਕਰਾਂਗੇ ਜਿਸ ਵਿੱਚ ਸੰਪੂਰਨਤਾ ਅਤੇ ਚੈਟ ਇੰਟਰੈਕਸ਼ਨਾਂ ਲਈ ਮਹੀਨਾਵਾਰੀ ਸੀਮਾ ਹੁੰਦੀ ਹੈ।

ਇਕਸਟੈਨਸ਼ਨ ਨੂੰ ਮਾਰਕੀਟਪਲੇਸ ਤੋਂ ਇੰਸਟਾਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ, ਅਤੇ ਇਹ ਅਕਸਰ Codespaces ਜਾਂ dev container ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਪਹਿਲਾਂ ਹੀ ਉਪਲਬਧ ਹੋ ਸਕਦਾ ਹੈ। _Copilot ਆਈਕਨ ਡ੍ਰੌਪ-ਡਾਊਨ ਤੋਂ `Open Chat` 'ਤੇ ਕਲਿੱਕ ਕਰੋ - ਅਤੇ `What can you do?` ਵਰਗਾ ਪ੍ਰੋਮਪਟ ਟਾਈਪ ਕਰੋ_ - ਤੁਹਾਨੂੰ ਲੌਗਿਨ ਕਰਨ ਲਈ ਪ੍ਰੋੰਪਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ। **GitHub Copilot Chat ਤਿਆਰ ਹੈ**।

### 1.2. Install MCP Servers

Agent ਮੋਡ ਪ੍ਰਭਾਵਸ਼ালী ਹੋਣ ਲਈ, ਇਸਨੂੰ ਠੀਕ ਟੂਲਸ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ ਜੋ ਇਹ ਗਿਆਨ ਪ੍ਰਾਪਤ ਕਰਨ ਜਾਂ ਕਾਰਵਾਈ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰ ਸਕਣ। ਇਹੀ ਥਾਂ ਹੈ ਜਿਥੇ MCP ਸਰਵਰ ਮਦਦਗਾਰ ਸਾਬਿਤ ਹੋ ਸਕਦੇ ਹਨ। ਅਸੀਂ ਹੇਠ ਲਿਖੇ ਸਰਵਰਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਾਂਗੇ:

1. [Azure MCP ਸਰਵਰ](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP ਸਰਵਰ](../../../../../workshop/docs/instructions)

ਇਨ੍ਹਾਂ ਨੂੰ ਸਰਗਰਮ ਕਰਨ ਲਈ:

1. ਜੇ ਇਹ ਮੌਜੂਦ ਨਹੀਂ ਹੈ ਤਾਂ `.vscode/mcp.json` ਨਾਂ ਦਾ ਫਾਇਲ ਬਣਾਓ
1. ਉਸ ਫਾਇਲ ਵਿੱਚ ਹੇਠ ਲਿਖਿਆ ਨਕਲ ਕਰੋ - ਅਤੇ ਸਰਵਰ ਸ਼ੁਰੂ ਕਰੋ!
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

??? warning "You may get an error that `npx` is not installed (click to expand for fix)"

      ਇਸ ਨੂੰ ਠੀਕ ਕਰਨ ਲਈ, `.devcontainer/devcontainer.json` ਫਾਇਲ ਖੋਲ੍ਹੋ ਅਤੇ features ਸੈਕਸ਼ਨ ਵਿੱਚ ਇਹ ਲਾਈਨ ਸ਼ਾਮਲ ਕਰੋ। ਫਿਰ container ਨੂੰ ਦੁਬਾਰਾ ਬਣਾਓ। ਹੁਣ ਤੁਹਾਡੇ ਕੋਲ `npx` ਇੰਸਟਾਲ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```


---

### 1.3. Test GitHub Copilot Chat

**ਸਭ ਤੋਂ ਪਹਿਲਾਂ VS Code ਦੇ ਕਮਾਂਡ ਲਾਈਨ ਤੋਂ Azure ਵਿੱਚ ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ `azd auth login` ਦੀ ਵਰਤੋਂ ਕਰੋ। ਜੇ ਤੁਸੀਂ ਸੀਧੇ Azure CLI ਕਮਾਂਡ ਚਲਾਉਣ ਦੀ ਯੋਜਨਾ ਬਣਾਉਂਦੇ ਹੋ ਤਾਂ `az login` ਵੀ ਵਰਤੋ।**

ਹੁਣ ਤੁਸੀਂ ਆਪਣੇ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਦੀ ਸਥਿਤੀ ਪੁੱਝ ਸਕਦੇ ਹੋ, ਅਤੇ ਡਿਪਲੋਇਡ ਰਿਸੋਰਸਜ਼ ਜਾਂ ਸੰਰਚਨਾ ਬਾਰੇ ਸਵਾਲ ਪੁੱਛ ਸਕਦੇ ਹੋ। ਇਹਨਾਂ ਪ੍ਰਾਂਪਟਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

ਤੁਸੀਂ Azure ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਬਾਰੇ ਸਵਾਲ ਵੀ ਪੁੱਛ ਸਕਦੇ ਹੋ ਅਤੇ Microsoft Docs MCP ਸਰਵਰ ਵਿੱਚ ਆਧਾਰਿਤ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦੇ ਹੋ। ਇਹਨਾਂ ਪ੍ਰਾਂਪਟਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

ਜਾਂ ਤੁਸੀਂ ਕੋਈ ਕੰਮ ਪੂਰਾ ਕਰਨ ਲਈ ਕੋਡ ਸਨਿੱਪੇਟ ਵੀ ਮੰਗ ਸਕਦੇ ਹੋ। ਇਹ ਪ੍ਰਾਂਪਟ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ।

1. `Give me a Python code example that uses AAD for an interactive chat client`

`Ask` ਮੋਡ ਵਿੱਚ, ਇਹ ਤੁਸੀਂ ਕਾਪੀ-ਪੇਸਟ ਕਰਕੇ ਅਜ਼ਮਾਇਸ਼ ਕਰ ਸਕਦੇ ਹੋ ਐਸਾ ਕੋਡ ਦਿੰਦਾ ਹੈ। `Agent` ਮੋਡ ਵਿੱਚ, ਇਹ ਹੋਰ ਅੱਗੇ ਜਾ ਸਕਦਾ ਹੈ ਅਤੇ ਸਬੰਧਤ ਰਿਸੋਰਸਜ਼ (ਸੈਟਅਪ ਸਕ੍ਰਿਪਟਾਂ ਅਤੇ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਸਮੇਤ) ਬਣਾਕੇ ਤੁਹਾਡੀ ਉਸ ਕੰਮ ਨੂੰ ਅਮਲ ਵਿੱਚ ਲਿਆਉਣ ਵਿੱਚ ਮਦਦ ਕਰ ਸਕਦਾ ਹੈ।

**ਹੁਣ ਤੁਹਾਡੇ ਕੋਲ ਟੈਮਪਲੇਟ ਰਿਪੋਜ਼ਟਰੀ ਖੋਜਣ ਲਈ ਜ਼ਰੂਰੀ ਸਾਜੋ-ਸਾਮਾਨ ਹੈ**

---

## 2. ਆਰਕੀਟੈਕਚਰ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ

??? prompt "ASK: Explain the application architecture in docs/images/architecture.png in 1 paragraph"

      ਇਹ ਐਪਲੀਕੇਸ਼ਨ ਇੱਕ Azure 'ਤੇ ਤਿਆਰ ਕੀਤਾ ਹੋਇਆ AI-ਪਾਵਰਡ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਹੈ ਜੋ ਆਧੁਨਿਕ ਏਜੰਟ-ਅਧਾਰਿਤ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ। ਹੱਲ ਦਾ ਕੇਂਦਰ ਇੱਕ Azure Container App ਹੈ ਜੋ ਮੁੱਖ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਹੋਸਟ ਕਰਦਾ ਹੈ, ਜੋ ਯੂਜ਼ਰ ਇਨਪੁੱਟ ਨੂੰ ਪ੍ਰੋਸੈੱਸ ਕਰਦਾ ਹੈ ਅਤੇ AI ਏਜੰਟ ਰਾਹੀਂ ਬੁੱਧੀਮਾਨ ਜਵਾਬ ਤਿਆਰ ਕਰਦਾ ਹੈ। 
      
      ਆਰਕੀਟੈਕਚਰ Microsoft Foundry Project ਨੂੰ AI ਸਮਰੱਥਾਵਾਂ ਲਈ ਬੁਨਿਆਦ ਵਜੋਂ ਵਰਤਦਾ ਹੈ, ਜੋ Azure AI Services ਨਾਲ ਜੁੜਦਾ ਹੈ ਜੋ ਆਧਾਰਭੂਤ ਲੈਂਗਵੇਜ ਮਾਡਲ (ਜਿਵੇਂ gpt-4.1-mini) ਅਤੇ ਏਜੰਟ ਕਾਰਗੁਜ਼ਾਰੀ ਪ੍ਰਦਾਨ ਕਰਦੇ ਹਨ। ਯੂਜ਼ਰ ਇੰਟਰੈਕਸ਼ਨ React-ਅਧਾਰਿਤ ਫਰੰਟਐਂਡ ਤੋਂ FastAPI ਬੈਕਐਂਡ ਤੱਕ ਫਲੋ ਹੁੰਦੀ ਹੈ ਜੋ ਸੰਦਰਭਿਕ ਜਵਾਬ ਤਿਆਰ ਕਰਨ ਲਈ AI ਏਜੰਟ ਸਰਵਿਸ ਨਾਲ ਸੰਚਾਰ ਕਰਦੀ ਹੈ। 
      
      ਸਿਸਟਮ ਦਸਤਾਵੇਜ਼ਾਂ ਵਿੱਚੋਂ ਜਾਣਕਾਰੀ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਫਾਇਲ ਖੋਜ ਜਾਂ Azure AI Search ਸਰਵਿਸ ਰਾਹੀਂ ਨੋਲੇਜ ਰੀਟ੍ਰੀਵਲ ਸਮਰੱਥਾਵਾਂ ਸ਼ਾਮਲ ਕਰਦਾ ਹੈ, ਜਿਸ ਨਾਲ ਏਜੰਟ ਅਪਲੋਡ ਕੀਤੀਆਂ ਦਸਤਾਵੇਜ਼ਾਂ ਤੋਂ ਜਾਣਕਾਰੀ ਪ੍ਰਾਪਤ ਅਤੇ ਹਵਾਲਾ ਦੇ ਸਕਦਾ ਹੈ। ਓਪਰੇਸ਼ਨਲ ਐਕਸੀਲੈਂਸ ਲਈ, ਆਰਕੀਟੈਕਚਰ ਵਿੱਚ Application Insights ਅਤੇ Log Analytics Workspace ਰਾਹੀਂ ਵਿਆਪਕ ਮੋਨਿਟਰਿੰਗ ਸ਼ਾਮਲ ਹੈ ਜਿੱਥੇ ਟ੍ਰੇਸਿੰਗ, ਲੌਗਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਇਤਿਆਦੀ ਲਈ ਮਦਦ ਮਿਲਦੀ ਹੈ। 
      
      Azure Storage ਐਪਲੀਕੇਸ਼ਨ ਡਾਟਾ ਅਤੇ ਫਾਇਲ ਅਪਲੋਡ ਲਈ ਬਲੌਬ ਸਟੋਰੇਜ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ, ਜਦਕਿ Managed Identity Azure ਸਰੋਸਾਂ ਵਿਚਕਾਰ ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ ਯਕੀਨੀ ਬਣਾਉਂਦੀ ਹੈ ਬਿਨਾਂ ਕਰੇਡੈਂਸ਼ਲ ਸਟੋਰ ਕੀਤੇ। ਪੂਰਾ ਹੱਲ ਸਕੇਲੇਬਿਲਟੀ ਅਤੇ ਮੈਨਟੇਨਬਿਲਟੀ ਲਈ ਡਿਜ਼ਾਇਨ ਕੀਤਾ ਗਿਆ ਹੈ, ਜਿੱਥੇ ਕੰਟੇਨਰਾਈਜ਼ਡ ਐਪਲੀਕੇਸ਼ਨ ਮੰਗ ਅਨੁਸਾਰ ਆਪਣੇ ਆਪ ਸਕੇਲ ਕਰਦੀ ਹੈ ਅਤੇ Azure ਦੇ ਪ੍ਰਬੰਧਿਤ ਸਰਵਿਸਿਜ਼ ਮਾਹੌਲ ਰਾਹੀਂ ਬਿਲਟ-ਇਨ ਸੁਰੱਖਿਆ, ਮੋਨਿਟਰਿੰਗ ਅਤੇ CI/CD ਸਮਰੱਥਾਵਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ।

![ਆਰਕੀਟੈਕਚਰ](../../../../../translated_images/pa/architecture.48d94861e6e6cdc0.webp)

---

## 3. ਰਿਪੋਜ਼ਟਰੀ ਢਾਂਚਾ

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

ਇਹ ਟੈਮਪਲੇਟ ਇੱਕ **ਫੁੱਲ-ਸਟੈਕ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ** ਪੈਟਰਨ ਦੀ ਪਾਲਣਾ ਕਰਦਾ ਹੈ ਜਿਸ ਵਿੱਚ:

- **ਬੈਕਐਂਡ**: Python FastAPI ਜਿਸ ਵਿੱਚ Azure AI ਇੰਟਿਗ੍ਰੇਸ਼ਨ
- **ਫਰੰਟਐਂਡ**: TypeScript/React Vite ਬਿਲ্ড ਸਿਸਟਮ ਦੇ ਨਾਲ
- **ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ**: ਕਲਾਉਡ ਸਰੋਸਾਂ ਲਈ Azure Bicep ਟੈਮਪਲੇਟ
- **ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ**: ਸੰਗਤ ਡਿਪਲੋਇਮੈਂਟ ਲਈ Docker

### 3.2 Infra As Code (bicep)

ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਲੇਅਰ **Azure Bicep** ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ ਜੋ ਮੌਡੀਊਲਰ ਢੰਗ ਨਾਲ ਸੰਗਠਿਤ ਹਨ:

   - **`main.bicep`**: ਸਾਰੇ Azure ਰਿਸੋਰਸਾਂ ਨੂੰ ਸੰਗਠਿਤ ਕਰਦਾ ਹੈ
   - **`core/` modules**: ਵੱਖ-ਵੁੱਖ ਸਰਵਿਸਜ਼ ਲਈ ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਕੰਪੋਨੈਂਟ
      - AI ਸਰਵਿਸਜ਼ (Microsoft Foundry Models, AI Search)
      - ਕੰਟੇਨਰ ਹੋਸਟਿੰਗ (Azure Container Apps)
      - ਮੋਨਿਟਰਿੰਗ (Application Insights, Log Analytics)
      - ਸੁਰੱਖਿਆ (Key Vault, Managed Identity)

### 3.3 ਐਪਲੀਕੇਸ਼ਨ ਸਰੋਤ (`src/`)

**ਬੈਕਐਂਡ API (`src/api/`)**:

- FastAPI-ਅਧਾਰਿਤ REST API
- Foundry Agents ਇੰਟਿਗ੍ਰੇਸ਼ਨ
- ਗਿਆਨ ਪ੍ਰਾਪਤੀ ਲਈ Search index ਪ੍ਰਬੰਧਨ
- ਫਾਇਲ ਅਪਲੋਡ ਅਤੇ ਪ੍ਰੋਸੈਸਿੰਗ ਸਮਰੱਥਾਵਾਂ

**ਫਰੰਟਐਂਡ (`src/frontend/`)**:

- ਆਧੁਨਿਕ React/TypeScript SPA
- ਤੇਜ਼ ਵਿਕਾਸ ਅਤੇ ਵਿਅਕਤੀਗਤ ਬਿਲਡ ਲਈ Vite
- ਏਜੰਟ ਇੰਟਰੈਕਸ਼ਨਾਂ ਲਈ ਚੈਟ ਇੰਟਰਫੇਸ

**ਨੋਲੇਜ ਬੇਸ (`src/files/`)**:

- ਨਮੂਨਾ ਗਾਹਕ ਅਤੇ ਉਤਪਾਦ ਡਾਟਾ
- ਫਾਇਲ-ਅਧਾਰਿਤ ਗਿਆਨ ਰੀਟ੍ਰੀਵਲ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ
- JSON ਅਤੇ Markdown ਫਾਰਮੇਟ ਨਮੂਨੇ

### 3.4 DevOps & Automation

**ਸਕ੍ਰਿਪਟਸ (`scripts/`)**:

- ਬਹੁ-ਪਲੇਟਫਾਰਮ PowerShell ਅਤੇ Bash ਸਕ੍ਰਿਪਟਸ
- ਵਾਤਾਵਰਣ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੈਟਅਪ
- ਪੋਸਟ-ਡਿਪਲੋਇਮੈਂਟ ਸੰਰਚਨਾ
- ਮਾਡਲ ਕੋਟਾ ਪ੍ਰਬੰਧਨ

**Azure Developer CLI ਇੰਟਿਗ੍ਰੇਸ਼ਨ**:

- `azure.yaml` `azd` ਵਰਕਫਲੋਜ਼ ਲਈ ਸੰਰਚਨਾ
- ਆਟੋਮੇਟਿਕ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ
- ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਪ੍ਰਬੰਧਨ

### 3.5 Testing & Quality Assurance

**ਮੁਲਾਂਕਣ ਫਰੇਮਵਰਕ (`evals/`)**:

- ਏਜੰਟ ਪ੍ਰਦਰਸ਼ਨ ਮੁਲਾਂਕਣ
- ਪ੍ਰਸ਼ਨ-ਜਵਾਬ ਗੁણਵੱਤਾ ਟੈਸਟਿੰਗ
- ਆਟੋਮੇਟਿਕ ਅੰਕੜਾ-ਅਧਾਰਿਤ ਮੁਲਾਂਕਣ ਪਾਈਪਲਾਈਨ

**AI ਸੁਰੱਖਿਆ (`airedteaming/`)**:

- AI ਸੁਰੱਖਿਆ ਲਈ ਰੈਡ ਟੀਮ ਟੈਸਟਿੰਗ
- ਸੁਰੱਖਿਆ ਜ਼ਰੀਏਸ਼ ਦੀ ਸਕੈਨਿੰਗ
- ਜ਼ਿੰਮੇਵਾਰ AI ਅਭਿਆਸ

---

## 4. ਵਧਾਈਆਂ 🏆

ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ MCP ਸਰਵਰਾਂ ਨਾਲ GitHub Copilot Chat ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਰਿਪੋਜ਼ਟਰੀ ਦੀ ਖੋਜ ਕੀਤੀ।

- [X] GitHub Copilot ਨੂੰ Azure ਲਈ ਸਰਗਰਮ ਕੀਤਾ
- [X] ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਸਮਝਿਆ
- [X] AZD ਟੈਮਪਲੇਟ ਢਾਂਚੇ ਦੀ ਖੋਜ ਕੀਤੀ

ਇਸ ਨਾਲ ਤੁਹਾਨੂੰ ਇਸ ਟੈਮਪਲੇਟ ਲਈ ਉਪਲਬਧ _infrastructure as code_ ਐਸੇਟਸ ਦੀ ਸਮਝ ਮਿਲਦੀ ਹੈ। ਅੱਗੇ, ਅਸੀਂ AZD ਲਈ ਸੰਰਚਨਾ ਫਾਇਲ 'ਤੇ ਨਜ਼ਰ ਮਾਰਾਂਗੇ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤਰੁੱਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
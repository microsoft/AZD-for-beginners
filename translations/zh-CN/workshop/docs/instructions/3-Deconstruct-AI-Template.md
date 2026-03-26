# 3. Deconstruct a Template

!!! tip "在本模块结束时您将能够"

    - [ ] 激活 GitHub Copilot，并为 Azure 启用 MCP 服务器以获取帮助
    - [ ] 了解 AZD 模板的文件夹结构和组件
    - [ ] 探索基础设施即代码（Bicep）的组织模式
    - [ ] **实验 3：** 使用 GitHub Copilot 探索并理解存储库架构 

---


借助 AZD 模板和 Azure Developer CLI（`azd`），我们可以快速通过标准化的存储库启动我们的 AI 开发旅程，这些存储库以可部署的 _starter_ 项目形式提供示例代码、基础设施和配置文件。

**但现在，我们需要在没有任何 AZD 先验经验或理解的情况下，能够理解项目结构和代码库，并能够自定义 AZD 模板！**

---

## 1. Activate GitHub Copilot

### 1.1 Install GitHub Copilot Chat

现在是探索 [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) 的时候了。现在，我们可以使用自然语言来高层描述我们的任务，并在执行方面获得帮助。对于本实验，我们将使用 [Copilot Free plan](https://github.com/github-copilot/signup)，该计划对完成和聊天交互有每月限制。

该扩展可以从市场安装，但在您的 Codespaces 环境中应已可用。_从 Copilot 图标下拉菜单中点击 `Open Chat` - 然后输入类似 `What can you do?` 的提示_ - 可能会提示您登录。**GitHub Copilot Chat 已就绪**。

### 1.2. Install MCP Servers

要使 Agent 模式有效，它需要访问正确的工具来帮助检索知识或采取操作。这就是 MCP 服务器可以发挥作用的地方。我们将配置以下服务器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

要激活它们：

1. 如果不存在，请创建一个名为 `.vscode/mcp.json` 的文件
1. 将以下内容复制到该文件中 - 然后启动服务器！
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

??? warning "您可能会收到 `npx` 未安装 的错误（单击以展开修复方法）"

      要修复此问题，请打开 `.devcontainer/devcontainer.json` 文件并在 features 部分添加此行。然后重建容器。现在您应该已安装 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Test GitHub Copilot Chat

**首先使用 `az login` 从 VS Code 命令行对 Azure 进行身份验证。**

现在您应该能够查询您的 Azure 订阅状态，并询问有关已部署资源或配置的问题。尝试以下提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

您还可以询问有关 Azure 文档的问题，并获得基于 Microsoft Docs MCP 服务器的响应。尝试以下提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者您可以请求代码片段来完成某项任务。尝试以下提示。

1. `Give me a Python code example that uses AAD for an interactive chat client`

在“Ask”模式下，这将提供可以复制粘贴并尝试的代码。在“Agent”模式下，这可能更进一步，为您创建相关资源——包括设置脚本和文档——以帮助您执行该任务。

<strong>您现在已具备开始探索模板存储库的能力</strong>

---

## 2. Deconstruct Architecture

??? prompt "询问：解释 docs/images/architecture.png 中的应用架构，1 段话"

      该应用是一个基于 Azure 的 AI 聊天应用，展示了现代的基于代理的架构。该解决方案围绕一个承载主应用代码的 Azure Container App 展开，该代码处理用户输入并通过 AI 代理生成智能响应。
      
      架构以 Microsoft Foundry Project 作为 AI 能力的基础，连接到提供底层语言模型（例如 gpt-4.1-mini）和代理功能的 Azure AI 服务。用户交互通过基于 React 的前端流向与 AI 代理服务通信以生成上下文响应的 FastAPI 后端。
      
      该系统通过文件搜索或 Azure AI Search 服务实现知识检索功能，使代理能够访问并引用已上传文档的信息。为实现卓越的运营，架构包括通过 Application Insights 和 Log Analytics Workspace 提供的全面监控，用于跟踪、记录和性能优化。
      
      Azure Storage 为应用数据和文件上传提供 blob 存储，而 Managed Identity 确保 Azure 资源之间的安全访问，无需存储凭据。整个解决方案旨在实现可扩展性和可维护性，容器化应用可根据需求自动扩展，同时通过 Azure 的托管服务生态系统提供内置的安全、监控和 CI/CD 能力。

![架构](../../../../../translated_images/zh-CN/architecture.48d94861e6e6cdc0.webp)

---

## 3. Repository Structure

!!! prompt "询问：解释模板文件夹结构。从可视化层次结构图开始。"

??? info "回答：可视化层次结构图"

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

此模板遵循一个<strong>全栈 Web 应用</strong>模式，包括：

- <strong>后端</strong>：基于 Python 的 FastAPI，集成 Azure AI
- <strong>前端</strong>：TypeScript/React，使用 Vite 构建系统
- <strong>基础设施</strong>：使用 Azure Bicep 模板管理云资源
- <strong>容器化</strong>：使用 Docker 保证部署一致性

### 3.2 Infra As Code (bicep)

基础设施层使用模块化组织的 **Azure Bicep** 模板：

   - **`main.bicep`**：协调所有 Azure 资源
   - **`core/` 模块**：为不同服务提供可复用组件
      - AI 服务（Microsoft Foundry 模型、AI Search）
      - 容器托管（Azure Container Apps）
      - 监控（Application Insights、Log Analytics）
      - 安全（Key Vault、Managed Identity）

### 3.3 Application Source (`src/`)

**后端 API (`src/api/`)**：

- 基于 FastAPI 的 REST API
- Foundry Agents 集成
- 用于知识检索的搜索索引管理
- 文件上传与处理功能

**前端 (`src/frontend/`)**：

- 现代化的 React/TypeScript 单页应用
- 使用 Vite 提供快速开发和优化构建
- 用于代理交互的聊天界面

**知识库 (`src/files/`)**：

- 示例客户和产品数据
- 演示基于文件的知识检索
- JSON 和 Markdown 格式示例


### 3.4 DevOps & Automation

**脚本 (`scripts/`)**：

- 跨平台的 PowerShell 和 Bash 脚本
- 环境验证与设置
- 部署后配置
- 模型配额管理

**Azure Developer CLI 集成**：

- `azure.yaml` 用于 `azd` 工作流的配置
- 自动化的预配与部署
- 环境变量管理

### 3.5 Testing & Quality Assurance

**评估框架 (`evals/`)**：

- 代理性能评估
- 查询-响应质量测试
- 自动化评估管道

**AI 安全 (`airedteaming/`)**：

- AI 安全的红队测试
- 安全漏洞扫描
- 负责任的 AI 实践

---

## 4. Congratulations 🏆

您已成功使用带有 MCP 服务器的 GitHub Copilot Chat 来探索该存储库。

- [X] 激活了用于 Azure 的 GitHub Copilot
- [X] 了解了应用架构
- [X] 探索了 AZD 模板结构

这让您对该模板的 _infrastructure as code_ 资产有了初步认识。接下来，我们将查看 AZD 的配置文件。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保准确性，但请注意自动翻译可能包含错误或不准确之处。应将原始语言版本视为权威来源。对于重要信息，建议使用专业人工翻译。我们不对因使用本翻译而产生的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
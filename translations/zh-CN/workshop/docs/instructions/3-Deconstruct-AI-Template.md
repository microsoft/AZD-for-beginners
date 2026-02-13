# 3. 拆解模板

!!! tip "在本模块结束时，您将能够"

    - [ ] 激活用于 Azure 协助的 GitHub Copilot 与 MCP 服务器
    - [ ] 了解 AZD 模板文件夹结构和组件
    - [ ] 探索基础设施即代码（Bicep）组织模式
    - [ ] **实验 3：** 使用 GitHub Copilot 探索并理解存储库架构 

---


借助 AZD 模板和 Azure Developer CLI (`azd`)，我们可以通过标准化的存储库快速启动我们的 AI 开发旅程，这些存储库以可部署的入门项目形式提供示例代码、基础设施和配置文件。

**但现在，我们需要在没有任何 AZD 先前经验或理解的情况下，理解项目结构和代码库——并能够自定义 AZD 模板！**

---

## 1. 激活 GitHub Copilot

### 1.1 安装 GitHub Copilot Chat

现在是探索 [GitHub Copilot 的代理模式](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) 的时候。现在，我们可以使用自然语言以高级描述我们的任务，并获得执行方面的帮助。对于本实验，我们将使用 [Copilot 免费计划](https://github.com/github-copilot/signup)，该计划对完成次数和聊天交互有每月限制。

该扩展可以从市场安装，但在您的 Codespaces 环境中应已可用。_从 Copilot 图标下拉菜单中单击 `Open Chat` - 并输入类似 `What can you do?` 的提示语_ - 系统可能会提示您登录。**GitHub Copilot Chat 已就绪**。

### 1.2. 安装 MCP 服务器

为了让代理模式发挥作用，它需要访问合适的工具来帮助检索知识或执行操作。这就是 MCP 服务器可以发挥作用的地方。我们将配置以下服务器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

要激活这些：

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

??? warning "您可能会遇到 `npx` 未安装的错误（单击以展开修复方法）"

      要修复此问题，请打开 `.devcontainer/devcontainer.json` 文件并将此行添加到 features 部分。然后重新构建容器。您现在应该已安装 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. 测试 GitHub Copilot Chat

**首先使用 `az login` 从 VS Code 命令行对 Azure 进行身份验证。**

现在您应该能够查询 Azure 订阅状态，并就已部署的资源或配置提出问题。尝试以下提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

您还可以针对 Azure 文档提出问题，并从 Microsoft Docs MCP 服务器获得有依据的响应。尝试以下提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者您可以请求代码片段来完成某个任务。尝试此提示。

1. `Give me a Python code example that uses AAD for an interactive chat client`

在“Ask”模式下，这将提供可复制粘贴并尝试的代码。在“Agent”模式下，这可能更进一步，为您创建相关资源——包括设置脚本和文档——以帮助您执行该任务。

**您现在已具备开始探索模板存储库的能力**

---

## 2. 拆解架构

??? prompt "提问：用 1 段话解释 docs/images/architecture.png 中的应用架构"

      该应用是一个基于 Azure 的 AI 驱动聊天应用，演示了现代的基于代理的架构。该解决方案以托管主应用代码的 Azure Container App 为核心，处理用户输入并通过 AI 代理生成智能响应。
      
      架构以 Microsoft Foundry Project 作为 AI 能力的基础，连接到提供底层语言模型（例如 GPT-4o-mini）和代理功能的 Azure AI 服务。用户交互通过基于 React 的前端流向与 AI 代理服务通信以生成上下文响应的 FastAPI 后端。
      
      该系统通过文件搜索或 Azure AI Search 服务实现知识检索功能，使代理能够访问并引用上传文档中的信息。为实现运维卓越，该架构包含全面的监控，通过 Application Insights 和 Log Analytics Workspace 进行跟踪、记录和性能优化。
      
      Azure Storage 为应用数据和文件上传提供 Blob 存储，而 Managed Identity 可在 Azure 资源之间实现安全访问而无需存储凭据。整个解决方案被设计为可扩展且易于维护，容器化应用会根据需求自动扩缩，同时通过 Azure 的托管服务生态系统提供内置安全性、监控和 CI/CD 能力。

![架构](../../../../../translated_images/zh-CN/architecture.48d94861e6e6cdc0.webp)

---

## 3. 存储库结构

!!! prompt "提问：解释模板文件夹结构。从可视化的层次图开始。"

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

### 3.1. 核心应用架构

此模板遵循 **全栈网络应用** 模式，包含：

- **后端**：使用 Azure AI 集成的 Python FastAPI
- **前端**：使用 Vite 构建系统的 TypeScript/React
- **基础设施**：用于云资源的 Azure Bicep 模板
- **容器化**：使用 Docker 实现一致的部署

### 3.2 基础设施即代码（bicep）

基础设施层使用模块化组织的 **Azure Bicep** 模板：

   - **`main.bicep`**：协调所有 Azure 资源
   - **`core/` 模块**：不同服务的可重用组件
      - AI 服务（Azure OpenAI、AI Search）
      - 容器托管（Azure Container Apps）
      - 监控（Application Insights、Log Analytics）
      - 安全（Key Vault、Managed Identity）

### 3.3 应用源码（`src/`）

**后端 API（`src/api/`）**：

- 基于 FastAPI 的 REST API
- Foundry Agents 集成
- 用于知识检索的搜索索引管理
- 文件上传和处理能力

**前端（`src/frontend/`）**：

- 现代 React/TypeScript 单页应用
- 使用 Vite 进行快速开发和优化构建
- 用于代理交互的聊天界面

**知识库（`src/files/`）**：

- 示例客户和产品数据
- 演示基于文件的知识检索
- 提供 JSON 和 Markdown 格式示例


### 3.4 DevOps 与自动化

**脚本（`scripts/`）**：

- 跨平台的 PowerShell 和 Bash 脚本
- 环境验证与设置
- 部署后配置
- 模型配额管理

**Azure Developer CLI 集成**：

- `azure.yaml` 用于 `azd` 工作流的配置
- 自动化的资源配置和部署
- 环境变量管理

### 3.5 测试与质量保证

**评估框架（`evals/`）**：

- 代理性能评估
- 查询-响应质量测试
- 自动化评估流水线

**AI 安全（`airedteaming/`）**：

- 针对 AI 安全的红队测试
- 安全漏洞扫描
- 负责任的 AI 实践

---

## 4. 恭喜 🏆

您已成功使用带有 MCP 服务器的 GitHub Copilot Chat 来探索该存储库。

- [X] 已为 Azure 激活 GitHub Copilot
- [X] 已了解应用架构
- [X] 已探索 AZD 模板结构

这让您对该模板的 _infrastructure as code_ 资产有了初步了解。接下来，我们将查看 AZD 的配置文件。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始文件的原文应被视为权威来源。对于关键信息，建议采用专业人工翻译。我们不对因使用本翻译而产生的任何误解或曲解承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
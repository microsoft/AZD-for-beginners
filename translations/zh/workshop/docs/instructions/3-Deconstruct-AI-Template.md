<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T09:10:51+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "zh"
}
-->
# 3. 分解模板

!!! tip "完成本模块后，您将能够"

    - [ ] 项目
    - [ ] 项目
    - [ ] 项目
    - [ ] **实验 3：**

---

通过 AZD 模板和 Azure Developer CLI (`azd`)，我们可以快速启动 AI 开发之旅。这些模板提供了标准化的代码库，包括示例代码、基础设施和配置文件，以一个可直接部署的 _入门_ 项目形式呈现。

**但现在，我们需要理解项目结构和代码库，并能够定制 AZD 模板——即使没有任何 AZD 的经验或了解！**

---

## 1. 激活 GitHub Copilot

### 1.1 安装 GitHub Copilot Chat

现在是时候探索 [GitHub Copilot 的 Agent 模式](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)了。我们可以使用自然语言高层次地描述任务，并获得执行帮助。在本实验中，我们将使用 [Copilot 免费计划](https://github.com/github-copilot/signup)，该计划对完成次数和聊天交互有每月限制。

该扩展可以从市场安装，但在您的 Codespaces 环境中应该已经可用。_点击 Copilot 图标下拉菜单中的 `Open Chat`，并输入提示，例如 `What can you do?`_——您可能需要登录。**GitHub Copilot Chat 已准备就绪**。

### 1.2 安装 MCP 服务器

为了使 Agent 模式有效，它需要访问正确的工具来帮助检索知识或执行操作。这时 MCP 服务器就派上用场了。我们将配置以下服务器：

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

激活这些服务器：

1. 如果文件 `.vscode/mcp.json` 不存在，请创建该文件
1. 将以下内容复制到该文件中，并启动服务器！
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

??? warning "您可能会收到 `npx` 未安装的错误提示（点击展开以查看修复方法）"

      要修复此问题，请打开 `.devcontainer/devcontainer.json` 文件，并在 features 部分添加以下行。然后重建容器。现在应该安装了 `npx`。

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 测试 GitHub Copilot Chat

**首先使用 `az login` 从 VS Code 命令行进行 Azure 身份验证。**

现在您应该能够查询您的 Azure 订阅状态，并询问有关已部署资源或配置的问题。尝试以下提示：

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

您还可以询问有关 Azure 文档的问题，并从 Microsoft Docs MCP 服务器获得基于文档的回答。尝试以下提示：

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

或者，您可以请求代码片段以完成任务。尝试以下提示：

1. `Give me a Python code example that uses AAD for an interactive chat client`

在 `Ask` 模式下，这将提供您可以复制粘贴并尝试的代码。在 `Agent` 模式下，这可能会更进一步，为您创建相关资源，包括设置脚本和文档，以帮助您执行该任务。

**现在您已准备好开始探索模板代码库**

---

## 2. 分解架构

??? prompt "ASK: 用一段话解释 docs/images/architecture.png 中的应用架构"

      该应用是一个基于 Azure 的 AI 驱动聊天应用，展示了现代的基于 Agent 的架构。解决方案的核心是一个 Azure 容器应用，它托管主要的应用代码，处理用户输入并通过 AI Agent 生成智能响应。
      
      架构以 Azure AI Foundry 项目为基础，连接到提供底层语言模型（如 GPT-4o-mini）和 Agent 功能的 Azure AI 服务。用户交互通过基于 React 的前端流向 FastAPI 后端，后端与 AI Agent 服务通信以生成上下文响应。
      
      系统通过文件搜索或 Azure AI Search 服务实现知识检索功能，使 Agent 能够访问并引用上传文档中的信息。为了实现卓越的运营，架构包括通过 Application Insights 和 Log Analytics Workspace 进行全面监控，用于跟踪、日志记录和性能优化。
      
      Azure Storage 提供了应用数据和文件上传的 Blob 存储，而托管身份确保 Azure 资源之间的安全访问，无需存储凭据。整个解决方案设计为可扩展和可维护，容器化应用根据需求自动扩展，同时通过 Azure 的托管服务生态系统提供内置的安全性、监控和 CI/CD 功能。

![Architecture](../../../../../translated_images/zh/architecture.48d94861e6e6cdc0.png)

---

## 3. 代码库结构

!!! prompt "ASK: 解释模板文件夹结构。从一个可视化的层次结构图开始。"

??? info "ANSWER: 可视化层次结构图"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 配置与设置
      │   ├── azure.yaml                    # Azure Developer CLI 配置
      │   ├── docker-compose.yaml           # 本地开发容器
      │   ├── pyproject.toml                # Python 项目配置
      │   ├── requirements-dev.txt          # 开发依赖项
      │   └── .devcontainer/                # VS Code 开发容器设置
      │
      ├── 🏗️ 基础设施 (infra/)
      │   ├── main.bicep                    # 主基础设施模板
      │   ├── api.bicep                     # API 特定资源
      │   ├── main.parameters.json          # 基础设施参数
      │   └── core/                         # 模块化基础设施组件
      │       ├── ai/                       # AI 服务配置
      │       ├── host/                     # 托管基础设施
      │       ├── monitor/                  # 监控与日志记录
      │       ├── search/                   # Azure AI Search 设置
      │       ├── security/                 # 安全与身份
      │       └── storage/                  # 存储账户配置
      │
      ├── 💻 应用源码 (src/)
      │   ├── api/                          # 后端 API
      │   │   ├── main.py                   # FastAPI 应用入口
      │   │   ├── routes.py                 # API 路由定义
      │   │   ├── search_index_manager.py   # 搜索功能
      │   │   ├── data/                     # API 数据处理
      │   │   ├── static/                   # 静态网页资源
      │   │   └── templates/                # HTML 模板
      │   ├── frontend/                     # React/TypeScript 前端
      │   │   ├── package.json              # Node.js 依赖项
      │   │   ├── vite.config.ts            # Vite 构建配置
      │   │   └── src/                      # 前端源码
      │   ├── data/                         # 示例数据文件
      │   │   └── embeddings.csv            # 预计算嵌入
      │   ├── files/                        # 知识库文件
      │   │   ├── customer_info_*.json      # 客户数据示例
      │   │   └── product_info_*.md         # 产品文档
      │   ├── Dockerfile                    # 容器配置
      │   └── requirements.txt              # Python 依赖项
      │
      ├── 🔧 自动化与脚本 (scripts/)
      │   ├── postdeploy.sh/.ps1           # 部署后设置
      │   ├── setup_credential.sh/.ps1     # 凭据配置
      │   ├── validate_env_vars.sh/.ps1    # 环境验证
      │   └── resolve_model_quota.sh/.ps1  # 模型配额管理
      │
      ├── 🧪 测试与评估
      │   ├── tests/                        # 单元与集成测试
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent 评估框架
      │   │   ├── evaluate.py               # 评估运行器
      │   │   ├── eval-queries.json         # 测试查询
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # 开发沙盒
      │   │   ├── 1-quickstart.py           # 入门示例
      │   │   └── aad-interactive-chat.py   # 身份验证示例
      │   └── airedteaming/                 # AI 安全评估
      │       └── ai_redteaming.py          # 红队测试
      │
      ├── 📚 文档 (docs/)
      │   ├── deployment.md                 # 部署指南
      │   ├── local_development.md          # 本地设置说明
      │   ├── troubleshooting.md            # 常见问题与解决方法
      │   ├── azure_account_setup.md        # Azure 前提条件
      │   └── images/                       # 文档资源
      │
      └── 📄 项目元数据
         ├── README.md                     # 项目概述
         ├── CODE_OF_CONDUCT.md           # 社区准则
         ├── CONTRIBUTING.md              # 贡献指南
         ├── LICENSE                      # 许可条款
         └── next-steps.md                # 部署后指导
      ```

### 3.1 核心应用架构

此模板遵循 **全栈 Web 应用** 模式，包括：

- **后端**：基于 Python FastAPI，集成 Azure AI
- **前端**：基于 TypeScript/React，使用 Vite 构建系统
- **基础设施**：使用 Azure Bicep 模板配置云资源
- **容器化**：通过 Docker 实现一致性部署

### 3.2 基础设施即代码 (bicep)

基础设施层使用 **Azure Bicep** 模板，模块化组织：

   - **`main.bicep`**：协调所有 Azure 资源
   - **`core/` 模块**：不同服务的可重用组件
      - AI 服务（Azure OpenAI、AI Search）
      - 容器托管（Azure Container Apps）
      - 监控（Application Insights、Log Analytics）
      - 安全（Key Vault、托管身份）

### 3.3 应用源码 (`src/`)

**后端 API (`src/api/`)**：

- 基于 FastAPI 的 REST API
- 集成 Azure AI Agent 服务
- 知识检索的搜索索引管理
- 文件上传与处理功能

**前端 (`src/frontend/`)**：

- 现代化的 React/TypeScript 单页应用
- 使用 Vite 实现快速开发与优化构建
- 用于 Agent 交互的聊天界面

**知识库 (`src/files/`)**：

- 示例客户与产品数据
- 展示基于文件的知识检索
- JSON 和 Markdown 格式示例

### 3.4 DevOps 与自动化

**脚本 (`scripts/`)**：

- 跨平台的 PowerShell 和 Bash 脚本
- 环境验证与设置
- 部署后配置
- 模型配额管理

**Azure Developer CLI 集成**：

- `azure.yaml` 配置用于 `azd` 工作流
- 自动化资源配置与部署
- 环境变量管理

### 3.5 测试与质量保证

**评估框架 (`evals/`)**：

- Agent 性能评估
- 查询响应质量测试
- 自动化评估管道

**AI 安全 (`airedteaming/`)**：

- AI 安全的红队测试
- 安全漏洞扫描
- 负责任的 AI 实践

---

## 4. 恭喜 🏆

您已成功使用 GitHub Copilot Chat 和 MCP 服务器，探索了代码库。

- [X] 激活了 GitHub Copilot for Azure
- [X] 理解了应用架构
- [X] 探索了 AZD 模板结构

这让您对该模板的 _基础设施即代码_ 资产有了一个初步了解。接下来，我们将研究 AZD 的配置文件。

---


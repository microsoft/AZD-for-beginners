# 更新日志 - AZD 初学者指南

## 介绍

此更新日志记录 AZD For Beginners 存储库的所有重要更改、更新和改进。我们遵循语义化版本控制原则，并维护此日志以帮助用户了解各版本之间的变化。

## 学习目标

通过查看此更新日志，您将能够：
- 了解新功能和新增内容
- 理解对现有文档所做的改进
- 跟踪错误修复和更正以确保准确性
- 关注学习材料随时间的演进

## 学习成果

查看更新日志条目后，您将能够：
- 识别可用于学习的新内容和资源
- 了解哪些章节已被更新或改进
- 根据最新材料规划您的学习路径
- 提出反馈和建议以促进未来改进

## 版本历史

### [v3.19.1] - 2026-03-27

#### 初学者入门澄清、设置验证与最终 AZD 命令清理
**本版本在 AZD 1.23 验证扫荡后对面向初学者的文档进行了跟进：它澄清了以 AZD 为先的身份验证指导，添加了本地设置验证脚本，验证了关键命令与实时 AZD CLI 的兼容性，并删除了变更日志之外最后的过时英文来源命令引用。**

#### 已添加
- **🧪 初学者设置验证脚本** 包含 `validate-setup.ps1` 和 `validate-setup.sh`，以便学习者在开始第 1 章之前确认所需工具
- **✅ 根 README 和第 1 章 README** 中的前置设置验证步骤，以便在运行 `azd up` 之前捕获缺失的先决条件

#### 已更改
- **🔐 初学者身份验证指导** 现在一致地将 `azd auth login` 作为 AZD 工作流的主要路径，`az login` 标注为可选，除非直接使用 Azure CLI 命令
- **📚 第 1 章入门流程** 现在指引学习者在安装、身份验证和首次部署步骤之前验证本地设置
- **🛠️ 验证器消息** 现在清晰地区分阻塞性要求与 AZD 专用初学路径的可选 Azure CLI 警告
- **📖 配置、故障排除和示例文档** 现在区分必需的 AZD 身份验证和可选的 Azure CLI 登录，在两者之前未提供上下文的地方进行了区分

#### 已修复
- **📋 剩余的英文来源命令引用** 已更新为当前 AZD 形式，包括备忘单中的 `azd config show` 以及在旨在提供 Azure 门户概览指导时的 `azd monitor --overview`
- **🧭 第 1 章中的初学者表述** 已放宽，以避免对所有模板和 Azure 资源保证零错误或回滚行为的过度承诺
- **🔎 实时 CLI 验证** 已确认当前支持 `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, 和 `azd down --force --purge`

#### 更新的文件
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 验证、研讨会环境扩展与 AI 模型刷新
**本版本对 `azd` `1.23.12` 进行了文档验证扫荡，更新了过时的 AZD 命令示例，将 AI 模型指导刷新为当前默认值，并将研讨会说明从仅支持 GitHub Codespaces 扩展到同时支持 dev 容器和本地克隆。**

#### 已添加
- **✅ 在核心章节和研讨会文档中加入验证说明**，以便为使用较新或较旧 CLI 构建的学习者明确已测试的 AZD 基线
- **⏱️ 部署超时指导**，针对使用 `azd deploy --timeout 1800` 的长时间运行 AI 应用部署
- **🔎 扩展检查步骤**，在 AI 工作流文档中加入 `azd extension show azure.ai.agents`
- **🌐 更广泛的研讨会环境指导**，涵盖 GitHub Codespaces、dev 容器和使用 MkDocs 的本地克隆

#### 已更改
- **📚 章节引导 README** 现在在基础、配置、基础设施、多代理、预部署、故障排除和生产部分一致注明已针对 `azd 1.23.12` 进行验证
- **🛠️ AZD 命令引用** 已在文档中更新为当前形式：
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` 或 `azd env get-value(s)`（视上下文而定）
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`（在意图提供 Application Insights 概览时）
- **🧪 预览预配示例** 简化为当前支持的用法，例如 `azd provision --preview` 和 `azd provision --preview -e production`
- **🧭 研讨会流程** 更新为学习者可以在 Codespaces、dev 容器或本地克隆中完成实验，而不再假设仅在 Codespaces 中执行
- **🔐 身份验证指导** 现在更偏好在 AZD 工作流中使用 `azd auth login`，当直接使用 Azure CLI 命令时将 `az login` 标注为可选

#### 已修复
- **🪟 Windows 安装命令** 在安装指南中规范为当前 `winget` 包大小写
- **🐧 Linux 安装指导** 已纠正，避免使用不受支持的特定发行版 `azd` 包管理器指令，而在适当情况下改为指向发布资产
- **📦 AI 模型示例** 已从较早默认值如 `gpt-35-turbo` 和 `text-embedding-ada-002` 刷新为当前示例，如 `gpt-4.1-mini`, `gpt-4.1`, 和 `text-embedding-3-large`
- **📋 部署和诊断片段** 已修正以在日志、脚本和故障排除步骤中使用当前的环境和状态命令
- **⚙️ GitHub Actions 指南** 已从 `Azure/setup-azd@v1.0.0` 更新为 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指导** 已从 `azd mcp consent` 更新为 `azd copilot consent list`

#### 改进
- **🧠 AI 章节指导** 现在更好地解释了受预览影响的 `azd ai` 行为、租户特定登录、当前扩展使用方式和更新的模型部署建议
- **🧪 研讨会说明** 现在使用更现实的版本示例并提供更清晰的环境设置语言以便动手实验
- **📈 生产和故障排除文档** 现在与当前的监控、回退模型和成本层示例更好地对齐

#### 更新的文件
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 命令、内容验证与模板扩展
**本版本在所有与 AI 相关的章节中加入了 `azd ai`, `azd extension`, 和 `azd mcp` 命令覆盖，修复了 agents.md 中的断链和弃用代码，更新了备忘单，并彻底改造了示例模板部分，提供经过验证的描述和新的 Azure AI AZD 模板。**

#### 已添加
- **🤖 在 7 个文件中覆盖 AZD AI CLI**（此前仅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新的“扩展和 AI 命令”部分，介绍 `azd extension`, `azd ai agent init`, 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 选项 4：`azd ai agent init`，并附有模板与清单方法的比较表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — “Foundry 的 AZD 扩展”和“以代理为先的部署”子节
  - `docs/chapter-05-multi-agent/README.md` — 快速入门现在展示模板和基于清单的部署路径
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分现在包含 `azd ai agent init` 选项
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — “用于诊断的 AZD AI 扩展命令”子节
  - `resources/cheat-sheet.md` — 新的“AI 与扩展命令”部分，包含 `azd extension`, `azd ai agent init`, `azd mcp`, 和 `azd infra generate`
- **📦 新的 AZD AI 示例模板** 列于 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 和语音聊天支持的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，提供 ACA/AKS 部署选项
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 和 Prompty 的多代理创意写作应用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB 的无服务器 RAG，并支持 Ollama 本地开发
  - **chat-with-your-data-solution-accelerator** — 带有管理员门户、Teams 集成以及 PostgreSQL/Cosmos DB 选项的企业级 RAG 加速器
  - **azure-ai-travel-agents** — 多代理 MCP 协作参考应用，服务器使用 .NET、Python、Java 和 TypeScript
  - **azd-ai-starter** — 最小化的 Azure AI 基础设施 Bicep 入门模板
  - **🔗 Awesome AZD AI 画廊 链接** — 参考 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（80+ 模板）

#### 已修复
- **🔗 agents.md 导航**：上一页/下一页链接现在与第 2 章 README 的课程顺序匹配（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 断链**：`production-ai-practices.md` 已修正为 `../chapter-08-production/production-ai-practices.md`（3 处）
- **📦 agents.md 弃用代码**：将 `opencensus` 替换为 `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md 无效 API**：将 `max_tokens` 从 `create_agent()` 移至 `create_run()`，作为 `max_completion_tokens`
- **🔢 agents.md 令牌计数**：将粗略的 `len//4` 估算替换为 `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**：将服务说明从 “Cognitive Search + App Service” 更正为 “Azure AI Search + Azure Container Apps”（默认主机于 2024 年 10 月更改）
- **contoso-chat**：更新描述以引用 Azure AI Foundry + Prompty，与仓库的实际标题和技术栈相匹配

#### 已移除
- **ai-document-processing**：移除不可用的模板引用（该仓库作为 AZD 模板未公开可访问）

#### 改进
- **📝 agents.md 练习**: 练习 1 现在显示期望输出并包含 `azd monitor` 步骤；练习 2 包含完整的 `FunctionTool` 注册代码；练习 3 将模糊的指导替换为具体的 `prepdocs.py` 命令
- **📚 agents.md 资源**: 更新了文档链接，指向当前的 Azure AI Agent Service 文档和快速入门
- **📋 agents.md 下一步 表格**: 为完整章节覆盖添加了 AI Workshop Lab 链接

#### 文件已更新
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### 课程导航增强
**此版本通过增强的表格格式改进了 README.md 的章节导航。**

#### 更改
- <strong>课程地图表</strong>: 增强了直接课程链接、时长估算和复杂度评级
- <strong>文件夹清理</strong>: 删除了冗余的旧文件夹 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- <strong>链接验证</strong>: 已验证课程地图表中的全部 21+ 个内部链接

### [v3.16.0] - 2026-02-05

#### 产品名称更新
**此版本将产品引用更新为当前 Microsoft 品牌。**

#### 更改
- **Microsoft Foundry → Microsoft Foundry**: 已在所有非翻译文件中更新相关引用
- **Azure AI Agent Service → Foundry Agents**: 服务名称已更新以反映当前品牌

#### 更新的文件
- `README.md` - 主课程着陆页
- `changelog.md` - 版本历史
- `course-outline.md` - 课程结构
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 示例文档
- `workshop/README.md` - 研讨会着陆页
- `workshop/docs/index.md` - 研讨会索引
- `workshop/docs/instructions/*.md` - 所有研讨会指令文件

---

### [v3.15.0] - 2026-02-05

#### 主要仓库重构：基于章节的文件夹命名
**此版本将文档重构为专门的章节文件夹以便更清晰的导航。**

#### 文件夹重命名
旧文件夹已替换为带章节编号的文件夹：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### 文件迁移
| 文件 | 来源 | 目标 |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章节 README 文件**: 在每个章节文件夹中创建了 README.md，包含：
  - 学习目标和时长
  - 带说明的课程表
  - 快速入门命令
  - 与其他章节的导航

#### 更改
- **🔗 更新了所有内部链接**: 已在全部文档文件中更新 78+ 个路径
- **🗺️ 主 README.md**: 使用新的章节结构更新了课程地图
- **📝 examples/README.md**: 更新了到章节文件夹的交叉引用

#### 移除
- 删除旧的文件夹结构 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 仓库重构：章节导航
**此版本添加了章节导航的 README 文件（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新的 AI 代理指南
**此版本添加了使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**: 完整指南，涵盖：
  - 什么是 AI 代理以及它们与聊天机器人有何不同
  - 三个快速入门代理模板（Foundry Agents、Prompty、RAG）
  - 代理架构模式（单代理、RAG、多代理）
  - 工具配置和自定义
  - 监控和指标跟踪
  - 成本考虑与优化
  - 常见故障排查场景
  - 三个动手练习及其成功标准

#### 内容结构
- <strong>介绍</strong>: 面向初学者的代理概念
- <strong>快速开始</strong>: 使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架构模式</strong>: 代理模式的可视化图示
- <strong>配置</strong>: 工具设置与环境变量
- <strong>监控</strong>: Application Insights 集成
- <strong>练习</strong>: 逐步动手学习（每个 20-45 分钟）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 环境更新
**此版本使用现代工具和更好的默认配置更新了开发容器，以提升 AZD 学习体验。**

#### 更改
- **🐳 基础镜像**: 从 `python:3.12-bullseye` 更新为 `python:3.12-bookworm`（最新的 Debian 稳定版）
- **📛 容器名称**: 为清晰起见，将名称从 "Python 3" 重命名为 "AZD for Beginners"

#### 新增
- **🔧 新的 Dev Container 功能**:
  - 包含带 Bicep 支持的 `azure-cli`
  - `node:20`（适用于 AZD 模板的 LTS 版本）
  - `github-cli` 用于模板管理
  - 用于容器应用部署的 `docker-in-docker`

- **🔌 端口转发**: 预配置了常见开发端口：
  - 8000 (MkDocs 预览)
  - 3000 (Web 应用)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新的 VS Code 扩展**:
  - `ms-python.vscode-pylance` - 增强的 Python 智能感知
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支持
  - `ms-azuretools.vscode-docker` - Docker 支持
  - `ms-azuretools.vscode-bicep` - Bicep 语言支持
  - `ms-azure-devtools.azure-resource-groups` - Azure 资源管理
  - `yzhang.markdown-all-in-one` - Markdown 编辑
  - `DavidAnson.vscode-markdownlint` - Markdown 规范检查
  - `bierner.markdown-mermaid` - Mermaid 图表支持
  - `redhat.vscode-yaml` - YAML 支持（用于 azure.yaml）
  - `eamodio.gitlens` - Git 可视化
  - `mhutchie.git-graph` - Git 历史

- **⚙️ VS Code 设置**: 添加了 Python 解释器默认设置、保存时格式化和空白修剪

- **📦 更新的 requirements-dev.txt**:
  - 添加了 MkDocs minify 插件
  - 添加了 pre-commit 以保证代码质量
  - 添加了 Azure SDK 包（azure-identity, azure-mgmt-resource）

#### 修复
- **Post-Create Command**: 现在在容器启动时验证 AZD 和 Azure CLI 的安装

---

### [v3.11.0] - 2026-02-05

#### 面向初学者的 README 大修
**此版本显著改进了 README.md，使其对初学者更友好，并为 AI 开发者添加了必要资源。**

#### 新增
- **🆚 Azure CLI vs AZD 对比**: 清晰说明何时使用每个工具并给出实用示例
- **🌟 精彩 AZD 链接**: 直接链接到社区模板库和贡献资源：
  - [Awesome AZD 画廊](https://azure.github.io/awesome-azd/) - 200+ 个可直接部署的模板
  - [提交模板](https://github.com/Azure/awesome-azd/issues) - 社区贡献入口
- **🎯 快速入门指南**: 简化为三步的入门流程（安装 → 登录 → 部署）
- **📊 基于经验的导航表**: 根据开发者经验提供清晰的起点建议

#### 更改
- **README 结构**: 重新组织以实现渐进式披露——重要信息优先
- <strong>介绍部分</strong>: 重写以向完全没有经验的用户解释 “azd up 的魔力”
- <strong>移除重复内容</strong>: 删除重复的故障排查部分
- <strong>故障排查命令</strong>: 修正了 `azd logs` 的引用，改为使用有效的 `azd monitor --logs`

#### 修复
- **🔐 身份验证命令**: 在 cheat-sheet.md 中添加了 `azd auth login` 和 `azd auth logout`
- <strong>无效命令引用</strong>: 从 README 的故障排查部分移除了剩余的 `azd logs`

#### 说明
- <strong>范围</strong>: 变更应用于主 README.md 和 resources/cheat-sheet.md
- <strong>目标读者</strong>: 这些改进专门面向对 AZD 不熟悉的开发者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 命令准确性更新
**此版本修正了文档中不存在的 AZD 命令，确保所有示例使用有效的 Azure Developer CLI 语法。**

#### 修复
- **🔧 已删除不存在的 AZD 命令**: 对无效命令进行了全面审核和更正：
  - `azd logs`（不存在）→ 用 `azd monitor --logs` 或 Azure CLI 替代
  - `azd service` 子命令（不存在）→ 用 `azd show` 和 Azure CLI 替代
  - `azd infra import/export/validate`（不存在）→ 已删除或替换为有效的替代方案
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 标志（不存在）→ 已移除
  - `azd provision --what-if/--rollback` 标志（不存在）→ 更新为使用 `--preview`
  - `azd config validate`（不存在）→ 用 `azd config list` 替代
  - `azd info`, `azd history`, `azd metrics`（不存在）→ 已移除

- **📚 已更新文件以纠正命令**:
  - `resources/cheat-sheet.md`: 命令参考的大修
  - `docs/deployment/deployment-guide.md`: 修正回滚和部署策略
  - `docs/troubleshooting/debugging.md`: 修正日志分析部分
  - `docs/troubleshooting/common-issues.md`: 更新故障排查命令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 AZD 调试部分
  - `docs/getting-started/azd-basics.md`: 修正监控命令
  - `docs/getting-started/first-project.md`: 更新监控和调试示例
  - `docs/getting-started/installation.md`: 修正帮助和版本示例
  - `docs/pre-deployment/application-insights.md`: 修正日志查看命令
  - `docs/pre-deployment/coordination-patterns.md`: 修正代理调试命令

- **📝 版本引用更新**:
  - `docs/getting-started/installation.md`: 将硬编码的 `1.5.0` 版本更改为通用的 `1.x.x` 并附带 releases 链接

#### 更改
- <strong>回滚策略</strong>: 更新文档以使用基于 Git 的回滚（AZD 不提供原生回滚）
- <strong>日志查看</strong>: 将 `azd logs` 的引用替换为 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 命令
- <strong>性能部分</strong>: 删除不存在的并行/增量部署标志，提供有效的替代方案

#### 技术细节
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands validated against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**此版本完成了交互式研讨会模块，修复了所有损坏的文档链接，并提升了面向使用 Microsoft AZD 的 AI 开发者的整体内容质量。**

#### Added
- **📝 CONTRIBUTING.md**: New contribution guidelines document with:
  - Clear instructions for reporting issues and proposing changes
  - Documentation standards for new content
  - Code example guidelines and commit message conventions
  - Community engagement information

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Fully completed wrap-up module with:
  - Comprehensive summary of workshop accomplishments
  - Key concepts mastered section covering AZD, templates, and Microsoft Foundry
  - Learning journey continuation recommendations
  - Workshop challenge exercises with difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Updated learning objectives with:
  - GitHub Copilot with MCP servers activation guidance
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Completed with:
  - Resource cleanup and cost management objectives
  - `azd down` usage for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery guidance
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Resolved 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Updated from "Under Construction" to active workshop status with February 2026 date

- **🔗 Workshop Navigation**: Fixed broken navigation links in workshop README.md pointing to non-existent lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Removed "under construction" warning, workshop is now complete and ready for use
- **Navigation Consistency**: Ensured all workshop modules have proper inter-module navigation
- **Learning Path References**: Updated chapter cross-references to use correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files have valid internal links
- ✅ Workshop modules 0-7 are complete with learning objectives
- ✅ Navigation between chapters and modules functions correctly
- ✅ Content is suitable for AI developers using Microsoft AZD
- ✅ Beginner-friendly language and structure maintained throughout
- ✅ CONTRIBUTING.md provides clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script verified all .md internal links
- **Content Audit**: Manual review of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns applied

#### Notes
- **Scope**: Changes applied to English documentation only
- **Translations**: Translation folders not updated in this version (automated translation will sync later)
- **Workshop Duration**: Complete workshop now provides 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**此版本新增了关于 Application Insights 集成、认证模式和用于生产部署的多代理协调的全面 A 级课程。**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment with automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python applications with custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization strategies
  - Live metrics streaming and real-time debugging
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructure templates for secure deployments
  - Node.js application code with Azure SDK integration
  - 3 complete exercises (enable managed identity, user-assigned identity, Key Vault rotation)
  - Security best practices and RBAC configurations
  - Troubleshooting guide and cost analysis
  - Production-ready passwordless authentication patterns

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coordination patterns (sequential, parallel, hierarchical, event-driven, consensus)
  - Complete orchestrator service implementation (Python/Flask, 1,500+ lines)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Service Bus integration for message queuing
  - Cosmos DB state management for distributed systems
  - 6 Mermaid diagrams showing agent interactions
  - 3 advanced exercises (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/month) with optimization strategies
  - Application Insights integration for monitoring

#### Enhanced
- **Pre-deployment Chapter**: Now includes comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Enhanced with professional authentication patterns
- **Production Readiness**: Complete coverage from security to observability
- **Course Outline**: Updated to reference new lessons in Chapters 3 and 6

#### Changed
- **Learning Progression**: Better integration of security and monitoring throughout course
- **Documentation Quality**: Consistent A-grade standards (95-97%) across new lessons
- **Production Patterns**: Complete end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons include complete working code (not snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises with verification steps (9 total)
- ✅ Production-ready Bicep templates deployable via `azd up`
- ✅ Cost analysis and optimization strategies
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints with verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Comprehensive monitoring guide
- **docs/getting-started/authsecurity.md**: - Professional security patterns
- **docs/pre-deployment/coordination-patterns.md**: - Advanced multi-agent architectures
- **Overall New Content**: - Consistent high-quality standards

#### Technical Implementation
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**此版本提升了存储库中整体的文档质量，并新增了一个完整的 Microsoft Foundry Models 部署示例，包含 gpt-4.1 聊天界面。**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Added hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Added verification section to deployment guide:
  - Health check procedures
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### Enhanced
- **examples/README.md**: Updated to A-grade quality (93%):
  - Added azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Changed
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Improved
- **Developer Experience**: Microsoft Foundry Models deployment now takes 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers have clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validated
- ✅ Microsoft Foundry Models example fully functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index accurately reflects 4 local examples
- ✅ No duplicate external links in tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**此版本引入了全面的、适用于生产的容器应用部署示例，使用 Azure Developer CLI (AZD)，并将其完整文档和集成纳入学习路径。**

#### Added
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Changed
-
- **README.md**: 已更新，以在“本地示例 - 容器应用程序”下展示并链接新的容器应用示例
- **examples/README.md**: 已更新以突出容器应用示例、添加比较矩阵条目并更新技术/架构引用
- **Course Outline & Study Guide**: 已更新以在相关章节中引用新的容器应用示例和部署模式

#### 已验证
- ✅ 所有新示例均可使用 `azd up` 部署并遵循最佳实践
- ✅ 文档交叉链接和导航已更新
- ✅ 示例涵盖从入门到高级场景，包括生产级微服务

#### 注意事项
- <strong>范围</strong>: 仅限英文文档和示例
- <strong>下一步</strong>: 在未来版本中扩展更多高级容器模式和 CI/CD 自动化

### [v3.5.0] - 2025-11-19

#### 产品重塑：Microsoft Foundry
**此版本在所有英文文档中全面实施了从 "Microsoft Foundry" 到 "Microsoft Foundry" 的产品名称更改，以反映微软的官方重塑。**

#### 更改
- **🔄 产品名称更新**: 已完成从 "Microsoft Foundry" 到 "Microsoft Foundry" 的全面重命名
  - 已更新 `docs/` 文件夹中所有英文文档的引用
  - 重命名文件夹：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 重命名文件：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 共：在 7 个文档文件中更新了 23 处内容引用

- **📁 文件夹结构更改**:
  - `docs/ai-foundry/` 重命名为 `docs/microsoft-foundry/`
  - 所有交叉引用已更新以反映新的文件夹结构
  - 已在所有文档中验证导航链接

- **📄 文件重命名**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有内部链接均已更新以引用新文件名

#### 更新的文件
- <strong>章节文档</strong> (7 个文件):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新了 3 个导航链接
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新了 4 处产品名称引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已经使用 Microsoft Foundry（来自先前的更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新了 3 处引用（概述、社区反馈、文档）
  - `docs/getting-started/azd-basics.md` - 更新了 4 个交叉引用链接
  - `docs/getting-started/first-project.md` - 更新了 2 个章节导航链接
  - `docs/getting-started/installation.md` - 更新了 2 个下一章节链接
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新了 3 处引用（导航、Discord 社区）
  - `docs/troubleshooting/common-issues.md` - 更新了 1 个导航链接
  - `docs/troubleshooting/debugging.md` - 更新了 1 个导航链接

- <strong>课程结构文件</strong> (2 个文件):
  - `README.md` - 更新了 17 处引用（课程概览、章节标题、模板部分、社区洞察）
  - `course-outline.md` - 更新了 14 处引用（概览、学习目标、章节资源）

#### 已验证
- ✅ 英文文档中已无剩余的 "ai-foundry" 文件夹路径引用
- ✅ 英文文档中已无剩余的 "Microsoft Foundry" 产品名称引用
- ✅ 所有导航链接在新的文件夹结构下均可正常使用
- ✅ 文件和文件夹重命名已成功完成
- ✅ 章节之间的交叉引用已验证

#### 注意事项
- <strong>范围</strong>: 更改仅应用于 `docs/` 文件夹中的英文文档
- <strong>翻译</strong>: `translations/` 翻译文件夹在此版本中未更新
- <strong>工作坊</strong>: `workshop/` 的材料在此版本中未更新
- <strong>示例</strong>: 示例文件可能仍引用遗留命名（将在后续更新中处理）
- <strong>外部链接</strong>: 外部 URL 和 GitHub 存储库引用保持不变

#### 供贡献者迁移指南
如果您有本地分支或文档引用旧结构：
1. 更新文件夹引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新文件引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替换产品名称： "Microsoft Foundry" → "Microsoft Foundry"
4. 验证所有内部文档链接仍然可用

---

### [v3.4.0] - 2025-10-24

#### 基础设施预览与验证增强
**此版本引入了对新的 Azure Developer CLI 预览功能的全面支持，并增强了工作坊用户体验。**

#### 新增
- **🧪 azd provision --preview 功能文档**: 对新基础设施预览能力的全面覆盖
  - 命令参考和速查表中的用法示例
  - 在预配指南中的详细集成，包含用例和优势
  - 用于更安全部署验证的预检检查集成
  - 入门指南更新，强调以安全优先的部署实践
- **🚧 工作坊状态横幅**: 专业的 HTML 横幅，指示工作坊开发状态
  - 渐变设计并带有施工指示器，以便向用户清晰传达状态
  - 包含最后更新时间以提升透明度
  - 对所有设备类型提供移动响应式设计

#### 增强
- <strong>基础设施安全性</strong>: 预览功能已集成至整个部署文档中
- <strong>部署前验证</strong>: 自动化脚本现在包含基础设施预览测试
- <strong>开发者工作流</strong>: 更新的命令序列将预览作为最佳实践的一部分
- <strong>工作坊体验</strong>: 明确向用户设置有关内容开发状态的预期

#### 更改
- <strong>部署最佳实践</strong>: 建议优先采用预览为先的工作流
- <strong>文档流程</strong>: 将基础设施验证提前到学习过程的早期
- <strong>工作坊展示</strong>: 使用专业状态通信并提供明确的开发时间表

#### 改进
- <strong>安全优先方法</strong>: 现在可在部署前验证基础设施更改
- <strong>团队协作</strong>: 可共享预览结果以供审查和批准
- <strong>成本意识</strong>: 在预配前更好地了解资源成本
- <strong>风险缓解</strong>: 通过提前验证减少部署失败

#### 技术实现
- <strong>多文档集成</strong>: 预览功能已记录在 4 个关键文件中
- <strong>命令模式</strong>: 在文档中保持一致的语法和示例
- <strong>最佳实践集成</strong>: 在验证工作流和脚本中包含预览
- <strong>视觉指示</strong>: 新功能有明确的标记以便发现

#### 工作坊基础设施
- <strong>状态通信</strong>: 带有渐变样式的专业 HTML 横幅
- <strong>用户体验</strong>: 清晰的开发状态可防止混淆
- <strong>专业呈现</strong>: 在设定预期的同时维护仓库信誉
- <strong>时间线透明性</strong>: 最后更新时间戳为 2025 年 10 月以确保问责

### [v3.3.0] - 2025-09-24

#### 增强的工作坊材料和交互式学习体验
**此版本引入了全面的工作坊材料、基于浏览器的交互式指南和结构化学习路径。**

#### 新增
- **🎥 交互式工作坊指南**: 带有 MkDocs 预览功能的基于浏览器的工作坊体验
- **📝 结构化工作坊说明**: 从探索到自定义的 7 步引导学习路径
  - 0-Introduction：工作坊概述与设置
  - 1-Select-AI-Template：模板发现与选择流程
  - 2-Validate-AI-Template：部署与验证流程
  - 3-Deconstruct-AI-Template：理解模板架构
  - 4-Configure-AI-Template：配置与定制
  - 5-Customize-AI-Template：高级修改与迭代
  - 6-Teardown-Infrastructure：清理与资源管理
  - 7-Wrap-up：总结与后续步骤
- **🛠️ 工作坊工具**: 使用 Material 主题的 MkDocs 配置以增强学习体验
- **🎯 实践学习路径**: 3 步方法论（发现 → 部署 → 定制）
- **📱 GitHub Codespaces 集成**: 无缝的开发环境设置

#### 增强
- **AI 工作坊实验室**: 扩展为包含 2-3 小时的结构化学习体验
- <strong>工作坊文档</strong>: 专业呈现，包含导航和视觉辅助
- <strong>学习进阶</strong>: 从模板选择到生产部署的清晰分步指导
- <strong>开发者体验</strong>: 集成工具以简化开发工作流程

#### 改进
- <strong>可访问性</strong>: 基于浏览器的界面具有搜索、复制功能和主题切换
- <strong>自定进度学习</strong>: 灵活的工作坊结构适应不同学习节奏
- <strong>实用应用</strong>: 真实世界的 AI 模板部署场景
- <strong>社区整合</strong>: 与 Discord 集成以支持工作坊协作

#### 工作坊功能
- <strong>内置搜索</strong>: 快速的关键词与课程发现
- <strong>复制代码块</strong>: 鼠标悬停即可复制所有代码示例
- <strong>主题切换</strong>: 支持深色/浅色模式以满足不同偏好
- <strong>视觉素材</strong>: 截图和图表以增强理解
- <strong>帮助集成</strong>: 直接访问 Discord 的社区支持

### [v3.2.0] - 2025-09-17

#### 重大导航重构与基于章节的学习系统
**此版本引入了全面的基于章节的学习结构，并在整个仓库中增强了导航。**

#### 新增
- **📚 基于章节的学习系统**: 将整个课程重构为 8 个渐进式学习章节
  - 第 1 章：基础与快速入门 (⭐ - 30-45 分钟)
  - 第 2 章：以 AI 为先的开发 (⭐⭐ - 1-2 小时)
  - 第 3 章：配置与身份验证 (⭐⭐ - 45-60 分钟)
  - 第 4 章：基础设施即代码与部署 (⭐⭐⭐ - 1-1.5 小时)
  - 第 5 章：多代理 AI 解决方案 (⭐⭐⭐⭐ - 2-3 小时)
  - 第 6 章：部署前验证与规划 (⭐⭐ - 1 小时)
  - 第 7 章：故障排除与调试 (⭐⭐ - 1-1.5 小时)
  - 第 8 章：生产与企业模式 (⭐⭐⭐⭐ - 2-3 小时)
- **📚 全面导航系统**: 在所有文档中使用一致的导航头部和页脚
- **🎯 进度跟踪**: 课程完成清单和学习核验系统
- **🗺️ 学习路径指导**: 为不同经验水平和目标提供清晰的入门点
- **🔗 交叉引用导航**: 相关章节和先决条件清晰链接

#### 增强
- **README 结构**: 转变为具有章节化组织的结构化学习平台
- <strong>文档导航</strong>: 每页现在包含章节上下文和进度指导
- <strong>模板组织</strong>: 示例和模板已映射到相应的学习章节
- <strong>资源整合</strong>: 速查表、常见问题和学习指南已连接到相关章节
- <strong>工作坊整合</strong>: 实操实验室映射到多个章节的学习目标

#### 更改
- <strong>学习进程</strong>: 从线性文档转为更灵活的基于章节的学习
- <strong>配置位置</strong>: 将配置指南重新定位为第 3 章以优化学习流程
- **AI 内容整合**: 更好地在整个学习过程中整合 AI 专项内容
- <strong>生产内容</strong>: 将高级模式集中在第 8 章以面向企业学习者

#### 改进
- <strong>用户体验</strong>: 清晰的导航面包屑和章节进度指示
- <strong>可访问性</strong>: 一致的导航模式便于课程浏览
- <strong>专业呈现</strong>: 大学式课程结构适用于学术与企业培训
- <strong>学习效率</strong>: 通过改进组织减少查找相关内容的时间

#### 技术实现
- <strong>导航头部</strong>: 在 40+ 个文档文件中标准化章节导航
- <strong>页脚导航</strong>: 提供一致的进度指导与章节完成指示
- <strong>交叉链接</strong>: 构建全面的内部链接系统连接相关概念
- <strong>章节映射</strong>: 模板和示例与学习目标明确定义映射

#### 学习指南增强
- **📚 全面学习目标**: 重构学习指南以对齐 8 章系统
- **🎯 基于章节的评估**: 每章包含特定学习目标和实践练习
- **📋 进度跟踪**: 每周学习计划，包含可衡量结果和完成清单
- **❓ 评估题目**: 每章的知识验证问题以支持专业发展
- **🛠️ 实践练习**: 带有真实部署场景和故障排除的动手活动
- **📊 技能进阶**: 从基础概念到企业模式的清晰成长路径，关注职业发展
- **🎓 认证框架**: 职业发展成果和社区认可体系
- **⏱️ 时间管理**: 包含里程碑验证的结构化 10 周学习计划

### [v3.1.0] - 2025-09-17

#### 增强的多代理 AI 解决方案
**此版本改进了零售多代理解决方案，优化了代理命名并增强了文档。**

#### 更改
- <strong>多代理术语</strong>: 在零售多代理解决方案中将 "Cora agent" 全面替换为 "Customer agent"，以便更清晰地理解
- <strong>代理架构</strong>: 已更新所有文档、ARM 模板和代码示例以使用一致的 "Customer agent" 命名
- <strong>配置示例</strong>: 使用更新的命名约定对代理配置模式进行了现代化
- <strong>文档一致性</strong>: 确保所有引用使用专业、描述性的代理名称

#### 增强
- **ARM Template Package**: 更新了 retail-multiagent-arm-template，包含 Customer agent 的引用
- **Architecture Diagrams**: 刷新了 Mermaid 图表并更新了 agent 命名
- **Code Examples**: Python 类和实现示例现在使用 CustomerAgent 命名
- **Environment Variables**: 更新了所有部署脚本以使用 CUSTOMER_AGENT_NAME 约定

#### Improved
- **Developer Experience**: 文档中对 agent 角色和职责进行了更清晰的说明
- **Production Readiness**: 更好地与企业命名约定对齐
- **Learning Materials**: 对教学用途的 agent 命名进行了更直观的设计
- **Template Usability**: 简化了对 agent 功能和部署模式的理解

#### Technical Details
- 在 Mermaid 架构图中更新为 CustomerAgent 引用
- 在 Python 示例中将 CoraAgent 类名替换为 CustomerAgent
- 修改了 ARM 模板 JSON 配置以使用 "customer" agent 类型
- 将环境变量从 CORA_AGENT_* 更新为 CUSTOMER_AGENT_* 模式
- 刷新了所有部署命令和容器配置

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**此版本将仓库转变为一个面向 AI 的综合学习资源，并集成 Microsoft Foundry。**

#### Added
- **🤖 AI-First Learning Path**: 完整重构，优先面向 AI 开发人员和工程师
- **Microsoft Foundry Integration Guide**: 用于将 AZD 连接到 Microsoft Foundry 服务的全面文档
- **AI Model Deployment Patterns**: 涵盖模型选择、配置和生产部署策略的详细指南
- **AI Workshop Lab**: 2-3 小时的动手工作坊，用于将 AI 应用转换为可通过 AZD 部署的解决方案
- **Production AI Best Practices**: 可用于扩展、监控和保护 AI 工作负载的企业级模式
- **AI-Specific Troubleshooting Guide**: 针对 Microsoft Foundry 模型、Cognitive Services 和 AI 部署问题的全面故障排除
- **AI Template Gallery**: 精选的 Microsoft Foundry 模板集合，并附带复杂度评级
- **Workshop Materials**: 完整的工作坊结构、动手实验和参考资料

#### Enhanced
- **README Structure**: 面向 AI 开发者，基于来自 Microsoft Foundry Discord 的 45% 社区兴趣数据
- **Learning Paths**: 为 AI 开发者设立的专门学习路线，同时保留面向学生和 DevOps 工程师的传统路径
- **Template Recommendations**: 精选 AI 模板，包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart
- **Community Integration**: 增强了 Discord 社区支持，增加了与 AI 相关的频道和讨论

#### Security & Production Focus
- **Managed Identity Patterns**: 面向 AI 的身份验证和安全配置模式
- **Cost Optimization**: 跟踪令牌使用情况并为 AI 工作负载提供预算控制
- **Multi-Region Deployment**: 全球 AI 应用部署策略
- **Performance Monitoring**: 面向 AI 的指标和 Application Insights 集成

#### Documentation Quality
- **Linear Course Structure**: 从初学者到高级 AI 部署模式的逻辑进阶
- **Validated URLs**: 所有外部仓库链接均已验证并可访问
- **Complete Reference**: 所有内部文档链接已验证并可用
- **Production Ready**: 带有真实示例的企业部署模式

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**此版本代表对仓库结构和内容呈现的重大重构。**

#### Added
- **Structured Learning Framework**: 所有文档页面现在包含 Introduction、Learning Goals 和 Learning Outcomes 部分
- **Navigation System**: 在所有文档中添加了 Previous/Next 课程链接，以便引导学习进度
- **Study Guide**: 完整的 study-guide.md，包含学习目标、练习和评估材料
- **Professional Presentation**: 移除了所有表情符号图标以提高可访问性和专业外观
- **Enhanced Content Structure**: 改进了学习材料的组织和流程

#### Changed
- **Documentation Format**: 将所有文档标准化为一致的以学习为中心的结构
- **Navigation Flow**: 在所有学习材料中实施了逻辑进阶流程
- **Content Presentation**: 用清晰、专业的格式替换装饰性元素
- **Link Structure**: 更新了所有内部链接以支持新的导航系统

#### Improved
- **Accessibility**: 移除了对表情符号的依赖以提高屏幕阅读器兼容性
- **Professional Appearance**: 采用干净、学术风格的呈现，适合企业学习
- **Learning Experience**: 结构化方法，为每课提供明确的目标和成果
- **Content Organization**: 改善了相关主题之间的逻辑流和连接

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - 完整的入门指南系列
  - 全面的部署和配置文档
  - 详细的故障排除资源和调试指南
  - 预部署验证工具和程序

- **Getting Started Module**
  - AZD 基础：核心概念和术语
  - 安装指南：平台特定的设置说明
  - 配置指南：环境设置和身份验证
  - 第一个项目教程：逐步动手学习

- **Deployment and Provisioning Module**
  - 部署指南：完整的工作流文档
  - 配置指南：使用 Bicep 的基础设施即代码
  - 生产部署的最佳实践
  - 多服务架构模式

- **Pre-deployment Validation Module**
  - 容量规划：Azure 资源可用性验证
  - SKU 选择：全面的服务层级指南
  - 预检检查：自动化验证脚本（PowerShell 和 Bash）
  - 成本估算和预算规划工具

- **Troubleshooting Module**
  - 常见问题：常见问题及解决方案
  - 调试指南：系统化的故障排除方法
  - 高级诊断技术和工具
  - 性能监控和优化

- **Resources and References**
  - 命令速查表：常用命令的快速参考
  - 术语表：全面的术语和缩略语定义
  - 常见问题解答：对常见问题的详细回答
  - 外部资源链接和社区连接

- **Examples and Templates**
  - 简单 Web 应用示例
  - 静态网站部署模板
  - 容器应用配置
  - 数据库集成模式
  - 微服务架构示例
  - 无服务器函数实现

#### Features
- **Multi-Platform Support**: Windows、macOS 和 Linux 的安装与配置指南
- **Multiple Skill Levels**: 面向学生到专业开发者的分层内容
- **Practical Focus**: 注重动手示例和真实场景
- **Comprehensive Coverage**: 从基础概念到高级企业模式的全面覆盖
- **Security-First Approach**: 在整个过程中集成安全最佳实践
- **Cost Optimization**: 提供成本效益部署和资源管理的指导

#### Documentation Quality
- **Detailed Code Examples**: 实用且经过测试的代码示例
- **Step-by-Step Instructions**: 清晰、可执行的指导
- **Comprehensive Error Handling**: 针对常见问题的故障排除
- **Best Practices Integration**: 行业标准和建议的整合
- **Version Compatibility**: 与最新的 Azure 服务和 azd 功能保持同步

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: 为 Hugging Face、Azure Machine Learning 和自定义模型提供的集成模式
- **AI Agent Frameworks**: LangChain、Semantic Kernel 和 AutoGen 部署模板
- **Advanced RAG Patterns**: 超越 Azure AI Search 的向量数据库选项（Pinecone、Weaviate 等）
- **AI Observability**: 加强对模型性能、令牌使用和响应质量的监控

#### Developer Experience
- **VS Code Extension**: 集成的 AZD + Microsoft Foundry 开发体验
- **GitHub Copilot Integration**: AI 辅助的 AZD 模板生成
- **Interactive Tutorials**: 带有自动验证的 AI 场景动手编码练习
- **Video Content**: 专注于 AI 部署的补充视频教程，适合视觉学习者

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI 模型治理、合规性和审计追踪
- **Multi-Tenant AI**: 为多个客户提供隔离 AI 服务的模式
- **Edge AI Deployment**: 与 Azure IoT Edge 和容器实例的集成
- **Hybrid Cloud AI**: AI 工作负载的多云和混合部署模式

#### Advanced Features
- **AI Pipeline Automation**: 与 Azure Machine Learning 管道的 MLOps 集成
- **Advanced Security**: 零信任模式、私有端点和高级威胁防护
- **Performance Optimization**: 面向高吞吐量 AI 应用的高级调整和扩展策略
- **Global Distribution**: AI 应用的内容分发和边缘缓存模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: 全面的 Microsoft Foundry 集成（已完成）
- ✅ **Interactive Tutorials**: 实战 AI 工作坊实验室（已完成）
- ✅ **Advanced Security Module**: 面向 AI 的安全模式（已完成）
- ✅ **Performance Optimization**: AI 工作负载调优策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: 面向 AI 的部署场景示例（已完成）
- ✅ **Extended FAQ**: 与 AI 相关的问题和故障排除（已完成）
- **Tool Integration**: 增强的 IDE 和编辑器集成指南
- ✅ **Monitoring Expansion**: 面向 AI 的监控和告警模式（已完成）

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: 面向移动学习的响应式设计
- **Offline Access**: 可下载的文档包
- **Enhanced IDE Integration**: 适用于 AZD + AI 工作流的 VS Code 扩展
- **Community Dashboard**: 实时社区指标和贡献跟踪

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corre正 AI 服务集成和部署信息的错误
- **Learning Experience**: 对改进 AI 开发者学习流程的建议
- **Missing AI Content**: 对额外 AI 模板、模式或示例的需求
- **Accessibility**: 改进以满足多样化学习需求
- **AI Tool Integration**: 对更好 AI 开发工作流集成的建议
- **Production AI Patterns**: 企业级 AI 部署模式的需求

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- <strong>最新主要版本</strong>: 提供完整支持并定期更新
- <strong>上一个主要版本</strong>: 提供12个月的安全更新和关键修复
- <strong>遗留版本</strong>: 仅由社区支持，无官方更新

### 迁移指南
当发布主要版本时，我们提供：
- <strong>迁移指南</strong>: 分步迁移说明
- <strong>兼容性说明</strong>: 有关破坏性更改的详细信息
- <strong>工具支持</strong>: 用于协助迁移的脚本或实用程序
- <strong>社区支持</strong>: 专门用于迁移问题的论坛

---

<strong>导航</strong>
- <strong>上一课</strong>: [学习指南](resources/study-guide.md)
- <strong>下一课</strong>: 返回到 [主 README](README.md)

<strong>保持关注</strong>: 关注此仓库以获取有关新版本发布和学习资料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。应以原始文档的母语版本为权威来源。对于关键信息，建议使用专业人工翻译。因使用本翻译而产生的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
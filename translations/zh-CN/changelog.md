# 更改日志 - AZD For Beginners

## 介绍

此更改日志记录 AZD For Beginners 存储库的所有显著更改、更新和改进。我们遵循语义化版本控制原则并维护此日志，以帮助用户了解各版本之间的变动。

## 学习目标

通过查看此更改日志，您将能够：
- 了解新功能和新增内容
- 理解对现有文档所做的改进
- 跟踪错误修复和更正以确保准确性
- 关注学习材料随时间的演进

## 学习成果

查看更改日志条目后，您将能够：
- 识别可用于学习的新内容和资源
- 了解哪些部分已更新或改进
- 根据最新材料规划您的学习路径
- 提交反馈和建议以促进未来改进

## 版本历史

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 命令、内容验证与模板扩展
**此版本在所有与 AI 相关的章节中新增了对 `azd ai`、`azd extension` 和 `azd mcp` 命令的覆盖，修复了 agents.md 中的断链和已弃用代码，更新了备忘单，并彻底重做了示例模板部分，包含经过验证的描述和新的 Azure AI AZD 模板。**

#### 新增
- **🤖 在 7 个文件中扩展了 AZD AI CLI 覆盖范围**（此前仅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增 “Extensions and AI Commands” 节，介绍 `azd extension`、`azd ai agent init` 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 选项 4：`azd ai agent init`，并包含模板与清单方法的比较表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — “AZD Extensions for Foundry” 和 “Agent-First Deployment” 小节
  - `docs/chapter-05-multi-agent/README.md` — 快速入门现在显示模板和基于清单的部署路径
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分现在包含 `azd ai agent init` 选项
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — “AZD AI Extension Commands for Diagnostics” 小节
  - `resources/cheat-sheet.md` — 新增 “AI & Extensions Commands” 部分，包含 `azd extension`、`azd ai agent init`、`azd mcp` 和 `azd infra generate`
- **📦 在 `microsoft-foundry-integration.md` 中新增 AZD AI 示例模板**：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 和语音聊天支持的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，提供 ACA/AKS 部署选项
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 和 Prompty 的多代理创意写作应用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB 的无服务器 RAG，支持 Ollama 本地开发
  - **chat-with-your-data-solution-accelerator** — 企业级 RAG 加速器，包含管理门户、Teams 集成，以及 PostgreSQL/Cosmos DB 选项
  - **azure-ai-travel-agents** — 多代理 MCP 编排参考应用，服务器实现包括 .NET、Python、Java 和 TypeScript
  - **azd-ai-starter** — 极简 Azure AI 基础设施 Bicep 启动模板
  - **🔗 Awesome AZD AI Gallery link** — 参考 [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai)（80+ 模板）

#### 修复
- **🔗 agents.md 导航**：上一节/下一节链接现在与第 2 章 README 的课程顺序匹配（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 断链**：将 `production-ai-practices.md` 修正为 `../chapter-08-production/production-ai-practices.md`（3 处）
- **📦 agents.md 已弃用代码**：用 `azure-monitor-opentelemetry` + OpenTelemetry SDK 替换了 `opencensus`
- **🐛 agents.md 无效 API**：将 `max_tokens` 从 `create_agent()` 移到 `create_run()`，作为 `max_completion_tokens`
- **🔢 agents.md 令牌计数**：用 `tiktoken.encoding_for_model()` 替换了粗略的 `len//4` 估算
- **azure-search-openai-demo**：将服务名称从 “Cognitive Search + App Service” 更正为 “Azure AI Search + Azure Container Apps”（默认主机于 2024 年 10 月更改）
- **contoso-chat**：更新描述以引用 Azure AI Foundry + Prompty，与仓库的实际标题和技术栈相符

#### 移除
- **ai-document-processing**：移除不可用的模板引用（该仓库未公开作为 AZD 模板可访问）

#### 改进
- **📝 agents.md 练习**：练习 1 现在显示预期输出并包含 `azd monitor` 步骤；练习 2 包含完整的 `FunctionTool` 注册代码；练习 3 将模糊指导替换为具体的 `prepdocs.py` 命令
- **📚 agents.md 资源**：将文档链接更新为当前的 Azure AI Agent Service 文档和快速入门
- **📋 agents.md 下一步表**：添加 AI Workshop Lab 链接以覆盖完整章节内容

#### 更新的文件
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
**此版本用增强的表格格式改进了 README.md 的章节导航。**

#### 更改
- <strong>课程地图表</strong>：增强为包含直接课程链接、时长估计和复杂度评级
- <strong>文件夹清理</strong>：删除冗余的旧文件夹（deployment/, getting-started/, pre-deployment/, troubleshooting/）
- <strong>链接验证</strong>：课程地图表中的 21+ 个内部链接已全部验证

### [v3.16.0] - 2026-02-05

#### 产品名称更新
**此版本将产品引用更新为当前的 Microsoft 品牌。**

#### 更改
- **Microsoft Foundry → Microsoft Foundry**：所有引用在非翻译文件中更新
- **Azure AI Agent Service → Foundry Agents**：服务名称已更新以反映当前品牌

#### 更新的文件
- `README.md` - 主要课程首页
- `changelog.md` - 版本历史
- `course-outline.md` - 课程结构
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 示例文档
- `workshop/README.md` - 研讨会首页
- `workshop/docs/index.md` - 研讨会索引
- `workshop/docs/instructions/*.md` - 所有研讨会说明文件

---

### [v3.15.0] - 2026-02-05

#### 重大仓库重构：基于章节的文件夹命名
**此版本将文档重构为专用的章节文件夹以便更清晰的导航。**

#### 文件夹重命名
旧文件夹已替换为带章节编号的文件夹：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增：`docs/chapter-05-multi-agent/`

#### 文件迁移
| File | From | To |
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
- **📚 章节 README 文件**：在每个章节文件夹中创建了 README.md，包含：
  - 学习目标和时长
  - 带描述的课程表
  - 快速入门命令
  - 与其他章节的导航

#### 更改
- **🔗 更新所有内部链接**：78+ 条路径在所有文档文件中已更新
- **🗺️ 主 README.md**：使用新章节结构更新了课程地图
- **📝 examples/README.md**：更新了对章节文件夹的交叉引用

#### 移除
- 旧的文件夹结构（getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 仓库重构：章节导航
**此版本新增了章节导航 README 文件（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新的 AI 代理指南
**此版本新增了使用 Azure Developer CLI 部署 AI 代理的全面指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南，涵盖：
  - AI 代理是什么以及它们与聊天机器人有何不同
  - 三个快速启动代理模板（Foundry Agents、Prompty、RAG）
  - 代理架构模式（单代理、RAG、多代理）
  - 工具配置与自定义
  - 监控与指标跟踪
  - 成本考虑与优化
  - 常见故障排除场景
  - 三个动手练习及成功标准

#### 内容结构
- <strong>介绍</strong>：面向初学者的代理概念
- <strong>快速入门</strong>：通过 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架构模式</strong>：代理模式的可视化图示
- <strong>配置</strong>：工具设置和环境变量
- <strong>监控</strong>：Application Insights 集成
- <strong>练习</strong>：逐步的动手学习（每项 20-45 分钟）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 环境更新
**此版本更新了开发容器配置，采用更现代的工具和更好的默认设置，以提升 AZD 学习体验。**

#### 更改
- **🐳 基础镜像**：从 `python:3.12-bullseye` 更新为 `python:3.12-bookworm`（最新的 Debian 稳定版）
- **📛 容器名称**：从 “Python 3” 重命名为 “AZD for Beginners” 以提高清晰度

#### 新增
- **🔧 新的开发容器功能**:
  - `azure-cli`（启用了 Bicep 支持）
  - `node:20` (AZD 模板的 LTS 版本)
  - `github-cli` 用于模板管理
  - `docker-in-docker` 用于容器应用部署

- **🔌 端口转发**: 预配置了常见开发端口:
  - 8000 (MkDocs 预览)
  - 3000 (Web 应用)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 新的 VS Code 扩展**:
  - `ms-python.vscode-pylance` - 增强的 Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支持
  - `ms-azuretools.vscode-docker` - Docker 支持
  - `ms-azuretools.vscode-bicep` - Bicep 语言支持
  - `ms-azure-devtools.azure-resource-groups` - Azure 资源管理
  - `yzhang.markdown-all-in-one` - Markdown 编辑
  - `DavidAnson.vscode-markdownlint` - Markdown lint 检查
  - `bierner.markdown-mermaid` - Mermaid 图表支持
  - `redhat.vscode-yaml` - YAML 支持 (for azure.yaml)
  - `eamodio.gitlens` - Git 可视化
  - `mhutchie.git-graph` - Git 历史

- **⚙️ VS Code 设置**: 添加了针对 Python 解释器、保存时格式化和空白修剪的默认设置

- **📦 更新了 requirements-dev.txt**:
  - 添加了 MkDocs minify 插件
  - 添加了 pre-commit 以提升代码质量
  - 添加了 Azure SDK 包 (azure-identity, azure-mgmt-resource)

#### 已修复
- **Post-Create Command**: 现在在容器启动时验证 AZD 和 Azure CLI 是否已安装

---

### [v3.11.0] - 2026-02-05

#### 为初学者优化的 README 大修
**此版本显著改进了 README.md，使其对初学者更易于理解，并为 AI 开发者添加了重要资源。**

#### 新增
- **🆚 Azure CLI vs AZD 对比**: 清晰说明何时使用各工具并提供实用示例
- **🌟 Awesome AZD 链接**: 指向社区模板库和贡献资源的直接链接:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 个可直接部署的模板
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 社区贡献
- **🎯 快速入门指南**: 简化的 3 步入门章节 (Install → Login → Deploy)
- **📊 基于经验的导航表**: 根据开发者经验提供清晰的起点建议

#### 更改
- **README 结构**: 重新组织以实现逐步呈现 - 关键信息优先
- <strong>介绍部分</strong>: 重写以向完全的初学者解释 "The Magic of `azd up`"
- <strong>删除重复内容</strong>: 移除了重复的故障排除部分
- <strong>故障排除命令</strong>: 已修正 `azd logs` 引用，改用有效的 `azd monitor --logs`

#### 已修复
- **🔐 认证命令**: 向 cheat-sheet.md 添加了 `azd auth login` 和 `azd auth logout`
- <strong>无效命令引用</strong>: 从 README 故障排除部分移除了剩余的 `azd logs`

#### 说明
- **Scope**: 更改应用于主 README.md 和 resources/cheat-sheet.md
- **Target Audience**: 改进专门针对刚接触 AZD 的开发者

---

### [v3.10.0] - 2026-02-05

#### Azure 开发者 CLI 命令准确性更新
**此版本修正了文档中不存在的 AZD 命令，确保所有代码示例使用有效的 Azure 开发者 CLI 语法。**

#### 已修复
- **🔧 已移除不存在的 AZD 命令**: 对无效命令进行了全面审计和修正:
  - `azd logs`（不存在）→ 已替换为 `azd monitor --logs` 或 Azure CLI 备选命令
  - `azd service` 子命令（不存在）→ 已替换为 `azd show` 和 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 已移除或替换为有效的替代命令
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 标志（不存在）→ 已移除
  - `azd provision --what-if/--rollback` 标志（不存在）→ 已更新为使用 `--preview`
  - `azd config validate`（不存在）→ 已替换为 `azd config list`
  - `azd info`, `azd history`, `azd metrics`（不存在）→ 已移除

- **📚 已更新文件（命令修正）**:
  - `resources/cheat-sheet.md`: 命令参考的大幅修订
  - `docs/deployment/deployment-guide.md`: 修正了回滚和部署策略
  - `docs/troubleshooting/debugging.md`: 修正了日志分析部分
  - `docs/troubleshooting/common-issues.md`: 更新了故障排除命令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正了 AZD 调试部分
  - `docs/getting-started/azd-basics.md`: 修正了监控命令
  - `docs/getting-started/first-project.md`: 更新了监控和调试示例
  - `docs/getting-started/installation.md`: 修正了帮助和版本示例
  - `docs/pre-deployment/application-insights.md`: 修正了查看日志命令
  - `docs/pre-deployment/coordination-patterns.md`: 修正了代理调试命令

- **📝 版本引用已更新**: 
  - `docs/getting-started/installation.md`: 将硬编码的 `1.5.0` 版本更改为通用 `1.x.x` 并附带指向发布页的链接

#### 更改
- <strong>回滚策略</strong>: 更新文档以使用基于 Git 的回滚（AZD 没有内置回滚）
- <strong>日志查看</strong>: 已将 `azd logs` 引用替换为 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 命令
- <strong>性能部分</strong>: 移除了不存在的并行/增量部署标志，并提供了有效替代方案

#### 技术细节
- **有效的 AZD 命令**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 标志**: `--live`, `--logs`, `--overview`
- <strong>已移除功能</strong>: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 说明
- <strong>验证</strong>: 命令已针对 Azure Developer CLI v1.23.x 进行验证

---

### [v3.9.0] - 2026-02-05

#### 研讨会完成及文档质量更新
**此版本完成了交互式研讨会模块，修复了所有损坏的文档链接，并提升了面向使用 Microsoft AZD 的 AI 开发者的整体内容质量。**

#### 新增
- **📝 CONTRIBUTING.md**: 新的贡献指南文档，包含:
  - 关于报告问题和提出更改的清晰说明
  - 新内容的文档标准
  - 代码示例指南和提交信息约定
  - 社区参与信息

#### 完成
- **🎯 研讨会模块 7（总结）**: 已完全完成的总结模块，包含:
  - 研讨会成果的全面总结
  - 掌握的关键概念章节，涵盖 AZD、模板 和 Microsoft Foundry
  - 后续学习路线建议
  - 带有难度评级的研讨会挑战练习
  - 社区反馈和支持链接

- **📚 研讨会模块 3（拆解）**: 更新的学习目标包含:
  - 启用使用 MCP 服务器的 GitHub Copilot 的指南
  - 理解 AZD 模板文件夹结构
  - 基础设施即代码（Bicep）组织模式
  - 动手实验指导

- **🔧 研讨会模块 6（清理）**: 已完成，包含:
  - 资源清理和成本管理目标
  - `azd down` 用于安全地撤销基础设施
  - 软删除的认知服务恢复指南
  - 有关 GitHub Copilot 和 Azure 门户的额外探索提示

#### 已修复
- **🔗 损坏链接修复**: 已解决 15+ 个损坏的内部文档链接:
  - `docs/ai-foundry/ai-model-deployment.md`: 修正了指向 microsoft-foundry-integration.md 的路径
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正了 ai-model-deployment.md 和 production-ai-practices.md 的路径
  - `docs/getting-started/first-project.md`: 将不存在的 cicd-integration.md 替换为 deployment-guide.md
  - `examples/retail-scenario.md`: 修正了 FAQ 和故障排除指南路径
  - `examples/container-app/microservices/README.md`: 修正了课程主页和部署指南路径
  - `resources/faq.md` 和 `resources/glossary.md`: 更新了 AI 章节引用
  - `course-outline.md`: 修正了讲师指南和 AI 研讨会实验引用

- **📅 研讨会状态横幅**: 已从 "Under Construction" 更新为 2026 年 2 月 的活动研讨会状态

- **🔗 研讨会导航**: 修复了 workshop README.md 中指向不存在的 lab-1-azd-basics 文件夹的损坏导航链接

#### 更改
- <strong>研讨会演示</strong>: 移除了 "under construction" 警告，研讨会现已完成并可使用
- <strong>导航一致性</strong>: 确保所有研讨会模块具有正确的模块间导航
- <strong>学习路径引用</strong>: 更新章节交叉引用以使用正确的 microsoft-foundry 路径

#### 已验证
- ✅ 所有英文 Markdown 文件的内部链接均有效
- ✅ 研讨会模块 0-7 已完整，包含学习目标
- ✅ 章节与模块之间的导航功能正常
- ✅ 内容适用于使用 Microsoft AZD 的 AI 开发者
- ✅ 保持面向初学者的语言和结构
- ✅ CONTRIBUTING.md 为社区贡献者提供了清晰的指南

#### 技术实现
- <strong>链接验证</strong>: 自动化 PowerShell 脚本验证了所有 .md 的内部链接
- <strong>内容审核</strong>: 对研讨会完整性和对初学者的适配性进行了人工审查
- <strong>导航系统</strong>: 已应用一致的章节和模块导航模式

#### 注意
- **Scope**: 更改仅应用于英文文档
- **Translations**: 本版本未更新翻译文件夹（自动翻译稍后同步）
- **Workshop Duration**: 完整研讨会现可提供 3-4 小时的动手学习

---

### [v3.8.0] - 2025-11-19

#### 高级文档：监控、安全和多代理模式
**此版本增加了关于 Application Insights 集成、认证模式和生产部署中多代理协调的全面 A 级课程。**

#### 新增
- **📊 Application Insights 集成课程**: 在 `docs/pre-deployment/application-insights.md`:
  - 针对 AZD 的部署，支持自动预配
  - 针对 Application Insights + Log Analytics 的完整 Bicep 模板
  - 带有自定义遥测的可运行 Python 应用（1,200+ 行）
  - AI/LLM 监控模式（Microsoft Foundry Models 令牌/成本跟踪）
  - 6 个 Mermaid 图（架构、分布式追踪、遥测流）
  - 3 个动手练习（告警、仪表板、AI 监控）
  - Kusto 查询示例与成本优化策略
  - 实时指标流和实时调试
  - 40-50 分钟学习时长，含生产就绪模式

- **🔐 认证与安全模式课程**: 在 `docs/getting-started/authsecurity.md`:
  - 3 种认证模式（连接字符串、Key Vault、托管标识）
  - 用于安全部署的完整 Bicep 基础设施模板
  - 带有 Azure SDK 集成的 Node.js 应用代码
  - 3 个完整练习（启用托管标识、用户分配标识、Key Vault 轮换）
  - 安全最佳实践与 RBAC 配置
  - 故障排除指南与成本分析
  - 生产就绪的无密码认证模式

- **🤖 多代理协调模式课程**: 在 `docs/pre-deployment/coordination-patterns.md`:
  - 5 种协调模式（顺序、并行、分层、事件驱动、共识）
  - 完整的协调器服务实现（Python/Flask，1,500+ 行）
  - 3 个专业代理实现（Research、Writer、Editor）
  - 用于消息排队的 Service Bus 集成
  - 用于分布式系统的 Cosmos DB 状态管理
  - 6 个 Mermaid 图展示代理交互
  - 3 个高级练习（超时处理、重试逻辑、断路器）
  - 成本明细（$240-565/month）并附优化策略
  - 用于监控的 Application Insights 集成

#### 增强
- <strong>预部署章节</strong>: 现在包含全面的监控与协调模式
- <strong>入门章节</strong>: 增强了专业认证模式
- <strong>生产就绪性</strong>: 从安全到可观测性实现全面覆盖
- <strong>课程大纲</strong>: 已更新以在第 3 章和第 6 章引用新课程

#### 更改
- <strong>学习进度</strong>: 在整个课程中更好地整合了安全与监控
- <strong>文档质量</strong>: 新课程的一致 A 级标准（95-97%）
- <strong>生产模式</strong>: 对企业部署提供完整的端到端覆盖

#### 改进
- **Developer Experience**: 从开发到生产监控的清晰路径
- **Security Standards**: 身份验证和机密管理的专业模式
- **Observability**: 与 AZD 的完整 Application Insights 集成
- **AI Workloads**: 针对 Microsoft Foundry 模型和多代理系统的专业监控

#### 已验证
- ✅ 所有课程包含完整可运行代码（而非片段）
- ✅ 用于可视学习的 Mermaid 图表（在 3 节课中共 19 张）
- ✅ 带有验证步骤的动手练习（共 9 个）
- ✅ 可通过 `azd up` 部署的生产就绪 Bicep 模板
- ✅ 成本分析和优化策略
- ✅ 故障排除指南与最佳实践
- ✅ 知识检查点及验证命令

#### 文档评分结果
- **docs/pre-deployment/application-insights.md**: - 全面的监控指南
- **docs/getting-started/authsecurity.md**: - 专业的安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 高级多代理架构
- **Overall New Content**: - 持续一致的高质量标准

#### 技术实现
- **Application Insights**: 日志分析 + 自定义遥测 + 分布式跟踪
- **Authentication**: 托管身份 + Key Vault + RBAC 模式
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + 编排
- **Monitoring**: 实时指标 + Kusto 查询 + 警报 + 仪表板
- **Cost Management**: 采样策略、保留策略、预算控制

### [v3.7.0] - 2025-11-19

#### 文档质量改进与新的 Microsoft Foundry 模型示例
**此版本提升了整个仓库的文档质量，并新增了一个完整的 Microsoft Foundry 模型部署示例，带有 gpt-4.1 聊天界面。**

#### 新增
- **🤖 Microsoft Foundry Models Chat Example**: 在 `examples/azure-openai-chat/` 中提供的完整 gpt-4.1 部署及可运行实现：
  - 完整的 Microsoft Foundry 模型基础设施（gpt-4.1 模型部署）
  - 带会话历史记录的 Python 命令行聊天界面
  - 与 Key Vault 集成以安全存储 API 密钥
  - 令牌使用跟踪与成本估算
  - 速率限制与错误处理
  - 包含 35–45 分钟部署指南的详尽 README
  - 11 个生产就绪文件（Bicep 模板、Python 应用、配置）
- **📚 Documentation Exercises**: 在配置指南中新增动手练习：
  - 练习 1：多环境配置（15 分钟）
  - 练习 2：机密管理实践（10 分钟）
  - 明确的成功标准与验证步骤
- **✅ Deployment Verification**: 在部署指南中添加了验证部分：
  - 健康检查程序
  - 成功标准检查表
  - 所有部署命令的预期输出
  - 故障排除快速参考

#### 增强
- **examples/README.md**: 更新为 A 级质量（93%）：
  - 在所有相关部分中添加了 azure-openai-chat
  - 将本地示例数量从 3 更新为 4
  - 添加到 AI 应用示例表中
  - 集成到面向中级用户的快速入门中
  - 添加到 Microsoft Foundry 模板部分
  - 更新了比较矩阵和技术发现部分
- **Documentation Quality**: docs 文件夹的文档质量从 B+（87%）提升至 A-（92%）：
  - 在关键命令示例中添加了预期输出
  - 为配置更改包含了验证步骤
  - 通过实用练习增强了动手学习

#### 更改
- **Learning Progression**: 更好地为中级学习者整合 AI 示例
- **Documentation Structure**: 更具可操作性的练习并带有明确结果
- **Verification Process**: 在关键工作流中添加了明确的成功标准

#### 改进
- **Developer Experience**: Microsoft Foundry 模型的部署现在需要 35–45 分钟（相比复杂替代方案的 60–90 分钟）
- **Cost Transparency**: Microsoft Foundry 模型示例的明确成本估算（$50-200/月）
- **Learning Path**: AI 开发者通过 azure-openai-chat 拥有明确的入门路径
- **Documentation Standards**: 一致的预期输出和验证步骤

#### 已验证
- ✅ Microsoft Foundry 模型示例可通过 `azd up` 完全运行
- ✅ 所有 11 个实现文件语法正确
- ✅ README 指示与实际部署体验相符
- ✅ 文档链接已在 8+ 处更新
- ✅ 示例索引准确反映了 4 个本地示例
- ✅ 表格中没有重复的外部链接
- ✅ 所有导航引用均正确

#### 技术实现
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps 模式
- **Security**: 已准备好托管身份，机密存放在 Key Vault
- **Monitoring**: Application Insights 集成
- **Cost Management**: 令牌跟踪与使用优化
- **Deployment**: 使用单个 `azd up` 命令完成整个设置

### [v3.6.0] - 2025-11-19

#### 重大更新：容器应用部署示例
**此版本引入了使用 Azure Developer CLI (AZD) 的全面生产就绪容器应用部署示例，附带完整文档并集成到学习路径中。**

#### 新增
- **🚀 Container App Examples**: 在 `examples/container-app/` 中新增本地示例：
  - [主指南](examples/container-app/README.md): 容器化部署的完整概述、快速入门、生产和高级模式
  - [简单 Flask API](../../examples/container-app/simple-flask-api): 适合初学者的 REST API，具备按需缩减为零、健康探针、监控和故障排除
  - [微服务架构](../../examples/container-app/microservices): 生产就绪的多服务部署（API 网关、产品、订单、用户、通知）、异步消息、Service Bus、Cosmos DB、Azure SQL、分布式跟踪、蓝绿/金丝雀部署
- **Best Practices**: 针对容器化工作负载的安全、监控、成本优化和 CI/CD 指导
- **Code Samples**: 完整的 `azure.yaml`、Bicep 模板，以及多语言服务实现（Python、Node.js、C#、Go）
- **Testing & Troubleshooting**: 端到端测试场景、监控命令、故障排除指导

#### 更改
- **README.md**: 更新以在“本地示例 - 容器应用”下突出并链接新的容器应用示例
- **examples/README.md**: 更新以突出容器应用示例、添加比较矩阵条目，并更新技术/架构引用
- **Course Outline & Study Guide**: 更新以在相关章节引用新的容器应用示例和部署模式

#### 已验证
- ✅ 所有新示例均可通过 `azd up` 部署并遵循最佳实践
- ✅ 文档交叉链接和导航已更新
- ✅ 示例涵盖从初学者到高级场景，包括生产微服务

#### 备注
- **Scope**: 仅限英文文档和示例
- **Next Steps**: 在未来版本中扩展更多高级容器模式和 CI/CD 自动化

### [v3.5.0] - 2025-11-19

#### 产品更名：Microsoft Foundry
**此版本在所有英文文档中实施了从 "Microsoft Foundry" 到 "Microsoft Foundry" 的全面产品名称更改，以反映微软的官方品牌重塑。**

#### 更改
- **🔄 Product Name Update**: 将产品名称从 "Microsoft Foundry" 完全更名为 "Microsoft Foundry"
  - 更新了 `docs/` 文件夹中英文文档的所有引用
  - 重命名文件夹：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 重命名文件：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 总计：在 7 个文档文件中更新了 23 个内容引用

- **📁 Folder Structure Changes**:
  - 将 `docs/ai-foundry/` 重命名为 `docs/microsoft-foundry/`
  - 所有交叉引用已更新以反映新的文件夹结构
  - 验证了所有文档中的导航链接

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有内部链接已更新以引用新的文件名

#### 更新的文件
- <strong>章节文档</strong>（7 个文件）:
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 个导航链接已更新
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新了 4 处产品名称引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（来自之前的更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新了 3 处引用（概述、社区反馈、文档）
  - `docs/getting-started/azd-basics.md` - 更新了 4 个交叉引用链接
  - `docs/getting-started/first-project.md` - 更新了 2 个章节导航链接
  - `docs/getting-started/installation.md` - 更新了 2 个下一章节链接
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新了 3 处引用（导航、Discord 社区）
  - `docs/troubleshooting/common-issues.md` - 更新了 1 个导航链接
  - `docs/troubleshooting/debugging.md` - 更新了 1 个导航链接

- <strong>课程结构文件</strong>（2 个文件）:
  - `README.md` - 更新了 17 个引用（课程概述、章节标题、模板部分、社区见解）
  - `course-outline.md` - 更新了 14 个引用（概述、学习目标、章节资源）

#### 已验证
- ✅ 英文文档中不再存在 "ai-foundry" 文件夹路径引用
- ✅ 英文文档中不再存在 "Microsoft Foundry" 产品名称引用
- ✅ 所有导航链接在新文件夹结构下均可正常工作
- ✅ 文件和文件夹重命名已成功完成
- ✅ 章节之间的交叉引用已验证

#### 备注
- **Scope**: 更改仅应用于 `docs/` 文件夹中的英文文档
- **Translations**: 本版本未更新翻译文件夹（`translations/`）
- **Workshop**: 本版本未更新工作坊材料（`workshop/`）
- **Examples**: 示例文件可能仍引用旧的命名（将在未来更新中处理）
- **External Links**: 外部 URL 和 GitHub 仓库引用保持不变

#### 贡献者迁移指南
如果您的本地分支或文档引用了旧结构：
1. 更新文件夹引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新文件引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替换产品名称："Microsoft Foundry" → "Microsoft Foundry"
4. 验证所有内部文档链接仍然可用

---

### [v3.4.0] - 2025-10-24

#### 基础设施预览与验证增强
**此版本为新的 Azure Developer CLI 预览功能引入了全面支持，并提升了工作坊用户体验。**

#### 新增
- **🧪 azd provision --preview Feature Documentation**: 对新的基础设施预览功能进行了全面覆盖
  - 命令参考和速查表中的使用示例
  - 在预配指南中进行了详细集成，包含用例与收益
  - 预检集成以实现更安全的部署验证
  - 入门指南更新，包含以安全为先的部署实践
- **🚧 Workshop Status Banner**: 用于指示工作坊开发状态的专业 HTML 横幅
  - 渐变设计与施工指示，便于清晰地向用户传达信息
  - 最近更新时间戳以保持透明度
  - 针对所有设备类型的移动响应式设计

#### 增强
- **Infrastructure Safety**: 在整个部署文档中集成了预览功能
- **Pre-deployment Validation**: 自动化脚本现在包含基础设施预览测试
- **Developer Workflow**: 更新了命令序列，将预览作为最佳实践纳入
- **Workshop Experience**: 为用户明确了内容开发状态的预期

#### 更改
- **Deployment Best Practices**: 现在推荐以预览为先的工作流程
- **Documentation Flow**: 将基础设施验证提前到学习流程中
- **Workshop Presentation**: 使用专业的状态沟通并提供明确的开发时间表

#### 改进
- **Safety-First Approach**: 现在可以在部署前验证基础设施更改
- **Team Collaboration**: 预览结果可以共享以供审查和批准
- **Cost Awareness**: 在预配前更好地了解资源成本
- **Risk Mitigation**: 通过提前验证减少部署失败

#### 技术实现
- **Multi-document Integration**: 预览功能已在 4 个关键文件中记录
- **Command Patterns**: 文档中具有一致的语法和示例
- **Best Practice Integration**: 在验证工作流和脚本中包含了预览
- **Visual Indicators**: 明确的“新”功能标识以便发现

#### 工作坊基础设施
- **Status Communication**: 带渐变样式的专业 HTML 横幅
- **User Experience**: 清晰的开发状态可防止混淆
- **Professional Presentation**: 同时设定预期并维持仓库可信度
- **Timeline Transparency**: 2025 年 10 月的最近更新时间戳以便问责

### [v3.3.0] - 2025-09-24

#### 增强的工作坊材料与互动学习体验
**此版本引入了综合的工作坊材料，包含基于浏览器的交互式指南和结构化学习路径。**

#### 新增
- **🎥 互动研讨会指南**: 基于浏览器的研讨会体验，具有 MkDocs 预览功能
- **📝 结构化研讨会说明**: 从发现到自定义的 7 步引导学习路径
  - 0-Introduction: 研讨会概览与设置
  - 1-Select-AI-Template: 模板发现与选择流程
  - 2-Validate-AI-Template: 部署与验证程序
  - 3-Deconstruct-AI-Template: 理解模板架构
  - 4-Configure-AI-Template: 配置与自定义
  - 5-Customize-AI-Template: 高级修改与迭代
  - 6-Teardown-Infrastructure: 清理与资源管理
  - 7-Wrap-up: 总结与下一步
- **🛠️ 研讨会工具**: 使用 Material 主题的 MkDocs 配置以增强学习体验
- **🎯 实操学习路径**: 3 步方法论（发现 → 部署 → 自定义）
- **📱 GitHub Codespaces 集成**: 无缝的开发环境设置

#### 增强功能
- **AI 研讨会实验室**: 扩展为全面的 2-3 小时结构化学习体验
- <strong>研讨会文档</strong>: 专业呈现，带导航和可视化辅助
- <strong>学习进阶</strong>: 清晰的分步指导，从模板选择到生产部署
- <strong>开发者体验</strong>: 集成工具以简化开发工作流

#### 改进
- <strong>可访问性</strong>: 基于浏览器的界面，带搜索、复制功能和主题切换
- <strong>自定进度学习</strong>: 灵活的研讨会结构，适应不同学习速度
- <strong>实践应用</strong>: 真实的 AI 模板部署场景
- <strong>社区集成</strong>: 集成 Discord 提供研讨会支持与协作

#### 研讨会功能
- <strong>内置搜索</strong>: 快速关键词和课程查找
- <strong>复制代码块</strong>: 所有代码示例支持悬停复制功能
- <strong>主题切换</strong>: 支持深色/浅色模式以满足不同偏好
- <strong>视觉资源</strong>: 屏幕截图和图表以增强理解
- <strong>帮助集成</strong>: 直接访问 Discord 的社区支持

### [v3.2.0] - 2025-09-17

#### 主要导航重构与基于章节的学习系统
**此版本引入了全面的基于章节的学习结构，并在整个仓库中增强了导航。**

#### 新增
- **📚 基于章节的学习系统**: 将整个课程重构为 8 个渐进式学习章节
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 全面导航系统**: 所有文档均采用一致的导航页眉和页脚
- **🎯 进度追踪**: 课程完成检查表与学习验证系统
- **🗺️ 学习路径指导**: 为不同经验水平和目标提供清晰的切入点
- **🔗 交叉引用导航**: 明确链接相关章节和先决条件

#### 增强
- **README Structure**: 转变为结构化学习平台，采用基于章节的组织
- **Documentation Navigation**: 每页现在都包含章节上下文和进度指导
- **Template Organization**: 示例和模板映射到相应的学习章节
- **Resource Integration**: 备忘单、常见问题和学习指南连接到相关章节
- **Workshop Integration**: 实操实验与多个章节的学习目标相对应

#### 变更
- **Learning Progression**: 从线性文档迁移到灵活的基于章节的学习
- **Configuration Placement**: 将配置指南重新定位为 Chapter 3 以优化学习流程
- **AI Content Integration**: 全面更好地将 AI 专属内容整合到学习旅程中
- **Production Content**: 将高级模式整合到 Chapter 8，面向企业学习者

#### 改进
- <strong>用户体验</strong>: 清晰的导航面包屑和章节进度指示
- <strong>可访问性</strong>: 一致的导航模式便于课程遍历
- <strong>专业呈现</strong>: 类大学课程结构，适合学术和企业培训
- <strong>学习效率</strong>: 通过改进组织减少查找相关内容所需时间

#### 技术实现
- **Navigation Headers**: 在 40+ 文档文件中标准化章节导航
- **Footer Navigation**: 一致的进度指导和章节完成指示
- **Cross-Linking**: 全面的内部链接系统连接相关概念
- **Chapter Mapping**: 模板和示例与学习目标明确关联

#### 学习指南增强
- **📚 综合学习目标**: 将学习指南重构以与 8 章系统对齐
- **🎯 基于章节的评估**: 每章包含特定学习目标和实践练习
- **📋 进度追踪**: 每周学习计划，具有可衡量的结果和完成检查表
- **❓ 评估问题**: 每章的知识验证问题，具有专业结果导向
- **🛠️ 实践练习**: 带真实部署场景与故障排查的动手活动
- **📊 技能进阶**: 从基础概念到企业模式的清晰提升，着眼职业发展
- **🎓 认证框架**: 专业发展结果与社区认可系统
- **⏱️ 时间管理**: 带里程碑验证的结构化 10 周学习计划

### [v3.1.0] - 2025-09-17

#### 增强的多代理 AI 解决方案
**此版本改进了多代理零售解决方案，优化了代理命名并增强了文档。**

#### 变更
- **Multi-Agent Terminology**: 将 "Cora agent" 替换为 "Customer agent"，以便更清晰理解零售多代理解决方案
- **Agent Architecture**: 更新所有文档、ARM 模板和代码示例以使用一致的 "Customer agent" 命名
- **Configuration Examples**: 采用现代化的代理配置模式并更新命名约定
- **Documentation Consistency**: 确保所有引用使用专业且描述性的代理名称

#### 增强
- **ARM Template Package**: 更新 retail-multiagent-arm-template，包含 Customer agent 引用
- **Architecture Diagrams**: 刷新 Mermaid 图表并更新代理命名
- **Code Examples**: Python 类和实现示例现使用 CustomerAgent 命名
- **Environment Variables**: 更新所有部署脚本以使用 CUSTOMER_AGENT_NAME 约定

#### 改进
- **Developer Experience**: 文档中代理角色和职责更清晰
- **Production Readiness**: 更好地符合企业命名约定
- **Learning Materials**: 为教学目的采用更直观的代理命名
- **Template Usability**: 简化对代理功能和部署模式的理解

#### 技术细节
- 在 Mermaid 架构图中更新为 CustomerAgent 引用
- 在 Python 示例中将 CoraAgent 类名替换为 CustomerAgent
- 修改 ARM 模板 JSON 配置以使用 "customer" 代理类型
- 将环境变量从 CORA_AGENT_* 模式更新为 CUSTOMER_AGENT_* 模式
- 刷新所有部署命令和容器配置

### [v3.0.0] - 2025-09-12

#### 重大变更 - 面向 AI 开发者的焦点与 Microsoft Foundry 集成
**此版本将仓库转变为面向 AI 的全面学习资源，并集成了 Microsoft Foundry。**

#### 新增
- **🤖 AI 优先学习路径**: 完整重构，优先面向 AI 开发者和工程师
- **Microsoft Foundry Integration Guide**: 关于将 AZD 与 Microsoft Foundry 服务连接的全面文档
- **AI Model Deployment Patterns**: 涵盖模型选择、配置和生产部署策略的详细指南
- **AI Workshop Lab**: 2-3 小时的动手研讨会，用于将 AI 应用转换为可由 AZD 部署的解决方案
- **Production AI Best Practices**: 企业级的模式，用于扩展、监控和保护 AI 工作负载
- **AI-Specific Troubleshooting Guide**: 针对 Microsoft Foundry 模型、认知服务和 AI 部署问题的全面故障排查
- **AI Template Gallery**: 精选 Microsoft Foundry 模板集合，带复杂度评级
- **Workshop Materials**: 完整的研讨会结构，含实操实验和参考资料

#### 增强
- **README Structure**: 以 AI 开发者为中心，并基于 45% 来自 Microsoft Foundry Discord 的社区兴趣数据
- **Learning Paths**: 为 AI 开发者提供专门路径，同时保留面向学生和 DevOps 工程师的传统路径
- **Template Recommendations**: 推荐的 AI 模板包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart
- **Community Integration**: 增强的 Discord 社区支持，含 AI 专属频道与讨论

#### 安全与生产重点
- **Managed Identity Patterns**: 面向 AI 的身份验证和安全配置
- **Cost Optimization**: 针对 AI 工作负载的令牌使用跟踪与预算控制
- **Multi-Region Deployment**: 全球 AI 应用部署策略
- **Performance Monitoring**: AI 专属指标和 Application Insights 集成

#### 文档质量
- **Linear Course Structure**: 从入门到高级 AI 部署模式的逻辑进阶
- **Validated URLs**: 所有外部仓库链接已验证且可访问
- **Complete Reference**: 所有内部文档链接已验证且可用
- **Production Ready**: 带有真实示例的企业部署模式

### [v2.0.0] - 2025-09-09

#### 重大变更 - 仓库重组与专业化增强
**此版本代表了仓库结构和内容展示的重大改造。**

#### 新增
- **Structured Learning Framework**: 所有文档页面现包含介绍、学习目标和学习成果部分
- **Navigation System**: 在所有文档中添加了上/下一课链接以指导学习进度
- **Study Guide**: 包含学习目标、练习和评估材料的综合 study-guide.md
- **Professional Presentation**: 为提高可访问性和专业外观，移除了所有表情符号图标
- **Enhanced Content Structure**: 改进学习材料的组织和流程

#### 变更
- **Documentation Format**: 标准化所有文档，采用一致的以学习为中心的结构
- **Navigation Flow**: 实现贯穿所有学习材料的逻辑进阶
- **Content Presentation**: 移除装饰性元素，采用清晰、专业的格式
- **Link Structure**: 更新所有内部链接以支持新导航系统

#### 改进
- **Accessibility**: 移除表情符号依赖以提升屏幕阅读器兼容性
- **Professional Appearance**: 干净的学术风格呈现，适合企业学习
- **Learning Experience**: 采用结构化方法，为每课提供清晰的目标与结果
- **Content Organization**: 更好的逻辑流程和相关主题之间的连接

### [v1.0.0] - 2025-09-09

#### 初始发布 - 全面的 AZD 学习仓库

#### 新增
- <strong>核心文档结构</strong>
  - 完整的入门指南系列
  - 全面的部署与配置文档
  - 详细的故障排查资源与调试指南
  - 预部署验证工具与流程

- <strong>入门模块</strong>
  - AZD 基础：核心概念与术语
  - 安装指南：平台特定的设置说明
  - 配置指南：环境设置与身份验证
  - 第一个项目教程：逐步的实操学习

- <strong>部署与配置模块</strong>
  - 部署指南：完整的工作流文档
  - 配置指南：使用 Bicep 的基础设施即代码
  - 面向生产部署的最佳实践
  - 多服务架构模式

- <strong>预部署验证模块</strong>
  - 容量规划：Azure 资源可用性验证
  - SKU 选择：全面的服务等级指南
  - 预检检查：自动化验证脚本（PowerShell 和 Bash）
  - 成本估算与预算规划工具

- <strong>故障排查模块</strong>
  - 常见问题：常见问题及解决方案
  - 调试指南：系统化的故障排查方法
  - 高级诊断技术与工具
  - 性能监控与优化

- <strong>资源与参考</strong>
  - 命令速查表：常用命令快速参考
  - 术语表：全面的术语与缩写定义
  - 常见问题解答：对常见问题的详细解答
  - 外部资源链接与社区连接

- <strong>示例与模板</strong>
  - 简单 Web 应用示例
  - 静态网站部署模板
  - 容器应用配置
  - 数据库集成模式
  - 微服务架构示例
  - Serverless 函数实现

#### 功能
- <strong>跨平台支持</strong>: Windows、macOS 和 Linux 的安装与配置指南
- <strong>多技能等级</strong>: 内容面向学生到专业开发者
- <strong>实践导向</strong>: 实操示例与真实场景
- <strong>全面覆盖</strong>: 从基本概念到高级企业模式
- <strong>安全优先</strong>: 在各处集成安全最佳实践
- <strong>成本优化</strong>: 关于经济性部署与资源管理的建议

#### 文档质量
- <strong>详细代码示例</strong>: 实用且经过测试的代码示例
- <strong>逐步说明</strong>: 清晰、可操作的指导
- <strong>全面错误处理</strong>: 常见问题的故障排查
- <strong>最佳实践整合</strong>: 行业标准与建议
- <strong>版本兼容性</strong>: 与最新 Azure 服务和 azd 功能保持同步

## 计划的未来增强

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- <strong>多模型支持</strong>: Hugging Face、Azure Machine Learning 和自定义模型的集成模式
- **AI 代理框架**: LangChain、Semantic Kernel 和 AutoGen 部署模板
- **高级 RAG 模式**: 除 Azure AI Search 之外的向量数据库选项（Pinecone、Weaviate 等）
- **AI 可观测性**: 强化模型性能、令牌使用和响应质量的监控

#### 开发者体验
- **VS Code 扩展**: 集成的 AZD + Microsoft Foundry 开发体验
- **GitHub Copilot 集成**: AI 辅助的 AZD 模板生成
- <strong>交互式教程</strong>: 针对 AI 场景的带自动校验的动手编码练习
- <strong>视频内容</strong>: 针对视觉学习者、侧重 AI 部署的补充视频教程

### 版本 4.0.0 (计划)
#### 企业级 AI 模式
- <strong>治理框架</strong>: AI 模型治理、合规与审计追踪
- **多租户 AI**: 为多个客户提供隔离 AI 服务的模式
- **边缘 AI 部署**: 与 Azure IoT Edge 和容器实例的集成
- **混合云 AI**: 针对 AI 工作负载的多云与混合部署模式

#### 高级功能
- **AI 流水线自动化**: 与 Azure Machine Learning 流水线的 MLOps 集成
- <strong>高级安全</strong>: 零信任模式、私有端点和高级威胁防护
- <strong>性能优化</strong>: 面向高吞吐量 AI 应用的高级调优与扩展策略
- <strong>全局分发</strong>: 针对 AI 应用的内容分发与边缘缓存模式

### 版本 3.0.0 (计划) - 已被当前发布取代
#### 建议的新增内容 - 现已在 v3.0.0 中实现
- ✅ **面向 AI 的内容**: 全面 Microsoft Foundry 集成（已完成）
- ✅ <strong>交互式教程</strong>: AI 实战实验室（已完成）
- ✅ <strong>高级安全模块</strong>: AI 特定的安全模式（已完成）
- ✅ <strong>性能优化</strong>: AI 工作负载调优策略（已完成）

### 版本 2.1.0 (计划) - 在 v3.0.0 中部分实现
#### 小幅增强 - 部分在当前发布中完成
- ✅ <strong>附加示例</strong>: 面向 AI 的部署场景（已完成）
- ✅ <strong>扩展常见问题</strong>: AI 特定问题与故障排除（已完成）
- <strong>工具集成</strong>: 增强的 IDE 和编辑器集成指南
- ✅ <strong>监控扩展</strong>: AI 特定的监控与告警模式（已完成）

#### 仍计划在未来发布
- <strong>移动友好文档</strong>: 面向移动学习的响应式设计
- <strong>离线访问</strong>: 可下载的文档包
- **增强的 IDE 集成**: 面向 AZD + AI 工作流的 VS Code 扩展
- <strong>社区仪表板</strong>: 实时社区指标与贡献跟踪

## 向更新日志做贡献

### 报告变更
当为此存储库做出贡献时，请确保更新日志条目包含：

1. <strong>版本号</strong>: 遵循语义化版本（major.minor.patch）
2. <strong>日期</strong>: 发布日期或更新日期，格式为 YYYY-MM-DD
3. <strong>类别</strong>: 新增、变更、弃用、移除、修复、安全
4. <strong>清晰描述</strong>: 对变更内容的扼要说明
5. <strong>影响评估</strong>: 变更如何影响现有用户

### 变更类别

#### 新增
- 新功能、文档章节或能力
- 新示例、模板或学习资源
- 额外的工具、脚本或实用程序

#### 变更
- 对现有功能或文档的修改
- 用于提高清晰度或准确性的更新
- 内容或组织结构的重组

#### 弃用
- 正在逐步淘汰的特性或方法
- 计划移除的文档章节
- 有更好替代方案的方法

#### 移除
- 不再相关的功能、文档或示例
- 过时信息或已弃用的方法
- 冗余或已合并的内容

#### 修复
- 文档或代码中的错误修正
- 已报告问题或故障的解决
- 提高准确性或功能性的改进

#### 安全
- 与安全相关的改进或修复
- 安全最佳实践的更新
- 安全漏洞的修复

### 语义化版本指南

#### 主版本 (X.0.0)
- 需要用户操作的破坏性变更
- 内容或组织的重大重构
- 更改基本方法或方法论的变动

#### 次版本 (X.Y.0)
- 新功能或内容添加
- 在保持向后兼容的情况下的增强
- 额外的示例、工具或资源

#### 补丁版本 (X.Y.Z)
- 错误修复与更正
- 对现有内容的小幅改进
- 澄清与小幅增强

## 社区反馈与建议

我们积极鼓励社区反馈，以改进此学习资源：

### 如何提供反馈
- **GitHub Issues**: 报告问题或提出改进建议（欢迎 AI 相关问题）
- **Discord Discussions**: 分享想法并与 Microsoft Foundry 社区互动
- **Pull Requests**: 直接为内容贡献改进，特别是 AI 模板和指南
- **Microsoft Foundry Discord**: 在 #Azure 频道参与 AZD + AI 讨论
- <strong>社区论坛</strong>: 参与更广泛的 Azure 开发者讨论

### 反馈类别
- **AI 内容准确性**: 对 AI 服务集成与部署信息的纠正
- <strong>学习体验</strong>: 改善 AI 开发者学习流程的建议
- **缺失的 AI 内容**: 请求更多 AI 模板、模式或示例
- <strong>可访问性</strong>: 针对不同学习需求的改进
- **AI 工具集成**: 改进 AI 开发工作流集成的建议
- **生产级 AI 模式**: 企业级 AI 部署模式请求

### 响应承诺
- <strong>问题响应</strong>: 对报告的问题在 48 小时内响应
- <strong>功能请求</strong>: 在一周内评估
- <strong>社区贡献</strong>: 在一周内审查
- <strong>安全问题</strong>: 优先处理并加速响应

## 维护计划

### 定期更新
- <strong>每月审查</strong>: 内容准确性和链接验证
- <strong>季度更新</strong>: 主要内容的新增和改进
- <strong>半年审查</strong>: 全面重组与增强
- <strong>年度发布</strong>: 带有重大改进的主要版本更新

### 监控与质量保证
- <strong>自动化测试</strong>: 定期验证代码示例和链接
- <strong>社区反馈整合</strong>: 定期采纳用户建议
- <strong>技术更新</strong>: 与最新的 Azure 服务和 azd 发布保持一致
- <strong>可访问性审计</strong>: 定期审查包容性设计原则

## 版本支持策略

### 当前版本支持
- <strong>最新主版本</strong>: 提供全面支持并定期更新
- <strong>上一个主版本</strong>: 在 12 个月内提供安全更新和关键修复
- <strong>遗留版本</strong>: 仅社区支持，无官方更新

### 迁移指南
当发布主版本时，我们提供：
- <strong>迁移指南</strong>: 逐步迁移说明
- <strong>兼容性说明</strong>: 有关破坏性变更的详细信息
- <strong>工具支持</strong>: 用于辅助迁移的脚本或实用工具
- <strong>社区支持</strong>: 专门的迁移问答论坛

---

<strong>导航</strong>
- <strong>上一课</strong>: [学习指南](resources/study-guide.md)
- <strong>下一课</strong>: 返回到 [主 README](README.md)

<strong>保持更新</strong>: 关注此仓库以获取有关新版本和学习材料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:  
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们尽力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。原始文件的母语版本应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
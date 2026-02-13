# 更新日志 - AZD For Beginners

## 介绍

此更新日志记录 AZD For Beginners 存储库的所有重大更改、更新和改进。我们遵循语义版本控制原则并维护此日志，以帮助用户了解各版本之间的变化。

## 学习目标

通过查看此更新日志，您将：
- 了解新功能和新增内容
- 理解对现有文档的改进
- 跟踪错误修复和更正以确保准确性
- 关注学习材料随时间的演进

## 学习成果

在审阅更新条目后，您将能够：
- 识别可用于学习的新内容和资源
- 了解哪些章节已更新或改进
- 根据最新材料规划您的学习路径
- 提供反馈和建议以便未来改进

## 版本历史

### [v3.17.0] - 2026-02-05

#### 章节导航增强
**此版本通过增强的表格格式改进了 README.md 的章节导航。**

#### 更改
- **Course Map Table**：增强以包含直接课程链接、时长估算和复杂度评级
- **Folder Cleanup**：删除冗余旧文件夹 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**：已验证课程地图表中的 21+ 个内部链接

### [v3.16.0] - 2026-02-05

#### 产品名称更新
**此版本将产品引用更新为当前的 Microsoft 品牌。**

#### 更改
- **Azure AI Foundry → Microsoft Foundry**：已在非翻译文件中更新所有引用
- **Azure AI Agent Service → Foundry Agents**：服务名称已更新以反映当前品牌

#### 更新的文件
- `README.md` - 课程主页面
- `changelog.md` - 版本历史
- `course-outline.md` - 课程结构
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 示例文档
- `workshop/README.md` - 工作坊主页面
- `workshop/docs/index.md` - 工作坊索引
- `workshop/docs/instructions/*.md` - 所有工作坊说明文件

---

### [v3.15.0] - 2026-02-05

#### 主要仓库重构：基于章节的文件夹命名
**此版本将文档重组为专用的章节文件夹，以便更清晰的导航。**

#### 文件夹重命名
旧文件夹已被按章节编号的文件夹替换：
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
- **📚 Chapter README files**：在每个章节文件夹中创建 README.md，包含：
  - 学习目标和时长
  - 带描述的课程表
  - 快速入门命令
  - 到其他章节的导航

#### 更改
- **🔗 更新所有内部链接**：78+ 路径已在所有文档文件中更新
- **🗺️ Main README.md**：将课程地图更新为新的章节结构
- **📝 examples/README.md**：更新到章节文件夹的交叉引用

#### 删除
- 旧的文件夹结构 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 仓库重构：章节导航
**此版本新增了章节导航 README 文件（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新的 AI 代理指南
**此版本添加了使用 Azure Developer CLI 部署 AI 代理的全面指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**：完整指南，涵盖：
  - 什么是 AI 代理以及它们与聊天机器人的区别
  - 三个快速启动代理模板 (Foundry Agents, Prompty, RAG)
  - 代理架构模式（单代理、RAG、多代理）
  - 工具配置与定制
  - 监控与指标跟踪
  - 成本考量与优化
  - 常见故障排查场景
  - 三个实操练习及成功准则

#### 内容结构
- **介绍**：面向初学者的代理概念
- **快速入门**：使用 `azd init --template get-started-with-ai-agents` 部署代理
- **架构模式**：代理模式的可视化图示
- **配置**：工具设置与环境变量
- **监控**：与 Application Insights 集成
- **练习**：渐进式实操学习（每个 20-45 分钟）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 环境更新
**此版本更新了开发容器配置，采用现代工具并为 AZD 学习体验提供更好的默认设置。**

#### 更改
- **🐳 Base Image**：从 `python:3.12-bullseye` 更新为 `python:3.12-bookworm`（最新的 Debian 稳定版）
- **📛 Container Name**：将名称从 "Python 3" 重命名为 "AZD for Beginners" 以提高清晰度

#### 新增
- **🔧 新的 Dev 容器功能**：
  - 启用 Bicep 支持的 `azure-cli`
  - `node:20`（用于 AZD 模板的 LTS 版本）
  - `github-cli` 用于模板管理
  - `docker-in-docker` 用于容器应用部署

- **🔌 端口转发**：为常见开发预配置端口：
  - 8000 (MkDocs 预览)
  - 3000 (Web 应用)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 新的 VS Code 扩展**：
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

- **⚙️ VS Code 设置**：添加了 Python 解释器、保存时格式化和空白字符修剪的默认设置

- **📦 更新 requirements-dev.txt**：
  - 添加了 MkDocs 压缩插件
  - 添加 pre-commit 以确保代码质量
  - 添加 Azure SDK 包（azure-identity, azure-mgmt-resource）

#### 修复
- **Post-Create Command**：现在在容器启动时验证 AZD 和 Azure CLI 是否已安装

---

### [v3.11.0] - 2026-02-05

#### 面向初学者的 README 大修
**此版本显著改进了 README.md，使其对初学者更友好，并为 AI 开发者添加了重要资源。**

#### 新增
- **🆚 Azure CLI vs AZD 比较**：清晰说明何时使用各工具并附实用示例
- **🌟 Awesome AZD 链接**：指向社区模板画廊和贡献资源的直接链接：
  - [Awesome AZD 画廊](https://azure.github.io/awesome-azd/) - 200+ 可直接部署的模板
  - [提交模板](https://github.com/Azure/awesome-azd/issues) - 社区贡献
- **🎯 快速入门指南**：简化的三步入门部分（安装 → 登录 → 部署）
- **📊 基于经验的导航表**：根据开发者经验清晰指引从哪里开始

#### 更改
- **README 结构**：为渐进式揭露进行了重组——先展示关键信息
- **介绍部分**：已重写以向完全的初学者解释 “`azd up` 的魔力”
- **删除重复内容**：移除重复的故障排查部分
- **故障排查命令**：将 `azd logs` 引用修正为有效的 `azd monitor --logs`

#### 修复
- **🔐 身份验证命令**：在 cheat-sheet.md 中添加了 `azd auth login` 和 `azd auth logout`
- **无效命令引用**：从 README 故障排查部分移除了剩余的 `azd logs`

#### 备注
- **范围**：更改应用于主 README.md 和 resources/cheat-sheet.md
- **目标受众**：改进专门面向 AZD 新手的开发者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 命令准确性更新
**此版本修正了文档中不存在的 AZD 命令，确保所有代码示例使用有效的 Azure Developer CLI 语法。**

#### 修复
- **🔧 删除不存在的 AZD 命令**：对无效命令进行了全面审计和更正：
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: 命令参考的大幅修订
  - `docs/deployment/deployment-guide.md`: 修正回滚和部署策略
  - `docs/troubleshooting/debugging.md`: 修正日志分析部分
  - `docs/troubleshooting/common-issues.md`: 更新故障排查命令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正 AZD 调试部分
  - `docs/getting-started/azd-basics.md`: 修正监控命令
  - `docs/getting-started/first-project.md`: 更新监控和调试示例
  - `docs/getting-started/installation.md`: 修正帮助和版本示例
  - `docs/pre-deployment/application-insights.md`: 修正日志查看命令
  - `docs/pre-deployment/coordination-patterns.md`: 修正代理调试命令

- **📝 版本引用已更新**：
  - `docs/getting-started/installation.md`: 将硬编码的 `1.5.0` 版本更改为通用的 `1.x.x` 并附带发布链接

#### 更改
- **回滚策略**：将文档更新为使用基于 Git 的回滚（AZD 没有原生回滚）
- **日志查看**：将 `azd logs` 引用替换为 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 命令
- **性能部分**：移除不存在的并行/增量部署标志，提供有效的替代方案

#### 技术细节
- **有效的 AZD 命令**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **有效的 azd monitor 标志**: `--live`, `--logs`, `--overview`
- **已移除的功能**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 备注
- **验证**: 命令已针对 Azure Developer CLI v1.23.x 进行验证

---

### [v3.9.0] - 2026-02-05

#### 工作坊完成情况与文档质量更新
**此版本完成了交互式工作坊模块，修复了所有断裂的文档链接，并提升了面向使用 Microsoft AZD 的 AI 开发者的整体内容质量。**

#### 新增
- **📝 CONTRIBUTING.md**: 新的贡献指南文档，包含：
  - 针对报告问题和提出更改的清晰说明
  - 新内容的文档标准
  - 代码示例指南与提交信息约定
  - 社区参与信息

#### 完成
- **🎯 Workshop 模块 7 (Wrap-up)**: 完成了总结模块，包含：
  - 工作坊成果的全面总结
  - 涵盖 AZD、模板和 AI Foundry 的关键概念掌握部分
  - 后续学习路径建议
  - 按难度分级的工作坊挑战练习
  - 社区反馈与支持链接

- **📚 Workshop 模块 3 (Deconstruct)**: 更新了学习目标，包含：
  - 启用 GitHub Copilot 与 MCP 服务器的指南
  - AZD 模板文件夹结构理解
  - 基础设施即代码（Bicep）组织模式
  - 实操实验室说明

- **🔧 Workshop 模块 6 (Teardown)**: 已完成，包含：
  - 资源清理与成本管理目标
  - 使用 `azd down` 进行安全的基础设施拆除
  - 恢复被软删除的认知服务的指南
  - 针对 GitHub Copilot 与 Azure 门户的额外探索提示

#### 修复
- **🔗 损坏链接修复**：解决了 15+ 个内部文档断链：
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 工作坊状态横幅**：已将其从“正在建设中”更新为活动的工作坊状态，并使用 2026 年 2 月的日期
- **🔗 工作坊导航**：修复了 workshop README.md 中指向不存在的 lab-1-azd-basics 文件夹的断裂导航链接

#### 更改
- **工作坊演示**：删除了“正在建设中”警告，工作坊现已完成并可使用
- **导航一致性**：确保所有工作坊模块具有正确的模块间导航
- **学习路径引用**：将章节交叉引用更新为正确的 microsoft-foundry 路径

#### 已验证
- ✅ 所有英文 Markdown 文件的内部链接均有效
- ✅ 工作坊模块 0-7 已完成并包含学习目标
- ✅ 章节与模块之间的导航功能正常
- ✅ 内容适合使用 Microsoft AZD 的 AI 开发者
- ✅ 保持面向初学者的语言与结构
- ✅ CONTRIBUTING.md 为社区贡献者提供了明确的指南

#### 技术实现
- **链接验证**：使用自动化 PowerShell 脚本验证了所有 .md 内部链接
- **内容审计**：对工作坊完整性与初学者适用性进行了人工审查
- **导航系统**：应用了一致的章节与模块导航模式

#### 备注
- **范围**：更改仅应用于英文文档
- **翻译**：本版本未更新翻译文件夹（稍后将同步自动翻译）
- **工作坊时长**：完整工作坊现在提供 3-4 小时的实操学习

---

### [v3.8.0] - 2025-11-19

#### 高级文档：监控、安全与多代理模式
**此版本新增了关于 Application Insights 集成、认证模式和多代理协调用于生产部署的全面 A 级课程。**

#### 新增
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - 面向 AZD 的部署与自动化预配
  - Application Insights + Log Analytics 的完整 Bicep 模板
  - 带自定义遥测的可运行 Python 应用（1,200+ 行）
  - AI/LLM 监控模式（Azure OpenAI 令牌/成本跟踪）
  - 6 个 Mermaid 图（架构、分布式追踪、遥测流）
  - 3 个实操练习（警报、仪表盘、AI 监控）
  - Kusto 查询示例与成本优化策略
  - 实时指标流与实时调试
  - 40-50 分钟的学习时长，包含生产就绪模式

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 种认证模式（连接字符串、Key Vault、托管标识）
  - 用于安全部署的完整 Bicep 基础设施模板
  - 集成 Azure SDK 的 Node.js 应用代码
  - 3 个完整练习（启用托管标识、用户分配标识、Key Vault 轮换）
  - 安全最佳实践与 RBAC 配置
  - 故障排除指南与成本分析
  - 面向生产的无密码认证模式

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 种协调模式（顺序、并行、分层、事件驱动、共识）
  - 完整的编排器服务实现（Python/Flask，1,500+ 行）
  - 3 个专用代理实现（Research、Writer、Editor）
  - 使用 Service Bus 进行消息队列集成
  - 使用 Cosmos DB 进行分布式系统状态管理
  - 6 个展示代理交互的 Mermaid 图
  - 3 个高级练习（超时处理、重试逻辑、断路器）
  - 成本拆分（$240-565/月）与优化策略
  - Application Insights 集成以用于监控

#### 增强
- **预部署章节**：现在包含全面的监控与协调模式
- **入门章节**：增强了专业级认证模式
- **生产就绪**：从安全到可观察性全面覆盖
- **课程大纲**：更新以引用第 3 章和第 6 章中的新课程

#### 更改
- **学习进度**：在课程中更好地整合了安全与监控内容
- **文档质量**：新课程中保持一致的 A 级标准（95-97%）
- **生产模式**：为企业部署提供完整端到端覆盖

#### 改进
- **开发者体验**：从开发到生产监控的清晰路径
- **安全标准**：专业的认证与密钥管理模式
- **可观察性**：与 AZD 完整集成的 Application Insights
- **AI 工作负载**：针对 Azure OpenAI 与多代理系统的专用监控

#### 已验证
- ✅ 所有课程包含完整可运行代码（非片段）
- ✅ Mermaid 图用于可视化学习（3 个课程共 19 张）
- ✅ 带验证步骤的实操练习（共 9 个）
- ✅ 可通过 `azd up` 部署的生产就绪 Bicep 模板
- ✅ 成本分析与优化策略
- ✅ 故障排除指南与最佳实践
- ✅ 带有验证命令的知识检查点

#### 文档评分结果
- **docs/pre-deployment/application-insights.md**: - 详尽的监控指南
- **docs/getting-started/authsecurity.md**: - 专业的安全模式
- **docs/pre-deployment/coordination-patterns.md**: - 高级多代理架构
- **Overall New Content**: - 一致的高质量标准

#### 技术实现
- **Application Insights**：Log Analytics + 自定义遥测 + 分布式追踪
- **认证**：托管标识 + Key Vault + RBAC 模式
- **多代理**：Service Bus + Cosmos DB + Container Apps + 编排
- **监控**：实时指标 + Kusto 查询 + 警报 + 仪表盘
- **成本管理**：采样策略、保留策略、预算控制

### [v3.7.0] - 2025-11-19

#### 文档质量改进与新的 Azure OpenAI 示例
**此版本在仓库中提升了文档质量，并新增了一个完整的 Azure OpenAI 部署示例，包含 GPT-4 聊天界面。**

#### 新增
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation in `examples/azure-openai-chat/`:
  - 完整的 Azure OpenAI 基础设施（GPT-4 模型部署）
  - 带会话历史记录的 Python 命令行聊天界面
  - Key Vault 集成以安全存储 API 密钥
  - 令牌使用跟踪与成本估算
  - 速率限制与错误处理
  - 包含 35-45 分钟部署指南的全面 README
  - 11 个生产就绪文件（Bicep 模板、Python 应用、配置）
- **📚 文档练习**：在配置指南中新增实操练习：
  - 练习 1：多环境配置（15 分钟）
  - 练习 2：密钥管理实操（10 分钟）
  - 清晰的成功标准与验证步骤
- **✅ 部署验证**：在部署指南中新增验证部分：
  - 健康检查流程
  - 成功标准清单
  - 所有部署命令的预期输出
  - 故障排除快速参考

#### 增强
- **examples/README.md**: 更新为 A 级质量（93%）：
  - 在所有相关部分中添加 azure-openai-chat
  - 将本地示例数量从 3 更新为 4
  - 添加到 AI 应用示例表
  - 集成到中级用户的快速入门
  - 添加到 Microsoft Foundry 模板部分
  - 更新对比矩阵与技术发现部分
- **文档质量**：docs 文件夹整体从 B+ (87%) → A- (92%)：
  - 在关键命令示例中添加预期输出
  - 为配置更改包含验证步骤
  - 通过实际练习增强动手学习

#### 更改
- **学习进度**：为中级学习者更好地整合了 AI 示例
- **文档结构**：提供更具可操作性的练习与明确结果
- **验证流程**：在关键工作流中加入明确的成功标准

#### 改进
- **开发者体验**：Azure OpenAI 部署现在耗时 35-45 分钟（相比复杂替代方案的 60-90 分钟）
- **成本透明度**：为 Azure OpenAI 示例提供明确的成本估算（$50-200/月）
- **学习路径**：为 AI 开发者提供清晰的入门示例 azure-openai-chat
- **文档标准**：统一的预期输出与验证步骤

#### 已验证
- ✅ Azure OpenAI 示例可通过 `azd up` 完整运行
- ✅ 所有 11 个实现文件语法正确
- ✅ README 指南与实际部署体验一致
- ✅ 在 8+ 个位置更新了文档链接
- ✅ 示例索引准确反映 4 个本地示例
- ✅ 表格中无重复外部链接
- ✅ 所有导航引用均正确

#### 技术实现
- **Azure OpenAI 架构**：GPT-4 + Key Vault + Container Apps 模式
- **安全性**：托管标识就绪，密钥存储在 Key Vault
- **监控**：集成 Application Insights
- **成本管理**：令牌跟踪与使用优化
- **部署**：单次 `azd up` 命令完成全部设置

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署示例
**此版本引入了面向生产的容器应用部署示例，使用 Azure Developer CLI (AZD)，并将完整文档与学习路径集成。**

#### 新增
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **最佳实践**：针对容器化工作负载的安全、监控、成本优化与 CI/CD 指南
- **代码示例**：完整的 `azure.yaml`、Bicep 模板与多语言服务实现（Python、Node.js、C#、Go）
- **测试与故障排除**：端到端测试场景、监控命令、故障排除指南

#### 更改
- **README.md**：更新以展示并链接新的容器应用示例，在“本地示例 - 容器应用”下进行呈现
- **examples/README.md**：更新以突出容器应用示例，添加对比矩阵条目，并更新技术/架构引用
- **课程大纲与学习指南**：已更新，参考相关章节中新的容器应用示例和部署模式

#### 已验证
- ✅ 所有新示例均可通过 `azd up` 部署并遵循最佳实践
- ✅ 文档交叉链接和导航已更新
- ✅ 示例涵盖从初学者到高级场景，包括生产级微服务

#### 备注
- **范围**：仅限英文文档和示例
- **后续步骤**：在未来版本中扩展更多高级容器模式和 CI/CD 自动化

### [v3.5.0] - 2025-11-19

#### 产品更名：Microsoft Foundry
**此版本在所有英文文档中实现了从 "Microsoft Foundry" 到 "Microsoft Foundry" 的全面产品名称变更，以反映 Microsoft 的官方更名。**

#### 更改
- **🔄 产品名称更新**：将 "Microsoft Foundry" 完整更名为 "Microsoft Foundry"
  - 更新了 `docs/` 文件夹中所有英文文档的引用
  - 重命名文件夹：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 重命名文件：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 总计：在 7 个文档文件中更新了 23 处内容引用

- **📁 文件夹结构更改**：
  - `docs/ai-foundry/` 重命名为 `docs/microsoft-foundry/`
  - 更新了所有跨引用以反映新的文件夹结构
  - 验证了所有文档中的导航链接

- **📄 文件重命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 更新了所有内部链接以引用新文件名

#### 已更新文件
- **章节文档**（7 个文件）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新了 3 个导航链接
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新了 4 处产品名称引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（来自之前的更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新了 3 处引用（概览、社区反馈、文档）
  - `docs/getting-started/azd-basics.md` - 更新了 4 个跨引用链接
  - `docs/getting-started/first-project.md` - 更新了 2 个章节导航链接
  - `docs/getting-started/installation.md` - 更新了 2 个下一章节链接
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新了 3 处引用（导航、Discord 社区）
  - `docs/troubleshooting/common-issues.md` - 更新了 1 个导航链接
  - `docs/troubleshooting/debugging.md` - 更新了 1 个导航链接

- **课程结构文件**（2 个文件）：
  - `README.md` - 更新了 17 处引用（课程概述、章节标题、模板部分、社区见解）
  - `course-outline.md` - 更新了 14 处引用（概述、学习目标、章节资源）

#### 已验证
- ✅ 英文文档中不存在剩余的 "ai-foundry" 文件夹路径引用
- ✅ 英文文档中不存在剩余的 "Microsoft Foundry" 产品名称引用
- ✅ 所有导航链接在新文件夹结构下均可正常使用
- ✅ 文件和文件夹重命名已成功完成
- ✅ 章节间的交叉引用已验证

#### 备注
- **范围**：更改仅应用于 `docs/` 文件夹中的英文文档
- **翻译**：`translations/` 文件夹未在此版本中更新
- **研讨会**：`workshop/` 材料未在此版本中更新
- **示例**：示例文件可能仍引用旧命名（将在未来更新中处理）
- **外部链接**：外部 URL 和 GitHub 仓库引用保持不变

#### 贡献者迁移指南
如果您的本地分支或文档引用旧结构：
1. 更新文件夹引用：`docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新文件引用：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替换产品名称： "Microsoft Foundry" → "Microsoft Foundry"
4. 验证所有内部文档链接仍然有效

---

### [v3.4.0] - 2025-10-24

#### 基础设施预览与验证增强
**此版本为新的 Azure Developer CLI 预览功能提供了全面支持，并增强了研讨会用户体验。**

#### 新增
- **🧪 azd provision --preview 功能文档**：全面覆盖新的基础设施预览能力
  - 命令参考和速查表中的使用示例
  - 在预配置指南中详细集成用例和优势
  - 引入预检检查以实现更安全的部署验证
  - 在入门指南中更新以体现以安全为先的部署实践
- **🚧 研讨会状态横幅**：专业 HTML 横幅，用于指示研讨会开发状态
  - 渐变设计并带建设指示，以便清晰传达给用户
  - 包含最后更新的时间戳以提升透明度
  - 支持移动响应式设计，适配所有设备类型

#### 增强
- **基础设施安全**：预览功能已集成至部署文档中各处
- **预部署验证**：自动化脚本现在包含基础设施预览测试
- **开发者工作流**：更新命令序列，将预览作为最佳实践
- **研讨会体验**：为用户设定清晰的内容开发状态预期

#### 更改
- **部署最佳实践**：推荐采用以预览为先的工作流
- **文档流程**：将基础设施验证提前到学习流程的早期
- **研讨会呈现**：使用专业状态沟通并提供明确的开发时间表

#### 改进
- **以安全为先的做法**：现在可以在部署前验证基础设施更改
- **团队协作**：预览结果可共享以供审查和批准
- **成本意识**：在预配置前更好地了解资源成本
- **风险缓解**：通过提前验证减少部署失败

#### 技术实现
- **多文档集成**：预览功能在 4 个关键文件中有文档记录
- **命令模式**：在文档中保持一致的语法和示例
- **最佳实践集成**：在验证工作流和脚本中包含预览
- **视觉指示**：为发现性提供清晰的 NEW 特性标记

#### 研讨会基础设施
- **状态沟通**：带渐变样式的专业 HTML 横幅
- **用户体验**：清晰的开发状态可防止混淆
- **专业呈现**：在设定预期的同时维护仓库可信度
- **时间线透明度**：2025 年 10 月的最后更新时间戳以示问责

### [v3.3.0] - 2025-09-24

#### 增强的研讨会材料与交互式学习体验
**此版本引入了全面的研讨会材料，提供基于浏览器的交互式引导和结构化学习路径。**

#### 新增
- **🎥 交互式研讨会指南**：基于浏览器的研讨会体验，支持 MkDocs 预览功能
- **📝 结构化研讨会说明**：从发现到定制的 7 步引导学习路径
  - 0-Introduction：研讨会概述与设置
  - 1-Select-AI-Template：模板发现与选择流程
  - 2-Validate-AI-Template：部署与验证流程
  - 3-Deconstruct-AI-Template：理解模板架构
  - 4-Configure-AI-Template：配置与定制
  - 5-Customize-AI-Template：高级修改与迭代
  - 6-Teardown-Infrastructure：清理与资源管理
  - 7-Wrap-up：总结与后续步骤
- **🛠️ 研讨会工具链**：使用 Material 主题的 MkDocs 配置以提升学习体验
- **🎯 实操学习路径**：3 步方法论（发现 → 部署 → 定制）
- **📱 GitHub Codespaces 集成**：无缝的开发环境设置

#### 增强
- **AI 研讨会实验室**：扩展为 2-3 小时的结构化学习体验
- **研讨会文档**：专业呈现并带有导航和视觉辅助
- **学习进程**：从模板选择到生产部署提供清晰的分步指导
- **开发者体验**：集成工具链以优化开发工作流

#### 改进
- **可访问性**：基于浏览器的界面提供搜索、复制功能和主题切换
- **自定进度学习**：灵活的研讨会结构，适应不同学习速度
- **实践应用**：真实世界的 AI 模板部署场景
- **社区整合**：集成 Discord 提供研讨会支持与协作

#### 研讨会功能
- **内置搜索**：快速的关键词和课程发现
- **复制代码块**：悬停即复制所有代码示例
- **主题切换**：支持暗色/亮色模式以满足不同偏好
- **视觉资源**：截图和图表以增强理解
- **帮助集成**：直接访问 Discord 社区以获取支持

### [v3.2.0] - 2025-09-17

#### 重大导航重构与基于章节的学习系统
**此版本引入了全面的基于章节的学习结构，并增强了整个仓库的导航。**

#### 新增
- **📚 基于章节的学习系统**：将整个课程重构为 8 个逐步的学习章节
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 全面的导航系统**：在所有文档中实现一致的导航头部和页脚
- **🎯 进度跟踪**：课程完成清单和学习验证系统
- **🗺️ 学习路径指导**：为不同经验水平和目标提供明确的入门点
- **🔗 交叉引用导航**：清晰链接相关章节和先决条件

#### 增强
- **README 结构**：转变为带章节组织的结构化学习平台
- **文档导航**：每页现在包含章节上下文和进度指导
- **模板组织**：示例和模板映射到相应的学习章节
- **资源整合**：速查表、FAQ 和学习指南连接到相关章节
- **研讨会整合**：实践实验与多章节学习目标关联

#### 更改
- **学习进程**：从线性文档迁移到灵活的基于章节的学习
- **配置位置**：将配置指南重新定位为第 3 章以优化学习流程
- **AI 内容整合**：在整个学习旅程中更好地整合 AI 专用内容
- **生产内容**：将高级模式整合在第 8 章，面向企业学习者

#### 改进
- **用户体验**：清晰的导航面包屑和章节进度指示
- **可访问性**：一致的导航模式便于课程浏览
- **专业呈现**：适用于学术和企业培训的大学式课程结构
- **学习效率**：通过改进组织减少查找相关内容的时间

#### 技术实现
- **导航头部**：在 40+ 文档文件中标准化章节导航
- **页脚导航**：提供一致的进度指导和章节完成指示
- **交叉链接**：全面的内部链接系统连接相关概念
- **章节映射**：模板和示例与学习目标清晰关联

#### 学习指南增强
- **📚 全面学习目标**：将学习指南重构以对齐 8 章系统
- **🎯 基于章节的评估**：每章包含特定学习目标和实践练习
- **📋 进度跟踪**：每周学习计划，带有可衡量结果和完成清单
- **❓ 评估问题**：每章的知识验证问题，带有专业成果
- **🛠️ 实践练习**：带有真实部署场景和故障排除的动手活动
- **📊 技能进阶**：从基础概念到企业模式的明确提升，关注职业发展
- **🎓 认证框架**：职业发展成果与社区认可系统
- **⏱️ 时间管理**：结构化的 10 周学习计划与里程碑验证

### [v3.1.0] - 2025-09-17

#### 增强的多代理 AI 解决方案
**此版本改进了多代理零售解决方案，采用更好的代理命名并增强了文档。**

#### 更改
- **多代理术语**：在整个零售多代理解决方案中，将 "Cora agent" 替换为 "Customer agent" 以便更清晰理解
- **代理架构**：更新了所有文档、ARM 模板和代码示例，以使用一致的 "Customer agent" 命名
- **配置示例**：使用更新的命名约定现代化代理配置模式
- **文档一致性**：确保所有引用使用专业且描述性的代理名称

#### 增强
- **ARM 模板包**：更新了 retail-multiagent-arm-template，采用 Customer agent 引用
- **架构图**：使用更新的代理命名刷新了 Mermaid 图表
- **代码示例**：Python 类和实现示例现在使用 CustomerAgent 命名
- **环境变量**：更新了所有部署脚本以使用 CUSTOMER_AGENT_NAME 约定

#### 改进
- **Developer Experience**: 文档中对代理角色和职责的说明更清晰
- **Production Readiness**: 更好地与企业命名约定保持一致
- **Learning Materials**: 更直观的代理命名以便教学用途
- **Template Usability**: 简化对代理功能和部署模式的理解

#### Technical Details
- 使用 CustomerAgent 引用更新了 Mermaid 架构图
- 在 Python 示例中将 CoraAgent 类名替换为 CustomerAgent
- 将 ARM 模板 JSON 配置修改为使用 "customer" 代理类型
- 将环境变量从 CORA_AGENT_* 更新为 CUSTOMER_AGENT_* 模式
- 刷新了所有部署命令和容器配置

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**此版本将存储库转换为包含 Microsoft Foundry 集成的综合 AI 为先学习资源。**

#### Added
- **🤖 AI-First Learning Path**: 完整重构，优先面向 AI 开发者和工程师
- **Microsoft Foundry Integration Guide**: 关于将 AZD 与 Microsoft Foundry 服务连接的完整文档
- **AI Model Deployment Patterns**: 涵盖模型选择、配置和生产部署策略的详尽指南
- **AI Workshop Lab**: 2-3 小时的实操研讨会，用于将 AI 应用转换为可由 AZD 部署的解决方案
- **Production AI Best Practices**: 用于扩展、监控和保护 AI 工作负载的企业就绪模式
- **AI-Specific Troubleshooting Guide**: 针对 Azure OpenAI、Cognitive Services 和 AI 部署问题的综合故障排除
- **AI Template Gallery**: 精选的 Microsoft Foundry 模板集合，并列有复杂度评级
- **Workshop Materials**: 完整的研讨会结构、实操实验和参考材料

#### Enhanced
- **README Structure**: 面向 AI 开发者的结构，并结合来自 Microsoft Foundry Discord 的 45% 社区兴趣数据
- **Learning Paths**: 为 AI 开发者提供专门路径，同时保留面向学生和 DevOps 工程师的传统路径
- **Template Recommendations**: 推荐的 AI 模板，包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart
- **Community Integration**: 强化的 Discord 社区支持，增加了 AI 特定频道和讨论

#### Security & Production Focus
- **Managed Identity Patterns**: 针对 AI 的身份验证和安全配置模式
- **Cost Optimization**: 针对 AI 工作负载的令牌使用跟踪和预算控制
- **Multi-Region Deployment**: 全球 AI 应用部署策略
- **Performance Monitoring**: 面向 AI 的指标和 Application Insights 集成

#### Documentation Quality
- **Linear Course Structure**: 从入门到高级 AI 部署模式的逻辑进阶
- **Validated URLs**: 所有外部仓库链接均已验证并可访问
- **Complete Reference**: 所有内部文档链接均已验证并可用
- **Production Ready**: 含真实示例的企业部署模式

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**此版本代表对存储库结构和内容呈现的重大改造。**

#### Added
- **Structured Learning Framework**: 所有文档页面现在包含 Introduction、Learning Goals 和 Learning Outcomes 部分
- **Navigation System**: 在所有文档中添加了上一课/下一课链接以支持引导式学习进程
- **Study Guide**: 包含学习目标、练习题和评估材料的 comprehensive study-guide.md
- **Professional Presentation**: 移除了所有表情符号图标以提高可访问性和专业外观
- **Enhanced Content Structure**: 改进了学习材料的组织和流向

#### Changed
- **Documentation Format**: 将所有文档标准化为一致的以学习为中心的结构
- **Navigation Flow**: 在所有学习材料中实现逻辑进阶
- **Content Presentation**: 去除装饰性元素以换取清晰、专业的格式
- **Link Structure**: 更新了所有内部链接以支持新的导航系统

#### Improved
- **Accessibility**: 移除对表情符号的依赖以提高屏幕阅读器兼容性
- **Professional Appearance**: 适合企业学习的简洁学术风格呈现
- **Learning Experience**: 为每课提供清晰目标和产出结果的结构化方法
- **Content Organization**: 相关主题之间更好的逻辑流和连接

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - 完整的入门指南系列
  - 全面的部署和配置文档
  - 详细的故障排除资源和调试指南
  - 预部署验证工具和流程

- **Getting Started Module**
  - AZD 基础：核心概念和术语
  - 安装指南：按平台的设置说明
  - 配置指南：环境设置和身份验证
  - 第一个项目教程：逐步实操学习

- **Deployment and Provisioning Module**
  - 部署指南：完整工作流文档
  - 预配置指南：使用 Bicep 的基础设施即代码
  - 生产部署最佳实践
  - 多服务架构模式

- **Pre-deployment Validation Module**
  - 容量规划：Azure 资源可用性验证
  - SKU 选择：全面的服务层级指导
  - 预检检查：自动化验证脚本（PowerShell 和 Bash）
  - 成本估算和预算规划工具

- **Troubleshooting Module**
  - 常见问题：经常遇到的问题及解决方案
  - 调试指南：系统化故障排除方法
  - 高级诊断技术和工具
  - 性能监控和优化

- **Resources and References**
  - 命令速查表：常用命令快速参考
  - 术语表：全面的术语和缩略语定义
  - 常见问题解答：对常见问题的详细回答
  - 外部资源链接和社区连接

- **Examples and Templates**
  - 简单的 Web 应用示例
  - 静态网站部署模板
  - 容器应用配置
  - 数据库集成模式
  - 微服务架构示例
  - 无服务器函数实现

#### Features
- **Multi-Platform Support**: Windows、macOS 和 Linux 的安装与配置指南
- **Multiple Skill Levels**: 内容针对学生到专业开发者的多个技能层级
- **Practical Focus**: 实操示例和真实场景
- **Comprehensive Coverage**: 覆盖从基础概念到高级企业模式
- **Security-First Approach**: 在整个文档中集成安全最佳实践
- **Cost Optimization**: 关于经济高效部署与资源管理的指导

#### Documentation Quality
- **Detailed Code Examples**: 实用且经过测试的代码示例
- **Step-by-Step Instructions**: 清晰、可执行的指导
- **Comprehensive Error Handling**: 常见问题的故障排除
- **Best Practices Integration**: 行业标准和建议
- **Version Compatibility**: 与最新 Azure 服务和 azd 功能保持同步

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: 集成 Hugging Face、Azure Machine Learning 及自定义模型的模式
- **AI Agent Frameworks**: 用于 LangChain、Semantic Kernel 和 AutoGen 部署的模板
- **Advanced RAG Patterns**: 除 Azure AI Search 外的向量数据库选项（Pinecone、Weaviate 等）
- **AI Observability**: 增强的模型性能、令牌使用和响应质量监控

#### Developer Experience
- **VS Code Extension**: 集成 AZD + AI Foundry 的开发体验
- **GitHub Copilot Integration**: AI 辅助的 AZD 模板生成
- **Interactive Tutorials**: 针对 AI 场景的带自动校验的动手编码练习
- **Video Content**: 面向视觉学习者的 AI 部署补充视频教程

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI 模型治理、合规性和审计追踪
- **Multi-Tenant AI**: 为多个客户提供隔离 AI 服务的模式
- **Edge AI Deployment**: 与 Azure IoT Edge 和容器实例的集成
- **Hybrid Cloud AI**: 面向 AI 工作负载的多云和混合部署模式

#### Advanced Features
- **AI Pipeline Automation**: 与 Azure Machine Learning 管道的 MLOps 集成
- **Advanced Security**: 零信任模式、私有端点和高级威胁防护
- **Performance Optimization**: 针对高吞吐量 AI 应用的高级调优和扩展策略
- **Global Distribution**: AI 应用的内容分发和边缘缓存模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: 综合 Microsoft Foundry 集成（已完成）
- ✅ **Interactive Tutorials**: 实操 AI 研讨会实验室（已完成）
- ✅ **Advanced Security Module**: 针对 AI 的安全模式（已完成）
- ✅ **Performance Optimization**: AI 工作负载调优策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: 面向 AI 的部署场景示例（已完成）
- ✅ **Extended FAQ**: AI 特定问题和故障排除（已完成）
- **Tool Integration**: 增强的 IDE 和编辑器集成指南
- ✅ **Monitoring Expansion**: 面向 AI 的监控和告警模式（已完成）

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: 面向移动学习的响应式设计
- **Offline Access**: 可下载的文档包
- **Enhanced IDE Integration**: 针对 AZD + AI 工作流的 VS Code 扩展
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
- 新功能、文档章节或能力
- 新示例、模板或学习资源
- 额外的工具、脚本或实用程序

#### Changed
- 对现有功能或文档的修改
- 为提高清晰度或准确性所做的更新
- 内容或组织结构的重组

#### Deprecated
- 正在被淘汰的功能或方法
- 计划移除的文档部分
- 有更好替代方案的方法

#### Removed
- 不再相关的功能、文档或示例
- 过时的信息或已弃用的方法
- 冗余或合并的内容

#### Fixed
- 文档或代码中的错误修正
- 报告问题或故障的解决
- 对准确性或功能性的改进

#### Security
- 与安全相关的改进或修复
- 安全最佳实践的更新
- 安全漏洞的修复

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- 需要用户采取行动的破坏性更改
- 内容或组织的重大重构
- 改变基本方法或方法论的更改

#### Minor Version (X.Y.0)
- 新功能或内容添加
- 保持向后兼容的增强
- 额外的示例、工具或资源

#### Patch Version (X.Y.Z)
- 错误修复和更正
- 对现有内容的微小改进
- 说明性更正和小幅增强

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
- **Missing AI Content**: 请求更多 AI 模板、模式或示例
- **Accessibility**: 针对多样化学习需求的改进
- **AI Tool Integration**: 对更好 AI 开发工作流集成的建议
- **Production AI Patterns**: 企业级 AI 部署模式请求

### Response Commitment
- **Issue Response**: 对报告的问题在 48 小时内响应
- **Feature Requests**: 在一周内进行评估
- **Community Contributions**: 在一周内审查
- **Security Issues**: 优先处理并加快响应

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: 内容准确性和链接验证
- **Quarterly Updates**: 主要内容添加和改进
- **Semi-Annual Reviews**: 全面重构和增强
- **Annual Releases**: 具有重大改进的主要版本更新

### Monitoring and Quality Assurance
- **Automated Testing**: 定期验证代码示例和链接
- **Community Feedback Integration**: 定期吸纳用户建议
- **Technology Updates**: 与最新 Azure 服务和 azd 发行保持一致
- **Accessibility Audits**: 定期审查以确保包容性设计原则

## Version Support Policy

### Current Version Support
- **Latest Major Version**: 提供全面支持并定期更新
- **Previous Major Version**: 提供 12 个月的安全更新和关键修复
- **Legacy Versions**: 仅社区支持，不提供官方更新

### Migration Guidance
When major versions are released, we provide:
- **迁移指南**: 逐步迁移说明
- **兼容性说明**: 有关破坏性更改的详细信息
- **工具支持**: 帮助迁移的脚本或实用程序
- **社区支持**: 针对迁移问题的专门论坛

---

**导航**
- **上一课**: [学习指南](resources/study-guide.md)
- **下一课**: 返回 [主 README](README.md)

**保持更新**: 关注此存储库以接收有关新版本和学习资料的重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文档已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
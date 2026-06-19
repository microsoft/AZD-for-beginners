# Changelog - AZD For Beginners

## Introduction

本更新日志记录了 AZD For Beginners 仓库的所有重要更改、更新和改进。我们遵循语义化版本控制原则，并维护此日志以帮助用户了解各版本之间的差异。

## Learning Goals

通过查看此更新日志，您将能：
- 了解新功能和新增内容
- 理解对现有文档所做的改进
- 跟踪错误修复和更正以确保准确性
- 了解学习材料随时间的演进

## Learning Outcomes

查看更新条目后，您将能够：
- 识别可用于学习的新内容和资源
- 了解哪些章节已被更新或改进
- 根据最新材料规划您的学习路径
- 提供反馈和建议以促进未来改进

## Version History

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**此版本通过 azd-coverage 分析关闭了剩余的中级差距：如何编写并发布自己的模板、可复现的 dev-container/Codespaces 环境、Pulumi 基础设施提供程序、Azure DevOps CI/CD 教程、service-principal 身份验证、主机选择指南（AKS/Spring Apps）、`azd restore`/`azd package` 说明、hook 错误处理，以及团队/共享环境实践。**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — 编写您自己的 azd 模板：所需结构（`azure.yaml`, `infra/`, `src/`），`metadata.template` 字段，使用 `uniqueString()` 资源令牌和 `azd-env-name` 标签参数化基础设施，本地使用 `azd init --template <local-path>` 进行测试，发布到 GitHub，并提交到 Awesome AZD 画廊
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — 使用 Dev Containers 和 GitHub Codespaces 实现可复现的 azd 环境：一个最小的 `.devcontainer/devcontainer.json`，使用官方 `ghcr.io/azure/azure-dev/azd` 功能、语言特定功能、针对容器主机的 `docker-in-docker`，以及用于远程登录的 `azd auth login --use-device-code`
- **🧩 Pulumi with azd** section in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`、Pulumi 文件夹布局、将 stacks 映射到 azd 环境、所需的输出/标记，以及相同的 `azd up` / `azd down` 工作流
- **🎯 Host-selection guidance** in `docs/chapter-04-infrastructure/provisioning.md` — 针对初学者的 `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` 和 `springapp` 比较，以及何时选择 AKS 或 Azure Spring Apps 的指导
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`，使用工作负载身份联合（OIDC）的 service connection，生成的 `azure-dev.yml`，以及变量组设置
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`，非交互式 `azd auth login`（客户端密钥 vs. 联合/OIDC 凭据）、何时使用以及安全凭据存储
- **🪝 Hook error-handling** subsection in `docs/chapter-04-infrastructure/deployment-guide.md` — 退出代码和 `set -e`、`continueOnError`、使用 `azd hooks run` 在隔离环境中测试钩子、针对不同操作系统的 shell，以及 `--debug`
- **👥 Team / shared environments** section in `docs/chapter-03-configuration/configuration.md` — `.azure/` 中应该包含的内容、哪些应加入 gitignore、按开发者划分的环境、`azd env list`/`select`，以及在 CI/CD 中提供环境值
- **🧰 `azd restore` and expanded `azd package`** explanations in `resources/cheat-sheet.md` — 恢复依赖项并构建可部署工件而不进行部署

#### Changed
- **🧭 Chapter 4 lessons table** updated to include the new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include the new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**此版本通过添加两个新的实操课程（可部署的多代理演练和向现有应用添加 azd）、初学者友好的 hooks 介绍、Terraform 与 azd 的章节、逐步 GitHub Actions 管道教程、对新预览扩展的解释，以及明确的部署验证检查表，来填补面向完全初学者指南的最大空白。**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 一个完整的实操、可部署的双代理演练（orchestrator + specialists），使用真实模板（`contoso-creative-writer`），涵盖何时使用多代理、`azd up` 工作流、理解已部署的资源、跨代理追踪、自定义和清理
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何通过 `azd init` 向现有项目添加 azd（“use code in the current directory”），理解 `azure.yaml` 和 `infra/`、`azd infra generate`、主机检测，以及使用 `azd up` 进行部署
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 配置、`.tf` 文件夹布局、所需的 `AZURE_*` 输出和 `azd-env-name` 标记，以及相同的 `azd up` / `azd down` 工作流（修补了此前宣称支持 Terraform 但只展示 Bicep 的空白）
- **⚙️ Step-by-step GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — 从 GitHub 仓库到自动部署：`azd pipeline config`、OIDC 联合凭据（无存储的秘密）、生成的 `azure-dev.yml`，以及 secrets 与 variables 的指导
- **🪝 Beginner "New to hooks?" introduction** in `docs/chapter-04-infrastructure/deployment-guide.md` — 什么是 hook、hook 阶段表、一个最小的第一个 hook，以及使用 `azd hooks run` 手动运行钩子
- **✅ "Verify Your Deployment" checklist** added to Step 5 of `docs/chapter-01-foundation/first-project.md` — 冒烟测试、健康端点检查，以及明确的成功标准
- **🧩 Explainer for new preview extensions** `azure.ai.skills` and `azure.ai.connections` (what they are and when to reach for them) in `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** corrected: `multi-agent-basics.md` is now Lesson 1 (the only fully hands-on lesson), with honest labeling that Lesson 2 lives in Chapter 6 and the Retail scenario is an architecture blueprint, not a one-command template
- **🧭 Chapter 1 lessons table** now includes the new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** updated: `first-project.md` now links forward to `bring-your-own-app.md`

#### Fixed
- **🧱 Closed the "claimed but missing" Terraform gap** — the course previously referenced Terraform support without showing it
- **🔀 Corrected misleading Chapter 5 cross-links** that implied a full multi-agent implementation existed when only an architecture blueprint did

#### Files Updated
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**此版本针对 `azd` `1.25.6`（2026 年 6 月）和 `azure.ai.agents` `0.1.40-preview` 扩展重新验证课程，将 AI 指导从“搭建代理”扩展到完整的代理生命周期（测试 → 评估 → 优化 → 检查 → 删除），公开了新的 `azure.ai.skills` 和 `azure.ai.connections` 预览扩展，并注明 “.NET Aspire” 更名为 “Aspire”。**

#### Added
- **🔁 Full agent lifecycle coverage** for beginners and AI engineers across the docs:
  - `docs/chapter-01-foundation/azd-basics.md` — 在 Extensions and AI Commands 部分新增生命周期表（scaffold → test → measure → improve → inspect → clean up）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增“管理代理生命周期”部分，涵盖 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
  - `resources/cheat-sheet.md` — 扩展的 AI 代理命令，包含 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
- **🧩 New preview extensions** documented: `azure.ai.skills`（可重用代理技能）和 `azure.ai.connections`（Foundry 连接）已添加到扩展表和备忘单
- **⏱️ Response-timing guidance** — `azd ai agent invoke` 示例现在注明会打印总延迟和首字节时间
- **📌 Version banner** in the root README pointing learners at `azd version` and `azd upgrade`

#### Changed
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) to `azd 1.25.6` (June 2026) across all chapter READMEs and the workshop docs
- **🤖 Chapter 2 extension note** updated from `azure.ai.agents` `0.1.18-preview` to `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) updated to `1.25.6`
- **🧭 README "What's New in azd Today"** refreshed to highlight the end-to-end agent lifecycle, new AI extensions, and recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now points learners to the post-deploy lifecycle commands rather than stopping at `azd up`

#### Fixed
- **🏷️ Product naming** — added an Aspire rebrand note (".NET Aspire" is now simply "Aspire"); azd's Aspire support is unchanged
- **🔎 Live release validation** confirmed against the Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) and `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Files Updated
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### 初学者入门澄清、设置验证与最终 AZD 命令清理
**此版本在对 AZD 1.23 进行验证扫描后，针对初学者进行了文档修订：澄清以 AZD 为先的身份验证指南、添加本地设置验证脚本、核对关键命令与实时 AZD CLI，并移除更改日志外最后的过时英文命令引用。**

#### 新增
- **🧪 初学者设置验证脚本**，包含 `validate-setup.ps1` 和 `validate-setup.sh`，以便学习者在开始第 1 章前确认所需工具
- **✅ 根 README 和第 1 章 README 中的前置设置验证步骤**，以便在运行 `azd up` 之前捕获缺失的前提条件

#### 更改
- **🔐 初学者身份验证指导** 现在统一将 `azd auth login` 作为 AZD 工作流的主要路径，`az login` 被标注为可选，除非直接使用 Azure CLI 命令
- **📚 第 1 章入门流程** 现在引导学习者在安装、身份验证和首次部署步骤之前验证本地设置
- **🛠️ 验证器消息** 现在清晰区分阻塞性要求与针对仅使用 AZD 的初学者路径的可选 Azure CLI 警告
- **📖 配置、故障排除和示例文档** 现在区分必需的 AZD 身份验证与可选的 Azure CLI 登录（此前两者未提供上下文）

#### 修复
- **📋 剩余的英文源命令引用** 已更新为当前 AZD 形式，包括备忘单中的 `azd config show` 以及在旨在提供 Azure 门户概览指导处的 `azd monitor --overview`
- **🧭 第 1 章的初学者表述** 已放宽，以避免对所有模板和 Azure 资源做出保证性零错误或回滚行为的过度承诺
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

#### AZD 1.23.12 验证、工作坊环境扩展与 AI 模型刷新
**此版本对 `azd` `1.23.12` 进行了文档验证扫描，更新了过时的 AZD 命令示例，将 AI 模型指导刷新为当前默认值，并将工作坊说明从仅支持 GitHub Codespaces 扩展到也支持 dev 容器和本地克隆。**

#### 新增
- **✅ 在核心章节和工作坊文档中添加验证说明**，以便为使用较新或较旧 CLI 版本的学习者明确测试的 AZD 基线
- **⏱️ 针对长时间运行的 AI 应用部署的超时指导**，使用 `azd deploy --timeout 1800`
- **🔎 扩展检查步骤**，在 AI 工作流文档中使用 `azd extension show azure.ai.agents`
- **🌐 更广泛的工作坊环境指导**，涵盖 GitHub Codespaces、dev 容器和带 MkDocs 的本地克隆

#### 更改
- **📚 章节介绍 README** 现在在基础、配置、基础设施、多代理、预部署、故障排除和生产部分一致注明已针对 `azd 1.23.12` 进行验证
- **🛠️ AZD 命令引用** 在文档中更新为当前形式：
  - `azd config list` → `azd config show`
  - `azd env show` → 根据语境改为 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → 在打算展示 Application Insights 概览时使用 `azd monitor --overview`
- **🧪 预览预配示例** 简化为当前支持的用法，例如 `azd provision --preview` 和 `azd provision --preview -e production`
- **🧭 工作坊流程** 更新为学习者可以在 Codespaces、dev 容器或本地克隆中完成实验，而不再假定仅能在 Codespaces 中执行
- **🔐 身份验证指导** 现在更偏向于在 AZD 工作流中优先使用 `azd auth login`，当直接使用 Azure CLI 命令时再将 `az login` 作为可选项

#### 修复
- **🪟 Windows 安装命令** 在安装指南中规范为当前 `winget` 包的大小写
- **🐧 Linux 安装指导** 修正为避免不受支持的发行版特定的 `azd` 包管理器说明，而在适当情况下指向发行版资产
- **📦 AI 模型示例** 已从旧默认（如 `gpt-35-turbo` 和 `text-embedding-ada-002`）刷新为当前示例，例如 `gpt-4.1-mini`、`gpt-4.1` 和 `text-embedding-3-large`
- **📋 部署与诊断片段** 修正为在日志、脚本和故障排除步骤中使用当前的环境与状态命令
- **⚙️ GitHub Actions 指南** 从 `Azure/setup-azd@v1.0.0` 更新为 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指导** 从 `azd mcp consent` 更新为 `azd copilot consent list`

#### 改进
- **🧠 AI 章节指导** 更好地解释了预览敏感的 `azd ai` 行为、租户特定登录、当前扩展使用以及更新后的模型部署建议
- **🧪 工作坊说明** 现在使用更现实的版本示例和更清晰的环境设置语言以利于动手实验
- **📈 生产与故障排除文档** 现在更好地与当前的监控、备用模型和成本层示例对齐

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
**此版本在所有与 AI 相关的章节中新增了 `azd ai`、`azd extension` 和 `azd mcp` 命令覆盖，修复了 agents.md 中的损坏链接和已弃用代码，更新了备忘单，并彻底改造了示例模板部分，增加了经过验证的描述和新的 Azure AI AZD 模板。**

#### 新增
- **🤖 AZD AI CLI 覆盖**，跨 7 个文件（此前仅在第 8 章）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增 “Extensions and AI Commands” 小节，介绍 `azd extension`, `azd ai agent init` 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 方案 4：`azd ai agent init`，并带有模板与清单方法对比表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — “AZD Extensions for Foundry” 和 “Agent-First Deployment” 子章节
  - `docs/chapter-05-multi-agent/README.md` — 快速入门现在展示模板和基于清单的部署路径
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分现在包含 `azd ai agent init` 选项
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — “用于诊断的 AZD AI 扩展命令” 子章节
  - `resources/cheat-sheet.md` — 新增 “AI & Extensions Commands” 部分，包含 `azd extension`, `azd ai agent init`, `azd mcp`, 和 `azd infra generate`
- **📦 新的 AZD AI 示例模板**，列于 `microsoft-foundry-integration.md`：
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 和语音聊天支持的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，具有 ACA/AKS 部署选项
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 和 Prompty 的多代理创意写作应用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB 的无服务器 RAG，并支持 Ollama 本地开发
  - **chat-with-your-data-solution-accelerator** — 企业级 RAG 加速器，带管理员门户、Teams 集成和 PostgreSQL/Cosmos DB 选项
  - **azure-ai-travel-agents** — 多代理 MCP 编排参考应用，服务器端采用 .NET、Python、Java 和 TypeScript
  - **azd-ai-starter** — 最小化的 Azure AI 基础设施 Bicep 启动模板
  - **🔗 精彩 AZD AI 画廊 链接** — 参考 [精彩 AZD AI 画廊](https://azure.github.io/awesome-azd/?tags=ai)（80+ 模板）

#### 修复
- **🔗 agents.md 导航**：前/后页链接现在与第 2 章 README 的课程顺序一致（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 损坏链接**：将 `production-ai-practices.md` 更正为 `../chapter-08-production/production-ai-practices.md`（3 处）
- **📦 agents.md 已弃用代码**：将 `opencensus` 替换为 `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md 无效 API**：将 `max_tokens` 从 `create_agent()` 移到 `create_run()`，作为 `max_completion_tokens`
- **🔢 agents.md 令牌计数**：用 `tiktoken.encoding_for_model()` 替换粗略的 `len//4` 估算
- **azure-search-openai-demo**：将服务描述从 “Cognitive Search + App Service” 更正为 “Azure AI Search + Azure Container Apps”（默认主机自 2024 年 10 月更改）
- **contoso-chat**：更新描述以引用 Azure AI Foundry + Prompty，匹配仓库的实际标题和技术栈

#### 移除
- **ai-document-processing**：移除不可用的模板引用（仓库未公开作为 AZD 模板）

#### 改进
- **📝 agents.md 练习**：练习 1 现在展示预期输出和 `azd monitor` 步骤；练习 2 包含完整的 `FunctionTool` 注册代码；练习 3 用具体的 `prepdocs.py` 命令取代了模糊指导
- **📚 agents.md 资源**：将文档链接更新为当前的 Azure AI Agent Service 文档和快速入门
- **📋 agents.md 后续步骤表**：添加 AI 工作坊实验链接以完成整章覆盖

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
#### Course Navigation Enhancement
**此版本通过增强的表格格式改进了 README.md 的章节导航。**

#### Changed
- **Course Map Table**: 通过直接的课程链接、时长估算和复杂度评级进行增强
- **Folder Cleanup**: 移除了冗余的旧文件夹 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: 课程地图表中的所有 21+ 个内部链接已验证

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**此版本将产品引用更新为当前的 Microsoft 品牌。**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: 已在非翻译文件中更新所有引用
- **Azure AI Agent Service → Foundry Agents**: 服务名称已更新以反映当前品牌

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**此版本将文档重构为专用的章节文件夹，以便更清晰的导航。**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| 文件 | 从 | 到 |
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

#### Added
- **📚 章节 README 文件**：在每个章节文件夹中创建 README.md，包含：
  - 学习目标和时长
  - 带描述的课程表
  - 快速启动命令
  - 导航到其他章节

#### Changed
- **🔗 已更新所有内部链接**: 78+ 个路径在所有文档文件中被更新
- **🗺️ Main README.md**: 更新了包含新章节结构的课程地图
- **📝 examples/README.md**: 更新了对章节文件夹的交叉引用

#### Removed
- 旧文件夹结构 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**此版本添加了章节导航的 README 文件（已被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**此版本添加了使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: 完整指南，涵盖：
  - 什么是 AI 代理以及它们与聊天机器人有何不同
  - 三种快速入门代理模板（Foundry Agents、Prompty、RAG）
  - 代理架构模式（单代理、RAG、多代理）
  - 工具配置和自定义
  - 监控和指标跟踪
  - 成本考虑与优化
  - 常见故障排除场景
  - 三项动手练习及成功评判标准

#### Content Structure
- **Introduction**: 面向初学者的代理概念
- **Quick Start**: 使用 `azd init --template get-started-with-ai-agents` 部署代理
- **Architecture Patterns**: 代理模式的可视化图示
- **Configuration**: 工具设置和环境变量
- **Monitoring**: 与 Application Insights 集成
- **Exercises**: 渐进式动手学习（每项 20-45 分钟）

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**此版本更新了开发容器配置，提供更现代的工具和更适合 AZD 学习体验的默认设置。**

#### Changed
- **🐳 Base Image**: 从 `python:3.12-bullseye` 更新为 `python:3.12-bookworm`（最新的 Debian 稳定版）
- **📛 Container Name**: 将名称从 "Python 3" 重命名为 "AZD for Beginners" 以便更清晰

#### Added
- **🔧 新的开发容器功能**：
  - `azure-cli`（启用 Bicep 支持）
  - `node:20`（AZD 模板的 LTS 版本）
  - `github-cli`（用于模板管理）
  - `docker-in-docker`（用于容器应用部署）

- **🔌 端口转发**：为常见开发预配置的端口：
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
  - `DavidAnson.vscode-markdownlint` - Markdown 检查
  - `bierner.markdown-mermaid` - Mermaid 图表支持
  - `redhat.vscode-yaml` - YAML 支持（用于 azure.yaml）
  - `eamodio.gitlens` - Git 可视化
  - `mhutchie.git-graph` - Git 历史

- **⚙️ VS Code Settings**: 添加了默认的 Python 解释器设置、保存时格式化和空白修剪

- **📦 更新 requirements-dev.txt**：
  - 添加了 MkDocs 压缩插件
  - 添加了 pre-commit 用于代码质量
  - 添加了 Azure SDK 包（azure-identity、azure-mgmt-resource）

#### Fixed
- **Post-Create Command**: 现在在容器启动时验证 AZD 和 Azure CLI 的安装

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**此版本显著改进了 README.md，使其对初学者更友好，并为 AI 开发者添加了重要资源。**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: 清晰解释何时使用各工具并提供实际示例
- **🌟 Awesome AZD Links**: 直接链接到社区模板库和贡献资源：
  - [Awesome AZD 画廊](https://azure.github.io/awesome-azd/) - 200+ 可直接部署的模板
  - [提交模板](https://github.com/Azure/awesome-azd/issues) - 社区贡献
- **🎯 Quick Start Guide**: 简化的 3 步入门部分（安装 → 登录 → 部署）
- **📊 Experience-Based Navigation Table**: 基于经验的清晰导航表，指导从何处开始

#### Changed
- **README Structure**: 重新组织以实现渐进披露——关键信息优先
- **Introduction Section**: 重写以向完全的初学者解释 “The Magic of `azd up`”
- **Removed Duplicate Content**: 删除重复的故障排除部分
- **Troubleshooting Commands**: 将 `azd logs` 引用修正为有效的 `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: 在 cheat-sheet.md 中添加了 `azd auth login` 和 `azd auth logout`
- **Invalid Command References**: 从 README 的故障排除部分移除了剩余的 `azd logs`

#### Notes
- **Scope**: 更改应用于主 README.md 和 resources/cheat-sheet.md
- **Target Audience**: 改进专门面向刚接触 AZD 的开发者

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**此版本修正了文档中不存在的 AZD 命令，确保所有代码示例使用有效的 Azure Developer CLI 语法。**

#### Fixed
- **🔧 已移除不存在的 AZD 命令**：对无效命令进行了全面审计和修正：
  - `azd logs`（不存在）→ 替换为 `azd monitor --logs` 或 Azure CLI 替代命令
  - `azd service` 子命令（不存在）→ 替换为 `azd show` 和 Azure CLI
  - `azd infra import/export/validate`（不存在）→ 已移除或替换为有效的替代项
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 标志（不存在）→ 已移除
  - `azd provision --what-if/--rollback` 标志（不存在）→ 更新为使用 `--preview`
  - `azd config validate`（不存在）→ 替换为 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 已移除

- **📚 已更新的文件（命令更正）**：
  - `resources/cheat-sheet.md`: 对命令参考进行了重大修改
  - `docs/deployment/deployment-guide.md`: 修正了回滚和部署策略
  - `docs/troubleshooting/debugging.md`: 修正了日志分析部分
  - `docs/troubleshooting/common-issues.md`: 更新了故障排除命令
  - `docs/troubleshooting/ai-troubleshooting.md`: 修正了 AZD 调试部分
  - `docs/getting-started/azd-basics.md`: 修正了监控命令
  - `docs/getting-started/first-project.md`: 更新了监控和调试示例
  - `docs/getting-started/installation.md`: 修正了帮助和版本示例
  - `docs/pre-deployment/application-insights.md`: 修正了查看日志的命令
  - `docs/pre-deployment/coordination-patterns.md`: 修正了代理调试命令

- **📝 版本引用已更新**：
  - `docs/getting-started/installation.md`: 将硬编码的 `1.5.0` 版本更改为通用的 `1.x.x` 并附带发布链接

#### Changed
- **Rollback Strategies**: 文档已更新为使用基于 Git 的回滚（AZD 不提供本地回滚）
- **Log Viewing**: 将 `azd logs` 引用替换为 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 命令
- **Performance Section**: 移除了不存在的并行/增量部署标志，并提供了有效的替代方案

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: 命令已针对 Azure Developer CLI v1.23.x 进行验证

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**此版本完成了交互式工作坊模块，修复了所有损坏的文档链接，并提高了针对使用 Microsoft AZD 的 AI 开发者的整体内容质量。**

#### Added
- **📝 CONTRIBUTING.md**: 新增贡献指南文档，包含：
  - 关于报告问题和提出更改的明确说明
  - 新内容的文档标准
  - 代码示例指南和提交信息约定
  - 社区参与信息

#### 已完成
- **🎯 Workshop Module 7 (Wrap-up)**：已完成总结模块，包含：
  - 对研讨会成果的全面总结
  - 覆盖 AZD、模板 和 Microsoft Foundry 的关键概念掌握部分
  - 学习旅程继续的推荐
  - 带有难度评级的研讨会挑战练习
  - 社区反馈和支持链接

- **📚 Workshop Module 3 (Deconstruct)**：更新了学习目标，包含：
  - 启用带 MCP 服务器的 GitHub Copilot 指南
  - 对 AZD 模板文件夹结构的理解
  - 基于基础设施即代码（Bicep）的组织模式
  - 实操实验室说明

- **🔧 Workshop Module 6 (Teardown)**：已完成，包含：
  - 资源清理与成本管理目标
  - 使用 `azd down` 安全撤除基础设施的用法
  - 软删除认知服务的恢复指南
  - 针对 GitHub Copilot 和 Azure 门户的额外探索提示

#### 修复
- **🔗 损坏链接修复**：已修复 15+ 条内部文档损坏链接：
  - `docs/ai-foundry/ai-model-deployment.md`：修正指向 microsoft-foundry-integration.md 的路径
  - `docs/troubleshooting/ai-troubleshooting.md`：修正指向 ai-model-deployment.md 和 production-ai-practices.md 的路径
  - `docs/getting-started/first-project.md`：将不存在的 cicd-integration.md 替换为 deployment-guide.md
  - `examples/retail-scenario.md`：修复常见问题和故障排除指南的路径
  - `examples/container-app/microservices/README.md`：修正课程主页和部署指南路径
  - `resources/faq.md` 和 `resources/glossary.md`：更新 AI 章节引用
  - `course-outline.md`：修复讲师指南和 AI 研讨会实验室引用

- **📅 研讨会状态横幅**：已将状态从 “Under Construction” 更新为活动研讨会状态，日期为 2026 年 2 月

- **🔗 研讨会导航**：修复 workshop README.md 中指向不存在的 lab-1-azd-basics 文件夹的损坏导航链接

#### 更改
- <strong>研讨会演示文稿</strong>：移除 “under construction” 警告，研讨会现已完成并可使用
- <strong>导航一致性</strong>：确保所有研讨会模块具有正确的模块间导航
- <strong>学习路径引用</strong>：更新章节交叉引用以使用正确的 microsoft-foundry 路径

#### 验证
- ✅ 所有英文 Markdown 文件的内部链接均有效
- ✅ 研讨会模块 0-7 已完成并包含学习目标
- ✅ 章节和模块之间的导航功能正常
- ✅ 内容适合使用 Microsoft AZD 的 AI 开发者
- ✅ 全文保持对初学者友好的语言和结构
- ✅ CONTRIBUTING.md 为社区贡献者提供了清晰指导

#### 技术实现
- <strong>链接验证</strong>：使用自动 PowerShell 脚本验证所有 .md 内部链接
- <strong>内容审计</strong>：手动审查研讨会的完整性和对初学者的适用性
- <strong>导航系统</strong>：应用一致的章节与模块导航模式

#### 说明
- <strong>范围</strong>：更改仅应用于英文文档
- <strong>翻译</strong>：本版本未更新翻译文件夹（自动化翻译将在稍后同步）
- <strong>研讨会时长</strong>：完整研讨会现在提供 3-4 小时的实践学习

---

### [v3.8.0] - 2025-11-19

#### 高级文档：监控、安全与多体代理模式
**此版本增加了关于 Application Insights 集成、身份验证模式和用于生产部署的多体代理协调的全面 A 级课程。**

#### 新增
- **📊 Application Insights 集成课程**：位于 `docs/pre-deployment/application-insights.md`：
  - 面向 AZD 的部署与自动预配
  - Application Insights + Log Analytics 的完整 Bicep 模板
  - 带自定义遥测的可运行 Python 应用（1,200+ 行）
  - AI/LLM 监控模式（Microsoft Foundry Models 令牌/费用跟踪）
  - 6 张 Mermaid 图（架构、分布式跟踪、遥测流程）
  - 3 个实操练习（告警、仪表板、AI 监控）
  - Kusto 查询示例与成本优化策略
  - 实时指标流与实时调试
  - 40-50 分钟的学习时间，提供可投入生产的模式

- **🔐 身份验证与安全模式课程**：位于 `docs/getting-started/authsecurity.md`：
  - 3 种身份验证模式（连接字符串、Key Vault、托管身份）
  - 用于安全部署的完整 Bicep 基础设施模板
  - 集成 Azure SDK 的 Node.js 应用代码
  - 3 个完整练习（启用托管身份、用户分配身份、Key Vault 轮换）
  - 安全最佳实践与 RBAC 配置
  - 故障排除指南与成本分析
  - 面向生产的无密码身份验证模式

- **🤖 多体代理协调模式课程**：位于 `docs/pre-deployment/coordination-patterns.md`：
  - 5 种协调模式（顺序、并行、分层、事件驱动、共识）
  - 完整的编排器服务实现（Python/Flask，1,500+ 行）
  - 3 个专用代理实现（Research、Writer、Editor）
  - 用于消息排队的 Service Bus 集成
  - 分布式系统的 Cosmos DB 状态管理
  - 展示代理交互的 6 张 Mermaid 图
  - 3 个高级练习（超时处理、重试逻辑、断路器）
  - 成本细目（$240-565/月）与优化策略
  - 用于监控的 Application Insights 集成

#### 增强
- **Pre-deployment 章节**：现在包含全面的监控与协调模式
- **Getting Started 章节**：增强了专业身份验证模式
- <strong>生产就绪性</strong>：从安全到可观测性的完整覆盖
- <strong>课程大纲</strong>：更新以在第 3 章和第 6 章引用新课程

#### 更改
- <strong>学习进阶</strong>：在整个课程中更好地整合安全与监控
- <strong>文档质量</strong>：新课程保持一致的 A 级标准（95-97%）
- <strong>生产模式</strong>：对企业部署提供端到端完整覆盖

#### 改进
- <strong>开发者体验</strong>：从开发到生产监控有清晰路径
- <strong>安全标准</strong>：针对身份验证和机密管理的专业模式
- <strong>可观测性</strong>：与 AZD 完整集成的 Application Insights
- **AI 工作负载**：针对 Microsoft Foundry Models 与多体代理系统的专门监控

#### 验证
- ✅ 所有课程包含完整的可运行代码（非片段）
- ✅ 用于可视学习的 Mermaid 图（3 个课程共计 19 张）
- ✅ 带有校验步骤的实操练习（共 9 个）
- ✅ 可通过 `azd up` 部署的生产就绪 Bicep 模板
- ✅ 成本分析与优化策略
- ✅ 故障排除指南与最佳实践
- ✅ 含校验命令的知识检查点

#### 文档评分结果
- **docs/pre-deployment/application-insights.md**：- 全面监控指南
- **docs/getting-started/authsecurity.md**：- 专业安全模式
- **docs/pre-deployment/coordination-patterns.md**：- 高级多体代理架构
- <strong>整体新内容</strong>：- 保持一致的高质量标准

#### 技术实现
- **Application Insights**：Log Analytics + 自定义遥测 + 分布式跟踪
- <strong>身份验证</strong>：托管身份 + Key Vault + RBAC 模式
- <strong>多体代理</strong>：Service Bus + Cosmos DB + Container Apps + 编排
- <strong>监控</strong>：实时指标 + Kusto 查询 + 告警 + 仪表板
- <strong>成本管理</strong>：采样策略、保留策略、预算控制

### [v3.7.0] - 2025-11-19

#### 文档质量改进与新 Microsoft Foundry Models 示例
**此版本提升了仓库内的文档质量，并新增了一个完整的 Microsoft Foundry Models 部署示例，包含 gpt-4.1 聊天界面。**

#### 新增
- **🤖 Microsoft Foundry Models 聊天示例**：在 `examples/azure-openai-chat/` 中完整部署 gpt-4.1 的实现：
  - 完整的 Microsoft Foundry Models 基础设施（gpt-4.1 模型部署）
  - 带会话历史的 Python 命令行聊天界面
  - 用于安全存储 API 密钥的 Key Vault 集成
  - 令牌使用跟踪与成本估算
  - 速率限制与错误处理
  - 包含 35-45 分钟部署指南的详尽 README
  - 11 个可投入生产的文件（Bicep 模板、Python 应用、配置）
- **📚 文档练习**：在配置指南中添加了实操练习：
  - 练习 1：多环境配置（15 分钟）
  - 练习 2：机密管理实操（10 分钟）
  - 明确的成功标准与校验步骤
- **✅ 部署校验**：在部署指南中新增校验部分：
  - 健康检查程序
  - 成功标准清单
  - 所有部署命令的预期输出
  - 故障排除速查表

#### 增强
- **examples/README.md**：更新为 A 级质量（93%）：
  - 在所有相关部分加入 azure-openai-chat
  - 本地示例数量从 3 更新为 4
  - 添加到 AI 应用示例表
  - 集成到中级用户的快速入门
  - 添加到 Microsoft Foundry Templates 部分
  - 更新比较矩阵和技术发现部分
- <strong>文档质量</strong>：docs 文件夹由 B+（87%）提升至 A-（92%）：
  - 在关键命令示例中添加预期输出
  - 为配置更改包含校验步骤
  - 通过实用练习增强动手学习

#### 更改
- <strong>学习进阶</strong>：为中级学习者更好地整合 AI 示例
- <strong>文档结构</strong>：提供更可操作的练习并明确成果
- <strong>校验流程</strong>：在关键工作流中添加明确的成功标准

#### 改进
- <strong>开发者体验</strong>：Microsoft Foundry Models 部署现在耗时 35-45 分钟（相较复杂替代方案的 60-90 分钟）
- <strong>成本透明度</strong>：为 Microsoft Foundry Models 示例提供明确成本估算（$50-200/月）
- <strong>学习路径</strong>：为 AI 开发者提供清晰的入门示例 azure-openai-chat
- <strong>文档标准</strong>：一致的预期输出和校验步骤

#### 验证
- ✅ Microsoft Foundry Models 示例可通过 `azd up` 完整运行
- ✅ 所有 11 个实现文件语法正确
- ✅ README 指南与实际部署体验相符
- ✅ 跨 8+ 位置更新了文档链接
- ✅ 示例索引准确反映 4 个本地示例
- ✅ 表格中无重复外部链接
- ✅ 所有导航引用正确

#### 技术实现
- **Microsoft Foundry Models 架构**：gpt-4.1 + Key Vault + Container Apps 模式
- <strong>安全性</strong>：托管身份准备就绪，机密存放于 Key Vault
- <strong>监控</strong>：Application Insights 集成
- <strong>成本管理</strong>：令牌跟踪与使用优化
- <strong>部署</strong>：单个 `azd up` 命令完成完整设置

### [v3.6.0] - 2025-11-19

#### 重大更新：Container App 部署示例
**此版本引入了全面的、可投入生产的容器应用部署示例，使用 Azure Developer CLI (AZD)，并将其完整文档与学习路径集成。**

#### 新增
- **🚀 Container App 示例**：在 `examples/container-app/` 中新增本地示例：
  - [Master Guide](examples/container-app/README.md)：容器化部署的完整概览、快速入门、生产与高级模式
  - [Simple Flask API](../../examples/container-app/simple-flask-api)：适合初学者的 REST API，支持 scale-to-zero、健康探针、监控与故障排查
  - [Microservices Architecture](../../examples/container-app/microservices)：可投入生产的多服务部署（API Gateway、Product、Order、User、Notification），异步消息、Service Bus、Cosmos DB、Azure SQL、分布式跟踪、蓝绿/金丝雀部署
- <strong>最佳实践</strong>：针对容器化工作负载的安全、监控、成本优化与 CI/CD 指南
- <strong>代码示例</strong>：完整的 `azure.yaml`、Bicep 模板，以及多语言服务实现（Python、Node.js、C#、Go）
- <strong>测试与故障排除</strong>：端到端测试场景、监控命令、故障排查指南

#### 更改
- **README.md**：更新为突出并链接新的容器应用示例，在 “Local Examples - Container Applications” 下列出
- **examples/README.md**：更新以强调容器应用示例，添加比较矩阵条目，并更新技术/架构引用
- <strong>课程大纲与学习指南</strong>：更新以在相关章节引用新的容器应用示例和部署模式

#### 验证
- ✅ 所有新示例可通过 `azd up` 部署并遵循最佳实践
- ✅ 文档交叉链接与导航已更新
- ✅ 示例涵盖从初学者到高级场景，包括生产微服务

#### 说明
- <strong>范围</strong>：英文文档与示例
- <strong>下一步</strong>：在未来版本中扩展更多高级容器模式与 CI/CD 自动化

### [v3.5.0] - 2025-11-19

#### 产品重命名：Microsoft Foundry
**此版本在所有英文文档中实施了从 "Microsoft Foundry" 到 "Microsoft Foundry" 的全面产品名称更改，以反映 Microsoft 的官方重命名。**

#### 更改
- **🔄 产品名称更新**：将所有引用全面更名为 "Microsoft Foundry"
  - 更新 `docs/` 文件夹中所有引用
  - 重命名文件夹：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 已重命名文件： `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 总计：在 7 个文档文件中更新了 23 个内容引用

- **📁 文件夹结构更改**：
  - `docs/ai-foundry/` 已重命名为 `docs/microsoft-foundry/`
  - 所有交叉引用已更新以反映新的文件夹结构
  - 已验证所有文档中的导航链接

- **📄 文件重命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有内部链接已更新为引用新文件名

#### 已更新的文件
- <strong>章节文档</strong> (7 个文件)：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新了 3 个导航链接
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新了 4 处产品名称引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用 Microsoft Foundry（来自之前的更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新了 3 处引用（概述、社区反馈、文档）
  - `docs/getting-started/azd-basics.md` - 更新了 4 个交叉引用链接
  - `docs/getting-started/first-project.md` - 更新了 2 个章节导航链接
  - `docs/getting-started/installation.md` - 更新了 2 个下一章链接
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新了 3 处引用（导航、Discord 社区）
  - `docs/troubleshooting/common-issues.md` - 更新了 1 个导航链接
  - `docs/troubleshooting/debugging.md` - 更新了 1 个导航链接

- <strong>课程结构文件</strong> (2 个文件)：
  - `README.md` - 更新了 17 处引用（课程概览、章节标题、模板部分、社区见解）
  - `course-outline.md` - 更新了 14 处引用（概述、学习目标、章节资源）

#### 已验证
- ✅ 英文文档中不再存在 "ai-foundry" 文件夹路径引用
- ✅ 英文文档中不再存在 "Microsoft Foundry" 产品名称引用
- ✅ 所有导航链接在新文件夹结构下均可正常使用
- ✅ 文件和文件夹重命名已成功完成
- ✅ 章节间的交叉引用已验证

#### 注意
- <strong>范围</strong>：更改仅应用于 `docs/` 文件夹中的英文文档
- <strong>翻译</strong>：本版本未更新翻译文件夹（`translations/`）
- <strong>工作坊</strong>：本版本未更新工作坊材料（`workshop/`）
- <strong>示例</strong>：示例文件可能仍然引用旧命名（将在未来更新中处理）
- <strong>外部链接</strong>：外部 URL 和 GitHub 仓库引用保持不变

#### 贡献者迁移指南
如果您的本地分支或文档引用了旧结构：
1. 更新文件夹引用： `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新文件引用： `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替换产品名称： "Microsoft Foundry" → "Microsoft Foundry"
4. 验证所有内部文档链接仍然可用

---

### [v3.4.0] - 2025-10-24

#### 基础设施预览与验证增强
**此版本引入对新的 Azure Developer CLI 预览功能的全面支持，并增强了工作坊的用户体验。**

#### 新增
- **🧪 azd provision --preview 功能文档**：全面覆盖新的基础设施预览能力
  - 在速查表中提供命令参考和使用示例
  - 在预配指南中进行详细集成，包含用例和优势
  - 与预检集成以实现更安全的部署验证
  - 入门指南更新，采用安全优先的部署实践
- **🚧 工作坊状态横幅**：专业 HTML 横幅，用于指示工作坊开发状态
  - 渐变设计与施工指示，便于向用户清晰传达信息
  - 更新时间戳以增强透明度
  - 面向所有设备类型的移动响应式设计

#### 增强
- <strong>基础设施安全</strong>：在整个部署文档中集成了预览功能
- <strong>预部署验证</strong>：自动化脚本现在包括基础设施预览测试
- <strong>开发者工作流</strong>：更新的命令序列将预览作为最佳实践
- <strong>工作坊体验</strong>：为用户设置了有关内容开发状态的明确预期

#### 变更
- <strong>部署最佳实践</strong>：现建议以预览优先的工作流程作为方法
- <strong>文档流程</strong>：将基础设施验证提前到学习流程中
- <strong>工作坊呈现</strong>：以专业方式传达状态并提供清晰的开发时间线

#### 改进
- <strong>安全优先方法</strong>：现在可以在部署前验证基础设施更改
- <strong>团队协作</strong>：预览结果可共享以供审查和批准
- <strong>成本意识</strong>：在预配前更好地了解资源成本
- <strong>风险缓解</strong>：通过提前验证减少部署失败

#### 技术实现
- <strong>多文档集成</strong>：预览功能已在 4 个关键文件中记录
- <strong>命令模式</strong>：在文档中保持一致的语法和示例
- <strong>最佳实践集成</strong>：在验证工作流程和脚本中包含预览
- <strong>视觉指示器</strong>：清晰的新功能标记以便发现

#### 工作坊基础设施
- <strong>状态沟通</strong>：带有渐变样式的专业 HTML 横幅
- <strong>用户体验</strong>：清晰的开发状态可以防止混淆
- <strong>专业呈现</strong>：在设定预期的同时维护代码库的可信度
- <strong>时间线透明度</strong>：2025 年 10 月的最后更新时间戳以增强问责

### [v3.3.0] - 2025-09-24

#### 增强的工作坊材料与交互式学习体验
**此版本引入了全面的工作坊材料，包含基于浏览器的交互式指南和结构化学习路径。**

#### 新增
- **🎥 交互式工作坊指南**：支持 MkDocs 预览功能的基于浏览器的工作坊体验
- **📝 结构化工作坊说明**：从发现到定制的 7 步引导式学习路径
  - 0-Introduction: 工作坊概述和设置
  - 1-Select-AI-Template: 模板发现与选择流程
  - 2-Validate-AI-Template: 部署与验证流程
  - 3-Deconstruct-AI-Template: 理解模板架构
  - 4-Configure-AI-Template: 配置与定制
  - 5-Customize-AI-Template: 高级修改与迭代
  - 6-Teardown-Infrastructure: 清理与资源管理
  - 7-Wrap-up: 总结与后续步骤
- **🛠️ 工作坊工具**：用于增强学习体验的 MkDocs 配置（Material 主题）
- **🎯 实践学习路径**：3 步方法论（发现 → 部署 → 定制）
- **📱 GitHub Codespaces 集成**：无缝的开发环境设置

#### 增强
- **AI 工作坊实验室**：扩展为完整的 2-3 小时结构化学习体验
- <strong>工作坊文档</strong>：以专业方式呈现，带有导航和视觉辅助
- <strong>学习进阶</strong>：从模板选择到生产部署的清晰逐步指导
- <strong>开发者体验</strong>：集成工具以简化开发工作流程

#### 改进
- <strong>无障碍性</strong>：基于浏览器的界面，具有搜索、复制功能和主题切换
- <strong>自定进度学习</strong>：灵活的工作坊结构，适应不同学习速度
- <strong>实用应用</strong>：真实世界的 AI 模板部署场景
- <strong>社区整合</strong>：集成 Discord 提供工作坊支持与协作

#### 工作坊功能
- <strong>内置搜索</strong>：快速的关键字和课程发现
- <strong>复制代码块</strong>：所有代码示例支持悬停一键复制功能
- <strong>主题切换</strong>：支持深色/浅色模式以满足不同偏好
- <strong>视觉资源</strong>：截图和图表以增强理解
- <strong>帮助集成</strong>：可直接访问 Discord 获取社区支持

### [v3.2.0] - 2025-09-17

#### 重大导航重构与基于章节的学习系统
**此版本引入了全面的基于章节的学习结构，并在整个代码库中增强了导航。**

#### 新增
- **📚 基于章节的学习系统**：将整个课程重构为 8 个循序渐进的学习章节
  - 第 1 章：基础与快速入门（⭐ - 30-45 分钟）
  - 第 2 章：以 AI 为先的开发（⭐⭐ - 1-2 小时）
  - 第 3 章：配置与身份验证（⭐⭐ - 45-60 分钟）
  - 第 4 章：基础设施即代码与部署（⭐⭐⭐ - 1-1.5 小时）
  - 第 5 章：多代理 AI 解决方案（⭐⭐⭐⭐ - 2-3 小时）
  - 第 6 章：预部署验证与规划（⭐⭐ - 1 小时）
  - 第 7 章：疑难解答与调试（⭐⭐ - 1-1.5 小时）
  - 第 8 章：生产与企业模式（⭐⭐⭐⭐ - 2-3 小时）
- **📚 全面导航系统**：在所有文档中保持一致的导航头和页脚
- **🎯 进度跟踪**：课程完成清单和学习验证系统
- **🗺️ 学习路径指南**：为不同经验水平和目标提供明确的入口点
- **🔗 交叉引用导航**：相关章节和前置条件已清晰链接

#### 增强
- **README 结构**：转变为具有章节组织的结构化学习平台
- <strong>文档导航</strong>：每页现在都包含章节上下文和进度引导
- <strong>模板组织</strong>：示例和模板已映射到相应的学习章节
- <strong>资源整合</strong>：速查表、常见问题和学习指南已连接到相关章节
- <strong>工作坊整合</strong>：动手实验已映射到多个章节的学习目标

#### 更改
- <strong>学习进程</strong>：从线性文档转向灵活的基于章节学习
- <strong>配置位置</strong>：将配置指南重新定位为第 3 章以改善学习流程
- **AI 内容整合**：在整个学习过程中更好地整合 AI 相关内容
- <strong>生产内容</strong>：将高级模式整合在第 8 章，面向企业学习者

#### 改进
- <strong>用户体验</strong>：清晰的导航面包屑和章节进度指示器
- <strong>可访问性</strong>：一致的导航模式便于课程浏览
- <strong>专业呈现</strong>：大学式课程结构，适合学术与企业培训
- <strong>学习效率</strong>：通过改进的组织减少查找相关内容的时间

#### 技术实现
- <strong>导航头</strong>：在 40+ 个文档文件中标准化章节导航
- <strong>页脚导航</strong>：一致的进度引导和章节完成指示器
- <strong>交叉链接</strong>：全面的内部链接系统，连接相关概念
- <strong>章节映射</strong>：模板和示例已与学习目标清晰关联

#### 学习指南增强
- **📚 全面学习目标**：重构学习指南以符合 8 章体系
- **🎯 基于章节的评估**：每章包含具体学习目标和实践练习
- **📋 进度跟踪**：每周学习计划，包含可衡量的成果和完成清单
- **❓ 评估问题**：每章的知识验证问题，面向专业成果
- **🛠️ 实践练习**：包含真实部署场景和故障排除的动手活动
- **📊 技能进阶**：从基础概念到企业模式的清晰提升，并关注职业发展
- **🎓 认证框架**：职业发展成果与社区认可系统
- **⏱️ 时间线管理**：结构化的 10 周学习计划，带有里程碑验证

### [v3.1.0] - 2025-09-17

#### 增强的多代理 AI 解决方案
**此版本改进了零售场景的多代理解决方案，优化了代理命名并增强了文档。**

#### 更改
- <strong>多代理术语</strong>：在整个零售多代理解决方案中将 "Cora agent" 替换为 "Customer agent"，以便更易理解
- <strong>代理架构</strong>：更新了所有文档、ARM 模板和代码示例，以使用一致的 "Customer agent" 命名
- <strong>配置示例</strong>：使用更新的命名约定现代化代理配置模式
- <strong>文档一致性</strong>：确保所有引用都使用专业且描述性的代理名称

#### 增强
- **ARM 模板包**：在 retail-multiagent-arm-template 中更新了 Customer agent 引用
- <strong>架构图</strong>：使用更新的代理命名刷新了 Mermaid 图
- <strong>代码示例</strong>：Python 类和实现示例现在使用 CustomerAgent 命名
- <strong>环境变量</strong>：更新了所有部署脚本以使用 CUSTOMER_AGENT_NAME 约定

#### 改进
- <strong>开发者体验</strong>：文档中代理角色和职责更清晰
- <strong>生产就绪</strong>：与企业命名约定更好地对齐
- <strong>学习材料</strong>：为教学目的提供更直观的代理命名
- <strong>模板可用性</strong>：简化了对代理功能和部署模式的理解

#### 技术细节
- 更新了包含 CustomerAgent 引用的 Mermaid 架构图
- 在 Python 示例中将 CoraAgent 类名替换为 CustomerAgent
- 修改了 ARM 模板 JSON 配置以使用 "customer" 代理类型
- 将环境变量从 CORA_AGENT_* 更新为 CUSTOMER_AGENT_* 模式
- 刷新了所有部署命令和容器配置

### [v3.0.0] - 2025-09-12

#### 重大更改 - 面向 AI 开发者的重点与 Microsoft Foundry 集成
**此版本将代码库转变为面向 AI 的综合学习资源，并集成 Microsoft Foundry。**

#### 新增
- **🤖 AI 优先学习路径**：完全重构，优先面向 AI 开发者和工程师
- **Microsoft Foundry 集成指南**：关于将 AZD 连接到 Microsoft Foundry 服务的全面文档
- **AI 模型部署模式**：涵盖模型选择、配置和生产部署策略的详细指南
- **AI Workshop Lab**: 2-3 小时的实践工作坊，用于将 AI 应用转换为可通过 AZD 部署的解决方案
- **Production AI Best Practices**: 面向企业的模式，用于扩展、监控和保护 AI 工作负载
- **AI-Specific Troubleshooting Guide**: 针对 Microsoft Foundry 模型、Cognitive Services 和 AI 部署问题的全面故障排除指南
- **AI Template Gallery**: 精选的 Microsoft Foundry 模板集合，带有复杂度评级
- **Workshop Materials**: 完整的工作坊结构，包含动手实验和参考资料

#### Enhanced
- **README Structure**: 面向 AI 开发者的 README 结构，基于来自 Microsoft Foundry Discord 的 45% 社区兴趣数据
- **Learning Paths**: 为 AI 开发者设置的专属学习旅程，并保留面向学生和 DevOps 工程师的传统路径
- **Template Recommendations**: 精选 AI 模板，包括 azure-search-openai-demo、contoso-chat 和 openai-chat-app-quickstart
- **Community Integration**: 增强的 Discord 社区支持，包含 AI 专用频道和讨论

#### Security & Production Focus
- **Managed Identity Patterns**: AI 专用的身份验证和安全配置
- **Cost Optimization**: AI 工作负载的令牌使用跟踪和预算控制
- **Multi-Region Deployment**: 全球 AI 应用部署策略
- **Performance Monitoring**: AI 专用指标和 Application Insights 集成

#### Documentation Quality
- **Linear Course Structure**: 从初学者到高级 AI 部署模式的逻辑进阶
- **Validated URLs**: 所有外部仓库链接均已验证且可访问
- **Complete Reference**: 所有内部文档链接均已验证并可正常使用
- **Production Ready**: 具有真实示例的企业部署模式

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**此版本代表对仓库结构和内容呈现的重大改造。**

#### Added
- **Structured Learning Framework**: 所有文档页面现在包含 引言、学习目标 和 学习成果 部分
- **Navigation System**: 在所有文档中添加了“上/下一课”链接，以引导学习进度
- **Study Guide**: 包含学习目标、练习题和评估材料的 comprehensive study-guide.md
- **Professional Presentation**: 为提高可访问性和专业外观，删除了所有表情符号图标
- **Enhanced Content Structure**: 改进了学习材料的组织和流程

#### Changed
- **Documentation Format**: 将所有文档标准化为一致的以学习为中心的结构
- **Navigation Flow**: 实施了贯穿所有学习材料的逻辑进阶
- **Content Presentation**: 删除装饰性元素，采用清晰、专业的格式
- **Link Structure**: 更新了所有内部链接以支持新的导航系统

#### Improved
- **Accessibility**: 删除表情符号依赖以改善屏幕阅读器兼容性
- **Professional Appearance**: 清晰、学术风格的展示，适合企业学习
- **Learning Experience**: 为每节课提供明确的目标和成果的结构化方法
- **Content Organization**: 更好的逻辑流和相关主题之间的连接

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - 完整的入门指南系列
  - 全面的部署和预配文档
  - 详细的故障排除资源和调试指南
  - 预部署验证工具和流程

- **Getting Started Module**
  - AZD 基础：核心概念和术语
  - 安装指南：按平台的设置说明
  - 配置指南：环境设置和身份验证
  - 第一个项目教程：逐步动手学习

- **Deployment and Provisioning Module**
  - 部署指南：完整的工作流文档
  - 预配指南：使用 Bicep 的基础设施即代码
  - 生产部署最佳实践
  - 多服务架构模式

- **Pre-deployment Validation Module**
  - 容量规划：Azure 资源可用性验证
  - SKU 选择：全面的服务等级指导
  - 预检检查：自动化验证脚本（PowerShell 和 Bash）
  - 成本估算和预算规划工具

- **Troubleshooting Module**
  - 常见问题：常见问题及解决方案
  - 调试指南：系统化的故障排除方法
  - 高级诊断技术和工具
  - 性能监控和优化

- **Resources and References**
  - 命令速查表：常用命令的快速参考
  - 词汇表：全面的术语和缩略词定义
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
- **Multi-Platform Support**: 针对 Windows、macOS 和 Linux 的安装与配置指南
- **Multiple Skill Levels**: 面向从学生到专业开发者的不同技能水平的内容
- **Practical Focus**: 动手示例和真实场景
- **Comprehensive Coverage**: 从基本概念到高级企业模式的全面覆盖
- **Security-First Approach**: 全程集成的安全最佳实践
- **Cost Optimization**: 有关经济高效部署和资源管理的指导

#### Documentation Quality
- **Detailed Code Examples**: 实用且经过测试的代码示例
- **Step-by-Step Instructions**: 清晰、可操作的指导
- **Comprehensive Error Handling**: 针对常见问题的故障排除
- **Best Practices Integration**: 行业标准和建议的整合
- **Version Compatibility**: 与最新的 Azure 服务和 azd 功能保持一致

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: 与 Hugging Face、Azure Machine Learning 和自定义模型的集成模式
- **AI Agent Frameworks**: 针对 LangChain、Semantic Kernel 和 AutoGen 部署的模板
- **Advanced RAG Patterns**: 除 Azure AI Search 之外的向量数据库选项（Pinecone、Weaviate 等）
- **AI Observability**: 增强的模型性能、令牌使用和响应质量监控

#### Developer Experience
- **VS Code Extension**: 集成 AZD + Microsoft Foundry 的开发体验
- **GitHub Copilot Integration**: AI 辅助的 AZD 模板生成
- **Interactive Tutorials**: 面向 AI 场景的带自动验证的动手编码练习
- **Video Content**: 面向视觉学习者的 AI 部署补充视频教程

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI 模型治理、合规性和审计轨迹
- **Multi-Tenant AI**: 为多个客户提供隔离 AI 服务的模式
- **Edge AI Deployment**: 与 Azure IoT Edge 和容器实例的集成
- **Hybrid Cloud AI**: 面向 AI 工作负载的多云和混合部署模式

#### Advanced Features
- **AI Pipeline Automation**: 与 Azure Machine Learning 管道的 MLOps 集成
- **Advanced Security**: 零信任模式、私有终端节点和高级威胁防护
- **Performance Optimization**: 针对高吞吐量 AI 应用的高级调优和扩展策略
- **Global Distribution**: 面向 AI 应用的内容分发和边缘缓存模式

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: 全面的 Microsoft Foundry 集成（已完成）
- ✅ **Interactive Tutorials**: 动手 AI 工作坊（已完成）
- ✅ **Advanced Security Module**: AI 专用安全模式（已完成）
- ✅ **Performance Optimization**: AI 工作负载调优策略（已完成）

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: 面向 AI 的部署场景示例（已完成）
- ✅ **Extended FAQ**: AI 专用问题和故障排除（已完成）
- **Tool Integration**: 增强的 IDE 和编辑器集成指南
- ✅ **Monitoring Expansion**: AI 专用的监控和告警模式（已完成）

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: 适用于移动学习的响应式设计
- **Offline Access**: 可下载的文档包
- **Enhanced IDE Integration**: 面向 AZD + AI 工作流的 VS Code 扩展
- **Community Dashboard**: 实时社区指标和贡献跟踪

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: 遵循语义化版本（major.minor.patch）
2. **Date**: 发布或更新日期，格式为 YYYY-MM-DD
3. **Category**: Added、Changed、Deprecated、Removed、Fixed、Security
4. **Clear Description**: 简明扼要地描述变更内容
5. **Impact Assessment**: 说明变更对现有用户的影响

### Change Categories

#### Added
- 新功能、文档模块或能力
- 新示例、模板或学习资源
- 额外的工具、脚本或实用程序

#### Changed
- 对现有功能或文档的修改
- 为提高清晰度或准确性而进行的更新
- 内容或组织结构的重组

#### Deprecated
- 正在逐步弃用的功能或方法
- 计划移除的文档部分
- 已有更好替代方案的方法

#### Removed
- 不再相关的功能、文档或示例
- 过时的信息或已弃用的方法
- 冗余或已合并的内容

#### Fixed
- 文档或代码中的错误修正
- 报告问题或问题的解决
- 对准确性或功能性的改进

#### Security
- 与安全相关的改进或修复
- 安全最佳实践的更新
- 安全漏洞的解决

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- 需要用户采取行动的破坏性变更
- 内容或组织的重大重构
- 改变基本方法或方法论的更改

#### Minor Version (X.Y.0)
- 新功能或内容添加
- 在保持向后兼容性的前提下的增强
- 额外的示例、工具或资源

#### Patch Version (X.Y.Z)
- 错误修复和更正
- 对现有内容的小幅改进
- 澄清和小幅增强

## Community Feedback and Suggestions

我们积极鼓励社区反馈以改进此学习资源：

### How to Provide Feedback
- **GitHub Issues**: 报告问题或建议改进（欢迎 AI 相关问题）
- **Discord Discussions**: 分享想法并与 Microsoft Foundry 社区互动
- **Pull Requests**: 直接为内容做出改进贡献，特别是 AI 模板和指南
- **Microsoft Foundry Discord**: 参与 #Azure 频道，讨论 AZD + AI 相关内容
- **Community Forums**: 参与更广泛的 Azure 开发者讨论

### Feedback Categories
- **AI Content Accuracy**: 对 AI 服务集成和部署信息的更正
- **Learning Experience**: 对 AI 开发者学习流程改进的建议
- **Missing AI Content**: 请求更多 AI 模板、模式或示例
- **Accessibility**: 为不同学习需求改进无障碍性
- **AI Tool Integration**: 对更好 AI 开发工作流集成的建议
- **Production AI Patterns**: 企业级 AI 部署模式的请求

### Response Commitment
- **Issue Response**: 对报告的问题在 48 小时内响应
- **Feature Requests**: 在一周内评估
- **Community Contributions**: 在一周内审查
- **Security Issues**: 优先处理并加速响应

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: 内容准确性和链接验证
- **Quarterly Updates**: 主要内容添加和改进
- **Semi-Annual Reviews**: 全面重构和增强
- **Annual Releases**: 具有重大改进的主要版本发布

### Monitoring and Quality Assurance
- **Automated Testing**: 定期验证代码示例和链接
- **Community Feedback Integration**: 定期采纳用户建议
- **Technology Updates**: 与最新的 Azure 服务和 azd 发布保持一致
- **Accessibility Audits**: 定期审查包容性设计原则

## Version Support Policy

### Current Version Support
- **Latest Major Version**: 提供完整支持并定期更新
- **Previous Major Version**: 在 12 个月内提供安全更新和关键修复
- **Legacy Versions**: 仅社区支持，不提供官方更新

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: 逐步迁移说明
- **Compatibility Notes**: 有关破坏性变更的详细说明
- **Tool Support**: 协助迁移的脚本或实用程序
- **Community Support**: 专门的论坛用于迁移问题

---

**Navigation**
- **Previous Lesson**: [学习指南](resources/study-guide.md)
- **Next Lesson**: 返回 [主 README](README.md)

**Stay Updated**: 关注此仓库以获取有关新发布和学习材料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 变更日志 - AZD 初学者指南

## 介绍

本变更日志记录了 AZD 初学者仓库的所有显著更改、更新和改进。我们遵循语义化版本控制原则，并维护该日志以帮助用户理解版本间的变化。

## 学习目标

通过查看本变更日志，您将能够：
- 了解新功能和内容的添加动态
- 理解已有文档的改进
- 跟踪错误修复和更正以确保准确性
- 关注学习材料的演变过程

## 学习成果

阅读变更日志条目后，您将能够：
- 辨识新增的学习内容和资源
- 理解哪些章节已更新或改进
- 根据最新材料规划您的学习路径
- 提交反馈和建议以促进未来改进

## 版本历史

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 刷新：版本时效更新
**此版本重新验证了课程对 `azd` `1.27.1`（2026年7月，最新稳定版）及当前预览版 AI agent 扩展 `azure.ai.agents` `1.0.0-beta.5` 的适用性，确保所有“验证通过”横幅在 1.26.0、1.27.0 和 1.27.1 发布后均为最新。**

#### 变更
- **✅ 验证基线已更新**，从根目录 README、所有章 README、第一章开发容器课程（含固定版本示例）、第四章自定义模板课程、第五章多代理课程及工作坊文档中的 `azd 1.25.6`（2026年6月）提升至 `azd 1.27.1`（2026年7月）
- **🤖 第二章基线刷新**，将 `agents.md`、`ai-model-deployment.md`、`ai-workshop-lab.md` 和 `microsoft-foundry-integration.md` 中的基线从 `azd 1.23.12`（2026年3月）更新至 `azd 1.27.1`，验证注释日期更新为 2026-07-13
- **🧩 AI agent 扩展版本提升**，章节二 README 和 `agents.md` 中从 `azure.ai.agents` 的 `0.1.40-preview`/`0.1.18-preview` 升级到当前 `1.0.0-beta.5`
- **🧪 工作坊验证示例**（`azd version` 输出）更新至 `1.27.1`

#### 相关 azd 版本说明（1.26.0 → 1.27.1）
- **1.26.0（2026-06-24）：** 支持 Azure Functions 运行于 Flex Consumption 计划，新增 `azd config sub-filter` 支持每租户订阅过滤，集成自包含扩展包（`azd x pack --bundle`）和新增 `azd tool install azure-skills`
- **1.27.0（2026-06-30）：** 直接在 `azure.yaml` 中建模 Azure AI Foundry 项目/代理（无需 Bicep/Terraform 初始化）、为 App Service 提供容器部署支持（`host: appservice` + `language: docker`）、为 `azd extension` 命令新增 `-s/--source` 参数及新增 `azd tool uninstall`
- **1.27.1（2026-07-09）：** `azd extension install` 添加 `--no-dependencies` 标志，默认将弃用模型从目录/额度提示中排除，并修复多个漏洞

#### 更新文件
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### 初学者补充 #2：模板编写、开发容器、Pulumi、Azure DevOps、服务主体等
**此版本弥补了 azd 覆盖分析发现的剩余中级差距：如何编写和发布自定义模板，可复现的开发容器/代码空间环境，Pulumi 基础设施提供者，Azure DevOps CI/CD 演练，服务主体身份验证，主机选择指南（AKS / Spring Apps），`azd restore` / `azd package` 说明，钩子错误处理以及团队/共享环境实践。**

#### 新增
- **🧱 第四章新增课程** `docs/chapter-04-infrastructure/custom-templates.md` — 编写自定义 azd 模板：必需结构（`azure.yaml`、`infra/`、`src/`）、`metadata.template` 字段、使用 `uniqueString()` 资源令牌和 `azd-env-name` 标签参数化基础设施，本地测试用`azd init --template <local-path>`，发布到 GitHub 及提交至 Awesome AZD 画廊
- **📦 第一章新增课程** `docs/chapter-01-foundation/dev-containers.md` — 利用开发容器和 GitHub 代码空间实现可复现 azd 环境：最小 `.devcontainer/devcontainer.json` 配置，使用官方 `ghcr.io/azure/azure-dev/azd` 功能模块，语言特定功能，面向容器主机的 `docker-in-docker`，以及远程登录的 `azd auth login --use-device-code`
- **🧩 Pulumi 与 azd** 在 `docs/chapter-04-infrastructure/provisioning.md` 中新增：`infra.provider: pulumi`、Pulumi 文件夹布局、堆栈映射到 azd 环境、必需的输出/标签，以及相同的 `azd up` / `azd down` 工作流程
- **🎯 主机选择指南** 在 `docs/chapter-04-infrastructure/provisioning.md` 增加 — 面向初学者的 `appservice`、`staticwebapp`、`function`、`containerapp`、`aks` 和 `springapp` 比较，以及何时选择 AKS 或 Azure Spring Apps 的指导
- **🛠️ Azure DevOps CI/CD 演练** 在 `docs/chapter-08-production/production-ai-practices.md` 中新增 — 使用 `azd pipeline config --provider azdo` 配置，支持 OIDC 的工作负载身份联合服务连接，生成的 `azure-dev.yml` 文件和变量组设置
- **🔑 添加服务主体（模式4）** 于 `docs/chapter-03-configuration/authsecurity.md` — 包括 `az ad sp create-for-rbac`，非交互式客户端密钥和联合/OIDC 凭据登录的 `azd auth login`，使用场景及安全存储凭据
- **🪝 钩子错误处理** 副节新增于 `docs/chapter-04-infrastructure/deployment-guide.md` — 退出代码和 `set -e`，`continueOnError`，使用 `azd hooks run` 单独测试钩子，操作系统特定 shell 及 `--debug`
- **👥 团队/共享环境** 章节新增于 `docs/chapter-03-configuration/configuration.md` — 说明`.azure/` 文件夹内容，需忽略的文件，开发人员独立环境，`azd env list`/`select` 命令，以及 CI/CD 中的环境值提供方案
- **🧰 `azd restore` 和扩展的 `azd package`** 于 `resources/cheat-sheet.md` 中解释 — 依赖恢复和构建可部署工件而无需部署

#### 变更
- **🧭 第四章课程表** 更新，包含新增的“编写自定义模板”课程（课程3）
- **🧭 第一章课程表** 更新，加入新增的“开发容器与代码空间”课程（课程5）；`bring-your-own-app.md` 和 `dev-containers.md` 之间建立了导航页脚链接

### [v3.21.0] - 2026-06-16

#### 初学者补充：动手多代理课程、Bring Your Own App、Terraform 和 CI/CD 演练
**此版本通过新增两个动手课程（一个可部署的多代理演练和如何将 azd 添加到现有应用），新增面向初学者的钩子介绍，Terraform 与 azd 章节，分步骤的 GitHub Actions 流水线演练，对新预览扩展的解读以及明确的部署验证清单，解决了完整初学者指南的最大缺口。**

#### 新增
- **🤝 新增第五章课程** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 完全动手的可部署两代理演练（协调者+专家），基于真实模板（`contoso-creative-writer`），涵盖何时使用多代理，`azd up` 工作流程，理解部署资源，跨代理跟踪，自定义及清理
- **📦 新增第一章课程** `docs/chapter-01-foundation/bring-your-own-app.md` — 如何使用 `azd init` 将 azd 添加到现有项目（“使用当前目录代码”），理解 `azure.yaml` 和 `infra/`，`azd infra generate`，主机检测和使用 `azd up` 部署
- **🌐 Terraform 与 azd** 新增于 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` 配置，`.tf` 文件夹布局，必需的 `AZURE_*` 输出和 `azd-env-name` 标签，以及相同的 `azd up` / `azd down` 工作流程（弥补了课程中曾声称支持 Terraform 但仅展示 Bicep 的缺失）
- **⚙️ 分步骤 GitHub Actions 演练** 于 `docs/chapter-08-production/production-ai-practices.md` — 从 GitHub 仓库到自动化部署：`azd pipeline config`，OIDC 联邦凭据（无存储密钥），生成的 `azure-dev.yml` 文件及机密与变量指导
- **🪝 初学者“钩子新手？”介绍** 于 `docs/chapter-04-infrastructure/deployment-guide.md` — 介绍什么是钩子，钩子阶段表，最小化首个钩子，以及使用 `azd hooks run` 手动运行钩子
- **✅ “验证部署”清单** 添加于 `docs/chapter-01-foundation/first-project.md` 第5步 — 烟雾测试，健康检查端点和明确成功标准
- **🧩 新预览扩展解读** `azure.ai.skills` 与 `azure.ai.connections`（其用途及适用场景），收录于 `docs/chapter-08-production/production-ai-practices.md`

#### 变更
- **🧭 第五章课程表** 修正：`multi-agent-basics.md` 现为第一课（唯一完全动手课程），诚实标明第二课位于第六章，零售场景为架构蓝图而非一键模板
- **🧭 第一章课程表** 现包含新增 “Bring Your Own App” 课程（课程4）
- **🔗 导航页脚** 更新：`first-project.md` 现向后链接至 `bring-your-own-app.md`

#### 修复
- **🧱 关闭“声称但缺失的” Terraform 缺口** — 之前课程中提及支持 Terraform 却未展示
- **🔀 修正误导的第五章交叉链接**，曾暗示存在完整多代理实现，实际仅为架构蓝图

#### 更新文件
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(新增)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(新增)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 刷新，全代理生命周期命令与 Aspire 品牌更新

**此版本针对 `azd` `1.25.6`（2026年6月）和 `azure.ai.agents` `0.1.40-preview` 扩展重新验证全课程，将 AI 指导从“搭建代理”扩展到完整代理生命周期（测试 → 评估 → 优化 → 检查 → 删除），展示新的 `azure.ai.skills` 和 `azure.ai.connections` 预览扩展，并注明“.NET Aspire”→“Aspire”产品改名。**

#### 新增
- **🔁 面向初学者和 AI 工程师的完整代理生命周期覆盖**：
  - `docs/chapter-01-foundation/azd-basics.md` — 在“扩展和 AI 命令”部分新增生命周期表（搭建 → 测试 → 评估 → 改进 → 检查 → 清理）
  - `docs/chapter-08-production/production-ai-practices.md` — 新增“管理代理生命周期”章节，涵盖 `azd ai agent invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
  - `resources/cheat-sheet.md` — 扩展 AI 代理命令，包含 `invoke`、`endpoint show`、`eval generate`、`optimize`、`code download` 和 `delete --force`
- **🧩 新预览扩展文档**：新增 `azure.ai.skills`（可重用代理技能）和 `azure.ai.connections`（Foundry 连接），已添加至扩展表和备忘单
- **⏱️ 响应时间指导** — `azd ai agent invoke` 示例现在标注显示整体延迟和首字节时间
- **📌 根目录 README 中版本横幅**，指引学习者查看 `azd version` 和 `azd upgrade`

#### 修改
- **✅ 验证基线已从 `azd 1.23.12`（2026年3月）更新至 `azd 1.25.6`（2026年6月）**，更新所有章节 README 和工作坊文档
- <strong>🤖 第二章扩展说明</strong>更新为 `azure.ai.agents` `0.1.40-preview`，取代之前的 `0.1.18-preview`
- **🧪 工作坊验证示例**（`azd version` 输出）更新为 `1.25.6`
- **🧭 README “azd 今日新功能”** 已刷新，强调端到端代理生命周期、新 AI 扩展和最近的质量改进（`azd init` 幂等性、`azd auth login` 旧令牌清理、`azd tool` 首次运行提示）
- **📖 第二章 agents.md（选项4）** 现在指引学习者了解部署后生命周期命令，而不止步于 `azd up`

#### 修复
- **🏷️ 产品命名** — 新增 Aspire 品牌改名说明（“.NET Aspire” 现为简写版 “Aspire”）；azd 的 Aspire 支持不变
- **🔎 实时发行验证**，基于 Azure Developer CLI 发布源确认：稳定 CLI `1.25.6`（2026-06-12）及 `azure.ai.agents` `0.1.40-preview`（2026-06-15）

#### 更新文件
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

#### 初学者上手说明、设置验证及最终 AZD 命令清理
**本版本紧随 AZD 1.23 验证流程，进行面向初学者的文档改进：明晰 AZD 首选的认证流程，添加本地设置验证脚本，对关键命令进行实时 AZD CLI 验证，并移除变更日志以外的过时英文命令引用。**

#### 新增
- **🧪 初学者设置验证脚本**，包含 `validate-setup.ps1` 和 `validate-setup.sh`，以便学习者在开始第一章前确认必备工具
- **✅ 根目录 README 与第一章 README 中新增前置设置验证步骤**，确保缺少的先决条件能够在执行 `azd up` 前被检测到

#### 修改
- **🔐 初学者认证指导**，现在统一视 `azd auth login` 为 AZD 工作流的主要认证路径，仅当直接使用 Azure CLI 命令时才建议可选 `az login`
- **📚 第1章上手流程**，指引学习者在安装、认证和首次部署前验证本地环境配置
- **🛠️ 验证器提示信息**，区分阻断性需求和对仅使用 AZD 路径的可选 Azure CLI 警告
- **📖 配置、排错和示例文档**，明确区分必须的 AZD 认证和可选的 Azure CLI 登录，避免混淆

#### 修复
- <strong>📋 剩余英文命令引用</strong>统一更新为现行 AZD 命令格式，包括备忘单中的 `azd config show` 和用于 Azure 门户概览的 `azd monitor --overview`
- <strong>🧭 第一章的承诺表述</strong>更谨慎，避免过度承诺所有模板和 Azure 资源一定零错误或回滚
- <strong>🔎 实时 CLI 验证</strong>确认支持以下命令：`azd env get-values`、`azd template list`、`azd extension list --installed`、`azd copilot consent list`、`azd mcp start`、`azd provision --preview`、`azd monitor --logs`、`azd down --force --purge`

#### 更新文件
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

#### AZD 1.23.12 验证、工作坊环境扩展及 AI 模型刷新
**本版本针对 `azd` `1.23.12` 进行文档验证更新，修正过时的 AZD 命令示例，刷新 AI 模型指导到当前默认值，并扩展工作坊说明，支持除 GitHub Codespaces 之外的开发容器和本地克隆环境。**

#### 新增
- **✅ 核心章节和工作坊文档中新增验证说明**，明确测试时使用的 AZD 基线，帮助使用不同 CLI 版本的学习者理解
- **⏱️ 部署超时指导**，针对长时间运行的 AI 应用部署，建议使用 `azd deploy --timeout 1800`
- **🔎 扩展检查步骤**，展示 `azd extension show azure.ai.agents` 用法于 AI 工作流文档中
- **🌐 更广泛的工作坊环境指导**，涵盖 GitHub Codespaces、开发容器和本地克隆，并结合 MkDocs 使用

#### 修改
- **📚 各章节介绍 README**，统一标注针对 `azd 1.23.12` 验证，涵盖基础、配置、基础设施、多代理、预部署、排错和生产章节
- <strong>🛠️ AZD 命令引用</strong>全过程更新：
  - `azd config list` → `azd config show`
  - `azd env show` → 根据信息环境不同为 `azd env list` 或 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview`（针对 Application Insights 概述场景）
- **🧪 预览功能示例简化**，以当前支持的命令为准，如 `azd provision --preview` 和 `azd provision --preview -e production`
- **🧭 工作坊流程更新**，学习者可在 Codespaces、开发容器或本地克隆中完成实验，不再仅假设 Codespaces 运行环境
- **🔐 认证指南更新**，首选 `azd auth login`，仅在直接使用 Azure CLI 命令时将 `az login` 设为可选

#### 修复
- <strong>🪟 Windows 安装命令</strong>调整为当前安装指南中准确的 `winget` 包名大小写
- <strong>🐧 Linux 安装指导</strong>修正，去掉不支持的发行版特定 `azd` 包管理器指令，直接指向发行版资产
- **📦 AI 模型示例更新**，由旧默认示例如 `gpt-35-turbo`、`text-embedding-ada-002` 刷新为当前实例如 `gpt-4.1-mini`、`gpt-4.1`、`text-embedding-3-large`
- **📋 部署和诊断代码段修正**，在日志、脚本和排错步骤中使用当前环境和状态命令
- **⚙️ GitHub Actions 指南更新**，将 `Azure/setup-azd@v1.0.0` 替换为 `Azure/setup-azd@v2`
- **🤖 MCP/Copilot 同意指南**，由 `azd mcp consent` 改为 `azd copilot consent list`

#### 改善
- **🧠 AI 章节内容改进**，更清晰说明预览敏感的 `azd ai` 行为、租户特定登录、当前扩展使用及更新后的模型部署建议
- **🧪 工作坊说明提升**，使用更实际版本示例和更明确环境配置语言，便于动手实验
- **📈 生产和排错文档改进**，更好匹配当前监控、回退模型和费用层级示例

#### 更新文件
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
**此版本增加了 `azd ai`、`azd extension` 和 `azd mcp` 命令覆盖于所有 AI 相关章节，修复 agents.md 中的断链和过时代码，更新备忘单，并彻底更新示例模板部分，包含验证描述和新的 Azure AI AZD 模板。**

#### 新增
- **🤖 在7个文件中覆盖 AZD AI CLI 命令**（此前只在第8章涵盖）：
  - `docs/chapter-01-foundation/azd-basics.md` — 新增“扩展和 AI 命令”章节，介绍 `azd extension`、`azd ai agent init` 和 `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — 选项4：“azd ai agent init”，并附模板与清单方法比较表
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — 包含“Foundry 的 AZD 扩展”和“代理优先部署”小节

  - `docs/chapter-05-multi-agent/README.md` — 快速开始现同时显示基于模板和清单的部署路径
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 部署部分现包含 `azd ai agent init` 选项
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — “AZD AI 扩展诊断命令”子部分
  - `resources/cheat-sheet.md` — 新增“AI & 扩展命令”部分，包含 `azd extension`、`azd ai agent init`、`azd mcp` 和 `azd infra generate`
- **📦 新增 AZD AI 示例模板** 于 `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — 使用 Blazor WebAssembly、Semantic Kernel 和语音聊天支持的 .NET RAG 聊天
  - **azure-search-openai-demo-java** — 使用 Langchain4J 的 Java RAG 聊天，支持 ACA/AKS 部署选项
  - **contoso-creative-writer** — 使用 Azure AI Agent Service、Bing Grounding 和 Prompty 的多智能体创意写作应用
  - **serverless-chat-langchainjs** — 使用 Azure Functions + LangChain.js + Cosmos DB 的无服务器 RAG，支持 Ollama 本地开发
  - **chat-with-your-data-solution-accelerator** — 企业级 RAG 加速器，带管理门户、Teams 集成以及 PostgreSQL/Cosmos DB 选项
  - **azure-ai-travel-agents** — 多智能体 MCP 协调参考应用，服务器端支持 .NET、Python、Java 和 TypeScript
  - **azd-ai-starter** — 极简 Azure AI 基础设施 Bicep 起始模板
  - **🔗 极佳 AZD AI 画廊链接** — 参考 [awesome-azd AI 画廊](https://azure.github.io/awesome-azd/?tags=ai)（80+ 模板）

#### 修复
- **🔗 agents.md 导航**: 上一页/下一页链接现匹配第二章 README 课程顺序（Microsoft Foundry Integration → Agents → AI Model Deployment）
- **🔗 agents.md 断链**: 将 `production-ai-practices.md` 修正为 `../chapter-08-production/production-ai-practices.md`（3 处）
- **📦 agents.md 废弃代码**: 替换 `opencensus` 为 `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md 非法 API**: 将 `max_tokens` 从 `create_agent()` 移动到 `create_run()` 作为 `max_completion_tokens`
- **🔢 agents.md 令牌计数**: 用 `tiktoken.encoding_for_model()` 替换粗略的 `len//4` 估算
- **azure-search-openai-demo**: 服务名称修正为“Azure AI Search + Azure Container Apps”，取代之前的“Cognitive Search + App Service”（默认主机于 2024 年 10 月更改）
- **contoso-chat**: 更新描述以引用 Azure AI Foundry + Prompty，符合仓库的实际标题和技术栈

#### 移除
- **ai-document-processing**: 移除不可用的模板引用（仓库未公开作为 AZD 模板）

#### 改进
- **📝 agents.md 练习**: 练习 1 现显示预期输出和 `azd monitor` 步骤；练习 2 包含完整的 `FunctionTool` 注册代码；练习 3 用具体的 `prepdocs.py` 命令替代模糊指导
- **📚 agents.md 资源**: 更新文档链接至最新 Azure AI Agent Service 文档和快速开始
- **📋 agents.md 后续步骤表**: 新增 AI 研讨会实验室链接，涵盖完整章节内容

#### 更新文件
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
**此版本改进了 README.md 章节导航，采用了增强的表格格式。**

#### 变更
- <strong>课程地图表</strong>: 增强为直接课程链接、时长估算和复杂度评分
- <strong>文件夹清理</strong>: 移除冗余的旧文件夹（deployment/、getting-started/、pre-deployment/、troubleshooting/）
- <strong>链接验证</strong>: 课程地图表内 21+ 个内部链接全部验证

### [v3.16.0] - 2026-02-05

#### 产品名称更新
**此版本将产品引用更新为当前的 Microsoft 品牌名称。**

#### 变更
- **Microsoft Foundry → Microsoft Foundry**: 所有非翻译文件中的引用均已更新
- **Azure AI Agent Service → Foundry Agents**: 服务名称更新以反映当前品牌

#### 更新文件
- `README.md` - 课程主页
- `changelog.md` - 版本历史
- `course-outline.md` - 课程结构
- `docs/chapter-02-ai-development/agents.md` - AI 代理指南
- `examples/README.md` - 示例文档
- `workshop/README.md` - 研讨会主页
- `workshop/docs/index.md` - 研讨会索引
- `workshop/docs/instructions/*.md` - 所有研讨会指令文件

---

### [v3.15.0] - 2026-02-05

#### 重大仓库重构：基于章节的文件夹命名
**此版本将文档重组为专门的章节文件夹，以便更清晰的导航。**

#### 文件夹重命名
旧文件夹已替换为带章节编号的文件夹：
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 新增文件夹：`docs/chapter-05-multi-agent/`

#### 文件迁移
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
| 所有预部署文件 | pre-deployment/ | chapter-06-pre-deployment/ |
| 所有故障排除文件 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 新增
- **📚 章节 README 文件**: 在每个章节文件夹中创建 README.md，内容包括：
  - 学习目标和时长
  - 课程表及描述
  - 快速开始命令
  - 各章节导航

#### 变更
- **🔗 更新所有内部链接**: 超过 78 个路径在所有文档中更新
- **🗺️ 主 README.md**: 更新课程地图呈现新章节结构
- **📝 examples/README.md**: 更新对章节文件夹的交叉引用

#### 移除
- 旧文件夹结构（getting-started/、microsoft-foundry/、deployment/、pre-deployment/、troubleshooting/、ai-foundry/）

---

### [v3.14.0] - 2026-02-05

#### 仓库重构：章节导航
**此版本添加了章节导航 README 文件（此后被 v3.15.0 取代）。**

---

### [v3.13.0] - 2026-02-05

#### 新 AI 代理指南
**此版本新增了使用 Azure Developer CLI 部署 AI 代理的完整指南。**

#### 新增
- **🤖 docs/microsoft-foundry/agents.md**: 完整指南涵盖：
  - 什么是 AI 代理及其与聊天机器人的区别
  - 三个快速启动代理模板（Foundry Agents、Prompty、RAG）
  - 代理架构模式（单智能体、RAG、多智能体）
  - 工具配置与自定义
  - 监控与指标跟踪
  - 成本考虑和优化
  - 常见故障排除情形
  - 三个动手练习及成功标准

#### 内容结构
- <strong>介绍</strong>: 面向初学者的代理概念
- <strong>快速开始</strong>: 使用 `azd init --template get-started-with-ai-agents` 部署代理
- <strong>架构模式</strong>: 代理模式的视觉示意图
- <strong>配置</strong>: 工具设置和环境变量
- <strong>监控</strong>: Application Insights 集成
- <strong>练习</strong>: 递进式的动手学习（每个 20-45 分钟）

---

### [v3.12.0] - 2026-02-05

#### DevContainer 环境更新
**此版本更新了开发容器配置，采用现代工具和更好的默认设置，以提升 AZD 学习体验。**

#### 变更
- **🐳 基础镜像**: 由 `python:3.12-bullseye` 更新为 `python:3.12-bookworm`（最新 Debian 稳定版）
- **📛 容器名称**: 由“Python 3”更名为“AZD for Beginners”，更清晰表达用途

#### 新增
- **🔧 新的开发容器特性**:
  - 启用 Bicep 支持的 `azure-cli`
  - `node:20`（AZD 模板的 LTS 版本）
  - 用于模板管理的 `github-cli`
  - 支持容器应用部署的 `docker-in-docker`

- **🔌 端口转发**: 预配置常见开发端口：
  - 8000（MkDocs 预览）
  - 3000（Web 应用）
  - 5000（Python Flask）
  - 8080（API）

- **🧩 新增 VS Code 扩展**:
  - `ms-python.vscode-pylance` - Python 智能感知增强
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 支持
  - `ms-azuretools.vscode-docker` - Docker 支持
  - `ms-azuretools.vscode-bicep` - Bicep 语言支持
  - `ms-azure-devtools.azure-resource-groups` - Azure 资源管理
  - `yzhang.markdown-all-in-one` - Markdown 编辑
  - `DavidAnson.vscode-markdownlint` - Markdown 代码检查
  - `bierner.markdown-mermaid` - Mermaid 图表支持
  - `redhat.vscode-yaml` - YAML 支持（用于 azure.yaml）
  - `eamodio.gitlens` - Git 可视化
  - `mhutchie.git-graph` - Git 历史

- **⚙️ VS Code 设置**: 新增 Python 解释器、保存时格式化和空白字符修剪的默认设置

- **📦 更新 requirements-dev.txt**:
  - 新增 MkDocs 压缩插件
  - 新增 pre-commit 代码质量检查
  - 新增 Azure SDK 包（azure-identity、azure-mgmt-resource）

#### 修复
- **Post-Create 命令**: 容器启动时现验证 AZD 和 Azure CLI 的安装

---

### [v3.11.0] - 2026-02-05

#### 为初学者优化的 README
**此版本显著改进了 README.md，使其对初学者更友好，并新增 AI 开发者必备资源。**

#### 新增
- **🆚 Azure CLI 与 AZD 对比**: 清晰解释何时使用每个工具，并辅以实用示例
- **🌟 极佳 AZD 资源链接**: 直接指向社区模板画廊和贡献资源：
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ 可直接部署的模板
  - [提交模板](https://github.com/Azure/awesome-azd/issues) - 社区贡献入口
- **🎯 快速开始指南**: 简化的三步入门流程（安装 → 登录 → 部署）
- **📊 基于经验的导航表**: 明确基于开发者经验的起点指导

#### 变更
- **README 结构**: 重新组织为渐进式披露 —— 先显示关键信息
- <strong>介绍部分</strong>: 重写以解释“`azd up` 的魔力”，面向完全初学者
- <strong>移除重复内容</strong>: 删除重复的故障排除章节
- <strong>故障排除命令</strong>: 修正 `azd logs` 引用，改用有效的 `azd monitor --logs`

#### 修复

- **🔐 认证命令**：向 cheat-sheet.md 中添加了 `azd auth login` 和 `azd auth logout`
- <strong>无效命令引用</strong>：从 README 故障排除部分移除了剩余的 `azd logs`

#### 备注
- <strong>范围</strong>：更改应用于主 README.md 和 resources/cheat-sheet.md
- <strong>目标受众</strong>：专门针对新接触 AZD 的开发人员的改进

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 命令准确性更新
**此版本纠正了文档中不存在的 AZD 命令，确保所有代码示例均使用有效的 Azure Developer CLI 语法。**

#### 修复
- **🔧 移除不存在的 AZD 命令**：全面审核并更正无效命令：
  - `azd logs`（不存在）→ 替换为 `azd monitor --logs` 或 Azure CLI 备选命令
  - `azd service` 子命令（不存在）→ 替换为 `azd show` 和 Azure CLI 命令
  - `azd infra import/export/validate`（不存在）→ 移除或替换为有效的替代命令
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 参数（不存在）→ 移除
  - `azd provision --what-if/--rollback` 参数（不存在）→ 更新为使用 `--preview`
  - `azd config validate`（不存在）→ 替换为 `azd config list`
  - `azd info`、`azd history`、`azd metrics`（不存在）→ 移除

- **📚 更新文件命令修正**：
  - `resources/cheat-sheet.md`：命令参考大幅改版
  - `docs/deployment/deployment-guide.md`：修正回滚和部署策略
  - `docs/troubleshooting/debugging.md`：更正日志分析部分
  - `docs/troubleshooting/common-issues.md`：更新故障排除命令
  - `docs/troubleshooting/ai-troubleshooting.md`：修正 AZD 调试章节
  - `docs/getting-started/azd-basics.md`：更正监控命令
  - `docs/getting-started/first-project.md`：更新监控和调试示例
  - `docs/getting-started/installation.md`：修正帮助和版本示例
  - `docs/pre-deployment/application-insights.md`：更正日志查看命令
  - `docs/pre-deployment/coordination-patterns.md`：修复代理调试命令

- **📝 版本引用更新**：
  - `docs/getting-started/installation.md`：将硬编码的 `1.5.0` 版本改为通用 `1.x.x` 并附带发布链接

#### 变更
- <strong>回滚策略</strong>：文档更新为使用基于 Git 的回滚（AZD 未提供原生回滚功能）
- <strong>日志查看</strong>：将所有 `azd logs` 引用替换为 `azd monitor --logs`、`azd monitor --live` 和 Azure CLI 命令
- <strong>性能部分</strong>：移除不存在的并行/增量部署参数，提供有效的替代方案

#### 技术细节
- **有效的 AZD 命令**：`init`、`up`、`auth`、`deploy`、`down`、`provision`、`publish`、`completion`、`config`、`env`、`show`、`version`、`monitor`
- **有效的 azd monitor 参数**：`--live`、`--logs`、`--overview`
- <strong>移除功能</strong>：`azd logs`、`azd service`、`azd infra import/export/validate`、`azd history`、`azd metrics`、`azd info`、`azd config validate`

#### 备注
- <strong>验证</strong>：命令已对照 Azure Developer CLI v1.23.x 进行验证

---

### [v3.9.0] - 2026-02-05

#### 研讨会完成及文档质量更新
**此版本完成了交互式研讨会模块，修复所有断开的文档链接，并提升了面向微软 AZD AI 开发者的整体内容质量。**

#### 新增
- **📝 CONTRIBUTING.md**：新增贡献指南文档，包含：
  - 明确的报告问题和提出变更的指引
  - 新内容的文档标准
  - 代码示例规范和提交信息约定
  - 社区参与信息

#### 完成
- **🎯 研讨会模块7（总结）**：完整完成总结模块，包含：
  - 研讨会成果综合总结
  - 掌握的关键概念覆盖 AZD、模板和微软 Foundry
  - 学习旅程后续建议
  - 研讨会挑战练习及难度评级
  - 社区反馈与支持链接

- **📚 研讨会模块3（解构）**：更新学习目标，包含：
  - GitHub Copilot 与 MCP 服务器激活指导
  - AZD 模板文件夹结构理解
  - 基础设施即代码 (Bicep) 组织模式
  - 实操实验室指引

- **🔧 研讨会模块6（拆卸）**：完成，包含：
  - 资源清理及成本管理目标
  - 安全基础设施撤销的 `azd down` 使用
  - 软删除认知服务恢复指导
  - GitHub Copilot 和 Azure 门户的额外探索提示

#### 修复
- **🔗 断链修复**：解决了超过15个内部文档断链：
  - `docs/ai-foundry/ai-model-deployment.md`：修正至 microsoft-foundry-integration.md 路径
  - `docs/troubleshooting/ai-troubleshooting.md`：更正 ai-model-deployment.md 和 production-ai-practices.md 路径
  - `docs/getting-started/first-project.md`：将不存在的 cicd-integration.md 替换为 deployment-guide.md
  - `examples/retail-scenario.md`：修正 FAQ 和故障排除指南路径
  - `examples/container-app/microservices/README.md`：修正课程首页和部署指南路径
  - `resources/faq.md` 和 `resources/glossary.md`：更新 AI 章节引用
  - `course-outline.md`：修正导师指南和 AI 研讨会实验引用

- **📅 研讨会状态横幅**：状态从“建设中”更新为2026年2月的活动状态

- **🔗 研讨会导航**：修正 workshop README.md 中指向不存在 lab-1-azd-basics 文件夹的断链导航

#### 变更
- <strong>研讨会演示</strong>：移除“建设中”警告，研讨会现已完成并可使用
- <strong>导航一致性</strong>：确保所有研讨会模块均具备正确的模块间导航
- <strong>学习路径引用</strong>：更新章节交叉引用以使用正确的 microsoft-foundry 路径

#### 验证
- ✅ 所有英文 Markdown 文件内部链接有效
- ✅ 研讨会模块0-7完整，含学习目标
- ✅ 章节与模块间导航功能正常
- ✅ 内容适合使用微软 AZD 的 AI 开发者
- ✅ 全文保持适合初学者的语言和结构
- ✅ CONTRIBUTING.md 对社区贡献者有明确指引

#### 技术实现
- <strong>链接验证</strong>：自动 PowerShell 脚本验证所有 .md 内部链接
- <strong>内容审核</strong>：人工审查研讨会完整性及适合初学者情况
- <strong>导航系统</strong>：应用一致的章节和模块导航模式

#### 备注
- <strong>范围</strong>：更改仅应用于英文文档
- <strong>翻译</strong>：本版本未更新翻译文件夹（稍后自动翻译将同步）
- <strong>研讨会时长</strong>：完整研讨会现在提供3-4小时的实操学习

---

### [v3.8.0] - 2025-11-19

#### 高级文档：监控、安全及多代理模式
**此版本新增了关于 Application Insights 集成、认证模式及生产部署多代理协调的全面A级课程。**

#### 新增
- **📊 Application Insights 集成课程**：位于 `docs/pre-deployment/application-insights.md`：
  - 聚焦 AZD 的自动化部署
  - Application Insights + Log Analytics 的完整 Bicep 模板
  - 具备自定义遥测的 Python 应用（1200+ 行代码）
  - AI/LLM 监控模式（微软 Foundry 模型令牌/成本追踪）
  - 6 个 Mermaid 图表（架构、分布式追踪、遥测流）
  - 3 个实操练习（告警、仪表板、AI 监控）
  - Kusto 查询示例和成本优化策略
  - 实时指标流和实时调试
  - 40-50 分钟学习时间，内含生产就绪模式

- **🔐 认证与安全模式课程**：位于 `docs/getting-started/authsecurity.md`：
  - 3 种认证模式（连接字符串、Key Vault、托管身份）
  - 完整 Bicep 基础设施模板用于安全部署
  - 集成 Azure SDK 的 Node.js 应用代码
  - 3 个完整练习（启用托管身份、用户分配身份、Key Vault 密钥轮换）
  - 安全最佳实践和 RBAC 配置
  - 故障排除指南和成本分析
  - 生产级无密码认证模式

- **🤖 多代理协调模式课程**：位于 `docs/pre-deployment/coordination-patterns.md`：
  - 5 种协调模式（顺序、并行、层级、事件驱动、共识）
  - 完整编排服务实现（Python/Flask，1500+ 行）
  - 3 个专用代理实现（研究、写作、编辑）
  - 服务总线集成用于消息排队
  - Cosmos DB 状态管理用于分布式系统
  - 6 个 Mermaid 图展示代理交互
  - 3 个高级练习（超时处理、重试逻辑、断路器）
  - 成本细分（240-565美元/月）及优化策略
  - 集成 Application Insights 用于监控

#### 增强
- <strong>预部署章节</strong>：现包含全面的监控和协调模式
- <strong>入门章节</strong>：增强了专业的认证模式
- <strong>生产就绪</strong>：覆盖安全到可观测性的完整内容
- <strong>课程大纲</strong>：更新引用第3章和第6章的新课程

#### 变更
- <strong>学习进度</strong>：更好地整合安全和监控内容贯穿全课程
- <strong>文档质量</strong>：新课程均保持95-97%的A级标准
- <strong>生产模式</strong>：面向企业部署的端到端覆盖

#### 改进
- <strong>开发者体验</strong>：从开发到生产监控有清晰路径
- <strong>安全标准</strong>：专业认证和机密管理模式
- <strong>可观测性</strong>：AZD 完整集成 Application Insights
- **AI 工作负载**：针对微软 Foundry 模型和多代理系统的专用监控

#### 验证
- ✅ 所有课程包含完整的工作代码（非代码片段）
- ✅ Mermaid 图支持视觉化学习（3个课程共19张）
- ✅ 含验证步骤的实操练习（共9个）
- ✅ 生产就绪 Bicep 模板，可通过 `azd up` 部署
- ✅ 成本分析及优化方案
- ✅ 故障排除指南及最佳实践
- ✅ 知识检测点及验证命令

#### 文档评分结果
- **docs/pre-deployment/application-insights.md**：- 全面监控指南
- **docs/getting-started/authsecurity.md**：- 专业安全模式
- **docs/pre-deployment/coordination-patterns.md**：- 高级多代理架构
- <strong>整体新内容</strong>：- 保持一致的高质量标准

#### 技术实现
- **Application Insights**：Log Analytics + 定制遥测 + 分布式追踪
- <strong>身份认证</strong>：托管身份 + Key Vault + RBAC 模式
- <strong>多代理</strong>：服务总线 + Cosmos DB + 容器应用 + 编排
- <strong>监控</strong>：实时指标 + Kusto 查询 + 告警 + 仪表板
- <strong>成本管理</strong>：采样策略、保留策略、预算控制

### [v3.7.0] - 2025-11-19

#### 文档质量提升及新增微软 Foundry 模型示例
**此版本提升了仓库中整体文档质量，并新增了包含 gpt-4.1 聊天界面的微软 Foundry 模型完整部署示例。**

#### 新增
- **🤖 微软 Foundry 模型聊天示例**：完整的 gpt-4.1 部署及工作示例，位于 `examples/azure-openai-chat/`：
  - 完整微软 Foundry 模型基础设施（gpt-4.1 模型部署）
  - 带有对话历史的 Python 命令行聊天界面
  - Key Vault 集成实现 API 密钥安全存储
  - 令牌使用跟踪和成本估算
  - 速率限制和错误处理
  - 详尽 README，部署指南需35-45分钟
  - 11 个生产就绪文件（Bicep 模板、Python 应用、配置）
- **📚 文档练习**：向配置指南中添加动手练习：
  - 练习1：多环境配置（15分钟）
  - 练习2：机密管理实践（10分钟）
  - 明确的成功标准和验证步骤
- **✅ 部署验证**：向部署指南中新增验证部分：
  - 健康检查流程
  - 成功标准检查表
  - 所有部署命令的预期输出
  - 故障快速参考

#### 增强
- **examples/README.md**：提升至A级质量（93%）：
  - 在所有相关部分加入 azure-openai-chat
  - 本地示例数量从3增至4
  - 添加到 AI 应用示例表
  - 集成到中级用户快速入门
  - 新增微软 Foundry 模板章节
  - 更新比较矩阵及技术查找内容
- <strong>文档质量</strong>：docs 文件夹整体从 B+ (87%) 改进至 A- (92%)：

  - 向关键命令示例添加了预期输出
  - 包含配置更改的验证步骤
  - 通过实用练习增强动手学习

#### 变更
- <strong>学习进阶</strong>：为中级学习者更好地整合AI示例
- <strong>文档结构</strong>：更多可操作的练习，具有明确结果
- <strong>验证流程</strong>：关键工作流中添加了明确的成功标准

#### 改进
- <strong>开发者体验</strong>：Microsoft Foundry Models 部署时间缩短至35-45分钟（复杂方案为60-90分钟）
- <strong>成本透明</strong>：Microsoft Foundry Models 示例提供明确的成本估算（50-200美元/月）
- <strong>学习路径</strong>：AI开发者通过 azure-openai-chat 获得清晰的入门点
- <strong>文档标准</strong>：统一的预期输出和验证步骤

#### 验证
- ✅ Microsoft Foundry Models 示例可使用 `azd up` 完全运行
- ✅ 所有11个实现文件语法正确
- ✅ README说明与实际部署体验一致
- ✅ 文档链接跨8个以上位置均已更新
- ✅ 示例索引准确反映4个本地示例
- ✅ 表格中无重复的外部链接
- ✅ 所有导航引用正确

#### 技术实现
- **Microsoft Foundry Models 架构**：gpt-4.1 + Key Vault + 容器应用模式
- <strong>安全性</strong>：准备好托管身份，秘密存储于Key Vault
- <strong>监控</strong>：集成Application Insights
- <strong>成本管理</strong>：令牌跟踪与使用优化
- <strong>部署</strong>：单一 `azd up` 命令完成全部设置

### [v3.6.0] - 2025-11-19

#### 主要更新：容器应用部署示例
**本版本引入了使用Azure Developer CLI (AZD) 的全面、生产准备就绪的容器应用部署示例，附带完整文档并整合进学习路径。**

#### 新增
- **🚀 容器应用示例**：`examples/container-app/` 中新增本地示例：
  - [主指南](examples/container-app/README.md)：容器化部署的完整概览、快速入门、生产和高级模式
  - [简单的Flask API](../../examples/container-app/simple-flask-api)：适合初学者的REST API，支持零扩展、健康探针、监控和故障排查
  - [微服务架构](../../examples/container-app/microservices)：生产就绪的多服务部署（API网关、产品、订单、用户、通知）、异步消息、Service Bus、Cosmos DB、Azure SQL、分布式追踪、蓝绿/金丝雀部署
- <strong>最佳实践</strong>：容器化工作负载的安全、监控、成本优化和CI/CD指导
- <strong>代码示例</strong>：完整的 `azure.yaml`、Bicep模板以及多语言服务实现（Python、Node.js、C#、Go）
- <strong>测试与故障排查</strong>：端到端测试场景、监控命令和故障排查指导

#### 变更
- **README.md**：更新以展示并链接新的容器应用示例，载于“本地示例 - 容器应用”下
- **examples/README.md**：更新以突出容器应用示例，添加比较矩阵条目，更新技术和架构引用
- <strong>课程大纲和学习指南</strong>：更新以引用新的容器应用示例和相关章节中的部署模式

#### 验证
- ✅ 所有新示例均可通过 `azd up` 部署且符合最佳实践
- ✅ 文档交叉链接和导航已更新
- ✅ 示例涵盖从初学者到高级场景，包括生产微服务

#### 备注
- <strong>范围</strong>：仅限英文文档和示例
- <strong>后续步骤</strong>：未来版本将扩展更多高级容器模式和CI/CD自动化

### [v3.5.0] - 2025-11-19

#### 产品重命名：Microsoft Foundry
**本版本全面执行产品名称从“微软Foundry”更改为“Microsoft Foundry”，并更新所有英文文档，反映微软官方重塑品牌。**

#### 变更
- **🔄 产品名称更新**：从“微软Foundry”全面改名为“Microsoft Foundry”
  - 更新 `docs/` 文件夹中所有相关英文文档引用
  - 文件夹重命名：`docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 文件重命名：`azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 共计7个文档文件中更新23处内容引用

- **📁 文件夹结构变更**：
  - `docs/ai-foundry/` 重命名为 `docs/microsoft-foundry/`
  - 所有交叉引用更新以反映新的文件夹结构
  - 所有文档中的导航链接经验证

- **📄 文件重命名**：
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 所有内部链接已更新为新文件名

#### 更新文件
- <strong>章节文档</strong>（7个文件）：
  - `docs/microsoft-foundry/ai-model-deployment.md` - 更新3处导航链接
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 更新4处产品名称引用
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 已使用Microsoft Foundry（之前已更新）
  - `docs/microsoft-foundry/production-ai-practices.md` - 更新3处引用（概览、社区反馈、文档）
  - `docs/getting-started/azd-basics.md` - 更新4处交叉引用链接
  - `docs/getting-started/first-project.md` - 更新2处章节导航链接
  - `docs/getting-started/installation.md` - 更新2处后续章节链接
  - `docs/troubleshooting/ai-troubleshooting.md` - 更新3处引用（导航、Discord社区）
  - `docs/troubleshooting/common-issues.md` - 更新1处导航链接
  - `docs/troubleshooting/debugging.md` - 更新1处导航链接

- <strong>课程结构文件</strong>（2个文件）：
  - `README.md` - 更新17处引用（课程概览、章节标题、模板部分、社区洞察）
  - `course-outline.md` - 更新14处引用（概览、学习目标、章节资源）

#### 验证
- ✅ 英文文档中无“ai-foundry”文件夹路径残留引用
- ✅ 英文文档中无“Microsoft Foundry”产品名称残留引用
- ✅ 所有导航链接在新文件夹结构下均正常工作
- ✅ 文件和文件夹重命名顺利完成
- ✅ 章节间的交叉引用已验证

#### 备注
- <strong>范围</strong>：仅适用于 `docs/` 文件夹中的英文文档
- <strong>翻译</strong>：本版本未更新翻译文件夹（`translations/`）
- <strong>研讨会</strong>：本版本未更新研讨会材料（`workshop/`）
- <strong>示例</strong>：示例文件可能仍引用旧名称（将在未来版本中修正）
- <strong>外部链接</strong>：外部URL和GitHub仓库引用保持不变

#### 贡献者迁移指南
如果您有本地分支或文档仍引用旧结构：
1. 更新文件夹引用： `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 更新文件引用： `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 替换产品名称：“Microsoft Foundry” → “Microsoft Foundry”
4. 验证所有内部文档链接仍然可用

---

### [v3.4.0] - 2025-10-24

#### 基础设施预览与验证增强
**本版本引入对Azure Developer CLI新预览功能的全面支持，并提升了研讨会用户体验。**

#### 新增
- **🧪 azd provision --preview 功能文档**：全面覆盖新基础设施预览能力
  - 命令参考及用法示例收录于速查表
  - 预置指南详细整合用例和优势
  - 预航检查集成，提升部署安全验证
  - 入门指南更新，强调安全优先部署实践
- **🚧 研讨会状态横幅**：专业HTML横幅显示研讨会开发状态
  - 渐变设计，含施工指示，确保用户清晰了解
  - 显示最后更新时间戳，提升透明度
  - 移动设备自适应设计

#### 增强
- <strong>基础设施安全</strong>：预览功能贯穿整个部署文档
- <strong>预部署验证</strong>：自动化脚本现支持基础设施预览测试
- <strong>开发者工作流程</strong>：命令序列更新，推荐使用预览功能作为最佳实践
- <strong>研讨会体验</strong>：为用户清晰设定内容开发状态期望

#### 变更
- <strong>部署最佳实践</strong>：首推预览优先工作流程
- <strong>文档流程</strong>：基础设施验证提前至学习进程早期
- <strong>研讨会表现</strong>：通过专业状态沟通明晰开发时间线

#### 改进
- <strong>安全优先策略</strong>：基础设施变更可预先验证后再部署
- <strong>团队协作</strong>：预览结果可共享以供审查和批准
- <strong>成本意识</strong>：提供预置前资源成本的更好理解
- <strong>风险缓解</strong>：通过提前验证减少部署失败

#### 技术实现
- <strong>多文档整合</strong>：预览功能分布记录在4个关键文件中
- <strong>命令模式</strong>：文档中语法和示例保持一致
- <strong>最佳实践整合</strong>：预览包含在验证工作流和脚本中
- <strong>视觉指示</strong>：新增功能明确标识提升发现率

#### 研讨会基础设施
- <strong>状态沟通</strong>：带渐变样式的专业HTML横幅
- <strong>用户体验</strong>：明确开发状态，避免混淆
- <strong>专业展现</strong>：保持仓库信誉同时设定预期
- <strong>时间线透明</strong>：2025年10月最后更新时间戳确保问责

### [v3.3.0] - 2025-09-24

#### 增强研讨会材料与互动学习体验
**本版本引入全面的研讨会材料，包含基于浏览器的交互式指南和结构化学习路径。**

#### 新增
- **🎥 互动研讨会指南**：基于浏览器的研讨会体验，支持MkDocs预览功能
- **📝 结构化研讨会说明**：包含7步引导学习路径，从发现至定制
  - 0-介绍：研讨会概览及设置
  - 1-选择AI模板：模板发现与选择流程
  - 2-验证AI模板：部署与验证步骤
  - 3-解析AI模板：理解模板架构
  - 4-配置AI模板：配置与定制
  - 5-定制AI模板：高级修改与迭代
  - 6-拆除基础设施：清理与资源管理
  - 7-总结：小结与后续步骤
- **🛠️ 研讨会工具**：使用Material主题的MkDocs配置，增强学习体验
- **🎯 实践学习路径**：3步法（发现 → 部署 → 定制）
- **📱 GitHub Codespaces整合**：无缝开发环境设置

#### 增强
- **AI研讨会实验室**：扩展为全面的2-3小时结构化学习体验
- <strong>研讨会文档</strong>：专业展现，含导航和视觉辅助
- <strong>学习进阶</strong>：从模板选择到生产部署的清晰步骤指导
- <strong>开发者体验</strong>：集成工具简化开发工作流程

#### 改进
- <strong>可访问性</strong>：基于浏览器的界面，支持搜索、复制功能和主题切换
- <strong>自主学习</strong>：灵活的研讨会结构适应不同学习速度
- <strong>实践应用</strong>：真实AI模板部署场景
- <strong>社区整合</strong>：Discord集成支持研讨会协作

#### 研讨会特性
- <strong>内置搜索</strong>：快速关键词和课程发现
- <strong>复制代码块</strong>：悬停复制所有代码示例
- <strong>主题切换</strong>：支持暗黑/明亮模式以符合不同偏好
- <strong>视觉资产</strong>：截图和图表增强理解
- <strong>帮助集成</strong>：直接访问Discord社区支持

### [v3.2.0] - 2025-09-17

#### 重大导航重构与基于章节的学习系统
**本版本引入全面的基于章节的学习体系，并增强了整个仓库的导航功能。**

#### 新增
- **📚 基于章节的学习系统**：将整个课程重构为8个渐进式学习章节
  - 第一章：基础与快速入门（⭐ - 30-45分钟）
  - 第二章：AI优先开发（⭐⭐ - 1-2小时）
  - 第三章：配置与身份验证（⭐⭐ - 45-60分钟）
  - 第四章：基础设施即代码与部署（⭐⭐⭐ - 1-1.5小时）
  - 第五章：多智能体AI解决方案（⭐⭐⭐⭐ - 2-3小时）
  - 第六章：预部署验证与规划（⭐⭐ - 1小时）
  - 第七章：故障排查与调试（⭐⭐ - 1-1.5小时）
  - 第八章：生产与企业模式（⭐⭐⭐⭐ - 2-3小时）
- **📚 全面导航系统**：所有文档保持一致的导航头部和尾部
- **🎯 进度跟踪**：课程完成清单及学习验证系统
- **🗺️ 学习路径指导**：为不同经验水平和目标设置明晰入口
- **🔗 交叉引用导航**：清楚关联章节与先决条件链接

#### 增强
- **README结构**：转为结构化学习平台，按章节组织
- <strong>文档导航</strong>：每页均含章节上下文和进度指导
- <strong>模板组织</strong>：示例和模板映射至相应学习章节

- <strong>资源整合</strong>：与相关章节连接的备忘单、常见问题解答和学习指南
- <strong>工作坊整合</strong>：映射到多个章节学习目标的动手实验

#### 变更
- <strong>学习进程</strong>：从线性文档转变为灵活的基于章节的学习
- <strong>配置位置</strong>：配置指南重新定位为第3章，以优化学习流程
- **AI内容整合**：贯穿学习过程的AI特定内容更好地整合
- <strong>生产内容</strong>：将高级模式汇总在第8章，面向企业学习者

#### 改进
- <strong>用户体验</strong>：清晰的导航面包屑和章节进度指示器
- <strong>无障碍访问</strong>：一致的导航模式，便于课程浏览
- <strong>专业呈现</strong>：适合学术及企业培训的大学风格课程结构
- <strong>学习效率</strong>：通过改进的组织方式减少查找相关内容时间

#### 技术实现
- <strong>导航头部</strong>：跨40多个文档文件统一章节导航
- <strong>页脚导航</strong>：统一的进度引导和章节完成指示器
- <strong>交叉链接</strong>：全面的内部链接系统，连接相关概念
- <strong>章节映射</strong>：模板和示例与学习目标清晰关联

#### 学习指南增强
- **📚 综合学习目标**：重构学习指南以符合8章节体系
- **🎯 基于章节的评估**：每章包含具体学习目标和实践练习
- **📋 进度跟踪**：每周学习计划，具备可衡量成果和完成清单
- **❓ 评估问题**：每章知识验证题，具备专业成果导向
- **🛠️ 实践练习**：涵盖真实部署场景和故障排除的动手活动
- **📊 技能提升**：从基础概念到企业模式的清晰进阶，聚焦职业发展
- **🎓 认证框架**：专业发展成果与社区认可体系
- **⏱️ 时间管理**：结构化的10周学习计划及里程碑验证

### [v3.1.0] - 2025-09-17

#### 多智能体AI解决方案增强
**本版本改进了多智能体零售解决方案，更好的智能体命名和增强的文档。**

#### 变更
- <strong>多智能体术语</strong>：将零售多智能体解决方案中的“Cora agent”替换为“Customer agent”以便更清晰理解
- <strong>智能体架构</strong>：更新所有文档、ARM模板和代码示例，统一使用“Customer agent”命名
- <strong>配置示例</strong>：现代化智能体配置模式，采用更新的命名规范
- <strong>文档一致性</strong>：确保所有引用均使用专业、描述性的智能体名称

#### 增强
- **ARM模板包**：更新零售多智能体ARM模板，包含Customer agent引用
- <strong>架构图</strong>：刷新Mermaid图表，采用更新的智能体命名
- <strong>代码示例</strong>：Python类和实现示例采用CustomerAgent命名
- <strong>环境变量</strong>：更新所有部署脚本，采用CUSTOMER_AGENT_NAME命名规范

#### 改进
- <strong>开发者体验</strong>：文档中智能体角色和职责描述更清晰
- <strong>生产准备</strong>：更好地符合企业命名规范
- <strong>学习材料</strong>：教育用途的智能体命名更直观
- <strong>模板可用性</strong>：简化智能体功能和部署模式的理解

#### 技术细节
- 更新Mermaid架构图，加入CustomerAgent引用
- 在Python示例中将CoraAgent类名替换为CustomerAgent
- 修改ARM模板JSON配置，使用“customer”智能体类型
- 更新环境变量，从CORA_AGENT_<em>模式改为CUSTOMER_AGENT_</em>模式
- 刷新所有部署命令和容器配置

### [v3.0.0] - 2025-09-12

#### 重大变更 - AI开发者聚焦及Microsoft Foundry集成
**此版本将仓库转变为针对AI的综合学习资源，包含Microsoft Foundry集成。**

#### 新增
- **🤖 AI优先学习路径**：完全重构，优先支持AI开发者和工程师
- **Microsoft Foundry集成指南**：全面文档指导如何将AZD连接到Microsoft Foundry服务
- **AI模型部署模式**：详细指南涵盖模型选择、配置及生产部署策略
- **AI工作坊实验**：2-3小时的动手实践，辅导将AI应用转换为AZD可部署方案
- **生产AI最佳实践**：企业级模式，涵盖扩展、监控和安全
- **AI特定故障排除指南**：涵盖Microsoft Foundry模型、认知服务及AI部署问题
- **AI模板库**：精选Microsoft Foundry模板，包含复杂度评级
- <strong>工作坊资料</strong>：完整的工作坊结构，包含动手实验和参考材料

#### 增强
- **README结构**：专注AI开发者，参考Microsoft Foundry Discord中45%社区兴趣数据
- <strong>学习路径</strong>：专设AI开发者路线，伴随传统面向学生和DevOps工程师路径
- <strong>模板推荐</strong>：精选AI模板，包括azure-search-openai-demo、contoso-chat、openai-chat-app-quickstart
- <strong>社区整合</strong>：扩展Discord社区支持，增加AI专属频道与讨论

#### 安全和生产重点
- <strong>托管身份模式</strong>：AI特定的身份验证和安全配置
- <strong>成本优化</strong>：AI工作负载的令牌使用跟踪和预算控制
- <strong>多区域部署</strong>：全球AI应用部署策略
- <strong>性能监控</strong>：AI特定指标与Application Insights集成

#### 文档质量
- <strong>线性课程结构</strong>：从入门到高级AI部署模式的逻辑推进
- **验证URL**：所有外部仓库链接均已验证且可访问
- <strong>完整参考</strong>：所有内部文档链接均已验证且可用
- <strong>生产就绪</strong>：企业部署模式，含实际案例

### [v2.0.0] - 2025-09-09

#### 重大变更 - 仓库重组和专业提升
**该版本对仓库结构和内容呈现进行了重大改造。**

#### 新增
- <strong>结构化学习框架</strong>：所有文档页新增介绍、学习目标及学习成果部分
- <strong>导航系统</strong>：在所有文档中添加上一课/下一课链接，实现引导式学习进程
- <strong>学习指南</strong>：包含学习目标、练习和评估材料的综合study-guide.md
- <strong>专业呈现</strong>：移除所有emoji图标，提升无障碍性和专业外观
- <strong>内容结构增强</strong>：改进学习材料的组织和流程

#### 变更
- <strong>文档格式</strong>：所有文档统一为一致的以学习为中心的结构
- <strong>导航流程</strong>：实现所有学习材料的逻辑顺序
- <strong>内容呈现</strong>：移除装饰元素，采用清晰专业格式
- <strong>链接结构</strong>：更新内部所有链接以支持新导航系统

#### 改进
- <strong>无障碍访问</strong>：移除emoji依赖，改善屏幕阅读器兼容性
- <strong>专业外观</strong>：干净、学术风格呈现，适合企业学习
- <strong>学习体验</strong>：结构化方法，每节课有明确目标和成果
- <strong>内容组织</strong>：相关主题逻辑流畅，连接紧密

### [v1.0.0] - 2025-09-09

#### 初次发布 - 全面AZD学习仓库

#### 新增
- <strong>核心文档结构</strong>
  - 完整的入门指南系列
  - 全面的部署及供应文档
  - 详细的故障排除资源和调试指南
  - 部署前验证工具和流程

- <strong>入门模块</strong>
  - AZD基础：核心概念及术语
  - 安装指南：平台专用设置说明
  - 配置指南：环境搭建和身份验证
  - 第一个项目教程：分步骤动手学习

- <strong>部署和供应模块</strong>
  - 部署指南：完整工作流程文档
  - 供应指南：使用Bicep的基础设施即代码
  - 生产部署最佳实践
  - 多服务架构模式

- <strong>部署前验证模块</strong>
  - 容量规划：Azure资源可用性验证
  - SKU选择：全面服务层级指导
  - 预检：自动化验证脚本（PowerShell和Bash）
  - 成本估算及预算规划工具

- <strong>故障排除模块</strong>
  - 常见问题：频发问题及解决方案
  - 调试指南：系统化故障排除方法
  - 高级诊断技巧及工具
  - 性能监控及优化

- <strong>资源与参考</strong>
  - 命令备忘单：必要命令快捷参考
  - 术语表：全面术语和缩写定义
  - 常见问题解答：详细问题与解答
  - 外部资源链接及社区连接

- <strong>示例与模板</strong>
  - 简单的Web应用示例
  - 静态网站部署模板
  - 容器应用配置
  - 数据库集成模式
  - 微服务架构示例
  - 无服务器函数实现

#### 特性
- <strong>多平台支持</strong>：Windows、macOS和Linux的安装与配置指南
- <strong>多技能级别</strong>：内容面向学生至专业开发者
- <strong>实用导向</strong>：动手示例和真实场景
- <strong>全面覆盖</strong>：从基础概念到高级企业模式
- <strong>安全优先</strong>：贯穿的安全最佳实践
- <strong>成本优化</strong>：成本效益部署及资源管理指导

#### 文档质量
- <strong>详细代码示例</strong>：实用且经过测试的代码样例
- <strong>逐步指导</strong>：清晰且可操作的步骤
- <strong>全面错误处理</strong>：常见问题故障排除
- <strong>最佳实践整合</strong>：行业标准与推荐
- <strong>版本兼容性</strong>：与最新Azure服务及azd功能同步

## 计划中的未来增强

### 版本 3.1.0（计划中）
#### AI平台扩展
- <strong>多模型支持</strong>：整合Hugging Face、Azure机器学习及自定义模型的模式
- **AI智能体框架**：LangChain、Semantic Kernel和AutoGen部署模板
- **高级RAG模式**：Azure AI搜索之外的向量数据库选项（Pinecone、Weaviate等）
- **AI可观察性**：模型性能、令牌使用和响应质量的增强监控

#### 开发者体验
- **VS Code扩展**：集成AZD + Microsoft Foundry开发体验
- **GitHub Copilot集成**：AI辅助生成AZD模板
- <strong>交互教程</strong>：带自动验证的AI场景动手编码练习
- <strong>视频内容</strong>：面向视觉学习者的AI部署补充视频教程

### 版本 4.0.0（计划中）
#### 企业AI模式
- <strong>治理框架</strong>：AI模型治理、合规和审计追踪
- **多租户AI**：为多客户提供隔离AI服务的模式
- **边缘AI部署**：与Azure IoT Edge和容器实例的集成
- **混合云AI**：AI工作负载的多云和混合部署模式

#### 高级功能
- **AI流水线自动化**：与Azure机器学习流水线的MLOps集成
- <strong>高级安全</strong>：零信任模式、私有端点和高级威胁防护
- <strong>性能优化</strong>：高吞吐量AI应用的高级调优和扩展策略
- <strong>全球分发</strong>：AI应用的内容交付和边缘缓存模式

### 版本 3.0.0（计划中） - 被当前发布版本取代
#### 提议新增 - 已在v3.0.0中实现
- ✅ **AI聚焦内容**：全面的Microsoft Foundry集成（已完成）
- ✅ <strong>交互式教程</strong>：动手AI工作坊实验（已完成）
- ✅ <strong>高级安全模块</strong>：AI特定安全模式（已完成）
- ✅ <strong>性能优化</strong>：AI工作负载调优策略（已完成）

### 版本 2.1.0（计划中） - 部分已在v3.0.0实现
#### 小幅增强 - 当前版本中部分实现
- ✅ <strong>额外示例</strong>：AI聚焦的部署场景（已完成）
- ✅ **扩展FAQ**：AI特定问答及故障排除（已完成）
- <strong>工具集成</strong>：增强IDE和编辑器集成指南
- ✅ <strong>监控扩展</strong>：AI特定监控及告警模式（已完成）

#### 仍计划未来发布
- <strong>移动友好文档</strong>：响应式设计支持移动学习
- <strong>离线访问</strong>：可下载文档包
- **增强IDE集成**：为AZD + AI工作流的VS Code扩展
- <strong>社区仪表盘</strong>：实时社区指标和贡献跟踪

## 贡献更新日志

### 报告变更
贡献本仓库时，请确保更新日志条目包含：

1. <strong>版本号</strong>：遵循语义化版本（主版本.次版本.修订号）
2. <strong>日期</strong>：发布或更新日期，格式为YYYY-MM-DD
3. <strong>类别</strong>：新增、变更、废弃、移除、修复、安全
4. <strong>清晰描述</strong>：简明说明变更内容
5. <strong>影响评估</strong>：变更对现有用户的影响

### 变更类别

#### 新增
- 新功能、文档部分或能力
- 新示例、模板或学习资源
- 附加工具、脚本或实用程序

#### 变更
- 现有功能或文档的修改
- 改进清晰度或准确性
- 内容或组织结构重组

#### 废弃
- 正在逐步淘汰的功能或方法
- 计划移除的文档部分
- 有更好替代方案的方法

#### 移除
- 不再相关的功能、文档或示例
- 过时信息或废弃方案
- 冗余或合并的内容

#### 修复
- 文档或代码错误的更正
- 已报告问题或缺陷的解决
- 准确性或功能性的改进


#### 安全
- 与安全相关的改进或修复
- 安全最佳实践的更新
- 安全漏洞的修复

### 语义版本指南

#### 主版本 (X.0.0)
- 需要用户操作的重大变更
- 内容或组织的重大重构
- 改变基本方法或方法论的变更

#### 次版本 (X.Y.0)
- 新功能或内容增加
- 保持向后兼容的增强
- 附加示例、工具或资源

#### 补丁版本 (X.Y.Z)
- 错误修复和纠正
- 现有内容的小幅改进
- 澄清和小的增强

## 社区反馈和建议

我们积极鼓励社区反馈以改进此学习资源：

### 如何提供反馈
- **GitHub Issues**：报告问题或提出改进建议（欢迎AI相关问题）
- **Discord 讨论**：分享想法并参与 Microsoft Foundry 社区交流
- **Pull Requests**：直接贡献内容改进，尤其是AI模板和指南
- **Microsoft Foundry Discord**：参与 #Azure 频道，讨论 AZD + AI 话题
- <strong>社区论坛</strong>：参与更广泛的 Azure 开发者讨论

### 反馈类别
- **AI 内容准确性**：纠正AI服务集成和部署信息
- <strong>学习体验</strong>：改进AI开发者学习流程的建议
- **缺失的AI内容**：请求增加AI模板、模式或示例
- <strong>无障碍性</strong>：满足多样化学习需求的改进
- **AI工具集成**：改善AI开发工作流程集成的建议
- **生产AI模式**：企业AI部署模式请求

### 响应承诺
- <strong>问题响应</strong>：报告问题后48小时内回应
- <strong>功能请求</strong>：一周内评估
- <strong>社区贡献</strong>：一周内审查
- <strong>安全问题</strong>：优先处理并快速响应

## 维护计划

### 定期更新
- <strong>月度审查</strong>：内容准确性和链接验证
- <strong>季度更新</strong>：重大内容新增和改进
- <strong>半年审查</strong>：全面重构和增强
- <strong>年度发布</strong>：重大版本更新和显著改进

### 监控和质量保障
- <strong>自动化测试</strong>：定期验证代码示例和链接
- <strong>社区反馈整合</strong>：定期采纳用户建议
- <strong>技术更新</strong>：与最新 Azure 服务和 azd 版本保持一致
- <strong>无障碍审查</strong>：定期检查包容性设计原则

## 版本支持政策

### 当前版本支持
- <strong>最新主版本</strong>：全力支持并定期更新
- <strong>先前主版本</strong>：12个月的安全更新和关键修复
- <strong>旧版本</strong>：仅社区支持，无官方更新

### 迁移指导
当发布主版本时，我们提供：
- <strong>迁移指南</strong>：逐步过渡说明
- <strong>兼容性说明</strong>：关于破坏性变更的详细信息
- <strong>工具支持</strong>：协助迁移的脚本或工具
- <strong>社区支持</strong>：专门的迁移问题论坛

---

<strong>导航</strong>
- <strong>上一课</strong>：[学习指南](resources/study-guide.md)
- <strong>下一课</strong>：返回到 [主 README](README.md)

<strong>保持更新</strong>：关注此仓库，获取有关新版本和学习材料重要更新的通知。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
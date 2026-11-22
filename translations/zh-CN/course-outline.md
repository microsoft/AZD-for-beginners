# AZD 初学者指南：课程大纲与学习框架

## 课程概览

通过结构化章节掌握 Azure Developer CLI (azd)，课程设计为渐进式学习。**特别关注通过 Microsoft Foundry 集成实现 AI 应用部署。**

### 本课程为何对现代开发者至关重要

部署 AI 工作负载的开发者通常需要指导，包括：
- 复杂的多服务 AI 架构
- 生产环境中 AI 部署的最佳实践  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- AI 特定部署问题的故障排除

### 核心学习目标

完成本结构化课程后，您将能够：
- **掌握 AZD 基础知识**：核心概念、安装与配置
- **部署 AI 应用**：使用 AZD 和 Microsoft Foundry 服务
- <strong>实现基础设施即代码</strong>：使用 Bicep 模板管理 Azure 资源
- <strong>排查部署问题</strong>：解决常见问题与调试故障
- <strong>优化生产环境</strong>：安全、扩展、监控和成本管理
- <strong>构建多智能体解决方案</strong>：部署复杂的 AI 架构

## 🎓 工作坊学习体验

### 灵活的学习交付选项
本课程设计支持<strong>自定进度个人学习</strong>和<strong>指导式工作坊课程</strong>，使学习者能够通过互动练习亲自动手实践 AZD 并发展实用技能。

#### 🚀 自定进度学习模式
<strong>适合个人开发者和持续学习</strong>

**特色功能：**
- <strong>基于浏览器的界面</strong>：通过任何浏览器访问基于 MkDocs 的完整工作坊
- **GitHub Codespaces 集成**：一键开发环境，预配置工具齐全
- **交互式 DevContainer 环境**：无需本地设置，立即开始编码
- <strong>进度跟踪</strong>：内置检查点和验证练习
- <strong>社区支持</strong>：访问 Azure Discord 频道以提问和协作

**学习结构：**
- <strong>灵活时间安排</strong>：可按天或周自由完成章节
- <strong>检查点系统</strong>：在进入复杂主题前进行学习验证
- <strong>资源库</strong>：全面文档、示例和故障排除指南
- <strong>作品集开发</strong>：构建可部署项目用于专业作品集

**快速开始（自定进度）：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 指导式工作坊课程
**适合企业培训、训练营和教育机构**

**工作坊形式选项：**

**📚 学术课程整合（8-12 周）**
- <strong>大学课程</strong>：学期课程，每周两小时
- <strong>训练营形式</strong>：密集 3-5 天课程，每天 6-8 小时
- <strong>企业培训</strong>：每月团队课程，包含实际项目实施
- <strong>评估体系</strong>：评分作业、同行评审和最终项目

**🚀 密集工作坊（1-3 天）**
- **第 1 天**：基础 + AI 开发（第 1-2 章）- 6 小时
- **第 2 天**：配置 + 基础设施（第 3-4 章）- 6 小时  
- **第 3 天**：高级模式 + 生产（第 5-8 章）- 8 小时
- <strong>后续辅导</strong>：可选 2 周的项目完成指导

**⚡ 高管简报（4-6 小时）**
- <strong>战略概览</strong>：AZD 价值主张及业务影响（1 小时）
- <strong>动手演示</strong>：端到端部署 AI 应用（2 小时）
- <strong>架构评审</strong>：企业模式与治理（1 小时）
- <strong>实施规划</strong>：组织采纳策略（1-2 小时）

#### 🛠️ 工作坊学习方法论
**发现 → 部署 → 定制，推动动手技能发展**

**阶段 1：发现（45 分钟）**
- <strong>模板探索</strong>：评估 Microsoft Foundry 模板和服务
- <strong>架构分析</strong>：理解多智能体模式与部署策略
- <strong>需求评估</strong>：识别组织需求与限制
- <strong>环境设置</strong>：配置开发环境与 Azure 资源

**阶段 2：部署（2 小时）**
- <strong>引导实施</strong>：逐步部署 AI 应用，使用 AZD
- <strong>服务配置</strong>：配置 Azure AI 服务、端点和身份验证
- <strong>安全实施</strong>：应用企业安全模式和访问控制
- <strong>验证测试</strong>：核实部署并故障排除常见问题

**阶段 3：定制（45 分钟）**
- <strong>应用修改</strong>：根据具体用例和需求调整模板
- <strong>生产优化</strong>：实现监控、成本管理及扩展策略
- <strong>高级模式</strong>：探索多智能体协调与复杂架构
- <strong>后续规划</strong>：制定持续技能发展的学习路径

#### 🎯 工作坊学习成果
<strong>通过实操练习获得可衡量的技能</strong>

**技术能力：**
- **部署生产 AI 应用**：成功部署与配置 AI 驱动解决方案
- <strong>基础设施即代码掌握</strong>：创建和管理自定义 Bicep 模板
- <strong>多智能体架构</strong>：实施协调 AI 智能体解决方案
- <strong>生产准备</strong>：应用安全、监控和治理模式
- <strong>故障排除专长</strong>：独立解决部署与配置问题

**专业技能：**
- <strong>项目领导力</strong>：领导技术团队执行云部署计划
- <strong>架构设计</strong>：设计可扩展且成本效益高的 Azure 方案
- <strong>知识传递</strong>：培训和指导同事掌握 AZD 最佳实践
- <strong>战略规划</strong>：影响组织的云采纳策略

#### 📋 工作坊资源与材料
<strong>为指导者和学习者提供全面工具包</strong>

**为指导者准备：**
- <strong>讲师指南</strong>：[工作坊概览](workshop/README.md) - 课程策划与交付指导
- <strong>演示材料</strong>：幻灯片、架构图和演示脚本
- <strong>评估工具</strong>：实践练习、知识检查及评价标准
- <strong>技术配置</strong>：环境设置、故障排除指南和备份方案

**为学习者准备：**
- <strong>互动工作坊环境</strong>：[工作坊材料](workshop/README.md) - 基于浏览器的学习平台
- <strong>逐步指导</strong>：[引导练习](../../workshop/docs/instructions) - 详细的实现步骤  
- <strong>参考文档</strong>：[AI 工作坊实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 聚焦 AI 的深度内容
- <strong>社区资源</strong>：Azure Discord 频道、GitHub 讨论区及专家支持

#### 🏢 企业工作坊实施
<strong>组织部署与培训策略</strong>

**企业培训计划：**
- <strong>开发者入职</strong>：新员工 AZD 基础培训（2-4 周）
- <strong>团队技能提升</strong>：现有开发团队季度工作坊（1-2 天）
- <strong>架构评审</strong>：面向高级工程师与架构师的月度课程（4 小时）
- <strong>领导简报</strong>：面向技术决策者的高管工作坊（半天）

**实施支持：**
- <strong>定制工作坊设计</strong>：针对特定组织需求量身定制内容
- <strong>试点项目管理</strong>：结构化推广，包含成功指标及反馈机制  
- <strong>持续辅导</strong>：工作坊后项目实施支持
- <strong>社区建设</strong>：内部 Azure AI 开发者社区与知识共享

**成功指标：**
- <strong>技能获取</strong>：前后评估衡量技术能力提升
- <strong>部署成功率</strong>：成功部署生产应用的参与者比例
- <strong>生产力周期</strong>：缩短新 Azure AI 项目的入职时间
- <strong>知识保持率</strong>：工作坊后 3-6 个月的跟进评估

## 8 章学习结构

### 第 1 章：基础与快速入门（30-45 分钟）🌱
<strong>先决条件</strong>：Azure 订阅，基础命令行知识  
<strong>复杂度</strong>：⭐

#### 学习内容
- 了解 Azure Developer CLI 基础
- 在您的平台上安装 AZD  
- 您的首次成功部署
- 核心概念与术语

#### 学习资源
- [AZD 基础](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安装与配置](docs/chapter-01-foundation/installation.md) - 平台特定指南
- [您的第一个项目](docs/chapter-01-foundation/first-project.md) - 动手教程
- [命令速查表](resources/cheat-sheet.md) - 快速参考

#### 实践成果
使用 AZD 成功将简单的 Web 应用部署到 Azure

---

### 第 2 章：AI 优先开发（含工作坊，4-5 小时）🤖
<strong>先决条件</strong>：完成第 1 章  
<strong>复杂度</strong>：⭐⭐

#### 学习内容
- Microsoft Foundry 与 AZD 集成
- GA `microsoft.foundry` 包安装及托管智能体代码部署
- 本地智能体检测器测试及独立评估数据集/标准
- 部署 AI 驱动的应用
- 了解 AI 服务配置
- RAG（检索增强生成）模式

#### 学习资源
- [Microsoft Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [托管代理演练 (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - 初始化、查看 `azure.yaml`、配置、本地测试、部署、评估和清理
- [AI 代理指南](docs/chapter-02-ai-development/agents.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 研讨会实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>新</strong>：全面的 2-3 小时动手实验
- [互动研讨会指南](workshop/README.md) - <strong>新</strong>：基于浏览器的研讨会，带 MkDocs 预览
- [Microsoft Foundry 模板](README.md#featured-microsoft-foundry-templates)
- [研讨会说明](../../workshop/docs/instructions) - <strong>新</strong>：逐步指导练习

#### 实践成果
使用 GA 包在本地和 Foundry 测试托管代理，查看评估结果，并区分新项目和重用项目的清理。独立的 RAG/研讨会路径涵盖配置 AI 驱动的聊天应用。

#### 研讨会学习路径（可选增强）
<strong>新互动体验</strong>：[完整研讨会指南](workshop/README.md)
1. <strong>发现</strong>（30 分钟）：模板选择和评估
2. <strong>部署</strong>（45 分钟）：部署并验证 AI 模板功能  
3. <strong>拆解</strong>（30 分钟）：了解模板架构和组件
4. <strong>配置</strong>（30 分钟）：自定义设置和参数
5. <strong>定制</strong>（45 分钟）：修改和迭代，打造专属
6. <strong>拆除</strong>（15 分钟）：清理资源并理解生命周期
7. <strong>总结</strong>（15 分钟）：后续步骤和高级学习路径

---

### 第3章：配置与认证（45-60 分钟）⚙️
<strong>先决条件</strong>：完成第1章  
<strong>复杂度</strong>：⭐⭐

#### 你将学到
- 环境配置和管理
- 认证和安全最佳实践
- 资源命名和组织
- 多环境部署

#### 学习资源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 环境搭建
- [认证与安全模式](docs/chapter-03-configuration/authsecurity.md) - 托管身份和密钥库集成
- 多环境示例

#### 实践成果
使用正确的认证和安全措施管理多个环境

---

### 第4章：基础设施即代码与部署（1-1.5 小时）🏗️
<strong>先决条件</strong>：完成第1-3章  
<strong>复杂度</strong>：⭐⭐⭐

#### 你将学到
- 高级部署模式
- 使用 Bicep 的基础设施即代码
- 资源配置策略
- 自定义模板创建

- 使用 Azure Container Apps 和 AZD 进行容器化应用部署

#### 学习资源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流程
- [资源配置](docs/chapter-04-infrastructure/provisioning.md) - 资源管理
- 容器和微服务示例
- [容器应用示例](examples/container-app/README.md) - 快速起步、生产和高级部署模式

#### 实践成果
使用自定义基础设施模板部署复杂的多服务应用

---

### 第5章：多代理 AI 解决方案（2-3 小时）🤖🤖
<strong>先决条件</strong>：完成第1-2章  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 你将学到
- 多代理架构模式
- 代理编排与协调
- 生产就绪的 AI 部署
- 客户和库存代理实现

- 将容器化微服务集成到基于代理的解决方案中

#### 学习资源
- [零售多代理解决方案](examples/retail-scenario.md) - 架构蓝图，不是完整应用
- [ARM 模板包](../../examples/retail-multiagent-arm-template) - 基础设施脚手架与实现先决条件
- 多代理协调模式
- [微服务架构示例](../../examples/container-app/microservices) - 服务间通信、异步消息和生产部署

#### 实践成果
设计一个多代理 AI 解决方案，识别除基础设施配置外的应用实现、验证和运营工作

---

### 第6章：部署前验证和规划（1 小时）🔍
<strong>先决条件</strong>：完成第4章  
<strong>复杂度</strong>：⭐⭐

#### 你将学到
- 容量规划和资源验证
- SKU 选择策略
- 预检和自动化
- 成本优化规划

#### 学习资源
- [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) - 资源验证
- [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) - 具成本效益的选择
- [飞行前检查](docs/chapter-06-pre-deployment/preflight-checks.md) - 自动化脚本
- [应用洞察集成](docs/chapter-06-pre-deployment/application-insights.md) - 监控与可观测性
- [多代理协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理编排策略

#### 实际成果
在执行前验证和优化部署

---

### 第7章：故障排查与调试（1-1.5小时）🔧
<strong>先决条件</strong>：完成任一部署章节  
<strong>复杂度</strong>：⭐⭐

#### 您将学习
- 系统化调试方法
- 常见问题及解决方案
- AI 特定故障排查
- 性能优化

#### 学习资源
- [常见问题](docs/chapter-07-troubleshooting/common-issues.md) - 常见问答和解决方案
- [调试指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- [AI 特定故障排查](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实际成果
独立诊断和解决常见部署问题

---

### 第8章：生产与企业模式（2-3小时）🏢
<strong>先决条件</strong>：完成第1-4章  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 您将学习
- 生产部署策略
- 企业安全模式
- 监控与成本优化
- 可扩展性与治理

- 生产容器应用部署最佳实践（安全、监控、成本、CI/CD）

#### 学习资源
- [生产AI最佳实践](docs/chapter-08-production/production-ai-practices.md) - 企业模式
- 微服务和企业案例
- 监控与治理框架
- [微服务架构示例](../../examples/container-app/microservices) - 蓝绿/金丝雀部署、分布式追踪及成本优化

#### 实际成果
部署具备完整生产能力的企业级应用

---

## 学习进阶与复杂度

### 渐进式技能培养

- **🌱 初学者**：从第1章（基础）→ 第2章（AI开发）开始
- **🔧 中级**：第3-4章（配置与基础设施）→ 第6章（验证）
- **🚀 高级**：第5章（多代理解决方案）→ 第7章（故障排查）
- **🏢 企业级**：完成所有章节，着重第8章（生产模式）

- <strong>容器应用路径</strong>：第4章（容器化部署）、第5章（微服务集成）、第8章（生产最佳实践）

### 复杂度指标

- **⭐ 基础**：单一概念，指导式教程，30-60分钟
- **⭐⭐ 中级**：多概念，实践操作，1-2小时  
- **⭐⭐⭐ 高级**：复杂架构，自定义方案，1-3小时
- **⭐⭐⭐⭐ 专家**：生产系统，企业模式，2-4小时

### 灵活学习路径

#### 🎯 AI 开发者快速通道（4-6小时）
1. **第1章**：基础与快速入门（45分钟）
2. **第2章**：AI优先开发（2小时）  
3. **第5章**：多代理AI解决方案（3小时）
4. **第8章**：生产AI最佳实践（1小时）

#### 🛠️ 基础设施专家路径（5-7小时）
1. **第1章**：基础与快速入门（45分钟）
2. **第3章**：配置与身份验证（1小时）
3. **第4章**：基础设施即代码与部署（1.5小时）
4. **第6章**：部署前验证与规划（1小时）
5. **第7章**：故障排查与调试（1.5小时）
6. **第8章**：生产与企业模式（2小时）

#### 🎓 完整学习旅程（8-12小时）
按顺序完成所有8章，结合实践操作与验证

## 课程完成框架

### 知识验证
- <strong>章节检查点</strong>：具有可量化成果的实践练习
- <strong>动手验证</strong>：为每章部署可运行解决方案
- <strong>进度跟踪</strong>：视觉化指示器与完成徽章
- <strong>社区验证</strong>：在 Azure Discord 频道分享经验

### 学习成果评估

#### 第1-2章完成（基础 + AI）
- ✅ 使用 AZD 部署基础 Web 应用
- ✅ 使用 RAG 部署 AI 驱动聊天应用
- ✅ 了解 AZD 核心概念及 AI 集成

#### 第3-4章完成（配置 + 基础设施）  
- ✅ 管理多环境部署
- ✅ 创建自定义 Bicep 基础设施模板
- ✅ 实施安全的身份验证模式

#### 第5-6章完成（多代理 + 验证）
- ✅ 部署复杂多代理 AI 解决方案
- ✅ 执行容量规划与成本优化
- ✅ 实现自动化部署前验证

#### 第7-8章完成（故障排查 + 生产）
- ✅ 独立调试和解决部署问题  
- ✅ 实施企业级监控与安全
- ✅ 部署具治理能力的生产就绪应用

### 认证与认可
- <strong>课程完成徽章</strong>：完成所有8章并通过实践验证
- <strong>社区认可</strong>：积极参与 Microsoft Foundry Discord
- <strong>专业发展</strong>：行业相关 AZD 与 AI 部署技能
- <strong>职业提升</strong>：企业级云部署能力

## 🎓 综合学习成果

### 基础级别（第1-2章）
完成基础章节后，学习者将展示：

**技术能力：**
- 使用 AZD 命令部署简单 Web 应用
- 配置并部署带有 RAG 功能的 AI 驱动聊天应用
- 理解 AZD 核心概念：模板、环境、配置流程
- 将 Microsoft Foundry 服务与 AZD 部署集成
- 熟悉 Azure AI 服务配置及 API 端点

**专业技能：**
- 遵循结构化的部署流程以获得一致结果
- 使用日志和文档解决基础部署问题
- 有效沟通云部署流程
- 应用安全 AI 服务集成的最佳实践

**学习验证：**
- ✅ 成功部署 `todo-nodejs-mongo` 模板
- ✅ 部署并配置带 RAG 的 `azure-search-openai-demo`
- ✅ 完成互动研讨会练习（发现阶段）
- ✅ 参与 Azure Discord 社区讨论

### 中级级别（第3-4章）
完成中级章节后，学习者将展示：

**技术能力：**
- 管理多环境部署（开发、测试、生产）
- 创建基础设施即代码的自定义 Bicep 模板
- 实施带托管身份的安全身份验证模式
- 部署复杂多服务应用，包含自定义配置
- 优化资源配置策略以提升成本和性能

**专业技能：**
- 设计可扩展基础设施架构
- 实施云部署的安全最佳实践
- 编写基础设施模式文档促团队协作
- 评估并选择适合需求的 Azure 服务

**学习验证：**
- ✅ 配置独立环境及特定设置
- ✅ 创建部署多服务应用的自定义 Bicep 模板
- ✅ 实施托管身份验证以确保安全访问
- ✅ 完成真实场景的配置管理练习

### 高级级别（第5-6章）
完成高级章节后，学习者将展示：

**技术能力：**
- 部署并编排具有协调工作流的多代理 AI 解决方案
- 实施零售场景中的客户和库存代理架构
- 执行全面的容量规划和资源验证
- 执行自动部署前验证与优化
- 根据工作负载需求设计成本效益的 SKU 选择

**专业技能：**
- 架构面向生产环境的复杂 AI 解决方案
- 主导 AI 部署策略的技术讨论
- 指导初级开发者使用 AZD 和 AI 部署最佳实践
- 评估并推荐业务需求的 AI 架构模式

**学习验证：**
- ✅ 审查零售多代理蓝图，区分已配置基础设施与缺失应用实现
- ✅ 展示代理协调与工作流编排
- ✅ 完成具实际资源限制的容量规划练习
- ✅ 通过自动飞行前检查验证部署准备

### 专家级别（第7-8章）
完成专家章节后，学习者将展示：

**技术能力：**
- 独立诊断与解决复杂部署问题
- 实施企业级安全模式与治理框架
- 设计全面监控与告警策略
- 优化生产部署以提高规模、成本和性能
- 建立具妥善测试和验证的 CI/CD 流水线

**专业技能：**
- 领导企业云转型项目
- 设计并实施组织部署标准
- 培训和指导团队采用高级 AZD 实践
- 影响企业 AI 部署的技术决策

**学习验证：**
- ✅ 解决复杂多服务部署失败
- ✅ 实施符合合规要求的企业安全模式
- ✅ 设计部署带应用洞察的生产监控
- ✅ 完成企业治理框架的实施

## 🎯 课程完成认证

### 进度跟踪框架
通过结构化检查点跟踪学习进展：

- [ ] **第1章**：基础与快速入门 ✅
- [ ] **第2章**：AI优先开发 ✅  
- [ ] **第3章**：配置与身份验证 ✅
- [ ] **第4章**：基础设施即代码与部署 ✅
- [ ] **第5章**：多代理 AI 解决方案 ✅
- [ ] **第6章**：部署前验证与规划 ✅
- [ ] **第7章**：故障排查与调试 ✅
- [ ] **第8章**：生产与企业模式 ✅

### 验证流程
完成每章后，通过以下方式验证知识：

1. <strong>实践练习完成</strong>：为每章部署运行中的解决方案
2. <strong>知识评估</strong>：查看常见问题并完成自我评估
3. <strong>社区参与</strong>：在 Azure Discord 分享经验和获得反馈
4. <strong>作品集开发</strong>：记录部署过程和经验教训
5. <strong>同行评审</strong>：与其他学习者合作解决复杂场景

### 课程完成收益
完成所有章节并通过验证后，毕业生将拥有：

**技术专长：**
- <strong>生产经验</strong>：将真实 AI 应用部署至 Azure 环境
- <strong>专业技能</strong>：具备企业级部署与故障排查能力  
- <strong>架构知识</strong>：多代理 AI 解决方案与复杂基础设施模式
- <strong>故障排查精通</strong>：独立解决部署与配置问题

**专业发展：**
- <strong>行业认可</strong>：AZD 与 AI 部署高需求领域的验证技能
- <strong>职业晋升</strong>：云架构师和 AI 部署专员资格
- <strong>社区领导力</strong>：Azure 开发者及 AI 社区活跃成员
- <strong>持续学习</strong>：微软 Foundry 高级专项基础

**作品集资产：**
- <strong>已部署解决方案</strong>：可运行的 AI 应用与基础设施模式示例
- <strong>文档</strong>：全面的部署指南与故障排查流程  
- <strong>社区贡献</strong>：在 Azure 社区分享的讨论、示例与改进
- <strong>专业网络</strong>：与 Azure 专家及 AI 部署实践者的联系

### 课程后学习路径
毕业生已准备好深入专项学习：
- **Microsoft Foundry 专家**：深入 AI 模型部署和编排
- <strong>云架构领导</strong>：企业级部署设计与治理
- <strong>开发者社区领导</strong>：贡献 Azure 示例和社区资源
- <strong>企业培训</strong>：在组织内部教授 AZD 与 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
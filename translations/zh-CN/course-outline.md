# AZD 初学者课程大纲与学习框架

## 课程概览

通过结构化章节逐步掌握 Azure Developer CLI (azd)。**特别聚焦于通过 Microsoft Foundry 集成实现 AI 应用部署。**

### 本课程对现代开发者的重要性

部署 AI 工作负载的开发者通常需要指导：
- 复杂的多服务 AI 架构
- AI 生产部署规范  
- Azure AI 服务集成与配置
- AI 工作负载的成本优化
- 解决 AI 特定部署问题的故障排查

### 核心学习目标

完成本课程，您将能够：
- **精通 AZD 基础**：核心概念、安装与配置
- **部署 AI 应用**：结合 Microsoft Foundry 服务使用 AZD
- <strong>实施基础设施即代码</strong>：使用 Bicep 模板管理 Azure 资源
- <strong>故障排查部署</strong>：解决常见问题并调试
- <strong>生产优化</strong>：安全、伸缩、监控和成本管理
- <strong>构建多智能体解决方案</strong>：部署复杂 AI 架构

## 🎓 研讨会学习体验

### 灵活的学习方式
本课程支持 <strong>自定进度的个人学习</strong> 和 <strong>引导式研讨会</strong>，让学习者通过互动练习，亲手实践并获得实用技能。

#### 🚀 自定进度学习模式
<strong>非常适合个人开发者和持续学习</strong>

**特点：**
- <strong>基于浏览器的界面</strong>：通过 MkDocs 驱动的研讨会，任何浏览器均可访问
- **GitHub Codespaces 集成**：一键启动预配置开发环境
- **互动 DevContainer 环境**：无须本地安装，立即开始编码
- <strong>进度跟踪</strong>：内置检查点和验证练习
- <strong>社区支持</strong>：访问 Azure Discord 频道提问与协作

**学习结构：**
- <strong>时间灵活</strong>：可在几天或几周内按个人节奏完成章节
- <strong>检查点系统</strong>：学习确认后再进阶复杂主题
- <strong>资源库</strong>：全面文档、示例和故障排查指南
- <strong>作品集发展</strong>：构建可部署项目作为职业作品集

**开始学习（自定进度）：**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ 引导式研讨会
**适合企业培训、训练营和教育机构**

**研讨会形式选项：**

**📚 学术课程整合（8-12 周）**
- <strong>大学课程</strong>：学期制，每周 2 小时课程
- <strong>训练营模式</strong>：3-5 天密集课程，每日 6-8 小时
- <strong>企业培训</strong>：每月团队一次，结合实战项目
- <strong>评估体系</strong>：评分作业、同行评审与最终项目

**🚀 集中研讨会（1-3 天）**
- **第 1 天**：基础 + AI 开发（章节 1-2）- 6 小时
- **第 2 天**：配置 + 基础设施（章节 3-4）- 6 小时  
- **第 3 天**：高级模式 + 生产（章节 5-8）- 8 小时
- <strong>后续</strong>：可选两周项目辅导

**⚡ 高管简报（4-6 小时）**
- <strong>战略概览</strong>：AZD 价值主张与业务影响（1 小时）
- <strong>实操演示</strong>：端到端部署 AI 应用（2 小时）
- <strong>架构评审</strong>：企业模式与治理（1 小时）
- <strong>实施规划</strong>：组织采纳策略（1-2 小时）

#### 🛠️ 研讨会学习方法论
**发现 → 部署 → 定制的实操技能开发路径**

**阶段 1：发现（45 分钟）**
- <strong>模板探索</strong>：评估 Microsoft Foundry 模板和服务
- <strong>架构分析</strong>：理解多智能体模式和部署策略
- <strong>需求评估</strong>：识别组织需求和限制
- <strong>环境配置</strong>：配置开发环境和 Azure 资源

**阶段 2：部署（2 小时）**
- <strong>引导实施</strong>：逐步使用 AZD 部署 AI 应用
- <strong>服务配置</strong>：配置 Azure AI 服务、终端和认证
- <strong>安全实施</strong>：应用企业安全模式和访问控制
- <strong>验证测试</strong>：确认部署有效，排查常见问题

**阶段 3：定制（45 分钟）**
- <strong>应用修改</strong>：根据特定用例调整模板
- <strong>生产优化</strong>：实现监控、成本管理与伸缩策略
- <strong>高级模式</strong>：探索多智能体协调和复杂架构
- <strong>后续计划</strong>：定义持续技能发展的学习路径

#### 🎯 研讨会学习成果
<strong>通过实践培养可衡量技能</strong>

**技术能力：**
- **部署生产级 AI 应用**：成功部署和配置 AI 驱动解决方案
- <strong>基础设施即代码精通</strong>：创建和管理自定义 Bicep 模板
- <strong>多智能体架构</strong>：实现协同 AI 代理方案
- <strong>生产就绪</strong>：应用安全、监控和治理模式
- <strong>故障排查专长</strong>：独立解决部署和配置问题

**职业技能：**
- <strong>项目领导力</strong>：领导技术团队云部署项目
- <strong>架构设计</strong>：设计可扩展且成本效益高的 Azure 解决方案
- <strong>知识传递</strong>：培训和指导同事掌握 AZD 最佳实践
- <strong>战略规划</strong>：影响组织云采用战略

#### 📋 研讨会资源与材料
<strong>为引导者和学习者准备的全面工具包</strong>

**引导者资源：**
- <strong>讲师指南</strong>：[研讨会概览](workshop/README.md) - 课程规划与辅导指导
- <strong>演示材料</strong>：幻灯片、架构图和演示脚本
- <strong>评估工具</strong>：实践练习、知识测验和评分标准
- <strong>技术配置</strong>：环境搭建、故障排查指南及备份方案

**学习者资源：**
- <strong>互动研讨会环境</strong>：[研讨会材料](workshop/README.md) - 基于浏览器的学习平台
- <strong>逐步指导</strong>：[引导练习](../../workshop/docs/instructions) - 详细实现步骤  
- <strong>参考文档</strong>：[AI 研讨会实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - 面向 AI 的深度挖掘
- <strong>社区资源</strong>：Azure Discord 频道、GitHub 讨论和专家支持

#### 🏢 企业研讨会实施
<strong>组织部署与培训策略</strong>

**企业培训项目：**
- <strong>开发者入职</strong>：新员工 AZD 基础培训（2-4 周）
- <strong>团队技能提升</strong>：现有开发团队季度研讨会（1-2 天）
- <strong>架构评审</strong>：为高级工程师和架构师举办每月会议（4 小时）
- <strong>领导简报</strong>：面向技术决策者的高管研讨会（半天）

**实施支持：**
- <strong>定制化研讨会设计</strong>：针对特定组织需求定制内容
- <strong>试点项目管理</strong>：结构化推广，含成功指标和反馈机制  
- <strong>持续辅导</strong>：研讨会后支持项目实施
- <strong>社区建设</strong>：内部 Azure AI 开发者社区及知识分享

**成功指标：**
- <strong>技能获取</strong>：前后评估技术能力增长
- <strong>部署成功率</strong>：成功部署生产应用的参与者比例
- <strong>生产效率时间</strong>：新 Azure AI 项目入职时间缩短
- <strong>知识保持率</strong>：研讨会后 3-6 月的后续评估

## 8 章学习结构

### 第 1 章：基础与快速入门（30-45 分钟）🌱
<strong>先决条件</strong>：Azure 订阅，基础命令行知识  
<strong>难度</strong>：⭐

#### 学习内容
- 了解 Azure Developer CLI 基础
- 安装 AZD 到您的平台  
- 完成首次成功部署
- 核心概念与术语

#### 学习资源
- [AZD 基础](docs/chapter-01-foundation/azd-basics.md) - 核心概念
- [安装与设置](docs/chapter-01-foundation/installation.md) - 平台特定指南
- [第一个项目](docs/chapter-01-foundation/first-project.md) - 实操教程
- [命令速查表](resources/cheat-sheet.md) - 快捷参考

#### 实际成果
使用 AZD 成功部署一个简单的 Web 应用到 Azure

---

### 第 2 章：AI 优先开发（1-2 小时）🤖
<strong>先决条件</strong>：完成第 1 章  
<strong>难度</strong>：⭐⭐

#### 学习内容
- Microsoft Foundry 与 AZD 集成
- 部署 AI 驱动应用
- 理解 AI 服务配置
- RAG（检索增强生成）模式

#### 学习资源
- [Microsoft Foundry 集成](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI 模型部署](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI 研讨会实验室](docs/chapter-02-ai-development/ai-workshop-lab.md) - <strong>新增</strong>：全面的 2-3 小时实操实验
- [互动研讨会指南](workshop/README.md) - <strong>新增</strong>：基于 Browser 的 MkDocs 预览研讨会
- [Microsoft Foundry 模板](README.md#featured-microsoft-foundry-templates)
- [研讨会操作说明](../../workshop/docs/instructions) - <strong>新增</strong>：逐步引导练习

#### 实际成果
部署并配置一个具备 RAG 功能的 AI 聊天应用

#### 研讨会学习路径（可选强化）
<strong>新增互动体验</strong>：[完整研讨会指南](workshop/README.md)
1. <strong>发现</strong>（30 分钟）：选择并评估模板
2. <strong>部署</strong>（45 分钟）：部署并验证 AI 模板功能  
3. <strong>解构</strong>（30 分钟）：理解模板架构与组件
4. <strong>配置</strong>（30 分钟）：定制设置与参数
5. <strong>定制</strong>（45 分钟）：修改并迭代，打造专属模版
6. <strong>清理</strong>（15 分钟）：清理资源并理解生命周期
7. <strong>总结</strong>（15 分钟）：后续步骤与高级学习路径

---

### 第 3 章：配置与身份验证（45-60 分钟）⚙️
<strong>先决条件</strong>：完成第 1 章  
<strong>难度</strong>：⭐⭐

#### 学习内容
- 环境配置与管理
- 身份验证与安全最佳实践
- 资源命名与组织
- 多环境部署

#### 学习资源
- [配置指南](docs/chapter-03-configuration/configuration.md) - 环境搭建
- [身份验证与安全模式](docs/chapter-03-configuration/authsecurity.md) - 托管身份与 Key Vault 集成
- 多环境示例

#### 实际成果
具备管理多环境的身份验证及安全能力

---

### 第 4 章：基础设施即代码与部署（1-1.5 小时）🏗️
<strong>先决条件</strong>：完成第 1-3 章  
<strong>难度</strong>：⭐⭐⭐

#### 学习内容
- 高级部署模式
- 使用 Bicep 进行基础设施即代码
- 资源供应策略
- 自定义模板创建

- 使用 Azure Container Apps 和 AZD 部署容器化应用

#### 学习资源
- [部署指南](docs/chapter-04-infrastructure/deployment-guide.md) - 完整工作流
- [资源供应](docs/chapter-04-infrastructure/provisioning.md) - 资源管理
- 容器与微服务示例
- [容器应用示例](examples/container-app/README.md) - 快速入门、生产与高级部署模式

#### 实际成果
使用自定义基础设施模板部署复杂多服务应用

---

### 第 5 章：多智能体 AI 解决方案（2-3 小时）🤖🤖
<strong>先决条件</strong>：完成第 1-2 章  
<strong>难度</strong>：⭐⭐⭐⭐

#### 学习内容
- 多智能体架构模式
- 代理编排与协调
- 生产级 AI 部署
- 客户与库存代理实现

- 将容器化微服务集成进代理方案

#### 学习资源
- [零售多智能体解决方案](examples/retail-scenario.md) - 架构蓝图，不是完整应用
- [ARM 模板包](../../examples/retail-multiagent-arm-template) - 基础设施框架及实施需求
- 多智能体协调模式
- [微服务架构示例](../../examples/container-app/microservices) - 服务间通信、异步消息与生产部署

#### 实际成果
设计多智能体 AI 解决方案，识别除基础设施外应用实现、验证及运维工作

---

### 第 6 章：部署前验证与规划（1 小时）🔍
<strong>先决条件</strong>：完成第 4 章  
<strong>难度</strong>：⭐⭐

#### 学习内容
- 容量规划与资源验证
- SKU 选择策略
- 预检与自动化
- 成本优化规划

#### 学习资源
- [容量规划](docs/chapter-06-pre-deployment/capacity-planning.md) - 资源验证
- [SKU 选择](docs/chapter-06-pre-deployment/sku-selection.md) - 成本效益选择
- [预检](docs/chapter-06-pre-deployment/preflight-checks.md) - 自动化脚本
- [Application Insights 集成](docs/chapter-06-pre-deployment/application-insights.md) - 监控与可观察性
- [多智能体协调模式](docs/chapter-06-pre-deployment/coordination-patterns.md) - 代理编排策略

#### 实际成果
在部署前完成验证与优化

---

### 第 7 章：故障排查与调试（1-1.5 小时）🔧
<strong>先决条件</strong>：完成任何部署章节  
<strong>复杂度</strong>：⭐⭐

#### 您将学习内容
- 系统化的调试方法
- 常见问题及解决方案
- AI 特定的故障排除
- 性能优化

#### 学习资源
- [常见问题](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 及解决方案
- [调试指南](docs/chapter-07-troubleshooting/debugging.md) - 逐步策略
- [AI 特定故障排除](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 服务问题

#### 实践成果
独立诊断和解决常见部署问题

---

### 第8章：生产与企业模式（2-3小时）🏢
<strong>先决条件</strong>：完成第1-4章  
<strong>复杂度</strong>：⭐⭐⭐⭐

#### 您将学习内容
- 生产部署策略
- 企业安全模式
- 监控与成本优化
- 可扩展性和治理

- 容器化应用生产部署最佳实践（安全、监控、成本、CI/CD）

#### 学习资源
- [生产级 AI 最佳实践](docs/chapter-08-production/production-ai-practices.md) - 企业模式
- 微服务与企业案例
- 监控与治理框架
- [微服务架构示例](../../examples/container-app/microservices) - 蓝绿/金丝雀部署、分布式追踪与成本优化

#### 实践成果
部署具有完整生产能力的企业级应用

---

## 学习进阶与复杂度

### 逐步技能构建

- **🌱 初学者**：从第1章（基础）→第2章（AI 开发）
- **🔧 中级**：第3-4章（配置与基础设施）→第6章（验证）
- **🚀 高级**：第5章（多代理解决方案）→第7章（故障排除）
- **🏢 企业**：完成所有章节，重点第8章（生产模式）

- <strong>容器应用路径</strong>：第4章（容器化部署）、第5章（微服务集成）、第8章（生产最佳实践）

### 复杂度指标

- **⭐ 基础**：单一概念，指导教程，30-60分钟
- **⭐⭐ 中级**：多概念，动手实践，1-2小时  
- **⭐⭐⭐ 高级**：复杂架构，自定义解决方案，1-3小时
- **⭐⭐⭐⭐ 专家**：生产系统，企业模式，2-4小时

### 灵活学习路径

#### 🎯 AI开发者快速通道（4-6小时）
1. **第1章**：基础与快速入门（45分钟）
2. **第2章**：AI优先开发（2小时）  
3. **第5章**：多代理AI解决方案（3小时）
4. **第8章**：生产级AI最佳实践（1小时）

#### 🛠️ 基础设施专家路径（5-7小时）
1. **第1章**：基础与快速入门（45分钟）
2. **第3章**：配置与认证（1小时）
3. **第4章**：基础设施即代码与部署（1.5小时）
4. **第6章**：预部署验证与规划（1小时）
5. **第7章**：故障排除与调试（1.5小时）
6. **第8章**：生产与企业模式（2小时）

#### 🎓 完整学习旅程（8-12小时）
按顺序完成所有8章，结合动手实践与验证

## 课程完成框架

### 知识验证
- <strong>章节检查点</strong>：具有可衡量结果的实践练习
- <strong>动手验证</strong>：为每章部署可用解决方案
- <strong>进度跟踪</strong>：视觉指标与完成徽章
- <strong>社区验证</strong>：在 Azure Discord 频道分享经验

### 学习成果评估

#### 第1-2章完成（基础 + AI）
- ✅ 使用 AZD 部署基础 Web 应用
- ✅ 使用 RAG 部署 AI 驱动的聊天应用
- ✅ 理解 AZD 核心概念及 AI 集成

#### 第3-4章完成（配置 + 基础设施）  
- ✅ 管理多环境部署
- ✅ 创建自定义 Bicep 基础设施模板
- ✅ 实施安全认证模式

#### 第5-6章完成（多代理 + 验证）
- ✅ 部署复杂多代理 AI 解决方案
- ✅ 进行容量规划与成本优化
- ✅ 实施自动化预部署验证

#### 第7-8章完成（故障排除 + 生产）
- ✅ 独立调试并解决部署问题  
- ✅ 实施企业级监控与安全
- ✅ 部署具治理能力的生产准备应用

### 认证与认可
- <strong>课程完成徽章</strong>：完成所有8章及实践验证
- <strong>社区认可</strong>：积极参与 Microsoft Foundry Discord
- <strong>职业发展</strong>：行业相关的 AZD 与 AI 部署技能
- <strong>职业晋升</strong>：企业级云部署能力

## 🎓 综合学习成果

### 基础级（第1-2章）
完成基础章节后，学习者将展示：

**技术能力：**
- 使用 AZD 命令部署简单的 Azure Web 应用
- 配置并部署带 RAG 功能的 AI 聊天应用
- 理解 AZD 核心概念：模板、环境、配置流程
- 将 Microsoft Foundry 服务与 AZD 部署集成
- 导航 Azure AI 服务配置及 API 端点

**专业技能：**
- 遵循结构化部署流程以确保一致性
- 使用日志和文档排查基础部署问题
- 有效沟通云部署流程
- 应用安全 AI 服务集成最佳实践

**学习验证：**
- ✅ 成功部署 `todo-nodejs-mongo` 模板
- ✅ 部署并配置带 RAG 的 `azure-search-openai-demo`
- ✅ 完成互动式工作坊练习（发现阶段）
- ✅ 参与 Azure Discord 社区讨论

### 中级（第3-4章）
完成中级章节后，学习者将展示：

**技术能力：**
- 管理多环境部署（开发、测试、生产）
- 创建自定义 Bicep 模板实现基础设施即代码
- 实施托管身份的安全认证模式
- 部署具有自定义配置的复杂多服务应用
- 优化资源配置策略以降低成本和提升性能

**专业技能：**
- 设计可扩展的基础设施架构
- 实施云部署安全最佳实践
- 为团队协作记录基础设施模式
- 评估并选择符合需求的 Azure 服务

**学习验证：**
- ✅ 配置独立环境及环境特定设置
- ✅ 创建并部署多服务应用自定义 Bicep 模板
- ✅ 实施托管身份认证保障安全访问
- ✅ 完成真实场景的配置管理练习

### 高级（第5-6章）
完成高级章节后，学习者将展示：

**技术能力：**
- 部署和协调多代理 AI 解决方案中的协同工作流
- 实施零售场景的客户与库存代理架构
- 进行全面的容量规划和资源验证
- 执行自动化的预部署验证与优化
- 根据工作负载需求设计经济高效的 SKU 选择

**专业技能：**
- 构建面向生产环境的复杂 AI 解决方案架构
- 主导 AI 部署策略的技术讨论
- 指导初级开发者掌握 AZD 与 AI 部署最佳实践
- 评估并推荐符合业务需求的 AI 架构模式

**学习验证：**
- ✅ 复核零售多代理蓝图，区分已配置基础设施与缺失的应用实现
- ✅ 展示代理协调与工作流编排能力
- ✅ 完成包括真实资源限制的容量规划练习
- ✅ 通过自动化预检验证部署准备度

### 专家级（第7-8章）
完成专家级章节后，学习者将展示：

**技术能力：**
- 独立诊断并解决复杂部署问题
- 实施企业级安全模式和治理框架
- 设计全面的监控与告警策略
- 优化生产部署的规模、成本与性能
- 建立具有测试与验证的 CI/CD 管道

**专业技能：**
- 主导企业云转型项目
- 设计并实施组织部署标准
- 培训并指导开发团队掌握高级 AZD 实践
- 影响企业 AI 部署技术决策

**学习验证：**
- ✅ 解决复杂多服务部署失败问题
- ✅ 实施符合合规要求的企业安全模式
- ✅ 设计并部署使用 Application Insights 的生产监控
- ✅ 完成企业治理框架实现

## 🎯 课程完成认证

### 进度跟踪框架
通过结构化检查点跟踪学习进度：

- [ ] **第1章**：基础与快速入门 ✅
- [ ] **第2章**：AI优先开发 ✅  
- [ ] **第3章**：配置与认证 ✅
- [ ] **第4章**：基础设施即代码与部署 ✅
- [ ] **第5章**：多代理 AI 解决方案 ✅
- [ ] **第6章**：预部署验证与规划 ✅
- [ ] **第7章**：故障排除与调试 ✅
- [ ] **第8章**：生产与企业模式 ✅

### 验证流程
完成每章后，通过以下方式验证知识：

1. <strong>实践练习完成</strong>：部署各章节的可用解决方案
2. <strong>知识评估</strong>：审阅 FAQ 并完成自我评测
3. <strong>社区参与</strong>：在 Azure Discord 分享经验并获取反馈
4. <strong>作品集开发</strong>：记录部署及经验教训
5. <strong>同行评审</strong>：与其他学习者协作解决复杂场景

### 课程完成收益
完成所有章节及验证后，毕业生将具备：

**技术专长：**
- <strong>生产经验</strong>：在 Azure 环境中成功部署真实 AI 应用
- <strong>专业技能</strong>：企业级部署与故障排除能力  
- <strong>架构知识</strong>：多代理 AI 解决方案及复杂基础设施模式
- <strong>故障排除精通</strong>：独立解决部署与配置问题

**职业发展：**
- <strong>行业认可</strong>：在高需求 AZD 与 AI 部署领域具备可验证技能
- <strong>职业晋升</strong>：具备云架构师及 AI 部署专家资格
- <strong>社区领导</strong>：活跃于 Azure 开发者及 AI 社区
- <strong>持续学习</strong>：为高级 Microsoft Foundry 专精奠定基础

**作品集资产：**
- <strong>已部署解决方案</strong>：AI 应用及基础设施模式的有效示例
- <strong>文档资料</strong>：完整部署指南及故障排除流程  
- <strong>社区贡献</strong>：与 Azure 社区共享讨论、示例与改进
- <strong>专业网络</strong>：与 Azure 专家及 AI 部署实践者建立联系

### 课程后学习路径
毕业生可进一步专攻：
- **Microsoft Foundry 专家**：深度专精 AI 模型部署与编排
- <strong>云架构领导</strong>：企业级部署设计与治理
- <strong>开发者社区领导</strong>：贡献 Azure 示例及社区资源
- <strong>企业培训</strong>：组织内部教授 AZD 和 AI 部署技能

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
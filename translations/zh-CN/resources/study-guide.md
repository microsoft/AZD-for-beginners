# 学习指南 - 综合学习目标

<strong>学习路径导航</strong>
- **📚 课程首页**: [AZD 初学者指南](../README.md)
- **📖 开始学习**: [第1章：基础与快速入门](../README.md#-chapter-1-foundation--quick-start)
- **🎯 进度跟踪**: [课程完成](../README.md#-course-completion--certification)

## 介绍

本综合学习指南提供结构化的学习目标、关键概念、实践练习和评估材料，帮助你掌握 Azure Developer CLI (azd)。使用本指南跟踪你的进度，确保已覆盖所有必备主题。

## 学习目标

完成本学习指南后，你将：
- 掌握 Azure Developer CLI 的所有基础和高级概念
- 培养在部署和管理 Azure 应用方面的实用技能
- 提高在故障排除和优化部署方面的信心
- 了解生产就绪的部署实践和安全注意事项

## 学习成果

完成本学习指南的所有章节后，你将能够：
- 使用 azd 设计、部署并管理完整的应用架构
- 实施全面的监控、安全和成本优化策略
- 独立排查复杂的部署问题
- 创建自定义模板并为 azd 社区做出贡献

## 八章学习结构

### 第1章：基础与快速入门（第1周）
<strong>时长</strong>: 30-45 分钟 | <strong>难度</strong>: ⭐

#### 学习目标
- 理解 Azure Developer CLI 的核心概念和术语
- 在开发平台上成功安装并配置 AZD
- 使用现有模板部署你的第一个应用
- 有效地浏览 AZD 命令行界面

#### 需掌握的关键概念
- AZD 项目结构和组件 (azure.yaml, infra/, src/)
- 基于模板的部署工作流
- 环境配置基础
- 资源组和订阅管理

#### 实践练习
1. <strong>安装验证</strong>: 安装 AZD 并使用 `azd version` 验证
2. <strong>首次部署</strong>: 成功部署 todo-nodejs-mongo 模板
3. <strong>环境设置</strong>: 配置你的第一个环境变量
4. <strong>资源探索</strong>: 在 Azure 门户中浏览已部署的资源

#### 评估问题
- AZD 项目的核心组件有哪些？
- 如何从模板初始化新项目？
- `azd up` 和 `azd deploy` 有什么区别？
- 如何使用 AZD 管理多个环境？

---

### 第2章：AI 优先开发（第2周）
<strong>时长</strong>: 1-2 小时 | <strong>难度</strong>: ⭐⭐

#### 学习目标
- 将 Microsoft Foundry 服务与 AZD 工作流集成
- 部署并配置 AI 驱动的应用
- 理解 RAG（检索增强生成）实现模式
- 管理 AI 模型的部署和扩展

#### 需掌握的关键概念
- Microsoft Foundry Models 服务集成与 API 管理
- AI 搜索配置与向量索引
- 模型部署策略与容量规划
- AI 应用监控与性能优化

#### 实践练习
1. **AI 聊天部署**: 部署 azure-search-openai-demo 模板
2. **RAG 实现**: 配置文档索引和检索
3. <strong>模型配置</strong>: 为不同用途设置多个 AI 模型
4. **AI 监控**: 为 AI 工作负载实现 Application Insights

#### 评估问题
- 如何在 AZD 模板中配置 Microsoft Foundry Models 服务？
- RAG 架构的关键组件有哪些？
- 如何管理 AI 模型的容量与扩展？
- 哪些监控指标对 AI 应用很重要？

---

### 第3章：配置与身份验证（第3周）
<strong>时长</strong>: 45-60 分钟 | <strong>难度</strong>: ⭐⭐

#### 学习目标
- 掌握环境配置与管理策略
- 实现安全的认证模式和托管身份
- 使用合适的命名约定组织资源
- 配置多环境部署（dev、staging、prod）

#### 需掌握的关键概念
- 环境层级与配置优先级
- 托管身份与服务主体认证
- 使用 Key Vault 进行机密管理的集成
- 环境特定参数管理

#### 实践练习
1. <strong>多环境设置</strong>: 配置 dev、staging 和 prod 环境
2. <strong>安全配置</strong>: 实现托管身份认证
3. <strong>机密管理</strong>: 将 Azure Key Vault 集成以存储敏感数据
4. <strong>参数管理</strong>: 创建环境特定配置

#### 评估问题
- 如何使用 AZD 配置不同的环境？
- 使用托管身份相比服务主体有哪些好处？
- 如何安全地管理应用的机密？
- AZD 中的配置层级是什么？

---

### 第4章：基础设施即代码与部署（第4-5周）
<strong>时长</strong>: 1-1.5 小时 | <strong>难度</strong>: ⭐⭐⭐

#### 学习目标
- 创建并自定义 Bicep 基础设施模板
- 实现高级部署模式和工作流
- 理解资源配置策略
- 设计可扩展的多服务架构
- 使用 Azure Container Apps 和 AZD 部署容器化应用

#### 需掌握的关键概念
- Bicep 模板结构与最佳实践
- 资源依赖关系与部署顺序
- 参数文件与模板模块化
- 自定义钩子与部署自动化
- 容器应用部署模式（快速入门、生产、微服务）

#### 实践练习
1. <strong>自定义模板创建</strong>: 构建一个多服务应用模板
2. **Bicep 精通**: 创建模块化、可重用的基础设施组件
3. <strong>部署自动化</strong>: 实现部署前/后钩子
4. <strong>架构设计</strong>: 部署复杂的微服务架构
5. <strong>容器应用部署</strong>: 使用 AZD 部署 [简单 Flask API](../../../examples/container-app/simple-flask-api) 和 [微服务架构](../../../examples/container-app/microservices) 示例

#### 评估问题
- 如何为 AZD 创建自定义 Bicep 模板？
- 组织基础设施代码的最佳实践有哪些？
- 如何在模板中处理资源依赖？
- 哪些部署模式支持零停机更新？

---

### 第5章：多代理 AI 解决方案（第6-7周）
<strong>时长</strong>: 2-3 小时 | <strong>难度</strong>: ⭐⭐⭐⭐

#### 学习目标
- 设计并实现多代理 AI 架构
- 协调代理间的协作与通信
- 部署具备监控的生产就绪 AI 解决方案
- 理解代理专长化与工作流模式
- 将容器化微服务作为多代理解决方案的一部分进行集成

#### 需掌握的关键概念
- 多代理架构模式与设计原则
- 代理通信协议与数据流
- AI 代理的负载均衡与扩展策略
- 多代理系统的生产监控
- 容器化环境中的服务间通信

#### 实践练习
1. <strong>零售解决方案部署</strong>: 部署完整的多代理零售场景
2. <strong>代理自定义</strong>: 修改 Customer 和 Inventory 代理的行为
3. <strong>架构扩展</strong>: 实现负载均衡和自动扩展
4. <strong>生产监控</strong>: 设置全面的监控与告警
5. <strong>微服务集成</strong>: 将 [微服务架构](../../../examples/container-app/microservices) 示例扩展以支持基于代理的工作流

#### 评估问题
- 如何设计高效的多代理通信模式？
- 扩展 AI 代理工作负载时的关键考虑因素有哪些？
- 如何监控和调试多代理 AI 系统？
- 哪些生产模式可以确保 AI 代理的可靠性？

---

### 第6章：预部署验证与规划（第8周）
<strong>时长</strong>: 1 小时 | <strong>难度</strong>: ⭐⭐

#### 学习目标
- 执行全面的容量规划和资源验证
- 选择具有成本效益的最佳 Azure SKU
- 实现自动化的预检和验证
- 使用成本优化策略规划部署

#### 需掌握的关键概念
- Azure 资源配额与容量限制
- SKU 选择标准与成本优化
- 自动化验证脚本与测试
- 部署规划与风险评估

#### 实践练习
1. <strong>容量分析</strong>: 分析你应用的资源需求
2. **SKU 优化**: 比较并选择具有成本效益的服务等级
3. <strong>验证自动化</strong>: 实现预部署检查脚本
4. <strong>成本规划</strong>: 创建部署成本估算和预算

#### 评估问题
- 如何在部署前验证 Azure 容量？
- 哪些因素会影响 SKU 选择决策？
- 如何自动化预部署验证？
- 哪些策略有助于优化部署成本？

---

### 第7章：故障排除与调试（第9周）
<strong>时长</strong>: 1-1.5 小时 | <strong>难度</strong>: ⭐⭐

#### 学习目标
- 为 AZD 部署制定系统化的调试方法
- 解决常见的部署和配置问题
- 调试 AI 特定的问题和性能问题
- 实施监控和告警以实现主动问题检测

#### 需掌握的关键概念
- 诊断技术与日志策略
- 常见故障模式及其解决方案
- 性能监控与优化
- 事故响应与恢复程序

#### 实践练习
1. <strong>诊断技能</strong>: 使用故意损坏的部署进行练习
2. <strong>日志分析</strong>: 有效地使用 Azure Monitor 和 Application Insights
3. <strong>性能调优</strong>: 优化性能缓慢的应用
4. <strong>恢复程序</strong>: 实现备份与灾难恢复

#### 评估问题
- 最常见的 AZD 部署失败有哪些？
- 如何调试认证和权限问题？
- 哪些监控策略有助于防止生产问题？
- 如何在 Azure 中优化应用性能？

---

### 第8章：生产与企业模式（第10-11周）
<strong>时长</strong>: 2-3 小时 | <strong>难度</strong>: ⭐⭐⭐⭐

#### 学习目标
- 实施企业级部署策略
- 设计安全模式与合规框架
- 建立监控、治理与成本管理
- 创建与 AZD 集成的可扩展 CI/CD 流水线
- 在生产容器应用部署中应用最佳实践（安全、监控、成本、CI/CD）

#### 需掌握的关键概念
- 企业安全与合规要求
- 治理框架与策略实施
- 高级监控与成本管理
- CI/CD 集成与自动化部署流水线
- 容器化工作负载的蓝绿和金丝雀部署策略

#### 实践练习
1. <strong>企业安全</strong>: 实施全面的安全模式
2. <strong>治理框架</strong>: 设置 Azure Policy 和资源管理
3. <strong>高级监控</strong>: 创建仪表板和自动告警
4. **CI/CD 集成**: 构建自动化部署流水线
5. <strong>生产容器应用</strong>: 将安全、监控和成本优化应用到 [微服务架构](../../../examples/container-app/microservices) 示例中

#### 评估问题
- 如何在 AZD 部署中实施企业级安全？
- 哪些治理模式可以确保合规性和成本控制？
- 如何为生产系统设计可扩展的监控？
- 哪些 CI/CD 模式最适合与 AZD 工作流配合？

#### 学习目标
- 理解 Azure Developer CLI 的基础与核心概念
- 在你的开发环境中成功安装并配置 azd
- 使用现有模板完成你的首次部署
- 浏览 azd 项目结构并理解关键组件

#### 需掌握的关键概念
- 模板、环境与服务
- azure.yaml 配置结构
- 基本的 azd 命令（init、up、down、deploy）
- 基础设施即代码原理
- Azure 认证与授权

#### 练习任务

**练习 1.1：安装与设置**
```bash
# 完成以下任务：
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**练习 1.2：首次部署**
```bash
# 部署一个简单的 Web 应用程序：
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**练习 1.3：项目结构分析**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### 自我评估问题
1. azd 架构的三个核心概念是什么？
2. azure.yaml 文件的用途是什么？
3. 环境如何帮助管理不同的部署目标？
4. azd 可以使用哪些认证方法？
5. 首次运行 `azd up` 会发生什么？

---

## 进度跟踪与评估框架
```bash
# 创建和配置多个环境：
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**练习 2.2：高级配置**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**练习 2.3：安全配置**
```bash
# 实施安全最佳实践：
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我评估问题
1. azd 如何处理环境变量的优先级？
2. 什么是部署钩子，以及何时应该使用它们？
3. 如何为不同环境配置不同的 SKU？
4. 不同认证方法有哪些安全影响？
5. 如何管理密钥和敏感配置数据？

### 模块3：部署与配置（第4周）

#### 学习目标
- 掌握部署工作流和最佳实践
- 理解使用 Bicep 模板的基础设施即代码
- 实现复杂的多服务架构
- 优化部署性能与可靠性

#### 需掌握的关键概念
- Bicep 模板结构与模块
- 资源依赖与顺序
- 部署策略（蓝绿、滚动更新）
- 多区域部署
- 数据库迁移与数据管理

#### 练习任务

**练习 3.1：自定义基础设施**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**练习 3.2：多服务应用**
```bash
# 部署微服务架构：
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**练习 3.3：数据库集成**
```bash
# 实现数据库部署模式：
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我评估问题
1. 使用 Bicep 相比 ARM 模板有哪些优势？
2. 如何在 azd 部署中处理数据库迁移？
3. 有哪些策略可以实现零停机部署？
4. 如何管理服务之间的依赖？
5. 多区域部署需要考虑哪些因素？

### 模块4：预部署验证（第5周）

#### 学习目标
- 实施全面的预部署检查
- 精通容量规划和资源验证
- 理解 SKU 选择与成本优化
- 构建自动化验证管道

#### 需要掌握的关键概念
- Azure 资源配额和限制
- SKU 选择标准及成本影响
- 自动化验证脚本和工具
- 容量规划方法论
- 性能测试与优化

#### 练习题

**Exercise 4.1: Capacity Planning**
```bash
# 实现容量验证：
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# 构建全面的验证管道：
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# 优化服务配置：
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自我评估问题
1. 哪些因素应影响 SKU 选择决策？
2. 在部署前如何验证 Azure 资源的可用性？
3. 预检系统的关键组件有哪些？
4. 如何估算并控制部署成本？
5. 对容量规划来说哪些监控是必需的？

### 模块 5：故障排除与调试（第6周）

#### 学习目标
- 掌握系统化的故障排除方法论
- 培养调试复杂部署问题的专业技能
- 实施全面的监控和告警
- 建立事件响应与恢复流程

#### 需要掌握的关键概念
- 常见的部署失败模式
- 日志分析与关联技术
- 性能监控与优化
- 安全事件检测与响应
- 灾难恢复与业务连续性

#### 练习题

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# 练习解决常见问题：
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# 设置全面的监控：
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# 制定事件响应程序：
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我评估问题
1. 对 azd 部署，系统化的故障排除方法是什么？
2. 如何跨多个服务和资源关联日志？
3. 哪些监控指标对早期问题检测最为关键？
4. 如何实施有效的灾难恢复程序？
5. 事件响应计划的关键组件有哪些？

### 模块 6：高级主题与最佳实践（第7-8周）

#### 学习目标
- 实现企业级部署模式
- 掌握 CI/CD 集成与自动化
- 开发自定义模板并为社区做出贡献
- 理解高级安全与合规性要求

#### 需要掌握的关键概念
- CI/CD 管道集成模式
- 自定义模板开发与分发
- 企业治理与合规
- 高级网络和安全配置
- 性能优化与成本管理

#### 练习题

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# 创建并发布自定义模板：
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# 实现企业级功能：
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自我评估问题
1. 如何将 azd 集成到现有的 CI/CD 工作流中？
2. 自定义模板开发的关键考虑事项有哪些？
3. 如何在 azd 部署中实现治理与合规？
4. 企业级部署的最佳实践有哪些？
5. 如何有效地为 azd 社区做出贡献？

## 实践项目

### 项目 1：个人作品集网站
<strong>复杂度</strong>: 初级  
<strong>时长</strong>: 1-2 周

使用以下内容构建并部署个人作品集网站：
- 在 Azure Storage 上托管静态网站
- 自定义域名配置
- CDN 集成以提升全球性能
- 自动化部署管道

<strong>交付成果</strong>:
- 部署在 Azure 上的可用网站
- 用于作品集部署的自定义 azd 模板
- 部署流程文档
- 成本分析及优化建议

### 项目 2：任务管理应用
<strong>复杂度</strong>: 中级  
<strong>时长</strong>: 2-3 周

创建一个具有以下内容的全栈任务管理应用：
- 部署到 App Service 的 React 前端
- 带有身份验证的 Node.js API 后端
- 带迁移的 PostgreSQL 数据库
- Application Insights 监控

<strong>交付成果</strong>:
- 完整的具有用户身份验证的应用
- 数据库模式和迁移脚本
- 监控仪表板和告警规则
- 多环境部署配置

### 项目 3：微服务电商平台
<strong>复杂度</strong>: 高级  
<strong>时长</strong>: 4-6 周

设计并实现一个基于微服务的电商平台：
- 多个 API 服务（商品目录、订单、支付、用户）
- 与 Service Bus 集成的消息队列
- 用于性能优化的 Redis 缓存
- 全面的日志记录和监控

<strong>参考示例</strong>：请参见 [微服务架构](../../../examples/container-app/microservices) 以获取生产就绪的模板和部署指南

<strong>交付成果</strong>:
- 完整的微服务架构
- 服务间通信模式
- 性能测试和优化
- 生产就绪的安全实现

## 评估与认证

### 知识检测

完成每个模块后进行以下评估：

**模块 1 评估**：基础概念与安装
- 涵盖核心概念的多项选择题
- 实际的安装与配置任务
- 简单的部署练习

**模块 2 评估**：配置与环境
- 环境管理场景
- 配置故障排除练习
- 安全配置实现

**模块 3 评估**：部署与配置
- 基础设施设计挑战
- 多服务部署场景
- 性能优化练习

**模块 4 评估**：预部署验证
- 容量规划案例研究
- 成本优化场景
- 验证管道实现

**模块 5 评估**：故障排除与调试
- 问题诊断练习
- 监控实现任务
- 事件响应模拟

**模块 6 评估**：高级主题
- CI/CD 管道设计
- 自定义模板开发
- 企业架构场景

### 最终结业项目

设计并实现一个完整的解决方案，以展示对所有概念的掌握：

<strong>要求</strong>:
- 多层应用架构
- 多个部署环境
- 全面的监控与告警
- 安全与合规性实现
- 成本优化与性能调优
- 完整的文档和运行手册

<strong>评估标准</strong>:
- 技术实现质量
- 文档完整性
- 安全性和最佳实践遵循
- 性能和成本优化
- 故障排除与监控效果

## 学习资源与参考

### 官方文档
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社区资源
- [AZD 模板库](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 组织](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 仓库](https://github.com/Azure/azure-dev)

### 练习环境
- [Azure 免费账户](https://azure.microsoft.com/free/)
- [Azure DevOps 免费层](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 附加工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools 扩展包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 学习计划建议

### 全职学习（8 周）
- **第1-2周**：模块 1-2（入门、配置）
- **第3-4周**：模块 3-4（部署、预部署）
- **第5-6周**：模块 5-6（故障排除、高级主题）
- **第7-8周**：实践项目与最终评估

### 兼职学习（16 周）
- **第1-4周**：模块 1（入门）
- **第5-7周**：模块 2（配置与环境）
- **第8-10周**：模块 3（部署与配置）
- **第11-12周**：模块 4（预部署验证）
- **第13-14周**：模块 5（故障排除与调试）
- **第15-16周**：模块 6（高级主题与评估）

---

## 进度跟踪与评估框架

### 章节完成清单

使用以下可衡量成果跟踪每章进度：

#### 📚 第1章：基础与快速入门
- [ ] <strong>安装完成</strong>：在你的平台上已安装并验证 AZD
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 模板
- [ ] <strong>环境设置</strong>：已配置第一个环境的变量
- [ ] <strong>资源浏览</strong>：在 Azure 门户中查看已部署的资源
- [ ] <strong>命令掌握</strong>：熟练使用基本的 AZD 命令

#### 🤖 第2章：AI 优先开发  
- [ ] **AI 模板部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 实现**：配置了文档索引和检索
- [ ] <strong>模型配置</strong>：为不同用途设置了多个 AI 模型
- [ ] **AI 监控**：为 AI 工作负载实施了 Application Insights
- [ ] <strong>性能优化</strong>：调整了 AI 应用的性能

#### ⚙️ 第3章：配置与身份验证
- [ ] <strong>多环境设置</strong>：配置了 dev、staging 和 prod 环境
- [ ] <strong>安全实现</strong>：设置了托管标识认证
- [ ] <strong>机密管理</strong>：集成了 Azure Key Vault 来管理敏感数据
- [ ] <strong>参数管理</strong>：创建了环境特定的配置
- [ ] <strong>认证掌握</strong>：实现了安全的访问模式

#### 🏗️ 第4章：基础设施即代码与部署
- [ ] <strong>自定义模板创建</strong>：构建了一个多服务应用模板
- [ ] **Bicep 掌握**：创建了模块化、可复用的基础设施组件
- [ ] <strong>部署自动化</strong>：实现了部署前/后的钩子
- [ ] <strong>架构设计</strong>：部署了复杂的微服务架构
- [ ] <strong>模板优化</strong>：为性能和成本优化了模板

#### 🎯 第5章：多代理 AI 解决方案
- [ ] <strong>零售解决方案部署</strong>：部署了完整的多代理零售场景
- [ ] <strong>代理自定义</strong>：修改了 Customer 和 Inventory 代理的行为
- [ ] <strong>架构扩展</strong>：实现了负载均衡和自动扩展
- [ ] <strong>生产监控</strong>：建立了全面的监控和告警
- [ ] <strong>性能调优</strong>：优化了多代理系统的性能

#### 🔍 第6章：预部署验证与规划
- [ ] <strong>容量分析</strong>：分析了应用的资源需求
- [ ] **SKU 优化**：选择了具有成本效益的服务层级
- [ ] <strong>验证自动化</strong>：实现了预部署检查脚本
- [ ] <strong>成本规划</strong>：创建了部署成本估算和预算
- [ ] <strong>风险评估</strong>：识别并缓解了部署风险

#### 🚨 第7章：故障排除与调试
- [ ] <strong>诊断技能</strong>：成功调试了有意破坏的部署
- [ ] <strong>日志分析</strong>：有效使用了 Azure Monitor 和 Application Insights
- [ ] <strong>性能调优</strong>：优化了性能较慢的应用
- [ ] <strong>恢复流程</strong>：实施了备份和灾难恢复
- [ ] <strong>监控设置</strong>：创建了主动监控和告警

#### 🏢 第8章：生产与企业模式
- [ ] <strong>企业安全</strong>：实施了全面的安全模式
- [ ] <strong>治理框架</strong>：设置了 Azure Policy 和资源管理
- [ ] <strong>高级监控</strong>：创建了仪表板和自动化告警
- [ ] **CI/CD 集成**：构建了自动化部署管道
- [ ] <strong>合规性实现</strong>：满足了企业合规性要求

### 学习时间表与里程碑

#### 第1-2周：基础建设
- <strong>里程碑</strong>：使用 AZD 部署第一个 AI 应用
- <strong>验证</strong>：应用可通过公共 URL 访问
- <strong>技能</strong>：基本的 AZD 工作流和 AI 服务集成

#### 第3-4周：配置精通
- <strong>里程碑</strong>：具备安全认证的多环境部署
- <strong>验证</strong>：相同应用已部署到 dev/staging/prod
- <strong>技能</strong>：环境管理与安全实现

#### 第5-6周：基础设施专长
- <strong>里程碑</strong>：用于复杂多服务应用的自定义模板
- <strong>验证</strong>：可复用模板被其他团队成员部署
- <strong>技能</strong>：Bicep 掌握与基础设施自动化

#### 第7-8周：高级 AI 实施
- <strong>里程碑</strong>：生产就绪的多代理 AI 解决方案
- <strong>验证</strong>：系统在监控下可处理真实负载
- <strong>技能</strong>：多代理编排与性能优化

#### 第9-10周：生产就绪
- <strong>里程碑</strong>：具备完整合规性的企业级部署
- <strong>验证</strong>：通过安全审查和成本优化审计
- <strong>技能</strong>：治理、监控和 CI/CD 集成

### 评估与认证

#### 知识验证方法
1. <strong>实际部署</strong>：为每章提供可运行的应用
2. <strong>代码审查</strong>：模板和配置质量评估
3. <strong>问题解决</strong>：故障排除场景与解决方案
4. <strong>同伴教学</strong>：向其他学习者解释概念
5. <strong>社区贡献</strong>：共享模板或改进

#### 职业发展成果
- <strong>作品集项目</strong>: 8 个生产就绪的部署
- <strong>技术技能</strong>: 符合行业标准的 AZD 与 AI 部署专长
- <strong>解决问题能力</strong>: 独立故障排除与优化
- <strong>社区认可</strong>: 积极参与 Azure 开发者社区
- <strong>职业发展</strong>: 技能可直接应用于云与 AI 职位

#### 成功指标
- <strong>部署成功率</strong>: >95% 成功部署
- <strong>故障排除时间</strong>: <30 分钟用于常见问题
- <strong>性能优化</strong>: 在成本与性能上有可证明的改善
- <strong>安全合规</strong>: 所有部署均符合企业安全标准
- <strong>知识传递</strong>: 能够指导其他开发者

### 持续学习与社区参与

#### 保持最新
- **Azure 更新**: 关注 Azure Developer CLI 发布说明
- <strong>社区活动</strong>: 参与 Azure 与 AI 开发者活动
- <strong>文档</strong>: 为社区文档与示例做出贡献
- <strong>反馈循环</strong>: 就课程内容和 Azure 服务提供反馈

#### 职业发展
- <strong>专业人脉</strong>: 与 Azure 与 AI 专家建立联系
- <strong>演讲机会</strong>: 在会议或聚会中分享学习成果
- <strong>开源贡献</strong>: 为 AZD 模板和工具做出贡献
- <strong>导师指导</strong>: 指导其他开发者的 AZD 学习之旅

---

**章节导航:**
- **📚 课程主页**: [AZD 入门](../README.md)
- **📖 开始学习**: [第 1 章：基础与快速上手](../README.md#-chapter-1-foundation--quick-start)
- **🎯 进度跟踪**: 通过完整的 8 章学习体系跟踪你的进展
- **🤝 社区**: [Azure Discord](https://discord.gg/microsoft-azure) 提供支持与讨论

<strong>学习进度跟踪</strong>: 使用此结构化指南，通过循序渐进的实用学习掌握 Azure Developer CLI，获得可量化的成果和职业发展收益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:

本文件已使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始语言的原始文件应被视为权威来源。对于重要信息，建议使用专业人工翻译。因使用本翻译而引起的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
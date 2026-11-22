# 学习指南 - 综合学习目标

<strong>学习路径导航</strong>
- **📚 课程主页**: [AZD 初学者指南](../README.md)
- **📖 开始学习**: [第1章：基础与快速入门](../README.md#-chapter-1-foundation--quick-start)
- **🎯 进度跟踪**: [课程完成情况](../README.md#-course-completion--certification)

## 介绍

这份全面的学习指南提供了结构化的学习目标、关键概念、练习题和评估材料，帮助您掌握 Azure Developer CLI (azd)。使用本指南跟踪您的学习进度，确保覆盖所有关键主题。

## 学习目标

完成本学习指南后，您将能够：
- 掌握 Azure Developer CLI 的所有基础和高级概念
- 培养在部署和管理 Azure 应用方面的实用技能
- 增强排查故障和优化部署的信心
- 理解面向生产的部署实践和安全注意事项

## 学习成果

完成本指南所有章节后，您将能够：
- 使用 azd 设计、部署和管理完整的应用架构
- 实施全面的监控、安全和成本优化策略
- 独立排查复杂的部署问题
- 创建自定义模板并为 azd 社区做出贡献

## 8 章节学习结构

### 第1章：基础与快速入门（第1周）
<strong>时长</strong>：30-45分钟 | <strong>复杂度</strong>: ⭐

#### 学习目标
- 理解 Azure Developer CLI 的核心概念和术语
- 成功安装并配置 AZD 于您的开发平台
- 使用现有模板部署您的第一个应用
- 有效导航 AZD 命令行界面

#### 关键概念掌握
- AZD 项目结构和组成部分（azure.yaml、infra/、src/）
- 基于模板的部署工作流
- 环境配置基础
- 资源组和订阅管理

#### 实践练习
1. <strong>安装验证</strong>：安装 AZD 并通过 `azd version` 验证
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 模板
3. <strong>环境设置</strong>：配置您的第一个环境变量
4. <strong>资源探索</strong>：在 Azure 门户中浏览已部署资源

#### 评估问题
- AZD 项目的核心组件有哪些？
- 如何从模板初始化一个新项目？
- `azd up` 和 `azd deploy` 有何区别？
- 如何使用 AZD 管理多个环境？

---

### 第2章：AI 优先开发（第2周）
<strong>时长</strong>：包含工作坊共4-5小时 | <strong>复杂度</strong>: ⭐⭐

#### 学习目标
- 将 Microsoft Foundry 服务集成至 AZD 工作流
- 使用 GA `microsoft.foundry` 包于 AZD 1.37.0+ 进行托管代理开发
- 部署并配置 AI 驱动的应用
- 理解 RAG（检索增强生成）实现模式
- 管理 AI 模型部署和扩展

#### 关键概念掌握
- Microsoft Foundry 模型服务集成及 API 管理
- AI 搜索配置和向量索引
- 模型部署策略和容量规划
- AI 应用监控与性能优化
- 本地代理检查器与云端跟踪、源码部署及版本控制中的评估资源

#### 实践练习
1. **AI 聊天部署**：部署 azure-search-openai-demo 模板
2. **RAG 实现**：配置文档索引和检索
3. <strong>模型配置</strong>：设置多个具有不同用途的 AI 模型
4. **AI 监控**：为 AI 工作负载实现 Application Insights
5. **GA 托管代理**：参照 [托管代理演练](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)；对比本地与云端响应，查看评估结果，并核实清理归属

#### 评估问题
- 如何在 AZD 模板中配置 Microsoft Foundry 模型服务？
- RAG 架构的关键组件有哪些？
- 如何管理 AI 模型的容量和扩展？
- AI 应用的重要监控指标有哪些？
- `microsoft.foundry` 包含哪些扩展，为什么评估单独安装？
- 为什么本地代理测试仍会产生 Azure 模型费用？
- 当重用现有 Foundry 项目时，`azd down` 会留下什么？

---

### 第3章：配置与身份验证（第3周）
<strong>时长</strong>：45-60分钟 | <strong>复杂度</strong>: ⭐⭐

#### 学习目标
- 掌握环境配置和管理策略
- 实施安全认证模式与托管身份
- 使用规范的命名约定组织资源
- 配置多环境部署（开发、预发布、生产）

#### 关键概念掌握
- 环境层级及配置优先级
- 托管身份和服务主体身份验证
- Key Vault 集成实现机密管理
- 环境特定参数管理

#### 实践练习
1. <strong>多环境设置</strong>：配置开发、预发布和生产环境
2. <strong>安全配置</strong>：实现托管身份认证
3. <strong>机密管理</strong>：集成 Azure Key Vault 保护敏感数据
4. <strong>参数管理</strong>：创建环境专用配置

#### 评估问题
- 如何使用 AZD 配置不同环境？
- 使用托管身份相比服务主体有哪些优势？
- 如何安全地管理应用机密？
- AZD 中配置的层级结构是什么？

---

### 第4章：基础设施即代码与部署（第4-5周）
<strong>时长</strong>：1-1.5小时 | <strong>复杂度</strong>: ⭐⭐⭐

#### 学习目标
- 创建和自定义 Bicep 基础设施模板
- 实施高级部署模式和工作流
- 理解资源配置策略
- 设计可扩展的多服务架构

- 使用 Azure Container Apps 和 AZD 部署容器化应用


#### 关键概念掌握
- Bicep 模板结构及最佳实践
- 资源依赖和部署顺序
- 参数文件和模板模块化
- 自定义钩子和部署自动化
- 容器应用部署模式（快速启动、生产、微服务）

#### 实践练习
1. <strong>自定义模板创建</strong>：构建多服务应用模板
2. **Bicep 精通**：创建模块化、可复用的基础设施组件
3. <strong>部署自动化</strong>：实现部署前后钩子
4. <strong>架构设计</strong>：部署复杂的微服务架构
5. <strong>容器应用部署</strong>：使用 AZD 部署 [简单 Flask API](../../../examples/container-app/simple-flask-api) 和 [微服务架构](../../../examples/container-app/microservices) 示例

#### 评估问题
- 如何为 AZD 创建自定义 Bicep 模板？
- 组织基础设施代码的最佳实践是什么？
- 如何处理模板中的资源依赖？
- 哪些部署模式支持零停机更新？

---

### 第5章：多代理 AI 解决方案（第6-7周）
<strong>时长</strong>：2-3小时 | <strong>复杂度</strong>: ⭐⭐⭐⭐

#### 学习目标
- 设计并实现多代理 AI 架构
- 协调代理之间的通信与协作
- 部署带监控的生产就绪 AI 解决方案
- 理解代理专长和工作流模式
- 将容器化微服务集成到多代理解决方案中

#### 关键概念掌握
- 多代理架构模式和设计原则
- 代理通信协议和数据流
- AI 代理负载均衡和扩展策略
- 多代理系统的生产监控
- 容器化环境中的服务间通信

#### 实践练习
1. <strong>零售架构评审</strong>：分析零售蓝图，识别必须在部署前实现的应用组件
2. <strong>代理定制</strong>：修改客户和库存代理行为
3. <strong>架构扩展</strong>：实现负载均衡和自动扩展
4. <strong>生产监控</strong>：设置全面的监控和告警
5. <strong>微服务集成</strong>：扩展 [微服务架构](../../../examples/container-app/microservices) 示例支持基于代理的工作流

#### 评估问题
- 如何设计高效的多代理通信模式？
- 扩展 AI 代理负载时应考虑哪些关键因素？
- 如何监控和调试多代理 AI 系统？
- 哪些生产模式保证 AI 代理的可靠性？

---

### 第6章：部署前验证与规划（第8周）
<strong>时长</strong>：1小时 | <strong>复杂度</strong>: ⭐⭐

#### 学习目标
- 进行全面的容量规划和资源验证
- 选择最优 Azure SKU 以实现成本效益
- 实施自动化预检查和验证
- 制定包含成本优化的部署计划

#### 关键概念掌握
- Azure 资源配额和容量限制
- SKU 选择标准与成本优化
- 自动化验证脚本和测试
- 部署规划和风险评估

#### 实践练习
1. <strong>容量分析</strong>：分析应用资源需求
2. **SKU 优化**：比较并选择成本效益高的服务等级
3. <strong>验证自动化</strong>：实现部署前检查脚本
4. <strong>成本规划</strong>：制定部署成本估算和预算

#### 评估问题
- 如何在部署前验证 Azure 容量？
- 哪些因素影响 SKU 的选择决策？
- 如何自动化部署前的验证？
- 有哪些策略帮助优化部署成本？

---

### 第7章：故障排除与调试（第9周）
<strong>时长</strong>：1-1.5小时 | <strong>复杂度</strong>: ⭐⭐

#### 学习目标
- 开发系统化的 AZD 部署调试方法
- 解决常见的部署和配置问题
- 调试 AI 特定的问题和性能瓶颈
- 实施监控与告警，实现主动问题检测

#### 关键概念掌握
- 诊断技巧与日志策略
- 常见失败模式及其解决方案
- 性能监控与优化
- 事件响应和恢复程序

#### 实践练习
1. <strong>诊断技能</strong>：练习故意损坏的部署
2. <strong>日志分析</strong>：高效使用 Azure Monitor 和 Application Insights
3. <strong>性能调优</strong>：优化慢性能应用
4. <strong>恢复程序</strong>：实现备份和灾难恢复

#### 评估问题
- 最常见的 AZD 部署失败有哪些？
- 如何调试身份验证和权限问题？
- 哪些监控策略有助于防止生产问题？
- 如何优化 Azure 中的应用性能？

---

### 第8章：生产与企业模式（第10-11周）
<strong>时长</strong>：2-3小时 | <strong>复杂度</strong>: ⭐⭐⭐⭐

#### 学习目标
- 实施企业级部署策略
- 设计安全模式和合规框架
- 建立监控、治理和成本管理
- 创建可扩展的包含 AZD 集成的 CI/CD 流水线
- 应用生产容器应用的最佳实践（安全、监控、成本、CI/CD）

#### 关键概念掌握
- 企业安全和合规要求
- 治理框架和策略落实
- 高级监控与成本管理
- CI/CD 集成和自动部署流水线
- 容器化工作负载的蓝绿部署和金丝雀部署策略

#### 实践练习
1. <strong>企业安全</strong>：实施全面的安全模式
2. <strong>治理框架</strong>：设置 Azure 策略和资源管理
3. <strong>高级监控</strong>：创建仪表板和自动告警
4. **CI/CD 集成**：构建自动化部署流水线
5. <strong>生产容器应用</strong>：对 [微服务架构](../../../examples/container-app/microservices) 示例应用安全、监控与成本优化

#### 评估问题
- 如何在 AZD 部署中实施企业安全？
- 哪些治理模式确保合规与成本控制？
- 如何设计可扩展的生产系统监控？
- 哪些 CI/CD 模式最适合 AZD 工作流？

#### 学习目标
- 理解 Azure Developer CLI 的基础和核心概念
- 成功在开发环境中安装和配置 azd
- 使用现有模板完成首次部署
- 导航 azd 项目结构并理解关键组件

#### 关键概念掌握
- 模板、环境和服务
- azure.yaml 配置结构
- 基础 azd 命令（init、up、down、deploy）
- 基础设施即代码原则
- Azure 身份验证和授权

#### 实践练习

**练习1.1：安装和设置**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**练习1.2：首次部署**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**练习1.3：项目结构分析**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### 自我评估问题
1. azd 架构的三个核心概念是什么？
2. azure.yaml 文件的作用是什么？
3. 环境如何帮助管理不同的部署目标？
4. azd 可以使用哪些身份验证方法？
5. 第一次运行 `azd up` 会发生什么？

---

## 进度跟踪和评估框架
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**练习2.2：高级配置**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**练习2.3：安全配置**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我评估问题
1. azd 如何处理环境变量优先级？
2. 什么是部署钩子，何时使用它们？
3. 如何为不同环境配置不同 SKU？
4. 不同身份验证方法的安全影响是什么？
5. 如何管理机密和敏感配置数据？

### 模块3：部署与配置（第4周）

#### 学习目标
- 掌握部署工作流及最佳实践
- 理解 Bicep 模板的基础设施即代码
- 实施复杂的多服务架构
- 优化部署性能和可靠性

#### 关键概念掌握
- Bicep 模板结构和模块
- 资源依赖及顺序
- 部署策略（蓝绿部署、滚动更新）
- 多区域部署
- 数据库迁移和数据管理

#### 实践练习

**练习 3.1：自定义基础设施**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**练习 3.2：多服务应用程序**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**练习 3.3：数据库集成**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我评估问题
1. 使用 Bicep 相较于 ARM 模板有哪些优势？
2. 在 azd 部署中如何处理数据库迁移？
3. 存在哪些无停机部署策略？
4. 如何管理服务之间的依赖关系？
5. 多区域部署需要考虑哪些因素？

### 模块 4：部署前验证（第 5 周）

#### 学习目标
- 实施全面的部署前检查
- 掌握容量规划和资源验证
- 理解 SKU 选择和成本优化
- 构建自动化验证流水线

#### 需掌握的关键概念
- Azure 资源配额和限制
- SKU 选择标准及成本影响
- 自动化验证脚本和工具
- 容量规划方法论
- 性能测试与优化

#### 练习任务

**练习 4.1：容量规划**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**练习 4.2：预检验证**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**练习 4.3：SKU 优化**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自我评估问题
1. SKU 选择决策应受哪些因素影响？
2. 部署前如何验证 Azure 资源的可用性？
3. 预检系统的关键组成是什么？
4. 如何评估和控制部署成本？
5. 容量规划需要哪些监控指标？

### 模块 5：故障排查与调试（第 6 周）

#### 学习目标
- 掌握系统化故障排查方法论
- 发展复杂部署问题调试专长
- 实施全面的监控和告警
- 构建事件响应与恢复程序

#### 需掌握的关键概念
- 常见部署失败模式
- 日志分析与关联技术
- 性能监控与优化
- 安全事件检测与响应
- 灾难恢复与业务连续性

#### 练习任务

**练习 5.1：故障排查场景**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**练习 5.2：监控实施**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**练习 5.3：事件响应**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我评估问题
1. azd 部署的系统性故障排查方法是什么？
2. 如何跨多服务和资源关联日志？
3. 哪些监控指标对早期问题检测最关键？
4. 如何实施有效的灾难恢复程序？
5. 事件响应计划的关键组成是什么？

### 模块 6：高级主题与最佳实践（第 7-8 周）

#### 学习目标
- 实施企业级部署模式
- 掌握 CI/CD 集成和自动化
- 开发自定义模板并贡献社区
- 理解高级安全和合规要求

#### 需掌握的关键概念
- CI/CD 流水线集成模式
- 自定义模板开发和分发
- 企业治理与合规
- 高级网络和安全配置
- 性能优化与成本管理

#### 练习任务

**练习 6.1：CI/CD 集成**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**练习 6.2：自定义模板开发**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**练习 6.3：企业级实现**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自我评估问题
1. 如何将 azd 集成到现有 CI/CD 工作流中？
2. 自定义模板开发的关键考虑因素有哪些？
3. 如何在 azd 部署中实施治理和合规？
4. 企业级部署的最佳实践是什么？
5. 如何有效地贡献给 azd 社区？

## 实践项目

### 项目 1：个人作品集网站
<strong>复杂度</strong>：初级  
<strong>时长</strong>：1-2 周

构建并部署个人作品集网站，使用：
- Azure 存储的静态网站托管
- 自定义域名配置
- CDN 集成以提升全球性能
- 自动化部署流水线

<strong>交付物</strong>：
- 在 Azure 上部署的工作网站
- 作品集部署的自定义 azd 模板
- 部署流程文档
- 成本分析和优化建议

### 项目 2：任务管理应用
<strong>复杂度</strong>：中级  
<strong>时长</strong>：2-3 周

创建全栈任务管理应用，包含：
- 部署在 App Service 的 React 前端
- 带认证的 Node.js API 后端
- PostgreSQL 数据库及迁移
- Application Insights 监控

<strong>交付物</strong>：
- 带用户认证的完整应用
- 数据库架构和迁移脚本
- 监控仪表盘和告警规则
- 多环境部署配置

### 项目 3：微服务电子商务平台
<strong>复杂度</strong>：高级  
<strong>时长</strong>：4-6 周

设计并实现基于微服务的电子商务平台：
- 多个 API 服务（目录、订单、支付、用户）
- 集成 Service Bus 消息队列
- 用于性能优化的 Redis 缓存
- 全面日志记录和监控

<strong>参考示例</strong>：请参见 [微服务架构](../../../examples/container-app/microservices) 中的两服务学习样本及部署指南。队列、持久化、认证、支付处理和生产硬化为独立项目工作。

<strong>交付物</strong>：
- 完整的微服务架构
- 服务间通信模式
- 性能测试与优化
- 可生产环境安全实现

## 评估和认证

### 知识测试

每模块完成后完成以下评估：

**模块 1 评估**：基础概念与安装
- 核心概念多选题
- 实际安装与配置任务
- 简单部署练习

**模块 2 评估**：配置与环境
- 环境管理场景
- 配置故障排查练习
- 安全配置实施

**模块 3 评估**：部署与配置
- 基础设施设计挑战
- 多服务部署场景
- 性能优化练习

**模块 4 评估**：部署前验证
- 容量规划案例研究
- 成本优化场景
- 验证流水线实现

**模块 5 评估**：故障排查与调试
- 问题诊断练习
- 监控实施任务
- 事件响应模拟

**模块 6 评估**：高级主题
- CI/CD 流水线设计
- 自定义模板开发
- 企业架构场景

### 最终毕业项目

设计并实现完整解决方案，展示对所有概念的掌握：

<strong>要求</strong>：
- 多层应用架构
- 多个部署环境
- 全面监控和告警
- 安全与合规实施
- 成本优化和性能调优
- 完整文档和运行手册

<strong>评估标准</strong>：
- 技术实现质量
- 文档完整性
- 安全和最佳实践遵循
- 性能和成本优化
- 故障排查与监控效果

## 学习资源与参考资料

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

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure 工具扩展包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 学习计划建议

### 全日制学习（8 周）
- **第 1-2 周**：模块 1-2（入门，配置）
- **第 3-4 周**：模块 3-4（部署，部署前）
- **第 5-6 周**：模块 5-6（故障排查，高级主题）
- **第 7-8 周**：实践项目和最终评估

### 兼职学习（16 周）
- **第 1-4 周**：模块 1（入门）
- **第 5-7 周**：模块 2（配置与环境）
- **第 8-10 周**：模块 3（部署与配置）
- **第 11-12 周**：模块 4（部署前验证）
- **第 13-14 周**：模块 5（故障排查与调试）
- **第 15-16 周**：模块 6（高级主题与评估）

---

## 进度跟踪与评估框架

### 章节完成清单

通过下列可量化成果跟踪每章的进度：

#### 📚 章节 1：基础与快速入门
- [ ] <strong>安装完成</strong>：在您的平台上安装并验证 AZD
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 模板
- [ ] <strong>环境配置</strong>：配置了第一个环境变量
- [ ] <strong>资源导航</strong>：在 Azure 门户探索已部署资源
- [ ] <strong>命令掌握</strong>：熟练使用基础 AZD 命令

#### 🤖 章节 2：AI 优先开发  
- [ ] **AI 模板部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 实施**：配置文档索引和检索
- [ ] <strong>模型配置</strong>：设置多个不同用途的 AI 模型
- [ ] **AI 监控**：为 AI 工作负载实施 Application Insights
- [ ] <strong>性能优化</strong>：调整 AI 应用性能

#### ⚙️ 章节 3：配置与认证
- [ ] <strong>多环境设置</strong>：配置开发、预生产和生产环境
- [ ] <strong>安全实施</strong>：设置托管身份认证
- [ ] <strong>机密管理</strong>：集成 Azure Key Vault 存储敏感数据
- [ ] <strong>参数管理</strong>：创建环境专属配置
- [ ] <strong>认证掌握</strong>：实施安全访问模式

#### 🏗️ 章节 4：基础设施即代码与部署
- [ ] <strong>自定义模板创建</strong>：构建多服务应用模板
- [ ] **Bicep 掌握**：创建模块化、可重用基础设施组件
- [ ] <strong>部署自动化</strong>：实施部署前后钩子
- [ ] <strong>架构设计</strong>：部署复杂微服务架构
- [ ] <strong>模板优化</strong>：优化模板性能及成本

#### 🎯 章节 5：多智能体 AI 解决方案
- [ ] <strong>零售架构复查</strong>：识别缺失的应用组件并规划其实施和验证
- [ ] <strong>智能体定制</strong>：修改客户和库存智能体行为
- [ ] <strong>架构扩展</strong>：实现负载均衡和自动扩展
- [ ] <strong>生产监控</strong>：设置全面监控和告警
- [ ] <strong>性能调优</strong>：优化多智能体系统性能

#### 🔍 章节 6：部署前验证与规划
- [ ] <strong>容量分析</strong>：分析应用资源需求
- [ ] **SKU 优化**：选择具成本效益的服务层级
- [ ] <strong>验证自动化</strong>：实施部署前检查脚本
- [ ] <strong>成本规划</strong>：制定部署成本估算和预算
- [ ] <strong>风险评估</strong>：识别并缓解部署风险

#### 🚨 章节 7：故障排查与调试
- [ ] <strong>诊断能力</strong>：成功调试故意破坏的部署
- [ ] <strong>日志分析</strong>：有效使用 Azure Monitor 和 Application Insights
- [ ] <strong>性能调优</strong>：优化性能较慢的应用
- [ ] <strong>恢复程序</strong>：实施备份和灾难恢复
- [ ] <strong>监控设置</strong>：创建前瞻性监控和告警

#### 🏢 章节 8：生产与企业模式
- [ ] <strong>企业安全</strong>：实施全面的安全模式
- [ ] <strong>治理框架</strong>：设置 Azure 策略与资源管理
- [ ] <strong>高级监控</strong>：创建仪表盘及自动告警
- [ ] **CI/CD 集成**：构建自动化部署流水线
- [ ] <strong>合规实施</strong>：满足企业合规要求

### 学习时间表及里程碑

#### 第 1-2 周：基础建设
- <strong>里程碑</strong>：使用 AZD 部署首个 AI 应用
- <strong>验证</strong>：应用可通过公共 URL 访问
- <strong>技能</strong>：AZD 基础工作流程及 AI 服务集成

#### 第 3-4 周：配置掌握
- <strong>里程碑</strong>：实现多环境部署且具安全认证
- <strong>验证</strong>：同一应用部署在开发、预生产和生产环境
- <strong>技能</strong>：环境管理与安全实施

#### 第 5-6 周：基础设施专长
- <strong>里程碑</strong>：创建复杂多服务应用的自定义模板
- <strong>验证</strong>：模板由其他团队成员成功部署
- <strong>技能</strong>：Bicep 掌握及基础设施自动化

#### 第 7-8 周：高级 AI 实施
- <strong>里程碑</strong>：交付可生产的多智能体 AI 解决方案
- <strong>验证</strong>：系统可处理实际负载并具监控能力
- <strong>技能</strong>：多智能体编排与性能优化

#### 第 9-10 周：生产准备
- <strong>里程碑</strong>：实现企业级部署并全面合规
- <strong>验证</strong>：通过安全审查与成本优化审核
- <strong>技能</strong>：治理、监控及 CI/CD 集成

### 评估与认证

#### 知识验证方法
1. <strong>实战部署</strong>：每章的实际应用
2. <strong>代码审查</strong>：模板和配置质量评估
3. <strong>问题解决</strong>：故障排除场景和解决方案
4. <strong>同伴教学</strong>：向其他学习者讲解概念
5. <strong>社区贡献</strong>：分享模板或改进

#### 职业发展成果
- <strong>作品集项目</strong>：学习部署和架构练习；生产准备需单独实现和审核
- <strong>技术技能</strong>：行业标准的 AZD 和 AI 部署专业知识
- <strong>问题解决能力</strong>：独立故障排除和优化
- <strong>社区认可</strong>：积极参与 Azure 开发者社区
- <strong>职业晋升</strong>：技能直接适用于云计算和 AI 相关岗位

#### 成功衡量指标
- <strong>部署成功率</strong>：>95% 的成功部署
- <strong>故障排除时间</strong>：常见问题少于 30 分钟
- <strong>性能优化</strong>：在成本和性能上的显著改进
- <strong>安全审查</strong>：针对组织要求记录控制措施及剩余差距；完成课程不等同于合规认证
- <strong>知识传递</strong>：具备指导其他开发者能力

### 持续学习与社区参与

#### 保持更新
- **Azure 更新**：关注 Azure Developer CLI 发行说明
- <strong>社区活动</strong>：参与 Azure 和 AI 开发者活动
- <strong>文档贡献</strong>：为社区文档和示例做出贡献
- <strong>反馈循环</strong>：对课程内容和 Azure 服务提供反馈

#### 职业发展
- <strong>专业网络</strong>：与 Azure 和 AI 专家建立联系
- <strong>演讲机会</strong>：在会议或聚会分享学习成果
- <strong>开源贡献</strong>：参与 AZD 模板和工具开发
- <strong>导师指导</strong>：引导其他开发者在 AZD 学习之路上成长

---

**章节导航：**
- **📚 课程首页**：[AZD 入门](../README.md)
- **📖 开始学习**：[第1章：基础与快速入门](../README.md#-chapter-1-foundation--quick-start)
- **🎯 进度跟踪**：通过综合的 8 章学习系统跟踪您的进展
- **🤝 社区**：[Azure Discord](https://discord.gg/microsoft-azure) 寻求支持和讨论

<strong>学习进度跟踪</strong>：使用此结构化指南，通过循序渐进的实战学习掌握 Azure Developer CLI，实现可衡量的成果和职业发展收益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
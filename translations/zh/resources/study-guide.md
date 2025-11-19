<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-19T12:07:09+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "zh"
}
-->
# 学习指南 - 综合学习目标

**学习路径导航**
- **📚 课程主页**: [AZD 初学者指南](../README.md)
- **📖 开始学习**: [第1章：基础与快速入门](../README.md#-chapter-1-foundation--quick-start)
- **🎯 进度跟踪**: [课程完成](../README.md#-course-completion--certification)

## 简介

本综合学习指南提供了结构化的学习目标、关键概念、实践练习和评估材料，帮助您掌握 Azure Developer CLI (azd)。使用本指南跟踪您的学习进度，确保覆盖所有重要主题。

## 学习目标

完成本学习指南后，您将能够：
- 掌握 Azure Developer CLI 的所有基础和高级概念
- 培养部署和管理 Azure 应用程序的实际技能
- 提升解决问题和优化部署的信心
- 理解生产级部署实践和安全注意事项

## 学习成果

完成本学习指南的所有章节后，您将能够：
- 使用 azd 设计、部署和管理完整的应用程序架构
- 实施全面的监控、安全和成本优化策略
- 独立解决复杂的部署问题
- 创建自定义模板并为 azd 社区做出贡献

## 八章学习结构

### 第1章：基础与快速入门（第1周）
**时长**: 30-45 分钟 | **难度**: ⭐

#### 学习目标
- 理解 Azure Developer CLI 的核心概念和术语
- 成功在您的开发平台上安装和配置 AZD
- 使用现有模板部署您的第一个应用程序
- 高效地导航 AZD 命令行界面

#### 需要掌握的关键概念
- AZD 项目结构和组件（azure.yaml, infra/, src/）
- 基于模板的部署工作流
- 环境配置基础
- 资源组和订阅管理

#### 实践练习
1. **安装验证**: 安装 AZD 并通过 `azd version` 验证
2. **首次部署**: 成功部署 todo-nodejs-mongo 模板
3. **环境设置**: 配置您的第一个环境变量
4. **资源探索**: 在 Azure 门户中导航已部署的资源

#### 评估问题
- AZD 项目的核心组件是什么？
- 如何从模板初始化一个新项目？
- `azd up` 和 `azd deploy` 有什么区别？
- 如何使用 AZD 管理多个环境？

---

### 第2章：AI 优先开发（第2周）
**时长**: 1-2 小时 | **难度**: ⭐⭐

#### 学习目标
- 将 Microsoft Foundry 服务集成到 AZD 工作流中
- 部署和配置 AI 驱动的应用程序
- 理解 RAG（检索增强生成）实现模式
- 管理 AI 模型的部署和扩展

#### 需要掌握的关键概念
- Azure OpenAI 服务集成和 API 管理
- AI 搜索配置和向量索引
- 模型部署策略和容量规划
- AI 应用程序的监控和性能优化

#### 实践练习
1. **AI 聊天部署**: 部署 azure-search-openai-demo 模板
2. **RAG 实现**: 配置文档索引和检索
3. **模型配置**: 设置具有不同用途的多个 AI 模型
4. **AI 监控**: 为 AI 工作负载实施 Application Insights

#### 评估问题
- 如何在 AZD 模板中配置 Azure OpenAI 服务？
- RAG 架构的关键组件是什么？
- 如何管理 AI 模型的容量和扩展？
- AI 应用程序的重要监控指标有哪些？

---

### 第3章：配置与认证（第3周）
**时长**: 45-60 分钟 | **难度**: ⭐⭐

#### 学习目标
- 掌握环境配置和管理策略
- 实现安全的认证模式和托管身份
- 使用适当的命名约定组织资源
- 配置多环境部署（开发、测试、生产）

#### 需要掌握的关键概念
- 环境层次结构和配置优先级
- 托管身份和服务主体认证
- Key Vault 集成以管理机密
- 环境特定参数管理

#### 实践练习
1. **多环境设置**: 配置开发、测试和生产环境
2. **安全配置**: 实现托管身份认证
3. **机密管理**: 集成 Azure Key Vault 以管理敏感数据
4. **参数管理**: 创建环境特定的配置

#### 评估问题
- 如何使用 AZD 配置不同的环境？
- 使用托管身份比服务主体有哪些优势？
- 如何安全地管理应用程序机密？
- AZD 的配置层次结构是什么？

---

### 第4章：基础设施即代码与部署（第4-5周）
**时长**: 1-1.5 小时 | **难度**: ⭐⭐⭐

#### 学习目标
- 创建和自定义 Bicep 基础设施模板
- 实现高级部署模式和工作流
- 理解资源供应策略
- 设计可扩展的多服务架构
- 使用 Azure 容器应用和 AZD 部署容器化应用程序

#### 需要掌握的关键概念
- Bicep 模板结构和最佳实践
- 资源依赖关系和部署顺序
- 参数文件和模板模块化
- 自定义钩子和部署自动化
- 容器应用部署模式（快速入门、生产、微服务）

#### 实践练习
1. **自定义模板创建**: 构建一个多服务应用程序模板
2. **Bicep 精通**: 创建模块化、可重用的基础设施组件
3. **部署自动化**: 实现部署前/后钩子
4. **架构设计**: 部署复杂的微服务架构
5. **容器应用部署**: 使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 和 [Microservices Architecture](../../../examples/container-app/microservices) 示例

#### 评估问题
- 如何为 AZD 创建自定义 Bicep 模板？
- 组织基础设施代码的最佳实践是什么？
- 如何在模板中处理资源依赖关系？
- 哪些部署模式支持零停机更新？

---

### 第5章：多代理 AI 解决方案（第6-7周）
**时长**: 2-3 小时 | **难度**: ⭐⭐⭐⭐

#### 学习目标
- 设计和实现多代理 AI 架构
- 协调代理的通信和协作
- 部署具有监控功能的生产级 AI 解决方案
- 理解代理的专业化和工作流模式
- 将容器化微服务集成到多代理解决方案中

#### 需要掌握的关键概念
- 多代理架构模式和设计原则
- 代理通信协议和数据流
- AI 代理的负载均衡和扩展策略
- 多代理系统的生产监控
- 容器化环境中的服务间通信

#### 实践练习
1. **零售解决方案部署**: 部署完整的多代理零售场景
2. **代理定制**: 修改客户和库存代理的行为
3. **架构扩展**: 实现负载均衡和自动扩展
4. **生产监控**: 设置全面的监控和警报
5. **微服务集成**: 扩展 [Microservices Architecture](../../../examples/container-app/microservices) 示例以支持基于代理的工作流

#### 评估问题
- 如何设计有效的多代理通信模式？
- 扩展 AI 代理工作负载的关键考虑因素是什么？
- 如何监控和调试多代理 AI 系统？
- 哪些生产模式可以确保 AI 代理的可靠性？

---

### 第6章：部署前验证与规划（第8周）
**时长**: 1 小时 | **难度**: ⭐⭐

#### 学习目标
- 执行全面的容量规划和资源验证
- 选择最优的 Azure SKU 以实现成本效益
- 实现自动化的预检和验证
- 使用成本优化策略规划部署

#### 需要掌握的关键概念
- Azure 资源配额和容量限制
- SKU 选择标准和成本优化
- 自动化验证脚本和测试
- 部署规划和风险评估

#### 实践练习
1. **容量分析**: 分析应用程序的资源需求
2. **SKU 优化**: 比较并选择具有成本效益的服务层
3. **验证自动化**: 实现部署前检查脚本
4. **成本规划**: 创建部署成本估算和预算

#### 评估问题
- 如何在部署前验证 Azure 容量？
- 哪些因素会影响 SKU 选择决策？
- 如何自动化部署前的验证？
- 哪些策略有助于优化部署成本？

---

### 第7章：故障排除与调试（第9周）
**时长**: 1-1.5 小时 | **难度**: ⭐⭐

#### 学习目标
- 开发系统化的 AZD 部署调试方法
- 解决常见的部署和配置问题
- 调试 AI 特定问题和性能问题
- 实现监控和警报以主动检测问题

#### 需要掌握的关键概念
- 诊断技术和日志记录策略
- 常见故障模式及其解决方案
- 性能监控和优化
- 事件响应和恢复程序

#### 实践练习
1. **诊断技能**: 练习处理故意破坏的部署
2. **日志分析**: 有效使用 Azure Monitor 和 Application Insights
3. **性能调优**: 优化性能较慢的应用程序
4. **恢复程序**: 实现备份和灾难恢复

#### 评估问题
- AZD 部署中最常见的故障是什么？
- 如何调试认证和权限问题？
- 哪些监控策略有助于防止生产问题？
- 如何优化 Azure 中的应用程序性能？

---

### 第8章：生产与企业模式（第10-11周）
**时长**: 2-3 小时 | **难度**: ⭐⭐⭐⭐

#### 学习目标
- 实现企业级部署策略
- 设计安全模式和合规框架
- 建立监控、治理和成本管理
- 创建与 AZD 集成的可扩展 CI/CD 流水线
- 应用生产容器应用部署的最佳实践（安全性、监控、成本、CI/CD）

#### 需要掌握的关键概念
- 企业安全和合规要求
- 治理框架和策略实施
- 高级监控和成本管理
- CI/CD 集成和自动化部署流水线
- 容器化工作负载的蓝绿和金丝雀部署策略

#### 实践练习
1. **企业安全**: 实现全面的安全模式
2. **治理框架**: 设置 Azure 策略和资源管理
3. **高级监控**: 创建仪表板和自动警报
4. **CI/CD 集成**: 构建自动化部署流水线
5. **生产容器应用**: 将安全性、监控和成本优化应用于 [Microservices Architecture](../../../examples/container-app/microservices) 示例

#### 评估问题
- 如何在 AZD 部署中实现企业安全？
- 哪些治理模式可以确保合规性和成本控制？
- 如何为生产系统设计可扩展的监控？
- 哪些 CI/CD 模式最适合 AZD 工作流？

#### 学习目标
- 理解 Azure Developer CLI 的基础知识和核心概念
- 成功在您的开发环境中安装和配置 azd
- 使用现有模板完成您的首次部署
- 掌握 azd 项目结构并理解关键组件

#### 需要掌握的关键概念
- 模板、环境和服务
- azure.yaml 配置结构
- 基本 azd 命令（init, up, down, deploy）
- 基础设施即代码原则
- Azure 身份验证和授权

#### 实践练习

**练习 1.1: 安装与设置**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**练习 1.2: 首次部署**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**练习 1.3: 项目结构分析**
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
4. azd 支持哪些身份验证方法？
5. 第一次运行 `azd up` 时会发生什么？

---

## 进度跟踪与评估框架
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**练习 2.2: 高级配置**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**练习 2.3: 安全配置**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我评估问题
1. azd 如何处理环境变量的优先级？
2. 部署钩子是什么，应该在什么时候使用？
3. 如何为不同环境配置不同的 SKU？
4. 不同身份验证方法的安全影响是什么？
5. 如何管理机密和敏感配置数据？

### 模块 3: 部署与资源供应（第4周）

#### 学习目标
- 掌握部署工作流和最佳实践
- 理解使用 Bicep 模板的基础设施即代码
- 实现复杂的多服务架构
- 优化部署性能和可靠性

#### 需要掌握的关键概念
- Bicep 模板结构和模块
- 资源依赖关系和顺序
- 部署策略（蓝绿部署、滚动更新）
- 多区域部署
- 数据库迁移和数据管理

#### 实践练习

**练习 3.1: 自定义基础设施**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**练习 3.2: 多服务应用程序**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**练习 3.3: 数据库集成**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我评估问题
1. 使用 Bicep 替代 ARM 模板的优势是什么？
2. 如何在 azd 部署中处理数据库迁移？
3. 哪些策略支持零停机部署？
4. 如何管理服务之间的依赖关系？
5. 多区域部署需要考虑哪些因素？

### 模块 4：部署前验证（第 5 周）

#### 学习目标
- 实施全面的部署前检查
- 掌握容量规划和资源验证
- 理解 SKU 选择和成本优化
- 构建自动化验证管道

#### 需要掌握的关键概念
- Azure 资源配额和限制
- SKU 选择标准及成本影响
- 自动化验证脚本和工具
- 容量规划方法
- 性能测试与优化

#### 实践练习

**练习 4.1：容量规划**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**练习 4.2：飞行前验证**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**练习 4.3：SKU 优化**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### 自我评估问题
1. 哪些因素会影响 SKU 选择决策？
2. 如何在部署前验证 Azure 资源的可用性？
3. 飞行前检查系统的关键组成部分是什么？
4. 如何估算和控制部署成本？
5. 容量规划中需要监控哪些内容？

### 模块 5：故障排除与调试（第 6 周）

#### 学习目标
- 掌握系统化的故障排除方法
- 熟练调试复杂的部署问题
- 实施全面的监控和警报
- 构建事件响应和恢复流程

#### 需要掌握的关键概念
- 常见的部署失败模式
- 日志分析与关联技术
- 性能监控与优化
- 安全事件检测与响应
- 灾难恢复与业务连续性

#### 实践练习

**练习 5.1：故障排除场景**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**练习 5.2：监控实施**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**练习 5.3：事件响应**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### 自我评估问题
1. 系统化排查 azd 部署问题的步骤是什么？
2. 如何在多个服务和资源之间关联日志？
3. 哪些监控指标对早期问题检测最为关键？
4. 如何实施有效的灾难恢复流程？
5. 事件响应计划的关键组成部分是什么？

### 模块 6：高级主题与最佳实践（第 7-8 周）

#### 学习目标
- 实施企业级部署模式
- 掌握 CI/CD 集成与自动化
- 开发自定义模板并为社区做贡献
- 理解高级安全性和合规性要求

#### 需要掌握的关键概念
- CI/CD 管道集成模式
- 自定义模板开发与分发
- 企业治理与合规性
- 高级网络与安全配置
- 性能优化与成本管理

#### 实践练习

**练习 6.1：CI/CD 集成**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**练习 6.2：自定义模板开发**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**练习 6.3：企业实施**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### 自我评估问题
1. 如何将 azd 集成到现有的 CI/CD 工作流中？
2. 自定义模板开发需要考虑哪些关键点？
3. 如何在 azd 部署中实施治理和合规性？
4. 企业级部署的最佳实践是什么？
5. 如何有效地为 azd 社区做出贡献？

## 实践项目

### 项目 1：个人作品集网站
**复杂度**：初级  
**时长**：1-2 周  

使用以下技术构建并部署个人作品集网站：
- Azure Storage 上的静态网站托管
- 自定义域名配置
- CDN 集成以提升全球性能
- 自动化部署管道

**交付成果**：
- 部署在 Azure 上的工作网站
- 用于作品集部署的自定义 azd 模板
- 部署过程的文档
- 成本分析与优化建议

### 项目 2：任务管理应用
**复杂度**：中级  
**时长**：2-3 周  

创建一个全栈任务管理应用，包括：
- 部署到 App Service 的 React 前端
- 带有身份验证的 Node.js API 后端
- 带迁移功能的 PostgreSQL 数据库
- Application Insights 监控

**交付成果**：
- 带用户身份验证的完整应用
- 数据库架构和迁移脚本
- 监控仪表板和警报规则
- 多环境部署配置

### 项目 3：微服务电商平台
**复杂度**：高级  
**时长**：4-6 周  

设计并实现一个基于微服务的电商平台：
- 多个 API 服务（目录、订单、支付、用户）
- 使用 Service Bus 的消息队列集成
- 使用 Redis 缓存优化性能
- 全面的日志记录和监控

**参考示例**：请参阅 [微服务架构](../../../examples/container-app/microservices) 以获取生产就绪的模板和部署指南

**交付成果**：
- 完整的微服务架构
- 服务间通信模式
- 性能测试与优化
- 生产就绪的安全性实施

## 评估与认证

### 知识检查

在每个模块后完成以下评估：

**模块 1 评估**：基础概念与安装  
- 核心概念的选择题  
- 实际安装与配置任务  
- 简单的部署练习  

**模块 2 评估**：配置与环境  
- 环境管理场景  
- 配置故障排除练习  
- 安全配置实施  

**模块 3 评估**：部署与资源配置  
- 基础设施设计挑战  
- 多服务部署场景  
- 性能优化练习  

**模块 4 评估**：部署前验证  
- 容量规划案例研究  
- 成本优化场景  
- 验证管道实施  

**模块 5 评估**：故障排除与调试  
- 问题诊断练习  
- 监控实施任务  
- 事件响应模拟  

**模块 6 评估**：高级主题  
- CI/CD 管道设计  
- 自定义模板开发  
- 企业架构场景  

### 最终综合项目

设计并实现一个完整的解决方案，展示对所有概念的掌握：

**要求**：
- 多层应用架构  
- 多个部署环境  
- 全面的监控和警报  
- 安全性与合规性实施  
- 成本优化与性能调优  
- 完整的文档和运行手册  

**评估标准**：
- 技术实施质量  
- 文档完整性  
- 安全性与最佳实践的遵循  
- 性能与成本优化  
- 故障排除与监控的有效性  

## 学习资源与参考资料

### 官方文档
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep 文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)  

### 社区资源
- [AZD 模板库](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub 组织](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub 仓库](https://github.com/Azure/azure-dev)  

### 实践环境
- [Azure 免费账户](https://azure.microsoft.com/free/)  
- [Azure DevOps 免费层](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools 扩展包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## 学习计划建议

### 全日制学习（8 周）
- **第 1-2 周**：模块 1-2（入门、配置）  
- **第 3-4 周**：模块 3-4（部署、部署前验证）  
- **第 5-6 周**：模块 5-6（故障排除、高级主题）  
- **第 7-8 周**：实践项目与最终评估  

### 兼职学习（16 周）
- **第 1-4 周**：模块 1（入门）  
- **第 5-7 周**：模块 2（配置与环境）  
- **第 8-10 周**：模块 3（部署与资源配置）  
- **第 11-12 周**：模块 4（部署前验证）  
- **第 13-14 周**：模块 5（故障排除与调试）  
- **第 15-16 周**：模块 6（高级主题与评估）  

---

## 进度跟踪与评估框架

### 章节完成清单

通过以下可衡量的成果跟踪每章的学习进度：

#### 📚 第 1 章：基础与快速入门
- [ ] **完成安装**：在您的平台上安装并验证 AZD  
- [ ] **首次部署**：成功部署 todo-nodejs-mongo 模板  
- [ ] **环境设置**：配置第一个环境变量  
- [ ] **资源导航**：在 Azure 门户中浏览已部署资源  
- [ ] **命令掌握**：熟悉基本 AZD 命令  

#### 🤖 第 2 章：AI 优先开发  
- [ ] **AI 模板部署**：成功部署 azure-search-openai-demo  
- [ ] **RAG 实现**：配置文档索引和检索  
- [ ] **模型配置**：设置多个具有不同用途的 AI 模型  
- [ ] **AI 监控**：为 AI 工作负载实施 Application Insights  
- [ ] **性能优化**：调整 AI 应用性能  

#### ⚙️ 第 3 章：配置与身份验证
- [ ] **多环境设置**：配置开发、预发布和生产环境  
- [ ] **安全实施**：设置托管身份验证  
- [ ] **机密管理**：集成 Azure Key Vault 管理敏感数据  
- [ ] **参数管理**：创建特定环境的配置  
- [ ] **身份验证掌握**：实施安全访问模式  

#### 🏗️ 第 4 章：基础设施即代码与部署
- [ ] **自定义模板创建**：构建多服务应用模板  
- [ ] **Bicep 掌握**：创建模块化、可重用的基础设施组件  
- [ ] **部署自动化**：实施部署前/后钩子  
- [ ] **架构设计**：部署复杂的微服务架构  
- [ ] **模板优化**：优化模板以提升性能和降低成本  

#### 🎯 第 5 章：多代理 AI 解决方案
- [ ] **零售解决方案部署**：部署完整的多代理零售场景  
- [ ] **代理自定义**：修改客户和库存代理行为  
- [ ] **架构扩展**：实施负载均衡和自动扩展  
- [ ] **生产监控**：设置全面的监控和警报  
- [ ] **性能调优**：优化多代理系统性能  

#### 🔍 第 6 章：部署前验证与规划
- [ ] **容量分析**：分析应用的资源需求  
- [ ] **SKU 优化**：选择具有成本效益的服务层  
- [ ] **验证自动化**：实施部署前检查脚本  
- [ ] **成本规划**：创建部署成本估算和预算  
- [ ] **风险评估**：识别并缓解部署风险  

#### 🚨 第 7 章：故障排除与调试
- [ ] **诊断技能**：成功调试故意破坏的部署  
- [ ] **日志分析**：有效使用 Azure Monitor 和 Application Insights  
- [ ] **性能调优**：优化性能较差的应用  
- [ ] **恢复流程**：实施备份和灾难恢复  
- [ ] **监控设置**：创建主动监控和警报  

#### 🏢 第 8 章：生产与企业模式
- [ ] **企业安全**：实施全面的安全模式  
- [ ] **治理框架**：设置 Azure Policy 和资源管理  
- [ ] **高级监控**：创建仪表板和自动警报  
- [ ] **CI/CD 集成**：构建自动化部署管道  
- [ ] **合规性实施**：满足企业合规性要求  

### 学习时间表与里程碑

#### 第 1-2 周：基础构建
- **里程碑**：使用 AZD 部署第一个 AI 应用  
- **验证**：工作应用可通过公共 URL 访问  
- **技能**：基本 AZD 工作流和 AI 服务集成  

#### 第 3-4 周：配置掌握
- **里程碑**：多环境部署并实现安全身份验证  
- **验证**：同一应用部署到开发/预发布/生产环境  
- **技能**：环境管理和安全实施  

#### 第 5-6 周：基础设施专业知识
- **里程碑**：为复杂的多服务应用创建自定义模板  
- **验证**：可由其他团队成员部署的可重用模板  
- **技能**：Bicep 掌握和基础设施自动化  

#### 第 7-8 周：高级 AI 实施
- **里程碑**：生产就绪的多代理 AI 解决方案  
- **验证**：系统在实际负载下运行并有监控  
- **技能**：多代理编排和性能优化  

#### 第 9-10 周：生产准备
- **里程碑**：企业级部署，完全符合合规性要求  
- **验证**：通过安全审查和成本优化审核  
- **技能**：治理、监控和 CI/CD 集成  

### 评估与认证

#### 知识验证方法
1. **实际部署**：每章的工作应用  
2. **代码审查**：模板和配置质量评估  
3. **问题解决**：故障排除场景与解决方案  
4. **同伴教学**：向其他学习者解释概念  
5. **社区贡献**：分享模板或改进

#### 职业发展成果
- **作品集项目**：8个可用于生产环境的部署
- **技术技能**：行业标准的AZD和AI部署专业知识
- **问题解决能力**：独立排查问题并进行优化
- **社区认可**：积极参与Azure开发者社区
- **职业提升**：技能直接适用于云计算和AI相关岗位

#### 成功指标
- **部署成功率**：>95%的成功部署率
- **故障排除时间**：常见问题解决时间少于30分钟
- **性能优化**：成本和性能方面的显著改进
- **安全合规性**：所有部署均符合企业安全标准
- **知识传递**：能够指导其他开发者

### 持续学习与社区参与

#### 保持更新
- **Azure更新**：关注Azure Developer CLI的发布说明
- **社区活动**：参与Azure和AI开发者活动
- **文档**：为社区文档和示例做贡献
- **反馈循环**：为课程内容和Azure服务提供反馈

#### 职业发展
- **专业网络**：与Azure和AI领域专家建立联系
- **演讲机会**：在会议或聚会上分享学习成果
- **开源贡献**：为AZD模板和工具做贡献
- **指导**：帮助其他开发者学习AZD

---

**章节导航：**
- **📚 课程主页**：[AZD入门](../README.md)
- **📖 开始学习**：[第1章：基础与快速入门](../README.md#-chapter-1-foundation--quick-start)
- **🎯 学习进度跟踪**：通过全面的8章学习系统跟踪您的进展
- **🤝 社区**：[Azure Discord](https://discord.gg/microsoft-azure) 提供支持与讨论

**学习进度跟踪**：使用这份结构化指南，通过循序渐进的实践学习掌握Azure Developer CLI，同时获得可衡量的成果和职业发展收益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
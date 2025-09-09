<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:36:07+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "zh"
}
-->
# 学习指南 - AZD 初学者

## 简介

这份全面的学习指南提供了结构化的学习目标、关键概念、练习题和评估材料，帮助您掌握 Azure Developer CLI (azd)。使用本指南跟踪您的学习进度，确保覆盖所有重要主题。

## 学习目标

完成本学习指南后，您将能够：
- 掌握 Azure Developer CLI 的所有基础和高级概念
- 发展部署和管理 Azure 应用的实践技能
- 建立解决问题和优化部署的信心
- 理解生产级部署实践和安全注意事项

## 学习成果

完成本学习指南的所有章节后，您将能够：
- 使用 azd 设计、部署和管理完整的应用架构
- 实施全面的监控、安全和成本优化策略
- 独立解决复杂的部署问题
- 创建自定义模板并为 azd 社区做出贡献

## 课程结构

### 模块 1：入门（第 1-2 周）

#### 学习目标
- 理解 Azure Developer CLI 的基础知识和核心概念
- 成功安装并配置 azd 开发环境
- 使用现有模板完成首次部署
- 掌握 azd 项目结构并理解关键组件

#### 需要掌握的关键概念
- 模板、环境和服务
- azure.yaml 配置结构
- 基本 azd 命令（init、up、down、deploy）
- 基础设施即代码原则
- Azure 身份验证和授权

#### 练习题

**练习 1.1：安装和设置**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**练习 1.2：首次部署**
```bash
# Deploy a simple web application:
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
2. azure.yaml 文件的作用是什么？
3. 环境如何帮助管理不同的部署目标？
4. azd 可以使用哪些身份验证方法？
5. 第一次运行 `azd up` 时会发生什么？

### 模块 2：配置和环境（第 3 周）

#### 学习目标
- 掌握环境管理和配置
- 理解高级 azure.yaml 配置
- 实现环境特定的设置和变量
- 配置不同场景的身份验证

#### 需要掌握的关键概念
- 环境层次结构和变量优先级
- 服务配置和参数
- 钩子和生命周期事件
- 身份验证方法（用户、服务主体、托管身份）
- 配置文件管理

#### 练习题

**练习 2.1：多环境设置**
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我评估问题
1. azd 如何处理环境变量的优先级？
2. 什么是部署钩子，什么时候应该使用它们？
3. 如何为不同环境配置不同的 SKU？
4. 不同身份验证方法的安全影响是什么？
5. 如何管理机密和敏感配置数据？

### 模块 3：部署和资源配置（第 4 周）

#### 学习目标
- 掌握部署工作流和最佳实践
- 理解使用 Bicep 模板的基础设施即代码
- 实现复杂的多服务架构
- 优化部署性能和可靠性

#### 需要掌握的关键概念
- Bicep 模板结构和模块
- 资源依赖关系和排序
- 部署策略（蓝绿部署、滚动更新）
- 多区域部署
- 数据库迁移和数据管理

#### 练习题

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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**练习 3.3：数据库集成**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我评估问题
1. 使用 Bicep 相较于 ARM 模板的优势是什么？
2. 如何在 azd 部署中处理数据库迁移？
3. 零停机部署有哪些策略？
4. 如何管理服务之间的依赖关系？
5. 多区域部署需要考虑哪些因素？

### 模块 4：部署前验证（第 5 周）

#### 学习目标
- 实现全面的部署前检查
- 掌握容量规划和资源验证
- 理解 SKU 选择和成本优化
- 构建自动化验证管道

#### 需要掌握的关键概念
- Azure 资源配额和限制
- SKU 选择标准和成本影响
- 自动化验证脚本和工具
- 容量规划方法
- 性能测试和优化

#### 练习题

**练习 4.1：容量规划**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**练习 4.2：部署前验证**
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
1. SKU 选择决策应受哪些因素影响？
2. 如何在部署前验证 Azure 资源的可用性？
3. 部署前检查系统的关键组成部分是什么？
4. 如何估算和控制部署成本？
5. 容量规划需要哪些关键监控？

### 模块 5：故障排除和调试（第 6 周）

#### 学习目标
- 掌握系统化的故障排除方法
- 熟练调试复杂的部署问题
- 实现全面的监控和警报
- 构建事件响应和恢复程序

#### 需要掌握的关键概念
- 常见的部署失败模式
- 日志分析和关联技术
- 性能监控和优化
- 安全事件检测和响应
- 灾难恢复和业务连续性

#### 练习题

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
1. azd 部署故障排除的系统化方法是什么？
2. 如何在多个服务和资源之间关联日志？
3. 哪些监控指标对早期问题检测最为关键？
4. 如何实施有效的灾难恢复程序？
5. 事件响应计划的关键组成部分是什么？

### 模块 6：高级主题和最佳实践（第 7-8 周）

#### 学习目标
- 实现企业级部署模式
- 掌握 CI/CD 集成和自动化
- 开发自定义模板并为社区做贡献
- 理解高级安全和合规要求

#### 需要掌握的关键概念
- CI/CD 管道集成模式
- 自定义模板开发和分发
- 企业治理和合规
- 高级网络和安全配置
- 性能优化和成本管理

#### 练习题

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
2. 自定义模板开发的关键考虑因素是什么？
3. 如何在 azd 部署中实施治理和合规？
4. 企业级部署的最佳实践是什么？
5. 如何有效地为 azd 社区做贡献？

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
- 部署过程文档
- 成本分析和优化建议

### 项目 2：任务管理应用
**复杂度**：中级  
**时长**：2-3 周

创建一个全栈任务管理应用，包括：
- 部署到 App Service 的 React 前端
- 带身份验证的 Node.js API 后端
- 带迁移功能的 PostgreSQL 数据库
- 应用洞察监控

**交付成果**：
- 带用户身份验证的完整应用
- 数据库架构和迁移脚本
- 监控仪表盘和警报规则
- 多环境部署配置

### 项目 3：微服务电商平台
**复杂度**：高级  
**时长**：4-6 周

设计并实现一个基于微服务的电商平台，包括：
- 多个 API 服务（目录、订单、支付、用户）
- 使用 Service Bus 的消息队列集成
- Redis 缓存以优化性能
- 全面的日志记录和监控

**交付成果**：
- 完整的微服务架构
- 服务间通信模式
- 性能测试和优化
- 生产级安全实施

## 评估与认证

### 知识检查

在每个模块完成后进行以下评估：

**模块 1 评估**：基础概念和安装
- 核心概念的选择题
- 实际安装和配置任务
- 简单部署练习

**模块 2 评估**：配置和环境
- 环境管理场景
- 配置故障排除练习
- 安全配置实施

**模块 3 评估**：部署和资源配置
- 基础设施设计挑战
- 多服务部署场景
- 性能优化练习

**模块 4 评估**：部署前验证
- 容量规划案例研究
- 成本优化场景
- 验证管道实施

**模块 5 评估**：故障排除和调试
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
- 安全和合规实施
- 成本优化和性能调优
- 完整的文档和运行手册

**评估标准**：
- 技术实施质量
- 文档完整性
- 安全和最佳实践遵守情况
- 性能和成本优化
- 故障排除和监控效果

## 学习资源和参考资料

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
- **第 7-8 周**：实践项目和最终评估

### 兼职学习（16 周）
- **第 1-4 周**：模块 1（入门）
- **第 5-7 周**：模块 2（配置和环境）
- **第 8-10 周**：模块 3（部署和资源配置）
- **第 11-12 周**：模块 4（部署前验证）
- **第 13-14 周**：模块 5（故障排除和调试）
- **第 15-16 周**：模块 6（高级主题和评估）

### 自主学习
- 按自己的节奏完成每个模块
- 在困难概念上花更多时间
- 重复练习直到掌握
- 参与社区讨论并提出问题

## 成功技巧

### 有效的学习策略
1. **定期练习**：频繁部署应用以建立操作记忆
2. **大胆尝试**：在开发环境中尝试新的配置
3. **记录学习过程**：记录解决问题的方案
4. **加入社区**：参与讨论并贡献项目
5. **保持更新**：关注 Azure 的更新和新的 azd 功能

### 避免常见错误
1. **跳过基础知识**：确保具备必要的基础知识
2. **匆忙学习**：花时间彻底理解基础概念
3. **忽视安全性**：从一开始就实施安全最佳实践
4. **测试不足**：在多个环境中测试部署
5. **忽略文档**：良好的文档对维护至关重要

### 构建实践经验
1. **从小开始**：从简单的应用开始，逐步增加复杂性
2. **从失败中学习**：将故障排除练习作为学习机会
3. **贡献开源**：与社区分享你的模板和解决方案  
4. **教导他人**：向他人解释概念能够强化你自己的理解  
5. **保持好奇心**：不断探索新的 Azure 服务和集成模式  

---

**导航**  
- **上一课**：[FAQ](faq.md)  
- **下一课**：[Changelog](../changelog.md)  

**学习进度跟踪**：使用本指南来跟踪你的学习旅程，确保全面掌握所有 Azure Developer CLI 的概念和实践。  

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
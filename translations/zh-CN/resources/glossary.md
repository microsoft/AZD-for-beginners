# 术语表 - Azure 与 AZD 术语

**所有章节参考**
- **📚 课程主页**: [AZD 入门](../README.md)
- **📖 学习基础**: [第 1 章：AZD 基础](../docs/getting-started/azd-basics.md)
- **🤖 AI 术语**: [第 2 章：以 AI 为先的开发](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## 介绍

本综合术语表提供在 Azure Developer CLI 和 Azure 云开发中使用的术语、概念和缩略语的定义。是理解技术文档、排查问题和就 azd 项目及 Azure 服务进行有效沟通的必要参考。

## 学习目标

通过使用此术语表，您将能够：
- 理解关键的 Azure Developer CLI 术语和概念
- 掌握 Azure 云开发的词汇和技术术语
- 高效参考基础设施即代码和部署相关术语
- 理解 Azure 服务名称、缩略语及其用途
- 获取故障排除和调试术语的定义
- 学习高级 Azure 架构和开发概念

## 学习成果

定期参考本术语表后，您将能够：
- 使用正确的 Azure Developer CLI 术语进行有效沟通
- 更清晰地理解技术文档和错误消息
- 自信地浏览 Azure 服务和概念
- 使用适当的技术词汇进行故障排查
- 在团队讨论中提供准确的技术表达
- 系统性地扩展您的 Azure 云开发知识

## A

**ARM 模板**  
Azure Resource Manager template。基于 JSON 的基础设施即代码格式，用于以声明式方式定义和部署 Azure 资源。

**App Service**  
Azure 的平台即服务 (PaaS) 产品，用于托管 Web 应用、REST API 和移动后端，而无需管理基础设施。

**Application Insights**  
Azure 的应用性能监控 (APM) 服务，提供对应用性能、可用性和使用情况的深入洞察。

**Azure CLI**  
用于管理 Azure 资源的命令行界面。azd 用于身份验证和某些操作时会使用它。

**Azure Developer CLI (azd)**  
面向开发者的命令行工具，使用模板和基础设施即代码来加速应用构建和部署到 Azure 的过程。

**azure.yaml**  
azd 项目的主要配置文件，定义服务、基础设施和部署钩子。

**Azure Resource Manager (ARM)**  
Azure 的部署和管理服务，提供用于创建、更新和删除资源的管理层。

## B

**Bicep**  
由微软开发用于部署 Azure 资源的领域专用语言 (DSL)。语法比 ARM 模板更简单，编译后生成 ARM。

**Build**  
编译源代码、安装依赖并为部署准备应用的过程。

**Blue-Green 部署**  
使用两个相同的生产环境（蓝色和绿色）来最小化停机时间和风险的部署策略。

## C

**Container Apps**  
Azure 的无服务器容器服务，使在无需管理复杂基础设施的情况下运行容器化应用成为可能。

**CI/CD**  
持续集成/持续部署。用于集成代码变更和部署应用的自动化实践。

**Cosmos DB**  
Azure 的全球分布、多模型数据库服务，为吞吐量、延迟、可用性和一致性提供全面的 SLA。

**配置**  
控制应用行为和部署选项的设置和参数。

## D

**部署**  
在目标基础设施上安装和配置应用及其依赖项的过程。

**Docker**  
使用容器化技术开发、打包和运行应用的平台。

**Dockerfile**  
包含用于构建 Docker 容器镜像指令的文本文件。

## E

**Environment**  
表示应用特定实例的部署目标（例如，开发、预发布、生产）。

**环境变量**  
以键值对存储的配置值，应用在运行时可以访问。

**端点**  
可访问应用或服务的 URL 或网络地址。

## F

**Function App**  
Azure 的无服务器计算服务，使运行事件驱动代码而无需管理基础设施成为可能。

## G

**GitHub Actions**  
与 GitHub 仓库集成的 CI/CD 平台，用于自动化工作流。

**Git**  
用于跟踪源代码更改的分布式版本控制系统。

## H

**Hooks**  
在部署生命周期的特定点运行的自定义脚本或命令（preprovision、postprovision、predeploy、postdeploy）。

**Host**  
应用将被部署的 Azure 服务类型（例如，appservice、containerapp、function）。

## I

**基础设施即代码 (IaC)**  
通过代码而不是手动流程来定义和管理基础设施的实践。

**Init**  
初始化新的 azd 项目的过程，通常基于模板。

## J

**JSON**  
JavaScript 对象表示法。常用于配置文件和 API 响应的数据交换格式。

**JWT**  
JSON Web Token。在各方之间以 JSON 对象的形式安全传输信息的标准。

## K

**Key Vault**  
Azure 用于安全存储和管理密钥、机密和证书的服务。

**Kusto 查询语言 (KQL)**  
用于分析 Azure Monitor、Application Insights 和其他 Azure 服务中的数据的查询语言。

## L

**负载均衡器**  
将传入网络流量分配到多个服务器或实例的服务。

**Log Analytics**  
Azure 用于收集、分析和对来自云端及本地环境的遥测数据采取行动的服务。

## M

**托管标识**  
Azure 功能，向 Azure 服务提供自动管理的身份以用于向其他 Azure 服务进行身份验证。

**微服务**  
一种将应用构建为一组小型、独立服务的架构方法。

**Monitor**  
Azure 的统一监控解决方案，提供跨应用和基础设施的全栈可观测性。

## N

**Node.js**  
基于 Chrome V8 引擎的 JavaScript 运行时，用于构建服务端应用。

**npm**  
Node.js 的包管理器，用于管理依赖和包。

## O

**输出**  
从基础设施部署返回的值，可被应用或其他资源使用。

## P

**打包**  
为部署准备应用代码和依赖的过程。

**参数**  
传递给基础设施模板以自定义部署的输入值。

**PostgreSQL**  
作为 Azure 托管服务支持的开源关系型数据库系统。

**配置（Provisioning）**  
创建和配置基础设施模板中定义的 Azure 资源的过程。

## Q

**配额**  
对 Azure 订阅或区域中可创建资源数量的限制。

## R

**资源组**  
为共享相同生命周期、权限和策略的 Azure 资源提供的逻辑容器。

**Resource Token**  
由 azd 生成的唯一字符串，用于确保部署中的资源名称唯一。

**REST API**  
使用 HTTP 方法设计网络应用的架构风格。

**回滚**  
将应用或基础设施配置恢复到先前版本的过程。

## S

**服务**  
在 azure.yaml 中定义的应用组件（例如，Web 前端、API 后端、数据库）。

**SKU**  
库存单位。代表 Azure 资源的不同服务层或性能级别。

**SQL Database**  
基于 Microsoft SQL Server 的 Azure 托管关系数据库服务。

**Static Web Apps**  
用于从源代码仓库构建和部署全栈 Web 应用的 Azure 服务。

**存储帐户**  
Azure 服务，为包括 blob、文件、队列和表在内的数据对象提供云存储。

**订阅**  
包含资源组和资源的 Azure 帐户容器，关联计费和访问管理。

## T

**模板**  
包含应用代码、基础设施定义和常见场景配置的预构建项目结构。

**Terraform**  
支持包括 Azure 在内的多个云提供商的开源基础设施即代码工具。

**Traffic Manager**  
Azure 基于 DNS 的流量负载均衡器，用于在全球 Azure 区域间分配流量。

## U

**URI**  
统一资源标识符。标识特定资源的字符串。

**URL**  
统一资源定位符。一种指定资源位置及检索方式的 URI 类型。

## V

**虚拟网络 (VNet)**  
Azure 私有网络的基础构建块，提供隔离和分段。

**VS Code**  
Visual Studio Code。流行的代码编辑器，具有出色的 Azure 和 azd 集成。

## W

**Webhook**  
由特定事件触发的 HTTP 回调，常用于 CI/CD 管道中。

**What-if**  
Azure 功能，可显示部署将会进行哪些更改而不实际执行部署。

## Y

**YAML**  
YAML 不是标记语言。用于 azure.yaml 等配置文件的可读数据序列化标准。

## Z

**可用区**  
Azure 区域内物理上相互分离的位置，提供冗余和高可用性。

---

## 常见缩略词

| 缩略词 | 全称 | 描述 |
|--------|------|------|
| AAD | Azure Active Directory | 身份和访问管理服务 |
| ACR | Azure Container Registry | 容器镜像注册服务 |
| AKS | Azure Kubernetes Service | 托管 Kubernetes 服务 |
| API | Application Programming Interface | 构建软件的一组协议 |
| ARM | Azure Resource Manager | Azure 的部署和管理服务 |
| CDN | Content Delivery Network | 分布式服务器网络 |
| CI/CD | Continuous Integration/Continuous Deployment | 自动化开发实践 |
| CLI | Command Line Interface | 基于文本的用户界面 |
| DNS | Domain Name System | 将域名转换为 IP 地址的系统 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP 的安全版本 |
| IaC | Infrastructure as Code | 通过代码管理基础设施 |
| JSON | JavaScript Object Notation | 数据交换格式 |
| JWT | JSON Web Token | 用于安全传输信息的令牌格式 |
| KQL | Kusto Query Language | 用于 Azure 数据服务的查询语言 |
| RBAC | Role-Based Access Control | 基于用户角色的访问控制方法 |
| REST | Representational State Transfer | Web 服务的架构风格 |
| SDK | Software Development Kit | 开发工具集合 |
| SLA | Service Level Agreement | 对服务可用性/性能的承诺 |
| SQL | Structured Query Language | 管理关系型数据库的语言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密协议 |
| URI | Uniform Resource Identifier | 标识资源的字符串 |
| URL | Uniform Resource Locator | 指定资源位置的 URI 类型 |
| VM | Virtual Machine | 计算机系统的仿真 |
| VNet | Virtual Network | Azure 中的私有网络 |
| YAML | YAML 不是标记语言 | 数据序列化标准 |

---

## Azure 服务名称映射

| 常用名称 | 官方 Azure 服务名称 | azd Host 类型 |
|---------|---------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## 上下文相关术语

### 开发术语
- **Hot Reload**: 在开发期间无需重启即可自动更新应用
- **Build Pipeline**: 自动化构建和测试代码的流程
- **Deployment Slot**: App Service 中的预发布环境
- **Environment Parity**: 保持开发、预发布和生产环境的一致性

### 安全术语
- **托管标识**: 提供自动凭据管理的 Azure 功能
- **Key Vault**: 用于安全存储机密、密钥和证书
- **RBAC**: 对 Azure 资源的基于角色的访问控制
- **Network Security Group**: 控制网络流量的虚拟防火墙

### 监控术语
- **遥测**: 自动收集测量值和数据
- **应用性能监控 (APM)**: 监控软件性能
- **Log Analytics**: 用于收集和分析日志数据的服务
- **告警规则**: 基于指标或条件的自动通知

### 部署术语
- **Blue-Green 部署**: 零停机时间的部署策略
- **Canary 部署**: 向部分用户逐步发布
- **Rolling Update**: 顺序替换应用实例
- **Rollback**: 恢复到先前的应用版本

---

**使用提示**: 使用 `Ctrl+F` 可快速在此术语表中搜索特定术语。术语在适用处有交叉引用。

---

**导航**
- **上一课**: [Cheat Sheet](cheat-sheet.md)
- **下一课**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件由 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）翻译。尽管我们力求准确，但请注意自动翻译可能存在错误或不准确之处。原文（原始语言版本）应被视为权威来源。对于关键信息，建议采用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
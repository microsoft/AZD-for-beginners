# 词汇表 - Azure 和 AZD 术语

<strong>所有章节参考</strong>
- **📚 课程主页**: [AZD For Beginners](../README.md)
- **📖 学习基础**: [第 1 章：AZD 基础](../docs/getting-started/azd-basics.md)
- **🤖 AI 术语**: [第 2 章：以 AI 为先的开发](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## 介绍

本详尽词汇表提供在 Azure Developer CLI 和 Azure 云开发中使用的术语、概念和缩略语的定义。是理解技术文档、排查问题以及就 azd 项目和 Azure 服务进行有效沟通的必要参考。

## 学习目标

使用此词汇表，您将能够：
- 理解关键的 Azure Developer CLI 术语和概念
- 掌握 Azure 云开发的词汇和技术术语
- 高效查阅基础设施即代码和部署术语
- 理解 Azure 服务名称、缩略语及其用途
- 查找故障排查和调试相关术语的定义
- 学习高级 Azure 架构与开发概念

## 学习成果

定期参考此词汇表，您将能够：
- 使用正确的 Azure Developer CLI 术语进行有效沟通
- 更清晰地理解技术文档和错误信息
- 自信地导航 Azure 服务和概念
- 使用恰当的技术词汇进行问题排查
- 在团队讨论中提供准确的技术语言
- 系统性地扩展您的 Azure 云开发知识

## A

**ARM Template**  
Azure Resource Manager 模板。基于 JSON 的基础设施即代码格式，用于以声明式方式定义和部署 Azure 资源。

**App Service**  
Azure 的平台即服务 (PaaS) 提供，用于托管 Web 应用、REST API 和移动后台，而无需管理基础设施。

**Application Insights**  
Azure 的应用性能监控 (APM) 服务，提供对应用性能、可用性和使用情况的深度洞察。

**Azure CLI**  
用于管理 Azure 资源的命令行界面。azd 用于身份验证和某些操作时会使用该工具。

**Azure Developer CLI (azd)**  
面向开发者的命令行工具，通过使用模板和基础设施即代码来加速将应用构建并部署到 Azure 的过程。

**azure.yaml**  
azd 项目的主要配置文件，定义服务、基础设施和部署钩子。

**Azure Resource Manager (ARM)**  
Azure 的部署和管理服务，提供用于创建、更新和删除资源的管理层。

## B

**Bicep**  
由微软开发的用于部署 Azure 资源的领域特定语言 (DSL)。相比 ARM 模板提供更简洁的语法，同时可编译为 ARM。

**Build**  
编译源代码、安装依赖项并为部署准备应用的过程。

**Blue-Green Deployment**  
使用两个相同的生产环境（蓝色和绿色）来最小化停机时间和风险的部署策略。

## C

**Container Apps**  
Azure 的无服务器容器服务，能够在无需管理复杂基础设施的情况下运行容器化应用。

**CI/CD**  
持续集成/持续部署。用于集成代码更改和部署应用的自动化实践。

**Cosmos DB**  
Azure 的全球分布、多模型数据库服务，提供关于吞吐量、延迟、可用性和一致性的全面 SLA。

**Configuration**  
控制应用行为和部署选项的设置和参数。

## D

**Deployment**  
在目标基础设施上安装和配置应用及其依赖项的过程。

**Docker**  
使用容器化技术开发、分发和运行应用的平台。

**Dockerfile**  
包含构建 Docker 容器镜像指令的文本文件。

## E

**Environment**  
表示应用特定实例的部署目标（例如：development、staging、production）。

**Environment Variables**  
以键值对形式存储的配置值，应用在运行时可访问这些值。

**Endpoint**  
应用或服务可被访问的 URL 或网络地址。

## F

**Function App**  
Azure 的无服务器计算服务，能够在无需管理基础设施的情况下运行事件驱动代码。

## G

**GitHub Actions**  
与 GitHub 仓库集成的 CI/CD 平台，用于自动化工作流。

**Git**  
用于跟踪源代码更改的分布式版本控制系统。

## H

**Hooks**  
在部署生命周期特定点运行的自定义脚本或命令（preprovision、postprovision、predeploy、postdeploy）。

**Host**  
应用将被部署的 Azure 服务类型（例如：appservice、containerapp、function）。

## I

**Infrastructure as Code (IaC)**  
通过代码而非手动流程来定义和管理基础设施的实践。

**Init**  
初始化新的 azd 项目的过程，通常基于模板。

## J

**JSON**  
JavaScript 对象表示法。常用于配置文件和 API 响应的数据交换格式。

**JWT**  
JSON Web Token。用于在各方之间以 JSON 对象安全传输信息的标准。

## K

**Key Vault**  
Azure 用于安全存储和管理机密、密钥和证书的服务。

**Kusto Query Language (KQL)**  
用于分析 Azure Monitor、Application Insights 和其他 Azure 服务中数据的查询语言。

## L

**Load Balancer**  
将传入网络流量分配到多个服务器或实例的服务。

**Log Analytics**  
用于收集、分析并对来自云和本地环境的遥测数据采取行动的 Azure 服务。

## M

**Managed Identity**  
Azure 功能，为 Azure 服务提供自动管理的身份以便对其他 Azure 服务进行身份验证。

**Microservices**  
一种将应用构建为多个小型、独立服务集合的架构方法。

**Monitor**  
Azure 的统一监控解决方案，提供跨应用和基础设施的全栈可观察性。

## N

**Node.js**  
基于 Chrome 的 V8 JavaScript 引擎构建的 JavaScript 运行时，用于构建服务器端应用。

**npm**  
Node.js 的包管理器，用于管理依赖项和包。

## O

**Output**  
从基础设施部署中返回的值，可被应用或其他资源使用。

## P

**Package**  
为部署准备应用代码和依赖项的过程。

**Parameters**  
传递给基础设施模板以自定义部署的输入值。

**PostgreSQL**  
作为 Azure 托管服务支持的开源关系型数据库系统。

**Provisioning**  
创建和配置基础设施模板中定义的 Azure 资源的过程。

## Q

**Quota**  
对 Azure 订阅或区域中可创建资源数量的限制。

## R

**Resource Group**  
共享相同生命周期、权限和策略的 Azure 资源的逻辑容器。

**Resource Token**  
由 azd 生成的唯一字符串，用于确保资源名称在部署中唯一。

**REST API**  
使用 HTTP 方法设计网络应用的架构风格。

**Rollback**  
将应用或基础设施配置恢复到先前版本的过程。

## S

**Service**  
在 azure.yaml 中定义的应用组件（例如：Web 前端、API 后端、数据库）。

**SKU**  
库存单位。表示 Azure 资源的不同服务层级或性能级别。

**SQL Database**  
基于 Microsoft SQL Server 的 Azure 托管关系型数据库服务。

**Static Web Apps**  
用于从源代码仓库构建和部署全栈 Web 应用的 Azure 服务。

**Storage Account**  
提供用于存储数据对象（包括 blob、文件、队列和表）的云存储的 Azure 服务。

**Subscription**  
包含资源组和资源的 Azure 帐户容器，关联计费和访问管理。

## T

**Template**  
预构建的项目结构，包含应用代码、基础设施定义和常见场景的配置。

**Terraform**  
支持包括 Azure 在内的多个云提供商的开源基础设施即代码工具。

**Traffic Manager**  
Azure 基于 DNS 的流量负载均衡器，用于在全球 Azure 区域之间分发流量。

## U

**URI**  
统一资源标识符。用于标识特定资源的字符串。

**URL**  
统一资源定位符。指定资源位置及如何检索资源的 URI 类型。

## V

**Virtual Network (VNet)**  
Azure 中用于私有网络的基本构建块，提供隔离和分段。

**VS Code**  
Visual Studio Code。流行的代码编辑器，具有出色的 Azure 和 azd 集成。

## W

**Webhook**  
由特定事件触发的 HTTP 回调，常用于 CI/CD 管道。

**What-if**  
Azure 功能，可显示部署将会进行哪些更改而不实际执行它。

## Y

**YAML**  
YAML 不是标记语言。用于像 azure.yaml 这样的配置文件的人类可读数据序列化标准。

## Z

**Zone**  
Azure 区域内的物理独立位置，提供冗余和高可用性。

---

## 常见缩略语

| 缩略语 | 全称 | 描述 |
|--------|------|------|
| AAD | Azure Active Directory（现为 Microsoft Entra ID） | 身份和访问管理服务 |
| ACR | Azure Container Registry | 容器镜像注册表服务 |
| AKS | Azure Kubernetes Service | 托管的 Kubernetes 服务 |
| API | Application Programming Interface | 构建软件的一组协议 |
| ARM | Azure Resource Manager | Azure 的部署和管理服务 |
| CDN | Content Delivery Network | 分布式服务器网络 |
| CI/CD | Continuous Integration/Continuous Deployment | 自动化开发实践 |
| CLI | Command Line Interface | 基于文本的用户界面 |
| DNS | Domain Name System | 将域名转换为 IP 地址的系统 |
| HTTPS | Hypertext Transfer Protocol Secure | 安全版本的 HTTP |
| IaC | Infrastructure as Code | 通过代码管理基础设施 |
| JSON | JavaScript Object Notation | 数据交换格式 |
| JWT | JSON Web Token | 用于安全信息传输的令牌格式 |
| KQL | Kusto Query Language | Azure 数据服务的查询语言 |
| RBAC | Role-Based Access Control | 基于用户角色的访问控制方法 |
| REST | Representational State Transfer | Web 服务的架构风格 |
| SDK | Software Development Kit | 一组开发工具 |
| SLA | Service Level Agreement | 关于服务可用性/性能的承诺 |
| SQL | Structured Query Language | 管理关系数据库的语言 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 加密协议 |
| URI | Uniform Resource Identifier | 标识资源的字符串 |
| URL | Uniform Resource Locator | 指定资源位置的 URI 类型 |
| VM | Virtual Machine | 计算机系统的仿真 |
| VNet | Virtual Network | Azure 中的私有网络 |
| YAML | YAML Ain't Markup Language | 数据序列化标准 |

---

## Azure 服务名称映射

| 常用名称 | 官方 Azure 服务名称 | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## 上下文特定术语

### 开发术语
- **Hot Reload**：在开发期间无需重启即可自动更新应用
- **Build Pipeline**：用于构建和测试代码的自动化流程
- **Deployment Slot**：App Service 内的暂存环境
- **Environment Parity**：保持开发、暂存和生产环境的一致性

### 安全术语
- **Managed Identity**：提供自动凭据管理的 Azure 功能
- **Key Vault**：用于安全存储机密、密钥和证书
- **RBAC**：针对 Azure 资源的基于角色访问控制
- **Network Security Group**：用于控制网络流量的虚拟防火墙

### 监控术语
- **Telemetry**：自动收集测量数据和信息
- **Application Performance Monitoring (APM)**：监控软件性能
- **Log Analytics**：用于收集和分析日志数据的服务
- **Alert Rules**：基于指标或条件的自动通知

### 部署术语
- **Blue-Green Deployment**：零停机时间的部署策略
- **Canary Deployment**：向部分用户逐步推出的发布方式
- **Rolling Update**：按序替换应用实例
- **Rollback**：恢复到先前应用版本

---

<strong>使用提示</strong>：使用 `Ctrl+F` 可以快速在此词汇表中查找特定术语。术语在适用处会进行交叉引用。

---

<strong>导航</strong>
- <strong>上一课</strong>: [Cheat Sheet](cheat-sheet.md)
- <strong>下一课</strong>: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
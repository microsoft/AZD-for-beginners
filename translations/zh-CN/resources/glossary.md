# 术语表 - Azure 和 AZD 术语

<strong>所有章节的参考资料</strong>
- **📚 课程主页**：[AZD 新手指南](../README.md)
- **📖 学习基础**：[第1章：AZD 基础](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI 术语**：[第2章：AI优先开发](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## 介绍

本综合术语表提供了 Azure Developer CLI 和 Azure 云开发中使用的术语、概念和缩写的定义。是理解技术文档、解决问题及有效沟通 azd 项目和 Azure 服务的必备参考。

## 学习目标

通过使用本术语表，你将：
- 理解关键的 Azure Developer CLI 术语和概念
- 掌握 Azure 云开发的词汇和技术术语
- 高效引用基础设施即代码和部署相关术语
- 理解 Azure 服务名称、缩写及其用途
- 获取故障排查和调试术语的定义
- 学习高级 Azure 架构和开发概念

## 学习成果

经常参考本术语表，你将能够：
- 使用准确的 Azure Developer CLI 术语进行有效沟通
- 更清晰地理解技术文档和错误信息
- 自信地浏览 Azure 服务和概念
- 使用适当的技术词汇进行故障排查
- 准确地参与团队技术讨论
- 系统性扩展你的 Azure 云开发知识

## A

**ARM 模板**  
Azure 资源管理器模板。基于 JSON 的基础设施即代码格式，用于声明式定义和部署 Azure 资源。

**应用服务 (App Service)**  
Azure 的平台即服务 (PaaS) 产品，托管 Web 应用、REST API 和移动后端，免运维基础设施。

**Application Insights**  
Azure 的应用性能监控 (APM) 服务，提供对应用性能、可用性及使用情况的深入洞察。

**Azure CLI**  
管理 Azure 资源的命令行界面。它与 AZD 互补，但登录独立；AZD 核心认证使用 `azd auth login`。

**Azure Developer CLI (azd)**  
面向开发者的命令行工具，加快使用模板和基础设施即代码构建部署 Azure 应用的流程。

**azure.yaml**  
azd 项目的主配置文件，定义服务、基础设施及部署钩子。

**Azure Resource Manager (ARM)**  
Azure 的部署和管理服务，为创建、更新和删除资源提供管理层。

## B

**Bicep**  
微软开发的领域特定语言 (DSL)，用于部署 Azure 资源。语法比 ARM 模板更简单，同时可编译为 ARM。

**构建 (Build)**  
编译源代码、安装依赖并准备应用部署的过程。

**蓝绿部署 (Blue-Green Deployment)**  
使用两个相同的生产环境（蓝色和绿色）以最小化停机和风险的部署策略。

## C

**容器应用 (Container Apps)**  
Azure 的无服务器容器服务，实现无需管理复杂基础设施即可运行容器化应用。

**持续集成/持续部署 (CI/CD)**  
通过自动化集成代码变更和部署应用的实践。

**Cosmos DB**  
Azure 的全球分布、多模型数据库服务，提供吞吐量、延迟、可用性及一致性的全面 SLA。

**配置 (Configuration)**  
控制应用行为和部署选项的设置与参数。

## D

**部署 (Deployment)**  
在目标基础设施上安装和配置应用及其依赖的过程。

**Docker**  
使用容器化技术开发、交付和运行应用的平台。

**Dockerfile**  
包含构建 Docker 容器镜像指令的文本文件。

## E

**环境 (Environment)**  
表示应用的特定实例的部署目标（如开发、预发布、生产环境）。

**环境变量 (Environment Variables)**  
以键值对形式存储的配置值，供应用在运行时访问。

**端点 (Endpoint)**  
访问应用或服务的 URL 或网络地址。

## F

**函数应用 (Function App)**  
Azure 的无服务器计算服务，支持运行事件驱动代码，无需管理基础设施。

## G

**GitHub Actions**  
与 GitHub 仓库集成的 CI/CD 平台，实现工作流自动化。

**Git**  
用于跟踪源代码变更的分布式版本控制系统。

## H

**钩子 (Hooks)**  
部署生命周期中特定点执行的自定义脚本或命令（预供应、后供应、预部署、后部署）。

**主机 (Host)**  
部署应用的 Azure 服务类型（如 appservice、containerapp、function）。

## I

**基础设施即代码 (Infrastructure as Code, IaC)**  
通过代码定义和管理基础设施的实践，替代手动操作。

**初始化 (Init)**  
初始化新的 azd 项目过程，通常基于模板。

## J

**JSON**  
JavaScript 对象表示法。常用的数据交换格式，用于配置文件和 API 响应。

**JWT**  
JSON Web 令牌。用于安全地以 JSON 对象形式在各方间传输信息的标准。

## K

**Key Vault**  
Azure 的安全存储和管理机密、密钥及证书的服务。

**Kusto 查询语言 (KQL)**  
用于分析 Azure Monitor、Application Insights 及其他 Azure 服务数据的查询语言。

## L

**负载均衡器 (Load Balancer)**  
将传入网络流量分配到多个服务器或实例的服务。

**日志分析 (Log Analytics)**  
Azure 收集、分析和处理云端及本地环境遥测数据的服务。

## M

**托管身份 (Managed Identity)**  
为 Azure 服务提供自动管理的身份以认证访问其他 Azure 服务的功能。

**微服务 (Microservices)**  
架构方法，将应用构建为一组小型独立服务。

**Monitor**  
Azure 的统一监控解决方案，实现应用和基础设施的全栈可观测性。

## N

**Node.js**  
基于 Chrome V8 引擎的 JavaScript 运行时，用于构建服务器端应用。

**npm**  
Node.js 的包管理器，管理依赖和包。

## O

**输出 (Output)**  
基础设施部署返回的值，可被应用或其他资源使用。

## P

**打包 (Package)**  
准备应用代码和依赖以便部署的过程。

**参数 (Parameters)**  
传入基础设施模板以定制部署的输入值。

**PostgreSQL**  
开源关系数据库系统，Azure 中以托管服务形式支持。

**供应 (Provisioning)**  
创建和配置基础设施模板定义的 Azure 资源的过程。

## Q

**配额 (Quota)**  
Azure 订阅或区域内可创建资源数量的限制。

## R

**资源组 (Resource Group)**  
Azure 资源的逻辑容器，共享生命周期、权限和策略。

**资源令牌 (Resource Token)**  
由 azd 生成的唯一字符串，确保资源名称在部署中唯一。

**REST API**  
使用 HTTP 方法设计网络应用的架构风格。

**回滚 (Rollback)**  
恢复到应用或基础设施配置先前版本的过程。

## S

**服务 (Service)**  
在 azure.yaml 中定义的应用组成部分（如 Web 前端、API 后端、数据库）。

**SKU**  
库存单位，表示 Azure 资源的不同服务层或性能级别。

**SQL 数据库**  
基于 Microsoft SQL Server 的 Azure 托管关系数据库服务。

**静态网站 (Static Web Apps)**  
Azure 基于源代码仓库构建和部署全栈 Web 应用的服务。

**存储账户 (Storage Account)**  
提供 Blob、文件、队列和表等数据对象云存储的 Azure 服务。

**订阅 (Subscription)**  
Azure 账户容器，包含资源组和资源，并关联计费和访问管理。

## T

**模板 (Template)**  
预构建的项目结构，包含应用代码、基础设施定义和常见场景配置。

**Terraform**  
开源基础设施即代码工具，支持包括 Azure 在内的多云供应商。

**流量管理器 (Traffic Manager)**  
Azure 基于 DNS 的流量负载均衡器，用于跨全球 Azure 区域分配流量。

## U

**URI**  
统一资源标识符。识别特定资源的字符串。

**URL**  
统一资源定位符。指定资源位置及获取方式的 URI 类型。

## V

**虚拟网络 (Virtual Network，VNet)**  
Azure 私有网络的基础构件，提供隔离和分段。

**VS Code**  
Visual Studio Code。广受欢迎的代码编辑器，具备出色的 Azure 和 azd 集成。

## W

**Webhook**  
由特定事件触发的 HTTP 回调，常用于 CI/CD 流水线。

**假如 (What-if)**  
Azure 功能，显示部署将做出的更改而不实际执行。

## Y

**YAML**  
YAML 不只是标记语言。用于配置文件如 azure.yaml 的人类可读数据序列化标准。

## Z

**可用区 (Zone)**  
Azure 区域内物理分离的位置，提供冗余和高可用性。

---

## 常用缩写

| 缩写 | 全称 | 说明 |
|---------|-----------|-------------|
| AAD | Azure Active Directory（现 Microsoft Entra ID） | 身份与访问管理服务 |
| ACR | Azure 容器注册中心 | 容器镜像注册服务 |
| AKS | Azure Kubernetes 服务 | 托管 Kubernetes 服务 |
| API | 应用程序编程接口 | 构建软件的协议集 |
| ARM | Azure 资源管理器 | Azure 的部署和管理服务 |
| CDN | 内容分发网络 | 分布式服务器网络 |
| CI/CD | 持续集成/持续部署 | 自动化开发实践 |
| CLI | 命令行界面 | 基于文本的用户界面 |
| DNS | 域名系统 | 将域名转换为 IP 地址的系统 |
| HTTPS | 安全超文本传输协议 | HTTP 的安全版本 |
| IaC | 基础设施即代码 | 通过代码管理基础设施 |
| JSON | JavaScript 对象表示法 | 数据交换格式 |
| JWT | JSON Web 令牌 | 用于安全信息传输的令牌格式 |
| KQL | Kusto 查询语言 | Azure 数据服务查询语言 |
| RBAC | 基于角色的访问控制 | 基于用户角色的访问控制方法 |
| REST | 表述性状态转移 | Web 服务的架构风格 |
| SDK | 软件开发工具包 | 开发工具集合 |
| SLA | 服务水平协议 | 服务可用性/性能承诺 |
| SQL | 结构化查询语言 | 管理关系数据库的语言 |
| SSL/TLS | 安全套接层/传输层安全协议 | 加密协议 |
| URI | 统一资源标识符 | 标识资源的字符串 |
| URL | 统一资源定位符 | 指定资源位置的 URI 类型 |
| VM | 虚拟机 | 计算机系统的仿真 |
| VNet | 虚拟网络 | Azure 中的私有网络 |
| YAML | YAML 不只是标记语言 | 数据序列化标准 |

---

## Azure 服务名称映射

| 通用名 | 官方 Azure 服务名称 | azd 主机类型 |
|-------------|------------------------------|---------------|
| Web 应用 | Azure 应用服务 | `appservice` |
| API 应用 | Azure 应用服务 | `appservice` |
| 容器应用 | Azure 容器应用 | `containerapp` |
| 函数 | Azure Functions | `function` |
| 静态网站 | Azure 静态 Web 应用 | `staticwebapp` |
| 数据库 | Azure PostgreSQL 数据库 | 基础设施资源，不是应用 `host` |
| NoSQL 数据库 | Azure Cosmos DB | 基础设施资源，不是应用 `host` |
| 存储 | Azure 存储账户 | 基础设施资源，不是内置应用 `host` |
| 缓存 | Azure 托管 Redis | 基础设施资源，不是应用 `host` |
| 搜索 | Azure AI 搜索 | 基础设施资源，不是应用 `host` |
| 消息服务 | Azure 服务总线 | 基础设施资源，不是应用 `host` |

`services.<name>.host` 选择应用部署目标；不是任何 Azure 资源类型的简写。数据库、缓存、搜索和队列通常通过基础设施提供程序供应，并通过输出/配置连接至应用。

---

## 特定上下文术语

### 开发术语
- <strong>热重载</strong>：开发时自动更新应用，无需重启
- <strong>构建流水线</strong>：自动化构建和测试代码的流程
- <strong>部署槽</strong>：应用服务中的预发布环境
- <strong>环境一致性</strong>：保持开发、预发布和生产环境相似

### 安全术语
- <strong>托管身份</strong>：Azure 提供的自动凭据管理功能
- **Key Vault**：安全存储机密、密钥和证书
- **RBAC**：Azure 资源的基于角色访问控制
- <strong>网络安全组</strong>：控制网络流量的虚拟防火墙

### 监控术语
- <strong>遥测</strong>：自动收集测量和数据
- **应用性能监控 (APM)**：监测软件性能
- <strong>日志分析</strong>：收集和分析日志数据的服务
- <strong>告警规则</strong>：基于指标或条件的自动通知

### 部署术语
- <strong>蓝绿部署</strong>：零停机部署策略
- <strong>金丝雀发布</strong>：逐步向部分用户推送
- <strong>滚动更新</strong>：顺序替换应用实例
- <strong>回滚</strong>：恢复到先前应用版本

---

<strong>使用提示</strong>：使用 `Ctrl+F` 快速搜索本术语表中特定术语。相关术语已交叉引用。

---

<strong>导航</strong>
- <strong>上一课</strong>：[备忘单](cheat-sheet.md)
- <strong>下一课</strong>：[常见问题解答](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD 基础 - 了解 Azure Developer CLI

# AZD 基础 - 核心概念与基础

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速开始
- **⬅️ 上一章**: [课程概览](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 下一步**: [安装与设置](installation.md)
- **🚀 下一章**: [第2章：以 AI 为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介绍

本课将向您介绍 Azure Developer CLI (azd)，一款强大的命令行工具，可加速您从本地开发到部署到 Azure 的过程。您将学习基本概念、核心功能，并理解 azd 如何简化云原生应用的部署。

## 学习目标

到本课结束时，您将能够：
- 了解 Azure Developer CLI 的定义及其主要用途
- 学习模板、环境和服务的核心概念
- 探索关键功能，包括基于模板的开发和基础设施即代码
- 理解 azd 项目结构和工作流
- 为在开发环境中安装和配置 azd 做好准备

## 学习成果

完成本课后，您将能够：
- 解释 azd 在现代云开发工作流程中的作用
- 确认 azd 项目结构的组成部分
- 描述模板、环境和服务如何协同工作
- 理解使用 azd 实现基础设施即代码的好处
- 识别不同的 azd 命令及其用途

## 什么是 Azure Developer CLI (azd)？

Azure Developer CLI (azd) 是一个旨在加速您从本地开发到 Azure 部署之旅的命令行工具。它简化了在 Azure 上构建、部署和管理云原生应用的过程。

### 🎯 为什么使用 AZD？一个现实世界的对比

让我们对比一下部署带数据库的简单 Web 应用的过程：

#### ❌ 无 AZD：手动在 Azure 上部署（30 分钟以上）

```bash
# 步骤 1：创建资源组
az group create --name myapp-rg --location eastus

# 步骤 2：创建应用服务计划
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# 步骤 3：创建 Web 应用
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# 步骤 4：创建 Cosmos DB 帐户 (10-15 分钟)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# 步骤 5：创建数据库
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# 步骤 6：创建集合
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# 步骤 7：获取连接字符串
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# 步骤 8：配置应用设置
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# 步骤 9：启用日志记录
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# 步骤 10：设置 Application Insights
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# 步骤 11：将 Application Insights 链接到 Web 应用
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# 步骤 12：在本地构建应用程序
npm install
npm run build

# 步骤 13：创建部署包
zip -r app.zip . -x "*.git*" "node_modules/*"

# 步骤 14：部署应用程序
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# 步骤 15：等待并祈祷它能正常运行 🙏
# (没有自动验证，需手动测试)
```

**问题：**
- ❌ 需要记住并按顺序执行 15 个以上的命令
- ❌ 30-45 分钟的手动工作
- ❌ 容易出错（拼写错误、参数错误）
- ❌ 连接字符串会暴露在终端历史记录中
- ❌ 失败时没有自动回滚
- ❌ 团队成员难以复现
- ❌ 每次都不同（不可复现）

#### ✅ 使用 AZD：自动化部署（5 条命令，10-15 分钟）

```bash
# 步骤 1：从模板初始化
azd init --template todo-nodejs-mongo

# 步骤 2：进行身份验证
azd auth login

# 步骤 3：创建环境
azd env new dev

# 步骤 4：预览更改（可选但推荐）
azd provision --preview

# 步骤 5：部署所有内容
azd up

# ✨ 完成！所有内容已部署、配置并受到监控
```

**好处：**
- ✅ **5 条命令** 对比 15+ 条手动步骤
- ✅ **10-15 分钟** 总时间（主要在等待 Azure）
- ✅ **零错误** - 自动化且经过测试
- ✅ **通过 Key Vault 安全管理机密**
- ✅ **失败时自动回滚**
- ✅ **完全可复现** - 每次结果相同
- ✅ **团队就绪** - 任何人都可以使用相同命令进行部署
- ✅ **基础设施即代码** - Bicep 模板纳入版本控制
- ✅ **内置监控** - 自动配置 Application Insights

### 📊 时间与错误降低

| 指标 | 手动部署 | AZD 部署 | 提升 |
|:-------|:------------------|:---------------|:------------|
| **命令数** | 15+ | 5 | 67% 减少 |
| **时间** | 30-45 min | 10-15 min | 60% 更快 |
| **错误率** | ~40% | <5% | 88% 降低 |
| **一致性** | 低（手动） | 100%（自动化） | 完美 |
| **团队入门时间** | 2-4 hours | 30 minutes | 75% 更快 |
| **回滚时间** | 30+ min (manual) | 2 min (automated) | 93% 更快 |

## 核心概念

### 模板
模板是 azd 的基础。它们包含：
- **应用代码** - 您的源代码和依赖项
- **基础设施定义** - 在 Bicep 或 Terraform 中定义的 Azure 资源
- **配置文件** - 设置和环境变量
- **部署脚本** - 自动化部署工作流

### 环境
环境代表不同的部署目标：
- **Development** - 用于测试和开发
- **Staging** - 预生产环境
- **Production** - 生产环境

每个环境维护其自己的：
- Azure 资源组
- 配置设置
- 部署状态

### 服务
服务是应用的构建模块：
- **Frontend** - Web 应用、单页应用（SPA）
- **Backend** - API、微服务
- **Database** - 数据存储解决方案
- **Storage** - 文件和 Blob 存储

## 关键功能

### 1. 基于模板的开发
```bash
# 浏览可用模板
azd template list

# 从模板初始化
azd init --template <template-name>
```

### 2. 基础设施即代码
- **Bicep** - Azure 的领域特定语言
- **Terraform** - 多云基础设施工具
- **ARM Templates** - Azure 资源管理器模板

### 3. 集成工作流
```bash
# 完整的部署工作流
azd up            # 预配 + 部署：首次设置无需人工干预

# 🧪 新功能：在部署前预览基础设施变更（安全）
azd provision --preview    # 在不进行更改的情况下模拟基础设施部署

azd provision     # 创建 Azure 资源；如果你更新基础设施，请使用此操作
azd deploy        # 部署应用代码，或在更新后重新部署应用代码
azd down          # 清理资源
```

#### 🛡️ 使用预览进行安全的基础设施规划
`azd provision --preview` 命令是安全部署的变革性功能：
- **演练分析（Dry-run analysis）** - 显示将被创建、修改或删除的内容
- **零风险** - 不会对您的 Azure 环境进行实际更改
- **团队协作** - 在部署前共享预览结果
- **成本估算** - 在投入前了解资源成本

```bash
# 示例预览工作流程
azd provision --preview           # 查看将要更改的内容
# 审查输出，与团队讨论
azd provision                     # 自信地应用更改
```

### 📊 可视化：AZD 开发工作流

```mermaid
graph LR
    A[azd init] -->|初始化项目| B[azd auth login]
    B -->|身份验证| C[azd env new]
    C -->|创建环境| D{首次部署？}
    D -->|是| E[azd up]
    D -->|否| F[azd provision --preview]
    F -->|查看更改| G[azd provision]
    E -->|配置并部署| H[资源运行中]
    G -->|更新基础设施| H
    H -->|监控| I[azd monitor]
    I -->|修改代码| J[azd deploy]
    J -->|仅重新部署代码| H
    H -->|清理| K[azd down]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```
**工作流说明：**
1. **Init** - 从模板或新建项目开始
2. **Auth** - 与 Azure 进行身份验证
3. **Environment** - 创建隔离的部署环境
4. **Preview** - 🆕 始终先预览基础设施更改（安全做法）
5. **Provision** - 创建/更新 Azure 资源
6. **Deploy** - 推送应用代码
7. **Monitor** - 监控应用性能
8. **Iterate** - 进行更改并重新部署代码
9. **Cleanup** - 完成后移除资源

### 4. 环境管理
```bash
# 创建和管理环境
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 项目结构

典型的 azd 项目结构：
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 配置文件

### azure.yaml
主要的项目配置文件：
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
环境特定的配置：
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 常见工作流与实践练习

> **💡 学习提示：** 按顺序完成这些练习，以循序渐进地提升您的 AZD 技能。

### 🎯 练习1：初始化您的第一个项目

**目标：** 创建一个 AZD 项目并探索其结构

**步骤：**
```bash
# 使用经过验证的模板
azd init --template todo-nodejs-mongo

# 查看生成的文件
ls -la  # 查看所有文件，包括隐藏文件

# 创建的关键文件：
# - azure.yaml (主配置)
# - infra/ (基础设施代码)
# - src/ (应用代码)
```

**✅ 成功：** 您将拥有 azure.yaml、infra/ 和 src/ 目录

---

### 🎯 练习2：部署到 Azure

**目标：** 完成端到端部署

**步骤：**
```bash
# 1. 进行身份验证
az login && azd auth login

# 2. 创建环境
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. 预览更改（推荐）
azd provision --preview

# 4. 部署所有内容
azd up

# 5. 验证部署
azd show    # 查看您的应用 URL
```

**预计时间：** 10-15 分钟  
**✅ 成功：** 应用 URL 在浏览器中打开

---

### 🎯 练习3：多个环境

**目标：** 部署到 dev 和 staging

**步骤：**
```bash
# 已有 dev，创建 staging
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# 在它们之间切换
azd env list
azd env select dev
```

**✅ 成功：** 在 Azure 门户中创建了两个独立的资源组

---

### 🛡️ 清理： `azd down --force --purge`

当您需要完全重置时：

```bash
azd down --force --purge
```

**它的作用：**
- `--force`：不提示确认
- `--purge`：删除所有本地状态和 Azure 资源

**何时使用：**
- 部署中途失败
- 切换项目
- 需要重新开始

---

## 🎪 原始工作流参考

### 启动新项目
```bash
# 方法 1：使用现有模板
azd init --template todo-nodejs-mongo

# 方法 2：从头开始
azd init

# 方法 3：使用当前目录
azd init .
```

### 开发周期
```bash
# 设置开发环境
azd auth login
azd env new dev
azd env select dev

# 部署所有内容
azd up

# 做更改并重新部署
azd deploy

# 完成后清理
azd down --force --purge # Azure Developer CLI 中的该命令是对您环境的 **硬重置**—在排查部署失败、清理孤立资源或为全新重新部署做准备时尤其有用。
```

## 理解 `azd down --force --purge`
`azd down --force --purge` 命令是完全拆除您的 azd 环境及所有相关资源的强大方式。以下是每个标志的说明：
```
--force
```
- 跳过确认提示。
- 适用于自动化或脚本场景，无法进行人工输入时使用。
- 即使 CLI 检测到不一致，也能确保拆除过程不被中断。

```
--purge
```
删除 **所有相关元数据**，包括：
环境状态
本地 `.azure` 文件夹
缓存的部署信息
阻止 azd “记住”之前的部署，这可能会导致资源组不匹配或注册表引用过时等问题。


### 为什么同时使用两者？
当您由于残留状态或部分部署而在运行 `azd up` 时卡住，该组合可确保实现一个 **干净的起点**。

这在您在 Azure 门户中手动删除资源之后，或切换模板、环境或资源组命名约定时尤其有用。


### 管理多个环境
```bash
# 创建暂存环境
azd env new staging
azd env select staging
azd up

# 切换回开发环境
azd env select dev

# 比较环境
azd env list
```

## 🔐 身份验证与凭据

理解身份验证对于成功使用 azd 部署至关重要。Azure 使用多种身份验证方法，azd 利用与其他 Azure 工具相同的凭据链。

### Azure CLI 身份验证 (`az login`)

在使用 azd 之前，您需要进行 Azure 身份验证。最常用的方法是使用 Azure CLI：

```bash
# 交互式登录（打开浏览器）
az login

# 使用指定租户登录
az login --tenant <tenant-id>

# 使用服务主体登录
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# 检查当前登录状态
az account show

# 列出可用订阅
az account list --output table

# 设置默认订阅
az account set --subscription <subscription-id>
```

### 身份验证流程
1. **交互式登录**：打开默认浏览器进行身份验证
2. **设备代码流**：用于没有浏览器访问的环境
3. **服务主体（Service Principal）**：用于自动化和 CI/CD 场景
4. **托管身份（Managed Identity）**：用于托管在 Azure 上的应用

### DefaultAzureCredential 凭据链

`DefaultAzureCredential` 是一种凭据类型，通过以特定顺序自动尝试多个凭据来源来提供简化的身份验证体验：

#### 凭据链顺序
```mermaid
graph TD
    A[默认 Azure 凭据] --> B[环境变量]
    B --> C[工作负载标识]
    C --> D[托管标识]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[交互式浏览器]
```
#### 1. 环境变量
```bash
# 为服务主体设置环境变量
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. 工作负载身份（Kubernetes/GitHub Actions）
自动用于：
- 使用工作负载身份的 Azure Kubernetes Service (AKS)
- 使用 OIDC 联合的 GitHub Actions
- 其他联合身份场景

#### 3. 托管身份
适用于下列 Azure 资源：
- 虚拟机
- 应用服务
- Azure Functions
- 容器实例

```bash
# 检查是否在具有托管标识的 Azure 资源上运行
az account show --query "user.type" --output tsv
# 返回：如果使用托管标识则为 "servicePrincipal"
```

#### 4. 开发工具集成
- **Visual Studio**：自动使用已登录账户
- **VS Code**：使用 Azure Account 扩展的凭据
- **Azure CLI**：使用 `az login` 的凭据（本地开发最常用）

### AZD 身份验证设置

```bash
# 方法 1：使用 Azure CLI（推荐用于开发）
az login
azd auth login  # 使用现有的 Azure CLI 凭据

# 方法 2：直接 azd 身份验证
azd auth login --use-device-code  # 适用于无头环境

# 方法 3：检查身份验证状态
azd auth login --check-status

# 方法 4：注销并重新进行身份验证
azd auth logout
azd auth login
```

### 身份验证最佳实践

#### 本地开发
```bash
# 1. 使用 Azure CLI 登录
az login

# 2. 验证订阅是否正确
az account show
az account set --subscription "Your Subscription Name"

# 3. 使用现有凭据运行 azd
azd auth login
```

#### CI/CD 管道
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### 生产环境
- 在 Azure 资源上运行时使用 **托管身份（Managed Identity）**
- 在自动化场景中使用 **服务主体（Service Principal）**
- 避免在代码或配置文件中存储凭据
- 对于敏感配置，使用 **Azure Key Vault**

### 常见身份验证问题及解决方案

#### 问题：“找不到订阅”
```bash
# 解决方案：设置默认订阅
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### 问题：“权限不足”
```bash
# 解决方案：检查并分配所需角色
az role assignment list --assignee $(az account show --query user.name --output tsv)

# 常见的必需角色：
# - 参与者（用于资源管理）
# - 用户访问管理员（用于角色分配）
```

#### 问题：“令牌已过期”
```bash
# 解决方案：重新验证身份
az logout
az login
azd auth logout
azd auth login
```

### 不同场景下的身份验证

#### 本地开发
```bash
# 个人发展账户
az login
azd auth login
```

#### 团队开发
```bash
# 为组织使用特定租户
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### 多租户场景
```bash
# 切换租户
az login --tenant tenant1.onmicrosoft.com
# 部署到租户 1
azd up

az login --tenant tenant2.onmicrosoft.com  
# 部署到租户 2
azd up
```

### 安全注意事项

1. **凭据存储**：切勿在源代码中存储凭据
2. **权限范围限制**：对服务主体使用最小权限原则
3. **令牌轮换**：定期轮换服务主体的密钥
4. **审计跟踪**：监控身份验证和部署活动
5. **网络安全**：尽可能使用私有端点

### 身份验证故障排除

```bash
# 调试身份验证问题
azd auth login --check-status
az account show
az account get-access-token

# 常用诊断命令
whoami                          # 当前用户上下文
az ad signed-in-user show      # Azure AD 用户详细信息
az group list                  # 测试资源访问
```

## 理解 `azd down --force --purge`

### 发现
```bash
azd template list              # 浏览模板
azd template show <template>   # 模板详情
azd init --help               # 初始化选项
```

### 项目管理
```bash
azd show                     # 项目概述
azd env show                 # 当前环境
azd config list             # 配置设置
```

### 监控
```bash
azd monitor                  # 打开 Azure 门户监控
azd monitor --logs           # 查看应用程序日志
azd monitor --live           # 查看实时指标
azd pipeline config          # 设置 CI/CD
```

## 最佳实践

### 1. 使用有意义的名称
```bash
# 好
azd env new production-east
azd init --template web-app-secure

# 避免
azd env new env1
azd init --template template1
```

### 2. 利用模板
- 从现有模板开始
- 根据需求自定义
- 为组织创建可重用的模板

### 3. 环境隔离
- 为 dev/staging/prod 使用独立环境
- 切勿直接从本地机器部署到生产环境
- 使用 CI/CD 管道进行生产部署

### 4. 配置管理
- 对于敏感数据使用环境变量
- 将配置保存在版本控制中
- 记录特定环境的设置

## 学习进阶

### 初级（第1-2周）
1. 安装 azd 并进行身份验证
2. 部署一个简单模板
3. 理解项目结构
4. 学习基本命令（up、down、deploy）

### 中级（第3-4周）
1. 自定义模板
2. 管理多个环境
3. 理解基础设施代码
4. 配置 CI/CD 管道

### 高级（第5周及以后）
1. 创建自定义模板
2. 高级基础设施模式
3. 多区域部署
4. 企业级配置

## 下一步

**📖 继续第1章学习：**
- [安装与设置](installation.md) - 获取并配置 azd
- [您的第一个项目](first-project.md) - 完整的动手教程
- [配置指南](configuration.md) - 高级配置选项

**🎯 准备好进入下一章了吗？**
- [第2章：以 AI 为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md) - 开始构建 AI 应用

## 其他资源

- [Azure Developer CLI 概述](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [模板库](https://azure.github.io/awesome-azd/)
- [社区示例](https://github.com/Azure-Samples)

---

## 🙋 常见问题解答

### 常规问题

**问：AZD 和 Azure CLI 有什么区别？**

答：Azure CLI (`az`) 用于管理单个 Azure 资源。AZD (`azd`) 用于管理整个应用程序：

```bash
# Azure CLI - 低级别资源管理
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...还需要更多命令

# AZD - 应用级别管理
azd up  # 部署整个应用及其所有资源
```

**可以这样理解：**
- `az` = 操作单个乐高积木
- `azd` = 处理完整的乐高套装

---

**问：使用 AZD 是否需要了解 Bicep 或 Terraform？**

答：不需要！从模板开始：
```bash
# 使用现有模板 - 无需基础设施即代码（IaC）知识
azd init --template todo-nodejs-mongo
azd up
```

您可以稍后学习 Bicep 来自定义基础设施。模板提供可用的示例以供学习。

---

**问：运行 AZD 模板需要多少费用？**

答：费用因模板而异。大多数开发模板费用为每月 $50-150：

```bash
# 在部署前预览费用
azd provision --preview

# 不使用时始终清理
azd down --force --purge  # 删除所有资源
```

**小贴士：**在可用时使用免费层：
- App Service: F1 (Free) tier
- Azure OpenAI: 50,000 tokens/month free
- Cosmos DB: 1000 RU/s free tier

---

**问：我可以将 AZD 与现有的 Azure 资源一起使用吗？**

答：可以，但从头开始更容易。当 AZD 管理完整生命周期时效果最好。对于现有资源：

```bash
# 选项 1：导入现有资源（高级）
azd init
# 然后修改 infra/ 以引用现有资源

# 选项 2：从头开始（推荐）
azd init --template matching-your-stack
azd up  # 创建新环境
```

---

**问：如何与团队成员共享我的项目？**

答：将 AZD 项目提交到 Git（但不要提交 `.azure` 文件夹）：

```bash
# 默认已包含在 .gitignore 中
.azure/        # 包含机密和环境数据
*.env          # 环境变量

# 团队成员：
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

所有人都会从相同的模板获得相同的基础设施。

---

### 故障排除问题

**问：“azd up” 在中途失败。我该怎么办？**

答：检查错误，修复后重试：

```bash
# 查看详细日志
azd show

# 常见修复：

# 1. 如果配额超限：
azd env set AZURE_LOCATION "westus2"  # 尝试不同的区域

# 2. 如果资源名称冲突：
azd down --force --purge  # 清理干净
azd up  # 重试

# 3. 如果认证已过期：
az login
azd auth login
azd up
```

**最常见的问题：** 选择了错误的 Azure 订阅
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**问：如何仅部署代码更改而不重新配置资源？**

答：使用 `azd deploy` 而不是 `azd up`：

```bash
azd up          # 首次：预配 + 部署 (慢)

# 进行代码更改...

azd deploy      # 后续：仅部署 (快)
```

速度比较：
- `azd up`: 10-15 分钟（配置基础设施）
- `azd deploy`: 2-5 分钟（仅代码）

---

**问：我可以自定义基础设施模板吗？**

答：可以！编辑 `infra/` 中的 Bicep 文件：

```bash
# 运行 azd init 之后
cd infra/
code main.bicep  # 在 VS Code 中编辑

# 预览更改
azd provision --preview

# 应用更改
azd provision
```

**提示：**从小处开始 - 先更改 SKUs：
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**问：如何删除 AZD 创建的所有内容？**

答：一个命令可删除所有资源：

```bash
azd down --force --purge

# 这将删除：
# - 所有 Azure 资源
# - 资源组
# - 本地环境状态
# - 缓存的部署数据
```

**在以下情况下始终运行此命令：**
- 完成模板测试
- 切换到不同的项目
- 想重新开始

**节省成本：** 删除未使用的资源 = $0 费用

---

**问：如果我在 Azure 门户意外删除了资源怎么办？**

答：AZD 的状态可能会不同步。清理并重建的方法：

```bash
# 1. 删除本地状态
azd down --force --purge

# 2. 从头开始
azd up

# 可选：让 AZD 检测并修复
azd provision  # 会创建缺失的资源
```

---

### 高级问题

**问：我可以在 CI/CD 管道中使用 AZD 吗？**

答：可以！这是 GitHub Actions 示例：

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**问：如何处理密钥和敏感数据？**

答：AZD 会自动与 Azure Key Vault 集成：

```bash
# 机密存储在 Key Vault 中，而不是在代码中
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD 自动执行：
# 1. 创建 Key Vault
# 2. 存储机密
# 3. 通过托管身份授予应用访问权限
# 4. 在运行时注入
```

**切勿提交：**
- `.azure/` 文件夹（包含环境数据）
- `.env` 文件（本地机密）
- 连接字符串

---

**问：我可以部署到多个区域吗？**

答：可以，为每个区域创建一个环境：

```bash
# 美国东部环境
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# 西欧环境
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# 每个环境相互独立
azd env list
```

对于真正的多区域应用，请自定义 Bicep 模板以同时部署到多个区域。

---

**问：如果我遇到困难，在哪里可以寻求帮助？**

1. **AZD 文档：** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub 问题：** https://github.com/Azure/azure-dev/issues
3. **Discord：** [Azure Discord](https://discord.gg/microsoft-azure) - #azure-developer-cli 频道
4. **Stack Overflow：** 标签 `azure-developer-cli`
5. **本课程：** [故障排除指南](../chapter-07-troubleshooting/common-issues.md)

**小贴士：**在提问前，运行：
```bash
azd show       # 显示当前状态
azd version    # 显示你的版本
```
在您的问题中包含这些信息以获得更快的帮助。

---

## 🎓 接下来做什么？

您现在已了解 AZD 基础。请选择您的路径：

### 🎯 面向初学者：
1. **接下来：** [安装与设置](installation.md) - 在您的机器上安装 AZD
2. **然后：** [您的第一个项目](first-project.md) - 部署您的第一个应用
3. **练习：** 完成本课的全部 3 个练习

### 🚀 面向 AI 开发者：
1. **跳转到：** [第2章：以 AI 为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **部署：** 从 `azd init --template get-started-with-ai-chat` 开始
3. **学习：** 在部署的同时构建

### 🏗️ 面向有经验的开发者：
1. **查看：** [配置指南](configuration.md) - 高级设置
2. **探索：** [基础设施即代码](../chapter-04-infrastructure/provisioning.md) - Bicep 深入解析
3. **构建：** 为您的技术栈创建自定义模板

---

**章节导航：**
- **📚 课程主页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速开始  
- **⬅️ 上一页**: [课程概览](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 下一页**: [安装与设置](installation.md)
- **🚀 下一章**: [第2章：以 AI 为先的开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：
本文件使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。我们尽力确保准确性，但请注意，自动翻译可能存在错误或不准确之处。原始语言的文件应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
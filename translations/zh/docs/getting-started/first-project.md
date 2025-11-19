<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-19T09:52:52+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "zh"
}
-->
# 您的第一个项目 - 实操教程

**章节导航：**
- **📚 课程主页**: [AZD 初学者指南](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一节**: [安装与设置](installation.md)
- **➡️ 下一节**: [配置](configuration.md)
- **🚀 下一章**: [第2章：AI优先开发](../microsoft-foundry/microsoft-foundry-integration.md)

## 简介

欢迎来到您的第一个 Azure Developer CLI 项目！本全面的实操教程将带您完整体验如何使用 azd 在 Azure 上创建、部署和管理一个全栈应用程序。您将使用一个真实的待办事项应用程序，该应用包括 React 前端、Node.js API 后端和 MongoDB 数据库。

## 学习目标

完成本教程后，您将能够：
- 掌握使用模板初始化 azd 项目的工作流程
- 理解 Azure Developer CLI 项目的结构和配置文件
- 执行完整的应用程序部署到 Azure，包括基础设施的配置
- 实现应用程序更新和重新部署策略
- 管理开发和测试的多环境
- 应用资源清理和成本管理实践

## 学习成果

完成后，您将能够：
- 独立从模板初始化和配置 azd 项目
- 有效地导航和修改 azd 项目结构
- 使用单条命令将全栈应用程序部署到 Azure
- 排查常见的部署问题和身份验证问题
- 管理不同部署阶段的多个 Azure 环境
- 为应用程序更新实施持续部署工作流

## 开始

### 前置条件清单
- ✅ 已安装 Azure Developer CLI ([安装指南](installation.md))
- ✅ 已安装并认证 Azure CLI
- ✅ 系统中已安装 Git
- ✅ Node.js 16+（适用于本教程）
- ✅ 推荐使用 Visual Studio Code

### 验证您的设置
```bash
# Check azd installation
azd version
```
### 验证 Azure 身份认证

```bash
az account show
```

### 检查 Node.js 版本
```bash
node --version
```

## 第1步：选择并初始化模板

让我们从一个流行的待办事项应用模板开始，该模板包括 React 前端和 Node.js API 后端。

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### 刚刚发生了什么？
- 将模板代码下载到您的本地目录
- 创建了一个包含服务定义的 `azure.yaml` 文件
- 在 `infra/` 目录中设置了基础设施代码
- 创建了环境配置

## 第2步：探索项目结构

让我们检查 azd 为我们创建了什么：

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

您应该看到：
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### 需要理解的关键文件

**azure.yaml** - azd 项目的核心：
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - 基础设施定义：
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 第3步：自定义您的项目（可选）

在部署之前，您可以自定义应用程序：

### 修改前端
```bash
# Open the React app component
code src/web/src/App.tsx
```

进行一个简单的更改：
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### 配置环境变量
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 第4步：部署到 Azure

现在到了激动人心的部分——将所有内容部署到 Azure！

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### 部署期间发生了什么？

`azd up` 命令执行以下步骤：
1. **配置** (`azd provision`) - 创建 Azure 资源
2. **打包** - 构建您的应用程序代码
3. **部署** (`azd deploy`) - 将代码部署到 Azure 资源

### 预期输出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 第5步：测试您的应用程序

### 访问您的应用程序
点击部署输出中提供的 URL，或者随时获取：
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### 测试待办事项应用
1. **添加待办事项** - 点击“添加待办事项”并输入任务
2. **标记为完成** - 勾选已完成的项目
3. **删除项目** - 移除不再需要的待办事项

### 监控您的应用程序
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 第6步：进行更改并重新部署

让我们做一个更改，看看更新有多简单：

### 修改 API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

添加一个自定义响应头：
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 仅部署代码更改
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 第7步：管理多个环境

创建一个测试环境，在生产之前测试更改：

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### 环境比较
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 第8步：清理资源

完成实验后，清理资源以避免持续费用：

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## 您学到了什么

恭喜！您已成功：
- ✅ 从模板初始化了一个 azd 项目
- ✅ 探索了项目结构和关键文件
- ✅ 将全栈应用程序部署到 Azure
- ✅ 进行了代码更改并重新部署
- ✅ 管理了多个环境
- ✅ 清理了资源

## 🎯 技能验证练习

### 练习1：部署不同的模板（15分钟）
**目标**：展示对 azd 初始化和部署工作流程的掌握

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verify deployment
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Clean up
azd down --force --purge
```

**成功标准：**
- [ ] 应用程序部署无错误
- [ ] 能在浏览器中访问应用程序 URL
- [ ] 应用程序功能正常（添加/删除待办事项）
- [ ] 成功清理了所有资源

### 练习2：自定义配置（20分钟）
**目标**：练习环境变量配置

```bash
cd my-first-azd-app

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Deploy with custom config
azd up
```

**成功标准：**
- [ ] 成功创建了自定义环境
- [ ] 环境变量已设置并可检索
- [ ] 应用程序使用自定义配置成功部署
- [ ] 能在已部署的应用中验证自定义设置

### 练习3：多环境工作流（25分钟）
**目标**：掌握环境管理和部署策略

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功标准：**
- [ ] 创建了两个具有不同配置的环境
- [ ] 两个环境均成功部署
- [ ] 能使用 `azd env select` 在环境之间切换
- [ ] 环境变量在不同环境中有所不同
- [ ] 成功清理了两个环境

## 📊 您的进度

**投入时间**: ~60-90分钟  
**掌握技能**:
- ✅ 基于模板的项目初始化
- ✅ Azure 资源配置
- ✅ 应用程序部署工作流
- ✅ 环境管理
- ✅ 配置管理
- ✅ 资源清理和成本管理

**下一步**: 您已准备好学习 [配置指南](configuration.md)，了解高级配置模式！

## 常见问题排查

### 身份认证错误
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### 部署失败
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### 资源名称冲突
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### 端口/网络问题
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 下一步

完成第一个项目后，探索以下高级主题：

### 1. 自定义基础设施
- [基础设施即代码](../deployment/provisioning.md)
- [添加数据库、存储和其他服务](../deployment/provisioning.md#adding-services)

### 2. 设置 CI/CD
- [GitHub Actions 集成](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. 生产环境最佳实践
- [安全配置](../deployment/best-practices.md#security)
- [性能优化](../deployment/best-practices.md#performance)
- [监控和日志记录](../deployment/best-practices.md#monitoring)

### 4. 探索更多模板
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 其他资源

### 学习资料
- [Azure Developer CLI 文档](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 架构中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架构框架](https://learn.microsoft.com/en-us/azure/well-architected/)

### 社区与支持
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure 开发者社区](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 模板与示例
- [官方模板库](https://azure.github.io/awesome-azd/)
- [社区模板](https://github.com/Azure-Samples/azd-templates)
- [企业模式](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜您完成了第一个 azd 项目！** 您现在可以自信地在 Azure 上构建和部署出色的应用程序。

---

**章节导航：**
- **📚 课程主页**: [AZD 初学者指南](../../README.md)
- **📖 当前章节**: 第1章 - 基础与快速入门
- **⬅️ 上一节**: [安装与设置](installation.md)
- **➡️ 下一节**: [配置](configuration.md)
- **🚀 下一章**: [第2章：AI优先开发](../microsoft-foundry/microsoft-foundry-integration.md)
- **下一课**: [部署指南](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
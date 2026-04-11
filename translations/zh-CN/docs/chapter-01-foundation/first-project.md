# 你的第一个项目 - 实践教程

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章**: 第1章 - 基础与快速开始
- **⬅️ 上一节**: [安装与设置](installation.md)
- **➡️ 下一节**: [配置](configuration.md)
- **🚀 下一章**: [第2章：AI优先开发](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 介绍

欢迎来到你的第一个 Azure Developer CLI 项目！本综合实践教程将完整演示如何使用 azd 在 Azure 上创建、部署和管理一个全栈应用。你将使用一个真实的待办（todo）应用，该应用包含 React 前端、Node.js API 后端和 MongoDB 数据库。

## 学习目标

完成本教程后，你将能够：
- 掌握使用模板初始化 azd 项目的工作流程
- 理解 Azure Developer CLI 项目结构和配置文件
- 执行将应用完整部署到 Azure 的操作并预配基础设施
- 实施应用更新和重新部署策略
- 管理用于开发和暂存的多个环境
- 应用资源清理和成本管理实践

## 学习成果

完成后，你将能够：
- 独立从模板初始化并配置 azd 项目
- 有效浏览并修改 azd 项目结构
- 使用单条命令将全栈应用部署到 Azure
- 排查常见部署问题和身份验证问题
- 管理不同部署阶段的多个 Azure 环境
- 为应用更新实现持续部署工作流

## 开始

### 先决条件清单
- ✅ 已安装 Azure Developer CLI（[安装指南](installation.md)）
- ✅ 已通过 `azd auth login` 完成 azd 身份验证
- ✅ 已在系统上安装 Git
- ✅ Node.js 16+（本教程要求）
- ✅ 推荐使用 Visual Studio Code

在继续之前，请从仓库根目录运行设置验证器：

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### 验证您的设置
```bash
# 检查 azd 是否已安装
azd version

# 检查 AZD 身份验证
azd auth login --check-status
```

### 验证可选的 Azure CLI 认证

```bash
az account show
```

### 检查 Node.js 版本
```bash
node --version
```

## 第1步：选择并初始化模板

让我们从一个流行的待办（todo）应用模板开始，该模板包含 React 前端和 Node.js API 后端。

```bash
# 浏览可用模板
azd template list

# 初始化待办应用模板
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 按照提示:
# - 输入环境名称: "dev"
# - 选择订阅 (如果你有多个)
# - 选择区域: "East US 2" (或你首选的区域)
```

### 发生了什么？
- 已将模板代码下载到本地目录
- 已创建包含服务定义的 `azure.yaml` 文件
- 已在 `infra/` 目录中设置基础设施代码
- 已创建一个环境配置

## 第2步：浏览项目结构

让我们检查 azd 为我们创建的内容：

```bash
# 查看项目结构
tree /f   # Windows
# 或
find . -type f | head -20   # macOS/Linux
```

您应该会看到：
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

**azure.yaml** - 你的 azd 项目的核心：
```bash
# 查看项目配置
cat azure.yaml
```

**infra/main.bicep** - 基础设施定义：
```bash
# 查看基础设施代码
head -30 infra/main.bicep
```

## 第3步：自定义您的项目（可选）

在部署之前，您可以自定义应用程序：

### 修改前端
```bash
# 打开 React 应用的组件
code src/web/src/App.tsx
```

做一个简单更改：
```typescript
// 查找标题并更改它
<h1>My Awesome Todo App</h1>
```

### 配置环境变量
```bash
# 设置自定义环境变量
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 查看所有环境变量
azd env get-values
```

## 第4步：部署到 Azure

现在进入令人兴奋的部分 - 将所有内容部署到 Azure！

```bash
# 部署基础设施和应用程序
azd up

# 此命令将：
# 1. 预配 Azure 资源（应用服务、Cosmos DB 等）
# 2. 构建您的应用程序
# 3. 部署到已预配的资源
# 4. 显示应用程序的 URL
```

### 部署期间发生了什么？

`azd up` 命令执行以下步骤：
1. **Provision** (`azd provision`) - 创建 Azure 资源
2. **Package** - 构建您的应用程序代码
3. **Deploy** (`azd deploy`) - 将代码部署到 Azure 资源

### 预期输出
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 第5步：测试您的应用

### 访问您的应用
点击部署输出中提供的 URL，或随时获取它：
```bash
# 获取应用程序端点
azd show

# 在浏览器中打开该应用程序
azd show --output json | jq -r '.services.web.endpoint'
```

### 测试待办（Todo）应用
1. <strong>添加待办项</strong> - 点击 "添加待办" 并输入一个任务
2. <strong>标记为完成</strong> - 选中已完成的项
3. <strong>删除项目</strong> - 删除不再需要的待办项

### 监视您的应用
```bash
# 为你的资源打开 Azure 门户
azd monitor

# 查看应用程序日志
azd monitor --logs

# 查看实时指标
azd monitor --live
```

## 第6步：进行更改并重新部署

让我们进行一次更改，看看更新有多简单：

### 修改 API
```bash
# 编辑 API 代码
code src/api/src/routes/lists.js
```

添加自定义响应头：
```javascript
// 找到一个路由处理器并添加：
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 仅部署代码更改
```bash
# 仅部署应用程序代码（跳过基础设施）
azd deploy

# 由于基础设施已存在，这比 'azd up' 快得多
```

## 第7步：管理多个环境

创建一个暂存环境以在生产之前测试更改：

```bash
# 创建一个新的暂存环境
azd env new staging

# 部署到暂存环境
azd up

# 切换回开发环境
azd env select dev

# 列出所有环境
azd env list
```

### 环境比较
```bash
# 查看开发环境
azd env select dev
azd show

# 查看预发布环境
azd env select staging
azd show
```

## 第8步：清理资源

完成试验后，请清理资源以避免持续费用：

```bash
# 删除当前环境的所有 Azure 资源
azd down

# 强制删除且不进行确认，并清除软删除的资源
azd down --force --purge

# 删除指定环境
azd env select staging
azd down --force --purge
```

## 经典应用 与 AI 驱动应用：相同的工作流

你刚刚部署了一个传统的 Web 应用。但是如果你想部署一个 AI 驱动的应用——比如一个由 Microsoft Foundry 模型支持的聊天应用——会怎样？

好消息是：**工作流是相同的。**

| 步骤 | 经典待办应用 | AI 聊天应用 |
|------|--------------|-------------|
| 初始化 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 认证 | `azd auth login` | `azd auth login` |
| 部署 | `azd up` | `azd up` |
| 监控 | `azd monitor` | `azd monitor` |
| 清理 | `azd down --force --purge` | `azd down --force --purge` |

唯一的区别是你开始时选择的 <strong>模板</strong>。AI 模板包含额外的基础设施（例如 Microsoft Foundry Models 资源或 AI Search 索引），但 azd 会为你处理所有这些。你无需学习新的命令、采用不同的工具或改变部署思路。

这是 azd 的核心原则：**一个工作流，适用于任何工作负载。** 你在本教程中练习的技能——初始化、部署、监控、重新部署和清理——同样适用于 AI 应用和代理。

---

## 你学到了什么

恭喜！你已成功：
- ✅ 从模板初始化 azd 项目
- ✅ 浏览项目结构和关键文件
- ✅ 将全栈应用部署到 Azure
- ✅ 进行代码更改并重新部署
- ✅ 管理多个环境
- ✅ 清理资源

## 🎯 技能验证练习

### 练习 1：部署不同的模板（15 分钟）
<strong>目标</strong>：展示对 `azd init` 和部署工作流的掌握

```bash
# 尝试 Python + MongoDB 技术栈
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# 验证部署
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# 清理
azd down --force --purge
```

**成功标准：**
- [ ] 应用部署无错误
- [ ] 能在浏览器中访问应用 URL
- [ ] 应用功能正常（添加/删除待办）
- [ ] 成功清理所有资源

### 练习 2：自定义配置（20 分钟）
<strong>目标</strong>：练习环境变量配置

```bash
cd my-first-azd-app

# 创建自定义环境
azd env new custom-config

# 设置自定义变量
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# 验证变量
azd env get-values | grep APP_TITLE

# 使用自定义配置部署
azd up
```

**成功标准：**
- [ ] 自定义环境创建成功
- [ ] 环境变量已设置且可检索
- [ ] 应用以自定义配置成功部署
- [ ] 能在已部署应用中验证自定义设置

### 练习 3：多环境工作流（25 分钟）
<strong>目标</strong>：掌握环境管理和部署策略

```bash
# 创建开发环境
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 记录开发环境的 URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 创建预发布环境
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 记录预发布环境的 URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 比较两个环境
azd env list

# 测试两个环境
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 清理两个环境
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**成功标准：**
- [ ] 创建了两个具有不同配置的环境
- [ ] 两个环境均已成功部署
- [ ] 能使用 `azd env select` 在环境间切换
- [ ] 环境间的环境变量不同
- [ ] 成功清理了两个环境

## 📊 你的进度

<strong>投入时间</strong>：~60-90 分钟  
<strong>掌握的技能</strong>：
- ✅ 基于模板的项目初始化
- ✅ Azure 资源预配
- ✅ 应用部署工作流
- ✅ 环境管理
- ✅ 配置管理
- ✅ 资源清理和成本管理

<strong>下一阶段</strong>：你已准备好前往 [配置指南](configuration.md) 学习高级配置模式！

## 常见问题排查

### 认证错误
```bash
# 重新对 Azure 进行身份验证
az login

# 验证订阅访问权限
az account show
```

### 部署失败
```bash
# 启用调试日志记录
export AZD_DEBUG=true
azd up --debug

# 在 Azure 中查看应用程序日志
azd monitor --logs

# 对于 Container Apps，请使用 Azure CLI：
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 资源名称冲突
```bash
# 使用唯一的环境名称
azd env new dev-$(whoami)-$(date +%s)
```

### 端口/网络问题
```bash
# 检查端口是否可用
netstat -an | grep :3000
netstat -an | grep :3100
```

## 后续步骤

完成第一个项目后，请探索这些高级主题：

### 1. 自定义基础设施
- [基础设施即代码](../chapter-04-infrastructure/provisioning.md)
- [添加数据库、存储和其他服务](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. 设置 CI/CD
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 完整的 CI/CD 工作流
- [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 管道配置

### 3. 生产环境最佳实践
- [部署指南](../chapter-04-infrastructure/deployment-guide.md) - 安全性、性能和监控

### 4. 探索更多模板
```bash
# 按类别浏览模板
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 尝试不同的技术栈
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 附加资源

### 学习材料
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
- [企业范例](https://github.com/Azure/azure-dev/tree/main/templates)

---

**恭喜你完成了第一个 azd 项目！** 现在你已准备好自信地在 Azure 上构建和部署精彩的应用。

---

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章**: 第1章 - 基础与快速开始
- **⬅️ 上一节**: [安装与设置](installation.md)
- **➡️ 下一节**: [配置](configuration.md)
- **🚀 下一章**: [第2章：AI优先开发](../chapter-02-ai-development/microsoft-foundry-integration.md)
- <strong>下一个课程</strong>: [部署指南](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始文件的原文应被视为权威来源。对于关键信息，建议采用专业人工翻译。我们不对因使用本翻译而产生的任何误解或误释承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
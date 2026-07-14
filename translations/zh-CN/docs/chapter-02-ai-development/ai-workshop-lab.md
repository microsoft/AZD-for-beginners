# AI 研讨会实验室：让您的 AI 解决方案可 AZD 部署

**章节导航：**
- **📚 课程首页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第 2 章 - AI 优先开发
- **⬅️ 上一章**：[AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生产 AI 最佳实践](production-ai-practices.md)
- **🚀 下一章节**：[第 3 章：配置](../chapter-03-configuration/configuration.md)

## 研讨会概览

这个动手实验指导开发者通过使用 Azure Developer CLI (AZD) 部署现有的 AI 模板的流程。你将学习使用 Microsoft Foundry 服务进行生产级 AI 部署的关键模式。

> **验证说明（2026-07-13）：** 本研讨会已针对 `azd` 版本 `1.27.1` 进行审核。如果您本地安装较旧，请在开始之前更新 AZD，以确保身份验证、模板和部署流程匹配以下步骤。

**时长：** 2-3 小时  
**难度等级：** 中级  
**先决条件：** 基础 Azure 知识，熟悉 AI/ML 概念

## 🎓 学习目标

本研讨会结束后，您将能够：
- ✅ 将现有 AI 应用转换为使用 AZD 模板
- ✅ 使用 AZD 配置 Microsoft Foundry 服务
- ✅ 实现 AI 服务的安全凭据管理
- ✅ 部署具备监控功能的生产级 AI 应用
- ✅ 排查常见的 AI 部署问题

## 先决条件

### 必备工具
- 安装 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 安装 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 安装 [Git](https://git-scm.com/)
- 代码编辑器（推荐 VS Code）

### Azure 资源
- 具有贡献者访问权限的 Azure 订阅
- 访问 Microsoft Foundry Models 服务权限（或能够申请访问）
- 创建资源组权限

### 知识先决
- 基础 Azure 服务理解
- 熟悉命令行界面
- 基础 AI/ML 概念（API、模型、提示）

## 实验室环境搭建

### 第 1 步：环境准备

1. **验证工具安装：**
```bash
# 检查 AZD 安装情况
azd version

# 检查 Azure CLI
az --version

# 登录 Azure 以进行 AZD 工作流程
azd auth login

# 只有在计划在诊断期间运行 az 命令时才登录 Azure CLI
az login
```

如果您跨多个租户工作或订阅没有自动检测到，请重试运行 `azd auth login --tenant-id <tenant-id>`。

2. **克隆研讨会仓库：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模块 1：理解 AI 应用的 AZD 结构

### AI AZD 模板剖析

探索 AI 就绪 AZD 模板中的关键文件：

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **实验 1.1：探索配置**

1. **检查 azure.yaml 文件：**
```bash
cat azure.yaml
```

**关注重点：**
- AI 组件的服务定义
- 环境变量映射
- 主机配置

2. **审查 main.bicep 基础设施：**
```bash
cat infra/main.bicep
```

**识别的关键 AI 模式：**
- Microsoft Foundry Models 服务资源配置
- 集成 Azure AI 搜索
- 安全密钥管理
- 网络安全配置

### **讨论点：** 为什么这些模式对 AI 很重要

- <strong>服务依赖关系</strong>：AI 应用通常需要多服务协调
- <strong>安全性</strong>：API 密钥和端点需安全管理
- <strong>可扩展性</strong>：AI 工作负载有独特的扩展需求
- <strong>成本管理</strong>：AI 服务若配置不当，成本可能很高

## 模块 2：部署您的首个 AI 应用

### 第 2.1 步：初始化环境

1. **创建新 AZD 环境：**
```bash
azd env new myai-workshop
```

2. **设置必要参数：**
```bash
# 设置您首选的 Azure 区域
azd env set AZURE_LOCATION eastus

# 可选：设置特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 第 2.2 步：部署基础设施和应用

1. **使用 AZD 部署：**
```bash
azd up
```

**`azd up` 执行步骤：**
- ✅ 配置 Microsoft Foundry Models 服务
- ✅ 创建 Azure AI 搜索服务
- ✅ 设置 App Service 托管 Web 应用
- ✅ 配置网络和安全
- ✅ 部署应用代码
- ✅ 设置监控和日志

2. <strong>监控部署进程</strong> 并记录创建的资源情况。

### 第 2.3 步：验证部署

1. **检查已部署资源：**
```bash
azd show
```

2. **打开已部署的应用：**
```bash
azd show
```

打开 `azd show` 输出中显示的 Web 端点。

3. **测试 AI 功能：**
   - 访问 Web 应用
   - 试用示例查询
   - 验证 AI 响应是否正常

### **实验 2.1：故障排查练习**

<strong>场景</strong>：您部署成功，但 AI 没有响应。

**常见检查点：**
1. **OpenAI API 密钥**：确认设置正确
2. <strong>模型可用性</strong>：确认您的区域是否支持该模型
3. <strong>网络连接</strong>：确保服务间通信正常
4. **RBAC 权限**：验证应用是否可访问 OpenAI

**调试命令：**
```bash
# 检查环境变量
azd env get-values

# 查看部署日志
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 检查 OpenAI 部署状态
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模块 3：定制您的 AI 应用

### 第 3.1 步：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 更改为不同的模型（如果您所在地区有的话）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```

2. **添加额外 AI 服务：**

编辑 `infra/main.bicep` 以添加文档智能：

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### 第 3.2 步：环境特定配置

<strong>最佳实践</strong>：开发和生产环境应有不同配置。

1. **创建生产环境：**
```bash
azd env new myai-production
```

2. **设置生产特定参数：**
```bash
# 生产通常使用更高级别的SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 启用额外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **实验 3.1：成本优化**

<strong>挑战</strong>：配置模板，实现成本效益的开发环境。

**任务：**
1. 确定哪些 SKU 可以设置为免费/基础层
2. 配置环境变量以实现最低成本
3. 部署并与生产配置成本比较

**解决方案提示：**
- 尽可能使用 Azure AI 服务的 F0（免费）层
- 开发时为搜索服务使用基础层
- 考虑使用 Consumption 计划托管函数

## 模块 4：安全与生产最佳实践

### 第 4.1 步：安全凭据管理

<strong>当前挑战</strong>：许多 AI 应用将 API 密钥硬编码或使用不安全存储。

**AZD 解决方案**：托管身份 + Key Vault 集成。

1. **查看模板中的安全配置：**
```bash
# 查找密钥保管库和托管身份配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **验证托管身份功能：**
```bash
# 检查网络应用程序是否具有正确的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：网络安全

1. <strong>启用私有端点</strong>（如果尚未配置）：

添加到您的 bicep 模板：
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### 第 4.3 步：监控与可观测性

1. **配置 Application Insights：**
```bash
# 应用程序洞察应自动配置
# 检查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **设置 AI 专用监控：**

添加 AI 运行的自定义指标：
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **实验 4.1：安全审核**

<strong>任务</strong>：审核您的部署安全最佳实践。

**检查清单：**
- [ ] 代码或配置中无硬编码密钥
- [ ] 使用托管身份进行服务间身份验证
- [ ] Key Vault 存储敏感配置
- [ ] 对网络访问进行恰当限制
- [ ] 启用监控和日志记录

## 模块 5：转换您自己的 AI 应用

### 第 5.1 步：评估工作表

<strong>转换应用前</strong>，回答这些问题：

1. **应用架构：**
   - 您的应用使用哪些 AI 服务？
   - 需要哪些计算资源？
   - 是否需要数据库？
   - 服务间依赖关系是什么？

2. **安全需求：**
   - 应用处理哪些敏感数据？
   - 有哪些合规要求？
   - 是否需要私有网络？

3. **扩展需求：**
   - 预期负载是多少？
   - 是否需要自动扩缩？
   - 有区域限制吗？

### 第 5.2 步：创建您的 AZD 模板

**按照此模式转换您的应用：**

1. **创建基本结构：**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# 初始化 AZD 模板
azd init --template minimal
```

2. **创建 azure.yaml：**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **创建基础设施模板：**

**infra/main.bicep** - 主模板：
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI 模块：
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **实验 5.1：模板创建挑战**

<strong>挑战</strong>：为文档处理 AI 应用创建 AZD 模板。

**需求：**
- 使用 Microsoft Foundry Models 进行内容分析
- 文档智能 OCR
- 用于文档上传的存储帐户
- 处理逻辑的函数应用
- 用户界面的 Web 应用

**加分项：**
- 增加适当的错误处理
- 包括成本估算
- 设置监控仪表盘

## 模块 6：故障排查常见问题

### 常见部署问题

#### 问题 1：OpenAI 服务配额超限
**症状：** 部署失败，提示配额错误
**解决方案：**
```bash
# 检查当前配额
az cognitiveservices usage list --location eastus

# 请求增加配额或尝试不同区域
azd env set AZURE_LOCATION westus2
azd up
```

#### 问题 2：模型在区域不可用
**症状：** AI 响应失败或模型部署错误
**解决方案：**
```bash
# 按地区检查模型可用性
az cognitiveservices model list --location eastus

# 更新为可用模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 问题 3：权限问题
**症状：** 调用 AI 服务时出现 403 禁止访问错误
**解决方案：**
```bash
# 检查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 添加缺失的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 性能问题

#### 问题 4：AI 响应缓慢
**排查步骤：**
1. 检查 Application Insights 的性能指标
2. 审查 Azure 门户中 OpenAI 服务指标
3. 验证网络连接和延迟

**解决方案：**
- 为常用查询实现缓存
- 选择适合场景的 OpenAI 模型
- 为高负载场景考虑读取副本

### **实验 6.1：调试挑战**

<strong>场景</strong>：部署成功，但应用返回 500 错误。

**调试任务：**
1. 检查应用日志
2. 验证服务连通性
3. 测试身份验证
4. 审查配置

**工具使用：**
- 使用 `azd show` 获取部署概览
- 使用 Azure 门户查看详细服务日志
- 使用 Application Insights 监控应用遥测

## 模块 7：监控与优化

### 第 7.1 步：设置全面监控

1. **创建自定义仪表盘：**

在 Azure 门户中创建仪表板，包含：
- OpenAI 请求数与延迟
- 应用错误率
- 资源利用率
- 成本追踪

2. **设置告警：**
```bash
# 高错误率警报
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 第 7.2 步：成本优化

1. **分析当前成本：**
```bash
# 使用 Azure CLI 获取成本数据
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **实施成本控制：**
- 设置预算告警
- 使用自动扩缩策略
- 实现请求缓存
- 监控 OpenAI 令牌使用

### **实验 7.1：性能优化**

<strong>任务</strong>：优化您的 AI 应用，实现性能与成本兼顾。

**改进指标：**
- 平均响应时间减少 20%
- 月成本减少 15%
- 维持 99.9% 正常运行时间

**可尝试策略：**
- 实现响应缓存
- 优化提示以提高令牌效率
- 选择合适的计算 SKU
- 设置恰当的自动扩缩

## 最终挑战：端到端实施

### 挑战场景

您需创建一个生产级 AI 驱动的客户服务聊天机器人，具有以下需求：

**功能需求：**
- 用于客户互动的 Web 界面
- 集成 Microsoft Foundry Models 实现响应
- 使用 Azure AI 搜索进行文档搜索
- 集成现有客户数据库
- 多语言支持

**非功能需求：**
- 支持 1000 并发用户
- 99.9% 正常运行 SLA
- 符合 SOC 2 合规性
- 月成本低于 500 美元
- 部署至多个环境（开发、预发布、生产）

### 实施步骤

1. <strong>设计架构</strong>
2. **创建 AZD 模板**
3. <strong>实施安全措施</strong>
4. <strong>设置监控和告警</strong>
5. <strong>创建部署管道</strong>
6. <strong>文档化解决方案</strong>

### 评估标准

- ✅ <strong>功能性</strong>：是否满足所有需求？
- ✅ <strong>安全性</strong>：是否执行了最佳实践？
- ✅ <strong>可扩展性</strong>：是否能承载负载？
- ✅ <strong>可维护性</strong>：代码和基础设施是否组织良好？
- ✅ <strong>成本</strong>：是否控制在预算内？

## 附加资源

### Microsoft 文档
- [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models 服务文档](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry 文档](https://learn.microsoft.com/azure/ai-studio/)

### 示例模板
- [Microsoft Foundry Models 聊天应用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天应用快速开始](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社区资源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD 模板](https://azure.github.io/awesome-azd/)

## 🎓 完成证书

恭喜！您已完成AI工作坊实验。您现在应该能够：

- ✅ 将现有AI应用转换为AZD模板
- ✅ 部署生产就绪的AI应用
- ✅ 实施AI工作负载的安全最佳实践
- ✅ 监控和优化AI应用性能
- ✅ 解决常见的部署问题

### 下一步
1. 将这些模式应用到您自己的AI项目中
2. 向社区贡献模板
3. 加入Microsoft Foundry Discord以获得持续支持
4. 探索多区域部署等高级主题

---

<strong>研讨会反馈</strong>：通过在[Microsoft Foundry Discord #Azure频道](https://discord.gg/microsoft-azure)分享您的体验，帮助我们改进本研讨会。

---

**章节导航：**
- **📚 课程首页**：[AZD入门](../../README.md)
- **📖 当前章节**：第2章 - AI优先开发
- **⬅️ 上一章**：[AI模型部署](ai-model-deployment.md)
- **➡️ 下一章**：[生产AI最佳实践](production-ai-practices.md)
- **🚀 下章**：[第3章：配置](../chapter-03-configuration/configuration.md)

**需要帮助？** 加入我们的社区，获取关于AZD和AI部署的支持和讨论。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
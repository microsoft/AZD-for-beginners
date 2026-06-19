# AI 工作坊实验：使您的 AI 解决方案可通过 AZD 部署

**章节导航：**
- **📚 课程主页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第 2 章 - 以 AI 为先的开发
- **⬅️ 上一章**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ 下一章**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 下一章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## 工作坊概览

本动手实验指导开发者通过使用 Azure Developer CLI (AZD) 将现有 AI 模板部署的过程。您将学习使用 Microsoft Foundry 服务进行生产级 AI 部署的关键模式。

> **验证说明 (2026-03-25)：** 本工作坊已针对 `azd` `1.23.12` 进行审查。如果您本地安装的版本较旧，请在开始前更新 AZD，以便身份验证、模板和部署工作流与下面的步骤相匹配。

**时长：** 2-3 小时  
**难度：** 中级  
**先决条件：** 基础 Azure 知识，熟悉 AI/ML 概念

## 🎓 学习目标

完成本工作坊后，您将能够：
- ✅ 将现有 AI 应用转换为使用 AZD 模板
- ✅ 使用 AZD 配置 Microsoft Foundry 服务
- ✅ 实现 AI 服务的安全凭据管理
- ✅ 部署具备监控的生产就绪 AI 应用
- ✅ 排查常见的 AI 部署问题

## 先决条件

### 所需工具
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安装
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安装
- [Git](https://git-scm.com/) 已安装
- 代码编辑器（推荐使用 VS Code）

### Azure 资源
- 具有 contributor 访问权限的 Azure 订阅
- 可访问 Microsoft Foundry Models 服务（或能够申请访问）
- 资源组创建权限

### 知识要求
- 对 Azure 服务的基础理解
- 熟悉命令行界面
- 基本的 AI/ML 概念（API、模型、提示）

## 实验设置

### 第 1 步：环境准备

1. **验证工具安装：**
```bash
# 检查是否已安装 AZD
azd version

# 检查 Azure CLI
az --version

# 为 AZD 工作流登录 Azure
azd auth login

# 仅在计划在诊断期间运行 az 命令时才登录 Azure CLI
az login
```

如果您在多个租户之间工作或未自动检测到订阅，请使用 `azd auth login --tenant-id <tenant-id>` 重新登录。

2. **克隆工作坊仓库：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模块 1：了解用于 AI 应用的 AZD 结构

### AI AZD 模板的组成

查看 AI 就绪 AZD 模板中的关键文件：

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

### **实验练习 1.1：探索配置**

1. **检查 azure.yaml 文件：**
```bash
cat azure.yaml
```

**关注点：**
- AI 组件的服务定义
- 环境变量映射
- 主机配置

2. **查看 main.bicep 基础设施：**
```bash
cat infra/main.bicep
```

**要识别的关键 AI 模式：**
- Microsoft Foundry Models 服务的配置
- Azure AI Search 集成
- 安全密钥管理
- 网络安全配置

### **讨论点：** 为什么这些模式对 AI 很重要

- <strong>服务依赖</strong>：AI 应用通常需要多个协调的服务
- <strong>安全性</strong>：API 密钥和端点需要安全管理
- <strong>可扩展性</strong>：AI 工作负载有独特的扩展需求
- <strong>成本管理</strong>：如果未正确配置，AI 服务可能会变得昂贵

## 模块 2：部署您的第一个 AI 应用

### 第 2.1 步：初始化环境

1. **创建新的 AZD 环境：**
```bash
azd env new myai-workshop
```

2. **设置所需参数：**
```bash
# 设置您偏好的 Azure 区域
azd env set AZURE_LOCATION eastus

# 可选：设置特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 第 2.2 步：部署基础设施和应用

1. **使用 AZD 部署：**
```bash
azd up
```

**在 `azd up` 期间会发生什么：**
- ✅ 预配 Microsoft Foundry Models 服务
- ✅ 创建 Azure AI Search 服务
- ✅ 为 Web 应用创建 App Service
- ✅ 配置网络和安全
- ✅ 部署应用代码
- ✅ 设置监控和日志记录

2. <strong>监控部署进度</strong> 并记录正在创建的资源。

### 第 2.3 步：验证您的部署

1. **检查已部署的资源：**
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
   - 尝试示例查询
   - 验证 AI 响应是否正常工作

### **实验练习 2.1：故障排除实战**

<strong>场景</strong>：您的部署成功，但 AI 无响应。

**常见问题检查：**
1. **OpenAI API 密钥**：验证它们是否已正确设置
2. <strong>模型可用性</strong>：检查您的区域是否支持该模型
3. <strong>网络连接性</strong>：确保服务可以通信
4. **RBAC 权限**：验证应用是否可以访问 OpenAI

**调试命令：**
```bash
# 检查环境变量
azd env get-values

# 查看部署日志
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 检查 OpenAI 部署状态
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模块 3：根据需求自定义 AI 应用

### 第 3.1 步：修改 AI 配置

1. **更新 OpenAI 模型：**
```bash
# 更改为不同的模型（如果在您所在的地区可用）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```

2. **添加额外的 AI 服务：**

编辑 `infra/main.bicep` 以添加 Document Intelligence：

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

### 第 3.2 步：针对环境的配置

<strong>最佳实践</strong>：开发与生产环境应使用不同配置。

1. **创建生产环境：**
```bash
azd env new myai-production
```

2. **设置生产特定参数：**
```bash
# 生产环境通常使用更高规格的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 启用额外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **实验练习 3.1：成本优化**

<strong>挑战</strong>：配置模板以实现成本效益的开发。

**任务：**
1. 确定哪些 SKU 可以设置为免费/基础层
2. 配置环境变量以实现最低成本
3. 部署并将成本与生产配置进行比较

**解决提示：**
- 在可能的情况下为 Azure AI Services 使用 F0（免费）层
- 在开发中为 Search Service 使用 Basic 层
- 考虑为 Functions 使用 Consumption 计划

## 模块 4：安全与生产最佳实践

### 第 4.1 步：安全凭据管理

<strong>当前挑战</strong>：许多 AI 应用将 API 密钥硬编码或使用不安全的存储。

**AZD 方案**：托管身份（Managed Identity）+ Key Vault 集成。

1. **审查模板中的安全配置：**
```bash
# 查找 Key Vault 和托管标识的配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **验证 Managed Identity 是否正常工作：**
```bash
# 检查 web 应用是否具有正确的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第 4.2 步：网络安全

1. <strong>启用私有端点</strong>（如果尚未配置）：

将以下内容添加到您的 bicep 模板：
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
# Application Insights 应该会被自动配置
# 检查配置:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **设置 AI 相关监控：**

为 AI 操作添加自定义指标：
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

### **实验练习 4.1：安全审计**

<strong>任务</strong>：审查您的部署以符合安全最佳实践。

**检查清单：**
- [ ] 代码或配置中没有硬编码的机密
- [ ] 使用 Managed Identity 进行服务到服务的身份验证
- [ ] Key Vault 存储敏感配置
- [ ] 网络访问已被适当限制
- [ ] 已启用监控和日志记录

## 模块 5：将您自己的 AI 应用转换为 AZD 模板

### 第 5.1 步：评估工作表

<strong>在转换应用之前</strong>，回答以下问题：

1. **应用架构：**
   - 您的应用使用了哪些 AI 服务？
   - 它需要哪些计算资源？
   - 是否需要数据库？
   - 服务之间有哪些依赖关系？

2. **安全需求：**
   - 您的应用处理哪些敏感数据？
   - 有哪些合规性要求？
   - 是否需要私有网络？

3. **扩展需求：**
   - 预计负载是多少？
   - 是否需要自动扩缩容？
   - 是否有区域性要求？

### 第 5.2 步：创建您的 AZD 模板

**按照以下模式转换您的应用：**

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

### **实验练习 5.1：模板创建挑战**

<strong>挑战</strong>：为文档处理 AI 应用创建 AZD 模板。

**需求：**
- 使用 Microsoft Foundry Models 进行内容分析
- 使用 Document Intelligence 进行 OCR
- 用于文档上传的存储帐户
- 处理逻辑的 Function App
- 用于用户界面的 Web 应用

**加分项：**
- 添加适当的错误处理
- 包含成本估算
- 设置监控仪表板

## 模块 6：常见问题排查

### 常见部署问题

#### 问题 1：OpenAI 服务配额超出
**症状：** 部署因配额错误失败
**解决方案：**
```bash
# 检查当前配额
az cognitiveservices usage list --location eastus

# 请求提高配额或尝试不同区域
azd env set AZURE_LOCATION westus2
azd up
```

#### 问题 2：模型在该区域不可用
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
**症状：** 调用 AI 服务时出现 403 Forbidden 错误
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
**调查步骤：**
1. 检查 Application Insights 的性能指标
2. 在 Azure 门户中查看 OpenAI 服务指标
3. 验证网络连接与延迟

**解决方案：**
- 为常见查询实现缓存
- 为您的用例使用合适的 OpenAI 模型
- 在高负载场景下考虑读副本

### **实验练习 6.1：调试挑战**

<strong>场景</strong>：您的部署成功，但应用返回 500 错误。

**调试任务：**
1. 检查应用日志
2. 验证服务连通性
3. 测试身份验证
4. 检查配置

**可使用的工具：**
- `azd show` 用于部署概览
- Azure 门户用于详细的服务日志
- Application Insights 用于应用遥测

## 模块 7：监控与优化

### 第 7.1 步：建立全面监控

1. **创建自定义仪表板：**

在 Azure 门户中创建包含以下内容的仪表板：
- OpenAI 请求计数和延迟
- 应用错误率
- 资源利用率
- 成本跟踪

2. **设置警报：**
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
- 设置预算警报
- 使用自动扩缩策略
- 实现请求缓存
- 监控 OpenAI 的 token 使用

### **实验练习 7.1：性能优化**

<strong>任务</strong>：优化您的 AI 应用以兼顾性能与成本。

**要改进的指标：**
- 平均响应时间降低 20%
- 月度成本降低 15%
- 保持 99.9% 的正常运行时间

**可尝试的策略：**
- 实现响应缓存
- 优化提示以提高 token 效率
- 使用合适的计算 SKU
- 设置适当的自动扩缩

## 最终挑战：端到端实现

### 挑战场景

您的任务是创建一个生产就绪的 AI 驱动客服聊天机器人，要求如下：

**功能性要求：**
- 用于客户交互的 Web 界面
- 与 Microsoft Foundry Models 集成以生成回复
- 使用 Azure AI Search 的文档搜索能力
- 与现有客户数据库集成
- 多语言支持

**非功能性要求：**
- 支持 1000 个并发用户
- 99.9% 的正常运行时间 SLA
- 符合 SOC 2
- 每月成本低于 $500
- 部署到多个环境（dev、staging、prod）

### 实施步骤

1. 设计架构
2. 创建 AZD 模板
3. 实施安全措施
4. 设置监控和告警
5. 创建部署流水线
6. 编写解决方案文档

### 评估标准

- ✅ <strong>功能性</strong>：是否满足所有要求？
- ✅ <strong>安全性</strong>：是否实施了最佳实践？
- ✅ <strong>可扩展性</strong>：能否处理预期负载？
- ✅ <strong>可维护性</strong>：代码和基础设施是否组织良好？
- ✅ <strong>成本</strong>：是否在预算范围内？

## 其他资源

### 微软文档
- [Azure Developer CLI 文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### 示例模板
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社区资源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD 模板](https://azure.github.io/awesome-azd/)

## 🎓 结业证书

恭喜！你已完成 AI 实验室工作坊。你现在应该能够：

- ✅ 将现有 AI 应用转换为 AZD 模板
- ✅ 部署可投入生产的 AI 应用
- ✅ 为 AI 工作负载实施安全最佳实践
- ✅ 监控并优化 AI 应用性能
- ✅ 排查常见的部署问题

### 下一步
1. 将这些模式应用到你自己的 AI 项目中
2. 向社区贡献模板
3. 加入 Microsoft Foundry Discord 获取持续支持
4. 探索高级主题，例如多区域部署

---

<strong>研讨会反馈</strong>: 帮助我们改进此研讨会，通过在 [Microsoft Foundry Discord #Azure 频道](https://discord.gg/microsoft-azure) 分享您的体验。

---

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第 2 章 - AI 优先开发
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生产级 AI 最佳实践](production-ai-practices.md)
- **🚀 下一章节**: [第 3 章：配置](../chapter-03-configuration/configuration.md)

**需要帮助？** 加入我们的社区以获取关于 AZD 和 AI 部署的支持与讨论。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
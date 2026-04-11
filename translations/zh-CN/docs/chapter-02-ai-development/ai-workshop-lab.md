# AI 实验室：使您的 AI 解决方案可通过 AZD 部署

**章节导航：**
- **📚 课程首页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第 2 章 - 以 AI 为先的开发
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生产环境 AI 最佳实践](production-ai-practices.md)
- **🚀 下一章集**: [第 3 章：配置](../chapter-03-configuration/configuration.md)

## 研讨会概览

本动手实验引导开发者了解如何将现有的 AI 模板通过 Azure Developer CLI (AZD) 部署。您将学习使用 Microsoft Foundry 服务进行生产级 AI 部署的基本模式。

> **验证说明（2026-03-25）：** 本研讨会已针对 `azd` `1.23.12` 进行审查。如果您本地安装的版本较旧，请在开始前更新 AZD，以便身份验证、模板和部署工作流与以下步骤匹配。

**时长：** 2-3 小时  
**级别：** 中级  
**先决条件：** 基本的 Azure 知识，熟悉 AI/ML 概念

## 🎓 学习目标

完成本研讨会后，您将能够：
- ✅ 将现有 AI 应用转换为使用 AZD 模板
- ✅ 使用 AZD 配置 Microsoft Foundry 服务
- ✅ 为 AI 服务实现安全凭据管理
- ✅ 部署具备监控功能的生产就绪 AI 应用
- ✅ 排查常见的 AI 部署问题

## 先决条件

### 必备工具
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安装
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安装
- [Git](https://git-scm.com/) 已安装
- 代码编辑器（推荐使用 VS Code）

### Azure 资源
- 具有贡献者权限的 Azure 订阅
- 可访问 Microsoft Foundry Models 服务（或有能力申请访问）
- 具有创建资源组的权限

### 知识先决条件
- 对 Azure 服务的基础了解
- 熟悉命令行界面
- 基本的 AI/ML 概念（API、模型、提示词）

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

# 仅在您计划在诊断期间运行 az 命令时才登录 Azure CLI
az login
```

如果您在多个租户中工作或订阅未自动检测到，请使用 `azd auth login --tenant-id <tenant-id>` 重试。

2. **克隆研讨会代码仓库：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模块 1：理解 AI 应用的 AZD 结构

### AI AZD 模板的组成

探索 AI 就绪 AZD 模板中的关键文件：

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
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

2. **复查 main.bicep 基础设施：**
```bash
cat infra/main.bicep
```

**需要识别的关键 AI 模式：**
- Microsoft Foundry Models 服务的部署
- Cognitive Search 集成
- 安全密钥管理
- 网络安全配置

### **讨论点：** 为什么这些模式对 AI 很重要

- **服务依赖性：** AI 应用通常需要多个协调的服务
- **安全性：** API 密钥和端点需要安全管理
- **可扩展性：** AI 工作负载具有独特的扩展需求
- **成本管理：** 如果配置不当，AI 服务可能成本高昂

## 模块 2：部署您的第一个 AI 应用

### 第 2.1 步：初始化环境

1. **创建一个新的 AZD 环境：**
```bash
azd env new myai-workshop
```

2. **设置所需参数：**
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

**在运行 `azd up` 期间会发生的事情：**
- ✅ 部署 Microsoft Foundry Models 服务
- ✅ 创建 Cognitive Search 服务
- ✅ 为 Web 应用创建 App Service
- ✅ 配置网络和安全
- ✅ 部署应用代码
- ✅ 设置监控和日志

2. <strong>监控部署进度</strong> 并记录正在创建的资源。

### 第 2.3 步：验证部署

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

### **实验练习 2.1：故障排查练习**

<strong>场景</strong>：您的部署成功，但 AI 无响应。

**常见需要检查的问题：**
1. **OpenAI API keys**：验证它们是否正确设置
2. <strong>模型可用性</strong>：检查您的区域是否支持该模型
3. <strong>网络连接性</strong>：确保服务之间可以通信
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
# 更改为不同的模型（如果在您所在地区可用）
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

### 第 3.2 步：特定环境的配置

<strong>最佳实践</strong>：开发与生产应使用不同的配置。

1. **创建一个生产环境：**
```bash
azd env new myai-production
```

2. **设置生产特定的参数：**
```bash
# 生产通常使用更高级别的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 启用额外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **实验练习 3.1：成本优化**

<strong>挑战</strong>：为成本效益的开发配置模板。

**任务：**
1. 找出哪些 SKU 可以设置为免费/基础层
2. 为最低成本配置环境变量
3. 部署并与生产配置比较成本

**解决提示：**
- 在可能的情况下为认知服务使用 F0（免费）层
- 开发环境中为 Search Service 使用 Basic 层
- 考虑对 Functions 使用 Consumption 计费计划

## 模块 4：安全与生产最佳实践

### 第 4.1 步：安全凭据管理

<strong>当前挑战</strong>：许多 AI 应用将 API 密钥硬编码或使用不安全的存储方式。

**AZD 解决方案**：托管标识 + Key Vault 集成。

1. **审查模板中的安全配置：**
```bash
# 查找密钥保管库和托管标识配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **验证托管标识是否正常工作：**
```bash
# 检查 Web 应用是否具有正确的身份配置
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
# Application Insights 应该自动配置
# 检查配置:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **设置 AI 特定的监控：**

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

<strong>任务</strong>：审查您的部署以确保符合安全最佳实践。

**检查清单：**
- [ ] 代码或配置中没有硬编码的密钥
- [ ] 使用托管标识进行服务间身份验证
- [ ] Key Vault 存储敏感配置
- [ ] 网络访问已被适当限制
- [ ] 已启用监控和日志记录

## 模块 5：转换您自己的 AI 应用

### 第 5.1 步：评估工作表

<strong>在转换应用之前</strong>，请回答以下问题：

1. **应用架构：**
   - 您的应用使用哪些 AI 服务？
   - 需要哪些计算资源？
   - 是否需要数据库？
   - 服务之间有哪些依赖关系？

2. **安全需求：**
   - 您的应用处理哪些敏感数据？
   - 有哪些合规性要求？
   - 是否需要私有网络？

3. **扩展需求：**
   - 预计的负载是多少？
   - 是否需要自动扩缩？
   - 是否有区域性要求？

### 第 5.2 步：创建您的 AZD 模板

**按此模式将您的应用转换：**

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

<strong>挑战</strong>：为文档处理 AI 应用创建一个 AZD 模板。

**要求：**
- 使用 Microsoft Foundry Models 进行内容分析
- 使用 Document Intelligence 进行 OCR
- 使用存储帐户保存文档上传
- 使用 Function App 实现处理逻辑
- 使用 Web 应用提供用户界面

**加分项：**
- 添加适当的错误处理
- 包含成本估算
- 设置监控仪表板

## 模块 6：常见问题排查

### 常见部署问题

#### 问题 1：OpenAI 服务配额超出
**症状：** 部署失败并出现配额错误  
**解决方案：**
```bash
# 检查当前配额
az cognitiveservices usage list --location eastus

# 请求增加配额或尝试不同区域
azd env set AZURE_LOCATION westus2
azd up
```

#### 问题 2：模型在区域中不可用
**症状：** AI 响应失败或模型部署错误  
**解决方案：**
```bash
# 按地区检查模型可用性
az cognitiveservices model list --location eastus

# 更新为可用的模型
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
**排查步骤：**
1. 在 Application Insights 中检查性能指标
2. 在 Azure 门户中复查 OpenAI 服务指标
3. 验证网络连接和延迟

**解决方案：**
- 对常见查询实现缓存
- 对用例使用合适的 OpenAI 模型
- 在高负载场景中考虑只读副本

### **实验练习 6.1：调试挑战**

<strong>场景</strong>：您的部署成功，但应用返回 500 错误。

**调试任务：**
1. 检查应用日志
2. 验证服务连接性
3. 测试身份验证
4. 审查配置

**可使用的工具：**
- `azd show` 用于获取部署概览
- 在 Azure 门户中查看详细服务日志
- 使用 Application Insights 获取应用遥测

## 模块 7：监控与优化

### 第 7.1 步：建立全面监控

1. **创建自定义仪表板：**

导航到 Azure 门户并创建包含以下内容的仪表板：
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
- 使用自动伸缩策略
- 实现请求缓存
- 监控 OpenAI 的令牌使用情况

### **实验练习 7.1：性能优化**

<strong>任务</strong>：在性能和成本两方面优化您的 AI 应用。

**需要改善的指标：**
- 将平均响应时间减少 20%
- 将月度成本降低 15%
- 保持 99.9% 的正常运行时间

**可尝试的策略：**
- 实现响应缓存
- 优化提示词以提高令牌效率
- 使用合适的计算 SKU
- 设置适当的自动伸缩

## 最终挑战：端到端实现

### 挑战场景

您的任务是创建一个生产就绪的 AI 驱动客户服务聊天机器人，需满足以下要求：

**功能性需求：**
- 面向客户交互的 Web 界面
- 与 Microsoft Foundry Models 集成以生成响应
- 使用 Cognitive Search 实现文档搜索功能
- 与现有客户数据库集成
- 支持多语言

**非功能性需求：**
- 支持 1000 个并发用户
- 99.9% 的运行时间 SLA
- 符合 SOC 2 合规性
- 成本低于 $500/月
- 部署到多个环境（dev、staging、prod）

### 实施步骤

1. <strong>设计架构</strong>
2. **创建 AZD 模板**
3. <strong>实施安全措施</strong>
4. <strong>设置监控和告警</strong>
5. <strong>创建部署管道</strong>
6. <strong>记录解决方案</strong>

### 评估标准

- ✅ <strong>功能性</strong>：是否满足所有要求？
- ✅ <strong>安全性</strong>：是否实现了最佳实践？
- ✅ <strong>可扩展性</strong>：能否处理负载？
- ✅ <strong>可维护性</strong>：代码和基础设施是否组织良好？
- ✅ <strong>成本</strong>：是否在预算范围内？

## 附加资源

### Microsoft 文档
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### 示例模板
- [Microsoft Foundry 模型聊天应用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI 聊天应用 快速入门](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso 聊天](https://github.com/Azure-Samples/contoso-chat)

### 社区资源
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI 的 GitHub 仓库](https://github.com/Azure/azure-dev)
- [Awesome AZD 模板](https://azure.github.io/awesome-azd/)

## 🎓 完成证书

恭喜！你已完成 AI 研讨会实验。你现在应该能够：

- ✅ 将现有 AI 应用转换为 AZD 模板
- ✅ 部署生产就绪的 AI 应用
- ✅ 为 AI 工作负载实施安全最佳实践
- ✅ 监控并优化 AI 应用性能
- ✅ 排查常见的部署问题

### 下一步
1. 将这些模式应用到你自己的 AI 项目中
2. 向社区贡献模板
3. 加入 Microsoft Foundry Discord 获取持续支持
4. 探索高级主题，例如多区域部署

---

<strong>研讨会反馈</strong>：通过在 [Microsoft Foundry Discord #Azure 频道](https://discord.gg/microsoft-azure) 分享您的体验，帮助我们改进此研讨会。

---

**章节导航：**
- **📚 课程主页**: [AZD 初学者](../../README.md)
- **📖 当前章节**: 第2章 - 以 AI 为先的开发
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生产 AI 最佳实践](production-ai-practices.md)
- **🚀 下一章节**: [第3章：配置](../chapter-03-configuration/configuration.md)

**需要帮助？** 加入我们的社区，获取关于 AZD 和 AI 部署的支持与讨论。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们致力于确保准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的原文应被视为具有权威性的来源。对于关键信息，建议使用专业人工翻译。因使用本翻译而导致的任何误解或误释，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T17:22:27+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "zh"
}
-->
# AI工作坊实验：让您的AI解决方案支持AZD部署

**上一节：** [AI模型部署](ai-model-deployment.md) | **下一节：** [生产AI实践](production-ai-practices.md)

## 工作坊概述

本动手实验将指导开发者如何将现有的AI应用程序改造为可使用Azure Developer CLI (AZD)进行部署。您将学习使用Azure AI Foundry服务进行生产级AI部署的关键模式。

**时长：** 2-3小时  
**难度：** 中级  
**前置条件：** 基本的Azure知识，熟悉AI/ML概念

## 🎓 学习目标

完成本次工作坊后，您将能够：
- ✅ 将现有AI应用程序转换为AZD模板
- ✅ 使用AZD配置Azure AI Foundry服务
- ✅ 实现AI服务的安全凭证管理
- ✅ 部署具有监控功能的生产级AI应用程序
- ✅ 排查常见的AI部署问题

## 前置条件

### 必需工具
- 已安装 [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- 已安装 [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- 已安装 [Git](https://git-scm.com/)
- 代码编辑器（推荐使用VS Code）

### Azure资源
- 拥有具有贡献者权限的Azure订阅
- 可访问Azure OpenAI服务（或能够申请访问权限）
- 资源组创建权限

### 知识要求
- 基本了解Azure服务
- 熟悉命令行界面
- 基本AI/ML概念（API、模型、提示词）

## 实验设置

### 第一步：环境准备

1. **验证工具安装：**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **克隆工作坊代码库：**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 模块1：了解AI应用的AZD结构

### AI AZD模板的结构

探索AI支持的AZD模板中的关键文件：

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **实验1.1：探索配置**

1. **检查azure.yaml文件：**
```bash
cat azure.yaml
```

**需要关注的内容：**
- AI组件的服务定义
- 环境变量映射
- 主机配置

2. **查看main.bicep基础设施文件：**
```bash
cat infra/main.bicep
```

**需要识别的关键AI模式：**
- Azure OpenAI服务的配置
- Cognitive Search集成
- 安全密钥管理
- 网络安全配置

### **讨论点：为什么这些模式对AI很重要**

- **服务依赖性**：AI应用通常需要多个服务协同工作
- **安全性**：API密钥和端点需要安全管理
- **可扩展性**：AI工作负载有独特的扩展需求
- **成本管理**：如果配置不当，AI服务可能会非常昂贵

## 模块2：部署您的第一个AI应用程序

### 第2.1步：初始化环境

1. **创建新的AZD环境：**
```bash
azd env new myai-workshop
```

2. **设置所需参数：**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 第2.2步：部署基础设施和应用程序

1. **使用AZD进行部署：**
```bash
azd up
```

**`azd up`期间发生的事情：**
- ✅ 配置Azure OpenAI服务
- ✅ 创建Cognitive Search服务
- ✅ 设置Web应用的App Service
- ✅ 配置网络和安全
- ✅ 部署应用程序代码
- ✅ 设置监控和日志记录

2. **监控部署进度**并记录正在创建的资源。

### 第2.3步：验证您的部署

1. **检查已部署的资源：**
```bash
azd show
```

2. **打开已部署的应用程序：**
```bash
azd show --output json | grep "webAppUrl"
```

3. **测试AI功能：**
   - 访问Web应用程序
   - 尝试示例查询
   - 验证AI响应是否正常工作

### **实验2.1：故障排除练习**

**场景**：部署成功，但AI没有响应。

**需要检查的常见问题：**
1. **OpenAI API密钥**：验证是否正确设置
2. **模型可用性**：检查您的区域是否支持该模型
3. **网络连接**：确保服务之间可以通信
4. **RBAC权限**：验证应用是否可以访问OpenAI

**调试命令：**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 模块3：定制您的AI应用程序

### 第3.1步：修改AI配置

1. **更新OpenAI模型：**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **添加额外的AI服务：**

编辑`infra/main.bicep`以添加Document Intelligence：

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

### 第3.2步：环境特定配置

**最佳实践**：开发环境与生产环境使用不同的配置。

1. **创建生产环境：**
```bash
azd env new myai-production
```

2. **设置生产特定参数：**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **实验3.1：成本优化**

**挑战**：配置模板以实现成本效益的开发。

**任务：**
1. 确定哪些SKU可以设置为免费/基础层
2. 配置环境变量以降低成本
3. 部署并比较与生产配置的成本

**解决提示：**
- 尽可能使用Cognitive Services的F0（免费）层
- 在开发中使用Search Service的基础层
- 考虑使用Functions的消费计划

## 模块4：安全性和生产最佳实践

### 第4.1步：安全凭证管理

**当前挑战**：许多AI应用程序硬编码API密钥或使用不安全的存储。

**AZD解决方案**：托管身份+Key Vault集成。

1. **查看模板中的安全配置：**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **验证托管身份是否正常工作：**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 第4.2步：网络安全

1. **启用私有端点**（如果尚未配置）：

添加到您的bicep模板：
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

### 第4.3步：监控和可观察性

1. **配置Application Insights：**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **设置AI特定监控：**

为AI操作添加自定义指标：
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

### **实验4.1：安全审计**

**任务**：审查您的部署是否符合安全最佳实践。

**检查清单：**
- [ ] 代码或配置中没有硬编码的密钥
- [ ] 使用托管身份进行服务间认证
- [ ] Key Vault存储敏感配置
- [ ] 网络访问已正确限制
- [ ] 启用了监控和日志记录

## 模块5：转换您自己的AI应用程序

### 第5.1步：评估工作表

**在转换您的应用程序之前**，回答以下问题：

1. **应用程序架构：**
   - 您的应用使用了哪些AI服务？
   - 需要哪些计算资源？
   - 是否需要数据库？
   - 服务之间有哪些依赖关系？

2. **安全需求：**
   - 您的应用处理哪些敏感数据？
   - 有哪些合规要求？
   - 是否需要私有网络？

3. **扩展需求：**
   - 您的预期负载是多少？
   - 是否需要自动扩展？
   - 是否有区域性要求？

### 第5.2步：创建您的AZD模板

**按照以下模式转换您的应用：**

1. **创建基本结构：**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **创建azure.yaml：**
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

**infra/modules/openai.bicep** - OpenAI模块：
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

### **实验5.1：模板创建挑战**

**挑战**：为文档处理AI应用创建AZD模板。

**需求：**
- 使用Azure OpenAI进行内容分析
- 使用Document Intelligence进行OCR
- 使用Storage Account存储文档上传
- 使用Function App处理逻辑
- 使用Web应用提供用户界面

**加分项：**
- 添加适当的错误处理
- 包括成本估算
- 设置监控仪表板

## 模块6：排查常见问题

### 常见部署问题

#### 问题1：OpenAI服务配额超限
**症状：** 部署失败并显示配额错误  
**解决方案：**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### 问题2：模型在区域内不可用
**症状：** AI响应失败或模型部署错误  
**解决方案：**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### 问题3：权限问题
**症状：** 调用AI服务时出现403禁止访问错误  
**解决方案：**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### 性能问题

#### 问题4：AI响应缓慢
**调查步骤：**
1. 检查Application Insights中的性能指标
2. 查看Azure门户中的OpenAI服务指标
3. 验证网络连接和延迟

**解决方案：**
- 对常见查询实施缓存
- 使用适合用例的OpenAI模型
- 考虑高负载场景的只读副本

### **实验6.1：调试挑战**

**场景**：部署成功，但应用程序返回500错误。

**调试任务：**
1. 检查应用日志
2. 验证服务连接
3. 测试认证
4. 审查配置

**使用工具：**
- `azd show`查看部署概览
- Azure门户查看详细服务日志
- Application Insights查看应用程序遥测数据

## 模块7：监控和优化

### 第7.1步：设置全面监控

1. **创建自定义仪表板：**

导航到Azure门户并创建仪表板，包含：
- OpenAI请求数量和延迟
- 应用程序错误率
- 资源使用情况
- 成本跟踪

2. **设置警报：**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 第7.2步：成本优化

1. **分析当前成本：**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **实施成本控制：**
- 设置预算警报
- 使用自动扩展策略
- 实施请求缓存
- 监控OpenAI的令牌使用情况

### **实验7.1：性能优化**

**任务**：优化您的AI应用以提高性能并降低成本。

**需要改进的指标：**
- 将平均响应时间减少20%
- 将月成本降低15%
- 保持99.9%的正常运行时间

**可尝试的策略：**
- 实施响应缓存
- 优化提示词以提高令牌效率
- 使用适当的计算SKU
- 设置正确的自动扩展

## 最终挑战：端到端实施

### 挑战场景

您需要创建一个生产级AI驱动的客户服务聊天机器人，要求如下：

**功能需求：**
- 客户交互的Web界面
- 集成Azure OpenAI以生成响应
- 使用Cognitive Search进行文档搜索
- 集成现有客户数据库
- 支持多语言

**非功能需求：**
- 支持1000个并发用户
- 99.9%的正常运行时间SLA
- 符合SOC 2标准
- 每月成本低于500美元
- 部署到多个环境（开发、预发布、生产）

### 实施步骤

1. **设计架构**
2. **创建AZD模板**
3. **实施安全措施**
4. **设置监控和警报**
5. **创建部署管道**
6. **记录解决方案**

### 评估标准

- ✅ **功能性**：是否满足所有需求？
- ✅ **安全性**：是否实施了最佳实践？
- ✅ **可扩展性**：是否能处理负载？
- ✅ **可维护性**：代码和基础设施是否组织良好？
- ✅ **成本**：是否符合预算？

## 附加资源

### Microsoft文档
- [Azure Developer CLI文档](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI服务文档](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry文档](https://learn.microsoft.com/azure/ai-studio/)

### 示例模板
- [Azure OpenAI聊天应用](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI聊天应用快速入门](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso聊天](https://github.com/Azure-Samples/contoso-chat)

### 社区资源
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 完成证书

恭喜！您已完成AI工作坊实验。您现在应该能够：

- ✅ 将现有AI应用程序转换为AZD模板
- ✅ 部署生产级AI应用程序
- ✅ 实施 AI 工作负载的安全最佳实践  
- ✅ 监控并优化 AI 应用性能  
- ✅ 排查常见的部署问题  

### 下一步  
1. 将这些模式应用到您的 AI 项目中  
2. 向社区贡献模板  
3. 加入 Azure AI Foundry Discord，获取持续支持  
4. 探索多区域部署等高级主题  

---

**工作坊反馈**：通过在 [Azure AI Foundry Discord #Azure 频道](https://discord.gg/microsoft-azure) 分享您的体验，帮助我们改进此工作坊。  

---

**上一步：** [AI 模型部署](ai-model-deployment.md) | **下一步：** [生产环境 AI 实践](production-ai-practices.md)  

**需要帮助？** 加入我们的社区，参与关于 AZD 和 AI 部署的支持与讨论。  

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
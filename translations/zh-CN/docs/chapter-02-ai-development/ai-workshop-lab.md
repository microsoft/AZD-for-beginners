# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD 入门](../../README.md)
- **📖 Current Chapter**: 第2章 - 以 AI 为先的开发
- **⬅️ Previous**: [AI 模型部署](ai-model-deployment.md)
- **➡️ Next**: [生产 AI 最佳实践](production-ai-practices.md)
- **🚀 Next Chapter**: [第3章：配置](../chapter-03-configuration/configuration.md)

## Workshop Overview

本动手实验室引导开发人员通过使用 Azure Developer CLI (AZD) 将现有 AI 模板部署到生产环境的过程。您将学习使用 Microsoft Foundry 服务进行生产级 AI 部署的基本模式。

**Duration:** 2-3 小时  
**Level:** 中级  
**Prerequisites:** 基本的 Azure 知识，熟悉 AI/ML 概念

## 🎓 Learning Objectives

到本研讨会结束时，您将能够：
- ✅ 将现有 AI 应用转换为使用 AZD 模板
- ✅ 使用 AZD 配置 Microsoft Foundry 服务
- ✅ 为 AI 服务实现安全的凭证管理
- ✅ 部署具备监控的生产就绪 AI 应用
- ✅ 排查常见的 AI 部署问题

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) 已安装
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) 已安装
- [Git](https://git-scm.com/) 已安装
- 代码编辑器（推荐 VS Code）

### Azure Resources
- 拥有 contributor 权限的 Azure 订阅
- 访问 Microsoft Foundry Models 服务（或能够请求访问）
- 资源组创建权限

### Knowledge Prerequisites
- 对 Azure 服务的基本理解
- 熟悉命令行界面
- 基本的 AI/ML 概念（API、模型、提示词）

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# 检查 AZD 是否已安装
azd version

# 检查 Azure CLI
az --version

# 登录到 Azure
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AI 组件的服务定义
- 环境变量映射
- 主机配置

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models 服务的预配
- Cognitive Search 集成
- 安全密钥管理
- 网络安全配置

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI 应用通常需要多个协同工作的服务
- **Security**: API 密钥和端点需要安全管理
- **Scalability**: AI 工作负载具有独特的扩展需求
- **Cost Management**: 如果配置不当，AI 服务可能会很昂贵

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# 设置您偏好的 Azure 区域
azd env set AZURE_LOCATION eastus

# 可选：设置特定的 OpenAI 模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ 预配 Microsoft Foundry Models 服务
- ✅ 创建 Cognitive Search 服务
- ✅ 为 Web 应用创建 App Service
- ✅ 配置网络和安全
- ✅ 部署应用代码
- ✅ 设置监控和日志记录

2. **Monitor the deployment progress** 并记录正在创建的资源。

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - 访问 Web 应用
   - 尝试示例查询
   - 验证 AI 响应是否正常工作

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: 部署成功，但 AI 未响应。

**Common issues to check:**
1. **OpenAI API keys**: 验证是否正确设置
2. **Model availability**: 检查您的区域是否支持该模型
3. **Network connectivity**: 确保服务之间可以通信
4. **RBAC permissions**: 验证应用是否可以访问 OpenAI

**Debugging commands:**
```bash
# 检查环境变量
azd env get-values

# 查看部署日志
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# 检查 OpenAI 部署状态
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# 切换到不同的模型（如果在您所在地区可用）
azd env set AZURE_OPENAI_MODEL gpt-4.1

# 使用新配置重新部署
azd deploy
```

2. **Add additional AI services:**

编辑 `infra/main.bicep` 以添加 Document Intelligence:

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: 在开发与生产之间使用不同的配置。

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# 生产环境通常使用更高的 SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# 启用额外的安全功能
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: 为节约成本的开发配置模板。

**Tasks:**
1. 确定哪些 SKU 可以设置为免费/基础层
2. 配置用于最小成本的环境变量
3. 部署并将成本与生产配置进行比较

**Solution hints:**
- 在可能的情况下为 Cognitive Services 使用 F0（免费）层
- 在开发环境中为 Search Service 使用 Basic 层
- 考虑对 Functions 使用 Consumption 计划

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: 许多 AI 应用将 API 密钥硬编码或使用不安全存储。

**AZD Solution**: 托管身份 + Key Vault 集成。

1. **Review the security configuration in your template:**
```bash
# 查找 Key Vault 和托管标识配置
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# 检查 Web 应用是否具有正确的身份配置
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints**（如果尚未配置）：

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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights 应自动配置
# 检查配置：
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

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

### **Lab Exercise 4.1: Security Audit**

**Task**: 审查您的部署以符合安全最佳实践。

**Checklist:**
- [ ] 代码或配置中没有硬编码的秘密
- [ ] 使用托管身份进行服务间认证
- [ ] Key Vault 存储敏感配置
- [ ] 网络访问已被适当限制
- [ ] 启用监控和日志记录

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

<strong>在转换您的应用之前</strong>，回答以下问题：

1. **Application Architecture:**
   - 您的应用使用哪些 AI 服务？
   - 需要哪些计算资源？
   - 是否需要数据库？
   - 服务之间有哪些依赖关系？

2. **Security Requirements:**
   - 您的应用处理哪些敏感数据？
   - 有哪些合规性要求？
   - 是否需要私有网络？

3. **Scaling Requirements:**
   - 预期负载是多少？
   - 是否需要自动扩缩？
   - 是否有区域性要求？

### Step 5.2: Create Your AZD Template

**按照此模式将您的应用转换为模板：**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# 初始化 AZD 模板
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

**infra/main.bicep** - 主模板:
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

**infra/modules/openai.bicep** - OpenAI 模块:
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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: 为文档处理 AI 应用创建一个 AZD 模板。

**Requirements:**
- 使用 Microsoft Foundry Models 进行内容分析
- 使用 Document Intelligence 进行 OCR
- 用于文档上传的 Storage Account
- 用于处理逻辑的 Function App
- 用于用户界面的 Web 应用

**Bonus points:**
- 添加适当的错误处理
- 包含成本估算
- 设置监控仪表板

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** 部署因配额错误而失败
**Solutions:**
```bash
# 检查当前配额
az cognitiveservices usage list --location eastus

# 请求提高配额或尝试不同区域
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI 响应失败或模型部署错误
**Solutions:**
```bash
# 按地区检查模型可用性
az cognitiveservices model list --location eastus

# 更新为可用模型
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 在调用 AI 服务时出现 403 Forbidden 错误
**Solutions:**
```bash
# 检查角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 添加缺失的角色
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. 检查 Application Insights 中的性能指标
2. 在 Azure 门户中查看 OpenAI 服务指标
3. 验证网络连接性和延迟

**Solutions:**
- 为常见查询实现缓存
- 为您的用例选择合适的 OpenAI 模型
- 对高负载场景考虑读副本

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: 部署成功，但应用返回 500 错误。

**Debugging tasks:**
1. 检查应用日志
2. 验证服务连接
3. 测试认证
4. 审查配置

**Tools to use:**
- `azd show` 获取部署概览
- 在 Azure 门户中查看详细的服务日志
- 使用 Application Insights 获取应用遥测

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

在 Azure 门户中创建仪表板，包含：
- OpenAI 请求计数和延迟
- 应用错误率
- 资源利用情况
- 成本跟踪

2. **Set up alerts:**
```bash
# 高错误率警报
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# 使用 Azure CLI 获取成本数据
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- 设置预算警报
- 使用自动扩缩策略
- 实现请求缓存
- 监控 OpenAI 的令牌使用情况

### **Lab Exercise 7.1: Performance Optimization**

**Task**: 优化您的 AI 应用以兼顾性能和成本。

**需改进的指标:**
- 将平均响应时间减少 20%
- 将月度成本降低 15%
- 保持 99.9% 的正常运行时间

**可尝试的策略:**
- 实现响应缓存
- 优化提示词以提高令牌效率
- 使用合适的计算 SKU
- 设置恰当的自动扩缩

## Final Challenge: End-to-End Implementation

### Challenge Scenario

您的任务是创建一个面向生产的 AI 驱动客户服务聊天机器人，要求如下：

**Functional Requirements:**
- 面向客户交互的 Web 界面
- 与 Microsoft Foundry Models 集成以生成响应
- 使用 Cognitive Search 的文档搜索功能
- 与现有客户数据库集成
- 支持多语言

**Non-Functional Requirements:**
- 支持 1000 并发用户
- 99.9% 的正常运行时间 SLA
- 符合 SOC 2
- 成本低于 $500/月
- 部署到多个环境（dev、staging、prod）

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: 是否满足所有需求？
- ✅ **Security**: 是否实施了最佳实践？
- ✅ **Scalability**: 能否应对负载？
- ✅ **Maintainability**: 代码和基础设施是否组织良好？
- ✅ **Cost**: 是否在预算内？

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

恭喜！您已完成 AI Workshop Lab。您现在应该能够：
- ✅ 将现有 AI 应用转换为 AZD 模板
- ✅ 部署适用于生产的 AI 应用
- ✅ 为 AI 工作负载实施安全最佳实践
- ✅ 监控并优化 AI 应用性能
- ✅ 排查常见部署问题

### 后续步骤
1. 将这些模式应用到你自己的 AI 项目中
2. 将模板贡献回社区
3. 加入 Microsoft Foundry Discord 获得持续支持
4. 探索多区域部署等高级主题

---

<strong>研讨会反馈</strong>：通过在 [Microsoft Foundry Discord #Azure 频道](https://discord.gg/microsoft-azure) 分享你的体验，帮助我们改进本次研讨会。

---

**章节导航：**
- **📚 课程主页**: [AZD 初学者指南](../../README.md)
- **📖 当前章节**: 第 2 章 - 以 AI 为先的开发
- **⬅️ 上一章**: [AI 模型部署](ai-model-deployment.md)
- **➡️ 下一章**: [生产 AI 最佳实践](production-ai-practices.md)
- **🚀 下一章**: [第 3 章: 配置](../chapter-03-configuration/configuration.md)

**需要帮助吗？** 加入我们的社区以获得关于 AZD 和 AI 部署的支持与讨论。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**: 本文件已使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们努力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的原文应被视为权威来源。对于关键信息，建议使用专业人工翻译。因使用本翻译而导致的任何误解或曲解，我们不承担任何责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
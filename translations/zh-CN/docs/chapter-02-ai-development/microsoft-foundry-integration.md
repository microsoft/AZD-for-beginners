# Microsoft Foundry 与 AZD 集成

**章节导航:**
- **📚 课程主页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第2章 - 以 AI 为先的开发
- **⬅️ 上一章**: [第1章：您的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一步**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第3章：配置](../chapter-03-configuration/configuration.md)

## 概述

本指南演示如何将 Microsoft Foundry 服务与 Azure Developer CLI (AZD) 集成，以简化 AI 应用的部署流程。Microsoft Foundry 提供了构建、部署和管理 AI 应用的综合平台，而 AZD 简化了基础设施和部署过程。

## 什么是 Microsoft Foundry？

Microsoft Foundry 是微软面向 AI 开发的统一平台，包括：

- **Model Catalog（模型目录）**: 访问最先进的 AI 模型
- **Prompt Flow**: 面向 AI 工作流的可视化设计器
- **AI Foundry Portal**: 面向 AI 应用的集成开发环境
- **Deployment Options（部署选项）**: 多种托管和扩展选项
- **Safety and Security（安全与合规）**: 内置的负责任 AI 功能

## AZD + Microsoft Foundry：更强的结合

| 功能 | Microsoft Foundry | AZD 集成优势 |
|---------|-----------------|------------------------|
| **模型部署** | 手动门户部署 | 自动化、可重复的部署 |
| **基础设施** | 点击式配置 | 基础设施即代码 (Bicep) |
| **环境管理** | 单一环境为主 | 多环境（开发/暂存/生产） |
| **CI/CD 集成** | 有限 | 原生 GitHub Actions 支持 |
| **成本管理** | 基础监控 | 按环境的成本优化 |

## 先决条件

- 具有相应权限的 Azure 订阅
- 已安装 Azure Developer CLI
- 可访问 Azure OpenAI 服务
- 对 Microsoft Foundry 有基本了解

## 核心集成模式

### 模式 1：Azure OpenAI 集成

**用例**：使用 Azure OpenAI 模型部署聊天应用

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**基础设施 (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### 模式 2：AI 搜索 + RAG 集成

**用例**：部署检索增强生成（RAG）应用

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### 模式 3：文档智能集成

**用例**：文档处理与分析工作流

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 配置模式

### 环境变量设置

**生产环境配置:**
```bash
# 核心AI服务
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# 性能设置
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**开发环境配置:**
```bash
# 为开发优化成本的设置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免费层
```

### 使用 Key Vault 的安全配置

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## 部署工作流

### 单命令部署

```bash
# 用一条命令部署所有内容
azd up

# 或者逐步部署
azd provision  # 仅基础设施
azd deploy     # 仅应用程序
```

### 特定环境部署

```bash
# 开发环境
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# 生产环境
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## 监控与可观测性

### Application Insights 集成

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### 成本监控

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 安全最佳实践

### 托管身份配置

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### 网络安全

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## 性能优化

### 缓存策略

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### 自动扩缩配置

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## 常见问题排查

### 问题 1：OpenAI 配额超限

**症状:**
- 部署因配额错误而失败
- 应用日志中出现 429 错误

**解决方案:**
```bash
# 检查当前配额使用情况
az cognitiveservices usage list --location eastus

# 尝试不同的区域
azd env set AZURE_LOCATION westus2
azd up

# 暂时减少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 问题 2：身份验证失败

**症状:**
- 调用 AI 服务时出现 401/403 错误
- “访问被拒绝”消息

**解决方案:**
```bash
# 验证角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 检查托管标识配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 验证 Key Vault 访问权限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 问题 3：模型部署问题

**症状:**
- 模型在部署中不可用
- 特定模型版本失败

**解决方案:**
```bash
# 按区域列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 模板中更新模型版本
# 检查模型容量要求
```

## 示例模板

### 基础聊天应用

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**服务**: Azure OpenAI + Cognitive Search + App Service

**快速开始**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### 文档处理流水线

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**服务**: 文档智能 + 存储 + Functions

**快速开始**:
```bash
azd init --template ai-document-processing
azd up
```

### 企业级 RAG 聊天

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**服务**: Azure OpenAI + Search + Container Apps + Cosmos DB

**快速开始**:
```bash
azd init --template contoso-chat
azd up
```

## 下一步

1. **尝试示例**: 从与您的用例匹配的预构建模板开始
2. **根据需求定制**: 修改基础设施和应用代码
3. **添加监控**: 实施全面的可观测性
4. **优化成本**: 调整配置以符合预算
5. **保护您的部署**: 实施企业级安全模式
6. **扩展到生产**: 添加多区域和高可用特性

## 🎯 实战练习

### 练习 1：部署 Azure OpenAI 聊天应用（30 分钟）
**目标**：部署并测试生产就绪的 AI 聊天应用

```bash
# 初始化模板
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# 设置环境变量
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# 部署
azd up

# 测试应用程序
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# 监控 AI 操作
azd monitor

# 清理
azd down --force --purge
```

**成功标准:**
- [ ] 部署完成且无配额错误
- [ ] 可以在浏览器中访问聊天界面
- [ ] 能提问并获得 AI 支持的回答
- [ ] Application Insights 显示遥测数据
- [ ] 成功清理资源

**预计费用**: $5-10（30 分钟测试）

### 练习 2：配置多模型部署（45 分钟）
**目标**：以不同配置部署多个 AI 模型

```bash
# 创建自定义 Bicep 配置
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# 部署并验证
azd provision
azd show
```

**成功标准:**
- [ ] 多个模型成功部署
- [ ] 应用不同的容量设置
- [ ] 模型可通过 API 访问
- [ ] 应用可以调用多个模型

### 练习 3：实现成本监控（20 分钟）
**目标**：设置预算警报和成本跟踪

```bash
# 将预算警报添加到 Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# 部署预算警报
azd provision

# 检查当前费用
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功标准:**
- [ ] 在 Azure 中创建预算警报
- [ ] 配置电子邮件通知
- [ ] 可以在 Azure 门户查看成本数据
- [ ] 合理设置预算阈值

## 💡 常见问题解答

<details>
<summary><strong>如何在开发期间降低 Azure OpenAI 成本？</strong></summary>

1. **使用免费额度**: Azure OpenAI 提供每月 50,000 个 tokens 的免费额度
2. **降低容量**: 在开发环境中将容量设置为 10 TPM 而不是 30+
3. **使用 azd down**: 在不积极开发时释放资源
4. **缓存响应**: 为重复查询实现 Redis 缓存
5. **使用提示工程**: 通过高效的提示减少 token 使用量

```bash
# 开发配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI 和 OpenAI API 有何不同？</strong></summary>

**Azure OpenAI**:
- 企业级安全与合规
- 私有网络集成
- SLA 保证
- 托管身份验证
- 可用更高的配额

**OpenAI API**:
- 更快获得新模型
- 设置更简单
- 更低的入门门槛
- 仅限公共互联网

对于生产应用，**推荐使用 Azure OpenAI**。
</details>

<details>
<summary><strong>如何处理 Azure OpenAI 配额超限错误？</strong></summary>

```bash
# 检查当前配额
az cognitiveservices usage list --location eastus2

# 尝试其他区域
azd env set AZURE_LOCATION westus2
azd up

# 临时降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 请求提高配额
# 转到 Azure 门户 > 配额 > 请求提高
```
</details>

<details>
<summary><strong>我可以将自己的数据用于 Azure OpenAI 吗？</strong></summary>

可以！使用 **Azure AI Search** 来实现 RAG（检索增强生成）：

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

参见 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 模板。
</details>

<details>
<summary><strong>如何保护 AI 模型端点？</strong></summary>

**最佳实践**:
1. 使用托管身份（无需 API 密钥）
2. 启用私有端点
3. 配置网络安全组
4. 实施速率限制
5. 使用 Azure Key Vault 存储密钥

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## 社区与支持

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文档](https://learn.microsoft.com/azure/ai-studio/)

---

**章节导航:**
- **📚 课程主页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第2章 - 以 AI 为先的开发
- **⬅️ 上一章**: [第1章：您的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一步**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第3章：配置](../chapter-03-configuration/configuration.md)

**需要帮助？** 加入我们的社区讨论或在仓库中打开 issue。Azure AI + AZD 社区将帮助您取得成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免责声明：

本文件由 AI 翻译服务 Co-op Translator（https://github.com/Azure/co-op-translator）翻译。尽管我们尽力保证准确性，但请注意，自动翻译可能包含错误或不准确之处。应以原始语言的原文为准并作为权威来源。对于关键信息，建议采用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
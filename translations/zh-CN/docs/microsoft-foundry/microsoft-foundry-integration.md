# Microsoft Foundry 与 AZD 的集成

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第 2 章 - AI 优先开发
- **⬅️ 上一章**：[第 1 章：你的第一个项目](../getting-started/first-project.md)
- **➡️ 下一步**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**：[第 3 章：配置](../getting-started/configuration.md)

## 概述

本指南展示了如何将 Microsoft Foundry 服务与 Azure Developer CLI (AZD) 集成，以简化 AI 应用程序的部署流程。Microsoft Foundry 提供了一个全面的平台，用于构建、部署和管理 AI 应用程序，而 AZD 则简化了基础设施和部署过程。

## 什么是 Microsoft Foundry？

Microsoft Foundry 是微软统一的 AI 开发平台，包含以下功能：

- **模型目录**：访问最先进的 AI 模型
- **Prompt Flow**：AI 工作流的可视化设计器
- **AI Foundry 门户**：AI 应用程序的集成开发环境
- **部署选项**：多种托管和扩展选项
- **安全性**：内置的负责任 AI 功能

## AZD + Microsoft Foundry：更强大的组合

| 功能 | Microsoft Foundry | AZD 集成优势 |
|------|------------------|--------------|
| **模型部署** | 手动门户部署 | 自动化、可重复的部署 |
| **基础设施** | 点击式配置 | 基础设施即代码 (Bicep) |
| **环境管理** | 单一环境 | 多环境（开发/测试/生产） |
| **CI/CD 集成** | 有限 | 原生支持 GitHub Actions |
| **成本管理** | 基本监控 | 环境特定的成本优化 |

## 先决条件

- 拥有适当权限的 Azure 订阅
- 已安装 Azure Developer CLI
- 访问 Azure OpenAI 服务
- 对 Microsoft Foundry 有基本了解

## 核心集成模式

### 模式 1：Azure OpenAI 集成

**用例**：使用 Azure OpenAI 模型部署聊天应用程序

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

**基础设施 (main.bicep)：**
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

**用例**：部署检索增强生成 (RAG) 应用程序

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

**用例**：文档处理和分析工作流

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

**生产配置：**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**开发配置：**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### 使用 Key Vault 实现安全配置

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
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### 环境特定部署

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## 监控与可观测性

### 应用程序洞察集成

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

### 自动扩展配置

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

**症状：**
- 部署因配额错误失败
- 应用日志中出现 429 错误

**解决方案：**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 问题 2：身份验证失败

**症状：**
- 调用 AI 服务时出现 401/403 错误
- 显示“访问被拒绝”消息

**解决方案：**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 问题 3：模型部署问题

**症状：**
- 部署中模型不可用
- 特定模型版本部署失败

**解决方案：**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## 示例模板

### 基本聊天应用程序

**代码库**：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**服务**：Azure OpenAI + 认知搜索 + 应用服务

**快速开始**：
```bash
azd init --template azure-search-openai-demo
azd up
```

### 文档处理管道

**代码库**：[ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**服务**：文档智能 + 存储 + 函数

**快速开始**：
```bash
azd init --template ai-document-processing
azd up
```

### 企业级 RAG 聊天

**代码库**：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**服务**：Azure OpenAI + 搜索 + 容器应用 + Cosmos DB

**快速开始**：
```bash
azd init --template contoso-chat
azd up
```

## 下一步

1. **尝试示例**：从与您的用例匹配的预构建模板开始
2. **根据需求定制**：修改基础设施和应用程序代码
3. **添加监控**：实现全面的可观测性
4. **优化成本**：根据预算调整配置
5. **保护部署**：实施企业级安全模式
6. **扩展到生产环境**：添加多区域和高可用性功能

## 🎯 实践练习

### 练习 1：部署 Azure OpenAI 聊天应用（30 分钟）
**目标**：部署并测试一个生产就绪的 AI 聊天应用

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Deploy
azd up

# Test the application
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**成功标准：**
- [ ] 部署无配额错误完成
- [ ] 能在浏览器中访问聊天界面
- [ ] 能提问并获得 AI 驱动的回答
- [ ] 应用程序洞察显示遥测数据
- [ ] 成功清理资源

**预计成本**：测试 30 分钟约 $5-10

### 练习 2：配置多模型部署（45 分钟）
**目标**：部署具有不同配置的多个 AI 模型

```bash
# Create custom Bicep configuration
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

# Deploy and verify
azd provision
azd show
```

**成功标准：**
- [ ] 多个模型成功部署
- [ ] 应用不同的容量设置
- [ ] 模型可通过 API 访问
- [ ] 应用程序能调用所有模型

### 练习 3：实施成本监控（20 分钟）
**目标**：设置预算警报和成本跟踪

```bash
# Add budget alert to Bicep
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

# Deploy budget alert
azd provision

# Check current costs
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功标准：**
- [ ] 在 Azure 中创建预算警报
- [ ] 配置电子邮件通知
- [ ] 能在 Azure 门户中查看成本数据
- [ ] 适当设置预算阈值

## 💡 常见问题解答

<details>
<summary><strong>如何在开发过程中降低 Azure OpenAI 成本？</strong></summary>

1. **使用免费层**：Azure OpenAI 提供每月 50,000 个免费 token
2. **降低容量**：将容量设置为 10 TPM 而非 30+ 用于开发
3. **使用 azd down**：在不活跃开发时释放资源
4. **缓存响应**：对重复查询实现 Redis 缓存
5. **使用 Prompt Engineering**：通过高效提示减少 token 使用

```bash
# Development configuration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI 和 OpenAI API 有什么区别？</strong></summary>

**Azure OpenAI**：
- 企业级安全性和合规性
- 私有网络集成
- SLA 保证
- 托管身份认证
- 提供更高的配额

**OpenAI API**：
- 更快访问新模型
- 设置更简单
- 入门门槛更低
- 仅支持公共互联网

对于生产应用，**推荐使用 Azure OpenAI**。
</details>

<details>
<summary><strong>如何处理 Azure OpenAI 配额超限错误？</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>我可以使用自己的数据与 Azure OpenAI 一起吗？</strong></summary>

可以！使用 **Azure AI Search** 实现 RAG（检索增强生成）：

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

**最佳实践**：
1. 使用托管身份（无需 API 密钥）
2. 启用私有端点
3. 配置网络安全组
4. 实现速率限制
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

- **Microsoft Foundry Discord**：[Azure 频道](https://discord.gg/microsoft-azure)
- **AZD GitHub**：[问题与讨论](https://github.com/Azure/azure-dev)
- **Microsoft Learn**：[官方文档](https://learn.microsoft.com/azure/ai-studio/)

---

**章节导航：**
- **📚 课程主页**：[AZD 初学者指南](../../README.md)
- **📖 当前章节**：第 2 章 - AI 优先开发
- **⬅️ 上一章**：[第 1 章：你的第一个项目](../getting-started/first-project.md)
- **➡️ 下一步**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**：[第 3 章：配置](../getting-started/configuration.md)

**需要帮助？** 加入我们的社区讨论或在代码库中提交问题。Azure AI + AZD 社区随时为您提供支持！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
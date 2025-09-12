<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T17:31:00+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "zh"
}
-->
# Azure AI Foundry 与 AZD 的集成

**上一节：** [第一个项目](../getting-started/first-project.md) | **下一节：** [AI 模型部署](ai-model-deployment.md)

## 概述

本指南展示如何将 Azure AI Foundry 服务与 Azure Developer CLI (AZD) 集成，以简化 AI 应用的部署流程。Azure AI Foundry 提供了一个全面的平台，用于构建、部署和管理 AI 应用，而 AZD 则简化了基础设施和部署过程。

## 什么是 Azure AI Foundry？

Azure AI Foundry 是微软的统一 AI 开发平台，包括以下功能：

- **模型目录**：访问最先进的 AI 模型
- **Prompt Flow**：AI 工作流的可视化设计工具
- **AI Foundry 门户**：集成的 AI 应用开发环境
- **部署选项**：多种托管和扩展选项
- **安全性与合规性**：内置负责任的 AI 功能

## AZD + Azure AI Foundry：更强大的组合

| 功能 | Azure AI Foundry | AZD 集成优势 |
|------|------------------|--------------|
| **模型部署** | 手动门户部署 | 自动化、可重复的部署 |
| **基础设施** | 点击式配置 | 基础设施即代码 (Bicep) |
| **环境管理** | 单一环境专注 | 多环境支持（开发/测试/生产） |
| **CI/CD 集成** | 有限支持 | 原生 GitHub Actions 支持 |
| **成本管理** | 基础监控 | 基于环境的成本优化 |

## 前提条件

- 拥有适当权限的 Azure 订阅
- 已安装 Azure Developer CLI
- 访问 Azure OpenAI 服务
- 对 Azure AI Foundry 有基本了解

## 核心集成模式

### 模式 1：Azure OpenAI 集成

**使用场景**：使用 Azure OpenAI 模型部署聊天应用

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

**使用场景**：部署检索增强生成 (RAG) 应用

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

**使用场景**：文档处理和分析工作流

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

**生产环境配置：**
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

**开发环境配置：**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### 使用 Key Vault 进行安全配置

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

### 基于环境的部署

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

### 应用洞察集成

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
- 部署中无法使用模型
- 特定模型版本部署失败

**解决方案：**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## 示例模板

### 基础聊天应用

**代码库**： [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**服务**：Azure OpenAI + Cognitive Search + App Service

**快速开始**：
```bash
azd init --template azure-search-openai-demo
azd up
```

### 文档处理管道

**代码库**： [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**服务**：Document Intelligence + Storage + Functions

**快速开始**：
```bash
azd init --template ai-document-processing
azd up
```

### 企业级 RAG 聊天应用

**代码库**： [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**服务**：Azure OpenAI + Search + Container Apps + Cosmos DB

**快速开始**：
```bash
azd init --template contoso-chat
azd up
```

## 下一步

1. **尝试示例**：从与您的使用场景匹配的预构建模板开始
2. **根据需求定制**：修改基础设施和应用代码
3. **添加监控**：实施全面的可观测性
4. **优化成本**：根据预算调整配置
5. **保护部署**：实施企业级安全模式
6. **扩展到生产环境**：添加多区域和高可用性功能

## 社区与支持

- **Azure AI Foundry Discord**：[#Azure 频道](https://discord.gg/microsoft-azure)
- **AZD GitHub**： [问题与讨论](https://github.com/Azure/azure-dev)
- **Microsoft Learn**： [官方文档](https://learn.microsoft.com/azure/ai-studio/)

---

**上一节：** [第一个项目](../getting-started/first-project.md) | **下一节：** [AI 模型部署](ai-model-deployment.md)

**需要帮助？** 加入我们的社区讨论或在代码库中提交问题。Azure AI + AZD 社区随时为您的成功提供支持！

---

**免责声明**：  
本文档使用AI翻译服务[Co-op Translator](https://github.com/Azure/co-op-translator)进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。
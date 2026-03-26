# Microsoft Foundry 与 AZD 的集成

**章节导航：**
- **📚 课程主页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第 2 章 - 以 AI 为先的开发
- **⬅️ 上一章**: [第 1 章：你的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一页**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章节**: [第 3 章：配置](../chapter-03-configuration/configuration.md)

## 概览

本指南演示如何将 Microsoft Foundry 服务与 Azure 开发者 CLI (AZD) 集成，以实现简化的 AI 应用部署。Microsoft Foundry 提供了用于构建、部署和管理 AI 应用的综合平台，而 AZD 则简化了基础设施和部署流程。

## 什么是 Microsoft Foundry？

Microsoft Foundry 是微软统一的 AI 开发平台，包括：

- <strong>模型目录</strong>：可访问最先进的 AI 模型
- **Prompt Flow**：用于 AI 工作流的可视化设计器
- **Microsoft Foundry 门户**：用于 AI 应用的一体化开发环境
- <strong>部署选项</strong>：多种托管和扩展选项
- <strong>安全与合规</strong>：内置的负责任 AI 功能

## AZD + Microsoft Foundry：更佳搭配

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## 先决条件

- 具有适当权限的 Azure 订阅
- 已安装 Azure Developer CLI
- 可访问 Microsoft Foundry Models 服务
- 对 Microsoft Foundry 有基本了解

## 核心集成模式

### 模式 1：Microsoft Foundry Models 集成

<strong>用例</strong>：使用 Microsoft Foundry Models 模型部署聊天应用

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

**基础设施（main.bicep）：**
```bicep
// Microsoft Foundry Models Account
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

<strong>用例</strong>：部署检索增强生成（RAG）应用

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

<strong>用例</strong>：文档处理和分析工作流

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
# 核心人工智能服务
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

**开发配置：**
```bash
# 针对开发的成本优化设置
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

### 适用于 Foundry 的 AZD 扩展

AZD 提供了扩展，添加了与 Microsoft Foundry 服务协同工作的 AI 特定功能：

```bash
# 安装 Foundry agents 扩展
azd extension install azure.ai.agents

# 安装微调扩展
azd extension install azure.ai.finetune

# 安装自定义模型扩展
azd extension install azure.ai.models

# 列出已安装的扩展
azd extension list
```

### 使用 `azd ai` 的 Agent-First 部署

如果你有 agent 清单，请使用 `azd ai agent init` 来生成与 Foundry Agent 服务连接的项目脚手架：

```bash
# 从代理清单初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

参见 [AZD AI CLI 命令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以获取完整的命令参考和标志说明。

### 单命令部署

```bash
# 使用一条命令部署所有内容
azd up

# 或者逐步部署
azd provision  # 仅基础设施
azd deploy     # 仅应用
```

### 针对特定环境的部署

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

### 自动伸缩配置

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

### 问题 1：OpenAI 配额超出

**症状：**
- 部署因配额错误失败
- 应用日志中出现 429 错误

**解决方案：**
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

**症状：**
- 调用 AI 服务时出现 401/403 错误
- “访问被拒绝”消息

**解决方案：**
```bash
# 验证角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 检查托管身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 验证密钥保管库访问权限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 问题 3：模型部署问题

**症状：**
- 部署中模型不可用
- 特定模型版本失败

**解决方案：**
```bash
# 按区域列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 模板中更新模型版本
# 检查模型容量要求
```

## 示例模板

### RAG 聊天应用（Python）

<strong>仓库</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服务</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>描述</strong>: 最流行的 Azure AI 示例——一个面向生产的 RAG 聊天应用，允许你基于自己的文档提问。使用 GPT-4.1-mini 进行聊天，text-embedding-ada-002 用于嵌入，Azure AI Search 用于检索。支持多模态文档、语音输入/输出、Microsoft Entra 身份验证以及 Application Insights 跟踪。

<strong>快速开始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天应用（.NET）

<strong>仓库</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服务</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>描述</strong>: Python RAG 聊天示例的 .NET/C# 等效实现。使用 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端构建。包含语音聊天、GPT-4o-mini 视觉支持，以及配套的 .NET MAUI Blazor Hybrid 桌面/移动客户端。

<strong>快速开始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天应用（Java）

<strong>仓库</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服务</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>描述</strong>: 使用 Langchain4J 进行 AI 编排的 Java 版本 RAG 聊天示例。支持微服务事件驱动架构、多个检索策略（文本、向量、混合）、使用 Azure Document Intelligence 的文档上传，并可部署在 Azure Container Apps 或 Azure Kubernetes Service 上。

<strong>快速开始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 企业零售 Copilot（基于 Azure AI Foundry）

<strong>仓库</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服务</strong>: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>描述</strong>: 端到端的零售 RAG copilot，使用 Azure AI Foundry 和 Prompty。一个 Contoso 户外零售商的聊天机器人，将响应基于产品目录和客户订单数据进行落地。演示完整的 GenAIOps 工作流——使用 Prompty 原型、通过 AI 辅助评估器进行评估，并通过 AZD 部署到 Container Apps。

<strong>快速开始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 创意写作多代理应用

<strong>仓库</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服务</strong>: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>描述</strong>: 多代理示例，演示使用 Prompty 的 AI 代理编排。使用研究代理（在 Azure AI Agent Service 中使用 Bing Grounding）、产品代理（Azure AI Search）、写作代理和编辑代理协同生成有充分研究支撑的文章。包含在 GitHub Actions 中进行评估的 CI/CD。

<strong>快速开始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 无服务器 RAG 聊天（JavaScript/TypeScript）

<strong>仓库</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服务</strong>: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>描述</strong>: 完全无服务器的 RAG 聊天机器人，使用 LangChain.js，Azure Functions 提供 API，Azure Static Web Apps 承载前端。使用 Azure Cosmos DB 作为向量存储和聊天历史数据库。支持使用 Ollama 进行的本地开发以实现零成本测试。

<strong>快速开始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 与你的数据聊天 解决方案加速器

<strong>仓库</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服务</strong>: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>描述</strong>: 面向企业级的 RAG 解决方案加速器，带有用于文档上传/管理的管理门户、多种编排器选项（Semantic Kernel、LangChain、Prompt Flow）、语音转文本、Microsoft Teams 集成，并提供 PostgreSQL 或 Cosmos DB 后端选项。设计为可定制的生产 RAG 场景起点。

<strong>快速开始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅行代理 — 多代理 MCP 编排

<strong>仓库</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服务</strong>: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

<strong>描述</strong>: 用于多代理 AI 编排的参考应用，使用三种框架（LangChain.js、LlamaIndex.TS 和 Microsoft Agent Framework）。特色包括以四种语言实现的 MCP（Model Context Protocol）服务器，作为无服务器 Azure Container Apps 部署，并配有 OpenTelemetry 监控。

<strong>快速开始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 入门

<strong>仓库</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服务</strong>: Azure AI Services + Azure OpenAI

<strong>描述</strong>: 一个最小的 Bicep 模板，用于部署已配置的 Azure AI 服务及相应的机器学习模型。当你只需配置 Azure AI 基础设施而不需要完整应用堆栈时，这是一个轻量级的起点。

<strong>快速开始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>浏览更多模板</strong>：访问 [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) 查看 80+ 个跨语言和场景的 AI 专用 AZD 模板。

## 后续步骤

1. <strong>试用示例</strong>：从与您的用例相匹配的预构建模板开始
2. <strong>按需定制</strong>：修改基础设施和应用代码
3. <strong>添加监控</strong>：实现全面的可观测性
4. <strong>优化成本</strong>：为预算微调配置
5. <strong>保护部署</strong>：实施企业级安全模式
6. <strong>扩展到生产</strong>：添加多区域和高可用性功能

## 🎯 动手练习

### 练习 1：部署 Microsoft Foundry Models 聊天应用（30 分钟）
<strong>目标</strong>：部署并测试一个可用于生产的 AI 聊天应用

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

# 监控人工智能运行
azd monitor

# 清理
azd down --force --purge
```

**成功标准：**
- [ ] 部署完成且无配额错误
- [ ] 能在浏览器中访问聊天界面
- [ ] 能提问并获得 AI 驱动的响应
- [ ] Application Insights 显示遥测数据
- [ ] 成功清理资源

<strong>预计费用</strong>：30 分钟测试约 $5-10

### 练习 2：配置多模型部署（45 分钟）
<strong>目标</strong>：部署具有不同配置的多个 AI 模型

```bash
# 创建自定义 Bicep 配置
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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

**成功标准：**
- [ ] 多个模型已成功部署
- [ ] 已应用不同的容量设置
- [ ] 模型可通过 API 访问
- [ ] 应用能调用所有模型

### 练习 3：实现成本监控（20 分钟）
<strong>目标</strong>：设置预算警报和成本跟踪

```bash
# 向 Bicep 添加预算警报
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

**成功标准：**
- [ ] 在 Azure 中创建了预算警报
- [ ] 已配置电子邮件通知
- [ ] 能在 Azure 门户查看成本数据
- [ ] 已适当设置预算阈值

## 💡 常见问题解答

<details>
<summary><strong>如何在开发期间降低 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免费层</strong>：Microsoft Foundry Models 提供每月 50,000 tokens 的免费额度
2. <strong>降低容量</strong>：将容量设置为 10 TPM 而不是 30+，用于开发环境
3. **使用 azd down**：在不主动开发时释放资源
4. <strong>缓存响应</strong>：为重复查询实现 Redis 缓存
5. <strong>使用提示工程</strong>：通过高效的提示减少 tokens 使用

```bash
# 开发配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models 与 OpenAI API 有何区别？</strong></summary>

**Microsoft Foundry Models**：
- 企业级安全与合规性
- 私有网络集成
- SLA 保证
- 托管身份验证
- 可提供更高的配额

**OpenAI API**：
- 更快访问新模型
- 更简单的设置
- 更低的入门门槛
- 仅限公共互联网

对于生产应用，**建议使用 Microsoft Foundry Models**。
</details>

<details>
<summary><strong>我如何处理 Microsoft Foundry 模型配额超出错误？</strong></summary>

```bash
# 检查当前配额
az cognitiveservices usage list --location eastus2

# 尝试不同的区域
azd env set AZURE_LOCATION westus2
azd up

# 暂时降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 请求提高配额
# 转到 Azure 门户 > 配额 > 请求增加
```
</details>

<details>
<summary><strong>我可以将自己的数据与 Microsoft Foundry 模型一起使用吗？</strong></summary>

是的！使用 **Azure AI Search** 进行 RAG（检索增强生成）：

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

请参阅 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 模板。
</details>

<details>
<summary><strong>如何保护 AI 模型端点？</strong></summary>

<strong>最佳实践</strong>:
1. 使用托管身份（无需 API 密钥）
2. 启用专用终结点
3. 配置网络安全组
4. 实施速率限制
5. 使用 Azure Key Vault 管理机密

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

- **Microsoft Foundry Discord**: [#Azure 频道](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [问题和讨论](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文档](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 在你的编辑器中使用 `npx skills add microsoft/github-copilot-for-azure` 安装 Azure + Foundry 代理技能

---

**章节导航：**
- **📚 课程首页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第2章 - AI 优先开发
- **⬅️ 上一章**: [第1章：你的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一页**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 下一章**: [第3章：配置](../chapter-03-configuration/configuration.md)

**需要帮助吗？** 加入我们的社区讨论或在仓库中打开问题。Azure AI + AZD 社区会帮助你取得成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译而成。尽管我们尽力确保准确性，但请注意自动翻译可能存在错误或不准确之处。原始文档的原文应被视为权威来源。对于关键信息，建议采用人工专业翻译。对于因使用本翻译而产生的任何误解或错误解释，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
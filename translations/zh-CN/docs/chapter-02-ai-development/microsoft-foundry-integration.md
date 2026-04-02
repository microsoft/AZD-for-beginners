# Microsoft Foundry 与 AZD 的集成

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 第 2 章 - 以 AI 为先的开发
- **⬅️ Previous Chapter**: [第 1 章：你的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI 模型部署](ai-model-deployment.md)
- **🚀 Next Chapter**: [第 3 章：配置](../chapter-03-configuration/configuration.md)

## 概览

本指南演示如何将 Microsoft Foundry 服务与 Azure Developer CLI (AZD) 集成，以简化 AI 应用的部署。Microsoft Foundry 提供了一个用于构建、部署和管理 AI 应用的综合平台，而 AZD 则简化了基础设施和部署流程。

## 什么是 Microsoft Foundry？

Microsoft Foundry 是微软的统一 AI 开发平台，包含：

- **Model Catalog**：访问先进的 AI 模型
- **Prompt Flow**：用于 AI 工作流的可视化设计器
- **Microsoft Foundry Portal**：集成的 AI 应用开发环境
- **Deployment Options**：多种托管与扩展选项
- **Safety and Security**：内置的责任型 AI 功能

## AZD + Microsoft Foundry：更强的组合

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | 手动门户部署 | 自动化、可重复的部署 |
| **Infrastructure** | 点击式配置 | 基础设施即代码（Bicep） |
| **Environment Management** | 侧重单一环境 | 多环境（开发/暂存/生产） |
| **CI/CD Integration** | 有限 | 原生 GitHub Actions 支持 |
| **Cost Management** | 基本监控 | 按环境的成本优化 |

## 先决条件

- 具有适当权限的 Azure 订阅
- 已安装 Azure Developer CLI
- 可访问 Microsoft Foundry Models 服务
- 对 Microsoft Foundry 有基本了解

> **当前 AZD 基线：** 这些示例基于 `azd` `1.23.12` 进行了审阅。对于 AI 代理工作流，请使用当前的预览扩展发行版，并在开始之前检查您已安装的版本。

## 核心集成模式

### 模式 1：Microsoft Foundry 模型集成

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

**基础设施 (main.bicep)：**
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
```

### 模式 2：AI 搜索 + RAG 集成

<strong>用例</strong>：部署检索增强生成 (RAG) 应用

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
# 核心 AI 服务
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# 性能设置
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**开发配置：**
```bash
# 用于开发的成本优化设置
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

### Foundry 的 AZD 扩展

AZD 提供扩展，为与 Microsoft Foundry 服务协作添加 AI 特定功能：

```bash
# 安装 Foundry agents 扩展
azd extension install azure.ai.agents

# 安装微调扩展
azd extension install azure.ai.finetune

# 安装自定义模型扩展
azd extension install azure.ai.models

# 列出已安装的扩展
azd extension list --installed

# 检查当前已安装的代理扩展版本
azd extension show azure.ai.agents
```

AI 扩展仍在预览阶段快速演进。如果某个命令的行为与此处所示不同，请在排查项目本身之前升级相关扩展。

### 使用 `azd ai` 的以代理为先的部署

如果您有代理清单，请使用 `azd ai agent init` 来脚手架一个与 Foundry Agent Service 连接的项目：

```bash
# 从代理清单初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

最近的 `azure.ai.agents` 预览发行版还为 `azd ai agent init` 添加了基于模板的初始化支持。如果您正在参考更新的代理示例，请检查已安装扩展的帮助以获取可用标志的精确信息。

有关完整命令参考和标志，请参阅 [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

### 一键部署

```bash
# 使用一条命令部署所有内容
azd up

# 或者增量部署
azd provision  # 仅基础设施
azd deploy     # 仅应用程序

# 适用于 azd 1.23.11 及更高版本的长期运行 AI 应用部署
azd deploy --timeout 1800
```

### 针对环境的部署

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

### 问题 1：OpenAI 配额超限

**症状：**
- 部署因配额错误而失败
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
- 显示“访问被拒绝”消息

**解决方案：**
```bash
# 验证角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 检查托管标识配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 验证对 Key Vault 的访问
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 问题 3：模型部署问题

**症状：**
- 模型在部署中不可用
- 特定模型版本失败

**解决方案：**
```bash
# 按地区列出可用模型
az cognitiveservices model list --location eastus

# 在 Bicep 模板中更新模型版本
# 检查模型容量要求
```

## 示例模板

### RAG 聊天应用（Python）

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: 最受欢迎的 Azure AI 示例 —— 一个生产就绪的 RAG 聊天应用，允许您基于自己的文档提问。使用 GPT-4.1-mini 进行聊天，text-embedding-3-large 用于向量嵌入，Azure AI Search 用于检索。支持多模态文档、语音输入/输出、Microsoft Entra 身份验证和 Application Insights 跟踪。

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天应用（.NET）

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG 聊天示例的 .NET/C# 等效实现。使用 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端构建。包含语音聊天、GPT-4o-mini 视觉支持，以及配套的 .NET MAUI Blazor 混合桌面/移动客户端。

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天应用（Java）

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: 使用 Langchain4J 进行 AI 编排的 RAG 聊天示例的 Java 版本。支持微服务事件驱动架构、多种检索策略（文本、向量、混合）、使用 Azure Document Intelligence 的文档上传，并可部署到 Azure Container Apps 或 Azure Kubernetes Service。

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 基于 Azure AI Foundry 的企业零售助理

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: 使用 Azure AI Foundry 和 Prompty 的端到端零售 RAG 助手。一个 Contoso 户外零售商聊天机器人，其响应基于产品目录和客户订单数据。展示完整的 GenAIOps 工作流 —— 使用 Prompty 原型化、通过 AI 协助评估器评估，并通过 AZD 部署到 Container Apps。

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### 创意写作多代理应用

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: 多代理示例，演示使用 Prompty 的 AI 代理编排。使用研究代理（在 Azure AI Agent Service 中的 Bing Grounding）、产品代理（Azure AI Search）、写作代理和编辑代理协作生成经过充分研究的文章。包含在 GitHub Actions 中带评估的 CI/CD。

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### 无服务器 RAG 聊天（JavaScript/TypeScript）

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: 完全无服务器的 RAG 聊天机器人，使用 LangChain.js，API 使用 Azure Functions，托管使用 Azure Static Web Apps。使用 Azure Cosmos DB 作为向量存储和聊天历史数据库。支持使用 Ollama 进行本地开发以实现零成本测试。

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 基于数据聊天解决方案加速器

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: 企业级 RAG 解决方案加速器，带有用于文档上传/管理的管理员门户、多种编排器选项（Semantic Kernel、LangChain、Prompt Flow）、语音转文本、Microsoft Teams 集成，以及 PostgreSQL 或 Cosmos DB 后端可选。设计为生产 RAG 场景的可定制起点。

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅行代理 — 多代理 MCP 编排

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: 多代理 AI 编排的参考应用，使用三种框架（LangChain.js、LlamaIndex.TS 和 Microsoft Agent Framework）。特色是以四种语言实现的 MCP（Model Context Protocol）服务器，作为无服务器的 Azure Container Apps 部署，并具有 OpenTelemetry 监控。

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: 一个最小的 Bicep 模板，用于部署带有已配置机器学习模型的 Azure AI 服务。当您仅需要部署 Azure AI 基础设施而不需要完整应用堆栈时，这是一个轻量级起点。

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## 下一步

1. <strong>尝试示例</strong>：从与您用例匹配的预构建模板开始
2. <strong>定制以满足需求</strong>：修改基础设施和应用代码
3. <strong>添加监控</strong>：实现全面的可观测性
4. <strong>优化成本</strong>：为预算微调配置
5. <strong>保护您的部署</strong>：实施企业级安全模式
6. <strong>扩展到生产</strong>：添加多区域和高可用性特性

## 🎯 实操练习

### 练习 1：部署 Microsoft Foundry Models 聊天应用（30 分钟）
<strong>目标</strong>：部署并测试一个生产就绪的 AI 聊天应用

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

**成功标准：**
- [ ] 部署完成且无配额错误
- [ ] 能在浏览器中访问聊天界面
- [ ] 能提问并获得 AI 驱动的响应
- [ ] Application Insights 显示遥测数据
- [ ] 成功清理资源

<strong>估计费用</strong>：30 分钟测试约 $5-10

### 练习 2：配置多模型部署（45 分钟）
<strong>目标</strong>：以不同配置部署多个 AI 模型

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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
- [ ] 多个模型部署成功
- [ ] 应用了不同的容量设置
- [ ] 模型可通过 API 访问
- [ ] 应用能够调用多个模型

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
- [ ] 配置了电子邮件通知
- [ ] 能在 Azure 门户查看成本数据
- [ ] 适当设置了预算阈值

## 💡 常见问题解答

<details>
<summary><strong>如何在开发期间降低 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免费额度</strong>：Microsoft Foundry Models 提供每月 50,000 tokens 的免费额度
2. <strong>降低容量</strong>：开发环境将容量设置为 10 TPM 而不是 30+ 
3. **使用 azd down**：在不进行活跃开发时释放资源
4. <strong>缓存响应</strong>：为重复查询实现 Redis 缓存
5. <strong>使用提示工程</strong>：通过高效的提示减少 token 使用


```bash
# 开发配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型与 OpenAI API 有何不同？</strong></summary>

**Microsoft Foundry 模型**:
- 企业级安全与合规
- 私有网络集成
- SLA 保证
- 托管身份验证
- 可提供更高配额

**OpenAI API**:
- 更快获得新模型
- 更简单的设置
- 更低的入门门槛
- 仅限公共互联网

对于生产应用，**建议使用 Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>如何处理 Microsoft Foundry 模型 的配额超限错误？</strong></summary>

```bash
# 检查当前配额
az cognitiveservices usage list --location eastus2

# 尝试不同的区域
azd env set AZURE_LOCATION westus2
azd up

# 临时减少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 申请提高配额
# 前往 Azure 门户 > 配额 > 请求增加
```
</details>

<details>
<summary><strong>我可以在 Microsoft Foundry 模型 中使用自己的数据吗？</strong></summary>

可以！使用 **Azure AI Search** 进行 RAG（检索增强生成）：

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

<strong>最佳实践</strong>：
1. 使用托管标识（无 API 密钥）
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

- **Microsoft Foundry Discord**: [#Azure 频道](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [问题和讨论](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文档](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 在编辑器中使用 `npx skills add microsoft/github-copilot-for-azure` 安装 Azure + Foundry 代理技能

---

**章节导航：**
- **📚 课程首页**: [AZD 初学者指南](../../README.md)
- **📖 当前章节**: 第2章 - AI 优先开发
- **⬅️ 上一章**: [第1章：你的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章节**: [第3章：配置](../chapter-03-configuration/configuration.md)

**需要帮助吗？** 加入我们的社区讨论或在仓库中打开问题。Azure AI + AZD 社区将在此帮助你取得成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**:
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译而成。虽然我们努力确保准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或曲解，我们概不负责。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
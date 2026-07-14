# 微软 Foundry 与 AZD 集成

**章节导航：**
- **📚 课程首页**: [AZD 入门](../../README.md)
- **📖 当前章节**: 第2章 - AI优先开发
- **⬅️ 前一章**: [第1章：你的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**: [AI模型部署](ai-model-deployment.md)
- **🚀 后续章节**: [第3章：配置](../chapter-03-configuration/configuration.md)

## 概述

本指南演示如何将微软 Foundry 服务与 Azure Developer CLI (AZD) 集成，实现简化的 AI 应用部署。微软 Foundry 提供了构建、部署和管理 AI 应用的综合平台，而 AZD 简化了基础设施和部署流程。

## 什么是微软 Foundry？

微软 Foundry 是微软统一的 AI 开发平台，包括：

- <strong>模型目录</strong>：访问最先进的 AI 模型
- <strong>提示流程</strong>：AI 工作流的可视化设计器
- **微软 Foundry 门户**：集成的 AI 应用开发环境
- <strong>部署选项</strong>：多种托管和扩展方案
- <strong>安全与保障</strong>：内置负责任的 AI 功能

## AZD + 微软 Foundry：更好的结合

| 功能 | 微软 Foundry | AZD 集成优势 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手动门户部署 | 自动化、可重复的部署 |
| <strong>基础设施</strong> | 点击式配置 | 基础设施即代码（Bicep） |
| <strong>环境管理</strong> | 单环境聚焦 | 多环境（开发/测试/生产） |
| **CI/CD 集成** | 功能有限 | 原生支持 GitHub Actions |
| <strong>成本管理</strong> | 基础监控 | 环境特定成本优化 |

## 前提条件

- 拥有合适权限的 Azure 订阅
- 已安装 Azure Developer CLI
- 可访问微软 Foundry 模型服务
- 具备微软 Foundry 基础知识

> **当前 AZD 基线：** 这些示例基于 `azd` `1.27.1` 版本审核。对于 AI 代理工作流，请使用当前预览扩展版本，并在开始前检查已安装版本。

## 核心集成模式

### 模式1：微软 Foundry 模型集成

<strong>用例</strong>：部署使用微软 Foundry 模型的聊天应用

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

### 模式2：AI 搜索 + RAG 集成

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

### 模式3：文档智能集成

<strong>用例</strong>：文档处理与分析工作流

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
# 核心人工智能服务
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

**开发环境配置：**
```bash
# 针对开发的成本优化设置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免费层
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

### Foundry 的 AZD 扩展

AZD 提供了针对微软 Foundry 服务的 AI 特定功能扩展：

```bash
# 安装 Foundry 代理扩展
azd extension install azure.ai.agents

# 安装微调扩展
azd extension install azure.ai.finetune

# 安装自定义模型扩展
azd extension install azure.ai.models

# 列出已安装的扩展
azd extension list --installed

# 检查当前安装的代理扩展版本
azd extension show azure.ai.agents
```

AI 扩展功能仍在快速预览中。如果命令表现与此处不同，请升级相关扩展后再排查项目问题。

### 使用 `azd ai` 的代理优先部署

如果拥有代理清单，使用 `azd ai agent init` 搭建连接到 Foundry 代理服务的项目骨架：

```bash
# 从代理清单初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

`azure.ai.agents` 的最新预览版本还增加了基于模板的 `azd ai agent init` 初始化支持。如果在使用较新的代理示例，请查看已安装版本扩展帮助以确认可用标志。

请参阅 [AZD AI CLI 命令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 了解完整命令和标志参考。

### 单命令部署

```bash
# 使用一个命令部署所有内容
azd up

# 或者增量部署
azd provision  # 仅基础设施
azd deploy     # 仅应用程序

# 适用于 azd 1.23.11 及以上版本中的长时间运行的 AI 应用部署
azd deploy --timeout 1800
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

### 集成 Application Insights

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

### 受管身份配置

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

### 问题1：OpenAI 配额超限

**症状：**
- 部署失败并显示配额错误
- 应用日志出现429错误

**解决方案：**
```bash
# 检查当前配额使用情况
az cognitiveservices usage list --location eastus

# 尝试不同区域
azd env set AZURE_LOCATION westus2
azd up

# 临时减少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 问题2：身份验证失败

**症状：**
- 调用 AI 服务时出现401/403错误
- 显示“访问被拒绝”消息

**解决方案：**
```bash
# 验证角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 检查托管身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 验证密钥保管库访问
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 问题3：模型部署问题

**症状：**
- 部署时模型不可用
- 特定模型版本部署失败

**解决方案：**
```bash
# 按地区列出可用模型
az cognitiveservices model list --location eastus

# 在bicep模板中更新模型版本
# 检查模型容量要求
```

## 示例模板

### RAG 聊天应用（Python）

<strong>仓库</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服务</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>描述</strong>：最受欢迎的 Azure AI 示例——生产级 RAG 聊天应用，支持基于您的文档提问。使用 GPT-4.1-mini 进行聊天，text-embedding-3-large 用于文本嵌入，Azure AI Search 实现检索。支持多模态文档、语音输入/输出、Microsoft Entra 身份验证和 Application Insights 跟踪。

<strong>快速开始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天应用 (.NET)

<strong>仓库</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服务</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>描述</strong>：Python RAG 聊天示例的 .NET/C# 等价版本。基于 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端构建。包含语音聊天、GPT-4o-mini 视觉支持，以及配套的 .NET MAUI Blazor Hybrid 桌面/移动客户端。

<strong>快速开始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天应用 (Java)

<strong>仓库</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服务</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>描述</strong>：Java 版 RAG 聊天示例，采用 Langchain4J 进行 AI 协调。支持微服务事件驱动架构、多种检索策略（文本、向量、混合）、Azure 文档智能上传和部署在 Azure Container Apps 或 Azure Kubernetes 服务。

<strong>快速开始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 企业零售助理与微软 Foundry

<strong>仓库</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服务</strong>：Azure OpenAI + 微软 Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>描述</strong>：端到端零售 RAG 助理，结合微软 Foundry 和 Prompty。Contoso 户外零售聊天机器人，基于产品目录和客户订单数据提供智能响应。展示完整的 GenAIOps 工作流——使用 Prompty 快速原型，使用 AI 辅助评估器评估，通过 AZD 部署到 Container Apps。

<strong>快速开始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 创意写作多代理应用

<strong>仓库</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服务</strong>：Azure OpenAI + Azure AI 代理服务 + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>描述</strong>：多代理示例，展示使用 Prompty 进行 AI 代理编排。包含研究代理（Bing Grounding，Azure AI 代理服务）、产品代理（Azure AI Search）、写作代理和编辑代理，共同协作生成内容丰富的文章。包含使用 GitHub Actions 的 CI/CD 评估。

<strong>快速开始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 无服务器 RAG 聊天 (JavaScript/TypeScript)

<strong>仓库</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服务</strong>：Azure OpenAI + Azure Functions + Azure 静态 Web 应用 + Azure Cosmos DB (NoSQL) + LangChain.js

<strong>描述</strong>：完全文本无服务器 RAG 聊天机器人，使用 LangChain.js，Azure Functions 作为 API，Azure 静态 Web 应用托管。使用 Azure Cosmos DB 作为向量存储和聊天历史数据库。支持使用 Ollama 本地开发，零成本测试。

<strong>快速开始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 带数据聊天解决方案加速器

<strong>仓库</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服务</strong>：Azure OpenAI + Azure AI Search + Azure 应用服务 + Azure 文档智能 + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>描述</strong>：企业级 RAG 解决方案加速器，带有文档上传/管理的管理门户，多种编排器选项（Semantic Kernel、LangChain、Prompt Flow），语音转文本，Microsoft Teams 集成，支持 PostgreSQL 或 Cosmos DB 作为后端。设计为生产级 RAG 场景的自定义起点。

<strong>快速开始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅游代理 — 多代理 MCP 编排

<strong>仓库</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服务</strong>：Azure OpenAI + 微软 Foundry + Azure Container Apps + MCP 服务器 (.NET、Python、Java、TypeScript)

<strong>描述</strong>：多代理 AI 编排参考应用，使用三大框架（LangChain.js、LlamaIndex.TS 和微软代理框架）。特点是四种语言的 MCP（模型上下文协议）服务器，作为无服务器 Azure Container Apps 部署，支持 OpenTelemetry 监控。

<strong>快速开始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 启动模板

<strong>仓库</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服务</strong>：Azure AI 服务 + Azure OpenAI

<strong>描述</strong>：简约 Bicep 模板，部署带有配置的机器学习模型的 Azure AI 服务。当你只需要部署 Azure AI 基础设施而不需要完整应用架构时，是轻量级起点。

<strong>快速开始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>浏览更多模板</strong>：访问 [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)，查看80+跨语言和场景的 AI 专用 AZD 模板。

## 后续步骤

1. <strong>尝试示例</strong>：从匹配你用例的预构建模板开始
2. <strong>根据需求定制</strong>：修改基础设施和应用代码
3. <strong>添加监控</strong>：实现全面可观测性
4. <strong>优化成本</strong>：微调配置以匹配预算
5. <strong>保护部署安全</strong>：实施企业安全方案
6. <strong>扩展至生产</strong>：增加多区域和高可用特性

## 🎯 实操练习

### 练习1：部署微软 Foundry 模型聊天应用（30分钟）
<strong>目标</strong>：部署并测试生产级 AI 聊天应用

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

# 监控AI操作
azd monitor

# 清理
azd down --force --purge
```

**成功标准：**
- [ ] 部署无配额错误完成
- [ ] 可通过浏览器访问聊天界面
- [ ] 能提问并获得 AI 驱动的回答
- [ ] Application Insights 显示遥测数据
- [ ] 成功清理资源

<strong>预估成本</strong>：30分钟测试约5-10美元

### 练习2：配置多模型部署（45分钟）
<strong>目标</strong>：部署多个 AI 模型并应用不同配置

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
- [ ] 多个模型成功部署
- [ ] 应用不同容量设置
- [ ] 可通过 API 访问模型
- [ ] 应用可调用所有模型

### 练习3：实现成本监控（20分钟）
<strong>目标</strong>：设置预算警报与成本跟踪

```bash
# 向Bicep添加预算警报
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
- [ ] 在 Azure 中创建预算警报
- [ ] 配置邮件通知
- [ ] 可在 Azure 门户查看成本数据
- [ ] 预算阈值设置合理

## 💡 常见问题解答

<details>
<summary><strong>我如何在开发期间降低微软 Foundry 模型的成本？</strong></summary>

1. <strong>使用免费额度</strong>：微软 Foundry 模型每月提供 50,000 代币免费额度
2. <strong>降低容量</strong>：开发时将容量设置为 10 TPM 而非 30+ 
3. **使用 azd down**：非开发时释放资源
4. <strong>缓存响应</strong>：为重复查询实现 Redis 缓存
5. <strong>使用提示工程</strong>：用高效提示减少代币使用


```bash
# 开发配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型和 OpenAI API 有什么区别？</strong></summary>

**Microsoft Foundry 模型**：
- 企业级安全与合规
- 私有网络集成
- SLA 保证
- 托管身份认证
- 提供更高配额

**OpenAI API**：
- 更快访问新模型
- 设置更简单
- 准入门槛更低
- 仅限公网访问

对于生产应用，**推荐使用 Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>如何处理 Microsoft Foundry 模型配额超限错误？</strong></summary>

```bash
# 检查当前配额
az cognitiveservices usage list --location eastus2

# 尝试不同地区
azd env set AZURE_LOCATION westus2
azd up

# 临时减少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 请求配额增加
# 进入 Azure 门户 > 配额 > 请求增加
```
</details>

<details>
<summary><strong>我可以使用自己的数据与 Microsoft Foundry 模型吗？</strong></summary>

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

参考 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 模板。
</details>

<details>
<summary><strong>如何保护 AI 模型端点的安全？</strong></summary>

<strong>最佳实践</strong>：
1. 使用托管身份（避免 API 密钥）
2. 启用私有端点
3. 配置网络安全组
4. 实施速率限制
5. 使用 Azure Key Vault 管理密钥

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
- **Agent Skills**：[skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在编辑器中安装 Azure + Foundry 代理技能  

---

**章节导航：**
- **📚 课程首页**：[AZD 入门](../../README.md)
- **📖 当前章节**：第 2 章 - AI 优先开发
- **⬅️ 上一章**：[第 1 章：你的第一个项目](../chapter-01-foundation/first-project.md)
- **➡️ 下一节**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**：[第 3 章：配置](../chapter-03-configuration/configuration.md)

**需要帮助？** 加入我们的社区讨论或提交仓库问题。Azure AI 与 AZD 社区助你成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
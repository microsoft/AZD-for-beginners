# Microsoft Foundry 與 AZD 的整合

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 當前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：Configuration](../chapter-03-configuration/configuration.md)

## Overview

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署流程。Microsoft Foundry 提供一個完整的平台，用於建立、部署和管理 AI 應用程式，而 AZD 則簡化了基礎設施與部署流程。

## What is Microsoft Foundry?

Microsoft Foundry 是微軟的統一 AI 開發平台，包含：

- <strong>模型目錄</strong>: 存取最先進的 AI 模型
- **Prompt Flow**: 用於 AI 工作流程的視覺化設計器
- **Microsoft Foundry Portal**: AI 應用程式的整合開發環境
- <strong>部署選項</strong>: 多種主機與擴充選項
- <strong>安全與防護</strong>: 內建的負責任 AI 功能

## AZD + Microsoft Foundry: Better Together

| 功能 | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- 具有適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry Models 服務
- 對 Microsoft Foundry 有基本認識

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: 使用 Microsoft Foundry Models 模型部署聊天應用程式

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

**Infrastructure (main.bicep):**
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

### Pattern 2: AI Search + RAG Integration

**Use Case**: 部署檢索增強生成 (RAG) 應用程式

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

### Pattern 3: Document Intelligence Integration

**Use Case**: 文件處理與分析工作流程

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
```bash
# 核心 AI 服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# 效能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# 為開發而優化成本的設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費層級
```

### Secure Configuration with Key Vault

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

## Deployment Workflows

### AZD Extensions for Foundry

AZD 提供擴充套件，以新增與 Microsoft Foundry 服務協作的 AI 專用功能：

```bash
# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 列出已安裝的擴充功能
azd extension list --installed

# 檢查目前已安裝的 agent 擴充功能版本
azd extension show azure.ai.agents
```

這些 AI 擴充套件在預覽期間仍快速演進。如果某個指令與此處所示行為不同，請在排除專案問題前升級相關擴充套件。

### Agent-First Deployment with `azd ai`

如果您有代理清單 (agent manifest)，請使用 `azd ai agent init` 來生成一個與 Foundry Agent Service 連接的專案骨架：

```bash
# 從代理程式清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

近期的 `azure.ai.agents` 預覽發行也為 `azd ai agent init` 新增了基於範本的初始化支援。如果您正在參考更新的代理範例，請檢查您已安裝版本的擴充套件說明，以取得可用的精確旗標。

請參閱 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以取得完整指令參考與旗標。

### Single Command Deployment

```bash
# 用一條指令部署全部
azd up

# 或者逐步部署
azd provision  # 只部署基礎設施
azd deploy     # 只部署應用程式

# 適用於在 azd 1.23.11+ 中長期運行的 AI 應用部署
azd deploy --timeout 1800
```

### Environment-Specific Deployments

```bash
# 開發環境
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# 生產環境
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- 部署因配額錯誤而失敗
- 應用程式日誌出現 429 錯誤

**Solutions:**
```bash
# 檢查目前配額使用情況
az cognitiveservices usage list --location eastus

# 嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- 呼叫 AI 服務時出現 401/403 錯誤
- 顯示「Access denied」訊息

**Solutions:**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查託管身分設定
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證 Key Vault 存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- 模型在部署中不可用
- 特定模型版本失敗

**Solutions:**
```bash
# 按地區列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 模板中更新模型版本
# 檢查模型容量要求
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: 最受歡迎的 Azure AI 範例 — 一個可投入生產的 RAG 聊天應用程式，讓您可以針對自己的文件提出問題。使用 GPT-4.1-mini 作為聊天模型，text-embedding-3-large 作為嵌入模型，並搭配 Azure AI Search 進行檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 驗證，以及 Application Insights 追蹤。

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG 聊天範例的 .NET/C# 等價版本。使用 ASP.NET Core Minimal API 與 Blazor WebAssembly 前端構建。包含語音聊天、GPT-4o-mini 視覺支援，以及搭配的 .NET MAUI Blazor Hybrid 桌面/行動客戶端。

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: 使用 Langchain4J 進行 AI 編排的 Java 版本 RAG 聊天範例。支援微服務事件驅動架構、多種檢索策略（文字、向量、混合）、使用 Azure Document Intelligence 進行文件上傳，以及部署於 Azure Container Apps 或 Azure Kubernetes Service。

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: 使用 Azure AI Foundry 與 Prompty 的端到端零售 RAG 助手。針對 Contoso Outdoor 零售商的聊天機器人，將回應依據產品目錄與客戶訂單資料做依據。示範完整的 GenAIOps 工作流程 — 使用 Prompty 做原型、以 AI 協助的評估器進行評估，並透過 AZD 部署到 Container Apps。

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: 多代理範例，示範使用 Prompty 進行 AI 代理編排。使用研究代理（在 Azure AI Agent Service 中的 Bing Grounding）、產品代理（Azure AI Search）、撰寫代理與編輯代理，共同協作產出具研究性的文章。包含在 GitHub Actions 中的 CI/CD 與評估流程。

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: 完全無伺服器的 RAG 聊天機器人，使用 LangChain.js，API 由 Azure Functions 提供，並以 Azure Static Web Apps 做為主機。使用 Azure Cosmos DB 作為向量庫與聊天歷史資料庫。支援使用 Ollama 進行本地開發以達到零成本測試。

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: 企業級 RAG 解決方案加速器，包含管理介面供文件上傳/管理、多種協調器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，並可選擇 PostgreSQL 或 Cosmos DB 作為後端。設計為可自訂化的生產 RAG 場景起始點。

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: 參考應用程式，示範使用三個框架（LangChain.js、LlamaIndex.TS、Microsoft Agent Framework）進行多代理 AI 編排。特色為以四種語言實作的 MCP (Model Context Protocol) 伺服器，部署為無伺服器的 Azure Container Apps，並支援 OpenTelemetry 監控。

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: 最小化的 Bicep 範本，用於部署已配置機器學習模型的 Azure AI 服務。當您只需要佈建 Azure AI 基礎設施而無需完整應用程式堆疊時，這是一個輕量的起點。

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Next Steps

1. **Try the Examples**: Start with a pre-built template that matches your use case
2. **Customize for Your Needs**: Modify the infrastructure and application code
3. **Add Monitoring**: Implement comprehensive observability
4. **Optimize Costs**: Fine-tune configurations for your budget
5. **Secure Your Deployment**: Implement enterprise security patterns
6. **Scale to Production**: Add multi-region and high-availability features

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: Deploy and test a production-ready AI chat application

```bash
# 初始化範本
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# 設定環境變數
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# 部署
azd up

# 測試應用程式
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# 監察 AI 運作
azd monitor

# 清理
azd down --force --purge
```

**Success Criteria:**
- [ ] Deployment completes without quota errors
- [ ] Can access chat interface in browser
- [ ] Can ask questions and get AI-powered responses
- [ ] Application Insights shows telemetry data
- [ ] Successfully cleaned up resources

**Estimated Cost**: $5-10 for 30 minutes of testing

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Deploy multiple AI models with different configurations

```bash
# 建立自訂的 Bicep 設定
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

# 部署並驗證
azd provision
azd show
```

**Success Criteria:**
- [ ] Multiple models deployed successfully
- [ ] Different capacity settings applied
- [ ] Models accessible via API
- [ ] Can call both models from application

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Set up budget alerts and cost tracking

```bash
# 向 Bicep 新增預算警示
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

# 部署預算警示
azd provision

# 檢查目前費用
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Budget alert created in Azure
- [ ] Email notifications configured
- [ ] Can view cost data in Azure Portal
- [ ] Budget thresholds set appropriately

## 💡 Frequently Asked Questions

<details>
<summary><strong>在開發期間如何降低 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免費額度</strong>: Microsoft Foundry Models 提供每月 50,000 tokens 免費
2. <strong>降低容量</strong>: 為開發環境將容量設為 10 TPM 而非 30+
3. **使用 azd down**: 在不積極開發時將資源釋放
4. <strong>快取回應</strong>: 對重複查詢實作 Redis 快取
5. **使用 Prompt Engineering**: 以有效的提示語減少 token 使用量


```bash
# 開發配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型與 OpenAI API 有何不同？</strong></summary>

**Microsoft Foundry 模型**:
- 企業級安全與合規
- 私有網絡整合
- SLA 保證
- Managed Identity 身份驗證
- 可用更高配額

**OpenAI API**:
- 更快取得新模型
- 更簡單的設定
- 較低的入門門檻
- 僅限公共互聯網

對於生產應用，建議使用 **Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry 模型 的配額超出錯誤？</strong></summary>

```bash
# 檢查現有配額
az cognitiveservices usage list --location eastus2

# 嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 申請提高配額
# 前往 Azure 入口網站 > 配額 > 申請增加
```
</details>

<details>
<summary><strong>我可以將自己的資料與 Microsoft Foundry 模型 一起使用嗎？</strong></summary>

可以！使用 **Azure AI Search** 來做 RAG（檢索增強生成）：

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

請參閱 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 範本。
</details>

<details>
<summary><strong>如何保護 AI 模型端點？</strong></summary>

<strong>最佳做法</strong>:
1. 使用 Managed Identity（不使用 API 金鑰）
2. 啟用 Private Endpoints
3. 設定網絡安全群組
4. 實施速率限制
5. 使用 Azure Key Vault 管理機密

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

## 社群與支援

- **Microsoft Foundry Discord**: [#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [議題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh 上的 Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 在你的編輯器中安裝 Azure + Foundry agent skills，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽：**
- **📚 課程主頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群討論或在倉庫中開啟議題。Azure AI + AZD 社群在此協助你成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言版本的文件應被視為具權威性的來源。對於關鍵資訊，建議委託專業人工翻譯。我們不會對因使用此翻譯而引致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
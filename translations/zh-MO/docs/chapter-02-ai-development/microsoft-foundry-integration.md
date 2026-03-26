# Microsoft Foundry 與 AZD 的整合

**Chapter Navigation:**
- **📚 課程主頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一步**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

## 概覽

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署流程。Microsoft Foundry 提供建置、部署與管理 AI 應用的完整平台，而 AZD 則簡化了基礎設施與部署流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟的統一 AI 開發平台，包含：

- <strong>模型目錄</strong>: 存取最先進的 AI 模型
- **Prompt Flow**: AI 工作流程的視覺化設計器
- **Microsoft Foundry Portal**: AI 應用的整合開發環境
- <strong>部署選項</strong>: 多種主機與擴展選擇
- <strong>安全性與資安</strong>: 內建的責任 AI 功能

## AZD + Microsoft Foundry：更佳搭配

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動入口網站部署 | 自動化、可重複的部署 |
| <strong>基礎設施</strong> | 點擊式佈建 | 基礎設施即程式碼 (Bicep) |
| <strong>環境管理</strong> | 以單一環境為主 | 多環境（開發/預備/生產） |
| **CI/CD 整合** | 有限 | 原生支援 GitHub Actions |
| <strong>成本管理</strong> | 基本監控 | 依環境優化成本 |

## 先決條件

- 具有適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry Models 服務
- 對 Microsoft Foundry 有基本了解

## 核心整合模式

### 模式 1：Microsoft Foundry Models 整合

<strong>使用情境</strong>: 使用 Microsoft Foundry Models 模型部署聊天應用程式

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

**基礎架構 (main.bicep):**
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

### 模式 2：AI Search + RAG 整合

<strong>使用情境</strong>: 部署檢索增強生成（RAG）應用程式

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

### 模式 3：文件智慧整合

<strong>使用情境</strong>: 文件處理與分析工作流程

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

## 🔧 設定模式

### 環境變數設定

**生產環境設定:**
```bash
# 核心 AI 服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# 效能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發環境設定:**
```bash
# 為開發而進行成本優化的設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費層級
```

### 使用 Key Vault 的安全設定

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

## 部署流程

### AZD 對 Foundry 的擴充功能

AZD 提供擴充功能，為與 Microsoft Foundry 服務協作新增 AI 專屬能力：

```bash
# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 列出已安裝的擴充功能
azd extension list
```

### 以 Agent 為先的部署 使用 `azd ai`

如果您有 agent 清單，使用 `azd ai agent init` 來產生一個與 Foundry Agent Service 連接的專案雛形：

```bash
# 從代理程式清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

請參閱 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以取得完整指令參考與旗標。

### 單一指令部署

```bash
# 用一個指令部署所有項目
azd up

# 或逐步部署
azd provision  # 僅限基礎架構
azd deploy     # 僅限應用程式
```

### 依環境部署

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

## 監控與可觀察性

### Application Insights 整合

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

### 成本監控

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

## 🔐 安全最佳實務

### 託管身分識別 設定

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

### 網路安全

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

## 效能優化

### 快取策略

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

### 自動擴縮設定

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

## 常見問題排解

### 問題 1：OpenAI 配額超過

**症狀:**
- 部署失敗並出現配額錯誤
- 應用程式日誌出現 429 錯誤

**解決方案:**
```bash
# 檢查目前配額使用情況
az cognitiveservices usage list --location eastus

# 嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題 2：驗證失敗

**症狀:**
- 呼叫 AI 服務時出現 401/403 錯誤
- 顯示「存取被拒」訊息

**解決方案:**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查受管身分識別設定
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證金鑰保管庫存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀:**
- 部署中找不到模型
- 特定模型版本失敗

**解決方案:**
```bash
# 按地區列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 範本中更新模型版本
# 檢查模型容量需求
```

## 範例範本

### RAG 聊天應用（Python）

<strong>儲存庫</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>描述</strong>: 最受歡迎的 Azure AI 範例 — 一個可投入生產的 RAG 聊天應用，讓您能針對自己的文件提出問題。使用 GPT-4.1-mini 作為聊天模型，text-embedding-ada-002 作為 embeddings，並以 Azure AI Search 進行檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 驗證，以及 Application Insights 追蹤。

<strong>快速開始</strong>:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用（.NET）

<strong>儲存庫</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>描述</strong>: 此 .NET/C# 範例對應於 Python 的 RAG 聊天範例。以 ASP.NET Core Minimal API 與 Blazor WebAssembly 前端建構。包含語音聊天、GPT-4o-mini 視覺支援，以及配套的 .NET MAUI Blazor Hybrid 桌面/行動端客戶端。

<strong>快速開始</strong>:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用（Java）

<strong>儲存庫</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>描述</strong>: Java 版本的 RAG 聊天範例，使用 Langchain4J 進行 AI 編排。支援微服務事件驅動架構、多種檢索策略（文字、向量、混合）、使用 Azure Document Intelligence 上傳文件，以及部署於 Azure Container Apps 或 Azure Kubernetes Service。

<strong>快速開始</strong>:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 企業零售助理（使用 Azure AI Foundry）

<strong>儲存庫</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>描述</strong>: 使用 Azure AI Foundry 與 Prompty 的端到端零售 RAG 助手。Contoso Outdoor 零售商聊天機器人，會根據產品目錄與客戶訂單資料提供具根據性的回應。示範完整的 GenAIOps 工作流程 — 使用 Prompty 原型化、以 AI 協助的評估器進行評估，並透過 AZD 部署到 Container Apps。

<strong>快速開始</strong>:
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用

<strong>儲存庫</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>描述</strong>: 多代理範例示範使用 Prompty 進行 AI 代理協調。使用研究代理（Azure AI Agent Service 中的 Bing Grounding）、產品代理（Azure AI Search）、寫作代理與編輯代理，共同產出經過充分研究的文章。包含在 GitHub Actions 中以 CI/CD 與評估流程。

<strong>快速開始</strong>:
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天（JavaScript/TypeScript）

<strong>儲存庫</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>描述</strong>: 完全無伺服器的 RAG 聊天機器人，使用 LangChain.js，Azure Functions 作為 API，Azure Static Web Apps 作為主機。使用 Azure Cosmos DB 作為向量儲存與聊天歷史資料庫。支援使用 Ollama 在本機進行零成本測試。

<strong>快速開始</strong>:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與您的資料對話 解決方案加速器

<strong>儲存庫</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>描述</strong>: 企業級 RAG 解決方案加速器，具有文件上傳/管理的管理入口、多種協調器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，並可選擇 PostgreSQL 或 Cosmos DB 作為後端。設計為可自訂的生產 RAG 起點。

<strong>快速開始</strong>:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅遊代理 — 多代理 MCP 協調

<strong>儲存庫</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

<strong>描述</strong>: 多代理 AI 協調的參考應用，使用三種框架（LangChain.js、LlamaIndex.TS 與 Microsoft Agent Framework）。特色為以四種語言實作的 MCP（Model Context Protocol）伺服器，作為無伺服器 Azure Container Apps 部署，並搭配 OpenTelemetry 監控。

<strong>快速開始</strong>:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

<strong>儲存庫</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>: Azure AI Services + Azure OpenAI

<strong>描述</strong>: 最小化的 Bicep 範本，用於部署已配置機器學習模型的 Azure AI 服務。當您只需要部署 Azure AI 基礎設施，而非完整應用堆疊時，是一個輕量的起點。

<strong>快速開始</strong>:
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>: 請造訪 [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) 以取得 80+ 個跨語言與情境的 AI 專屬 AZD 範本。

## 下一步驟

1. <strong>嘗試範例</strong>: 從符合您使用情境的預建範本開始
2. <strong>根據需求自訂</strong>: 修改基礎設施與應用程式程式碼
3. <strong>新增監控</strong>: 實作完整的可觀察性
4. <strong>優化成本</strong>: 為預算微調設定
5. <strong>保護您的部署</strong>: 實作企業級安全模式
6. <strong>量產擴展</strong>: 新增多區域與高可用性功能

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry Models 聊天應用（30 分鐘）
<strong>目標</strong>: 部署並測試可投入生產的 AI 聊天應用

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

# 監控 AI 運作
azd monitor

# 清理
azd down --force --purge
```

**成功準則:**
- [ ] 部署完成且無配額錯誤
- [ ] 能在瀏覽器存取聊天介面
- [ ] 能提問並獲得 AI 回應
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清理資源

<strong>預估費用</strong>: 30 分鐘測試約 $5-10

### 練習 2：設定多模型部署（45 分鐘）
<strong>目標</strong>: 部署多個具有不同設定的 AI 模型

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

# 部署並驗證
azd provision
azd show
```

**成功準則:**
- [ ] 多個模型成功部署
- [ ] 套用不同容量設定
- [ ] 模型可透過 API 存取
- [ ] 應用程式能呼叫兩個模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>: 設定預算警示與成本追蹤

```bash
# 在 Bicep 中新增預算警示
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

**成功準則:**
- [ ] 已在 Azure 建立預算警示
- [ ] 已設定電子郵件通知
- [ ] 可在 Azure 入口網站檢視成本資料
- [ ] 已適當設定預算門檻

## 💡 常見問題

<details>
<summary><strong>在開發期間我如何降低 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免費額度</strong>: Microsoft Foundry Models 每月提供 50,000 tokens 的免費額度
2. <strong>降低容量</strong>: 開發時將容量設定為 10 TPM，而非 30+ for dev
3. **使用 azd down**: 在非開發期間釋放資源
4. <strong>快取回應</strong>: 為重複查詢實作 Redis 快取
5. <strong>使用提示工程</strong>: 以高效提示減少 token 使用量

```bash
# 開發設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models 與 OpenAI API 有何不同？</strong></summary>

**Microsoft Foundry Models**:
- 企業級安全與合規
- 私有網路整合
- SLA 保證
- 託管身分識別驗證
- 可用較高配額

**OpenAI API**:
- 更快取得新模型
- 更簡單的設定
- 較低的入門門檻
- 僅限公開網際網路

對於生產應用，**建議使用 Microsoft Foundry Models**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry Models 配額超出錯誤？</strong></summary>

```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 請求提高配額
# 前往 Azure 入口網站 > 配額 > 申請提高配額
```
</details>

<details>
<summary><strong>我可以在 Microsoft Foundry Models 中使用自己的資料嗎？</strong></summary>

可以！使用 **Azure AI Search** 作為 RAG（檢索增強生成）：

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
1. 使用 Managed Identity (no API keys)
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
- **Agent Skills**: [skills.sh 上的 Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 在您的編輯器安裝 Azure + Foundry agent skills，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽:**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 前一章**: [第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一節**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群討論或在倉庫中開啟議題。Azure AI + AZD 社群在這裡協助你成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文版本應視為具有權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。對於因使用本翻譯而引致的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
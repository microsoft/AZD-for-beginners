# Microsoft Foundry 與 AZD 的整合

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 當前章節**: 第二章 - AI 優先開發
- **⬅️ 上一章節**: [第一章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章節**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下章節**: [第三章：設定](../chapter-03-configuration/configuration.md)

## 概述

本指南展示如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署。Microsoft Foundry 提供了一個全面的平台，用於構建、部署和管理 AI 應用程式，而 AZD 則簡化了基礎設施和部署流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟的統一 AI 開發平台，包含：

- <strong>模型目錄</strong>: 存取最先進的 AI 模型
- <strong>提示流程</strong>: AI 工作流的視覺設計器
- **Microsoft Foundry 入口網站**: AI 應用程式的整合開發環境
- <strong>部署選項</strong>: 多種主機和擴展選擇
- <strong>安全與防護</strong>: 內建負責任 AI 功能

## AZD + Microsoft Foundry：更好的組合

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動入口網站部署 | 自動化、可重複部署 |
| <strong>基礎設施</strong> | 點擊式配置 | 基礎設施即程式碼 (Bicep) |
| <strong>環境管理</strong> | 單一環境聚焦 | 多環境支援 (開發/預備/生產) |
| **CI/CD 整合** | 限制較多 | 原生 GitHub Actions 支援 |
| <strong>成本管理</strong> | 基本監控 | 環境特定成本優化 |

## 前置需求

- 具適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry 模型服務
- 基本熟悉 Microsoft Foundry

> **目前 AZD 基準：** 這些範例已針對 `azd` 版本 `1.27.1` 測試。對於 AI 代理工作流，請使用目前預覽擴充套件版本，並於開始前確認已安裝的版本。

## 核心整合模式

### 模式 1：Microsoft Foundry 模型整合

<strong>使用案例</strong>：部署使用 Microsoft Foundry 模型的聊天應用程式

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

**基礎設施 (main.bicep):**
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

### 模式 2：AI 搜尋 + RAG 整合

<strong>使用案例</strong>：部署檢索增強生成 (RAG) 應用程式

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

<strong>使用案例</strong>：文件處理及分析工作流

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

**生產環境設定：**
```bash
# 核心人工智能服務
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

**開發環境設定：**
```bash
# 為開發優化成本的設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費層
```

### 使用 Key Vault 進行安全設定

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

### Foundry 的 AZD 擴充套件

AZD 提供針對 Microsoft Foundry 服務的 AI 專用能力擴充：

```bash
# 安裝 Foundry 代理擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 列出已安裝的擴充功能
azd extension list --installed

# 檢查目前已安裝的代理擴充功能版本
azd extension show azure.ai.agents
```

AI 擴充仍在快速更新的預覽階段。如果命令行為與此處不同，請先升級相關擴充再進行專案問題排查。

### 使用 `azd ai` 的代理優先部署

如果有代理清單，使用 `azd ai agent init` 來搭建與 Foundry 代理服務整合的專案架構：

```bash
# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

`azure.ai.agents` 最近的預覽版本也增加了針對 `azd ai agent init` 的範本初始化支援。若跟隨新版代理範例，請查閱擴充套件說明以確認你安裝版本可用的旗標。

請見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以獲取完整指令參考與旗標說明。

### 單一指令部署

```bash
# 用一個指令部署所有內容
azd up

# 或者逐步部署
azd provision  # 只部署基礎設施
azd deploy     # 只部署應用程式

# 適用於 azd 1.23.11+ 中長時間運行的 AI 應用部署
azd deploy --timeout 1800
```

### 環境特定部署

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

### 整合 Application Insights

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

## 🔐 安全最佳實踐

### 託管身份配置

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

## 性能優化

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

### 自動擴充設定

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

### 問題 1：OpenAI 配額超出

**症狀：**
- 部署時出現配額錯誤
- 應用日誌中出現 429 錯誤

**解決方案：**
```bash
# 檢查當前配額使用量
az cognitiveservices usage list --location eastus

# 嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題 2：認證失敗

**症狀：**
- 呼叫 AI 服務時出現 401/403 錯誤
- 顯示「拒絕存取」訊息

**解決方案：**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查受管理身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證金鑰保管庫存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 部署中模型不可用
- 特定模型版本部署失敗

**解決方案：**
```bash
# 按地區列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 模板中更新模型版本
# 檢查模型容量需求
```

## 範例範本

### RAG 聊天應用程式 (Python)

<strong>程式庫</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>描述</strong>: 最受歡迎的 Azure AI 範例 — 一個生產級 RAG 聊天應用程式，可讓你針對自己的文件提問。採用 GPT-4.1-mini 進行聊天，text-embedding-3-large 用於向量嵌入，並使用 Azure AI Search 進行檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 認證及 Application Insights 追蹤。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用程式 (.NET)

<strong>程式庫</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>描述</strong>: Python RAG 聊天範例的 .NET/C# 對應版本。使用 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端建構。包含語音聊天、GPT-4o-mini 視覺支援，以及搭配 .NET MAUI Blazor Hybrid 桌面/行動用戶端。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用程式 (Java)

<strong>程式庫</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>描述</strong>: 使用 Langchain4J 進行 AI 編排的 Java 版本 RAG 聊天範例。支援微服務事件驅動架構，多種搜尋策略（文本、向量、混合），Azure Document Intelligence 文件上傳，以及 Azure Container Apps 或 Azure Kubernetes Service 部署。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry 的企業零售助理

<strong>程式庫</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>描述</strong>: 端到端零售 RAG 助理，結合 Microsoft Foundry 和 Prompty。Contoso Outdoor 零售聊天機器人，根據產品目錄和客戶訂單數據回應。展示完整 GenAIOps 工作流 — 使用 Prompty 原型設計，透過 AI 助理評估，並經由 AZD 部署到 Container Apps。

<strong>快速開始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用

<strong>程式庫</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>描述</strong>: 多代理示範範例，展示 AI 代理編排與 Prompty。利用研究代理 (Bing Grounding Azure AI Agent Service)、產品代理 (Azure AI Search)、作家代理及編輯代理協同產出深度調查文章。含 CI/CD 及 GitHub Actions 評估。

<strong>快速開始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天 (JavaScript/TypeScript)

<strong>程式庫</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>描述</strong>: 使用 LangChain.js 且完全無伺服器的 RAG 聊天機器人，API 採用 Azure Functions，主機架設於 Azure Static Web Apps。Azure Cosmos DB 作為向量存儲及聊天歷史庫。支援使用 Ollama 進行本地開發和免費測試。

<strong>快速開始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與你的資料聊天解決方案加速器

<strong>程式庫</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>描述</strong>: 企業級 RAG 解決方案加速器，含管理入口網站用於文件上傳/管理，多種協調器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，以及 PostgreSQL 或 Cosmos DB 後端選擇。設計為可客製化的生產 RAG 起點。

<strong>快速開始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅遊代理 — 多代理 MCP 編排

<strong>程式庫</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP 伺服器 (.NET、Python、Java、TypeScript)

<strong>描述</strong>: 多代理 AI 編排參考應用，使用三個框架（LangChain.js、LlamaIndex.TS 和 Microsoft Agent Framework）。特色為四種語言的 MCP（模型上下文協議）伺服器，作為無伺服器的 Azure Container Apps 並帶有 OpenTelemetry 監控。

<strong>快速開始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 起步範本

<strong>程式庫</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>: Azure AI 服務 + Azure OpenAI

<strong>描述</strong>: 簡約的 Bicep 範本，部署設定好的 Azure AI 服務與機器學習模型。當你只需要 Azure AI 基礎設施而不需完整應用程式堆疊時，是輕量的起點選擇。

<strong>快速開始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：請訪問 [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)，瀏覽 80 多個專為各語言和場景設計的 AI 特定 AZD 範本。

## 下一步

1. <strong>試用範例</strong>：從符合你使用情境的預製範本開始
2. <strong>依需求客製化</strong>：修改基礎設施與應用程式程式碼
3. <strong>新增監控</strong>：實施全面可觀察性
4. <strong>優化成本</strong>：根據預算微調設定
5. <strong>保護你的部署</strong>：實踐企業級安全模式
6. <strong>擴展到生產環境</strong>：增添多區域與高可用功能

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry 模型聊天應用程式（30 分鐘）
<strong>目標</strong>：部署並測試一個生產就緒的 AI 聊天應用程式

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

# 監察人工智能操作
azd monitor

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 部署完成且無配額錯誤
- [ ] 可在瀏覽器中存取聊天介面
- [ ] 可提問並獲得 AI 支援的回覆
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清理資源

<strong>預估費用</strong>：測試 30 分鐘約 $5-10 美元

### 練習 2：設定多模型部署（45 分鐘）
<strong>目標</strong>：部署多個 AI 模型並設定不同配置

```bash
# 建立自訂 Bicep 配置
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

# 部署及驗證
azd provision
azd show
```

**成功標準：**
- [ ] 多個模型部署成功
- [ ] 套用不同容量設定
- [ ] 透過 API 可存取模型
- [ ] 可從應用程式呼叫兩個模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>：設定預算警示和成本追蹤

```bash
# 新增預算警報至 Bicep
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

# 部署預算警報
azd provision

# 檢查目前成本
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] 已在 Azure 建立預算警示
- [ ] 設定電子郵件通知
- [ ] 可在 Azure 入口網站查看成本資料
- [ ] 適當設定預算門檻

## 💡 常見問題

<details>
<summary><strong>如何在開發期間降低 Microsoft Foundry 模型成本？</strong></summary>

1. <strong>使用免費方案</strong>：Microsoft Foundry 模型每月提供 50,000 代幣免費額度
2. <strong>降低容量</strong>：開發時將容量設定為每分鐘 10 代幣（TPM），非 30 以上
3. **使用 azd down**：不開發時釋放資源
4. <strong>回應快取</strong>：對重複查詢實施 Redis 快取
5. <strong>利用提示工程</strong>：利用高效提示減少代幣使用


```bash
# 開發配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型與 OpenAI API 有何不同？</strong></summary>

**Microsoft Foundry 模型**：
- 企業安全與合規
- 私有網絡整合
- SLA 保證
- 管理身份驗證
- 提供更高配額

**OpenAI API**：
- 更快取得新模型
- 更簡單的設置
- 較低的使用門檻
- 僅限公共網路

對於生產應用，**建議使用 Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry 模型配額超出錯誤？</strong></summary>

```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 申請配額增加
# 前往 Azure 入口網站 > 配額 > 申請增加
```
</details>

<details>
<summary><strong>我可以用自己的資料搭配 Microsoft Foundry 模型嗎？</strong></summary>

可以！使用 **Azure AI Search** 來實現 RAG（檢索增強生成）：

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

請參考 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 範本。
</details>

<details>
<summary><strong>如何保護 AI 模型端點安全？</strong></summary>

<strong>最佳實踐</strong>：
1. 使用管理身份（無需 API 金鑰）
2. 啟用私有端點
3. 設定網絡安全群組
4. 實施速率限制
5. 使用 Azure Key Vault 管理祕密

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

- **Microsoft Foundry Discord**：[Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**：[問題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**：[官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**：[skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在您的編輯器中安裝 Azure + Foundry 代理技能

---

**章節導航：**
- **📚 課程主頁**：[AZD 新手入門](../../README.md)
- **📖 目前章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[第 1 章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下個章節**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社區討論或在儲存庫中開啟問題。Azure AI + AZD 社群隨時為您提供協助！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
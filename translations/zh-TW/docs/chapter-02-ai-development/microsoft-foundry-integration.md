# Microsoft Foundry 與 AZD 的整合

**章節導航：**
- **📚 課程首頁**： [AZD 初學者指南](../../README.md)
- **📖 目前章節**： 第二章 - AI 優先開發
- **⬅️ 上一章節**： [第一章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章節**： [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**： [第三章：設定](../chapter-03-configuration/configuration.md)

## 概述

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署流程。Microsoft Foundry 提供了建立、部署及管理 AI 應用程式的完整平台，而 AZD 則簡化了基礎架構與部署流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟的統一 AI 開發平台，包含：

- <strong>模型目錄</strong>：存取最先進的 AI 模型
- <strong>提示流程</strong>：AI 工作流程的視覺化設計工具
- **Microsoft Foundry 入口網站**：整合的 AI 應用開發環境
- <strong>部署選項</strong>：多種主機與擴展方案
- <strong>安全與防護</strong>：內建負責任 AI 功能

## AZD + Microsoft Foundry：強強聯手

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動入口網站部署 | 自動化且可重複部署 |
| <strong>基礎架構</strong> | 點擊式佈建 | 以程式碼配置基礎架構 (Bicep) |
| <strong>環境管理</strong> | 單一環境聚焦 | 多環境（開發/測試/生產） |
| **CI/CD 整合** | 限制性 | 原生 GitHub Actions 支援 |
| <strong>成本管理</strong> | 基本監控 | 環境專屬成本優化 |

## 前置需求

- 擁有適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry 模型服務
- 對 Microsoft Foundry 具備基礎認識

> **目前 AZD 基準版本：** 這些範例已針對 `azd` `1.23.12` 版本測試。AI 代理工作流程請使用最新預覽版擴充，並於開始前檢查您安裝的版本。

## 核心整合範式

### 範式 1：Microsoft Foundry 模型整合

<strong>使用情境</strong>：使用 Microsoft Foundry 模型部署聊天應用程式

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

### 範式 2：AI 搜尋 + RAG 整合

<strong>使用情境</strong>：部署檢索增強生成（RAG）應用

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

### 範式 3：文件智慧整合

<strong>使用情境</strong>：文件處理與分析工作流程

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

## 🔧 設定範式

### 環境變數設定

**生產環境配置：**
```bash
# 核心 AI 服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# 性能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發環境配置：**
```bash
# 為開發最佳化成本的設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費方案
```

### 以 Key Vault 進行安全配置

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

## 部署工作流程

### Foundry 的 AZD 擴充套件

AZD 提供增強 AI 能力的擴充功能，方便與 Microsoft Foundry 服務互動：

```bash
# 安裝 Foundry 代理擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 列出已安裝的擴充功能
azd extension list --installed

# 檢查目前安裝的代理擴充功能版本
azd extension show azure.ai.agents
```

AI 擴充仍處於快速演進的預覽階段。若指令行為與此不同，請先升級相關擴充，再排除專案問題。

### 使用 `azd ai` 進行代理優先部署

如果有代理清單，使用 `azd ai agent init` 來生成連接至 Foundry Agent 服務的專案骨架：

```bash
# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

最近 `azure.ai.agents` 預覽版本新增基於模板的初始化支援。若您參考新版代理範例，請檢視擴充說明以了解您安裝版本的可用旗標。

完整指令參考請見 [AZD AI CLI 命令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

### 單指令部署

```bash
# 用一個指令部署所有內容
azd up

# 或者逐步部署
azd provision  # 僅基礎設施
azd deploy     # 僅應用程式

# 適用於 azd 1.23.11+ 中長時間運行的 AI 應用程式部署
azd deploy --timeout 1800
```

### 環境專屬部署

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

### 自動擴展配置

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

**症狀：**
- 部署因配額錯誤失敗
- 應用程式日誌出現 429 錯誤

**解決方案：**
```bash
# 檢查目前配額使用狀況
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

# 檢查受管身份設定
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證金鑰保管庫存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 模型無法部署或使用
- 特定模型版本部署失敗

**解決方案：**
```bash
# 列出各區域可用的模型
az cognitiveservices model list --location eastus

# 在 bicep 模板中更新模型版本
# 檢查模型容量需求
```

## 範例模板

### RAG 聊天應用（Python）

<strong>程式庫</strong>：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>說明</strong>：最受歡迎的 Azure AI 範例，一款可量產的 RAG 聊天應用，能夠基於您自己的文件進行問答。採用 GPT-4.1-mini 進行聊天，text-embedding-3-large 作為向量嵌入，並用 Azure AI Search 做檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 認證與 Application Insights 追蹤。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用（.NET）

<strong>程式庫</strong>：[azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>說明</strong>：Python RAG 聊天範例的 .NET/C# 版本。採用 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端開發。包含語音聊天、GPT-4o-mini 視覺支援，以及同伴式 .NET MAUI Blazor Hybrid 桌面/行動客戶端。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用（Java）

<strong>程式庫</strong>：[azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>說明</strong>：使用 Langchain4J 進行 AI 編排的 Java 版 RAG 聊天範例。支援微服務事件驅動架構、多種檢索策略（文字、向量、混合）、透過 Azure Document Intelligence 上傳文件，並可部署於 Azure Container Apps 或 Azure Kubernetes Service。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 企業零售 Copilot 搭配 Azure AI Foundry

<strong>程式庫</strong>：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>：Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>說明</strong>：端到端零售 RAG 助理，結合 Azure AI Foundry 與 Prompty。Contoso 戶外零售業聊天機器人，依據產品目錄與客戶訂單資料產生回應。展示完整 GenAIOps 工作流程 — 使用 Prompty 原型設計，AI 協助評估，並透過 AZD 部署至 Container Apps。

<strong>快速開始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用

<strong>程式庫</strong>：[contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>：Azure OpenAI + Azure AI 代理服務 + Bing 資料來源 + Azure AI Search + Azure Container Apps

<strong>說明</strong>：多代理範例，展示使用 Prompty 編排 AI 代理。包含研究代理（Azure AI 代理服務中的 Bing 資料來源）、產品代理（Azure AI Search）、寫作代理與編輯代理，共同產出深入研究文章。包含 GitHub Actions 的 CI/CD 評估流程。

<strong>快速開始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天（JavaScript/TypeScript）

<strong>程式庫</strong>：[serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>：Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB（NoSQL）+ LangChain.js

<strong>說明</strong>：完全無伺服器的 RAG 聊天機器人範例，使用 LangChain.js，Azure Functions 提供 API，Azure Static Web Apps 作為託管平台。Azure Cosmos DB 同時作為向量資料庫及聊天歷史資料庫。支援使用 Ollama 進行本地開發和零成本測試。

<strong>快速開始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與您的資料交談解決方案加速器

<strong>程式庫</strong>：[chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>說明</strong>：企業級 RAG 解決方案加速器，配備管理員入口網站供文件上傳/管理，支援多種協調器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，以及 PostgreSQL 或 Cosmos DB 後端。設計為生產 RAG 場景的可定制起點。

<strong>快速開始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅行代理 — 多代理 MCP 編排

<strong>程式庫</strong>：[azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>：Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP 伺服器 (.NET、Python、Java、TypeScript)

<strong>說明</strong>：多代理 AI 編排參考應用，結合三種框架（LangChain.js、LlamaIndex.TS、Microsoft 代理框架）。特色為四種語言的 MCP（Model Context Protocol）伺服器，作為無伺服器 Azure Container Apps 部署，並含 OpenTelemetry 監控。

<strong>快速開始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 入門專案

<strong>程式庫</strong>：[azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>：Azure AI 服務 + Azure OpenAI

<strong>說明</strong>：極簡 Bicep 範本，部署已配置機器學習模型的 Azure AI 服務。輕量化起點，適合只需 Azure AI 基礎架構而不包含完整應用程式棧者。

<strong>快速開始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：造訪 [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)，可找到 80 多個跨語言與場景的 AI 專用 AZD 範本。

## 後續步驟

1. <strong>試用範例</strong>：從符合您需求的已建範本開始
2. <strong>依需求客製化</strong>：修改基礎架構與應用程式程式碼
3. <strong>增加監控功能</strong>：實施全面可觀察性
4. <strong>成本優化</strong>：針對預算微調設定
5. <strong>確保部署安全</strong>：採用企業級安全模式
6. <strong>擴展至生產環境</strong>：加入多區域與高可用性功能

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry 模型聊天應用（30 分鐘）
<strong>目標</strong>：部署並測試可生產用的 AI 聊天應用

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

# 監控 AI 操作
azd monitor

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 部署完成且無配額錯誤
- [ ] 可在瀏覽器訪問聊天介面
- [ ] 可提問並獲得 AI 回應
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清除資源

<strong>預估費用</strong>：30 分鐘測試約 5-10 美元

### 練習 2：配置多模型部署（45 分鐘）
<strong>目標</strong>：部署多個不同配置的 AI 模型

```bash
# 建立自訂 Bicep 設定
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

**成功標準：**
- [ ] 多模型成功部署
- [ ] 不同容量設定正確套用
- [ ] 模型可由 API 存取
- [ ] 應用程式可呼叫多個模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>：建立預算警示及成本追蹤

```bash
# 將預算警報新增至 Bicep
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

# 檢查當前費用
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] 在 Azure 建立預算警示
- [ ] 電子郵件通知設定完成
- [ ] 可在 Azure 入口網站查看成本資料
- [ ] 預算閾值適當設定

## 💡 常見問題

<details>
<summary><strong>如何在開發期間降低 Microsoft Foundry 模型的成本？</strong></summary>

1. <strong>使用免費層方案</strong>：Microsoft Foundry 模型每月提供 50,000 代幣免費額度
2. <strong>降低容量設定</strong>：開發時設定 10 TPM，非 30 以上
3. **使用 azd down**：非開發期間釋放資源
4. <strong>快取回應</strong>：實作 Redis 快取以應對重複查詢
5. <strong>優化提示設計</strong>：透過有效提示減少代幣使用量
```bash
# 開發配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models 與 OpenAI API 有什麼不同？</strong></summary>

**Microsoft Foundry Models**：
- 企業安全與合規
- 私有網路整合
- SLA 保證
- 管理身份驗證
- 可用更高配額

**OpenAI API**：
- 更快取得新模型
- 簡單設置
- 進入門檻較低
- 僅限公共網際網路

對於生產環境應用，**建議使用 Microsoft Foundry Models**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry Models 配額超出錯誤？</strong></summary>

```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 申請增加配額
# 前往 Azure 入口網站 > 配額 > 申請增加
```
</details>

<details>
<summary><strong>我可以用自己的資料搭配 Microsoft Foundry Models 嗎？</strong></summary>

可以！使用 **Azure AI Search** 進行 RAG（檢索增強生成）：

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
<summary><strong>如何保護 AI 模型端點的安全？</strong></summary>

<strong>最佳實踐</strong>：
1. 使用管理身份（無需 API 金鑰）
2. 啟用私人端點
3. 配置網路安全群組
4. 實施流量限制
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在您的編輯器中安裝 Azure + Foundry 代理技能

---

**章節導覽：**
- **📚 課程首頁**： [AZD For Beginners](../../README.md)
- **📖 目前章節**： 第二章 - AI 優先開發
- **⬅️ 前一章**： [第一章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章節**： [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**： [第三章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群討論或在倉庫中開啟問題。Azure AI + AZD 社群隨時協助您成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始語言的文件應視為權威來源。如涉及重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所引起的任何誤解或錯誤詮釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry 與 AZD 的整合

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 本章節**: 第二章 - AI 優先開發
- **⬅️ 前一章節**: [第一章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章節**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第三章：設定](../chapter-03-configuration/configuration.md)

## 概覽

本指南展示如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用部署流程。Microsoft Foundry 提供一個完整的平台，用於構建、部署與管理 AI 應用，而 AZD 則簡化了基礎設施和部署過程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟統一的 AI 開發平台，包含：

- <strong>模型目錄</strong>：存取最先進的 AI 模型
- <strong>提示流程</strong>：AI 工作流程的視覺化設計工具
- **Microsoft Foundry 入口網站**：整合的 AI 應用開發環境
- <strong>部署選項</strong>：多種主機和擴展方案
- <strong>安全與防護</strong>：內建負責任 AI 功能

## AZD + Microsoft Foundry：更強的組合

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動入口網站部署 | 自動化、可重複部署 |
| <strong>基礎設施</strong> | 點擊式佈建 | 基礎設施即程式碼（Bicep） |
| <strong>環境管理</strong> | 單一環境焦點 | 多環境（開發/測試/正式） |
| **CI/CD 整合** | 限制性 | 原生支援 GitHub Actions |
| <strong>成本管理</strong> | 基本監控 | 環境特定的成本優化 |

## 前置需求

- 具備適當權限的 Azure 訂閱
- 安裝 Azure Developer CLI
- 存取 Microsoft Foundry 模型服務
- 基本了解 Microsoft Foundry

> **目前 AZD 基線：** 這些範例已使用 `azd` `1.27.1` 進行測試。對於 AI 代理工作流程，請使用最新預覽擴充套件，並在開始前檢查已安裝版本。

## 主要整合範式

### 範式 1：Microsoft Foundry 模型整合

<strong>使用情境</strong>：部署使用 Microsoft Foundry 模型的聊天應用

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

**基礎設施 (main.bicep)：**
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

<strong>使用情境</strong>：部署檢索增強生成 (RAG) 應用

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

## 🔧 設定範例

### 環境變數設定

**正式環境設定：**
```bash
# 核心人工智慧服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型設定
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# 性能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發環境設定：**
```bash
# 開發用成本優化設置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費方案
```

### 使用 Key Vault 保護設定

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

AZD 提供擴充套件，增加與 Microsoft Foundry 服務交互的 AI 專用功能：

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

AI 擴充套件仍在快速迭代的預覽階段。如命令行表現與此處所示不同，請先升級相關擴充套件，再檢查專案本身。

### 以代理優先方式使用 `azd ai` 部署

如果有代理清單，使用 `azd ai agent init` 建立一個與 Foundry Agent Service 連接的專案骨架：

```bash
# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

近期的 `azure.ai.agents` 預覽版也新增了基於範本的初始化支援，適用於 `azd ai agent init`。如您在使用新版代理範例，請查閱擴充套件說明，以了解已安裝版本支援的完整旗標。

詳見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 取得完整指令參考與旗標說明。

### 單一指令部署

```bash
# 一個指令部署所有內容
azd up

# 或逐步部署
azd provision  # 只部署基礎設施
azd deploy     # 只部署應用程式

# 適用於 azd 1.23.11 以上版本的長期運行 AI 應用部署
azd deploy --timeout 1800
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

## 🔐 安全性最佳實踐

### 管理身分識別設定

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

### 自動擴展設定

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

## 常見問題排除

### 問題 1：OpenAI 配額超過

**症狀：**
- 部署失敗，出現配額錯誤
- 應用程式日誌中有 429 錯誤

**解決方案：**
```bash
# 檢查當前配額使用情況
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
- 顯示「存取被拒」訊息

**解決方案：**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查託管身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證金鑰保管庫存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 部署中模型無法使用
- 特定模型版本部署失敗

**解決方案：**
```bash
# 列出各地區可用的模型
az cognitiveservices model list --location eastus

# 在 bicep 範本中更新模型版本
# 檢查模型容量需求
```

## 範例範本

### RAG 聊天應用（Python）

<strong>原始碼庫</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>: Azure OpenAI + Azure AI 搜尋 + Azure Container Apps + Azure Blob Storage

<strong>說明</strong>: 最受歡迎的 Azure AI 範例—生產級 RAG 聊天應用，能針對您自有文件回答問題。使用 GPT-4.1-mini 用於聊天，text-embedding-3-large 用於嵌入，Azure AI 搜尋負責檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 認證與 Application Insights 追蹤。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用（.NET）

<strong>原始碼庫</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>: Azure OpenAI + Azure AI 搜尋 + Azure Container Apps + Semantic Kernel

<strong>說明</strong>: Python RAG 聊天範例的 .NET/C# 對應版本。使用 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端構建。包含語音聊天、GPT-4o-mini 視覺支援及配套的 .NET MAUI Blazor Hybrid 桌面/行動端用戶端。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用（Java）

<strong>原始碼庫</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>: Azure OpenAI + Azure AI 搜尋 + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>說明</strong>: Java 版本 RAG 聊天範例，使用 Langchain4J 進行 AI 編排。支援微服務事件驅動架構、多種搜尋策略（文字、向量、混合）、利用 Azure Document Intelligence 上傳文件，並可在 Azure Container Apps 或 Azure Kubernetes Service 部署。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry 企業零售助手

<strong>原始碼庫</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI 搜尋 + Azure Container Apps + Azure Cosmos DB

<strong>說明</strong>: 使用 Microsoft Foundry 和 Prompty 的零售 RAG 助手全流程範例。Contoso 戶外零售聊天機器人，回應依據商品目錄與客戶訂單資料。演示完整 GenAIOps 工作流程—用 Prompty 原型設計，AI 輔助評估者評估，最終透過 AZD 部署至 Container Apps。

<strong>快速開始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 多代理創意寫作應用

<strong>原始碼庫</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>: Azure OpenAI + Azure AI 代理服務 + Bing 基礎 + Azure AI 搜尋 + Azure Container Apps

<strong>說明</strong>: 多代理範例，展示 Prompty AI 代理編排。結合研究代理（Bing 基礎於 Azure AI 代理服務）、產品代理（Azure AI 搜尋）、寫手代理與編輯代理，共同創作深入研究文章。具備 GitHub Actions CI/CD 且含評估。

<strong>快速開始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天（JavaScript/TypeScript）

<strong>原始碼庫</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>: Azure OpenAI + Azure Functions + Azure 靜態網站 + Azure Cosmos DB for NoSQL + LangChain.js

<strong>說明</strong>: 完全無伺服器的 RAG 聊天機器人，使用 LangChain.js 搭配 Azure Functions 提供 API，Azure 靜態網站負責託管。利用 Azure Cosmos DB 作為向量庫與聊天記錄資料庫。支援 Ollama 作為本地零成本測試環境。

<strong>快速開始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與您的資料聊天方案加速器

<strong>原始碼庫</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>: Azure OpenAI + Azure AI 搜尋 + Azure App Service + Azure 文件智慧 + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>說明</strong>: 企業級 RAG 解決方案加速器，含文件上傳/管理管理介面、多種編排器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，並可選擇 PostgreSQL 或 Cosmos DB 進行後端存儲。設計為可客製化的生產用 RAG 起點。

<strong>快速開始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅遊代理 — 多代理 MCP 編排

<strong>原始碼庫</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP 伺服器（.NET、Python、Java、TypeScript）

<strong>說明</strong>: 多代理 AI 編排參考應用，使用三種框架（LangChain.js、LlamaIndex.TS、Microsoft Agent Framework）。特色是四種語言的 MCP（模型上下文協議）伺服器，以無伺服器 Azure Container Apps 部署，並帶有 OpenTelemetry 監控。

<strong>快速開始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 初學者

<strong>原始碼庫</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>: Azure AI 服務 + Azure OpenAI

<strong>說明</strong>: 簡易的 Bicep 範本，部署 Azure AI 服務與設定好的機器學習模型。當您只需 Azure AI 基礎設施，不要完整應用程式堆疊時，一個輕量的起點。

<strong>快速開始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：造訪 [Awesome AZD AI 範本庫](https://azure.github.io/awesome-azd/?tags=ai)，收錄 80 多個 AI 專屬 AZD 範本，涵蓋不同語言和場景。

## 下一步

1. <strong>嘗試範例</strong>：從符合您需求的預建範本開始
2. <strong>客製化您的需求</strong>：修改基礎設施與應用程式碼
3. <strong>增加監控</strong>：實作全面的可觀察性
4. <strong>成本優化</strong>：針對預算調整設定
5. <strong>保護您的部署</strong>：實施企業安全模式
6. <strong>擴展至生產</strong>：增加多區域與高可用功能

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry 模型聊天應用（30 分鐘）
<strong>目標</strong>：部署並測試生產級 AI 聊天應用

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

**成功標準：**
- [ ] 部署完成且無配額錯誤
- [ ] 可透過瀏覽器存取聊天介面
- [ ] 能發問並得到 AI 回答
- [ ] Application Insights 顯示遙測數據
- [ ] 成功清理所有資源

<strong>預估成本</strong>：30 分鐘測試約新台幣 150 到 300 元

### 練習 2：設定多模型部署（45 分鐘）
<strong>目標</strong>：部署多個具有不同設定的 AI 模型

```bash
# 建立自訂的 Bicep 配置
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
- [ ] 多個模型成功部署
- [ ] 應用不同容量設定
- [ ] 模型可透過 API 存取
- [ ] 可從應用程式呼叫兩個模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>：設定預算警示與成本追蹤

```bash
# 新增預算警示到 Bicep
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

# 檢查目前花費
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] 在 Azure 中建立預算警示
- [ ] 配置電子郵件通知
- [ ] 可以在 Azure 入口網站查看成本數據
- [ ] 預算門檻適當設置

## 💡 常見問題

<details>
<summary><strong>開發期間如何降低 Microsoft Foundry 模型的成本？</strong></summary>

1. <strong>使用免費額度</strong>：Microsoft Foundry 模型每月提供 50,000 代幣免費額度
2. <strong>降低容量</strong>：開發時將容量設定為 10 TPM 而非 30+ TPM
3. **使用 azd down**：非開發期間釋出資源
4. <strong>快取回應</strong>：對重複查詢實作 Redis 快取
5. <strong>使用提示工程</strong>：以高效提示減少代幣使用


```bash
# 開發環境設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型與 OpenAI API 有何不同？</strong></summary>

**Microsoft Foundry 模型**:
- 企業級安全性與合規性
- 私有網路整合
- SLA 保證
- 托管身份驗證
- 提供更高額度

**OpenAI API**:
- 更快取得新模型
- 設定簡單
- 較低的進入門檻
- 僅限公共網際網路

對於生產應用，**建議使用 Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>我該如何處理 Microsoft Foundry 模型的額度超限錯誤？</strong></summary>

```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up

# 暫時降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 申請配額增加
# 前往 Azure 入口網站 > 配額 > 申請增加
```
</details>

<details>
<summary><strong>我可以使用自己的資料搭配 Microsoft Foundry 模型嗎？</strong></summary>

可以！請使用 **Azure AI Search** 進行 RAG（檢索增強生成）：

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
<summary><strong>我該如何保護 AI 模型端點的安全？</strong></summary>

<strong>最佳做法</strong>:
1. 使用託管身份（不使用 API 金鑰）
2. 啟用私有端點
3. 配置網路安全群組
4. 實施速率限制
5. 使用 Azure Key Vault 來管理機密

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
- **AZD GitHub**: [問題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh 的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在編輯器中安裝 Azure 與 Foundry 代理技能

---

**章節導航：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 本章節**: 第二章 - AI 優先開發
- **⬅️ 上一章**: [第一章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一頁**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第三章：設定](../chapter-03-configuration/configuration.md)

**需要協助？** 加入我們的社群討論或於倉庫中開啟議題。Azure AI + AZD 社群在此協助你成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
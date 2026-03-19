# Microsoft Foundry 與 AZD 的整合

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

## 概述

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，簡化 AI 應用程式的部署流程。Microsoft Foundry 提供建置、部署及管理 AI 應用的完整平台，而 AZD 則簡化了基礎建設與部署過程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟的統一 AI 開發平台，包括：

- <strong>模型目錄</strong>：取得最新的 AI 模型
- **Prompt Flow**：AI 工作流程的視覺化設計器
- **Microsoft Foundry 入口網站**：AI 應用的整合開發環境
- <strong>部署選項</strong>：多種主機和擴展方案
- **安全與責任 AI**：內建責任 AI 功能

## AZD + Microsoft Foundry：強強聯手

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動入口網站部署 | 自動化、可重複的部署 |
| <strong>基礎建設</strong> | 點擊式建置 | 基礎建設即程式碼（Bicep） |
| <strong>環境管理</strong> | 單一環境專注 | 多環境管理（開發/測試/正式） |
| **CI/CD 整合** | 有限支持 | 原生支援 GitHub Actions |
| <strong>成本管理</strong> | 基本監控 | 依環境優化成本 |

## 先決條件

- 具適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可使用 Microsoft Foundry Models 服務
- 對 Microsoft Foundry 有基本認識

## 核心整合模式

### 模式 1：Microsoft Foundry Models 整合

<strong>用例</strong>：部署使用 Microsoft Foundry Models 模型的聊天應用程式

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

**基礎建設 (main.bicep)：**
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

### 模式 2：AI 搜尋 + RAG 整合

<strong>用例</strong>：部署檢索強化生成 (RAG) 應用程式

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

### 模式 3：文件智能整合

<strong>用例</strong>：文件處理及分析工作流程

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

**正式環境設定：**
```bash
# 核心人工智能服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# 性能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發環境設定：**
```bash
# 成本優化的開發設置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費層級
```

### 使用 Key Vault 保障安全設定

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

### Foundry 專用的 AZD 擴充工具

AZD 提供擴充功能，新增針對 Microsoft Foundry 服務的 AI 專屬能力：

```bash
# 安裝 Foundry 代理擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 列出已安裝的擴充功能
azd extension list
```

### 使用 `azd ai` 的代理人優先部署

若您有代理人配置檔，使用 `azd ai agent init` 建立連結至 Foundry Agent 服務的專案骨架：

```bash
# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

完整命令與旗標請參考 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

### 一鍵部署

```bash
# 用一個指令部署所有項目
azd up

# 或逐步部署
azd provision  # 只部署基礎設施
azd deploy     # 只部署應用程式
```

### 針對不同環境部署

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

## 監控與可觀測性

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

### 託管身份識別設定

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

## 常見問題排解

### 問題 1：OpenAI 配額超限

**症狀：**
- 部署時出現配額錯誤
- 應用日誌中出現 429 錯誤

**解決方案：**
```bash
# 檢查當前配額使用情況
az cognitiveservices usage list --location eastus

# 嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題 2：身份驗證失敗

**症狀：**
- 呼叫 AI 服務時出現 401/403 錯誤
- 顯示「存取被拒」訊息

**解決方案：**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查託管身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證金鑰庫存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 模型無法在部署中使用
- 特定模型版本無法運作

**解決方案：**
```bash
# 按地區列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 模板中更新模型版本
# 檢查模型容量需求
```

## 範例範本

### RAG 聊天應用程式 (Python)

<strong>程式庫</strong>：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>：Azure OpenAI + Azure AI 搜尋 + Azure Container Apps + Azure Blob Storage

<strong>說明</strong>：最受歡迎的 Azure AI 範例 — 一個生產就緒的 RAG 聊天應用，可以根據您自己的文件提出問題。使用 GPT-4.1-mini 進行聊天，text-embedding-ada-002 生成向量，並使用 Azure AI 搜尋檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 身份驗證及 Application Insights 追蹤。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用程式 (.NET)

<strong>程式庫</strong>：[azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>：Azure OpenAI + Azure AI 搜尋 + Azure Container Apps + Semantic Kernel

<strong>說明</strong>：Python RAG 聊天範例的 .NET/C# 等價版本。基於 ASP.NET Core Minimal API 及 Blazor WebAssembly 前端。包含語音聊天、GPT-4o-mini 視覺支援與配套的 .NET MAUI Blazor Hybrid 桌面/行動客戶端。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用程式 (Java)

<strong>程式庫</strong>：[azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>：Azure OpenAI + Azure AI 搜尋 + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>說明</strong>：Java 版 RAG 聊天範例，使用 Langchain4J 做 AI 編排。支援微服務事件驅動架構、多種搜尋策略（文字、向量、混合）、透過 Azure Document Intelligence 上傳文件，與在 Azure Container Apps 或 Azure Kubernetes Service 部署。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 企業零售助理與 Azure AI Foundry

<strong>程式庫</strong>：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>：Azure OpenAI + Azure AI Foundry + Prompty + Azure AI 搜尋 + Azure Container Apps + Azure Cosmos DB

<strong>說明</strong>：端到端零售 RAG 助理，使用 Azure AI Foundry 與 Prompty。Contoso 戶外用品零售商聊天機器人，回應以產品目錄和客戶訂單數據為依據。展示完整 GenAIOps 工作流程——以 Prompty 原型、AI 輔助評估器評估，再透過 AZD 部署到 Container Apps。

<strong>快速開始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用程式

<strong>程式庫</strong>：[contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>：Azure OpenAI + Azure AI 代理服務 + Bing Grounding + Azure AI 搜尋 + Azure Container Apps

<strong>說明</strong>：多代理範例，展示使用 Prompty 進行 AI 代理編排。包含研究代理（Azure AI 代理服務中的 Bing Grounding）、產品代理（Azure AI 搜尋）、寫作代理與編輯代理，共同生成完善的研究文章。含 GitHub Actions 中的 CI/CD 及評估。

<strong>快速開始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天 (JavaScript/TypeScript)

<strong>程式庫</strong>：[serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>：Azure OpenAI + Azure Functions + Azure 靜態網站 + Azure Cosmos DB for NoSQL + LangChain.js

<strong>說明</strong>：完全無伺服器的 RAG 聊天機器人，使用 LangChain.js 加 Azure Functions 作為 API，Azure 靜態網站作主機。使用 Azure Cosmos DB 作為向量儲存與聊天歷史資料庫。支援 Ollama 的本地開發及免費測試。

<strong>快速開始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與您的數據對話方案加速器

<strong>程式庫</strong>：[chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>：Azure OpenAI + Azure AI 搜尋 + Azure 應用服務 + Azure 文件智能 + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>說明</strong>：企業級 RAG 解決方案加速器，具文件上傳/管理的管理入口，支援多種編排器（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，後端可選 PostgreSQL 或 Cosmos DB。設計為可自訂的生產 RAG 起點。

<strong>快速開始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅遊代理人 — 多代理 MCP 編排

<strong>程式庫</strong>：[azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>：Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP 伺服器 (.NET, Python, Java, TypeScript)

<strong>說明</strong>：多代理 AI 編排的參考應用，使用三大框架（LangChain.js、LlamaIndex.TS 和 Microsoft Agent Framework）。具備多語言 MCP（模型上下文協定）伺服器，部署為無伺服器 Azure Container Apps，並支援 OpenTelemetry 監控。

<strong>快速開始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 入門

<strong>程式庫</strong>：[azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>：Azure AI 服務 + Azure OpenAI

<strong>說明</strong>：最簡化的 Bicep 範本，部署 Azure AI 服務並設定機器學習模型。輕量起點，適用僅需 Azure AI 基礎建設，無需完整應用堆疊時。

<strong>快速開始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：請造訪 [Awesome AZD AI 範本展示](https://azure.github.io/awesome-azd/?tags=ai)，查看 80+ 個針對 AI 場景與語言的 AZD 專屬範本。

## 下一步

1. <strong>嘗試範例</strong>：使用符合您需求的預建範本開始
2. <strong>依需求自訂</strong>：修改基礎建設與應用程式程式碼
3. <strong>加入監控</strong>：實作全面的可觀測性
4. <strong>優化成本</strong>：根據預算微調設定
5. <strong>保護部署安全</strong>：實施企業級安全模式
6. <strong>擴展至正式環境</strong>：加入多區域及高可用架構

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry Models 聊天應用（30 分鐘）
<strong>目標</strong>：部署並測試一個生產就緒的 AI 聊天應用

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

# 監察 AI 操作
azd monitor

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 部署完成且無配額錯誤
- [ ] 可於瀏覽器存取聊天介面
- [ ] 可提出問題並獲得 AI 回應
- [ ] Application Insights 顯示遙測數據
- [ ] 成功清理資源

<strong>預估費用</strong>：30 分鐘測試約 5-10 美元

### 練習 2：設定多模型部署（45 分鐘）
<strong>目標</strong>：部署多個 AI 模型，並應用不同設定

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

# 部署及驗證
azd provision
azd show
```

**成功標準：**
- [ ] 多個模型成功部署
- [ ] 套用不同容量設定
- [ ] 模型可透過 API 存取
- [ ] 可從應用呼叫兩個模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>：設定預算警示及成本追蹤

```bash
# 新增預算警示至 Bicep
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

# 檢查當前成本
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] 在 Azure 中建立預算警示
- [ ] 設定郵件通知
- [ ] 可在 Azure 入口網站查看成本資料
- [ ] 合理設定預算門檻

## 💡 常見問題

<details>
<summary><strong>如何在開發過程中減少 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免費額度</strong>：Microsoft Foundry Models 每月提供 50,000 個 tokens 免費
2. <strong>降低容量</strong>：開發環境將容量調低為 10 TPM，而非 30+
3. **使用 azd down**：不開發時解除配置資源
4. <strong>快取回應</strong>：實作 Redis 快取以重複查詢
5. <strong>使用提示工程</strong>：透過高效提示減少 token 使用量

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
- 託管身份認證
- 提供更高配額

**OpenAI API**：
- 新模型更快獲得
- 簡易設定
- 門檻較低
- 僅限公共網際網路

生產應用建議選用 **Microsoft Foundry Models**。
</details>

<details>
<summary><strong>我應如何處理 Microsoft Foundry 模型配額超出錯誤？</strong></summary>

```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 申請增加配額
# 前往 Azure 入口網站 > 配額 > 申請增加
```
</details>

<details>
<summary><strong>我可以使用自己的數據與 Microsoft Foundry 模型嗎？</strong></summary>

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

請參見 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 範本。
</details>

<details>
<summary><strong>我如何保護 AI 模型端點的安全？</strong></summary>

<strong>最佳實踐</strong>：
1. 使用受管理身份（無需 API 金鑰）
2. 啟用私有端點
3. 配置網絡安全組
4. 實施速率限制
5. 使用 Azure Key Vault 保存機密

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

## 社群及支援

- **Microsoft Foundry Discord**: [#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [問題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在您的編輯器安裝 Azure + Foundry agent 技能

---

**章節導航：**
- **📚 課程首頁**: [AZD 新手入門](../../README.md)
- **📖 目前章節**: 第 2 章 - AI-First 開發
- **⬅️ 上一章**: [第 1 章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群討論，或在倉庫中開啟問題。Azure AI + AZD 社群隨時準備助您成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件乃使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不承擔因使用本翻譯所導致的任何誤解或誤釋之責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
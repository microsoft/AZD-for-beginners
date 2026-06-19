# Microsoft Foundry 與 AZD 的整合

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[第 1 章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

## 概述

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用部署。Microsoft Foundry 提供了建置、部署及管理 AI 應用的完整平台，而 AZD 則簡化了基礎設施與部署流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟統一的 AI 開發平台，包含：

- <strong>模型目錄</strong>：可存取最先進的 AI 模型
- **Prompt Flow**：AI 工作流程的視覺化設計器
- **Microsoft Foundry 入口網站**：整合 AI 應用的開發環境
- <strong>部署選項</strong>：多種託管與擴展方案
- <strong>安全與防護</strong>：內建負責任的 AI 功能

## AZD + Microsoft Foundry：合作更佳

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動入口網站部署 | 自動化、可重複的部署 |
| <strong>基礎設施</strong> | 點擊佈建 | 基礎設施即程式碼 (Bicep) |
| <strong>環境管理</strong> | 單一環境焦點 | 多環境（開發/測試/正式） |
| **CI/CD 整合** | 限制 | 原生支援 GitHub Actions |
| <strong>成本管理</strong> | 基本監控 | 針對環境的成本優化 |

## 前置作業

- 具適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry Models 服務
- 具備 Microsoft Foundry 基本認識

> **目前 AZD 基線版本：** 這些範例已針對 `azd` `1.23.12` 進行測試。AI 代理工作流程使用最新預覽擴充功能版本，開始前請檢查已安裝版本。

## 核心整合模式

### 模式 1：Microsoft Foundry Models 整合

<strong>用例</strong>：部署使用 Microsoft Foundry Models 模型的聊天應用

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

### 模式 2：AI 搜尋 + RAG 整合

<strong>用例</strong>：部署具檢索增強生成 (RAG) 的應用

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

<strong>用例</strong>：文件處理與分析工作流程

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

**開發環境設定：**
```bash
# 為開發而優化成本的設置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費層
```

### 使用 Key Vault 保障設定安全

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

### AZD Foundry 擴充功能

AZD 提供擴充功能，新增專為與 Microsoft Foundry 服務協作的 AI 能力：

```bash
# 安裝 Foundry agents 擴充功能
azd extension install azure.ai.agents

# 安裝微調擴充功能
azd extension install azure.ai.finetune

# 安裝自訂模型擴充功能
azd extension install azure.ai.models

# 列出已安裝的擴充功能
azd extension list --installed

# 檢查當前已安裝的代理擴充版本
azd extension show azure.ai.agents
```

AI 擴充功能仍在快速預覽中。如果指令行為與此處不同，請在排查專案前先升級相關擴充功能。

### 使用 `azd ai` 的代理優先部署

若具代理清單，使用 `azd ai agent init` 來搭建已連接 Foundry Agent Service 的專案：

```bash
# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

近期 `azure.ai.agents` 預覽版本也加入了基於模板的初始化支援。若您正在跟進較新的代理範例，請查閱擴充功能說明以確認可用的旗標。

完整指令參考與旗標請見 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)。

### 單一指令部署

```bash
# 用一個指令部署所有
azd up

# 或逐步部署
azd provision  # 只限基建
azd deploy     # 只限應用程式

# 適用於 azd 1.23.11+ 中長期運行的 AI 應用程式部署
azd deploy --timeout 1800
```

### 針對特定環境部署

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

### 管理身份識別設定

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

## 常見問題排解

### 問題 1：OpenAI 配額超過

**症狀：**
- 部署因配額錯誤失敗
- 應用日誌顯示 429 錯誤

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

### 問題 2：身份驗證失敗

**症狀：**
- 呼叫 AI 服務時發生 401/403 錯誤
- 出現「存取被拒」訊息

**解決方案：**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查受管身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證鑰匙庫存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 部署後模型無法使用
- 特定模型版本出錯

**解決方案：**
```bash
# 按地區列出可用模型
az cognitiveservices model list --location eastus

# 在bicep模板中更新模型版本
# 檢查模型容量需求
```

## 範例模板

### RAG 聊天應用 (Python)

<strong>倉庫</strong>：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure 容器應用 + Azure Blob 儲存

<strong>描述</strong>：最受歡迎的 Azure AI 範例—可投入生產的 RAG 聊天應用，讓你針對自有文件提問。採用 GPT-4.1-mini 作為聊天模型，text-embedding-3-large 作向量嵌入，並使用 Azure AI Search 進行檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 認證及 Application Insights 追蹤。

**快速開始：**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用 (.NET)

<strong>倉庫</strong>：[azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure 容器應用 + Semantic Kernel

<strong>描述</strong>：Python RAG 聊天範例的 .NET/C# 版本。使用 ASP.NET Core Minimal API 和 Blazor WebAssembly 前端構建。包含語音聊天、GPT-4o-mini 視覺支援及配套的 .NET MAUI Blazor Hybrid 桌面/行動用戶端。

**快速開始：**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用 (Java)

<strong>倉庫</strong>：[azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure 容器應用 / AKS + Langchain4J + Azure Cosmos DB

<strong>描述</strong>：使用 Langchain4J 進行 AI 組織的 RAG 聊天 Java 版本範例。支援微服務事件驅動架構、多種搜尋策略（文字、向量、混合）、文件上傳至 Azure 文件智能，並可部署於 Azure 容器應用或 Azure Kubernetes 服務。

**快速開始：**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 使用 Microsoft Foundry 的企業零售助理

<strong>倉庫</strong>：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>：Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure 容器應用 + Azure Cosmos DB

<strong>描述</strong>：端到端的零售 RAG 助理，結合 Microsoft Foundry 與 Prompty。Contoso 戶外零售聊天機器人，回應內容基於產品目錄及客戶訂單資料。展示完整的 GenAIOps 工作流程—以 Prompty 快速草擬，透過 AI 輔助評估器檢驗，並利用 AZD 部署至容器應用。

**快速開始：**
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用

<strong>倉庫</strong>：[contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>：Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure 容器應用

<strong>描述</strong>：示範 AI 代理協作的多代理範例，使用 Prompty。包含研究代理（依賴 Bing Grounding 的 Azure AI Agent Service）、產品代理（Azure AI Search）、撰稿代理與編輯代理，共同產出具深度研究的文章。包含 GitHub Actions 中的 CI/CD 與評估。

**快速開始：**
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天 (JavaScript/TypeScript)

<strong>倉庫</strong>：[serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>：Azure OpenAI + Azure Functions + Azure 靜態 Web 應用 + Azure Cosmos DB NoSQL + LangChain.js

<strong>描述</strong>：完整無伺服器 RAG 聊天應用，使用 LangChain.js 和 Azure Functions API，並搭配 Azure 靜態 Web 應用託管。Azure Cosmos DB 作為向量存儲及聊天紀錄資料庫。支援 Ollama 作為本地開發及零成本測試。

**快速開始：**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與您的資料聊天方案加速器

<strong>倉庫</strong>：[chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure App Service + Azure 文件智能 + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>描述</strong>：企業級 RAG 解決方案加速器，具備管理入口網站，支援文件上傳與管理，提供多種協作者選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，並可選擇 PostgreSQL 或 Cosmos DB 後端。設計作為可自訂的生產 RAG 起點。

**快速開始：**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅遊代理 — 多代理 MCP 協調

<strong>倉庫</strong>：[azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>：Azure OpenAI + Microsoft Foundry + Azure 容器應用 + MCP 伺服器 (.NET, Python, Java, TypeScript)

<strong>描述</strong>：多代理 AI 協調參考應用，採用三種框架（LangChain.js、LlamaIndex.TS、Microsoft Agent Framework）。包含 MCP（模型上下文通訊協定）伺服器，使用四種語言實作，部署為無伺服器 Azure 容器應用，並支援 OpenTelemetry 監控。

**快速開始：**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 起步範本

<strong>倉庫</strong>：[azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>：Azure AI 服務 + Azure OpenAI

<strong>描述</strong>：極簡 Bicep 模板，部署 Azure AI 服務並配置機器學習模型。適合只需部署 Azure AI 基礎設施，無需完整應用堆疊的輕量起點。

**快速開始：**
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：造訪 [Awesome AZD AI 範本館](https://azure.github.io/awesome-azd/?tags=ai)，逾 80 個針對 AI 的 AZD 範本，涵蓋多種語言與應用場景。

## 接下來的步驟

1. <strong>嘗試範例</strong>：選擇符合需求的預建範本開始
2. <strong>自訂調整</strong>：修改基礎設施與應用程式碼
3. <strong>加入監控</strong>：實施完整的可觀察性
4. <strong>優化成本</strong>：調整設定以符合預算
5. <strong>部署安全</strong>：實踐企業級安全模式
6. <strong>擴展生產</strong>：新增多區域與高可用性功能

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry Models 聊天應用 (30 分鐘)
<strong>目標</strong>：部署並測試可投入生產的 AI 聊天應用

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
- [ ] 部署完成，無配額錯誤
- [ ] 可在瀏覽器進入聊天介面
- [ ] 可提問並收到 AI 回答
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清理資源

<strong>預估費用</strong>：30 分鐘測試約 $5-10 美元

### 練習 2：設定多模型部署 (45 分鐘)
<strong>目標</strong>：部署多個不同設定的 AI 模型

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
- [ ] 多模型成功部署
- [ ] 套用不同容量設定
- [ ] 透過 API 存取模型
- [ ] 應用程式可呼叫兩個模型

### 練習 3：實作成本監控 (20 分鐘)
<strong>目標</strong>：建立預算提醒與成本追蹤

```bash
# 加入預算警報到 Bicep
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

# 檢查目前花費
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] Azure 內建立預算提醒
- [ ] 設定電子郵件通知
- [ ] 可在 Azure 入口網站查看成本資料
- [ ] 預算閾值設定得當

## 💡 常見問題

<details>
<summary><strong>如何在開發期間降低 Microsoft Foundry Models 成本？</strong></summary>

1. <strong>使用免費額度</strong>：Microsoft Foundry Models 提供每月 50,000 代幣的免費額度
2. <strong>降低容量</strong>：開發時將容量設定為每分鐘 10 代幣，而非 30 以上
3. **使用 azd down**：未密集開發時釋放資源
4. <strong>快取回應</strong>：對重複查詢實施 Redis 快取
5. <strong>使用提示工程</strong>：透過有效提示減少代幣用量
```bash
# 開發配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型與 OpenAI API 有何不同？</strong></summary>

**Microsoft Foundry 模型**：
- 企業級安全與合規
- 私有網絡整合
- SLA 保證
- 託管身份驗證
- 提供更高額度

**OpenAI API**：
- 更快取得新模型
- 設定更簡單
- 進入門檻較低
- 僅限公共網際網路

對於生產環境應用，**建議使用 Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry 模型配額超出錯誤？</strong></summary>

```bash
# 檢查現有配額
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
<summary><strong>我可以使用自己的資料與 Microsoft Foundry 模型嗎？</strong></summary>

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

參見 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 範本。
</details>

<details>
<summary><strong>我該如何保護 AI 模型端點的安全？</strong></summary>

<strong>最佳做法</strong>：
1. 使用託管身份（無需 API 金鑰）
2. 啟用私有端點
3. 配置網絡安全群組
4. 實作速率限制
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

- **Microsoft Foundry Discord**：[#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**：[Issues 與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**：[官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**：[skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在你的編輯器安裝 Azure + Foundry 代理技能

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者](../../README.md)
- **📖 本章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要協助嗎？** 加入我們的社群討論或在倉庫開啟議題。Azure AI + AZD 社群隨時準備協助你成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
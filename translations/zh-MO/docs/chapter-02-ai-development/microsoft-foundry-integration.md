# Microsoft Foundry 與 AZD 的集成

**章節導航：**
- **📚 課程主頁**：[AZD 入門](../../README.md)
- **📖 目前章節**：第 2 章 - 以 AI 為先的開發
- **⬅️ 前一章節**：[第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一章節**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

## 概覽

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式部署。Microsoft Foundry 提供建置、部署及管理 AI 應用的完整平台，而 AZD 則簡化基礎設施與部署流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是 Microsoft 統一的 AI 開發平台，包含：

- <strong>模型目錄</strong>：可存取最新的 AI 模型
- <strong>提示流程</strong>：AI 工作流的視覺設計器
- **Microsoft Foundry 頁面**：AI 應用整合開發環境
- <strong>部署選項</strong>：多種主機與擴展方案
- <strong>安全與防護</strong>：內建負責任的 AI 功能

## AZD + Microsoft Foundry：雙劍合璧

| 功能 | Microsoft Foundry | AZD 集成優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 手動頁面部署 | 自動化、可重複部署 |
| <strong>基礎設施</strong> | 點擊式配置 | 基礎設施即程式碼（Bicep） |
| <strong>環境管理</strong> | 單一環境聚焦 | 多環境（開發/測試/生產） |
| **CI/CD 集成** | 有限 | 原生 GitHub Actions 支援 |
| <strong>成本管理</strong> | 基本監控 | 環境特定成本最佳化 |

## 先決條件

- 具適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry Models 服務
- 具備 Microsoft Foundry 基本認識

> **目前 AZD 基線：** 這些範例基於 `azd` `1.27.1` 檢視。若用於 AI agent 工作流，請搭配最新的預覽擴充版本，並於開始前確認已安裝版本。

## 核心集成模式

### 模式 1：Microsoft Foundry Models 集成

<strong>使用場景</strong>：部署使用 Microsoft Foundry Models 模型的聊天應用

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

**基礎設施（main.bicep）：**
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

<strong>使用場景</strong>：部署檢索增強生成（RAG）應用

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

### 模式 3：文件智能集成

<strong>使用場景</strong>：文件處理與分析工作流

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

## 部署工作流程

### Foundry 的 AZD 擴充

AZD 提供擴充功能，增添針對 Microsoft Foundry 服務的 AI 專用功能：

```bash
# 安裝 Foundry 代理擴充套件
azd extension install azure.ai.agents

# 安裝微調擴充套件
azd extension install azure.ai.finetune

# 安裝自訂模型擴充套件
azd extension install azure.ai.models

# 列出已安裝的擴充套件
azd extension list --installed

# 檢查目前已安裝的代理擴充套件版本
azd extension show azure.ai.agents
```

AI 擴充仍快速演進中預覽版本。如命令行行為與此不同，請先升級相關擴充再進行專案排錯。

### 使用 `azd ai` 進行 agent 首次部署

若有 agent 清單，使用 `azd ai agent init` 生成與 Foundry Agent 服務連接的專案骨架：

```bash
# 從代理清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

`azure.ai.agents` 的近期預覽版本也加入了以範本為基礎的初始化支援，若您使用較新版 agent 範例，請查閱擴充說明以確認安裝版本的完整功能標誌。

請參閱 [AZD AI CLI 命令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 取得完整命令與標誌說明。

### 單命令部署

```bash
# 用一條命令部署所有東西
azd up

# 或分階段部署
azd provision  # 僅基礎設施
azd deploy     # 僅應用程式

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

### 托管身分設定

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

## 常見問題排錯

### 問題 1：OpenAI 配額超出

**症狀：**
- 部署因配額錯誤失敗
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

### 問題 2：驗證失敗

**症狀：**
- 調用 AI 服務時出現 401/403 錯誤
- 顯示「存取被拒」訊息

**解決方案：**
```bash
# 驗證角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查託管身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證金鑰庫訪問
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 部署中模型不可用
- 特定模型版本失敗

**解決方案：**
```bash
# 按地區列出可用模型
az cognitiveservices model list --location eastus

# 在bicep模板中更新模型版本
# 檢查模型容量要求
```

## 範例範本

### RAG 聊天應用（Python）

<strong>倉庫</strong>：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>描述</strong>：最受歡迎的 Azure AI 範例 — 一個生產就緒的 RAG 聊天應用，允許你針對自有文件提問。使用 GPT-4.1-mini 作為聊天模型，text-embedding-3-large 作為嵌入，Azure AI Search 作為檢索。支持多模態文件、語音輸入/輸出、Microsoft Entra 驗證及 Application Insights 跟蹤。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用（.NET）

<strong>倉庫</strong>：[azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>描述</strong>：Python RAG 聊天應用的 .NET/C# 等效版本。使用 ASP.NET Core Minimal API 及 Blazor WebAssembly 前端構建。包含語音聊天、GPT-4o-mini 視覺支援及搭配 .NET MAUI Blazor Hybrid 的桌機/行動端客戶端。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用（Java）

<strong>倉庫</strong>：[azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>描述</strong>：使用 Langchain4J 進行 AI 協同編排的 Java 版本 RAG 聊天範例。支援微服務事件驅動架構、多重檢索策略（文字、向量、混合）、文件上傳並運用 Azure 文件智能，部署於 Azure Container Apps 或 Azure Kubernetes Service。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry 企業零售助理

<strong>倉庫</strong>：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>：Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>描述</strong>：端對端零售 RAG 助理範例，使用 Microsoft Foundry 與 Prompty。Contoso 戶外用品零售商聊天機器人，基於產品目錄及客戶訂單數據回答。展現完整 GenAIOps 工作流 — 利用 Prompty 原型、AI 協助評估器評價，並透過 AZD 部署至 Container Apps。

<strong>快速開始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用

<strong>倉庫</strong>：[contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>：Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>描述</strong>：多代理範例，展示使用 Prompty 的 AI 代理協調。包含研究代理（Bing Grounding 在 Azure AI Agent Service中）、產品代理（Azure AI Search）、寫作代理以及編輯代理，協同產出具深度調研的文章。包含在 GitHub Actions 中的 CI/CD 及評估。

<strong>快速開始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天（JavaScript/TypeScript）

<strong>倉庫</strong>：[serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>：Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB 用於 NoSQL + LangChain.js

<strong>描述</strong>：完全無伺服器的 RAG 聊天機器人，使用 LangChain.js，API 採用 Azure Functions，並以 Azure Static Web Apps 作為托管。使用 Azure Cosmos DB 作為向量庫及聊天紀錄資料庫。支援使用 Ollama 於本地進行零成本測試與開發。

<strong>快速開始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### 與您的資料聊天解決方案加速器

<strong>倉庫</strong>：[chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>：Azure OpenAI + Azure AI Search + Azure App Service + Azure 文件智能 + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>描述</strong>：企業級 RAG 解決方案加速器，包含文件上傳和管理的管理入口、多種協調器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，後端選擇 PostgreSQL 或 Cosmos DB。設計為可自訂、適合生產的 RAG 起點。

<strong>快速開始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅行代理 — 多代理 MCP 編排

<strong>倉庫</strong>：[azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>：Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP 伺服器（.NET、Python、Java、TypeScript）

<strong>描述</strong>：多代理 AI 編排參考應用，使用三個框架（LangChain.js、LlamaIndex.TS 和 Microsoft Agent Framework）。特色為四種語言實作的 MCP（模型上下文協定）伺服器，部署為無伺服器 Azure Container Apps 並搭配 OpenTelemetry 監控。

<strong>快速開始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI 快速入門

<strong>倉庫</strong>：[azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>：Azure AI 服務 + Azure OpenAI

<strong>描述</strong>：精簡的 Bicep 範本，部署設有配置的 Azure AI 服務機器學習模型。當你只需要 Azure AI 基礎設施而非完整應用時的輕量起點。

<strong>快速開始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：參訪 [Awesome AZD AI 範本庫](https://azure.github.io/awesome-azd/?tags=ai)，提供超過 80 種涵蓋多語言與情境的 AI 專用 AZD 範本。

## 下一步

1. <strong>試用範例</strong>：從符合你需求的預建範本開始
2. <strong>依需求自訂</strong>：修改基礎設施與應用程式碼
3. <strong>新增監控</strong>：實施全面的可觀察性
4. <strong>成本優化</strong>：依預算微調設定
5. <strong>部署安全</strong>：執行企業安全模式
6. <strong>擴展至生產</strong>：加入多區域與高可用性功能

## 🎯 實戰練習

### 練習 1：部署 Microsoft Foundry Models 聊天應用（30 分鐘）
<strong>目標</strong>：部署並測試生產準備的 AI 聊天應用程式

```bash
# 初始化範本
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# 設置環境變數
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
- [ ] 能提問並獲取 AI 支持的回應
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清理資源

<strong>預估費用</strong>：30 分鐘測試約 5-10 美元

### 練習 2：設定多模型部署（45 分鐘）
<strong>目標</strong>：部署多個不同配置的 AI 模型

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
- [ ] 套用不同的容量設定
- [ ] 模型可經由 API 存取
- [ ] 應用程式可呼叫兩個模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>：設置預算警示與成本追蹤

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

# 檢查當前成本
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] 在 Azure 中建立預算警示
- [ ] 設定電子郵件通知
- [ ] 可在 Azure 入口網站查看成本資料
- [ ] 預算門檻設定得當

## 💡 常見問題

<details>
<summary><strong>如何在開發期間降低 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免費層</strong>：Microsoft Foundry Models 提供每月 50,000 代幣免費額度
2. <strong>降低容量</strong>：開發時將容量設定為 10 TPM，而非 30 以上
3. **使用 azd down**：不開發時釋放資源
4. <strong>快取回應</strong>：對重複查詢實施 Redis 快取
5. <strong>使用提示工程</strong>：利用有效提示減少代幣使用量


```bash
# 開發配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry 模型與 OpenAI API 有什麼差別？</strong></summary>

**Microsoft Foundry 模型**：
- 企業級安全與合規性
- 私有網絡整合
- SLA 保證
- 管理身份驗證
- 提供更高配額

**OpenAI API**：
- 更快獲取新模型
- 更簡單的設置
- 較低的入門門檻
- 僅限公共互聯網

生產應用建議使用 **Microsoft Foundry 模型**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry 模型的配額超出錯誤？</strong></summary>

```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同地區
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

請參閱 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 範本。
</details>

<details>
<summary><strong>如何保護 AI 模型端點安全？</strong></summary>

<strong>最佳實踐</strong>：
1. 使用管理身份（無需 API 金鑰）
2. 啟用私有端點
3. 配置網絡安全組
4. 實施速率限制
5. 使用 Azure Key Vault 儲存秘密

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

- **Microsoft Foundry Discord**： [#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**： [議題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**： [官方文件](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**： [skills.sh 上的 Microsoft Foundry 技能](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 使用 `npx skills add microsoft/github-copilot-for-azure` 在您的編輯器安裝 Azure + Foundry 代理技能

---

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章**：[第 1 章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一頁**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**：[第 3 章：設定](../chapter-03-configuration/configuration.md)

**需要幫助嗎？** 加入我們的社群討論或在存放庫開啟議題。Azure AI + AZD 社群隨時準備協助您成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry 與 AZD 的整合

**章節導覽：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 先前章節**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ 下一步**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 下一章**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## 概覽

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署。Microsoft Foundry 提供一個完整的平台來建立、部署和管理 AI 應用程式，而 AZD 則簡化基礎架構與部署流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟統一的 AI 開發平台，包含：

- <strong>模型目錄</strong>：存取最先進的 AI 模型
- **Prompt Flow**：AI 工作流程的視覺化設計器
- **Microsoft Foundry Portal**：整合的 AI 應用程式開發環境
- <strong>部署選項</strong>：多種主機與擴展選項
- <strong>安全性與防護</strong>：內建負責任 AI 的功能

## AZD + Microsoft Foundry：更佳的協同

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|---------|-----------------|------------------------|
| <strong>模型部署</strong> | 透過入口網站手動部署 | 自動化且可重複的部署 |
| <strong>基礎架構</strong> | 以點選方式佈建 | 以程式碼定義基礎架構（Bicep） |
| <strong>環境管理</strong> | 專注於單一環境 | 多環境（dev/staging/prod） |
| **CI/CD 整合** | 有限 | 原生支援 GitHub Actions |
| <strong>成本管理</strong> | 基本監控 | 依環境進行成本最佳化 |

## 前置需求

- 具備適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Microsoft Foundry Models 服務
- 對 Microsoft Foundry 有基本了解

> **目前的 AZD 基線：** 這些範例是以 `azd` `1.23.12` 進行檢視。對於 AI 代理工作流程，請使用目前的預覽擴充套件版本，並在開始前檢查您安裝的版本。

## 核心整合模式

### 模式 1：Microsoft Foundry Models 整合

<strong>使用情境</strong>：部署使用 Microsoft Foundry Models 的聊天應用程式

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

**基礎架構（main.bicep）：**
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

<strong>使用情境</strong>：部署檢索增強生成（RAG）應用程式

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

## 🔧 設定模式

### 環境變數設定

**生產環境設定：**
```bash
# 核心 AI 服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型設定
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# 效能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發環境設定：**
```bash
# 針對開發的成本最佳化設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費方案
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

### AZD 的 Foundry 擴充套件

AZD 提供擴充套件，以新增處理 Microsoft Foundry 服務的 AI 專屬功能：

```bash
# 安裝 Foundry agents 擴充套件
azd extension install azure.ai.agents

# 安裝微調擴充套件
azd extension install azure.ai.finetune

# 安裝自訂模型擴充套件
azd extension install azure.ai.models

# 列出已安裝的擴充套件
azd extension list --installed

# 檢查目前已安裝的代理程式擴充套件版本
azd extension show azure.ai.agents
```

這些 AI 擴充套件在預覽期間仍快速演進。如果某個指令的行為與此處不同，請先升級相關擴充套件，再進行專案的疑難排解。

### 以 Agent 為先的部署（使用 `azd ai`）

如果您有代理清單，請使用 `azd ai agent init` 來腳手架一個連接到 Foundry Agent Service 的專案：

```bash
# 從代理程式清單初始化
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# 部署到 Azure
azd up
```

最近 `azure.ai.agents` 的預覽版本也為 `azd ai agent init` 新增了以範本為基礎的初始化支援。如果您正在參考較新的代理範例，請檢查您安裝版本的擴充套件說明以取得確切可用的旗標。

請參閱 [AZD AI CLI 指令](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 以取得完整指令參考與參數。

### 單一指令部署

```bash
# 用一個指令部署所有內容
azd up

# 或逐步部署
azd provision  # 僅限基礎架構
azd deploy     # 僅限應用程式

# 適用於在 azd 1.23.11+ 上長期執行的 AI 應用部署
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

## 🔐 安全最佳實務

### Managed Identity 設定

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

## 效能最佳化

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

### 自動縮放設定

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
- 部署因配額錯誤而失敗
- 應用程式日誌出現 429 錯誤

**解決方法：**
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

### 問題 2：驗證失敗

**症狀：**
- 呼叫 AI 服務時出現 401/403 錯誤
- 顯示「Access denied」訊息

**解決方法：**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查受管理的身分識別設定
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證 Key Vault 的存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 模型在部署中無法使用
- 特定模型版本部署失敗

**解決方法：**
```bash
# 按地區列出可用的模型
az cognitiveservices model list --location eastus

# 在 Bicep 模板中更新模型版本
# 檢查模型的容量需求
```

## 範例模板

### RAG 聊天應用程式（Python）

<strong>儲存庫</strong>: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

<strong>說明</strong>: 最受歡迎的 Azure AI 範例 — 生產就緒的 RAG 聊天應用，可讓您對自己的文件提出問題。使用 GPT-4.1-mini 作為聊天模型，text-embedding-3-large 作為嵌入模型，並以 Azure AI Search 做為檢索。支援多模態文件、語音輸入/輸出、Microsoft Entra 驗證，以及 Application Insights 追蹤。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG 聊天應用程式（.NET）

<strong>儲存庫</strong>: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

<strong>說明</strong>: Python RAG 聊天範例的 .NET/C# 對等實作。使用 ASP.NET Core Minimal API 與 Blazor WebAssembly 前端構建。包含語音聊天、GPT-4o-mini 視覺支援，以及配套的 .NET MAUI Blazor Hybrid 桌面/行動客戶端。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG 聊天應用程式（Java）

<strong>儲存庫</strong>: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

<strong>說明</strong>: 使用 Langchain4J 做為 AI 協調的 Java 版本 RAG 範例。支援微服務事件驅動架構、多種檢索策略（文字、向量、混合）、使用 Azure Document Intelligence 的文件上傳，並可部署在 Azure Container Apps 或 Azure Kubernetes Service。

<strong>快速開始</strong>：
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### 企業零售 Copilot（使用 Microsoft Foundry）

<strong>儲存庫</strong>: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

<strong>服務</strong>: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

<strong>說明</strong>: 使用 Microsoft Foundry 與 Prompty 的端到端零售 RAG copilot。Contoso Outdoor 零售聊天機器人會以產品目錄與客戶訂單資料為依據來回應。示範完整的 GenAIOps 工作流程 — 使用 Prompty 進行原型設計、用 AI 助力的評估工具進行評估，並透過 AZD 部署到 Container Apps。

<strong>快速開始</strong>：
```bash
azd init --template contoso-chat
azd up
```

### 創意寫作多代理應用程式

<strong>儲存庫</strong>: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

<strong>服務</strong>: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

<strong>說明</strong>: 多代理範例示範與 Prompty 的 AI 代理協調。包含研究代理（Bing Grounding 整合到 Azure AI Agent Service）、產品代理（Azure AI Search）、撰寫代理與編輯代理，共同協作產出具深度研究的文章。包含在 GitHub Actions 中進行評估的 CI/CD。

<strong>快速開始</strong>：
```bash
azd init --template contoso-creative-writer
azd up
```

### 無伺服器 RAG 聊天（JavaScript/TypeScript）

<strong>儲存庫</strong>: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

<strong>服務</strong>: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

<strong>說明</strong>: 完全無伺服器的 RAG 聊天機器人，使用 LangChain.js，API 採用 Azure Functions，托管使用 Azure Static Web Apps。以 Azure Cosmos DB 作為向量儲存與聊天歷史資料庫。支援使用 Ollama 在本機開發以進行零成本測試。

<strong>快速開始</strong>：
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data 解決方案加速器

<strong>儲存庫</strong>: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

<strong>服務</strong>: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

<strong>說明</strong>: 企業級 RAG 解決方案加速器，內含文件上傳/管理的管理入口網站、多種協調器選項（Semantic Kernel、LangChain、Prompt Flow）、語音轉文字、Microsoft Teams 整合，並可選擇 PostgreSQL 或 Cosmos DB 作為後端。設計為可自訂的生產 RAG 起始點。

<strong>快速開始</strong>：
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI 旅遊代理 — 多代理 MCP 編排

<strong>儲存庫</strong>: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

<strong>服務</strong>: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

<strong>說明</strong>: 以三個框架（LangChain.js、LlamaIndex.TS、Microsoft Agent Framework）做多代理 AI 編排的參考應用。特色為四種語言的 MCP（Model Context Protocol）伺服器，作為無伺服器 Azure Container Apps 部署，並搭配 OpenTelemetry 監控。

<strong>快速開始</strong>：
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

<strong>儲存庫</strong>: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

<strong>服務</strong>: Azure AI Services + Azure OpenAI

<strong>說明</strong>: 簡潔的 Bicep 範本，可部署已設定機器學習模型的 Azure AI 服務。當您只需要部署 Azure AI 基礎架構而不需要完整應用程式堆疊時，這是輕量的起點。

<strong>快速開始</strong>：
```bash
azd init --template azd-ai-starter
azd up
```

> <strong>瀏覽更多範本</strong>：造訪 [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) 以取得超過 80 個針對 AI 的 AZD 範本，涵蓋多種語言與情境。

## 下一步

1. <strong>嘗試範例</strong>：從符合您使用情境的預建範本開始
2. <strong>依需求自訂</strong>：修改基礎架構與應用程式程式碼
3. <strong>加入監控</strong>：實作完整的可觀測性
4. <strong>優化成本</strong>：為您的預算微調設定
5. <strong>保護您的部署</strong>：實作企業級安全模式
6. <strong>擴展到生產環境</strong>：加入多區域與高可用性功能

## 🎯 實作練習

### 練習 1：部署 Microsoft Foundry Models 聊天應用（30 分鐘）
<strong>目標</strong>：部署並測試一個可用於生產的 AI 聊天應用程式

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
- [ ] 可在瀏覽器存取聊天介面
- [ ] 能提出問題並取得 AI 驅動的回應
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清理資源

<strong>預估成本</strong>：測試 30 分鐘約 $5-10

### 練習 2：設定多模型部署（45 分鐘）
<strong>目標</strong>：部署多個具有不同配置的 AI 模型

```bash
# 建立自訂的 Bicep 組態
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
- [ ] 套用不同的容量設定
- [ ] 模型可透過 API 存取
- [ ] 能從應用程式呼叫所有模型

### 練習 3：實作成本監控（20 分鐘）
<strong>目標</strong>：建立預算警示與成本追蹤

```bash
# 在 Bicep 中加入預算警示
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

**成功標準：**
- [ ] 在 Azure 中建立預算警示
- [ ] 設定電子郵件通知
- [ ] 可在 Azure 入口網站檢視成本資料
- [ ] 適當設定預算閾值

## 💡 常見問答

<details>
<summary><strong>如何在開發期間降低 Microsoft Foundry Models 的成本？</strong></summary>

1. <strong>使用免費方案</strong>：Microsoft Foundry Models 每月提供 50,000 代幣的免費額度
2. <strong>降低容量</strong>：開發環境將容量設為 10 TPM，而非 30 以上
3. **使用 azd down**：在非開發期間解除配置資源
4. <strong>快取回應</strong>：為重複查詢實作 Redis 快取
5. <strong>使用提示工程</strong>：使用有效率的提示以減少代幣使用

</details>
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
- 使用 Managed Identity 驗證（無需 API 金鑰）
- 可提供較高配額

**OpenAI API**:
- 較快取得新模型
- 設定更簡單
- 進入門檻較低
- 僅限公用網際網路

對於生產環境應用，**建議使用 Microsoft Foundry Models**。
</details>

<details>
<summary><strong>如何處理 Microsoft Foundry Models 配額超過錯誤？</strong></summary>

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
# 前往 Azure 入口網站 > 配額 > 申請提高配額
```
</details>

<details>
<summary><strong>我可以在 Microsoft Foundry Models 中使用自己的資料嗎？</strong></summary>

可以！對於 RAG（Retrieval Augmented Generation，檢索增強生成），請使用 **Azure AI Search**：

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

<strong>最佳實務</strong>:
1. 使用 Managed Identity（無 API 金鑰）
2. 啟用 Private Endpoints
3. 設定網路安全群組
4. 實作速率限制
5. 使用 Azure Key Vault 儲存機密

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
- **Agent Skills**: [在 skills.sh 的 Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - 在你的編輯器中安裝 Azure + Foundry agent skills，使用 `npx skills add microsoft/github-copilot-for-azure`

---

**章節導覽：**
- **📚 課程首頁**: [AZD 初學者指南](../../README.md)
- **📖 目前章節**: 第 2 章 - AI 優先開發
- **⬅️ 上一章**: [第 1 章：你的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一頁**: [AI 模型部署](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：設定](../chapter-03-configuration/configuration.md)

需要幫助嗎？加入我們的社群討論或在本程式庫開啟議題。Azure AI + AZD 社群在此協助你成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
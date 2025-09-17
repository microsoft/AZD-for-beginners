<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T13:05:14+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "hk"
}
-->
# Azure AI Foundry 與 AZD 的整合

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章節**：[第 1 章：你的第一個專案](../getting-started/first-project.md)
- **➡️ 下一步**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：配置](../getting-started/configuration.md)

## 概述

本指南展示如何將 Azure AI Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署流程。Azure AI Foundry 提供一個全面的平台，用於構建、部署和管理 AI 應用程式，而 AZD 則簡化了基礎架構和部署過程。

## 什麼是 Azure AI Foundry？

Azure AI Foundry 是 Microsoft 的統一 AI 開發平台，包含以下功能：

- **模型目錄**：提供最先進的 AI 模型
- **Prompt Flow**：AI 工作流程的可視化設計工具
- **AI Foundry Portal**：AI 應用程式的整合開發環境
- **部署選項**：多種託管和擴展選項
- **安全性**：內建負責任 AI 的功能

## AZD + Azure AI Foundry：更強大的組合

| 功能 | Azure AI Foundry | AZD 整合優勢 |
|------|------------------|--------------|
| **模型部署** | 手動透過 Portal 部署 | 自動化、可重複的部署 |
| **基礎架構** | 點擊式配置 | 基於代碼的基礎架構 (Bicep) |
| **環境管理** | 單一環境專注 | 多環境（開發/測試/生產） |
| **CI/CD 整合** | 限制性 | 原生支援 GitHub Actions |
| **成本管理** | 基本監控 | 環境特定的成本優化 |

## 先決條件

- 擁有適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Azure OpenAI 服務
- 基本了解 Azure AI Foundry

## 核心整合模式

### 模式 1：Azure OpenAI 整合

**使用案例**：使用 Azure OpenAI 模型部署聊天應用程式

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

**基礎架構 (main.bicep)：**
```bicep
// Azure OpenAI Account
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

### 模式 2：AI 搜索 + RAG 整合

**使用案例**：部署檢索增強生成 (RAG) 應用程式

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

**使用案例**：文件處理和分析工作流程

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

### 環境變數設置

**生產配置：**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發配置：**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### 使用 Key Vault 進行安全配置

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

### 單指令部署

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### 環境特定部署

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
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

### 設置 Managed Identity

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

### 網絡安全

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

## 常見問題排查

### 問題 1：OpenAI 配額超出

**症狀：**
- 部署因配額錯誤失敗
- 應用程式日誌中出現 429 錯誤

**解決方案：**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題 2：身份驗證失敗

**症狀：**
- 調用 AI 服務時出現 401/403 錯誤
- 顯示「拒絕訪問」訊息

**解決方案：**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 部署中無法使用模型
- 特定模型版本部署失敗

**解決方案：**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## 範例模板

### 基本聊天應用程式

**存儲庫**：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**服務**：Azure OpenAI + Cognitive Search + App Service

**快速開始**：
```bash
azd init --template azure-search-openai-demo
azd up
```

### 文件處理管道

**存儲庫**：[ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**服務**：Document Intelligence + Storage + Functions

**快速開始**：
```bash
azd init --template ai-document-processing
azd up
```

### RAG 的企業聊天

**存儲庫**：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**服務**：Azure OpenAI + Search + Container Apps + Cosmos DB

**快速開始**：
```bash
azd init --template contoso-chat
azd up
```

## 下一步

1. **嘗試範例**：從符合您使用案例的預建模板開始
2. **根據需求自訂**：修改基礎架構和應用程式代碼
3. **添加監控**：實施全面的可觀測性
4. **優化成本**：根據預算微調配置
5. **保護部署**：實施企業級安全模式
6. **擴展至生產環境**：添加多區域和高可用性功能

## 社群與支援

- **Azure AI Foundry Discord**：[#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**：[問題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**：[官方文件](https://learn.microsoft.com/azure/ai-studio/)

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章節**：[第 1 章：你的第一個專案](../getting-started/first-project.md)
- **➡️ 下一步**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：配置](../getting-started/configuration.md)

**需要幫助？** 加入我們的社群討論或在存儲庫中開啟問題。Azure AI + AZD 社群致力於幫助您成功！

---

**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋概不負責。
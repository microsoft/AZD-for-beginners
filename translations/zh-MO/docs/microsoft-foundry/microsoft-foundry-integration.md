# Microsoft Foundry 與 AZD 的整合

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章節**：[第 1 章：您的第一個專案](../getting-started/first-project.md)
- **➡️ 下一步**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：配置](../getting-started/configuration.md)

## 概述

本指南展示如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署流程。Microsoft Foundry 提供一個全面的平台，用於建構、部署及管理 AI 應用程式，而 AZD 則簡化了基礎架構及部署過程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是 Microsoft 的統一 AI 開發平台，包含以下功能：

- **模型目錄**：存取最先進的 AI 模型
- **Prompt Flow**：AI 工作流程的視覺化設計工具
- **AI Foundry Portal**：AI 應用程式的整合開發環境
- **部署選項**：多種主機及擴展選項
- **安全性與保障**：內建負責任 AI 的功能

## AZD + Microsoft Foundry：更強大的組合

| 功能 | Microsoft Foundry | AZD 整合優勢 |
|------|-------------------|--------------|
| **模型部署** | 手動透過入口部署 | 自動化、可重複的部署 |
| **基礎架構** | 點擊式配置 | 基礎架構即程式碼 (Bicep) |
| **環境管理** | 單一環境專注 | 多環境（開發/測試/生產） |
| **CI/CD 整合** | 限制性 | 原生支援 GitHub Actions |
| **成本管理** | 基本監控 | 環境特定的成本優化 |

## 先決條件

- 擁有適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Azure OpenAI 服務
- 基本了解 Microsoft Foundry

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

**使用案例**：文件處理及分析工作流程

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
# 核心人工智能服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型配置
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# 性能設置
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發配置：**
```bash
# 為開發設置成本優化
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # 免費層級
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
# 使用一個指令部署所有內容
azd up

# 或逐步部署
azd provision  # 僅基礎設施
azd deploy     # 僅應用程式
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

### 設置受管理的身份

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
- 顯示「拒絕存取」訊息

**解決方案：**
```bash
# 驗證角色分配
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查管理的身份配置
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證密鑰保管庫訪問
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀：**
- 部署中無法使用模型
- 特定模型版本部署失敗

**解決方案：**
```bash
# 列出各地區可用的模型
az cognitiveservices model list --location eastus

# 更新 bicep 模板中的模型版本
# 檢查模型容量需求
```

## 範例模板

### 基本聊天應用程式

**存儲庫**：[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**服務**：Azure OpenAI + 認知搜索 + 應用服務

**快速開始：**
```bash
azd init --template azure-search-openai-demo
azd up
```

### 文件處理管道

**存儲庫**：[ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**服務**：文件智能 + 存儲 + 函數

**快速開始：**
```bash
azd init --template ai-document-processing
azd up
```

### 使用 RAG 的企業聊天

**存儲庫**：[contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**服務**：Azure OpenAI + 搜索 + 容器應用 + Cosmos DB

**快速開始：**
```bash
azd init --template contoso-chat
azd up
```

## 下一步

1. **嘗試範例**：從符合您使用案例的預建模板開始
2. **根據需求自訂**：修改基礎架構及應用程式程式碼
3. **添加監控**：實施全面的可觀察性
4. **優化成本**：根據預算微調配置
5. **保護您的部署**：實施企業安全模式
6. **擴展至生產環境**：添加多區域及高可用性功能

## 🎯 實作練習

### 練習 1：部署 Azure OpenAI 聊天應用程式 (30 分鐘)
**目標**：部署並測試一個生產就緒的 AI 聊天應用程式

```bash
# 初始化模板
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

# 監控人工智能操作
azd monitor

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 部署無配額錯誤完成
- [ ] 可在瀏覽器中存取聊天介面
- [ ] 可提問並獲得 AI 驅動的回應
- [ ] Application Insights 顯示遙測數據
- [ ] 成功清理資源

**預估成本**：測試 30 分鐘約 $5-10

### 練習 2：配置多模型部署 (45 分鐘)
**目標**：部署多個 AI 模型並設置不同配置

```bash
# 建立自訂 Bicep 配置
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

**成功標準：**
- [ ] 多個模型成功部署
- [ ] 應用不同的容量設置
- [ ] 模型可透過 API 存取
- [ ] 可從應用程式呼叫兩個模型

### 練習 3：實施成本監控 (20 分鐘)
**目標**：設置預算警報及成本追蹤

```bash
# 添加預算警報到Bicep
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

# 檢查當前成本
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**成功標準：**
- [ ] 在 Azure 中創建預算警報
- [ ] 配置電子郵件通知
- [ ] 可在 Azure Portal 中查看成本數據
- [ ] 適當設置預算門檻

## 💡 常見問題

<details>
<summary><strong>如何在開發期間降低 Azure OpenAI 成本？</strong></summary>

1. **使用免費層**：Azure OpenAI 提供每月 50,000 個免費 token
2. **降低容量**：將容量設置為 10 TPM 而非 30+ 用於開發
3. **使用 azd down**：在非開發期間釋放資源
4. **快取回應**：對重複查詢實施 Redis 快取
5. **使用 Prompt Engineering**：透過高效提示減少 token 使用量

```bash
# 開發配置
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI 與 OpenAI API 有什麼不同？</strong></summary>

**Azure OpenAI**：
- 企業安全性及合規性
- 私有網絡整合
- SLA 保證
- 受管理身份驗證
- 提供更高的配額

**OpenAI API**：
- 更快存取新模型
- 設置更簡單
- 更低的進入門檻
- 僅限公共網絡

對於生產應用程式，**建議使用 Azure OpenAI**。
</details>

<details>
<summary><strong>如何處理 Azure OpenAI 配額超出錯誤？</strong></summary>

```bash
# 檢查當前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同地區
azd env set AZURE_LOCATION westus2
azd up

# 暫時減少容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 請求增加配額
# 前往 Azure Portal > 配額 > 請求增加
```
</details>

<details>
<summary><strong>我可以使用自己的數據與 Azure OpenAI 嗎？</strong></summary>

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

請參考 [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 模板。
</details>

<details>
<summary><strong>如何保護 AI 模型端點？</strong></summary>

**最佳實踐**：
1. 使用受管理身份（無需 API 金鑰）
2. 啟用私有端點
3. 配置網絡安全群組
4. 實施速率限制
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

- **Microsoft Foundry Discord**：[#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**：[問題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**：[官方文件](https://learn.microsoft.com/azure/ai-studio/)

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 本章節**：第 2 章 - AI 優先開發
- **⬅️ 上一章節**：[第 1 章：您的第一個專案](../getting-started/first-project.md)
- **➡️ 下一步**：[AI 模型部署](ai-model-deployment.md)
- **🚀 下一章節**：[第 3 章：配置](../getting-started/configuration.md)

**需要幫助？** 加入我們的社群討論或在存儲庫中開啟問題。Azure AI + AZD 社群隨時為您提供協助！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
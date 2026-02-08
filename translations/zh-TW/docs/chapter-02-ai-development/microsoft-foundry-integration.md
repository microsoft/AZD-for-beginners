# Microsoft Foundry 與 AZD 的整合

**章節導覽:**
- **📚 課程首頁**: [AZD 新手入門](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [第 1 章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一節**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：組態](../chapter-03-configuration/configuration.md)

## 概觀

本指南示範如何將 Microsoft Foundry 服務與 Azure Developer CLI (AZD) 整合，以簡化 AI 應用程式的部署流程。Microsoft Foundry 提供一個完整的平台來建立、部署與管理 AI 應用程式，而 AZD 則簡化了基礎設施與部署的流程。

## 什麼是 Microsoft Foundry？

Microsoft Foundry 是微軟統一的 AI 開發平台，包含：

- **模型目錄**：存取最先進的 AI 模型
- **Prompt Flow**：AI 工作流程的視覺化設計器
- **AI Foundry 入口網站**：整合的 AI 應用程式開發環境
- **部署選項**：多種託管與擴展選項
- **安全與保護**：內建負責任 AI 的功能

## AZD + Microsoft Foundry：更好的組合

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | 手動入口網站部署 | 自動化且可重複的部署 |
| **Infrastructure** | 點擊式佈建 | 基礎設施即程式碼 (Bicep) |
| **Environment Management** | 單一環境為主 | 多環境（開發/測試/正式） |
| **CI/CD Integration** | 有限 | 原生支援 GitHub Actions |
| **Cost Management** | 基本監控 | 依環境的成本優化 |

## 先決條件

- 具有適當權限的 Azure 訂閱
- 已安裝 Azure Developer CLI
- 可存取 Azure OpenAI 服務
- 對 Microsoft Foundry 有基本了解

## 核心整合模式

### 模式 1：Azure OpenAI 整合

**使用情境**：使用 Azure OpenAI 模型部署聊天應用程式

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

### 模式 2：AI Search + RAG 整合

**使用情境**：部署檢索增強生成 (RAG) 應用程式

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

**使用情境**：文件處理與分析工作流程

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

## 🔧 組態模式

### 環境變數設定

**正式環境設定:**
```bash
# 核心 AI 服務
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# 模型設定
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# 效能設定
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**開發環境設定:**
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

### 單一指令部署

```bash
# 用一個指令部署所有內容
azd up

# 或逐步部署
azd provision  # 僅限基礎設施
azd deploy     # 僅限應用程式
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

**症狀:**
- 部署失敗並出現配額錯誤
- 應用程式日誌出現 429 錯誤

**解決方法:**
```bash
# 檢查目前配額使用情況
az cognitiveservices usage list --location eastus

# 嘗試其他區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### 問題 2：身分驗證失敗

**症狀:**
- 呼叫 AI 服務時出現 401/403 錯誤
- 顯示「Access denied」訊息

**解決方法:**
```bash
# 驗證角色指派
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# 檢查受管身分識別設定
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# 驗證 Key Vault 存取權限
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### 問題 3：模型部署問題

**症狀:**
- 模型在部署中不可用
- 特定模型版本失敗

**解決方法:**
```bash
# 按區域列出可用模型
az cognitiveservices model list --location eastus

# 在 bicep 範本中更新模型版本
# 檢查模型容量需求
```

## 範例範本

### 基本聊天應用程式

**儲存庫**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**服務**: Azure OpenAI + Cognitive Search + App Service

**快速開始**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### 文件處理管線

**儲存庫**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**服務**: Document Intelligence + Storage + Functions

**快速開始**:
```bash
azd init --template ai-document-processing
azd up
```

### 企業級 RAG 聊天

**儲存庫**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**服務**: Azure OpenAI + Search + Container Apps + Cosmos DB

**快速開始**:
```bash
azd init --template contoso-chat
azd up
```

## 後續步驟

1. **試用範例**：從與您使用案例相符的預建範本開始
2. **依需求自訂**：修改基礎設施與應用程式程式碼
3. **加入監控**：實作完整的可觀測性
4. **優化成本**：為預算微調設定
5. **保護部署**：實作企業級安全模式
6. **擴展到生產**：加入多區域與高可用性功能

## 🎯 實作練習

### 練習 1：部署 Azure OpenAI 聊天應用程式（30 分鐘）
**目標**：部署並測試一個可用於生產的 AI 聊天應用程式

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

# 監控 AI 作業
azd monitor

# 清理
azd down --force --purge
```

**成功標準：**
- [ ] 部署完成且沒有配額錯誤
- [ ] 可以在瀏覽器中存取聊天介面
- [ ] 可以提出問題並獲得 AI 回應
- [ ] Application Insights 顯示遙測資料
- [ ] 成功清除資源

**預估費用**: $5-10 for 30 minutes of testing

### 練習 2：設定多模型部署（45 分鐘）
**目標**：部署多個具有不同設定的 AI 模型

```bash
# 建立自訂的 Bicep 組態
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
- [ ] 套用不同的容量設定
- [ ] 模型可透過 API 存取
- [ ] 應用程式可同時呼叫多個模型

### 練習 3：實作成本監控（20 分鐘）
**目標**：設定預算警示與成本追蹤

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

**成功標準：**
- [ ] 在 Azure 建立預算警示
- [ ] 設定電子郵件通知
- [ ] 可在 Azure 入口網站查看成本資料
- [ ] 適當設定預算門檻

## 💡 常見問答

<details>
<summary><strong>如何在開發期間減少 Azure OpenAI 成本？</strong></summary>

1. **使用免費額度**：Azure OpenAI 提供每月 50,000 tokens 的免費額度
2. **降低容量**：開發環境將容量設為 10 TPM，而非 30+ 
3. **使用 azd down**：在不開發時解除配置資源
4. **快取回應**：對重複查詢實作 Redis 快取
5. **使用 Prompt Engineering**：透過有效的提示減少 token 使用量

```bash
# 開發設定
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI 與 OpenAI API 有何不同？</strong></summary>

**Azure OpenAI**：
- 企業級的安全性與合規性
- 私有網路整合
- SLA 保證
- 受管識別驗證
- 可提供較高的配額

**OpenAI API**：
- 更快取得新模型
- 設定較簡單
- 較低的進入門檻
- 僅透過公開網際網路

對於生產應用，**建議在生產應用中使用 Azure OpenAI**。
</details>

<details>
<summary><strong>我該如何處理 Azure OpenAI 配額超出錯誤？</strong></summary>

```bash
# 檢查目前配額
az cognitiveservices usage list --location eastus2

# 嘗試不同區域
azd env set AZURE_LOCATION westus2
azd up

# 暫時降低容量
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# 請求提高配額
# 前往 Azure 入口網站 > 配額 > 申請提高配額
```
</details>

<details>
<summary><strong>我可以將自己的資料與 Azure OpenAI 一起使用嗎？</strong></summary>

可以！使用 **Azure AI Search** 來做 RAG（檢索增強生成）：

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
<summary><strong>我該如何保護 AI 模型端點？</strong></summary>

**最佳實務**：
1. 使用 Managed Identity（不使用 API 金鑰）
2. 啟用 Private Endpoints
3. 設定網路安全群組
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

- **Microsoft Foundry Discord**: [#Azure 頻道](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [議題與討論](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [官方文件](https://learn.microsoft.com/azure/ai-studio/)

---

**章節導覽:**
- **📚 課程首頁**: [AZD 新手入門](../../README.md)
- **📖 目前章節**: 第 2 章 - 以 AI 為先的開發
- **⬅️ 上一章**: [第 1 章：您的第一個專案](../chapter-01-foundation/first-project.md)
- **➡️ 下一節**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 下一章**: [第 3 章：組態](../chapter-03-configuration/configuration.md)

**需要協助嗎？** 加入我們的社群討論或在儲存庫中開啟議題。Azure AI + AZD 社群在此協助您成功！

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不精確之處。原始語言文件應視為具權威性的版本。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或曲解負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
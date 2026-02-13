# 認證模式與受管理身分識別

⏱️ **預估時間**: 45-60 分鐘 | 💰 **費用影響**: 免費（無額外費用） | ⭐ **複雜度**: 中階

**📚 學習路徑:**
- ← 上一節: [組態管理](configuration.md) - 管理環境變數與機密
- 🎯 **你在這裡**: 認證與安全（受管理身分識別、Key Vault、安全模式）
- → 下一節: [第一個專案](first-project.md) - 建立你的第一個 AZD 應用程式
- 🏠 [課程首頁](../../README.md)

---

## 本課你會學到什麼

完成本課後，你將：
- 理解 Azure 的認證模式（金鑰、連線字串、受管理身分識別）
- 實作 **受管理身分識別** 以達成無密碼認證
- 整合 **Azure Key Vault** 以保護機密
- 為 AZD 部署設定 **基於角色的存取控制 (RBAC)**
- 在 Container Apps 與 Azure 服務中套用安全最佳實務
- 將基於金鑰的認證遷移到基於身分的認證

## 為什麼受管理身分識別很重要

### 問題：傳統認證

**在使用受管理身分識別之前：**
```javascript
// ❌ 安全風險：程式碼中硬編碼的機密資訊
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**問題：**
- 🔴 **機密外洩**：出現在程式碼、設定檔、環境變數中
- 🔴 **憑證輪換** 需修改程式碼並重新部署
- 🔴 **稽核噩夢** — 誰在何時存取了什麼？
- 🔴 **擴散** — 機密散落於多個系統
- 🔴 **合規風險** — 未通過安全稽核

### 解決方案：受管理身分識別

**在使用受管理身分識別之後：**
```javascript
// ✅ 安全：程式碼中沒有任何機密
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure 會自動處理身份驗證
);
```

**好處：**
- ✅ **程式碼或設定檔中無機密**
- ✅ **自動輪換** — 由 Azure 處理
- ✅ **完整稽核軌跡**（Azure AD 日誌）
- ✅ **集中化安全管理** — 在 Azure 入口網站管理
- ✅ **符合合規性** — 符合安全標準

**類比**：傳統認證就像為不同門攜帶多把實體鑰匙。受管理身分識別像是一張安全識別證，會依據你的身分自動授權—不會有鑰匙遺失、被複製或需要輪換的問題。

---

## 架構總覽

### 使用受管理身分識別的認證流程

```mermaid
sequenceDiagram
    participant App as 你的應用程式<br/>(容器應用程式)
    participant MI as 受管身分識別<br/>(Azure AD)
    participant KV as 金鑰保管庫
    participant Storage as Azure 儲存體
    participant DB as Azure SQL 資料庫
    
    App->>MI: 請求存取權杖<br/>(自動)
    MI->>MI: 驗證身分<br/>(不需要密碼)
    MI-->>App: 回傳存取權杖<br/>(有效 1 小時)
    
    App->>KV: 取得機密<br/>(使用權杖)
    KV->>KV: 檢查 RBAC 權限
    KV-->>App: 回傳機密值
    
    App->>Storage: 上傳 Blob<br/>(使用權杖)
    Storage->>Storage: 檢查 RBAC 權限
    Storage-->>App: 成功
    
    App->>DB: 查詢資料<br/>(使用權杖)
    DB->>DB: 檢查 SQL 權限
    DB-->>App: 回傳結果
    
    Note over App,DB: 所有驗證無需密碼！
```
### 受管理身分識別的類型

```mermaid
graph TB
    MI[受管理的身分識別]
    SystemAssigned[系統指派的身分識別]
    UserAssigned[使用者指派的身分識別]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[生命週期與資源綁定]
    SystemAssigned --> SA2[自動建立/刪除]
    SystemAssigned --> SA3[最適合單一資源]
    
    UserAssigned --> UA1[獨立生命週期]
    UserAssigned --> UA2[手動建立/刪除]
    UserAssigned --> UA3[可跨資源共用]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| 特性 | 系統指派 | 使用者指派 |
|---------|----------------|---------------|
| **生命週期** | 與資源綁定 | 獨立 |
| **建立** | 隨資源自動建立 | 手動建立 |
| **刪除** | 隨資源刪除 | 資源刪除後仍保留 |
| **共用** | 僅限一個資源 | 多個資源 |
| **使用情境** | 簡單情境 | 複雜多資源情境 |
| **AZD 預設** | ✅ 推薦 | 選用 |

---

## 先決條件

### 需要的工具

前面的課程你應已安裝以下工具：

```bash
# 驗證 Azure 開發者 CLI
azd version
# ✅ 預期: azd 版本 1.0.0 或更高

# 驗證 Azure CLI
az --version
# ✅ 預期: azure-cli 2.50.0 或更高
```

### Azure 要求

- 有效的 Azure 訂閱
- 權限以執行：
  - 建立受管理身分識別
  - 指派 RBAC 角色
  - 建立 Key Vault 資源
  - 部署 Container Apps

### 知識先備

你應已完成：
- [安裝指南](installation.md) - AZD 設定
- [AZD 基礎](azd-basics.md) - 核心概念
- [組態管理](configuration.md) - 環境變數

---

## 課程 1：理解認證模式

### 模式 1：連線字串（舊式 — 避免使用）

**運作方式：**
```bash
# 連線字串包含認證資訊
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**問題：**
- ❌ 機密會出現在環境變數中
- ❌ 會出現在部署系統的日誌中
- ❌ 難以輪換
- ❌ 無存取稽核軌跡

**何時使用：** 僅限本機開發，切勿用於生產環境。

---

### 模式 2：Key Vault 參考（較佳）

**運作方式：**
```bicep
// Store secret in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'mykv'
  properties: {
    enableRbacAuthorization: true
  }
}

// Reference in Container App
env: [
  {
    name: 'STORAGE_KEY'
    secretRef: 'storage-key'  // References Key Vault
  }
]
```

**好處：**
- ✅ 機密安全地儲存在 Key Vault
- ✅ 機密集中管理
- ✅ 可在不修改程式碼的情況下輪換

**限制：**
- ⚠️ 仍使用金鑰/密碼
- ⚠️ 需要管理 Key Vault 的存取權

**何時使用：** 作為從連線字串過渡到受管理身分識別的中間步驟。

---

### 模式 3：受管理身分識別（最佳實務）

**運作方式：**
```bicep
// Enable managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Automatically creates identity
  }
}

// Grant permissions
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: storageAccount
  properties: {
    roleDefinitionId: storageBlobDataContributorRole
    principalId: containerApp.identity.principalId
  }
}
```

**應用程式程式碼：**
```javascript
// 毋須任何秘密！
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**好處：**
- ✅ 程式碼/設定檔中無機密
- ✅ 自動憑證輪換
- ✅ 完整稽核軌跡
- ✅ 基於 RBAC 的權限
- ✅ 符合合規性

**何時使用：** 在生產環境中一律使用。

---

## 課程 2：使用 AZD 實作受管理身分識別

### 逐步實作

讓我們建立一個安全的 Container App，使用受管理身分識別存取 Azure Storage 與 Key Vault。

### 專案結構

```
secure-app/
├── azure.yaml                 # AZD configuration
├── infra/
│   ├── main.bicep            # Main infrastructure
│   ├── core/
│   │   ├── identity.bicep    # Managed identity setup
│   │   ├── keyvault.bicep    # Key Vault configuration
│   │   └── storage.bicep     # Storage with RBAC
│   └── app/
│       └── container-app.bicep
└── src/
    ├── app.js                # Application code
    ├── package.json
    └── Dockerfile
```

### 1. 設定 AZD (azure.yaml)

```yaml
name: secure-app
metadata:
  template: secure-app@1.0.0

services:
  api:
    project: ./src
    language: js
    host: containerapp

# Enable managed identity (AZD handles this automatically)
```

### 2. 基礎設施：啟用受管理身分識別

**檔案：`infra/main.bicep`**

```bicep
targetScope = 'subscription'

param environmentName string
param location string = 'eastus'

var tags = { 'azd-env-name': environmentName }

// Resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

// Storage Account
module storage './core/storage.bicep' = {
  name: 'storage'
  scope: rg
  params: {
    name: 'st${uniqueString(rg.id)}'
    location: location
    tags: tags
  }
}

// Key Vault
module keyVault './core/keyvault.bicep' = {
  name: 'keyvault'
  scope: rg
  params: {
    name: 'kv-${uniqueString(rg.id)}'
    location: location
    tags: tags
  }
}

// Container App with Managed Identity
module containerApp './app/container-app.bicep' = {
  name: 'container-app'
  scope: rg
  params: {
    name: 'ca-${environmentName}'
    location: location
    tags: tags
    storageAccountName: storage.outputs.name
    keyVaultName: keyVault.outputs.name
  }
}

// Grant Container App access to Storage
module storageRoleAssignment './core/role-assignment.bicep' = {
  name: 'storage-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'  // Storage Blob Data Contributor
    targetResourceId: storage.outputs.id
  }
}

// Grant Container App access to Key Vault
module kvRoleAssignment './core/role-assignment.bicep' = {
  name: 'kv-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: '4633458b-17de-408a-b874-0445c86b69e6'  // Key Vault Secrets User
    targetResourceId: keyVault.outputs.id
  }
}

// Outputs
output AZURE_STORAGE_ACCOUNT_NAME string = storage.outputs.name
output AZURE_KEY_VAULT_NAME string = keyVault.outputs.name
output APP_URL string = containerApp.outputs.url
```

### 3. 使用系統指派身分的 Container App

**檔案：`infra/app/container-app.bicep`**

```bicep
param name string
param location string
param tags object = {}
param storageAccountName string
param keyVaultName string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'  // 🔑 Enable managed identity
  }
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [
        {
          name: 'api'
          image: 'myregistry.azurecr.io/api:latest'
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          env: [
            {
              name: 'AZURE_STORAGE_ACCOUNT_NAME'
              value: storageAccountName
            }
            {
              name: 'AZURE_KEY_VAULT_NAME'
              value: keyVaultName
            }
            // 🔑 No secrets - managed identity handles authentication!
          ]
        }
      ]
    }
  }
}

// Output the identity for RBAC assignments
output identityPrincipalId string = containerApp.identity.principalId
output id string = containerApp.id
output url string = 'https://${containerApp.properties.configuration.ingress.fqdn}'
```

### 4. RBAC 角色指派模組

**檔案：`infra/core/role-assignment.bicep`**

```bicep
param principalId string
param roleDefinitionId string  // Azure built-in role ID
param targetResourceId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(principalId, roleDefinitionId, targetResourceId)
  scope: resourceId('Microsoft.Resources/resourceGroups', resourceGroup().name)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
    principalType: 'ServicePrincipal'
  }
}

output id string = roleAssignment.id
```

### 5. 使用受管理身分識別的應用程式程式碼

**檔案：`src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 初始化憑證（使用託管身分識別會自動運作）
const credential = new DefaultAzureCredential();

// Azure 儲存體設定
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // 不需要金鑰！
);

// Key Vault 設定
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // 不需要金鑰！
);

// 健康檢查
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// 將檔案上傳至 Blob 儲存體
app.post('/upload', async (req, res) => {
  try {
    const containerClient = blobServiceClient.getContainerClient('uploads');
    await containerClient.createIfNotExists();
    
    const blobName = `file-${Date.now()}.txt`;
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);
    
    await blockBlobClient.upload('Hello from managed identity!', 30);
    
    res.json({
      success: true,
      blobName: blobName,
      message: 'File uploaded using managed identity!'
    });
  } catch (error) {
    console.error('Upload error:', error);
    res.status(500).json({ error: error.message });
  }
});

// 從 Key Vault 取得機密
app.get('/secret/:name', async (req, res) => {
  try {
    const secretName = req.params.name;
    const secret = await secretClient.getSecret(secretName);
    
    res.json({
      name: secretName,
      value: secret.value,
      message: 'Secret retrieved using managed identity!'
    });
  } catch (error) {
    console.error('Secret error:', error);
    res.status(500).json({ error: error.message });
  }
});

// 列出 Blob 容器（示範讀取權限）
app.get('/containers', async (req, res) => {
  try {
    const containers = [];
    for await (const container of blobServiceClient.listContainers()) {
      containers.push(container.name);
    }
    
    res.json({
      containers: containers,
      count: containers.length,
      message: 'Containers listed using managed identity!'
    });
  } catch (error) {
    console.error('List error:', error);
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Secure API listening on port ${PORT}`);
  console.log('Authentication: Managed Identity (passwordless)');
});
```

**檔案：`src/package.json`**

```json
{
  "name": "secure-app",
  "version": "1.0.0",
  "dependencies": {
    "express": "^4.18.2",
    "@azure/identity": "^4.0.0",
    "@azure/storage-blob": "^12.17.0",
    "@azure/keyvault-secrets": "^4.7.0"
  },
  "scripts": {
    "start": "node app.js"
  }
}
```

### 6. 部署與測試

```bash
# 初始化 AZD 環境
azd init

# 部署基礎架構和應用程式
azd up

# 取得應用程式的 URL
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# 測試健康檢查
curl $APP_URL/health
```

**✅ 預期輸出：**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**測試 blob 上傳：**
```bash
curl -X POST $APP_URL/upload
```

**✅ 預期輸出：**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**測試容器列出清單：**
```bash
curl $APP_URL/containers
```

**✅ 預期輸出：**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## 常見的 Azure RBAC 角色

### 受管理身分識別的內建角色 ID

| 服務 | 角色名稱 | 角色 ID | 權限 |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | 讀取 blob 與容器 |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | 讀取、寫入、刪除 blob |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | 讀取、寫入、刪除佇列訊息 |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | 讀取機密 |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | 讀取、寫入、刪除機密 |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | 讀取 Cosmos DB 資料 |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | 讀取、寫入 Cosmos DB 資料 |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | 管理 SQL 資料庫 |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | 傳送、接收並管理訊息 |

### 如何查找角色 ID

```bash
# 列出所有內建角色
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# 搜尋特定角色
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# 取得角色詳細資料
az role definition list --name "Storage Blob Data Contributor"
```

---

## 實作練習

### 練習 1：為既有應用啟用受管理身分識別 ⭐⭐（中等）

**目標**：為既有 Container App 部署新增受管理身分識別

**情境**：你有一個使用連線字串的 Container App，將其轉換為使用受管理身分識別。

**起始點**：具有以下設定的 Container App：

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**步驟**：

1. **在 Bicep 中啟用受管理身分識別：**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **授予 Storage 存取權：**

```bicep
// Get storage account reference
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

// Assign role
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(containerApp.id, 'ba92f5b4-2d11-453d-a403-e96b0029c9fe', storageAccount.id)
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: containerApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **更新應用程式程式碼：**

**之前（連線字串）：**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**之後（受管理身分識別）：**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **更新環境變數：**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **部署並測試：**

```bash
# 重新部署
azd up

# 測試它是否仍然運作
curl https://myapp.azurecontainerapps.io/upload
```

**✅ 成功標準：**
- ✅ 應用程式成功部署且無錯誤
- ✅ Storage 操作正常（上傳、列舉、下載）
- ✅ 環境變數中沒有連線字串
- ✅ 可在 Azure 入口網站的 "Identity" 頁面看到身分識別

**驗證：**

```bash
# 檢查是否已啟用受管理身分識別
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 預期: "SystemAssigned"

# 檢查角色指派
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ 預期: 顯示 "Storage Blob Data Contributor" 角色
```

**所需時間**：20-30 分鐘

---

### 練習 2：使用使用者指派身分識別的多服務存取 ⭐⭐⭐（進階）

**目標**：建立一個可在多個 Container App 之間共用的使用者指派身分識別

**情境**：你有 3 個微服務，皆需存取相同的 Storage 帳戶與 Key Vault。

**步驟**：

1. **建立使用者指派身分識別：**

**檔案：`infra/core/identity.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource userAssignedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: name
  location: location
  tags: tags
}

output id string = userAssignedIdentity.id
output principalId string = userAssignedIdentity.properties.principalId
output clientId string = userAssignedIdentity.properties.clientId
```

2. **將角色指派給使用者指派身分識別：**

```bicep
// In main.bicep
module userIdentity './core/identity.bicep' = {
  name: 'user-identity'
  scope: rg
  params: {
    name: 'id-${environmentName}'
    location: location
    tags: tags
  }
}

// Grant Storage access
resource storageRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(userIdentity.outputs.principalId, 'storage-contributor')
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}

// Grant Key Vault access
resource kvRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(userIdentity.outputs.principalId, 'kv-secrets-user')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **將身分識別指派給多個 Container App：**

```bicep
resource apiGateway 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-gateway'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}

resource productService 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'product-service'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}

resource orderService 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'order-service'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}
```

4. **應用程式程式碼（所有服務使用相同模式）：**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// 對於使用者指派的身分識別，請指定用戶端識別碼
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // 使用者指派身分識別的用戶端識別碼
);

// 或使用 DefaultAzureCredential（自動偵測）
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **部署並驗證：**

```bash
azd up

# 測試所有服務是否能存取儲存空間
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ 成功標準：**
- ✅ 一個身分識別可被 3 個服務共用
- ✅ 所有服務均可存取 Storage 與 Key Vault
- ✅ 刪除單一服務時身分識別仍然保留
- ✅ 權限集中管理

**使用者指派身分識別的好處：**
- 可管理的單一身分識別
- 服務間權限一致
- 刪除服務後仍保留
- 適用於複雜架構

**所需時間**：30-40 分鐘

---

### 練習 3：實作 Key Vault 機密輪換 ⭐⭐⭐（進階）

**目標**：將第三方 API 金鑰儲存在 Key Vault 並使用受管理身分識別存取

**情境**：你的應用需要呼叫需要 API 金鑰的外部 API（如 OpenAI、Stripe、SendGrid）。

**步驟**：

1. **建立使用 RBAC 的 Key Vault：**

**檔案：`infra/core/keyvault.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Allow Container App to read secrets
output id string = keyVault.id
output name string = keyVault.name
output uri string = keyVault.properties.vaultUri
```

2. **在 Key Vault 中儲存機密：**

```bash
# 取得金鑰保管庫名稱
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# 儲存第三方 API 金鑰
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-xxxxxxxxxxxxx"

az keyvault secret set \
  --vault-name $KV_NAME \
  --name "Stripe-ApiKey" \
  --value "sk_live_xxxxxxxxxxxxx"

az keyvault secret set \
  --vault-name $KV_NAME \
  --name "SendGrid-ApiKey" \
  --value "SG.xxxxxxxxxxxxx"
```

3. **用於擷取機密的應用程式程式碼：**

**檔案：`src/config.js`**

```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { SecretClient } = require('@azure/keyvault-secrets');

class Config {
  constructor() {
    this.credential = new DefaultAzureCredential();
    this.secretClient = new SecretClient(
      `https://${process.env.AZURE_KEY_VAULT_NAME}.vault.azure.net`,
      this.credential
    );
    this.cache = {};
  }

  async getSecret(secretName) {
    // 先檢查快取
    if (this.cache[secretName]) {
      return this.cache[secretName];
    }

    try {
      const secret = await this.secretClient.getSecret(secretName);
      this.cache[secretName] = secret.value;
      console.log(`✅ Retrieved secret: ${secretName}`);
      return secret.value;
    } catch (error) {
      console.error(`❌ Failed to get secret ${secretName}:`, error.message);
      throw error;
    }
  }

  async getOpenAIKey() {
    return this.getSecret('OpenAI-ApiKey');
  }

  async getStripeKey() {
    return this.getSecret('Stripe-ApiKey');
  }

  async getSendGridKey() {
    return this.getSecret('SendGrid-ApiKey');
  }
}

module.exports = new Config();
```

4. **在應用中使用機密：**

**檔案：`src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// 使用來自金鑰保管庫的金鑰初始化 OpenAI
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// 在啟動時呼叫
initializeServices().catch(console.error);

app.post('/chat', async (req, res) => {
  try {
    const completion = await openaiClient.chat.completions.create({
      model: 'gpt-4',
      messages: [{ role: 'user', content: 'Hello!' }]
    });
    
    res.json({
      response: completion.choices[0].message.content,
      authentication: 'Key from Key Vault via Managed Identity'
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(3000, () => {
  console.log('Secure API with Key Vault integration running');
});
```

5. **部署並測試：**

```bash
azd up

# 測試 API 金鑰是否可用
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ 成功標準：**
- ✅ 程式碼或環境變數中沒有 API 金鑰
- ✅ 應用程式可從 Key Vault 擷取金鑰
- ✅ 第三方 API 正常運作
- ✅ 可在不修改程式碼的情況下輪換金鑰

**輪換機密：**

```bash
# 更新 Key Vault 中的機密
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# 重新啟動應用程式以套用新金鑰
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**所需時間**：25-35 分鐘

---

## 知識檢查點

### 1. 認證模式 ✓

測試你的理解：

- [ ] **Q1**：三種主要的認證模式為何？ 
  - **A**：連線字串（舊式）、Key Vault 參考（過渡）、受管理身分識別（最佳）

- [ ] **Q2**：為何受管理身分識別優於連線字串？
  - **A**：程式碼中無機密、自動輪換、完整稽核軌跡、RBAC 權限

- [ ] **Q3**：何時會使用使用者指派身分識別而非系統指派？
  - **A**：當要在多個資源間共用身分識別，或身分識別的生命週期需獨立於資源生命週期時

**動手驗證：**
```bash
# 檢查你的應用程式使用哪一種類型的身份
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# 列出該身份的所有角色指派
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC 與權限 ✓

測試你的理解：

- [ ] **Q1**：`Storage Blob Data Contributor` 的角色 ID 為何？
  - **A**：`ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**：`Key Vault Secrets User` 提供哪些權限？
  - **A**：對機密的唯讀存取（不可建立、更新或刪除）

- [ ] **Q3**：如何授權 Container App 存取 Azure SQL？
  - **A**：指派 `SQL DB Contributor` 角色或為 SQL 設定 Azure AD 認證

**動手驗證：**
```bash
# 尋找特定角色
az role definition list --name "Storage Blob Data Contributor"

# 檢查哪些角色已指派給你的身份
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault 整合 ✓

測試你的理解：
- [ ] **Q1**: 如何為 Key Vault 啟用 RBAC 而不是使用存取原則？
  - **A**: 在 Bicep 中設定 `enableRbacAuthorization: true`

- [ ] **Q2**: 哪個 Azure SDK 程式庫處理 Managed Identity 驗證？
  - **A**: `@azure/identity` 與 `DefaultAzureCredential` 類別

- [ ] **Q3**: Key Vault 的 secrets 在快取中會保存多久？
  - **A**: 視應用程式而定；請自行實作快取策略

**實作驗證：**
```bash
# 測試對 Key Vault 的存取
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# 檢查 RBAC 是否已啟用
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ 預期：true
```

---

## 安全最佳做法

### ✅ 建議：

1. **在生產環境中始終使用受管理身分識別**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **使用最少權限的 RBAC 角色**
   - 盡可能使用 "Reader" 角色
   - 除非必要，避免使用 "Owner" 或 "Contributor"

3. **將第三方金鑰存放於 Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **啟用稽核日誌**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **為 開發/暫存/生產 使用不同的身分**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **定期輪換秘密**
   - 為 Key Vault 的秘密設定到期日
   - 使用 Azure Functions 自動化輪換

### ❌ 切勿：

1. **切勿將秘密硬編碼於程式碼**
   ```javascript
   // ❌ 不好
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **不要在生產環境使用連線字串**
   ```javascript
   // ❌ 不好
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **不要授予過多權限**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **不要在日誌中記錄秘密**
   ```javascript
   // ❌ 唔好
   console.log('API Key:', apiKey);
   
   // ✅ 好
   console.log('API Key retrieved successfully');
   ```

5. **不要在各環境間共用生產身分**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## 疑難排解指南

### 問題：存取 Azure Storage 時出現 "Unauthorized"

**症狀：**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**診斷：**

```bash
# 檢查是否已啟用受管理身分識別
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 預期： "SystemAssigned" 或 "UserAssigned"

# 檢查角色指派
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# 預期：應該會看到 "Storage Blob Data Contributor" 或類似角色
```

**解決方案：**

1. **授予正確的 RBAC 角色：**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **等待變更傳播（可能需要 5-10 分鐘）：**
```bash
# 檢查角色指派狀態
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **確認應用程式程式碼使用正確的認證：**
```javascript
// 請確保您正在使用 DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### 問題：Key Vault 存取被拒

**症狀：**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**診斷：**

```bash
# 檢查 Key Vault 的 RBAC 是否已啟用
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ 預期：true

# 檢查角色指派
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**解決方案：**

1. **在 Key Vault 上啟用 RBAC：**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **授予 Key Vault Secrets User 角色：**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### 問題：DefaultAzureCredential 在本機失敗

**症狀：**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**診斷：**

```bash
# 檢查你是否已登入
az account show

# 檢查 Azure CLI 的驗證
az ad signed-in-user show
```

**解決方案：**

1. **登入 Azure CLI：**
```bash
az login
```

2. **設定 Azure 訂閱：**
```bash
az account set --subscription "Your Subscription Name"
```

3. **在本地開發時，使用環境變數：**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **或在本機使用不同的憑證：**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// 於本地開發時使用 AzureCliCredential
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### 問題：角色指派傳播時間過長

**症狀：**
- 角色已成功指派
- 仍然收到 403 錯誤
- 存取不穩定（有時能使用，有時不能）

**說明：**
Azure 的 RBAC 變更可能需要 5-10 分鐘才能全域傳播。

**解決方法：**

```bash
# 請稍候並重試
echo "Waiting for RBAC propagation..."
sleep 300  # 請等候5分鐘

# 測試存取
curl https://myapp.azurecontainerapps.io/upload

# 如果仍然失敗，請重新啟動應用程式
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## 成本考量

### Managed Identity 成本

| 資源 | 成本 |
|----------|------|
| **Managed Identity** | 🆓 **免費** - 不收費 |
| **RBAC 角色指派** | 🆓 **免費** - 不收費 |
| **Azure AD 令牌請求** | 🆓 **免費** - 已包含 |
| **Key Vault 操作** | $0.03 per 10,000 operations |
| **Key Vault 儲存** | $0.024 per secret per month |

**Managed Identity 節省成本方式：**
- ✅ 免除為服務對服務驗證而進行的 Key Vault 操作
- ✅ 減少資安事件（沒有洩漏的憑證）
- ✅ 降低營運負擔（不需手動輪換）

**示例成本比較（每月）：**

| 情境 | 連線字串 | Managed Identity | 節省 |
|----------|-------------------|-----------------|---------|
| 小型應用（1M 請求） | ~$50 (Key Vault + ops) | ~$0 | $50/月 |
| 中型應用（10M 請求） | ~$200 | ~$0 | $200/月 |
| 大型應用（100M 請求） | ~$1,500 | ~$0 | $1,500/月 |

---

## 瞭解更多

### 官方文件
- [Azure 管理身分識別](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK 文件
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### 本課程的下一步
- ← 上一節： [設定管理](configuration.md)
- → 下一節： [第一個專案](first-project.md)
- 🏠 [課程首頁](../../README.md)

### 相關範例
- [Azure OpenAI 聊天範例](../../../../examples/azure-openai-chat) - 使用 Managed Identity 存取 Azure OpenAI
- [微服務範例](../../../../examples/microservices) - 多服務驗證模式

---

## 摘要

**你已學到：**
- ✅ 三種驗證模式（連線字串、Key Vault、Managed Identity）
- ✅ 如何在 AZD 中啟用及設定 Managed Identity
- ✅ Azure 服務的 RBAC 角色指派
- ✅ 使用 Key Vault 管理第三方秘密
- ✅ 使用者指派與系統指派身分
- ✅ 安全最佳實務與疑難排解

**重點摘要：**
1. **在生產環境中始終使用 Managed Identity** - 零機密，自動輪換
2. **使用最少權限的 RBAC 角色** - 只授予必要權限
3. **將第三方金鑰儲存在 Key Vault** - 集中式秘密管理
4. **在各環境中使用獨立身分** - 開發、暫存、與生產分隔
5. **啟用稽核記錄** - 追蹤誰存取了什麼

**接下來的步驟：**
1. 完成上方的實作練習
2. 將既有應用從連線字串遷移至 Managed Identity
3. 從一開始就以安全為核心建立你的第一個 AZD 專案： [第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
免責聲明：
本文件經由 AI 翻譯服務 Co-op Translator (https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。對於因使用此翻譯而導致的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Authentication Patterns and Managed Identity

⏱️ **預計時間**: 45-60 分鐘 | 💰 **成本影響**: 免費（無額外費用） | ⭐ **複雜度**: 中級

**📚 學習路線:**
- ← 上一節: [Configuration Management](configuration.md) - 管理環境變數與祕密
- 🎯 **你在這裡**: Authentication & Security (Managed Identity, Key Vault, 安全模式)
- → 下一節: [First Project](first-project.md) - 建立你的第一個 AZD 應用
- 🏠 [Course Home](../../README.md)

---

## 你將學到的內容

完成本課程後，你將會：
- 了解 Azure 驗證模式（金鑰、連線字串、Managed Identity）
- 實作 **Managed Identity** 以達成無密碼驗證
- 使用 **Azure Key Vault** 整合來保護祕密
- 為 AZD 部署設定 **基於角色的存取控制 (RBAC)**
- 在 Container Apps 與 Azure 服務中套用安全最佳實務
- 將基於金鑰的驗證遷移到基於識別的驗證

## 為何 Managed Identity 重要

### 問題：傳統驗證

**在採用 Managed Identity 之前：**
```javascript
// ❌ 安全風險：在程式碼中硬編碼的機密
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**問題：**
- 🔴 **祕密暴露** 在程式碼、設定檔、環境變數中
- 🔴 **憑證輪換** 需要修改程式碼並重新部署
- 🔴 **稽核惡夢** - 誰在何時存取了什麼？
- 🔴 **散佈** - 祕密分散在多個系統中
- 🔴 **合規風險** - 未通過安全稽核

### 解決方案：Managed Identity

**採用 Managed Identity 之後：**
```javascript
// ✅ 安全：程式碼中沒有任何機密資料
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure 會自動處理身份驗證
);
```

**好處：**
- ✅ **程式碼或設定中零祕密**
- ✅ **自動輪換** - 由 Azure 處理
- ✅ **完整稽核紀錄** 在 Azure AD 日誌中
- ✅ **集中化安全管理** - 可在 Azure Portal 管理
- ✅ **符合合規性** - 達到安全標準

**類比**：傳統驗證就像為不同的門攜帶多把實體鑰匙。Managed Identity 就像有一張安全識別證，會根據你的身分自動授權——不用擔心鑰匙遺失、複製或輪換。

---

## 架構概覽

### 使用 Managed Identity 的驗證流程

```mermaid
sequenceDiagram
    participant App as 你的應用程式<br/>(容器應用程式)
    participant MI as 託管身分識別<br/>(Azure AD)
    participant KV as 金鑰保管庫
    participant Storage as Azure 儲存體
    participant DB as Azure SQL 資料庫
    
    App->>MI: 要求存取權杖<br/>(自動)
    MI->>MI: 驗證身分<br/>(不需密碼)
    MI-->>App: 回傳權杖<br/>(有效 1 小時)
    
    App->>KV: 取得機密<br/>(使用權杖)
    KV->>KV: 檢查 RBAC 權限
    KV-->>App: 回傳機密值
    
    App->>Storage: 上傳 Blob<br/>(使用權杖)
    Storage->>Storage: 檢查 RBAC 權限
    Storage-->>App: 成功
    
    App->>DB: 查詢資料<br/>(使用權杖)
    DB->>DB: 檢查 SQL 權限
    DB-->>App: 回傳結果
    
    Note over App,DB: 所有驗證均無需密碼！
```
### Managed Identity 的類型

```mermaid
graph TB
    MI[受管身分識別]
    SystemAssigned[系統指派身分識別]
    UserAssigned[使用者指派身分識別]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[生命週期與資源綁定]
    SystemAssigned --> SA2[自動建立/刪除]
    SystemAssigned --> SA3[最適合單一資源]
    
    UserAssigned --> UA1[生命週期獨立]
    UserAssigned --> UA2[手動建立/刪除]
    UserAssigned --> UA3[可跨資源共用]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Feature | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Lifecycle** | 與資源綁定 | 獨立存在 |
| **Creation** | 隨資源自動建立 | 需手動建立 |
| **Deletion** | 隨資源刪除 | 資源刪除後仍保留 |
| **Sharing** | 僅限單一資源 | 可供多個資源共用 |
| **Use Case** | 簡單情境 | 複雜多資源情境 |
| **AZD Default** | ✅ 推薦 | 選用 |

---

## 前置需求

### 所需工具

你應該已經從之前的課程安裝了這些：

```bash
# 驗證 Azure Developer CLI
azd version
# ✅ 預期：azd 版本 1.0.0 或更高

# 驗證 Azure CLI
az --version
# ✅ 預期：azure-cli 2.50.0 或更高
```

### Azure 要求

- 有效的 Azure 訂閱
- 權限可執行：
  - 建立 managed identities
  - 指派 RBAC 角色
  - 建立 Key Vault 資源
  - 部署 Container Apps

### 需具備的知識

你應該已完成：
- [Installation Guide](installation.md) - AZD 設定
- [AZD Basics](azd-basics.md) - 核心概念
- [Configuration Management](configuration.md) - 環境變數

---

## 課程 1：了解驗證模式

### 模式 1：連線字串（舊式 - 避免）

**運作方式：**
```bash
# 連線字串包含認證資訊
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**問題：**
- ❌ 祕密在環境變數中可見
- ❌ 在部署系統中被記錄
- ❌ 難以輪換
- ❌ 沒有存取稽核記錄

**何時使用：** 僅用於本地開發，切勿用於生產環境。

---

### 模式 2：Key Vault 參照（較佳）

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

**優點：**
- ✅ 祕密安全地存放在 Key Vault
- ✅ 集中化祕密管理
- ✅ 輪換不需修改程式碼

**限制：**
- ⚠️ 仍然使用金鑰/密碼
- ⚠️ 需要管理 Key Vault 的存取權

**何時使用：** 作為從連線字串到 Managed Identity 的過渡步驟。

---

### 模式 3：Managed Identity（最佳實踐）

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
- ✅ 程式碼/設定中零祕密
- ✅ 憑證自動輪換
- ✅ 完整稽核紀錄
- ✅ 基於 RBAC 的權限控管
- ✅ 符合合規需求

**何時使用：** 在生產應用程式中始終使用。

---

## 課程 2：在 AZD 中實作 Managed Identity

### 逐步實作

讓我們建立一個使用 Managed Identity 存取 Azure Storage 與 Key Vault 的安全 Container App。

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

### 2. 基礎架構：啟用 Managed Identity

**File: `infra/main.bicep`**

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

### 3. 具有系統指派識別的 Container App

**File: `infra/app/container-app.bicep`**

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

**File: `infra/core/role-assignment.bicep`**

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

### 5. 使用 Managed Identity 的應用程式程式碼

**File: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 初始化憑證（使用受管理身分時會自動生效）
const credential = new DefaultAzureCredential();

// 設定 Azure 儲存體
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // 不需要金鑰！
);

// 設定 Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // 不需要金鑰！
);

// 健康檢查
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// 將檔案上載到 Blob 儲存體
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

**File: `src/package.json`**

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

# 部署基礎架構及應用程式
azd up

# 取得應用程式網址
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

**測試容器列出：**
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

### Managed Identity 的內建角色 ID

| Service | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | 讀取 blobs 與 containers |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | 讀取、寫入、刪除 blobs |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | 讀取、寫入、刪除佇列訊息 |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | 讀取祕密 |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | 讀取、寫入、刪除祕密 |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | 讀取 Cosmos DB 資料 |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | 讀取、寫入 Cosmos DB 資料 |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | 管理 SQL 資料庫 |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | 傳送、接收、管理訊息 |

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

### 練習 1：為現有應用啟用 Managed Identity ⭐⭐（中等）

**目標**：為現有的 Container App 部署新增 Managed Identity

**情境**：你有一個使用連線字串的 Container App。將它轉換為 Managed Identity。

**起始點**：具有此設定的 Container App：

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

1. **在 Bicep 中啟用 managed identity：**

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

**之後（Managed Identity）：**
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

5. **部署與測試：**

```bash
# 重新部署
azd up

# 測試它仍然運作
curl https://myapp.azurecontainerapps.io/upload
```

**✅ 成功準則：**
- ✅ 應用部署無錯誤
- ✅ Storage 操作正常（上傳、列出、下載）
- ✅ 環境變數中沒有連線字串
- ✅ 在 Azure Portal 的「Identity」頁面可見該識別

**驗證：**

```bash
# 檢查受管理的身份識別是否已啟用
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

**時間**：20-30 分鐘

---

### 練習 2：使用使用者指派識別的多服務存取 ⭐⭐⭐（進階）

**目標**：建立一個可被多個 Container Apps 共用的使用者指派識別

**情境**：你有 3 個微服務都需要存取同一個 Storage 帳戶與 Key Vault。

**步驟**：

1. **建立使用者指派識別：**

**File: `infra/core/identity.bicep`**

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

2. **將角色指派給使用者指派識別：**

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

3. **將識別指派給多個 Container Apps：**

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

// 對於使用者指派的身分，請指定用戶端 ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // 使用者指派身分的用戶端 ID
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

# 測試所有服務是否可以存取儲存空間
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ 成功準則：**
- ✅ 一個識別共用於 3 個服務
- ✅ 所有服務都能存取 Storage 與 Key Vault
- ✅ 刪除其中一個服務時，識別仍然保留
- ✅ 權限管理集中化

**使用者指派識別的好處：**
- 單一識別便於管理
- 服務間權限一致
- 可在服務刪除後保留
- 適合複雜架構

**時間**：30-40 分鐘

---

### 練習 3：實作 Key Vault 密鑰輪換 ⭐⭐⭐（進階）

**目標**：在 Key Vault 存放第三方 API 金鑰，並使用 Managed Identity 存取

**情境**：你的應用需要呼叫第三方 API（OpenAI、Stripe、SendGrid），需要 API 金鑰。

**步驟**：

1. **建立使用 RBAC 的 Key Vault：**

**File: `infra/core/keyvault.bicep`**

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

2. **在 Key Vault 中儲存祕密：**

```bash
# 取得 Key Vault 名稱
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

3. **應用程式程式碼以擷取祕密：**

**File: `src/config.js`**

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

4. **在應用程式中使用祕密：**

**File: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// 使用 Key Vault 的金鑰初始化 OpenAI
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

# 測試 API 金鑰能否運作
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ 成功準則：**
- ✅ 程式碼或環境變數中沒有 API 金鑰
- ✅ 應用能從 Key Vault 擷取金鑰
- ✅ 第三方 API 正常運作
- ✅ 可在不修改程式碼的情況下輪換金鑰

**輪換祕密：**

```bash
# 在 Key Vault 中更新機密
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# 重新啟動應用程式以套用新金鑰
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**時間**：25-35 分鐘

---

## 知識檢核點

### 1. 驗證模式 ✓

測試你的理解：

- [ ] **Q1**: 三種主要的驗證模式是什麼？ 
  - **A**: 連線字串（舊式）、Key Vault 參照（過渡）、Managed Identity（最佳）

- [ ] **Q2**: 為什麼 Managed Identity 比連線字串更好？
  - **A**: 程式碼中沒有祕密、自動輪換、完整稽核紀錄、基於 RBAC 的權限

- [ ] **Q3**: 何時會使用使用者指派識別而不是系統指派？
  - **A**: 當需要在多個資源間共用識別，或識別的生命週期需獨立於資源時

**實作驗證：**
```bash
# 檢查你的應用程式使用的是哪種類型的身份
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

- [ ] **Q1**: "Storage Blob Data Contributor" 的角色 ID 是什麼？
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: "Key Vault Secrets User" 提供什麼權限？
  - **A**: 祕密的唯讀存取（無法建立、更新或刪除）

- [ ] **Q3**: 如何授權 Container App 存取 Azure SQL？
  - **A**: 指派 "SQL DB Contributor" 角色或為 SQL 設定 Azure AD 認證

**實作驗證：**
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
- [ ] **Q1**: 如何為 Key Vault 啟用 RBAC，而不是使用存取原則？
  - **A**: 在 Bicep 設定 `enableRbacAuthorization: true`

- [ ] **Q2**: 哪個 Azure SDK 函式庫處理受管身分的驗證？
  - **A**: 使用 `@azure/identity` 的 `DefaultAzureCredential` 類別

- [ ] **Q3**: Key Vault 的 secret 在快取中會保留多久？
  - **A**: 視應用程式而定；請實作自己的快取策略

**實作驗證：**
```bash
# 測試 Key Vault 存取
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

## 安全最佳實務

### ✅ 建議做：

1. **在生產環境始終使用受管身分**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **使用最小權限的 RBAC 角色**
   - 盡可能使用「Reader」角色
   - 除非必要，避免使用「Owner」或「Contributor」

3. **將第三方金鑰存放於 Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **啟用稽核記錄**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **為開發/暫存/生產使用不同的身分**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **定期輪換機密**
   - 為 Key Vault 的機密設定到期日
   - 使用 Azure Functions 自動化輪換

### ❌ 不建議：

1. **切勿將機密寫死在程式碼中**
   ```javascript
   // ❌ 唔好
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **不要在生產環境使用連線字串**
   ```javascript
   // ❌ 差
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **不要授予過多權限**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **不要在日誌中紀錄機密**
   ```javascript
   // ❌ 唔好
   console.log('API Key:', apiKey);
   
   // ✅ 好
   console.log('API Key retrieved successfully');
   ```

5. **不要於不同環境間共用生產身分**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## 疑難排解指南

### 問題: "Unauthorized" 在存取 Azure Storage 時

**症狀：**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**診斷：**

```bash
# 檢查是否已啟用託管身分識別
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 預期： "SystemAssigned" 或 "UserAssigned"

# 檢查角色指派
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# 預期：應該會看到 "Storage Blob Data Contributor" 或相似的角色
```

**解決方法：**

1. **授予正確的 RBAC 角色：**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **等待變更傳播（可能需 5-10 分鐘）：**
```bash
# 檢查角色分配狀態
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **確認應用程式程式碼使用正確的憑證：**
```javascript
// 請確保你正在使用 DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### 問題: Key Vault 存取被拒

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

**解決方法：**

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

### 問題: DefaultAzureCredential 在本地失敗

**症狀：**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**診斷：**

```bash
# 檢查你是否已登入
az account show

# 檢查 Azure CLI 的認證狀態
az ad signed-in-user show
```

**解決方法：**

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

4. **或在本地使用不同的憑證：**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// 本地開發時使用 AzureCliCredential
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### 問題: 角色指派傳播花太長時間

**症狀：**
- 角色已成功指派
- 仍然收到 403 錯誤
- 存取間歇性 (有時能用，有時不能)

**說明：**
Azure RBAC 的變更可能需要 5-10 分鐘在全球傳播。

**解決方案：**

```bash
# 等候並重試
echo "Waiting for RBAC propagation..."
sleep 300  # 等候 5 分鐘

# 測試存取
curl https://myapp.azurecontainerapps.io/upload

# 如果仍然失敗，重新啟動應用程式
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## 成本考量

### 受管身分成本

| 資源 | 成本 |
|----------|------|
| **受管身分** | 🆓 **免費** - 不收費 |
| **RBAC 角色指派** | 🆓 **免費** - 不收費 |
| **Azure AD 令牌請求** | 🆓 **免費** - 包含在內 |
| **Key Vault 操作** | $0.03 每 10,000 次操作 |
| **Key Vault 儲存** | 每個機密每月 $0.024 |

**受管身分可節省成本：**
- ✅ 省去用於服務間驗證的 Key Vault 操作
- ✅ 減少安全事件（無外洩憑證）
- ✅ 降低營運負擔（無需手動輪換）

**範例成本比較（每月）：**

| 情境 | 連線字串 | 受管身分 | 節省 |
|----------|-------------------|-----------------|---------|
| 小型應用（1M 請求） | 約 $50（Key Vault + 操作） | 約 $0 | 每月 $50 |
| 中型應用（10M 請求） | 約 $200 | 約 $0 | 每月 $200 |
| 大型應用（100M 請求） | 約 $1,500 | 約 $0 | 每月 $1,500 |

---

## 深入了解

### 官方文件
- [Azure 受管身分](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK 文件
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### 課程下一步
- ← 上一節: [設定管理](configuration.md)
- → 下一節: [第一個專案](first-project.md)
- 🏠 [課程首頁](../../README.md)

### 相關範例
- [Azure OpenAI Chat Example](../../../../examples/azure-openai-chat) - 使用受管身分來存取 Azure OpenAI
- [Microservices Example](../../../../examples/microservices) - 多服務驗證模式

---

## 摘要

**你已學會：**
- ✅ 三種驗證模式（連線字串、Key Vault、受管身分）
- ✅ 如何在 AZD 中啟用及設定受管身分
- ✅ Azure 服務的 RBAC 角色指派
- ✅ Key Vault 與第三方機密的整合
- ✅ 使用者指派身分與系統指派身分
- ✅ 安全最佳實務與疑難排解

**重點帶走：**
1. **在生產環境始終使用受管身分** - 無需機密，自動輪換
2. **使用最小權限的 RBAC 角色** - 僅授予必要權限
3. **將第三方金鑰存放於 Key Vault** - 集中管理機密
4. **為各環境分離身分** - 開發、暫存、生產隔離
5. **啟用稽核記錄** - 追蹤誰存取了什麼

**下一步：**
1. 完成上述實作練習
2. 將現有應用從連線字串遷移到受管身分
3. 建立你的第一個 AZD 專案，從一開始就導入安全性： [第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明：**
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。文件的原始語言版本應視為具權威性的來源。如涉及重要資訊，建議採用專業人工翻譯。對於因使用本翻譯而產生的任何誤解或曲解，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
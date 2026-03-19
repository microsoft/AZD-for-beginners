# 認證模式與管理身份

⏱️ <strong>預計時間</strong>：45-60 分鐘 | 💰 <strong>成本影響</strong>：免費（無額外費用） | ⭐ <strong>複雜度</strong>：中階

**📚 學習路徑：**
- ← 上一節：[設定管理](configuration.md) - 管理環境變數和機密
- 🎯 <strong>您目前所在位置</strong>：認證與安全（管理身份、金鑰保管庫、安全模式）
- → 下一節：[第一個專案](first-project.md) - 建立您的第一個 AZD 應用程式
- 🏠 [課程首頁](../../README.md)

---

## 您將學習到的內容

完成本課程後，您將能：
- 了解 Azure 認證模式（金鑰、連接字串、管理身份）
- 實作 <strong>管理身份</strong> 的無密碼認證
- 藉由 **Azure Key Vault** 整合保護機密
- 為 AZD 部署設定 **基於角色的存取控制（RBAC）**
- 應用 Container Apps 及 Azure 服務的安全最佳實踐
- 將基於金鑰的認證遷移為基於身份的認證

## 為什麼管理身份很重要

### 問題：傳統認證

**在管理身份之前：**
```javascript
// ❌ 安全風險：程式碼中硬編碼的秘密
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**問題：**
- 🔴 代碼、設定檔、環境變數中暴露機密
- 🔴 憑證輪替需修改代碼並重新部署
- 🔴 審計困難 - 不清楚誰、何時存取了什麼
- 🔴 機密散落各處，難以管理
- 🔴 合規風險 - 無法通過安全審核

### 解決方案：管理身份

**使用管理身份之後：**
```javascript
// ✅ 安全：程式碼中無密碼
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure 自動處理身份驗證
);
```

**優點：**
- ✅ 代碼或設定中零機密
- ✅ 自動輪替 - 由 Azure 管理
- ✅ Azure AD 紀錄完整審計軌跡
- ✅ 集中安全管理 - 在 Azure 入口網站操作
- ✅ 符合合規規範的要求

<strong>比喻</strong>：傳統認證就像攜帶多把不同門的實體鑰匙，管理身份則像持有一張安全徽章，自動授權存取，無需擔心鑰匙遺失、複製或更換。

---

## 架構概述

### 使用管理身份的認證流程

```mermaid
sequenceDiagram
    participant App as 你的應用程式<br/>(容器應用程式)
    participant MI as 託管身份<br/>(Azure AD)
    participant KV as 金鑰保管庫
    participant Storage as Azure 儲存體
    participant DB as Azure SQL
    
    App->>MI: 請求存取權杖<br/>(自動)
    MI->>MI: 驗證身份<br/>(無需密碼)
    MI-->>App: 傳回權杖<br/>(有效 1 小時)
    
    App->>KV: 取得密碼<br/>(使用權杖)
    KV->>KV: 檢查 RBAC 權限
    KV-->>App: 傳回密碼值
    
    App->>Storage: 上傳 blob<br/>(使用權杖)
    Storage->>Storage: 檢查 RBAC 權限
    Storage-->>App: 成功
    
    App->>DB: 查詢資料<br/>(使用權杖)
    DB->>DB: 檢查 SQL 權限
    DB-->>App: 傳回結果
    
    Note over App,DB: 全部認證無需密碼！
```
### 管理身份類型

```mermaid
graph TB
    MI[受管理身份]
    SystemAssigned[系統指派身份]
    UserAssigned[使用者指派身份]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[生命週期與資源綁定]
    SystemAssigned --> SA2[自動建立/刪除]
    SystemAssigned --> SA3[適合單一資源]
    
    UserAssigned --> UA1[獨立生命週期]
    UserAssigned --> UA2[手動建立/刪除]
    UserAssigned --> UA3[資源共用]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| 功能 | 系統指派 | 使用者指派 |
|---------|----------------|---------------|
| <strong>生命週期</strong> | 綁定至資源 | 獨立存在 |
| <strong>建立</strong> | 隨資源自動產生 | 手動建立 |
| <strong>刪除</strong> | 隨資源刪除 | 資源刪除後仍存在 |
| <strong>共享性</strong> | 僅限一個資源 | 可供多個資源共用 |
| <strong>使用情境</strong> | 簡易場景 | 複雜多資源場景 |
| **AZD 預設** | ✅ 建議使用 | 選用 |

---

## 先決條件

### 必備工具

您應已在前面課程安裝：

```bash
# 驗證 Azure 開發者 CLI
azd version
# ✅ 預期：azd 版本 1.0.0 或以上

# 驗證 Azure CLI
az --version
# ✅ 預期：azure-cli 2.50.0 或以上
```

### Azure 要求

- 有效的 Azure 訂閱
- 權限包括：
  - 建立管理身份
  - 指派 RBAC 角色
  - 建立金鑰保管庫資源
  - 部署 Container Apps

### 知識先修

您應已完成：
- [安裝指南](installation.md) - AZD 設定
- [AZD 基礎](azd-basics.md) - 核心概念
- [設定管理](configuration.md) - 環境變數

---

## 課程 1：理解認證模式

### 模式 1：連接字串（舊式 - 避免使用）

**運作方式：**
```bash
# 連線字串包含憑證
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**問題：**
- ❌ 環境變數中可見機密
- ❌ 部署系統有記錄
- ❌ 難以輪替
- ❌ 無存取審計軌跡

**使用時機：** 僅用於本機開發，切勿於正式環境。

---

### 模式 2：金鑰保管庫參考（較佳）

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
- ✅ 機密安全存放於 Key Vault
- ✅ 集中管理機密
- ✅ 輪替無須修改代碼

**限制：**
- ⚠️ 仍使用金鑰或密碼
- ⚠️ 需管理 Key Vault 存取權

**使用時機：** 從連接字串過渡到管理身份的中繼步驟。

---

### 模式 3：管理身份（最佳實踐）

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

**應用程式代碼：**
```javascript
// 唔使秘密！
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**優點：**
- ✅ 代碼與設定零機密
- ✅ 自動憑證輪替
- ✅ 完整審計軌跡
- ✅ 基於 RBAC 的權限控管
- ✅ 符合合規需求

**使用時機：** 永遠用於正式環境應用程式。

---

## 課程 2：使用 AZD 實作管理身份

### 逐步實作

讓我們建立一個可使用管理身份訪問 Azure Storage 與 Key Vault 的安全 Container App。

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

### 1. 設定 AZD（azure.yaml）

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

### 2. 基礎架構：啟用管理身份

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

### 3. System-Assigned 身份的 Container App

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

### 5. 管理身份的應用程式程式碼

**檔案：`src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 初始化憑證（可與受管理身份自動配合使用）
const credential = new DefaultAzureCredential();

// Azure 儲存體設置
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // 無需密鑰！
);

// 金鑰保管庫設置
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // 無需密鑰！
);

// 健康檢查
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// 上傳檔案至 Blob 儲存體
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

// 從金鑰保管庫取得機密
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

# 部署基礎設施和應用程式
azd up

# 取得應用程式 URL
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

**測試 Blob 上傳：**
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

## 常用 Azure RBAC 角色

### 管理身份內建角色 ID

| 服務 | 角色名稱 | 角色 ID | 權限說明 |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | 讀取 blob 和容器 |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | 讀寫並刪除 blob |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | 讀寫刪除佇列訊息 |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | 讀取機密 |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | 讀寫刪除機密 |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | 讀取 Cosmos DB 資料 |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | 讀寫 Cosmos DB 資料 |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | 管理 SQL 資料庫 |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | 傳送、接收與管理訊息 |

### 如何查找角色 ID

```bash
# 列出所有內置角色
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# 搜尋特定角色
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# 獲取角色詳細資料
az role definition list --name "Storage Blob Data Contributor"
```

---

## 實務練習

### 練習 1：為既有應用啟用管理身份 ⭐⭐（中階）

<strong>目標</strong>：為已有的 Container App 部署新增管理身份

<strong>情境</strong>：您目前的 Container App 使用連接字串，轉換為管理身份。

**起始配置：**

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**步驟：**

1. **在 Bicep 中啟用管理身份：**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **授予 Storage 存取權限：**

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

**之前（連接字串）：**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**之後（管理身份）：**
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

# 測試它是否仍然有效
curl https://myapp.azurecontainerapps.io/upload
```

**✅ 成功標準：**
- ✅ 應用部署無錯誤
- ✅ Storage 操作正常（上傳、列出、下載）
- ✅ 環境變數中沒有連接字串
- ✅ 在 Azure 入口網站的「身份識別」分頁看到身分

**驗證：**

```bash
# 檢查已啟用受管身份
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 預期: "SystemAssigned"

# 檢查角色分配
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ 預期: 顯示 "Storage Blob Data Contributor" 角色
```

<strong>時間</strong>：20-30 分鐘

---

### 練習 2：使用者指派身份多服務存取 ⭐⭐⭐（進階）

<strong>目標</strong>：建立一個使用者指派身份，供多個 Container Apps 共用

<strong>情境</strong>：有 3 個微服務需存取相同的 Storage 帳戶與 Key Vault。

**步驟：**

1. **建立使用者指派身份：**

**檔案： `infra/core/identity.bicep`**

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

2. **指派角色給使用者指派身份：**

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

3. **將身份指派給多個 Container Apps：**

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

// 對於用戶分配的身份，請指定客戶端 ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // 用戶分配身份的客戶端 ID
);

// 或者使用 DefaultAzureCredential（自動檢測）
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **部署並驗證：**

```bash
azd up

# 測試所有服務均可存取存儲
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ 成功標準：**
- ✅ 一個身份供 3 個服務共用
- ✅ 所有服務能存取 Storage 和 Key Vault
- ✅ 刪除其中一服務後，身份仍持續存在
- ✅ 權限集中管理

**使用者指派身份優點：**
- 簡化身份管理
- 權限跨服務一致
- 可抵抗服務刪除造成的身份中斷
- 適合複雜架構

<strong>時間</strong>：30-40 分鐘

---

### 練習 3：實作 Key Vault 機密輪替 ⭐⭐⭐（進階）

<strong>目標</strong>：在 Key Vault 存放第三方 API 金鑰，並使用管理身份存取

<strong>情境</strong>：您的應用需調用外部 API（OpenAI、Stripe、SendGrid），這些需用 API 金鑰。

**步驟：**

1. **建立有 RBAC 的 Key Vault：**

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

2. **將機密存入 Key Vault：**

```bash
# 獲取金鑰保管庫名稱
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# 存儲第三方 API 金鑰
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

3. **取得機密的應用程式程式碼：**

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
    // 首先檢查緩存
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

4. **應用程式中使用機密：**

**檔案：`src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// 使用來自 Key Vault 的金鑰初始化 OpenAI
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// 啟動時調用
initializeServices().catch(console.error);

app.post('/chat', async (req, res) => {
  try {
    const completion = await openaiClient.chat.completions.create({
      model: 'gpt-4.1',
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

# 測試 API 金鑰是否有效
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ 成功標準：**
- ✅ 代碼與環境變數無 API 金鑰
- ✅ 應用程式從 Key Vault 取得金鑰
- ✅ 第三方 API 正常運作
- ✅ 可在無修改代碼狀況下輪替金鑰

**輪替機密：**

```bash
# 更新 Key Vault 中的秘密
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# 重啟應用程式以使用新密鑰
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

<strong>時間</strong>：25-35 分鐘

---

## 知識檢核點

### 1. 認證模式 ✓

測試您的理解：

- [ ] **Q1**：三種主要的認證模式是什麼？  
  - **A**：連接字串（舊式）、金鑰保管庫參考（過渡）、管理身份（最佳）

- [ ] **Q2**：為何管理身份優於連接字串？  
  - **A**：代碼中不含機密、自動輪替、完整審計軌跡、基於 RBAC 的權限管理

- [ ] **Q3**：什麼時候使用者會使用使用者指派身份而非系統指派？  
  - **A**：需要跨多資源共享身份，或身份生命週期與資源獨立

**實作驗證：**
```bash
# 檢查您的應用程式使用的是哪種類型的身份
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# 列出該身份的所有角色指派
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC 和權限 ✓

測試您的理解：

- [ ] **Q1**：Storage Blob Data Contributor 角色的 ID 是什麼？  
  - **A**：`ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**：Key Vault Secrets User 角色擁有哪些權限？  
  - **A**：只能讀取機密（無法建立、更新或刪除）

- [ ] **Q3**：如何授予 Container App 存取 Azure SQL？  
  - **A**：指派「SQL DB Contributor」角色或設定 SQL 的 Azure AD 認證

**實作驗證：**
```bash
# 尋找特定角色
az role definition list --name "Storage Blob Data Contributor"

# 檢查分配給您的身份的角色
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault 整合 ✓

測試您的理解：
- [ ] **Q1**: 如何為 Key Vault 啟用 RBAC 而非存取原則？
  - **A**: 在 Bicep 中設置 `enableRbacAuthorization: true`

- [ ] **Q2**: 哪個 Azure SDK 庫處理受管理身份驗證？
  - **A**: 使用 `@azure/identity` 和 `DefaultAzureCredential` 類別

- [ ] **Q3**: Key Vault 秘密在快取中保持多久？
  - **A**: 取決於應用程式；自行實作快取策略

**實作驗證:**
```bash
# 測試 Key Vault 存取權限
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# 檢查是否已啟用 RBAC
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ 預期結果：true
```

---

## 安全最佳實踐

### ✅ 要做的：

1. <strong>生產環境務必使用受管理身份</strong>
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **使用最低權限 RBAC 角色**
   - 盡可能使用「讀者」角色
   - 避免除非必要才使用「擁有者」或「參與者」

3. **將第三方金鑰存放於 Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. <strong>啟用稽核日誌</strong>
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **為開發、測試、正式環境使用不同身份**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. <strong>定期輪替秘密</strong>
   - 為 Key Vault 秘密設置到期日
   - 使用 Azure Functions 自動執行輪替

### ❌ 不要做的：

1. <strong>切勿硬編碼秘密</strong>
   ```javascript
   // ❌唔好
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. <strong>生產環境請勿用連接字串</strong>
   ```javascript
   // ❌ 差
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. <strong>不要授予過多權限</strong>
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. <strong>不要記錄秘密</strong>
   ```javascript
   // ❌ 唔好
   console.log('API Key:', apiKey);
   
   // ✅ 好
   console.log('API Key retrieved successfully');
   ```

5. <strong>不要跨環境共用正式環境身分</strong>
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## 疑難排解指南

### 問題：「未授權」存取 Azure Storage

**症狀:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**診斷:**

```bash
# 檢查是否啟用託管身份
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 預期: "SystemAssigned" 或 "UserAssigned"

# 檢查角色指派
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# 預期: 應該見到 "Storage Blob Data Contributor" 或類似角色
```

**解決方案：**

1. **授予正確 RBAC 角色：**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **等待傳播完成（可能需要 5-10 分鐘）：**
```bash
# 檢查角色分配狀態
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **確認應用程式程式碼使用正確憑證：**
```javascript
// 確保你使用緊 DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### 問題：Key Vault 存取被拒

**症狀:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**診斷:**

```bash
# 檢查 Key Vault RBAC 是否已啟用
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ 預期：true

# 檢查角色分配
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**解決方案：**

1. **啟用 Key Vault 上的 RBAC：**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **授予 Key Vault 秘密使用者角色：**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### 問題：DefaultAzureCredential 本地端失敗

**症狀:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**診斷:**

```bash
# 檢查你是否已登入
az account show

# 檢查 Azure CLI 認證
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

3. **本地開發時使用環境變數：**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **或在本地使用其他憑證：**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// 本地開發使用 AzureCliCredential
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### 問題：角色指派傳播太久

**症狀：**
- 角色已成功指派
- 仍出現 403 錯誤
- 存取不穩定（時有成功時有失敗）

**說明：**
Azure RBAC 變更需 5-10 分鐘全球同步。

**解決方案：**

```bash
# 等待並重試
echo "Waiting for RBAC propagation..."
sleep 300  # 等待5分鐘

# 測試存取
curl https://myapp.azurecontainerapps.io/upload

# 如果仍然失敗，重新啟動應用程式
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## 成本考量

### 受管理身份成本

| 資源 | 成本 |
|----------|------|
| <strong>受管理身份</strong> | 🆓 <strong>免費</strong> - 無收費 |
| **RBAC 角色指派** | 🆓 <strong>免費</strong> - 無收費 |
| **Azure AD 令牌請求** | 🆓 <strong>免費</strong> - 含括在內 |
| **Key Vault 操作** | 每 10,000 次操作 $0.03 |
| **Key Vault 儲存** | 每個秘密每月 $0.024 |

**受管理身份可節省成本點：**
- ✅ 消除服務間授權的 Key Vault 操作費用
- ✅ 降低安全事故（無憑證外洩）
- ✅ 減少營運負擔（免人工輪替）

**示例成本比較（月費）：**

| 情境 | 連接字串 | 受管理身份 | 節省 |
|----------|-------------------|-----------------|---------|
| 小型應用 (100 萬請求) | 約 $50（Key Vault + 操作） | 約 $0 | $50/月 |
| 中型應用 (1,000 萬請求) | 約 $200 | 約 $0 | $200/月 |
| 大型應用 (1 億請求) | 約 $1,500 | 約 $0 | $1,500/月 |

---

## 深入了解

### 官方文件
- [Azure 受管理身份](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK 文件
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### 本課程後續步驟
- ← 上一課: [配置管理](configuration.md)
- → 下一課: [第一個專案](first-project.md)
- 🏠 [課程首頁](../../README.md)

### 相關範例
- [Microsoft Foundry Models 聊天範例](../../../../examples/azure-openai-chat) - 使用受管理身份存取 Microsoft Foundry Models
- [微服務範例](../../../../examples/microservices) - 多服務驗證模式

---

## 總結

**你已學會：**
- ✅ 三種驗證模式（連接字串、Key Vault、受管理身份）
- ✅ 如何在 AZD 啟用與設定受管理身份
- ✅ Azure 服務的 RBAC 角色指派
- ✅ 對接第三方秘密與 Key Vault
- ✅ 使用者指派與系統指派身份
- ✅ 安全最佳實踐與疑難排解

**重點摘錄：**
1. <strong>生產環境一定要用受管理身份</strong> - 零秘密，自動輪替
2. **使用最低權限 RBAC 角色** - 僅授必需權限
3. **將第三方金鑰存放 Key Vault** - 集中管理秘密
4. <strong>不同環境使用分離身份</strong> - 開發、測試、正式隔離
5. <strong>啟用稽核日誌</strong> - 紀錄誰存取了什麼

**後續行動：**
1. 完成上方實作練習
2. 將現有應用服務從連接字串遷移到受管理身份
3. 從第一天起建置安全的 AZD 專案：[第一個專案](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議聘請專業人員進行人工翻譯。我們不對因使用此翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
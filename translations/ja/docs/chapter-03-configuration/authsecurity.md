# 認証パターンとマネージド アイデンティティ

⏱️ <strong>推定時間</strong>: 45-60 分 | 💰 <strong>コスト影響</strong>: 無料（追加料金なし） | ⭐ <strong>複雑さ</strong>: 中級

**📚 学習パス:**
- ← 前: [構成管理](configuration.md) - 環境変数とシークレットの管理
- 🎯 <strong>現在位置</strong>: 認証とセキュリティ（マネージド アイデンティティ、Key Vault、セキュアなパターン）
- → 次: [最初のプロジェクト](first-project.md) - 最初の AZD アプリを構築する
- 🏠 [コース ホーム](../../README.md)

---

## このレッスンで学ぶこと

このレッスンを完了すると、以下ができるようになります:
- Azure の認証パターン（キー、接続文字列、マネージド アイデンティティ）を理解する
- パスワード不要の認証のためにマネージド アイデンティティを実装する
- Azure Key Vault 統合でシークレットを保護する
- AZD デプロイのためのロールベースアクセス制御（RBAC）を構成する
- Container Apps と Azure サービスでセキュリティベストプラクティスを適用する
- キー ベースの認証からアイデンティティ ベースの認証へ移行する

## マネージド アイデンティティが重要な理由

### 問題: 従来の認証

**マネージド アイデンティティ導入前:**
```javascript
// ❌ セキュリティリスク: コード内にハードコーディングされた機密情報
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**問題点:**
- 🔴 **コード、設定ファイル、環境変数にシークレットが露出**
- 🔴 <strong>認証情報のローテーション</strong> にコード変更と再デプロイが必要
- 🔴 <strong>監査が困難</strong> - 誰がいつ何にアクセスしたか？
- 🔴 <strong>拡散</strong> - シークレットが複数のシステムに散在
- 🔴 <strong>コンプライアンスリスク</strong> - セキュリティ監査に失敗する可能性

### 解決策: マネージド アイデンティティ

**マネージド アイデンティティ導入後:**
```javascript
// ✅ 安全: コード内に機密情報はありません
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure は認証を自動的に処理します
);
```

**利点:**
- ✅ <strong>コードや設定にシークレットがゼロ</strong>
- ✅ <strong>自動ローテーション</strong> - Azure が処理
- ✅ **Azure AD ログでの完全な監査トレイル**
- ✅ <strong>集中管理されたセキュリティ</strong> - Azure ポータルで管理
- ✅ <strong>コンプライアンス対応</strong> - セキュリティ基準に準拠

<strong>例え</strong>: 従来の認証は複数のドア用の物理キーを持ち歩くようなものです。マネージド アイデンティティは、あなたが誰であるかに基づいて自動的にアクセスを付与するセキュリティバッジのようなものです—失くしたりコピーしたりローテーションするキーは不要です。

---

## アーキテクチャ概要

### マネージド アイデンティティによる認証フロー

```mermaid
sequenceDiagram
    participant App as アプリケーション<br/>(コンテナアプリ)
    participant MI as マネージド ID<br/>(Azure AD)
    participant KV as キー ボールト
    participant Storage as Azure ストレージ
    participant DB as Azure SQL
    
    App->>MI: アクセストークンを要求する<br/>(自動)
    MI->>MI: ID を検証する<br/>(パスワード不要)
    MI-->>App: トークンを返す<br/>(1 時間有効)
    
    App->>KV: シークレットを取得する<br/>(トークンを使用)
    KV->>KV: RBAC 権限を確認
    KV-->>App: シークレット値を返す
    
    App->>Storage: BLOB をアップロードする<br/>(トークンを使用)
    Storage->>Storage: RBAC 権限を確認
    Storage-->>App: 成功
    
    App->>DB: データをクエリする<br/>(トークンを使用)
    DB->>DB: SQL 権限を確認
    DB-->>App: 結果を返す
    
    Note over App,DB: すべての認証はパスワード不要!
```
### マネージド アイデンティティの種類

```mermaid
graph TB
    MI[マネージド ID]
    SystemAssigned[システム割り当て ID]
    UserAssigned[ユーザー割り当て ID]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[ライフサイクルがリソースに紐付く]
    SystemAssigned --> SA2[自動作成/削除]
    SystemAssigned --> SA3[単一のリソースに最適]
    
    UserAssigned --> UA1[独立したライフサイクル]
    UserAssigned --> UA2[手動作成/削除]
    UserAssigned --> UA3[リソース間で共有]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| 機能 | システム割り当て | ユーザー割り当て |
|---------|----------------|---------------|
| <strong>ライフサイクル</strong> | リソースに紐付く | 独立している |
| <strong>生成方法</strong> | リソース作成時に自動で | 手動で作成 |
| <strong>削除</strong> | リソースと共に削除される | リソース削除後も残る |
| <strong>共有</strong> | 1つのリソースのみ | 複数のリソース |
| <strong>ユースケース</strong> | 単純なシナリオ | 複数リソースの複雑なシナリオ |
| **AZD のデフォルト** | ✅ 推奨 | オプション |

---

## 前提条件

### 必要なツール

前のレッスンですでにこれらをインストールしているはずです：

```bash
# Azure Developer CLI を確認する
azd version
# ✅ 期待される: azd のバージョン 1.0.0 以上

# Azure CLI を確認する
az --version
# ✅ 期待される: azure-cli のバージョン 2.50.0 以上
```

### Azure の要件

- アクティブな Azure サブスクリプション
- 次の権限:
  - マネージド アイデンティティを作成する権限
  - RBAC ロールを割り当てる権限
  - Key Vault リソースを作成する権限
  - Container Apps をデプロイする権限

### 知識の前提

次を完了していること:
- [インストール ガイド](installation.md) - AZD のセットアップ
- [AZD の基本](azd-basics.md) - コア概念
- [構成管理](configuration.md) - 環境変数

---

## レッスン 1: 認証パターンの理解

### パターン 1: 接続文字列（レガシー - 避ける）

**仕組み：**
```bash
# 接続文字列に認証情報が含まれています
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**問題点：**
- ❌ 環境変数にシークレットが表示される
- ❌ デプロイシステムにログ出力される
- ❌ ローテーションが困難
- ❌ アクセスの監査トレイルがない

**使用時期:** ローカル開発時のみ。決して本番で使用しない。

---

### パターン 2: Key Vault 参照（改善）

**仕組み：**
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

**利点：**
- ✅ シークレットが Key Vault に安全に保存される
- ✅ シークレットの集中管理
- ✅ コード変更なしでのローテーション

**制限：**
- ⚠️ 依然としてキー/パスワードを使用する
- ⚠️ Key Vault へのアクセスを管理する必要がある

**使用時期:** 接続文字列からマネージド アイデンティティへの移行ステップとして。

---

### パターン 3: マネージド アイデンティティ（ベストプラクティス）

**仕組み：**
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

**アプリケーションコード：**
```javascript
// 秘密は必要ありません！
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**利点：**
- ✅ コードや設定にシークレットがゼロ
- ✅ 自動認証情報ローテーション
- ✅ 完全な監査トレイル
- ✅ RBAC ベースの権限管理
- ✅ コンプライアンス対応

**使用時期:** 常に、本番アプリケーションで使用する。

---

## レッスン 2: AZD でのマネージド アイデンティティ実装

### ステップバイステップの実装

マネージド アイデンティティを使用して Azure Storage と Key Vault にアクセスする、安全な Container App を構築しましょう。

### プロジェクト構成

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

### 1. AZD の構成 (azure.yaml)

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

### 2. インフラ: マネージド アイデンティティを有効化

ファイル: `infra/main.bicep`

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

### 3. システム割り当てアイデンティティを持つ Container App

ファイル: `infra/app/container-app.bicep`

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

### 4. RBAC ロール割り当てモジュール

ファイル: `infra/core/role-assignment.bicep`

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

### 5. マネージド アイデンティティを使用したアプリケーションコード

ファイル: `src/app.js`

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 資格情報を初期化する（マネージド ID で自動的に動作します）
const credential = new DefaultAzureCredential();

// Azure Storage のセットアップ
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // キーは不要です！
);

// Key Vault のセットアップ
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // キーは不要です！
);

// ヘルスチェック
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// ファイルを Blob ストレージにアップロードする
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

// Key Vault からシークレットを取得する
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

// Blob コンテナーを一覧表示する（読み取りアクセスを示す）
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

ファイル: `src/package.json`

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

### 6. デプロイとテスト

```bash
# AZD 環境を初期化する
azd init

# インフラとアプリケーションをデプロイする
azd up

# アプリの URL を取得する
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# ヘルスチェックをテストする
curl $APP_URL/health
```

**✅ 期待される出力:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Blob アップロードのテスト:**
```bash
curl -X POST $APP_URL/upload
```

**✅ 期待される出力:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**コンテナ一覧のテスト:**
```bash
curl $APP_URL/containers
```

**✅ 期待される出力:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## よく使われる Azure RBAC ロール

### マネージド アイデンティティ用の組み込みロール ID

| サービス | ロール名 | ロール ID | 権限 |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | BLOB とコンテナの読み取り |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | BLOB の読み取り、書き込み、削除 |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | キュー メッセージの読み取り、書き込み、削除 |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | シークレットの読み取り |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | シークレットの読み取り、書き込み、削除 |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Cosmos DB データの読み取り |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Cosmos DB データの読み取り・書き込み |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | SQL データベースの管理 |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | メッセージの送受信と管理 |

### ロール ID の見つけ方

```bash
# すべての組み込みロールを一覧表示する
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# 特定のロールを検索する
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# ロールの詳細を取得する
az role definition list --name "Storage Blob Data Contributor"
```

---

## 実践演習

### 演習 1: 既存アプリにマネージド アイデンティティを有効化 ⭐⭐（中）

<strong>目標</strong>: 既存の Container App デプロイにマネージド アイデンティティを追加する

<strong>シナリオ</strong>: 接続文字列を使用している Container App をマネージド アイデンティティに変換する。

<strong>開始時点</strong>: 次の構成を持つ Container App:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

<strong>手順</strong>:

1. **Bicep でマネージド アイデンティティを有効化：**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Storage へのアクセス権を付与：**

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

3. **アプリケーションコードを更新：**

**前（接続文字列）：**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**後（マネージド アイデンティティ）：**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **環境変数を更新：**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **デプロイとテスト：**

```bash
# 再デプロイ
azd up

# まだ動作するかをテストする
curl https://myapp.azurecontainerapps.io/upload
```

**✅ 合格基準:**
- ✅ アプリケーションがエラーなくデプロイされる
- ✅ Storage 操作が機能する（アップロード、一覧表示、ダウンロード）
- ✅ 環境変数に接続文字列がない
- ✅ Azure ポータルの "Identity" ブレードでアイデンティティが確認できる

**検証:**

```bash
# マネージド ID が有効になっていることを確認
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 期待値: "SystemAssigned"

# ロールの割り当てを確認
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ 期待値: "Storage Blob Data Contributor" ロールが表示される
```

<strong>時間</strong>: 20-30 分

---

### 演習 2: ユーザー割り当てアイデンティティによるマルチサービスアクセス ⭐⭐⭐（上級）

<strong>目標</strong>: 複数の Container App で共有されるユーザー割り当てアイデンティティを作成する

<strong>シナリオ</strong>: 同じ Storage アカウントと Key Vault にアクセスする必要がある 3 つのマイクロサービスがある。

<strong>手順</strong>:

1. **ユーザー割り当てアイデンティティの作成:**

ファイル: `infra/core/identity.bicep`

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

2. **ユーザー割り当てアイデンティティにロールを割り当てる:**

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

3. **複数の Container App にアイデンティティを割り当てる:**

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

4. **アプリケーションコード（すべてのサービスが同じパターンを使用）:**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// ユーザー割り当てアイデンティティを使用する場合はクライアント ID を指定してください
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ユーザー割り当てアイデンティティのクライアント ID
);

// または DefaultAzureCredential を使用（自動検出）
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **デプロイと検証:**

```bash
azd up

# すべてのサービスがストレージにアクセスできることをテストする
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ 合格基準:**
- ✅ 3 サービス間で共有される 1 つのアイデンティティ
- ✅ すべてのサービスが Storage と Key Vault にアクセスできる
- ✅ サービスを 1 つ削除してもアイデンティティが保持される
- ✅ 権限管理が集中化されている

**ユーザー割り当てアイデンティティの利点:**
- 管理するアイデンティティが一つ
- サービス間で一貫した権限
- サービス削除時もアイデンティティが存続
- 複雑なアーキテクチャに適している

<strong>時間</strong>: 30-40 分

---

### 演習 3: Key Vault シークレットのローテーション実装 ⭐⭐⭐（上級）

<strong>目標</strong>: サードパーティの API キーを Key Vault に保存し、マネージド アイデンティティでアクセスする

<strong>シナリオ</strong>: アプリが API キーを必要とする外部 API（OpenAI、Stripe、SendGrid）を呼び出す必要がある。

<strong>手順</strong>:

1. **RBAC を使用した Key Vault の作成:**

ファイル: `infra/core/keyvault.bicep`

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

2. **Key Vault にシークレットを格納:**

```bash
# Key Vault の名前を取得
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# サードパーティの API キーを保存する
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

3. **シークレットを取得するアプリケーションコード:**

ファイル: `src/config.js`

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
    // 最初にキャッシュを確認する
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

4. **アプリケーションでシークレットを使用:**

ファイル: `src/app.js`

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Key Vaultからキーを取得してOpenAIを初期化する
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// 起動時に呼び出す
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

5. **デプロイとテスト:**

```bash
azd up

# APIキーが機能することをテストする
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ 合格基準:**
- ✅ コードや環境変数に API キーがない
- ✅ アプリケーションが Key Vault からキーを取得する
- ✅ サードパーティの API が正しく動作する
- ✅ コード変更なしでキーをローテーションできる

**シークレットをローテーションする:**

```bash
# Key Vault のシークレットを更新する
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# 新しいキーを反映するためにアプリを再起動する
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

<strong>時間</strong>: 25-35 分

---

## 知識チェックポイント

### 1. 認証パターン ✓

理解度をテスト:

- [ ] **Q1**: 主要な認証パターンは何ですか？
  - **A**: 接続文字列（レガシー）、Key Vault 参照（移行）、マネージド アイデンティティ（ベスト）

- [ ] **Q2**: なぜマネージド アイデンティティは接続文字列より優れているのか？
  - **A**: コードにシークレットがない、自動ローテーション、完全な監査トレイル、RBAC による権限

- [ ] **Q3**: システム割り当てではなくユーザー割り当てアイデンティティを使用するのはどんな場合か？
  - **A**: 複数のリソースでアイデンティティを共有する場合、またはアイデンティティのライフサイクルがリソースのライフサイクルと独立している場合

**ハンズオン検証:**
```bash
# アプリが使用しているアイデンティティの種類を確認する
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# そのアイデンティティに対するすべてのロール割り当てを一覧表示する
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC と権限 ✓

理解度をテスト:

- [ ] **Q1**: 「Storage Blob Data Contributor」のロール ID は？
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: 「Key Vault Secrets User」はどんな権限を提供するか？
  - **A**: シークレットの読み取り専用アクセス（作成、更新、削除は不可）

- [ ] **Q3**: Container App に Azure SQL へのアクセス権を付与するには？
  - **A**: 「SQL DB Contributor」ロールを割り当てるか、SQL に対して Azure AD 認証を設定する

**ハンズオン検証:**
```bash
# 特定のロールを見つける
az role definition list --name "Storage Blob Data Contributor"

# 自分のアイデンティティに割り当てられているロールを確認する
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault 統合 ✓
- [ ] **Q1**: Key Vaultでアクセス ポリシーの代わりに RBAC を有効にするにはどうしますか?
  - **A**: Bicepで `enableRbacAuthorization: true` を設定する

- [ ] **Q2**: どの Azure SDK ライブラリがマネージド ID 認証を扱いますか?
  - **A**: `@azure/identity` と `DefaultAzureCredential` クラス

- [ ] **Q3**: Key Vault のシークレットはキャッシュにどのくらい残りますか?
  - **A**: アプリケーション依存です。独自のキャッシュ戦略を実装してください

**Hands-On Verification:**
```bash
# Key Vault へのアクセスをテスト
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# RBAC が有効になっているか確認
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ 期待値: true
```

---

## セキュリティのベストプラクティス

### ✅ 実行すること:

1. **本番環境では常にマネージド ID を使用する**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **最小権限の RBAC ロールを使用する**
   - 可能な場合は "Reader" ロールを使用する
   - 必要でない限り "Owner" や "Contributor" を避ける

3. **サードパーティのキーを Key Vault に保存する**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. <strong>監査ログを有効にする</strong>
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **開発/ステージング/本番で異なる ID を使用する**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. <strong>シークレットを定期的にローテーションする</strong>
   - Key Vault のシークレットに有効期限を設定する
   - Azure Functions でローテーションを自動化する

### ❌ やってはいけないこと:

1. <strong>シークレットをハードコードしてはいけない</strong>
   ```javascript
   // ❌ 悪い
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. <strong>本番環境で接続文字列を使用しない</strong>
   ```javascript
   // ❌ 悪い
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. <strong>過度な権限を付与しない</strong>
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. <strong>シークレットをログに出力しない</strong>
   ```javascript
   // ❌ 悪い
   console.log('API Key:', apiKey);
   
   // ✅ 良い
   console.log('API Key retrieved successfully');
   ```

5. **本番の ID を環境間で共有しない**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## トラブルシューティングガイド

### 問題: Azure Storage にアクセスすると「Unauthorized」になる

**症状:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**診断:**

```bash
# マネージド ID が有効かどうかを確認する
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ 期待: "SystemAssigned" または "UserAssigned"

# ロール割り当てを確認する
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# 期待: "Storage Blob Data Contributor" または類似のロールが表示されるはず
```

**解決策:**

1. **正しい RBAC ロールを付与する:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **伝播を待つ（5〜10分かかる場合があります）:**
```bash
# ロール割り当ての状態を確認する
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **アプリケーションコードが正しい資格情報を使用していることを確認する:**
```javascript
// DefaultAzureCredential を使用していることを確認してください
const credential = new DefaultAzureCredential();
```

---

### 問題: Key Vault へのアクセスが拒否される

**症状:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**診断:**

```bash
# Key Vault の RBAC が有効になっているか確認する
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ 期待値: true

# ロールの割り当てを確認する
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**解決策:**

1. **Key Vault で RBAC を有効にする:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Key Vault Secrets User ロールを付与する:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### 問題: DefaultAzureCredential がローカルで失敗する

**症状:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**診断:**

```bash
# ログインしているか確認する
az account show

# Azure CLI の認証を確認する
az ad signed-in-user show
```

**解決策:**

1. **Azure CLI にログインする:**
```bash
az login
```

2. **Azure サブスクリプションを設定する:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **ローカル開発では環境変数を使用する:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **またはローカルで別の資格情報を使用する:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// ローカル開発では AzureCliCredential を使用する
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### 問題: ロールの割り当ての伝播に時間がかかる

**症状:**
- ロールは正常に割り当てられている
- それでも 403 エラーが発生する
- 断続的なアクセス（時々動作し、時々動作しない）

**説明:**
Azure RBAC の変更は、グローバルに反映されるまで 5〜10 分かかることがあります。

**解決策:**

```bash
# 待って再試行
echo "Waiting for RBAC propagation..."
sleep 300  # 5分待つ

# アクセスをテスト
curl https://myapp.azurecontainerapps.io/upload

# それでも失敗する場合はアプリを再起動する
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## コストに関する考慮事項

### マネージド ID のコスト

| リソース | コスト |
|----------|------|
| **マネージド ID** | 🆓 <strong>無料</strong> - 課金なし |
| **RBAC ロール割り当て** | 🆓 <strong>無料</strong> - 課金なし |
| **Azure AD トークン要求** | 🆓 <strong>無料</strong> - 含まれる |
| **Key Vault Operations** | $0.03 / 10,000 操作あたり |
| **Key Vault Storage** | $0.024 / シークレット / 月 |

**マネージド ID がコスト削減につながる理由：**
- ✅ サービス間認証での Key Vault 操作を排除する
- ✅ セキュリティインシデントを削減する（資格情報の漏洩なし）
- ✅ 運用負荷を低減する（手動ローテーション不要）

**コスト比較の例（月次）:**

| シナリオ | 接続文字列 | マネージド ID | 削減額 |
|----------|-------------------|-----------------|---------|
| 小規模アプリ（1M リクエスト） | ~$50 (Key Vault + ops) | ~$0 | $50/月 |
| 中規模アプリ（10M リクエスト） | ~$200 | ~$0 | $200/月 |
| 大規模アプリ（100M リクエスト） | ~$1,500 | ~$0 | $1,500/月 |

---

## 詳しく知る

### 公式ドキュメント
- [Azure マネージド ID](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC（ロールベースのアクセス制御）](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK ドキュメント
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### このコースの次のステップ
- ← 前: [構成管理](configuration.md)
- → 次: [最初のプロジェクト](first-project.md)
- 🏠 [コースホーム](../../README.md)

### 関連する例
- [Microsoft Foundry Models Chat Example](../../../../examples/azure-openai-chat) - Microsoft Foundry Models に対してマネージド ID を使用
- [Microservices Example](../../../../examples/microservices) - 複数サービスの認証パターン

---

## まとめ

**学んだこと:**
- ✅ 3つの認証パターン（接続文字列、Key Vault、マネージド ID）
- ✅ AZD でマネージド ID を有効化および構成する方法
- ✅ Azure サービスの RBAC ロール割り当て
- ✅ サードパーティのシークレットのための Key Vault 統合
- ✅ ユーザー割り当て ID とシステム割り当て ID
- ✅ セキュリティのベストプラクティスとトラブルシューティング

**重要なポイント:**
1. **本番環境では常にマネージド ID を使用する** - シークレット不要、自動ローテーション
2. **最小権限の RBAC ロールを使用する** - 必要な権限のみ付与する
3. **サードパーティのキーを Key Vault に保存する** - シークレットの集中管理
4. **環境ごとに ID を分ける** - 開発、ステージング、本番の分離
5. <strong>監査ログを有効にする</strong> - 誰が何にアクセスしたかを追跡する

**次のステップ:**
1. 上記の実践演習を完了する
2. 既存のアプリを接続文字列からマネージド ID に移行する
3. 初日からセキュリティを考慮した最初の AZD プロジェクトを構築する: [最初のプロジェクト](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責事項**:
この文書は AI翻訳サービス [Co-op トランスレーター](https://github.com/Azure/co-op-translator) を用いて翻訳されました。正確性には努めていますが、自動翻訳には誤りや不正確な点が含まれる場合があることにご留意ください。原文（原語の文書）が権威ある情報源と見なされるべきです。重要な情報については、専門の人による翻訳を推奨します。本翻訳の使用に起因するいかなる誤解や誤訳についても、当社は責任を負いません。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
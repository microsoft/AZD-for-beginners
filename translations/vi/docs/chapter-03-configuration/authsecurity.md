# Authentication Patterns and Managed Identity

⏱️ **Thời gian ước tính**: 45-60 phút | 💰 **Tác động chi phí**: Miễn phí (không phát sinh chi phí bổ sung) | ⭐ **Độ phức tạp**: Trung bình

**📚 Lộ trình học:**
- ← Previous: [Quản lý Cấu hình](configuration.md) - Quản lý biến môi trường và bí mật
- 🎯 **Bạn đang ở đây**: Authentication & Security (Managed Identity, Key Vault, các mẫu bảo mật)
- → Next: [Dự án đầu tiên](first-project.md) - Xây dựng ứng dụng AZD đầu tiên của bạn
- 🏠 [Trang khóa học](../../README.md)

---

## Những gì bạn sẽ học

Khi hoàn thành bài học này, bạn sẽ:
- Hiểu các mẫu xác thực của Azure (keys, connection strings, managed identity)
- Triển khai **Managed Identity** để xác thực không cần mật khẩu
- Bảo mật bí mật với tích hợp **Azure Key Vault**
- Cấu hình **role-based access control (RBAC)** cho các triển khai AZD
- Áp dụng các thực hành bảo mật tốt nhất trong Container Apps và các dịch vụ Azure
- Di chuyển từ xác thực dựa trên key sang xác thực dựa trên danh tính

## Tại sao Managed Identity quan trọng

### Vấn đề: Xác thực truyền thống

**Trước Managed Identity:**
```javascript
// ❌ RỦI RO BẢO MẬT: Bí mật được cố định trong mã nguồn
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Vấn đề:**
- 🔴 **Bí mật bị lộ** trong mã, tập tin cấu hình, biến môi trường
- 🔴 **Quay vòng thông tin xác thực** đòi hỏi thay đổi mã và triển khai lại
- 🔴 **Ác mộng kiểm toán** - ai đã truy cập gì, khi nào?
- 🔴 **Rải rác** - bí mật nằm rải rác trên nhiều hệ thống
- 🔴 **Rủi ro tuân thủ** - không đạt các tiêu chí kiểm toán bảo mật

### Giải pháp: Managed Identity

**Sau Managed Identity:**
```javascript
// ✅ AN TOÀN: Không có bí mật trong mã nguồn
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure tự động xử lý xác thực
);
```

**Lợi ích:**
- ✅ **Không có bí mật** trong mã hoặc cấu hình
- ✅ **Tự động quay vòng** - Azure xử lý
- ✅ **Theo dõi kiểm toán đầy đủ** trong logs của Azure AD
- ✅ **Bảo mật tập trung** - quản lý qua Azure Portal
- ✅ **Sẵn sàng tuân thủ** - đáp ứng các tiêu chuẩn bảo mật

**Tương tự**: Xác thực truyền thống giống như mang nhiều chìa khóa vật lý cho các cửa khác nhau. Managed Identity giống như một thẻ an ninh tự động cấp quyền dựa trên danh tính của bạn—không có chìa khóa để làm mất, sao chép hoặc quay vòng.

---

## Tổng quan kiến trúc

### Luồng xác thực với Managed Identity

```mermaid
sequenceDiagram
    participant App as Ứng dụng của bạn<br/>(ứng dụng Container)
    participant MI as Danh tính được quản lý<br/>(Azure AD)
    participant KV as Key Vault
    participant Storage as Azure Storage
    participant DB as Azure SQL
    
    App->>MI: Yêu cầu token truy cập<br/>(tự động)
    MI->>MI: Xác minh danh tính<br/>(không cần mật khẩu)
    MI-->>App: Trả về token<br/>(hợp lệ 1 giờ)
    
    App->>KV: Lấy bí mật<br/>(sử dụng token)
    KV->>KV: Kiểm tra quyền RBAC
    KV-->>App: Trả về giá trị bí mật
    
    App->>Storage: Tải lên blob<br/>(sử dụng token)
    Storage->>Storage: Kiểm tra quyền RBAC
    Storage-->>App: Thành công
    
    App->>DB: Truy vấn dữ liệu<br/>(sử dụng token)
    DB->>DB: Kiểm tra quyền SQL
    DB-->>App: Trả về kết quả
    
    Note over App,DB: Tất cả xác thực không cần mật khẩu!
```
### Các loại Managed Identities

```mermaid
graph TB
    MI[Định danh được quản lý]
    SystemAssigned[Định danh do hệ thống gán]
    UserAssigned[Định danh do người dùng gán]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Vòng đời gắn với tài nguyên]
    SystemAssigned --> SA2[Tạo/xóa tự động]
    SystemAssigned --> SA3[Phù hợp nhất cho một tài nguyên]
    
    UserAssigned --> UA1[Vòng đời độc lập]
    UserAssigned --> UA2[Tạo/xóa thủ công]
    UserAssigned --> UA3[Chia sẻ giữa các tài nguyên]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Tính năng | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Vòng đời** | Gắn với tài nguyên | Độc lập |
| **Tạo** | Tự động với tài nguyên | Tạo thủ công |
| **Xóa** | Bị xóa cùng tài nguyên | Duy trì sau khi xóa tài nguyên |
| **Chia sẻ** | Chỉ một tài nguyên | Nhiều tài nguyên |
| **Trường hợp sử dụng** | Kịch bản đơn giản | Kịch bản phức tạp nhiều tài nguyên |
| **Mặc định AZD** | ✅ Được khuyến nghị | Tùy chọn |

---

## Yêu cầu trước khi bắt đầu

### Công cụ cần thiết

Bạn nên đã cài các công cụ sau từ các bài học trước:

```bash
# Xác minh Azure Developer CLI
azd version
# ✅ Yêu cầu: azd phiên bản 1.0.0 hoặc cao hơn

# Xác minh Azure CLI
az --version
# ✅ Yêu cầu: azure-cli 2.50.0 hoặc cao hơn
```

### Yêu cầu Azure

- Tài khoản đăng ký Azure đang hoạt động
- Quyền để:
  - Tạo managed identities
  - Gán vai trò RBAC
  - Tạo tài nguyên Key Vault
  - Triển khai Container Apps

### Kiến thức tiền đề

Bạn nên đã hoàn thành:
- [Hướng dẫn cài đặt](installation.md) - Thiết lập AZD
- [AZD Basics](azd-basics.md) - Các khái niệm cốt lõi
- [Configuration Management](configuration.md) - Biến môi trường

---

## Bài học 1: Hiểu các mẫu xác thực

### Mẫu 1: Chuỗi kết nối (Cũ - Tránh)

**Cách hoạt động:**
```bash
# Chuỗi kết nối chứa thông tin xác thực
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Vấn đề:**
- ❌ Bí mật hiển thị trong biến môi trường
- ❌ Được ghi log trong hệ thống triển khai
- ❌ Khó quay vòng
- ❌ Không có lộ trình kiểm toán truy cập

**Khi nào sử dụng:** Chỉ cho phát triển cục bộ, không bao giờ cho production.

---

### Mẫu 2: Tham chiếu Key Vault (Tốt hơn)

**Cách hoạt động:**
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

**Lợi ích:**
- ✅ Bí mật được lưu an toàn trong Key Vault
- ✅ Quản lý bí mật tập trung
- ✅ Quay vòng mà không cần thay đổi mã

**Hạn chế:**
- ⚠️ Vẫn sử dụng keys/mật khẩu
- ⚠️ Cần quản lý quyền truy cập Key Vault

**Khi nào sử dụng:** Bước chuyển tiếp từ chuỗi kết nối sang managed identity.

---

### Mẫu 3: Managed Identity (Thực hành tốt nhất)

**Cách hoạt động:**
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

**Mã ứng dụng:**
```javascript
// Không cần bí mật!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Lợi ích:**
- ✅ Không có bí mật trong mã/cấu hình
- ✅ Tự động quay vòng thông tin xác thực
- ✅ Theo dõi kiểm toán đầy đủ
- ✅ Quyền dựa trên RBAC
- ✅ Sẵn sàng tuân thủ

**Khi nào sử dụng:** Luôn luôn, cho các ứng dụng production.

---

## Bài học 2: Triển khai Managed Identity với AZD

### Triển khai từng bước

Hãy xây một Container App an toàn sử dụng managed identity để truy cập Azure Storage và Key Vault.

### Cấu trúc dự án

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

### 1. Cấu hình AZD (azure.yaml)

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

### 2. Hạ tầng: Bật Managed Identity

**Tệp: `infra/main.bicep`**

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

### 3. Container App với System-Assigned Identity

**Tệp: `infra/app/container-app.bicep`**

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

### 4. Module Gán Vai Trò RBAC

**Tệp: `infra/core/role-assignment.bicep`**

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

### 5. Mã ứng dụng với Managed Identity

**Tệp: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Khởi tạo thông tin xác thực (hoạt động tự động với định danh được quản lý)
const credential = new DefaultAzureCredential();

// Thiết lập Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Không cần khóa!
);

// Thiết lập Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Không cần khóa!
);

// Kiểm tra tình trạng
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Tải tệp lên blob storage
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

// Lấy bí mật từ Key Vault
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

// Liệt kê các container blob (minh họa quyền truy cập đọc)
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

**Tệp: `src/package.json`**

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

### 6. Triển khai và Kiểm tra

```bash
# Khởi tạo môi trường AZD
azd init

# Triển khai hạ tầng và ứng dụng
azd up

# Lấy URL ứng dụng
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Kiểm tra tình trạng hoạt động
curl $APP_URL/health
```

**✅ Kết quả mong đợi:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Kiểm thử upload blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Kết quả mong đợi:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Liệt kê container kiểm thử:**
```bash
curl $APP_URL/containers
```

**✅ Kết quả mong đợi:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Các vai trò RBAC phổ biến trên Azure

### Built-in Role IDs cho Managed Identity

| Service | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Đọc các blob và container |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Đọc, ghi, xóa blob |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Đọc, ghi, xóa tin nhắn hàng đợi |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Đọc bí mật |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Đọc, ghi, xóa bí mật |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Đọc dữ liệu Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Đọc, ghi dữ liệu Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Quản lý cơ sở dữ liệu SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Gửi, nhận, quản lý tin nhắn |

### Cách tìm Role IDs

```bash
# Liệt kê tất cả các vai trò tích hợp sẵn
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Tìm kiếm vai trò cụ thể
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Lấy thông tin chi tiết vai trò
az role definition list --name "Storage Blob Data Contributor"
```

---

## Bài tập thực hành

### Bài tập 1: Bật Managed Identity cho Ứng dụng hiện có ⭐⭐ (Trung bình)

**Mục tiêu**: Thêm managed identity vào một triển khai Container App đang có

**Kịch bản**: Bạn có một Container App đang dùng chuỗi kết nối. Chuyển sang managed identity.

**Điểm bắt đầu**: Container App với cấu hình này:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Các bước**:

1. **Bật managed identity trong Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Cấp quyền truy cập Storage:**

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

3. **Cập nhật mã ứng dụng:**

**Trước (chuỗi kết nối):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Sau (managed identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Cập nhật biến môi trường:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Triển khai và kiểm tra:**

```bash
# Triển khai lại
azd up

# Kiểm tra xem nó vẫn hoạt động
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Tiêu chí thành công:**
- ✅ Ứng dụng triển khai không lỗi
- ✅ Các thao tác Storage hoạt động (upload, list, download)
- ✅ Không còn chuỗi kết nối trong biến môi trường
- ✅ Identity hiển thị trong Azure Portal dưới blade "Identity"

**Xác minh:**

```bash
# Kiểm tra managed identity đã được bật
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Dự kiến: "SystemAssigned"

# Kiểm tra gán vai trò
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Dự kiến: Hiển thị vai trò "Storage Blob Data Contributor"
```

**Thời gian**: 20-30 phút

---

### Bài tập 2: Truy cập đa dịch vụ với User-Assigned Identity ⭐⭐⭐ (Nâng cao)

**Mục tiêu**: Tạo user-assigned identity được chia sẻ giữa nhiều Container App

**Kịch bản**: Bạn có 3 microservice cần truy cập cùng một Storage account và Key Vault.

**Các bước**:

1. **Tạo user-assigned identity:**

**Tệp: `infra/core/identity.bicep`**

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

2. **Gán vai trò cho user-assigned identity:**

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

3. **Gán identity cho nhiều Container Apps:**

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

4. **Mã ứng dụng (tất cả dịch vụ dùng cùng mẫu):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Đối với danh tính được gán bởi người dùng, hãy chỉ định client ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // client ID của danh tính được gán bởi người dùng
);

// Hoặc sử dụng DefaultAzureCredential (tự động phát hiện)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Triển khai và xác minh:**

```bash
azd up

# Kiểm tra tất cả các dịch vụ có thể truy cập lưu trữ
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Tiêu chí thành công:**
- ✅ Một identity được chia sẻ giữa 3 dịch vụ
- ✅ Tất cả dịch vụ có thể truy cập Storage và Key Vault
- ✅ Identity tồn tại nếu bạn xóa một dịch vụ
- ✅ Quản lý quyền tập trung

**Lợi ích của User-Assigned Identity:**
- Một identity để quản lý
- Quyền nhất quán giữa các dịch vụ
- Tồn tại sau khi xóa dịch vụ
- Tốt cho kiến trúc phức tạp

**Thời gian**: 30-40 phút

---

### Bài tập 3: Triển khai Quay vòng Bí mật Key Vault ⭐⭐⭐ (Nâng cao)

**Mục tiêu**: Lưu API keys của bên thứ ba trong Key Vault và truy cập chúng bằng managed identity

**Kịch bản**: Ứng dụng của bạn cần gọi API bên ngoài (OpenAI, Stripe, SendGrid) yêu cầu API keys.

**Các bước**:

1. **Tạo Key Vault với RBAC:**

**Tệp: `infra/core/keyvault.bicep`**

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

2. **Lưu bí mật vào Key Vault:**

```bash
# Lấy tên Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Lưu các khóa API của bên thứ ba
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

3. **Mã ứng dụng để lấy bí mật:**

**Tệp: `src/config.js`**

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
    // Kiểm tra bộ nhớ đệm trước
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

4. **Sử dụng bí mật trong ứng dụng:**

**Tệp: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Khởi tạo OpenAI bằng khóa từ Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Gọi khi khởi động
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

5. **Triển khai và kiểm tra:**

```bash
azd up

# Kiểm tra rằng các khóa API hoạt động
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Tiêu chí thành công:**
- ✅ Không có API keys trong mã hoặc biến môi trường
- ✅ Ứng dụng truy xuất khóa từ Key Vault
- ✅ Các API bên thứ ba hoạt động chính xác
- ✅ Có thể quay vòng khóa mà không cần thay đổi mã

**Quay vòng một bí mật:**

```bash
# Cập nhật bí mật trong Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Khởi động lại ứng dụng để áp dụng khóa mới
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Thời gian**: 25-35 phút

---

## Điểm kiểm tra kiến thức

### 1. Mẫu xác thực ✓

Kiểm tra hiểu biết của bạn:

- [ ] **Q1**: Ba mẫu xác thực chính là gì? 
  - **A**: Chuỗi kết nối (cũ), Tham chiếu Key Vault (chuyển tiếp), Managed Identity (tốt nhất)

- [ ] **Q2**: Tại sao managed identity tốt hơn chuỗi kết nối?
  - **A**: Không có bí mật trong mã, quay vòng tự động, theo dõi kiểm toán đầy đủ, quyền theo RBAC

- [ ] **Q3**: Khi nào bạn sử dụng user-assigned identity thay vì system-assigned?
  - **A**: Khi cần chia sẻ identity giữa nhiều tài nguyên hoặc khi vòng đời identity độc lập với vòng đời tài nguyên

**Xác minh thực hành:**
```bash
# Kiểm tra ứng dụng của bạn đang sử dụng loại định danh nào
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Liệt kê tất cả các phân công vai trò cho định danh
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC và Quyền ✓

Kiểm tra hiểu biết của bạn:

- [ ] **Q1**: Role ID cho "Storage Blob Data Contributor" là gì?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: "Key Vault Secrets User" cung cấp những quyền gì?
  - **A**: Quyền chỉ đọc đối với bí mật (không thể tạo, cập nhật hoặc xóa)

- [ ] **Q3**: Làm thế nào để cấp cho một Container App quyền truy cập Azure SQL?
  - **A**: Gán vai trò "SQL DB Contributor" hoặc cấu hình xác thực Azure AD cho SQL

**Xác minh thực hành:**
```bash
# Tìm vai trò cụ thể
az role definition list --name "Storage Blob Data Contributor"

# Kiểm tra các vai trò được gán cho danh tính của bạn
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Tích hợp Key Vault ✓
- [ ] **Q1**: Làm thế nào để bật RBAC cho Key Vault thay vì các chính sách truy cập?
  - **A**: Đặt `enableRbacAuthorization: true` trong Bicep

- [ ] **Q2**: Thư viện Azure SDK nào xử lý xác thực Managed Identity?
  - **A**: `@azure/identity` với lớp `DefaultAzureCredential`

- [ ] **Q3**: Bí mật Key Vault được giữ trong bộ nhớ đệm bao lâu?
  - **A**: Tùy thuộc vào ứng dụng; triển khai chiến lược bộ nhớ đệm của riêng bạn

**Hands-On Verification:**
```bash
# Kiểm tra truy cập Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Kiểm tra RBAC đã được bật
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Mong đợi: true
```

---

## Thực tiễn bảo mật tốt nhất

### ✅ NÊN LÀM:

1. **Luôn sử dụng Managed Identity trong môi trường sản xuất**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Sử dụng các vai trò RBAC với nguyên tắc ít quyền nhất**
   - Sử dụng vai trò "Reader" khi có thể
   - Tránh sử dụng "Owner" hoặc "Contributor" trừ khi cần thiết

3. **Lưu khóa bên thứ ba trong Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Bật ghi nhật ký kiểm toán**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Sử dụng các định danh khác nhau cho dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Xoay vòng bí mật thường xuyên**
   - Đặt ngày hết hạn cho các bí mật trong Key Vault
   - Tự động hóa việc xoay vòng với Azure Functions

### ❌ KHÔNG NÊN:

1. **Không bao giờ nhúng bí mật vào mã nguồn**
   ```javascript
   // ❌ XẤU
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Không sử dụng chuỗi kết nối trong môi trường sản xuất**
   ```javascript
   // ❌ XẤU
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Không cấp quyền quá mức**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Không ghi nhật ký bí mật**
   ```javascript
   // ❌ KHÔNG TỐT
   console.log('API Key:', apiKey);
   
   // ✅ TỐT
   console.log('API Key retrieved successfully');
   ```

5. **Không chia sẻ định danh sản xuất giữa các môi trường**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Hướng dẫn khắc phục sự cố

### Vấn đề: "Unauthorized" khi truy cập Azure Storage

**Triệu chứng:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Chẩn đoán:**

```bash
# Kiểm tra xem Managed Identity có được bật hay không
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Mong đợi: "SystemAssigned" hoặc "UserAssigned"

# Kiểm tra phân công vai trò
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Mong đợi: Nên thấy "Storage Blob Data Contributor" hoặc vai trò tương tự
```

**Giải pháp:**

1. **Cấp đúng vai trò RBAC:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Chờ cho thay đổi lan truyền (có thể mất 5-10 phút):**
```bash
# Kiểm tra trạng thái gán vai trò
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Xác minh mã ứng dụng đang sử dụng thông tin xác thực đúng:**
```javascript
// Hãy đảm bảo bạn đang sử dụng DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Vấn đề: Truy cập Key Vault bị từ chối

**Triệu chứng:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Chẩn đoán:**

```bash
# Kiểm tra RBAC của Key Vault đã được bật
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Kỳ vọng: true

# Kiểm tra chỉ định vai trò
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Giải pháp:**

1. **Bật RBAC trên Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Cấp vai trò Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Vấn đề: DefaultAzureCredential không hoạt động cục bộ

**Triệu chứng:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Chẩn đoán:**

```bash
# Kiểm tra xem bạn đã đăng nhập chưa
az account show

# Kiểm tra xác thực Azure CLI
az ad signed-in-user show
```

**Giải pháp:**

1. **Đăng nhập vào Azure CLI:**
```bash
az login
```

2. **Đặt subscription Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Đối với phát triển cục bộ, sử dụng biến môi trường:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Hoặc sử dụng thông tin xác thực khác khi chạy cục bộ:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Sử dụng AzureCliCredential cho phát triển cục bộ
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Vấn đề: Việc gán vai trò mất quá nhiều thời gian để lan truyền

**Triệu chứng:**
- Vai trò đã được gán thành công
- Vẫn nhận lỗi 403
- Truy cập không ổn định (đôi khi hoạt động, đôi khi không)

**Giải thích:**
Các thay đổi RBAC của Azure có thể mất 5-10 phút để lan truyền trên toàn cầu.

**Giải pháp:**

```bash
# Chờ và thử lại
echo "Waiting for RBAC propagation..."
sleep 300  # Chờ 5 phút

# Kiểm tra truy cập
curl https://myapp.azurecontainerapps.io/upload

# Nếu vẫn thất bại, khởi động lại ứng dụng
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Cân nhắc chi phí

### Chi phí Managed Identity

| Tài nguyên | Chi phí |
|----------|------|
| **Managed Identity** | 🆓 **MIỄN PHÍ** - Không tính phí |
| **Gán vai trò RBAC** | 🆓 **MIỄN PHÍ** - Không tính phí |
| **Yêu cầu token Azure AD** | 🆓 **MIỄN PHÍ** - Đã bao gồm |
| **Hoạt động Key Vault** | $0.03 cho mỗi 10,000 thao tác |
| **Lưu trữ Key Vault** | $0.024 cho mỗi bí mật mỗi tháng |

**Managed identity giúp tiết kiệm chi phí bằng cách:**
- ✅ Loại bỏ các thao tác Key Vault cho xác thực dịch vụ-đến-dịch vụ
- ✅ Giảm sự cố bảo mật (không rò rỉ thông tin xác thực)
- ✅ Giảm chi phí vận hành (không cần xoay vòng thủ công)

**Ví dụ so sánh chi phí (hàng tháng):**

| Kịch bản | Chuỗi kết nối | Managed Identity | Tiết kiệm |
|----------|-------------------|-----------------|---------|
| Ứng dụng nhỏ (1M yêu cầu) | ~$50 (Key Vault + thao tác) | ~$0 | $50/tháng |
| Ứng dụng trung bình (10M yêu cầu) | ~$200 | ~$0 | $200/tháng |
| Ứng dụng lớn (100M yêu cầu) | ~$1,500 | ~$0 | $1,500/tháng |

---

## Tìm hiểu thêm

### Tài liệu chính thức
- [Managed Identity của Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Tài liệu SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Bước tiếp theo trong Khóa học này
- ← Trước: [Quản lý cấu hình](configuration.md)
- → Tiếp theo: [Dự án đầu tiên](first-project.md)
- 🏠 [Trang chủ khóa học](../../README.md)

### Ví dụ liên quan
- [Ví dụ Azure OpenAI Chat](../../../../examples/azure-openai-chat) - Sử dụng Managed Identity cho Azure OpenAI
- [Ví dụ Microservices](../../../../examples/microservices) - Mẫu xác thực đa dịch vụ

---

## Tóm tắt

**Bạn đã học:**
- ✅ Ba mô hình xác thực (chuỗi kết nối, Key Vault, Managed Identity)
- ✅ Cách bật và cấu hình Managed Identity trong AZD
- ✅ Gán vai trò RBAC cho các dịch vụ Azure
- ✅ Tích hợp Key Vault cho các bí mật bên thứ ba
- ✅ Định danh được gán bởi người dùng (user-assigned) vs định danh hệ thống (system-assigned)
- ✅ Thực tiễn bảo mật tốt nhất và khắc phục sự cố

**Những điểm chính:**
1. **Luôn sử dụng Managed Identity trong môi trường sản xuất** - Không có bí mật, xoay vòng tự động
2. **Sử dụng vai trò RBAC với nguyên tắc ít quyền nhất** - Chỉ cấp các quyền cần thiết
3. **Lưu khóa bên thứ ba trong Key Vault** - Quản lý bí mật tập trung
4. **Tách biệt định danh theo môi trường** - Cô lập dev, staging, prod
5. **Bật ghi nhật ký kiểm toán** - Theo dõi ai đã truy cập cái gì

**Bước tiếp theo:**
1. Hoàn thành các bài tập thực hành ở trên
2. Di chuyển một ứng dụng hiện có từ chuỗi kết nối sang Managed Identity
3. Xây dựng dự án AZD đầu tiên của bạn với bảo mật ngay từ đầu: [Dự án đầu tiên](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ nguyên bản nên được coi là nguồn có thẩm quyền. Đối với thông tin quan trọng, nên sử dụng bản dịch chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ sự hiểu nhầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
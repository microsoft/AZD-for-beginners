# Corak Pengesahan dan Identiti Terurus

⏱️ **Anggaran Masa**: 45-60 minit | 💰 **Imp ak Kos**: Percuma (tiada caj tambahan) | ⭐ **Kerumitan**: Sederhana

**📚 Laluan Pembelajaran:**
- ← Sebelumnya: [Pengurusan Konfigurasi](configuration.md) - Mengurus pembolehubah persekitaran dan rahsia
- 🎯 **Anda Di Sini**: Pengesahan & Keselamatan (Managed Identity, Key Vault, corak selamat)
- → Seterusnya: [Projek Pertama](first-project.md) - Bina aplikasi AZD pertama anda
- 🏠 [Laman Utama Kursus](../../README.md)

---

## Apa Yang Akan Anda Pelajari

Dengan menyelesaikan pelajaran ini, anda akan:
- Memahami corak pengesahan Azure (kunci, connection strings, identiti terurus)
- Melaksanakan **Identiti Terurus** untuk pengesahan tanpa kata laluan
- Melindungi rahsia dengan integrasi **Azure Key Vault**
- Menyediakan **kawalan akses berasaskan peranan (RBAC)** untuk penyebaran AZD
- Mengaplikasikan amalan keselamatan terbaik dalam Container Apps dan perkhidmatan Azure
- Migrasi daripada pengesahan berasaskan kunci ke pengesahan berasaskan identiti

## Mengapa Identiti Terurus Penting

### Masalah: Pengesahan Tradisional

**Sebelum Identiti Terurus:**
```javascript
// ❌ RISIKO KESELAMATAN: Rahsia dimasukkan terus ke dalam kod
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Masalah:**
- 🔴 **Rahsia terdedah** dalam kod, fail konfigurasi, pembolehubah persekitaran
- 🔴 **Putaran kelayakan** memerlukan perubahan kod dan penyebaran semula
- 🔴 **Pembukuan audit yang sukar** - siapa mengakses apa, bila?
- 🔴 **Sebaran** - rahsia berselerak di pelbagai sistem
- 🔴 **Risiko pematuhan** - gagal audit keselamatan

### Penyelesaian: Identiti Terurus

**Selepas Identiti Terurus:**
```javascript
// ✅ AMAN: Tiada rahsia dalam kod
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure mengendalikan pengesahan secara automatik
);
```

**Manfaat:**
- ✅ **Tiada rahsia** dalam kod atau konfigurasi
- ✅ **Putaran automatik** - Azure yang mengendalikannya
- ✅ **Jejak audit penuh** dalam log Azure AD
- ✅ **Keselamatan berpusat** - urus dalam Azure Portal
- ✅ **Sedia pematuhan** - memenuhi piawaian keselamatan

**Analogi**: Pengesahan tradisional seperti membawa beberapa kunci fizikal untuk pintu berbeza. Identiti Terurus seperti mempunyai lencana keselamatan yang secara automatik membenarkan akses berdasarkan siapa anda—tiada kunci untuk hilang, salin, atau diputar.

---

## Gambaran Seni Bina

### Aliran Pengesahan dengan Identiti Terurus

```mermaid
sequenceDiagram
    participant App as Aplikasi Anda<br/>(Aplikasi Kontena)
    participant MI as Identiti Terurus<br/>(Azure AD)
    participant KV as Peti Kunci
    participant Storage as Penyimpanan Azure
    participant DB as Azure SQL
    
    App->>MI: Meminta token akses<br/>(automatik)
    MI->>MI: Sahkan identiti<br/>(tanpa kata laluan diperlukan)
    MI-->>App: Kembalikan token<br/>(sah 1 jam)
    
    App->>KV: Dapatkan rahsia<br/>(menggunakan token)
    KV->>KV: Periksa kebenaran RBAC
    KV-->>App: Kembalikan nilai rahsia
    
    App->>Storage: Muat naik blob<br/>(menggunakan token)
    Storage->>Storage: Periksa kebenaran RBAC
    Storage-->>App: Berjaya
    
    App->>DB: Pertanyaan data<br/>(menggunakan token)
    DB->>DB: Periksa kebenaran SQL
    DB-->>App: Kembalikan keputusan
    
    Note over App,DB: Semua pengesahan tanpa kata laluan!
```
### Jenis Identiti Terurus

```mermaid
graph TB
    MI[Identiti Terurus]
    SystemAssigned[Identiti Ditugaskan oleh Sistem]
    UserAssigned[Identiti Ditugaskan oleh Pengguna]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Kitaran hayat terikat kepada sumber]
    SystemAssigned --> SA2[Penciptaan/penghapusan automatik]
    SystemAssigned --> SA3[Terbaik untuk satu sumber]
    
    UserAssigned --> UA1[Kitaran hayat bebas]
    UserAssigned --> UA2[Penciptaan/penghapusan manual]
    UserAssigned --> UA3[Dikongsi antara sumber]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Feature | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Lifecycle** | Tied to resource | Independent |
| **Creation** | Automatic with resource | Manual creation |
| **Deletion** | Deleted with resource | Persists after resource deletion |
| **Sharing** | One resource only | Multiple resources |
| **Use Case** | Simple scenarios | Complex multi-resource scenarios |
| **AZD Default** | ✅ Recommended | Optional |

---

## Prasyarat

### Alat Diperlukan

Anda sepatutnya telah memasang ini dari pelajaran sebelumnya:

```bash
# Sahkan Azure Developer CLI
azd version
# ✅ Diharapkan: azd versi 1.0.0 atau lebih tinggi

# Sahkan Azure CLI
az --version
# ✅ Diharapkan: azure-cli versi 2.50.0 atau lebih tinggi
```

### Keperluan Azure

- Langganan Azure aktif
- Kebenaran untuk:
  - Membuat identiti terurus
  - Menetapkan peranan RBAC
  - Membuat sumber Key Vault
  - Menyebarkan Container Apps

### Prasyarat Pengetahuan

Anda sepatutnya telah menyelesaikan:
- [Installation Guide](installation.md) - Penyediaan AZD
- [AZD Basics](azd-basics.md) - Konsep teras
- [Configuration Management](configuration.md) - Pembolehubah persekitaran

---

## Pelajaran 1: Memahami Corak Pengesahan

### Corak 1: Connection Strings (Warisan - Elakkan)

**Bagaimana ia berfungsi:**
```bash
# Rentetan sambungan mengandungi kredensial
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Masalah:**
- ❌ Rahsia kelihatan dalam pembolehubah persekitaran
- ❌ Dicatat dalam sistem penyebaran
- ❌ Sukar untuk diputar
- ❌ Tiada jejak audit akses

**Bila untuk digunakan:** Hanya untuk pembangunan tempatan, jangan pernah di pengeluaran.

---

### Corak 2: Rujukan Key Vault (Lebih Baik)

**Bagaimana ia berfungsi:**
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

**Manfaat:**
- ✅ Rahsia disimpan dengan selamat dalam Key Vault
- ✅ Pengurusan rahsia berpusat
- ✅ Putaran tanpa perubahan kod

**Had:**
- ⚠️ Masih menggunakan kunci/katalaluan
- ⚠️ Perlu mengurus akses Key Vault

**Bila untuk digunakan:** Langkah peralihan daripada connection strings ke identiti terurus.

---

### Corak 3: Identiti Terurus (Amalan Terbaik)

**Bagaimana ia berfungsi:**
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

**Kod aplikasi:**
```javascript
// Tiada rahsia diperlukan!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Manfaat:**
- ✅ Tiada rahsia dalam kod/konfigurasi
- ✅ Putaran kelayakan automatik
- ✅ Jejak audit penuh
- ✅ Kebenaran berasaskan RBAC
- ✅ Sedia pematuhan

**Bila untuk digunakan:** Sentiasa, untuk aplikasi pengeluaran.

---

## Pelajaran 2: Melaksanakan Identiti Terurus dengan AZD

### Pelaksanaan Langkah demi Langkah

Mari bina Container App yang selamat yang menggunakan identiti terurus untuk mengakses Azure Storage dan Key Vault.

### Struktur Projek

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

### 1. Konfigurasikan AZD (azure.yaml)

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

### 2. Infrastruktur: Aktifkan Identiti Terurus

**Fail: `infra/main.bicep`**

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

### 3. Container App dengan Identiti Ditugaskan Sistem

**Fail: `infra/app/container-app.bicep`**

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

### 4. Modul Penetapan Peranan RBAC

**Fail: `infra/core/role-assignment.bicep`**

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

### 5. Kod Aplikasi dengan Identiti Terurus

**Fail: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inisialisasi kelayakan (berfungsi secara automatik dengan identiti terurus)
const credential = new DefaultAzureCredential();

// Persediaan Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Tiada kunci diperlukan!
);

// Persediaan Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Tiada kunci diperlukan!
);

// Pemeriksaan kesihatan
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Muat naik fail ke penyimpanan blob
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

// Dapatkan rahsia daripada Key Vault
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

// Senaraikan kontena blob (menunjukkan akses baca)
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

**Fail: `src/package.json`**

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

### 6. Sebarkan dan Uji

```bash
# Inisialisasikan persekitaran AZD
azd init

# Sebarkan infrastruktur dan aplikasi
azd up

# Dapatkan URL aplikasi
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Uji pemeriksaan kesihatan
curl $APP_URL/health
```

**✅ Output yang dijangkakan:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Uji muat naik blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Output yang dijangkakan:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Uji penyenaraian container:**
```bash
curl $APP_URL/containers
```

**✅ Output yang dijangkakan:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Peranan RBAC Azure Biasa

### ID Peranan terbina untuk Identiti Terurus

| Service | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Read blobs and containers |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Read, write, delete blobs |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Read, write, delete queue messages |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Read secrets |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Read, write, delete secrets |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Read Cosmos DB data |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Read, write Cosmos DB data |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Manage SQL databases |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Send, receive, manage messages |

### Cara Menemukan ID Peranan

```bash
# Senaraikan semua peranan terbina dalam
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Cari peranan tertentu
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Dapatkan butiran peranan
az role definition list --name "Storage Blob Data Contributor"
```

---

## Latihan Amali

### Latihan 1: Aktifkan Identiti Terurus untuk Aplikasi Sedia Ada ⭐⭐ (Sederhana)

**Matlamat**: Tambah identiti terurus kepada penyebaran Container App sedia ada

**Senario**: Anda mempunyai Container App yang menggunakan connection strings. Tukarkannya kepada identiti terurus.

**Titik Permulaan**: Container App dengan konfigurasi ini:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Langkah-langkah**:

1. **Aktifkan identiti terurus dalam Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Berikan akses Storage:**

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

3. **Kemas kini kod aplikasi:**

**Sebelum (connection string):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Selepas (identiti terurus):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Kemas kini pembolehubah persekitaran:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Sebarkan dan uji:**

```bash
# Sebarkan semula
azd up

# Uji sama ada ia masih berfungsi
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Kriteria Kejayaan:**
- ✅ Aplikasi disebarkan tanpa ralat
- ✅ Operasi Storage berfungsi (muat naik, senaraikan, muat turun)
- ✅ Tiada connection strings dalam pembolehubah persekitaran
- ✅ Identiti kelihatan dalam Azure Portal di bawah panel "Identity"

**Pengesahan:**

```bash
# Periksa sama ada identiti terurus diaktifkan
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Dijangka: "SystemAssigned"

# Periksa penugasan peranan
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Dijangka: Menunjukkan peranan "Storage Blob Data Contributor"
```

**Masa**: 20-30 minit

---

### Latihan 2: Akses Berbilang Perkhidmatan dengan Identiti Ditugaskan Pengguna ⭐⭐⭐ (Mahir)

**Matlamat**: Buat identiti ditugaskan pengguna yang dikongsi merentasi berbilang Container Apps

**Senario**: Anda mempunyai 3 perkhidmatan mikro yang semua memerlukan akses ke akaun Storage dan Key Vault yang sama.

**Langkah-langkah**:

1. **Buat identiti ditugaskan pengguna:**

**Fail: `infra/core/identity.bicep`**

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

2. **Tetapkan peranan kepada identiti ditugaskan pengguna:**

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

3. **Tugaskan identiti kepada berbilang Container Apps:**

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

4. **Kod aplikasi (semua perkhidmatan menggunakan corak yang sama):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Untuk identiti yang ditetapkan pengguna, nyatakan ID klien
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID klien identiti yang ditetapkan pengguna
);

// Atau gunakan DefaultAzureCredential (mengesan secara automatik)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Sebarkan dan sahkan:**

```bash
azd up

# Uji sama ada semua perkhidmatan boleh mengakses storan
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Kriteria Kejayaan:**
- ✅ Satu identiti dikongsi merentasi 3 perkhidmatan
- ✅ Semua perkhidmatan boleh mengakses Storage dan Key Vault
- ✅ Identiti kekal jika anda memadam salah satu perkhidmatan
- ✅ Pengurusan kebenaran berpusat

**Manfaat Identiti Ditugaskan Pengguna:**
- Satu identiti untuk diurus
- Kebenaran konsisten merentasi perkhidmatan
- Kekal selepas pemadaman perkhidmatan
- Lebih baik untuk seni bina kompleks

**Masa**: 30-40 minit

---

### Latihan 3: Laksanakan Putaran Rahsia Key Vault ⭐⭐⭐ (Mahir)

**Matlamat**: Simpan kunci API pihak ketiga dalam Key Vault dan aksesnya menggunakan identiti terurus

**Senario**: Aplikasi anda perlu memanggil API luar (OpenAI, Stripe, SendGrid) yang memerlukan kunci API.

**Langkah-langkah**:

1. **Buat Key Vault dengan RBAC:**

**Fail: `infra/core/keyvault.bicep`**

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

2. **Simpan rahsia dalam Key Vault:**

```bash
# Dapatkan nama Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Simpan kunci API pihak ketiga
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

3. **Kod aplikasi untuk mendapatkan rahsia:**

**Fail: `src/config.js`**

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
    // Periksa cache terlebih dahulu
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

4. **Gunakan rahsia dalam aplikasi:**

**Fail: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inisialisasi OpenAI dengan kunci daripada Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Panggil semasa permulaan
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

5. **Sebarkan dan uji:**

```bash
azd up

# Uji bahawa kunci API berfungsi
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Kriteria Kejayaan:**
- ✅ Tiada kunci API dalam kod atau pembolehubah persekitaran
- ✅ Aplikasi mengambil kunci dari Key Vault
- ✅ API pihak ketiga berfungsi dengan betul
- ✅ Boleh memutar kunci tanpa perubahan kod

**Putarkan satu rahsia:**

```bash
# Kemas kini rahsia dalam Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Mulakan semula aplikasi untuk menggunakan kunci baru
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Masa**: 25-35 minit

---

## Pemeriksaan Pengetahuan

### 1. Corak Pengesahan ✓

Uji pemahaman anda:

- [ ] **Q1**: Apakah tiga corak pengesahan utama? 
  - **A**: Connection strings (warisan), Rujukan Key Vault (peralihan), Identiti Terurus (terbaik)

- [ ] **Q2**: Mengapa identiti terurus lebih baik daripada connection strings?
  - **A**: Tiada rahsia dalam kod, putaran automatik, jejak audit penuh, kebenaran RBAC

- [ ] **Q3**: Bilakah anda akan menggunakan identiti ditugaskan pengguna berbanding ditugaskan sistem?
  - **A**: Apabila berkongsi identiti merentasi berbilang sumber atau bila kitar hayat identiti adalah bebas daripada kitar hayat sumber

**Pengesahan Amali:**
```bash
# Periksa jenis identiti yang digunakan oleh aplikasi anda
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Senaraikan semua penugasan peranan untuk identiti tersebut
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC dan Kebenaran ✓

Uji pemahaman anda:

- [ ] **Q1**: Apakah ID peranan untuk "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: Apakah kebenaran yang diberikan oleh "Key Vault Secrets User"?
  - **A**: Akses baca sahaja kepada rahsia (tidak boleh membuat, mengemas kini, atau memadam)

- [ ] **Q3**: Bagaimana anda memberi Container App akses ke Azure SQL?
  - **A**: Tetapkan peranan "SQL DB Contributor" atau konfigurasikan pengesahan Azure AD untuk SQL

**Pengesahan Amali:**
```bash
# Cari peranan tertentu
az role definition list --name "Storage Blob Data Contributor"

# Semak peranan yang ditugaskan kepada identiti anda
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrasi Key Vault ✓

Test your understanding:
- [ ] **Q1**: Bagaimana anda mengaktifkan RBAC untuk Key Vault daripada polisi akses?
  - **A**: Tetapkan `enableRbacAuthorization: true` dalam Bicep

- [ ] **Q2**: Perpustakaan SDK Azure manakah yang mengendalikan pengesahan identiti terurus?
  - **A**: `@azure/identity` dengan kelas `DefaultAzureCredential`

- [ ] **Q3**: Berapa lama rahsia Key Vault disimpan dalam cache?
  - **A**: Bergantung pada aplikasi; laksanakan strategi cache anda sendiri

**Pengesahan Praktikal:**
```bash
# Uji akses Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Semak sama ada RBAC diaktifkan
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Dijangka: benar
```

---

## Amalan Terbaik Keselamatan

### ✅ LAKUKAN:

1. **Sentiasa gunakan identiti terurus dalam pengeluaran**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Gunakan peranan RBAC dengan keistimewaan paling rendah**
   - Gunakan peranan "Reader" bila mungkin
   - Elakkan "Owner" atau "Contributor" melainkan perlu

3. **Simpan kunci pihak ketiga dalam Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Dayakan log audit**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Gunakan identiti berbeza untuk dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Putarkan rahsia secara berkala**
   - Tetapkan tarikh luput pada rahsia Key Vault
   - Automatikkan putaran dengan Azure Functions

### ❌ JANGAN:

1. **Jangan pernah menyematkan rahsia secara hardcode**
   ```javascript
   // ❌ BURUK
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Jangan gunakan rentetan sambungan (connection strings) dalam pengeluaran**
   ```javascript
   // ❌ BURUK
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Jangan berikan kebenaran yang berlebihan**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Jangan logkan rahsia**
   ```javascript
   // ❌ BURUK
   console.log('API Key:', apiKey);
   
   // ✅ BAIK
   console.log('API Key retrieved successfully');
   ```

5. **Jangan kongsi identiti pengeluaran merentasi persekitaran**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Panduan Penyelesaian Masalah

### Masalah: "Unauthorized" semasa mengakses Azure Storage

**Gejala:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnosis:**

```bash
# Periksa sama ada Managed Identity diaktifkan
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Dijangka: "SystemAssigned" atau "UserAssigned"

# Periksa penugasan peranan
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Dijangka: Perlu melihat "Storage Blob Data Contributor" atau peranan serupa
```

**Penyelesaian:**

1. **Berikan peranan RBAC yang betul:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Tunggu untuk propagasi (boleh mengambil masa 5-10 minit):**
```bash
# Semak status pelantikan peranan
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Sahkan kod aplikasi menggunakan kredensial yang betul:**
```javascript
// Pastikan anda menggunakan DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Masalah: Akses Key Vault ditolak

**Gejala:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnosis:**

```bash
# Periksa sama ada RBAC Key Vault diaktifkan
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Dijangka: benar

# Periksa penugasan peranan
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Penyelesaian:**

1. **Aktifkan RBAC pada Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Berikan peranan Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Masalah: DefaultAzureCredential gagal secara tempatan

**Gejala:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnosis:**

```bash
# Periksa sama ada anda telah log masuk
az account show

# Periksa pengesahan Azure CLI
az ad signed-in-user show
```

**Penyelesaian:**

1. **Log masuk ke Azure CLI:**
```bash
az login
```

2. **Tetapkan langganan Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Untuk pembangunan tempatan, gunakan pembolehubah persekitaran:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Atau gunakan kredensial yang berbeza secara tempatan:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Gunakan AzureCliCredential untuk pembangunan tempatan
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Masalah: Penugasan peranan mengambil masa terlalu lama untuk tersebar

**Gejala:**
- Peranan berjaya ditugaskan
- Masih mendapat ralat 403
- Akses tidak konsisten (kadang berjaya, kadang tidak)

**Penjelasan:**
Perubahan RBAC Azure boleh mengambil masa 5-10 minit untuk tersebar secara global.

**Penyelesaian:**

```bash
# Tunggu dan cuba semula
echo "Waiting for RBAC propagation..."
sleep 300  # Tunggu 5 minit

# Uji akses
curl https://myapp.azurecontainerapps.io/upload

# Jika masih gagal, mulakan semula aplikasi
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Pertimbangan Kos

### Kos Identiti Terurus

| Sumber | Kos |
|----------|------|
| **Identiti Terurus** | 🆓 **PERCUMA** - Tiada caj |
| **Penugasan Peranan RBAC** | 🆓 **PERCUMA** - Tiada caj |
| **Permintaan Token Azure AD** | 🆓 **PERCUMA** - Termasuk |
| **Operasi Key Vault** | $0.03 per 10,000 operasi |
| **Storan Key Vault** | $0.024 setiap rahsia setiap bulan |

**Identiti terurus menjimatkan wang dengan:**
- ✅ Menghapuskan operasi Key Vault untuk pengesahan perkhidmatan-ke-perkhidmatan
- ✅ Mengurangkan insiden keselamatan (tiada kredensial tertiris)
- ✅ Mengurangkan beban operasi (tiada putaran manual)

**Perbandingan Kos Contoh (bulanan):**

| Senario | Rentetan Sambungan | Identiti Terurus | Penjimatan |
|----------|-------------------|-----------------|---------|
| Apl kecil (1M permintaan) | ~$50 (Key Vault + operasi) | ~$0 | $50/bulan |
| Apl sederhana (10M permintaan) | ~$200 | ~$0 | $200/bulan |
| Apl besar (100M permintaan) | ~$1,500 | ~$0 | $1,500/bulan |

---

## Ketahui Lebih Lanjut

### Dokumentasi Rasmi
- [Identiti Terurus Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Dokumentasi SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Langkah Seterusnya dalam Kursus Ini
- ← Sebelumnya: [Pengurusan Konfigurasi](configuration.md)
- → Seterusnya: [Projek Pertama](first-project.md)
- 🏠 [Laman Utama Kursus](../../README.md)

### Contoh Berkaitan
- [Contoh Sembang Azure OpenAI](../../../../examples/azure-openai-chat) - Menggunakan identiti terurus untuk Azure OpenAI
- [Contoh Mikroservis](../../../../examples/microservices) - Corak pengesahan berbilang perkhidmatan

---

## Ringkasan

**Anda telah belajar:**
- ✅ Tiga corak pengesahan (rentetan sambungan, Key Vault, identiti terurus)
- ✅ Cara mengaktifkan dan mengkonfigurasi identiti terurus dalam AZD
- ✅ Penugasan peranan RBAC untuk perkhidmatan Azure
- ✅ Integrasi Key Vault untuk rahsia pihak ketiga
- ✅ Identiti yang ditetapkan pengguna vs identiti yang ditetapkan sistem
- ✅ Amalan terbaik keselamatan dan penyelesaian masalah

**Perkara Utama:**
1. **Sentiasa gunakan identiti terurus dalam pengeluaran** - Tiada rahsia, putaran automatik
2. **Gunakan peranan RBAC dengan keistimewaan paling rendah** - Berikan hanya kebenaran yang diperlukan
3. **Simpan kunci pihak ketiga dalam Key Vault** - Pengurusan rahsia berpusat
4. **Pisahkan identiti mengikut persekitaran** - Pengasingan dev, staging, prod
5. **Dayakan log audit** - Jejak siapa mengakses apa

**Langkah Seterusnya:**
1. Lengkapkan latihan praktikal di atas
2. Migrasikan aplikasi sedia ada daripada rentetan sambungan kepada identiti terurus
3. Bina projek AZD pertama anda dengan keselamatan sejak hari pertama: [Projek Pertama](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang muktamad. Untuk maklumat yang penting, disyorkan mendapatkan terjemahan profesional daripada penterjemah manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
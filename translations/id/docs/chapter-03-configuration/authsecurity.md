# Authentication Patterns and Managed Identity

⏱️ **Perkiraan Waktu**: 45-60 menit | 💰 **Dampak Biaya**: Gratis (tanpa biaya tambahan) | ⭐ **Kompleksitas**: Menengah

**📚 Jalur Pembelajaran:**
- ← Sebelumnya: [Configuration Management](configuration.md) - Mengelola variabel lingkungan dan rahasia
- 🎯 **Anda Berada Di Sini**: Authentication & Security (Managed Identity, Key Vault, pola aman)
- → Berikutnya: [First Project](first-project.md) - Bangun aplikasi AZD pertama Anda
- 🏠 [Course Home](../../README.md)

---

## Apa yang Akan Anda Pelajari

Dengan menyelesaikan pelajaran ini, Anda akan:
- Memahami pola autentikasi Azure (kunci, connection string, managed identity)
- Menerapkan **Managed Identity** untuk autentikasi tanpa kata sandi
- Mengamankan rahasia dengan integrasi **Azure Key Vault**
- Mengonfigurasi **role-based access control (RBAC)** untuk deployment AZD
- Menerapkan praktik keamanan terbaik di Container Apps dan layanan Azure
- Migrasi dari autentikasi berbasis kunci ke berbasis identitas

## Mengapa Managed Identity Penting

### Masalah: Autentikasi Tradisional

**Sebelum Managed Identity:**
```javascript
// ❌ RISIKO KEAMANAN: Rahasia tertanam langsung di dalam kode
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Masalah:**
- 🔴 **Rahasia terekspos** di kode, file konfigurasi, variabel lingkungan
- 🔴 **Rotasi kredensial** memerlukan perubahan kode dan redeploy
- 🔴 **Audit yang berantakan** - siapa mengakses apa, kapan?
- 🔴 **Sebaran** - rahasia tersebar di banyak sistem
- 🔴 **Risiko kepatuhan** - gagal audit keamanan

### Solusi: Managed Identity

**Setelah Managed Identity:**
```javascript
// ✅ AMAN: Tidak ada rahasia dalam kode
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure secara otomatis menangani otentikasi
);
```

**Manfaat:**
- ✅ **Tidak ada rahasia** dalam kode atau konfigurasi
- ✅ **Rotasi otomatis** - Azure yang mengelola
- ✅ **Jejak audit penuh** di log Azure AD
- ✅ **Keamanan terpusat** - kelola di Azure Portal
- ✅ **Siap kepatuhan** - memenuhi standar keamanan

**Analogi**: Autentikasi tradisional seperti membawa banyak kunci fisik untuk pintu yang berbeda. Managed Identity seperti memiliki kartu keamanan yang otomatis memberi akses berdasarkan siapa Anda—tidak ada kunci yang bisa hilang, disalin, atau diputar.

---

## Ikhtisar Arsitektur

### Alur Autentikasi dengan Managed Identity

```mermaid
sequenceDiagram
    participant App as Aplikasi Anda<br/>(Aplikasi Kontainer)
    participant MI as Identitas Terkelola<br/>(Azure AD)
    participant KV as Brankas Kunci
    participant Storage as Azure Storage
    participant DB as Azure SQL
    
    App->>MI: Minta token akses<br/>(otomatis)
    MI->>MI: Verifikasi identitas<br/>(tanpa perlu kata sandi)
    MI-->>App: Kembalikan token<br/>(berlaku 1 jam)
    
    App->>KV: Ambil rahasia<br/>(menggunakan token)
    KV->>KV: Periksa izin RBAC
    KV-->>App: Kembalikan nilai rahasia
    
    App->>Storage: Unggah blob<br/>(menggunakan token)
    Storage->>Storage: Periksa izin RBAC
    Storage-->>App: Berhasil
    
    App->>DB: Minta data<br/>(menggunakan token)
    DB->>DB: Periksa izin SQL
    DB-->>App: Kembalikan hasil
    
    Note over App,DB: Semua autentikasi tanpa kata sandi!
```
### Jenis Managed Identity

```mermaid
graph TB
    MI[Identitas Terkelola]
    SystemAssigned[Identitas yang Ditugaskan oleh Sistem]
    UserAssigned[Identitas yang Ditugaskan oleh Pengguna]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Siklus hidup terkait sumber daya]
    SystemAssigned --> SA2[Pembuatan dan penghapusan otomatis]
    SystemAssigned --> SA3[Cocok untuk satu sumber daya]
    
    UserAssigned --> UA1[Siklus hidup independen]
    UserAssigned --> UA2[Pembuatan dan penghapusan manual]
    UserAssigned --> UA3[Dibagikan antar sumber daya]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Fitur | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Siklus Hidup** | Terikat ke sumber daya | Independen |
| **Pembuatan** | Otomatis dengan sumber daya | Pembuatan manual |
| **Penghapusan** | Dihapus dengan sumber daya | Bertahan setelah sumber daya dihapus |
| **Berbagi** | Hanya satu sumber daya | Banyak sumber daya |
| **Kasus Penggunaan** | Skenario sederhana | Skenario kompleks multi-sumber daya |
| **Default AZD** | ✅ Direkomendasikan | Opsional |

---

## Prasyarat

### Alat yang Diperlukan

Anda seharusnya sudah menginstal ini dari pelajaran sebelumnya:

```bash
# Verifikasi Azure Developer CLI
azd version
# ✅ Diharapkan: azd versi 1.0.0 atau lebih tinggi

# Verifikasi Azure CLI
az --version
# ✅ Diharapkan: azure-cli 2.50.0 atau lebih tinggi
```

### Persyaratan Azure

- Langganan Azure aktif
- Izin untuk:
  - Membuat managed identities
  - Menetapkan peran RBAC
  - Membuat sumber daya Key Vault
  - Mendeploy Container Apps

### Prasyarat Pengetahuan

Anda seharusnya telah menyelesaikan:
- [Installation Guide](installation.md) - Pengaturan AZD
- [AZD Basics](azd-basics.md) - Konsep inti
- [Configuration Management](configuration.md) - Variabel lingkungan

---

## Pelajaran 1: Memahami Pola Autentikasi

### Pola 1: Connection Strings (Warisan - Hindari)

**Bagaimana cara kerjanya:**
```bash
# String koneksi berisi kredensial
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Masalah:**
- ❌ Rahasia terlihat di variabel lingkungan
- ❌ Tercatat di sistem deployment
- ❌ Sulit untuk diputar
- ❌ Tidak ada jejak audit akses

**Kapan digunakan:** Hanya untuk pengembangan lokal, jangan gunakan di produksi.

---

### Pola 2: Key Vault References (Lebih Baik)

**Bagaimana cara kerjanya:**
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
- ✅ Rahasia disimpan dengan aman di Key Vault
- ✅ Manajemen rahasia terpusat
- ✅ Rotasi tanpa perubahan kode

**Keterbatasan:**
- ⚠️ Masih menggunakan kunci/kata sandi
- ⚠️ Perlu mengelola akses Key Vault

**Kapan digunakan:** Langkah transisi dari connection strings ke managed identity.

---

### Pola 3: Managed Identity (Praktik Terbaik)

**Bagaimana cara kerjanya:**
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

**Kode aplikasi:**
```javascript
// Tidak perlu rahasia!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Manfaat:**
- ✅ Tidak ada rahasia di kode/konfigurasi
- ✅ Rotasi kredensial otomatis
- ✅ Jejak audit penuh
- ✅ Izin berbasis RBAC
- ✅ Siap untuk kepatuhan

**Kapan digunakan:** Selalu, untuk aplikasi produksi.

---

## Pelajaran 2: Menerapkan Managed Identity dengan AZD

### Implementasi Langkah-demi-Langkah

Mari bangun Container App yang aman yang menggunakan managed identity untuk mengakses Azure Storage dan Key Vault.

### Struktur Proyek

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

### 1. Konfigurasi AZD (azure.yaml)

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

### 2. Infrastruktur: Aktifkan Managed Identity

**Berkas: `infra/main.bicep`**

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

### 3. Container App dengan System-Assigned Identity

**Berkas: `infra/app/container-app.bicep`**

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

### 4. Modul Penetapan Peran RBAC

**Berkas: `infra/core/role-assignment.bicep`**

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

### 5. Kode Aplikasi dengan Managed Identity

**Berkas: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inisialisasi kredensial (berfungsi otomatis dengan identitas terkelola)
const credential = new DefaultAzureCredential();

// Pengaturan Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Tidak perlu kunci!
);

// Pengaturan Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Tidak perlu kunci!
);

// Pemeriksaan kesehatan
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Unggah file ke penyimpanan blob
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

// Ambil rahasia dari Key Vault
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

// Daftar kontainer blob (menunjukkan akses baca)
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

**Berkas: `src/package.json`**

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

### 6. Deploy dan Uji

```bash
# Inisialisasi lingkungan AZD
azd init

# Terapkan infrastruktur dan aplikasi
azd up

# Dapatkan URL aplikasi
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Uji pemeriksaan kesehatan
curl $APP_URL/health
```

**✅ Output yang diharapkan:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Uji upload blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Output yang diharapkan:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Uji listing container:**
```bash
curl $APP_URL/containers
```

**✅ Output yang diharapkan:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Peran RBAC Azure Umum

### ID Peran Bawaan untuk Managed Identity

| Layanan | Nama Peran | Role ID | Izin |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Membaca blob dan container |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Membaca, menulis, menghapus blob |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Membaca, menulis, menghapus pesan antrean |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Membaca rahasia |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Membaca, menulis, menghapus rahasia |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Membaca data Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Membaca, menulis data Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Mengelola database SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Mengirim, menerima, mengelola pesan |

### Cara Menemukan ID Peran

```bash
# Daftar semua peran bawaan
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Cari peran tertentu
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Dapatkan detail peran
az role definition list --name "Storage Blob Data Contributor"
```

---

## Latihan Praktis

### Latihan 1: Aktifkan Managed Identity untuk Aplikasi yang Ada ⭐⭐ (Menengah)

**Tujuan**: Tambahkan managed identity ke deployment Container App yang sudah ada

**Skenario**: Anda memiliki Container App yang menggunakan connection string. Konversi ke managed identity.

**Titik Awal**: Container App dengan konfigurasi ini:

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

1. **Aktifkan managed identity di Bicep:**

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

3. **Perbarui kode aplikasi:**

**Sebelum (connection string):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Sesudah (managed identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Perbarui variabel lingkungan:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Deploy dan uji:**

```bash
# Terapkan ulang
azd up

# Uji apakah itu masih berfungsi
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Kriteria Keberhasilan:**
- ✅ Aplikasi terdeploy tanpa error
- ✅ Operasi Storage berfungsi (upload, list, download)
- ✅ Tidak ada connection string di variabel lingkungan
- ✅ Identity terlihat di Azure Portal di bawah blade "Identity"

**Verifikasi:**

```bash
# Periksa apakah identitas terkelola diaktifkan
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Diharapkan: "SystemAssigned"

# Periksa penetapan peran
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Diharapkan: Menampilkan peran "Storage Blob Data Contributor"
```

**Waktu**: 20-30 menit

---

### Latihan 2: Akses Multi-Layanan dengan User-Assigned Identity ⭐⭐⭐ (Lanjutan)

**Tujuan**: Buat user-assigned identity yang dibagikan di beberapa Container App

**Skenario**: Anda memiliki 3 microservice yang semuanya membutuhkan akses ke akun Storage dan Key Vault yang sama.

**Langkah-langkah**:

1. **Buat user-assigned identity:**

**Berkas: `infra/core/identity.bicep`**

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

2. **Tetapkan peran ke user-assigned identity:**

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

3. **Tetapkan identity ke beberapa Container App:**

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

4. **Kode aplikasi (semua layanan menggunakan pola yang sama):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Untuk identitas yang ditetapkan oleh pengguna, tentukan ID klien
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID klien identitas yang ditetapkan oleh pengguna
);

// Atau gunakan DefaultAzureCredential (mendeteksi secara otomatis)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Deploy dan verifikasi:**

```bash
azd up

# Uji semua layanan dapat mengakses penyimpanan
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Kriteria Keberhasilan:**
- ✅ Satu identity dibagikan di 3 layanan
- ✅ Semua layanan dapat mengakses Storage dan Key Vault
- ✅ Identity bertahan jika Anda menghapus salah satu layanan
- ✅ Manajemen izin terpusat

**Manfaat User-Assigned Identity:**
- Satu identity untuk dikelola
- Izin konsisten di semua layanan
- Bertahan dari penghapusan layanan
- Lebih baik untuk arsitektur kompleks

**Waktu**: 30-40 menit

---

### Latihan 3: Terapkan Rotasi Rahasia Key Vault ⭐⭐⭐ (Lanjutan)

**Tujuan**: Simpan kunci API pihak ketiga di Key Vault dan akses menggunakan managed identity

**Skenario**: Aplikasi Anda perlu memanggil API eksternal (OpenAI, Stripe, SendGrid) yang memerlukan kunci API.

**Langkah-langkah**:

1. **Buat Key Vault dengan RBAC:**

**Berkas: `infra/core/keyvault.bicep`**

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

2. **Simpan rahasia di Key Vault:**

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

3. **Kode aplikasi untuk mengambil rahasia:**

**Berkas: `src/config.js`**

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

4. **Gunakan rahasia di aplikasi:**

**Berkas: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inisialisasi OpenAI dengan kunci dari Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Panggil saat startup
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

5. **Deploy dan uji:**

```bash
azd up

# Uji bahwa kunci API berfungsi
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Kriteria Keberhasilan:**
- ✅ Tidak ada kunci API di kode atau variabel lingkungan
- ✅ Aplikasi mengambil kunci dari Key Vault
- ✅ API pihak ketiga berfungsi dengan benar
- ✅ Dapat memutar kunci tanpa perubahan kode

**Rotasi sebuah rahasia:**

```bash
# Perbarui rahasia di Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Mulai ulang aplikasi agar menggunakan kunci baru
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Waktu**: 25-35 menit

---

## Titik Pemeriksaan Pengetahuan

### 1. Pola Autentikasi ✓

Uji pemahaman Anda:

- [ ] **Q1**: Apa tiga pola autentikasi utama? 
  - **A**: Connection strings (warisan), Key Vault references (transisi), Managed Identity (praktik terbaik)

- [ ] **Q2**: Mengapa managed identity lebih baik daripada connection strings?
  - **A**: Tidak ada rahasia di kode, rotasi otomatis, jejak audit penuh, izin berbasis RBAC

- [ ] **Q3**: Kapan Anda menggunakan user-assigned identity alih-alih system-assigned?
  - **A**: Saat membagikan identity di banyak sumber daya atau ketika siklus hidup identity independen dari siklus hidup sumber daya

**Verifikasi Praktis:**
```bash
# Periksa jenis identitas yang digunakan aplikasi Anda
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Daftar semua penugasan peran untuk identitas tersebut
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC dan Izin ✓

Uji pemahaman Anda:

- [ ] **Q1**: Apa ID peran untuk "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: Izin apa yang diberikan "Key Vault Secrets User"?
  - **A**: Akses baca saja ke rahasia (tidak dapat membuat, memperbarui, atau menghapus)

- [ ] **Q3**: Bagaimana Anda memberikan akses Container App ke Azure SQL?
  - **A**: Tetapkan peran "SQL DB Contributor" atau konfigurasikan autentikasi Azure AD untuk SQL

**Verifikasi Praktis:**
```bash
# Temukan peran tertentu
az role definition list --name "Storage Blob Data Contributor"

# Periksa peran apa yang ditetapkan pada identitas Anda
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrasi Key Vault ✓

Tinjau pemahaman Anda:
- [ ] **Q1**: Bagaimana Anda mengaktifkan RBAC untuk Key Vault alih-alih access policies?
  - **A**: Set `enableRbacAuthorization: true` in Bicep

- [ ] **Q2**: Perpustakaan Azure SDK mana yang menangani otentikasi managed identity?
  - **A**: `@azure/identity` dengan kelas `DefaultAzureCredential`

- [ ] **Q3**: Berapa lama rahasia Key Vault tetap di cache?
  - **A**: Bergantung pada aplikasi; terapkan strategi caching Anda sendiri

**Verifikasi Praktis:**
```bash
# Uji akses Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Periksa apakah RBAC diaktifkan
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Diharapkan: true
```

---

## Praktik Terbaik Keamanan

### ✅ LAKUKAN:

1. **Selalu gunakan managed identity di lingkungan produksi**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Gunakan peran RBAC dengan hak paling minimal**
   - Gunakan "Reader" roles bila memungkinkan
   - Hindari "Owner" atau "Contributor" kecuali diperlukan

3. **Simpan kunci pihak ketiga di Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Aktifkan pencatatan audit**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Gunakan identitas yang berbeda untuk dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rotasi rahasia secara berkala**
   - Tetapkan tanggal kedaluwarsa pada rahasia Key Vault
   - Otomatiskan rotasi dengan Azure Functions

### ❌ JANGAN:

1. **Jangan pernah meng-hardcode rahasia**
   ```javascript
   // ❌ BURUK
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Jangan menggunakan string koneksi di lingkungan produksi**
   ```javascript
   // ❌ BURUK
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Jangan memberikan izin berlebihan**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Jangan mencatat rahasia**
   ```javascript
   // ❌ BURUK
   console.log('API Key:', apiKey);
   
   // ✅ BAIK
   console.log('API Key retrieved successfully');
   ```

5. **Jangan membagikan identitas produksi antar lingkungan**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Panduan Pemecahan Masalah

### Masalah: "Unauthorized" saat mengakses Azure Storage

**Gejala:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnosa:**

```bash
# Periksa apakah identitas terkelola diaktifkan
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Diharapkan: "SystemAssigned" atau "UserAssigned"

# Periksa penugasan peran
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Diharapkan: Harus melihat "Storage Blob Data Contributor" atau peran serupa
```

**Solusi:**

1. **Berikan peran RBAC yang tepat:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Tunggu propagasi (dapat memakan waktu 5-10 menit):**
```bash
# Periksa status penugasan peran
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Verifikasi kode aplikasi menggunakan kredensial yang benar:**
```javascript
// Pastikan Anda menggunakan DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Masalah: Akses Key Vault ditolak

**Gejala:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnosa:**

```bash
# Periksa apakah RBAC Key Vault diaktifkan
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Diharapkan: true

# Periksa penugasan peran
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Solusi:**

1. **Aktifkan RBAC pada Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Berikan peran Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Masalah: DefaultAzureCredential gagal secara lokal

**Gejala:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnosa:**

```bash
# Periksa apakah Anda sudah masuk
az account show

# Periksa autentikasi Azure CLI
az ad signed-in-user show
```

**Solusi:**

1. **Masuk ke Azure CLI:**
```bash
az login
```

2. **Atur langganan Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Untuk pengembangan lokal, gunakan variabel lingkungan:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Atau gunakan kredensial yang berbeda secara lokal:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Gunakan AzureCliCredential untuk pengembangan lokal
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Masalah: Penetapan peran memakan waktu lama untuk dipropagasikan

**Gejala:**
- Peran berhasil ditetapkan
- Masih mendapatkan error 403
- Akses tidak konsisten (kadang berhasil, kadang tidak)

**Penjelasan:**
Perubahan RBAC Azure dapat membutuhkan 5-10 menit untuk dipropagasikan secara global.

**Solusi:**

```bash
# Tunggu dan coba lagi
echo "Waiting for RBAC propagation..."
sleep 300  # Tunggu 5 menit

# Uji akses
curl https://myapp.azurecontainerapps.io/upload

# Jika masih gagal, mulai ulang aplikasi
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Pertimbangan Biaya

### Biaya Managed Identity

| Sumber Daya | Biaya |
|----------|------|
| **Managed Identity** | 🆓 **GRATIS** - Tanpa biaya |
| **Penetapan Peran RBAC** | 🆓 **GRATIS** - Tanpa biaya |
| **Permintaan Token Azure AD** | 🆓 **GRATIS** - Termasuk |
| **Operasi Key Vault** | $0.03 per 10,000 operasi |
| **Penyimpanan Key Vault** | $0.024 per secret per month |

**Managed identity menghemat biaya dengan cara:**
- ✅ Menghilangkan operasi Key Vault untuk otentikasi layanan-ke-layanan
- ✅ Mengurangi insiden keamanan (tidak ada kredensial yang bocor)
- ✅ Mengurangi beban operasional (tanpa rotasi manual)

**Contoh Perbandingan Biaya (bulanan):**

| Skenario | String Koneksi | Managed Identity | Penghematan |
|----------|-------------------|-----------------|---------|
| Aplikasi kecil (1M requests) | ~$50 (Key Vault + operasi) | ~$0 | $50/bulan |
| Aplikasi menengah (10M requests) | ~$200 | ~$0 | $200/bulan |
| Aplikasi besar (100M requests) | ~$1,500 | ~$0 | $1,500/bulan |

---

## Pelajari Lebih Lanjut

### Dokumentasi Resmi
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK Documentation
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Langkah Selanjutnya di Kursus Ini
- ← Sebelumnya: [Configuration Management](configuration.md)
- → Berikutnya: [First Project](first-project.md)
- 🏠 [Beranda Kursus](../../README.md)

### Contoh Terkait
- [Microsoft Foundry Models Chat Example](../../../../examples/azure-openai-chat) - Menggunakan managed identity untuk Microsoft Foundry Models
- [Microservices Example](../../../../examples/microservices) - Pola otentikasi multi-layanan

---

## Ringkasan

**Anda telah mempelajari:**
- ✅ Tiga pola otentikasi (string koneksi, Key Vault, managed identity)
- ✅ Cara mengaktifkan dan mengonfigurasi managed identity di AZD
- ✅ Penetapan peran RBAC untuk layanan Azure
- ✅ Integrasi Key Vault untuk rahasia pihak ketiga
- ✅ Identitas yang ditugaskan pengguna vs identitas yang ditugaskan sistem
- ✅ Praktik terbaik keamanan dan pemecahan masalah

**Poin Penting:**
1. **Selalu gunakan managed identity di lingkungan produksi** - Tanpa rahasia, rotasi otomatis
2. **Gunakan peran RBAC dengan hak paling minimal** - Berikan hanya izin yang diperlukan
3. **Simpan kunci pihak ketiga di Key Vault** - Manajemen rahasia terpusat
4. **Pisahkan identitas per lingkungan** - Isolasi dev, staging, prod
5. **Aktifkan pencatatan audit** - Lacak siapa mengakses apa

**Langkah Selanjutnya:**
1. Selesaikan latihan praktis di atas
2. Migrasikan aplikasi yang ada dari string koneksi ke managed identity
3. Bangun proyek AZD pertama Anda dengan keamanan sejak hari pertama: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
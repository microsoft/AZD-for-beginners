# Mga Pattern ng Pagpapatotoo at Managed Identity

⏱️ **Tinatayang Oras**: 45-60 minuto | 💰 **Epekto sa Gastos**: Libre (walang karagdagang singil) | ⭐ **Kumplikasyon**: Katamtaman

**📚 Landas ng Pagkatuto:**
- ← Nakaraan: [Pangangasiwa ng Konfigurasyon](configuration.md) - Pamamahala ng mga environment variable at mga lihim
- 🎯 **Nandito Ka**: Pagpapatotoo & Seguridad (Managed Identity, Key Vault, ligtas na mga pattern)
- → Susunod: [Unang Proyekto](first-project.md) - Itayo ang iyong unang aplikasyon ng AZD
- 🏠 [Tahanan ng Kurso](../../README.md)

---

## Ano ang Matututunan Mo

Sa pagtatapos ng araling ito, mauunawaan mo:
- Unawain ang mga pattern ng pagpapatotoo sa Azure (mga susi, connection strings, managed identity)
- Ipatupad ang **Managed Identity** para sa passwordless na pagpapatotoo
- Siguraduhin ang mga lihim gamit ang integrasyon ng **Azure Key Vault**
- I-configure ang **role-based access control (RBAC)** para sa mga deployment ng AZD
- Ipatupad ang mga pinakamahuhusay na kasanayan sa seguridad sa Container Apps at mga serbisyo ng Azure
- Mag-migrate mula sa key-based papuntang identity-based na pagpapatotoo

## Bakit Mahalaga ang Managed Identity

### Ang Suliranin: Tradisyonal na Pagpapatotoo

**Bago ang Managed Identity:**
```javascript
// ❌ PANGANIB SA SEGURIDAD: Mga lihim na nakalagay nang permanente sa kodigo
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Mga Suliranin:**
- 🔴 **Mga lihim na nalantad** sa code, config files, environment variables
- 🔴 **Pag-ikot ng kredensyal** nangangailangan ng pagbabago sa code at muling pag-deploy
- 🔴 **Bangungot sa pag-audit** - sino ang um-access ng ano, kailan?
- 🔴 **Pagkakalat** - mga lihim na nakakalat sa maraming sistema
- 🔴 **Panganib sa pagsunod** - bumibigo sa mga security audit

### Ang Solusyon: Managed Identity

**Matapos ang Managed Identity:**
```javascript
// ✅ LIGTAS: Walang mga lihim sa code
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Awtomatikong pinangangasiwaan ng Azure ang pagpapatunay
);
```

**Mga Benepisyo:**
- ✅ **Walang lihim** sa code o configuration
- ✅ **Awtomatikong pag-ikot** - ang Azure ang humahawak nito
- ✅ **Buong talaan ng audit** sa Azure AD logs
- ✅ **Sentralisadong seguridad** - pamahalaan sa Azure Portal
- ✅ **Handa para sa pagsunod** - tumutugon sa mga pamantayan sa seguridad

**Analohiya**: Ang tradisyonal na pagpapatotoo ay parang pagdadala ng maraming pisikal na susi para sa iba't ibang pintuan. Ang Managed Identity ay parang may security badge na awtomatikong nagbibigay ng access batay sa kung sino ka—walang mga susi na mawawala, mopya, o iikot.

---

## Pangkalahatang-ideya ng Arkitektura

### Daloy ng Pagpapatotoo gamit ang Managed Identity

```mermaid
sequenceDiagram
    participant App as Ang Iyong Aplikasyon<br/>(App ng Container)
    participant MI as Pinamamahalaang Identidad<br/>(Azure AD)
    participant KV as Key Vault
    participant Storage as Azure Storage
    participant DB as Azure SQL
    
    App->>MI: Humiling ng access token<br/>(awtomatiko)
    MI->>MI: Suriin ang pagkakakilanlan<br/>(hindi kailangan ng password)
    MI-->>App: Ibalik ang token<br/>(may bisa ng 1 oras)
    
    App->>KV: Kunin ang lihim<br/>(gamit ang token)
    KV->>KV: Suriin ang mga permiso ng RBAC
    KV-->>App: Ibalik ang halaga ng lihim
    
    App->>Storage: Mag-upload ng blob<br/>(gamit ang token)
    Storage->>Storage: Suriin ang mga permiso ng RBAC
    Storage-->>App: Matagumpay
    
    App->>DB: Mag-query ng data<br/>(gamit ang token)
    DB->>DB: Suriin ang mga permiso ng SQL
    DB-->>App: Ibalik ang mga resulta
    
    Note over App,DB: Lahat ng awtentikasyon ay walang password!
```
### Mga Uri ng Managed Identities

```mermaid
graph TB
    MI[Pinamamahalaang Identidad]
    SystemAssigned[Identidad na Itinalaga ng Sistema]
    UserAssigned[Identidad na Itinalaga ng Gumagamit]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Buhay nito nakatali sa mapagkukunan]
    SystemAssigned --> SA2[Awtomatikong paglikha/pagtanggal]
    SystemAssigned --> SA3[Pinakamainam para sa isang mapagkukunan]
    
    UserAssigned --> UA1[Malayang siklo ng buhay]
    UserAssigned --> UA2[Manwal na paglikha/pagtanggal]
    UserAssigned --> UA3[Ibinabahagi sa mga mapagkukunan]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Katangian | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Siklo ng buhay** | Tied to resource | Independent |
| **Paglikha** | Automatic with resource | Manual creation |
| **Pagtanggal** | Deleted with resource | Persists after resource deletion |
| **Pagbabahagi** | One resource only | Multiple resources |
| **Kaso ng Paggamit** | Simple scenarios | Complex multi-resource scenarios |
| **AZD Default** | ✅ Inirerekomenda | Optional |

---

## Mga Kinakailangan

### Mga Kinakailangang Tool

Dapat ay na-install mo na ang mga sumusunod mula sa mga nakaraang aralin:

```bash
# Suriin ang Azure Developer CLI
azd version
# ✅ Inaasahan: azd bersyon 1.0.0 o mas mataas

# Suriin ang Azure CLI
az --version
# ✅ Inaasahan: azure-cli 2.50.0 o mas mataas
```

### Mga Kinakailangan sa Azure

- Aktibong subscription sa Azure
- Mga pahintulot para sa:
  - Lumikha ng managed identities
  - Magtalaga ng mga role ng RBAC
  - Lumikha ng mga resource ng Key Vault
  - Mag-deploy ng Container Apps

### Mga Kaalamang Kinakailangan

Dapat ay natapos mo na:
- [Gabay sa Pag-install](installation.md) - Pag-setup ng AZD
- [AZD Basics](azd-basics.md) - Mga pangunahing konsepto
- [Pangangasiwa ng Konfigurasyon](configuration.md) - Mga environment variable

---

## Aralin 1: Pag-unawa sa mga Pattern ng Pagpapatotoo

### Pattern 1: Connection Strings (Lumang Paraan - Iwasan)

**Paano ito gumagana:**
```bash
# Naglalaman ang string ng koneksyon ng mga kredensyal
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Mga Suliranin:**
- ❌ Mga lihim na makikita sa environment variables
- ❌ Nai-log sa mga deployment system
- ❌ Mahirap i-rotate
- ❌ Walang talaan ng pag-access

**Kailan gagamitin:** Para lang sa lokal na pag-develop, hindi kailanman sa production.

---

### Pattern 2: Key Vault References (Mas Mabuti)

**Paano ito gumagana:**
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

**Mga Benepisyo:**
- ✅ Mga lihim na itinatago nang ligtas sa Key Vault
- ✅ Sentralisadong pamamahala ng mga lihim
- ✅ Pag-ikot nang hindi binabago ang code

**Mga Limitasyon:**
- ⚠️ Gumagamit pa rin ng mga susi/passwords
- ⚠️ Kailangan pang pamahalaan ang access sa Key Vault

**Kailan gagamitin:** Hakbang sa paglipat mula sa connection strings papuntang managed identity.

---

### Pattern 3: Managed Identity (Pinakamainam na Kasanayan)

**Paano ito gumagana:**
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

**Code ng aplikasyon:**
```javascript
// Hindi kailangan ng mga sikreto!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Mga Benepisyo:**
- ✅ Walang lihim sa code/config
- ✅ Awtomatikong pag-ikot ng kredensyal
- ✅ Buong talaan ng audit
- ✅ Mga pahintulot batay sa RBAC
- ✅ Handa sa pagsunod

**Kailan gagamitin:** Lagi, para sa mga production na aplikasyon.

---

## Aralin 2: Pag-implementa ng Managed Identity gamit ang AZD

### Hakbang-hakbang na Pag-implementa

Bumuo tayo ng isang secure na Container App na gumagamit ng managed identity upang ma-access ang Azure Storage at Key Vault.

### Istruktura ng Proyekto

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

### 1. I-configure ang AZD (azure.yaml)

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

### 2. Imprastruktura: Paganahin ang Managed Identity

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

### 3. Container App na may System-Assigned Identity

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

### 4. Module para sa Pag-assign ng RBAC Role

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

### 5. Code ng Aplikasyon na may Managed Identity

**File: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 I-initialize ang kredensyal (gumagana nang awtomatiko gamit ang pinamamahalaang identity)
const credential = new DefaultAzureCredential();

// Pagsasaayos ng Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Hindi kailangan ng mga susi!
);

// Pagsasaayos ng Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Hindi kailangan ng mga susi!
);

// Pagsusuri ng kalusugan
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// I-upload ang file sa blob storage
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

// Kunin ang lihim mula sa Key Vault
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

// Ilista ang mga blob container (nagpapakita ng access sa pagbasa)
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

### 6. I-deploy at Subukan

```bash
# I-initialize ang AZD na kapaligiran
azd init

# I-deploy ang imprastruktura at aplikasyon
azd up

# Kunin ang URL ng app
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Subukan ang health check
curl $APP_URL/health
```

**✅ Inaasahang output:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Subukan ang pag-upload ng blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Inaasahang output:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Subukan ang pag-lista ng container:**
```bash
curl $APP_URL/containers
```

**✅ Inaasahang output:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Mga Karaniwang RBAC Role sa Azure

### Mga Built-in na Role ID para sa Managed Identity

| Service | Role Name | Role ID | Mga Pahintulot |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Magbasa ng blobs at containers |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Magbasa, magsulat, mag-delete ng mga blob |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Magbasa, magsulat, mag-delete ng mga mensahe ng queue |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Magbasa ng mga lihim |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Magbasa, magsulat, mag-delete ng mga lihim |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Magbasa ng data ng Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Magbasa, magsulat ng data ng Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Pamahalaan ang mga SQL database |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Magpadala, tumanggap, pamahalaan ang mga mensahe |

### Paano Hanapin ang mga Role ID

```bash
# Ilista ang lahat ng mga built-in na tungkulin
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Maghanap ng partikular na tungkulin
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Kunin ang mga detalye ng tungkulin
az role definition list --name "Storage Blob Data Contributor"
```

---

## Mga Praktikal na Ehersisyo

### Ehersisyo 1: Paganahin ang Managed Identity para sa Umiiral na App ⭐⭐ (Katamtaman)

**Layunin**: Magdagdag ng managed identity sa umiiral na deployment ng Container App

**Senaryo**: Mayroon kang Container App na gumagamit ng connection strings. I-convert ito sa managed identity.

**Panimulang Punto**: Container App na may ganitong configuration:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Mga Hakbang**:

1. **Paganahin ang managed identity sa Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Bigyan ng access sa Storage:**

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

3. **I-update ang code ng aplikasyon:**

**Bago (connection string):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Pagkatapos (managed identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **I-update ang environment variables:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **I-deploy at subukan:**

```bash
# I-deploy muli
azd up

# Subukan kung gumagana pa rin ito
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Mga Pamantayan ng Tagumpay:**
- ✅ Nade-deploy ang aplikasyon nang walang error
- ✅ Gumagana ang mga operasyon sa Storage (upload, list, download)
- ✅ Walang connection strings sa environment variables
- ✅ Nakikita ang identity sa Azure Portal sa ilalim ng "Identity" blade

**Pagpapatunay:**

```bash
# Suriin na naka-enable ang managed identity
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Inaasahan: "SystemAssigned"

# Suriin ang pagtatalaga ng role
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Inaasahan: Ipinapakita ang role na "Storage Blob Data Contributor"
```

**Oras**: 20-30 minuto

---

### Ehersisyo 2: Multi-Service Access gamit ang User-Assigned Identity ⭐⭐⭐ (Advanced)

**Layunin**: Lumikha ng user-assigned identity na ibinabahagi sa maraming Container Apps

**Senaryo**: Mayroon kang 3 microservices na lahat ay kailangan ng access sa iisang Storage account at Key Vault.

**Mga Hakbang**:

1. **Lumikha ng user-assigned identity:**

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

2. **Mag-assign ng mga role sa user-assigned identity:**

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

3. **I-assign ang identity sa maraming Container Apps:**

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

4. **Code ng aplikasyon (lahat ng serbisyo ay gumagamit ng parehong pattern):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Para sa user-assigned identity, tukuyin ang client ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // Client ID ng user-assigned identity
);

// O gamitin ang DefaultAzureCredential (awtomatikong natutukoy)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **I-deploy at beripikahin:**

```bash
azd up

# I-test na makaka-access sa storage ang lahat ng serbisyo
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Mga Pamantayan ng Tagumpay:**
- ✅ Isang identity na ibinabahagi sa 3 serbisyo
- ✅ Lahat ng serbisyo ay makaka-access sa Storage at Key Vault
- ✅ Nananatili ang identity kahit tanggalin mo ang isang serbisyo
- ✅ Sentralisadong pamamahala ng pahintulot

**Mga Benepisyo ng User-Assigned Identity:**
- Isang identity lang na pamahalaan
- Pare-parehong pahintulot sa lahat ng serbisyo
- Nanatili kahit tanggalin ang serbisyo
- Mas maganda para sa kumplikadong arkitektura

**Oras**: 30-40 minuto

---

### Ehersisyo 3: I-implementa ang Pag-ikot ng Sekreto sa Key Vault ⭐⭐⭐ (Advanced)

**Layunin**: Itago ang mga API key ng third-party sa Key Vault at i-access ang mga ito gamit ang managed identity

**Senaryo**: Kailangan ng iyong app na tumawag sa isang external na API (OpenAI, Stripe, SendGrid) na nangangailangan ng API keys.

**Mga Hakbang**:

1. **Lumikha ng Key Vault na may RBAC:**

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

2. **Itago ang mga lihim sa Key Vault:**

```bash
# Kunin ang pangalan ng Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Mag-imbak ng mga API key ng third-party
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

3. **Code ng aplikasyon para kunin ang mga lihim:**

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
    // Suriin muna ang cache
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

4. **Gamitin ang mga lihim sa aplikasyon:**

**File: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// I-initialize ang OpenAI gamit ang susi mula sa Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Tawagin sa pagsisimula
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

5. **I-deploy at subukan:**

```bash
azd up

# Subukan kung gumagana ang mga API key
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Mga Pamantayan ng Tagumpay:**
- ✅ Walang API key sa code o environment variables
- ✅ Kinukuha ng aplikasyon ang mga key mula sa Key Vault
- ✅ Gumagana nang tama ang mga third-party na API
- ✅ Maaaring i-rotate ang mga key nang hindi binabago ang code

**I-rotate ang isang lihim:**

```bash
# I-update ang sekreto sa Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# I-restart ang app para magamit ang bagong susi
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Oras**: 25-35 minuto

---

## Checkpoint ng Kaalaman

### 1. Mga Pattern ng Pagpapatotoo ✓

Subukan ang iyong pagkaunawa:

- [ ] **Q1**: Ano ang tatlong pangunahing pattern ng pagpapatotoo? 
  - **A**: Connection strings (lumang paraan), Key Vault references (transisyon), Managed Identity (pinakamainam)

- [ ] **Q2**: Bakit mas mahusay ang managed identity kaysa sa connection strings?
  - **A**: Walang lihim sa code, awtomatikong pag-ikot, buong talaan ng audit, RBAC na mga pahintulot

- [ ] **Q3**: Kailan gagamitin mo ang user-assigned identity sa halip na system-assigned?
  - **A**: Kapag ibinabahagi ang identity sa maraming resources o kapag ang siklo ng buhay ng identity ay hiwalay sa siklo ng buhay ng resource

**Praktikal na Pagpapatunay:**
```bash
# Tingnan kung anong uri ng pagkakakilanlan ang ginagamit ng iyong app
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Ilista ang lahat ng mga pagtatalaga ng tungkulin para sa pagkakakilanlan
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC at Mga Pahintulot ✓

Subukan ang iyong pagkaunawa:

- [ ] **Q1**: Ano ang role ID para sa "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: Anong mga pahintulot ang ibinibigay ng "Key Vault Secrets User"?
  - **A**: Pagbasa-lamang na access sa mga lihim (hindi makakalikha, mag-update, o mag-delete)

- [ ] **Q3**: Paano mo binibigyan ang isang Container App ng access sa Azure SQL?
  - **A**: Mag-assign ng "SQL DB Contributor" role o i-configure ang Azure AD authentication para sa SQL

**Praktikal na Pagpapatunay:**
```bash
# Hanapin ang tiyak na gampanin
az role definition list --name "Storage Blob Data Contributor"

# Suriin kung anong mga gampanin ang nakatalaga sa iyong pagkakakilanlan
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrasyon ng Key Vault ✓

Subukan ang iyong pagkaunawa:
- [ ] **Q1**: Paano mo pinapagana ang RBAC para sa Key Vault sa halip na mga access policy?
  - **A**: Set `enableRbacAuthorization: true` in Bicep

- [ ] **Q2**: Aling Azure SDK library ang humahandle ng managed identity authentication?
  - **A**: `@azure/identity` gamit ang `DefaultAzureCredential` class

- [ ] **Q3**: Gaano katagal nananatili ang mga secret ng Key Vault sa cache?
  - **A**: Nakasalalay sa application; magpatupad ng sariling estratehiya para sa pag-cache

**Praktikal na Pag-verify:**
```bash
# Subukan ang pag-access sa Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Suriin kung naka-enable ang RBAC
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Inaasahan: totoo
```

---

## Mga Pinakamahuhusay na Praktika sa Seguridad

### ✅ Gawin:

1. **Laging gamitin ang managed identity sa produksyon**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Gumamit ng RBAC roles na may pinakamaliit na pribilehiyo**
   - Gumamit ng "Reader" roles kapag maaari
   - Iwasan ang "Owner" o "Contributor" maliban kung kailangan

3. **Itago ang mga third-party na susi sa Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Paganahin ang audit logging**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Gumamit ng magkakaibang mga identity para sa dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **I-rotate ang mga secret nang regular**
   - Magtakda ng petsa ng pag-expire sa mga secret ng Key Vault
   - I-automate ang pag-rotate gamit ang Azure Functions

### ❌ Huwag:

1. **Huwag kailanman i-hardcode ang mga secret**
   ```javascript
   // ❌ MASAMA
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Huwag gumamit ng connection strings sa produksyon**
   ```javascript
   // ❌ MASAMA
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Huwag magbigay ng labis na mga pahintulot**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Huwag i-log ang mga secret**
   ```javascript
   // ❌ MASAMA
   console.log('API Key:', apiKey);
   
   // ✅ MABUTI
   console.log('API Key retrieved successfully');
   ```

5. **Huwag ibahagi ang mga production identity sa iba't ibang environment**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Gabay sa Pag-troubleshoot

### Problema: "Unauthorized" kapag ina-access ang Azure Storage

**Sintomas:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnostiko:**

```bash
# Suriin kung naka-enable ang managed identity
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Inaasahan: "SystemAssigned" o "UserAssigned"

# Suriin ang mga role assignment
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Inaasahan: Dapat makita ang "Storage Blob Data Contributor" o katulad na role
```

**Mga Solusyon:**

1. **Bigyan ng tamang RBAC role:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Maghintay para sa propagation (maaaaring tumagal ng 5-10 minuto):**
```bash
# Suriin ang katayuan ng pagtatalaga ng role
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **I-verify na gamit ng application code ang tamang credential:**
```javascript
// Siguraduhing ginagamit mo ang DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problema: Tinanggihan ang pag-access sa Key Vault

**Sintomas:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnostiko:**

```bash
# Suriin kung naka-enable ang Key Vault RBAC
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Inaasahan: true

# Suriin ang mga pagtatalaga ng role
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Mga Solusyon:**

1. **I-enable ang RBAC sa Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Bigyan ng Key Vault Secrets User role:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problema: Nabibigo ang DefaultAzureCredential nang lokal

**Sintomas:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnostiko:**

```bash
# Suriin kung naka-log in ka
az account show

# Suriin ang pagpapatunay ng Azure CLI
az ad signed-in-user show
```

**Mga Solusyon:**

1. **Mag-login sa Azure CLI:**
```bash
az login
```

2. **Itakda ang Azure subscription:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Para sa lokal na development, gumamit ng environment variables:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **O gumamit ng ibang credential lokal:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Gamitin ang AzureCliCredential para sa lokal na pag-develop
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problema: Ang role assignment ay masyadong matagal mag-propagate

**Sintomas:**
- Role assigned successfully
- Still getting 403 errors
- Intermittent access (sometimes works, sometimes doesn't)

**Paliwanag:**
Ang mga pagbabago sa Azure RBAC ay maaaring tumagal ng 5-10 minuto bago mag-propagate globally.

**Solusyon:**

```bash
# Maghintay at subukan muli
echo "Waiting for RBAC propagation..."
sleep 300  # Maghintay ng 5 minuto

# Subukan ang pag-access
curl https://myapp.azurecontainerapps.io/upload

# Kung hindi pa rin gumagana, i-restart ang app
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Mga Konsiderasyon sa Gastos

### Gastos ng Managed Identity

| Resource | Cost |
|----------|------|
| **Managed Identity** | 🆓 **LIBRE** - Walang bayad |
| **RBAC Role Assignments** | 🆓 **LIBRE** - Walang bayad |
| **Azure AD Token Requests** | 🆓 **LIBRE** - Kasama |
| **Key Vault Operations** | $0.03 per 10,000 operations |
| **Key Vault Storage** | $0.024 per secret per month |

**Nakakatipid ang managed identity sa gastos sa pamamagitan ng:**
- ✅ Pag-alis ng Key Vault operations para sa service-to-service authentication
- ✅ Pagbawas ng mga security incident (walang naihayag na kredensyal)
- ✅ Pagbawas ng operational overhead (walang manwal na pag-rotate)

**Halimbawa ng Paghahambing ng Gastos (buwanang):**

| Scenario | Connection Strings | Managed Identity | Savings |
|----------|-------------------|-----------------|---------|
| Small app (1M requests) | ~$50 (Key Vault + ops) | ~$0 | $50/buwan |
| Medium app (10M requests) | ~$200 | ~$0 | $200/buwan |
| Large app (100M requests) | ~$1,500 | ~$0 | $1,500/buwan |

---

## Alamin Pa

### Opisyal na Dokumentasyon
- [Managed Identity ng Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Dokumentasyon ng SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Mga Susunod na Hakbang sa Kurso na Ito
- ← Nakaraan: [Pamamahala ng Konfigurasyon](configuration.md)
- → Susunod: [Unang Proyekto](first-project.md)
- 🏠 [Tahanan ng Kurso](../../README.md)

### Mga Kaugnay na Halimbawa
- [Halimbawa ng Azure OpenAI Chat](../../../../examples/azure-openai-chat) - Gumagamit ng managed identity para sa Azure OpenAI
- [Halimbawa ng Microservices](../../../../examples/microservices) - Mga pattern ng authentication para sa multi-service

---

## Buod

**Natuto ka:**
- ✅ Tatlong pattern ng authentication (connection strings, Key Vault, managed identity)
- ✅ Paano i-enable at i-configure ang managed identity sa AZD
- ✅ RBAC role assignments para sa mga serbisyo ng Azure
- ✅ Integrasyon ng Key Vault para sa third-party na mga secret
- ✅ Mga user-assigned at system-assigned na identity
- ✅ Mga pinakamahusay na praktika sa seguridad at pag-troubleshoot

**Mahahalagang Punto:**
1. **Laging gamitin ang managed identity sa produksyon** - Walang mga secret, awtomatikong rotation
2. **Gumamit ng RBAC roles na may pinakamaliit na pribilehiyo** - Magbigay lamang ng kinakailangang permiso
3. **I-imbak ang mga third-party na susi sa Key Vault** - Sentralisadong pamamahala ng secret
4. **Ihiwalay ang mga identity kada environment** - Dev, staging, prod na isolation
5. **Paganahin ang audit logging** - Subaybayan kung sino ang nag-access ng ano

**Mga Susunod na Hakbang:**
1. Tapusin ang mga praktikal na ehersisyo sa itaas
2. I-migrate ang umiiral na app mula sa connection strings papunta sa managed identity
3. Buuin ang iyong unang proyekto sa AZD na may seguridad mula sa unang araw: [Unang Proyekto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang AI translation service na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na bahagi. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
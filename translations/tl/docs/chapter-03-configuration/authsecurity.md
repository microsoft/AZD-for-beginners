# Mga Pattern ng Pagpapatotoo at Managed Identity

⏱️ **Tinatayang Oras**: 45-60 minuto | 💰 **Epekto sa Gastos**: Libre (walang karagdagang singil) | ⭐ **Kumplikasyon**: Katamtaman

**📚 Landas ng Pagkatuto:**
- ← Nakaraan: [Configuration Management](configuration.md) - Pamamahala ng mga environment variable at mga lihim
- 🎯 **Nasa Dito Ka**: Pagpapatotoo & Seguridad (Managed Identity, Key Vault, mga ligtas na pattern)
- → Susunod: [First Project](first-project.md) - Buuhin ang iyong unang AZD application
- 🏠 [Tahanan ng Kurso](../../README.md)

---

## Ano ang Matututunan Mo

Sa pagsasagawa ng araling ito, ikaw ay:
- Mauunawaan ang mga pattern ng authentication sa Azure (mga key, connection string, managed identity)
- Magpapatupad ng **Managed Identity** para sa passwordless na pagpapatotoo
- Sisiiguraduhin ang mga lihim gamit ang integrasyon ng **Azure Key Vault**
- I-configure ang **role-based access control (RBAC)** para sa mga deployment ng AZD
- Ilalapat ang mga pinakamahusay na kasanayan sa seguridad sa Container Apps at mga serbisyo ng Azure
- Magmamigrate mula sa key-based papuntang identity-based na pagpapatotoo

## Bakit Mahalaga ang Managed Identity

### Ang Problema: Tradisyunal na Pagpapatotoo

**Bago ang Managed Identity:**
```javascript
// ❌ PANGANIB SA SEGURIDAD: Mga lihim na naka-hardcode sa code
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Mga Problema:**
- 🔴 **Nakalantad na mga lihim** sa code, mga config file, mga environment variable
- 🔴 **Pag-ikot ng kredensyal** nangangailangan ng pagbabago ng code at muling pag-deploy
- 🔴 **Suliranin sa audit** - sino ang nag-access ng ano, kailan?
- 🔴 **Kalat** - mga lihim na nakakalat sa maraming sistema
- 🔴 **Panganib sa pagsunod** - bumabagsak sa mga security audit

### Ang Solusyon: Managed Identity

**Pagkatapos ng Managed Identity:**
```javascript
// ✅ LIGTAS: Walang mga lihim sa code
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Awtomatikong pinangangasiwaan ng Azure ang pagpapatunay ng pagkakakilanlan
);
```

**Mga Benepisyo:**
- ✅ **Walang lihim** sa code o configuration
- ✅ **Awtomatikong pag-ikot** - inaalagaan ng Azure
- ✅ **Buong audit trail** sa mga log ng Microsoft Entra ID
- ✅ **Sentralisadong seguridad** - pamahalaan sa Azure Portal
- ✅ **Handa sa pagsunod** - tumutugon sa mga pamantayang pangseguridad

**Analohiya**: Ang tradisyunal na pagpapatotoo ay parang pagbibitbit ng maraming pisikal na susi para sa iba't ibang pinto. Ang Managed Identity ay parang may security badge na awtomatikong nagbibigay ng access batay sa kung sino ka—walang susi na mawawala, madodoble, o kailangang i-rotate.

---

## Pangkalahatang Arkitektura

### Daloy ng Pagpapatotoo gamit ang Managed Identity

```mermaid
sequenceDiagram
    participant App as Iyong Aplikasyon<br/>(App ng Container)
    participant MI as Pinamahalaang Pagkakakilanlan<br/>(Microsoft Entra ID)
    participant KV as Taguan ng Susi
    participant Storage as Imbakan ng Azure
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
    MI[Pinamamahalaang Pagkakakilanlan]
    SystemAssigned[Itinalagang Pagkakakilanlan ng Sistema]
    UserAssigned[Itinalagang Pagkakakilanlan ng Gumagamit]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Siklo ng buhay na naka-ugnay sa resource]
    SystemAssigned --> SA2[Awtomatikong paglikha/pagtanggal]
    SystemAssigned --> SA3[Pinakamainam para sa isang resource]
    
    UserAssigned --> UA1[Independiyenteng siklo ng buhay]
    UserAssigned --> UA2[Manwal na paglikha/pagtanggal]
    UserAssigned --> UA3[Ibinabahagi sa mga resource]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```

| Tampok | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Siklo ng buhay** | Nakakabit sa resource | Independyente |
| **Paglikha** | Awtomatikong kasama ang resource | Manwal na paglikha |
| **Pag-delete** | Nabubura kasama ang resource | Nanatili pagkatapos mabura ang resource |
| **Pagbabahagi** | Isang resource lamang | Maramihang resource |
| **Kaso ng Paggamit** | Simpleng mga senaryo | Kumplikadong multi-resource na mga senaryo |
| **AZD Default** | ✅ Inirerekomenda | Opsyonal |

---

## Mga Kinakailangan

### Mga Kinakailangang Tool

Dapat mayroon ka nang mga ito na na-install mula sa mga nakaraang aralin:

```bash
# Suriin ang Azure Developer CLI
azd version
# ✅ Inaasahan: azd bersyon 1.0.0 o mas mataas

# Suriin ang Azure CLI
az --version
# ✅ Inaasahan: azure-cli 2.50.0 o mas mataas
```

### Mga Kinakailangan sa Azure

- Aktibong Azure subscription
- Mga permiso para sa:
  - Paglikha ng managed identities
  - Pag-assign ng mga RBAC role
  - Paglikha ng mga Key Vault na resource
  - Pag-deploy ng Container Apps

### Mga Kinakailangang Kaalaman

Dapat mo nang natapos:
- [Installation Guide](installation.md) - AZD setup
- [AZD Basics](azd-basics.md) - Mga pangunahing konsepto
- [Configuration Management](configuration.md) - Mga environment variable

---

## Aralin 1: Pag-unawa sa Mga Pattern ng Pagpapatotoo

### Pattern 1: Connection Strings (Legacy - Iwasan)

**Paano ito gumagana:**
```bash
# Naglalaman ang connection string ng mga kredensyal
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Mga Problema:**
- ❌ Mga lihim na nakikita sa environment variables
- ❌ Na-log sa mga deployment system
- ❌ Mahirap i-rotate
- ❌ Walang audit trail ng access

**Kailan gagamitin:** Para lamang sa lokal na pag-develop, hindi kailanman sa production.

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
- ✅ Mga lihim na nakaimbak nang ligtas sa Key Vault
- ✅ Sentralisadong pamamahala ng lihim
- ✅ Pag-ikot nang walang pagbabago sa code

**Mga Limitasyon:**
- ⚠️ Patuloy pa ring gumagamit ng mga key/password
- ⚠️ Kailangan pamahalaan ang access sa Key Vault

**Kailan gagamitin:** Hakbang sa paglipat mula sa connection strings papuntang managed identity.

---

### Pattern 3: Managed Identity (Pinakamahusay na Praktis)

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

**Application code:**
```javascript
// Hindi kailangan ng mga lihim!
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
- ✅ Buong audit trail
- ✅ Mga permiso batay sa RBAC
- ✅ Handang sumunod sa mga pangangailangan sa seguridad

**Kailan gagamitin:** Palagi, para sa mga production na aplikasyon.

---

### Pattern 4: Service Principals (CI/CD & Automation)

Ang managed identity ang gold standard para sa mga resource na tumatakbo sa loob ng Azure. Pero paano naman ang mga tumatakbo **labas** ng Azure—tulad ng CI/CD pipeline sa isang build agent, o isang script sa iyong laptop na hindi makakagamit ng interactive login? Dito pumapasok ang **service principal**: isang non-human na identity na may sariling kredensyal na maaaring gamitin ng automated na proseso para mag-sign in.

**Paano ito gumagana:**

Create a service principal scoped to a resource group (least privilege):

```bash
az ad sp create-for-rbac \
  --name "myapp-cicd" \
  --role contributor \
  --scopes /subscriptions/<sub-id>/resourceGroups/<rg-name>
```

This prints a client ID, client secret, and tenant ID. azd can sign in with them non-interactively:

```bash
azd auth login \
  --client-id "<appId>" \
  --client-secret "<password>" \
  --tenant-id "<tenant>"
```

**Mas piliin ang federated credentials (OIDC) kaysa sa mga secret.** Sa halip na isang long-lived client secret, i-configure ang isang federated credential para ipagpalit ng pipeline ang isang short-lived token—walang secret na ma-l leak o kailangang i-rotate:

```bash
azd auth login \
  --client-id "<appId>" \
  --federated-credential-provider "github" \
  --tenant-id "<tenant>"
```

> `azd pipeline config` sets this up for you automatically. Tingnan ang mga CI/CD walkthrough sa [Chapter 8](../chapter-08-production/production-ai-practices.md).

**Mga Benepisyo:**
- ✅ Gumagana sa labas ng Azure (mga build agent, on-prem, ibang cloud)
- ✅ Maaaring i-scope sa isang resource group lamang na may isang role
- ✅ Ang federated (OIDC) variant ay hindi gumagamit ng naka-store na secret

**Mga Trade-off:**
- ⚠️ Ang secret-based na variant ay nangangailangan ng maingat na pag-iimbak at pag-ikot
- ⚠️ Ang na-leak na secret ay nagbibigay ng anumang kaya ng SP—panatilihing makitid ang scope

**Kailan gagamitin:** Para sa CI/CD pipelines at automation na hindi makakagamit ng managed identity. Laging piliin ang **federated/OIDC** variant kaysa sa client secret, at piliin ang managed identity kapag tumatakbo ang workload sa loob ng Azure.

**Ligtas na pag-iimbak ng kredensyal:**
- Huwag kailanman i-commit ang mga secret—gamitin ang secret store ng iyong pipeline (GitHub Actions secrets, Azure DevOps variable groups / Key Vault).
- I-scope ang SP sa pinakamaliit na role at resource group na kailangan nito.
- Magtakda ng expiry at i-rotate, o alisin ang secret nang tuluyan gamit ang OIDC.

---

## Aralin 2: Pagpapatupad ng Managed Identity gamit ang AZD

### Hakbang-hakbang na Implementasyon

Bumuo tayo ng secure na Container App na gumagamit ng managed identity para i-access ang Azure Storage at Key Vault.

### Estruktura ng Proyekto

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

### 4. RBAC Role Assignment Module

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

### 5. Application Code na may Managed Identity

**File: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 I-initialize ang kredensyal (awtomatikong gumagana gamit ang managed identity)
const credential = new DefaultAzureCredential();

// Pag-setup ng Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Hindi kailangan ng mga susi!
);

// Pag-setup ng Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Hindi kailangan ng mga susi!
);

// Pagsusuri ng kalusugan
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// I-upload ang file sa Blob Storage
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

// Ilista ang mga blob container (nagpapakita ng karapatang magbasa)
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
# I-initialize ang kapaligiran ng AZD
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

**Subukan ang blob upload:**
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

## Karaniwang Azure RBAC na Mga Papel

### Mga Built-in Role ID para sa Managed Identity

| Serbisyo | Pangalan ng Role | Role ID | Mga Pahintulot |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Magbasa ng blobs at mga container |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Magbasa, magsulat, mag-delete ng blobs |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Magbasa, magsulat, mag-delete ng mga queue message |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Magbasa ng mga secret |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Magbasa, magsulat, mag-delete ng mga secret |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Magbasa ng data sa Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Magbasa, magsulat ng data sa Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Pamahalaan ang mga SQL database |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Magpadala, tumanggap, pamahalaan ang mga mensahe |

### Paano Hanapin ang Role IDs

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

**Layunin**: Idagdag ang managed identity sa umiiral na Container App deployment

**Senaryo**: May Container App ka gamit ang connection strings. I-convert ito papuntang managed identity.

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

2. **Bigyan ng Storage access:**

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

3. **I-update ang application code:**

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

4. **I-update ang mga environment variable:**

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

**✅ Kriterya ng Tagumpay:**
- ✅ Nai-deploy ang application nang walang error
- ✅ Gumagana ang mga operasyon sa Storage (upload, list, download)
- ✅ Walang connection string sa environment variables
- ✅ Makikita ang identity sa Azure Portal sa ilalim ng "Identity" blade

**Pag-beripika:**

```bash
# Suriin kung naka-enable ang managed identity
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

**Layunin**: Lumikha ng user-assigned identity na ibabahagi sa maraming Container App

**Senaryo**: May 3 microservice ka na lahat ay nangangailangan ng access sa parehong Storage account at Key Vault.

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

2. **I-assign ang mga role sa user-assigned identity:**

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

4. **Application code (lahat ng services ay gumagamit ng parehong pattern):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Para sa identity na itinalaga ng user, tukuyin ang client ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // Client ID ng identity na itinalaga ng user
);

// O gamitin ang DefaultAzureCredential (awtomatikong natutukoy)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **I-deploy at i-verify:**

```bash
azd up

# Subukan kung lahat ng serbisyo ay makaka-access sa imbakan
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Kriterya ng Tagumpay:**
- ✅ Isang identity na ibinahagi sa 3 serbisyo
- ✅ Lahat ng serbisyo ay may access sa Storage at Key Vault
- ✅ Nanatili ang identity kung i-delete mo ang isang serbisyo
- ✅ Sentralisadong pamamahala ng permiso

**Mga Benepisyo ng User-Assigned Identity:**
- Isang identity na pamahalaan
- Pare-parehong mga permiso sa lahat ng serbisyo
- Nananatili kahit i-delete ang isang serbisyo
- Mas mainam para sa komplikadong arkitektura

**Oras**: 30-40 minuto

---

### Ehersisyo 3: Ipatupad ang Pag-ikot ng Secret sa Key Vault ⭐⭐⭐ (Advanced)

**Layunin**: Mag-imbak ng third-party API keys sa Key Vault at i-access ang mga ito gamit ang managed identity

**Senaryo**: Kailangan ng iyong app na tumawag sa isang external API (OpenAI, Stripe, SendGrid) na nangangailangan ng API keys.

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

2. **Mag-imbak ng mga secret sa Key Vault:**

```bash
# Kunin ang pangalan ng Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# I-imbak ang mga API key ng third-party
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

3. **Application code para kunin ang mga secret:**

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

4. **Gamitin ang mga secret sa application:**

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

5. **I-deploy at subukan:**

```bash
azd up

# Subukan kung gumagana ang mga API key
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Kriterya ng Tagumpay:**

- ✅ Walang API keys sa code o environment variables
- ✅ Kumukuha ang aplikasyon ng mga key mula sa Key Vault
- ✅ Gumagana nang tama ang third-party APIs
- ✅ Maaaring i-rotate ang mga key nang walang pagbabago sa code

**I-rotate ang isang sekreto:**

```bash
# I-update ang lihim sa Key Vault
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

### 1. Authentication Patterns ✓

Subukan ang iyong pagkaunawa:

- [ ] **Q1**: Ano ang tatlong pangunahing authentication pattern? 
  - **A**: Connection strings (legacy), Key Vault references (transition), Managed Identity (best)

- [ ] **Q2**: Bakit mas mabuti ang managed identity kaysa sa connection strings?
  - **A**: Walang secrets sa code, awtomatikong rotation, kumpletong audit trail, RBAC permissions

- [ ] **Q3**: Kailan gagamit ka ng user-assigned identity sa halip na system-assigned?
  - **A**: Kapag nagbabahagi ng identity sa maraming resources o kapag ang lifecycle ng identity ay hiwalay sa lifecycle ng resource

**Hands-On Verification:**
```bash
# Suriin kung anong uri ng identidad ang ginagamit ng iyong app
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Ilista ang lahat ng mga pagtatalaga ng role para sa identidad
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC and Permissions ✓

Subukan ang iyong pagkaunawa:

- [ ] **Q1**: Ano ang role ID para sa "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: Anong mga permiso ang ibinibigay ng "Key Vault Secrets User"?
  - **A**: Read-only access sa secrets (hindi makakalikha, mag-aupdate, o magde-delete)

- [ ] **Q3**: Paano mo bibigyan ng access ang isang Container App sa Azure SQL?
  - **A**: I-assign ang "SQL DB Contributor" role o i-configure ang Microsoft Entra ID authentication para sa SQL

**Hands-On Verification:**
```bash
# Hanapin ang tiyak na tungkulin
az role definition list --name "Storage Blob Data Contributor"

# Suriin kung anong mga tungkulin ang nakatalaga sa iyong pagkakakilanlan
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault Integration ✓

Subukan ang iyong pagkaunawa:

- [ ] **Q1**: Paano mo i-e-enable ang RBAC para sa Key Vault sa halip na access policies?
  - **A**: I-set ang `enableRbacAuthorization: true` sa Bicep

- [ ] **Q2**: Anong Azure SDK library ang humahandle ng managed identity authentication?
  - **A**: `@azure/identity` with `DefaultAzureCredential` class

- [ ] **Q3**: Gaano katagal nananatili ang Key Vault secrets sa cache?
  - **A**: Depende sa aplikasyon; mag-implementa ng sarili mong caching strategy

**Hands-On Verification:**
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
# ✅ Inaasahan: true
```

---

## Security Best Practices

### ✅ GAWIN:

1. **Palaging gumamit ng managed identity sa production**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Gumamit ng least-privilege RBAC roles**
   - Gumamit ng "Reader" roles kapag posible
   - Iwasan ang "Owner" o "Contributor" maliban kung kinakailangan

3. **Itago ang third-party keys sa Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **I-enable ang audit logging**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Gumamit ng magkakaibang identities para sa dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **I-rotate ang mga sekreto nang regular**
   - Mag-set ng expiration dates sa Key Vault secrets
   - I-automate ang rotation gamit ang Azure Functions

### ❌ HUWAG GAWIN:

1. **Huwag i-hardcode ang mga sekreto**
   ```javascript
   // ❌ MASAMA
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Huwag gumamit ng connection strings sa production**
   ```javascript
   // ❌ MASAMA
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Huwag magbigay ng labis na permissions**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Huwag i-log ang mga sekreto**
   ```javascript
   // ❌ MASAMA
   console.log('API Key:', apiKey);
   
   // ✅ MABUTI
   console.log('API Key retrieved successfully');
   ```

5. **Huwag pag-usapan/pagbuhatin ang production identities sa iba pang environments**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Troubleshooting Guide

### Problema: "Unauthorized" kapag ina-access ang Azure Storage

**Sintomas:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnosis:**

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

2. **Maghintay para sa propagation (maaaring tumagal ng 5-10 minuto):**
```bash
# Suriin ang katayuan ng pagtatalaga ng tungkulin.
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Beripikahin na ang application code ay gumagamit ng tamang credential:**
```javascript
// Siguraduhing ginagamit mo ang DefaultAzureCredential.
const credential = new DefaultAzureCredential();
```

---

### Problema: Tinanggihan ang access sa Key Vault

**Sintomas:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnosis:**

```bash
# Suriin kung naka-enable ang Key Vault RBAC
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Inaasahan: true

# Suriin ang mga pagtatalaga ng tungkulin
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

**Diagnosis:**

```bash
# Suriin kung naka-login ka
az account show

# Suriin ang pagpapatunay ng Azure CLI
az ad signed-in-user show
```

**Mga Solusyon:**

1. **Mag-login sa Azure CLI:**
```bash
az login
```

2. **I-set ang Azure subscription:**
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

// Gumamit ng AzureCliCredential para sa lokal na pag-develop
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problema: Ang role assignment ay masyadong matagal mag-propagate

**Sintomas:**
- Matagumpay ang na-assign na role
- Patuloy na nakakakuha ng 403 errors
- Paminsan-minsang access (minsan gumagana, minsan hindi)

**Paliwanag:**
Maaaring tumagal ng 5-10 minuto ang propagation ng mga Azure RBAC changes sa buong mundo.

**Solusyon:**

```bash
# Maghintay at subukan muli
echo "Waiting for RBAC propagation..."
sleep 300  # Maghintay ng 5 minuto

# Subukan ang pag-access
curl https://myapp.azurecontainerapps.io/upload

# Kung patuloy na pumapalya, i-restart ang app
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Mga Pagsasaalang-alang sa Gastos

### Gastos ng Managed Identity

| Mapagkukunan | Gastos |
|----------|------|
| **Managed Identity** | 🆓 **LIBRE** - Walang singil |
| **RBAC Role Assignments** | 🆓 **LIBRE** - Walang singil |
| **Microsoft Entra ID Token Requests** | 🆓 **LIBRE** - Kasama |
| **Key Vault Operations** | $0.03 per 10,000 operations |
| **Key Vault Storage** | $0.024 per secret per month |

**Nakakatipid ang managed identity sa pamamagitan ng:**
- ✅ Pag-aalis ng Key Vault operations para sa service-to-service auth
- ✅ Pagbawas ng security incidents (walang na-leak na credentials)
- ✅ Pagbawas ng operational overhead (walang manual rotation)

**Halimbawa ng Paghahambing ng Gastos (buwanang):**

| Senaryo | Connection Strings | Managed Identity | Tipid |
|----------|-------------------|-----------------|---------|
| Maliit na app (1M requests) | ~$50 (Key Vault + ops) | ~$0 | $50/buwan |
| Katamtamang app (10M requests) | ~$200 | ~$0 | $200/buwan |
| Malaking app (100M requests) | ~$1,500 | ~$0 | $1,500/buwan |

---

## Matuto Pa

### Official Documentation
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK Documentation
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Susunod na Mga Hakbang sa Kursong Ito
- ← Nakaraan: [Configuration Management](configuration.md)
- → Susunod: [First Project](first-project.md)
- 🏠 [Course Home](../../README.md)

### Mga Kaugnay na Halimbawa
- [Microsoft Foundry Models Chat Example](../../../../examples/azure-openai-chat) - Gumagamit ng managed identity para sa Microsoft Foundry Models
- [Microservices Example](../../../../examples/microservices) - Multi-service authentication patterns

---

## Buod

**Natutunan mo:**
- ✅ Tatlong authentication patterns (connection strings, Key Vault, managed identity)
- ✅ Paano i-enable at i-configure ang managed identity sa AZD
- ✅ RBAC role assignments para sa mga Azure services
- ✅ Key Vault integration para sa third-party secrets
- ✅ User-assigned vs system-assigned identities
- ✅ Mga security best practices at troubleshooting

**Pangunahing Mga Punto:**
1. **Palaging gumamit ng managed identity sa production** - Walang secrets, awtomatikong rotation
2. **Gumamit ng least-privilege RBAC roles** - Magbigay lamang ng kinakailangang permiso
3. **Itago ang third-party keys sa Key Vault** - Sentralisadong pamamahala ng sekreto
4. **Ihiwalay ang mga identidad ayon sa environment** - Dev, staging, prod isolation
5. **I-enable ang audit logging** - Subaybayan kung sino ang nag-access ng ano

**Susunod na Mga Hakbang:**
1. Kumpletuhin ang mga practical exercises sa itaas
2. I-migrate ang umiiral na app mula sa connection strings papuntang managed identity
3. I-build ang iyong unang AZD project na may security mula sa unang araw: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e13ff6e1197e0a7462ed0aede7df9f23",
  "translation_date": "2025-11-25T00:23:53+00:00",
  "source_file": "docs/getting-started/authsecurity.md",
  "language_code": "kn"
}
-->
# Authentication Patterns ಮತ್ತು Managed Identity

⏱️ **ಅಂದಾಜು ಸಮಯ**: 45-60 ನಿಮಿಷಗಳು | 💰 **ಖರ್ಚು ಪ್ರಭಾವ**: ಉಚಿತ (ಯಾವುದೇ ಹೆಚ್ಚುವರಿ ಶುಲ್ಕವಿಲ್ಲ) | ⭐ **ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ

**📚 ಕಲಿಕೆಯ ಪಥ:**
- ← ಹಿಂದಿನ: [Configuration Management](configuration.md) - ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು ಮತ್ತು ರಹಸ್ಯಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- 🎯 **ನೀವು ಇಲ್ಲಿ ಇದ್ದೀರಿ**: Authentication & Security (Managed Identity, Key Vault, ಸುರಕ್ಷಿತ ಮಾದರಿಗಳು)
- → ಮುಂದಿನ: [First Project](first-project.md) - ನಿಮ್ಮ ಮೊದಲ AZD ಅಪ್ಲಿಕೇಶನ್ ನಿರ್ಮಿಸಿ
- 🏠 [ಕೋರ್ಸ್ ಹೋಮ್](../../README.md)

---

## ನೀವು ಏನು ಕಲಿಯುತ್ತೀರಿ

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- Azure authentication ಮಾದರಿಗಳನ್ನು (ಕೀಗಳು, ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳು, managed identity) ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- **Managed Identity** ಅನ್ನು ಪಾಸ್ವರ್ಡ್‌ರಹಿತ authentication ಗೆ ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- **Azure Key Vault** ಇಂಟಿಗ್ರೇಶನ್ ಮೂಲಕ ರಹಸ್ಯಗಳನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸುತ್ತೀರಿ
- AZD deployments ಗೆ **role-based access control (RBAC)** ಅನ್ನು ಸಂರಚಿಸುತ್ತೀರಿ
- Container Apps ಮತ್ತು Azure ಸೇವೆಗಳಲ್ಲಿ ಸುರಕ್ಷತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನ್ವಯಿಸುತ್ತೀರಿ
- ಕೀ ಆಧಾರಿತ authentication ನಿಂದ identity ಆಧಾರಿತ authentication ಗೆ ಸ್ಥಳಾಂತರಿಸುತ್ತೀರಿ

## Managed Identity ಏಕೆ ಮುಖ್ಯವಾಗಿದೆ

### ಸಮಸ್ಯೆ: ಪರಂಪರागत authentication

**Managed Identity ಮುಂಚೆ:**
```javascript
// ❌ ಭದ್ರತಾ ಅಪಾಯ: ಕೋಡ್‌ನಲ್ಲಿ ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡಿದ ರಹಸ್ಯಗಳು
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**ಸಮಸ್ಯೆಗಳು:**
- 🔴 **ಕೋಡ್, ಸಂರಚನಾ ಫೈಲ್‌ಗಳು, ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳಲ್ಲಿ ರಹಸ್ಯಗಳು ಬಹಿರಂಗವಾಗಿವೆ**
- 🔴 **ಪ್ರಮಾಣಪತ್ರದ ಪರಿವರ್ತನೆ** ಕೋಡ್ ಬದಲಾವಣೆ ಮತ್ತು ಪುನಃ ನಿಯೋಜನೆ ಅಗತ್ಯವಿದೆ
- 🔴 **ಆಡಿಟ್ ಸಮಸ್ಯೆಗಳು** - ಯಾರು ಏನನ್ನು, ಯಾವಾಗ ಪ್ರವೇಶಿಸಿದರು?
- 🔴 **ವ್ಯಾಪ್ತಿಯ ಹೆಚ್ಚಳ** - ರಹಸ್ಯಗಳು ಹಲವಾರು ವ್ಯವಸ್ಥೆಗಳಲ್ಲಿ ಹರಡಿವೆ
- 🔴 **ಅನುಕೂಲತೆ ಅಪಾಯಗಳು** - ಸುರಕ್ಷತಾ ಆಡಿಟ್‌ಗಳಲ್ಲಿ ವಿಫಲವಾಗುತ್ತದೆ

### ಪರಿಹಾರ: Managed Identity

**Managed Identity ನಂತರ:**
```javascript
// ✅ ಸುರಕ್ಷಿತ: ಕೋಡ್‌ನಲ್ಲಿ ಯಾವುದೇ ರಹಸ್ಯಗಳಿಲ್ಲ
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // ಆಜೂರ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ದೃಢೀಕರಣವನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ
);
```

**ಲಾಭಗಳು:**
- ✅ **ಕೋಡ್ ಅಥವಾ ಸಂರಚನೆಯಲ್ಲಿ ರಹಸ್ಯಗಳಿಲ್ಲ**
- ✅ **ಸ್ವಯಂಚಾಲಿತ ಪರಿವರ್ತನೆ** - Azure ಇದನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ
- ✅ **ಪೂರ್ಣ ಆಡಿಟ್ ಟ್ರೈಲ್** Azure AD ಲಾಗ್‌ಗಳಲ್ಲಿ
- ✅ **ಕೇಂದ್ರೀಕೃತ ಸುರಕ್ಷತೆ** - Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ನಿರ್ವಹಿಸಿ
- ✅ **ಅನುಕೂಲತೆ ಸಿದ್ಧ** - ಸುರಕ್ಷತಾ ಮಾನದಂಡಗಳನ್ನು ಪೂರೈಸುತ್ತದೆ

**ಉಪಮೆ**: ಪರಂಪರागत authentication ವಿವಿಧ ಬಾಗಿಲುಗಳಿಗೆ ಅನೇಕ ಭೌತಿಕ ಕೀಗಳನ್ನು ಹೊತ್ತಿರುವಂತೆ. Managed Identity ನಿಮ್ಮನ್ನು ಯಾರು ಎಂಬುದರ ಆಧಾರದ ಮೇಲೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪ್ರವೇಶವನ್ನು ನೀಡುವ ಸುರಕ್ಷತಾ ಬ್ಯಾಡ್ಜ್ ಹೊಂದಿರುವಂತೆ—ಕೀಗಳನ್ನು ಕಳೆದುಕೊಳ್ಳಲು, ನಕಲು ಮಾಡಲು, ಅಥವಾ ಪರಿವರ್ತಿಸಲು ಅಗತ್ಯವಿಲ್ಲ.

---

## ಆರ್ಕಿಟೆಕ್ಚರ್ ಅವಲೋಕನ

### Managed Identity ನೊಂದಿಗೆ Authentication Flow

```mermaid
sequenceDiagram
    participant App as ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್<br/>(ಕಂಟೈನರ್ ಅಪ್)
    participant MI as ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ<br/>(ಏಜರ್ AD)
    participant KV as ಕೀ ವಾಲ್ಟ್
    participant Storage as ಏಜರ್ ಸ್ಟೋರೇಜ್
    participant DB as ಏಜರ್ SQL
    
    App->>MI: ಪ್ರವೇಶ ಟೋಕನ್ ವಿನಂತಿಸಿ<br/>(ಸ್ವಯಂಚಾಲಿತ)
    MI->>MI: ಐಡೆಂಟಿಟಿ ಪರಿಶೀಲಿಸಿ<br/>(ಪಾಸ್ವರ್ಡ್ ಅಗತ್ಯವಿಲ್ಲ)
    MI-->>App: ಟೋಕನ್ ಹಿಂತಿರುಗಿಸಿ<br/>(ಮಾನ್ಯ 1 ಗಂಟೆ)
    
    App->>KV: ಸೀಕ್ರೆಟ್ ಪಡೆಯಿರಿ<br/>(ಟೋಕನ್ ಬಳಸಿ)
    KV->>KV: RBAC ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    KV-->>App: ಸೀಕ್ರೆಟ್ ಮೌಲ್ಯ ಹಿಂತಿರುಗಿಸಿ
    
    App->>Storage: ಬ್ಲಾಬ್ ಅಪ್ಲೋಡ್ ಮಾಡಿ<br/>(ಟೋಕನ್ ಬಳಸಿ)
    Storage->>Storage: RBAC ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    Storage-->>App: ಯಶಸ್ಸು
    
    App->>DB: ಡೇಟಾವನ್ನು ಕ್ವೆರಿ ಮಾಡಿ<br/>(ಟೋಕನ್ ಬಳಸಿ)
    DB->>DB: SQL ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    DB-->>App: ಫಲಿತಾಂಶಗಳನ್ನು ಹಿಂತಿರುಗಿಸಿ
    
    Note over App,DB: ಎಲ್ಲಾ ದೃಢೀಕರಣ ಪಾಸ್ವರ್ಡ್ ರಹಿತ!
```
### Managed Identity ಗಳ ಪ್ರಕಾರಗಳು

```mermaid
graph TB
    MI[ನಿರ್ವಹಿತ ಗುರುತಿನ ಚಿಹ್ನೆ]
    SystemAssigned[ಸಿಸ್ಟಮ್-ನಿಯೋಜಿತ ಗುರುತಿನ ಚಿಹ್ನೆ]
    UserAssigned[ಬಳಕೆದಾರ-ನಿಯೋಜಿತ ಗುರುತಿನ ಚಿಹ್ನೆ]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[ಆಸ್ತಿಯ ಜೀವನಚಕ್ರಕ್ಕೆ ಸಂಬಂಧಿಸಿದೆ]
    SystemAssigned --> SA2[ಸ್ವಯಂಚಾಲಿತ ಸೃಷ್ಟಿ/ಅಳಿಸುವಿಕೆ]
    SystemAssigned --> SA3[ಒಂದು ಆಸ್ತಿಗೆ ಉತ್ತಮ]
    
    UserAssigned --> UA1[ಸ್ವತಂತ್ರ ಜೀವನಚಕ್ರ]
    UserAssigned --> UA2[ಕೈಯಿಂದ ಸೃಷ್ಟಿ/ಅಳಿಸುವಿಕೆ]
    UserAssigned --> UA3[ಆಸ್ತಿಗಳಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳಲಾಗಿದೆ]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| ವೈಶಿಷ್ಟ್ಯ | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Lifecycle** | ಸಂಪತ್ತಿಗೆ ಸಂಬಂಧಿಸಿದೆ | ಸ್ವತಂತ್ರ |
| **Creation** | ಸಂಪತ್ತಿನೊಂದಿಗೆ ಸ್ವಯಂಚಾಲಿತ | ಕೈಯಿಂದ ರಚನೆ |
| **Deletion** | ಸಂಪತ್ತಿನೊಂದಿಗೆ ಅಳಿಸಲಾಗಿದೆ | ಸಂಪತ್ತಿನ ಅಳಿಸುವಿಕೆಯ ನಂತರವೂ ಉಳಿಯುತ್ತದೆ |
| **Sharing** | ಒಂದು ಸಂಪತ್ತಿಗೆ ಮಾತ್ರ | ಹಲವಾರು ಸಂಪತ್ತಿಗೆ |
| **Use Case** | ಸರಳ ಪರಿಸ್ಥಿತಿಗಳು | ಸಂಕೀರ್ಣ ಬಹು-ಸಂಪತ್ತು ಪರಿಸ್ಥಿತಿಗಳು |
| **AZD Default** | ✅ ಶಿಫಾರಸು | ಐಚ್ಛಿಕ |

---

## ಪೂರ್ವಶರತ್ತುಗಳು

### ಅಗತ್ಯವಿರುವ ಸಾಧನಗಳು

ನೀವು ಈ ಪಾಠಗಳಲ್ಲಿಂದ ಈಗಾಗಲೇ ಇವುಗಳನ್ನು ಸ್ಥಾಪಿಸಿರುವಿರಬೇಕು:

```bash
# ಆಜೂರ್ ಡೆವಲಪರ್ CLI ಪರಿಶೀಲಿಸಿ
azd version
# ✅ ನಿರೀಕ್ಷಿತ: azd ಆವೃತ್ತಿ 1.0.0 ಅಥವಾ ಹೆಚ್ಚು

# ಆಜೂರ್ CLI ಪರಿಶೀಲಿಸಿ
az --version
# ✅ ನಿರೀಕ್ಷಿತ: azure-cli 2.50.0 ಅಥವಾ ಹೆಚ್ಚು
```

### Azure ಅಗತ್ಯಗಳು

- ಸಕ್ರಿಯ Azure ಚಂದಾದಾರಿಕೆ
- ಅನುಮತಿಗಳು:
  - Managed identities ರಚಿಸಲು
  - RBAC ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಲು
  - Key Vault ಸಂಪತ್ತನ್ನು ರಚಿಸಲು
  - Container Apps ಅನ್ನು ನಿಯೋಜಿಸಲು

### ಜ್ಞಾನ ಪೂರ್ವಶರತ್ತುಗಳು

ನೀವು ಈ ಪಾಠಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿರುವಿರಬೇಕು:
- [Installation Guide](installation.md) - AZD ಸೆಟಪ್
- [AZD Basics](azd-basics.md) - ಮೂಲ ಪರಿಕಲ್ಪನೆಗಳು
- [Configuration Management](configuration.md) - ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು

---

## ಪಾಠ 1: Authentication ಮಾದರಿಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಮಾದರಿ 1: ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳು (ಪರಂಪರागत - ತಪ್ಪಿಸಿಕೊಳ್ಳಿ)

**ಇದು ಹೇಗೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ:**
```bash
# ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್ ಕ್ರೆಡೆನ್ಷಿಯಲ್ಸ್ ಅನ್ನು ಹೊಂದಿದೆ
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**ಸಮಸ್ಯೆಗಳು:**
- ❌ ರಹಸ್ಯಗಳು ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳಲ್ಲಿ ಗೋಚರಿಸುತ್ತವೆ
- ❌ ನಿಯೋಜನೆ ವ್ಯವಸ್ಥೆಗಳಲ್ಲಿ ಲಾಗ್ ಮಾಡಲಾಗಿದೆ
- ❌ ಪರಿವರ್ತಿಸಲು ಕಷ್ಟ
- ❌ ಪ್ರವೇಶದ ಆಡಿಟ್ ಟ್ರೈಲ್ ಇಲ್ಲ

**ಎಲ್ಲಿ ಬಳಸುವುದು:** ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿಗಾಗಿ ಮಾತ್ರ, ಉತ್ಪಾದನೆಗೆ ಎಂದಿಗೂ ಇಲ್ಲ.

---

### ಮಾದರಿ 2: Key Vault References (ಉತ್ತಮ)

**ಇದು ಹೇಗೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ:**
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

**ಲಾಭಗಳು:**
- ✅ ರಹಸ್ಯಗಳು Key Vault ನಲ್ಲಿ ಸುರಕ್ಷಿತವಾಗಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- ✅ ಕೇಂದ್ರೀಕೃತ ರಹಸ್ಯ ನಿರ್ವಹಣೆ
- ✅ ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಲ್ಲದೆ ಪರಿವರ್ತನೆ

**ಮಿತಿಗಳು:**
- ⚠️ ಇನ್ನೂ ಕೀಗಳು/ಪಾಸ್ವರ್ಡ್‌ಗಳನ್ನು ಬಳಸುತ್ತಿದೆ
- ⚠️ Key Vault ಪ್ರವೇಶವನ್ನು ನಿರ್ವಹಿಸಲು ಅಗತ್ಯವಿದೆ

**ಎಲ್ಲಿ ಬಳಸುವುದು:** ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳಿಂದ Managed Identity ಗೆ ಸ್ಥಳಾಂತರ ಹಂತ.

---

### ಮಾದರಿ 3: Managed Identity (ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸ)

**ಇದು ಹೇಗೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ:**
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

**ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್:**
```javascript
// ರಹಸ್ಯಗಳು ಅಗತ್ಯವಿಲ್ಲ!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**ಲಾಭಗಳು:**
- ✅ ಕೋಡ್/ಸಂರಚನೆಯಲ್ಲಿ ರಹಸ್ಯಗಳಿಲ್ಲ
- ✅ ಸ್ವಯಂಚಾಲಿತ ಪ್ರಮಾಣಪತ್ರ ಪರಿವರ್ತನೆ
- ✅ ಪೂರ್ಣ ಆಡಿಟ್ ಟ್ರೈಲ್
- ✅ RBAC ಆಧಾರಿತ ಅನುಮತಿಗಳು
- ✅ ಅನುಕೂಲತೆ ಸಿದ್ಧ

**ಎಲ್ಲಿ ಬಳಸುವುದು:** ಯಾವಾಗಲೂ, ಉತ್ಪಾದನಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ.

---

## ಪಾಠ 2: AZD ನೊಂದಿಗೆ Managed Identity ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು

### ಹಂತ-ಹಂತದ ಅನುಷ್ಠಾನ

Managed Identity ಅನ್ನು ಬಳಸುವ ಸುರಕ್ಷಿತ Container App ಅನ್ನು ನಿರ್ಮಿಸಿ, ಇದು Azure Storage ಮತ್ತು Key Vault ಗೆ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿದೆ.

### ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ

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

### 1. AZD ಅನ್ನು ಸಂರಚಿಸಿ (azure.yaml)

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

### 2. ಮೂಲಸೌಕರ್ಯ: Managed Identity ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ

**ಫೈಲ್: `infra/main.bicep`**

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

### 3. System-Assigned Identity ಹೊಂದಿರುವ Container App

**ಫೈಲ್: `infra/app/container-app.bicep`**

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

**ಫೈಲ್: `infra/core/role-assignment.bicep`**

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

### 5. Managed Identity ಹೊಂದಿರುವ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್

**ಫೈಲ್: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 ಕ್ರೆಡೆನ್ಷಿಯಲ್ ಪ್ರಾರಂಭಿಸಿ (ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿಯೊಂದಿಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ)
const credential = new DefaultAzureCredential();

// ಆಜೂರ್ ಸ್ಟೋರೇಜ್ ಸೆಟಪ್
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // ಕೀಗಳು ಅಗತ್ಯವಿಲ್ಲ!
);

// ಕೀ ವಾಲ್ಟ್ ಸೆಟಪ್
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // ಕೀಗಳು ಅಗತ್ಯವಿಲ್ಲ!
);

// ಆರೋಗ್ಯ ತಪಾಸಣೆ
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// ಬ್ಲಾಬ್ ಸ್ಟೋರೇಜ್‌ಗೆ ಫೈಲ್ ಅಪ್ಲೋಡ್ ಮಾಡಿ
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

// ಕೀ ವಾಲ್ಟ್‌ನಿಂದ ರಹಸ್ಯವನ್ನು ಪಡೆಯಿರಿ
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

// ಬ್ಲಾಬ್ ಕಂಟೈನರ್‌ಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ (ಓದುವ ಪ್ರವೇಶವನ್ನು ತೋರಿಸುತ್ತದೆ)
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

**ಫೈಲ್: `src/package.json`**

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

### 6. ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

```bash
# AZD ಪರಿಸರವನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init

# ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ URL ಅನ್ನು ಪಡೆಯಿರಿ
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# ಆರೋಗ್ಯ ತಪಾಸಣೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
curl $APP_URL/health
```

**✅ ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Blob ಅಪ್ಲೋಡ್ ಪರೀಕ್ಷೆ:**
```bash
curl -X POST $APP_URL/upload
```

**✅ ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Container ಪಟ್ಟಿ ಪರೀಕ್ಷೆ:**
```bash
curl $APP_URL/containers
```

**✅ ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## ಸಾಮಾನ್ಯ Azure RBAC ಪಾತ್ರಗಳು

### Managed Identity ಗೆ ಬಿಲ್ಟ್-ಇನ್ Role IDs

| ಸೇವೆ | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Blob ಮತ್ತು Containerಗಳನ್ನು ಓದಲು |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Blobಗಳನ್ನು ಓದಲು, ಬರೆಯಲು, ಅಳಿಸಲು |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Queue ಸಂದೇಶಗಳನ್ನು ಓದಲು, ಬರೆಯಲು, ಅಳಿಸಲು |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | ರಹಸ್ಯಗಳನ್ನು ಓದಲು |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | ರಹಸ್ಯಗಳನ್ನು ಓದಲು, ಬರೆಯಲು, ಅಳಿಸಲು |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Cosmos DB ಡೇಟಾವನ್ನು ಓದಲು |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Cosmos DB ಡೇಟಾವನ್ನು ಓದಲು, ಬರೆಯಲು |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | SQL ಡೇಟಾಬೇಸ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಲು |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | ಸಂದೇಶಗಳನ್ನು ಕಳುಹಿಸಲು, ಸ್ವೀಕರಿಸಲು, ನಿರ್ವಹಿಸಲು |

### Role IDs ಅನ್ನು ಹೇಗೆ ಹುಡುಕುವುದು

```bash
# ಎಲ್ಲಾ ಅಂತರ್ನಿರ್ಮಿತ ಪಾತ್ರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# ನಿರ್ದಿಷ್ಟ ಪಾತ್ರವನ್ನು ಹುಡುಕಿ
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# ಪಾತ್ರದ ವಿವರಗಳನ್ನು ಪಡೆಯಿರಿ
az role definition list --name "Storage Blob Data Contributor"
```

---

## ಪ್ರಾಯೋಗಿಕ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಹಾಲಿ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ Managed Identity ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ ⭐⭐ (ಮಧ್ಯಮ)

**ಗುರಿ**: Managed Identity ಅನ್ನು ಹಾಲಿ Container App ನಿಯೋಜನೆಗೆ ಸೇರಿಸಿ

**ಪರಿಸ್ಥಿತಿ**: ನೀವು ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳನ್ನು ಬಳಸುವ Container App ಹೊಂದಿದ್ದೀರಿ. Managed Identity ಗೆ ಪರಿವರ್ತಿಸಿ.

**ಆರಂಭಿಕ ಬಿಂದು**: ಈ ಸಂರಚನೆಯೊಂದಿಗೆ Container App:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**ಹಂತಗಳು**:

1. **Bicep ನಲ್ಲಿ Managed Identity ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Storage ಪ್ರವೇಶವನ್ನು ನೀಡಿ:**

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

3. **ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನವೀಕರಿಸಿ:**

**ಹಿಂದೆ (ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**ನಂತರ (Managed Identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳನ್ನು ನವೀಕರಿಸಿ:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ:**

```bash
# ಪುನಃ ನಿಯೋಜನೆ
azd up

# ಇದು ಇನ್ನೂ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಎಂದು ಪರೀಕ್ಷಿಸಿ
curl https://myapp.azurecontainerapps.io/upload
```

**✅ ಯಶಸ್ಸಿನ ಮಾನದಂಡ:**
- ✅ ಅಪ್ಲಿಕೇಶನ್ ದೋಷಗಳಿಲ್ಲದೆ ನಿಯೋಜನೆಗೊಳ್ಳುತ್ತದೆ
- ✅ Storage ಕಾರ್ಯಾಚರಣೆಗಳು (ಅಪ್ಲೋಡ್, ಪಟ್ಟಿ, ಡೌನ್‌ಲೋಡ್) ಕೆಲಸ ಮಾಡುತ್ತವೆ
- ✅ ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳಲ್ಲಿ ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳಿಲ್ಲ
- ✅ Identity Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ "Identity" ಬ್ಲೇಡ್ ಅಡಿಯಲ್ಲಿ ಗೋಚರಿಸುತ್ತದೆ

**ಪರಿಶೀಲನೆ:**

```bash
# ನಿರ್ವಹಿತ ಗುರುತಿನ ಚಲನೆ ಸಕ್ರಿಯಗೊಂಡಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ ನಿರೀಕ್ಷಿತ: "SystemAssigned"

# ಪಾತ್ರ ನಿಯೋಜನೆ ಪರಿಶೀಲಿಸಿ
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ ನಿರೀಕ್ಷಿತ: "Storage Blob Data Contributor" ಪಾತ್ರವನ್ನು ತೋರಿಸುತ್ತದೆ
```

**ಸಮಯ**: 20-30 ನಿಮಿಷಗಳು

---

### ವ್ಯಾಯಾಮ 2: User-Assigned Identity ನೊಂದಿಗೆ ಬಹು-ಸೇವಾ ಪ್ರವೇಶ ⭐⭐⭐ (ಅಡ್ವಾನ್ಸ್‌ಡ್)

**ಗುರಿ**: ಹಲವಾರು Container Apps ಅಡಿಯಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳುವ User-Assigned Identity ರಚಿಸಿ

**ಪರಿಸ್ಥಿತಿ**: ನೀವು 3 ಮೈಕ್ರೋಸರ್ವಿಸ್‌ಗಳನ್ನು ಹೊಂದಿದ್ದೀರಿ, ಅವುಗಳೆಲ್ಲಾ ಒಂದೇ Storage ಖಾತೆ ಮತ್ತು Key Vault ಗೆ ಪ್ರವೇಶವನ್ನು ಅಗತ್ಯವಿದೆ.

**ಹಂತಗಳು**:

1. **User-Assigned Identity ರಚಿಸಿ:**

**ಫೈಲ್: `infra/core/identity.bicep`**

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

2. **User-Assigned Identity ಗೆ ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಿ:**

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

3. **ಹಲವಾರು Container Apps ಗೆ Identity ಅನ್ನು ನಿಯೋಜಿಸಿ:**

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

4. **ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ (ಎಲ್ಲಾ ಸೇವೆಗಳು ಒಂದೇ ಮಾದರಿಯನ್ನು ಬಳಸುತ್ತವೆ):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// ಬಳಕೆದಾರ-ನಿಯೋಜಿತ ಗುರುತಿಗಾಗಿ, ಗ್ರಾಹಕ ID ಅನ್ನು ನಿರ್ದಿಷ್ಟಪಡಿಸಿ
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ಬಳಕೆದಾರ-ನಿಯೋಜಿತ ಗುರುತಿನ ಗ್ರಾಹಕ ID
);

// ಅಥವಾ DefaultAzureCredential ಅನ್ನು ಬಳಸಿ (ಸ್ವಯಂ-ಹುಡುಕುತ್ತದೆ)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರಿಶೀಲಿಸಿ:**

```bash
azd up

# ಎಲ್ಲಾ ಸೇವೆಗಳು ಸಂಗ್ರಹವನ್ನು ಪ್ರವೇಶಿಸಬಹುದು ಎಂದು ಪರೀಕ್ಷಿಸಿ
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ ಯಶಸ್ಸಿನ ಮಾನದಂಡ:**
- ✅ 3 ಸೇವೆಗಳ ಅಡಿಯಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳುವ ಒಂದು Identity
- ✅ ಎಲ್ಲಾ ಸೇವೆಗಳು Storage ಮತ್ತು Key Vault ಗೆ ಪ್ರವೇಶವನ್ನು ಹೊಂದಿವೆ
- ✅ ನೀವು ಒಂದು ಸೇವೆಯನ್ನು ಅಳಿಸಿದರೆ Identity ಉಳಿಯುತ್ತದೆ
- ✅ ಕೇಂದ್ರೀಕೃತ ಅನುಮತಿ ನಿರ್ವಹಣೆ

**User-Assigned Identity ನ ಲಾಭಗಳು:**
- ನಿರ್ವಹಿಸಲು ಒಂದು Identity
- ಸೇವೆಗಳಾದ್ಯಂತ ಸತತ ಅನುಮತಿಗಳು
- ಸೇವೆಯನ್ನು ಅಳಿಸಿದರೂ Identity ಉಳಿಯುತ್ತದೆ
- ಸಂಕೀರ್ಣ ಆರ್ಕಿಟೆಕ್ಚರ್‌ಗಳಿಗೆ ಉತ್ತಮ

**ಸಮಯ**: 30-40 ನಿಮಿಷಗಳು

---

### ವ್ಯಾಯಾಮ 3: Key Vault ರಹಸ್ಯ ಪರಿವರ್ತನೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ ⭐⭐⭐ (ಅಡ್ವಾನ್ಸ್‌ಡ್)

**ಗುರಿ**: Key Vault ನಲ್ಲಿ ತೃತೀಯ-ಪಕ್ಷ API ಕೀಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ ಮತ್ತು Managed Identity ಬಳಸಿ ಅವುಗಳನ್ನು ಪ್ರವೇಶಿಸಿ

**ಪರಿಸ್ಥಿತಿ**: ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ OpenAI, Stripe, SendGrid ಮುಂತಾದ ತೃತೀಯ-ಪಕ್ಷ API ಗಳನ್ನು ಕರೆಸಲು API ಕೀಗಳನ್ನು ಅಗತ್ಯವಿದೆ.

**ಹಂತಗಳು**:

1. **RBAC ನೊಂದಿಗೆ Key Vault ರಚಿಸಿ:**

**ಫೈಲ್: `infra/core/keyvault.bicep`**

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

2. **Key Vault ನಲ್ಲಿ ರಹಸ್ಯಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ:**

```bash
# ಕೀ ವಾಲ್ಟ್ ಹೆಸರು ಪಡೆಯಿರಿ
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# ಮೂರನೇ ಪಕ್ಷದ API ಕೀಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ
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

3. **ರಹಸ್ಯಗಳನ್ನು ಪಡೆಯಲು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್:**

**ಫೈಲ್: `src/config.js`**

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
    // ಮೊದಲು ಕ್ಯಾಶ್ ಪರಿಶೀಲಿಸಿ
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

4. **ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ರಹಸ್ಯಗಳನ್ನು ಬಳಸುವುದು:**

**ಫೈಲ್: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// ಕೀ ವಾಲ್ಟ್‌ನಿಂದ ಕೀ ಬಳಸಿ ಓಪನ್‌ಎಐ ಪ್ರಾರಂಭಿಸಿ
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// ಪ್ರಾರಂಭದ ಸಮಯದಲ್ಲಿ ಕರೆಮಾಡಿ
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

5. **ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ:**

```bash
azd up

# API ಕೀಗಳು ಕೆಲಸ ಮಾಡುತ್ತವೆ ಎಂದು ಪರೀಕ್ಷಿಸಿ
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ ಯಶಸ್ಸಿನ ಮಾನದಂಡ:**
- ✅ ಕೋಡ್ ಅಥವಾ ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳಲ್ಲಿ API ಕೀಗಳಿಲ್ಲ
- ✅ ಅಪ್ಲಿಕೇಶನ್ Key Vault ನಿಂದ ಕೀಗಳನ್ನು ಪಡೆಯುತ್ತದೆ
- ✅ ತೃತೀಯ-ಪಕ್ಷ API ಗಳು ಸರಿಯಾಗಿ ಕೆಲಸ ಮಾಡುತ್ತವೆ
- ✅ ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಲ್ಲದೆ ಕೀಗಳನ್ನು ಪರಿವರ್ತಿಸಬಹುದು

**ರಹಸ್ಯವನ್ನು ಪರಿವರ್ತಿಸಿ:**

```bash
# ಕೀ ವಾಲ್ಟ್‌ನಲ್ಲಿ ರಹಸ್ಯವನ್ನು ನವೀಕರಿಸಿ
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# ಹೊಸ ಕೀ ಅನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**ಸಮಯ**: 25-35 ನಿಮಿಷಗಳು

---

## ಜ್ಞಾನ ತಪಾಸಣೆ

### 1. Authentication ಮಾದರಿಗಳು ✓

ನಿಮ್ಮ ಅರ್ಥವನ್ನು ಪರೀಕ್ಷಿಸಿ:

- [ ] **Q1**: ಮುಖ್ಯ authentication ಮಾದರಿಗಳು ಯಾವುವು? 
  - **A**: ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳು (ಪರಂಪರागत), Key Vault references (ಸ್ಥಳಾಂತರ), Managed Identity (ಅತ್ಯುತ್ತಮ)

- [ ] **Q2**: Managed Identity ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್‌ಗಳಿಗಿಂತ ಏಕೆ ಉತ್ತಮ?
  - **A**: ಕೋಡ್‌ನಲ್ಲಿ ರಹಸ್ಯಗಳಿಲ್ಲ, ಸ್ವಯಂಚಾಲಿತ ಪರಿವರ್ತನೆ, ಪೂರ್ಣ ಆಡಿಟ್ ಟ್ರೈಲ್, RBAC ಅನುಮತಿಗಳು

- [ ] **Q3**: System-Assigned Identity ಬದಲು User-Assigned Identity ಅನ್ನು ನೀವು ಯಾವಾಗ ಬಳಸುತ್ತೀರಿ?
  - **A**: ಹಲವಾರು ಸಂಪತ್ತಿನ ಅಡಿಯಲ್ಲಿ Identity ಹಂಚಿಕೊಳ್ಳುವಾಗ ಅಥವಾ Identity lifecycle ಸಂಪತ್ತಿನ lifecycle ಗೆ ಸ್ವತಂತ್ರವಾಗಿರುವಾಗ

**ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಪರಿಶೀಲನೆ:**
```bash
# ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ ರೀತಿಯ ಗುರುತನ್ನು ಬಳಸುತ್ತದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# ಗುರುತಿಗೆ ಎಲ್ಲಾ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC ಮತ್ತು Permissions ✓

ನಿಮ್ಮ ಅರ್ಥವನ್ನು ಪರೀಕ್ಷಿಸಿ:

- [ ] **Q1**: "Storage Blob Data Contributor" ಗೆ Role ID ಯಾವುದು?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: "Key Vault Secrets User" ಯಾವ Permissions ಅನ್ನು ಒದಗಿಸುತ್ತದೆ?
  - **A**: ರಹಸ್ಯಗಳಿಗೆ ಓದುವ-ಮಾತ್ರ ಪ್ರವೇಶ (ರಚಿಸಲು, ನವೀಕರಿಸಲು, ಅಥವಾ ಅಳಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ)

- [ ] **Q3**: Container App ಗೆ Azure SQL ಗೆ ಪ್ರವೇಶವನ್ನು ನೀವು ಹೇಗೆ ನೀಡುತ್ತೀರಿ?
  - **A**: "SQL DB Contributor" ಪಾತ್ರವನ್ನು ನಿಯೋಜಿಸಿ ಅಥವಾ SQL ಗೆ Azure AD authentication ಅನ್ನು ಸಂರಚಿಸಿ

**ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಪರಿಶೀಲನೆ:**
```bash
# ನಿರ್ದಿಷ್ಟ ಪಾತ್ರವನ್ನು ಹುಡುಕಿ
az role definition list --name "Storage Blob Data Contributor"

# ನಿಮ್ಮ ಗುರುತಿಗೆ ಯಾವ ಪಾತ್ರಗಳನ್ನು ನಿಯೋಜಿಸಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault Integration ✓

ನಿಮ್ಮ ಅರ್ಥವನ್ನು ಪರೀಕ್ಷಿಸಿ:
- [ ] **ಪ್ರಶ್ನೆ 1**: Key Vault ಗೆ RBAC ಅನ್ನು access policies ಬದಲು ಹೇಗೆ ಸಕ್ರಿಯಗೊಳಿಸಬಹುದು?
  - **ಉತ್ತರ**: Bicep ನಲ್ಲಿ `enableRbacAuthorization: true` ಅನ್ನು ಸೆಟ್ ಮಾಡಿ

- [ ] **ಪ್ರಶ್ನೆ 2**: ಯಾವ Azure SDK ಲೈಬ್ರರಿ managed identity authentication ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ?
  - **ಉತ್ತರ**: `@azure/identity` `DefaultAzureCredential` ಕ್ಲಾಸ್‌ನೊಂದಿಗೆ

- [ ] **ಪ್ರಶ್ನೆ 3**: Key Vault ರಹಸ್ಯಗಳು cache ನಲ್ಲಿ ಎಷ್ಟು ಕಾಲ ಉಳಿಯುತ್ತವೆ?
  - **ಉತ್ತರ**: ಅಪ್ಲಿಕೇಶನ್ ಆಧಾರಿತ; ನಿಮ್ಮದೇ caching ತಂತ್ರವನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ

**ಪ್ರಾಯೋಗಿಕ ಪರಿಶೀಲನೆ:**
```bash
# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶವನ್ನು ಪರೀಕ್ಷಿಸಿ
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# RBAC ಸಕ್ರಿಯಗೊಂಡಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ ನಿರೀಕ್ಷಿತ: ಸತ್ಯ
```

---

## ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### ✅ ಮಾಡಬೇಕಾದವು:

1. **ಉತ್ಪಾದನೆಯಲ್ಲಿ ಸದಾ managed identity ಬಳಸಿ**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **ಕಡಿಮೆ-ಅಧಿಕಾರ RBAC ಪಾತ್ರಗಳನ್ನು ಬಳಸಿ**
   - ಸಾಧ್ಯವಾದರೆ "Reader" ಪಾತ್ರಗಳನ್ನು ಬಳಸಿ
   - ಅಗತ್ಯವಿಲ್ಲದಿದ್ದರೆ "Owner" ಅಥವಾ "Contributor" ಪಾತ್ರಗಳನ್ನು ತಪ್ಪಿಸಿ

3. **ಮೂರನೇ ಪಕ್ಷದ ಕೀಗಳನ್ನು Key Vault ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಿ**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Audit logging ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **ವಿಭಿನ್ನ identities ಅನ್ನು dev/staging/prod ಗೆ ಬಳಸಿ**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **ರಹಸ್ಯಗಳನ್ನು ನಿಯಮಿತವಾಗಿ ಪರಿವರ್ತಿಸಿ**
   - Key Vault ರಹಸ್ಯಗಳಿಗೆ ಅವಧಿ ದಿನಾಂಕಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
   - Azure Functions ಮೂಲಕ ಪರಿವರ್ತನೆ ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ

### ❌ ಮಾಡಬಾರದವು:

1. **ರಹಸ್ಯಗಳನ್ನು hardcode ಮಾಡಬೇಡಿ**
   ```javascript
   // ❌ ಕೆಟ್ಟದು
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **ಉತ್ಪಾದನೆಯಲ್ಲಿ connection strings ಅನ್ನು ಬಳಸಬೇಡಿ**
   ```javascript
   // ❌ ಕೆಟ್ಟದು
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **ಅತಿಯಾದ ಅನುಮತಿಗಳನ್ನು ನೀಡಬೇಡಿ**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **ರಹಸ್ಯಗಳನ್ನು ಲಾಗ್ ಮಾಡಬೇಡಿ**
   ```javascript
   // ❌ ಕೆಟ್ಟದು
   console.log('API Key:', apiKey);
   
   // ✅ ಉತ್ತಮ
   console.log('API Key retrieved successfully');
   ```

5. **ಉತ್ಪಾದನಾ identities ಅನ್ನು ವಿವಿಧ ಪರಿಸರಗಳಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳಬೇಡಿ**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## ತೊಂದರೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ

### ಸಮಸ್ಯೆ: "Unauthorized" Azure Storage ಗೆ ಪ್ರವೇಶಿಸುವಾಗ

**ಲಕ್ಷಣಗಳು:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**ನಿರ್ಣಯ:**

```bash
# ನಿರ್ವಹಿತ ಗುರುತಿನ ಚಲನೆ ಸಕ್ರಿಯಗೊಂಡಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ ನಿರೀಕ್ಷಿತ: "SystemAssigned" ಅಥವಾ "UserAssigned"

# ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# ನಿರೀಕ್ಷಿತ: "Storage Blob Data Contributor" ಅಥವಾ ಸಮಾನ ಪಾತ್ರವನ್ನು ನೋಡಬೇಕು
```

**ಪರಿಹಾರಗಳು:**

1. **ಸರಿಯಾದ RBAC ಪಾತ್ರವನ್ನು ನೀಡಿ:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **ಪ್ರಸರಣಕ್ಕಾಗಿ ಕಾಯಿರಿ (5-10 ನಿಮಿಷಗಳು ತೆಗೆದುಕೊಳ್ಳಬಹುದು):**
```bash
# ಪಾತ್ರ ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಸರಿಯಾದ credential ಅನ್ನು ಬಳಸುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ:**
```javascript
// ನೀವು DefaultAzureCredential ಬಳಸುತ್ತಿರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
const credential = new DefaultAzureCredential();
```

---

### ಸಮಸ್ಯೆ: Key Vault ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**ನಿರ್ಣಯ:**

```bash
# ಕೀ ವಾಲ್ಟ್ RBAC ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ ನಿರೀಕ್ಷಿತ: ಸತ್ಯ

# ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**ಪರಿಹಾರಗಳು:**

1. **Key Vault ನಲ್ಲಿ RBAC ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Key Vault Secrets User ಪಾತ್ರವನ್ನು ನೀಡಿ:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### ಸಮಸ್ಯೆ: DefaultAzureCredential ಸ್ಥಳೀಯವಾಗಿ ವಿಫಲವಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**ನಿರ್ಣಯ:**

```bash
# ನೀವು ಲಾಗ್ ಇನ್ ಆಗಿದ್ದೀರಾ ಎಂದು ಪರಿಶೀಲಿಸಿ
az account show

# Azure CLI ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az ad signed-in-user show
```

**ಪರಿಹಾರಗಳು:**

1. **Azure CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ:**
```bash
az login
```

2. **Azure subscription ಅನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿಗಾಗಿ, ಪರಿಸರ ಚರಗಳನ್ನು ಬಳಸಿ:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **ಅಥವಾ ಸ್ಥಳೀಯವಾಗಿ ವಿಭಿನ್ನ credential ಅನ್ನು ಬಳಸಿ:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿಗಾಗಿ AzureCliCredential ಅನ್ನು ಬಳಸಿ
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### ಸಮಸ್ಯೆ: ಪಾತ್ರ ನಿಯೋಜನೆ ಪ್ರಸರಣಕ್ಕೆ ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ

**ಲಕ್ಷಣಗಳು:**
- ಪಾತ್ರ ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲಾಗಿದೆ
- ಇನ್ನೂ 403 ದೋಷಗಳು ಬರುತ್ತಿವೆ
- ಅಸ್ಥಿರ ಪ್ರವೇಶ (ಕೆಲವೊಮ್ಮೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ, ಕೆಲವೊಮ್ಮೆ ಮಾಡುವುದಿಲ್ಲ)

**ವಿವರಣೆ:**
Azure RBAC ಬದಲಾವಣೆಗಳು ಜಾಗತಿಕವಾಗಿ ಪ್ರಸರಣಗೊಳ್ಳಲು 5-10 ನಿಮಿಷಗಳು ತೆಗೆದುಕೊಳ್ಳಬಹುದು.

**ಪರಿಹಾರ:**

```bash
# ಕಾಯಿಸಿ ಮತ್ತು ಪುನಃ ಪ್ರಯತ್ನಿಸಿ
echo "Waiting for RBAC propagation..."
sleep 300  # 5 ನಿಮಿಷಗಳು ಕಾಯಿರಿ

# ಪ್ರವೇಶವನ್ನು ಪರೀಕ್ಷಿಸಿ
curl https://myapp.azurecontainerapps.io/upload

# ಇನ್ನೂ ವಿಫಲವಾಗುತ್ತಿದ್ದರೆ, ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## ವೆಚ್ಚ ಪರಿಗಣನೆಗಳು

### Managed Identity ವೆಚ್ಚಗಳು

| ಸಂಪತ್ತು | ವೆಚ್ಚ |
|----------|------|
| **Managed Identity** | 🆓 **ಉಚಿತ** - ಯಾವುದೇ ಶುಲ್ಕವಿಲ್ಲ |
| **RBAC ಪಾತ್ರ ನಿಯೋಜನೆಗಳು** | 🆓 **ಉಚಿತ** - ಯಾವುದೇ ಶುಲ್ಕವಿಲ್ಲ |
| **Azure AD Token ವಿನಂತಿಗಳು** | 🆓 **ಉಚಿತ** - ಒಳಗೊಂಡಿದೆ |
| **Key Vault ಕಾರ್ಯಾಚರಣೆಗಳು** | $0.03 ಪ್ರತಿ 10,000 ಕಾರ್ಯಾಚರಣೆಗಳಿಗೆ |
| **Key Vault ಸಂಗ್ರಹಣೆ** | $0.024 ಪ್ರತಿ ರಹಸ್ಯ ಪ್ರತಿ ತಿಂಗಳಿಗೆ |

**Managed identity ಹಣವನ್ನು ಉಳಿಸುತ್ತದೆ:**
- ✅ ಸೇವೆ-ನಿಂದ-ಸೇವೆಗೆ authentication ಗೆ Key Vault ಕಾರ್ಯಾಚರಣೆಗಳನ್ನು ತೊಡೆದುಹಾಕುವುದು
- ✅ ಭದ್ರತಾ ಘಟನೆಗಳನ್ನು ಕಡಿಮೆ ಮಾಡುವುದು (ರಹಸ್ಯಗಳು ಸೋರಿಕೆಯಾಗುವುದಿಲ್ಲ)
- ✅ ಕಾರ್ಯಾಚರಣಾ ಹೊಣೆಗಾರಿಕೆಯನ್ನು ಕಡಿಮೆ ಮಾಡುವುದು (ಹಸ್ತಚಾಲಿತ ಪರಿವರ್ತನೆ ಇಲ್ಲ)

**ಉದಾಹರಣಾ ವೆಚ್ಚ ಹೋಲಿಕೆ (ತಿಂಗಳ):**

| ಪರಿಸ್ಥಿತಿ | Connection Strings | Managed Identity | ಉಳಿತಾಯ |
|----------|-------------------|-----------------|---------|
| ಸಣ್ಣ ಅಪ್ಲಿಕೇಶನ್ (1M ವಿನಂತಿಗಳು) | ~$50 (Key Vault + ಕಾರ್ಯಾಚರಣೆಗಳು) | ~$0 | $50/ತಿಂಗಳು |
| ಮಧ್ಯಮ ಅಪ್ಲಿಕೇಶನ್ (10M ವಿನಂತಿಗಳು) | ~$200 | ~$0 | $200/ತಿಂಗಳು |
| ದೊಡ್ಡ ಅಪ್ಲಿಕೇಶನ್ (100M ವಿನಂತಿಗಳು) | ~$1,500 | ~$0 | $1,500/ತಿಂಗಳು |

---

## ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ

### ಅಧಿಕೃತ ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### ಈ ಕೋರ್ಸ್‌ನ ಮುಂದಿನ ಹಂತಗಳು
- ← ಹಿಂದಿನ: [Configuration Management](configuration.md)
- → ಮುಂದಿನ: [First Project](first-project.md)
- 🏠 [ಕೋರ್ಸ್ ಹೋಮ್](../../README.md)

### ಸಂಬಂಧಿತ ಉದಾಹರಣೆಗಳು
- [Azure OpenAI Chat Example](../../../../examples/azure-openai-chat) - Azure OpenAI ಗೆ managed identity ಬಳಸುತ್ತದೆ
- [Microservices Example](../../../../examples/microservices) - ಬಹು-ಸೇವಾ authentication ಮಾದರಿಗಳು

---

## ಸಾರಾಂಶ

**ನೀವು ಕಲಿತಿದ್ದೀರಿ:**
- ✅ ಮೂರು authentication ಮಾದರಿಗಳು (connection strings, Key Vault, managed identity)
- ✅ AZD ನಲ್ಲಿ managed identity ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸುವ ಮತ್ತು ಸಂರಚಿಸುವ ವಿಧಾನ
- ✅ Azure ಸೇವೆಗಳಿಗೆ RBAC ಪಾತ್ರ ನಿಯೋಜನೆಗಳು
- ✅ ಮೂರನೇ ಪಕ್ಷದ ರಹಸ್ಯಗಳಿಗೆ Key Vault ಏಕೀಕರಣ
- ✅ User-assigned ಮತ್ತು system-assigned identities ನಡುವಿನ ವ್ಯತ್ಯಾಸ
- ✅ ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು ಮತ್ತು ತೊಂದರೆ ಪರಿಹಾರ

**ಮುಖ್ಯ ಅಂಶಗಳು:**
1. **ಉತ್ಪಾದನೆಯಲ್ಲಿ managed identity ಅನ್ನು ಸದಾ ಬಳಸಿ** - ಶೂನ್ಯ ರಹಸ್ಯಗಳು, ಸ್ವಯಂಚಾಲಿತ ಪರಿವರ್ತನೆ
2. **ಕಡಿಮೆ-ಅಧಿಕಾರ RBAC ಪಾತ್ರಗಳನ್ನು ಬಳಸಿ** - ಅಗತ್ಯವಿರುವ ಅನುಮತಿಗಳನ್ನು ಮಾತ್ರ ನೀಡಿ
3. **ಮೂರನೇ ಪಕ್ಷದ ಕೀಗಳನ್ನು Key Vault ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಿ** - ಕೇಂದ್ರೀಕೃತ ರಹಸ್ಯ ನಿರ್ವಹಣೆ
4. **ಪ್ರತಿ ಪರಿಸರಕ್ಕೆ ವಿಭಿನ್ನ identities ಬಳಸಿ** - Dev, staging, prod ಪ್ರತ್ಯೇಕತೆ
5. **Audit logging ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ** - ಯಾರು ಏನನ್ನು ಪ್ರವೇಶಿಸಿದರು ಎಂಬುದನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ

**ಮುಂದಿನ ಹಂತಗಳು:**
1. ಮೇಲಿನ ಪ್ರಾಯೋಗಿಕ ವ್ಯಾಯಾಮಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ
2. Connection strings ನಿಂದ managed identity ಗೆ ಇರುವ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಸ್ಥಳಾಂತರಿಸಿ
3. ಮೊದಲ AZD ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ದಿನ 1 ರಿಂದ ಭದ್ರತೆಯೊಂದಿಗೆ ನಿರ್ಮಿಸಿ: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:  
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯಿಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
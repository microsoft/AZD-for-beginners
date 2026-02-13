# Vzorci avtentikacije in upravljena identiteta

⏱️ **Ocenjeni čas**: 45-60 minut | 💰 **Vpliv na stroške**: Brezplačno (brez dodatnih stroškov) | ⭐ **Kompleksnost**: Srednje zahtevno

**📚 Učna pot:**
- ← Prejšnja: [Upravljanje konfiguracije](configuration.md) - Upravljanje okoljskih spremenljivk in skrivnosti
- 🎯 **Tukaj ste**: Avtentikacija in varnost (upravljana identiteta, Key Vault, varni vzorci)
- → Naslednja: [Prvi projekt](first-project.md) - Zgradi svojo prvo AZD aplikacijo
- 🏠 [Domača stran tečaja](../../README.md)

---

## Kaj se boste naučili

Z dokončanjem te lekcije boste:
- Razumeli vzorce avtentikacije v Azure (ključev, nizov za povezavo, upravljenih identitet)
- Implementirali **upravljano identiteto** za avtentikacijo brez gesel
- Zavarovali skrivnosti z integracijo **Azure Key Vault**
- Konfigurirali **vloge na podlagi RBAC** za AZD razmestitve
- Uporabili varnostne prakse v Container Apps in storitvah Azure
- Migrirali iz avtentikacije na osnovi ključev na avtentikacijo na osnovi identitete

## Zakaj je upravljana identiteta pomembna

### Problem: Tradicionalna avtentikacija

**Pred upravljano identiteto:**
```javascript
// ❌ VARNOSTNO TVEGANJE: trdo kodirane skrivnosti v kodi
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Težave:**
- 🔴 **Razkrite skrivnosti** v kodi, konfiguracijskih datotekah, okoljskih spremenljivkah
- 🔴 **Rotacija poverilnic** zahteva spremembe kode in ponovno razmestitev
- 🔴 **Nočna mora za revizijo** - kdo je dostopal do česa in kdaj?
- 🔴 **Razpršenost** - skrivnosti raztresene po več sistemih
- 🔴 **Tveganja skladnosti** - ne prestane varnostnih revizij

### Rešitev: Upravljena identiteta

**Po upravljani identiteti:**
```javascript
// ✅ VARNO: V kodi ni skrivnih podatkov
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure samodejno poskrbi za avtentikacijo
);
```

**Prednosti:**
- ✅ **Brez skrivnosti** v kodi ali konfiguraciji
- ✅ **Samodejna rotacija** - Azure to upravlja
- ✅ **Popolna revizijska sled** v dnevnikih Azure AD
- ✅ **Centralizirana varnost** - upravljanje v Azure Portal
- ✅ **Pripravljeno na skladnost** - izpolnjuje varnostne standarde

**Prispodoba**: Tradicionalna avtentikacija je kot nošenje več fizičnih ključev za različna vrata. Upravljena identiteta je kot imetniška izkaznica, ki samodejno podeli dostop glede na to, kdo ste—brez ključev za izgubo, kopiranje ali rotacijo.

---

## Pregled arhitekture

### Potek avtentikacije z upravljeno identiteto

```mermaid
sequenceDiagram
    participant App as Vaša aplikacija<br/>(aplikacija v kontejnerju)
    participant MI as Upravljana identiteta<br/>(Azure AD)
    participant KV as Shramba ključev
    participant Storage as Azure Shramba
    participant DB as Azure SQL
    
    App->>MI: Zahteva dostopni žeton<br/>(samodejno)
    MI->>MI: Preveri identiteto<br/>(geslo ni potrebno)
    MI-->>App: Vrni žeton<br/>(veljaven 1 uro)
    
    App->>KV: Pridobi skrivnost<br/>(z uporabo žetona)
    KV->>KV: Preveri RBAC dovoljenja
    KV-->>App: Vrni vrednost skrivnosti
    
    App->>Storage: Naloži blob<br/>(z uporabo žetona)
    Storage->>Storage: Preveri RBAC dovoljenja
    Storage-->>App: Uspešno
    
    App->>DB: Poizveduj podatke<br/>(z uporabo žetona)
    DB->>DB: Preveri SQL dovoljenja
    DB-->>App: Vrni rezultate
    
    Note over App,DB: Vse preverjanja pristnosti brez gesla!
```
### Vrste upravljenih identitet

```mermaid
graph TB
    MI[Upravljana identiteta]
    SystemAssigned[Sistemsko dodeljena identiteta]
    UserAssigned[Uporabniško dodeljena identiteta]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Življenjski cikel povezan z virom]
    SystemAssigned --> SA2[Samodejno ustvarjanje/brisanje]
    SystemAssigned --> SA3[Najbolj primerno za en vir]
    
    UserAssigned --> UA1[Neodvisen življenjski cikel]
    UserAssigned --> UA2[Ročno ustvarjanje/brisanje]
    UserAssigned --> UA3[Deljeno med viri]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Značilnost | Sistemsko dodeljena | Uporabniško dodeljena |
|---------|----------------|---------------|
| **Življenjski ciklus** | Povezana z virom | Neodvisna |
| **Ustvarjanje** | Samodejno z virom | Ročno ustvarjanje |
| **Brisanje** | Izbriše se z virom | Obstane po izbrisu vira |
| **Deljenje** | Samo ena storitev | Več storitev |
| **Uporaba** | Preprosti scenariji | Kompleksni scenariji z več viri |
| **AZD privzeto** | ✅ Priporočeno | Neobvezno |

---

## Predpogoji

### Potrebna orodja

Morali bi imeti že nameščeno iz prejšnjih lekcij:

```bash
# Preverite Azure Developer CLI
azd version
# ✅ Pričakovano: azd različica 1.0.0 ali novejša

# Preverite Azure CLI
az --version
# ✅ Pričakovano: azure-cli različica 2.50.0 ali novejša
```

### Zahteve za Azure

- Aktivno Azure naročnino
- Pooblastila za:
  - Ustvarjanje upravljenih identitet
  - Dodeljevanje RBAC vlog
  - Ustvarjanje virov Key Vault
  - Razmestitev Container Apps

### Potrebno znanje

Morali bi biti zaključili:
- [Installation Guide](installation.md) - AZD namestitev
- [AZD Basics](azd-basics.md) - Osnovni koncepti
- [Configuration Management](configuration.md) - Okoljske spremenljivke

---

## Lekcija 1: Razumevanje vzorcev avtentikacije

### Vzorec 1: Nizi za povezavo (zastarano - izogibajte se)

**Kako deluje:**
```bash
# Niz za povezavo vsebuje poverilnice
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Težave:**
- ❌ Skrivnosti vidne v okoljskih spremenljivkah
- ❌ Zapisano v sistemih za razmestitev
- ❌ Težko za rotacijo
- ❌ Brez revizijske sledi dostopa

**Kdaj uporabiti:** Samo za lokalni razvoj, nikoli v produkciji.

---

### Vzorec 2: Referenčne vrednosti Key Vault (bolje)

**Kako deluje:**
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

**Prednosti:**
- ✅ Skrivnosti shranjene varno v Key Vault
- ✅ Centralizirano upravljanje skrivnosti
- ✅ Rotacija brez sprememb kode

**Omejitve:**
- ⚠️ Še vedno uporaba ključev/gesel
- ⚠️ Potrebno upravljanje dostopa do Key Vault

**Kdaj uporabiti:** Prehodni korak iz nizov za povezavo na upravljano identiteto.

---

### Vzorec 3: Upravljena identiteta (najboljša praksa)

**Kako deluje:**
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

**Koda aplikacije:**
```javascript
// Skrivnosti niso potrebne!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Prednosti:**
- ✅ Brez skrivnosti v kodi/konfiguraciji
- ✅ Samodejna rotacija poverilnic
- ✅ Popolna revizijska sledenje
- ✅ Dovoljenja na osnovi RBAC
- ✅ Pripravljeno na skladnost

**Kdaj uporabiti:** Vedno, za produkcijske aplikacije.

---

## Lekcija 2: Implementacija upravljane identitete z AZD

### Postopek po korakih

Zgradimo varno Container App, ki uporablja upravljeno identiteto za dostop do Azure Storage in Key Vault.

### Struktura projekta

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

### 1. Konfigurirajte AZD (azure.yaml)

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

### 2. Infrastruktura: Omogočanje upravljane identitete

**Datoteka: `infra/main.bicep`**

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

### 3. Container App z sistemsko dodeljeno identiteto

**Datoteka: `infra/app/container-app.bicep`**

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

### 4. Modul za dodeljevanje vlog RBAC

**Datoteka: `infra/core/role-assignment.bicep`**

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

### 5. Koda aplikacije z upravljeno identiteto

**Datoteka: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inicializiraj poverilnice (samodejno deluje z upravljano identiteto)
const credential = new DefaultAzureCredential();

// Nastavitev Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Ključi niso potrebni!
);

// Nastavitev Key Vaulta
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Ključi niso potrebni!
);

// Preverjanje stanja
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Naloži datoteko v Blob Storage
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

// Pridobi skrivnost iz Key Vaulta
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

// Naštej blob kontejnerje (prikazuje dostop za branje)
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

**Datoteka: `src/package.json`**

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

### 6. Razmestitev in preizkus

```bash
# Inicializiraj AZD okolje
azd init

# Razporedi infrastrukturo in aplikacijo
azd up

# Pridobi URL aplikacije
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Preizkusi preverjanje delovanja
curl $APP_URL/health
```

**✅ Pričakovani izhod:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Preizkus nalaganja bloba:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Pričakovani izhod:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Preizkus seznama kontejnerjev:**
```bash
curl $APP_URL/containers
```

**✅ Pričakovani izhod:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Pogoste vloge RBAC v Azure

### Vgrajene ID vloge za upravljeno identiteto

| Storitev | Ime vloge | ID vloge | Dovoljenja |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Branje blobov in kontejnerjev |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Branje, zapisovanje, brisanje blobov |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Branje, zapisovanje, brisanje sporočil v vrstah |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Branje skrivnosti |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Branje, zapisovanje, brisanje skrivnosti |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Branje podatkov Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Branje, zapisovanje podatkov Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Upravljanje SQL baz podatkov |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Pošiljanje, prejemanje, upravljanje sporočil |

### Kako poiskati ID vloge

```bash
# Prikaži vse vgrajene vloge
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Poišči določeno vlogo
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Pridobi podrobnosti o vlogi
az role definition list --name "Storage Blob Data Contributor"
```

---

## Praktične vaje

### Vaja 1: Omogočanje upravljane identitete za obstoječo aplikacijo ⭐⭐ (Srednje)

**Cilj**: Dodajte upravljeno identiteto obstoječi razmestitvi Container App

**Scenarij**: Imate Container App, ki uporablja nize za povezavo. Pretvorite ga v upravljano identiteto.

**Izhodišče**: Container App s to konfiguracijo:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Koraki**:

1. **Omogočite upravljano identiteto v Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Dodelite dostop do Storage:**

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

3. **Posodobite kodo aplikacije:**

**Pred (niz povezave):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Po (upravljana identiteta):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Posodobite okoljske spremenljivke:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Razmestite in preizkusite:**

```bash
# Ponovno razmestite
azd up

# Preizkusite, ali še deluje
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Merila uspeha:**
- ✅ Aplikacija se razstavi brez napak
- ✅ Operacije Storage delujejo (nalaganje, seznam, prenos)
- ✅ V okoljskih spremenljivkah ni nizov za povezavo
- ✅ Identiteta vidna v Azure Portalu pod zavihek "Identity"

**Preverjanje:**

```bash
# Preverite, ali je omogočena upravljana identiteta
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Pričakovano: "SystemAssigned"

# Preverite dodelitev vloge
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Pričakovano: Prikaže vlogo "Storage Blob Data Contributor"
```

**Čas**: 20-30 minut

---

### Vaja 2: Dostop več storitev z uporabniško dodeljeno identiteto ⭐⭐⭐ (Napredno)

**Cilj**: Ustvarite uporabniško dodeljeno identiteto, ki jo delijo več Container App-ov

**Scenarij**: Imate 3 mikrostoritve, ki vse potrebujejo dostop do istega Storage računa in Key Vault.

**Koraki**:

1. **Ustvarite uporabniško dodeljeno identiteto:**

**Datoteka: `infra/core/identity.bicep`**

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

2. **Dodelite vloge uporabniško dodeljeni identiteti:**

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

3. **Dodelite identiteto več Container App-om:**

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

4. **Koda aplikacije (vse storitve uporabljajo enak vzorec):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Za uporabniško dodeljeno identiteto navedite ID odjemalca
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID odjemalca uporabniško dodeljene identitete
);

// Ali uporabite DefaultAzureCredential (samodejno zazna)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Razmestite in preverite:**

```bash
azd up

# Preverite, ali lahko vse storitve dostopajo do shrambe
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Merila uspeha:**
- ✅ Ena identiteta deljena med 3 storitvami
- ✅ Vse storitve imajo dostop do Storage in Key Vault
- ✅ Identiteta ostane, če izbrišete eno storitev
- ✅ Centralizirano upravljanje dovoljenj

**Prednosti uporabniško dodeljene identitete:**
- Ena identiteta za upravljanje
- Dosledna dovoljenja med storitvami
- Preživi izbris storitve
- Bolje za kompleksne arhitekture

**Čas**: 30-40 minut

---

### Vaja 3: Izvedba rotacije skrivnosti v Key Vault ⭐⭐⭐ (Napredno)

**Cilj**: Shranite API ključe tretjih oseb v Key Vault in dostopajte do njih z upravljeno identiteto

**Scenarij**: Vaša aplikacija kliče zunanji API (OpenAI, Stripe, SendGrid), ki zahteva API ključe.

**Koraki**:

1. **Ustvarite Key Vault z RBAC:**

**Datoteka: `infra/core/keyvault.bicep`**

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

2. **Shranjevanje skrivnosti v Key Vault:**

```bash
# Pridobi ime Key Vaulta
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Shrani API ključe tretjih oseb
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

3. **Koda aplikacije za pridobivanje skrivnosti:**

**Datoteka: `src/config.js`**

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
    // Najprej preveri predpomnilnik
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

4. **Uporaba skrivnosti v aplikaciji:**

**Datoteka: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inicializiraj OpenAI s ključem iz Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Pokliči ob zagonu
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

5. **Razmestite in preizkusite:**

```bash
azd up

# Preveri, ali API ključi delujejo
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Merila uspeha:**
- ✅ Brez API ključev v kodi ali okoljskih spremenljivkah
- ✅ Aplikacija pridobi ključe iz Key Vault
- ✅ Tretji strankini API-ji delujejo pravilno
- ✅ Ključe lahko rotirate brez sprememb kode

**Rotirajte skrivnost:**

```bash
# Posodobi skrivnost v Key Vaultu
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Ponovno zaženi aplikacijo, da uporabi nov ključ
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Čas**: 25-35 minut

---

## Preverjanje znanja

### 1. Vzorci avtentikacije ✓

Preizkusite svoje razumevanje:

- [ ] **V1**: Kateri so trije glavni vzorci avtentikacije? 
  - **O**: Connection strings (legacy), Key Vault references (transition), Managed Identity (best)

- [ ] **V2**: Zakaj je upravljana identiteta boljša kot nizi za povezavo?
  - **O**: Brez skrivnosti v kodi, samodejna rotacija, popolna revizijska sled, dovoljenja na osnovi RBAC

- [ ] **V3**: Kdaj bi uporabili uporabniško dodeljeno identiteto namesto sistemsko dodeljene?
  - **O**: Ko delite identiteto med več viri ali ko je življenjski cikel identitete neodvisen od življenjskega cikla vira

**Praktična preveritev:**
```bash
# Preverite, katero vrsto identitete uporablja vaša aplikacija
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Naštejte vse dodelitve vlog za identiteto
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC in dovoljenja ✓

Preizkusite svoje razumevanje:

- [ ] **V1**: Kakšen je ID vloge za "Storage Blob Data Contributor"?
  - **O**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **V2**: Katere pravice zagotavlja "Key Vault Secrets User"?
  - **O**: Samo bralni dostop do skrivnosti (ne more ustvarjati, posodabljati ali brisati)

- [ ] **V3**: Kako dodelite Container App dostop do Azure SQL?
  - **O**: Dodelite vlogo "SQL DB Contributor" ali konfigurirajte Azure AD avtentikacijo za SQL

**Praktična preveritev:**
```bash
# Poišči določeno vlogo
az role definition list --name "Storage Blob Data Contributor"

# Preveri, katere vloge so dodeljene vaši identiteti
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integracija Key Vault ✓
- [ ] **Q1**: Kako omogočite RBAC za Key Vault namesto dostopnih politik?
  - **A**: Nastavite `enableRbacAuthorization: true` v Bicep

- [ ] **Q2**: Katera knjižnica Azure SDK upravlja overjanje z upravljano identiteto?
  - **A**: `@azure/identity` z razredom `DefaultAzureCredential`

- [ ] **Q3**: Kako dolgo skrivnosti Key Vault ostanejo v predpomnilniku?
  - **A**: Odvisno od aplikacije; implementirajte svojo strategijo predpomnjenja

**Hands-On Verification:**
```bash
# Preizkusite dostop do Key Vaulta
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Preverite, ali je RBAC omogočen
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Pričakovano: true
```

---

## Najboljše varnostne prakse

### ✅ NAREDITE:

1. **Vedno uporabljajte upravljano identiteto v produkcijskem okolju**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Uporabljajte RBAC vloge z najmanjšimi privilegiji**
   - Uporabljajte "Reader" vloge, kadar je mogoče
   - Izogibajte se vlogam "Owner" ali "Contributor", razen če je nujno

3. **Shranjujte ključe tretjih strank v Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Omogočite revizijsko beleženje**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Uporabljajte različne identitete za dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Redno rotirajte skrivnosti**
   - Nastavite datume poteka za skrivnosti v Key Vault
   - Avtomatizirajte rotacijo z Azure Functions

### ❌ NE DELAJTE:

1. **Nikoli ne vgrajujte skrivnosti neposredno v kodo**
   ```javascript
   // ❌ SLABO
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Ne uporabljajte povezovalnih nizov (connection strings) v produkciji**
   ```javascript
   // ❌ SLABO
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Ne podeljujte prekomernih dovoljenj**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Ne beležite skrivnosti v dnevnikih**
   ```javascript
   // ❌ SLABO
   console.log('API Key:', apiKey);
   
   // ✅ DOBRO
   console.log('API Key retrieved successfully');
   ```

5. **Ne delite produkcijskih identitet med okolji**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Vodnik za odpravljanje težav

### Težava: "Unauthorized" pri dostopu do Azure Storage

**Simptomi:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnoza:**

```bash
# Preverite, ali je upravljana identiteta omogočena
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Pričakovano: "SystemAssigned" ali "UserAssigned"

# Preverite dodelitve vlog
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Pričakovano: Videti bi morali "Storage Blob Data Contributor" ali podobno vlogo
```

**Rešitve:**

1. **Dodelite pravilno RBAC vlogo:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Počakajte na propagacijo (lahko traja 5–10 minut):**
```bash
# Preveri stanje dodelitve vloge
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Preverite, da aplikacijska koda uporablja pravilne poverilnice:**
```javascript
// Prepričajte se, da uporabljate DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Težava: Dostop do Key Vault zavrnjen

**Simptomi:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnoza:**

```bash
# Preveri, ali je za Key Vault omogočen RBAC
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Pričakovano: true

# Preveri dodelitve vlog
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Rešitve:**

1. **Omogočite RBAC na Key Vaultu:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Dodelite vlogo Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Težava: DefaultAzureCredential ne deluje lokalno

**Simptomi:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnoza:**

```bash
# Preverite, ali ste prijavljeni
az account show

# Preverite overitev Azure CLI
az ad signed-in-user show
```

**Rešitve:**

1. **Prijavite se v Azure CLI:**
```bash
az login
```

2. **Nastavite Azure naročnino:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Za lokalni razvoj uporabite okoljske spremenljivke:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Ali lokalno uporabite drug način overjanja:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Uporabite AzureCliCredential za lokalni razvoj
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Težava: Dodelitev vloge se prepočasi propagira

**Simptomi:**
- Vloga je bila uspešno dodeljena
- Še vedno prejemate napake 403
- Občasni dostop (včasih deluje, včasih ne)

**Razlaga:**
Spremembe v Azure RBAC se lahko propagirajo globalno 5–10 minut.

**Rešitev:**

```bash
# Počakajte in poskusite znova
echo "Waiting for RBAC propagation..."
sleep 300  # Počakajte 5 minut

# Preizkusite dostop
curl https://myapp.azurecontainerapps.io/upload

# Če še vedno ne deluje, znova zaženite aplikacijo
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Upoštevanje stroškov

### Stroški upravljane identitete

| Vir | Stroški |
|----------|------|
| **Upravljana identiteta** | 🆓 **BREZPLAČNO** - Brez stroškov |
| **Dodelitve RBAC vlog** | 🆓 **BREZPLAČNO** - Brez stroškov |
| **Zahteve za Azure AD žetone** | 🆓 **BREZPLAČNO** - Vključeno |
| **Operacije Key Vault** | $0.03 per 10,000 operations |
| **Shramba Key Vault** | $0.024 per secret per month |

**Upravljana identiteta prihrani denar z:**
- ✅ Odpravo operacij Key Vault za overjanje med storitvami
- ✅ Zmanjšanjem varnostnih incidentov (brez razkritih poverilnic)
- ✅ Zmanjšanjem operativne obremenitve (brez ročne rotacije)

**Primerjava stroškov (mesečno):**

| Scenarij | Connection Strings | Managed Identity | Prihranek |
|----------|-------------------|-----------------|---------|
| Majhna aplikacija (1M zahtev) | ~$50 (Key Vault + ops) | ~$0 | $50/mesec |
| Srednja aplikacija (10M zahtev) | ~$200 | ~$0 | $200/mesec |
| Velika aplikacija (100M zahtev) | ~$1,500 | ~$0 | $1,500/mesec |

---

## Več informacij

### Uradna dokumentacija
- [Upravljana identiteta Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Dokumentacija SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Naslednji koraki v tem tečaju
- ← Prejšnje: [Upravljanje konfiguracije](configuration.md)
- → Naslednje: [Prvi projekt](first-project.md)
- 🏠 [Domača stran tečaja](../../README.md)

### Povezani primeri
- [Primer klepeta Azure OpenAI](../../../../examples/azure-openai-chat) - Uporablja upravljano identiteto za Azure OpenAI
- [Primer mikrostoritev](../../../../examples/microservices) - Vzorci overjanja za več storitev

---

## Povzetek

**Naučili ste se:**
- ✅ Tri vzorce overjanja (povezovalni nizi, Key Vault, upravljana identiteta)
- ✅ Kako omogočiti in konfigurirati upravljano identiteto v AZD
- ✅ Dodelitve RBAC vlog za storitve Azure
- ✅ Integracija Key Vault za skrivnosti tretjih strank
- ✅ Uporabniško dodeljene proti sistemsko dodeljenim identitetam
- ✅ Najboljše varnostne prakse in odpravljanje težav

**Ključne ugotovitve:**
1. **Vedno uporabljajte upravljano identiteto v produkciji** - Brez skrivnosti, samodejna rotacija
2. **Uporabljajte RBAC vloge z najmanjšimi privilegiji** - Dodeljujte samo potrebna dovoljenja
3. **Shranjujte ključe tretjih strank v Key Vault** - Centralizirano upravljanje skrivnosti
4. **Ločite identitete po okoljih** - Izolacija dev, staging, prod
5. **Omogočite revizijsko beleženje** - Spremljajte, kdo je dostopal do česa

**Naslednji koraki:**
1. Dokončajte praktične vaje zgoraj
2. Migrirajte obstoječo aplikacijo iz povezovalnih nizov na upravljano identiteto
3. Zgradite svoj prvi AZD projekt z varnostjo od prvega dne: [Prvi projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za avtomatski prevod AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, upoštevajte, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovni prevod, opravljen s strani človeka. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
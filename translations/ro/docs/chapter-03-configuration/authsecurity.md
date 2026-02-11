# Modele de autentificare și Identitate gestionată

⏱️ **Timp estimat**: 45-60 minute | 💰 **Impact costuri**: Gratuit (fără costuri suplimentare) | ⭐ **Complexitate**: Intermediar

**📚 Parcurs de învățare:**
- ← Anterior: [Gestionarea Configurațiilor](configuration.md) - Gestionarea variabilelor de mediu și a secretelor
- 🎯 **Ești aici**: Autentificare & Securitate (Identitate gestionată, Key Vault, modele securizate)
- → Următor: [Primul Proiect](first-project.md) - Construiește prima ta aplicație AZD
- 🏠 [Pagina cursului](../../README.md)

---

## Ce vei învăța

Parcurgând această lecție, vei:
- Înțelege modelele de autentificare Azure (chei, șiruri de conectare, identitate gestionată)
- Implementa **Identitate gestionată** pentru autentificare fără parole
- Proteja secretele cu integrarea **Azure Key Vault**
- Configura **controlul accesului bazat pe roluri (RBAC)** pentru implementările AZD
- Aplică bune practici de securitate în Container Apps și servicii Azure
- Migrează de la autentificare bazată pe chei la autentificare bazată pe identitate

## De ce contează Identitatea gestionată

### Problema: Autentificarea tradițională

**Înainte de Identitatea Gestionată:**
```javascript
// ❌ RISC DE SECURITATE: Secrete incluse direct în cod
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Probleme:**
- 🔴 **Secrete expuse** în cod, fișiere de configurare, variabile de mediu
- 🔴 **Rotirea credențialelor** necesită modificări în cod și redeploy
- 🔴 **Coșmaruri la audit** - cine a accesat ce și când?
- 🔴 **Împrăștiere** - secrete răspândite în mai multe sisteme
- 🔴 **Riscuri de conformitate** - nu trece auditurile de securitate

### Soluția: Identitate gestionată

**După Identitatea Gestionată:**
```javascript
// ✅ Securizat: Niciun secret în cod
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure gestionează automat autentificarea
);
```

**Beneficii:**
- ✅ **Zero secrete** în cod sau configurație
- ✅ **Rotire automată** - Azure se ocupă de asta
- ✅ **Urmă completă a auditului** în jurnalele Azure AD
- ✅ **Securitate centralizată** - gestionezi din Azure Portal
- ✅ **Pregătit pentru conformitate** - respectă standardele de securitate

**Analogii**: Autentificarea tradițională e ca și cum ai purta mai multe chei fizice pentru uși diferite. Identitatea gestionată e ca un ecuson de securitate care acordă acces automat în funcție de cine ești — fără chei de pierdut, copiați sau rotit.

---

## Prezentare arhitecturală

### Fluxul de autentificare cu Identitate gestionată

```mermaid
sequenceDiagram
    participant App as Aplicația dvs.<br/>(Aplicație în container)
    participant MI as Identitate gestionată<br/>(Azure AD)
    participant KV as Seif de chei
    participant Storage as Stocare Azure
    participant DB as Azure SQL
    
    App->>MI: Solicita token de acces<br/>(automat)
    MI->>MI: Verifică identitatea<br/>(fără parolă necesară)
    MI-->>App: Returnează tokenul<br/>(valabil 1 oră)
    
    App->>KV: Obține secretul<br/>(folosind tokenul)
    KV->>KV: Verifică permisiunile RBAC
    KV-->>App: Returnează valoarea secretului
    
    App->>Storage: Încarcă blob<br/>(folosind tokenul)
    Storage->>Storage: Verifică permisiunile RBAC
    Storage-->>App: Succes
    
    App->>DB: Interoghează date<br/>(folosind tokenul)
    DB->>DB: Verifică permisiunile SQL
    DB-->>App: Returnează rezultatele
    
    Note over App,DB: Toată autentificarea este fără parolă!
```
### Tipuri de identități gestionate

```mermaid
graph TB
    MI[Identitate gestionată]
    SystemAssigned[Identitate atribuită sistemului]
    UserAssigned[Identitate atribuită utilizatorului]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Ciclul de viață legat de resursă]
    SystemAssigned --> SA2[Creare/ștergere automată]
    SystemAssigned --> SA3[Potrivită pentru o singură resursă]
    
    UserAssigned --> UA1[Ciclul de viață independent]
    UserAssigned --> UA2[Creare/ștergere manuală]
    UserAssigned --> UA3[Partajată între resurse]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Caracteristică | Atribuită sistemului | Atribuită utilizatorului |
|---------|----------------|---------------|
| **Durata de viață** | Legată de resursă | Independentă |
| **Creare** | Automată odată cu resursa | Creare manuală |
| **Ștergere** | Ștearsă odată cu resursa | Persistă după ștergerea resursei |
| **Partajare** | O singură resursă | Mai multe resurse |
| **Caz de utilizare** | Scenarii simple | Scenarii complexe multi-resursă |
| **AZD implicit** | ✅ Recomandat | Opțional |

---

## Cerințe prealabile

### Instrumente necesare

Ar trebui să aveți deja instalate acestea din lecțiile anterioare:

```bash
# Verificați Azure Developer CLI
azd version
# ✅ Așteptat: azd versiunea 1.0.0 sau mai recentă

# Verificați Azure CLI
az --version
# ✅ Așteptat: azure-cli 2.50.0 sau mai recentă
```

### Cerințe Azure

- Abonament Azure activ
- Permisiuni pentru:
  - Crearea de identități gestionate
  - Atribuirea rolurilor RBAC
  - Crearea resurselor Key Vault
  - Implementarea Container Apps

### Cunoștințe prealabile

Ar trebui să fi parcurs:
- [Ghid de instalare](installation.md) - Configurare AZD
- [Noțiuni de bază AZD](azd-basics.md) - Concepte de bază
- [Gestionarea Configurațiilor](configuration.md) - Variabile de mediu

---

## Lecția 1: Înțelegerea modelelor de autentificare

### Modelul 1: Șiruri de conectare (Moștenit - Evitați)

**Cum funcționează:**
```bash
# Șirul de conexiune conține datele de autentificare
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Probleme:**
- ❌ Secrete vizibile în variabilele de mediu
- ❌ Înregistrate în sistemele de deploy
- ❌ Dificil de rotit
- ❌ Fără traseu de audit

**Când să folosești:** Doar pentru dezvoltare locală, niciodată în producție.

---

### Modelul 2: Referințe Key Vault (Mai bun)

**Cum funcționează:**
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

**Beneficii:**
- ✅ Secrete stocate în siguranță în Key Vault
- ✅ Management centralizat al secretelor
- ✅ Rotire fără modificări de cod

**Limitări:**
- ⚠️ Încă se folosesc chei/parole
- ⚠️ Trebuie gestionat accesul la Key Vault

**Când să folosești:** Pas de tranziție de la șiruri de conectare la identitate gestionată.

---

### Modelul 3: Identitate gestionată (Cea mai bună practică)

**Cum funcționează:**
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

**Codul aplicației:**
```javascript
// Nu sunt necesare secrete!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Beneficii:**
- ✅ Zero secrete în cod/config
- ✅ Rotire automată a credențialelor
- ✅ Urmă completă a auditului
- ✅ Permisiuni bazate pe RBAC
- ✅ Pregătit pentru conformitate

**Când să folosești:** Întotdeauna, pentru aplicații de producție.

---

## Lecția 2: Implementarea Identității Gestionate cu AZD

### Implementare pas cu pas

Să construim o Container App sigură care folosește identitate gestionată pentru a accesa Azure Storage și Key Vault.

### Structura proiectului

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

### 1. Configurează AZD (azure.yaml)

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

### 2. Infrastructură: Activarea Identității Gestionate

**Fișier: `infra/main.bicep`**

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

### 3. Container App cu identitate atribuită sistemului

**Fișier: `infra/app/container-app.bicep`**

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

### 4. Modul de atribuire a rolurilor RBAC

**Fișier: `infra/core/role-assignment.bicep`**

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

### 5. Codul aplicației cu Identitate Gestionată

**Fișier: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inițializează acreditarea (funcționează automat cu identitate gestionată)
const credential = new DefaultAzureCredential();

// Configurare stocare Azure
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Nu sunt necesare chei!
);

// Configurare Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Nu sunt necesare chei!
);

// Verificare stare de sănătate
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Încarcă fișier în Blob Storage
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

// Obține secret din Key Vault
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

// Listează containere blob (demonstrează acces de citire)
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

**Fișier: `src/package.json`**

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

### 6. Implementare și testare

```bash
# Inițializează mediul AZD
azd init

# Desfășoară infrastructura și aplicația
azd up

# Obține URL-ul aplicației
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Testează verificarea stării de sănătate
curl $APP_URL/health
```

**✅ Ieșire așteptată:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Test încărcare blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Ieșire așteptată:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Test listare containere:**
```bash
curl $APP_URL/containers
```

**✅ Ieșire așteptată:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Roluri RBAC comune în Azure

### ID-urile rolurilor încorporate pentru Identitate gestionată

| Serviciu | Nume rol | ID rol | Permisiuni |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Citire blob-uri și containere |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Citire, scriere, ștergere blob-uri |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Citire, scriere, ștergere mesaje în coadă |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Citire secrete |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Citire, scriere, ștergere secrete |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Citire date Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Citire, scriere date Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Gestionare baze de date SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Trimitere, primire, gestionare mesaje |

### Cum să găsești ID-urile rolurilor

```bash
# Listează toate rolurile încorporate
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Caută un rol specific
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Obține detaliile rolului
az role definition list --name "Storage Blob Data Contributor"
```

---

## Exerciții practice

### Exercițiul 1: Activarea identității gestionate pentru o aplicație existentă ⭐⭐ (Mediu)

**Obiectiv**: Adaugă identitate gestionată la o implementare Container App existentă

**Scenariu**: Ai o Container App care folosește șiruri de conectare. Convertește-o la identitate gestionată.

**Punct de plecare**: Container App cu această configurație:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Pași**:

1. **Activează identitatea gestionată în Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Acordă acces la Storage:**

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

3. **Actualizează codul aplicației:**

**Înainte (șir de conectare):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**După (identitate gestionată):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Actualizează variabilele de mediu:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Implementare și testare:**

```bash
# Relansează
azd up

# Verifică dacă încă funcționează
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Criterii de succes:**
- ✅ Aplicația se implementează fără erori
- ✅ Operațiunile pe Storage funcționează (încărcare, listare, descărcare)
- ✅ Nu există șiruri de conectare în variabilele de mediu
- ✅ Identitatea este vizibilă în Azure Portal sub fila "Identity"

**Verificare:**

```bash
# Verificați dacă identitatea gestionată este activată
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Așteptat: "SystemAssigned"

# Verificați atribuirea rolului
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Așteptat: Afișează rolul "Storage Blob Data Contributor"
```

**Timp**: 20-30 minute

---

### Exercițiul 2: Acces multi-serviciu cu identitate atribuită utilizatorului ⭐⭐⭐ (Avansat)

**Obiectiv**: Creează o identitate atribuită utilizatorului partajată între mai multe Container Apps

**Scenariu**: Ai 3 microservicii care au nevoie de acces la același cont Storage și Key Vault.

**Pași**:

1. **Creează identitate atribuită utilizatorului:**

**Fișier: `infra/core/identity.bicep`**

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

2. **Atribuie roluri identității atribuite utilizatorului:**

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

3. **Atribuie identitatea mai multor Container Apps:**

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

4. **Codul aplicației (toate serviciile folosesc același model):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Pentru identitatea atribuită utilizatorului, specificați ID-ul clientului
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID-ul clientului pentru identitatea atribuită utilizatorului
);

// Sau utilizați DefaultAzureCredential (detectează automat)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Implementare și verificare:**

```bash
azd up

# Testează dacă toate serviciile pot accesa stocarea
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Criterii de succes:**
- ✅ O identitate partajată între 3 servicii
- ✅ Toate serviciile pot accesa Storage și Key Vault
- ✅ Identitatea persistă dacă ștergi un serviciu
- ✅ Management centralizat al permisiunilor

**Beneficii ale identității atribuite utilizatorului:**
- O singură identitate de gestionat
- Permisiuni consistente între servicii
- Supraviețuiește ștergerii unui serviciu
- Mai potrivit pentru arhitecturi complexe

**Timp**: 30-40 minute

---

### Exercițiul 3: Implementarea rotației secretelor în Key Vault ⭐⭐⭐ (Avansat)

**Obiectiv**: Stochează chei API terțe în Key Vault și accesează-le folosind identitate gestionată

**Scenariu**: Aplicația ta trebuie să apeleze un API extern (OpenAI, Stripe, SendGrid) care necesită chei API.

**Pași**:

1. **Creează Key Vault cu RBAC:**

**Fișier: `infra/core/keyvault.bicep`**

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

2. **Stochează secrete în Key Vault:**

```bash
# Obține numele Key Vault-ului
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Stochează cheile API ale terților
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

3. **Codul aplicației pentru preluarea secretelor:**

**Fișier: `src/config.js`**

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
    // Verifică mai întâi cache-ul
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

4. **Folosește secretele în aplicație:**

**Fișier: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inițializează OpenAI cu cheia din Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Apelează la pornire
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

5. **Implementare și testare:**

```bash
azd up

# Testează dacă cheile API funcționează
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Criterii de succes:**
- ✅ Niciună cheie API în cod sau variabilele de mediu
- ✅ Aplicația preia cheile din Key Vault
- ✅ API-urile terțe funcționează corect
- ✅ Poți roti cheile fără modificări de cod

**Rotirea unui secret:**

```bash
# Actualizează secretul din Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Repornește aplicația pentru a prelua noua cheie
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Timp**: 25-35 minute

---

## Punct de verificare a cunoștințelor

### 1. Modele de autentificare ✓

Testează-ți înțelegerea:

- [ ] **Q1**: Care sunt cele trei modele principale de autentificare? 
  - **R**: Șiruri de conectare (moștenit), Referințe Key Vault (tranziție), Identitate gestionată (cel mai bun)
- [ ] **Q2**: De ce este identitatea gestionată mai bună decât șirurile de conectare?
  - **R**: Fără secrete în cod, rotire automată, urma completă a auditului, permisiuni RBAC
- [ ] **Q3**: Când ai folosi o identitate atribuită utilizatorului în loc de una atribuită sistemului?
  - **R**: Când vrei să partajezi identitatea între mai multe resurse sau când ciclul de viață al identității este independent de cel al resursei

**Verificare practică:**
```bash
# Verifică ce tip de identitate folosește aplicația ta
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Listează toate atribuțiile de rol pentru acea identitate
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC și Permisiuni ✓

Testează-ți înțelegerea:

- [ ] **Q1**: Care este ID-ul rolului pentru "Storage Blob Data Contributor"?
  - **R**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`
- [ ] **Q2**: Ce permisiuni oferă "Key Vault Secrets User"?
  - **R**: Acces doar în citire la secrete (nu poate crea, actualiza sau șterge)
- [ ] **Q3**: Cum acorzi unei Container App acces la Azure SQL?
  - **R**: Atribuind rolul "SQL DB Contributor" sau configurând autentificare Azure AD pentru SQL

**Verificare practică:**
```bash
# Găsește un rol specific
az role definition list --name "Storage Blob Data Contributor"

# Verifică ce roluri sunt atribuite identității tale
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrarea Key Vault ✓

Testează înțelegerea:
- [ ] **Q1**: Cum activezi RBAC pentru Key Vault în loc de politicile de acces?
  - **A**: Setează `enableRbacAuthorization: true` în Bicep

- [ ] **Q2**: Ce bibliotecă din Azure SDK se ocupă de autentificarea cu identitate gestionată?
  - **A**: `@azure/identity` cu clasa `DefaultAzureCredential`

- [ ] **Q3**: Cât timp rămân secretele din Key Vault în cache?
  - **A**: Depinde de aplicație; implementați propria strategie de cache

**Verificare practică:**
```bash
# Testează accesul la Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Verifică dacă RBAC este activat
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Așteptat: true
```

---

## Cele mai bune practici de securitate

### ✅ DE FĂCUT:

1. **Folosiți întotdeauna identitate gestionată în producție**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Folosiți roluri RBAC cu privilegiu minim**
   - Folosiți roluri "Reader" atunci când este posibil
   - Evitați "Owner" sau "Contributor" decât dacă este necesar

3. **Stocați cheile terților în Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Activați jurnalizarea de audit**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Folosiți identități diferite pentru dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rotiți secretele în mod regulat**
   - Stabiliți date de expirare pentru secretele din Key Vault
   - Automatizați rotația cu Azure Functions

### ❌ NU FACEȚI:

1. **Nu introduceți niciodată secrete în cod**
   ```javascript
   // ❌ RĂU
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Nu folosiți șiruri de conexiune în producție**
   ```javascript
   // ❌ RĂU
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Nu acordați permisiuni excesive**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Nu înregistrați secretele în jurnale**
   ```javascript
   // ❌ GREȘIT
   console.log('API Key:', apiKey);
   
   // ✅ CORECT
   console.log('API Key retrieved successfully');
   ```

5. **Nu partajați identitățile de producție între medii**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Ghid de depanare

### Problemă: "Unauthorized" when accessing Azure Storage

**Simptome:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnostic:**

```bash
# Verificați dacă identitatea gestionată este activată
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Așteptat: "SystemAssigned" sau "UserAssigned"

# Verificați atribuțiile rolurilor
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Așteptat: Ar trebui să vedeți "Storage Blob Data Contributor" sau un rol similar
```

**Soluții:**

1. **Acordați rolul RBAC corect:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Așteptați propagarea (poate dura 5-10 minute):**
```bash
# Verifică starea atribuirii rolului
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Verificați că codul aplicației folosește acreditarea corectă:**
```javascript
// Asigură-te că folosești DefaultAzureCredential.
const credential = new DefaultAzureCredential();
```

---

### Problemă: Accesul la Key Vault refuzat

**Simptome:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnostic:**

```bash
# Verifică dacă RBAC pentru Key Vault este activat
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Așteptat: true

# Verifică atribuiri de roluri
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Soluții:**

1. **Activați RBAC pe Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Acordați rolul Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problemă: DefaultAzureCredential nu funcționează local

**Simptome:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnostic:**

```bash
# Verifică dacă ești autentificat
az account show

# Verifică autentificarea Azure CLI
az ad signed-in-user show
```

**Soluții:**

1. **Autentificați-vă la Azure CLI:**
```bash
az login
```

2. **Setați abonamentul Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Pentru dezvoltare locală, folosiți variabile de mediu:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Sau folosiți o acreditare diferită local:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Folosiți AzureCliCredential pentru dezvoltare locală
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problemă: Atribuirea rolului durează prea mult pentru a se propaga

**Simptome:**
- Rol atribuit cu succes
- Încă apare eroarea 403
- Acces intermitent (uneori funcționează, alteori nu)

**Explicație:**
Modificările RBAC în Azure pot dura 5-10 minute pentru a se propaga la nivel global.

**Soluție:**

```bash
# Așteaptă și încearcă din nou
echo "Waiting for RBAC propagation..."
sleep 300  # Așteaptă 5 minute

# Testează accesul
curl https://myapp.azurecontainerapps.io/upload

# Dacă încă nu funcționează, repornește aplicația
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Considerații privind costurile

### Costuri pentru identitatea gestionată

| Resursă | Cost |
|----------|------|
| **Identitate gestionată** | 🆓 **GRATUIT** - Fără cost |
| **Atribuiri rol RBAC** | 🆓 **GRATUIT** - Fără cost |
| **Solicitări token Azure AD** | 🆓 **GRATUIT** - Inclus |
| **Operațiuni Key Vault** | $0.03 per 10,000 operațiuni |
| **Stocare Key Vault** | $0.024 per secret pe lună |

**Identitatea gestionată economisește bani prin:**
- ✅ Eliminarea operațiunilor Key Vault pentru autentificarea serviciu-la-serviciu
- ✅ Reducerea incidentelor de securitate (fără acreditări scurse)
- ✅ Scăderea overhead-ului operațional (fără rotație manuală)

**Exemplu de comparație a costurilor (lunare):**

| Scenariu | Șiruri de conexiune | Identitate gestionată | Economii |
|----------|-------------------|-----------------|---------|
| Aplicație mică (1M solicitări) | ~$50 (Key Vault + ops) | ~$0 | $50/lună |
| Aplicație medie (10M solicitări) | ~$200 | ~$0 | $200/lună |
| Aplicație mare (100M solicitări) | ~$1,500 | ~$0 | $1,500/lună |

---

## Aflați mai multe

### Documentație oficială
- [Identitate gestionată Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Documentația SDK-ului
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Pașii următori în acest curs
- ← Anterior: [Gestionarea configurației](configuration.md)
- → Următor: [Primul proiect](first-project.md)
- 🏠 [Pagina principală a cursului](../../README.md)

### Exemple conexe
- [Exemplu Azure OpenAI Chat](../../../../examples/azure-openai-chat) - Folosește identitate gestionată pentru Azure OpenAI
- [Exemplu microservicii](../../../../examples/microservices) - Modele de autentificare multi-serviciu

---

## Rezumat

**Ați învățat:**
- ✅ Trei modele de autentificare (șiruri de conexiune, Key Vault, identitate gestionată)
- ✅ Cum să activați și să configurați identitatea gestionată în AZD
- ✅ Atribuiri de rol RBAC pentru serviciile Azure
- ✅ Integrarea Key Vault pentru secrete terțe
- ✅ Identități atribuite de utilizator vs atribuite de sistem
- ✅ Cele mai bune practici de securitate și depanare

**Aspecte cheie:**
1. **Folosiți întotdeauna identitatea gestionată în producție** - Fără secrete, rotație automată
2. **Folosiți roluri RBAC cu privilegiu minim** - Acordați doar permisiunile necesare
3. **Stocați cheile terților în Key Vault** - Management centralizat al secretelor
4. **Separați identitățile per mediu** - Izolare dev, staging, prod
5. **Activați jurnalizarea de audit** - Urmăriți cine a accesat ce

**Pașii următori:**
1. Finalizați exercițiile practice de mai sus
2. Migrați o aplicație existentă de la șiruri de conexiune la identitate gestionată
3. Construiți primul proiect AZD cu securitate din prima zi: [Primul proiect](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm nicio răspundere pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
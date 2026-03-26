# Modele de Autentificare și Identitate Gestionată

⏱️ **Timp estimat**: 45-60 minute | 💰 **Impact cost**: Gratuit (fără costuri suplimentare) | ⭐ **Complexitate**: Intermediar

**📚 Parcurs de învățare:**
- ← Anterior: [Managementul Configurației](configuration.md) - Gestionarea variabilelor de mediu și secretelor
- 🎯 **Ești aici**: Autentificare & Securitate (Identitate Gestionată, Key Vault, modele securizate)
- → Următorul: [Primul Proiect](first-project.md) - Creează prima ta aplicație AZD
- 🏠 [Acasă Curs](../../README.md)

---

## Ce Vei Învăța

Prin finalizarea acestei lecții, vei:
- Înțelege modelele de autentificare Azure (chei, stringuri de conexiune, identitate gestionată)
- Implementa **Identitatea Gestionată** pentru autentificare fără parolă
- Proteja secretele cu integrarea **Azure Key Vault**
- Configura **controlul accesului bazat pe roluri (RBAC)** pentru implementările AZD
- Aplica bune practici de securitate în Container Apps și servicii Azure
- Migra de la autentificarea pe bază de chei la cea bazată pe identitate

## De ce Contează Identitatea Gestionată

### Problema: Autentificarea Tradițională

**Înainte de Identitatea Gestionată:**
```javascript
// ❌ RISC DE SECURITATE: Secrete hardcodate în cod
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Probleme:**
- 🔴 **Secrete expuse** în cod, fișiere de configurare, variabile de mediu
- 🔴 **Rotația credentialelor** necesită modificări în cod și redeploy
- 🔴 **Coșmaruri de audit** - cine a accesat ce, când?
- 🔴 **Fragmentare** - secrete împrăștiate în multiple sisteme
- 🔴 **Riscuri de conformitate** - neconform cu audituri de securitate

### Soluția: Identitatea Gestionată

**După Identitatea Gestionată:**
```javascript
// ✅ SECUR: Fără secrete în cod
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure gestionează automat autentificarea
);
```

**Beneficii:**
- ✅ **Zero secrete** în cod sau configurație
- ✅ **Rotație automată** - gestionată de Azure
- ✅ **Jurnal complet de audit** în logurile Azure AD
- ✅ **Securitate centralizată** - gestionată în Portalul Azure
- ✅ **Conformitate pregătită** - respectă standardele de securitate

**Analogie**: Autentificarea tradițională este ca purtarea mai multor chei fizice pentru uși diferite. Identitatea Gestionată este ca un ecuson de securitate care acordă acces automat bazat pe cine ești — fără chei de pierdut, copiat sau roatat.

---

## Prezentare Arhitecturală

### Fluxul de Autentificare cu Identitate Gestionată

```mermaid
sequenceDiagram
    participant App as Aplicația Dvs.<br/>(Aplicație Container)
    participant MI as Identitate Gestionată<br/>(Azure AD)
    participant KV as Key Vault
    participant Storage as Azure Storage
    participant DB as Azure SQL
    
    App->>MI: Solicită token de acces<br/>(automat)
    MI->>MI: Verifică identitatea<br/>(fără parolă necesară)
    MI-->>App: Returnează token<br/>(valid 1 oră)
    
    App->>KV: Obține secret<br/>(folosind token)
    KV->>KV: Verifică permisiunile RBAC
    KV-->>App: Returnează valoarea secretă
    
    App->>Storage: Încarcă blob<br/>(folosind token)
    Storage->>Storage: Verifică permisiunile RBAC
    Storage-->>App: Succes
    
    App->>DB: Interoghează date<br/>(folosind token)
    DB->>DB: Verifică permisiunile SQL
    DB-->>App: Returnează rezultate
    
    Note over App,DB: Toată autentificarea fără parolă!
```
### Tipuri de Identități Gestionate

```mermaid
graph TB
    MI[Identitate gestionată]
    SystemAssigned[Identitate atribuită sistemului]
    UserAssigned[Identitate atribuită utilizatorului]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Ciclu de viață legat de resursă]
    SystemAssigned --> SA2[Creare/ștergere automată]
    SystemAssigned --> SA3[Ideal pentru o singură resursă]
    
    UserAssigned --> UA1[Ciclu de viață independent]
    UserAssigned --> UA2[Creare/ștergere manuală]
    UserAssigned --> UA3[Partajată între resurse]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Caracteristică | Sistem-atribuită | Utilizator-atribuită |
|----------------|------------------|---------------------|
| **Durata de viață** | Legată de resursă | Independentă |
| **Creare** | Automată cu resursa | Creare manuală |
| **Ștergere** | Ștearsă odată cu resursa | Persistă după ștergerea resursei |
| **Partajare** | O singură resursă | Mai multe resurse |
| **Caz de utilizare** | Scenarii simple | Scenarii complexe cu multiple resurse |
| **Implicit AZD** | ✅ Recomandată | Opțională |

---

## Precondiții

### Unelte necesare

Ar trebui să ai deja instalate din lecțiile anterioare:

```bash
# Verificați Azure Developer CLI
azd version
# ✅ Așteptat: versiunea azd 1.0.0 sau mai mare

# Verificați Azure CLI
az --version
# ✅ Așteptat: azure-cli 2.50.0 sau mai mare
```

### Cerințe Azure

- Abonament Azure activ
- Permisiuni pentru:
  - Creare identități gestionate
  - Atribuire roluri RBAC
  - Creare resurse Key Vault
  - Implementare Container Apps

### Cunoștințe anterioare

Trebuie să fi finalizat:
- [Ghid de Installare](installation.md) - Configurare AZD
- [Bazele AZD](azd-basics.md) - Concepte de bază
- [Management Configurație](configuration.md) - Variabile de mediu

---

## Lecția 1: Înțelegerea Modelelor de Autentificare

### Modelul 1: Stringuri de Conexiune (Legacy - Evitat)

**Cum funcționează:**
```bash
# Șirul de conexiune conține acreditări
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Probleme:**
- ❌ Secrete vizibile în variabile de mediu
- ❌ Logate în sistemele de deploy
- ❌ Dificil de rotat
- ❌ Fără istoric de audit

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
- ✅ Secrete stocate securizat în Key Vault
- ✅ Management centralizat al secretelor
- ✅ Rotație fără modificări în cod

**Limitări:**
- ⚠️ Se folosesc încă chei/parole
- ⚠️ Trebuie gestionat accesul la Key Vault

**Când să folosești:** Pas de tranziție de la stringuri de conexiune la identitate gestionată.

---

### Modelul 3: Identitate Gestionată (Cea mai bună practică)

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

**Cod aplicație:**
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
- ✅ Rotație automată a credentialelor
- ✅ Istoric complet de audit
- ✅ Permisiuni bazate pe RBAC
- ✅ Pregătit pentru conformitate

**Când să folosești:** Întotdeauna, pentru aplicații în producție.

---

## Lecția 2: Implementarea Identității Gestionate cu AZD

### Implementare pas cu pas

Să construim o Container App securizată care folosește identitate gestionată pentru acces la Azure Storage și Key Vault.

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

### 1. Configurare AZD (azure.yaml)

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

### 2. Infrastructură: Activare identitate gestionată

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

### 3. Container App cu identitate sistem-atribuită

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

### 4. Modul atribuire rol RBAC

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

### 5. Cod aplicație cu identitate gestionată

**Fișier: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inițializează acreditările (funcționează automat cu identitate gestionată)
const credential = new DefaultAzureCredential();

// Configurare Azure Storage
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

// Verificare stare sănătate
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Încarcă fișier în stocarea blob
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

// Obține secretul din Key Vault
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

// Listează containerele blob (demonstrează acces de citire)
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
# Initializează mediul AZD
azd init

# Desfășoară infrastructura și aplicația
azd up

# Obține URL-ul aplicației
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Testează verificarea stării de sănătate
curl $APP_URL/health
```

**✅ Rezultat așteptat:**
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

**✅ Rezultat așteptat:**
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

**✅ Rezultat așteptat:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Roluri RBAC Comune Azure

### ID-uri implicite pentru roluri identitate gestionată

| Serviciu | Nume rol | ID rol | Permisiuni |
|----------|----------|---------|------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Citire blob-uri și containere |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Citire, scriere, ștergere blob-uri |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Citire, scriere, ștergere mesaje coadă |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Citire secrete |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Citire, scriere, ștergere secrete |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Citire date Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Citire, scriere date Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Gestionare baze de date SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Trimitere, primire, gestionare mesaje |

### Cum găsești ID-urile rolurilor

```bash
# Listează toate rolurile încorporate
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Caută un rol specific
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Obține detalii despre rol
az role definition list --name "Storage Blob Data Contributor"
```

---

## Exerciții Practice

### Exercițiul 1: Activare Identitate Gestionată pentru Aplicația Existenta ⭐⭐ (Mediu)

**Scop**: Adaugă identitatea gestionată la o implementare existentă Container App

**Scenariu**: Ai o Container App care folosește stringuri de conexiune. Convertește-o la identitate gestionată.

**Punct de start**: Container App cu această configurație:

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

2. **Acordă acces Storage:**

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

**Înainte (string conexiune):**
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

4. **Actualizează variabile de mediu:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Deploy și test:**

```bash
# Redeploy
azd up

# Testează dacă încă funcționează
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Criterii de succes:**
- ✅ Aplicația se deployează fără erori
- ✅ Operațiunile pe Storage funcționează (upload, listare, download)
- ✅ Nu există stringuri de conexiune în variabilele de mediu
- ✅ Identitatea este vizibilă în Portalul Azure în panoul „Identitate”

**Verificare:**

```bash
# Verifică dacă identitatea gestionată este activată
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Așteptat: "SystemAssigned"

# Verifică atribuirea rolului
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Așteptat: Afișează rolul "Storage Blob Data Contributor"
```

**Timp**: 20-30 minute

---

### Exercițiul 2: Acces Multi-Serviciu cu Identitate Utilizator-Atribuită ⭐⭐⭐ (Avansat)

**Scop**: Creează o identitate atribuită utilizator partajată între mai multe Container Apps

**Scenariu**: Ai 3 microservicii care au nevoie toate de acces la acelasi cont Storage și Key Vault.

**Pași**:

1. **Creează identitate utilizator-atribuită:**

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

2. **Atribuie roluri pentru identitatea utilizator-atribuită:**

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

3. **Atribuie identitatea la multiple Container Apps:**

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

4. **Cod aplicație (toate serviciile folosesc același model):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Pentru identitate atribuită utilizatorului, specificați ID-ul clientului
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID-ul clientului identității atribuite utilizatorului
);

// Sau folosiți DefaultAzureCredential (detectează automat)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Deploy și verifică:**

```bash
azd up

# Testați dacă toate serviciile pot accesa stocarea
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Criterii de succes:**
- ✅ O singură identitate partajată între 3 servicii
- ✅ Toate serviciile pot accesa Storage și Key Vault
- ✅ Identitatea persistă dacă ștergi un serviciu
- ✅ Management centralizat al permisiunilor

**Avantaje ale identității utilizator-atribuite:**
- O singură identitate de gestionat
- Permisiuni consistente pe serviciile multiple
- Supraviețuiește ștergerii serviciilor
- Mai potrivit pentru arhitecturi complexe

**Timp**: 30-40 minute

---

### Exercițiul 3: Implementare rotație secrete Key Vault ⭐⭐⭐ (Avansat)

**Scop**: Stochează chei API terțe în Key Vault și accesează-le folosind identitatea gestionată

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
# Obțineți numele Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Stocați cheile API ale terților
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

3. **Cod aplicație pentru preluarea secretelor:**

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
    // Verificați mai întâi memoria cache
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

5. **Deploy și test:**

```bash
azd up

# Testați dacă cheile API funcționează
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Criterii de succes:**
- ✅ Nicio cheie API în cod sau variabile de mediu
- ✅ Aplicația preia cheile din Key Vault
- ✅ API-urile terțe funcționează corect
- ✅ Poți roata cheile fără să modifici codul

**Rotește un secret:**

```bash
# Actualizează secretul în Key Vault
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

## Verificare Cunoștințe

### 1. Modele de autentificare ✓

Testează-ți înțelegerea:

- [ ] **Î1**: Care sunt cele trei modele principale de autentificare? 
  - **R**: Stringuri de conexiune (legacy), Referințe Key Vault (tranziție), Identitate Gestionată (cea mai bună)

- [ ] **Î2**: De ce este mai bună identitatea gestionată față de stringuri de conexiune?
  - **R**: Fără secrete în cod, rotație automată, istoric complet de audit, permisiuni RBAC

- [ ] **Î3**: Când folosești identitate utilizator-atribuită în loc de sistem-atribuită?
  - **R**: Când partajezi identitatea între mai multe resurse sau când ciclul vieții identității este independent de resursă

**Verificare practică:**
```bash
# Verifică ce tip de identitate folosește aplicația ta
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Listează toate atribuțiile de rol pentru identitate
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC și Permisiuni ✓

Testează-ți înțelegerea:

- [ ] **Î1**: Care este ID-ul rolului "Storage Blob Data Contributor"?
  - **R**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Î2**: Ce permisiuni oferă rolul "Key Vault Secrets User"?
  - **R**: Acces doar în citire la secrete (nu poate crea, modifica sau șterge)

- [ ] **Î3**: Cum acorzi acces unei Container App la Azure SQL?
  - **R**: Atribuind rolul "SQL DB Contributor" sau configurând autentificarea Azure AD pentru SQL

**Verificare practică:**
```bash
# Găsește rolul specific
az role definition list --name "Storage Blob Data Contributor"

# Verifică ce roluri sunt atribuite identității tale
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrare Key Vault ✓

Testează-ți înțelegerea:
- [ ] **Întrebarea 1**: Cum activezi RBAC pentru Key Vault în locul politicilor de acces?
  - **Răspuns**: Setează `enableRbacAuthorization: true` în Bicep

- [ ] **Întrebarea 2**: Ce bibliotecă Azure SDK gestionează autentificarea prin identitate gestionată?
  - **Răspuns**: `@azure/identity` cu clasa `DefaultAzureCredential`

- [ ] **Întrebarea 3**: Cât timp stau secretele Key Vault în cache?
  - **Răspuns**: Depinde de aplicație; implementează-ți propria strategie de caching

**Verificare Practică:**
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
# ✅ Așteptat: adevărat
```

---

## Cele mai bune practici de securitate

### ✅ FĂ:

1. **Folosește întotdeauna identitatea gestionată în producție**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Folosește roluri RBAC cu cel mai mic privilegiu necesar**
   - Folosește roluri de „Cititor” când este posibil
   - Evită „Proprietar” sau „Contribuitor” decât dacă este necesar

3. **Stochează cheile terțelor părți în Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Activează înregistrările de audit**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Folosește identități diferite pentru dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rotește secretele regulat**
   - Setează date de expirare pentru secretele Key Vault
   - Automatizează rotația cu Azure Functions

### ❌ NU FACE:

1. **Niciodată să nu codifici secretele direct în cod**
   ```javascript
   // ❌ RĂU
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Nu folosi connection strings în producție**
   ```javascript
   // ❌ RĂU
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Nu acorda permisiuni excesive**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Nu loga secretele**
   ```javascript
   // ❌ RĂU
   console.log('API Key:', apiKey);
   
   // ✅ BUN
   console.log('API Key retrieved successfully');
   ```

5. **Nu partaja identități de producție între medii**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Ghid de depanare

### Problemă: "Unauthorized" la accesarea Azure Storage

**Simptome:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnostic:**

```bash
# Verifică dacă identitatea gestionată este activată
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Așteptat: "SystemAssigned" sau "UserAssigned"

# Verifică atribuțiile rolului
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Așteptat: Ar trebui să vezi "Storage Blob Data Contributor" sau un rol similar
```

**Soluții:**

1. **Acordă rolul RBAC corect:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Așteaptă propagarea (poate dura 5-10 minute):**
```bash
# Verifică starea atribuirii rolului
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Verifică dacă codul aplicației folosește acreditările corecte:**
```javascript
// Asigură-te că folosești DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problemă: Accesul la Key Vault este refuzat

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
# ✅ Așteptat: adevărat

# Verifică atribuirea rolurilor
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Soluții:**

1. **Activează RBAC pe Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Acordă rolul Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problemă: DefaultAzureCredential eșuează local

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

1. **Autentifică-te în Azure CLI:**
```bash
az login
```

2. **Setează subscripția Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Pentru dezvoltare locală, folosește variabile de mediu:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Sau folosește altă acreditare locală:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Folosește AzureCliCredential pentru dezvoltare locală
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problemă: Atribuirea rolului durează prea mult să se propage

**Simptome:**
- Rolul a fost atribuit cu succes
- Încă apar erori 403
- Acces intermitent (uneori funcționează, alteori nu)

**Explicație:**
Modificările RBAC Azure pot dura 5-10 minute să se propage global.

**Soluție:**

```bash
# Așteaptă și încearcă din nou
echo "Waiting for RBAC propagation..."
sleep 300  # Așteaptă 5 minute

# Testează accesul
curl https://myapp.azurecontainerapps.io/upload

# Dacă încă eșuează, repornește aplicația
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Considerații privind costurile

### Costurile identității gestionate

| Resursă | Cost |
|----------|------|
| **Identitate gestionată** | 🆓 **GRATUIT** - Fără taxă |
| **Atribuiri de roluri RBAC** | 🆓 **GRATUIT** - Fără taxă |
| **Solicitări token Azure AD** | 🆓 **GRATUIT** - Incluse |
| **Operațiuni Key Vault** | $0.03 per 10.000 de operațiuni |
| **Stocare Key Vault** | $0.024 per secret pe lună |

**Identitatea gestionată economisește bani prin:**
- ✅ Eliminarea operațiunilor Key Vault pentru autentificarea serviciu-la-serviciu
- ✅ Reducerea incidentelor de securitate (fără credențiale scurse)
- ✅ Micșorarea încărcăturii operaționale (fără rotație manuală)

**Exemplu comparație costuri (lunar):**

| Scenariu | Connection Strings | Identitate Gestionată | Economii |
|----------|-------------------|---------------------|----------|
| Aplicație mică (1M cereri) | ~50$ (Key Vault + ops) | ~0$ | 50$/lună |
| Aplicație medie (10M cereri) | ~200$ | ~0$ | 200$/lună |
| Aplicație mare (100M cereri) | ~1.500$ | ~0$ | 1.500$/lună |

---

## Află mai multe

### Documentație oficială
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Documentație SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Pașii următori în acest curs
- ← Anterior: [Configuration Management](configuration.md)
- → Următor: [First Project](first-project.md)
- 🏠 [Pagina principală a cursului](../../README.md)

### Exemple conexe
- [Microsoft Foundry Models Chat Example](../../../../examples/azure-openai-chat) - Folosește identitatea gestionată pentru Microsoft Foundry Models
- [Exemplu Microservicii](../../../../examples/microservices) - Modele de autentificare multi-servicii

---

## Rezumat

**Ai învățat:**
- ✅ Trei modele de autentificare (connection strings, Key Vault, identitate gestionată)
- ✅ Cum să activezi și configurezi identitatea gestionată în AZD
- ✅ Atribuiri de roluri RBAC pentru servicii Azure
- ✅ Integrarea Key Vault pentru secrete terțe
- ✅ Identități atribuite utilizatorilor vs identități de sistem
- ✅ Cele mai bune practici de securitate și depanare

**Aspecte esențiale:**
1. **Folosește întotdeauna identitatea gestionată în producție** - Fără secrete, rotație automată
2. **Folosește roluri RBAC cu cel mai mic privilegiu** - Acordă doar permisiunile necesare
3. **Stochează chei ale terților în Key Vault** - Management centralizat al secretelor
4. **Separă identitățile pe medii** - Izolare dev, staging, producție
5. **Activează audit logging** - Monitorizează cine a accesat ce

**Pașii următori:**
1. Finalizează exercițiile practice de mai sus
2. Migratează o aplicație existentă de la connection strings la identitate gestionată
3. Construiește primul proiect AZD cu securitate de la început: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inacurateți. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
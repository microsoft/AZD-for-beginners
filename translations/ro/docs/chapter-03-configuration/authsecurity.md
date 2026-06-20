# Modele de Autentificare și Identitate Gestionată

⏱️ **Timp Estimat**: 45-60 minute | 💰 **Impact Costuri**: Gratuit (fără taxe suplimentare) | ⭐ **Complexitate**: Intermediar

**📚 Parcurs de Învățare:**
- ← Anterior: [Gestionarea Configurației](configuration.md) - Gestionarea variabilelor de mediu și secretelor
- 🎯 **Ești aici**: Autentificare & Securitate (Identitate Gestionată, Key Vault, modele sigure)
- → Următor: [Primul Proiect](first-project.md) - Construiește prima ta aplicație AZD
- 🏠 [Acasă Curs](../../README.md)

---

## Ce vei învăța

Prin parcurgerea acestei lecții, vei:
- Înțelege modelele de autentificare Azure (chei, stringuri de conexiune, identitate gestionată)
- Implementa **Identitate Gestionată** pentru autentificare fără parolă
- Proteja secretele prin integrarea cu **Azure Key Vault**
- Configura **controlul accesului bazat pe roluri (RBAC)** pentru implementările AZD
- Aplica cele mai bune practici de securitate în Container Apps și servicii Azure
- Migra de la autentificarea bazată pe chei la autentificarea bazată pe identitate

## De ce este importantă Identitatea Gestionată

### Problema: Autentificarea Tradițională

**Înainte de Identitatea Gestionată:**
```javascript
// ❌ RISC DE SECURITATE: Secrete codate direct în cod
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Probleme:**
- 🔴 **Secrete expuse** în cod, fișiere de configurare, variabile de mediu
- 🔴 **Rotirea credentialelor** necesită modificări de cod și redeploy
- 🔴 **Audit complicat** - cine a accesat ce și când?
- 🔴 **Răspândire** - secrete dispersate pe multiple sisteme
- 🔴 **Riscuri de conformitate** - eșuează în auditurile de securitate

### Soluția: Identitatea Gestionată

**După Identitatea Gestionată:**
```javascript
// ✅ SECURIZAT: Fără secrete în cod
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure gestionează automat autentificarea
);
```

**Beneficii:**
- ✅ **Zero secrete** în cod sau configurație
- ✅ **Rotire automată** - Azure se ocupă
- ✅ **Traiectorie completă de audit** în jurnalele Microsoft Entra ID
- ✅ **Securitate centralizată** - se gestionează în Azure Portal
- ✅ **Conformitate garantată** - respectă standardele de securitate

**Analogie**: Autentificarea tradițională este ca și cum ai purta mai multe chei fizice pentru uși diferite. Identitatea Gestionată este ca un badge de securitate care oferă acces automat în funcție de cine ești—nu există chei de pierdut, copiat sau rotit.

---

## Prezentare Generală a Arhitecturii

### Fluxul de Autentificare cu Identitate Gestionată

```mermaid
sequenceDiagram
    participant App as Aplicația ta<br/>(Aplicație Container)
    participant MI as Identitate Gestionată<br/>(Microsoft Entra ID)
    participant KV as Key Vault
    participant Storage as Stocare Azure
    participant DB as Azure SQL
    
    App->>MI: Solicită token de acces<br/>(automat)
    MI->>MI: Verifică identitatea<br/>(nu este nevoie de parolă)
    MI-->>App: Returnează token<br/>(valabil 1 oră)
    
    App->>KV: Obține secret<br/>(folosind token)
    KV->>KV: Verifică permisiunile RBAC
    KV-->>App: Returnează valoarea secretului
    
    App->>Storage: Încarcă blob<br/>(folosind token)
    Storage->>Storage: Verifică permisiunile RBAC
    Storage-->>App: Succes
    
    App->>DB: Interoghează date<br/>(folosind token)
    DB->>DB: Verifică permisiunile SQL
    DB-->>App: Returnează rezultatele
    
    Note over App,DB: Toată autentificarea fără parolă!
```

### Tipuri de Identități Gestionate

```mermaid
graph TB
    MI[Identitate Gestionată]
    SystemAssigned[Identitate Atribuită Sistemului]
    UserAssigned[Identitate Atribuită Utilizatorului]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Ciclu de viață legat de resursă]
    SystemAssigned --> SA2[Creare/ștergere automată]
    SystemAssigned --> SA3[Cea mai bună pentru o singură resursă]
    
    UserAssigned --> UA1[Ciclu de viață independent]
    UserAssigned --> UA2[Creare/ștergere manuală]
    UserAssigned --> UA3[Partajată între resurse]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```

| Caracteristică | Alocată Sistemului | Alocată Utilizatorului |
|---------|----------------|---------------|
| **Durata de viață** | Legată de resursă | Independentă |
| **Creare** | Automată cu resursa | Creare manuală |
| **Ștergere** | Ștearsă odată cu resursa | Persistă după ștergerea resursei |
| **Partajare** | O singură resursă | Mai multe resurse |
| **Scenariu** | Scenarii simple | Scenarii complexe cu multe resurse |
| **Implicit AZD** | ✅ Recomandat | Opțional |

---

## Precondiții

### Instrumente Necesare

Ar trebui să ai deja acestea instalate din lecțiile anterioare:

```bash
# Verifică Azure Developer CLI
azd version
# ✅ Așteptat: azd versiunea 1.0.0 sau mai mare

# Verifică Azure CLI
az --version
# ✅ Așteptat: azure-cli 2.50.0 sau mai mare
```

### Cerințe Azure

- Abonament Azure activ
- Permisiuni pentru:
  - Crearea identităților gestionate
  - Atribuirea rolurilor RBAC
  - Crearea resurselor Key Vault
  - Implementarea Container Apps

### Cunoștințe Prealabile

Ar trebui să fi finalizat:
- [Ghid de Instalare](installation.md) - Configurare AZD
- [Bazele AZD](azd-basics.md) - Concepte de bază
- [Gestionarea Configurației](configuration.md) - Variabile de mediu

---

## Lecția 1: Înțelegerea Modelelor de Autentificare

### Modelul 1: Stringuri de Conexiune (Veche - Evitat)

**Cum funcționează:**
```bash
# Stringul de conexiune conține credențiale
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Probleme:**
- ❌ Secrete vizibile în variabilele de mediu
- ❌ Logate în sistemele de deploy
- ❌ Dificil de rotit
- ❌ Lipsă pistă de audit pentru acces

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
- ✅ Secrete stocate sigur în Key Vault
- ✅ Gestionare centralizată a secretelor
- ✅ Rotire fără modificări de cod

**Limitări:**
- ⚠️ Folosește încă chei/parole
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
- ✅ Rotire automată credențiale
- ✅ Pistă completă de audit
- ✅ Permisiuni bazate pe RBAC
- ✅ Conformitate garantată

**Când să folosești:** Întotdeauna, pentru aplicații de producție.

---

### Modelul 4: Principali de Serviciu (CI/CD & Automatizare)

Identitatea gestionată este standardul de aur *pentru resursele care rulează în interiorul Azure*. Dar ce se întâmplă cu cele care rulează **în afara** Azure—precum un pipeline CI/CD pe un agent de build, sau un script pe laptopul tău care nu poate folosi autentificarea interactivă? Acolo intervine un **principal de serviciu**: o identitate non-umană cu propriile credențiale pe care un proces automatizat le poate folosi pentru autentificare.

**Cum funcționează:**

Crează un principal de serviciu limitat la un grup de resurse (cel mai mic privilegiu):

```bash
az ad sp create-for-rbac \
  --name "myapp-cicd" \
  --role contributor \
  --scopes /subscriptions/<sub-id>/resourceGroups/<rg-name>
```

Aceasta afișează un client ID, client secret și tenant ID. azd se poate autentifica cu acestea fără interacțiune:

```bash
azd auth login \
  --client-id "<appId>" \
  --client-secret "<password>" \
  --tenant-id "<tenant>"
```

**Preferă credentialele federate (OIDC) în locul secretelor.** În locul unui secret client cu durată lungă, configurează o credențială federată astfel încât pipeline-ul să schimbe un token cu durată scurtă – fără secret ce poate fi furat sau rotit:

```bash
azd auth login \
  --client-id "<appId>" \
  --federated-credential-provider "github" \
  --tenant-id "<tenant>"
```

> `azd pipeline config` configurează automat acest lucru pentru tine. Vezi tutorialele CI/CD în [Capitolul 8](../chapter-08-production/production-ai-practices.md).

**Beneficii:**
- ✅ Funcționează în afara Azure (agenți build, on-premises, alte clouduri)
- ✅ Poate fi limitat la un singur grup de resurse cu un singur rol
- ✅ Varianta federată (OIDC) nu stochează secret

**Concesii:**
- ⚠️ Varianta cu secret necesită stocare și rotire atentă
- ⚠️ Un secret compromis acordă accesul întregului principal de serviciu – păstrează domeniile restrictive

**Când să folosești:** Pipeline-uri CI/CD și automatizare care nu pot folosi identități gestionate. Preferă întotdeauna varianta **federată/OIDC** față de secret client, și preferă identitatea gestionată ori de câte ori lucrul rulează în Azure.

**Stocarea în siguranță a credentialelor:**
- Nu comite niciodată secrete—folosește magazinul de secrete al pipeline-ului tău (secrete GitHub Actions, grupuri variabile Azure DevOps / Key Vault).
- Limitează principalul de serviciu la cel mai mic rol și grup de resurse necesar.
- Setează o dată de expirare și rotește, sau elimină secretul complet cu OIDC.

---

## Lecția 2: Implementarea Identității Gestionate cu AZD

### Implementare Pas cu Pas

Să construim o aplicație Container App sigură care folosește identitatea gestionată pentru a accesa Azure Storage și Key Vault.

### Structura Proiectului

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

### 2. Infrastructură: Activează Identitatea Gestionată

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

### 3. Container App cu identitate alocată sistemului

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

### 4. Modul de Atribuire Roluri RBAC

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

### 5. Cod Aplicație cu Identitate Gestionată

**Fișier: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inițializați acreditarea (funcționează automat cu identitate gestionată)
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

// Încărcați fișierul în blob storage
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

// Obțineți secretul din Key Vault
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

// Listați containerele blob (demonstrează acces de citire)
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

### 6. Deploy și Testare

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

**✅ Rezultat Așteptat:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Testează încărcare blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Rezultat Așteptat:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Testează listare container:**
```bash
curl $APP_URL/containers
```

**✅ Rezultat Așteptat:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Roluri comune Azure RBAC

### ID-uri roluri încorporate pentru Identitate Gestionată

| Serviciu | Nume Rol | ID Rol | Permisiuni |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Citire blob-uri și containere |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Citire, scriere, ștergere blob-uri |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Citire, scriere, ștergere mesaje coadă |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Citire secrete |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Citire, scriere, ștergere secrete |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Citire date Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Citire, scriere date Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Gestionare baze de date SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Trimitere, recepție, gestionare mesaje |

### Cum să găsești ID-urile rolurilor

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

### Exercițiul 1: Activează identitatea gestionată pentru o aplicație existentă ⭐⭐ (Mediu)

**Scop**: Adaugă identitatea gestionată la o implementare existentă Container App

**Scenariu**: Ai o Container App care folosește string-uri de conexiune. Transform-o să folosească identitate gestionată.

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

5. **Deploy și testează:**

```bash
# Reimplementare
azd up

# Testează dacă încă funcționează
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Criterii de succes:**
- ✅ Aplicația se implementează fără erori
- ✅ Operațiunile pe Storage funcționează (încărcare, listare, descărcare)
- ✅ Fără stringuri de conexiune în variabilele de mediu
- ✅ Identitatea vizibilă în Azure Portal în panoul "Identity"

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
# ✅ Așteptat: Afișează rolul "Contributor la date Blob de stocare"
```

**Timp:** 20-30 minute

---

### Exercițiul 2: Acces Multi-Serviciu cu Identitate Alocată Utilizatorului ⭐⭐⭐ (Avansat)

**Scop**: Creează o identitate alocată utilizatorului partajată între mai multe Container Apps

**Scenariu**: Ai 3 microservicii care au nevoie să acceseze același cont Storage și Key Vault.

**Pași**:

1. **Creează identitatea alocată utilizatorului:**

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

2. **Atribuie roluri identității alocate utilizatorului:**

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

3. **Atribuie identitatea la mai multe Container Apps:**

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

// Pentru identitatea alocată utilizatorului, specificați ID-ul clientului
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID-ul clientului pentru identitatea alocată utilizatorului
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
- ✅ O singură identitate partajată pentru 3 servicii
- ✅ Toate serviciile pot accesa Storage și Key Vault
- ✅ Identitatea persistă dacă ștergi un serviciu
- ✅ Management centralizat al permisiunilor

**Beneficii ale identității alocate utilizatorului:**
- O singură identitate de gestionat
- Permisiuni consistente între servicii
- Supraviețuiește ștergerii serviciilor
- Mai bună pentru arhitecturi complexe

**Timp:** 30-40 minute

---

### Exercițiul 3: Implementează Rotirea Secretelor în Key Vault ⭐⭐⭐ (Avansat)

**Scop**: Stochează chei API terțe în Key Vault și accesează-le folosind identitate gestionată

**Scenariu**: Aplicația ta trebuie să apeleze o API externă (OpenAI, Stripe, SendGrid) care necesită chei API.

**Pași**:

1. **Creează un Key Vault cu RBAC:**

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
# Obține numele Key Vault
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

3. **Cod aplicație pentru a prelua secretele:**

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

// Initializează OpenAI cu cheia din Key Vault
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

5. **Deploy și testează:**

```bash
azd up

# Testați că cheile API funcționează
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Criterii de succes:**
- ✅ Nicio cheie API în cod sau variabile de mediu
- ✅ Aplicația preia cheile din Key Vault
- ✅ API-urile terțe funcționează corect
- ✅ Se pot roti cheile fără modificări în cod

**Rotește un secret:**

```bash
# Actualizează secretul în Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Reporneste aplicația pentru a prelua noua cheie
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Timp**: 25-35 minute

---

## Punct de verificare al cunoștințelor

### 1. Modele de autentificare ✓

Testează-ți înțelegerea:

- [ ] **Întrebarea 1**: Care sunt cele trei modele principale de autentificare? 
  - **Răspuns**: Șiruri de conexiune (moștenire), referințe Key Vault (tranziție), Identitate gestionată (cel mai bun)

- [ ] **Întrebarea 2**: De ce este identitatea gestionată mai bună decât șirurile de conexiune?
  - **Răspuns**: Nicio secretă în cod, rotație automată, trail complet de audit, permisiuni RBAC

- [ ] **Întrebarea 3**: Când ai folosi o identitate alocată utilizatorului în loc de una alocată sistemului?
  - **Răspuns**: Când se partajează identitatea între mai multe resurse sau când ciclul de viață al identității este independent de ciclul de viață al resursei

**Verificare practică:**
```bash
# Verificați ce tip de identitate folosește aplicația dvs.
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Listați toate atribuțiile de rol pentru identitate
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC și permisiuni ✓

Testează-ți înțelegerea:

- [ ] **Întrebarea 1**: Care este ID-ul rolului pentru „Contribuitor date Storage Blob”?
  - **Răspuns**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Întrebarea 2**: Ce permisiuni oferă rolul „Utilizator Secrete Key Vault”?
  - **Răspuns**: Acces doar în citire la secrete (nu poate crea, actualiza sau șterge)

- [ ] **Întrebarea 3**: Cum acorzi acces Container App la Azure SQL?
  - **Răspuns**: Aloci rolul „Contribuitor DB SQL” sau configurezi autentificarea Microsoft Entra ID pentru SQL

**Verificare practică:**
```bash
# Găsiți un rol specific
az role definition list --name "Storage Blob Data Contributor"

# Verificați ce roluri sunt atribuite identității dvs.
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrare Key Vault ✓

Testează-ți înțelegerea:

- [ ] **Întrebarea 1**: Cum activezi RBAC pentru Key Vault în loc de politicile de acces?
  - **Răspuns**: Setează `enableRbacAuthorization: true` în Bicep

- [ ] **Întrebarea 2**: Ce bibliotecă Azure SDK gestionează autentificarea cu identitate gestionată?
  - **Răspuns**: `@azure/identity` cu clasa `DefaultAzureCredential`

- [ ] **Întrebarea 3**: Cât timp rămân secretele Key Vault în cache?
  - **Răspuns**: Depinde de aplicație; implementează propria strategie de caching

**Verificare practică:**
```bash
# Testați accesul la Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Verificați dacă RBAC este activat
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Așteptat: adevărat
```

---

## Cele mai bune practici de securitate

### ✅ FĂ:

1. **Folosește întotdeauna identitate gestionată în producție**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Folosește roluri RBAC cu cele mai puține privilegii**
   - Folosește roluri "Reader" când este posibil
   - Evită „Owner” sau „Contributor” decât dacă este necesar

3. **Păstrează cheile terțe în Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Activează logarea de audit**
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
   - Automtizează rotația cu Azure Functions

### ❌ NU FACE:

1. **Niciodată să nu hardcodezi secretele**
   ```javascript
   // ❌ RĂU
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Nu folosi șiruri de conexiune în producție**
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

5. **Nu partaja identitățile de producție între medii**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Ghid de depanare

### Problemă: „Unauthorized” la accesarea Azure Storage

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

# Verificați atribuțiile de rol
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Așteptat: Ar trebui să vedeți "Storage Blob Data Contributor" sau un rol similar
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

3. **Verifică dacă codul aplicației folosește credențialul corect:**
```javascript
// Asigurați-vă că utilizați DefaultAzureCredential
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
# ✅ Așteptat: adevărat

# Verifică atribuiri de roluri
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

2. **Acordă rolul Utilizator Secrete Key Vault:**
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

1. **Conectează-te la Azure CLI:**
```bash
az login
```

2. **Setează subscripția Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Pentru dezvoltare locală, folosește variabilele de mediu:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Sau folosește o altă metodă de autentificare local:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Folosește AzureCliCredential pentru dezvoltare locală
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problemă: Alocarea rolurilor durează prea mult să se propage

**Simptome:**
- Rolul a fost alocat cu succes
- Încă apar erori 403
- Acces intermitent (uneori funcționează, alteori nu)

**Explicație:**
Modificările RBAC Azure pot dura 5-10 minute pentru propagare globală.

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

## Considerații de cost

### Costuri pentru Identitate Gestionată

| Resursă | Cost |
|----------|------|
| **Identitate Gestionată** | 🆓 **GRATUIT** - Fără taxă |
| **Alocări de rol RBAC** | 🆓 **GRATUIT** - Fără taxă |
| **Cereri token Microsoft Entra ID** | 🆓 **GRATUIT** - Incluse |
| **Operațiuni Key Vault** | $0.03 la 10,000 operațiuni |
| **Stocare Key Vault** | $0.024 per secret pe lună |

**Identitatea gestionată economisește bani prin:**
- ✅ Eliminarea operațiunilor Key Vault pentru autentificarea serviciu-la-serviciu
- ✅ Reducerea incidentelor de securitate (fără credențiale scurse)
- ✅ Scăderea overhead-ului operațional (fără rotație manuală)

**Exemplu comparație costuri (lunar):**

| Scenariu | Șiruri de conexiune | Identitate gestionată | Economie |
|----------|---------------------|----------------------|----------|
| Aplicație mică (1M cereri) | ~50$ (Key Vault + ops) | ~0$ | 50$/lună |
| Aplicație medie (10M cereri) | ~200$ | ~0$ | 200$/lună |
| Aplicație mare (100M cereri) | ~1,500$ | ~0$ | 1,500$/lună |

---

## Afli mai multe

### Documentație oficială
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Documentație SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Pași următori în acest curs
- ← Anterior: [Managementul Configurațiilor](configuration.md)
- → Următor: [Primul Proiect](first-project.md)
- 🏠 [Pagina principală a cursului](../../README.md)

### Exemple conexe
- [Exemplu Microsoft Foundry Models Chat](../../../../examples/azure-openai-chat) - Folosește identitate gestionată pentru Microsoft Foundry Models
- [Exemplu Microservicii](../../../../examples/microservices) - Modele multi-serviciu de autentificare

---

## Rezumat

**Ai învățat:**
- ✅ Trei modele de autentificare (șiruri de conexiune, Key Vault, identitate gestionată)
- ✅ Cum să activezi și configurezi identitatea gestionată în AZD
- ✅ Alocări de rol RBAC pentru serviciile Azure
- ✅ Integrarea Key Vault pentru secrete terțe
- ✅ Identități alocate utilizator vs alocate sistem
- ✅ Cele mai bune practici de securitate și depanare

**Puncte cheie:**
1. **Folosește întotdeauna identitatea gestionată în producție** - Zero secrete, rotație automată
2. **Folosește roluri RBAC cu cele mai puține privilegii** - Acordă doar permisiunile necesare
3. **Păstrează cheile terțe în Key Vault** - Management centralizat al secretelor
4. **Separă identitățile pe medii** - Izolare dev, staging, prod
5. **Activează logarea de audit** - Urmărește cine a accesat ce

**Pași următori:**
1. Finalizează exercițiile practice de mai sus
2. Migrează o aplicație existentă de la șiruri de conexiune la identitate gestionată
3. Construiește primul tău proiect AZD cu securitate de la început: [Primul Proiect](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
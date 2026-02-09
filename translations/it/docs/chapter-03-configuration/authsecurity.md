# Autenticazione e Managed Identity

⏱️ **Tempo stimato**: 45-60 minuti | 💰 **Impatto sui costi**: Gratuito (nessun costo aggiuntivo) | ⭐ **Complessità**: Intermedio

**📚 Percorso di apprendimento:**
- ← Precedente: [Gestione della configurazione](configuration.md) - Gestione delle variabili d'ambiente e dei segreti
- 🎯 **Sei qui**: Autenticazione e Sicurezza (Managed Identity, Key Vault, pattern sicuri)
- → Successivo: [Primo progetto](first-project.md) - Crea la tua prima applicazione AZD
- 🏠 [Home del corso](../../README.md)

---

## Cosa imparerai

Completando questa lezione, imparerai:
- Comprendere i pattern di autenticazione di Azure (chiavi, connection string, managed identity)
- Implementare la **Managed Identity** per l'autenticazione senza password
- Proteggere i segreti con l'integrazione di **Azure Key Vault**
- Configurare il **controllo degli accessi basato sui ruoli (RBAC)** per le distribuzioni AZD
- Applicare le best practice di sicurezza in Container Apps e servizi Azure
- Migrare dall'autenticazione basata su chiavi a quella basata su identità

## Perché Managed Identity è importante

### Il problema: autenticazione tradizionale

**Prima di Managed Identity:**
```javascript
// ❌ RISCHIO DI SICUREZZA: Segreti inseriti direttamente nel codice
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Problemi:**
- 🔴 **Segreti esposti** nel codice, nei file di configurazione, nelle variabili d'ambiente
- 🔴 **Rotazione delle credenziali** richiede modifiche al codice e ridistribuzione
- 🔴 **Incubi di auditing** - chi ha accesso a cosa, quando?
- 🔴 **Sproloqui** - segreti sparsi su più sistemi
- 🔴 **Rischi di conformità** - fallisce gli audit di sicurezza

### La soluzione: Managed Identity

**Dopo Managed Identity:**
```javascript
// ✅ SICURO: Nessun segreto nel codice
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure gestisce automaticamente l'autenticazione
);
```

**Vantaggi:**
- ✅ **Zero segreti** nel codice o nella configurazione
- ✅ **Rotazione automatica** - gestita da Azure
- ✅ **Traccia di audit completa** nei log di Azure AD
- ✅ **Sicurezza centralizzata** - gestione nel Portale di Azure
- ✅ **Pronta per la conformità** - soddisfa gli standard di sicurezza

**Analogia**: L'autenticazione tradizionale è come portare numerose chiavi fisiche per diverse porte. Managed Identity è come avere un badge di sicurezza che concede automaticamente l'accesso in base a chi sei—nessuna chiave da perdere, copiare o ruotare.

---

## Panoramica dell'architettura

### Flusso di autenticazione con Managed Identity

```mermaid
sequenceDiagram
    participant App as La tua applicazione<br/>(App container)
    participant MI as Identità gestita<br/>(Azure AD)
    participant KV as Key Vault
    participant Storage as Archiviazione Azure
    participant DB as SQL di Azure
    
    App->>MI: Richiedi token di accesso<br/>(automatico)
    MI->>MI: Verifica identità<br/>(nessuna password richiesta)
    MI-->>App: Restituisci token<br/>(valido 1 ora)
    
    App->>KV: Recupera segreto<br/>(usando il token)
    KV->>KV: Controlla permessi RBAC
    KV-->>App: Restituisci valore del segreto
    
    App->>Storage: Carica blob<br/>(usando il token)
    Storage->>Storage: Controlla permessi RBAC
    Storage-->>App: Successo
    
    App->>DB: Interroga dati<br/>(usando il token)
    DB->>DB: Controlla permessi SQL
    DB-->>App: Restituisci risultati
    
    Note over App,DB: Tutte le autenticazioni senza password!
```
### Tipi di Managed Identity

```mermaid
graph TB
    MI[Identità gestita]
    SystemAssigned[Identità assegnata dal sistema]
    UserAssigned[Identità assegnata dall'utente]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Ciclo di vita legato alla risorsa]
    SystemAssigned --> SA2[Creazione/eliminazione automatica]
    SystemAssigned --> SA3[Ideale per una singola risorsa]
    
    UserAssigned --> UA1[Ciclo di vita indipendente]
    UserAssigned --> UA2[Creazione/eliminazione manuale]
    UserAssigned --> UA3[Condivisa tra risorse]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Caratteristica | Assegnata al sistema | Assegnata dall'utente |
|---------|----------------|---------------|
| **Lifecycle** | Collegata alla risorsa | Indipendente |
| **Creation** | Automatica con la risorsa | Creazione manuale |
| **Deletion** | Eliminata con la risorsa | Persiste dopo l'eliminazione della risorsa |
| **Sharing** | Una sola risorsa | Più risorse |
| **Use Case** | Scenari semplici | Scenari complessi multi-risorsa |
| **AZD Default** | ✅ Consigliato | Opzionale |

---

## Prerequisiti

### Strumenti richiesti

Dovresti aver già installato questi strumenti dalle lezioni precedenti:

```bash
# Verificare Azure Developer CLI
azd version
# ✅ Previsto: versione di azd 1.0.0 o superiore

# Verificare Azure CLI
az --version
# ✅ Previsto: versione di azure-cli 2.50.0 o superiore
```

### Requisiti Azure

- Sottoscrizione Azure attiva
- Autorizzazioni per:
  - Creare managed identities
  - Assegnare ruoli RBAC
  - Creare risorse Key Vault
  - Distribuire Container Apps

### Conoscenze richieste

Dovresti aver completato:
- [Guida all'installazione](installation.md) - Configurazione AZD
- [Nozioni di base su AZD](azd-basics.md) - Concetti principali
- [Gestione della configurazione](configuration.md) - Variabili d'ambiente

---

## Lezione 1: Comprendere i modelli di autenticazione

### Modello 1: Stringhe di connessione (Legacy - Evitare)

**Come funziona:**
```bash
# La stringa di connessione contiene credenziali
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Problemi:**
- ❌ Segreti visibili nelle variabili d'ambiente
- ❌ Registrati nei sistemi di distribuzione
- ❌ Difficili da ruotare
- ❌ Nessuna traccia di audit degli accessi

**Quando usarlo:** Solo per sviluppo locale, mai in produzione.

---

### Modello 2: Riferimenti a Key Vault (Migliore)

**Come funziona:**
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

**Vantaggi:**
- ✅ Segreti memorizzati in modo sicuro in Key Vault
- ✅ Gestione centralizzata dei segreti
- ✅ Rotazione senza modifiche al codice

**Limitazioni:**
- ⚠️ Si continua a usare chiavi/password
- ⚠️ È necessario gestire l'accesso a Key Vault

**Quando usarlo:** Passo di transizione dalle stringhe di connessione a managed identity.

---

### Modello 3: Managed Identity (Pratica consigliata)

**Come funziona:**
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

**Codice dell'applicazione:**
```javascript
// Non servono segreti!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Vantaggi:**
- ✅ Zero segreti in codice/configurazione
- ✅ Rotazione automatica delle credenziali
- ✅ Traccia di audit completa
- ✅ Autorizzazioni basate su RBAC
- ✅ Pronto per la conformità

**Quando usarlo:** Sempre, per applicazioni in produzione.

---

## Lezione 2: Implementare Managed Identity con AZD

### Implementazione passo passo

Costruiamo un Container App sicuro che utilizza la managed identity per accedere ad Azure Storage e Key Vault.

### Struttura del progetto

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

### 2. Infrastruttura: Abilitare Managed Identity

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

### 3. Container App con identità assegnata al sistema

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

### 4. Modulo di assegnazione ruoli RBAC

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

### 5. Codice dell'applicazione con Managed Identity

**File: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inizializza la credenziale (funziona automaticamente con l'identità gestita)
const credential = new DefaultAzureCredential();

// Configurazione di Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Non sono necessarie chiavi!
);

// Configurazione di Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Non sono necessarie chiavi!
);

// Controllo di integrità
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Carica file su blob storage
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

// Recupera il segreto da Key Vault
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

// Elenca i contenitori blob (dimostra l'accesso in lettura)
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

### 6. Distribuisci e testa

```bash
# Inizializza l'ambiente AZD
azd init

# Distribuisci l'infrastruttura e l'applicazione
azd up

# Ottieni l'URL dell'app
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Esegui il controllo di integrità
curl $APP_URL/health
```

**✅ Output previsto:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Test di upload del blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Output previsto:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Test di elenco dei container:**
```bash
curl $APP_URL/containers
```

**✅ Output previsto:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Ruoli RBAC comuni di Azure

### ID ruoli predefiniti per Managed Identity

| Service | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Lettura di blob e contenitori |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Lettura, scrittura, eliminazione di blob |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Lettura, scrittura, eliminazione dei messaggi della coda |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Lettura dei segreti |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Lettura, scrittura, eliminazione dei segreti |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Lettura dei dati di Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Lettura, scrittura dei dati di Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Gestire database SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Inviare, ricevere, gestire messaggi |

### Come trovare gli ID dei ruoli

```bash
# Elenca tutti i ruoli predefiniti
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Cerca un ruolo specifico
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Ottieni i dettagli del ruolo
az role definition list --name "Storage Blob Data Contributor"
```

---

## Esercizi pratici

### Esercizio 1: Abilitare Managed Identity per un'app esistente ⭐⭐ (Media)

**Obiettivo**: Aggiungere la managed identity a una distribuzione esistente di Container App

**Scenario**: Hai un Container App che usa stringhe di connessione. Convertirlo a managed identity.

**Punto di partenza**: Container App con questa configurazione:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Passaggi**:

1. **Abilitare managed identity in Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Concedere accesso a Storage:**

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

3. **Aggiornare il codice dell'applicazione:**

**Prima (stringa di connessione):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Dopo (managed identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Aggiornare le variabili d'ambiente:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Distribuire e testare:**

```bash
# Ridispiegare
azd up

# Verificare che funzioni ancora
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Criteri di successo:**
- ✅ L'applicazione si distribuisce senza errori
- ✅ Le operazioni su Storage funzionano (upload, elenco, download)
- ✅ Nessuna stringa di connessione nelle variabili d'ambiente
- ✅ Identità visibile nel Portale di Azure nella scheda "Identity"

**Verifica:**

```bash
# Verificare che l'identità gestita sia abilitata
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Previsto: "SystemAssigned"

# Verificare l'assegnazione del ruolo
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Previsto: Mostra il ruolo "Storage Blob Data Contributor"
```

**Tempo**: 20-30 minuti

---

### Esercizio 2: Accesso multi-servizio con User-Assigned Identity ⭐⭐⭐ (Avanzato)

**Obiettivo**: Creare un'identità assegnata dall'utente condivisa tra più Container App

**Scenario**: Hai 3 microservizi che necessitano tutti di accedere allo stesso account Storage e Key Vault.

**Passaggi**:

1. **Creare l'identità assegnata dall'utente:**

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

2. **Assegnare ruoli all'identità assegnata dall'utente:**

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

3. **Assegnare l'identità a più Container App:**

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

4. **Codice dell'applicazione (tutti i servizi usano lo stesso pattern):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Per un'identità assegnata dall'utente, specificare l'ID client
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID client dell'identità assegnata dall'utente
);

// Oppure usare DefaultAzureCredential (rileva automaticamente)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Distribuire e verificare:**

```bash
azd up

# Verificare che tutti i servizi possano accedere allo storage
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Criteri di successo:**
- ✅ Un'identità condivisa tra 3 servizi
- ✅ Tutti i servizi possono accedere a Storage e Key Vault
- ✅ L'identità persiste se elimini un servizio
- ✅ Gestione centralizzata delle autorizzazioni

**Vantaggi dell'identità assegnata dall'utente:**
- Identità singola da gestire
- Autorizzazioni coerenti tra i servizi
- Sopravvive all'eliminazione di un servizio
- Migliore per architetture complesse

**Tempo**: 30-40 minuti

---

### Esercizio 3: Implementare la rotazione dei segreti in Key Vault ⭐⭐⭐ (Avanzato)

**Obiettivo**: Memorizzare le chiavi API di terze parti in Key Vault e accedervi usando managed identity

**Scenario**: La tua app deve chiamare un'API esterna (OpenAI, Stripe, SendGrid) che richiede chiavi API.

**Passaggi**:

1. **Creare Key Vault con RBAC:**

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

2. **Memorizzare i segreti in Key Vault:**

```bash
# Ottieni il nome del Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Memorizza le chiavi API di terze parti
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

3. **Codice dell'applicazione per recuperare i segreti:**

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
    // Controlla la cache prima
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

4. **Usare i segreti nell'applicazione:**

**File: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inizializza OpenAI usando la chiave presente nel Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Chiamare all'avvio
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

5. **Distribuire e testare:**

```bash
azd up

# Verificare che le chiavi API funzionino
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Criteri di successo:**
- ✅ Nessuna chiave API nel codice o nelle variabili d'ambiente
- ✅ L'applicazione recupera le chiavi da Key Vault
- ✅ Le API di terze parti funzionano correttamente
- ✅ È possibile ruotare le chiavi senza modifiche al codice

**Ruotare un segreto:**

```bash
# Aggiorna il segreto nel Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Riavvia l'app per usare la nuova chiave
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Tempo**: 25-35 minuti

---

## Punto di verifica delle conoscenze

### 1. Modelli di autenticazione ✓

Verifica la tua comprensione:

- [ ] **Q1**: Quali sono i tre principali modelli di autenticazione? 
  - **A**: Stringhe di connessione (legacy), Riferimenti a Key Vault (transizione), Managed Identity (migliore)

- [ ] **Q2**: Perché la managed identity è migliore delle stringhe di connessione?
  - **A**: Nessun segreto nel codice, rotazione automatica, traccia di audit completa, autorizzazioni basate su RBAC

- [ ] **Q3**: Quando useresti un'identità assegnata dall'utente invece di una assegnata al sistema?
  - **A**: Quando è necessario condividere l'identità tra più risorse o quando il ciclo di vita dell'identità è indipendente dal ciclo di vita della risorsa

**Verifica pratica:**
```bash
# Controlla quale tipo di identità usa la tua app
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Elenca tutte le assegnazioni di ruolo per l'identità
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC e autorizzazioni ✓

Verifica la tua comprensione:

- [ ] **Q1**: Qual è l'ID ruolo per "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: Quali autorizzazioni fornisce "Key Vault Secrets User"?
  - **A**: Accesso in sola lettura ai segreti (non può creare, aggiornare o eliminare)

- [ ] **Q3**: Come concedi a un Container App l'accesso a Azure SQL?
  - **A**: Assegna il ruolo "SQL DB Contributor" o configura l'autenticazione Azure AD per SQL

**Verifica pratica:**
```bash
# Trova un ruolo specifico
az role definition list --name "Storage Blob Data Contributor"

# Verifica quali ruoli sono assegnati alla tua identità
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrazione con Key Vault ✓

Verifica la tua comprensione:
- [ ] **Q1**: Come si abilita RBAC per Key Vault invece delle policy di accesso?
  - **A**: Impostare `enableRbacAuthorization: true` in Bicep

- [ ] **Q2**: Quale libreria dell'Azure SDK gestisce l'autenticazione con managed identity?
  - **A**: `@azure/identity` con la classe `DefaultAzureCredential`

- [ ] **Q3**: Quanto tempo rimangono in cache i segreti di Key Vault?
  - **A**: Dipende dall'applicazione; implementare la propria strategia di caching

**Hands-On Verification:**
```bash
# Verifica l'accesso a Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Verifica che RBAC sia abilitato
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Previsto: true
```

---

## Migliori pratiche di sicurezza

### ✅ DA FARE:

1. **Usare sempre l'identità gestita in produzione**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Usare ruoli RBAC a minimo privilegio**
   - Usare ruoli "Reader" quando possibile
   - Evitare "Owner" o "Contributor" salvo necessità

3. **Conservare le chiavi di terze parti in Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Abilitare il logging di audit**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Usare identità diverse per dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Ruotare i segreti regolarmente**
   - Impostare date di scadenza sui segreti di Key Vault
   - Automatizzare la rotazione con Azure Functions

### ❌ DA NON FARE:

1. **Non inserire mai segreti nel codice**
   ```javascript
   // ❌ MALE
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Non usare stringhe di connessione in produzione**
   ```javascript
   // ❌ MALE
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Non concedere permessi eccessivi**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Non registrare i segreti nei log**
   ```javascript
   // ❌ SCORRETTO
   console.log('API Key:', apiKey);
   
   // ✅ CORRETTO
   console.log('API Key retrieved successfully');
   ```

5. **Non condividere le identità di produzione tra gli ambienti**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Guida alla risoluzione dei problemi

### Problema: "Unauthorized" quando si accede ad Azure Storage

**Sintomi:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnosi:**

```bash
# Verificare se l'identità gestita è abilitata
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Previsto: "SystemAssigned" o "UserAssigned"

# Verificare le assegnazioni di ruolo
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Previsto: Si dovrebbe vedere "Storage Blob Data Contributor" o un ruolo simile
```

**Soluzioni:**

1. **Assegnare il ruolo RBAC corretto:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Attendere la propagazione (può richiedere 5-10 minuti):**
```bash
# Verifica lo stato dell'assegnazione del ruolo
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Verificare che il codice dell'applicazione usi le credenziali corrette:**
```javascript
// Assicurati di utilizzare DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problema: Accesso a Key Vault negato

**Sintomi:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnosi:**

```bash
# Verificare che RBAC del Key Vault sia abilitato
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Previsto: true

# Verificare le assegnazioni di ruolo
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Soluzioni:**

1. **Abilitare RBAC su Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Assegnare il ruolo Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problema: DefaultAzureCredential fallisce in locale

**Sintomi:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnosi:**

```bash
# Controlla se hai effettuato l'accesso
az account show

# Controlla l'autenticazione di Azure CLI
az ad signed-in-user show
```

**Soluzioni:**

1. **Accedere a Azure CLI:**
```bash
az login
```

2. **Impostare la subscription di Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Per lo sviluppo locale, usare variabili d'ambiente:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Oppure usare credenziali diverse localmente:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Usa AzureCliCredential per lo sviluppo locale
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problema: L'assegnazione del ruolo impiega troppo tempo per propagarsi

**Sintomi:**
- Ruolo assegnato con successo
- Si continuano a ricevere errori 403
- Accesso intermittente (a volte funziona, a volte no)

**Spiegazione:**
Le modifiche RBAC di Azure possono richiedere 5-10 minuti per propagarsi globalmente.

**Soluzione:**

```bash
# Attendi e riprova
echo "Waiting for RBAC propagation..."
sleep 300  # Attendi 5 minuti

# Verifica l'accesso
curl https://myapp.azurecontainerapps.io/upload

# Se continua a non funzionare, riavvia l'app
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Considerazioni sui costi

### Costi dell'identità gestita

| Risorsa | Costo |
|----------|------|
| **Managed Identity** | 🆓 **GRATIS** - Nessun addebito |
| **RBAC Role Assignments** | 🆓 **GRATIS** - Nessun addebito |
| **Azure AD Token Requests** | 🆓 **GRATIS** - Incluso |
| **Key Vault Operations** | $0.03 per 10.000 operazioni |
| **Key Vault Storage** | $0.024 per secret al mese |

**L'identità gestita consente di risparmiare grazie a:**
- ✅ Eliminare le operazioni su Key Vault per l'autenticazione servizio-a-servizio
- ✅ Ridurre gli incidenti di sicurezza (nessuna credenziale esposta)
- ✅ Diminuire l'overhead operativo (nessuna rotazione manuale)

**Esempio di confronto dei costi (mensile):**

| Scenario | Connection Strings | Managed Identity | Savings |
|----------|-------------------|-----------------|---------|
| Small app (1M requests) | ~$50 (Key Vault + ops) | ~$0 | $50/month |
| Medium app (10M requests) | ~$200 | ~$0 | $200/month |
| Large app (100M requests) | ~$1,500 | ~$0 | $1,500/month |

---

## Per saperne di più

### Documentazione ufficiale
- [Identità gestite di Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [RBAC di Azure](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Documentazione SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Prossimi passi in questo corso
- ← Precedente: [Gestione della configurazione](configuration.md)
- → Successivo: [Primo progetto](first-project.md)
- 🏠 [Home del corso](../../README.md)

### Esempi correlati
- [Azure OpenAI Chat Example](../../../../examples/azure-openai-chat) - Usa l'identità gestita per Azure OpenAI
- [Microservices Example](../../../../examples/microservices) - Schemi di autenticazione multi-servizio

---

## Riepilogo

**Hai imparato:**
- ✅ Tre pattern di autenticazione (stringhe di connessione, Key Vault, identità gestita)
- ✅ Come abilitare e configurare l'identità gestita in AZD
- ✅ Assegnazioni di ruoli RBAC per i servizi Azure
- ✅ Integrazione con Key Vault per segreti di terze parti
- ✅ Identità assegnate dall'utente vs assegnate dal sistema
- ✅ Migliori pratiche di sicurezza e risoluzione dei problemi

**Punti chiave:**
1. **Usare sempre l'identità gestita in produzione** - Zero segreti, rotazione automatica
2. **Usare ruoli RBAC a minimo privilegio** - Assegnare solo i permessi necessari
3. **Conservare le chiavi di terze parti in Key Vault** - Gestione centralizzata dei segreti
4. **Separare le identità per ambiente** - Isolamento tra dev, staging, prod
5. **Abilitare la registrazione di audit** - Tracciare chi ha accesso a cosa

**Passi successivi:**
1. Completa gli esercizi pratici sopra
2. Migra un'app esistente da stringhe di connessione a identità gestita
3. Costruisci il tuo primo progetto AZD con la sicurezza fin dal primo giorno: [Primo progetto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si tenga presente che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda di ricorrere a una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
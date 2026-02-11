# Vzory overovania a spravovaná identita

⏱️ **Odhadovaný čas**: 45-60 minút | 💰 **Vplyv na náklady**: Zadarmo (bez dodatočných poplatkov) | ⭐ **Zložitosť**: Stredne pokročilé

**📚 Vzdelávacia cesta:**
- ← Predchádzajúce: [Správa konfigurácie](configuration.md) - Správa premenných prostredia a tajomstiev
- 🎯 **Ste tu**: Overovanie a zabezpečenie (spravovaná identita, Key Vault, bezpečné vzory)
- → Ďalej: [Prvý projekt](first-project.md) - Vytvorte svoju prvú aplikáciu AZD
- 🏠 [Domov kurzu](../../README.md)

---

## Čo sa naučíte

Po dokončení tejto lekcie:
- Pochopíte overovacie vzory Azure (kľúče, pripojovacie reťazce, spravovaná identita)
- Implementujete spravovanú identitu pre bezheslové overovanie
- Zabezpečíte tajomstvá integráciou Azure Key Vault
- Nakonfigurujete riadenie prístupu založené na rolách (RBAC) pre nasadenia AZD
- Aplikujete bezpečnostné odporúčania v Container Apps a službách Azure
- Migrujete z autentifikácie založenej na kľúčoch na autentifikáciu založenú na identite

## Prečo je spravovaná identita dôležitá

### Problém: Tradičné overovanie

**Pred spravovanou identitou:**
```javascript
// ❌ BEZPEČNOSTNÉ RIZIKO: Natvrdo zakódované tajomstvá v kóde
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Problémy:**
- 🔴 **Vystavené tajomstvá** v kóde, konfiguračných súboroch, premenných prostredia
- 🔴 **Rotácia prihlasovacích údajov** vyžaduje zmeny v kóde a opätovné nasadenie
- 🔴 **Nočné mory auditu** - kto čo a kedy pristupoval?
- 🔴 **Roztrúsenie** - tajomstvá rozptýlené v viacerých systémoch
- 🔴 **Riziká súladu** - neprejde bezpečnostnými auditmi

### Riešenie: Spravovaná identita

**Po spravovanej identite:**
```javascript
// ✅ BEZPEČNÉ: Žiadne tajomstvá v kóde
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure automaticky spravuje autentifikáciu
);
```

**Výhody:**
- ✅ **Žiadne tajomstvá** v kóde alebo konfigurácii
- ✅ **Automatická rotácia** - Azure to spravuje
- ✅ **Plná stopa auditu** v logoch Azure AD
- ✅ **Centralizované zabezpečenie** - spravujte v Azure Portal
- ✅ **Pripravené na súlad** - spĺňa bezpečnostné normy

Analógia: Tradičné overovanie je ako nosiť viacero fyzických kľúčov pre rôzne dvere. Spravovaná identita je ako bezpečnostná karta, ktorá automaticky udeľuje prístup na základe toho, kto ste — žiadne kľúče, ktoré treba stratiť, kopírovať alebo rotovať.

---

## Prehľad architektúry

### Tok overovania so spravovanou identitou

```mermaid
sequenceDiagram
    participant App as Vaša aplikácia<br/>(kontajnerová aplikácia)
    participant MI as Spravovaná identita<br/>(Azure AD)
    participant KV as Kľúčový trezor
    participant Storage as Úložisko Azure
    participant DB as Azure SQL
    
    App->>MI: Požiadať o prístupový token<br/>(automaticky)
    MI->>MI: Overiť identitu<br/>(heslo nie je potrebné)
    MI-->>App: Vrátiť token<br/>(platný 1 hodinu)
    
    App->>KV: Získať tajomstvo<br/>(pomocou tokenu)
    KV->>KV: Skontrolovať RBAC oprávnenia
    KV-->>App: Vrátiť hodnotu tajomstva
    
    App->>Storage: Nahrať blob<br/>(pomocou tokenu)
    Storage->>Storage: Skontrolovať RBAC oprávnenia
    Storage-->>App: Úspech
    
    App->>DB: Získať údaje<br/>(pomocou tokenu)
    DB->>DB: Skontrolovať SQL oprávnenia
    DB-->>App: Vrátiť výsledky
    
    Note over App,DB: Všetka autentifikácia je bez hesla!
```
### Typy spravovaných identít

```mermaid
graph TB
    MI[Spravovaná identita]
    SystemAssigned[Systémom priradená identita]
    UserAssigned[Používateľom priradená identita]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Životný cyklus viazaný na zdroj]
    SystemAssigned --> SA2[Automatické vytvorenie/odstránenie]
    SystemAssigned --> SA3[Najlepšie pre jediný zdroj]
    
    UserAssigned --> UA1[Nezávislý životný cyklus]
    UserAssigned --> UA2[Manuálne vytvorenie/odstránenie]
    UserAssigned --> UA3[Zdieľané medzi zdrojmi]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Funkcia | Pridelené systému | Pridelené používateľom |
|---------|----------------|---------------|
| **Životný cyklus** | Viazaný na zdroj | Nezávislá |
| **Vytvorenie** | Automatické so zdrojom | Manuálne vytvorenie |
| **Zmazanie** | Zmazaná so zdrojom | Pretrvá po zmazaní zdroja |
| **Zdieľanie** | Iba jeden zdroj | Viacero zdrojov |
| **Použitie** | Jednoduché scenáre | Zložité scenáre s viacerými zdrojmi |
| **Predvolené v AZD** | ✅ Odporúčané | Voliteľné |

---

## Predpoklady

### Požadované nástroje

Tieto nástroje by ste už mali mať nainštalované z predchádzajúcich lekcií:

```bash
# Overiť Azure Developer CLI
azd version
# ✅ Očakávané: azd verzia 1.0.0 alebo novšia

# Overiť Azure CLI
az --version
# ✅ Očakávané: azure-cli 2.50.0 alebo novšia
```

### Požiadavky Azure

- Aktívne predplatné Azure
- Oprávnenia na:
  - Vytvárať spravované identity
  - Priraďovať RBAC role
  - Vytvárať zdroje Key Vault
  - Nasadzovať Container Apps

### Potrebné znalosti

Toto by ste mali mať dokončené:
- [Inštalačný návod](installation.md) - nastavenie AZD
- [Základy AZD](azd-basics.md) - základné koncepty
- [Správa konfigurácie](configuration.md) - Premenné prostredia

---

## Lekcia 1: Pochopenie vzorov overovania

### Vzor 1: Pripojovacie reťazce (zastaralé - vyhnúť sa)

**Ako to funguje:**
```bash
# Reťazec pripojenia obsahuje prihlasovacie údaje
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Problémy:**
- ❌ Tajomstvá viditeľné v premenných prostredia
- ❌ Logované v nasadzovacích systémoch
- ❌ Ťažká rotácia
- ❌ Žiadna stopa auditu prístupu

**Kedy používať:** Iba pre lokálny vývoj, nikdy v produkcii.

---

### Vzor 2: Odkazy na Key Vault (lepšie)

**Ako to funguje:**
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

**Výhody:**
- ✅ Tajomstvá bezpečne uložené v Key Vault
- ✅ Centralizované riadenie tajomstiev
- ✅ Rotácia bez zmien v kóde

**Obmedzenia:**
- ⚠️ Stále používa kľúče/heslá
- ⚠️ Je potrebné spravovať prístup do Key Vault

**Kedy používať:** Prechodný krok od pripojovacích reťazcov k spravovanej identite.

---

### Vzor 3: Spravovaná identita (najlepšia prax)

**Ako to funguje:**
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

**Kód aplikácie:**
```javascript
// Žiadne tajomstvá nie sú potrebné!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Výhody:**
- ✅ Žiadne tajomstvá v kóde/konfigurácii
- ✅ Automatická rotácia poverení
- ✅ Plná stopa auditu
- ✅ Oprávnenia založené na RBAC
- ✅ Pripravené na súlad

**Kedy používať:** Vždy, pre produkčné aplikácie.

---

## Lekcia 2: Implementácia spravovanej identity s AZD

### Implementácia krok za krokom

Postavme bezpečnú Container App, ktorá používa spravovanú identitu na prístup k Azure Storage a Key Vault.

### Štruktúra projektu

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

### 1. Nakonfigurujte AZD (azure.yaml)

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

### 2. Infraštruktúra: Povoľte spravovanú identitu

**Súbor: `infra/main.bicep`**

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

### 3. Container App so systémovo priradenou identitou

**Súbor: `infra/app/container-app.bicep`**

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

### 4. Modul priraďovania RBAC rolí

**Súbor: `infra/core/role-assignment.bicep`**

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

### 5. Kód aplikácie so spravovanou identitou

**Súbor: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inicializovať poverenie (funguje automaticky so spravovanou identitou)
const credential = new DefaultAzureCredential();

// Nastavenie Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Kľúče nie sú potrebné!
);

// Nastavenie Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Kľúče nie sú potrebné!
);

// Kontrola stavu
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Nahrať súbor do blobového úložiska
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

// Získať tajomstvo z Key Vault
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

// Vypísať blobové kontajnery (ukazuje prístup na čítanie)
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

**Súbor: `src/package.json`**

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

### 6. Nasadiť a otestovať

```bash
# Inicializovať prostredie AZD
azd init

# Nasadiť infraštruktúru a aplikáciu
azd up

# Získať URL aplikácie
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Otestovať kontrolu stavu
curl $APP_URL/health
```

**✅ Očakávaný výstup:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Test nahratia blobu:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Očakávaný výstup:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Test výpisu kontajnerov:**
```bash
curl $APP_URL/containers
```

**✅ Očakávaný výstup:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Bežné role Azure RBAC

### Vstavané ID rolí pre spravovanú identitu

| Služba | Názov roly | ID roly | Povolenia |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Čítanie blobov a kontajnerov |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Čítanie, zápis, mazanie blobov |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Čítanie, zápis, mazanie správ v queue |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Čítanie tajomstiev |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Čítanie, zápis, mazanie tajomstiev |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Čítanie dát Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Čítanie, zápis dát Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Spravovať SQL databázy |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Odosielať, prijímať, spravovať správy |

### Ako nájsť ID rolí

```bash
# Zobraziť všetky vstavané role
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Vyhľadať konkrétnu rolu
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Zobraziť podrobnosti o role
az role definition list --name "Storage Blob Data Contributor"
```

---

## Praktické cvičenia

### Cvičenie 1: Povoľte spravovanú identitu pre existujúcu aplikáciu ⭐⭐ (Stredne náročné)

**Cieľ**: Pridať spravovanú identitu do existujúceho nasadenia Container App

**Scenár**: Máte Container App používajúcu pripojovacie reťazce. Preveďte ju na spravovanú identitu.

**Východiskový bod**: Container App s touto konfiguráciou:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Kroky**:

1. **Povoľte spravovanú identitu v Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Udeľte prístup k Storage:**

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

3. **Aktualizujte kód aplikácie:**

**Pred (pripojovací reťazec):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Po (spravovaná identita):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Aktualizujte premenné prostredia:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Nasadiť a otestovať:**

```bash
# Znovu nasadiť
azd up

# Otestujte, či to stále funguje
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Kritériá úspechu:**
- ✅ Aplikácia sa nasadí bez chýb
- ✅ Operácie so Storage fungujú (nahrávanie, výpis, stiahnutie)
- ✅ Žiadne pripojovacie reťazce v premenných prostredia
- ✅ Identita viditeľná v Azure Portal v sekcii "Identity"

**Overenie:**

```bash
# Skontrolujte, či je povolená spravovaná identita
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Očakávané: "SystemAssigned"

# Skontrolujte priradenie roly
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Očakávané: Zobrazuje rolu "Storage Blob Data Contributor"
```

**Čas**: 20-30 minút

---

### Cvičenie 2: Prístup viacerých služieb s používateľsky priradenou identitou ⭐⭐⭐ (Pokročilé)

**Cieľ**: Vytvoriť používateľsky priradenú identitu zdieľanú medzi viacerými Container Appmi

**Scenár**: Máte 3 mikroservisy, ktoré všetky potrebujú prístup k rovnakému Storage účtu a Key Vault.

**Kroky**:

1. **Vytvorte používateľsky priradenú identitu:**

**Súbor: `infra/core/identity.bicep`**

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

2. **Priraďte roly používateľsky priradenej identite:**

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

3. **Priraďte identitu viacerým Container Apps:**

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

4. **Kód aplikácie (všetky služby používajú rovnaký vzor):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Pre používateľom priradenú identitu zadajte ID klienta
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID klienta používateľom priradenej identity
);

// Alebo použite DefaultAzureCredential (automaticky zistí)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Nasadiť a overiť:**

```bash
azd up

# Otestovať, či všetky služby majú prístup k úložisku
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Kritériá úspechu:**
- ✅ Jedna identita zdieľaná medzi 3 službami
- ✅ Všetky služby majú prístup k Storage a Key Vault
- ✅ Identita pretrváva, ak zmažete jednu službu
- ✅ Centralizované riadenie povolení

**Výhody používateľsky priradenej identity:**
- Jedna identita na spravovanie
- Konzistentné povolenia naprieč službami
- Prežije zmazanie služby
- Vhodnejšie pre zložité architektúry

**Čas**: 30-40 minút

---

### Cvičenie 3: Implementácia rotácie tajomstiev v Key Vault ⭐⭐⭐ (Pokročilé)

**Cieľ**: Ukladať API kľúče tretích strán v Key Vault a pristupovať k nim cez spravovanú identitu

**Scenár**: Vaša aplikácia potrebuje volať externé API (OpenAI, Stripe, SendGrid), ktoré vyžaduje API kľúče.

**Kroky**:

1. **Vytvorte Key Vault s RBAC:**

**Súbor: `infra/core/keyvault.bicep`**

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

2. **Uložte tajomstvá do Key Vault:**

```bash
# Získať názov Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Uložiť API kľúče tretích strán
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

3. **Kód aplikácie na získavanie tajomstiev:**

**Súbor: `src/config.js`**

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
    // Najprv skontrolujte medzipamäť
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

4. **Použite tajomstvá v aplikácii:**

**Súbor: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inicializovať OpenAI s kľúčom z Key Vaultu
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Zavolať pri spustení
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

5. **Nasadiť a otestovať:**

```bash
azd up

# Otestovať, či API kľúče fungujú
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Kritériá úspechu:**
- ✅ Žiadne API kľúče v kóde alebo premenných prostredia
- ✅ Aplikácia získava kľúče z Key Vault
- ✅ Externé API fungujú správne
- ✅ Možnosť rotovať kľúče bez zmien v kóde

**Rotácia tajomstva:**

```bash
# Aktualizujte tajomstvo v Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Reštartujte aplikáciu, aby načítala nový kľúč
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Čas**: 25-35 minút

---

## Kontrolný bod znalostí

### 1. Vzory overovania ✓

Otestujte svoje pochopenie:

- [ ] **Otázka 1**: Aké sú tri hlavné vzory overovania? 
  - **A**: Pripojovacie reťazce (zastaralé), odkazy na Key Vault (prechod), spravovaná identita (najlepšia prax)

- [ ] **Otázka 2**: Prečo je spravovaná identita lepšia ako pripojovacie reťazce?
  - **A**: Žiadne tajomstvá v kóde, automatická rotácia, plná stopa auditu, oprávnenia RBAC

- [ ] **Otázka 3**: Kedy by ste použili používateľsky priradenú identitu namiesto systémovo priradenej?
  - **A**: Keď zdieľate identitu medzi viacerými zdrojmi alebo keď je životný cyklus identity nezávislý od životného cyklu zdroja

**Praktická verifikácia:**
```bash
# Skontrolujte, aký typ identity vaša aplikácia používa
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Zobrazte všetky priradenia rolí pre identitu
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC a povolenia ✓

Otestujte svoje pochopenie:

- [ ] **Otázka 1**: Aké je ID roly pre "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Otázka 2**: Aké povolenia poskytuje "Key Vault Secrets User"?
  - **A**: Prístup len na čítanie k tajomstvám (nemôže vytvárať, aktualizovať ani mazať)

- [ ] **Otázka 3**: Ako udeliť Container App prístup k Azure SQL?
  - **A**: Priraďte rolu "SQL DB Contributor" alebo nakonfigurujte Azure AD overovanie pre SQL

**Praktická verifikácia:**
```bash
# Vyhľadať konkrétnu rolu
az role definition list --name "Storage Blob Data Contributor"

# Skontrolujte, ktoré roly sú priradené vašej identite
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integrácia s Key Vault ✓

Otestujte svoje pochopenie:
- [ ] **Q1**: Ako povolíte RBAC pre Key Vault namiesto prístupových politík?
  - **A**: Nastavte `enableRbacAuthorization: true` v Bicep

- [ ] **Q2**: Ktorá knižnica Azure SDK rieši autentifikáciu spravovanej identity?
  - **A**: `@azure/identity` s triedou `DefaultAzureCredential`

- [ ] **Q3**: Ako dlho zostávajú tajomstvá Key Vault v medzipamäti?
  - **A**: Závisí od aplikácie; implementujte vlastnú stratégiu kešovania

**Praktické overenie:**
```bash
# Otestovať prístup k Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Skontrolovať, či je RBAC povolený
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Očakávané: true
```

---

## Najlepšie bezpečnostné postupy

### ✅ ROBTE:

1. **Vždy používajte spravovanú identitu v produkcii**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Používajte RBAC role s najmenšími privilégiami**
   - Používajte roly "Reader", keď je to možné
   - Vyhnite sa rolám "Owner" alebo "Contributor", pokiaľ to nie je nevyhnutné

3. **Ukladajte kľúče tretích strán v Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Povoľte auditovanie**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Používajte odlišné identity pre dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Pravidelne rotujte tajomstvá**
   - Nastavte dátumy exspirácie pre tajomstvá v Key Vault
   - Automatizujte rotáciu pomocou Azure Functions

### ❌ NEROBTE:

1. **Nikdy neukladajte tajomstvá priamo v kóde**
   ```javascript
   // ❌ ZLÉ
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Nepoužívajte pripojovacie reťazce v produkcii**
   ```javascript
   // ❌ ZLÉ
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Neudeľujte nadmerné oprávnenia**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Nezapisujte tajomstvá do logov**
   ```javascript
   // ❌ ZLÉ
   console.log('API Key:', apiKey);
   
   // ✅ DOBRÉ
   console.log('API Key retrieved successfully');
   ```

5. **Nezdieľajte produkčné identity medzi prostrediami**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Príručka riešenia problémov

### Problém: "Unauthorized" pri prístupe k Azure Storage

**Príznaky:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnóza:**

```bash
# Skontrolujte, či je spravovaná identita povolená
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Očakávané: "SystemAssigned" alebo "UserAssigned"

# Skontrolujte priradenia rolí
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Očakávané: Mali by ste vidieť "Storage Blob Data Contributor" alebo podobnú rolu
```

**Riešenia:**

1. **Udeľte správnu RBAC rolu:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Počkajte na propagáciu (môže trvať 5-10 minút):**
```bash
# Skontrolovať stav priradenia rolí
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Overte, či aplikačný kód používa správne poverenia:**
```javascript
// Uistite sa, že používate DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problém: Prístup k Key Vault zamietnutý

**Príznaky:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnóza:**

```bash
# Skontrolujte, či je RBAC pre Key Vault povolený
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Očakávané: true

# Skontrolujte priradenia rolí
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Riešenia:**

1. **Povoľte RBAC na Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Udeľte rolu Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problém: DefaultAzureCredential zlyháva lokálne

**Príznaky:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnóza:**

```bash
# Skontrolujte, či ste prihlásený
az account show

# Skontrolujte autentifikáciu Azure CLI
az ad signed-in-user show
```

**Riešenia:**

1. **Prihláste sa do Azure CLI:**
```bash
az login
```

2. **Nastavte predplatné Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Pre lokálny vývoj používajte premenné prostredia:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Alebo lokálne používajte iné poverenia:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Použite AzureCliCredential pre lokálny vývoj
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problém: Priradenie role trvá príliš dlho na propagáciu

**Príznaky:**
- Rola bola úspešne priradená
- Stále sa objavujú chyby 403
- Prerušovaný prístup (niekedy funguje, niekedy nie)

**Vysvetlenie:**
Zmeny RBAC v Azure môžu trvať 5-10 minút, kým sa globálne prejavia.

**Riešenie:**

```bash
# Počkajte a skúste znova
echo "Waiting for RBAC propagation..."
sleep 300  # Počkajte 5 minút

# Otestujte prístup
curl https://myapp.azurecontainerapps.io/upload

# Ak to stále zlyháva, reštartujte aplikáciu
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Úvahy o nákladoch

### Náklady na spravovanú identitu

| Zdroj | Cena |
|----------|------|
| **Spravovaná identita** | 🆓 **ZDARMA** - Bez poplatku |
| **Priradenia RBAC rolí** | 🆓 **ZDARMA** - Bez poplatku |
| **Požiadavky tokenov Azure AD** | 🆓 **ZDARMA** - Zahrnuté |
| **Operácie Key Vault** | $0.03 za 10 000 operácií |
| **Ukladanie v Key Vault** | $0.024 za tajomstvo za mesiac |

**Spravovaná identita šetrí peniaze tým, že:**
- ✅ Elimináciou operácií Key Vault pre autentifikáciu služba-k-službe
- ✅ Znížením bezpečnostných incidentov (žiadne uniknuté poverenia)
- ✅ Znížením prevádzkovej záťaže (žiadna manuálna rotácia)

**Príklad porovnania nákladov (mesačne):**

| Scenár | Pripojovacie reťazce | Spravovaná identita | Úspora |
|----------|-------------------|-----------------|---------|
| Malá aplikácia (1M požiadaviek) | ~$50 (Key Vault + ops) | ~$0 | $50/mesiac |
| Stredná aplikácia (10M požiadaviek) | ~$200 | ~$0 | $200/mesiac |
| Veľká aplikácia (100M požiadaviek) | ~$1,500 | ~$0 | $1,500/mesiac |

---

## Zistiť viac

### Oficiálna dokumentácia
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Dokumentácia SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúci: [Správa konfigurácie](configuration.md)
- → Nasledujúci: [Prvý projekt](first-project.md)
- 🏠 [Domov kurzu](../../README.md)

### Súvisiace príklady
- [Azure OpenAI Chat Example](../../../../examples/azure-openai-chat) - Používa spravovanú identitu pre Azure OpenAI
- [Microservices Example](../../../../examples/microservices) - Vzory autentifikácie viacerých služieb

---

## Zhrnutie

**Naučili ste sa:**
- ✅ Tri vzory autentifikácie (pripojovacie reťazce, Key Vault, spravovaná identita)
- ✅ Ako povoliť a nakonfigurovať spravovanú identitu v AZD
- ✅ Priradenia RBAC rolí pre služby Azure
- ✅ Integrácia Key Vault pre tajomstvá tretích strán
- ✅ Identity priradené používateľom vs systémové identity
- ✅ Najlepšie bezpečnostné postupy a riešenie problémov

**Kľúčové poznatky:**
1. **Vždy používajte spravovanú identitu v produkcii** - Žiadne tajomstvá, automatická rotácia
2. **Používajte RBAC roly s najmenšími privilégiami** - Udeľujte len potrebné oprávnenia
3. **Ukladajte kľúče tretích strán v Key Vault** - Centralizované riadenie tajomstiev
4. **Oddelte identity podľa prostredia** - Izolácia dev, staging, prod
5. **Povoľte auditovanie** - Sledujte, kto k čomu pristupoval

**Ďalšie kroky:**
1. Dokončite praktické cvičenia vyššie
2. Migrujte existujúcu aplikáciu z pripojovacích reťazcov na spravovanú identitu
3. Vytvorte svoj prvý projekt AZD s bezpečnosťou od prvého dňa: [Prvý projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o vylúčení zodpovednosti:
Tento dokument bol preložený pomocou AI prekladateľskej služby Co-op Translator (https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, majte na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny preklad vykonaný človekom. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vzniknuté v dôsledku použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
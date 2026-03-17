# Autentimismustrid ja hallatud identiteet

⏱️ **Hinnanguline aeg**: 45–60 minutit | 💰 **Kulukohustus**: Tasuta (ilma lisatasudeta) | ⭐ **Keerukus**: Kesktase

**📚 Õppimise rada:**
- ← Eelmine: [Konfiguratsiooni haldus](configuration.md) – keskkonnamuutujate ja saladuste haldamine
- 🎯 **Sa oled siin**: Autentimine & turvalisus (hallatud identiteet, Key Vault, turvalised mustrid)
- → Järgmine: [Esimene projekt](first-project.md) – ehita oma esimene AZD rakendus
- 🏠 [Kursuse kodu](../../README.md)

---

## Mida õpid

Selle õppetunni lõpetamisel:
- Sa mõistad Azure autentimismustreid (võtmed, ühendusstringid, hallatud identiteet)
- Rakendad **hallatud identiteeti** paroolivabaks autentimiseks
- Kaitsed saladusi **Azure Key Vault** integratsiooniga
- Konfigureerid **rollipõhist juurdepääsukontrolli (RBAC)** AZD juurutuste jaoks
- Rakendad turvalisuse parimaid tavasid Container Apps ja Azure teenustes
- Teed migratsiooni võtmepõhisest autentimisest identiteedipõhisele autentimisele

## Miks on hallatud identiteet oluline

### Probleem: Traditsiooniline autentimine

**Enne hallatud identiteeti:**
```javascript
// ❌ TURVARISK: Koodis kõvakodeeritud saladused
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Probleemid:**
- 🔴 **Avalikud saladused** koodis, konfiguratsioonifailides, keskkonnamuutujates
- 🔴 **Tunnuste keeramine** nõuab koodi muutmist ja uuesti juurutamist
- 🔴 **Audiitoräbad** – kes millele ligi pääses ja millal?
- 🔴 **Levinuuma** – saladused hajutatud mitmes süsteemis
- 🔴 **Vastavusriskid** – turvaauditite läbikukkumine

### Lahendus: Hallatud identiteet

**Pärast hallatud identiteeti:**
```javascript
// ✅ TURVALINE: Koodis pole saladusi
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure haldab autentimist automaatselt
);
```

**Eelised:**
- ✅ **Null saladusi** koodis või konfiguratsioonis
- ✅ **Automaatne keeramine** – Azure haldab seda
- ✅ **Täielik auditeerimislugu** Azure AD logides
- ✅ **Keskne turvalahendus** – halda Azure portaalis
- ✅ **Vastavus valmis** – vastab turvastandarditele

**Analoogia**: traditsiooniline autentimine on nagu kanda mitut füüsilist võtit erinevatele ustele. Hallatud identiteet on nagu turvakaart, mis automaatselt annab juurdepääsu sinu identiteedi alusel – võtmeid pole vaja kaotada, kopeerida ega keerata.

---

## Arhitektuuri ülevaade

### Autentimise voog hallatud identiteediga

```mermaid
sequenceDiagram
    participant App as Teie rakendus<br/>(Konteinerirakendus)
    participant MI as Hallatud identiteet<br/>(Azure AD)
    participant KV as Võtmekogu
    participant Storage as Azure Storage
    participant DB as Azure SQL
    
    App->>MI: Taotle juurdepääsu märk<br/>(automaatne)
    MI->>MI: Kontrolli identiteeti<br/>(parooli pole vaja)
    MI-->>App: Tagasta märk<br/>(kehtib 1 tund)
    
    App->>KV: Hangi saladus<br/>(märgi abil)
    KV->>KV: Kontrolli RBAC õigusi
    KV-->>App: Tagasta saladuse väärtus
    
    App->>Storage: Laadi blob üles<br/>(märgi abil)
    Storage->>Storage: Kontrolli RBAC õigusi
    Storage-->>App: Õnnestus
    
    App->>DB: Päringu andmed<br/>(märgi abil)
    DB->>DB: Kontrolli SQL õigusi
    DB-->>App: Tagasta tulemused
    
    Note over App,DB: Kõik autentimised ilma paroolita!
```
### Hallatud identiteetide tüübid

```mermaid
graph TB
    MI[Haldatud identiteet]
    SystemAssigned[Süsteemi määratud identiteet]
    UserAssigned[Kasutajamääratud identiteet]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Elutsükkel seotud ressursiga]
    SystemAssigned --> SA2[Automaatne loomine/kustutamine]
    SystemAssigned --> SA3[Parim ühe ressursi jaoks]
    
    UserAssigned --> UA1[Sõltumatu elutsükkel]
    UserAssigned --> UA2[Käsitsi loomine/kustutamine]
    UserAssigned --> UA3[Jagatud ressursside vahel]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Funktsioon | Süsteemiga määratud | Kasutajaga määratud |
|---------|----------------|---------------|
| **Elutsükkel** | Sidemega ressursiga | Sõltumatu |
| **Loomine** | Automaatne ressursiga | Käsitsi loomine |
| **Kustutamine** | Kustutatakse koos ressursiga | Püsib pärast ressursi kustutamist |
| **Jagamine** | Üks ressurss | Mitme ressursi vahel |
| **Kasutusjuhtum** | Lihtsad stsenaariumid | Komplekssemad mitme ressursi stsenaariumid |
| **AZD vaikimisi** | ✅ Soovitatav | Valikuline |

---

## Eeldused

### Vajalikud tööriistad

Sul peaksid olema need juba installitud eelmistest õppetundidest:

```bash
# Kontrolli Azure Developer CLI-d
azd version
# ✅ Oodatud: azd versioon 1.0.0 või uuem

# Kontrolli Azure CLI-d
az --version
# ✅ Oodatud: azure-cli 2.50.0 või uuem
```

### Azure nõuded

- Aktiivne Azure tellimus
- Õigused:
  - Luua hallatud identiteete
  - Määrata RBAC rolle
  - Luua Key Vault ressursse
  - Juurutada Container Apps

### Teadmiste eeldused

Pead olema sooritanud:
- [Paigaldusjuhend](installation.md) – AZD seadistus
- [AZD põhialused](azd-basics.md) – põhimõisted
- [Konfiguratsiooni haldus](configuration.md) – keskkonnamuutujad

---

## Õppetund 1: Autentimismustrite mõistmine

### Muster 1: Ühendusstringid (vananenud - väldi)

**Kuidas töötab:**
```bash
# Ühendusstring sisaldab mandaate
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Probleemid:**
- ❌ Saladused nähtavad keskkonnamuutujate seas
- ❌ Logitud juurutussüsteemidesse
- ❌ Raske keerata
- ❌ Juurdepääsu audit puudub

**Millal kasutada:** ainult kohaliku arenduse jaoks, mitte kunagi tootmises.

---

### Muster 2: Key Vault viited (parem)

**Kuidas töötab:**
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

**Eelised:**
- ✅ Saladused turvaliselt Key Vaultis
- ✅ Keskne saladuste haldus
- ✅ Keeramine koodimuudatusi tegemata

**Piirangud:**
- ⚠️ Kasutab endiselt võtmeid/paroolisid
- ⚠️ Pead haldama Key Vault juurdepääsu

**Millal kasutada:** üleminekutsükkel ühendusstringidelt hallatud identiteedile.

---

### Muster 3: Hallatud identiteet (parim tava)

**Kuidas töötab:**
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

**Rakenduse kood:**
```javascript
// Saladusi pole vaja!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Eelised:**
- ✅ Null saladusi koodis/konfiguratsioonis
- ✅ Automaatne tunnuste keeramine
- ✅ Täielik auditeerimislugu
- ✅ RBAC-põhised õigused
- ✅ Vastavuse valmis

**Millal kasutada:** alati, tootmisrakendustes.

---

## Õppetund 2: Hallatud identiteedi rakendamine AZD-ga

### Samm-sammuline juhend

Loome turvalise Container App, mis kasutab hallatud identiteeti Azure Storage ja Key Vault ligipääsuks.

### Projekti struktuur

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

### 1. Seadista AZD (azure.yaml)

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

### 2. Infrastruktuur: Luba hallatud identiteet

**Fail: `infra/main.bicep`**

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

### 3. Container App süsteemiga määratud identiteediga

**Fail: `infra/app/container-app.bicep`**

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

### 4. RBAC rolli määramise moodul

**Fail: `infra/core/role-assignment.bicep`**

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

### 5. Rakenduse kood hallatud identiteediga

**Fail: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Algatage volikirjad (töötab automaatselt hallatud identiteediga)
const credential = new DefaultAzureCredential();

// Azure Storage seadistus
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Võtmeid pole vaja!
);

// Key Vault seadistus
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Võtmeid pole vaja!
);

// Tervisekontroll
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Laadige fail blob-salvestusse
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

// Hankige salajane võti Key Vault-ist
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

// Loetlege blob-konteinerid (näitab lugemisõigust)
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

**Fail: `src/package.json`**

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

### 6. Juuruta ja testi

```bash
# Initsialiseeri AZD keskkond
azd init

# Paigalda infrastruktuur ja rakendus
azd up

# Hangi rakenduse URL
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Testi tervisekontrolli
curl $APP_URL/health
```

**✅ Oodatud tulemus:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Testi blob üleslaadimine:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Oodatud tulemus:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Testi konteinerite nimekiri:**
```bash
curl $APP_URL/containers
```

**✅ Oodatud tulemus:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Levinumad Azure RBAC rollid

### Hallatud identiteedi sisseehitatud rolli ID-d

| Teenus | Rolli nimi | Rolli ID | Õigused |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Loe blobe ja konteinerid |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Loe, kirjuta, kustuta blobe |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Loe, kirjuta, kustuta järjekorra sõnumeid |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Loeb saladusi |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Loe, kirjuta, kustuta saladusi |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Loe Cosmos DB andmeid |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Loe, kirjuta Cosmos DB andmeid |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Halda SQL andmebaase |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Saada, vasta, halda sõnumeid |

### Kuidas leida rolli ID-sid

```bash
# Loenda kõik sisseehitatud rollid
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Otsi konkreetset rolli
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Hangi rolli üksikasjad
az role definition list --name "Storage Blob Data Contributor"
```

---

## Praktilised harjutused

### Harjutus 1: Luba hallatud identiteet olemasolevale rakendusele ⭐⭐ (Kesktase)

**Eesmärk**: Lisa hallatud identiteet olemasolevale Container App juurutusele

**Stsenaarium**: Sul on Container App, mis kasutab ühendusstringe. Muuda see korraldatud identiteediks.

**Alguspunkt**: Container App selle konfiguratsiooniga:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Sammud**:

1. **Luba hallatud identiteet Bicep-is:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Anna Storage ligipääs:**

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

3. **Uuenda rakenduse koodi:**

**Enne (ühendusstring):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Pärast (hallatud identiteet):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Uuenda keskkonnamuutujaid:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Juuruta ja testi:**

```bash
# Taaskäivitamine
azd up

# Kontrolli, et see ikka töötab
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Õnnestumise kriteeriumid:**
- ✅ Rakendus juurutub veata
- ✅ Storage toimingud töötavad (üleslaadimine, nimekiri, allalaadimine)
- ✅ Keskkonnamuutujates pole ühendusstringe
- ✅ Identiteeti näha Azure portaalis “Identity” vahekaardil

**Kontroll:**

```bash
# Kontrolli, kas haldatud identiteet on lubatud
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Oodatud: "SystemAssigned"

# Kontrolli rolli määrangut
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Oodatud: Kuvab rolli "Storage Blob Data Contributor"
```

**Aeg**: 20–30 minutit

---

### Harjutus 2: Mitme teenusega ligipääs kasutajaga määratud identiteediga ⭐⭐⭐ (Edasijõudnu)

**Eesmärk**: Loo kasutajaga määratud identiteet, mida jagatakse mitme Container App vahel

**Stsenaarium**: Sul on 3 mikroteenust, mis kõik vajavad ligipääsu samale Storage kontole ja Key Vaultile.

**Sammud**:

1. **Loo kasutajaga määratud identiteet:**

**Fail: `infra/core/identity.bicep`**

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

2. **Määra rollid kasutajaga määratud identiteedile:**

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

3. **Määra identiteet mitmele Container App-ile:**

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

4. **Rakenduse kood (kõik teenused kasutavad sama mustrit):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Kasutaja määratud identiteedi puhul täpsustage kliendi ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // Kasutaja määratud identiteedi kliendi ID
);

// Või kasutage DefaultAzureCredential (tuvastab automaatselt)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Juuruta ja kontrolli:**

```bash
azd up

# Testi, et kõik teenused pääsevad salvestusruumile ligi
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Õnnestumise kriteeriumid:**
- ✅ Üks identiteet jagatud 3 teenuse vahel
- ✅ Kõik teenused pääsevad ligi Storage ja Key Vaultile
- ✅ Identiteet püsib, kui kustutad teenuse
- ✅ Keskne õiguste haldus

**Kasutajaga määratud identiteedi eelised:**
- Üks identiteet haldamiseks
- Järjepidevad õigused teenuste vahel
- Püsib teenuse kustutamisel
- Sobib keerukamate arhitektuuride jaoks

**Aeg**: 30–40 minutit

---

### Harjutus 3: Key Vault saladuse keeramise rakendamine ⭐⭐⭐ (Edasijõudnu)

**Eesmärk**: Hoida kolmandate osapoolte API võtmeid Key Vaultis ja pääseda neile ligi hallatud identiteedi kaudu

**Stsenaarium**: Sinu rakendus peab kutsuma väliseid API-sid (OpenAI, Stripe, SendGrid), mis nõuavad API võtmeid.

**Sammud**:

1. **Loo Key Vault koos RBAC-iga:**

**Fail: `infra/core/keyvault.bicep`**

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

2. **Salvesta saladused Key Vaulti:**

```bash
# Saa Key Vaulti nimi
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Salvesta kolmanda osapoole API võtmed
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

3. **Rakenduse kood saladuste hankimiseks:**

**Fail: `src/config.js`**

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
    // Kontrollige esmalt vahemälu
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

4. **Kasuta saladusi rakenduses:**

**Fail: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Algatage OpenAI võtmest Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Käivitage käivitamisel
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

5. **Juuruta ja testi:**

```bash
azd up

# Testi, et API võtmed toimivad
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Õnnestumise kriteeriumid:**
- ✅ Pole API võtmeid koodis ega keskkonnamuutujates
- ✅ Rakendus hangib võtmed Key Vaultist
- ✅ Kolmandate osapoolte API-d töötavad korrektselt
- ✅ Võtmeid saab keerata ilma koodi muutmata

**Keera saladust:**

```bash
# Uuenda saladust Key Vaultis
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Taaskäivita rakendus, et võtta kasutusele uus võti
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Aeg**: 25–35 minutit

---

## Teadmiste kontrollpunkt

### 1. Autentimismustrid ✓

Testi oma arusaamist:

- [ ] **K1**: Millised on kolm peamist autentimismustrit?  
  - **V**: Ühendusstringid (vananenud), Key Vault viited (üleminek), Hallatud identiteet (parim)

- [ ] **K2**: Miks on hallatud identiteet parem kui ühendusstringid?  
  - **V**: Koodis pole saladusi, automaatne keeramine, täielik auditeerimislugu, RBAC õigused

- [ ] **K3**: Millal kasutada kasutajaga määratud identiteeti süsteemiga määratud asemel?  
  - **V**: Kui jagatakse identiteeti mitme ressursi vahel või identiteedi elutsükkel on ressursist sõltumatu

**Käed-külge kontrollimine:**
```bash
# Kontrolli, millist tüüpi identiteeti sinu rakendus kasutab
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Loetle kõik rolli määramised identiteedi jaoks
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC ja õigused ✓

Testi oma arusaamist:

- [ ] **K1**: Mis on rolli ID "Storage Blob Data Contributor" jaoks?  
  - **V**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **K2**: Millised õigused annab "Key Vault Secrets User"?  
  - **V**: Ainult lugemisõigus saladustele (ei saa luua, uuendada ega kustutada)

- [ ] **K3**: Kuidas anda Container App-le ligipääs Azure SQL-ile?  
  - **V**: Määra "SQL DB Contributor" roll või konfigureeri SQL jaoks Azure AD autentimine

**Käed-külge kontrollimine:**
```bash
# Leia konkreetne roll
az role definition list --name "Storage Blob Data Contributor"

# Kontrolli, millised rollid on sinu identiteedile määratud
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault integratsioon ✓

Testi oma arusaamist:
- [ ] **K1**: Kuidas lubada RBAC Key Vaulti jaoks ligipääsupoliitikate asemel?
  - **Vastus**: Määra Bicepis `enableRbacAuthorization: true`

- [ ] **K2**: Milline Azure SDK teek haldab hallatud identiteedi autentimist?
  - **Vastus**: `@azure/identity` koos klassiga `DefaultAzureCredential`

- [ ] **K3**: Kui kaua Key Vaulti saladused vahemälus püsivad?
  - **Vastus**: Rakenduspõhine; rakenda oma vahemälustrateegia

**Praktiline kontroll:**
```bash
# Testi Key Vaulti juurdepääsu
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Kontrolli, kas RBAC on lubatud
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Oodatud: tõene
```

---

## Turvalisuse parimad tavad

### ✅ TEE:

1. **Kasuta tootmises alati hallatud identiteeti**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Kasuta RBAC rolle minimaalsete õigustega**
   - Kasuta võimalusel "Reader" rolle
   - Väldi "Owner" või "Contributor" rolle, kui pole vaja

3. **Hoia kolmanda osapoole võtmeid Key Vaultis**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Luba auditeerimise logimine**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Kasuta dev/staging/production jaoks erinevaid identiteete**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rota saladusi regulaarselt**
   - Sea Key Vaulti saladustele aegumiskuupäevad
   - Automaatne rotatsioon Azure Functions abil

### ❌ ÄRA TEE:

1. **Ära kunagi koodi kõvakodeeri saladusi**
   ```javascript
   // ❌ HALB
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Ära kasuta tootmises ühendusstringe**
   ```javascript
   // ❌ HALB
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Ära anna liigseid õigusi**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Ära logi saladusi**
   ```javascript
   // ❌ HALB
   console.log('API Key:', apiKey);
   
   // ✅ HEA
   console.log('API Key retrieved successfully');
   ```

5. **Ära jaga tootmise identiteete keskkondade vahel**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Tõrkeotsingu juhend

### Probleem: "Unauthorized" Azure Storage’i kasutamisel

**Sümptomid:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnoos:**

```bash
# Kontrolli, kas hallatud identiteet on lubatud
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Oodatud: "SystemAssigned" või "UserAssigned"

# Kontrolli rolli määramisi
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Oodatud: Tuleb näha "Storage Blob Data Contributor" või sarnast rolli
```

**Lahendused:**

1. **Anna õige RBAC roll:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Oota levikut (võib võtta 5-10 minutit):**
```bash
# Kontrolli rolli määramise olekut
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Kontrolli, et rakenduskood kasutab õiget volitust:**
```javascript
// Veendu, et kasutad DefaultAzureCredential'i
const credential = new DefaultAzureCredential();
```

---

### Probleem: Key Vaulti ligipääs keelatud

**Sümptomid:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnoos:**

```bash
# Kontrolli, kas võtmeklapi RBAC on lubatud
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Oodatud: tõene

# Kontrolli rollimääranguid
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Lahendused:**

1. **Luba RBAC Key Vaultis:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Anna Key Vault Secrets Useri roll:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Probleem: DefaultAzureCredential ei tööta lokaalselt

**Sümptomid:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnoos:**

```bash
# Kontrolli, kas oled sisse logitud
az account show

# Kontrolli Azure CLI autentimist
az ad signed-in-user show
```

**Lahendused:**

1. **Logi sisse Azure CLI-sse:**
```bash
az login
```

2. **Sea Azure tellimus:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Lokaalse arenduse jaoks kasuta keskkonnamuutujaid:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Või kasuta lokaalselt teist volitust:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Kasuta kohaliku arenduse jaoks AzureCliCredential'i
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Probleem: Rolli määramine võtab liiga kaua aega

**Sümptomid:**
- Roll määrati edukalt
- Endiselt 403 vead
- Juhtuvad hooti ligipääsu probleemid

**Selgitus:**
Azure RBAC muudatuste levik võib võtta 5-10 minutit üle kogu maailma.

**Lahendus:**

```bash
# Oota ja proovi uuesti
echo "Waiting for RBAC propagation..."
sleep 300  # Oota 5 minutit

# Testi juurdepääsu
curl https://myapp.azurecontainerapps.io/upload

# Kui ikka ebaõnnestub, taaskäivita rakendus
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Kulude kaalutlused

### Hallatud identiteedi kulud

| Ressurss | Kulu |
|----------|------|
| **Hallatud identiteet** | 🆓 **TASUTA** - ei maksustata |
| **RBAC rolli määramised** | 🆓 **TASUTA** - ei maksustata |
| **Azure AD tokenipäringud** | 🆓 **TASUTA** - sisalduvad |
| **Key Vaulti toimingud** | $0.03 10 000 toimingu kohta |
| **Key Vaulti salvestusruum** | $0.024 saladuse kohta kuus |

**Hallatud identiteet säästab raha:**
- ✅ Vähendab Key Vaulti toiminguid teenuste vaheliseks autentimiseks
- ✅ Vähendab turvaintsidente (pole lekkinud volitusi)
- ✅ Alandab operatiivset koormust (pole manuaalset rotatsiooni)

**Kulude võrdlus (kuus):**

| Stsenaarium | Ühendusstringid | Hallatud identiteet | Sääst |
|-------------|-----------------|--------------------|-------|
| Väike rakendus (1M päringut) | ~50$ (Key Vault + toimingud) | ~0$ | 50$/kuu |
| Keskmine rakendus (10M päringut) | ~200$ | ~0$ | 200$/kuu |
| Suur rakendus (100M päringut) | ~1500$ | ~0$ | 1500$/kuu |

---

## Õpi veel

### Ametlik dokumentatsioon
- [Azure Hallatud identiteet](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK dokumentatsioon
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Järgmised sammud kursusel
- ← Eelmine: [Konfiguratsiooni haldus](configuration.md)
- → Järgmine: [Esimene projekt](first-project.md)
- 🏠 [Kursuse avaleht](../../README.md)

### Seotud näited
- [Microsoft Foundry Models Chat näide](../../../../examples/azure-openai-chat) – Kasutab Microsoft Foundry Models hallatud identiteeti
- [Microservices näide](../../../../examples/microservices) – Mitme teenuse autentimise mustrid

---

## Kokkuvõte

**Õppisid:**
- ✅ Kolm autentimismustrit (ühendusstringid, Key Vault, hallatud identiteet)
- ✅ Kuidas lubada ja seadistada hallatud identiteeti AZD-s
- ✅ RBAC rollide määramine Azure teenustele
- ✅ Key Vault integreerimine kolmanda osapoole saladuste jaoks
- ✅ Kasutaja määratud vs süsteemi määratud identiteedid
- ✅ Turvalisuse parimad tavad ja tõrkeotsing

**Peamised punktid:**
1. **Kasuta tootmises alati hallatud identiteeti** – null saladusi, automaatne rotatsioon
2. **Kasuta minimaalsete õigustega RBAC rolle** – anna ainult vajalikud õigused
3. **Hoia kolmanda osapoole võtmeid Key Vaultis** – keskne saladuste haldus
4. **Kasuta eraldi identiteete igas keskkonnas** – dev, staging, prod isolatsioon
5. **Luba auditeerimise logimine** – jälgi, kes mida kasutas

**Järgmised sammud:**
1. Täida ülaltoodud praktilised ülesanded
2. Migreeri olemasolev rakendus ühendusstringidelt hallatud identiteedile
3. Ehita oma esimene AZD projekt turvalisusega alates esimesest päevast: [Esimene projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, tuleb arvestada, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe korral soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
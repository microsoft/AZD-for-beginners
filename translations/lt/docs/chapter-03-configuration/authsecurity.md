# Authentication Patterns and Managed Identity

⏱️ **Apskaičiuojamas laikas**: 45-60 minučių | 💰 **Kaštų poveikis**: Nemokama (jokių papildomų mokesčių) | ⭐ **Sudėtingumas**: Vidutinio lygio

**📚 Mokymosi kelias:**
- ← Ankstesnis: [Konfigūracijos valdymas](configuration.md) - Aplinkos kintamųjų ir slaptumų valdymas
- 🎯 **Jūs čia**: Autentifikavimas ir saugumas (Managed Identity, Key Vault, saugūs modeliai)
- → Toliau: [Pirmasis projektas](first-project.md) - Sukurkite savo pirmąją AZD programą
- 🏠 [Kurso pradžia](../../README.md)

---

## Ko išmoksite

Baigę šią pamoką, jūs:
- Suprasite Azure autentifikavimo modelius (raktai, prisijungimo eilutės, managed identity)
- Įdiegsite **Managed Identity** be slaptažodžių autentifikavimui
- Apsaugosite slaptus duomenis integruodami **Azure Key Vault**
- Konfigūruosite **prieigos valdymą pagal vaidmenis (RBAC)** AZD diegimams
- Taikysite saugumo gerąsias praktikas Container Apps ir Azure paslaugoms
- Migracijos nuo raktų pagrįsto prie identiteto pagrįsto autentifikavimo

## Kodėl Managed Identity svarbi

### Problema: Tradicinis autentifikavimas

**Prieš Managed Identity:**
```javascript
// ❌ SAUGUMO RIZIKA: Įkoduoti slapti duomenys programiniame kode
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Problemos:**
- 🔴 **Atviri slaptumai** kode, konfigūracijos failuose, aplinkos kintamuosiuose
- 🔴 **Prisijungimo duomenų sukimasis** reikalauja kodo pakeitimų ir perpaskirstymo
- 🔴 **Auditavimo košmarai** - kas pasiekė ką, kada?
- 🔴 **Išsisklaidymas** - slaptažodžiai pasklidę po įvairias sistemas
- 🔴 **Atitikties rizikos** - nepraeina saugumo auditų

### Sprendimas: Managed Identity

**Po Managed Identity:**
```javascript
// ✅ SAUGU: Kode nėra slaptų duomenų
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure automatiškai tvarko autentifikaciją
);
```

**Privalumai:**
- ✅ **Nėra jokių slaptumų** kode ar konfigūracijoje
- ✅ **Automatinis sukimasis** - tai valdo Azure
- ✅ **Pilnas audito žurnalas** Azure AD įrašuose
- ✅ **Centralizuotas saugumas** - valdykite per Azure Portal
- ✅ **Paruošta atitiktims** - atitinka saugumo standartus

**Palyginimas**: Tradicinis autentifikavimas yra tarsi nešiotis kelis fizinius raktus skirtingiems durims. Managed Identity yra tarsi saugumo pažymėjimas, kuris automatiškai suteikia prieigą pagal jūsų tapatybę—nėra raktų, kuriuos galima pamesti, kopijuoti ar keisti.

---

## Architektūros apžvalga

### Autentifikacijos eiga su Managed Identity

```mermaid
sequenceDiagram
    participant App as Jūsų programa<br/>(Konteinerio programa)
    participant MI as Valdomas identitetas<br/>(Azure AD)
    participant KV as Raktų saugykla
    participant Storage as Azure saugykla
    participant DB as Azure SQL
    
    App->>MI: Prašoma prieigos žetono<br/>(automatiniu būdu)
    MI->>MI: Patikrina tapatybę<br/>(nereikia slaptažodžio)
    MI-->>App: Grąžina žetoną<br/>(galioja 1 val.)
    
    App->>KV: Gauti slaptą reikšmę<br/>(naudojant žetoną)
    KV->>KV: Tikrina RBAC teises
    KV-->>App: Grąžina slaptą reikšmę
    
    App->>Storage: Įkelti blobą<br/>(naudojant žetoną)
    Storage->>Storage: Tikrina RBAC teises
    Storage-->>App: Sėkmė
    
    App->>DB: Užklausti duomenų<br/>(naudojant žetoną)
    DB->>DB: Tikrina SQL teises
    DB-->>App: Grąžina rezultatus
    
    Note over App,DB: Visa autentifikacija be slaptažodžių!
```}
### Managed Identity tipai

```mermaid
graph TB
    MI[Valdoma tapatybė]
    SystemAssigned[Sistemos priskirta tapatybė]
    UserAssigned[Vartotojo priskirta tapatybė]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Gyvavimo ciklas susietas su resursu]
    SystemAssigned --> SA2[Automatinis kūrimas/šalinimas]
    SystemAssigned --> SA3[Geriausia vienam resursui]
    
    UserAssigned --> UA1[Nepriklausomas gyvavimo ciklas]
    UserAssigned --> UA2[Rankinis kūrimas/šalinimas]
    UserAssigned --> UA3[Bendrinama tarp resursų]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Savybė | Sistemos priskirta | Vartotojo priskirta |
|---------|----------------|---------------|
| **Gyvavimo ciklas** | Susieta su resursu | Nepriklausoma |
| **Sukūrimas** | Automatiškai su resursu | Rankinis sukūrimas |
| **Ištrynimas** | Ištrinama su resursu | Išlieka po resurso ištrynimo |
| **Dalijimasis** | Tik vienam resursui | Keliems resursams |
| **Naudojimo atvejis** | Paprasti scenarijai | Sudėtingi kelių resursų scenarijai |
| **AZD numatytoji** | ✅ Rekomenduojama | Pasirenkama |

---

## Prieš sąlygos

### Reikalingi įrankiai

Jūs turėtumėte jau turėti šiuos įdiegtus iš ankstesnių pamokų:

```bash
# Patikrinkite Azure Developer CLI
azd version
# ✅ Laukiama: azd versija 1.0.0 arba naujesnė

# Patikrinkite Azure CLI
az --version
# ✅ Laukiama: azure-cli 2.50.0 arba naujesnė
```

### Azure reikalavimai

- Aktyvi Azure prenumerata
- Leidimai:
  - Kurti managed identities
  - Priskirti RBAC vaidmenis
  - Kurti Key Vault resursus
  - Diegti Container Apps

### Žinių priešsąlygos

Turėtumėte būti pabaigę:
- [Įdiegimo vadovas](installation.md) - AZD nustatymas
- [AZD pagrindai](azd-basics.md) - Pagrindinės sąvokos
- [Konfigūracijos valdymas](configuration.md) - Aplinkos kintamieji

---

## Pamoka 1: Autentifikavimo modelių supratimas

### Modelis 1: Prisijungimo eilutės (Legacy - Venkite)

**Kaip tai veikia:**
```bash
# Ryšio eilutėje yra prisijungimo duomenys
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Problemos:**
- ❌ Slaptumai matomi aplinkos kintamuosiuose
- ❌ Loguojami diegimo sistemose
- ❌ Sunku sukinėti
- ❌ Nėra prieigos audito žurnalo

**Kada naudoti:** Tik vietiniam vystymui, niekada produkcijoje.

---

### Modelis 2: Key Vault nuorodos (Geriausia)

**Kaip tai veikia:**
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

**Privalumai:**
- ✅ Slaptumai saugomi saugiai Key Vault
- ✅ Centralizuotas slaptumų valdymas
- ✅ Sukimas be kodo pakeitimų

**Apribojimai:**
- ⚠️ Vis dar naudojami raktai/slaptažodžiai
- ⚠️ Reikia valdyti Key Vault prieigą

**Kada naudoti:** Perėjimo žingsnis nuo prisijungimo eilutės prie managed identity.

---

### Modelis 3: Managed Identity (Geriausia praktika)

**Kaip tai veikia:**
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

**Programos kodas:**
```javascript
// Paslapčių nereikia!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Privalumai:**
- ✅ Nėra slaptumų kode/konfigūracijoje
- ✅ Automatinis kredencialų sukimasis
- ✅ Pilnas audito žurnalas
- ✅ Leidimai pagal RBAC
- ✅ Paruošta atitiktims

**Kada naudoti:** Visada, produkcinėms programoms.

---

## Pamoka 2: Managed Identity įgyvendinimas su AZD

### Po žingsnio įgyvendinimas

Sukurkime saugų Container App, kuris naudoja managed identity prieigai prie Azure Storage ir Key Vault.

### Projekto struktūra

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

### 1. Konfigūruokite AZD (azure.yaml)

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

### 2. Infrastruktūra: Įjungti Managed Identity

**Failas: `infra/main.bicep`**

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

### 3. Container App su sistemos priskirta identiteta

**Failas: `infra/app/container-app.bicep`**

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

### 4. RBAC vaidmens priskyrimo modulis

**Failas: `infra/core/role-assignment.bicep`**

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

### 5. Programos kodas su Managed Identity

**Failas: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inicializuoti kredencialą (veikia automatiškai su valdomu identitetu)
const credential = new DefaultAzureCredential();

// Azure saugyklos nustatymas
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Raktų nereikia!
);

// Key Vault nustatymas
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Raktų nereikia!
);

// Sveikatos patikra
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Įkelti failą į blob saugyklą
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

// Gauti slaptį iš Key Vault
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

// Išvardinti blob talpyklas (parodo skaitymo prieigą)
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

**Failas: `src/package.json`**

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

### 6. Diegimas ir testavimas

```bash
# Inicializuoti AZD aplinką
azd init

# Diegti infrastruktūrą ir programą
azd up

# Gauti programos URL
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Išbandyti sveikatos patikrą
curl $APP_URL/health
```

**✅ Tikėtinas išvestis:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Blob įkėlimo testas:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Tikėtinas išvestis:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Konteinerių sąrašo testas:**
```bash
curl $APP_URL/containers
```

**✅ Tikėtinas išvestis:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Dažniausiai naudojami Azure RBAC vaidmenys

### Iš anksto apibrėžtų vaidmenų ID skirti Managed Identity

| Service | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Skaityti blokus ir konteinerius |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Skaityti, rašyti, trinti blokus |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Skaityti, rašyti, trinti eilutės žinutes |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Skaityti slaptus duomenis |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Skaityti, rašyti, trinti slaptus duomenis |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Skaityti Cosmos DB duomenis |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Skaityti, rašyti Cosmos DB duomenis |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Valdyti SQL duomenų bazes |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Siųsti, gauti, valdyti žinutes |

### Kaip rasti vaidmenų ID

```bash
# Išvardinti visus integruotus vaidmenis
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Ieškoti konkretaus vaidmens
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Gauti vaidmens detales
az role definition list --name "Storage Blob Data Contributor"
```

---

## Praktinės užduotys

### Užduotis 1: Įjungti Managed Identity esamai programai ⭐⭐ (Vidutinio sudėtingumo)

**Tikslas**: Pridėti managed identity prie esamo Container App diegimo

**Scenarijus**: Turite Container App, naudojantį prisijungimo eilutes. Konvertuokite jį į managed identity.

**Pradinis taškas**: Container App su šia konfigūracija:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Veiksmai**:

1. **Įjungti managed identity Bicep faile:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Suteikti prieigą prie Storage:**

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

3. **Atnaujinti programos kodą:**

**Prieš (prisijungimo eilutė):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Po (managed identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Atnaujinti aplinkos kintamuosius:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Diegti ir testuoti:**

```bash
# Iš naujo įdiegti
azd up

# Patikrinkite, ar tai vis dar veikia
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Sėkmės kriterijai:**
- ✅ Programa diegiama be klaidų
- ✅ Storage operacijos veikia (įkelti, sąrašyti, parsisiųsti)
- ✅ Nėra prisijungimo eilučių aplinkos kintamuosiuose
- ✅ Identitetas matomas Azure Portal skiltyje "Identity"

**Patvirtinimas:**

```bash
# Patikrinkite, ar valdoma tapatybė įjungta
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Tikimasi: "SystemAssigned"

# Patikrinkite rolės priskyrimą
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Tikimasi: Rodo "Storage Blob Data Contributor" rolę
```

**Laikas**: 20-30 minučių

---

### Užduotis 2: Prieiga kelioms paslaugoms naudojant vartotojo priskirtą identitetą ⭐⭐⭐ (Pažengusi)

**Tikslas**: Sukurti vartotojo priskirtą identitetą, bendrinamą keliems Container Apps

**Scenarijus**: Turite 3 mikroservisus, kuriems visiems reikia prieigos prie to paties Storage paskyros ir Key Vault.

**Veiksmai**:

1. **Sukurti vartotojo priskirtą identitetą:**

**Failas: `infra/core/identity.bicep`**

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

2. **Priskirti vaidmenis vartotojo priskirtam identitetui:**

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

3. **Priskirti identitetą keliems Container Apps:**

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

4. **Programos kodas (visi servisai naudoja tą patį modelį):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Vartotojo priskirtai tapatybei nurodykite kliento ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // Vartotojo priskirtos tapatybės kliento ID
);

// Arba naudokite DefaultAzureCredential (automatiškai aptinka)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Diegti ir patikrinti:**

```bash
azd up

# Patikrinti, ar visos paslaugos gali pasiekti saugyklą
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Sėkmės kriterijai:**
- ✅ Vienas identitetas bendrinamas tarp 3 paslaugų
- ✅ Visos paslaugos gali pasiekti Storage ir Key Vault
- ✅ Identitetas išlieka, jei ištrinsite vieną paslaugą
- ✅ Centralizuotas leidimų valdymas

**Vartotojo priskirto identiteto privalumai:**
- Vienas identitetas valdymui
- Nuoseklūs leidimai tarp paslaugų
- Išlieka po paslaugos ištrynimo
- Geriau tinka sudėtingoms architektūroms

**Laikas**: 30-40 minučių

---

### Užduotis 3: Įdiegti Key Vault slaptumų sukimą ⭐⭐⭐ (Pažengusi)

**Tikslas**: Saugykite trečiųjų šalių API raktus Key Vault ir pasiekite juos naudodami managed identity

**Scenarijus**: Jūsų programa turi skambinti išoriniam API (OpenAI, Stripe, SendGrid), kuriam reikalingi API raktai.

**Veiksmai**:

1. **Sukurti Key Vault su RBAC:**

**Failas: `infra/core/keyvault.bicep`**

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

2. **Įrašyti slaptumus į Key Vault:**

```bash
# Gauti Key Vault pavadinimą
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Laikyti trečiųjų šalių API raktus
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

3. **Programos kodas slaptumams gauti:**

**Failas: `src/config.js`**

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
    // Pirmiausia patikrinkite talpyklą
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

4. **Naudoti slaptumus programoje:**

**Failas: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inicializuoti OpenAI naudojant raktą iš Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Iškviesti paleidimo metu
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

5. **Diegti ir testuoti:**

```bash
azd up

# Patikrinkite, ar API raktai veikia
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Sėkmės kriterijai:**
- ✅ Nėra API raktų kode ar aplinkos kintamuosiuose
- ✅ Programa gauna raktus iš Key Vault
- ✅ Trečiųjų šalių API veikia tinkamai
- ✅ Galima sukti raktus be kodo pakeitimų

**Sukite slaptumą:**

```bash
# Atnaujinti slaptą reikšmę Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Perkrauti programą, kad ji paimtų naują raktą
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Laikas**: 25-35 minučių

---

## Žinių patikra

### 1. Autentifikavimo modeliai ✓

Patikrinkite savo supratimą:

- [ ] **K1**: Kokie yra trys pagrindiniai autentifikavimo modeliai? 
  - **A**: Prisijungimo eilutės (legacy), Key Vault nuorodos (perėjimas), Managed Identity (geriausia)

- [ ] **K2**: Kodėl managed identity geresnė už prisijungimo eilutes?
  - **A**: Nėra slaptumų kode, automatinis sukimasis, pilnas audito žurnalas, leidimai pagal RBAC

- [ ] **K3**: Kada naudotumėte vartotojo priskirtą identitetą vietoje sistemos priskirto?
  - **A**: Kai reikia bendrinti identitetą tarp kelių resursų arba kai identiteto gyvavimo ciklas nepriklauso nuo resurso gyvavimo ciklo

**Praktinis patvirtinimas:**
```bash
# Patikrinkite, kokio tipo identitetą naudoja jūsų programa
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Išvardinkite visus vaidmenų priskyrimus šiam identitetui
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC ir leidimai ✓

Patikrinkite savo supratimą:

- [ ] **K1**: Koks yra vaidmens "Storage Blob Data Contributor" ID?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **K2**: Kokias teises suteikia "Key Vault Secrets User"?
  - **A**: Tik skaitymo prieiga prie slaptumų (negali kurti, atnaujinti ar trinti)

- [ ] **K3**: Kaip suteikti Container App prieigą prie Azure SQL?
  - **A**: Priskirti vaidmenį "SQL DB Contributor" arba sukonfigūruoti Azure AD autentifikavimą SQL

**Praktinis patvirtinimas:**
```bash
# Raskite konkretų vaidmenį
az role definition list --name "Storage Blob Data Contributor"

# Patikrinkite, kokie vaidmenys priskirti jūsų tapatybei
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault integracija ✓

Test your understanding:
- [ ] **Q1**: Kaip įjungti RBAC Key Vault vietoje prieigos politikų?
  - **A**: Set `enableRbacAuthorization: true` in Bicep

- [ ] **Q2**: Kokia Azure SDK biblioteka tvarko valdomos tapatybės autentifikavimą?
  - **A**: `@azure/identity` with `DefaultAzureCredential` class

- [ ] **Q3**: Kiek laiko Key Vault slaptiniai lieka talpykloje?
  - **A**: Priklauso nuo programos; įgyvendinkite savo talpyklos strategiją

**Hands-On Verification:**
```bash
# Išbandyti Key Vault prieigą
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Patikrinti, ar RBAC įjungtas
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Tikėtinas rezultatas: true
```

---

## Geriausios saugumo praktikos

### ✅ DARYKITE:

1. **Visada naudokite valdomą tapatybę produkcijoje**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Naudokite mažiausiai privilegijuotus RBAC vaidmenis**
   - Naudokite "Reader" vaidmenis, kai įmanoma
   - Venkite "Owner" arba "Contributor", nebent būtina

3. **Laikykite trečiųjų šalių raktus Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Įjunkite audito žurnalavimą**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Naudokite skirtingas tapatybes dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Reguliariai keiskite slaptinius**
   - Nustatykite galiojimo datas Key Vault slaptiniams
   - Automatizuokite keitimą su Azure Functions

### ❌ NEDARYKITE:

1. **Niekada neįterpkite slaptinių tiesiogiai į kodą**
   ```javascript
   // ❌ BLOGAI
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Nenaudokite prisijungimo eilučių produkcijoje**
   ```javascript
   // ❌ BLOGAI
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Neskirkite perteklinių teisių**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Nerašykite slaptinių į žurnalus**
   ```javascript
   // ❌ BLOGAI
   console.log('API Key:', apiKey);
   
   // ✅ GERAI
   console.log('API Key retrieved successfully');
   ```

5. **Nedalinkite gamybinių tapatybių tarp aplinkų**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Trikčių šalinimo vadovas

### Problema: "Unauthorized" prisijungiant prie Azure Storage

**Simptomai:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnozė:**

```bash
# Patikrinkite, ar įjungta valdomoji tapatybė
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Tikėtina: "SystemAssigned" arba "UserAssigned"

# Patikrinkite vaidmenų priskyrimus
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Tikėtina: turėtumėte matyti "Storage Blob Data Contributor" arba panašų vaidmenį
```

**Sprendimai:**

1. **Priskirkite tinkamą RBAC vaidmenį:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Palaukite propagavimą (gali užtrukti 5-10 minučių):**
```bash
# Patikrinti vaidmens priskyrimo būseną
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Patikrinkite, ar programos kodas naudoja teisingus kredencialus:**
```javascript
// Įsitikinkite, kad naudojate DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problema: Prieiga prie Key Vault atmesta

**Simptomai:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnozė:**

```bash
# Patikrinti, ar Key Vault RBAC yra įjungtas
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Laukiama reikšmė: true

# Patikrinti vaidmenų priskyrimus
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Sprendimai:**

1. **Įjunkite RBAC Key Vault'e:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Priskirkite Key Vault Secrets User vaidmenį:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problema: DefaultAzureCredential neveikia lokaliai

**Simptomai:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnozė:**

```bash
# Patikrinkite, ar prisijungėte
az account show

# Patikrinkite Azure CLI autentifikaciją
az ad signed-in-user show
```

**Sprendimai:**

1. **Prisijunkite prie Azure CLI:**
```bash
az login
```

2. **Nustatykite Azure prenumeratą:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Vietiniam vystymui naudokite aplinkos kintamuosius:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Arba lokaliai naudokite kitą kredencialą:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Naudokite AzureCliCredential vietiniam vystymui
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problema: Vaidmens priskyrimo propagacija užtrunka per ilgai

**Simptomai:**
- Vaidmuo priskirtas sėkmingai
- Vis tiek gaunami 403 klaidos
- Pertraukiama prieiga (kartais veikia, kartais ne)

**Paaiškinimas:**
Azure RBAC pakeitimams gali prireikti 5-10 minučių, kol jie išsiskleis visame pasaulyje.

**Sprendimas:**

```bash
# Palaukite ir pabandykite dar kartą
echo "Waiting for RBAC propagation..."
sleep 300  # Palaukite 5 minučių

# Patikrinkite prieigą
curl https://myapp.azurecontainerapps.io/upload

# Jei vis tiek nepavyksta, paleiskite programą iš naujo
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Sąnaudų aspektai

### Valdomos tapatybės sąnaudos

| Resource | Cost |
|----------|------|
| **Valdoma tapatybė** | 🆓 **NEMOKAMAI** - Nėra mokesčio |
| **RBAC vaidmenų priskyrimai** | 🆓 **NEMOKAMAI** - Nėra mokesčio |
| **Azure AD tokenų užklausos** | 🆓 **NEMOKAMAI** - Įskaičiuota |
| **Key Vault operacijos** | $0.03 per 10,000 operacijų |
| **Key Vault saugykla** | $0.024 už slaptinį per mėnesį |

**Valdoma tapatybė taupo pinigus, nes:**
- ✅ Pašalina poreikį naudoti Key Vault tarnybų tarpusavio autentifikacijai
- ✅ Mažina saugumo incidentus (nebėra nutekėjusių kredencialų)
- ✅ Sumažina operatyvinį krūvį (nėra rankinio keitimo)

**Pavyzdinis sąnaudų palyginimas (mėnesinis):**

| Scenario | Connection Strings | Managed Identity | Savings |
|----------|-------------------|-----------------|---------|
| Maža programa (1M requests) | ~$50 (Key Vault + operacijos) | ~$0 | $50/mėn |
| Vidutinė programa (10M requests) | ~$200 | ~$0 | $200/mėn |
| Didelė programa (100M requests) | ~$1,500 | ~$0 | $1,500/mėn |

---

## Sužinokite daugiau

### Oficialioji dokumentacija
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK dokumentacija
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Tolimesni veiksmai šiame kurse
- ← Ankstesnis: [Konfigūracijos valdymas](configuration.md)
- → Kitas: [Pirmasis projektas](first-project.md)
- 🏠 [Kurso pradžia](../../README.md)

### Susiję pavyzdžiai
- [Azure OpenAI Chat Example](../../../../examples/azure-openai-chat) - Naudoja valdomą tapatybę Azure OpenAI
- [Microservices Example](../../../../examples/microservices) - Autentifikacijos modeliai kelioms paslaugoms

---

## Santrauka

**Jūs sužinojote:**
- ✅ Trys autentifikacijos modeliai (prisijungimo eilutės, Key Vault, valdoma tapatybė)
- ✅ Kaip įjungti ir sukonfigūruoti valdomą tapatybę AZD
- ✅ RBAC vaidmenų priskyrimai Azure paslaugoms
- ✅ Key Vault integracija trečiųjų šalių slaptiniams
- ✅ Vartotojo priskirtos ir sistemos priskirtos tapatybės
- ✅ Saugumo geriausios praktikos ir trikčių šalinimas

**Pagrindinės išvados:**
1. **Visada naudokite valdomą tapatybę produkcijoje** - Nėra slaptinių, automatinis jų keitimas
2. **Naudokite mažiausiai privilegijuotus RBAC vaidmenis** - Suteikite tik būtinas teises
3. **Laikykite trečiųjų šalių raktus Key Vault** - Centralizuotas slaptinių valdymas
4. **Atskirkite tapatybes pagal aplinkas** - Dev, staging, prod izoliacija
5. **Įjunkite audito žurnalavimą** - Sekite, kas ką pasiekė

**Tolimesni žingsniai:**
1. Atlikite aukščiau esančias praktines užduotis
2. Perkelkite esamą programą nuo prisijungimo eilutės prie valdomos tapatybės
3. Sukurkite savo pirmą AZD projektą su saugumu nuo pat pradžių: [Pirmasis projektas](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama kreiptis į profesionalų vertėją. Mes neatsakome už jokius dėl šio vertimo naudojimo kilusius nesusipratimus ar neteisingus aiškinimus.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
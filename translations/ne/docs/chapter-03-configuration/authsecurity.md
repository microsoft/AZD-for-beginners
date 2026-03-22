# प्रमाणीकरण ढाँचाहरू र प्रबन्धित पहिचान

⏱️ **अनुमानित समय**: 45-60 मिनेट | 💰 **लागत प्रभाव**: निःशुल्क (थप कुनै शुल्क लाग्दैन) | ⭐ **जटिलता**: मध्यम

**📚 सिकाइ मार्ग:**
- ← अघिल्लो: [कन्फिगरेसन व्यवस्थापन](configuration.md) - वातावरण चर र गोप्यहरू व्यवस्थापन
- 🎯 **तपाईं यहाँ हुनुहुन्छ**: प्रमाणीकरण र सुरक्षा (प्रबन्धित पहिचान, Key Vault, सुरक्षा ढाँचाहरू)
- → अर्को: [पहिलो परियोजना](first-project.md) - तपाईंको पहिलो AZD अनुप्रयोग बनाउनुहोस्
- 🏠 [पाठ्यक्रम गृहपृष्ठ](../../README.md)

---

## तपाईंले के सिक्नुहुनेछ

यस पाठ पूरा गरेपछि, तपाईंले:
- Azure प्रमाणीकरण ढाँचाहरू बुझ्ने (कुञ्जीहरू, कनेक्शन स्ट्रिङहरू, प्रबन्धित पहिचान)
- पासवर्डरहित प्रमाणीकरणका लागि प्रबन्धित पहिचान लागू गर्ने
- Azure Key Vault एकीकरणमार्फत गोप्यहरू सुरक्षित गर्ने
- AZD परिनियोजनका लागि रोल-आधारित प्रवेश नियन्त्रण (RBAC) कन्फिगर गर्ने
- Container Apps र Azure सेवाहरूमा सुरक्षा उत्तम अभ्यासहरू लागू गर्ने
- कुञ्जी-आधारितबाट पहिचान-आधारित प्रमाणीकरणमा माइग्रेट गर्ने

## किन प्रबन्धित पहिचान महत्वपूर्ण छ

### समस्या: परम्परागत प्रमाणीकरण

**प्रबन्धित पहिचान भन्दा पहिले:**
```javascript
// ❌ सुरक्षा जोखिम: कोडमा हार्डकोड गरिएका गोप्य जानकारीहरू
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**समस्याहरू:**
- 🔴 **कोड, कन्फिग फाइलहरू, वातावरण चरहरूमा प्रकट भएका गोप्यहरू**
- 🔴 **प्रमाण-पत्र रोटेसन** ले कोड परिवर्तन र पुनःपरिनियोजन आवश्यक पार्छ
- 🔴 **अडिट दुःस्वप्न** - कसले कहिले के पहुँच गर्यो?
- 🔴 **फैलिएको अवस्था (sprawl)** - गोप्यहरू धेरै प्रणालीहरूमा छरिएका
- 🔴 **अनुपालन जोखिमहरू** - सुरक्षा अडिटमा असफल हुन सक्छ

### समाधान: प्रबन्धित पहिचान

**प्रबन्धित पहिचान पछि:**
```javascript
// ✅ सुरक्षित: कोडमा कुनै गोप्य जानकारी छैन
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure ले प्रमाणिकरण स्वचालित रूपमा व्यवस्थापन गर्छ
);
```

**फाइदाहरू:**
- ✅ **कोड वा कन्फिगमा शून्य गोप्यहरू**
- ✅ **स्वचालित घुमाइ (rotation)** - Azure ले यसलाई व्यवस्थापन गर्छ
- ✅ **पूर्ण अडिट ट्रेल** Azure AD लगहरूमा
- ✅ **केन्द्रित सुरक्षा** - Azure Portal मा व्यवस्थापन
- ✅ **अनुपालन तयार** - सुरक्षा मापदण्डहरू पूरा गर्छ

**उदाहरण**: परम्परागत प्रमाणीकरण विभिन्न ढोकाहरूको लागि धेरै भौतिक कुन्जीहरू बोक्नु जस्तै हो। प्रबन्धित पहिचान भनेको त्यस्तो सुरक्षा बिल्ला जस्तै हो जुन तपाईं को हुनुहुन्छ भन्ने आधारमा स्वचालित रूपमा पहुँच दिन्छ—कुनै कुन्जी हराउन, नक्कल गर्न, वा घुमाउनुपर्ने छैन।

---

## वास्तुकला अवलोकन

### प्रबन्धित पहिचानसहित प्रमाणीकरण प्रवाह

```mermaid
sequenceDiagram
    participant App as तपाईंको अनुप्रयोग<br/>(कन्टेनर अनुप्रयोग)
    participant MI as प्रबन्धित पहिचान<br/>(Azure AD)
    participant KV as कुञ्जी भण्डार
    participant Storage as Azure भण्डारण
    participant DB as Azure SQL
    
    App->>MI: प्रवेश टोकन अनुरोध<br/>(स्वचालित)
    MI->>MI: पहिचान जाँच गर्नुहोस्<br/>(पासवर्ड आवश्यक छैन)
    MI-->>App: टोकन फर्काउनुहोस्<br/>(१ घण्टा मान्य)
    
    App->>KV: गोप्य मान प्राप्त गर्नुहोस्<br/>(टोकन प्रयोग गरी)
    KV->>KV: RBAC अनुमतिहरू जाँच गर्नुहोस्
    KV-->>App: गोप्य मान फर्काउनुहोस्
    
    App->>Storage: ब्लब अपलोड गर्नुहोस्<br/>(टोकन प्रयोग गरी)
    Storage->>Storage: RBAC अनुमतिहरू जाँच गर्नुहोस्
    Storage-->>App: सफलता
    
    App->>DB: डेटा क्वेरी गर्नुहोस्<br/>(टोकन प्रयोग गरी)
    DB->>DB: SQL अनुमतिहरू जाँच गर्नुहोस्
    DB-->>App: नतिजा फर्काउनुहोस्
    
    Note over App,DB: सबै प्रमाणीकरण पासवर्डरहित!
```
### प्रबन्धित पहिचानका प्रकारहरू

```mermaid
graph TB
    MI[प्रबन्धित पहिचान]
    SystemAssigned[प्रणाली-नियुक्त पहिचान]
    UserAssigned[प्रयोगकर्ता-नियुक्त पहिचान]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[संसाधनसँग सम्बन्धित जीवनचक्र]
    SystemAssigned --> SA2[स्वचालित सिर्जना/हटाइ]
    SystemAssigned --> SA3[एकल संसाधनका लागि उपयुक्त]
    
    UserAssigned --> UA1[स्वतन्त्र जीवनचक्र]
    UserAssigned --> UA2[हातैले सिर्जना/हटाइ]
    UserAssigned --> UA3[संसाधनहरूमा साझा]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| विशेषता | सिस्टम-आधारित | प्रयोगकर्ता-आधारित |
|---------|----------------|---------------|
| **जीवन चक्र** | स्रोतसँग सम्बन्धित | स्वतन्त्र |
| **सिर्जना** | स्रोतसँग स्वतः | म्यानुअल सिर्जना |
| **मेटिने** | स्रोत मेट्दा मेटिन्छ | स्रोत मेटिएपछि पनि कायम रहन्छ |
| **सेयरिङ** | केवल एक स्रोत | बहु स्रोतहरू |
| **प्रयोग केस** | सरल परिदृश्यहरू | जटिल बहु-स्रोत परिदृश्यहरू |
| **AZD पूर्वनिर्धारित** | ✅ सिफारिस गरिएको | वैकल्पिक |

---

## पूर्वआवश्यकताहरू

### आवश्यक उपकरणहरू

तपाईंले यी अघिल्ला पाठहरूबाट पहिले नै स्थापना गरिसक्नुभएको हुनुपर्छ:

```bash
# Azure Developer CLI सत्यापित गर्नुहोस्
azd version
# ✅ अपेक्षित: azd संस्करण 1.0.0 वा माथिको

# Azure CLI सत्यापित गर्नुहोस्
az --version
# ✅ अपेक्षित: azure-cli 2.50.0 वा माथिको
```

### Azure आवश्यकताहरू

- सक्रिय Azure सदस्यता
- अनुमतिहरू:
  - प्रबन्धित पहिचानहरू सिर्जना गर्ने
  - RBAC रोलहरू असाइन गर्ने
  - Key Vault स्रोतहरू सिर्जना गर्ने
  - Container Apps परिनियोजन गर्ने

### पूर्व ज्ञान

तपाईंले पूरा गरिसक्नुपर्छ:
- [स्थापना मार्गदर्शक](installation.md) - AZD सेटअप
- [AZD आधारभूत](azd-basics.md) - मुख्य अवधारणाहरू
- [कन्फिगरेसन व्यवस्थापन](configuration.md) - वातावरण चर

---

## पाठ १: प्रमाणीकरण ढाँचाहरूको समझ

### ढाँचा १: कनेक्शन स्ट्रिङहरू (पुरानो - प्रयोग नगर्नुहोस्)

**यो कसरी काम गर्छ:**
```bash
# कनेक्शन स्ट्रिङमा प्रमाण-पत्रहरू समावेश छन्
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**समस्याहरू:**
- ❌ वातावरण चरहरूमा गोप्यहरू देखिन्छन्
- ❌ परिनियोजन प्रणालीहरूमा लग गरिन्छ
- ❌ घुमाउन (rotate) कठिन
- ❌ पहुँचको कुनै अडिट ट्रेल छैन

**कहिले प्रयोग गर्ने:** केवल स्थानीय विकासका लागि, कहिले पनि उत्पादनका लागि होइन।

---

### ढाँचा २: Key Vault सन्दर्भहरू (राम्रो)

**यो कसरी काम गर्छ:**
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

**फाइदाहरू:**
- ✅ गोप्यहरू Key Vault मा सुरक्षित रूपमा भण्डारण
- ✅ केन्द्रित गोप्य व्यवस्थापन
- ✅ कोड परिवर्तनबिना रोटेसन

**सीमाहरू:**
- ⚠️ अझै पनि कुञ्जी/पासवर्ड प्रयोग भइरहेको छ
- ⚠️ Key Vault पहुँच व्यवस्थापन गर्नुपर्ने

**कहिले प्रयोग गर्ने:** कनेक्शन स्ट्रिङबाट प्रबन्धित पहिचानमा जाने संक्रमण चरण।

---

### ढाँचा ३: प्रबन्धित पहिचान (उत्तम अभ्यास)

**यो कसरी काम गर्छ:**
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

**अनुप्रयोग कोड:**
```javascript
// कुनै गोप्य कुरा आवश्यक छैन!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**फाइदाहरू:**
- ✅ कोड/कन्फिगमा शून्य गोप्यहरू
- ✅ स्वचालित प्रमाण-पत्र रोटेसन
- ✅ पूर्ण अडिट ट्रेल
- ✅ RBAC-आधारित अनुमतिहरू
- ✅ अनुपालन तयार

**कहिले प्रयोग गर्ने:** सधैं, उत्पादन अनुप्रयोगहरूको लागि।

---

## पाठ २: AZD सँग प्रबन्धित पहिचान लागू गर्ने

### चरण-द्वारा-चरण कार्यान्वयन

आउनुहोस् एउटा सुरक्षित Container App बनाउँौं जसले Azure Storage र Key Vault मा पहुँच गर्न प्रबन्धित पहिचान प्रयोग गर्छ।

### परियोजना संरचना

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

### १. AZD कन्फिगर गर्नुहोस् (azure.yaml)

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

### २. पूर्वाधार: प्रबन्धित पहिचान सक्षम गर्नुहोस्

**फाइल: `infra/main.bicep`**

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

### ३. सिस्टम-आधारित पहिचान सहितको Container App

**फाइल: `infra/app/container-app.bicep`**

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

### ४. RBAC रोल असाइनमेन्ट मोड्युल

**फाइल: `infra/core/role-assignment.bicep`**

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

### ५. प्रबन्धित पहिचान सहित अनुप्रयोग कोड

**फाइल: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 क्रेडेन्सियल आरम्भ गर्नुहोस् (प्रबन्धित पहिचानसँग स्वचालित रूपमा काम गर्छ)
const credential = new DefaultAzureCredential();

// Azure Storage सेटअप
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // कुनै कुञ्जीहरू आवश्यक छैनन्!
);

// Key Vault सेटअप
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // कुनै कुञ्जीहरू आवश्यक छैनन्!
);

// स्वास्थ्य जाँच
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// फाइललाई ब्लब स्टोरेजमा अपलोड गर्नुहोस्
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

// Key Vault बाट गोप्य मान प्राप्त गर्नुहोस्
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

// ब्लब कन्टेनरहरूको सूची (पढ्ने पहुँच देखाउँछ)
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

**फाइल: `src/package.json`**

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

### ६. परिनियोजन र परीक्षण

```bash
# AZD वातावरण आरम्भ गर्नुहोस्
azd init

# पूर्वाधार र अनुप्रयोग तैनात गर्नुहोस्
azd up

# अनुप्रयोगको URL प्राप्त गर्नुहोस्
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# हेल्थ चेक परीक्षण गर्नुहोस्
curl $APP_URL/health
```

**✅ अपेक्षित आउटपुट:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**ब्लब अपलोड परीक्षण:**
```bash
curl -X POST $APP_URL/upload
```

**✅ अपेक्षित आउटपुट:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**कन्टेनर सूची परीक्षण:**
```bash
curl $APP_URL/containers
```

**✅ अपेक्षित आउटपुट:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## सामान्य Azure RBAC रोलहरू

### प्रबन्धित पहिचानका लागि बिल्ट-इन रोल ID हरू

| सेवा | रोल नाम | रोल ID | अनुमतिहरू |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | ब्लब र कन्टेनर पढ्ने |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | ब्लब पढ्ने, लेख्ने, मेट्ने |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | क्यू सन्देश पढ्ने, लेख्ने, मेट्ने |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | गोप्यहरू पढ्ने |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | गोप्यहरू पढ्ने, लेख्ने, मेटाउने |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Cosmos DB डेटा पढ्ने |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Cosmos DB डेटा पढ्ने, लेख्ने |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | SQL डाटाबेस व्यवस्थापन गर्ने |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | सन्देशहरू पठाउने, प्राप्त गर्ने, व्यवस्थापन गर्ने |

### रोल ID कसरी फेला पार्ने

```bash
# सबै पूर्वनिर्मित भूमिकाहरू सूचीबद्ध गर्नुहोस्
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# विशिष्ट भूमिका खोज्नुहोस्
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# भूमिकाको विवरण प्राप्त गर्नुहोस्
az role definition list --name "Storage Blob Data Contributor"
```

---

## व्यावहारिक अभ्यासहरू

### अभ्यास 1: अवस्थित एपका लागि प्रबन्धित पहिचान सक्षम गर्नुहोस् ⭐⭐ (मध्यम)

**लक्ष्य**: अवस्थित Container App परिनियोजनमा प्रबन्धित पहिचान थप्नुहोस्

**परिदृश्य**: तपाईंसँग कनेक्शन स्ट्रिङ प्रयोग गर्ने Container App छ। यसलाई प्रबन्धित पहिचानमा रूपान्तरण गर्नुहोस्।

**सुरुवात बिन्दु**: यस कन्फिगरेसन भएको Container App:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**चरणहरू**:

1. **Bicep मा प्रबन्धित पहिचान सक्षम गर्नुस्:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Storage पहुँच दिनुहोस्:**

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

3. **अनुप्रयोग कोड अद्यावधिक गर्नुहोस्:**

**अघिल्लो (कनेक्शन स्ट्रिङ):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**पछि (प्रबन्धित पहिचान):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **वातावरण चरहरू अद्यावधिक गर्नुहोस्:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **परिनियोजन र परीक्षण गर्नुहोस्:**

```bash
# फेरि तैनाथ गर्नुहोस्
azd up

# यो अझै काम गर्छ कि जाँच गर्नुहोस्
curl https://myapp.azurecontainerapps.io/upload
```

**✅ सफलता मापदण्ड:**
- ✅ अनुप्रयोग त्रुटिबिना परिनियोजन हुन्छ
- ✅ Storage अपरेसनहरू काम गर्छन् (अपलोड, सूची, डाउनलोड)
- ✅ वातावरण चरहरूमा कुनै कनेक्शन स्ट्रिङ छैन
- ✅ Azure Portal मा "Identity" ब्लेड अन्तर्गत पहिचान देखिन्छ

**पुष्टिकरण:**

```bash
# प्रबन्धित पहिचान सक्षम छ कि छैन जाँच गर्नुहोस्
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ अपेक्षित: "SystemAssigned"

# भूमिका नियुक्ति जाँच गर्नुहोस्
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ अपेक्षित: "Storage Blob Data Contributor" भूमिका देखाउँछ
```

**समय**: 20-30 मिनेट

---

### अभ्यास 2: प्रयोगकर्ता-आधारित पहिचानसँग बहु-सेवा पहुँच ⭐⭐⭐ (उन्नत)

**लक्ष्य**: धेरै Container Apps मा साझा हुने प्रयोगकर्ता-आधारित पहिचान सिर्जना गर्नुहोस्

**परिदृश्य**: तपाईंसँग 3 माइक्रोसेवाहरू छन् जसलाई सबैलाई एउटै Storage खाता र Key Vault मा पहुँच आवश्यक छ।

**चरणहरू**:

1. **प्रयोगकर्ता-आधारित पहिचान सिर्जना गर्नुहोस्:**

**फाइल: `infra/core/identity.bicep`**

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

2. **प्रयोगकर्ता-आधारित पहिचानलाई रोलहरू असाइन गर्नुहोस्:**

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

3. **पहिचानलाई बहु Container Apps मा असाइन गर्नुहोस्:**

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

4. **अनुप्रयोग कोड (सबै सेवाहरू एउटै ढाँचामा प्रयोग गर्छन्):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// प्रयोगकर्ता-आवंटित पहिचानको लागि क्लाइएन्ट ID निर्दिष्ट गर्नुहोस्
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // प्रयोगकर्ता-आवंटित पहिचान क्लाइएन्ट ID
);

// वा DefaultAzureCredential प्रयोग गर्नुहोस् (स्वतः पत्ता लगाउँछ)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **परिनियोजन र पुष्टि गर्नुहोस्:**

```bash
azd up

# सबै सेवाहरूले भण्डारणमा पहुँच पाउन सक्छन् कि छैनन् जाँच गर्नुहोस्
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ सफलता मापदण्ड:**
- ✅ ३ सेवामा साझा गरिएको एउटै पहिचान
- ✅ सबै सेवाहरूले Storage र Key Vault मा पहुँच गर्न सक्छन्
- ✅ कुनै सेवा मेटाएपनि पहिचान कायम रहन्छ
- ✅ केन्द्रीयकृत अनुमति व्यवस्थापन

**प्रयोगकर्ता-आधारित पहिचानका फाइदाहरू:**
- एकल पहिचान व्यवस्थापनका लागि
- सेवाहरूमा समान अनुमति
- सेवा मेटाइँदा पनि टिकिरहन्छ
- जटिल वास्तुकलाका लागि राम्रो

**समय**: 30-40 मिनेट

---

### अभ्यास 3: Key Vault गोप्य रोटेसन कार्यान्वयन गर्नुहोस् ⭐⭐⭐ (उन्नत)

**लक्ष्य**: तेस्रो-पक्ष API कुञ्जीहरू Key Vault मा भण्डारण गर्नुहोस् र प्रबन्धित पहिचान प्रयोग गरी तिनीहरूमा पहुँच गर्नुहोस्

**परिदृश्य**: तपाईंको अनुप्रयोगले OpenAI, Stripe, SendGrid जस्ता बाह्य API कल गर्नुपर्नेछ जसलाई API कुञ्जीहरू आवश्यक हुन्छ।

**चरणहरू**:

1. **RBAC सहित Key Vault सिर्जना गर्नुहोस्:**

**फाइल: `infra/core/keyvault.bicep`**

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

2. **गोप्यहरू Key Vault मा भण्डारण गर्नुहोस्:**

```bash
# Key Vault नाम प्राप्त गर्नुहोस्
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# तेस्रो-पक्ष API कुञ्जीहरू भण्डारण गर्नुहोस्
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

3. **गोप्यहरू प्राप्त गर्न अनुप्रयोग कोड:**

**फाइल: `src/config.js`**

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
    // पहिले क्याच जाँच गर्नुहोस्
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

4. **अनुप्रयोगमा गोप्यहरू प्रयोग गर्नुहोस्:**

**फाइल: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// OpenAI लाई Key Vault बाट प्राप्त कुञ्जी प्रयोग गरेर आरम्भ गर्नुहोस्
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// स्टार्टअपमा कल गर्नुहोस्
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

5. **परिनियोजन र परीक्षण गर्नुहोस्:**

```bash
azd up

# API कुञ्जीहरू ठीकसँग काम गर्छन् कि भनेर परीक्षण गर्नुहोस्
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ सफलता मापदण्ड:**
- ✅ कोड वा वातावरण चरहरूमा कुनै API कुञ्जी छैन
- ✅ अनुप्रयोगले Key Vault बाट कुञ्जीहरू प्राप्त गर्छ
- ✅ तेस्रो-पक्ष APIs सही रूपमा काम गर्छन्
- ✅ कोड परिवर्तनबिना कुञ्जीहरू घुमाउन (rotate) सकिन्छ

**गोप्य रोटेट गर्ने:**

```bash
# Key Vault मा गोप्य जानकारी अपडेट गर्नुहोस्
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# नयाँ कुञ्जी लागू गर्न एप पुनः सुरु गर्नुहोस्
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**समय**: 25-35 मिनेट

---

## ज्ञान जाँच बिन्दु

### १. प्रमाणीकरण ढाँचाहरू ✓

आफ्नो समझ परीक्षण गर्नुहोस्:

- [ ] **Q1**: मुख्य तीन प्रमाणीकरण ढाँचाहरू के-के हुन्? 
  - **A**: कनेक्शन स्ट्रिङहरू (पुरानो), Key Vault सन्दर्भहरू (संक्रमण), प्रबन्धित पहिचान (उत्तम)

- [ ] **Q2**: प्रबन्धित पहिचान किन्न राम्रो छ कनेक्शन स्ट्रिङ भन्दा?
  - **A**: कोडमा कुनै गोप्य छैनन्, स्वचालित रोटेसन, पूर्ण अडिट ट्रेल, RBAC अनुमतिहरू

- [ ] **Q3**: प्रणाली-आधारितको सट्टा प्रयोगकर्ता-आधारित पहिचान कहिले प्रयोग गर्नुहुन्छ?
  - **A**: धेरै स्रोतहरूमा पहिचान साझा गर्दा वा पहिचानको जीवन चक्र स्रोतको जीवन चक्रदेखि स्वतन्त्र हुँदा

**प्रायोगिक पुष्टिकरण:**
```bash
# तपाईंको एपले कुन प्रकारको पहिचान प्रयोग गर्छ भनेर जाँच गर्नुहोस्
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# पहिचानका लागि सबै भूमिका नियुक्तिहरू सूचीबद्ध गर्नुहोस्
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### २. RBAC र अनुमति ✓

आफ्नो समझ परीक्षण गर्नुहोस्:

- [ ] **Q1**: 'Storage Blob Data Contributor' को रोल ID के हो?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: 'Key Vault Secrets User' ले कस्ता अनुमति प्रदान गर्छ?
  - **A**: गोप्यहरूमा पढ्न मात्र पहुँच (सिर्जना, अद्यावधिक, वा मेटाउन सक्दैन)

- [ ] **Q3**: Container App लाई Azure SQL पहुँच कसरी दिनुहुन्छ?
  - **A**: 'SQL DB Contributor' रोल असाइन गर्नुहोस् वा SQL का लागि Azure AD प्रमाणीकरण कन्फिगर गर्नुहोस्

**प्रायोगिक पुष्टिकरण:**
```bash
# विशिष्ट भूमिका खोज्नुहोस्
az role definition list --name "Storage Blob Data Contributor"

# तपाईंको पहिचानमा कुन-कुन भूमिका तोकिएका छन् जाँच गर्नुहोस्
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### ३. Key Vault एकीकरण ✓

आफ्नो समझ परीक्षण गर्नुहोस्:
- [ ] **Q1**: Key Vault का लागि access policies को सट्टा RBAC कसरी सक्षम गर्नुहुन्छ?
  - **A**: Bicep मा `enableRbacAuthorization: true` सेट गर्नुहोस्

- [ ] **Q2**: कुन Azure SDK लाइब्रेरीले managed identity authentication सम्हाल्छ?
  - **A**: `@azure/identity` र `DefaultAzureCredential` class

- [ ] **Q3**: Key Vault का secrets कति समयसम्म cache मा रहन्छन्?
  - **A**: अनुप्रयोग-निर्भर; आफ्नै क्याचिङ रणनीति लागू गर्नुहोस्

**व्यावहारिक जाँच:**
```bash
# Key Vault पहुँच परीक्षण
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# जाँच गर्नुहोस् कि RBAC सक्षम छ
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ अपेक्षित: साँचो
```

---

## सुरक्षा उत्तम अभ्यासहरू

### ✅ गर्नुहोस्:

1. **सधैं उत्पादनमा managed identity प्रयोग गर्नुहोस्**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **न्यूनतम-प्रिविलेज RBAC भूमिका प्रयोग गर्नुहोस्**
   - सकेसम्म "Reader" भूमिकाहरू प्रयोग गर्नुहोस्
   - "Owner" वा "Contributor" आवश्यक नभएसम्म प्रयोग नगर्नुहोस्

3. **तेस्रो-पक्षका कुञ्जीहरू Key Vault मा भण्डारण गर्नुहोस्**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **अडिट लगिङ सक्षम गर्नुहोस्**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **dev/staging/prod का लागि फरक identities प्रयोग गर्नुहोस्**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Secrets नियमित रूपमा रोटेट गर्नुहोस्**
   - Key Vault secrets मा समाप्ति मिति सेट गर्नुहोस्
   - Azure Functions सँग रोटेशन स्वचालित गर्नुहोस्

### ❌ नगर्नुहोस्:

1. **कहिल्यै secrets हार्डकोड नगर्नुहोस्**
   ```javascript
   // ❌ खराब
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **उत्पादनमा connection strings प्रयोग नगर्नुहोस्**
   ```javascript
   // ❌ नराम्रो
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **अत्याधिक अनुमतिहरू नदिनुहोस्**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Secrets लाई लग नगर्नुहोस्**
   ```javascript
   // ❌ नराम्रो
   console.log('API Key:', apiKey);
   
   // ✅ राम्रो
   console.log('API Key retrieved successfully');
   ```

5. **प्रोडक्शन identities लाई विभिन्न वातावरणहरूमा साझा नगर्नुहोस्**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## समस्या समाधान मार्गदर्शिका

### समस्या: Azure Storage पहुँच गर्दा "Unauthorized"

**लक्षणहरू:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**निदान:**

```bash
# प्रबन्धित आइडेन्टिटी सक्षम छ कि छैन जाँच गर्नुहोस्
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ अपेक्षित: "SystemAssigned" वा "UserAssigned"

# भूमिका असाइनमेन्टहरू जाँच गर्नुहोस्
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# अपेक्षित: तपाईंले "Storage Blob Data Contributor" वा समान भूमिका देख्नुपर्छ
```

**समाधानहरू:**

1. **सही RBAC भूमिका दिनुहोस्:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **प्रसारणको लागि पर्खनुहोस् (5-10 मिनेट लाग्न सक्छ):**
```bash
# भूमिकाको आबंटन स्थिति जाँच्नुहोस्
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **अनुप्रयोग कोडले सही क्रेडेन्सियल प्रयोग गरिरहेको छ कि छैन जाँच्नुहोस्:**
```javascript
// पक्का गर्नुहोस् कि तपाईं DefaultAzureCredential प्रयोग गर्दै हुनुहुन्छ
const credential = new DefaultAzureCredential();
```

---

### समस्या: Key Vault पहुँच अस्वीकृत

**लक्षणहरू:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**निदान:**

```bash
# Key Vault को RBAC सक्षम छ कि छैन जाँच गर्नुहोस्
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ अपेक्षित: true

# भूमिका नियुक्तिहरू जाँच गर्नुहोस्
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**समाधानहरू:**

1. **Key Vault मा RBAC सक्षम गर्नुहोस्:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Key Vault Secrets User भूमिका दिनुहोस्:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### समस्या: DefaultAzureCredential स्थानीय रूपमा असफल हुन्छ

**लक्षणहरू:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**निदान:**

```bash
# तपाईंले लग इन गर्नुभएको छ कि छैन जाँच गर्नुहोस्
az account show

# Azure CLI को प्रमाणीकरण जाँच गर्नुहोस्
az ad signed-in-user show
```

**समाधानहरू:**

1. **Azure CLI मा लगइन गर्नुहोस्:**
```bash
az login
```

2. **Azure subscription सेट गर्नुहोस्:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **स्थानीय विकासका लागि, environment variables प्रयोग गर्नुहोस्:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **वा स्थानीय रूपमा फरक क्रेडेन्सियल प्रयोग गर्नुहोस्:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// स्थानीय विकासका लागि AzureCliCredential प्रयोग गर्नुहोस्
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### समस्या: Role assignment प्रसारण हुन धेरै समय लिन्छ

**लक्षणहरू:**
- भूमिका सफलतापूर्वक तोकियो
- अझै 403 त्रुटिहरू आइरहेका छन्
- अनियमित पहुँच (कतिपय बेला काम गर्छ, कतिपय बेला गर्दैन)

**व्याख्या:**
Azure RBAC परिवर्तनहरूलाई विश्वव्यापी रूपमा प्रसारित हुन 5-10 मिनेट लाग्न सक्छ।

**समाधान:**

```bash
# पर्खनुहोस् र फेरि प्रयास गर्नुहोस्
echo "Waiting for RBAC propagation..."
sleep 300  # 5 मिनेट पर्खनुहोस्

# पहुँच जाँच गर्नुहोस्
curl https://myapp.azurecontainerapps.io/upload

# यदि अझै विफल भएमा, एप पुनः सुरु गर्नुहोस्
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## लागत विचारहरू

### Managed Identity लागत

| स्रोत | लागत |
|----------|------|
| **Managed Identity** | 🆓 **निशुल्क** - कुनै चार्ज छैन |
| **RBAC Role Assignments** | 🆓 **निशुल्क** - कुनै चार्ज छैन |
| **Azure AD Token Requests** | 🆓 **निशुल्क** - समावेश |
| **Key Vault Operations** | $0.03 प्रति 10,000 अपरेसनहरू |
| **Key Vault Storage** | $0.024 प्रति secret प्रति महिना |

**Managed identity ले पैसा बचत गर्छ किनभने:**
- ✅ सेवा-देखि-सेवा प्रमाणीकरणका लागि Key Vault अपरेसनहरू हटाउने
- ✅ सुरक्षा घटनाहरू घटाउँछ (कुनै लीक भएका क्रेडेन्सियलहरू हुँदैनन्)
- ✅ सञ्चालन सम्बन्धी ओभरहेड घट्छ (म्यानुअल रोटेशन हुँदैन)

**उदाहरण लागत तुलना (मासिक):**

| परिदृश्य | Connection Strings | Managed Identity | बचत |
|----------|-------------------|-----------------|---------|
| सानो एप (1M अनुरोध) | ~$50 (Key Vault + ops) | ~$0 | $50/महिना |
| मझौला एप (10M अनुरोध) | ~$200 | ~$0 | $200/महिना |
| ठूलो एप (100M अनुरोध) | ~$1,500 | ~$0 | $1,500/महिना |

---

## थप जान्नुहोस्

### आधिकारिक दस्तावेजहरू
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK Documentation
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### यस कोर्सका अर्को चरणहरू
- ← अघिल्लो: [Configuration Management](configuration.md)
- → अर्को: [First Project](first-project.md)
- 🏠 [कोर्स गृहपृष्ठ](../../README.md)

### सम्बन्धित उदाहरणहरू
- [Microsoft Foundry Models Chat Example](../../../../examples/azure-openai-chat) - Microsoft Foundry Models का लागि managed identity प्रयोग गर्छ
- [Microservices Example](../../../../examples/microservices) - बहु-सेवा प्रमाणीकरण ढाँचाहरू

---

## सारांश

**तपाईंले सिक्नुभयो:**
- ✅ तीन प्रमाणीकरण ढाँचाहरू (connection strings, Key Vault, managed identity)
- ✅ AZD मा managed identity कसरी सक्षम र कन्फिगर गर्ने
- ✅ Azure सेवाहरूका लागि RBAC भूमिका असाइनमेन्टहरू
- ✅ तेस्रो-पक्षका secrets का लागि Key Vault एकीकरण
- ✅ प्रयोगकर्ता-आवंटित बनाम प्रणाली-आवंटित पहिचानहरू
- ✅ सुरक्षा उत्तम अभ्यासहरू र समस्या समाधान

**मुख्य निस्कर्षहरू:**
1. **सधैं उत्पादनमा managed identity प्रयोग गर्नुहोस्** - गोप्य सामग्री शून्य, स्वचालित रोटेशन
2. **न्यूनतम-प्रिविलेज RBAC भूमिका प्रयोग गर्नुहोस्** - केवल आवश्यक अनुमति दिनुहोस्
3. **तेस्रो-पक्षका कुञ्जीहरू Key Vault मा राख्नुहोस्** - केन्द्रीयकृत गोप्य व्यवस्थापन
4. **प्रत्येक वातावरणका लागि पहिचान छुट्याउनुहोस्** - Dev, staging, prod अलगाव
5. **अडिट लगिङ सक्षम गर्नुहोस्** - कसले के पहुँच गर्‍यो ट्र्याक गर्नुहोस्

**अर्को कदमहरू:**
1. माथिका व्यावहारिक अभ्यासहरू पूरा गर्नुहोस्
2. एक विद्यमान एप्लिकेशनलाई connection strings बाट managed identity मा माइग्रेट गर्नुहोस्
3. पहिलो दिनदेखिनै सुरक्षा सहित आफ्नो पहिलो AZD प्रोजेक्ट निर्माण गर्नुहोस्: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। महत्त्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा व्याख्याका लागि हामी जिम्मेवार हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# प्रमाणिकरण पैटर्न और प्रबंधित पहचान

⏱️ **अनुमानित समय**: 45-60 minutes | 💰 **लागत प्रभाव**: मुफ्त (कोई अतिरिक्त शुल्क नहीं) | ⭐ **जटिलता**: मध्यम

**📚 सीखने का मार्ग:**
- ← पिछला: [कॉन्फ़िगरेशन प्रबंधन](configuration.md) - पर्यावरण चर और सीक्रेट्स का प्रबंधन
- 🎯 **आप यहाँ हैं**: प्रमाणीकरण और सुरक्षा (प्रबंधित पहचान, Key Vault, सुरक्षित पैटर्न)
- → अगला: [पहला प्रोजेक्ट](first-project.md) - अपना पहला AZD एप्लिकेशन बनाएं
- 🏠 [कोर्स होम](../../README.md)

---

## आप क्या सीखेंगे

By completing this lesson, you will:
- Azure प्रमाणीकरण पैटर्न को समझना (कीज़, कनेक्शन स्ट्रिंग्स, प्रबंधित पहचान)
- पासवर्ड-रहित प्रमाणीकरण के लिए **प्रबंधित पहचान** लागू करना
- **Azure Key Vault** एकीकरण के साथ सीक्रेट्स सुरक्षित करना
- AZD तैनातियों के लिए **भूमिका-आधारित एक्सेस नियंत्रण (RBAC)** कॉन्फ़िगर करना
- Container Apps और Azure सेवाओं में सुरक्षा के सर्वोत्तम अभ्यास लागू करना
- की-आधारित से पहचान-आधारित प्रमाणीकरण में स्थानांतरण करना

## क्यों प्रबंधित पहचान महत्वपूर्ण है

### समस्या: पारंपरिक प्रमाणीकरण

**प्रबंधित पहचान से पहले:**
```javascript
// ❌ सुरक्षा जोखिम: कोड में हार्डकोडेड रहस्य
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**समस्याएँ:**
- 🔴 **उजागर सीक्रेट्स** कोड में, कॉन्फ़िग फाइलों में, और पर्यावरण चर में
- 🔴 **क्रेडेंशियल रोटेशन** के लिए कोड बदलना और पुनः तैनाती आवश्यक है
- 🔴 **ऑडिट मुसीबतें** - किसने क्या, कब एक्सेस किया?
- 🔴 **फैलाव (Sprawl)** - सीक्रेट्स कई सिस्टमों में बिखरे हुए
- 🔴 **अनुपालन जोखिम** - सुरक्षा ऑडिट असफल

### समाधान: प्रबंधित पहचान

**प्रबंधित पहचान के बाद:**
```javascript
// ✅ सुरक्षित: कोड में कोई गुप्त जानकारी नहीं है
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure स्वचालित रूप से प्रमाणीकरण को संभालता है
);
```

**लाभ:**
- ✅ **कोड या कॉन्फ़िग में कोई सीक्रेट नहीं**
- ✅ **स्वचालित रोटेशन** - Azure इसका प्रबंध करता है
- ✅ **पूर्ण ऑडिट ट्रेल** Azure AD लॉग्स में
- ✅ **केंद्रीकृत सुरक्षा** - Azure पोर्टल में प्रबंधित करें
- ✅ **अनुपालन-तैयार** - सुरक्षा मानकों को पूरा करता है

**उपमा**: पारंपरिक प्रमाणीकरण कई दरवाजों के लिए कई भौतिक चाबियाँ लेकर चलने जैसा है। प्रबंधित पहचान ऐसा है जैसे एक सुरक्षा बैज होना जो स्वचालित रूप से आपकी पहचान के आधार पर पहुंच देता है—कोई चाबियाँ खोने, कॉपी करने, या घुमाने के लिए नहीं।

---

## वास्तुकला अवलोकन

### प्रबंधित पहचान के साथ प्रमाणीकरण प्रवाह

```mermaid
sequenceDiagram
    participant App as आपका एप्लिकेशन<br/>(कंटेनर ऐप)
    participant MI as प्रबंधित पहचान<br/>(Azure AD)
    participant KV as की वॉल्ट
    participant Storage as Azure स्टोरेज
    participant DB as Azure SQL
    
    App->>MI: एक्सेस टोकन का अनुरोध<br/>(स्वचालित)
    MI->>MI: पहचान सत्यापित करें<br/>(कोई पासवर्ड आवश्यक नहीं)
    MI-->>App: टोकन लौटाएं<br/>(मान्य 1 घंटा)
    
    App->>KV: गुप्त मान प्राप्त करें<br/>(टोकन का उपयोग करके)
    KV->>KV: RBAC अनुमतियों की जाँच
    KV-->>App: गुप्त मान लौटाएं
    
    App->>Storage: ब्लॉब अपलोड करें<br/>(टोकन का उपयोग करके)
    Storage->>Storage: RBAC अनुमतियों की जाँच
    Storage-->>App: सफलता
    
    App->>DB: डेटा क्वेरी करें<br/>(टोकन का उपयोग करके)
    DB->>DB: SQL अनुमतियों की जाँच
    DB-->>App: परिणाम लौटाएँ
    
    Note over App,DB: सभी प्रमाणीकरण बिना पासवर्ड के!
```
### प्रबंधित पहचान के प्रकार

```mermaid
graph TB
    MI[प्रबंधित पहचान]
    SystemAssigned[सिस्टम-आधारित पहचान]
    UserAssigned[उपयोगकर्ता-आधारित पहचान]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[जीवनचक्र संसाधन से जुड़ा हुआ]
    SystemAssigned --> SA2[स्वचालित निर्माण/हटाना]
    SystemAssigned --> SA3[एकल संसाधन के लिए सबसे अच्छा]
    
    UserAssigned --> UA1[स्वतंत्र जीवनचक्र]
    UserAssigned --> UA2[मैन्युअल निर्माण/हटाना]
    UserAssigned --> UA3[संसाधनों के बीच साझा]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| विशेषता | सिस्टम-आवंटित | उपयोगकर्ता-आवंटित |
|---------|----------------|---------------|
| **जीवनचक्र** | संसाधन से जुड़ा हुआ | स्वतंत्र |
| **निर्माण** | संसाधन के साथ स्वचालित | मैन्युअल निर्माण |
| **हटाना** | संसाधन के साथ मिटा दिया जाता है | संसाधन हटने के बाद भी बना रहता है |
| **साझाकरण** | केवल एक संसाधन | कई संसाधन |
| **उपयोग का मामला** | सरल परिदृश्य | जटिल बहु-संसाधन परिदृश्य |
| **AZD डिफ़ॉल्ट** | ✅ अनुशंसित | वैकल्पिक |

---

## आवश्यकताएँ

### आवश्यक उपकरण

आपके पास ये पिछले पाठों से पहले से इंस्टॉल होने चाहिए:

```bash
# Azure Developer CLI सत्यापित करें
azd version
# ✅ अपेक्षित: azd संस्करण 1.0.0 या उच्चतर

# Azure CLI सत्यापित करें
az --version
# ✅ अपेक्षित: azure-cli 2.50.0 या उच्चतर
```

### Azure आवश्यकताएँ

- सक्रिय Azure सदस्यता
- अनुमतियाँ:
  - प्रबंधित पहचानें बनाना
  - RBAC भूमिकाएँ असाइन करना
  - Key Vault संसाधन बनाना
  - Container Apps तैनात करना

### ज्ञान पूर्वापेक्षाएँ

आपने ये पूरा कर लिया होना चाहिए:
- [इंस्टॉलेशन गाइड](installation.md) - AZD सेटअप
- [AZD मूल बातें](azd-basics.md) - मूल अवधारणाएँ
- [कॉन्फ़िगरेशन प्रबंधन](configuration.md) - पर्यावरण चर

---

## पाठ 1: प्रमाणीकरण पैटर्न को समझना

### पैटर्न 1: कनेक्शन स्ट्रिंग्स (विरासत - टालें)

**यह कैसे काम करता है:**
```bash
# कनेक्शन स्ट्रिंग में प्रमाण-पत्र शामिल हैं
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**समस्याएँ:**
- ❌ पर्यावरण चर में दिखाई देने वाले सीक्रेट्स
- ❌ तैनाती प्रणालियों में लॉग हो जाते हैं
- ❌ रोटेट करना कठिन
- ❌ एक्सेस का कोई ऑडिट ट्रेल नहीं

**कब उपयोग करें:** केवल स्थानीय विकास के लिए, कभी भी प्रोडक्शन में नहीं।

---

### पैटर्न 2: Key Vault संदर्भ (बेहतर)

**यह कैसे काम करता है:**
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

**लाभ:**
- ✅ Key Vault में सीक्रेट्स सुरक्षित रूप से संग्रहीत होते हैं
- ✅ केंद्रीकृत सीक्रेट प्रबंधन
- ✅ कोड परिवर्तन के बिना रोटेशन

**सीमाएँ:**
- ⚠️ अभी भी कीज़/पासवर्ड का उपयोग
- ⚠️ Key Vault एक्सेस को प्रबंधित करने की आवश्यकता

**कब उपयोग करें:** कनेक्शन स्ट्रिंग्स से प्रबंधित पहचान में संक्रमण का चरण।

---

### पैटर्न 3: प्रबंधित पहचान (सर्वोत्तम अभ्यास)

**यह कैसे काम करता है:**
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

**एप्लिकेशन कोड:**
```javascript
// कोई रहस्य आवश्यक नहीं!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**लाभ:**
- ✅ कोड/कॉन्फ़िग में कोई सीक्रेट नहीं
- ✅ स्वचालित क्रेडेंशियल रोटेशन
- ✅ पूर्ण ऑडिट ट्रेल
- ✅ RBAC-आधारित अनुमतियाँ
- ✅ अनुपालन-तैयार

**कब उपयोग करें:** हमेशा, प्रोडक्शन एप्लिकेशनों के लिए।

---

## पाठ 2: AZD के साथ प्रबंधित पहचान लागू करना

### चरण-दर-चरण लागूकरण

आइए एक सुरक्षित Container App बनाएं जो Azure Storage और Key Vault तक पहुँचने के लिए प्रबंधित पहचान का उपयोग करता है।

### प्रोजेक्ट संरचना

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

### 1. AZD कॉन्फ़िगर करें (azure.yaml)

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

### 2. इन्फ्रास्ट्रक्चर: प्रबंधित पहचान सक्षम करें

**फ़ाइल: `infra/main.bicep`**

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

### 3. सिस्टम-आवंटित पहचान के साथ Container App

**फ़ाइल: `infra/app/container-app.bicep`**

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

### 4. RBAC भूमिका असाइनमेंट मॉड्यूल

**फ़ाइल: `infra/core/role-assignment.bicep`**

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

### 5. प्रबंधित पहचान के साथ एप्लिकेशन कोड

**फ़ाइल: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 क्रेडेंशियल प्रारंभ करें (मैनेज्ड आइडेंटिटी के साथ स्वतः काम करता है)
const credential = new DefaultAzureCredential();

// Azure स्टोरेज सेटअप
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // किसी कुंजी की आवश्यकता नहीं!
);

// Key Vault सेटअप
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // किसी कुंजी की आवश्यकता नहीं!
);

// स्वास्थ्य जांच
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// फ़ाइल को ब्लॉब स्टोरेज में अपलोड करें
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

// Key Vault से सीक्रेट प्राप्त करें
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

// ब्लॉब कंटेनरों को सूचीबद्ध करें (पढ़ने की पहुँच दिखाता है)
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

**फ़ाइल: `src/package.json`**

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

### 6. तैनात और परीक्षण करें

```bash
# AZD वातावरण प्रारंभ करें
azd init

# बुनियादी ढांचा और एप्लिकेशन तैनात करें
azd up

# ऐप का URL प्राप्त करें
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# हेल्थ चेक का परीक्षण करें
curl $APP_URL/health
```

**✅ अपेक्षित आउटपुट:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**ब्लॉब अपलोड परीक्षण:**
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

**कंटेनर सूची परीक्षण:**
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

## सामान्य Azure RBAC भूमिकाएँ

### प्रबंधित पहचान के लिए बिल्ट-इन भूमिका IDs

| सेवा | भूमिका का नाम | भूमिका ID | अनुमतियाँ |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | ब्लॉब और कंटेनरों को पढ़ें |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | ब्लॉब्स को पढ़ें, लिखें, हटाएँ |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | क्यू संदेश पढ़ें, लिखें, हटाएँ |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | सीक्रेट्स पढ़ें |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | सीक्रेट्स पढ़ें, लिखें, हटाएँ |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Cosmos DB डेटा पढ़ें |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Cosmos DB डेटा पढ़ें, लिखें |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | SQL डेटाबेस प्रबंधित करें |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | संदेश भेजें, प्राप्त करें, प्रबंधित करें |

### भूमिका IDs कैसे खोजें

```bash
# सभी अंतर्निहित भूमिकाएँ सूचीबद्ध करें
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# किसी विशिष्ट भूमिका के लिए खोजें
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# भूमिका के विवरण प्राप्त करें
az role definition list --name "Storage Blob Data Contributor"
```

---

## व्यावहारिक अभ्यास

### अभ्यास 1: मौजूदा ऐप के लिए प्रबंधित पहचान सक्षम करें ⭐⭐ (मध्यम)

**लक्ष्य**: मौजूदा Container App तैनाती में प्रबंधित पहचान जोड़ें

**परिदृश्य**: आपके पास एक Container App है जो कनेक्शन स्ट्रिंग्स का उपयोग कर रहा है। इसे प्रबंधित पहचान में परिवर्तित करें।

**शुरुआत बिंदु**: इस कॉन्फ़िगरेशन के साथ Container App:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**कदम**:

1. **Bicep में प्रबंधित पहचान सक्षम करें:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Storage एक्सेस दें:**

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

3. **एप्लिकेशन कोड अपडेट करें:**

**पहले (कनेक्शन स्ट्रिंग):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**बाद (प्रबंधित पहचान):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **पर्यावरण चर अपडेट करें:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **तैनात और परीक्षण करें:**

```bash
# पुनः तैनात करें
azd up

# जांचें कि यह अभी भी काम करता है
curl https://myapp.azurecontainerapps.io/upload
```

**✅ सफलता मानदंड:**
- ✅ एप्लिकेशन बिना त्रुटियों के तैनात हो
- ✅ Storage संचालन काम करें (अपलोड, सूचीबद्ध, डाउनलोड)
- ✅ पर्यावरण चर में कोई कनेक्शन स्ट्रिंग्स नहीं
- ✅ Azure पोर्टल में "Identity" ब्लेड के अंतर्गत पहचान दिखाई दे

**सत्यापन:**

```bash
# सुनिश्चित करें कि प्रबंधित पहचान सक्षम है
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ अपेक्षित: "SystemAssigned"

# भूमिका असाइनमेंट की जाँच करें
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ अपेक्षित: "Storage Blob Data Contributor" भूमिका दिखती है
```

**समय**: 20-30 मिनट

---

### अभ्यास 2: User-Assigned पहचान के साथ मल्टी-सर्विस एक्सेस ⭐⭐⭐ (उन्नत)

**लक्ष्य**: एक user-assigned पहचान बनाना जो कई Container Apps के बीच साझा हो

**परिदृश्य**: आपके पास 3 माइक्रोसर्विस हैं जिन्हें सभी को समान Storage अकाउंट और Key Vault तक पहुँच की आवश्यकता है।

**कदम**:

1. **User-assigned पहचान बनाएं:**

**फ़ाइल: `infra/core/identity.bicep`**

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

2. **User-assigned पहचान को भूमिकाएँ असाइन करें:**

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

3. **पहचान को कई Container Apps को असाइन करें:**

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

4. **एप्लिकेशन कोड (सभी सेवाएँ एक ही पैटर्न का उपयोग करती हैं):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// उपयोगकर्ता-निर्धारित पहचान के लिए क्लाइंट ID निर्दिष्ट करें
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // उपयोगकर्ता-निर्धारित पहचान का क्लाइंट ID
);

// या DefaultAzureCredential का उपयोग करें (स्वतः पता लगाता है)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **तैनात और सत्यापित करें:**

```bash
azd up

# परीक्षण करें कि सभी सेवाएँ भंडारण तक पहुँच सकती हैं
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ सफलता मानदंड:**
- ✅ एक पहचान 3 सेवाओं के बीच साझा हो
- ✅ सभी सेवाएँ Storage और Key Vault तक पहुँच सकती हैं
- ✅ यदि आप एक सेवा को हटाते हैं तो पहचान बनी रहती है
- ✅ केंद्रीकृत अनुमतियों का प्रबंधन

**User-Assigned पहचान के लाभ:**
- प्रबंधित करने के लिए एकल पहचान
- सेवाओं में सुसंगत अनुमतियाँ
- सेवा हटाने पर भी बनी रहती है
- जटिल आर्किटेक्चर के लिए बेहतर

**समय**: 30-40 मिनट

---

### अभ्यास 3: Key Vault सीक्रेट रोटेशन लागू करें ⭐⭐⭐ (उन्नत)

**लक्ष्य**: तीसरे-पक्ष के API कीज़ को Key Vault में संग्रहीत करें और प्रबंधित पहचान का उपयोग करके उन तक पहुँचें

**परिदृश्य**: आपकी एप्लिकेशन को एक बाहरी API (OpenAI, Stripe, SendGrid) को कॉल करने की आवश्यकता है जिसे API कीज़ की आवश्यकता होती है।

**कदम**:

1. **RBAC के साथ Key Vault बनाएं:**

**फ़ाइल: `infra/core/keyvault.bicep`**

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

2. **Key Vault में सीक्रेट्स स्टोर करें:**

```bash
# Key Vault का नाम प्राप्त करें
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# तीसरे पक्ष की API कुंजियाँ संग्रहीत करें
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

3. **सीक्रेट्स प्राप्त करने के लिए एप्लिकेशन कोड:**

**फ़ाइल: `src/config.js`**

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
    // सबसे पहले कैश की जाँच करें
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

4. **एप्लिकेशन में सीक्रेट्स का उपयोग करें:**

**फ़ाइल: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Key Vault से कुंजी का उपयोग करके OpenAI को प्रारंभ करें
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// स्टार्टअप पर कॉल करें
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

5. **तैनात और परीक्षण करें:**

```bash
azd up

# परीक्षण करें कि API कुंजियाँ काम करती हैं
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ सफलता मानदंड:**
- ✅ कोड या पर्यावरण चर में कोई API कीज़ नहीं
- ✅ एप्लिकेशन Key Vault से कीज़ प्राप्त करता है
- ✅ तृतीय-पक्ष API ठीक से काम करते हैं
- ✅ कोड परिवर्तन के बिना कीज़ को रोटेट कर सकते हैं

**एक सीक्रेट को रोटेट करें:**

```bash
# Key Vault में गुप्त मान अपडेट करें
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# नई कुंजी लागू करने के लिए ऐप को पुनरारंभ करें
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**समय**: 25-35 मिनट

---

## ज्ञान चेकपॉइंट

### 1. प्रमाणीकरण पैटर्न ✓

अपनी समझ का परीक्षण करें:

- [ ] **Q1**: तीन प्रमुख प्रमाणीकरण पैटर्न कौन से हैं? 
  - **A**: कनेक्शन स्ट्रिंग्स (विरासत), Key Vault संदर्भ (संक्रमण), प्रबंधित पहचान (सर्वोत्तम)

- [ ] **Q2**: प्रबंधित पहचान कनेक्शन स्ट्रिंग्स से बेहतर क्यों है?
  - **A**: कोड में कोई सीक्रेट नहीं, स्वचालित रोटेशन, पूर्ण ऑडिट ट्रेल, RBAC अनुमतियाँ

- [ ] **Q3**: आप कब सिस्टम-आवंटित के बजाय user-assigned पहचान का उपयोग करेंगे?
  - **A**: जब कई संसाधनों के बीच पहचान साझा की जा रही हो या जब पहचान का जीवनचक्र संसाधन के जीवनचक्र से स्वतंत्र हो

**हैंड्स-ऑन सत्यापन:**
```bash
# जांचें कि आपकी ऐप किस प्रकार की पहचान का उपयोग करती है
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# पहचान के लिए सभी भूमिका नियुक्तियाँ सूचीबद्ध करें
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC और अनुमतियाँ ✓

अपनी समझ का परीक्षण करें:

- [ ] **Q1**: "Storage Blob Data Contributor" के लिए भूमिका ID क्या है?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: "Key Vault Secrets User" किस प्रकार की अनुमतियाँ देता है?
  - **A**: सीक्रेट्स के लिए केवल-पठनीय पहुँच (बना/अपडेट/हटाने में असमर्थ)

- [ ] **Q3**: आप Container App को Azure SQL तक पहुँच कैसे देंगे?
  - **A**: "SQL DB Contributor" भूमिका असाइन करें या SQL के लिए Azure AD प्रमाणीकरण कॉन्फ़िगर करें

**हैंड्स-ऑन सत्यापन:**
```bash
# विशिष्ट भूमिका ढूंढें
az role definition list --name "Storage Blob Data Contributor"

# जाँचें कि आपकी पहचान को कौन-कौन सी भूमिकाएँ असाइन की गई हैं
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault एकीकरण ✓

अपनी समझ का परीक्षण करें:
- [ ] **Q1**: Key Vault के लिए access policies की बजाय RBAC कैसे सक्षम करते हैं?
  - **A**: Bicep में `enableRbacAuthorization: true` सेट करें

- [ ] **Q2**: कौन सी Azure SDK लाइब्रेरी managed identity प्रमाणीकरण को संभालती है?
  - **A**: `@azure/identity` साथ `DefaultAzureCredential` class

- [ ] **Q3**: Key Vault के secrets कितने समय तक cache में रहते हैं?
  - **A**: एप्लिकेशन-निर्भर; अपनी खुद की कैशिंग रणनीति लागू करें

**Hands-On Verification:**
```bash
# Key Vault पहुँच का परीक्षण
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# जाँचें कि RBAC सक्षम है
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ अपेक्षित: true
```

---

## सुरक्षा सर्वोत्तम प्रथाएँ

### ✅ करें:

1. **प्रोडक्शन में हमेशा managed identity का उपयोग करें**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **न्यूनतम-आवश्यक अधिकार वाली RBAC भूमिकाएँ उपयोग करें**
   - संभव हो तो "Reader" भूमिका उपयोग करें
   - जब तक आवश्यक न हो "Owner" या "Contributor" से बचें

3. **तृतीय-पक्ष कुंजियों को Key Vault में स्टोर करें**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **ऑडिट लॉगिंग सक्षम करें**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **dev/staging/prod के लिए अलग पहचानें उपयोग करें**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **secrets को नियमित रूप से रोटेट करें**
   - Key Vault secrets पर समाप्ति तिथियाँ सेट करें
   - Azure Functions के साथ रोटेशन को स्वचालित करें

### ❌ न करें:

1. **कभी भी secrets को हार्डकोड न करें**
   ```javascript
   // ❌ खराब
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **प्रोडक्शन में connection strings का उपयोग न करें**
   ```javascript
   // ❌ बुरा
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **अत्यधिक अनुमतियाँ न दें**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **secrets को लॉग न करें**
   ```javascript
   // ❌ खराब
   console.log('API Key:', apiKey);
   
   // ✅ अच्छा
   console.log('API Key retrieved successfully');
   ```

5. **प्रोडक्शन पहचानों को विभिन्न वातावरणों में साझा न करें**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## समस्या निवारण गाइड

### समस्या: Azure Storage तक पहुँचने पर "Unauthorized"

**लक्षण:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**निदान:**

```bash
# जाँचें कि प्रबंधित पहचान सक्षम है
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ अपेक्षित: "SystemAssigned" या "UserAssigned"

# भूमिका आवंटन की जाँच करें
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# अपेक्षित: आपको "Storage Blob Data Contributor" या समान भूमिका दिखनी चाहिए
```

**समाधान:**

1. **सही RBAC भूमिका प्रदान करें:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **प्रसार के लिए प्रतीक्षा करें (5-10 मिनट लग सकते हैं):**
```bash
# भूमिका असाइनमेंट की स्थिति जांचें
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **सुनिश्चित करें कि एप्लीकेशन कोड सही credential का उपयोग कर रहा है:**
```javascript
// सुनिश्चित करें कि आप DefaultAzureCredential का उपयोग कर रहे हैं
const credential = new DefaultAzureCredential();
```

---

### समस्या: Key Vault access denied

**लक्षण:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**निदान:**

```bash
# जांचें कि Key Vault RBAC सक्षम है
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ अपेक्षित: true

# रोल असाइनमेंट्स की जाँच करें
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**समाधान:**

1. **Key Vault पर RBAC सक्षम करें:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Key Vault Secrets User भूमिका प्रदान करें:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### समस्या: DefaultAzureCredential स्थानीय रूप से विफल हो रहा है

**लक्षण:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**निदान:**

```bash
# जांचें कि आप लॉग इन हैं
az account show

# Azure CLI प्रमाणीकरण जांचें
az ad signed-in-user show
```

**समाधान:**

1. **Azure CLI में लॉगिन करें:**
```bash
az login
```

2. **Azure subscription सेट करें:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **स्थानीय विकास के लिए environment variables का उपयोग करें:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **या स्थानीय रूप से अलग credential का उपयोग करें:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// स्थानीय विकास के लिए AzureCliCredential का उपयोग करें
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### समस्या: भूमिका असाइनमेंट के प्रसारित होने में बहुत समय लगना

**लक्षण:**
- भूमिका सफलतापूर्वक असाइन की गई
- फिर भी 403 त्रुटियाँ मिल रही हैं
- आवर्ती पहुँच (कभी काम करता है, कभी नहीं)

**व्याख्या:**
Azure RBAC परिवर्तनों के वैश्विक रूप से प्रसारित होने में 5-10 मिनट लग सकते हैं।

**समाधान:**

```bash
# रुकें और पुनः प्रयास करें
echo "Waiting for RBAC propagation..."
sleep 300  # 5 मिनट प्रतीक्षा करें

# पहुँच की जाँच करें
curl https://myapp.azurecontainerapps.io/upload

# यदि फिर भी विफल हो रहा है, तो ऐप को पुनरारंभ करें
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## लागत विचार

### Managed Identity लागत

| Resource | Cost |
|----------|------|
| **Managed Identity** | 🆓 **नि:शुल्क** - कोई शुल्क नहीं |
| **RBAC Role Assignments** | 🆓 **नि:शुल्क** - कोई शुल्क नहीं |
| **Azure AD Token Requests** | 🆓 **नि:शुल्क** - शामिल |
| **Key Vault Operations** | $0.03 प्रति 10,000 ऑपरेशन |
| **Key Vault Storage** | $0.024 प्रति secret प्रति माह |

**Managed identity पैसे बचाता है द्वारा:**
- ✅ सेवा-से-सेवा ऑथ के लिए Key Vault ऑपरेशनों की आवश्यकता को खत्म करना
- ✅ सुरक्षा घटनाओं में कमी (कोई लीक हुए क्रेडेंशियल नहीं)
- ✅ परिचालन ओवरहेड घटाना (कोई मैन्युअल रोटेशन नहीं)

**उदाहरण लागत तुलना (मासिक):**

| Scenario | Connection Strings | Managed Identity | Savings |
|----------|-------------------|-----------------|---------|
| Small app (1M requests) | ~$50 (Key Vault + ops) | ~$0 | $50/month |
| Medium app (10M requests) | ~$200 | ~$0 | $200/month |
| Large app (100M requests) | ~$1,500 | ~$0 | $1,500/month |

---

## और जानें

### आधिकारिक दस्तावेज़
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK दस्तावेज़
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### इस कोर्स में अगले कदम
- ← पिछला: [Configuration Management](configuration.md)
- → अगला: [First Project](first-project.md)
- 🏠 [Course Home](../../README.md)

### संबंधित उदाहरण
- [Azure OpenAI Chat Example](../../../../examples/azure-openai-chat) - Azure OpenAI के लिए managed identity का उपयोग करता है
- [Microservices Example](../../../../examples/microservices) - मल्टी-सर्विस प्रमाणीकरण पैटर्न

---

## सार

**आपने सीखा:**
- ✅ तीन प्रमाणीकरण पैटर्न (connection strings, Key Vault, managed identity)
- ✅ AZD में managed identity को कैसे सक्षम और कॉन्फ़िगर करें
- ✅ Azure सेवाओं के लिए RBAC भूमिका असाइनमेंट
- ✅ तृतीय-पक्ष secrets के लिए Key Vault एकीकरण
- ✅ User-assigned बनाम system-assigned identities
- ✅ सुरक्षा सर्वोत्तम प्रथाएँ और समस्या निवारण

**मुख्य निष्कर्ष:**
1. **प्रोडक्शन में हमेशा managed identity का उपयोग करें** - शून्य secrets, स्वचालित रोटेशन
2. **न्यूनतम-आवश्यक अधिकार वाली RBAC भूमिकाएँ उपयोग करें** - केवल आवश्यक अनुमतियाँ दें
3. **तृतीय-पक्ष कुंजियों को Key Vault में स्टोर करें** - केंद्रीकृत secret प्रबंधन
4. **प्रत्येक वातावरण के लिए अलग पहचान रखें** - dev, staging, prod पृथक्करण
5. **ऑडिट लॉगिंग सक्षम करें** - यह ट्रैक करें कि किसने क्या एक्सेस किया

**अगले कदम:**
1. ऊपर दिए गए व्यावहारिक अभ्यास पूरे करें
2. एक मौजूदा ऐप को connection strings से managed identity पर माइग्रेट करें
3. पहले दिन से सुरक्षा के साथ अपना पहला AZD प्रोजेक्ट बनाएं: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हम सटीकता के लिए प्रयास करते हैं, लेकिन कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असमानताएँ हो सकती हैं। मूल दस्तावेज़ उसकी मूल भाषा में प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या भूल-समझ के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
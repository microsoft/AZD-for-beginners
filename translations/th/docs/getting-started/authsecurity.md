<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e13ff6e1197e0a7462ed0aede7df9f23",
  "translation_date": "2025-11-21T11:32:32+00:00",
  "source_file": "docs/getting-started/authsecurity.md",
  "language_code": "th"
}
-->
# รูปแบบการตรวจสอบสิทธิ์และ Managed Identity

⏱️ **เวลาที่คาดการณ์**: 45-60 นาที | 💰 **ผลกระทบด้านค่าใช้จ่าย**: ฟรี (ไม่มีค่าใช้จ่ายเพิ่มเติม) | ⭐ **ความซับซ้อน**: ระดับกลาง

**📚 เส้นทางการเรียนรู้:**
- ← ก่อนหน้า: [การจัดการการตั้งค่า](configuration.md) - การจัดการตัวแปรสภาพแวดล้อมและความลับ
- 🎯 **คุณอยู่ที่นี่**: การตรวจสอบสิทธิ์และความปลอดภัย (Managed Identity, Key Vault, รูปแบบการรักษาความปลอดภัย)
- → ถัดไป: [โปรเจกต์แรก](first-project.md) - สร้างแอปพลิเคชัน AZD แรกของคุณ
- 🏠 [หน้าแรกของคอร์ส](../../README.md)

---

## สิ่งที่คุณจะได้เรียนรู้

เมื่อจบบทเรียนนี้ คุณจะ:
- เข้าใจรูปแบบการตรวจสอบสิทธิ์ของ Azure (keys, connection strings, managed identity)
- ใช้ **Managed Identity** สำหรับการตรวจสอบสิทธิ์แบบไม่ใช้รหัสผ่าน
- ปกป้องความลับด้วยการผสานรวม **Azure Key Vault**
- ตั้งค่า **การควบคุมการเข้าถึงตามบทบาท (RBAC)** สำหรับการปรับใช้ AZD
- ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยใน Container Apps และบริการ Azure
- ย้ายจากการตรวจสอบสิทธิ์แบบใช้คีย์ไปเป็นแบบใช้ตัวตน

## ทำไม Managed Identity ถึงสำคัญ

### ปัญหา: การตรวจสอบสิทธิ์แบบดั้งเดิม

**ก่อนมี Managed Identity:**
```javascript
// ❌ ความเสี่ยงด้านความปลอดภัย: ความลับที่ถูกเขียนลงในโค้ด
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**ปัญหา:**
- 🔴 **ความลับถูกเปิดเผย** ในโค้ด ไฟล์การตั้งค่า ตัวแปรสภาพแวดล้อม
- 🔴 **การหมุนเวียนข้อมูลรับรอง** ต้องเปลี่ยนโค้ดและปรับใช้ใหม่
- 🔴 **ฝันร้ายด้านการตรวจสอบ** - ใครเข้าถึงอะไร เมื่อไหร่?
- 🔴 **การกระจายตัว** - ความลับกระจัดกระจายไปทั่วหลายระบบ
- 🔴 **ความเสี่ยงด้านการปฏิบัติตามข้อกำหนด** - ล้มเหลวในการตรวจสอบความปลอดภัย

### ทางออก: Managed Identity

**หลังมี Managed Identity:**
```javascript
// ✅ ปลอดภัย: ไม่มีความลับในโค้ด
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure จัดการการตรวจสอบสิทธิ์โดยอัตโนมัติ
);
```

**ประโยชน์:**
- ✅ **ไม่มีความลับ** ในโค้ดหรือการตั้งค่า
- ✅ **การหมุนเวียนอัตโนมัติ** - Azure จัดการให้
- ✅ **บันทึกการตรวจสอบเต็มรูปแบบ** ใน Azure AD logs
- ✅ **ความปลอดภัยแบบรวมศูนย์** - จัดการใน Azure Portal
- ✅ **พร้อมสำหรับการปฏิบัติตามข้อกำหนด** - ตรงตามมาตรฐานความปลอดภัย

**เปรียบเทียบ**: การตรวจสอบสิทธิ์แบบดั้งเดิมเหมือนการพกกุญแจหลายดอกสำหรับประตูต่างๆ Managed Identity เหมือนการมีบัตรรักษาความปลอดภัยที่ให้สิทธิ์การเข้าถึงโดยอัตโนมัติตามตัวตนของคุณ—ไม่มีกุญแจให้สูญหาย คัดลอก หรือหมุนเวียน

---

## ภาพรวมสถาปัตยกรรม

### การไหลของการตรวจสอบสิทธิ์ด้วย Managed Identity

```mermaid
sequenceDiagram
    participant App as แอปพลิเคชันของคุณ<br/>(แอปคอนเทนเนอร์)
    participant MI as การจัดการตัวตน<br/>(Azure AD)
    participant KV as คีย์วอลต์
    participant Storage as ที่เก็บข้อมูล Azure
    participant DB as Azure SQL
    
    App->>MI: ขอโทเค็นการเข้าถึง<br/>(อัตโนมัติ)
    MI->>MI: ยืนยันตัวตน<br/>(ไม่ต้องใช้รหัสผ่าน)
    MI-->>App: ส่งคืนโทเค็น<br/>(ใช้ได้ 1 ชั่วโมง)
    
    App->>KV: รับความลับ<br/>(ใช้โทเค็น)
    KV->>KV: ตรวจสอบสิทธิ์ RBAC
    KV-->>App: ส่งคืนค่าความลับ
    
    App->>Storage: อัปโหลดบล็อบ<br/>(ใช้โทเค็น)
    Storage->>Storage: ตรวจสอบสิทธิ์ RBAC
    Storage-->>App: สำเร็จ
    
    App->>DB: สอบถามข้อมูล<br/>(ใช้โทเค็น)
    DB->>DB: ตรวจสอบสิทธิ์ SQL
    DB-->>App: ส่งคืนผลลัพธ์
    
    Note over App,DB: การตรวจสอบสิทธิ์ทั้งหมดไม่มีรหัสผ่าน!
```
### ประเภทของ Managed Identities

```mermaid
graph TB
    MI[การจัดการตัวตน]
    SystemAssigned[ตัวตนที่กำหนดโดยระบบ]
    UserAssigned[ตัวตนที่กำหนดโดยผู้ใช้]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[วงจรชีวิตผูกกับทรัพยากร]
    SystemAssigned --> SA2[สร้าง/ลบโดยอัตโนมัติ]
    SystemAssigned --> SA3[เหมาะสำหรับทรัพยากรเดียว]
    
    UserAssigned --> UA1[วงจรชีวิตอิสระ]
    UserAssigned --> UA2[สร้าง/ลบด้วยตนเอง]
    UserAssigned --> UA3[ใช้ร่วมกันระหว่างทรัพยากร]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| คุณสมบัติ | System-Assigned | User-Assigned |
|-----------|----------------|---------------|
| **วงจรชีวิต** | ผูกกับทรัพยากร | อิสระ |
| **การสร้าง** | สร้างอัตโนมัติพร้อมทรัพยากร | สร้างด้วยตนเอง |
| **การลบ** | ลบพร้อมทรัพยากร | ยังคงอยู่หลังการลบทรัพยากร |
| **การแชร์** | ใช้ได้กับทรัพยากรเดียว | ใช้ได้กับหลายทรัพยากร |
| **กรณีการใช้งาน** | สถานการณ์ง่าย | สถานการณ์ซับซ้อนหลายทรัพยากร |
| **ค่าเริ่มต้นของ AZD** | ✅ แนะนำ | ตัวเลือก |

---

## สิ่งที่ต้องมี

### เครื่องมือที่จำเป็น

คุณควรติดตั้งสิ่งเหล่านี้แล้วจากบทเรียนก่อนหน้า:

```bash
# ตรวจสอบ Azure Developer CLI
azd version
# ✅ คาดหวัง: azd เวอร์ชัน 1.0.0 หรือสูงกว่า

# ตรวจสอบ Azure CLI
az --version
# ✅ คาดหวัง: azure-cli 2.50.0 หรือสูงกว่า
```

### ข้อกำหนดของ Azure

- การสมัครใช้งาน Azure ที่ใช้งานอยู่
- สิทธิ์ในการ:
  - สร้าง Managed Identities
  - กำหนดบทบาท RBAC
  - สร้างทรัพยากร Key Vault
  - ปรับใช้ Container Apps

### ความรู้ที่จำเป็น

คุณควรจบ:
- [คู่มือการติดตั้ง](installation.md) - การตั้งค่า AZD
- [พื้นฐานของ AZD](azd-basics.md) - แนวคิดหลัก
- [การจัดการการตั้งค่า](configuration.md) - ตัวแปรสภาพแวดล้อม

---

## บทเรียน 1: การทำความเข้าใจรูปแบบการตรวจสอบสิทธิ์

### รูปแบบที่ 1: Connection Strings (แบบเก่า - หลีกเลี่ยง)

**วิธีการทำงาน:**
```bash
# สตริงการเชื่อมต่อมีข้อมูลรับรอง
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**ปัญหา:**
- ❌ ความลับปรากฏในตัวแปรสภาพแวดล้อม
- ❌ ถูกบันทึกในระบบการปรับใช้
- ❌ หมุนเวียนได้ยาก
- ❌ ไม่มีบันทึกการตรวจสอบการเข้าถึง

**เมื่อใช้:** เฉพาะสำหรับการพัฒนาในเครื่องเท่านั้น ไม่ใช้ในโปรดักชั่น

---

### รูปแบบที่ 2: Key Vault References (ดีกว่า)

**วิธีการทำงาน:**
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

**ประโยชน์:**
- ✅ ความลับถูกเก็บไว้อย่างปลอดภัยใน Key Vault
- ✅ การจัดการความลับแบบรวมศูนย์
- ✅ หมุนเวียนโดยไม่ต้องเปลี่ยนโค้ด

**ข้อจำกัด:**
- ⚠️ ยังใช้คีย์/รหัสผ่าน
- ⚠️ ต้องจัดการการเข้าถึง Key Vault

**เมื่อใช้:** ขั้นตอนการเปลี่ยนจาก Connection Strings ไปยัง Managed Identity

---

### รูปแบบที่ 3: Managed Identity (แนวปฏิบัติที่ดีที่สุด)

**วิธีการทำงาน:**
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

**โค้ดแอปพลิเคชัน:**
```javascript
// ไม่ต้องการความลับ!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**ประโยชน์:**
- ✅ ไม่มีความลับในโค้ด/การตั้งค่า
- ✅ การหมุนเวียนข้อมูลรับรองอัตโนมัติ
- ✅ บันทึกการตรวจสอบเต็มรูปแบบ
- ✅ สิทธิ์ตาม RBAC
- ✅ พร้อมสำหรับการปฏิบัติตามข้อกำหนด

**เมื่อใช้:** เสมอ สำหรับแอปพลิเคชันในโปรดักชั่น

---

## บทเรียน 2: การใช้ Managed Identity กับ AZD

### การดำเนินการทีละขั้นตอน

มาสร้าง Container App ที่ปลอดภัยซึ่งใช้ Managed Identity เพื่อเข้าถึง Azure Storage และ Key Vault

### โครงสร้างโปรเจกต์

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

### 1. ตั้งค่า AZD (azure.yaml)

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

### 2. โครงสร้างพื้นฐาน: เปิดใช้งาน Managed Identity

**ไฟล์: `infra/main.bicep`**

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

### 3. Container App พร้อม System-Assigned Identity

**ไฟล์: `infra/app/container-app.bicep`**

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

### 4. โมดูลการกำหนดบทบาท RBAC

**ไฟล์: `infra/core/role-assignment.bicep`**

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

### 5. โค้ดแอปพลิเคชันพร้อม Managed Identity

**ไฟล์: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 เริ่มต้นข้อมูลรับรอง (ทำงานอัตโนมัติด้วย managed identity)
const credential = new DefaultAzureCredential();

// การตั้งค่า Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // ไม่ต้องใช้คีย์!
);

// การตั้งค่า Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // ไม่ต้องใช้คีย์!
);

// ตรวจสอบสุขภาพ
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// อัปโหลดไฟล์ไปยัง blob storage
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

// รับข้อมูลลับจาก Key Vault
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

// แสดงรายการ blob containers (แสดงการเข้าถึงแบบอ่าน)
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

**ไฟล์: `src/package.json`**

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

### 6. ปรับใช้และทดสอบ

```bash
# เริ่มต้นสภาพแวดล้อม AZD
azd init

# ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# รับ URL ของแอป
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# ทดสอบการตรวจสอบสุขภาพ
curl $APP_URL/health
```

**✅ ผลลัพธ์ที่คาดหวัง:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**ทดสอบการอัปโหลด blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ ผลลัพธ์ที่คาดหวัง:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**ทดสอบการแสดงรายการ container:**
```bash
curl $APP_URL/containers
```

**✅ ผลลัพธ์ที่คาดหวัง:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## บทบาท RBAC ทั่วไปของ Azure

### รหัสบทบาทในตัวสำหรับ Managed Identity

| บริการ | ชื่อบทบาท | รหัสบทบาท | สิทธิ์ |
|--------|-----------|-----------|--------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | อ่าน blobs และ containers |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | อ่าน เขียน ลบ blobs |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | อ่าน เขียน ลบข้อความในคิว |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | อ่านความลับ |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | อ่าน เขียน ลบความลับ |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | อ่านข้อมูล Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | อ่าน เขียนข้อมูล Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | จัดการฐานข้อมูล SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | ส่ง รับ จัดการข้อความ |

### วิธีค้นหารหัสบทบาท

```bash
# แสดงรายการบทบาทที่มีอยู่ในระบบ
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# ค้นหาบทบาทเฉพาะ
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# รับรายละเอียดบทบาท
az role definition list --name "Storage Blob Data Contributor"
```

---

## แบบฝึกหัดปฏิบัติ

### แบบฝึกหัด 1: เปิดใช้งาน Managed Identity สำหรับแอปที่มีอยู่ ⭐⭐ (ระดับกลาง)

**เป้าหมาย**: เพิ่ม Managed Identity ให้กับการปรับใช้ Container App ที่มีอยู่

**สถานการณ์**: คุณมี Container App ที่ใช้ Connection Strings เปลี่ยนเป็น Managed Identity

**จุดเริ่มต้น**: Container App ที่มีการตั้งค่าแบบนี้:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**ขั้นตอน**:

1. **เปิดใช้งาน Managed Identity ใน Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **ให้สิทธิ์การเข้าถึง Storage:**

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

3. **อัปเดตโค้ดแอปพลิเคชัน:**

**ก่อน (Connection String):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**หลัง (Managed Identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **อัปเดตตัวแปรสภาพแวดล้อม:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **ปรับใช้และทดสอบ:**

```bash
# นำกลับมาใช้งานใหม่
azd up

# ทดสอบว่าใช้งานได้เหมือนเดิม
curl https://myapp.azurecontainerapps.io/upload
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ แอปพลิเคชันปรับใช้โดยไม่มีข้อผิดพลาด
- ✅ การดำเนินการ Storage ทำงาน (อัปโหลด แสดงรายการ ดาวน์โหลด)
- ✅ ไม่มี Connection Strings ในตัวแปรสภาพแวดล้อม
- ✅ ตัวตนปรากฏใน Azure Portal ภายใต้ "Identity" blade

**การตรวจสอบ:**

```bash
# ตรวจสอบว่าเปิดใช้งาน Managed Identity แล้ว
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ คาดหวัง: "SystemAssigned"

# ตรวจสอบการกำหนดบทบาท
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ คาดหวัง: แสดงบทบาท "Storage Blob Data Contributor"
```

**เวลา**: 20-30 นาที

---

### แบบฝึกหัด 2: การเข้าถึงหลายบริการด้วย User-Assigned Identity ⭐⭐⭐ (ขั้นสูง)

**เป้าหมาย**: สร้าง User-Assigned Identity ที่แชร์ระหว่าง Container Apps หลายตัว

**สถานการณ์**: คุณมี microservices 3 ตัวที่ต้องการเข้าถึง Storage account และ Key Vault เดียวกัน

**ขั้นตอน**:

1. **สร้าง User-Assigned Identity:**

**ไฟล์: `infra/core/identity.bicep`**

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

2. **กำหนดบทบาทให้ User-Assigned Identity:**

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

3. **กำหนด Identity ให้ Container Apps หลายตัว:**

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

4. **โค้ดแอปพลิเคชัน (ทุกบริการใช้รูปแบบเดียวกัน):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// สำหรับตัวตนที่ผู้ใช้กำหนด ให้ระบุรหัสลูกค้า
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // รหัสลูกค้าสำหรับตัวตนที่ผู้ใช้กำหนด
);

// หรือใช้ DefaultAzureCredential (ตรวจจับอัตโนมัติ)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **ปรับใช้และตรวจสอบ:**

```bash
azd up

# ทดสอบว่าบริการทั้งหมดสามารถเข้าถึงพื้นที่จัดเก็บได้
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ ตัวตนเดียวแชร์ระหว่าง 3 บริการ
- ✅ บริการทั้งหมดสามารถเข้าถึง Storage และ Key Vault
- ✅ ตัวตนยังคงอยู่หากคุณลบบริการหนึ่ง
- ✅ การจัดการสิทธิ์แบบรวมศูนย์

**ประโยชน์ของ User-Assigned Identity:**
- ตัวตนเดียวที่จัดการได้ง่าย
- สิทธิ์ที่สอดคล้องกันระหว่างบริการ
- อยู่รอดหลังการลบบริการ
- เหมาะสำหรับสถาปัตยกรรมที่ซับซ้อน

**เวลา**: 30-40 นาที

---

### แบบฝึกหัด 3: ใช้การหมุนเวียนความลับใน Key Vault ⭐⭐⭐ (ขั้นสูง)

**เป้าหมาย**: เก็บคีย์ API ของบุคคลที่สามใน Key Vault และเข้าถึงด้วย Managed Identity

**สถานการณ์**: แอปของคุณต้องเรียก API ภายนอก (OpenAI, Stripe, SendGrid) ที่ต้องใช้คีย์ API

**ขั้นตอน**:

1. **สร้าง Key Vault พร้อม RBAC:**

**ไฟล์: `infra/core/keyvault.bicep`**

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

2. **เก็บความลับใน Key Vault:**

```bash
# รับชื่อ Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# เก็บคีย์ API ของบุคคลที่สาม
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

3. **โค้ดแอปพลิเคชันเพื่อดึงความลับ:**

**ไฟล์: `src/config.js`**

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
    // ตรวจสอบแคชก่อน
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

4. **ใช้ความลับในแอปพลิเคชัน:**

**ไฟล์: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// เริ่มต้น OpenAI ด้วยคีย์จาก Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// เรียกใช้เมื่อเริ่มต้นระบบ
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

5. **ปรับใช้และทดสอบ:**

```bash
azd up

# ทดสอบว่า API keys ใช้งานได้
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ เกณฑ์ความสำเร็จ:**
- ✅ ไม่มีคีย์ API ในโค้ดหรือตัวแปรสภาพแวดล้อม
- ✅ แอปพลิเคชันดึงคีย์จาก Key Vault
- ✅ API ของบุคคลที่สามทำงานได้อย่างถูกต้อง
- ✅ สามารถหมุนเวียนคีย์ได้โดยไม่ต้องเปลี่ยนโค้ด

**หมุนเวียนความลับ:**

```bash
# อัปเดตความลับใน Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# รีสตาร์ทแอปเพื่อรับคีย์ใหม่
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**เวลา**: 25-35 นาที

---

## จุดตรวจสอบความรู้

### 1. รูปแบบการตรวจสอบสิทธิ์ ✓

ทดสอบความเข้าใจของคุณ:

- [ ] **Q1**: รูปแบบการตรวจสอบสิทธิ์หลักสามรูปแบบคืออะไร? 
  - **A**: Connection Strings (แบบเก่า), Key Vault References (ขั้นตอนการเปลี่ยน), Managed Identity (แนวปฏิบัติที่ดีที่สุด)

- [ ] **Q2**: ทำไม Managed Identity ถึงดีกว่า Connection Strings?
  - **A**: ไม่มีความลับในโค้ด หมุนเวียนอัตโนมัติ บันทึกการตรวจสอบเต็มรูปแบบ สิทธิ์ตาม RBAC

- [ ] **Q3**: เมื่อไหร่ที่คุณจะใช้ User-Assigned Identity แทน System-Assigned?
  - **A**: เมื่อแชร์ตัวตนระหว่างทรัพยากรหลายตัวหรือเมื่อวงจรชีวิตของตัวตนเป็นอิสระจากทรัพยากร

**การตรวจสอบแบบลงมือทำ:**
```bash
# ตรวจสอบว่าแอปของคุณใช้ประเภทของตัวตนแบบใด
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# แสดงรายการการกำหนดบทบาททั้งหมดสำหรับตัวตน
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC และสิทธิ์ ✓

ทดสอบความเข้าใจของคุณ:

- [ ] **Q1**: รหัสบทบาทสำหรับ "Storage Blob Data Contributor" คืออะไร?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: สิทธิ์ที่ "Key Vault Secrets User" ให้คืออะไร?
  - **A**: การเข้าถึงความลับแบบอ่านอย่างเดียว (ไม่สามารถสร้าง อัปเดต หรือลบ)

- [ ] **Q3**: คุณจะให้ Container App เข้าถึง Azure SQL ได้อย่างไร?
  - **A**: กำหนดบทบาท "SQL DB Contributor" หรือกำหนดการตรวจสอบสิทธิ์ Azure AD สำหรับ SQL

**การตรวจสอบแบบลงมือทำ:**
```bash
# ค้นหาบทบาทเฉพาะ
az role definition list --name "Storage Blob Data Contributor"

# ตรวจสอบว่าบทบาทใดที่ถูกกำหนดให้กับตัวตนของคุณ
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. การผสานรวม Key Vault ✓

ทดสอบความเข้าใจของคุณ:
- [ ] **Q1**: จะเปิดใช้งาน RBAC สำหรับ Key Vault แทนนโยบายการเข้าถึงได้อย่างไร?
  - **A**: ตั้งค่า `enableRbacAuthorization: true` ใน Bicep

- [ ] **Q2**: ไลบรารี Azure SDK ใดที่จัดการการตรวจสอบสิทธิ์ด้วย Managed Identity?
  - **A**: `@azure/identity` กับคลาส `DefaultAzureCredential`

- [ ] **Q3**: ความลับใน Key Vault จะอยู่ในแคชได้นานแค่ไหน?
  - **A**: ขึ้นอยู่กับแอปพลิเคชัน; ควรสร้างกลยุทธ์แคชของคุณเอง

**การตรวจสอบแบบลงมือทำ:**
```bash
# ทดสอบการเข้าถึง Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# ตรวจสอบว่า RBAC เปิดใช้งาน
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ คาดหวัง: จริง
```

---

## แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย

### ✅ ควรทำ:

1. **ใช้ Managed Identity ในการผลิตเสมอ**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **ใช้บทบาท RBAC ที่มีสิทธิ์น้อยที่สุด**
   - ใช้บทบาท "Reader" เมื่อเป็นไปได้
   - หลีกเลี่ยงบทบาท "Owner" หรือ "Contributor" เว้นแต่จำเป็น

3. **จัดเก็บคีย์ของบุคคลที่สามใน Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **เปิดใช้งานการบันทึกการตรวจสอบ**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **ใช้ตัวตนที่แตกต่างกันสำหรับ dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **หมุนเวียนความลับเป็นประจำ**
   - ตั้งวันหมดอายุสำหรับความลับใน Key Vault
   - ทำการหมุนเวียนโดยอัตโนมัติด้วย Azure Functions

### ❌ ไม่ควรทำ:

1. **อย่าฝังความลับไว้ในโค้ด**
   ```javascript
   // ❌ ไม่ดี
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **อย่าใช้ Connection Strings ในการผลิต**
   ```javascript
   // ❌ แย่
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **อย่าให้สิทธิ์มากเกินไป**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **อย่าบันทึกความลับลงใน Log**
   ```javascript
   // ❌ ไม่ดี
   console.log('API Key:', apiKey);
   
   // ✅ ดี
   console.log('API Key retrieved successfully');
   ```

5. **อย่าแชร์ตัวตนของการผลิตข้ามสภาพแวดล้อม**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## คู่มือการแก้ไขปัญหา

### ปัญหา: "Unauthorized" เมื่อเข้าถึง Azure Storage

**อาการ:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**การวินิจฉัย:**

```bash
# ตรวจสอบว่ามีการเปิดใช้งาน Managed Identity หรือไม่
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ ที่คาดไว้: "SystemAssigned" หรือ "UserAssigned"

# ตรวจสอบการกำหนดบทบาท
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# ที่คาดไว้: ควรเห็น "Storage Blob Data Contributor" หรือบทบาทที่คล้ายกัน
```

**วิธีแก้ไข:**

1. **ให้บทบาท RBAC ที่ถูกต้อง:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **รอการเผยแพร่ (อาจใช้เวลา 5-10 นาที):**
```bash
# ตรวจสอบสถานะการกำหนดบทบาท
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **ตรวจสอบโค้ดแอปพลิเคชันว่าใช้ Credential ที่ถูกต้อง:**
```javascript
// ตรวจสอบให้แน่ใจว่าคุณกำลังใช้ DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### ปัญหา: การเข้าถึง Key Vault ถูกปฏิเสธ

**อาการ:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**การวินิจฉัย:**

```bash
# ตรวจสอบว่าเปิดใช้งาน Key Vault RBAC แล้ว
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ คาดหวัง: true

# ตรวจสอบการกำหนดบทบาท
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**วิธีแก้ไข:**

1. **เปิดใช้งาน RBAC ใน Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **ให้บทบาท Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### ปัญหา: DefaultAzureCredential ล้มเหลวในเครื่อง

**อาการ:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**การวินิจฉัย:**

```bash
# ตรวจสอบว่าคุณเข้าสู่ระบบแล้ว
az account show

# ตรวจสอบการรับรองความถูกต้องของ Azure CLI
az ad signed-in-user show
```

**วิธีแก้ไข:**

1. **เข้าสู่ระบบ Azure CLI:**
```bash
az login
```

2. **ตั้งค่าการสมัครใช้งาน Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **สำหรับการพัฒนาในเครื่อง ใช้ตัวแปรสภาพแวดล้อม:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **หรือใช้ Credential ที่แตกต่างกันในเครื่อง:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// ใช้ AzureCliCredential สำหรับการพัฒนาในเครื่อง
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### ปัญหา: การมอบหมายบทบาทใช้เวลานานในการเผยแพร่

**อาการ:**
- บทบาทถูกมอบหมายสำเร็จ
- ยังคงได้รับข้อผิดพลาด 403
- การเข้าถึงไม่สม่ำเสมอ (บางครั้งใช้งานได้ บางครั้งไม่ได้)

**คำอธิบาย:**
การเปลี่ยนแปลง RBAC ใน Azure อาจใช้เวลา 5-10 นาทีในการเผยแพร่ทั่วโลก

**วิธีแก้ไข:**

```bash
# รอและลองใหม่
echo "Waiting for RBAC propagation..."
sleep 300  # รอ 5 นาที

# ทดสอบการเข้าถึง
curl https://myapp.azurecontainerapps.io/upload

# หากยังล้มเหลว ให้รีสตาร์ทแอป
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## การพิจารณาด้านต้นทุน

### ค่าใช้จ่ายของ Managed Identity

| ทรัพยากร | ค่าใช้จ่าย |
|----------|------------|
| **Managed Identity** | 🆓 **ฟรี** - ไม่มีค่าใช้จ่าย |
| **RBAC Role Assignments** | 🆓 **ฟรี** - ไม่มีค่าใช้จ่าย |
| **Azure AD Token Requests** | 🆓 **ฟรี** - รวมอยู่แล้ว |
| **Key Vault Operations** | $0.03 ต่อ 10,000 การดำเนินการ |
| **Key Vault Storage** | $0.024 ต่อความลับต่อเดือน |

**Managed Identity ช่วยประหยัดเงินโดย:**
- ✅ ลดการดำเนินการ Key Vault สำหรับการตรวจสอบสิทธิ์ระหว่างบริการ
- ✅ ลดเหตุการณ์ด้านความปลอดภัย (ไม่มี Credential รั่วไหล)
- ✅ ลดภาระงานการดำเนินการ (ไม่ต้องหมุนเวียนด้วยตนเอง)

**ตัวอย่างการเปรียบเทียบต้นทุน (รายเดือน):**

| สถานการณ์ | Connection Strings | Managed Identity | การประหยัด |
|------------|--------------------|------------------|-------------|
| แอปขนาดเล็ก (1M requests) | ~$50 (Key Vault + ops) | ~$0 | $50/เดือน |
| แอปขนาดกลาง (10M requests) | ~$200 | ~$0 | $200/เดือน |
| แอปขนาดใหญ่ (100M requests) | ~$1,500 | ~$0 | $1,500/เดือน |

---

## เรียนรู้เพิ่มเติม

### เอกสารทางการ
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### เอกสาร SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### ขั้นตอนถัดไปในคอร์สนี้
- ← ก่อนหน้า: [Configuration Management](configuration.md)
- → ถัดไป: [First Project](first-project.md)
- 🏠 [หน้าแรกของคอร์ส](../../README.md)

### ตัวอย่างที่เกี่ยวข้อง
- [ตัวอย่าง Azure OpenAI Chat](../../../../examples/azure-openai-chat) - ใช้ Managed Identity สำหรับ Azure OpenAI
- [ตัวอย่าง Microservices](../../../../examples/microservices) - รูปแบบการตรวจสอบสิทธิ์หลายบริการ

---

## สรุป

**คุณได้เรียนรู้:**
- ✅ รูปแบบการตรวจสอบสิทธิ์สามแบบ (Connection Strings, Key Vault, Managed Identity)
- ✅ วิธีเปิดใช้งานและกำหนดค่า Managed Identity ใน AZD
- ✅ การมอบหมายบทบาท RBAC สำหรับบริการ Azure
- ✅ การรวม Key Vault สำหรับความลับของบุคคลที่สาม
- ✅ ตัวตนที่กำหนดโดยผู้ใช้กับตัวตนที่กำหนดโดยระบบ
- ✅ แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยและการแก้ไขปัญหา

**ข้อคิดสำคัญ:**
1. **ใช้ Managed Identity ในการผลิตเสมอ** - ไม่มีความลับ หมุนเวียนอัตโนมัติ
2. **ใช้บทบาท RBAC ที่มีสิทธิ์น้อยที่สุด** - ให้สิทธิ์เท่าที่จำเป็น
3. **จัดเก็บคีย์ของบุคคลที่สามใน Key Vault** - การจัดการความลับแบบรวมศูนย์
4. **แยกตัวตนตามสภาพแวดล้อม** - การแยก dev, staging, prod
5. **เปิดใช้งานการบันทึกการตรวจสอบ** - ติดตามว่าใครเข้าถึงอะไร

**ขั้นตอนถัดไป:**
1. ทำแบบฝึกหัดที่กล่าวถึงข้างต้นให้เสร็จ
2. ย้ายแอปที่มีอยู่จาก Connection Strings ไปยัง Managed Identity
3. สร้างโปรเจกต์ AZD แรกของคุณด้วยความปลอดภัยตั้งแต่เริ่มต้น: [First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
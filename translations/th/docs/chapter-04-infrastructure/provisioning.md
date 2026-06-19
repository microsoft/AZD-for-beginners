# การจัดเตรียมทรัพยากร Azure ด้วย AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้
- **⬅️ ก่อนหน้า**: [คู่มือการปรับใช้](deployment-guide.md)
- **➡️ บทถัดไป**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)
- **🔧 ที่เกี่ยวข้อง**: [บทที่ 6: การตรวจสอบก่อนปรับใช้](../chapter-06-pre-deployment/capacity-planning.md)

## บทนำ

คู่มือที่ครอบคลุมนี้กล่าวถึงทุกสิ่งที่คุณจำเป็นต้องรู้เกี่ยวกับการจัดเตรียมและจัดการทรัพยากร Azure โดยใช้ Azure Developer CLI เรียนรู้การใช้แพตเทิร์นโครงสร้างพื้นฐานเป็นโค้ด (IaC) ตั้งแต่การสร้างทรัพยากรพื้นฐานจนถึงสถาปัตยกรรมโครงสร้างพื้นฐานระดับองค์กรขั้นสูงโดยใช้ Bicep, ARM templates, Terraform และ Pulumi

## เป้าหมายการเรียนรู้

เมื่อผ่านคู่มือนี้แล้ว คุณจะสามารถ:
- เชี่ยวชาญหลักการโครงสร้างพื้นฐานเป็นโค้ดและการจัดเตรียมทรัพยากร Azure
- เข้าใจผู้ให้บริการ IaC หลายรายที่ Azure Developer CLI รองรับ
- ออกแบบและใช้ Bicep templates สำหรับสถาปัตยกรรมแอปพลิเคชันทั่วไป
- กำหนดค่าพารามิเตอร์ตัวแปร และการตั้งค่าสภาพแวดล้อมเฉพาะ
- ใช้แพตเทิร์นโครงสร้างพื้นฐานขั้นสูงรวมถึงเครือข่ายและความปลอดภัย
- จัดการวงจรชีวิตของทรัพยากร การอัปเดต และการแก้ไขความสัมพันธ์การขึ้นต่อกัน

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- ออกแบบและจัดเตรียมโครงสร้างพื้นฐาน Azure โดยใช้ Bicep และ ARM templates
- กำหนดค่าสถาปัตยกรรมหลายบริการที่ซับซ้อนพร้อมการขึ้นต่อกันของทรัพยากรอย่างเหมาะสม
- ใช้เทมเพลตที่มีพารามิเตอร์สำหรับหลายสภาพแวดล้อมและการตั้งค่าที่แตกต่างกัน
- แก้ไขปัญหาการจัดเตรียมโครงสร้างพื้นฐานและแก้ปัญหาการปรับใช้ล้มเหลว
- นำหลักการ Azure Well-Architected Framework มาใช้ในการออกแบบโครงสร้างพื้นฐาน
- จัดการอัปเดตโครงสร้างพื้นฐานและใช้กลยุทธ์เวอร์ชันโครงสร้างพื้นฐาน

## ภาพรวมการจัดเตรียมโครงสร้างพื้นฐาน

Azure Developer CLI รองรับผู้ให้บริการโครงสร้างพื้นฐานเป็นโค้ด (IaC) หลายราย:
- **Bicep** (แนะนำ) - ภาษาที่เฉพาะเจาะจงกับโดเมนของ Azure
- **ARM Templates** - เทมเพลต Azure Resource Manager แบบ JSON
- **Terraform** - เครื่องมือโครงสร้างพื้นฐานแบบมัลติคลาวด์
- **Pulumi** - โครงสร้างพื้นฐานเป็นโค้ดสมัยใหม่ด้วยภาษาโปรแกรม

## การเข้าใจทรัพยากร Azure

### โครงสร้างลำดับชั้นของทรัพยากร
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### บริการ Azure ที่ใช้บ่อยสำหรับแอปพลิเคชัน
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## เทมเพลตโครงสร้างพื้นฐาน Bicep

### โครงสร้างเทมเพลต Bicep พื้นฐาน
```bicep
// infra/main.bicep
@description('The name of the environment')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The name of the application')
param applicationName string = 'myapp'

// Variables
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
}

// Resource Group (created automatically by azd)
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: '${applicationName}-${environmentName}-rg'
}

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${applicationName}-${environmentName}-plan'
  location: location
  tags: tags
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
    reserved: true // Linux App Service Plan
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
    httpsOnly: true
  }
}

// Output values for azd
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output WEB_NAME string = webApp.name
```

### แพตเทิร์น Bicep ขั้นสูง

#### โครงสร้างพื้นฐานแบบโมดูลาร์
```bicep
// infra/modules/app-service.bicep
@description('App Service configuration')
param name string
param location string
param planId string
param appSettings array = []

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|18-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
}

output hostname string = webApp.properties.defaultHostName
output principalId string = webApp.identity.principalId
```

```bicep
// infra/main.bicep - Using modules
module webAppModule 'modules/app-service.bicep' = {
  name: 'webApp'
  params: {
    name: '${applicationName}-web-${resourceToken}'
    location: location
    planId: appServicePlan.id
    appSettings: [
      {
        name: 'API_URL'
        value: apiModule.outputs.endpoint
      }
      {
        name: 'DATABASE_URL'
        value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-url)'
      }
    ]
  }
}
```

#### การสร้างทรัพยากรตามเงื่อนไข
```bicep
@description('Whether to create a database')
param createDatabase bool = true

@description('Database SKU')
param databaseSku string = 'Basic'

resource database 'Microsoft.Sql/servers/databases@2021-11-01' = if (createDatabase) {
  name: '${sqlServer.name}/${applicationName}-db'
  location: location
  sku: {
    name: databaseSku
    tier: databaseSku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
```

## 🌐 การใช้ Terraform กับ azd

Bicep เป็นค่าเริ่มต้นของ azd แต่ azd ยังรองรับ **Terraform** — เหมาะหากทีมของคุณได้ใช้มาตรฐานนี้หรือคุณจัดการโครงสร้างพื้นฐานแบบมัลติคลาวด์ ขั้นตอนการทำงาน azd (`azd up`, `azd provision`, `azd down`) เหมือนกันทั้งหมด; เปลี่ยนแค่ภาษาโครงสร้างพื้นฐานและโครงสร้างโฟลเดอร์เท่านั้น

### แจ้ง azd ให้ใช้ Terraform

เพิ่มส่วน `infra` ในไฟล์ `azure.yaml` ชี้ไปที่ผู้ให้บริการ Terraform:

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### โครงสร้างโฟลเดอร์ Terraform

เมื่อใช้ผู้ให้บริการ Terraform โฟลเดอร์ `infra/` ของคุณจะใช้ไฟล์ `.tf` แทน Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ไฟล์ `main.tf` ที่เรียบง่ายที่สุด

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### วิธีที่ azd เชื่อมต่อกับค่าผลลัพธ์ Terraform ของคุณ

azd อ่านค่าผลลัพธ์ (outputs) ของ Terraform เพื่อเรียนรู้จุดเชื่อมต่อและนำค่าจากสภาพแวดล้อมกลับมาใช้ในแอปชื่อ output สำคัญ—azd มองหาชื่อเฉพาะ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **สำคัญ:** azd ใช้แท็ก `azd-env-name` และค่าผลลัพธ์ `AZURE_*` เพื่อติดตามทรัพยากรในแต่ละสภาพแวดล้อม กรุณาเพิ่มแท็กให้กลุ่มทรัพยากรของคุณด้วย `"azd-env-name" = var.environment_name` เสมอ เพื่อที่คำสั่ง `azd down` จะสามารถค้นหาและลบทั้งหมดได้

### การปรับใช้ด้วย Terraform

คำสั่งเหมือนกับ Bicep เป๊ะ:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd รัน 'terraform plan' เบื้องหลัง
azd up                    # จัดเตรียม + ปล่อยใช้งาน
azd down --force          # ทำลายทรัพยากรที่จัดการโดย Terraform
```

> **ข้อกำหนดล่วงหน้า:** ต้องติดตั้ง Terraform และตั้งไว้ใน `PATH` ของคุณ azd จัดการ *ขั้นตอนการทำงาน* ของ Terraform แต่ไม่ติดตั้ง Terraform ให้ สำหรับสถานะโดยค่าเริ่มต้น azd ใช้สถานะในเครื่อง; สำหรับทีม ควรกำหนด backend ระยะไกล (เช่น Azure Storage backend) ในไฟล์ `provider.tf`

สำหรับตัวอย่างเริ่มต้นแบบ Terraform พร้อมใช้งาน ดูที่ [Awesome AZD gallery](https://azure.github.io/awesome-azd/) และกรองสำหรับ Terraform หรือดูเอกสารทางการ [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)

## 🧩 การใช้ Pulumi กับ azd

หากทีมของคุณเขียนโครงสร้างพื้นฐานด้วยภาษาโปรแกรมทั่วไป (TypeScript, Python, Go หรือ C#) แทนการใช้ DSL azd ก็รองรับ **Pulumi** ด้วย เช่นเดียวกับ Terraform ขั้นตอนการทำงาน `azd up` / `azd provision` / `azd down` ไม่เปลี่ยนแปลง—เปลี่ยนแค่เครื่องมือและโครงสร้างโฟลเดอร์ของโครงสร้างพื้นฐาน

### แจ้ง azd ให้ใช้ Pulumi

```yaml
# azure.yaml
name: my-pulumi-app
infra:
  provider: pulumi      # default is "bicep"
  path: infra           # folder containing your Pulumi program
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### โครงสร้างโฟลเดอร์ Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ไฟล์ `index.ts` ที่เรียบง่ายที่สุด

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// ติดแท็กแต่ละทรัพยากรเพื่อให้ azd สามารถติดตามและล้างข้อมูลเหล่านั้นได้
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd อ่านผลลัพธ์เหล่านี้กลับเข้าไปในสภาพแวดล้อมของคุณ
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks จะแมปกับ azd environment

Pulumi จัดการ deployment เป็น **stacks** และ azd แมปแต่ละ environment ของ azd ไปยัง Pulumi stack ที่ชื่อเดียวกัน เมื่อคุณรัน `azd env new staging` azd จะเลือก (หรือสร้าง) Pulumi stack ชื่อ `staging` กฎการแท็ก `azd-env-name` และค่าผลลัพธ์ `AZURE_*` เหมือนเดิม ดังนั้น `azd down` จึงสามารถค้นหาและลบทั้งหมดได้

### การปรับใช้ด้วย Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd รัน 'pulumi preview' เบื้องหลัง
azd up                    # จัดเตรียม + ดีพลอย
azd down --force          # รัน 'pulumi destroy'
```

> **ข้อกำหนดล่วงหน้า:** ต้องติดตั้ง Pulumi และตั้งไว้ใน `PATH` ของคุณ และจำเป็นต้องมี backend สำหรับจัดการสถานะ (Pulumi Cloud หรือ backend ที่จัดการเอง เช่น Azure Blob Storage) azd จัดการ *ขั้นตอนการทำงาน* ของ Pulumi ไม่ใช่การติดตั้ง ดูเอกสารทางการ [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd)

## 🎯 การเลือกโฮสต์สำหรับบริการของคุณ

ฟิลด์ `host` ใน `azure.yaml` กำหนดว่ารันโค้ดของคุณที่ไหน azd รองรับโฮสต์หลายตัว—การเลือกโฮสต์ที่เหมาะสมสำคัญกว่าภาษาโครงสร้างพื้นฐาน ต่อไปนี้เป็นการเปรียบเทียบสำหรับผู้เริ่มต้น:

| ค่า `host` | เหมาะสำหรับ | เหตุผล |
|--------------|----------|-----|
| `appservice` | เว็บแอปและ API แบบดั้งเดิม | PaaS ที่ง่ายที่สุด; ไม่ต้องใช้คอนเทนเนอร์ |
| `staticwebapp` | SPA หน้าแรก (React, Vue, Angular) | CDN ทั่วโลก + SSL ฟรี, รองรับ API ในตัว |
| `function` | งานที่ขับเคลื่อนด้วยเหตุการณ์และแบบ serverless | ปรับขนาดเป็นศูนย์ได้, คิดเงินตามการประมวลผล |
| `containerapp` | ไมโครเซอร์วิสที่รันในคอนเทนเนอร์ | คอนเทนเนอร์แบบ serverless, ปรับขนาดเป็นศูนย์, ingress ในตัว |
| `aks` | งาน orchestration ที่ซับซ้อน | ควบคุม Kubernetes เต็มรูปแบบเมื่อจำเป็นจริงๆ |
| `springapp` | แอป Java Spring Boot | รันไทม์ Azure Spring Apps ที่จัดการและปรับแต่งสำหรับ Spring |

### เมื่อไรควรเลือก AKS

**Azure Kubernetes Service (`host: aks`)** ให้พลัง Kubernetes เต็มรูปแบบ—ตัวควบคุมแบบกำหนดเอง, service meshes, เครือข่ายซับซ้อน และการจัดการตารางเวลาระดับละเอียด พลังนี้มาพร้อมกับภาระงานตัวจัดการ: คุณต้องดูแล node pools, การอัปเกรด และเครือข่ายคลัสเตอร์

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **เริ่มง่ายกว่าถ้าได้** สำหรับไมโครเซอร์วิสส่วนใหญ่, **Container Apps** ให้คุณใช้คอนเทนเนอร์, autoscaling และปรับขนาดเป็นศูนย์ได้โดยไม่ต้องจัดการคลัสเตอร์ เลือกใช้ AKS เมื่อคุณต้องการฟีเจอร์เฉพาะของ Kubernetes จริงๆ

### เมื่อไรใช้ Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** เป็นรันไทม์ที่จัดการเพื่อ Spring Boot โดยเฉพาะ รับผิดชอบค้นหาบริการ, เซิร์ฟเวอร์ config และการ deploy แบบ blue-green เพื่อที่ทีม Java จะไม่ต้องดูแลโครงสร้างพื้นฐานเอง

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> ใช้ `springapp` เมื่อคุณมีแอป Spring Boot ที่มีอยู่แล้วและต้องการรันไทม์ที่ปรับแต่งสำหรับพวกเขา สำหรับแอป Java ใหม่ที่ใส่คอนเทนเนอร์และไม่มีความต้องการเฉพาะ Spring, `containerapp` มักเป็นตัวเลือกที่ง่ายกว่า

## 🗃️ การจัดเตรียมฐานข้อมูล

### Cosmos DB
```bicep
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${applicationName}-cosmos-${resourceToken}'
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  parent: cosmosAccount
  name: '${applicationName}db'
  properties: {
    resource: {
      id: '${applicationName}db'
    }
  }
}

resource todoContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  parent: cosmosDatabase
  name: 'todos'
  properties: {
    resource: {
      id: 'todos'
      partitionKey: {
        paths: ['/userId']
        kind: 'Hash'
      }
    }
  }
}
```

### PostgreSQL
```bicep
resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${applicationName}-postgres-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '14'
    administratorLogin: 'dbadmin'
    administratorLoginPassword: databasePassword
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    highAvailability: {
      mode: 'Disabled'
    }
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  parent: postgresServer
  name: '${applicationName}db'
  properties: {
    charset: 'utf8'
    collation: 'en_US.utf8'
  }
}

// Allow Azure services to connect
resource firewallRule 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2022-12-01' = {
  parent: postgresServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
```

## 🔒 การจัดการความปลอดภัยและความลับ

### การเชื่อมต่อ Key Vault
```bicep
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${applicationName}-kv-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

// Grant Key Vault access to the web app
resource webAppKeyVaultAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, webApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '4633458b-17de-408a-b874-0445c86b69e6' // Key Vault Secrets User
    )
    principalId: webApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Store database connection string in Key Vault
resource databaseConnectionSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'database-connection-string'
  properties: {
    value: 'Server=${postgresServer.properties.fullyQualifiedDomainName};Database=${postgresDatabase.name};Port=5432;User Id=${postgresServer.properties.administratorLogin};Password=${databasePassword};'
  }
}
```

### การกำหนดค่า Managed Identity
```bicep
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DATABASE_CONNECTION_STRING'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
        }
        {
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 เครือข่ายและการเชื่อมต่อ

### การกำหนดค่า Virtual Network
```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${applicationName}-vnet-${resourceToken}'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.KeyVault'
            }
          ]
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'postgres-delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private DNS Zone for PostgreSQL
resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${applicationName}.postgres.database.azure.com'
  location: 'global'
  tags: tags
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${applicationName}-dns-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}
```

### Application Gateway พร้อม SSL
```bicep
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${applicationName}-agw-pip-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: '${applicationName}-agw-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/gateway-subnet'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port443'
        properties: {
          port: 443
        }
      }
    ]
  }
}
```

## 📊 การตรวจสอบและการสังเกต

### Application Insights
```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${applicationName}-logs-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${applicationName}-ai-${resourceToken}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Output connection string for applications
output APPLICATION_INSIGHTS_CONNECTION_STRING string = applicationInsights.properties.ConnectionString
```

### เมตริกและการแจ้งเตือนที่กำหนดเอง
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [webApp.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

## 🔧 การตั้งค่าสภาพแวดล้อมเฉพาะ

### ไฟล์พารามิเตอร์สำหรับสภาพแวดล้อมต่างๆ
```json
// infra/main.parameters.dev.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "B1"
    },
    "databaseSku": {
      "value": "Standard_B1ms"
    },
    "enableBackup": {
      "value": false
    }
  }
}
```

```json
// infra/main.parameters.prod.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "P1v3"
    },
    "databaseSku": {
      "value": "Standard_D2s_v3"
    },
    "enableBackup": {
      "value": true
    },
    "replicaCount": {
      "value": 3
    }
  }
}
```

### การจัดเตรียมทรัพยากรตามเงื่อนไข
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: '${applicationName}devstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: '${applicationName}prodstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
```

## 🚀 แพตเทิร์นการจัดเตรียมขั้นสูง

### การปรับใช้หลายภูมิภาค
```bicep
@description('Primary region')
param primaryLocation string = 'eastus2'

@description('Secondary region')
param secondaryLocation string = 'westus2'

// Primary region resources
module primaryRegion 'modules/region.bicep' = {
  name: 'primary-region'
  params: {
    location: primaryLocation
    isPrimary: true
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Secondary region resources
module secondaryRegion 'modules/region.bicep' = {
  name: 'secondary-region'
  params: {
    location: secondaryLocation
    isPrimary: false
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: '${applicationName}-tm-${resourceToken}'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: '${applicationName}-${environmentName}'
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryRegion.outputs.webAppId
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryRegion.outputs.webAppId
          priority: 2
        }
      }
    ]
  }
}
```

### การทดสอบโครงสร้างพื้นฐาน
```bicep
// infra/test/main.test.bicep
param location string = resourceGroup().location

module mainTemplate '../main.bicep' = {
  name: 'main-template-test'
  params: {
    environmentName: 'test'
    location: location
    applicationName: 'testapp'
  }
}

// Test assertions
resource testScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'test-deployment'
  location: location
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '8.0'
    scriptContent: '''
      $webAppName = "${mainTemplate.outputs.WEB_NAME}"
      $response = Invoke-WebRequest -Uri "https://${mainTemplate.outputs.WEB_URL}/health" -UseBasicParsing
      if ($response.StatusCode -ne 200) {
        throw "Health check failed"
      }
      Write-Output "All tests passed!"
    '''
    timeout: 'PT10M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🧪 การดูตัวอย่างและตรวจสอบโครงสร้างพื้นฐาน (ใหม่)

### ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนปรับใช้

ฟีเจอร์ `azd provision --preview` ช่วยให้คุณ **จำลองการจัดเตรียมโครงสร้างพื้นฐาน** ก่อนจะปรับใช้ทรัพยากรจริง เหมือนกับ `terraform plan` หรือ `bicep what-if` ให้มุมมอง **dry-run** ว่าจะมีการเปลี่ยนแปลงอะไรในสภาพแวดล้อม Azure ของคุณ

#### 🛠️ มันทำอะไร
- **วิเคราะห์เทมเพลต IaC ของคุณ** (Bicep หรือ Terraform)
- **แสดงตัวอย่างการเปลี่ยนแปลงของทรัพยากร**: การเพิ่ม การลบ การอัปเดต
- **ไม่ปรับใช้การเปลี่ยนแปลง** — อ่านได้อย่างเดียวและปลอดภัยที่จะรัน

#### กรณีการใช้งาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนการปรับใช้
azd provision --preview

# ดูตัวอย่างสำหรับสภาพแวดล้อมเฉพาะ
azd provision --preview -e production
```

คำสั่งนี้ช่วยให้คุณ:
- **ตรวจสอบการเปลี่ยนแปลงโครงสร้างพื้นฐาน** ก่อนยืนยันการจัดเตรียมทรัพยากร
- **จับข้อผิดพลาดการตั้งค่าตั้งแต่เนิ่นๆ** ในวงจรการพัฒนา
- **ร่วมมือกันอย่างปลอดภัย** ในสภาพแวดล้อมแบบทีม
- **รับรองการปรับใช้แบบสิทธิ์น้อยที่สุด** โดยไม่มีความประหลาดใจ

มีประโยชน์มากเมื่อ:
- ทำงานกับสภาพแวดล้อมหลายบริการที่ซับซ้อน
- การเปลี่ยนแปลงโครงสร้างพื้นฐานในสภาพแวดล้อมการผลิต
- ตรวจสอบการแก้ไขเทมเพลตก่อนอนุมัติ PR
- ฝึกอบรมสมาชิกทีมใหม่ในแพตเทิร์นโครงสร้างพื้นฐาน

### ตัวอย่างผลลัพธ์การดูตัวอย่าง
ผลลัพธ์การดูตัวอย่างจะแตกต่างกันตามผู้ให้บริการและโครงสร้างโปรเจกต์ แต่ควรระบุชัดเจนถึงการเปลี่ยนแปลงที่เสนอไว้ก่อนที่จะมีการใช้จริง

```bash
$ azd provision --preview

🔍 Previewing infrastructure changes...

The following resources will be created:
  + azurerm_resource_group.rg
  + azurerm_app_service_plan.plan
  + azurerm_linux_web_app.web
  + azurerm_cosmosdb_account.cosmos

The following resources will be modified:
  ~ azurerm_key_vault.kv
    ~ access_policy (forces replacement)

The following resources will be destroyed:
  - azurerm_storage_account.old_storage

⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## �🔄 การอัปเดตและย้ายทรัพยากร

### การอัปเดตทรัพยากรอย่างปลอดภัย
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อน (แนะนำ)
azd provision --preview

# ใช้การเปลี่ยนแปลงหลังจากยืนยันการดูตัวอย่าง
azd provision --confirm-with-no-prompt

# สำหรับการย้อนกลับ ให้ใช้ Git เพื่อย้อนกลับการเปลี่ยนแปลงโครงสร้างพื้นฐาน:
git revert HEAD  # ย้อนกลับ commit โครงสร้างพื้นฐานล่าสุด
azd provision    # ใช้สถานะโครงสร้างพื้นฐานก่อนหน้า
```

### การย้ายฐานข้อมูล
```bicep
resource migrationScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'database-migration'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.40.0'
    scriptContent: '''
      # Install database migration tools
      npm install -g db-migrate db-migrate-pg
      
      # Run migrations
      db-migrate up --config database.json --env production
      
      echo "Database migration completed successfully"
    '''
    environmentVariables: [
      {
        name: 'DATABASE_URL'
        secureValue: databaseConnectionString
      }
    ]
    timeout: 'PT30M'
    cleanupPreference: 'OnSuccess'
  }
}
```

## 🎯 แนวทางปฏิบัติที่ดีที่สุด

### 1. ข้อกำหนดการตั้งชื่อทรัพยากร
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. กลยุทธ์การแท็ก
```bicep
var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'created-date': utcNow('yyyy-MM-dd')
}
```

### 3. การตรวจสอบพารามิเตอร์
```bicep
@description('Environment name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Location for resources')
@allowed(['eastus2', 'westus2', 'centralus'])
param location string

@description('App Service SKU')
@allowed(['B1', 'B2', 'S1', 'S2', 'P1v3', 'P2v3'])
param appServiceSku string = 'B1'
```

### 4. การจัดระเบียบผลลัพธ์
```bicep
// Service endpoints
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output API_URL string = 'https://${apiApp.properties.defaultHostName}'

// Resource identifiers
output WEB_APP_NAME string = webApp.name
output API_APP_NAME string = apiApp.name
output DATABASE_NAME string = database.name

// Connection strings (for secure reference)
output DATABASE_CONNECTION_STRING_KEY string = '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
```

## ขั้นตอนต่อไป

- [การวางแผนก่อนปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - ตรวจสอบความพร้อมของทรัพยากร
- [ปัญหาทั่วไป](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาโครงสร้างพื้นฐาน
- [คู่มือดีบัก](../chapter-07-troubleshooting/debugging.md) - ดีบักปัญหาการจัดเตรียม
- [การเลือก SKU](../chapter-06-pre-deployment/sku-selection.md) - เลือกระดับบริการที่เหมาะสม

## แหล่งข้อมูลเพิ่มเติม

- [เอกสาร Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [เทมเพลต Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [คู่มือการปรับใช้](deployment-guide.md)
- **บทเรียนถัดไป**: [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
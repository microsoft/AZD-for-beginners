# การจัดเตรียมทรัพยากร Azure ด้วย AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - Infrastructure as Code & การปรับใช้งาน
- **⬅️ ก่อนหน้า**: [คู่มือการปรับใช้](deployment-guide.md)
- **➡️ บทถัดไป**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)
- **🔧 ที่เกี่ยวข้อง**: [บทที่ 6: การตรวจสอบก่อนปรับใช้งาน](../chapter-06-pre-deployment/capacity-planning.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกสิ่งที่คุณต้องรู้เกี่ยวกับการจัดเตรียมและจัดการทรัพยากร Azure โดยใช้ Azure Developer CLI เรียนรู้วิธีการใช้รูปแบบ Infrastructure as Code (IaC) ตั้งแต่การสร้างทรัพยากรพื้นฐานจนถึงสถาปัตยกรรมโครงสร้างพื้นฐานระดับองค์กรขั้นสูงโดยใช้ Bicep, แม่แบบ ARM, Terraform และ Pulumi

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้สำเร็จ คุณจะ:
- เชี่ยวชาญหลักการ Infrastructure as Code และการจัดเตรียมทรัพยากร Azure
- เข้าใจผู้ให้บริการ IaC หลายรายที่ Azure Developer CLI รองรับ
- ออกแบบและใช้งานแม่แบบ Bicep สำหรับสถาปัตยกรรมแอปพลิเคชันทั่วไป
- กำหนดค่าพารามิเตอร์ทรัพยากร ตัวแปร และการตั้งค่าสภาพแวดล้อมเฉพาะ
- ใช้รูปแบบโครงสร้างพื้นฐานขั้นสูงรวมถึงเครือข่ายและความปลอดภัย
- จัดการวงจรชีวิตทรัพยากร อัปเดต และการแก้ไขข้อขัดแย้งของการพึ่งพา

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- ออกแบบและจัดเตรียมโครงสร้างพื้นฐาน Azure โดยใช้ Bicep และแม่แบบ ARM
- กำหนดค่าสถาปัตยกรรมการบริการหลายอย่างที่ซับซ้อนพร้อมการพึ่งพาทรัพยากรอย่างเหมาะสม
- ใช้แม่แบบที่มีพารามิเตอร์สำหรับหลายสภาพแวดล้อมและการตั้งค่าต่าง ๆ
- แก้ไขปัญหาการจัดเตรียมโครงสร้างพื้นฐานและแก้ไขข้อผิดพลาดการปรับใช้
- ใช้หลักการของ Azure Well-Architected Framework ในการออกแบบโครงสร้างพื้นฐาน
- จัดการการอัปเดตโครงสร้างพื้นฐานและใช้กลยุทธ์การเวอร์ชันโครงสร้างพื้นฐาน

## ภาพรวมการจัดเตรียมโครงสร้างพื้นฐาน

Azure Developer CLI รองรับผู้ให้บริการ Infrastructure as Code (IaC) หลายราย:
- **Bicep** (แนะนำ) - ภาษาเฉพาะทางของ Azure
- **แม่แบบ ARM** - แม่แบบ Azure Resource Manager ที่ใช้ JSON
- **Terraform** - เครื่องมือโครงสร้างพื้นฐานแบบ Multi-cloud
- **Pulumi** - โครงสร้างพื้นฐานยุคใหม่ที่ใช้ภาษาการเขียนโปรแกรม

## การทำความเข้าใจทรัพยากรของ Azure

### ลำดับชั้นของทรัพยากร
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### บริการ Azure ทั่วไปสำหรับแอปพลิเคชัน
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## แม่แบบโครงสร้างพื้นฐาน Bicep

### โครงสร้างแม่แบบ Bicep พื้นฐาน
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

### รูปแบบ Bicep ขั้นสูง

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

## 🔒 ความปลอดภัยและการจัดการความลับ

### การผสาน Key Vault
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

## 🌍 การเชื่อมต่อเครือข่าย

### กำหนดค่า Virtual Network
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

## 📊 การตรวจสอบและการสังเกตการณ์

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

### เมตริกและการแจ้งเตือนแบบกำหนดเอง
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

### ไฟล์พารามิเตอร์สำหรับสภาพแวดล้อมต่าง ๆ
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

## 🚀 รูปแบบการจัดเตรียมขั้นสูง

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

## 🧪 การดูตัวอย่าง & การตรวจสอบโครงสร้างพื้นฐาน (ใหม่)

### ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนปรับใช้

ฟีเจอร์ `azd provision --preview` ช่วยให้คุณ **จำลองการจัดเตรียมโครงสร้างพื้นฐาน** ก่อนที่จะปรับใช้ทรัพยากรจริง ๆ ซึ่งคล้ายกับ `terraform plan` หรือ `bicep what-if` ช่วยให้คุณเห็น **ภาพรวมการดำเนินการโดยไม่ทำการเปลี่ยนแปลงจริง**

#### 🛠️ สิ่งที่มันทำ
- **วิเคราะห์แม่แบบ IaC ของคุณ** (Bicep หรือ Terraform)
- **แสดงตัวอย่างการเปลี่ยนแปลงทรัพยากร** ได้แก่ การเพิ่ม ลบ หรืออัปเดต
- **ไม่ปรับเปลี่ยนทรัพยากรจริง** — อ่านได้อย่างเดียวและปลอดภัยในการใช้งาน

#### กรณีการใช้งาน
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อนการปรับใช้
azd provision --preview

# ดูตัวอย่างสำหรับสภาพแวดล้อมเฉพาะ
azd provision --preview -e production
```

คำสั่งนี้ช่วยให้คุณ:
- **ตรวจสอบการเปลี่ยนแปลงโครงสร้างพื้นฐาน** ก่อนยืนยันการจัดเตรียมทรัพยากร
- **จับข้อผิดพลาดของการตั้งค่าที่ผิดพลาดได้ตั้งแต่เนิ่น ๆ** ในวงจรการพัฒนา
- **ทำงานร่วมกันอย่างปลอดภัย** ในสภาพแวดล้อมของทีม
- **มั่นใจในการปรับใช้แบบสิทธิ์น้อยสุด** โดยไม่มีสิ่งไม่คาดคิด

เหมาะอย่างยิ่งเมื่อ:
- ทำงานกับสภาพแวดล้อมหลายบริการที่ซับซ้อน
- ทำการเปลี่ยนแปลงโครงสร้างพื้นฐานในสภาพแวดล้อมการผลิต
- ตรวจสอบการแก้ไขแม่แบบก่อนอนุมัติ PR
- ฝึกอบรมสมาชิกใหม่ในทีมเกี่ยวกับรูปแบบโครงสร้างพื้นฐาน

### ตัวอย่างผลลัพธ์ตัวอย่าง
ผลลัพธ์ตัวอย่างจะแตกต่างตามผู้ให้บริการและโครงสร้างโปรเจกต์ แต่ควรแสดงการเปลี่ยนแปลงที่เสนออย่างชัดเจนก่อนดำเนินการใด ๆ

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

## �🔄 การอัปเดตและการย้ายทรัพยากร

### การอัปเดตทรัพยากรอย่างปลอดภัย
```bash
# ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐานก่อน (แนะนำ)
azd provision --preview

# ใช้การเปลี่ยนแปลงหลังจากยืนยันดูตัวอย่าง
azd provision --confirm-with-no-prompt

# สำหรับการย้อนกลับ ให้ใช้ Git เพื่อย้อนกลับการเปลี่ยนแปลงโครงสร้างพื้นฐาน:
git revert HEAD  # ย้อนกลับคอมมิทโครงสร้างพื้นฐานล่าสุด
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

### 1. แนวทางการตั้งชื่อทรัพยากร
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. กลยุทธ์การติดแท็ก
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

### 4. การจัดระเบียบข้อมูลผลลัพธ์
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

## ขั้นตอนถัดไป

- [การวางแผนก่อนปรับใช้](../chapter-06-pre-deployment/capacity-planning.md) - ตรวจสอบความพร้อมของทรัพยากร
- [ปัญหาทั่วไป](../chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาโครงสร้างพื้นฐาน
- [คู่มือการดีบัก](../chapter-07-troubleshooting/debugging.md) - ดีบักปัญหาการจัดเตรียม
- [การเลือก SKU](../chapter-06-pre-deployment/sku-selection.md) - เลือกระดับบริการที่เหมาะสม

## แหล่งข้อมูลเพิ่มเติม

- [เอกสาร Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [แม่แบบ Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบงาน Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [คู่มือการปรับใช้](deployment-guide.md)
- **บทเรียนถัดไป**: [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้องได้ เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้บริการแปลโดยผู้เชี่ยวชาญทางภาษา เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
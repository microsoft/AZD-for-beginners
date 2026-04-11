# ការផ្ដល់ធនធាន Azure ជាមួយ AZD

**ការនាវាទៅមុខបៀបភាគ៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**៖ [AZD សម្រាប់អ្នកเริ่มต้น](../../README.md)
- **📖 ប្រាក់ភាគបច្ចុប្បន្ន**៖ ប្រាក់ភាគ 4 - សំណង់និងការចាត់ចែងជាអក្សរ
- **⬅️ មុនหน้านี้**៖ [មគ្គុទេសក៍ចាត់ចែង](deployment-guide.md)
- **➡️ ប្រាក់ភាគបន្ទាប់**៖ [ប្រាក់ភាគ 5: ដំណោះស្រាយ AI ជាមួយភេជ្ជៈច្រើន](../../examples/retail-scenario.md)
- **🔧 ទាក់ទង**៖ [ប្រាក់ភាគ 6: ការផ្ទៀងផ្ទាត់មុនការចាត់ចែង](../chapter-06-pre-deployment/capacity-planning.md)

## ការណែនាំ

មាគ្គុទេសក៍នេះគ្របដណ្ដប់អ្វីគ្រប់យ៉ាងដែលអ្នកត្រូវចេះអំពីការផ្ដល់និងគ្រប់គ្រងធនធាន Azure ដោយប្រើ Azure Developer CLI។ រៀនរបៀបអនុវត្តន៍រចនាប័ទ្មសំណង់ជាអក្សរ (IaC) ចាប់បង្កើតធនធានមូលដ្ឋានរហូតដល់សំណង់កម្រិតសហគ្រាសដែលឧស្សាហកម្មប្រើដោយប្រើ Bicep, ម៉ូដែល ARM, Terraform និង Pulumi។

## គោលដៅសិក្សា

ដោយបញ្ចប់មាគ្គុទេសក៍នេះ អ្នកនឹងអាច៖
- ជំនាញធាតុសម្បទារបស់ Infrastructure as Code និងការផ្ដល់ធនធាន Azure
- យល់ដឹងអំពីអ្នកផ្គត់ផ្គង់ IaC ច្រើនដែល Azure Developer CLI គាំទ្រ
- រចនា និងអនុវត្តម៉ូដែល Bicep សម្រាប់សំណង់កម្មវិធីទូទៅ
- កំណត់ប៉ារ៉ាម៉ែត្រ វ៉ារីអាប លក្ខខណ្ឌតាមបរិស្ថាន
- អនុវត្តបែបបទសំណង់ដំណើរការខ្ពស់រួមមានបណ្តាញនិងសន្តិសុខ
- គ្រប់គ្រងវិវត្តន៍ធនធាន ការអាប់ដេត និងការដោះស្រាយការពឹងផ្អែក

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- រចនានិងផ្ដល់សំណង់ Azure ដោយប្រើម៉ូដែល Bicep និង ARM
- កំណត់សំណង់ភាគីច្រើនជាមួយការពឹងផ្អែកធនធានត្រឹមត្រូវ
- អនុវត្តម៉ូដែលប៉ារ៉ាម៉ែត្រតាមបរិស្ថាន និងការកំណត់ខុសៗគ្នា
- ដោះសោកញ្ហាក្នុងការផ្ដល់សំណង់ និងដោះសោបញ្ហាដាក់ពាក្យបរាជ័យ
- ប្រើប្រាស់គោលការណ៍ Azure Well-Architected Framework សម្រាប់រចនាសំណង់
- គ្រប់គ្រងការអាប់ដេតសំណង់ និងអនុវត្តយុទ្ធសាស្ត្រវើសិនសំណង់

## សង្ខេបការផ្ដល់សំណង់

Azure Developer CLI គាំទ្រអ្នកផ្គត់ផ្គង់ Infrastructure as Code ច្រើន៖
- **Bicep** (ផ្តល់អនុសាសន៍) - ភាសាដែលមានលក្ខណៈពិសេសរបស់ Azure
- **ម៉ូដែល ARM** - ម៉ូដែល Azure Resource Manager ជា JSON
- **Terraform** - ឧបករណ៍សំណង់ពហុពពក
- **Pulumi** - សំណង់ជាអក្សរបែបទំនើប ជាមួយភាសាបម្មវិធី

## ការយល់ដឹងអំពីធនធាន Azure

### បណ្តុះបណ្តាលធនធាន
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### សេវាអាមទាំងអស់មានប្រយោជន៍សម្រាប់កម្មវិធី
- **កំណត់គណនេយ្យ**៖ App Service, Container Apps, Functions, Virtual Machines
- **ផ្ទុកទិន្នន័យ**៖ Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **បណ្តាញ**៖ Virtual Network, Application Gateway, CDN
- **សន្តិសុខ**៖ Key Vault, Application Insights, Log Analytics
- **AI/ML**៖ Cognitive Services, OpenAI, Machine Learning

## ម៉ូដែលសំណង់ Bicep

### រចនាសម្ព័ន្ធម៉ូដែល Bicep មូលដ្ឋាន
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

### បែបបទ Bicep ជំហានខ្ពស់

#### សំណង់ម៉ូឌុល
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

#### ការបង្កើតធនធានតាមលក្ខខណ្ឌ
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

## 🗃️ ការផ្ដល់មូលដ្ឋានទិន្នន័យ

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

## 🔒 សន្តិសុខ និងការគ្រប់គ្រងសម្ងាត់

### ការបញ្ជូល Key Vault
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

### ការកំណត់ Managed Identity
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

## 🌍 បណ្តាញ និងការតភ្ជាប់

### ការកំណត់ Virtual Network
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

### Application Gateway ជាមួយ SSL
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

## 📊 ការត្រួតពិនិត្យ និងការមើលឃើញ

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

### ម៉ែត្រប្រែប្រួល និងការពន្លឿន
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

## 🔧 ការកំណត់បរិស្ថានជាក់លាក់

### ឯកសារប៉ារ៉ាម៉ែត្រ សម្រាប់បរិស្ថានខុសៗគ្នា
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

### ការផ្ដល់ធនធានតាមលក្ខខណ្ឌ
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

## 🚀 បែបបទផ្ដល់សំណង់ជំហានខ្ពស់

### ការចាត់ចែងពហុតំបន់
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

### ការពិនិត្យលទ្ធផលសំណង់
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

## 🧪 មើលមុខ និងការផ្ទៀងផ្ទាត់សំណង់ (ថ្មី)

### មើលមុខការផ្លាស់ប្តូរសំណង់មុនចាត់ចែង

មុខងារ `azd provision --preview` អនុញ្ញាតិឲ្យអ្នក **សមមូលការផ្ដល់សំណង់** មុនការដាក់ពាក្យពេញលេញ។ វាដូចជា `terraform plan` ឬ `bicep what-if` មានទស្សនមុខ **ប្រតិបត្តិការស្ងួត** អំពីការផ្លាស់ប្តូរដែលនឹងកើតឡើងក្នុងបរិស្ថាន Azure របស់អ្នក។

#### 🛠️ វាធ្វើអ្វី
- **វិភាគម៉ូដែល IaC របស់អ្នក** (Bicep ឬ Terraform)
- **បង្ហាញមើលមុខការផ្លាស់ប្តូរធនធាន**៖ ការបន្ថែម, ការលុប, ការអាប់ដេត
- **មិនអនុវត្តការផ្លាស់ប្តូរ** — មើលបានតែតែម្ដង និងមានសុវត្ថិភាព

#### ករណីប្រើប្រាស់
```bash
# មើលមុនការផ្លាស់ប្តូររចនាសម្ព័ន្ធមុនពេលដាក់បញ្ចូល
azd provision --preview

# មើលជាមុនសម្រាប់បរិយាកាសជាក់លាក់
azd provision --preview -e production
```

ពាក្យបញ្ជានេះជួយអ្នក៖
- **ផ្ទៀងផ្ទាត់ការផ្លាស់ប្តូរសំណង់** មុនការទទួលភារកិច្ចធនធាន
- **ចាប់កំហុសក្នុងការកំណត់តម្លៃឆាប់ នៅវដ្តការអភិវឌ្ឍន៍**
- **សហការយ៉ាងសុវត្ថិភាព** ក្នុងបរិស្ថានក្រុម
- **ធានាការចាត់ចែងតិចបំផុត ទំហំត្រឹមត្រូវគ្មានការភ្ញាក់ផ្អើល**

វាមានប្រយោជន៍ជាពិសេសពេល៖
- ធ្វើការជាមួយបរិស្ថានសេវាច្រើនស្មុគស្មាញ
- ប្រែប្រួលសំណង់ផលិតកម្ម
- ផ្ទៀងផ្ទាត់ការផ្លាស់ប្តូរម៉ូដែល មុនការអនុម័ត PR
- បណ្តុះបណ្តាលសមាជិកថ្មីលើបែបបទសំណង់

### ឧទាហរណ៍ធ្វើមើលមុខលទ្ធផល
លទ្ធផលមើលមុខត្រូវផ្សេងគ្នាចំពោះអ្នកផ្គត់ផ្គង់និងរចនាសម្ព័ន្ធគម្រោង ប៉ុន្តាលទ្ធផលគួរតែបញ្ជាក់យ៉ាងច្បាស់អំពីការផ្លាស់ប្តូរដែលស្នើមុនពេលអ្វីៗត្រូវបានអនុវត្ត។

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

## �🔄 ការអាប់ដេត និងបម្លែងធនធាន

### ការអាប់ដេតធនធានមានសុវត្ថិភាព
```bash
# ពិនិត្យមើលការផ្លាស់ប្តូររចនាសម្ព័ន្ធជាមុន (ណែនាំ)
azd provision --preview

# អនុវត្តការផ្លាស់ប្តូរបន្ទាប់ពីបញ្ជាក់ការពិនិត្យមើល
azd provision --confirm-with-no-prompt

# សម្រាប់ការវិលត្រឡប់, ប្រើ Git ដើម្បីត្រឡប់ការផ្លាស់ប្តូររចនាសម្ព័ន្ធ:
git revert HEAD  # ត្រឡប់ការបន្ដCommit រចនាសម្ព័ន្ធចុងក្រោយ
azd provision    # អនុវត្តស្ថានភាពរចនាសម្ព័ន្ធមុននោះ
```

### ការបម្លែងមូលដ្ឋានទិន្នន័យ
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

## 🎯 អនុវត្តន៍ល្អបំផុត

### 1. គោលការណ៍ដាក់ឈ្មោះធនធាន
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. នយោបាយតាក់ស្លាក
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

### 3. ការផ្ទៀងផ្ទាត់ប៉ារ៉ាម៉ែត្រ
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

### 4. ការរៀបចំលទ្ធផលចេញ
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

## ជំហានបន្ទាប់

- [ផែនការមុនការចាត់ចែង](../chapter-06-pre-deployment/capacity-planning.md) - ផ្ទៀងផ្ទាត់ការត្រូវមានធនធាន
- [បញ្ហាទូទៅ](../chapter-07-troubleshooting/common-issues.md) - ដោះស្រាយបញ្ហាសំណង់
- [មគ្គុទេសក៍ដំណោះស្រាយកំហុស](../chapter-07-troubleshooting/debugging.md) - ពិនិត្យកំហុសការផ្ដល់សំណង់
- [ជម្រើស SKU](../chapter-06-pre-deployment/sku-selection.md) - ជ្រើសរើសថ្នាក់សេវាកម្មសមរម្យ

## ឯកសារបន្ថែម

- [ឯកសារ Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [ម៉ូដែល Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [មជ្ឈមណ្ឌលសំណង់ Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ការនាវាទៅមុខ**
- **មេរៀនមុន**៖ [មគ្គុទេសក៍ចាត់ចែង](deployment-guide.md)
- **មេរៀនបន្ទាប់**៖ [ផែនការបម្រុងទុក](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលដែលយើងខំប្រឹងត្រឹមត្រូវច្បាស់លាស់ សូមគោរពដឹងថាការបកប្រែដោយស្វ័យប្រវត្តិសមត្ថភាពអាចមានកំហុស ឬមានភាពមិនត្រឹមត្រូវ។ ឯកសារដើមនៅក្នុងភាសាដើមត្រូវបានគេយកជាអត្ថប្រយោជន៍ផ្លូវការរបស់អត្ថបទនេះ។ សម្រាប់ព័ត៌មានសំខាន់ៗ អនុស្សរណៈអ្នកបកប្រែដែលមានជំនាញវិជ្ជាជីវៈមនុស្សត្រូវបានផ្តល់អនុសាសន៍។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកប្រែខុសបានកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
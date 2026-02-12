# AZD ဖြင့် Azure အရင်းအမြစ်များ ပံ့ပိုးခြင်း

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: အခန်း 4 - Infrastructure as Code နှင့် Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **➡️ Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Related**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## အမိန့်မိတ်ဆက်

ဤစုံလင်သောလမ်းညွှန်မှာ Azure Developer CLI ကို အသုံးပြုပြီး Azure အရင်းအမြစ်များကို ပံ့ပိုးခြင်းနှင့် စီမံခန့်ခွဲခြင်းအကြောင်း အားလုံးကို ဖုံးလွှမ်းပေးသည်။ Bicep၊ ARM templates၊ Terraform၊ နှင့် Pulumi တို့ကို အသုံးပြုပြီး မူလ အရင်းအမြစ်ဖန်တီးမှုမှ စ၍ စီးပွားရေးအဆင့်မြင့် အဆောက်အအုံပုံစံများထိ Infrastructure as Code (IaC) နည်းလမ်းများကို အကောင်အထည်ဖော်ခြင်းကို လေ့လာပါ။

## သင်ယူရန် ရည်ရွယ်ချက်များ

ဤလမ်းညွှန်ကို ပြီးမြောက်စေပါက သင်သည်:
- Infrastructure as Code သဘောတရားများနှင့် Azure အရင်းအမြစ် ပံ့ပိုးခြင်းကို ကျွမ်းကျင်စွာ လေ့လာနိုင်ပါမည်
- Azure Developer CLI က ထောက်ပံ့သည့် အမျိုးမျိုးသော IaC ပံ့ပိုးသူများကို နားလည်နိုင်မည်
- စေ့စပ်သော application architecture များအတွက် Bicep template များကို ဒီဇိုင်းရေးဆွဲ၍ တည်ဆောက်နိုင်မည်
- resource parameters၊ variables နှင့် ပတ်ဝန်းကျင်အလိုက် ချိန်ညှိမှုများကို ဖွဲ့စည်းနိုင်မည်
- ကွန်ယက်နှင့် လုံခြုံရေး အပါအဝင် အဆင့်မြင့် အင်ဖရာစထိတ်ပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- resource lifecycle၊ အပ်ဒိတ်များနှင့် dependency ဖြေရှင်းမှုကို စီမံနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြီးမြောက်သည်နှင့်အမျှ သင်သည်:
- Bicep နှင့် ARM template များကို အသုံးပြုပြီး Azure အင်ဖရာစထရပ်ချာများကို ဒီဇိုင်းရေးဆွဲ၍ ပံ့ပိုးနိုင်မည်
- သင့်တော်သော resource dependencies နှင့် အတူ စပ်ဆိုင်ရာ multi-service ပလက်ဖောင်းများကို ဖွဲ့စည်းနိုင်မည်
- မတူညီသော ပတ်ဝန်းကျင်များနှင့် ဖွဲ့စည်းမှုများအတွက် parameterized template များ ကို အကောင်အထည်ဖော်နိုင်မည်
- အင်ဖရာစထရပ်ချာ ပံ့ပိုးမှုအခက်အခဲများကို ပြဿနာရှာထုတ်ကာ deployment မအောင်မြင်မှုများကို ဖြေရှင်းနိုင်မည်
- Azure Well-Architected Framework သဘောတရားများကို အင်ဖရာစထရပ်ချာ ဒီဇိုင်းတွင် အကျုံးဝင်အသုံးပြုနိုင်မည်
- အင်ဖရာစထရပ်ချာ အပ်ဒိတ်များကို စီမံ၍ အင်ဖရာစထရပ်ချာ ဗားရှင်းမူထုတ်ယူခြင်း များကို ကျင့်သုံးနိုင်မည်

## အင်ဖရာစထရပ်ချာ ပံ့ပိုးမှု အကြည့်အရာ

Azure Developer CLI သည် အမျိုးမျိုးသော Infrastructure as Code (IaC) ပံ့ပိုးသူများကို ထောက်ပံ့သည် -
- **Bicep** (အကြံပြု) - Azure ၏ domain-specific ဘာသာစကား
- **ARM Templates** - JSON-based Azure Resource Manager templates
- **Terraform** - မျိုးစုံ cloud အင်ဖရာစထရပ်ချာ ကိရိယာ
- **Pulumi** - programming languages များဖြင့် ခေတ်မီ Infrastructure as Code

## Azure အရင်းအမြစ်များကို နားလည်ခြင်း

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### အပလီကေးရှင်းများအတွက် ပုံမှန် Azure ဝန်ဆောင်မှုများ
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep အင်ဖရာစထရပ်ချာ Templates

### မူလ Bicep Template ဖွဲ့စည်းပုံ
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

### အဆင့်မြင့် Bicep နမူနာများ

#### မော်ဂျူးလာ အဆောက်အအုံ
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

#### အခြေအနေ ပေါ်မူတည်၍ အရင်းအမြစ် ဖန်တီးခြင်း
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

## 🗃️ ဒေတာဘေ့စ် ပံ့ပိုးခြင်း

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

## 🔒 လုံခြုံရေးနှင့် လျှို့ဝှက်ချက် စီမံခြင်း

### Key Vault ပေါင်းစည်းခြင်း
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

### Managed Identity ဖွဲ့စည်းမှု
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

## 🌍 ကွန်ယက်နှင့် ချိတ်ဆက်မှု

### Virtual Network ဖွဲ့စည်းမှု
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

### SSL ပါသော Application Gateway
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

## 📊 မော်နിറ്റရင်းနှင့် ဖော်ပြနိုင်မှု

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

### စိတ်ကြိုက် ကိုးကားစံနှုန်းများနှင့် သတိပေးချက်များ
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

## 🔧 ပတ်ဝန်းကျင် အလိုက် ဖွဲ့စည်းမှုများ

### မတူညီသော ပတ်ဝန်းကျင်များအတွက် Parameter ဖိုင်များ
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

### အခြေအနေ ပေါ်မူတည်၍ အရင်းအမြစ် ပံ့ပိုးခြင်း
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

## 🚀 အဆင့်မြင့် ပံ့ပိုးရေး နမူနာများ

### အနယ်နယ်အရပ်ရပ် တပ်ဆင်ခြင်း
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

### အင်ဖရာစထရပ်ချာ စမ်းသပ်ခြင်း
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

## 🧪 အင်ဖရာစထရပ်ချာ ကြိုကြည့်နှင့် အတည်ပြုခြင်း (အသစ်)

### တပ်ဆင်မီ အဆောက်အအုံ ပြောင်းလဲမှုများကို ကြိုကြည့်ခြင်း

The `azd provision --preview` feature သည် သင်ကို ရင်းမြစ်များကို အကောင်အထည်ဖော်မတတ်ခင် အဆောက်အအုံ ပံ့ပိုးမှုကို **အတုစမ်းသပ်ရန်** ခွင့်ပြုသည်။ ၎င်းသည် `terraform plan` သို့မဟုတ် `bicep what-if` တို့နှင့် စိတ်ဓာတ်တူပြီး သင့် Azure ပတ်ဝန်းကျင်၌ ဘာတွေ ပြောင်းလဲမယ်ဆိုသည်ကို **dry-run ကြည့်ရှုခြင်း** ပေးသည်။

#### 🛠️ ၎င်းက ဘာတွေ ပြုလုပ်သလဲ
- **သင့် IaC template များကို বিশ্লেষण ပြုလုပ်သည်** (Bicep သို့မဟုတ် Terraform)
- **အရင်းအမြစ် ပြောင်းလဲမှုများ၏ ကြိုကြည့်နိဒါန်းကို ဖော်ပြသည်**: အသစ်ထည့်ခြင်း၊ ဖျက်ခြင်း၊ အပ်ဒိတ်လုပ်ခြင်း
- **ပြောင်းလဲမှုများကို အကောင်အထည်မဖော်ပါ** — ဖတ်-only ဖြစ်ပြီး လုံခြုံစိတ်ချစွာ လည်ပတ်နိုင်သည်

#### � Use Cases
```bash
# တပ်ဆင်မည့် မတိုင်မီ အခြေခံအဆောက်အအုံ ပြင်ဆင်မှုများကို ကြိုကြည့်ပါ
azd provision --preview

# အသေးစိတ် အထွက်ဖြင့် ကြိုကြည့်ပါ
azd provision --preview --output json

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်အတွက် ကြိုကြည့်ပါ
azd provision --preview --environment production
```

ဤ ကော်မန်း့သည် သင့်အား အောက်ပါအရာများတွင် ကူညီပေးသည် -
- **အရင်းအမြစ်များကို တပ်ဆင်မည်မီ ပြောင်းလဲမှုများကို အတည်ပြုသည်**
- **ဖွဲ့စည်းမှုမှားလွဲချက်များကို မကြာခဏ တွေ့ရှိနိုင်ရန် ကာကွယ်ပေးသည်**
- **အသင်းအဖွဲ့များအနေဖြင့် လုံခြုံစိတ်ချစွာ ပူးပေါင်းဆောင်ရွက်ရန် အထောက်အကူပြုသည်**
- **စောင့်မျှော်မှုမရှိဘဲ ကန့်သတ်ထားသော အခွင့်အရေးဖြင့် တပ်ဆင်မှုများ အကောင်အထည်ဖော်ရန် အာမခံပေးသည်**

အထူးသဖြင့် အောက်ပါအခြေအနေများတွင် အထောက်အကူဖြစ်သည် -
- စပ်ဆိုင်ရာ multi-service ပတ်ဝန်းကျင်များနှင့် အလုပ်လုပ်နေသောအခါ
- ထုတ်လုပ်မှု infrastructure ကို ပြင်ဆင်နေချိန်တွင်
- PR အတည်ပြုမှုမပြုမီ template ပြင်ဆင်မှုများကို စစ်ဆေးနေချိန်တွင်
- အင်ဖရာစထရပ်ချာ နမူနာများအပေါ် အသစ်ဝင်မည့် အဖွဲ့ဝင်များအား သင်ကြားနေချိန်တွင်

### ဥပမာ ကြိုကြည့် ရလဒ်
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

📊 Estimated monthly cost: $45.67
⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## �🔄 အရင်းအမြစ် အပ်ဒိတ်များနှင့် မိုက်ဂရေးရှင်းများ

### လုံခြုံသော အရင်းအမြစ် အပ်ဒိတ်များ
```bash
# အင်ဖရာစထရပ်ချာ ပြောင်းလဲမှုများကို အရင်ကြိုကြည့်ပါ (အကြံပြု)
azd provision --preview

# ကြိုကြည့်ပြီး အတည်ပြုချက် ရရှိမှ ပြောင်းလဲမှုများကို အကောင်အထည်ဖော်ပါ
azd provision --confirm-with-no-prompt

# ပြန်လည်ပြန်လှည့်ရန် (rollback) အတွက် အင်ဖရာစထရပ်ချာ ပြောင်းလဲမှုများကို ပြန်သိမ်းရန် Git ကို အသုံးပြုပါ:
git revert HEAD  # နောက်ဆုံး အင်ဖရာစထရပ်ချာ commit ကို ပြန်သိမ်းပါ
azd provision    # ယခင် အင်ဖရာအခြေအနေကို ပြန်လည်အသုံးပြုပါ
```

### ဒေတာဘေ့စ် မိုက်ဂရေးရှင်းများ
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

## 🎯 အကောင်းဆုံး လက်တွေ့ကျကျ မျိုးစုံ

### 1. Resource Naming Conventions
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging Strategy
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

### 3. Parameter Validation
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

### 4. Output Organization
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

## နောက်ဆက်တွဲ အဆင့်များ

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ်ရရှိနိုင်မှုကို အတည်ပြုပါ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - အင်ဖရာစထရပ်ချာပြဿနာများကို ဖြေရှင်းပါ
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - ပံ့ပိုးမှုပြဿနာများကို debug လုပ်ပါ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - သင့်တော်သော service tier များကို ရွေးချယ်ပါ

## ထပ်မံ အသုံးဝင်သော အရင်းအမြစ်များ

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ တိကျမှန်ကန်မှု ရရှိစေရန် ကြိုးစားပေမယ့်၊ အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်ချက်များ ပါဝင်နိုင်ကြောင်း သတိပေးပါသည်။ မူလစာရွက်စာတမ်းကို မူလဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကြောင်းမြတ်သော လူ့ဘာသာပြန်ဝန်ထမ်းမှ ဘာသာပြန်ပေးရမည်ဟု အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းသော အဓိပ္ပာယ်ဖော်ခြင်းများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
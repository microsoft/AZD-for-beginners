# AZD ဖြင့် Azure အရင်းအမြစ်များ ဖန်တီးခြင်း

**Chapter Navigation:**
- **📚 Course Home**: [AZD စတင်လေ့လာသူများအတွက်](../../README.md)
- **📖 Current Chapter**: အခန်း 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [တပ်ဆင်ခြင်း လမ်းညွှန်](deployment-guide.md)
- **➡️ Next Chapter**: [အခန်း 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Related**: [အခန်း 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## နိဒါန်း

ဤ လမ်းညွှန်စာရွက်သည် Azure Developer CLI ကို အသုံးပြုပြီး Azure အရင်းအမြစ်များကို ဖန်တီး၊ စီမံခန့်ခွဲခြင်းနှင့် ပတ်သက်၍ လိုအပ်သည့် အချက်အလက်များအားလုံးကို လေ့လာပေးပါသည်။ Bicep၊ ARM templates၊ Terraform နှင့် Pulumi တို့ကို အသုံးပြု၍ အခြေခံအရင်းအမြစ် ဖန်တီးခြင်းမှ စ၍ လုပ်ငန်းအဆင့်မြင့် အင်ဖရာစထပ်ဖွဲ့စည်းမှုများထိ Infrastructure as Code (IaC) ပုံစံများကို အကောင်အထည်ဖော်နိုင်ရန် သင်ယူပါ။

## သင်ယူရမည့် ရည်မှန်းချက်များ

By completing this guide, you will:
- Infrastructure as Code 원칙များနှင့် Azure အရင်းအမြစ် ပေးပို့ခြင်းကို ကျွမ်းကျင်လာမည်
- Azure Developer CLI မှ ပံ့ပိုးထားသည့် IaC ပေးသွင်းသူများကို နားလည်မည်
- ပုံမှန် application စံနှုန်းများအတွက် Bicep တမ်ပလိတ်များ ডিজাইনနှင့် အကောင်အထည်ဖော်မည်
- အရင်းအမြစ် ပါရာမီတာများ၊ မာတိကာများနှင့် ပတ်ဝန်းကျင်အလိုက် ဆက်တင်များကို ဖန်တီးချိန်သိမြင်စွာ ပြင်ဆင်မည်
- ကွန်ရက်နှင့် လုံခြုံရေး အပါအဝင် တိုးတက်သော အင်ဖရာစထပ် ပုံစံများကို အကောင်အထည်ဖော်မည်
- အရင်းအမြစ် အလဲအပြောင်းများ၊ အပ်ဒိတ်များနှင့် တွဲဆက်မှု ဖြေရှင်းနည်းများကို စီမံခန့်ခွဲမည်

## သင်ယူပြီးရလဒ်များ

Upon completion, you will be able to:
- Bicep နှင့် ARM templates အသုံးပြုကာ Azure အင်ဖရာစထပ်ကို ဒီဇိုင်းဆွဲ၍ ပေးပို့နိုင်မည်
- သင့်အက်ပ်များအတွက် စနစ်တကျ အဆက်အသွယ်ရှိသော မျိုးစုံဆာဗစ်များ အတွက် ရှုပ်ထွေးသော ပြုပြင်ချိတ်ဆက်မှုများကို ဖန်တီးနိုင်မည်
- ပတ်ဝန်းကျင် အမျိုးမျိုးနှင့် ဖွဲ့စည်းတည်ဆောက်မှုများအတွက် ပါရာမီတာ ထည့်သွင်းထားသည့် တမ်ပလိတ်များကို အသုံးချနိုင်မည်
- အင်ဖရာစထပ် ပေးပို့ရာတွင် ဖြစ်သော ပြဿနာများကို ပြေရှင်းနိုင်မည်
- Azure Well-Architected Framework အခြေခံချက်များကို အင်ဖရာစထပ် ဒီဇိုင်းတွင် အကောင်အထည်ဖော်နိုင်မည်
- အင်ဖရာစထပ် အပ်ဒိတ်များကို စီမံပိုင်ခွင့်နှင့် ဗားရှင်းမီတာကျဆင်းမှုများအတွက် မျှော်မှန်းချက်များထားနိုင်မည်

## အင်ဖရာစထပ် ပေးပို့ခြင်း အကျဉ်းချုပ်

Azure Developer CLI သည် မျိုးစုံသော Infrastructure as Code (IaC) ပေးသွင်းသူများကို ပံ့ပိုးသည်။
- **Bicep** (အကြံပြု) - Azure အတွက် အထူးသတ်မှတ် ဘာသာစကား
- **ARM Templates** - JSON အခြေခံ Azure Resource Manager တမ်ပလိတ်များ
- **Terraform** - မျိုးစုံ cloud များအတွက် အင်ဖရာစထပ် ကိရိယာ
- **Pulumi** - ပရိုဂရမ်မင်းဘာသာစကားများဖြင့် ဆန်းသစ်သော Infrastructure as Code

## Azure အရင်းအမြစ်များ နားလည်ခြင်း

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### အက်ပ်များအတွက် ပုံမှန် Azure ဝန်ဆောင်မှုများ
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep အင်ဖရာစထပ် တမ်ပလိတ်များ

### အခြေခံ Bicep တမ်ပလိတ် ဖွဲ့စည်းပုံ
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

### တိုးတက်သော Bicep ပုံစံများ

#### မော်ဂျူးလာ အင်ဖရာစထပ်
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

#### အခြေအနေ အပေါ် မူတည်၍ အရင်းအမြစ် ဖန်တီးခြင်း
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

## 🗃️ ဒေတာဘေ့စ် ပေးပို့ခြင်း

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

## 🔒 လုံခြုံရေးနှင့် လျှို့ဝှက်ချက် စီမံခန့်ခွဲခြင်း

### Key Vault အတူခေါင်းစဉ် ဆက်စပ်မှု
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

### Managed Identity ဖွဲ့စည်းခြင်း
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

## 🌍 ကွန်ရက်နှင့် ချိတ်ဆက်မှု

### Virtual Network သတ်မှတ်ချက်
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

### SSL ပါသည့် Application Gateway
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

## 📊 စောင့်ကြည့်ခြင်းနှင့် မျက်နှာပြင်မြင်သာရေး

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

### ကိုယ်ပိုင် မက်ထရစ်များနှင့် သတိပေးချက်များ
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

## 🔧 ပတ်ဝန်းကျင်အလိုက် သတ်မှတ်ချက်များ

### ပတ်ဝန်းကျင် မတူညီစွာ အတွက် ပါရာမီတာ ဖိုင်များ
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

### အခြေအနေ အပေါ် မူတည်၍ အရင်းအမြစ် ပေးပို့ခြင်း
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

## 🚀 တိုးတက်သော ပေးပို့မှု ပုံစံများ

### ဒေသ အများအပြား တပ်ဆင်ခြင်း
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

### အင်ဖရာစထပ် စမ်းသပ်ခြင်း
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

## 🧪 အင်ဖရာစထပ် ကြိုကြည့်ခြင်းနှင့် အတည်ပြုခြင်း (အသစ်)

### တပ်ဆင်ရန်မပြုမီ အင်ဖရာစထပ် ပြောင်းလဲမှုများကို ကြိုကြည့်ပါ

The `azd provision --preview` feature သည် အရင်းအမြစ်များကို တကယ်တန်ဆောင်မပြုမီ အင်ဖရာစထပ် ပေးပို့ခြင်းကို **သရုပ်ပြ စမ်းသပ်ရန်** ခွင့်ပြုသည်။ ၎င်းသည် `terraform plan` သို့မဟုတ် `bicep what-if` တို့နှင့် ယာယီတွေ့ဆုံမှုတူပြီး သင့် Azure ပတ်ဝန်းကျင်တွင် ဘာများပြောင်းလဲမည်ကို **ဖက်ရွက်မဟုတ်သည့် ကြိုကြည့်ရှုမြင်ချက် (dry-run view)** တစ်ရပ် ပေးသည်။

#### 🛠️ ၎င်း လုပ်ဆောင်ပုံ
- **သင့် IaC တမ်ပလိတ်များကို ချက်ချင်း လေ့လာသုံးသပ်သည်** (Bicep သို့မဟုတ် Terraform)
- **အရင်းအမြစ် ပြောင်းလဲမှုများ၏ ကြိုကြည့်ရှုချက်ကို ပြထားသည်**: ထပ်ထည့်ခြင်းများ၊ ဖျက်သိမ်းခြင်းများ၊ အပ်ဒိတ်များ
- **ပြောင်းလဲမှုများကို မကျင့်ကြံပါ** — ရုပ်ရှင်ဖတ်သာပင်သာဖြစ်ပြီး အလုပ်လုပ်ရန် လုံခြုံသည်

#### အသုံးချမှုအခြေအနေများ
```bash
# တပ်ဆင်မီ အင်ဖရားစနစ်ပြောင်းလဲမှုများကို ကြိုမြင်ကြည့်ပါ
azd provision --preview

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်အတွက် ကြိုမြင်ကြည့်ပါ
azd provision --preview -e production
```

ဤ command သည် သင့်အား အောက်ပါအရာများတွင် ကူညီပေးသည်:
- **အရင်းအမြစ် ပြောင်းလဲမှုများကို အတည်ပြုရန်** ရောအောင် သတ်မှတ်နိုင်ရန်
- **အမှားဖွဲ့စည်းမှုများကို မကြာမီ သိရှိနိုင်ရန်**
- **အဖွဲ့လိုက် ပူးပေါင်းဆောင်ရွက်မှုကို လုံခြုံစိတ်ချစေမှု**
- **မမျှော်လင့်နိုင်သည့် အကန့်အသတ်များမရှိဘဲ အနည်းဆုံး ခွင့်ပြုပေးမှုဖြင့် တပ်ဆင်နိုင်ရေး Ensure လုပ်ခြင်း**

ထို့အပြင် အောက်ပါအခြေအနေများတွင် အထူးအသုံးဝင်သည် -
- ရှုပ်ထွေးသော မျိုးစုံဆာဗစ် ပတ်ဝန်းကျင်များနှင့် အလုပ်လုပ်သည့်အခါ
- ထုတ်လုပ်မှု အင်ဖရာစထပ်ကို ပြောင်းလဲရာတွင်
- PR အတည်ပြုပြီ မတိုင်ခင် တမ်ပလိတ်ပြင်ဆင်မှုများကို အတည်ပြုချင်သည့်အခါ
- အင်ဖရာစထပ် ပုံစံများအပေါ် အသစ်တက်လာသော အဖွဲ့ဝင်များကို လေ့ကျင့်ရန်

### ဥပမာ ကြိုကြည့်ထွက်ရှိချက်
တိကျသည့် ကြိုကြည့် ထွက်ရှိချက်သည် ပေးသွင်းသူနှင့် project ဖွဲ့စည်းပုံအပေါ် မူတည်၍ ကွာခြားနိုင်သည်၊ သို့သော် ရလဒ်သည် အရာအားလုံး မကျင့်သေးမီ အကြောင်းအရာပြောင်းလဲမှုများကို ရှင်းလင်းစေသင့်သည်။

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

## �🔄 အရင်းအမြစ် အပ်ဒိတ်များနှင့် ပြောင်းရွှေ့မှုများ

### လုံခြုံသေချာသော အရင်းအမြစ် အပ်ဒိတ်များ
```bash
# အင်ဖရာစထရပ်ချာ ပြောင်းလဲမှုများကို အရင်ဆုံး ကြိုကြည့်ပါ (အကြံပြု)
azd provision --preview

# ကြိုကြည့်ပြီး အတည်ပြုမှုရရှိမှ ပြောင်းလဲမှုများကို အကောင်အထည်ဖော်ပါ
azd provision --confirm-with-no-prompt

# rollback အတွက် Git ကို အသုံးပြုပြီး အင်ဖရာစထရပ်ချာ ပြောင်းလဲမှုများကို ပြန်လည်ဖျက်ပါ:
git revert HEAD  # နောက်ဆုံး အင်ဖရာစထရပ်ချာ commit ကို ပြန်လည်မူလအခြေအနေသို့ ပြန်လှန်ပါ
azd provision    # ယခင် အင်ဖရာစထရပ်ချာ အခြေအနေကို ပြန်လည်အသုံးပြုပါ
```

### ဒေတာဘေ့စ် ပြောင်းရွှေ့မှုများ
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

## 🎯 အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

### 1. အရင်းအမြစ် အမည်ပေးမှု ဧရိယာများ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging မူဝါဒ
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

### 3. ပါရာမီတာ အတည်ပြုခြင်း
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

### 4. ထွက်ရလဒ် စနစ်တကျ စီစဉ်ခြင်း
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

## နောက်တဆင့်များ

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် ရရှိနိုင်မှုကို အတည်ပြုပါ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - အင်ဖရာစထပ် ပြဿနာများကို ဖြေရှင်းပါ
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - ပေးပို့မှု ပြဿနာများကို ပြန်လည်ရှာဖွေပါ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - သင့်လျော်သော ဝန်ဆောင်မှု အဆင့်များကို ရွေးပါ

## အပိုဆောင်း ရင်းမြစ်များ

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [တပ်ဆင်ခြင်း လမ်းညွှန်](deployment-guide.md)
- **Next Lesson**: [စွမ်းရည် စီမံကိန်းဆွဲခြင်း](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုကို ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ အာဏာရှိသော အရင်းအမြစ်အဖြစ် သိမြင်စဉ်းစားသင့်သည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်ဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားလည်မှုပျက်ကွက်ခြင်းများ သို့မဟုတ် အဓိပ္ပာယ် မမှန်ခြင်းများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD ഉപയോഗിച്ച് Azure റിസോഴ്സുകൾ പ്രൊവിഷൻ ചെയ്യൽ

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 4 - ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ് & ഡിപ്ലോയ്മെന്റ്
- **⬅️ മുൻപത്തെ**: [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md)
- **➡️ അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 5: മൾട്ടി-എജന്റ് എഐ സൊല്യൂഷൻസ്](../../examples/retail-scenario.md)
- **🔧 ബന്ധപ്പെട്ടത്**: [അദ്ധ്യായം 6: പ്രീ-ഡിപ്ലോയ്മെന്റ് വാലിഡേഷൻ](../chapter-06-pre-deployment/capacity-planning.md)

## പരിചയം

Azure Developer CLI ഉപയോഗിച്ച് Azure റിസോഴ്സുകൾ പ്രൊവിഷൻ ചെയ്യുന്നതും മാനേജ്മെന്റും ചെയ്യുന്നതുമായി ബന്ധപ്പെട്ട എല്ലാ വിഷങ്ങളെയും ഈ സമഗ്ര മാർഗനിർദ്ദേശം ഉൾക്കൊള്ളുന്നു. Bicep, ARM ടെംപ്ലേറ്റുകൾ, ടെറാഫോം, പുലുമി എന്നിവ ഉപയോഗിച്ച് അടിസ്ഥാന റിസോഴ്സ് സൃഷ്ടിയിൽ നിന്ന് പ്രഗത്ഭ എന്റർപ്രൈസ്-ഗ്രേഡ് ഇൻഫ്രാസ്ട്രക്ചർ ആർക്കിടെക്ചറുകൾ വരെ ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ് (IaC) പാറ്റേണുകൾ നടപ്പിലാക്കുന്നത് പഠിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ മാർഗനിർദ്ദേശം പൂർണമാക്കുമ്പോൾ, നിങ്ങൾ ആകും:
- ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ് അടിസ്ഥാനങ്ങൾയും Azure റിസോഴ്‌സ് പ്രൊവിഷനിംഗും ആസ്വദിക്കുക
- Azure Developer CLI പിന്തുണക്കുന്ന പല IaC പ്രൊവൈഡറുകളേയും മനസ്സിലാക്കുക
- സാധാരണ അപ്ലിക്കേഷൻ ആർക്കിടെക്ചറുകൾക്കായി Bicep ടെംപ്ലേറ്റുകൾ രൂപകല്പന ചെയ്യുകയും നടപ്പിലാക്കുകയും ചെയ്യുക
- റിസോഴ്‌സ് പാരാമീറ്ററുകൾ, വേരിയബിളുകൾ, പരിസ്ഥിതി-സ്വഭാവമുള്ള ക്രമീകരണങ്ങൾ ക്രമീകരിക്കുക
- നെറ്റ്വർകിംഗ്, സുരക്ഷ ഉൾപ്പെടെയുള്ള മെച്ചപ്പെട്ട ഇൻഫ്രാസ്ട്രക്ചർ പാറ്റേണുകൾ നടപ്പിലാക്കുക
- റിസോഴ്‌സ് ലൈഫ്‌സൈകിള്‍, അപ്‌ഡേറ്റുകൾ, ഡിപ്പെൻഡൻസി പരിഹാരം മാനേജ് ചെയ്യുക

## പഠന ഫലങ്ങൾ

പഠനം പൂർത്തിയാക്കിയതിനു ശേഷം, നിങ്ങൾക്കും കഴിയും:
- Bicep, ARM ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് Azure ഇൻഫ്രാസ്ട്രക്ചർ രൂപകൽപ്പന ചെയ്യുകയും പ്രൊവിഷൻ ചെയ്യുകയും ചെയ്യുക
- യോജിച്ച റിസോഴ്‌സ് ഡിപ്പെൻഡൻസികളോടെ സങ്കീർണ്ണ മൾട്ടി-സർവിസ് ആർക്കിടെക്ചറുകൾ ക്രമീകരിക്കുക
- നിരവധി പരിസ്ഥിതികള്‍ക്കും ക്രമീകരണങ്ങൾക്കും പാരാമീറ്ററൈസ്ഡ് ടെംപ്ലേറ്റുകൾ നടപ്പിലാക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പ്രശ്നങ്ങൾ പരിശീലിച്ച് ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ പരിഹരിക്കുക
- Azure സുസ്ഥിരമായ ആർക്കിടെക്ചർ ഫ്രെയിംവർക്ക് തത്വങ്ങൾ ഇൻഫ്രാസ്ട്രക്ചർ ഡിസൈനിൽ പ്രയോഗിക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ അപ്‌ഡേറ്റുകൾ മാനേജ് ചെയ്യുകയും ഇൻഫ്രാസ്ട്രക്ചർ വേർഷനിംഗ് രീതികള്‍ നടപ്പിലാക്കുകയും ചെയ്യുക

## ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അവലോകനം

Azure Developer CLI പല ഇൻഫ്രാസ്ട്രക്ട്ചർ അസ്കോഡ് (IaC) പ്രൊവൈഡറുകളും പിന്തുണയ്ക്കുന്നു:
- **Bicep** (ശുപാർശ ചെയ്തു) - Azureന്റെ ഡൊമെയ്ൻ-സ്പസിഫിക് ലാംഗ്വേജ്
- **ARM Templates** - JSON-അടിസ്ഥാനപ്പെട്ട Azure റിസോഴ്‌സ് മാനേജർ ടെംപ്ലേറ്റുകൾ
- **Terraform** - മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രക്ചർ ടൂൾ
- **Pulumi** - പ്രോഗ്രാമിങ് ഭാഷകളോടുകൂടിയ ആധുനിക ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ്

## Azure റിസോഴ്‌സുകൾ മനസ്സിലാക്കൽ

### റിസോഴ്‌സ് ക്രമക്രമം
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ആപ്ലിക്കേഷനുകൾക്കുള്ള പൊതുവായ Azure സേവനങ്ങൾ
- **കമ്പ്യൂട്ട്**: ആപ് സർവീസ്, കണ്ടെയ്‌നർ ആപ്‌സ്, ഫങ്ഷൻസ്, വർച്ച്വൽ മെഷീനുകൾ
- **സ്റ്റോറേജ്**: സ്റ്റോറേജ് അക്കൗണ്ട്, കോസ്‌മോസ് ഡിബി, SQL ഡാറ്റാബേസ്, പോസ്റ്റ്‌ഗ്രെഎസ്‌എൽ
- **നെറ്റ്വർകിംഗ്**: വർച്ച്വൽ നെറ്റ്‌വർക്ക്, അപ്ലിക്കേഷൻ ഗേറ്റ്വേ, CDN
- **സുരക്ഷ**: കീ വാൾറ്റ്, അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ്, ലോഗ് അനാലിറ്റിക്സ്
- **AI/ML**: കോഗ്നിറ്റീവ് സർവീസസ്, ഓപ്പൺAI, മഷീൻ ലേണിംഗ്

## Bicep ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ

### അടിസ്ഥാന Bicep ടെംപ്ലേറ്റ് ഘടന
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

### പ്രഗത്ഭ Bicep പാറ്റേണുകൾ

#### മിയ്യൂളാർ ഇൻഫ്രാസ്ട്രക്ചർ
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

#### നിബന്ധനാപൂർണ്ണ റിസോഴ്‌സ് സൃഷ്ടി
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

## 🗃️ ഡാറ്റാബേസ് പ്രൊവിഷനിംഗ്

### കോസ്‌മോസ് DB
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

### പോസ്റ്റ്‌ഗ്രെഎസ്‌എൽ
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

## 🔒 സുരക്ഷയും രഹസ്യ മാനേജ്മെന്റും

### കീ വാൾറ്റ് ഇന്റഗ്രേഷൻ
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

### മാനേജ്ഡ് ഐഡന്റിറ്റി കോൺഫിഗറേഷൻ
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

## 🌍 നെറ്റ്വർകിംഗ് & കണക്ടിവിറ്റി

### വർച്ച്വൽ നെറ്റ്‌വർക്ക് കോൺഫിഗറേഷൻ
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

### SSL ഈടാക്കിയ അപ്ലിക്കേഷൻ ഗേറ്റ്വേ
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

## 📊 മോണിറ്ററിംഗ് & പ്രേക്ഷണക്ഷമത

### അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ്
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

### കസ്റ്റം മെട്രിക്‌സ് & അലേർട്ടുകൾ
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

## 🔧 പരിസ്ഥിതി-സ്വഭാവമുള്ള ക്രമീകരണങ്ങൾ

### വ്യത്യസ്ത പരിസ്ഥിതികൾക്കായുള്ള പാരാമീറ്റർ ഫയലുകൾ
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

### നിബന്ധനാപൂർണ്ണ റിസോഴ്‌സ് പ്രൊവിഷനിംഗ്
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

## 🚀 പ്രഗത്ഭ പ്രൊവിഷനിംഗ് പാറ്റേണുകൾ

### മൾട്ടി-റീജിയൺ ഡിപ്ലോയ്മെന്റ്
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

### ഇൻഫ്രാസ്ട്രക്ചർ ടെസ്റ്റിംഗ്
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

## 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യു & വാലിഡേഷൻ (പുതിയത്)

### ഡിപ്ലോയ്മെന്റ് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്‌യുക

`azd provision --preview` ഫീച്ചർ സ്രഷ്ടിക്കുന്ന പദവി മുതലിൽ **ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് സിമുലേറ്റ്** ചെയ്യാൻ നിങ്ങള്ക്ക് അനുവദിക്കുന്നു. ഇത് `terraform plan` അല്ലെങ്കിൽ `bicep what-if` എന്നതുപോലെയാണ്, നിങ്ങളുടെ Azure പരിസ്ഥിതിയിലെ എന്ത് മാറ്റങ്ങൾ സംഭവിക്കുമെന്നതിനൊരു **ഡ്രൈ-റൺ കാഴ്ച** നൽകുന്നു.

#### 🛠️ ഇത് ചെയ്യുന്നത്
- **നിങ്ങളുടെ IaC ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്യുന്നു** (Bicep അല്ലെങ്കിൽ Terraform)
- **റിസോഴ്‌സ് മാറ്റങ്ങളുടെ പ്രിവ്യൂ കാണിക്കുന്നു**: കൂട്ടിച്ചേർക്കൽ, നീക്കം, അപ്ഡേറ്റുകൾ
- **മാറ്റങ്ങൾ നടപ്പിലാക്കാറില്ല** — ഇത് വായിച്ചറിയാനുള്ളതാണ്, സുരക്ഷിതവും പ്രവർത്തിക്കാനും കഴിയുന്നതാണ്

#### ഉപയോഗം
```bash
# വിന്യാസം നടപ്പാക്കുന്നതിനുമുമ്പ് ഫെച് ഘടന മാറ്റങ്ങൾ
azd provision --preview

# പ്രത്യേക പരിസ്ഥിതിക്ക് ഫ്രിവ്യൂ
azd provision --preview -e production
```

ഈ കമാൻഡ് സഹായിക്കുന്നു:
- **റിസോഴ്‌സ് സൃഷ്ടിക്കുന്നതിന് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ സാധുത പരിശോധന ചെയ്യുക**
- **ഡവലപ്പ്മെന്റ് ചക്രത്തിൽ പിശകുകൾ നേരത്തെ പിടികൂടുക**
- **ടീം പരിസ്ഥിതികളിൽ സുരക്ഷിതമായി സഹകരിക്കുക**
- **അപ്രതീക്ഷിതത്വം ഇല്ലാതെ ഏറ്റവും കുറഞ്ഞ അധികാരത്തിലൂടെ ഡിപ്ലോയ്മെന്റ് ഉറപ്പാക്കുക**

വിശേഷിച്ച് ഇത് ഉപയോഗപ്രദമാണ്:
- സങ്കീർണ്ണ മൾട്ടി-സർവിസ് പരിസ്ഥിതികളിൽ പ്രവർത്തിക്കുമ്പോൾ
- ഉൽപ്പാദന ഇൻഫ്രാസ്ട്രക്ചറിൽ മാറ്റങ്ങൾ ചെയ്യുമ്പോൾ
- ടെംപ്ലേറ്റ് മാറ്റങ്ങൾ PR അംഗീകാരം előtt പരിശോദിക്കുമ്പോൾ
- പുതിയ ടീം അംഗങ്ങൾക്ക് ഇൻഫ്രാസ്ട്രക്ചർ പാറ്റേണുകൾ പരിശീലിപ്പിക്കുമ്പോൾ

### ഉദാഹരണ പ്രിവ്യൂ ഔട്ട്പുട്ട്
കൃത്യമായ പ്രിവ്യൂ ഔട്ട്പുട്ട് പ്രൊവൈഡർ, പ്രോജക്റ്റ് ഘടന അനുസരിച്ച് വ്യത്യാസമുണ്ടാകാം, എന്നാല്‍ ഫലം ഡയലേക്ക് പ്രപോസ്ഡ് മാറ്റങ്ങൾ വ്യക്തമായി തിരിച്ചറിയണം.

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

## 🔄 റിസോഴ്‌സ് അപ്‌ഡേറ്റ് & മൈഗ്രേഷൻസ്

### സുരക്ഷിത റിസോഴ്‌സ് അപ്‌ഡേറ്റുകൾ
```bash
# അടിസ്ഥാനസംഗ്രഹം മാറ്റങ്ങൾ ആദ്യം മുമ്പോട്ട് കാണുക (സംശോധന നിർദ്ദേശിച്ചിരിക്കുന്നു)
azd provision --preview

# മുമ്പോട്ടുള്ള സ്ഥിരീകരണത്തിന് ശേഷം മാറ്റങ്ങൾ പ്രയോജനം ചെയ്യുക
azd provision --confirm-with-no-prompt

# തിരിച്ചുപോയികാനുള്ളതിന്, Git ഉപയോഗിച്ച് അടിസ്ഥാനസംഗ്രഹം മാറ്റങ്ങൾ മടക്കി വെക്കുക:
git revert HEAD  # അവസാനത്തെ അടിസ്ഥാനസംഗ്രഹം കമ്മിറ്റ് മടക്കി വെക്കുക
azd provision    # മുമ്പത്തെ അടിസ്ഥാനസംഗ്രഹം നില പ്രയോജനം ചെയ്യുക
```

### ഡാറ്റാബേസ് മൈഗ്രേഷൻസ്
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

## 🎯 മികച്ച പ്രാക്ടീസുകൾ

### 1. റിസോഴ്‌സ് നെയ്മിംഗ് കൺവെൻഷനുകൾ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ടാഗിംഗ് സ്ട്രാറ്റജി
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

### 3. പാരാമീറ്റർ കാര്യക്ഷമത പരിശോധന
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

### 4. ഔട്ട്പുട്ട് സംഘടന
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

## അടുത്ത ചുവട്

- [പ്രീ-ഡിപ്ലോയ്മെന്റ് പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ലഭ്യത സാധുത പരിശോധിക്കുക
- [സാധാരണ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [ഡീബഗ് ഗൈഡ്](../chapter-07-troubleshooting/debugging.md) - പ്രൊവിഷനിംഗ് പ്രശ്നങ്ങൾ ഡീബഗ് ചെയ്യുക
- [SKU തിരഞ്ഞെടുക്കൽ](../chapter-06-pre-deployment/sku-selection.md) - അനുയോജ്യ സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കുക

## അധിക റസോഴ്‌സുകൾ

- [Azure Bicep ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ടെംപ്ലേറ്റുകൾ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure ആർക്കിടെക്ചർ സെന്റർ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure സുസ്ഥിരമായ ആർക്കിടെക്ചർ ഫ്രെയിംവർക്ക്](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md)
- **അടുത്ത പാഠം**: [ക്യാപാസിറ്റി പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**പ്രത്യാഖ്യാനം**:  
ഈ ദസ്താവേജ് AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം കൃത്യത стремിക്കുന്നു എങ്കിലും, യന്ത്രപരിഭാഷകളിൽ പിഴവ് അല്ലെങ്കിൽ അച്ചടക്കസമ്മതത്വമില്ലാതാകാം. പ്രാഥമിക ഭാഷയിലെ യഥാർത്ഥ ദസ്താവേജ് അധികാരസ്രോതസ്സായി പരിഗണിക്കപ്പെടണം. പ്രധാനപ്പെട്ട വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിക്കുന്നതിൽ ഉണ്ടാകുന്ന quaisquer തെറ്റിദ്ധാരണകൾക്കും ദയവായി ഞങ്ങളെ ഉത്തരവാദികളാക്കരുത്.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
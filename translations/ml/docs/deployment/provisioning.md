<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d02f62a3017cc4c95dee2c496218ac8a",
  "translation_date": "2025-11-24T23:28:35+00:00",
  "source_file": "docs/deployment/provisioning.md",
  "language_code": "ml"
}
-->
# AZD ഉപയോഗിച്ച് Azure റിസോഴ്സുകൾ പ്രൊവിഷൻ ചെയ്യുക

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 4 - ഇൻഫ്രാസ്ട്രക്ചർ എസ് കോഡ് & ഡിപ്ലോയ്മെന്റ്
- **⬅️ മുൻപത്തെ**: [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md)
- **➡️ അടുത്ത അധ്യായം**: [അധ്യായം 5: മൾട്ടി-ഏജന്റ് AI സൊല്യൂഷനുകൾ](../../examples/retail-scenario.md)
- **🔧 ബന്ധപ്പെട്ടത്**: [അധ്യായം 6: പ്രീ-ഡിപ്ലോയ്മെന്റ് വാലിഡേഷൻ](../pre-deployment/capacity-planning.md)

## പരിചയം

Azure Developer CLI ഉപയോഗിച്ച് Azure റിസോഴ്സുകൾ പ്രൊവിഷൻ ചെയ്യാനും മാനേജ് ചെയ്യാനും നിങ്ങൾ അറിയേണ്ടതെല്ലാം ഈ സമഗ്രമായ ഗൈഡിൽ ഉൾപ്പെടുത്തിയിരിക്കുന്നു. Bicep, ARM ടെംപ്ലേറ്റുകൾ, Terraform, Pulumi എന്നിവ ഉപയോഗിച്ച് അടിസ്ഥാന റിസോഴ്സ് സൃഷ്ടിയിൽ നിന്ന് എന്റർപ്രൈസ്-ഗ്രേഡ് ഇൻഫ്രാസ്ട്രക്ചർ ആർക്കിടെക്ചറുകൾ വരെ Infrastructure as Code (IaC) പാറ്റേണുകൾ നടപ്പിലാക്കാൻ പഠിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുന്നതിലൂടെ, നിങ്ങൾ:
- Infrastructure as Code പ്രിൻസിപ്പിളുകളും Azure റിസോഴ്സ് പ്രൊവിഷനിംഗും മാസ്റ്റർ ചെയ്യുക
- Azure Developer CLI പിന്തുണയ്ക്കുന്ന വിവിധ IaC പ്രൊവൈഡറുകൾ മനസ്സിലാക്കുക
- സാധാരണ ആപ്ലിക്കേഷൻ ആർക്കിടെക്ചറുകൾക്കായി Bicep ടെംപ്ലേറ്റുകൾ രൂപകൽപ്പന ചെയ്യുകയും നടപ്പിലാക്കുകയും ചെയ്യുക
- റിസോഴ്സ് പാരാമീറ്ററുകൾ, വേരിയബിളുകൾ, പരിസ്ഥിതി-സ്പെസിഫിക് ക്രമീകരണങ്ങൾ കോൺഫിഗർ ചെയ്യുക
- നെറ്റ്വർക്കിംഗ്, സെക്യൂരിറ്റി എന്നിവ ഉൾപ്പെടെയുള്ള ഉയർന്ന തലത്തിലുള്ള ഇൻഫ്രാസ്ട്രക്ചർ പാറ്റേണുകൾ നടപ്പിലാക്കുക
- റിസോഴ്സ് ലൈഫ്സൈക്കിൾ, അപ്ഡേറ്റുകൾ, ഡിപെൻഡൻസി റെസല്യൂഷൻ എന്നിവ മാനേജ് ചെയ്യുക

## പഠന ഫലങ്ങൾ

പഠനം പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങൾക്ക് കഴിയും:
- Bicep, ARM ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് Azure ഇൻഫ്രാസ്ട്രക്ചർ രൂപകൽപ്പന ചെയ്യുകയും പ്രൊവിഷൻ ചെയ്യുകയും ചെയ്യുക
- ശരിയായ റിസോഴ്സ് ഡിപെൻഡൻസികളോടെ സങ്കീർണ്ണമായ മൾട്ടി-സർവീസ് ആർക്കിടെക്ചറുകൾ കോൺഫിഗർ ചെയ്യുക
- പല പരിസ്ഥിതികൾക്കും കോൺഫിഗറേഷനുകൾക്കും പാരാമെറ്ററൈസ്ഡ് ടെംപ്ലേറ്റുകൾ നടപ്പിലാക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗിലെ പ്രശ്നങ്ങൾ പരിഹരിക്കുകയും ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ പരിഹരിക്കുകയും ചെയ്യുക
- Azure Well-Architected Framework പ്രിൻസിപ്പിളുകൾ ഇൻഫ്രാസ്ട്രക്ചർ ഡിസൈനിൽ പ്രയോഗിക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ അപ്ഡേറ്റുകൾ മാനേജ് ചെയ്യുകയും ഇൻഫ്രാസ്ട്രക്ചർ വേർഷനിംഗ് സ്ട്രാറ്റജികൾ നടപ്പിലാക്കുകയും ചെയ്യുക

## ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അവലോകനം

Azure Developer CLI നിരവധി Infrastructure as Code (IaC) പ്രൊവൈഡറുകൾ പിന്തുണയ്ക്കുന്നു:
- **Bicep** (ശുപാർശ ചെയ്യുന്നു) - Azure-യുടെ ഡൊമെയിൻ-സ്പെസിഫിക് ലാംഗ്വേജ്
- **ARM ടെംപ്ലേറ്റുകൾ** - JSON-അടിസ്ഥാനമാക്കിയ Azure Resource Manager ടെംപ്ലേറ്റുകൾ
- **Terraform** - മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രക്ചർ ടൂൾ
- **Pulumi** - പ്രോഗ്രാമിംഗ് ഭാഷകളിൽ ആധുനിക ഇൻഫ്രാസ്ട്രക്ചർ എസ് കോഡ്

## Azure റിസോഴ്സുകൾ മനസ്സിലാക്കുക

### റിസോഴ്സ് ഹിയറാർക്കി
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ആപ്ലിക്കേഷനുകൾക്കായുള്ള സാധാരണ Azure സേവനങ്ങൾ
- **കമ്പ്യൂട്ട്**: ആപ്പ് സർവീസ്, കണ്ടെയ്നർ ആപ്പുകൾ, ഫങ്ഷനുകൾ, വെർച്വൽ മെഷീനുകൾ
- **സ്റ്റോറേജ്**: സ്റ്റോറേജ് അക്കൗണ്ട്, Cosmos DB, SQL ഡാറ്റാബേസ്, PostgreSQL
- **നെറ്റ്വർക്കിംഗ്**: വെർച്വൽ നെറ്റ്വർക്ക്, ആപ്ലിക്കേഷൻ ഗേറ്റ്‌വേ, CDN
- **സുരക്ഷ**: കീ വോൾട്ട്, ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്, ലോഗ് അനലിറ്റിക്സ്
- **AI/ML**: കോഗ്നിറ്റീവ് സർവീസസ്, OpenAI, മെഷീൻ ലേണിംഗ്

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

### ഉയർന്ന തലത്തിലുള്ള Bicep പാറ്റേണുകൾ

#### മോഡുലാർ ഇൻഫ്രാസ്ട്രക്ചർ
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

#### കണ്ടീഷണൽ റിസോഴ്സ് സൃഷ്ടി
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

## 🔒 സുരക്ഷയും സീക്രെറ്റ്സ് മാനേജ്മെന്റും

### കീ വോൾട്ട് ഇന്റഗ്രേഷൻ
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

## 🌍 നെറ്റ്വർക്കിംഗ് & കണക്റ്റിവിറ്റി

### വെർച്വൽ നെറ്റ്വർക്ക് കോൺഫിഗറേഷൻ
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

### SSL ഉപയോഗിച്ച് ആപ്ലിക്കേഷൻ ഗേറ്റ്‌വേ
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

## 📊 മോണിറ്ററിംഗ് & ഒബ്സർവബിലിറ്റി

### ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്
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

### കസ്റ്റം മെട്രിക്സും അലർട്ടുകളും
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

## 🔧 പരിസ്ഥിതി-സ്പെസിഫിക് കോൺഫിഗറേഷനുകൾ

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

### കണ്ടീഷണൽ റിസോഴ്സ് പ്രൊവിഷനിംഗ്
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

## 🚀 ഉയർന്ന തലത്തിലുള്ള പ്രൊവിഷനിംഗ് പാറ്റേണുകൾ

### മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്മെന്റ്
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

## 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ & വാലിഡേഷൻ (പുതിയത്)

### ഡിപ്ലോയ്മെന്റിന് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്യുക

`azd provision --preview` ഫീച്ചർ **ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് സിമുലേറ്റ്** ചെയ്യാൻ നിങ്ങളെ അനുവദിക്കുന്നു, റിസോഴ്സുകൾ യഥാർത്ഥത്തിൽ ഡിപ്ലോയ് ചെയ്യുന്നതിന് മുമ്പ്. ഇത് `terraform plan` അല്ലെങ്കിൽ `bicep what-if` പോലെയാണ്, നിങ്ങളുടെ Azure പരിസ്ഥിതിയിൽ എന്ത് മാറ്റങ്ങൾ വരുത്തുമെന്ന് കാണിക്കുന്ന **ഡ്രൈ-റൺ കാഴ്ച** നൽകുന്നു.

#### 🛠️ ഇത് എന്താണ് ചെയ്യുന്നത്
- **നിങ്ങളുടെ IaC ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്യുന്നു** (Bicep അല്ലെങ്കിൽ Terraform)
- **റിസോഴ്സ് മാറ്റങ്ങളുടെ പ്രിവ്യൂ കാണിക്കുന്നു**: ചേർക്കലുകൾ, നീക്കലുകൾ, അപ്ഡേറ്റുകൾ
- **മാറ്റങ്ങൾ പ്രയോഗിക്കുന്നില്ല** — ഇത് റീഡ്-ഓൺലിയും സുരക്ഷിതവുമാണ്

#### 🧩 ഉപയോഗ കേസുകൾ
```bash
# വിന്യാസ മാറ്റങ്ങൾ വിന്യസിക്കുന്നതിന് മുമ്പ് പ്രിവ്യൂ ചെയ്യുക
azd provision --preview

# വിശദമായ ഔട്ട്പുട്ട് ഉപയോഗിച്ച് പ്രിവ്യൂ ചെയ്യുക
azd provision --preview --output json

# പ്രത്യേക പരിസ്ഥിതിക്ക് പ്രിവ്യൂ ചെയ്യുക
azd provision --preview --environment production
```

ഈ കമാൻഡ് നിങ്ങളെ സഹായിക്കുന്നു:
- **റിസോഴ്സ് മാറ്റങ്ങൾ വാലിഡേറ്റ് ചെയ്യുക** റിസോഴ്സുകൾ കമ്മിറ്റ് ചെയ്യുന്നതിന് മുമ്പ്
- **വികസന ചക്രത്തിൽ തന്നെ തെറ്റായ കോൺഫിഗറേഷനുകൾ കണ്ടെത്തുക**
- **ടീം പരിസ്ഥിതികളിൽ സുരക്ഷിതമായി സഹകരിക്കുക**
- **അപ്രതീക്ഷിത സംഭവങ്ങൾ ഇല്ലാതെ കുറഞ്ഞ-അനുമതി ഡിപ്ലോയ്മെന്റുകൾ ഉറപ്പാക്കുക**

ഇത് പ്രത്യേകിച്ച് പ്രയോജനപ്രദമാണ്:
- സങ്കീർണ്ണമായ മൾട്ടി-സർവീസ് പരിസ്ഥിതികളുമായി പ്രവർത്തിക്കുമ്പോൾ
- പ്രൊഡക്ഷൻ ഇൻഫ്രാസ്ട്രക്ചറിലേക്ക് മാറ്റങ്ങൾ വരുത്തുമ്പോൾ
- PR അംഗീകാരത്തിന് മുമ്പ് ടെംപ്ലേറ്റ് മാറ്റങ്ങൾ വാലിഡേറ്റ് ചെയ്യുമ്പോൾ
- ഇൻഫ്രാസ്ട്രക്ചർ പാറ്റേണുകളിൽ പുതിയ ടീം അംഗങ്ങളെ പരിശീലിപ്പിക്കുമ്പോൾ

### പ്രിവ്യൂ ഔട്ട്പുട്ടിന്റെ ഉദാഹരണം
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

## 🔄 റിസോഴ്സ് അപ്ഡേറ്റുകളും മൈഗ്രേഷനുകളും

### സുരക്ഷിതമായ റിസോഴ്സ് അപ്ഡേറ്റുകൾ
```bash
# ആദ്യം അടിസ്ഥാനമാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്യുക (ശുപാർശ ചെയ്യുന്നു)
azd provision --preview

# പ്രിവ്യൂ കഴിഞ്ഞ് മാറ്റങ്ങൾ ക്രമാനുസൃതമായി പ്രയോഗിക്കുക
azd provision --confirm-with-no-prompt

# ആവശ്യമെങ്കിൽ റോള്ബാക്ക് ചെയ്യുക
azd provision --rollback
```

### ഡാറ്റാബേസ് മൈഗ്രേഷനുകൾ
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

### 1. റിസോഴ്സ് നെയിമിംഗ് കൺവെൻഷനുകൾ
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

### 3. പാരാമീറ്റർ വാലിഡേഷൻ
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

### 4. ഔട്ട്പുട്ട് ഓർഗനൈസേഷൻ
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

## അടുത്ത ചുവടുകൾ

- [പ്രീ-ഡിപ്ലോയ്മെന്റ് പ്ലാനിംഗ്](../pre-deployment/capacity-planning.md) - റിസോഴ്സ് ലഭ്യത വാലിഡേറ്റ് ചെയ്യുക
- [സാധാരണ പ്രശ്നങ്ങൾ](../troubleshooting/common-issues.md) - ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [ഡീബഗിംഗ് ഗൈഡ്](../troubleshooting/debugging.md) - പ്രൊവിഷനിംഗ് പ്രശ്നങ്ങൾ ഡീബഗ് ചെയ്യുക
- [SKU സെലക്ഷൻ](../pre-deployment/sku-selection.md) - അനുയോജ്യമായ സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കുക

## അധിക റിസോഴ്സുകൾ

- [Azure Bicep ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ടെംപ്ലേറ്റുകൾ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md)
- **അടുത്ത പാഠം**: [കപ്പാസിറ്റി പ്ലാനിംഗ്](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള മൂല രേഖയാണ് വിശ്വസനീയമായ ഉറവിടം എന്ന് പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
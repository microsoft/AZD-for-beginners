# AZD ഉപയോഗിച്ച് Azure റിസോഴ്‌സുകൾ പ്രൊവിഷൻ ചെയ്യൽ

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD തുടക്കക്കാർക്കുള്ളത്](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 4 - ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ് & ഡിപ്ലോയ്‌മെന്റ്
- **⬅️ മുൻപത്തെ**: [ഡिप്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md)
- **➡️ അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 5: മൾട്ടി-ഏജന്റ് AI പരിഹാരങ്ങൾ](../../examples/retail-scenario.md)
- **🔧 ബന്ധപ്പെട്ടു**: [അദ്ധ്യായം 6: പ്രീ-ഡിപ്ലോയ്മെന്റ് പരിശോധന](../chapter-06-pre-deployment/capacity-planning.md)

## പരിചയം

ഈ സമഗ്ര ഗൈഡ് Azure Developer CLI ഉപയോഗിച്ച് Azure റിസോഴ്‌സുകൾ പ്രൊവിഷൻ ചെയ്യാനും മാനേജ് ചെയ്യാനും നിങ്ങൾക്കാവശ്യമായ എല്ലാ കാര്യങ്ങളും ഉൾക്കൊള്ളുന്നു. അടിസ്ഥാന റിസോഴ്‌സ് സൃഷ്ടിയിലൂടെ മുതൽ Bicep, ARM templates, Terraform, Pulumi എന്നിവ ഉപയോഗിച്ച് കോർപ്പറേറ്റും എന്റർപ്രൈസ്-ഗ്രേഡ് ഇൻഫ്രാസ്ട്രക്ചർ ആർക്കിടെക്ചറുകൾ വരെ Infrastructure as Code (IaC) പാറ്റേണുകൾ നടപ്പാക്കുന്നത് പഠിക്കാം.

## പഠന ലക്ഷ്യങ്ങൾ

By completing this guide, you will:
- Infrastructure as Code ന്റെ സിദ്ധാന്തങ്ങളും Azure റിസോഴ്‌സ് പ്രൊവിഷനിംഗും ആഴത്തിൽ പഠിക്കുക
- Azure Developer CLI പിന്തുണയ്ക്കുന്ന വിവിധ IaC പ്രൊവൈഡറുകൾ മനസ്സിലാക്കുക
- സാധാരണ ആപ്ലിക്കേഷൻ ആർക്കിടെക്ചറുകൾക്കായി Bicep ടെംപ്ലേറ്റുകൾ രൂപകൽപ്പന ചെയ്ത് നടപ്പാക്കുക
- റിസോഴ്‌സ് പാരാമീറ്ററുകൾ, വേരിയബിളുകൾ, പരിസ്ഥിതി-നിര്ദിഷ്ട ക്രമീകരണങ്ങൾ കോൺഫിഗർ ചെയ്യുക
- നെറ്റ്വർക്കിംഗ്, സുരക്ഷ എന്നിവ ഉൾപ്പെടുന്ന ആഡ്വാൻസ്ഡ് ഇൻഫ്രാസ്ട്രക്ചർ പാറ്റേണുകൾ നടപ്പാക്കുക
- റിസോഴ്‌സ് ലൈഫ്‌സൈക്കിൾ, അപ്‌ഡേറ്റുകൾ, ഡിപ്പെൻഡൻസി പരിഹാരം മാനേജ് ചെയ്യുക

## പഠന ഫലങ്ങൾ

Upon completion, you will be able to:
- Bicep, ARM ടेम്പ്ലേറ്റുകൾ ഉപയോഗിച്ച് Azure ഇൻഫ്രാസ്ട്രക്ചർ രൂപകൽപ്പന ചെയ്യാനും പ്രൊവിഷൻ ചെയ്യാനും സാധിക്കാം
- ശരിയായ റിസോഴ്‌സ് ആശ്രയങ്ങളോടുകൂടെ സങ്കീർണ്ണ മൾട്ടി-സെർവിസ് ആർക്കിടെക്ചറുകൾ കോൺഫിഗർ ചെയ്യുക
- നിരവധി പരിസ്ഥിതികൾക്കും കോൺഫിഗറേഷനുകൾക്കുമുള്ള പാരാമറ്ററൈസ്ഡ് ടെംപ്ലേറ്റുകൾ നടപ്പിലാക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് പ്രശ്നങ്ങൾ പരിഹരിച്ച് ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ പരിഹരിക്കാൻ കഴിയും
- Azure Well-Architected Framework ന്റെ സിദ്ധാന്തങ്ങൾ ഇൻഫ്രാസ്ട്രക്ചർ രൂപകൽപ്പനയില്‍ പ്രയോഗിക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ അപ്‌ഡേറ്റുകൾ കൈകാര്യം ചെയ്യുകയും ഇൻഫ്രാസ്ട്രക്ചർ വേർഷണിംഗ് തന്ത്രങ്ങൾ നടപ്പാക്കുകയും ചെയ്യുക

## ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അവലോകനം

Azure Developer CLI പല Infrastructure as Code (IaC) പ്രൊവൈഡറുകളും പിന്തുണയ്ക്കുന്നു:
- **Bicep** (ശുപാർശ ചെയ്യപ്പെടുന്നു) - Azure ന്റെ ഡൊമെയ്ൻ-സ്പെസിഫിക് ഭാഷ
- **ARM Templates** - JSON-ആധാരമാക്കിയ Azure Resource Manager ടെംപ്ലേറ്റുകൾ
- **Terraform** - മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രക്ചർ ടൂൾ
- **Pulumi** - പ്രോഗ്രാമിങ് ഭാഷകൾ ഉപയോഗിച്ച് ആധുനിക Infrastructure as Code

## Azure റിസോഴ്‌സുകൾ മനസ്സിലാക്കൽ

### റിസോഴ്‌സ് ശ്രേണിക്രമം
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### അപ്ലിക്കേഷനുകൾക്കുള്ള പൊതുവായ Azure സേവനങ്ങൾ
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

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

### അഡ്വാൻസ്ഡ് Bicep പാറ്റേണുകൾ

#### മോള്യൂലാർ ഇൻഫ്രാസ്ട്രക്ചർ
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

#### നിബന്ധനാപരമായ റിസോഴ്‌സ് സൃഷ്ടി
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

## 🔒 സുരക്ഷയും രഹസ്യങ്ങളുടെയും മാനേജ്മെന്റ്

### Key Vault ഇന്റഗ്രേഷൻ
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

### Managed Identity കോൺഫിഗറേഷൻ
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

## 🌍 നെറ്റ്വർക്കിംഗ് மற்றும் കണക്ടിവിറ്റി

### Virtual Network കോൺഫിഗറേഷൻ
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

### SSL ഉള്ള Application Gateway
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

## 📊 നിരീക്ഷണവും ഓബ്‌സർവബിലിറ്റിയും

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

### കസ്റ്റം മെട്രിക്സ് & അലേർട്ടുകൾ
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

## 🔧 പരിസ്ഥിതിയില്‍ പ്രത്യേകമായ കോൺഫിഗറേഷനുകൾ

### വിവിധ പരിസ്ഥിതികൾക്കുള്ള പാരാമീറ്റർ ഫയലുകൾ
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

### നിബന്ധനാപരമായ റിസോഴ്‌സ് പ്രൊവിഷനിംഗ്
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

## 🚀 അഡ്വാൻസ്ഡ് പ്രൊവിഷനിംഗ് പാറ്റേണുകൾ

### മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്‌മെന്റ്
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

## 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ & സ്ഥിരീകരണം (പുതിയത്)

### ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്യുക

The `azd provision --preview` feature lets you **ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് അനുകൃതിചെയ്യുക** before actually deploying resources. It's similar in spirit to `terraform plan` or `bicep what-if`, giving you a **ഡ്രൈ-റൺ കാഴ്ച** of what changes would be made to your Azure environment.

#### 🛠️ ഇത് എന്താണ് ചെയ്യുന്നത്
- **നിങ്ങളുടെ IaC ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്യുന്നു** (Bicep or Terraform)
- **റിസോഴ്‌സ് മാറ്റങ്ങളുടെ പ്രിവ്യൂ കാണിക്കുന്നു**: ആഡ് ചെയ്യലുകൾ, നീക്കലുകൾ, അപ്ഡേറ്റുകൾ
- **മാറ്റങ്ങൾ പ്രയോഗിക്കുന്നില്ല** — ഇത് റീഡ്-ഒൺലിയും പ്രവർത്തിപ്പിക്കാൻ സുരക്ഷിതവുമാണ്

#### � ഉപയോഗ കേസുകൾ
```bash
# ഡിപ്ലോയ് ചെയ്യുന്നതിന് മുമ്പ് അടിസ്ഥാന സൗകര്യത്തിലെ മാറ്റങ്ങൾ മുൻകൂട്ടി കാണുക
azd provision --preview

# വിശദമായ ഔട്ട്പുട്ടോടുകൂടി മുൻകൂട്ടി കാണുക
azd provision --preview --output json

# നിശ്ചിത പരിസ്ഥിതിക്ക് വേണ്ടി മുൻകൂട്ടി കാണുക
azd provision --preview --environment production
```

This command helps you:
- **റിസോഴ്‌സ് കമ്മിറ്റ് ചെയ്യുന്നതിന് മുൻപ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ സാധൂകരിക്കുക**
- **ഡെവലപ്‌മെന്റ് ചക്രത്തിൽ തെറ്റായ കോൺഫിഗറേഷൻ നേരത്തെ പിടികൂടുക**
- **ടീം പരിസരങ്ങളിൽ സുരക്ഷിതമായി സഹകരിക്കുക**
- **അപ്രതീക്ഷിതത്വങ്ങളില്ലാതെ കുറഞ്ഞ-പ്രിവിലേജ് ഡിപ്ലോയ്മെന്റുകൾ ഉറപ്പുവരുത്തുക**

It's especially useful when:
- സങ്കീർണ്ണ മൾട്ടി-സെർവിസ് പരിസ്ഥിതികളിൽ പ്രവർത്തിക്കുമ്പോൾ
- പ്രൊഡക്ഷൻ ഇൻഫ്രാസ്ട്രക്ചറിൽ മാറ്റങ്ങൾ വരുത്തുമ്പോൾ
- PR അംഗീകാരത്തിന് മുമ്പ് ടെംപ്ലേറ്റ് തിരുത്തലുകൾ സാധൂകരിക്കുമ്പോൾ
- ഇൻഫ്രാസ്ട്രക്ചർ പാറ്റേണുകൾ സംബന്ധിച്ച് പുതിയ ടീമ്സഭാക്കളെ പരിശീലിപ്പിക്കുമ്പോളായി

### Example Preview Output
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

## �🔄 റിസോഴ്‌സ് അപ്ഡേറ്റുകളും മൈഗ്രേഷനുകളും

### സുരക്ഷിതമായ റിസോഴ്‌സ് അപ്ഡേറ്റുകൾ
```bash
# മുൻപരീക്ഷണമായി ഇൻഫ്രാസ്ട്രക്ഷർ മാറ്റങ്ങൾ ആദ്യം പ്രിവ്യൂ ചെയ്യുക (ശിപാർശ ചെയ്യുന്നു)
azd provision --preview

# പ്രിവ്യൂ സ്ഥിരീകരിച്ചതിന് ശേഷം മാറ്റങ്ങൾ പ്രയോഗിക്കുക
azd provision --confirm-with-no-prompt

# റോൾബാക്ക് ചെയ്യാൻ Git ഉപയോഗിച്ച് ഇൻഫ്രാസ്ട്രക്ഷർ മാറ്റങ്ങൾ തിരിച്ചു മടക്കുക:
git revert HEAD  # അവസാന ഇൻഫ്രാസ്ട്രക്ഷർ കമ്മിറ്റ് തിരിച്ചു മടക്കുക
azd provision    # മുന്‍പുള്ള ഇൻഫ്രാസ്ട്രക്ഷർ നില പ്രയോഗിക്കുക
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

## 🎯 മികച്ച രീതികൾ

### 1. റിസോഴ്‌സ് നാമകരണം മാനദണ്ഡങ്ങൾ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ടാഗിംഗ് തന്ത്രം
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

### 3. പാരാമീറ്റർ സാധൂകരണം
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

### 4. ഔട്ട്‌പുട്ട് സംഘടന
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

## അടുത്ത ഘട്ടങ്ങൾ

- [പ്രീ-ഡിപ്ലോയ്മെന്റ് പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ലഭ്യത സ്ഥിരീകരിക്കുക
- [സാധാരണ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [ഡീബഗിംഗ് ഗൈഡ്](../chapter-07-troubleshooting/debugging.md) - പ്രൊവിഷനിംഗ് പ്രശ്നങ്ങൾ ഡീബഗ് ചെയ്യുക
- [SKU തിരഞ്ഞെടുക്കൽ](../chapter-06-pre-deployment/sku-selection.md) - തക്ക സര്‍വീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കുക

## അധിക വിഭവങ്ങൾ

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md)
- **അടുത്ത പാഠം**: [കപ്പാസിറ്റി പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്‌ക്ലെയിമർ:
ഈ രേഖ AI പരിഭാഷാ servizio [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. നാം ശരിയായ വിധത്തിലാക്കാൻ ശ്രമിക്കുമ്പോഴും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ അസാധുതകൾ ഉണ്ടാകാമെന്ന് ദയവായി ശ്രദ്ധിക്കുക. യഥാർത്ഥമായി മൗലികഭാഷയിൽ ഉള്ള ഡോക്യുമെന്റ് പ്രാമാണിക സ്രോതസ്സായി കണക്കാക്കപ്പെടും. നിർണായക വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യപരിഭാഷ ശിപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ചതിലൂടെ ഉണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണങ്ങൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
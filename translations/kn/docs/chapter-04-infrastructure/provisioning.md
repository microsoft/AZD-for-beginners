# AZD ಬಳಸಿ Azure ಸಂಪನ್ಮೂಲಗಳ ಒದಗಿಕೆ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD ಆರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - ಕೋಡ್ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ನಿಯೋಜನೆ
- **⬅️ ಹಿಂದಿನದು**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **🔧 ಸಂಬಂಧಿಸಿದವು**: [ಅಧ್ಯಾಯ 6: ನಿಯೋಜನೆ ಮೊದಲು ಪರಿಶೀಲನೆ](../chapter-06-pre-deployment/capacity-planning.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶನವು Azure Developer CLI ಬಳಸಿ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸುವುದು ಮತ್ತು ನಿರ್ವಹಿಸುವುದರ ಕುರಿತು ನಿಮಗೆ ಬೇಕಾದ ಎಲ್ಲದರನ್ನೂ ಒಳಗೊಂಡಿದೆ. Bicep, ARM ಟೆಂಪ್ಲೇಟುಗಳು, Terraform, ಮತ್ತು Pulumi ಬಳಸಿ ಮೂಲಸೌಕರ್ಯವನ್ನು ಕೋಡ್ (IaC) ಮಾದರಿಗಳಿಂದ ಮೂಲಸೌಕರ್ಯ ರಚನೆದಿಂದ ವಿಸ್ತಾರವಾದ ಎಂಟರ್‌ಪ್ರೈಸ್ಗ್ರೇಡ್ ಇಂಜಿನಿಯರ್‌ಡ್ ವಿನ್ಯಾಸಗಳವರೆಗೆ ಅನುಷ್ಠಾನಗೊಳಿಸುವುದನ್ನು ಕಲಿಯಿರಿ.

## ಅಧ್ಯಯನ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶನವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದಾಗ, ನೀವು:
- ಮೂಲಸೌಕರ್ಯವನ್ನು ಕೋಡ್(principles) ತತ್ವಗಳನ್ನು ಮತ್ತು Azure ಸಂಪನ್ಮೂಲ ಒದಗಿಕೆಯನ್ನು ನಿಪುಣಗೊಳಿಸಿ
- Azure Developer CLI ಬೆಂಬಲಿಸುವ ಅನೇಕ IaC ಪ್ರೊವೈಡರ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ಸಾಮಾನ್ಯ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪಕ್ಕಾಗಿ Bicep ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ಸಂಪನ್ಮೂಲ ಪರಾಮಿತಿ, ಚರಗಳು, ಮತ್ತು ಪರಿಸರ-विशಿಷ್ಟ ಸಂಯೋಜನೆಗಳನ್ನು ಸಂರಚಿಸಿ
- ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆ ಸೇರಿದಂತೆ ಹೆಚ್ಚಿನ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ಸಂಪನ್ಮೂಲದ ಜೀವನಚಕ್ರ, ಅಪ್ಡೇಟ್‌ಗಳು, ಮತ್ತು ಅವಲಂಬನೆ ನಿವಾರಣೆಯನ್ನು ನಿರ್ವಹಿಸಿ

## ಅಧ್ಯಯನ ಫಲಿತಾಂಶಗಳು

ಸಮಾಪ್ತಿಯ ನಂತರ, ನೀವು ಸಾಧ್ಯ:
- Bicep ಮತ್ತು ARM ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿ Azure ಮೂಲಸೌಕರ್ಯವನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸು ಮತ್ತು ಒದಗಿಸು
- ಸೂಕ್ತ ಸಂಪನ್ಮೂಲ ಅವಲಂಬನೆಗಳೊಂದಿಗೆ ಸංකೀರ್ಣ ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ಸಂರಚಿಸು
- ಹಲವು ಪರಿಸರ ಮತ್ತು ಸಂರಚನೆಗಳಿಗೆ ಪರಾಮೀಟರ್‌ಕೃತ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸು
- ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆಯಲ್ಲಿ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ ಮತ್ತು ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ಪರಿಹರಿಸು
- ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸಕ್ಕೆ Azure ಸುಸಜ್ಜಿತ ವಾಸ್ತುಶಿಲ್ಪ ತತ್ವಗಳನ್ನು ಅನ್ವಯಿಸು
- ಮೂಲಸೌಕರ್ಯ ಅಪ್ಡೇಟ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸು ಮತ್ತು ವರ್ಜನಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸು

## ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆಗೆ ಅವಲೋಕನ

Azure Developer CLI ಹಲವಾರು Infrastructure as Code (IaC) ಪ್ರೊವೈಡರ್‌ಗಳನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ:
- **Bicep** (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ) - Azure ಗಾಗಿ ಡೊಮೇನ್-ನಿರ್ದಿಷ್ಟ ಭಾಷೆ
- **ARM Templates** - JSON ಆಧಾರಿತ Azure Resource Manager ಟೆಂಪ್ಲೇಟುಗಳು
- **Terraform** - ಬಹು-ಮೇಘ ಮೂಲಸೌಕರ್ಯ ಉಪಕರಣ
- **Pulumi** - ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಗಳೊಂದಿಗೆ ಆಧುನಿಕ ಮೂಲಸೌಕರ್ಯ ಅನ್ನು ಕೋಡ್ ಆಗಿ

## Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಸಂಪನ್ಮೂಲ ಹೈರಾರ್ಕಿ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಸಾಮಾನ್ಯ Azure ಸೇವೆಗಳು
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟುಗಳು

### ಮೂಲ Bicep ಟೆಂಪ್ಲೇಟ್ ರಚನೆ
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

### ಪ್ರಗತಿಶೀಲ Bicep ಮಾದರಿಗಳು

#### ಮೋಡ್ಯೂಲರ್ ಮೂಲಸೌಕರ್ಯ
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

#### ಶರತಾಪೂರ್ಣ ಸಂಪನ್ಮೂಲ ರಚನೆ
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

## 🗃️ ಡೇಟಾಬೇಸ್ ಒದಗಿಕೆ

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

## 🔒 ಭದ್ರತೆ ಮತ್ತು ರಹಸ್ಯ ನಿರ್ವಹಣೆ

### Key Vault ಏಕೀಕರಣ
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

### ನಿರ್ವಹಿಸಲ್ಪಟ್ಟ ಐಡೆಂಟಿಟಿ ಸಂರಚನೆ
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

## 🌍 ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಸಂಪರ್ಕತೆ

### ವರ್ಚುವಲ್ ನೆಟ್ವರ್ಕ್ ಸಂರಚನೆ
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

### SSL ಜೊತೆಗೆ Application Gateway
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

## 📊 ನಿಗಾ ಮತ್ತು ಗಮನಾರ್ಹತೆ

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

### ಕಸ್ಟಮ್ ಮೇಟ್ರಿಕ್‌ಗಳು ಮತ್ತು ಅಲರ್ಟ್‌ಗಳು
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

## 🔧 ಪರಿಸರ-ಪ್ರತ್ಯೇಕ ಸಂರಚನೆಗಳು

### ವಿಭಿನ್ನ ಪರಿಸರಗಳಿಗೆ ಪರಾಮೀಟರ್ ಫೈಲ್‌ಗಳು
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

### ಶರತಾಪೂರ್ಣ ಸಂಪನ್ಮೂಲ ಒದಗಿಕೆ
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

## 🚀 ಉನ್ನತ ಒದಗಿಸುವಿಕೆ ಮಾದರಿಗಳು

### ಬಹು-ಪ್ರಾಂತ್ಯ ನಿಯೋಜನೆ
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

### ಮೂಲಸೌಕರ್ಯ ಪರೀಕ್ಷಣೆ
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

## 🧪 ಮೂಲಸೌಕರ್ಯ ಪೂರ್ವದೃಶ್ಯ & ಮಾನ್ಯತೆ (ಹೊಸದು)

### ನಿಯೋಜನೆಕ್ಕೂ ಮುನ್ನ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳ ಪೂರ್ವದೃಶ್ಯ

`azd provision --preview` ವೈಶಿಷ್ಟ್ಯವು ಸಂಪನ್ಮೂಲಗಳನ್ನು ವಾಸ್ತವವಾಗಿ ನಿಯೋಜಿಸುವ ಮೊದಲು **ಮೂಲಸೌಕರ್ಯ ಒದಗಿಕೆಯನ್ನು ನಕಲಿ ರೂಪದಲ್ಲಿ ಅನುಕರಿಸಲು** ಬಿಡುತ್ತದೆ. ಇದು `terraform plan` ಅಥವಾ `bicep what-if` ರ روحಕ್ಕೆ ಹೊಂದಿರುಂತೆ, ನಿಮ್ಮ Azure ಪರಿಸರದಲ್ಲಿ 어떤 ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಲಾಗುತ್ತದೆ ಎಂಬುದರ **ಡ್ರೈ-ರನ್ ದೃಶ್ಯವನ್ನು** ನೀಡುತ್ತದೆ.

#### 🛠️ ಅದು ಏನು ಮಾಡುತ್ತದೆ
- **ನಿಮ್ಮ IaC ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸುತ್ತದೆ** (Bicep ಅಥವಾ Terraform)
- **ಸಂಪನ್ಮೂಲ ಬದಲಾವಣೆಗಳ ಪೂರ್ವದೃಶ್ಯವನ್ನು ತೋರಿಸುತ್ತದೆ**: ಸೇರ್ಪಡೆಗಳು, ಅಳಿಸುತ್ತವೆ, ಅಪ್ಡೇಟ್‌ಗಳು
- **ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸದು** — ಇದು ಓದ-only ಆಗಿದ್ದು, ನಡೆಸಲು ಸುರಕ್ಷಿತವಾಗಿದೆ

#### � ಬಳಕೆ ಪ್ರಕರಣಗಳು
```bash
# ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯ ಮಾಡಿ
azd provision --preview

# ವಿವರವಾದ ಫಲಿತಾಂಶದೊಂದಿಗೆ ಪೂರ್ವದೃಶ್ಯ
azd provision --preview --output json

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರಕ್ಕಾಗಿ ಪೂರ್ವದೃಶ್ಯ
azd provision --preview --environment production
```

ಈ ಕಮಾಂಡ್ ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ:
- **ಸಂಪನ್ಮೂಲ ಬದಲಾವಣೆಗಳನ್ನು ಮಾನ್ಯೀಕರಿಸಲು** ನಿಯೋಜನೆಯ ಮುನ್ನ
- **ಡಿವೆಲಪ್ಮೆಂಟ್ ಚಕ್ರದ ಆರಂಭದಲ್ಲಿ ತಪ್ಪು ಸಂರಚನೆಗಳನ್ನು ಹಿಡಿಯಲು**
- **ತಂಡ ಪರಿಸರಗಳಲ್ಲಿ ಸುರಕ್ಷಿತವಾಗಿ ಸಹಕಾರ ಮಾಡಲು**
- **ಎಚ್ಚರಿಕೆಯಿಲ್ಲದ ನಿಯೋಜನೆಗಳಿಂದ ತಪ್ಪಿಸಲು ಕನಿಷ್ಠ-ಅಧಿಕಾರ ತಂತ್ರಗಳನ್ನು ಖಾತ್ರಿಪಡಿಸಲು**

ಇದು ವಿಶೇಷವಾಗಿ ಉಪಯುಕ್ತವಾಗುತ್ತದೆ যখন:
- ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ಪರಿಸರಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡುತ್ತಿರುವಾಗ
- ಉತ್ಪಾದನೆ ಮೂಲಸೌಕರ್ಯಕ್ಕೆ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡುತ್ತಿರುವಾಗ
- PR ಅಳುಕುಮಾಡುವ ಮೊದಲು ಟೆಂಪ್ಲೇಟು ಬದಲಾವಣೆಗಳನ್ನು ಮಾನ್ಯೀಕರಿಸುವಾಗ
- ಹೊಸ ತಂಡದ ಸದಸ್ಯರಿಗೆ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳ ಮೇಲೆ ತರಬೇತಿ ನೀಡುತ್ತಿರುವಾಗ

### ನಿರೂಪಣೆಯ ಪೂರ್ವದೃಶ್ಯ ಉದಾಹರಣೆ
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

## �🔄 ಸಂಪನ್ಮೂಲ ನವೀಕರಣಗಳು ಮತ್ತು ಸ್ಥಳಾಂತರಗಳು

### ಸುರಕ್ಷಿತ ಸಂಪನ್ಮೂಲ ಅಪ್ಡೇಟ್‌ಗಳು
```bash
# ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬದಲಾವಣೆಗಳನ್ನು ಮೊದಲು ಪೂರ್ವದೃಶ್ಯ ಮಾಡಿ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
azd provision --preview

# ಪೂರ್ವದೃಶ್ಯದ ದೃಢೀಕರಣದ ನಂತರ ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸಿ
azd provision --confirm-with-no-prompt

# ರೋಲ್‌ಬ್ಯಾಕ್‌ಗಾಗಿ, ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬದಲಾವಣೆಗಳನ್ನು ಹಿಂದಿರಿಗೊಳಿಸಲು Git ಅನ್ನು ಬಳಸಿ:
git revert HEAD  # geçen ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕಮಿಟ್ ಅನ್ನು ಹಿಂದಿರಿಗೊಳಿಸಿ
azd provision    # ಹಿಂದಿನ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
```

### ಡೇಟಾಬೇಸ್ ಸ್ಥಳಾಂತರಗಳು
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

## 🎯 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಸಂಪನ್ಮೂಲ ಹೆಸರುಕರಣ ಕಾನ್ಸೆನ್ಶನ್ಸ್
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ಟ್ಯಾಗಿಂಗ್ ರಣನೀತಿ
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

### 3. ಪರಾಮೀಟರ್ ಮಾನ್ಯತೆ
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

### 4. ಔಟ್‌ಪುಟ್ ಅನ್ನು ಸಂಘಟಿಸುವುದು
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

## ಮುಂದಿನ ಹಂತಗಳು

- [ನಿಯೋಜನೆ ಮೊದಲು ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../chapter-07-troubleshooting/common-issues.md) - ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ತಿದ್ದುಮಾಡಿ
- [ಡಿಬಗ್ಗಿಂಗ್ ಗೈಡ್](../chapter-07-troubleshooting/debugging.md) - ಒದಗಿಸುವಿಕೆಗೆ ಸಂಬಂಧಿಸಿದ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಿ
- [SKU ಆಯ್ಕೆ](../chapter-06-pre-deployment/sku-selection.md) - ಸೂಕ್ತ ಸೇವಾ ಟಿಯರ್‌ಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅನಿಖಲತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆ ಅನ್ನು ಅಧಿಕೃತ ಆಧಾರದಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗೈಕೆಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
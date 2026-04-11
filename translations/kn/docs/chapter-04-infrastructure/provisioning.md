# AZD ಬಳಸಿ ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪ್ರಾವೇಶಿಕೆ ಮಾಡುವುದು

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - ಸಂಕೇತಿತ ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ನಿಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **🔧 ಸಂಬಂಧಿಸಿದ**: [ಅಧ್ಯಾಯ 6: ಪ್ರೀ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ](../chapter-06-pre-deployment/capacity-planning.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ ಅಜೂರ್ ಡೆವೆಲಪರ್ CLI ಬಳಸಿ ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳ ಪ್ರಾವೇಶಿಕೆ ಮತ್ತು ನಿರ್ವಹಣೆಗೆ ಬೇಕಾದ ಎಲ್ಲವನ್ನೂ ಒಳಗೊಂಡಿದೆ. ಬೈಸೆಪ್, ARM ಟೆಂಪ್ಲೇಟುಗಳು, ಟೆರೆಫಾರ್ಮ್ ಮತ್ತು ಪ್ಯುಲಮಿ ಬಳಸಿ ಮೂಲಸೌಕರ್ಯವನ್ನು ಸಂಕೇತವಾಗಿ (Infrastructure as Code - IaC) ರಚಿಸುವ ನಿರ್ವಹಣೆಯ ಹಂತಗಳನ್ನು ತಿಳಿಯಿರಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಮೂಲಸೌಕರ್ಯ ಸಂಹಿತಾ ತತ್ವಗಳನ್ನು ಮತ್ತು ಅಜೂರ್ ಸಂಪನ್ಮೂಲ ಪ್ರಾವೇಶಿಕೆಯನ್ನು ಪರಿಣತಿ ಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಅಜೂರ್ ಡೆವೆಲಪರ್ CLI ಬೆಂಬಲಿಸುವ ವಿವಿಧ IaC ಪೂರೈಕೆದಾರರನ್ನು ಅವಗಾಹಿಸಿಕೊಳ್ಳುವಿರಿ
- ಸಾಮಾನ್ಯ ಪ್ರಾಯೋಜಕ ವಾಸ್ತುಶಿಲ್ಪಗಳಿಗೆ ಬೈಸೆಪ್ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸುವುದು ಮತ್ತು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಸಂಪನ್ಮೂಲ ಪ್ಯಾರಾಮೀಟರ್ಸ್, ಚರ, ಮತ್ತು ಪರಿಸರ-ವಿಶಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಸ್ ಅನ್ನು ಸಂರಚಿಸುವುದು
- ಜಾಲತಾಣ ಮತ್ತು ಭದ್ರತೆ ಸೇರಿದಂತೆ ಜಟಿಲ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಸಂಪನ್ಮೂಲಗಳ ಜೀವನಚಕ್ರ, ನವೀಕರಣಗಳು ಹಾಗೂ ಅವಲಂಬನೆಯ ಪರಿಹಾರವನ್ನು ನಿರ್ವಹಿಸುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸುವ ನಂತರ, ನೀವು:
- ಬೈಸೆಪ್ ಮತ್ತು ARM ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಅಜೂರ್ ಮೂಲಸೌಕರ್ಯವನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಪ್ರಾವೇಶಿಕೆ ಮಾಡಬಹುದು
- ಸರಿಯಾದ ಸಂಪನ್ಮೂಲ ಅವಲಂಬನಗಳೊಂದಿಗೆ ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ಸಂರಚಿಸಲು ಶಕ್ತರಾಗಿರುತ್ತೀರಿ
- ವಿವಿಧ ಪರಿಸರಗಳು ಮತ್ತು ಸಂರಚನೆಗಳಿಗೆ ಪ್ಯಾರಾಮೀಟರ್ ಮಾಡಲಾದ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು
- ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವೇಶಿಕೆಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪತ್ತೆಮಾಡಿ ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ಪರಿಹರಿಸಬಹುದು
- ಅಜೂರ್ ಉತ್ತಮ ವಾಸ್ತುಶಿಲ್ಪ ತತ್ವಗಳನ್ನು ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸಕ್ಕೆ ಅನ್ವಯಿಸಬಹುದು
- ಮೂಲಸೌಕರ್ಯ ನವೀಕರಣಗಳನ್ನು ನಿರ್ವಹಿಸಿ ವಾಸ್ತುಶಿಲ್ಪ ಪ್ರಮಾಣೀಕರಣ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು

## ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವೇಶಿಕೆ ಪರಿಗಣನೆ

ಅಜೂರ್ ಡೆವೆಲಪರ್ CLI ಹಲವು Infrastructure as Code (IaC) ಪೂರೈಕೆದಾರರನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ:
- **ಬೈಸೆಪ್** (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ) - ಅಜೂರ್-ನಿಖರ ಡೊಮೇನ್-ವಿಶಿಷ್ಟ ಭಾಷೆ
- **ARM ಟೆಂಪ್ಲೇಟುಗಳು** - JSON ಆಧಾರಿತ ಅಜೂರ್ Resource Manager ಟೆಂಪ್ಲೇಟುಗಳು
- **ಟೆರೆಫಾರ್ಮ್** - ಬಹು-ಮೇಘ ಮೂಲಸೌಕರ್ಯ ಸಾಧನ
- **ಪ್ಯುಲಮಿ** - ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಆಧುನಿಕ ಮೂಲಸೌಕರ್ಯ ಸಂಹಿತಿ

## ಅಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಸಂಪನ್ಮೂಲ ವರ್ಗೀಕರಣ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ಸಾಮಾನ್ಯ ಅಜೂರ್ ಸೇವೆಗಳು
- **ಕಂಪ್ಯೂಟ್**: ಅಪ್ಲಿಕೇಶನ್ ಸರ್ವೀಸ್, ಕಂಟೈನರ್ ಅಪ್ಸ್, ಫಂಕ್ಷನ್‌ಗಳು, ವರ್ಚುವಲ್ ಮಶೀನಗಳು
- **ಸ್ಟೋರೆಜ್**: ಸ್ಟೋರೆಜ್ ಖಾತೆ, ಕಾಸ್ಮೋಸ್ ಡಿಬಿ, ಎಸ್‌ಕ್ಯೂಎಲ್ ಡೇಟಾಬೇಸ್, ಪೋಸ್ಟ್‌ಗ್ರೆಸ್ಎಸ್‌ಕ್ಯೂಎಲ್
- **ಜಾಲತಾಣ**: ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್, ಅಪ್ಲಿಕೇಶನ್ ಗೇಟ್ವೇ, CDN
- **ಭದ್ರತೆ**: ಕೀ ವಾಲ್ಟ್, ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್, ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್
- **ಎಐ/ಎಂಎಲ್**: ಕಾಯಾಗ್ನಿಟಿವ್ ಸೇವೆಗಳು, ಓಪನ್‌ಎಐ, ಮಷೀನ್ ಲರ್ನಿಂಗ್

## ಬೈಸೆಪ್ ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟುಗಳು

### ಮೂಲ ಬೈಸೆಪ್ ಟೆಂಪ್ಲೇಟು ರಚನೆ
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

### ನೈಪುಣ್ಯ ಬೈಸೆಪ್ ಮಾದರಿಗಳು

#### ಮಾಯಾಜಾಲ ಮೂಲಸೌಕರ್ಯ
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

#### ಶರತುದಾರಿ ಸಂಪನ್ಮೂಲ ರಚನೆ
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

## 🗃️ ಡೇಟಾಬೇಸ್ ಪ್ರಾವೇಶಿಕೆ

### ಕಾಸ್ಮೋಸ್ ಡಿಬಿ
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

### ಪೋಸ್ಟ್‌ಗ್ರೆಸ್‌ಎಸ್‌ಕ್ಯೂಎಲ್
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

### ಕೀ ವಾಲ್ಟ್ ಸಂಯೋಜನೆ
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

### ನಿಗದಿತ ಐಡೆಂಟಿಟಿ ಸಂರಚನೆ
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

## 🌍 ಜಾಲತಾಣ ಮತ್ತು ಸಂಪರ್ಕತೆ

### ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್ ಸಂರಚನೆ
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

### SSL ನೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್ ಗೇಟ್ವೇ
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

## 📊 ಸಂಚರಣೆ ಮತ್ತು ಗಮನಾರ್ಹತೆ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್
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

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ಸ್ ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳು
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

## 🔧 ಪರಿಸರ-ವಿಶಿಷ್ಟ ಸಂರಚನೆಗಳು

### ವಿಭಿನ್ನ ಪರಿಸರಗಳಿಗೆ ಪ್ಯಾರಾಮೀಟರ್ ಫೈಲ್‌ಗಳು
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

### ಶರತುದಾರಿಯಾದ ಸಂಪನ್ಮೂಲ ಪ್ರಾವೇಶಿಕೆ
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

## 🚀 ನೈಪುಣ್ಯ ಪ್ರಾವೇಶಿಕೆ ಮಾದರಿಗಳು

### ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ
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

### ಮೂಲಸೌಕರ್ಯ ಮಾನದಂಡ ಪರಿಶೀಲನೆ
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

## 🧪 ಮೂಲಸೌಕರ್ಯ ಪೂರ್ವದೃಶ್ಯ & ಪರಿಶೀಲನೆ (ಹೊಸದು)

### ನಿಯೋಜನೆಯ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳ ಪೂರ್ವದೃಶ್ಯ

`azd provision --preview` ವೈಶಿಷ್ಟ್ಯವು ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಭಾಯಿಸುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವೇಶಿಕೆಯನ್ನು **ಅನುಕರಿಸುವುದನ್ನು** ಅನುಮತಿಸುತ್ತದೆ. ಇದು `terraform plan` ಅಥವಾ `bicep what-if` ಮಾದರಿಯಂತೆ, ನಿಮ್ಮ ಅಜೂರ್ ಪರಿಸರಕ್ಕೆ ಯಾವ ಬದಲಾವಣೆಗಳು ಆಗಲಿವೆ ಎಂಬುದರ **ಸರಳ ದೃಷ್ಠಾಂತವನ್ನು** ನೀಡುತ್ತದೆ.

#### 🛠️ ಇದು ಮಾಡುವುದೇನು
- ನಿಮ್ಮ IaC ಟೆಂಪ್ಲೇಟುಗಳನ್ನು (ಬೈಸೆಪ್ ಅಥವಾ ಟೆರೆಫಾರ್ಮ್) ವಿಶ್ಲೇಷಿಸುತ್ತದೆ
- ಸಂಪನ್ಮೂಲ ಬದಲಾವಣೆಗಳ ಪೂರ್ವದೃಶ್ಯವನ್ನು ತೋರಿಸುತ್ತದೆ: ಸೇರ್ಪಡೆ, ಅಳಿಸುವಿಕೆ, ನವೀಕರಣ
- ಬದಲಾವಣೆಗಳನ್ನು ಜಾರಿಗೊಳಿಸುವುದಿಲ್ಲ — ಓದಿಕೆಗೆ ಮಾತ್ರ ಮತ್ತು ಸುರಕ್ಷಿತವಾಗಿದೆ

#### ಬಳಕೆಯ ಸಂದರ್ಭದಲ್ಲಿ
```bash
# ನಿಯೋಜನೆಯ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯ ಮಾಡಿ
azd provision --preview

# ವಿಶೇಷ ಪರಿಸರಕ್ಕಾಗಿ ಪೂರ್ವದೃಶ್ಯ
azd provision --preview -e production
```

ಈ ಕಮ್ಯಾಂಡ್ ಸಹಾಯ ಮಾಡುತ್ತದೆ:
- ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಯೋಜಿಸುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು **ಪರಿಶೀಲಿಸಲು**
- ಅಭಿವೃದ್ಧಿ ಚಟುವಟಿಕೆಯಲ್ಲಿ ಬೇಗನೆ **ತಪ್ಪು ಸಂರಚನೆಗಳನ್ನು ಪತ್ತೆಹಚ್ಚಲು**
- ತಂಡದ ಪರಿಸರಗಳಲ್ಲಿ **ಸುರಕ್ಷಿತ ಸಹಕಾರ ಮಾಡಿಕೊಳ್ಳಲು**
- ಅಲೈಕೆ ಇಲ್ಲದ ಅತ್ಯಲ್ಪ-ಸಮರ್ಥ ನಿಯೋಜನೆಗಳನ್ನು **ಖಚಿತಪಡಿಸಲು**

ಇದು ವಿಶೇಷವಾಗಿ ಉಪಯುಕ್ತವಾಗುತ್ತದೆ:
- ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ಪರಿಸರಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡುವಾಗ
- ಉತ್ಪಾದನಾ ಮೂಲಸೌಕರ್ಯದಲ್ಲಿ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡುವಾಗ
- PR ಅನುಮೋದನೆಗೂ ಮುನ್ನ ಟೆಂಪ್ಲೇಟ್ ಬದಲಾವಣೆಗಳನ್ನು ಪರಿಶೀಲಿಸುವಾಗ
- ಹೊಸ ತಂಡದ ಸದಸ್ಯರಿಗೆ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳನ್ನು ಸಹಾಯವಾಗಿ ತರಬೇತಿ ನೀಡುವಾಗ

### ಉದಾಹರಣೆಯ ಪೂರ್ವದೃಶ್ಯ ಔಟ್‌ಪುಟ್
ನಿಖರ ಪೂರ್ವದೃಶ್ಯ ಔಟ್‌ಪುಟ್ ಪೂರೈಕೆದಾರ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯಂತೆ ವ್ಯತ್ಯಾಸವಾಗಬಹುದು, ಆದರೆ ಫಲಿತಾಂಶವು ಯಾವುದೇ ಬದಲಾವಣೆ ಜಾರಿಗೊಳಿಸುವ ಮೊದಲು ಸ್ಪಷ್ಟವಾಗಿ ಗೊತ್ತಾಗಬೇಕು.

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

## �🔄 ಸಂಪನ್ಮೂಲ ನವೀಕರಣಗಳು ಮತ್ತು ಬದಲಾವಣೆಗಳು

### ಸುರಕ್ಷಿತ ಸಂಪನ್ಮೂಲ ನವೀಕರಣಗಳು
```bash
# ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಮೊದಲು ಪೂರ್ವವೀಕ್ಷಣೆ ಮಾಡಿ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
azd provision --preview

# ಪೂರ್ವವೀಕ್ಷಣೆ ದೃಢೀಕರಣದ ನಂತರ ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸಿ
azd provision --confirm-with-no-prompt

# ಹಿಂತೆಗೆದುಕೊಳ್ಳಲು, ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ರದ್ದುಗೊಳಿಸಲು Git ಅನ್ನು ಬಳಸಿರಿ:
git revert HEAD  # ಕೊನೆಯ ಮೂಲಸೌಕರ್ಯ ಕಮಿಟ್ ಅನ್ನು ಹಿಂತೆಗೆದುಕೊಳ್ಳಿ
azd provision    # ಹಿಂದಿನ ಮೂಲಸೌಕರ್ಯ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
```

### ಡೇಟಾಬೇಸ್ ಬದಲಾವಣೆಗಳು
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

### 1. ಸಂಪನ್ಮೂಲ ಹೆಸರಿನ ನಿಯಮಗಳು
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ಟ್ಯಾಗಿಂಗ್ ತಂತ್ರಜ್ಞಾನ
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

### 3. ಪ್ಯಾರಾಮೀಟರ್ ಪರಿಶೀಲನೆ
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

### 4. ಔಟ್‌ಪುಟ್ ಕೈಗಾರಿಕೆ
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

- [ನಿಯೋಜನೆಗೂ ಮುನ್ನ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಪರಿಶೀಲನೆ
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../chapter-07-troubleshooting/common-issues.md) - ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಶೋಧಿಸಿ ಪರಿಹರಿಸುವುದು
- [ದೋಷನಿಜರಣೆ ಮಾರ್ಗದರ್ಶಿ](../chapter-07-troubleshooting/debugging.md) - ಪ್ರಾವೇಶಿಕೆ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡುವುದು
- [SKU ಆಯ್ಕೆ](../chapter-06-pre-deployment/sku-selection.md) - ಸರಿಯಾದ ಸೇವಾ ತರಗತಿಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡಿಕೊಳ್ಳಿ

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [ಅಜೂರ್ ಬೈಸೆಪ್ ಡಾಕ್ಯುಮೆಂಟೇಷನ್](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [ಅಜೂರ್ ರಿಸೋರ್ಸ್ ಮ್ಯಾನೇಜರ್ ಟೆಂಪ್ಲೇಟುಗಳು](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [ಅಜೂರ್ ವಾಸ್ತುಶಿಲ್ಪ ಕೇಂದ್ರ](https://learn.microsoft.com/en-us/azure/architecture/)
- [ಅಜೂರ್ ಉತ್ತಮ ವಾಸ್ತುಶಿಲ್ಪ ಚಟುವಟಿಕೆ](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಕ್ಷಮತಾ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಸೇವೆ ನಿರാകರಣೆ**:  
ಈ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸ್ಪಷ್ಟತೆಗಳು ಇರಬಹುದು ಎಂಬ ತಿಳಿವಳಿಕೆ ಇರಲಿ. ಮೂಲ ಡಾಕ್ಯುಮೆಂಟ್ ಅದರ ಸ್ಥಳೀಯ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವಾಗಿಯೇ ಪರಿಗಣಿಸಲಾಗಬೇಕು. ಮಹತ್ವಪೂರ್ಣ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದ ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿಕೆಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
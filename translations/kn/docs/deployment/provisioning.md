<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d02f62a3017cc4c95dee2c496218ac8a",
  "translation_date": "2025-11-24T23:29:45+00:00",
  "source_file": "docs/deployment/provisioning.md",
  "language_code": "kn"
}
-->
# AZD ಬಳಸಿ Azure ಸಂಪತ್ತುಗಳನ್ನು ಪ್ರೊವಿಷನ್ ಮಾಡುವುದು

**ಅಧ್ಯಾಯದ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಪ್ರಾರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - ಕೋಡ್ ಮತ್ತು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ರೂಪದಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ
- **⬅️ ಹಿಂದಿನ**: [ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಗೈಡ್](deployment-guide.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **🔧 ಸಂಬಂಧಿತ**: [ಅಧ್ಯಾಯ 6: ಪೂರ್ವ-ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾನ್ಯತೆ](../pre-deployment/capacity-planning.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಬಳಸಿ Azure ಸಂಪತ್ತುಗಳನ್ನು ಪ್ರೊವಿಷನ್ ಮತ್ತು ನಿರ್ವಹಿಸುವ ಬಗ್ಗೆ ನಿಮಗೆ ತಿಳಿಯಬೇಕಾದ ಎಲ್ಲವನ್ನೂ ಒಳಗೊಂಡಿದೆ. ಮೂಲಸೌಕರ್ಯವನ್ನು ಕೋಡ್ (IaC) ಮಾದರಿಗಳಂತೆ ಅನುಷ್ಠಾನಗೊಳಿಸಲು ಕಲಿಯಿರಿ, ಮೂಲ ಸಂಪತ್ತುಗಳ ಸೃಷ್ಟಿಯಿಂದ ಪ್ರಗತಿಶೀಲ ಎಂಟರ್‌ಪ್ರೈಸ್-ಗ್ರೇಡ್ ಮೂಲಸೌಕರ್ಯ ಆರ್ಕಿಟೆಕ್ಚರ್‌ಗಳವರೆಗೆ Bicep, ARM ಟೆಂಪ್ಲೇಟುಗಳು, Terraform, ಮತ್ತು Pulumi ಬಳಸಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- ಮೂಲಸೌಕರ್ಯವನ್ನು ಕೋಡ್ (IaC) ತತ್ವಗಳು ಮತ್ತು Azure ಸಂಪತ್ತುಗಳ ಪ್ರೊವಿಷನ್ ಅನ್ನು ಮಾಸ್ಟರ್ ಮಾಡುತ್ತೀರಿ
- Azure Developer CLI ಬೆಂಬಲಿಸುವ ವಿವಿಧ IaC ಪೂರೈಕೆದಾರರನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ಸಾಮಾನ್ಯ ಅಪ್ಲಿಕೇಶನ್ ಆರ್ಕಿಟೆಕ್ಚರ್‌ಗಳಿಗೆ Bicep ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- ಸಂಪತ್ತು ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು, ವ್ಯಾರಿಯಬಲ್‌ಗಳು, ಮತ್ತು ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತೀರಿ
- ನೆಟ್‌ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆ ಸೇರಿದಂತೆ ಪ್ರಗತಿಶೀಲ ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- ಸಂಪತ್ತುಗಳ ಜೀವನಚಕ್ರ, ಅಪ್ಡೇಟ್‌ಗಳು, ಮತ್ತು ಅವಲಂಬನೆ ಪರಿಹಾರವನ್ನು ನಿರ್ವಹಿಸುತ್ತೀರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- Bicep ಮತ್ತು ARM ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿ Azure ಮೂಲಸೌಕರ್ಯವನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಪ್ರೊವಿಷನ್ ಮಾಡುತ್ತೀರಿ
- ಸರಿಯಾದ ಸಂಪತ್ತು ಅವಲಂಬನೆಗಳೊಂದಿಗೆ ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ಆರ್ಕಿಟೆಕ್ಚರ್‌ಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತೀರಿ
- ಬಹು ಪರಿಸರಗಳು ಮತ್ತು ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳಿಗೆ ಪ್ಯಾರಾಮೀಟರ್‌ಗೊಳಿಸಿದ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- ಮೂಲಸೌಕರ್ಯ ಪ್ರೊವಿಷನ್ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ ಮತ್ತು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವೈಫಲ್ಯಗಳನ್ನು ಪರಿಹರಿಸುತ್ತೀರಿ
- Azure ಉತ್ತಮ-ಆರ್ಕಿಟೆಕ್ಟೆಡ್ ಫ್ರೇಮ್‌ವರ್ಕ್ ತತ್ವಗಳನ್ನು ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸಕ್ಕೆ ಅನ್ವಯಿಸುತ್ತೀರಿ
- ಮೂಲಸೌಕರ್ಯ ಅಪ್ಡೇಟ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಿ ಮೂಲಸೌಕರ್ಯ ಆವೃತ್ತಿ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ

## ಮೂಲಸೌಕರ್ಯ ಪ್ರೊವಿಷನ್ ಅವಲೋಕನ

Azure Developer CLI ಹಲವಾರು ಮೂಲಸೌಕರ್ಯವನ್ನು ಕೋಡ್ (IaC) ಪೂರೈಕೆದಾರರನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ:
- **Bicep** (ಶಿಫಾರಸು) - Azure ನ ಡೊಮೈನ್-ನಿರ್ದಿಷ್ಟ ಭಾಷೆ
- **ARM ಟೆಂಪ್ಲೇಟುಗಳು** - JSON ಆಧಾರಿತ Azure Resource Manager ಟೆಂಪ್ಲೇಟುಗಳು
- **Terraform** - ಬಹು-ಕ್ಲೌಡ್ ಮೂಲಸೌಕರ್ಯ ಸಾಧನ
- **Pulumi** - ಆಧುನಿಕ ಮೂಲಸೌಕರ್ಯವನ್ನು ಕೋಡ್ ಮೂಲಕ ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಗಳಲ್ಲಿ

## Azure ಸಂಪತ್ತುಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಸಂಪತ್ತು ಹೈರಾರ್ಕಿ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಸಾಮಾನ್ಯ Azure ಸೇವೆಗಳು
- **ಕಂಪ್ಯೂಟ್**: App Service, Container Apps, Functions, Virtual Machines
- **ಸ್ಟೋರೇಜ್**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **ನೆಟ್‌ವರ್ಕಿಂಗ್**: Virtual Network, Application Gateway, CDN
- **ಭದ್ರತೆ**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟುಗಳು

### ಮೂಲ Bicep ಟೆಂಪ್ಲೇಟು ರಚನೆ
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

#### ಮಾಡ್ಯುಲರ್ ಮೂಲಸೌಕರ್ಯ
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

#### ಷರತ್ತುಬದ್ಧ ಸಂಪತ್ತು ಸೃಷ್ಟಿ
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

## 🗃️ ಡೇಟಾಬೇಸ್ ಪ್ರೊವಿಷನ್

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

### Key Vault ಇಂಟಿಗ್ರೇಶನ್
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

### ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಕಾನ್ಫಿಗರೇಶನ್
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

## 🌍 ನೆಟ್‌ವರ್ಕಿಂಗ್ ಮತ್ತು ಸಂಪರ್ಕ

### Virtual Network ಕಾನ್ಫಿಗರೇಶನ್
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

### SSL ಸಹಿತ Application Gateway
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

## 📊 ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಆಬ್ಸರ್ವಬಿಲಿಟಿ

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

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ಸ್ ಮತ್ತು ಅಲರ್ಟ್‌ಗಳು
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

## 🔧 ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು

### ವಿಭಿನ್ನ ಪರಿಸರಗಳಿಗೆ ಪ್ಯಾರಾಮೀಟರ್ ಫೈಲ್‌ಗಳು
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

### ಷರತ್ತುಬದ್ಧ ಸಂಪತ್ತು ಪ್ರೊವಿಷನ್
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

## 🚀 ಪ್ರಗತಿಶೀಲ ಪ್ರೊವಿಷನ್ ಮಾದರಿಗಳು

### ಬಹು-ಪ್ರಾದೇಶಿಕ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
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

### ಮೂಲಸೌಕರ್ಯ ಪರೀಕ್ಷೆ
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

## 🧪 ಮೂಲಸೌಕರ್ಯ ಪೂರ್ವದೃಶ್ಯ ಮತ್ತು ಮಾನ್ಯತೆ (ಹೊಸದು)

### ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮುನ್ನ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯಗೊಳಿಸಿ

`azd provision --preview` ವೈಶಿಷ್ಟ್ಯವು **ಮೂಲಸೌಕರ್ಯ ಪ್ರೊವಿಷನ್ ಅನ್ನು ಅನುಕರಿಸುತ್ತದೆ** ಸಂಪತ್ತುಗಳನ್ನು ವಾಸ್ತವವಾಗಿ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು. ಇದು `terraform plan` ಅಥವಾ `bicep what-if` ಗೆ ಸಮಾನವಾಗಿದೆ, ನಿಮ್ಮ Azure ಪರಿಸರದಲ್ಲಿ ಯಾವ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಲಾಗುತ್ತದೆ ಎಂಬ **ಡ್ರೈ-ರನ್ ದೃಶ್ಯವನ್ನು** ನೀಡುತ್ತದೆ.

#### 🛠️ ಇದು ಏನು ಮಾಡುತ್ತದೆ
- **ನಿಮ್ಮ IaC ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸುತ್ತದೆ** (Bicep ಅಥವಾ Terraform)
- **ಸಂಪತ್ತು ಬದಲಾವಣೆಗಳ ಪೂರ್ವದೃಶ್ಯವನ್ನು ತೋರಿಸುತ್ತದೆ**: ಸೇರ್ಪಡೆಗಳು, ಅಳಿಕೆಗಳು, ಅಪ್ಡೇಟ್‌ಗಳು
- **ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸುವುದಿಲ್ಲ** — ಇದು ಓದು-ಮಾತ್ರ ಮತ್ತು ಚಲಾಯಿಸಲು ಸುರಕ್ಷಿತವಾಗಿದೆ

#### � ಬಳಕೆ ಪ್ರಕರಣಗಳು
```bash
# ನಿಯೋಜನೆಯ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯನ ಮಾಡಿ
azd provision --preview

# ವಿವರವಾದ ಔಟ್‌ಪುಟ್‌ನೊಂದಿಗೆ ಪೂರ್ವದೃಶ್ಯನ ಮಾಡಿ
azd provision --preview --output json

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರಕ್ಕಾಗಿ ಪೂರ್ವದೃಶ್ಯನ ಮಾಡಿ
azd provision --preview --environment production
```

ಈ ಆಜ್ಞವು ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ:
- **ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ** ಸಂಪತ್ತುಗಳನ್ನು ಕಮಿಟ್ ಮಾಡುವ ಮೊದಲು
- **ಅನುಕೂಲತೆಯ ತಪ್ಪುಗಳನ್ನು ಶೀಘ್ರದಲ್ಲೇ ಹಿಡಿಯಿರಿ** ಅಭಿವೃದ್ಧಿ ಚಕ್ರದಲ್ಲಿ
- **ತಂಡದ ಪರಿಸರದಲ್ಲಿ ಸುರಕ್ಷಿತವಾಗಿ ಸಹಕರಿಸಿ**
- **ಅನಿರೀಕ್ಷಿತ ಬದಲಾವಣೆಗಳಿಲ್ಲದೆ ಕನಿಷ್ಠ-ಅಧಿಕಾರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು ಖಚಿತಪಡಿಸಿ**

ಇದು ವಿಶೇಷವಾಗಿ ಉಪಯುಕ್ತವಾಗುತ್ತದೆ:
- ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ಪರಿಸರಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡುವಾಗ
- ಉತ್ಪಾದನಾ ಮೂಲಸೌಕರ್ಯದಲ್ಲಿ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡುತ್ತಿರುವಾಗ
- PR ಅನುಮೋದನೆಯ ಮೊದಲು ಟೆಂಪ್ಲೇಟು ಬದಲಾವಣೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸುವಾಗ
- ಹೊಸ ತಂಡದ ಸದಸ್ಯರನ್ನು ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳಲ್ಲಿ ತರಬೇತಿ ನೀಡುವಾಗ

### ಪೂರ್ವದೃಶ್ಯ ಔಟ್‌ಪುಟ್ ಉದಾಹರಣೆ
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

## �🔄 ಸಂಪತ್ತು ಅಪ್ಡೇಟ್‌ಗಳು ಮತ್ತು ಮೈಗ್ರೇಶನ್‌ಗಳು

### ಸುರಕ್ಷಿತ ಸಂಪತ್ತು ಅಪ್ಡೇಟ್‌ಗಳು
```bash
# ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯಗೊಳಿಸಿ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
azd provision --preview

# ಪೂರ್ವದೃಶ್ಯಗೊಳಿಸಿದ ನಂತರ ಬದಲಾವಣೆಗಳನ್ನು ಹಂತಹಂತವಾಗಿ ಅನ್ವಯಿಸಿ
azd provision --confirm-with-no-prompt

# ಅಗತ್ಯವಿದ್ದರೆ ಹಿಂದಕ್ಕೆ ಹೋಗಿ
azd provision --rollback
```

### ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್‌ಗಳು
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

### 1. ಸಂಪತ್ತು ಹೆಸರುकरण ಸಂಪ್ರದಾಯಗಳು
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ಟ್ಯಾಗಿಂಗ್ ತಂತ್ರ
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

### 3. ಪ್ಯಾರಾಮೀಟರ್ ಮಾನ್ಯತೆ
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

### 4. ಔಟ್‌ಪುಟ್ ಸಂಘಟನೆ
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

- [ಪೂರ್ವ-ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಯೋಜನೆ](../pre-deployment/capacity-planning.md) - ಸಂಪತ್ತು ಲಭ್ಯತೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../troubleshooting/common-issues.md) - ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ
- [ಡಿಬಗಿಂಗ್ ಗೈಡ್](../troubleshooting/debugging.md) - ಪ್ರೊವಿಷನ್ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಿ
- [SKU ಆಯ್ಕೆ](../pre-deployment/sku-selection.md) - ಸೂಕ್ತ ಸೇವಾ ಮಟ್ಟಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ

## ಹೆಚ್ಚುವರಿ ಸಂಪತ್ತುಗಳು

- [Azure Bicep ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ಟೆಂಪ್ಲೇಟುಗಳು](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure ಆರ್ಕಿಟೆಕ್ಚರ್ ಸೆಂಟರ್](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ಉತ್ತಮ-ಆರ್ಕಿಟೆಕ್ಟೆಡ್ ಫ್ರೇಮ್‌ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಗೈಡ್](deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಕ್ಷಮತೆ ಯೋಜನೆ](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮಾಕ್ಷ್ಯತೆ**:  
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸಮಾಕ್ಷ್ಯತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
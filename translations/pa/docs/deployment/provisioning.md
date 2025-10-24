<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d02f62a3017cc4c95dee2c496218ac8a",
  "translation_date": "2025-10-24T17:07:11+00:00",
  "source_file": "docs/deployment/provisioning.md",
  "language_code": "pa"
}
-->
# AZD ਨਾਲ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 4 - ਕੋਡ ਵਜੋਂ ਢਾਂਚਾ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ
- **⬅️ ਪਿਛਲਾ**: [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ AI ਹੱਲ](../../examples/retail-scenario.md)
- **🔧 ਸੰਬੰਧਿਤ**: [ਅਧਿਆਇ 6: ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ](../pre-deployment/capacity-planning.md)

## ਜਾਣ ਪਛਾਣ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਪ੍ਰਬੰਧਨ ਬਾਰੇ ਸਭ ਕੁਝ ਸਿਖਾਉਂਦੀ ਹੈ। ਬੇਸਿਕ ਸਰੋਤ ਬਣਾਉਣ ਤੋਂ ਲੈ ਕੇ ਉੱਚ-ਪੱਧਰੀ ਇੰਟਰਪ੍ਰਾਈਜ਼-ਗ੍ਰੇਡ ਢਾਂਚਾ ਆਰਕੀਟੈਕਚਰ ਤੱਕ Infrastructure as Code (IaC) ਪੈਟਰਨ ਨੂੰ Bicep, ARM ਟੈਂਪਲੇਟ, Terraform, ਅਤੇ Pulumi ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਲਾਗੂ ਕਰਨ ਦਾ ਤਰੀਕਾ ਸਿੱਖੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- Infrastructure as Code ਦੇ ਸਿਧਾਂਤਾਂ ਅਤੇ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਵਿੱਚ ਮਾਹਰ ਹੋ ਜਾਵੋਗੇ
- Azure Developer CLI ਦੁਆਰਾ ਸਮਰਥਿਤ ਕਈ IaC ਪ੍ਰਦਾਤਾਵਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਲਈ Bicep ਟੈਂਪਲੇਟ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰੋਗੇ
- ਸਰੋਤ ਪੈਰਾਮੀਟਰ, ਵੈਰੀਏਬਲ, ਅਤੇ ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਾਂ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋਗੇ
- ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸਮੇਤ ਉੱਚ-ਪੱਧਰੀ ਢਾਂਚਾ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋਗੇ
- ਸਰੋਤਾਂ ਦੇ ਜੀਵਨ ਚੱਕਰ, ਅਪਡੇਟਸ, ਅਤੇ ਨਿਰਭਰਤਾ ਹੱਲ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- Bicep ਅਤੇ ARM ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਢਾਂਚਾ ਡਿਜ਼ਾਈਨ ਅਤੇ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨ ਲਈ
- ਸਹੀ ਸਰੋਤ ਨਿਰਭਰਤਾਵਾਂ ਨਾਲ ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ ਕਨਫਿਗਰ ਕਰਨ ਲਈ
- ਕਈ ਵਾਤਾਵਰਣਾਂ ਅਤੇ ਕਨਫਿਗਰੇਸ਼ਨ ਲਈ ਪੈਰਾਮੀਟਰਾਈਜ਼ਡ ਟੈਂਪਲੇਟ ਲਾਗੂ ਕਰਨ ਲਈ
- ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰਨ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹਿਅਰ ਨੂੰ ਹੱਲ ਕਰਨ ਲਈ
- Azure Well-Architected Framework ਦੇ ਸਿਧਾਂਤਾਂ ਨੂੰ ਢਾਂਚਾ ਡਿਜ਼ਾਈਨ 'ਤੇ ਲਾਗੂ ਕਰਨ ਲਈ
- ਢਾਂਚਾ ਅਪਡੇਟਸ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨ ਅਤੇ ਢਾਂਚਾ ਵਰਜਨਿੰਗ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨ ਲਈ

## ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਝਲਕ

Azure Developer CLI ਕਈ Infrastructure as Code (IaC) ਪ੍ਰਦਾਤਾਵਾਂ ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ:
- **Bicep** (ਸਿਫਾਰਸ਼ੀ) - Azure ਦੀ ਡੋਮੇਨ-ਵਿਸ਼ੇਸ਼ ਭਾਸ਼ਾ
- **ARM ਟੈਂਪਲੇਟ** - JSON-ਅਧਾਰਿਤ Azure Resource Manager ਟੈਂਪਲੇਟ
- **Terraform** - ਮਲਟੀ-ਕਲਾਉਡ ਢਾਂਚਾ ਟੂਲ
- **Pulumi** - ਆਧੁਨਿਕ Infrastructure as Code ਪ੍ਰੋਗਰਾਮਿੰਗ ਭਾਸ਼ਾਵਾਂ ਨਾਲ

## Azure ਸਰੋਤਾਂ ਨੂੰ ਸਮਝਣਾ

### ਸਰੋਤ ਹਾਇਰਾਰਕੀ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ਐਪਲੀਕੇਸ਼ਨ ਲਈ ਆਮ Azure ਸੇਵਾਵਾਂ
- **ਕੰਪਿਊਟ**: ਐਪ ਸਰਵਿਸ, ਕੰਟੇਨਰ ਐਪਸ, ਫੰਕਸ਼ਨਸ, ਵਰਚੁਅਲ ਮਸ਼ੀਨਸ
- **ਸਟੋਰੇਜ**: ਸਟੋਰੇਜ ਅਕਾਊਂਟ, Cosmos DB, SQL ਡਾਟਾਬੇਸ, PostgreSQL
- **ਨੈਟਵਰਕਿੰਗ**: ਵਰਚੁਅਲ ਨੈਟਵਰਕ, ਐਪਲੀਕੇਸ਼ਨ ਗੇਟਵੇ, CDN
- **ਸੁਰੱਖਿਆ**: ਕੀ ਵੌਲਟ, ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ, ਲੌਗ ਐਨਾਲਿਟਿਕਸ
- **AI/ML**: ਕੋਗਨਿਟਿਵ ਸੇਵਾਵਾਂ, OpenAI, ਮਸ਼ੀਨ ਲਰਨਿੰਗ

## Bicep ਢਾਂਚਾ ਟੈਂਪਲੇਟ

### ਬੇਸਿਕ Bicep ਟੈਂਪਲੇਟ ਸਟ੍ਰਕਚਰ
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

### ਉੱਚ-ਪੱਧਰੀ Bicep ਪੈਟਰਨ

#### ਮੋਡਿਊਲਰ ਢਾਂਚਾ
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

#### ਸ਼ਰਤਾਂ ਵਾਲਾ ਸਰੋਤ ਬਣਾਉਣ
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

## 🗃️ ਡਾਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

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

## 🔒 ਸੁਰੱਖਿਆ ਅਤੇ ਰਾਜ਼ ਪ੍ਰਬੰਧਨ

### ਕੀ ਵੌਲਟ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

### ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਕਨਫਿਗਰੇਸ਼ਨ
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

## 🌍 ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਕਨੈਕਟਿਵਿਟੀ

### ਵਰਚੁਅਲ ਨੈਟਵਰਕ ਕਨਫਿਗਰੇਸ਼ਨ
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

### SSL ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਗੇਟਵੇ
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

## 📊 ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਮਾਨਤਾ

### ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ
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

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਅਤੇ ਅਲਰਟਸ
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

## 🔧 ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਕਨਫਿਗਰੇਸ਼ਨ

### ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣਾਂ ਲਈ ਪੈਰਾਮੀਟਰ ਫਾਈਲਾਂ
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

### ਸ਼ਰਤਾਂ ਵਾਲੀ ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
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

## 🚀 ਉੱਚ-ਪੱਧਰੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਪੈਟਰਨ

### ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ
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

### ਢਾਂਚਾ ਟੈਸਟਿੰਗ
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

## 🧪 ਢਾਂਚਾ ਝਲਕ ਅਤੇ ਵੈਰੀਫਿਕੇਸ਼ਨ (ਨਵਾਂ)

### ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚਾ ਬਦਲਾਅ ਦੀ ਝਲਕ

`azd provision --preview` ਫੀਚਰ ਤੁਹਾਨੂੰ **ਸਰੋਤਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨੂੰ ਨਕਲ ਕਰਨ** ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ। ਇਹ `terraform plan` ਜਾਂ `bicep what-if` ਦੇ ਜੇਹੇ ਹੈ, ਜੋ ਤੁਹਾਨੂੰ **ਡ੍ਰਾਈ-ਰਨ ਦ੍ਰਿਸ਼** ਦਿੰਦਾ ਹੈ ਕਿ ਤੁਹਾਡੇ Azure ਵਾਤਾਵਰਣ ਵਿੱਚ ਕੀ ਬਦਲਾਅ ਕੀਤੇ ਜਾਣਗੇ।

#### 🛠️ ਇਹ ਕੀ ਕਰਦਾ ਹੈ
- **ਤੁਹਾਡੇ IaC ਟੈਂਪਲੇਟਸ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ** (Bicep ਜਾਂ Terraform)
- **ਸਰੋਤ ਬਦਲਾਅ ਦੀ ਝਲਕ ਦਿਖਾਉਂਦਾ ਹੈ**: ਸ਼ਾਮਲ ਕਰਨਾ, ਹਟਾਉਣਾ, ਅਪਡੇਟਸ
- **ਬਦਲਾਅ ਲਾਗੂ ਨਹੀਂ ਕਰਦਾ** — ਇਹ ਸਿਰਫ ਪੜ੍ਹਨ-ਯੋਗ ਹੈ ਅਤੇ ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ ਹੈ

#### � ਵਰਤੋਂ ਦੇ ਕੇਸ
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview with detailed output
azd provision --preview --output json

# Preview for specific environment
azd provision --preview --environment production
```

ਇਹ ਕਮਾਂਡ ਤੁਹਾਨੂੰ ਮਦਦ ਕਰਦੀ ਹੈ:
- **ਸਰੋਤ ਬਦਲਾਅ ਦੀ ਵੈਰੀਫਿਕੇਸ਼ਨ** ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ
- **ਵਿਕਾਸ ਚੱਕਰ ਵਿੱਚ ਜਲਦੀ ਗਲਤ ਕਨਫਿਗਰੇਸ਼ਨ ਪਕੜੋ**
- **ਟੀਮ ਵਾਤਾਵਰਣ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਹਿਯੋਗ ਕਰੋ**
- **ਘੱਟੋ-ਘੱਟ ਅਧਿਕਾਰਾਂ ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਯਕੀਨੀ ਬਣਾਓ** ਬਿਨਾਂ ਹੈਰਾਨੀ ਦੇ

ਇਹ ਖਾਸ ਤੌਰ 'ਤੇ ਲਾਭਦਾਇਕ ਹੈ ਜਦੋਂ:
- ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ ਵਾਤਾਵਰਣਾਂ ਨਾਲ ਕੰਮ ਕਰਨਾ
- ਉਤਪਾਦਨ ਢਾਂਚਾ ਵਿੱਚ ਬਦਲਾਅ ਕਰਨਾ
- PR ਮਨਜ਼ੂਰੀ ਤੋਂ ਪਹਿਲਾਂ ਟੈਂਪਲੇਟ ਸੋਧਾਂ ਦੀ ਵੈਰੀਫਿਕੇਸ਼ਨ
- ਨਵੇਂ ਟੀਮ ਮੈਂਬਰਾਂ ਨੂੰ ਢਾਂਚਾ ਪੈਟਰਨ 'ਤੇ ਸਿਖਾਉਣਾ

### ਝਲਕ ਆਉਟਪੁੱਟ ਦਾ ਉਦਾਹਰਨ
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

## �🔄 ਸਰੋਤ ਅਪਡੇਟਸ ਅਤੇ ਮਾਈਗ੍ਰੇਸ਼ਨ

### ਸੁਰੱਖਿਅਤ ਸਰੋਤ ਅਪਡੇਟਸ
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes incrementally after preview
azd provision --confirm-with-no-prompt

# Rollback if needed
azd provision --rollback
```

### ਡਾਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ
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

## 🎯 ਸਰੋਤਾਂ ਲਈ ਵਧੀਆ ਤਰੀਕੇ

### 1. ਸਰੋਤ ਨਾਮਕਰਨ ਸੰਮਝੌਤਾ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ਟੈਗਿੰਗ ਰਣਨੀਤੀ
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

### 3. ਪੈਰਾਮੀਟਰ ਵੈਰੀਫਿਕੇਸ਼ਨ
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

### 4. ਆਉਟਪੁੱਟ ਦਾ ਪ੍ਰਬੰਧਨ
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

## ਅਗਲੇ ਕਦਮ

- [ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਯੋਜਨਾ](../pre-deployment/capacity-planning.md) - ਸਰੋਤ ਉਪਲਬਧਤਾ ਦੀ ਵੈਰੀਫਿਕੇਸ਼ਨ ਕਰੋ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../troubleshooting/common-issues.md) - ਢਾਂਚਾ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](../troubleshooting/debugging.md) - ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰੋ
- [SKU ਚੋਣ](../pre-deployment/sku-selection.md) - ਉਚਿਤ ਸੇਵਾ ਪੱਧਰ ਚੁਣੋ

## ਵਾਧੂ ਸਰੋਤ

- [Azure Bicep ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ਟੈਂਪਲੇਟ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure ਆਰਕੀਟੈਕਚਰ ਸੈਂਟਰ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸਮਰੱਥਾ ਯੋਜਨਾ](../pre-deployment/capacity-planning.md)

---

**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
# AZD ਨਾਲ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 4 - ਇਨਫਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ
- **⬅️ ਪਿਛਲਾ**: [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ AI ਹੱਲ](../../examples/retail-scenario.md)
- **🔧 ਸੰਬੰਧਤ**: [ਅਧਿਆਇ 6: ਪੂਰਵ-ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਮਾਣੀਕਰਨ](../chapter-06-pre-deployment/capacity-planning.md)

## ਪਰਿਚੈ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਪ੍ਰਬੰਧਨ ਬਾਰੇ ਤੁਹਾਨੂੰ ਜਾਣਣ ਲਾਇਕ ਹਰ ਚੀਜ਼ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। Bicep, ARM ਟੈਂਪਲੇਟਸ, Terraform ਅਤੇ Pulumi ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਬੁਨਿਆਦੀ ਸਰੋਤ ਬਣਾਉਣ ਤੋਂ ਲੈ ਕੇ ਐਡਵਾਂਸਡ ਏਂਟਰਪ੍ਰਾਈਜ਼-ਗਰੇਡ ਇਨਫਰਾਸਟਰਕਚਰ ਆਰਕੀਟੈਕਚਰ ਤੱਕ Infrastructure as Code (IaC) ਪੈਟਰਨ ਲਾਗੂ ਕਰਨਾ ਸਿੱਖੋ।

## ਸਿੱਖਣ ਦੇ ਲਕ਼ਸ਼

By completing this guide, you will:
- Infrastructure as Code ਦੇ ਅਸੂਲਾਂ ਅਤੇ Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ 'ਚ ਮਾਹਿਰ ਹੋਵੋ
- Azure Developer CLI ਵੱਲੋਂ ਸਹਾਇਤ ਕੀਤੇ ਗਏ ਕਈ IaC ਪ੍ਰਦਾਤਿਆਂ ਨੂੰ ਸਮਝੋ
- ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਲਈ Bicep ਟੈਂਪਲੇਟ ਡਿਜ਼ਾਇਨ ਅਤੇ ਲਾਗੂ ਕਰੋ
- ਰਿਸੋర్స ਪੈਰਾਮੀਟਰ, ਵੈਰੀਏਬਲ, ਅਤੇ ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ ਸੈਟਿੰਗਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
- ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸਮੇਤ ਐਡਵਾਂਸਡ ਇਨਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- ਸਰੋਤਾਂ ਦੀ ਜੀਵਨ-ਚੱਕਰ, ਅਪਡੇਟਸ, ਅਤੇ ਡਿਪੈਂਡेंसी ਰੈਜ਼ੋਲਯੂਸ਼ਨ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

Upon completion, you will be able to:
- Bicep ਅਤੇ ARM ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਇਨਫਰਾਸਟਰਕਚਰ ਡਿਜ਼ਾਇਨ ਅਤੇ ਪ੍ਰੋਵਾਈਜਨ ਕਰੋ
- ਠੀਕ ਸਰੋਤ ਨਿਰਭਰਤਾਵਾਂ ਦੇ ਨਾਲ ਜਟਿਲ ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ ਸੰਰਚਿਤ ਕਰੋ
- ਕਈ ਵਾਤਾਵਰਣਾਂ ਅਤੇ ਸੰਰਚਨਾਵਾਂ ਲਈ ਪੈਰਾਮੀਟਰਾਈਜ਼ਡ ਟੈਂਪਲੇਟ ਲਾਗੂ ਕਰੋ
- ਇਨਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰੋ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਫੇਲਯਰਜ਼ ਹੱਲ ਕਰੋ
- Azure Well-Architected Framework ਦੇ ਸਿਧਾਂਤਾਂ ਨੂੰ ਇਨਫਰਾਸਟਰਕਚਰ ਡਿਜ਼ਾਇਨ 'ਚ ਲਾਗੂ ਕਰੋ
- ਇਨਫਰਾਸਟਰਕਚਰ ਅਪਡੇਟਸ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ ਅਤੇ ਇਨਫਰਾਸਟਰਕਚਰ ਵਰਜ਼ਨਿੰਗ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ

## ਇਨਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦਾ ਓਵਰਵਿਊ

Azure Developer CLI ਕਈ Infrastructure as Code (IaC) ਪ੍ਰਦਾਤਿਆਂ ਦਾ ਸਮਰਥਨ ਕਰਦਾ ਹੈ:
- **Bicep** (ਸਿਫਾਰਸ਼ ਕੀਤੀ) - Azure ਦੀ ਡੋਮੇਨ-ਨਿਰਧਾਰਤ ਭਾਸ਼ਾ
- **ARM Templates** - JSON-ਅਧਾਰਿਤ Azure Resource Manager ਟੈਂਪਲੇਟਸ
- **Terraform** - ਮਲਟੀ-ਕਲਾਉਡ ਇਨਫਰਾਸਟਰਕਚਰ ਟੂਲ
- **Pulumi** - ਪ੍ਰੋਗ੍ਰਾਮਿੰਗ ਭਾਸ਼ਾਵਾਂ ਨਾਲ ਆਧੁਨਿਕ Infrastructure as Code

## Azure ਸਰੋਤਾਂ ਨੂੰ ਸਮਝਣਾ

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਆਮ Azure ਸਰਵਿਸਜ਼
- **ਕੰਪਿਊਟ**: App Service, Container Apps, Functions, Virtual Machines
- **ਸਟੋਰੇਜ**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **ਨੈਟਵਰਕਿੰਗ**: Virtual Network, Application Gateway, CDN
- **ਸੁਰੱਖਿਆ**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep ਇਨਫਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟਸ

### ਮੂਲ Bicep ਟੈਂਪਲੇਟ ਢਾਂਚਾ
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

### ਐਡਵਾਂਸਡ Bicep ਪੈਟਰਨ

#### ਮਾਡਿਊਲਰ ਇਨਫਰਾਸਟਰਕਚਰ
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

#### ਸ਼ਰਤੀ ਸਰੋਤ ਬਣਾਉਣਾ
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

## 🗃️ ਡੇਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

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

## 🔒 ਸੁਰੱਖਿਆ ਅਤੇ ਸੀਕ੍ਰੇਟਸ ਪ੍ਰਬੰਧਨ

### Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

### Managed Identity ਸੰਰਚਨਾ
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

### Virtual Network ਸੰਰਚਨਾ
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

### Application Gateway SSL ਨਾਲ
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

## 📊 ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਨਿਰੀਖਣਯੋਗਤਾ

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

## 🔧 ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ ਸੰਰਚਨਾਵਾਂ

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

### ਸ਼ਰਤੀ ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
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

## 🚀 ਐਡਵਾਂਸਡ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਪੈਟਰਨ

### ਬਹੁ-ਰੀਜਨ ਡਿਪਲੋਇਮੈਂਟ
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

### ਇਨਫਰਾਸਟਰਕਚਰ ਟੈਸਟਿੰਗ
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

## 🧪 ਇਨਫਰਾਸਟਰਕਚਰ ਪ੍ਰੀਵਿਊ ਅਤੇ ਪ੍ਰਮਾਣੀਕਰਨ (ਨਵਾਂ)

### ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਇਨਫਰਾਸਟਰਕਚਰ ਤਬਦੀਲੀਆਂ ਦੀ ਪੂਰਵ-ਝਲਕ

The `azd provision --preview` feature lets you **simulate infrastructure provisioning** before actually deploying resources. It's similar in spirit to `terraform plan` or `bicep what-if`, giving you a **dry-run view** of what changes would be made to your Azure environment.

#### 🛠️ ਇਹ ਕੀ ਕਰਦਾ ਹੈ
- **ਤੁਹਾਡੇ IaC ਟੈਂਪਲੇਟਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ** (Bicep ਜਾਂ Terraform)
- **ਸਰੋਤ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਝਲਕ ਦਿਖਾਉਂਦਾ ਹੈ**: additions, deletions, updates
- **ਤਬਦੀਲੀਆਂ ਲਾਗੂ ਨਹੀਂ ਕਰਦਾ** — ਇਹ ਕੇਵਲ ਪੜ੍ਹਨਯੋਗ ਹੈ ਅਤੇ ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ ਹੈ

#### � ਉਪਯੋਗ ਮਾਮਲੇ
```bash
# ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚੇ ਵਿੱਚ ਹੋਣ ਵਾਲੇ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਜਾਂਚ
azd provision --preview

# ਵਿਸਤ੍ਰਿਤ ਆਉਟਪੁਟ ਨਾਲ ਪੂਰਵ-ਜਾਂਚ
azd provision --preview --output json

# ਕਿਸੇ ਖਾਸ ਮਾਹੌਲ ਲਈ ਪੂਰਵ-ਜਾਂਚ
azd provision --preview --environment production
```

This command helps you:
- **ਰਿਸੋਰਸ ਸਪੁਰਦਗੀ ਤੋਂ ਪਹਿਲਾਂ ਇਨਫਰਾਸਟਰਕਚਰ ਬਦਲਾਵਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ**
- **ਵਿਕਾਸ ਚੱਕਰ ਵਿੱਚ ਗਲਤ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਪਹਿਲਾਂ ਹੀ ਫੜੋ**
- **ਟੀਮ ਮਾਹੌਲਾਂ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਹਿਯੋਗ ਕਰੋ**
- **ਬਿਨਾਂ ਕਿਸੇ ਹੈਰਾਨੀ ਦੇ ਘੱਟੋ-ਘੱਟ-ਅਧਿਕਾਰ ਵਾਲੀਆਂ ਡਿਪਲੋਇਮੈਂਟ ਯਕੀਨੀ ਬਣਾਓ**

It's especially useful when:
- ਜਟਿਲ ਬਹੁ-ਸੇਵਾ ਮਾਹੌਲਾਂ 'ਤੇ ਕੰਮ ਕਰ ਰਹੇ ਹੋ
- ਪ੍ਰੋਡਕਸ਼ਨ ਇਨਫਰਾਸਟਰਕਚਰ ਵਿੱਚ ਤਬਦੀਲੀਆਂ ਕਰ ਰਹੇ ਹੋ
- PR ਮਨਜ਼ੂਰੀ ਤੋਂ ਪਹਿਲਾਂ ਟੈਂਪਲੇਟ ਤਬਦੀਲੀਆਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰ ਰਹੇ ਹੋ
- ਇਨਫਰਾਸਟਰਕਚਰ ਪੈਟਰਨਜ਼ 'ਤੇ ਨਵੇਂ ਟੀਮ ਮੈਂਬਰਾਂ ਨੂੰ ਟਰੇਨ ਕਰ ਰਹੇ ਹੋ

### ਉਦਾਹਰਨ ਪੂਰਵ-ਝਲਕ ਆਉਟਪੁਟ
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

## �🔄 ਸਰੋਤ ਅਪਡੇਟਸ ਅਤੇ ਮਾਈਗ੍ਰੇਸ਼ਨਸ

### ਸੁਰੱਖਿਅਤ ਸਰੋਤ ਅਪਡੇਟਸ
```bash
# ਪਹਿਲਾਂ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਵਿੱਚ ਹੋਣ ਵਾਲੀਆਂ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰੀਵਿਊ ਕਰੋ (ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ)
azd provision --preview

# ਪ੍ਰੀਵਿਊ ਦੀ ਪੁਸ਼ਟੀ ਹੋਣ ਤੋਂ ਬਾਅਦ ਬਦਲਾਵ ਲਾਗੂ ਕਰੋ
azd provision --confirm-with-no-prompt

# ਰੋਲਬੈਕ ਲਈ, ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਵਿੱਚ ਕੀਤੀਆਂ ਬਦਲਾਵਾਂ ਨੂੰ ਵਾਪਸ ਕਰਨ ਲਈ Git ਵਰਤੋ:
git revert HEAD  # ਆਖਰੀ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦਾ ਕਮਿਟ ਵਾਪਸ ਕਰੋ
azd provision    # ਪਿਛਲੇ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦੀ ਸਥਿਤੀ ਲਾਗੂ ਕਰੋ
```

### ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨਸ
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

## 🎯 ਵਧੀਆ ਅਭਿਆਸ

### 1. ਸਰੋਤ ਨਾਮਕਰਨ ਰੀਤੀਆਂ
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

### 3. ਪੈਰਾਮੀਟਰ ਪੁਸ਼ਟੀਕਰਨ
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

### 4. ਆਊਟਪੁਟ ਸੰਗਠਨ
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

- [ਪੂਰਵ-ਡਿਪਲੋਇਮੈਂਟ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਸਰੋਤ ਉਪਲਬਧਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../chapter-07-troubleshooting/common-issues.md) - ਇਨਫਰਾਸਟਰਕਚਰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟਰਬਲਸ਼ੂਟ ਕਰੋ
- [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](../chapter-07-troubleshooting/debugging.md) - ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
- [SKU ਚੋਣ](../chapter-06-pre-deployment/sku-selection.md) - ਉਚਿਤ ਸਰਵਿਸ ਟੀਅਰ ਚੁਣੋ

## ਅਤਿਰਿਕਤ ਸਾਧਨ

- [Azure Bicep ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ਟੈਂਪਲੇਟਸ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure ਆਰਕੀਟੈਕਚਰ ਸੈਂਟਰ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected ਫਰੇਮਵਰਕ](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਕੈਪੈਸਿਟੀ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਨ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਅਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਭੁੱਲਾਂ ਜਾਂ ਅਣਨੁਕੂਲਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਂ ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਉਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਭੁੱਲ-ਫਹਮੀ ਜਾਂ ਗਲਤ-ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
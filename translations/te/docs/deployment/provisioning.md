<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d02f62a3017cc4c95dee2c496218ac8a",
  "translation_date": "2025-11-25T08:08:32+00:00",
  "source_file": "docs/deployment/provisioning.md",
  "language_code": "te"
}
-->
# AZD తో Azure వనరులను ప్రొవిజన్ చేయడం

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 4 - కోడ్ & డిప్లాయ్‌మెంట్‌గా ఇన్‌ఫ్రాస్ట్రక్చర్
- **⬅️ గతం**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **➡️ తదుపరి చాప్టర్**: [చాప్టర్ 5: మల్టీ-ఏజెంట్ AI సొల్యూషన్స్](../../examples/retail-scenario.md)
- **🔧 సంబంధిత**: [చాప్టర్ 6: ప్రీ-డిప్లాయ్‌మెంట్ వాలిడేషన్](../pre-deployment/capacity-planning.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI ఉపయోగించి Azure వనరులను ప్రొవిజన్ చేయడం మరియు నిర్వహించడం గురించి మీకు అవసరమైన అన్ని విషయాలను కవర్ చేస్తుంది. Bicep, ARM టెంప్లేట్లు, Terraform, మరియు Pulumi ఉపయోగించి ప్రాథమిక వనరుల సృష్టి నుండి అధునాతన ఎంటర్‌ప్రైజ్-గ్రేడ్ ఇన్‌ఫ్రాస్ట్రక్చర్ ఆర్కిటెక్చర్ల వరకు కోడ్ (IaC) నమూనాలను అమలు చేయడం నేర్చుకోండి.

## అభ్యాస లక్ష్యాలు

ఈ గైడ్‌ను పూర్తి చేయడం ద్వారా, మీరు:
- కోడ్ (IaC) సూత్రాలను మరియు Azure వనరుల ప్రొవిజనింగ్‌ను మాస్టర్ చేయండి
- Azure Developer CLI ద్వారా మద్దతు ఇచ్చే IaC ప్రొవైడర్లను అర్థం చేసుకోండి
- సాధారణ అప్లికేషన్ ఆర్కిటెక్చర్ల కోసం Bicep టెంప్లేట్లను డిజైన్ చేయండి మరియు అమలు చేయండి
- వనరుల పారామీటర్లు, వేరియబుల్స్, మరియు పర్యావరణ-స్పెసిఫిక్ సెట్టింగ్లను కాన్ఫిగర్ చేయండి
- నెట్‌వర్కింగ్ మరియు భద్రత వంటి అధునాతన ఇన్‌ఫ్రాస్ట్రక్చర్ నమూనాలను అమలు చేయండి
- వనరుల జీవితచక్రం, నవీకరణలు, మరియు డిపెండెన్సీ రిజల్యూషన్‌ను నిర్వహించండి

## అభ్యాస ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు:
- Bicep మరియు ARM టెంప్లేట్లను ఉపయోగించి Azure ఇన్‌ఫ్రాస్ట్రక్చర్‌ను డిజైన్ చేయడం మరియు ప్రొవిజన్ చేయడం
- సరైన వనరుల డిపెండెన్సీలతో కాంప్లెక్స్ మల్టీ-సర్వీస్ ఆర్కిటెక్చర్లను కాన్ఫిగర్ చేయడం
- బహుళ పర్యావరణాలు మరియు కాన్ఫిగరేషన్ల కోసం పారామీటర్ చేయబడిన టెంప్లేట్లను అమలు చేయడం
- ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ సమస్యలను పరిష్కరించడం మరియు డిప్లాయ్‌మెంట్ వైఫల్యాలను పరిష్కరించడం
- Azure Well-Architected Framework సూత్రాలను ఇన్‌ఫ్రాస్ట్రక్చర్ డిజైన్‌కు వర్తింపజేయడం
- ఇన్‌ఫ్రాస్ట్రక్చర్ నవీకరణలను నిర్వహించడం మరియు ఇన్‌ఫ్రాస్ట్రక్చర్ వెర్షనింగ్ వ్యూహాలను అమలు చేయడం

## ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్ అవలోకనం

Azure Developer CLI అనేక కోడ్ (IaC) ప్రొవైడర్లకు మద్దతు ఇస్తుంది:
- **Bicep** (సిఫార్సు చేయబడింది) - Azure యొక్క డొమైన్-స్పెసిఫిక్ లాంగ్వేజ్
- **ARM టెంప్లేట్లు** - JSON-ఆధారిత Azure Resource Manager టెంప్లేట్లు
- **Terraform** - మల్టీ-క్లౌడ్ ఇన్‌ఫ్రాస్ట్రక్చర్ టూల్
- **Pulumi** - ప్రోగ్రామింగ్ భాషలతో ఆధునిక ఇన్‌ఫ్రాస్ట్రక్చర్ కోడ్

## Azure వనరులను అర్థం చేసుకోవడం

### వనరుల హైరార్కీ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### అప్లికేషన్ల కోసం సాధారణ Azure సేవలు
- **కంప్యూట్**: App Service, Container Apps, Functions, Virtual Machines
- **స్టోరేజ్**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **నెట్‌వర్కింగ్**: Virtual Network, Application Gateway, CDN
- **భద్రత**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు

### ప్రాథమిక Bicep టెంప్లేట్ నిర్మాణం
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

### అధునాతన Bicep నమూనాలు

#### మాడ్యులర్ ఇన్‌ఫ్రాస్ట్రక్చర్
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

#### షరతుల వనరుల సృష్టి
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

## 🗃️ డేటాబేస్ ప్రొవిజనింగ్

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

## 🔒 భద్రత మరియు రహస్యాల నిర్వహణ

### Key Vault ఇంటిగ్రేషన్
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

### మేనేజ్‌డ్ ఐడెంటిటీ కాన్ఫిగరేషన్
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

## 🌍 నెట్‌వర్కింగ్ మరియు కనెక్టివిటీ

### వర్చువల్ నెట్‌వర్క్ కాన్ఫిగరేషన్
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

### SSLతో అప్లికేషన్ గేట్‌వే
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

## 📊 మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

### అప్లికేషన్ ఇన్‌సైట్స్
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

### కస్టమ్ మెట్రిక్స్ మరియు అలర్ట్స్
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

## 🔧 పర్యావరణ-స్పెసిఫిక్ కాన్ఫిగరేషన్లు

### వివిధ పర్యావరణాల కోసం పారామీటర్ ఫైళ్లు
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

### షరతుల వనరుల ప్రొవిజనింగ్
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

## 🚀 అధునాతన ప్రొవిజనింగ్ నమూనాలు

### మల్టీ-రీజియన్ డిప్లాయ్‌మెంట్
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

### ఇన్‌ఫ్రాస్ట్రక్చర్ టెస్టింగ్
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

## 🧪 ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రివ్యూ & వాలిడేషన్ (కొత్త)

### డిప్లాయ్‌మెంట్ ముందు ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను ప్రివ్యూ చేయడం

`azd provision --preview` ఫీచర్ మీకు **ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌ను సిమ్యులేట్ చేయడానికి** అనుమతిస్తుంది, వనరులను నిజంగా డిప్లాయ్ చేయడానికి ముందు. ఇది `terraform plan` లేదా `bicep what-if` వంటి స్పిరిట్‌లో సమానంగా ఉంటుంది, మీ Azure పర్యావరణంలో ఏ మార్పులు చేయబడతాయో **డ్రై-రన్ వీక్షణ**ను అందిస్తుంది.

#### 🛠️ ఇది ఏమి చేస్తుంది
- **మీ IaC టెంప్లేట్లను విశ్లేషిస్తుంది** (Bicep లేదా Terraform)
- **వనరుల మార్పుల ప్రివ్యూ చూపిస్తుంది**: జోడింపులు, తొలగింపులు, నవీకరణలు
- **మార్పులను వర్తింపజేయదు** — ఇది రీడ్-ఓన్లీ మరియు రన్ చేయడానికి సురక్షితం

#### � ఉపయోగాలు
```bash
# మౌలిక సదుపాయ మార్పులను మోహరింపుకు ముందు ప్రివ్యూ చేయండి
azd provision --preview

# వివరమైన అవుట్‌పుట్‌తో ప్రివ్యూ చేయండి
azd provision --preview --output json

# నిర్దిష్ట వాతావరణానికి ప్రివ్యూ చేయండి
azd provision --preview --environment production
```

ఈ కమాండ్ మీకు సహాయపడుతుంది:
- **వనరుల మార్పులను ధృవీకరించండి** వనరులను కమిట్ చేయడానికి ముందు
- **డెవలప్‌మెంట్ సైకిల్‌లో తొందరగా తప్పులను గుర్తించండి**
- **టీమ్ పర్యావరణాల్లో సురక్షితంగా సహకరించండి**
- **అనుకోని పరిణామాలు లేకుండా తక్కువ-ప్రివిలేజ్ డిప్లాయ్‌మెంట్‌లను నిర్ధారించండి**

ఇది ముఖ్యంగా ఉపయోగకరంగా ఉంటుంది:
- కాంప్లెక్స్ మల్టీ-సర్వీస్ పర్యావరణాలతో పని చేస్తూ
- ప్రొడక్షన్ ఇన్‌ఫ్రాస్ట్రక్చర్‌లో మార్పులు చేస్తూ
- PR ఆమోదానికి ముందు టెంప్లేట్ మార్పులను ధృవీకరిస్తూ
- కొత్త టీమ్ సభ్యులను ఇన్‌ఫ్రాస్ట్రక్చర్ నమూనాలపై శిక్షణ ఇస్తూ

### ప్రివ్యూ అవుట్‌పుట్ ఉదాహరణ
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

## �🔄 వనరుల నవీకరణలు మరియు మైగ్రేషన్లు

### సురక్షిత వనరుల నవీకరణలు
```bash
# ముందుగా మౌలిక సదుపాయాల మార్పులను ప్రివ్యూ చేయండి (సిఫార్సు చేయబడింది)
azd provision --preview

# ప్రివ్యూ తర్వాత మార్పులను క్రమంగా అమలు చేయండి
azd provision --confirm-with-no-prompt

# అవసరమైతే రోల్బ్యాక్ చేయండి
azd provision --rollback
```

### డేటాబేస్ మైగ్రేషన్లు
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

## 🎯 ఉత్తమ పద్ధతులు

### 1. వనరుల నామకరణ కన్వెన్షన్లు
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ట్యాగింగ్ వ్యూహం
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

### 3. పారామీటర్ ధృవీకరణ
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

### 4. అవుట్‌పుట్ ఆర్గనైజేషన్
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

## తదుపరి దశలు

- [ప్రీ-డిప్లాయ్‌మెంట్ ప్లానింగ్](../pre-deployment/capacity-planning.md) - వనరుల లభ్యతను ధృవీకరించండి
- [సాధారణ సమస్యలు](../troubleshooting/common-issues.md) - ఇన్‌ఫ్రాస్ట్రక్చర్ సమస్యలను పరిష్కరించండి
- [డీబగ్గింగ్ గైడ్](../troubleshooting/debugging.md) - ప్రొవిజనింగ్ సమస్యలను డీబగ్ చేయండి
- [SKU ఎంపిక](../pre-deployment/sku-selection.md) - సరైన సేవా స్థాయిలను ఎంచుకోండి

## అదనపు వనరులు

- [Azure Bicep డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager టెంప్లేట్లు](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**నావిగేషన్**
- **గత పాఠం**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **తదుపరి పాఠం**: [క్యాపాసిటీ ప్లానింగ్](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
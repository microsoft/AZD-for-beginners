# AZD ఉపయోగించి Azure వనరుల ప్రావిజనింగ్

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోం**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 4 - ఇన్ఫ్రాస్ట్రక్చర్‌ను కోడ్‌గా మరియు డిప్లాయ్‌మెంట్
- **⬅️ మునుపటి**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **➡️ తదుపరి అధ్యాయం**: [అధ్యాయం 5: బహుళ-ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)
- **🔧 సంబంధిత**: [అధ్యాయం 6: ముందస్తు-డిప్లాయ్‌మెంట్ ధృవీకరణ](../chapter-06-pre-deployment/capacity-planning.md)

## పరిచయం

ఈ విస్తృతమైన మార్గనిర్దేశకం Azure Developer CLI ఉపయోగించి Azure వనరులను ప్రావిజన్ చేయడం మరియు నిర్వహించడం గురించి మీకు అవసరమైన ప్రతీ అంశాన్నీ కవర్ చేస్తుంది. Bicep, ARM టెంప్లేట్లు, Terraform, మరియు Pulumi ఉపయోగించి ప్రాథమిక వనరు సృష్టి నుండి అధునాతన ఎంటర్‌ప్రైజ్-గ్రేడ్ ఇన్ఫ్రాస్ట్రక్చర్ రూపకాల వరకు Infrastructure as Code (IaC) నమూనాలను అమలు చేయడం నేర్చుకోండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ గైడ్ పూర్తిచేసిన తర్వాత మీరు:
- ఇన్ఫ్రాస్ట్రక్చర్‌ను కోడ్‌గా చేసే సూత్రాలు మరియు Azure వనరుల ప్రావిజనింగ్‌లో పరిధి పొందుతారు
- Azure Developer CLI మద్దతు చేసే బహుళ IaC ప్రొవైడర్లను అర్థం చేసుకుంటారు
- సాధారణ అప్లికేషన్ ఆకృతుల కోసం Bicep టెంప్లేట్లను డిజైన్ చేసి అమలు చేయగలుగుతారు
- వనరు పారామీటర్లు, వేరియబుల్స్ మరియు వాతావరణ-నిర్ధిష్ట సెట్టింగులను కాన్ఫిగర్ చేయగలుగుతారు
- నెట్వర్కింగ్ మరియు సెక్యూరిటీ సహిత అధునాతన ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలను అమలు చేయగలుగుతారు
- వనరుల జీవిత చక్రం, అప్‌డేట్లు మరియు డిపెండెన్సీ పరిష్కారాన్ని నిర్వహించగలుగుతారు

## అభ్యాస ఫలితాలు

పూర్తి చేయగానే, మీరు చేయగలుగుతారు:
- Bicep మరియు ARM టెంప్లేట్లను ఉపయోగించి Azure ఇన్ఫ్రాస్ట్రక్చర్ డిజైన్ చేయడం మరియు ప్రావిజన్ చేయడం
- సరైన వనరు ఆధారిత డిపెండెన్సీలతో సంక్లిష్ట బహుళ-సర్వీస్ ఆర్కిటెక్చర్లను కాన్ఫిగర్ చేయడం
- బహుళ వాతావరణాలు మరియు కాన్ఫిగరేషన్ల కోసం పారామీటరైజ్డ్ టెంప్లేట్లను అమలు చేయడం
- ఇన్ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్ సమస్యలను ట్రబుల్షూట్ చేయడం మరియు డిప్లాయ్‌మెంట్ వైఫల్యాలను పరిష్కరించడం
- ఇన్ఫ్రాస్ట్రక్చర్ డిజైన్‌లో Azure Well-Architected Framework సూత్రాలను వర్తింపచేసడం
- ఇన్ఫ్రాస్ట్రక్చర్ అప్‌డేట్స్‌ను నిర్వహించడం మరియు ఇన్ఫ్రాస్ట్రక్చర్ వెర్షనింగ్ వ్యూహాలను అమలు చేయడం

## ఇన్ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్ అవలోకనం

Azure Developer CLI బహుళ Infrastructure as Code (IaC) ప్రొవైడర్లను మద్దతు చేస్తుంది:
- **Bicep** (సిఫార్సు చేయబడింది) - Azure యొక్క డొమైన్-నిర్దిష్ట భాష
- **ARM Templates** - JSON ఆధారిత Azure Resource Manager టెంప్లేట్లు
- **Terraform** - మల్టీ-క్లౌడ్ ఇన్ఫ్రాస్ట్రక్చర్ టూల్
- **Pulumi** - ప్రోగ్రామింగ్ భాషలతో ఆధునిక ఇన్ఫ్రాస్ట్రక్చర్ యాస్ కోడ్

## Azure వనరులను అర్థం చేసుకోవడం

### వనరుల హైరార్కీ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### అప్లికేషన్ల కోసం సాధారణ Azure సేవలు
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు

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

#### మాడ్యులర్ ఇన్ఫ్రాస్ట్రక్చర్
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

#### షరతు ఆధారంగా వనరుల సృష్టి
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

## 🗃️ డేటాబేస్ ప్రావిజనింగ్

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

## 🔒 సెక్యూరిటీ మరియు సీక్రెట్లు నిర్వహణ

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

### Managed Identity కాన్ఫిగరేషన్
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

### SSL తో అప్లికేషన్ గేట్వే
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

## 🔧 వాతావరణ-నిర్ధిష్ట కాన్ఫిగరేషన్లు

### వేర్వేరు వాతావరణాల కోసం పారామీటర్ ఫైళ్ళు
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

### షరతు ఆధారిత వనరుల ప్రావిజనింగ్
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

## 🚀 అధునాతన ప్రావిజనింగ్ నమూనాలు

### బహుళ-రిజియన్ డిప్లాయ్‌మెంట్
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

### ఇన్ఫ్రాస్ట్రక్చర్ టెస్టింగ్
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

## 🧪 ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ & ధృవీకరణ (కొత్త)

### డిప్లాయ్‌మెంట్‌కు ముందే ఇన్ఫ్రాస్ట్రక్చర్ మార్పుల ప్రివ్యూ

The `azd provision --preview` feature lets you **simulate infrastructure provisioning** before actually deploying resources. It's similar in spirit to `terraform plan` or `bicep what-if`, giving you a **dry-run view** of what changes would be made to your Azure environment.

#### 🛠️ అది చేసే పనులు
- **మీ IaC టెంప్లేట్లను విశ్లేషిస్తుంది** (Bicep లేదా Terraform)
- **వనరు మార్పుల ప్రివ్యూ చూపిస్తుంది**: జోడింపులు, తీసివేతలు, నవీకరణలు
- **మార్పులు వర్తింపచేయదు** — ఇది చదవ-only మరియు నడపడానికి భద్రంగా ఉంటుంది

#### � Use Cases
```bash
# డిప్లాయ్‌మెంట్‌కు ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను పూర్వదర్శనం చేయండి
azd provision --preview

# వివరణాత్మక అవుట్‌పుట్‌తో పూర్వదర్శనం చేయండి
azd provision --preview --output json

# నిర్దిష్ట పరిసరానికి పూర్వదర్శనం చేయండి
azd provision --preview --environment production
```

ఈ కమాండ్ మీకు సహాయపడుతుంది:
- **వనరు మార్పులను ధృవీకరించండి** రిసోర్సులను కమిట్ చేయకముందు
- **అసమర్థ కాన్ఫిగరేషన్లను తొలినుండి పట్టుకోండి** అభివృద్ధి చక్రంలో తొలుత
- **టీమ్ పరిసరాల్లో భద్రంగా కలిసి పని చేయడానికి** సాయపడుతుంది
- **ఆశ్చర్యాలు లేకుండా కనిష్ట-అధికారి డిప్లాయ్‌మెంట్స్‌ను నిర్ధారిస్తుంది**

ఇది ప్రత్యేకంగా ఉపయోగపడుతుంది:
- సంక్లిష్ట బహుళ-సర్వీస్ పరిసరాలతో పని చేశాక
- ఉత్పత్తి ఇన్ఫ్రాస్ట్రక్చర్‌లో మార్పులు చేయేటప్పుడు
- PR ఆమోదానికి ముందు టెంప్లేట్ మార్పులను ధృవీకరించేటప్పుడు
- ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలపై కొత్త టీమ్ సభ్యులను శిక్షణ ఇవ్వేటప్పుడు

### ఉదాహరణ ప్రివ్యూ అవుట్‌పుట్
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

## �🔄 వనరు నవీకరణలు మరియు మైగ్రేషన్లు

### సురక్షిత వనరుల నవీకరణలు
```bash
# ముందుగా ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను పూర్వావలోకనం చేయండి (సిఫార్సు చేయబడింది)
azd provision --preview

# పూర్వావలోకనం నిర్ధారించిన తర్వాత మార్పులను వర్తింపజేయండి
azd provision --confirm-with-no-prompt

# రోల్‌బ్యాక్ కోసం, ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను తిరిగి తీసుకురావడానికి Git ను ఉపయోగించండి:
git revert HEAD  # చివరి ఇన్ఫ్రాస్ట్రక్చర్ కమిట్‌ను రివర్ట్ చేయండి
azd provision    # మునుపటి ఇన్ఫ్రాస్ట్రక్చర్ స్థితిని వర్తింపజేయండి
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

## 🎯 ఉత్తమ ఆచరణలు

### 1. వనరు నామకరణ కన్వెన్షన్లు
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

### 4. అవుట్పుట్ సంస్థలీకరణ
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

- [ముందస్తు-డిప్లాయ్‌మెంట్ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md) - వనరుల లభ్యతను ధృవీకరించండి
- [సాధారణ సమస్యలు](../chapter-07-troubleshooting/common-issues.md) - ఇన్ఫ్రాస్ట్రక్చర్ సమస్యలను ట్రబుల్షూట్ చేయండి
- [డీబగింగ్ గైడ్](../chapter-07-troubleshooting/debugging.md) - ప్రావిజనింగ్ సమస్యలను డీబగ్ చేయండి
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సరైన సేవ స్థాయిలను ఎంచుకోండి

## అదనపు వనరులు

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **తదుపరి పాఠం**: [క్షమతా ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
అస్పష్టీకరణ:
ఈ దస్తావజ్ AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలిత అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండవచ్చునని దయచేసి గమనించండి. మూల భాషలో ఉన్న అసలు దస్తావజ్‌ను అధికారిక ప్రామాణిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదాన్ని సూచిస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వలన కలిగే ఏవైనా అపార్థాలు లేదా పొరపాట్ల కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d02f62a3017cc4c95dee2c496218ac8a",
  "translation_date": "2025-10-24T18:27:00+00:00",
  "source_file": "docs/deployment/provisioning.md",
  "language_code": "ta"
}
-->
# AZD மூலம் Azure வளங்களை உருவாக்குதல்

**அத்தியாய வழிகாட்டி:**
- **📚 பாடம் முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - குறுக்குவடிவ கோடுகள் மற்றும் வெளியீடு
- **⬅️ முந்தையது**: [வெளியீட்டு வழிகாட்டி](deployment-guide.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பல முகவர் AI தீர்வுகள்](../../examples/retail-scenario.md)
- **🔧 தொடர்புடையது**: [அத்தியாயம் 6: வெளியீட்டுக்கு முன் சரிபார்ப்பு](../pre-deployment/capacity-planning.md)

## அறிமுகம்

Azure Developer CLI பயன்படுத்தி Azure வளங்களை உருவாக்கவும் மேலாண்மை செய்யவும் தேவையான அனைத்தையும் இந்த விரிவான வழிகாட்டி கற்றுக்கொடுக்கிறது. Bicep, ARM templates, Terraform, மற்றும் Pulumi ஆகியவற்றைப் பயன்படுத்தி அடிப்படை வள உருவாக்கத்திலிருந்து மேம்பட்ட நிறுவனத்தரமான கட்டமைப்பு வடிவமைப்புகள் வரை குறுக்குவடிவ கோடுகள் (IaC) முறைகளை செயல்படுத்த கற்றுக்கொள்ளுங்கள்.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடிக்கும்போது, நீங்கள்:
- குறுக்குவடிவ கோடுகள் (IaC) கொள்கைகளை மற்றும் Azure வள உருவாக்கத்தை கற்றுக்கொள்வீர்கள்
- Azure Developer CLI ஆதரிக்கும் பல IaC வழங்குநர்களை புரிந்துகொள்வீர்கள்
- பொதுவான பயன்பாட்டு கட்டமைப்புகளுக்கான Bicep டெம்ப்ளேட்களை வடிவமைத்து செயல்படுத்துவீர்கள்
- வள அளவுருக்கள், மாறிகள் மற்றும் சூழல்-குறிப்பிட்ட அமைப்புகளை உள்ளமைக்கவும்
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பு உட்பட மேம்பட்ட கட்டமைப்பு முறைகளை செயல்படுத்தவும்
- வள வாழ்க்கைச்சுழற்சி, புதுப்பிப்புகள் மற்றும் சார்பு தீர்வுகளை மேலாண்மை செய்யவும்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள்:
- Bicep மற்றும் ARM டெம்ப்ளேட்களைப் பயன்படுத்தி Azure கட்டமைப்பை வடிவமைத்து உருவாக்க முடியும்
- சரியான வள சார்புகளுடன் சிக்கலான பல சேவை கட்டமைப்புகளை உள்ளமைக்க முடியும்
- பல சூழல்களுக்கும் அமைப்புகளுக்கும் பொருத்தமான அளவுரு டெம்ப்ளேட்களை செயல்படுத்த முடியும்
- கட்டமைப்பு உருவாக்க சிக்கல்களை தீர்க்கவும் வெளியீட்டு தோல்விகளை சரிசெய்யவும் முடியும்
- Azure Well-Architected Framework கொள்கைகளை கட்டமைப்பு வடிவமைப்பில் பயன்படுத்த முடியும்
- கட்டமைப்பு புதுப்பிப்புகளை மேலாண்மை செய்து கட்டமைப்பு பதிப்பு முறைகளை செயல்படுத்த முடியும்

## கட்டமைப்பு உருவாக்கத்தின் மேற்பார்வை

Azure Developer CLI பல குறுக்குவடிவ கோடுகள் (IaC) வழங்குநர்களை ஆதரிக்கிறது:
- **Bicep** (பரிந்துரைக்கப்படுகிறது) - Azure-இன் துறை-குறிப்பிட்ட மொழி
- **ARM Templates** - JSON-அடிப்படையிலான Azure Resource Manager டெம்ப்ளேட்கள்
- **Terraform** - பல மேக கட்டமைப்பு கருவி
- **Pulumi** - நவீன குறுக்குவடிவ கோடுகள் நிரலாக்க மொழிகளுடன்

## Azure வளங்களைப் புரிந்துகொள்வது

### வள வரிசைமை
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### பயன்பாடுகளுக்கான பொதுவான Azure சேவைகள்
- **கணினி**: App Service, Container Apps, Functions, Virtual Machines
- **சேமிப்பு**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **நெட்வொர்க்கிங்**: Virtual Network, Application Gateway, CDN
- **பாதுகாப்பு**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep கட்டமைப்பு டெம்ப்ளேட்கள்

### அடிப்படை Bicep டெம்ப்ளேட் அமைப்பு
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

### மேம்பட்ட Bicep முறைகள்

#### தொகுதி கட்டமைப்பு
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

#### நிபந்தனையுடன் வள உருவாக்கம்
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

## 🗃️ தரவுத்தொகை உருவாக்கம்

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

## 🔒 பாதுகாப்பு மற்றும் ரகசிய மேலாண்மை

### Key Vault ஒருங்கிணைப்பு
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

### மேலாண்மை அடையாள அமைப்பு
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

## 🌍 நெட்வொர்க்கிங் மற்றும் இணைப்பு

### Virtual Network அமைப்பு
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

### SSL உடன் Application Gateway
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

## 📊 கண்காணிப்பு மற்றும் கணிப்பீடு

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

### தனிப்பயன் அளவீடுகள் மற்றும் எச்சரிக்கைகள்
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

## 🔧 சூழல்-குறிப்பிட்ட அமைப்புகள்

### வெவ்வேறு சூழல்களுக்கான அளவுரு கோப்புகள்
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

### நிபந்தனையுடன் வள உருவாக்கம்
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

## 🚀 மேம்பட்ட உருவாக்க முறைகள்

### பல பிராந்திய வெளியீடு
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

### கட்டமைப்பு சோதனை
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

## 🧪 கட்டமைப்பு முன்னோட்டம் மற்றும் சரிபார்ப்பு (புதியது)

### வெளியீட்டுக்கு முன் கட்டமைப்பு மாற்றங்களை முன்னோட்டம் பார்க்க

`azd provision --preview` அம்சம் **கட்டமைப்பு உருவாக்கத்தை சிமுலேட் செய்ய** அனுமதிக்கிறது, உண்மையில் வளங்களை வெளியிடுவதற்கு முன். இது `terraform plan` அல்லது `bicep what-if` போன்றது, உங்கள் Azure சூழலில் என்ன மாற்றங்கள் செய்யப்படும் என்பதை **உறுதிப்படுத்தும் முன்னோட்டத்தை** வழங்குகிறது.

#### 🛠️ இது என்ன செய்கிறது
- **உங்கள் IaC டெம்ப்ளேட்களை பகுப்பாய்வு செய்கிறது** (Bicep அல்லது Terraform)
- **வள மாற்றங்களின் முன்னோட்டத்தை காட்டுகிறது**: சேர்க்கைகள், நீக்கங்கள், புதுப்பிப்புகள்
- **மாற்றங்களை செயல்படுத்தாது** — இது படிக்க மட்டுமே மற்றும் பாதுகாப்பாக இயங்கும்

#### � பயன்பாடுகள்
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview with detailed output
azd provision --preview --output json

# Preview for specific environment
azd provision --preview --environment production
```

இந்த கட்டளையால் நீங்கள்:
- **வள மாற்றங்களை உறுதிப்படுத்தலாம்** வெளியீட்டுக்கு முன்
- **தவறான அமைப்புகளை** ஆரம்ப கட்டத்தில் கண்டறியலாம்
- **குழு சூழல்களில் பாதுகாப்பாக இணைந்து செயல்படலாம்**
- **குறைந்த அனுமதி வெளியீடுகளை** எந்த அதிர்ச்சியுமின்றி உறுதிப்படுத்தலாம்

இது குறிப்பாக பயனுள்ளதாக இருக்கும் போது:
- சிக்கலான பல சேவை சூழல்களுடன் வேலை செய்யும்போது
- உற்பத்தி கட்டமைப்பில் மாற்றங்களைச் செய்யும்போது
- PR ஒப்புதலுக்கு முன் டெம்ப்ளேட் மாற்றங்களை உறுதிப்படுத்தும்போது
- புதிய குழு உறுப்பினர்களுக்கு கட்டமைப்பு முறைகளை பயிற்சி அளிக்கும்போது

### முன்னோட்ட வெளியீட்டு வெளியீடு உதாரணம்
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

## �🔄 வள புதுப்பிப்புகள் மற்றும் இடமாற்றங்கள்

### பாதுகாப்பான வள புதுப்பிப்புகள்
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes incrementally after preview
azd provision --confirm-with-no-prompt

# Rollback if needed
azd provision --rollback
```

### தரவுத்தொகை இடமாற்றங்கள்
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

## 🎯 சிறந்த நடைமுறைகள்

### 1. வள பெயரிடல் மரபுகள்
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. குறிச்சொல் உத்தி
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

### 3. அளவுரு சரிபார்ப்பு
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

### 4. வெளியீட்டு அமைப்பு
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

## அடுத்த படிகள்

- [வெளியீட்டுக்கு முன் திட்டமிடல்](../pre-deployment/capacity-planning.md) - வள கிடைப்பை உறுதிப்படுத்தவும்
- [பொதுவான சிக்கல்கள்](../troubleshooting/common-issues.md) - கட்டமைப்பு சிக்கல்களை சரிசெய்யவும்
- [பிழைதிருத்த வழிகாட்டி](../troubleshooting/debugging.md) - உருவாக்க சிக்கல்களை பிழைதிருத்தவும்
- [SKU தேர்வு](../pre-deployment/sku-selection.md) - பொருத்தமான சேவை நிலைகளைத் தேர்ந்தெடுக்கவும்

## கூடுதல் வளங்கள்

- [Azure Bicep ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager டெம்ப்ளேட்கள்](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure கட்டமைப்பு மையம்](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**வழிகாட்டி**
- **முந்தைய பாடம்**: [வெளியீட்டு வழிகாட்டி](deployment-guide.md)
- **அடுத்த பாடம்**: [திறன் திட்டமிடல்](../pre-deployment/capacity-planning.md)

---

**குறிப்பு**:  
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.
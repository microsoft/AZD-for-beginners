# AZD மூலம் Azure வளங்களை Provision செய்வது

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போது அத்தியாயம்**: அத்தியாயம் 4 - Infrastructure as Code & Deployment
- **⬅️ முந்தைய**: [Deployment Guide](deployment-guide.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 தொடர்புடைய**: [அத்தியாயம் 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI பயன்படுத்தி Azure வளங்களை வழங்குதல் மற்றும் நிர்வகிப்பதில் அறிய வேண்டிய அனைத்தையும் கவர்கிறது. Bicep, ARM வார்ப்புருக்கள், Terraform மற்றும் Pulumi பயன்படுத்தி அடிப்படை வள உருவாக்கம் முதல் மேம்பட்ட எண்டர்ப்ரைஸ் தரமான இன்ஃப்ராஸ்ட்ரக்சர் கட்டமைப்புகள் வரை Infrastructure as Code (IaC) மாதிரிகளை செயல்படுத்த கற்றுக்கொள்ளுங்கள்.

## கற்றல் குறிக்கோள்கள்

இந்த வழிகாட்டியை முடித்தபின் நீங்கள்:
- Infrastructure as Code கொள்கைகள் மற்றும் Azure வள வழங்கலில் தேர்ச்சி பெறுவீர்கள்
- Azure Developer CLI ஆதரிச்சு கொள்கின்ற பல IaC வழங்குநர்களை புரிந்துக் கொள்வீர்கள்
- பொதுவான பயன்பாட்டுக் கட்டமைப்புகளுக்கான Bicep வார்ப்புருக்களை வடிவமைத்து செயல்படுத்துவீர்கள்
- வள பாராமீட்டர்கள், மாறிலிகள் மற்றும் சூழல்-சார்ந்த அமைப்புகளை கான்பிகர் செய்வீர்கள்
- நெட்வொர்கிங் மற்றும் பாதுகாப்பு உட்பட மேம்பட்ட இன்ஃப்ராஸ்ட்ரக்சர் மாதிரிகளை நடைமுறைப்படுத்துவீர்கள்
- வள வாழ்க்கைசுழற்சி, மேம்பாடுகள் மற்றும் சார்புகள் தீர்மானிப்பை நிர்வகிப்பீர்கள்

## கற்றல் விளைவுகள்

முடித்தவுடன், நீங்கள் செய்ய முடியும்:
- Bicep மற்றும் ARM வார்ப்புருக்களைப் பயன்படுத்தி Azure இன்ஃப்ராஸ்ட்ரக்சரை வடிவமைத்து வழங்க
- சரியான வள சார்புகளுடன் சிக்கலான பல-சேவை கட்டமைப்புகளை கான்பிகர் செய்ய
- பல சூழல்களுக்கும் கட்டமைப்புகளுக்கும் பராமிட்டரைய்ப்புடன் வார்ப்புருக்களை செயல்படுத்த
- இன்ஃப்ராஸ்ட்ரக்சர் வழங்கல் பிரச்சனைகளை டிரபிள்ஷூட் செய்து டெப்ளாய்மென்ட் தோல்விகளை தீர்க்க
- இன்ஃப்ராஸ்ட்ரக்சர் வடிவமைப்பிற்கு Azure Well-Architected Framework கொள்கைகளை பொருந்த வைக்க
- இன்ஃப்ராஸ்ட்ரக்சர் மேம்பாடுகளை நிர்வகித்து இன்ஃப்ராஸ்ட்ரக்சர் வேர்ஷனிங் முகவர்திகளைக் கோரிக்கையிட

## இன்ஃப்ராச்ட்ரக்சர் வழங்கல் கண்ணோட்டம்

Azure Developer CLI பல Infrastructure as Code (IaC) வழங்குநர்களை ஆதரிக்கிறது:
- **Bicep** (பரிகரிக்கப்பட்டது) - Azure இன் டொமைன்-சார்ந்த மொழி
- **ARM Templates** - JSON அடிப்படையிலான Azure Resource Manager வார்ப்புருக்கள்
- **Terraform** - பல-கிளவுட் இன்ஃப்ராஸ்ட்ரக்சர் கருவி
- **Pulumi** - பிரோக்ராமிங் மொழிகளுடன் செயல்படும் நவீன இன்ஃப்ராஸ்ட்ரக்சர் போலிஸ்

## Azure வளங்களைப் புரிதல்

### வள வரிசை
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

## Bicep இன்ஃப்ராஸ்ட்ரக்சர் வார்ப்புருக்கள்

### அடிப்படை Bicep வார்ப்புரு கட்டமைப்பு
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

### மேம்பட்ட Bicep மாதிரிகள்

#### மொடுலர் இன்ஃப்ராஸ்ட்ரக்சர்
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

#### நிபந்தனை சார்ந்த வள உருவாக்கம்
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

## 🗃️ தரவுத்தள வழங்கல்

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

## 🔒 பாதுகாப்பு மற்றும் இரகசிய மேலாண்மை

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

### Managed Identity அமைப்பு
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

### Virtual Network கட்டமைப்பு
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

## 📊 கண்காணிப்பு மற்றும் பார்வைத்திறன்

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

### தனித்துவமான அளவுகோல்கள் மற்றும் அறிவிப்புகள்
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

## 🔧 சூழல்-குறிய அமைப்புகள்

### வேறுபட்ட சூழல்களுக்கு பாராமிட்டர் கோப்புகள்
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

### நிபந்தனை சார்ந்த வள வழங்கல்
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

## 🚀 மேம்பட்ட வழங்கல் வடிவங்கள்

### பல-பிரதேச அமர்த்தல்
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

### இன்ஃப்ராஸ்ட்ரக்சர் சோதனை
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

## 🧪 இன்ஃப்ராஸ்ட்ரக்சர் முன்னோட்டம் & சரிபார்த்தல் (புதியது)

### வெளியீட்டுக்கு முன் இன்ஃப்ராஸ்ட்ரக்சர் மாற்றங்களை முன்னோட்டம் செய்தல்

`azd provision --preview` அம்சம் வளங்களை உண்மையாக வெளியிடுவதற்க்கு முன் **இன்ஃப்ராஸ்ட்ரக்சர் வழங்கலை சிமுலேட் செய்ய** ஆன வாய்ப்பை தருகிறது. இது `terraform plan` அல்லது `bicep what-if` போன்றதாகும், உங்கள் Azure சூழலில் எவ்வாறு மாற்றங்கள் நிகழ்ப்படுமோ என்பதற்கான **dry-run காட்சி** ஒன்றை வழங்குகிறது.

#### 🛠️ இது என்ன செய்கிறது
- **உங்கள் IaC வார்ப்புருக்களை பகுப்பாய்வு செய்கிறது** (Bicep அல்லது Terraform)
- **வள மாற்றங்களின் முன்னோட்டத்தை காண்பிக்கிறது**: சேர்க்கைகள், நீக்கங்கள், மேம்பாடுகள்
- **மாற்றங்களை செயல்படுத்தாது** — இது படிக்க மட்டும் இயலும் மற்றும் இயக்க பாதுகாப்பானது

#### � பயன்பாட்டு வழக்குகள்
```bash
# விடுவிப்பிற்கு முன் உள்கட்டமைப்பு மாற்றங்களுக்கான முன்னோட்டம்
azd provision --preview

# விரிவான வெளியீட்டுடன் முன்னோட்டம்
azd provision --preview --output json

# குறிப்பிட்ட சூழலுக்கான முன்னோட்டம்
azd provision --preview --environment production
```

இந்த கட்டளை உங்களுக்கு உதவுகிறது:
- **மற்றொரு வளங்களை ஒப்படைக்கும் முன் மாற்றங்களை சரிபார்க்க**
- **வளக்கூறுகளில் தவறுகளை ஆரம்ப கட்டத்தில் கண்டறிய**
- **குழு சூழலில் பாதுகாப்பாக ஒத்துழைக்க**
- **அதிர்ச்சியின்றி குறைந்த-அதிகாரியுடன் (least-privilege) டெப்ளாய்மென்டுகளை உறுதி செய்ய**

இது குறிப்பாக பயன்படும் போது:
- சிக்கலான பல-சேவை சூழல்களுடன் வேலை செய்யும் போது
- உற்பத்தி இன்ஃப்ராஸ்ட்ரக்சரில் மாற்றங்கள் செய்யும்போது
- வார்ப்புரு மாற்றங்களை PR ஒப்புதலுக்கு முன் சரிபார்ப்பதற்கு
- புதிய குழு உறுப்பினர்களுக்கு இன்ஃப்ராஸ்ட்ரக்சர் முறைகளை பயிற்சி அளிக்கும்போது

### முன்னோட்ட உதாரண வெளியீடு
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
# முதலில் கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும் (பரிந்துரைக்கப்படுகிறது)
azd provision --preview

# முன்னோட்டம் உறுதிப்படுத்தப்பட்ட பிறகு மாற்றங்களை அமல்படுத்தவும்
azd provision --confirm-with-no-prompt

# பின்செல்ல (rollback) செய்ய, கட்டமைப்பு மாற்றங்களை மீட்டெடுப்பதற்காக Git-ஐப் பயன்படுத்தவும்:
git revert HEAD  # கடைசி கட்டமைப்பு commit-ஐ மீட்டெடுக்கவும்
azd provision    # முன்னைய கட்டமைப்பு நிலையைப் செயல்படுத்தவும்
```

### தரவுத்தள இடமாற்றங்கள்
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

### 1. வள பெயரிடும் நடைமுறைகள்
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. குறிச்சொற் (Tagging) யுக்தி
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

### 3. பரிமாண சரிபார்ப்பு
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

### 4. வெளியீட்டு ஏற்பாடு
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

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - வளக் கிடைக்கும் திறனை சரிபார்க்க
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - இன்ஃப்ராஸ்ட்ரக்சர் பிரச்சனைகளை விமர்சிக்க
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - வழங்கல் பிரச்சனைகளை டீபக் செய்ய
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - சரியான சேவை நிலைகளை தேர்வு செய்ய

## கூடுதல் வளங்கள்

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/) - Azure Bicep ஆவணங்கள்
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/) - Azure Resource Manager வார்ப்புருக்கள்
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/) - Azure கட்டமைப்பு மையம்
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/) - Azure நன்கு-வடிவமைக்கப்பட்ட கட்டமைப்பு

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [Deployment Guide](deployment-guide.md)
- **அடுத்த பாடம்**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
பொறுப்புவிலக்கு:
இந்த ஆவணத்தை AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்த்துள்ளது. நாங்கள் துல்லியத்திற்காக முயலினாலும், தானியங்கி மொழிபெயர்ப்புகளில் தவறுகள் அல்லது துல்லியக்குறைவுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் மூல மொழியிலுள்ள அசல் ஆவணம் அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பில் இருக்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
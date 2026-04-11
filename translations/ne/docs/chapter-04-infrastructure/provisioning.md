# AZD सँग Azure स्रोतहरू प्रदान गर्ने

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ४ - कोड रूपमा पूर्वाधार र परिनियोजन
- **⬅️ अघिल्लो**: [Deployment Guide](deployment-guide.md)
- **➡️ अर्को अध्याय**: [अध्याय ५: मल्टि-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)
- **🔧 सम्बन्धित**: [अध्याय ६: पूर्व-परिनियोजन प्रमाणीकरण](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

यो विस्तृत मार्गदर्शनले Azure Developer CLI प्रयोग गरेर Azure स्रोतहरू प्रदान र व्यवस्थापन गर्ने बारे सबै कुरा समेट्छ। आधारभूत स्रोत सिर्जना देखि उन्नत एंटरप्राइज-ग्रेड पूर्वाधार वास्तुकलासम्म Bicep, ARM टेम्प्लेट, Terraform, र Pulumi प्रयोग गरी पूर्वाधार कोडका ढाँचाहरू लागू गर्न सिक्नुहोस्।

## सिकाइ लक्ष्यहरू

यो मार्गदर्शन पूरा गरेपछि, तपाईंले:
- पूर्वाधार कोड सिद्धान्तहरू र Azure स्रोत प्रावधानमा विशेषज्ञता हासिल गर्नुहुनेछ
- Azure Developer CLI द्वारा समर्थन गरिएको विभिन्न IaC प्रदायकहरू बुझ्नुहुनेछ
- प्रचलित आवेदन वास्तुकलाहरूका लागि Bicep टेम्प्लेटहरू डिजाइन र लागू गर्नुहोस्
- स्रोत प्यारामिटरहरू, चरहरू, र वातावरणविशिष्ट सेटिङहरू कन्फिगर गर्नुहोस्
- जटिल पूर्वाधार ढाँचाहरू लागू गर्नुहोस् जसमा नेटवर्किङ र सुरक्षा समावेश छन्
- स्रोतको जीवनचक्र, अपडेटहरू, र निर्भरता समाधान व्यवस्थापन गर्नुहोस्

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Bicep र ARM टेम्प्लेट प्रयोग गरी Azure पूर्वाधार डिज़ाइन र प्रावधान गर्नुहोस्
- उपयुक्त स्रोत निर्भरतासहित जटिल बहु-सेवा वास्तुकलाहरू कन्फिगर गर्नुहोस्
- धेरै वातावरण र कन्फिगरेशन्सका लागि प्यारामिटराइज्ड टेम्प्लेटहरू लागू गर्नुहोस्
- पूर्वाधार प्रावधान समस्याहरूलाई ट्रबलशूट गर्नुहोस् र परिनियोजन असफलताहरू समाधान गर्नुहोस्
- Azure Well-Architected Framework सिद्धान्तहरू पूर्वाधार डिज़ाइनमा लागू गर्नुहोस्
- पूर्वाधार अपडेटहरू व्यवस्थापन गर्नुहोस् र पूर्वाधार संस्करण रणनीतिहरू लागू गर्नुहोस्

## पूर्वाधार प्रावधान अवलोकन

Azure Developer CLI ले विभिन्न पूर्वाधार कोड (IaC) प्रदायकहरूलाई समर्थन गर्दछ:
- **Bicep** (सिफारिस गरिएको) – Azure को डोमेन-विशेष भाषा
- **ARM टेम्प्लेटहरू** – JSON आधारित Azure Resource Manager टेम्प्लेटहरू
- **Terraform** – मल्टि-क्लाउड पूर्वाधार उपकरण
- **Pulumi** – प्रोग्रामिङ भाषाहरुका साथ आधुनिक पूर्वाधार कोड

## Azure स्रोतहरू बुझ्नुहोस्

### स्रोत पदानुक्रम
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### आवेदनहरूको लागि सामान्य Azure सेवाहरू
- **कम्प्युट**: App Service, Container Apps, Functions, Virtual Machines
- **स्टोरेज**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **नेटवर्किङ**: Virtual Network, Application Gateway, CDN
- **सुरक्षा**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep पूर्वाधार टेम्प्लेटहरू

### आधारभूत Bicep टेम्प्लेट संरचना
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

### उन्नत Bicep ढाँचाहरू

#### मोड्युलर पूर्वाधार
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

#### सशर्त स्रोत सिर्जना
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

## 🗃️ डाटाबेस प्रावधान

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

## 🔒 सुरक्षा र रहस्य व्यवस्थापन

### Key Vault एकीकरण
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

### व्यवस्थापन गरिएको पहिचान कन्फिगरेसन
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

## 🌍 नेटवर्किङ र कनेक्टिविटी

### Virtual Network कन्फिगरेसन
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

### SSL सहित Application Gateway
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

## 📊 निगरानी र अवलोकनयोग्यता

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

### कस्टम मेट्रिक्स र अलर्टहरू
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

## 🔧 वातावरण-स्पेसिफिक कन्फिगरेसनहरू

### विभिन्न वातावरणहरूका लागि प्यारामिटर फाइलहरू
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

### सशर्त स्रोत प्रावधान
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

## 🚀 उन्नत प्रावधान ढाँचाहरू

### बहु-क्षेत्र परिनियोजन
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

### पूर्वाधार परीक्षण
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

## 🧪 पूर्वाधार पूर्वावलोकन र प्रमाणीकरण (नयाँ)

### परिनियोजन अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्

`azd provision --preview` फीचरले तपाईंलाई स्रोतहरू व्यावहारिक रूपमा परिनियोजन गर्नु अघि पूर्वाधार प्रावधान प्रक्रिया **सिमुलेट** गर्न दिन्छ। यो `terraform plan` वा `bicep what-if` जस्तै छ, जसले तपाईंको Azure वातावरणमा गरिने परिवर्तनहरूको **सुक्खा-रन दृश्य** दिन्छ।

#### 🛠️ के गर्छ
- **तपाईंको IaC टेम्प्लेटहरू (Bicep वा Terraform)** विश्लेषण गर्छ
- **स्रोत परिवर्तनहरूको पूर्वावलोकन देखाउँछ**: थप, हटाउने, अपडेटहरू
- **परिवर्तनहरू लागू गर्दैन** — यो केवल पढ्न योग्य र सुरक्षित छ

#### प्रयोगका केसहरू
```bash
# परिनियोजन अघि पूर्वावलोकन पूर्वधारणा परिवर्तनहरू
azd provision --preview

# विशिष्ट वातावरणको लागि पूर्वावलोकन
azd provision --preview -e production
```

यस आदेशले तपाईंलाई मद्दत गर्दछ:
- स्रोतहरू प्रतिबद्ध गर्नु अघि पूर्वाधार परिवर्तन **प्रमाणीकरण** गर्न
- विकास चक्रमा **छिट्टै मिसकन्फिगरेसन पत्ता लगाउन**
- टोली वातावरणमा **सुरक्षित सहयोग** गर्न
- आश्चर्य बिना **सर्वन्यून अधिकार परिनियोजनहरू सुनिश्चित** गर्न

यो विशेष गरी उपयोगी हुन्छ जब:
- जटिल बहु-सेवा वातावरणहरूसँग काम गर्दा
- उत्पादन पूर्वाधारमा परिवर्तन गर्दा
- टेम्प्लेट संशोधनहरू PR अनुमोदन अघि प्रमाणित गर्दा
- नयाँ टोली सदस्यहरूलाई पूर्वाधार ढाँचाहरू सम्बन्धी तालिम दिन

### उदाहरण पूर्वावलोकन आउटपुट
ठ्याक्कै पूर्वावलोकन आउटपुट प्रदायक र परियोजना संरचनामा भिन्न हुन सक्छ, तर नतिजाले के प्रस्तावित परिवर्तनहरू छन् स्पष्ट रूपमा चिन्हित गर्नुपर्छ।

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

## �🔄 स्रोत अपडेट र माइग्रेशनहरू

### सुरक्षित स्रोत अपडेटहरू
```bash
# पूर्वावलोकन पूर्व इन्फ्रास्ट्रक्चर परिवर्तनहरू (सिफारिस गरिन्छ)
azd provision --preview

# पूर्वावलोकन पुष्टि पछि परिवर्तनहरू लागू गर्नुहोस्
azd provision --confirm-with-no-prompt

# रोलब्याकको लागि, इन्फ्रास्ट्रक्चर परिवर्तनहरू फर्काउन Git प्रयोग गर्नुहोस्:
git revert HEAD  # अन्तिम इन्फ्रास्ट्रक्चर कमिट फर्काउनुहोस्
azd provision    # अघिल्लो इन्फ्रास्ट्रक्चर अवस्था लागू गर्नुहोस्
```

### डाटाबेस माइग्रेशनहरू
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

## 🎯 उत्कृष्ट अभ्यासहरू

### १. स्रोत नामकरण सङ्केतहरू
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### २. ट्यागिङ रणनीति
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

### ३. प्यारामिटर प्रमाणीकरण
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

### ४. आउटपुट संगठन
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

## आगामी चरणहरू

- [पूर्व-परिनियोजन योजना](../chapter-06-pre-deployment/capacity-planning.md) – स्रोत उपलब्धता प्रमाणीकरण
- [सामान्य समस्याहरू](../chapter-07-troubleshooting/common-issues.md) – पूर्वाधार समस्या समाधान
- [डिबगिङ गाइड](../chapter-07-troubleshooting/debugging.md) – प्रावधान समस्याहरू डिबग गर्नुहोस्
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) – उपयुक्त सेवा स्तरहरू छान्नुहोस्

## थप स्रोतहरू

- [Azure Bicep कागजात](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager टेम्प्लेटहरू](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure वास्तुकला केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [Deployment Guide](deployment-guide.md)
- **अर्को पाठ**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत छौं, तर कृपया जानकार हुनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा असंगतिहरू हुन सक्छन्। मूल दस्तावेज यसको मातृभाषामा प्राधिकृत स्रोतको रूपमा मानिनुपर्छ। महत्वपूर्ण सूचना लागि, पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्यामा हामी जिम्मेवार छैौँैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
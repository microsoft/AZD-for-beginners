# AZD प्रयोग गरेर Azure स्रोतहरू प्रोभिजनिङ

**अध्याय नेभिगेसन:**
- **📚 Course Home**: [शुरुआतीहरूका लागि AZD](../../README.md)
- **📖 Current Chapter**: अध्याय 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [परिनियोजन मार्गदर्शन](deployment-guide.md)
- **➡️ Next Chapter**: [अध्याय ५: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)
- **🔧 Related**: [अध्याय ६: पूर्व-परिनियोजन प्रमाणीकरण](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

यो व्यापक मार्गदर्शिकाले Azure Developer CLI प्रयोग गरेर Azure स्रोतहरू प्रोभिजन र व्यवस्थापन सम्बन्धी जान्नुपर्ने सबै कुरा समेट्छ। Bicep, ARM टेम्पलेटहरू, Terraform, र Pulumi प्रयोग गरी आधारभूत स्रोत सिर्जनाबाट लिएर उन्नत एंटरप्राइज-ग्रेड इन्फ्रास्ट्रक्चर आर्किटेक्चरहरू सम्म Infrastructure as Code (IaC) ढाँचाहरू कसरी लागू गर्ने सिक्नुहोस्।

## सिकाइ लक्ष्यहरू

यस मार्गदर्शिका पूरा गरेपछि तपाईंले:
- Infrastructure as Code सिद्धान्तहरू र Azure स्रोत प्रोभिजनिङमा दक्षता हासिल गर्नुहुनेछ
- Azure Developer CLI द्वारा समर्थन गरिएका बहु IaC प्रदायकहरू बुझ्नुहुनेछ
- सामान्य एप्लिकेशन आर्किटेक्चरहरूका लागि Bicep टेम्पलेटहरू डिजाइन र कार्यान्वयन गर्न सक्नुहुनेछ
- स्रोतका पेरामिटरहरू, भेरिएबलहरू, र वातावरण-विशिष्ट सेटिङहरू कन्फिगर गर्न सक्नुहुनेछ
- नेटवर्किङ र सुरक्षा समावेश गरी उन्नत इन्फ्रास्ट्रक्चर ढाँचाहरू लागू गर्न सक्नुहुनेछ
- स्रोतको लाइफसाइकल, अपडेटहरू, र निर्भरताहरू समाधान गर्न व्यवस्थापन गर्न सक्नुहुनेछ

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Bicep र ARM टेम्पलेटहरू प्रयोग गरी Azure इन्फ्रास्ट्रक्चर डिजाइन र प्रोभिजन गर्न
- ठीक निर्भरताहरू सहित जटिल बहु-सेवा आर्किटेक्चरहरू कन्फिगर गर्न
- बहु वातावरण र कन्फिगरेसनहरूका लागि पेरामिटराइज्ड टेम्पलेटहरू लागू गर्न
- इन्फ्रास्ट्रक्चर प्रोभिजनिङ सम्बन्धी समस्याहरू ट्रबलशुट र परिनियोजन असफलताहरू समाधान गर्न
- इन्फ्रास्ट्रक्चर डिजाइनमा Azure Well-Architected Framework का सिद्धान्तहरू लागू गर्न
- इन्फ्रास्ट्रक्चर अपडेटहरू व्यवस्थापन र इन्फ्रास्ट्रक्चर भर्सनिङ रणनीतिहरू लागू गर्न

## इन्फ्रास्ट्रक्चर प्रोभिजनिङ अवलोकन

Azure Developer CLI ले बहु Infrastructure as Code (IaC) प्रदायकहरू समर्थन गर्दछ:
- **Bicep** (सिफारिस गरिएको) - Azure को डोमेन-विशेष भाषा
- **ARM Templates** - JSON-आधारित Azure Resource Manager टेम्पलेटहरू
- **Terraform** - बहु-क्लाउड इन्फ्रास्ट्रक्चर उपकरण
- **Pulumi** - प्रोग्रामिङ भाषाहरूसहित आधुनिक infrastructure as code

## Azure स्रोतहरू बुझ्नु

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Applications का लागि सामान्य Azure सेवाहरू
- **कम्प्युटिङ**: App Service, Container Apps, Functions, Virtual Machines
- **स्टोरेज**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **नेटवर्किङ**: Virtual Network, Application Gateway, CDN
- **सुरक्षा**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep इन्फ्रास्ट्रक्चर टेम्पलेटहरू

### Basic Bicep Template Structure
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

#### मोडुलर इन्फ्रास्ट्रक्चर
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

#### शर्ताधारित स्रोत सिर्जना
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

## 🗃️ डेटाबेस प्रोभिजनिङ

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

## 🔒 सुरक्षा र गोप्य व्यवस्थापन

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

### प्रबन्धित पहिचान कन्फिगरेसन
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

## 🌍 नेटवर्किङ र जडान

### भर्चुअल नेटवर्क कन्फिगरेसन
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

## 📊 निगरानी र अवलोकनीयता

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

### अनुकूलित मेट्रिक्स र अलर्टहरू
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

## 🔧 वातावरण-विशिष्ट कन्फिगरेसनहरू

### फरक वातावरणहरूका लागि पेरामिटर फाइलहरू
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

### सर्ताधारित स्रोत प्रोभिजनिङ
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

## 🚀 उन्नत प्रोभिजनिङ ढाँचाहरू

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

### इन्फ्रास्ट्रक्चर परीक्षण
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

## 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन र प्रमाणीकरण (नयाँ)

### परिनियोजन अघि इन्फ्रास्ट्रक्चर परिवर्तनहरूको पूर्वावलोकन

The `azd provision --preview` सुविधाले वास्तविक रूपमा स्रोतहरू परिनियोजन गर्नु अघि तपाईंलाई **इन्फ्रास्ट्रक्चर प्रोभिजनिङको अनुकरण** गर्न अनुमति दिन्छ। यो भावना अनुसार `terraform plan` वा `bicep what-if` जस्तै हो, जसले तपाईंलाई तपाईंको Azure वातावरणमा के परिवर्तनहरू गरिने थिए भन्ने **ड्राइ-रन दृश्य** प्रदान गर्छ।

#### 🛠️ यो के गर्छ
- **तपाईंका IaC टेम्पलेटहरू विश्लेषण गर्छ** (Bicep वा Terraform)
- **स्रोत परिवर्तनहरूको पूर्वावलोकन देखाउँछ**: थपहरू, हटाइहरू, अद्यावधिकहरू
- **परिवर्तनहरू लागू गर्दैन** — यो केवल-पठन(read-only) र चलाउन सुरक्षित छ

#### � प्रयोगका केसहरू
```bash
# परिनियोजन अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
azd provision --preview

# विस्तृत आउटपुटसहितको पूर्वावलोकन
azd provision --preview --output json

# विशिष्ट वातावरणको लागि पूर्वावलोकन
azd provision --preview --environment production
```

यस आदेशले तपाईंलाई मद्दत गर्दछ:
- **स्रोतहरू कमिट गर्नु अघि इन्फ्रास्ट्रक्चर परिवर्तनहरू प्रमाणित गर्न**
- **विकास चक्रको आरम्भिक चरणमा गलत कन्फिगरेसन पत्ता लगाउन**
- **टीम वातावरणहरूमा सुरक्षित सहकार्य गर्न**
- **अप्रत्याशिततालाई बिना न्यूनतम-प्रिविलेज परिनियोजन सुनिश्चित गर्न**

यो विशेष गरी उपयोगी हुन्छ जब:
- जटिल बहु-सेवा वातावरणहरूसँग काम गरिरहनुभएको छ
- उत्पादन इन्फ्रास्ट्रक्चरमा परिवर्तनहरू गर्दै हुनुहुन्छ
- PR अनुमोदन अघि टेम्पलेट संशोधनोंको प्रमाणीकरण गर्दै हुनुहुन्छ
- नयाँ टीम सदस्यहरूलाई इन्फ्रास्ट्रक्चर ढाँचाहरूमा तालिम दिँदै हुनुहुन्छ

### पूर्वावलोकनको उदाहरण आउटपुट
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

## �🔄 स्रोत अपडेटहरू र माइग्रेशनहरू

### सुरक्षित स्रोत अपडेटहरू
```bash
# पहिला पूर्वाधार परिवर्तनहरू पूर्वावलोकन गर्नुहोस् (सिफारिस गरिन्छ)
azd provision --preview

# पूर्वावलोकन पुष्टि भएपछि परिवर्तनहरू लागू गर्नुहोस्
azd provision --confirm-with-no-prompt

# रोलब्याकका लागि, Git प्रयोग गरी पूर्वाधार परिवर्तनहरू फिर्ता गर्नुहोस्:
git revert HEAD  # अन्तिम पूर्वाधार कमिट फिर्ता गर्नुहोस्
azd provision    # अघिल्लो पूर्वाधार अवस्था लागू गर्नुहोस्
```

### डेटाबेस माइग्रेशनहरू
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

## 🎯 उत्तम अभ्यासहरू

### 1. स्रोत नामकरण परम्पराहरू
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ट्यागिङ रणनीति
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

### 3. पेरामिटर प्रमाणीकरण
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

### 4. आउटपुट आयोजन
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

## अर्को चरणहरू

- [पूर्व-परिनियोजन योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत उपलब्धता प्रमाणित गर्नुहोस्
- [साधारण समस्याहरू](../chapter-07-troubleshooting/common-issues.md) - इन्फ्रास्ट्रक्चर समस्याहरू समाधान गर्नुहोस्
- [डिबगिङ गाइड](../chapter-07-troubleshooting/debugging.md) - प्रोभिजनिङ समस्याहरू डिबग गर्नुहोस्
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सेवा टियरहरू रोज्नुहोस्

## अतिरिक्त स्रोतहरू

- [Azure Bicep दस्तावेज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager टेम्पलेटहरू](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure आर्किटेक्चर सेन्टर](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेभिगेसन**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज कृत्रिम बुद्धिमत्ता अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयासरत भए पनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको दस्तावेजलाई आधिकारिक स्रोत मानिनु पर्नेछ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुन सक्ने कुनै पनि भ्रम वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
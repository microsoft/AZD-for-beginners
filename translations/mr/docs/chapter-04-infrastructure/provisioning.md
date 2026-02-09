# AZD सह Azure संसाधने प्रोव्हिजन करणे

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 4 - इन्फ्रास्ट्रक्चर अ‍ॅज कोड आणि तैनाती
- **⬅️ Previous**: [डिप्लॉयमेंट मार्गदर्शक](deployment-guide.md)
- **➡️ Next Chapter**: [अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)
- **🔧 Related**: [अध्याय 6: प्री-डिप्लॉयमेंट वैधता](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI वापरून Azure संसाधने प्रोव्हिजन आणि व्यवस्थापित करण्याबद्दल तुम्हाला जाणून घेण्यास आवश्यक असलेली सर्व माहिती कव्हर करतो. Bicep, ARM टेम्पलेट्स, Terraform आणि Pulumi वापरून मूलभूत संसाधन निर्मितीपासून ते प्रगत एंटरप्राइझ-ग्रेड इन्फ्रास्ट्रक्चर आर्किटेक्चरपर्यंत Infrastructure as Code (IaC) पॅटर्न कसे अमलात आणायचे ते शिका.

## शिकण्याचे उद्दिष्टे

या मार्गदर्शकाचा अभ्यास पूर्ण केल्यानंतर तुम्ही:
- Infrastructure as Code तत्त्वे आणि Azure संसाधन प्रोव्हिजनिंग मध्ये प्रावीण्य मिळवाल
- Azure Developer CLI द्वारे समर्थित अनेक IaC प्रदात्यांना समजून घ्याल
- सामान्य अनुप्रयोग आर्किटेक्चरसाठी Bicep टेम्पलेट्स डिझाइन आणि अमलात आणाल
- संसाधन पॅरामीटर्स, व्हेरिएबल्स आणि पर्यावरण-विशिष्ट सेटिंग्ज कॉन्फिगर कराल
- नेटवर्किंग आणि सुरक्षा यांसह प्रगत इन्फ्रास्ट्रक्चर पॅटर्न लागू कराल
- संसाधनांचे लाइफसायकल, अपडेट्स आणि अवलंबित्व सोडवणूक व्यवस्थापित कराल

## शिकण्याचे परिणाम

या मार्गदर्शकाचे पालन केल्यावर, तुम्ही सक्षम असाल:
- Bicep आणि ARM टेम्पलेट्स वापरून Azure इन्फ्रास्ट्रक्चर डिझाइन व प्रोव्हिजन करणे
- योग्य संसाधन अवलंबित्वांसह संकुल मल्टी-सेवा आर्किटेक्चर कॉन्फिगर करणे
- अनेक पर्यावरणे आणि कॉन्फिगरेशनसाठी पॅरामीटराइझ्ड टेम्पलेट्स लागू करणे
- इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग समस्यांचे ट्रबलशूट करणे आणि डिप्लॉयमेंट अयशस्वीता निवारण करणे
- इन्फ्रास्ट्रक्चर डिझाइनसाठी Azure Well-Architected Framework तत्त्वे लागू करणे
- इन्फ्रास्ट्रक्चर अपडेट्स व्यवस्थापित करणे आणि इन्फ्रास्ट्रक्चर व्हर्जनिंग धोरणे अंमलात आणणे

## इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग अवलोकन

Azure Developer CLI अनेक Infrastructure as Code (IaC) प्रदाते समर्थन करते:
- **Bicep** (शिफारस केलेले) - Azure ची डोमेन-विशिष्ट भाषा
- **ARM Templates** - JSON-आधारित Azure Resource Manager टेम्पलेट्स
- **Terraform** - मल्टी-क्लाउड इन्फ्रास्ट्रक्चर साधन
- **Pulumi** - प्रोग्रामिंग भाषांसह आधुनिक इन्फ्रास्ट्रक्चर अ‍ॅज कोड

## Azure संसाधने समजून घेणे

### संसाधन श्रेणी
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### अनुप्रयोगांसाठी सामान्य Azure सेवा
- **कंप्यूट**: App Service, Container Apps, Functions, Virtual Machines
- **स्टोरेज**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **नेटवर्किंग**: Virtual Network, Application Gateway, CDN
- **सुरक्षा**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स

### मूलभूत Bicep टेम्पलेट संरचना
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

### प्रगत Bicep पॅटर्न

#### मॉड्युलर इन्फ्रास्ट्रक्चर
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

#### परिस्थितीनुसार संसाधन निर्मिती
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

## 🗃️ डेटाबेस प्रोव्हिजनिंग

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

## 🔒 सुरक्षा आणि सीक्रेट्स व्यवस्थापन

### Key Vault एकत्रीकरण
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

### Managed Identity कॉन्फिगरेशन
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

## 🌍 नेटवर्किंग आणि कनेक्टिव्हिटी

### Virtual Network कॉन्फिगरेशन
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

### SSL सह Application Gateway
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

## 📊 मॉनिटरिंग आणि निरीक्षणक्षमता

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

### सानुकूल मेट्रिक्स आणि अलर्ट्स
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

## 🔧 पर्यावरण-विशिष्ट कॉन्फिगरेशन्स

### विविध पर्यावरणांसाठी पॅरामीटर फाइल्स
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

### परिस्थितीनुसार संसाधन प्रोव्हिजनिंग
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

## 🚀 प्रगत प्रोव्हिजनिंग पॅटर्न

### बहु-प्रांत तैनाती
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

### इन्फ्रास्ट्रक्चर चाचणी
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

## 🧪 इन्फ्रास्ट्रक्चर प्रीव्ह्यू आणि प्रमाणीकरण (नवीन)

### तैनातीपूर्वी इन्फ्रास्ट्रक्चर बदलांचे पूर्वावलोकन

The `azd provision --preview` feature lets you **simulate infrastructure provisioning** before actually deploying resources. It's similar in spirit to `terraform plan` or `bicep what-if`, giving you a **dry-run view** of what changes would be made to your Azure environment.

#### 🛠️ हे काय करते
- **आपल्या IaC टेम्पलेट्सचे विश्लेषण करते** (Bicep किंवा Terraform)
- **संसाधन बदलांचे पूर्वावलोकन दर्शवते**: जोडणे, हटवणे, अद्यतने
- **बदल लागू करत नाही** — हे फक्त वाचनासाठी आहे आणि चालवायला सुरक्षित आहे

#### � वापर प्रकरणे
```bash
# तैनातीपूर्वी पायाभूत सुविधेतील बदलांचे पूर्वावलोकन करा
azd provision --preview

# सविस्तर आउटपुटसह पूर्वावलोकन
azd provision --preview --output json

# विशिष्ट वातावरणासाठी पूर्वावलोकन
azd provision --preview --environment production
```

हा आदेश तुम्हाला मदत करतो:
- **संसाधने कमिट करण्यापूर्वी इन्फ्रास्ट्रक्चर बदलांची पडताळणी करा**
- **विकसन चक्रात चुकीच्या कॉन्फिगरेशन लवकर पकडा**
- **टीम वातावरणात सुरक्षितपणे सहकार्य करा**
- **अनपेक्षित परिणामांशिवाय किमान-प्रिव्हिलेज तैनाती याची खात्री करा**

हे विशेषतः उपयुक्त आहे जेव्हा:
- जटिल बहु-सेवा पर्यावरणावर काम करत असाल
- उत्पादन इन्फ्रास्ट्रक्चरमध्ये बदल करत असाल
- PR मंजुरीपूर्वी टेम्पलेट बदलांची पडताळणी करत असाल
- इन्फ्रास्ट्रक्चर पॅटर्नवर नवीन टीम सदस्यांना प्रशिक्षण देत असाल

### उदाहरण पूर्वावलोकन आउटपुट
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

## �🔄 संसाधन अद्यतने आणि स्थलांतर

### सुरक्षित संसाधन अद्यतने
```bash
# इन्फ्रास्ट्रक्चरमधील बदल प्रथम पूर्वावलोकन करा (शिफारस केलेले)
azd provision --preview

# पूर्वावलोकन पुष्टी केल्यानंतर बदल लागू करा
azd provision --confirm-with-no-prompt

# रोलबॅकसाठी, इन्फ्रास्ट्रक्चरमधील बदल परत करण्यासाठी Git वापरा:
git revert HEAD  # शेवटचा इन्फ्रास्ट्रक्चर कमिट परत करा
azd provision    # मागील इन्फ्रास्ट्रक्चर स्थिती लागू करा
```

### डेटाबेस स्थलांतर
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

## 🎯 सर्वोत्तम पद्धती

### 1. संसाधन नामकरण नियम
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. टॅगिंग धोरण
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

### 3. पॅरामीटर पडताळणी
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

### 4. आउटपुट संघटन
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

## पुढील पायऱ्या

- [प्री-डिप्लॉयमेंट नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन उपलब्धता सत्यापित करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - इन्फ्रास्ट्रक्चर समस्या निवारण करा
- [डिबगिंग मार्गदर्शक](../chapter-07-troubleshooting/debugging.md) - प्रोव्हिजनिंग समस्या डीबग करा
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - योग्य सेवा टिएर्स निवडा

## अतिरिक्त संसाधने

- [Azure Bicep दस्तऐवजीकरण](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेव्हिगेशन**
- **मागील धडा**: [डिप्लॉयमेंट मार्गदर्शक](deployment-guide.md)
- **पुढील धडा**: [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेतील त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून समजला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद करणे शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजांसाठी किंवा चुकीच्या अर्थलागीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
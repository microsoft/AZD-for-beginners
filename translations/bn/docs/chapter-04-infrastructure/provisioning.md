# AZD দিয়ে Azure রিসোর্স প্রোভিশনিং

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD শিক্ষানবিশদের জন্য](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 4 - অবকাঠামো হিসাবে কোড ও ডেপ্লয়মেন্ট
- **⬅️ পূর্ববর্তী**: [ডেপ্লয়মেন্ট গাইড](deployment-guide.md)
- **➡️ পরবর্তী অধ্যায়**: [অধ্যায় 5: মাল্টি-এজেন্ট AI সমাধান](../../examples/retail-scenario.md)
- **🔧 সম্পর্কিত**: [অধ্যায় 6: প্রি-ডেপ্লয়মেন্ট যাচাইকরণ](../chapter-06-pre-deployment/capacity-planning.md)

## ভূমিকা

এই বিস্তৃত গাইডটি আপনাকে Azure Developer CLI ব্যবহার করে Azure রিসোর্স প্রোভিশন ও পরিচালনার সমস্ত প্রয়োজনীয় বিষয় আবৃত করে। Bicep, ARM টেমপ্লেট, Terraform, এবং Pulumi ব্যবহার করে মৌলিক রিসোর্স সৃষ্টির কাছ থেকে উন্নত এন্টারপ্রাইজ-গ্রেড অবকাঠামো আর্কিটেকচারের IaC প্যাটার্নগুলি বাস্তবায়ন করতে শিখুন।

## শেখার লক্ষ্য

এই গাইড সম্পূর্ণ করে আপনি পারবেন:
- Infrastructure as Code নীতিমালা এবং Azure রিসোর্স প্রোভিশনিংয়ে পারদর্শী হওয়া
- Azure Developer CLI দ্বারা সমর্থিত একাধিক IaC প্রদানকারীগুলো বুঝতে পারা
- সাধারণ অ্যাপ্লিকেশন আর্কিটেকচারের জন্য Bicep টেমপ্লেট ডিজাইন ও বাস্তবায়ন করা
- রিসোর্স প্যারামিটার, ভ্যারিয়েবল, এবং পরিবেশ-নির্দিষ্ট সেটিংস কনফিগার করা
- নেটওয়ার্কিং এবং সিকিউরিটি সহ উন্নত অবকাঠামো প্যাটার্নগুলি বাস্তবায়ন করা
- রিসোর্স লাইফসাইকেল, আপডেট এবং ডিপেন্ডেন্সি রেজল্যুশন পরিচালনা করা

## শেখার ফলাফল

সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- Bicep এবং ARM টেমপ্লেট ব্যবহার করে Azure অবকাঠামো ডিজাইন ও প্রোভিশন করা
- সঠিক রিসোর্স ডিপেন্ডেন্সি সহ জটিল মাল্টি-সার্ভিস আর্কিটেকচার কনফিগার করা
- বিভিন্ন পরিবেশ এবং কনফিগারেশনের জন্য প্যারামিটারাইজড টেমপ্লেট বাস্তবায়ন করা
- অবকাঠামো প্রোভিশনিং সমস্যা ডিবাগ এবং ডেপ্লয়মেন্ট ব্যর্থতা সমাধান করা
- Azure Well-Architected Framework নীতিমালা অবকাঠামো ডিজাইনে প্রয়োগ করা
- অবকাঠামো আপডেট পরিচালনা এবং ইনফ্রাস্ট্রাকচার ভার্সনিং কৌশল বাস্তবায়ন করা

## অবকাঠামো প্রোভিশনিং ওভারভিউ

Azure Developer CLI একাধিক Infrastructure as Code (IaC) প্রদানকারী সমর্থন করে:
- **Bicep** (প্রস্তাবিত) - Azure-এর ডোমেইন-নির্দিষ্ট ভাষা
- **ARM Templates** - JSON-ভিত্তিক Azure Resource Manager টেমপ্লেট
- **Terraform** - মাল্টি-ক্লাউড অবকাঠামো টুল
- **Pulumi** - প্রোগ্রামিং ভাষা ব্যবহার করে আধুনিক অবকাঠামো কোড

## Azure রিসোর্স বোঝা

### রিসোর্স হায়ারার্কি
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### অ্যাপ্লিকেশনগুলোর জন্য সাধারণ Azure সেবা
- **কম্পিউট**: App Service, Container Apps, Functions, Virtual Machines
- **স্টোরেজ**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **নেটওয়ার্কিং**: Virtual Network, Application Gateway, CDN
- **সিকিউরিটি**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep অবকাঠামো টেমপ্লেট

### মৌলিক Bicep টেমপ্লেট স্ট্রাকচার
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

### উন্নত Bicep প্যাটার্ন

#### মডুলার অবকাঠামো
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

#### শর্তসাপেক্ষ রিসোর্স সৃষ্টিকরণ
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

## 🗃️ ডেটাবেস প্রোভিশনিং

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

## 🔒 সিকিউরিটি এবং সিক্রেটস ব্যবস্থাপনা

### Key Vault ইন্টিগ্রেশন
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

### Managed Identity কনফিগারেশন
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

## 🌍 নেটওয়ার্কিং এবং কানেক্টিভিটি

### Virtual Network কনফিগারেশন
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

### SSL সহ Application Gateway
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

## 📊 মনিটরিং এবং পর্যবেক্ষণযোগ্যতা

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

### কাস্টম মেট্রিক্স এবং অ্যালার্ট
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

## 🔧 পরিবেশ-নির্দিষ্ট কনফিগারেশন

### বিভিন্ন পরিবেশের জন্য প্যারামিটার ফাইল
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

### শর্তসাপেক্ষ রিসোর্স প্রোভিশনিং
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

## 🚀 উন্নত প্রোভিশনিং প্যাটার্ন

### মাল্টি-রিজিয়ন ডেপ্লয়মেন্ট
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

### অবকাঠামো টেস্টিং
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

## 🧪 অবকাঠামো প্রিভিউ ও ভ্যালিডেশন (নতুন)

### ডেপ্লয়মেন্টের আগে অবকাঠামো পরিবর্তনগুলোর প্রিভিউ

The `azd provision --preview` বৈশিষ্ট্যটি আপনাকে রিসোর্স বাস্তবে ডেপ্লয় করার আগে অবকাঠামো প্রোভিশনিং সিমুলেট করার সুযোগ দেয়। এটি `terraform plan` বা `bicep what-if`-এর মতোই একটি ড্রাই-রান ভিউ দেয়, যা দেখায় আপনার Azure পরিবেশে কী পরিবর্তন হবে।

#### 🛠️ এটা কি করে
- **আপনার IaC টেমপ্লেট বিশ্লেষণ করে** (Bicep বা Terraform)
- **রিসোর্স পরিবর্তনের প্রিভিউ দেখায়**: যোগ, মুছে ফেলা, আপডেট
- **পরিবর্তন প্রয়োগ করে না** — এটি রিড-ওনলি এবং চালানো নিরাপদ

#### � ব্যবহারের ক্ষেত্রে
```bash
# প্রয়োগের আগে ইনফ্রাস্ট্রাকচার পরিবর্তনগুলোর পূর্বরূপ দেখুন
azd provision --preview

# বিস্তারিত আউটপুটসহ পূর্বরূপ দেখুন
azd provision --preview --output json

# নির্দিষ্ট পরিবেশের জন্য পূর্বরূপ দেখুন
azd provision --preview --environment production
```

এই কমান্ডটি আপনাকে সাহায্য করে:
- **রিসোর্স পরিবর্তনগুলো যাচাই করতে** প্রতিশ্রুতি জমা দেওয়ার আগে
- **ভুল কনফিগারেশন দ্রুত ধরতে** ডেভেলপমেন্ট চক্রের শুরুতে
- **দলের মধ্যে নিরাপদভাবে সহযোগিতা করতে**
- **চোখ ঝলকানো ছাড়া সর্বনিম্ন-প্রিভিলেজ ডেপ্লয়মেন্ট নিশ্চিত করতে**

এটি বিশেষভাবে উপকারী যখন:
- জটিল মাল্টি-সার্ভিস পরিবেশের সাথে কাজ করা হচ্ছে
- প্রোডাকশন অবকাঠামোতে পরিবর্তন করা হচ্ছে
- PR অনুমোদনের আগে টেমপ্লেট পরিবর্তন যাচাই করা হচ্ছে
- অবকাঠামো প্যাটার্ন সম্পর্কে নতুন দলের সদস্যদের প্রশিক্ষণ দেওয়া হচ্ছে

### উদাহরণ প্রিভিউ আউটপুট
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

## �🔄 রিসোর্স আপডেট এবং মাইগ্রেশন

### নিরাপদ রিসোর্স আপডেট
```bash
# প্রথমে অবকাঠামো পরিবর্তনগুলি পূর্বরূপ দেখুন (সুপারিশকৃত)
azd provision --preview

# পূর্বরূপ নিশ্চিত হওয়ার পরে পরিবর্তনগুলি প্রয়োগ করুন
azd provision --confirm-with-no-prompt

# রোলব্যাকের জন্য, অবকাঠামো পরিবর্তনগুলি ফিরিয়ে আনতে Git ব্যবহার করুন:
git revert HEAD  # শেষ অবকাঠামো কমিটটি ফিরিয়ে আনুন
azd provision    # পূর্ববর্তী অবকাঠামো অবস্থা প্রয়োগ করুন
```

### ডেটাবেস মাইগ্রেশন
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

## 🎯 সেরা অনুশীলন

### 1. রিসোর্স নামকরণ রীতিনীতি
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ট্যাগিং কৌশল
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

### 3. প্যারামিটার বৈধতা
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

### 4. আউটপুট সংগঠন
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

## পরবর্তী পদক্ষেপ

- [প্রি-ডেপ্লয়মেন্ট পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্সের উপলব্ধতা যাচাই করুন
- [সাধারণ সমস্যা](../chapter-07-troubleshooting/common-issues.md) - অবকাঠামো সমস্যা সমাধান করুন
- [ডিবাগিং গাইড](../chapter-07-troubleshooting/debugging.md) - প্রোভিশনিং সমস্যা ডিবাগ করুন
- [SKU নির্বাচন](../chapter-06-pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস টিয়ার বেছে নিন

## অতিরিক্ত রিসোর্স

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**নেভিগেশন**
- **পূর্ববর্তী লেসন**: [ডেপ্লয়মেন্ট গাইড](deployment-guide.md)
- **পরবর্তী লেসন**: [ক্যাপাসিটি প্ল্যানিং](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসম্ভব সঠিকতার চেষ্টা করি, তবুও অনুগ্রহ করে জেনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষাতেই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
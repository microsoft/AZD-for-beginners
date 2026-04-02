# AZD کے ساتھ Azure وسائل کی فراہمی

**باب کی نیویگیشن:**
- **📚 کورس کا ہوم**: [ابتدائیوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 4 - انفراسٹرکچر از کوڈ اور تعیناتی
- **⬅️ پچھلا**: [تعیناتی کی رہنمائی](deployment-guide.md)
- **➡️ اگلا باب**: [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)
- **🔧 متعلقہ**: [باب 6: پری-ڈپلائمنٹ ویلیڈیشن](../chapter-06-pre-deployment/capacity-planning.md)

## تعارف

یہ مکمل رہنمائی Azure Developer CLI استعمال کرتے ہوئے Azure وسائل کی فراہمی اور انتظام کے بارے میں سب کچھ سکھاتی ہے۔ بنیادی وسائل کی تخلیق سے لے کر Bicep، ARM ٹیمپلیٹس، Terraform، اور Pulumi کے ذریعے ایڈوانس انٹرپرائز گریڈ انفراسٹرکچر آرکیٹیکچرز تک Infrastructure as Code (IaC) کے نمونوں کو نافذ کریں۔

## سیکھنے کے مقاصد

اس رہنمائی کو مکمل کرنے پر آپ:
- Infrastructure as Code کے اصول اور Azure وسائل کی فراہمی پر مہارت حاصل کریں گے
- Azure Developer CLI کی جانب سے سپورٹ کیے گئے متعدد IaC فراہم کنندگان کو سمجھیں گے
- عام ایپلیکیشن آرکیٹیکچرز کے لیے Bicep ٹیمپلیٹس ڈیزائن اور نافذ کریں گے
- وسائل کے پیرامیٹرز، متغیرات، اور ماحول کے مخصوص ترتیبات کو ترتیب دیں گے
- نیٹ ورکنگ اور سیکیورٹی سمیت جدید انفراسٹرکچر کے نمونوں کو نافذ کریں گے
- وسائل کے لائف سائیکل، اپ ڈیٹس، اور انحصار کے حل کا انتظام کریں گے

## سیکھنے کے نتائج

مکمل کرنے پر، آپ قابل ہوں گے:
- Bicep اور ARM ٹیمپلیٹس کے ذریعے Azure انفراسٹرکچر ڈیزائن اور فراہم کریں
- مناسب وسائل کے انحصارات کے ساتھ پیچیدہ ملٹی سروس آرکیٹیکچرز کو ترتیب دیں
- متعدد ماحول اور ترتیبات کے لیے پیرامیٹرائزڈ ٹیمپلیٹس نافذ کریں
- انفراسٹرکچر کی فراہمی کے مسائل کو حل کریں اور تعیناتی ناکامیوں کو درست کریں
- Azure Well-Architected Framework کے اصول انفراسٹرکچر ڈیزائن میں اپنائیں
- انفراسٹرکچر اپ ڈیٹس کا انتظام کریں اور انفراسٹرکچر ورژننگ حکمت عملی نافذ کریں

## انفراسٹرکچر کی فراہمی کا جائزہ

Azure Developer CLI متعدد Infrastructure as Code (IaC) فراہم کنندگان کی حمایت کرتا ہے:
- **Bicep** (تجویز کردہ) - Azure کی مخصوص زبان
- **ARM ٹیمپلیٹس** - JSON پر مبنی Azure Resource Manager ٹیمپلیٹس
- **Terraform** - کثیر کلاؤڈ انفراسٹرکچر کا آلہ
- **Pulumi** - پروگرامنگ زبانوں کے ساتھ جدید انفراسٹرکچر بطور کوڈ

## Azure وسائل کو سمجھنا

### وسائل کی درجہ بندی
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ایپلیکیشنز کے لیے عام Azure سروسز
- **کمپیوٹ**: App Service، Container Apps، Functions، Virtual Machines
- **ذخیرہ**: Storage Account، Cosmos DB، SQL Database، PostgreSQL
- **نیٹ ورکنگ**: Virtual Network، Application Gateway، CDN
- **سیکیورٹی**: Key Vault، Application Insights، Log Analytics
- **AI/ML**: Cognitive Services، OpenAI، Machine Learning

## Bicep انفراسٹرکچر ٹیمپلیٹس

### بنیادی Bicep ٹیمپلیٹ کی ساخت
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

### جدید Bicep نمونے

#### ماڈیولر انفراسٹرکچر
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

#### مشروط وسائل کی تخلیق
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

## 🗃️ ڈیٹا بیس فراہمی

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

## 🔒 سیکیورٹی اور خفیہ معلومات کا انتظام

### Key Vault انضمام
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

### Managed Identity ترتیب
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

## 🌍 نیٹ ورکنگ اور کنیکٹوٹی

### Virtual Network ترتیب
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

### SSL کے ساتھ Application Gateway
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

## 📊 نگرانی اور مشاہدہ

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

### حسب خواہش میٹرکس اور الارٹس
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

## 🔧 ماحول مخصوص ترتیبات

### مختلف ماحول کے لیے پیرامیٹر فائلز
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

### مشروط وسائل کی فراہمی
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

## 🚀 جدید فراہمی کے نمونے

### ملٹی-ریجن تعیناتی
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

### انفراسٹرکچر ٹیسٹنگ
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

## 🧪 انفراسٹرکچر کا پیشگی جائزہ اور تصدیق (نیا)

### تعیناتی سے پہلے انفراسٹرکچر میں تبدیلیوں کا پیشگی جائزہ لیں

`azd provision --preview` فیچر آپ کو **حقیقی وسائل تعینات کرنے سے پہلے انفراسٹرکچر فراہمی کی تقلید کرنے** کی سہولت دیتا ہے۔ یہ `terraform plan` یا `bicep what-if` کے جیسے ہے، جو آپ کو آپ کے Azure ماحول میں کی جانے والی تبدیلیوں کی **خشک دوڑ کا منظر** فراہم کرتا ہے۔

#### 🛠️ یہ کیا کرتا ہے
- **آپ کے IaC ٹیمپلیٹس (Bicep یا Terraform) کا تجزیہ کرتا ہے**
- **وسائل میں تبدیلیوں کا پیشگی منظر دکھاتا ہے:** اضافے، حذف، اپ ڈیٹس
- **کوئی تبدیلی لاگو نہیں کرتا** — یہ صرف پڑھنے کے لیے ہے اور چلانے میں محفوظ ہے

#### استعمال کے کیسز
```bash
# تعیناتی سے پہلے بنیادی ڈھانچے میں تبدیلیوں کا پیش نظارہ کریں
azd provision --preview

# مخصوص ماحول کے لیے پیش نظارہ کریں
azd provision --preview -e production
```

یہ کمانڈ آپ کی مدد کرتا ہے:
- **وسائل پر عمل درآمد سے پہلے انفراسٹرکچر کی تبدیلیوں کی تصدیق کریں**
- **ترقیاتی مرحلے میں غلط ترتیبات کو ابتدائی مرحلے میں پکڑیں**
- **ٹیم کے ماحول میں بحفاظت تعاون کریں**
- **کم سے کم مراعات کے تحت تعینات کو یقینی بنائیں بغیر کسی حیرت کے**

یہ خاص طور پر مفید ہے جب:
- پیچیدہ ملٹی سروس ماحول کے ساتھ کام کر رہے ہوں
- پیداوار کے انفراسٹرکچر میں تبدیلیاں کر رہے ہوں
- PR منظوری سے پہلے ٹیمپلیٹ میں تبدیلیوں کی توثیق کر رہے ہوں
- انفراسٹرکچر کے نمونوں پر نئے ٹیم ممبران کو تربیت دے رہے ہوں

### مثال کے طور پر پیشگی آؤٹ پٹ
مختلف فراہم کنندگان اور پراجیکٹ کی ساخت کے مطابق درست پیشگی آؤٹ پٹ مختلف ہو سکتا ہے، لیکن نتیجہ واضح طور پر ظاہر کرے گا کہ تعیناتی سے پہلے کونسے تبدیلیاں کی جائیں گی۔

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

## 🔄 وسائل کی اپ ڈیٹس اور مائگریشنز

### محفوظ وسائل کی اپ ڈیٹس
```bash
# پہلے انفراسٹرکچر کی تبدیلیوں کا جائزہ لیں (تجویز کردہ)
azd provision --preview

# جائزہ کی تصدیق کے بعد تبدیلیاں نافذ کریں
azd provision --confirm-with-no-prompt

# واپس پلٹنے کے لیے، انفراسٹرکچر کی تبدیلیوں کو واپس کرنے کے لیے Git کا استعمال کریں:
git revert HEAD  # آخری انفراسٹرکچر کمیٹ کو واپس کریں
azd provision    # پچھلے انفراسٹرکچر کی حالت کو نافذ کریں
```

### ڈیٹا بیس مائگریشنز
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

## 🎯 بہترین طریقے

### 1. وسائل کے نام دینے کے قواعد
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ٹیگنگ کی حکمت عملی
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

### 3. پیرامیٹر کی تصدیق
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

### 4. آؤٹ پٹ کی تنظیم
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

## اگلے مراحل

- [پری-ڈپلائمنٹ پلاننگ](../chapter-06-pre-deployment/capacity-planning.md) - وسائل کی دستیابی کی تصدیق کریں
- [عام مسائل](../chapter-07-troubleshooting/common-issues.md) - انفراسٹرکچر کے مسائل کی تشخیص کریں
- [ڈی بگنگ گائیڈ](../chapter-07-troubleshooting/debugging.md) - فراہمی کے مسائل کی تلاش کریں
- [SKU انتخاب](../chapter-06-pre-deployment/sku-selection.md) - مناسب سروس ٹائر منتخب کریں

## اضافی وسائل

- [Azure Bicep دستاویزات](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ٹیمپلیٹس](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure آرکیٹیکچر سینٹر](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**نیویگیشن**
- **پچھلا سبق**: [تعیناتی کی رہنمائی](deployment-guide.md)
- **اگلا سبق**: [صلاحیت کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستبرداری**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا بے دقتیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں ہی مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمہ کے استعمال سے ہونے والے کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
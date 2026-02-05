# Azure အရင်းအမြစ်များကို AZD ဖြင့် Provision လုပ်ခြင်း

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၄ - Infrastructure as Code & Deployment
- **⬅️ အရင်အခန်း**: [Deployment Guide](deployment-guide.md)
- **➡️ နောက်အခန်း**: [အခန်း ၅: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 ဆက်စပ်အခန်း**: [အခန်း ၆: Pre-Deployment Validation](../pre-deployment/capacity-planning.md)

## မိတ်ဆက်

ဒီလမ်းညွှန်စာအုပ်မှာ Azure Developer CLI ကို အသုံးပြုပြီး Azure အရင်းအမြစ်များကို Provision လုပ်ခြင်းနှင့် စီမံခန့်ခွဲခြင်းအကြောင်းကို အကျယ်တဝင့်လေ့လာနိုင်ပါမည်။ Infrastructure as Code (IaC) ပုံစံများကို အခြေခံအရင်းအမြစ်ဖန်တီးခြင်းမှ စ၍ Bicep, ARM templates, Terraform, နှင့် Pulumi တို့ကို အသုံးပြု၍ အဆင့်မြင့်လုပ်ငန်းအဆင့်အရ Infrastructure အဆောက်အအုံများကို အကောင်အထည်ဖော်ခြင်းအထိ လေ့လာနိုင်ပါမည်။

## သင်ယူရမည့်ရည်ရွယ်ချက်များ

ဒီလမ်းညွှန်စာအုပ်ကို ပြီးမြောက်စွာလေ့လာပြီးပါက၊ သင်သည်:
- Infrastructure as Code အခြေခံအယူအဆများနှင့် Azure အရင်းအမြစ်များကို Provision လုပ်ခြင်းကို ကျွမ်းကျင်စွာ လုပ်နိုင်မည်။
- Azure Developer CLI မှ ထောက်ပံ့သော IaC ပံ့ပိုးသူများကို နားလည်မည်။
- အခြေခံ Application Architecture များအတွက် Bicep templates များကို ဒီဇိုင်းဆွဲပြီး အကောင်အထည်ဖော်နိုင်မည်။
- အရင်းအမြစ် Parameters, Variables, နှင့် Environment-specific Settings များကို Configure လုပ်နိုင်မည်။
- Networking နှင့် Security အပါအဝင် အဆင့်မြင့် Infrastructure ပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်။
- အရင်းအမြစ်၏ အသက်တာ, Update များနှင့် Dependency Resolution ကို စီမံနိုင်မည်။

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

သင်တစ်ဦးတည်းလေ့လာပြီးပါက၊ သင်သည်:
- Bicep နှင့် ARM templates ကို အသုံးပြု၍ Azure Infrastructure ကို ဒီဇိုင်းဆွဲပြီး Provision လုပ်နိုင်မည်။
- Resource Dependencies များကို သင့်တော်စွာ Configure လုပ်ထားသော Multi-service Architectures များကို ဖန်တီးနိုင်မည်။
- Environment များနှင့် Configuration များအတွက် Parameterized Templates များကို အကောင်အထည်ဖော်နိုင်မည်။
- Infrastructure Provisioning အခက်အခဲများကို Troubleshoot လုပ်ပြီး Deployment Failures များကို ဖြေရှင်းနိုင်မည်။
- Azure Well-Architected Framework Principles များကို Infrastructure Design တွင် အသုံးချနိုင်မည်။
- Infrastructure Update များကို စီမံပြီး Infrastructure Versioning Strategies များကို အကောင်အထည်ဖော်နိုင်မည်။

## Infrastructure Provisioning အကျဉ်းချုပ်

Azure Developer CLI သည် အောက်ပါ Infrastructure as Code (IaC) ပံ့ပိုးသူများကို ထောက်ပံ့သည်:
- **Bicep** (အကြံပြုသည်) - Azure ၏ Domain-specific Language
- **ARM Templates** - JSON-based Azure Resource Manager Templates
- **Terraform** - Multi-cloud Infrastructure Tool
- **Pulumi** - Programming Languages ဖြင့် Modern Infrastructure as Code

## Azure အရင်းအမြစ်များကို နားလည်ခြင်း

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Applications အတွက် အများဆုံးအသုံးပြုသော Azure Services
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Cognitive Services, OpenAI, Machine Learning

## Bicep Infrastructure Templates

### Bicep Template အခြေခံဖွဲ့စည်းပုံ
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

### Bicep Patterns အဆင့်မြင့်

#### Modular Infrastructure
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

#### Conditional Resource Creation
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

## 🗃️ Database Provisioning

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

## 🔒 Security နှင့် Secrets Management

### Key Vault Integration
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

### Managed Identity Configuration
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

## 🌍 Networking နှင့် Connectivity

### Virtual Network Configuration
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

### Application Gateway with SSL
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

## 📊 Monitoring နှင့် Observability

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

### Custom Metrics နှင့် Alerts
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

## 🔧 Environment-Specific Configurations

### Environment များအတွက် Parameter Files
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

### Conditional Resource Provisioning
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

## 🚀 Advanced Provisioning Patterns

### Multi-Region Deployment
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

### Infrastructure Testing
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

## 🧪 Infrastructure Preview & Validation (အသစ်)

### Deployment မပြုလုပ်မီ Infrastructure Changes ကို Preview လုပ်ခြင်း

`azd provision --preview` feature သည် **Infrastructure Provisioning ကို Simulation လုပ်နိုင်စေသည်**။ Resource များကို အကောင်အထည်မဖော်မီ Azure Environment တွင် ပြုလုပ်မည့် Changes များကို **Dry-run View** အနေဖြင့် ကြည့်ရှုနိုင်သည်။ ၎င်းသည် `terraform plan` သို့မဟုတ် `bicep what-if` နှင့် ဆင်တူပြီး **အကောင်အထည်မဖော်သော Read-only Mode** ဖြစ်သည်။

#### 🛠️ ၎င်း၏လုပ်ဆောင်မှု
- **IaC Templates များကို ခွဲခြမ်းစိတ်ဖြာသည်** (Bicep သို့မဟုတ် Terraform)
- **Resource Changes များကို Preview ပြသည်**: Additions, Deletions, Updates
- **Changes များကို Apply မလုပ်ပါ** — Read-only ဖြစ်ပြီး လုံခြုံစွာ Run လုပ်နိုင်သည်

#### � အသုံးပြုမှုများ
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview with detailed output
azd provision --preview --output json

# Preview for specific environment
azd provision --preview --environment production
```

ဒီ Command သည် သင့်အား:
- **Infrastructure Changes များကို Validate လုပ်နိုင်စေသည်** Resource များကို Commit မလုပ်မီ
- **Misconfigurations များကို Development Cycle အစောပိုင်းတွင် ဖမ်းဆီးနိုင်စေသည်**
- **Team Environment တွင် လုံခြုံစွာ ပူးပေါင်းဆောင်ရွက်နိုင်စေသည်**
- **Deployment များကို အနည်းဆုံး Privilege ဖြင့် လုပ်ဆောင်နိုင်စေသည်** အံ့ဩစရာမရှိဘဲ

၎င်းသည် အထူးသဖြင့် အောက်ပါအခြေအနေများတွင် အသုံးဝင်သည်:
- Complex Multi-service Environment များနှင့် အလုပ်လုပ်နေစဉ်
- Production Infrastructure တွင် Changes များပြုလုပ်နေစဉ်
- Template Modifications များကို Validate လုပ်ပြီး PR အတည်ပြုမီ
- Infrastructure Patterns များကို သင်ကြားနေသော Team Member အသစ်များအတွက်

### Preview Output ဥပမာ
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

## �🔄 Resource Updates နှင့် Migrations

### Safe Resource Updates
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes incrementally after preview
azd provision --confirm-with-no-prompt

# Rollback if needed
azd provision --rollback
```

### Database Migrations
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

## 🎯 Best Practices

### 1. Resource Naming Conventions
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging Strategy
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

### 3. Parameter Validation
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

### 4. Output Organization
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

## နောက်ထပ်အဆင့်များ

- [Pre-deployment Planning](../pre-deployment/capacity-planning.md) - Resource ရရှိနိုင်မှုကို Validate လုပ်ခြင်း
- [Common Issues](../troubleshooting/common-issues.md) - Infrastructure အခက်အခဲများကို Troubleshoot လုပ်ခြင်း
- [Debugging Guide](../troubleshooting/debugging.md) - Provisioning အခက်အခဲများကို Debug လုပ်ခြင်း
- [SKU Selection](../pre-deployment/sku-selection.md) - သင့်တော်သော Service Tiers ကို ရွေးချယ်ခြင်း

## အပိုဆောင်းအရင်းအမြစ်များ

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **အရင်သင်ခန်းစာ**: [Deployment Guide](deployment-guide.md)
- **နောက်သင်ခန်းစာ**: [Capacity Planning](../pre-deployment/capacity-planning.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
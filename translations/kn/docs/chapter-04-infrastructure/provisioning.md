# AZD ಮೂಲಕ ಅಜರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಯೋಜಿಸುವುದು

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಆರಂಭಿಕರಿಗೆ AZD](../../README.md)
- **📖 ಪ್ರస్తుత ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - ರಚನೆಯಾಗಿ ವ್ಯವಸ್ಥೆ & ನಿಯೋಜನೆ
- **⬅️ ಹಿಂದಿನದು**: [ನಿಯೋಜನೆ ಗೈಡ್](deployment-guide.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಎಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **🔧 ಸಂಬಂಧಿಸಿದ**: [ಅಧ್ಯಾಯ 6: ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ](../chapter-06-pre-deployment/capacity-planning.md)

## ಪರಿಚಯ

ಈ ಗೈಡ್ ಆಜರ್ ಡೆವಲಪರ್ CLI ಬಳಸಿ ಅದರ ನಿರ್ಮಿತ ಬೈಸ್ಪ್ ಮತ್ತು ಟೆರೆಫಾರ್ಮ್ ಪ್ರೊವೈಡರ್‌ಗಳೊಂದಿಗೆ ಆಜರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಯೋಜಿಸುವುದು ಮತ್ತು ನಿರ್ವಹಿಸುವುದನ್ನು ಒಳಗೊಂಡಿದೆ.

> `azd 1.37.2` ಗೆ ವಿರುದ್ಧವಾಗಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ (ನವೆಂಬರ್ 2026). ಬೇರೆ ಎಂದರೆ, Bicep, Terraform, ಮತ್ತು ಸ್ಕ್ರಿಪ್ಟ್ ಉದಾಹರಣೆಗಳು **ದೃಶ್ಯಾತ್ಮಕ ತುಂಡುಗಳು**, ಸಂಪೂರ್ಣ ಟೆಂಪ್ಲೇಟ್ ಅಲ್ಲ. ಅವುಗಳನ್ನು ಉಲ್ಲೇಖಿಸಲಾದ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು, ಮಾಡ್ಯೂಲ್‌ಗಳು, ಗುರುತುಗಳು, ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಒದಗಿಸುವ ಪ್ರಾಜೆಕ್ಟಿಗೆ ಮಿಶ್ರಣ ಮಾಡಿ. ಈ ವಿಮರ್ಶೆಯಲ್ಲಿ ಅಜೂರ್ ಪ್ರೊವಿಷನಿಂಗ್ ಕಾರ್ಯಗತಗೊಳಿಸಲ್ಪಟ್ಟಿಲ್ಲ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅಸ್ ಕೋಡ್ ನಿಯಮಗಳನ್ನು ಮತ್ತು ಆಜೂರ್ ಸಂಪನ್ಮೂಲ ಪ್ರೊವಿಶನಿಂಗ್ ಅನ್ನು ನಿಪುಣರಾದಿರಿ
- ಆಜೂರ್ ಡೆವಲಪರ್ CLI ಮೂಲಕ ಬೆಂಬಲಿತ ಹಲವಾರು IaC ಪ್ರೊವೈಡೆರ್ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ಸಾಮಾನ್ಯ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪಗಳಿಗೆ Bicep ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಅನುಷ್ಠಾನ ಮಾಡಿ
- ಸಂಪನ್ಮೂಲ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು, ಚರಗಳು ಮತ್ತು ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
- ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆ ಸೇರಿದಂತೆ ಸುಧಾರಿತ ಇಂಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನ ಮಾಡಿ
- ಸಂಪನ್ಮೂಲ ಜೀವನಚಕ್ರ, ನವೀಕರಣಗಳು ಮತ್ತು ಅವಲಂಬನೆ ವಿಶ್ಲೇಷಣೆಯನ್ನು ನಿರ್ವಹಿಸಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳ್ಳುವ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- Bicep ಮತ್ತು ARM ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಉಪಯೋಗಿಸಿ Azure ಮೂಲಸೌಕರ್ಯವನ್ನು ವಿನ್ಯಾಸ ಮಾಡು ಮತ್ತು ಒದಗಿಸು
- ಸರಿಯಾದ ಸಂಪನ್ಮೂಲ ಅವಲಂಬನೆಗಳೊಂದಿಗೆ ಜಟಿಲ ಬಹು-ಸೇವಾ ಸ್ಥಾಪನೆಯನ್ನು ಸಂರಚಿಸು
- ಹಲವು ಪರಿಸರಗಳು ಮತ್ತು ಸಂರಚನೆಗಳಿಗಾಗಿ ಪರಿಮಾಣಿತ ಟ್ಯಾಂಪ್ಲೇಟುಗಳನ್ನು ಅನುಷ್ಠಾನ ಮಾಡು
- ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವ ಸಮಸ್ಯೆಗಳನ್ನು ತಾತ೯ಿ andಯ ಮಾಡಿ ಮತ್ತು ನಿಯೋಜನೆ ವಿಫಲತೆಗಳನ್ನು ಪರಿಹರಿಸು
- ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸಕ್ಕೆ Azure ಉತ್ತಮ ವಿನ್ಯಾಸ ಚಟುವಟಿಕೆ ಸಾರಾಂಶ ತತ್ವಗಳನ್ನು ಅನ್ವಯಿಸು
- ಮೂಲಸೌಕರ್ಯ ನವೀಕರಣಗಳನ್ನು ನಿರ್ವಹಿಸಿ ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಆವೃತ್ತಿ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನ ಮಾಡು

## ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆ ಅವಲೋಕನ

Azure ಡೆವಲಪರ್ CLI ಹಲವಾರು Infrastructure as Code (IaC) ಪ್ರೊವೈಡರ್ ಗಳನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ:
- **Bicep** (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ) - Azure ನ ಡೊಮೈನ್-ವಿಶೇಷ ಭಾಷೆ
- **ARM Templates** - Bicep ಅನ್ನು ARM ಗೆ ಸಂಯೋಜಿಸಲಾಗುತ್ತದೆ; ಕಚ್ಚಾ ARM JSON ಪ್ರತ್ಯೇಕ ಅಂತರ್ನಿರ್ಮಿತವನ್ನು ಹೊಂದಿಲ್ಲ `infra.provider`
- **Terraform** - ಬಹು-ಕ್ಲೌಡ್ ಮೂಲಸೌಕರ್ಯ ಸಾಧನ
- **ವಿಸ್ತರಣೆ ಪ್ರೊವೈಡರ್ ಗಳ** - ಪ್ರತ್ಯೇಕವಾಗಿ ಇನ್ಸ್‌ಟಾಲ್ ಮಾಡಬೇಕಾದ ಪ್ರೊವೈಡರ್ ವಿಸ್ತರಣೆ ಮತ್ತು ಅದರ ದಾಖಲಾಗಿರುವ ಸಂರಚನೆಯನ್ನು ಬೇಕಾಗಿದ್ದು; ಯಾವುದೇ ಪ್ರೊವೈಡರ್ ಸ್ಟ್ರೀಂಗ್ ಬೆಂಬಲಿತವಾಗಿದೆ ಎಂದು ಊಹಿಸಬೇಡಿ

## Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಸಂಪನ್ಮೂಲ ಅಧಿಕಾರವ್ಯವಸ್ಥೆ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ಅನ್ವಯಿಕೆಗಳಿಗೆ ಸಾಮಾನ್ಯ ಏಜುರ್ನ್ ಸೇವೆಗಳು
- **ಗಣನೆ**: ಅಪ್ಲಿಕೇಶನ್ ಸರ್ವಿಸ್, ಕಂಡೇನರ್ ಅಪ್ಸ್, ಫಂಕ್ಷನ್ಸ್, ವರ್ಚುವಲ್ ಮಷೀನ್ಸ್
- **ಸಂಗ್ರಹಣೆ**: ಸ್ಟೋರೇಜ್ ಖಾತೆ, ಕೋಸ್ಮೋಸ್ ಡಿಬಿ, ಎಸ್‍ಕ್ಯೂಎಲ್ ಡೇಟಾಬೇಸ್, ಪೋಸ್ಟ್‌ಗ್ರೆಸ್‌ಕ್ಯೂಎಲ್
- **ನೆಟ್‌ವರ್ಕಿಂಗ್**: ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್, ಅಪ್ಲಿಕೇಶನ್ ಗೇಟ್ವೇ, ಸಿಡಿಎನ್
- **ಭದ್ರತೆ**: ಕೀ ವಾಲ್ಟ್, ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್, ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್
- **ಎಐ/ಎಂಎಲ್**: ಏಜುರ್ನ್ ಎಐ ಸೇವೆಗಳು, ಏಜುರ್ನ್ ಓಪನ್‌ಎಐ, ಏಜುರ್ನ್ ಮೆಷಿನ್ ಲರ್ನಿಂಗ್

## ಸಿಪ್ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟ್ಗಳು

### ಮೂಲ ಸಿಪ್ ಟೆಂಪ್ಲೇಟ್ ರಚನೆ
```bicep
// infra/modules/web.bicep - resource-group-scoped module fragment
targetScope = 'resourceGroup'
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
  tags: union(tags, { 'azd-service-name': 'web' })
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
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

ಸಂಪೂರ್ಣ azd ಯೋಜನೆಗಾಗಿ, ಟ್ಯಾಗ್ ಮಾಡಿದ ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು ಸೃಷ್ಟಿಸುವ ಮತ್ತು ಅದರ ವ್ಯಾಪ್ತಿಯನ್ನು ಪಾಸ್ ಮಾಡುವ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್-ವ್ಯಾಪ್ತಿಯ `infra/main.bicep` ನಿಂದ ಈ ಮೋಡ್ಯೂಲನ್ನು ಕರೆಸಿರಿ. `main.parameters.json` ಯಲ್ಲಿ `environmentName`/`location` ಹೊಂದಿಸಿರಿ. `azd-service-name: web` ಟ್ಯಾಗ್ ಸಂಪನ್ಮೂಲವನ್ನು `services.web` ಗೆ ಸಂಯೋಜಿಸುತ್ತದೆ; ಏಕೈಕ ನಿರ್ಣಾಯಕ ಔಟ್‌ಪುಟ್ ಹೆಸರುಗಳು ಸೇವೆ ಅನ್ವೇಷಣೆಯನ್ನು ಸಂರಚಿಸುವುದಿಲ್ಲ.

### ಉನ್ನತ ಬೈಸೆಪ್ ಮಾದರಿಗಳು

#### ಮಾಯಾಜಾಲ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್
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
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|22-lts'
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

#### ಶರತಾನುಗತ ಸಂಪನ್ಮೂಲ ರಚನೆ
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

## 🌐 azd ಜೊತೆ Terraform ಬಳಕೆ

ಬೈಸೆಪ್ azd ನ ಡೀಫಾಲ್ಟ್ ಆಗಿದ್ದು, ಆದರೆ azd **Terraform** ಕ್ಕೆ ಕೂಡ ಬೆಂಬಲ ನೀಡುತ್ತದೆ—ನಿಮ್ಮ ತಂಡ ಇದನ್ನು ಈಗಾಗಲೇ ಆಧಾರಿತವಾಗಿರಿಸಿದರೆ ಅಥವಾ ನೀವು ಬಹು-ಮೇಘವಾದ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ನಿರ್ವಹಿಸಿದರೆ ಉಪಯುಕ್ತವಾಗಿದೆ. azd ವರ್ಕ್‌ಫ್ಲೋ (`azd up`, `azd provision`, `azd down`) ಅದೇ; ಮಾತ್ರ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಭಾಷೆ ಮತ್ತು ಫೋಲ್ಡರ್ ವಿನ್ಯಾಸ ಬದಲಾಗುತ್ತದೆ.

### azd ಗೆ Terraform ಬಳಕೆಯನ್ನು ಹೇಳಿ

Terraform ಪ್ರೊವೈಡರ್ ಅನ್ನು ಕೋರಿಸುವಂತೆ `infra` ವಿಭಾಗವನ್ನು `azure.yaml` ಗೆ ಸೇರಿಸಿ:

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Terraform ಫೋಲ್ಡರ್ ವಿನ್ಯಾಸ

Terraform ಪ್ರೊವೈಡರ್ ಸತ್ತರಕ್ಕೆ, ನಿಮ್ಮ `infra/` ಫೋಲ್ಡರ್ ಬೈಸೆಪ್ ಬದಲು `.tf` ಕಡತಗಳನ್ನು ಬಳಸುತ್ತದೆ:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ಒಂದು `main.tf` ತುಣುಕಿನ ಭಾಗ

ಇದು ಕೇವಲ ಸಂಪನ್ಮೂಲ ಗುಂಪು ಮತ್ತು ಯೋಜನೆಯನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ, ನಿಯೋಜಿಸಬಹುದಾದ ಸೇವೆಯನ್ನಲ್ಲ. ನೀವು ಇನ್‌ಪುಟ್ ವೇರಿಯಬಲ್ಗಳನ್ನು, ಒಪ್ಪಿಗೆಯುಳ್ಳ `azurerm` ಪ್ರೊವೈಡರ್, ವೆಬ್ ಆಪ್ ಮತ್ತು ಅದರ ಸೇವಾ ಟ್ಯಾಗ್/ಸಂಪನ್ಮೌಲ್ಯ ನಕ್ಷೆಯನ್ನು ಸಹ ಘೋಷಿಸಬೇಕು.

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### azd ನಿಮ್ಮ Terraform ಔಟ್‌ಪುಟ್‌ಗಳೊಂದಿಗೆ ಹೇಗೆ ಸಂಪರ್ಕಿಸುತ್ತದೆ

azd Terraform **outputs** ಅನ್ನು ಪರಿಸರ ಮೌಲ್ಯಗಳಾಗಿ ಓದುತ್ತದೆ. ಈ ತುಣುಕಿನ ಭಾಗ ನೀವು `azurerm_linux_web_app.web` ವ್ಯಾಖ್ಯಾನಿಸಿದ್ದೀರಿ ಎಂದು ಊಹಿಸಿಕೊಳ್ಳುತ್ತೆ; ಸೇವೆ ಅನ್ವೇಷಣೆ ಇನ್ನೂ ಹೊಂದಿದ ಸಂಪನ್ಮೂಲ ಹೆಸರು ಅಥವಾ `azd-service-name` ಟ್ಯಾಗ್ ಅನ್ನು ಅಗತ್ಯವಿದೆ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **ಪ್ರಮುಖ:** azd ಪರಿಸರ ಪ್ರತಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಲು `azd-env-name` ಟ್ಯಾಗ್ ಮತ್ತು `AZURE_*` ಔಟ್‌ಪುಟ್‌ಗಳನ್ನು ಬಳಸುತ್ತದೆ. ನಿಮ್ಮ ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು ಸದಾ `"azd-env-name" = var.environment_name` ಜೊತೆ ಟ್ಯಾಗ್ ಮಾಡಿರಿ ಹೀಗಾಗಿ `azd down` ಎಲ್ಲವನ್ನೂ ಕಂಡು ತೆಗೆದುಹಾಕಬಹುದು.

### Terraform ಬಳಸಿ ನಿಯೋಜಿಸಿ

ಆಜ್ಞೆಗಳು ಬೈಸೆಪ್ ಜೊತೆಗೆ ಸಂಪೂರ್ಣ ಸಮಾನವಾಗಿವೆ:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **ಪೂರ್ವಾಪೇಕ್ಷಿತ:** Terraform ಅನ್ನು ನಿಮ್ಮ `PATH` ನಲ್ಲಿ ಸ್ಥಾಪಿಸಲಾಗಿರಬೇಕು. azd Terraform *ವರ크್ಫ್ಲೋ* ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ ಆದರೆ Terraform ಅನ್ನು ನಿಮಗಾಗಿ ಸ್ಥಾಪಿಸುವುದಿಲ್ಲ. ಸ್ಥಿತಿಗಾಗಿ, azd ಡೀಫಾಲ್ಟ್ ಆಕಾರದಲ್ಲಿ ಸ್ಥಳೀಯ ಸ್ಥಿತಿಯನ್ನು ಬಳಸುತ್ತದೆ; ತಂಡಗಳಿಗೆ, ದೂರವಾಣಿ ಬೇಕ್ಎಂಡ್ ಅನ್ನು (ಉದಾಹರಣೆಗೆ, Azure Storage ಬೇಕ್ಎಂಡ್) `provider.tf` ನಲ್ಲಿ ಸಂರಚಿಸಿ.

ಸಂಪೂರ್ಣ, ಚಾಲಿತ Terraform-ಆಧಾರಿತ ಸ್ಟಾರ್ಟರ್‌ಗಳನ್ನು ನೋಡಲು, [Awesome AZD ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/) ಅನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ ಮತ್ತು Terraform ಗೆ ಫಿಲ್ಟರ್ ಮಾಡಿ, ಅಥವಾ ಅಧಿಕೃತ [azd Terraform ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ಅನ್ನು ನೋಡಿ.

## 🧩 ಇತರೆ ಮೂಲಸೌಕರ್ಯ ಉಪಕರಣಗಳು

Pulumi azd 1.37.2 ರಲ್ಲಿ ಒಳಗೊಂಡಿರುವ ಪ್ರೊವೈಡರ್ ಅಲ್ಲ. खाली `infra.provider: pulumi` ಅನ್ನು ಹೊಂದಿಸುವುದರಿಂದ ಕಾರ್ಯನಿರ್ವಹಣೆಯ ಸಂಯೋಜನೆ ಸ್ಥಾಪವಾಗಿ ಬಾರದು, ಮತ್ತು `azd env new` ಪಲುಮಿ ಸ್ಟ್ಯಾಕ್ ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸೃಷ್ಟಿಸುವ ಅಥವಾ ಆರಿಸುವುದಿಲ್ಲ. ನೀವು ಬೇರೆ IaC ಉಪಕರಣವನ್ನು ಬಳಸಿದರೆ, ಮಾನ್ಯತಾಪ್ರಾಪ್ತ ಪ್ರೊವೈಡರ್ ವಿಸ್ತರಣೆಯ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಅನುಸರಿಸಿ ಅಥವಾ ಅದರ ಲೈಫ್ಸೈಕಲ್ ಅನ್ನು ನಿಮ್ಮದೇ ತಂಡದ ಕಾರ್ಯಪ್ರವಾಹದಲ್ಲಿ ಸ್ಪಷ್ಟವಾಗಿ ನಿರ್ವಹಿಸಿ. ಈ ಕೋರ್ಸ್ ಪಲುಮಿ ಪ್ರೊವೈಡರ್ ಅನ್ನು ಒದಗಿಸುವುದಿಲ್ಲ ಅಥವಾ ಪರಿಶೀಲಿಸುವುದಿಲ್ಲ.

## 🎯 ನಿಮ್ಮ ಸೇವೆಗೆ ಹೋಸ್ಟ್ ಆಯ್ಕೆಮಾಡುವುದು

`host` ಕ್ಷೇತ್ರವು `azure.yaml` ನಲ್ಲಿ ನಿಮ್ಮ ಕೋಡ್ ಎಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ ಎಂಬುದನ್ನು ನಿರ್ಧರಿಸುತ್ತದೆ. azd ಹಲವಾರು ಹೋಸ್ಟ್‌ಗಳನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ—ಸರಿಯಾದ ಹೋಸ್ಟ್ ಆಯ್ಕೆಮಾಡುವುದು ಮೂಲಸೌಕರ್ಯ ಭಾಷೆಗೆ ಹೋಲಿಸಿದರೆ ಹೆಚ್ಚು ಪ್ರಮುಖವಾಗಿದೆ. ಇಲ್ಲಿದೆ ಆರಂಭಿಕರಿಗೆ ಒಪ್ಪಿಗೆಯಾದ ಹೋಸ್ಟ್‌ಗಳ ಹೋಲಿಕೆ:

| `host` ಮೌಲ್ಯ | ಅತ್ಯುತ್ತಮ | ಕಾರಣ |
|--------------|----------|-----|
| `appservice` | ಪರಂಪರাগত ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಮತ್ತು API ಗಳು | ಸರಳ PaaS; ಕಂಟೈನರ್ ಅಗತ್ಯವಿಲ್ಲ |
| `staticwebapp` | ಮುಂಭಾಗದ SPAs (React, Vue, Angular) | ಜಾಗತಿಕ CDN + ಉಚಿತ SSL, ಅಳವಡಿಸಿಕೊಂಡ API ಬೆಂಬಲ |
| `function` | ಘಟನೆ-ಚಾಲಿತ ಮತ್ತು ಸರ್ವರ್‍ಲೆಸ್ ಕಾರ್ಯಭಾರಗಳು | ಶೂನ್ಯಕ್ಕೆ ಅಳವಡಿಕೆ, ಕಾರ್ಯನಿರ್ವಹಣೆ ಪ್ರತಿ ಪಾವತು |
| `containerapp` | ಕಂಟೈನರ್‌ಪದ್ಧತಿ ಮೈಕ್ರೊಸರ್ವಿಸುಗಳು | ಸರ್ವರ್‍ಲೆಸ್ ಕಂಟೈನರ್‌ಗಳು, ಶೂನ್ಯಕ್ಕೆ ಅಳವಡಿಕೆ, ಅಳವಡಿಕೃತ ಇನ್‌ಗ್ರೆಸ್ |
| `aks` | ಜಟಿಲ ಕಾರ್ಯತಂತ್ರದ ಅಗತ್ಯಗಳು | ನೀವು ನಿಜವಾಗಿಯೂ ಬೇಕಾದಾಗ ಪೂರ್ಣ Kubernetes ನಿಯಂತ್ರಣ |
| `springapp` | ಇದ್ದ Azure Spring Apps ರವಾನೆಗಳು | ಹಳೆಯ ಗುರಿ; ಸೇವೆಯು ಮಾರ್ಚ್ 31, 2028 ರಂದು ನಿವೃತ್ತಿಯಾಗುತ್ತದೆ ಮತ್ತು ಹೊಸ ಗ್ರಾಹಕರಿಗೆ ಮುಚ್ಚಲಾಗಿದೆ |

### ಯಾವಾಗ AKS ಬಳಕೆ ಮಾಡಬೇಕು

**ಆಜೂರ್ ಕುಬೆರ್ನೇಟಿಸ್ ಸರ್ವಿಸ್ (`host: aks`)** ನಿಮಗೆ ಕುಬೆರ್ನೇಟಿಸ್‌ನ ಸಂಪೂರ್ಣ ಶಕ್ತಿ ನೀಡುತ್ತದೆ—ಕಸ್ಟಮ್ ಕಂಟ್ರೋಲರ್‌ಗಳು, ಸರ್ವಿಸ್ ಮೆಷ್‌ಗಳು, ಸಂಕೀರ್ಣ ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಸೂಕ್ಷ್ಮ-ಗ್ರೇನ್ಡ್ ವೇಳಾಪಟ್ಟಿಯನ್ನು. ಆ ಶಕ್ತಿ ಕಾರ್ಯಾಚರಣೆಯ ಒಳಹೊರತೆಗೆ ಹೊಂದಿಕೊಂಡಿದೆ: ನೀವು ನೋಡ್ ಪೂಲ್‌ಗಳನ್ನು, ಅಪ್‌ಗ್ರೇಡ್‌ಗಳನ್ನು ಮತ್ತು ಕ್ಲಸ್ಟರ್ ನೆಟ್ವರ್ಕಿಂಗ್ ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತೀರಿ.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ನೀವು ಶಕ್ತವಿರುವಾಗಲೂ ಸರಳವಾಗಿ ಪ್ರಾರಂಭಿಸಿ.** ಬಹುತೇಕ ಮೈಕ್ರೋಸರ್ವಿಸ್ಗಳಿಗೆ, **ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ಗಳು** ನಿಮಗೆ ಕಂಟೇನರ್‌ಗಳು, ಸ್ವಯಂಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಶೂನ್ಯಕ್ಕೆ ವಿಸ್ತಾರವನ್ನು ನೀಡುತ್ತದೆ ಕ್ಲಸ್ಟರ್ ನಿರ್ವಹಣೆ ಇಲ್ಲದೆ. ಕುಬೆರ್ನೇಟಿಸ್ ನೈಜ ವೈಶಿಷ್ಟ್ಯಗಳ ಅಗತ್ಯವಿದ್ದಾಗ ಮಾತ್ರ AKS ಆಯ್ಕೆಮಾಡಿ.

### ಯಾವಾಗ ಆಜೂರ್ ಸ್ಪ್ರಿಂಗ್ಅಪ್‌ಗಳು ಬಳಸು

**ಆಜೂರ್ ಸ್ಪ್ರಿಂಗ್ಅಪ್‌ಗಳು (`host: springapp`)** ಸ್ಪ್ರಿಂಗ್ ಬೂಟ್ ಗಾಗಿ ಉದ್ದೇಶಿಸಲಾದ ನಿರ್ವಹಿತ ರನ್‌ಟೈಮ್. ಇದು ಸರ್ವಿಸ್ ಡಿಸ್ಕवरी, ಕಾನ್ಫಿಗ್ ಸರ್ವರ್ ಮತ್ತು ಬ್ಲೂ-ಗ್ರೀನ್ ನಿಯೋಜನೆಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ ಹೀಗಾಗಿ ಜಾವಾ ತಂಡಗಳು తమ ಬಂಡವಾಳವನ್ನು ಸ್ವಂತವಾಗಿ ನಿರ್ವಹಿಸುವ ಅಗತ್ಯವಿಲ್ಲ.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> ಹೊಸ ಶಾಶ್ವತ ಯೋಜನೆಗಾಗಿ ಆಜೂರ್ ಸ್ಪ್ರಿಂಗ್ಅಪ್‌ಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡಬೇಡಿ: ಇದು ಹೊಸ ಗ್ರಾಹಕರಿಗೆ ಮುಚ್ಚಲಾಗಿದೆ ಮತ್ತು [2028 ಮಾರ್ಚ್ 31ರಂದು ನಿವೃತ್ತಿಯಾಗಲಿದೆ](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ಗಳಂತಹ ಬೆಂಬಲಿತ ಪರ್ಯಾಯಗಳನ್ನು प्राथमिकತೆಯಾಗಿ ಆಯ್ಕೆಮಾಡಿ ಮತ್ತು ಇತ್ತೀಚಿನ ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಸ್ಥಳಾಂತರವನ್ನು ಯೋಜಿಸಿ.

## 🗃️ ಡೇಟಾಬೇಸ್ ಪ್ರೊವಿಷನಿಂಗ್

### ಕೋಸ್ಮೋಸ್ DB
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

### ಪೋಸ್ಟ್‌ಗ್ರೆSQL
**ಫ್ರಾಗ್ಮೆಂಟ್ ಪೂರ್ವಶರತ್ತುಗಳು:** `@secure() param databasePassword string`ನ್ನು ಘೋಷಿಸಿ ಮತ್ತು ಬಲವಾದ ಒದಗಿಸಲಾಗಿರುವ ಮೌಲ್ಯವನ್ನು ಬಳಸಿ. ಸಾರ್ವಜನಿಕ ಪ್ರವೇಶ **ಅಥವಾ** delegation ಮಾಡಿದ ಸಬ್ನೆಟ್/ಖಾಸಗಿ DNS ಅನ್ನು ಕೆಳಗಿನಂತೆ ಏಕರೂಪಗೊಳಿಸಿ; ಈ ಎರಡು ಸ્નಿಪೆಟ್‌ಗಳು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತಮ್ಮನ್ನು ತಾನೇ ಸಂಪರ್ಕಿಸುವುದಿಲ್ಲ.

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

`0.0.0.0` ನಿಯಮವು ನಿಮ್ಮ ಸ್ವಂತ सदस्यತಾ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್ ಹೊರತಾಗಿ Azure ಸೇವೆಗಳಿಂದ ಸಂಪರ್ಕಗಳನ್ನು ಅನುಮತಿಸುತ್ತದೆ. ಇದು ಖಾಸಗಿ ನೆಟ್ವರ್ಕಿಂಗ್ ಅಲ್ಲ; ನಿಜವಾದ ಕೆಲಸಗಳಿಗೆ ನಿರ್ಬಂಧಿತ ನೆಟ್ವರ್ಕ್ ವಿನ್ಯಾಸವನ್ನು ಮೆಚ್ಚಿಕೊಳ್ಳಿ.

## 🔒 ಭದ್ರತೆ ಮತ್ತು ರಹಸ್ಯ ನಿರ್ವಹಣೆ

### ಕೀ ವಾಲ್ಟ್ ಏಕರೂಪತೆ
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

### ನಿರ್ವಹಿತ ಗುರುತಿನ ಸಂರಚನೆ
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
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

ಸಿಸ್ಟಂ-ನಿಗದಿತ ಗುರುತಿಗಾಗಿ, `AZURE_CLIENT_ID` ಅನ್ನು ಅದರ ಪ್ರಿನ್ಸಿಪಲ್ ID ಗೆ ಸೆಟ್ ಮಾಡಬೇಡಿ. ಬಳಸونکي-ನಿಗದಿತ ಗುರುತಿನು ಅದರ **ಕ್ಲೈಯಂಟ್ ID** ಅನ್ನು ಬಳಸುತ್ತದೆ, ಅಲ್ಲದೆ ತನ್ನ ವಸ್ತು/ಪ್ರಿನ್ಸಿಪಲ್ ID ಅನ್ನು ಅಲ್ಲ. ಕೀ ವಾಲ್ಟ್ ರೆಫರೆನ್ಸಿಗೆ ಅಪ್ಲಿಕೇಶನ್ ಗುರುತಿಯ ವಾಲ್ಟ್ ಪಾತ್ರ ನಿಯೋಜನೆ ಮತ್ತು ನೆಟ್ವರ್ಕ್ ಪ್ರವೇಶವೂ ಬೇಕಾಗಿರುತ್ತದೆ.

## 🌍 ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಸಂಪರ್ಕ

### ವರ್ಚುವಲ್ ನೆಟ್ವರ್ಕ್ ಸಂರಚನೆ
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

### SSL ಜೊತೆಗೆ ಅಪ್ಲಿಕೇಶನ್ ಗೇಟ್ವೇ
**ಅಸಂಪೂರ್ಣ ವಾಸ್ತುಶಿಲ್ಪದ ಫ್ರಾಗ್ಮೆಂಟ್, ನಿಯೋಜಿಸಲು ಯೋಗ್ಯ ಗೇಟ್ವೇ ಅಲ್ಲ:** VNet ಗೆ ವಿಶೇಷವಾದ `gateway-subnet` ಸೇರಿಸಿ ಜೊತೆಗೆ ಬ್ಯಾಕೆಂಡ್ ಪೂಲ್ಸ್, HTTP ಸೆಟ್ಟಿಂಗ್‌ಗಳು, ಶ್ರೋತೃಗಳು, ಪ್ರಾಥಮಿಕತೆಗಳೊಂದಿಗೆ ಮಾರ್ಗ ನಿಯಮಗಳು ಮತ್ತು TLS ಪ್ರಮಾಣಪತ್ರ (ಅಥವಾ ಅಧಿಕಾರ ಹೊಂದಿದ ಕೀ ವಾಲ್ಟ್ ರೆಫರೆನ್ಸ್). ಕೇವಲ ಪೋರ್ಟ್ 443 ತೆರೆದಿರುವುದು HTTPS ಸಂರಚಿಸುವುದಿಲ್ಲ.

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

## 📊 ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಗಮನಾರ್ಹತೆ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್
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

### ಕಸ್ಟಮ್ ಮೀಟ್ರಿಕ್‌ಗಳು ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳು
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [appServicePlan.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          metricNamespace: 'Microsoft.Web/serverfarms'
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

## 🔧 ವಾತಾವರಣ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು

### ವಿಭಿನ್ನ ವಾತಾವರಣಗಳಿಗೆ ಪ್ಯಾರಾಮೀಟರ್ ಫೈಲ್‌ಗಳು
ಕೆಳಗಿನ ಎರಡು ಫೈಲ್‌ಗಳು **ಪಾರ್ಯಾಯಿಕ ಪ್ಯಾರಾಮೀಟರ್-ಫೈಲ್ ಉದಾಹರಣೆಗಳು**. azd ಸ್ವಯಂಚಾಲಿತವಾಗಿ ವಾತಾವರಣದ ಹೆಸರಿನಿಂದ `main.parameters.dev.json` ಅಥವಾ `main.parameters.prod.json` ಅನ್ನು ಆಯ್ಕೆ ಮಾಡುವುದಿಲ್ಲ. ನಿಜವಾದ `main.parameters.json` ಅನ್ನು ವಾತಾವರಣ ಬದಲಾವಣೆಗಳೊಂದಿಗೆ (ಉದಾಹರಣೆಗೆ `${APP_SERVICE_SKU=B1}`) ಬಳಸಿ, ಮತ್ತು ಪ್ರತಿಯೊಂದು ಪ್ಯಾರಾಮೀಟರ್ನ್ನೂ Bicep ನಲ್ಲಿ ಘೋಷಿಸಿ/ಬಳಸಿರಿ.

`infra/main.parameters.dev.json`ಗಾಗಿ ಉದಾಹರಣಾ ವಿಷಯಗಳು:

```json
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

`infra/main.parameters.prod.json`ಗಾಗಿ ಉದಾಹರಣಾ ವಿಷಯಗಳು:

```json
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

### ಶರತ್ತುಬದ್ಧ ಸಂಪನ್ಮೂಲ ಒದಗಿಸಿಕೊಂಡುವಿಕೆ
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: 'stdev${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: 'stprod${resourceToken}'
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

## 🚀 ಅಭಿವೃದ್ಧಿಯಾದ ಒದಗಿಸುವಿಕೆ ಮಾದರಿಗಳು

### ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆ
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

### ಮೂಲಸೌಕರ್ಯ ಪರೀಕ್ಷೆ
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆ ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸುವುದಿಲ್ಲ. ಅಪ್ಲಿಕೇಶನ್ ಪರಿಶೀಲನೆಗಳನ್ನು `azd deploy`/`azd up` ನಂತ್ರ ಮಾತ್ರ ನಡೆಸಿರಿ, ಮತ್ತು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅದನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿದಲ್ಲಿ ಮಾತ್ರ `/health` ಬಳಸಿ. ARM ನಿಯೋಜನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತವೆ ಮತ್ತು ಹೆಚ್ಚುವರಿ ಗುರುತು, ಬೆಂಬಲಿತ ರನ್‌ಟೈಂ ಆವೃತ್ತಿಗಳು ಮತ್ತು ಅನುಮತಿಗಳನ್ನು ಅಗತ್ಯವಿರುತ್ತವೆ; ಅವು ಸ್ಥಳೀಯ ಯೂನಿಟ್ ಟೆಸ್ಟ್ಗಳು ಅಲ್ಲ.

## 🧪 ಮೂಲಸೌಕರ್ಯ ಪೂರ್ವ ವೀಕ್ಷಣೆ ಮತ್ತು ಪರಿಶೀಲನೆ (ಹೊಸ)

### ನಿಯೋಜನೆಯ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳ ಪೂರ್ವ ವೀಕ್ಷಣೆ

`azd provision --preview` ವೈಶಿಷ್ಟ್ಯವು ನೀವು ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಜವಾಗಿಯೂ ನಿಯೋಜಿಸುವ ಮೊದಲು **ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆಯನ್ನು ಅನುಕರಣ ಮಾಡುತ್ತಾ** ತಿಳಿಸುತ್ತದೆ. ಇದು `terraform plan` ಅಥವಾ `bicep what-if` ಯಂತೆ ಮನಸ್ಸಿನಲ್ಲಿ ಇದ್ದು ನಿಮ್ಮ Azure ವಾತಾವರಣದಲ್ಲಿ ಬರುವ ಬದಲಾವಣೆಗಳ **ದ್ರೈ-ರನ್ ವೀಕ್ಷಣೆಯನ್ನು** ನೀಡುತ್ತದೆ.

#### 🛠️ ಇದು ಏನು ಮಾಡುತ್ತದೆ
- **ನಿಮ್ಮ IaC ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸುತ್ತದೆ** (Bicep ಅಥವಾ Terraform)
- **ಸಂಪನ್ಮೂಲ ಬದಲಾವಣೆಗಳ ಪೂರ್ವ ವೀಕ್ಷಣೆಯನ್ನು ತೋರಿಸುತ್ತದೆ**: ಸೇರಿಸುವುದು, ಅಳಿಸುವುದು, ನವೀಕರಿಸುವುದು
- **ಪ್ರದಾತೃ ಪೂರ್ವಾ ಸೂಚಿಸಿದ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸುವುದಿಲ್ಲ** — ಮೊದಲಿಗೆ ಪ್ರಾಜೆಕ್ಟ್ ಹೂಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ; ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ಬದನಿ ಪರಿಣಾಮಗಳು ಇರಬಹುದು ಮತ್ತು ಪೂರ್ವ ವೀಕ್ಷಣೆಗೆ Azure ಅನುಮತಿಗಳು ಬೇಕಾಗುತ್ತವೆ

#### ಉಪಯೋಗದ ಪ್ರಕರಣಗಳು
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

ಈ ಆಜ್ಞೆ ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ:
- **ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಗದಿಪಡಿಸುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ**
- **ಅಧಿಕಾರದ ತಪ್ಪುಗಳನ್ನು ದೀರ್ಘವಾಗಬಿಡದೆ ಹಿಡಿಯಿರಿ** ಅಭಿವೃದ್ಧಿ ಚಕ್ರದಲ್ಲಿ
- **ತಂಡ ವಾತಾವರಣದಲ್ಲಿ ಸುರಕ್ಷಿತವಾಗಿ ಸಹಕರಿಸಿ**
- **ಐಚ್ಛಿಕ ಶ್ರೇಷ್ಠತೆ ನಿಯೋಜನೆಗಳನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ**

ಇದು ವಿಶೇಷವಾಗಿ ಉಪಯುಕ್ತವಾಗುತ್ತದೆ:
- ಸಂಕೀರ್ಣ ಬಹು-ಸೇವಾ ವಾತಾವರಣಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡುವಾಗ
- ಉತ್ಪಾದನಾ ಮೂಲಸೌಕರ್ಯಕ್ಕೆ ಬದಲಾವಣೆ ಮಾಡುತ್ತಿರುವಾಗ
- PR ಅನುಮೋದನೆಗೆ ಟೆಂಪ್ಲೇಟ್ ಪರಿವರ್ತನೆಗಳನ್ನು ಪರಿಶೀಲಿಸುವಾಗ
- ಮೂಲಸೌಕರ್ಯ ಮಾದರಿಗಳಲ್ಲಿ ಹೊಸ ತಂಡ ಸದಸ್ಯರನ್ನು ತರಬೇತಿ ನೀಡುವಾಗ

### ಉದಾಹರಣಾ ಪೂರ್ವ ವೀಕ್ಷಣೆ ಔಟ್‍ಪುಟ್
ಖಚಿತ ಪೂರ್ವ ವೀಕ್ಷಣೆ ಔಟ್‍ಪುಟ್ ಪ್ರೊವೈಡರ್ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಯಿಂದ ಬದಲಾಗಬಹುದು, ಆದರೆ ಫಲಿತಾಂಶವು ಯಾವುದೇ ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸುವ ಮೊದಲು ಸ್ಪಷ್ಟವಾಗಿ ಸೂಚಿಸಬೇಕು.

```text
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

## �🔄 ಸಂಪನ್ಮೂಲ ನವೀಕರಣಗಳು ಮತ್ತು ವಲಸೆ

### ಸುರಕ್ಷಿತ ಸಂಪನ್ಮೂಲ ನವೀಕರಣಗಳು
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes after preview confirmation
azd provision
# In automation, --no-prompt uses known values and fails on unresolved decisions;
# it is not an approval bypass.

# For rollback, use Git to revert infrastructure changes:
git revert HEAD  # Revert last infrastructure commit
azd provision    # Apply previous infrastructure state
```

### ಡೇಟಾಬೇಸ್ ವಲಸೆ
**ಅಸಂಪೂರ್ಣ ನಿಯೋಜನಾ ಸ್ಕ್ರಿಪ್ಟ್ ಮಾದರಿ:** ಅಗತ್ಯವಿರುವ ಸ್ಥಳದಲ್ಲಿ ವಿನ್ಯಾಸಗೊಳ್ಳಲಾದ ಬಳಕೆದಾರ-ನಿಗದಿತ ಗುರುತನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ, ಬೆಂಬಲಿತ Azure CLI ರನ್‌ಟೈಂ, ಲಭ್ಯವಿರುವ ವಲಸೆ ಸಾಧನಗಳು, ಒದಗಿಸಲಾದ ವಲಸೆ ಡೈರೆಕ್ಟರಿ/ಸಂರಚನೆ ಮತ್ತು ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ. ಇದನ್ನು ಕೇವಲ ಈ ಸಂಪನ್ಮೂಲವನ್ನು ಟೆಂಪ್ಲೇಟಿನಲ್ಲಿ ಅಂಟಿಸುವುದರಿಂದ ನಿರ್ವಹಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ.

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
    retentionInterval: 'P1D'
  }
}
```

## 🎯 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಸಂಪನ್ಮೂಲ ನಾಮಕರಣ ಸರಣಿಗಳು
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. ಟ್ಯಾಗ್ ತಂತ್ರಜ್ಞಾನ
```bicep
// utcNow is only allowed in a parameter default, not directly in a variable.
param deploymentDate string = utcNow('yyyy-MM-dd')

var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'deployment-date': deploymentDate
}
```

### 3. ಪ್ಯಾರಾಮೀಟರ್ ಪರಿಶೀಲನೆ
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

### 4. ಔಟ್ಪುಟ್ ಸಂಘಟನೆ
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

## ಮುಂದಿನ ಹಂತಗಳು

- [ಪೂರ್ವ ಅವಲೋಕನ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../chapter-07-troubleshooting/common-issues.md) - ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ
- [ಡೆಬಗ್ಗಿಂಗ್ ಗೈಡ್](../chapter-07-troubleshooting/debugging.md) - ಪ್ರೊವಿಷನಿಂಗ್ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಿ
- [SKU ಆಯ್ಕೆ](../chapter-06-pre-deployment/sku-selection.md) - ಸೂಕ್ತ ಸერვೀಸ್ ಟಿಯರ್‌ಗಳನ್ನು ಆರಿಸಿ

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [ಅಜೂರ್ ಬೈಸೆಪ್ ಡಾಕ್ಯುಮೆಂಟೇಷನ್](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [ಅಜೂರ್ ರಿಸೋರ್ಸ್ ಮ್ಯಾನೇಜರ್ ಟೆಂಪ್ಲೇಟುಗಳು](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [ಅಜೂರ್ ಆರ್ಕಿಟೆಕ್ಚರ್ ಸೆಂಟರ್](https://learn.microsoft.com/en-us/azure/architecture/)
- [ಅಜೂರ್ ವೆಲ್-ಆರ್ಕಿಟೆಕ್ಟೆಡ್ ಫ್ರೇಮ್ವರ್ಕ್](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಗೈಡ್](deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
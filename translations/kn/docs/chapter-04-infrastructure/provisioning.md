# AZD ಮೂಲಕ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸುವುದು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಆರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - Infrastructure as Code ಮತ್ತು ನಿಯೋಜನೆ
- **⬅️ ಹಿಂದಿನದು**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **➡️ ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **🔧 ಸಂಬಂಧಿಸಿದ**: [ಅಧ್ಯಾಯ 6: ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ](../chapter-06-pre-deployment/capacity-planning.md)

## ಪರಿಚಯ

ಈ ವಿಸ್ತೃತ ಮಾರ್ಗದರ್ಶಿಯಲ್ಲಿ Azure Developer CLI ಬಳಸಿಕೊಂಡು Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸುವುದು ಮತ್ತು ನಿರ್ವಹಿಸುವ ಬಗ್ಗೆ ಎಲ್ಲಾ ಅಗತ್ಯ ಮಾಹಿತಿಯನ್ನು ವಿವರಿಸಲಾಗಿದೆ. ಮೂಲ ಸಂಪನ್ಮೂಲ ರಚನೆ ನಿಂದ ಎಡವancée ಎಂಟರ್‌ಪ್ರೈಸ್-ಮಟ್ಟದ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ವಿನ್ಯಾಸಗಳವರೆಗೆ Bicep, ARM ಟೆಂಪ್ಲೇಟುಗಳು, Terraform ಮತ್ತು Pulumi ಬಳಸಿಕೊಂಡು Infrastructure as Code (IaC) نمುರುಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದನ್ನು ಕಲಿಯಿರಿ.

## ಕಲಿಕೋದ್ದೇಶಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದಾಗ ನೀವು:
- Infrastructure as Code ತತ್ವಗಳನ್ನು ಹಾಗೂ Azure ಸಂಪನ್ಮೂಲ ಒದಗಿಸುವಿಕೆಯನ್ನು നಿಪುಣರಾಗಿ ತಿಳಿಯುವಿರಿ
- Azure Developer CLI ಬೆಂಬಲಿಸುವ მრავალ IaC ಪೂರೈಕೆದಾರರನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಸಾಮಾನ್ಯ ಅಪ್ಲಿಕೇಶನ್ ವಿನ್ಯಾಸಗಳಿಗಾಗಿ Bicep ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಅನುಷ್ಠಾನಗೊಳಿಸುವಿರಿ
- ಸಂಪನ್ಮೂಲ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು, ಚರಗಳು ಮತ್ತು ವಾತಾವರಣ-ನಿಖರ ಸೆಟ್ಟಿಂಗ್ಗಳನ್ನು ಕಾನ್‌ಫಿಗರ್ ಮಾಡುವಿರಿ
- ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಸೇಕ್ಯುರಿಟಿಯನ್ನು ಒಳಗೊಂಡ ವೃದ್ಧಿಶೀಲ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ نمುರುಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವಿರಿ
- ಸಂಪನ್ಮೂಲದ ಜೀವಚಕ್ರ, ಅಪ್ಡೇಟ್‌ಗಳು ಮತ್ತು ಅವಲಂಬನೆ ಪರಿಹಾರಣೆಯನ್ನು ನಿರ್ವಹಿಸುವಿರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರೈಸಿದ ಬಳಿಕ ನೀವು సామರ್ಥ್ಯ ಹೊಂದಿರುತ್ತೀರಿ:
- Bicep ಮತ್ತು ARM ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬಳಸಿ Azure ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ವಿನ್ಯಾಸ ಮತ್ತು ಒದಗಿಸುವುದು
- ಸರಿಯಾದ ಸಂಪನ್ಮೂಲ ಅವಲಂಬನೆಗಳೊಂದಿಗೆ複雑 ಮಲ್ಟಿ-ಸೇವಾ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ಕಾನ್‌ಫಿಗರ್ ಮತ್ತು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ವಿವಿಧ ವಾತಾವರಣಗಳು ಮತ್ತು ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳಿಗಾಗಿ ಪ್ಯಾರಾಮೀಟರಿ ಮಾಡಿದ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ರಚಿಸುವುದು
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒದಗಿಸುವಿಕೆಯಲ್ಲಿ ಉದ್ಭವಿಸುವ ಸಮಸ್ಯೆಗಳನ್ನು ಶೋಧಿಸಿ ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ಪರಿಹರಿಸುವುದು
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ವಿನ್ಯಾಸಕ್ಕೆ Azure Well-Architected Framework ತತ್ವಗಳನ್ನು ಅನ್ವಯಿಸುವುದು
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅಪ್ಡೇಟ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಿ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಆವೃತ್ತಿ ನಿರ್ವಹಣಾ ಯುಕ್ತಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು

## ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒದಗಿಸುವಿಕೆಯ ಅವಲೋಕನ

Azure Developer CLI ಹಲವು Infrastructure as Code (IaC) ಪೂರೈಕೆದಾರರನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ:
- **Bicep** (ಶಿಫಾರಸು) - Azure ನ ಡೊಮೇನ್-ನಿರ್ದಿಷ್ಟ ಭಾಷೆ
- **ARM Templates** - JSON ಆಧಾರಿತ Azure Resource Manager ಟೆಂಪ್ಲೇಟುಗಳು
- **Terraform** - ಹಲ್ವಿಚ್ಛೇದಗಳು-ಮೇಲೆ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್‌ಚರ್ ಉಪಕರಣ
- **Pulumi** - ಪ್ರೋಗ್ರಾಮಿಂಗ್ ಭಾಷೆಗಳೊಂದಿಗೆ ಆಧುನಿಕ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅಸ್ ಕೋಡ್

## Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಸಂಪನ್ಮೂಲ ತಳಹದಿಯು
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಸಾಮಾನ್ಯ Azure ಸೇವೆಗಳು
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟುಗಳು

### ಮೂಲ Bicep ಟೆಂಪ್ಲೇಟ್ ರಚನೆ
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

### ಅಡ್ವಾನ್ಸ್ಡ್ Bicep ರೂಪಕಗಳು

#### ಮಾಡ್ಯುಲರ್ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್
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

#### ಶರತ್ಬದ್ಧ ಸಂಪನ್ಮೂಲ ರಚನೆ
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

## 🌐 azd ನಲ್ಲಿ Terraform ಬಳಸು

Bicep ಅಜ್ಡಿನ ಡೀಫಾಲ್ಟ್ ಆಗಿದ್ದರೂ, ನಿಮ್ಮ ತಂಡ ಈಗಾಗಲೇ Terraform ಅನ್ನು ಪ್ರಾಮಾಣೀಕೃತವಾಗಿ ಬಳಸಿದರೆ ಅಥವಾ ನೀವು ಬಹು-ಮೇಘ (multi-cloud) ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ನಿರ್ವಹಿಸಿದ್ದರೆ azd **Terraform** ಅನ್ನು ಸಹ ಬೆಂಬಲಿಸುತ್ತದೆ. azd ಕಾರ್ಯಪ್ರವಾಹ (`azd up`, `azd provision`, `azd down`) ಒಂದೇ ಆಗಿವೆ; ಕೇವಲ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಭಾಷೆ ಮತ್ತು ಫೋಲ್ಡ್ರ್ ವಿನ್ಯಾಸ ಬದಲಾಗುತ್ತದೆ.

### azdಗೆ Terraform ಬಳಸಲು کہیں

`azure.yaml` ಗೆ Terraform ಪೂರೈಕೆದಾರವನ್ನು ಸೂಚಿಸುವ `infra` ವಿಭಾಗವನ್ನು ಸೇರಿಸಿ:

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

### Terraform ಫೋಲ್ಡ್ರ್ ವಿನ್ಯಾಸ

Terraform ಪೂರೈಕೆದಾರ ಬಳಸಿ, ನಿಮ್ಮ `infra/` ಫೋಲ್ಡರ್ Bicep ಬದಲಿಗೆ `.tf` ಫೈಲ್ಗಳನ್ನು ಬಳಸುತ್ತದೆ:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ಕನಿಷ್ಠ `main.tf`

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

### azd ನಿಮ್ಮ Terraform ಔಟ್‌ಪುಟ್‌ಗಳೊಂದಿಗೆ 어떻게 ಸಂಪರ್ಕಿಸುತ್ತದೆ

azd ನಿಮ್ಮ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ತಿಳಿಯಲು ಮತ್ತು ವಾತಾವರಣ ಮೌಲ್ಯಗಳನ್ನು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಕನೆಕ್ಟ್ ಮಾಡಲು Terraform **outputs** ಅನ್ನು ಓದುತ್ತದೆ. ಔಟ್‌ಪುಟ್ ಹೆಸರುಗಳಿಗೆ ಮಹತ್ವವಿದೆ—azd ಕೆಲವು ನಿರ್ದಿಷ್ಟ ಹೆಸರುಗಳನ್ನು ಹುಡುಕುತ್ತದೆ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **ಮುಖ್ಯPoints:** azd ಪ್ರತಿ ವಾತಾವರಣದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಲು `azd-env-name` ಟ್ಯಾಗ್ ಮತ್ತು `AZURE_*` ಔಟ್‌ಪುಟ್‌ಗಳನ್ನು ಬಳಸುತ್ತದೆ. ಎಲ್ಲವನ್ನೂ `azd down` ಕಾಣಿಸಿ ಮತ್ತು алыпಹಾಕಲು ನಿಮ್ಮ resource group ಅನ್ನು 항상 `"azd-env-name" = var.environment_name` ಎಂಬುದಾಗಿ ಟ್ಯಾಗ್ ಮಾಡಿ.

### Terraform ಮೂಲಕ ನಿಯೋಜಿಸು

ಕ್ಷಮೆ, ಆದೇಶಗಳು Bicep 同樣ೇ ಆಗಿವೆ:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ಹಿನ್ನೆಲೆದಲ್ಲಿ 'terraform plan' ಅನ್ನು ನಡೆಸುತ್ತದೆ
azd up                    # ವ್ಯವಸ್ಥೆಗೊಳಿಸುವುದು + ನಿಯೋಜಿಸುವುದು
azd down --force          # Terraform ಮೂಲಕ ನಿರ್ವಹಿಸಲ್ಪಟ್ಟ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಾಶಮಾಡುತ್ತದೆ
```

> **ಶರತ್ತು:** Terraform ನಿಮ್ಮ `PATH` ನಲ್ಲಿ ಸ್ಥಾಪಿತವಾಗಿರಬೇಕು. azd Terraform *workflow* ಅನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ ಆದರೆ Terraform ಅನ್ನು ನಿಮಗಾಗಿ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿಲ್ಲ. stateಗಾಗಿ, azd ಡೀಫಾಲ್ಟ್ ಆಗಿ ಲೋಕಲ್ state ನ್ನೇ ಬಳಸುತ್ತದೆ; ತಂಡಗಳಿಗಾಗಿ ಉತ್ತಮವಾದುದು ಆದೇಶಿತ ರಿಮೋಟ್ ಬ್ಯಾಕೆಂಡ್ ಅನ್ನು (`provider.tf` ನಲ್ಲಿ ಉದಾಹರಣೆಗೆ Azure Storage ಬ್ಯಾಕೆಂಡ್) ಕಾನ್‌ಫಿಗರ್ ಮಾಡುವುದು.

ಸಂಪೂರ್ಣ, ಕಾರ್ಯನಿರ್ವಹಿಸಬಹುದಾದ Terraform ಆಧಾರಿತ ಸ್ಟಾರ್ಟರ್ಸ್‌ಗಾಗಿ, [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ಅನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ ಮತ್ತು Terraform ಫಿಲ್ಟರ್ ಮಾಡಿ, ಅಥವಾ ಅಧಿಕೃತ [azd Terraform ದಸ್ತಾವೇಜು](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ಅನ್ನು ನೋಡಿ.

## 🧩 azd ನಲ್ಲಿ Pulumi ಬಳಸು

ನಿಮ್ಮ ತಂಡವು DSL ಬದಲಾಗಿ ಸಾಮಾನ್ಯ-ಉದ್ದೇಶದ ಭಾಷೆಗಳಲ್ಲಿ (TypeScript, Python, Go, ಅಥವಾ C#) ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬರೆಯುತ್ತಿದ್ದರೆ, azd **Pulumi** ನ್ನೂ ಬೆಂಬಲಿಸುತ್ತದೆ. Terraform ನಂತೆ, `azd up` / `azd provision` / `azd down` ಕಾರ್ಯಪ್ರವಾಹ ಅಪ್ರಭಾವಿತವಾಗಿರುತ್ತದೆ—ಕೇವಲ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೂಲಾಗಳು ಮತ್ತು ಫೋಲ್ಡರ್ ವಿನ್ಯಾಸ ವಿಭಿನ್ನವಾಗುತ್ತದೆ.

### azdಗೆ Pulumi ಬಳಸಲು کہیں

```yaml
# azure.yaml
name: my-pulumi-app
infra:
  provider: pulumi      # default is "bicep"
  path: infra           # folder containing your Pulumi program
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Pulumi ಫೋಲ್ಡರ್ ವಿನ್ಯಾಸ

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ಕನಿಷ್ಠ `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// ಪ್ರತಿ ಸಂಪನ್ಮೂಲಕ್ಕೂ ಟ್ಯಾಗ್ ಮಾಡಿ, ಹಾಗಾದರೆ azd ಅವುಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ ಮತ್ತು ತೆರವುಗೊಳಿಸಬಹುದು
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd ಈ ಔಟ್‌ಪುಟ್‌ಗಳನ್ನು ಮರಳಿ ಪಡೆದು ನಿಮ್ಮ ಪರಿಸರದಲ್ಲಿ ಬಳಸುತ್ತದೆ
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### ಸ್ಟ್ಯಾಕ್ಗಳು azd ವಾತಾವರಣಗಳಿಗೆ ನಕ್ಷಿಪಡಿಸುತ್ತವೆ

Pulumi ನಿಯೋಜನೆಗಳನ್ನು **ಸ್ಟ್ಯಾಕ್‌ಗಳು** ಅಲ್ಲಿ ಸಂಘಟಿಸುತ್ತದೆ, ಮತ್ತು azd ಪ್ರತಿ azd ವಾತಾವರಣವನ್ನು ಅದೇ ಹೆಸರು ಇರುವ Pulumi ಸ್ಟ್ಯಾಕ್ಗೆ ನಕ್ಷ್ಯ ಮಾಡುತ್ತದೆ. ನೀವು `azd env new staging` ಅನ್ನು ಚಾಲನೆ ಮಾಡಿದಾಗ, azd `staging` Pulumi ಸ್ಟ್ಯಾಕ್ ಅನ್ನು ಆಯ್ಕೆಮಾಡುತ್ತದೆ (ಅಥವಾ ನಿರ್ಮಿಸುತ್ತವೆ). ಅದೇ `azd-env-name` ಟ್ಯಾಗಿಂಗ್ ಮತ್ತು `AZURE_*` ಔಟ್‌ಪುಟ್ ನಿಯಮಗಳು ಅನ್ವಯಿಸುತ್ತವೆ, ಹೀಗಾಗಿ `azd down` ಎಲ್ಲವನ್ನೂ ಕಂಡು ತೆಗೆದುಹಾಕಬಹುದು.

### Pulumi ಮೂಲಕ ನಿಯೋಜಿಸು

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ಒಳಗಿನಿಂದ 'pulumi preview' ಅನ್ನು ನಡೆಸುತ್ತದೆ
azd up                    # ಪ್ರೊವಿಷನ್ + ಡಿಪ್ಲಾಯ್
azd down --force          # 'pulumi destroy' ಅನ್ನು ನಡೆಸುತ್ತದೆ
```

> **ಶರತ್ತು:** Pulumi ನಿಮ್ಮ `PATH` ನಲ್ಲಿ ಸ್ಥಾಪಿತವಾಗಿರಬೇಕು, ಮತ್ತು ನಿಮಗೆ ಸ್ಟೇಟ್ ಬ್ಯಾಕೆಂಡ್ ಬೇಕಾಗುತ್ತದೆ (Pulumi Cloud ಅಥವಾ Azure Blob Storage ನಂತಹ ಸ್ವಯಂ-ನಿರ್ವಹಿತ ಬ್ಯಾಕೆಂಡ್). azd Pulumi *workflow* ನ್ನೇ ನಿರ್ವಹಿಸುತ್ತದೆ, ಇನ್‌ಸ್ಟಾಲ್ ಅನ್ನು ಅಲ್ಲ. ಅಧಿಕೃತ [azd Pulumi ದಸ್ತಾವೇಜು](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) ನೋಡಿ.

## 🎯 ಸೇವೆಗಾಗಿ ಹೋಸ್ಟ್ ಆಯ್ಕೆ ಮಾಡುವುದು

`azure.yaml` ನಲ್ಲಿ `host` ಕ್ಷೇತ್ರವು ನಿಮ್ಮ ಕೋಡ್ ಎಲ್ಲಿ ಚಾಲನೆ ಆಗುತ್ತದೆ ಎಂಬುದನ್ನು ನಿರ್ಧರಿಸುತ್ತದೆ. azd ಹಲವಾರು ಹೋಸ್ಟ್‌ಗಳನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ—ಸರಿಯಾದ ಹೊರವನ್ನು ಆಯ್ಕೆಮಾಡುವುದು ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಭಾಷೆಯನ್ನು ಮೀರಿ ಹೆಚ್ಚು ಮಹತ್ತರವಾಗಿದೆ. ಇಲ್ಲಿದೆ ಆರಂಭಿಕರಿಗೆ ಸೂಕ್ತವಾದ ಹೋಲಿಕೆ:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | ಪಾರಂಪರ್ಯ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಮತ್ತು APIs | ಸರಳ PaaS; ಕಂಟೇನರ್‌ಗಳ ಅವಶ್ಯಕತೆ ಇಲ್ಲ |
| `staticwebapp` | ಫ್ರಂಟ್-ಎಂಡ್ SPAs (React, Vue, Angular) | Global CDN + ಉಚಿತ SSL, ಒಳಗಿರುವ API ಬೆಂಬಲ |
| `function` | ಈವೆಂಟ್-ಚಾಲಿತ ಮತ್ತು ಸರ್ವರ್‌ಲೆಸ್ ವರ್ಕ್ಲೋಡ್‌ಗಳು | ಶೂನ್ಯಕ್ಕೆ ಪ್ರಮಾಣಿತ ಸ್ಕೇಲಿಂಗ್, ಪ್ರತಿ ಕಾರ್ಯಾಚರಣೆಗೆ ಪಾವತಿ |
| `containerapp` | ಕಂಟೇನರೈಜ್ಡ್ ಮೈನಕ್ರೋಸರ್ವೀಸ್‌ಗಳು | ಸರ್ವರ್‌ಲೆಸ್ ಕಂಟೇನರ್‌ಗಳು, ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್, ಒಳಗಿರುವ ಇನ್‌ಗ್ರೆಸ್ |
| `aks` | ಸಂಕೀರ್ಣ ಆಯೋಜನೆ ಅಗತ್ಯಗಳು | ನೀವು ನಿಜವಾಗಿಯೂ ಬೇಕಾದಾಗ ಪೂರ್ಣ Kubernetes ನಿಯಂತ್ರಣ |
| `springapp` | Java Spring Boot ಅಪ್ಲಿಕೇಶನ್‌ಗಳು | Springಗಾಗಿ ಹೊಂದಿಕೊಳ್ಳಿಸಲಾದ Managed Azure Spring Apps ರನ್‌ಟೈಮ್ |

### AKS ಬಳಸಲು ಯಾವಾಗ ತಲುಪಬೇಕು

**Azure Kubernetes Service (`host: aks`)** ನಿಮಗೆ Kubernetes ನ ಸಂಪೂರ್ಣ ಶಕ್ತಿ ನೀಡುತ್ತದೆ—ಕಸ್ಟಮ್ ಕಂಟ್ರೋಲರ್‌ಗಳು, ಸರ್ವೀಸ್ ಮೆಶ್‌ಗಳು, ಸಂಕೀರ್ಣ ನೆಟ್ವರ್ಕಿಂಗ್, ಮತ್ತು ಸೂಕ್ಷ್ಮ ಶೆಡ್ಯೂಲಿಂಗ್. ಆ ಶಕ್ತಿಗೆ ನಿರ್ವಹಣಾ ಭಾರದೂ ಬರುತ್ತದೆ: ನೀವು ನೋಡ್ ಪೂಲ್‌ಗಳನ್ನು, ಅಪ್ಡೇಟ್‌ಗಳನ್ನು ಮತ್ತು ಕ್ಲಸ್ಟರ್ ನೆಟ್ವರ್ಕಿಂಗ್ ಅನ್ನು ನಿರ್ವಹಿಸಬೇಕು.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ಸದಾ ಸಾಧ್ಯವಾದರೆ ಸರಳತೆಯನ್ನು ಪ್ರಾರಂಭಿಸಿ.** ಬಹುತೇಕ ಮೈನಕ್ರೋಸರ್ವೀಸ್‌ಗಳಿಗಾಗಿ, **Container Apps** ನಿಮಗೆ ಕಂಟೇನರ್‌ಗಳು, ಆಟೋಸ್ಕೇಲಿಂಗ್ ಮತ್ತು ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ನೀಡುತ್ತದೆ ಕ್ರಸ್ಟರ್ ಅನ್ನು ನಿರ್ವಹಿಸದೆ. Kubernetes-ನಿರ್ದಿಷ್ಟ ವೈಶಿಷ್ಟ್ಯಗಳು ಅಗತ್ಯವಿದ್ದಾಗ ಮಾತ್ರ AKS ಆಯ್ಕೆಮಾಡಿ.

### Azure Spring Apps ಯಾವಾಗ ಬಳಸಬೇಕು

**Azure Spring Apps (`host: springapp`)** Spring Boot ಗಾಗಿ ಆವಶ್ಯಕತೆಯಾದ ನಿರ್ವಹಿತ ರನ್‌ಟೈಮ್ ಆಗಿದೆ. ಇದು ಸರ್ವೀಸ್ ಡಿಸ್ಕವರಿ, ಕಾನ್ಫಿಗ್ ಸರ್ವರ್ ಮತ್ತು ಬ್ಲೂ-ಗ್ರೀನ್ ನಿಯೋಜನೆಗಳನ್ನು ನಿರ್ವಹಿಸುತ್ತದೆ, ಹೀಗಾಗಿ Java ತಂಡಗಳು ತಮ್ಮದೇ ಬಯಲು ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ನಿರ್ವಹಿಸುವ ಅಗತ್ಯವಿಲ್ಲ.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Spring Boot ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿದ್ದಾಗ ಮತ್ತು ಅವುಗಳಿಗೆ ಹೊಂದಿಕೊಂಡ ರನ್‌ಟೈಮ್ ಬೇಕಾದಾಗ `springapp` ಬಳಸಿ. Spring-ನಿರ్దಿಷ್ಟ ಅಗತ್ಯಗಳಿಲ್ಲದ ಹೊಸ ಕಂಟೇನರೈಜ್ಡ್ Java ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ, ಬಹುಮಟ್ಟಿಗೆ `containerapp` ಸರಳವಾದ ಆಯ್ಕೆ ಆಗಿರುತ್ತದೆ.

## 🗃️ ಡೇಟಾಬೇಸ್ ಒದಗಿಸುವಿಕೆ

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

## 🔒 ಭದ್ರತೆ ಮತ್ತು ರಹಸ್ಯ ನಿರ್ವಹಣೆ

### Key Vault ಸಂಯೋಜನೆ
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

### Managed Identity ಕಾನ್ಫಿಗರೇಶನ್
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

## 🌍 ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಕನೆಕ್ಟಿವಿಟಿ

### ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್ ಕಾನ್ಫಿಗರೇಶನ್
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

### SSL ಹೊಂದಿರುವ Application Gateway
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

## 📊 ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ದೃಶ್ಯೀಕರಣ

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

### ಕಸ್ಟಮ್ ಮೀಟ್ರಿಕ್‌ಗಳು ಮತ್ತು ಅಲರ್ಟ್‌ಗಳು
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

## 🔧 ವಾತಾವರಣ-ನಿಖರ ಕಾನ್ಫಿಗರೇಶನ್‌ಗಳು

### ವಿಭಿನ್ನ ವಾತಾವರಣಗಳಿಗೆ ಪ್ಯಾರಾಮೀಟರ್ ಫೈಲ್‌ಗಳು
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

### ಶರತ್ಬದ್ಧ ಸಂಪನ್ಮೂಲ ಒದಗಿಸುವಿಕೆ
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

## 🚀 ಅಡ್ವಾನ್ಸ್ಡ್ ಒದಗಿಸುವಿಕೆ ರೂಪಕಗಳು

### ಬಹು-ಪ್ರಾಂತ್ಯ ನಿಯೋಜನೆ
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

### ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಸ್ಟಿಂಗ್
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

## 🧪 ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪೂರ್ವವೀಕ್ಷಣೆ ಮತ್ತು ಪರಿಶೀಲನೆ (ಹೊಸದು)

### ನಿಯೋಜನೆಯ ಮೊದಲು ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬದಲಾವಣೆಗಳ ಪೂರ್ವವೀಕ್ಷಣೆ

`azd provision --preview` ಫೀಚರ್ ನಿಮಗೆ ಸಂಪನ್ಮೂಲಗಳನ್ನು ವಾಸ್ತವವಾಗಿ ನಿಯೋಜಿಸುವ ಮೊದಲು ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒದಗಿಸುವಿಕೆಯನ್ನು **ಅನუკರಿಸಬಹುದು**. ಇದು `terraform plan` ಅಥವಾ `bicep what-if` ಸಂಗತಿಗೆ ಸರಿ, ನಿಮ್ಮ Azure ವಾತಾವರಣದಲ್ಲಿ ಯಾವ ಬದಲಾವಣೆಗಳು ನಡೆಯಬಹುದು ಎಂಬುದರ **ಡ್ರೈ-ರನ್ ದೃಶ್ಯ** ಒದಗಿಸುತ್ತದೆ.

#### 🛠️ ಇದು ಏನು ಮಾಡುತ್ತದೆ
- ನಿಮ್ಮ IaC ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸುತ್ತದೆ (Bicep ಅಥವಾ Terraform)
- ಸಂಪನ್ಮೂಲ ಬದಲಾವಣೆಗಳ ಪೂರ್ವವೀಕ್ಷಣೆಯನ್ನು ತೋರಿಸುತ್ತದೆ: ಸೇರ್ಪಡೆ, ಅಳಿಕೆ, ಅಪ್ಡೇಟ್‌ಗಳು
- ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸುವುದು ಇಲ್ಲ — ಇದು ಓದುವ ಮಾತ್ರವೂ ಮತ್ತು ಸುರಕ್ಷಿತವಾಗಿ ಚಾಲನೆಗೊಳ್ಳುತ್ತದೆ

#### ಉಪಯೋಗದ ಸಂದರ್ಭಗಳು
```bash
# ನಿಯೋಜನೆಯ ಮೊದಲು ಮೂಲಸೌಕರ್ಯದ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವಾವಲೋಕನ ಮಾಡಿ
azd provision --preview

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರದ ಪೂರ್ವಾವಲೋಕನ
azd provision --preview -e production
```

ಈ ಆಜ್ಞೆಗಳು ನಿಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತವೆ:
- ಸಂಪನ್ಮೂಲಗಳನ್ನು ನಿಯೋಜಿಸುವ ಮೊದಲು ಬದಲಾವಣೆಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಲು
- ಅಭಿವೃದ್ಧಿ ಚಕ್ರದಲ್ಲಿ ಆರಂಭಿಕದೋಷಗಳನ್ನು ಹಿಡಿಯಲು
- ತಂಡದ ಪರಿಸರಗಳಲ್ಲಿ ಸುರಕ್ಷಿತವಾಗಿ ಸಹಕಾರ ಮಾಡಲು
- ಯಾವುದೇ ಅಚ್ಚರಿಗಳಿಲ್ಲದೆ ಕನಿಷ್ಟ-ಅಧಿಕಾರ ನಿಯೋಜನೆಗಳನ್ನು ಖಚಿತಪಡಿಸಲು

ಇದು ವಿಶೇಷವಾಗಿ ಉಪಯುಕ್ತವಾಗುತ್ತದೆ ಎಂದರೆ:
- ಸಂಕೀರ್ಣ ಮಲ್ಟಿ-ಸೇವಾ ಪರಿಸರಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡುವಾಗ
- ಉತ್ಪಾದನಾ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್‌ನಲ್ಲಿ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡುವಾಗ
- PR ಅನುಮೋದನೆಯ ಮೊದಲು ಟೆಂಪ್ಲೇಟ್ ತಿದ್ದುಪಡುವನ್ನು ಪರಿಶೀಲಿಸುವಾಗ
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ರೂಪಕಗಳನ್ನು ಹೊಸ ತಂಡದ ಸದಸ್ಯರಿಗೆ ತರಬೇತಿಗಾಗಿ

### ಪೂರ್ವವೀಕ್ಷಣೆಯ ಉದಾಹರಣೆ ಔಟ್‌ಪುಟ್
ತಕ್ಷಣದ ಪೂರ್ವವೀಕ್ಷಣೆ ಔಟ್‌ಪುಟ್ ಪೂರೈಕೆದಾರ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆಗಾಗಿ ಬದಲಾಗುತ್ತದೆ, ಆದರೆ ಫಲಿತಾಂಶವು ಯಾವುದೆನಾದರೂ ಅನ್ವಯಿಸುವ ಮೊದಲು ಧ್ವನಿವಿಶದವಾಗಿ ನೀಡಬೇಕಾಗಿದೆ.

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

## �🔄 ಸಂಪನ್ಮೂಲ ಅಪ್ಡೇಟ್‌ಗಳು ಮತ್ತು ಮಿಗ್ರೇಶನ್‌ಗಳು

### ಸುರಕ್ಷಿತ ಸಂಪನ್ಮೂಲ ಅಪ್ಡೇಟ್‌ಗಳು
```bash
# ಮೊದಲಾಗಿ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವವೀಕ್ಷಿಸಿ (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
azd provision --preview

# ಪೂರ್ವವೀಕ್ಷಣೆಯ ದೃಢೀಕರಣದ ನಂತರ ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸಿ
azd provision --confirm-with-no-prompt

# ರೋಲ್ಬ್ಯಾಕ್‌ಗಾಗಿ, Git ಅನ್ನು ಬಳಸಿ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಹಿಂದಿರುಗಿಸಿ:
git revert HEAD  # ಕೊನೆಯ ಮೂಲಸೌಕರ್ಯ ಕಮಿಟ್ ಅನ್ನು ಹಿಂದಿರುಗಿಸಿ
azd provision    # ಹಿಂದಿನ ಮೂಲಸೌಕರ್ಯ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
```

### ಡೇಟಾಬೇಸ್ ಮಿಗ್ರೇಶನ್ಸ್
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

## 🎯 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಸಂಪನ್ಮೂಲ నಾಮಕರಣ ನಿಯಮಗಳು
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ಟ್ಯಾಗಿಂಗ್ ತಂತ್ರರೀತಿ
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

### 3. ಪ್ಯಾರಾಮೀಟರ್ ಮಾನ್ಯತೆ
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

### 4. ಔಟ್‌ಪುಟ್ ಸಂಘಟನೆ
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

- [ ಪೂರ್ವ-ನಿಯೋಜನೆ ಯೋಜನೆ ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
- [ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ](../chapter-07-troubleshooting/common-issues.md) - ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಸಮಸ್ಯೆಗಳನ್ನು ತಿದ್ದಿ
- [ ಡಿಬಗ್ಗಿಂಗ್ ಗೈಡ್ ](../chapter-07-troubleshooting/debugging.md) - ಒದಗಿಸುವಿಕೆಯ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಿ
- [ SKU ಆಯ್ಕೆ ](../chapter-06-pre-deployment/sku-selection.md) - ಸೂಕ್ತ ಸೇವಾ ತಂತ್ರಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಲು**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **ಮುಂದಿನ ಪಾಲು**: [ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
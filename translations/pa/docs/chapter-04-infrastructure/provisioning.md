# AZD ਨਾਲ Azure ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਚੈਪਟਰ**: ਚੈਪਟਰ 4 - ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਐਜ਼ ਕੋਡ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ
- **⬅️ ਪਿਛਲਾ**: [Deployment Guide](deployment-guide.md)
- **➡️ ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 5: ਬਹੁ-ਏਜੰਟ AI ਹੱਲ](../../examples/retail-scenario.md)
- **🔧 ਸੰਬੰਧਿਤ**: [ਚੈਪਟਰ 6: ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਧਤਾ](../chapter-06-pre-deployment/capacity-planning.md)

## ਪਰਚਿਆ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਤੇ ਪ੍ਰਬੰਧਨ ਬਾਰੇ ਸਭ ਕੁਝ ਕਵਰ ਕਰਦੀ ਹੈ। Bicep, ARM ਟੈਮਪਲੇਟਸ, Terraform, ਅਤੇ Pulumi ਵਰਤਕੇ ਬੁਨਿਆਦੀ ਸੰਸਾਧਨ ਬਣਾਉਣ ਤੋਂ ਲੈ ਕੇ ਐਂਟਰਪ੍ਰਾਈਜ਼-ਗ੍ਰੇਡ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਆਰਕੀਟੈਕਚਰ ਤੱਕ Infrastructure as Code (IaC) ਪੈਟਰਨ ਲਾਗੂ ਕਰਨਾ ਸਿੱਖੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- Infrastructure as Code ਸਿਧਾਂਤਾਂ ਅਤੇ Azure ਸੰਸਾਧਨ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ 'ਚ ਮਹਿਰਤ ਹਾਸਲ ਕਰੋਗੇ
- Azure Developer CLI ਦੁਆਰਾ ਸਮਰਥਿਤ ਕਈ IaC ਪ੍ਰੋਵਾਇਡਰਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰਾਂ ਲਈ Bicep ਟੈਮਪਲੇਟ ਡਿਜ਼ਾਇਨ ਅਤੇ ਲਾਗੂ ਕਰਨਾ ਸਿੱਖੋਗੇ
- ਰਿਸੋਰਸ ਪੈਰਾਮੀਟਰ, ਵੇਰੀਏਬਲ ਅਤੇ ਪਰਿਵੇਸ਼-ਵਿਸ਼ੇਸ਼ ਸੈਟਿੰਗਾਂ ਕਨਫਿਗਰ ਕਰਨਾ ਸਿੱਖੋਗੇ
- ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸਮੇਤ ਉਦੋਂਤ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋਗੇ
- ਰਿਸੋਰਸ ਲਾਈਫਸਾਈਕਲ, ਅੱਪਡੇਟ ਅਤੇ ਡੀਪੈਂਡੈਂਸੀ ਰਿਜ਼ੋਲੂਸ਼ਨ ਪਰਬੰਧਿਤ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- Bicep ਅਤੇ ARM ਟੈਮਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਡਿਜ਼ਾਇਨ ਅਤੇ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨ ਲਈ
- ਢਾਂਚागत ਰਿਸੋਰਸ ਡੀਪੈਂਡੈਨਸੀ ਨਾਲ ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ ਕਨਫਿਗਰ ਕਰਨ ਲਈ
- ਕਈ ਵਾਤਾਵਰਣਾਂ ਅਤੇ ਸੰਰਚਨਾਵਾਂ ਲਈ ਪੈਰਾਮੀਟਰਾਈਜ਼ਡ ਟੈਮਪਲੇਟ ਲਾਗੂ ਕਰਨ ਲਈ
- ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਦਾ ਟ੍ਰਬਲਸ਼ੂਟ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ ਦਾ ਸਮਾਧਾਨ ਕਰਨ ਲਈ
- ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਡਿਜ਼ਾਇਨ 'ਤੇ Azure Well-Architected Framework ਸਿਧਾਂਤ ਲਾਗੂ ਕਰਨ ਲਈ
- ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਅਪਡੇਟਸ ਅਤੇ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਵਰਜ਼ਨਿੰਗ ਰਣਨੀਤੀਆਂ ਨੂੰ ਪ੍ਰਬੰਧਤ ਕਰਨ ਲਈ

## ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦਾ ਓਵਰਵਿਊ

Azure Developer CLI ਕਈ Infrastructure as Code (IaC) ਪ੍ਰੋਵਾਇਡਰਾਂ ਨੂੰ ਸਹਾਇਤਾ ਦਿੰਦਾ ਹੈ:
- **Bicep** (ਸਿਫਾਰਸ਼ੀ) - Azure ਦੀ ਡੋਮੇਨ-ਨਿਰਧਾਰਤ ਭਾਸ਼ਾ
- **ARM Templates** - JSON-ਅਧਾਰਿਤ Azure Resource Manager ਟੈਮਪਲੇਟਸ
- **Terraform** - ਮਲਟੀ-ਕਲਾਉਡ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੂਲ
- **Pulumi** - ਪ੍ਰੋਗ੍ਰਾਮਿੰਗ ਭਾਸ਼ਾਵਾਂ ਨਾਲ ਆਧੁਨਿਕ Infrastructure as Code

## Azure ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਮਝਣਾ

### ਰਿਸੋਰਸ ਹਾਇਰਾਰਕੀ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਆਮ Azure ਸਰਵਿਸਜ਼
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੈਮਪਲੇਟਸ

### ਬੇਸਿਕ Bicep ਟੈਮਪਲੇਟ ਸਟ੍ਰਕਚਰ
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

### ਅਡਵਾਂਸ Bicep ਪੈਟਰਨ

#### ਮੋਡੀਊਲਰ ਇੰਫਰਾਸਟ੍ਰਕਚਰ
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

#### ਸ਼ਰਤ-ਆਧਾਰਿਤ ਰਿਸੋਰਸ ਬਣਾਉਣਾ
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

## 🌐 azd ਨਾਲ Terraform ਦੀ ਵਰਤੋਂ

Bicep azd ਦਾ ਡਿਫਾਲਟ ਹੈ, ਪਰ azd **Terraform** ਨੂੰ ਵੀ ਸਪੋਰਟ ਕਰਦਾ ਹੈ—ਜਦੋਂ ਤੁਹਾਡੀ ਟੀਮ ਪਹਿਲਾਂ ਹੀ ਇਸਤੇਮਾਲ ਕਰਦੀ ਹੋਵੇ ਜਾਂ ਤੁਸੀਂ ਮਲਟੀ-ਕਲਾਉਡ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰਬੰਧ ਕਰਦੇ ਹੋ। azd ਵਰਕਫਲੋ (`azd up`, `azd provision`, `azd down`) ਇਕੋ ਜਿਹਾ ਰਹਿੰਦਾ ਹੈ; ਸਿਰਫ਼ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਭਾਸ਼ਾ ਅਤੇ ਫੋਲਡਰ ਲੇਆਉਟ ਬਦਲਦਾ ਹੈ।

### azd ਨੂੰ Terraform ਵਰਤਣ ਲਈ ਦੱਸੋ

azure.yaml ਵਿੱਚ ਇੱਕ `infra` ਸੈਕਸ਼ਨ ਸ਼ਾਮਲ ਕਰੋ ਜੋ Terraform ਪ੍ਰੋਵਾਇਡਰ ਵੱਲ ਇਸ਼ਾਰਾ ਕਰਦਾ ਹੈ:

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

### Terraform ਫੋਲਡਰ ਲੇਆਉਟ

Terraform ਪ੍ਰੋਵਾਇਡਰ ਦੇ ਨਾਲ, ਤੁਹਾਡਾ `infra/` ਫੋਲਡਰ Bicep ਦੀ ਥਾਂ `.tf` ਫਾਇਲਾਂ ਵਰਤਦਾ ਹੈ:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ਇੱਕ ਘੱਟੋ-ਘੱਟ `main.tf`

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

### azd ਤੁਹਾਡੇ Terraform ਆਉਟਪੁਟਸ ਨਾਲ ਕਿਵੇਂ ਜੁੜਦਾ ਹੈ

azd Terraform **outputs** ਨੂੰ ਪੜ੍ਹਦਾ ਹੈ ਤਾਂ ਜੋ ਇਹ ਤੁਹਾਡੇ ਐਂਡਪੌਇੰਟਸ ਬਾਰੇ ਜਾਣ ਸਕੇ ਅਤੇ ਵਾਤਾਵਰਣ ਮੁੱਲਾਂ ਨੂੰ ਤੁਹਾਡੇ ਐਪ ਵਿੱਚ ਵਾਪਸ ਵਾਇਰ ਕਰ ਸਕੇ। ਆਉਟਪੁਟ ਨਾਂ ਮਹੱਤਵਪੂਰਨ ਹਨ—azd ਕੁਝ ਨਿਰਧਾਰਿਤ ਨਾਂ ਲੱਭਦਾ ਹੈ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **ਮਹੱਤਵਪੂਰਣ:** azd ਰਿਸੋਰਸਾਂ ਨੂੰ ਹਰ ਵਾਤਾਵਰਣ ਲਈ ਟਰੈਕ ਕਰਨ ਲਈ `azd-env-name` ਟੈਗ ਅਤੇ `AZURE_*` ਆਉਟਪੁਟਸ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ। ਹਮੇਸ਼ਾ ਆਪਣੇ ਰਿਸੋਰਸ ਗਰੁੱਪ ਨੂੰ `"azd-env-name" = var.environment_name` ਨਾਲ ਟੈਗ ਕਰੋ ਤਾਂ ਜੋ `azd down` ਸਭ ਕੁਝ ਲੱਭ ਕੇ ਹਟਾ ਸਕੇ।

### Terraform ਨਾਲ ਡਿਪਲੋਇ

ਕਮਾਂਡਾਂ ਬਿਲਕੁਲ Bicep ਵਾਲੀਆਂ ਵਾਂਗ ਨੇ:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ਅੰਦਰੋਂ 'terraform plan' ਚਲਾਉਂਦਾ ਹੈ
azd up                    # ਤਿਆਰ ਕਰਨਾ + ਤੈਨਾਤ
azd down --force          # Terraform ਦੁਆਰਾ ਪ੍ਰਬੰਧਤ ਸਰੋਤਾਂ ਨੂੰ ਨਸ਼ਟ ਕਰਦਾ ਹੈ
```

> **ਪੂਰਵ-ਸ਼ਰਤ:** Terraform انسਟਾਲ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ ਅਤੇ ਤੁਹਾਡੇ `PATH` 'ਤੇ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ। azd Terraform *workflow* ਨੂੰ ਮੈਨੇਜ ਕਰਦਾ ਹੈ ਪਰ Terraform ਤੁਹਾਡੇ ਲਈ انسਟਾਲ ਨਹੀਂ ਕਰਦਾ। ਸਟੇਟ ਲਈ, azd ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਲੋਕਲ ਸਟੇਟ ਵਰਤਦਾ ਹੈ; ਟੀਮਾਂ ਲਈ, ਇੱਕ ਰਿਮੋਟ ਬੈਕਏਂਡ (ਉਦਾਹਰਣ ਲਈ, ਇੱਕ Azure Storage ਬੈਕਏਂਡ) `provider.tf` ਵਿੱਚ ਕਨਫਿਗਰ ਕਰੋ।

ਪੂਰਨ, ਚਲਦੇ-ਫਿਰਦੇ Terraform-ਅਧਾਰਿਤ ਸਟਾਰਟਰ ਵੇਖਣ ਲਈ, [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ਨੂੰ ਬ੍ਰਾਉਜ਼ ਕਰੋ ਅਤੇ Terraform ਲਈ ਫਿਲਟਰ ਕਰੋ, ਜਾਂ ਅਧਿਕਾਰਿਕ [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ਵੇਖੋ।

## 🧩 azd ਨਾਲ Pulumi ਦੀ ਵਰਤੋਂ

ਜੇ ਤੁਹਾਡੀ ਟੀਮ DSL ਦੀ ਥਾਂ ਇੱਕ ਜਨਰਲ-ਪਰਪਜ਼ ਭਾਸ਼ਾ (TypeScript, Python, Go, ਜਾਂ C#) ਵਿੱਚ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਲਿਖਦੀ ਹੈ, ਤਾਂ azd **Pulumi** ਨੂੰ ਵੀ ਸਹਾਇਤਾ ਦਿੰਦਾ ਹੈ। Terraform ਵਾਂਗ, `azd up` / `azd provision` / `azd down` ਵਰਕਫਲੋ ਅਣਬਦਲ ਰਹਿੰਦਾ ਹੈ—ਸਿਰਫ਼ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੂਲਿੰਗ ਅਤੇ ਫੋਲਡਰ ਲੇਆਊਟ ਵੱਖਰੇ ਹੁੰਦੇ ਹਨ।

### azd ਨੂੰ Pulumi ਵਰਤਣ ਲਈ ਦੱਸੋ

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

### Pulumi ਫੋਲਡਰ ਲੇਆਉਟ

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ਇੱਕ ਘੱਟੋ-ਘੱਟ `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// ਹਰ ਰਿਸੋਰਸ ਨੂੰ ਟੈਗ ਕਰੋ ਤਾਂ ਜੋ azd ਉਹਨਾਂ ਨੂੰ ਟ੍ਰੈਕ ਅਤੇ ਸਾਫ਼ ਕਰ ਸਕੇ
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd ਇਹਨਾਂ ਆਉਟਪੁੱਟਸ ਨੂੰ ਵਾਪਸ ਤੁਹਾਡੇ ਵਾਤਾਵਰਣ ਵਿੱਚ ਪੜ੍ਹਦਾ ਹੈ
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### ਸਟੈਕਜ਼ azd ਵਾਤਾਵਰਣਾਂ ਨਾਲ ਮੇਪ ਹੁੰਦੇ ਹਨ

Pulumi ਡਿਪਲੋਇਮੈਂਟਸ ਨੂੰ **ਸਟੈਕਸ** ਵਿੱਚ ਸੰਗਠਿਤ ਕਰਦਾ ਹੈ, ਅਤੇ azd ਹਰ azd ਵਾਤਾਵਰਣ ਨੂੰ ਉਸੇ ਨਾਂ ਵਾਲੀ Pulumi ਸਟੈਕ ਨਾਲ ਮੇਪ ਕਰਦਾ ਹੈ। ਜਦੋਂ ਤੁਸੀਂ `azd env new staging` ਚਲਾਉਂਦੇ ਹੋ, azd `staging` Pulumi ਸਟੈਕ ਚੁਣਦਾ (ਜਾਂ ਬਣਾਉਂਦਾ) ਹੈ। ਉਹੀ `azd-env-name` ਟੈਗਿੰਗ ਅਤੇ `AZURE_*` ਆਉਟਪੁਟ ਨਿਯਮ ਲਾਗੂ ਹੁੰਦੇ ਹਨ, ਤਾਂ ਜੋ `azd down` ਸਭ ਕੁਝ ਲੱਭ ਕੇ ਹਟਾ ਸਕੇ।

### Pulumi ਨਾਲ ਡਿਪਲੋਇ

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ਹੇਠਾਂ 'pulumi preview' ਚਲਾਉਂਦਾ ਹੈ
azd up                    # ਸੰਸਾਧਨ ਤਿਆਰ ਕਰਨਾ + ਤੈਨਾਤ ਕਰਨਾ
azd down --force          # 'pulumi destroy' ਚਲਾਉਂਦਾ ਹੈ
```

> **ਪੂਰਵ-ਸ਼ਰਤ:** Pulumi انسਟਾਲ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ ਅਤੇ ਤੁਹਾਡੇ `PATH` 'ਤੇ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ, ਅਤੇ ਤੁਹਾਨੂੰ ਇੱਕ ਸਟੇਟ ਬੈਕਏਂਡ ਦੀ ਲੋੜ ਹੋਏਗੀ (Pulumi Cloud ਜਾਂ ਸਵੈ-ਪ੍ਰਬੰਧਿਤ ਬੈਕਏਂਡ ਜਿਵੇਂ Azure Blob Storage)। azd Pulumi *workflow* ਨੂੰ ਮੈਨੇਜ ਕਰਦਾ ਹੈ, انسਟਾਲ ਨਹੀਂ। ਅਧਿਕਾਰਿਕ [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) ਵੇਖੋ।

## 🎯 ਆਪਣੀ ਸਰਵਿਸ ਲਈ ਹੋਸਟ ਚੁਣਨਾ

`host` ਫੀਲਡ `azure.yaml` ਵਿੱਚ ਫੈਸਲਾ ਕਰਦੀ ਹੈ ਕਿ ਤੁਹਾਡਾ ਕੋਡ ਕਿੱਥੇ ਚੱਲੇਗਾ। azd ਕਈ ਹੋਸਟ ਸਹਾਇਤਾ ਕਰਦਾ ਹੈ—ਸਹੀ ਚੋਣ ਭਾਸ਼ਾ ਤੋਂ ਵੀ ਜ਼ਿਆਦਾ ਮਹੱਤਵਪੂਰਨ ਹੋ ਸਕਦੀ ਹੈ। ਇੱਥੇ ਸ਼ੁਰੂਆਤੀ ਲਈ ਇੱਕ ਸੌਖਾ ਤੁਲਨਾਤਮਕ ਵੇਰਵਾ ਹੈ:

| `host` value | ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ | ਕਿਉਂ |
|--------------|------------------|------|
| `appservice` | ਪਾਰੰਪਰਿਕ ਵੈੱਬ ਐਪਸ ਅਤੇ APIs | ਸਭ ਤੋਂ ਆਸਾਨ PaaS; ਕੰਟੇਨਰ ਦੀ ਲੋੜ ਨਹੀਂ |
| `staticwebapp` | ਫਰੰਟ-ਐਂਡ SPAs (React, Vue, Angular) | ਗਲੋਬਲ CDN + ਮੁਫ਼ਤ SSL, ਬਿਲਟ-ਇਨ API ਸਹਾਇਤਾ |
| `function` | ਇਵੈਂਟ-ਚਲਿਤ ਅਤੇ ਸਰਵਰਲੈਸ ਵਰਕਲੋਡ | ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ, ਪ੍ਰਤੀ-ਇਕਜ਼ਿਕਿਊਸ਼ਨ ਭੁਗਤਾਨ |
| `containerapp` | ਕੰਟੇਨਰਾਇਜ਼ਡ ਮਾਇਕਰੋਸਰਵਿਸਜ਼ | ਸਰਵਰਲੈਸ ਕੰਟੇਨਰ, ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ, ਬਿਲਟ-ਇਨ ਇੰਗ੍ਰੈੱਸ |
| `aks` | ਜਟਿਲ ਔਰਕੇਸਟ੍ਰੇਸ਼ਨ ਲੋੜਾਂ | ਜਦੋਂ ਤੁਹਾਨੂੰ ਵਾਸਤਵ ਵਿੱਚ Kubernetes ਦੀ ਪੂਰੀ ਨਿਯੰਤਰਣ ਚਾਹੀਦੀ ਹੋਵੇ |
| `springapp` | Java Spring Boot ਐਪਸ | Spring ਲਈ ਟਿਊਨ ਕੀਤਾ ਹੋਇਆ ਮੈਨੇਜਡ Azure Spring Apps ਰਨਟਾਈਮ |

### AKS ਲਈ ਕਦੋਂ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ

**Azure Kubernetes Service (`host: aks`)** ਤੁਹਾਨੂੰ Kubernetes ਦੀ ਪੂਰੀ ਤਾਕਤ ਦਿੰਦਾ ਹੈ—ਕਸਟਮ ਕੰਟ੍ਰੋਲਰ, ਸਰਵਿਸ ਮੈਸ਼, ਜਟਿਲ ਨੈੱਟਵਰਕਿੰਗ, ਅਤੇ ਬਰੀਕ-ਸਟਰੀਂਗ ਸੈਡੀਊਲਿੰਗ। ਇਹ ਤਾਕਤ ਓਪਰੇਸ਼ਨਲ ਓવરਹੈੱਡ ਨਾਲ ਆਉਂਦੀ ਹੈ: ਤੁਸੀਂ ਨੋਡ ਪੁਲਾਂ, ਅਪਗਰੇਡ, ਅਤੇ ਕਲੱਸਟਰ ਨੈੱਟਵਰਕਿੰਗ ਦੀ ਦੇਖਭਾਲ ਕਰਦੇ ਹੋ।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ਜੇ ਹੋ ਸਕੇ ਤਾਂ ਸਧਾਰਨ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ।** ਬਹੁਤ ਸਾਰੀਆਂ ਮਾਈਕਰੋਸਰਵਿਸਜ਼ ਲਈ, **Container Apps** ਤੁਹਾਨੂੰ ਕੰਟੇਨਰ, ਆਟੋ-ਸਕੇਲਿੰਗ, ਅਤੇ ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ ਮੁਹੱਈਆ ਕਰਵਾਉਂਦਾ ਹੈ ਬਿਨਾਂ ਕਲੱਸਟਰ ਨੂੰ ਮੈਨੇਜ ਕੀਤੇ। ਕੇਵਲ ਉਹਦੇ ਲਈ AKS ਚੁਣੋ ਜਦੋਂ ਤੁਹਾਨੂੰ Kubernetes-ਵਿਸ਼ੇਸ਼ ਫੀਚਰਾਂ ਦੀ ਲੋੜ ਹੋਵੇ।

### Azure Spring Apps ਕਦੋਂ ਵਰਤਣੀ ਹੈ

**Azure Spring Apps (`host: springapp`)** ਇੱਕ ਮੈਨੇਜਡ ਰਨਟਾਈਮ ਹੈ ਜੋ Spring Boot ਲਈ ਤਿਆਰ ਕੀਤਾ ਗਿਆ ਹੈ। ਇਹ ਸਰਵਿਸ ਡਿਸਕਵਰੀ, ਕਨਫਿਗ ਸਰਵਰ, ਅਤੇ ਬਲੂ-ਗਰੀਨ ਡਿਪਲੋਇਮੈਂਟ ਸੰਭਾਲਦਾ ਹੈ ਤਾਂ ਜੋ Java ਟੀਮਾਂ ਨੂੰ ਆਪਣਾ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਚਲਾਉਣ ਦੀ ਲੋੜ ਨਾ ਪਏ।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> ਜਦੋਂ ਤੁਹਾਡੇ ਕੋਲ ਮੌਜੂਦਾ Spring Boot ਐਪਸ ਹੋਣ ਅਤੇ ਤੁਸੀਂ ਉਹਨਾਂ ਲਈ ਖਾਸ ਤੌਰ 'ਤੇ ਟਿਊਨਡ ਰਨਟਾਈਮ ਚਾਹੁੰਦੇ ਹੋ ਤਾਂ `springapp` ਵਰਤੋ। ਨਵੇਂ ਕੰਟੇਨਰਾਇਜ਼ਡ Java ਐਪਸ ਲਈ ਜੇ Spring-ਵਿਸ਼ੇਸ਼ ਲੋੜਾਂ ਨਹੀਂ ਹਨ ਤਾਂ `containerapp` ਆਮ ਤੌਰ 'ਤੇ ਸਧਾਰਨ ਚੋਣ ਹੁੰਦੀ ਹੈ।

## 🗃️ ਡੇਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

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

## 🔒 ਸੁਰੱਖਿਆ ਅਤੇ ਸਿਕ੍ਰੇਟ ਪ੍ਰਬੰਧਨ

### Key Vault ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

### Managed Identity ਕਨਫਿਗਰੇਸ਼ਨ
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

## 🌍 ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਕਨੈਕਟਿਵਿਟੀ

### ਵਰਚੁਅਲ ਨੈੱਟਵਰਕ ਕਨਫਿਗਰੇਸ਼ਨ
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

### SSL ਨਾਲ Application Gateway
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

## 📊 ਮਾਨੀਟਰਨਗ ਅਤੇ ਨਿਗਰਾਨੀ

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

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਅਤੇ ਅਲਰਟਸ
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

## 🔧 ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਕਨਫਿਗਰੇਸ਼ਨ

### ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣਾਂ ਲਈ ਪੈਰਾਮੀਟਰ ਫਾਇਲਾਂ
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

### ਸ਼ਰਤ-ਆਧਾਰਿਤ ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
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

## 🚀 ਅਡਵਾਂਸਡ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਪੈਟਰਨ

### ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੋਇਮੈਂਟ
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

### ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੈਸਟਿੰਗ
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

## 🧪 ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰਿਵਿਊ ਅਤੇ ਵੈਧਤਾ (ਨਵਾਂ)

### ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰਿਵਿਊ

`azd provision --preview` ਫੀਚਰ ਤੁਹਾਨੂੰ ਰੀਅਲ ਰਿਸੋਰਸ ਬਣਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਦਾ **ਅਨੁਕਰਨ** ਕਰਨ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ। ਇਹ `terraform plan` ਜਾਂ `bicep what-if` ਦੇ ਰੂਹ ਨਾਲ ਮਿਲਦਾ-ਜुलਦਾ ਹੈ, ਅਤੇ ਤੁਹਾਨੂੰ ਇਹ ਵੇਖਣ ਦਿੰਦਾ ਹੈ ਕਿ ਤੁਹਾਡੇ Azure ਵਾਤਾਵਰਣ ਵਿੱਚ کون سے ਬਦਲਾਵ ਹੋ ਸਕਦੇ ਹਨ — ਇੱਕ **ਡ੍ਰਾਈ-ਰਨ ਦ੍ਰਿਸ਼**।

#### 🛠️ ਇਹ ਕੀ ਕਰਦਾ ਹੈ
- **ਤੁਹਾਡੇ IaC ਟੈਮਪਲੇਟਸ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ** (Bicep ਜਾਂ Terraform)
- **ਰਿਸੋਰਸ ਬਦਲਾਵਾਂ ਦਾ ਪ੍ਰਿਵਿਊ ਦਿਖਾਉਂਦਾ ਹੈ**: ਜੋੜ, ਹਟਾਉਣਾ, ਅਪਡੇਟ
- **ਬਦਲਾਵ ਲਾਗੂ ਨਹੀਂ ਕਰਦਾ** — ਇਹ ਰੀਡ-ਓਨਲੀ ਹੈ ਅਤੇ ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ ਹੈ

#### ਵਰਤੋਂ ਦੇ ਕੇਸ
```bash
# ਤਾਇਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚੇ ਦੇ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਸਮੀਖਿਆ
azd provision --preview

# ਨਿਰਧਾਰਿਤ ਵਾਤਾਵਰਣ ਲਈ ਪੂਰਵ-ਸਮੀਖਿਆ
azd provision --preview -e production
```

ਇਹ ਕਮਾਂਡ ਤੁਹਾਡੀ ਮਦਦ ਕਰਦੀ ਹੈ:
- **ਰਿਸੋਰਸ ਬਦਲਾਵਾਂ ਦੀ ਵੈਰੀਫਿਕੇਸ਼ਨ** ਕਰਨ ਲਈ ਪਹਿਲਾਂੋਂ
- ਵਿਕਾਸ ਦੌਰਾਨ **ਗਲਤ ਕਨਫਿਗਰੇਸ਼ਨਾਂ ਨੂੰ ਜਲਦੀ ਪਕੜਨ** ਲਈ
- ਟੀਮ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ **ਸੁਰੱਖਿਅਤ ਸਹਯੋਗ** ਕਰਨ ਲਈ
- ਬਿਨਾਂ ਹੈਰਾਨੀ ਦੇ **ਘੱਟ-ਆਧਿਕਾਰ ਡਿਪਲੋਇਮੈਂਟਸ** ਯਕੀਨੀ ਬਣਾਉਣ ਲਈ

ਇਹ ਖਾਸ ਤੌਰ 'ਤੇ ਲਾਭਦਾਇਕ ਹੈ ਜਦ:
- ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ ਵਾਤਾਵਰਣਾਂ 'ਤੇ ਕੰਮ ਕਰ ਰਹੇ ਹੋ
- ਪ੍ਰੋਡਕਸ਼ਨ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਵਿੱਚ ਬਦਲਾਵ ਕਰ ਰਹੇ ਹੋ
- PR ਮਨਜ਼ੂਰੀ ਤੋਂ ਪਹਿਲਾਂ ਟੈਮਪਲੇਟ ਸੰਸ਼ੋਧਨਾਂ ਦੀ ਜਾਂਚ ਕਰ ਰਹੇ ਹੋ
- ਨਵੇਂ ਟੀਮ ਮੈਂਬਰਾਂ ਨੂੰ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪੈਟਰਨਾਂ 'ਤੇ ਸਿਖਾ ਰਹੇ ਹੋ

### ਉਦਾਹਰਨ ਪ੍ਰਿਵਿਊ ਆਉਟਪੁਟ
ਸਹੀ-ਸਹੀ ਪ੍ਰਿਵਿਊ ਆਉਟਪੁਟ ਪ੍ਰੋਵਾਇਡਰ ਅਤੇ ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ ਦੇ ਅਨੁਸਾਰ ਵੱਖਰਾ ਹੋ ਸਕਦਾ ਹੈ, ਪਰ ਨਤੀਜਾ ਸਪਸ਼ਟ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਸਤਾਵਿਤ ਬਦਲਾਵਾਂ ਦੀ ਪਛਾਣ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ ਜਦੋਂ ਕੁਝ ਵੀ ਲਾਗੂ ਨਹੀਂ ਕੀਤਾ ਗਿਆ।

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

## �🔄 ਰਿਸੋਰਸ ਅਪਡੇਟਸ ਅਤੇ ਮਾਈਗ੍ਰੇਸ਼ਨ

### ਸੁਰੱਖਿਅਤ ਰਿਸੋਰਸ ਅਪਡੇਟਸ
```bash
# ਸਭ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਜਾਂਚ ਕਰੋ (ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ)
azd provision --preview

# ਪੂਰਵ-ਜਾਂਚ ਦੀ ਪੁਸ਼ਟੀ ਹੋਣ ਤੋਂ ਬਾਅਦ ਬਦਲਾਵ ਲਾਗੂ ਕਰੋ
azd provision --confirm-with-no-prompt

# ਰੋਲਬੈਕ ਲਈ, ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਬਦਲਾਵਾਂ ਨੂੰ ਰਿਵਰਟ ਕਰਨ ਲਈ Git ਵਰਤੋ:
git revert HEAD  # ਆਖਰੀ ਇੰਫ੍ਰਾਸਟਰੱਖਚਰ ਕਮਿਟ ਨੂੰ ਰਿਵਰਟ ਕਰੋ
azd provision    # ਪਿਛਲੀ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਸਥਿਤੀ ਨੂੰ ਲਾਗੂ ਕਰੋ
```

### ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨਜ਼
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

## 🎯 ਬੈਸਟ ਪ੍ਰੈਕਟਿਸਿਜ਼

### 1. ਰਿਸੋਰਸ ਨੋਮੀੰਗ ਕੰਵੀਸ਼ਨਜ਼
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ਟੈਗਿੰਗ ਰਣਨੀਤੀ
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

### 3. ਪੈਰਾਮੀਟਰ ਵੈਲਿਡੇਸ਼ਨ
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

### 4. ਆਉਟਪੁਟ ਆਰਗਨਾਈਜ਼ੇਸ਼ਨ
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

## ਅਗਲੇ ਕਦਮ

- [ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਸੰਸਾਧਨਾਂ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../chapter-07-troubleshooting/common-issues.md) - ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਟ੍ਰਬਲਸ਼ੂਟ ਕਰੋ
- [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](../chapter-07-troubleshooting/debugging.md) - ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰੋ
- [SKU ਚੋਣ](../chapter-06-pre-deployment/sku-selection.md) - ਉਚਿਤ ਸਰਵਿਸ ਟੀਅਰ ਚੁਣੋ

## ਅਤਿਰੀਕਤ ਸਰੋਤ

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਲੈਸਨ**: [Deployment Guide](deployment-guide.md)
- **ਅਗਲਾ ਲੈਸਨ**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
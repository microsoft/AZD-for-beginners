# AZD ਨਾਲ Azure ਸਰੋਤ ਪ੍ਰਦਾਨਗੀ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਬਰਗੀਨਰਾਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 4 - ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ
- **⬅️ ਪਿਛਲਾ**: [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ ਏਆਈ ਸੌਲੂਸ਼ਨ](../../examples/retail-scenario.md)
- **🔧 ਸੰਬੰਧਿਤ**: [ਅਧਿਆਇ 6: ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ](../chapter-06-pre-deployment/capacity-planning.md)

## ਪਰਿਚਯ

ਇਹ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਸਰੋਤਾਂ ਦੀ ਪ੍ਰਦਾਨਗੀ ਅਤੇ ਪ੍ਰਬੰਧਨ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ ਜਿਸ ਵਿੱਚ ਇਸਦੇ ਬਿਲਟ-ਇਨ ਬਾਇਸਪ ਅਤੇ ਟੇਰਾਫਾਰਮ ਪ੍ਰਦਾਤਾ ਸ਼ਾਮਲ ਹਨ।

> `azd 1.37.2` ਦੇ ਮੁਕਾਬਲੇ ਸਮੀਖਿਅਤ (ਨਵੰਬਰ 2026)। ਜੇਕਰ ਵੱਖ-ਵੱਖ ਤੌਰ 'ਤੇ ਨਾ ਕਿਹਾ ਗਿਆ ਹੋਵੇ, ਤਾਂ ਬਾਇਸਪ, ਟੇਰਾਫਾਰਮ ਅਤੇ ਸਕ੍ਰਿਪਟ ਉਦਾਹਰਣਾਂ **ਦ੍ਰਿਸ਼ਟੀ ਗੋਤੀਆਂ** ਹਨ, ਪੂਰਾ ਟੈਂਪਲੇਟ ਨਹੀਂ। ਇਨ੍ਹਾਂ ਨੂੰ ਉਸ ਪਰਜੈਕਟ ਵਿੱਚ ਮਿਲਾਓ ਜੋ ਉਲੇਖਿਤ ਪੈਰਾਮੀਟਰ, ਮੋਡੀਊਲ, ਪਹਿਚਾਣ, ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਮੁਹੱਈਆ ਕਰਦਾ ਹੈ। ਇਸ ਸਮੀਖਿਆ ਵਿੱਚ Azure ਪ੍ਰਦਾਨਗੀ ਲਾਗੂ ਨਹੀਂ ਕੀਤੀ ਗਈ ਸੀ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ ਪ੍ਰਿੰਸੀਪਲ ਅਤੇ Azure ਸਰੋਤ ਪ੍ਰਦਾਨਗੀ ਵਿੱਚ ਨਿਪੁੰਨ ਹੋਵੋਗੇ
- Azure Developer CLI ਵੱਲੋਂ ਸਮਰਥਿਤ ਕਈ IaC ਪ੍ਰਦਾਤਾ ਨੂੰ ਸਮਝੋ
- ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰਾਂ ਲਈ ਬਾਇਸਪ ਟੈਂਪਲੇਟ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰੋ
- ਸਰੋਤ ਪੈਰਾਮੀਟਰ, ਵੈਰੀਏਬਲ ਅਤੇ ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਸੈਟਿੰਗਾਂ ਸੰਰਚਿਤ ਕਰੋ
- ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸਮੇਤ ਅਗੇਤਰ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- ਸਰੋਤ ਲਾਈਫਸਾਈਕਲ, ਅੱਪਡੇਟ ਅਤੇ ਡਿਪੈਂਡੈਂਸੀ ਸਮਾਧਾਨ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਸੰਪੂਰਨ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰਥ ਹੋਵੋਗੇ:
- ਬਾਇਸਪ ਅਤੇ ARM ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਨੂੰ ਡਿਜ਼ਾਈਨ ਅਤੇ ਪ੍ਰਦਾਨ ਕਰੋ
- ਸਹੀ ਸਰੋਤ ਅਧਾਰਿਤ ਜਟਿਲ ਮਲਟੀ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰਾਂ ਸੰਰਚਿਤ ਕਰੋ
- ਕਈ ਵਾਤਾਵਰਣ ਅਤੇ ਸੰਰਚਨਾਵਾਂ ਲਈ ਪੈਰਾਮੀਟਰਡ ਟੈਂਪਲੇਟ ਲਾਗੂ ਕਰੋ
- ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰਦਾਨਗੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੈਂਡਲ ਕਰੋ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਫੇਲੀਆਂ ਦੇ ਸਮਾਧਾਨ ਕਰੋ
- ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਡਿਜ਼ਾਈਨ ਵਿੱਚ Azure ਵੈਲ-ਆਰਕੀਟੈਕਟਿਡ ਫਰੇਮਵਰਕ ਪ੍ਰਿੰਸੀਪਲ ਲਾਗੂ ਕਰੋ
- ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਅੱਪਡੇਟਾਂ ਨੂੰ ਪ੍ਰਬੰਧਤ ਕਰੋ ਅਤੇ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਵਰਜਨਿੰਗ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ

## ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰਦਾਨਗੀ ਦਾ ਜਾਇਜ਼ਾ

Azure Developer CLI ਕਈ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ (IaC) ਪ੍ਰਦਾਤਾ ਨੂੰ ਸਮਰਥਿਤ ਕਰਦਾ ਹੈ:
- **ਬਾਇਸਪ** (ਸਿਫਾਰਸ਼ੀ) - Azure ਦੀ ਡੋਮੇਨ-ਨਿਰਧਾਰਿਤ ਭਾਸ਼ਾ
- **ARM ਟੈਂਪਲੇਟ** - ਬਾਇਸਪ ਨੂੰ ARM ਵਿੱਚ ਕੰਪਾਈਲ ਕੀਤਾ ਜਾਂਦਾ ਹੈ; ਕੁੱਚਾ ARM JSON ਵਿਕਲਪ ਨਹੀਂ ਹੈ `infra.provider` ਦਾ
- **Terraform** - ਮਲਟੀ-ਕਲਾਉਡ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਟੂਲ
- **ਵਿਸ਼ੇਸ਼ ਪ੍ਰਦਾਤਾ** - ਇੱਕ ਵੱਖਰੇ ਇੰਸਟਾਲ ਕੀਤੇ ਪ੍ਰਦਾਤਾ ਇਕਸਟੈਂਸ਼ਨ ਅਤੇ ਇਸ ਦੀ ਦਸਤਾਵੇਜ਼ਕਰਨ ਸਹਿਤ; ਕਦੇ ਵੀ ਕਿਸੇ ਪ੍ਰਦਾਤਾ ਸਤਰ ਨੂੰ ਸਮਰਥਿਤ ਮੰਨੋ ਨਾ ਕਰੋ

## Azure ਸਰੋਤਾਂ ਦੀ ਸਮਝ

### ਸਰੋਤ ਕ੍ਰਮਬੱਧਤਾ
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਆਮ Azure ਸੇਵਾਵਾਂ
- **ਕੰਪਿਊਟ**: ਐਪ ਸਰਵਿਸ, ਕੰਟੇਨਰ ਐਪ, ਫੰਕਸ਼ਨ, ਵਰਚੁਅਲ ਮਸ਼ੀਨਾਂ
- **ਸਟੋਰੇਜ**: ਸਟੋਰੇਜ ਖਾਤਾ, ਕੋਸਮੋਜ਼ DB, SQL ਡੇਟਾਬੇਸ, ਪੋਸਟਗਰੇSQL
- **ਨੈਟਵਰਕਿੰਗ**: ਵਰਚੁਅਲ ਨੈੱਟਵਰਕ, ਐਪਲੀਕੇਸ਼ਨ ਗੇਟਵੇ, CDN
- **ਸੁਰੱਖਿਆ**: ਕੀ ਵਾਲਟ, ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ, ਲੌਗ ਐਨਾਲਿਟਿਕਸ
- **AI/ML**: Azure AI ਸੇਵਾਵਾਂ, Azure OpenAI, Azure ਮਸ਼ੀਨ ਲਰਨਿੰਗ

## ਬਾਇਸਪ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਟੈਂਪਲੇਟ

### ਮੂਲ ਬਾਇਸਪ ਟੈਂਪਲੇਟ ਢਾਂਚਾ
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

ਪੂਰੇ azd ਪਰਜੈਕਟ ਲਈ, ਇਸ ਮੋਡੀਊਲ ਨੂੰ ਇੱਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਦਾਇਰਾ ਵਾਲੇ `infra/main.bicep` ਤੋਂ ਕਾਲ ਕਰੋ ਜੋ ਟੈਗਡ ਸਰੋਤ ਸਮੂਹ ਬਣਾਉਂਦਾ ਹੈ ਅਤੇ ਇਸ ਦਾ ਦਾਇਰਾ ਦਿੰਦਾ ਹੈ। `environmentName`/`location` ਨੂੰ `main.parameters.json` ਵਿੱਚ ਮਿਲਾਓ। `azd-service-name: web` ਟੈਗ ਸਰੋਤ ਨੂੰ `services.web` ਨਾਲ ਜੋੜਦਾ ਹੈ; ਮਨਮਾਨਾ ਆਉਟਪੁੱਟ ਨਾਮ ਸੇਵਾ ਖੋਜ ਨੂੰ ਸੰਰਚਿਤ ਨਹੀਂ ਕਰਦੇ।

### ਅਗੇਤਰ ਬਾਇਸਪ ਪੈਟਰਨ

#### ਮੋਡੀਊਲਰ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ
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

#### ਸ਼ਰਤੀ ਸਰੋਤ ਬਣਾਉਣਾ
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

## 🌐 azd ਨਾਲ ਟੇਰਾਫਾਰਮ ਦੀ ਵਰਤੋਂ

ਬਾਇਸਪ azd ਦਾ ਡਿਫਾਲਟ ਹੈ, ਪਰ azd **Terraform** ਨੂੰ ਵੀ ਸਹਿਯੋਗ ਦਿੰਦਾ ਹੈ—ਜੇ ਤੁਹਾਡੀ ਟੀਮ ਪਹਿਲਾਂ ਹੀ ਇਸ ਨੂੰ ਮਿਆਰੀਕ੍ਰਿਤ ਕਰਦੀ ਹੈ ਜਾਂ ਤੁਸੀਂ ਮਲਟੀ-ਕਲਾਉਡ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਦੇ ਹੋ ਤਾਂ। azd ਵਰਕਫਲੋ (`azd up`, `azd provision`, `azd down`) ਇੱਕੋ ਜਿਹਾ ਹੈ; ਸਿਰਫ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਭਾਸ਼ਾ ਅਤੇ ਫੋਲਡਰ ਲੇਆਉਟ ਨੂੰ ਬਦਲਦਾ ਹੈ।

### azd ਨੂੰ Terraform ਵਰਤਣ ਲਈ ਕਹੋ

Terraform ਪ੍ਰਦਾਤਾ ਵੱਲ ਸੰਦੇਸ਼ ਕਰਦਾ ਇੱਕ `infra` ਸੈਕਸ਼ਨ ਨੂੰ `azure.yaml` ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ:

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

Terraform ਪ੍ਰਦਾਤਾ ਨਾਲ, ਤੁਹਾਡਾ `infra/` ਫੋਲਡਰ ਬਾਇਸਪ ਦੀ ਬਜਾਏ `.tf` ਫਾਇਲਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ਇੱਕ `main.tf` ਟੁਕੜਾ

ਇਹ ਸਿਰਫ ਇੱਕ ਸਰੋਤ ਸਮੂਹ ਅਤੇ ਯੋਜਨਾ ਬਣਾਉਂਦਾ ਹੈ, ਕੋਈ ਡਿਪਲੌਇਮੈਂਟ ਲਾਇਕ ਸੇਵਾ ਨਹੀਂ। ਤੁਸੀਂ ਇਨਪੁੱਟ ਵੈਰੀਏਬਲਾਂ, ਇੱਕ ਮੇਲ ਖਾਂਦਾਂ `azurerm` ਪ੍ਰਦਾਤਾ, ਵੈੱਬ ਐਪ ਅਤੇ ਇਸ ਦੀ ਸੇਵਾ ਟੈਗ/ਸਰੋਤ-ਨਾਮ ਮੈਪਿੰਗ ਦਾ ਵੀ ਘੋਸ਼ਣਾ ਕਰਨੀ ਹੋਵੇਗੀ।

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

### azd ਤੁਹਾਡੇ Terraform ਆਉਟਪੁੱਟ ਨਾਲ ਕਿਵੇਂ ਜੁੜਦਾ ਹੈ

azd Terraform **ਆਉਟਪੁੱਟ** ਨੂੰ ਵਾਤਾਵਰਣ ਮੁੱਲਾਂ ਵਿੱਚ ਪੜ੍ਹਦਾ ਹੈ। ਇਹ ਟੁਕੜਾ ਮੰਨਦਾ ਹੈ ਕਿ ਤੁਸੀਂ `azurerm_linux_web_app.web` ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕੀਤਾ ਹੈ; ਫਿਰ ਵੀ ਸੇਵਾ ਖੋਜ ਲਈ ਇਕ ਮੇਲ ਖਾਂਦਾਂ ਸਰੋਤ ਨਾਂ ਜਾਂ `azd-service-name` ਟੈਗ ਦੀ ਲੋੜ ਹੈ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **ਮਹੱਤਵਪੂਰਨ:** azd ਸਰੋਤਾਂ ਦੀ ਟ੍ਰੈਕਿੰਗ ਲਈ `azd-env-name` ਟੈਗ ਅਤੇ `AZURE_*` ਆਉਟਪੁੱਟ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ। ਸਦਾ ਆਪਣੇ ਸਰੋਤ ਸਮੂਹ 'ਤੇ `"azd-env-name" = var.environment_name` ਟੈਗ ਲਗਾਓ ਤਾਂ ਜੋ `azd down` ਸਭ ਕੁਝ ਲੱਭ ਅਤੇ ਹਟਾ ਸਕੇ।

### Terraform ਨਾਲ ਡਿਪਲੌਇ ਕਰੋ

ਹੁਕਮ ਬਾਇਸਪ ਵਾਲੇ ਨਾਲ ਇੱਕੋ ਜਿਹੇ ਹਨ:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **ਪੂਰਵ ਸ਼ਰਤ:** Terraform ਤੁਹਾਡੇ `PATH` 'ਤੇ ਇੰਸਟਾਲ ਅਤੇ ਉਪਲਬਧ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ। azd Terraform *ਵਰਕਫ਼ਲੋ* ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਦਾ ਹੈ ਪਰ Terraform ਤੁਹਾਡੇ ਲਈ ਇੰਸਟਾਲ ਨਹੀਂ ਕਰਦਾ। ਸਥਿਤੀ ਲਈ, azd ਡਿਫਾਲਟ ਤੌਰ ਤੇ ਲੋਕਲ ਸਥਿਤੀ ਵਰਤਦਾ ਹੈ; ਟੀਮਾ ਲਈ, ਇਕ ਰਿਮੋਟ ਬੈਕਐਂਡ (ਜਿਵੇਂ ਕਿ Azure ਸਟੋਰੇਜ ਬੈਕਐਂਡ) ਨੂੰ `provider.tf` ਵਿੱਚ ਸੰਰਚਿਤ ਕਰੋ।

ਪੂਰੇ, ਚਲਾਉਣ ਯੋਗ Terraform ਆਧਾਰਿਤ ਸ਼ੁਰੂਆਤੀ ਪ੍ਰਾਜੈਕਟਾਂ ਲਈ, [Awesome AZD ਗੈਲਰੀ](https://azure.github.io/awesome-azd/) ਦੀ ਸਫ਼ਰ ਕਰੋ ਅਤੇ Terraform ਲਈ ਛਾਂਟੋ, ਜਾਂ ਅਧਿਕਾਰਿਕ [azd Terraform ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ਵੇਖੋ।

## 🧩 ਹੋਰ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਟੂਲ

Pulumi azd 1.37.2 ਦੇ ਬਿਲਟ-ਇਨ ਪ੍ਰਦਾਤਾ ਨਹੀਂ ਹੈ। ਸਿਰਫ `infra.provider: pulumi` ਸੈਟ ਕਰਨਾ ਕਾਰਗਰ ਏਕੀਕਰਨ ਸਥਾਪਿਤ ਨਹੀਂ ਕਰਦਾ, ਅਤੇ `azd env new` ਆਪਣੇ ਆਪ Pulumi ਸਟੈਕ ਨਹੀਂ ਬਣਾਉਂਦਾ/ਚੁਣਦਾ। ਜੇਕਰ ਤੁਸੀਂ ਕੋਈ ਹੋਰ IaC ਟੂਲ ਵਰਤਦੇ ਹੋ, ਤਾਂ ਇੱਕ ਪੜਤਾਲ ਪ੍ਰਦਾਤਾ ਇਕਸਟੈਂਸ਼ਨ ਦੀ ਦਸਤਾਵੇਜ਼ ਦਾ ਪਾਲਣ ਕਰੋ ਜਾਂ ਆਪਣੇ ਵਰਕਫਲੋ ਵਿੱਚ ਇਸ ਦੀ ਲਾਈਫਸਾਇਕਲ ਨੂੰ ਸਪਸ਼ਟ ਤੌਰ 'ਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰੋ। ਇਹ ਕੋਰਸ Pulumi ਪ੍ਰਦਾਤਾ ਪ੍ਰਦਾਨ ਜਾਂ ਜਾਂਚ ਨਹੀਂ ਕਰਦਾ।

## 🎯 ਆਪਣੀ ਸੇਵਾ ਲਈ ਹੋਸਟ ਚੁਣਨਾ

`host` ਫੀਲਡ `azure.yaml` ਵਿੱਚ ਨਿਰਧਾਰਤ ਕਰਦਾ ਹੈ ਕਿ ਤੁਹਾਡਾ ਕੋਡ ਕਿੱਥੇ ਚੱਲੇਗਾ। azd ਕਈ ਹੋਸਟਾਂ ਦਾ ਸਹਿਯੋਗ ਦਿੰਦਾ ਹੈ—ਸਹੀ ਚੋਣ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਭਾਸ਼ਾ ਨਾਲੋਂ ਜ਼ਿਆਦਾ ਮਹੱਤਵਪੂਰਨ ਹੈ। ਇੱਥੇ ਇੱਕ शुरुआਤੀ ਲਈ ਸੁਹਾਵਣਾ ਤੁਲਨਾਤਮਕ ਵਿਸ਼ਲੇਸ਼ਣ ਹੈ:

| `host` ਮੁੱਲ | ਸਭ ਤੋਂ ਵਧੀਆ | ਕਿਉਂ |
|--------------|----------|-----|
| `appservice` | ਰਵਾਇਤੀ ਵੈੱਬ ਐਪ ਅਤੇ API | ਸਭ ਤੋਂ ਸਧਾਰਣ PaaS; ਕੋਈ ਕੰਟੇਨਰ ਲੋੜੀਂਦੇ ਨਹੀਂ ਹਨ |
| `staticwebapp` | ਫਰੰਟ-ਐਂਡ SPA (React, Vue, Angular) | ਗਲੋਬਲ CDN + ਮੁਫਤ SSL, ਬਿਲਟ-ਇਨ API ਸਹਿਯੋਗ |
| `function` | ਘਟਨਾ-ਚਲਿਤ ਅਤੇ ਸਰਵਰਲੇਸ ਵਰਕਲੋਡ | ਸਕੇਲ-ਟੂ-ਜ਼ੀਰੋ, ਪ੍ਰਤੀ-ਏਕਜ਼ੈਕਿਊਸ਼ਨ ਭੁਗਤਾਨ |
| `containerapp` | ਕੰਟੇਨਰ ਮਾਈਕ੍ਰੋਸੇਵਾਵਾਂ | ਸਰਵਰਲੇਸ ਕੰਟੇਨਰ, ਸਕੇਲ-ਟੂ-ਜ਼ੀਰੋ, ਬਿਲਟ-ਇਨ ਇਨਗ੍ਰੈੱਸ |
| `aks` | ਪੇਚੀਦਾ ਆਰਕੀਸਟ੍ਰੇਸ਼ਨ ਜ਼ਰੂਰਤਾਂ | ਜਦੋਂ ਤੁਸੀਂ ਆਪਣੇ ਬਿਲਕੁਲ ਲੋੜੀਂਦੇ ਹੋ ਤਾਂ ਪੂਰਾ Kubernetes ਕੰਟਰੋਲ |
| `springapp` | ਮੌਜੂਦਾ Azure Spring Apps ਡਿਪਲੌਇਮੈਂਟ | ਲੈਗੇਸੀ ਟਾਰਗੇਟ; ਸਰਵਿਸ 31 ਮਾਰਚ 2028 ਨੂੰ ਰਿਟਾਇਰ ਹੋ ਜਾਵੇਗੀ ਅਤੇ ਨਵੇਂ ਗਾਹਕਾਂ ਲਈ ਬੰਦ ਹੈ |

### AKS ਕਦੋਂ ਚੁਣਣਾ

**Azure Kubernetes Service (`host: aks`)** ਤੁਹਾਨੂੰ Kubernetes ਦੀ ਪੂਰੀ ਸ਼ਕਤੀ ਦਿੰਦਾ ਹੈ—ਕਸਟਮ ਕੰਟਰੋਲਰ, ਸੇਵਾ ਮੈਸ਼, ਪੇਚੀਦਾ ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਬਰੀਕੀ ਨਾਲ ਸਮਾਂ-ਸੂਚੀਬੱਧਤਾ। ਇਹ ਤਾਕਤ ਅਪਰੇਸ਼ਨਲ ਓਵਰਹੈੱਡ ਨਾਲ ਆਉਂਦੀ ਹੈ: ਤੁਸੀਂ ਨੋਡ ਪੂਲਾਂ, ਅੱਪਗਰੇਡ ਅਤੇ ਕਲੱਸਟਰ ਨੈਟਵਰਕਿੰਗ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਦੇ ਹੋ।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **ਧੀਮੇ ਸ਼ੁਰੂ ਕਰੋ ਜੇ ਤੁਸੀਂ ਕਰ ਸਕਦੇ ਹੋ।** ਜ਼ਿਆਦਾਤਰ ਮਾਈਕ੍ਰੋਸੇਵਾਵਾਂ ਲਈ, **ਕੰਟੇਨਰ ਐਪਸ** ਤੁਹਾਨੂੰ ਕੰਟੇਨਰ, ਆਟੋਸਕੇਲਿੰਗ ਅਤੇ ਸਕੇਲ-ਟੂ-ਜ਼ੀਰੋ ਮੁਹੱਈਆ ਕਰਵਾਉਂਦਾ ਹੈ ਜੋ ਕਲੱਸਟਰ ਪ੍ਰਬੰਧਨ ਦੀ ਜ਼ਰੂਰਤ ਨਹੀਂ ਹੈ। AKS ਨੂੰ ਸਿਰਫ ਉਹ ਦੁਆਰਾ ਚੁਣੋ ਜਦੋਂ ਤੁਹਾਨੂੰ Kubernetes-ਖਾਸ ਫੀਚਰਾਂ ਦੀ ਲੋੜ ਹੋਵੇ।

### Azure Spring Apps ਕਦੋਂ ਵਰਤੋਂ

**Azure Spring Apps (`host: springapp`)** ਇੱਕ ਪਰਬੰਧਿਤ ਰੰਟਾਈਮ ਹੈ ਜੋ ਖਾਸ ਸਪ੍ਰਿੰਗ ਬੂਟ ਲਈ ਬਣਾਇਆ ਗਿਆ ਹੈ। ਇਹ ਸੇਵਾ ਖੋਜ, ਕਾਫ਼ੀ ਸਰਵਰ ਅਤੇ ਬਲੂ-ਗਰੀਨ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ ਤਾਂ ਜੋ ਜਾਵਾ ਟੀਮਾਂ ਆਪਣਾ ਆਪਣਾ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਚਲਾਉਣ ਨਾ ਪਵੇ।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> ਨਵੇਂ ਸ਼ੁਰੂਆਤੀ ਪਰਜੈਕਟ ਲਈ Azure Spring Apps ਚੁਣੋ ਨਾ: ਇਹ ਨਵੇਂ ਗਾਹਕਾਂ ਲਈ ਬੰਦ ਹੈ ਅਤੇ [31 ਮਾਰਚ 2028 ਨੂੰ ਰਿਟਾਇਰ ਹੋ ਜਾਵੇਗਾ](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement)। ਕਾਂਟੇਨਰ ਐਪਸ ਵਰਗੇ ਸਮਰਥਿਤ ਵਿਕਲਪਾਂ ਨੂੰ ਤਰਜੀਹ ਦਿਓ ਅਤੇ ਮੌਜੂਦਾ ਡਿਪਲੌਇਮੈਂਟਾਂ ਲਈ ਮਾਈਗ੍ਰੇਸ਼ਨ ਦੀ ਯੋਜਨਾ ਬਣਾਓ।

## 🗃️ ਡੇਟਾਬੇਸ ਪ੍ਰਦਾਨਗੀ

### ਕੋਸਮੋਜ਼ DB
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

### ਪੋਸਟਗਰੇSQL
**ਫਰੈਗਮੈਂਟ ਲਈ ਲੋੜਾਂ:** `@secure() param databasePassword string` ਨੂੰ ਘੋਸ਼ਿਤ ਕਰੋ ਅਤੇ ਇੱਕ ਮਜ਼ਬੂਤ ਮੁਹੱਈਆ ਕੀਤੀ ਕੀਮਤ ਵਰਤੋ। ਸਾਰਵਜਨਿਕ ਪਹੁੰਚ **ਜਾਂ** ਹੇਠਾਂ ਦਿੱਤੇ ਡੈਲੀਗਟਡ ਸਭਨੈੱਟ/ਪ੍ਰਾਈਵੇਟ DNS ਨੂੰ ਮਿਲਾਓ; ਇਹ ਦੋ snippets ਆਪਸ ਵਿੱਚ ਆਪਣੇ ਆਪ ਨਹੀਂ ਜੁੜਦੇ।

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

`0.0.0.0` ਨਿਯਮ ਤੁਹਾਡੇ ਆਪਣੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਤੋਂ ਬਾਹਰ Azure ਸੇਵਾਵਾਂ ਤੋਂ ਕਨੈਕਸ਼ਨ ਦੀ ਇਜਾਜ਼ਤ ਦਿੰਦਾ ਹੈ। ਇਹ ਨਿੱਜੀ ਨੈਟਵਰਕਿੰਗ ਨਹੀਂ ਹੈ; ਹਕੀਕਤੀ ਵਰਕਲੋਡ ਲਈ ਸੀਮਿਤ ਨੈਟਵਰਕ ਡਿਜ਼ਾਈਨ ਨੂੰ ਪ੍ਰਾਥਮਿਕਤਾ ਦਿਓ।

## 🔒 ਸੁਰੱਖਿਆ ਅਤੇ ਸਿਕ੍ਰਟ ਮੈਨੇਜਮੈਂਟ

### ਕੀ ਵਾਲਟ ਏਕੀਕਰਨ
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

### ਪ੍ਰबंधਿਤ ਪਹਿਚਾਣ ਸੰਰਚਨਾ
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

ਸਿਸਟਮ-ਅਸਾਈਨ ਪਹਿਚਾਣ ਲਈ, ਇਸਦਾ ਪ੍ਰਿੰਸੀਪਲ ID ਨਾਲ `AZURE_CLIENT_ID` ਸੈੱਟ ਨਾ ਕਰੋ। ਯੂਜ਼ਰ-ਅਸਾਈਨ ਪਹਿਚਾਣ ਨੂੰ ਇਸ ਦਾ **ਕਲਾਇੰਟ ID** ਵਰਤਣਾ ਚਾਹੀਦਾ ਹੈ, ਨਾ ਕਿ ਇਸਦਾ ਓਬਜੈਕਟ/ਪ੍ਰਿੰਸੀਪਲ ID। ਕੀ ਵਾਲਟ ਸੰਦਰਭ ਨੂੰ ਐਪ ਪਹਿਚਾਣ ਦੀ ਵਾਲਟ ਰੋਲ ਜ਼ਿੰਮੇਵਾਰੀ ਅਤੇ ਨੈੱਟਵਰਕ ਪਹੁੰਚ ਦੀ ਵੀ ਲੋੜ ਹੁੰਦੀ ਹੈ।

## 🌍 ਨੈਟਵਰਕਿੰਗ ਅਤੇ ਕਨੈਕਟਿਵਿਟੀ

### ਵਰਚੁਅਲ ਨੈੱਟਵਰਕ ਸੰਰਚਨਾ
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

### ਐਪਲੀਕੇਸ਼ਨ ਗੇਟਵੇ ਵਿਥ SSL
**ਅਧੂਰੀ ਆਰਕੀਟੈਕਚਰ ਫਰੈਗਮੈਂਟ, ਡਿਪਲੌਇਮੈਂਟ ਲਾਇਕ ਗੇਟਵੇ ਨਹੀਂ:** VNet ਲਈ ਇੱਕ ਅਲੱਗ `gateway-subnet` ਸ਼ਾਮਲ ਕਰੋ, ਪਿੱਛੇ ਡਾਲਾਂ, HTTP ਸੈਟਿੰਗਾਂ, ਸੁਣਨ ਵਾਲੇ, ਪ੍ਰਾਥਮਿਕਤਾ ਨਾਲ ਰੂਟਿੰਗ ਨਿਯਮ ਅਤੇ TLS ਸਰਟੀਫਿਕੇਟ (ਜਾਂ ਅਧਿਕਾਰਤ ਕੀ ਵਾਲਟ ਸੰਦਰਭ)। ਸਿਰਫ ਪੋਰਟ 443 ਖੋਲ੍ਹਣਾ HTTPS ਸੰਰਚਿਤ ਨਹੀਂ ਕਰਦਾ।

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

## 📊 ਮੋਨਿਟਰਿੰਗ ਅਤੇ ਨਿਰੀਖਣ

### ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ
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

### ਕਸਟਮ ਮੈਟਰਿਕਸ ਅਤੇ ਅਲਰਟ
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

## 🔧 ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਸੰਰਚਨਾਵਾਂ

### ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਨਾਂ ਲਈ ਪੈਰਾਮੀਟਰ ਫਾਇਲਾਂ
ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਦੋ ਫਾਇਲਾਂ **ਵਿਕਲਪੀ ਪੈਰਾਮੀਟਰ-ਫਾਇਲ ਉਦਾਹਰਨਾਂ** ਹਨ। azd ਵਾਤਾਵਰਣ ਨਾਮ ਦੇ ਅਧਾਰ 'ਤੇ ਸਵੈਚਾਲਿਤ ਤੌਰ ਤੇ `main.parameters.dev.json` ਜਾਂ `main.parameters.prod.json` ਨੂੰ ਚੁਣਦਾ ਨਹੀਂ ਹੈ। ਅਸਲ `main.parameters.json` ਵਰਤੋ ਵਾਤਾਵਰਣ ਬਦਲੀਆਂ ਦੇ ਨਾਲ (ਜਿਵੇਂ ਕਿ `${APP_SERVICE_SKU=B1}`), ਅਤੇ ਹਰ ਪੈਰਾਮੀਟਰ ਨੂੰ ਬਾਇਸਪ ਵਿੱਚ ਘੋਸ਼ਿਤ ਅਤੇ ਵਰਤੋਂ ਕਰੋ।

`infra/main.parameters.dev.json` ਲਈ ਉਦਾਹਰਨ ਸਮੱਗਰੀ:

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

`infra/main.parameters.prod.json` ਲਈ ਉਦਾਹਰਨ ਸਮੱਗਰੀ:

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

### ਸ਼ਰਤੀ ਸਰੋਤ ਪ੍ਰਦਾਨਗੀ
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

## 🚀 ਅਗੇਤਰ ਪ੍ਰਦਾਨਗੀ ਪੈਟਰਨ

### ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ
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

### ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਟੈਸਟਿੰਗ
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰਦਾਨਗੀ ਤੁਹਾਡਾ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਨਹੀਂ ਕਰਦਾ। ਕੇਵਲ ਬਾਅਦ ਵਿੱਚ `azd deploy`/`azd up` ਤੋਂ ਬਾਅਦ ਐਪਲੀਕੇਸ਼ਨ ਚੈਕ ਚਲਾਓ, ਅਤੇ ਜੇ ਤੁਹਾਡਾ ਐਪ ਇਹ ਲਾਗੂ ਕਰਦਾ ਹੈ ਤਾਂ ਹੀ `/health` ਵਰਤੋਂ। ARM ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ Azure ਸਰੋਤ ਬਣਾਉਂਦੇ ਹਨ ਅਤੇ ਇਸ ਲਈ ਵਾਧੂ ਪਹਿਚਾਣ, ਸਮਰਥਿਤ ਰੰਟਾਈਮ ਵਰਜ਼ਨ ਅਤੇ ਅਧਿਕਾਰਾਂ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ; ਇਹ ਲੋਕਲ ਯੂਨਿਟ ਟੈਸਟ ਨਹੀਂ ਹਨ।

## 🧪 ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੂਰਵ ਦਰਸ਼ਨ ਅਤੇ ਵੈਰੀਫਿਕੇਸ਼ਨ (ਨਵਾਂ)

### ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਬਦਲਾਵਾਂ ਦਾ ਪੂਰਵ ਦਰਸ਼ਨ

`azd provision --preview` ਫੀਚਰ ਤੁਹਾਨੂੰ ਸਰੋਤਾਂ ਨੂੰ ਅਸਲੀ ਤੌਰ ਤੇ ਡਿਪਲੌਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ **ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰਦਾਨਗੀ ਦੀ ਨਕਲ ਬਣਾਉਣ** ਦਿੰਦਾ ਹੈ। ਇਹ ਆਤਮਾ ਵਿੱਚ `terraform plan` ਜਾਂ `bicep what-if` ਵਰਗਾ ਹੈ, ਜੋ ਤੁਹਾਨੂੰ ਤੁਹਾਡੇ Azure ਵਾਤਾਵਰਣ ਵਿੱਚ ਕੀ ਬਦਲਾਵ ਕੀਤੇ ਜਾਣਗੇ ਦਾ **ਡ੍ਰਾਇ-ਰਨ ਵਿਊ** ਦਿੰਦਾ ਹੈ।

#### 🛠️ ਇਹ ਕੀ ਕਰਦਾ ਹੈ
- **ਤੁਹਾਡੇ IaC ਟੈਂਪਲੇਟਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਦਾ ਹੈ** (ਬਾਇਸਪ ਜਾਂ ਟੇਰਾਫਾਰਮ)
- **ਸਰੋਤ ਬਦਲਾਵਾਂ ਦਾ ਪੂਰਵ ਦਰਸ਼ਨ ਦਿਖਾਉਂਦਾ ਹੈ**: ਜੋੜ, ਮਿਟਾਉਣ, ਅੱਪਡੇਟ
- **ਪ੍ਰਦਾਤਾ ਵੱਲੋਂ ਦਾਅਵਾ ਕੀਤੇ ਬਦਲਾਵਾਂ ਨੂੰ ਲਾਗੂ ਨਹੀਂ ਕਰਦਾ** — ਪਹਿਲਾਂ ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਹੂਕ ਚੈੱਕ ਕਰੋ; ਸਕ੍ਰਿਪਟਾਂ ਦੇ ਸਾਈਡ ਪ੍ਰਭਾਵ ਹੋ ਸਕਦੇ ਹਨ ਅਤੇ ਪੂਰਵ ਦਰਸ਼ਨ ਲਈ Azure ਅਧਿਕਾਰਾਂ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ

#### ਵਰਤੋਂ ਦੇ ਮਾਮਲੇ
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

ਇਹ ਹੁਕਮ ਤੁਹਾਡੀ ਮਦਦ ਕਰਦਾ ਹੈ:
- ਸਰੋਤਾਂ ਨੂੰ ਭੁਗਤਾਨ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਬਦਲਾਅ **ਵੈਰੀਫਾਈ** ਕਰੋ
- ਵਿਕਾਸ ਸਾਈਕਲ ਵਿੱਚ **ਗਲਤ ਸੰਰਚਨਾ ਦੀ ਪਹਿਲਾਂ ਪਹਚਾਣ**
- ਟੀਮ ਵਾਤਾਵਰਨ ਵਿੱਚ **ਸੁਰੱਖਿਅਤ ਸਾਂਝੇਦਾਰੀ**
- **ਘੱਟੋ-ਘੱਟ-ਅਧਿਕਾਰ ਡਿਪਲੌਇਮੈਂਟ** ਬਿਨਾਂ ਕਿਸੇ ਅਚੰਭੇ ਦੇ

ਇਹ ਵਿਸ਼ੇਸ਼ ਤੌਰ ਤੇ ਕਾਰਗਰ ਹੁੰਦਾ ਹੈ ਜਦੋਂ:
- ਪੇਚੀਦਾ ਮਲਟੀ-ਸੇਵਾ ਵਾਤਾਵਰਨਾਂ 'ਤੇ ਕੰਮ ਕਰਨਾ
- ਉਤਪਾਦਨ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਵਿੱਚ ਬਦਲਾਵ ਕਰਨਾ
- ਪੀ.ਆਰ. ਮਨਜ਼ੂਰੀ ਤੋਂ ਪਹਿਲਾਂ ਟੈਂਪਲੇਟ ਸੋਧਾਂ ਦੀ ਵੈਰੀਫਿਕੇਸ਼ਨ
- ਨਵੇਂ ਟੀਮ ਮੈਂਬਰਾਂ ਨੂੰ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੈਟਰਨਾਂ 'ਤੇ ਟ੍ਰੇਨਿੰਗ ਦੇਣਾ

### ਉਦਾਹਰਨ ਪੂਰਵ ਦਰਸ਼ਨ ਆਉਟਪੁੱਟ
ਪ੍ਰਦਾਤਾ ਅਤੇ ਪਰਜੈਕਟ ਢਾਂਚੇ ਦੇ ਅਨੁਸਾਰ ਪੂਰਵ ਦਰਸ਼ਨ ਆਉਟਪੁੱਟ ਵੱਖਰਾ-ਵੱਖਰਾ ਹੈ, ਪਰ ਨਤੀਜਾ ਸਾਫ਼ ਤੌਰ 'ਤੇ ਦਰਸਾਉਂਦਾ ਹੈ ਕਿ ਕੀ ਬਦਲਾਵ ਕੀਤੇ ਜਾਣਗੇ ਪਹਿਲਾਂ ਕਿ ਕੁਝ ਲਾਗੂ ਕੀਤਾ ਜਾਵੇ।

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

## �🔄 ਸਰੋਤ ਅਪਡੇਟ ਅਤੇ ਮਾਈਗ੍ਰੇਸ਼ਨ

### ਸੁਰੱਖਿਅਤ ਸਰੋਤ ਅੱਪਡੇਟਸ
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

### ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ
**ਅਧੂਰੇ ਡਿਪਲੌਇਮੈਂਟ-ਸਕ੍ਰਿਪਟ ਪੈਟਰਨ:** ਜਿੱਥੇ ਲੋੜ ਹੋਵੇ ਉਥੇ ਇੱਕ ਸਹੀ ਰੂਪ ਵਿੱਚ ਸੰਰਚਿਤ ਯੂਜ਼ਰ-ਅਸਾਈਨ ਪਹਿਚਾਣ, ਸਮਰਥਿਤ Azure CLI ਰੰਟਾਈਮ, ਉਪਲਬਧ ਮਾਈਗ੍ਰੇਸ਼ਨ ਟੂਲ, ਮੁਹੱਈਆ ਕੀਤਾ ਮਾਈਗ੍ਰੇਸ਼ਨ ਡਾਇਰੈਕਟਰੀ/ਸੰਰਚਨਾ ਅਤੇ ਡੇਟਾਬੇਸ ਕੁਨੈਕਟਿਵਿਟੀ ਦੀ ਲੋੜ ਹੈ। ਇਹ ਕਿਵੇਂ ਟੈਂਪਲੇਟ ਵਿੱਚ ਇਸ ਸਰੋਤ ਦੀ ਚਿਪਕਾ ਕੇ ਇਸ ਨੂੰ ਸਿਰਫ ਚਲਾਏ ਜਾਣਗੇ, ਉਹExecutable ਨਹੀਂ ਹੈ।

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

## 🎯 ਸਭ ਤੋਂ ਵਧੀਆ ਅਮਲ

### 1. ਸਰੋਤ ਨਾਮਕਰਨ ਪ੍ਰਥਾ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. ਟੈਗ ਕৌশਲ
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

### 3. ਪੈਰਾਮੀਟਰ ਸਮੀਖਿਆ
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

### 4. ਆਉਟਪੁੱਟ ਸੰਗਠਨ
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

- [ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਸਰੋਤ ਉਪਲੱਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../chapter-07-troubleshooting/common-issues.md) - ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸੁਲਝਾਅ
- [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](../chapter-07-troubleshooting/debugging.md) - ਪ੍ਰੋਵੀਜਨਿੰਗ ਸਮੱਸਿਆਵਾਂ ਦਾ ਡੀਬੱਗ ਕਰੋ
- [SKU ਚੋਣ](../chapter-06-pre-deployment/sku-selection.md) - ਉਚਿਤ ਸੇਵਾ ਦੀ ਸਤਰਾਂ ਚੁਣੋ

## ਵਾਧੂ ਸਾਧਨ

- [ਅਜ਼ੂਰ ਬਾਈਸਪ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [ਅਜ਼ੂਰ ਰਿਸੋਰਸ ਮੈਨੇਜਰ ਟੈਂਪਲੇਟ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [ਅਜ਼ੂਰ ਆਰਕੀਟੈਕਚਰ ਸੈਂਟਰ](https://learn.microsoft.com/en-us/azure/architecture/)
- [ਅਜ਼ੂਰ ਵੈੱਲ-ਆਰਕੀਟੈਕਟਿਡ ਫਰੇਮਵਰਕ](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਛਮਤਾ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD ഉപയോഗിച്ച് Azure வளങ്ങൾ ഒരുക്കൽ

**അദ്ധ്യായ നേവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 4 - ഇൻഫ്രാസ്ട്രക്ചർ ആസ്‌കോഡ് & ഡിപ്ലോയ്മെന്റ്
- **⬅️ മുൻപ്**: [Deployment Guide](deployment-guide.md)
- **➡️ അടുത്ത അദ്ധ്യായം**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 ബന്ധപ്പെട്ടത്**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## പരിചയം

ഈ ഗൈഡ് Azure Developer CLI ഉപയോഗിച്ച് അതിന്റെ ഉൾപ്പെടുത്തിയ Bicep, Terraform പ്രൊവൈഡറുകൾ ഉപയോഗിച്ച് Azure வளങ്ങൾ ഒരുക്കാനും നിയന്ത്രിക്കാനും ആകുന്നു.

> `azd 1.37.2`-നോട് (നവംബർ 2026) താരതമ്യപ്പെടുത്തി പരിശോധന ചെയ്‌തിരിക്കുന്നു. വേറെപിള്ളികൾ പറയാത്തവരെ അപേക്ഷിച്ച്, Bicep, Terraform, സ്‌ക്രിപ്റ്റ് ഉദാഹരണങ്ങൾ **ഉദാഹരണ ഭാഗങ്ങളിൽ** മാത്രമാണ്, പൂർണ്ണ ടെംപ്ലേറ്റ് അല്ല. അവ റഫറൻസ് ചെയ്ത പാരാമീറ്ററുകൾ, മോഡ്യൂളുകൾ, ഐഡൻറിറ്റികൾ, നെറ്റ്വർക്ക്, ആപ്ലിക്കേഷൻ കോഡ് എന്നിവ വിതരണം ചെയ്യുന്ന ഒരു പ്രോജക്റ്റിലേക്ക് സംയോജിപ്പിക്കുക. ഈ പരിശോധനയിൽ Azure പ്രൊവിഷനിംഗ് പ്രവർത്തിക്കും എന്നില്ല.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുന്നതിലൂടെ, നിങ്ങൾ:
- ഇന്‍ഫ്രാസ്ട്രക്ചർ എസ് കോഡ് സിദ്ധാന്തങ്ങളെ നിപുണരാക്കുകയും Azure റിസോഴ്‌സ് പ്രൊവിഷനിംഗ് നേടുകയും ചെയ്യുക
- Azure ഡവലപ്പർ CLI പിന്തുണയ്ക്കുന്ന 여러 IaC പ്രൊവൈഡർമാർ മനസ്സിലാക്കുക
- പൊതുവായ ആപ്ലിക്കേഷൻ ആർക്കിടെക്ചറുകൾക്കായി Bicep ടെംപ്ലേറ്റുകൾ രൂപകല്പന ചെയ്ത് നടപ്പിലാക്കുക
- റിസോഴ്‌സ് പാരാമീറ്ററുകൾ, ചരങ്ങൾ, പരിസ്ഥിതി-പ്രത്യേക സെറ്റിംഗുകൾ ക്രമീകരിക്കുക
- നെറ്റ്‌വർകിങ് மற்றும் സുരക്ഷ ഉൾപ്പെടെ മെച്ചപ്പെട്ട ഇൻഫ്രാസ്ട്രക്ചർ മാതൃകകൾ നടപ്പിലാക്കുക
- റിസോഴ്‌സ് ജീവിതചക്രം, അപ്ഡേറ്റുകൾ, ആശ്രിതത്വ പരിഹാരം കൈകാര്യം ചെയ്യുക

## പഠന ഫലങ്ങൾ

പൂർത്തിയായപ്പോൾ, നിങ്ങൾക്ക് കഴിയും:
- Bicep ಮತ್ತು ARM ടembeല്‍റ്റുകള്‍ ഉപയോഗിച്ച് Azure ഇൻഫ്രാസ്ട്രകചർ ഡിസൈൻ ചെയ്യുകയും Provision ചെയ്യുകയും ചെയ്യുക
- ശരിയായ റിസോഴ്സ് ആശ്രിതത്വങ്ങൾ ഉപയോഗിച്ച് സങ്കീർണ്ണമായ മൾട്ടി-സർവീസ് ആർക്കിടെക്ചറുകൾ കോൺഫിഗർ ചെയ്യുക
- നിരവധി പരിതസ്ഥിതികൾക്കും കോൺഫിഗറേഷനുകൾക്കും പാരാമീറ്ററൈസ്ഡ് ടembeള്‍റ്റുകൾ നടപ്പിലാക്കുക
- ഇൻഫ്രാസ്ട്രകചർ പ്രൊവിസനിംഗ് പ്രശ്നങ്ങൾ പരിഹരിക്കുകയും ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ പരിഹരിക്കുകയും ചെയ്യുക
- ഇൻഫ്രാസ്ട്രകചർ ഡിസൈനിന് Azure വേൾ-ആർക്കിടെക്ടഡ് ഫ്രെയിംവർക്കിന്റെ സിദ്ധാന്തങ്ങൾ പ്രയോഗിക്കുക
- ഇൻഫ്രാസ്ട്രകചർ അപ്‌ഡേറ്റുകൾ മാനേജുചെയ്യുകയും ഇൻഫ്രാസ്ട്രകചർ വേർഷനിംഗ് തന്ത്രങ്ങൾ നടപ്പിലാക്കുകയും ചെയ്യുക

## ഇൻഫ്രാസ്ട്രകചർ പ്രൊവിസനിംഗ് അവലോകനം

Azure ഡവലപ്പർ CLI ആശുപത്രിയാക്കുന്ന പല ഇൻഫ്രാസ്ട്രകചർ ആസ് കോഡ് (IaC) പ്രൊവൈഡർമാരുണ്ട്:
- **Bicep** (ശിപാർശചെയ്യപ്പെട്ടത്) - Azureയുടെ ഡൊമെയ്ൻ-സ്പെസിഫിക് ഭാഷ
- **ARM Templates** - Bicep ARMത്തിലേക്ക് കംപൈൽ ചെയ്യുന്നു; കാക.raw ARM JSON പൂർത്തിയായി ഒരു പ്രത്യേക ഇൻബിൽട്ട് അല്ല `infra.provider`
- **Terraform** - മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രകചർ ഉപകരണം
- **എക്സ്ടൻഷൻ പ്രൊവൈഡർമാർ** - പ്രത്യേകം ഇൻസ്റ്റാൾ ചെയ്ത പ്രൊവൈഡർ എക്സ്ടൻഷനും അതിന്റെ രേഖപ്പെടുത്തിയ കോൺഫിഗറേഷനും ആവശ്യമാണ്; ഏത് പ്രൊവൈഡർ സ്ട്രിംഗ് പിന്തുണയ്ക്കപ്പെടുന്നു എന്ന് ഒരിക്കലും കരുതരുത്

## Azure റിസോഴ്സ്‌കൾ മനസ്സിലാക്കൽ

### റിസോഴ്സ് വിശിഷ്ടമാന്യতা
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ആപ്പിക്കേഷൻസിനുള്ള പൊതുവായ Azure സേവനങ്ങൾ
- **കമ്പ്യൂട്ട്**: ആപ്പ് സർവീസ്, കൺടെയ്‌നർ ആപ്പുകൾ, ഫംഗ്ഷനുകൾ, വെർച്ച്വൽ മഷീനുകൾ
- **സ്റ്റോറേജ്**: സ്റ്റോറേജ് അക്കൗണ്ട്, കോസ്മോസ് DB, SQL ഡാറ്റാബേസ്, പോസ്റ്റ്‌ഗ്രെ SQL
- **നെറ്റ്വർക്കിംഗ്**: വെർച്ച്വൽ നെറ്റ്‌വർക്ക്, ആപ്ലിക്കേഷൻ ഗേറ്റ്‌വേ, CDN
- **സുരക്ഷ**: കീ വോൾട്ട്, ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്, ലോഗ് അനലിറ്റിക്സ്
- **AI/ML**: ആസ്യൂർ AI സേവനങ്ങൾ, ആസ്യൂർ ഓപ്പൺAI, ആസ്യൂർ മെഷീൻ ലേണിംഗ്

## ബിസെപ് ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ

### അടിസ്ഥാന ബിസെപ് ടെംപ്ലേറ്റ് ഘടന
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

ഒരു പൂർണ്ണമായ azd പ്രോജക്ടിനായി, ടാഗ് ചെയ്ത ഒരു റിസോഴ്സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കുകയും അതിന്റെ സ്കോപ്പും പാസ്സു ചെയ്യുകയും ചെയ്യുന്ന സബ്സ്ക്രിപ്ഷൻ സ്കോപ്പിലുള്ള `infra/main.bicep` നിന്ന് ഈ മോഡ്യൂൾ വിളിക്കണം. `main.parameters.json`-ൽ `environmentName`/`location`-നെ പൊരുത്തിപ്പിക്കുക. `azd-service-name: web` ടാഗ് റിസോഴ്സിനെ `services.web`-ഉടനേയ്ക്ക് ബന്ധിപ്പിക്കുന്നു; സ്വതന്ത്ര ഔട്ട്‌പുട്ട് നാമങ്ങൾ മാത്രം സർവീസ് ഡിസ്കവറി ക്രമീകരിക്കുകയില്ല.

### ഉയർന്ന ബിസെപ് പാറ്റേണുകൾ

#### മോഡ്യൂളർ ഇൻഫ്രാസ്ട്രക്ചർ
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

#### വ്യവസ്ഥാപിത റിസോഴ്സ് സൃഷ്ടി
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

## 🌐 azd-വുമായ Terraform ഉപയോഗിക്കൽ

ബിസെപ് azd-യുടെ ഡീഫോൾട്ട് ആണ്, പക്ഷേ azd **Terraform**-ഉം പിന്തുണയ്‌ക്കുന്നു—നിങ്ങളുടെ ടീം ഇതിനകം ഇതിൽ സ്റ്റാൻഡറ്ഡൈസ് ചെയ്‌തിരിക്കുന്നതായി അല്ലെങ്കിൽ നിങ്ങൾ മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രക്ചർ കൈകാര്യം ചെയ്യുന്നതായിരിക്കും എങ്കിൽ ഇത് ഉപയോഗപ്രദമാണ്. azd വേർക്ക്ഫ്ലോ ( `azd up`, `azd provision`, `azd down` ) ഏകദേശം സമാനമാണ്;唯ഇൻഫ്രാസ്ട്രക്ചർ ഭാഷയും ഫോൾഡർ ലേയൗട്ടും മാറ്റം വരും.

### azd-നെ Terraform ഉപയോഗിക്കാൻ പറഞ്ഞു കൊടുക്കുക

Terraform പ്രൊവൈഡറെ സൂചിപ്പിക്കുന്ന `infra` സെക്ഷൻ `azure.yaml`-ലേക്ക് ചേർക്കുക:

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

### ടെറഫോം ഫോൾഡർ ലേayout്

ടെറഫോം പ്രൊവൈഡറിനൊപ്പം, നിങ്ങളുടെ `infra/` ഫോൾഡർ Bicep ന്റെ പകരം `.tf` ഫയലുകൾ ഉപയോഗിക്കുന്നു:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ഒരു `main.tf` ഫ്രാഗ്മെന്റ്

ഇത് ഒരു റെസോഴ്‌സ് ഗ്രൂപ്പും പ്ലാനും മാത്രമാണ് സൃഷ്ടിക്കുന്നത്, ഡിപ്പ്ലോയബ്ൾ സർവീസ് അല്ല. നിങ്ങൾ ഇൻപുട്ട് വേരിയബിളുകളും, അനുയോജ്യമായ `azurerm` പ്രൊവൈഡറും, വെബ്ആപ്പും അതിന്റെ സർവീസ് ടാഗ്/റെസോഴ്‌സ്-നേം മാപ്പിംഗും പ്രഖ്യാപിക്കണം.

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

### azd നിങ്ങളുടെ ടെറഫോം ഔട്ട്പുട്ടുകളുമായി എങ്ങനെ കണക്ട് ചെയ്യുന്നു

azd ടെറഫോം **ഔട്ട്പുട്ടുകൾ** പരിസ്ഥിതി മൂല്യങ്ങളിലേക്ക് വായിക്കുന്നു. ഈ ഫ്രാഗ്മെന്റ് നിങ്ങൾ `azurerm_linux_web_app.web` നിർവചിച്ചിരിക്കുമെന്ന് കരുതുന്നു; സർവീസ് ഡിസ്കവറി ഇപ്പോഴും ഒരു പൊരുത്തമുള്ള റെസോഴ്‌സ് പേര് അല്ലെങ്കിൽ `azd-service-name` ടാഗ് ആവശ്യമാണ്:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **പ്രസക്തം:** azd പരിസ്ഥിതിപ്രകാരം രേസോഴ്‌സുകൾ ട്രാക്ക് ചെയ്യാൻ `azd-env-name` ടാഗും `AZURE_*` ഔട്ട്പുട്ടുകളും ഉപയോഗിക്കുന്നു. സാങ്കേതികമായി, നിങ്ങളുടെ റെസോഴ്‌സ് ഗ്രൂപ്പിന് എല്ലായ്പ്പോഴും `"azd-env-name" = var.environment_name` ടാഗ് നൽകുക, അതിനാൽ `azd down` എല്ലാം കണ്ടെത്തുകയും നീക്കം ചെയ്യുകയും ചെയ്യാൻ കഴിയും.

### ടെറഫോം ഉപയോഗിച്ച് ഡിപ്ലോയ്ഡ് ചെയ്യുക

കമാൻഡുകൾ Bicep പോലെ പൂർണ്ണമായി സമാനമാണ്:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **ആവശ്യമാണ്:** Terraform ഇൻസ്റ്റാൾ ചെയ്ത് നിങ്ങളുടെ `PATH`-ൽ ഉണ്ടായിരിക്കണം. azd Terraform *വർക്ക്ഫ്ലോ* നിയന്ത്രിക്കുന്നു, എന്നാൽ Terraform നിങ്ങൾക്കായി ഇൻസ്റ്റാൾ ചെയ്യാറില്ല. സ്റ്റേറ്റിനായി, azd ഡിഫോൾട്ട്локൽ സ്റ്റേറ്റ് ഉപയോഗിക്കുന്നു; ടീമുകൾക്കായി, ഒരു റിമോട്ട് ബാക്ക്‌എൻഡ് (ഉദാഹരണത്തിന്, Azure Storage ബാക്ക്‌എൻഡ്) `provider.tf`-ൽ കോൺഫിഗർ ചെയ്യുക.

പൂർണ്ണമായും പ്രവർത്തനക്ഷമമായ Terraform അടിസ്ഥാനമാക്കിയ സ്റ്റാർട്ടറുകൾക്കായി, [Awesome AZD ഗ്യാലറിയിൽ](https://azure.github.io/awesome-azd/) നോക്കി Terraform ഫിൽട്ടർ ചെയ്യുക, അല്ലെങ്കിൽ ഔദ്യോഗിക [azd Terraform ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) കാണുക.

## 🧩 മറ്റ് ഇൻഫ്രാസ്ട്രക്ചർ ടൂളുകൾ

Pulumi azd 1.37.2-ലെ ഫിറ്റിലാക്കിയ പ്രൊവിഷണിങ് പ്രൊവൈഡർ അല്ല. `infra.provider: pulumi` മാത്രം സെറ്റു ചെയ്‌താൽ പ്രവർത്തനക്ഷമമായ ഇന്റഗ്രേഷൻ ഉറപ്പുവരുത്താറില്ല, കൂടാതെ `azd env new` ഓട്ടോമാറ്റിക് ആയി Pulumi സ്റ്റാക്ക് സൃഷ്ടിക്കുകയോ തിരഞ്ഞെടുക്കുകയോ ചെയ്‌തില്ല. നിങ്ങൾ വേറെ IaC ടൂൾ ഉപയോഗിച്ചാൽ, അംഗീകരിച്ച ഒരു പ്രൊവൈഡർ എക്സ്റ്റൻഷന്റെ ഡോക്യുമെന്റേഷൻ പിന്തുടരുക അല്ലെങ്കിൽ നിങ്ങളുടെ സ്വന്തം വർക്ക്ഫ്ലോയിൽ അതിന്റെ ലൈഫ്‌സൈക്കിൾ വ്യക്തമായി മാനേജ് ചെയ്യുക. ഈ കോഴ്സ് Pulumi പ്രൊവൈഡർ നൽകാറോ പരിശോധിക്കുന്നതോ ചെയ്യില്ല.

## 🎯 നിങ്ങളുടെ സർവീസിനായി ഹോസ്റ്റിംഗ് തിരഞ്ഞെടുക്കൽ

`host` ഫീൽഡ് `azure.yaml`-ൽ നിങ്ങളുടെ കോഡ് എവിടെ പ്രവർത്തിക്കുമെന്ന് നിർണ്ണയിക്കുന്നു. azd പല ഹോസ്റ്റുകളും പിന്തുണയ്ക്കുന്നു—തികച്ചും ശരിയുള്ളത് തെരഞ്ഞെടുക്കുക ഇൻഫ്രാസ്ട്രക്ചർ ഭാഷയെക്കാളും കൂടുതൽ പ്രധാനമാണ്. ഇത് തുടക്കക്കാർക്കായി സൗഹൃദപരമായ തുൾക്കാഴ്ചയാണ്:

| `host` മൂല്യം | യാതിനായി മികച്ചത് | കാരണം |
|--------------|----------|-----|
| `appservice` | പരമ്പരാഗത വെബ് ആപ്പുകളും API കളും | ഏറ്റവും ലളിതമായ PaaS; കണ്ടൈനറുകൾ不要 |
| `staticwebapp` | ഫ്‌റണ്ട്-എൻഡ് SPAs (React, Vue, Angular) | ഗ്ലോബൽ CDN + സൗജന്യ SSL, ഇൻറഗ്രേറ്റഡ് API പിന്തുണ |
| `function` | ഇവന്റ്-ഡ്രിവൻ, സർവറ്ലെസ് വർക്ക്‌ലോഡ് | സ്തുതി-ലിങ്ക് സ്കെയിലിംഗ്, പ്രയോഗംപ്രതി പണം നൽകൽ |
| `containerapp` | കണ്ടൈനറൈസ്ഡ് മൈക്രോസർവീസുകൾ | സർവറ്ലെസ് കണ്ടൈനറുകൾ, സ്തുതി-ലിങ്ക് സ്കെയിലിംഗ്, ഇൻഗ്രസ് ഇൻറിഗ്രേറ്റഡ് |
| `aks` | കോംപ്ലക്സ് ഓർക്കസ്ട്രേഷൻ ആവശ്യങ്ങൾ | യഥാർത്ഥത്തിൽ ആവശ്യം ഉള്ളപ്പോൾ പൂർത്തിയായ Kubernetes നിയന്ത്രണം |
| `springapp` | നിലവിലുള്ള Azure Spring Apps ഡിപ്പ്ലോയ്മെന്റുകൾ | പഴയ ലക്ഷ്യം; സർവീസ് 2028 മാർച്ച് 31-ന് ഓർമ്മപ്പെടുത്തപ്പെടും, പുതുമുഖ ഉപഭോക്താക്കൾക്ക് അടച്ചിടും |

### AKS തിരഞ്ഞെടുക്കേണ്ടത് എപ്പോൾ

**Azure Kubernetes Service (`host: aks`)** നിങ്ങൾക്ക് കസ്റ്റം കണ്ട്രോളറുകൾ, സർവീസ് മെഷുകൾ, സങ്കീർണ നെറ്റ്‌വർക്കിംഗ്, സൂക്ഷ്മഗ്രേയ്നഡ് ഷെഡുലിംഗ് എന്നിവയുള്ള കുബർനെറ്റിന്റെ മുഴുവൻ ശക്തിയും നൽകുന്നു. ആ ശക്തിക്ക് ഓപ്പറേഷണൽ ഓവർഹെഡ് വരുന്നു: നിങ്ങൾ നോഡ് പൂളുകൾ, അപ്ഗ്രേഡുകൾ, ക്ലസ്റ്റർ നെറ്റ്‌വർക്കിംഗ് എന്നിവ നിയന്ത്രിക്കുന്നു.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **മുങ്ങിയതായി തുടങ്ങുക സാധിക്കുകയെങ്കിൽ.** മിക്ക മൈക്രോസെർവിസുകൾക്കും **Container Apps** നിങ്ങൾക്ക് ക്ലസ്റ്റർ നിയന്ത്രിക്കാതെ കണ്ടെയ്‌നറുകൾ, ഓട്ടോസ്കെയിലിംഗ്, സ്കെയിൽ-ടു-സീറോ നൽകുന്നു. കുബർനെറ്റ്സ്-സൂചിപ്പിച്ച ഫീച്ചറുകൾ ആവശ്യമെങ്കിൽ മാത്രമേ AKS തിരഞ്ഞെടുക്കാവു.

### Azure Spring Apps 언제 사용할까요

**Azure Spring Apps (`host: springapp`)** Spring Boot-ന്റെ ആവശ്യാനുസൃതമായി ഡിസൈൻ ചെയ്ത മാനേജുചെയ്‌ത റൺടൈം ആണ്. അത് സർവീസ് ഡിസ്കവറി, കോൺഫിഗ് സേർവർ, ബ്ലൂ-ഗ്രീൻ ഡിപ്ലോയ്മെന്റിനെ കൈകാര്യം ചെയ്യുന്നു, അതുകൊണ്ട് ജാവ ടീമുകൾ സ്വന്തം ഇൻഫ്രാസ്ട്രക്വറർ നിയന്ത്രിക്കേണ്ടതില്ല.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> പുതിയ തുടക്കക്കാരന് Azure Spring Apps തിരഞ്ഞെടുക്കരുത്: ഇത് പുതിയ ഉപഭോക്താക്കൾക്കായി അടച്ചിട്ടിരിക്കുന്നു, [2028 മാർച്ച് 31ന് വിരമിക്കുന്നു](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Container Apps പോലുള്ള പിന്തുണയുള്ള മാറ്റുകൾ പ്രധാനം ചെയ്യുക, നിലവിലുള്ള ഡിപ്ലോയ്മെന്റുകൾക്കായി മാറ്റം പദ്ധതി രൂപീകരിക്കൂ.

## 🗃️ ഡാറ്റാബേസ് പ്രൊവിഷനിംഗ്

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
**ഫ്രാഗ്മെന്റ് മുൻ‌കൈ**: `@secure() param databasePassword string` പ്രഖ്യാപിക്കുകയും ശക്തമായ നൽകപ്പെട്ട മൂല്യം ഉപയോഗിക്കുകയും ചെയ്യുക. പൊതുഅക്സസ് **അഥവാ** ചുമതലപ്പെട്ട സബ്നെറ്റ്/സ്വകാര്യ DNS സംയോജിപ്പിക്കുക; രണ്ട് സ്നിപ്പറ്റുകൾ സ്വയം ബന്ധിപ്പിക്കില്ല.

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

`0.0.0.0` നിയമം നിങ്ങളുടെ സബ്സ്ക്രിപ്ഷനെ പുറത്ത് Azure സേവനങ്ങളിൽ നിന്നുള്ള കണക്ഷനുകൾ അനുവദിക്കുന്നു. ഇത് സ്വകാര്യ നെറ്റ്‌വർക്കിംഗ് അല്ല; യഥാർത്ഥ വർക്ക്‌ലോക്സിന് ആവശ്യമായ നിയന്ത്രിത നെറ്റ്‌വർക്ക് രൂപകല്‌പന പ്രഥമീകരിക്കുക.

## 🔒 സുരക്ഷയും രഹസ്യ നിർവാഹവും

### കീ വോൾട്ട് എന്റഗ്രേഷൻ
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

### മാനേജുചെയ്‌ത ഐഡന്റിറ്റി കോൺഫിഗറേഷൻ
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

സിസ്റ്റം-നിയുക്തമായ ഐഡന്റിറ്റി සඳහා, അതിന്റെ പ്രിൻസിപ്പൽ ഐഡിയിൽ `AZURE_CLIENT_ID` സജ്ജമാക്കരുത്. ഉപയോക്തൃ-നിയുക്തമായ ഐഡന്റിറ്റി അതിന്റെ **ക്ലയന്റ് ഐഡി** ഉപയോഗിക്കുന്നു, ഒബ്‌ജക്റ്റ്/പ്രിൻസിപ്പൽ ഐഡി 아니. കീ വോൾട്ട് റഫറൻസിനും ആപ്പ് ഐഡന്റിറ്റിയുടെ വോൾട്ട് റോൾ നിയമനവും നെറ്റ്‌വർക്ക് ആക്സസ് ആവശ്യമാണ്.

## 🌍 നെറ്റ്‌വർക്കിംഗ് અને കണക്ടിവിറ്റി

### വെർച്വൽ നെറ്റ്‌വർക്ക് കോൺഫിഗറേഷൻ
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

### SSL-ഉള്ള അപ്ലിക്കേഷൻ ഗേറ്റ്വേ
**അCOMPLETE ആർക്കിടെക്ചർ ഫ്രാഗ്മെന്റ്, വിന്യസിക്കാവുന്ന ഗേറ്റ്വേ അല്ല:** VNet-ലേക്ക് പ്രത്യേക `gateway-subnet` ചേർക്കുക, പിന്നണിപ്പൂളുകൾ, HTTP സെറ്റിംഗുകൾ, ലിസണറുകൾ, മുൻഗണനയുള്ള റൂട്ടിംഗ് റൂളുകൾ, TLS സर्टിഫിക്കറ്റ് (അഥവാ അംഗീകൃത കീ വോൾട്ട് റഫറൻസ്) എന്നിവ ചേർക്കുക. 443 പോർട്ട് തുറക്കുന്നതിലൂടെ HTTPS ക്രമീകരിക്കില്ല.

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

## 📊 നിഗമനവും അനുബന്ധവുമുള്ള

### അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്
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

### കസ്റ്റം മീട്രിക്സ് ആൻഡ് അലർട്ടുകൾ
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

## 🔧 പരിസ്ഥിതി-നിർദ്ദിഷ്ട കോൺഫിഗറേഷനുകൾ

### വ്യത്യസ്ത പരിസരങ്ങൾക്കായുള്ള പാരാമീറ്റർ ഫയലുകൾ
താഴെയുള്ള രണ്ട് ഫയലുകൾ **വ്യത്യസ്ത പാരാമീറ്റർ-ഫയൽ ഉദാഹരണങ്ങളാണ്**. azd പരിസര നാമം പ്രകാരം `main.parameters.dev.json` അല്ലെങ്കിൽ `main.parameters.prod.json` സ്വയം തിരഞ്ഞെടുക്കുന്നില്ല. യഥാർത്ഥ `main.parameters.json` പരിസരപ്രവർത്തനങ്ങൾ (ഉദാഹരണം പോലെ `${APP_SERVICE_SKU=B1}`) ഉപയോഗിച്ച് എല്ലാ പാരാമീറ്ററുകളും ബിസെപ്പിൽ പ്രഖ്യാപിക്കുകയും ഉപയോഗിക്കുകയും ചെയ്‌യുക.

`infra/main.parameters.dev.json`-നുള്ള ഉദാഹരണ ഉള്ളടക്കം:

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

`infra/main.parameters.prod.json`-നുള്ള ഉദാഹരണ ഉള്ളടക്കം:

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

### നിബന്ധനാപരമായ റിസോഴ്സ് പ്രൊവിഷനിംഗ്
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

## 🚀 സമുഹിത പ്രൊവിഷനിംഗ് പാറ്റേണുകൾ

### ബഹുരാജ്യ വിനിയോഗം
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

### ഇൻഫ്രാസ്ട്രക്ചർ പരിശോധന
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

ഇൻഫ്രാസ്ട്രക്ഷർ പ്രൊവിഷനിംങ് നിങ്ങളുടെ ആപ്ലിക്കേഷൻ കോഡ് ഡിപ്ലോയ്മെന്റ് നടത്തുന്നില്ല. ആപ്ലിക്കേഷൻ ചെക്കുകൾ നടത്തുക മാത്രം `azd deploy`/`azd up` കഴിഞ്ഞതിനു ശേഷം, കൂടാതെ നിങ്ങളുടെ ആപ്പ് അത് നടപ്പിലാക്കിയാൽ മാത്രം `/health` ഉപയോഗിക്കുക. ARM ഡിപ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റുകൾ Azure റിസോഴ്സുകൾ സൃഷ്ടിക്കുകയും അധിക ഐഡന്റിറ്റി, പിന്തുണയുള്ള റൺടൈം പതിപ്പുകൾ, അനുവാദങ്ങൾ ആവശ്യപ്പെടുകയും ചെയ്യുന്നു; അവര്‍ പ്രാദേശിക യൂണിറ്റ് ടെസ്റ്റുകൾ അല്ല.

## 🧪 ഇൻഫ്രാസ്ട്രക്ഷർ പ്രിവ്യൂ & വാലിഡേഷൻ (പുതിയത്)

### ഡিপ്ലോയ്മെന്റ് മുന്‍പ് ഇൻഫ്രാസ്ട്രക്ഷർ മാറ്റങ്ങൾ പ്രിവ്യൂ ചെയ്യുക

`azd provision --preview` ഫീച്ചർ നിങ്ങൾക്ക് **ഇൻഫ്രാസ്ട്രക്ഷർ പ്രൊവിഷനിംഗ് സിമുലേറ്റ് ചെയ്യാൻ** അനുവദിക്കുന്നു, യഥാർത്ഥ റിസോഴ്‌സുകൾ ഡിപ്ലോയ് ചെയ്യുന്നതിനു മുമ്പ്. ഇത് `terraform plan` അല്ലെങ്കിൽ `bicep what-if` പോലെയാണ്, നിങ്ങളുടെ Azure പരിസരത്ത് മാറ്റങ്ങൾ എന്തൊക്കെയെന്ന് ഒരു **ഡ്രൈ-റണ്‍ വീക്ഷണം** നൽകുന്നു.

#### 🛠️ ഇത് ചെയ്യുന്നതെന്താണ്
- നിങ്ങളുടെ IaC ടെംപ്ലേറ്റുകൾ (Bicep അല്ലെങ്കിൽ Terraform) **വിശകലനം ചെയ്യുന്നു**
- **റിസോഴ്‌സ് മാറ്റങ്ങളുടെ പ്രിവ്യൂ കാണിക്കുന്നു**: ചേർക്കലുകൾ, നീക്കലുകൾ, അപ്ഡേറ്റുകൾ
- **പ്രൊവൈഡർ നിർദേശിച്ച ഇൻഫ്രാസ്ട്രക്ഷർ മാറ്റങ്ങൾ പ്രയോഗിക്കാറില്ല** — ആദ്യം പ്രോജക്ട് ഹുക്കുകൾ പരിശോധിക്കുക; സ്ക്രിപ്റ്റുകൾക്ക് സൈഡ് എഫക്റ്റുകൾ ഉണ്ടാകാം, പ്രിവ്യൂക്കും Azure അനുവാദങ്ങൾ ആവശ്യമുണ്ടാകും

#### ഉപയോഗം
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

ഈ കമാൻഡ് നിങ്ങളെ സഹായിക്കുന്നു:
- റിസോഴ്‌സ് കമ്പിടുന്നതിന് മുമ്പ് **ഇൻഫ്രാസ്ട്രക്ഷർ മാറ്റങ്ങൾ പരിശോധിക്കുക**
- വികസന ചക്രം തുടങ്ങുമ്പോൾ **തെറ്റായ കോൺഫിഗറേഷനുകൾ നേരിട്ടു പിടിക്കുക**
- സംഘപരിചരണ പരിസ്ഥിതികളിൽ **സുരക്ഷിതമായി സഹകരിക്കുക**
- **അല്പം-അനുമതി ഡിപ്ലോയ്മെന്റ് ഉറപ്പാക്കുക** അന്എക്സ്പെക്ടഡുകൾ കൂടാതെ

ഇത് പ്രത്യേകിച്ച് പ്രയോജനപ്പെടുന്നു:
- സങ്കീർണ്ണമായ മൾട്ടി-സർവീസ് പരിസ്ഥിതികളിൽ ജോലി ചെയ്യുമ്പോൾ
- ഉത്പാദന ഇൻഫ്രാസ്ട്രക്ഷറിൽ മാറ്റങ്ങൾ വരുത്തുമ്പോൾ
- PR അംഗീകാരം മുമ്പ് ടെംപ്ലേറ്റ് മാറ്റങ്ങൾ പരിശോധിച്ചിരിക്കുമ്പോൾ
- പുതിയ സംഘാംഗങ്ങളെ ഇൻഫ്രാസ്ട്രക്ഷർ മാതൃകകളിൽ പരിശീലിപ്പിക്കുമ്പോൾ

### ഉദാഹരണ പ്രിവ്യൂ ഔട്ട്പുട്ട്
പ്രത്യേക പ്രൊവൈഡറും പ്രോജക്ട് ഘടനയും അനുസരിച്ച് പ്രിവ്യൂ ഔട്ട്പുട്ട് വ്യത്യാസപ്പെടും, എന്നാൽ ഫലം ഒന്നും പ്രയോഗിക്കമുന്‍ നിര്‍ദ്ദേശിച്ച ചേരികളെ വ്യക്തമായി തിരിച്ചറിയണം.

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

## �🔄 റിസോഴ്‌സ് അപ്ഡേറ്റുകളും മൈഗ്രേഷനുകളും

### സുരക്ഷിത റിസോഴ്‌സ് അപ്ഡേറ്റുകൾ
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

### ഡാറ്റാബേസ് മൈഗ്രേഷനുകൾ
**അസമാപ്തമായ ഡിപ്ലോയ്മെന്റ്-സ്ക്രിപ്റ്റ് മാതൃകം:** ആവശ്യമായിടത്ത് കൺഫിഗർ ചെയ്ത യൂസർ-അസൈൻഡ് ഐഡന്റിറ്റി, പിന്തുണയുള്ള Azure CLI റൺടൈം, ലഭ്യമായ മൈഗ്രേഷൻ ഉപകരണങ്ങൾ, നൽകിയ മൈഗ്രേഷൻ ഡയറക്ടറി/കൺഫിഗറേഷൻ, ഡാറ്റാബേസ് കണക്ഷൻ എന്നിവ ആവശ്യമാണ്. ഈ റിസോഴ്‌സ് ഒരു ടെംപ്ലേറ്റിൽ പേസ്റ്റ് ചെയ്ത് മാത്രം പ്രവർത്തിപ്പിക്കാനാകില്ല.

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

## 🎯 മികച്ച ക്രമങ്ങൾ

### 1. റിസോഴ്‌സ് നാമകരണം കൺവെൻഷനുകൾ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. ടാഗിങ്ങ് തന്ത്രങ്ങൾ
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

### 3. പാരാമീറ്റർ വാലിഡേഷൻ
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

### 4. ഔട്ട്പുട്ട് ക്രമീകരണം
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

## അടുത്തപടികൾ

- [ഡിപ്ലോയ്മെന്റ് മുൻകൂർ പദ്ധതിവൽക്കരണം](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ലഭ്യത പരിശോധിക്കുക
- [സാമാന്യ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - ഇൻഫ്രാസ്ട്രക്ഷർ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [ഡിബഗ് ഗൈഡ്](../chapter-07-troubleshooting/debugging.md) - പ്രൊവിഷന്‍ പ്രശ്‌നങ്ങള്‍ ഡിബഗ് ചെയ്യുക
- [SKU തിരഞ്ഞെടുപ്പ്](../chapter-06-pre-deployment/sku-selection.md) - അനുയോജ്യമായ സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കുക

## അധിക സ്രോതസ്സുകൾ

- [അഴൂര്‍ ബൈസപ് ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [അഴൂര്‍ റിസോഴ്‌സ് മാനേജർ ടെംപ്ലേറ്റുകൾ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [അഴൂര്‍ ആർക്കിടെക്ചർ സെന്റര്‍](https://learn.microsoft.com/en-us/azure/architecture/)
- [അഴൂര്‍ വെൽ-ആർക്കിടെക്ചർഡ് ഫ്രെയിംവർക്ക്](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [നെറ്റ്‌വർക്കിംഗ് ഗൈഡ്](deployment-guide.md)
- **അടുത്ത പാഠം**: [ക്യാപാസിറ്റി പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
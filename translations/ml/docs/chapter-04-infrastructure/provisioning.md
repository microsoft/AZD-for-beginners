# AZD ഉപയോഗിച്ച് Azure റിസോഴ്‌സുകൾ പ്രാവധാനീകരിക്കൽ

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 4 - കോഡ് & ഡിപ്പ്ലോയ്‌മെന്റ് ആയി ഇൻഫ്രാസ്‌ട്രക്ചർ
- **⬅️ മുൻപ്**: [ഡിപ്പ്ലോയ്‌മെന്റ് ഗൈഡ്](deployment-guide.md)
- **➡️ അടുത്ത അധ്യായം**: [അദ്ധായം 5: മൾട്ടി-എജൻറ് AI സൊല്യൂഷൻസ്](../../examples/retail-scenario.md)
- **🔧 ബന്ധപ്പെട്ട**: [അധ്യായം 6: പ്രീ-ഡിപ്പ്ലോയ്‌മെന്റ് പരിശോധന](../chapter-06-pre-deployment/capacity-planning.md)

## പരിചയം

Azure Developer CLI ഉപയോഗിച്ച് Azure റിസോഴ്‌സുകൾ പ്രാവധാനീകരിക്കുകയും നിയന്ത്രിക്കുകയും ചെയ്യുന്നതുമായി ബന്ധപ്പെട്ട എല്ലാം ഉൾക്കൊള്ളുന്ന ഈ സമഗ്ര ഗൈഡ്. പൈസിപിൾ കോഡ് (IaC) മാതൃകകൾ അടിസ്ഥാന റിസോഴ്‌സ് സൃഷ്ടി മുതൽ ഉയർന്ന നിലവാരമുള്ള എന്റർപ്രൈസ് ഗ്രേഡ് ഇൻഫ്രാസ്ട്രക്ചർ ആർക്കിടെക്‌ചറുകൾ വരെയുള്ള Bicep, ARM ടെംപ്ലേറ്റുകൾ, Terraform, Pulumi എന്നിവ ഉപയോഗിച്ച് എങ്ങനെ നടപ്പിലാക്കാമെന്ന് പഠിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ നിങ്ങൾക്ക്:
- ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ് സിദ്ധാന്തങ്ങളും Azure റിസോഴ്‌സ് പ്രാവധാനീകരണവും പ്രാവീണ്യം നേടാം
- Azure Developer CLI പിന്തുണയ്ക്കുന്ന നിരവധി IaC പ്രൊവൈഡർമാരെ മനസിലാക്കാം
- സാധാരണ ആപ്ലിക്കേഷൻ ആർക്കിടെക്‌ചറുകൾക്ക് Bicep ടെംപ്ലേറ്റുകൾ രൂപകൽപ്പന ചെയ്ത് നടപ്പിലാക്കാം
- റിസോഴ്‌സ് പാരാമീറ്ററുകൾ, വേരിയബിൾസ്, പരിസ്ഥിതി-നിർദ്ദിഷ്ട ക്രമീകരണങ്ങൾ ക്രമീകരിക്കുക
- നെറ്റ്വർകിംഗ്, സുരക്ഷ ഉൾപ്പെടെയുള്ള ഉയർന്ന നിരക്കിലുള്ള ഇൻഫ്രാസ്ട്രക്ചർ മാതൃകകൾ നടപ്പിലാക്കുക
- റിസോഴ്‌സ് ജീവിത ചക്രം, അപ്‌ഡേറ്റുകൾ, ആശ്രിതത്വ പരിഹാരം നടത്തുക

## പഠനഫലങ്ങൾ

പൂർത്തിയായതിന് ശേഷം നിങ്ങൾക്ക് കഴിയും:
- Bicep, ARM ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് Azure ഇൻഫ്രാസ്ട്രക്ചർ രൂപകൽപ്പനയും പ്രാവധാനീകരണവും നടത്തുക
- ശരിയായ റിസോഴ്‌സ് ആശ്രിതത്വത്തോടെ ജടിലമായ മൾട്ടി-സർവീസ് ആർക്കിടെക്‌ചനുകൾ ക്രമീകരിക്കുക
- പല പരിസ്ഥിതികൾക്കും ക്രമീകരണങ്ങൾക്കുമായി പാരാമീറ്ററുചെയ്യാനാവുന്ന ടെംപ്ലേറ്റുകൾ നടപ്പിലാക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ പ്രാവധാനീകരണ പ്രശ്നങ്ങൾ തിരിച്ചറിയുകയും ഡിപ്പ്ലോയ്‌മെന്റ് പരാജയങ്ങൾ പരിഹരിക്കുകയും ചെയ്യുക
- Azure വെയിൽ-ആർക്കിടെക്റ്റഡ് ഫ്രെയിംവർക്ക് സിദ്ധാന്തങ്ങൾ ഇൻഫ്രാസ്ട്രക്ചർ രൂപകൽപ്പനയിൽ പ്രയോഗിക്കുക
- ഇൻഫ്രാസ്ട്രക്ചർ അപ്‌ഡേറ്റുകളും വെർഷനിംഗ് തന്ത്രങ്ങളും നിയന്ത്രിക്കുക

## ഇൻഫ്രാസ്ട്രക്ചർ പ്രാവസ്ഥാന പരാമർശം

Azure Developer CLI അനേകം ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ് (IaC) പ്രൊവൈഡർമാരെ പിന്തുണയ്ക്കുന്നു:
- **Bicep** (ശുപാർശ ചെയ്യുന്നു) - Azure യുടെ ഡൊമേൻ-സ്പെസിഫിക് ഭാഷ
- **ARM Templates** - JSON അടിസ്ഥാനമുള്ള Azure റിസോഴ്‌സ് മാനേജർ ടെംപ്ലേറ്റുകൾ
- **Terraform** - മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രക്ചർ ഉപകരണം
- **Pulumi** - പ്രോഗ്രാമിംഗ് ഭാഷകളോടെ ആധുനിക ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ്

## Azure റിസോഴ്‌സുകൾ മനസിലാക്കുക

### റിസോഴ്‌സ് ഹൈറാർക്കി
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### ആപ്ലിക്കേഷനുകൾക്കുള്ള പൊതു Azure സേവനങ്ങൾ
- **കമ്പ്യൂട്ട്**: ആപ്പ് സർവീസ്, കണ്ടെയ്‌നർ ആപ്പുകൾ, ഫങ്ഷൻസ്, വാച്ച്വൽ മെഷീനുകൾ
- **സ്റ്റോറേജ്**: സ്റ്റോറേജ് അക്കൗണ്ട്, കോസ്മോസ് DB, SQL ഡാറ്റാബേസ്, പോസ്റ്റ്ഗ്രെഎസ്‌ക്യുൽ
- **നെറ്റ്വർക്കിംഗ്**: വാച്ച്വൽ നെറ്റ്‌വർക്ക്, ആപ്ലിക്കേഷൻ ഗേറ്റ്വേ, CDN
- **സുരക്ഷ**: കി വാൾട്ട്, ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്, ലോഗ് അനലിറ്റിക്‌സ്
- **AI/ML**: Azure AI സേവനങ്ങൾ, Azure OpenAI, Azure മെഷീൻ ലേണിംഗ്

## Bicep ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ

### അടിസ്ഥാന Bicep ടെംപ്ലേറ്റ് ഘടന
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

### പുരോഗമന Bicep മാതൃകകൾ

#### മോഡുലാർ ഇൻഫ്രാസ്ട്രക്ചർ
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

#### നിബന്ധനാപരമായ റിസോഴ്‌സ് സൃഷ്ടി
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

## 🌐 azd-യോടെയുള്ള Terraform ഉപയോഗം

Bicep ആണ് azd-യുടെ ഡിഫാൾട്ട്, പക്ഷേ azd **Terraform**-ഉം പിന്തുണയ്ക്കുന്നു — നിങ്ങളുടെ ടീം ഇതിനകം ഇതിൽ സ്റ്റാൻഡേർഡ് ആണെങ്കിൽ അല്ലെങ്കിൽ നിങ്ങൾ മൾട്ടി-ക്ലൗഡ് ഇൻഫ്രാസ്ട്രക്ചർ മാനേജുചെയ്യുമ്പോൾ ഇത് പ്രയോജനപ്പെടുത്താം. azd പ്രവൃത്തി പ്രവാഹം (`azd up`, `azd provision`, `azd down`) ഒരുപോലെയാണ്; ഇൻഫ്രാസ്ട്രക്ചർ ഭാഷയും ഫോള്ഡർ ക്രമീകരണവും മാത്രമാണ് മാറ്റം.

### azd-യ്ക്ക് Terraform ഉപയോഗിക്കാൻ പറയുക

`azure.yaml` ലേക്ക് `infra` സെക്ഷൻ ചേർക്കുക അത് Terraform പ്രൊവൈഡറെ സൂചിപ്പിക്കുന്നു:

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

### Terraform ഫോള്ഡർ ക്രമീകരണം

Terraform പ്രൊവൈഡറിനൊപ്പം, നിങ്ങളുടെ `infra/` ഫോള്ഡറിൽ Bicep പകരം `.tf` ഫയലുകൾ ഉപയോഗിക്കുന്നു:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ഒരു ലഘുവായ `main.tf`

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

### എങ്ങനെ azd നിങ്ങളുടെ Terraform ഔട്ട്പുട്ടുകളോട് കണക്ട് ചെയ്യുന്നു

azd Terraform **ഔട്ട്പുട്ടുകൾ** വായിച്ച് നിങ്ങളുടെ എന്റ്എൻഡ് പോയിന്റുകളും പരിസ്ഥിതി മൂല്യങ്ങളെയും നിങ്ങളുടെ ആപ്പിലേക്ക് തിരികെ ബന്ധിപ്പിക്കുന്നു. ഔട്ട്പുട്ടുകളുടെ പേരുകൾ പ്രധാനമാണ്—azd പ്രത്യേക പേരുകളെ തേടി നോക്കുന്നു:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **പ്രധാനമാണ്:** azd ഓരോ പരിസ്ഥിതിക്കും റിസോഴ്‌സുകൾ ട്രാക്ക് ചെയ്യാൻ `azd-env-name` ടാഗും `AZURE_*` ഔട്ട്പുട്ടുകളും ഉപയോഗിക്കുന്നു. നിങ്ങളുടെ റിസോഴ്‌സ് ഗ്രൂപ്പിന് `"azd-env-name" = var.environment_name` എന്ന ടാഗ് എല്ലായ്പ്പോഴും നൽകുക, അതിലൂടെ `azd down` എല്ലാം കണ്ടെത്തി அகറ്റാൻ കഴിയും.

### Terraform ഉപയുക്തി ഉപയോഗിച്ച് ഡിപ്പ്ലോയ് ചെയ്യുക

കമാൻഡുകൾ Bicep തുറന്ന് സാദൃശ്യമാണിതു:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd അടിയന്തരമായി 'terraform plan' പ്രവർത്തിപ്പിക്കുന്നു
azd up                    # പ്രൊവിഷൻ + ഡീപ്ലോയ്
azd down --force          # Terraform-നായി നിയന്ത്രിക്കുന്ന റിസോഴ്‌സുകൾ നശിപ്പിക്കുന്നു
```

> **ആവശ്യകത:** Terraform ഇൻസ്റ്റാൾ ചെയ്തു നിങ്ങളുടെ `PATH`-ൽ ഉണ്ടാകണം. azd Terraform *പ്രവൃത്തി പ്രവാഹം* നിയന്ത്രിക്കുന്നു, എന്നാൽ Terraform നിങ്ങൾക്കായി ഇൻസ്റ്റാൾ ചെയ്യുകയില്ല. സ്റ്റേറ്റിനായി, azd ഡിഫോൾട്ട് ആയി ലൊക്കൽ സ്റ്റേറ്റ് ഉപയോഗിക്കുന്നു; ടീമുകൾക്കായി, `provider.tf`-യിൽ റിമോട്ട് ബാക്ക്എൻഡ് (ഉദാഹരണത്തിന് Azure സ്റ്റോറേജ് ബാക്ക്എൻഡ്) കോൺഫിഗർ ചെയ്യുക.

সম্পূর্ণ, പ്രവർത്തനക്ഷമമായ Terraform അടിസ്ഥാനത്തിലായ സ്റ്റാർട്ടേഴ്‌സ് വേണ്ടി, [Awesome AZD ഗാലറി](https://azure.github.io/awesome-azd/) ബ്രൗസ് ചെയ്ത് Terraform ഫിൽറ്റർ ചെയ്യുക, അല്ലെങ്കിൽ ഔദ്യോഗിക [azd Terraform ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) കാണുക.

## 🧩 azd-യോടെയുള്ള Pulumi ഉപയോഗം

നിങ്ങളുടെ ടീം പർപ്പസ്-ജനറൽ ഭാഷകളിൽ (TypeScript, Python, Go, അല്ലെങ്കിൽ C#) ഇൻഫ്രാസ്ട്രക്ചർ എഴുതുകയാണെങ്കിൽ, azd **Pulumi**-നും പിന്തുണ നൽകുന്നു. Terraform പോലെ, `azd up` / `azd provision` / `azd down` പ്രവൃത്തി പ്രവാഹം മാറുന്നില്ല — ഇൻഫ്രാസ്ട്രക്ചർ ടൂളിംഗും ഫോള്ഡർ ക്രമീകരണവും മാത്രമാണ് വ്യത്യാസം.

### azd-യ്ക്ക് Pulumi ഉപയോഗിക്കാൻ പറയുക

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

### Pulumi ഫോള്ഡർ ക്രമീകരണം

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### ഒരു ലഘുവായ `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// azd ട്രാക്ക് ചെയ്ത് ക്ലീൻ ചെയ്യാൻ എല്ലാ റിസോഴ്സുകളും ടാഗ് ചെയ്യുക
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd ഈ ഔട്ട്പുട്ടുകൾ നിങ്ങളുടെ ഇടപാടിൽ വീണ്ടും വായിക്കുന്നു
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### സ്റ്റാക്കുകൾ azd പരിസ്ഥിതികളുമായി മാപ്പ് ചെയ്യുന്നു

Pulumi ഡിപ്പ്ലോയ്മെൻറുകൾ **സ്റ്റാക്കുകളായി** ഓർഗനൈസ് ചെയ്യുന്നുണ്ട്, azd ഓരോ പരിസ്ഥിതിക്കും സമാനമായ പേരുള്ള Pulumi സ്റ്റാക്ക് നിശ്ചയിക്കുന്നു. നിങ്ങൾ `azd env new staging` പ്രവർത്തിപ്പിക്കുമ്പോൾ, azd `staging` Pulumi സ്റ്റാക്ക് തെരഞ്ഞെടുക്കുകയും(അല്ലെങ്കിൽ സൃഷ്ടിക്കുകയും) ചെയ്യുന്നു. സമാനമായ `azd-env-name` ടാഗിങ്ങും `AZURE_*` ഔട്ട്പുട്ട് നിബന്ധനകളും ബാധകമാണ്, അതുകൊണ്ട് `azd down` എല്ലാം കണ്ടെത്തി அகറ്റാൻ കഴിയും.

### Pulumi ഉപയോഗിച്ച് ഡിപ്പ്ലോയ് ചെയ്യുക

```bash
azd auth login
azd env new dev
azd provision --preview   # azd മേൽവശത്ത് 'pulumi preview' ഓടിക്കുന്നു
azd up                    # പ്രോവിഷൻ + ഡിപ്ലോയ്
azd down --force          # 'pulumi destroy' ഓടിക്കുന്നു
```

> **ആവശ്യകത:** Pulumi ഇൻസ്റ്റാൾ ചെയ്ത് നിങ്ങളുടെ `PATH`-ൽ ഉണ്ടാകണം, കൂടാതെ നിങ്ങൾക്ക് സ്റ്റേറ്റ് ബാക്ക്എൻഡ് (Pulumi ക്ലൗഡ് അല്ലെങ്കിൽ വീട്ടിൽ നിയന്ത്രിക്കാവുന്ന ബാക്ക്എൻഡ്, ഉദാഹരണത്തിന് Azure Blob Storage) ആവശ്യമുള്ളതാണ്. azd Pulumi പ്രക്രിയ* നിയന്ത്രിക്കുന്നു, ഇൻസ്റ്റാൾ ചെയ്യുന്നില്ല. ഔദ്യോഗിക [azd Pulumi ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) കാണുക.

## 🎯 നിങ്ങളുടെ സർവീസിന് ഹോസ്റ്റ് തിരഞ്ഞെടുക്കൽ

`azure.yaml`യിലെ `host` ഫീൽഡ് നിങ്ങളുടെ കോഡ് എവിടെ ഓടണം എന്ന് തീരുമാനിക്കും. azd വിവിധ ഹോസ്റ്റുകൾ പിന്തുണയ്ക്കുന്നു—ശരിയായ ഹോസ്റ്റ് തിരഞ്ഞെടുക്കൽ ഇൻഫ്രാസ്ട്രക്ചർ ഭാഷയ്‌ക്കേക്കാളും പ്രധാനമാണ്. ഇതാ ഒരു തുടക്കക്കാർക്ക് സൗഹൃദപരമായ താരതമ്യം:

| `host` മൂല്യം | മികച്ചതിനായി | കാരണം |
|--------------|----------|-----|
| `appservice` | പരമ്പരാഗത വെബ് ആപ്പുകളും API-കളും | എളുപ്പത്തിൽ ഉള്ള PaaS; കണ്ടെയ്‌നറുകൾ ആവശ്യമില്ല |
| `staticwebapp` | ഫ്രണ്ട്-എൻഡ് SPA-കൾ (റിയാക്റ്റ്, വ്യു, ആംഗുലർ) | ഗ്ലോബൽ CDN + സൗജന്യ SSL, ബിൽറ്റ് ഇൻ API പിന്തുണ |
| `function` | ഇവന്റ്-ഡ്രിവൻ, സെർവർലെസ് വർക്ക്ലോഡുകൾ | സ്കെയിൽ-ടു-സീറോ, പെയ്-പെർ-എക്സിക്യൂഷൻ |
| `containerapp` | കണ്ടെയ്‌നറൈസ്ഡ് മൈക്രോസർവീസുകൾ | സെർവർലെസ് കണ്ടെയ്‌നറുകൾ, സ്കെയിൽ-ടു-സീറോ, ബിൽറ്റ് ഇൻ ഇന്‍ഗ്രസ് |
| `aks` | സങ്കീർണ്ണ ഓർക്കസ്ട്രേഷൻ ആവശ്യങ്ങൾ | നിങ്ങൾ സത്യത്തിൽ Kubernetes വേണമെന്ന് തോന്നുമ്പോൾ പൂർണ്ണ നിയന്ത്രണം |
| `springapp` | ജാവ സ്പ്രിംഗ് ബൂട്ട് ആപ്പുകൾ | മാനേജ് ചെയ്ത Azure Spring Apps റൺടൈം, സ്പ്രിംഗ്-ഉദ്ദേശിച്ചുള്ള ട്യൂണിംഗ് |

### AKS ഉപയോഗിക്കേണ്ടത് എപ്പോഴാണെന്ന് അറിയുക

**Azure Kubernetes Service (`host: aks`)** നിങ്ങൾക്ക് Kubernetes-ന്റെ പൂർണ്ണ ശക്തി നൽകുന്നു — കസ്റ്റം കണ്ട്രോളർമാർ, സർവീസ് മെഷുകൾ, സങ്കീർണ്ണ നെറ്റ്വർക്കിംഗ്, ഫൈൻ-ഗ്രെയിൻഡ് ഷെഡ്യൂളിംഗ്. ആ ശക്തിക്ക് ഒപ്പം ഓപ്പറേഷണൽ ചരച്ചുണ്ട്: നിങ്ങൾ നോഡ് പൂളുകൾ, അപ്‌ഡേറ്റുകൾ, ക്ലസ്റ്റർ നെറ്റ്വർക്കിംഗ് നിയന്ത്രിക്കണം.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **തല ശാത്തമായി തുടങ്ങുക.** മിക്ക മൈക്രോസർവീസുകൾക്കായി, **Container Apps** കണ്ടെയ്‌നറുകൾ, ഓട്ടോസ്കെയ്ലിങ്, സ്കെയിൽ-ടു-സീറോ ക്ലസ്റ്റർ മാനേജുമെന്റ് ഒഴികാതെ നൽകുന്നു. Kubernetes പ്രത്യേക ഒരു ഫീച്ചർ ആവശ്യമാണെങ്കിൽ മാത്രമേ AKS തിരഞ്ഞെടുക്കൂ.

### Azure Spring Apps എപ്പോൾ ഉപയോഗിക്കാം

**Azure Spring Apps (`host: springapp`)** സ്പ്രിംഗ് ബൂട്ട് ലക്ഷ്യമാക്കി രൂപകൽപ്പന ചെയ്‌ത ഒരു മാനേജ് ചെയ്ത റൺടൈമാണ്. ഇത് സർവീസ് ഡിസ്കവറി, കോൺഫിഗ് സർവർ, ബ്ലൂ-ഗ്രീൻ ഡിപ്പ്ലോയ്‌മെന്റ് എന്നിവ കൈകാര്യം ചെയ്യുന്നു, അതിനാൽ ജാവ ടീമുകൾക്ക് സ്വയം ഇൻഫ്രാസ്ട്രക്ചർ ഓടിക്കേണ്ടതില്ല.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> ന σας已有 സ്രിംഗ് ബൂട്ട് ആപ്പുകൾ ഉണ്ടെങ്കിൽ, `springapp` ഉപയോഗിക്കുക. സ്പ്രിംഗ്-സ്പെസിഫിക് ആവശ്യമില്ലാത്ത പുതിയ കണ്ടെയ്‌നറൈസ്ഡ് ജാവ ആപ്പുകൾക്ക്, `containerapp` സാധാരണക്കൂടുതൽ ലളിതമായ തിരഞ്ഞെടുപ്പാണ്.

## 🗃️ ഡാറ്റാബേസ് പ്രാവധാനീകരണം

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

## 🔒 സുരക്ഷയും രഹസ്യ മാനേജുമെന്റും

### കി വാൾട്ട് ഇന്റഗ്രേഷൻ
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

### മാനേജ്ഡ് ഐഡൻറിറ്റി കോൺഫിഗറേഷൻ
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

## 🌍 നെറ്റ്വർക്കിംഗ് & കണക്ടിവിറ്റി

### വാച്ച്വൽ നെറ്റ്‌വർക്ക് കോൺഫിഗറേഷൻ
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

### SSL ഉൾപ്പെടുത്തിയ ആപ്ലിക്കേഷൻ ഗേറ്റ്വേ
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

## 📊 നിരീക്ഷണവും കാണാനേറിയതും

### ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്
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

### ഇഷ്‌ടാനുസൃത മെട്രിക്‌സ് & അലേർട്ട്‌സ്
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

## 🔧 പരിസ്ഥിതിഗത 特殊 ക്രമീകരണങ്ങൾ

### വ്യത്യസ്ത പരിസ്ഥിതികൾക്കുള്ള പാരാമീറ്റർ ഫയലുകൾ
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

### നിബന്ധനാപരമായ റിസോഴ്‌സ് പ്രാവസ്ഥാന
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

## 🚀 നവീന പ്രാവസ്ഥാന മാതൃകകൾ

### മൾട്ടി-റീജിയൻ ഡിപ്പ്ലോയ്‌മെന്റ്
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

### ഇൻഫ്രാസ്ട്രക്ചർ ടെസ്റ്റിംഗ്
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

## 🧪 ഇൻഫ്രാസ്ട്രക്ചർ പ്രിവ്യൂ & പരിശോധന (പുതുതായി)

### ഡിപ്പ്ലോയ്‌മെന്റ് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ മുൻകൂട്ടി കാണുക

`azd provision --preview` ഫീച്ചർ നിങ്ങടെ ഇൻഫ്രാസ്ട്രക്ചർ പ്രാവസ്ഥാനത്തിന് മുമ്പ് **നീതിപരമായ അനുകരണം** നടത്താൻ അനുവദിക്കുന്നു. ഇത് `terraform plan` അല്ലെങ്കിൽ `bicep what-if` പോലെയുള്ളതാണ്, നിങ്ങളുടെ Azure പരിസ്ഥിതിയിൽ എന്ത് മാറ്റങ്ങൾ ഉണ്ടാകും എന്ന് **ഡ്രൈ-റൺ ദൃശ്യമായി** കാണിക്കുന്നു.

#### 🛠️ അത് ചെയ്യുന്നതു
- **നിങ്ങളുടെ IaC ടെംപ്ലേറ്റുകൾ വിശകലനം ചെയ്യുക** (Bicep അല്ലെങ്കിൽ Terraform)
- **റിസോഴ്‌സ് മാറ്റങ്ങളുടെ മുൻകൂട്ടി ദൃശ്യവൽക്കരണം കാണിക്കുക**: ചേർക്കലുകൾ, നീക്കലുകൾ, അപ്‌ഡേറ്റുകൾ
- **മാറ്റങ്ങൾ പ്രാബല്യത്തിൽ കൊണ്ടുവരുന്നില്ല** — ഇത് വായന മാത്രം ആണ്, സുരക്ഷിതമാണ്

#### ഉപയോഗ കേസുകൾ
```bash
# വിന്യാസം ചെയ്യുന്നതിന് മുമ്പ് അടിസ്ഥാനസൗകര്യ മാറ്റങ്ങൾ മുൻകൂർ കാണുക
azd provision --preview

# പ്രത്യേക പരിസ്ഥിതിക്ക് മുൻകൂർ കാണൽ
azd provision --preview -e production
```

ഈ കമാൻഡ് സഹായിക്കുന്നു:
- **റിസോഴ്‌സ് മാറ്റങ്ങൾ പൂർണ്ണിമാക്കുന്നതിന് മുമ്പ് സ്ഥിരീകരിക്കുക**
- **വികസന ചക്രത്തിൽ പിഴവുകൾ മുമ്പ് കണ്ടെത്തുക**
- **ടീം പരിസ്ഥിതിയിൽ സുരക്ഷിതമായി സഹകരിക്കുക**
- **അപരിചിത പ്രയോഗങ്ങളില്ലാതെ കുറഞ്ഞ അവകാശപ്രദാനം ഉറപ്പാക്കുക**

ഇത് പ്രത്യേകിച്ച് പ്രയോജനകരമാണ്:
- ജടിലമായ മൾട്ടി-സർവീസ് പരിസ്ഥിതികളിൽ
- ഉത്പന്ന ഇൻഫ്രാസ്ട്രക്ചറിൽ മാറ്റങ്ങൾ ചെയ്യുമ്പോൾ
- പുൾ റിക്വസ്റ്റ് അംഗീകാരത്തിന് മുമ്പ് ടെംപ്ലേറ്റുകൾ ഉറപ്പാക്കുമ്പോൾ
- പുതിയത് ടീമംഗങ്ങളെ ഇൻഫ്രാസ്ട്രക്ചർ മാതൃകകളിൽ പരിശീലിപ്പിക്കുമ്പോൾ

### ഉദാഹരണ പ്രിവ്യൂ ഔട്ട്പുട്ട്
ഓഫർ ചെയ്ത പ്രിവ്യൂ ഔട്ട്പുട്ട് വ്യത്യസ്ത പ്രൊവൈഡറും പ്രോജക്ട് ഘടനയും ആക്‌സർചെയ്യാം, പക്ഷേ ഫലങ്ങൾ സുതാര്യമായി നിർദേശിക്കുന്ന മാറ്റങ്ങൾ വ്യക്തമാക്കണം.

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

## �🔄 റിസോഴ്‌സ് അപ്‌ഡേറ്റുകളും മാറ്റങ്ങളും

### സുരക്ഷിത റിസോഴ്‌സ് അപ്‌ഡേറ്റുകൾ
```bash
# മുൻ‌വായനയ്‌ക്കു ശേഷമുള്ള അടിസ്ഥാന സങ്കേത മാറ്റങ്ങൾ (ശിപാർശ ചെയ്തതാണ്)
azd provision --preview

# മുൻ‌വായന സ്ഥിരീകരണത്തിനു ശേഷം മാറ്റങ്ങൾ പ്രയോഗിക്കുക
azd provision --confirm-with-no-prompt

# റോള്ബാക്കിനായി, അടിസ്ഥാന സങ്കേത മാറ്റങ്ങൾ പിന്‍വലിക്കാൻ Git ഉപയോഗിക്കുക:
git revert HEAD  # അവസാനത്തെ അടിസ്ഥാന സങ്കേത കമ്മിറ്റ് പിന്‍വലിക്കുക
azd provision    # മുൻപ് ഉണ്ടായിരുന്ന അടിസ്ഥാന സങ്കേത നില പ്രയോഗിക്കുക
```

### ഡാറ്റാബേസ് മൈഗ്രേഷനുകൾ
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

## 🎯 മികച്ച പാഠങ്ങൾ

### 1. റിസോഴ്‌സ് നാമകരണം സമ്പ്രദായങ്ങൾ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ടാഗിങ് തന്ത്രം
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

### 4. ഔട്ട്പുട്ട് സംഘാടനo
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

## അടുത്ത ചുവടുകൾ

- [പ്രീ-ഡിപ്പ്ലോയ്‌മെന്റ് പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ലഭ്യത ഉറപ്പാക്കുക
- [പൊതുവായ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - ഇൻഫ്രാസ്ട്രക്ചർ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [ഡീബഗ്ഗിംഗ് ഗൈഡ്](../chapter-07-troubleshooting/debugging.md) - പ്രാവധാനീകരണ പ്രശ്നങ്ങൾ പരിശോധിക്കുക
- [SKU തിരഞ്ഞെടുപ്പ്](../chapter-06-pre-deployment/sku-selection.md) - അനുയോജ്യമായ സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കുക

## അധിക വിഭവങ്ങൾ

- [Azure Bicep ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager ടെംപ്ലേറ്റുകൾ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure ആർക്കിടെക്‌ചർ സെന്റർ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure വെയിൽ-ആർക്കിടെക്റ്റഡ് ഫ്രെയിംവർക്ക്](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [ഡിപ്പ്ലോയ്‌മെന്റ് ഗൈഡ്](deployment-guide.md)
- **അടുത്ത പാഠം**: [ക്ഷമതാ പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
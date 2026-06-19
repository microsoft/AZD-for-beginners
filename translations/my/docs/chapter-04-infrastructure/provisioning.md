# AZD ဖြင့် Azure အရင်းအမြစ်များ ပံ့ပိုးခြင်း

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၄ - အဆောက်အအုံကို ကုဒ်ဖြင့်နှင့် ဖြန့်ဖြူးခြင်း
- **⬅️ အရင်**: [ဖြန့်ဖြူးခြင်း လမ်းညွှန်](deployment-guide.md)
- **➡️ နောက်တစ်ခန်း**: [အခန်း ၅: မျိုးစုံ အေးဂျင့် AI ဖြေရှင်းချက်များ](../../examples/retail-scenario.md)
- **🔧 ဆက်စပ်**: [အခန်း ၆: ဖြန့်ဖြူးမှုမပြုမီ သက်ဆိုင်မှု စစ်ဆေးခြင်း](../chapter-06-pre-deployment/capacity-planning.md)

## နိဒါန်း

ဒီလမ်းညွှန်ချက်လက်စွဲမှာ Azure Developer CLI ကို အသုံးပြုပြီး Azure အရင်းအမြစ်များကို ပံ့ပိုးမှုနှင့် စီမံခန့်ခွဲမှုဆိုင်ရာ မည်သို့လုပ်ဆောင်ရမည်ကို အပြည့်အဝ ဖော်ပြထားသည်။ Bicep, ARM templates, Terraform, နှင့် Pulumi အသုံးပြုပြီး မူလ အရင်းအမြစ် တည်ဆောက်မှ бастап လက်ရှိ လုပ်ငန်းအဆင့်အထိ Infrastructure as Code (IaC) မျိုးစနစ်များကို သင်ယူလေ့လာနိုင်ပါသည်။

## သင်ယူရည်ရွယ်ချက်များ

ဒီလမ်းညွှန်ချက်ကို ပြီးစီးခြင်းအားဖြင့် သင်သည်:
- Infrastructure as Code 원칙များနှင့် Azure အရင်းအမြစ် ပံ့ပိုးမှုကို နူးညံ့စွာကျွမ်းကျင်ရမည်
- Azure Developer CLI မှပံ့ပိုးသော အမျိုးမျိုးသော IaC provider များကို နားလည်ရမည်
- အထွေထွေ အက်ပလီကေးရှင်း စျေးကွက်အတွက် Bicep template များကို ဒီဇိုင်းလုပ်ဆောင်နိုင်ရမည်
- resource parameter များ၊ variable များ နှင့် ပတ်ဝန်းကျင်အထူး ဆက်တင်များကို ဖန်တီးနိုင်ရမည်
- network နှင့် security အပါအဝင် အဆင့်မြင့် infrastructure ပုံစံများကို အကောင်အထည်ဖော်နိုင်ရမည်
- resource lifecycle, update များနှင့် dependency ဖြေရှင်းမှုကို စီမံနိုင်ရမည်

## သင်ယူပြီးရရှိမည့် အကျိုးအမြတ်များ

ပြီးဆုံးချိန်တွင် သင်သည်:
- Bicep နှင့် ARM template များကို အသုံးပြု၍ Azure အင်ဖရာစထက်ကို ဒီဇိုင်းလုပ်ကာ ပံ့ပိုးနိုင်မည်
- ပေါင်းစည်းမှုမြင့် multi-service architecture များကို သင့်တော်သော resource dependency များဖြင့် ဖန်တီးနိုင်မည်
- အမျိုးမျိုးသော ပတ်ဝန်းကျင်များနှင့် ဖက်စ်များအတွက် parameterized template များကို အသုံးပြုနိုင်မည်
- အင်ဖရာစထက် ပံ့ပိုးမှု ပြဿနာများကို ပြန်လည်ရှာဖွေ၍ deployment အမှားများကို ဖြေရှင်းနိုင်မည်
- Azure Well-Architected Framework 원칙များကို အင်ဖရာစထက် ဒီဇိုင်းတွင် အသုံးချနိုင်မည်
- အင်ဖရာစထက် အပ်ဒိတ်များကို စီမံကာ infrastructure versioning များကို ကျင့်ပါနိုင်မည်

## အင်ဖရာစထက် ပံ့ပိုးမှု အနှစ်ချုပ်

Azure Developer CLI သည် အမျိုးမျိုးသော Infrastructure as Code (IaC) providers များကို ပံ့ပိုးသည် -
- **Bicep** (အကြံပြု) - Azure အတွက် domain-specific ဘာသာစကား
- **ARM Templates** - JSON အခြေခံ Azure Resource Manager templates
- **Terraform** - မျိုးစုံ cloud များအတွက် အင်ဖရာစထက် ကိရိယာ
- **Pulumi** - programming languages များဖြင့် ခေတ်မီ အင်ဖရာစထက်ကို ကုဒ်ဖြင့်ရေးဆွဲရန်

## Azure အရင်းအမြစ်များကို နားလည်ခြင်း

### အရင်းအမြစ် အဆင့်အတန်း
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### အပလီကေးရှင်းများအတွက် မကြာခဏ အသုံးပြုသော Azure ဝန်ဆောင်မှုများ
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep အင်ဖရာစထက် နမူနာများ

### အခြေခံ Bicep Template ဖွဲ့စည်းပုံ
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

### Bicep အဆင့်မြင့် ဖက်နာများ

#### မော်ဂျူးလို အင်ဖရာစထက်
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

#### အခြေအနေ အရ အရင်းအမြစ် ဖန်တီးခြင်း
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

## 🌐 azd နှင့် Terraform အသုံးပြုခြင်း

Bicep သည် azd ၏ ပုံမှန် default ဖြစ်သည်၊ သို့သော် သင့်အသင်းက Terraform ကို အခြေခံအသုံးပြုခဲ့ပြီးသားဖြစ်လျှင် သို့မဟုတ် မျိုးစုံ cloud များကို စီမံအုပ်ချုပ်ရသော အခြေအနေများတွင် azd သည် **Terraform** ကိုပါ ပံ့ပိုးသည်။ azd workflow (`azd up`, `azd provision`, `azd down`) များသည် တူညီသည်; ကွာခြားချက်မှာ အင်ဖရာစထက် ဘာသာစကားနှင့် ဖိုလ်ဒါ ဖွဲ့စည်းပုံပဲဖြစ်သည်။

### azd ကို Terraform အသုံးပြုရန် ပြောကြားရန်

`azure.yaml` တွင် Terraform provider ကို ညွှန်ပြသည့် `infra` အပိုင်းကို ထည့်ပါ -

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

### Terraform ဖိုလ်ဒါ ဖွဲ့စည်းပုံ

Terraform provider ကို အသုံးပြုသောအခါ သင့် `infra/` ဖိုလ်ဒါတွင် Bicep အစား `.tf` ဖိုင်များကို အသုံးပြုသည် -

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### အနည်းဆုံး `main.tf`

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

### azd သည် သင့် Terraform outputs များနှင့် မည်သို့ ချိတ်ဆက်သည်

azd သည် Terraform **outputs** များကို ဖတ်၍ သင့် endpoints များကို သိရှိကာ ပတ်ဝန်းကျင်တန်ဖိုးများကို သင့် app ထဲသို့ ပြန်ထည့်သည်။ output အမည်များမှာ အရေးပါသည် — azd သည် တိကျသည့်အမည်များကို ရှာမြင်သည်။

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **အရေးကြီး:** azd သည် `azd-env-name` tag နှင့် `AZURE_*` outputs ကို ပတ်ဝန်းကျင်အလိုက် အရင်းအမြစ်များကို တွေ့ကြုံရန် အသုံးပြုသည်။ သင်၏ resource group ကို အမြဲ `"azd-env-name" = var.environment_name` ဟုပြု၍ tag ပေးပါ၊ ထို့ကြောင့် `azd down` က အရာအားလုံးကို ရှာဖွေနိုင်ပြီး ဖျက်ပစ်နိုင်ပါလိမ့်မည်။

### Terraform ဖြင့် ဖြန့်ဖြူးခြင်း

command များသည် Bicep နှင့် တူညီသည် -

```bash
azd auth login
azd env new dev
azd provision --preview   # azd သည် နောက်ခံတွင် 'terraform plan' ကို အလုပ်လုပ်သည်
azd up                    # ပံ့ပိုးခြင်း + တပ်ဆင်ခြင်း
azd down --force          # Terraform ထိန်းချုပ်ထားသော အရင်းအမြစ်များကို ဖျက်ပစ်သည်
```

> **လိုအပ်ချက်:** Terraform ကို သင့်စက်ပေါ်တွင် install လုပ်ထားပြီး သင်၏ `PATH` တွင် ရှိရန်လိုအပ်သည်။ azd သည် Terraform *workflow* ကို စီမံပေမယ့် Terraform ကို သင့်အတွက် install မလုပ်ပေးပါ။ state အတွက် azd သည် default မှာ local state ကို အသုံးပြုသည်; အဖွဲ့အတွက် နောက်ကောက်အား စီစဉ်လိုပါက `provider.tf` တွင် remote backend (ဥပမာ Azure Storage backend) တစ်ခုကို ကောဖိကျပါ။

လုံးဝလုပ်ဆောင်နိုင်သော Terraform-based starter များကို ကြည့်ရှုလိုပါက [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ကို ကြည့်ပြီး Terraform ဖြင့် ချုံ့ခွဲရှာဖွေရန် သို့မဟုတ် အတည်ပြုရန် [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ကို ကြည့်ပါ။

## 🧩 azd နှင့် Pulumi အသုံးပြုခြင်း

သင့်အသင်းသည် DSL မဟုတ်ဘဲ အထွေထွေအာရုံပေး ဗဟိုပရိုဂရမ်ဘာသာစကား (TypeScript, Python, Go, သို့မဟုတ် C#) ဖြင့် အင်ဖရာစထက်ရေးသားလျှင်လည်း azd သည် **Pulumi** ကို ပံ့ပိုးသည်။ Terraform ကဲ့သို့ပင် `azd up` / `azd provision` / `azd down` workflow မပြောင်းလဲပါ—အင်ဖရာစထက် tooling နှင့် ဖိုလ်ဒါ ဖွဲ့စည်းပုံသာ ကွာခြားသည်။

### azd ကို Pulumi အသုံးပြုရန် ပြောကြားရန်

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

### Pulumi ဖိုလ်ဒါ ဖွဲ့စည်းပုံ

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### အနည်းဆုံး `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// azd သည် အရင်းအမြစ်တိုင်းကို လိုက်လံစောင့်ကြည့်ပြီး ဖယ်ရှားနိုင်ရန် အမှတ်တံဆိပ်(tag) များ ပေးထားပါ။
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd သည် ဤ ထုတ်လွှတ်ချက်များကို သင့် ပတ်ဝန်းကျင်ထဲသို့ ပြန်လည်ဖတ်ယူသည်။
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks များသည် azd ပတ်ဝန်းကျင်များနှင့် ပြည့်စုံ တမာတမ်းတူညီသည်

Pulumi သည် deployment များကို **stacks** အဖြစ် စီစဉ်သည်၊ azd သည် အချိုးကျသည့် azd ပတ်ဝန်းကျင်တစ်ခုစီအား အလားတူ Pulumi stack ကို မက်ပ်လုပ်ပေးသည်။ ဥပမာ `azd env new staging` ကို လည်ပတ်သည့်အခါ azd သည် `staging` Pulumi stack ကို ရွေးချယ် (သို့) ဖန်တီးမည်။ `azd-env-name` tagging နှင့် `AZURE_*` output စည်းကမ်းများသည် ဆက်လက်ချိတ်ဆက်ထားပြီး ဖြစ်သောကြောင့် `azd down` သည် အရာအားလုံးကို ရှာဖွေ ဖျက်ပစ်နိုင်ပါသည်။

### Pulumi ဖြင့် ဖြန့်ဖြူးခြင်း

```bash
azd auth login
azd env new dev
azd provision --preview   # azd သည် အတွင်းပိုင်းတွင် 'pulumi preview' ကို လည်ပတ်စေသည်
azd up                    # ပံ့ပိုးခြင်း + တပ်ဆင်ခြင်း
azd down --force          # 'pulumi destroy' ကို လည်ပတ်စေသည်
```

> **လိုအပ်ချက်:** Pulumi ကို သင့်စက်ပေါ်တွင် install လုပ်ထားပြီး သင်၏ `PATH` တွင် ရှိရန်လိုအပ်ပြီး Pulumi Cloud သို့မဟုတ် Azure Blob Storage ကဲ့သို့ ကိုယ်ပိုင် state backend တစ်ခု လိုအပ်ပါမည်။ azd သည် Pulumi *workflow* ကို စီမံပေးပါသည်၊ install ကို မလုပ်ပေးပါ။ အသေးစိတ်အချက်အလက်များအတွက် [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) ကိုကြည့်ပါ။

## 🎯 သင့် ဝန်ဆောင်မှုအတွက် host ရွေးချယ်ခြင်း

`azure.yaml` အတွင်းရှိ `host` အကွက်သည် သင့်ကုဒ်ကို ဘယ်နေရာတွင် run လုပ်မည်ကို ဆုံးဖြတ်ပေးသည်။ azd သည် နှစ်သက်ရာ host များစွာကို ပံ့ပိုးသည် — မှန်ကန်သော host ကို ရွေးချယ်ခြင်းသည် အင်ဖရာစထက် ဘာသာစကားထက် အရေးကြီးသည်။ စတင်သူများအတွက် အောက်ပါ နှိုင်းယှဥ်ချက်ကို ကြည့်ပါ။

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | ပုံမှန် ဝဘ် အက်ပလီကေးရှင်းများနှင့် API များ | PaaS အလင်းဆုံး; containers မလိုအပ်ပါ |
| `staticwebapp` | Front-end SPA များ (React, Vue, Angular) | ကမ္ဘာလုံးဆိုင်ရာ CDN + အခမဲ့ SSL၊ ထည့်သွင်းထားသော API အထောက်အပံ့ |
| `function` | အဖြစ်အပျက် အခြေခံ နှင့် serverless လုပ်ငန်းစဉ်များ | scale-to-zero, တစ်ခေါက်စီ အလုပ်လုပ်သည့်အတိုင်းပေးချေမှု |
| `containerapp` | ကွန်တိန်နာဖြင့် မိုက်ခရိုဝန်ဆောင်မှုများ | Serverless containers, scale-to-zero, built-in ingress |
| `aks` | စီမံခန့်ခွဲမှုရှုပ်ထွေးသော အခြေအနေများ | လိုအပ်သကဲ့သို့ မိုက်ကရိုစနစ် များအတွက် Kubernetes အပြည့်အစုံ ထိန်းချုပ်မှု |
| `springapp` | Java Spring Boot အက်ပလီကေးရှင်းများ | Spring အတွက် သိတယ့်အတိုင်း ဘက်ဖိုင်ပြုထားသော Managed Azure Spring Apps runtime |

### AKS ကို ရွေးချယ်သင့်သည့် အချိန်

**Azure Kubernetes Service (`host: aks`)** သည် Kubernetes ၏ အပြည့်အစုံသော အင်အားကို ပေးသည် — custom controllers, service meshes, ရုပ်ရှင်ကျဆုံးသော ကွန်ယက်လုပ်ငန်းများ၊ နှင့် အရှိန်အဟုန် အသေးစိတ် စီမံခန့်ခွဲမှုများကို ပါဝင်သည်။ ဤအစွမ်းသည် အုပ်ချုပ်မှု ဝန်ထမ်းလုပ်ငန်းများကို လည်း တွဲလာသည်: node pool များ၊ upgrade များနှင့် cluster ကွန်ယက်ကို သင် ကိုယ်တိုင် စီမံရမည်။

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **မဖြစ်မနေနိုင်လျှင် ရိုးရှင်းစတင်ပါ။** မိုက်ခရိုဝန်ဆောင်မှုအများစုအတွက် **Container Apps** သည် container များ၊ autoscaling နှင့် scale-to-zero ကို cluster ကို စီမံစရာမလိုပဲ ပေးစွမ်းပေးသည်။ Kubernetes-specific အင်္ဂါရပ်များ လိုအပ်သည့်အခါသာ AKS ကို ရွေးချယ်ပါ။

### Azure Spring Apps သုံးရန် ဘယ်အချိန်

**Azure Spring Apps (`host: springapp`)** သည် Spring Boot အတွက် အထူးပြု၍ managed runtime တစ်ခုဖြစ်သည်။ ၎င်းသည် service discovery, config server, နှင့် blue-green deployment စသည့် အရာများကို ကိုင်တွယ်ပေးသဖြင့် Java အသင်းများသည် သင်၏ကိုယ်ပိုင်အင်ဖရာစထက်ကို စီမံရန် မလိုအပ်ဘဲ အသုံးချနိုင်သည်။

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> သင့်တွင် ရှိပြီးသား Spring Boot အက်ပလီကေးရှင်းများ ရှိပြီး ထိုအတွက် အထူးပြု runtime လိုချင်ပါက `springapp` ကို အသုံးပြုပါ။ Spring-specific လိုအပ်ချက်များမရှိသေးသော အသစ် containerize လုပ်ထားသော Java app များအတွက် `containerapp` သည် ပိုမိုရိုးရှင်းသော ရွေးချယ်မှု ဖြစ်လေ့ရှိသည်။

## 🗃️ ဒေတာဘေ့စ် ပံ့ပိုးမှု

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

## 🔒 လုံခြုံရေးနှင့် လျှိုဝှက်ချက် စီမံခန့်ခွဲမှု

### Key Vault ပေါင်းစည်းမှု
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

### Managed Identity ကွန်ဖစ်ဂျာရေးရှင်း
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

## 🌍 ကွန်ယက်နှင့် ချိတ်ဆက်မှု

### Virtual Network ကွန်ဖစ်ဂျာရေးရှင်း
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

### SSL ဖြင့် Application Gateway
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

## 📊 စောင့်ကြည့်ခြင်းနှင့် သတိထားလေ့လာနိုင်မှု

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

### စိတ်ကြိုက် မက်ထရစ်များနှင့် အဲလတ်များ
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

## 🔧 ပတ်ဝန်းကျင် အထူး ဆက်တင်များ

### အမျိုးမျိုးသော ပတ်ဝန်းကျင်များအတွက် Parameter ဖိုင်များ
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

### အခြေအနေ အပေါ်မူတည်၍ အရင်းအမြစ် ပံ့ပိုးမှု
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

## 🚀 အဆင့်မြင့် ပံ့ပိုးမှု ပုံစံများ

### မိမိတိုက်နယ် အနယ်နှင့် ဖြန့်ချိခြင်း
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

### အင်ဖရာစထက် စမ်းသပ်ခြင်း
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

## 🧪 အင်ဖရာစထက် ကြိုရှုနှင့် အတည်ပြုခြင်း (အသစ်)

### ဖြန့်ဖြူးခြင်းမပြုမီ အင်ဖရာစထက် ပြင်ဆင်ချက်များ ကြိုရှုကြည့်ပါ

`azd provision --preview` feature သည် အရင်းအမြစ်များကို အမှန်တကယ် ဖြန့်ဖြူးမှု လုပ်မီ **အင်ဖရာစထက် ပံ့ပိုးမှုကို လူပြန့်စမ်းသပ်ရန် (simulate)** ခွင့်ပြုသည်။ ၎င်းသည် `terraform plan` သို့မဟုတ် `bicep what-if` ကဲ့သို့ စိတ်ဓာတ်ရှိပြီး သင်၏ Azure ပတ်ဝန်းကျင်တွင် ဖြစ်မည့် ပြင်ဆင်ချက်များကို **dry-run view** အနေဖြင့် ပြသပေးသည်။

#### 🛠️ ၎င်း လုပ်ဆောင်ချက်များ
- **သင်၏ IaC template များကို phân tích** (Bicep သို့မဟုတ် Terraform)
- **အရင်းအမြစ်ပြင်ဆင်ချက်များ ကြိုပြသသည်**: အသစ်ထည့်မှုများ၊ ဖျက်ပစ်မှုများ၊ အပ်เดိတ်များ
- **ပြင်ဆင်ချက် များကို မလက်ခံပဲသာ ဖြစ်သည်** — ဖတ်ရန်သာဖြစ်ပြီး လုံခြုံစိတ်ချစွာ အသုံးပြုနိုင်သည်

#### အသုံးပြုမှု အခြေအနေများ
```bash
# ဖြန့်ချိရန် မလုပ်မီ အခြေခံအဆောက်အအုံ အပြောင်းအလဲများကို ကြိုကြည့်ပါ
azd provision --preview

# တိကျသော ပတ်ဝန်းကျင်အတွက် ကြိုကြည့်ပါ
azd provision --preview -e production
```

ဒီ command သည် သင်အား ကူညီပေးသည် -
- **အရင်းအမြစ် ပြင်ဆင်ချက်များကို အတည်ပြုရန်** ဖြန့်ဖြူးမှုမပြုမီ
- **ဖွဲ့စည်းမှု အမှားများကို မကြာခဏ ဖမ်းမိရန်**
- **အသင်းအဖွဲ့များထဲတွင် အလုံအလောက်ဖြင့် ပူးပေါင်းဆောင်ရွက်ရန်**
- **အံ့အားသင့်စေမည့် အသက်မပြတ်သော ဖြန့်ဖြူးမှုများမရှိစေရန် လုံခြုံစိတ်ချစေရန်**

ဤသည်အထူးသင့်တော်သည် -
- ရှုပ်ထွေးသော multi-service ပတ်ဝန်းကျင်များနှင့်လုပ်ကိုင်သောအခါ
- ထုတ်ကုန်ပတ်ဝန်းကျင်တွင် ပြင်ဆင်ချက်များ လုပ်ဆောင်ရန်
- PR အတည်ပြုမီ template ပြင်ဆင်ချက်များ အတည်ပြုရန်
- ဖွဲ့စည်းသူအသစ်များကို အင်ဖရာစထက် ပုံစံများ သင်ကြားရန်

### ဥပမာ Preview အထွက်
တိကျသော preview output သည် provider နှင့် project ဖွဲ့စည်းပုံအပေါ် မူတည်၍ ကွဲပြားနိုင်ပေမယ့်၊ ရလဒ်သည် မည်သည့် ပြင်ဆင်ချက်များ ဖြစ်မည်ကို အလင်းပေါ် ပေါ်လွင်စွာ ဖော်ပြသင့်သည်။

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

## �🔄 အရင်းအမြစ် အပ်ဒိတ်များနှင့် ရွေ့ပြောင်းခြင်း

### ဘေးမပျက်သော အရင်းအမြစ် အပ်ဒိတ်များ
```bash
# အခြေခံအဆောက်အအုံ ပြောင်းလဲမှုများကို ပထမဦးဆုံး ကြိုကြည့်ပါ (အကြံပြု)
azd provision --preview

# ကြိုကြည့်ပြီး အတည်ပြုချက်ရလျင် ပြောင်းလဲမှုများကို အကောင်အထည်ဖော်ပါ
azd provision --confirm-with-no-prompt

# rollback အတွက် Git ကို အသုံးပြု၍ အခြေခံအဆောက်အအုံ ပြောင်းလဲမှုများကို ပြန်လည်ရုပ်သိမ်းပါ:
git revert HEAD  # နောက်ဆုံး အခြေခံအဆောက်အအုံ commit ကို ပြန်လည်ရုပ်သိမ်းပါ
azd provision    # ယခင် အခြေခံအဆောက်အအုံ အခြေနေကို ပြန်လည်အသုံးချပါ
```

### ဒေတာဘေ့စ် ရွေ့ပြောင်းခြင်းများ
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

## 🎯 အကောင်းဆုံး လမ်းစဉ်များ

### 1. အရင်းအမြစ် အမည် သတ်မှတ်ချက်များ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging မူဝါဒ
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

### 3. Parameter အတည်ပြုခြင်း
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

### 4. Output အစီအစဉ်
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

## နောက်တစ်ဆင့်များ

- [ဖြန့်ဖြူးမှုမပြုမီ စီစဉ်ခြင်း](../chapter-06-pre-deployment/capacity-planning.md) - resource ရရှိနိုင်မှုကို အတည်ပြုပါ
- [အထူးပြ問題များ](../chapter-07-troubleshooting/common-issues.md) - အင်ဖရာစထက် ပြဿနာများကို ဖြေရှင်းပါ
- [ဒီးဘတ်ဂ် လမ်းညွှန်](../chapter-07-troubleshooting/debugging.md) - ပံ့ပိုးမှု ပြဿနာများကို debug လုပ်ပါ
- [SKU ရွေးချယ်ခြင်း](../chapter-06-pre-deployment/sku-selection.md) - အသင့်တော်သော service tier များကို ရွေးချယ်ပါ

## ထပ်ဆောင်း အရင်းအမြစ်များ

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **ပြီးခဲ့သော သင်ခန်းစာ**: [ဖြန့်ဖြူးခြင်း လမ်းညွှန်](deployment-guide.md)
- **နောက်တစ်ခန်း သင်ခန်းစာ**: [ဖြန့်ဖြူးမှုမပြုမီ စီစဉ်ခြင်း](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
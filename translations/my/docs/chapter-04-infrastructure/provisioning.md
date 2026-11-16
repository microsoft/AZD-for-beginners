# AZD ဖြင့် Azure အရင်းအမြစ်များ ပြုစုခြင်း

**အခန်း လမ်းညွှန်မှု:**
- **📚 သင်တန်းအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၄ - နည်းပညာအဖြစ် အဆောက်အအုံနှင့် ဖြန့်ဝေမှု
- **⬅️ ယခင်**: [Deployment Guide](deployment-guide.md)
- **➡️ နောက်တစ်ခန်း**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 ဆက်စပ်**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## နိဒါန်း

ဤလမ်းညွှန်စာအုပ်တွင် Azure Developer CLI နှင့် ၎င်း၏ Bicep နှင့် Terraform ပံ့ပိုးမှုများအား အသုံးပြုပြီး Azure အရင်းအမြစ်များကို ပြုစုခြင်းနှင့် စီမံခန့်ခွဲခြင်းကို ဖော်ပြထားပါသည်။

> `azd 1.37.2` ကိုစစ်ဆေးပြီး ပြန်လည်သုံးသပ်သည် (နိုဝင်ဘာ 2026)။ အခြားအရာ မဖေါ်ပြထားပါက၊ Bicep၊ Terraform နှင့် script နမူနာများမှာ **ဖော်ပြချက်ပိုင်းများဖြစ်ပြီး**၊ ပြည့်စုံသောပုံစံမဟုတ်ပါ။ ၎င်းတို့ကို ကိုးကားထားသော ပိတ်မှတ်များ၊ မော်ဂျူးများ၊ အတည်ပြုချက်များ၊ မျက်နှာချင်းဆိုင်ကွန်ယက်နှင့် အက်ပလီကေးရှင်းကုဒ် ပံ့ပိုးသည့် စီမံကိန်းတစ်ခုအဖြစ် ပေါင်းစပ်ထည့်သွင်းပါ။ ဒီသုံးသပ်ချက်တွင် Azure ကိုProvision မချက်လုပ်ခဲ့ပါ။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဤလမ်းညွန်ကိုအပြီးသတ်ပြီးနောက်:
- Infrastructure as Code စံအတတ်ပညာများနှင့် Azure resource provisioning ကိုကျွမ်းကျင်အောင် လေ့လာပါ
- Azure Developer CLI မှထောက်ပံ့သည့် အမျိုးမျိုးသော IaC ပံ့ပိုးသူများကိုနားလည်စေပါ
- သာမာန်အက်ပလီကေးရှင်းဗဟုပ်များအတွက် Bicep ပုံစံများကိုဒီဇိုင်းဆွဲနှင့် အကောင်အထည်ဖော်ပါ
- Resource parameter များ၊ သို့တည်း variable များနှင့် ပတ်ဝန်းကျင်အဆိုအတွက် သတ်မှတ်ချက်များကို အတတ်အကျွမ်းဆီအောင်အစီအစဉ်ရေးပါ
- ကွန်ယက်နှင့် လုံခြုံရေးအပါအဝင် မြင့်မားသော infrastructure ပုံစံများကိုအကောင်အထည်ဖော်ပါ
- Resource lifecycle၊ update များနှင့် ကြားနာပေါင်းသင်းမှုဖြေရှင်းမှုကို စီမံခန့်ခွဲပါ

## သင်ယူပြီးရလဒ်များ

အပြီးသတ်ပြီးနောက် သင်အောက်ပါအရာများကိုလုပ်ဆောင်နိုင်မည်ဖြစ်သည်-
- Bicep နှင့် ARM ပုံစံများ အသုံးပြု၍ Azure infrastructure များဒီဇိုင်းဆွဲပြီး Provision လုပ်ဆောင်နိုင်မည်
- မှန်ကန်သော resource သက်ဆိုင်မှုများနှင့်တွဲဖက်၍ ပြင်းပြပြီး multi-service architecture များကို ပြုလုပ်နိုင်မည်
- ပတ်ဝန်းကျင် အမျိုးမျိုးနှင့် ဖွဲ့စည်းမှုများအတွက် parameterize လုပ်ထားသော ပုံစံများကို အကောင်အထည်ဖော်နိုင်မည်
- infrastructure provisioning ပြဿနာများကို ဖြေရှင်းသုံးသပ်နိုင်ပြီး deployment အချက်အလက် မအောင်မြင်မှုများကို ပြင်ဆင်နိုင်မည်
- Azure Well-Architected Framework စံနှုန်းများကို infrastructure ဒီဇိုင်းမှာ လျှောက်ထားနိုင်မည်
- infrastructure update များကို စီမံခန့်ခွဲ၍ version management နည်းဗျူဟာများကို အကောင်အထည်ဖော်နိုင်မည်

## Infrastructure Provisioning အကျဉ်းချုံး

Azure Developer CLI မှာ အမျိုးမျိုးသော Infrastructure as Code (IaC) ပံ့ပိုးသူများကိုပံ့ပိုးသည်-
- **Bicep** (အကြံပြု) - Azure ၏ domain-specific language
- **ARM Templates** - Bicep သည် ARM သို့ ကုဒ်ထုတ်ယူသည်; ပုံမှန် ARM JSON သည် ထည့်သွင်းထားသော သီးခြား `infra.provider` မဟုတ်ပါ
- **Terraform** - မျိုးစုံ cloud infrastructure ကိရိယာ
- **Extension providers** - သက်ဆိုင်ရာ provider extension ကို သီးခြား 설치 လုပ်ထားရပြီး ၎င်း၏ လမ်းညွှန်ထောက်လှမ်းချက်ဖြင့်သာ စီမံခန့်ခွဲသင့်သည်; provider string များအားလုံးကို ထောက်ပံ့သည်ဟု မယူဆသင့်ပါ

## Azure Resources ကိုနားလည်ခြင်း

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### လျှောက်လွှာများအတွက် ပေါင်းသင်းအသုံးပြုမှု Azure ဝန်ဆောင်မှုများ
- **သင်္ချာရေး**: App Service, Container Apps, Functions, Virtual Machines
- **သိုလှောင်မှု**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **ကွန်ယက်**: Virtual Network, Application Gateway, CDN
- **လုံခြုံရေး**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep အခြေခံအဆောက်အအုံ နမူနာများ

### မျိုးစုံ Bicep နမူနာ ဖွဲ့စည်းပုံ
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

လုံးဝ azd စီမံကိန်းအတွက်၊ ဒီမော်ဂျူးကို subscription-scoped `infra/main.bicep` မှတဆင့် ခေါ်ဆိုပါ၊ အမှတ်အသား ပေးထားသော resource group တစ်ခုဖန်တီးပြီး ၎င်း၏ scope ကို ပေးပို့ပါ။ `environmentName`/`location` ကို `main.parameters.json` မှာ တွဲသုံးပါ။ `azd-service-name: web` tag သည် resource ကို `services.web` နှင့် ဆက်စပ်သည်; ကျပန်းထုတ်အမည်များသာဖြင့် service discovery ကို မစီမံနိုင်ပါ။

### တိုးတက်သော Bicep ပုံစံများ

#### ကိရိယာအသီးသီး အခြေခံအဆောက်အအုံ
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

#### အခြေအနေကို အခြေခံပြီး resource ဖန်တီးခြင်း
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

Bicep သည် azd ၏ ပုံမှန်ဖြစ်သည်၊ သို့သော် azd သည် **Terraform** ကိုပါ ထောက်ခံသည်—အထူးသဖြင့် သင်၏အဖွဲ့သည် ယာယီအသုံးပြုပြီးသားဖြစ်ပါက သို့မဟုတ် မျိုးစုံ cloud အခြေခံအဆောက်အအုံ စီမံခန့်ခွဲရာ၌ အသုံးဝင်ပါသည်။ azd ၏ အလုပ်လုပ်စနစ် (`azd up`, `azd provision`, `azd down`) အတူတူပဲဖြစ်ပြီး၊ အဆောက်အအုံဘာသာစကားနှင့် ဖိုင်ဖိုလ်ဒါ ဖွဲ့စည်းပုံတန်ပြန်ကွာခြားသည်။

### azd ကို Terraform သုံးရန် ပြောရန်

Terraform provider ကို ပြသရန် `infra` အစိတ်အပိုင်းကို `azure.yaml` တွင် ထည့်ပါ။

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

### Terraform ဖိုလ်ဒါဖွဲ့စည်းမှု

Terraform provider ဖြင့် သင့် `infra/` ဖိုလ်ဒါသည် Bicep အစား `.tf` ဖိုင်များကို အသုံးပြုသည်။

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf` အစိတ်အပိုင်းတစ်ခု

၎င်းသည် resource group နှင့် plan ကိုသာ ဖန်တီးပေးပြီး deploy လုပ်နိုင်သော ဝန်ဆောင်မှု မဟုတ်ပါ။ input variables များ၊ ကိုက်ညီသော `azurerm` provider၊ web app နှင့် ၎င်း၏ service tag/resource-name ပြသမှုကိုလည်း ကြေညာရပါမည်။

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

### azd သည် သင့် Terraform outputs များအား ချိတ်ဆက်သည့် နည်းလမ်း

azd သည် Terraform **outputs** များကို ပတ်ဝန်းကျင်တန်ဖိုးများအဖြစ် ဖတ်ယူသည်။ ဤအစိတ်အပိုင်းသည် သင် `azurerm_linux_web_app.web` ကို သတ်မှတ်ပြီးဖြစ်ကြောင်း သတ်မှတ်ပြီးဖြစ်သည်။ service discovery အတွက် သင့် resource name သို့မဟုတ် `azd-service-name` tag တစ်ခုလိုအပ်တည်ရှိရမည်ဟု ယူဆသည်။

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **အရေးကြီးချက်၊** azd သည် `azd-env-name` tag နှင့် `AZURE_*` outputs ကို အစီအစဉ်နဲ့ ထိန်းသိမ်းရာ တွင် အသုံးပြုသည်။ သင်၏ resource group ကို အမြဲတမ်း `"azd-env-name" = var.environment_name` ဖြင့် tag ထားပါက `azd down` သည် အရာအားလုံးကို ရှာဖွေနိုင်ပြီး ဖယ်ရှားနိုင်ပါသည်။

### Terraform ဖြင့် Deploy လုပ်ခြင်း

အမိန့်များမှာ Bicep ကဲ့သို့ တိတိကျကျ ဖြစ်ပါသည်။

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **လိုအပ်ချက်၊** Terraform ကို သွင်းထားပြီး သင့် `PATH` မှာ ရှိနိုင်ရမည်။ azd သည် Terraform *workflow* ကို တာဝန်ယူသော်လည်း Terraform ကို သွင်းဆောင်မထားပါ။ state အတွက် azd သည် ဒေသဆိုင်ရာ state ကို နမူနာထားသည်။ အသင်းများအတွက် remote backend (ဥပမာ Azure Storage backend) ကို `provider.tf` ထဲတွင် ဖော်ဆောင်နိုင်ပါသည်။

စComplete လုပ်ဆောင်နိုင်ပြီး Terraform-based starter များအတွက် [Awesome AZD gallery](https://azure.github.io/awesome-azd/) တွင် Terraform အသုံးပြု၍ စစ်ဆေးရှာဖွေရန် သို့မဟုတ် တရားဝင် [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) ကိုကြည့်ပါ။

## 🧩 အခြားအဖွဲ့အစည်းရေးခြင်းကိရိယာများ

Pulumi သည် azd 1.37.2 မှာတည်ဆောက်ထားသော provider မဟုတ်ပါ။ `infra.provider: pulumi` သာ သတ်မှတ်ခြင်းဖြင့် အလုပ်လုပ်သော ပေါင်းစည်းမှုမတည်ပေါ်ပါ၊ `azd env new` သည် Pulumi stack ကို အလိုအလျောက် ဖန်တီး/ရွေးချယ်ပေးခြင်း မရှိပါ။ သင်တခြား IaC tool တစ်ခု အသုံးပြုပါက အတည်ပြုထားသော provider extension ၏ စာရွက်စာတမ်းကိုလိုက်နာလိုက်ပါ သို့မဟုတ် မိမိ workflow အတွင်း၌ ၎င်း၏ အသက်ရှင်မှုကို ရိုးရှင်းစွာ စီမံပါ။ ဤသင်တန်းသည် Pulumi provider များ ပံ့ပိုးမပေးပါ။

## 🎯 သင့်ဝန်ဆောင်မှုအတွက် ဟိုစ့်ရွေးချယ်ခြင်း

`host` ကွက်လပ်သည် `azure.yaml` ထဲတွင် သင့်ကုဒ် မည်သည့်နေရာတွင် အလုပ်လုပ်မည်ကို ဆုံးဖြတ်ပေးသည်။ azd သည် ဟိုစ့်အမျိုးမျိုးကို ပံ့ပိုးပေးပြီး ဘာသာစကားထက် တိကျမှန်ကန်သော ဟိုစ့်တစ်ခုကို ရွေးရန် ပိုမိုအရေးကြီးသည်။ ဒီမှာ စတင်သူတွေ အတွက်လွယ်ကူသော နှိုင်းယှဉ်ချက်ဖြစ်ပါသည်။

| `host` တန်ဖိုး | အကောင်းဆုံးအသုံးပြုနိုင်သော | အကြောင်းရင်း |
|--------------|----------|-----|
| `appservice` | ရိုးရာ web app နှင့် API များ | အရမ်းလွယ်ကူသော PaaS; container မလိုအပ်ပါ |
| `staticwebapp` | ယခင်ဘက် SPAs (React, Vue, Angular) | Global CDN + အခမဲ့ SSL, အောက်ပါ API ပံ့ပိုးမှု ပါဝင်သည် |
| `function` | ဖြစ်ရပ်မှန်းပြီး နဲ့ ဆာဗာလက်စ်လုပ်ငန်းတာဝန်များ | zero အထိ ထိန်းသိမ်းနိုင်မှု, အသုံးပြုသည့်အတိုင်း ပေးဆောင်မှု |
| `containerapp` | container ဖြင့် ဖန်တီးထားသော microservices များ | ဆာဗာလက်စ် container များ, zero ထိန်းသိမ်းမှု, built-in ingress ပါဝင်မှု |
| `aks` | ရှုပ်ထွေးသော အစီအစဉ်လိုအပ်ချက်များ | အမှန်တကယ်လိုအပ်သောအခါ သင့်တော်သော Kubernetes ထိန်းချုပ်မှု ပြည့်စုံမှု |
| `springapp` | ရှိပြီးသား Azure Spring Apps deployments များ | အဟောင်းဟု ဦးစားပေး; ဝန်ဆောင်မှုသည် ၂၀၂၈ မတ်လ ၃၁ ရက်တွင် ရပ်ဆိုင်းပြီး အသစ်ဝယ်ယူသူများအား ပိတ်ထားသည် |

### AKS ကို ဘယ်အချိန် ရောက်မှန်းသိရမလဲ

**Azure Kubernetes Service (`host: aks`)** သည် Kubernetes ၏ အင်အားအပြည့်အစုံကို ပေးစွမ်းသည် — စိတ်တိုင်းကျ ထိန်းချုပ်သူများ၊ စက်ပစ္စည်း ဝက်ဘ်များ၊ ရှုပ်ထွေးသောကွန်ရက်ဆက်သွယ်မှုနှင့် အသေးစိတ် အချိန်ဇယားချိန်ညှိမှုများ ပါဝင်သည်။ အဲဒီအင်အားတွင် လုပ်ဆောင်မှုပိုင်း ဆောင်ရွက်မှုများပါဝင်သည်။ သင်သည် node pool များ၊ အဆင့်မြှင့်တင်မှုများနှင့် cluster ကွန်ရက်ဆက်သွယ်မှုကို စီမံခန့်ခွဲရမည် ဖြစ်သည်။

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **လွယ်ကူစွာ စတင်လိုပါက စတင်ပါ။** မိုက်ခရိုစေ့ဗစ်များအတွက် **Container Apps** သည် cluster ကို စီမံခန့်ခွဲရန်မလိုဘဲ container များ၊ autoscaling နှင့် scale-to-zero ကိုပေးသည်။ Kubernetes အထူးလက္ခဏာများ လိုအပ်သောအခါတွင်သာ AKS ကို ရွေးချယ်ပါ။

### Azure Spring Apps ကို မည်သည့်အခါ အသုံးပြုရမည်နည်း

**Azure Spring Apps (`host: springapp`)** သည် Spring Boot အတွက် ရည်ရွယ်ထားသော managed runtime ဖြစ်သည်။ ၎င်းသည် service discovery၊ config server နှင့် blue-green deployment ကို စီမံပေးပြီး Java အဖွဲ့များ အမြဲတမ်း သူတို့် infrastructure ကို မစီမံရစေရန် ဖြစ်သည်။

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Azure Spring Apps ကို စတင်အသုံးပြုသူ အသစ် ပရောဂျက်အတွက် ရွေးချယ်မထားရန်။ ၎င်းသည် အသုံးပြုသူအသစ်များအတွက် ပိတ်ပင်ထားပြီး [၂၀၂၈ မတ်လ ၃၁ ရက်တွင် ပယ်ဖျက်မည်](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement) ဖြစ်သည်။ Container Apps ကဲ့သို့ ပံ့ပိုးထားသောရွေးချယ်စရာများကို ဦးစားပေး၍ ရှိပြီးသား deployment များအတွက် ပြောင်းရွှေ့မှု စီမံချက် ချမှတ်ပါ။

## 🗃️ ဒေတာ ဘောင်ငှားခြင်း

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
**မှတ်ချက်အရ:** `@secure() param databasePassword string` ကို ကြေညာ၍ အတည်ပြုသော တန်ဖိုးကို အသုံးပြုပါ။ ပေါ်လူဒ်အသုံးပြုခွင့် **သို့မဟုတ်** မြှပ်နှံထားသော subnet/private DNS ကို ပေါင်းစပ်ပါ; ထို အပိုင်းလေများသည် မိမိတို့ကိုယ်ပိုင်အားဖြင့် မချိတ်ဆက်ပေးပါ။

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

`0.0.0.0` စည်းကမ်းသည် သင့် subscription ကို ကျော်၍ Azure ဝန်ဆောင်မှုများမှ ချိတ်ဆက်မှုများအား ခွင့်ပြုသည်။ အဲဒါသည် ကိုယ်ပိုင် ကွန်ရက်ဆက်သွယ်မှု မဟုတ်ပါ; အမှန်တကယ် လုပ်ငန်းများအတွက် ကန့်သတ်ထားသော ကွန်ရက် ဒီဇိုင်း ပိုမို ပိုင်းခြားအသုံးပြုပါ။

## 🔒 လုံခြုံမှုနှင့် လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှု

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

### Managed Identity ပြင်ဆင်ခြင်း
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

စနစ်တာဝန်ပေး identity အတွက် `AZURE_CLIENT_ID` ကို ၎င်း၏ principal ID သို့ မသတ်မှတ်ရ။ အသုံးပြုသူ-တာဝန်ပေး identity သည် ၎င်း၏ **client ID** ကို အသုံးပြုသည်၊ object/principal ID မဟုတ်ပါ။ Key Vault ကိုးကားချက်သည် app identity ၏ vault role ပေးအပ်မှုနှင့် ကွန်ရက် ခွင့်ပြုခွင့်များကို လည်း လိုအပ်သည်။

## 🌍 ကွန်ရက်ဆက်သွယ်မှုနှင့် ဆက်သွယ်မှု

### Virtual Network ပြင်ဆင်ခြင်း
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

### Application Gateway နှင့် SSL
**အပြီးစီး မဖြစ်သေးသော အဆောက်အအုံ အပိုင်း၊ deploy လုပ်နိုင်သည့် gateway မဟုတ်ပါ:** VNet သို့သီးသန့် `gateway-subnet` နှင့် backend pools၊ HTTP settings၊ listeners၊ priority နှင့် routing rules များ၊ TLS certificate (သို့) ခွင့်ပြုထားသော Key Vault ကိုးကားချက် ထည့်သွင်းပါ။ port 443 ပဲ ဖြင့်ရန် HTTPS ပြင်ဆင်မှု မပြုလုပ်ရ။

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

## 📊 မော်နီတာလုပ်ခြင်းနှင့် တွေ့ရှိနိုင်မှု

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

### ကိုယ်ပိုင် တိုင်းတာမှုများနှင့် သတိပေးချက်များ
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

## 🔧 ပတ်ဝန်းကျင်အလိုက် ပြင်ဆင်မှုများ

### ပတ်ဝန်းကျင်အမျိုးမျိုးအတွက် Parameter ဖိုင်များ
အောက်ပါ ဖိုင် နှစ်ခုသည် **ရွေးချယ်၍ အသုံးပြုနိုင်သော parameter ဖိုင် ဥပမာများ** ဖြစ်သည်။ azd သည် ပတ်ဝန်းကျင်နာမည်ဖြင့် `main.parameters.dev.json` သို့မဟုတ် `main.parameters.prod.json` ကို ကိုယ်တိုင် ရွေးချယ် မထားပါ။ မွန်ကန်သော `main.parameters.json` ကို ပတ်ဝန်းကျင် အစားထိုးများနှင့် အတူ အသုံးပြုပြီး (ဥပမာ `${APP_SERVICE_SKU=B1}`) Bicep တွင် parameter တစ်ခုချင်းစီကို ကြေညာ၍ အသုံးပြုပါ။

`infra/main.parameters.dev.json` အတွက် ဥပမာ အကြောင်းအရာများ:

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

`infra/main.parameters.prod.json` အတွက် ဥပမာ အကြောင်းအရာများ:

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

### အခြေအနေဆိုင်ရာ အရင်းအနှီး ထောက်ပံ့မှု
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

## 🚀 ကြီးမားသော ထောက်ပံ့မှု ပုံစံများ

### မူလတိုင်းနယ်တွင် တပြင်တည်း ဖြန့်ဝေမှု
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

### အင်ဖရာစတပ်ချာ စမ်းသပ်ခြင်း
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

အခြေခံအင်ဖရာစုပြင်ဆင်နေမှုသည် သင့်လျှောက်လွှာကုဒ်ကို မတင်သွင်းပါ။ လျှောက်လွှာစစ်ဆေးရန်ကိုသာ `azd deploy`/`azd up` ပြီးနောက်တွင် ပြုလုပ်ပြီး၊ သင့်လျှောက်လွှာတွင် အကောင်အထည်ဖော်ထားလျှင်သာ `/health` ကို အသုံးပြုပါ။ ARM တင်သွင်းခြင်း script များသည် Azure အရင်းအမြစ်များကို ဖန်တီးပြီး အတည်ပြုအချက်အလက်၊ ဖြေရှင်းပေးနိုင်သော runtime ဗားရှင်းများနှင့် ခွင့်ပြုချက်များ လိုအပ်သည်။ ၎င်းတို့သည် ဒေသတွင်းယူနစ်စမ်းသပ်မှုများ မဟုတ်ပါ။

## 🧪 အင်ဖရာစရုပ်ကြိုသဘောမူနှင့် အတည်ပြုခြင်း (အသစ်)

### တင်သွင်းမှုမပြုမီ အင်ဖရာစရုပ်ပြင်ဆင်ပုံကြိုကြည့်ခြင်း

`azd provision --preview` လုပ်ဆောင်ချက်သည် သင့်အား အရင်းအမြစ်များကို တကယ်တင်သွင်းမလုပ်မီ **အင်ဖရာစရုပ် စီမံခန့်ခွဲမှုကို အတုအယောင် ဖန်တီးနိုင်စေသည်**။ ယင်းသည် `terraform plan` သို့မဟုတ် `bicep what-if` နှင့် စိတ်ကူးတူရှိပြီး သင့် Azure ပတ်ဝန်းကျင်၌ ပြင်ဆင်မှုများ အကယ်၍ဖြစ်မည်ကို **ရေတပြင် မျက်နှာပြင်ကြည့်ရှုခြင်း** ပုံစံဖြစ်သည်။

#### 🛠️ ၎င်းလုပ်ဆောင်ချက်
- **သင့် IaC မော်ဒယ်များကို ခွဲခြမ်းစိတ်ဖြာသည်** (Bicep သို့မဟုတ် Terraform)
- **အရင်းအမြစ်ပြင်ဆင်မှုများ၏ ကြိုကြည့်ချက်ကို ပြသည်**: ထည့်သွင်းမှုများ၊ ဖျက်သိမ်းမှုများ၊ ပြင်ဆင်မှုများ
- **ပေးသွင်းသူ၏ အင်ဖရာစရုပ်ပြင်ဆင်မှုကို မအကောင်အထည်ဖော်ပါ** — ပရောဂျက်လုပ်ဆောင်ချက်များကို ပထမဦးစွာ စစ်ဆေးပါ; script များတွင် ဘက်သက်ရောက်မှုများရှိနိုင်ပြီး ကြိုကြည့်ချက်မှာ Azure ခွင့်ပြုချက်များ လိုအပ်ပါသည်

#### အသုံးပြုမှုလုပ်ငန်းများ
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

ဤကောင့် အမိန့်သည် သင့်အား အောက်ပါအရာများတွင် ကူညီပေးပါသည်-
- **အရင်းအမြစ်ပြင်ဆင်မှုများကို သဘောတူညီမှုပြုမီ လုံခြုံစိတ်ချစေရန် စစ်ဆေးမည်**
- **ဖွံ့ဖြိုးတိုးတက်မှု လည်ပတ်မှုတွင် မမှန်ကန်မှုများကို စောင့်ကြည့်မိမိ ရှာဖွေမည်**
- **အသင်းအဖွဲ့ပတ်ဝန်းကျင်တွင် လုံခြုံစိတ်ချစွာပူးပေါင်းဆောင်ရွက်မည်**
- **မဆိုးရွားမှုရှိစေရန် နည်းလမ်းအတိုင်း deploy လုပ်မည်**

အထူးသဖြင့် အောက်ပါအချိန်များတွင် အသုံးဝင်သည်-
- ဆင်တူစီမံခန့်ခွဲမှု များစွာပါဝင်သည့် ဝန်ဆောင်မှုများကို လုပ်ကိုင်ရာ
- ထုတ်လုပ်မှု အင်ဖရာစရုပ်တွင် ပြင်ဆင်မှုများ ပြုလုပ်ရာ
- PR လက်မှတ်ပြုမဆုံးမီ မော်ဒယ်ပြင်ဆင်မှုများကို အတည်ပြုရာ
- အင်ဖရာစရုပ် နမူနာပုံစံများ အပေါ် အသင်းအဖွဲ့ဝင်အသစ်များ သင်ကြားပေးရာ

### နမူနာကြိုကြည့်ချက် ထွက်ရှိမှု
တိကျသည့် ကြိုကြည့်မှုထွက်ရှိမှုသည် ပေးသွင်းသူနှင့် ပရောဂျက်ပုံစံဖြစ်မှုအပေါ်မူတည်သော်လည်း၊ ရလဒ်သည် အကြောင်းပြချက်များကို သေချာ ဖော်ပြပေးသင့်သည်။

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

## �🔄 အရင်းအမြစ် ပြင်ဆင်မှုများနှင့် မိုင်ဂရိတ်များ

### လုံခြုံသော အရင်းအမြစ် ပြင်ဆင်မှုများ
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

### ဒေတာဘေ့စ် မိုင်ဂရိတ်များ
**မပြီးပြည့်စုံသေးသော တင်သွင်းရေးသဘောထား (deployment-script) ပုံစံ:** လိုအပ်သောနေရာများတွင် အသုံးပြုသူ-သတ်မှတ်ထားသော အိုင်ဒင်တီးတီဖွဲ့စည်းထားရမည်၊ တွေ့ဆုံမှုရှိသော Azure CLI runtime လိုအပ်သည်၊ အသုံးပြုနိုင်သော မိုင်ဂရိတ်ကိရိယာများ ရှိထားရမည်၊ မိုင်ဂရိတ်ဖိုင်/ဖိုင်စီမံခန့်ခွဲမှု ထောက်ပံ့ထားရမည်၊ ဒေတာဘေ့စ်ချိတ်ဆက်မှုရှိရမည်။ ဤအရာသည် တင်သွင်းချက် template ထဲသို့ ထည့်သွင်းခြင်းဖြင့် တစ်ကိုယ်ရေ တက်ဆင်နိုင်သည့် script မဟုတ်ပါ။

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

## 🎯 အကောင်းဆုံးလေ့လာမှုများ

### ၁။ အရင်းအမြစ် နာမည်ပုံစံများ
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### ၂။ တက်ကြွမှု အကြံပြုနည်း
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

### ၃။ ပါရာမီတာ စစ်ဆေးခြင်း
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

### ၄။ ထွက်ရှိမှု စီမံခန့်ခွဲမှု
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

## နောက်ဆက်တွဲခြေလှမ်းများ

- [တင်သွင်းမှုမပြုမီ စီမံချက်ရေးဆွဲခြင်း](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် ရရှိနိုင်မှု အတည်ပြုခြင်း
- [လူသိများသော ပြဿနာများ](../chapter-07-troubleshooting/common-issues.md) - အင်ဖရာစရုပ်ပြဿနာများ ဖြေရှင်းခြင်း
- [အမှားရှာဖွေရေးလမ်းညွှန်](../chapter-07-troubleshooting/debugging.md) - Provisioning ပြဿနာများကို ဖြေရှင်းပါ
- [SKU ရွေးချယ်ခြင်း](../chapter-06-pre-deployment/sku-selection.md) - သင့်တော်သော service tier များကို ရွေးပါ

## အပိုဆောင်း အရင်းအမြစ်များ

- [Azure Bicep စာတမ်းများ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**သွားလာရေး**
- **ယခင် သင်ခန်းစာ**: [Deployment များအတွက် လမ်းညွှန်](deployment-guide.md)
- **နောက်တမ်း သင်ခန်းစာ**: [စွမ်းဆောင်ရည် စီမံကိန်း](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD உடன் அசுர் வளங்களை வழங்குதல்

**அத்தியாயம் வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பத்திற்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - குறியீட்டாகும் போர்மோ மற்றும் அமல்படுத்தல்
- **⬅️ முந்தையது**: [அமல்படுத்தல் கையேடு](deployment-guide.md)
- **➡️ அடுத்த அத்தியாயம்**: [அத்தியாயம் 5: பன்முக ஏஜென்ட் செயற்கை நுண்ணறிவு தீர்வுகள்](../../examples/retail-scenario.md)
- **🔧 தொடர்புடையவை**: [அத்தியாயம் 6: முன்-அமல்படுத்தல் பரிசோதனை](../chapter-06-pre-deployment/capacity-planning.md)

## அறிமுகம்

இந்த கையேடு Azure Developer CLI மற்றும் அதற்கான உள்ளமைக்கப்பட்ட Bicep மற்றும் Terraform வழங்குநர்களைப் பயன்படுத்தி Azure வளங்களை வழங்கல் மற்றும் நிர்வகிப்பதை உள்ளடக்கியது.

> `azd 1.37.2`வின் அடிப்படையில் மதிப்பாய்வு செய்யப்பட்டது (நவம்பர் 2026). வேறோகு குறிப்பிடப்பட்டிராத வரை, Bicep, Terraform மற்றும் ஸ்கிரிப்ட் எடுத்துக்காட்டுகள் **காணொளி துணுக்குகள்** ஆகும், முழுமையான வார்ப்புரு அல்ல. அவை குறிப்பிட்ட அளவுருக்கள், தொகுதிகள், அடையாளங்கள், நெட்வொர்க்கிங் மற்றும் விண்ணப்பக் குறியீட்டை வழங்கும் திட்டத்தில் இணைக்கப்பட வேண்டும். இந்த மதிப்பாய்வில் Azure வழங்கல் இயக்கப்படவில்லை.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியைக் முடிப்பதன் மூலம், நீங்கள்:
- இன்ஃபிராஸ்ட்ரக்சர் ஆக்ஸ் கோட்ஸ் கொள்கைகளை மற்றும் Azure வள ஒதுக்கீட்டை தேர்ச்சி பெறுவீர்கள்
- Azure Developer CLI ஆதரிக்கும் பல IaC வழங்குநர்களைப் புரிந்துகொள்ளலாம்
- பொதுவான பயன்பாட்டு கட்டமைப்புகளுக்கான Bicep டெம்ப்ளேட்டுகளை வடிவமைத்து நடைமுறைப்படுத்தல்
- வளங்களின் அளவுருக்கள், மாறிகள், மற்றும் சூழல்-சொந்த கட்டமைப்புகளை கட்டமைத்தல்
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பு உட்பட மிக ileri நிர்மாண வடிவங்களை நடைமுறைப்படுத்தல்
- வளங்களின் வாழ்நாள் மேலாண்மை, புதுப்பிப்புகள், மற்றும் சார்பு தீர்வு நிர்வகித்தல்

## கற்றல் முடிவுகள்

முடிந்தவுடன், நீங்கள் திறன்மிக்கவாறு செய்ய முடியும்:
- Bicep மற்றும் ARM வார்ப்படுத்திகளை பயன்படுத்தி Azure உடையான கட்டமைப்பை வடிவமைத்து வழங்கவும்
- சரியான வள பொருத்தங்களுடன் கூடிய சிக்கலான பன்முக சேவை கட்டமைப்புகளை அமைக்கவும்
- பல சுற்றுச்சூழல் மற்றும் கட்டமைப்புகளுக்கான அளவுருக்கான வார்ப்படுத்திகளை அமல்படுத்தவும்
- கட்டமைப்பு வழங்கல் பிரச்சினைகளை கண்டறிந்து, மடியுதவிகள் தோல்விகளை சரி செய்யவும்
- Azure நன்கு வடிவமைக்கப்பட்ட கட்டமைப்பு கட்டளைகளை உள்ளமை கட்டமைப்புக்கு அமல்படுத்தவும்
- கட்டமைப்பு புதுப்பிப்புகளை நிர்வகித்து, கட்டமைப்பு பதிப்பு நுட்பங்களை அமல்படுத்தவும்

## கட்டமைப்பு வழங்கல் மேலோட்டம்

Azure Developer CLI பல கட்டமைப்பு குறியாக்க (IaC) வழங்குநர்களை ஆதரிக்கிறது:
- **Bicep** (பரிந்துரைக்கப்பட்டது) - Azure இன் பகுபடுத்துவதற்கான மொழி
- **ARM வார்ப்படுத்திகள்** - Bicep ARM ஆக ஒப்பிடுகிறது; புழு ARM JSON தனித்துவமான கட்டமைப்புலகில் இல்லை `infra.provider`
- **Terraform** - பன்முக மெகா மேகம் கட்டமைப்பு கருவி
- **நீட்டிப்பு வழங்குநர்கள்** - தனித்து நிறுவிய வழங்குநர் நீட்டிப்பும் அதனுடைய ஆவணப்படுத்தப்பட்ட கட்டமைப்பும் தேவை; எந்த வழங்குநர் சரத்தின் ஆதரவு உள்ளது என்று கருத வேண்டாம்

## Azure வளங்களை புரிந்துகொள்ளல்

### வள வரிசை நிலை
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### பயன்பாடுகளுக்கான பொது அசூர் சேவைகள்
- **கணினி**: அணுகல் சேவை, கன்டெய்னர் செயலிகள், செயல்பாடுகள், கற்பனை இயந்திரங்கள்
- **சேமிப்பு**: சேமிப்பு கணக்கு, கோஸ்மோஸ் ڈیபி, SQL தரவுத்தளம், போஸ்ட்கிரெஸ்SQL
- **பிணைய அமைப்பு**: கற்பனை பிணையம், பயன்பாடு வாயில், CDN
- **பாதுகாப்பு**: விசை மடக்கு, பயன்பாடு பார்வையாளர், பதிவு பகுப்பாய்வு
- **ஏஐ/எம்எல்**: அசூர் ஏஐ சேவைகள், அசூர் OpenAI, அசூர் இயந்திரக் கற்றல்

## பைசெப் அமைப்பு வார்ப்புருக்கள்

### அடிப்படை பைசெப் வார்ப்புரு அமைப்பு
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

முழுமையான azd திட்டத்திற்கு, குறிச்சொல்லுடன் குறி செய்யப்பட்ட வளக்குழுவை உருவாக்கி அதனுடைய பரப்பளவை அனுப்பும் சந்தா-அளவிலான `infra/main.bicep` இல் இருந்து இந்த தொகுதியை அழைக்கவும். `main.parameters.json` இல் `environmentName`/`location` உடன் பொருந்துங்கள். `azd-service-name: web` குறிச்சொல் வளத்தை `services.web` உடன் இணைக்கிறது; தற்செயல் வெளியீட்டு பெயர்கள் சேவை கண்டறிதலை அமைக்காது.

### மேம்பட்ட பைசெப் வடிவங்கள்

#### தொகுதிப்பொருள் அமைப்பு
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

#### நிபந்தனையான வள உருவாக்கம்
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

## 🌐 azd உடன் Terraform பயன்படுத்துதல்

பைசெப் azd இன் இயல்புநிலை, ஆனால் azd **Terraform**-ஐவும் ஆதரிக்கிறது—உங்கள் குழு இதை ஏற்கனவே நிலையானதாக ஆகச் செய்கிறது அல்லது நீங்கள் பன்முக மேக கருவிகளை நிர்வகிக்கிறீர்கள் என்றால் பயனுள்ளதாகும். azd பணிப் பருவம் (`azd up`, `azd provision`, `azd down`) ஒரே மாதிரிதான்; மட்டுமே கட்டமைப்பு மொழியும் கோப்புறை அமைப்பும் மாறும்.

### azd க்கு Terraform பயன்படுத்த சொல்

Terraform வழங்குநரை குறிக்கும் `infra` பகுதியை `azure.yaml` இல் சேர்க்கவும்:

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

### Terraform கோப்புறை அமைப்பு

Terraform வழங்குநரைப் பயன்படுத்தி, உங்கள் `infra/` கோப்புறை Bicep இற்கு பதிலாக `.tf` கோப்புக்களைப் பயன்படுத்துகிறது:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ஒரு `main.tf` துணுக்குகள்

இதைன் மூலம் மட்டும் ஒரு வளக் குழு மற்றும் திட்டம் உருவாகிறது, கோப்பிடக்கூடிய சேவை அல்ல. நீங்கள் காத்து உள்ளீட்டு மாறிகளை, பொருத்தமான `azurerm` வழங்குநரை, வலை செயலி மற்றும் அதன் சேவை குறிச்சொல்/வளம்-பெயர் வரைபடத்தை கணக்கெடுக்க வேண்டும்.

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

### azd எப்படி உங்கள் Terraform வெளியீடுகளுடன் இணைகிறது

azd Terraform **வெளியீடுகளைக்** சூழல் மதிப்பீடுகளாக வாசிக்கிறது. இந்த துணுக்குகள் நீங்கள் `azurerm_linux_web_app.web` வரையறுத்திருக்க வேண்டும் என்று தெரிகிறது; சேவை கண்டறிதல் இன்னும் பொருந்தும் வள பெயர் அல்லது `azd-service-name` குறிச்சொல் தேவை:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **மிகவும் முக்கியம்:** azd வளங்களை சுற்றுச்சூழலுக்கு ஒவ்வொன்றாக கண்காணிக்க `azd-env-name` குறிச்சொல் மற்றும் `AZURE_*` வெளியீடுகளைப் பயன்படுத்துகிறது. எப்போதும் உங்கள் வளக் குழுவை `"azd-env-name" = var.environment_name` குறிச்சொல்லுடன் குறிவைக்கவும், அதனால் `azd down` அனைத்தையும் கண்டுபிடித்து அகற்ற முடியும்.

### Terraform உடன் பெயரிடு

கட்டளைகள் Bicep உடன் முற்றிலும் ஒரே மாதிரியானவை:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **முன் நிபந்தனை:** Terraform உங்கள் `PATH` இல் நிறுவப்பட்டிருக்கும் 必要があります. azd Terraform *workflow* ஐ பராமரிக்கிறது, ஆனால் Terraform ஐ நிறுவாது. நிலைமาส்தானத்திற்காக, azd இயல்புநிலைமாக உள்ளூர் நிலைமையைப் பயன்படுத்துகிறது; குழுக்களுக்காக, ஒரு தொலைபார்க்கப்பொருந்திய பின் நிலையையும் அமைக்கவும் (உதாரணமாக, Azure சேமிப்பு பின் நிலையத்தை) `provider.tf` இல் உள்ளமைக்கவும்.

முழுமையான, இயக்கக்கூடிய Terraform அடிப்படையிலான ஸ்டார்டர்களுக்காக, [Awesome AZD கலைகாட்சி](https://azure.github.io/awesome-azd/) ஐ உலாவி, Terraform ஐத் தேர்ந்தெடுக்கவும், அல்லது அதிகாரப்பூர்வமான [azd Terraform ஆவணத்தை](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) காணவும்.

## 🧩 பிற கட்டமைப்பு கருவிகள்

Pulumi azd 1.37.2 இல் இயல்புநிலையிலான சீரமைப்பு வழங்குநர் அல்ல. `infra.provider: pulumi` மட்டும் அமைத்தல் ஒரு செயல்பாட்டுச் சூழலை உருவாக்காது, மேலும் `azd env new` தானாகவே Pulumi ஸ்டாக்கை உருவாக்கவோ/தேர்ந்தெடுக்கவோாது. நீங்கள் வேறு IaC கருவியைப் பயன்படுத்தினால், உறுதிப்படுத்தப்பட்ட வழங்குநர் நீட்டிப்பின் ஆவணங்களைப் பின்பற்றவும் அல்லது அதை உங்கள் சொந்த வேலைநிலையிலே தெளிவாக நிர்வகிக்கவும். இந்த பாடத்திட்டம் Pulumi வழங்குநரை வழங்கவோ சரிபார்க்கவோ செய்யவில்லை.

## 🎯 உங்கள் சேவைக்கு ஓர் ஹோஸ்ட் தேர்வு செய்வது

`azure.yaml` இல் உள்ள `host` புலம் உங்கள் குறியீடு எங்கே இயக்கப்பட வேண்டும் என்பதைக் தீர்மானிக்கிறது. azd பல ஹோஸ்ட்களை ஆதரிக்கிறது—சரியானதை தேர்ந்தெடுப்பது கட்டமைப்பு மொழியைக் காட்டிலும் முக்கியம். இங்கே தொடக்க நண்பருக்கான ஒப்பீடு உள்ளது:

| `host` மதிப்பு | சிறந்தது | ஏன் |
|--------------|----------|-----|
| `appservice` | பாரம்பரிய வலை செயலிகள் மற்றும் API-கள் | எளிய PaaS; கொண்டெய்னர்கள் தேவையில்லை |
| `staticwebapp` | முன் முனை SPAs (React, Vue, Angular) | உலகளாவிய CDN + இலவச SSL, உள்ளமைக்கப்பட்ட API ஆதரவு |
| `function` | நிகழ்வு-திருப்பப்பட்ட மற்றும் சர்வர் இல்லாத வேலைப்பளுக்கள் | பூஜ்யத்திற்கு அளவுரு, செயல்படும் போது மட்டும் கட்டணம் செலுத்தவும் |
| `containerapp` | கொண்டெய்னர் செய்யப்பட்ட சிறிய சேவைகள் | சர்வர்-இல்லா கொண்டெய்னர்கள், பூஜ்யத்திற்கு அளவுரு, உள்ளமைக்கப்பட்ட இன்ப்ரெஸ்ஸு |
| `aks` | சிக்கலான ஒர்கெஸ்ட்ரேஷன் தேவைகள் | நீங்கள் உண்மையில் தேவைப்படும் போது முழு Kubernetes கட்டுப்பாடு |
| `springapp` | உள்ள Azure Spring Apps நிலைபாடுகள் | பழைய இலக்கு; சேவை மார்ச் 31, 2028 அன்று ஓர் முடிவுக்கு வருகிறது மற்றும் புதிய 고객்களுக்கு மூடப்பட்டுள்ளது |

### எப்போது AKS-க்கு அணுக வேண்டும்

**Azure Kubernetes Service (`host: aks`)** உங்களுக்கு கன்ட்ரோலர்கள், சேவை மெஷ்கள், சிக்கலான நெட்வொர்க்கிங் மற்றும் சிறு அளவிலான நிர்வாகம் ஆகியவற்றுடன் கூடிய Kubernetes முழு வலிமையை அளிக்கிறது. அந்த வலிமை செயல் மேலாண்மை சுமையை கூட்டுகிறது: நீங்கள் நோட் பூல்ஸ், மேம்படுத்தல்கள் மற்றும் கிளัส்டர் நெட்வொர்க்கிங் ஆகியவற்றை மேலாண்மை செய்கிறீர்கள்.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **சரியானதும் எளிமையானதுமாக தொடங்குங்கள்.** பெரும்பாலும் மைக்ரோசேவைகளுக்காக, **Container Apps** கிளஸ்டர் மேலாண்மை இல்லாமல் கண்டெயினர்கள், தானியங்கி அளவுகோல் மற்றும் பூஜ்ஜியம் வரை அளவுகோல் ஆகியவற்றை வழங்குகிறது. Kubernetes-க்கு உட்பட்ட குறிப்பிட்ட வசதிகள் தேவையானபோது மட்டும் AKS தேர்வு செய்யுங்கள்.

### Microsoft Azure Spring Apps எப்போது பயன்படுத்த வேண்டும்

**Azure Spring Apps (`host: springapp`)** Spring Boot க்கான மேலாண்மையுடைய நோக்கம் கொண்ட ரன்டைம் ஆகும். இது சேவை கண்டுபிடித்தல், கன்ஃபிக் சர்வர் மற்றும் பிளூ-கிரீன் மேம்படுத்தலை கையாள்கிறது, ஆகவே ஜாவா குழுக்கள் தங்கள் சொந்த உள்கட்டமைப்பை இயக்குவதில்லை.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> புதிய தொடக்கத்திற்காக Azure Spring Apps ஐ தேர்வு செய்ய வேண்டாம்: அது புதிய வாடிக்கையாளர்களுக்கு மூடப்பட்டது மற்றும் [மார்ச் 31, 2028 அன்று ஓய்வு பெறுகிறது](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Container Apps போன்ற ஆதரிக்கப்பட்ட மாற்றுகளை முன்னுரிமை அளிக்கவும், இருப்பு மையங்களுக்காக இடமாற்றம் திட்டமிடவும்.

## 🗃️ தரவுத்தள ஏற்பாடு

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
**துண்டுத் தேவைகள்:** `@secure() param databasePassword string` ஐ அறிவிக்கவும் மற்றும் ஒரு வலுவான வழங்கப்பட்ட மதிப்பை பயன்படுத்தவும். பொதுப் பயன்படுத்தலை **அல்லது** கீழேயுள்ள பிரதிநிதித்துவப்பட்ட சப்நெட்/பிரைவேட் DNS ஐ இணைக்கவும்; இரண்டு துண்டுகளும் தானாக இணைக்கப்படவில்லை.

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

`0.0.0.0` விதி உங்கள் சொந்த சந்தாதாரரின் அப்பால் உள்ள Azure சேவைகளிலிருந்து இணைப்புகளை அனுமதிக்கிறது. இது தனியார் நெட்வொர்க்கிங் அல்ல; உண்மையான வேலைப்பளுக்கான கட்டுப்படுத்தப்பட்ட நெட்வொர்க்கின் வடிவமைப்பை முன்னுரிமை செய்யுங்கள்.

## 🔒 பாதுகாப்பு மற்றும் இரகசிய மேலாண்மை

### முக்கியவலை ஒருங்கிணைப்பு
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

### கண்காணிக்கப்பட்ட அடையாளம் அமைப்பு
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

ஒரு அமைப்பு-ஒதுக்கப்பட்ட அடையாளத்திற்கு, அதன் பிரதான ஐடியை சேர்க்க `AZURE_CLIENT_ID` கூறாமல் இருக்கவும். ஒரு பயனர்-ஒதுக்கப்பட்ட அடையாளம் அதன் **கிளையன்ட் ஐடி** ஐ பயன்படுத்தும், அதன் பொருள்/பிரதான ஐடி அல்ல. முக்கியவலை இணைப்பு கூடுதலாக செயலியின் அடையாளத்தின் வால்ட் பங்கு மற்றும் நெட்வொர்க் அணுகலை தேவைபடுத்துகிறது.

## 🌍 நெட்வொர்க்கிங் மற்றும் இணைப்பு

### கல்பின நெட்வொர்க் அமைப்பு
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

### SSL உடன் செயல்பாட்டு வாயில்
**நிரப்பியமைப்பு துண்டு முடிவடையவில்லை, வினியோகிக்கக் கூடிய வாயில் அல்ல:** VNetக்கு தனிப்பட்ட `gateway-subnet` சேர்க்கவும் மற்றும் பின்னணி பூல்களை, HTTP அமைப்புக்களை, கேட்டுக்கொள்ளுநர்களை, முன்னுரிமைகள் உடன் வழிசெலுத்தல் விதிகளை, மற்றும் TLS சான்றிதழ் (அல்லது அனுமதிக்கப்பட்ட முக்கியவலைக் குறிப்பு) சேர்க்கவும். 443 போர்டை திறப்பதுதான் HTTPS அமைக்காது.

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

## 📊 கண்காணிப்பு மற்றும் பார்வையிடுதல்

### செயலி தகவல்கள்
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

### தனிப்பயன் அளவுகோல்கள் மற்றும் எச்சரிக்கைகள்
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

## 🔧 சுற்றுப்புற-நிலைமை சார்ந்த அமைப்புகள்

### வேறு-வேறு சுற்றுச்சூழல்களுக்கு அளவுரு கோப்புகள்
கீழ்க்கண்ட இரண்டு கோப்புகள் **வழி அளவுரு கோப்புகளுக்கான எடுத்துக்காட்டுகள்**. azd சுற்றுவட்டாரப் பெயரின் அடிப்படையில் `main.parameters.dev.json` அல்லது `main.parameters.prod.json` ஐ தானாக தேர்வு செய்யாது. உண்மையான `main.parameters.json` ஐ சுற்றுச்சூழல் மாற்றுகளுடன் பயன்படுத்தவும் (உதாரணமாக `${APP_SERVICE_SKU=B1}`), மற்றும் ஒவ்வொரு அளவுருவும் பைசெப்பில் அறிவிக்கவும்/சாப்பிடவும்.

`infra/main.parameters.dev.json` க்கான எடுத்துக்காட்டு உள்ளடக்கம்:

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

`infra/main.parameters.prod.json` க்கான எடுத்துக்காட்டு உள்ளடக்கம்:

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

### நிபந்தனை அடிப்படையிலான வள உற்பத்தி
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

## 🚀 முன்னேற்றப்படுத்தப்பட்ட வள உருவாக்க அதன் மாதிரிகள்

### பன்முக பிரதேச பரவல்
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

### உள்கட்டமைப்பு சோதனை
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

அடுக்கு முனைவகம் உங்கள் பயன்பாட்டு குறியீட்டை பதியவில்லை. பயன்பாட்டு சோதனைகளை `azd deploy`/`azd up` கடந்த பிறகு மட்டும் இயக்கவும், உங்கள் பயன்பாடு அதை நடைமுறைப்படுத்தினால் மட்டுமே `/health` ஐப் பயன்படுத்தவும். ARM அடுக்கு முனைவகம் ஸ்கிரிப்ட்கள் Azure வளங்களை உருவாக்கி கூடுதல் அடையாளம், ஆதரவு கால ஓட்டம் பதிப்புகள் மற்றும் அனுமதிகளை தேவைப் படுத்துகின்றன; அவை உள்ளூர் அலகுநிரல் சோதனைகள் அல்ல.

## 🧪 அடுக்கு மஞ்சரி முன்னோட்டம் மற்றும் சரிபார்ப்பு (புதியது)

### தேவையான அடுக்கு மாற்றங்களை முன்பே பார்வையிடுக

`azd provision --preview` அம்சம் வள முனைவகத்தை **உண்மையில் வளங்களை பதிப்பதற்கு முன் மாதிரிப்படுத்த** உங்களை அனுமதிக்கிறது. இது `terraform plan` அல்லது `bicep what-if` போலவே செயல்படுகிறது, உங்கள் Azure சுற்றுச்சூழலை மாற்றவேண்டியதை **உலர்ந்த இயக்கம் பார்வை**வின் மூலம் காட்டுகிறது.

#### 🛠️ இதன் செயல்பாடு
- உங்கள் IaC வார்ப்புருக்களைக் **பரிசீலிக்கிறது** (Bicep அல்லது Terraform)
- உவமை மாற்றங்களை முன்னோட்டமாக **காட்டுகிறது**: சேர்க்கைகள், நீக்கமைகள், புதுப்பிப்புகள்
- **வழங்குனரின் பரிந்துரைக்கப்பட்ட வள மாற்றங்களை பயனில் இல்லை** — முதலில் திட்ட இணைப்புகளை ஆய்வு செய்க; ஸ்கிரிப்ட்கள் பக்க விளைவுகளை உண்டாக்கலாம் மற்றும் முன்னோட்டம் Azure அனுமதிகளையும் தேவைபடுத்தும்

#### பயன்பாடுகள்
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

இந்த கட்டளை உதவுகிறது:
- வள மாற்றங்களை **உறுதி செய்ய** பதிபதிப்பதற்கு முன்
- **தவறான அமைப்புகளை முன்னேற்பாடு வட்டாரத்தில் பிடிக்க** விரைவில்
- **அணிச் சூழல் பாதுகாப்புடன் ஒத்துழைப்பு** செய்ய
- **கிடைக்கும் அனுமதிகள் குறைந்தபட்சம் இருப்பதை உறுதி** செய்வதில்

இது குறிப்பாக பயனுள்ளது:
- சிக்கலான பல சேவைச் சூழல்களுடன் வேலை செய்வது
- உற்பத்தி அடுக்கு மாற்றங்களை செய்வது
- PR ஒப்புதலைக்குத் Templates மாற்றங்களை உறுதி செய்தல்
- அடுக்கு முறைபாடுகளில் புதிய குழு உறுப்பினர்களுக்கு பயிற்சி அளித்தல்

### முன்னோட்ட வெளியீடு உதாரணம்
சரியான முன்னோட்ட வெளியீடு வழங்குநரின் மற்றும் திட்ட அமைப்பின் அடிப்படையில் மாறுபடும், ஆனால் முடிவு எந்த மாற்றங்கள் செய்யப்பட உள்ளன என்பதை தெளிவாக காண்பிக்க வேண்டும்.

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

## �🔄 வள புதுப்பிப்புகள் மற்றும் இடமாற்றங்கள்

### பாதுகாப்பான வள புதுப்பிப்புகள்
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

### தரவுத்தள இடமாற்றங்கள்
**விரிவாக்கும் நிரல் மாதிரி முற்றுமுழுக்க இல்லை:** தேவையான இடங்களில் கண்காணிக்கப்பட்ட பயனர்-ஒதுக்கப்பட்ட அடையாளத்தை, ஆதரவு Azure CLI ஓட்ட நேரத்தை, கிடைக்கும் இடமாற்று கருவிகள், வழங்கப்பட்ட இடமாற்று அடைவு/கட்டமைப்பு மற்றும் தரவுத்தள இணைப்பை தேவைப்படுத்துகிறது. இது ஒரு வார்ப்புருவில் மட்டும் உள்ளடக்கப்பட்டால் இயங்காது.

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

## 🎯 சிறந்த நடைமுறைகள்

### 1. வள பெயரிடல் நடைமுறைகள்
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. குறிச்செயல் மூலோபாயம்
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

### 3. அளவுரு சரிபார்ப்பு
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

### 4. வெளியீடு ஒழுங்கமைப்பு
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

## அடுத்த படிகள்

- [முன்-பதிவேற்று திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - வள கிடைக்கும் நிலையை சரிபார்க்கவும்
- [பொதுவான பிரச்சனைகள்](../chapter-07-troubleshooting/common-issues.md) - அடுக்கு தொடர்பான சிக்கல்களை சரி பார்
- [பிழைதிருத்துவது குறித்த வழிகாட்டி](../chapter-07-troubleshooting/debugging.md) - மாற்றுத்திறன் பிரச்சினைகளை பிழைதிருத்துதல்
- [SKU தேர்வு](../chapter-06-pre-deployment/sku-selection.md) - பொருத்தமான சேவை அளவுகளை தேர்வு செய்தல்

## கூடுதல் ஆதாரங்கள்

- [அசுர் பைசெப் ஆவணங்கள்](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [அசுர் வள மேலாளர் வார்ப்புருக்கள்](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [அசுர் கட்டமைப்பு மையம்](https://learn.microsoft.com/en-us/azure/architecture/)
- [அசுர் நன்கு-கட்டமைக்கப்பட்ட கட்டமைப்பு](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**நெவிகேஷன்**
- **முந்தைய பாடம்**: [பரப்புகை வழிகாட்டி](deployment-guide.md)
- **அடுத்த பாடம்**: [திறன் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
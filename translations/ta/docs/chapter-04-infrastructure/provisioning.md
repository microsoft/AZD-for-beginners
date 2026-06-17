# AZD-ஐ கொண்டு Azure வளங்களை Provision செய்தல்

**அத்தியாய பயன்பாட்டு வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 4 - குறியீட்டுள்ளே உள்கட்டமைப்பு மற்றும் 배deploy செயல்
- **⬅️ முந்தையது**: [Deployment Guide](deployment-guide.md)
- **➡️ அடுத்த அத்தியாயம்**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 தொடர்புடையது**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI மூலம் Azure வளங்களை provision மற்றும் நிர்வகிப்பதில் தேவையான அனைத்தையும் கற்பிக்கிறது. Bicep, ARM டெம்ப்ளேடுகள், Terraform மற்றும் Pulumi ஆகியவற்றைப் பயன்படுத்தி அடிப்படையான வள உருவாக்கத்திலிருந்து மேம்பட்ட நிறுவன மட்டத் தலைமை கட்டமைப்புகள் வரை Infrastructure as Code (IaC) முறைமைகளை செயல்படுத்த கற்றுக்கொள்ளுங்கள்.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடித்தவுடன், நீங்கள்:
- Infrastructure as Code கொள்கைகளையும் Azure வள provision கற்றலையும் ஆற்றுவீர்கள்
- Azure Developer CLI மூலம் ஆதரிக்கப்படும் பல IaC வழங்குநர்களைக் புரிந்துகொள்ள்வீர்கள்
- பொதுவான பயன்பாட்டு கட்டமைப்புகளுக்காக Bicep டெம்ப்ளேட்டுகளை வடிவமைத்து செயல்படுத்துவீர்கள்
- வளமான அளவுருக்கள், மாறிலிகள் மற்றும் சூழல்-சார்ந்த அமைப்புகளை கட்டமைக்கிறீர்கள்
- நெட்வொர்க்கிங் மற்றும் பாதுகாப்பு உட்பட மேம்பட்ட கட்டமைப்பு மாதிரிகளை செயல்படுத்துவீர்கள்
- வளத்தின் வாழ்க்கைசுழற்சி, புதுப்பிப்புகள் மற்றும் சார்பு தீர்மானிப்பை நிர்வகிப்பீர்கள்

## கற்றல் வெளியீடுகள்

முடித்தவுடன், நீங்கள் செய்யக்கூடியவை:
- Bicep மற்றும் ARM டெம்ப்ளேடுகளைப் பயன்படுத்தி Azure கட்டமைப்புகளை வடிவமைத்து provision செய்யும் திறன்
- சரியான வள சார்புகள் உடன் பல-சேவை கட்டமைப்புகளை அமைக்கும் திறன்
- பல சூழல்கள் மற்றும் கட்டமைப்புகளுக்காக அளவுருக்கப்பட்ட டெம்ப்ளேட்டுகளை செயல்படுத்தும் திறன்
- கட்டமைப்பு provisioning பிரச்சினைகளைத் துறைசெய்தல் மற்றும் deployment தோல்விகளை தீர்க்கும் திறன்
- கட்டமைப்பு வடிவமைப்புக்கு Azure Well-Architected Framework கொள்கைகளைப் பயன்படுத்தும் திறன்
- கட்டமைப்பு புதுப்பிப்புகளை நிர்வகித்து கட்டமைப்பு பதிப்பான்மைகளை செயல்படுத்தும் திறன்

## Infrastructure Provisioning மேலோட்டம்

Azure Developer CLI பல Infrastructure as Code (IaC) வழங்குநர்களை ஆதரிக்கிறது:
- **Bicep** (பரிந்துரை) - Azure இன் domain-specific மொழி
- **ARM Templates** - JSON அடிப்படையிலான Azure Resource Manager டெம்ப்ளேடுகள்
- **Terraform** - பல-மேக கட்டமைப்பு கருவி
- **Pulumi** - ஆன்டமான நிரலாக்க மொழிகளுடன் நவீன Infra-as-Code

## Azure வளங்களைப் புரிந்துகொள்வது

### வள வரிசை
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### பயன்பாடுகளுக்கான பொதுவான Azure சேவைகள்
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep கட்டமைப்பு டெம்ப்ளேடுகள்

### அடிப்படை Bicep டெம்ப்ளேட் அமைப்பு
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

### மேம்பட்ட Bicep மாதிரிகள்

#### மாடுலார் கட்டமைப்பு
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

#### நிபந்தனைபூர்வ வள உருவாக்கம்
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

Bicep என்பது azd-இன் இயல்புநிலை, ஆனால் azd **Terraform**-ஐவும் ஆதரிக்கிறது — உங்கள் குழு ஏற்கனவே அதனை நிலையானதாக கொண்டிருந்தால் அல்லது நீங்கள் பல-மேக கட்டமைப்புகளை நிர்வகிப்பின் போது பயன்படுகிறது. azd வேலைபாட்டு (`azd up`, `azd provision`, `azd down`) ஒரே மாதிரி தான்; வெறும் infrastructure மொழியும் கோப்புறைக் கட்டமைப்பும் மாறும்.

### azd-ஐ Terraform பயன்படுத்தச் சொல்லுதல்

Terraform provider-ஐ குறிப்பிட்டு `azure.yaml` இல் `infra` பகுதியை சேர்க்கவும்:

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

### Terraform கோப்பு அமைப்பு

Terraform provider பயன்படுத்தும் போது, உங்கள் `infra/` கோப்புறையில் Bicep-இன் பதிலாக `.tf` கோப்புகள் பயன்படுகிறது:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### குறைந்தபட்ச `main.tf`

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

### azd உங்கள் Terraform வெளியீடுகளுடன் எப்படி இணைகிறது

azd உங்கள் endpoints-ஐ அறிந்து கொள்ளவும் மற்றும் சூழல் மதிப்புகளை உங்கள் பயன்பாட்டுக்குள் திரும்ப வைக்க Terraform **வெளியீடுகள்**-ஐ படிக்கிறது. வெளியீடு பெயர்கள் முக்கியம் — azd குறிப்பிட்டவைகளைத் தேடுகிறது:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **முக்கியம்:** azd `azd-env-name` tag மற்றும் `AZURE_*` வெளியீடுகளை சூழல் வாரியாக வளங்களை கண்காணிக்க பயன்படுத்துகிறது. எப்போதும் உங்கள் resource group-ஐ `"azd-env-name" = var.environment_name` என tag செய்யுங்கள், அப்படியே `azd down` அனைத்தையும் கண்டுபிடித்து அகற்ற முடியும்.

### Terraform-ஐ கொண்டு deploy செய்தல்

கட்டளைகள் Bicep உடையவையே நேர்மையாகப் பயன்படுகின்றன:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd பின்னணியில் 'terraform plan' ஐ இயக்குகிறது
azd up                    # வழங்குதல் + நிறுவுதல்
azd down --force          # Terraform மூலம் நிர்வகிக்கப்படும் வளங்களை அழிக்கிறது
```

> **முன்நிலைத் தேவைகள்:** Terraform உங்கள் இயங்குதளத்தில் நிறுவப்பட்டு உங்கள் `PATH`-இல் இருக்க வேண்டும். azd Terraform *workflow*-ஐ நிர்வகிக்கின்றது ஆனால் Terraform-ஐ உங்கள் இடத்தில் நிறுவாது. state-க்காக, azd இயல்பாக local state-ஐ பயன்படுத்தும்; குழுக்களுக்காக, `provider.tf` இல் ஒரு remote backend (உதாரணத்திற்கு, Azure Storage backend) அமைக்கவும்.

 முழுமையாக இயங்கக்கூடிய Terraform-அடிப்படையிலான starters-ஐப் பார்வையிட, [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ஐ உலாவி Terraform-ஐ filter செய்யவோ, அல்லது அதிகாரப்பூர்வ [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) காணவோ செய்யுங்கள்.

## 🧩 azd உடன் Pulumi பயன்படுத்துதல்

உங்கள் குழு ஒரு domain-specific மொழியினைப் முழுக்க பயன்படுத்துவதற்கு பதிலாக பொதுவான நிரலாக்க மொழிகளில் (TypeScript, Python, Go, அல்லது C#) கட்டமைப்புகளை எழுதினால், azd **Pulumi**-ஐவும் ஆதரிக்கிறது. Terraform போலவே, `azd up` / `azd provision` / `azd down` வேலைபாடு மாற்றமில்லாது இருக்கும் — வெறும் infrastructure கருவி மற்றும் கோப்புறைக் கட்டமைப்பு மாறும்.

### azd-ஐ Pulumi பயன்படுத்தச் சொல்லுதல்

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

### Pulumi கோப்பு அமைப்பு

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### குறைந்தபட்ச `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// ஒவ்வொரு வளத்தையும் azd அவற்றை கண்காணித்து நீக்கமுடியுமாறு குறிச்சொல்லிடுங்கள்
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd இந்த வெளியீடுகளை உங்கள் சூழலுக்குள் மீண்டும் வாசிக்கிறது
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### ஸ்டேக்கள் azd சூழல்களுக்கு பொருந்தும்

Pulumi தன்னுடைய deployments-ஐ **stacks** ஆக ஒழுங்குபடுத்துகிறது, மற்றும் azd ஒவ்வொரு azd சூழலையும் அதே பெயருடைய Pulumi stack-க்கு வரைபடமிடுகிறது. நீங்கள் `azd env new staging` இயக்கும் போது, azd `staging` Pulumi stack-ஐ தேர்வு (அல்லது உருவாக்கம்) செய்கிறது. அதே `azd-env-name` tagging மற்றும் `AZURE_*` வெளியீடு விதிகள் பொருந்தும், ஆகவே `azd down` அனைத்தையும் கண்டுபிடித்து அகற்ற முடியும்.

### Pulumi-ஐ கொண்டு deploy செய்தல்

```bash
azd auth login
azd env new dev
azd provision --preview   # azd பின்னணியில் 'pulumi preview' ஐ இயக்குகிறது
azd up                    # வழங்குதல் + நிறுவுதல்
azd down --force          # 'pulumi destroy' ஐ இயக்குகிறது
```

> **முன்நிலைத் தேவைகள்:** Pulumi உங்கள் இயங்குதளத்தில் நிறுவப்பட்டு `PATH`-இல் இருக்க வேண்டும், மற்றும் உங்களுக்கு ஒரு state backend (Pulumi Cloud அல்லது Azure Blob Storage போன்ற ஒரு self-managed backend) தேவையாகும். azd Pulumi *workflow*-ஐ நிர்வகிக்கின்றது, நிறுவலை அல்ல. அதிகாரப்பூர்வ [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) ஐ காணவும்.

## 🎯 உங்கள் சேவைக்கான ஹோஸ்டை தேர்வு செய்தல்

`azure.yaml` இல் உள்ள `host` புலம் உங்கள் கோடு எங்கு இயங்கும் என்பதை தீர்மானிக்கிறது. azd பல ஹோஸ்ட் வகைகளை ஆதரிக்கிறது — சரியானதை தேர்வு செய்வது infrastructure மொழியைவிட முக்கியம். இங்கே ஆரம்பக்கல்வி பயனாளிக்கு ஏற்ற ஒப்பீடு:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | பாரம்பரிய வலைப் பயன்பாடுகள் மற்றும் APIs | எளிதான PaaS; கன்டெய்னர்கள் தேவையில்லை |
| `staticwebapp` | முன்-முகவமைப்பு SPAs (React, Vue, Angular) | குளோபல் CDN + இலவச SSL, உட்பட்ட API ஆதரவு |
| `function` | நிகழ்வு சார்ந்த மற்றும் சர்வர்லெஸ் வேலைபாடுகள் | மாபெரும்-இல்லை வரை குடுக்கல், ஒவ்வொன்றுக்குமான கட்டணம் |
| `containerapp` | கன்டெய்னரைஸ் செய்யப்பட்ட மைக்ரோசேவைகள் | சர்வர்லெஸ் கன்டெய்னர்கள், ஸ்கேல்-டூ-ஜீரோ, உட்பட்ட ingress |
| `aks` | சிக்கலான ஒchestrேஷன் தேவைகள் | நீங்கள் உண்மையாகவே அவசியமுள்ளபோது முழு Kubernetes கட்டுப்பாடு |
| `springapp` | Java Spring Boot பயன்பாடுகள் | Spring-க்கு சிறப்பாக துருவிக்கப்பட்ட நிர்வகிக்கப்படும் Azure Spring Apps runtime |

### AKS-இடத்திற்கு எப்போது உள்ளீடு செய்யவேண்டும்

**Azure Kubernetes Service (`host: aks`)** உங்கள் Kubernetes-ன் முழு சக்தியையும் வழங்குகிறது — தனிப்பட்ட controllers, சேவை மெஷ்கள், சிக்கலான நெட்வொர்க்கிங் மற்றும் நுணுக்கமான திட்டமிடல். இந்த சக்தி இயக்க மேலாண்மை பொறுப்போடு வருகிறது: நீங்கள் node pools, upgrades மற்றும் கிளஸ்டர் நெட்வொர்க்கிங்கை நிர்வகிக்க வேண்டும்.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **முடிந்தால் எளிமையாக தொடங்குங்கள்.** பெரும்பாலான மைக்ரோசேவைகளுக்கு, **Container Apps** நீங்கள் கிளஸ்டரை நிர்வகிக்காமல் கன்டெய்னர்கள், ஆட்டோஸ்கேலிங் மற்றும் ஸ்கேல்-டூ-ஜீரோ ஆகியவற்றை தருகிறது. Kubernetes-சார் சிறப்பு அவசியம் ஏற்பட்டாலேயே AKS தேர்வு செய்யுங்கள்.

### Azure Spring Apps-ஐ 언제 பயன்படுத்த வேண்டும்

**Azure Spring Apps (`host: springapp`)** Spring Boot க்காக சிறப்பாக வடிவமைக்கப்பட்ட ஒரு நிர்வகிக்கப்படும் runtime ஆகும். இது சேவை கண்டுபிடிப்பு, config server மற்றும் blue-green deployment போன்றவற்றை கையாளும், பின்னர் Java குழுக்கள் தங்கள் சொந்த கட்டமைப்புகளை நடத்த வேண்டாம்.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> நீங்கள் ஏற்கனவே உள்ள Spring Boot பயன்பாடுகளைக் கொண்டிருந்தால் மேலும் அவற்றுக்காக உகந்த runtime தேவைப்படுமானால் `springapp`-ஐப் பயன்படுத்தவும். Spring-சார் தேவைகள் இல்லாத புதிய கன்டெய்னரைஸ்டு Java பயன்பாடுகளுக்காக `containerapp` பெரும்பாலும் எளிதான தேர்வாக இருக்கும்.

## 🗃️ தரவுத்தள Provision செய்தல்

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

## 🔒 பாதுகாப்பு மற்றும் ரகசியக் கையாளுதல்

### Key Vault ஒருங்கிணைப்பு
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

### Managed Identity அமைப்பு
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

## 🌍 நெட்வொர்க்கிங் மற்றும் இணைப்பு

### Virtual Network கட்டமைப்பு
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

### SSL உடன் Application Gateway
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

## 📊 கண்காணிப்பு மற்றும் கவனித்தல்

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

### சிறப்பு ஜூதங்கள் மற்றும் எச்சரிக்கைகள்
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

## 🔧 சூழல்-சார்ந்த கட்டமைப்புகள்

### வெவ்வேறு சூழல்களுக்கான அளவுரு கோப்புகள்
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

### நிபந்தனைபூர்வ வள provision
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

## 🚀 மேம்பட்ட Provisioning மாதிரிகள்

### பல பிராந்திய விசாரணை Deployment
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

### கட்டமைப்பு சோதனை
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

## 🧪 கட்டமைப்பு முன்னோக்கு & சரிபார்ப்பு (புதியது)

### நிறுவலுக்கு முன் கட்டமைப்பு மாற்றங்களை முன்னோடியாகப் பார்க்குதல்

`azd provision --preview` அம்சம் வளங்களை உண்மையில் deploy செய்வதற்கு முன் **கட்டமைப்பு provision-ஐ மாதிரியாகச் சோதிக்க** அனுமதிக்கிறது. இது `terraform plan` அல்லது `bicep what-if` போன்ற நோக்கத்தில் உள்ளது, உங்கள் Azure சூழலில் என்ன மாற்றங்கள் ஏற்படும் என்பதற்கான **ஒரு ஒலிப்பாடு-இலையொன்றான காட்சி** வழங்குகிறது.

#### 🛠️ இது என்ன செய்கிறது
- **உங்கள் IaC டெம்ப்ளேட்டுகளை பகுப்பாய்வு செய்கிறது** (Bicep அல்லது Terraform)
- **வள மாற்றங்களின் முன்னோட்டத்தை காண்பிக்கிறது**: சேர்ப்பு, நீக்கம், புதுப்பிப்பு
- **மாற்றங்களை பொருந்தாது** — இது படிக்க மட்டுமே; பயன்படுத்துவதற்கு பாதுகாப்பாக உள்ளது

#### பயன்பாட்டு நிலைகள்
```bash
# நிறுவுவதற்கு முன் கட்டமைப்பு மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும்
azd provision --preview

# குறிப்பிட்ட சூழலுக்கான முன்னோட்டம்
azd provision --preview -e production
```

இந்த கட்டளை உங்களுக்கு உதவுகிறது:
- **வள மாற்றங்களை சரிபார்க்க** resources-ஐ commit செய்வதற்கு முன்
- **தவறான அமைப்புகளை முன்னங்கித்து பிடிக்க** மேம்பாட்டு சுற்றளவுகளில்
- **குழு சூழல்களில் பாதுகாப்பாக ஒத்துழைக்க** உதவுவது
- **அதிர்ச்சியற்ற குறைந்த-அதிகாரங்கள் கொண்ட deployments** உறுதி செய்கிறது

இது சிறப்பாக பயன்படும் போது:
- சிக்கலான பல-சேவை சூழல்களுடன் வேலை செய்யும் போது
- உற்பத்தி வளங்களுக்கு மாற்றங்கள் செய்யும் போது
- PR அங்கீகாரத்திற்கு முன் டெம்ப்ளேட் மாற்றங்களை சரிபார்க்கும்போது
- கட்டமைப்பு மாதிரிகளில் புதிய குழு உறுப்பினர்களுக்கு பயிற்சி கொடுத்தல்

### முன்னோட்டக் காட்சி உதாரணம்
குழு மற்றும் திட்டக் கட்டமைப்பின்படி காட்சி மாறுபடும், ஆனால் முடிவு ஏதாவது பொருந்துவதற்காக முன்மொழியப்படும் மாற்றங்களை தெளிவாக அடையாளம் காண வேண்டும்.

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

## �🔄 வளங்கள் புதுப்பிப்புகள் மற்றும் மைக்ரேஷன்கள்

### பாதுகாப்பான வள புதுப்பிப்புகள்
```bash
# முதலில் அடித்தள மாற்றங்களை முன்னோட்டமாகப் பார்க்கவும் (பரிந்துரைக்கப்படுகிறது)
azd provision --preview

# முன்னோட்ட உறுதிப்படுத்தலுக்குப் பிறகு மாற்றங்களை அமல்படுத்தவும்
azd provision --confirm-with-no-prompt

# மீட்டெடுக்கும் நடவடிக்கைக்காக, Gitஐப் பயன்படுத்தி அடித்தள மாற்றங்களை மீட்டெடுக்கவும்:
git revert HEAD  # கடைசிலான அடித்தளக் கமிட்டை மீட்டெடுக்கவும்
azd provision    # முந்தைய அடித்தள நிலையை அமல்படுத்தவும்
```

### தரவுத்தள மைக்ரேஷன்கள்
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

## 🎯 சிறந்த நடைமுறைகள்

### 1. வள பெயரிடும் நடைமுறைகள்
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging நடைமுறை
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

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - வள கிடைத்துவளை சரிபார்த்தல்
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - கட்டமைப்பு பிரச்னைகளை தீர்க்க
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - provisioning பிரச்சினைகளை டீபக் செய்தல்
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - பொருத்தமான சேவை டியர்கள் தேர்வு செய்தல்

## கூடுதல் வளங்கள்

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [Deployment Guide](deployment-guide.md)
- **அடுத்த பாடம்**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
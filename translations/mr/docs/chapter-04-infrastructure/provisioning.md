# AZD सह Azure संसाधने provisioning करणे

**अधायक्रम नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 4 - Infrastructure as Code & Deployment
- **⬅️ मागील**: [Deployment Guide](deployment-guide.md)
- **➡️ पुढील अध्याय**: [अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)
- **🔧 संबंधित**: [अध्याय 6: प्री-डिप्लॉयमेंट व्हॅलिडेशन](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI वापरून Azure संसाधने provisioning आणि व्यवस्थापित करण्याबद्दल तुम्हाला जे काही माहिती आवश्यक आहे ते सर्व कव्हर करतो. बेसिक संसाधन निर्मितीपासून ते प्रगत एंटरप्राइझ-ग्रेड पायाभूत सुविधा आर्किटेक्चरपर्यंत Infrastructure as Code (IaC) पद्धती Bicep, ARM टेम्पलेट्स, Terraform, आणि Pulumi वापरून कसे अमलात आणायचे ते शिका.

## शिकण्याचे उद्दिष्ट

हा मार्गदर्शक पूर्ण केल्यावर, तुम्ही:
- Infrastructure as Code तत्त्वे व Azure संसाधन provisioning मध्ये पारंगत व्हाल
- Azure Developer CLI द्वारे समर्थित विविध IaC पुरवठादार समजून घेणार
- सामान्य अनुप्रयोग आर्किटेक्चरसाठी Bicep टेम्पलेट्स डिझाइन आणि अमलात आणणार
- संसाधन पॅरामिटर्स, व्हेरिएबल्स, आणि पर्यावरण-विशिष्ट सेटिंग्ज कॉन्फिगर करणार
- नेटवर्किंग आणि सुरक्षा यांसह प्रगत पायाभूत सुविधा नमुने अमलात आणणार
- संसाधनांच्या जीवनचक्राचे व्यवस्थापन, अपडेट्स, आणि अवलंबित्व निराकरण करणार

## शिकण्याचे परिणाम

पूर्ण केल्यावर, तुम्ही करू शकता:
- Bicep आणि ARM टेम्पलेट्स वापरून Azure पायाभूत सुविधा डिझाइन आणि provisioning करणे
- योग्य संसाधन अवलंबित्वांसह कॉम्प्लेक्स मल्टी-सर्व्हिस आर्किटेक्चर कॉन्फिगर करणे
- विविध वातावरणे आणि कॉन्फिगरेशनसाठी पॅरामिटराइझ्ड टेम्पलेट्स अमलात आणणे
- पायाभूत सुविधा provisioning समस्या शोधणे आणि deployment अपयश निराकरण करणे
- Azure Well-Architected Framework तत्त्वे पायाभूत सुविधा डिझाइनमध्ये लागू करणे
- पायाभूत सुविधा अपडेट्स आणि आवृत्तीकरण धोरणांचा व्यवस्थापन करणे

## पायाभूत सुविधा provisioning आढावा

Azure Developer CLI अनेक Infrastructure as Code (IaC) पुरवठादारांना समर्थन देते:
- **Bicep** (शिफारस केलेले) - Azure चा डोमेन-विशिष्ट भाषा
- **ARM Templates** - JSON-आधारित Azure Resource Manager टेम्पलेट्स
- **Terraform** - मल्टी-क्लाउड पायाभूत सुविधा साधन
- **Pulumi** - प्रोग्रामिंग भाषा वापरून आधुनिक Infrastructure as Code

## Azure संसाधन समजून घेणे

### संसाधन श्रेणी
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### अनुप्रयोगांसाठी सामान्य Azure सेवा
- **कंप्यूट**: App Service, Container Apps, Functions, Virtual Machines
- **स्टोरेज**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **नेटवर्किंग**: Virtual Network, Application Gateway, CDN
- **सुरक्षा**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep पायाभूत सुविधा टेम्पलेट्स

### सोप्या Bicep टेम्पलेट रचनेचे स्वरूप
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

### प्रगत Bicep नमुने

#### मॉड्यूलर पायाभूत सुविधा
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

#### अटींवर आधारित संसाधन निर्मिती
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

## 🌐 azd सह Terraform वापरणे

Bicep हा azd चा डीफॉल्ट आहे, पण azd **Terraform** देखील समर्थित करते—जर तुमचा संघ आधीच याचा वापर करत असेल किंवा तुम्ही मल्टी-क्लाउड पायाभूत सुविधा व्यवस्थापित करत असाल तर उपयुक्त. azd चा कार्यप्रवाह (`azd up`, `azd provision`, `azd down`) सारखा राहतो; केवळ पायाभूत सुविधा भाषेत आणि फोल्डर लेआउटमध्ये बदल होतो.

### azd ला Terraform वापरण्यास सांगा

`azure.yaml` मध्ये `infra` विभागात Terraform पुरवठादारासाठी निर्देश द्या:

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

### Terraform फोल्डर लेआउट

Terraform पुरवठादार वापरून, तुमचा `infra/` फोल्डर Bicep ऐवजी `.tf` फायली वापरतो:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### एक मिनिमल `main.tf`

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

### azd तुमच्या Terraform आऊटपुटशी कसे कनेक्ट करते

azd Terraform **outputs** वाचते जेणेकरून तुमच्या endpoints शिकून घेऊ शकते आणि पर्यावरण मूल्ये परत तुमच्या ऍपमध्ये कनेक्ट करू शकते. output नावे महत्त्वाची आहेत—azd काही विशिष्ट output शोधते:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **महत्त्वाचे:** azd हा `azd-env-name` टॅग आणि `AZURE_*` आउटपुट वापरून प्रती पर्यावरण संसाधने ट्रॅक करतो. नेहमीच तुमच्या resource group ला `"azd-env-name" = var.environment_name` असे टॅग द्या जेणेकरून `azd down` सर्व गोष्टी शोधून काढू आणि काढून टाकू शकते.

### Terraform सह डिप्लॉय करा

कमांड्स Bicep सारखेच आहेत:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 'terraform plan' अंतर्गत चालवतो
azd up                    # पुरवठा + तैनात करणे
azd down --force          # Terraform-व्यवस्थापित संसाधने नष्ट करतो
```

> **पूर्वअट:** Terraform इंस्टॉल केलेले असावे आणि तुमच्या `PATH` मध्ये असावे. azd Terraform *workflow* व्यवस्थापित करते पण Terraform स्थापित करत नाही. स्टेटसाठी, azd डीफॉल्टनुसार लोकल स्टेट वापरते; संघांसाठी, `provider.tf` मध्ये रिमोट बॅकएंड (उदा., Azure Storage बॅकएंड) कॉन्फिगर करा.

पूर्ण, चालवण्यायोग्य Terraform-आधारित स्टार्टरसाठी, [Awesome AZD गॅलरी](https://azure.github.io/awesome-azd/) पहा आणि Terraform साठी फिल्टर करा, किंवा अधिकृत [azd Terraform दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) पाहा.

## 🧩 azd सह Pulumi वापरणे

जर तुमचा संघ DSL ऐवजी सामान्य-उद्देशीय भाषा (TypeScript, Python, Go, किंवा C#) मध्ये पायाभूत सुविधा लिहित असेल तर azd **Pulumi** देखील समर्थित करते. Terraform प्रमाणेच, `azd up` / `azd provision` / `azd down` कार्यप्रवाह बदलत नाही—केवळ पायाभूत सुविधा टूलिंग आणि फोल्डर लेआउट वेगळे आहेत.

### azd ला Pulumi वापरण्यास सांगा

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

### Pulumi फोल्डर लेआउट

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### एक मिनिमल `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// प्रत्येक संसाधनाला टॅग करा जेणेकरून azd त्यांना ट्रॅक करून साफ करू शकेल
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd हे आउटपुट परत तुमच्या पर्यावरणात वाचते
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### स्टॅक्ज azd पर्यावरणांना मॅप करतात

Pulumi डिप्लॉयमेंट्सना **स्टॅक्ज** मध्ये संघटित करते, आणि azd प्रत्येक azd पर्यावरणाला त्याच नावाच्या Pulumi स्टॅकशी मॅप करते. जेव्हा तुम्ही `azd env new staging` चालवता, तेव्हा azd `staging` Pulumi स्टॅक निवडतो (किंवा तयार करतो). तेच `azd-env-name` टॅगिंग आणि `AZURE_*` आउटपुट नियम लागू होतात, त्यामुळे `azd down` सर्व्ह काहीही शोधून काढू आणि काढून टाकू शकते.

### Pulumi सह डिप्लॉय करा

```bash
azd auth login
azd env new dev
azd provision --preview   # azd हेडखाली 'pulumi preview' चालवतो
azd up                    # प्रदान करणे + तैनात करणे
azd down --force          # 'pulumi destroy' चालवतो
```

> **पूर्वअट:** Pulumi इंस्टॉल केलेले असावे आणि तुमच्या `PATH` मध्ये असावे, तसेच तुम्हाला स्टेट बॅकएंड (Pulumi Cloud किंवा स्वतः व्यवस्थापित बॅकएंड जसे Azure Blob Storage) आवश्यक आहे. azd Pulumi *workflow* व्यवस्थापित करते, इंस्टॉलेशन नाही. अधिकृत [azd Pulumi दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) पहा.

## 🎯 तुमच्या सेवेसाठी होस्ट निवडणे

`azure.yaml` मधील `host` क्षेत्र ठरवते की तुमचा कोड कुठे चालेल. azd अनेक होस्ट्सना समर्थन देते—योग्य होस्ट निवडणे पायाभूत सुविधा भाषेकडे अधिक महत्त्वाचे आहे. सुरुवातीसाठी सोपा तुलना खालीलप्रमाणे:

| `host` मूल्य | सर्वोत्तम साठी | का |
|--------------|----------|-----|
| `appservice` | पारंपरिक वेब ऍप्स आणि API | सर्वात सोपा PaaS; कोणतेही कंटेनर आवश्यक नाहीत |
| `staticwebapp` | फ्रंट-एंड SPA (React, Vue, Angular) | जागतिक CDN + मोफत SSL, अंगभूत API समर्थन |
| `function` | इव्हेंट-चालित आणि सर्व्हरलेस वर्कलोड्स | शून्यापर्यंत स्केल, प्रति-कार्यान्वयन शुल्क |
| `containerapp` | कंटेनरयुक्त मायक्रोसर्व्हिसेस | सर्व्हरलेस कंटेनर, शून्यापर्यंत स्केल, अंगभूत प्रवेश |
| `aks` | क्लिष्ट ऑर्केस्ट्रेशन गरजा | क्वचितच जेव्हा तुम्हाला खरंच हवे असेल तेव्हा पूर्ण Kubernetes नियंत्रण |
| `springapp` | Java Spring Boot ऍप्स | Azure Spring Apps runtime जे Spring साठी खास व्यवस्थापित |

### AKS कधी वापरावे

**Azure Kubernetes Service (`host: aks`)** तुम्हाला Kubernetes ची पूर्ण शक्ती देते—कस्टम कंट्रोलर, सेवा मेष, क्लिष्ट नेटवर्किंग, आणि बारकाईने वेळापत्रक करणे. ही शक्ती ऑपरेशनल ओव्हरहेडसह येते: तुम्हाला नोड पूल्स, अपग्रेड्स, आणि क्लस्टर नेटवर्किंग व्यवस्थापित करावे लागते.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **सोप्या पर्यायांपासून सुरुवात करा.** बहुतेक मायक्रोसर्व्हिसेससाठी, **Container Apps** तुम्हाला कंटेनर, ऑटॉस्केलिंग, आणि शून्यापर्यंत स्केलिंग देतो, क्लस्टर व्यवस्थापन न करता. Kubernetes-विशिष्ट फीचर्स असतील तेव्हाच AKS निवडा.

### Azure Spring Apps कधी वापरावे

**Azure Spring Apps (`host: springapp`)** हे Spring Boot साठी लक्ष केंद्रित केलेले व्यवस्थापित runtime आहे. ते सेवा शोध, कॉन्फिग सर्व्हर, आणि ब्लू-ग्रीन डिप्लॉयमेंट हाताळते जेणेकरून Java संघांना स्वतःची पायाभूत सुविधा चालवावी लागणार नाही.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> `springapp` वापरा जेव्हा तुमच्याकडे आधीच Spring Boot ऍप्स असतील आणि तुम्हाला त्यांच्यासाठी ट्यून केलेले runtime पाहिजे असेल. नवीन कंटेनरयुक्त Java ऍप्ससाठी ज्यांना Spring-विशिष्ट गरजा नाहीत, तेंव्हा `containerapp` बर्‍याचदा सोपा पर्याय आहे.

## 🗃️ डेटाबेस provisioning

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

## 🔒 सुरक्षा आणि सिक्रेट्स व्यवस्थापन

### Key Vault समाकलन
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

### Managed Identity कॉन्फिगरेशन
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

## 🌍 नेटवर्किंग आणि कनेक्टिव्हिटी

### Virtual Network कॉन्फिगरेशन
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

### SSL असह Application Gateway
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

## 📊 मॉनिटरिंग आणि निरीक्षण

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

### सानुकूल मेट्रिक्स आणि अलर्ट्स
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

## 🔧 पर्यावरण-विशिष्ट कॉन्फिगरेशन

### वेगवेगळ्या पर्यावरणांसाठी पॅरामिटर फायली
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

### अटींवर आधारित संसाधन provisioning
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

## 🚀 प्रगत provisioning पॅटर्न्स

### मल्टी-रीजन डिप्लॉयमेंट
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

### पायाभूत सुविधा चाचणी
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

## 🧪 पायाभूत सुविधा पूर्वावलोकन आणि व्हॅलिडेशन (नवीन)

### डिप्लॉय करण्यापूर्वी पायाभूत सुविधांतील बदलांचे पूर्वावलोकन करा

`azd provision --preview` फिचर तुम्हाला **पायाभूत सुविधा provisioning चे सिम्युलेशन** करण्याची परवानगी देते. हे `terraform plan` किंवा `bicep what-if` सारखे आहे, ज्यामुळे तुम्हाला तुमच्या Azure पर्यावरणात कोणते बदल होतील याचे **ड्राय-रन व्ह्यू** मिळते.

#### 🛠️ हे काय करते
- तुमचे IaC टेम्पलेट्स (Bicep किंवा Terraform) विश्लेषित करते
- संसाधन बदलांचे पूर्वावलोकन दाखवते: जोडणे, काढणे, अपडेट्स
- कोणतेही बदल लागू करत नाही — फक्त वाचण्यायोग्य आणि सुरक्षित आहे

#### वापर प्रकरणे
```bash
# तैनातीपूर्वी पायाभूत सुविधा बदलांचे पूर्वावलोकन करा
azd provision --preview

# विशिष्ट पर्यावरणासाठी पूर्वावलोकन
azd provision --preview -e production
```

हा कमांड तुम्हाला मदत करतो:
- संसाधनांना कमिट करण्यापूर्वी पायाभूत सुविधा बदलांची सत्यता तपासणे
- विकास चक्रात लवकर गोंधळ टाळणे
- संघ वातावरणात सुरक्षित सहकार्य करणे
- आश्चर्यांशिवाय सर्वात कमी अधिकारांवर डिप्लॉयमेंट सुनिश्चित करणे

हे विशेषतः उपयुक्त आहे जेव्हा:
- क्लिष्ट मल्टी-सर्व्हिस वातावरणांवर काम करत असाल
- उत्पादन पायाभूत सुविधांमध्ये बदल करत असाल
- PR मंजुरीपूर्वी टेम्पलेटमध्ये बदल तपासत असाल
- पायाभूत सुविधा नमुन्यांवर नवीन संघ सदस्यांना प्रशिक्षण देत असाल

### उदाहरण पूर्वावलोकन आउटपुट
अचूक पूर्वावलोकन आउटपुट प्रत्येक पुरवठादार आणि प्रकल्प रचनेनुसार भिन्न असते, पण निकाल स्पष्टपणे सूचित करतो की काय बदल सुचवले गेले आहेत तोपर्यंत काहीही लागू केलेले नाही.

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

## �🔄 संसाधन अपडेट्स आणि स्थलांतर

### सुरक्षित संसाधन अपडेट्स
```bash
# पूर्वावलोकन करा पायाभूत सुविधा बदल प्रथम (शिफारस केली आहे)
azd provision --preview

# पूर्वावलोकन पुष्टीनंतर बदल लागू करा
azd provision --confirm-with-no-prompt

# रोलबॅक साठी, पायाभूत सुविधा बदल मागे घेण्यासाठी Git वापरा:
git revert HEAD  # शेवटचा पायाभूत सुविधा कमिट मागे घ्या
azd provision    # पूर्वीची पायाभूत सुविधा स्थिती लागू करा
```

### डेटाबेस स्थलांतर
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

## 🎯 सर्वोत्तम प्रथासमूह

### 1. संसाधन नावकरण परंपरा
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. टॅगिंग धोरण
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

### 3. पॅरामिटर मान्यता
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

### 4. आऊटपुट संघटना
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

## पुढील पावले

- [प्री-डिप्लॉयमेंट नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन उपलब्धतेचे सत्यापन करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - पायाभूत सुविधा समस्या सोडवा
- [डिबगिंग मार्गदर्शक](../chapter-07-troubleshooting/debugging.md) - provisioning समस्या डीबग करा
- [SKU निवड](../chapter-06-pre-deployment/sku-selection.md) - योग्य सेवा स्तर निवडा

## अतिरिक्त संसाधने

- [Azure Bicep दस्तऐवज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager टेम्पलेट्स](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेव्हिगेशन**
- **मागील धडा**: [Deployment Guide](deployment-guide.md)
- **पुढील धडा**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
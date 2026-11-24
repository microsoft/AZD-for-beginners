# AZD सह Azure संसाधने प्राव्हिजनिंग

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [शिकणाऱ्यांसाठी AZD](../../README.md)
- **📖 चालू अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर एज़ कोड & डिप्लॉयमेंट
- **⬅️ मागील**: [डिप्लॉयमेंट मार्गदर्शिका](deployment-guide.md)
- **➡️ पुढील अध्याय**: [अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)
- **🔧 संबंधित**: [अध्याय 6: प्री-डिप्लॉयमेंट व्हॅलिडेशन](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

ही मार्गदर्शिका Azure Developer CLI वापरून Azure संसाधने प्राव्हिजनिंग व व्यवस्थापन कसे करायचे हे कवर करते ज्यामध्ये त्याचे अंगभूत Bicep आणि Terraform प्रदाते आहेत.

> पुनरावलोकन केलेले: `azd 1.37.2` (नोव्हेंबर 2026). अन्यथा नमूद नसल्यास, Bicep, Terraform, आणि स्क्रिप्ट उदाहरणे **इल्यूस्ट्रेटिव्ह तुकडे** आहेत, पूर्ण टेम्प्लेट नाहीत. त्यांना त्या प्रोजेक्टमध्ये एकत्र करा जो संदर्भित पॅरामिटर्स, मॉड्यूल्स, ओळखी, नेटवर्किंग, आणि अॅप्लिकेशन कोड पुरवतो. या पुनरावलोकनात Azure प्राव्हिजनिंग पार पाडलेले नाही.

## शिकण्याचे उद्दिष्टे

ही मार्गदर्शिका पूर्ण केल्यावर, तुम्ही:
- इन्फ्रास्ट्रक्चर एज़ कोड तत्त्वे आणि Azure संसाधने प्राव्हिजनिंगमध्ये निपुण व्हाल
- Azure Developer CLI द्वारे समर्थित अनेक IaC प्रदाते समजून घ्याल
- सामान्य अॅप्लिकेशन आर्किटेक्चरसाठी Bicep टेम्प्लेट डिझाइन आणि अंमलात आणाल
- संसाधन पॅरामिटर्स, चल, आणि पर्यावरण-विशिष्ट सेटिंग्ज कॉन्फिगर कराल
- प्रगत इन्फ्रास्ट्रक्चर पॅटर्न्स अंमलात आणाल ज्यात नेटवर्किंग आणि सुरक्षा समावेश आहे
- संसाधन जीवनचक्र, अद्यतने, आणि अवलंबित्व निराकरण व्यवस्थापित कराल

## शिकण्याचे परिणाम

पूर्ण केल्यावर, तुम्ही करू शकाल:
- Bicep आणि ARM टेम्प्लेट वापरून Azure इन्फ्रास्ट्रक्चर डिझाइन आणि प्राव्हिजन करणे
- योग्य संसाधन अवलंबित्वांसह जटिल बहु-सेवा आर्किटेक्चर कॉन्फिगर करणे
- अनेक पर्यावरणांसाठी व कॉन्फिगरेशन्ससाठी पॅरामिटरायझ्ड टेम्प्लेट्स अंमलात आणणे
- इन्फ्रास्ट्रक्चर प्राव्हिजनिंग समस्या शोधणे आणि डिप्लॉयमेंट अपयशांचे निराकरण करणे
- Azure Well-Architected Framework तत्त्वे इन्फ्रास्ट्रक्चर डिझाइनमध्ये लागू करणे
- इन्फ्रास्ट्रक्चर अपडेट्सचे व्यवस्थापन करणे आणि इन्फ्रास्ट्रक्चर व्हर्जनिंग धोरणे अंमलात आणणे

## इन्फ्रास्ट्रक्चर प्राव्हिजनिंग आढावा

Azure Developer CLI अनेक इन्फ्रास्ट्रक्चर एज़ कोड (IaC) प्रदात्यांना समर्थन देते:
- **Bicep** (शिफारस केलेले) - Azure चे डोमेन-विशिष्ट भाषा
- **ARM टेम्प्लेट** - Bicep ARM मध्ये संकलित होते; कच्चे ARM JSON स्वतंत्र अंगभूत `infra.provider` नाही
- **Terraform** - मल्टि-क्लाउड इन्फ्रास्ट्रक्चर साधन
- **एक्सटेंशन प्रदाते** - स्वतंत्र स्थापित प्रदाता विस्तार आणि त्याचे दस्तऐवजीकरण आवश्यक; कोणत्याही प्रदाता स्ट्रिंगचे समर्थन असल्याचे गृहीत धरू नका

## Azure संसाधने समजून घेणे

### संसाधन श्रेणी
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### अॅप्लिकेशन्ससाठी सामान्य Azure सेवा
- **कंपी्यूट**: App Service, कंटेनर अॅप्स, फंक्शन्स, व्हर्च्युअल मशीन
- **स्टोरेज**: स्टोरेज अकाउंट, कॉसमॉस DB, SQL डेटाबेस, पोस्टग्रेएसक्यूएल
- **नेटवर्किंग**: व्हर्च्युअल नेटवर्क, अॅप्लिकेशन गेटवे, CDN
- **सुरक्षा**: की वॉल्ट, अॅप्लिकेशन इनसाइट्स, लॉग अॅनालिटिक्स
- **AI/ML**: Azure AI सेवा, Azure OpenAI, Azure मशीन लर्निंग

## Bicep इन्फ्रास्ट्रक्चर टेम्प्लेट

### मूलभूत Bicep टेम्प्लेट संरचना
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

पूर्ण azd प्रोजेक्टसाठी, या मॉड्यूलला सदस्यता-स्कोप्ड `infra/main.bicep` कडून कॉल करा ज्या टॅग केलेले रिसोर्स ग्रुप बनवते आणि त्याचा स्कोप पास करते. `environmentName`/`location` ला `main.parameters.json` मध्ये जुळवा. `azd-service-name: web` टॅग संसाधनाला `services.web` शी जोडते; केवळ मनमानी आउटपुट नावं सेवा शोध व्यवस्थापित करत नाहीत.

### प्रगत Bicep पॅटर्नस

#### मांडणी इन्फ्रास्ट्रक्चर
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

#### सशर्त संसाधन निर्मिती
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

Bicep हे azd चे डीफॉल्ट आहे, पण azd **Terraform** देखील समर्थन करते—जर तुमच्या टीममध्ये आधीच ते मानक असेल किंवा तुम्ही मल्टि-क्लाउड इन्फ्रास्ट्रक्चर व्यवस्थापित करत असाल तर उपयुक्त. azd वर्कफ्लो (`azd up`, `azd provision`, `azd down`) सारखाच आहे; केवळ इन्फ्रास्ट्रक्चर भाषा आणि फोल्डर लेआउट बदलतो.

### azd ला Terraform वापरायला सांगा

Terraform प्रदात्याकडे निर्देशित करणारा `infra` विभाग `azure.yaml` मध्ये जोडा:

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

Terraform प्रदात्यासह, तुमचा `infra/` फोल्डर Bicep ऐवजी `.tf` फाइल्स वापरतो:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### एक `main.tf` तुकडा

हा केवळ रिसोर्स ग्रुप आणि प्लॅन तयार करतो, डिप्लॉय करण्यायोग्य सेवा नाही. तुम्हाला इनपुट चल, सुसंगत `azurerm` प्रदाता, वेब अॅप, आणि त्याच्या सेवा टॅग/रिसोर्स-नाव मॅपिंग देखील घोषित करावी लागेल.

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

### azd तुमच्या Terraform आउटपुटशी कसा कनेक्ट होतो

azd Terraform **आउटपुट्स** वाचून पर्यावरण मूल्यांमध्ये वापरतो. हा तुकडा गृहीत धरतो की तुम्ही `azurerm_linux_web_app.web` घोषित केले आहे; सेवा शोधासाठी अजूनही जुळणारे संसाधन नाव किंवा `azd-service-name` टॅग आवश्यक आहे:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **महत्त्वाचे:** azd पर्यावरणानुसार संसाधने ट्रॅक करण्यासाठी `azd-env-name` टॅग आणि `AZURE_*` आउटपुट्स वापरतो. नेहमी तुमच्या रिसोर्स ग्रुपला `"azd-env-name" = var.environment_name` टॅग करा जेणेकरून `azd down` सर्व काही शोधू आणि काढून टाकू शकेल.

### Terraform सह डिप्लॉय करा

कमांड Bicep प्रमाणेच आहेत:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **पूर्वअट:** Terraform इंस्टॉल केलेले असावे आणि तुमच्या `PATH` वर असावे. azd Terraform *वर्कफ्लो* व्यवस्थापित करतो परंतु Terraform स्वतः इंस्टॉल करत नाही. स्टेटसाठी, azd डिफॉल्टने लोकल स्टेट वापरतो; टीमसाठी, रेमोळ बॅकएंड (उदाहरणार्थ Azure स्टोरेज बॅकएंड) मध्ये कॉन्फिगर करा `provider.tf`.

पूर्ण, चालवण्यायोग्य Terraform आधारित स्टार्टरसाठी, [Awesome AZD गॅलरी](https://azure.github.io/awesome-azd/) ब्राउझ करा आणि Terraform साठी फिल्टर करा, किंवा अधिकृत [azd Terraform दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) पहा.

## 🧩 इतर इन्फ्रास्ट्रक्चर साधने

Pulumi हे azd 1.37.2 मध्ये अंगभूत प्राव्हिजनिंग प्रदाता नाही. फक्त `infra.provider: pulumi` सेट केल्याने कार्यरत इंटिग्रेशन होत नाही, आणि `azd env new` आपोआप Pulumi स्टॅक तयार/निवडत नाही. तुम्ही इतर IaC साधन वापरत असल्यास, प्रमाणित प्रदाता विस्ताराच्या दस्तऐवजीकरणाचे अनुसरण करा अथवा तुमच्या स्वतःच्या वर्कफ्लोत त्याचे जीवनचक्र स्पष्टपणे व्यवस्थापित करा. हा कोर्स Pulumi प्रदाता पुरवत नाही किंवा पडताळत नाही.

## 🎯 तुमच्या सेवेचा होस्ट कसा निवडावा

`host` फील्ड `azure.yaml` मध्ये ठरवते की तुमचा कोड कुठे चालेल. azd अनेक होस्टसाठी समर्थन करते—योग्य होस्ट निवडणे इन्फ्रास्ट्रक्चर भाषेपेक्षा अधिक महत्त्वाचे आहे. येथे नवीन वापरकर्त्यांसाठी सुलभ तुलना आहे:

| `host` मूल्य | सर्वोत्तम | कारण |
|--------------|----------|-----|
| `appservice` | पारंपरिक वेब अॅप्स आणि API | सर्वात सोपा PaaS; कंटेनरची गरज नाही |
| `staticwebapp` | फ्रंट-एंड SPA (React, Vue, Angular) | ग्लोबल CDN + विनामूल्य SSL, अंगभूत API समर्थन |
| `function` | इव्हेंट-चालित आणि सर्व्हरलेस वर्कलोड | स्केल-टू-झीरो, प्रत्येक कार्यानुसार पैसे द्या |
| `containerapp` | कंटेनरयुक्त मायक्रोसर्व्हिसेस | सर्व्हरलेस कंटेनर, स्केल-टू-झीरो, अंगभूत Ingress |
| `aks` | जटिल ऑर्केस्ट्रेशन गरजा | पूर्ण Kubernetes नियंत्रण जेव्हा प्रत्यक्षात आवश्यक आहे तेव्हाच |
| `springapp` | विद्यमान Azure Spring Apps डिप्लॉयमेंट्स | वारसा लक्ष्य; सेवा 31 मार्च 2028 रोजी निवृत्त होईल आणि नवीन ग्राहकांसाठी बंद आहे |

### AKS कधी वापरावे

**Azure Kubernetes Service (`host: aks`)** तुम्हाला Kubernetes ची संपूर्ण शक्ती देते—कस्टम कंट्रोलर्स, सेवा मेष, जटिल नेटवर्किंग, आणि सूक्ष्म शेड्यूलिंग. ही शक्ती ऑपरेशनल ओव्हरहेडसह येते: तुम्ही नोड पूल, अपग्रेड्स, आणि क्लस्टर नेटवर्किंग व्यवस्थापित करता.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **साधेपणाने सुरू करा शक्य असल्यास.** बहुतेक मायक्रोसर्व्हिसेससाठी, **Container Apps** कंटेनर, ऑटोस्केलिंग, आणि स्केल-टू-झीरो देते क्लस्टर व्यवस्थापित न करता. Kubernetes-विशिष्ट वैशिष्ट्ये केवळ तेव्हा वापरा जेव्हा आवश्यक असेल.

### Azure Spring Apps कधी वापरावे

**Azure Spring Apps (`host: springapp`)** ही Spring Boot साठी उद्दिष्ट बांधली गेली एक व्यवस्थापित रनटाइम आहे. ती सेवा शोध, कॉन्फिग सर्व्हर, आणि ब्लू-ग्रीन डिप्लॉयमेंट हाताळते जेणेकरून Java टीममध्ये स्वतःची इन्फ्रास्ट्रक्चर चालवावी लागत नाही.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> नवीन सुरुवातीच्या प्रोजेक्टसाठी Azure Spring Apps निवडू नका: ती नवीन ग्राहकांसाठी बंद आहे आणि [31 मार्च 2028 रोजी निवृत्त होईल](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Container Apps सारख्या समर्थित पर्यायांना प्राधान्य द्या आणि विद्यमान डिप्लॉयमेंटसाठी स्थलांतराची योजना करा.

## 🗃️ डेटाबेस प्राव्हिजनिंग

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
**तुकडा पूर्वशर्त:** `@secure() param databasePassword string` जाहीर करा आणि मजबूत पुरवलेले मूल्य वापरा. सार्वजनिक प्रवेश निवडा **किंवा** खालील प्रतिनिधीत्व असलेल्या सबनेट/खाजगी DNS शी समाकलित करा; दोन तुकडे आपोआप एकमेकांशी कनेक्ट होत नाहीत.

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

`0.0.0.0` नियम तुमच्या स्वतःच्या सदस्यतेव्यतिरिक्त Azure सेवा कडून कनेक्शन परवानगी देतो. हा खाजगी नेटवर्किंग नाही; खऱ्या workloads साठी निर्बंधित नेटवर्क डिजाइन प्राधान्य द्या.

## 🔒 सुरक्षा आणि सीक्रेट व्यवस्थापन

### की वॉल्ट समाकलन
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

### व्यवस्थापित ओळख कॉन्फिगरेशन
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

सिस्टम-निर्धारित ओळखेसाठी, `AZURE_CLIENT_ID` त्याच्या प्रिन्सिपल आयडीवर सेट करू नका. वापरकर्ता-निर्धारित ओळख त्याचा **क्लायंट आयडी**, वस्तू/प्रिन्सिपल आयडी नाही, वापरते. की वॉल्ट संदर्भासह अॅप ओळखीच्या व्हॉल्ट भूमिका नियुक्ती आणि नेटवर्क प्रवेश देखील आवश्यक आहे.

## 🌍 नेटवर्किंग आणि कनेक्टिव्हिटी

### व्हर्च्युअल नेटवर्क कॉन्फिगरेशन
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

### SSL सह अॅप्लिकेशन गेटवे
**अपूर्ण आर्किटेक्चर तुकडा, डिप्लॉय करण्यायोग्य गेटवे नाही:** VNet साठी समर्पित `gateway-subnet` जोडा तसेच बॅकएंड पूल्स, HTTP सेटिंग्ज, लिसनर्स, प्राधान्याने रूटिंग नियम, आणि TLS प्रमाणपत्र (किंवा प्राधिकृत की वॉल्ट संदर्भ). केवळ पोर्ट 443 उघडणे HTTPS सेट करत नाही.

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

## 📊 मॉनिटरींग आणि अवलोकन

### अॅप्लिकेशन इनसाइट्स
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

### सानुकूल मेट्रिक्स आणि अलर्ट
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

## 🔧 पर्यावरण-विशिष्ट कॉन्फिगरेशन

### वेगवेगळ्या पर्यावरणांसाठी पॅरामिटर फाइल्स
खालील दोन फाइल्स **पर्यायात्मक पॅरामिटर-फाइल उदाहरणे** आहेत. azd पर्यावरणानुसार `main.parameters.dev.json` किंवा `main.parameters.prod.json` आपोआप निवडत नाही. खरी `main.parameters.json` वापरा ज्यात पर्यावरण स्थानापन्न (उदा. `${APP_SERVICE_SKU=B1}`) असेल, आणि Bicep मधील प्रत्येक पॅरामिटर जाहीर/उपभोग करा.

`infra/main.parameters.dev.json` साठी उदाहरण सामग्री:

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

`infra/main.parameters.prod.json` साठी उदाहरण सामग्री:

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

### सशर्त संसाधन प्राव्हिजनिंग
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

## 🚀 प्रगत प्राव्हिजनिंग पॅटर्न्स

### बहु-प्रदेशीय डिप्लॉयमेंट
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

### इन्फ्रास्ट्रक्चर चाचणी
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

इन्फ्रास्ट्रक्चर प्राव्हिजनिंग तुमचा अॅप्लिकेशन कोड डिप्लॉय करत नाही. वर उल्लेखलेले `azd deploy`/`azd up` नंतरच अॅप्लिकेशन तपासण्या चालवा, आणि `/health` फक्त तुमचा अॅप्लिकेशन त्याला अमलात आणेल तर वापरा. ARM डिप्लॉयमेंट स्क्रिप्ट्स Azure संसाधने तयार करतात आणि अतिरिक्त ओळख, समर्थित रनटाइम आवृत्त्या, आणि परवानग्या आवश्यक असतात; ते स्थानिक युनिट चाचण्या नाहीत.

## 🧪 इन्फ्रास्ट्रक्चर प्रिव्ह्यू आणि व्हॅलिडेशन (नवीन)

### डिप्लॉयमेंटपूर्वी इन्फ्रास्ट्रक्चर बदलांचे पूर्वावलोकन करा

`azd provision --preview` वैशिष्ट्य तुम्हाला **इन्फ्रास्ट्रक्चर प्राव्हिजनिंगचे अनुकरण** करण्याची परवानगी देते डिप्लॉयमेंटपूर्वीच. हे `terraform plan` किंवा `bicep what-if` सारखे आहे, तुम्हाला Azure पर्यावरणात काय बदल होणार आहे याचा **ड्राय-रन दृश्य** देते.

#### 🛠️ काय करते
- **तुमचे IaC टेम्प्लेट्स (Bicep किंवा Terraform) चे विश्लेषण करते**
- **संसाधन बदलांचे पूर्वावलोकन दाखवते**: जोडणी, काढणी, अद्यतने
- **प्रदाता प्रस्तावित इन्फ्रास्ट्रक्चर बदल लागू करत नाही** — प्रथम प्रोजेक्ट हुक तपासा; स्क्रिप्ट्सकडे बाजू परिणाम असू शकतात आणि पूर्वावलोकनाला अजूनही Azure परवानग्या आवश्यक आहेत

#### वापर प्रकरणे
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

हा आदेश तुम्हाला मदत करतो:
- **संसाधन प्रतिबद्ध करण्यापूर्वी इन्फ्रास्ट्रक्चर बदलांची पुष्टी करा**
- **विकास चक्रात लवकर ग़लती पकडा**
- **टीम वातावरणांमध्ये सुरक्षित सहकार्य करा**
- **कमी-परवाना डिप्लॉयमेंट्स आश्वस्त करा** आश्चर्यांशिवाय

हे विशेषतः उपयुक्त आहे जेव्हा:
- जटिल बहु-सेवा वातावरणासह काम करत असाल
- उत्पादन इन्फ्रास्ट्रक्चरमध्ये बदल करत असाल
- पीआर मंजुरीपूर्वी टेम्प्लेट सुधारणा पडताळत असाल
- नवीन टीम सदस्यांना इन्फ्रास्ट्रक्चर पॅटर्नवर प्रशिक्षण देत असाल

### उदाहरण पूर्वावलोकन आउटपुट
प्रमाणित प्रदाता आणि प्रोजेक्ट संरचनेनुसार नेमके पूर्वावलोकन आउटपुट वेगळे असते, पण परिणाम स्पष्टपणे प्रस्तावित बदल ओळखणे आवश्यक आहे डिप्लॉय होण्यापूर्वी.

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

## 🔄 संसाधन अद्यतने आणि स्थलांतर

### सुरक्षित संसाधन अद्यतने
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

### डेटाबेस स्थलांतर
**अपूर्ण डिप्लॉयमेंट-स्क्रिप्ट पॅटर्न:** आवश्यक असल्यास कॉन्फिगर केलेली वापरकर्ता-निर्धारित ओळख, समर्थित Azure CLI रनटाइम, उपलब्ध स्थलांतर साधने, पुरवलेले स्थलांतर निर्देशिका/कॉन्फिगरेशन, आणि डेटाबेस कनेक्टिव्हिटी. हा संसाधन केवळ टेम्प्लेटमध्ये पेस्ट करून चालवता येत नाही.

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

## 🎯 सर्वोत्तम पद्धती

### 1. संसाधन नाव नित्यक्रम
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. टॅगिंग रणनीती
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

### 3. पॅरामिटर पडताळणी
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

### 4. आउटपुट संघटन
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

## पुढील टप्पे

- [प्री-डिप्लॉयमेंट नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन उपलब्धता पुष्टी करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - इन्फ्रास्ट्रक्चर समस्या सोडवा
- [डिबगिंग मार्गदर्शन](../chapter-07-troubleshooting/debugging.md) - प्रोव्हिजनिंग समस्या डिबग करा
- [SKU निवड](../chapter-06-pre-deployment/sku-selection.md) - योग्य सेवा स्तर निवडा

## अतिरिक्त संसाधने

- [Azure Bicep दस्तऐवजीकरण](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager टेम्प्लेट्स](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure चांगल्या रचनेचा फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेव्हिगेशन**
- **मागील धडा**: [डिप्लॉयमेंट मार्गदर्शक](deployment-guide.md)
- **पुढील धडा**: [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
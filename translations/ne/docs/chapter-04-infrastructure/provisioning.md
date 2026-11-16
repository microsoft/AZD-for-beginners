# AZD सँग Azure साधनहरूको प्रावधान

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [शुरुआतीहरूको लागि AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ४ - पूर्वाधारलाई कोड र व्यवस्थापनका रूपमा
- **⬅️ अघिल्लो**: [प्रस्तुतीकरण गाईड](deployment-guide.md)
- **➡️ अर्को अध्याय**: [अध्याय ५: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)
- **🔧 सम्बन्धित**: [अध्याय ६: पूर्व-प्रस्तुतीकरण प्रमाणीकरण](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

यो गाइड Azure Developer CLI को प्रयोग गरी Azure साधनहरूको प्रावधान र व्यवस्थापन गर्ने विषयमा छ, जसमा बिल्ट-इन Bicep र Terraform प्रदायकहरू समावेश छन्।

> `azd 1.37.2` सँग समीक्षा गरिएको (नोभेम्बर २०२६)। अन्यथा उल्लेख नगरिएको खण्डमा, Bicep, Terraform, र स्क्रिप्ट उदाहरणहरू **चित्रात्मक अंशहरू** हुन्, पूर्ण ढाँचा होइनन्। तिनीहरूलाई त्यस्तो परियोजनामा मिलाउनुहोस् जसले सम्बोधित प्यारामिटरहरू, मोड्युलहरू, पहिचानहरू, नेटवर्किङ, र अनुप्रयोग कोड आपूर्ति गर्छ। यस समीक्षामा Azure प्रोभिजनिंग कार्यान्वयन गरिएको थिएन।

## सिकाइ लक्ष्यहरू

यो गाइड पूरा गर्दा, तपाईंले:
- Infrastructure as Code का सिद्धान्तहरू र Azure स्रोत प्रावधानमा दक्षता हासिल गर्नु हुनेछ
- Azure Developer CLI द्वारा समर्थित विभिन्न IaC प्रदायकहरू बुझ्नुहुनेछ
- सामान्य आवेदन वास्तुकलाहरू लागि Bicep टेम्प्लेटहरू डिजाइन र कार्यान्वयन गर्नु हुनेछ
- स्रोत प्यारामिटरहरू, भेरिएबलहरू, र पर्यावरण-विशिष्ट सेटिङहरू कन्फिगर गर्नुहोस्
- जटिल नेटवर्किङ र सुरक्षा सहित उन्नत पूर्वाधार ढाँचाहरू कार्यान्वयन गर्नुहोस्
- स्रोत जीवनचक्र, अपडेटहरू, र निर्भरताहरू समाधान व्यवस्थित गर्नुहोस्

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Bicep र ARM टेम्प्लेटहरू प्रयोग गरेर Azure पूर्वाधार डिजाइन र प्रावधान गर्ने
- उचित स्रोत निर्भरताहरू सहित जटिल बहु-सेवा वास्तुकला कन्फिगर गर्ने
- बहु-वातावरण र कन्फिगरेशन्सका लागि प्यारामिटरयुक्त टेम्प्लेटहरू कार्यान्वयन गर्ने
- पूर्वाधार प्रावधान समस्याहरू पहिचान गर्ने र तैनाती असफलताहरू समाधान गर्ने
- पूर्वाधार डिजाइनमा Azure राम्रो-आर्किटेक्टेड फ्रेमवर्क सिद्धान्तहरू लागू गर्ने
- पूर्वाधार अपडेटहरू व्यवस्थापन गर्ने र पूर्वाधार संस्करण रणनीतिहरू लागु गर्ने

## पूर्वाधार प्रावधान अवलोकन

Azure डेभलपर CLI ले धेरै पूर्वाधार as कोड (IaC) प्रदायकहरूलाई समर्थन गर्दछ:
- **Bicep** (सिफारिस गरिएको) - Azure को डोमेन-विशेष भाषा
- **ARM टेम्प्लेटहरू** - Bicep ले ARM मा कम्पाइल गर्छ; कच्चा ARM JSON अलग निर्मित `infra.provider` होइन
- **Terraform** - बहु-क्लाउड पूर्वाधार उपकरण
- **एक्सटेन्सन प्रदायकहरू** - अलग स्थापित प्रदायक एक्सटेन्सन र यसको कन्फिगरेसन आवश्यक पर्दछ; कुनै पनि प्रदायक स्ट्रिङ समर्थित छ भनी मान नगर्नुहोस्

## Azure स्रोतहरू बुझ्न

### स्रोत पदानुक्रम
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### अनुप्रयोगहरूको लागि सामान्य Azure सेवाहरू
- **गणना**: एप सेवा, कन्टेनर एपहरू, फंक्शनहरू, भर्चुअल मेशिनहरू
- **स्टोरेज**: स्टोरेज अकाउन्ट, कोस्मोस DB, SQL डेटाबेस, पोस्टग्रेसQL
- **नेटवर्किङ**: भर्चुअल नेटवर्क, एप्लिकेशन गेटवे, CDN
- **सुरक्षा**: किज भल्ट, एप्लिकेशन इनसाइट्स, लग एनालिटिक्स
- **AI/ML**: Azure AI सेवाहरू, Azure OpenAI, Azure मेशिन लर्निंग

## बाइसेप इन्फ्रास्ट्रक्चर टेम्प्लेटहरू

### आधारभूत बाइसेप टेम्प्लेट संरचना
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

एक पूर्ण azd प्रोजेक्टका लागि, यो मोड्युललाई सदस्यता-स्कोप गरिएको `infra/main.bicep` बाट कल गर्नुहोस् जसले ट्याग गरिएको स्रोत समूह बनाउँछ र यसको स्कोप पास गर्छ। `main.parameters.json` मा `environmentName`/`location` सँग मिलाउनुहोस्। `azd-service-name: web` ट्याग स्रोतलाई `services.web` सँग सम्बन्धित बनाउँछ; केवल मनमूट आउटपुट नामले सेवा पत्ता लगाउने व्यवस्था गर्दैन।

### उन्नत बाइसेप ढाँचाहरू

#### मोड्युलर इन्फ्रास्ट्रक्चर
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

#### सशर्त स्रोत सिर्जना
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

## 🌐 azd सँग Terraform प्रयोग गर्ने

बाइसेप azd को पूर्वनिर्धारित हो, तर azd ले **Terraform** लाई पनि समर्थन गर्दछ—यदि तपाईंको टोलीले यसलाई पहिले नै मानकीकृत गरेको छ वा तपाईं बहु-क्लाउड इन्फ्रास्ट्रक्चर व्यवस्थापन गर्नुहुन्छ भने उपयोगी। azd कार्यप्रवाह (`azd up`, `azd provision`, `azd down`) उस्तै हुन्छ; केवल इन्फ्रास्ट्रक्चर भाषा र फोल्डर संरचना परिवर्तन हुन्छ।

### azd लाई Terraform प्रयोग गर्न भन्नुहोस्

Terraform प्रदायकलाई लक्ष्य गर्दै `infra` खण्डलाई `azure.yaml` मा थप्नुहोस्:

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

Terraform प्रोवाइडरसंग, तपाईंको `infra/` फोल्डरले Bicep को सट्टा `.tf` फाइलहरू प्रयोग गर्दछ:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### एक `main.tf` फ्र्यागमेन्ट

यसले केवल रिसोर्स समूह र योजना सिर्जना गर्दछ, डिप्लोय गर्न मिल्ने सेवा होइन। तपाईंले इनपुट भेरिएबलहरू, उपयुक्त `azurerm` प्रोवाइडर, वेब एप, र यसको सेवा ट्याग/रिसोर्स-नाम म्यापिंग पनि घोषणा गर्नुपर्छ।

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

### कसरी azd तपाईंको Terraform आउटपुट्ससँग जडान हुन्छ

azd ले Terraform **आउटपुट्स** लाई वातावरण मानहरूमा पढ्छ। यस फ्र्यागमेन्टले मानिन्छ तपाईंले `azurerm_linux_web_app.web` परिभाषित गर्नुभएको छ; सेवा खोजी अझै मिल्दोजुल्दो रिसोर्स नाम वा `azd-service-name` ट्याग आवश्यक पर्दछ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **महत्वपूर्ण:** azd ले प्रत्येक वातावरणका लागि रिसोर्स ट्र्याक गर्न `azd-env-name` ट्याग र `AZURE_*` आउटपुट्स प्रयोग गर्दछ। तपाईंको रिसोर्स समूहलाई सदैव `"azd-env-name" = var.environment_name` ट्याग गर्नुहोस् ताकि `azd down` ले सबै कुरा पत्ता लगाएर हटाउन सकोस्।

### Terraform सँग डिप्लोय गर्नुहोस्

आदेशहरू Bicep जस्तै नै छन्:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **पूर्वापेक्षा:** Terraform स्थापना गरिनु पर्छ र तपाईंको `PATH` मा हुनुपर्छ। azd ले Terraform *workflow* लाई व्यवस्थापन गर्छ तर Terraform तपाईंका लागि स्थापना गर्दैन। अवस्था को लागि, azd डिफल्ट रूपमा स्थानीय अवस्था प्रयोग गर्छ; टोलीहरूको लागि, दूरस्थ ब्याकएन्ड (जस्तै, Azure Storage ब्याकएन्ड) लाई `provider.tf` मा कन्फिगर गर्नुहोस्।

पूर्ण, चलाउन योग्य Terraform-आधारित स्टार्टरहरूका लागि, [Awesome AZD ग्यालेरी](https://azure.github.io/awesome-azd/) ब्राउज़ गर्नुहोस् र Terraform को लागि फिल्टर गर्नुहोस्, वा आधिकारिक [azd Terraform कागजातहरू](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) हेर्नुहोस्।

## 🧩 अन्य पूर्वाधार उपकरणहरू

Pulumi azd 1.37.2 को बिल्ट-इन प्रावधान प्रदायक होइन। केवल `infra.provider: pulumi` सेट गर्दा काम गर्ने एकीकरण स्थापना हुँदैन, र `azd env new` ले स्वतः Pulumi स्ट्याक सिर्जना/छान्दैन। यदि तपाईंले अर्को IaC उपकरण प्रयोग गर्नुहुन्छ भने, प्रमाणित प्रदायक विस्तारको कागजात पालना गर्नुहोस् वा यसको जीवनचक्र तपाईंको आफ्नै कार्यप्रवाहमा स्पष्ट रूपमा व्यवस्थापन गर्नुहोस्। यो कोर्सले Pulumi प्रदायक प्रदान गर्दैन वा मान्य गर्दैन।

## 🎯 तपाईंको सेवाको लागि होस्ट छान्ने

`azure.yaml` मा `host` फिल्डले तपाईंको कोड कहाँ चल्ने निर्णय गर्छ । azd ले धेरै होस्टहरूलाई समर्थन गर्छ—सही एउटा छान्नु इन्फ्रास्ट्रक्चर भाषाभन्दा बढी महत्त्वपूर्ण छ । यहाँ शुरुआतीहरूको लागि सजिलो तुलना छ:

| `host` मान | उत्तम लागि | किन |
|--------------|----------|-----|
| `appservice` | पारम्परिक वेब एप्स र API हरू | सबैभन्दा सरल PaaS; कन्टेनर आवश्यक छैन |
| `staticwebapp` | फ्रन्ट-एन्ड SPA हरू (React, Vue, Angular) | विश्वव्यापी CDN + निःशुल्क SSL, बिल्ट-इन API समर्थन |
| `function` | इभेन्ट-चालित र सर्भररहित वर्कलोड्स | स्केल-टु-जीरो, प्रति-कार्य तिर्ने |
| `containerapp` | कन्टेनरयुक्त माइक्रोसर्भिसहरू | सर्भररहित कन्टेनरहरू, स्केल-टु-जीरो, बिल्ट-इन इन्ग्रेस |
| `aks` | जटिल अरेञ्जमेन्ट आवश्यकताहरू | जब साँच्चिकै आवश्यक छ तब पूर्ण Kubernetes नियन्त्रण |
| `springapp` | अवस्थित Azure Spring Apps डिप्लोयमेन्टहरू | पुरानो लक्षित; सेवा मार्च ३१, २०२८ मा बन्द हुँदैछ र नयाँ ग्राहकहरूका लागि बन्द छ |

### AKS कति बेला प्रयोग गर्ने

**Azure Kubernetes Service (`host: aks`)** ले तपाईंलाई Kubernetes को पूर्ण शक्ति प्रदान गर्दछ—अनुकूलन नियंत्रकहरू, सेवा मेष, जटिल नेटवर्किङ, र सूक्ष्म तालिका निर्धारण। त्यो शक्ति संचालनात्मक ओभरहेडसँग आउँछ: तपाईं नोड पूलहरू, अपग्रेडहरू, र क्लस्टर नेटवर्किङ व्यवस्थापन गर्नुहुन्छ।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **यदि सक्नुहुन्छ भने सजिलो तरिकाबाट सुरू गर्नुहोस्।** बढी माइक्रोसर्भिसहरूको लागि, **Container Apps** ले तपाईंलाई कन्टेनरहरू, अटोस्केलिङ, र क्लस्टर व्यवस्थापन नगरी स्केल-टु-जिरो प्रदान गर्दछ। AKS त्यतिबेला मात्र छान्नुहोस् जब तपाईंलाई Kubernetes-विशिष्ट सुविधाहरू आवश्यक पर्छ।

### Azure Spring Apps कहिले प्रयोग गर्ने

**Azure Spring Apps (`host: springapp`)** Spring Boot का लागि विशेष रूपमा बनाइएको प्रबन्धित रनटाइम हो। यसले सेवा पत्ता लगाउने, कन्फिग सर्भर, र ब्लू-ग्रीन डिप्लोइमेन्ट सम्हाल्छ ताकि जाभा टोलीहरूले आफ्नै पूर्वाधार सञ्चालन नपरोस्।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> नयाँ शुरुवाती परियोजनाको लागि Azure Spring Apps छान्नु हुँदैन: यसले नयाँ ग्राहकहरूको लागि बन्द छ र [मार्च ३१, २०२८ मा अवकाश हुन्छ](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement)। समर्थन गरिएका वैकल्पिकहरू जस्तै Container Apps लाई प्राथमिकता दिनुहोस् र पहिलेका तैनाथिहरूको लागि माइग्रेशन योजना बनाउनुहोस्।

## 🗃️ डाटाबेस प्रविधि

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
**फ्रागमेन्ट पूर्वशर्तहरू:** `@secure() param databasePassword string` घोषणा गर्नुहोस् र बलियो आपूर्तिकृत मान प्रयोग गर्नुहोस्। सार्वजनिक पहुँच चयन गर्नुहोस् **वा** तल्लोमा रहेको प्रतिनिधि सबनेट/निजी DNS समाहित गर्नुहोस्; यी दुई सान्दर्भिक टुक्राहरू आफैंले जडान हुँदैनन्।

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

`0.0.0.0` नियमले तपाईंको आफ्नै सदस्यता बाहेक Azure सेवाहरूबाट जडानहरू अनुमति दिन्छ। यो निजी नेटवर्किङ होइन; वास्तविक वर्कलोडहरूको लागि प्रतिबन्धित नेटवर्क डिजाइन रोज्नुहोस्।

## 🔒 सुरक्षा र गोपनीयता व्यवस्थापन

### Key Vault एकीकरण
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

### प्रबन्धित पहिचान कन्फिगरेसन
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

प्रणाली-आवंटित पहिचानको लागि, `AZURE_CLIENT_ID` लाई यसको प्रमुख ID मा सेट नगर्नुहोस्। प्रयोगकर्ता-आवंटित पहिचानले यसको **क्लाइन्ट ID**, नकि यसको वस्तु/प्रमुख ID प्रयोग गर्दछ। Key Vault संदर्भलाई पनि एप पहिचानको भल्ट भूमिका असाइनमेन्ट र नेटवर्क पहुँच आवश्यक छ।

## 🌍 नेटवर्किङ र कनेक्टिविटी

### भर्चुअल नेटवर्क कन्फिगरेसन
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

### SSL सहित एप्लिकेसन गेटवे
**अधुरो आर्किटेक्चर छिन्न-भिन्न, तैनाथ गर्न योग्य गेटवे होइन:** VNet मा एक समर्पित `gateway-subnet` थप्नुहोस् साथै ब्याकएन्ड पूलहरू, HTTP सेटिङहरू, लिस्नरहरू, प्राथमिकताहरू सहित रुटिङ नियमहरू, र TLS प्रमाणपत्र (वा अधिकृत Key Vault संदर्भ)। केवल पोर्ट ४४३ खोल्नु HTTPS कन्फिगर गर्दैन।

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

## 📊 अनुगमन र अवलोकनता

### एप्लिकेसन इनसाइट्स
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

### अनुकूलित मेट्रिक्स र अलर्टहरू
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

## 🔧 वातावरण-विशिष्ट कन्फिगरेसनहरू

### फरक वातावरणहरूको लागि प्यारामिटर फाइलहरू
तलका दुई फाइलहरू **वैकल्पिक प्यारामिटर-फाइल उदाहरणहरू** हुन्। azd ले पर्यावरण नामले स्वतः `main.parameters.dev.json` वा `main.parameters.prod.json` चयन गर्दैन। वास्तविक `main.parameters.json` प्रयोग गर्नुहोस् वातावरण प्रतिस्थापनहरूसँग (जस्तै `${APP_SERVICE_SKU=B1}`), र Bicep मा प्रत्येक प्यारामिटर घोषणा/उपयोग गर्नुहोस्।

`infra/main.parameters.dev.json` का लागि उदाहरण सामग्री:

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

`infra/main.parameters.prod.json` का लागि उदाहरण सामग्री:

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

### सशर्त स्रोत प्रविधि
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

## 🚀 उन्नत प्रविधि ढाँचा

### बहु-क्षेत्र तैनाथी
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

### पूर्वाधार परीक्षण
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

प्रोभिजनिङ इन्फ्रास्ट्रक्चरले तपाईंको अनुप्रयोग कोडलाई डिप्लोइ गर्दैन। केवल `azd deploy`/`azd up` पछि अनुप्रयोग जाँचहरू चलाउनुहोस्, र यदि तपाईंको अनुप्रयोगले यसलाई कार्यान्वयन गर्छ भने मात्र `/health` प्रयोग गर्नुहोस्। ARM डिप्लोइमेन्ट स्क्रिप्टहरूले Azure स्रोतहरू सिर्जना गर्छन् र थप पहिचान, समर्थित रनटाइम संस्करणहरू, र अनुमतिहरू आवश्यक पर्छ; तिनीहरू स्थानीय इकाई परीक्षणहरू होइनन्।

## 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन र प्रमाणीकरण (नयाँ)

### डिप्लोइमेन्ट अघि इन्फ्रास्ट्रक्चर परिवर्तनहरूको पूर्वावलोकन

`azd provision --preview` सुविधाले तपाईंलाई स्रोतहरू वास्तविक रूपमा तैनाथ गर्नु अघि **इन्फ्रास्ट्रक्चर प्रोभिजनिङको अनुकरण** गर्न अनुमति दिन्छ। यो `terraform plan` वा `bicep what-if` जस्तै छ, जसले तपाईंलाई के परिवर्तनहरू तपाईंको Azure वातावरणमा गरिनेछन् भनेर **ड्राइ-रन दृश्य** दिन्छ।

#### 🛠️ यसको कार्य
- तपाईंका IaC टेम्प्लेटहरू (Bicep वा Terraform) **विश्लेषण गर्छ**
- स्रोत परिवर्तनहरूको पूर्वावलोकन देखाउँछ: थप, मेटाउने, अपडेटहरू
- प्रदायकद्वारा प्रस्ताव गरिएका इन्फ्रास्ट्रक्चर परिवर्तनहरू लागू गर्दैन — परियोजना हुकहरू पहिला निरीक्षण गर्नुहोस्; स्क्रिप्टहरूमा साइड इफेक्ट हुन सक्छन् र पूर्वावलोकनले अझै Azure अनुमतिहरू आवश्यक पर्छ

#### प्रयोगका केसहरू
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

यस आदेशले तपाईंलाई मद्दत गर्छ:
- स्रोतहरू प्रतिबद्ध गर्नु अघि **इन्फ्रास्ट्रक्चर परिवर्तनहरू प्रमाणीकरण गर्न**
- विकास चक्रमा **गलत कन्फिगरेसनहरू छिटो पत्ता लगाउन**
- टोली वातावरणमा **सुरक्षित रूपमा सहकार्य गर्न**
- आश्चर्यविनाको बिना **न्यूनतम विशेषाधिकार तैनाथ सुनिश्चित गर्न**

यो विशेष गरी उपयोगी छ जब:
- जटिल बहु-सेवा वातावरणसँग काम गर्दै हुनुहुन्छ
- उत्पादन इन्फ्रास्ट्रक्चरमा परिवर्तन गर्दै हुनुहुन्छ
- PR अनुमोदन अघि टेम्प्लेट संशोधनहरू प्रमाणीकरण गर्दै हुनुहुन्छ
- इन्फ्रास्ट्रक्चर ढाँचामा नयाँ टोली सदस्यहरूलाई प्रशिक्षण दिँदै हुनुहुन्छ

### उदाहरण पूर्वावलोकन आउटपुट
सही पूर्वावलोकन आउटपुट प्रदायक र परियोजना संरचनामा निर्भर गर्दछ, तर परिणामले प्रस्तावित परिवर्तनहरू स्पष्ट रूपमा पहिचान गर्नुपर्छ कुनै पनि कुरा लागू गर्नु अघि।

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

## �🔄 स्रोत अपडेटहरू र माइग्रेशनहरू

### सुरक्षित स्रोत अपडेटहरू
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

### डाटाबेस माइग्रेशनहरू
**अपूर्ण डिप्लोइमेन्ट-स्क्रिप्ट ढाँचा:** आवश्यक छ जहाँ आवश्यक छ त्यहाँ कन्फिगर गरिएको प्रयोगकर्ता-निर्दिष्ट पहिचान, समर्थित Azure CLI रनटाइम, उपलब्ध माइग्रेशन उपकरणहरू, प्रदान गरिएको माइग्रेशन निर्देशिका/कन्फिगरेसन, र डाटाबेस कनेक्टिविटी। यो केवल टेम्प्लेटमा यो स्रोत टाँस्नु बाट मात्र कार्यान्वयन गर्न मिल्दैन।

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

## 🎯 उत्कृष्ट अभ्यासहरू

### 1. स्रोत नामकरण कन्वेन्सनहरू
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. ट्यागिङ रणनीति
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

### 3. प्यारामिटर प्रमाणीकरण
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

### 4. आउटपुट संगठन
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

## अर्को कदमहरू

- [पूर्व-डिप्लोइमेन्ट योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत उपलब्धता प्रमाणीकरण
- [सामान्य समस्याहरू](../chapter-07-troubleshooting/common-issues.md) - इन्फ्रास्ट्रक्चर समस्या समाधान
- [डिबगिङ गाइड](../chapter-07-troubleshooting/debugging.md) - प्रोभिजनिङ समस्याहरू डिबग गर्नुस्
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सेवा तहहरू छनोट गर्नुस्

## अतिरिक्त स्रोतहरू

- [Azur Bicep दस्तावेज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure स्रोत प्रबन्धक टेम्प्लेटहरू](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure वास्तुकला केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure राम्रो-निर्मित फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [डिप्लोइमेन्ट गाइड](deployment-guide.md)
- **अर्को पाठ**: [क्षमताको योजना](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
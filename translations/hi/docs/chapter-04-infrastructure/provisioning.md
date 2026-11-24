# AZD के साथ Azure संसाधनों का प्रावधान

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - कोड के रूप में इन्फ्रास्ट्रक्चर और डिप्लॉयमेंट
- **⬅️ पिछला**: [डिप्लॉयमेंट गाइड](deployment-guide.md)
- **➡️ अगला अध्याय**: [अध्याय 5: मल्टी-एजेंट एआई समाधान](../../examples/retail-scenario.md)
- **🔧 संबंधित**: [अध्याय 6: प्री-डिप्लॉयमेंट सत्यापन](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

यह गाइड Azure Developer CLI का उपयोग करके Azure संसाधनों के प्रावधान और प्रबंधन को कवर करता है, जिसमें इसके अंतर्निहित Bicep और Terraform प्रदाता शामिल हैं।

> की समीक्षा `azd 1.37.2` (नवंबर 2026) के खिलाफ की गई। जब तक अन्यथा उल्लेख नहीं है, Bicep, Terraform, और स्क्रिप्ट उदाहरण **चित्रात्मक खंड** हैं, पूर्ण टेम्पलेट नहीं। इन्हें उन प्रोजेक्ट में मिलाएं जो संदर्भित पैरामीटर, मॉड्यूल, पहचान, नेटवर्किंग, और एप्लिकेशन कोड प्रदान करते हैं। इस समीक्षा में Azure प्रोविजनिंग निष्पादित नहीं किया गया था।

## शिक्षण लक्ष्य

इस गाइड को पूरा करके, आप:
- Infrastructure as Code के सिद्धांतों और Azure संसाधन प्रोविजनिंग में महारत हासिल करेंगे
- Azure Developer CLI द्वारा समर्थित कई IaC प्रदाताओं को समझेंगे
- सामान्य एप्लिकेशन आर्किटेक्चर के लिए Bicep टेम्पलेट डिज़ाइन और कार्यान्वित करेंगे
- संसाधन पैरामीटर, वेरिएबल्स, और पर्यावरण-विशिष्ट सेटिंग्स को कॉन्फ़िगर करेंगे
- नेटवर्किंग और सुरक्षा सहित उन्नत इन्फ्रास्ट्रक्चर पैटर्न को लागू करेंगे
- संसाधन जीवनचक्र, अपडेट, और निर्भरता समाधान प्रबंधित करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- Bicep और ARM टेम्प्लेट्स का उपयोग करके Azure इन्फ्रास्ट्रक्चर डिजाइन और प्रावधान करना
- उचित संसाधन निर्भरताओं के साथ जटिल मल्टी-सर्विस आर्किटेक्चर कॉन्फ़िगर करना
- कई पर्यावरणों और कॉन्फ़िगरेशन के लिए पैरामीटराइज़्ड टेम्प्लेट्स लागू करना
- इन्फ्रास्ट्रक्चर प्रावधान मुद्दों का निवारण करना और तैनाती विफलताओं को हल करना
- इन्फ्रास्ट्रक्चर डिज़ाइन पर Azure वेल-आर्किटेक्टेड फ्रेमवर्क सिद्धांत लागू करना
- इन्फ्रास्ट्रक्चर अपडेट प्रबंधित करना और इन्फ्रास्ट्रक्चर संस्करण रणनीतियाँ लागू करना

## इन्फ्रास्ट्रक्चर प्रावधान अवलोकन

Azure डेवलपर CLI कई इन्फ्रास्ट्रक्चर ऐज़ कोड (IaC) प्रदाताओं का समर्थन करता है:
- **Bicep** (सिफारिश की गई) - Azure की डोमेन-विशिष्ट भाषा
- **ARM टेम्प्लेट्स** - Bicep ARM में संकलित होता है; कच्चा ARM JSON एक अलग अंतर्निहित `infra.provider` नहीं है
- **Terraform** - मल्टी-क्लाउड इन्फ्रास्ट्रक्चर टूल
- **एक्सटेंशन प्रदाता** - एक अलग से स्थापित प्रदाता एक्सटेंशन और इसके प्रलेखित कॉन्फ़िगरेशन की आवश्यकता होती है; किसी भी प्रदाता स्ट्रिंग के समर्थित होने की गारंटी न दें

## Azure संसाधनों को समझना

### संसाधन पदानुक्रम
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### एप्लिकेशन के लिए सामान्य Azure सेवाएं
- **कंप्यूट**: App Service, Container Apps, Functions, Virtual Machines
- **स्टोरेज**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **नेटवर्किंग**: Virtual Network, Application Gateway, CDN
- **सुरक्षा**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep इन्फ्रास्ट्रक्चर टेम्प्लेट्स

### बेसिक Bicep टेम्प्लेट संरचना
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

एक पूर्ण azd प्रोजेक्ट के लिए, इस मॉड्यूल को एक सब्सक्रिप्शन-स्कोप्ड `infra/main.bicep` से कॉल करें जो एक टैग्ड रिसोर्स ग्रुप बनाता है और उसका स्कोप पास करता है। `main.parameters.json` में `environmentName`/`location` से मेल खाएं। `azd-service-name: web` टैग रिसोर्स को `services.web` के साथ जोड़ता है; केवल मनमाने आउटपुट नाम सेवा डिस्कवरी को कॉन्फ़िगर नहीं करते।

### उन्नत Bicep पैटर्न

#### मॉड्यूलर इन्फ्रास्ट्रक्चर
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

#### सशर्त रिसोर्स निर्माण
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

## 🌐 azd के साथ Terraform का उपयोग

Bicep azd का डिफ़ॉल्ट है, लेकिन azd **Terraform** का भी समर्थन करता है—यदि आपकी टीम पहले से इसे मानकीकृत करती है या आप मल्टी-क्लाउड इन्फ्रास्ट्रक्चर प्रबंधित करते हैं तो यह उपयोगी है। azd वर्कफ़्लो (`azd up`, `azd provision`, `azd down`) समान है; केवल इन्फ्रास्ट्रक्चर भाषा और फ़ोल्डर संरचना बदलती है।

### azd को Terraform इस्तेमाल करने के लिए बताएं

Terraform प्रदाता की ओर इशारा करते हुए `infra` अनुभाग को `azure.yaml` में जोड़ें:

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

### Terraform फ़ोल्डर लेआउट

Terraform प्रदाता के साथ, आपका `infra/` फ़ोल्डर Bicep के बजाय `.tf` फ़ाइलों का उपयोग करता है:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### एक `main.tf` खंड

यह केवल एक संसाधन समूह और योजना बनाता है, डिप्लॉय करने योग्य सेवा नहीं। आपको इनपुट वेरिएबल, एक संगत `azurerm` प्रदाता, वेब ऐप, और इसके सेवा टैग/संसाधन-नाम मैपिंग को भी घोषित करना होगा।

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

### azd आपके Terraform आउटपुट्स से कैसे जुड़ता है

azd Terraform **आउटपुट्स** को पर्यावरण मानों में पढ़ता है। यह खंड मानता है कि आपने `azurerm_linux_web_app.web` को परिभाषित किया है; सेवा खोज के लिए अभी भी एक सुसंगत संसाधन नाम या `azd-service-name` टैग आवश्यक है:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **महत्वपूर्ण:** azd संसाधन प्रति पर्यावरण को ट्रैक करने के लिए `azd-env-name` टैग और `AZURE_*` आउटपुट्स का उपयोग करता है। हमेशा अपने संसाधन समूह को `"azd-env-name" = var.environment_name` टैग करें ताकि `azd down` सब कुछ खोजकर हटा सके।

### Terraform के साथ डिप्लॉय करें

कमांड Bicep जैसे ही हैं:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **पूर्वशर्त:** Terraform इंस्टॉल होना चाहिए और आपके `PATH` पर होना चाहिए। azd Terraform *वर्कफ़्लो* का प्रबंधन करता है लेकिन आपके लिए Terraform इंस्टॉल नहीं करता। स्थिति के लिए, azd स्थानीय स्थिति को डिफ़ॉल्ट करता है; टीमों के लिए, एक रिमोट बैकएंड (उदाहरण के लिए, एक Azure Storage बैकएंड) को `provider.tf` में कॉन्फ़िगर करें।

संपूर्ण, चलाने योग्य Terraform-आधारित स्टार्टर के लिए, [Awesome AZD गैलरी](https://azure.github.io/awesome-azd/) ब्राउज़ करें और Terraform के लिए फ़िल्टर करें, या आधिकारिक [azd Terraform दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) देखें।

## 🧩 अन्य इन्फ्रास्ट्रक्चर टूल्स

Pulumi azd 1.37.2 प्राविजनिंग प्रदाता के रूप में अंतर्निहित नहीं है। केवल `infra.provider: pulumi` सेट करना कार्यशील एकीकरण स्थापित नहीं करता, और `azd env new` स्वचालित रूप से एक Pulumi स्टैक नहीं बनाता/चुनता। यदि आप कोई अन्य IaC टूल उपयोग करते हैं, तो सत्यापित प्रदाता विस्तार के दस्तावेज़ का पालन करें या अपने स्वयं के वर्कफ़्लो में इसके जीवनचक्र का स्पष्ट रूप से प्रबंधन करें। यह कोर्स Pulumi प्रदाता प्रदान नहीं करता या सत्यापित नहीं करता।

## 🎯 अपनी सेवा के लिए होस्ट चुनना

`host` क्षेत्र `azure.yaml` में तय करता है कि आपका कोड कहां चलेगा। azd कई होस्ट का समर्थन करता है—सही होस्ट का चयन इन्फ्रास्ट्रक्चर भाषा से अधिक महत्वपूर्ण है। यहाँ शुरुआती उपयोगकर्ताओं के लिए तुलनात्मक विवरण है:

| `host` मान | किसके लिए श्रेष्ठ | क्यों |
|--------------|----------|-----|
| `appservice` | पारंपरिक वेब ऐप्स और API | सबसे सरल PaaS; कंटेनर की आवश्यकता नहीं |
| `staticwebapp` | फ्रंट-एंड SPAs (React, Vue, Angular) | ग्लोबल CDN + मुफ्त SSL, बिल्ट-इन API सपोर्ट |
| `function` | इवेंट-चालित और सर्वरलेस वर्कलोड्स | शून्य तक स्केल, प्रति निष्पादन भुगतान |
| `containerapp` | कंटेनरयुक्त माइक्रोसर्विसेस | सर्वरलेस कंटेनर, शून्य तक स्केल, बिल्ट-इन इन्ग्रेस |
| `aks` | जटिल ऑर्केस्ट्रेशन आवश्यकताएँ | जब वास्तव में ज़रूरत हो तो पूर्ण कुबेरनेट्स नियंत्रण |
| `springapp` | मौजूदा Azure Spring Apps डिप्लॉयमेंट्स | पुराना लक्ष्य; सेवा 31 मार्च, 2028 को बंद हो जाएगी और नए ग्राहकों के लिए बंद है |

### AKS के लिए कब जाएं

**Azure Kubernetes Service (`host: aks`)** आपको Kubernetes की पूरी शक्ति देता है—कस्टम कंट्रोलर, सर्विस मेष, जटिल नेटवर्किंग, और सूक्ष्म शेड्यूलिंग। इस शक्ति के साथ संचालन की ज़िम्मेदारी आती है: आप नोड पूल, अपग्रेड, और क्लस्टर नेटवर्किंग का प्रबंधन करते हैं।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **यदि संभव हो तो सरल से शुरू करें।** अधिकांश माइक्रोसर्विस के लिए, **Container Apps** आपको कंटेनर, ऑटोस्केलिंग, और क्लस्टर प्रबंधन के बिना स्केल-टू-जीरो प्रदान करता है। केवल तब AKS चुनें जब आपको Kubernetes-विशिष्ट फीचर्स की आवश्यकता हो।

### Azure Spring Apps कब उपयोग करें

**Azure Spring Apps (`host: springapp`)** एक प्रबंधित रनटाइम है जो खास तौर पर Spring Boot के लिए बनाया गया है। यह सेवा खोज, कॉन्फ़िग सर्वर, और ब्लू-ग्रीन डिप्लॉयमेंट को संभालता है ताकि Java टीमें अपनी खुद की इंफ्रास्ट्रक्चर न चलाएं।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> नए शुरुआती परियोजना के लिए Azure Spring Apps का चयन न करें: यह नए ग्राहकों के लिए बंद है और [31 मार्च, 2028 को बंद हो जाएगा](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement)। समर्थित विकल्प जैसे Container Apps पसंद करें और मौजूदा डिप्लॉयमेंट्स के लिए माइग्रेशन योजना बनाएं।

## 🗃️ डेटाबेस प्रोविजनिंग

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
**खंड आवश्यकताएँ:** `@secure() param databasePassword string` घोषित करें और एक मजबूत प्रदत्त मान का उपयोग करें। सार्वजनिक एक्सेस चुनें **या** नीचे दिए गए डेलीगेटेड सबनेट/प्राइवेट DNS को एकीकृत करें; ये दोनों स्निपेट्स अपने आप जुड़ते नहीं हैं।

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

`0.0.0.0` नियम आपके अपने सब्सक्रिप्शन के बाहर Azure सेवाओं से कनेक्शन की अनुमति देता है। यह निजी नेटवर्किंग नहीं है; वास्तविक वर्कलोड के लिए प्रतिबंधित नेटवर्क डिज़ाइन को प्राथमिकता दें।

## 🔒 सुरक्षा और गुप्त प्रबंधन

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

### मैनेज्ड आइडेंटिटी कॉन्फ़िगरेशन
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

सिस्टम-निर्धारित पहचान के लिए, इसे उसके प्रिंसिपल ID के लिए `AZURE_CLIENT_ID` सेट न करें। एक उपयोगकर्ता-निर्धारित पहचान इसके **क्लाइंट ID** का उपयोग करती है, न कि इसके ऑब्जेक्ट/प्रिंसिपल ID का। Key Vault संदर्भ के लिए ऐप पहचान का वॉल्ट रोल असाइनमेंट और नेटवर्क एक्सेस भी आवश्यक है।

## 🌍 नेटवर्किंग और कनेक्टिविटी

### वर्चुअल नेटवर्क कॉन्फ़िगरेशन
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

### SSL के साथ एप्लिकेशन गेटवे
**अधूरा आर्किटेक्चर खंड, तैनात करने योग्य गेटवे नहीं:** VNet में समर्पित `gateway-subnet` जोड़ें, साथ ही बैकएंड पूल, HTTP सेटिंग्स, लिसनर्स, प्रायोरिटी के साथ रूटिंग नियम, और एक TLS प्रमाणपत्र (या अधिकृत Key Vault संदर्भ)। केवल पोर्ट 443 खोलना HTTPS को कॉन्फ़िगर नहीं करता।

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

## 📊 मॉनिटरिंग और प्रेक्षणीयता

### एप्लिकेशन इनसाइट्स
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

### कस्टम मीट्रिक्स और अलर्ट्स
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

## 🔧 पर्यावरण-विशिष्ट कॉन्फ़िगरेशन

### विभिन्न पर्यावरणों के लिए पैरामीटर फ़ाइलें
नीचे दी गई दोनों फ़ाइलें **वैकल्पिक पैरामीटर-फ़ाइल उदाहरण** हैं। azd स्वचालित रूप से पर्यावरण नाम के आधार पर `main.parameters.dev.json` या `main.parameters.prod.json` का चयन नहीं करता। असली `main.parameters.json` का उपयोग करें पर्यावरण प्रतिस्थापन के साथ (उदाहरण के लिए `${APP_SERVICE_SKU=B1}`), और Bicep में हर पैरामीटर घोषित/उपयोग करें।

`infra/main.parameters.dev.json` की उदाहरण सामग्री:

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

`infra/main.parameters.prod.json` की उदाहरण सामग्री:

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

### सशर्त संसाधन प्रोविजनिंग
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

## 🚀 उन्नत प्रोविजनिंग पैटर्न

### बहु-क्षेत्रीय तैनाती
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

### अवसंरचना परीक्षण
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

अवसंरचना प्रोविजनिंग आपके एप्लिकेशन कोड को तैनात नहीं करता। केवल `azd deploy`/`azd up` के बाद एप्लिकेशन जांच चलाएँ, और यदि आपका ऐप इसे लागू करता है तभी `/health` का उपयोग करें। ARM तैनाती स्क्रिप्ट Azure संसाधन बनाती हैं और अतिरिक्त पहचान, समर्थित रनटाइम संस्करण, और अनुमति आवश्यकता होती है; ये स्थानीय यूनिट टेस्ट नहीं हैं।

## 🧪 अवसंरचना पूर्वावलोकन और सत्यापन (नया)

### तैनाती से पहले अवसंरचना परिवर्तनों का पूर्वावलोकन करें

`azd provision --preview` फीचर आपको **अवसंरचना प्रोविजनिंग का अनुकरण** करने की अनुमति देता है, इससे पहले कि आप वास्तव में संसाधन तैनात करें। यह `terraform plan` या `bicep what-if` के समान है, जो आपके Azure पर्यावरण में किए जाने वाले परिवर्तनों का **ड्राई-रन दृश्य** देता है।

#### 🛠️ यह क्या करता है
- **आपके IaC टेम्पलेट्स (Bicep या Terraform) का विश्लेषण करता है**
- **संसाधन परिवर्तनों का पूर्वावलोकन दिखाता है**: जोड़, हटाना, अपडेट्स
- **प्रदाता द्वारा प्रस्तावित अवसंरचना परिवर्तनों को लागू नहीं करता** — पहले प्रोजेक्ट हुक्स को निरीक्षण करें; स्क्रिप्ट्स के साइड इफेक्ट हो सकते हैं और पूर्वावलोकन के लिए Azure अनुमति अभी भी आवश्यक है

#### उपयोग के मामले
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

यह कमांड आपकी सहायता करता है:
- **संसाधन प्रतिबद्ध करने से पहले अवसंरचना परिवर्तनों को सत्यापित करें**
- विकास चक्र में **गलत कॉन्फ़िगरेशन जल्दी पकड़ें**
- टीम पर्यावरण में **सुरक्षित सहयोग करें**
- **सरलता में न्यूनतम-विशेषाधिकार तैनाती सुनिश्चित करें**

यह विशेष रूप से उपयोगी है जब:
- जटिल बहु-सेवा पर्यावरण पर काम कर रहे हों
- उत्पादन अवसंरचना में परिवर्तन कर रहे हों
- PR अनुमोदन से पहले टेम्पलेट संशोधनों का सत्यापन करना
- अवसंरचना पैटर्न पर नए टीम सदस्यों को प्रशिक्षण देना

### पूर्वावलोकन आउटपुट का उदाहरण
सटीक पूर्वावलोकन आउटपुट प्रदाता और प्रोजेक्ट संरचना के अनुसार भिन्न होता है, लेकिन परिणाम को स्पष्ट रूप से प्रस्तावित परिवर्तनों की पहचान करनी चाहिए इससे पहले कि कुछ भी लागू हो।

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

## 🔄 संसाधन अपडेट और माइग्रेशन

### सुरक्षित संसाधन अपडेट
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

### डेटाबेस माइग्रेशन
**अधूरा तैनाती-स्क्रिप्ट पैटर्न:** आवश्यकता होती है आवश्यक स्थानों पर एक कॉन्फ़िगर किया गया उपयोगकर्ता-निर्धारित पहचान, समर्थित Azure CLI रनटाइम, उपलब्ध माइग्रेशन टूल, एक प्रदत्त माइग्रेशन निर्देशिका/कॉन्फ़िगरेशन, और डेटाबेस कनेक्टिविटी। यह केवल इस संसाधन को टेम्पलेट में चिपकाकर निष्पादनीय नहीं है।

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

## 🎯 सर्वोत्तम प्रथाएँ

### 1. संसाधन नामकरण सम्मेलन
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. टैगिंग रणनीति
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

### 3. पैरामीटर मान्यता
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

## अगले कदम

- [पूर्व-तैनाती योजना](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन उपलब्धता सत्यापित करें
- [सामान्य समस्याएँ](../chapter-07-troubleshooting/common-issues.md) - अवसंरचना समस्याओं का निवारण करें
- [डिबगिंग गाइड](../chapter-07-troubleshooting/debugging.md) - प्रोविजनिंग समस्याओं को डिबग करें
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सेवा स्तर चुनें

## अतिरिक्त संसाधन

- [Azure Bicep दस्तावेज़](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure रिसोर्स मैनेजर टेम्पलेट्स](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure वेल-आर्किटेक्टेड फ्रेमवर्क](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेविगेशन**
- **पिछला पाठ**: [डिप्लॉयमेंट गाइड](deployment-guide.md)
- **अगला पाठ**: [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# AZD के साथ Azure संसाधनों का प्रोविजनिंग

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम मुख पृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर ऐज़ कोड और परिनियोजन
- **⬅️ पिछला**: [Deployment Guide](deployment-guide.md)
- **➡️ अगला अध्याय**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 संबंधित**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

यह व्यापक मार्गदर्शिका Azure Developer CLI का उपयोग करके Azure संसाधनों के प्रोविजनिंग और प्रबंधन के बारे में सब कुछ कवर करती है। Bicep, ARM टेम्पलेट्स, Terraform, और Pulumi का उपयोग करके बुनियादी संसाधन निर्माण से लेकर उन्नत एंटरप्राइज़-ग्रेड इन्फ्रास्ट्रक्चर आर्किटेक्चर तक Infrastructure as Code (IaC) पैटर्न लागू करना सीखें।

## सीखने के लक्ष्य

इस गाइड को पूरा करने पर आप:
- Infrastructure as Code सिद्धांतों और Azure संसाधन प्रोविजनिंग में निपुण होंगे
- Azure Developer CLI द्वारा समर्थित कई IaC प्रदाताओं को समझेंगे
- सामान्य एप्लिकेशन आर्किटेक्चर के लिए Bicep टेम्पलेट डिजाइन और लागू करेंगे
- संसाधन पैरामीटर, वेरिएबल्स, और पर्यावरण-विशिष्ट सेटिंग्स कॉन्फ़िगर करेंगे
- नेटवर्किंग और सुरक्षा सहित उन्नत इन्फ्रास्ट्रक्चर पैटर्न लागू करेंगे
- संसाधन लाइफसाइकल, अपडेट्स, और निर्भरता समाधान का प्रबंधन करेंगे

## सीखने के परिणाम

पूरा करने पर आप सक्षम होंगे:
- Bicep और ARM टेम्पलेट्स का उपयोग करके Azure इन्फ्रास्ट्रक्चर डिजाइन और प्रोविजन करना
- सही संसाधन निर्भरताओं के साथ जटिल बहु-सेवा आर्किटेक्चर कॉन्फ़िगर करना
- कई वातावरणों और कॉन्फ़िगरेशन के लिए पैरामीटरयुक्त टेम्पलेट लागू करना
- इन्फ्रास्ट्रक्चर प्रोविजनिंग समस्याओं का निवारण और परिनियोजन विफलताओं का समाधान करना
- इन्फ्रास्ट्रक्चर डिजाइन में Azure Well-Architected Framework सिद्धांत लागू करना
- इन्फ्रास्ट्रक्चर अपडेट्स का प्रबंधन और संस्करणन रणनीतियाँ लागू करना

## इन्फ्रास्ट्रक्चर प्रोविजनिंग अवलोकन

Azure Developer CLI कई Infrastructure as Code (IaC) प्रदाताओं का समर्थन करता है:
- **Bicep** (अनुशंसित) - Azure की डोमेन-विशिष्ट भाषा
- **ARM Templates** - JSON-आधारित Azure Resource Manager टेम्पलेट्स
- **Terraform** - मल्टी-क्लाउड इन्फ्रास्ट्रक्चर टूल
- **Pulumi** - प्रोग्रामिंग भाषाओं के साथ आधुनिक इंफ्रास्ट्रक्चर ऐज़ कोड

## Azure संसाधनों को समझना

### संसाधन पदानुक्रम
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### एप्लिकेशन के लिए सामान्य Azure सेवाएँ
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स

### बुनियादी Bicep टेम्पलेट संरचना
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

#### शर्तीय संसाधन निर्माण
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

## 🌐 azd के साथ Terraform का उपयोग करना

Bicep azd का डिफ़ॉल्ट है, लेकिन azd **Terraform** का भी समर्थन करता है—यह उपयोगी है अगर आपकी टीम पहले से ही इसे मानक बना चुकी है या आप मल्टी-क्लाउड इन्फ्रास्ट्रक्चर प्रबंधित करते हैं। azd वर्कफ़्लो (`azd up`, `azd provision`, `azd down`) एक समान है; केवल इन्फ्रास्ट्रक्चर भाषा और फ़ोल्डर लेआउट बदलते हैं।

### azd को Terraform उपयोग करने के लिए बताना

Terraform प्रदाता की तरफ इशारा करते हुए `azure.yaml` में एक `infra` सेक्शन जोड़ें:

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

### एक न्यूनतम `main.tf`

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

### azd आपके Terraform आउटपुट से कैसे जुड़ता है

azd आपके एंडपॉइंट्स को जानने और आपके ऐप में पर्यावरण मान वापस वायर करने के लिए Terraform **outputs** पढ़ता है। आउटपुट नाम मायने रखते हैं—azd कुछ विशिष्ट नाम देखता है:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **महत्वपूर्ण:** azd संसाधनों को प्रति वातावरण ट्रैक करने के लिए `azd-env-name` टैग और `AZURE_*` आउटपुट्स का उपयोग करता है। हमेशा अपने रिसोर्स ग्रुप को `"azd-env-name" = var.environment_name` के साथ टैग करें ताकि `azd down` सब कुछ ढूंढ कर हटा सके।

### Terraform के साथ परिनियोजन करें

कमांड बिल्कुल वही हैं जो Bicep के लिए हैं:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd आंतरिक रूप से 'terraform plan' चलाता है
azd up                    # प्राविजन + तैनाती
azd down --force          # Terraform द्वारा प्रबंधित संसाधनों को नष्ट करता है
```

> **पूर्वाप्रश्न:** Terraform को इंस्टॉल किया गया होना चाहिए और यह आपके `PATH` पर होना चाहिए। azd Terraform *workflow* का प्रबंधन करता है पर Terraform आपके लिए इंस्टॉल नहीं करता। स्टेट के लिए, azd डिफ़ॉल्ट रूप से लोकल स्टेट का उपयोग करता है; टीम्स के लिए, `provider.tf` में रिमोट बैकएंड (उदाहरण के लिए, एक Azure Storage backend) कॉन्फ़िगर करें।

पूर्ण, चलने योग्य Terraform-आधारित स्टार्टर ब्राउज़ करने के लिए [Awesome AZD gallery](https://azure.github.io/awesome-azd/) देखें और Terraform के लिए फ़िल्टर करें, या आधिकारिक [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) देखिए।

## 🧩 azd के साथ Pulumi का उपयोग करना

यदि आपकी टीम एक सामान्य-उद्देश्य भाषा (TypeScript, Python, Go, या C#) में इन्फ्रास्ट्रक्चर लिखती है बजाय किसी DSL के, तो azd **Pulumi** का भी समर्थन करता है। Terraform की तरह, `azd up` / `azd provision` / `azd down` वर्कफ़्लो अपरिवर्तित है—केवल इन्फ्रास्ट्रक्चर टूलिंग और फ़ोल्डर लेआउट अलग होते हैं।

### azd को Pulumi उपयोग करने के लिए बताना

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

### Pulumi फ़ोल्डर लेआउट

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### एक न्यूनतम `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// हर संसाधन को टैग करें ताकि azd उन्हें ट्रैक और साफ़ कर सके
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd इन आउटपुट्स को आपके पर्यावरण में वापस पढ़ता है
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### स्टैक्स azd वातावरणों से मैप होते हैं

Pulumi डिप्लॉयमेंट्स को **stacks** में आयोजित करता है, और azd प्रत्येक azd वातावरण को उसी नाम के Pulumi स्टैक से मैप करता है। जब आप `azd env new staging` चलाते हैं, azd `staging` Pulumi स्टैक का चयन (या निर्माण) करता है। वही `azd-env-name` टैगिंग और `AZURE_*` आउटपुट नियम लागू होते हैं, ताकि `azd down` सब कुछ ढूंढ कर हटा सके।

### Pulumi के साथ परिनियोजन करें

```bash
azd auth login
azd env new dev
azd provision --preview   # azd अंतर्निहित रूप से 'pulumi preview' चलाता है
azd up                    # प्राविजन + तैनाती
azd down --force          # 'pulumi destroy' चलाता है
```

> **पूर्वाप्रश्न:** Pulumi को इंस्टॉल किया गया होना चाहिए और यह आपके `PATH` पर होना चाहिए, और आपको एक स्टेट बैकएंड की आवश्यकता होगी (Pulumi Cloud या एक self-managed बैकएंड जैसे Azure Blob Storage)। azd Pulumi *workflow* का प्रबंधन करता है, इंस्टॉलेशन का नहीं। आधिकारिक [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) देखें।

## 🎯 अपनी सेवा के लिए होस्ट चुनना

`azure.yaml` में `host` फ़ील्ड तय करता है कि आपका कोड कहाँ चलेगा। azd कई होस्ट का समर्थन करता है—सही होस्ट चुनना इन्फ्रास्ट्रक्चर भाषा से अधिक मायने रखता है। यहाँ शुरुआती के लिए एक तुलना है:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | पारंपरिक वेब ऐप्स और APIs | सबसे सरल PaaS; कंटेनर की आवश्यकता नहीं |
| `staticwebapp` | फ्रंट-एंड SPAs (React, Vue, Angular) | ग्लोबल CDN + मुफ्त SSL, बिल्ट-इन API समर्थन |
| `function` | इवेंट-ड्रिवन और सर्वरलेस वर्कलोड्स | स्केल-टू-जीरो, प्रति-प्रयोग भुगतान |
| `containerapp` | कंटेनराइज्ड माइक्रोसर्विसेज | सर्वरलेस कंटेनर, स्केल-टू-जीरो, बिल्ट-इन इनग्रेश |
| `aks` | जटिल ऑर्केस्ट्रेशन आवश्यकताएँ | जब वास्तव में जरूरत हो तो फुल Kubernetes नियंत्रण |
| `springapp` | Java Spring Boot ऐप्स | Spring के लिए ट्यून किया हुआ Managed Azure Spring Apps रनटाइम |

### जब AKS चुनें

**Azure Kubernetes Service (`host: aks`)** आपको Kubernetes की पूरी शक्ति देता है—कस्टम कंट्रोलर, सर्विस मेंश, जटिल नेटवर्किंग, और फाइन-ग्रेन शेड्यूलिंग। यह शक्ति संचालनात्मक ओवरहेड के साथ आती है: आपको नोड पूल, अपग्रेड्स, और क्लस्टर नेटवर्किंग का प्रबंधन करना होगा।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **यदि संभव हो तो सरल से शुरू करें।** अधिकांश माइक्रोसर्विसेज के लिए, **Container Apps** आपको कंटेनर, ऑटोस्केलिंग, और स्केल-टू-जीरो देता है बिना क्लस्टर का प्रबंधन किए। केवल तब AKS चुनें जब आपको Kubernetes-विशिष्ट सुविधाओं की आवश्यकता हो।

### जब Azure Spring Apps का उपयोग करें

**Azure Spring Apps (`host: springapp`)** एक managed runtime है जो Spring Boot के लिए बना है। यह सर्विस डिस्कवरी, कॉन्फ़िग सर्वर, और ब्लू-ग्रीन परिनियोजन को संभालता है ताकि Java टीमें अपना इंफ्रास्ट्रक्चर स्वयं न चलाएँ।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> `springapp` का उपयोग तब करें जब आपके पास मौजूदा Spring Boot ऐप्स हों और आप उनके लिए एक ट्यून रनटाइम चाहते हों। बिना Spring-विशिष्ट आवश्यकताओं वाले नए कंटेनरीकृत Java ऐप्स के लिए, `containerapp` अक्सर सरल विकल्प होता है।

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

## 🔒 सुरक्षा और सीक्रेट्स प्रबंधन

### Key Vault इंटीग्रेशन
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

### Managed Identity कॉन्फ़िगरेशन
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

### SSL के साथ Application Gateway
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

## 📊 मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

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

### कस्टम मेट्रिक्स और अलर्ट
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

## 🔧 वातावरण-विशिष्ट कॉन्फ़िगरेशन

### विभिन्न वातावरणों के लिए पैरामीटर फ़ाइलें
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

### शर्तीय संसाधन प्रोविजनिंग
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

## 🚀 उन्नत प्रोविजनिंग पैटर्न

### मल्टी-रीजन परिनियोजन
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

### इन्फ्रास्ट्रक्चर परीक्षण
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

## 🧪 इन्फ्रास्ट्रक्चर प्रीव्यू और वैलिडेशन (नया)

### परिनियोजन से पहले इन्फ्रास्ट्रक्चर परिवर्तन पूर्वावलोकन करें

`azd provision --preview` फ़ीचर आपको संसाधनों को वास्तव में परिनियोजित करने से पहले **इन्फ्रास्ट्रक्चर प्रोविजनिंग का अनुकरण** करने देता है। यह `terraform plan` या `bicep what-if` की भावना के समान है, आपको यह दिखाते हुए कि आपके Azure वातावरण में क्या बदलाव किए जाएंगे — एक **ड्राय-रन दृश्य** देता है।

#### 🛠️ यह क्या करता है
- **आपके IaC टेम्पलेट्स का विश्लेषण करता है** (Bicep या Terraform)
- **संसाधन परिवर्तनों का पूर्वावलोकन दिखाता है**: जोड़, हटाना, अपडेट
- **परिवर्तन लागू नहीं करता** — यह केवल-पढ़ने वाला है और चलाने के लिए सुरक्षित है

#### उपयोग के मामले
```bash
# तैनाती से पहले बुनियादी ढांचे में होने वाले परिवर्तनों का पूर्वावलोकन
azd provision --preview

# विशिष्ट वातावरण के लिए पूर्वावलोकन
azd provision --preview -e production
```

यह कमांड आपकी मदद करता है:
- संसाधन लागू करने से पहले **इन्फ्रास्ट्रक्चर परिवर्तनों को मान्य करें**
- विकास चक्र में जल्दी **कन्फ़िगरेशन त्रुटियों को पकड़े**
- टीम वातावरण में **सुरक्षित सहयोग** करें
- बिना सरप्राइज के **लीस्ट-प्रिविलेज परिनियोजन** सुनिश्चित करें

यह विशेष रूप से उपयोगी है जब:
- जटिल बहु-सेवा वातावरणों के साथ काम कर रहे हों
- प्रोडक्शन इन्फ्रास्ट्रक्चर में परिवर्तन कर रहे हों
- PR अनुमोदन से पहले टेम्पलेट संशोधनों का सत्यापन कर रहे हों
- इन्फ्रास्ट्रक्चर पैटर्न पर नए टीम सदस्यों को प्रशिक्षित कर रहे हों

### उदाहरण प्रीव्यू आउटपुट
सटीक प्रीव्यू आउटपुट प्रदाता और प्रोजेक्ट संरचना के अनुसार भिन्न होता है, लेकिन परिणाम को प्रस्तावित परिवर्तनों को स्पष्ट रूप से पहचानना चाहिए इससे पहले कि कुछ भी लागू किया जाए।

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

## �🔄 संसाधन अद्यतन और माइग्रेशन

### सुरक्षित संसाधन अपडेट्स
```bash
# सबसे पहले इन्फ्रास्ट्रक्चर परिवर्तनों का पूर्वावलोकन करें (अनुशंसित)
azd provision --preview

# पूर्वावलोकन की पुष्टि के बाद परिवर्तन लागू करें
azd provision --confirm-with-no-prompt

# रोलबैक के लिए, इन्फ्रास्ट्रक्चर परिवर्तनों को पूर्ववत करने के लिए Git का उपयोग करें:
git revert HEAD  # अंतिम इन्फ्रास्ट्रक्चर कमिट को पूर्ववत करें
azd provision    # पिछली इन्फ्रास्ट्रक्चर स्थिति लागू करें
```

### डेटाबेस माइग्रेशन
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

## 🎯 सर्वोत्तम प्रथाएँ

### 1. संसाधन नामकरण कन्वेंशन
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. टैगिंग रणनीति
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

### 3. पैरामीटर सत्यापन
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

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन उपलब्धता मान्य करें
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - इन्फ्रास्ट्रक्चर समस्याओं का निवारण करें
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - प्रोविजनिंग समस्याओं को डिबग करें
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सर्विस टीयर चुनें

## अतिरिक्त संसाधन

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**नेविगेशन**
- **पिछला पाठ**: [Deployment Guide](deployment-guide.md)
- **अगला पाठ**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
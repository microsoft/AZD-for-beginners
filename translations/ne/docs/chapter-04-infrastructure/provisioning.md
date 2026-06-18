# AZD प्रयोग गरेर Azure स्रोतहरू प्रावधान गर्ने

**Chapter Navigation:**
- **📚 Course Home**: [AZD आरम्भकर्ताहरूको लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 4 - कोडको रूपमा पूर्वधार र परिनियोजन
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **➡️ Next Chapter**: [अध्याय 5: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)
- **🔧 Related**: [अध्याय 6: पूर्व-परिनियोजन मान्यकरण](../chapter-06-pre-deployment/capacity-planning.md)

## परिचय

यो विस्तृत मार्गदर्शिकाले Azure Developer CLI प्रयोग गरेर Azure स्रोतहरू कसरी प्रावधान र व्यवस्थापन गर्ने भन्ने सबै कुरा समेट्छ। बुनियादी स्रोत सिर्जना देखि लिएर उद्यम-स्तरका पूर्वाधार आर्किटेक्चरहरू सम्म Bicep, ARM टेम्पलेटहरू, Terraform, र Pulumi प्रयोग गरेर Infrastructure as Code (IaC) ढाँचाहरू लागू गर्न सिक्नुहोस्।

## सिकाइ लक्ष्यहरू

यो मार्गदर्शिका पूरा गर्दा तपाईंले:
- Infrastructure as Code सिद्धान्त र Azure स्रोत प्रावधानमा मास्टरी हासिल गर्नुहुनेछ
- Azure Developer CLI द्वारा समर्थन गरिएका विभिन्न IaC प्रदायकहरू बुझ्नुहुनेछ
- साधारण एप्लिकेशन आर्किटेक्चरसँग मेल खाने Bicep टेम्पलेटहरू डिजाइन र कार्यान्वयन गर्न सक्नुहुनेछ
- स्रोत प्यारामिटरहरू, भेरिएबलहरू, र वातावरण-विशिष्ट सेटिङहरू कन्फिगर गर्न सिक्नुहुनेछ
- नेटवर्किङ र सुरक्षा सहित उन्नत पूर्वाधार ढाँचाहरू लागू गर्न सक्नुहुनेछ
- स्रोत जीवनचक्र, अपडेटहरू, र निर्भरताको समाधान व्यवस्थापन गर्न सक्षम हुनुहुनेछ

## सिकाइ नतिजाहरू

समाप्ति पछि, तपाईं सक्षम हुनुहुनेछ:
- Bicep र ARM टेम्पलेटहरू प्रयोग गरेर Azure पूर्वाधार डिजाइन र प्रावधान गर्न
- उपयुक्त स्रोत निर्भरताहरूसहित जटिल बहु-सेवा आर्किटेक्चरहरू कन्फिगर गर्न
- बहु वातावरण र कन्फिगरेसनहरूका लागि प्यारामेटराइज्ड टेम्पलेटहरू लागू गर्न
- पूर्वाधार प्रावधान समस्याहरू ट्रबलशुट गरेर परिनियोजन असफलताहरू समाधान गर्न
- Azure Well-Architected Framework सिद्धान्तहरू पूर्वाधार डिजाइनमा लागू गर्न
- पूर्वाधार अपडेटहरू व्यवस्थापन र पूर्वाधार भर्सनिङ रणनीतिहरू कार्यान्वयन गर्न

## पूर्वाधार प्रावधान ओभरभ्यू

Azure Developer CLI ले धेरै Infrastructure as Code (IaC) प्रदायकहरू समर्थन गर्दछ:
- **Bicep** (सिफारिश गरिन्छ) - Azure को डोमेन-विशेष भाषा
- **ARM Templates** - JSON-आधारित Azure Resource Manager टेम्पलेटहरू
- **Terraform** - बहु-क्लाउड पूर्वाधार उपकरण
- **Pulumi** - प्रोग्रामिङ भाषाहरूको साथ आधुनिक Infrastructure as Code

## Azure स्रोतहरू बुझ्दै

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### अनुप्रयोगहरूको लागि सामान्य Azure सेवाहरू
- **कम्प्युट**: App Service, Container Apps, Functions, Virtual Machines
- **भण्डारण**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **नेटवर्किङ**: Virtual Network, Application Gateway, CDN
- **सुरक्षा**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep पूर्वाधार टेम्पलेटहरू

### आधारभूत Bicep टेम्पलेट संरचना
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

### उन्नत Bicep ढाँचाहरू

#### मोडुलर पूर्वाधार
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

## 🌐 azd सँग Terraform प्रयोग गर्नु

Bicep azd को डिफल्ट हो, तर azd ले **Terraform** पनि समर्थन गर्दछ—यदि तपाईंको टोली पहिले नै यसमा मानकीकरण गर्छ वा तपाईं बहु-क्लाउड पूर्वाधार व्यवस्थापन गर्नुहुन्छ भने उपयोगी हुन्छ। azd वर्कफ्लो (`azd up`, `azd provision`, `azd down`) ठ्याक्कै एउटै हुन्छ; केवल पूर्वाधार भाषा र फोल्डर लेआउट परिवर्तन हुन्छ।

### azd लाई Terraform प्रयोग गर्न भन्नुहोस्

Terraform प्रदायक तर्फ संकेत गर्दै `azure.yaml` मा `infra` सेक्शन थप्नुहोस्:

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

Terraform प्रदायकको साथ, तपाईंको `infra/` फोल्डरले Bicep को सट्टा `.tf` फाइलहरू प्रयोग गर्दछ:

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

### azd कसरी तपाईंको Terraform आउटपुटहरूमा जडान गर्दछ

azd ले Terraform **outputs** पढ्छ ताकि तपाईंका endpoints थाहा पाओस् र वातावरण मानहरू तपाईंको एपमा फर्काउन सकियोस्। आउटपुट नामहरू महत्वपूर्ण हुन्छन्—azd ले विशिष्ट नामहरू खोज्छ:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Important:** azd ले `azd-env-name` ट्याग र `AZURE_*` आउटपुटहरू प्रयोग गरेर वातावरणअनुसार स्रोतहरू ट्र्याक गर्छ। सधैं आफ्नो रिसोर्स ग्रुपमा `"azd-env-name" = var.environment_name` ट्याग गर्नुहोस् ताकि `azd down` ले सबै कुरा फेला पारेर हटाउन सकोस्।

### Terraform सँग परिनियोजन

कमाण्डहरू Bicep जस्तै नै हुन्:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd पृष्ठभूमिमा 'terraform plan' चलाउँछ
azd up                    # प्राविजन + परिनियोजन
azd down --force          # Terraform द्वारा व्यवस्थापन गरिएका संसाधनहरू नष्ट गर्दछ
```

> **Prerequisite:** Terraform इन्स्टल गरिएको र तपाईंको `PATH` मा हुनुपर्छ। azd ले Terraform को *workflow* व्यवस्थापन गर्छ तर Terraform तपाईंका लागि इन्स्टल गर्दैन। स्टेटका लागि, azd ले डिफल्ट रूपमा स्थानीय स्टेट प्रयोग गर्छ; टोलीहरूका लागि, `provider.tf` मा रिमोट ब्याकएन्ड (उदाहरणका लागि Azure Storage ब्याकएन्ड) कन्फिगर गर्नुहोस्।

पूर्ण, runnable Terraform-आधारित स्टार्टरहरूको लागि, [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ब्राउज गर्नुहोस् र Terraform फिल्टर गर्नुहोस्, वा आधिकारिक [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) हेर्नुहोस्।

## 🧩 azd सँग Pulumi प्रयोग गर्नु

यदि तपाईंको टोलीले एक सामान्य-उद्देश्य भाषा (TypeScript, Python, Go, वा C#) मा पूर्वाधार लेख्छ भने DSL भन्दा, azd ले **Pulumi** पनि समर्थन गर्छ। Terraform जस्तो, `azd up` / `azd provision` / `azd down` वर्कफ्लो अपरिवर्तित छ—केवल पूर्वाधार उपकरण र फोल्डर लेआउट फरक हुन्छ।

### azd लाई Pulumi प्रयोग गर्न भन्नुहोस्

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

### एक न्यूनतम `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// azd ले ट्र्याक गरी सफा गर्न सकोस् भन्नका लागि प्रत्येक स्रोतलाई ट्याग गर्नुहोस्
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd यी आउटपुटहरूलाई तपाईंको वातावरणमा फिर्ता पढ्छ
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### स्ट्याकहरू azd वातावरणसँग नक्सा हुन्छन्

Pulumi ले परिनियोजनहरूलाई **stacks** मा व्यवस्थित गर्छ, र azd ले प्रत्येक azd वातावरणलाई सोही नामको Pulumi स्ट्याकसँग म्याप गर्छ। जब तपाईं `azd env new staging` चलाउनुहुन्छ, azd ले `staging` Pulumi स्ट्याक छान्छ (वा सिर्जना गर्छ)। त्यही `azd-env-name` ट्यागिङ र `AZURE_*` आउटपुट नियमहरू लागू हुन्छन्, ताकि `azd down` ले सबै कुरा फेला पारेर हटाउन सकोस्।

### Pulumi सँग परिनियोजन

```bash
azd auth login
azd env new dev
azd provision --preview   # azd ले भित्रै 'pulumi preview' चलाउँछ
azd up                    # प्राविजन + परिनियोजन
azd down --force          # 'pulumi destroy' चलाउँछ
```

> **Prerequisite:** Pulumi इन्स्टल गरिएको र तपाईंको `PATH` मा हुनुपर्छ, र तपाईंलाई स्टेट ब्याकएन्ड चाहिन्छ (Pulumi Cloud वा Azure Blob Storage जस्ता स्व-प्रबन्धित ब्याकएन्ड)। azd ले Pulumi को *workflow* व्यवस्थापन गर्छ, इन्स्टल गर्दैन। आधिकारिक [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) हेर्नुहोस्।

## 🎯 तपाईंको सेवाको लागि होस्ट कसरी रोज्ने

`host` फिल्डले `azure.yaml` मा निर्णय गर्छ कि तपाईंको कोड कहाँ चल्नेछ। azd ले केही होस्टहरू समर्थन गर्छ—उपयुक्त एउटा रोज्नु पूर्वाधार भाषाभन्दा बढी महत्त्वपूर्ण हुन्छ। यहाँ एउटा शुरुवातकर्ताका लागि तुलना छ:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | परम्परागत वेब एपहरू र API हरू | सबैभन्दा सरल PaaS; कन्टेनर चाहिँदैन |
| `staticwebapp` | फ्रन्ट-एन्ड SPA हरू (React, Vue, Angular) | ग्लोबल CDN + निःशुल्क SSL, बिल्ट-इन API समर्थन |
| `function` | घटना-आधारित र सर्भरलेस कार्यभारहरू | स्केल-टु-ज़िरो, प्रति-एक्जिक्युसन तिर्ने मोडेल |
| `containerapp` | कन्टेनराइज्ड माइक्रोसर्भिसहरू | सर्भरलेस कन्टेनरहरू, स्केल-टु-ज़िरो, बिल्ट-इन इन्ग्रेस |
| `aks` | जटिल अর্কेस्ट्रेसन आवश्यकताहरू | जब साँच्चिकै चाहिन्छ तब पुरा Kubernetes नियन्त्रण |
| `springapp` | Java Spring Boot एपहरू | Spring का लागि ट्युन गरिएको Managed Azure Spring Apps runtime |

### AKS तर्फ कहिले पुग्ने

**Azure Kubernetes Service (`host: aks`)** ले तपाईंलाई Kubernetes को पूरा शक्ती दिन्छ—कस्टम कन्ट्रोलरहरू, सर्भिस मेशहरू, जटिल नेटवर्किङ, र सूक्ष्म-ग्रान्युलर शेड्युलिङ। यो शक्ती अपरेसनल ओभरहेडसँग आउँछ: तपाईंले नोड पूलहरू, अपग्रेडहरू, र क्लस्टर नेटवर्किङ व्यवस्थापन गर्नुपर्छ।

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Start simpler if you can.** धेरै माइक्रोसर्भिसहरूको लागि, **Container Apps** ले कन्टेनरहरू, अटोस्केलिङ, र स्केल-टु-ज़िरो दिन्छ क्लस्टर व्यवस्थापन बिना। Kubernetes-विशेष सुविधाहरू चाहिएको बेला मात्र AKS रोज्नुहोस्।

### Azure Spring Apps कहिले प्रयोग गर्ने

**Azure Spring Apps (`host: springapp`)** Spring Boot का लागि उद्धेश्यबद्ध Managed runtime हो। यो सेवा डिस्कभरी, कन्फिग सर्भर, र ब्लू-ग्रीन परिनियोजन ह्यान्डल गर्छ ताकि Java टोलीहरूले आफैंको पूर्वाधार दौडाउन नपरोस्।

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> `springapp` प्रयोग गर्नुहोस् जब तपाईंसँग अवस्थित Spring Boot एपहरू छन् र Spring-विशेष आवश्यकताहरूको लागि ट्युन गरिएको runtime चाहनुहुन्छ। नयाँ कन्टेनराइज्ड Java एपहरूका लागि जुन Spring-विशेष आवश्यकताहरू छैनन्, `containerapp` प्रायः सरल विकल्प हुन्छ।

## 🗃️ डेटाबेस प्रावधान

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

### Managed Identity कन्फिगरेसन
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

## 🌍 नेटवर्किङ र कनेक्टिविटी

### Virtual Network कन्फिगरेसन
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

### SSL सहित Application Gateway
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

## 📊 मोनिटरिङ र अव्जर्भेबिलिटी

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

### कस्टम मेट्रिक्स र अलर्टहरू
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

## 🔧 वातावरण-विशिष्ट कन्फिगरेसनहरू

### फरक वातावरणका लागि प्यारामिटर फाइलहरू
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

### सशर्त स्रोत प्रावधान
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

## 🚀 उन्नत प्रावधान ढाँचाहरू

### बहु-क्षेत्र परिनियोजन
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

### Infrastructure परीक्षण
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

## 🧪 Infrastructure Preview & Validation (NEW)

### परिनियोजन अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन

`azd provision --preview` फीचरले तपाईंलाई स्रोतहरू वास्तवमा परिनियोजन गर्नु अघि **पूर्वाधार प्रावधानको अनुकरण** गर्न दिन्छ। यो `terraform plan` वा `bicep what-if` जस्तो भावना दिने ड्राइ-रन दृश्य हो जसले तपाईंसँग के परिवर्तनहरू गरिनेछ भनेर देखाउँछ।

#### 🛠️ यसले के गर्छ
- तपाईंका IaC टेम्पलेटहरू (Bicep वा Terraform) **विश्लेषण** गर्छ
- **स्रोत परिवर्तनहरूको पूर्वावलोकन देखाउँछ**: थप, मेट्ने, अपडेटहरू
- **परिवर्तनहरू लागू गर्दैन** — यो पढ्न मात्र हो र चलाउन सुरक्षित छ

#### प्रयोग केसहरू
```bash
# परिनियोजन अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन
azd provision --preview

# विशिष्ट वातावरणको लागि पूर्वावलोकन
azd provision --preview -e production
```

यो कमाण्डले तपाईंलाई मद्दत गर्छ:
- संसाधनहरू कमिट गर्नु अघि **पूर्वाधार परिवर्तनहरू मान्य** गर्न
- विकास चक्रको शुरुमा **कन्फिगरेसन गल्तीहरू पत्ता लगाउन**
- टोली वातावरणहरूमा **सुरक्षित रूपमा सहकार्य** गर्न
- आश्चर्य बिना **न्यूनतम-प्रिविलेज परिनियोजनहरू सुनिश्चित** गर्न

यो विशेष गरी उपयोगी हुन्छ जब:
- जटिल बहु-सेवा वातावरणहरूसँग काम गर्दै हुनुहुन्छ
- उत्पादन पूर्वाधारमा परिवर्तन गर्दै हुनुहुन्छ
- PR अनुमोदन अघि टेम्पलेट संशोधनहरू मान्य गर्दै हुनुहुन्छ
- पूर्वाधार ढाँचाहरूमा नयाँ टोली सदस्यहरूलाई तालिम दिँदै हुनुहुन्छ

### उदाहरण पूर्वावलोकन आउटपुट
ठ्याक्कै पूर्वावलोकन आउटपुट प्रदायक र प्रोजेक्ट संरचनामा निर्भर गर्दछ, तर परिणामले प्रस्ताव गरिएका परिवर्तनहरू स्पष्ट रूपमा चिन्हित गर्नुपर्छ जुन केही पनि लागू गर्नु अघि।

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

## �🔄 स्रोत अपडेटहरू र माइग्रेशनहरू

### सुरक्षित स्रोत अपडेटहरू
```bash
# पहिले पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस् (अनुशंसित)
azd provision --preview

# पूर्वावलोकन पुष्टि भएपछि परिवर्तनहरू लागू गर्नुहोस्
azd provision --confirm-with-no-prompt

# रोलब्याकका लागि Git प्रयोग गरी पूर्वाधार परिवर्तनहरू फर्काउन:
git revert HEAD  # अन्तिम पूर्वाधार कमिट फर्काउनुहोस्
azd provision    # अघिल्लो पूर्वाधार अवस्था लागू गर्नुहोस्
```

### डेटाबेस माइग्रेशनहरू
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

## 🎯 उत्तम अभ्यासहरू

### 1. स्रोत नामकरण सम्मेलनहरू
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. ट्यागिङ रणनीति
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

### 3. प्यारामिटर मान्यकरण
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

## Next Steps

- [पूर्व-परिनियोजन योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत उपलब्धता मान्य गर्नुहोस्
- [सामान्य समस्याहरू](../chapter-07-troubleshooting/common-issues.md) - पूर्वाधार समस्याहरू ट्रबलशुट गर्नुहोस्
- [डिबगिङ मार्गदर्शिका](../chapter-07-troubleshooting/debugging.md) - प्रावधान समस्याहरू डिबग गर्नुहोस्
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सेवा स्तरहरू छनौट गर्नुहोस्

## अतिरिक्त स्रोतहरू

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
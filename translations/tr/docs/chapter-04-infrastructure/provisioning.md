# Provisioning Azure Resources with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **➡️ Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Related**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Giriş

Bu kapsamlı rehber, Azure Developer CLI kullanarak Azure kaynaklarını sağlama ve yönetme hakkında bilmeniz gereken her şeyi kapsar. Bicep, ARM şablonları, Terraform ve Pulumi kullanarak temel kaynak oluşturma işlemlerinden gelişmiş kurumsal düzey altyapı mimarilerine kadar Infrastructure as Code (IaC) desenlerini uygulamayı öğrenin.

## Öğrenme Hedefleri

Bu rehberi tamamladıktan sonra:
- Infrastructure as Code ilkelerini ve Azure kaynak sağlama konusunu ustalıkla öğreneceksiniz
- Azure Developer CLI tarafından desteklenen birden çok IaC sağlayıcısını anlayacaksınız
- Yaygın uygulama mimarileri için Bicep şablonları tasarlayıp uygulayacaksınız
- Kaynak parametrelerini, değişkenleri ve ortama özgü ayarları yapılandıracaksınız
- Ağ ve güvenlik dahil olmak üzere gelişmiş altyapı desenlerini uygulayacaksınız
- Kaynak yaşam döngüsünü, güncellemeleri ve bağımlılık çözümlemesini yöneteceksiniz

## Öğrenme Çıktıları

Tamamladıktan sonra yapabilecekleriniz:
- Bicep ve ARM şablonları kullanarak Azure altyapısı tasarlayıp sağlayabileceksiniz
- Doğru kaynak bağımlılıklarıyla karmaşık çok hizmetli mimarileri yapılandırabileceksiniz
- Birden çok ortam ve yapılandırma için parametreleştirilmiş şablonları uygulayabileceksiniz
- Altyapı sağlama sorunlarını giderip dağıtım hatalarını çözebileceksiniz
- Altyapı tasarımında Azure Well-Architected Framework ilkelerini uygulayabileceksiniz
- Altyapı güncellemelerini yönetip altyapı sürümleme stratejileri uygulayabileceksiniz

## Altyapı Sağlama Genel Bakış

Azure Developer CLI birden çok Infrastructure as Code (IaC) sağlayıcısını destekler:
- **Bicep** (önerilen) - Azure'ın domain-özgü dili
- **ARM Templates** - JSON tabanlı Azure Resource Manager şablonları
- **Terraform** - Çok bulutlu altyapı aracı
- **Pulumi** - Programlama dilleriyle modern altyapı olarak kod

## Azure Kaynaklarını Anlamak

### Kaynak Hiyerarşisi
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Uygulamalar için Yaygın Azure Hizmetleri
- **Hesaplama**: App Service, Container Apps, Functions, Virtual Machines
- **Depolama**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Ağ**: Virtual Network, Application Gateway, CDN
- **Güvenlik**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep Altyapı Şablonları

### Temel Bicep Şablon Yapısı
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

### Gelişmiş Bicep Desenleri

#### Modüler Altyapı
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

#### Koşullu Kaynak Oluşturma
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

## 🌐 azd ile Terraform Kullanımı

Bicep azd'nin varsayılanıdır, ancak azd ayrıca **Terraform**'u da destekler—ekip zaten bunu standardize ettiyse veya çok bulutlu altyapıyı yönetiyorsanız faydalıdır. azd iş akışı (`azd up`, `azd provision`, `azd down`) aynıdır; yalnızca altyapı dili ve klasör düzeni değişir.

### azd'ye Terraform kullanmasını söyleyin

Terraform sağlayıcısına işaret eden `infra` bölümünü `azure.yaml` dosyasına ekleyin:

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

### Terraform klasör düzeni

Terraform sağlayıcısı ile `infra/` klasörünüz Bicep yerine `.tf` dosyalarını kullanır:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimal bir `main.tf`

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

### azd'nin Terraform çıktılarınızla nasıl bağlandığı

azd, uç noktalarınızı öğrenmek ve ortam değerlerini uygulamanıza geri bağlamak için Terraform **outputs**'u okur. Çıktı adları önemlidir—azd belirli adlara bakar:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Önemli:** azd, her ortam için kaynakları izlemek amacıyla `azd-env-name` etiketini ve `AZURE_*` çıktıları kullanır. `azd down` her şeyi bulup kaldırabilsin diye resource group'unuzu her zaman `"azd-env-name" = var.environment_name` ile etiketleyin.

### Terraform ile dağıtım

Komutlar Bicep ile tamamen aynıdır:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd arka planda 'terraform plan' çalıştırır
azd up                    # kaynak sağlama + dağıtım
azd down --force          # Terraform tarafından yönetilen kaynakları yok eder
```

> **Önkoşul:** Terraform'un sisteminizde yüklü olması ve `PATH` üzerinde olması gerekir. azd Terraform *iş akışını* yönetir, ancak Terraform'u sizin için yüklemez. State için azd varsayılan olarak lokal state kullanır; ekipler için `provider.tf` içinde uzak bir backend (örneğin bir Azure Storage backend'i) yapılandırın.

Tam, çalıştırılabilir Terraform tabanlı başlangıç projeleri için [Awesome AZD gallery](https://azure.github.io/awesome-azd/) sayfasını gezip Terraform filtresi uygulayın veya resmi [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) belgesine bakın.

## 🧩 azd ile Pulumi Kullanımı

Ekip altyapıyı DSL yerine genel amaçlı bir dilde (TypeScript, Python, Go veya C#) yazıyorsa, azd ayrıca **Pulumi**'yi de destekler. Terraform'da olduğu gibi `azd up` / `azd provision` / `azd down` iş akışı değişmez—tek fark altyapı aracının ve klasör düzeninin farklı olmasıdır.

### azd'ye Pulumi kullanmasını söyleyin

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

### Pulumi klasör düzeni

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimal bir `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Her kaynağı etiketleyin, böylece azd bunları izleyip temizleyebilir
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd bu çıktıları ortamınıza geri okur
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks, azd ortamlarına karşılık gelir

Pulumi dağıtımları **stacks** olarak organize eder ve azd her azd ortamını aynı ada sahip bir Pulumi stack'ine eşler. `azd env new staging` çalıştırdığınızda, azd `staging` Pulumi stack'ini seçer (veya oluşturur). Aynı `azd-env-name` etiketleme ve `AZURE_*` çıktı kuralları geçerlidir, böylece `azd down` her şeyi bulup kaldırabilir.

### Pulumi ile dağıtım

```bash
azd auth login
azd env new dev
azd provision --preview   # azd arka planda 'pulumi preview' çalıştırır
azd up                    # kaynak sağlama + dağıtım
azd down --force          # 'pulumi destroy' çalıştırır
```

> **Önkoşul:** Pulumi'nin sisteminizde yüklü olması ve `PATH` üzerinde olması gerekir; ayrıca bir state backend'e ihtiyacınız olacaktır (Pulumi Cloud veya Azure Blob Storage gibi kendi yönettiğiniz bir backend). azd Pulumi *iş akışını* yönetir, kurulumu değil. Detaylar için resmi [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd) belgesine bakın.

## 🎯 Servisiniz İçin Bir Host Seçme

`azure.yaml` içindeki `host` alanı kodunuzun nerede çalışacağını belirler. azd birkaç hostu destekler—doğru olanı seçmek altyapı dilinden daha önemlidir. İşte yeni başlayanlar için bir karşılaştırma:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Traditional web apps and APIs | Simplest PaaS; no containers required |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Global CDN + free SSL, built-in API support |
| `function` | Event-driven and serverless workloads | Scale-to-zero, pay-per-execution |
| `containerapp` | Containerized microservices | Serverless containers, scale-to-zero, built-in ingress |
| `aks` | Complex orchestration needs | Full Kubernetes control when you truly need it |
| `springapp` | Java Spring Boot apps | Managed Azure Spring Apps runtime tuned for Spring |

### AKS'ye ne zaman yönelmelisiniz

**Azure Kubernetes Service (`host: aks`)** size Kubernetes'in tüm gücünü verir—özel controller'lar, servis mesh'leri, karmaşık ağ yapılandırmaları ve ince ayarlı zamanlama. Bu güç operasyonel yük getirir: node pool'ları, yükseltmeleri ve cluster ağını siz yönetirsiniz.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Mümkünse daha basit başlayın.** Çoğu mikroservis için, **Container Apps** size bir cluster yönetmeden konteynerler, otomatik ölçeklendirme ve scale-to-zero sağlar. Kubernetes'e özgü özelliklere gerçekten ihtiyaç duyduğunuzda AKS'i seçin.

### Azure Spring Apps ne zaman kullanılmalı

**Azure Spring Apps (`host: springapp`)** Spring Boot için özel olarak tasarlanmış yönetilen bir runtime'dır. Service discovery, config server ve blue-green dağıtım gibi konuları ele alır, böylece Java ekipleri kendi altyapılarını işletmek zorunda kalmaz.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Mevcut Spring Boot uygulamalarınız varsa ve onlar için optimize edilmiş bir runtime istiyorsanız `springapp` kullanın. Spring'e özgü ihtiyaçları olmayan yeni konteynerlenmiş Java uygulamaları için genellikle `containerapp` daha basit bir seçenektir.

## 🗃️ Veritabanı Sağlama

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

## 🔒 Güvenlik ve Sırlar Yönetimi

### Key Vault Entegrasyonu
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

### Managed Identity Yapılandırması
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

## 🌍 Ağ ve Bağlantı

### Virtual Network Yapılandırması
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

### SSL ile Application Gateway
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

## 📊 İzleme ve Gözlemlenebilirlik

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

### Özel Metrikler ve Uyarılar
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

## 🔧 Ortama Özgü Yapılandırmalar

### Farklı Ortamlar için Parametre Dosyaları
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

### Koşullu Kaynak Sağlama
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

## 🚀 Gelişmiş Sağlama Desenleri

### Çok Bölgeli Dağıtım
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

### Altyapı Testi
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

## 🧪 Altyapı Önizlemesi ve Doğrulama (YENİ)

### Dağıtımdan Önce Altyapı Değişikliklerini Önizleyin

`azd provision --preview` özelliği, kaynakları gerçekten dağıtmadan önce altyapı sağlama işlemini **simüle etmenize** olanak tanır. Bu, `terraform plan` veya `bicep what-if` ruhuna benzer; Azure ortamınızda hangi değişikliklerin yapılacağını gösteren bir **dry-run görünümü** sağlar.

#### 🛠️ Ne Yapar
- **IaC şablonlarınızı** (Bicep veya Terraform) analiz eder
- **Kaynak değişikliklerinin bir önizlemesini** gösterir: eklemeler, silmeler, güncellemeler
- **Değişiklikleri uygulamaz** — salt okunur ve çalıştırması güvenlidir

#### Kullanım Durumları
```bash
# Dağıtımdan önce altyapı değişikliklerini önizleyin
azd provision --preview

# Belirli bir ortam için önizleme
azd provision --preview -e production
```

Bu komut size yardımcı olur:
- **Kaynakları taahhüt etmeden önce** altyapı değişikliklerini doğrulamaya
- **Geliştirme döngüsünde hatalı yapılandırmaları erken yakalamaya**
- **Ekip ortamlarında güvenli işbirliği yapmaya**
- **Sürprizler olmadan en düşük ayrıcalıklı dağıtımları sağlamaya**

Özellikle kullanışlıdır:
- Karmaşık çok hizmetli ortamlarla çalışırken
- Üretim altyapısında değişiklik yaparken
- Şablon değişikliklerini PR onayından önce doğrularken
- Yeni ekip üyelerini altyapı desenleri konusunda eğitirken

### Örnek Önizleme Çıktısı
Tam önizleme çıktısı sağlayıcıya ve proje yapısına göre değişir, ancak sonuç uygulanmadan önce önerilen değişiklikleri açıkça tanımlamalıdır.

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

## �🔄 Kaynak Güncellemeleri ve Geçişler

### Güvenli Kaynak Güncellemeleri
```bash
# Altyapı değişikliklerini önce önizleyin (TAVSİYE EDİLİR)
azd provision --preview

# Önizleme onayı alındıktan sonra değişiklikleri uygulayın
azd provision --confirm-with-no-prompt

# Geri alma için altyapı değişikliklerini geri almak üzere Git'i kullanın:
git revert HEAD  # Son altyapı commit'ini geri alın
azd provision    # Önceki altyapı durumunu uygulayın
```

### Veritabanı Geçişleri
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

## 🎯 En İyi Uygulamalar

### 1. Kaynak İsimlendirme Kuralları
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Etiketleme Stratejisi
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

### 3. Parametre Doğrulama
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

### 4. Çıktı Organizasyonu
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

## Sonraki Adımlar

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Kaynak kullanılabilirliğini doğrulayın
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Altyapı problemlerini giderin
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Sağlama sorunlarını debug edin
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Uygun hizmet katmanlarını seçin

## Ek Kaynaklar

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
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
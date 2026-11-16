# Penyediaan Sumber Azure dengan AZD

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penyebaran
- **⬅️ Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **➡️ Bab Seterusnya**: [Bab 5: Penyelesaian AI Multi-Ejen](../../examples/retail-scenario.md)
- **🔧 Berkaitan**: [Bab 6: Validasi Pra-Penyebaran](../chapter-06-pre-deployment/capacity-planning.md)

## Pengenalan

Panduan ini merangkumi penyediaan dan pengurusan sumber Azure menggunakan Azure Developer CLI dengan penyedia Bicep dan Terraform terbina dalamnya.

> Disemak dengan `azd 1.37.2` (November 2026). Kecuali dinyatakan sebaliknya, contoh Bicep, Terraform, dan skrip adalah **potongan ilustratif**, bukan templat lengkap. Gabungkan mereka ke dalam projek yang menyediakan parameter, modul, identiti, rangkaian, dan kod aplikasi yang dirujuk. Penyediaan Azure tidak dilaksanakan dalam semakan ini.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai prinsip Infrastruktur sebagai Kod dan penyediaan sumber Azure
- Memahami pelbagai penyedia IaC yang disokong oleh Azure Developer CLI
- Mereka dan laksanakan templat Bicep untuk seni bina aplikasi biasa
- Konfigurasikan parameter sumber, pembolehubah, dan tetapan khusus persekitaran
- Laksanakan corak infrastruktur maju termasuk rangkaian dan keselamatan
- Urus kitaran hayat sumber, kemas kini, dan penyelesaian pergantungan

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Mereka dan sediakan infrastruktur Azure menggunakan templat Bicep dan ARM
- Konfigurasikan seni bina pelbagai perkhidmatan kompleks dengan pergantungan sumber yang betul
- Laksanakan templat berparameter untuk pelbagai persekitaran dan konfigurasi
- Selesaikan isu penyediaan infrastruktur dan atasi kegagalan penyebaran
- Terapkan prinsip Rangka Kerja Azure Well-Architected pada reka bentuk infrastruktur
- Urus kemas kini infrastruktur dan laksanakan strategi versi infrastruktur

## Gambaran Keseluruhan Penyediaan Infrastruktur

Azure Developer CLI menyokong pelbagai penyedia Infrastruktur sebagai Kod (IaC):
- **Bicep** (disyorkan) - bahasa khusus domain Azure
- **Templat ARM** - Bicep menyusun ke ARM; JSON ARM mentah bukan `infra.provider` terbina dalam yang berasingan
- **Terraform** - alat infrastruktur multi-awan
- **Penyedia sambungan** - Memerlukan sambungan penyedia yang dipasang secara berasingan dan konfigurasi yang didokumentasikan; jangan anggap sebarang rentetan penyedia disokong

## Memahami Sumber Azure

### Hierarki Sumber
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Perkhidmatan Azure Biasa untuk Aplikasi
- **Pengkomputeran**: App Service, Container Apps, Functions, Mesin Maya
- **Penyimpanan**: Akaun Penyimpanan, Cosmos DB, Pangkalan Data SQL, PostgreSQL
- **Rangkaian**: Rangkaian Maya, Pintu Gerbang Aplikasi, CDN
- **Keselamatan**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Perkhidmatan AI Azure, Azure OpenAI, Pembelajaran Mesin Azure

## Templat Infrastruktur Bicep

### Struktur Templat Bicep Asas
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

Untuk projek azd lengkap, panggil modul ini dari `infra/main.bicep` berlangganan yang membuat kumpulan sumber bertanda dan menghantar skopnya. Padankan `environmentName`/`location` dalam `main.parameters.json`. Tag `azd-service-name: web` mengaitkan sumber dengan `services.web`; nama keluaran sewenang-wenangnya sahaja tidak mengkonfigurasi penemuan perkhidmatan.

### Corak Bicep Lanjutan

#### Infrastruktur Modular
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

#### Penciptaan Sumber Bersyarat
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

## 🌐 Menggunakan Terraform dengan azd

Bicep adalah lalai azd, tetapi azd juga menyokong **Terraform**—berguna jika pasukan anda sudah menstandarkan penggunaannya atau anda mengurus infrastruktur multi-awan. Alur kerja azd (`azd up`, `azd provision`, `azd down`) adalah sama; hanya bahasa infrastruktur dan susun atur folder yang berubah.

### Beritahu azd untuk menggunakan Terraform

Tambah seksyen `infra` ke `azure.yaml` yang merujuk kepada penyedia Terraform:

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

### Susun atur folder Terraform

Dengan penyedia Terraform, folder `infra/` anda menggunakan fail `.tf` dan bukan Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Potongan `main.tf`

Ini hanya mencipta kumpulan sumber dan pelan, bukan perkhidmatan boleh disebarkan. Anda juga mesti mengisytiharkan pembolehubah input, penyedia `azurerm` yang serasi, aplikasi web, dan pemetaan tag/service-name perkhidmatan.

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

### Bagaimana azd menghubungkan output Terraform anda

azd membaca **output** Terraform ke dalam nilai persekitaran. Potongan ini menganggap anda telah mentakrifkan `azurerm_linux_web_app.web`; penemuan perkhidmatan masih memerlukan nama sumber yang sesuai atau tag `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Penting:** azd menggunakan tag `azd-env-name` dan output `AZURE_*` untuk menjejak sumber mengikut persekitaran. Sentiasa tag kumpulan sumber anda dengan `"azd-env-name" = var.environment_name` supaya `azd down` dapat mencari dan membuang semuanya.

### Penyebaran dengan Terraform

Perintah adalah sama seperti Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Prasyarat:** Terraform mesti dipasang dan dalam `PATH` anda. azd mengurus *alur kerja* Terraform tetapi tidak memasang Terraform untuk anda. Untuk status, azd lalai kepada status tempatan; untuk pasukan, konfigurasikan backend jauh (contohnya backend Azure Storage) dalam `provider.tf`.

Untuk pemula berasaskan Terraform lengkap yang boleh dijalankan, layari [galeri Awesome AZD](https://azure.github.io/awesome-azd/) dan tapis untuk Terraform, atau lihat dokumentasi rasmi [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Alat Infrastruktur Lain

Pulumi bukan penyedia penyediaan terbina dalam azd 1.37.2. Menetapkan `infra.provider: pulumi` sahaja tidak mewujudkan integrasi berfungsi, dan `azd env new` tidak secara automatik mencipta/memilih tumpukan Pulumi. Jika anda menggunakan alat IaC lain, ikuti dokumentasi sambungan penyedia yang disahkan atau urus kitaran hayatnya secara eksplisit dalam alur kerja anda sendiri. Kursus ini tidak membekalkan atau mengesahkan penyedia Pulumi.

## 🎯 Memilih Hos untuk Perkhidmatan Anda

Medan `host` dalam `azure.yaml` menentukan di mana kod anda berjalan. azd menyokong beberapa hos—memilih yang betul lebih penting daripada bahasa infrastruktur. Berikut perbandingan mesra pemula:

| Nilai `host` | Sesuai untuk | Kenapa |
|--------------|----------|-----|
| `appservice` | Aplikasi web tradisional dan API | PaaS paling mudah; tidak perlu bekas kontena |
| `staticwebapp` | SPA hadapan (React, Vue, Angular) | CDN global + SSL percuma, sokongan API terbina dalam |
| `function` | Beban kerja berasaskan acara dan serverless | Skala ke sifar, bayar mengikut pelaksanaan |
| `containerapp` | Mikroservis berbekas kontena | Kontena serverless, skala ke sifar, ingress terbina dalam |
| `aks` | Keperluan orkestrasi kompleks | Kawalan Kubernetes penuh bila benar-benar diperlukan |
| `springapp` | Penyebaran Azure Spring Apps sedia ada | Sasaran legacy; perkhidmatan ditamatkan 31 Mac 2028 dan ditutup kepada pelanggan baru |

### Bila untuk guna AKS

**Azure Kubernetes Service (`host: aks`)** memberi anda kuasa penuh Kubernetes—pengawal khusus, mesh perkhidmatan, rangkaian kompleks, dan penjadualan terperinci. Kuasa ini datang dengan beban operasi: anda mengurus kolam nod, peningkatan, dan rangkaian kluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Mulakan dengan lebih mudah jika boleh.** Untuk kebanyakan mikroservis, **Container Apps** memberi anda kontena, penskalaan automatik, dan skala ke sifar tanpa mengurus kluster. Pilih AKS hanya apabila anda memerlukan ciri khusus Kubernetes.

### Bila guna Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** adalah runtime terurus yang dibina khusus untuk Spring Boot. Ia mengurus penemuan perkhidmatan, pelayan konfigurasi, dan penyebaran biru-hijau supaya pasukan Java tidak mengendalikan infrastruktur sendiri.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Jangan pilih Azure Spring Apps untuk projek pemula baru: ia ditutup kepada pelanggan baru dan [ditamatkan 31 Mac 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Pilih alternatif yang disokong seperti Container Apps dan rancang migrasi untuk penyebaran sedia ada.

## 🗃️ Penyediaan Pangkalan Data

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
**Prasyarat potongan:** isytiharkan `@secure() param databasePassword string` dan gunakan nilai yang kuat disediakan. Pilih akses awam **atau** integrasikan subnet terwakil/DNS peribadi di bawah; kedua-dua potongan ini tidak secara automatik menyambung sendiri.

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

Peraturan `0.0.0.0` membenarkan sambungan dari perkhidmatan Azure selain langganan anda sendiri. Ia bukan rangkaian peribadi; lebih baik gunakan reka bentuk rangkaian terhad untuk beban kerja sebenar.

## 🔒 Keselamatan dan Pengurusan Rahsia

### Integrasi Key Vault
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

### Konfigurasi Identiti Terurus
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

Untuk identiti yang ditetapkan sistem, jangan tetapkan `AZURE_CLIENT_ID` kepada ID prinsipalnya. Identiti yang ditetapkan pengguna menggunakan **ID klien**, bukan ID objek/prinsipal. Rujukan Key Vault juga memerlukan penugasan peranan petak identiti aplikasi dan akses rangkaian.

## 🌍 Rangkaian dan Kesalinghubungan

### Konfigurasi Rangkaian Maya
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

### Pintu Gerbang Aplikasi dengan SSL
**Potongan seni bina tidak lengkap, bukan pintu gerbang boleh disebar:** tambah `gateway-subnet` khusus ke VNet ditambah kolam backend, tetapan HTTP, pendengar, peraturan penentuan hala dengan keutamaan, dan sijil TLS (atau rujukan Key Vault yang sah). Membuka port 443 sahaja tidak mengkonfigurasi HTTPS.

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

## 📊 Pemantauan dan Observabiliti

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

### Metrik dan Amaran Tersuai
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

## 🔧 Konfigurasi Khusus Persekitaran

### Fail Parameter untuk Persekitaran Berbeza
Dua fail di bawah adalah **contoh fail parameter alternatif**. azd tidak secara automatik memilih `main.parameters.dev.json` atau `main.parameters.prod.json` mengikut nama persekitaran. Gunakan `main.parameters.json` sebenar dengan penggantian persekitaran (contohnya `${APP_SERVICE_SKU=B1}`), dan isytihar/guna setiap parameter dalam Bicep.

Contoh kandungan untuk `infra/main.parameters.dev.json`:

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

Contoh kandungan untuk `infra/main.parameters.prod.json`:

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

### Penyediaan Sumber Bersyarat
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

## 🚀 Corak Penyediaan Lanjutan

### Penyebaran Multi-Wilayah
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

### Ujian Infrastruktur
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Penyediaan infrastruktur tidak menyebarkan kod aplikasi anda. Jalankan pemeriksaan aplikasi hanya selepas `azd deploy`/`azd up`, dan gunakan `/health` hanya jika aplikasi anda melaksanakannya. Skrip penyebaran ARM mencipta sumber Azure dan memerlukan identiti tambahan, versi runtime disokong, dan kebenaran; ia bukan ujian unit tempatan.

## 🧪 Pratonton & Validasi Infrastruktur (BARU)

### Pratonton Perubahan Infrastruktur Sebelum Penyebaran

Ciri `azd provision --preview` membolehkan anda **mensimulasikan penyediaan infrastruktur** sebelum benar-benar menyebarkan sumber. Ia serupa dengan semangat `terraform plan` atau `bicep what-if`, memberikan anda **pandangan dry-run** mengenai perubahan yang akan dibuat pada persekitaran Azure anda.

#### 🛠️ Apa Yang Dilakukan
- **Menganalisis templat IaC anda** (Bicep atau Terraform)
- **Memaparkan pratonton perubahan sumber**: penambahan, penghapusan, kemas kini
- **Tidak melaksanakan perubahan infrastruktur yang dicadangkan penyedia** — periksa cangkuk projek dahulu; skrip boleh ada kesan sampingan dan pratonton masih memerlukan kebenaran Azure

#### Kes Penggunaan
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Perintah ini membantu anda:
- **Validasi perubahan infrastruktur** sebelum mengesahkan sumber
- **Tangkap konfigurasi salah awal** dalam kitaran pembangunan
- **Bekerjasama dengan selamat** dalam persekitaran pasukan
- **Pastikan penyebaran kuasa minimum** tanpa kejutan

Ia amat berguna apabila:
- Bekerja dengan persekitaran pelbagai perkhidmatan kompleks
- Membuat perubahan pada infrastruktur pengeluaran
- Mengesahkan pengubahsuaian templat sebelum kelulusan PR
- Melatih ahli pasukan baru mengenai corak infrastruktur

### Contoh Output Pratonton
Output pratonton tepat berbeza mengikut penyedia dan struktur projek, tetapi hasilnya harus jelas mengenal pasti perubahan yang dicadangkan sebelum apa-apa dilaksanakan.

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

## �🔄 Kemas Kini dan Migrasi Sumber

### Kemas Kini Sumber Selamat
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

### Migrasi Pangkalan Data
**Corak skrip penyebaran tidak lengkap:** memerlukan identiti ditetapkan pengguna yang dikonfigurasi apabila diperlukan, runtime Azure CLI disokong, alat migrasi tersedia, direktori/konfigurasi migrasi disediakan, dan kesalinghubungan pangkalan data. Ia tidak boleh dilaksanakan hanya dengan menampal sumber ini ke dalam templat.

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

## 🎯 Amalan Terbaik

### 1. Konvensyen Penamaan Sumber
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Strategi Penandaan
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

### 3. Validasi Parameter
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

### 4. Pengorganisasian Output
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

## Langkah Seterusnya

- [Perancangan Pra-Penyebaran](../chapter-06-pre-deployment/capacity-planning.md) - Validasi ketersediaan sumber
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md) - Selesaikan masalah infrastruktur
- [Panduan Penyahpepijatan](../chapter-07-troubleshooting/debugging.md) - Selesaikan isu penyediaan
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Pilih tahap perkhidmatan yang sesuai

## Sumber Tambahan

- [Dokumentasi Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Templat Pengurus Sumber Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Penyebaran](deployment-guide.md)
- **Pelajaran Seterusnya**: [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
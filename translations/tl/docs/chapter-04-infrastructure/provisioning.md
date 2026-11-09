# Pagbibigay ng Azure Resources gamit ang AZD

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Infrastructure as Code at Deployment
- **⬅️ Nakaraang**: [Deployment Guide](deployment-guide.md)
- **➡️ Susunod na Kabanata**: [Kabanata 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Kaugnay**: [Kabanata 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Panimula

Inilalahad ng gabay na ito ang pag-provision at pamamahala ng mga Azure resources gamit ang Azure Developer CLI kasama ang mga built-in nitong Bicep at Terraform providers.

> Sinuri laban sa `azd 1.37.2` (Nobyembre 2026). Maliban kung nakasaad, ang mga halimbawa ng Bicep, Terraform, at script ay **mga ilustratibong bahagi lamang**, hindi isang kumpletong template. Isama ang mga ito sa isang proyekto na nagbibigay ng mga tinukoy na parameter, modules, identity, networking, at application code. Hindi naisagawa ang Azure provisioning sa pagsusuring ito.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, magagawa mo ang mga sumusunod:
- Makuha ang mga prinsipyo ng Infrastructure as Code at provisioning ng Azure resources
- Maunawaan ang iba't ibang IaC providers na sinusuportahan ng Azure Developer CLI
- Magdisenyo at magpatupad ng mga Bicep template para sa mga karaniwang arkitektura ng aplikasyon
- I-configure ang mga parameter ng resource, variable, at mga setting para sa iba't ibang kapaligiran
- Magpatupad ng mga advanced na pattern ng infraestrutura kabilang ang networking at seguridad
- Pamahalaan ang lifecycle ng resource, mga update, at pagresolba ng dependency

## Mga Kinalabasan sa Pagkatuto

Sa pagtatapos, magagawa mong:
- Magdisenyo at mag-provision ng Azure infrastructure gamit ang Bicep at ARM templates
- Mag-configure ng komplikadong multi-service architectures na may tamang mga dependency ng resource
- Magpatupad ng mga parameterized na template para sa maramihang environment at configuration
- Mag-troubleshoot ng mga isyu sa provisioning ng infrastructure at maresolba ang mga pagkabigo sa deployment
- I-apply ang mga prinsipyo ng Azure Well-Architected Framework sa disenyo ng infrastruktura
- Pamahalaan ang mga update ng infrastruktura at magpatupad ng mga estratehiya sa versioning ng infrastruktura

## Pangkalahatang-ideya ng Infrastructure Provisioning

Sinusuportahan ng Azure Developer CLI ang maramihang Infrastructure as Code (IaC) providers:
- **Bicep** (inirerekomenda) - domain-specific language ng Azure
- **ARM Templates** - Bicep ay nagko-compile sa ARM; ang raw ARM JSON ay hindi isang hiwalay na built-in `infra.provider`
- **Terraform** - Multi-cloud infrastructure tool
- **Extension providers** - Nangangailangan ng hiwalay na naka-install na provider extension at ang dokumentadong configuration nito; huwag asahan na anumang provider string ay suportado

## Pag-unawa sa Azure Resources

### Hierarkiya ng Resource
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Mga Karaniwang Azure Services para sa Mga Aplikasyon
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Seguridad**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Mga Bicep Infrastructure Templates

### Pangunahing Estruktura ng Template ng Bicep
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

Para sa isang kumpletong azd proyekto, tawagin ang module na ito mula sa isang subscription-scoped `infra/main.bicep` na lumilikha ng isang tagged resource group at ipinapasa ang saklaw nito. Itugma ang `environmentName`/`location` sa `main.parameters.json`. Ang `azd-service-name: web` tag ay nag-uugnay ng resource sa `services.web`; ang mga arbitrary output na pangalan lamang ay hindi nagko-configure ng service discovery.

### Mga Advanced na Pattern sa Bicep

#### Modular Infrastructure
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

#### Kondisyonal na Paglikha ng Resource
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

## 🌐 Paggamit ng Terraform kasama ang azd

Default ang Bicep sa azd, pero sinusuportahan din ng azd ang **Terraform**—kapaki-pakinabang kung standard na ito sa iyong koponan o kung pinamamahalaan mo ang multi-cloud infrastructure. Pareho lang ang daloy ng azd (`azd up`, `azd provision`, `azd down`); nag-iiba lamang ang wikang pang-infrastruktura at ang pagkakaayos ng folder.

### Sabihin sa azd na gamitin ang Terraform

Magdagdag ng seksyong `infra` sa `azure.yaml` na nakaturo sa Terraform provider:

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

### Layout ng Terraform folder

Sa Terraform provider, ang iyong `infra/` folder ay gumagamit ng mga `.tf` file sa halip na Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Isang `main.tf` na bahagi

Ito ay lumilikha lamang ng isang resource group at plan, hindi isang deployable na serbisyo. Kailangan mo ring ideklara ang mga input variable, isang compatible na `azurerm` provider, ang web app, at ang mapag-tag/resource-name na pagmamapa nito ng serbisyo.

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

### Paano kumokonekta ang azd sa iyong Terraform outputs

Binabasa ng azd ang Terraform **outputs** bilang mga halaga ng kapaligiran. Ibinibigay ng bahagi na ito na na-define mo na ang `azurerm_linux_web_app.web`; kailangan pa rin ng service discovery ng pagkakaroon ng tumutugmang resource name o `azd-service-name` tag:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Mahalaga:** Ginagamit ng azd ang `azd-env-name` tag at `AZURE_*` outputs upang subaybayan ang mga resource bawat kapaligiran. Laging i-tag ang iyong resource group gamit ang `"azd-env-name" = var.environment_name` upang mahanap at matanggal ng `azd down` ang lahat ng bagay.

### Mag-deploy gamit ang Terraform

Pareho lang ang mga utos ng Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Kinakailangan:** Dapat naka-install ang Terraform at nasa iyong `PATH`. Pinangangasiwaan ng azd ang Terraform *workflow* pero hindi nito ini-install ang Terraform para sa iyo. Para sa state, default ng azd ay lokal na estado; para sa mga koponan, i-configure ang remote backend (halimbawa, Azure Storage backend) sa `provider.tf`.

Para sa kumpleto at pwedeng patakbuhin na Terraform-based na mga starter, tingnan ang [Awesome AZD gallery](https://azure.github.io/awesome-azd/) at i-filter para sa Terraform, o ang opisyal na [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Ibang Mga Kasangkapan sa Infrastrukturang

Hindi built-in na azd 1.37.2 provisioning provider ang Pulumi. Ang pagtatakda ng `infra.provider: pulumi` lamang ay hindi nagbibigay ng gumaganang integrasyon, at ang `azd env new` ay hindi awtomatikong lumilikha/pumipili ng Pulumi stack. Kung gumagamit ka ng ibang IaC tool, sundan ang dokumentasyon ng isang napatunayang provider extension o pamahalaan ang lifecycle nito nang tahasan sa iyong sariling workflow. Hindi nag-susupply o nagtutukoy ng Pulumi provider ang kurso na ito.

## 🎯 Pagpili ng Host para sa Iyong Serbisyo

Ang `host` field sa `azure.yaml` ang nagtatakda kung saan tatakbo ang iyong code. Sinusuportahan ng azd ang ilang mga host—mas mahalaga ang pagpili ng tamang isa kaysa sa wikang infrastruktura. Narito ang isang friendly na paghahambing para sa mga nagsisimula:

| Halaga ng `host` | Pinakamainam para sa | Bakit |
|--------------|----------|-----|
| `appservice` | Tradisyunal na mga web app at API | Pinakasimpleng PaaS; hindi kailangan ng mga container |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Global CDN + libreng SSL, built-in na suporta sa API |
| `function` | Mga event-driven at serverless workloads | Scale-to-zero, bayad batay sa paggamit |
| `containerapp` | Mga containerized microservices | Serverless containers, scale-to-zero, built-in na ingress |
| `aks` | Mga kumplikadong pangangailangan sa orchestration | Buong kontrol sa Kubernetes kapag talagang kailangan mo ito |
| `springapp` | Mga umiiral na deployment ng Azure Spring Apps | Legacy target; nagsasara ang serbisyo sa mga bagong customer simula Marso 31, 2028 |

### Kailan Gagamitin ang AKS

**Azure Kubernetes Service (`host: aks`)** ay nagbibigay sa iyo ng buong kapangyarihan ng Kubernetes—custom controllers, service meshes, kumplikadong networking, at detalyadong scheduling. Kasama sa kapangyarihang ito ang operational overhead: pinamamahalaan mo ang node pools, upgrades, at network ng cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Magsimula nang mas simple kung maaari.** Para sa karamihan ng microservices, nagbibigay ang **Container Apps** ng mga container, autoscaling, at scale-to-zero nang hindi nangangailangan ng pamamahala ng cluster. Piliin ang AKS lamang kapag kailangan mo ng mga partikular na feature ng Kubernetes.

### Kailan Gagamitin ang Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** ay isang managed runtime na pinal na para sa Spring Boot. Pinamamahalaan nito ang service discovery, config server, at blue-green deployment kaya hindi na kailangang pamahalaan ng mga Java team ang kanilang sariling infrastruktura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Huwag pumili ng Azure Spring Apps para sa bagong proyektong pang-nagsisimula: sarado na ito sa mga bagong customer at [magretiro sa Marso 31, 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Mas mainam piliin ang mga suportadong alternatibo tulad ng Container Apps at magplano ng migrasyon para sa mga umiiral na deployment.

## 🗃️ Pagbibigay ng Database

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
**Mga kinakailangan sa bahagi:** ideklara ang `@secure() param databasePassword string` at gumamit ng matatag na ibinigay na halaga. Pumili ng public access **o** i-integrate ang delegated subnet/private DNS sa ibaba; ang dalawang bahagi ay hindi awtomatikong nakakonekta.

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

Ang patakaran sa `0.0.0.0` ay nagpapahintulot ng koneksyon mula sa mga serbisyo ng Azure lampas sa iyong sariling subscription. Hindi ito pribadong networking; mas mainam ang isang limitadong disenyo ng network para sa mga tunay na workload.

## 🔒 Seguridad at Pamamahala ng Lihim

### Integrasyon ng Key Vault
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

### Configuration ng Managed Identity
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

Para sa system-assigned identity, huwag itakda ang `AZURE_CLIENT_ID` sa principal ID nito. Ang user-assigned identity ay gumagamit ng **client ID**, hindi object/principal ID. Ang Key Vault reference ay nangangailangan din ng vault role assignment ng app identity at access sa network.

## 🌍 Networking at Connectivity

### Configuration ng Virtual Network
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

### Application Gateway na may SSL
**Hindi kumpletong arkitektura ng bahagi, hindi deployable na gateway:** magdagdag ng nakalaang `gateway-subnet` sa VNet kasama ang backend pools, HTTP settings, listeners, routing rules na may prioridad, at isang TLS certificate (o awtorisadong Key Vault reference). Ang pag-open lamang ng port 443 ay hindi nagko-configure ng HTTPS.

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

## 📊 Pagsubaybay at Observability

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

### Custom Metrics at Alerts
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

## 🔧 Mga Configuration na Espesipiko sa Kapaligiran

### Mga Parameter File para sa Iba't Ibang Kapaligiran
Ang dalawang file sa ibaba ay **alternatibong mga halimbawa ng parameter-file**. Hindi awtomatikong pinipili ng azd ang `main.parameters.dev.json` o `main.parameters.prod.json` base sa pangalan ng kapaligiran. Gamitin ang aktwal na `main.parameters.json` na may mga kapalit sa kapaligiran (halimbawa `${APP_SERVICE_SKU=B1}`), at ideklara/gamitin ang bawat parameter sa Bicep.

Halimbawa ng nilalaman para sa `infra/main.parameters.dev.json`:

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

Halimbawa ng nilalaman para sa `infra/main.parameters.prod.json`:

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

### Kondisyonal na Pag-provision ng Resource
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

## 🚀 Mga Advanced na Pattern sa Provisioning

### Multi-Region Deployment
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

### Pagsusuri ng Infrastrukturang
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Ang pagbibigay ng infrastruktura ay hindi nagde-deploy ng iyong application code. Patakbuhin lamang ang mga tsek ng aplikasyon pagkatapos ng `azd deploy`/`azd up`, at gamitin ang `/health` kapag ipinapatupad ito ng iyong app. Lumilikha ang mga ARM deployment script ng mga Azure resource at nangangailangan ng karagdagang identity, suportadong bersyon ng runtime, at mga permiso; hindi ito mga lokal na unit test.

## 🧪 Preview at Pagpapatunay ng Infrastrukturang (BAGO)

### I-preview ang Mga Pagbabago sa Infrastrukturang Bago Mag-deploy

Pinapayagan ka ng `azd provision --preview` na tampok na **simulahin ang provisioning ng infrastruktura** bago aktwal na i-deploy ang mga resources. Katulad ito ng `terraform plan` o `bicep what-if`, nagbibigay ito ng **dry-run na tanaw** ng mga pagbabagong gagawin sa iyong Azure kapaligiran.

#### 🛠️ Ano ang Ginagawa Nito
- **Sinusuri ang iyong mga IaC template** (Bicep o Terraform)
- **Ipinapakita ang preview ng mga pagbabago ng resource**: mga dagdag, tanggal, at update
- **Hindi ipinapataw ang mga iminungkahing pagbabago ng provider sa infrastruktura** — suriin muna ang mga project hook; ang mga script ay maaaring may side effects at kailangan pa rin ng Azure permiso ang preview

#### Mga Gamit na Kaso
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Tinutulungan ka ng utos na ito na:
- **Patunayan ang mga pagbabago sa infrastruktura** bago i-commit ang mga resource
- **Agad na matukoy ang mga maling configuration** sa siklo ng pag-unlad
- **Mag-collaborate nang ligtas** sa mga kapaligiran ng koponan
- **Masiguro ang least-privilege deployments** nang walang mga sorpresa

Partikular itong kapaki-pakinabang kapag:
- Nagtatrabaho sa mga kumplikadong multi-service environment
- Gumagawa ng mga pagbabago sa production infrastructure
- Pinatutunayan ang mga pagbabagong template bago ang pag-apruba ng PR
- Nagsasanay ng mga bagong miyembro ng koponan sa mga pattern ng infrastruktura

### Halimbawa ng Preview Output
Nag-iiba ang eksaktong preview output ayon sa provider at proyekto, ngunit dapat malinaw na tukuyin nito ang mga iminungkahing pagbabago bago magpatupad.

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

## �🔄 Mga Update at Migrasyon ng Resource

### Ligtas na Mga Update ng Resource
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

### Mga Migrasyon ng Database
**Hindi kumpletong deployment-script pattern:** nangangailangan ng naka-configure na user-assigned identity kung saan kinakailangan, suportadong Azure CLI runtime, magagamit na mga tool sa migrasyon, isang ibinigay na migration directory/configuration, at koneksyon sa database. Hindi ito patatakbuhin nang diretso sa pag-paste lang ng resource na ito sa isang template.

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

## 🎯 Pinakamahuhusay na Praktis

### 1. Mga Konbensiyon sa Pangalan ng Resource
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Estratehiya sa Pag-tag
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

### 3. Pagpapatunay ng Parameter
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

### 4. Organisasyon ng Output
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

## Mga Susunod na Hakbang

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Patunayan ang availability ng resource
- [Mga Karaniwang Isyu](../chapter-07-troubleshooting/common-issues.md) - Mag-troubleshoot ng mga problema sa infrastruktura
- [Gabay sa Pag-debug](../chapter-07-troubleshooting/debugging.md) - I-debug ang mga isyu sa provisioning
- [Pagpili ng SKU](../chapter-06-pre-deployment/sku-selection.md) - Pumili ng angkop na tier ng serbisyo

## Karagdagang Mga Mapagkukunan

- [Dokumentasyon ng Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Pag-navigate**
- **Nakaraang Aralin**: [Gabay sa Deployment](deployment-guide.md)
- **Susunod na Aralin**: [Pagpaplano ng Kapasidad](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
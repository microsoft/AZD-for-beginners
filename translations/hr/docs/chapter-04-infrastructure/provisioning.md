# Provisioning Azure resursa pomoću AZD

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 4 - Infrastruktura kao kod & implementacija
- **⬅️ Prethodno**: [Vodič za implementaciju](deployment-guide.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 5: AI rješenja s više agenata](../../examples/retail-scenario.md)
- **🔧 Povezano**: [Poglavlje 6: Provjera prije implementacije](../chapter-06-pre-deployment/capacity-planning.md)

## Uvod

Ovaj sveobuhvatni vodič obuhvaća sve što trebate znati o provisoniranju i upravljanju Azure resursima pomoću Azure Developer CLI. Naučite kako implementirati obrasce Infrastrukture kao koda (IaC) od osnovnog stvaranja resursa do naprednih infrastrukturnih arhitektura razine poduzeća koristeći Bicep, ARM predloške, Terraform i Pulumi.

## Ciljevi učenja

Nakon završetka ovog vodiča moći ćete:
- Ovladati principima Infrastrukture kao koda i provisoniranjem Azure resursa
- Razumjeti više IaC pružatelja podržanih od strane Azure Developer CLI
- Dizajnirati i implementirati Bicep predloške za uobičajene arhitekture aplikacija
- Konfigurirati parametre resursa, varijable i postavke specifične za okoliš
- Implementirati napredne infrastrukturne obrasce uključujući umrežavanje i sigurnost
- Upravljati životnim ciklusom resursa, ažuriranjima i rješavanjem ovisnosti

## Ishodi učenja

Po završetku ćete moći:
- Dizajnirati i provisioningiti Azure infrastrukturu koristeći Bicep i ARM predloške
- Konfigurirati složene arhitekture s više usluga s ispravnim ovisnostima resursa
- Implementirati parametarske predloške za različite okoliše i konfiguracije
- Otklanjati probleme u provisoniranju infrastrukture i rješavati neuspjehe implementacije
- Primijeniti principe Azure Well-Architected Framework na dizajn infrastrukture
- Upravljati izmjenama infrastrukture i primijeniti strategije verzioniranja infrastrukture

## Pregled provisioning infrastrukture

Azure Developer CLI podržava više pružatelja Infrastructure as Code (IaC):
- **Bicep** (preporučeno) - Azureov domenom specifični jezik
- **ARM predlošci** - JSON predlošci za Azure Resource Manager
- **Terraform** - alat za multi-cloud infrastrukturu
- **Pulumi** - moderna infrastruktura kao kod s programskim jezicima

## Razumijevanje Azure resursa

### Hijerarhija resursa
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Uobičajene Azure usluge za aplikacije
- **Računanje**: App Service, Container Apps, Functions, Virtual Machines
- **Skladište**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Umrežavanje**: Virtual Network, Application Gateway, CDN
- **Sigurnost**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI usluge, Azure OpenAI, Azure Machine Learning

## Bicep infrastrukturni predlošci

### Osnovna struktura Bicep predloška
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

### Napredni Bicep obrasci

#### Modularna infrastruktura
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

#### Uvjetno stvaranje resursa
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

## 🌐 Korištenje Terraforma s azd

Bicep je zadani azd jezik, ali azd također podržava **Terraform**—korisno ako vaš tim već standardizira na njemu ili ako upravljate multi-cloud infrastrukturom. Azd radni tok (`azd up`, `azd provision`, `azd down`) je identičan; mijenja se samo jezik infrastrukture i struktura foldera.

### Naredite azd-u da koristi Terraform

Dodajte `infra` odjeljak u `azure.yaml` koji pokazuje na Terraform pružatelja:

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

### Terraform struktura foldera

S Terraform pružateljem, vaš `infra/` folder koristi `.tf` datoteke umjesto Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimalni `main.tf`

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

### Kako azd dohvaća Terraform izlaze

azd čita Terraform **outputs** da bi saznao vaše krajnje točke i povezao vrijednosti okoliša natrag u vašu aplikaciju. Važni su nazivi izlaza—azd traži određene:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Važno:** azd koristi oznaku `azd-env-name` i izlaze `AZURE_*` za praćenje resursa po okolišu. Uvijek označite vašu grupu resursa s `"azd-env-name" = var.environment_name` da `azd down` može pronaći i ukloniti sve.

### Implementacija s Terraform-om

Naredbe su potpuno iste kao s Bicepom:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd izvodi 'terraform plan' u pozadini
azd up                    # osiguranje + implementacija
azd down --force          # uništava resurse kojima upravlja Terraform
```

> **Preduvjet:** Terraform mora biti instaliran i dostupan u vašem `PATH`. azd upravlja Terraform *radnim tokom*, ali ne instalira Terraform za vas. Za stanje, azd po defaultu koristi lokalno stanje; za timove, konfigurirajte udaljeni backend (na primjer, Azure Storage backend) u `provider.tf`.

Za potpune, funkcionalne Terraform početne primjere, pregledajte [Awesome AZD galeriju](https://azure.github.io/awesome-azd/) i filtrirajte za Terraform, ili pogledajte službenu [azd Terraform dokumentaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Korištenje Pulumi-ja s azd

Ako vaš tim piše infrastrukturu u općem programskom jeziku (TypeScript, Python, Go, ili C#) umjesto DSL-a, azd također podržava **Pulumi**. Kao i s Terraformom, radni tok `azd up` / `azd provision` / `azd down` ostaje isti—mijenjaju se samo alati za infrastrukturu i struktura foldera.

### Naredite azd-u da koristi Pulumi

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

### Pulumi struktura foldera

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimalni `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Oznacite svaki resurs kako bi azd mogao pratiti i očistiti ih
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd učitava ove izlaze nazad u vaše okruženje
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stogovi (Stacks) mapiraju se na azd okoliše

Pulumi organizira implementacije u **stogove (stacks)**, a azd preslikava svaki azd okoliš na Pulumi stack istog imena. Kada pokrenete `azd env new staging`, azd odabire (ili stvara) `staging` Pulumi stack. Isti `azd-env-name` tagging i `AZURE_*` izlazna pravila vrijede, tako da `azd down` može pronaći i ukloniti sve.

### Implementacija s Pulumi-jem

```bash
azd auth login
azd env new dev
azd provision --preview   # azd pokreće 'pulumi preview' u pozadini
azd up                    # postavljanje + implementacija
azd down --force          # pokreće 'pulumi destroy'
```

> **Preduvjet:** Pulumi mora biti instaliran i dostupan u vašem `PATH`, te trebate backend za pohranu stanja (Pulumi Cloud ili samostalno upravljani backend poput Azure Blob Storage). azd upravlja Pulumi *radnim tokom*, ne instalacijom. Pogledajte službenu [azd Pulumi dokumentaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Odabir hosta za vašu uslugu

Polje `host` u `azure.yaml` odlučuje gdje vaš kod radi. azd podržava nekoliko hostova—odabir pravog ima veći značaj od jezika infrastrukture. Evo usporedbe za početnike:

| `host` vrijednost | Najbolje za | Zašto |
|-------------------|-------------|-------|
| `appservice`      | Tradicionalne web aplikacije i API-jevi | Najjednostavniji PaaS; nisu potrebni kontejneri |
| `staticwebapp`    | Front-end SPA (React, Vue, Angular) | Globalni CDN + besplatan SSL, ugrađena podrška za API |
| `function`        | Događajno upravljani i serverless radni opterećenja | Skaliranje na nulu, plaćanje po izvršavanju |
| `containerapp`    | Mikroservisi u kontejnerima | Serverless kontejneri, skaliranje na nulu, ugrađeni ulaz |
| `aks`             | Komplicirane potrebe orkestracije | Potpuna Kubernetes kontrola kad vam stvarno treba |
| `springapp`       | Java Spring Boot aplikacije | Upravljano Azure Spring Apps runtime podešeno za Spring |

### Kada koristiti AKS

**Azure Kubernetes Service (`host: aks`)** daje punu moć Kubernetes-a—prilagođene kontrolere, mrežne mreže usluga, složeno umrežavanje i precizno raspoređivanje. Ta moć dolazi s operativnim složenostima: vi upravljate pools čvorova, nadogradnjama i mrežom klastera.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Počnite jednostavnije ako možete.** Za većinu mikroservisa, **Container Apps** daje kontejner, automatsko skaliranje i skaliranje na nulu bez upravljanja klasterom. Odaberite AKS samo kad trebate specifične Kubernetes značajke.

### Kada koristiti Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je upravljani runtime posebno izrađen za Spring Boot. On se brine za otkrivanje usluga, konfiguracijski server i blue-green implementaciju, tako da Java timovi ne moraju upravljati vlastitom infrastrukturom.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Koristite `springapp` kad imate postojeće Spring Boot aplikacije i želite runtime podešen za njih. Za nove Java aplikacije u kontejnerima bez specifičnih potreba za Spring, `containerapp` je često jednostavniji izbor.

## 🗃️ Provisioniranje baza podataka

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

## 🔒 Sigurnost i upravljanje tajnama

### Integracija Key Vault-a
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

### Konfiguracija Managed Identity
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

## 🌍 Umrežavanje i povezivost

### Konfiguracija Virtualne mreže
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

### Application Gateway sa SSL-om
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

## 📊 Nadgledanje i uvidi

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

### Prilagođene metrike i upozorenja
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

## 🔧 Konfiguracije specifične za okoliš

### Datoteke parametara za različite okoliše
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

### Uvjetno provisioning resursa
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

## 🚀 Napredni obrasci provisioning-a

### Implementacija u više regija
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

### Testiranje infrastrukture
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

## 🧪 Pregled i validacija infrastrukture (NOVO)

### Pregled izmjena infrastrukture prije implementacije

Značajka `azd provision --preview` omogućuje vam da **simulirate provisioning infrastrukture** prije nego što zapravo implementirate resurse. Slično je `terraform plan` ili `bicep what-if`, dajući vam **pregled bez izvršenja** promjena koje bi se napravile u vašem Azure okolišu.

#### 🛠️ Što radi
- **Analizira vaše IaC predloške** (Bicep ili Terraform)
- **Prikazuje pregled promjena resursa**: dodavanja, brisanja, ažuriranja
- **Ne primjenjuje promjene** — samo čitanje, sigurno za pokretanje

#### Primjeri upotrebe
```bash
# Pregledajte promjene infrastrukture prije implementacije
azd provision --preview

# Pregled za određeno okruženje
azd provision --preview -e production
```

Ova naredba vam pomaže:
- **Validirati promjene infrastrukture** prije obvezujuće implementacije
- **Rano uhvatiti pogrešne konfiguracije** u razvojnom ciklusu
- **Sigurno surađivati** u timskom okruženju
- **Osigurati minimalna dopuštenja za implementacije** bez iznenađenja

Posebno je korisno kada:
- Radite sa složenim višeservisnim okruženjima
- Mijenjate produkcijsku infrastrukturu
- Validirate izmjene predložaka prije PR odobrenja
- Obučavate nove članove tima o obrascima infrastrukture

### Primjer izlaza pregleda
Točan izlaz pregleda ovisi o pružatelju i strukturi projekta, ali rezultat bi trebao jasno označiti predložene izmjene prije bilo kakve primjene.

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

## �🔄 Ažuriranja i migracije resursa

### Sigurna ažuriranja resursa
```bash
# Pregledajte promjene infrastrukture prvo (PREPORUČENO)
azd provision --preview

# Primijenite promjene nakon potvrde pregleda
azd provision --confirm-with-no-prompt

# Za povratak koristite Git za poništavanje promjena infrastrukture:
git revert HEAD  # Poništi zadnji commit infrastrukture
azd provision    # Primijeni prethodno stanje infrastrukture
```

### Migracije baza podataka
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

## 🎯 Najbolje prakse

### 1. Konvencije imenovanja resursa
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Strategija označavanja (tagging)
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

### 3. Validacija parametara
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

### 4. Organizacija izlaza
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

## Sljedeći koraci

- [Planiranje prije implementacije](../chapter-06-pre-deployment/capacity-planning.md) - Validirajte dostupnost resursa
- [Uobičajeni problemi](../chapter-07-troubleshooting/common-issues.md) - Otklanjanje problema s infrastrukturom
- [Vodič za otklanjanje pogrešaka](../chapter-07-troubleshooting/debugging.md) - Otklanjanje problema provisoniranja
- [Odabir SKU](../chapter-06-pre-deployment/sku-selection.md) - Odaberite prikladne razine usluga

## Dodatni resursi

- [Dokumentacija Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager predlošci](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigacija**
- **Prethodna lekcija**: [Vodič za implementaciju](deployment-guide.md)
- **Sljedeća lekcija**: [Planiranje kapaciteta](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->